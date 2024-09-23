uint64_t PhoneCallSuggestionOutcomeExtractor.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return v0;
}

uint64_t PhoneCallSuggestionOutcomeExtractor.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_213EB7E10@<X0>(__int128 *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  type metadata accessor for PhoneCallSuggestionOutcomeExtractor();
  v4 = swift_allocObject();
  result = sub_213DB0BF0(a1, v4 + 16);
  *a2 = v4;
  return result;
}

uint64_t sub_213EB7E5C(uint64_t a1, uint64_t a2)
{
  return sub_213EB60D0(a1, a2);
}

uint64_t sub_213EB7E7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  int isUniquelyReferenced_nonNull_native;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
    return MEMORY[0x24BEE4AF8];
  v5 = *(_QWORD *)(type metadata accessor for FeaturisedTurn(0) - 8);
  v6 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  v7 = *(_QWORD *)(v5 + 72);
  swift_bridgeObjectRetain();
  v8 = MEMORY[0x24BEE4AF8];
  while (1)
  {
    v9 = sub_213EB6A44(v6, a3);
    v10 = *(_QWORD *)(v9 + 16);
    v11 = *(_QWORD *)(v8 + 16);
    v12 = v11 + v10;
    if (__OFADD__(v11, v10))
      break;
    v13 = v9;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (isUniquelyReferenced_nonNull_native && v12 <= *(_QWORD *)(v8 + 24) >> 1)
    {
      if (*(_QWORD *)(v13 + 16))
        goto LABEL_14;
    }
    else
    {
      if (v11 <= v12)
        v15 = v11 + v10;
      else
        v15 = v11;
      v8 = sub_213DB7028(isUniquelyReferenced_nonNull_native, v15, 1, v8);
      if (*(_QWORD *)(v13 + 16))
      {
LABEL_14:
        v16 = *(_QWORD *)(v8 + 16);
        v17 = (*(_QWORD *)(v8 + 24) >> 1) - v16;
        v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F06920);
        if (v17 < v10)
          goto LABEL_28;
        v19 = *(_QWORD *)(v18 - 8);
        v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
        v21 = *(_QWORD *)(v19 + 72);
        v22 = v8 + v20 + v21 * v16;
        v23 = v13 + v20;
        v24 = v21 * v10;
        v25 = v22 + v24;
        v26 = v23 + v24;
        if (v23 < v25 && v22 < v26)
          goto LABEL_30;
        swift_arrayInitWithCopy();
        if (v10)
        {
          v28 = *(_QWORD *)(v8 + 16);
          v29 = __OFADD__(v28, v10);
          v30 = v28 + v10;
          if (v29)
            goto LABEL_29;
          *(_QWORD *)(v8 + 16) = v30;
        }
        goto LABEL_4;
      }
    }
    if (v10)
      goto LABEL_27;
LABEL_4:
    swift_bridgeObjectRelease();
    v6 += v7;
    if (!--v3)
    {
      swift_bridgeObjectRelease();
      return v8;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  swift_bridgeObjectRelease();
  swift_release();
  result = sub_213EF30A8();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for PhoneCallSuggestionOutcomeExtractor()
{
  return objc_opt_self();
}

uint64_t method lookup function for PhoneCallSuggestionOutcomeExtractor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhoneCallSuggestionOutcomeExtractor.__allocating_init(picsStore:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of PhoneCallSuggestionOutcomeExtractor.extractSessionSuggestionOutcomes(session:classifications:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t sub_213EB80C4(uint64_t a1)
{
  uint64_t v1;

  return sub_213EB7948(a1, *(_QWORD **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void *sub_213EB80D0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_213EB80E4(a1, a2);
}

void *sub_213EB80E4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  void *result;

  result = sub_213EB5458(a1, **(_QWORD **)(v2 + 16), *(_QWORD **)(v2 + 24));
  if (!v3)
    *a2 = result;
  return result;
}

ValueMetadata *type metadata accessor for NoReferenceDecayModifier()
{
  return &type metadata for NoReferenceDecayModifier;
}

unint64_t sub_213EB8124()
{
  return sub_213DCAB94(MEMORY[0x24BEE4AF8]);
}

unint64_t sub_213EB8130()
{
  uint64_t v0;
  uint64_t v1;
  unsigned __int8 v2;
  unint64_t v3;
  int *v4;
  __int128 *v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  __int16 v9;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  __int16 v14;
  __int128 v15;
  __int128 v16;
  __int16 v17;
  char v18;
  _OWORD v20[3];
  __int16 v21;
  _QWORD v22[2];
  __int128 v23;
  __int128 v24;
  __int16 v25;
  _OWORD v26[3];
  __int16 v27;
  _OWORD v28[3];
  __int16 v29;

  v1 = v0;
  v2 = sub_213EB82AC();
  v3 = sub_213DCAD00(MEMORY[0x24BEE4AF8]);
  v4 = (int *)type metadata accessor for MediaGroundTruth();
  v5 = (__int128 *)(v1 + v4[8]);
  v6 = v5[2];
  v29 = *((_WORD *)v5 + 24);
  v7 = *v5;
  v28[1] = v5[1];
  v28[2] = v6;
  v28[0] = v7;
  v8 = v4[5];
  v9 = *(unsigned __int8 *)(v1 + v8);
  sub_213DDF850((uint64_t)v28);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)&v26[0] = v3;
  sub_213E24284(v2 | (unsigned __int16)(v9 << 8), (uint64_t)v28, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  sub_213DDF8A4((uint64_t)v28);
  v11 = *(_QWORD *)(v1 + v4[7]);
  if (*(_QWORD *)(v11 + 16))
  {
    v12 = *(_OWORD *)(v11 + 48);
    v26[0] = *(_OWORD *)(v11 + 32);
    v26[1] = v12;
    v26[2] = *(_OWORD *)(v11 + 64);
    v27 = *(_WORD *)(v11 + 80);
    v13 = *((_QWORD *)v5 + 1);
    v14 = *((_WORD *)v5 + 24);
    v22[0] = *(_QWORD *)v5;
    v22[1] = v13;
    v15 = v5[2];
    v23 = v5[1];
    v24 = v15;
    v25 = v14;
    v16 = *(_OWORD *)(v11 + 48);
    v20[0] = *(_OWORD *)(v11 + 32);
    v20[1] = v16;
    v20[2] = *(_OWORD *)(v11 + 64);
    v21 = *(_WORD *)(v11 + 80);
    sub_213DDF850((uint64_t)v26);
    if (!_s28SiriPrivateLearningInference14MediaReferenceV2eeoiySbAC_ACtFZ_0((uint64_t)v22, (uint64_t)v20))
    {
      v17 = *(unsigned __int8 *)(v1 + v8);
      v18 = swift_isUniquelyReferenced_nonNull_native();
      v22[0] = v3;
      sub_213E24284((v17 << 8) | 5, (uint64_t)v26, v18);
      v3 = v22[0];
      swift_bridgeObjectRelease();
    }
    sub_213DDF8A4((uint64_t)v26);
  }
  return v3;
}

uint64_t sub_213EB82AC()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  BOOL v3;
  _QWORD *v4;
  _QWORD *v5;
  BOOL v6;

  v1 = sub_213E1BAE0((uint64_t)&unk_24D0FFA58);
  v2 = (int *)type metadata accessor for MediaGroundTruth();
  v3 = sub_213EDF4CC(*(_BYTE *)(v0 + v2[5]), v1);
  swift_bridgeObjectRelease();
  if (v3)
    return 4;
  v4 = *(_QWORD **)(v0 + v2[7]);
  if (v4[2]
    && ((v5 = (_QWORD *)(v0 + v2[8]), *v5 == v4[4]) ? (v6 = v5[1] == v4[5]) : (v6 = 0), v6 || (sub_213EF3234() & 1) != 0))
  {
    return 4;
  }
  else
  {
    return 3;
  }
}

unint64_t sub_213EB834C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  BOOL v6;
  uint64_t inited;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int16 v13;

  v1 = type metadata accessor for MediaGroundTruth();
  v2 = (uint64_t *)(v0 + *(int *)(v1 + 32));
  v4 = *v2;
  v3 = v2[1];
  v5 = *(_QWORD **)(v0 + *(int *)(v1 + 28));
  if (v5[2])
  {
    v6 = v4 == v5[4] && v3 == v5[5];
    if (v6 || (sub_213EF3234() & 1) != 0)
      return sub_213DCAB94(MEMORY[0x24BEE4AF8]);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D40320);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_213EF53E0;
  v9 = v2[2];
  v10 = v2[3];
  v11 = v2[4];
  v12 = v2[5];
  v13 = *((_WORD *)v2 + 24);
  *(_QWORD *)(inited + 32) = v4;
  *(_QWORD *)(inited + 40) = v3;
  *(_QWORD *)(inited + 48) = v9;
  *(_QWORD *)(inited + 56) = v10;
  *(_QWORD *)(inited + 64) = v11;
  *(_QWORD *)(inited + 72) = v12;
  *(_WORD *)(inited + 80) = v13;
  swift_bridgeObjectRetain();
  sub_213DB8518(v9, v10);
  *(_QWORD *)(inited + 88) = sub_213E1B62C((uint64_t)&unk_24D0FFA80);
  return sub_213DCAB94(inited);
}

uint64_t sub_213EB8460()
{
  return sub_213E1B62C((uint64_t)&unk_24D0FFA08);
}

uint64_t sub_213EB8470(uint64_t a1)
{
  uint64_t result;

  result = sub_213DB0DB4(qword_254D402E8, (uint64_t (*)(uint64_t))type metadata accessor for MediaGroundTruth, (uint64_t)&unk_213F01A68);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t ContactSuggestionOutcomeReportedOfflineEmitter.__allocating_init(logTarget:)(__int128 *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 24) = MEMORY[0x24BEE4B00];
  type metadata accessor for SELFEventLogEmitters();
  v3 = swift_allocObject();
  sub_213DB0BF0(a1, v3 + 16);
  *(_QWORD *)(v2 + 16) = v3;
  return v2;
}

uint64_t ContactSuggestionOutcomeReportedOfflineEmitter.init(logTarget:)(__int128 *a1)
{
  uint64_t v1;
  uint64_t v3;

  *(_QWORD *)(v1 + 24) = MEMORY[0x24BEE4B00];
  type metadata accessor for SELFEventLogEmitters();
  v3 = swift_allocObject();
  sub_213DB0BF0(a1, v3 + 16);
  *(_QWORD *)(v1 + 16) = v3;
  return v1;
}

uint64_t sub_213EB857C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  char isUniquelyReferenced_nonNull_native;
  _QWORD v18[5];

  v4 = v3;
  v7 = a3[3];
  v8 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v7);
  v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(a1, a2, v7, v8);
  if (qword_253F04A88 != -1)
    swift_once();
  v10 = sub_213EF2724();
  __swift_project_value_buffer(v10, (uint64_t)qword_253F08A00);
  swift_bridgeObjectRetain();
  v11 = sub_213EF270C();
  v12 = sub_213EF2C94();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v13 = 134217984;
    v18[1] = *(_QWORD *)(v9 + 16);
    sub_213EF2D9C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_213DAB000, v11, v12, "[ContactSuggestionOutcomeReportedOfflineEmitter] Identified %ld outcomes from PLUS contact suggestions made at runtime.", v13, 0xCu);
    MEMORY[0x2199C53C4](v13, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease();
  }
  v14 = sub_213EBA388(v9);
  swift_bridgeObjectRelease();
  v15 = sub_213EB9A40(v14);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v18[0] = *(_QWORD *)(v4 + 24);
  *(_QWORD *)(v4 + 24) = 0x8000000000000000;
  sub_213EB96F0(v15, (uint64_t)sub_213EB967C, 0, isUniquelyReferenced_nonNull_native, (uint64_t)v18);
  *(_QWORD *)(v4 + 24) = v18[0];
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

void sub_213EB8770()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  __int128 v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t j;
  _DWORD *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  _DWORD *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  void *v59;
  unsigned int v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  _QWORD *v66;
  unint64_t v67;
  void **p_weak_ivar_lyt;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  unint64_t v81;
  uint64_t v82;
  NSObject *v83;
  os_log_type_t v84;
  uint8_t *v85;
  uint64_t v86;
  int64_t v87;
  unint64_t *v88;
  uint64_t v89;
  int64_t v90;
  uint64_t v91;
  __int128 v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _DWORD *i;
  uint64_t v98;
  char *v99;
  int64_t v100;
  unint64_t v101;
  void (*v102)(uint64_t, unint64_t);
  unint64_t v103;
  uint64_t v104;
  _QWORD *v105;
  unint64_t v106;
  char *v107;
  uint64_t v108;
  unint64_t v109;

  v1 = sub_213EF1D64();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v99 = (char *)&v86 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v107 = (char *)&v86 - v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F04820);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (_DWORD *)((char *)&v86 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v7);
  v11 = (uint64_t)&v86 - v10;
  swift_beginAccess();
  v94 = v0;
  if (!*(_QWORD *)(*(_QWORD *)(v0 + 24) + 16))
  {
    if (qword_253F04A88 != -1)
      swift_once();
    v82 = sub_213EF2724();
    __swift_project_value_buffer(v82, (uint64_t)qword_253F08A00);
    v83 = sub_213EF270C();
    v84 = sub_213EF2C94();
    if (os_log_type_enabled(v83, v84))
    {
      v85 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v85 = 0;
      _os_log_impl(&dword_213DAB000, v83, v84, "[ContactSuggestionOutcomeReportedOfflineEmitter] No ContactSuggestionOutcomeReported messages to emit to SELF", v85, 2u);
      MEMORY[0x2199C53C4](v85, -1, -1);
    }

    return;
  }
  v88 = (unint64_t *)(v0 + 24);
  if (qword_253F04A88 != -1)
LABEL_118:
    swift_once();
  v12 = sub_213EF2724();
  v98 = __swift_project_value_buffer(v12, (uint64_t)qword_253F08A00);
  v13 = sub_213EF270C();
  v14 = sub_213EF2C94();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_213DAB000, v13, v14, "[ContactSuggestionOutcomeReportedOfflineEmitter] Emitting ContactSuggestionOutcomeReported messages to SELF", v15, 2u);
    MEMORY[0x2199C53C4](v15, -1, -1);
  }

  v16 = *(_QWORD *)(v94 + 24);
  v17 = *(_QWORD *)(v16 + 64);
  v89 = v16 + 64;
  v18 = 1 << *(_BYTE *)(v16 + 32);
  v19 = -1;
  if (v18 < 64)
    v19 = ~(-1 << v18);
  v20 = v19 & v17;
  v90 = (unint64_t)(v18 + 63) >> 6;
  v87 = v90 - 1;
  v95 = v16;
  swift_bridgeObjectRetain();
  v100 = 0;
  *(_QWORD *)&v21 = 136315394;
  v92 = v21;
  v91 = MEMORY[0x24BEE4AD8] + 8;
  v101 = v1;
  v104 = v2;
  v96 = v11;
  for (i = v9; ; v9 = i)
  {
    if (v20)
    {
      v22 = __clz(__rbit64(v20));
      v23 = (v20 - 1) & v20;
      v24 = v22 | (v100 << 6);
LABEL_11:
      v25 = v95;
      (*(void (**)(_DWORD *, unint64_t, unint64_t))(v2 + 16))(v9, *(_QWORD *)(v95 + 48) + *(_QWORD *)(v2 + 72) * v24, v1);
      v26 = *(_QWORD *)(v25 + 56);
      v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F06918);
      *(_QWORD *)((char *)v9 + *(int *)(v27 + 48)) = *(_QWORD *)(v26 + 8 * v24);
      (*(void (**)(_DWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v9, 0, 1, v27);
      swift_bridgeObjectRetain();
      goto LABEL_30;
    }
    v28 = v100 + 1;
    if (__OFADD__(v100, 1))
      goto LABEL_113;
    if (v28 < v90)
    {
      v29 = *(_QWORD *)(v89 + 8 * v28);
      if (v29)
        goto LABEL_15;
      v30 = v100 + 2;
      ++v100;
      if (v28 + 1 < v90)
      {
        v29 = *(_QWORD *)(v89 + 8 * v30);
        if (v29)
          goto LABEL_18;
        v100 = v28 + 1;
        if (v28 + 2 < v90)
        {
          v29 = *(_QWORD *)(v89 + 8 * (v28 + 2));
          if (v29)
          {
            v28 += 2;
            goto LABEL_15;
          }
          v30 = v28 + 3;
          v100 = v28 + 2;
          if (v28 + 3 < v90)
            break;
        }
      }
    }
LABEL_29:
    v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F06918);
    (*(void (**)(_DWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v9, 1, 1, v31);
    v23 = 0;
LABEL_30:
    sub_213DC0630((uint64_t)v9, v11, &qword_253F04820);
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F06918);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 48))(v11, 1, v32) == 1)
    {
      swift_release();
      v81 = sub_213DCBD14(MEMORY[0x24BEE4AF8]);
      *v88 = v81;
      swift_bridgeObjectRelease();
      return;
    }
    v103 = v23;
    v33 = *(_QWORD *)(v11 + *(int *)(v32 + 48));
    (*(void (**)(char *, uint64_t, unint64_t))(v2 + 32))(v107, v11, v1);
    v109 = MEMORY[0x24BEE4AF8];
    v11 = v33 >> 62;
    if (v33 >> 62)
    {
      swift_bridgeObjectRetain();
      v2 = sub_213EF306C();
      if (v2)
      {
LABEL_33:
        if (v2 < 1)
        {
          __break(1u);
LABEL_112:
          __break(1u);
LABEL_113:
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
          goto LABEL_118;
        }
        for (j = 0; j != v2; ++j)
        {
          if ((v33 & 0xC000000000000001) != 0)
            v35 = (_DWORD *)MEMORY[0x2199C49B0](j, v33);
          else
            v35 = *(id *)(v33 + 8 * j + 32);
          v9 = v35;
          if (objc_msgSend(v35, sel_contactSuggestionOutcome))
          {
            sub_213EF2F58();
            sub_213EF2F88();
            sub_213EF2F94();
            sub_213EF2F64();
          }
          else
          {

          }
        }
        swift_bridgeObjectRelease();
        v36 = v109;
        v1 = v101;
        if ((v109 & 0x8000000000000000) != 0)
          goto LABEL_49;
        goto LABEL_46;
      }
    }
    else
    {
      v2 = *(_QWORD *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v2)
        goto LABEL_33;
    }
    swift_bridgeObjectRelease();
    v36 = MEMORY[0x24BEE4AF8];
    if ((MEMORY[0x24BEE4AF8] & 0x8000000000000000) != 0)
      goto LABEL_49;
LABEL_46:
    if ((v36 & 0x4000000000000000) == 0)
    {
      if (*(_QWORD *)(v36 + 16))
        goto LABEL_48;
      goto LABEL_50;
    }
LABEL_49:
    swift_retain();
    v37 = sub_213EF306C();
    swift_release();
    if (v37)
    {
LABEL_48:
      swift_bridgeObjectRelease();
      goto LABEL_73;
    }
LABEL_50:
    swift_release();
    if (v2 >= 1)
      v38 = 1;
    else
      v38 = v2;
    if (v11)
    {
      swift_bridgeObjectRetain();
      v40 = sub_213EF306C();
      swift_bridgeObjectRelease();
      if (v40 < 0)
        goto LABEL_114;
      swift_bridgeObjectRetain();
      v39 = sub_213EF306C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v39 = *(_QWORD *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    if (v39 < v38)
      goto LABEL_115;
    if ((v33 & 0xC000000000000001) != 0 && v38)
    {
      sub_213EBA754();
      v41 = 0;
      do
      {
        v42 = v41 + 1;
        sub_213EF2EF8();
        v41 = v42;
      }
      while (v38 != v42);
    }
    if (v11)
    {
      swift_bridgeObjectRetain();
      v43 = sub_213EF3078();
      v9 = v45;
      v2 = v46;
      v44 = v47;
      swift_bridgeObjectRelease_n();
      if ((v44 & 1) == 0)
        goto LABEL_66;
    }
    else
    {
      v2 = 0;
      v43 = v33 & 0xFFFFFFFFFFFFFF8;
      v9 = (_DWORD *)((v33 & 0xFFFFFFFFFFFFFF8) + 32);
      v44 = (2 * v38) | 1;
      if ((v44 & 1) == 0)
        goto LABEL_66;
    }
    v11 = sub_213EF3240();
    swift_unknownObjectRetain_n();
    v48 = swift_dynamicCastClass();
    if (!v48)
    {
      swift_unknownObjectRelease();
      v48 = MEMORY[0x24BEE4AF8];
    }
    v49 = *(_QWORD *)(v48 + 16);
    swift_release();
    if (__OFSUB__(v44 >> 1, v2))
      goto LABEL_117;
    if (v49 != (v44 >> 1) - v2)
    {
      swift_unknownObjectRelease();
LABEL_66:
      v36 = sub_213DF9F90(v43, (uint64_t)v9, v2, v44);
      swift_unknownObjectRelease();
      goto LABEL_73;
    }
    v36 = swift_dynamicCastClass();
    swift_unknownObjectRelease();
    if (!v36)
    {
      swift_unknownObjectRelease();
      v36 = MEMORY[0x24BEE4AF8];
    }
LABEL_73:
    v50 = v104;
    v2 = (uint64_t)v99;
    (*(void (**)(char *, char *, unint64_t))(v104 + 16))(v99, v107, v1);
    swift_bridgeObjectRetain_n();
    v51 = sub_213EF270C();
    v9 = (_DWORD *)sub_213EF2C94();
    v52 = v36 >> 62;
    v53 = v36;
    if (!os_log_type_enabled(v51, (os_log_type_t)v9))
    {
      v102 = *(void (**)(uint64_t, unint64_t))(v50 + 8);
      v102(v2, v1);

      swift_bridgeObjectRelease_n();
      goto LABEL_89;
    }
    LODWORD(v106) = (_DWORD)v9;
    v9 = (_DWORD *)swift_slowAlloc();
    v105 = (_QWORD *)swift_slowAlloc();
    v109 = (unint64_t)v105;
    *v9 = v92;
    sub_213E0B898();
    v54 = sub_213EF31F8();
    *(_QWORD *)(v9 + 1) = sub_213DB0570(v54, v55, (uint64_t *)&v109);
    swift_bridgeObjectRelease();
    v102 = *(void (**)(uint64_t, unint64_t))(v50 + 8);
    v102(v2, v1);
    *((_WORD *)v9 + 6) = 2080;
    if (v52)
    {
      swift_bridgeObjectRetain();
      v11 = sub_213EF306C();
      swift_bridgeObjectRelease();
      if (v11)
      {
LABEL_76:
        v108 = MEMORY[0x24BEE4AF8];
        sub_213DCD184(0, v11 & ~(v11 >> 63), 0);
        if (v11 < 0)
          goto LABEL_116;
        v93 = v36 >> 62;
        v56 = 0;
        v57 = v108;
        v1 = v36 & 0xC000000000000001;
        do
        {
          if (v1)
            v58 = (id)MEMORY[0x2199C49B0](v56, v36);
          else
            v58 = *(id *)(v36 + 8 * v56 + 32);
          v59 = v58;
          v60 = objc_msgSend(v58, sel_contactSuggestionOutcome);

          v108 = v57;
          v62 = *(_QWORD *)(v57 + 16);
          v61 = *(_QWORD *)(v57 + 24);
          if (v62 >= v61 >> 1)
          {
            sub_213DCD184(v61 > 1, v62 + 1, 1);
            v57 = v108;
          }
          ++v56;
          *(_QWORD *)(v57 + 16) = v62 + 1;
          *(_DWORD *)(v57 + 4 * v62 + 32) = v60;
        }
        while (v11 != v56);
        v52 = v93;
        goto LABEL_88;
      }
    }
    else
    {
      v11 = *(_QWORD *)((v36 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v11)
        goto LABEL_76;
    }
    v57 = MEMORY[0x24BEE4AF8];
LABEL_88:
    v63 = MEMORY[0x2199C44E8](v57, MEMORY[0x24BEE3F88]);
    v65 = v64;
    swift_bridgeObjectRelease();
    *(_QWORD *)((char *)v9 + 14) = sub_213DB0570(v63, v65, (uint64_t *)&v109);
    v53 = v36;
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_213DAB000, v51, (os_log_type_t)v106, "[ContactSuggestionOutcomeReportedOfflineEmitter] Outcomes to be reported for plusId %s: %s", (uint8_t *)v9, 0x16u);
    v66 = v105;
    swift_arrayDestroy();
    MEMORY[0x2199C53C4](v66, -1, -1);
    MEMORY[0x2199C53C4](v9, -1, -1);

LABEL_89:
    v67 = 0x24BE95000uLL;
    p_weak_ivar_lyt = &PlusMediaReferenceSourceAppCoreDataRecord__metaData.weak_ivar_lyt;
    v106 = v53;
    if (v52)
    {
      swift_bridgeObjectRetain();
      v53 = v106;
      v2 = sub_213EF306C();
      swift_bridgeObjectRelease();
      if (!v2)
        goto LABEL_8;
    }
    else
    {
      v2 = *(_QWORD *)((v53 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v2)
        goto LABEL_8;
    }
    if (v2 < 1)
      goto LABEL_112;
    v69 = 0;
    v70 = *(_QWORD *)(v94 + 16);
    v105 = (_QWORD *)(v70 + 16);
    v71 = v53 & 0xC000000000000001;
    do
    {
      if (v71)
        v73 = (id)MEMORY[0x2199C49B0](v69, v53);
      else
        v73 = *(id *)(v53 + 8 * v69 + 32);
      v74 = v73;
      v75 = objc_msgSend(objc_allocWithZone(*(Class *)(v67 + 1808)), (SEL)p_weak_ivar_lyt[115]);
      if (v75)
      {
        v72 = v75;
        v76 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95718]), (SEL)p_weak_ivar_lyt[115]);
        if (v76)
        {
          v77 = v76;
          v78 = objc_allocWithZone(MEMORY[0x24BE95C78]);
          v79 = (void *)sub_213EF1D1C();
          v80 = objc_msgSend(v78, sel_initWithNSUUID_, v79);

          objc_msgSend(v77, sel_setPlusId_, v80);
          objc_msgSend(v72, sel_setEventMetadata_, v77);

          objc_msgSend(v72, sel_setContactSuggestionOutcomeReported_, v74);
          __swift_project_boxed_opaque_existential_1(v105, *(_QWORD *)(v70 + 40));
          p_weak_ivar_lyt = (void **)(&PlusMediaReferenceSourceAppCoreDataRecord__metaData + 56);
          v67 = 0x24BE95000;
          sub_213EF23E8();
          v53 = v106;
        }

      }
      else
      {
        v72 = v74;
      }
      ++v69;

    }
    while (v2 != v69);
LABEL_8:
    swift_bridgeObjectRelease();
    v1 = v101;
    v102((uint64_t)v107, v101);
    v20 = v103;
    v2 = v104;
    v11 = v96;
  }
  v29 = *(_QWORD *)(v89 + 8 * v30);
  if (v29)
  {
LABEL_18:
    v28 = v30;
LABEL_15:
    v23 = (v29 - 1) & v29;
    v24 = __clz(__rbit64(v29)) + (v28 << 6);
    v100 = v28;
    goto LABEL_11;
  }
  while (1)
  {
    v28 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v28 >= v90)
    {
      v100 = v87;
      goto LABEL_29;
    }
    v29 = *(_QWORD *)(v89 + 8 * v28);
    ++v30;
    if (v29)
      goto LABEL_15;
  }
  __break(1u);
}

uint64_t ContactSuggestionOutcomeReportedOfflineEmitter.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  v1 = v0;
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(v0 + 24) + 16))
  {
    if (qword_253F04A88 != -1)
      swift_once();
    v2 = sub_213EF2724();
    __swift_project_value_buffer(v2, (uint64_t)qword_253F08A00);
    v3 = sub_213EF270C();
    v4 = sub_213EF2CA0();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_213DAB000, v3, v4, "[ContactSuggestionOutcomeReportedOfflineEmitter] Emitter is being destroyed while there are suggestion outcomes which have not been logged to SELF!", v5, 2u);
      MEMORY[0x2199C53C4](v5, -1, -1);
    }

  }
  swift_release();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t ContactSuggestionOutcomeReportedOfflineEmitter.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;

  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(v0 + 24) + 16))
  {
    if (qword_253F04A88 != -1)
      swift_once();
    v1 = sub_213EF2724();
    __swift_project_value_buffer(v1, (uint64_t)qword_253F08A00);
    v2 = sub_213EF270C();
    v3 = sub_213EF2CA0();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_213DAB000, v2, v3, "[ContactSuggestionOutcomeReportedOfflineEmitter] Emitter is being destroyed while there are suggestion outcomes which have not been logged to SELF!", v4, 2u);
      MEMORY[0x2199C53C4](v4, -1, -1);
    }

  }
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_213EB967C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F06918) + 48);
  v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F06948) + 48);
  v6 = *(_QWORD *)(a1 + v4);
  v7 = sub_213EF1D64();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a2, a1, v7);
  *(_QWORD *)(a2 + v5) = v6;
  return swift_bridgeObjectRetain();
}

uint64_t sub_213EB96F0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  char v30;
  unint64_t v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  char v35;
  unint64_t v36;
  char v37;
  _QWORD *v38;
  uint64_t v39;
  BOOL v40;
  uint64_t v41;
  _QWORD v42[2];
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

  v10 = sub_213EF1D64();
  v43 = *(_QWORD *)(v10 - 8);
  v44 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F06950);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = -1 << *(_BYTE *)(a1 + 32);
  v17 = ~v16;
  v18 = *(_QWORD *)(a1 + 64);
  v19 = -v16;
  v45 = a1;
  v46 = a1 + 64;
  if (v19 < 64)
    v20 = ~(-1 << v19);
  else
    v20 = -1;
  v47 = v17;
  v48 = 0;
  v49 = v20 & v18;
  v50 = a2;
  v51 = a3;
  v42[1] = a1;
  swift_bridgeObjectRetain();
  v42[0] = a3;
  swift_retain();
  sub_213EBA060(&qword_253F06918, &qword_253F04820, &qword_253F06948, (uint64_t)v15);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F06948);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 48))(v15, 1, v21) == 1)
  {
LABEL_5:
    swift_release();
    swift_bridgeObjectRelease();
    sub_213DB9C58();
    return swift_release();
  }
  v23 = *(void (**)(char *, char *, uint64_t))(v43 + 32);
  while (1)
  {
    v27 = *(int *)(v21 + 48);
    v23(v12, v15, v44);
    v28 = *(_QWORD *)&v15[v27];
    v29 = *(_QWORD **)a5;
    v31 = sub_213DFA284((uint64_t)v12);
    v32 = v29[2];
    v33 = (v30 & 1) == 0;
    v34 = v32 + v33;
    if (__OFADD__(v32, v33))
      break;
    v35 = v30;
    if (v29[3] >= v34)
    {
      if ((a4 & 1) != 0)
      {
        v38 = *(_QWORD **)a5;
        if ((v30 & 1) != 0)
          goto LABEL_7;
      }
      else
      {
        sub_213E021E4();
        v38 = *(_QWORD **)a5;
        if ((v35 & 1) != 0)
          goto LABEL_7;
      }
    }
    else
    {
      sub_213DFF090(v34, a4 & 1);
      v36 = sub_213DFA284((uint64_t)v12);
      if ((v35 & 1) != (v37 & 1))
        goto LABEL_22;
      v31 = v36;
      v38 = *(_QWORD **)a5;
      if ((v35 & 1) != 0)
      {
LABEL_7:
        v24 = 8 * v31;
        v52 = *(_QWORD *)(v38[7] + v24);
        swift_bridgeObjectRetain();
        sub_213DB4EDC(v28);
        v25 = v52;
        (*(void (**)(char *, uint64_t))(v43 + 8))(v12, v44);
        v26 = *(_QWORD *)(*(_QWORD *)a5 + 56);
        swift_bridgeObjectRelease();
        *(_QWORD *)(v26 + v24) = v25;
        goto LABEL_8;
      }
    }
    v38[(v31 >> 6) + 8] |= 1 << v31;
    v23((char *)(v38[6] + *(_QWORD *)(v43 + 72) * v31), v12, v44);
    *(_QWORD *)(v38[7] + 8 * v31) = v28;
    v39 = v38[2];
    v40 = __OFADD__(v39, 1);
    v41 = v39 + 1;
    if (v40)
      goto LABEL_21;
    v38[2] = v41;
LABEL_8:
    sub_213EBA060(&qword_253F06918, &qword_253F04820, &qword_253F06948, (uint64_t)v15);
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F06948);
    a4 = 1;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 48))(v15, 1, v21) == 1)
      goto LABEL_5;
  }
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  result = sub_213EF3288();
  __break(1u);
  return result;
}

uint64_t sub_213EB9A40(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t result;
  _QWORD *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t i;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  char *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  unint64_t v44;
  uint64_t v45;
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int64_t v51;
  uint64_t v52;
  _QWORD *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  int64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  void (*v64)(char *, unint64_t, uint64_t);
  void (*v65)(char *, char *, uint64_t);
  id v66;
  uint64_t v67;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F06920);
  v49 = *(_QWORD *)(v2 - 8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v48 - v6;
  v8 = sub_213EF1D64();
  v55 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v54 = (char *)&v48 - v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F06FF0);
  result = sub_213EF3084();
  v14 = (_QWORD *)result;
  v15 = 0;
  v56 = a1;
  v18 = *(_QWORD *)(a1 + 64);
  v17 = a1 + 64;
  v16 = v18;
  v19 = 1 << *(_BYTE *)(v17 - 32);
  v20 = -1;
  if (v19 < 64)
    v20 = ~(-1 << v19);
  v21 = v20 & v16;
  v50 = v17;
  v51 = (unint64_t)(v19 + 63) >> 6;
  v52 = result + 64;
  v53 = (_QWORD *)result;
  v58 = v11;
  if (!v21)
    goto LABEL_5;
LABEL_4:
  v59 = (v21 - 1) & v21;
  v60 = v15;
  for (i = __clz(__rbit64(v21)) | (v15 << 6); ; i = __clz(__rbit64(v24)) + (v25 << 6))
  {
    v28 = v55;
    v27 = v56;
    v29 = *(_QWORD *)(v56 + 48);
    v61 = *(_QWORD *)(v55 + 72) * i;
    v30 = v54;
    v64 = *(void (**)(char *, unint64_t, uint64_t))(v55 + 16);
    v64(v54, v29 + v61, v8);
    v31 = *(_QWORD *)(v27 + 56);
    v62 = i;
    v32 = *(_QWORD *)(v31 + 8 * i);
    v33 = *(void (**)(char *, char *, uint64_t))(v28 + 32);
    v34 = v58;
    v65 = v33;
    v33(v58, v30, v8);
    v35 = *(_QWORD *)(v32 + 16);
    if (v35)
    {
      v67 = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain();
      sub_213EF2F7C();
      v36 = *(unsigned __int8 *)(v49 + 80);
      v57 = v32;
      v37 = v32 + ((v36 + 32) & ~v36);
      v63 = *(_QWORD *)(v49 + 72);
      do
      {
        v38 = *(int *)(v2 + 48);
        v64(v7, v37, v8);
        v39 = *(void **)(v37 + v38);
        v40 = v2;
        v41 = *(int *)(v2 + 48);
        v65(v5, v7, v8);
        *(_QWORD *)&v5[v41] = v39;
        v66 = v39;
        sub_213DAFEC4((uint64_t)v5, &qword_253F06920);
        sub_213EF2F58();
        sub_213EF2F88();
        v2 = v40;
        sub_213EF2F94();
        sub_213EF2F64();
        v37 += v63;
        --v35;
      }
      while (v35);
      v42 = v67;
      swift_bridgeObjectRelease();
      v43 = v58;
    }
    else
    {
      v42 = MEMORY[0x24BEE4AF8];
      v43 = v34;
    }
    v44 = v62;
    v14 = v53;
    *(_QWORD *)(v52 + ((v62 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v62;
    result = ((uint64_t (*)(unint64_t, char *, uint64_t))v65)(v14[6] + v61, v43, v8);
    *(_QWORD *)(v14[7] + 8 * v44) = v42;
    v45 = v14[2];
    v46 = __OFADD__(v45, 1);
    v47 = v45 + 1;
    if (v46)
    {
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    v14[2] = v47;
    v21 = v59;
    v15 = v60;
    if (v59)
      goto LABEL_4;
LABEL_5:
    v23 = v15 + 1;
    if (__OFADD__(v15, 1))
      goto LABEL_29;
    if (v23 >= v51)
      return (uint64_t)v14;
    v24 = *(_QWORD *)(v50 + 8 * v23);
    v25 = v15 + 1;
    if (!v24)
    {
      v25 = v15 + 2;
      if (v15 + 2 >= v51)
        return (uint64_t)v14;
      v24 = *(_QWORD *)(v50 + 8 * v25);
      if (!v24)
      {
        v25 = v15 + 3;
        if (v15 + 3 >= v51)
          return (uint64_t)v14;
        v24 = *(_QWORD *)(v50 + 8 * v25);
        if (!v24)
          break;
      }
    }
LABEL_18:
    v59 = (v24 - 1) & v24;
    v60 = v25;
  }
  v26 = v15 + 4;
  if (v15 + 4 >= v51)
    return (uint64_t)v14;
  v24 = *(_QWORD *)(v50 + 8 * v26);
  if (v24)
  {
    v25 = v15 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    v25 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v25 >= v51)
      return (uint64_t)v14;
    v24 = *(_QWORD *)(v50 + 8 * v25);
    ++v26;
    if (v24)
      goto LABEL_18;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_213EB9E68@<X0>(_OWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(_QWORD *);
  __int128 v16;
  uint64_t result;
  int64_t v18;
  int64_t v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  int64_t v23;
  _QWORD v24[3];
  __int128 v25;
  uint64_t v26;

  v3 = *v1;
  v5 = v1[3];
  v4 = v1[4];
  v6 = v5;
  if (v4)
  {
    v7 = (v4 - 1) & v4;
    v8 = __clz(__rbit64(v4)) | (v5 << 6);
LABEL_3:
    v9 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v8);
    v10 = *v9;
    v11 = v9[1];
    v12 = *(_QWORD *)(v3 + 56) + 32 * v8;
    v13 = *(_QWORD *)v12;
    v14 = *(_QWORD *)(v12 + 24);
    v15 = (void (*)(_QWORD *))v1[5];
    v24[0] = v10;
    v24[1] = v11;
    v24[2] = v13;
    v16 = *(_OWORD *)(v12 + 8);
    v1[3] = v6;
    v1[4] = v7;
    v25 = v16;
    v26 = v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15(v24);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  v18 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
  }
  else
  {
    v19 = (unint64_t)(v1[2] + 64) >> 6;
    if (v18 < v19)
    {
      v20 = v1[1];
      v21 = *(_QWORD *)(v20 + 8 * v18);
      if (v21)
      {
LABEL_7:
        v7 = (v21 - 1) & v21;
        v8 = __clz(__rbit64(v21)) + (v18 << 6);
        v6 = v18;
        goto LABEL_3;
      }
      v22 = v5 + 2;
      v6 = v5 + 1;
      if (v5 + 2 < v19)
      {
        v21 = *(_QWORD *)(v20 + 8 * v22);
        if (v21)
        {
LABEL_10:
          v18 = v22;
          goto LABEL_7;
        }
        v6 = v5 + 2;
        if (v5 + 3 < v19)
        {
          v21 = *(_QWORD *)(v20 + 8 * (v5 + 3));
          if (v21)
          {
            v18 = v5 + 3;
            goto LABEL_7;
          }
          v22 = v5 + 4;
          v6 = v5 + 3;
          if (v5 + 4 < v19)
          {
            v21 = *(_QWORD *)(v20 + 8 * v22);
            if (v21)
              goto LABEL_10;
            v18 = v5 + 5;
            v6 = v5 + 4;
            if (v5 + 5 < v19)
            {
              v21 = *(_QWORD *)(v20 + 8 * v18);
              if (v21)
                goto LABEL_7;
              v6 = v19 - 1;
              v23 = v5 + 6;
              while (v19 != v23)
              {
                v21 = *(_QWORD *)(v20 + 8 * v23++);
                if (v21)
                {
                  v18 = v23 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    v1[3] = v6;
    v1[4] = 0;
    *a1 = 0u;
    a1[1] = 0u;
    a1[2] = 0u;
  }
  return result;
}

uint64_t sub_213EBA044@<X0>(uint64_t a1@<X8>)
{
  return sub_213EBA060(&qword_254D40208, &qword_253F04818, &qword_254D3AEE8, a1);
}

uint64_t sub_213EBA060@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  int64_t v31;
  unint64_t v32;
  int64_t v33;
  int64_t v34;
  void (*v35)(uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;

  v48 = a3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(a1);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v49 = (uint64_t)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v42 - v16;
  v18 = *v4;
  v19 = v4[1];
  v21 = v4[2];
  v20 = v4[3];
  v22 = v20;
  v23 = v4[4];
  v43 = v11;
  v44 = a1;
  v47 = v21;
  if (v23)
  {
    v45 = a2;
    v46 = v19;
    v24 = a4;
    v25 = (v23 - 1) & v23;
    v26 = __clz(__rbit64(v23)) | (v20 << 6);
LABEL_3:
    v27 = *(_QWORD *)(v18 + 48);
    v28 = v18;
    v29 = sub_213EF1D64();
    (*(void (**)(char *, unint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v17, v27 + *(_QWORD *)(*(_QWORD *)(v29 - 8) + 72) * v26, v29);
    *(_QWORD *)&v17[*(int *)(v8 + 48)] = *(_QWORD *)(*(_QWORD *)(v28 + 56) + 8 * v26);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v17, 0, 1, v8);
    swift_bridgeObjectRetain();
    a4 = v24;
    a2 = v45;
    v19 = v46;
    goto LABEL_23;
  }
  v30 = v20 + 1;
  if (__OFADD__(v20, 1))
  {
    __break(1u);
    return result;
  }
  v31 = (unint64_t)(v21 + 64) >> 6;
  if (v30 < v31)
  {
    v32 = *(_QWORD *)(v19 + 8 * v30);
    if (v32)
    {
LABEL_7:
      v45 = a2;
      v46 = v19;
      v24 = a4;
      v25 = (v32 - 1) & v32;
      v26 = __clz(__rbit64(v32)) + (v30 << 6);
      v22 = v30;
      goto LABEL_3;
    }
    v33 = v20 + 2;
    v22 = v20 + 1;
    if (v20 + 2 < v31)
    {
      v32 = *(_QWORD *)(v19 + 8 * v33);
      if (v32)
      {
LABEL_10:
        v30 = v33;
        goto LABEL_7;
      }
      v22 = v20 + 2;
      if (v20 + 3 < v31)
      {
        v32 = *(_QWORD *)(v19 + 8 * (v20 + 3));
        if (v32)
        {
          v30 = v20 + 3;
          goto LABEL_7;
        }
        v33 = v20 + 4;
        v22 = v20 + 3;
        if (v20 + 4 < v31)
        {
          v32 = *(_QWORD *)(v19 + 8 * v33);
          if (v32)
            goto LABEL_10;
          v30 = v20 + 5;
          v22 = v20 + 4;
          if (v20 + 5 < v31)
          {
            v32 = *(_QWORD *)(v19 + 8 * v30);
            if (v32)
              goto LABEL_7;
            v22 = v31 - 1;
            v34 = v20 + 6;
            while (v31 != v34)
            {
              v32 = *(_QWORD *)(v19 + 8 * v34++);
              if (v32)
              {
                v30 = v34 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  v28 = v18;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v17, 1, 1, v8);
  v25 = 0;
LABEL_23:
  *v4 = v28;
  v4[1] = v19;
  v4[2] = v47;
  v4[3] = v22;
  v4[4] = v25;
  v35 = (void (*)(uint64_t))v4[5];
  v36 = v49;
  sub_213DC0630((uint64_t)v17, v49, a2);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v36, 1, v8) == 1)
  {
    v37 = __swift_instantiateConcreteTypeFromMangledName(v48);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(a4, 1, 1, v37);
  }
  else
  {
    v38 = v36;
    v40 = (uint64_t)v43;
    v39 = v44;
    sub_213DC0630(v38, (uint64_t)v43, v44);
    v35(v40);
    sub_213DAFEC4(v40, v39);
    v41 = __swift_instantiateConcreteTypeFromMangledName(v48);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(a4, 0, 1, v41);
  }
}

uint64_t sub_213EBA388(uint64_t a1)
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
  char *v12;
  _QWORD *v13;
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
  void (*v26)(char *, char *, uint64_t);
  char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  id v34;
  char v35;
  unint64_t v36;
  uint64_t v37;
  _BOOL8 v38;
  uint64_t v39;
  char v40;
  unint64_t v41;
  char v42;
  uint64_t v43;
  unint64_t v44;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  BOOL v50;
  uint64_t v51;
  uint64_t result;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  _QWORD *v68;

  v2 = sub_213EF1D64();
  v65 = *(_QWORD *)(v2 - 8);
  v66 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v67 = (char *)&v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F06920);
  v4 = MEMORY[0x24BDAC7A8](v62);
  v59 = (uint64_t)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v61 = (char *)&v53 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v60 = (char *)&v53 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v53 - v11;
  v13 = (_QWORD *)MEMORY[0x24BEE4B00];
  v68 = (_QWORD *)MEMORY[0x24BEE4B00];
  v14 = *(_QWORD *)(a1 + 16);
  if (!v14)
    return (uint64_t)v13;
  v15 = *(unsigned __int8 *)(v10 + 80);
  v16 = (v15 + 32) & ~v15;
  v17 = a1 + v16;
  v18 = *(_QWORD *)(v10 + 72);
  v58 = v16;
  v55 = v15 | 7;
  v56 = v18 + v16;
  v54 = xmmword_213EF53E0;
  v57 = v18;
  while (1)
  {
    v63 = v17;
    v64 = v14;
    sub_213EBA7DC(v17, (uint64_t)v12);
    v22 = v62;
    v23 = *(int *)(v62 + 48);
    v25 = v65;
    v24 = v66;
    v26 = *(void (**)(char *, char *, uint64_t))(v65 + 16);
    v27 = v60;
    v26(v60, v12, v66);
    v28 = (uint64_t)v12;
    v29 = *(void **)&v12[v23];
    v30 = *(int *)(v22 + 48);
    v31 = *(void (**)(char *, char *, uint64_t))(v25 + 32);
    v32 = (uint64_t)v61;
    v31(v61, v27, v24);
    *(_QWORD *)(v32 + v30) = v29;
    v33 = (uint64_t)v67;
    v26(v67, (char *)v32, v24);
    v34 = v29;
    sub_213DAFEC4(v32, &qword_253F06920);
    v36 = sub_213DFA284(v33);
    v37 = v13[2];
    v38 = (v35 & 1) == 0;
    v39 = v37 + v38;
    if (__OFADD__(v37, v38))
      break;
    v40 = v35;
    v12 = (char *)v28;
    if (v13[3] < v39)
    {
      sub_213DFF09C(v39, 1);
      v13 = v68;
      v41 = sub_213DFA284((uint64_t)v67);
      if ((v40 & 1) != (v42 & 1))
        goto LABEL_19;
      v36 = v41;
    }
    if ((v40 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t))(v65 + 8))(v67, v66);
      v13 = v68;
      v43 = v68[7];
      sub_213DC0630(v28, v59, &qword_253F06920);
      v44 = *(_QWORD *)(v43 + 8 * v36);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)(v43 + 8 * v36) = v44;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v44 = sub_213DB7028(0, *(_QWORD *)(v44 + 16) + 1, 1, v44);
        *(_QWORD *)(v43 + 8 * v36) = v44;
      }
      v47 = *(_QWORD *)(v44 + 16);
      v46 = *(_QWORD *)(v44 + 24);
      if (v47 >= v46 >> 1)
      {
        v44 = sub_213DB7028(v46 > 1, v47 + 1, 1, v44);
        *(_QWORD *)(v43 + 8 * v36) = v44;
      }
      v19 = v63;
      v20 = v64;
      *(_QWORD *)(v44 + 16) = v47 + 1;
      v21 = v57;
      sub_213DC0630(v59, v44 + v58 + v47 * v57, &qword_253F06920);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D3A710);
      v48 = swift_allocObject();
      *(_OWORD *)(v48 + 16) = v54;
      sub_213DC0630(v28, v48 + v58, &qword_253F06920);
      v13[(v36 >> 6) + 8] |= 1 << v36;
      v31((char *)(v13[6] + *(_QWORD *)(v65 + 72) * v36), v67, v66);
      *(_QWORD *)(v13[7] + 8 * v36) = v48;
      v49 = v13[2];
      v50 = __OFADD__(v49, 1);
      v51 = v49 + 1;
      if (v50)
        goto LABEL_18;
      v13[2] = v51;
      v19 = v63;
      v20 = v64;
      v21 = v57;
    }
    v17 = v19 + v21;
    v14 = v20 - 1;
    if (!v14)
      return (uint64_t)v13;
  }
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  result = sub_213EF3288();
  __break(1u);
  return result;
}

unint64_t sub_213EBA754()
{
  unint64_t result;

  result = qword_254D3A630;
  if (!qword_254D3A630)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254D3A630);
  }
  return result;
}

uint64_t type metadata accessor for ContactSuggestionOutcomeReportedOfflineEmitter()
{
  return objc_opt_self();
}

uint64_t method lookup function for ContactSuggestionOutcomeReportedOfflineEmitter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ContactSuggestionOutcomeReportedOfflineEmitter.__allocating_init(logTarget:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of ContactSuggestionOutcomeReportedOfflineEmitter.reviewSessionSuggestionOutcomes(session:classifications:outcomeExtractor:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of ContactSuggestionOutcomeReportedOfflineEmitter.flush()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t sub_213EBA7DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F06920);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_QWORD *sub_213EBA824(uint64_t a1)
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
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD v21[3];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int (*v25)(uint64_t, uint64_t, uint64_t);

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F04828);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  v21[2] = v1;
  v7 = type metadata accessor for PlusContactSuggestionRuntimeSummary(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  v10 = *(_QWORD *)(v8 + 72);
  v11 = sub_213EF1D64();
  v22 = *(_QWORD *)(v11 - 8);
  v25 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v22 + 48);
  v21[1] = a1;
  swift_bridgeObjectRetain();
  v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v23 = v10;
  v24 = v7;
  do
  {
    v14 = v9 + *(int *)(v7 + 20);
    if (v25(v14, 1, v11) != 1)
    {
      sub_213DBDD88(v14, (uint64_t)v5);
      v15 = sub_213EF1D10();
      v17 = v16;
      (*(void (**)(char *, uint64_t))(v22 + 8))(v5, v11);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v12 = sub_213DB553C(0, v12[2] + 1, 1, v12);
      v19 = v12[2];
      v18 = v12[3];
      if (v19 >= v18 >> 1)
        v12 = sub_213DB553C((_QWORD *)(v18 > 1), v19 + 1, 1, v12);
      v12[2] = v19 + 1;
      v13 = &v12[2 * v19];
      v13[4] = v15;
      v13[5] = v17;
      v10 = v23;
      v7 = v24;
    }
    v9 += v10;
    --v6;
  }
  while (v6);
  swift_bridgeObjectRelease();
  return v12;
}

void sub_213EBA9F4()
{
  qword_254D54F28 = (uint64_t)&unk_24D0FFC88;
}

uint64_t ContactPromptGroundTruthGenerator.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t ContactPromptGroundTruthGenerator.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_213EBAA20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  int v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  BOOL v35;
  char v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  BOOL v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t *v62;
  char v63[40];
  _QWORD v64[6];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F06C68);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for EntityPromptClassification();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v58 = (uint64_t)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v62 = (uint64_t *)((char *)&v53 - v13);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v59 = (char *)&v53 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v53 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v61 = (unint64_t)&v53 - v20;
  result = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v53 - v22;
  v60 = a2;
  v24 = *(_QWORD *)(a2 + 16);
  v25 = MEMORY[0x24BEE4AF8];
  v54 = v2;
  v55 = a1;
  if (v24)
  {
    v26 = v60 + 32;
    swift_bridgeObjectRetain();
    v27 = MEMORY[0x24BEE4AF8];
    do
    {
      sub_213DAFDFC(v26, (uint64_t)v64);
      sub_213DAFDFC((uint64_t)v64, (uint64_t)v63);
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F06990);
      v28 = swift_dynamicCast();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v7, v28 ^ 1u, 1, v8);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v64);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
      {
        sub_213DAFEC4((uint64_t)v7, &qword_253F06C68);
      }
      else
      {
        sub_213DBB430((uint64_t)v7, (uint64_t)v23, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
        sub_213DBB430((uint64_t)v23, v61, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v27 = sub_213DB5648(0, *(_QWORD *)(v27 + 16) + 1, 1, v27);
        v30 = *(_QWORD *)(v27 + 16);
        v29 = *(_QWORD *)(v27 + 24);
        if (v30 >= v29 >> 1)
          v27 = sub_213DB5648(v29 > 1, v30 + 1, 1, v27);
        *(_QWORD *)(v27 + 16) = v30 + 1;
        sub_213DBB430(v61, v27+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(_QWORD *)(v9 + 72) * v30, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
      }
      v26 += 40;
      --v24;
    }
    while (v24);
    result = swift_bridgeObjectRelease();
    v31 = (uint64_t)v59;
    v25 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v27 = MEMORY[0x24BEE4AF8];
    v31 = (uint64_t)v59;
  }
  v64[0] = v25;
  v57 = *(_QWORD *)(v27 + 16);
  if (!v57)
  {
LABEL_56:
    swift_bridgeObjectRelease();
    v49 = v64[0];
    v50 = v54;
    swift_retain();
    v51 = v55;
    swift_bridgeObjectRetain();
    v52 = sub_213EBB74C(v49, v50, v51);
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    return v52;
  }
  v32 = 0;
  while (1)
  {
    if (v32 >= *(_QWORD *)(v27 + 16))
    {
      __break(1u);
      goto LABEL_58;
    }
    v33 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    v34 = *(_QWORD *)(v9 + 72);
    sub_213DCA7E4(v27 + v33 + v34 * v32, (uint64_t)v18, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
    v35 = *((_QWORD *)v18 + 2) == 0x73746361746E6F63 && *((_QWORD *)v18 + 3) == 0xE800000000000000;
    v60 = v34;
    v61 = v33;
    if (v35)
    {
      sub_213DCA7E4((uint64_t)v18, v31, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
LABEL_28:
      sub_213DCA828(v31, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
      sub_213DCA7E4((uint64_t)v18, (uint64_t)v62, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
      goto LABEL_29;
    }
    v36 = sub_213EF3234();
    sub_213DCA7E4((uint64_t)v18, v31, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
    if ((v36 & 1) != 0
      || *(_QWORD *)(v31 + 16) == 0x6E65697069636572 && *(_QWORD *)(v31 + 24) == 0xE900000000000074)
    {
      goto LABEL_28;
    }
    v37 = sub_213EF3234();
    sub_213DCA828(v31, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
    sub_213DCA7E4((uint64_t)v18, (uint64_t)v62, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
    if ((v37 & 1) == 0)
      goto LABEL_15;
LABEL_29:
    if (qword_254D3A080 != -1)
      swift_once();
    v38 = qword_254D54F28;
    v39 = *(_QWORD *)(qword_254D54F28 + 16);
    if (v39)
    {
      v40 = *v62;
      v41 = v62[1];
      v42 = *(_QWORD *)(qword_254D54F28 + 32) == *v62 && *(_QWORD *)(qword_254D54F28 + 40) == v41;
      if (v42 || (sub_213EF3234() & 1) != 0)
      {
LABEL_37:
        sub_213DCA828((uint64_t)v62, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
        sub_213DBB430((uint64_t)v18, v58, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
        v43 = v64[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_213DCD000(0, *(_QWORD *)(v43 + 16) + 1, 1);
          v43 = v64[0];
        }
        v31 = (uint64_t)v59;
        v45 = *(_QWORD *)(v43 + 16);
        v44 = *(_QWORD *)(v43 + 24);
        if (v45 >= v44 >> 1)
        {
          sub_213DCD000(v44 > 1, v45 + 1, 1);
          v43 = v64[0];
        }
        *(_QWORD *)(v43 + 16) = v45 + 1;
        result = sub_213DBB430(v58, v43 + v61 + v45 * v60, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
        goto LABEL_16;
      }
      if (v39 != 1)
      {
        if (*(_QWORD *)(v38 + 48) == v40 && *(_QWORD *)(v38 + 56) == v41)
          goto LABEL_37;
        result = sub_213EF3234();
        if ((result & 1) != 0)
          goto LABEL_37;
        if (v39 != 2)
          break;
      }
    }
LABEL_15:
    sub_213DCA828((uint64_t)v62, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
    result = sub_213DCA828((uint64_t)v18, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
    v31 = (uint64_t)v59;
LABEL_16:
    if (++v32 == v57)
      goto LABEL_56;
  }
  v46 = (_QWORD *)(v38 + 72);
  v47 = 2;
  while (!__OFADD__(v47, 1))
  {
    if (*(v46 - 1) == v40 && *v46 == v41)
      goto LABEL_37;
    v56 = v47 + 1;
    result = sub_213EF3234();
    if ((result & 1) != 0)
      goto LABEL_37;
    v46 += 2;
    ++v47;
    if (v56 == v39)
      goto LABEL_15;
  }
LABEL_58:
  __break(1u);
  return result;
}

uint64_t sub_213EBB07C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  char v44;
  int *v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v6 = type metadata accessor for FeaturisedTurn(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v52 - v11;
  v13 = sub_213EF1D64();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v59 = (char *)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v52 - v17;
  v19 = *(int *)(type metadata accessor for EntityPromptClassification() + 44);
  v58 = a2;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v18, a2 + v19, v13);
  v20 = *(_QWORD *)(a1 + 16);
  if (!v20)
  {
LABEL_6:
    (*(void (**)(char *, uint64_t))(v14 + 8))(v18, v13);
    v23 = type metadata accessor for ContactPromptGroundTruth();
    v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56);
    v25 = a3;
    return v24(v25, 1, 1, v23);
  }
  v60 = a3;
  v61 = v13;
  v21 = a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  v22 = *(_QWORD *)(v7 + 72);
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_213DCA7E4(v21, (uint64_t)v10, type metadata accessor for FeaturisedTurn);
    if ((sub_213EF1D28() & 1) != 0)
      break;
    sub_213DCA828((uint64_t)v10, type metadata accessor for FeaturisedTurn);
    v21 += v22;
    if (!--v20)
    {
      swift_bridgeObjectRelease();
      a3 = v60;
      v13 = v61;
      goto LABEL_6;
    }
  }
  swift_bridgeObjectRelease();
  sub_213DBB430((uint64_t)v10, (uint64_t)v12, type metadata accessor for FeaturisedTurn);
  v26 = *(_QWORD *)&v12[*(int *)(v6 + 24)];
  swift_bridgeObjectRetain();
  sub_213DCA828((uint64_t)v12, type metadata accessor for FeaturisedTurn);
  v27 = sub_213DAF3C8(v26);
  result = swift_bridgeObjectRelease();
  v29 = v61;
  if (!v27)
  {
LABEL_25:
    (*(void (**)(char *, uint64_t))(v14 + 8))(v18, v29);
    v23 = type metadata accessor for ContactPromptGroundTruth();
    v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56);
    v25 = v60;
    return v24(v25, 1, 1, v23);
  }
  if (v27 >> 62)
  {
    swift_bridgeObjectRetain();
    v51 = sub_213EF306C();
    result = swift_bridgeObjectRelease();
    if (v51)
      goto LABEL_10;
    goto LABEL_24;
  }
  if (!*(_QWORD *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_24:
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
LABEL_10:
  if ((v27 & 0xC000000000000001) != 0)
  {
    v57 = MEMORY[0x2199C49B0](0, v27);
LABEL_13:
    v30 = v58;
    swift_bridgeObjectRelease();
    sub_213EF1D58();
    v31 = *(_QWORD *)v30;
    v55 = *(_QWORD *)(v30 + 8);
    v56 = v31;
    v32 = *(_QWORD *)(v30 + 32);
    v33 = *(_QWORD *)(v32 + 16);
    if (v33)
    {
      v62 = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_213DCD5E0(0, v33, 0);
      v34 = v62;
      v53 = v32;
      v54 = v33;
      v35 = (uint64_t *)(v32 + 40);
      do
      {
        v36 = *(v35 - 1);
        v37 = *v35;
        v62 = v34;
        v39 = *(_QWORD *)(v34 + 16);
        v38 = *(_QWORD *)(v34 + 24);
        swift_bridgeObjectRetain();
        if (v39 >= v38 >> 1)
        {
          sub_213DCD5E0(v38 > 1, v39 + 1, 1);
          v34 = v62;
        }
        v35 += 2;
        *(_QWORD *)(v34 + 16) = v39 + 1;
        v40 = (_QWORD *)(v34 + 32 * v39);
        v40[4] = v36;
        v40[5] = v37;
        v40[6] = 0;
        v40[7] = 0;
        --v33;
      }
      while (v33);
      swift_bridgeObjectRelease();
      v30 = v58;
      v33 = v54;
      v41 = *(_QWORD *)(v58 + 48);
      if (v41)
        goto LABEL_19;
    }
    else
    {
      swift_bridgeObjectRetain();
      v34 = MEMORY[0x24BEE4AF8];
      v41 = *(_QWORD *)(v30 + 48);
      if (v41)
      {
LABEL_19:
        v58 = *(_QWORD *)(v30 + 40);
LABEL_22:
        LODWORD(v53) = v33 == 1;
        swift_bridgeObjectRetain();
        sub_213EBB538(v30, (char *)&v62);
        LODWORD(v54) = v62;
        v42 = swift_bridgeObjectRetain();
        v43 = sub_213EBA824(v42);
        swift_bridgeObjectRelease();
        v44 = *(_BYTE *)(v30 + 80);
        v45 = (int *)type metadata accessor for ContactPromptGroundTruth();
        v46 = v60;
        v47 = (_QWORD *)(v60 + v45[12]);
        v48 = v61;
        (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(v60, v59, v61);
        v49 = v55;
        *v47 = v56;
        v47[1] = v49;
        *(_BYTE *)(v46 + v45[5]) = v53;
        *(_QWORD *)(v46 + v45[6]) = v57;
        *(_QWORD *)(v46 + v45[7]) = v34;
        v50 = (uint64_t *)(v46 + v45[8]);
        *v50 = v58;
        v50[1] = v41;
        v50[2] = 0;
        v50[3] = 0;
        *(_BYTE *)(v46 + v45[9]) = v54;
        *(_QWORD *)(v46 + v45[10]) = v43;
        *(_BYTE *)(v46 + v45[11]) = v44;
        (*(void (**)(char *, uint64_t))(v14 + 8))(v18, v48);
        return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, int *))(*((_QWORD *)v45 - 1) + 56))(v46, 0, 1, v45);
      }
    }
    v58 = 0;
    goto LABEL_22;
  }
  if (*(_QWORD *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    v57 = *(_QWORD *)(v27 + 32);
    swift_retain();
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

uint64_t sub_213EBB538@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t (*v12)(_QWORD);
  uint64_t result;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  uint64_t v22;

  v4 = sub_213EF21CC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for EntityPromptClassification();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(a1 + 48);
  sub_213DCA7E4(a1, (uint64_t)v10, v12);
  if (v11)
  {
    result = sub_213DCA828((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
  }
  else
  {
    v16 = *((_QWORD *)v10 + 7);
    v15 = *((_QWORD *)v10 + 8);
    (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEA4CB8], v4);
    swift_bridgeObjectRetain();
    v17 = sub_213EF21C0();
    v19 = v18;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (!v15)
    {
      sub_213DCA828((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
      result = swift_bridgeObjectRelease();
      v14 = 1;
      goto LABEL_4;
    }
    if (v16 == v17 && v15 == v19)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_213DCA828((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
      result = swift_bridgeObjectRelease_n();
    }
    else
    {
      v21 = sub_213EF3234();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_213DCA828((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
      result = swift_bridgeObjectRelease_n();
      if ((v21 & 1) == 0)
      {
        v14 = 1;
        goto LABEL_4;
      }
    }
  }
  v14 = 0;
LABEL_4:
  *a2 = v14;
  return result;
}

uint64_t ContactPromptGroundTruthGenerator.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ContactPromptGroundTruthGenerator.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_213EBB72C(uint64_t a1, uint64_t a2)
{
  return sub_213EBAA20(a1, a2);
}

unint64_t sub_213EBB74C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
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
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD v22[3];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F06B78);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = type metadata accessor for ContactPromptGroundTruth();
  v9 = *(_QWORD *)(v26 - 8);
  v10 = MEMORY[0x24BDAC7A8](v26);
  v25 = (uint64_t)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v24 = (uint64_t)v22 - v12;
  v13 = *(_QWORD *)(a1 + 16);
  if (!v13)
    return MEMORY[0x24BEE4AF8];
  v22[2] = v3;
  v14 = *(_QWORD *)(type metadata accessor for EntityPromptClassification() - 8);
  v15 = a1 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
  v16 = *(_QWORD *)(v14 + 72);
  v22[1] = a1;
  swift_bridgeObjectRetain();
  v17 = MEMORY[0x24BEE4AF8];
  v23 = a3;
  do
  {
    sub_213EBB07C(a3, v15, (uint64_t)v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, v26) == 1)
    {
      sub_213DAFEC4((uint64_t)v8, &qword_253F06B78);
    }
    else
    {
      v18 = v24;
      sub_213DBB430((uint64_t)v8, v24, (uint64_t (*)(_QWORD))type metadata accessor for ContactPromptGroundTruth);
      sub_213DBB430(v18, v25, (uint64_t (*)(_QWORD))type metadata accessor for ContactPromptGroundTruth);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v17 = sub_213DB72CC(0, *(_QWORD *)(v17 + 16) + 1, 1, v17);
      v20 = *(_QWORD *)(v17 + 16);
      v19 = *(_QWORD *)(v17 + 24);
      if (v20 >= v19 >> 1)
        v17 = sub_213DB72CC(v19 > 1, v20 + 1, 1, v17);
      *(_QWORD *)(v17 + 16) = v20 + 1;
      sub_213DBB430(v25, v17+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(_QWORD *)(v9 + 72) * v20, (uint64_t (*)(_QWORD))type metadata accessor for ContactPromptGroundTruth);
      a3 = v23;
    }
    v15 += v16;
    --v13;
  }
  while (v13);
  swift_bridgeObjectRelease();
  return v17;
}

unint64_t sub_213EBB9A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253F04CB0;
  if (!qword_253F04CB0)
  {
    v1 = type metadata accessor for ContactPromptGroundTruth();
    result = MEMORY[0x2199C52D4](&protocol conformance descriptor for ContactPromptGroundTruth, v1);
    atomic_store(result, (unint64_t *)&qword_253F04CB0);
  }
  return result;
}

uint64_t type metadata accessor for ContactPromptGroundTruthGenerator()
{
  return objc_opt_self();
}

uint64_t method lookup function for ContactPromptGroundTruthGenerator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ContactPromptGroundTruthGenerator.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of ContactPromptGroundTruthGenerator.generate(session:classifications:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t *sub_213EBBA28(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  void (*v17)(uint64_t *, _QWORD, uint64_t, int *);
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t v27;
  char *v28;
  char *v29;
  char *v31;
  char *v32;
  uint64_t v33;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = (int *)type metadata accessor for MediaPlayClassification();
    v8 = *((_QWORD *)v7 - 1);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, int *))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D3B568);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      *((_BYTE *)a1 + 8) = *((_BYTE *)a2 + 8);
      v11 = a2[3];
      a1[2] = a2[2];
      a1[3] = v11;
      v12 = a2[5];
      a1[4] = a2[4];
      a1[5] = v12;
      v13 = v7[8];
      v32 = (char *)a1 + v13;
      v14 = (char *)a2 + v13;
      v15 = sub_213EF1D64();
      v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v16(v32, v14, v15);
      *(uint64_t *)((char *)a1 + v7[9]) = *(uint64_t *)((char *)a2 + v7[9]);
      *(uint64_t *)((char *)a1 + v7[10]) = *(uint64_t *)((char *)a2 + v7[10]);
      v17 = *(void (**)(uint64_t *, _QWORD, uint64_t, int *))(v8 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v17(a1, 0, 1, v7);
    }
    v18 = *(int *)(a3 + 20);
    v19 = (char *)a1 + v18;
    v33 = a3;
    v20 = (char *)a2 + v18;
    *(_QWORD *)v19 = *(uint64_t *)((char *)a2 + v18);
    v19[8] = *((_BYTE *)a2 + v18 + 8);
    v21 = *(uint64_t *)((char *)a2 + v18 + 24);
    *((_QWORD *)v19 + 2) = *(uint64_t *)((char *)a2 + v18 + 16);
    *((_QWORD *)v19 + 3) = v21;
    v22 = *(uint64_t *)((char *)a2 + v18 + 40);
    *((_QWORD *)v19 + 4) = *(uint64_t *)((char *)a2 + v18 + 32);
    *((_QWORD *)v19 + 5) = v22;
    v23 = v7[8];
    v31 = &v19[v23];
    v24 = &v20[v23];
    v25 = sub_213EF1D64();
    v26 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v26(v31, v24, v25);
    *(_QWORD *)&v19[v7[9]] = *(_QWORD *)&v20[v7[9]];
    *(_QWORD *)&v19[v7[10]] = *(_QWORD *)&v20[v7[10]];
    v27 = *(int *)(v33 + 28);
    *(uint64_t *)((char *)a1 + *(int *)(v33 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(v33 + 24));
    v28 = (char *)a1 + v27;
    v29 = (char *)a2 + v27;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v26(v28, v29, v25);
  }
  return a1;
}

uint64_t sub_213EBBC50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v11)(uint64_t, uint64_t);

  v4 = type metadata accessor for MediaPlayClassification();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, 1, v4))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v5 = a1 + *(int *)(v4 + 32);
    v6 = sub_213EF1D64();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v7 = a1 + *(int *)(a2 + 20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = v7 + *(int *)(v4 + 32);
  v9 = sub_213EF1D64();
  v11 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8);
  v11(v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(uint64_t, uint64_t))v11)(a1 + *(int *)(a2 + 28), v9);
}

_QWORD *sub_213EBBD6C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  void (*v15)(_QWORD *, _QWORD, uint64_t, int *);
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  char *v26;
  char *v27;
  char *v29;
  char *v30;
  uint64_t v31;

  v6 = (int *)type metadata accessor for MediaPlayClassification();
  v7 = *((_QWORD *)v6 - 1);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D3B568);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    *((_BYTE *)a1 + 8) = *((_BYTE *)a2 + 8);
    v9 = a2[3];
    a1[2] = a2[2];
    a1[3] = v9;
    v10 = a2[5];
    a1[4] = a2[4];
    a1[5] = v10;
    v11 = v6[8];
    v30 = (char *)a1 + v11;
    v12 = (char *)a2 + v11;
    v13 = sub_213EF1D64();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v30, v12, v13);
    *(_QWORD *)((char *)a1 + v6[9]) = *(_QWORD *)((char *)a2 + v6[9]);
    *(_QWORD *)((char *)a1 + v6[10]) = *(_QWORD *)((char *)a2 + v6[10]);
    v15 = *(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v7 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15(a1, 0, 1, v6);
  }
  v16 = *(int *)(a3 + 20);
  v17 = (char *)a1 + v16;
  v31 = a3;
  v18 = (char *)a2 + v16;
  *(_QWORD *)v17 = *(_QWORD *)((char *)a2 + v16);
  v17[8] = *((_BYTE *)a2 + v16 + 8);
  v19 = *(_QWORD *)((char *)a2 + v16 + 24);
  *((_QWORD *)v17 + 2) = *(_QWORD *)((char *)a2 + v16 + 16);
  *((_QWORD *)v17 + 3) = v19;
  v20 = *(_QWORD *)((char *)a2 + v16 + 40);
  *((_QWORD *)v17 + 4) = *(_QWORD *)((char *)a2 + v16 + 32);
  *((_QWORD *)v17 + 5) = v20;
  v21 = v6[8];
  v29 = &v17[v21];
  v22 = &v18[v21];
  v23 = sub_213EF1D64();
  v24 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v24(v29, v22, v23);
  *(_QWORD *)&v17[v6[9]] = *(_QWORD *)&v18[v6[9]];
  *(_QWORD *)&v17[v6[10]] = *(_QWORD *)&v18[v6[10]];
  v25 = *(int *)(v31 + 28);
  *(_QWORD *)((char *)a1 + *(int *)(v31 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(v31 + 24));
  v26 = (char *)a1 + v25;
  v27 = (char *)a2 + v25;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v24(v26, v27, v23);
  return a1;
}

uint64_t sub_213EBBF68(uint64_t a1, uint64_t a2, int *a3)
{
  int *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, int *);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  void (*v15)(uint64_t, _QWORD, uint64_t, int *);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v6 = (int *)type metadata accessor for MediaPlayClassification();
  v7 = *((_QWORD *)v6 - 1);
  v8 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v26 = v6[8];
      v27 = a1 + v26;
      v28 = a2 + v26;
      v29 = sub_213EF1D64();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 24))(v27, v28, v29);
      *(_QWORD *)(a1 + v6[9]) = *(_QWORD *)(a2 + v6[9]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + v6[10]) = *(_QWORD *)(a2 + v6[10]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    sub_213DE4A04(a1);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D3B568);
    memcpy((void *)a1, (const void *)a2, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v11 = v6[8];
  v30 = a1 + v11;
  v12 = a2 + v11;
  v13 = sub_213EF1D64();
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v30, v12, v13);
  *(_QWORD *)(a1 + v6[9]) = *(_QWORD *)(a2 + v6[9]);
  *(_QWORD *)(a1 + v6[10]) = *(_QWORD *)(a2 + v6[10]);
  v15 = *(void (**)(uint64_t, _QWORD, uint64_t, int *))(v7 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v15(a1, 0, 1, v6);
LABEL_7:
  v17 = a3[5];
  v18 = a1 + v17;
  v19 = a2 + v17;
  *(_QWORD *)v18 = *(_QWORD *)(a2 + v17);
  *(_BYTE *)(v18 + 8) = *(_BYTE *)(a2 + v17 + 8);
  *(_QWORD *)(v18 + 16) = *(_QWORD *)(a2 + v17 + 16);
  *(_QWORD *)(v18 + 24) = *(_QWORD *)(a2 + v17 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v18 + 32) = *(_QWORD *)(v19 + 32);
  *(_QWORD *)(v18 + 40) = *(_QWORD *)(v19 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v20 = v6[8];
  v21 = v18 + v20;
  v22 = v19 + v20;
  v23 = sub_213EF1D64();
  v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 24);
  v24(v21, v22, v23);
  *(_QWORD *)(v18 + v6[9]) = *(_QWORD *)(v19 + v6[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v18 + v6[10]) = *(_QWORD *)(v19 + v6[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  v24(a1 + a3[7], a2 + a3[7], v23);
  return a1;
}

_QWORD *sub_213EBC274(_QWORD *a1, _QWORD *a2, int *a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  __int128 v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;

  v6 = (int *)type metadata accessor for MediaPlayClassification();
  v7 = *((_QWORD *)v6 - 1);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D3B568);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    *((_BYTE *)a1 + 8) = *((_BYTE *)a2 + 8);
    v9 = *((_OWORD *)a2 + 2);
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    *((_OWORD *)a1 + 2) = v9;
    v10 = v6[8];
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    v13 = sub_213EF1D64();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
    *(_QWORD *)((char *)a1 + v6[9]) = *(_QWORD *)((char *)a2 + v6[9]);
    *(_QWORD *)((char *)a1 + v6[10]) = *(_QWORD *)((char *)a2 + v6[10]);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
  }
  v14 = a3[5];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  *(_QWORD *)v15 = *(_QWORD *)((char *)a2 + v14);
  v15[8] = *((_BYTE *)a2 + v14 + 8);
  v17 = *(_OWORD *)((char *)a2 + v14 + 32);
  *((_OWORD *)v15 + 1) = *(_OWORD *)((char *)a2 + v14 + 16);
  *((_OWORD *)v15 + 2) = v17;
  v18 = v6[8];
  v19 = &v15[v18];
  v20 = &v16[v18];
  v21 = sub_213EF1D64();
  v22 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 32);
  v22(v19, v20, v21);
  *(_QWORD *)&v15[v6[9]] = *(_QWORD *)&v16[v6[9]];
  *(_QWORD *)&v15[v6[10]] = *(_QWORD *)&v16[v6[10]];
  v23 = a3[7];
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  v22((char *)a1 + v23, (char *)a2 + v23, v21);
  return a1;
}

uint64_t sub_213EBC404(uint64_t a1, uint64_t a2, int *a3)
{
  int *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, int *);
  int v9;
  int v10;
  __int128 v11;
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
  void (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v6 = (int *)type metadata accessor for MediaPlayClassification();
  v7 = *((_QWORD *)v6 - 1);
  v8 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
      v29 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 24) = v29;
      swift_bridgeObjectRelease();
      v30 = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      *(_QWORD *)(a1 + 40) = v30;
      swift_bridgeObjectRelease();
      v31 = v6[8];
      v32 = a1 + v31;
      v33 = a2 + v31;
      v34 = sub_213EF1D64();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 40))(v32, v33, v34);
      *(_QWORD *)(a1 + v6[9]) = *(_QWORD *)(a2 + v6[9]);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + v6[10]) = *(_QWORD *)(a2 + v6[10]);
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    sub_213DE4A04(a1);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D3B568);
    memcpy((void *)a1, (const void *)a2, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v11 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v11;
  v12 = v6[8];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_213EF1D64();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  *(_QWORD *)(a1 + v6[9]) = *(_QWORD *)(a2 + v6[9]);
  *(_QWORD *)(a1 + v6[10]) = *(_QWORD *)(a2 + v6[10]);
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  v17 = a3[5];
  v18 = a1 + v17;
  v19 = a2 + v17;
  *(_QWORD *)v18 = *(_QWORD *)(a2 + v17);
  *(_BYTE *)(v18 + 8) = *(_BYTE *)(a2 + v17 + 8);
  v20 = *(_QWORD *)(a2 + v17 + 24);
  *(_QWORD *)(v18 + 16) = *(_QWORD *)(a2 + v17 + 16);
  *(_QWORD *)(v18 + 24) = v20;
  swift_bridgeObjectRelease();
  v21 = *(_QWORD *)(v19 + 40);
  *(_QWORD *)(v18 + 32) = *(_QWORD *)(v19 + 32);
  *(_QWORD *)(v18 + 40) = v21;
  swift_bridgeObjectRelease();
  v22 = v6[8];
  v23 = v18 + v22;
  v24 = v19 + v22;
  v25 = sub_213EF1D64();
  v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 40);
  v26(v23, v24, v25);
  *(_QWORD *)(v18 + v6[9]) = *(_QWORD *)(v19 + v6[9]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v18 + v6[10]) = *(_QWORD *)(v19 + v6[10]);
  swift_bridgeObjectRelease();
  v27 = a3[7];
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  v26(a1 + v27, a2 + v27, v25);
  return a1;
}

uint64_t sub_213EBC668()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_213EBC674(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D3B568);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v11 = type metadata accessor for MediaPlayClassification();
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v8 = v11;
      v13 = *(int *)(a3 + 20);
    }
    else
    {
      v8 = sub_213EF1D64();
      v12 = *(_QWORD *)(v8 - 8);
      v13 = *(int *)(a3 + 28);
    }
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_213EBC710()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_213EBC71C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D3B568);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v13 = type metadata accessor for MediaPlayClassification();
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = sub_213EF1D64();
      v14 = *(_QWORD *)(v10 - 8);
      v15 = *(int *)(a4 + 28);
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for MediaInAppFollowupClassification()
{
  uint64_t result;

  result = qword_254D403A0;
  if (!qword_254D403A0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_213EBC7FC()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_213EBC8A8();
  if (v0 <= 0x3F)
  {
    type metadata accessor for MediaPlayClassification();
    if (v1 <= 0x3F)
    {
      sub_213EF1D64();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_213EBC8A8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254D403B0)
  {
    type metadata accessor for MediaPlayClassification();
    v0 = sub_213EF2D6C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254D403B0);
  }
}

_QWORD *sub_213EBC8FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  unsigned int (*v9)(_BYTE *, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  _QWORD *v32;
  _BYTE v34[16];
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D3B568);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = &v34[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v3);
  v7 = &v34[-v6];
  v35 = xmmword_213EF5FF0;
  sub_213E05468(v0, (uint64_t)&v34[-v6]);
  v8 = type metadata accessor for MediaPlayClassification();
  v9 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  if (v9(v7, 1, v8) == 1)
  {
    sub_213E4E8F0((uint64_t)v7);
    v10 = 0;
    v11 = 0;
  }
  else
  {
    v10 = *((_QWORD *)v7 + 2);
    v11 = *((_QWORD *)v7 + 3);
    swift_bridgeObjectRetain();
    sub_213DE4A04((uint64_t)v7);
  }
  v36 = v10;
  v37 = v11;
  sub_213E05468(v1, (uint64_t)v5);
  if (v9(v5, 1, v8) == 1)
  {
    sub_213E4E8F0((uint64_t)v5);
    v12 = 0;
    v13 = 0;
  }
  else
  {
    v12 = *((_QWORD *)v5 + 4);
    v13 = *((_QWORD *)v5 + 5);
    swift_bridgeObjectRetain();
    sub_213DE4A04((uint64_t)v5);
  }
  v38 = v12;
  v39 = v13;
  v14 = (_QWORD *)(v1 + *(int *)(type metadata accessor for MediaInAppFollowupClassification() + 20));
  v16 = v14[2];
  v15 = v14[3];
  v40 = v16;
  v41 = v15;
  v17 = v14[5];
  v42 = v14[4];
  v43 = v17;
  if (!v11)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v18 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if (!v13)
      goto LABEL_18;
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v18 = sub_213DB553C(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v20 = v18[2];
  v19 = v18[3];
  if (v20 >= v19 >> 1)
    v18 = sub_213DB553C((_QWORD *)(v19 > 1), v20 + 1, 1, v18);
  v18[2] = v20 + 1;
  v21 = &v18[2 * v20];
  v21[4] = v10;
  v21[5] = v11;
  if (v13)
  {
LABEL_13:
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v18 = sub_213DB553C(0, v18[2] + 1, 1, v18);
    v23 = v18[2];
    v22 = v18[3];
    if (v23 >= v22 >> 1)
      v18 = sub_213DB553C((_QWORD *)(v22 > 1), v23 + 1, 1, v18);
    v18[2] = v23 + 1;
    v24 = &v18[2 * v23];
    v24[4] = v12;
    v24[5] = v13;
    v16 = v40;
    v15 = v41;
  }
LABEL_18:
  if (v15)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v18 = sub_213DB553C(0, v18[2] + 1, 1, v18);
    v26 = v18[2];
    v25 = v18[3];
    if (v26 >= v25 >> 1)
      v18 = sub_213DB553C((_QWORD *)(v25 > 1), v26 + 1, 1, v18);
    v18[2] = v26 + 1;
    v27 = &v18[2 * v26];
    v27[4] = v16;
    v27[5] = v15;
  }
  v28 = v43;
  if (v43)
  {
    v29 = v42;
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v18 = sub_213DB553C(0, v18[2] + 1, 1, v18);
    v31 = v18[2];
    v30 = v18[3];
    if (v31 >= v30 >> 1)
      v18 = sub_213DB553C((_QWORD *)(v30 > 1), v31 + 1, 1, v18);
    v18[2] = v31 + 1;
    v32 = &v18[2 * v31];
    v32[4] = v29;
    v32[5] = v28;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D3AFC8);
  swift_arrayDestroy();
  return v18;
}

uint64_t sub_213EBCCA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254D3A840);
  v3 = sub_213EF1D64();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_213EF53E0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 16))(v6 + v5, v1 + *(int *)(a1 + 28), v3);
  return v6;
}

uint64_t sub_213EBCD3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  void (*v61)(char *, unint64_t, uint64_t);
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(char *, unint64_t, uint64_t);
  char *v68;
  char *v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;

  v0 = sub_213EF1AC4();
  v70 = *(_QWORD *)(v0 - 8);
  v1 = MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v59 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v59 - v4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D403E8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v68 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v67 = (void (*)(char *, unint64_t, uint64_t))((char *)&v59 - v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D403F0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_213EF1B00();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v69 = (char *)&v59 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F047F8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v59 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_213EF1C2C();
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v59 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = v22;
  v25 = v24;
  sub_213EF1C20();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v18, 1, v25) == 1)
  {
    sub_213DAFEC4((uint64_t)v18, &qword_253F047F8);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v21, v18, v25);
  sub_213EF1ADC();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v21, v25);
    sub_213DAFEC4((uint64_t)v12, (uint64_t *)&unk_254D403F0);
    return 0;
  }
  v62 = v25;
  v63 = v21;
  v64 = v14;
  v65 = v13;
  v26 = v69;
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v69, v12, v13);
  v27 = sub_213EF1AF4();
  if (!v28)
    goto LABEL_22;
  v29 = v0;
  v30 = v3;
  if (v27 == 0x6D6574692D63706DLL && v28 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v31 = sub_213EF3234();
    swift_bridgeObjectRelease();
    if ((v31 & 1) == 0)
      goto LABEL_22;
  }
  if (sub_213EF1AE8() == 0x676E6F732FLL && v32 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  v33 = sub_213EF3234();
  swift_bridgeObjectRelease();
  if ((v33 & 1) == 0)
  {
LABEL_22:
    (*(void (**)(char *, uint64_t))(v64 + 8))(v26, v65);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v63, v62);
    return 0;
  }
LABEL_14:
  v34 = sub_213EF1AD0();
  v35 = v34;
  v66 = v23;
  if (v34)
  {
    v36 = *(_QWORD *)(v34 + 16);
    if (v36)
    {
      v37 = v34 + ((*(unsigned __int8 *)(v70 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80));
      v38 = *(_QWORD *)(v70 + 72);
      v61 = *(void (**)(char *, unint64_t, uint64_t))(v70 + 16);
      swift_bridgeObjectRetain();
      while (1)
      {
        v61(v5, v37, v29);
        if (sub_213EF1AAC() == 0x61644165726F7473 && v39 == 0xEB0000000044496DLL)
        {
          swift_bridgeObjectRelease();
          v41 = v70;
          v45 = (uint64_t)v67;
          goto LABEL_30;
        }
        v40 = sub_213EF3234();
        swift_bridgeObjectRelease();
        if ((v40 & 1) != 0)
          break;
        v41 = v70;
        (*(void (**)(char *, uint64_t))(v70 + 8))(v5, v29);
        v37 += v38;
        --v36;
        v26 = v69;
        if (!v36)
        {
          swift_bridgeObjectRelease();
          v42 = 1;
          goto LABEL_27;
        }
      }
      v26 = v69;
      v41 = v70;
      v45 = (uint64_t)v67;
LABEL_30:
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, char *, uint64_t))(v41 + 32))(v45, v5, v29);
      v42 = 0;
    }
    else
    {
      v42 = 1;
      v41 = v70;
LABEL_27:
      v45 = (uint64_t)v67;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 56))(v45, v42, 1, v29);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v41 + 48))(v45, 1, v29) == 1)
    {
      sub_213DAFEC4(v45, &qword_254D403E8);
      v43 = 0;
    }
    else
    {
      v43 = sub_213EF1AB8();
      v46 = v45;
      v48 = v47;
      (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v46, v29);
      if (v48)
      {
        v71 = 0;
        v72 = 0xE000000000000000;
        sub_213EF2EB0();
        swift_bridgeObjectRelease();
        v71 = 0xD000000000000016;
        v72 = 0x8000000213F09460;
        sub_213EF2904();
        swift_bridgeObjectRelease();
        v43 = v71;
        v35 = v72;
LABEL_36:
        v23 = v66;
        goto LABEL_37;
      }
    }
    v35 = 0;
    goto LABEL_36;
  }
  v43 = 0;
LABEL_37:
  v49 = sub_213EF1AD0();
  v50 = v49;
  if (v49)
  {
    v51 = *(_QWORD *)(v49 + 16);
    if (v51)
    {
      v52 = v49 + ((*(unsigned __int8 *)(v70 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80));
      v61 = *(void (**)(char *, unint64_t, uint64_t))(v70 + 72);
      v67 = *(void (**)(char *, unint64_t, uint64_t))(v70 + 16);
      v59 = v49;
      swift_bridgeObjectRetain();
      v60 = 0x8000000213F09C10;
      while (1)
      {
        v67(v30, v52, v29);
        if (sub_213EF1AAC() == 0xD000000000000019 && v53 == v60)
        {
          swift_bridgeObjectRelease();
          v55 = v70;
          v57 = (uint64_t)v68;
          goto LABEL_50;
        }
        v54 = sub_213EF3234();
        swift_bridgeObjectRelease();
        if ((v54 & 1) != 0)
          break;
        v55 = v70;
        (*(void (**)(char *, uint64_t))(v70 + 8))(v30, v29);
        v52 += (unint64_t)v61;
        --v51;
        v23 = v66;
        if (!v51)
        {
          swift_bridgeObjectRelease();
          v56 = 1;
          goto LABEL_47;
        }
      }
      v55 = v70;
      v57 = (uint64_t)v68;
      v23 = v66;
LABEL_50:
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, char *, uint64_t))(v55 + 32))(v57, v30, v29);
      v56 = 0;
    }
    else
    {
      v56 = 1;
      v55 = v70;
LABEL_47:
      v57 = (uint64_t)v68;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v55 + 56))(v57, v56, 1, v29);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v55 + 48))(v57, 1, v29) == 1)
    {
      (*(void (**)(char *, uint64_t))(v64 + 8))(v69, v65);
      (*(void (**)(char *, uint64_t))(v23 + 8))(v63, v62);
      sub_213DAFEC4(v57, &qword_254D403E8);
      v50 = 0;
    }
    else
    {
      sub_213EF1AB8();
      v50 = v58;
      (*(void (**)(char *, uint64_t))(v64 + 8))(v69, v65);
      (*(void (**)(char *, uint64_t))(v23 + 8))(v63, v62);
      (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v57, v29);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v64 + 8))(v26, v65);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v63, v62);
  }
  if (!v35 && !v50)
    return 0;
  return v43;
}

ValueMetadata *type metadata accessor for MediaIdentifierUtils.MpcIdentifierParts()
{
  return &type metadata for MediaIdentifierUtils.MpcIdentifierParts;
}

uint64_t static SetUtils.haveSameDomainTags<A>(_:_:)()
{
  char v0;

  swift_bridgeObjectRetain();
  sub_213EF2BD4();
  swift_bridgeObjectRetain();
  sub_213EF2BD4();
  v0 = sub_213EF2BBC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

uint64_t sub_213EBD668()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v0 + 24) + 8))(*(_QWORD *)(v0 + 16)) & 1;
}

ValueMetadata *type metadata accessor for SetUtils()
{
  return &type metadata for SetUtils;
}

uint64_t sub_213EBD6B0()
{
  return sub_213EBD668() & 1;
}

uint64_t sub_213EBD6C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_213EBD6E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 16) + *(_QWORD *)(a2 + 16));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_213E4141C;
  return v7(a1, a2);
}

void sub_213EBD74C(uint64_t a1, void *a2, unsigned __int16 a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F04E60);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v9 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = sub_213EBD958;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_213EBD9A8;
  aBlock[3] = &block_descriptor_2;
  v11 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_donateWithOptions_usingStream_, a3, v11);
  _Block_release(v11);
}

uint64_t sub_213EBD884(void *a1, id a2)
{
  id v2;
  id v4;

  if (a2)
  {
    v2 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F04E60);
    return sub_213EF2AFC();
  }
  else
  {
    v4 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F04E60);
    return sub_213EF2B08();
  }
}

uint64_t sub_213EBD8F4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F04E60);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_213EBD958(void *a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F04E60);
  return sub_213EBD884(a1, a2);
}

void sub_213EBD9A8(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for SuggestionDonationStream()
{
  return &type metadata for SuggestionDonationStream;
}

uint64_t dispatch thunk of GroundTruthInference.generate(session:classifications:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t static SELFGraphUtils.getPrimaryTask<A>(_:taskType:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  unint64_t v4;
  uint64_t result;
  int v6;
  __int128 v7;
  uint64_t v8;
  _OWORD v9[2];

  v4 = MEMORY[0x2199C3864]();
  if (!(v4 >> 62))
  {
    result = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (result)
      goto LABEL_3;
LABEL_11:
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(a2, 1, 1, a1);
  }
  result = sub_213EF306C();
  if (!result)
    goto LABEL_11;
LABEL_3:
  if ((v4 & 0xC000000000000001) != 0)
  {
    MEMORY[0x2199C49B0](0, v4);
  }
  else
  {
    if (!*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    swift_retain();
  }
  swift_bridgeObjectRelease();
  swift_retain();
  sub_213EF1E6C();
  swift_release_n();
  if (v8)
  {
    sub_213E5B300(&v7, v9);
    sub_213E5B300(v9, &v7);
    v6 = swift_dynamicCast();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(a2, v6 ^ 1u, 1, a1);
  }
  else
  {
    sub_213E43920((uint64_t)&v7);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(a2, 1, 1, a1);
  }
}

ValueMetadata *type metadata accessor for SELFGraphUtils()
{
  return &type metadata for SELFGraphUtils;
}

uint64_t sub_213EBDBC4()
{
  unint64_t v0;
  uint64_t result;
  __int128 v2;
  uint64_t v3;
  _OWORD v4[2];
  uint64_t v5;

  v0 = MEMORY[0x2199C3864]();
  if (!(v0 >> 62))
  {
    result = *(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (result)
      goto LABEL_3;
LABEL_12:
    swift_bridgeObjectRelease();
    return 0;
  }
  result = sub_213EF306C();
  if (!result)
    goto LABEL_12;
LABEL_3:
  if ((v0 & 0xC000000000000001) != 0)
  {
    MEMORY[0x2199C49B0](0, v0);
  }
  else
  {
    if (!*(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    swift_retain();
  }
  swift_bridgeObjectRelease();
  swift_retain();
  sub_213EF1E6C();
  swift_release_n();
  if (!v3)
  {
    sub_213DAFEC4((uint64_t)&v2, &qword_254D3DF38);
    return 0;
  }
  sub_213E5B300(&v2, v4);
  sub_213E5B300(v4, &v2);
  sub_213EF1F50();
  if (swift_dynamicCast())
    return v5;
  else
    return 0;
}

uint64_t sub_213EBDCE8()
{
  uint64_t result;

  type metadata accessor for MediaFeatureExtractor();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D404C8);
  sub_213EF288C();
  sub_213EF2904();
  swift_bridgeObjectRelease();
  result = sub_213EF2904();
  qword_254D40400 = 91;
  *(_QWORD *)algn_254D40408 = 0xE100000000000000;
  return result;
}

uint64_t MediaFeatureExtractor.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t MediaFeatureExtractor.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t MediaFeatureExtractor.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t MediaFeatureExtractor.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_213EBDD9C(unint64_t *a1)
{
  return sub_213EBFE98(*a1);
}

uint64_t sub_213EBDDA4(void *a1, _BYTE *a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  __CFString *v19;
  __CFString *v20;
  uint64_t v21;
  __CFString *v22;
  __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int8 v32;
  unint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;

  v3 = objc_msgSend(a1, sel_searchResults);
  if (!v3)
  {
    *a2 = 1;
    return (uint64_t)v3;
  }
  sub_213EC037C();
  v4 = sub_213EF2A3C();

  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v5)
      goto LABEL_4;
    goto LABEL_26;
  }
  swift_bridgeObjectRetain();
  v5 = sub_213EF306C();
  swift_bridgeObjectRelease();
  if (!v5)
  {
LABEL_26:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
LABEL_4:
  v41 = (_QWORD *)MEMORY[0x24BEE4AF8];
  result = sub_213DCD654(0, v5 & ~(v5 >> 63), 0);
  if ((v5 & 0x8000000000000000) == 0)
  {
    v7 = 0;
    v36 = v5;
    v3 = v41;
    do
    {
      if ((v4 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x2199C49B0](v7, v4);
      else
        v8 = *(id *)(v4 + 8 * v7 + 32);
      v9 = v8;
      v10 = objc_msgSend(v8, sel_title);
      if (v10)
      {
        v11 = v10;
        v12 = sub_213EF2850();
        v39 = v13;
        v40 = v12;

      }
      else
      {
        v39 = 0;
        v40 = 0;
      }
      v14 = objc_msgSend(v9, sel_artist);
      if (v14)
      {
        v15 = v14;
        v16 = sub_213EF2850();
        v37 = v17;
        v38 = v16;

      }
      else
      {
        v37 = 0;
        v38 = 0;
      }
      v18 = objc_msgSend(v9, sel_mediaType);
      v19 = CFSTR("FLOWMEDIATYPE_UNKNOWN");
      v20 = CFSTR("FLOWMEDIATYPE_UNKNOWN");
      if (v18 <= 0x1C)
      {
        v21 = (int)v18;
        v20 = off_24D108F80[v21];
        v19 = off_24D109068[v21];
      }
      v22 = v20;
      v23 = v19;
      v24 = sub_213EF2850();
      v26 = v25;

      v27 = objc_msgSend(v9, sel_entityId);
      if (v27)
      {
        v28 = v27;
        v29 = sub_213EF2850();
        v31 = v30;

      }
      else
      {
        v29 = 0;
        v31 = 0;
      }
      v32 = objc_msgSend(v9, sel_isAlternative);

      v34 = v41[2];
      v33 = v41[3];
      if (v34 >= v33 >> 1)
        sub_213DCD654(v33 > 1, v34 + 1, 1);
      ++v7;
      v41[2] = v34 + 1;
      v35 = &v41[9 * v34];
      v35[4] = v40;
      v35[5] = v39;
      v35[6] = v38;
      v35[7] = v37;
      v35[8] = v24;
      v35[9] = v26;
      v35[10] = v29;
      v35[11] = v31;
      *((_BYTE *)v35 + 96) = v32;
    }
    while (v36 != v7);
    swift_bridgeObjectRelease();
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

void sub_213EBE084(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void **p_weak_ivar_lyt;
  id v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  __CFString *v28;
  __CFString *v29;
  uint64_t v30;
  __CFString *v31;
  __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned __int8 v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  id v45;
  BOOL i;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  unsigned int v62;
  __CFString *v63;
  __CFString *v64;
  uint64_t v65;
  __CFString *v66;
  __CFString *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unsigned __int8 v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  id v80;
  void *v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  void *v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char v103[24];
  ValueMetadata *v104;
  unint64_t v105;
  uint64_t v106;
  char v107[9];

  v1 = a1;
  v107[0] = 12;
  if (a1 >> 62)
    goto LABEL_75;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; v2 = sub_213EF306C())
  {
    v3 = 0;
    v4 = v1 & 0xC000000000000001;
    v5 = v1 + 32;
    p_weak_ivar_lyt = &PlusMediaReferenceSourceAppCoreDataRecord__metaData.weak_ivar_lyt;
    while (1)
    {
      if (v4)
      {
        swift_bridgeObjectRetain();
        v7 = (id)MEMORY[0x2199C49B0](v3, v1);
      }
      else
      {
        v8 = *(void **)(v1 + 8 * v3 + 32);
        swift_bridgeObjectRetain();
        v7 = v8;
      }
      v9 = v7;
      swift_beginAccess();
      v10 = objc_msgSend(v9, sel_searchResults);
      if (v10)
      {
        v12 = v10;
        v87 = v9;
        sub_213EC037C();
        v13 = sub_213EF2A3C();

        if (v13 >> 62)
        {
          swift_bridgeObjectRetain();
          v14 = sub_213EF306C();
          swift_bridgeObjectRelease();
        }
        else
        {
          v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        v85 = v1 + 32;
        v86 = v1;
        v84 = v1 & 0xC000000000000001;
        if (!v14)
        {
          swift_bridgeObjectRelease();
          goto LABEL_35;
        }
        v83 = v2;
        v106 = MEMORY[0x24BEE4AF8];
        sub_213DCD654(0, v14 & ~(v14 >> 63), 0);
        if (v14 < 0)
        {
          __break(1u);
        }
        else
        {
          v15 = 0;
          v89 = v13 & 0xC000000000000001;
          v91 = v14;
          v16 = v106;
          v93 = v13;
          do
          {
            if (v89)
              v17 = (id)MEMORY[0x2199C49B0](v15, v13);
            else
              v17 = *(id *)(v13 + 8 * v15 + 32);
            v18 = v17;
            v19 = objc_msgSend(v17, sel_title);
            if (v19)
            {
              v20 = v19;
              v21 = sub_213EF2850();
              v99 = v22;
              v101 = v21;

            }
            else
            {
              v99 = 0;
              v101 = 0;
            }
            v23 = objc_msgSend(v18, sel_artist);
            if (v23)
            {
              v24 = v23;
              v25 = sub_213EF2850();
              v95 = v26;
              v97 = v25;

            }
            else
            {
              v95 = 0;
              v97 = 0;
            }
            v27 = objc_msgSend(v18, sel_mediaType);
            v28 = CFSTR("FLOWMEDIATYPE_UNKNOWN");
            v29 = CFSTR("FLOWMEDIATYPE_UNKNOWN");
            if (v27 <= 0x1C)
            {
              v30 = (int)v27;
              v29 = off_24D109150[v30];
              v28 = off_24D109238[v30];
            }
            v31 = v29;
            v32 = v28;
            v33 = sub_213EF2850();
            v35 = v34;

            v36 = objc_msgSend(v18, sel_entityId);
            if (v36)
            {
              v37 = v36;
              v38 = sub_213EF2850();
              v40 = v39;

            }
            else
            {
              v38 = 0;
              v40 = 0;
            }
            v41 = objc_msgSend(v18, sel_isAlternative);

            v106 = v16;
            v43 = *(_QWORD *)(v16 + 16);
            v42 = *(_QWORD *)(v16 + 24);
            if (v43 >= v42 >> 1)
            {
              sub_213DCD654(v42 > 1, v43 + 1, 1);
              v16 = v106;
            }
            ++v15;
            *(_QWORD *)(v16 + 16) = v43 + 1;
            v44 = v16 + 72 * v43;
            *(_QWORD *)(v44 + 32) = v101;
            *(_QWORD *)(v44 + 40) = v99;
            *(_QWORD *)(v44 + 48) = v97;
            *(_QWORD *)(v44 + 56) = v95;
            *(_QWORD *)(v44 + 64) = v33;
            *(_QWORD *)(v44 + 72) = v35;
            *(_QWORD *)(v44 + 80) = v38;
            *(_QWORD *)(v44 + 88) = v40;
            *(_BYTE *)(v44 + 96) = v41;
            v13 = v93;
          }
          while (v91 != v15);
          swift_bridgeObjectRelease();
          v5 = v85;
          v1 = v86;
          v2 = v83;
          v4 = v84;
          p_weak_ivar_lyt = (void **)(&PlusMediaReferenceSourceAppCoreDataRecord__metaData + 56);
LABEL_35:
          swift_endAccess();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          if (v2 == v3)
            goto LABEL_36;
          for (i = __OFSUB__(v2--, 1); !i; --v2)
          {
            if (v4)
            {
              v47 = (id)MEMORY[0x2199C49B0](v2, v1);
            }
            else
            {
              if ((v2 & 0x8000000000000000) != 0)
                goto LABEL_73;
              if (v2 >= *(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
                goto LABEL_74;
              v47 = *(id *)(v5 + 8 * v2);
            }
            v13 = (unint64_t)v47;
            swift_beginAccess();
            v45 = objc_msgSend((id)v13, (SEL)p_weak_ivar_lyt[390]);
            if (v45)
              goto LABEL_50;
            v107[0] = 1;
            swift_endAccess();

            i = __OFSUB__(v2, 1);
          }
          __break(1u);
LABEL_50:
          v48 = v45;
          v3 = sub_213EF2A3C();

          if (!(v3 >> 62))
          {
            v49 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
            if (v49)
              goto LABEL_52;
LABEL_80:
            swift_bridgeObjectRelease();
LABEL_81:
            swift_endAccess();
            swift_bridgeObjectRelease();

            if (v4)
              v80 = (id)MEMORY[0x2199C49B0](v2, v1);
            else
              v80 = *(id *)(v5 + 8 * v2);
            v81 = v80;
            swift_beginAccess();
            v82 = sub_213EBDDA4(v81, v107);
            swift_endAccess();

            if (v82)
            {
              swift_bridgeObjectRelease();
              return;
            }
            goto LABEL_88;
          }
        }
        swift_bridgeObjectRetain();
        v49 = sub_213EF306C();
        swift_bridgeObjectRelease();
        if (!v49)
          goto LABEL_80;
LABEL_52:
        v106 = MEMORY[0x24BEE4AF8];
        sub_213DCD654(0, v49 & ~(v49 >> 63), 0);
        if ((v49 & 0x8000000000000000) == 0)
        {
          v50 = 0;
          v88 = v3 & 0xC000000000000001;
          v90 = v49;
          v51 = v106;
          v92 = v3;
          v94 = v13;
          do
          {
            if (v88)
              v52 = (id)MEMORY[0x2199C49B0](v50, v3);
            else
              v52 = *(id *)(v3 + 8 * v50 + 32);
            v53 = v52;
            v54 = objc_msgSend(v52, sel_title);
            if (v54)
            {
              v55 = v54;
              v56 = sub_213EF2850();
              v100 = v57;
              v102 = v56;

            }
            else
            {
              v100 = 0;
              v102 = 0;
            }
            v58 = objc_msgSend(v53, sel_artist);
            if (v58)
            {
              v59 = v58;
              v60 = sub_213EF2850();
              v96 = v61;
              v98 = v60;

            }
            else
            {
              v96 = 0;
              v98 = 0;
            }
            v62 = objc_msgSend(v53, sel_mediaType);
            v63 = CFSTR("FLOWMEDIATYPE_UNKNOWN");
            v64 = CFSTR("FLOWMEDIATYPE_UNKNOWN");
            if (v62 <= 0x1C)
            {
              v65 = (int)v62;
              v64 = off_24D109320[v65];
              v63 = off_24D109408[v65];
            }
            v66 = v64;
            v67 = v63;
            v68 = sub_213EF2850();
            v70 = v69;

            v71 = objc_msgSend(v53, sel_entityId);
            if (v71)
            {
              v72 = v71;
              v73 = sub_213EF2850();
              v75 = v74;

            }
            else
            {
              v73 = 0;
              v75 = 0;
            }
            v76 = objc_msgSend(v53, sel_isAlternative);

            v106 = v51;
            v78 = *(_QWORD *)(v51 + 16);
            v77 = *(_QWORD *)(v51 + 24);
            if (v78 >= v77 >> 1)
            {
              sub_213DCD654(v77 > 1, v78 + 1, 1);
              v51 = v106;
            }
            ++v50;
            *(_QWORD *)(v51 + 16) = v78 + 1;
            v79 = v51 + 72 * v78;
            *(_QWORD *)(v79 + 32) = v102;
            *(_QWORD *)(v79 + 40) = v100;
            *(_QWORD *)(v79 + 48) = v98;
            *(_QWORD *)(v79 + 56) = v96;
            *(_QWORD *)(v79 + 64) = v68;
            *(_QWORD *)(v79 + 72) = v70;
            *(_QWORD *)(v79 + 80) = v73;
            *(_QWORD *)(v79 + 88) = v75;
            *(_BYTE *)(v79 + 96) = v76;
            v3 = v92;
            v13 = v94;
          }
          while (v90 != v50);
          swift_bridgeObjectRelease();
          v5 = v85;
          v1 = v86;
          v4 = v84;
          goto LABEL_81;
        }
        __break(1u);
LABEL_88:
        __break(1u);
        return;
      }
      v107[0] = 1;
      swift_endAccess();
      swift_bridgeObjectRelease();

      v11 = v3 + 1;
      if (__OFADD__(v3, 1))
        break;
      ++v3;
      if (v11 == v2)
        goto LABEL_36;
    }
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
LABEL_75:
    swift_bridgeObjectRetain();
  }
LABEL_36:
  swift_bridgeObjectRelease();
  swift_beginAccess();
  if (v107[0] != 12)
  {
    if (qword_253F04BB0 != -1)
      swift_once();
    v104 = &type metadata for PIMSFatalError;
    v105 = sub_213E4D6F0();
    strcpy(v103, "PIMSFatalError");
    v103[15] = -18;
    v103[16] = v107[0];
    sub_213EF210C();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v103);
  }
}

void sub_213EBE8B0(unint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t *v5;
  unint64_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;
  BOOL v15;
  unint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  void *v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  void *v49;
  uint64_t v50[2];
  uint64_t v51;

  if (qword_253F04A88 != -1)
LABEL_32:
    swift_once();
  v2 = sub_213EF2724();
  __swift_project_value_buffer(v2, (uint64_t)qword_253F08A00);
  v3 = sub_213EF270C();
  v4 = sub_213EF2C94();
  v5 = &qword_254D3A000;
  if (os_log_type_enabled(v3, v4))
  {
    v6 = a1;
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v50[0] = v8;
    *(_DWORD *)v7 = 136315138;
    if (qword_254D3A088 != -1)
      swift_once();
    v9 = qword_254D40400;
    v10 = *(_QWORD *)algn_254D40408;
    swift_bridgeObjectRetain();
    v51 = sub_213DB0570(v9, v10, v50);
    sub_213EF2D9C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_213DAB000, v3, v4, "%s MediaItemDebug: Printing MediaEvents", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199C53C4](v8, -1, -1);
    MEMORY[0x2199C53C4](v7, -1, -1);

    a1 = v6;
  }
  else
  {

  }
  if (!(a1 >> 62))
  {
    v11 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v11)
      goto LABEL_9;
LABEL_34:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v11 = sub_213EF306C();
  if (!v11)
    goto LABEL_34;
LABEL_9:
  v12 = 0;
  v47 = a1 & 0xC000000000000001;
  v43 = a1 + 32;
  v44 = a1 & 0xFFFFFFFFFFFFFF8;
  v45 = v11;
  v46 = a1;
  while (1)
  {
    if (v47)
    {
      v13 = (id)MEMORY[0x2199C49B0](v12, a1);
    }
    else
    {
      if (v12 >= *(_QWORD *)(v44 + 16))
        goto LABEL_31;
      v13 = *(id *)(v43 + 8 * v12);
    }
    v14 = v13;
    v15 = __OFADD__(v12, 1);
    v16 = v12 + 1;
    if (v15)
    {
      __break(1u);
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
    v17 = objc_msgSend(v13, sel_formattedJsonBody);
    if (!v17)
      break;
    v18 = v17;
    v48 = v16;
    v49 = v14;
    v19 = sub_213EF2850();
    v21 = v20;

    v22 = sub_213E8BF00(v19, v21);
    swift_bridgeObjectRelease();
    v23 = *(_QWORD *)(v22 + 16);
    if (v23)
    {
      v24 = (uint64_t *)(v22 + 40);
      do
      {
        v26 = *(v24 - 1);
        v25 = *v24;
        swift_bridgeObjectRetain_n();
        v27 = sub_213EF270C();
        v28 = sub_213EF2C94();
        if (os_log_type_enabled(v27, v28))
        {
          v29 = v26;
          v30 = swift_slowAlloc();
          v31 = swift_slowAlloc();
          v51 = v31;
          *(_DWORD *)v30 = 136315394;
          if (v5[17] != -1)
            swift_once();
          v32 = qword_254D40400;
          v33 = *(_QWORD *)algn_254D40408;
          swift_bridgeObjectRetain();
          *(_QWORD *)(v30 + 4) = sub_213DB0570(v32, v33, &v51);
          swift_bridgeObjectRelease();
          *(_WORD *)(v30 + 12) = 2080;
          v50[0] = v29;
          v50[1] = v25;
          swift_bridgeObjectRetain();
          v34 = sub_213EF297C();
          *(_QWORD *)(v30 + 14) = sub_213DB0570(v34, v35, &v51);
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_213DAB000, v27, v28, "%s MediaItemDebug: %s", (uint8_t *)v30, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x2199C53C4](v31, -1, -1);
          MEMORY[0x2199C53C4](v30, -1, -1);

          v5 = &qword_254D3A000;
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        v24 += 2;
        --v23;
      }
      while (v23);
    }

    swift_bridgeObjectRelease();
    a1 = v46;
    v12 = v48;
    if (v48 == v45)
      goto LABEL_34;
  }
  swift_bridgeObjectRelease();
  v36 = sub_213EF270C();
  v37 = sub_213EF2C94();
  if (os_log_type_enabled(v36, v37))
  {
    v38 = v14;
    v39 = (uint8_t *)swift_slowAlloc();
    v40 = swift_slowAlloc();
    v50[0] = v40;
    *(_DWORD *)v39 = 136315138;
    if (v5[17] != -1)
      swift_once();
    v41 = qword_254D40400;
    v42 = *(_QWORD *)algn_254D40408;
    swift_bridgeObjectRetain();
    v51 = sub_213DB0570(v41, v42, v50);
    sub_213EF2D9C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_213DAB000, v36, v37, "%s MediaItemDebug: Failed to extract JSON from USO object", v39, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199C53C4](v40, -1, -1);
    MEMORY[0x2199C53C4](v39, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_213EBEE8C(void *a1, char *a2)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  char v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  id v37;
  uint64_t inited;
  unint64_t v39;
  id v40;
  uint64_t v41;
  id v43;
  unint64_t v44;

  v4 = objc_msgSend(a1, sel_u2UsoGraph);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(a1, sel_u2UsoGraphTier1);
    if (v6)
    {
      v7 = v6;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F04EF0);
      v8 = swift_allocObject();
      *(_OWORD *)(v8 + 16) = xmmword_213EF8CA0;
      *(_QWORD *)(v8 + 32) = v7;
      v44 = v8;
      sub_213EF2A54();
      v9 = v7;
      v41 = sub_213EF246C();
      swift_bridgeObjectRelease();
      if (v41)
      {

        v27 = 12;
      }
      else
      {
        if (qword_253F04A88 != -1)
          swift_once();
        v10 = sub_213EF2724();
        __swift_project_value_buffer(v10, (uint64_t)qword_253F08A00);
        v11 = sub_213EF270C();
        v12 = sub_213EF2CA0();
        if (os_log_type_enabled(v11, v12))
        {
          v43 = v9;
          v13 = (uint8_t *)swift_slowAlloc();
          v14 = swift_slowAlloc();
          v44 = v14;
          *(_DWORD *)v13 = 136315138;
          if (qword_254D3A088 != -1)
            swift_once();
          v15 = qword_254D40400;
          v16 = *(_QWORD *)algn_254D40408;
          swift_bridgeObjectRetain();
          sub_213DB0570(v15, v16, (uint64_t *)&v44);
          sub_213EF2D9C();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_213DAB000, v11, v12, "%s getUsoGraph - Failed to un-redact play media uso graph", v13, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2199C53C4](v14, -1, -1);
          MEMORY[0x2199C53C4](v13, -1, -1);

          v9 = v43;
        }
        else
        {

        }
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_213EF8CA0;
        *(_QWORD *)(inited + 32) = a1;
        v44 = inited;
        sub_213EF2A54();
        v39 = v44;
        v40 = a1;
        sub_213EBE8B0(v39);
        swift_bridgeObjectRelease();

        v41 = 0;
        v27 = 5;
      }
    }
    else
    {
      if (qword_253F04A88 != -1)
        swift_once();
      v28 = sub_213EF2724();
      __swift_project_value_buffer(v28, (uint64_t)qword_253F08A00);
      v29 = sub_213EF270C();
      v30 = sub_213EF2C94();
      if (os_log_type_enabled(v29, v30))
      {
        v31 = (uint8_t *)swift_slowAlloc();
        v32 = swift_slowAlloc();
        v44 = v32;
        *(_DWORD *)v31 = 136315138;
        if (qword_254D3A088 != -1)
          swift_once();
        v33 = qword_254D40400;
        v34 = *(_QWORD *)algn_254D40408;
        swift_bridgeObjectRetain();
        sub_213DB0570(v33, v34, (uint64_t *)&v44);
        sub_213EF2D9C();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_213DAB000, v29, v30, "%s getUsoGraph - u2UsoGraphTier1 not present", v31, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2199C53C4](v32, -1, -1);
        MEMORY[0x2199C53C4](v31, -1, -1);
      }

      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F04EF0);
      v35 = swift_initStackObject();
      *(_OWORD *)(v35 + 16) = xmmword_213EF8CA0;
      *(_QWORD *)(v35 + 32) = a1;
      v44 = v35;
      sub_213EF2A54();
      v36 = v44;
      v37 = a1;
      sub_213EBE8B0(v36);
      swift_bridgeObjectRelease();

      v41 = 0;
      v27 = 4;
    }
  }
  else
  {
    if (qword_253F04A88 != -1)
      swift_once();
    v17 = sub_213EF2724();
    __swift_project_value_buffer(v17, (uint64_t)qword_253F08A00);
    v18 = sub_213EF270C();
    v19 = sub_213EF2C94();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v44 = v21;
      *(_DWORD *)v20 = 136315138;
      if (qword_254D3A088 != -1)
        swift_once();
      v22 = qword_254D40400;
      v23 = *(_QWORD *)algn_254D40408;
      swift_bridgeObjectRetain();
      sub_213DB0570(v22, v23, (uint64_t *)&v44);
      sub_213EF2D9C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_213DAB000, v18, v19, "%s getUsoGraph - u2UsoGraph not present", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C53C4](v21, -1, -1);
      MEMORY[0x2199C53C4](v20, -1, -1);
    }

    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F04EF0);
    v24 = swift_initStackObject();
    *(_OWORD *)(v24 + 16) = xmmword_213EF8CA0;
    *(_QWORD *)(v24 + 32) = a1;
    v44 = v24;
    sub_213EF2A54();
    v25 = v44;
    v26 = a1;
    sub_213EBE8B0(v25);
    swift_bridgeObjectRelease();
    v41 = 0;
    v27 = 3;
  }
  *a2 = v27;
  return v41;
}

void sub_213EBF4D8(unint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28[2];
  char v29;
  ValueMetadata *v30;
  unint64_t v31;
  char v32;

  v32 = 12;
  if (a1 >> 62)
  {
LABEL_42:
    swift_bridgeObjectRetain();
    v2 = sub_213EF306C();
    if (v2)
      goto LABEL_3;
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2)
    {
LABEL_3:
      v3 = a1 & 0xC000000000000001;
      v4 = a1 + 32;
      while (1)
      {
        if (__OFSUB__(v2--, 1))
        {
          __break(1u);
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          goto LABEL_42;
        }
        if (v3)
        {
          swift_bridgeObjectRetain();
          v6 = (id)MEMORY[0x2199C49B0](v2, a1);
        }
        else
        {
          if ((v2 & 0x8000000000000000) != 0)
            goto LABEL_40;
          if (v2 >= *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_41;
          v7 = *(void **)(v4 + 8 * v2);
          swift_bridgeObjectRetain();
          v6 = v7;
        }
        v8 = v6;
        swift_beginAccess();
        v9 = sub_213EBEE8C(v8, &v32);
        swift_endAccess();
        swift_bridgeObjectRelease();

        swift_release();
        if (v9)
          break;
        if (!v2)
          goto LABEL_12;
      }
      if (!v3)
      {
        if ((v2 & 0x8000000000000000) != 0)
        {
          __break(1u);
        }
        else if (v2 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          v18 = *(id *)(v4 + 8 * v2);
          goto LABEL_26;
        }
        __break(1u);
LABEL_47:
        swift_once();
LABEL_30:
        v21 = sub_213EF2724();
        __swift_project_value_buffer(v21, (uint64_t)qword_253F08A00);
        v22 = sub_213EF270C();
        v23 = sub_213EF2CA0();
        if (os_log_type_enabled(v22, v23))
        {
          v24 = (uint8_t *)swift_slowAlloc();
          v25 = swift_slowAlloc();
          v28[0] = v25;
          *(_DWORD *)v24 = 136315138;
          if (qword_254D3A088 != -1)
            swift_once();
          v26 = qword_254D40400;
          v27 = *(_QWORD *)algn_254D40408;
          swift_bridgeObjectRetain();
          sub_213DB0570(v26, v27, v28);
          sub_213EF2D9C();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_213DAB000, v22, v23, "%s getBestUsoMediaItem - Unable to extract a task from the found graph", v24, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2199C53C4](v25, -1, -1);
          MEMORY[0x2199C53C4](v24, -1, -1);
        }

        sub_213EBE8B0(a1);
        if (qword_253F04BB0 != -1)
          swift_once();
        v30 = &type metadata for PIMSFatalError;
        v31 = sub_213E4D6F0();
        strcpy((char *)v28, "PIMSFatalError");
        HIBYTE(v28[1]) = -18;
        v29 = 2;
        sub_213EF210C();
        swift_release();
        goto LABEL_37;
      }
      v18 = (id)MEMORY[0x2199C49B0](v2, a1);
LABEL_26:
      v19 = v18;
      swift_beginAccess();
      v20 = sub_213EBEE8C(v19, &v32);
      swift_endAccess();

      if (!v20)
      {
        __break(1u);
        return;
      }
      swift_bridgeObjectRelease();
      if (sub_213EBDBC4())
      {
        sub_213EF207C();
        swift_release();
        swift_release();
        return;
      }
      if (qword_253F04A88 == -1)
        goto LABEL_30;
      goto LABEL_47;
    }
  }
LABEL_12:
  swift_bridgeObjectRelease();
  if (qword_253F04A88 != -1)
    swift_once();
  v10 = sub_213EF2724();
  __swift_project_value_buffer(v10, (uint64_t)qword_253F08A00);
  v11 = sub_213EF270C();
  v12 = sub_213EF2CA0();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v28[0] = v14;
    *(_DWORD *)v13 = 136315138;
    if (qword_254D3A088 != -1)
      swift_once();
    v15 = qword_254D40400;
    v16 = *(_QWORD *)algn_254D40408;
    swift_bridgeObjectRetain();
    sub_213DB0570(v15, v16, v28);
    sub_213EF2D9C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_213DAB000, v11, v12, "%s getBestUsoMediaItem: Unable to extract a USO graph from any media event", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199C53C4](v14, -1, -1);
    MEMORY[0x2199C53C4](v13, -1, -1);
  }

  sub_213EBE8B0(a1);
  swift_beginAccess();
  v17 = v32;
  if (v32 != 12)
  {
    if (qword_253F04BB0 != -1)
      swift_once();
    v30 = &type metadata for PIMSFatalError;
    v31 = sub_213E4D6F0();
    strcpy((char *)v28, "PIMSFatalError");
    HIBYTE(v28[1]) = -18;
    v29 = v17;
    sub_213EF210C();
LABEL_37:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
  }
}

_QWORD *sub_213EBFAC0(unint64_t a1)
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
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34[2];
  _QWORD v35[5];
  _QWORD *v36;
  __int128 v37;
  _QWORD v38[5];
  _QWORD v39[5];

  v37 = xmmword_213EF44B0;
  sub_213EBE084(a1);
  v3 = v2;
  v4 = type metadata accessor for PlayMediaSELFFeatures.MediaItemResults(0);
  swift_allocObject();
  v35[0] = v3;
  v5 = sub_213EF23B8();
  v6 = v5;
  if (v5)
  {
    v5 = sub_213DB196C(&qword_254D404C0, 255, type metadata accessor for PlayMediaSELFFeatures.MediaItemResults, MEMORY[0x24BEA4F80]);
  }
  else
  {
    v4 = 0;
    v38[1] = 0;
    v38[2] = 0;
  }
  v38[0] = v6;
  v38[3] = v4;
  v38[4] = v5;
  sub_213EBF4D8(a1);
  v8 = v7;
  v9 = type metadata accessor for PlayMediaSELFFeatures.RequestedMediaItem(0);
  swift_allocObject();
  v35[0] = v8;
  v10 = sub_213EF23B8();
  v11 = v10;
  if (v10)
  {
    v10 = sub_213DB196C(&qword_254D404B8, 255, type metadata accessor for PlayMediaSELFFeatures.RequestedMediaItem, MEMORY[0x24BEA4F80]);
  }
  else
  {
    v9 = 0;
    v39[1] = 0;
    v39[2] = 0;
  }
  v39[0] = v11;
  v39[3] = v9;
  v39[4] = v10;
  v36 = (_QWORD *)MEMORY[0x24BEE4AF8];
  sub_213DAFE40((uint64_t)v38, (uint64_t)v35);
  sub_213DB8444((uint64_t)v35, (uint64_t)&v31);
  if (v32)
  {
    sub_213DB0BF0(&v31, (uint64_t)v34);
    sub_213DB0BF0(v34, (uint64_t)&v31);
    v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v12 = sub_213DB59A4(0, v12[2] + 1, 1, v12);
      v36 = v12;
    }
    v14 = v12[2];
    v13 = v12[3];
    if (v14 >= v13 >> 1)
      v36 = sub_213DB59A4((_QWORD *)(v13 > 1), v14 + 1, 1, v12);
    v15 = v32;
    v16 = v33;
    v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v31, v32);
    MEMORY[0x24BDAC7A8](v17);
    v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v20 + 16))(v19);
    sub_213DB7D98(v14, (uint64_t)v19, (uint64_t *)&v36, v15, v16);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v31);
  }
  else
  {
    sub_213DAFEC4((uint64_t)&v31, &qword_253F06970);
  }
  sub_213DAFE40((uint64_t)v39, (uint64_t)v35);
  sub_213DB8444((uint64_t)v35, (uint64_t)&v31);
  if (v32)
  {
    sub_213DB0BF0(&v31, (uint64_t)v34);
    sub_213DB0BF0(v34, (uint64_t)&v31);
    v21 = v36;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v21 = sub_213DB59A4(0, v21[2] + 1, 1, v21);
      v36 = v21;
    }
    v23 = v21[2];
    v22 = v21[3];
    if (v23 >= v22 >> 1)
      v36 = sub_213DB59A4((_QWORD *)(v22 > 1), v23 + 1, 1, v21);
    v24 = v32;
    v25 = v33;
    v26 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v31, v32);
    MEMORY[0x24BDAC7A8](v26);
    v28 = (char *)&v31 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v29 + 16))(v28);
    sub_213DB7D98(v23, (uint64_t)v28, (uint64_t *)&v36, v24, v25);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v31);
  }
  else
  {
    sub_213DAFEC4((uint64_t)&v31, &qword_253F06970);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F06970);
  swift_arrayDestroy();
  return v36;
}

uint64_t sub_213EBFE98(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t i;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  id v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t k;
  id v23;
  void *v24;
  id v25;
  unint64_t v26;
  _QWORD *v27;
  _QWORD v28[2];
  char v29;
  ValueMetadata *v30;
  unint64_t v31;

  if (qword_253F04BB0 != -1)
    swift_once();
  v30 = &type metadata for PIMSProcessingState;
  v31 = sub_213E465F8();
  v28[0] = 0xD000000000000013;
  v28[1] = 0x8000000213F07FB0;
  v29 = 4;
  sub_213EF210C();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
  v2 = MEMORY[0x24BEE4AF8];
  v28[0] = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_213EF306C();
    v3 = result;
    if (result)
    {
LABEL_5:
      if (v3 < 1)
      {
        __break(1u);
        goto LABEL_53;
      }
      for (i = 0; i != v3; ++i)
      {
        if ((a1 & 0xC000000000000001) != 0)
          v6 = (id)MEMORY[0x2199C49B0](i, a1);
        else
          v6 = *(id *)(a1 + 8 * i + 32);
        v7 = v6;
        if (objc_msgSend(v6, sel_anyEventType) == 13)
        {
          sub_213EF2F58();
          sub_213EF2F88();
          sub_213EF2F94();
          sub_213EF2F64();
        }
        else
        {

        }
      }
      swift_bridgeObjectRelease();
      v8 = v28[0];
      v28[0] = v2;
      if (v8 < 0)
        goto LABEL_34;
      goto LABEL_18;
    }
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v3)
      goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  v8 = MEMORY[0x24BEE4AF8];
  v28[0] = v2;
  if ((MEMORY[0x24BEE4AF8] & 0x8000000000000000) != 0)
    goto LABEL_34;
LABEL_18:
  if ((v8 & 0x4000000000000000) != 0)
  {
LABEL_34:
    swift_retain();
    result = sub_213EF306C();
    v9 = result;
    if (!result)
      goto LABEL_35;
    goto LABEL_20;
  }
  v9 = *(_QWORD *)(v8 + 16);
  result = swift_retain();
  if (!v9)
  {
LABEL_35:
    swift_release();
    v20 = MEMORY[0x24BEE4AF8];
    goto LABEL_36;
  }
LABEL_20:
  if (v9 < 1)
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  for (j = 0; j != v9; ++j)
  {
    if ((v8 & 0xC000000000000001) != 0)
      v11 = (id)MEMORY[0x2199C49B0](j, v8);
    else
      v11 = *(id *)(v8 + 8 * j + 32);
    v12 = v11;
    v13 = objc_msgSend(v11, sel_payload);
    if (v13)
    {
      v14 = v13;
      v15 = sub_213EF1C50();
      v17 = v16;

      v18 = (void *)sub_213EF1C44();
      sub_213DF8A28(v15, v17);
    }
    else
    {
      v18 = 0;
    }
    v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE94BE8]), sel_initWithData_, v18);

    if (v19)
    {
      MEMORY[0x2199C44C4]();
      if (*(_QWORD *)((v28[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v28[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_213EF2A78();
      sub_213EF2AB4();
      sub_213EF2A54();
    }
  }
  swift_release();
  v20 = v28[0];
  v2 = MEMORY[0x24BEE4AF8];
LABEL_36:
  swift_release();
  v28[0] = v2;
  if (!(v20 >> 62))
  {
    v21 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v21)
      goto LABEL_38;
LABEL_50:
    swift_bridgeObjectRelease();
    v26 = MEMORY[0x24BEE4AF8];
LABEL_51:
    swift_bridgeObjectRelease();
    v27 = sub_213EBFAC0(v26);
    swift_bridgeObjectRelease();
    return (uint64_t)v27;
  }
  swift_bridgeObjectRetain();
  result = sub_213EF306C();
  v21 = result;
  if (!result)
    goto LABEL_50;
LABEL_38:
  if (v21 >= 1)
  {
    for (k = 0; k != v21; ++k)
    {
      if ((v20 & 0xC000000000000001) != 0)
        v23 = (id)MEMORY[0x2199C49B0](k, v20);
      else
        v23 = *(id *)(v20 + 8 * k + 32);
      v24 = v23;
      v25 = objc_msgSend(v23, sel_mediaPlayerPlaybackContextTier1);

      if (v25)
      {
        MEMORY[0x2199C44C4]();
        if (*(_QWORD *)((v28[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v28[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_213EF2A78();
        sub_213EF2AB4();
        sub_213EF2A54();
      }
    }
    swift_bridgeObjectRelease();
    v26 = v28[0];
    goto LABEL_51;
  }
LABEL_54:
  __break(1u);
  return result;
}

uint64_t sub_213EC0310(uint64_t a1, uint64_t a2)
{
  return sub_213DB196C(&qword_254D40410, a2, (uint64_t (*)(uint64_t))type metadata accessor for MediaFeatureExtractor, (uint64_t)&protocol conformance descriptor for MediaFeatureExtractor);
}

uint64_t type metadata accessor for MediaFeatureExtractor()
{
  return objc_opt_self();
}

uint64_t method lookup function for MediaFeatureExtractor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MediaFeatureExtractor.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of MediaFeatureExtractor.extract(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

unint64_t sub_213EC037C()
{
  unint64_t result;

  result = qword_254D404D0;
  if (!qword_254D404D0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254D404D0);
  }
  return result;
}

uint64_t EventStreamType.hash(into:)()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 8) <= 2uLL)
    return sub_213EF3300();
  sub_213EF3300();
  return sub_213EF28BC();
}

uint64_t EventStreamType.hashValue.getter()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_213EF32F4();
  sub_213EF3300();
  if (v1 > 2)
    sub_213EF28BC();
  return sub_213EF3330();
}

uint64_t sub_213EC04CC()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_213EF32F4();
  sub_213EF3300();
  if (v1 > 2)
    sub_213EF28BC();
  return sub_213EF3330();
}

uint64_t sub_213EC0558()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 8) <= 2uLL)
    return sub_213EF3300();
  sub_213EF3300();
  return sub_213EF28BC();
}

uint64_t sub_213EC05DC()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_213EF32F4();
  sub_213EF3300();
  if (v1 > 2)
    sub_213EF28BC();
  return sub_213EF3330();
}

uint64_t _s28SiriPrivateLearningInference15EventStreamTypeO2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  v5 = a2[1];
  if (!v3)
  {
    if (!v5)
    {
      v3 = 0;
      v6 = 1;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v3 == 1)
  {
    if (v5 == 1)
    {
      v3 = 1;
      v6 = 1;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v3 != 2)
  {
    if (v5 >= 3)
    {
      if (v2 == v4 && v3 == v5)
        v6 = 1;
      else
        v6 = sub_213EF3234();
      goto LABEL_12;
    }
LABEL_11:
    v6 = 0;
LABEL_12:
    sub_213E03404(v4, v5);
    sub_213E03404(v2, v3);
    goto LABEL_13;
  }
  if (v5 != 2)
    goto LABEL_11;
  v6 = 1;
  v3 = 2;
LABEL_13:
  sub_213DC497C(v2, v3);
  sub_213DC497C(v4, v5);
  return v6 & 1;
}

unint64_t sub_213EC0760()
{
  unint64_t result;

  result = qword_253F04AD0;
  if (!qword_253F04AD0)
  {
    result = MEMORY[0x2199C52D4](&protocol conformance descriptor for EventStreamType, &type metadata for EventStreamType);
    atomic_store(result, (unint64_t *)&qword_253F04AD0);
  }
  return result;
}

unint64_t destroy for EventStreamType(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s28SiriPrivateLearningInference15EventStreamTypeOwCP_0(uint64_t a1, uint64_t a2)
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

_QWORD *assignWithCopy for EventStreamType(_QWORD *a1, _QWORD *a2)
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

uint64_t assignWithTake for EventStreamType(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for EventStreamType(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFD && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483645);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 2;
  if (v4 >= 4)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for EventStreamType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 2;
  }
  return result;
}

uint64_t sub_213EC09B4(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_213EC09CC(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for EventStreamType()
{
  return &type metadata for EventStreamType;
}

uint64_t AsyncEventStream.init<A>(sequence:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F04F00);
  v8 = sub_213EF2B80();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v13 - v10;
  sub_213EC0BB4(a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a4, v11, v8);
}

uint64_t AsyncEventStream.makeAsyncIterator()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F04F00);
  v2 = sub_213EF2B68();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v7 - v3;
  sub_213EF2B80();
  sub_213EF2B50();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F04F00);
  v5 = sub_213EF2B68();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, v4, v5);
}

uint64_t sub_213EC0BB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v14;

  v3 = v2;
  v6 = *(_QWORD *)(a1 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](a1);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  sub_213EF2D6C();
  v9 = swift_allocBox();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(v10, 1, 1, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a1);
  v11 = (*(unsigned __int8 *)(v6 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v12 = (char *)swift_allocObject();
  *((_QWORD *)v12 + 2) = a1;
  *((_QWORD *)v12 + 3) = a2;
  *((_QWORD *)v12 + 4) = v9;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v12[v11], (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  swift_getAssociatedTypeWitness();
  return sub_213EF2B74();
}

uint64_t sub_213EC0D08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F04F00);
  v4 = sub_213EF2B68();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
}

uint64_t AsyncEventStream.AsyncIterator.next()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F04F00);
  sub_213EF2B68();
  *v1 = v0;
  v1[1] = sub_213E4141C;
  return sub_213EF2B5C();
}

uint64_t sub_213EC0DF8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_213E5EDA8;
  return AsyncEventStream.AsyncIterator.next()();
}

void sub_213EC0E58()
{
  JUMPOUT(0x2199C52D4);
}

uint64_t sub_213EC0E68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  AsyncEventStream.makeAsyncIterator()(a2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v2, a1);
}

uint64_t sub_213EC0E98()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_213EC0EA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_213EC0F3C(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE6D28]);
}

uint64_t sub_213EC0EAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_213EC0FDC(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE6D28]);
}

uint64_t sub_213EC0EB8(uint64_t a1, uint64_t a2)
{
  return sub_213EC1050(a1, a2, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE6D28]);
}

uint64_t sub_213EC0EC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_213EC10BC(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE6D28]);
}

uint64_t sub_213EC0ED0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_213EC1138(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE6D28]);
}

uint64_t sub_213EC0EDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_213EC11B4(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE6D28]);
}

uint64_t sub_213EC0EE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_213EC1230(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE6D28]);
}

uint64_t sub_213EC0EF4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_213EC0F00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE6D28]);
}

uint64_t sub_213EC0F0C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_213EC0F18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE6D28]);
}

uint64_t type metadata accessor for AsyncEventStream(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AsyncEventStream);
}

uint64_t sub_213EC0F30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_213EC0F3C(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE6D08]);
}

uint64_t sub_213EC0F3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, _QWORD))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  unint64_t v8;

  v5 = *(_QWORD *)(a1 + 16);
  v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F04F00);
  result = a4(319, v5, v6, MEMORY[0x24BEE3F20]);
  if (v8 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_213EC0FD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_213EC0FDC(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE6D08]);
}

uint64_t sub_213EC0FDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t, uint64_t, _QWORD))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = *(_QWORD *)(a3 + 16);
  v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F04F00);
  v9 = a4(0, v7, v8, MEMORY[0x24BEE3F20]);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v9 - 8))(a1, a2, v9);
}

uint64_t sub_213EC1044(uint64_t a1, uint64_t a2)
{
  return sub_213EC1050(a1, a2, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE6D08]);
}

uint64_t sub_213EC1050(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD, uint64_t, uint64_t, _QWORD))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_QWORD *)(a2 + 16);
  v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F04F00);
  v7 = a3(0, v5, v6, MEMORY[0x24BEE3F20]);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
}

uint64_t sub_213EC10B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_213EC10BC(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE6D08]);
}

uint64_t sub_213EC10BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t, uint64_t, _QWORD))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = *(_QWORD *)(a3 + 16);
  v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F04F00);
  v9 = a4(0, v7, v8, MEMORY[0x24BEE3F20]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
  return a1;
}

uint64_t sub_213EC112C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_213EC1138(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE6D08]);
}

uint64_t sub_213EC1138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t, uint64_t, _QWORD))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = *(_QWORD *)(a3 + 16);
  v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F04F00);
  v9 = a4(0, v7, v8, MEMORY[0x24BEE3F20]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(a1, a2, v9);
  return a1;
}

uint64_t sub_213EC11A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_213EC11B4(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE6D08]);
}

uint64_t sub_213EC11B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t, uint64_t, _QWORD))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = *(_QWORD *)(a3 + 16);
  v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F04F00);
  v9 = a4(0, v7, v8, MEMORY[0x24BEE3F20]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
  return a1;
}

uint64_t sub_213EC1224(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_213EC1230(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE6D08]);
}

uint64_t sub_213EC1230(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t, uint64_t, _QWORD))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = *(_QWORD *)(a3 + 16);
  v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F04F00);
  v9 = a4(0, v7, v8, MEMORY[0x24BEE3F20]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(a1, a2, v9);
  return a1;
}

uint64_t sub_213EC12A0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_213EC12AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE6D08]);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t, uint64_t, _QWORD))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = *(_QWORD *)(a3 + 16);
  v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F04F00);
  v9 = a4(0, v7, v8, MEMORY[0x24BEE3F20]);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(a1, a2, v9);
}

uint64_t sub_213EC1320()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_213EC132C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE6D08]);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, uint64_t, uint64_t, _QWORD))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = *(_QWORD *)(a4 + 16);
  v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F04F00);
  v10 = a5(0, v8, v9, MEMORY[0x24BEE3F20]);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(a1, a2, a2, v10);
}

uint64_t type metadata accessor for AsyncEventStream.AsyncIterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AsyncEventStream.AsyncIterator);
}

uint64_t sub_213EC13B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[13] = a4;
  v5[14] = a5;
  v5[11] = a1;
  v5[12] = a3;
  v5[15] = *(_QWORD *)(a4 - 8);
  v5[16] = swift_task_alloc();
  v5[17] = swift_getAssociatedTypeWitness();
  v6 = sub_213EF2D6C();
  v5[18] = v6;
  v5[19] = *(_QWORD *)(v6 - 8);
  v5[20] = swift_task_alloc();
  v5[21] = swift_task_alloc();
  v5[22] = swift_projectBox();
  return swift_task_switch();
}

uint64_t sub_213EC1488()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t AssociatedTypeWitness;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;

  v2 = *(_QWORD *)(v0 + 168);
  v1 = *(_QWORD *)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 144);
  v4 = *(_QWORD *)(v0 + 152);
  v5 = *(_QWORD *)(v0 + 136);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v3);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  LODWORD(v1) = v7(v2, 1, v5);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  if ((_DWORD)v1 == 1)
  {
    v8 = *(_QWORD *)(v0 + 176);
    v9 = *(_QWORD *)(v0 + 160);
    v17 = *(_QWORD *)(v0 + 152);
    v10 = *(_QWORD *)(v0 + 136);
    v18 = *(_QWORD *)(v0 + 144);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 120) + 16))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 104));
    sub_213EF2B44();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v6 + 56))(v9, 0, 1, v10);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 40))(v8, v9, v18);
  }
  v11 = *(_QWORD *)(v0 + 176);
  v12 = *(_QWORD *)(v0 + 136);
  swift_beginAccess();
  if (v7(v11, 1, v12))
  {
    v13 = *(_QWORD *)(v0 + 88);
    swift_endAccess();
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(v13, 1, 1, AssociatedTypeWitness);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    swift_getAssociatedConformanceWitness();
    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 184) = v16;
    *v16 = v0;
    v16[1] = sub_213EC16DC;
    return sub_213EF2B20();
  }
}

uint64_t sub_213EC16DC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 192) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_213EC1770()
{
  uint64_t v0;

  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213EC17CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_213EC1838(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80);
  v7 = v1[4];
  v8 = (uint64_t)v1 + ((v6 + 40) & ~v6);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_213E4141C;
  return sub_213EC13B0(a1, v7, v8, v4, v5);
}

ValueMetadata *type metadata accessor for ScoreRoundingModifier()
{
  return &type metadata for ScoreRoundingModifier;
}

double sub_213EC18D4(double a1, double a2)
{
  uint64_t *v2;
  double v4;

  v4 = __exp10((double)(*v2 & ~(*v2 >> 63)));
  return round(v4 * a2) / v4;
}

unint64_t sub_213EC1914(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  int v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  int64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  int64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD v63[4];
  uint64_t v64;
  _OWORD v65[3];
  __int16 v66;
  uint64_t v67;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v3 = a1;
    v67 = MEMORY[0x24BEE4AF8];
    sub_213DCD37C(0, v1, 0);
    v4 = v67;
    result = sub_213EA6F20(v3);
    v7 = 0;
    v8 = v3 + 64;
    v9 = *(_BYTE *)(v3 + 32);
    v48 = v3 + 64;
    v49 = v3 + 80;
    v45 = v3;
    v46 = v1;
    v47 = v6;
    while ((result & 0x8000000000000000) == 0 && (uint64_t)result < 1 << v9)
    {
      if ((*(_QWORD *)(v8 + 8 * (result >> 6)) & (1 << result)) == 0)
        goto LABEL_36;
      if (*(_DWORD *)(v3 + 36) != v6)
        goto LABEL_37;
      v51 = 1 << result;
      v52 = result >> 6;
      v50 = v7;
      v55 = result;
      v56 = v4;
      v54 = *(_BYTE *)(*(_QWORD *)(v3 + 48) + result);
      v12 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * result);
      v13 = *(_QWORD *)(v12 + 16);
      v53 = v12;
      if (v13)
      {
        v63[0] = v2;
        swift_bridgeObjectRetain();
        sub_213DCD398(0, v13, 0);
        v2 = v63[0];
        v14 = type metadata accessor for MediaFeedbackGroundTruth();
        v15 = *(_QWORD *)(v14 - 8);
        v57 = *(_QWORD *)(v15 + 72);
        v58 = v14;
        v16 = v12 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80)) + 24;
        do
        {
          v17 = v16 + *(int *)(v58 + 28);
          v61 = *(_QWORD *)(v17 - 24);
          v19 = *(_QWORD *)(v17 - 8);
          v18 = *(_QWORD *)v17;
          v21 = *(_QWORD *)(v17 + 8);
          v20 = *(_QWORD *)(v17 + 16);
          v59 = *(_BYTE *)(v17 + 25);
          v60 = *(_BYTE *)(v17 + 24);
          v62 = *(_QWORD *)(v17 - 16);
          swift_bridgeObjectRetain();
          sub_213DB8518(v19, v18);
          v63[0] = v2;
          v23 = *(_QWORD *)(v2 + 16);
          v22 = *(_QWORD *)(v2 + 24);
          v24 = v23 + 1;
          if (v23 >= v22 >> 1)
          {
            sub_213DCD398(v22 > 1, v23 + 1, 1);
            v2 = v63[0];
          }
          v16 += v57;
          *(_QWORD *)(v2 + 16) = v24;
          v25 = v2 + 56 * v23;
          *(_QWORD *)(v25 + 32) = v61;
          *(_QWORD *)(v25 + 40) = v62;
          *(_QWORD *)(v25 + 48) = v19;
          *(_QWORD *)(v25 + 56) = v18;
          *(_QWORD *)(v25 + 64) = v21;
          *(_QWORD *)(v25 + 72) = v20;
          *(_BYTE *)(v25 + 80) = v60;
          *(_BYTE *)(v25 + 81) = v59;
          --v13;
        }
        while (v13);
        v26 = MEMORY[0x24BEE4AF8];
        v3 = v45;
      }
      else
      {
        swift_bridgeObjectRetain();
        v24 = *(_QWORD *)(v2 + 16);
        v26 = v2;
      }
      sub_213DDF80C();
      v64 = sub_213EF2BB0();
      if (v24)
      {
        v27 = (__int128 *)(v2 + 32);
        do
        {
          v28 = *v27;
          v29 = v27[1];
          v30 = v27[2];
          v66 = *((_WORD *)v27 + 24);
          v65[1] = v29;
          v65[2] = v30;
          v65[0] = v28;
          sub_213DDF850((uint64_t)v65);
          sub_213DD6684((uint64_t)v63, (uint64_t)v65);
          v31 = v63[2];
          v32 = v63[3];
          swift_bridgeObjectRelease();
          sub_213DB859C(v31, v32);
          v27 = (__int128 *)((char *)v27 + 56);
          --v24;
        }
        while (v24);
      }
      swift_bridgeObjectRelease();
      v33 = *(_QWORD *)(v53 + 16);
      v34 = *(_QWORD *)(v64 + 16);
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      v4 = v56;
      v67 = v56;
      v36 = *(_QWORD *)(v56 + 16);
      v35 = *(_QWORD *)(v56 + 24);
      if (v36 >= v35 >> 1)
      {
        result = sub_213DCD37C(v35 > 1, v36 + 1, 1);
        v4 = v67;
      }
      *(_QWORD *)(v4 + 16) = v36 + 1;
      v37 = v4 + 24 * v36;
      *(_BYTE *)(v37 + 32) = v54 | 0x80;
      *(_QWORD *)(v37 + 40) = v33;
      *(_QWORD *)(v37 + 48) = v34;
      v9 = *(_BYTE *)(v3 + 32);
      v10 = 1 << v9;
      if (v55 >= 1 << v9)
        goto LABEL_38;
      v8 = v48;
      v38 = v52;
      v39 = *(_QWORD *)(v48 + 8 * v52);
      if ((v39 & v51) == 0)
        goto LABEL_39;
      v6 = v47;
      if (*(_DWORD *)(v3 + 36) != v47)
        goto LABEL_40;
      v40 = v39 & (-2 << (v55 & 0x3F));
      if (v40)
      {
        v10 = __clz(__rbit64(v40)) | v55 & 0xFFFFFFFFFFFFFFC0;
        v11 = v50;
        v41 = v46;
        v2 = v26;
      }
      else
      {
        v42 = v52 + 1;
        v43 = (v10 + 63) >> 6;
        v41 = v46;
        v2 = v26;
        if (v52 + 1 < v43)
        {
          v44 = *(_QWORD *)(v48 + 8 * v42);
          if (v44)
          {
LABEL_3:
            v10 = __clz(__rbit64(v44)) + (v42 << 6);
          }
          else
          {
            while (v43 - 2 != v38)
            {
              v44 = *(_QWORD *)(v49 + 8 * v38++);
              if (v44)
              {
                v42 = v38 + 1;
                goto LABEL_3;
              }
            }
          }
        }
        v11 = v50;
      }
      v7 = v11 + 1;
      result = v10;
      if (v7 == v41)
        return v4;
    }
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t sub_213EC1D3C()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (v0[7])
  {
    v1 = v0[7];
  }
  else
  {
    v2 = v0;
    v3 = v0 + 2;
    v4 = v0[5];
    v5 = v2[6];
    __swift_project_boxed_opaque_existential_1(v3, v4);
    v6 = type metadata accessor for MediaGroundTruth();
    v7 = sub_213DB0DB4((unint64_t *)&qword_254D3F510, (uint64_t (*)(uint64_t))type metadata accessor for MediaGroundTruth, (uint64_t)&protocol conformance descriptor for MediaGroundTruth);
    v1 = InferredGroundTruthStore.readTypedGroundTruth<A>(_:)(v6, v4, v6, v5, v7);
    v2[7] = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_213EC1DF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if (*(_QWORD *)(v0 + 64))
  {
    v1 = *(_QWORD *)(v0 + 64);
  }
  else
  {
    v2 = sub_213EC1D3C();
    v1 = sub_213EC2440(v2, (uint64_t (*)(_QWORD))type metadata accessor for MediaGroundTruth, (void (*)(void))sub_213DFF0A8, &qword_254D3A628, (uint64_t (*)(BOOL, uint64_t, uint64_t, uint64_t))sub_213DB6494);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 64) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_213EC1E90()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (v0[9])
  {
    v1 = v0[9];
  }
  else
  {
    v2 = v0;
    v3 = v0 + 2;
    v4 = v0[5];
    v5 = v2[6];
    __swift_project_boxed_opaque_existential_1(v3, v4);
    v6 = type metadata accessor for MediaFeedbackGroundTruth();
    v7 = sub_213DB0DB4((unint64_t *)&qword_254D3D138, (uint64_t (*)(uint64_t))type metadata accessor for MediaFeedbackGroundTruth, (uint64_t)&protocol conformance descriptor for MediaFeedbackGroundTruth);
    v1 = InferredGroundTruthStore.readTypedGroundTruth<A>(_:)(v6, v4, v6, v5, v7);
    v2[9] = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_213EC1F4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if (*(_QWORD *)(v0 + 80))
  {
    v1 = *(_QWORD *)(v0 + 80);
  }
  else
  {
    v2 = sub_213EC1E90();
    v1 = sub_213EC2440(v2, (uint64_t (*)(_QWORD))type metadata accessor for MediaFeedbackGroundTruth, (void (*)(void))sub_213DFF0B4, &qword_254D3A620, (uint64_t (*)(BOOL, uint64_t, uint64_t, uint64_t))sub_213DB65CC);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 80) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_213EC1FE4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  swift_retain();
  v2 = sub_213EC1DF8();
  if (*(_QWORD *)(v2 + 16) && (v3 = sub_213DFA3F0(a1), (v4 & 1) != 0))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v3);
    swift_bridgeObjectRetain();
  }
  else
  {
    v5 = MEMORY[0x24BEE4AF8];
  }
  swift_release();
  swift_bridgeObjectRelease();
  swift_retain();
  if (*(_QWORD *)(sub_213EC1F4C() + 16))
  {
    sub_213DFA3F0(a1);
    if ((v6 & 1) != 0)
      swift_bridgeObjectRetain();
  }
  swift_release();
  swift_bridgeObjectRelease();
  v7 = sub_213DED108(v5);
  v8 = swift_bridgeObjectRetain();
  v9 = sub_213EC2184(v8);
  swift_bridgeObjectRelease();
  v10 = sub_213EC1914(v9);
  swift_bridgeObjectRelease();
  sub_213DB53EC(v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_213EC2120()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MediaGroundTruthSummarizer()
{
  return objc_opt_self();
}

uint64_t sub_213EC2184(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  unint64_t v19;
  uint64_t v20;
  _BOOL8 v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  unint64_t v27;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t result;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;

  v2 = type metadata accessor for MediaFeedbackGroundTruth();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v43 = (uint64_t)&v36 - v7;
  v8 = (_QWORD *)MEMORY[0x24BEE4B00];
  v44 = (_QWORD *)MEMORY[0x24BEE4B00];
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
    return (uint64_t)v8;
  v10 = *(unsigned __int8 *)(v6 + 80);
  v11 = (v10 + 32) & ~v10;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v6 + 72);
  v42 = v11;
  v38 = v10 | 7;
  v39 = v13 + v11;
  v37 = xmmword_213EF53E0;
  v40 = v4;
  v41 = v2;
  while (1)
  {
    v16 = v43;
    sub_213DCA7E4(v12, v43, (uint64_t (*)(_QWORD))type metadata accessor for MediaFeedbackGroundTruth);
    v17 = *(unsigned __int8 *)(v16 + *(int *)(v2 + 20));
    v19 = sub_213DFA578(v17);
    v20 = v8[2];
    v21 = (v18 & 1) == 0;
    v22 = v20 + v21;
    if (__OFADD__(v20, v21))
      break;
    v23 = v18;
    if (v8[3] < v22)
    {
      sub_213DFBF4C(v22, 1);
      v8 = v44;
      v24 = sub_213DFA578(v17);
      if ((v23 & 1) != (v25 & 1))
        goto LABEL_19;
      v19 = v24;
    }
    if ((v23 & 1) != 0)
    {
      v26 = v8[7];
      sub_213DBB430(v43, (uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for MediaFeedbackGroundTruth);
      v27 = *(_QWORD *)(v26 + 8 * v19);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)(v26 + 8 * v19) = v27;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v27 = sub_213DB65CC(0, *(_QWORD *)(v27 + 16) + 1, 1, v27);
        *(_QWORD *)(v26 + 8 * v19) = v27;
      }
      v30 = *(_QWORD *)(v27 + 16);
      v29 = *(_QWORD *)(v27 + 24);
      if (v30 >= v29 >> 1)
      {
        v27 = sub_213DB65CC(v29 > 1, v30 + 1, 1, v27);
        *(_QWORD *)(v26 + 8 * v19) = v27;
      }
      v2 = v41;
      v14 = v42;
      *(_QWORD *)(v27 + 16) = v30 + 1;
      v15 = v27 + v14 + v30 * v13;
      v4 = v40;
      sub_213DBB430((uint64_t)v40, v15, (uint64_t (*)(_QWORD))type metadata accessor for MediaFeedbackGroundTruth);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D3A620);
      v31 = swift_allocObject();
      *(_OWORD *)(v31 + 16) = v37;
      sub_213DBB430(v43, v31 + v42, (uint64_t (*)(_QWORD))type metadata accessor for MediaFeedbackGroundTruth);
      v8[(v19 >> 6) + 8] |= 1 << v19;
      *(_BYTE *)(v8[6] + v19) = v17;
      *(_QWORD *)(v8[7] + 8 * v19) = v31;
      v32 = v8[2];
      v33 = __OFADD__(v32, 1);
      v34 = v32 + 1;
      if (v33)
        goto LABEL_18;
      v8[2] = v34;
    }
    v12 += v13;
    if (!--v9)
      return (uint64_t)v8;
  }
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  result = sub_213EF3288();
  __break(1u);
  return result;
}

uint64_t sub_213EC2440(uint64_t a1, uint64_t (*a2)(_QWORD), void (*a3)(void), uint64_t *a4, uint64_t (*a5)(BOOL, uint64_t, uint64_t, uint64_t))
{
  uint64_t (*v6)(_QWORD);
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
  char v21;
  unint64_t v22;
  uint64_t v23;
  _BOOL8 v24;
  char v25;
  unint64_t v26;
  char v27;
  uint64_t (*v28)(_QWORD);
  uint64_t v29;
  uint64_t v30;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t result;
  uint64_t (*v39)(BOOL, uint64_t, uint64_t, uint64_t);
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(_QWORD);
  void (*v44)(void);
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;

  v44 = a3;
  v45 = a4;
  v6 = a2;
  v48 = a2(0);
  MEMORY[0x24BDAC7A8](v48);
  v47 = (uint64_t)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v49 = (uint64_t)&v39 - v11;
  v12 = (_QWORD *)MEMORY[0x24BEE4B00];
  v50 = (_QWORD *)MEMORY[0x24BEE4B00];
  v13 = *(_QWORD *)(a1 + 16);
  if (!v13)
    return (uint64_t)v12;
  v39 = a5;
  v14 = *(unsigned __int8 *)(v10 + 80);
  v15 = (v14 + 32) & ~v14;
  v16 = a1 + v15;
  v17 = *(_QWORD *)(v10 + 72);
  v46 = v15;
  v41 = v14 | 7;
  v42 = v17 + v15;
  v40 = xmmword_213EF53E0;
  v43 = v6;
  while (1)
  {
    v18 = v49;
    sub_213DCA7E4(v16, v49, v6);
    v19 = *(_QWORD *)(v18 + *(int *)(v48 + 24));
    v20 = swift_retain();
    v22 = sub_213DFA3F0(v20);
    v23 = v12[2];
    v24 = (v21 & 1) == 0;
    if (__OFADD__(v23, v24))
      break;
    v25 = v21;
    if (v12[3] < v23 + v24)
    {
      v44();
      v12 = v50;
      v26 = sub_213DFA3F0(v19);
      if ((v25 & 1) != (v27 & 1))
        goto LABEL_19;
      v22 = v26;
    }
    if ((v25 & 1) != 0)
    {
      swift_release();
      v28 = v6;
      v29 = v12[7];
      sub_213DBB430(v49, v47, v28);
      v30 = *(_QWORD *)(v29 + 8 * v22);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)(v29 + 8 * v22) = v30;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v30 = v39(0, *(_QWORD *)(v30 + 16) + 1, 1, v30);
        *(_QWORD *)(v29 + 8 * v22) = v30;
      }
      v33 = *(_QWORD *)(v30 + 16);
      v32 = *(_QWORD *)(v30 + 24);
      if (v33 >= v32 >> 1)
      {
        v30 = v39(v32 > 1, v33 + 1, 1, v30);
        *(_QWORD *)(v29 + 8 * v22) = v30;
      }
      *(_QWORD *)(v30 + 16) = v33 + 1;
      v6 = v43;
      sub_213DBB430(v47, v30 + v46 + v33 * v17, v43);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(v45);
      v34 = swift_allocObject();
      *(_OWORD *)(v34 + 16) = v40;
      sub_213DBB430(v49, v34 + v46, v6);
      v12[(v22 >> 6) + 8] |= 1 << v22;
      *(_QWORD *)(v12[6] + 8 * v22) = v19;
      *(_QWORD *)(v12[7] + 8 * v22) = v34;
      v35 = v12[2];
      v36 = __OFADD__(v35, 1);
      v37 = v35 + 1;
      if (v36)
        goto LABEL_18;
      v12[2] = v37;
    }
    v16 += v17;
    if (!--v13)
      return (uint64_t)v12;
  }
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  sub_213EF1ED8();
  result = sub_213EF3288();
  __break(1u);
  return result;
}

uint64_t sub_213EC2714(void (*a1)(id *), uint64_t a2, unint64_t a3, uint64_t a4)
{
  return sub_213EC275C(a1, a2, a3, a4, &qword_254D3A738, (unint64_t)sub_213DCD628);
}

uint64_t sub_213EC2738(void (*a1)(id *), uint64_t a2, unint64_t a3, uint64_t a4)
{
  return sub_213EC275C(a1, a2, a3, a4, &qword_253F06920, (unint64_t)sub_213DCD6B8);
}

uint64_t sub_213EC275C(void (*a1)(id *), uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  id v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void (*v22)(BOOL, unint64_t, uint64_t);
  unint64_t v23;
  unint64_t v24;
  uint64_t *v25;
  void (*v26)(id *);
  uint64_t v27;
  id v28;
  uint64_t v29;

  v8 = v6;
  v26 = a1;
  v27 = a2;
  v25 = a5;
  v10 = __swift_instantiateConcreteTypeFromMangledName(a5);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3 >> 62)
    goto LABEL_18;
  v14 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v15 = MEMORY[0x24BEE4AF8];
    if (!v14)
      return v15;
    v29 = MEMORY[0x24BEE4AF8];
    result = ((uint64_t (*)(_QWORD, uint64_t, _QWORD))a6)(0, v14 & ~(v14 >> 63), 0);
    if (v14 < 0)
      break;
    v22 = (void (*)(BOOL, unint64_t, uint64_t))a6;
    v23 = a3;
    v17 = 0;
    v15 = v29;
    v24 = a3 & 0xC000000000000001;
    while (v14 != v17)
    {
      if (v24)
        v18 = (id)MEMORY[0x2199C49B0](v17, a3);
      else
        v18 = *(id *)(a3 + 8 * v17 + 32);
      v19 = v18;
      v28 = v18;
      v26(&v28);
      if (v8)
      {
        swift_release();

        return v15;
      }
      v8 = 0;

      v29 = v15;
      a6 = *(_QWORD *)(v15 + 16);
      v20 = *(_QWORD *)(v15 + 24);
      if (a6 >= v20 >> 1)
      {
        v22(v20 > 1, a6 + 1, 1);
        v15 = v29;
      }
      ++v17;
      *(_QWORD *)(v15 + 16) = a6 + 1;
      sub_213DC0630((uint64_t)v13, v15+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(_QWORD *)(v11 + 72) * a6, v25);
      a3 = v23;
      if (v14 == v17)
        return v15;
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    v14 = sub_213EF306C();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_213EC2944(void (*a1)(__int128 *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  unint64_t v13;
  unint64_t v14;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v4 = v3;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = MEMORY[0x24BEE4AF8];
  if (v5)
  {
    v18 = MEMORY[0x24BEE4AF8];
    sub_213DCD73C(0, v5, 0);
    v6 = v18;
    v9 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F04828) - 8);
    v10 = a3 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    v11 = *(_QWORD *)(v9 + 72);
    while (1)
    {
      a1(&v17, v10);
      if (v4)
        break;
      v4 = 0;
      v12 = v17;
      v18 = v6;
      v14 = *(_QWORD *)(v6 + 16);
      v13 = *(_QWORD *)(v6 + 24);
      if (v14 >= v13 >> 1)
      {
        v16 = v17;
        sub_213DCD73C(v13 > 1, v14 + 1, 1);
        v12 = v16;
        v6 = v18;
      }
      *(_QWORD *)(v6 + 16) = v14 + 1;
      *(_OWORD *)(v6 + 16 * v14 + 32) = v12;
      v10 += v11;
      if (!--v5)
        return v6;
    }
    swift_release();
  }
  return v6;
}

uint64_t sub_213EC2A70(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;

  v4 = v3;
  v19 = a1;
  v20 = a2;
  v6 = type metadata accessor for ContactSuggestionProvidedClassification();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(a3 + 16);
  v11 = MEMORY[0x24BEE4AF8];
  if (v10)
  {
    v21 = MEMORY[0x24BEE4AF8];
    sub_213DCD794(0, v10, 0);
    v11 = v21;
    v12 = *(_QWORD *)(type metadata accessor for PlusContactSuggestionRuntimeSummary(0) - 8);
    v13 = a3 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
    v18 = *(_QWORD *)(v12 + 72);
    while (1)
    {
      v19(v13);
      if (v4)
        break;
      v4 = 0;
      v21 = v11;
      v15 = *(_QWORD *)(v11 + 16);
      v14 = *(_QWORD *)(v11 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_213DCD794(v14 > 1, v15 + 1, 1);
        v11 = v21;
      }
      *(_QWORD *)(v11 + 16) = v15 + 1;
      sub_213EC56E4((uint64_t)v9, v11+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v15);
      v13 += v18;
      if (!--v10)
        return v11;
    }
    swift_release();
  }
  return v11;
}

uint64_t sub_213EC2BDC(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;

  v4 = v3;
  v19 = a1;
  v20 = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D3AF78);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(a3 + 16);
  v11 = MEMORY[0x24BEE4AF8];
  if (v10)
  {
    v21 = MEMORY[0x24BEE4AF8];
    sub_213DCD834(0, v10, 0);
    v11 = v21;
    v12 = *(_QWORD *)(sub_213EF1D64() - 8);
    v13 = a3 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
    v18 = *(_QWORD *)(v12 + 72);
    while (1)
    {
      v19(v13);
      if (v4)
        break;
      v4 = 0;
      v21 = v11;
      v15 = *(_QWORD *)(v11 + 16);
      v14 = *(_QWORD *)(v11 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_213DCD834(v14 > 1, v15 + 1, 1);
        v11 = v21;
      }
      *(_QWORD *)(v11 + 16) = v15 + 1;
      sub_213DC0630((uint64_t)v9, v11+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v15, &qword_254D3AF78);
      v13 += v18;
      if (!--v10)
        return v11;
    }
    swift_release();
  }
  return v11;
}

uint64_t PimsRuntimeLogging.notifyOnComplete()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_213EC2D70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v2;
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 16);
  *(_QWORD *)(v2 + 32) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v3;
  *v3 = v0;
  v3[1] = sub_213EC2E10;
  return sub_213EF3210();
}

uint64_t sub_213EC2E10()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_213EC2E6C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213EC2E74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D40738);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  v10 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v11 + v10, (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  (*(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(a4 + 24))(sub_213EC56A4, v11, a3, a4);
  return swift_release();
}

uint64_t sub_213EC2F6C(uint64_t a1)
{
  uint64_t *v1;

  return sub_213EC2E74(a1, v1[4], v1[2], v1[3]);
}

uint64_t getPimsRuntimeLogger()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = type metadata accessor for PimsRuntimeLogger();
  v3 = swift_allocObject();
  result = sub_213EC30F0();
  a1[3] = v2;
  a1[4] = (uint64_t)&off_24D109760;
  *a1 = v3;
  return result;
}

uint64_t type metadata accessor for PimsRuntimeLogger()
{
  return objc_opt_self();
}

uint64_t getTestablePimsRuntimeLogger(store:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  _BYTE v16[40];

  v4 = sub_213EF2574();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  MEMORY[0x24BDAC7A8](v6);
  v10 = &v16[-v9 - 8];
  sub_213EF2568();
  sub_213DAFDFC(a1, (uint64_t)v16);
  v11 = type metadata accessor for PimsRuntimeLogger();
  v12 = swift_allocObject();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 16))(v8, v10, v4);
  v13 = sub_213EC4E60((uint64_t)v8, (uint64_t)v16, v12);
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v10, v4);
  a2[3] = v11;
  a2[4] = (uint64_t)&off_24D109760;
  *a2 = v13;
  return result;
}

uint64_t sub_213EC30F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];

  v1 = v0;
  v2 = sub_213EF2D00();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_213EF2CF4();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v6);
  v8 = sub_213EF2760();
  MEMORY[0x24BDAC7A8](v8);
  v11[0] = sub_213EC52F4();
  sub_213EF2748();
  v11[1] = MEMORY[0x24BEE4AF8];
  sub_213DB0DB4(&qword_254D40720, v7, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D40728);
  sub_213EC5600(&qword_254D40730, &qword_254D40728);
  sub_213EF2E08();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE5750], v2);
  *(_QWORD *)(v0 + 24) = sub_213EF2D18();
  *(_QWORD *)(v0 + 32) = dispatch_group_create();
  type metadata accessor for PimsRuntimeLoggerSynchronous();
  v9 = swift_allocObject();
  sub_213EC3E08();
  *(_QWORD *)(v1 + 16) = v9;
  return v1;
}

uint64_t sub_213EC32D4(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
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
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void (*v25)(unint64_t, char *, uint64_t);
  uint64_t v26;
  void *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD aBlock[7];

  v40 = a3;
  v37 = a1;
  v44 = sub_213EF2730();
  v47 = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v43 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_213EF2760();
  v45 = *(_QWORD *)(v6 - 8);
  v46 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v41 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_213EF1D64();
  v9 = *(_QWORD *)(v8 - 8);
  v33 = v8;
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v34 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_213EF2460();
  v32 = *(_QWORD *)(v11 - 8);
  v35 = v11;
  v12 = *(_QWORD *)(v32 + 64);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v32 - v15;
  v36 = *a2;
  v42 = (char *)&v32 - v15;
  sub_213EF2454();
  v17 = *(_QWORD *)(v3 + 24);
  v38 = *(_QWORD *)(v3 + 32);
  v39 = v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v37, v8);
  v18 = v32;
  (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v14, v16, v11);
  v19 = (*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v20 = v19 + v10;
  v21 = (*(unsigned __int8 *)(v18 + 80) + (v20 & 0xFFFFFFFFFFFFFFF8) + 16) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = v3;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v22 + v19, v34, v33);
  *(_BYTE *)(v22 + v20) = v36;
  *(_QWORD *)((v20 & 0xFFFFFFFFFFFFFFF8) + v22 + 8) = v40;
  v23 = v22 + v21;
  v24 = v18;
  v25 = *(void (**)(unint64_t, char *, uint64_t))(v18 + 32);
  v26 = v35;
  v25(v23, v14, v35);
  aBlock[4] = sub_213EC5580;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_213EC36AC;
  aBlock[3] = &block_descriptor_13_0;
  v27 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  v28 = v41;
  sub_213EF2754();
  v48 = MEMORY[0x24BEE4AF8];
  sub_213DB0DB4(&qword_254D40708, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D40710);
  sub_213EC5600(&qword_254D40718, &qword_254D40710);
  v30 = v43;
  v29 = v44;
  sub_213EF2E08();
  MEMORY[0x2199C47AC](v38, v28, v30, v27);
  _Block_release(v27);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v30, v29);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v28, v46);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v42, v26);
  return swift_release();
}

uint64_t sub_213EC364C(uint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4, uint64_t a5)
{
  unsigned __int8 v9;

  v9 = a3;
  swift_retain();
  sub_213EC3ECC(a2, &v9, a4, a5);
  return swift_release();
}

uint64_t sub_213EC36B0(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD aBlock[7];

  v3 = v2;
  v33 = a2;
  v31 = a1;
  v38 = sub_213EF2730();
  v41 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  v37 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_213EF2760();
  v39 = *(_QWORD *)(v5 - 8);
  v40 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v35 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_213EF1D64();
  v8 = *(_QWORD *)(v7 - 8);
  v30 = v7;
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_213EF2460();
  v28 = *(_QWORD *)(v11 - 8);
  v12 = *(_QWORD *)(v28 + 64);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v28 - v15;
  v36 = (char *)&v28 - v15;
  sub_213EF2454();
  v34 = *(_QWORD *)(v2 + 24);
  v32 = *(_QWORD *)(v2 + 32);
  v29 = v2;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v31, v7);
  v17 = v28;
  v18 = v11;
  (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v14, v16, v11);
  v19 = (*(unsigned __int8 *)(v8 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v20 = (v9 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  v21 = (*(unsigned __int8 *)(v17 + 80) + v20 + 8) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = v3;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v22 + v19, v10, v30);
  *(_QWORD *)(v22 + v20) = v33;
  (*(void (**)(unint64_t, char *, uint64_t))(v17 + 32))(v22 + v21, v14, v18);
  aBlock[4] = sub_213EC543C;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_213EC36AC;
  aBlock[3] = &block_descriptor_7;
  v23 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  v24 = v35;
  sub_213EF2754();
  v42 = MEMORY[0x24BEE4AF8];
  sub_213DB0DB4(&qword_254D40708, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D40710);
  sub_213EC5600(&qword_254D40718, &qword_254D40710);
  v26 = v37;
  v25 = v38;
  sub_213EF2E08();
  MEMORY[0x2199C47AC](v32, v24, v26, v23);
  _Block_release(v23);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v26, v25);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v24, v40);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v36, v18);
  return swift_release();
}

uint64_t sub_213EC3A08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_retain();
  sub_213EC4514(a2, a3, a4);
  return swift_release();
}

uint64_t sub_213EC3A58(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD aBlock[6];

  v5 = sub_213EF2730();
  v22 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_213EF2760();
  v20 = *(_QWORD *)(v8 - 8);
  v21 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_213EF273C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[1] = *(_QWORD *)(v2 + 32);
  sub_213EC52F4();
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BEE5490], v11);
  v15 = (void *)sub_213EF2D24();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a1;
  *(_QWORD *)(v16 + 24) = a2;
  aBlock[4] = sub_213E4BE00;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_213EC36AC;
  aBlock[3] = &block_descriptor_3;
  v17 = _Block_copy(aBlock);
  swift_retain();
  sub_213EF2754();
  v23 = MEMORY[0x24BEE4AF8];
  sub_213DB0DB4(&qword_254D40708, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D40710);
  sub_213EC5600(&qword_254D40718, &qword_254D40710);
  sub_213EF2E08();
  sub_213EF2CE8();
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v22 + 8))(v7, v5);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v21);
  return swift_release();
}

uint64_t sub_213EC3CC4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_213EC3CF0()
{
  uint64_t v0;

  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_213EC3D24(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  return sub_213EC32D4(a1, a2, a3);
}

uint64_t sub_213EC3D44(uint64_t a1, uint64_t a2)
{
  return sub_213EC36B0(a1, a2);
}

uint64_t sub_213EC3D64(uint64_t a1, uint64_t a2)
{
  return sub_213EC3A58(a1, a2);
}

uint64_t sub_213EC3D84()
{
  uint64_t result;

  type metadata accessor for PLUSMediaSuggesterRuntimeLogHelper();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D3C198);
  sub_213EF288C();
  sub_213EF2904();
  swift_bridgeObjectRelease();
  result = sub_213EF2904();
  qword_254D40500 = 91;
  *(_QWORD *)algn_254D40508 = 0xE100000000000000;
  return result;
}

uint64_t sub_213EC3E08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v4[2];
  uint64_t v5;

  *(_QWORD *)(v0 + 56) = 0;
  *(_OWORD *)(v0 + 40) = 0u;
  *(_OWORD *)(v0 + 24) = 0u;
  sub_213EF24CC();
  type metadata accessor for PLUSMediaSuggesterRuntimeLogHelper();
  v1 = swift_allocObject();
  type metadata accessor for SELFEventLogEmitters();
  v2 = swift_allocObject();
  sub_213DB0BF0(v4, v2 + 16);
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v0 + 16) = v1;
  v5 = 0;
  memset(v4, 0, sizeof(v4));
  swift_beginAccess();
  sub_213EC5248((uint64_t)v4, v0 + 24);
  swift_endAccess();
  *(_BYTE *)(v0 + 64) = 0;
  return v0;
}

void sub_213EC3ECC(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  int v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  os_log_t v36;
  uint64_t v37;
  uint64_t v38;
  os_log_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45[5];
  uint64_t v46;

  v42 = a4;
  v43 = a3;
  v6 = sub_213EF2604();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F04828);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_213EF1D64();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *a2;
  sub_213EF24C0();
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BEA5270], v6);
  sub_213EF24B4();
  v18 = v9;
  v19 = v13;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v18, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_213DAFEC4((uint64_t)v12, &qword_253F04828);
    if (qword_253F04A88 != -1)
      swift_once();
    v20 = sub_213EF2724();
    __swift_project_value_buffer(v20, (uint64_t)qword_253F08A00);
    v21 = sub_213EF270C();
    v22 = sub_213EF2CA0();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      v45[0] = v24;
      *(_DWORD *)v23 = 136315138;
      if (qword_254D3A090 != -1)
        swift_once();
      v25 = qword_254D40500;
      v26 = *(_QWORD *)algn_254D40508;
      swift_bridgeObjectRetain();
      v46 = sub_213DB0570(v25, v26, v45);
      sub_213EF2D9C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_213DAB000, v21, v22, "%s Failed to generate plusId for PIMS candidate logging", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C53C4](v24, -1, -1);
      MEMORY[0x2199C53C4](v23, -1, -1);
    }

  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
    v27 = v42;
    sub_213E09788(a1, v17 == 2, v17 == 1, (uint64_t)v16, v42);
    v28 = sub_213EC4B4C((uint64_t)v45);
    if (!v45[3])
    {
      v41 = v16;
      if (qword_253F04A88 != -1)
        swift_once();
      v29 = sub_213EF2724();
      __swift_project_value_buffer(v29, (uint64_t)qword_253F08A00);
      v30 = sub_213EF270C();
      v31 = sub_213EF2CA0();
      if (os_log_type_enabled(v30, v31))
      {
        v39 = v30;
        v40 = v19;
        v32 = (uint8_t *)swift_slowAlloc();
        v33 = swift_slowAlloc();
        v46 = v33;
        *(_DWORD *)v32 = 136315138;
        if (qword_254D3A090 != -1)
          swift_once();
        v35 = qword_254D40500;
        v34 = *(_QWORD *)algn_254D40508;
        swift_bridgeObjectRetain();
        v44 = sub_213DB0570(v35, v34, &v46);
        sub_213EF2D9C();
        swift_bridgeObjectRelease();
        v36 = v39;
        _os_log_impl(&dword_213DAB000, v39, v31, "%s Failed to read PIMS candidates as PIMS store not available", v32, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2199C53C4](v33, -1, -1);
        MEMORY[0x2199C53C4](v32, -1, -1);

        v19 = v40;
        v16 = v41;
      }
      else
      {

        v16 = v41;
      }
    }
    MEMORY[0x24BDAC7A8](v28);
    *(&v39 - 2) = (os_log_t)v45;
    v37 = sub_213EC2BDC((void (*)(uint64_t))sub_213EC52D8, (uint64_t)&(&v39)[-4], v43);
    v38 = sub_213EC60CC(v37);
    swift_bridgeObjectRelease();
    sub_213E09968(a1, v38, (uint64_t)v16, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v19);
    sub_213DAFEC4((uint64_t)v45, &qword_254D3F550);
  }
}

uint64_t sub_213EC4418@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;

  v6 = a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254D3AF78) + 48);
  v7 = sub_213EF1D64();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a3, a1, v7);
  sub_213EC5290(a2, (uint64_t)v12);
  v8 = v13;
  if (v13)
  {
    v9 = v14;
    __swift_project_boxed_opaque_existential_1(v12, v13);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, v8, v9);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  }
  else
  {
    sub_213DAFEC4((uint64_t)v12, &qword_254D3F550);
    v11 = type metadata accessor for PlusMediaSuggestion();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v6, 1, 1, v11);
  }
}

void sub_213EC4514(uint64_t a1, uint64_t a2, uint64_t a3)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  _QWORD v52[2];
  __int128 v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  void (*v60)(char *, char *, uint64_t);
  char *v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(uint64_t, char *, uint64_t);
  uint64_t v65;
  unsigned int (*v66)(char *, uint64_t, uint64_t);
  uint64_t v67;
  uint64_t v68[2];

  v63 = a3;
  v52[0] = a2;
  v4 = sub_213EF2604();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F04828);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v52 - v12;
  v14 = sub_213EF1D64();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v55 = (char *)v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v61 = (char *)v52 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)v52 - v20;
  sub_213EF24C0();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEA5270], v4);
  v62 = a1;
  sub_213EF24B4();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v66 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  if (v66(v13, 1, v14) == 1)
  {
    sub_213DAFEC4((uint64_t)v13, &qword_253F04828);
    if (qword_253F04A88 != -1)
      swift_once();
    v22 = sub_213EF2724();
    __swift_project_value_buffer(v22, (uint64_t)qword_253F08A00);
    v23 = sub_213EF270C();
    v24 = sub_213EF2CA0();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      v26 = swift_slowAlloc();
      v68[0] = v26;
      *(_DWORD *)v25 = 136315138;
      if (qword_254D3A090 != -1)
        swift_once();
      v27 = qword_254D40500;
      v28 = *(_QWORD *)algn_254D40508;
      swift_bridgeObjectRetain();
      v67 = sub_213DB0570(v27, v28, v68);
      sub_213EF2D9C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_213DAB000, v23, v24, "%s Failed to generate plusId for PIMS candidate logging", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C53C4](v26, -1, -1);
      MEMORY[0x2199C53C4](v25, -1, -1);
    }

  }
  else
  {
    v60 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
    v60(v21, v13, v14);
    v29 = v52[0];
    v30 = *(_QWORD *)(v52[0] + 16);
    if (v30)
    {
      v58 = *(_QWORD *)(v65 + 16);
      v57 = type metadata accessor for PimsSuggestionMetadata();
      v31 = *(_QWORD *)(v57 - 8);
      v32 = v29 + ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80));
      v33 = *(_QWORD *)(v31 + 72);
      v64 = *(void (**)(uint64_t, char *, uint64_t))(v15 + 16);
      v65 = v33;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v34 = 136315138;
      v53 = v34;
      v52[1] = MEMORY[0x24BEE4AD8] + 8;
      v35 = (uint64_t)v55;
      v54 = v15;
      v59 = v21;
      v56 = v14;
      do
      {
        v64(v35, v21, v14);
        sub_213EF1D10();
        sub_213EA372C(v35, (uint64_t)v11);
        if (v66(v11, 1, v14) == 1)
        {
          sub_213DAFEC4((uint64_t)v11, &qword_253F04828);
          if (qword_253F04A88 != -1)
            swift_once();
          v45 = sub_213EF2724();
          __swift_project_value_buffer(v45, (uint64_t)qword_253F08A00);
          v46 = sub_213EF270C();
          v47 = sub_213EF2CA0();
          if (os_log_type_enabled(v46, v47))
          {
            v48 = swift_slowAlloc();
            v49 = swift_slowAlloc();
            v68[0] = v49;
            *(_DWORD *)v48 = v53;
            if (qword_254D39FD8 != -1)
              swift_once();
            v50 = qword_254D3C0C0;
            v51 = *(_QWORD *)algn_254D3C0C8;
            swift_bridgeObjectRetain();
            *(_QWORD *)(v48 + 4) = sub_213DB0570(v50, v51, v68);
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_213DAB000, v46, v47, "%s Failed to generated suggestionId", (uint8_t *)v48, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2199C53C4](v49, -1, -1);
            MEMORY[0x2199C53C4](v48, -1, -1);

            v15 = v54;
            v35 = (uint64_t)v55;
            v21 = v59;
          }
          else
          {

            v21 = v59;
          }
        }
        else
        {
          v36 = (uint64_t)v61;
          v60(v61, v11, v14);
          v37 = v30;
          v38 = v35;
          v39 = v62;
          v40 = v11;
          v41 = v15;
          v42 = v63;
          sub_213E0A1C8(v62, v36, v32, (uint64_t)v21, v63);
          v43 = v39;
          v35 = v38;
          v30 = v37;
          v44 = v42;
          v15 = v41;
          v11 = v40;
          v14 = v56;
          sub_213E0A5D4(v43, v36, v32 + *(int *)(v57 + 40), (uint64_t)v21, v44);
          (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v36, v14);
        }
        v32 += v65;
        --v30;
      }
      while (v30);
      swift_bridgeObjectRelease();
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v21, v14);
  }
}

uint64_t sub_213EC4B4C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  _UNKNOWN **v23;

  v2 = v1;
  if (*(_BYTE *)(v1 + 64) == 1)
  {
    v4 = v1 + 24;
    swift_beginAccess();
  }
  else
  {
    v5 = sub_213EF26C4();
    v7 = v6;
    v8 = type metadata accessor for PIMSStoreCoreData();
    v9 = swift_allocObject();
    v10 = sub_213ED47F0(v5, v7, 0);
    swift_bridgeObjectRelease();
    if (v10)
    {
      *(_QWORD *)(v9 + 16) = v10;
      *(_QWORD *)(v9 + 24) = objc_msgSend(v10, sel_newBackgroundContext);
      *((_QWORD *)&v22 + 1) = v8;
      v23 = &protocol witness table for PIMSStoreCoreData;
      *(_QWORD *)&v21 = v9;
    }
    else
    {
      swift_deallocPartialClassInstance();
      v23 = 0;
      v21 = 0u;
      v22 = 0u;
    }
    sub_213DC0630((uint64_t)&v21, (uint64_t)v20, &qword_254D3F550);
    v4 = v2 + 24;
    swift_beginAccess();
    sub_213EC5248((uint64_t)v20, v2 + 24);
    swift_endAccess();
    sub_213EC5290(v2 + 24, (uint64_t)&v21);
    v11 = *((_QWORD *)&v22 + 1);
    sub_213DAFEC4((uint64_t)&v21, &qword_254D3F550);
    if (!v11)
    {
      if (qword_253F04A88 != -1)
        swift_once();
      v12 = sub_213EF2724();
      __swift_project_value_buffer(v12, (uint64_t)qword_253F08A00);
      v13 = sub_213EF270C();
      v14 = sub_213EF2CA0();
      if (os_log_type_enabled(v13, v14))
      {
        v15 = (uint8_t *)swift_slowAlloc();
        v16 = swift_slowAlloc();
        *(_QWORD *)&v21 = v16;
        *(_DWORD *)v15 = 136315138;
        if (qword_254D3A090 != -1)
          swift_once();
        v17 = qword_254D40500;
        v18 = *(_QWORD *)algn_254D40508;
        swift_bridgeObjectRetain();
        v20[0] = sub_213DB0570(v17, v18, (uint64_t *)&v21);
        sub_213EF2D9C();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_213DAB000, v13, v14, "%s Failed to initialise PIMS store", v15, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2199C53C4](v16, -1, -1);
        MEMORY[0x2199C53C4](v15, -1, -1);
      }

    }
    *(_BYTE *)(v2 + 64) = 1;
  }
  return sub_213EC5290(v4, a1);
}

uint64_t sub_213EC4E2C()
{
  uint64_t v0;

  swift_release();
  sub_213DAFEC4(v0 + 24, &qword_254D3F550);
  return swift_deallocClassInstance();
}

uint64_t sub_213EC4E60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[2];
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28[2];

  v26 = a3;
  v27 = a2;
  v4 = sub_213EF2D00();
  v24 = *(_QWORD *)(v4 - 8);
  v25 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v23 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_213EF2CF4();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v6);
  v8 = sub_213EF2760();
  MEMORY[0x24BDAC7A8](v8);
  v9 = sub_213EF2574();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v22 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))((char *)v22 - v14, a1, v9);
  v22[1] = sub_213EC52F4();
  sub_213EF2748();
  *(_QWORD *)&v28[0] = MEMORY[0x24BEE4AF8];
  sub_213DB0DB4(&qword_254D40720, v7, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D40728);
  sub_213EC5600(&qword_254D40730, &qword_254D40728);
  sub_213EF2E08();
  (*(void (**)(char *, _QWORD, uint64_t))(v24 + 104))(v23, *MEMORY[0x24BEE5750], v25);
  v16 = sub_213EF2D18();
  v17 = v26;
  *(_QWORD *)(v26 + 24) = v16;
  *(_QWORD *)(v17 + 32) = dispatch_group_create();
  v18 = v27;
  sub_213DAFDFC(v27, (uint64_t)v28);
  type metadata accessor for PimsRuntimeLoggerSynchronous();
  v19 = swift_allocObject();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  v20 = sub_213EC5140((uint64_t)v13, v28, v19);
  __swift_destroy_boxed_opaque_existential_1Tm(v18);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
  *(_QWORD *)(v17 + 16) = v20;
  return v17;
}

uint64_t dispatch thunk of PimsRuntimeLogging.logCandidateSuggestions(requestId:enablementStatus:pimsIds:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of PimsRuntimeLogging.logSuggestionMetadata(requestId:suggestions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of PimsRuntimeLogging.notifyOnComplete(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t type metadata accessor for PimsRuntimeLoggerSynchronous()
{
  return objc_opt_self();
}

uint64_t sub_213EC5140(uint64_t a1, __int128 *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[40];
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_213EF2574();
  v13 = v6;
  v14 = MEMORY[0x24BEA5168];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(boxed_opaque_existential_1, a1, v6);
  type metadata accessor for PLUSMediaSuggesterRuntimeLogHelper();
  *(_OWORD *)(a3 + 40) = 0u;
  *(_QWORD *)(a3 + 56) = 0;
  *(_OWORD *)(a3 + 24) = 0u;
  v8 = swift_allocObject();
  type metadata accessor for SELFEventLogEmitters();
  v9 = swift_allocObject();
  sub_213DB0BF0(&v12, v9 + 16);
  *(_QWORD *)(v8 + 16) = v9;
  *(_QWORD *)(a3 + 16) = v8;
  sub_213DB0BF0(a2, (uint64_t)v11);
  swift_beginAccess();
  sub_213EC5248((uint64_t)v11, a3 + 24);
  swift_endAccess();
  *(_BYTE *)(a3 + 64) = 1;
  return a3;
}

uint64_t sub_213EC5248(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D3F550);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_213EC5290(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D3F550);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_213EC52D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_213EC4418(a1, *(_QWORD *)(v2 + 16), a2);
}

unint64_t sub_213EC52F4()
{
  unint64_t result;

  result = qword_254D40700;
  if (!qword_254D40700)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254D40700);
  }
  return result;
}

uint64_t sub_213EC5330()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_213EC536C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = sub_213EF1D64();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = sub_213EF2460();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v4 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_213EC543C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(sub_213EF1D64() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_213EF2460() - 8) + 80);
  return sub_213EC3A08(*(_QWORD *)(v0 + 16), v0 + v2, *(_QWORD *)(v0 + v3), v0 + ((v3 + v4 + 8) & ~v4));
}

uint64_t sub_213EC54B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = sub_213EF1D64();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + *(_QWORD *)(v2 + 64)) & 0xFFFFFFFFFFFFFFF8;
  v5 = sub_213EF2460();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v4 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_213EC5580()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(sub_213EF1D64() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = v2 + *(_QWORD *)(v1 + 64);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_213EF2460() - 8) + 80);
  return sub_213EC364C(*(_QWORD *)(v0 + 16), v0 + v2, *(_BYTE *)(v0 + v3), *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFFF8) + v0 + 8), v0 + (((v3 & 0xFFFFFFFFFFFFFFF8) + v4 + 16) & ~v4));
}

uint64_t sub_213EC5600(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2199C52D4](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_213EC5640()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D40738);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_213EC56A4()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D40738);
  return sub_213EF2B08();
}

uint64_t sub_213EC56E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ContactSuggestionProvidedClassification();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t SendMessageUSOFeature.RecipientNames.__allocating_init(value:)()
{
  swift_allocObject();
  return sub_213EF23C4();
}

{
  swift_allocObject();
  return sub_213EF23B8();
}

uint64_t SendMessageUSOFeature.RecipientNames.init(value:)()
{
  return sub_213EF23C4();
}

{
  return sub_213EF23B8();
}

uint64_t sub_213EC5808()
{
  type metadata accessor for SendMessageUSOFeature.RecipientNames(0);
  swift_allocObject();
  return sub_213EF23C4();
}

uint64_t sub_213EC5850()
{
  type metadata accessor for SendMessageUSOFeature.RecipientNames(0);
  swift_allocObject();
  return sub_213EF23B8();
}

uint64_t SendMessageUSOFeature.MessageHasPayload.__allocating_init(value:)()
{
  swift_allocObject();
  return sub_213EF23C4();
}

{
  swift_allocObject();
  return sub_213EF23B8();
}

uint64_t SendMessageUSOFeature.MessageHasPayload.init(value:)()
{
  return sub_213EF23C4();
}

{
  return sub_213EF23B8();
}

uint64_t SendMessageUSOFeature.MessageHasPayload.__deallocating_deinit()
{
  _s28SiriPrivateLearningInference13CommonFeatureO09DonatedByA0Cfd_0();
  return swift_deallocClassInstance();
}

ValueMetadata *type metadata accessor for SendMessageUSOFeature()
{
  return &type metadata for SendMessageUSOFeature;
}

uint64_t type metadata accessor for SendMessageUSOFeature.RecipientNames(uint64_t a1)
{
  return sub_213DDE1A0(a1, (uint64_t *)&unk_253F06B58);
}

uint64_t sub_213EC59AC()
{
  return sub_213E0F8C4();
}

uint64_t sub_213EC59B8()
{
  return type metadata accessor for SendMessageUSOFeature.RecipientNames(0);
}

uint64_t type metadata accessor for SendMessageUSOFeature.MessageHasPayload(uint64_t a1)
{
  return sub_213DDE1A0(a1, (uint64_t *)&unk_254D40758);
}

uint64_t sub_213EC59D4()
{
  return sub_213E0F8C4();
}

uint64_t sub_213EC59E0()
{
  type metadata accessor for SendMessageUSOFeature.MessageHasPayload(0);
  swift_allocObject();
  return sub_213EF23C4();
}

uint64_t sub_213EC5A28()
{
  type metadata accessor for SendMessageUSOFeature.MessageHasPayload(0);
  swift_allocObject();
  return sub_213EF23B8();
}

uint64_t sub_213EC5A70()
{
  return type metadata accessor for SendMessageUSOFeature.MessageHasPayload(0);
}

unint64_t sub_213EC5A80(uint64_t a1)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  char *v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD v22[3];
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F04828);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_213EF1D64();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v26 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v25 = (char *)v22 - v10;
  v11 = *(_QWORD *)(a1 + 16);
  if (!v11)
    return MEMORY[0x24BEE4AF8];
  v22[2] = v1;
  v12 = type metadata accessor for EntityPromptClassification();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = a1 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
  v15 = *(_QWORD *)(v13 + 72);
  v22[1] = a1;
  swift_bridgeObjectRetain();
  v16 = MEMORY[0x24BEE4AF8];
  v23 = v15;
  v24 = v12;
  do
  {
    sub_213DCC3D8(v14 + *(int *)(v12 + 48), (uint64_t)v5, &qword_253F04828);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
    {
      sub_213DAFEC4((uint64_t)v5, &qword_253F04828);
    }
    else
    {
      v17 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
      v18 = v25;
      v17(v25, v5, v6);
      v17(v26, v18, v6);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v16 = sub_213DB5B04(0, *(_QWORD *)(v16 + 16) + 1, 1, v16);
      v20 = *(_QWORD *)(v16 + 16);
      v19 = *(_QWORD *)(v16 + 24);
      if (v20 >= v19 >> 1)
        v16 = sub_213DB5B04(v19 > 1, v20 + 1, 1, v16);
      *(_QWORD *)(v16 + 16) = v20 + 1;
      v17((char *)(v16+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v20), v26, v6);
      v15 = v23;
      v12 = v24;
    }
    v14 += v15;
    --v11;
  }
  while (v11);
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_213EC5CD4(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  _QWORD *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;
  __int128 v14;
  ValueMetadata *v15;
  _UNKNOWN **v16;
  uint64_t v17;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v17 = MEMORY[0x24BEE4AF8];
    sub_213DCD100(0, v1, 0);
    v2 = v17;
    v4 = (_QWORD *)(a1 + 64);
    do
    {
      v5 = *((_BYTE *)v4 - 32);
      v6 = *(v4 - 2);
      v13 = *(v4 - 3);
      v7 = *(v4 - 1);
      v8 = *v4;
      v17 = v2;
      v10 = *(_QWORD *)(v2 + 16);
      v9 = *(_QWORD *)(v2 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v10 >= v9 >> 1)
      {
        sub_213DCD100(v9 > 1, v10 + 1, 1);
        v2 = v17;
      }
      v15 = &type metadata for SuccessfulMessageClassification;
      v16 = &protocol witness table for SuccessfulMessageClassification;
      v11 = swift_allocObject();
      *(_QWORD *)&v14 = v11;
      *(_BYTE *)(v11 + 16) = v5;
      *(_QWORD *)(v11 + 24) = v13;
      *(_QWORD *)(v11 + 32) = v6;
      *(_QWORD *)(v11 + 40) = v7;
      *(_QWORD *)(v11 + 48) = v8;
      *(_QWORD *)(v2 + 16) = v10 + 1;
      sub_213DB0BF0(&v14, v2 + 40 * v10 + 32);
      v4 += 5;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_213EC5E10(uint64_t a1)
{
  return sub_213EC5E24(a1, (uint64_t (*)(_QWORD))type metadata accessor for ContactSuggestionProvidedClassification, (uint64_t)&protocol witness table for ContactSuggestionProvidedClassification);
}

uint64_t sub_213EC5E24(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t *boxed_opaque_existential_1;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a2(0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v18 - v8;
  v10 = *(_QWORD *)(a1 + 16);
  v11 = MEMORY[0x24BEE4AF8];
  if (v10)
  {
    v21 = MEMORY[0x24BEE4AF8];
    sub_213DCD100(0, v10, 0);
    v11 = v21;
    v12 = a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    v13 = *(_QWORD *)(v7 + 72);
    do
    {
      sub_213DCA7E4(v12, (uint64_t)v9, a2);
      v21 = v11;
      v15 = *(_QWORD *)(v11 + 16);
      v14 = *(_QWORD *)(v11 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_213DCD100(v14 > 1, v15 + 1, 1);
        v11 = v21;
      }
      v19 = v6;
      v20 = a3;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v18);
      sub_213DCA7E4((uint64_t)v9, (uint64_t)boxed_opaque_existential_1, a2);
      *(_QWORD *)(v11 + 16) = v15 + 1;
      sub_213DB0BF0(&v18, v11 + 40 * v15 + 32);
      sub_213DCA828((uint64_t)v9, a2);
      v12 += v13;
      --v10;
    }
    while (v10);
  }
  return v11;
}

uint64_t sub_213EC5F7C(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v10 = MEMORY[0x24BEE4AF8];
    sub_213DCD430(0, v1, 0);
    v4 = a1 + 32;
    v2 = v10;
    do
    {
      sub_213DE63A4(v4, (uint64_t)&v8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D3A818);
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F06AD8);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_213DCD430(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v10;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_213DCD430(v5 > 1, v6 + 1, 1);
        v2 = v10;
      }
      *(_QWORD *)(v2 + 16) = v6 + 1;
      sub_213DB0BF0(&v9, v2 + 40 * v6 + 32);
      v4 += 48;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_213EC60B4(unint64_t a1)
{
  return sub_213EC62A4(a1, (void (*)(_QWORD))type metadata accessor for ThinContactGroundTruthCoreDataRecord);
}

uint64_t sub_213EC60C0(unint64_t a1)
{
  return sub_213EC62A4(a1, (void (*)(_QWORD))type metadata accessor for PlusContactSuggestionTagCoreDataRecord);
}

uint64_t sub_213EC60CC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D3AF78);
  v2 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D3AF68);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a1 + 16);
  v10 = MEMORY[0x24BEE4AF8];
  if (v9)
  {
    v17 = MEMORY[0x24BEE4AF8];
    sub_213DCD808(0, v9, 0);
    v11 = a1 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    v12 = *(_QWORD *)(v2 + 72);
    v10 = v17;
    do
    {
      sub_213DCC3D8(v11, (uint64_t)v4, &qword_254D3AF78);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_213DCD808(0, *(_QWORD *)(v10 + 16) + 1, 1);
        v10 = v17;
      }
      v14 = *(_QWORD *)(v10 + 16);
      v13 = *(_QWORD *)(v10 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_213DCD808(v13 > 1, v14 + 1, 1);
        v10 = v17;
      }
      *(_QWORD *)(v10 + 16) = v14 + 1;
      sub_213DC0630((uint64_t)v8, v10+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v14, &qword_254D3AF68);
      v11 += v12;
      --v9;
    }
    while (v9);
  }
  return v10;
}

uint64_t sub_213EC628C(unint64_t a1)
{
  return sub_213EC62A4(a1, (void (*)(_QWORD))type metadata accessor for ThinMediaGroundTruthCoreDataRecord);
}

uint64_t sub_213EC6298(unint64_t a1)
{
  return sub_213EC62A4(a1, (void (*)(_QWORD))type metadata accessor for PlusMediaSuggestionTagCoreDataRecord);
}

uint64_t sub_213EC62A4(unint64_t a1, void (*a2)(_QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  id *v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  _OWORD v14[2];
  uint64_t v15;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v4 = sub_213EF306C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v5 = MEMORY[0x24BEE4AF8];
  if (!v4)
    return v5;
  v15 = MEMORY[0x24BEE4AF8];
  result = sub_213DCD69C(0, v4 & ~(v4 >> 63), 0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v4; ++i)
      {
        MEMORY[0x2199C49B0](i, a1);
        a2(0);
        swift_dynamicCast();
        v5 = v15;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_213DCD69C(0, *(_QWORD *)(v5 + 16) + 1, 1);
          v5 = v15;
        }
        v9 = *(_QWORD *)(v5 + 16);
        v8 = *(_QWORD *)(v5 + 24);
        if (v9 >= v8 >> 1)
        {
          sub_213DCD69C(v8 > 1, v9 + 1, 1);
          v5 = v15;
        }
        *(_QWORD *)(v5 + 16) = v9 + 1;
        sub_213E5B300(v14, (_OWORD *)(v5 + 32 * v9 + 32));
      }
    }
    else
    {
      v10 = (id *)(a1 + 32);
      a2(0);
      do
      {
        v11 = *v10;
        swift_dynamicCast();
        v5 = v15;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_213DCD69C(0, *(_QWORD *)(v5 + 16) + 1, 1);
          v5 = v15;
        }
        v13 = *(_QWORD *)(v5 + 16);
        v12 = *(_QWORD *)(v5 + 24);
        if (v13 >= v12 >> 1)
        {
          sub_213DCD69C(v12 > 1, v13 + 1, 1);
          v5 = v15;
        }
        *(_QWORD *)(v5 + 16) = v13 + 1;
        sub_213E5B300(v14, (_OWORD *)(v5 + 32 * v13 + 32));
        ++v10;
        --v4;
      }
      while (v4);
    }
    return v5;
  }
  __break(1u);
  return result;
}

uint64_t PartialRepetitionClassifier.__allocating_init(turnComparators:)(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

uint64_t sub_213EC6508()
{
  uint64_t result;

  type metadata accessor for PartialRepetitionClassifier();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F06CC0);
  sub_213EF288C();
  sub_213EF2904();
  swift_bridgeObjectRelease();
  result = sub_213EF2904();
  qword_253F06CA0 = 91;
  unk_253F06CA8 = 0xE100000000000000;
  return result;
}

uint64_t PartialRepetitionClassifier.init(turnComparators:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

uint64_t PartialRepetitionClassifier.__allocating_init(turnComparator:)(__int128 *a1)
{
  uint64_t v2;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253F04EC0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_213EF53E0;
  sub_213DB0BF0(a1, v2 + 32);
  type metadata accessor for PartialRepetitionClassifier();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v2;
  return result;
}

uint64_t type metadata accessor for PartialRepetitionClassifier()
{
  return objc_opt_self();
}

uint64_t sub_213EC6618(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F069A0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v16[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213DCA7E4(a1, (uint64_t)v8, type metadata accessor for FeaturisedTurn);
  sub_213DCA7E4(a2, (uint64_t)&v8[*(int *)(v6 + 48)], type metadata accessor for FeaturisedTurn);
  *(_QWORD *)&v8[*(int *)(v6 + 64)] = a3;
  v9 = *(_QWORD *)(a3 + 16);
  if (v9)
  {
    v10 = a3 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_213DAFDFC(v10, (uint64_t)v16);
      v11 = v17;
      v12 = v18;
      __swift_project_boxed_opaque_existential_1(v16, v17);
      v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 16))(v11, v12);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
      if ((v13 & 1) != 0)
        break;
      v10 += 40;
      --v9;
    }
    while (v9);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  sub_213DAFEC4((uint64_t)v8, &qword_253F069A0);
  type metadata accessor for RuleResult();
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_213EC6770(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v21;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F069A0);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v21 - v11;
  v13 = (char *)&v21 + *(int *)(v10 + 48) - v11;
  sub_213DCA7E4(a1, (uint64_t)&v21 - v11, type metadata accessor for FeaturisedTurn);
  sub_213DCA7E4(a2, (uint64_t)v13, type metadata accessor for FeaturisedTurn);
  v14 = *(int *)(v6 + 64);
  *(_QWORD *)&v12[v14] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F07018);
  v15 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F06FA0) - 8) + 80);
  v16 = (v15 + 32) & ~v15;
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_213EF53E0;
  v18 = (_QWORD *)(v17 + v16);
  *v18 = 0xD00000000000001ELL;
  v18[1] = 0x8000000213F0A270;
  v19 = (uint64_t)&v9[*(int *)(v6 + 48)];
  sub_213DCA7E4((uint64_t)v12, (uint64_t)v9, type metadata accessor for FeaturisedTurn);
  sub_213DCA7E4((uint64_t)v13, v19, type metadata accessor for FeaturisedTurn);
  *(_QWORD *)&v9[v14] = a3;
  swift_bridgeObjectRetain();
  sub_213EC6618((uint64_t)v9, v19, a3);
  sub_213DCA828(v19, type metadata accessor for FeaturisedTurn);
  sub_213DCA828((uint64_t)v9, type metadata accessor for FeaturisedTurn);
  sub_213DAFEC4((uint64_t)v12, &qword_253F069A0);
  return v17;
}

uint64_t sub_213EC6938(_QWORD *a1)
{
  uint64_t *v1;
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
  uint64_t result;
  unint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t (*v17)(uint64_t);
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  os_log_type_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  _QWORD v52[2];
  __int128 v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t *v63;
  _QWORD *v64;
  uint64_t v65;
  unint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72[3];
  uint64_t v73;
  uint64_t v74;
  _BYTE v75[32];
  uint64_t v76;

  v3 = *v1;
  v4 = type metadata accessor for FeaturisedTurn(0);
  v69 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v68 = (uint64_t)v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v67 = (char *)v52 - v7;
  v8 = type metadata accessor for FeaturisedSession(0);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v62 = (_QWORD *)((char *)v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v76 = MEMORY[0x24BEE4AF8];
  v63 = v1;
  v11 = v1[2];
  v61 = *(_QWORD *)(v11 + 16);
  if (!v61)
    return MEMORY[0x24BEE4AF8];
  v59 = v9;
  v12 = *(int *)(v9 + 24);
  v57 = (char *)a1 + *(int *)(v9 + 20);
  v56 = (uint64_t)a1 + v12;
  v60 = v11 + 32;
  v54 = v72;
  result = swift_bridgeObjectRetain();
  v14 = 0;
  v15 = 0;
  *(_QWORD *)&v16 = 136315394;
  v53 = v16;
  v52[1] = MEMORY[0x24BEE4AD8] + 8;
  v17 = type metadata accessor for FeaturisedTurn;
  v58 = v11;
  v64 = a1;
  v55 = v3;
  while (v14 < *(_QWORD *)(v11 + 16))
  {
    v65 = v15;
    v66 = v14;
    sub_213DAFDFC(v60 + 40 * v14, (uint64_t)v75);
    sub_213DAFDFC((uint64_t)v75, (uint64_t)v72);
    v20 = *a1;
    v21 = MEMORY[0x24BEE4AF8];
    v71 = MEMORY[0x24BEE4AF8];
    v22 = *(_QWORD *)(v20 + 16);
    result = swift_bridgeObjectRetain();
    v70 = v22;
    if (v22)
    {
      v23 = 0;
      v24 = (uint64_t)v67;
      while (v23 < *(_QWORD *)(v20 + 16))
      {
        v25 = (*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80);
        v26 = *(_QWORD *)(v69 + 72);
        sub_213DCA7E4(v20 + v25 + v26 * v23, v24, v17);
        v27 = v17;
        v28 = v73;
        v29 = v74;
        __swift_project_boxed_opaque_existential_1(v72, v73);
        if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v24, v28, v29) & 1) != 0)
        {
          sub_213DBB430(v24, v68, v27);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_213DCD09C(0, *(_QWORD *)(v21 + 16) + 1, 1);
            v24 = (uint64_t)v67;
          }
          v21 = v71;
          v31 = *(_QWORD *)(v71 + 16);
          v30 = *(_QWORD *)(v71 + 24);
          if (v31 >= v30 >> 1)
          {
            sub_213DCD09C(v30 > 1, v31 + 1, 1);
            v24 = (uint64_t)v67;
            v21 = v71;
          }
          *(_QWORD *)(v21 + 16) = v31 + 1;
          v32 = v21 + v25 + v31 * v26;
          v17 = type metadata accessor for FeaturisedTurn;
          result = sub_213DBB430(v68, v32, type metadata accessor for FeaturisedTurn);
        }
        else
        {
          result = sub_213DCA828(v24, v27);
          v17 = v27;
        }
        if (v70 == ++v23)
        {
          v33 = v71;
          a1 = v64;
          goto LABEL_19;
        }
      }
      __break(1u);
      break;
    }
    v33 = v21;
LABEL_19:
    v34 = v55;
    v35 = v65;
    v36 = v66;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v72);
    swift_bridgeObjectRelease();
    v37 = v59;
    v38 = v62;
    v39 = (char *)v62 + *(int *)(v59 + 20);
    v40 = sub_213EF1D64();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v40 - 8) + 16))(v39, v57, v40);
    sub_213DCC3D8(v56, (uint64_t)v38 + *(int *)(v37 + 24), &qword_253F04828);
    *v38 = v33;
    swift_bridgeObjectRetain();
    sub_213DCA828((uint64_t)v38, type metadata accessor for FeaturisedSession);
    sub_213DCC7FC(2, v33);
    v41 = swift_release();
    MEMORY[0x24BDAC7A8](v41);
    v52[-2] = v75;
    v52[-1] = v34;
    v42 = sub_213E43AA0((void (*)(__int128 *))sub_213EC9A40, (uint64_t)&v52[-4]);
    v43 = v35;
    swift_release();
    if (qword_253F04A88 != -1)
      swift_once();
    v44 = sub_213EF2724();
    __swift_project_value_buffer(v44, (uint64_t)qword_253F08A00);
    swift_bridgeObjectRetain();
    v45 = sub_213EF270C();
    v46 = sub_213EF2C94();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = v46;
      v48 = swift_slowAlloc();
      v49 = swift_slowAlloc();
      v72[0] = v49;
      *(_DWORD *)v48 = v53;
      if (qword_253F06CB8 != -1)
        swift_once();
      v50 = qword_253F06CA0;
      v51 = unk_253F06CA8;
      swift_bridgeObjectRetain();
      v71 = sub_213DB0570(v50, v51, v72);
      sub_213EF2D9C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v48 + 12) = 2048;
      v71 = *(_QWORD *)(v42 + 16);
      sub_213EF2D9C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_213DAB000, v45, v47, "%s Identifying restatements in %ld turn pairs", (uint8_t *)v48, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2199C53C4](v49, -1, -1);
      MEMORY[0x2199C53C4](v48, -1, -1);

      v36 = v66;
      v17 = type metadata accessor for FeaturisedTurn;
      a1 = v64;
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    v14 = v36 + 1;
    v18 = (uint64_t)v63;
    swift_retain();
    v15 = v43;
    v19 = sub_213EC8E94(v42, v18, v34);
    swift_bridgeObjectRelease();
    swift_release();
    sub_213DB43DC(v19);
    result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v75);
    v11 = v58;
    if (v14 == v61)
    {
      swift_bridgeObjectRelease();
      return v76;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_213EC6F94@<X0>(_QWORD *a1@<X0>, NSObject *a2@<X1>, uint64_t a3@<X8>)
{
  uint8_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t isa;
  Class v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  os_log_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  os_log_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  __int128 v57[2];
  uint64_t v58;

  v7 = type metadata accessor for FeaturisedTurn(0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v49 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v18 = a1[2];
  v17 = a1[3];
  v19 = v17 >> 1;
  if (v18 == v17 >> 1)
  {
LABEL_9:
    if (qword_253F04A88 != -1)
      swift_once();
    v30 = sub_213EF2724();
    __swift_project_value_buffer(v30, (uint64_t)qword_253F08A00);
    a2 = sub_213EF270C();
    LOBYTE(v12) = sub_213EF2C94();
    if (!os_log_type_enabled(a2, (os_log_type_t)v12))
    {

      goto LABEL_15;
    }
    v19 = a3;
    v3 = (uint8_t *)swift_slowAlloc();
    a3 = swift_slowAlloc();
    *(_QWORD *)&v57[0] = a3;
    *(_DWORD *)v3 = 136315138;
    if (qword_253F06CB8 == -1)
      goto LABEL_13;
    goto LABEL_24;
  }
  if (v18 >= (uint64_t)(v17 >> 1))
  {
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    swift_once();
LABEL_13:
    v31 = qword_253F06CA0;
    v32 = unk_253F06CA8;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v55 = sub_213DB0570(v31, v32, (uint64_t *)v57);
    sub_213EF2D9C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_213DAB000, a2, (os_log_type_t)v12, "%s Can't generate restatement score for single turn. Skipping.", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199C53C4](a3, -1, -1);
    MEMORY[0x2199C53C4](v3, -1, -1);

    a3 = v19;
    goto LABEL_15;
  }
  v53 = v16;
  v54 = v15;
  v3 = (uint8_t *)a3;
  v20 = a1[1];
  a3 = *(_QWORD *)(v13 + 72);
  v58 = (uint64_t)&v49 - v14;
  sub_213DCA7E4(v20 + a3 * v18, (uint64_t)&v49 - v14, type metadata accessor for FeaturisedTurn);
  sub_213DCA7E4(v20 + a3 * (v19 - 1), (uint64_t)v12, type metadata accessor for FeaturisedTurn);
  if (__OFSUB__(v19, v18))
    goto LABEL_23;
  a3 = (uint64_t)v3;
  if (v19 - v18 != 2)
  {
    sub_213DCA828((uint64_t)v12, type metadata accessor for FeaturisedTurn);
    sub_213DCA828(v58, type metadata accessor for FeaturisedTurn);
    goto LABEL_9;
  }
  isa = (uint64_t)a2[3].isa;
  v22 = a2[4].isa;
  __swift_project_boxed_opaque_existential_1(a2, isa);
  v23 = v58;
  (*((void (**)(__int128 *__return_ptr, uint64_t, char *, uint64_t, Class))v22 + 1))(&v55, v58, v12, isa, v22);
  if (v56)
  {
    sub_213DB0BF0(&v55, (uint64_t)v57);
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F069A0);
    v25 = a3;
    v26 = a3 + *(int *)(v24 + 48);
    v27 = *(int *)(v24 + 64);
    sub_213DCA7E4(v23, v25, type metadata accessor for FeaturisedTurn);
    sub_213DCA7E4((uint64_t)v12, v26, type metadata accessor for FeaturisedTurn);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D407B0);
    v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_213EF53E0;
    sub_213DB0BF0(v57, v28 + 32);
    sub_213DCA828((uint64_t)v12, type metadata accessor for FeaturisedTurn);
    sub_213DCA828(v23, type metadata accessor for FeaturisedTurn);
    *(_QWORD *)(v25 + v27) = v28;
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v25, 0, 1, v24);
  }
  sub_213DAFEC4((uint64_t)&v55, &qword_254D407A8);
  if (qword_253F04A88 != -1)
    swift_once();
  v34 = sub_213EF2724();
  __swift_project_value_buffer(v34, (uint64_t)qword_253F08A00);
  v35 = v58;
  v36 = v53;
  sub_213DCA7E4(v58, v53, type metadata accessor for FeaturisedTurn);
  v37 = v54;
  sub_213DCA7E4((uint64_t)v12, v54, type metadata accessor for FeaturisedTurn);
  v38 = sub_213EF270C();
  v39 = sub_213EF2C94();
  if (os_log_type_enabled(v38, (os_log_type_t)v39))
  {
    v51 = v39;
    v52 = v38;
    v40 = swift_slowAlloc();
    v50 = swift_slowAlloc();
    *(_QWORD *)&v57[0] = v50;
    *(_DWORD *)v40 = 136315650;
    if (qword_253F06CB8 != -1)
      swift_once();
    v41 = qword_253F06CA0;
    v42 = unk_253F06CA8;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v55 = sub_213DB0570(v41, v42, (uint64_t *)v57);
    sub_213EF2D9C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v40 + 12) = 2080;
    v43 = FeaturisedTurn.friendlyName.getter();
    *(_QWORD *)&v55 = sub_213DB0570(v43, v44, (uint64_t *)v57);
    sub_213EF2D9C();
    swift_bridgeObjectRelease();
    sub_213DCA828(v36, type metadata accessor for FeaturisedTurn);
    *(_WORD *)(v40 + 22) = 2080;
    v45 = FeaturisedTurn.friendlyName.getter();
    *(_QWORD *)&v55 = sub_213DB0570(v45, v46, (uint64_t *)v57);
    sub_213EF2D9C();
    swift_bridgeObjectRelease();
    sub_213DCA828(v37, type metadata accessor for FeaturisedTurn);
    v47 = v52;
    _os_log_impl(&dword_213DAB000, v52, (os_log_type_t)v51, "%s Failed to generate restatement score for Turn A=%s B=%s", (uint8_t *)v40, 0x20u);
    v48 = v50;
    swift_arrayDestroy();
    MEMORY[0x2199C53C4](v48, -1, -1);
    MEMORY[0x2199C53C4](v40, -1, -1);

    sub_213DCA828((uint64_t)v12, type metadata accessor for FeaturisedTurn);
    sub_213DCA828(v58, type metadata accessor for FeaturisedTurn);
  }
  else
  {

    sub_213DCA828(v37, type metadata accessor for FeaturisedTurn);
    sub_213DCA828(v36, type metadata accessor for FeaturisedTurn);
    sub_213DCA828((uint64_t)v12, type metadata accessor for FeaturisedTurn);
    sub_213DCA828(v35, type metadata accessor for FeaturisedTurn);
  }
LABEL_15:
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F069A0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(a3, 1, 1, v33);
}

uint64_t sub_213EC765C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
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
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  int v40;
  _BOOL4 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  os_log_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSObject *v83;
  os_log_type_t v84;
  uint8_t *v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  _QWORD v90[2];
  uint64_t v91;
  int v92;
  os_log_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t *v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;

  v95 = a2;
  v98 = type metadata accessor for RuleResult();
  MEMORY[0x24BDAC7A8](v98);
  v4 = (char *)v90 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F069A0);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v100 = (uint64_t)v90 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v101 = (uint64_t)v90 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v96 = (_QWORD *)((char *)v90 - v11);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v106 = (uint64_t)v90 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v107 = (uint64_t)v90 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v90 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)v90 - v20;
  v22 = *(int *)(v19 + 48);
  v23 = (char *)v90 + v22 - v20;
  v24 = *(int *)(v19 + 64);
  v25 = a1 + v22;
  sub_213DCA7E4(a1, (uint64_t)v90 - v20, type metadata accessor for FeaturisedTurn);
  v103 = v25;
  sub_213DCA7E4(v25, (uint64_t)v23, type metadata accessor for FeaturisedTurn);
  v104 = a1;
  v26 = *(_QWORD *)(a1 + v24);
  *(_QWORD *)&v21[v24] = v26;
  swift_bridgeObjectRetain();
  v102 = sub_213EC6770((uint64_t)v21, (uint64_t)v23, v26);
  swift_bridgeObjectRelease();
  sub_213DCA828((uint64_t)v23, type metadata accessor for FeaturisedTurn);
  v97 = v21;
  sub_213DCA828((uint64_t)v21, type metadata accessor for FeaturisedTurn);
  if (qword_253F04A88 != -1)
    swift_once();
  v27 = sub_213EF2724();
  v99 = __swift_project_value_buffer(v27, (uint64_t)qword_253F08A00);
  v28 = (uint64_t)&v18[*(int *)(v5 + 48)];
  v29 = v5;
  v30 = *(int *)(v5 + 64);
  v31 = v104;
  sub_213DCA7E4(v104, (uint64_t)v18, type metadata accessor for FeaturisedTurn);
  v32 = v103;
  sub_213DCA7E4(v103, v28, type metadata accessor for FeaturisedTurn);
  v94 = v24;
  v33 = *(_QWORD *)(v31 + v24);
  *(_QWORD *)&v18[v30] = v33;
  sub_213DCC3D8((uint64_t)v18, v107, &qword_253F069A0);
  sub_213DC0630((uint64_t)v18, v106, &qword_253F069A0);
  v34 = (uint64_t)v96;
  v35 = (uint64_t)v96 + *(int *)(v29 + 48);
  v105 = v29;
  v36 = *(int *)(v29 + 64);
  sub_213DCA7E4(v31, (uint64_t)v96, type metadata accessor for FeaturisedTurn);
  sub_213DCA7E4(v32, v35, type metadata accessor for FeaturisedTurn);
  *(_QWORD *)(v34 + v36) = v33;
  v37 = v101;
  sub_213DCC3D8(v34, v101, &qword_253F069A0);
  v38 = v100;
  sub_213DC0630(v34, v100, &qword_253F069A0);
  swift_bridgeObjectRetain_n();
  v39 = sub_213EF270C();
  v40 = sub_213EF2C94();
  v41 = os_log_type_enabled(v39, (os_log_type_t)v40);
  v42 = v38;
  v43 = v107;
  if (v41)
  {
    v92 = v40;
    v93 = v39;
    v44 = swift_slowAlloc();
    v91 = swift_slowAlloc();
    v110 = v91;
    *(_DWORD *)v44 = 136315650;
    v45 = (uint64_t)v97;
    if (qword_253F06CB8 != -1)
      swift_once();
    v46 = qword_253F06CA0;
    v47 = unk_253F06CA8;
    swift_bridgeObjectRetain();
    v108 = sub_213DB0570(v46, v47, &v110);
    v96 = &v109;
    sub_213EF2D9C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 12) = 2080;
    v90[1] = v44 + 14;
    v48 = *(int *)(v105 + 48);
    v49 = v45 + v48;
    v50 = *(int *)(v105 + 64);
    v51 = v107;
    v52 = v107 + v48;
    sub_213DCA7E4(v107, v45, type metadata accessor for FeaturisedTurn);
    sub_213DCA7E4(v52, v49, type metadata accessor for FeaturisedTurn);
    *(_QWORD *)(v45 + v50) = *(_QWORD *)(v51 + v50);
    v53 = FeaturisedTurn.friendlyName.getter();
    v55 = v54;
    sub_213DCA828(v45, type metadata accessor for FeaturisedTurn);
    sub_213DCA828(v49, type metadata accessor for FeaturisedTurn);
    v108 = sub_213DB0570(v53, v55, &v110);
    sub_213EF2D9C();
    swift_bridgeObjectRelease();
    sub_213DAFEC4(v106, &qword_253F069A0);
    sub_213DAFEC4(v51, &qword_253F069A0);
    *(_WORD *)(v44 + 22) = 2080;
    v107 = v44 + 24;
    v56 = *(int *)(v105 + 48);
    v57 = v45 + v56;
    v58 = *(int *)(v105 + 64);
    v59 = v101;
    v60 = v101 + v56;
    sub_213DCA7E4(v101, v45, type metadata accessor for FeaturisedTurn);
    sub_213DCA7E4(v60, v57, type metadata accessor for FeaturisedTurn);
    *(_QWORD *)(v45 + v58) = *(_QWORD *)(v59 + v58);
    v61 = FeaturisedTurn.friendlyName.getter();
    v63 = v62;
    sub_213DCA828(v57, type metadata accessor for FeaturisedTurn);
    sub_213DCA828(v45, type metadata accessor for FeaturisedTurn);
    v64 = v61;
    v65 = v105;
    v108 = sub_213DB0570(v64, v63, &v110);
    sub_213EF2D9C();
    swift_bridgeObjectRelease();
    sub_213DAFEC4(v100, &qword_253F069A0);
    sub_213DAFEC4(v59, &qword_253F069A0);
    v66 = v93;
    _os_log_impl(&dword_213DAB000, v93, (os_log_type_t)v92, "%s Rule matrix generated for Turn A=%s B=%s:", (uint8_t *)v44, 0x20u);
    v67 = v91;
    swift_arrayDestroy();
    MEMORY[0x2199C53C4](v67, -1, -1);
    MEMORY[0x2199C53C4](v44, -1, -1);

  }
  else
  {
    sub_213DAFEC4(v106, &qword_253F069A0);
    sub_213DAFEC4(v43, &qword_253F069A0);
    sub_213DAFEC4(v42, &qword_253F069A0);
    sub_213DAFEC4(v37, &qword_253F069A0);

    v45 = (uint64_t)v97;
    v65 = v105;
  }
  v68 = v102;
  sub_213EE84EC(8224, 0xE200000000000000, v102);
  v69 = *(_QWORD *)(v68 + 16);
  if (v69)
  {
    v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F06FA0);
    v71 = *(_QWORD *)(v70 - 8);
    v72 = v68 + ((*(unsigned __int8 *)(v71 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v71 + 80));
    v73 = *(_QWORD *)(v71 + 72);
    swift_bridgeObjectRetain();
    while (1)
    {
      v74 = v72 + *(int *)(v70 + 48);
      swift_storeEnumTagMultiPayload();
      sub_213E81FE0(v74, (uint64_t)v4);
      LOBYTE(v74) = v75;
      sub_213DCA828((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for RuleResult);
      if ((v74 & 1) == 0)
        break;
      v72 += v73;
      if (!--v69)
      {
        swift_bridgeObjectRelease_n();
        v65 = v105;
        goto LABEL_14;
      }
    }
    swift_bridgeObjectRelease_n();
    v83 = sub_213EF270C();
    v84 = sub_213EF2C94();
    if (os_log_type_enabled(v83, v84))
    {
      v85 = (uint8_t *)swift_slowAlloc();
      v86 = swift_slowAlloc();
      v110 = v86;
      *(_DWORD *)v85 = 136315138;
      if (qword_253F06CB8 != -1)
        swift_once();
      v87 = qword_253F06CA0;
      v88 = unk_253F06CA8;
      swift_bridgeObjectRetain();
      v108 = sub_213DB0570(v87, v88, &v110);
      sub_213EF2D9C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_213DAB000, v83, v84, "%s Failed to match all restatement rules - skipping.", v85, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C53C4](v86, -1, -1);
      MEMORY[0x2199C53C4](v85, -1, -1);
    }

    v89 = type metadata accessor for TurnPairRestatementClassification();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v89 - 8) + 56))(v95, 1, 1, v89);
  }
  else
  {
    swift_bridgeObjectRelease();
LABEL_14:
    v76 = v45 + *(int *)(v65 + 48);
    v77 = *(int *)(v65 + 64);
    v78 = v104;
    sub_213DCA7E4(v104, v45, type metadata accessor for FeaturisedTurn);
    sub_213DCA7E4(v103, v76, type metadata accessor for FeaturisedTurn);
    v79 = *(_QWORD *)(v78 + v94);
    *(_QWORD *)(v45 + v77) = v79;
    swift_bridgeObjectRetain();
    v80 = v95;
    sub_213EC8520(v45, v76, v79, v95);
    swift_bridgeObjectRelease();
    sub_213DCA828(v76, type metadata accessor for FeaturisedTurn);
    sub_213DCA828(v45, type metadata accessor for FeaturisedTurn);
    v81 = type metadata accessor for TurnPairRestatementClassification();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v81 - 8) + 56))(v80, 0, 1, v81);
  }
}

uint64_t sub_213EC7F68(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
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
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  int v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52[5];
  uint64_t v53[5];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F06C68);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for EntityPromptClassification();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v51 = (uint64_t)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v47 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v47 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v47 - v18;
  if ((sub_213EC9104((uint64_t)a1) & 1) == 0)
  {
    v48 = a1;
    v49 = v2;
    v28 = *(_QWORD *)(a2 + 16);
    v29 = MEMORY[0x24BEE4AF8];
    if (v28)
    {
      v30 = a2 + 32;
      v47 = a2;
      swift_bridgeObjectRetain();
      v31 = MEMORY[0x24BEE4AF8];
      v50 = v17;
      do
      {
        sub_213DAFDFC(v30, (uint64_t)v53);
        sub_213DAFDFC((uint64_t)v53, (uint64_t)v52);
        __swift_instantiateConcreteTypeFromMangledName(&qword_253F06990);
        v32 = swift_dynamicCast();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v7, v32 ^ 1u, 1, v8);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v53);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
        {
          sub_213DAFEC4((uint64_t)v7, &qword_253F06C68);
        }
        else
        {
          sub_213DBB430((uint64_t)v7, (uint64_t)v19, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
          sub_213DBB430((uint64_t)v19, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v31 = sub_213DB5648(0, *(_QWORD *)(v31 + 16) + 1, 1, v31);
          v34 = *(_QWORD *)(v31 + 16);
          v33 = *(_QWORD *)(v31 + 24);
          if (v34 >= v33 >> 1)
            v31 = sub_213DB5648(v33 > 1, v34 + 1, 1, v31);
          *(_QWORD *)(v31 + 16) = v34 + 1;
          v35 = v31
              + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))
              + *(_QWORD *)(v9 + 72) * v34;
          v17 = v50;
          sub_213DBB430((uint64_t)v50, v35, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
        }
        v30 += 40;
        --v28;
      }
      while (v28);
      swift_bridgeObjectRelease();
      v29 = MEMORY[0x24BEE4AF8];
    }
    else
    {
      v31 = MEMORY[0x24BEE4AF8];
    }
    v53[0] = v29;
    v50 = *(char **)(v31 + 16);
    if (!v50)
    {
LABEL_31:
      swift_bridgeObjectRelease();
      v42 = sub_213EC5A80(v53[0]);
      swift_release();
      v43 = sub_213DDDF4C(v42);
      swift_bridgeObjectRelease();
      v44 = sub_213EC6938(v48);
      v45 = sub_213EC8B70(v44, v43);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v27 = sub_213EC5E24(v45, (uint64_t (*)(_QWORD))type metadata accessor for TurnPairRestatementClassification, (uint64_t)&protocol witness table for TurnPairRestatementClassification);
      swift_bridgeObjectRelease();
      return v27;
    }
    v36 = 0;
    while (v36 < *(_QWORD *)(v31 + 16))
    {
      v37 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
      v38 = *(_QWORD *)(v9 + 72);
      sub_213DCA7E4(v31 + v37 + v38 * v36, (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
      if (*((_QWORD *)v14 + 6))
      {
        sub_213DBB430((uint64_t)v14, v51, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
        v39 = v53[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_213DCD000(0, *(_QWORD *)(v39 + 16) + 1, 1);
          v39 = v53[0];
        }
        v41 = *(_QWORD *)(v39 + 16);
        v40 = *(_QWORD *)(v39 + 24);
        if (v41 >= v40 >> 1)
        {
          sub_213DCD000(v40 > 1, v41 + 1, 1);
          v39 = v53[0];
        }
        *(_QWORD *)(v39 + 16) = v41 + 1;
        sub_213DBB430(v51, v39 + v37 + v41 * v38, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
      }
      else
      {
        sub_213DCA828((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
      }
      if (v50 == (char *)++v36)
        goto LABEL_31;
    }
    __break(1u);
    goto LABEL_34;
  }
  if (qword_253F04A88 != -1)
LABEL_34:
    swift_once();
  v20 = sub_213EF2724();
  __swift_project_value_buffer(v20, (uint64_t)qword_253F08A00);
  v21 = sub_213EF270C();
  v22 = sub_213EF2C94();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    v24 = swift_slowAlloc();
    v53[0] = v24;
    *(_DWORD *)v23 = 136315138;
    if (qword_253F06CB8 != -1)
      swift_once();
    v25 = qword_253F06CA0;
    v26 = unk_253F06CA8;
    swift_bridgeObjectRetain();
    v52[0] = sub_213DB0570(v25, v26, v53);
    sub_213EF2D9C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_213DAB000, v21, v22, "%s Session has one or more turn with multiple recipients - skipping classification.", v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199C53C4](v24, -1, -1);
    MEMORY[0x2199C53C4](v23, -1, -1);
  }

  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_213EC8520@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t);
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;

  v54 = a4;
  v58 = type metadata accessor for TurnPairRestatementClassification();
  MEMORY[0x24BDAC7A8](v58);
  v52 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_213EF1D64();
  v59 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v57 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v55 = (char *)&v50 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F069A0);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v56 = (uint64_t)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v50 - v16;
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v50 - v19;
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = (char *)&v50 - v22;
  v24 = (char *)&v50 + *(int *)(v21 + 48) - v22;
  sub_213DCA7E4(a1, (uint64_t)&v50 - v22, type metadata accessor for FeaturisedTurn);
  sub_213DCA7E4(a2, (uint64_t)v24, type metadata accessor for FeaturisedTurn);
  v25 = *(int *)(v12 + 64);
  *(_QWORD *)&v23[v25] = a3;
  v53 = &v20[*(int *)(v12 + 48)];
  v26 = (uint64_t)v53;
  sub_213DCA7E4((uint64_t)v23, (uint64_t)v20, type metadata accessor for FeaturisedTurn);
  sub_213DCA7E4((uint64_t)v24, v26, type metadata accessor for FeaturisedTurn);
  *(_QWORD *)&v20[v25] = a3;
  v27 = *(void (**)(char *, char *, uint64_t))(v59 + 16);
  v27(v55, v20, v8);
  v28 = a3;
  swift_bridgeObjectRetain();
  sub_213DCA828((uint64_t)v20, type metadata accessor for FeaturisedTurn);
  v29 = (uint64_t)v17;
  v30 = (uint64_t)&v17[*(int *)(v12 + 48)];
  v31 = *(int *)(v12 + 64);
  v32 = v29;
  v51 = v29;
  sub_213DCA7E4((uint64_t)v23, v29, type metadata accessor for FeaturisedTurn);
  sub_213DCA7E4((uint64_t)v24, v30, type metadata accessor for FeaturisedTurn);
  *(_QWORD *)(v32 + v31) = v28;
  v33 = v57;
  v27(v57, (char *)v30, v8);
  sub_213DCA828(v30, type metadata accessor for FeaturisedTurn);
  v50 = v56 + *(int *)(v12 + 48);
  v34 = v50;
  v35 = *(int *)(v12 + 64);
  v36 = v56;
  sub_213DCA7E4((uint64_t)v23, v56, type metadata accessor for FeaturisedTurn);
  sub_213DCA7E4((uint64_t)v24, v34, type metadata accessor for FeaturisedTurn);
  *(_QWORD *)(v36 + v35) = v28;
  v37 = (uint64_t)v52;
  v38 = v55;
  v27(v52, v55, v8);
  v39 = v58;
  v27((char *)(v37 + *(int *)(v58 + 20)), v33, v8);
  *(_QWORD *)(v37 + *(int *)(v39 + 24)) = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D3A840);
  v40 = *(_QWORD *)(v59 + 72);
  v41 = (*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80);
  v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = xmmword_213EF44B0;
  v43 = v42 + v41;
  v44 = v38;
  v27((char *)v43, v38, v8);
  v45 = (char *)(v43 + v40);
  v46 = v57;
  v27(v45, v57, v8);
  v47 = v58;
  *(_QWORD *)(v37 + *(int *)(v58 + 28)) = v42;
  v48 = *(void (**)(char *, uint64_t))(v59 + 8);
  swift_bridgeObjectRetain();
  v48(v46, v8);
  v48(v44, v8);
  *(_QWORD *)(v37 + *(int *)(v47 + 32)) = MEMORY[0x24BEE4AF8];
  sub_213DBB430(v37, v54, (uint64_t (*)(_QWORD))type metadata accessor for TurnPairRestatementClassification);
  sub_213DAFEC4((uint64_t)v23, &qword_253F069A0);
  sub_213DCA828(v50, type metadata accessor for FeaturisedTurn);
  sub_213DCA828(v56, type metadata accessor for FeaturisedTurn);
  sub_213DCA828(v51, type metadata accessor for FeaturisedTurn);
  return sub_213DCA828((uint64_t)v53, type metadata accessor for FeaturisedTurn);
}

uint64_t TurnPairRestatementClassification.init(firstTurnId:restatementTurnId:scoredComparisons:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  int *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t result;

  v8 = sub_213EF1D64();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  v10(a4, a1, v8);
  v11 = (int *)type metadata accessor for TurnPairRestatementClassification();
  v10(a4 + v11[5], a2, v8);
  *(_QWORD *)(a4 + v11[6]) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D3A840);
  v12 = *(_QWORD *)(v9 + 72);
  v13 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_213EF44B0;
  v15 = v14 + v13;
  v10(v15, a1, v8);
  v10(v15 + v12, a2, v8);
  *(_QWORD *)(a4 + v11[7]) = v14;
  v16 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  v16(a2, v8);
  result = ((uint64_t (*)(uint64_t, uint64_t))v16)(a1, v8);
  *(_QWORD *)(a4 + v11[8]) = MEMORY[0x24BEE4AF8];
  return result;
}

uint64_t PartialRepetitionClassifier.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PartialRepetitionClassifier.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_213EC8A70(_QWORD *a1, uint64_t a2)
{
  return sub_213EC7F68(a1, a2);
}

uint64_t TurnPairRestatementClassification.firstTurnId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_213EF1D64();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t TurnPairRestatementClassification.restatementTurnId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for TurnPairRestatementClassification() + 20);
  v4 = sub_213EF1D64();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t TurnPairRestatementClassification.scoredComparisons.getter()
{
  type metadata accessor for TurnPairRestatementClassification();
  return swift_bridgeObjectRetain();
}

uint64_t TurnPairRestatementClassification.referencedTurns.getter()
{
  type metadata accessor for TurnPairRestatementClassification();
  return swift_bridgeObjectRetain();
}

uint64_t TurnPairRestatementClassification.referencedEvents.getter()
{
  type metadata accessor for TurnPairRestatementClassification();
  return swift_bridgeObjectRetain();
}

uint64_t sub_213EC8B70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, unint64_t, uint64_t);
  char v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD v27[2];
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v5 = sub_213EF1D64();
  v36 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = type metadata accessor for TurnPairRestatementClassification();
  v8 = MEMORY[0x24BDAC7A8](v28);
  v32 = (uint64_t)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v35 = (uint64_t)v27 - v11;
  result = MEMORY[0x24BEE4AF8];
  v38 = MEMORY[0x24BEE4AF8];
  v31 = *(_QWORD *)(a1 + 16);
  if (v31)
  {
    v27[1] = v2;
    v13 = 0;
    v14 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    v33 = *(_QWORD *)(v10 + 72);
    v29 = v14;
    v30 = a1 + v14;
    v37 = a2 + 56;
    v15 = a2;
    do
    {
      v34 = v13;
      sub_213DCA7E4(v30 + v33 * v13, v35, (uint64_t (*)(_QWORD))type metadata accessor for TurnPairRestatementClassification);
      if (*(_QWORD *)(a2 + 16)
        && (sub_213DE8A88((unint64_t *)&qword_253F06928, MEMORY[0x24BDCEA88]),
            v16 = sub_213EF27E4(),
            v17 = -1 << *(_BYTE *)(v15 + 32),
            v18 = v16 & ~v17,
            ((*(_QWORD *)(v37 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) != 0))
      {
        v19 = v15;
        v20 = ~v17;
        v21 = *(_QWORD *)(v36 + 72);
        v22 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 16);
        while (1)
        {
          v22(v7, *(_QWORD *)(v19 + 48) + v21 * v18, v5);
          sub_213DE8A88((unint64_t *)&qword_253F06930, MEMORY[0x24BDCEA98]);
          v23 = sub_213EF2838();
          (*(void (**)(char *, uint64_t))(v36 + 8))(v7, v5);
          if ((v23 & 1) != 0)
            break;
          v18 = (v18 + 1) & v20;
          v19 = v15;
          if (((*(_QWORD *)(v37 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) == 0)
            goto LABEL_10;
        }
        sub_213DCA828(v35, (uint64_t (*)(_QWORD))type metadata accessor for TurnPairRestatementClassification);
      }
      else
      {
LABEL_10:
        sub_213DBB430(v35, v32, (uint64_t (*)(_QWORD))type metadata accessor for TurnPairRestatementClassification);
        v24 = v38;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_213DCD12C(0, *(_QWORD *)(v24 + 16) + 1, 1);
          v24 = v38;
        }
        v26 = *(_QWORD *)(v24 + 16);
        v25 = *(_QWORD *)(v24 + 24);
        if (v26 >= v25 >> 1)
        {
          sub_213DCD12C(v25 > 1, v26 + 1, 1);
          v24 = v38;
        }
        *(_QWORD *)(v24 + 16) = v26 + 1;
        sub_213DBB430(v32, v24 + v29 + v26 * v33, (uint64_t (*)(_QWORD))type metadata accessor for TurnPairRestatementClassification);
      }
      v13 = v34 + 1;
      a2 = v15;
    }
    while (v34 + 1 != v31);
    return v38;
  }
  return result;
}

unint64_t sub_213EC8E94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
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
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD v22[3];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v26 = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_253F06DC0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = type metadata accessor for TurnPairRestatementClassification();
  v9 = *(_QWORD *)(v25 - 8);
  v10 = MEMORY[0x24BDAC7A8](v25);
  v24 = (uint64_t)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v23 = (uint64_t)v22 - v12;
  v13 = *(_QWORD *)(a1 + 16);
  if (!v13)
    return MEMORY[0x24BEE4AF8];
  v14 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F069A0) - 8);
  v15 = a1 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
  v16 = *(_QWORD *)(v14 + 72);
  v22[1] = a1;
  swift_bridgeObjectRetain();
  v17 = MEMORY[0x24BEE4AF8];
  v22[2] = a3;
  do
  {
    sub_213EC765C(v15, (uint64_t)v8);
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v17;
    }
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, v25) == 1)
    {
      sub_213DAFEC4((uint64_t)v8, qword_253F06DC0);
    }
    else
    {
      v18 = v23;
      sub_213DBB430((uint64_t)v8, v23, (uint64_t (*)(_QWORD))type metadata accessor for TurnPairRestatementClassification);
      sub_213DBB430(v18, v24, (uint64_t (*)(_QWORD))type metadata accessor for TurnPairRestatementClassification);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v17 = sub_213DB5AF0(0, *(_QWORD *)(v17 + 16) + 1, 1, v17);
      v20 = *(_QWORD *)(v17 + 16);
      v19 = *(_QWORD *)(v17 + 24);
      if (v20 >= v19 >> 1)
        v17 = sub_213DB5AF0(v19 > 1, v20 + 1, 1, v17);
      *(_QWORD *)(v17 + 16) = v20 + 1;
      sub_213DBB430(v24, v17+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(_QWORD *)(v9 + 72) * v20, (uint64_t (*)(_QWORD))type metadata accessor for TurnPairRestatementClassification);
    }
    v15 += v16;
    --v13;
  }
  while (v13);
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_213EC9104(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char v17;
  _QWORD v18[2];
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  __int128 v25;
  uint64_t v26;
  _OWORD v27[2];
  uint64_t v28;

  v23 = type metadata accessor for FeaturisedTurn(0);
  v2 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for FeaturisedSession(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (_QWORD *)((char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (!v9)
    goto LABEL_22;
  v19 = (_QWORD *)((char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v20 = a1;
  v22 = v8 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v21 = *(_QWORD *)(v2 + 72);
  v18[1] = v8;
  swift_bridgeObjectRetain_n();
  for (i = 0; i != v9; ++i)
  {
    sub_213DCA7E4(v22 + v21 * i, (uint64_t)v4, type metadata accessor for FeaturisedTurn);
    v11 = *(_QWORD *)&v4[*(int *)(v23 + 24)];
    v12 = *(_QWORD *)(v11 + 16);
    if (v12)
    {
      v13 = v11 + 32;
      swift_bridgeObjectRetain_n();
      while (1)
      {
        sub_213DAFDFC(v13, (uint64_t)&v25);
        sub_213DAFDFC((uint64_t)&v25, (uint64_t)v24);
        __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
        type metadata accessor for UsoPersonRecipients();
        if (swift_dynamicCast())
          break;
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v25);
        v13 += 40;
        if (!--v12)
        {
          swift_bridgeObjectRelease();
          goto LABEL_12;
        }
      }
      swift_bridgeObjectRelease();
      swift_release();
      sub_213DB0BF0(&v25, (uint64_t)v27);
    }
    else
    {
      swift_bridgeObjectRetain();
LABEL_12:
      v28 = 0;
      memset(v27, 0, sizeof(v27));
    }
    sub_213DCC3D8((uint64_t)v27, (uint64_t)&v25, &qword_253F06970);
    if (!v26)
    {
      sub_213DAFEC4((uint64_t)&v25, &qword_253F06970);
LABEL_4:
      sub_213DAFEC4((uint64_t)v27, &qword_253F06970);
      swift_bridgeObjectRelease();
      sub_213DCA828((uint64_t)v4, type metadata accessor for FeaturisedTurn);
      continue;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
    type metadata accessor for UsoPersonRecipients();
    if ((swift_dynamicCast() & 1) == 0)
      goto LABEL_4;
    swift_retain();
    sub_213EF23D0();
    swift_release_n();
    v14 = v25;
    sub_213DAFEC4((uint64_t)v27, &qword_253F06970);
    swift_bridgeObjectRelease();
    if (v14 >> 62)
    {
      swift_bridgeObjectRetain();
      v15 = sub_213EF306C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    sub_213DCA828((uint64_t)v4, type metadata accessor for FeaturisedTurn);
    if (v15 >= 2)
    {
      swift_bridgeObjectRelease_n();
      v7 = v19;
      sub_213DCA7E4(v20, (uint64_t)v19, type metadata accessor for FeaturisedSession);
      v17 = 1;
      goto LABEL_23;
    }
  }
  swift_bridgeObjectRelease_n();
  v7 = v19;
  a1 = v20;
LABEL_22:
  sub_213DCA7E4(a1, (uint64_t)v7, type metadata accessor for FeaturisedSession);
  v17 = sub_213DE4FA8(*v7);
LABEL_23:
  sub_213DCA828((uint64_t)v7, type metadata accessor for FeaturisedSession);
  return v17 & 1;
}

uint64_t type metadata accessor for TurnPairRestatementClassification()
{
  uint64_t result;

  result = qword_253F06DB0;
  if (!qword_253F06DB0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t method lookup function for PartialRepetitionClassifier()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PartialRepetitionClassifier.__allocating_init(turnComparators:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of PartialRepetitionClassifier.classify(_:classifications:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t *initializeBufferWithCopyOfBuffer for TurnPairRestatementClassification(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  uint64_t v10;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_213EF1D64();
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + a3[5]), (uint64_t *)((char *)a2 + a3[5]), v7);
    v9 = a3[7];
    *(uint64_t *)((char *)a1 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    *(uint64_t *)((char *)a1 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for TurnPairRestatementClassification(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v4 = sub_213EF1D64();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + *(int *)(a2 + 20), v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TurnPairRestatementClassification(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  v6 = sub_213EF1D64();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[7];
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TurnPairRestatementClassification(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_213EF1D64();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for TurnPairRestatementClassification(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  v6 = sub_213EF1D64();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[7];
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  return a1;
}

uint64_t assignWithTake for TurnPairRestatementClassification(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_213EF1D64();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TurnPairRestatementClassification()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_213EC98C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_213EF1D64();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for TurnPairRestatementClassification()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_213EC994C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_213EF1D64();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

uint64_t sub_213EC99C4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_213EF1D64();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_213EC9A40@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_213EC6F94(a1, *(NSObject **)(v2 + 16), a2);
}

uint64_t sub_213EC9A58()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t PlusMediaSuggestionStore.readAllNominated()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = (*(uint64_t (**)(void))(a2 + 40))();
  v3 = sub_213EC9AD8(v2);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_213EC9AD8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD v13[8];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v16 = type metadata accessor for PlusMediaSuggestion();
  v3 = MEMORY[0x24BDAC7A8](v16);
  v13[4] = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v13 - v6;
  result = MEMORY[0x24BEE4AF8];
  v18 = MEMORY[0x24BEE4AF8];
  v15 = *(_QWORD *)(a1 + 16);
  if (v15)
  {
    v9 = 0;
    v10 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    v13[1] = v1;
    v13[2] = v10;
    v14 = a1 + v10;
    v13[3] = MEMORY[0x24BEE4AF8];
    v17 = *(_QWORD *)(v5 + 72);
    v13[6] = "nominationBlocked";
    v13[7] = "Type_Song";
    v13[5] = "previouslyNominated";
    do
    {
      sub_213DE6348(v14 + v17 * v9, (uint64_t)v7);
      v11 = *(_QWORD *)&v7[*(int *)(v16 + 44)];
      if (*(_QWORD *)(v11 + 16))
      {
        sub_213EF32F4();
        sub_213EF28BC();
        v12 = sub_213EF3330() & ~(-1 << *(_BYTE *)(v11 + 32));
        if (((*(_QWORD *)(v11 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) != 0)
          __asm { BR              X9 }
      }
      sub_213DEA4CC((uint64_t)v7);
      ++v9;
    }
    while (v9 != v15);
    return v18;
  }
  return result;
}

uint64_t dispatch thunk of PlusMediaSuggestionStore.insert(pims:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of PlusMediaSuggestionStore.delete(pims:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of PlusMediaSuggestionStore.update(pims:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of PlusMediaSuggestionStore.resetStore()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of PlusMediaSuggestionStore.readAll()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of PlusMediaSuggestionStore.find(key:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of PlusMediaSuggestionStore.find(uuid:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of PlusMediaSuggestionStore.delete(uuid:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of PlusMediaSuggestionStore.delete(mediaId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 72))();
}

uint64_t dispatch thunk of PlusMediaSuggestionStore.readAllMediaReferences()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of PlusMediaSuggestionStore.recordStoreUpdate(source:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 88))();
}

uint64_t dispatch thunk of PlusMediaSuggestionStore.mostRecentStoreUpdate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

BOOL isOutgoingCoreDuetPhoneCall(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  char v7;
  _BOOL8 result;

  v1 = *(_QWORD *)(a1 + 24);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = swift_bridgeObjectRetain();
  v4 = sub_213DAF3E0(v3);
  v6 = v5;
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
    return 0;
  if (v1 == 0xD000000000000011 && v2 == 0x8000000213F04860)
    return v4 == 1;
  v7 = sub_213EF3234();
  result = 0;
  if ((v7 & 1) != 0)
    return v4 == 1;
  return result;
}

uint64_t isSiriPhoneCall(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  type metadata accessor for FeaturisedTurn(0);
  v0 = swift_bridgeObjectRetain();
  v1 = sub_213DAF220(v0);
  v3 = v2;
  swift_bridgeObjectRelease();
  if (v3)
  {
    if (v1 != 0xD000000000000016 || v3 != 0x8000000213F0A290)
    {
      v4 = sub_213EF3234();
LABEL_20:
      swift_bridgeObjectRelease();
      return v4 & 1;
    }
LABEL_19:
    v4 = 1;
    goto LABEL_20;
  }
  v5 = swift_bridgeObjectRetain();
  v6 = sub_213DAF3B0(v5);
  swift_bridgeObjectRelease();
  if (v6)
  {
    v7 = *(_QWORD *)(v6 + 16);
    if (v7)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v8 = sub_213DAFF00();
      result = swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
      {
LABEL_18:
        swift_bridgeObjectRelease();
        goto LABEL_19;
      }
      if (v7 != 1)
      {
        v10 = v6 + 56;
        v11 = 1;
        while (1)
        {
          v12 = v11 + 1;
          if (__OFADD__(v11, 1))
            break;
          swift_bridgeObjectRetain();
          v13 = sub_213DAFF00();
          result = swift_bridgeObjectRelease();
          if ((v13 & 1) != 0)
            goto LABEL_18;
          ++v11;
          v10 += 16;
          if (v12 == v7)
            goto LABEL_13;
        }
        __break(1u);
        goto LABEL_31;
      }
LABEL_13:
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  v14 = swift_bridgeObjectRetain();
  v15 = sub_213DAF3BC(v14);
  swift_bridgeObjectRelease();
  if (!v15)
  {
    v4 = 0;
    return v4 & 1;
  }
  v16 = *(_QWORD *)(v15 + 16);
  if (!v16)
  {
    v4 = 0;
    goto LABEL_20;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17 = sub_213DAFF00();
  result = swift_bridgeObjectRelease();
  if ((v17 & 1) != 0)
    goto LABEL_18;
  if (v16 == 1)
  {
LABEL_29:
    swift_bridgeObjectRelease();
    v4 = 0;
    goto LABEL_20;
  }
  v18 = v15 + 56;
  v19 = 1;
  while (1)
  {
    v20 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    swift_bridgeObjectRetain();
    v21 = sub_213DAFF00();
    result = swift_bridgeObjectRelease();
    if ((v21 & 1) != 0)
      goto LABEL_18;
    ++v19;
    v18 += 16;
    if (v20 == v16)
      goto LABEL_29;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_213ECA210@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  unint64_t v15;
  unint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  uint64_t *v35;
  uint64_t *v36;
  _QWORD v37[2];
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t *__return_ptr, uint64_t);
  uint64_t v42;
  uint64_t v43;
  int64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v38 = a3;
  v43 = type metadata accessor for FeaturisedTurn(0);
  v47 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v42 = (uint64_t)v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F069B0);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v46 = (char *)v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v45 = (uint64_t)v37 - v9;
  v10 = *a1;
  v39 = a1[1];
  v12 = a1[2];
  v11 = a1[3];
  v13 = a1[5];
  v41 = (void (*)(uint64_t *__return_ptr, uint64_t))a1[4];
  v44 = v11 >> 1;
  v37[1] = v10;
  swift_unknownObjectRetain();
  v48 = v13;
  result = swift_retain();
  v40 = v12;
  v49 = v12;
  v50 = a2;
  while (1)
  {
LABEL_9:
    v25 = v49;
    if (v49 == v44)
    {
      v26 = 1;
      v27 = v44;
      v29 = (uint64_t)v46;
      v28 = v47;
      v30 = v45;
    }
    else
    {
      v29 = (uint64_t)v46;
      v28 = v47;
      v30 = v45;
      if (v49 < v40 || v49 >= v44)
        goto LABEL_20;
      sub_213DCA7E4(v39 + *(_QWORD *)(v47 + 72) * v49, v45, type metadata accessor for FeaturisedTurn);
      v26 = 0;
      v27 = v25 + 1;
    }
    v31 = v43;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 56))(v30, v26, 1, v43);
    sub_213E6D464(v30, v29);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v28 + 48))(v29, 1, v31) == 1)
    {
      swift_bridgeObjectRelease();
      swift_release();
      swift_unknownObjectRelease();
      result = swift_bridgeObjectRelease();
      v36 = v38;
      v38[4] = 0;
      *(_OWORD *)v36 = 0u;
      *((_OWORD *)v36 + 1) = 0u;
      return result;
    }
    v49 = v27;
    v32 = v42;
    sub_213DBB430(v29, v42, type metadata accessor for FeaturisedTurn);
    v41(&v51, v32);
    v24 = v50;
    v33 = v51;
    sub_213DCA828(v32, type metadata accessor for FeaturisedTurn);
    result = swift_bridgeObjectRelease();
    v34 = v33;
    if (v33)
    {
      v15 = *(_QWORD *)(v33 + 16);
      if (v15)
        break;
    }
  }
  v16 = 0;
  v17 = (uint64_t *)(v33 + 64);
  while (v16 < v15)
  {
    if (*(_QWORD *)(v24 + 16))
    {
      v18 = *(v17 - 1);
      v19 = *v17;
      v20 = *(v17 - 3);
      v21 = *(v17 - 2);
      v22 = *(v17 - 4);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_213DFA220(v22, v20);
      if ((v23 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        swift_unknownObjectRelease();
        result = swift_bridgeObjectRelease();
        v35 = v38;
        *v38 = v22;
        v35[1] = v20;
        v35[2] = v21;
        v35[3] = v18;
        v35[4] = v19;
        return result;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease_n();
      v24 = v50;
    }
    ++v16;
    v15 = *(_QWORD *)(v34 + 16);
    v17 += 5;
    if (v16 == v15)
      goto LABEL_9;
  }
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

uint64_t sub_213ECA544(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  unint64_t v12;
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = sub_213EF1D64();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 + 16);
  v8 = MEMORY[0x24BEE4AF8];
  if (v7)
  {
    v15 = v1;
    v17 = MEMORY[0x24BEE4AF8];
    sub_213DCD514(0, v7, 0);
    v8 = v17;
    v9 = *(_QWORD *)(type metadata accessor for FeaturisedTurn(0) - 8);
    v10 = a1 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    v16 = *(_QWORD *)(v9 + 72);
    v11 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    do
    {
      v11(v6, v10, v3);
      v17 = v8;
      v13 = *(_QWORD *)(v8 + 16);
      v12 = *(_QWORD *)(v8 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_213DCD514(v12 > 1, v13 + 1, 1);
        v8 = v17;
      }
      *(_QWORD *)(v8 + 16) = v13 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v8+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(_QWORD *)(v4 + 72) * v13, v6, v3);
      v10 += v16;
      --v7;
    }
    while (v7);
  }
  return v8;
}

uint64_t sub_213ECA6AC()
{
  uint64_t result;

  type metadata accessor for MessagesContactSuggestionGroundTruthGenerator();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F06F98);
  sub_213EF288C();
  sub_213EF2904();
  swift_bridgeObjectRelease();
  result = sub_213EF2904();
  qword_253F06F78 = 91;
  unk_253F06F80 = 0xE100000000000000;
  return result;
}

uint64_t MessagesContactSuggestionGroundTruthGenerator.__allocating_init(suggestionStore:)(__int128 *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  sub_213DB0BF0(a1, v2 + 16);
  return v2;
}

uint64_t MessagesContactSuggestionGroundTruthGenerator.init(suggestionStore:)(__int128 *a1)
{
  uint64_t v1;

  sub_213DB0BF0(a1, v1 + 16);
  return v1;
}

unint64_t sub_213ECA788(uint64_t a1, uint64_t a2)
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
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74[5];
  __int128 v75;
  uint64_t v76;
  _OWORD v77[2];
  uint64_t v78;
  uint64_t v79;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F06F70);
  MEMORY[0x24BDAC7A8](v4);
  v58 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = type metadata accessor for ContactSuggestionProvidedClassification();
  v73 = *(_QWORD *)(v72 - 8);
  v6 = MEMORY[0x24BDAC7A8](v72);
  v71 = (uint64_t)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v68 = (uint64_t)&v57 - v8;
  v9 = type metadata accessor for FeaturisedTurn(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v67 = (uint64_t)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v57 - v13;
  v15 = MEMORY[0x24BEE4AF8];
  v79 = MEMORY[0x24BEE4AF8];
  v16 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  v66 = v16;
  v61 = a2;
  v60 = a1;
  if (!v16)
  {
LABEL_33:
    swift_bridgeObjectRelease();
    v35 = sub_213ECA544(v15);
    swift_release();
    v36 = sub_213DDDF4C(v35);
    swift_bridgeObjectRelease();
    v37 = *(_QWORD *)(a2 + 16);
    if (v37)
    {
      v70 = v36;
      v38 = a2 + 32;
      swift_bridgeObjectRetain();
      v39 = MEMORY[0x24BEE4AF8];
      v40 = (uint64_t)v58;
      do
      {
        sub_213DAFDFC(v38, (uint64_t)v77);
        sub_213DAFDFC((uint64_t)v77, (uint64_t)&v75);
        __swift_instantiateConcreteTypeFromMangledName(&qword_253F06990);
        v41 = v72;
        v42 = swift_dynamicCast();
        v43 = v73;
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v73 + 56))(v40, v42 ^ 1u, 1, v41);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v77);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48))(v40, 1, v41) == 1)
        {
          sub_213DAFEC4(v40, &qword_253F06F70);
        }
        else
        {
          v44 = v68;
          sub_213DBB430(v40, v68, (uint64_t (*)(_QWORD))type metadata accessor for ContactSuggestionProvidedClassification);
          sub_213DBB430(v44, v71, (uint64_t (*)(_QWORD))type metadata accessor for ContactSuggestionProvidedClassification);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v39 = sub_213DB61F0(0, *(_QWORD *)(v39 + 16) + 1, 1, v39);
          v46 = *(_QWORD *)(v39 + 16);
          v45 = *(_QWORD *)(v39 + 24);
          if (v46 >= v45 >> 1)
            v39 = sub_213DB61F0(v45 > 1, v46 + 1, 1, v39);
          *(_QWORD *)(v39 + 16) = v46 + 1;
          sub_213DBB430(v71, v39+ ((*(unsigned __int8 *)(v73 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v73 + 80))+ *(_QWORD *)(v73 + 72) * v46, (uint64_t (*)(_QWORD))type metadata accessor for ContactSuggestionProvidedClassification);
        }
        v38 += 40;
        --v37;
      }
      while (v37);
      a2 = v61;
      swift_bridgeObjectRelease();
      a1 = v60;
      v36 = v70;
    }
    else
    {
      v39 = MEMORY[0x24BEE4AF8];
    }
    v31 = sub_213ECC394(v39, v36);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v47 = v59;
    swift_retain();
    v25 = sub_213ECC91C(v31, v47, a1, a2);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_253F04A88 != -1)
      goto LABEL_53;
    goto LABEL_46;
  }
  v17 = 0;
  v18 = *(_QWORD *)(v10 + 72);
  v62 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v70 = a1 + v62;
  v19 = v18;
  v69 = "call::common_PhoneCall";
  v65 = 0x8000000213F0A2B0;
  v20 = v66;
  v64 = v9;
  v63 = v18;
  while (1)
  {
    sub_213DCA7E4(v70 + v19 * v17, (uint64_t)v14, type metadata accessor for FeaturisedTurn);
    v21 = *(_QWORD *)&v14[*(int *)(v9 + 24)];
    v22 = *(_QWORD *)(v21 + 16);
    if (v22)
    {
      v23 = v21 + 32;
      swift_bridgeObjectRetain_n();
      while (1)
      {
        sub_213DAFDFC(v23, (uint64_t)&v75);
        sub_213DAFDFC((uint64_t)&v75, (uint64_t)v74);
        __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
        sub_213EF2214();
        if (swift_dynamicCast())
          break;
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v75);
        v23 += 40;
        if (!--v22)
        {
          swift_bridgeObjectRelease();
          goto LABEL_14;
        }
      }
      swift_bridgeObjectRelease();
      swift_release();
      sub_213DB0BF0(&v75, (uint64_t)v77);
    }
    else
    {
      swift_bridgeObjectRetain();
LABEL_14:
      v78 = 0;
      memset(v77, 0, sizeof(v77));
    }
    sub_213DCC3D8((uint64_t)v77, (uint64_t)&v75, &qword_253F06970);
    if (v76)
      break;
    sub_213DAFEC4((uint64_t)&v75, &qword_253F06970);
LABEL_4:
    sub_213DAFEC4((uint64_t)v77, &qword_253F06970);
LABEL_5:
    swift_bridgeObjectRelease();
LABEL_6:
    sub_213DCA828((uint64_t)v14, type metadata accessor for FeaturisedTurn);
LABEL_7:
    if (++v17 == v20)
    {
      v15 = v79;
      a2 = v61;
      a1 = v60;
      goto LABEL_33;
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
  sub_213EF2214();
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_4;
  swift_retain();
  sub_213EF23D0();
  swift_release_n();
  v24 = v75;
  sub_213DAFEC4((uint64_t)v77, &qword_253F06970);
  swift_bridgeObjectRelease();
  v25 = *(_QWORD *)(v24 + 16);
  if (!v25)
    goto LABEL_5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v26 = sub_213DAFF00();
  swift_bridgeObjectRelease();
  if ((v26 & 1) != 0)
  {
LABEL_20:
    swift_bridgeObjectRelease_n();
    sub_213DBB430((uint64_t)v14, v67, type metadata accessor for FeaturisedTurn);
    v27 = v79;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v19 = v63;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_213DCD09C(0, *(_QWORD *)(v27 + 16) + 1, 1);
      v27 = v79;
    }
    v9 = v64;
    v20 = v66;
    v30 = *(_QWORD *)(v27 + 16);
    v29 = *(_QWORD *)(v27 + 24);
    if (v30 >= v29 >> 1)
    {
      sub_213DCD09C(v29 > 1, v30 + 1, 1);
      v27 = v79;
    }
    *(_QWORD *)(v27 + 16) = v30 + 1;
    sub_213DBB430(v67, v27 + v62 + v30 * v19, type metadata accessor for FeaturisedTurn);
    goto LABEL_7;
  }
  if (v25 == 1)
  {
LABEL_31:
    swift_bridgeObjectRelease_n();
    v9 = v64;
    v20 = v66;
    v19 = v63;
    goto LABEL_6;
  }
  v31 = v24 + 56;
  v32 = 1;
  while (1)
  {
    v33 = v32 + 1;
    if (__OFADD__(v32, 1))
      break;
    swift_bridgeObjectRetain();
    v34 = sub_213DAFF00();
    swift_bridgeObjectRelease();
    if ((v34 & 1) != 0)
      goto LABEL_20;
    ++v32;
    v31 += 16;
    if (v33 == v25)
      goto LABEL_31;
  }
  __break(1u);
LABEL_53:
  swift_once();
LABEL_46:
  v48 = sub_213EF2724();
  __swift_project_value_buffer(v48, (uint64_t)qword_253F08A00);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v49 = sub_213EF270C();
  v50 = sub_213EF2C94();
  if (os_log_type_enabled(v49, v50))
  {
    v51 = swift_slowAlloc();
    v52 = swift_slowAlloc();
    *(_QWORD *)&v77[0] = v52;
    *(_DWORD *)v51 = 136315650;
    if (qword_253F06F90 != -1)
      swift_once();
    v53 = qword_253F06F78;
    v54 = unk_253F06F80;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v75 = sub_213DB0570(v53, v54, (uint64_t *)v77);
    sub_213EF2D9C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v51 + 12) = 2048;
    *(_QWORD *)&v75 = *(_QWORD *)(v25 + 16);
    sub_213EF2D9C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v51 + 22) = 2048;
    v55 = *(_QWORD *)(v31 + 16);
    swift_bridgeObjectRelease();
    *(_QWORD *)&v75 = v55;
    sub_213EF2D9C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_213DAB000, v49, v50, "%s Generated ground truth for %ld/%ld contact suggestions in messages.", (uint8_t *)v51, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2199C53C4](v52, -1, -1);
    MEMORY[0x2199C53C4](v51, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
  }
  return v25;
}

uint64_t sub_213ECB164@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  _QWORD *v4;
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
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
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;
  int *v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  char *v57;
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
  uint64_t v68;

  v58 = a2;
  v59 = a3;
  v66 = a4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F06C68);
  MEMORY[0x24BDAC7A8](v6);
  v63 = (uint64_t)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for EntityPromptClassification();
  v61 = *(_QWORD *)(v8 - 8);
  v62 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F04828);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_213EF1D64();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F06B28);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v57 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for PlusContactSuggestion();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v64 = (uint64_t)&v57 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = type metadata accessor for ContactSuggestionProvidedClassification();
  v24 = *(int *)(v60 + 20);
  v65 = a1;
  v25 = a1 + v24;
  v26 = type metadata accessor for PlusContactSuggestionRuntimeSummary(0);
  sub_213DCC3D8(v25 + *(int *)(v26 + 20), (uint64_t)v13, &qword_253F04828);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) != 1)
  {
    v57 = v10;
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v14);
    v27 = v15;
    v28 = v4[5];
    v29 = v4[6];
    __swift_project_boxed_opaque_existential_1(v4 + 2, v28);
    (*(void (**)(char *, uint64_t, uint64_t))(v29 + 64))(v17, v28, v29);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v17, v14);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) == 1)
      goto LABEL_4;
    v42 = v64;
    sub_213DBB430((uint64_t)v20, v64, (uint64_t (*)(_QWORD))type metadata accessor for PlusContactSuggestion);
    v43 = v65;
    v44 = v63;
    sub_213DCC3D8(v65 + *(int *)(v60 + 24), v63, &qword_253F06C68);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v61 + 48))(v44, 1, v62) == 1)
    {
      sub_213DAFEC4(v44, &qword_253F06C68);
    }
    else
    {
      v45 = v44;
      v46 = (uint64_t)v57;
      sub_213DBB430(v45, (uint64_t)v57, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
      if ((sub_213E76530(*(_QWORD *)(v42 + *(int *)(v21 + 24)), *(_QWORD *)(v42 + *(int *)(v21 + 24) + 8), *(_QWORD **)(v46 + 32)) & 1) != 0)
      {
        sub_213ECB7A8(v42, (_QWORD *)v46, &v68);
        sub_213DCA828(v46, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
LABEL_18:
        v47 = v68;
        v48 = v66;
        sub_213EF1D58();
        v49 = *(_QWORD *)(v42 + *(int *)(v21 + 20));
        v50 = (int *)type metadata accessor for ContactSuggestionOutcomeGroundTruth();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v48 + v50[6], v42, v14);
        v51 = (uint64_t *)(v42 + *(int *)(v21 + 24));
        v52 = *v51;
        v53 = v51[1];
        v55 = v51[2];
        v54 = v51[3];
        *(_QWORD *)(v48 + v50[5]) = v49;
        v56 = (_QWORD *)(v48 + v50[7]);
        *v56 = v52;
        v56[1] = v53;
        v56[2] = v55;
        v56[3] = v54;
        *(_WORD *)(v48 + v50[8]) = v47;
        *(_BYTE *)(v48 + v50[9]) = 1;
        swift_bridgeObjectRetain();
        swift_retain();
        swift_bridgeObjectRetain();
        sub_213DCA828(v42, (uint64_t (*)(_QWORD))type metadata accessor for PlusContactSuggestion);
        return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, int *))(*((_QWORD *)v50 - 1) + 56))(v48, 0, 1, v50);
      }
      sub_213DCA828(v46, (uint64_t (*)(_QWORD))type metadata accessor for EntityPromptClassification);
    }
    sub_213ECB8D8(v43, v42, v58, v59, (__int16 *)&v68);
    goto LABEL_18;
  }
  sub_213DAFEC4((uint64_t)v13, &qword_253F04828);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56))(v20, 1, 1, v21);
LABEL_4:
  sub_213DAFEC4((uint64_t)v20, &qword_253F06B28);
  v30 = sub_213EF1D10();
  v32 = v31;
  if (qword_253F04A88 != -1)
    swift_once();
  v33 = sub_213EF2724();
  __swift_project_value_buffer(v33, (uint64_t)qword_253F08A00);
  swift_bridgeObjectRetain();
  v34 = sub_213EF270C();
  v35 = sub_213EF2CA0();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = swift_slowAlloc();
    v37 = swift_slowAlloc();
    v68 = v37;
    *(_DWORD *)v36 = 136315394;
    if (qword_253F06F90 != -1)
      swift_once();
    v38 = qword_253F06F78;
    v39 = unk_253F06F80;
    swift_bridgeObjectRetain();
    v67 = sub_213DB0570(v38, v39, &v68);
    sub_213EF2D9C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v36 + 12) = 2080;
    swift_bridgeObjectRetain();
    v67 = sub_213DB0570(v30, v32, &v68);
    sub_213EF2D9C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_213DAB000, v34, v35, "%s Contact suggestion with runtimeId=%s is missing from the suggestion store. Skipping ground truth generation", (uint8_t *)v36, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2199C53C4](v37, -1, -1);
    MEMORY[0x2199C53C4](v36, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v40 = type metadata accessor for ContactSuggestionOutcomeGroundTruth();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v66, 1, 1, v40);
}

uint64_t sub_213ECB7A8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, _WORD *a3@<X8>)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t result;
  __int16 v12;
  char v13;
  char v14;

  v6 = *(_QWORD *)(a2[4] + 16);
  v7 = type metadata accessor for PlusContactSuggestion();
  v8 = a2[6];
  if (v8)
  {
    v9 = (_QWORD *)(a1 + *(int *)(v7 + 24));
    result = a2[5];
    if (result == *v9 && v8 == v9[1])
    {
      v12 = 0;
    }
    else
    {
      result = sub_213EF3234();
      v12 = (result & 1) == 0;
    }
  }
  else
  {
    sub_213E94618((uint64_t)a2, &v14);
    if ((v14 & 1) != 0)
    {
      result = swift_bridgeObjectRelease();
      v12 = 2;
    }
    else
    {
      v13 = sub_213EF3234();
      result = swift_bridgeObjectRelease();
      if ((v13 & 1) != 0)
        v12 = 2;
      else
        v12 = 3;
    }
  }
  *a3 = (v6 < 2) | (unsigned __int16)(v12 << 8);
  return result;
}

uint64_t sub_213ECB8D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, __int16 *a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void (*v19)(unint64_t, uint64_t, uint64_t);
  void (*v20)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  char *v26;
  uint64_t result;
  void (*v28)(char *, char *, uint64_t);
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int16 v36;
  __int16 *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  __int128 v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  __int128 v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint8_t *v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint64_t v55;
  _QWORD *v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  _BOOL4 v68;
  uint64_t v69;
  unint64_t v70;
  BOOL v71;
  uint64_t v72;
  NSObject *v73;
  os_log_type_t v74;
  _BOOL4 v75;
  uint8_t *v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  __int16 *v90;
  char *v91;
  __int128 v92;
  uint64_t v93[5];
  __int128 v94;
  __int128 v95;
  uint64_t v96;
  uint64_t v97[7];

  v89 = a4;
  v88 = a2;
  v90 = a5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F04828);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v80 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v80 - v11;
  v13 = sub_213EF1D64();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v91 = (char *)&v80 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D3A840);
  v16 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_213EF53E0;
  v18 = v17 + v16;
  v19 = *(void (**)(unint64_t, uint64_t, uint64_t))(v14 + 16);
  v19(v17 + v16, a1, v13);
  v19((unint64_t)v10, v18, v13);
  v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  v20(v10, 0, 1, v13);
  swift_bridgeObjectRelease();
  v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  if (v21(v10, 1, v13) == 1)
  {
    v22 = a3;
    if (*(_QWORD *)(a3 + 16))
    {
      v23 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for FeaturisedTurn(0) - 8) + 80);
      v19((unint64_t)v12, a3 + ((v23 + 32) & ~v23), v13);
      v24 = 0;
    }
    else
    {
      v24 = 1;
    }
    v20(v12, v24, 1, v13);
    sub_213DAFEC4((uint64_t)v10, &qword_253F04828);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v12, v10, v13);
    v20(v12, 0, 1, v13);
    v22 = a3;
  }
  v25 = v21(v12, 1, v13);
  v26 = v91;
  if (v25 == 1)
  {
    result = sub_213DAFEC4((uint64_t)v12, &qword_253F04828);
LABEL_14:
    v36 = 3;
LABEL_15:
    v37 = v90;
    goto LABEL_16;
  }
  v86 = v14;
  v28 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  v87 = v13;
  v28(v91, v12, v13);
  v29 = *(_QWORD *)(v22 + 16);
  if (!v29)
  {
LABEL_13:
    result = (*(uint64_t (**)(char *, uint64_t))(v86 + 8))(v26, v87);
    goto LABEL_14;
  }
  v30 = type metadata accessor for FeaturisedTurn(0);
  v31 = 0;
  v32 = *(_QWORD *)(v30 - 8);
  v33 = v22 + ((*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80));
  v34 = *(_QWORD *)(v32 + 72);
  v35 = v33;
  while ((sub_213EF1D28() & 1) == 0)
  {
    ++v31;
    v35 += v34;
    if (v29 == v31)
      goto LABEL_13;
  }
  v83 = v30;
  v84 = v29;
  v38 = (2 * v29) | 1;
  v39 = *(_QWORD *)(v89 + 16);
  v85 = v22;
  if (v39)
  {
    v81 = v38;
    v82 = v33;
    v40 = v89 + 32;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v41 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      sub_213DAFDFC(v40, (uint64_t)v97);
      sub_213DAFDFC((uint64_t)v97, (uint64_t)v93);
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F06990);
      if ((swift_dynamicCast() & 1) == 0)
      {
        v96 = 0;
        v94 = 0u;
        v95 = 0u;
      }
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v97);
      if ((_QWORD)v95)
      {
        v92 = v95;
        v43 = v94;
        v44 = v96;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v41 = sub_213DB5FAC(0, v41[2] + 1, 1, v41);
        v46 = v41[2];
        v45 = v41[3];
        v12 = (char *)(v46 + 1);
        v47 = v92;
        if (v46 >= v45 >> 1)
        {
          v48 = sub_213DB5FAC((_QWORD *)(v45 > 1), v46 + 1, 1, v41);
          v47 = v92;
          v41 = v48;
        }
        v41[2] = v12;
        v42 = &v41[5 * v46];
        *((_BYTE *)v42 + 32) = v43 & 1;
        v42[5] = *((_QWORD *)&v43 + 1);
        *((_OWORD *)v42 + 3) = v47;
        v42[8] = v44;
      }
      v40 += 40;
      --v39;
    }
    while (v39);
    swift_bridgeObjectRelease();
    v49 = v85;
    v33 = v82;
    v38 = v81;
  }
  else
  {
    swift_bridgeObjectRetain();
    v49 = v22;
    v41 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v50 = sub_213ECC6B4((uint64_t)v41);
  swift_bridgeObjectRelease();
  v97[0] = v49;
  v97[1] = v33;
  v97[2] = v31;
  v97[3] = v38;
  v97[4] = (uint64_t)sub_213ECC300;
  v97[5] = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_213ECA210(v97, v50, (uint64_t *)&v94);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v51 = (uint8_t *)*((_QWORD *)&v94 + 1);
  v52 = v94;
  v54 = BYTE8(v95);
  v53 = v95;
  if (v84 == v31)
    goto LABEL_38;
  if (v31 >= v84)
  {
    __break(1u);
    goto LABEL_66;
  }
  v55 = swift_bridgeObjectRetain();
  v56 = (_QWORD *)sub_213DAE9A8(v55);
  swift_bridgeObjectRelease();
  if (!v56
    || (v57 = sub_213E76530(0xD000000000000029, 0x8000000213F04700, v56), swift_bridgeObjectRelease(),
                                                                              (v57 & 1) == 0))
  {
LABEL_38:
    sub_213DC7B60(v52, (uint64_t)v51);
    if (qword_253F04A88 != -1)
      swift_once();
    v67 = sub_213EF2724();
    __swift_project_value_buffer(v67, (uint64_t)qword_253F08A00);
    v53 = sub_213EF270C();
    v54 = sub_213EF2C94();
    v68 = os_log_type_enabled(v53, v54);
    v37 = v90;
    v38 = v87;
    v33 = v86;
    if (!v68)
    {

      swift_bridgeObjectRelease();
      goto LABEL_52;
    }
    v51 = (uint8_t *)swift_slowAlloc();
    v12 = (char *)swift_slowAlloc();
    *(_QWORD *)&v94 = v12;
    *(_DWORD *)v51 = 136315138;
    if (qword_253F06F90 == -1)
    {
LABEL_42:
      v69 = qword_253F06F78;
      v70 = unk_253F06F80;
      swift_bridgeObjectRetain();
      v93[0] = sub_213DB0570(v69, v70, (uint64_t *)&v94);
      sub_213EF2D9C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_213DAB000, v53, v54, "%s Suggestion was used in messages domain without a prompt but not for a send message task. Marking as unknown.", v51, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C53C4](v12, -1, -1);
      MEMORY[0x2199C53C4](v51, -1, -1);
      swift_bridgeObjectRelease();

      v37 = v90;
LABEL_52:
      result = (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v91, v38);
      v36 = 2;
      goto LABEL_16;
    }
LABEL_66:
    swift_once();
    goto LABEL_42;
  }
  if (!v51)
  {
    swift_bridgeObjectRelease();
    result = (*(uint64_t (**)(char *, uint64_t))(v86 + 8))(v91, v87);
    v36 = 5;
    goto LABEL_15;
  }
  v58 = swift_bridgeObjectRetain();
  v59 = sub_213DAE9B4(v58);
  sub_213DC7B60(v52, (uint64_t)v51);
  swift_bridgeObjectRelease();
  v60 = v87;
  v61 = v86;
  if (v59)
  {
    v62 = *(_QWORD *)(v59 + 16);
    if (v62)
    {
      v63 = (uint64_t *)(v88 + *(int *)(type metadata accessor for PlusContactSuggestion() + 24));
      v64 = *v63;
      v65 = v63[1];
      v66 = (_QWORD *)(v59 + 56);
      v37 = v90;
      do
      {
        if (*v66)
        {
          v71 = *(v66 - 1) == v64 && *v66 == v65;
          if (v71 || (sub_213EF3234() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v61 + 8))(v91, v60);
            result = swift_bridgeObjectRelease();
            v36 = 4;
            goto LABEL_16;
          }
        }
        v66 += 6;
        --v62;
      }
      while (v62);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      v37 = v90;
    }
    (*(void (**)(char *, uint64_t))(v61 + 8))(v91, v60);
    result = swift_bridgeObjectRelease();
    v36 = 7;
  }
  else
  {
    if (qword_253F04A88 != -1)
      swift_once();
    v72 = sub_213EF2724();
    __swift_project_value_buffer(v72, (uint64_t)qword_253F08A00);
    v73 = sub_213EF270C();
    v74 = sub_213EF2CA0();
    v75 = os_log_type_enabled(v73, v74);
    v37 = v90;
    if (v75)
    {
      v76 = (uint8_t *)swift_slowAlloc();
      v77 = swift_slowAlloc();
      *(_QWORD *)&v94 = v77;
      *(_DWORD *)v76 = 136315138;
      if (qword_253F06F90 != -1)
        swift_once();
      v78 = qword_253F06F78;
      v79 = unk_253F06F80;
      swift_bridgeObjectRetain();
      v93[0] = sub_213DB0570(v78, v79, (uint64_t *)&v94);
      sub_213EF2D9C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_213DAB000, v73, v74, "%s Failed to find contact references for send message event. Send message event features may be incomplete.", v76, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C53C4](v77, -1, -1);
      MEMORY[0x2199C53C4](v76, -1, -1);
      swift_bridgeObjectRelease();

      v37 = v90;
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    result = (*(uint64_t (**)(char *, uint64_t))(v61 + 8))(v91, v60);
    v36 = 3;
  }
LABEL_16:
  *v37 = v36;
  return result;
}

uint64_t sub_213ECC300@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(a1 + *(int *)(type metadata accessor for FeaturisedTurn(0) + 28));
  return swift_bridgeObjectRetain();
}

uint64_t MessagesContactSuggestionGroundTruthGenerator.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return v0;
}

uint64_t MessagesContactSuggestionGroundTruthGenerator.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocClassInstance();
}

unint64_t sub_213ECC374(uint64_t a1, uint64_t a2)
{
  return sub_213ECA788(a1, a2);
}

uint64_t sub_213ECC394(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  char v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  _QWORD v29[2];
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v5 = sub_213EF1D64();
  v36 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for ContactSuggestionProvidedClassification();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v31 = (uint64_t)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v29 - v12;
  result = MEMORY[0x24BEE4AF8];
  v38 = MEMORY[0x24BEE4AF8];
  v33 = *(_QWORD *)(a1 + 16);
  if (v33)
  {
    v15 = 0;
    v16 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    v34 = *(_QWORD *)(v11 + 72);
    v29[1] = v2;
    v30 = v16;
    v32 = a1 + v16;
    v37 = a2 + 56;
    v17 = a2;
    do
    {
      v35 = v15;
      sub_213DCA7E4(v32 + v34 * v15, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for ContactSuggestionProvidedClassification);
      if (*(_QWORD *)(v17 + 16)
        && (v18 = v17,
            sub_213DB0DB4((unint64_t *)&qword_253F06928, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]), v19 = sub_213EF27E4(), v20 = -1 << *(_BYTE *)(v17 + 32), v21 = v19 & ~v20, ((*(_QWORD *)(v37 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) != 0))
      {
        v22 = ~v20;
        v23 = *(_QWORD *)(v36 + 72);
        v24 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 16);
        while (1)
        {
          v24(v7, *(_QWORD *)(v17 + 48) + v23 * v21, v5);
          sub_213DB0DB4((unint64_t *)&qword_253F06930, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
          v25 = sub_213EF2838();
          (*(void (**)(char *, uint64_t))(v36 + 8))(v7, v5);
          if ((v25 & 1) != 0)
            break;
          v21 = (v21 + 1) & v22;
          v17 = v18;
          if (((*(_QWORD *)(v37 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
            goto LABEL_3;
        }
        sub_213DBB430((uint64_t)v13, v31, (uint64_t (*)(_QWORD))type metadata accessor for ContactSuggestionProvidedClassification);
        v26 = v38;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_213DCD794(0, *(_QWORD *)(v26 + 16) + 1, 1);
          v26 = v38;
        }
        v28 = *(_QWORD *)(v26 + 16);
        v27 = *(_QWORD *)(v26 + 24);
        if (v28 >= v27 >> 1)
        {
          sub_213DCD794(v27 > 1, v28 + 1, 1);
          v26 = v38;
        }
        *(_QWORD *)(v26 + 16) = v28 + 1;
        sub_213DBB430(v31, v26 + v30 + v28 * v34, (uint64_t (*)(_QWORD))type metadata accessor for ContactSuggestionProvidedClassification);
        v17 = v18;
      }
      else
      {
LABEL_3:
        sub_213DCA828((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for ContactSuggestionProvidedClassification);
      }
      v15 = v35 + 1;
    }
    while (v35 + 1 != v33);
    return v38;
  }
  return result;
}

uint64_t sub_213ECC6B4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *i;
  _QWORD *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t result;
  char v30;
  __int128 v31;
  _QWORD *v32;

  v1 = (_QWORD *)MEMORY[0x24BEE4B00];
  v32 = (_QWORD *)MEMORY[0x24BEE4B00];
  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return (uint64_t)v1;
  for (i = (_QWORD *)(a1 + 64); ; i += 5)
  {
    v5 = *((_BYTE *)i - 32);
    v6 = *(i - 3);
    v31 = *((_OWORD *)i - 1);
    v7 = *i;
    v8 = *(i - 2);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10 = sub_213DFA220(v6, v8);
    v11 = v1[2];
    v12 = (v9 & 1) == 0;
    v13 = v11 + v12;
    if (__OFADD__(v11, v12))
      break;
    v14 = v9;
    if (v1[3] < v13)
    {
      sub_213DFF45C(v13, 1);
      v1 = v32;
      v15 = sub_213DFA220(v6, v8);
      if ((v14 & 1) != (v16 & 1))
        goto LABEL_19;
      v10 = v15;
    }
    if ((v14 & 1) != 0)
    {
      v30 = v5;
      swift_bridgeObjectRelease();
      v17 = v1[7];
      v18 = *(_QWORD **)(v17 + 8 * v10);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)(v17 + 8 * v10) = v18;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v18 = sub_213DB5FAC(0, v18[2] + 1, 1, v18);
        *(_QWORD *)(v17 + 8 * v10) = v18;
      }
      v21 = v18[2];
      v20 = v18[3];
      v22 = v21 + 1;
      if (v21 >= v20 >> 1)
      {
        v23 = sub_213DB5FAC((_QWORD *)(v20 > 1), v21 + 1, 1, v18);
        v22 = v21 + 1;
        v18 = v23;
        *(_QWORD *)(v17 + 8 * v10) = v23;
      }
      v18[2] = v22;
      v4 = &v18[5 * v21];
      *((_BYTE *)v4 + 32) = v30;
      v4[5] = v6;
      *((_OWORD *)v4 + 3) = v31;
      v4[8] = v7;
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D3A618);
      v24 = swift_allocObject();
      *(_OWORD *)(v24 + 16) = xmmword_213EF53E0;
      *(_BYTE *)(v24 + 32) = v5;
      *(_QWORD *)(v24 + 40) = v6;
      *(_OWORD *)(v24 + 48) = v31;
      *(_QWORD *)(v24 + 64) = v7;
      v1[(v10 >> 6) + 8] |= 1 << v10;
      v25 = (uint64_t *)(v1[6] + 16 * v10);
      *v25 = v6;
      v25[1] = v8;
      *(_QWORD *)(v1[7] + 8 * v10) = v24;
      v26 = v1[2];
      v27 = __OFADD__(v26, 1);
      v28 = v26 + 1;
      if (v27)
        goto LABEL_18;
      v1[2] = v28;
    }
    if (!--v2)
      return (uint64_t)v1;
  }
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  result = sub_213EF3288();
  __break(1u);
  return result;
}

unint64_t sub_213ECC91C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
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
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F06E80);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = type metadata accessor for ContactSuggestionOutcomeGroundTruth();
  v11 = *(_QWORD *)(v29 - 8);
  v12 = MEMORY[0x24BDAC7A8](v29);
  v28 = (uint64_t)v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v27 = (uint64_t)v24 - v14;
  v15 = *(_QWORD *)(a1 + 16);
  if (!v15)
    return MEMORY[0x24BEE4AF8];
  v24[1] = v4;
  v16 = *(_QWORD *)(type metadata accessor for ContactSuggestionProvidedClassification() - 8);
  v17 = a1 + ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80));
  v18 = *(_QWORD *)(v16 + 72);
  v24[0] = a1;
  swift_bridgeObjectRetain();
  v19 = MEMORY[0x24BEE4AF8];
  v25 = a3;
  v26 = a4;
  do
  {
    sub_213ECB164(v17, a3, a4, (uint64_t)v10);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, v29) == 1)
    {
      sub_213DAFEC4((uint64_t)v10, &qword_253F06E80);
    }
    else
    {
      v20 = v27;
      sub_213DBB430((uint64_t)v10, v27, (uint64_t (*)(_QWORD))type metadata accessor for ContactSuggestionOutcomeGroundTruth);
      sub_213DBB430(v20, v28, (uint64_t (*)(_QWORD))type metadata accessor for ContactSuggestionOutcomeGroundTruth);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v19 = sub_213DB7404(0, *(_QWORD *)(v19 + 16) + 1, 1, v19);
      v22 = *(_QWORD *)(v19 + 16);
      v21 = *(_QWORD *)(v19 + 24);
      if (v22 >= v21 >> 1)
        v19 = sub_213DB7404(v21 > 1, v22 + 1, 1, v19);
      *(_QWORD *)(v19 + 16) = v22 + 1;
      sub_213DBB430(v28, v19+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(_QWORD *)(v11 + 72) * v22, (uint64_t (*)(_QWORD))type metadata accessor for ContactSuggestionOutcomeGroundTruth);
      a3 = v25;
      a4 = v26;
    }
    v17 += v18;
    --v15;
  }
  while (v15);
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t sub_213ECCB74()
{
  return sub_213DB0DB4(&qword_253F04D10, (uint64_t (*)(uint64_t))type metadata accessor for ContactSuggestionOutcomeGroundTruth, (uint64_t)&protocol conformance descriptor for ContactSuggestionOutcomeGroundTruth);
}

uint64_t type metadata accessor for MessagesContactSuggestionGroundTruthGenerator()
{
  return objc_opt_self();
}

uint64_t method lookup function for MessagesContactSuggestionGroundTruthGenerator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MessagesContactSuggestionGroundTruthGenerator.__allocating_init(suggestionStore:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of MessagesContactSuggestionGroundTruthGenerator.generate(session:classifications:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t sub_213ECCBE0(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v23;
  int64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return v2;
  v3 = a1;
  v29 = MEMORY[0x24BEE4AF8];
  sub_213DCD45C(0, v1, 0);
  v2 = v29;
  result = sub_213EA6F20(v3);
  v6 = result;
  v7 = 0;
  v8 = v3 + 64;
  v23 = v3 + 80;
  v24 = v1;
  v25 = v5;
  v26 = v3 + 64;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(_BYTE *)(v3 + 32))
  {
    v11 = (unint64_t)v6 >> 6;
    if ((*(_QWORD *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0)
      goto LABEL_23;
    if (*(_DWORD *)(v3 + 36) != v5)
      goto LABEL_24;
    v12 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 32 * v6);
    v13 = v12[1];
    v27 = *v12;
    v28 = *(_BYTE *)(*(_QWORD *)(v3 + 56) + 4 * v6);
    v14 = v3;
    v15 = *(_QWORD *)(v29 + 16);
    v16 = *(_QWORD *)(v29 + 24);
    result = swift_bridgeObjectRetain();
    if (v15 >= v16 >> 1)
      result = sub_213DCD45C(v16 > 1, v15 + 1, 1);
    *(_QWORD *)(v29 + 16) = v15 + 1;
    v17 = v29 + 24 * v15;
    *(_QWORD *)(v17 + 32) = v27;
    *(_QWORD *)(v17 + 40) = v13;
    *(_BYTE *)(v17 + 48) = v28;
    v9 = 1 << *(_BYTE *)(v14 + 32);
    if (v6 >= v9)
      goto LABEL_25;
    v8 = v26;
    v18 = *(_QWORD *)(v26 + 8 * v11);
    if ((v18 & (1 << v6)) == 0)
      goto LABEL_26;
    v3 = v14;
    v5 = v25;
    if (*(_DWORD *)(v14 + 36) != v25)
      goto LABEL_27;
    v19 = v18 & (-2 << (v6 & 0x3F));
    if (v19)
    {
      v9 = __clz(__rbit64(v19)) | v6 & 0xFFFFFFFFFFFFFFC0;
      v10 = v24;
    }
    else
    {
      v20 = v11 + 1;
      v21 = (unint64_t)(v9 + 63) >> 6;
      v10 = v24;
      if (v11 + 1 < v21)
      {
        v22 = *(_QWORD *)(v26 + 8 * v20);
        if (v22)
        {
LABEL_20:
          v9 = __clz(__rbit64(v22)) + (v20 << 6);
        }
        else
        {
          while (v21 - 2 != v11)
          {
            v22 = *(_QWORD *)(v23 + 8 * v11++);
            if (v22)
            {
              v20 = v11 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    ++v7;
    v6 = v9;
    if (v7 == v10)
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

uint64_t sub_213ECCE08(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  int64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return v2;
  v3 = a1;
  v30 = MEMORY[0x24BEE4AF8];
  sub_213DCD478(0, v1, 0);
  v2 = v30;
  result = sub_213EA6F20(v3);
  v6 = result;
  v7 = 0;
  v8 = v3 + 64;
  v24 = v3 + 80;
  v25 = v1;
  v26 = v5;
  v27 = v3 + 64;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(_BYTE *)(v3 + 32))
  {
    v11 = (unint64_t)v6 >> 6;
    if ((*(_QWORD *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0)
      goto LABEL_23;
    if (*(_DWORD *)(v3 + 36) != v5)
      goto LABEL_24;
    v28 = v7;
    v12 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 32 * v6);
    v13 = v12[1];
    v29 = *v12;
    v14 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v6);
    v15 = v3;
    v17 = *(_QWORD *)(v30 + 16);
    v16 = *(_QWORD *)(v30 + 24);
    swift_bridgeObjectRetain();
    result = swift_bridgeObjectRetain();
    if (v17 >= v16 >> 1)
      result = sub_213DCD478(v16 > 1, v17 + 1, 1);
    *(_QWORD *)(v30 + 16) = v17 + 1;
    v18 = (_QWORD *)(v30 + 24 * v17);
    v18[4] = v29;
    v18[5] = v13;
    v18[6] = v14;
    v9 = 1 << *(_BYTE *)(v15 + 32);
    if (v6 >= v9)
      goto LABEL_25;
    v8 = v27;
    v19 = *(_QWORD *)(v27 + 8 * v11);
    if ((v19 & (1 << v6)) == 0)
      goto LABEL_26;
    v3 = v15;
    v5 = v26;
    if (*(_DWORD *)(v15 + 36) != v26)
      goto LABEL_27;
    v20 = v19 & (-2 << (v6 & 0x3F));
    if (v20)
    {
      v9 = __clz(__rbit64(v20)) | v6 & 0xFFFFFFFFFFFFFFC0;
      v10 = v25;
    }
    else
    {
      v21 = v11 + 1;
      v22 = (unint64_t)(v9 + 63) >> 6;
      v10 = v25;
      if (v11 + 1 < v22)
      {
        v23 = *(_QWORD *)(v27 + 8 * v21);
        if (v23)
        {
LABEL_20:
          v9 = __clz(__rbit64(v23)) + (v21 << 6);
        }
        else
        {
          while (v22 - 2 != v11)
          {
            v23 = *(_QWORD *)(v24 + 8 * v11++);
            if (v23)
            {
              v21 = v11 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    v7 = v28 + 1;
    v6 = v9;
    if (v28 + 1 == v10)
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

uint64_t sub_213ECD034(uint64_t a1, uint64_t a2)
{
  return sub_213ECD04C(a1, a2, (uint64_t (*)(char *, _QWORD))sub_213DD5F54);
}

uint64_t sub_213ECD040(uint64_t a1, uint64_t a2)
{
  return sub_213ECD04C(a1, a2, (uint64_t (*)(char *, _QWORD))sub_213DD62CC);
}

uint64_t sub_213ECD04C(uint64_t result, uint64_t a2, uint64_t (*a3)(char *, _QWORD))
{
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  char v16;
  uint64_t v17;

  v4 = result;
  v5 = 0;
  v17 = a2;
  v6 = result + 56;
  v7 = 1 << *(_BYTE *)(result + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(result + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v12 = v11 | (v5 << 6);
      goto LABEL_5;
    }
    v13 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v13 >= v10)
      goto LABEL_23;
    v14 = *(_QWORD *)(v6 + 8 * v13);
    ++v5;
    if (!v14)
    {
      v5 = v13 + 1;
      if (v13 + 1 >= v10)
        goto LABEL_23;
      v14 = *(_QWORD *)(v6 + 8 * v5);
      if (!v14)
      {
        v5 = v13 + 2;
        if (v13 + 2 >= v10)
          goto LABEL_23;
        v14 = *(_QWORD *)(v6 + 8 * v5);
        if (!v14)
        {
          v5 = v13 + 3;
          if (v13 + 3 >= v10)
            goto LABEL_23;
          v14 = *(_QWORD *)(v6 + 8 * v5);
          if (!v14)
            break;
        }
      }
    }
LABEL_22:
    v9 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v5 << 6);
LABEL_5:
    result = a3(&v16, *(unsigned __int8 *)(*(_QWORD *)(v4 + 48) + v12));
  }
  v15 = v13 + 4;
  if (v15 >= v10)
  {
LABEL_23:
    swift_release();
    return v17;
  }
  v14 = *(_QWORD *)(v6 + 8 * v15);
  if (v14)
  {
    v5 = v15;
    goto LABEL_22;
  }
  while (1)
  {
    v5 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v5 >= v10)
      goto LABEL_23;
    v14 = *(_QWORD *)(v6 + 8 * v5);
    ++v15;
    if (v14)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_213ECD1B0(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  char v14;
  uint64_t v15;

  v2 = result;
  v3 = 0;
  v15 = a2;
  v4 = result + 64;
  v5 = 1 << *(_BYTE *)(result + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(result + 64);
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
    v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v11 >= v8)
      goto LABEL_23;
    v12 = *(_QWORD *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      v3 = v11 + 1;
      if (v11 + 1 >= v8)
        goto LABEL_23;
      v12 = *(_QWORD *)(v4 + 8 * v3);
      if (!v12)
      {
        v3 = v11 + 2;
        if (v11 + 2 >= v8)
          goto LABEL_23;
        v12 = *(_QWORD *)(v4 + 8 * v3);
        if (!v12)
        {
          v3 = v11 + 3;
          if (v11 + 3 >= v8)
            goto LABEL_23;
          v12 = *(_QWORD *)(v4 + 8 * v3);
          if (!v12)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v3 << 6);
LABEL_5:
    result = sub_213DD6CF0(&v14, *(unsigned __int8 *)(*(_QWORD *)(v2 + 48) + v10));
  }
  v13 = v11 + 4;
  if (v13 >= v8)
  {
LABEL_23:
    swift_release();
    return v15;
  }
  v12 = *(_QWORD *)(v4 + 8 * v13);
  if (v12)
  {
    v3 = v13;
    goto LABEL_22;
  }
  while (1)
  {
    v3 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v3 >= v8)
      goto LABEL_23;
    v12 = *(_QWORD *)(v4 + 8 * v3);
    ++v13;
    if (v12)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_213ECD308()
{
  return sub_213ECD370((void (*)(void))sub_213E7F60C, (uint64_t (*)(void))sub_213ECCBE0, &qword_254D3BD78, (void (*)(uint64_t, uint64_t, uint64_t *))sub_213ECDCD0);
}

uint64_t sub_213ECD33C()
{
  return sub_213ECD370((void (*)(void))sub_213E7F7E0, (uint64_t (*)(void))sub_213ECCE08, &qword_254D3BD70, (void (*)(uint64_t, uint64_t, uint64_t *))sub_213ECE050);
}

uint64_t sub_213ECD370(void (*a1)(void), uint64_t (*a2)(void), uint64_t *a3, void (*a4)(uint64_t, uint64_t, uint64_t *))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  a1();
  v7 = a2();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v7 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    v8 = sub_213EF309C();
  }
  else
  {
    v8 = MEMORY[0x24BEE4B00];
  }
  v11 = v8;
  v9 = swift_bridgeObjectRetain();
  a4(v9, 1, &v11);
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_213ECD440()
{
  return sub_213ECD370((void (*)(void))sub_213E7FB4C, (uint64_t (*)(void))sub_213ECCBE0, &qword_254D3BD78, (void (*)(uint64_t, uint64_t, uint64_t *))sub_213ECDCD0);
}

uint64_t sub_213ECD474()
{
  return sub_213ECD370((void (*)(void))sub_213E7F9E0, (uint64_t (*)(void))sub_213ECCE08, &qword_254D3BD70, (void (*)(uint64_t, uint64_t, uint64_t *))sub_213ECE050);
}

uint64_t sub_213ECD4A8()
{
  return sub_213ECD370((void (*)(void))sub_213E7FF4C, (uint64_t (*)(void))sub_213ECCBE0, &qword_254D3BD78, (void (*)(uint64_t, uint64_t, uint64_t *))sub_213ECDCD0);
}

uint64_t sub_213ECD4DC()
{
  return sub_213ECD370((void (*)(void))sub_213E7FEA0, (uint64_t (*)(void))sub_213ECCE08, &qword_254D3BD70, (void (*)(uint64_t, uint64_t, uint64_t *))sub_213ECE050);
}

uint64_t sub_213ECD510()
{
  return swift_retain();
}

uint64_t sub_213ECD51C()
{
  return sub_213ECD370((void (*)(void))sub_213E80420, (uint64_t (*)(void))sub_213ECCBE0, &qword_254D3BD78, (void (*)(uint64_t, uint64_t, uint64_t *))sub_213ECDCD0);
}

uint64_t sub_213ECD550()
{
  return sub_213ECD370((void (*)(void))sub_213E804F4, (uint64_t (*)(void))sub_213ECCE08, &qword_254D3BD70, (void (*)(uint64_t, uint64_t, uint64_t *))sub_213ECE050);
}

uint64_t sub_213ECD584@<X0>(uint64_t a1@<X0>, unsigned __int8 a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  int v9;
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
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
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
  char *v78;
  uint64_t v79[4];
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;

  v9 = a2;
  v10 = type metadata accessor for ThinContactGroundTruth();
  v11 = *(_QWORD *)(v10 - 8);
  v76 = v10;
  v77 = v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v75 = (uint64_t)&v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v67 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F04828);
  MEMORY[0x24BDAC7A8](v16);
  v78 = (char *)&v67 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D3E8D0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v67 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)&v67 - v24;
  v26 = MEMORY[0x24BDAC7A8](v23);
  v27 = MEMORY[0x24BDAC7A8](v26);
  if (v9 == 8)
    return sub_213E25084(a1, a5);
  v72 = v27;
  v73 = v30;
  v74 = a5;
  (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))((char *)&v67 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0), a3, a4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D3A748);
  if (swift_dynamicCast())
  {
    v67 = v15;
    sub_213DE638C(&v80, &v83);
    v32 = v84;
    v33 = v85;
    __swift_project_boxed_opaque_existential_1(&v83, v84);
    v34 = (*(uint64_t (**)(uint64_t, uint64_t))(v33 + 24))(v32, v33);
    v35 = type metadata accessor for PlusContactSuggestion();
    v36 = (uint64_t *)(a1 + *(int *)(v35 + 24));
    v37 = *v36;
    v38 = v36[1];
    v40 = v36[2];
    v39 = v36[3];
    v41 = *(_QWORD *)(v34 + 16);
    v71 = a1;
    v68 = v35;
    v69 = v40;
    if (v41)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v42 = sub_213DFA374(v37, v38, v40, v39);
      if ((v43 & 1) != 0)
      {
        v70 = *(_QWORD *)(*(_QWORD *)(v34 + 56) + 8 * v42);
        swift_bridgeObjectRetain();
      }
      else
      {
        v70 = MEMORY[0x24BEE4B08];
      }
      v45 = (uint64_t)v67;
      v44 = v37;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      v44 = v37;
      v70 = MEMORY[0x24BEE4B08];
      v45 = (uint64_t)v67;
    }
    swift_bridgeObjectRelease();
    v46 = v84;
    v47 = v86;
    v48 = __swift_project_boxed_opaque_existential_1(&v83, v84);
    *((_QWORD *)&v81 + 1) = v46;
    *(_QWORD *)&v82 = v47;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v80);
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v46 - 8) + 16))(boxed_opaque_existential_1, v48, v46);
    v79[0] = v44;
    v79[1] = v38;
    v79[2] = v69;
    v79[3] = v39;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v50 = v73;
    ThinContactGroundTruth.init(completeGroundTruth:rightHandContext:)(&v80, v79, v73);
    v51 = v68;
    v52 = v71;
    v69 = *(_QWORD *)(v71 + *(int *)(v68 + 28));
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D408E8);
    v53 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
    v54 = swift_allocObject();
    *(_OWORD *)(v54 + 16) = xmmword_213EF53E0;
    v55 = v54 + v53;
    sub_213ECDBFC(v50, v55);
    sub_213ECDBFC(v55, (uint64_t)v25);
    sub_213ECDC44((uint64_t)v25, (uint64_t)v22);
    v56 = v77;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v77 + 48))(v22, 1, v76) == 1)
    {
      sub_213DAFEC4((uint64_t)v22, &qword_254D3E8D0);
      v57 = MEMORY[0x24BEE4AF8];
    }
    else
    {
      sub_213ECDC8C((uint64_t)v22, v45);
      v58 = v75;
      sub_213ECDC8C(v45, v75);
      v57 = MEMORY[0x24BEE4AF8];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v57 = sub_213DB646C(0, *(_QWORD *)(v57 + 16) + 1, 1, v57);
      v60 = *(_QWORD *)(v57 + 16);
      v59 = *(_QWORD *)(v57 + 24);
      if (v60 >= v59 >> 1)
        v57 = sub_213DB646C(v59 > 1, v60 + 1, 1, v57);
      *(_QWORD *)(v57 + 16) = v60 + 1;
      sub_213ECDC8C(v58, v57+ ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))+ *(_QWORD *)(v56 + 72) * v60);
    }
    v61 = v74;
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    *(_QWORD *)&v80 = v69;
    swift_bridgeObjectRetain();
    sub_213DB46F8(v57);
    v62 = v80;
    v63 = sub_213EF1D64();
    v64 = (uint64_t)v78;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 56))(v78, 1, 1, v63);
    v80 = 0u;
    v81 = 0u;
    v65 = *(_QWORD *)(v52 + *(int *)(v51 + 36));
    swift_bridgeObjectRetain();
    v66 = sub_213ECD04C(v70, v65, (uint64_t (*)(char *, _QWORD))sub_213DD62CC);
    sub_213E7BA00(v64, 0, (uint64_t *)&v80, v62, 0, 1, v66, 0, v61, 1, 0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_213DAFEC4(v64, &qword_253F04828);
    sub_213DAFEC4(v73, &qword_254D3E8D0);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v83);
  }
  else
  {
    v81 = 0u;
    v82 = 0u;
    v80 = 0u;
    sub_213DAFEC4((uint64_t)&v80, &qword_254D3FF30);
    return sub_213E25084(a1, v74);
  }
}

uint64_t type metadata accessor for ContactSuggestionCandidateProcessor()
{
  uint64_t result;

  result = qword_254D40800;
  if (!qword_254D40800)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_213ECDBFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D3E8D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_213ECDC44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D3E8D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_213ECDC8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ThinContactGroundTruth();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_213ECDCD0(uint64_t a1, char a2, _QWORD *a3)
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
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
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
  char v42;

  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v42 = *(_BYTE *)(a1 + 48);
  swift_bridgeObjectRetain();
  v9 = (_QWORD *)*a3;
  swift_bridgeObjectRetain();
  v11 = sub_213DFA220(v8, v7);
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
      sub_213E00CAC();
      if ((v15 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v20 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    v21 = (uint64_t *)(v20[6] + 16 * v11);
    *v21 = v8;
    v21[1] = v7;
    *(_BYTE *)(v20[7] + v11) = v42;
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
    v26 = (_BYTE *)(a1 + 72);
    while (1)
    {
      v28 = *((_QWORD *)v26 - 2);
      v27 = *((_QWORD *)v26 - 1);
      v29 = *v26;
      v30 = (_QWORD *)*a3;
      swift_bridgeObjectRetain();
      v31 = sub_213DFA220(v28, v27);
      v33 = v30[2];
      v34 = (v32 & 1) == 0;
      v23 = __OFADD__(v33, v34);
      v35 = v33 + v34;
      if (v23)
        break;
      v36 = v32;
      if (v30[3] < v35)
      {
        sub_213DFC8D8(v35, 1);
        v31 = sub_213DFA220(v28, v27);
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
      *(_BYTE *)(v38[7] + v31) = v29;
      v40 = v38[2];
      v23 = __OFADD__(v40, 1);
      v41 = v40 + 1;
      if (v23)
        goto LABEL_24;
      v26 += 24;
      v38[2] = v41;
      if (!--v25)
        goto LABEL_22;
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_213DFC8D8(v14, a2 & 1);
  v16 = sub_213DFA220(v8, v7);
  if ((v15 & 1) == (v17 & 1))
  {
    v11 = v16;
    if ((v15 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    v18 = (void *)swift_allocError();
    swift_willThrow();
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F04F00);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_213EF3288();
  __break(1u);
LABEL_26:
  sub_213EF2EB0();
  sub_213EF2904();
  sub_213EF3000();
  sub_213EF2904();
  sub_213EF3054();
  __break(1u);
}

void sub_213ECE050(_QWORD *a1, char a2, _QWORD *a3)
{
  uint64_t v6;
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
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
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
  uint64_t v42;

  if (!a1[2])
  {
    swift_bridgeObjectRelease();
    return;
  }
  v42 = a1[2];
  v7 = a1[4];
  v6 = a1[5];
  v8 = a1[6];
  swift_bridgeObjectRetain();
  v9 = (_QWORD *)*a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = sub_213DFA220(v7, v6);
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
      sub_213E00E54();
      if ((v15 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v20 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    v21 = (uint64_t *)(v20[6] + 16 * v11);
    *v21 = v7;
    v21[1] = v6;
    *(_QWORD *)(v20[7] + 8 * v11) = v8;
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
    v25 = v42 - 1;
    if (v42 == 1)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    v26 = a1 + 9;
    while (1)
    {
      v28 = *(v26 - 2);
      v27 = *(v26 - 1);
      v29 = *v26;
      v30 = (_QWORD *)*a3;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v31 = sub_213DFA220(v28, v27);
      v33 = v30[2];
      v34 = (v32 & 1) == 0;
      v23 = __OFADD__(v33, v34);
      v35 = v33 + v34;
      if (v23)
        break;
      v36 = v32;
      if (v30[3] < v35)
      {
        sub_213DFCBE0(v35, 1);
        v31 = sub_213DFA220(v28, v27);
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
      *(_QWORD *)(v38[7] + 8 * v31) = v29;
      v40 = v38[2];
      v23 = __OFADD__(v40, 1);
      v41 = v40 + 1;
      if (v23)
        goto LABEL_24;
      v38[2] = v41;
      v26 += 3;
      if (!--v25)
        goto LABEL_22;
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_213DFCBE0(v14, a2 & 1);
  v16 = sub_213DFA220(v7, v6);
  if ((v15 & 1) == (v17 & 1))
  {
    v11 = v16;
    if ((v15 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    v18 = (void *)swift_allocError();
    swift_willThrow();
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F04F00);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_213EF3288();
  __break(1u);
LABEL_26:
  sub_213EF2EB0();
  sub_213EF2904();
  sub_213EF3000();
  sub_213EF2904();
  sub_213EF3054();
  __break(1u);
}

uint64_t sub_213ECE3E0(uint64_t a1, uint64_t a2)
{
  return sub_213ECE3F8(a1, a2, (void (*)(char *, _QWORD))sub_213DD62CC);
}

uint64_t sub_213ECE3EC(uint64_t a1, uint64_t a2)
{
  return sub_213ECE3F8(a1, a2, (void (*)(char *, _QWORD))sub_213DD5F54);
}

uint64_t sub_213ECE3F8(uint64_t a1, uint64_t a2, void (*a3)(char *, _QWORD))
{
  uint64_t v3;
  unsigned __int8 *v5;
  unsigned int v6;
  char v8;
  uint64_t v9;

  v9 = a2;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v5 = (unsigned __int8 *)(a1 + 32);
    do
    {
      v6 = *v5++;
      a3(&v8, v6);
      --v3;
    }
    while (v3);
    return v9;
  }
  return a2;
}

uint64_t sub_213ECE458()
{
  uint64_t result;

  type metadata accessor for PLUSOfflineLogHelpers();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D40900);
  sub_213EF288C();
  sub_213EF2904();
  swift_bridgeObjectRelease();
  result = sub_213EF2904();
  qword_254D408F0 = 91;
  *(_QWORD *)algn_254D408F8 = 0xE100000000000000;
  return result;
}

double static PLUSOfflineLogHelpers.privacyApprovedFollowUpDetectionPeriod.getter()
{
  return 60.0;
}

double static PLUSOfflineLogHelpers.privacyApprovedMetadataAnalysisPeriod.getter()
{
  return 30.0;
}

uint64_t PLUSOfflineLogHelpers.__allocating_init(logTarget:)(__int128 *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = swift_allocObject();
  type metadata accessor for SELFEventLogEmitters();
  v3 = swift_allocObject();
  sub_213DB0BF0(a1, v3 + 16);
  *(_QWORD *)(v2 + 16) = v3;
  return v2;
}

uint64_t PLUSOfflineLogHelpers.init(logTarget:)(__int128 *a1)
{
  uint64_t v1;
  uint64_t v3;

  type metadata accessor for SELFEventLogEmitters();
  v3 = swift_allocObject();
  sub_213DB0BF0(a1, v3 + 16);
  *(_QWORD *)(v1 + 16) = v3;
  return v1;
}

void sub_213ECE5A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  os_log_type_t v15;
  uint8_t *v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F04828);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_213E9F0F4(a1, 60.0, 30.0);
  if (v9)
  {
    v10 = v9;
    sub_213DBDD88(a2, (uint64_t)v8);
    v11 = sub_213EF1D64();
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v8, 1, v11) == 1)
    {
      sub_213DAFEC4((uint64_t)v8, &qword_253F04828);
      v13 = 0;
    }
    else
    {
      v17 = objc_allocWithZone(MEMORY[0x24BE95C78]);
      v18 = (void *)sub_213EF1D1C();
      v13 = objc_msgSend(v17, sel_initWithNSUUID_, v18);

      (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v11);
    }
    objc_msgSend(v10, sel_setOriginalPlusId_, v13);

    sub_213E0D90C((uint64_t)v10, a3);
  }
  else
  {
    if (qword_253F04A88 != -1)
      swift_once();
    v14 = sub_213EF2724();
    __swift_project_value_buffer(v14, (uint64_t)qword_253F08A00);
    v20 = sub_213EF270C();
    v15 = sub_213EF2C94();
    if (os_log_type_enabled(v20, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_213DAB000, v20, v15, "Skipping phone call metadata logging - No applicable metadata found.", v16, 2u);
      MEMORY[0x2199C53C4](v16, -1, -1);
    }

  }
}

void sub_213ECE7C4(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *);
  void (*v29)(char *, uint64_t);
  unsigned int (*v30)(char *, uint64_t, uint64_t);
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v52 = a3;
  v51 = type metadata accessor for PlusContactSuggestion();
  MEMORY[0x24BDAC7A8](v51);
  v53 = (uint64_t)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F04828);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v47 - v10;
  v12 = sub_213EF1D64();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v47 - v17;
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v47 - v20;
  MEMORY[0x24BDAC7A8](v22);
  v50 = (char *)&v47 - v23;
  v24 = sub_213E90A0C(a1, a2);
  if (v24)
  {
    v25 = v24;
    v26 = a2;
    v27 = a1;
    v28 = *(void (**)(char *))(v13 + 16);
    v48 = v26;
    v28(v21);
    v49 = v27;
    ((void (*)(char *, uint64_t, uint64_t))v28)(v18, v27, v12);
    ((void (*)(char *, char *, uint64_t))v28)(v15, v21, v12);
    sub_213EF1D10();
    sub_213EA372C((uint64_t)v15, (uint64_t)v8);
    v29 = *(void (**)(char *, uint64_t))(v13 + 8);
    v29(v18, v12);
    v29(v21, v12);
    v30 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    if (v30(v8, 1, v12))
    {
      sub_213DAFEC4((uint64_t)v8, &qword_253F04828);
      v31 = 1;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v11, v8, v12);
      v31 = 0;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, v31, 1, v12);
    v32 = v30(v11, 1, v12);
    v33 = v48;
    a1 = v49;
    if (v32 != 1)
    {
      v42 = v50;
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v50, v11, v12);
      v43 = objc_allocWithZone(MEMORY[0x24BE95C78]);
      v44 = (void *)sub_213EF1D1C();
      v45 = objc_msgSend(v43, sel_initWithNSUUID_, v44);

      -[NSObject setSuggestionId:](v25, sel_setSuggestionId_, v45);
      sub_213E84338(*(_QWORD *)(a1 + *(int *)(v51 + 28)));
      sub_213ED0820();
      v46 = (void *)sub_213EF2A30();
      swift_bridgeObjectRelease();
      -[NSObject setContributingGroundTruths:](v25, sel_setContributingGroundTruths_, v46);

      sub_213E0D920((uint64_t)v25, v33, v52 & 1);
      v29(v42, v12);
      return;
    }

    sub_213DAFEC4((uint64_t)v11, &qword_253F04828);
  }
  if (qword_253F04A88 != -1)
    swift_once();
  v34 = sub_213EF2724();
  __swift_project_value_buffer(v34, (uint64_t)qword_253F08A00);
  v35 = v53;
  sub_213DCA7E4(a1, v53, (uint64_t (*)(_QWORD))type metadata accessor for PlusContactSuggestion);
  v36 = sub_213EF270C();
  v37 = sub_213EF2CA0();
  if (os_log_type_enabled(v36, v37))
  {
    v38 = (uint8_t *)swift_slowAlloc();
    v39 = swift_slowAlloc();
    v55 = v39;
    *(_DWORD *)v38 = 136315138;
    sub_213E0B898();
    v40 = sub_213EF31F8();
    v54 = sub_213DB0570(v40, v41, &v55);
    sub_213EF2D9C();
    swift_bridgeObjectRelease();
    sub_213DCA828(v35, (uint64_t (*)(_QWORD))type metadata accessor for PlusContactSuggestion);
    _os_log_impl(&dword_213DAB000, v36, v37, "Failed to convert suggestion %s to a SELF message", v38, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199C53C4](v39, -1, -1);
    MEMORY[0x2199C53C4](v38, -1, -1);
  }
  else
  {
    sub_213DCA828(v35, (uint64_t (*)(_QWORD))type metadata accessor for PlusContactSuggestion);
  }

}

void sub_213ECECB0(uint64_t a1, uint64_t a2)
{
  sub_213ECEE9C(a1, a2, (Class *)0x24BE957A0, (SEL *)&selRef_setTriggerReason_, (SEL *)&selRef_setStartedOrChanged_);
}

void sub_213ECECCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  os_log_type_t v14;
  uint8_t *v15;
  NSObject *v16;

  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95788]), sel_init);
  if (v10)
  {
    v11 = v10;
    v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95798]), sel_init);
    if (v12)
    {
      v16 = v12;
      objc_msgSend(v11, sel_setNumberOfConversationsReviewed_, a1);
      objc_msgSend(v11, sel_setNumberOfGroundTruthsGenerated_, a2);
      objc_msgSend(v11, sel_setNumberOfContactSuggestionsGenerated_, a3);
      objc_msgSend(v11, sel_setNumberOfContactSuggestionsUpdated_, a4);
      -[NSObject setEnded:](v16, sel_setEnded_, v11);
      sub_213E0E43C((uint64_t)v16, a5);

      goto LABEL_9;
    }

  }
  if (qword_253F04A88 != -1)
    swift_once();
  v13 = sub_213EF2724();
  __swift_project_value_buffer(v13, (uint64_t)qword_253F08A00);
  v16 = sub_213EF270C();
  v14 = sub_213EF2CA0();
  if (os_log_type_enabled(v16, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_213DAB000, v16, v14, "Failed to create SELF message templates", v15, 2u);
    MEMORY[0x2199C53C4](v15, -1, -1);
  }
LABEL_9:

}

void sub_213ECEE80(uint64_t a1, uint64_t a2)
{
  sub_213ECEE9C(a1, a2, (Class *)0x24BE95790, (SEL *)&selRef_setReason_, (SEL *)&selRef_setFailed_);
}

void sub_213ECEE9C(uint64_t a1, uint64_t a2, Class *a3, SEL *a4, SEL *a5)
{
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  os_log_type_t v13;
  uint8_t *v14;
  NSObject *v15;

  v9 = objc_msgSend(objc_allocWithZone(*a3), sel_init);
  if (v9)
  {
    v10 = v9;
    v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95798]), sel_init);
    if (v11)
    {
      v15 = v11;
      objc_msgSend(v10, *a4, a1);
      objc_msgSend(v15, *a5, v10);
      sub_213E0E43C((uint64_t)v15, a2);

      goto LABEL_9;
    }

  }
  if (qword_253F04A88 != -1)
    swift_once();
  v12 = sub_213EF2724();
  __swift_project_value_buffer(v12, (uint64_t)qword_253F08A00);
  v15 = sub_213EF270C();
  v13 = sub_213EF2CA0();
  if (os_log_type_enabled(v15, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_213DAB000, v15, v13, "Failed to create SELF message templates", v14, 2u);
    MEMORY[0x2199C53C4](v14, -1, -1);
  }
LABEL_9:

}

void sub_213ECF004(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v9;
  char *v10;
  uint64_t v11;
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
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __n128 v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t, uint64_t, __n128);
  int v45;
  uint64_t (*v46)();
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint8_t *v56;
  uint64_t v57;
  __int128 v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  os_log_type_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  NSObject *v90;
  os_log_type_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  NSObject *v103;
  os_log_type_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t (*v111)();
  uint64_t v112;
  NSObject *v113;
  os_log_type_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  NSObject *v125;
  uint64_t v126;
  os_log_type_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  NSObject *v135;
  os_log_type_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  unint64_t v140;
  NSObject *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  NSObject *v145;
  char *v146;
  uint64_t v147;
  uint64_t v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  char *v155;
  uint64_t v156;
  uint64_t v157;
  __int128 v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  char *v162;
  uint64_t v163;
  char *v164;
  uint64_t v165;
  char *v166;
  char *v167;
  char *v168;
  char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  char *v179;

  v172 = a5;
  v156 = a4;
  v152 = type metadata accessor for MediaFeedbackGroundTruth();
  MEMORY[0x24BDAC7A8](v152);
  v10 = (char *)&v144 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v148 = (uint64_t)&v144 - v12;
  MEMORY[0x24BDAC7A8](v13);
  v149 = (char *)&v144 - v14;
  v157 = type metadata accessor for MediaGroundTruth();
  MEMORY[0x24BDAC7A8](v157);
  v16 = (char *)&v144 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v154 = (uint64_t)&v144 - v18;
  MEMORY[0x24BDAC7A8](v19);
  v155 = (char *)&v144 - v20;
  v163 = type metadata accessor for ContactPromptGroundTruth();
  MEMORY[0x24BDAC7A8](v163);
  v147 = (uint64_t)&v144 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v165 = (uint64_t)&v144 - v23;
  MEMORY[0x24BDAC7A8](v24);
  v162 = (char *)&v144 - v25;
  v170 = type metadata accessor for MessagesGroundTruth();
  MEMORY[0x24BDAC7A8](v170);
  v153 = (uint64_t)&v144 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v167 = (char *)&v144 - v28;
  MEMORY[0x24BDAC7A8](v29);
  v169 = (char *)&v144 - v30;
  v173 = type metadata accessor for PhoneCallGroundTruth();
  MEMORY[0x24BDAC7A8](v173);
  v160 = (uint64_t)&v144 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v32);
  v34 = (char *)&v144 - v33;
  MEMORY[0x24BDAC7A8](v35);
  v166 = (char *)&v144 - v36;
  v37 = sub_213EF1D64();
  v38 = *(_QWORD *)(v37 - 8);
  v40 = MEMORY[0x24BDAC7A8](v37);
  v42 = (char *)&v144 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  v150 = a3;
  v43 = *(_QWORD *)(a3 + 16);
  if (v43)
  {
    v171 = v5;
    v44 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, __n128))(v38 + 48);
    v161 = a2;
    v159 = v39;
    v45 = v44(a2, 1, v39, v40);
    v46 = sub_213EF3000;
    v47 = MEMORY[0x24BEE4AD8];
    v146 = v10;
    v164 = v16;
    if (v45 == 1)
    {
      if (qword_253F04A88 != -1)
        swift_once();
      v48 = sub_213EF2724();
      __swift_project_value_buffer(v48, (uint64_t)qword_253F08A00);
      v49 = v159;
      (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v42, a1, v159);
      v50 = sub_213EF270C();
      v51 = sub_213EF2CA0();
      if (os_log_type_enabled(v50, v51))
      {
        v52 = (uint8_t *)swift_slowAlloc();
        v168 = (char *)swift_slowAlloc();
        v179 = v168;
        *(_DWORD *)v52 = 136315138;
        *(_QWORD *)&v158 = v52 + 4;
        sub_213E0B898();
        v53 = sub_213EF31F8();
        v178 = sub_213DB0570(v53, v54, (uint64_t *)&v179);
        v16 = v164;
        sub_213EF2D9C();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v38 + 8))(v42, v49);
        _os_log_impl(&dword_213DAB000, v50, v51, "Failed to extract original PLUS id from conversation id=%s. Emitting ground truth SELF logs with null originalPlusId..", v52, 0xCu);
        v47 = MEMORY[0x24BEE4AD8];
        v55 = (uint64_t)v168;
        swift_arrayDestroy();
        MEMORY[0x2199C53C4](v55, -1, -1);
        v56 = v52;
        v46 = sub_213EF3000;
        MEMORY[0x2199C53C4](v56, -1, -1);

      }
      else
      {
        (*(void (**)(char *, uint64_t))(v38 + 8))(v42, v49);

        v47 = MEMORY[0x24BEE4AD8];
      }
    }
    v168 = v34;
    v57 = v150 + 32;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v58 = *((_QWORD *)v46 + 384);
    v158 = v58;
    v151 = v47 + 8;
    v59 = v161;
    v60 = (uint64_t)v167;
    v61 = (uint64_t)v166;
    while (1)
    {
      sub_213DAFDFC(v57, (uint64_t)&v179);
      sub_213DAFDFC((uint64_t)&v179, (uint64_t)&v178);
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F06AD8);
      if (swift_dynamicCast())
      {
        v62 = (uint64_t)v168;
        sub_213DBB430(v61, (uint64_t)v168, (uint64_t (*)(_QWORD))type metadata accessor for PhoneCallGroundTruth);
        v63 = sub_213E90EC8(v62);
        if (v63)
        {
          v64 = v63;
          sub_213E0DB80((uint64_t)v63, v59);

        }
        else
        {
          if (qword_253F04A88 != -1)
            swift_once();
          v73 = sub_213EF2724();
          __swift_project_value_buffer(v73, (uint64_t)qword_253F08A00);
          v74 = v160;
          sub_213DCA7E4(v62, v160, (uint64_t (*)(_QWORD))type metadata accessor for PhoneCallGroundTruth);
          v75 = sub_213EF270C();
          v76 = sub_213EF2CA0();
          if (os_log_type_enabled(v75, v76))
          {
            v77 = swift_slowAlloc();
            v78 = swift_slowAlloc();
            v175 = v78;
            *(_DWORD *)v77 = v158;
            sub_213E0B898();
            v79 = sub_213EF31F8();
            *(_QWORD *)(v77 + 4) = sub_213DB0570(v79, v80, &v175);
            swift_bridgeObjectRelease();
            sub_213DCA828(v74, (uint64_t (*)(_QWORD))type metadata accessor for PhoneCallGroundTruth);
            _os_log_impl(&dword_213DAB000, v75, v76, "Failed to convert ground truth record %s to a SELF message", (uint8_t *)v77, 0xCu);
            swift_arrayDestroy();
            v81 = v78;
            v59 = v161;
            MEMORY[0x2199C53C4](v81, -1, -1);
            v82 = v77;
            v16 = v164;
            MEMORY[0x2199C53C4](v82, -1, -1);
          }
          else
          {
            sub_213DCA828(v74, (uint64_t (*)(_QWORD))type metadata accessor for PhoneCallGroundTruth);
          }

          v61 = (uint64_t)v166;
          v60 = (uint64_t)v167;
        }
        sub_213DCA828(v62, (uint64_t (*)(_QWORD))type metadata accessor for PhoneCallGroundTruth);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v179);
        goto LABEL_12;
      }
      v65 = (uint64_t)v169;
      if (swift_dynamicCast())
      {
        sub_213DBB430(v65, v60, (uint64_t (*)(_QWORD))type metadata accessor for MessagesGroundTruth);
        v66 = sub_213E910CC(v60);
        if (v66)
        {
          v67 = v66;
          sub_213E0DB80((uint64_t)v66, v59);

        }
        else
        {
          if (qword_253F04A88 != -1)
            swift_once();
          v88 = sub_213EF2724();
          __swift_project_value_buffer(v88, (uint64_t)qword_253F08A00);
          v89 = v153;
          sub_213DCA7E4(v60, v153, (uint64_t (*)(_QWORD))type metadata accessor for MessagesGroundTruth);
          v90 = sub_213EF270C();
          v91 = sub_213EF2CA0();
          if (os_log_type_enabled(v90, v91))
          {
            v92 = swift_slowAlloc();
            v93 = swift_slowAlloc();
            v175 = v93;
            *(_DWORD *)v92 = v158;
            sub_213E0B898();
            v94 = sub_213EF31F8();
            *(_QWORD *)(v92 + 4) = sub_213DB0570(v94, v95, &v175);
            swift_bridgeObjectRelease();
            sub_213DCA828(v89, (uint64_t (*)(_QWORD))type metadata accessor for MessagesGroundTruth);
            _os_log_impl(&dword_213DAB000, v90, v91, "Failed to convert ground truth record %s to a SELF message", (uint8_t *)v92, 0xCu);
            swift_arrayDestroy();
            v96 = v93;
            v59 = v161;
            MEMORY[0x2199C53C4](v96, -1, -1);
            MEMORY[0x2199C53C4](v92, -1, -1);
          }
          else
          {
            sub_213DCA828(v89, (uint64_t (*)(_QWORD))type metadata accessor for MessagesGroundTruth);
          }

          v16 = v164;
          v60 = (uint64_t)v167;
        }
        v87 = v60;
        v111 = type metadata accessor for MessagesGroundTruth;
      }
      else
      {
        v68 = (uint64_t)v162;
        if (swift_dynamicCast())
        {
          v69 = v165;
          sub_213DBB430(v68, v165, (uint64_t (*)(_QWORD))type metadata accessor for ContactPromptGroundTruth);
          sub_213DAFDFC(v156, (uint64_t)&v175);
          v70 = sub_213E916F0(v69, (uint64_t)&v175);
          if (v70)
          {
            v71 = v70;
            sub_213E0DB80((uint64_t)v70, v59);
            v72 = v165;

          }
          else
          {
            if (qword_253F04A88 != -1)
              swift_once();
            v101 = sub_213EF2724();
            __swift_project_value_buffer(v101, (uint64_t)qword_253F08A00);
            v102 = v147;
            sub_213DCA7E4(v165, v147, (uint64_t (*)(_QWORD))type metadata accessor for ContactPromptGroundTruth);
            v103 = sub_213EF270C();
            v104 = sub_213EF2CA0();
            if (os_log_type_enabled(v103, v104))
            {
              v105 = swift_slowAlloc();
              v106 = swift_slowAlloc();
              v174 = v106;
              *(_DWORD *)v105 = v158;
              sub_213E0B898();
              v107 = sub_213EF31F8();
              *(_QWORD *)(v105 + 4) = sub_213DB0570(v107, v108, &v174);
              swift_bridgeObjectRelease();
              sub_213DCA828(v102, (uint64_t (*)(_QWORD))type metadata accessor for ContactPromptGroundTruth);
              _os_log_impl(&dword_213DAB000, v103, v104, "Failed to convert ground truth record %s to a SELF message", (uint8_t *)v105, 0xCu);
              swift_arrayDestroy();
              v109 = v106;
              v59 = v161;
              MEMORY[0x2199C53C4](v109, -1, -1);
              v110 = v105;
              v60 = (uint64_t)v167;
              MEMORY[0x2199C53C4](v110, -1, -1);
            }
            else
            {
              sub_213DCA828(v102, (uint64_t (*)(_QWORD))type metadata accessor for ContactPromptGroundTruth);
            }

            v16 = v164;
            v72 = v165;
            v61 = (uint64_t)v166;
          }
          sub_213DAFEC4((uint64_t)&v175, &qword_254D3C988);
          v87 = v72;
          v111 = type metadata accessor for ContactPromptGroundTruth;
        }
        else
        {
          v83 = (uint64_t)v155;
          if (!swift_dynamicCast())
          {
            v97 = (uint64_t)v149;
            if (swift_dynamicCast())
            {
              v98 = v148;
              sub_213DBB430(v97, v148, (uint64_t (*)(_QWORD))type metadata accessor for MediaFeedbackGroundTruth);
              v99 = sub_213E91514(v98);
              if (v99)
              {
                v100 = v99;
                sub_213E0DEC8((uint64_t)v99, v172, v98 + *(int *)(v152 + 32));

              }
              else
              {
                if (qword_253F04A88 != -1)
                  swift_once();
                v133 = sub_213EF2724();
                __swift_project_value_buffer(v133, (uint64_t)qword_253F08A00);
                v134 = (uint64_t)v146;
                sub_213DCA7E4(v148, (uint64_t)v146, (uint64_t (*)(_QWORD))type metadata accessor for MediaFeedbackGroundTruth);
                v135 = sub_213EF270C();
                v136 = sub_213EF2CA0();
                v145 = v135;
                if (os_log_type_enabled(v135, v136))
                {
                  v137 = swift_slowAlloc();
                  v138 = swift_slowAlloc();
                  v175 = v138;
                  *(_DWORD *)v137 = v158;
                  sub_213E0B898();
                  v139 = sub_213EF31F8();
                  *(_QWORD *)(v137 + 4) = sub_213DB0570(v139, v140, &v175);
                  swift_bridgeObjectRelease();
                  sub_213DCA828((uint64_t)v146, (uint64_t (*)(_QWORD))type metadata accessor for MediaFeedbackGroundTruth);
                  v141 = v145;
                  _os_log_impl(&dword_213DAB000, v145, v136, "Failed to convert ground truth record %s to a SELF message", (uint8_t *)v137, 0xCu);
                  swift_arrayDestroy();
                  v142 = v138;
                  v59 = v161;
                  MEMORY[0x2199C53C4](v142, -1, -1);
                  v143 = v137;
                  v60 = (uint64_t)v167;
                  MEMORY[0x2199C53C4](v143, -1, -1);

                }
                else
                {
                  sub_213DCA828(v134, (uint64_t (*)(_QWORD))type metadata accessor for MediaFeedbackGroundTruth);

                }
                v98 = v148;
              }
              sub_213DCA828(v98, (uint64_t (*)(_QWORD))type metadata accessor for MediaFeedbackGroundTruth);
            }
            else
            {
              if (qword_253F04A88 != -1)
                swift_once();
              v112 = sub_213EF2724();
              __swift_project_value_buffer(v112, (uint64_t)qword_253F08A00);
              sub_213DAFDFC((uint64_t)&v179, (uint64_t)&v175);
              v113 = sub_213EF270C();
              v114 = sub_213EF2CA0();
              if (os_log_type_enabled(v113, v114))
              {
                v115 = swift_slowAlloc();
                v116 = swift_slowAlloc();
                v174 = v116;
                *(_DWORD *)v115 = v158;
                v118 = v176;
                v117 = v177;
                __swift_project_boxed_opaque_existential_1(&v175, v176);
                v119 = v118;
                v61 = (uint64_t)v166;
                v120 = (*(uint64_t (**)(uint64_t, uint64_t))(v117 + 40))(v119, v117);
                *(_QWORD *)(v115 + 4) = sub_213DB0570(v120, v121, &v174);
                swift_bridgeObjectRelease();
                __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v175);
                _os_log_impl(&dword_213DAB000, v113, v114, "Skipping logging unknown ground truth type to SELF. Type=%s", (uint8_t *)v115, 0xCu);
                swift_arrayDestroy();
                v122 = v116;
                v59 = v161;
                MEMORY[0x2199C53C4](v122, -1, -1);
                v123 = v115;
                v60 = (uint64_t)v167;
                MEMORY[0x2199C53C4](v123, -1, -1);

              }
              else
              {

                __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v175);
              }
            }
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v179);
            v16 = v164;
            goto LABEL_12;
          }
          v84 = v154;
          sub_213DBB430(v83, v154, (uint64_t (*)(_QWORD))type metadata accessor for MediaGroundTruth);
          v85 = sub_213E912CC(v84);
          if (v85)
          {
            v86 = v85;
            sub_213E0DEC8((uint64_t)v85, v172, v84 + *(int *)(v157 + 36));

            v87 = v84;
          }
          else
          {
            if (qword_253F04A88 != -1)
              swift_once();
            v124 = sub_213EF2724();
            __swift_project_value_buffer(v124, (uint64_t)qword_253F08A00);
            sub_213DCA7E4(v154, (uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for MediaGroundTruth);
            v125 = sub_213EF270C();
            v126 = (uint64_t)v16;
            v127 = sub_213EF2CA0();
            if (os_log_type_enabled(v125, v127))
            {
              v128 = swift_slowAlloc();
              v129 = swift_slowAlloc();
              v175 = v129;
              *(_DWORD *)v128 = v158;
              sub_213E0B898();
              v145 = v125;
              v130 = sub_213EF31F8();
              *(_QWORD *)(v128 + 4) = sub_213DB0570(v130, v131, &v175);
              swift_bridgeObjectRelease();
              sub_213DCA828(v126, (uint64_t (*)(_QWORD))type metadata accessor for MediaGroundTruth);
              v125 = v145;
              _os_log_impl(&dword_213DAB000, v145, v127, "Failed to convert ground truth record %s to a SELF message", (uint8_t *)v128, 0xCu);
              swift_arrayDestroy();
              v132 = v129;
              v59 = v161;
              MEMORY[0x2199C53C4](v132, -1, -1);
              MEMORY[0x2199C53C4](v128, -1, -1);
            }
            else
            {
              sub_213DCA828(v126, (uint64_t (*)(_QWORD))type metadata accessor for MediaGroundTruth);
            }

            v16 = (char *)v126;
            v87 = v154;
            v61 = (uint64_t)v166;
          }
          v60 = (uint64_t)v167;
          v111 = type metadata accessor for MediaGroundTruth;
        }
      }
      sub_213DCA828(v87, (uint64_t (*)(_QWORD))v111);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v179);
LABEL_12:
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v178);
      v57 += 40;
      if (!--v43)
      {
        swift_bridgeObjectRelease();
        return;
      }
    }
  }
}

void sub_213ED01CC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  char *v23;
  void *v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  _QWORD v42[3];
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE v50[40];

  v2 = sub_213EF1D64();
  v43 = *(_QWORD *)(v2 - 8);
  v44 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v47 = (char *)v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for MediaEvaluationSummary();
  MEMORY[0x24BDAC7A8](v4);
  v48 = (uint64_t)v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v42 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    v10 = a1 + 32;
    v42[0] = a1;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v11 = 136315138;
    v46 = v11;
    v42[1] = MEMORY[0x24BEE4AD8] + 8;
    v42[2] = v4;
    while (1)
    {
      sub_213DAFDFC(v10, (uint64_t)v50);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D3A6E0);
      if (!swift_dynamicCast())
      {
        if (qword_253F04A88 != -1)
          swift_once();
        v26 = sub_213EF2724();
        __swift_project_value_buffer(v26, (uint64_t)qword_253F08A00);
        v27 = sub_213EF270C();
        v28 = sub_213EF2CA0();
        if (os_log_type_enabled(v27, v28))
        {
          v29 = swift_slowAlloc();
          v30 = swift_slowAlloc();
          v49 = v30;
          *(_DWORD *)v29 = v46;
          if (qword_254D3A098 != -1)
            swift_once();
          v12 = qword_254D408F0;
          v13 = *(_QWORD *)algn_254D408F8;
          swift_bridgeObjectRetain();
          *(_QWORD *)(v29 + 4) = sub_213DB0570(v12, v13, &v49);
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_213DAB000, v27, v28, "%s Skipping logging unknown evaluation summary type to SELF.", (uint8_t *)v29, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2199C53C4](v30, -1, -1);
          MEMORY[0x2199C53C4](v29, -1, -1);
        }

        goto LABEL_5;
      }
      v14 = v48;
      sub_213DBB430((uint64_t)v8, v48, (uint64_t (*)(_QWORD))type metadata accessor for MediaEvaluationSummary);
      v15 = sub_213E91BB8(v14);
      if (!v15)
      {
        if (qword_253F04A88 != -1)
          swift_once();
        v31 = sub_213EF2724();
        __swift_project_value_buffer(v31, (uint64_t)qword_253F08A00);
        v32 = sub_213EF270C();
        v33 = sub_213EF2CA0();
        if (os_log_type_enabled(v32, v33))
        {
          v34 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v34 = 0;
          _os_log_impl(&dword_213DAB000, v32, v33, "Failed to convert evaluation summary record to a SELF message", v34, 2u);
          MEMORY[0x2199C53C4](v34, -1, -1);
        }

        goto LABEL_30;
      }
      v16 = v15;
      v17 = *(_QWORD *)(v45 + 16);
      sub_213EF1D58();
      v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95710]), sel_init);
      if (!v18)
        goto LABEL_22;
      v19 = v18;
      v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95718]), sel_init);
      if (!v20)
        break;
      v21 = v20;
      v22 = objc_allocWithZone(MEMORY[0x24BE95C78]);
      v23 = v47;
      v24 = (void *)sub_213EF1D1C();
      v25 = objc_msgSend(v22, sel_initWithNSUUID_, v24);

      objc_msgSend(v21, sel_setPlusId_, v25);
      objc_msgSend(v19, sel_setEventMetadata_, v21);

      objc_msgSend(v19, sel_setMediaEvaluationSummaryReported_, v16);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v17 + 16), *(_QWORD *)(v17 + 40));
      sub_213EF23E8();

      (*(void (**)(char *, uint64_t))(v43 + 8))(v23, v44);
LABEL_30:
      sub_213DCA828(v48, (uint64_t (*)(_QWORD))type metadata accessor for MediaEvaluationSummary);
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v50);
      v10 += 40;
      if (!--v9)
      {
        swift_bridgeObjectRelease();
        return;
      }
    }

LABEL_22:
    if (qword_253F04A88 != -1)
      swift_once();
    v35 = sub_213EF2724();
    __swift_project_value_buffer(v35, (uint64_t)qword_253F08A00);
    v36 = sub_213EF270C();
    v37 = sub_213EF2CA0();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = swift_slowAlloc();
      v39 = swift_slowAlloc();
      v49 = v39;
      *(_DWORD *)v38 = v46;
      if (qword_254D39FE0 != -1)
        swift_once();
      v40 = qword_254D3C238;
      v41 = unk_254D3C240;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v38 + 4) = sub_213DB0570(v40, v41, &v49);
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_213DAB000, v36, v37, "%s Failed to create SELF message templates", (uint8_t *)v38, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C53C4](v39, -1, -1);
      MEMORY[0x2199C53C4](v38, -1, -1);

    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v43 + 8))(v47, v44);
    goto LABEL_30;
  }
}

uint64_t PLUSOfflineLogHelpers.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t PLUSOfflineLogHelpers.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

unint64_t sub_213ED0820()
{
  unint64_t result;

  result = qword_254D3F670;
  if (!qword_254D3F670)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254D3F670);
  }
  return result;
}

uint64_t type metadata accessor for PLUSOfflineLogHelpers()
{
  return objc_opt_self();
}

uint64_t method lookup function for PLUSOfflineLogHelpers()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PLUSOfflineLogHelpers.__allocating_init(logTarget:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of PLUSOfflineLogHelpers.logPhoneCallMetadata(session:originalPlusId:plusId:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of PLUSOfflineLogHelpers.logContactSuggestionGenerated(suggestion:plusId:isSuggestionUpdated:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of PLUSOfflineLogHelpers.logInferencePluginStarted(triggerReason:plusId:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of PLUSOfflineLogHelpers.logInferencePluginCompleted(conversationsReviewed:groundTruthsGenerated:contactSuggestionsGenerated:contactSuggestionsUpdated:plusId:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of PLUSOfflineLogHelpers.logInferencePluginFailed(failureReason:plusId:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of PLUSOfflineLogHelpers.logSessionGroundTruthDataToSELF(sessionId:originalPlusId:groundTruths:picsStore:plusId:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of PLUSOfflineLogHelpers.logSessionEvaluations(evaluations:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t PIMSStoreCoreData.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id v5;

  v4 = swift_allocObject();
  v5 = sub_213ED47F0(a1, a2, 0);
  swift_bridgeObjectRelease();
  if (v5)
  {
    *(_QWORD *)(v4 + 16) = v5;
    *(_QWORD *)(v4 + 24) = objc_msgSend(v5, sel_newBackgroundContext);
  }
  else
  {
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v4;
}

void sub_213ED0978(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(id, void *);
  id v6;
  id v7;

  v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(v7, a3);
  swift_release();

}

uint64_t sub_213ED09EC(uint64_t a1)
{
  return sub_213ED0A10(a1, &qword_254D3E758, &qword_254D3F020, &qword_254D3F028, &qword_254D3E770);
}

uint64_t sub_213ED0A10(uint64_t a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t *a5)
{
  uint64_t v9;

  sub_213EF1A40();
  swift_allocObject();
  sub_213EF1A34();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  sub_213ED57F0(a3, a2, a4, a5);
  v9 = sub_213EF1A28();
  swift_release();
  return v9;
}

id sub_213ED0C84()
{
  id result;

  result = sub_213ED0CA0();
  qword_253F04AF0 = (uint64_t)result;
  return result;
}

id sub_213ED0CA0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t ObjCClassFromMetadata;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void (*v15)(char *, char *, uint64_t);
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v24;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F047F8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_213EF1C2C();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v24 - v8;
  type metadata accessor for PIMSStoreCoreData();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v11 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v12 = (void *)sub_213EF2844();
  v13 = (void *)sub_213EF2844();
  v14 = objc_msgSend(v11, sel_URLForResource_withExtension_, v12, v13);

  if (v14)
  {
    sub_213EF1BF0();

    v15 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
    v15(v2, v7, v3);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) != 1)
    {
      v15(v9, v2, v3);
      v16 = objc_allocWithZone(MEMORY[0x24BDBB6B0]);
      v17 = (void *)sub_213EF1BD8();
      v18 = objc_msgSend(v16, sel_initWithContentsOfURL_, v17);

      (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
      if (v18)
        return v18;
      goto LABEL_7;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  }
  sub_213DAFEC4((uint64_t)v2, &qword_253F047F8);
LABEL_7:
  if (qword_253F04A88 != -1)
    swift_once();
  v19 = sub_213EF2724();
  __swift_project_value_buffer(v19, (uint64_t)qword_253F08A00);
  v20 = sub_213EF270C();
  v21 = sub_213EF2CA0();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_213DAB000, v20, v21, "PIMSStoreCoreData: Error loading data base model from bundle", v22, 2u);
    MEMORY[0x2199C53C4](v22, -1, -1);
  }

  return 0;
}

uint64_t PIMSStoreCoreData.init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v3 = sub_213ED47F0(a1, a2, 0);
  swift_bridgeObjectRelease();
  if (v3)
  {
    *(_QWORD *)(v2 + 16) = v3;
    *(_QWORD *)(v2 + 24) = objc_msgSend(v3, sel_newBackgroundContext);
  }
  else
  {
    type metadata accessor for PIMSStoreCoreData();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v2;
}

void sub_213ED1010(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;

  if (a2)
  {
    swift_beginAccess();
    *(_BYTE *)(a3 + 16) = 0;
    if (qword_253F04A88 != -1)
      swift_once();
    v6 = sub_213EF2724();
    __swift_project_value_buffer(v6, (uint64_t)qword_253F08A00);
    v7 = a2;
    v8 = a1;
    v9 = a2;
    v10 = v8;
    v11 = sub_213EF270C();
    v12 = sub_213EF2CA0();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = swift_slowAlloc();
      v14 = (_QWORD *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      v19 = v15;
      *(_DWORD *)v13 = 136315394;
      __swift_instantiateConcreteTypeFromMangledName(qword_254D3E0A8);
      v16 = sub_213EF2D60();
      sub_213DB0570(v16, v17, &v19);
      sub_213EF2D9C();
      swift_bridgeObjectRelease();

      *(_WORD *)(v13 + 12) = 2112;
      v18 = v10;
      sub_213EF2D9C();
      *v14 = v10;

      _os_log_impl(&dword_213DAB000, v11, v12, "PIMSStoreCoreData: Unable to load persistent stores: %s : %@", (uint8_t *)v13, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F04E90);
      swift_arrayDestroy();
      MEMORY[0x2199C53C4](v14, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x2199C53C4](v15, -1, -1);
      MEMORY[0x2199C53C4](v13, -1, -1);

    }
    else
    {

    }
  }
}

id sub_213ED127C()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  void *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  id v17[2];

  v17[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = *(void **)(v0 + 24);
  v17[0] = 0;
  v2 = objc_msgSend(v1, sel_save_, v17);
  if ((_DWORD)v2)
  {
    v3 = v17[0];
  }
  else
  {
    v4 = v17[0];
    v5 = (void *)sub_213EF1BA8();

    swift_willThrow();
    if (qword_253F04A88 != -1)
      swift_once();
    v6 = sub_213EF2724();
    __swift_project_value_buffer(v6, (uint64_t)qword_253F08A00);
    v7 = v5;
    v8 = v5;
    v9 = sub_213EF270C();
    v10 = sub_213EF2CA0();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = (void *)swift_slowAlloc();
      v17[0] = v12;
      *(_DWORD *)v11 = 136315138;
      v13 = v5;
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F04F00);
      v14 = sub_213EF288C();
      sub_213DB0570(v14, v15, (uint64_t *)v17);
      sub_213EF2D9C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_213DAB000, v9, v10, "PIMSStoreCoreData: Unresolved error in saveChanges error=%s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C53C4](v12, -1, -1);
      MEMORY[0x2199C53C4](v11, -1, -1);

    }
    else
    {

    }
  }
  return v2;
}

uint64_t sub_213ED14D0()
{
  return sub_213E4AB28();
}

id sub_213ED14DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  id v6;
  id result;

  type metadata accessor for PlusMediaSuggestionCoreDataRecord();
  v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithContext_, *(_QWORD *)(a1 + 24));
  LOBYTE(a2) = sub_213ED156C(a2, v6);

  if ((a2 & 1) != 0)
    result = sub_213ED127C();
  else
    result = 0;
  *a3 = result & 1;
  return result;
}

uint64_t sub_213ED156C(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  unint64_t v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  char *v46;
  double v47;
  double v48;
  uint64_t v49;
  unint64_t v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73[10];
  _OWORD v74[11];

  v3 = v2;
  v6 = sub_213EF1CF8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_213ED545C();
  if (v11 >> 60 == 15)
    return 0;
  v13 = v10;
  v14 = v11;
  v15 = type metadata accessor for PlusMediaSuggestion();
  sub_213E6EFF8(*(_QWORD *)(a1 + *(int *)(v15 + 20)), v73);
  sub_213E033BC((uint64_t)v73, (uint64_t)v74);
  if (*((_QWORD *)&v74[0] + 1) == 1)
  {
    sub_213E36528(v13, v14);
    return 0;
  }
  else
  {
    v63 = v9;
    v64 = v7;
    v57 = v6;
    v74[7] = v74[2];
    v74[8] = v74[3];
    v74[9] = v74[4];
    v74[5] = v74[0];
    v74[6] = v74[1];
    v16 = (void *)sub_213EF1D1C();
    objc_msgSend(a2, sel_setId_, v16);

    sub_213EF2448();
    objc_msgSend(a2, sel_setTimestamp_);
    v17 = (uint64_t *)(a1 + *(int *)(v15 + 24));
    v58 = a2;
    v59 = v15;
    v18 = *v17;
    v19 = v17[1];
    v20 = v17[2];
    v21 = v17[3];
    v60 = v13;
    v65 = v14;
    v23 = v17[4];
    v22 = v17[5];
    LOWORD(v17) = *((_WORD *)v17 + 24);
    v66 = v18;
    v67 = v19;
    v68 = v20;
    v69 = v21;
    v70 = v23;
    v71 = v22;
    v72 = (__int16)v17;
    v24 = v3;
    v25 = *(id *)(v3 + 24);
    swift_bridgeObjectRetain();
    sub_213DB8518(v20, v21);
    v26 = sub_213E585BC(v25);
    swift_bridgeObjectRelease();

    sub_213DB859C(v20, v21);
    v27 = v58;
    objc_msgSend(v58, sel_setInferredMediaReference_, v26);

    v28 = v59;
    swift_retain();
    v29 = swift_bridgeObjectRetain();
    v30 = sub_213ED44FC(v29, v24);
    v61 = 0;
    swift_bridgeObjectRelease();
    v31 = v24;
    swift_release();
    sub_213EC628C(v30);
    swift_bridgeObjectRelease();
    v32 = objc_allocWithZone(MEMORY[0x24BDBCF00]);
    v62 = MEMORY[0x24BEE4AD8] + 8;
    v33 = (void *)sub_213EF2A30();
    swift_bridgeObjectRelease();
    v34 = objc_msgSend(v32, sel_initWithArray_, v33);

    v35 = v65;
    v36 = v27;
    objc_msgSend(v27, sel_setContributingGroundTruth_, v34);

    v37 = v60;
    v38 = (void *)sub_213EF1C44();
    objc_msgSend(v36, sel_setLeftHandKey_, v38);

    objc_msgSend(v36, sel_setScore_, *(double *)(a1 + *(int *)(v28 + 32)));
    sub_213E52E68();
    sub_213DC077C(v73);
    v39 = (void *)sub_213EF2844();
    swift_bridgeObjectRelease();
    objc_msgSend(v36, sel_setName_, v39);

    v40 = sub_213ED0A10(*(_QWORD *)(a1 + *(int *)(v28 + 36)), &qword_254D3D000, &qword_254D3D008, &qword_254D3D010, &qword_254D3D018);
    if (v41 >> 60 == 15)
    {
      v42 = 0;
    }
    else
    {
      v43 = v40;
      v44 = v41;
      v42 = (void *)sub_213EF1C44();
      sub_213E36528(v43, v44);
    }
    v45 = v57;
    objc_msgSend(v36, sel_setScoreHistory_, v42);

    v46 = v63;
    sub_213EF1CEC();
    sub_213EF1CD4();
    v48 = v47;
    (*(void (**)(char *, uint64_t))(v64 + 8))(v46, v45);
    objc_msgSend(v36, sel_setLastUpdated_, v48);
    swift_retain();
    v49 = swift_bridgeObjectRetain();
    v50 = sub_213ED460C(v49, v31);
    swift_bridgeObjectRelease();
    swift_release();
    sub_213EC6298(v50);
    swift_bridgeObjectRelease();
    v51 = objc_allocWithZone(MEMORY[0x24BDBCF00]);
    v52 = (void *)sub_213EF2A30();
    swift_bridgeObjectRelease();
    v53 = objc_msgSend(v51, sel_initWithArray_, v52);

    objc_msgSend(v36, sel_setTags_, v53);
    v54 = objc_msgSend(v36, sel_inferredMediaReference);
    if (v54)
    {
      v55 = v54;
      objc_msgSend(v54, sel_setMediaSuggestion_, v36);
      sub_213E36528(v37, v35);

    }
    else
    {
      sub_213E36528(v37, v35);
    }
    return 1;
  }
}

uint64_t sub_213ED1A88()
{
  uint64_t v0;
  id v1;
  uint64_t v3;

  v1 = *(id *)(v0 + 24);
  sub_213EF2D30();

  return v3;
}

uint64_t sub_213ED1AEC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;

  v3 = v2;
  v6 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v7 = (void *)sub_213EF2844();
  v8 = objc_msgSend(v6, sel_initWithEntityName_, v7);

  sub_213DB9CDC(0, (unint64_t *)&qword_254D3C038);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D3C028);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_213EF53E0;
  *(_QWORD *)(v9 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v9 + 64) = sub_213E07AFC();
  *(_QWORD *)(v9 + 32) = a1;
  *(_QWORD *)(v9 + 40) = a2;
  swift_bridgeObjectRetain();
  v10 = (void *)sub_213EF2C58();
  objc_msgSend(v8, sel_setPredicate_, v10);

  v11 = *(void **)(v3 + 24);
  type metadata accessor for PlusMediaReferenceCoreDataRecord();
  v12 = v11;
  v13 = sub_213EF2D3C();

  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    v14 = sub_213EF306C();
    if (!v14)
      goto LABEL_10;
  }
  else
  {
    v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v14)
      goto LABEL_10;
  }
  if (v14 < 1)
  {
    __break(1u);
LABEL_20:
    swift_once();
    goto LABEL_14;
  }
  for (i = 0; i != v14; ++i)
  {
    if ((v13 & 0xC000000000000001) != 0)
      v16 = (id)MEMORY[0x2199C49B0](i, v13);
    else
      v16 = *(id *)(v13 + 8 * i + 32);
    v17 = v16;
    objc_msgSend(v12, sel_deleteObject_, v16);

  }
LABEL_10:
  swift_bridgeObjectRelease();
  if ((sub_213ED127C() & 1) != 0)
  {
    if (v13 >> 62)
    {
      swift_bridgeObjectRetain();
      v18 = sub_213EF306C();

      swift_bridgeObjectRelease_n();
    }
    else
    {
      v18 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);

      swift_bridgeObjectRelease();
    }
    return v18;
  }
  swift_bridgeObjectRelease();
  if (qword_253F04A88 != -1)
    goto LABEL_20;
LABEL_14:
  v19 = sub_213EF2724();
  __swift_project_value_buffer(v19, (uint64_t)qword_253F08A00);
  v20 = sub_213EF270C();
  v21 = sub_213EF2CA0();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_213DAB000, v20, v21, "Failed to save changes after deleting records.", v22, 2u);
    MEMORY[0x2199C53C4](v22, -1, -1);
  }

  return 0;
}

uint64_t sub_213ED1FC4()
{
  return sub_213E49324(&qword_254D3A9C8);
}

uint64_t sub_213ED1FD8()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __int16 v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int16 v26;

  v1 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v2 = (void *)sub_213EF2844();
  v3 = objc_msgSend(v1, sel_initWithEntityName_, v2);

  v4 = *(void **)(v0 + 24);
  type metadata accessor for PlusMediaReferenceCoreDataRecord();
  v5 = v4;
  v6 = sub_213EF2D3C();

  if (!(v6 >> 62))
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    v19 = v3;
    if (v7)
      goto LABEL_3;
LABEL_16:
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_17:

    swift_bridgeObjectRelease_n();
    return (uint64_t)v10;
  }
  swift_bridgeObjectRetain();
  result = sub_213EF306C();
  v7 = result;
  v19 = v3;
  if (!result)
    goto LABEL_16;
LABEL_3:
  if (v7 >= 1)
  {
    v9 = 0;
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v6 & 0xC000000000000001) != 0)
        v12 = (id)MEMORY[0x2199C49B0](v9, v6);
      else
        v12 = *(id *)(v6 + 8 * v9 + 32);
      v13 = v12;
      sub_213E59754((uint64_t)&v22);

      v14 = v23;
      if (v23)
      {
        v15 = v22;
        v20 = v25;
        v21 = v24;
        v16 = v26;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v10 = sub_213DB64A8(0, v10[2] + 1, 1, v10);
        v18 = v10[2];
        v17 = v10[3];
        if (v18 >= v17 >> 1)
          v10 = sub_213DB64A8((_QWORD *)(v17 > 1), v18 + 1, 1, v10);
        v10[2] = v18 + 1;
        v11 = &v10[7 * v18];
        v11[4] = v15;
        v11[5] = v14;
        *((_OWORD *)v11 + 3) = v21;
        *((_OWORD *)v11 + 4) = v20;
        *((_WORD *)v11 + 40) = v16;
      }
      ++v9;
    }
    while (v7 != v9);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_213ED239C()
{
  return sub_213E4AB28();
}

uint64_t sub_213ED23A8()
{
  return sub_213E4AB28();
}

void sub_213ED23B4(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  unsigned __int8 v11;

  sub_213ED3828();
  if (v6)
  {
    v7 = v6;
    type metadata accessor for PlusMediaSuggestionCoreDataRecord();
    v8 = *(void **)(a1 + 24);
    v9 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithContext_, v8);
    v10 = sub_213ED156C(a2, v9);

    if ((v10 & 1) != 0)
    {
      objc_msgSend(v8, sel_deleteObject_, v7);
      v11 = sub_213ED127C();
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }
  *a3 = v11 & 1;
}

uint64_t sub_213ED2480()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t result;
  _QWORD v6[6];

  v1 = *(void **)(v0 + 24);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = sub_213ED5270;
  *(_QWORD *)(v2 + 24) = v0;
  v6[4] = sub_213ED5284;
  v6[5] = v2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 1107296256;
  v6[2] = sub_213E488EC;
  v6[3] = &block_descriptor_4;
  v3 = _Block_copy(v6);
  v4 = v1;
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_performBlockAndWait_, v3);

  _Block_release(v3);
  LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v3 & 1) != 0)
    __break(1u);
  return result;
}

void sub_213ED259C()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  void *v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  id v34[2];

  v34[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v2 = (void *)sub_213EF2844();
  v3 = objc_msgSend(v1, sel_initWithEntityName_, v2);

  v4 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v5 = (void *)sub_213EF2844();
  v6 = objc_msgSend(v4, sel_initWithEntityName_, v5);

  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBB5E8]), sel_initWithFetchRequest_, v3);
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBB5E8]), sel_initWithFetchRequest_, v6);
  v9 = *(void **)(v0 + 24);
  v34[0] = 0;
  v10 = objc_msgSend(v9, sel_executeRequest_error_, v7, v34);
  v11 = v34[0];
  if (v10
    && (v12 = v10,
        v13 = v34[0],
        v12,
        v34[0] = 0,
        v14 = objc_msgSend(v9, sel_executeRequest_error_, v8, v34),
        v11 = v34[0],
        v14))
  {
    v15 = v14;
    v16 = v34[0];

    if ((sub_213ED127C() & 1) == 0)
    {
      if (qword_253F04A88 != -1)
        swift_once();
      v17 = sub_213EF2724();
      __swift_project_value_buffer(v17, (uint64_t)qword_253F08A00);
      v18 = sub_213EF270C();
      v19 = sub_213EF2CA0();
      if (os_log_type_enabled(v18, v19))
      {
        v20 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_213DAB000, v18, v19, "PIMSStoreCoreData: Cannot reset store, failed to save", v20, 2u);
        MEMORY[0x2199C53C4](v20, -1, -1);

        return;
      }

    }
  }
  else
  {
    v21 = v11;
    v22 = (void *)sub_213EF1BA8();

    swift_willThrow();
    if (qword_253F04A88 != -1)
      swift_once();
    v23 = sub_213EF2724();
    __swift_project_value_buffer(v23, (uint64_t)qword_253F08A00);
    v24 = v22;
    v25 = v22;
    v26 = sub_213EF270C();
    v27 = sub_213EF2CA0();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      v33 = v3;
      v29 = (void *)swift_slowAlloc();
      v34[0] = v29;
      *(_DWORD *)v28 = 136315138;
      v30 = v22;
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F04F00);
      v31 = sub_213EF288C();
      sub_213DB0570(v31, v32, (uint64_t *)v34);
      sub_213EF2D9C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_213DAB000, v26, v27, "PIMSStoreCoreData: Cannot reset store, error=%s", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C53C4](v29, -1, -1);
      MEMORY[0x2199C53C4](v28, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t sub_213ED2A10()
{
  return sub_213E49324(&qword_253F04E58);
}

uint64_t sub_213ED2A24()
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
  char *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  unint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  id v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F04B80);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for PlusMediaSuggestion();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v29 - v10;
  v12 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v13 = (void *)sub_213EF2844();
  v14 = objc_msgSend(v12, sel_initWithEntityName_, v13);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F04EF0);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_213EF8CA0;
  sub_213DB9CDC(0, &qword_253F04E70);
  swift_getKeyPath();
  *(_QWORD *)(v15 + 32) = sub_213EF2CB8();
  v32 = v15;
  sub_213EF2A54();
  v16 = (void *)sub_213EF2A30();
  swift_bridgeObjectRelease();
  objc_msgSend(v14, sel_setSortDescriptors_, v16);

  v17 = *(void **)(v1 + 24);
  type metadata accessor for PlusMediaSuggestionCoreDataRecord();
  v18 = v17;
  v19 = sub_213EF2D3C();

  if (!(v19 >> 62))
  {
    v20 = *(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v20)
      goto LABEL_3;
LABEL_18:

    swift_bridgeObjectRelease();
    v23 = MEMORY[0x24BEE4AF8];
LABEL_19:
    swift_bridgeObjectRelease();
    return v23;
  }
  swift_bridgeObjectRetain();
  result = sub_213EF306C();
  v20 = result;
  if (!result)
    goto LABEL_18;
LABEL_3:
  if (v20 >= 1)
  {
    v29 = v14;
    v30 = v11;
    v22 = 0;
    v23 = MEMORY[0x24BEE4AF8];
    v31 = v5;
    do
    {
      if ((v19 & 0xC000000000000001) != 0)
        v24 = (id)MEMORY[0x2199C49B0](v22, v19);
      else
        v24 = *(id *)(v19 + 8 * v22 + 32);
      v25 = v24;
      sub_213E59A14((uint64_t)v4);

      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
      {
        sub_213DAFEC4((uint64_t)v4, &qword_253F04B80);
      }
      else
      {
        v26 = (uint64_t)v30;
        sub_213DEA488((uint64_t)v4, (uint64_t)v30);
        sub_213DEA488(v26, (uint64_t)v8);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v23 = sub_213DB6B94(0, *(_QWORD *)(v23 + 16) + 1, 1, v23);
        v28 = *(_QWORD *)(v23 + 16);
        v27 = *(_QWORD *)(v23 + 24);
        if (v28 >= v27 >> 1)
          v23 = sub_213DB6B94(v27 > 1, v28 + 1, 1, v23);
        *(_QWORD *)(v23 + 16) = v28 + 1;
        sub_213DEA488((uint64_t)v8, v23+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v28);
        v5 = v31;
      }
      ++v22;
    }
    while (v20 != v22);

    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_213ED2F5C()
{
  uint64_t v0;
  id v1;
  uint64_t v3;

  v1 = *(id *)(v0 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F04E58);
  sub_213EF2D30();

  return v3;
}

uint64_t sub_213ED2FC4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  uint8_t *v30;
  uint64_t v31;
  os_log_type_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t result;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62[10];
  _OWORD v63[5];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F04B80);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for PlusMediaSuggestion();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v59 = (uint64_t)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v58 = (uint64_t)&v51 - v9;
  v10 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v11 = (void *)sub_213EF2844();
  v12 = objc_msgSend(v10, sel_initWithEntityName_, v11);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F04EF0);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_213EF8CA0;
  v14 = objc_allocWithZone(MEMORY[0x24BDD17C0]);
  v15 = (void *)sub_213EF2844();
  v16 = objc_msgSend(v14, sel_initWithKey_ascending_, v15, 0);

  *(_QWORD *)(v13 + 32) = v16;
  *(_QWORD *)&v64 = v13;
  sub_213EF2A54();
  sub_213DB9CDC(0, &qword_253F04E70);
  v17 = (void *)sub_213EF2A30();
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_setSortDescriptors_, v17);

  sub_213E6EFF8(a1, v62);
  sub_213E033BC((uint64_t)v62, (uint64_t)v63);
  if (*((_QWORD *)&v63[0] + 1) == 1)
  {
    if (qword_253F04A88 != -1)
      swift_once();
    v18 = sub_213EF2724();
    __swift_project_value_buffer(v18, (uint64_t)qword_253F08A00);
    v19 = sub_213EF270C();
    v20 = sub_213EF2C94();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_213DAB000, v19, v20, "PIMSStoreCoreData: Unable to extract name from USO query. Skipping search.", v21, 2u);
      MEMORY[0x2199C53C4](v21, -1, -1);
    }

    return MEMORY[0x24BEE4AF8];
  }
  v66 = v63[2];
  v67 = v63[3];
  v68 = v63[4];
  v64 = v63[0];
  v65 = v63[1];
  v22 = sub_213E52E68();
  v24 = v23;
  sub_213DC077C(v62);
  if (qword_253F04A88 != -1)
    swift_once();
  v54 = v22;
  v25 = sub_213EF2724();
  v26 = __swift_project_value_buffer(v25, (uint64_t)qword_253F08A00);
  swift_bridgeObjectRetain_n();
  v27 = sub_213EF270C();
  v28 = sub_213EF2C94();
  v29 = os_log_type_enabled(v27, v28);
  v57 = v5;
  v55 = v12;
  if (v29)
  {
    v30 = (uint8_t *)swift_slowAlloc();
    v52 = swift_slowAlloc();
    v61 = v52;
    v53 = v26;
    *(_DWORD *)v30 = 136315138;
    swift_bridgeObjectRetain();
    v31 = v54;
    v60 = sub_213DB0570(v54, v24, &v61);
    v5 = v57;
    sub_213EF2D9C();
    swift_bridgeObjectRelease_n();
    v32 = v28;
    v33 = v24;
    v34 = v31;
    _os_log_impl(&dword_213DAB000, v27, v32, "PIMSStoreCoreData: Searching for pims with name==%s", v30, 0xCu);
    v35 = v52;
    swift_arrayDestroy();
    MEMORY[0x2199C53C4](v35, -1, -1);
    v36 = v30;
    v12 = v55;
    MEMORY[0x2199C53C4](v36, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    v33 = v24;
    v34 = v54;
  }
  sub_213DB9CDC(0, (unint64_t *)&qword_254D3C038);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D3C028);
  v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_213EF53E0;
  *(_QWORD *)(v37 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v37 + 64) = sub_213E07AFC();
  *(_QWORD *)(v37 + 32) = v34;
  *(_QWORD *)(v37 + 40) = v33;
  v38 = (void *)sub_213EF2C58();
  objc_msgSend(v12, sel_setPredicate_, v38);

  v39 = *(void **)(v56 + 24);
  type metadata accessor for PlusMediaSuggestionCoreDataRecord();
  v40 = v39;
  v41 = sub_213EF2D3C();

  if (!(v41 >> 62))
  {
    v42 = *(_QWORD *)((v41 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v42)
      goto LABEL_14;
LABEL_29:
    v50 = MEMORY[0x24BEE4AF8];
LABEL_30:

    swift_bridgeObjectRelease_n();
    return v50;
  }
  swift_bridgeObjectRetain();
  result = sub_213EF306C();
  v42 = result;
  if (!result)
    goto LABEL_29;
LABEL_14:
  if (v42 >= 1)
  {
    v44 = 0;
    v50 = MEMORY[0x24BEE4AF8];
    do
    {
      if ((v41 & 0xC000000000000001) != 0)
        v45 = (id)MEMORY[0x2199C49B0](v44, v41);
      else
        v45 = *(id *)(v41 + 8 * v44 + 32);
      v46 = v45;
      sub_213E59A14((uint64_t)v4);

      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
      {
        sub_213DAFEC4((uint64_t)v4, &qword_253F04B80);
      }
      else
      {
        v47 = v58;
        sub_213DEA488((uint64_t)v4, v58);
        sub_213DEA488(v47, v59);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v50 = sub_213DB6B94(0, *(_QWORD *)(v50 + 16) + 1, 1, v50);
        v49 = *(_QWORD *)(v50 + 16);
        v48 = *(_QWORD *)(v50 + 24);
        if (v49 >= v48 >> 1)
          v50 = sub_213DB6B94(v48 > 1, v49 + 1, 1, v50);
        *(_QWORD *)(v50 + 16) = v49 + 1;
        sub_213DEA488(v59, v50+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v49);
        v5 = v57;
      }
      ++v44;
    }
    while (v42 != v44);
    goto LABEL_30;
  }
  __break(1u);
  return result;
}

void sub_213ED3828()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  id v11;
  uint64_t v12;

  v1 = v0;
  v2 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v3 = (void *)sub_213EF2844();
  v4 = objc_msgSend(v2, sel_initWithEntityName_, v3);

  sub_213DB9CDC(0, (unint64_t *)&qword_254D3C038);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D3C028);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_213EF53E0;
  v6 = sub_213EF1D1C();
  *(_QWORD *)(v5 + 56) = sub_213DB9CDC(0, &qword_254D3E088);
  *(_QWORD *)(v5 + 64) = sub_213E4C028();
  *(_QWORD *)(v5 + 32) = v6;
  v7 = (void *)sub_213EF2C58();
  objc_msgSend(v4, sel_setPredicate_, v7);

  v8 = *(void **)(v1 + 24);
  type metadata accessor for PlusMediaSuggestionCoreDataRecord();
  v9 = v8;
  v10 = sub_213EF2D3C();

  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    v12 = sub_213EF306C();
    swift_bridgeObjectRelease();
    if (!v12)
      goto LABEL_6;
  }
  else if (!*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_6:
    swift_bridgeObjectRelease();

    return;
  }
  if ((v10 & 0xC000000000000001) != 0)
  {
    MEMORY[0x2199C49B0](0, v10);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v11 = *(id *)(v10 + 32);
    goto LABEL_6;
  }
  __break(1u);
}

void sub_213ED3BD4()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F04B80);
  sub_213EF2D30();

}

void sub_213ED3C3C(uint64_t a1@<X8>)
{
  void *v2;
  void *v3;
  uint64_t v4;

  sub_213ED3828();
  if (v2)
  {
    v3 = v2;
    sub_213E59A14(a1);

  }
  else
  {
    v4 = type metadata accessor for PlusMediaSuggestion();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, 1, 1, v4);
  }
}

uint64_t sub_213ED3CAC()
{
  return sub_213E4AB28();
}

void sub_213ED3CB8(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  sub_213ED3828();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 24), sel_deleteObject_, v4);
    v6 = sub_213ED127C();

  }
  else
  {
    v6 = 0;
  }
  *a2 = v6 & 1;
}

uint64_t sub_213ED3D28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t result;
  _QWORD v12[6];

  v3 = v2;
  v6 = *(void **)(v3 + 24);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = v3;
  v7[3] = a1;
  v7[4] = a2;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_213ED5350;
  *(_QWORD *)(v8 + 24) = v7;
  v12[4] = sub_213ED5C88;
  v12[5] = v8;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1107296256;
  v12[2] = sub_213E488EC;
  v12[3] = &block_descriptor_10_0;
  v9 = _Block_copy(v12);
  v10 = v6;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_performBlockAndWait_, v9);

  _Block_release(v9);
  LOBYTE(a2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((a2 & 1) != 0)
    __break(1u);
  return result;
}

void sub_213ED3E80(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;

  v2 = sub_213EF1CF8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (id)sub_213ED58E0();
  if (!v6)
  {
    type metadata accessor for PlusMediaSuggestionStoreUpdateRecord();
    v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithContext_, *(_QWORD *)(a1 + 24));
  }
  v7 = v6;
  v8 = (void *)sub_213EF2844();
  objc_msgSend(v7, sel_setSource_, v8);

  sub_213EF1CEC();
  v9 = (void *)sub_213EF1C8C();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend(v7, sel_setTimestamp_, v9);

  if ((sub_213ED127C() & 1) == 0)
  {
    if (qword_253F04A88 != -1)
      swift_once();
    v10 = sub_213EF2724();
    __swift_project_value_buffer(v10, (uint64_t)qword_253F08A00);
    v11 = sub_213EF270C();
    v12 = sub_213EF2CA0();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_213DAB000, v11, v12, "Failed to persist store update record to CoreData", v13, 2u);
      MEMORY[0x2199C53C4](v13, -1, -1);
    }

  }
}

void sub_213ED4040()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D40908);
  sub_213EF2D30();

}

void sub_213ED40A8(uint64_t *a1@<X8>)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = sub_213ED58E0();
  if (v2)
  {
    v3 = (void *)v2;
    sub_213E5B0E8(a1);

  }
  else
  {
    v4 = type metadata accessor for SuggestionStoreUpdate();
    (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, 1, 1, v4);
  }
}

uint64_t PIMSStoreCoreData.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t PIMSStoreCoreData.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t sub_213ED4164()
{
  return sub_213E4B24C();
}

uint64_t sub_213ED4170()
{
  return sub_213E4B24C();
}

uint64_t sub_213ED417C()
{
  return sub_213E4B24C();
}

uint64_t sub_213ED4188()
{
  return sub_213ED2480();
}

uint64_t sub_213ED41A8(uint64_t a1, uint64_t a2)
{
  return sub_213E4B0A0(a1, a2, &qword_253F04E58);
}

uint64_t sub_213ED41BC()
{
  uint64_t v0;
  id v1;
  uint64_t v3;

  v1 = *(id *)(*(_QWORD *)v0 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F04E58);
  sub_213EF2D30();

  return v3;
}

void sub_213ED4228()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(*(_QWORD *)v0 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F04B80);
  sub_213EF2D30();

}

uint64_t sub_213ED4294()
{
  uint64_t v0;
  id v1;
  uint64_t v3;

  v1 = *(id *)(*(_QWORD *)v0 + 24);
  sub_213EF2D30();

  return v3;
}

uint64_t sub_213ED42FC(uint64_t a1, uint64_t a2)
{
  return sub_213E4B0A0(a1, a2, &qword_254D3A9C8);
}

uint64_t sub_213ED4310(uint64_t a1, uint64_t a2)
{
  return sub_213ED3D28(a1, a2);
}

void sub_213ED4330()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(*(_QWORD *)v0 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D40908);
  sub_213EF2D30();

}

uint64_t PIMSStoreCoreDataWithMigrations.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id v5;

  v4 = swift_allocObject();
  v5 = sub_213ED47F0(a1, a2, 1);
  swift_bridgeObjectRelease();
  if (v5)
  {
    *(_QWORD *)(v4 + 16) = v5;
    *(_QWORD *)(v4 + 24) = objc_msgSend(v5, sel_newBackgroundContext);
  }
  else
  {
    type metadata accessor for PIMSStoreCoreData();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v4;
}

uint64_t PIMSStoreCoreDataWithMigrations.init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v3 = sub_213ED47F0(a1, a2, 1);
  swift_bridgeObjectRelease();
  if (v3)
  {
    *(_QWORD *)(v2 + 16) = v3;
    *(_QWORD *)(v2 + 24) = objc_msgSend(v3, sel_newBackgroundContext);
  }
  else
  {
    type metadata accessor for PIMSStoreCoreData();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v2;
}

uint64_t PIMSStoreCoreDataWithMigrations.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t PIMSStoreCoreDataWithMigrations.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t sub_213ED44FC(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;

  result = MEMORY[0x24BEE4AF8];
  v12 = MEMORY[0x24BEE4AF8];
  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    v6 = *(_QWORD *)(type metadata accessor for ThinMediaGroundTruth() - 8);
    v7 = a1 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    v8 = *(void **)(a2 + 24);
    v9 = *(_QWORD *)(v6 + 72);
    swift_bridgeObjectRetain();
    do
    {
      v10 = v8;
      v11 = sub_213E57954((uint64_t)v10);

      if (v11)
      {
        MEMORY[0x2199C44C4]();
        if (*(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_213EF2A78();
        sub_213EF2AB4();
        sub_213EF2A54();
      }
      v7 += v9;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
    return v12;
  }
  return result;
}

uint64_t sub_213ED460C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t result;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  int64_t v12;
  id v13;
  uint64_t v14;

  v14 = MEMORY[0x24BEE4AF8];
  v3 = a1 + 56;
  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  if (!v6)
    goto LABEL_5;
LABEL_4:
  for (v6 &= v6 - 1; ; v6 = (v11 - 1) & v11)
  {
    v13 = *(id *)(a2 + 24);
    sub_213E590D4();

    MEMORY[0x2199C44C4]();
    if (*(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_213EF2A78();
    sub_213EF2AB4();
    result = sub_213EF2A54();
    if (v6)
      goto LABEL_4;
LABEL_5:
    v10 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v10 >= v7)
      goto LABEL_25;
    v11 = *(_QWORD *)(v3 + 8 * v10);
    ++v9;
    if (!v11)
    {
      v9 = v10 + 1;
      if (v10 + 1 >= v7)
        goto LABEL_25;
      v11 = *(_QWORD *)(v3 + 8 * v9);
      if (!v11)
      {
        v9 = v10 + 2;
        if (v10 + 2 >= v7)
          goto LABEL_25;
        v11 = *(_QWORD *)(v3 + 8 * v9);
        if (!v11)
        {
          v9 = v10 + 3;
          if (v10 + 3 >= v7)
            goto LABEL_25;
          v11 = *(_QWORD *)(v3 + 8 * v9);
          if (!v11)
            break;
        }
      }
    }
LABEL_20:
    ;
  }
  v12 = v10 + 4;
  if (v12 >= v7)
  {
LABEL_25:
    swift_release();
    return v14;
  }
  v11 = *(_QWORD *)(v3 + 8 * v12);
  if (v11)
  {
    v9 = v12;
    goto LABEL_20;
  }
  while (1)
  {
    v9 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v9 >= v7)
      goto LABEL_25;
    v11 = *(_QWORD *)(v3 + 8 * v9);
    ++v12;
    if (v11)
      goto LABEL_20;
  }
LABEL_27:
  __break(1u);
  return result;
}

id sub_213ED47F0(uint64_t a1, uint64_t a2, int a3)
{
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
  uint64_t v17;
  char *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  unsigned int v30;
  id v31;
  char v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  NSObject *v38;
  os_log_type_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  id v45;
  uint64_t v46;
  unint64_t v47;
  os_log_t v48;
  void *v49;
  uint64_t ObjCClassFromMetadata;
  id v51;
  char *v52;
  void *v53;
  uint64_t v54;
  id v55;
  void *v56;
  _BYTE *v57;
  _BYTE *v58;
  void *v59;
  os_log_t v61;
  int v62;
  void *v63;
  char *v64;
  int v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  id aBlock[8];

  aBlock[6] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = sub_213EF2CDC();
  v67 = *(_QWORD *)(v5 - 8);
  v68 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v66 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_213EF1C2C();
  v70 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v61 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v61 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v61 - v17;
  v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBB740]), sel_init);
  objc_msgSend(v19, sel_setShouldInferMappingModelAutomatically_, 0);
  objc_msgSend(v19, sel_setShouldMigrateStoreAutomatically_, 0);
  if (qword_253F04B00 != -1)
    swift_once();
  v20 = (void *)qword_253F04AF0;
  if (!qword_253F04AF0)
  {

    return 0;
  }
  v65 = a3;
  v64 = v10;
  v21 = v7;
  v22 = objc_allocWithZone(MEMORY[0x24BDBB700]);
  v23 = v20;
  v24 = (void *)sub_213EF2844();
  v69 = v23;
  v25 = objc_msgSend(v22, sel_initWithName_managedObjectModel_, v24, v23);

  if (a2)
  {
    sub_213EF1BCC();
    v26 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    sub_213EF1BE4();
    v27 = (void *)sub_213EF1BD8();
    v28 = *(void (**)(char *, uint64_t))(v70 + 8);
    v29 = v21;
    v28(v16, v21);
    aBlock[0] = 0;
    v30 = objc_msgSend(v26, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v27, 1, 0, aBlock);

    v31 = aBlock[0];
    v32 = v65;
    if (!v30)
    {
      v33 = v31;
      v34 = (void *)sub_213EF1BA8();

      swift_willThrow();
      if (qword_253F04A88 != -1)
        swift_once();
      v35 = sub_213EF2724();
      __swift_project_value_buffer(v35, (uint64_t)qword_253F08A00);
      (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v13, v18, v29);
      v36 = v34;
      v37 = v34;
      v38 = sub_213EF270C();
      v39 = sub_213EF2CA0();
      v40 = v39;
      if (!os_log_type_enabled(v38, v39))
      {

        v28(v13, v29);
        if ((v32 & 1) == 0)
          goto LABEL_14;
        goto LABEL_11;
      }
      v41 = swift_slowAlloc();
      v62 = v40;
      v42 = v41;
      v63 = (void *)swift_slowAlloc();
      aBlock[0] = v63;
      *(_DWORD *)v42 = 136315394;
      sub_213DB0DB4(&qword_254D3E098, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
      v61 = v38;
      v43 = sub_213EF31F8();
      v71 = sub_213DB0570(v43, v44, (uint64_t *)aBlock);
      sub_213EF2D9C();
      swift_bridgeObjectRelease();
      v28(v13, v29);
      *(_WORD *)(v42 + 12) = 2080;
      v71 = (uint64_t)v34;
      v45 = v34;
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F04F00);
      v46 = sub_213EF288C();
      v71 = sub_213DB0570(v46, v47, (uint64_t *)aBlock);
      v32 = v65;
      sub_213EF2D9C();
      swift_bridgeObjectRelease();

      v48 = v61;
      _os_log_impl(&dword_213DAB000, v61, (os_log_type_t)v62, "PIMSStoreCoreData: Unable to create data directory, path=%s, error=%s", (uint8_t *)v42, 0x16u);
      v49 = v63;
      swift_arrayDestroy();
      MEMORY[0x2199C53C4](v49, -1, -1);
      MEMORY[0x2199C53C4](v42, -1, -1);

    }
    if ((v32 & 1) == 0)
    {
LABEL_14:
      v53 = (void *)sub_213EF1BD8();
      objc_msgSend(v19, sel_setURL_, v53);

      v28(v18, v29);
      goto LABEL_15;
    }
LABEL_11:
    type metadata accessor for PIMSStoreCoreData();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v51 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    sub_213EF25B0();
    swift_allocObject();
    sub_213EF25A4();
    v52 = v66;
    sub_213EF2CD0();
    sub_213EF2598();
    (*(void (**)(char *, uint64_t))(v67 + 8))(v52, v68);
    swift_release();
    goto LABEL_14;
  }
LABEL_15:
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F04EF0);
  v54 = swift_allocObject();
  *(_OWORD *)(v54 + 16) = xmmword_213EF8CA0;
  *(_QWORD *)(v54 + 32) = v19;
  aBlock[0] = (id)v54;
  sub_213EF2A54();
  sub_213DB9CDC(0, &qword_253F04E80);
  v55 = v19;
  v56 = (void *)sub_213EF2A30();
  swift_bridgeObjectRelease();
  objc_msgSend(v25, sel_setPersistentStoreDescriptions_, v56);

  v57 = (_BYTE *)swift_allocObject();
  v57[16] = 1;
  v58 = v57 + 16;
  aBlock[4] = sub_213ED5C44;
  aBlock[5] = v57;
  aBlock[0] = (id)MEMORY[0x24BDAC760];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_213ED0978;
  aBlock[3] = &block_descriptor_26_0;
  v59 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v25, sel_loadPersistentStoresWithCompletionHandler_, v59);

  _Block_release(v59);
  swift_beginAccess();
  LOBYTE(v55) = *v58;
  swift_release();
  if ((v55 & 1) == 0)
  {

    return 0;
  }
  return v25;
}

uint64_t type metadata accessor for PIMSStoreCoreData()
{
  return objc_opt_self();
}

id sub_213ED51E8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;

  return sub_213ED14DC(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_213ED5200@<X0>(uint64_t *a1@<X8>)
{
  return sub_213ED58A0(a1);
}

uint64_t sub_213ED5214@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_213ED1FD8();
  *a1 = result;
  return result;
}

void sub_213ED5240(_BYTE *a1@<X8>)
{
  uint64_t v1;

  sub_213ED3CB8(*(_QWORD *)(v1 + 16), a1);
}

void sub_213ED5258(_BYTE *a1@<X8>)
{
  uint64_t v1;

  sub_213ED23B4(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_213ED5274()
{
  return swift_deallocObject();
}

uint64_t sub_213ED5284()
{
  uint64_t v0;

  return sub_213DB04E0(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_213ED52A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_213ED2A24();
  *a1 = result;
  return result;
}

uint64_t sub_213ED52D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = sub_213ED2FC4(*(_QWORD *)(v1 + 24));
  *a1 = result;
  return result;
}

void sub_213ED530C(uint64_t a1@<X8>)
{
  sub_213ED3C3C(a1);
}

uint64_t sub_213ED5324()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_213ED5350()
{
  uint64_t v0;

  sub_213ED3E80(*(_QWORD *)(v0 + 16));
}

uint64_t sub_213ED535C()
{
  return swift_deallocObject();
}

void sub_213ED536C(uint64_t *a1@<X8>)
{
  sub_213ED40A8(a1);
}

uint64_t method lookup function for PIMSStoreCoreData()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PIMSStoreCoreData.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of PIMSStoreCoreData.getPersistentContainer()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of PIMSStoreCoreData.insert(pims:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of PIMSStoreCoreData.delete(mediaId:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of PIMSStoreCoreData.readAllMediaReferences()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of PIMSStoreCoreData.delete(pims:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of PIMSStoreCoreData.update(pims:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of PIMSStoreCoreData.resetStore()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of PIMSStoreCoreData.readAll()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of PIMSStoreCoreData.find(key:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of PIMSStoreCoreData.find(uuid:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of PIMSStoreCoreData.delete(uuid:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of PIMSStoreCoreData.recordStoreUpdate(source:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of PIMSStoreCoreData.mostRecentStoreUpdate()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t type metadata accessor for PIMSStoreCoreDataWithMigrations()
{
  return objc_opt_self();
}

uint64_t sub_213ED545C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for PlusMediaSuggestion();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_213EF1A10();
  MEMORY[0x24BDAC7A8](v1);
  sub_213EF1A40();
  swift_allocObject();
  sub_213EF1A34();
  sub_213EF1A04();
  sub_213EF1A1C();
  sub_213EF1ED8();
  sub_213DB0DB4(&qword_254D3A9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BEA0A48], MEMORY[0x24BE9F778]);
  swift_retain();
  v2 = sub_213EF1A28();
  swift_release();
  swift_release();
  return v2;
}

uint64_t sub_213ED57F0(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = sub_213ED5860(a3, a4);
    result = MEMORY[0x2199C52D4](MEMORY[0x24BEE12A0], v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_213ED5860(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2199C52D4](&protocol conformance descriptor for ScoreStep<A>, v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_213ED58A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = sub_213ED1AEC(*(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
  *a1 = result;
  return result;
}

uint64_t sub_213ED58E0()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  void *v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  id v22[2];

  v22[1] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_213EF2844();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  v22[0] = 0;
  v3 = objc_msgSend(v2, sel_execute_, v22);
  v4 = v22[0];
  if (v3)
  {
    v5 = v3;
    type metadata accessor for PlusMediaSuggestionStoreUpdateRecord();
    v6 = sub_213EF2A3C();
    v7 = v4;

    if (v6 >> 62)
    {
      swift_bridgeObjectRetain();
      v8 = sub_213EF306C();
      swift_bridgeObjectRelease();
      if (!v8)
        goto LABEL_8;
    }
    else
    {
      v8 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v8)
      {
LABEL_8:
        swift_bridgeObjectRelease();

        return v8;
      }
    }
    if ((v6 & 0xC000000000000001) != 0)
    {
      v9 = (id)MEMORY[0x2199C49B0](0, v6);
      goto LABEL_7;
    }
    if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v9 = *(id *)(v6 + 32);
LABEL_7:
      v8 = (uint64_t)v9;
      goto LABEL_8;
    }
    __break(1u);
    goto LABEL_19;
  }
  v10 = v22[0];
  v5 = (void *)sub_213EF1BA8();

  swift_willThrow();
  if (qword_253F04A88 != -1)
LABEL_19:
    swift_once();
  v11 = sub_213EF2724();
  __swift_project_value_buffer(v11, (uint64_t)qword_253F08A00);
  v12 = v5;
  v13 = v5;
  v14 = sub_213EF270C();
  v15 = sub_213EF2CA0();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = (void *)swift_slowAlloc();
    v22[0] = v17;
    *(_DWORD *)v16 = 136315138;
    v18 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F04F00);
    v19 = sub_213EF288C();
    sub_213DB0570(v19, v20, (uint64_t *)v22);
    sub_213EF2D9C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_213DAB000, v14, v15, "Failed to load store update record. error=%s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199C53C4](v17, -1, -1);
    MEMORY[0x2199C53C4](v16, -1, -1);

  }
  else
  {

  }
  return 0;
}

uint64_t sub_213ED5C34()
{
  return swift_deallocObject();
}

void sub_213ED5C44(void *a1, void *a2)
{
  uint64_t v2;

  sub_213ED1010(a1, a2, v2);
}

uint64_t sub_213ED5C4C@<X0>(uint64_t *a1@<X8>)
{
  return sub_213ED52D0(a1);
}

uint64_t sub_213ED5C60@<X0>(uint64_t *a1@<X8>)
{
  return sub_213ED5214(a1);
}

uint64_t sub_213ED5C74@<X0>(uint64_t *a1@<X8>)
{
  return sub_213ED52A4(a1);
}

void sub_213ED5C9C(_BYTE *a1@<X8>)
{
  sub_213ED5240(a1);
}

void sub_213ED5CB0(uint64_t a1@<X8>)
{
  sub_213ED530C(a1);
}

void sub_213ED5CC4(_BYTE *a1@<X8>)
{
  sub_213ED5258(a1);
}

id sub_213ED5CD8@<X0>(_BYTE *a1@<X8>)
{
  return sub_213ED51E8(a1);
}

uint64_t sub_213ED5CEC()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254D40920);
  sub_213EF288C();
  sub_213EF2904();
  swift_bridgeObjectRelease();
  result = sub_213EF2904();
  qword_254D40910 = 91;
  *(_QWORD *)algn_254D40918 = 0xE100000000000000;
  return result;
}

NSObject *sub_213ED5D70(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  id v4;
  void *v5;
  uint64_t v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v20;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95848]), sel_init);
  if (!v2)
  {
    if (qword_253F04A88 != -1)
      swift_once();
    v6 = sub_213EF2724();
    __swift_project_value_buffer(v6, (uint64_t)qword_253F08A00);
    v3 = sub_213EF270C();
    v7 = sub_213EF2CA0();
    if (os_log_type_enabled(v3, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      v20 = v9;
      *(_DWORD *)v8 = 136315138;
      if (qword_254D3A0A8 != -1)
        swift_once();
      v10 = qword_254D40910;
      v11 = *(_QWORD *)algn_254D40918;
      swift_bridgeObjectRetain();
      sub_213DB0570(v10, v11, &v20);
      sub_213EF2D9C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_213DAB000, v3, v7, "%s Failed to create SELF template for PLUSSchemaPLUSSuggestionDomainOutcome", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C53C4](v9, -1, -1);
      MEMORY[0x2199C53C4](v8, -1, -1);
    }
    goto LABEL_17;
  }
  v3 = v2;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE957F0]), sel_init);
  if (!v4)
  {
    if (qword_253F04A88 != -1)
      swift_once();
    v12 = sub_213EF2724();
    __swift_project_value_buffer(v12, (uint64_t)qword_253F08A00);
    v13 = sub_213EF270C();
    v14 = sub_213EF2CA0();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      v20 = v16;
      *(_DWORD *)v15 = 136315138;
      if (qword_254D3A0A8 != -1)
        swift_once();
      v17 = qword_254D40910;
      v18 = *(_QWORD *)algn_254D40918;
      swift_bridgeObjectRetain();
      sub_213DB0570(v17, v18, &v20);
      sub_213EF2D9C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_213DAB000, v13, v14, "%s Failed to create SELF template for PLUSSchemaPLUSSuggestionDomainOutcome", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C53C4](v16, -1, -1);
      MEMORY[0x2199C53C4](v15, -1, -1);
    }

LABEL_17:
    return 0;
  }
  v5 = v4;
  objc_msgSend(v4, sel_setMediaSuggestionFeedback_, a1);
  -[NSObject setMediaOutcome:](v3, sel_setMediaOutcome_, v5);

  return v3;
}

void *sub_213ED60E8(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  uint64_t v13;
  unsigned int (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F04828);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95860]), sel_init);
  if (v11)
  {
    v12 = v11;
    v44 = a3;
    v13 = sub_213EF1D64();
    v43 = *(_QWORD *)(v13 - 8);
    v14 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48);
    if (v14(a2, 1, v13) == 1)
    {
      v42 = a4;
      if (qword_253F04A88 != -1)
        swift_once();
      v15 = sub_213EF2724();
      __swift_project_value_buffer(v15, (uint64_t)qword_253F08A00);
      v16 = sub_213EF270C();
      v17 = sub_213EF2CA0();
      if (os_log_type_enabled(v16, v17))
      {
        v41 = a1;
        v18 = (uint8_t *)swift_slowAlloc();
        v39 = swift_slowAlloc();
        v46 = v39;
        v40 = v18;
        *(_DWORD *)v18 = 136315138;
        if (qword_254D3A0A8 != -1)
          swift_once();
        v19 = qword_254D40910;
        v20 = *(_QWORD *)algn_254D40918;
        swift_bridgeObjectRetain();
        v21 = sub_213DB0570(v19, v20, &v46);
        v22 = v40;
        v45 = v21;
        sub_213EF2D9C();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_213DAB000, v16, v17, "%s RequestId for PLUSSchemaPLUSSuggestionOutcomeReported was nil. Still creating event, but this is not expected.", v22, 0xCu);
        v23 = v39;
        swift_arrayDestroy();
        MEMORY[0x2199C53C4](v23, -1, -1);
        MEMORY[0x2199C53C4](v22, -1, -1);

        a4 = v42;
      }
      else
      {

        a4 = v42;
      }
    }
    v31 = objc_allocWithZone(MEMORY[0x24BE95C78]);
    v32 = (void *)sub_213EF1D1C();
    v33 = objc_msgSend(v31, sel_initWithNSUUID_, v32);

    objc_msgSend(v12, sel_setSuggestionLinkId_, v33);
    sub_213DBDD88(a2, (uint64_t)v10);
    if (v14((uint64_t)v10, 1, v13) == 1)
    {
      sub_213E0EC38((uint64_t)v10);
      v34 = 0;
    }
    else
    {
      v35 = objc_allocWithZone(MEMORY[0x24BE95C78]);
      v36 = (void *)sub_213EF1D1C();
      v34 = objc_msgSend(v35, sel_initWithNSUUID_, v36);

      (*(void (**)(char *, uint64_t))(v43 + 8))(v10, v13);
    }
    v37 = v44;
    objc_msgSend(v12, sel_setOriginalRequestId_, v34, v39);

    objc_msgSend(v12, sel_setSuggestionOutcome_, v37);
    objc_msgSend(v12, sel_setDomainOutcome_, a4);
  }
  else
  {
    if (qword_253F04A88 != -1)
      swift_once();
    v24 = sub_213EF2724();
    __swift_project_value_buffer(v24, (uint64_t)qword_253F08A00);
    v25 = sub_213EF270C();
    v26 = sub_213EF2CA0();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      v28 = swift_slowAlloc();
      v46 = v28;
      *(_DWORD *)v27 = 136315138;
      if (qword_254D3A0A8 != -1)
        swift_once();
      v29 = qword_254D40910;
      v30 = *(_QWORD *)algn_254D40918;
      swift_bridgeObjectRetain();
      v45 = sub_213DB0570(v29, v30, &v46);
      sub_213EF2D9C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_213DAB000, v25, v26, "%s Failed to create SELF template for PLUSSchemaPLUSContactSuggestionOutcomeReported", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C53C4](v28, -1, -1);
      MEMORY[0x2199C53C4](v27, -1, -1);
    }

    return 0;
  }
  return v12;
}

ValueMetadata *type metadata accessor for PLUSMediaOutcomeReportedLogUtils()
{
  return &type metadata for PLUSMediaOutcomeReportedLogUtils;
}

void sub_213ED65D4(char a1)
{
  sub_213EF32F4();
  __asm { BR              X10 }
}

uint64_t sub_213ED6630()
{
  sub_213EF28BC();
  swift_bridgeObjectRelease();
  return sub_213EF3330();
}

void sub_213ED66BC(char a1)
{
  sub_213EF32F4();
  __asm { BR              X10 }
}

uint64_t sub_213ED6714()
{
  sub_213EF28BC();
  swift_bridgeObjectRelease();
  return sub_213EF3330();
}

uint64_t sub_213ED6774()
{
  sub_213EF32F4();
  sub_213EF28BC();
  swift_bridgeObjectRelease();
  return sub_213EF3330();
}

void sub_213ED6818(char a1)
{
  sub_213EF32F4();
  __asm { BR              X10 }
}

uint64_t sub_213ED6878()
{
  sub_213EF28BC();
  swift_bridgeObjectRelease();
  return sub_213EF3330();
}

void sub_213ED68E8(char a1)
{
  sub_213EF32F4();
  __asm { BR              X10 }
}

uint64_t sub_213ED6944()
{
  sub_213EF28BC();
  swift_bridgeObjectRelease();
  return sub_213EF3330();
}

unint64_t ContactPromptGroundTruth.promptTask.getter()
{
  uint64_t v0;
  unint64_t *v1;
  unint64_t v2;

  v1 = (unint64_t *)(v0 + *(int *)(type metadata accessor for ContactPromptGroundTruth() + 48));
  if (v1[1])
    v2 = *v1;
  else
    v2 = 0xD000000000000023;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t type metadata accessor for ContactPromptGroundTruth()
{
  uint64_t result;

  result = qword_253F04CB8;
  if (!qword_253F04CB8)
    return swift_getSingletonMetadata();
  return result;
}

__n128 ContactPromptGroundTruth.init(id:promptTask:promptType:usoContactQuery:presentedContacts:selectedContact:interactionOutcome:plusSuggestions:plusForcePrompted:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, __n128 *a7@<X6>, char *a8@<X7>, uint64_t a9@<X8>, uint64_t a10, char a11)
{
  char v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  int *v19;
  _QWORD *v20;
  uint64_t v21;
  __n128 *v22;
  __n128 result;
  __n128 v24;

  v15 = *a4;
  v24 = *a7;
  v16 = a7[1].n128_u64[0];
  v17 = a7[1].n128_u64[1];
  v18 = *a8;
  v19 = (int *)type metadata accessor for ContactPromptGroundTruth();
  v20 = (_QWORD *)(a9 + v19[12]);
  v21 = sub_213EF1D64();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(a9, a1, v21);
  *v20 = a2;
  v20[1] = a3;
  *(_BYTE *)(a9 + v19[5]) = v15;
  *(_QWORD *)(a9 + v19[6]) = a5;
  *(_QWORD *)(a9 + v19[7]) = a6;
  v22 = (__n128 *)(a9 + v19[8]);
  result = v24;
  *v22 = v24;
  v22[1].n128_u64[0] = v16;
  v22[1].n128_u64[1] = v17;
  *(_BYTE *)(a9 + v19[9]) = v18;
  *(_QWORD *)(a9 + v19[10]) = a10;
  *(_BYTE *)(a9 + v19[11]) = a11;
  return result;
}

uint64_t ContactPromptGroundTruth.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_213EF1D64();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

SiriPrivateLearningInference::ContactPromptGroundTruthType_optional __swiftcall ContactPromptGroundTruthType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;

  return (SiriPrivateLearningInference::ContactPromptGroundTruthType_optional)sub_213ED6EB8(v1);
}

uint64_t ContactPromptGroundTruthType.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x616D7269666E6F63;
  else
    return 0x6769626D61736964;
}

uint64_t sub_213ED6C04()
{
  sub_213EF32F4();
  sub_213EF28BC();
  swift_bridgeObjectRelease();
  return sub_213EF3330();
}

uint64_t sub_213ED6C98()
{
  sub_213EF28BC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_213ED6D08()
{
  sub_213EF32F4();
  sub_213EF28BC();
  swift_bridgeObjectRelease();
  return sub_213EF3330();
}

SiriPrivateLearningInference::ContactPromptGroundTruthType_optional sub_213ED6D98(Swift::String *a1)
{
  return ContactPromptGroundTruthType.init(rawValue:)(*a1);
}

void sub_213ED6DA4(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 0x6769626D61736964;
  if (*v1)
    v2 = 0x616D7269666E6F63;
  v3 = 0xEE006E6F69746175;
  if (*v1)
    v3 = 0xEC0000006E6F6974;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_213ED6DF8()
{
  sub_213ED9898();
  return sub_213EF2A18();
}

uint64_t sub_213ED6E54()
{
  sub_213ED9898();
  return sub_213EF2A0C();
}

uint64_t sub_213ED6EA0(char *a1, char *a2)
{
  return sub_213E29864(*a1, *a2);
}

SiriPrivateLearningInference::ContactPromptInteractionOutcome_optional __swiftcall ContactPromptInteractionOutcome.init(rawValue:)(Swift::String rawValue)
{
  char *v1;

  return (SiriPrivateLearningInference::ContactPromptInteractionOutcome_optional)sub_213ED6EB8(v1);
}

uint64_t sub_213ED6EB8@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_213EF30D8();
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

uint64_t ContactPromptInteractionOutcome.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x6E61624172657375;
  else
    return 0x65746E4972657375;
}

uint64_t sub_213ED6F68()
{
  sub_213EF32F4();
  sub_213EF28BC();
  swift_bridgeObjectRelease();
  return sub_213EF3330();
}

uint64_t sub_213ED7000()
{
  sub_213EF28BC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_213ED7074()
{
  sub_213EF32F4();
  sub_213EF28BC();
  swift_bridgeObjectRelease();
  return sub_213EF3330();
}

SiriPrivateLearningInference::ContactPromptInteractionOutcome_optional sub_213ED7108(Swift::String *a1)
{
  return ContactPromptInteractionOutcome.init(rawValue:)(*a1);
}

void sub_213ED7114(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 0x65746E4972657375;
  if (*v1)
    v2 = 0x6E61624172657375;
  v3 = 0xEE00646574636172;
  if (*v1)
    v3 = 0xED000064656E6F64;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_213ED716C()
{
  sub_213ED9854();
  return sub_213EF2A18();
}

uint64_t sub_213ED71C8()
{
  sub_213ED9854();
  return sub_213EF2A0C();
}

uint64_t sub_213ED7214(char *a1, char *a2)
{
  return sub_213E29B64(*a1, *a2);
}

SiriPrivateLearningInference::ContactPromptGroundTruthSource_optional __swiftcall ContactPromptGroundTruthSource.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  SiriPrivateLearningInference::ContactPromptGroundTruthSource_optional result;
  char v5;

  v2 = v1;
  v3 = sub_213EF30D8();
  result.value = swift_bridgeObjectRelease();
  v5 = 6;
  if (v3 < 6)
    v5 = v3;
  *v2 = v5;
  return result;
}

void *static ContactPromptGroundTruthSource.allCases.getter()
{
  return &unk_24D100BE0;
}

uint64_t ContactPromptGroundTruthSource.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_213ED72BC + 4 * byte_213F02554[*v0]))(0xD000000000000014, 0x8000000213F05640);
}

uint64_t sub_213ED72BC@<X0>(uint64_t a1@<X8>)
{
  return a1 + 2;
}

unint64_t sub_213ED72F4()
{
  return 0xD000000000000015;
}

void sub_213ED731C()
{
  char *v0;

  sub_213ED68E8(*v0);
}

void sub_213ED7324(uint64_t a1)
{
  char *v1;

  sub_213E2AA20(a1, *v1);
}

void sub_213ED732C(uint64_t a1)
{
  char *v1;

  sub_213E2B04C(a1, *v1);
}

SiriPrivateLearningInference::ContactPromptGroundTruthSource_optional sub_213ED7334(Swift::String *a1)
{
  return ContactPromptGroundTruthSource.init(rawValue:)(*a1);
}

uint64_t sub_213ED7340@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = ContactPromptGroundTruthSource.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_213ED7364()
{
  sub_213ED9810();
  return sub_213EF2A18();
}

uint64_t sub_213ED73C0()
{
  sub_213ED9810();
  return sub_213EF2A0C();
}

void sub_213ED740C(char *a1)
{
  sub_213E296D4(*a1);
}

void sub_213ED7418(_QWORD *a1@<X8>)
{
  *a1 = &unk_24D100BE0;
}

unint64_t static ContactPromptGroundTruth.deletedContactReferenceId.getter()
{
  return 0xD000000000000013;
}

uint64_t ContactPromptGroundTruth.promptType.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for ContactPromptGroundTruth();
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 20));
  return result;
}

uint64_t ContactPromptGroundTruth.usoContactQuery.getter()
{
  type metadata accessor for ContactPromptGroundTruth();
  return swift_retain();
}

uint64_t ContactPromptGroundTruth.presentedContacts.getter()
{
  type metadata accessor for ContactPromptGroundTruth();
  return swift_bridgeObjectRetain();
}

uint64_t ContactPromptGroundTruth.selectedContact.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for ContactPromptGroundTruth() + 32));
  v4 = *v3;
  v5 = v3[1];
  v6 = v3[2];
  v7 = v3[3];
  *a1 = *v3;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  return sub_213E05FBC(v4, v5);
}

uint64_t ContactPromptGroundTruth.interactionOutcome.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for ContactPromptGroundTruth();
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 36));
  return result;
}

uint64_t ContactPromptGroundTruth.plusSuggestions.getter()
{
  type metadata accessor for ContactPromptGroundTruth();
  return swift_bridgeObjectRetain();
}

uint64_t ContactPromptGroundTruth.plusForcePrompted.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ContactPromptGroundTruth() + 44));
}

uint64_t sub_213ED7564(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_213ED758C + 4 * byte_213F0255A[a1]))(25705, 0xE200000000000000);
}

uint64_t sub_213ED758C()
{
  return 0x795474706D6F7270;
}

uint64_t sub_213ED75A8()
{
  return 0x61746E6F436F7375;
}

unint64_t sub_213ED75CC()
{
  return 0xD000000000000011;
}

uint64_t sub_213ED765C()
{
  return 0x5474706D6F72705FLL;
}

uint64_t sub_213ED767C()
{
  unsigned __int8 *v0;

  return sub_213ED7564(*v0);
}

uint64_t sub_213ED7684@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_213ED9408(a1, a2);
  *a3 = result;
  return result;
}

void sub_213ED76A8(_BYTE *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_213ED76B4()
{
  sub_213ED84A4();
  return sub_213EF3354();
}

uint64_t sub_213ED76DC()
{
  sub_213ED84A4();
  return sub_213EF3360();
}

uint64_t ContactPromptGroundTruth.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int *v9;
  _OWORD *v10;
  __int128 v11;
  _OWORD v13[2];
  char v14;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40928);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_213ED84A4();
  sub_213EF3348();
  LOBYTE(v13[0]) = 0;
  sub_213EF1D64();
  sub_213DB0DB4(&qword_254D3A9B8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
  sub_213EF31BC();
  if (!v2)
  {
    v9 = (int *)type metadata accessor for ContactPromptGroundTruth();
    LOBYTE(v13[0]) = *(_BYTE *)(v3 + v9[5]);
    v14 = 1;
    sub_213ED84E8();
    sub_213EF31BC();
    *(_QWORD *)&v13[0] = *(_QWORD *)(v3 + v9[6]);
    v14 = 2;
    sub_213EF1E30();
    sub_213DB0DB4(&qword_254D3BBD8, (uint64_t (*)(uint64_t))MEMORY[0x24BEA04E8], MEMORY[0x24BE9F778]);
    sub_213EF31BC();
    *(_QWORD *)&v13[0] = *(_QWORD *)(v3 + v9[7]);
    v14 = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F04E50);
    sub_213ED85B4(&qword_254D40940, (uint64_t (*)(void))sub_213E626B0, MEMORY[0x24BEE12A0]);
    sub_213EF31BC();
    v10 = (_OWORD *)(v3 + v9[8]);
    v11 = v10[1];
    v13[0] = *v10;
    v13[1] = v11;
    v14 = 4;
    sub_213E626B0();
    sub_213EF3180();
    LOBYTE(v13[0]) = *(_BYTE *)(v3 + v9[9]);
    v14 = 5;
    sub_213ED852C();
    sub_213EF3180();
    *(_QWORD *)&v13[0] = *(_QWORD *)(v3 + v9[10]);
    v14 = 6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D3B030);
    sub_213ED8660(&qword_254D40950, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    sub_213EF31BC();
    LOBYTE(v13[0]) = 7;
    sub_213EF3198();
    LOBYTE(v13[0]) = 8;
    sub_213EF3174();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t ContactPromptGroundTruth.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  _OWORD *v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  int *v31;
  _QWORD *v32;
  char *v33;
  __int128 v34;
  __int128 v35;
  char v36;

  v27 = a2;
  v4 = sub_213EF1D64();
  v28 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40958);
  v7 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for ContactPromptGroundTruth();
  MEMORY[0x24BDAC7A8](v10);
  v30 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = v12;
  v13 = &v30[v12[12]];
  *(_QWORD *)v13 = 0;
  *((_QWORD *)v13 + 1) = 0;
  v32 = a1;
  v33 = v13;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_213ED84A4();
  sub_213EF333C();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v32);
    return swift_bridgeObjectRelease();
  }
  else
  {
    LOBYTE(v34) = 0;
    sub_213DB0DB4(&qword_254D3A9E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
    v14 = v9;
    sub_213EF3144();
    v15 = (uint64_t)v30;
    (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v30, v6, v4);
    v36 = 1;
    sub_213ED8570();
    sub_213EF3144();
    v16 = v31;
    v17 = v7;
    *(_BYTE *)(v15 + v31[5]) = v34;
    sub_213EF1E30();
    v36 = 2;
    sub_213DB0DB4(&qword_254D3E8D8, (uint64_t (*)(uint64_t))MEMORY[0x24BEA04E8], MEMORY[0x24BE9F780]);
    sub_213EF3144();
    v18 = (uint64_t)v32;
    *(_QWORD *)(v15 + v16[6]) = v34;
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F04E50);
    v36 = 3;
    sub_213ED85B4(&qword_254D40968, (uint64_t (*)(void))sub_213E62738, MEMORY[0x24BEE12D0]);
    sub_213EF3144();
    *(_QWORD *)(v15 + v16[7]) = v34;
    v36 = 4;
    sub_213E62738();
    sub_213EF3108();
    v19 = (_OWORD *)(v15 + v16[8]);
    v20 = v35;
    *v19 = v34;
    v19[1] = v20;
    v36 = 5;
    sub_213ED861C();
    sub_213EF3108();
    *(_BYTE *)(v15 + v16[9]) = v34;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D3B030);
    v36 = 6;
    sub_213ED8660(&qword_254D40978, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    sub_213EF3144();
    *(_QWORD *)(v15 + v16[10]) = v34;
    LOBYTE(v34) = 7;
    *(_BYTE *)(v15 + v16[11]) = sub_213EF3120() & 1;
    LOBYTE(v34) = 8;
    v21 = sub_213EF30FC();
    v23 = v22;
    (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v29);
    v24 = (uint64_t *)v33;
    swift_bridgeObjectRelease();
    *v24 = v21;
    v24[1] = v23;
    sub_213E32A28(v15, v27);
    __swift_destroy_boxed_opaque_existential_1Tm(v18);
    return sub_213E32A6C(v15);
  }
}

uint64_t sub_213ED8058@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ContactPromptGroundTruth.init(from:)(a1, a2);
}

uint64_t sub_213ED806C(_QWORD *a1)
{
  return ContactPromptGroundTruth.encode(to:)(a1);
}

uint64_t _s28SiriPrivateLearningInference24ContactPromptGroundTruthV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;

  if ((sub_213EF1D28() & 1) == 0)
    return 0;
  v4 = (int *)type metadata accessor for ContactPromptGroundTruth();
  v5 = v4[5];
  v6 = *(unsigned __int8 *)(a1 + v5);
  v7 = *(unsigned __int8 *)(a2 + v5);
  v8 = v6 ? 0x616D7269666E6F63 : 0x6769626D61736964;
  v9 = v6 ? 0xEC0000006E6F6974 : 0xEE006E6F69746175;
  v10 = v7 ? 0x616D7269666E6F63 : 0x6769626D61736964;
  v11 = v7 ? 0xEC0000006E6F6974 : 0xEE006E6F69746175;
  if (v8 == v10 && v9 == v11)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v13 = sub_213EF3234();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v13 & 1) == 0)
      return result;
  }
  sub_213EF32F4();
  if ((unint64_t)UsoEntity_common_Person.convertUSOPersonToString()().value._object)
  {
    sub_213EF330C();
    sub_213EF28BC();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_213EF330C();
  }
  v15 = sub_213EF3330();
  sub_213EF32F4();
  if ((unint64_t)UsoEntity_common_Person.convertUSOPersonToString()().value._object)
  {
    sub_213EF330C();
    sub_213EF28BC();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_213EF330C();
  }
  if (v15 != sub_213EF3330() || (sub_213E287C4(*(_QWORD *)(a1 + v4[7]), *(_QWORD *)(a2 + v4[7])) & 1) == 0)
    return 0;
  v16 = v4[8];
  v17 = *(_QWORD *)(a1 + v16);
  v18 = *(_QWORD *)(a1 + v16 + 8);
  v19 = *(_QWORD *)(a1 + v16 + 24);
  v40 = *(_QWORD *)(a1 + v16 + 16);
  v20 = (uint64_t *)(a2 + v16);
  v22 = *v20;
  v21 = v20[1];
  v24 = v20[2];
  v23 = v20[3];
  if (!v18)
  {
    if (!v21)
      goto LABEL_47;
LABEL_43:
    sub_213E05FBC(v22, v21);
    sub_213DB1874(v17, v18);
    sub_213DB1874(v22, v21);
    return 0;
  }
  if (!v21)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_43;
  }
  if (v17 != v22 || v18 != v21)
  {
    v25 = sub_213EF3234();
    result = 0;
    if ((v25 & 1) == 0)
      return result;
  }
  if (v19)
  {
    if (!v23)
      return 0;
    if (v40 != v24 || v19 != v23)
    {
      v26 = sub_213EF3234();
      result = 0;
      if ((v26 & 1) == 0)
        return result;
    }
  }
  else if (v23)
  {
    return 0;
  }
LABEL_47:
  v27 = v4[9];
  v28 = *(unsigned __int8 *)(a1 + v27);
  v29 = *(unsigned __int8 *)(a2 + v27);
  if (v28 == 2)
  {
    if (v29 == 2)
      goto LABEL_67;
    return 0;
  }
  if (v29 == 2)
    return 0;
  if ((v28 & 1) != 0)
    v30 = 0x6E61624172657375;
  else
    v30 = 0x65746E4972657375;
  if ((v28 & 1) != 0)
    v31 = 0xED000064656E6F64;
  else
    v31 = 0xEE00646574636172;
  if ((v29 & 1) != 0)
    v32 = 0x6E61624172657375;
  else
    v32 = 0x65746E4972657375;
  if ((v29 & 1) != 0)
    v33 = 0xED000064656E6F64;
  else
    v33 = 0xEE00646574636172;
  if (v30 == v32 && v31 == v33)
  {
    swift_bridgeObjectRelease_n();
LABEL_67:
    if ((sub_213E28344(*(_QWORD **)(a1 + v4[10]), *(_QWORD **)(a2 + v4[10])) & 1) != 0
      && *(unsigned __int8 *)(a1 + v4[11]) == *(unsigned __int8 *)(a2 + v4[11]))
    {
      v35 = v4[12];
      v36 = (_QWORD *)(a1 + v35);
      v37 = *(_QWORD *)(a1 + v35 + 8);
      v38 = (_QWORD *)(a2 + v35);
      v39 = v38[1];
      if (v37)
      {
        if (v39 && (*v36 == *v38 && v37 == v39 || (sub_213EF3234() & 1) != 0))
          return 1;
      }
      else if (!v39)
      {
        return 1;
      }
    }
    return 0;
  }
  v34 = sub_213EF3234();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = 0;
  if ((v34 & 1) != 0)
    goto LABEL_67;
  return result;
}

unint64_t sub_213ED84A4()
{
  unint64_t result;

  result = qword_254D40930;
  if (!qword_254D40930)
  {
    result = MEMORY[0x2199C52D4](&unk_213F02B74, &type metadata for ContactPromptGroundTruth.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D40930);
  }
  return result;
}

unint64_t sub_213ED84E8()
{
  unint64_t result;

  result = qword_254D40938;
  if (!qword_254D40938)
  {
    result = MEMORY[0x2199C52D4](&protocol conformance descriptor for ContactPromptGroundTruthType, &type metadata for ContactPromptGroundTruthType);
    atomic_store(result, (unint64_t *)&qword_254D40938);
  }
  return result;
}

unint64_t sub_213ED852C()
{
  unint64_t result;

  result = qword_254D40948;
  if (!qword_254D40948)
  {
    result = MEMORY[0x2199C52D4](&protocol conformance descriptor for ContactPromptInteractionOutcome, &type metadata for ContactPromptInteractionOutcome);
    atomic_store(result, (unint64_t *)&qword_254D40948);
  }
  return result;
}

unint64_t sub_213ED8570()
{
  unint64_t result;

  result = qword_254D40960;
  if (!qword_254D40960)
  {
    result = MEMORY[0x2199C52D4](&protocol conformance descriptor for ContactPromptGroundTruthType, &type metadata for ContactPromptGroundTruthType);
    atomic_store(result, (unint64_t *)&qword_254D40960);
  }
  return result;
}

uint64_t sub_213ED85B4(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F04E50);
    v8 = a2();
    result = MEMORY[0x2199C52D4](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_213ED861C()
{
  unint64_t result;

  result = qword_254D40970;
  if (!qword_254D40970)
  {
    result = MEMORY[0x2199C52D4](&protocol conformance descriptor for ContactPromptInteractionOutcome, &type metadata for ContactPromptInteractionOutcome);
    atomic_store(result, (unint64_t *)&qword_254D40970);
  }
  return result;
}

uint64_t sub_213ED8660(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D3B030);
    v8 = a2;
    result = MEMORY[0x2199C52D4](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_213ED86C4()
{
  unint64_t result;

  result = qword_254D40980;
  if (!qword_254D40980)
  {
    result = MEMORY[0x2199C52D4](&protocol conformance descriptor for ContactPromptGroundTruthType, &type metadata for ContactPromptGroundTruthType);
    atomic_store(result, (unint64_t *)&qword_254D40980);
  }
  return result;
}

unint64_t sub_213ED870C()
{
  unint64_t result;

  result = qword_254D40988;
  if (!qword_254D40988)
  {
    result = MEMORY[0x2199C52D4](&protocol conformance descriptor for ContactPromptInteractionOutcome, &type metadata for ContactPromptInteractionOutcome);
    atomic_store(result, (unint64_t *)&qword_254D40988);
  }
  return result;
}

unint64_t sub_213ED8754()
{
  unint64_t result;

  result = qword_254D40990;
  if (!qword_254D40990)
  {
    result = MEMORY[0x2199C52D4](&protocol conformance descriptor for ContactPromptGroundTruthSource, &type metadata for ContactPromptGroundTruthSource);
    atomic_store(result, (unint64_t *)&qword_254D40990);
  }
  return result;
}

unint64_t sub_213ED879C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D40998;
  if (!qword_254D40998)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D409A0);
    result = MEMORY[0x2199C52D4](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_254D40998);
  }
  return result;
}

uint64_t sub_213ED87E8(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_213DB0DB4(&qword_253F04CA8, (uint64_t (*)(uint64_t))type metadata accessor for ContactPromptGroundTruth, (uint64_t)&protocol conformance descriptor for ContactPromptGroundTruth);
  result = sub_213DB0DB4(&qword_253F04CA0, (uint64_t (*)(uint64_t))type metadata accessor for ContactPromptGroundTruth, (uint64_t)&protocol conformance descriptor for ContactPromptGroundTruth);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

ValueMetadata *type metadata accessor for ContactPromptGroundTruthType()
{
  return &type metadata for ContactPromptGroundTruthType;
}

uint64_t _s28SiriPrivateLearningInference28ContactPromptGroundTruthTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_213ED88A4 + 4 * byte_213F02568[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_213ED88D8 + 4 * byte_213F02563[v4]))();
}

uint64_t sub_213ED88D8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213ED88E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213ED88E8);
  return result;
}

uint64_t sub_213ED88F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x213ED88FCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_213ED8900(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213ED8908(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ContactPromptInteractionOutcome()
{
  return &type metadata for ContactPromptInteractionOutcome;
}

uint64_t storeEnumTagSinglePayload for ContactPromptGroundTruthSource(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_213ED8970 + 4 * byte_213F02572[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_213ED89A4 + 4 * byte_213F0256D[v4]))();
}

uint64_t sub_213ED89A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213ED89AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213ED89B4);
  return result;
}

uint64_t sub_213ED89C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x213ED89C8);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_213ED89CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213ED89D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ContactPromptGroundTruthSource()
{
  return &type metadata for ContactPromptGroundTruthSource;
}

_QWORD *initializeBufferWithCopyOfBuffer for ContactPromptGroundTruth(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_213EF1D64();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    *(_QWORD *)((char *)a1 + v8) = *(_QWORD *)((char *)a2 + v8);
    v9 = a3[8];
    *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
    v10 = (_QWORD *)((char *)a1 + v9);
    v11 = (_QWORD *)((char *)a2 + v9);
    v12 = *(_QWORD *)((char *)a2 + v9 + 8);
    swift_retain();
    swift_bridgeObjectRetain();
    if (v12)
    {
      *v10 = *v11;
      v10[1] = v12;
      v13 = v11[3];
      v10[2] = v11[2];
      v10[3] = v13;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      v15 = *((_OWORD *)v11 + 1);
      *(_OWORD *)v10 = *(_OWORD *)v11;
      *((_OWORD *)v10 + 1) = v15;
    }
    v16 = a3[10];
    *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
    *(_QWORD *)((char *)a1 + v16) = *(_QWORD *)((char *)a2 + v16);
    v17 = a3[12];
    *((_BYTE *)a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
    v18 = (_QWORD *)((char *)a1 + v17);
    v19 = (_QWORD *)((char *)a2 + v17);
    v20 = v19[1];
    *v18 = *v19;
    v18[1] = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for ContactPromptGroundTruth(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_213EF1D64();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_release();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + *(int *)(a2 + 32) + 8))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ContactPromptGroundTruth(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;

  v6 = sub_213EF1D64();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  v11 = *(_QWORD *)(a2 + v8 + 8);
  swift_retain();
  swift_bridgeObjectRetain();
  if (v11)
  {
    *v9 = *v10;
    v9[1] = v11;
    v12 = v10[3];
    v9[2] = v10[2];
    v9[3] = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v13 = *((_OWORD *)v10 + 1);
    *(_OWORD *)v9 = *(_OWORD *)v10;
    *((_OWORD *)v9 + 1) = v13;
  }
  v14 = a3[10];
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  *(_QWORD *)(a1 + v14) = *(_QWORD *)(a2 + v14);
  v15 = a3[12];
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ContactPromptGroundTruth(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;

  v6 = sub_213EF1D64();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = a3[8];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = *(_QWORD *)(a1 + v7 + 8);
  v11 = *(_QWORD *)(a2 + v7 + 8);
  if (v10)
  {
    if (v11)
    {
      *v8 = *v9;
      v8[1] = v9[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v8[2] = v9[2];
      v8[3] = v9[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_213E67008((uint64_t)v8);
      v12 = *((_OWORD *)v9 + 1);
      *(_OWORD *)v8 = *(_OWORD *)v9;
      *((_OWORD *)v8 + 1) = v12;
    }
  }
  else if (v11)
  {
    *v8 = *v9;
    v8[1] = v9[1];
    v8[2] = v9[2];
    v8[3] = v9[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v13 = *((_OWORD *)v9 + 1);
    *(_OWORD *)v8 = *(_OWORD *)v9;
    *((_OWORD *)v8 + 1) = v13;
  }
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  v14 = a3[12];
  v15 = (_QWORD *)(a1 + v14);
  v16 = (_QWORD *)(a2 + v14);
  *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for ContactPromptGroundTruth(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_213EF1D64();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  v9 = (_OWORD *)(a1 + v8);
  v10 = (_OWORD *)(a2 + v8);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = a3[10];
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  *(_QWORD *)(a1 + v12) = *(_QWORD *)(a2 + v12);
  v13 = a3[12];
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  *(_OWORD *)(a1 + v13) = *(_OWORD *)(a2 + v13);
  return a1;
}

uint64_t assignWithTake for ContactPromptGroundTruth(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = sub_213EF1D64();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  swift_release();
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  v8 = a3[8];
  v9 = a1 + v8;
  v10 = a2 + v8;
  if (!*(_QWORD *)(a1 + v8 + 8))
    goto LABEL_5;
  v11 = *(_QWORD *)(v10 + 8);
  if (!v11)
  {
    sub_213E67008(v9);
LABEL_5:
    v13 = *(_OWORD *)(v10 + 16);
    *(_OWORD *)v9 = *(_OWORD *)v10;
    *(_OWORD *)(v9 + 16) = v13;
    goto LABEL_6;
  }
  *(_QWORD *)v9 = *(_QWORD *)v10;
  *(_QWORD *)(v9 + 8) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(v10 + 24);
  *(_QWORD *)(v9 + 16) = *(_QWORD *)(v10 + 16);
  *(_QWORD *)(v9 + 24) = v12;
  swift_bridgeObjectRelease();
LABEL_6:
  v14 = a3[10];
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  *(_QWORD *)(a1 + v14) = *(_QWORD *)(a2 + v14);
  swift_bridgeObjectRelease();
  v15 = a3[12];
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  v16 = (_QWORD *)(a1 + v15);
  v17 = (uint64_t *)(a2 + v15);
  v19 = *v17;
  v18 = v17[1];
  *v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactPromptGroundTruth()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_213ED9024(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_213EF1D64();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for ContactPromptGroundTruth()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_213ED90AC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_213EF1D64();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

uint64_t sub_213ED9124()
{
  uint64_t result;
  unint64_t v1;

  result = sub_213EF1D64();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ContactPromptGroundTruth.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF8)
    goto LABEL_17;
  if (a2 + 8 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 8) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 8;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 8;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 8;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v8 = v6 - 9;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ContactPromptGroundTruth.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_213ED92B0 + 4 * byte_213F0257C[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_213ED92E4 + 4 * byte_213F02577[v4]))();
}

uint64_t sub_213ED92E4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213ED92EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213ED92F4);
  return result;
}

uint64_t sub_213ED9300(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x213ED9308);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_213ED930C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213ED9314(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ContactPromptGroundTruth.CodingKeys()
{
  return &type metadata for ContactPromptGroundTruth.CodingKeys;
}

unint64_t sub_213ED9334()
{
  unint64_t result;

  result = qword_254D409A8;
  if (!qword_254D409A8)
  {
    result = MEMORY[0x2199C52D4](&unk_213F02B4C, &type metadata for ContactPromptGroundTruth.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D409A8);
  }
  return result;
}

unint64_t sub_213ED937C()
{
  unint64_t result;

  result = qword_254D409B0;
  if (!qword_254D409B0)
  {
    result = MEMORY[0x2199C52D4](&unk_213F02ABC, &type metadata for ContactPromptGroundTruth.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D409B0);
  }
  return result;
}

unint64_t sub_213ED93C4()
{
  unint64_t result;

  result = qword_254D409B8;
  if (!qword_254D409B8)
  {
    result = MEMORY[0x2199C52D4](&unk_213F02AE4, &type metadata for ContactPromptGroundTruth.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D409B8);
  }
  return result;
}

uint64_t sub_213ED9408(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_213EF3234() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x795474706D6F7270 && a2 == 0xEA00000000006570 || (sub_213EF3234() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x61746E6F436F7375 && a2 == 0xEF79726575517463 || (sub_213EF3234() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000213F0A580 || (sub_213EF3234() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x64657463656C6573 && a2 == 0xEF746361746E6F43 || (sub_213EF3234() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000213F0A5A0 || (sub_213EF3234() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6767755373756C70 && a2 == 0xEF736E6F69747365 || (sub_213EF3234() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000213F0A5C0 || (sub_213EF3234() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x5474706D6F72705FLL && a2 == 0xEB000000006B7361)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    v6 = sub_213EF3234();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 8;
    else
      return 9;
  }
}

unint64_t sub_213ED9810()
{
  unint64_t result;

  result = qword_254D409C0;
  if (!qword_254D409C0)
  {
    result = MEMORY[0x2199C52D4](&protocol conformance descriptor for ContactPromptGroundTruthSource, &type metadata for ContactPromptGroundTruthSource);
    atomic_store(result, (unint64_t *)&qword_254D409C0);
  }
  return result;
}

unint64_t sub_213ED9854()
{
  unint64_t result;

  result = qword_254D409C8;
  if (!qword_254D409C8)
  {
    result = MEMORY[0x2199C52D4](&protocol conformance descriptor for ContactPromptInteractionOutcome, &type metadata for ContactPromptInteractionOutcome);
    atomic_store(result, (unint64_t *)&qword_254D409C8);
  }
  return result;
}

unint64_t sub_213ED9898()
{
  unint64_t result;

  result = qword_254D409D0;
  if (!qword_254D409D0)
  {
    result = MEMORY[0x2199C52D4](&protocol conformance descriptor for ContactPromptGroundTruthType, &type metadata for ContactPromptGroundTruthType);
    atomic_store(result, (unint64_t *)&qword_254D409D0);
  }
  return result;
}

uint64_t SuccessfulPhoneCallClassification.init(siriStarted:phoneCallEventId:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254D3A860);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_213EF53E0;
  *(_QWORD *)(v8 + 32) = a2;
  *(_QWORD *)(v8 + 40) = a3;
  *(_BYTE *)a4 = a1;
  *(_QWORD *)(a4 + 8) = a2;
  *(_QWORD *)(a4 + 16) = a3;
  *(_QWORD *)(a4 + 24) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a4 + 32) = v8;
  return swift_bridgeObjectRetain();
}

uint64_t SuccessfulPhoneCallClassification.siriStarted.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t SuccessfulPhoneCallClassification.phoneCallEventId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SuccessfulPhoneCallClassification.referencedTurns.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SuccessfulPhoneCallClassification.referencedEvents.getter()
{
  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for SuccessfulPhoneCallClassification()
{
  return &type metadata for SuccessfulPhoneCallClassification;
}

SiriPrivateLearningInference::PlayMediaUserFeedback_optional __swiftcall PlayMediaUserFeedback.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  SiriPrivateLearningInference::PlayMediaUserFeedback_optional result;
  char v5;

  v2 = v1;
  v3 = sub_213EF30D8();
  result.value = swift_bridgeObjectRelease();
  v5 = 8;
  if (v3 < 8)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t PlayMediaUserFeedback.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_213ED9A28 + 4 * a1[*v0]))(0x6E776F6E6B6E75, 0xE700000000000000);
}

uint64_t sub_213ED9A28()
{
  return 0x73736563637573;
}

uint64_t sub_213ED9A3C()
{
  return 0x756C636E6F636E69;
}

uint64_t sub_213ED9A5C()
{
  return 0x7561506B63697571;
}

uint64_t sub_213ED9A78()
{
  return 0x6369755169726973;
}

unint64_t sub_213ED9A9C()
{
  return 0xD000000000000012;
}

void sub_213ED9AF0(char *a1)
{
  sub_213E29F74(*a1);
}

unint64_t sub_213ED9B00()
{
  unint64_t result;

  result = qword_254D409D8;
  if (!qword_254D409D8)
  {
    result = MEMORY[0x2199C52D4](&protocol conformance descriptor for PlayMediaUserFeedback, &type metadata for PlayMediaUserFeedback);
    atomic_store(result, (unint64_t *)&qword_254D409D8);
  }
  return result;
}

void sub_213ED9B44()
{
  char *v0;

  sub_213E2B380(0, *v0);
}

void sub_213ED9B50(uint64_t a1)
{
  char *v1;

  sub_213E2ACB8(a1, *v1);
}

void sub_213ED9B58(uint64_t a1)
{
  char *v1;

  sub_213E2B380(a1, *v1);
}

SiriPrivateLearningInference::PlayMediaUserFeedback_optional sub_213ED9B60(Swift::String *a1)
{
  return PlayMediaUserFeedback.init(rawValue:)(*a1);
}

uint64_t sub_213ED9B6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = PlayMediaUserFeedback.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t storeEnumTagSinglePayload for PlayMediaUserFeedback(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_213ED9BDC + 4 * byte_213F02C4D[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_213ED9C10 + 4 * byte_213F02C48[v4]))();
}

uint64_t sub_213ED9C10(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213ED9C18(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213ED9C20);
  return result;
}

uint64_t sub_213ED9C2C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x213ED9C34);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_213ED9C38(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213ED9C40(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PlayMediaUserFeedback()
{
  return &type metadata for PlayMediaUserFeedback;
}

uint64_t sub_213ED9C5C()
{
  uint64_t result;

  type metadata accessor for MediaEvaluationFramework();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F04CD0);
  sub_213EF288C();
  sub_213EF2904();
  swift_bridgeObjectRelease();
  result = sub_213EF2904();
  qword_254D409E0 = 91;
  *(_QWORD *)algn_254D409E8 = 0xE100000000000000;
  return result;
}

uint64_t MediaEvaluationFramework.__allocating_init(_:)(_QWORD *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  MediaEvaluationFramework.init(_:)(a1);
  return v2;
}

uint64_t MediaEvaluationFramework.init(_:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13[2];

  v2 = v1;
  *(_QWORD *)(v1 + 64) = MEMORY[0x24BEE4AF8];
  v4 = a1[3];
  v5 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v5 + 40))(v13, v4, v5);
  sub_213DB0BF0(v13, v1 + 16);
  v6 = a1[3];
  v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v6);
  (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v7 + 8))(v13, v6, v7);
  type metadata accessor for MediaGroundTruthSummarizer();
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 72) = 0u;
  sub_213DB0BF0(v13, v8 + 16);
  *(_QWORD *)(v2 + 56) = v8;
  v9 = a1[3];
  v10 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v9);
  (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v10 + 32))(v13, v9, v10);
  type metadata accessor for MediaSuggestionManager();
  v11 = swift_allocObject();
  sub_213DB0BF0(v13, v11 + 16);
  *(_QWORD *)(v2 + 72) = v11;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  return v2;
}

uint64_t sub_213ED9E44()
{
  sub_213EDBE4C();
  return swift_bridgeObjectRetain();
}

uint64_t sub_213ED9E58(_QWORD *a1)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint8_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t (*v49)(uint64_t);
  unint64_t v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t (*v53)(uint64_t);
  os_log_type_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  os_log_type_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  BOOL v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  int v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  _QWORD *v85;
  int v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t, uint64_t);
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  char v103;
  uint64_t v104;
  char v105;
  int *v106;
  uint64_t v107;
  _QWORD *v108;
  _QWORD **v109;
  _QWORD *v110;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v112;
  unint64_t v113;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v115;
  _QWORD *v116;
  uint64_t v117;
  BOOL v118;
  _QWORD v120[4];
  __int128 v121;
  _QWORD *v122;
  _QWORD *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char *v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  char *v135;
  char *v136;
  uint64_t v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  __int128 v143;
  __int128 v144;
  _UNKNOWN **v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  __int128 v150;
  uint64_t v151;

  v2 = v1;
  v122 = a1;
  v125 = type metadata accessor for MediaEvaluationSummary();
  MEMORY[0x24BDAC7A8](v125);
  v129 = (uint64_t)v120 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F04828);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (uint64_t)v120 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_213EF1D64();
  v139 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v138 = (char *)v120 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v142 = type metadata accessor for FeaturisedTurn(0);
  v137 = *(_QWORD *)(v142 - 8);
  MEMORY[0x24BDAC7A8](v142);
  v131 = (char *)v120 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v130 = (char *)v120 - v11;
  MEMORY[0x24BDAC7A8](v12);
  v134 = (uint64_t)v120 - v13;
  MEMORY[0x24BDAC7A8](v14);
  v141 = (uint64_t)v120 - v15;
  if (qword_253F04A88 != -1)
    goto LABEL_127;
  while (1)
  {
    v16 = sub_213EF2724();
    v126 = __swift_project_value_buffer(v16, (uint64_t)qword_253F08A00);
    v17 = sub_213EF270C();
    v18 = sub_213EF2C94();
    v19 = os_log_type_enabled(v17, v18);
    v140 = v7;
    if (v19)
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      *(_QWORD *)&v143 = v21;
      *(_DWORD *)v20 = 136315138;
      if (qword_254D3A0B0 != -1)
        swift_once();
      v23 = qword_254D409E0;
      v22 = *(_QWORD *)algn_254D409E8;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v150 = sub_213DB0570(v23, v22, (uint64_t *)&v143);
      sub_213EF2D9C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_213DAB000, v17, v18, "%s: Successful evaluateSession run", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C53C4](v21, -1, -1);
      MEMORY[0x2199C53C4](v20, -1, -1);

      v24 = v140;
    }
    else
    {

      v24 = v7;
    }
    v7 = MEMORY[0x24BEE4AF8];
    v149 = MEMORY[0x24BEE4AF8];
    v25 = v122[2];
    v26 = swift_bridgeObjectRetain();
    v128 = v2;
    v127 = v6;
    if (v25)
    {
      v6 = 0;
      v27 = *(const char **)(v137 + 72);
      v123 = (_QWORD *)((*(unsigned __int8 *)(v137 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v137 + 80));
      v136 = (char *)v123 + v26;
      v28 = &qword_253F06970;
      v135 = "essages.SendMessageIntent";
      v133 = 0x8000000213F04730;
      v132 = v25;
      v124 = v27;
      while (1)
      {
        v29 = v28;
        v30 = v141;
        sub_213DCA7E4((uint64_t)&v136[(_QWORD)v27 * v6], v141, type metadata accessor for FeaturisedTurn);
        v31 = *(_QWORD *)(v30 + *(int *)(v142 + 24));
        v32 = *(_QWORD *)(v31 + 16);
        if (v32)
        {
          v33 = v31 + 32;
          swift_bridgeObjectRetain_n();
          while (1)
          {
            sub_213DAFDFC(v33, (uint64_t)&v150);
            sub_213DAFDFC((uint64_t)&v150, (uint64_t)&v148);
            __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
            sub_213EF2214();
            if (swift_dynamicCast())
              break;
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v150);
            v33 += 40;
            if (!--v32)
            {
              swift_bridgeObjectRelease();
              goto LABEL_19;
            }
          }
          swift_bridgeObjectRelease();
          swift_release();
          sub_213DB0BF0(&v150, (uint64_t)&v143);
          v28 = v29;
        }
        else
        {
          swift_bridgeObjectRetain();
LABEL_19:
          v28 = v29;
          v145 = 0;
          v144 = 0u;
          v143 = 0u;
        }
        sub_213DCC3D8((uint64_t)&v143, (uint64_t)&v150, v28);
        if (!v151)
          break;
        __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
        sub_213EF2214();
        if ((swift_dynamicCast() & 1) == 0)
          goto LABEL_10;
        swift_retain();
        sub_213EF23D0();
        swift_release_n();
        v34 = v150;
        sub_213DAFEC4((uint64_t)&v143, v28);
        swift_bridgeObjectRelease();
        v35 = *(_QWORD *)(v34 + 16);
        if (v35)
        {
          v7 = *(_QWORD *)(v34 + 40);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v36 = sub_213DAFF00();
          swift_bridgeObjectRelease();
          if ((v36 & 1) != 0)
            goto LABEL_25;
          if (v35 != 1)
          {
            v43 = v34 + 56;
            v2 = 1;
            while (1)
            {
              v44 = v2 + 1;
              if (__OFADD__(v2, 1))
              {
LABEL_125:
                __break(1u);
                goto LABEL_126;
              }
              swift_bridgeObjectRetain();
              v7 = sub_213DAFF00();
              swift_bridgeObjectRelease();
              if ((v7 & 1) != 0)
                break;
              ++v2;
              v43 += 16;
              if (v44 == v35)
                goto LABEL_36;
            }
LABEL_25:
            swift_bridgeObjectRelease_n();
            sub_213DBB430(v141, v134, type metadata accessor for FeaturisedTurn);
            v37 = v149;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_213DCD09C(0, *(_QWORD *)(v37 + 16) + 1, 1);
              v37 = v149;
            }
            v38 = v140;
            v25 = v132;
            v28 = v29;
            v40 = *(_QWORD *)(v37 + 16);
            v39 = *(_QWORD *)(v37 + 24);
            if (v40 >= v39 >> 1)
            {
              sub_213DCD09C(v39 > 1, v40 + 1, 1);
              v37 = v149;
            }
            *(_QWORD *)(v37 + 16) = v40 + 1;
            v41 = (char *)v123 + v37;
            v42 = v124;
            sub_213DBB430(v134, (uint64_t)&v41[v40 * (_QWORD)v124], type metadata accessor for FeaturisedTurn);
            v24 = v38;
            v27 = v42;
            goto LABEL_12;
          }
LABEL_36:
          swift_bridgeObjectRelease_n();
          v24 = v140;
          v25 = v132;
          v27 = v124;
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        v28 = v29;
LABEL_11:
        sub_213DCA828(v141, type metadata accessor for FeaturisedTurn);
LABEL_12:
        if (++v6 == v25)
        {
          v7 = v149;
          v2 = v128;
          v6 = v127;
          goto LABEL_39;
        }
      }
      sub_213DAFEC4((uint64_t)&v150, v28);
LABEL_10:
      sub_213DAFEC4((uint64_t)&v143, v28);
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
LABEL_39:
    swift_bridgeObjectRelease();
    v46 = (uint64_t)v131;
    v47 = (uint64_t)v130;
    v136 = *(char **)(v7 + 16);
    if (!v136)
      return swift_release();
    v48 = 0;
    v123 = (_QWORD *)(v2 + 16);
    v122 = (_QWORD *)(v2 + 64);
    v135 = (char *)(v7 + ((*(unsigned __int8 *)(v137 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v137 + 80)));
    v49 = type metadata accessor for FeaturisedTurn;
    *(_QWORD *)&v45 = 136315394;
    v121 = v45;
    v120[3] = MEMORY[0x24BEE4AD8] + 8;
    v50 = (unint64_t)"INSendMessageIntent";
    v2 = v139;
    v134 = v7;
    v124 = "INSendMessageIntent";
    while (1)
    {
      if (v48 >= *(_QWORD *)(v7 + 16))
      {
        __break(1u);
        goto LABEL_125;
      }
      sub_213DCA7E4((uint64_t)&v135[*(_QWORD *)(v137 + 72) * v48], v47, v49);
      v141 = *(int *)(v142 + 24);
      v51 = swift_bridgeObjectRetain();
      sub_213DAEFF4(v51, v6);
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v6, 1, v24) != 1)
        break;
      sub_213DAFEC4(v6, &qword_253F04828);
      if (qword_253F04BB0 != -1)
        swift_once();
      *((_QWORD *)&v144 + 1) = &type metadata for PIMSFatalError;
      v145 = (_UNKNOWN **)sub_213E4D6F0();
      strcpy((char *)&v143, "PIMSFatalError");
      HIBYTE(v143) = -18;
      LOBYTE(v144) = 8;
      sub_213EF210C();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v143);
      sub_213DCA7E4(v47, v46, v49);
      v52 = sub_213EF270C();
      v53 = v49;
      v54 = sub_213EF2C94();
      if (os_log_type_enabled(v52, v54))
      {
        v55 = swift_slowAlloc();
        v56 = swift_slowAlloc();
        *(_QWORD *)&v143 = v56;
        *(_DWORD *)v55 = v121;
        if (qword_254D3A0B0 != -1)
          swift_once();
        v57 = qword_254D409E0;
        v58 = *(_QWORD *)algn_254D409E8;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v55 + 4) = sub_213DB0570(v57, v58, (uint64_t *)&v143);
        swift_bridgeObjectRelease();
        *(_WORD *)(v55 + 12) = 2080;
        v59 = (uint64_t)v131;
        v60 = sub_213EF1D10();
        *(_QWORD *)(v55 + 14) = sub_213DB0570(v60, v61, (uint64_t *)&v143);
        swift_bridgeObjectRelease();
        sub_213DCA828(v59, type metadata accessor for FeaturisedTurn);
        v62 = v54;
        v49 = type metadata accessor for FeaturisedTurn;
        _os_log_impl(&dword_213DAB000, v52, v62, "%s No request id found in the turn with id = %s", (uint8_t *)v55, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2199C53C4](v56, -1, -1);
        v63 = v55;
        v46 = v59;
        MEMORY[0x2199C53C4](v63, -1, -1);

        sub_213DCA828(v47, type metadata accessor for FeaturisedTurn);
        v2 = v139;
        v7 = v134;
      }
      else
      {

        sub_213DCA828(v46, v53);
        sub_213DCA828(v47, v53);
        v49 = v53;
      }
      v24 = v140;
LABEL_43:
      if ((char *)++v48 == v136)
        return swift_release();
    }
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 32))(v138, v6, v24);
    v64 = swift_bridgeObjectRetain();
    v65 = (_QWORD *)sub_213DAFD5C(v64);
    swift_bridgeObjectRelease();
    if (!v65)
    {
      LODWORD(v132) = 0;
      goto LABEL_64;
    }
    v66 = v65[2];
    if (!v66)
      goto LABEL_62;
    v67 = v65[4] == 0x6C7070612E6D6F63 && v65[5] == 0xEF636973754D2E65;
    if (v67 || (sub_213EF3234() & 1) != 0)
    {
      v68 = 1;
      goto LABEL_63;
    }
    if (v66 == 1)
    {
LABEL_62:
      v68 = 0;
LABEL_63:
      LODWORD(v132) = v68;
      swift_bridgeObjectRelease();
LABEL_64:
      v69 = *(_QWORD *)(v47 + *(int *)(v142 + 28));
      v70 = *(_QWORD *)(v69 + 16);
      if (v70)
      {
        v71 = (_QWORD *)(v69 + 64);
        while ((*(v71 - 1) != 0xD000000000000011 || *v71 != (v50 | 0x8000000000000000))
             && (sub_213EF3234() & 1) == 0)
        {
          v71 += 5;
          if (!--v70)
            goto LABEL_70;
        }
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v75 = swift_bridgeObjectRetain();
        sub_213DAEB60(v75, &v143);
        swift_bridgeObjectRelease();
        v74 = *((_QWORD *)&v143 + 1);
        if (*((_QWORD *)&v143 + 1))
        {
          v120[2] = v147;
          v120[1] = v146;
          v76 = v143;
          swift_bridgeObjectRetain();
          v133 = v76;
          sub_213DB8408(v76, v74);
        }
        else
        {
          v133 = 0;
        }
        v77 = swift_bridgeObjectRetain();
        v78 = sub_213DAF3D4(v77);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        if (v78)
        {
          v79 = *(_QWORD *)(v78 + 16);
          if (v79)
          {
            swift_bridgeObjectRetain();
            v80 = (uint64_t *)(v78 + 40);
            v73 = (_QWORD *)MEMORY[0x24BEE4AF8];
            do
            {
              v81 = *(v80 - 1);
              v82 = *v80;
              swift_bridgeObjectRetain();
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v73 = sub_213DB553C(0, v73[2] + 1, 1, v73);
              v84 = v73[2];
              v83 = v73[3];
              if (v84 >= v83 >> 1)
                v73 = sub_213DB553C((_QWORD *)(v83 > 1), v84 + 1, 1, v73);
              v80 += 8;
              v73[2] = v84 + 1;
              v85 = &v73[2 * v84];
              v85[4] = v81;
              v85[5] = v82;
              --v79;
            }
            while (v79);
            swift_bridgeObjectRelease();
          }
          else
          {
            v73 = (_QWORD *)MEMORY[0x24BEE4AF8];
          }
          v47 = (uint64_t)v130;
          swift_bridgeObjectRelease();
          v2 = v139;
        }
        else
        {
          v73 = 0;
          v2 = v139;
          v47 = (uint64_t)v130;
        }
        v72 = v132;
      }
      else
      {
LABEL_70:
        v72 = v132;
        if ((v132 & 1) != 0)
        {
          v47 = (uint64_t)v130;
          if (qword_253F04BB0 != -1)
            swift_once();
          *((_QWORD *)&v144 + 1) = &type metadata for PIMSFatalError;
          v145 = (_UNKNOWN **)sub_213E4D6F0();
          strcpy((char *)&v143, "PIMSFatalError");
          HIBYTE(v143) = -18;
          LOBYTE(v144) = 7;
          sub_213EF210C();
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v143);
          v73 = 0;
          v133 = 0;
          v74 = 0;
        }
        else
        {
          v73 = 0;
          v133 = 0;
          v74 = 0;
          v47 = (uint64_t)v130;
        }
      }
      sub_213EDB2B4(v47, v72, &v143);
      v86 = v143;
      v87 = swift_bridgeObjectRetain();
      v88 = sub_213DAEE7C(v87);
      swift_bridgeObjectRelease();
      if (v88)
      {
        v89 = *(_QWORD *)(v128 + 40);
        v90 = *(_QWORD *)(v128 + 48);
        __swift_project_boxed_opaque_existential_1(v123, v89);
        v91 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v90 + 48);
        v92 = swift_retain();
        v93 = v90;
        v2 = v139;
        v94 = v91(v92, v89, v93);
        swift_release();
      }
      else
      {
        v94 = MEMORY[0x24BEE4AF8];
      }
      v7 = v134;
      sub_213EDBF00(v94, v133, v74, (uint64_t)v73, (uint64_t)&v150);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v86 == 8)
      {
        swift_release();
        sub_213EDC694((uint64_t *)&v150);
        v24 = v140;
        (*(void (**)(char *, uint64_t))(v2 + 8))(v138, v140);
        v49 = type metadata accessor for FeaturisedTurn;
        sub_213DCA828(v47, type metadata accessor for FeaturisedTurn);
        v6 = v127;
      }
      else
      {
        v95 = v140;
        if (v88)
        {
          v96 = v128;
          v97 = swift_retain();
          v141 = sub_213EC1FE4(v97);
          swift_release();
        }
        else
        {
          v141 = MEMORY[0x24BEE4AF8];
          v96 = v128;
        }
        v98 = v129;
        (*(void (**)(uint64_t, char *, uint64_t))(v2 + 16))(v129, v138, v95);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v2 + 56))(v98, 0, 1, v95);
        v99 = *(_QWORD *)(v96 + 72);
        __swift_project_boxed_opaque_existential_1((_QWORD *)(v99 + 16), *(_QWORD *)(v99 + 40));
        if (qword_253F04F18 != -1)
          swift_once();
        v100 = qword_253F04F10;
        v101 = sub_213EF2160();
        *((_QWORD *)&v144 + 1) = v101;
        v145 = (_UNKNOWN **)MEMORY[0x24BEA4C48];
        *(_QWORD *)&v143 = v100;
        swift_retain();
        v102 = sub_213EF2310();
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v143);
        if ((v102 & 1) != 0)
        {
          v103 = 2;
          v104 = v141;
        }
        else
        {
          __swift_project_boxed_opaque_existential_1((_QWORD *)(v99 + 16), *(_QWORD *)(v99 + 40));
          v104 = v141;
          if (qword_253F070D0 != -1)
            swift_once();
          *((_QWORD *)&v144 + 1) = v101;
          v145 = (_UNKNOWN **)MEMORY[0x24BEA4C48];
          *(_QWORD *)&v143 = qword_253F070C0;
          swift_retain();
          v105 = sub_213EF2310();
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v143);
          v103 = v105 & 1;
        }
        v106 = (int *)v125;
        v107 = v129;
        v108 = (_QWORD *)(v129 + *(int *)(v125 + 20));
        *v108 = 0;
        v108[1] = 0;
        sub_213EDC718((uint64_t)&v150, v107 + v106[6]);
        *(_BYTE *)(v107 + v106[7]) = v103;
        *(_BYTE *)(v107 + v106[8]) = v86;
        *(_QWORD *)(v107 + v106[9]) = v104;
        v109 = (_QWORD **)v122;
        swift_beginAccess();
        v110 = *v109;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *v109 = v110;
        v47 = (uint64_t)v130;
        v7 = v134;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v110 = sub_213DB7540(0, v110[2] + 1, 1, v110);
          *v122 = v110;
        }
        v6 = v127;
        v113 = v110[2];
        v112 = v110[3];
        if (v113 >= v112 >> 1)
        {
          v110 = sub_213DB7540((_QWORD *)(v112 > 1), v113 + 1, 1, v110);
          *v122 = v110;
        }
        *((_QWORD *)&v144 + 1) = v125;
        v145 = &off_24D106978;
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v143);
        v115 = v129;
        sub_213DCA7E4(v129, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))type metadata accessor for MediaEvaluationSummary);
        v110[2] = v113 + 1;
        sub_213DB0BF0(&v143, (uint64_t)&v110[5 * v113 + 4]);
        sub_213DCA828(v115, (uint64_t (*)(_QWORD))type metadata accessor for MediaEvaluationSummary);
        swift_endAccess();
        swift_release();
        v2 = v139;
        v24 = v140;
        (*(void (**)(char *, uint64_t))(v139 + 8))(v138, v140);
        v49 = type metadata accessor for FeaturisedTurn;
        sub_213DCA828(v47, type metadata accessor for FeaturisedTurn);
      }
      v46 = (uint64_t)v131;
      v50 = (unint64_t)v124;
      goto LABEL_43;
    }
    v116 = v65 + 7;
    v117 = 1;
    while (1)
    {
      v2 = v117 + 1;
      if (__OFADD__(v117, 1))
        break;
      v118 = *(v116 - 1) == 0x6C7070612E6D6F63 && *v116 == 0xEF636973754D2E65;
      if (v118 || (sub_213EF3234() & 1) != 0)
      {
        v68 = 1;
        v2 = v139;
        goto LABEL_63;
      }
      v68 = 0;
      v116 += 2;
      ++v117;
      v67 = v2 == v66;
      v2 = v139;
      if (v67)
        goto LABEL_63;
    }
LABEL_126:
    __break(1u);
LABEL_127:
    swift_once();
  }
}

void sub_213EDB2B4(uint64_t a1@<X0>, int a2@<W1>, _BYTE *a3@<X8>)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  _BYTE *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  double v35;
  char v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _BYTE *v71;
  uint64_t v72;
  uint64_t v73[2];
  char v74;
  ValueMetadata *v75;
  unint64_t v76;

  LODWORD(v70) = a2;
  v71 = a3;
  v4 = type metadata accessor for FeaturisedTurn(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v68 - v8;
  MEMORY[0x24BDAC7A8](v10);
  v69 = (uint64_t)&v68 - v11;
  MEMORY[0x24BDAC7A8](v12);
  v68 = (uint64_t)&v68 - v13;
  v15 = *(_QWORD *)(a1 + *(int *)(v14 + 28));
  v16 = *(_QWORD *)(v15 + 16);
  if (v16)
  {
    v17 = (_QWORD *)(v15 + 64);
    while (1)
    {
      v18 = *(v17 - 2);
      if (*(v17 - 1) == 0xD000000000000011 && *v17 == 0x8000000213F048C0)
        break;
      if ((sub_213EF3234() & 1) != 0)
        break;
      v17 += 5;
      if (!--v16)
        goto LABEL_7;
    }
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v30 = sub_213DAEB54(v18);
    v32 = v31;
    swift_bridgeObjectRelease();
    if (v32)
    {
      if (v30 == 0x6C7070612E6D6F63 && v32 == 0xEF636973754D2E65)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v33 = sub_213EF3234();
        swift_bridgeObjectRelease();
        if ((v33 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (qword_253F04A88 != -1)
            swift_once();
          v58 = sub_213EF2724();
          __swift_project_value_buffer(v58, (uint64_t)qword_253F08A00);
          v59 = v68;
          sub_213DCA7E4(a1, v68, type metadata accessor for FeaturisedTurn);
          v60 = sub_213EF270C();
          v61 = sub_213EF2C94();
          if (os_log_type_enabled(v60, v61))
          {
            v62 = swift_slowAlloc();
            v63 = swift_slowAlloc();
            v73[0] = v63;
            *(_DWORD *)v62 = 136315394;
            if (qword_254D3A0B0 != -1)
              swift_once();
            v64 = qword_254D409E0;
            v65 = *(_QWORD *)algn_254D409E8;
            swift_bridgeObjectRetain();
            v72 = sub_213DB0570(v64, v65, v73);
            sub_213EF2D9C();
            swift_bridgeObjectRelease();
            *(_WORD *)(v62 + 12) = 2080;
            v66 = sub_213EF1D10();
            v72 = sub_213DB0570(v66, v67, v73);
            sub_213EF2D9C();
            swift_bridgeObjectRelease();
            sub_213DCA828(v59, type metadata accessor for FeaturisedTurn);
            _os_log_impl(&dword_213DAB000, v60, v61, "%s 3rd party media play on turn with id = %s, no evaluation summary will be extracted", (uint8_t *)v62, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x2199C53C4](v63, -1, -1);
            MEMORY[0x2199C53C4](v62, -1, -1);
          }
          else
          {
            sub_213DCA828(v59, type metadata accessor for FeaturisedTurn);
          }

          LOBYTE(v29) = 8;
          goto LABEL_50;
        }
      }
    }
    v34 = swift_bridgeObjectRetain();
    v35 = COERCE_DOUBLE(sub_213DAF5F8(v34));
    v37 = v36;
    swift_bridgeObjectRelease();
    if ((v37 & 1) != 0 || v35 < 30.0)
    {
      if (qword_253F04A88 != -1)
        swift_once();
      v48 = sub_213EF2724();
      __swift_project_value_buffer(v48, (uint64_t)qword_253F08A00);
      sub_213DCA7E4(a1, (uint64_t)v9, type metadata accessor for FeaturisedTurn);
      v49 = sub_213EF270C();
      v50 = sub_213EF2C94();
      if (os_log_type_enabled(v49, v50))
      {
        v51 = swift_slowAlloc();
        v70 = swift_slowAlloc();
        v73[0] = v70;
        *(_DWORD *)v51 = 136315394;
        if (qword_254D3A0B0 != -1)
          swift_once();
        v52 = qword_254D409E0;
        v53 = *(_QWORD *)algn_254D409E8;
        swift_bridgeObjectRetain();
        v72 = sub_213DB0570(v52, v53, v73);
        sub_213EF2D9C();
        swift_bridgeObjectRelease();
        *(_WORD *)(v51 + 12) = 2080;
        v54 = sub_213EF1D10();
        v72 = sub_213DB0570(v54, v55, v73);
        sub_213EF2D9C();
        swift_bridgeObjectRelease();
        sub_213DCA828((uint64_t)v9, type metadata accessor for FeaturisedTurn);
        _os_log_impl(&dword_213DAB000, v49, v50, "%s Short media play detected on turn with id = %s", (uint8_t *)v51, 0x16u);
        v56 = v70;
        swift_arrayDestroy();
        MEMORY[0x2199C53C4](v56, -1, -1);
        MEMORY[0x2199C53C4](v51, -1, -1);
      }
      else
      {
        sub_213DCA828((uint64_t)v9, type metadata accessor for FeaturisedTurn);
      }

      v57 = swift_bridgeObjectRetain();
      sub_213DAFD68(v57, v73);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      v29 = 0x30203030300uLL >> (8 * LOBYTE(v73[0]));
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_253F04A88 != -1)
        swift_once();
      v38 = sub_213EF2724();
      __swift_project_value_buffer(v38, (uint64_t)qword_253F08A00);
      v39 = v69;
      sub_213DCA7E4(a1, v69, type metadata accessor for FeaturisedTurn);
      v40 = sub_213EF270C();
      v41 = sub_213EF2C94();
      if (os_log_type_enabled(v40, v41))
      {
        v42 = swift_slowAlloc();
        v43 = swift_slowAlloc();
        v73[0] = v43;
        *(_DWORD *)v42 = 136315394;
        if (qword_254D3A0B0 != -1)
          swift_once();
        v44 = qword_254D409E0;
        v45 = *(_QWORD *)algn_254D409E8;
        swift_bridgeObjectRetain();
        v72 = sub_213DB0570(v44, v45, v73);
        sub_213EF2D9C();
        swift_bridgeObjectRelease();
        *(_WORD *)(v42 + 12) = 2080;
        v46 = sub_213EF1D10();
        v72 = sub_213DB0570(v46, v47, v73);
        sub_213EF2D9C();
        swift_bridgeObjectRelease();
        sub_213DCA828(v39, type metadata accessor for FeaturisedTurn);
        _os_log_impl(&dword_213DAB000, v40, v41, "%s Successful media play detected on turn with id = %s", (uint8_t *)v42, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2199C53C4](v43, -1, -1);
        MEMORY[0x2199C53C4](v42, -1, -1);
      }
      else
      {
        sub_213DCA828(v39, type metadata accessor for FeaturisedTurn);
      }

      LOBYTE(v29) = 1;
    }
LABEL_50:
    v28 = v71;
    goto LABEL_51;
  }
LABEL_7:
  if (qword_253F04A88 != -1)
    swift_once();
  v19 = sub_213EF2724();
  __swift_project_value_buffer(v19, (uint64_t)qword_253F08A00);
  sub_213DCA7E4(a1, (uint64_t)v6, type metadata accessor for FeaturisedTurn);
  v20 = sub_213EF270C();
  v21 = sub_213EF2C94();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = swift_slowAlloc();
    v23 = swift_slowAlloc();
    v73[0] = v23;
    *(_DWORD *)v22 = 136315394;
    if (qword_254D3A0B0 != -1)
      swift_once();
    v24 = qword_254D409E0;
    v25 = *(_QWORD *)algn_254D409E8;
    swift_bridgeObjectRetain();
    v72 = sub_213DB0570(v24, v25, v73);
    sub_213EF2D9C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2080;
    v26 = sub_213EF1D10();
    v72 = sub_213DB0570(v26, v27, v73);
    sub_213EF2D9C();
    swift_bridgeObjectRelease();
    sub_213DCA828((uint64_t)v6, type metadata accessor for FeaturisedTurn);
    _os_log_impl(&dword_213DAB000, v20, v21, "%s No now playing event found related to the turn with id = %s", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2199C53C4](v23, -1, -1);
    MEMORY[0x2199C53C4](v22, -1, -1);
  }
  else
  {
    sub_213DCA828((uint64_t)v6, type metadata accessor for FeaturisedTurn);
  }

  v28 = v71;
  if ((v70 & 1) != 0)
  {
    if (qword_253F04BB0 != -1)
      swift_once();
    v75 = &type metadata for PIMSFatalError;
    v76 = sub_213E4D6F0();
    strcpy((char *)v73, "PIMSFatalError");
    HIBYTE(v73[1]) = -18;
    v74 = 6;
    sub_213EF210C();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v73);
  }
  LOBYTE(v29) = 8;
LABEL_51:
  *v28 = v29;
}

uint64_t MediaEvaluationFramework.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t MediaEvaluationFramework.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_213EDBE0C(_QWORD *a1)
{
  return sub_213ED9E58(a1);
}

uint64_t sub_213EDBE2C()
{
  sub_213EDBE4C();
  return swift_bridgeObjectRetain();
}

uint64_t sub_213EDBE4C()
{
  uint64_t v0;
  _QWORD v2[2];
  char v3;
  ValueMetadata *v4;
  unint64_t v5;

  if (qword_253F04BB0 != -1)
    swift_once();
  v4 = &type metadata for PIMSProcessingState;
  v5 = sub_213E465F8();
  v2[0] = 0xD000000000000013;
  v2[1] = 0x8000000213F07FB0;
  v3 = 1;
  sub_213EF210C();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v2);
  swift_beginAccess();
  return *(_QWORD *)(v0 + 64);
}

uint64_t sub_213EDBF00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __n128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  void (*v42)(char *, uint64_t, uint64_t, int *, __n128);
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t, int *);
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  BOOL v63;
  uint64_t result;
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
  const char *v75;
  const char *v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  int *v82;
  uint64_t v83;

  v10 = (int *)type metadata accessor for PlusMediaSuggestion();
  v11 = *((_QWORD *)v10 - 1);
  MEMORY[0x24BDAC7A8](v10);
  v67 = (uint64_t)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v80 = (uint64_t)&v65 - v14;
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v65 - v16;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F04B80);
  MEMORY[0x24BDAC7A8](v18);
  v68 = (uint64_t)&v65 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v72 = (uint64_t)&v65 - v21;
  v23 = MEMORY[0x24BDAC7A8](v22);
  v78 = (char *)&v65 - v24;
  v25 = *(_QWORD *)(a1 + 16);
  v69 = v11;
  v71 = a3;
  v70 = a4;
  v73 = a2;
  v74 = a1;
  v79 = v25;
  if (v25)
  {
    v66 = a5;
    v26 = a1 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    v83 = *(_QWORD *)(v11 + 72);
    swift_bridgeObjectRetain();
    v27 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v81 = xmmword_213EF7580;
    v77 = v26;
    v28 = v25;
    v82 = v10;
    do
    {
      sub_213DCA7E4(v26, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for PlusMediaSuggestion);
      v29 = &v17[v10[6]];
      v30 = *(_QWORD *)v29;
      v31 = *((_QWORD *)v29 + 1);
      swift_bridgeObjectRetain();
      v32 = PlusMediaSuggestion.isNominated.getter();
      v33 = *(_QWORD *)&v17[v10[8]];
      v34 = *(_QWORD *)&v17[v10[7]];
      swift_bridgeObjectRetain();
      sub_213DCA828((uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for PlusMediaSuggestion);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v27 = sub_213DB7418(0, v27[2] + 1, 1, v27);
      v36 = v27[2];
      v35 = v27[3];
      if (v36 >= v35 >> 1)
        v27 = sub_213DB7418((_QWORD *)(v35 > 1), v36 + 1, 1, v27);
      v27[2] = v36 + 1;
      v37 = &v27[9 * v36];
      v37[4] = v30;
      v37[5] = v31;
      *((_OWORD *)v37 + 3) = v81;
      v37[8] = 0;
      v37[9] = 0;
      *((_WORD *)v37 + 40) = 770;
      *((_BYTE *)v37 + 82) = v32 & 1;
      v37[11] = v33;
      v37[12] = v34;
      v10 = v82;
      v26 += v83;
      --v28;
    }
    while (v28);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v38 = 0;
    *(_QWORD *)&v81 = "Type_Song";
    v75 = "previouslyNominated";
    v76 = "nominationBlocked";
    v39 = v80;
    do
    {
      sub_213DCA7E4(v77 + v83 * v38, v39, (uint64_t (*)(_QWORD))type metadata accessor for PlusMediaSuggestion);
      v40 = *(_QWORD *)(v39 + v10[11]);
      if (*(_QWORD *)(v40 + 16))
      {
        sub_213EF32F4();
        sub_213EF28BC();
        v41 = sub_213EF3330() & ~(-1 << *(_BYTE *)(v40 + 32));
        if (((*(_QWORD *)(v40 + 56 + ((v41 >> 3) & 0xFFFFFFFFFFFFF8)) >> v41) & 1) != 0)
          __asm { BR              X9 }
      }
      ++v38;
      v39 = v80;
      sub_213DCA828(v80, (uint64_t (*)(_QWORD))type metadata accessor for PlusMediaSuggestion);
      v10 = v82;
    }
    while (v38 != v79);
    swift_bridgeObjectRelease();
    a5 = v66;
    a3 = v71;
    a4 = v70;
    v11 = v69;
  }
  else
  {
    v27 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v42 = *(void (**)(char *, uint64_t, uint64_t, int *, __n128))(v11 + 56);
  v43 = (uint64_t)v78;
  v42(v78, 1, 1, v10, v23);
  v44 = v72;
  sub_213DCC3D8(v43, v72, &qword_253F04B80);
  v45 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v11 + 48);
  LODWORD(v43) = v45(v44, 1, v10);
  sub_213DAFEC4(v44, &qword_253F04B80);
  v46 = (_DWORD)v43 == 1;
  v47 = (uint64_t)v78;
  if (v46)
  {
    if (v79)
    {
      v48 = v68;
      sub_213DCA7E4(v74 + ((*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80)), v68, (uint64_t (*)(_QWORD))type metadata accessor for PlusMediaSuggestion);
      v49 = 0;
    }
    else
    {
      v49 = 1;
      v48 = v68;
    }
    ((void (*)(uint64_t, uint64_t, uint64_t, int *))v42)(v48, v49, 1, v10);
    sub_213EDC7AC(v48, v47);
  }
  if (v45(v47, 1, v10))
  {
    v50 = 0;
    v51 = 0;
    v52 = v73;
  }
  else
  {
    v53 = v47;
    v54 = v67;
    sub_213DCA7E4(v53, v67, (uint64_t (*)(_QWORD))type metadata accessor for PlusMediaSuggestion);
    v55 = (uint64_t *)(v54 + v10[6]);
    v51 = v55[1];
    v83 = *v55;
    v56 = v55[2];
    v57 = v55[3];
    swift_bridgeObjectRetain();
    sub_213DB8518(v56, v57);
    v58 = v54;
    v47 = (uint64_t)v78;
    sub_213DCA828(v58, (uint64_t (*)(_QWORD))type metadata accessor for PlusMediaSuggestion);
    v59 = v56;
    v60 = v57;
    a3 = v71;
    a4 = v70;
    v50 = v83;
    v52 = v73;
    sub_213DB859C(v59, v60);
  }
  v61 = v45(v47, 1, v10);
  v62 = v47;
  v63 = v61 == 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = sub_213DAFEC4(v62, &qword_253F04B80);
  *(_QWORD *)a5 = v27;
  *(_QWORD *)(a5 + 8) = a4;
  *(_QWORD *)(a5 + 16) = v52;
  *(_QWORD *)(a5 + 24) = a3;
  *(_QWORD *)(a5 + 32) = v50;
  *(_QWORD *)(a5 + 40) = v51;
  *(_BYTE *)(a5 + 48) = v63;
  return result;
}

uint64_t *sub_213EDC694(uint64_t *a1)
{
  sub_213EDC6CC(*a1);
  return a1;
}

uint64_t sub_213EDC6CC(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_213EDC718(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_254D409F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for MediaEvaluationFramework()
{
  return objc_opt_self();
}

uint64_t method lookup function for MediaEvaluationFramework()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MediaEvaluationFramework.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of MediaEvaluationFramework.reviewedSessionEvaluation()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of MediaEvaluationFramework.evaluateSession(session:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t sub_213EDC7AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F04B80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t CoreDuetEventCoalescing.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t CoreDuetEventCoalescing.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t CoreDuetEventCoalescing.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t sub_213EDC814@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = a1[1];
  v4 = a1[2];
  v3 = a1[3];
  v5 = a1[4];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v4;
  a2[3] = v3;
  a2[4] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t CoreDuetEventCoalescing.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CoreDuetEventCoalescing()
{
  return objc_opt_self();
}

uint64_t method lookup function for CoreDuetEventCoalescing()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CoreDuetEventCoalescing.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of CoreDuetEventCoalescing.process(_:next:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t destroy for MediaSuggestionEvaluation()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MediaSuggestionEvaluation(uint64_t a1, uint64_t a2)
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
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MediaSuggestionEvaluation(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

uint64_t assignWithTake for MediaSuggestionEvaluation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for MediaSuggestionEvaluation(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 49))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MediaSuggestionEvaluation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 49) = 1;
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
    *(_BYTE *)(result + 49) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MediaSuggestionEvaluation()
{
  return &type metadata for MediaSuggestionEvaluation;
}

uint64_t sub_213EDCAF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 24) + *(_QWORD *)(a3 + 24));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_213E65B1C;
  return v9(a1, a2, a3);
}

uint64_t sub_213EDCB6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 32) + *(_QWORD *)(a2 + 32));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_213E65B6C;
  return v7(a1, a2);
}

uint64_t sub_213EDCBD8()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_213EDCBE0()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    result = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_213EDCCAC(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unsigned int v14;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_DWORD *)(v8 + 80);
  v10 = v6 + v9;
  v11 = (v6 + v9) & ~v9;
  v12 = *(_QWORD *)(v8 + 64) + 7;
  v13 = ((v12 + v11) & 0xFFFFFFFFFFFFFFF8) + 9;
  v14 = v9 | *(_DWORD *)(v5 + 80) & 0xF8;
  if (v14 > 7 || ((*(_DWORD *)(v5 + 80) | *(_DWORD *)(v8 + 80)) & 0x100000) != 0 || v13 > 0x18)
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + (((v14 | 7) + 16) & ~(unint64_t)(v14 | 7)));
  }
  else
  {
    v18 = v7;
    v19 = ~v9;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    v20 = ((unint64_t)a2 + v10) & v19;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))(((unint64_t)a1 + v10) & v19, v20, v18);
    v21 = (v12 + (((unint64_t)a1 + v10) & v19)) & 0xFFFFFFFFFFFFFFF8;
    v22 = (v12 + v20) & 0xFFFFFFFFFFFFFFF8;
    *(_QWORD *)v21 = *(_QWORD *)v22;
    *(_BYTE *)(v21 + 8) = *(_BYTE *)(v22 + 8);
  }
  swift_retain();
  return a1;
}

uint64_t sub_213EDCE0C(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, AssociatedTypeWitness);
  v4 = *(_QWORD *)(v3 + 64) + a1;
  v5 = swift_getAssociatedTypeWitness();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))((v4 + *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80), v5);
  return swift_release();
}

uint64_t sub_213EDCEC4(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = (v6 + v9 + a1) & ~v9;
  v11 = (v6 + v9 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  v12 = *(_QWORD *)(v8 + 64) + 7;
  v13 = (v12 + v10) & 0xFFFFFFFFFFFFFFF8;
  v14 = (v12 + v11) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *(_BYTE *)(v13 + 8) = *(_BYTE *)(v14 + 8);
  swift_retain();
  return a1;
}

uint64_t sub_213EDCFB4(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 24))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = (v6 + v9 + a1) & ~v9;
  v11 = (v6 + v9 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24))(v10, v11, v7);
  v12 = *(_QWORD *)(v8 + 64) + 7;
  v13 = (v12 + v10) & 0xFFFFFFFFFFFFFFF8;
  v14 = (v12 + v11) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v13 = *(_QWORD *)v14;
  swift_retain();
  swift_release();
  *(_BYTE *)(v13 + 8) = *(_BYTE *)(v14 + 8);
  return a1;
}

uint64_t sub_213EDD0B0(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = (v6 + v9 + a1) & ~v9;
  v11 = (v6 + v9 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v10, v11, v7);
  v12 = *(_QWORD *)(v8 + 64) + 7;
  v13 = (v12 + v10) & 0xFFFFFFFFFFFFFFF8;
  v14 = (v12 + v11) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *(_BYTE *)(v13 + 8) = *(_BYTE *)(v14 + 8);
  return a1;
}

uint64_t sub_213EDD19C(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = (v6 + v9 + a1) & ~v9;
  v11 = (v6 + v9 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 40))(v10, v11, v7);
  v12 = *(_QWORD *)(v8 + 64) + 7;
  v13 = (v12 + v10) & 0xFFFFFFFFFFFFFFF8;
  v14 = (v12 + v11) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v13 = *(_QWORD *)v14;
  swift_release();
  *(_BYTE *)(v13 + 8) = *(_BYTE *)(v14 + 8);
  return a1;
}

uint64_t sub_213EDD290(uint64_t a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  unint64_t v22;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(unsigned int *)(v5 + 84);
  v7 = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned int *)(v8 + 84);
  if (v9 <= v6)
    v10 = v6;
  else
    v10 = *(_DWORD *)(v8 + 84);
  if (v10 <= 0x7FFFFFFF)
    v10 = 0x7FFFFFFF;
  if (!a2)
    return 0;
  v11 = v7;
  v12 = *(unsigned __int8 *)(v8 + 80);
  v13 = *(_QWORD *)(v5 + 64) + v12;
  v14 = *(_QWORD *)(v8 + 64) + 7;
  if (v10 < a2)
  {
    v15 = ((v14 + (v13 & ~(_DWORD)v12)) & 0xFFFFFFF8) + 9;
    if (v15 < 4)
      v16 = ((a2 - v10 + 255) >> (8 * v15)) + 1;
    else
      v16 = 2;
    if (v16 >= 0x10000)
      v17 = 4;
    else
      v17 = 2;
    if (v16 < 0x100)
      v17 = 1;
    if (v16 >= 2)
      v18 = v17;
    else
      v18 = 0;
    __asm { BR              X17 }
  }
  if ((_DWORD)v6 == v10)
  {
    v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
    v21 = a1;
    v9 = v6;
    v11 = AssociatedTypeWitness;
    return v20(v21, v9, v11);
  }
  v21 = (v13 + a1) & ~v12;
  if ((_DWORD)v9 == v10)
  {
    v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    return v20(v21, v9, v11);
  }
  v22 = *(_QWORD *)((v14 + v21) & 0xFFFFFFFFFFFFF8);
  if (v22 >= 0xFFFFFFFF)
    LODWORD(v22) = -1;
  return (v22 + 1);
}

void sub_213EDD470(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  size_t v10;
  unsigned int v11;
  int v12;
  int v13;
  unsigned int v14;

  v6 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  if (*(_DWORD *)(v8 + 84) <= v7)
    v9 = v7;
  else
    v9 = *(_DWORD *)(v8 + 84);
  if (v9 <= 0x7FFFFFFF)
    v9 = 0x7FFFFFFF;
  v10 = ((*(_QWORD *)(v8 + 64)
        + 7
        + ((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))) & 0xFFFFFFFFFFFFFFF8)
      + 9;
  if (v9 >= a3)
  {
    v13 = 0;
    if (v9 >= a2)
      goto LABEL_19;
  }
  else
  {
    if (v10 <= 3)
      v11 = ((a3 - v9 + 255) >> (8 * v10)) + 1;
    else
      v11 = 2;
    if (v11 >= 0x10000)
      v12 = 4;
    else
      v12 = 2;
    if (v11 < 0x100)
      v12 = 1;
    if (v11 >= 2)
      v13 = v12;
    else
      v13 = 0;
    if (v9 >= a2)
LABEL_19:
      __asm { BR              X15 }
  }
  if (v10 >= 4)
    v14 = ~v9 + a2;
  else
    v14 = (~(_BYTE)v9 + a2);
  bzero(a1, v10);
  if ((_DWORD)v10 == 1)
    *a1 = v14;
  else
    *(_DWORD *)a1 = v14;
  __asm { BR              X10 }
}

void sub_213EDD604()
{
  uint64_t v0;
  char v1;
  uint64_t v2;

  *(_BYTE *)(v0 + v2) = v1;
  JUMPOUT(0x213EDD69CLL);
}

void sub_213EDD60C()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  *(_DWORD *)(v0 + v2) = 0;
  if (v1)
    JUMPOUT(0x213EDD614);
  JUMPOUT(0x213EDD69CLL);
}

void sub_213EDD664()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;

  *(_WORD *)(v0 + v2) = v1;
  JUMPOUT(0x213EDD69CLL);
}

void sub_213EDD66C()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  *(_DWORD *)(v0 + v2) = v1;
  JUMPOUT(0x213EDD69CLL);
}

uint64_t sub_213EDD674@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_WORD *)(v10 + v14) = 0;
  if (!(_DWORD)v11)
    JUMPOUT(0x213EDD69CLL);
  if ((_DWORD)v13 == v7)
  {
    v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56);
    v4 = v10;
    v5 = v11;
    a1 = v13;
    a2 = v12;
  }
  else
  {
    v4 = (v8 + v10) & v9;
    if ((_DWORD)a1 != v7)
      JUMPOUT(0x213EDD680);
    v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 56);
    v5 = v11;
  }
  return v3(v4, v5, a1, a2);
}

void type metadata accessor for AsyncStreamProcessingSequence.AsyncIterator()
{
  JUMPOUT(0x2199C5244);
}

uint64_t sub_213EDD6C4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_213EDD750(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v13;
  uint64_t v14;

  v4 = a1;
  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v7 = *(_QWORD *)(v5 - 8);
  v8 = *(_DWORD *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (*(_BYTE *)(v6 + 80) | *(_BYTE *)(v7 + 80));
  if (v10 > 7
    || ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v7 + 80)) & 0x100000) != 0
    || (v9 & (unint64_t)~v8) + *(_QWORD *)(v7 + 64) > 0x18)
  {
    v13 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v13 + ((v10 + 16) & ~v10));
    swift_retain();
  }
  else
  {
    v14 = ~v8;
    (*(void (**)(uint64_t *, uint64_t *))(v6 + 16))(a1, a2);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16))(((unint64_t)v4 + v9) & v14, ((unint64_t)a2 + v9) & v14, v5);
  }
  return v4;
}

uint64_t sub_213EDD820(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  (*(void (**)(void))(v4 + 8))();
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 8))((*(_QWORD *)(v4 + 64) + a1 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80));
}

uint64_t sub_213EDD878(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 16))();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 16))((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_213EDD8E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 24))();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 24))((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_213EDD950(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 32))();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 32))((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_213EDD9BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 40))();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_213EDDA28(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  char v13;
  int v14;
  unsigned int v15;
  int v16;
  int v17;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= v5)
    v8 = *(_DWORD *)(v4 + 84);
  else
    v8 = *(_DWORD *)(v6 + 84);
  if (!a2)
    return 0;
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = *(_QWORD *)(v4 + 64) + v9;
  v11 = a2 - v8;
  if (a2 <= v8)
    goto LABEL_23;
  v12 = (v10 & ~v9) + *(_QWORD *)(v6 + 64);
  v13 = 8 * v12;
  if (v12 <= 3)
  {
    v15 = ((v11 + ~(-1 << v13)) >> v13) + 1;
    if (HIWORD(v15))
    {
      v14 = *(_DWORD *)(a1 + v12);
      if (!v14)
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v15 > 0xFF)
    {
      v14 = *(unsigned __int16 *)(a1 + v12);
      if (!*(_WORD *)(a1 + v12))
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v15 < 2)
    {
LABEL_23:
      if (v8)
      {
        if (v5 >= v7)
          return (*(uint64_t (**)(void))(v4 + 48))();
        else
          return (*(uint64_t (**)(uint64_t))(v6 + 48))((v10 + a1) & ~v9);
      }
      return 0;
    }
  }
  v14 = *(unsigned __int8 *)(a1 + v12);
  if (!*(_BYTE *)(a1 + v12))
    goto LABEL_23;
LABEL_14:
  v16 = (v14 - 1) << v13;
  if (v12 > 3)
    v16 = 0;
  if (!(_DWORD)v12)
    return v8 + v16 + 1;
  if (v12 <= 3)
    v17 = (v10 & ~(_DWORD)v9) + *(_DWORD *)(v6 + 64);
  else
    v17 = 4;
  return ((uint64_t (*)(void))((char *)&loc_213EDDB04 + 4 * byte_213F02E9F[v17 - 1]))();
}

void sub_213EDDB80(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84))
    v7 = *(_DWORD *)(v5 + 84);
  else
    v7 = *(_DWORD *)(v6 + 84);
  v8 = ((*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
     + *(_QWORD *)(v6 + 64);
  if (a3 > v7)
  {
    if (v8 <= 3)
    {
      v11 = ((a3 - v7 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v11))
      {
        v9 = 4u;
      }
      else if (v11 >= 0x100)
      {
        v9 = 2;
      }
      else
      {
        v9 = v11 > 1;
      }
    }
    else
    {
      v9 = 1u;
    }
  }
  else
  {
    v9 = 0;
  }
  if (v7 < a2)
  {
    v10 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v12 = v10 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v12;
          *((_BYTE *)a1 + 2) = BYTE2(v12);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v12;
        }
        else
        {
          *(_BYTE *)a1 = v12;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v10;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X16 }
}

void type metadata accessor for AsyncStreamProcessingSequence()
{
  JUMPOUT(0x2199C5244);
}

void sub_213EDDD8C(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __n128 v13;
  _QWORD v14[2];

  v3 = v2;
  v14[1] = a2;
  v5 = a1[2];
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v10 = a1[5];
  v11 = a1[3];
  v12 = swift_getAssociatedTypeWitness();
  v13 = MEMORY[0x24BDAC7A8](v12);
  (*(void (**)(uint64_t, uint64_t, __n128))(v10 + 24))(v11, v10, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v3, v5);
  sub_213EF2B44();
  sub_213EDDF08();
}

void sub_213EDDF08()
{
  type metadata accessor for AsyncStreamProcessingSequence.AsyncIterator();
}

uint64_t sub_213EDDF58(int *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;

  v4 = a1[14];
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  sub_213EF26AC();
  *(_QWORD *)(v1 + v4) = sub_213EF2694();
  *(_BYTE *)(v1 + a1[15]) = 0;
  v5 = swift_checkMetadataState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v1, v2, v5);
  v6 = v1 + a1[13];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32))(v6, v9, AssociatedTypeWitness);
}

uint64_t sub_213EDE068(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  v3[7] = swift_getAssociatedTypeWitness();
  v3[8] = swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3[9] = AssociatedTypeWitness;
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v3[10] = v6;
  v3[11] = *(_QWORD *)(v6 + 64);
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  v3[14] = *(_QWORD *)(a2 + 32);
  v3[15] = *(_QWORD *)(a2 + 16);
  v7 = swift_getAssociatedTypeWitness();
  v3[16] = v7;
  v8 = sub_213EF2D6C();
  v3[17] = v8;
  v3[18] = *(_QWORD *)(v8 - 8);
  v3[19] = swift_task_alloc();
  v3[20] = *(_QWORD *)(v7 - 8);
  v3[21] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_213EDE1D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v5;

  *(_DWORD *)(v0 + 232) = *(_DWORD *)(*(_QWORD *)(v0 + 40) + 56);
  if ((sub_213EF2688() & 1) == 0)
  {
    sub_213EF2664();
    goto LABEL_5;
  }
  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(int *)(v1 + 60);
  *(_DWORD *)(v0 + 236) = v3;
  if ((*(_BYTE *)(v2 + v3) & 1) != 0)
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 80) + 56))(*(_QWORD *)(v0 + 32), 1, 1, *(_QWORD *)(v0 + 72));
LABEL_5:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  *(_DWORD *)(v0 + 240) = *(_DWORD *)(v1 + 52);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 176) = v5;
  *v5 = v0;
  v5[1] = sub_213EDE330;
  return sub_213EF2B20();
}

uint64_t sub_213EDE330()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_213EDE394()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  _QWORD *v14;
  int *v15;
  int *v16;

  v1 = *(_QWORD *)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 128);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3) == 1)
  {
    v4 = *(int *)(v0 + 236);
    v5 = *(_QWORD *)(v0 + 64);
    v6 = *(_QWORD *)(v0 + 48);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 144) + 8))(v1, *(_QWORD *)(v0 + 136));
    *(_BYTE *)(v6 + v4) = 1;
    v7 = *(int **)(v5 + 32);
    v8 = swift_checkMetadataState();
    v15 = (int *)((char *)v7 + *v7);
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v9;
    *v9 = v0;
    v9[1] = sub_213EDE7E0;
    return ((uint64_t (*)(uint64_t, _QWORD))v15)(v8, *(_QWORD *)(v0 + 64));
  }
  else
  {
    v11 = *(_QWORD *)(v0 + 64);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v2 + 32))(*(_QWORD *)(v0 + 168), v1, v3);
    v12 = *(int **)(v11 + 24);
    v13 = swift_checkMetadataState();
    v16 = (int *)((char *)v12 + *v12);
    v14 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v14;
    *v14 = v0;
    v14[1] = sub_213EDE4E4;
    return ((uint64_t (*)(_QWORD, uint64_t, _QWORD))v16)(*(_QWORD *)(v0 + 168), v13, *(_QWORD *)(v0 + 64));
  }
}

uint64_t sub_213EDE4E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 200) = a1;
  *(_QWORD *)(v3 + 208) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_213EDE550()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  _QWORD *v17;

  if (!MEMORY[0x2199C4578](*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 72)))
  {
LABEL_11:
    v15 = *(_QWORD *)(v0 + 160);
    v14 = *(_QWORD *)(v0 + 168);
    v16 = *(_QWORD *)(v0 + 128);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    if ((sub_213EF2688() & 1) != 0)
    {
      if (*(_BYTE *)(*(_QWORD *)(v0 + 48) + *(int *)(v0 + 236)) != 1)
      {
        swift_getAssociatedTypeWitness();
        swift_getAssociatedConformanceWitness();
        v17 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 176) = v17;
        *v17 = v0;
        v17[1] = sub_213EDE330;
        return sub_213EF2B20();
      }
      (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 80) + 56))(*(_QWORD *)(v0 + 32), 1, 1, *(_QWORD *)(v0 + 72));
    }
    else
    {
      sub_213EF2664();
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v1 = 0;
  while (1)
  {
    v2 = sub_213EF2AA8();
    sub_213EF2A6C();
    if ((v2 & 1) != 0)
    {
      (*(void (**)(_QWORD, unint64_t, _QWORD))(*(_QWORD *)(v0 + 80) + 16))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 200)+ ((*(unsigned __int8 *)(*(_QWORD *)(v0 + 80) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v0 + 80) + 80))+ *(_QWORD *)(*(_QWORD *)(v0 + 80) + 72) * v1, *(_QWORD *)(v0 + 72));
      v3 = v1 + 1;
      if (__OFADD__(v1, 1))
        goto LABEL_10;
      goto LABEL_5;
    }
    v8 = *(_QWORD *)(v0 + 88);
    result = sub_213EF2F04();
    if (v8 != 8)
      break;
    v10 = result;
    v11 = *(_QWORD *)(v0 + 104);
    v12 = *(_QWORD *)(v0 + 72);
    v13 = *(_QWORD *)(v0 + 80);
    *(_QWORD *)(v0 + 24) = v10;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v11, v0 + 24, v12);
    swift_unknownObjectRelease();
    v3 = v1 + 1;
    if (__OFADD__(v1, 1))
    {
LABEL_10:
      __break(1u);
      goto LABEL_11;
    }
LABEL_5:
    v4 = *(_QWORD *)(v0 + 200);
    v5 = *(_QWORD *)(v0 + 104);
    v6 = *(_QWORD *)(v0 + 72);
    v7 = *(_QWORD *)(v0 + 80);
    sub_213EF2670();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
    ++v1;
    if (v3 == MEMORY[0x2199C4578](v4, v6))
      goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_213EDE7E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 224) = a1;
  swift_task_dealloc();
  if (!v1)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_213EDE888()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (!MEMORY[0x2199C4578](*(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 72)))
  {
LABEL_11:
    swift_bridgeObjectRelease();
    sub_213EF2664();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v1 = 0;
  while (1)
  {
    v2 = sub_213EF2AA8();
    sub_213EF2A6C();
    if ((v2 & 1) != 0)
    {
      (*(void (**)(_QWORD, unint64_t, _QWORD))(*(_QWORD *)(v0 + 80) + 16))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 224)+ ((*(unsigned __int8 *)(*(_QWORD *)(v0 + 80) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v0 + 80) + 80))+ *(_QWORD *)(*(_QWORD *)(v0 + 80) + 72) * v1, *(_QWORD *)(v0 + 72));
      v3 = v1 + 1;
      if (__OFADD__(v1, 1))
        goto LABEL_10;
      goto LABEL_5;
    }
    v8 = *(_QWORD *)(v0 + 88);
    result = sub_213EF2F04();
    if (v8 != 8)
      break;
    v10 = result;
    v11 = *(_QWORD *)(v0 + 96);
    v12 = *(_QWORD *)(v0 + 72);
    v13 = *(_QWORD *)(v0 + 80);
    *(_QWORD *)(v0 + 16) = v10;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v11, v0 + 16, v12);
    swift_unknownObjectRelease();
    v3 = v1 + 1;
    if (__OFADD__(v1, 1))
    {
LABEL_10:
      __break(1u);
      goto LABEL_11;
    }
LABEL_5:
    v4 = *(_QWORD *)(v0 + 224);
    v5 = *(_QWORD *)(v0 + 96);
    v6 = *(_QWORD *)(v0 + 72);
    v7 = *(_QWORD *)(v0 + 80);
    sub_213EF2670();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
    ++v1;
    if (v3 == MEMORY[0x2199C4578](v4, v6))
      goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_213EDEA28()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213EDEA84()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 160) + 8))(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 128));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213EDEAF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_213E4141C;
  return sub_213EDE068(a1, a2);
}

void sub_213EDEB50()
{
  JUMPOUT(0x2199C52D4);
}

void sub_213EDEB60(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  sub_213EDDD8C(a1, a2);
}

uint64_t sub_213EDEB74()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 8))(v1, v0);
}

uint64_t sub_213EDEB90()
{
  uint64_t v0;
  uint64_t result;

  v0 = sub_213E1BC20((uint64_t)&unk_24D1004F0);
  result = swift_arrayDestroy();
  qword_254D40B20 = v0;
  return result;
}

uint64_t PhoneCallContactPartialRepetitionDefinition.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  PhoneCallContactPartialRepetitionDefinition.init()();
  return v0;
}

uint64_t PhoneCallContactPartialRepetitionDefinition.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0;
  type metadata accessor for PhoneCallContactPartialRepetitionDefinition();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D40B28);
  sub_213EF288C();
  sub_213EF2904();
  swift_bridgeObjectRelease();
  sub_213EF2904();
  *(_QWORD *)(v0 + 16) = 91;
  *(_QWORD *)(v0 + 24) = 0xE100000000000000;
  __swift_instantiateConcreteTypeFromMangledName(qword_253F04FB0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_213EF53E0;
  type metadata accessor for EntityPromptClassifier();
  v3 = swift_allocObject();
  *(_QWORD *)(v2 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_253F06E48);
  *(_QWORD *)(v2 + 64) = &off_24D106F78;
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v1 + 32) = v2;
  return v1;
}

uint64_t type metadata accessor for PhoneCallContactPartialRepetitionDefinition()
{
  return objc_opt_self();
}

uint64_t sub_213EDED14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253F04EC0);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_213EF53E0;
  if (qword_254D3A0B8 != -1)
    swift_once();
  v1 = qword_254D40B20;
  v2 = type metadata accessor for ContactEntityUtteranceComparator();
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 32) = v1;
  *(_QWORD *)(v3 + 16) = 0x3FE6666666666666;
  *(_BYTE *)(v3 + 24) = 0;
  *(_QWORD *)(v0 + 56) = v2;
  *(_QWORD *)(v0 + 64) = &protocol witness table for ContactEntityUtteranceComparator;
  *(_QWORD *)(v0 + 32) = v3;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_213EDEDD4()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(qword_253F04FB0);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_213EF53E0;
  type metadata accessor for SuccessfulPhoneCallClassifier();
  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = 0x4014000000000000;
  *(_QWORD *)(v0 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40B30);
  *(_QWORD *)(v0 + 64) = &off_24D106F78;
  *(_QWORD *)(v0 + 32) = v1;
  return v0;
}

uint64_t PhoneCallContactPartialRepetitionDefinition.supportingClassifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_213EDEE5C()
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t sub_213EDEE68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  uint64_t *v17;
  _QWORD *v18;
  uint64_t v20;

  v8 = *a3;
  v9 = a3[1];
  v10 = a3[2];
  v11 = a3[3];
  v13 = *a4;
  v12 = a4[1];
  v14 = a4[3];
  v20 = a4[2];
  v15 = sub_213EF1D64();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(a5, a1, v15);
  v16 = (int *)type metadata accessor for PhoneCallGroundTruth();
  *(_BYTE *)(a5 + v16[5]) = 2;
  *(_QWORD *)(a5 + v16[6]) = a2;
  v17 = (uint64_t *)(a5 + v16[7]);
  *v17 = v8;
  v17[1] = v9;
  v17[2] = v10;
  v17[3] = v11;
  v18 = (_QWORD *)(a5 + v16[8]);
  *v18 = v13;
  v18[1] = v12;
  v18[2] = v20;
  v18[3] = v14;
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(*((_QWORD *)v16 - 1) + 56))(a5, 0, 1, v16);
  swift_retain();
  sub_213E05FBC(v8, v9);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_213EDEF70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_213EDF268(a1, a2);
}

uint64_t PhoneCallContactPartialRepetitionDefinition.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PhoneCallContactPartialRepetitionDefinition.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_213EDEFC8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  uint64_t *v17;
  _QWORD *v18;
  uint64_t v20;

  v7 = *a2;
  v8 = *a3;
  v9 = a3[1];
  v10 = a3[2];
  v11 = a3[3];
  v13 = *a4;
  v12 = a4[1];
  v14 = a4[3];
  v20 = a4[2];
  v15 = sub_213EF1D64();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(a5, a1, v15);
  v16 = (int *)type metadata accessor for PhoneCallGroundTruth();
  *(_BYTE *)(a5 + v16[5]) = 2;
  *(_QWORD *)(a5 + v16[6]) = v7;
  v17 = (uint64_t *)(a5 + v16[7]);
  *v17 = v8;
  v17[1] = v9;
  v17[2] = v10;
  v17[3] = v11;
  v18 = (_QWORD *)(a5 + v16[8]);
  *v18 = v13;
  v18[1] = v12;
  v18[2] = v20;
  v18[3] = v14;
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(*((_QWORD *)v16 - 1) + 56))(a5, 0, 1, v16);
  swift_retain();
  sub_213E05FBC(v8, v9);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_213EDF0CC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[5];
  _BYTE v11[40];
  _BYTE v12[40];

  v1 = *a1;
  v2 = *(_QWORD *)(*a1 + 16);
  if (v2)
  {
    v4 = v2 - 1;
    v5 = type metadata accessor for FeaturisedTurn(0);
    v6 = *(_QWORD *)(v1
                   + ((*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80))
                   + *(_QWORD *)(*(_QWORD *)(v5 - 8) + 72) * v4
                   + *(int *)(v5 + 24));
    v7 = *(_QWORD *)(v6 + 16);
    if (!v7)
    {
LABEL_8:
      swift_bridgeObjectRetain();
      return sub_213EB3304(1, v1);
    }
    v8 = v6 + 32;
    swift_bridgeObjectRetain_n();
    while (1)
    {
      sub_213DAFDFC(v8, (uint64_t)v12);
      sub_213DAFDFC((uint64_t)v12, (uint64_t)v11);
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
      type metadata accessor for USOTaskSummaryFeature();
      if (swift_dynamicCast())
      {
        swift_release();
        sub_213DAFDFC((uint64_t)v12, (uint64_t)v11);
        goto LABEL_11;
      }
      sub_213DAFDFC((uint64_t)v12, (uint64_t)v11);
      sub_213DAFDFC((uint64_t)v11, (uint64_t)v10);
      sub_213EF24D8();
      if ((swift_dynamicCast() & 1) != 0)
        break;
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v11);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
      v8 += 40;
      if (!--v7)
      {
        swift_bridgeObjectRelease_n();
        v1 = *a1;
        goto LABEL_8;
      }
    }
    swift_release();
LABEL_11:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v11);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
    swift_bridgeObjectRelease_n();
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_213EDF268(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FeaturisedSession(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_213EDF2AC(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_213DB196C(&qword_254D40B38, a2, (uint64_t (*)(uint64_t))type metadata accessor for PhoneCallContactPartialRepetitionDefinition, (uint64_t)&protocol conformance descriptor for PhoneCallContactPartialRepetitionDefinition);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t method lookup function for PhoneCallContactPartialRepetitionDefinition()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhoneCallContactPartialRepetitionDefinition.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of PhoneCallContactPartialRepetitionDefinition.turnComparators.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of PhoneCallContactPartialRepetitionDefinition.successClassifiers.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of PhoneCallContactPartialRepetitionDefinition.maximumTimeBetweenRestatements.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of PhoneCallContactPartialRepetitionDefinition.turnLimit.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of PhoneCallContactPartialRepetitionDefinition.identifySuccessClassification(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of PhoneCallContactPartialRepetitionDefinition.isInitiatingSiriTurn(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of PhoneCallContactPartialRepetitionDefinition.isInitiatingEvent(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of PhoneCallContactPartialRepetitionDefinition.buildGroundTruth(id:usoEntity:originalReference:correctedReference:metadata:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of PhoneCallContactPartialRepetitionDefinition.extractReferencedEntity(session:successClassification:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of PhoneCallContactPartialRepetitionDefinition.extractReferencedEntity(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of PhoneCallContactPartialRepetitionDefinition.extractUsoEntity(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of PhoneCallContactPartialRepetitionDefinition.dropIgnorableTurns(session:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of PhoneCallContactPartialRepetitionDefinition.doesSessionHaveOutOfScopeEntityPromptClassification(classifications:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of PhoneCallContactPartialRepetitionDefinition.isValidSession(session:classifications:isComposite:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of PhoneCallContactPartialRepetitionDefinition.preProcessSession(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

_QWORD *sub_213EDF3B0(uint64_t a1)
{
  _QWORD *result;
  int v3;
  char v4;
  uint64_t v5;

  result = (_QWORD *)sub_213EA6F20(a1);
  if ((v4 & 1) != 0)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == (_QWORD *)(1 << *(_BYTE *)(a1 + 32)))
    return 0;
  else
    return sub_213EE1EE0(&v5, (uint64_t)result, v3, 0, a1);
}

_QWORD *sub_213EDF438@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *result;
  int v5;
  char v6;
  uint64_t v7;
  __int128 v8;

  result = (_QWORD *)sub_213EA6F20(a1);
  if ((v6 & 1) != 0)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 36) != v5)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == (_QWORD *)(1 << *(_BYTE *)(a1 + 32)))
  {
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  else
  {
    result = sub_213EE1F74(&v8, (uint64_t)result, v5, 0, a1);
    *(_QWORD *)a2 = result;
    *(_QWORD *)(a2 + 8) = v7;
    *(_OWORD *)(a2 + 16) = v8;
  }
  return result;
}

BOOL sub_213EDF4CC(unsigned __int8 a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 result;
  uint64_t v10;
  unint64_t v11;
  int v12;

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  v3 = a1;
  sub_213EF32F4();
  sub_213EF3300();
  v4 = sub_213EF3330();
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = v4 & ~v5;
  v7 = a2 + 56;
  if (((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
    return 0;
  v8 = *(_QWORD *)(a2 + 48);
  if (*(unsigned __int8 *)(v8 + v6) == v3)
    return 1;
  v10 = ~v5;
  v11 = (v6 + 1) & v10;
  if (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
    return 0;
  do
  {
    v12 = *(unsigned __int8 *)(v8 + v11);
    result = v12 == v3;
    if (v12 == v3)
      break;
    v11 = (v11 + 1) & v10;
  }
  while (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

uint64_t sub_213EDF5B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  BOOL v25;
  uint64_t v26;
  unint64_t i;
  uint64_t v28;
  _QWORD *v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;

  v4 = swift_allocObject();
  v5 = *(_QWORD *)(a1 + 64);
  v32 = a1 + 64;
  *(_QWORD *)(v4 + 16) = a2;
  v6 = 1 << *(_BYTE *)(a1 + 32);
  if (v6 < 64)
    v7 = ~(-1 << v6);
  else
    v7 = -1;
  v8 = v7 & v5;
  v33 = (unint64_t)(v6 + 63) >> 6;
  v35 = a2 + 56;
  swift_bridgeObjectRetain();
  v34 = a1;
  result = swift_bridgeObjectRetain();
  v10 = 0;
  while (1)
  {
    while (v8)
    {
      v11 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v12 = v11 | (v10 << 6);
      if (*(_QWORD *)(a2 + 16))
        goto LABEL_24;
    }
    v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_43;
    }
    if (v13 >= v33)
      goto LABEL_41;
    v14 = *(_QWORD *)(v32 + 8 * v13);
    ++v10;
    if (!v14)
    {
      v10 = v13 + 1;
      if (v13 + 1 >= v33)
        goto LABEL_41;
      v14 = *(_QWORD *)(v32 + 8 * v10);
      if (!v14)
      {
        v10 = v13 + 2;
        if (v13 + 2 >= v33)
          goto LABEL_41;
        v14 = *(_QWORD *)(v32 + 8 * v10);
        if (!v14)
        {
          v10 = v13 + 3;
          if (v13 + 3 >= v33)
            goto LABEL_41;
          v14 = *(_QWORD *)(v32 + 8 * v10);
          if (!v14)
          {
            v15 = v13 + 4;
            if (v15 >= v33)
            {
LABEL_41:
              swift_release();
              v31 = 0;
              goto LABEL_39;
            }
            v14 = *(_QWORD *)(v32 + 8 * v15);
            v10 = v15;
            if (!v14)
              break;
          }
        }
      }
    }
LABEL_23:
    v8 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v10 << 6);
    if (*(_QWORD *)(a2 + 16))
    {
LABEL_24:
      v16 = (uint64_t *)(*(_QWORD *)(v34 + 48) + 16 * v12);
      v18 = *v16;
      v17 = v16[1];
      sub_213EF32F4();
      swift_bridgeObjectRetain();
      sub_213EF28BC();
      v19 = sub_213EF3330();
      v20 = a2;
      v21 = -1 << *(_BYTE *)(a2 + 32);
      v22 = v19 & ~v21;
      if (((*(_QWORD *)(v35 + ((v22 >> 3) & 0xFFFFFFFFFFFFF8)) >> v22) & 1) != 0)
      {
        v23 = *(_QWORD *)(a2 + 48);
        v24 = (_QWORD *)(v23 + 16 * v22);
        v25 = *v24 == v18 && v24[1] == v17;
        if (v25 || (sub_213EF3234() & 1) != 0)
        {
LABEL_38:
          swift_release();
          swift_bridgeObjectRelease();
          v31 = 1;
LABEL_39:
          swift_bridgeObjectRelease();
          swift_release();
          return v31;
        }
        v26 = ~v21;
        for (i = v22 + 1; ; i = v28 + 1)
        {
          v28 = i & v26;
          if (((*(_QWORD *)(v35 + (((i & v26) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v26)) & 1) == 0)
            break;
          v29 = (_QWORD *)(v23 + 16 * v28);
          v30 = *v29 == v18 && v29[1] == v17;
          if (v30 || (sub_213EF3234() & 1) != 0)
            goto LABEL_38;
        }
      }
      result = swift_bridgeObjectRelease();
      a2 = v20;
    }
  }
  while (1)
  {
    v10 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v10 >= v33)
      goto LABEL_41;
    v14 = *(_QWORD *)(v32 + 8 * v10);
    ++v15;
    if (v14)
      goto LABEL_23;
  }
LABEL_43:
  __break(1u);
  return result;
}

_QWORD *ReformulationSpecializationClassifier.__allocating_init()()
{
  _QWORD *v0;
  uint64_t v1;

  v0 = (_QWORD *)swift_allocObject();
  v0[2] = MEMORY[0x24BEE4AF8];
  v0[3] = &unk_24D100718;
  v1 = sub_213E1BC20((uint64_t)&unk_24D100778);
  swift_arrayDestroy();
  v0[4] = v1;
  return v0;
}

uint64_t SlotBasedTurnComparison.__allocating_init(_:)(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

uint64_t SlotBasedTurnComparison.init(_:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

BOOL sub_213EDF98C()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)(v0 + 16) + 16) != 0;
}

uint64_t SlotBasedTurnComparison.followUpTurnTypes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t static SlotBasedTurnComparison.== infix(_:_:)()
{
  return 1;
}

uint64_t SlotBasedTurnComparison.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SlotBasedTurnComparison.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

BOOL sub_213EDF9F0()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 16) + 16) != 0;
}

uint64_t sub_213EDFA08()
{
  uint64_t result;

  type metadata accessor for ReformulationSpecializationClassifier();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D3BDD0);
  sub_213EF288C();
  sub_213EF2904();
  swift_bridgeObjectRelease();
  result = sub_213EF2904();
  qword_254D40D18 = 91;
  unk_254D40D20 = 0xE100000000000000;
  return result;
}

_QWORD *ReformulationSpecializationClassifier.init()()
{
  _QWORD *v0;
  uint64_t v1;

  v0[2] = MEMORY[0x24BEE4AF8];
  v0[3] = &unk_24D100718;
  v1 = sub_213E1BC20((uint64_t)&unk_24D100778);
  swift_arrayDestroy();
  v0[4] = v1;
  return v0;
}

uint64_t sub_213EDFAEC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v5;
  _QWORD *v6;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  ValueMetadata *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  ValueMetadata *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  uint64_t v29;
  int v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t (*v37)(uint64_t);
  int v38;
  uint64_t v39;
  _BYTE *v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
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
  unsigned __int8 v66;
  __int128 v67;
  _QWORD v68[4];
  uint64_t (*v69)(uint64_t);
  uint64_t v70;
  __int128 v71;
  uint64_t v72;
  ValueMetadata *v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;

  v3 = v2;
  if (!*(_QWORD *)(a1[6] + 16))
  {
    v51 = a1[6];
    v13 = *a1;
    v12 = a1[1];
    v14 = a1[2];
    v15 = (ValueMetadata *)a1[3];
    v17 = a1[4];
    v16 = a1[5];
    v18 = a1[7];
    v19 = a1[8];
    v67 = xmmword_213EF9F30;
    v68[0] = sub_213EE2724;
    v68[1] = v3;
    v68[2] = sub_213EE2744;
    v68[3] = v3;
    v69 = sub_213EE2764;
    v70 = v3;
    swift_retain_n();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    *(_QWORD *)&v71 = v13;
    *((_QWORD *)&v71 + 1) = v12;
    v50 = v12;
    v20 = v14;
    v72 = v14;
    v73 = v15;
    v74 = v17;
    v75 = v16;
    v76 = v51;
    v77 = v18;
    v48 = v18;
    v46 = v19;
    v78 = v19;
    sub_213EE0B4C(&v71, (uint64_t)&v59);
    swift_release();
    LODWORD(v18) = v66;
    sub_213EE2784(v59, v60, v61, v62, v63, v64, v65, v66);
    v45 = a2;
    if ((_DWORD)v18 != 255)
    {
      v21 = v51;
      v22 = v16;
      v23 = v17;
      v24 = v15;
      v25 = v14;
      v26 = v50;
      v27 = v13;
      v28 = sub_213EE2724;
      a2 = v48;
      v29 = v46;
LABEL_12:
      *(_QWORD *)&v71 = v27;
      *((_QWORD *)&v71 + 1) = v26;
      v72 = v25;
      v73 = v24;
      v74 = v23;
      v75 = v22;
      v76 = v21;
      v77 = a2;
      v78 = v29;
      swift_retain();
      ((void (*)(__int128 *__return_ptr, __int128 *))v28)(&v53, &v71);
      result = swift_release();
      v32 = v57;
      if (v57 == 255)
      {
        __break(1u);
        return result;
      }
      v52 = v53;
      v47 = v55;
      v49 = v54;
      v33 = v56;
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D40D28);
      swift_arrayDestroy();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      v35 = v47;
      v34 = v49;
      v36 = v52;
      a2 = v45;
LABEL_14:
      *(_OWORD *)a2 = v36;
      *(_OWORD *)(a2 + 16) = v34;
      *(_OWORD *)(a2 + 32) = v35;
      *(_QWORD *)(a2 + 48) = v33;
      *(_BYTE *)(a2 + 56) = v32;
      return result;
    }
    swift_retain();
    *(_QWORD *)&v71 = v13;
    *((_QWORD *)&v71 + 1) = v50;
    v72 = v14;
    v73 = v15;
    v74 = v17;
    v75 = v16;
    v76 = v51;
    v77 = v48;
    v78 = v19;
    sub_213EE05BC((uint64_t)&v71, (uint64_t)&v59);
    swift_release();
    v30 = v66;
    sub_213EE2784(v59, v60, v61, v62, v63, v64, v65, v66);
    if (v30 == 255)
    {
      v37 = v69;
      *(_QWORD *)&v53 = v13;
      *((_QWORD *)&v53 + 1) = v50;
      *(_QWORD *)&v54 = v20;
      *((_QWORD *)&v54 + 1) = v15;
      *(_QWORD *)&v55 = v17;
      *((_QWORD *)&v55 + 1) = v16;
      v56 = v51;
      v57 = v48;
      v58 = v19;
      swift_retain();
      ((void (*)(uint64_t *__return_ptr, __int128 *))v37)(&v59, &v53);
      swift_release();
      v38 = v66;
      sub_213EE2784(v59, v60, v61, v62, v63, v64, v65, v66);
      if (v38 == 255)
        goto LABEL_18;
      v29 = v19;
      a2 = v48;
      v22 = v16;
      v23 = v17;
      v24 = v15;
      v25 = v20;
      v26 = v50;
      v27 = v13;
      v31 = 2;
      if ((unint64_t)v67 > 2)
        goto LABEL_11;
    }
    else
    {
      v29 = v19;
      a2 = v48;
      v22 = v16;
      v23 = v17;
      v24 = v15;
      v25 = v14;
      v26 = v50;
      v27 = v13;
      v31 = 1;
      if ((unint64_t)v67 > 1)
      {
LABEL_11:
        v21 = v51;
        v28 = (uint64_t (*)(uint64_t))v68[2 * v31];
        goto LABEL_12;
      }
    }
    __break(1u);
LABEL_18:
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D40D28);
    swift_arrayDestroy();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    result = *(_QWORD *)(v3 + 16);
    v39 = *(_QWORD *)(result + 16);
    v36 = 0uLL;
    if (v39)
    {
      v40 = (_BYTE *)(swift_bridgeObjectRetain() + 48);
      do
      {
        v41 = *((_QWORD *)v40 - 2);
        v42 = *((_QWORD *)v40 - 1);
        v43 = *v40;
        v44 = qword_253F04BB0;
        swift_bridgeObjectRetain();
        if (v44 != -1)
          swift_once();
        v40 += 24;
        v73 = &type metadata for PIMSConstraintMismatch;
        v74 = sub_213DE48B4();
        *(_QWORD *)&v71 = v41;
        *((_QWORD *)&v71 + 1) = v42;
        LOBYTE(v72) = v43;
        sub_213EF210C();
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v71);
        --v39;
      }
      while (v39);
      result = swift_bridgeObjectRelease();
      v33 = 0;
      v32 = -1;
      v34 = 0uLL;
      v35 = 0uLL;
      v36 = 0uLL;
    }
    else
    {
      v33 = 0;
      v32 = -1;
      v34 = 0uLL;
      v35 = 0uLL;
    }
    goto LABEL_14;
  }
  v5 = (_QWORD *)(v2 + 16);
  swift_beginAccess();
  v6 = *(_QWORD **)(v3 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v3 + 16) = v6;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v6 = sub_213DB7170(0, v6[2] + 1, 1, v6);
    *v5 = v6;
  }
  v9 = v6[2];
  v8 = v6[3];
  if (v9 >= v8 >> 1)
  {
    v6 = sub_213DB7170((_QWORD *)(v8 > 1), v9 + 1, 1, v6);
    *v5 = v6;
  }
  v6[2] = v9 + 1;
  v10 = &v6[3 * v9];
  v10[4] = 0xD000000000000016;
  v10[5] = 0x8000000213F06090;
  *((_BYTE *)v10 + 48) = 27;
  result = swift_endAccess();
  *(_QWORD *)(a2 + 48) = 0;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_BYTE *)(a2 + 56) = -1;
  return result;
}

uint64_t sub_213EE00E0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_OWORD *))
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[4];
  uint64_t v8;

  v3 = *(_QWORD *)(a1 + 64);
  v4 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v4;
  v5 = *(_OWORD *)(a1 + 48);
  v7[2] = *(_OWORD *)(a1 + 32);
  v7[3] = v5;
  v8 = v3;
  return a3(v7);
}

double sub_213EE0124@<D0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  _QWORD *v4;
  _QWORD *v5;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  char v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  double result;
  _QWORD *v31;
  _QWORD *v32;
  char v33;
  unint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  char v39;
  unint64_t v40;
  unint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46[2];
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;

  if (*(_QWORD *)(*((_QWORD *)a1 + 3) + 16))
  {
    v4 = (_QWORD *)(v2 + 16);
    swift_beginAccess();
    v5 = *(_QWORD **)(v2 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v2 + 16) = v5;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v5 = sub_213DB7170(0, v5[2] + 1, 1, v5);
      *v4 = v5;
    }
    v8 = v5[2];
    v7 = v5[3];
    if (v8 >= v7 >> 1)
    {
      v5 = sub_213DB7170((_QWORD *)(v7 > 1), v8 + 1, 1, v5);
      *v4 = v5;
    }
    v5[2] = v8 + 1;
    v9 = &v5[3 * v8];
    v9[4] = 0xD000000000000016;
    v9[5] = 0x8000000213F06090;
    v10 = 23;
  }
  else
  {
    v44 = *(__int128 *)((char *)a1 + 24);
    v11 = *((_QWORD *)a1 + 2);
    v42 = *a1;
    v43 = *(__int128 *)((char *)a1 + 40);
    v45 = *(__int128 *)((char *)a1 + 56);
    v12 = *(_QWORD *)(v2 + 32);
    swift_bridgeObjectRetain_n();
    v13 = swift_bridgeObjectRetain();
    v14 = sub_213EDF5B8(v13, v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
    {
      v31 = (_QWORD *)(v2 + 16);
      swift_beginAccess();
      v32 = *(_QWORD **)(v2 + 16);
      v33 = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)(v2 + 16) = v32;
      if ((v33 & 1) == 0)
      {
        v32 = sub_213DB7170(0, v32[2] + 1, 1, v32);
        *v31 = v32;
      }
      v35 = v32[2];
      v34 = v32[3];
      if (v35 >= v34 >> 1)
      {
        v32 = sub_213DB7170((_QWORD *)(v34 > 1), v35 + 1, 1, v32);
        *v31 = v32;
      }
      v32[2] = v35 + 1;
      v36 = &v32[3 * v35];
      v36[4] = 0xD000000000000016;
      v36[5] = 0x8000000213F06090;
      *((_BYTE *)v36 + 48) = 24;
      goto LABEL_24;
    }
    v15 = *(_QWORD *)(v11 + 16);
    if (v15 >= 2)
    {
      v16 = (_QWORD *)(v2 + 16);
      swift_beginAccess();
      v17 = *(_QWORD **)(v2 + 16);
      v18 = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)(v2 + 16) = v17;
      if ((v18 & 1) == 0)
      {
        v17 = sub_213DB7170(0, v17[2] + 1, 1, v17);
        *v16 = v17;
      }
      v20 = v17[2];
      v19 = v17[3];
      if (v20 >= v19 >> 1)
      {
        v17 = sub_213DB7170((_QWORD *)(v19 > 1), v20 + 1, 1, v17);
        *v16 = v17;
      }
      v17[2] = v20 + 1;
      v21 = &v17[3 * v20];
      v21[4] = 0xD000000000000016;
      v21[5] = 0x8000000213F06090;
      *((_BYTE *)v21 + 48) = 25;
      swift_endAccess();
      v15 = *(_QWORD *)(v11 + 16);
    }
    if (v15 != 1)
      goto LABEL_25;
    v22 = swift_bridgeObjectRetain();
    sub_213EDF438(v22, (uint64_t)&v47);
    swift_bridgeObjectRelease();
    v23 = *((_QWORD *)&v47 + 1);
    if (!*((_QWORD *)&v47 + 1))
      goto LABEL_25;
    v24 = v47;
    v26 = v48;
    v25 = v49;
    v47 = v42;
    v48 = v11;
    v49 = v44;
    v50 = v43;
    v51 = v45;
    v46[0] = v26;
    v46[1] = v25;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v27 = sub_213EE16C0((uint64_t)&v47, v24, v23, v46);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v27 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v28 = swift_bridgeObjectRetain();
      v29 = sub_213DF9E94(v28);
      swift_bridgeObjectRelease();
      *(_QWORD *)a2 = v24;
      *(_QWORD *)(a2 + 8) = v23;
      *(_QWORD *)(a2 + 16) = v29;
      result = 0.0;
      *(_OWORD *)(a2 + 24) = 0u;
      *(_OWORD *)(a2 + 40) = 0u;
      *(_BYTE *)(a2 + 56) = 0;
      return result;
    }
    sub_213DB1874(v24, v23);
    v37 = (_QWORD *)(v2 + 16);
    swift_beginAccess();
    v38 = *(_QWORD **)(v2 + 16);
    v39 = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v2 + 16) = v38;
    if ((v39 & 1) == 0)
    {
      v38 = sub_213DB7170(0, v38[2] + 1, 1, v38);
      *v37 = v38;
    }
    v41 = v38[2];
    v40 = v38[3];
    if (v41 >= v40 >> 1)
    {
      v38 = sub_213DB7170((_QWORD *)(v40 > 1), v41 + 1, 1, v38);
      *v37 = v38;
    }
    v38[2] = v41 + 1;
    v9 = &v38[3 * v41];
    v9[4] = 0xD000000000000016;
    v9[5] = 0x8000000213F06090;
    v10 = 26;
  }
  *((_BYTE *)v9 + 48) = v10;
LABEL_24:
  swift_endAccess();
LABEL_25:
  *(_QWORD *)(a2 + 48) = 0;
  result = 0.0;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_BYTE *)(a2 + 56) = -1;
  return result;
}

void sub_213EE05BC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  char v31;
  unint64_t v32;
  unint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  _QWORD v38[2];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) == 1)
  {
    v4 = *(_QWORD *)(a1 + 16);
    v5 = swift_bridgeObjectRetain();
    sub_213EDF438(v5, (uint64_t)&v39);
    swift_bridgeObjectRelease();
    v6 = v40;
    if (v40)
    {
      v7 = v39;
      v9 = v41;
      v8 = v42;
      if (*(_QWORD *)(v4 + 16) == 1
        && (v10 = swift_bridgeObjectRetain(),
            sub_213EDF438(v10, (uint64_t)&v39),
            swift_bridgeObjectRelease(),
            (v11 = v40) != 0))
      {
        v37 = v9;
        v12 = v39;
        v13 = HIBYTE(v6) & 0xF;
        if ((v6 & 0x2000000000000000) == 0)
          v13 = v7 & 0xFFFFFFFFFFFFLL;
        if (v13)
        {
          sub_213DB1874(v39, v40);
          v14 = (_QWORD *)(v2 + 16);
          swift_beginAccess();
          v15 = *(_QWORD **)(v2 + 16);
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *(_QWORD *)(v2 + 16) = v15;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            v15 = sub_213DB7170(0, v15[2] + 1, 1, v15);
            *v14 = v15;
          }
          v18 = v15[2];
          v17 = v15[3];
          if (v18 >= v17 >> 1)
          {
            v15 = sub_213DB7170((_QWORD *)(v17 > 1), v18 + 1, 1, v15);
            *v14 = v15;
          }
          v15[2] = v18 + 1;
          v19 = &v15[3 * v18];
          v19[4] = 0xD000000000000016;
          v19[5] = 0x8000000213F06090;
          *((_BYTE *)v19 + 48) = 28;
          swift_endAccess();
          if (qword_253F04A88 != -1)
            swift_once();
          v20 = sub_213EF2724();
          __swift_project_value_buffer(v20, (uint64_t)qword_253F08A00);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v21 = sub_213EF270C();
          v22 = sub_213EF2C94();
          if (os_log_type_enabled(v21, v22))
          {
            v23 = swift_slowAlloc();
            v35 = swift_slowAlloc();
            v39 = v35;
            *(_DWORD *)v23 = 136315394;
            if (qword_254D3A0C0 != -1)
              swift_once();
            v25 = qword_254D40D18;
            v24 = unk_254D40D20;
            swift_bridgeObjectRetain();
            sub_213DB0570(v25, v24, &v39);
            sub_213EF2D9C();
            swift_bridgeObjectRelease();
            *(_WORD *)(v23 + 12) = 2080;
            swift_bridgeObjectRetain();
            v38[0] = sub_213DB0570(v7, v6, &v39);
            sub_213EF2D9C();
            swift_bridgeObjectRelease();
            sub_213DB1874(v7, v6);
            sub_213DB1874(v7, v6);
            _os_log_impl(&dword_213DAB000, v21, v22, "%s REJECT - Moved slot wasn't from unqualified slot (from: %s)", (uint8_t *)v23, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x2199C53C4](v35, -1, -1);
            MEMORY[0x2199C53C4](v23, -1, -1);

          }
          else
          {
            sub_213DB1874(v7, v6);
            sub_213DB1874(v7, v6);

          }
        }
        else
        {
          v39 = v37;
          v40 = v8;
          v38[0] = v41;
          v38[1] = v42;
          sub_213E05FBC(v7, v6);
          sub_213E05FBC(v12, v11);
          v36 = sub_213EE4BF8(v7, v6, (uint64_t)&v39, v12, v11, (uint64_t)v38);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v36 & 1) != 0)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v27 = swift_bridgeObjectRetain();
            v28 = sub_213DF9E94(v27);
            swift_bridgeObjectRelease();
            *(_QWORD *)a2 = v7;
            *(_QWORD *)(a2 + 8) = v6;
            *(_QWORD *)(a2 + 16) = v12;
            *(_QWORD *)(a2 + 24) = v11;
            *(_QWORD *)(a2 + 40) = 0;
            *(_QWORD *)(a2 + 48) = 0;
            *(_QWORD *)(a2 + 32) = v28;
            v26 = 1;
            goto LABEL_20;
          }
          sub_213DB1874(v7, v6);
          sub_213DB1874(v12, v11);
          v29 = (_QWORD *)(v2 + 16);
          swift_beginAccess();
          v30 = *(_QWORD **)(v2 + 16);
          v31 = swift_isUniquelyReferenced_nonNull_native();
          *(_QWORD *)(v2 + 16) = v30;
          if ((v31 & 1) == 0)
          {
            v30 = sub_213DB7170(0, v30[2] + 1, 1, v30);
            *v29 = v30;
          }
          v33 = v30[2];
          v32 = v30[3];
          if (v33 >= v32 >> 1)
          {
            v30 = sub_213DB7170((_QWORD *)(v32 > 1), v33 + 1, 1, v30);
            *v29 = v30;
          }
          v30[2] = v33 + 1;
          v34 = &v30[3 * v33];
          v34[4] = 0xD000000000000016;
          v34[5] = 0x8000000213F06090;
          *((_BYTE *)v34 + 48) = 29;
          swift_endAccess();
        }
      }
      else
      {
        sub_213DB1874(v7, v6);
      }
    }
  }
  *(_QWORD *)(a2 + 48) = 0;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  v26 = -1;
LABEL_20:
  *(_BYTE *)(a2 + 56) = v26;
}

void sub_213EE0B4C(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char v30;
  unint64_t v31;
  char v32;
  Swift::String v33;
  char v34;
  _QWORD *v35;
  _QWORD *v36;
  char v37;
  unint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  char v41;
  _QWORD *v42;
  _QWORD *v43;
  char v44;
  unint64_t v45;
  unint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  _QWORD *v51;
  char v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  unint64_t v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  double v66;
  __int128 v67;
  char v68;
  os_log_t log[2];
  NSObject *loga;
  __int128 v71;
  _QWORD *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  uint64_t v77;
  Swift::Double_optional v78;

  if (*(_QWORD *)(*((_QWORD *)a1 + 3) + 16) != 1)
    goto LABEL_41;
  v67 = *(__int128 *)((char *)a1 + 24);
  v5 = (_QWORD *)*((_QWORD *)a1 + 2);
  v63 = *a1;
  v64 = *(__int128 *)((char *)a1 + 40);
  *(_OWORD *)log = *(__int128 *)((char *)a1 + 56);
  v6 = swift_bridgeObjectRetain();
  sub_213EDF438(v6, (uint64_t)&v71);
  swift_bridgeObjectRelease();
  v7 = *((_QWORD *)&v71 + 1);
  if (!*((_QWORD *)&v71 + 1))
    goto LABEL_41;
  v8 = v71;
  v10 = (unint64_t)v72;
  v9 = v73;
  if (v5[2] != 2)
  {
    sub_213DB1874(v71, *((uint64_t *)&v71 + 1));
    goto LABEL_41;
  }
  swift_bridgeObjectRetain_n();
  sub_213E05FBC(v8, v7);
  v11 = sub_213DFA13C((uint64_t)v5);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v71 = v11;
  sub_213EE4B08((_QWORD **)&v71, v8, v7, v10, v9);
  sub_213DB1874(v8, v7);
  *((_QWORD *)&v61 + 1) = v9;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(v71 + 16);
  if (!v12)
  {
    __break(1u);
    goto LABEL_51;
  }
  *(_QWORD *)&v61 = v10;
  if (v12 == 1)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  v13 = v8;
  v14 = *(_QWORD *)(v71 + 32);
  v15 = *(_QWORD *)(v71 + 40);
  v16 = *(_QWORD *)(v71 + 56);
  v17 = *(_QWORD *)(v71 + 72);
  v56 = *(_QWORD *)(v71 + 80);
  v57 = *(_QWORD *)(v71 + 64);
  v59 = *(_QWORD *)(v71 + 48);
  v60 = *(_QWORD *)(v71 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v62 = v17;
  swift_bridgeObjectRetain();
  swift_release();
  v18 = HIBYTE(v7) & 0xF;
  v8 = v13;
  if ((v7 & 0x2000000000000000) == 0)
    v18 = v13 & 0xFFFFFFFFFFFFLL;
  v55 = v14;
  if (v18)
  {
    v19 = HIBYTE(v15) & 0xF;
    if ((v15 & 0x2000000000000000) == 0)
      v19 = v14 & 0xFFFFFFFFFFFFLL;
    if (v19)
    {
      v58 = v15;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v5 = (_QWORD *)(v2 + 16);
      swift_beginAccess();
      v3 = *(_QWORD **)(v2 + 16);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)(v2 + 16) = v3;
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
LABEL_13:
        v22 = v3[2];
        v21 = v3[3];
        if (v22 >= v21 >> 1)
        {
          v3 = sub_213DB7170((_QWORD *)(v21 > 1), v22 + 1, 1, v3);
          *v5 = v3;
        }
        v3[2] = v22 + 1;
        v23 = &v3[3 * v22];
        v23[4] = 0xD000000000000016;
        v23[5] = 0x8000000213F06090;
        *((_BYTE *)v23 + 48) = 28;
        swift_endAccess();
        if (qword_253F04A88 != -1)
          swift_once();
        v24 = sub_213EF2724();
        __swift_project_value_buffer(v24, (uint64_t)qword_253F08A00);
        sub_213E05FBC(v8, v7);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v25 = sub_213EF270C();
        v26 = sub_213EF2C94();
        if (os_log_type_enabled(v25, v26))
        {
          loga = v25;
          v27 = swift_slowAlloc();
          v65 = swift_slowAlloc();
          *(_QWORD *)&v71 = v65;
          *(_DWORD *)v27 = 136315650;
          if (qword_254D3A0C0 != -1)
            swift_once();
          v29 = qword_254D40D18;
          v28 = unk_254D40D20;
          swift_bridgeObjectRetain();
          v76 = sub_213DB0570(v29, v28, (uint64_t *)&v71);
          sub_213EF2D9C();
          swift_bridgeObjectRelease();
          *(_WORD *)(v27 + 12) = 2080;
          swift_bridgeObjectRetain();
          v76 = sub_213DB0570(v8, v7, (uint64_t *)&v71);
          sub_213EF2D9C();
          swift_bridgeObjectRelease();
          sub_213DB1874(v8, v7);
          sub_213DB1874(v8, v7);
          *(_WORD *)(v27 + 22) = 2080;
          swift_bridgeObjectRetain();
          v76 = sub_213DB0570(v55, v58, (uint64_t *)&v71);
          sub_213EF2D9C();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_213DAB000, loga, v26, "%s REJECT - Moved slot wasn't to/from unqualified slot (from: %s, to: %s)", (uint8_t *)v27, 0x20u);
          swift_arrayDestroy();
          MEMORY[0x2199C53C4](v65, -1, -1);
          MEMORY[0x2199C53C4](v27, -1, -1);

        }
        else
        {
          sub_213DB1874(v8, v7);
          sub_213DB1874(v8, v7);

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
        }
        goto LABEL_41;
      }
LABEL_52:
      v3 = sub_213DB7170(0, v3[2] + 1, 1, v3);
      *v5 = v3;
      goto LABEL_13;
    }
  }
  v71 = v61;
  v76 = v59;
  v77 = v16;
  sub_213E05FBC(v13, v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v30 = sub_213EE4BF8(v13, v7, (uint64_t)&v71, v14, v15, (uint64_t)&v76);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v30 & 1) != 0)
  {
    v71 = v63;
    v72 = v5;
    v73 = v67;
    v74 = v64;
    v75 = *(_OWORD *)log;
    v76 = v56;
    v77 = v60;
    v31 = v62;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v32 = sub_213EE16C0((uint64_t)&v71, v57, v62, &v76);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v32 & 1) != 0)
    {
      if (!v16 || !v60)
        goto LABEL_28;
      sub_213EF2898();
      v33._countAndFlagsBits = sub_213EF2898();
      v78 = String.scoreRatcliffObershelp(between:)(v33);
      v66 = *(double *)&v78.is_nil;
      v68 = v34;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v68 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v31 = v62;
        goto LABEL_44;
      }
      v31 = v62;
      if (v66 < 0.9)
      {
LABEL_28:
        swift_bridgeObjectRelease();
LABEL_44:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v48 = swift_bridgeObjectRetain();
        v49 = sub_213DF9E94(v48);
        swift_bridgeObjectRelease();
        *(_QWORD *)a2 = v13;
        *(_QWORD *)(a2 + 8) = v7;
        *(_QWORD *)(a2 + 16) = v14;
        *(_QWORD *)(a2 + 24) = v15;
        *(_QWORD *)(a2 + 32) = v57;
        *(_QWORD *)(a2 + 40) = v31;
        *(_QWORD *)(a2 + 48) = v49;
        v47 = 2;
        goto LABEL_42;
      }
      sub_213DB1874(v13, v7);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v50 = (_QWORD *)(v2 + 16);
      swift_beginAccess();
      v51 = *(_QWORD **)(v2 + 16);
      v52 = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)(v2 + 16) = v51;
      if ((v52 & 1) == 0)
      {
        v51 = sub_213DB7170(0, v51[2] + 1, 1, v51);
        *v50 = v51;
      }
      v54 = v51[2];
      v53 = v51[3];
      if (v54 >= v53 >> 1)
      {
        v51 = sub_213DB7170((_QWORD *)(v53 > 1), v54 + 1, 1, v51);
        *v50 = v51;
      }
      v51[2] = v54 + 1;
      v40 = &v51[3 * v54];
      v40[4] = 0xD000000000000016;
      v40[5] = 0x8000000213F06090;
      v41 = 30;
    }
    else
    {
      sub_213DB1874(v13, v7);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v42 = (_QWORD *)(v2 + 16);
      swift_beginAccess();
      v43 = *(_QWORD **)(v2 + 16);
      v44 = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)(v2 + 16) = v43;
      if ((v44 & 1) == 0)
      {
        v43 = sub_213DB7170(0, v43[2] + 1, 1, v43);
        *v42 = v43;
      }
      v46 = v43[2];
      v45 = v43[3];
      if (v46 >= v45 >> 1)
      {
        v43 = sub_213DB7170((_QWORD *)(v45 > 1), v46 + 1, 1, v43);
        *v42 = v43;
      }
      v43[2] = v46 + 1;
      v40 = &v43[3 * v46];
      v40[4] = 0xD000000000000016;
      v40[5] = 0x8000000213F06090;
      v41 = 26;
    }
  }
  else
  {
    sub_213DB1874(v13, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v35 = (_QWORD *)(v2 + 16);
    swift_beginAccess();
    v36 = *(_QWORD **)(v2 + 16);
    v37 = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v2 + 16) = v36;
    if ((v37 & 1) == 0)
    {
      v36 = sub_213DB7170(0, v36[2] + 1, 1, v36);
      *v35 = v36;
    }
    v39 = v36[2];
    v38 = v36[3];
    if (v39 >= v38 >> 1)
    {
      v36 = sub_213DB7170((_QWORD *)(v38 > 1), v39 + 1, 1, v36);
      *v35 = v36;
    }
    v36[2] = v39 + 1;
    v40 = &v36[3 * v39];
    v40[4] = 0xD000000000000016;
    v40[5] = 0x8000000213F06090;
    v41 = 29;
  }
  *((_BYTE *)v40 + 48) = v41;
  swift_endAccess();
LABEL_41:
  *(_QWORD *)(a2 + 48) = 0;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  v47 = -1;
LABEL_42:
  *(_BYTE *)(a2 + 56) = v47;
}

uint64_t sub_213EE1560(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t result;
  int64x2_t v14;
  int64x2_t *v15;
  unint64_t v16;
  int64x2_t v17;
  int8x16_t v18;
  uint64_t v19;
  unint64_t v20;
  int64_t *v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;

  v4 = v3;
  swift_retain();
  v8 = sub_213EE2334(a1, v4);
  swift_release();
  v9 = v8[2];
  if (!v9)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  v10 = v8[4];
  v11 = v9 - 1;
  if (v9 != 1)
  {
    if (v9 >= 5)
    {
      v12 = v11 & 0xFFFFFFFFFFFFFFFCLL | 1;
      v14 = vdupq_n_s64(v10);
      v15 = (int64x2_t *)(v8 + 7);
      v16 = v11 & 0xFFFFFFFFFFFFFFFCLL;
      v17 = v14;
      do
      {
        v14 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(v14, v15[-1]), (int8x16_t)v14, (int8x16_t)v15[-1]);
        v17 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(v17, *v15), (int8x16_t)v17, *(int8x16_t *)v15);
        v15 += 2;
        v16 -= 4;
      }
      while (v16);
      v18 = vbslq_s8((int8x16_t)vcgtq_s64(v14, v17), (int8x16_t)v14, (int8x16_t)v17);
      v19 = vextq_s8(v18, v18, 8uLL).u64[0];
      v10 = (unint64_t)vbsl_s8((int8x8_t)vcgtd_s64(v18.i64[0], v19), *(int8x8_t *)v18.i8, (int8x8_t)v19);
      if (v11 == (v11 & 0xFFFFFFFFFFFFFFFCLL))
        goto LABEL_13;
    }
    else
    {
      v12 = 1;
    }
    v20 = v9 - v12;
    v21 = &v8[v12 + 4];
    do
    {
      v23 = *v21++;
      v22 = v23;
      if ((uint64_t)v10 <= v23)
        v10 = v22;
      --v20;
    }
    while (v20);
  }
LABEL_13:
  result = swift_bridgeObjectRelease();
  if ((v10 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v24 = *(_QWORD *)(v4 + 24);
    if (*(_QWORD *)(v24 + 16) >= v10)
      return sub_213E779E0(a2, a3, v24 + 32, 0, (2 * v10) | 1);
  }
  __break(1u);
  return result;
}

uint64_t sub_213EE16C0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = *(_QWORD *)(a1 + 56);
  if (!*(_QWORD *)(v4 + 16))
    return 1;
  v7 = *a4;
  v8 = a4[1];
  v9 = swift_bridgeObjectRetain();
  v10 = sub_213DF9E94(v9);
  swift_bridgeObjectRelease();
  v11 = sub_213EE1560(v10, a2, a3);
  swift_release();
  if ((v11 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12 = sub_213EE24B8(v4, a2, a3, v7, v8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v12 & 1) != 0)
      return 1;
  }
  else
  {
    v25 = a2;
    if (qword_253F04A88 != -1)
      swift_once();
    v14 = sub_213EF2724();
    __swift_project_value_buffer(v14, (uint64_t)qword_253F08A00);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v15 = sub_213EF270C();
    v24 = sub_213EF2C94();
    if (os_log_type_enabled(v15, v24))
    {
      v16 = v15;
      v17 = swift_slowAlloc();
      v18 = swift_slowAlloc();
      v26 = v18;
      *(_DWORD *)v17 = 136315650;
      if (qword_254D3A0C0 != -1)
        swift_once();
      v20 = qword_254D40D18;
      v19 = unk_254D40D20;
      swift_bridgeObjectRetain();
      sub_213DB0570(v20, v19, &v26);
      sub_213EF2D9C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2080;
      swift_bridgeObjectRetain();
      v21 = sub_213EF2790();
      v23 = v22;
      swift_bridgeObjectRelease();
      sub_213DB0570(v21, v23, &v26);
      sub_213EF2D9C();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 22) = 2080;
      swift_bridgeObjectRetain();
      sub_213DB0570(v25, a3, &v26);
      sub_213EF2D9C();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_213DAB000, v16, v24, "%s REJECT - Added slot less specific (existing: %s, added: \"%s\")", (uint8_t *)v17, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x2199C53C4](v18, -1, -1);
      MEMORY[0x2199C53C4](v17, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
  }
  return 0;
}

uint64_t ReformulationSpecializationClassifier.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ReformulationSpecializationClassifier.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_213EE1C18@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_213EDFAEC(a1, a2);
}

uint64_t sub_213EE1C38(_QWORD *a1)
{
  return sub_213DCDE4C(0, a1[2], 0, a1);
}

uint64_t sub_213EE1C4C(uint64_t a1)
{
  return sub_213DCD860(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_213EE1C60(_QWORD *a1)
{
  return sub_213DD0148(0, a1[2], 0, a1);
}

char *sub_213EE1C74(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D40EE8);
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

char *sub_213EE1D6C(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  char *result;
  uint64_t v6;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  if (v4 <= -40)
  {
    result = (char *)sub_213EF30A8();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v6 = v4 / 40;
    if (result != v3 || result >= &v3[40 * v6])
      return (char *)memmove(result, v3, 40 * v6);
  }
  return result;
}

char *sub_213EE1E24(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 31;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -32)
  {
    result = (char *)sub_213EF30A8();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 5;
    if (result != v3 || result >= &v3[32 * v7])
      return (char *)memmove(result, v3, 32 * v7);
  }
  return result;
}

char *sub_213EE1ECC(uint64_t a1)
{
  return sub_213EE1C74(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

_QWORD *sub_213EE1EE0(_QWORD *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  if (a2 < 0 || 1 << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a5 + 48) + 16 * a2);
    *result = *(_QWORD *)(*(_QWORD *)(a5 + 56) + 8 * a2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return (_QWORD *)v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

_QWORD *sub_213EE1F74(_QWORD *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  if (a2 < 0 || 1 << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a5 + 48) + 16 * a2);
    v6 = (_QWORD *)(*(_QWORD *)(a5 + 56) + 16 * a2);
    v7 = v6[1];
    *result = *v6;
    result[1] = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return (_QWORD *)v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t _s28SiriPrivateLearningInference16FollowUpTurnTypeO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  int v17;
  _QWORD *v18;
  char v19;
  _QWORD *v20;
  char v21;
  uint64_t v22;
  _QWORD *v23;
  char v24;
  char v25;
  uint64_t v26;
  _QWORD *v27;
  char v28;
  uint64_t v29;
  _QWORD *v30;
  char v31;
  uint64_t v32;
  _QWORD *v33;
  char v34;
  _QWORD *v35;
  uint64_t v36;
  char v37;
  uint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  _QWORD *v46;
  _QWORD v47[7];
  char v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  _QWORD *v55;
  char v56;

  v2 = *(_QWORD *)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD **)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD **)(a1 + 48);
  v9 = *(unsigned __int8 *)(a1 + 56);
  v10 = *(_QWORD *)a2;
  v11 = *(_QWORD *)(a2 + 8);
  v13 = *(_QWORD **)(a2 + 16);
  v12 = *(_QWORD *)(a2 + 24);
  v14 = *(_QWORD **)(a2 + 32);
  v15 = *(_QWORD *)(a2 + 40);
  v16 = *(_QWORD **)(a2 + 48);
  v17 = *(unsigned __int8 *)(a2 + 56);
  v47[0] = *(_QWORD *)a1;
  v47[1] = v3;
  v47[2] = v5;
  v47[3] = v4;
  v45 = v7;
  v46 = v6;
  v47[4] = v6;
  v47[5] = v7;
  v44 = v8;
  v47[6] = v8;
  v48 = v9;
  v49 = v10;
  v50 = v11;
  v51 = v13;
  v52 = v12;
  v53 = v14;
  v54 = v15;
  v55 = v16;
  v56 = v17;
  if (!v9)
  {
    if (!v17)
    {
      v40 = v14;
      v42 = v16;
      v39 = v15;
      if (v2 == v10 && v3 == v11 || (sub_213EF3234() & 1) != 0)
      {
        v22 = (uint64_t)v5;
        v25 = sub_213E28344(v5, v13);
        LOBYTE(v17) = 0;
        LOBYTE(v9) = 0;
      }
      else
      {
        v22 = (uint64_t)v5;
        LOBYTE(v17) = 0;
        LOBYTE(v9) = 0;
        v25 = 0;
      }
      v14 = v40;
LABEL_35:
      v15 = v39;
      v16 = v42;
      goto LABEL_36;
    }
    goto LABEL_27;
  }
  if (v9 == 1)
  {
    if (v17 == 1)
    {
      v42 = v16;
      v39 = v15;
      if ((v2 == v10 && v3 == v11 || (v18 = v14, v19 = sub_213EF3234(), v14 = v18, (v19 & 1) != 0))
        && (v5 == v13 && v4 == v12 || (v20 = v14, v21 = sub_213EF3234(), v14 = v20, (v21 & 1) != 0)))
      {
        v22 = (uint64_t)v5;
        v23 = v14;
        v24 = sub_213E28344(v46, v14);
        v14 = v23;
        v25 = v24;
      }
      else
      {
        v22 = (uint64_t)v5;
        v25 = 0;
      }
      LOBYTE(v17) = 1;
      LOBYTE(v9) = 1;
      goto LABEL_35;
    }
    goto LABEL_27;
  }
  if (v17 == 2)
  {
    v41 = v14;
    if (v2 != v10 || v3 != v11)
    {
      v26 = v15;
      v27 = v16;
      v28 = sub_213EF3234();
      v16 = v27;
      v15 = v26;
      v14 = v41;
      if ((v28 & 1) == 0)
        goto LABEL_30;
    }
    if (v5 == v13 && v4 == v12
      || (v29 = v15, v30 = v16, v31 = sub_213EF3234(), v16 = v30, v15 = v29, v14 = v41, (v31 & 1) != 0))
    {
      v22 = (uint64_t)v5;
      if (v46 == v14 && v45 == v15
        || (v32 = v15, v33 = v16, v34 = sub_213EF3234(), v16 = v33, v15 = v32, v14 = v41, (v34 & 1) != 0))
      {
        v43 = v16;
        v35 = v14;
        v36 = v15;
        v37 = sub_213E28344(v44, v16);
        v16 = v43;
        v15 = v36;
        v14 = v35;
        v25 = v37;
LABEL_32:
        LOBYTE(v17) = 2;
        LOBYTE(v9) = 2;
        goto LABEL_36;
      }
    }
    else
    {
LABEL_30:
      v22 = (uint64_t)v5;
    }
    v25 = 0;
    goto LABEL_32;
  }
LABEL_27:
  v22 = (uint64_t)v5;
  v25 = 0;
LABEL_36:
  sub_213EE28A8(v10, v11, (uint64_t)v13, v12, (uint64_t)v14, v15, (uint64_t)v16, v17);
  sub_213EE28A8(v2, v3, v22, v4, (uint64_t)v46, v45, (uint64_t)v44, v9);
  sub_213EE50AC((uint64_t)v47);
  return v25 & 1;
}

_QWORD *sub_213EE2334(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  char v17;
  uint64_t v19;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  v19 = a1 + 32;
  v3 = *(_QWORD **)(a2 + 24);
  swift_bridgeObjectRetain();
  v4 = 0;
  v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
  do
  {
    v6 = v3[2];
    if (v6)
    {
      v7 = (uint64_t *)(v19 + 16 * v4);
      v8 = *v7;
      v9 = v7[1];
      v10 = v3[4] == *v7 && v3[5] == v9;
      if (v10 || (sub_213EF3234() & 1) != 0)
      {
        v11 = 0;
LABEL_12:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v5 = sub_213DB65E0(0, v5[2] + 1, 1, v5);
        v13 = v5[2];
        v12 = v5[3];
        if (v13 >= v12 >> 1)
          v5 = sub_213DB65E0((_QWORD *)(v12 > 1), v13 + 1, 1, v5);
        v5[2] = v13 + 1;
        v5[v13 + 4] = v11;
      }
      else
      {
        v14 = v3 + 7;
        v15 = 1;
        while (v6 != v15)
        {
          v11 = v15;
          if (*(v14 - 1) != v8 || *v14 != v9)
          {
            v17 = sub_213EF3234();
            v15 = v11 + 1;
            v14 += 2;
            if ((v17 & 1) == 0)
              continue;
          }
          goto LABEL_12;
        }
      }
    }
    ++v4;
  }
  while (v4 != v2);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_213EE24B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  Swift::String v20;
  double v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  Swift::Double_optional v27;

  v6 = a1;
  v25 = a1 + 64;
  v7 = 1 << *(_BYTE *)(a1 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a1 + 64);
  v26 = (unint64_t)(v7 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v11 = 0;
  v24 = result;
  while (v9)
  {
    v12 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    v13 = v12 | (v11 << 6);
LABEL_20:
    if (*(_QWORD *)(*(_QWORD *)(v6 + 56) + 32 * v13 + 8))
    {
      if (a5)
      {
        sub_213EF2898();
        v17 = sub_213EF2898();
        v19 = v18;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        v20._countAndFlagsBits = v17;
        v20._object = v19;
        v27 = String.scoreRatcliffObershelp(between:)(v20);
        v21 = *(double *)&v27.is_nil;
        LOBYTE(v17) = v22;
        v6 = v24;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        if ((v17 & 1) == 0 && v21 >= 0.9)
        {
          v23 = 0;
LABEL_30:
          swift_release();
          return v23;
        }
      }
    }
    else
    {
      result = swift_bridgeObjectRelease();
    }
  }
  if (__OFADD__(v11++, 1))
  {
    __break(1u);
    goto LABEL_32;
  }
  if (v11 >= v26)
    goto LABEL_29;
  v15 = *(_QWORD *)(v25 + 8 * v11);
  if (v15)
  {
LABEL_19:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v11 << 6);
    goto LABEL_20;
  }
  v16 = v11 + 1;
  if (v11 + 1 >= v26)
    goto LABEL_29;
  v15 = *(_QWORD *)(v25 + 8 * v16);
  if (v15)
    goto LABEL_18;
  v16 = v11 + 2;
  if (v11 + 2 >= v26)
    goto LABEL_29;
  v15 = *(_QWORD *)(v25 + 8 * v16);
  if (v15)
    goto LABEL_18;
  v16 = v11 + 3;
  if (v11 + 3 >= v26)
    goto LABEL_29;
  v15 = *(_QWORD *)(v25 + 8 * v16);
  if (v15)
    goto LABEL_18;
  v16 = v11 + 4;
  if (v11 + 4 >= v26)
  {
LABEL_29:
    v23 = 1;
    goto LABEL_30;
  }
  v15 = *(_QWORD *)(v25 + 8 * v16);
  if (v15)
  {
LABEL_18:
    v11 = v16;
    goto LABEL_19;
  }
  while (1)
  {
    v11 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v11 >= v26)
      goto LABEL_29;
    v15 = *(_QWORD *)(v25 + 8 * v11);
    ++v16;
    if (v15)
      goto LABEL_19;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_213EE2724(uint64_t a1)
{
  uint64_t v1;

  return sub_213EE00E0(a1, v1, (uint64_t (*)(_OWORD *))sub_213EE0B4C);
}

uint64_t sub_213EE2744(uint64_t a1)
{
  uint64_t v1;

  return sub_213EE00E0(a1, v1, (uint64_t (*)(_OWORD *))sub_213EE05BC);
}

uint64_t sub_213EE2764(uint64_t a1)
{
  uint64_t v1;

  return sub_213EE00E0(a1, v1, (uint64_t (*)(_OWORD *))sub_213EE0124);
}

uint64_t sub_213EE2784(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if (a8 != -1)
    return sub_213EE2798(a1, a2, a3, a4, a5, a6, a7, a8);
  return a1;
}

uint64_t sub_213EE2798(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t result;

  result = a2;
  if (a8)
  {
    if (a8 != 1)
    {
      if (a8 != 2)
        return result;
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_213EE2820(uint64_t a1)
{
  unint64_t result;

  result = sub_213EE2844();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_213EE2844()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D40D30;
  if (!qword_254D40D30)
  {
    v1 = type metadata accessor for SlotBasedTurnComparison();
    result = MEMORY[0x2199C52D4](&protocol conformance descriptor for SlotBasedTurnComparison, v1);
    atomic_store(result, (unint64_t *)&qword_254D40D30);
  }
  return result;
}

uint64_t type metadata accessor for SlotBasedTurnComparison()
{
  return objc_opt_self();
}

uint64_t sub_213EE28A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t result;

  result = a2;
  if (a8)
  {
    if (a8 != 1)
    {
      if (a8 != 2)
        return result;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t destroy for FollowUpTurnType(uint64_t a1)
{
  return sub_213EE2798(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 56));
}

uint64_t initializeWithCopy for FollowUpTurnType(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_BYTE *)(a2 + 56);
  sub_213EE28A8(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_BYTE *)(a1 + 56) = v10;
  return a1;
}

uint64_t assignWithCopy for FollowUpTurnType(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_BYTE *)(a2 + 56);
  sub_213EE28A8(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10);
  v11 = *(_QWORD *)a1;
  v12 = *(_QWORD *)(a1 + 8);
  v13 = *(_QWORD *)(a1 + 16);
  v14 = *(_QWORD *)(a1 + 24);
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 40);
  v17 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  v18 = *(_BYTE *)(a1 + 56);
  *(_BYTE *)(a1 + 56) = v10;
  sub_213EE2798(v11, v12, v13, v14, v15, v16, v17, v18);
  return a1;
}

uint64_t assignWithTake for FollowUpTurnType(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  char v13;

  v3 = *(_QWORD *)(a2 + 48);
  v4 = *(_BYTE *)(a2 + 56);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v12;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = v3;
  v13 = *(_BYTE *)(a1 + 56);
  *(_BYTE *)(a1 + 56) = v4;
  sub_213EE2798(v5, v7, v6, v8, v9, v10, v11, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for FollowUpTurnType(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 57))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 56);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for FollowUpTurnType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 56) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 57) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 57) = 0;
    if (a2)
      *(_BYTE *)(result + 56) = -(char)a2;
  }
  return result;
}

uint64_t sub_213EE2B74(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 56);
}

uint64_t sub_213EE2B7C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 56) = a2;
  return result;
}

ValueMetadata *type metadata accessor for FollowUpTurnType()
{
  return &type metadata for FollowUpTurnType;
}

uint64_t method lookup function for SlotBasedTurnComparison()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SlotBasedTurnComparison.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of SlotBasedTurnComparison.isMatch.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of FollowUpTurnClassifying.identify(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t type metadata accessor for ReformulationSpecializationClassifier()
{
  return objc_opt_self();
}

uint64_t method lookup function for ReformulationSpecializationClassifier()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ReformulationSpecializationClassifier.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of ReformulationSpecializationClassifier.identify(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t sub_213EE2BFC(char *__src, char *a2, char *a3, char *__dst, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  void *v8;
  char *v9;
  char *v10;
  char *v11;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  char v21;
  double v22;
  Swift::String v23;
  double v24;
  char v25;
  char v26;
  unint64_t v27;
  char *v28;
  char *v29;
  __int128 v30;
  char *v31;
  uint64_t v32;
  char *v33;
  Swift::String v34;
  char v35;
  double v36;
  char *v37;
  Swift::String v38;
  double v39;
  char v40;
  char v41;
  char *v42;
  char *v43;
  char *v44;
  __int128 v45;
  __int128 v46;
  uint64_t result;
  char *v49;
  char *v50;
  char *between_8;
  char *v53;
  char *v54;
  char *v55;
  const void *v56;
  char *v57;
  Swift::Double_optional v58;
  Swift::Double_optional v59;
  Swift::Double_optional v60;
  Swift::Double_optional v61;

  v8 = a8;
  v9 = __dst;
  v10 = a2;
  v11 = __src;
  v12 = a2 - __src;
  v13 = a2 - __src + 31;
  if (a2 - __src >= 0)
    v13 = a2 - __src;
  v14 = v13 >> 5;
  v15 = a3 - a2;
  v16 = a3 - a2 + 31;
  if (a3 - a2 >= 0)
    v16 = a3 - a2;
  v17 = v16 >> 5;
  v57 = __src;
  v56 = __dst;
  v53 = a3;
  if (v14 >= v16 >> 5)
  {
    if (v15 < -31)
      goto LABEL_79;
    if (__dst != a2 || &a2[32 * v17] <= __dst)
    {
      memmove(__dst, a2, 32 * v17);
      a3 = v53;
    }
    v31 = &v9[32 * v17];
    v55 = v31;
    v57 = v10;
    v50 = v11;
    if (v11 >= v10 || v15 < 32)
    {
LABEL_78:
      sub_213EE1E24((void **)&v57, &v56, &v55);
      return 1;
    }
    between_8 = v9;
    while (1)
    {
      v32 = *((_QWORD *)v10 - 1);
      v54 = a3;
      if (*((_QWORD *)v31 - 1))
      {
        if (!v8)
        {
          v37 = a3 - 32;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (v32)
          {
LABEL_62:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v42 = between_8;
            v43 = v54;
LABEL_71:
            v55 = v31 - 32;
            if (v43 < v31 || v37 >= v31 || v43 != v31)
            {
              v46 = *((_OWORD *)v31 - 1);
              *(_OWORD *)v37 = *((_OWORD *)v31 - 2);
              *((_OWORD *)v37 + 1) = v46;
            }
            v44 = v10;
            v31 -= 32;
            goto LABEL_76;
          }
          v36 = 0.0;
LABEL_65:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_66;
        }
        v33 = a3;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v34._countAndFlagsBits = a7;
        v34._object = v8;
        v60 = String.scoreRatcliffObershelp(between:)(v34);
        if ((v35 & 1) != 0)
          v36 = 0.0;
        else
          v36 = *(double *)&v60.is_nil;
        v37 = v33 - 32;
        if (!v32)
          goto LABEL_65;
      }
      else
      {
        v37 = a3 - 32;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v36 = 0.0;
        if (!v32)
          goto LABEL_65;
        if (!v8)
          goto LABEL_62;
      }
      v38._countAndFlagsBits = a7;
      v38._object = v8;
      v61 = String.scoreRatcliffObershelp(between:)(v38);
      v39 = *(double *)&v61.is_nil;
      v41 = v40;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v41 & 1) == 0)
      {
        v8 = a8;
        v42 = between_8;
        v43 = v54;
        if (v36 <= v39)
          goto LABEL_71;
        goto LABEL_67;
      }
      v8 = a8;
LABEL_66:
      v42 = between_8;
      v43 = v54;
      if (v36 <= 0.0)
        goto LABEL_71;
LABEL_67:
      v44 = v10 - 32;
      if (v43 != v10 || v37 >= v10)
      {
        v45 = *((_OWORD *)v10 - 1);
        *(_OWORD *)v37 = *(_OWORD *)v44;
        *((_OWORD *)v37 + 1) = v45;
      }
      v57 = v10 - 32;
LABEL_76:
      if (v44 > v50)
      {
        v10 = v44;
        a3 = v37;
        if (v31 > v42)
          continue;
      }
      goto LABEL_78;
    }
  }
  if (v12 >= -31)
  {
    if (__dst != __src || &__src[32 * v14] <= __dst)
    {
      memmove(__dst, __src, 32 * v14);
      a3 = v53;
    }
    v49 = &v9[32 * v14];
    v55 = v49;
    if (v10 < a3 && v12 >= 32)
    {
      v18 = v9;
      while (1)
      {
        v19 = *((_QWORD *)v18 + 3);
        if (*((_QWORD *)v10 + 3))
        {
          if (!v8)
          {
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            if (v19)
            {
LABEL_26:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v27 = (unint64_t)v53;
              goto LABEL_34;
            }
            v22 = 0.0;
LABEL_29:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            goto LABEL_30;
          }
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v20._countAndFlagsBits = a7;
          v20._object = v8;
          v58 = String.scoreRatcliffObershelp(between:)(v20);
          if ((v21 & 1) != 0)
            v22 = 0.0;
          else
            v22 = *(double *)&v58.is_nil;
          if (!v19)
            goto LABEL_29;
        }
        else
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v22 = 0.0;
          if (!v19)
            goto LABEL_29;
          if (!v8)
            goto LABEL_26;
        }
        v23._countAndFlagsBits = a7;
        v23._object = v8;
        v59 = String.scoreRatcliffObershelp(between:)(v23);
        v24 = *(double *)&v59.is_nil;
        v26 = v25;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v26 & 1) == 0)
        {
          v8 = a8;
          v27 = (unint64_t)v53;
          if (v22 > v24)
            goto LABEL_31;
          goto LABEL_34;
        }
        v8 = a8;
LABEL_30:
        v27 = (unint64_t)v53;
        if (v22 > 0.0)
        {
LABEL_31:
          v28 = v10 + 32;
          v29 = v10;
          if (v11 == v10 && v11 < v28)
            goto LABEL_39;
          goto LABEL_38;
        }
LABEL_34:
        v9 = v18 + 32;
        v29 = v18;
        v28 = v10;
        if (v11 == v18)
        {
          v18 += 32;
          if (v11 < v9)
            goto LABEL_39;
        }
        else
        {
          v18 += 32;
        }
LABEL_38:
        v30 = *((_OWORD *)v29 + 1);
        *(_OWORD *)v11 = *(_OWORD *)v29;
        *((_OWORD *)v11 + 1) = v30;
LABEL_39:
        v11 += 32;
        if (v18 < v49)
        {
          v10 = v28;
          if ((unint64_t)v28 < v27)
            continue;
        }
        v56 = v9;
        v57 = v11;
        goto LABEL_78;
      }
    }
    goto LABEL_78;
  }
LABEL_79:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = sub_213EF30A8();
  __break(1u);
  return result;
}

uint64_t sub_213EE3180(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, unint64_t a7, unint64_t a8)
{
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  int64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  BOOL v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  double v52;
  uint64_t v55;
  uint64_t v56;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  if (a3 == a2)
    return result;
  v8 = a8;
  v9 = a7;
  v10 = result;
  v11 = *a4;
  if ((a8 & 0x2000000000000000) != 0)
    v12 = HIBYTE(a8) & 0xF;
  else
    v12 = a7 & 0xFFFFFFFFFFFFLL;
  v56 = *a4;
  v55 = result;
  v58 = v12;
LABEL_8:
  v13 = v11 + 32 * a3;
  v14 = *(_QWORD *)(v13 + 16);
  v15 = *(_QWORD *)(v13 + 24);
  v59 = a3;
  while (1)
  {
    v63 = a3 - 1;
    v64 = a3;
    v16 = v11 + 32 * (a3 - 1);
    v65 = *(_QWORD *)(v16 + 16);
    v17 = *(_QWORD *)(v16 + 24);
    if (v15)
    {
      if (v8)
      {
        v18 = HIBYTE(v15) & 0xF;
        if ((v15 & 0x2000000000000000) == 0)
          v18 = v14 & 0xFFFFFFFFFFFFLL;
        if (v18 && v12)
          break;
      }
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v19 = 0.0;
    v20 = v65;
    if (!v17)
      goto LABEL_54;
LABEL_21:
    if (!v8)
      goto LABEL_54;
LABEL_22:
    v21 = HIBYTE(v17) & 0xF;
    if ((v17 & 0x2000000000000000) == 0)
      v21 = v20 & 0xFFFFFFFFFFFFLL;
    if (!v21 || !v12)
      goto LABEL_54;
    if (v20 == v9 && v17 == v8 || (sub_213EF3234() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      v22 = v64;
      if (v19 <= 1.0)
        goto LABEL_7;
    }
    else
    {
      v31 = sub_213EF28C8();
      result = sub_213EF28C8();
      if (__OFADD__(v31, result))
        goto LABEL_68;
      v61 = v31 + result;
      v32 = String.commonSequences(between:)(v9, v8, v65, v17);
      v33 = v32[2];
      if (v33)
      {
        v67 = MEMORY[0x24BEE4AF8];
        sub_213DCD3C4(0, v33, 0);
        v34 = v67;
        v35 = v32 + 5;
        do
        {
          swift_bridgeObjectRetain();
          v36 = sub_213EF28C8();
          swift_bridgeObjectRelease();
          v38 = *(_QWORD *)(v67 + 16);
          v37 = *(_QWORD *)(v67 + 24);
          if (v38 >= v37 >> 1)
            sub_213DCD3C4(v37 > 1, v38 + 1, 1);
          v35 += 2;
          *(_QWORD *)(v67 + 16) = v38 + 1;
          *(_QWORD *)(v67 + 8 * v38 + 32) = v36;
          --v33;
        }
        while (v33);
        swift_bridgeObjectRelease();
        v11 = v56;
        v8 = a8;
        v9 = a7;
      }
      else
      {
        swift_bridgeObjectRelease();
        v34 = MEMORY[0x24BEE4AF8];
      }
      v48 = *(_QWORD *)(v34 + 16);
      v10 = v55;
      result = v17;
      v49 = 0;
      if (v48)
      {
        v50 = (uint64_t *)(v34 + 32);
        do
        {
          v51 = *v50++;
          v43 = __OFADD__(v49, v51);
          v49 += v51;
          if (v43)
            goto LABEL_66;
        }
        while (--v48);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      v52 = 2.0 / (double)v61 * (double)v49;
      v12 = v58;
      v22 = v64;
      if (v52 >= v19)
      {
LABEL_7:
        a3 = v59 + 1;
        if (v59 + 1 == a2)
          return result;
        goto LABEL_8;
      }
    }
LABEL_55:
    if (!v11)
      goto LABEL_69;
    v44 = (_QWORD *)(v11 + 32 * v22);
    v45 = *v44;
    v46 = v44[1];
    v14 = v44[2];
    v15 = v44[3];
    v47 = *(_OWORD *)(v16 + 16);
    *(_OWORD *)v44 = *(_OWORD *)v16;
    *((_OWORD *)v44 + 1) = v47;
    *(_QWORD *)v16 = v45;
    *(_QWORD *)(v16 + 8) = v46;
    *(_QWORD *)(v16 + 16) = v14;
    *(_QWORD *)(v16 + 24) = v15;
    a3 = v63;
    if (v63 == v10)
      goto LABEL_7;
  }
  if (v14 == v9 && v15 == v8 || (v62 = *(_QWORD *)(v16 + 24), v17 = v62, (sub_213EF3234() & 1) != 0))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v19 = 1.0;
    v20 = v65;
    if (!v17)
      goto LABEL_54;
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v23 = sub_213EF28C8();
  result = sub_213EF28C8();
  if (__OFADD__(v23, result))
    goto LABEL_67;
  v60 = v23 + result;
  v24 = String.commonSequences(between:)(v9, v8, v14, v15);
  v25 = v24[2];
  if (v25)
  {
    v66 = MEMORY[0x24BEE4AF8];
    sub_213DCD3C4(0, v25, 0);
    v26 = v66;
    v27 = v24 + 5;
    do
    {
      swift_bridgeObjectRetain();
      v28 = sub_213EF28C8();
      swift_bridgeObjectRelease();
      v30 = *(_QWORD *)(v66 + 16);
      v29 = *(_QWORD *)(v66 + 24);
      if (v30 >= v29 >> 1)
        sub_213DCD3C4(v29 > 1, v30 + 1, 1);
      v27 += 2;
      *(_QWORD *)(v66 + 16) = v30 + 1;
      *(_QWORD *)(v66 + 8 * v30 + 32) = v28;
      --v25;
    }
    while (v25);
    result = swift_bridgeObjectRelease();
    v9 = a7;
    v10 = v55;
  }
  else
  {
    result = swift_bridgeObjectRelease();
    v26 = MEMORY[0x24BEE4AF8];
  }
  v39 = *(_QWORD *)(v26 + 16);
  v11 = v56;
  v40 = 0;
  if (!v39)
  {
    v8 = a8;
LABEL_53:
    swift_bridgeObjectRelease();
    v17 = v62;
    v19 = 2.0 / (double)v60 * (double)v40;
    v12 = v58;
    v20 = v65;
    if (!v62)
    {
LABEL_54:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      v22 = v64;
      if (v19 <= 0.0)
        goto LABEL_7;
      goto LABEL_55;
    }
    goto LABEL_21;
  }
  v41 = (uint64_t *)(v26 + 32);
  v8 = a8;
  while (1)
  {
    v42 = *v41++;
    v43 = __OFADD__(v40, v42);
    v40 += v42;
    if (v43)
      break;
    if (!--v39)
      goto LABEL_53;
  }
  __break(1u);
LABEL_66:
  __break(1u);
LABEL_67:
  __break(1u);
LABEL_68:
  __break(1u);
LABEL_69:
  __break(1u);
  return result;
}

uint64_t sub_213EE3748(uint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  Swift::String v20;
  char v21;
  double v22;
  unint64_t v23;
  Swift::String v24;
  double v25;
  char v26;
  char v27;
  double v28;
  double v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  double v40;
  BOOL v41;
  uint64_t v42;
  double v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  int64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  int64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _OWORD *v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  double v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD *v97;
  int64_t v98;
  uint64_t v99;
  _QWORD *v100;
  uint64_t v101;
  unint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  _QWORD *v106;
  int64_t v107;
  uint64_t v108;
  _QWORD *v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  _QWORD *v117;
  uint64_t v118;
  uint64_t v119;
  __int128 v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  double v125;
  unint64_t v126;
  unint64_t v127;
  char *v128;
  char *v129;
  unint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  char v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  BOOL v141;
  unint64_t v142;
  char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  char *v148;
  uint64_t v149;
  uint64_t v150;
  BOOL v151;
  uint64_t v152;
  char v153;
  char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  BOOL v158;
  uint64_t v159;
  uint64_t v160;
  char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  unint64_t v169;
  char *v170;
  char *v171;
  uint64_t v172;
  unint64_t v173;
  char *v174;
  uint64_t v175;
  char *v176;
  char *v177;
  char *v178;
  unint64_t v179;
  unint64_t v180;
  uint64_t v181;
  uint64_t v182;
  unint64_t v183;
  uint64_t v184;
  uint64_t v185;
  char *v186;
  char *v187;
  char *v188;
  char *v189;
  char *v190;
  char *v191;
  unint64_t v192;
  uint64_t result;
  uint64_t *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  char *__dst;
  uint64_t v201;
  char *v203;
  char *v204;
  void *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t between;
  uint64_t between_8;
  uint64_t v210;
  uint64_t v211;
  unint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  Swift::Double_optional v226;
  Swift::Double_optional v227;

  v9 = a1[1];
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v10 = sub_213EF31D4();
  if (v10 >= v9)
  {
    if (v9 < 0)
      goto LABEL_274;
    if (v9)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_213EE3180(0, v9, 1, a1, a2, a3, a4, a5);
      swift_bridgeObjectRelease();
      if (v211)
        goto LABEL_241;
LABEL_245:
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    return swift_bridgeObjectRelease_n();
  }
  v195 = v10;
  if (v9 >= 0)
    v11 = v9;
  else
    v11 = v9 + 1;
  if (v9 < -1)
    goto LABEL_284;
  v12 = (char *)MEMORY[0x24BEE4AF8];
  v201 = a3;
  v205 = (void *)a5;
  between = a4;
  v199 = v9;
  v194 = a1;
  if (v9 < 2)
  {
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v9 != 1)
    {
      v23 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v181 = MEMORY[0x24BEE4AF8];
      if (v23 < 2)
        goto LABEL_244;
      goto LABEL_229;
    }
    v196 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v13 = v11 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D3AF50);
    v14 = sub_213EF2A9C();
    *(_QWORD *)(v14 + 16) = v13;
    v196 = v14;
    __dst = (char *)(v14 + 32);
  }
  v15 = 0;
  if ((a5 & 0x2000000000000000) != 0)
    v16 = HIBYTE(a5) & 0xF;
  else
    v16 = a4 & 0xFFFFFFFFFFFFLL;
  v17 = v199;
  between_8 = v16;
  v210 = *a1;
  while (2)
  {
    v203 = v12;
    v18 = v15++;
    v213 = v18;
    if (v15 >= v17)
    {
      v23 = v210;
      goto LABEL_108;
    }
    v19 = *(_QWORD *)(v210 + 32 * v18 + 24);
    if (!*(_QWORD *)(v210 + 32 * v15 + 24))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v22 = 0.0;
      if (v19)
      {
        if (a5)
          goto LABEL_29;
LABEL_33:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v22 = 0.0;
        v29 = 0.0;
        a4 = between;
        goto LABEL_36;
      }
LABEL_35:
      a4 = between;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v29 = 0.0;
      goto LABEL_36;
    }
    if (!a5)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v19)
        goto LABEL_33;
      v22 = 0.0;
      goto LABEL_35;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v20._countAndFlagsBits = between;
    v20._object = (void *)a5;
    v226 = String.scoreRatcliffObershelp(between:)(v20);
    if ((v21 & 1) != 0)
      v22 = 0.0;
    else
      v22 = *(double *)&v226.is_nil;
    if (!v19)
      goto LABEL_35;
LABEL_29:
    v24._countAndFlagsBits = between;
    v24._object = (void *)a5;
    v227 = String.scoreRatcliffObershelp(between:)(v24);
    v25 = *(double *)&v227.is_nil;
    v27 = v26;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v28 = v25;
    v36 = (v27 & 1) == 0;
    a4 = between;
    a5 = (unint64_t)v205;
    if (v36)
      v29 = v28;
    else
      v29 = 0.0;
LABEL_36:
    v30 = v18 + 2;
    v23 = v210;
    if (v18 + 2 >= v199)
      goto LABEL_98;
    do
    {
      v31 = v23 + 32 * v30;
      v32 = *(_QWORD *)(v31 + 24);
      v33 = v23 + 32 * v15;
      v34 = *(_QWORD *)(v33 + 16);
      v35 = *(_QWORD *)(v33 + 24);
      if (v32)
        v36 = a5 == 0;
      else
        v36 = 1;
      if (v36)
        goto LABEL_48;
      v37 = *(_QWORD *)(v31 + 16);
      v38 = HIBYTE(v32) & 0xF;
      if ((v32 & 0x2000000000000000) == 0)
        v38 = v37 & 0xFFFFFFFFFFFFLL;
      if (!v38 || between_8 == 0)
      {
LABEL_48:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v40 = 0.0;
        if (!v35)
          goto LABEL_90;
LABEL_49:
        if (!a5)
          goto LABEL_90;
        goto LABEL_57;
      }
      v41 = v37 == a4 && v32 == a5;
      if (!v41 && (sub_213EF3234() & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v44 = a4;
        v45 = a5;
        v46 = sub_213EF28C8();
        v47 = sub_213EF28C8();
        if (__OFADD__(v46, v47))
          goto LABEL_275;
        v214 = v46 + v47;
        v216 = v34;
        v48 = String.commonSequences(between:)(v44, v45, v37, v32);
        v49 = v48[2];
        if (v49)
        {
          v222 = MEMORY[0x24BEE4AF8];
          sub_213DCD3C4(0, v49, 0);
          v50 = v222;
          v51 = v48 + 5;
          do
          {
            swift_bridgeObjectRetain();
            v52 = sub_213EF28C8();
            swift_bridgeObjectRelease();
            v54 = *(_QWORD *)(v222 + 16);
            v53 = *(_QWORD *)(v222 + 24);
            if (v54 >= v53 >> 1)
              sub_213DCD3C4(v53 > 1, v54 + 1, 1);
            v51 += 2;
            *(_QWORD *)(v222 + 16) = v54 + 1;
            *(_QWORD *)(v222 + 8 * v54 + 32) = v52;
            --v49;
          }
          while (v49);
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          v50 = MEMORY[0x24BEE4AF8];
        }
        v68 = *(_QWORD *)(v50 + 16);
        a4 = between;
        v34 = v216;
        v69 = 0;
        if (v68)
        {
          v70 = (uint64_t *)(v50 + 32);
          do
          {
            v71 = *v70++;
            v141 = __OFADD__(v69, v71);
            v69 += v71;
            if (v141)
              goto LABEL_253;
            --v68;
          }
          while (v68);
        }
        swift_bridgeObjectRelease();
        v40 = 2.0 / (double)v214 * (double)v69;
        a5 = (unint64_t)v205;
        if (!v35)
        {
LABEL_90:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v43 = 0.0;
          goto LABEL_91;
        }
        goto LABEL_49;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v40 = 1.0;
      if (!v35)
        goto LABEL_90;
LABEL_57:
      v42 = HIBYTE(v35) & 0xF;
      if ((v35 & 0x2000000000000000) == 0)
        v42 = v34 & 0xFFFFFFFFFFFFLL;
      if (!v42 || !between_8)
        goto LABEL_90;
      if (v34 == a4 && v35 == a5 || (sub_213EF3234() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v43 = 1.0;
        goto LABEL_91;
      }
      v55 = sub_213EF28C8();
      v56 = sub_213EF28C8();
      if (__OFADD__(v55, v56))
        goto LABEL_279;
      v217 = v55 + v56;
      v57 = String.commonSequences(between:)(a4, a5, v34, v35);
      v58 = v57[2];
      if (v58)
      {
        v223 = MEMORY[0x24BEE4AF8];
        sub_213DCD3C4(0, v58, 0);
        v59 = v223;
        v60 = v57 + 5;
        do
        {
          swift_bridgeObjectRetain();
          v61 = sub_213EF28C8();
          swift_bridgeObjectRelease();
          v63 = *(_QWORD *)(v223 + 16);
          v62 = *(_QWORD *)(v223 + 24);
          if (v63 >= v62 >> 1)
            sub_213DCD3C4(v62 > 1, v63 + 1, 1);
          v60 += 2;
          *(_QWORD *)(v223 + 16) = v63 + 1;
          *(_QWORD *)(v223 + 8 * v63 + 32) = v61;
          --v58;
        }
        while (v58);
        swift_bridgeObjectRelease();
        a4 = between;
        v64 = *(_QWORD *)(v223 + 16);
        if (v64)
        {
LABEL_80:
          v65 = 0;
          v66 = (uint64_t *)(v59 + 32);
          do
          {
            v67 = *v66++;
            v141 = __OFADD__(v65, v67);
            v65 += v67;
            if (v141)
              goto LABEL_264;
            --v64;
          }
          while (v64);
          goto LABEL_96;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        v59 = MEMORY[0x24BEE4AF8];
        v64 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
        if (v64)
          goto LABEL_80;
      }
      v65 = 0;
LABEL_96:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v43 = 2.0 / (double)v217 * (double)v65;
      a5 = (unint64_t)v205;
LABEL_91:
      v23 = v210;
      if (v29 < v22 == v43 >= v40)
        goto LABEL_97;
      v15 = v30++;
    }
    while (v30 != v199);
    v30 = v199;
LABEL_97:
    v18 = v213;
LABEL_98:
    if (v29 < v22)
    {
      if (v30 >= v18)
      {
        if (v18 < v30)
        {
          v72 = 32 * v30;
          v73 = 32 * v18;
          v74 = v30;
          v75 = v18;
          while (1)
          {
            if (v75 != --v74)
            {
              if (!v23)
                goto LABEL_282;
              v76 = (_OWORD *)(v23 + v73);
              v77 = v23 + v72;
              v78 = *(_QWORD *)(v23 + v73);
              v79 = *(_QWORD *)(v23 + v73 + 8);
              v80 = *(_OWORD *)(v23 + v73 + 16);
              v81 = *(_OWORD *)(v23 + v72 - 16);
              *v76 = *(_OWORD *)(v23 + v72 - 32);
              v76[1] = v81;
              *(_QWORD *)(v77 - 32) = v78;
              *(_QWORD *)(v77 - 24) = v79;
              *(_OWORD *)(v77 - 16) = v80;
            }
            ++v75;
            v72 -= 32;
            v73 += 32;
            if (v75 >= v74)
              goto LABEL_107;
          }
        }
        goto LABEL_107;
      }
LABEL_278:
      __break(1u);
LABEL_279:
      __break(1u);
LABEL_280:
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      __break(1u);
LABEL_281:
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      __break(1u);
LABEL_282:
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      __break(1u);
LABEL_283:
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      __break(1u);
LABEL_284:
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      result = sub_213EF3048();
      __break(1u);
      return result;
    }
LABEL_107:
    v15 = v30;
    v16 = between_8;
LABEL_108:
    if (v15 < v199)
    {
      if (__OFSUB__(v15, v18))
        goto LABEL_273;
      if (v15 - v18 < v195)
      {
        v82 = v18 + v195;
        if (__OFADD__(v18, v195))
          goto LABEL_276;
        if (v82 >= v199)
          v82 = v199;
        if (v82 < v18)
        {
LABEL_277:
          __break(1u);
          goto LABEL_278;
        }
        v197 = v82;
        if (v15 != v82)
        {
LABEL_118:
          v83 = v23 + 32 * v15;
          v84 = *(_QWORD *)(v83 + 16);
          v85 = *(_QWORD *)(v83 + 24);
          v206 = v15;
          v86 = v15;
          while (1)
          {
            v215 = v86 - 1;
            v218 = v86;
            v87 = v23 + 32 * (v86 - 1);
            v219 = *(_QWORD *)(v87 + 16);
            v88 = *(_QWORD *)(v87 + 24);
            if (!v85 || !a5)
              break;
            v89 = HIBYTE(v85) & 0xF;
            if ((v85 & 0x2000000000000000) == 0)
              v89 = v84 & 0xFFFFFFFFFFFFLL;
            if (!v89 || !v16)
              break;
            if (v84 != a4 || v85 != a5)
            {
              v212 = *(_QWORD *)(v87 + 24);
              v88 = v212;
              if ((sub_213EF3234() & 1) == 0)
              {
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                v94 = a5;
                v95 = sub_213EF28C8();
                v96 = sub_213EF28C8();
                v12 = (char *)(v95 + v96);
                if (__OFADD__(v95, v96))
                  goto LABEL_265;
                v97 = String.commonSequences(between:)(a4, v94, v84, v85);
                v98 = v97[2];
                if (v98)
                {
                  v224 = MEMORY[0x24BEE4AF8];
                  sub_213DCD3C4(0, v98, 0);
                  v99 = v224;
                  v100 = v97 + 5;
                  do
                  {
                    swift_bridgeObjectRetain();
                    v101 = sub_213EF28C8();
                    swift_bridgeObjectRelease();
                    v103 = *(_QWORD *)(v224 + 16);
                    v102 = *(_QWORD *)(v224 + 24);
                    if (v103 >= v102 >> 1)
                      sub_213DCD3C4(v102 > 1, v103 + 1, 1);
                    v100 += 2;
                    *(_QWORD *)(v224 + 16) = v103 + 1;
                    *(_QWORD *)(v224 + 8 * v103 + 32) = v101;
                    --v98;
                  }
                  while (v98);
                  swift_bridgeObjectRelease();
                }
                else
                {
                  swift_bridgeObjectRelease();
                  v99 = MEMORY[0x24BEE4AF8];
                }
                v113 = *(_QWORD *)(v99 + 16);
                a4 = between;
                v23 = v210;
                v114 = 0;
                if (v113)
                {
                  v115 = (uint64_t *)(v99 + 32);
                  a5 = (unint64_t)v205;
                  while (1)
                  {
                    v116 = *v115++;
                    v141 = __OFADD__(v114, v116);
                    v114 += v116;
                    if (v141)
                      break;
                    if (!--v113)
                      goto LABEL_163;
                  }
                  __break(1u);
LABEL_243:
                  v181 = v196;
                  if (v23 < 2)
                  {
LABEL_244:
                    swift_bridgeObjectRelease();
                    *(_QWORD *)(v181 + 16) = 0;
                    goto LABEL_245;
                  }
LABEL_229:
                  v182 = *v194;
                  v196 = v181;
                  v221 = *v194;
                  while (1)
                  {
                    v183 = v23 - 2;
                    if (v23 < 2)
                      goto LABEL_268;
                    if (!v182)
                      goto LABEL_283;
                    v184 = *(_QWORD *)&v12[16 * v183 + 32];
                    v185 = *(_QWORD *)&v12[16 * v23 + 24];
                    v186 = (char *)(v182 + 32 * v184);
                    v187 = (char *)(v182 + 32 * *(_QWORD *)&v12[16 * v23 + 16]);
                    v188 = (char *)(v182 + 32 * v185);
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                    sub_213EE2BFC(v186, v187, v188, __dst, a2, v201, between, v205);
                    if (v211)
                      goto LABEL_240;
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    if (v185 < v184)
                      goto LABEL_269;
                    v189 = v12;
                    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                      v189 = sub_213EE1ECC((uint64_t)v12);
                    if (v183 >= *((_QWORD *)v189 + 2))
                      goto LABEL_270;
                    v12 = v189;
                    v190 = v189 + 32;
                    v191 = &v189[16 * v183 + 32];
                    *(_QWORD *)v191 = v184;
                    *((_QWORD *)v191 + 1) = v185;
                    v192 = *((_QWORD *)v189 + 2);
                    if (v23 > v192)
                      goto LABEL_271;
                    memmove(&v190[16 * v23 - 16], &v190[16 * v23], 16 * (v192 - v23));
                    *((_QWORD *)v12 + 2) = v192 - 1;
                    v23 = v192 - 1;
                    v181 = v196;
                    v182 = v221;
                    if (v192 <= 2)
                      goto LABEL_244;
                  }
                }
                a5 = (unint64_t)v205;
LABEL_163:
                swift_bridgeObjectRelease();
                v90 = 2.0 / (double)(uint64_t)v12 * (double)v114;
                v16 = between_8;
                v88 = v212;
                v91 = v219;
                if (!v212)
                  goto LABEL_164;
                goto LABEL_131;
              }
            }
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v90 = 1.0;
            v91 = v219;
            if (!v88)
              goto LABEL_164;
LABEL_132:
            v92 = HIBYTE(v88) & 0xF;
            if ((v88 & 0x2000000000000000) == 0)
              v92 = v91 & 0xFFFFFFFFFFFFLL;
            if (v92 && v16)
            {
              if (v91 == a4 && v88 == a5 || (sub_213EF3234() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                v93 = v218;
                if (v90 <= 1.0)
                  goto LABEL_117;
              }
              else
              {
                v104 = sub_213EF28C8();
                v105 = sub_213EF28C8();
                if (__OFADD__(v104, v105))
                  goto LABEL_267;
                v198 = v104 + v105;
                v106 = String.commonSequences(between:)(a4, a5, v219, v88);
                v107 = v106[2];
                if (v107)
                {
                  v225 = MEMORY[0x24BEE4AF8];
                  sub_213DCD3C4(0, v107, 0);
                  v108 = v225;
                  v109 = v106 + 5;
                  do
                  {
                    swift_bridgeObjectRetain();
                    v110 = sub_213EF28C8();
                    swift_bridgeObjectRelease();
                    v112 = *(_QWORD *)(v225 + 16);
                    v111 = *(_QWORD *)(v225 + 24);
                    if (v112 >= v111 >> 1)
                      sub_213DCD3C4(v111 > 1, v112 + 1, 1);
                    v109 += 2;
                    *(_QWORD *)(v225 + 16) = v112 + 1;
                    *(_QWORD *)(v225 + 8 * v112 + 32) = v110;
                    --v107;
                  }
                  while (v107);
                  swift_bridgeObjectRelease();
                  a5 = (unint64_t)v205;
                  v23 = v210;
                }
                else
                {
                  swift_bridgeObjectRelease();
                  v108 = MEMORY[0x24BEE4AF8];
                }
                v121 = *(_QWORD *)(v108 + 16);
                a4 = between;
                v122 = 0;
                if (v121)
                {
                  v123 = (uint64_t *)(v108 + 32);
                  while (1)
                  {
                    v124 = *v123++;
                    v141 = __OFADD__(v122, v124);
                    v122 += v124;
                    if (v141)
                      break;
                    if (!--v121)
                      goto LABEL_173;
                  }
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
LABEL_258:
                  __break(1u);
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
                  __break(1u);
LABEL_265:
                  __break(1u);
LABEL_266:
                  __break(1u);
LABEL_267:
                  __break(1u);
LABEL_268:
                  __break(1u);
LABEL_269:
                  __break(1u);
LABEL_270:
                  __break(1u);
LABEL_271:
                  __break(1u);
LABEL_272:
                  __break(1u);
LABEL_273:
                  __break(1u);
LABEL_274:
                  __break(1u);
LABEL_275:
                  __break(1u);
LABEL_276:
                  __break(1u);
                  goto LABEL_277;
                }
LABEL_173:
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                v125 = 2.0 / (double)v198 * (double)v122;
                v16 = between_8;
                v93 = v218;
                if (v125 >= v90)
                  goto LABEL_117;
              }
              goto LABEL_165;
            }
LABEL_164:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v93 = v218;
            if (v90 <= 0.0)
              goto LABEL_117;
LABEL_165:
            if (!v23)
              goto LABEL_280;
            v117 = (_QWORD *)(v23 + 32 * v93);
            v118 = *v117;
            v119 = v117[1];
            v84 = v117[2];
            v85 = v117[3];
            v120 = *(_OWORD *)(v87 + 16);
            *(_OWORD *)v117 = *(_OWORD *)v87;
            *((_OWORD *)v117 + 1) = v120;
            *(_QWORD *)v87 = v118;
            *(_QWORD *)(v87 + 8) = v119;
            *(_QWORD *)(v87 + 16) = v84;
            *(_QWORD *)(v87 + 24) = v85;
            v86 = v215;
            if (v215 == v213)
            {
LABEL_117:
              v15 = v206 + 1;
              if (v206 + 1 == v197)
              {
                v15 = v197;
                goto LABEL_176;
              }
              goto LABEL_118;
            }
          }
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v90 = 0.0;
          v91 = v219;
          if (!v88)
            goto LABEL_164;
LABEL_131:
          if (!a5)
            goto LABEL_164;
          goto LABEL_132;
        }
      }
    }
LABEL_176:
    if (v15 < v213)
      goto LABEL_272;
    v12 = v203;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = sub_213EE1C74(0, *((_QWORD *)v203 + 2) + 1, 1, v203);
    v127 = *((_QWORD *)v12 + 2);
    v126 = *((_QWORD *)v12 + 3);
    v23 = v127 + 1;
    if (v127 >= v126 >> 1)
      v12 = sub_213EE1C74((char *)(v126 > 1), v127 + 1, 1, v12);
    *((_QWORD *)v12 + 2) = v23;
    v128 = v12 + 32;
    v129 = &v12[16 * v127 + 32];
    *(_QWORD *)v129 = v213;
    *((_QWORD *)v129 + 1) = v15;
    if (!v127)
    {
      v23 = 1;
LABEL_225:
      v17 = v199;
      if (v15 >= v199)
        goto LABEL_243;
      continue;
    }
    break;
  }
  v204 = v12;
  v207 = v15;
  v220 = v12 + 32;
  while (2)
  {
    v130 = v23 - 1;
    if (v23 >= 4)
    {
      v135 = &v128[16 * v23];
      v136 = *((_QWORD *)v135 - 8);
      v137 = *((_QWORD *)v135 - 7);
      v141 = __OFSUB__(v137, v136);
      v138 = v137 - v136;
      if (v141)
        goto LABEL_254;
      v140 = *((_QWORD *)v135 - 6);
      v139 = *((_QWORD *)v135 - 5);
      v141 = __OFSUB__(v139, v140);
      v133 = v139 - v140;
      v134 = v141;
      if (v141)
        goto LABEL_255;
      v142 = v23 - 2;
      v143 = &v128[16 * v23 - 32];
      v145 = *(_QWORD *)v143;
      v144 = *((_QWORD *)v143 + 1);
      v141 = __OFSUB__(v144, v145);
      v146 = v144 - v145;
      if (v141)
        goto LABEL_257;
      v141 = __OFADD__(v133, v146);
      v147 = v133 + v146;
      if (v141)
        goto LABEL_260;
      if (v147 >= v138)
      {
        v165 = &v128[16 * v130];
        v167 = *(_QWORD *)v165;
        v166 = *((_QWORD *)v165 + 1);
        v141 = __OFSUB__(v166, v167);
        v168 = v166 - v167;
        if (v141)
          goto LABEL_266;
        v158 = v133 < v168;
      }
      else
      {
LABEL_196:
        if ((v134 & 1) != 0)
          goto LABEL_256;
        v142 = v23 - 2;
        v148 = &v128[16 * v23 - 32];
        v150 = *(_QWORD *)v148;
        v149 = *((_QWORD *)v148 + 1);
        v151 = __OFSUB__(v149, v150);
        v152 = v149 - v150;
        v153 = v151;
        if (v151)
          goto LABEL_259;
        v154 = &v128[16 * v130];
        v156 = *(_QWORD *)v154;
        v155 = *((_QWORD *)v154 + 1);
        v141 = __OFSUB__(v155, v156);
        v157 = v155 - v156;
        if (v141)
          goto LABEL_262;
        if (__OFADD__(v152, v157))
          goto LABEL_263;
        if (v152 + v157 < v133)
          goto LABEL_208;
        v158 = v133 < v157;
      }
      if (v158)
        v130 = v142;
    }
    else
    {
      if (v23 == 3)
      {
        v132 = *((_QWORD *)v12 + 4);
        v131 = *((_QWORD *)v12 + 5);
        v141 = __OFSUB__(v131, v132);
        v133 = v131 - v132;
        v134 = v141;
        goto LABEL_196;
      }
      v159 = *((_QWORD *)v12 + 4);
      v160 = *((_QWORD *)v12 + 5);
      v141 = __OFSUB__(v160, v159);
      v152 = v160 - v159;
      v153 = v141;
LABEL_208:
      if ((v153 & 1) != 0)
        goto LABEL_258;
      v161 = &v128[16 * v130];
      v163 = *(_QWORD *)v161;
      v162 = *((_QWORD *)v161 + 1);
      v141 = __OFSUB__(v162, v163);
      v164 = v162 - v163;
      if (v141)
        goto LABEL_261;
      if (v164 < v152)
        goto LABEL_225;
    }
    v169 = v130 - 1;
    if (v130 - 1 >= v23)
      goto LABEL_249;
    if (!v210)
      goto LABEL_281;
    v170 = &v128[16 * v169];
    v171 = v128;
    v172 = *(_QWORD *)v170;
    v173 = v130;
    v174 = &v171[16 * v130];
    v175 = *((_QWORD *)v174 + 1);
    v176 = (char *)(v210 + 32 * *(_QWORD *)v170);
    v177 = (char *)(v210 + 32 * *(_QWORD *)v174);
    swift_bridgeObjectRetain();
    a5 = (unint64_t)v205;
    swift_bridgeObjectRetain();
    v178 = v177;
    a4 = between;
    sub_213EE2BFC(v176, v178, (char *)(v210 + 32 * v175), __dst, a2, v201, between, v205);
    if (!v211)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v175 < v172)
        goto LABEL_250;
      if (v173 > *((_QWORD *)v204 + 2))
        goto LABEL_251;
      v179 = v173;
      *(_QWORD *)v170 = v172;
      v128 = v220;
      *(_QWORD *)&v220[16 * v169 + 8] = v175;
      v180 = *((_QWORD *)v204 + 2);
      if (v179 >= v180)
        goto LABEL_252;
      v12 = v204;
      v23 = v180 - 1;
      memmove(v174, v174 + 16, 16 * (v180 - 1 - v179));
      *((_QWORD *)v204 + 2) = v180 - 1;
      v158 = v180 > 2;
      v16 = between_8;
      v15 = v207;
      if (!v158)
        goto LABEL_225;
      continue;
    }
    break;
  }
LABEL_240:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v196 + 16) = 0;
LABEL_241:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_213EE4B08(_QWORD **a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5)
{
  _QWORD *v10;
  uint64_t v11;
  uint64_t v13[2];

  v10 = *a1;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v10 = (_QWORD *)sub_213EE1C60(v10);
  v11 = v10[2];
  v13[0] = (uint64_t)(v10 + 4);
  v13[1] = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_213EE3748(v13, a2, a3, a4, a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *a1 = v10;
  swift_bridgeObjectRelease_n();
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_213EE4BF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  Swift::String v9;
  double v10;
  char v11;
  char v12;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  Swift::Double_optional v26;

  v6 = *(_QWORD *)(a3 + 8);
  v7 = *(_QWORD *)(a6 + 8);
  if (v7)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    sub_213EF2898();
    v9._countAndFlagsBits = sub_213EF2898();
    v26 = String.scoreRatcliffObershelp(between:)(v9);
    v10 = *(double *)&v26.is_nil;
    v12 = v11;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v12 & 1) == 0 && v10 >= 0.9)
      return 1;
  }
  if (qword_253F04A88 != -1)
    swift_once();
  v14 = sub_213EF2724();
  __swift_project_value_buffer(v14, (uint64_t)qword_253F08A00);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v15 = sub_213EF270C();
  v16 = sub_213EF2C94();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc();
    v24 = swift_slowAlloc();
    v25 = v24;
    *(_DWORD *)v17 = 136315650;
    if (qword_254D3A0C0 != -1)
      swift_once();
    v19 = qword_254D40D18;
    v18 = unk_254D40D20;
    swift_bridgeObjectRetain();
    sub_213DB0570(v19, v18, &v25);
    sub_213EF2D9C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    if (v6)
    {
      swift_bridgeObjectRetain();
      sub_213EF2EB0();
      swift_bridgeObjectRelease();
      sub_213EF2904();
      sub_213EF2904();
      swift_bridgeObjectRelease();
      v21 = 0x746F6C536E727554;
      v20 = 0xEF222865756C6156;
    }
    else
    {
      v21 = 0xD000000000000019;
      swift_bridgeObjectRelease();
      v20 = 0x8000000213F06650;
    }
    sub_213DB0570(v21, v20, &v25);
    sub_213EF2D9C();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 22) = 2080;
    if (v7)
    {
      swift_bridgeObjectRetain();
      sub_213EF2EB0();
      swift_bridgeObjectRelease();
      sub_213EF2904();
      sub_213EF2904();
      swift_bridgeObjectRelease();
      v23 = 0x746F6C536E727554;
      v22 = 0xEF222865756C6156;
    }
    else
    {
      v23 = 0xD000000000000019;
      swift_bridgeObjectRelease();
      v22 = 0x8000000213F06650;
    }
    sub_213DB0570(v23, v22, &v25);
    sub_213EF2D9C();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_213DAB000, v15, v16, "%s REJECT - Moved slots are not sufficiently similar (from: %s), to: %s)", (uint8_t *)v17, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2199C53C4](v24, -1, -1);
    MEMORY[0x2199C53C4](v17, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  return 0;
}

uint64_t sub_213EE5088()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_213EE50AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 80);
  v5 = *(_QWORD *)(a1 + 88);
  v6 = *(_QWORD *)(a1 + 96);
  v7 = *(_QWORD *)(a1 + 104);
  v8 = *(_QWORD *)(a1 + 112);
  v9 = *(_BYTE *)(a1 + 120);
  sub_213EE2798(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 56));
  sub_213EE2798(v2, v3, v4, v5, v6, v7, v8, v9);
  return a1;
}

uint64_t dispatch thunk of CandidateProvider.search(query:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of CandidateProvider.update(query:candidates:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t PimsSuggestionMetadata.pimsId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_213EF1D64();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t PimsSuggestionMetadata.locality.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for PimsSuggestionMetadata();
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 20));
  return result;
}

uint64_t type metadata accessor for PimsSuggestionMetadata()
{
  uint64_t result;

  result = qword_254D41008;
  if (!qword_254D41008)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t PimsSuggestionMetadata.serverTreatment.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for PimsSuggestionMetadata();
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 24));
  return result;
}

uint64_t PimsSuggestionMetadata.clientTreatment.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for PimsSuggestionMetadata();
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 28));
  return result;
}

uint64_t PimsSuggestionMetadata.suggestionSurfaced.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for PimsSuggestionMetadata();
  return sub_213DCC3D8(v1 + *(int *)(v3 + 32), a1, &qword_254D40EF0);
}

uint64_t PimsSuggestionMetadata.noveltyState.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for PimsSuggestionMetadata();
  return sub_213DCC3D8(v1 + *(int *)(v3 + 36), a1, &qword_254D40EF8);
}

uint64_t PimsSuggestionMetadata.redundancyState.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for PimsSuggestionMetadata();
  return sub_213DCC3D8(v1 + *(int *)(v3 + 40), a1, &qword_254D40F00);
}

uint64_t PimsSuggestionMetadata.init(pimsId:locality:serverTreatment:clientTreatment:suggestionSurfaced:noveltyState:redundancyState:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  char v13;
  char v14;
  char v15;
  uint64_t v16;
  int *v17;

  v13 = *a2;
  v14 = *a3;
  v15 = *a4;
  v16 = sub_213EF1D64();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(a8, a1, v16);
  v17 = (int *)type metadata accessor for PimsSuggestionMetadata();
  *(_BYTE *)(a8 + v17[5]) = v13;
  *(_BYTE *)(a8 + v17[6]) = v14;
  *(_BYTE *)(a8 + v17[7]) = v15;
  sub_213DC0630(a5, a8 + v17[8], &qword_254D40EF0);
  sub_213DC0630(a6, a8 + v17[9], &qword_254D40EF8);
  return sub_213DC0630(a7, a8 + v17[10], &qword_254D40F00);
}

BOOL static PimsLocality.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PimsLocality.hash(into:)()
{
  return sub_213EF3300();
}

uint64_t sub_213EE541C()
{
  sub_213EE591C();
  return sub_213EF3354();
}

uint64_t sub_213EE5444()
{
  sub_213EE591C();
  return sub_213EF3360();
}

uint64_t sub_213EE546C()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x7972617262696CLL;
  if (*v0 != 1)
    v1 = 0x7261506472696874;
  if (*v0)
    return v1;
  else
    return 0x676F6C61746163;
}

uint64_t sub_213EE54CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_213EE7558(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_213EE54F0()
{
  sub_213EE5850();
  return sub_213EF3354();
}

uint64_t sub_213EE5518()
{
  sub_213EE5850();
  return sub_213EF3360();
}

uint64_t sub_213EE5540()
{
  sub_213EE58D8();
  return sub_213EF3354();
}

uint64_t sub_213EE5568()
{
  sub_213EE58D8();
  return sub_213EF3360();
}

uint64_t sub_213EE5590()
{
  sub_213EE5894();
  return sub_213EF3354();
}

uint64_t sub_213EE55B8()
{
  sub_213EE5894();
  return sub_213EF3360();
}

void *static PimsLocality.allCases.getter()
{
  return &unk_24D100CE8;
}

uint64_t PimsLocality.encode(to:)(_QWORD *a1)
{
  unsigned __int8 *v1;
  unsigned __int8 *v2;
  uint64_t v4;
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
  int v15;
  char *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40F08);
  v22 = *(_QWORD *)(v4 - 8);
  v23 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v21 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40F10);
  v19 = *(_QWORD *)(v6 - 8);
  v20 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40F18);
  v9 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40F20);
  v24 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_213EE5850();
  sub_213EF3348();
  if (v15)
  {
    if (v15 == 1)
    {
      v26 = 1;
      sub_213EE58D8();
      sub_213EF3168();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v20);
    }
    else
    {
      v27 = 2;
      sub_213EE5894();
      v16 = v21;
      sub_213EF3168();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v23);
    }
  }
  else
  {
    v25 = 0;
    sub_213EE591C();
    sub_213EF3168();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v18);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v14, v12);
}

unint64_t sub_213EE5850()
{
  unint64_t result;

  result = qword_254D40F28;
  if (!qword_254D40F28)
  {
    result = MEMORY[0x2199C52D4](&unk_213F03990, &type metadata for PimsLocality.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D40F28);
  }
  return result;
}

unint64_t sub_213EE5894()
{
  unint64_t result;

  result = qword_254D40F30;
  if (!qword_254D40F30)
  {
    result = MEMORY[0x2199C52D4](&unk_213F03940, &type metadata for PimsLocality.ThirdPartyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D40F30);
  }
  return result;
}

unint64_t sub_213EE58D8()
{
  unint64_t result;

  result = qword_254D40F38;
  if (!qword_254D40F38)
  {
    result = MEMORY[0x2199C52D4](&unk_213F038F0, &type metadata for PimsLocality.LibraryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D40F38);
  }
  return result;
}

unint64_t sub_213EE591C()
{
  unint64_t result;

  result = qword_254D40F40;
  if (!qword_254D40F40)
  {
    result = MEMORY[0x2199C52D4](&unk_213F038A0, &type metadata for PimsLocality.CatalogCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D40F40);
  }
  return result;
}

uint64_t PimsLocality.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE *v38;
  char *v39;
  char *v40;
  _QWORD *v41;
  char v42;
  char v43;
  char v44;

  v38 = a2;
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40F48);
  v34 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v40 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40F50);
  v35 = *(_QWORD *)(v4 - 8);
  v36 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v39 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40F58);
  v6 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40F60);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_213EE5850();
  v13 = v41;
  sub_213EF333C();
  if (v13)
    goto LABEL_7;
  v31 = v6;
  v32 = v10;
  v14 = v39;
  v15 = v40;
  v41 = a1;
  v16 = v12;
  v17 = sub_213EF3150();
  v18 = v9;
  if (*(_QWORD *)(v17 + 16) != 1)
  {
    v23 = sub_213EF2F34();
    swift_allocError();
    v25 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D3A900);
    *v25 = &type metadata for PimsLocality;
    sub_213EF30F0();
    sub_213EF2F28();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x24BEE26D0], v23);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v9);
    a1 = v41;
LABEL_7:
    v26 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1Tm(v26);
  }
  v19 = *(unsigned __int8 *)(v17 + 32);
  if (*(_BYTE *)(v17 + 32))
  {
    if (v19 == 1)
    {
      v43 = 1;
      sub_213EE58D8();
      v20 = v9;
      sub_213EF30E4();
      v21 = v38;
      v22 = v32;
      (*(void (**)(char *, uint64_t))(v35 + 8))(v14, v36);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v20);
    }
    else
    {
      v44 = 2;
      sub_213EE5894();
      v28 = v15;
      sub_213EF30E4();
      v21 = v38;
      v29 = v32;
      (*(void (**)(char *, uint64_t))(v34 + 8))(v28, v37);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v16, v18);
    }
  }
  else
  {
    v42 = 0;
    sub_213EE591C();
    sub_213EF30E4();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v33);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v9);
    v21 = v38;
  }
  *v21 = v19;
  v26 = (uint64_t)v41;
  return __swift_destroy_boxed_opaque_existential_1Tm(v26);
}

void sub_213EE5DA8(_QWORD *a1@<X8>)
{
  *a1 = &unk_24D100D10;
}

uint64_t sub_213EE5DB8@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return PimsLocality.init(from:)(a1, a2);
}

uint64_t sub_213EE5DCC(_QWORD *a1)
{
  return PimsLocality.encode(to:)(a1);
}

void *static PimsServerTreatment.allCases.getter()
{
  return &unk_24D100D38;
}

void sub_213EE5DF0(_QWORD *a1@<X8>)
{
  *a1 = &unk_24D100D38;
}

void *static PimsClientTreatment.allCases.getter()
{
  return &unk_24D100D68;
}

unint64_t sub_213EE5E14()
{
  unint64_t result;

  result = qword_254D40F68;
  if (!qword_254D40F68)
  {
    result = MEMORY[0x2199C52D4](&protocol conformance descriptor for PimsLocality, &type metadata for PimsLocality);
    atomic_store(result, (unint64_t *)&qword_254D40F68);
  }
  return result;
}

uint64_t sub_213EE5E58()
{
  return sub_213DB9C60(&qword_254D40F70, &qword_254D40F78);
}

unint64_t sub_213EE5E80()
{
  unint64_t result;

  result = qword_254D40F80;
  if (!qword_254D40F80)
  {
    result = MEMORY[0x2199C52D4](&protocol conformance descriptor for PimsServerTreatment, &type metadata for PimsServerTreatment);
    atomic_store(result, (unint64_t *)&qword_254D40F80);
  }
  return result;
}

uint64_t sub_213EE5EC4()
{
  return sub_213DB9C60(&qword_254D40F88, &qword_254D40F90);
}

unint64_t sub_213EE5EEC()
{
  unint64_t result;

  result = qword_254D40F98;
  if (!qword_254D40F98)
  {
    result = MEMORY[0x2199C52D4](&protocol conformance descriptor for PimsClientTreatment, &type metadata for PimsClientTreatment);
    atomic_store(result, (unint64_t *)&qword_254D40F98);
  }
  return result;
}

uint64_t sub_213EE5F30()
{
  return sub_213DB9C60(&qword_254D40FA0, &qword_254D40FA8);
}

void sub_213EE5F54(_QWORD *a1@<X8>)
{
  *a1 = &unk_24D100D68;
}

_QWORD *initializeBufferWithCopyOfBuffer for PimsSuggestionMetadata(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_213EF1D64();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    *((_BYTE *)a1 + v8) = *((_BYTE *)a2 + v8);
    v9 = a3[8];
    *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_213EF25BC();
    v13 = *(_QWORD *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40EF0);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    v16 = a3[9];
    v17 = (char *)a1 + v16;
    v18 = (char *)a2 + v16;
    v19 = sub_213EF258C();
    v20 = *(_QWORD *)(v19 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
    {
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40EF8);
      memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
    }
    v22 = a3[10];
    v23 = (char *)a1 + v22;
    v24 = (char *)a2 + v22;
    v25 = sub_213EF25D4();
    v26 = *(_QWORD *)(v25 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25))
    {
      v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40F00);
      memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v23, v24, v25);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
    }
  }
  return a1;
}

uint64_t destroy for PimsSuggestionMetadata(uint64_t a1, int *a2)
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
  uint64_t result;

  v4 = sub_213EF1D64();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + a2[8];
  v6 = sub_213EF25BC();
  v7 = *(_QWORD *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  v8 = a1 + a2[9];
  v9 = sub_213EF258C();
  v10 = *(_QWORD *)(v9 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  v11 = a1 + a2[10];
  v12 = sub_213EF25D4();
  v13 = *(_QWORD *)(v12 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  return result;
}

uint64_t initializeWithCopy for PimsSuggestionMetadata(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v6 = sub_213EF1D64();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  v8 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  v11 = sub_213EF25BC();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40EF0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v14 = a3[9];
  v15 = (void *)(a1 + v14);
  v16 = (const void *)(a2 + v14);
  v17 = sub_213EF258C();
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40EF8);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 16))(v15, v16, v17);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  v20 = a3[10];
  v21 = (void *)(a1 + v20);
  v22 = (const void *)(a2 + v20);
  v23 = sub_213EF25D4();
  v24 = *(_QWORD *)(v23 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40F00);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v24 + 16))(v21, v22, v23);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  return a1;
}

uint64_t assignWithCopy for PimsSuggestionMetadata(uint64_t a1, uint64_t a2, int *a3)
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
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(void *, uint64_t, uint64_t);
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(void *, uint64_t, uint64_t);
  int v31;
  int v32;
  uint64_t v33;

  v6 = sub_213EF1D64();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  v7 = a3[8];
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_213EF25BC();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40EF0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
LABEL_7:
  v16 = a3[9];
  v17 = (void *)(a1 + v16);
  v18 = (void *)(a2 + v16);
  v19 = sub_213EF258C();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v20 + 48);
  v22 = v21(v17, 1, v19);
  v23 = v21(v18, 1, v19);
  if (v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v20 + 16))(v17, v18, v19);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v23)
  {
    (*(void (**)(void *, uint64_t))(v20 + 8))(v17, v19);
LABEL_12:
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40EF8);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v20 + 24))(v17, v18, v19);
LABEL_13:
  v25 = a3[10];
  v26 = (void *)(a1 + v25);
  v27 = (void *)(a2 + v25);
  v28 = sub_213EF25D4();
  v29 = *(_QWORD *)(v28 - 8);
  v30 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v29 + 48);
  v31 = v30(v26, 1, v28);
  v32 = v30(v27, 1, v28);
  if (!v31)
  {
    if (!v32)
    {
      (*(void (**)(void *, void *, uint64_t))(v29 + 24))(v26, v27, v28);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v29 + 8))(v26, v28);
    goto LABEL_18;
  }
  if (v32)
  {
LABEL_18:
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40F00);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v29 + 16))(v26, v27, v28);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
  return a1;
}

uint64_t initializeWithTake for PimsSuggestionMetadata(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v6 = sub_213EF1D64();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  v8 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  v11 = sub_213EF25BC();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40EF0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v14 = a3[9];
  v15 = (void *)(a1 + v14);
  v16 = (const void *)(a2 + v14);
  v17 = sub_213EF258C();
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40EF8);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 32))(v15, v16, v17);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  v20 = a3[10];
  v21 = (void *)(a1 + v20);
  v22 = (const void *)(a2 + v20);
  v23 = sub_213EF25D4();
  v24 = *(_QWORD *)(v23 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40F00);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v24 + 32))(v21, v22, v23);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  return a1;
}

uint64_t assignWithTake for PimsSuggestionMetadata(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(void *, uint64_t, uint64_t);
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(void *, uint64_t, uint64_t);
  int v32;
  int v33;
  uint64_t v34;

  v6 = sub_213EF1D64();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  v8 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  v9 = (void *)(a1 + v8);
  v10 = (void *)(a2 + v8);
  v11 = sub_213EF25BC();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 32))(v9, v10, v11);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v15)
  {
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
LABEL_6:
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40EF0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 40))(v9, v10, v11);
LABEL_7:
  v17 = a3[9];
  v18 = (void *)(a1 + v17);
  v19 = (void *)(a2 + v17);
  v20 = sub_213EF258C();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v21 + 48);
  v23 = v22(v18, 1, v20);
  v24 = v22(v19, 1, v20);
  if (v23)
  {
    if (!v24)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 32))(v18, v19, v20);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v24)
  {
    (*(void (**)(void *, uint64_t))(v21 + 8))(v18, v20);
LABEL_12:
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40EF8);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v21 + 40))(v18, v19, v20);
LABEL_13:
  v26 = a3[10];
  v27 = (void *)(a1 + v26);
  v28 = (void *)(a2 + v26);
  v29 = sub_213EF25D4();
  v30 = *(_QWORD *)(v29 - 8);
  v31 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v30 + 48);
  v32 = v31(v27, 1, v29);
  v33 = v31(v28, 1, v29);
  if (!v32)
  {
    if (!v33)
    {
      (*(void (**)(void *, void *, uint64_t))(v30 + 40))(v27, v28, v29);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v30 + 8))(v27, v29);
    goto LABEL_18;
  }
  if (v33)
  {
LABEL_18:
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40F00);
    memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v30 + 32))(v27, v28, v29);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
  return a1;
}

uint64_t getEnumTagSinglePayload for PimsSuggestionMetadata()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_213EE6C90(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = sub_213EF1D64();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  if ((_DWORD)a2 == 252)
  {
    if (*(unsigned __int8 *)(a1 + a3[5]) <= 3u)
      v9 = 3;
    else
      v9 = *(unsigned __int8 *)(a1 + a3[5]);
    v10 = v9 - 3;
    if (*(unsigned __int8 *)(a1 + a3[5]) >= 3u)
      return v10;
    else
      return 0;
  }
  else
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40EF0);
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v13 = v11;
      v14 = a3[8];
    }
    else
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40EF8);
      v12 = *(_QWORD *)(v15 - 8);
      if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
      {
        v13 = v15;
        v14 = a3[9];
      }
      else
      {
        v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40F00);
        v12 = *(_QWORD *)(v13 - 8);
        v14 = a3[10];
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1 + v14, a2, v13);
  }
}

uint64_t storeEnumTagSinglePayload for PimsSuggestionMetadata()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_213EE6D9C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  result = sub_213EF1D64();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 252)
    {
      *(_BYTE *)(a1 + a4[5]) = a2 + 3;
      return result;
    }
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40EF0);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = a4[8];
    }
    else
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40EF8);
      v14 = *(_QWORD *)(v16 - 8);
      if (*(_DWORD *)(v14 + 84) == a3)
      {
        v10 = v16;
        v15 = a4[9];
      }
      else
      {
        v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D40F00);
        v14 = *(_QWORD *)(v10 - 8);
        v15 = a4[10];
      }
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_213EE6E90()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_213EF1D64();
  if (v0 <= 0x3F)
  {
    sub_213DDF4EC(319, &qword_254D41018, (void (*)(uint64_t))MEMORY[0x24BEA51E0]);
    if (v1 <= 0x3F)
    {
      sub_213DDF4EC(319, &qword_254D41020, (void (*)(uint64_t))MEMORY[0x24BEA51A8]);
      if (v2 <= 0x3F)
      {
        sub_213DDF4EC(319, qword_254D41028, (void (*)(uint64_t))MEMORY[0x24BEA5220]);
        if (v3 <= 0x3F)
          swift_initStructMetadata();
      }
    }
  }
}

ValueMetadata *type metadata accessor for PimsLocality()
{
  return &type metadata for PimsLocality;
}

uint64_t storeEnumTagSinglePayload for PimsServerTreatment(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_213EE6FF8 + 4 * byte_213F032C5[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_213EE702C + 4 * asc_213F032C0[v4]))();
}

uint64_t sub_213EE702C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213EE7034(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213EE703CLL);
  return result;
}

uint64_t sub_213EE7048(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x213EE7050);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_213EE7054(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213EE705C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PimsServerTreatment()
{
  return &type metadata for PimsServerTreatment;
}

uint64_t getEnumTagSinglePayload for PimsClientTreatment(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PimsClientTreatment(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_213EE7154 + 4 * byte_213F032CF[v4]))();
  *a1 = a2 + 13;
  return ((uint64_t (*)(void))((char *)sub_213EE7188 + 4 * byte_213F032CA[v4]))();
}

uint64_t sub_213EE7188(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213EE7190(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213EE7198);
  return result;
}

uint64_t sub_213EE71A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x213EE71ACLL);
  *(_BYTE *)result = a2 + 13;
  return result;
}

uint64_t sub_213EE71B0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213EE71B8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PimsClientTreatment()
{
  return &type metadata for PimsClientTreatment;
}

uint64_t _s28SiriPrivateLearningInference12PimsLocalityOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_213EE7220 + 4 * byte_213F032D9[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_213EE7254 + 4 * byte_213F032D4[v4]))();
}

uint64_t sub_213EE7254(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213EE725C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213EE7264);
  return result;
}

uint64_t sub_213EE7270(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x213EE7278);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_213EE727C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213EE7284(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PimsLocality.CodingKeys()
{
  return &type metadata for PimsLocality.CodingKeys;
}

ValueMetadata *type metadata accessor for PimsLocality.CatalogCodingKeys()
{
  return &type metadata for PimsLocality.CatalogCodingKeys;
}

ValueMetadata *type metadata accessor for PimsLocality.LibraryCodingKeys()
{
  return &type metadata for PimsLocality.LibraryCodingKeys;
}

ValueMetadata *type metadata accessor for PimsLocality.ThirdPartyCodingKeys()
{
  return &type metadata for PimsLocality.ThirdPartyCodingKeys;
}

unint64_t sub_213EE72D4()
{
  unint64_t result;

  result = qword_254D41070;
  if (!qword_254D41070)
  {
    result = MEMORY[0x2199C52D4](&unk_213F03878, &type metadata for PimsLocality.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D41070);
  }
  return result;
}

unint64_t sub_213EE731C()
{
  unint64_t result;

  result = qword_254D41078;
  if (!qword_254D41078)
  {
    result = MEMORY[0x2199C52D4](&unk_213F03798, &type metadata for PimsLocality.CatalogCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D41078);
  }
  return result;
}

unint64_t sub_213EE7364()
{
  unint64_t result;

  result = qword_254D41080;
  if (!qword_254D41080)
  {
    result = MEMORY[0x2199C52D4](&unk_213F037C0, &type metadata for PimsLocality.CatalogCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D41080);
  }
  return result;
}

unint64_t sub_213EE73AC()
{
  unint64_t result;

  result = qword_254D41088;
  if (!qword_254D41088)
  {
    result = MEMORY[0x2199C52D4](&unk_213F03748, &type metadata for PimsLocality.LibraryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D41088);
  }
  return result;
}

unint64_t sub_213EE73F4()
{
  unint64_t result;

  result = qword_254D41090;
  if (!qword_254D41090)
  {
    result = MEMORY[0x2199C52D4](&unk_213F03770, &type metadata for PimsLocality.LibraryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D41090);
  }
  return result;
}

unint64_t sub_213EE743C()
{
  unint64_t result;

  result = qword_254D41098;
  if (!qword_254D41098)
  {
    result = MEMORY[0x2199C52D4](&unk_213F036F8, &type metadata for PimsLocality.ThirdPartyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D41098);
  }
  return result;
}

unint64_t sub_213EE7484()
{
  unint64_t result;

  result = qword_254D410A0;
  if (!qword_254D410A0)
  {
    result = MEMORY[0x2199C52D4](&unk_213F03720, &type metadata for PimsLocality.ThirdPartyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D410A0);
  }
  return result;
}

unint64_t sub_213EE74CC()
{
  unint64_t result;

  result = qword_254D410A8;
  if (!qword_254D410A8)
  {
    result = MEMORY[0x2199C52D4](&unk_213F037E8, &type metadata for PimsLocality.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D410A8);
  }
  return result;
}

unint64_t sub_213EE7514()
{
  unint64_t result;

  result = qword_254D410B0;
  if (!qword_254D410B0)
  {
    result = MEMORY[0x2199C52D4](&unk_213F03810, &type metadata for PimsLocality.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254D410B0);
  }
  return result;
}

uint64_t sub_213EE7558(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x676F6C61746163 && a2 == 0xE700000000000000;
  if (v2 || (sub_213EF3234() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7972617262696CLL && a2 == 0xE700000000000000 || (sub_213EF3234() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7261506472696874 && a2 == 0xEA00000000007974)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_213EF3234();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t NowPlayingFeatures.MediaType.__allocating_init(value:)()
{
  swift_allocObject();
  return sub_213EF23C4();
}

{
  swift_allocObject();
  return sub_213EF23B8();
}

BOOL static NowPlayingPlaybackState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

SiriPrivateLearningInference::NowPlayingPlayFinishedReason __swiftcall NowPlayingPlaybackState.asEndReason()()
{
  _BYTE *v0;
  _BYTE *v1;
  SiriPrivateLearningInference::NowPlayingPlayFinishedReason result;

  *v0 = 0x405030100uLL >> (8 * *v1);
  return result;
}

uint64_t _s28SiriPrivateLearningInference18NowPlayingFeaturesO13PlaybackStateC5valueAeA0efhI0O_tcfC_0()
{
  swift_allocObject();
  return sub_213EF23C4();
}

uint64_t NowPlayingFeatures.PlaybackState.init(value:)()
{
  return sub_213EF23C4();
}

{
  return sub_213EF23B8();
}

uint64_t NowPlayingFeatures.PlaybackState.__deallocating_deinit()
{
  _s28SiriPrivateLearningInference13CommonFeatureO09DonatedByA0Cfd_0();
  return swift_deallocClassInstance();
}

uint64_t sub_213EE7834(uint64_t a1)
{
  return sub_213E0F244(a1, (void (*)(_QWORD))type metadata accessor for NowPlayingFeatures.Title);
}

uint64_t sub_213EE7840(uint64_t a1)
{
  return sub_213E0F2A0(a1, (void (*)(_QWORD))type metadata accessor for NowPlayingFeatures.Title);
}

uint64_t sub_213EE7858(uint64_t a1)
{
  return sub_213E0F244(a1, (void (*)(_QWORD))type metadata accessor for NowPlayingFeatures.Artist);
}

uint64_t sub_213EE7864(uint64_t a1)
{
  return sub_213E0F2A0(a1, (void (*)(_QWORD))type metadata accessor for NowPlayingFeatures.Artist);
}

uint64_t sub_213EE787C(uint64_t a1)
{
  return sub_213E0F244(a1, (void (*)(_QWORD))type metadata accessor for NowPlayingFeatures.Album);
}

uint64_t sub_213EE7888(uint64_t a1)
{
  return sub_213E0F2A0(a1, (void (*)(_QWORD))type metadata accessor for NowPlayingFeatures.Album);
}

uint64_t sub_213EE78A0(uint64_t a1)
{
  return sub_213E0F244(a1, (void (*)(_QWORD))type metadata accessor for NowPlayingFeatures.Genre);
}

uint64_t sub_213EE78AC(uint64_t a1)
{
  return sub_213E0F2A0(a1, (void (*)(_QWORD))type metadata accessor for NowPlayingFeatures.Genre);
}

uint64_t NowPlayingFeatures.MediaType.init(value:)()
{
  return sub_213EF23C4();
}

{
  return sub_213EF23B8();
}

uint64_t sub_213EE7958(uint64_t a1)
{
  return sub_213E0EEF0(a1, (void (*)(_QWORD))type metadata accessor for NowPlayingFeatures.Duration);
}

uint64_t sub_213EE7964(uint64_t a1)
{
  return sub_213E0EF4C(a1, (void (*)(_QWORD))type metadata accessor for NowPlayingFeatures.Duration);
}

uint64_t sub_213EE797C(uint64_t a1)
{
  return sub_213E0F244(a1, (void (*)(_QWORD))type metadata accessor for NowPlayingFeatures.ITunesStoreIdentifier);
}

uint64_t sub_213EE7988(uint64_t a1)
{
  return sub_213E0F2A0(a1, (void (*)(_QWORD))type metadata accessor for NowPlayingFeatures.ITunesStoreIdentifier);
}

uint64_t NowPlayingFeatures.TotalPlayLength.init(value:)()
{
  return sub_213EF23C4();
}

uint64_t sub_213EE79C0(uint64_t a1)
{
  return sub_213E0EEF0(a1, (void (*)(_QWORD))type metadata accessor for NowPlayingFeatures.TotalPlayLength);
}

uint64_t sub_213EE79CC(uint64_t a1)
{
  return sub_213E0EF4C(a1, (void (*)(_QWORD))type metadata accessor for NowPlayingFeatures.TotalPlayLength);
}

uint64_t _s28SiriPrivateLearningInference18NowPlayingFeaturesO13PlaybackStateC5valueAESgAA0efhI0OSg_tcfC_0()
{
  swift_allocObject();
  return sub_213EF23B8();
}

uint64_t NowPlayingPlaybackState.hash(into:)()
{
  return sub_213EF3300();
}

uint64_t _s28SiriPrivateLearningInference19NowPlayingMediaTypeO2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  v5 = a2[1];
  switch(v3)
  {
    case 0uLL:
      if (v5)
        goto LABEL_13;
      v3 = 0;
      v6 = 1;
      break;
    case 1uLL:
      if (v5 != 1)
        goto LABEL_13;
      v3 = 1;
      v6 = 1;
      break;
    case 2uLL:
      if (v5 != 2)
        goto LABEL_13;
      v6 = 1;
      v3 = 2;
      break;
    case 3uLL:
      if (v5 != 3)
        goto LABEL_13;
      v6 = 1;
      v3 = 3;
      break;
    case 4uLL:
      if (v5 != 4)
        goto LABEL_13;
      v6 = 1;
      v3 = 4;
      break;
    default:
      if (v5 >= 5)
      {
        if (v2 == v4 && v3 == v5)
          v6 = 1;
        else
          v6 = sub_213EF3234();
      }
      else
      {
LABEL_13:
        v6 = 0;
      }
      sub_213DEF790(v4, v5);
      sub_213DEF790(v2, v3);
      break;
  }
  sub_213DEF77C(v2, v3);
  sub_213DEF77C(v4, v5);
  return v6 & 1;
}

unint64_t sub_213EE7B80()
{
  unint64_t result;

  result = qword_254D410B8;
  if (!qword_254D410B8)
  {
    result = MEMORY[0x2199C52D4](&protocol conformance descriptor for NowPlayingPlaybackState, &type metadata for NowPlayingPlaybackState);
    atomic_store(result, (unint64_t *)&qword_254D410B8);
  }
  return result;
}

unint64_t sub_213EE7BC8()
{
  unint64_t result;

  result = qword_254D410C0;
  if (!qword_254D410C0)
  {
    result = MEMORY[0x2199C52D4](&protocol conformance descriptor for NowPlayingPlayFinishedReason, &type metadata for NowPlayingPlayFinishedReason);
    atomic_store(result, (unint64_t *)&qword_254D410C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for NowPlayingFeatures()
{
  return &type metadata for NowPlayingFeatures;
}

uint64_t type metadata accessor for NowPlayingFeatures.PlaybackState(uint64_t a1)
{
  return sub_213DDE1A0(a1, (uint64_t *)&unk_254D410C8);
}

uint64_t sub_213EE7C30()
{
  return sub_213E0F8C4();
}

uint64_t sub_213EE7C3C()
{
  return type metadata accessor for NowPlayingFeatures.PlaybackState(0);
}

uint64_t type metadata accessor for NowPlayingFeatures.Title(uint64_t a1)
{
  return sub_213DDE1A0(a1, (uint64_t *)&unk_254D41118);
}

uint64_t sub_213EE7C58()
{
  return sub_213E0F8C4();
}

uint64_t sub_213EE7C64()
{
  return type metadata accessor for NowPlayingFeatures.Title(0);
}

uint64_t type metadata accessor for NowPlayingFeatures.Artist(uint64_t a1)
{
  return sub_213DDE1A0(a1, (uint64_t *)&unk_254D41168);
}

uint64_t sub_213EE7C80()
{
  return sub_213E0F8C4();
}

uint64_t sub_213EE7C8C()
{
  return type metadata accessor for NowPlayingFeatures.Artist(0);
}

uint64_t type metadata accessor for NowPlayingFeatures.Album(uint64_t a1)
{
  return sub_213DDE1A0(a1, (uint64_t *)&unk_254D411B8);
}

uint64_t sub_213EE7CA8()
{
  return sub_213E0F8C4();
}

uint64_t sub_213EE7CB4()
{
  return type metadata accessor for NowPlayingFeatures.Album(0);
}

uint64_t type metadata accessor for NowPlayingFeatures.Genre(uint64_t a1)
{
  return sub_213DDE1A0(a1, (uint64_t *)&unk_254D41208);
}

uint64_t sub_213EE7CD0()
{
  return sub_213E0F8C4();
}

uint64_t sub_213EE7CDC()
{
  return type metadata accessor for NowPlayingFeatures.Genre(0);
}

uint64_t type metadata accessor for NowPlayingFeatures.MediaType(uint64_t a1)
{
  return sub_213DDE1A0(a1, (uint64_t *)&unk_254D41258);
}

uint64_t sub_213EE7CF8()
{
  return sub_213E0F8C4();
}

uint64_t sub_213EE7D04()
{
  return type metadata accessor for NowPlayingFeatures.MediaType(0);
}

uint64_t type metadata accessor for NowPlayingFeatures.Duration(uint64_t a1)
{
  return sub_213DDE1A0(a1, (uint64_t *)&unk_254D412A8);
}

uint64_t sub_213EE7D20()
{
  return sub_213E0F8C4();
}

uint64_t sub_213EE7D2C()
{
  return type metadata accessor for NowPlayingFeatures.Duration(0);
}

uint64_t type metadata accessor for NowPlayingFeatures.ITunesStoreIdentifier(uint64_t a1)
{
  return sub_213DDE1A0(a1, (uint64_t *)&unk_254D412F8);
}

uint64_t sub_213EE7D48()
{
  return sub_213E0F8C4();
}

uint64_t sub_213EE7D54()
{
  return type metadata accessor for NowPlayingFeatures.ITunesStoreIdentifier(0);
}

uint64_t type metadata accessor for NowPlayingFeatures.TotalPlayLength(uint64_t a1)
{
  return sub_213DDE1A0(a1, (uint64_t *)&unk_254D41348);
}

uint64_t sub_213EE7D70()
{
  return sub_213E0F8C4();
}

uint64_t sub_213EE7D7C()
{
  return type metadata accessor for NowPlayingFeatures.TotalPlayLength(0);
}

uint64_t type metadata accessor for NowPlayingFeatures.EndReason(uint64_t a1)
{
  return sub_213DDE1A0(a1, (uint64_t *)&unk_254D41398);
}

uint64_t sub_213EE7D98()
{
  return sub_213E0F8C4();
}

uint64_t sub_213EE7DA4()
{
  return type metadata accessor for NowPlayingFeatures.EndReason(0);
}

ValueMetadata *type metadata accessor for NowPlayingPlaybackState()
{
  return &type metadata for NowPlayingPlaybackState;
}

uint64_t getEnumTagSinglePayload for NowPlayingMediaType(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 > 0x7FFFFFFA && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483643);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 4;
  if (v4 >= 6)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for NowPlayingMediaType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFB)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483643;
    if (a3 >= 0x7FFFFFFB)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFB)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 4;
  }
  return result;
}

ValueMetadata *type metadata accessor for NowPlayingMediaType()
{
  return &type metadata for NowPlayingMediaType;
}

uint64_t _s28SiriPrivateLearningInference23NowPlayingPlaybackStateOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_213EE7EC8 + 4 * byte_213F039EA[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_213EE7EFC + 4 * byte_213F039E5[v4]))();
}

uint64_t sub_213EE7EFC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213EE7F04(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213EE7F0CLL);
  return result;
}

uint64_t sub_213EE7F18(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x213EE7F20);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_213EE7F24(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213EE7F2C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NowPlayingPlayFinishedReason()
{
  return &type metadata for NowPlayingPlayFinishedReason;
}

Swift::Bool __swiftcall FeaturisedTurn.containsTaskInDomain(_:)(Swift::String a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  type metadata accessor for FeaturisedTurn(0);
  v1 = swift_bridgeObjectRetain();
  v2 = sub_213DAE9A8(v1);
  swift_bridgeObjectRelease();
  if (v2)
  {
    v3 = *(_QWORD *)(v2 + 16);
    if (v3)
    {
      swift_bridgeObjectRetain();
      v4 = v3 - 1;
      v5 = v2 + 40;
      do
      {
        v6 = v4;
        swift_bridgeObjectRetain();
        v7 = sub_213DAFF00();
        swift_bridgeObjectRelease();
        if ((v7 & 1) != 0)
          break;
        v4 = v6 - 1;
        v5 += 16;
      }
      while (v6);
      swift_bridgeObjectRelease();
    }
    else
    {
      v7 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7 & 1;
}

uint64_t FeaturisedTurn.getPlusId()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
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
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v3 = type metadata accessor for FeaturisedTurn(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F04828);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = swift_bridgeObjectRetain();
  sub_213DAF410(v9, (uint64_t)v8);
  swift_bridgeObjectRelease();
  v10 = sub_213EF1D64();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) == 1)
  {
    sub_213E0EC38((uint64_t)v8);
    if (qword_253F04A88 != -1)
      swift_once();
    v12 = sub_213EF2724();
    __swift_project_value_buffer(v12, (uint64_t)qword_253F08A00);
    sub_213DAFDB8(v1, (uint64_t)v5);
    v13 = sub_213EF270C();
    v14 = sub_213EF2CA0();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = swift_slowAlloc();
      v24 = a1;
      v16 = (uint8_t *)v15;
      v17 = swift_slowAlloc();
      v26 = v17;
      *(_DWORD *)v16 = 136315138;
      v18 = sub_213EF1D10();
      v25 = sub_213DB0570(v18, v19, &v26);
      sub_213EF2D9C();
      swift_bridgeObjectRelease();
      sub_213DAFE88((uint64_t)v5);
      _os_log_impl(&dword_213DAB000, v13, v14, "Missing Plus ID for turn=%s", v16, 0xCu);
      v20 = 1;
      swift_arrayDestroy();
      MEMORY[0x2199C53C4](v17, -1, -1);
      v21 = v16;
      a1 = v24;
      MEMORY[0x2199C53C4](v21, -1, -1);

    }
    else
    {
      sub_213DAFE88((uint64_t)v5);

      v20 = 1;
    }
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(a1, v8, v10);
    v20 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(a1, v20, 1, v10);
}

double FeaturisedTurn.firstEventOf(type:)@<D0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  uint64_t v5;

  v5 = *a1;
  if (*(_QWORD *)(*(_QWORD *)(v2 + *(int *)(type metadata accessor for FeaturisedTurn(0) + 28)) + 16))
  {
    swift_bridgeObjectRetain_n();
    __asm { BR              X8 }
  }
  *(_QWORD *)(a2 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return result;
}

uint64_t sub_213EE84EC(uint64_t a1, unint64_t a2, uint64_t a3)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  os_log_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  int v57;
  _QWORD v58[2];
  __int128 v59;
  uint64_t *v60;
  uint64_t v61;
  os_log_t v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  _QWORD *v68;
  uint64_t *v69;
  _QWORD *v70;
  _QWORD *v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77[2];

  v74 = a2;
  v61 = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F06FA0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v60 = (_QWORD *)((char *)v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = MEMORY[0x24BDAC7A8](v5);
  v76 = (uint64_t)v58 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v75 = (uint64_t)v58 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v71 = (_QWORD *)((char *)v58 - v12);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v58 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v70 = (_QWORD *)((char *)v58 - v18);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (_QWORD *)((char *)v58 - v20);
  result = MEMORY[0x24BDAC7A8](v19);
  v26 = (_QWORD *)((char *)v58 - v25);
  v27 = *(_QWORD *)(a3 + 16);
  if (v27)
  {
    v69 = (uint64_t *)v24;
    v66 = (uint64_t)v26 + *(int *)(v4 + 48);
    v28 = a3 + ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80));
    v65 = *(_QWORD *)(v23 + 72);
    v58[0] = a3;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v29 = 136315650;
    v59 = v29;
    v58[1] = MEMORY[0x24BEE4AD8] + 8;
    v67 = v26;
    v68 = v21;
    do
    {
      v72 = v28;
      v73 = v27;
      sub_213DCC3D8(v28, (uint64_t)v26, &qword_253F06FA0);
      v45 = (uint64_t)v21 + *(int *)(v4 + 48);
      v47 = *v26;
      v46 = v26[1];
      *v21 = *v26;
      v21[1] = v46;
      sub_213DBB430(v66, v45, (uint64_t (*)(_QWORD))type metadata accessor for RuleResult);
      v48 = qword_253F04A88;
      swift_bridgeObjectRetain();
      if (v48 != -1)
        swift_once();
      v49 = sub_213EF2724();
      __swift_project_value_buffer(v49, (uint64_t)qword_253F08A00);
      v50 = (uint64_t)v70;
      v51 = (uint64_t)v70 + *(int *)(v4 + 48);
      *v70 = v47;
      *(_QWORD *)(v50 + 8) = v46;
      sub_213DCA7E4(v45, v51, (uint64_t (*)(_QWORD))type metadata accessor for RuleResult);
      v52 = v69;
      sub_213DCC3D8(v50, (uint64_t)v69, &qword_253F06FA0);
      sub_213EE9A0C(v50, (uint64_t)v15);
      v53 = (uint64_t)v71;
      v54 = (uint64_t)v71 + *(int *)(v4 + 48);
      *v71 = v47;
      *(_QWORD *)(v53 + 8) = v46;
      sub_213DCA7E4(v45, v54, (uint64_t (*)(_QWORD))type metadata accessor for RuleResult);
      sub_213DCC3D8(v53, v75, &qword_253F06FA0);
      sub_213EE9A0C(v53, v76);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v55 = sub_213EF270C();
      v56 = sub_213EF2C94();
      v57 = v56;
      if (os_log_type_enabled(v55, v56))
      {
        v30 = swift_slowAlloc();
        v64 = v57;
        v31 = v30;
        v63 = swift_slowAlloc();
        v77[0] = v63;
        *(_DWORD *)v31 = v59;
        v32 = v74;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v31 + 4) = sub_213DB0570(v61, v32, v77);
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v31 + 12) = 2080;
        v33 = *(int *)(v4 + 48);
        v34 = (uint64_t)v15;
        v35 = v60;
        v36 = (uint64_t)v60 + v33;
        v62 = v55;
        v37 = v4;
        v38 = *v52;
        v39 = v52[1];
        *v60 = *v52;
        v35[1] = v39;
        sub_213DCA7E4((uint64_t)v52 + v33, (uint64_t)v35 + v33, (uint64_t (*)(_QWORD))type metadata accessor for RuleResult);
        swift_bridgeObjectRetain();
        sub_213DCA828(v36, (uint64_t (*)(_QWORD))type metadata accessor for RuleResult);
        *(_QWORD *)(v31 + 14) = sub_213DB0570(v38, v39, v77);
        v4 = v37;
        v40 = v75;
        swift_bridgeObjectRelease();
        sub_213DAFEC4(v34, &qword_253F06FA0);
        sub_213DAFEC4((uint64_t)v52, &qword_253F06FA0);
        *(_WORD *)(v31 + 22) = 2080;
        sub_213DCA7E4(v40 + *(int *)(v37 + 48), (uint64_t)v35 + *(int *)(v37 + 48), (uint64_t (*)(_QWORD))type metadata accessor for RuleResult);
        type metadata accessor for RuleResult();
        v41 = sub_213EF288C();
        *(_QWORD *)(v31 + 24) = sub_213DB0570(v41, v42, v77);
        swift_bridgeObjectRelease();
        sub_213DAFEC4(v76, &qword_253F06FA0);
        sub_213DAFEC4(v40, &qword_253F06FA0);
        v43 = v62;
        _os_log_impl(&dword_213DAB000, v62, (os_log_type_t)v64, "%s%s: %s", (uint8_t *)v31, 0x20u);
        v44 = v63;
        swift_arrayDestroy();
        MEMORY[0x2199C53C4](v44, -1, -1);
        MEMORY[0x2199C53C4](v31, -1, -1);

        v21 = v68;
        sub_213DAFEC4((uint64_t)v68, &qword_253F06FA0);
        v15 = (char *)v34;
      }
      else
      {

        sub_213DAFEC4(v76, &qword_253F06FA0);
        sub_213DAFEC4(v75, &qword_253F06FA0);
        sub_213DAFEC4((uint64_t)v15, &qword_253F06FA0);
        sub_213DAFEC4((uint64_t)v52, &qword_253F06FA0);
        swift_bridgeObjectRelease_n();
        v21 = v68;
        sub_213DAFEC4((uint64_t)v68, &qword_253F06FA0);
      }
      v28 = v72 + v65;
      v27 = v73 - 1;
      v26 = v67;
    }
    while (v73 != 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_213EE8A40()
{
  uint64_t result;

  type metadata accessor for PhoneCallAbandonmentClassifier();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F06D80);
  sub_213EF288C();
  sub_213EF2904();
  swift_bridgeObjectRelease();
  result = sub_213EF2904();
  qword_253F06D60 = 91;
  unk_253F06D68 = 0xE100000000000000;
  return result;
}

uint64_t sub_213EE8AC0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v23;
  char *v24;

  v2 = type metadata accessor for RuleResult();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v24 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v23 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F07018);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F06FA0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 72);
  v10 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_213EF44C0;
  v23 = v11;
  v12 = (_QWORD *)(v11 + v10);
  *v12 = 0xD00000000000001CLL;
  v12[1] = 0x8000000213F071B0;
  swift_storeEnumTagMultiPayload();
  v13 = (_QWORD *)((char *)v12 + v9);
  *v13 = 0xD00000000000001FLL;
  v13[1] = 0x8000000213F0ABA0;
  isSiriPhoneCall(_:)();
  swift_storeEnumTagMultiPayload();
  sub_213DBB430((uint64_t)v6, (uint64_t)v12 + v9 + *(int *)(v7 + 48), (uint64_t (*)(_QWORD))type metadata accessor for RuleResult);
  v14 = (_QWORD *)((char *)v12 + 2 * v9);
  v15 = (_QWORD *)((char *)v14 + *(int *)(v7 + 48));
  *v14 = 0xD00000000000001CLL;
  v14[1] = 0x8000000213F05F50;
  sub_213EA3E5C(v15);
  v16 = (_QWORD *)((char *)v12 + 3 * v9);
  v17 = (uint64_t)v16 + *(int *)(v7 + 48);
  *v16 = 0xD00000000000001CLL;
  v16[1] = 0x8000000213F0ABC0;
  sub_213EE8D64(a1, v17);
  v18 = (_QWORD *)((char *)v12 + 4 * v9);
  *v18 = 0xD000000000000011;
  v18[1] = 0x8000000213F08D40;
  type metadata accessor for FeaturisedTurn(0);
  v19 = swift_bridgeObjectRetain();
  v20 = sub_213DAF3C8(v19);
  swift_bridgeObjectRelease();
  if (v20)
  {
    if (v20 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_213EF306C();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  v21 = (uint64_t)v24;
  swift_storeEnumTagMultiPayload();
  sub_213DBB430(v21, (uint64_t)v18 + *(int *)(v7 + 48), (uint64_t (*)(_QWORD))type metadata accessor for RuleResult);
  return v23;
}

uint64_t sub_213EE8D64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];
  __int128 v30;
  uint64_t v31;
  _OWORD v32[2];
  uint64_t v33;

  v4 = type metadata accessor for RuleResult();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 + *(int *)(type metadata accessor for FeaturisedTurn(0) + 28));
  v28 = *(_QWORD *)(v7 + 16);
  if (!v28)
    return swift_storeEnumTagMultiPayload();
  v21 = v6;
  v22 = v4;
  v23 = a2;
  v27 = v7 + 32;
  v24 = v7;
  swift_bridgeObjectRetain_n();
  v8 = 0;
  v25 = "nerationTriggered";
  v26 = 0x8000000213F04860;
  while (1)
  {
    v9 = (_QWORD *)(v27 + 40 * v8);
    v10 = v9[2];
    v11 = v9[3];
    v12 = v9[4];
    v13 = *(_QWORD *)(v10 + 16);
    if (v13)
    {
      v14 = v10 + 32;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      while (1)
      {
        sub_213DAFDFC(v14, (uint64_t)&v30);
        sub_213DAFDFC((uint64_t)&v30, (uint64_t)v29);
        __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
        type metadata accessor for CommonFeature.InteractionDirection(0);
        if (swift_dynamicCast())
          break;
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v30);
        v14 += 40;
        if (!--v13)
        {
          swift_bridgeObjectRelease();
          goto LABEL_12;
        }
      }
      swift_bridgeObjectRelease();
      swift_release();
      sub_213DB0BF0(&v30, (uint64_t)v32);
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
LABEL_12:
      v33 = 0;
      memset(v32, 0, sizeof(v32));
    }
    sub_213DCC3D8((uint64_t)v32, (uint64_t)&v30, &qword_253F06970);
    if (v31)
      break;
    sub_213DAFEC4((uint64_t)&v30, &qword_253F06970);
LABEL_4:
    sub_213DAFEC4((uint64_t)v32, &qword_253F06970);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
LABEL_5:
    if (++v8 == v28)
    {
      swift_bridgeObjectRelease_n();
      return swift_storeEnumTagMultiPayload();
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
  type metadata accessor for CommonFeature.InteractionDirection(0);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_4;
  swift_retain();
  sub_213EF23D0();
  swift_release_n();
  v15 = v30;
  sub_213DAFEC4((uint64_t)v32, &qword_253F06970);
  swift_bridgeObjectRelease();
  if ((v11 != 0xD000000000000011 || v12 != v26) && (sub_213EF3234() & 1) == 0 || v15 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  swift_bridgeObjectRelease_n();
  v17 = swift_bridgeObjectRetain();
  v18 = sub_213DAF1F8(v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  if (v18 == 2)
    return swift_storeEnumTagMultiPayload();
  v19 = (uint64_t)v21;
  swift_storeEnumTagMultiPayload();
  return sub_213DBB430(v19, v23, (uint64_t (*)(_QWORD))type metadata accessor for RuleResult);
}

uint64_t PhoneCallAbandonmentClassifier.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t PhoneCallAbandonmentClassifier.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_213EE9154(uint64_t a1)
{
  return sub_213EE9174(a1);
}

uint64_t sub_213EE9174(uint64_t a1)
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
  char *v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  __int128 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v2 = type metadata accessor for RuleResult();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F069B0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for FeaturisedTurn(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v58 - v13;
  sub_213EA4050(a1, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_213DAFEC4((uint64_t)v7, &qword_253F069B0);
    if (*(_QWORD *)(a1 + 16))
    {
LABEL_3:
      v15 = sub_213EF1D10();
      v17 = v16;
LABEL_13:
      if (qword_253F04A88 != -1)
        swift_once();
      v33 = sub_213EF2724();
      __swift_project_value_buffer(v33, (uint64_t)qword_253F08A00);
      swift_bridgeObjectRetain();
      v34 = sub_213EF270C();
      v35 = sub_213EF2C94();
      if (os_log_type_enabled(v34, v35))
      {
        v36 = swift_slowAlloc();
        v37 = swift_slowAlloc();
        v64 = v37;
        *(_DWORD *)v36 = 136315394;
        if (qword_253F06D78 != -1)
          swift_once();
        v38 = qword_253F06D60;
        v39 = unk_253F06D68;
        swift_bridgeObjectRetain();
        v63 = sub_213DB0570(v38, v39, &v64);
        sub_213EF2D9C();
        swift_bridgeObjectRelease();
        *(_WORD *)(v36 + 12) = 2080;
        swift_bridgeObjectRetain();
        v63 = sub_213DB0570(v15, v17, &v64);
        sub_213EF2D9C();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_213DAB000, v34, v35, "%s Skipping conversation with id=%s with no dismissal features", (uint8_t *)v36, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2199C53C4](v37, -1, -1);
        MEMORY[0x2199C53C4](v36, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      return MEMORY[0x24BEE4AF8];
    }
LABEL_12:
    v17 = 0x8000000213F05F90;
    v15 = 0xD000000000000014;
    goto LABEL_13;
  }
  sub_213DBB430((uint64_t)v7, (uint64_t)v14, type metadata accessor for FeaturisedTurn);
  v62 = *(int *)(v8 + 24);
  v18 = swift_bridgeObjectRetain();
  v19 = sub_213DAE808(v18);
  v21 = v20;
  swift_bridgeObjectRelease();
  if ((v21 & 1) != 0)
  {
    sub_213DCA828((uint64_t)v14, type metadata accessor for FeaturisedTurn);
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_3;
    goto LABEL_12;
  }
  v22 = sub_213EE8AC0((uint64_t)v14);
  if (qword_253F04A88 != -1)
    swift_once();
  v23 = sub_213EF2724();
  __swift_project_value_buffer(v23, (uint64_t)qword_253F08A00);
  sub_213DCA7E4((uint64_t)v14, (uint64_t)v12, type metadata accessor for FeaturisedTurn);
  v24 = sub_213EF270C();
  v25 = sub_213EF2C94();
  v26 = os_log_type_enabled(v24, (os_log_type_t)v25);
  v61 = v19;
  if (v26)
  {
    v59 = v25;
    *(_QWORD *)&v60 = v22;
    v27 = swift_slowAlloc();
    v58 = swift_slowAlloc();
    v64 = v58;
    *(_DWORD *)v27 = 136315394;
    if (qword_253F06D78 != -1)
      swift_once();
    v28 = qword_253F06D60;
    v29 = unk_253F06D68;
    swift_bridgeObjectRetain();
    v63 = sub_213DB0570(v28, v29, &v64);
    sub_213EF2D9C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 12) = 2080;
    sub_213EF1D64();
    sub_213E0B898();
    v30 = sub_213EF31F8();
    v63 = sub_213DB0570(v30, v31, &v64);
    sub_213EF2D9C();
    swift_bridgeObjectRelease();
    sub_213DCA828((uint64_t)v12, type metadata accessor for FeaturisedTurn);
    _os_log_impl(&dword_213DAB000, v24, (os_log_type_t)v59, "%s Rule Matrix for turnId=%s:", (uint8_t *)v27, 0x16u);
    v32 = v58;
    swift_arrayDestroy();
    MEMORY[0x2199C53C4](v32, -1, -1);
    MEMORY[0x2199C53C4](v27, -1, -1);

    v19 = v61;
    v22 = v60;
  }
  else
  {
    sub_213DCA828((uint64_t)v12, type metadata accessor for FeaturisedTurn);

  }
  sub_213EE84EC(8224, 0xE200000000000000, v22);
  v42 = *(_QWORD *)(v22 + 16);
  if (v42)
  {
    v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F06FA0);
    v44 = *(_QWORD *)(v43 - 8);
    v45 = v22 + ((*(unsigned __int8 *)(v44 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80));
    v46 = *(_QWORD *)(v44 + 72);
    swift_bridgeObjectRetain();
    while (1)
    {
      v47 = v45 + *(int *)(v43 + 48);
      swift_storeEnumTagMultiPayload();
      sub_213E81FE0(v47, (uint64_t)v4);
      LOBYTE(v47) = v48;
      sub_213DCA828((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for RuleResult);
      if ((v47 & 1) == 0)
        break;
      v45 += v46;
      if (!--v42)
      {
        swift_bridgeObjectRelease_n();
        v19 = v61;
        goto LABEL_29;
      }
    }
    swift_bridgeObjectRelease_n();
    sub_213DCA828((uint64_t)v14, type metadata accessor for FeaturisedTurn);
    return MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
LABEL_29:
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D3A650);
  v40 = swift_allocObject();
  v60 = xmmword_213EF53E0;
  *(_OWORD *)(v40 + 16) = xmmword_213EF53E0;
  v49 = swift_bridgeObjectRetain();
  v50 = sub_213DAF3C8(v49);
  result = swift_bridgeObjectRelease();
  if (!v50)
  {
    v51 = 0;
    goto LABEL_38;
  }
  if (v50 >> 62)
  {
    swift_bridgeObjectRetain();
    v51 = sub_213EF306C();
    result = swift_bridgeObjectRelease();
    if (!v51)
      goto LABEL_35;
  }
  else
  {
    v51 = *(_QWORD *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v51)
    {
LABEL_35:
      swift_bridgeObjectRelease();
LABEL_38:
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D3A840);
      v52 = sub_213EF1D64();
      v53 = *(_QWORD *)(v52 - 8);
      v54 = (*(unsigned __int8 *)(v53 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80);
      v55 = swift_allocObject();
      *(_OWORD *)(v55 + 16) = v60;
      (*(void (**)(unint64_t, char *, uint64_t))(v53 + 16))(v55 + v54, v14, v52);
      *(_QWORD *)(v40 + 56) = &type metadata for PhoneCallAbandonmentClassification;
      *(_QWORD *)(v40 + 64) = &protocol witness table for PhoneCallAbandonmentClassification;
      v56 = (_QWORD *)swift_allocObject();
      *(_QWORD *)(v40 + 32) = v56;
      v56[2] = v19;
      v56[3] = v51;
      v57 = MEMORY[0x24BEE4AF8];
      v56[4] = v55;
      v56[5] = v57;
      sub_213DCA828((uint64_t)v14, type metadata accessor for FeaturisedTurn);
      return v40;
    }
  }
  if ((v50 & 0xC000000000000001) != 0)
  {
    v51 = MEMORY[0x2199C49B0](0, v50);
    goto LABEL_35;
  }
  if (*(_QWORD *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    v51 = *(_QWORD *)(v50 + 32);
    swift_retain();
    goto LABEL_35;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for PhoneCallAbandonmentClassifier()
{
  return objc_opt_self();
}

uint64_t method lookup function for PhoneCallAbandonmentClassifier()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhoneCallAbandonmentClassifier.classify(_:classifications:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t sub_213EE99D8()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_213EE9A0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F06FA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t AsyncCoreDuetEventStreamProcessor.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 32);
  return v0;
}

uint64_t sub_213EE9A78(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 120) = a1;
  *(_QWORD *)(v2 + 128) = v1;
  return swift_task_switch();
}

uint64_t sub_213EE9A90()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t AssociatedConformanceWitness;
  uint64_t v18;
  _QWORD *v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  NSObject *log;
  uint64_t v34;
  int *v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  uint64_t v37;

  v1 = v0 + 2;
  if (qword_253F04A88 != -1)
    swift_once();
  v2 = sub_213EF2724();
  __swift_project_value_buffer(v2, (uint64_t)qword_253F08A00);
  swift_retain();
  swift_bridgeObjectRetain();
  v3 = sub_213EF270C();
  v4 = sub_213EF2CAC();
  v5 = os_log_type_enabled(v3, v4);
  v6 = v0[15];
  v7 = v0[16];
  if (v5)
  {
    v8 = swift_slowAlloc();
    v34 = swift_slowAlloc();
    *(_DWORD *)v8 = 136315394;
    v37 = v34;
    log = v3;
    v9 = *(_QWORD *)(v7 + 16);
    v10 = *(_QWORD *)(v7 + 24);
    swift_bridgeObjectRetain();
    v0[13] = sub_213DB0570(v9, v10, &v37);
    v1 = v0 + 2;
    sub_213EF2D9C();
    swift_bridgeObjectRelease();
    swift_release();
    *(_WORD *)(v8 + 12) = 2048;
    v0[14] = *(_QWORD *)(v6 + 16);
    sub_213EF2D9C();
    swift_bridgeObjectRelease();
    v3 = log;
    _os_log_impl(&dword_213DAB000, log, v4, "%s Processing %ld events", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2199C53C4](v34, -1, -1);
    MEMORY[0x2199C53C4](v8, -1, -1);
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
  }

  v12 = v0[15];
  v11 = (_QWORD *)v0[16];
  v13 = v11[7];
  v14 = v11[8];
  __swift_project_boxed_opaque_existential_1(v11 + 4, v13);
  v15 = *(_QWORD *)(v14 + 8);
  v16 = *(void (**)(uint64_t, uint64_t))(v15 + 24);
  v0[5] = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v0[6] = AssociatedConformanceWitness;
  __swift_allocate_boxed_opaque_existential_1(v1);
  v16(v13, v15);
  v0[12] = MEMORY[0x24BEE4AF8];
  v18 = *(_QWORD *)(v12 + 16);
  v0[17] = v18;
  if (v18)
  {
    v19 = (_QWORD *)v0[15];
    v20 = *(int **)(AssociatedConformanceWitness + 24);
    v0[18] = v20;
    v0[19] = 0;
    v21 = v19[5];
    v0[20] = v21;
    v22 = v19[6];
    v0[21] = v22;
    v23 = v19[8];
    v0[22] = v23;
    v24 = v19[7];
    v25 = v19[4];
    swift_bridgeObjectRetain();
    v0[7] = v25;
    v0[8] = v21;
    v0[9] = v22;
    v0[10] = v24;
    v0[11] = v23;
    v26 = v0[5];
    v27 = v0[6];
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v1, v26);
    v35 = (int *)((char *)v20 + *v20);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v28 = (_QWORD *)swift_task_alloc();
    v0[23] = v28;
    *v28 = v0;
    v28[1] = sub_213EE9E40;
    return ((uint64_t (*)(_QWORD *, uint64_t, uint64_t))v35)(v0 + 7, v26, v27);
  }
  else
  {
    v30 = v0[5];
    v31 = v0[6];
    __swift_project_boxed_opaque_existential_1(v1, v30);
    v36 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v31 + 32) + *(_QWORD *)(v31 + 32));
    v32 = (_QWORD *)swift_task_alloc();
    v0[26] = v32;
    *v32 = v0;
    v32[1] = sub_213EEA070;
    return v36(v30, v31);
  }
}

uint64_t sub_213EE9E40(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 192) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    *(_QWORD *)(v4 + 200) = a1;
  }
  return swift_task_switch();
}

uint64_t sub_213EE9EE0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  int *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  int *v18;

  v1 = v0[17];
  v2 = v0[19] + 1;
  sub_213DB43F0(v0[25]);
  if (v2 == v1)
  {
    swift_bridgeObjectRelease();
    v3 = v0[5];
    v4 = v0[6];
    __swift_project_boxed_opaque_existential_1(v0 + 2, v3);
    v17 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v4 + 32) + *(_QWORD *)(v4 + 32));
    v5 = (_QWORD *)swift_task_alloc();
    v0[26] = v5;
    *v5 = v0;
    v5[1] = sub_213EEA070;
    return v17(v3, v4);
  }
  else
  {
    v7 = (int *)v0[18];
    v8 = v0[19] + 1;
    v0[19] = v8;
    v9 = (_QWORD *)(v0[15] + 40 * v8);
    v10 = v9[5];
    v0[20] = v10;
    v11 = v9[6];
    v0[21] = v11;
    v12 = v9[8];
    v0[22] = v12;
    v13 = v9[7];
    v0[7] = v9[4];
    v0[8] = v10;
    v0[9] = v11;
    v0[10] = v13;
    v0[11] = v12;
    v14 = v0[5];
    v15 = v0[6];
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v14);
    v18 = (int *)((char *)v7 + *v7);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v16 = (_QWORD *)swift_task_alloc();
    v0[23] = v16;
    *v16 = v0;
    v16[1] = sub_213EE9E40;
    return ((uint64_t (*)(_QWORD *, uint64_t, uint64_t))v18)(v0 + 7, v14, v15);
  }
}

uint64_t sub_213EEA070(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 216) = v1;
  swift_task_dealloc();
  if (v1)
    swift_bridgeObjectRelease();
  else
    *(_QWORD *)(v4 + 224) = a1;
  return swift_task_switch();
}

uint64_t sub_213EEA0EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 216);
  sub_213DB43F0(*(_QWORD *)(v0 + 224));
  v4 = *(_QWORD *)(v0 + 96);
  swift_bridgeObjectRetain_n();
  sub_213EEA6B4(&v4);
  if (v1)
    return swift_release();
  swift_bridgeObjectRelease_n();
  v3 = v4;
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v3);
}

uint64_t sub_213EEA180()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213EEA1DC()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t EventStreamContext.init(dateRange:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_213EF1AA0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
}

uint64_t EventStreamContext.dateRange.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_213EF1AA0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_213EEA284()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(char *, uint64_t, uint64_t);
  int v19;
  uint64_t v20;
  char v21;
  char v22;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char v33;
  void (*v34)(char *, uint64_t);
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F04800);
  MEMORY[0x24BDAC7A8](v1);
  v36 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v39 = (char *)&v36 - v4;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v36 - v6;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v36 - v9;
  v11 = sub_213EF1CF8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v37 = (char *)&v36 - v16;
  v17 = swift_bridgeObjectRetain();
  sub_213DAF008(v17, (uint64_t)v7);
  swift_bridgeObjectRelease();
  v18 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  v19 = v18(v7, 1, v11);
  v40 = v0;
  v38 = v14;
  if (v19 == 1)
  {
    v20 = swift_bridgeObjectRetain();
    sub_213DAF1EC(v20);
    v22 = v21;
    swift_bridgeObjectRelease();
    if ((v22 & 1) != 0)
    {
      v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
      v23(v10, 1, 1, v11);
    }
    else
    {
      sub_213EF1CC8();
      v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
      v23(v10, 0, 1, v11);
    }
    sub_213DAFEC4((uint64_t)v7, &qword_253F04800);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v10, v7, v11);
    v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
    v23(v10, 0, 1, v11);
  }
  v24 = v37;
  if (v18(v10, 1, v11) == 1)
  {
    sub_213EF1C74();
    sub_213DAFEC4((uint64_t)v10, &qword_253F04800);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v24, v10, v11);
  }
  v25 = (uint64_t)v36;
  v26 = swift_bridgeObjectRetain();
  sub_213DAF008(v26, v25);
  swift_bridgeObjectRelease();
  if (v18((char *)v25, 1, v11) == 1)
  {
    v27 = swift_bridgeObjectRetain();
    sub_213DAF1EC(v27);
    v29 = v28;
    swift_bridgeObjectRelease();
    v30 = (uint64_t)v39;
    if ((v29 & 1) != 0)
    {
      v31 = 1;
    }
    else
    {
      sub_213EF1CC8();
      v31 = 0;
    }
    v23((char *)v30, v31, 1, v11);
    sub_213DAFEC4(v25, &qword_253F04800);
  }
  else
  {
    v30 = (uint64_t)v39;
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v39, v25, v11);
    v23((char *)v30, 0, 1, v11);
  }
  v32 = v38;
  if (v18((char *)v30, 1, v11) == 1)
  {
    sub_213EF1C68();
    sub_213DAFEC4(v30, &qword_253F04800);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v32, v30, v11);
  }
  v33 = sub_213EF1CA4();
  v34 = *(void (**)(char *, uint64_t))(v12 + 8);
  v34(v32, v11);
  v34(v24, v11);
  return v33 & 1;
}

uint64_t AsyncCoreDuetEventStreamProcessor.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 32);
  return swift_deallocClassInstance();
}

uint64_t sub_213EEA650(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_213E85DFC;
  v5[15] = a1;
  v5[16] = v4;
  return swift_task_switch();
}

void sub_213EEA6B4(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_213EE1C4C(v2);
  v3 = *(_QWORD *)(v2 + 16);
  v4[0] = v2 + 32;
  v4[1] = v3;
  sub_213EEA8F4(v4);
  *a1 = v2;
}

uint64_t getEnumTagSinglePayload for EventStreamContext()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_213EEA728(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_213EF1AA0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for EventStreamContext()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_213EEA770(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_213EF1AA0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for EventStreamContext()
{
  uint64_t result;

  result = qword_253F04FA0;
  if (!qword_253F04FA0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t dispatch thunk of EventStreamProcessing.process(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 8) + *(_QWORD *)(a3 + 8));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_213E65B1C;
  return v9(a1, a2, a3);
}

uint64_t type metadata accessor for AsyncCoreDuetEventStreamProcessor()
{
  return objc_opt_self();
}

uint64_t method lookup function for AsyncCoreDuetEventStreamProcessor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AsyncCoreDuetEventStreamProcessor.process(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 104) + *(_QWORD *)(*(_QWORD *)v1 + 104));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_213E65B6C;
  return v6(a1);
}

void sub_213EEA8F4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
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
  char *v25;
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
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  void (*v67)(char *, uint64_t, uint64_t, uint64_t);
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unsigned int (*v72)(char *, uint64_t, uint64_t);
  uint64_t v73;
  uint64_t v74;
  void (*v75)(char *, char *, uint64_t);
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  unsigned int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unsigned int v90;
  char *v91;
  uint64_t v92;
  char *v93;
  int v94;
  uint64_t v95;
  void (*v96)(char *, uint64_t);
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  __int128 v106;
  uint64_t v107;
  __int128 v108;
  uint64_t v109;
  uint64_t v110;
  _QWORD *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  _QWORD *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void (*v121)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v122;
  uint64_t v123;
  void (*v124)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v125;
  unsigned int (*v126)(char *, uint64_t, uint64_t);
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void (*v130)(char *, char *, uint64_t);
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  unsigned int v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  unsigned int v143;
  char *v144;
  uint64_t v145;
  char *v146;
  char v147;
  uint64_t v148;
  void (*v149)(char *, uint64_t);
  _QWORD *v150;
  uint64_t v151;
  uint64_t v152;
  _QWORD *v153;
  _QWORD *v154;
  uint64_t v155;
  uint64_t v156;
  __int128 v157;
  uint64_t v158;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v160;
  unint64_t v161;
  unint64_t v162;
  char *v163;
  char *v164;
  uint64_t v165;
  unint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  char v170;
  char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  BOOL v177;
  unint64_t v178;
  char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  char *v184;
  uint64_t v185;
  uint64_t v186;
  BOOL v187;
  uint64_t v188;
  char v189;
  char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  BOOL v194;
  uint64_t v195;
  uint64_t v196;
  char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  unint64_t v205;
  char *v206;
  char *v207;
  uint64_t v208;
  char *v209;
  uint64_t v210;
  unint64_t v211;
  char *v212;
  uint64_t v213;
  unint64_t v214;
  char *v215;
  char *v216;
  uint64_t v217;
  uint64_t v218;
  char *v219;
  unint64_t v220;
  uint64_t v221;
  uint64_t *v222;
  uint64_t v223;
  uint64_t v224;
  char *v225;
  uint64_t v226;
  uint64_t v227;
  char *v228;
  char *v229;
  char *v230;
  uint64_t v231;
  char *v232;
  char *v233;
  char *v234;
  char *v235;
  uint64_t v236;
  char *v237;
  uint64_t v238;
  char *v239;
  uint64_t v240;
  char *v241;
  char *v242;
  char *v243;
  _QWORD *v244;
  _QWORD *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  __int128 v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  __int128 v259;
  __int128 v260;
  uint64_t v261;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F04800);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v221 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v221 - v8;
  MEMORY[0x24BDAC7A8](v10);
  v243 = (char *)&v221 - v11;
  MEMORY[0x24BDAC7A8](v12);
  v239 = (char *)&v221 - v13;
  MEMORY[0x24BDAC7A8](v14);
  v233 = (char *)&v221 - v15;
  MEMORY[0x24BDAC7A8](v16);
  v230 = (char *)&v221 - v17;
  MEMORY[0x24BDAC7A8](v18);
  v232 = (char *)&v221 - v19;
  MEMORY[0x24BDAC7A8](v20);
  v229 = (char *)&v221 - v21;
  v22 = sub_213EF1CF8();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v221 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v26);
  v249 = (char *)&v221 - v27;
  MEMORY[0x24BDAC7A8](v28);
  v228 = (char *)&v221 - v29;
  MEMORY[0x24BDAC7A8](v30);
  v234 = (char *)&v221 - v31;
  v32 = a1[1];
  v33 = sub_213EF31D4();
  if (v33 >= v32)
  {
    if (v32 < 0)
      goto LABEL_267;
    if (v32)
      sub_213EEC6F0(0, v32, 1, a1);
    return;
  }
  v224 = v33;
  if (v32 >= 0)
    v34 = v32;
  else
    v34 = v32 + 1;
  if (v32 < -1)
    goto LABEL_275;
  v242 = v6;
  v241 = v9;
  if (v32 < 2)
  {
    v37 = MEMORY[0x24BEE4AF8];
    v235 = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v32 != 1)
    {
      v162 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v41 = (char *)MEMORY[0x24BEE4AF8];
      goto LABEL_232;
    }
    v38 = &v254;
  }
  else
  {
    v35 = v34 >> 1;
    v36 = sub_213EF2A9C();
    *(_QWORD *)(v36 + 16) = v35;
    v223 = v36;
    v37 = v36 + 32;
    v38 = (uint64_t *)&v260;
  }
  *(v38 - 32) = v37;
  v39 = 0;
  v222 = a1;
  v40 = *a1;
  v41 = (char *)MEMORY[0x24BEE4AF8];
  v42 = v243;
  v250 = v22;
  v251 = v23;
  v237 = v25;
  v240 = v40;
  v231 = v32;
  do
  {
    v225 = v41;
    v43 = v39;
    v44 = v32;
    v45 = v43 + 1;
    v238 = v43;
    if (v43 + 1 >= v44)
    {
      v97 = v231;
      goto LABEL_97;
    }
    v46 = (_QWORD *)(v40 + 40 * v45);
    v47 = v46[1];
    v49 = v46[2];
    v48 = v46[3];
    v50 = v46[4];
    *(_QWORD *)&v259 = *v46;
    *((_QWORD *)&v259 + 1) = v47;
    *(_QWORD *)&v260 = v49;
    *((_QWORD *)&v260 + 1) = v48;
    v261 = v50;
    v51 = (_QWORD *)(v40 + 40 * v43);
    v52 = v51[1];
    v54 = v51[2];
    v53 = v51[3];
    v55 = v51[4];
    *(_QWORD *)&v255 = *v51;
    *((_QWORD *)&v255 + 1) = v52;
    v256 = v54;
    v257 = v53;
    v258 = v55;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v253 = v52;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    LODWORD(v247) = sub_213EEA284();
    if (v2)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_243;
    }
    v226 = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v56 = v43 + 2;
    v23 = v251;
    v40 = v240;
    if (v43 + 2 >= v231)
      goto LABEL_87;
    while (1)
    {
      v236 = v56;
      v57 = (_QWORD *)(v40 + 40 * v56);
      v59 = v57[1];
      v58 = (_QWORD *)v57[2];
      v60 = v57[4];
      v61 = v40 + 40 * v45;
      v62 = *(_QWORD *)(v61 + 8);
      v63 = *(_QWORD *)(v61 + 16);
      v64 = v58[2];
      v248 = v60;
      v253 = v62;
      if (v64)
      {
        v65 = (uint64_t)(v58 + 4);
        v245 = v58;
        swift_bridgeObjectRetain_n();
        v246 = v59;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v66 = v232;
        while (1)
        {
          sub_213DAFDFC(v65, (uint64_t)&v255);
          sub_213DAFDFC((uint64_t)&v255, (uint64_t)&v259);
          __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
          type metadata accessor for CommonFeature.OrderingTimestamp(0);
          if (swift_dynamicCast())
            break;
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v255);
          v65 += 40;
          if (!--v64)
          {
            v58 = v245;
            swift_bridgeObjectRelease();
            goto LABEL_24;
          }
        }
        v58 = v245;
        swift_bridgeObjectRelease();
        swift_release();
        sub_213DB0BF0(&v255, (uint64_t)&v259);
      }
      else
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v66 = v232;
LABEL_24:
        v261 = 0;
        v259 = 0u;
        v260 = 0u;
      }
      sub_213DAFE40((uint64_t)&v259, (uint64_t)&v255);
      if (v257)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
        type metadata accessor for CommonFeature.OrderingTimestamp(0);
        if ((swift_dynamicCast() & 1) != 0)
        {
          swift_retain();
          sub_213EF23D0();
          swift_release_n();
          sub_213DAFEC4((uint64_t)&v259, &qword_253F06970);
          v67 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
          v68 = v66;
          v69 = 0;
          goto LABEL_31;
        }
      }
      else
      {
        sub_213DAFEC4((uint64_t)&v255, &qword_253F06970);
      }
      sub_213DAFEC4((uint64_t)&v259, &qword_253F06970);
      v67 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
      v68 = v66;
      v69 = 1;
LABEL_31:
      v70 = v250;
      v67(v68, v69, 1, v250);
      swift_bridgeObjectRelease();
      v71 = v23;
      v72 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
      if (v72(v66, 1, v70) != 1)
      {
        v75 = *(void (**)(char *, char *, uint64_t))(v71 + 32);
        v76 = (uint64_t)v229;
        v75(v229, v66, v70);
        v67((char *)v76, 0, 1, v70);
        goto LABEL_47;
      }
      v73 = v58[2];
      if (v73)
      {
        v74 = (uint64_t)(v58 + 4);
        swift_bridgeObjectRetain_n();
        while (1)
        {
          sub_213DAFDFC(v74, (uint64_t)&v255);
          sub_213DAFDFC((uint64_t)&v255, (uint64_t)&v254);
          __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
          type metadata accessor for CommonFeature.StartTimestamp(0);
          if (swift_dynamicCast())
            break;
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v255);
          v74 += 40;
          if (!--v73)
          {
            swift_bridgeObjectRelease();
            goto LABEL_39;
          }
        }
        swift_bridgeObjectRelease();
        swift_release();
        sub_213DB0BF0(&v255, (uint64_t)&v259);
        v77 = (uint64_t)v232;
      }
      else
      {
        swift_bridgeObjectRetain();
LABEL_39:
        v77 = (uint64_t)v232;
        v261 = 0;
        v259 = 0u;
        v260 = 0u;
      }
      sub_213DAFE40((uint64_t)&v259, (uint64_t)&v255);
      if (!v257)
      {
        sub_213DAFEC4((uint64_t)&v255, &qword_253F06970);
LABEL_45:
        sub_213DAFEC4((uint64_t)&v259, &qword_253F06970);
        swift_bridgeObjectRelease();
        v78 = 1;
        goto LABEL_46;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
      type metadata accessor for CommonFeature.StartTimestamp(0);
      if ((swift_dynamicCast() & 1) == 0)
        goto LABEL_45;
      swift_retain();
      sub_213EF23D0();
      swift_release_n();
      sub_213DAFEC4((uint64_t)&v259, &qword_253F06970);
      swift_bridgeObjectRelease();
      sub_213EF1CC8();
      v78 = 0;
LABEL_46:
      v76 = (uint64_t)v229;
      v70 = v250;
      v67(v229, v78, 1, v250);
      sub_213DAFEC4(v77, &qword_253F04800);
LABEL_47:
      if (v72((char *)v76, 1, v70) == 1)
      {
        sub_213EF1C74();
        sub_213DAFEC4(v76, &qword_253F04800);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v251 + 32))(v234, v76, v70);
      }
      v79 = *(_QWORD *)(v63 + 16);
      if (v79)
      {
        v80 = v63 + 32;
        swift_bridgeObjectRetain_n();
        while (1)
        {
          sub_213DAFDFC(v80, (uint64_t)&v255);
          sub_213DAFDFC((uint64_t)&v255, (uint64_t)&v259);
          __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
          type metadata accessor for CommonFeature.OrderingTimestamp(0);
          if (swift_dynamicCast())
            break;
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v255);
          v80 += 40;
          if (!--v79)
          {
            swift_bridgeObjectRelease();
            goto LABEL_56;
          }
        }
        swift_bridgeObjectRelease();
        swift_release();
        sub_213DB0BF0(&v255, (uint64_t)&v259);
      }
      else
      {
        swift_bridgeObjectRetain();
LABEL_56:
        v261 = 0;
        v259 = 0u;
        v260 = 0u;
      }
      v81 = v233;
      sub_213DAFE40((uint64_t)&v259, (uint64_t)&v255);
      if (v257)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
        type metadata accessor for CommonFeature.OrderingTimestamp(0);
        if ((swift_dynamicCast() & 1) != 0)
        {
          swift_retain();
          sub_213EF23D0();
          swift_release_n();
          v82 = 0;
          goto LABEL_63;
        }
      }
      else
      {
        sub_213DAFEC4((uint64_t)&v255, &qword_253F06970);
      }
      v82 = 1;
LABEL_63:
      sub_213DAFEC4((uint64_t)&v259, &qword_253F06970);
      v83 = v250;
      v67(v81, v82, 1, v250);
      swift_bridgeObjectRelease();
      v84 = v72(v81, 1, v83);
      v252 = v63;
      if (v84 != 1)
      {
        v87 = (uint64_t)v230;
        (*(void (**)(char *, char *, uint64_t))(v251 + 32))(v230, v81, v83);
        v67((char *)v87, 0, 1, v83);
        goto LABEL_80;
      }
      v85 = *(_QWORD *)(v63 + 16);
      if (v85)
      {
        v86 = v63 + 32;
        swift_bridgeObjectRetain_n();
        while (1)
        {
          sub_213DAFDFC(v86, (uint64_t)&v255);
          sub_213DAFDFC((uint64_t)&v255, (uint64_t)&v254);
          __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
          type metadata accessor for CommonFeature.StartTimestamp(0);
          if (swift_dynamicCast())
            break;
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v255);
          v86 += 40;
          if (!--v85)
          {
            swift_bridgeObjectRelease();
            goto LABEL_71;
          }
        }
        swift_bridgeObjectRelease();
        swift_release();
        sub_213DB0BF0(&v255, (uint64_t)&v259);
        v88 = (uint64_t)v233;
      }
      else
      {
        swift_bridgeObjectRetain();
LABEL_71:
        v88 = (uint64_t)v233;
        v261 = 0;
        v259 = 0u;
        v260 = 0u;
      }
      v87 = (uint64_t)v230;
      sub_213DAFE40((uint64_t)&v259, (uint64_t)&v255);
      if (!v257)
      {
        sub_213DAFEC4((uint64_t)&v255, &qword_253F06970);
LABEL_78:
        sub_213DAFEC4((uint64_t)&v259, &qword_253F06970);
        swift_bridgeObjectRelease();
        v89 = 1;
        goto LABEL_79;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
      type metadata accessor for CommonFeature.StartTimestamp(0);
      if ((swift_dynamicCast() & 1) == 0)
      {
        v87 = (uint64_t)v230;
        goto LABEL_78;
      }
      swift_retain();
      sub_213EF23D0();
      swift_release_n();
      sub_213DAFEC4((uint64_t)&v259, &qword_253F06970);
      swift_bridgeObjectRelease();
      v87 = (uint64_t)v230;
      sub_213EF1CC8();
      v89 = 0;
LABEL_79:
      v83 = v250;
      v67((char *)v87, v89, 1, v250);
      sub_213DAFEC4(v88, &qword_253F04800);
LABEL_80:
      v90 = v72((char *)v87, 1, v83);
      v91 = v228;
      if (v90 == 1)
      {
        sub_213EF1C68();
        sub_213DAFEC4(v87, &qword_253F04800);
        v92 = v251;
      }
      else
      {
        v92 = v251;
        (*(void (**)(char *, uint64_t, uint64_t))(v251 + 32))(v228, v87, v83);
      }
      v93 = v234;
      v94 = sub_213EF1CA4();
      v95 = v92;
      v96 = *(void (**)(char *, uint64_t))(v92 + 8);
      v96(v91, v83);
      v96(v93, v83);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (((v247 ^ v94) & 1) != 0)
        break;
      v45 = v236;
      v56 = v236 + 1;
      v42 = v243;
      v40 = v240;
      v23 = v95;
      if (v236 + 1 == v231)
      {
        v56 = v231;
        goto LABEL_87;
      }
    }
    v42 = v243;
    v40 = v240;
    v56 = v236;
    v23 = v95;
LABEL_87:
    if ((v247 & 1) == 0)
    {
      v45 = v56;
      v2 = v226;
      v22 = v250;
      v97 = v231;
      v43 = v238;
      goto LABEL_97;
    }
    v43 = v238;
    v22 = v250;
    if (v56 < v238)
      goto LABEL_270;
    v45 = v56;
    v2 = v226;
    v97 = v231;
    if (v238 < v56)
    {
      v98 = 40 * v56;
      v99 = 40 * v238;
      v100 = v238;
      do
      {
        if (v100 != --v56)
        {
          if (!v40)
            goto LABEL_273;
          v101 = v40 + v99;
          v102 = *(_QWORD *)(v40 + v99);
          v103 = v40 + v98;
          v104 = *(_QWORD *)(v40 + v99 + 24);
          v105 = *(_QWORD *)(v40 + v99 + 32);
          v106 = *(_OWORD *)(v40 + v99 + 8);
          v107 = *(_QWORD *)(v40 + v98 - 8);
          v108 = *(_OWORD *)(v40 + v98 - 24);
          *(_OWORD *)v101 = *(_OWORD *)(v40 + v98 - 40);
          *(_OWORD *)(v101 + 16) = v108;
          *(_QWORD *)(v101 + 32) = v107;
          *(_QWORD *)(v103 - 40) = v102;
          *(_OWORD *)(v103 - 32) = v106;
          *(_QWORD *)(v103 - 16) = v104;
          *(_QWORD *)(v103 - 8) = v105;
        }
        ++v100;
        v98 -= 40;
        v99 += 40;
      }
      while (v100 < v56);
    }
LABEL_97:
    v226 = v2;
    if (v45 >= v97)
    {
      v110 = v45;
      goto LABEL_180;
    }
    if (__OFSUB__(v45, v43))
      goto LABEL_266;
    if (v45 - v43 >= v224)
    {
      v110 = v45;
      goto LABEL_180;
    }
    v109 = v43 + v224;
    if (__OFADD__(v43, v224))
      goto LABEL_268;
    if (v109 >= v97)
      v109 = v97;
    if (v109 < v43)
    {
LABEL_269:
      __break(1u);
LABEL_270:
      __break(1u);
LABEL_271:
      __break(1u);
LABEL_272:
      __break(1u);
LABEL_273:
      __break(1u);
LABEL_274:
      __break(1u);
LABEL_275:
      sub_213EF3048();
      __break(1u);
      return;
    }
    v110 = v45;
    v227 = v109;
    if (v45 != v109)
    {
      while (1)
      {
        v111 = (_QWORD *)(v40 + 40 * v110);
        v112 = v111[1];
        v113 = v111[2];
        v252 = v111[4];
        v253 = v112;
        v236 = v110;
        v114 = v110;
        while (1)
        {
          v246 = v114;
          v115 = (_QWORD *)(v40 + 40 * v114);
          v116 = *(v115 - 4);
          v117 = *(v115 - 3);
          v245 = v115 - 3;
          v244 = v115;
          v118 = *(v115 - 1);
          v119 = *(_QWORD *)(v113 + 16);
          if (v119)
          {
            v120 = v113 + 32;
            swift_bridgeObjectRetain_n();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            while (1)
            {
              sub_213DAFDFC(v120, (uint64_t)&v255);
              sub_213DAFDFC((uint64_t)&v255, (uint64_t)&v259);
              __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
              type metadata accessor for CommonFeature.OrderingTimestamp(0);
              if (swift_dynamicCast())
                break;
              __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v255);
              v120 += 40;
              if (!--v119)
              {
                swift_bridgeObjectRelease();
                v22 = v250;
                goto LABEL_115;
              }
            }
            swift_bridgeObjectRelease();
            swift_release();
            sub_213DB0BF0(&v255, (uint64_t)&v259);
            v22 = v250;
          }
          else
          {
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain_n();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
LABEL_115:
            v261 = 0;
            v259 = 0u;
            v260 = 0u;
          }
          sub_213DAFE40((uint64_t)&v259, (uint64_t)&v255);
          v247 = v116;
          if (v257)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
            type metadata accessor for CommonFeature.OrderingTimestamp(0);
            if ((swift_dynamicCast() & 1) != 0)
            {
              swift_retain();
              sub_213EF23D0();
              swift_release_n();
              sub_213DAFEC4((uint64_t)&v259, &qword_253F06970);
              v121 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56);
              v122 = v42;
              v123 = 0;
              goto LABEL_122;
            }
          }
          else
          {
            sub_213DAFEC4((uint64_t)&v255, &qword_253F06970);
          }
          sub_213DAFEC4((uint64_t)&v259, &qword_253F06970);
          v121 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56);
          v122 = v42;
          v123 = 1;
LABEL_122:
          v124 = v121;
          v121((uint64_t)v122, v123, 1, v22);
          swift_bridgeObjectRelease();
          v125 = v23;
          v126 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
          if (v126(v42, 1, v22) != 1)
          {
            v130 = *(void (**)(char *, char *, uint64_t))(v125 + 32);
            v131 = (uint64_t)v239;
            v130(v239, v42, v22);
            v124(v131, 0, 1, v22);
            goto LABEL_138;
          }
          v127 = *(_QWORD *)(v113 + 16);
          if (v127)
          {
            v128 = v113 + 32;
            swift_bridgeObjectRetain_n();
            while (1)
            {
              sub_213DAFDFC(v128, (uint64_t)&v255);
              sub_213DAFDFC((uint64_t)&v255, (uint64_t)&v254);
              __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
              type metadata accessor for CommonFeature.StartTimestamp(0);
              if (swift_dynamicCast())
                break;
              __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v255);
              v128 += 40;
              if (!--v127)
              {
                swift_bridgeObjectRelease();
                v129 = (uint64_t)v243;
                v22 = v250;
                goto LABEL_130;
              }
            }
            swift_bridgeObjectRelease();
            swift_release();
            sub_213DB0BF0(&v255, (uint64_t)&v259);
            v129 = (uint64_t)v243;
            v22 = v250;
          }
          else
          {
            swift_bridgeObjectRetain();
            v129 = (uint64_t)v243;
LABEL_130:
            v261 = 0;
            v259 = 0u;
            v260 = 0u;
          }
          sub_213DAFE40((uint64_t)&v259, (uint64_t)&v255);
          if (!v257)
          {
            sub_213DAFEC4((uint64_t)&v255, &qword_253F06970);
LABEL_136:
            sub_213DAFEC4((uint64_t)&v259, &qword_253F06970);
            swift_bridgeObjectRelease();
            v132 = 1;
            goto LABEL_137;
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
          type metadata accessor for CommonFeature.StartTimestamp(0);
          if ((swift_dynamicCast() & 1) == 0)
            goto LABEL_136;
          swift_retain();
          sub_213EF23D0();
          swift_release_n();
          sub_213DAFEC4((uint64_t)&v259, &qword_253F06970);
          swift_bridgeObjectRelease();
          sub_213EF1CC8();
          v132 = 0;
LABEL_137:
          v131 = (uint64_t)v239;
          v124((uint64_t)v239, v132, 1, v22);
          sub_213DAFEC4(v129, &qword_253F04800);
LABEL_138:
          if (v126((char *)v131, 1, v22) == 1)
          {
            sub_213EF1C74();
            sub_213DAFEC4(v131, &qword_253F04800);
            v133 = *(_QWORD *)(v117 + 16);
            if (v133)
              goto LABEL_140;
          }
          else
          {
            (*(void (**)(char *, uint64_t, uint64_t))(v251 + 32))(v249, v131, v22);
            v133 = *(_QWORD *)(v117 + 16);
            if (v133)
            {
LABEL_140:
              v134 = v117 + 32;
              swift_bridgeObjectRetain_n();
              while (1)
              {
                sub_213DAFDFC(v134, (uint64_t)&v255);
                sub_213DAFDFC((uint64_t)&v255, (uint64_t)&v259);
                __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
                type metadata accessor for CommonFeature.OrderingTimestamp(0);
                if (swift_dynamicCast())
                  break;
                __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v255);
                v134 += 40;
                if (!--v133)
                {
                  swift_bridgeObjectRelease();
                  v22 = v250;
                  goto LABEL_146;
                }
              }
              swift_bridgeObjectRelease();
              swift_release();
              sub_213DB0BF0(&v255, (uint64_t)&v259);
              v135 = v242;
              v22 = v250;
              goto LABEL_148;
            }
          }
          swift_bridgeObjectRetain();
LABEL_146:
          v261 = 0;
          v259 = 0u;
          v260 = 0u;
          v135 = v242;
LABEL_148:
          sub_213DAFE40((uint64_t)&v259, (uint64_t)&v255);
          if (v257)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
            type metadata accessor for CommonFeature.OrderingTimestamp(0);
            if ((swift_dynamicCast() & 1) != 0)
            {
              swift_retain();
              sub_213EF23D0();
              swift_release_n();
              v136 = 0;
              goto LABEL_153;
            }
          }
          else
          {
            sub_213DAFEC4((uint64_t)&v255, &qword_253F06970);
          }
          v136 = 1;
LABEL_153:
          sub_213DAFEC4((uint64_t)&v259, &qword_253F06970);
          v124((uint64_t)v135, v136, 1, v22);
          swift_bridgeObjectRelease();
          v137 = v126(v135, 1, v22);
          v248 = v118;
          if (v137 != 1)
          {
            v141 = (uint64_t)v241;
            (*(void (**)(char *, char *, uint64_t))(v251 + 32))(v241, v135, v22);
            v124(v141, 0, 1, v22);
            goto LABEL_170;
          }
          v138 = *(_QWORD *)(v117 + 16);
          if (v138)
          {
            v139 = v117 + 32;
            swift_bridgeObjectRetain_n();
            while (1)
            {
              sub_213DAFDFC(v139, (uint64_t)&v255);
              sub_213DAFDFC((uint64_t)&v255, (uint64_t)&v254);
              __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
              type metadata accessor for CommonFeature.StartTimestamp(0);
              if (swift_dynamicCast())
                break;
              __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v255);
              v139 += 40;
              if (!--v138)
              {
                swift_bridgeObjectRelease();
                v140 = (uint64_t)v242;
                v22 = v250;
                goto LABEL_161;
              }
            }
            swift_bridgeObjectRelease();
            swift_release();
            sub_213DB0BF0(&v255, (uint64_t)&v259);
            v140 = (uint64_t)v242;
            v141 = (uint64_t)v241;
            v22 = v250;
          }
          else
          {
            swift_bridgeObjectRetain();
            v140 = (uint64_t)v242;
LABEL_161:
            v261 = 0;
            v259 = 0u;
            v260 = 0u;
            v141 = (uint64_t)v241;
          }
          sub_213DAFE40((uint64_t)&v259, (uint64_t)&v255);
          if (!v257)
          {
            sub_213DAFEC4((uint64_t)&v255, &qword_253F06970);
LABEL_168:
            sub_213DAFEC4((uint64_t)&v259, &qword_253F06970);
            swift_bridgeObjectRelease();
            v142 = 1;
            goto LABEL_169;
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
          type metadata accessor for CommonFeature.StartTimestamp(0);
          if ((swift_dynamicCast() & 1) == 0)
          {
            v141 = (uint64_t)v241;
            goto LABEL_168;
          }
          swift_retain();
          sub_213EF23D0();
          swift_release_n();
          sub_213DAFEC4((uint64_t)&v259, &qword_253F06970);
          swift_bridgeObjectRelease();
          v141 = (uint64_t)v241;
          sub_213EF1CC8();
          v142 = 0;
LABEL_169:
          v124(v141, v142, 1, v22);
          sub_213DAFEC4(v140, &qword_253F04800);
LABEL_170:
          v143 = v126((char *)v141, 1, v22);
          v144 = v237;
          if (v143 == 1)
          {
            sub_213EF1C68();
            sub_213DAFEC4(v141, &qword_253F04800);
            v145 = v251;
          }
          else
          {
            v145 = v251;
            (*(void (**)(char *, uint64_t, uint64_t))(v251 + 32))(v237, v141, v22);
          }
          v146 = v249;
          v147 = sub_213EF1CA4();
          v148 = v145;
          v149 = *(void (**)(char *, uint64_t))(v145 + 8);
          v149(v144, v22);
          v149(v146, v22);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v147 & 1) == 0)
            break;
          v42 = v243;
          v40 = v240;
          if (!v240)
            goto LABEL_271;
          v114 = v246 - 1;
          v150 = v244;
          v151 = *v244;
          v152 = v244[1];
          v153 = v244 - 5;
          v154 = v244 - 2;
          v113 = v244[2];
          v155 = v244[3];
          v156 = v244[4];
          v157 = *(_OWORD *)(v244 - 3);
          *(_OWORD *)v244 = *(_OWORD *)(v244 - 5);
          *((_OWORD *)v150 + 1) = v157;
          v150[4] = *(v150 - 1);
          *v153 = v151;
          v153[1] = v152;
          v253 = v152;
          *v245 = v113;
          *v154 = v155;
          v154[1] = v156;
          v252 = v156;
          v23 = v148;
          if (v114 == v238)
            goto LABEL_107;
        }
        v42 = v243;
        v40 = v240;
        v23 = v148;
LABEL_107:
        v110 = v236 + 1;
        if (v236 + 1 == v227)
        {
          v110 = v227;
          break;
        }
      }
    }
LABEL_180:
    v158 = v238;
    if (v110 < v238)
      goto LABEL_262;
    v41 = v225;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v236 = v110;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v41 = sub_213EE1C74(0, *((_QWORD *)v41 + 2) + 1, 1, v41);
    v161 = *((_QWORD *)v41 + 2);
    v160 = *((_QWORD *)v41 + 3);
    v162 = v161 + 1;
    v2 = v226;
    v40 = v240;
    if (v161 >= v160 >> 1)
    {
      v212 = sub_213EE1C74((char *)(v160 > 1), v161 + 1, 1, v41);
      v40 = v240;
      v41 = v212;
    }
    *((_QWORD *)v41 + 2) = v162;
    v163 = v41 + 32;
    v164 = &v41[16 * v161 + 32];
    v165 = v236;
    *(_QWORD *)v164 = v158;
    *((_QWORD *)v164 + 1) = v165;
    if (v161)
    {
      v42 = v243;
      while (1)
      {
        v166 = v162 - 1;
        if (v162 >= 4)
        {
          v171 = &v163[16 * v162];
          v172 = *((_QWORD *)v171 - 8);
          v173 = *((_QWORD *)v171 - 7);
          v177 = __OFSUB__(v173, v172);
          v174 = v173 - v172;
          if (v177)
            goto LABEL_250;
          v176 = *((_QWORD *)v171 - 6);
          v175 = *((_QWORD *)v171 - 5);
          v177 = __OFSUB__(v175, v176);
          v169 = v175 - v176;
          v170 = v177;
          if (v177)
            goto LABEL_251;
          v178 = v162 - 2;
          v179 = &v163[16 * v162 - 32];
          v181 = *(_QWORD *)v179;
          v180 = *((_QWORD *)v179 + 1);
          v177 = __OFSUB__(v180, v181);
          v182 = v180 - v181;
          if (v177)
            goto LABEL_253;
          v177 = __OFADD__(v169, v182);
          v183 = v169 + v182;
          if (v177)
            goto LABEL_256;
          if (v183 >= v174)
          {
            v201 = &v163[16 * v166];
            v203 = *(_QWORD *)v201;
            v202 = *((_QWORD *)v201 + 1);
            v177 = __OFSUB__(v202, v203);
            v204 = v202 - v203;
            if (v177)
              goto LABEL_260;
            v194 = v169 < v204;
            goto LABEL_218;
          }
        }
        else
        {
          if (v162 != 3)
          {
            v195 = *((_QWORD *)v41 + 4);
            v196 = *((_QWORD *)v41 + 5);
            v177 = __OFSUB__(v196, v195);
            v188 = v196 - v195;
            v189 = v177;
            goto LABEL_212;
          }
          v168 = *((_QWORD *)v41 + 4);
          v167 = *((_QWORD *)v41 + 5);
          v177 = __OFSUB__(v167, v168);
          v169 = v167 - v168;
          v170 = v177;
        }
        if ((v170 & 1) != 0)
          goto LABEL_252;
        v178 = v162 - 2;
        v184 = &v163[16 * v162 - 32];
        v186 = *(_QWORD *)v184;
        v185 = *((_QWORD *)v184 + 1);
        v187 = __OFSUB__(v185, v186);
        v188 = v185 - v186;
        v189 = v187;
        if (v187)
          goto LABEL_255;
        v190 = &v163[16 * v166];
        v192 = *(_QWORD *)v190;
        v191 = *((_QWORD *)v190 + 1);
        v177 = __OFSUB__(v191, v192);
        v193 = v191 - v192;
        if (v177)
          goto LABEL_258;
        if (__OFADD__(v188, v193))
          goto LABEL_259;
        if (v188 + v193 >= v169)
        {
          v194 = v169 < v193;
LABEL_218:
          if (v194)
            v166 = v178;
          goto LABEL_220;
        }
LABEL_212:
        if ((v189 & 1) != 0)
          goto LABEL_254;
        v197 = &v163[16 * v166];
        v199 = *(_QWORD *)v197;
        v198 = *((_QWORD *)v197 + 1);
        v177 = __OFSUB__(v198, v199);
        v200 = v198 - v199;
        if (v177)
          goto LABEL_257;
        if (v200 < v188)
          goto LABEL_229;
LABEL_220:
        v205 = v166 - 1;
        if (v166 - 1 >= v162)
        {
          __break(1u);
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
LABEL_258:
          __break(1u);
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
          __break(1u);
LABEL_265:
          __break(1u);
LABEL_266:
          __break(1u);
LABEL_267:
          __break(1u);
LABEL_268:
          __break(1u);
          goto LABEL_269;
        }
        if (!v40)
          goto LABEL_272;
        v206 = v41;
        v207 = &v163[16 * v205];
        v208 = *(_QWORD *)v207;
        v209 = &v163[16 * v166];
        v210 = *((_QWORD *)v209 + 1);
        sub_213EED2CC((char *)(v40 + 40 * *(_QWORD *)v207), (char *)(v40 + 40 * *(_QWORD *)v209), v40 + 40 * v210, v235);
        if (v2)
          goto LABEL_243;
        if (v210 < v208)
          goto LABEL_247;
        if (v166 > *((_QWORD *)v206 + 2))
          goto LABEL_248;
        *(_QWORD *)v207 = v208;
        *(_QWORD *)&v163[16 * v205 + 8] = v210;
        v211 = *((_QWORD *)v206 + 2);
        if (v166 >= v211)
          goto LABEL_249;
        v41 = v206;
        v162 = v211 - 1;
        memmove(&v163[16 * v166], v209 + 16, 16 * (v211 - 1 - v166));
        *((_QWORD *)v206 + 2) = v211 - 1;
        v194 = v211 > 2;
        v42 = v243;
        v22 = v250;
        v23 = v251;
        v40 = v240;
        if (!v194)
          goto LABEL_229;
      }
    }
    v162 = 1;
    v42 = v243;
LABEL_229:
    v32 = v231;
    v39 = v236;
  }
  while (v236 < v231);
  v37 = v223;
  a1 = v222;
LABEL_232:
  v223 = v37;
  if (v162 >= 2)
  {
    v213 = *a1;
    do
    {
      v214 = v162 - 2;
      if (v162 < 2)
        goto LABEL_261;
      if (!v213)
        goto LABEL_274;
      v215 = v41;
      v216 = v41 + 32;
      v217 = *(_QWORD *)&v41[16 * v214 + 32];
      v218 = *(_QWORD *)&v41[16 * v162 + 24];
      sub_213EED2CC((char *)(v213 + 40 * v217), (char *)(v213 + 40 * *(_QWORD *)&v216[16 * v162 - 16]), v213 + 40 * v218, v235);
      if (v2)
        break;
      if (v218 < v217)
        goto LABEL_263;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v215 = sub_213EE1ECC((uint64_t)v215);
      if (v214 >= *((_QWORD *)v215 + 2))
        goto LABEL_264;
      v219 = &v215[16 * v214 + 32];
      *(_QWORD *)v219 = v217;
      *((_QWORD *)v219 + 1) = v218;
      v220 = *((_QWORD *)v215 + 2);
      if (v162 > v220)
        goto LABEL_265;
      v41 = v215;
      memmove(&v215[16 * v162 + 16], &v215[16 * v162 + 32], 16 * (v220 - v162));
      *((_QWORD *)v215 + 2) = v220 - 1;
      v162 = v220 - 1;
    }
    while (v220 > 2);
  }
LABEL_243:
  swift_bridgeObjectRelease();
  *(_QWORD *)(v223 + 16) = 0;
  swift_bridgeObjectRelease();
}

void sub_213EEC6F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  _BYTE *v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t, uint64_t, uint64_t);
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _BYTE *v57;
  char v58;
  void (*v59)(uint64_t, uint64_t);
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  _BYTE v68[16];
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _BYTE *v74;
  uint64_t v75;
  _BYTE *v76;
  _BYTE *v77;
  _BYTE *v78;
  _QWORD *v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _BYTE *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void (*v88)(uint64_t, uint64_t, uint64_t, uint64_t);
  unsigned int (*v89)(uint64_t, uint64_t, uint64_t);
  _QWORD v90[5];
  __int128 v91;
  uint64_t v92;
  __int128 v93;
  __int128 v94;
  uint64_t v95;

  v71 = a1;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F04800);
  MEMORY[0x24BDAC7A8](v7);
  v9 = &v68[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v10);
  v74 = &v68[-v11];
  MEMORY[0x24BDAC7A8](v12);
  v14 = &v68[-v13];
  MEMORY[0x24BDAC7A8](v15);
  v17 = &v68[-v16];
  v18 = sub_213EF1CF8();
  v85 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  MEMORY[0x24BDAC7A8](v19);
  v84 = &v68[-v21];
  v69 = a2;
  if (a3 != a2)
  {
    v73 = v20;
    v77 = v9;
    v22 = *a4;
    v78 = v14;
    v75 = v18;
    v76 = v17;
    v72 = v22;
LABEL_6:
    v23 = (_QWORD *)(v22 + 40 * a3);
    v24 = v23[1];
    v25 = v23[2];
    v86 = v23[4];
    v87 = v24;
    v70 = a3;
    while (1)
    {
      v26 = v14;
      v81 = a3;
      v27 = (_QWORD *)(v22 + 40 * a3);
      v28 = *(v27 - 4);
      v29 = *(v27 - 3);
      v80 = v27 - 3;
      v30 = *(v27 - 1);
      v31 = *(_QWORD *)(v25 + 16);
      v83 = v28;
      v82 = v30;
      if (v31)
      {
        v32 = v25 + 32;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        while (1)
        {
          sub_213DAFDFC(v32, (uint64_t)&v91);
          sub_213DAFDFC((uint64_t)&v91, (uint64_t)&v93);
          __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
          type metadata accessor for CommonFeature.OrderingTimestamp(0);
          if (swift_dynamicCast())
            break;
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v91);
          v32 += 40;
          if (!--v31)
          {
            swift_bridgeObjectRelease();
            v33 = (uint64_t)v78;
            v34 = (uint64_t)v76;
            goto LABEL_13;
          }
        }
        swift_bridgeObjectRelease();
        swift_release();
        sub_213DB0BF0(&v91, (uint64_t)&v93);
        v33 = (uint64_t)v78;
        v34 = (uint64_t)v76;
      }
      else
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v34 = (uint64_t)v76;
        v33 = (uint64_t)v26;
LABEL_13:
        v95 = 0;
        v93 = 0u;
        v94 = 0u;
      }
      sub_213DAFE40((uint64_t)&v93, (uint64_t)&v91);
      if (v92)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
        type metadata accessor for CommonFeature.OrderingTimestamp(0);
        if ((swift_dynamicCast() & 1) != 0)
        {
          swift_retain();
          sub_213EF23D0();
          swift_release_n();
          sub_213DAFEC4((uint64_t)&v93, &qword_253F06970);
          v35 = v85;
          v36 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v85 + 56);
          v37 = v33;
          v38 = 0;
          goto LABEL_20;
        }
      }
      else
      {
        sub_213DAFEC4((uint64_t)&v91, &qword_253F06970);
      }
      sub_213DAFEC4((uint64_t)&v93, &qword_253F06970);
      v35 = v85;
      v36 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v85 + 56);
      v37 = v33;
      v38 = 1;
LABEL_20:
      v88 = v36;
      v36(v37, v38, 1, v18);
      swift_bridgeObjectRelease();
      v89 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48);
      if (v89(v33, 1, v18) != 1)
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 32))(v34, v33, v18);
        v88(v34, 0, 1, v18);
        goto LABEL_37;
      }
      v39 = *(_QWORD *)(v25 + 16);
      if (v39)
      {
        v40 = v25 + 32;
        swift_bridgeObjectRetain_n();
        while (1)
        {
          sub_213DAFDFC(v40, (uint64_t)&v91);
          sub_213DAFDFC((uint64_t)&v91, (uint64_t)v90);
          __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
          type metadata accessor for CommonFeature.StartTimestamp(0);
          if (swift_dynamicCast())
            break;
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v91);
          v40 += 40;
          if (!--v39)
          {
            swift_bridgeObjectRelease();
            v33 = (uint64_t)v78;
            goto LABEL_28;
          }
        }
        swift_bridgeObjectRelease();
        swift_release();
        sub_213DB0BF0(&v91, (uint64_t)&v93);
        v33 = (uint64_t)v78;
        v34 = (uint64_t)v76;
      }
      else
      {
        swift_bridgeObjectRetain();
LABEL_28:
        v34 = (uint64_t)v76;
        v95 = 0;
        v93 = 0u;
        v94 = 0u;
      }
      v41 = v88;
      sub_213DAFE40((uint64_t)&v93, (uint64_t)&v91);
      if (!v92)
      {
        sub_213DAFEC4((uint64_t)&v91, &qword_253F06970);
LABEL_35:
        sub_213DAFEC4((uint64_t)&v93, &qword_253F06970);
        swift_bridgeObjectRelease();
        v41(v34, 1, 1, v18);
        goto LABEL_36;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
      type metadata accessor for CommonFeature.StartTimestamp(0);
      if ((swift_dynamicCast() & 1) == 0)
      {
        v41 = v88;
        goto LABEL_35;
      }
      swift_retain();
      sub_213EF23D0();
      swift_release_n();
      sub_213DAFEC4((uint64_t)&v93, &qword_253F06970);
      swift_bridgeObjectRelease();
      sub_213EF1CC8();
      v88(v34, 0, 1, v18);
LABEL_36:
      sub_213DAFEC4(v33, &qword_253F04800);
LABEL_37:
      if (v89(v34, 1, v18) == 1)
      {
        sub_213EF1C74();
        sub_213DAFEC4(v34, &qword_253F04800);
        v42 = *(_QWORD *)(v29 + 16);
        if (v42)
          goto LABEL_39;
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t, uint64_t))(v85 + 32))(v84, v34, v18);
        v42 = *(_QWORD *)(v29 + 16);
        if (v42)
        {
LABEL_39:
          v43 = v29 + 32;
          swift_bridgeObjectRetain_n();
          while (1)
          {
            sub_213DAFDFC(v43, (uint64_t)&v91);
            sub_213DAFDFC((uint64_t)&v91, (uint64_t)&v93);
            __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
            type metadata accessor for CommonFeature.OrderingTimestamp(0);
            if (swift_dynamicCast())
              break;
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v91);
            v43 += 40;
            if (!--v42)
            {
              swift_bridgeObjectRelease();
              v33 = (uint64_t)v78;
              goto LABEL_45;
            }
          }
          swift_bridgeObjectRelease();
          swift_release();
          sub_213DB0BF0(&v91, (uint64_t)&v93);
          v44 = v77;
          v33 = (uint64_t)v78;
          goto LABEL_47;
        }
      }
      swift_bridgeObjectRetain();
LABEL_45:
      v95 = 0;
      v93 = 0u;
      v94 = 0u;
      v44 = v77;
LABEL_47:
      sub_213DAFE40((uint64_t)&v93, (uint64_t)&v91);
      if (v92)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
        type metadata accessor for CommonFeature.OrderingTimestamp(0);
        if ((swift_dynamicCast() & 1) != 0)
        {
          swift_retain();
          sub_213EF23D0();
          swift_release_n();
          v45 = 0;
          goto LABEL_52;
        }
      }
      else
      {
        sub_213DAFEC4((uint64_t)&v91, &qword_253F06970);
      }
      v45 = 1;
LABEL_52:
      sub_213DAFEC4((uint64_t)&v93, &qword_253F06970);
      v46 = v45;
      v47 = v88;
      v88((uint64_t)v44, v46, 1, v18);
      swift_bridgeObjectRelease();
      v48 = v89((uint64_t)v44, 1, v18);
      v79 = v27;
      if (v48 != 1)
      {
        v52 = v47;
        v53 = (uint64_t)v74;
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v85 + 32))(v74, v44, v18);
        v52(v53, 0, 1, v18);
        goto LABEL_69;
      }
      v49 = *(_QWORD *)(v29 + 16);
      if (v49)
      {
        v50 = v29 + 32;
        swift_bridgeObjectRetain_n();
        while (1)
        {
          sub_213DAFDFC(v50, (uint64_t)&v91);
          sub_213DAFDFC((uint64_t)&v91, (uint64_t)v90);
          __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
          type metadata accessor for CommonFeature.StartTimestamp(0);
          if (swift_dynamicCast())
            break;
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v91);
          v50 += 40;
          if (!--v49)
          {
            swift_bridgeObjectRelease();
            v51 = (uint64_t)v77;
            v33 = (uint64_t)v78;
            goto LABEL_60;
          }
        }
        swift_bridgeObjectRelease();
        swift_release();
        sub_213DB0BF0(&v91, (uint64_t)&v93);
        v51 = (uint64_t)v77;
        v53 = (uint64_t)v74;
        v33 = (uint64_t)v78;
      }
      else
      {
        swift_bridgeObjectRetain();
        v51 = (uint64_t)v77;
LABEL_60:
        v95 = 0;
        v93 = 0u;
        v94 = 0u;
        v53 = (uint64_t)v74;
      }
      sub_213DAFE40((uint64_t)&v93, (uint64_t)&v91);
      if (!v92)
      {
        sub_213DAFEC4((uint64_t)&v91, &qword_253F06970);
LABEL_67:
        sub_213DAFEC4((uint64_t)&v93, &qword_253F06970);
        swift_bridgeObjectRelease();
        v54 = 1;
        goto LABEL_68;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F06968);
      type metadata accessor for CommonFeature.StartTimestamp(0);
      if ((swift_dynamicCast() & 1) == 0)
      {
        v53 = (uint64_t)v74;
        goto LABEL_67;
      }
      swift_retain();
      sub_213EF23D0();
      swift_release_n();
      sub_213DAFEC4((uint64_t)&v93, &qword_253F06970);
      swift_bridgeObjectRelease();
      v53 = (uint64_t)v74;
      sub_213EF1CC8();
      v54 = 0;
LABEL_68:
      v18 = v75;
      v88(v53, v54, 1, v75);
      sub_213DAFEC4(v51, &qword_253F04800);
LABEL_69:
      v14 = (_BYTE *)v33;
      if (v89(v53, 1, v18) == 1)
      {
        v55 = v73;
        sub_213EF1C68();
        sub_213DAFEC4(v53, &qword_253F04800);
        v56 = v85;
      }
      else
      {
        v56 = v85;
        v55 = v73;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v85 + 32))(v73, v53, v18);
      }
      v57 = v84;
      v58 = sub_213EF1CA4();
      v59 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
      v59(v55, v18);
      v59((uint64_t)v57, v18);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v58 & 1) == 0)
      {
        v22 = v72;
        v18 = v75;
LABEL_5:
        a3 = v70 + 1;
        if (v70 + 1 == v69)
          return;
        goto LABEL_6;
      }
      v22 = v72;
      if (!v72)
      {
        __break(1u);
        return;
      }
      a3 = v81 - 1;
      v60 = v79;
      v61 = *v79;
      v62 = v79[1];
      v63 = v79 - 5;
      v64 = v79 - 2;
      v25 = v79[2];
      v65 = v79[3];
      v66 = v79[4];
      v67 = *(_OWORD *)(v79 - 3);
      *(_OWORD *)v79 = *(_OWORD *)(v79 - 5);
      *((_OWORD *)v60 + 1) = v67;
      v60[4] = *(v60 - 1);
      *v63 = v61;
      v63[1] = v62;
      v87 = v62;
      *v80 = v25;
      *v64 = v65;
      v64[1] = v66;
      v86 = v66;
      v18 = v75;
      if (a3 == v71)
        goto LABEL_5;
    }
  }
}

uint64_t sub_213EED2CC(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char *v4;
  char *v5;
  char *v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  char v13;
  char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char *v19;
  unint64_t v20;
  char *v21;
  char v22;
  char v23;
  char *v24;
  unint64_t v25;
  unint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t result;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  const void *v41[2];
  char *v42;

  v4 = __dst;
  v5 = a2;
  v6 = __src;
  v7 = a2 - __src;
  v8 = (a2 - __src) / 40;
  v9 = a3 - (_QWORD)a2;
  v10 = (uint64_t)(a3 - (_QWORD)a2) / 40;
  v42 = __src;
  v41[0] = __dst;
  if (v8 >= v10)
  {
    if (v9 >= -39)
    {
      if (__dst != a2 || &a2[40 * v10] <= __dst)
        memmove(__dst, a2, 40 * v10);
      v19 = &v4[40 * v10];
      v40 = v19;
      v42 = v5;
      if (v6 < v5 && v9 >= 40)
      {
        v20 = a3 - 40;
        v21 = v5;
        v32 = v4;
        v38 = v6;
        while (1)
        {
          v37 = v20;
          v34 = v19;
          v19 -= 40;
          v21 -= 40;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v22 = sub_213EEA284();
          if (v39)
            goto LABEL_40;
          v23 = v22;
          v33 = (char *)(v37 + 40);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v23 & 1) != 0)
          {
            v19 = v34;
            v24 = v32;
            v25 = v37;
            v26 = (unint64_t)v38;
            if (v33 != v5 || v37 >= (unint64_t)v5)
            {
              v27 = *(_OWORD *)v21;
              v28 = *((_OWORD *)v21 + 1);
              *(_QWORD *)(v37 + 32) = *((_QWORD *)v21 + 4);
              *(_OWORD *)v37 = v27;
              *(_OWORD *)(v37 + 16) = v28;
            }
            v42 = v21;
          }
          else
          {
            v40 = v19;
            v24 = v32;
            v25 = v37;
            v26 = (unint64_t)v38;
            v21 = v5;
            if (v33 < v34 || v37 >= (unint64_t)v34 || v33 != v34)
            {
              v29 = *(_OWORD *)v19;
              v30 = *((_OWORD *)v19 + 1);
              *(_QWORD *)(v37 + 32) = *((_QWORD *)v19 + 4);
              *(_OWORD *)v37 = v29;
              *(_OWORD *)(v37 + 16) = v30;
            }
          }
          if ((unint64_t)v21 > v26)
          {
            v20 = v25 - 40;
            v5 = v21;
            if (v19 > v24)
              continue;
          }
          break;
        }
      }
LABEL_39:
      sub_213EE1D6C((void **)&v42, v41, &v40);
      return 1;
    }
  }
  else if (v7 >= -39)
  {
    if (__dst != __src || &__src[40 * v8] <= __dst)
      memmove(__dst, __src, 40 * v8);
    v35 = &v4[40 * v8];
    v40 = v35;
    if ((unint64_t)v5 < a3 && v7 >= 40)
    {
      while (1)
      {
        v11 = v4;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v12 = sub_213EEA284();
        if (v39)
          break;
        v13 = v12;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v13 & 1) != 0)
        {
          v14 = v5 + 40;
          if (v6 < v5 || v6 >= v14 || v6 != v5)
          {
            v15 = *(_OWORD *)v5;
            v16 = *((_OWORD *)v5 + 1);
            *((_QWORD *)v6 + 4) = *((_QWORD *)v5 + 4);
            *(_OWORD *)v6 = v15;
            *((_OWORD *)v6 + 1) = v16;
          }
        }
        else
        {
          if (v6 != v4)
          {
            v17 = *(_OWORD *)v4;
            v18 = *((_OWORD *)v4 + 1);
            *((_QWORD *)v6 + 4) = *((_QWORD *)v4 + 4);
            *(_OWORD *)v6 = v17;
            *((_OWORD *)v6 + 1) = v18;
          }
          v4 += 40;
          v41[0] = v11 + 40;
          v14 = v5;
        }
        v6 += 40;
        v42 = v6;
        if (v4 < v35)
        {
          v5 = v14;
          if ((unint64_t)v14 < a3)
            continue;
        }
        goto LABEL_39;
      }
LABEL_40:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_213EE1D6C((void **)&v42, v41, &v40);
      return 1;
    }
    goto LABEL_39;
  }
  result = sub_213EF30A8();
  __break(1u);
  return result;
}

uint64_t UsoPersonRecipients.__allocating_init(value:)()
{
  swift_allocObject();
  return sub_213EF23C4();
}

{
  swift_allocObject();
  return sub_213EF23B8();
}

uint64_t SendMessageFeatureExtractor.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t SendMessageFeatureExtractor.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_213EED7E4()
{
  uint64_t v0;

  if (!sub_213EF21B4())
    return MEMORY[0x24BEE4AF8];
  v0 = sub_213EEDDF4();
  swift_release();
  return v0;
}

uint64_t SendMessageFeatureExtractor.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SendMessageFeatureExtractor.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_213EED840()
{
  uint64_t v0;

  if (!sub_213EF21B4())
    return MEMORY[0x24BEE4AF8];
  v0 = sub_213EEDDF4();
  swift_release();
  return v0;
}

uint64_t UsoPersonRecipients.__allocating_init(value:)(uint64_t a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F04EF0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_213EF8CA0;
  *(_QWORD *)(v2 + 32) = a1;
  sub_213EF2A54();
  type metadata accessor for UsoPersonRecipients();
  swift_allocObject();
  return sub_213EF23C4();
}

uint64_t UsoPersonRecipients.init(value:)()
{
  return sub_213EF23C4();
}

{
  return sub_213EF23B8();
}

uint64_t UsoPersonRecipients.__deallocating_deinit()
{
  _s28SiriPrivateLearningInference13CommonFeatureO09DonatedByA0Cfd_0();
  return swift_deallocClassInstance();
}

uint64_t sub_213EED9B4()
{
  type metadata accessor for UsoPersonRecipients();
  swift_allocObject();
  return sub_213EF23C4();
}

uint64_t sub_213EED9FC()
{
  type metadata accessor for UsoPersonRecipients();
  swift_allocObject();
  return sub_213EF23B8();
}

uint64_t sub_213EEDA44()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v0 = sub_213EF1DF4();
  if (v1)
  {
    v2 = v0;
    v3 = v1;
    swift_bridgeObjectRelease();
    v4 = HIBYTE(v3) & 0xF;
    if ((v3 & 0x2000000000000000) == 0)
      v4 = v2 & 0xFFFFFFFFFFFFLL;
    if (v4)
      return 1;
  }
  v5 = sub_213EF1E54();
  if (v5
    && (v5 >> 62 ? (v6 = sub_213EF306C()) : (v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10)),
        swift_bridgeObjectRelease(),
        v6))
  {
    return 1;
  }
  else
  {
    return 0;
  }
}

uint64_t sub_213EEDADC()
{
  unint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v0 = sub_213EF1E48();
  v1 = MEMORY[0x24BEE4AF8];
  if (!v0)
    return v1;
  v2 = v0;
  v15 = MEMORY[0x24BEE4AF8];
  if (v0 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_213EF306C();
    if (v3)
      goto LABEL_4;
    goto LABEL_28;
  }
  v3 = *(_QWORD *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v3)
  {
LABEL_28:
    swift_bridgeObjectRelease();
    v1 = MEMORY[0x24BEE4AF8];
LABEL_29:
    swift_bridgeObjectRelease();
    return v1;
  }
LABEL_4:
  result = sub_213EF1E30();
  if (v3 >= 1)
  {
    v5 = 0;
    v6 = v2 & 0xC000000000000001;
    while (1)
    {
      if (v6)
        MEMORY[0x2199C49B0](v5, v2);
      else
        swift_retain();
      sub_213EF1DAC();
      if (v13)
      {
        sub_213EF1D94();
        swift_release();
      }
      sub_213EF1E9C();
      swift_release();
      if (v14)
        break;
      sub_213EF1DAC();
      if (v13)
      {
        sub_213EF1DF4();
        if (v8)
        {
          sub_213EF1F80();
          swift_allocObject();
          v9 = sub_213EF1F74();
          sub_213EF1F68();
          swift_bridgeObjectRelease();
          if (sub_213EF1DE8())
          {
            sub_213EF1ECC();
            v11 = v10;
            swift_release();
            if (v11)
            {
              sub_213EF20A0();
              swift_allocObject();
              sub_213EF2094();
              sub_213EF2034();
              swift_bridgeObjectRelease();
              swift_retain();
              sub_213EF1F5C();
              swift_release_n();
            }
          }
          MEMORY[0x2199C3918](v9);
          sub_213EF1E9C();
          swift_release();
          swift_release();
          swift_release();
          v7 = swift_release();
          v6 = v2 & 0xC000000000000001;
          if (!v12)
            goto LABEL_7;
          goto LABEL_15;
        }
        swift_release();
      }
      swift_release();
LABEL_7:
      if (v3 == ++v5)
      {
        swift_bridgeObjectRelease();
        v1 = v15;
        goto LABEL_29;
      }
    }
    v7 = swift_release();
LABEL_15:
    MEMORY[0x2199C44C4](v7);
    if (*(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_213EF2A78();
    sub_213EF2AB4();
    sub_213EF2A54();
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_213EEDDF4()
{
  unint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  char v4;
  uint64_t HasPayload;
  uint64_t v6;
  uint64_t v7;
  __int128 *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  _QWORD *v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  _BYTE v34[32];

  v3 = MEMORY[0x2199C3864]();
  if (v3 >> 62)
  {
    if (sub_213EF306C())
      goto LABEL_3;
LABEL_29:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  if (!*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_29;
LABEL_3:
  if ((v3 & 0xC000000000000001) != 0)
  {
    MEMORY[0x2199C49B0](0, v3);
  }
  else
  {
    if (!*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_34;
    }
    swift_retain();
  }
  swift_bridgeObjectRelease();
  swift_retain();
  sub_213EF1E6C();
  swift_release();
  sub_213E5163C((uint64_t)v34, (uint64_t)&v30);
  if (v31)
  {
    sub_213EF1F38();
    if ((swift_dynamicCast() & 1) != 0)
    {
      v0 = v33;
      swift_retain();
      sub_213EF1E3C();
      swift_release();
      if ((_QWORD)v30)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_254D3D540);
        v1 = swift_allocObject();
        *(_OWORD *)(v1 + 16) = xmmword_213EF53E0;
        v4 = sub_213EEDA44();
        HasPayload = type metadata accessor for SendMessageUSOFeature.MessageHasPayload(0);
        swift_allocObject();
        LOBYTE(v30) = v4 & 1;
        v6 = sub_213EF23C4();
        *(_QWORD *)(v1 + 56) = HasPayload;
        *(_QWORD *)(v1 + 64) = sub_213DB196C(&qword_254D414F8, 255, type metadata accessor for SendMessageUSOFeature.MessageHasPayload, MEMORY[0x24BEA4F80]);
        *(_QWORD *)(v1 + 32) = v6;
        v2 = sub_213EEDADC();
        if (!(v2 >> 62))
        {
          v7 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (v7)
            goto LABEL_11;
          goto LABEL_39;
        }
LABEL_34:
        swift_bridgeObjectRetain();
        v22 = sub_213EF306C();
        swift_bridgeObjectRelease();
        if (v22)
        {
          swift_bridgeObjectRetain();
          v7 = sub_213EF306C();
          swift_bridgeObjectRelease();
          if (!v7)
          {
            v29 = (_QWORD *)v1;
            v11 = MEMORY[0x24BEE4AF8];
            goto LABEL_37;
          }
LABEL_11:
          v29 = (_QWORD *)v1;
          *(_QWORD *)&v30 = MEMORY[0x24BEE4AF8];
          v8 = &v30;
          sub_213DCD0C8(0, v7 & ~(v7 >> 63), 0);
          if (v7 < 0)
          {
            __break(1u);
            goto LABEL_46;
          }
          v10 = 0;
          v11 = v30;
          v12 = v2 & 0xC000000000000001;
          v13 = v2;
          do
          {
            if (v12)
              MEMORY[0x2199C49B0](v10, v2);
            else
              swift_retain();
            v14 = sub_213EF1E24();
            v16 = v15;
            swift_release();
            if (v16)
              v17 = v14;
            else
              v17 = 0;
            if (!v16)
              v16 = 0xE000000000000000;
            *(_QWORD *)&v30 = v11;
            v19 = *(_QWORD *)(v11 + 16);
            v18 = *(_QWORD *)(v11 + 24);
            if (v19 >= v18 >> 1)
            {
              sub_213DCD0C8(v18 > 1, v19 + 1, 1);
              v11 = v30;
            }
            ++v10;
            *(_QWORD *)(v11 + 16) = v19 + 1;
            v20 = v11 + 16 * v19;
            *(_QWORD *)(v20 + 32) = v17;
            *(_QWORD *)(v20 + 40) = v16;
            v2 = v13;
          }
          while (v7 != v10);
LABEL_37:
          v23 = type metadata accessor for SendMessageUSOFeature.RecipientNames(0);
          swift_allocObject();
          *(_QWORD *)&v30 = v11;
          v24 = sub_213EF23C4();
          v1 = (uint64_t)sub_213DB59A4((_QWORD *)1, 2, 1, v29);
          v31 = v23;
          v32 = sub_213DB196C(&qword_254D41500, 255, type metadata accessor for SendMessageUSOFeature.RecipientNames, MEMORY[0x24BEA4F80]);
          *(_QWORD *)&v30 = v24;
          *(_QWORD *)(v1 + 16) = 2;
          sub_213DB0BF0(&v30, v1 + 72);
          v7 = type metadata accessor for UsoPersonRecipients();
          swift_allocObject();
          *(_QWORD *)&v30 = v2;
          v8 = (__int128 *)sub_213EF23C4();
          v0 = *(_QWORD *)(v1 + 16);
          v9 = *(_QWORD *)(v1 + 24);
          v2 = v0 + 1;
          if (v0 < v9 >> 1)
          {
LABEL_38:
            v31 = v7;
            v32 = sub_213DB196C(&qword_254D3E600, 255, (uint64_t (*)(uint64_t))type metadata accessor for UsoPersonRecipients, MEMORY[0x24BEA4F80]);
            *(_QWORD *)&v30 = v8;
            *(_QWORD *)(v1 + 16) = v2;
            sub_213DB0BF0(&v30, v1 + 40 * v0 + 32);
            swift_release();
LABEL_44:
            swift_release();
            swift_release();
            sub_213E43920((uint64_t)v34);
            return v1;
          }
LABEL_46:
          v1 = (uint64_t)sub_213DB59A4((_QWORD *)(v9 > 1), v2, 1, (_QWORD *)v1);
          goto LABEL_38;
        }
LABEL_39:
        swift_bridgeObjectRelease();
        if (qword_253F04A88 != -1)
          swift_once();
        v25 = sub_213EF2724();
        __swift_project_value_buffer(v25, (uint64_t)qword_253F08A00);
        v26 = sub_213EF270C();
        v27 = sub_213EF2C88();
        if (os_log_type_enabled(v26, v27))
        {
          v28 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v28 = 0;
          _os_log_impl(&dword_213DAB000, v26, v27, "Cannot extract message recipient features from turn: No recipients", v28, 2u);
          MEMORY[0x2199C53C4](v28, -1, -1);
        }
        swift_release();

        goto LABEL_44;
      }
      swift_release();
    }
  }
  else
  {
    sub_213E43920((uint64_t)&v30);
  }
  swift_release();
  sub_213E43920((uint64_t)v34);
  return MEMORY[0x24BEE4AF8];
}

uint64_t type metadata accessor for UsoPersonRecipients()
{
  uint64_t result;

  result = qword_253F06B00;
  if (!qword_253F06B00)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_213EEE3A8(uint64_t a1, uint64_t a2)
{
  return sub_213DB196C(&qword_253F06CD8, a2, (uint64_t (*)(uint64_t))type metadata accessor for SendMessageFeatureExtractor, (uint64_t)&protocol conformance descriptor for SendMessageFeatureExtractor);
}

uint64_t type metadata accessor for SendMessageFeatureExtractor()
{
  return objc_opt_self();
}

uint64_t method lookup function for SendMessageFeatureExtractor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SendMessageFeatureExtractor.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of SendMessageFeatureExtractor.extract(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t sub_213EEE414()
{
  return swift_initClassMetadata2();
}

uint64_t sub_213EEE450()
{
  return type metadata accessor for UsoPersonRecipients();
}

uint64_t CommonInteractionFeatureExtractor.__allocating_init()()
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = MEMORY[0x24BEE4AF8];
  return result;
}

uint64_t CommonInteractionFeatureExtractor.intentTypes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CommonInteractionFeatureExtractor.init()()
{
  uint64_t v0;
  uint64_t result;

  result = v0;
  *(_QWORD *)(v0 + 16) = MEMORY[0x24BEE4AF8];
  return result;
}

uint64_t CommonInteractionFeatureExtractor.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t CommonInteractionFeatureExtractor.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_213EEE4E4()
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  id v22;
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
  id v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int (*v47)(char *, uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  void *v55;
  uint64_t v56;
  void (*v57)(uint64_t, uint64_t, uint64_t, uint64_t);
  unsigned int v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  BOOL v62;
  uint64_t started;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  unsigned int v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  BOOL v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t i;
  _QWORD *v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  __n128 v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v91;
  char *v92;
  char *v93;
  uint64_t v94;
  char *v95;
  char *v96;
  char *v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  __int128 v102;
  uint64_t v103;
  uint64_t v104;
  __int128 v105[2];
  uint64_t v106;
  uint64_t v107;
  uint64_t v108[3];
  __int128 v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
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
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;

  v0 = sub_213EF1CF8();
  v1 = *(_QWORD *)(v0 - 8);
  v99 = v0;
  v100 = v1;
  MEMORY[0x24BDAC7A8](v0);
  v92 = (char *)&v91 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D3BA98);
  MEMORY[0x24BDAC7A8](v3);
  v97 = (char *)&v91 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v98 = (char *)&v91 - v6;
  MEMORY[0x24BDAC7A8](v7);
  v95 = (char *)&v91 - v8;
  MEMORY[0x24BDAC7A8](v9);
  v96 = (char *)&v91 - v10;
  MEMORY[0x24BDAC7A8](v11);
  v93 = (char *)&v91 - v12;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v91 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F04800);
  MEMORY[0x24BDAC7A8](v16);
  v94 = (uint64_t)&v91 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v91 - v19;
  v21 = (void *)sub_213EF2220();
  v109 = xmmword_213F03E60;
  v22 = objc_msgSend(v21, sel_identifier);
  v23 = sub_213EF2850();
  v25 = v24;

  v26 = type metadata accessor for CommonFeature.UniqueIdentifier(0);
  swift_allocObject();
  v106 = v23;
  v107 = v25;
  v27 = sub_213EF23C4();
  v111 = v26;
  v28 = MEMORY[0x24BEA4F80];
  v112 = sub_213DB196C(&qword_254D3D7B8, 255, type metadata accessor for CommonFeature.UniqueIdentifier, MEMORY[0x24BEA4F80]);
  v110 = v27;
  LOBYTE(v27) = objc_msgSend(v21, sel__donatedBySiri);
  v29 = type metadata accessor for CommonFeature.DonatedBySiri(0);
  swift_allocObject();
  LOBYTE(v106) = v27;
  v30 = sub_213EF23C4();
  v114 = v29;
  v115 = sub_213DB196C((unint64_t *)&qword_254D3F250, 255, type metadata accessor for CommonFeature.DonatedBySiri, v28);
  v113 = v30;
  v31 = sub_213EF222C();
  v33 = v32;
  v34 = type metadata accessor for CommonFeature.BundleID(0);
  swift_allocObject();
  v106 = v31;
  v107 = v33;
  v35 = sub_213EF23C4();
  v117 = v34;
  v118 = sub_213DB196C(&qword_254D3D7C0, 255, type metadata accessor for CommonFeature.BundleID, v28);
  v116 = v35;
  v36 = objc_msgSend(v21, sel_direction);
  v37 = type metadata accessor for CommonFeature.InteractionDirection(0);
  swift_allocObject();
  v106 = (uint64_t)v36;
  v38 = sub_213EF23C4();
  v120 = v37;
  v121 = sub_213DB196C(&qword_254D41508, 255, type metadata accessor for CommonFeature.InteractionDirection, v28);
  v119 = v38;
  v39 = objc_msgSend(v21, sel_intentHandlingStatus);
  v40 = type metadata accessor for CommonFeature.IntentHandlingStatus(0);
  swift_allocObject();
  v106 = (uint64_t)v39;
  v41 = sub_213EF23C4();
  v123 = v40;
  v124 = sub_213DB196C(&qword_254D41510, 255, type metadata accessor for CommonFeature.IntentHandlingStatus, v28);
  v122 = v41;
  v101 = v21;
  v42 = objc_msgSend(v21, sel_dateInterval);
  if (v42)
  {
    v43 = v42;
    v44 = (uint64_t)v93;
    sub_213EF1A64();

    v45 = sub_213EF1AA0();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56))(v44, 0, 1, v45);
  }
  else
  {
    v45 = sub_213EF1AA0();
    v44 = (uint64_t)v93;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56))(v93, 1, 1, v45);
  }
  sub_213DC0630(v44, (uint64_t)v15, &qword_254D3BA98);
  sub_213EF1AA0();
  v46 = *(_QWORD *)(v45 - 8);
  v47 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48);
  v48 = 1;
  if (!v47(v15, 1, v45))
  {
    sub_213EF1A88();
    v48 = 0;
  }
  sub_213DAFEC4((uint64_t)v15, &qword_254D3BA98);
  v49 = v99;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v100 + 56))(v20, v48, 1, v99);
  v50 = type metadata accessor for CommonFeature.OrderingTimestamp(0);
  swift_allocObject();
  sub_213DCC3D8((uint64_t)v20, v94, &qword_253F04800);
  v51 = sub_213EF23B8();
  swift_retain();
  sub_213DAFEC4((uint64_t)v20, &qword_253F04800);
  if (v51)
  {
    swift_release();
    v52 = sub_213DB196C(&qword_254D3D558, 255, type metadata accessor for CommonFeature.OrderingTimestamp, MEMORY[0x24BEA4F80]);
  }
  else
  {
    v50 = 0;
    v52 = 0;
    v126 = 0;
    v127 = 0;
  }
  v53 = (uint64_t)v96;
  v125 = v51;
  v128 = v50;
  v129 = v52;
  v54 = objc_msgSend(v101, sel_dateInterval);
  if (v54)
  {
    v55 = v54;
    v56 = (uint64_t)v95;
    sub_213EF1A64();

    v57 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v46 + 56);
    v57(v56, 0, 1, v45);
  }
  else
  {
    v57 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v46 + 56);
    v56 = (uint64_t)v95;
    v57((uint64_t)v95, 1, 1, v45);
  }
  sub_213DC0630(v56, v53, &qword_254D3BA98);
  v58 = v47((char *)v53, 1, v45);
  if (v58)
  {
    sub_213DAFEC4(v53, &qword_254D3BA98);
    v59 = 0;
  }
  else
  {
    v60 = v92;
    sub_213EF1A88();
    sub_213DAFEC4(v53, &qword_254D3BA98);
    sub_213EF1CD4();
    v59 = v61;
    (*(void (**)(char *, uint64_t))(v100 + 8))(v60, v49);
  }
  v62 = v58 != 0;
  started = type metadata accessor for CommonFeature.StartTimestamp(0);
  swift_allocObject();
  v106 = v59;
  LOBYTE(v107) = v62;
  v64 = sub_213EF23B8();
  v65 = v64;
  if (v64)
  {
    v64 = sub_213DB196C((unint64_t *)&unk_254D3D560, 255, type metadata accessor for CommonFeature.StartTimestamp, MEMORY[0x24BEA4F80]);
  }
  else
  {
    started = 0;
    v131 = 0;
    v132 = 0;
  }
  v66 = (uint64_t)v98;
  v130 = v65;
  v133 = started;
  v134 = v64;
  v67 = objc_msgSend(v101, sel_dateInterval);
  if (v67)
  {
    v68 = v67;
    v69 = (uint64_t)v97;
    sub_213EF1A64();

    v70 = 0;
  }
  else
  {
    v70 = 1;
    v69 = (uint64_t)v97;
  }
  v57(v69, v70, 1, v45);
  sub_213DC0630(v69, v66, &qword_254D3BA98);
  v71 = v47((char *)v66, 1, v45);
  if (v71)
  {
    sub_213DAFEC4(v66, &qword_254D3BA98);
    v72 = 0;
  }
  else
  {
    v73 = v92;
    sub_213EF1A70();
    sub_213DAFEC4(v66, &qword_254D3BA98);
    sub_213EF1CD4();
    v72 = v74;
    (*(void (**)(char *, uint64_t))(v100 + 8))(v73, v49);
  }
  v75 = v71 != 0;
  v76 = type metadata accessor for CommonFeature.EndTimestamp(0);
  swift_allocObject();
  v106 = v72;
  LOBYTE(v107) = v75;
  v77 = sub_213EF23B8();
  v78 = v77;
  if (v77)
  {
    v77 = sub_213DB196C(&qword_254D41518, 255, type metadata accessor for CommonFeature.EndTimestamp, MEMORY[0x24BEA4F80]);
  }
  else
  {
    v76 = 0;
    v137 = 0;
    v136 = 0;
  }
  v135 = v78;
  v138 = v76;
  v139 = v77;
  v108[0] = MEMORY[0x24BEE4AF8];
  for (i = 4; i != 44; i += 5)
  {
    sub_213DCC3D8((uint64_t)&v108[i + 1], (uint64_t)&v106, &qword_253F06970);
    sub_213DC0630((uint64_t)&v106, (uint64_t)&v102, &qword_253F06970);
    if (v103)
    {
      sub_213DB0BF0(&v102, (uint64_t)v105);
      sub_213DB0BF0(v105, (uint64_t)&v102);
      v80 = (_QWORD *)v108[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        v80 = sub_213DB59A4(0, v80[2] + 1, 1, v80);
        v108[0] = (uint64_t)v80;
      }
      v82 = v80[2];
      v81 = v80[3];
      if (v82 >= v81 >> 1)
        v108[0] = (uint64_t)sub_213DB59A4((_QWORD *)(v81 > 1), v82 + 1, 1, v80);
      v83 = v103;
      v84 = v104;
      v85 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v102, v103);
      v86 = MEMORY[0x24BDAC7A8](v85);
      v88 = (char *)&v91 - ((v87 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, __n128))(v89 + 16))(v88, v86);
      sub_213DB7D98(v82, (uint64_t)v88, v108, v83, v84);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v102);
    }
    else
    {
      sub_213DAFEC4((uint64_t)&v102, &qword_253F06970);
    }
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_253F06970);
  swift_arrayDestroy();
  return v108[0];
}

uint64_t sub_213EEEEB4(uint64_t a1, uint64_t a2)
{
  return sub_213DB196C(&qword_253F04CE8, a2, (uint64_t (*)(uint64_t))type metadata accessor for CommonInteractionFeatureExtractor, (uint64_t)&protocol conformance descriptor for CommonInteractionFeatureExtractor);
}

uint64_t type metadata accessor for CommonInteractionFeatureExtractor()
{
  return objc_opt_self();
}

uint64_t method lookup function for CommonInteractionFeatureExtractor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CommonInteractionFeatureExtractor.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of CommonInteractionFeatureExtractor.extract(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

id PlusMediaReferenceCoreDataRecord.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id PlusMediaReferenceCoreDataRecord.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for PlusMediaReferenceCoreDataRecord();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for PlusMediaReferenceCoreDataRecord()
{
  return objc_opt_self();
}

id PlusMediaReferenceCoreDataRecord.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlusMediaReferenceCoreDataRecord();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static PlusMediaReferenceCoreDataRecord.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_213EF2844();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_213EEF0E0()
{
  return MEMORY[0x24BEE0948];
}

void sub_213EEF0EC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_mediaId);
  if (v3)
  {
    v4 = v3;
    v5 = sub_213EF2850();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_213EEF150(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v3 = sub_213EF2844();
  else
    v3 = 0;
  v4 = (id)v3;
  objc_msgSend(v2, sel_setMediaId_);

}

uint64_t sub_213EEF1AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for PlusMediaReferenceCoreDataRecord();
  result = sub_213EF2EC8();
  *a1 = result;
  return result;
}

char *keypath_get_selector_mediaId()
{
  return sel_mediaId;
}

char *keypath_get_selector_mediaSuggestion()
{
  return sel_mediaSuggestion;
}

id sub_213EEF20C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_mediaSuggestion);
  *a2 = result;
  return result;
}

id sub_213EEF244(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMediaSuggestion_, *a1);
}

char *keypath_get_selector_sourceApp()
{
  return sel_sourceApp;
}

id sub_213EEF264@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_sourceApp);
  *a2 = result;
  return result;
}

id sub_213EEF29C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSourceApp_, *a1);
}

char *keypath_get_selector_storefront()
{
  return sel_storefront;
}

id sub_213EEF2BC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_storefront);
  *a2 = result;
  return result;
}

id sub_213EEF2F4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStorefront_, *a1);
}

id PlusMediaReferenceSourceAppCoreDataRecord.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id PlusMediaReferenceSourceAppCoreDataRecord.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for PlusMediaReferenceSourceAppCoreDataRecord();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for PlusMediaReferenceSourceAppCoreDataRecord()
{
  return objc_opt_self();
}

id PlusMediaReferenceSourceAppCoreDataRecord.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlusMediaReferenceSourceAppCoreDataRecord();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static PlusMediaReferenceSourceAppCoreDataRecord.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_213EF2844();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

void sub_213EEF4C8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_name);
  if (v3)
  {
    v4 = v3;
    v5 = sub_213EF2850();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_213EEF52C(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v3 = sub_213EF2844();
  else
    v3 = 0;
  v4 = (id)v3;
  objc_msgSend(v2, sel_setName_);

}

uint64_t sub_213EEF588@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for PlusMediaReferenceSourceAppCoreDataRecord();
  result = sub_213EF2EC8();
  *a1 = result;
  return result;
}

char *keypath_get_selector_name()
{
  return sel_name;
}

char *keypath_get_selector_appMediaReferences()
{
  return sel_appMediaReferences;
}

id sub_213EEF5E8@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_appMediaReferences);
  *a2 = result;
  return result;
}

id sub_213EEF620(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAppMediaReferences_, *a1);
}

id PlusMediaSuggestionCoreDataRecord.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id PlusMediaSuggestionCoreDataRecord.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for PlusMediaSuggestionCoreDataRecord();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for PlusMediaSuggestionCoreDataRecord()
{
  return objc_opt_self();
}

id PlusMediaSuggestionCoreDataRecord.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlusMediaSuggestionCoreDataRecord();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_213EEF78C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_lastUpdated);
  *a2 = v4;
  return result;
}

id sub_213EEF7BC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLastUpdated_, *a1);
}

id static PlusMediaSuggestionCoreDataRecord.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_213EF2844();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

unint64_t sub_213EEF83C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_254D41520;
  if (!qword_254D41520)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F04828);
    v2 = sub_213EEF8A0();
    result = MEMORY[0x2199C52D4](MEMORY[0x24BEE4AB0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_254D41520);
  }
  return result;
}

unint64_t sub_213EEF8A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253F06928;
  if (!qword_253F06928)
  {
    v1 = sub_213EF1D64();
    result = MEMORY[0x2199C52D4](MEMORY[0x24BDCEA88], v1);
    atomic_store(result, (unint64_t *)&qword_253F06928);
  }
  return result;
}

uint64_t sub_213EEF8E8@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(*a1, sel_id);
  if (v3)
  {
    v4 = v3;
    sub_213EF1D34();

    v5 = sub_213EF1D64();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 0;
  }
  else
  {
    v5 = sub_213EF1D64();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

void sub_213EEF96C(uint64_t a1, void **a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F04828);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213DBDD88(a1, (uint64_t)v6);
  v7 = *a2;
  v8 = sub_213EF1D64();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    v10 = (void *)sub_213EF1D1C();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  objc_msgSend(v7, sel_setId_, v10);

}

void sub_213EEFA48(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v4 = objc_msgSend(*a1, *a2);
  if (v4)
  {
    v5 = v4;
    v6 = sub_213EF1C50();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0xF000000000000000;
  }
  *a3 = v6;
  a3[1] = v8;
}

void sub_213EEFAA8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  void *v6;
  uint64_t v7;
  id v8;

  v6 = *a2;
  if (*(_QWORD *)(a1 + 8) >> 60 == 15)
    v7 = 0;
  else
    v7 = sub_213EF1C44();
  v8 = (id)v7;
  objc_msgSend(v6, *a5);

}

uint64_t sub_213EEFB0C@<X0>(uint64_t a1@<X8>)
{
  id *v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(*v1, sel_id);
  if (v3)
  {
    v4 = v3;
    sub_213EF1D34();

    v5 = sub_213EF1D64();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 0;
  }
  else
  {
    v5 = sub_213EF1D64();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

char *keypath_get_selector_id()
{
  return sel_id;
}

id sub_213EEFBA4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_lastUpdated);
  *a2 = v4;
  return result;
}

id sub_213EEFBD4(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLastUpdated_, *a1);
}

char *keypath_get_selector_leftHandKey()
{
  return sel_leftHandKey;
}

void sub_213EEFBF4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213EEFA48(a1, (SEL *)&selRef_leftHandKey, a2);
}

void sub_213EEFC10(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213EEFAA8(a1, a2, a3, a4, (SEL *)&selRef_setLeftHandKey_);
}

char *keypath_get_selector_score()
{
  return sel_score;
}

id sub_213EEFC40@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_score);
  *a2 = v4;
  return result;
}

id sub_213EEFC70(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setScore_, *a1);
}

char *keypath_get_selector_scoreHistory()
{
  return sel_scoreHistory;
}

void sub_213EEFC90(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213EEFA48(a1, (SEL *)&selRef_scoreHistory, a2);
}

void sub_213EEFCAC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213EEFAA8(a1, a2, a3, a4, (SEL *)&selRef_setScoreHistory_);
}

char *keypath_get_selector_timestamp()
{
  return sel_timestamp;
}

id sub_213EEFCD4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_timestamp);
  *a2 = v4;
  return result;
}

id sub_213EEFD04(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTimestamp_, *a1);
}

char *keypath_get_selector_contributingGroundTruth()
{
  return sel_contributingGroundTruth;
}

id sub_213EEFD24@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_contributingGroundTruth);
  *a2 = result;
  return result;
}

id sub_213EEFD5C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setContributingGroundTruth_, *a1);
}

char *keypath_get_selector_inferredMediaReference()
{
  return sel_inferredMediaReference;
}

id sub_213EEFD7C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_inferredMediaReference);
  *a2 = result;
  return result;
}

id sub_213EEFDB4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setInferredMediaReference_, *a1);
}

char *keypath_get_selector_tags()
{
  return sel_tags;
}

id sub_213EEFDD4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_tags);
  *a2 = result;
  return result;
}

id sub_213EEFE0C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTags_, *a1);
}

id PlusMediaSuggestionStoreUpdateRecord.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id PlusMediaSuggestionStoreUpdateRecord.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for PlusMediaSuggestionStoreUpdateRecord();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for PlusMediaSuggestionStoreUpdateRecord()
{
  return objc_opt_self();
}

id PlusMediaSuggestionStoreUpdateRecord.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlusMediaSuggestionStoreUpdateRecord();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static PlusMediaSuggestionStoreUpdateRecord.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_213EF2844();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

void sub_213EEFFE0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_source);
  if (v3)
  {
    v4 = v3;
    v5 = sub_213EF2850();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_213EF0044(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v3 = sub_213EF2844();
  else
    v3 = 0;
  v4 = (id)v3;
  objc_msgSend(v2, sel_setSource_);

}

uint64_t sub_213EF00A0@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(*a1, sel_timestamp);
  if (v3)
  {
    v4 = v3;
    sub_213EF1CE0();

    v5 = sub_213EF1CF8();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 0;
  }
  else
  {
    v5 = sub_213EF1CF8();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

void sub_213EF0124(uint64_t a1, void **a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F04800);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213DEE490(a1, (uint64_t)v6);
  v7 = *a2;
  v8 = sub_213EF1CF8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    v10 = (void *)sub_213EF1C8C();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  objc_msgSend(v7, sel_setTimestamp_, v10);

}

uint64_t sub_213EF0200@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for PlusMediaSuggestionStoreUpdateRecord();
  result = sub_213EF2EC8();
  *a1 = result;
  return result;
}

char *keypath_get_selector_source()
{
  return sel_source;
}

id PlusMediaSuggestionTagCoreDataRecord.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id PlusMediaSuggestionTagCoreDataRecord.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for PlusMediaSuggestionTagCoreDataRecord();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for PlusMediaSuggestionTagCoreDataRecord()
{
  return objc_opt_self();
}

id PlusMediaSuggestionTagCoreDataRecord.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlusMediaSuggestionTagCoreDataRecord();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static PlusMediaSuggestionTagCoreDataRecord.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_213EF2844();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_213EF041C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for PlusMediaSuggestionTagCoreDataRecord();
  result = sub_213EF2EC8();
  *a1 = result;
  return result;
}

char *keypath_get_selector_taggedItem()
{
  return sel_taggedItem;
}

id sub_213EF0470@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_taggedItem);
  *a2 = result;
  return result;
}

id sub_213EF04A8(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTaggedItem_, *a1);
}

id PlusStorefrontCoreDataRecord.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id PlusStorefrontCoreDataRecord.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for PlusStorefrontCoreDataRecord();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for PlusStorefrontCoreDataRecord()
{
  return objc_opt_self();
}

id PlusStorefrontCoreDataRecord.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlusStorefrontCoreDataRecord();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static PlusStorefrontCoreDataRecord.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_213EF2844();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

void sub_213EF067C(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = objc_msgSend(*a1, *a2);
  if (v4)
  {
    v5 = v4;
    v6 = sub_213EF2850();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  *a3 = v6;
  a3[1] = v8;
}

void sub_213EF06DC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  void *v6;
  uint64_t v7;
  id v8;

  v6 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v7 = sub_213EF2844();
  else
    v7 = 0;
  v8 = (id)v7;
  objc_msgSend(v6, *a5);

}

uint64_t sub_213EF0738@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for PlusStorefrontCoreDataRecord();
  result = sub_213EF2EC8();
  *a1 = result;
  return result;
}

char *keypath_get_selector_countryCode()
{
  return sel_countryCode;
}

void sub_213EF0784(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213EF067C(a1, (SEL *)&selRef_countryCode, a2);
}

void sub_213EF07A0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213EF06DC(a1, a2, a3, a4, (SEL *)&selRef_setCountryCode_);
}

char *keypath_get_selector_storefrontId()
{
  return sel_storefrontId;
}

void sub_213EF07C8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213EF067C(a1, (SEL *)&selRef_storefrontId, a2);
}

void sub_213EF07E4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213EF06DC(a1, a2, a3, a4, (SEL *)&selRef_setStorefrontId_);
}

char *keypath_get_selector_storefrontMediaReferences()
{
  return sel_storefrontMediaReferences;
}

id sub_213EF080C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_storefrontMediaReferences);
  *a2 = result;
  return result;
}

id sub_213EF0844(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStorefrontMediaReferences_, *a1);
}

id ThinMediaGroundTruthCoreDataRecord.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id ThinMediaGroundTruthCoreDataRecord.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for ThinMediaGroundTruthCoreDataRecord();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for ThinMediaGroundTruthCoreDataRecord()
{
  return objc_opt_self();
}

id ThinMediaGroundTruthCoreDataRecord.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ThinMediaGroundTruthCoreDataRecord();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static ThinMediaGroundTruthCoreDataRecord.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_213EF2844();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

void sub_213EF0A18(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = objc_msgSend(*a1, sel_groundTruthSource);
  if (v3)
  {
    v4 = v3;
    v5 = sub_213EF1C50();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0xF000000000000000;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_213EF0A7C(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8) >> 60 == 15)
    v3 = 0;
  else
    v3 = sub_213EF1C44();
  v4 = (id)v3;
  objc_msgSend(v2, sel_setGroundTruthSource_);

}

void sub_213EF0AE0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_groundTruthType);
  if (v3)
  {
    v4 = v3;
    v5 = sub_213EF2850();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_213EF0B44(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v3 = sub_213EF2844();
  else
    v3 = 0;
  v4 = (id)v3;
  objc_msgSend(v2, sel_setGroundTruthType_);

}

char *keypath_get_selector_groundTruthSource()
{
  return sel_groundTruthSource;
}

char *keypath_get_selector_groundTruthType()
{
  return sel_groundTruthType;
}

char *keypath_get_selector_plusMediaSuggestion()
{
  return sel_plusMediaSuggestion;
}

id sub_213EF0BDC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_plusMediaSuggestion);
  *a2 = result;
  return result;
}

id sub_213EF0C14(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPlusMediaSuggestion_, *a1);
}

id PlusContactReferenceCoreDataRecord.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id PlusContactReferenceCoreDataRecord.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for PlusContactReferenceCoreDataRecord();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for PlusContactReferenceCoreDataRecord()
{
  return objc_opt_self();
}

id PlusContactReferenceCoreDataRecord.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlusContactReferenceCoreDataRecord();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static PlusContactReferenceCoreDataRecord.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_213EF2844();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_213EF0DE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for PlusContactReferenceCoreDataRecord();
  result = sub_213EF2EC8();
  *a1 = result;
  return result;
}

char *keypath_get_selector_contactId()
{
  return sel_contactId;
}

void sub_213EF0E34(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213EF067C(a1, (SEL *)&selRef_contactId, a2);
}

void sub_213EF0E50(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213EF06DC(a1, a2, a3, a4, (SEL *)&selRef_setContactId_);
}

char *keypath_get_selector_contactLabel()
{
  return sel_contactLabel;
}

void sub_213EF0E78(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213EF067C(a1, (SEL *)&selRef_contactLabel, a2);
}

void sub_213EF0E94(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213EF06DC(a1, a2, a3, a4, (SEL *)&selRef_setContactLabel_);
}

char *keypath_get_selector_contactSuggestion()
{
  return sel_contactSuggestion;
}

id sub_213EF0EBC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_contactSuggestion);
  *a2 = result;
  return result;
}

id sub_213EF0EF4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setContactSuggestion_, *a1);
}

id PlusContactSuggestionCoreDataRecord.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id PlusContactSuggestionCoreDataRecord.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for PlusContactSuggestionCoreDataRecord();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for PlusContactSuggestionCoreDataRecord()
{
  return objc_opt_self();
}

id PlusContactSuggestionCoreDataRecord.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlusContactSuggestionCoreDataRecord();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static PlusContactSuggestionCoreDataRecord.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_213EF2844();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

char *keypath_get_selector_fullName()
{
  return sel_fullName;
}

void sub_213EF10D4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213EF067C(a1, (SEL *)&selRef_fullName, a2);
}

void sub_213EF10F0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213EF06DC(a1, a2, a3, a4, (SEL *)&selRef_setFullName_);
}

char *keypath_get_selector_handleLabel()
{
  return sel_handleLabel;
}

void sub_213EF1118(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213EF067C(a1, (SEL *)&selRef_handleLabel, a2);
}

void sub_213EF1134(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213EF06DC(a1, a2, a3, a4, (SEL *)&selRef_setHandleLabel_);
}

id sub_213EF1158@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_score);
  *a2 = v4;
  return result;
}

id sub_213EF1188(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setScore_, *a1);
}

void sub_213EF119C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213EEFA48(a1, (SEL *)&selRef_scoreHistory, a2);
}

void sub_213EF11B8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213EEFAA8(a1, a2, a3, a4, (SEL *)&selRef_setScoreHistory_);
}

id sub_213EF11D4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_timestamp);
  *a2 = v4;
  return result;
}

id sub_213EF1204(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTimestamp_, *a1);
}

char *keypath_get_selector_usoPersonQuery()
{
  return sel_usoPersonQuery;
}

void sub_213EF1224(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213EEFA48(a1, (SEL *)&selRef_usoPersonQuery, a2);
}

void sub_213EF1240(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213EEFAA8(a1, a2, a3, a4, (SEL *)&selRef_setUsoPersonQuery_);
}

id sub_213EF125C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_contributingGroundTruth);
  *a2 = result;
  return result;
}

id sub_213EF1294(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setContributingGroundTruth_, *a1);
}

char *keypath_get_selector_inferredContactReference()
{
  return sel_inferredContactReference;
}

id sub_213EF12B4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_inferredContactReference);
  *a2 = result;
  return result;
}

id sub_213EF12EC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setInferredContactReference_, *a1);
}

id sub_213EF1300@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_tags);
  *a2 = result;
  return result;
}

id sub_213EF1338(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTags_, *a1);
}

id PlusContactSuggestionStoreUpdateRecord.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id PlusContactSuggestionStoreUpdateRecord.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for PlusContactSuggestionStoreUpdateRecord();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for PlusContactSuggestionStoreUpdateRecord()
{
  return objc_opt_self();
}

id PlusContactSuggestionStoreUpdateRecord.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlusContactSuggestionStoreUpdateRecord();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static PlusContactSuggestionStoreUpdateRecord.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_213EF2844();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_213EF150C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for PlusContactSuggestionStoreUpdateRecord();
  result = sub_213EF2EC8();
  *a1 = result;
  return result;
}

id PlusContactSuggestionTagCoreDataRecord.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id PlusContactSuggestionTagCoreDataRecord.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for PlusContactSuggestionTagCoreDataRecord();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for PlusContactSuggestionTagCoreDataRecord()
{
  return objc_opt_self();
}

id PlusContactSuggestionTagCoreDataRecord.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlusContactSuggestionTagCoreDataRecord();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static PlusContactSuggestionTagCoreDataRecord.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_213EF2844();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_213EF171C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for PlusContactSuggestionTagCoreDataRecord();
  result = sub_213EF2EC8();
  *a1 = result;
  return result;
}

id sub_213EF1764@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_taggedItem);
  *a2 = result;
  return result;
}

id sub_213EF179C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTaggedItem_, *a1);
}

id ThinContactGroundTruthCoreDataRecord.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id ThinContactGroundTruthCoreDataRecord.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for ThinContactGroundTruthCoreDataRecord();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for ThinContactGroundTruthCoreDataRecord()
{
  return objc_opt_self();
}

id ThinContactGroundTruthCoreDataRecord.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ThinContactGroundTruthCoreDataRecord();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static ThinContactGroundTruthCoreDataRecord.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_213EF2844();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

char *keypath_get_selector_plusContactSuggestion()
{
  return sel_plusContactSuggestion;
}

id sub_213EF1994@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_plusContactSuggestion);
  *a2 = result;
  return result;
}

id sub_213EF19CC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPlusContactSuggestion_, *a1);
}

uint64_t sub_213EF19E0()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_213EF19EC()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_213EF19F8()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_213EF1A04()
{
  return MEMORY[0x24BDCB288]();
}

uint64_t sub_213EF1A10()
{
  return MEMORY[0x24BDCB2A8]();
}

uint64_t sub_213EF1A1C()
{
  return MEMORY[0x24BDCB2E0]();
}

uint64_t sub_213EF1A28()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_213EF1A34()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_213EF1A40()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_213EF1A4C()
{
  return MEMORY[0x24BDCB630]();
}

uint64_t sub_213EF1A58()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_213EF1A64()
{
  return MEMORY[0x24BDCB828]();
}

uint64_t sub_213EF1A70()
{
  return MEMORY[0x24BDCB830]();
}

uint64_t sub_213EF1A7C()
{
  return MEMORY[0x24BDCB838]();
}

uint64_t sub_213EF1A88()
{
  return MEMORY[0x24BDCB848]();
}

uint64_t sub_213EF1A94()
{
  return MEMORY[0x24BDCB868]();
}

uint64_t sub_213EF1AA0()
{
  return MEMORY[0x24BDCB878]();
}

uint64_t sub_213EF1AAC()
{
  return MEMORY[0x24BDCB960]();
}

uint64_t sub_213EF1AB8()
{
  return MEMORY[0x24BDCB980]();
}

uint64_t sub_213EF1AC4()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t sub_213EF1AD0()
{
  return MEMORY[0x24BDCBA58]();
}

uint64_t sub_213EF1ADC()
{
  return MEMORY[0x24BDCBAB0]();
}

uint64_t sub_213EF1AE8()
{
  return MEMORY[0x24BDCBAE0]();
}

uint64_t sub_213EF1AF4()
{
  return MEMORY[0x24BDCBB20]();
}

uint64_t sub_213EF1B00()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_213EF1B0C()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_213EF1B18()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_213EF1B24()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_213EF1B30()
{
  return MEMORY[0x24BDCC6A8]();
}

uint64_t sub_213EF1B3C()
{
  return MEMORY[0x24BDCC6B8]();
}

uint64_t sub_213EF1B48()
{
  return MEMORY[0x24BDCD280]();
}

uint64_t sub_213EF1B54()
{
  return MEMORY[0x24BDCD288]();
}

uint64_t sub_213EF1B60()
{
  return MEMORY[0x24BDCD290]();
}

uint64_t sub_213EF1B6C()
{
  return MEMORY[0x24BDCD298]();
}

uint64_t sub_213EF1B78()
{
  return MEMORY[0x24BDCD2A0]();
}

uint64_t sub_213EF1B84()
{
  return MEMORY[0x24BDCD2A8]();
}

uint64_t sub_213EF1B90()
{
  return MEMORY[0x24BDCD2B8]();
}

uint64_t sub_213EF1B9C()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_213EF1BA8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_213EF1BB4()
{
  return MEMORY[0x24BDCD520]();
}

uint64_t sub_213EF1BC0()
{
  return MEMORY[0x24BDCD770]();
}

uint64_t sub_213EF1BCC()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_213EF1BD8()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_213EF1BE4()
{
  return MEMORY[0x24BDCD968]();
}

uint64_t sub_213EF1BF0()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_213EF1BFC()
{
  return MEMORY[0x24BDCD9D8]();
}

uint64_t sub_213EF1C08()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_213EF1C14()
{
  return MEMORY[0x24BDCDA48]();
}

uint64_t sub_213EF1C20()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_213EF1C2C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_213EF1C38()
{
  return MEMORY[0x24BDCDC08]();
}

uint64_t sub_213EF1C44()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_213EF1C50()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_213EF1C5C()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_213EF1C68()
{
  return MEMORY[0x24BDCE2D8]();
}

uint64_t sub_213EF1C74()
{
  return MEMORY[0x24BDCE2F8]();
}

uint64_t sub_213EF1C80()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_213EF1C8C()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_213EF1C98()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_213EF1CA4()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_213EF1CB0()
{
  return MEMORY[0x24BDCE600]();
}

uint64_t sub_213EF1CBC()
{
  return MEMORY[0x24BDCE608]();
}

uint64_t sub_213EF1CC8()
{
  return MEMORY[0x24BDCE778]();
}

uint64_t sub_213EF1CD4()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_213EF1CE0()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_213EF1CEC()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_213EF1CF8()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_213EF1D04()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_213EF1D10()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_213EF1D1C()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_213EF1D28()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_213EF1D34()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_213EF1D40()
{
  return MEMORY[0x24BDCEA10]();
}

uint64_t sub_213EF1D4C()
{
  return MEMORY[0x24BDCEA18]();
}

uint64_t sub_213EF1D58()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_213EF1D64()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_213EF1D70()
{
  return MEMORY[0x24BDCECE0]();
}

uint64_t sub_213EF1D7C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_213EF1D88()
{
  return MEMORY[0x24BE9E020]();
}

uint64_t sub_213EF1D94()
{
  return MEMORY[0x24BE9F768]();
}

uint64_t sub_213EF1DA0()
{
  return MEMORY[0x24BE9F788]();
}

uint64_t sub_213EF1DAC()
{
  return MEMORY[0x24BE9FE70]();
}

uint64_t sub_213EF1DB8()
{
  return MEMORY[0x24BE9FF88]();
}

uint64_t sub_213EF1DC4()
{
  return MEMORY[0x24BE9FFC8]();
}

uint64_t sub_213EF1DD0()
{
  return MEMORY[0x24BEA0110]();
}

uint64_t sub_213EF1DDC()
{
  return MEMORY[0x24BEA0118]();
}

uint64_t sub_213EF1DE8()
{
  return MEMORY[0x24BEA02D0]();
}

uint64_t sub_213EF1DF4()
{
  return MEMORY[0x24BEA02D8]();
}

uint64_t sub_213EF1E00()
{
  return MEMORY[0x24BEA0368]();
}

uint64_t sub_213EF1E0C()
{
  return MEMORY[0x24BEA04A0]();
}

uint64_t sub_213EF1E18()
{
  return MEMORY[0x24BEA04C0]();
}

uint64_t sub_213EF1E24()
{
  return MEMORY[0x24BEA04D8]();
}

uint64_t sub_213EF1E30()
{
  return MEMORY[0x24BEA04E8]();
}

uint64_t sub_213EF1E3C()
{
  return MEMORY[0x24BEA0510]();
}

uint64_t sub_213EF1E48()
{
  return MEMORY[0x24BEA05B8]();
}

uint64_t sub_213EF1E54()
{
  return MEMORY[0x24BEA05C0]();
}

uint64_t sub_213EF1E60()
{
  return MEMORY[0x24BEA05D8]();
}

uint64_t sub_213EF1E6C()
{
  return MEMORY[0x24BEA0690]();
}

uint64_t sub_213EF1E78()
{
  return MEMORY[0x24BEA06B0]();
}

uint64_t sub_213EF1E84()
{
  return MEMORY[0x24BEA06C8]();
}

uint64_t sub_213EF1E90()
{
  return MEMORY[0x24BEA0870]();
}

uint64_t sub_213EF1E9C()
{
  return MEMORY[0x24BEA0990]();
}

uint64_t sub_213EF1EA8()
{
  return MEMORY[0x24BEA0A10]();
}

uint64_t sub_213EF1EB4()
{
  return MEMORY[0x24BEA0A18]();
}

uint64_t sub_213EF1EC0()
{
  return MEMORY[0x24BEA0A20]();
}

uint64_t sub_213EF1ECC()
{
  return MEMORY[0x24BEA0A38]();
}

uint64_t sub_213EF1ED8()
{
  return MEMORY[0x24BEA0A48]();
}

uint64_t sub_213EF1EE4()
{
  return MEMORY[0x24BEA0A58]();
}

uint64_t sub_213EF1EF0()
{
  return MEMORY[0x24BEA0BA8]();
}

uint64_t sub_213EF1EFC()
{
  return MEMORY[0x24BEA0BC0]();
}

uint64_t sub_213EF1F08()
{
  return MEMORY[0x24BEA0BD0]();
}

uint64_t sub_213EF1F14()
{
  return MEMORY[0x24BEA0BE0]();
}

uint64_t sub_213EF1F20()
{
  return MEMORY[0x24BEA0BF0]();
}

uint64_t sub_213EF1F2C()
{
  return MEMORY[0x24BEA0C00]();
}

uint64_t sub_213EF1F38()
{
  return MEMORY[0x24BEA0D48]();
}

uint64_t sub_213EF1F44()
{
  return MEMORY[0x24BEA1340]();
}

uint64_t sub_213EF1F50()
{
  return MEMORY[0x24BEA13D0]();
}

uint64_t sub_213EF1F5C()
{
  return MEMORY[0x24BEA14D0]();
}

uint64_t sub_213EF1F68()
{
  return MEMORY[0x24BEA14E0]();
}

uint64_t sub_213EF1F74()
{
  return MEMORY[0x24BEA1508]();
}

uint64_t sub_213EF1F80()
{
  return MEMORY[0x24BEA1510]();
}

uint64_t sub_213EF1F8C()
{
  return MEMORY[0x24BEA1610]();
}

uint64_t sub_213EF1F98()
{
  return MEMORY[0x24BEA1718]();
}

uint64_t sub_213EF1FA4()
{
  return MEMORY[0x24BEA1720]();
}

uint64_t sub_213EF1FB0()
{
  return MEMORY[0x24BEA1948]();
}

uint64_t sub_213EF1FBC()
{
  return MEMORY[0x24BEA1968]();
}

uint64_t sub_213EF1FC8()
{
  return MEMORY[0x24BEA1970]();
}

uint64_t sub_213EF1FD4()
{
  return MEMORY[0x24BEA1B58]();
}

uint64_t sub_213EF1FE0()
{
  return MEMORY[0x24BEA1D38]();
}

uint64_t sub_213EF1FEC()
{
  return MEMORY[0x24BEA1D48]();
}

uint64_t sub_213EF1FF8()
{
  return MEMORY[0x24BEA1D50]();
}

uint64_t sub_213EF2004()
{
  return MEMORY[0x24BEA1DC8]();
}

uint64_t sub_213EF2010()
{
  return MEMORY[0x24BEA1DE8]();
}

uint64_t sub_213EF201C()
{
  return MEMORY[0x24BEA1DF0]();
}

uint64_t sub_213EF2028()
{
  return MEMORY[0x24BEA20E8]();
}

uint64_t sub_213EF2034()
{
  return MEMORY[0x24BEA20F0]();
}

uint64_t sub_213EF2040()
{
  return MEMORY[0x24BEA2100]();
}

uint64_t sub_213EF204C()
{
  return MEMORY[0x24BEA2108]();
}

uint64_t sub_213EF2058()
{
  return MEMORY[0x24BEA2198]();
}

uint64_t sub_213EF2064()
{
  return MEMORY[0x24BEA21A0]();
}

uint64_t sub_213EF2070()
{
  return MEMORY[0x24BEA21A8]();
}

uint64_t sub_213EF207C()
{
  return MEMORY[0x24BEA2328]();
}

uint64_t sub_213EF2088()
{
  return MEMORY[0x24BEA2D30]();
}

uint64_t sub_213EF2094()
{
  return MEMORY[0x24BEA2D50]();
}

uint64_t sub_213EF20A0()
{
  return MEMORY[0x24BEA2D58]();
}

uint64_t sub_213EF20AC()
{
  return MEMORY[0x24BEA3108]();
}

uint64_t sub_213EF20B8()
{
  return MEMORY[0x24BEA3110]();
}

uint64_t sub_213EF20C4()
{
  return MEMORY[0x24BEA3120]();
}

uint64_t sub_213EF20D0()
{
  return MEMORY[0x24BEA3128]();
}

uint64_t sub_213EF20DC()
{
  return MEMORY[0x24BEA3408]();
}

uint64_t sub_213EF20E8()
{
  return MEMORY[0x24BEA3410]();
}

uint64_t sub_213EF20F4()
{
  return MEMORY[0x24BEA3518]();
}

uint64_t sub_213EF2100()
{
  return MEMORY[0x24BEA4BC8]();
}

uint64_t sub_213EF210C()
{
  return MEMORY[0x24BEA4BD0]();
}

uint64_t sub_213EF2118()
{
  return MEMORY[0x24BEA4BD8]();
}

uint64_t sub_213EF2124()
{
  return MEMORY[0x24BEA4BE0]();
}

uint64_t sub_213EF2130()
{
  return MEMORY[0x24BEA4BF0]();
}

uint64_t sub_213EF213C()
{
  return MEMORY[0x24BEA4C00]();
}

uint64_t sub_213EF2148()
{
  return MEMORY[0x24BEA4C38]();
}

uint64_t sub_213EF2154()
{
  return MEMORY[0x24BEA4C40]();
}

uint64_t sub_213EF2160()
{
  return MEMORY[0x24BEA4C50]();
}

uint64_t sub_213EF216C()
{
  return MEMORY[0x24BEA4C68]();
}

uint64_t sub_213EF2178()
{
  return MEMORY[0x24BEA4C78]();
}

uint64_t sub_213EF2184()
{
  return MEMORY[0x24BEA4C80]();
}

uint64_t sub_213EF2190()
{
  return MEMORY[0x24BEA4C90]();
}

uint64_t sub_213EF219C()
{
  return MEMORY[0x24BEA4C98]();
}

uint64_t sub_213EF21A8()
{
  return MEMORY[0x24BEA4CA8]();
}

uint64_t sub_213EF21B4()
{
  return MEMORY[0x24BEA4CB0]();
}

uint64_t sub_213EF21C0()
{
  return MEMORY[0x24BEA4CC0]();
}

uint64_t sub_213EF21CC()
{
  return MEMORY[0x24BEA4CC8]();
}

uint64_t sub_213EF21D8()
{
  return MEMORY[0x24BEA4CD0]();
}

uint64_t sub_213EF21E4()
{
  return MEMORY[0x24BEA4CD8]();
}

uint64_t sub_213EF21F0()
{
  return MEMORY[0x24BEA4D10]();
}

uint64_t sub_213EF21FC()
{
  return MEMORY[0x24BEA4D18]();
}

uint64_t sub_213EF2208()
{
  return MEMORY[0x24BEA4D28]();
}

uint64_t sub_213EF2214()
{
  return MEMORY[0x24BEA4D30]();
}

uint64_t sub_213EF2220()
{
  return MEMORY[0x24BEA4D38]();
}

uint64_t sub_213EF222C()
{
  return MEMORY[0x24BEA4D40]();
}

uint64_t sub_213EF2238()
{
  return MEMORY[0x24BEA4D48]();
}

uint64_t sub_213EF2244()
{
  return MEMORY[0x24BEA4D58]();
}

uint64_t sub_213EF2250()
{
  return MEMORY[0x24BEA4D60]();
}

uint64_t sub_213EF225C()
{
  return MEMORY[0x24BEA4D68]();
}

uint64_t sub_213EF2268()
{
  return MEMORY[0x24BEA4D70]();
}

uint64_t sub_213EF2274()
{
  return MEMORY[0x24BEA4D78]();
}

uint64_t _s28SiriPrivateLearningInference0D8FeaturesO0D14FeatureManagerCfd_0()
{
  return MEMORY[0x24BEA4D90]();
}

uint64_t sub_213EF228C()
{
  return MEMORY[0x24BEA4DA0]();
}

uint64_t sub_213EF2298()
{
  return MEMORY[0x24BEA4DA8]();
}

uint64_t sub_213EF22A4()
{
  return MEMORY[0x24BEA4DD0]();
}

uint64_t sub_213EF22B0()
{
  return MEMORY[0x24BEA4DD8]();
}

uint64_t sub_213EF22BC()
{
  return MEMORY[0x24BEA4DE0]();
}

uint64_t sub_213EF22C8()
{
  return MEMORY[0x24BEA4DF8]();
}

uint64_t sub_213EF22D4()
{
  return MEMORY[0x24BEA4E00]();
}

uint64_t sub_213EF22E0()
{
  return MEMORY[0x24BEA4E08]();
}

uint64_t sub_213EF22EC()
{
  return MEMORY[0x24BEA4E10]();
}

uint64_t sub_213EF22F8()
{
  return MEMORY[0x24BEA4E20]();
}

uint64_t sub_213EF2304()
{
  return MEMORY[0x24BEA4E28]();
}

uint64_t sub_213EF2310()
{
  return MEMORY[0x24BEA4E30]();
}

uint64_t sub_213EF231C()
{
  return MEMORY[0x24BEA4E88]();
}

uint64_t sub_213EF2328()
{
  return MEMORY[0x24BEA4EA0]();
}

uint64_t sub_213EF2334()
{
  return MEMORY[0x24BEA4EA8]();
}

uint64_t sub_213EF2340()
{
  return MEMORY[0x24BEA4EB0]();
}

uint64_t sub_213EF234C()
{
  return MEMORY[0x24BEA4EC0]();
}

uint64_t sub_213EF2358()
{
  return MEMORY[0x24BEA4ED0]();
}

uint64_t sub_213EF2364()
{
  return MEMORY[0x24BEA4EE0]();
}

uint64_t sub_213EF2370()
{
  return MEMORY[0x24BEA4EF0]();
}

uint64_t sub_213EF237C()
{
  return MEMORY[0x24BEA4F18]();
}

uint64_t sub_213EF2388()
{
  return MEMORY[0x24BEA4F20]();
}

uint64_t sub_213EF2394()
{
  return MEMORY[0x24BEA4F30]();
}

uint64_t sub_213EF23A0()
{
  return MEMORY[0x24BEA4F40]();
}

uint64_t sub_213EF23AC()
{
  return MEMORY[0x24BEA4F48]();
}

uint64_t sub_213EF23B8()
{
  return MEMORY[0x24BEA4F50]();
}

uint64_t sub_213EF23C4()
{
  return MEMORY[0x24BEA4F58]();
}

uint64_t sub_213EF23D0()
{
  return MEMORY[0x24BEA4F60]();
}

uint64_t _s28SiriPrivateLearningInference13CommonFeatureO09DonatedByA0Cfd_0()
{
  return MEMORY[0x24BEA4F78]();
}

uint64_t sub_213EF23E8()
{
  return MEMORY[0x24BEA4F98]();
}

uint64_t sub_213EF23F4()
{
  return MEMORY[0x24BEA4FA0]();
}

uint64_t sub_213EF2400()
{
  return MEMORY[0x24BEA4FA8]();
}

uint64_t sub_213EF240C()
{
  return MEMORY[0x24BEA4FC0]();
}

uint64_t sub_213EF2418()
{
  return MEMORY[0x24BEA4FE8]();
}

uint64_t sub_213EF2424()
{
  return MEMORY[0x24BEA4FF0]();
}

uint64_t sub_213EF2430()
{
  return MEMORY[0x24BEA4FF8]();
}

uint64_t sub_213EF243C()
{
  return MEMORY[0x24BEA5000]();
}

uint64_t sub_213EF2448()
{
  return MEMORY[0x24BEA5008]();
}

uint64_t sub_213EF2454()
{
  return MEMORY[0x24BEA5010]();
}

uint64_t sub_213EF2460()
{
  return MEMORY[0x24BEA5018]();
}

uint64_t sub_213EF246C()
{
  return MEMORY[0x24BEA5040]();
}

uint64_t sub_213EF2478()
{
  return MEMORY[0x24BEA5050]();
}

uint64_t sub_213EF2484()
{
  return MEMORY[0x24BEA5058]();
}

uint64_t sub_213EF2490()
{
  return MEMORY[0x24BEA5060]();
}

uint64_t sub_213EF249C()
{
  return MEMORY[0x24BEA5068]();
}

uint64_t sub_213EF24A8()
{
  return MEMORY[0x24BEA5070]();
}

uint64_t sub_213EF24B4()
{
  return MEMORY[0x24BEA5078]();
}

uint64_t sub_213EF24C0()
{
  return MEMORY[0x24BEA5080]();
}

uint64_t sub_213EF24CC()
{
  return MEMORY[0x24BEA5098]();
}

uint64_t sub_213EF24D8()
{
  return MEMORY[0x24BEA50A0]();
}

uint64_t sub_213EF24E4()
{
  return MEMORY[0x24BEA50B0]();
}

uint64_t sub_213EF24F0()
{
  return MEMORY[0x24BEA50B8]();
}

uint64_t sub_213EF24FC()
{
  return MEMORY[0x24BEA50D0]();
}

uint64_t sub_213EF2508()
{
  return MEMORY[0x24BEA50E8]();
}

uint64_t sub_213EF2514()
{
  return MEMORY[0x24BEA50F8]();
}

uint64_t sub_213EF2520()
{
  return MEMORY[0x24BEA5108]();
}

uint64_t sub_213EF252C()
{
  return MEMORY[0x24BEA5118]();
}

uint64_t sub_213EF2538()
{
  return MEMORY[0x24BEA5128]();
}

uint64_t sub_213EF2544()
{
  return MEMORY[0x24BEA5140]();
}

uint64_t sub_213EF2550()
{
  return MEMORY[0x24BEA5148]();
}

uint64_t sub_213EF255C()
{
  return MEMORY[0x24BEA5150]();
}

uint64_t sub_213EF2568()
{
  return MEMORY[0x24BEA5170]();
}

uint64_t sub_213EF2574()
{
  return MEMORY[0x24BEA5178]();
}

uint64_t sub_213EF2580()
{
  return MEMORY[0x24BEA5180]();
}

uint64_t sub_213EF258C()
{
  return MEMORY[0x24BEA51A8]();
}

uint64_t sub_213EF2598()
{
  return MEMORY[0x24BEA51B8]();
}

uint64_t sub_213EF25A4()
{
  return MEMORY[0x24BEA51C0]();
}

uint64_t sub_213EF25B0()
{
  return MEMORY[0x24BEA51C8]();
}

uint64_t sub_213EF25BC()
{
  return MEMORY[0x24BEA51E0]();
}

uint64_t sub_213EF25C8()
{
  return MEMORY[0x24BEA51F8]();
}

uint64_t sub_213EF25D4()
{
  return MEMORY[0x24BEA5220]();
}

uint64_t sub_213EF25E0()
{
  return MEMORY[0x24BEA5248]();
}

uint64_t sub_213EF25EC()
{
  return MEMORY[0x24BEA5250]();
}

uint64_t sub_213EF25F8()
{
  return MEMORY[0x24BEA5260]();
}

uint64_t sub_213EF2604()
{
  return MEMORY[0x24BEA5278]();
}

uint64_t sub_213EF2610()
{
  return MEMORY[0x24BEA5288]();
}

uint64_t sub_213EF261C()
{
  return MEMORY[0x24BEA5310]();
}

uint64_t sub_213EF2628()
{
  return MEMORY[0x24BEA5318]();
}

uint64_t sub_213EF2634()
{
  return MEMORY[0x24BEA5320]();
}

uint64_t sub_213EF2640()
{
  return MEMORY[0x24BEA5328]();
}

uint64_t sub_213EF264C()
{
  return MEMORY[0x24BEA5330]();
}

uint64_t sub_213EF2658()
{
  return MEMORY[0x24BEA5340]();
}

uint64_t sub_213EF2664()
{
  return MEMORY[0x24BEA5348]();
}

uint64_t sub_213EF2670()
{
  return MEMORY[0x24BEA5350]();
}

uint64_t sub_213EF267C()
{
  return MEMORY[0x24BEA5358]();
}

uint64_t sub_213EF2688()
{
  return MEMORY[0x24BEA5360]();
}

uint64_t sub_213EF2694()
{
  return MEMORY[0x24BEA5368]();
}

uint64_t sub_213EF26A0()
{
  return MEMORY[0x24BEA5370]();
}

uint64_t sub_213EF26AC()
{
  return MEMORY[0x24BEA5378]();
}

uint64_t sub_213EF26B8()
{
  return MEMORY[0x24BEA5388]();
}

uint64_t sub_213EF26C4()
{
  return MEMORY[0x24BEA5390]();
}

uint64_t sub_213EF26D0()
{
  return MEMORY[0x24BEA5398]();
}

uint64_t sub_213EF26DC()
{
  return MEMORY[0x24BEA53A0]();
}

uint64_t sub_213EF26E8()
{
  return MEMORY[0x24BEA53A8]();
}

uint64_t sub_213EF26F4()
{
  return MEMORY[0x24BEA53D0]();
}

uint64_t sub_213EF2700()
{
  return MEMORY[0x24BEA5410]();
}

uint64_t sub_213EF270C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_213EF2718()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_213EF2724()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_213EF2730()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_213EF273C()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_213EF2748()
{
  return MEMORY[0x24BEE54C0]();
}

uint64_t sub_213EF2754()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_213EF2760()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_213EF276C()
{
  return MEMORY[0x24BEE67F8]();
}

uint64_t sub_213EF2778()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_213EF2784()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_213EF2790()
{
  return MEMORY[0x24BEE02C0]();
}

uint64_t sub_213EF279C()
{
  return MEMORY[0x24BEE0300]();
}

uint64_t sub_213EF27A8()
{
  return MEMORY[0x24BEE0370]();
}

uint64_t sub_213EF27B4()
{
  return MEMORY[0x24BEE03B0]();
}

uint64_t sub_213EF27C0()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_213EF27CC()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_213EF27D8()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_213EF27E4()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_213EF27F0()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_213EF27FC()
{
  return MEMORY[0x24BEE06F8]();
}

uint64_t sub_213EF2808()
{
  return MEMORY[0x24BEE0780]();
}

uint64_t sub_213EF2814()
{
  return MEMORY[0x24BEE0798]();
}

uint64_t sub_213EF2820()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_213EF282C()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_213EF2838()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_213EF2844()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_213EF2850()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_213EF285C()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_213EF2868()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_213EF2874()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_213EF2880()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_213EF288C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_213EF2898()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_213EF28A4()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_213EF28B0()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_213EF28BC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_213EF28C8()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_213EF28D4()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_213EF28E0()
{
  return MEMORY[0x24BEE0B78]();
}

uint64_t sub_213EF28EC()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_213EF28F8()
{
  return MEMORY[0x24BEE0B88]();
}

uint64_t sub_213EF2904()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_213EF2910()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_213EF291C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_213EF2928()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_213EF2934()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_213EF2940()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_213EF294C()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_213EF2958()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_213EF2964()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_213EF2970()
{
  return MEMORY[0x24BEE0DC8]();
}

uint64_t sub_213EF297C()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_213EF2988()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_213EF2994()
{
  return MEMORY[0x24BDCFB60]();
}

uint64_t sub_213EF29A0()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_213EF29AC()
{
  return MEMORY[0x24BEE0E38]();
}

uint64_t sub_213EF29B8()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_213EF29C4()
{
  return MEMORY[0x24BEE0E98]();
}

uint64_t sub_213EF29D0()
{
  return MEMORY[0x24BEE0EB0]();
}

uint64_t sub_213EF29DC()
{
  return MEMORY[0x24BEE0EB8]();
}

uint64_t sub_213EF29E8()
{
  return MEMORY[0x24BEE0EE8]();
}

uint64_t sub_213EF29F4()
{
  return MEMORY[0x24BEE0EF0]();
}

uint64_t sub_213EF2A00()
{
  return MEMORY[0x24BEE0F30]();
}

uint64_t sub_213EF2A0C()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_213EF2A18()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_213EF2A24()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_213EF2A30()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_213EF2A3C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_213EF2A48()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_213EF2A54()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_213EF2A60()
{
  return MEMORY[0x24BEE1138]();
}

uint64_t sub_213EF2A6C()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_213EF2A78()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_213EF2A84()
{
  return MEMORY[0x24BEE1170]();
}

uint64_t sub_213EF2A90()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_213EF2A9C()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_213EF2AA8()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_213EF2AB4()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_213EF2AC0()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_213EF2ACC()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_213EF2AD8()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_213EF2AE4()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_213EF2AF0()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t sub_213EF2AFC()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_213EF2B08()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_213EF2B14()
{
  return MEMORY[0x24BEE6838]();
}

uint64_t sub_213EF2B20()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_213EF2B2C()
{
  return MEMORY[0x24BEE6908]();
}

uint64_t sub_213EF2B38()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t sub_213EF2B44()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_213EF2B50()
{
  return MEMORY[0x24BEE6CE0]();
}

uint64_t sub_213EF2B5C()
{
  return MEMORY[0x24BEE6CF8]();
}

uint64_t sub_213EF2B68()
{
  return MEMORY[0x24BEE6D08]();
}

uint64_t sub_213EF2B74()
{
  return MEMORY[0x24BEE6D20]();
}

uint64_t sub_213EF2B80()
{
  return MEMORY[0x24BEE6D28]();
}

uint64_t sub_213EF2B8C()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_213EF2B98()
{
  return MEMORY[0x24BEE1588]();
}

uint64_t sub_213EF2BA4()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_213EF2BB0()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_213EF2BBC()
{
  return MEMORY[0x24BEE15F8]();
}

uint64_t sub_213EF2BC8()
{
  return MEMORY[0x24BEE1638]();
}

uint64_t sub_213EF2BD4()
{
  return MEMORY[0x24BEE1640]();
}

uint64_t sub_213EF2BE0()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_213EF2BEC()
{
  return MEMORY[0x24BEE1690]();
}

uint64_t sub_213EF2BF8()
{
  return MEMORY[0x24BEE16A0]();
}

uint64_t sub_213EF2C04()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t sub_213EF2C10()
{
  return MEMORY[0x24BEE16F8]();
}

uint64_t sub_213EF2C1C()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_213EF2C28()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_213EF2C34()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_213EF2C40()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t sub_213EF2C4C()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_213EF2C58()
{
  return MEMORY[0x24BDCFDD8]();
}

uint64_t sub_213EF2C64()
{
  return MEMORY[0x24BDCFE88]();
}

uint64_t sub_213EF2C70()
{
  return MEMORY[0x24BDCFE90]();
}

uint64_t sub_213EF2C7C()
{
  return MEMORY[0x24BEA5440]();
}

uint64_t sub_213EF2C88()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_213EF2C94()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_213EF2CA0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_213EF2CAC()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_213EF2CB8()
{
  return MEMORY[0x24BDCFF88]();
}

uint64_t sub_213EF2CC4()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t sub_213EF2CD0()
{
  return MEMORY[0x24BDBB328]();
}

uint64_t sub_213EF2CDC()
{
  return MEMORY[0x24BDBB330]();
}

uint64_t sub_213EF2CE8()
{
  return MEMORY[0x24BEE5660]();
}

uint64_t sub_213EF2CF4()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_213EF2D00()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_213EF2D0C()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_213EF2D18()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_213EF2D24()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_213EF2D30()
{
  return MEMORY[0x24BDBB360]();
}

uint64_t sub_213EF2D3C()
{
  return MEMORY[0x24BDBB390]();
}

uint64_t sub_213EF2D48()
{
  return MEMORY[0x24BDD0178]();
}

uint64_t sub_213EF2D54()
{
  return MEMORY[0x24BEE5BD0]();
}

uint64_t sub_213EF2D60()
{
  return MEMORY[0x24BEE1C58]();
}

uint64_t sub_213EF2D6C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_213EF2D78()
{
  return MEMORY[0x24BEE1DB8]();
}

uint64_t sub_213EF2D84()
{
  return MEMORY[0x24BEE1E60]();
}

uint64_t sub_213EF2D90()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_213EF2D9C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_213EF2DA8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_213EF2DB4()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_213EF2DC0()
{
  return MEMORY[0x24BDD0530]();
}

uint64_t sub_213EF2DCC()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_213EF2DD8()
{
  return MEMORY[0x24BDD0600]();
}

uint64_t sub_213EF2DE4()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_213EF2DF0()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_213EF2DFC()
{
  return MEMORY[0x24BEE2150]();
}

uint64_t sub_213EF2E08()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_213EF2E14()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_213EF2E20()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_213EF2E2C()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_213EF2E38()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_213EF2E44()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_213EF2E50()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_213EF2E5C()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_213EF2E68()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_213EF2E74()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_213EF2E80()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_213EF2E8C()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_213EF2E98()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_213EF2EA4()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_213EF2EB0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_213EF2EBC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_213EF2EC8()
{
  return MEMORY[0x24BEE2578]();
}

uint64_t sub_213EF2ED4()
{
  return MEMORY[0x24BEE2610]();
}

uint64_t sub_213EF2EE0()
{
  return MEMORY[0x24BEE2628]();
}

uint64_t sub_213EF2EEC()
{
  return MEMORY[0x24BEE2630]();
}

uint64_t sub_213EF2EF8()
{
  return MEMORY[0x24BEE2648]();
}

uint64_t sub_213EF2F04()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_213EF2F10()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_213EF2F1C()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_213EF2F28()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_213EF2F34()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_213EF2F40()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_213EF2F4C()
{
  return MEMORY[0x24BEE28C0]();
}

uint64_t sub_213EF2F58()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_213EF2F64()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_213EF2F70()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_213EF2F7C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_213EF2F88()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_213EF2F94()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_213EF2FA0()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_213EF2FAC()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_213EF2FB8()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_213EF2FC4()
{
  return MEMORY[0x24BEE2B20]();
}

uint64_t sub_213EF2FD0()
{
  return MEMORY[0x24BEE2B78]();
}

uint64_t sub_213EF2FDC()
{
  return MEMORY[0x24BEE2B80]();
}

uint64_t sub_213EF2FE8()
{
  return MEMORY[0x24BEE2B98]();
}

uint64_t sub_213EF2FF4()
{
  return MEMORY[0x24BEE2BD8]();
}

uint64_t sub_213EF3000()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_213EF300C()
{
  return MEMORY[0x24BEE6F00]();
}

uint64_t sub_213EF3018()
{
  return MEMORY[0x24BEE2E18]();
}

uint64_t sub_213EF3024()
{
  return MEMORY[0x24BEE2E28]();
}

uint64_t sub_213EF3030()
{
  return MEMORY[0x24BEE2E30]();
}

uint64_t sub_213EF303C()
{
  return MEMORY[0x24BEE2E38]();
}

uint64_t sub_213EF3048()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_213EF3054()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_213EF3060()
{
  return MEMORY[0x24BEE2FD8]();
}

uint64_t sub_213EF306C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_213EF3078()
{
  return MEMORY[0x24BEE3070]();
}

uint64_t sub_213EF3084()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_213EF3090()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_213EF309C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_213EF30A8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_213EF30B4()
{
  return MEMORY[0x24BEE6F50]();
}

uint64_t sub_213EF30C0()
{
  return MEMORY[0x24BEE30D0]();
}

uint64_t sub_213EF30CC()
{
  return MEMORY[0x24BEE3160]();
}

uint64_t sub_213EF30D8()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_213EF30E4()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_213EF30F0()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_213EF30FC()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_213EF3108()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_213EF3114()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_213EF3120()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_213EF312C()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_213EF3138()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_213EF3144()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_213EF3150()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_213EF315C()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_213EF3168()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_213EF3174()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_213EF3180()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_213EF318C()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_213EF3198()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_213EF31A4()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_213EF31B0()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_213EF31BC()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_213EF31C8()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_213EF31D4()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_213EF31E0()
{
  return MEMORY[0x24BEE3550]();
}

uint64_t sub_213EF31EC()
{
  return MEMORY[0x24BEE7028]();
}

uint64_t sub_213EF31F8()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_213EF3204()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_213EF3210()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_213EF321C()
{
  return MEMORY[0x24BEE7088]();
}

uint64_t sub_213EF3228()
{
  return MEMORY[0x24BEE39B0]();
}

uint64_t sub_213EF3234()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_213EF3240()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_213EF324C()
{
  return MEMORY[0x24BEE3D20]();
}

uint64_t sub_213EF3258()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_213EF3264()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_213EF3270()
{
  return MEMORY[0x24BEE3E18]();
}

uint64_t sub_213EF327C()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_213EF3288()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_213EF3294()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_213EF32A0()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_213EF32AC()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_213EF32B8()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_213EF32C4()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_213EF32D0()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_213EF32DC()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_213EF32E8()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_213EF32F4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_213EF3300()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_213EF330C()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_213EF3318()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_213EF3324()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_213EF3330()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_213EF333C()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_213EF3348()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_213EF3354()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_213EF3360()
{
  return MEMORY[0x24BEE4A10]();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC328](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC330](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC338](c, data, *(_QWORD *)&len);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x24BDAC7D8](a1);
  return result;
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x24BEDCE10]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x24BEDCE18]();
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
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

uint64_t swift_getExtendedExistentialTypeMetadata()
{
  return MEMORY[0x24BEE4D30]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x24BEE4E88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

