uint64_t specialized Collection.first.getter()
{
  return specialized Collection.first.getter();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = OUTLINED_FUNCTION_91_2();
  v5 = v4(v3);
  v6 = v5;
  if (v2)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(v0, v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80)), v5);
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }
  return OUTLINED_FUNCTION_0_34(v0, v7, 1, v6);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_91_2();
  v3 = type metadata accessor for RankedAction();
  v4 = v3;
  if (v2)
  {
    v5 = *(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80);
    _s7SiriCam0B13ModelMetadataVWOcTm_0(v1 + ((v5 + 32) & ~v5), v0, (uint64_t (*)(_QWORD))type metadata accessor for RankedAction);
    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  return OUTLINED_FUNCTION_0_34(v0, v6, 1, v4);
}

void specialized Collection.first.getter(uint64_t a1)
{
  int v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  specialized Dictionary.startIndex.getter(a1);
  if ((v3 & 1) != 0)
    goto LABEL_7;
  if (*(_DWORD *)(a1 + 36) != v2)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return;
  }
  OUTLINED_FUNCTION_53_6();
  if (!v12)
  {
    v13 = OUTLINED_FUNCTION_48_7(v4, v5, v6, v7, v8, v9, v10, v11, v18, v19);
    specialized Dictionary.subscript.getter(v13, v14, v15, v16, v17);
  }
  OUTLINED_FUNCTION_95_1();
}

{
  int v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  specialized Dictionary.startIndex.getter(a1);
  if ((v3 & 1) != 0)
    goto LABEL_7;
  if (*(_DWORD *)(a1 + 36) != v2)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return;
  }
  OUTLINED_FUNCTION_53_6();
  if (!v12)
  {
    v13 = OUTLINED_FUNCTION_48_7(v4, v5, v6, v7, v8, v9, v10, v11, v18, v19);
    specialized Dictionary.subscript.getter(v13, v14, v15, v16, v17);
  }
  OUTLINED_FUNCTION_95_1();
}

double specialized Collection.first.getter@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result;

  if (*(_QWORD *)(a1 + 16))
  {
    outlined init with copy of SignalProviding(a1 + 32, a2);
  }
  else
  {
    *(_QWORD *)(a2 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

void specialized _dictionaryUpCast<A, B, C, D>(_:)(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  char v12;
  BOOL v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, MLFeatureValue>);
    v2 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  v31 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v30 = (unint64_t)(63 - v3) >> 6;
  OUTLINED_FUNCTION_11_3();
  v6 = 0;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        v7 = __clz(__rbit64(v5));
        v5 &= v5 - 1;
        v8 = v7 | (v6 << 6);
      }
      else
      {
        v9 = v6 + 1;
        if (__OFADD__(v6, 1))
          goto LABEL_38;
        if (v9 >= v30)
        {
LABEL_35:
          outlined consume of [String : MLFeatureValue].Iterator._Variant();
          return;
        }
        v10 = *(_QWORD *)(v31 + 8 * v9);
        v11 = v6 + 1;
        if (!v10)
        {
          OUTLINED_FUNCTION_106_0();
          if (v12 == v13)
            goto LABEL_35;
          OUTLINED_FUNCTION_105();
          if (!v10)
          {
            OUTLINED_FUNCTION_106_0();
            if (v12 == v13)
              goto LABEL_35;
            OUTLINED_FUNCTION_105();
            if (!v10)
            {
              OUTLINED_FUNCTION_106_0();
              if (v12 == v13)
                goto LABEL_35;
              OUTLINED_FUNCTION_105();
              if (!v10)
              {
                v15 = v14 + 4;
                if (v15 >= v30)
                  goto LABEL_35;
                v10 = *(_QWORD *)(v31 + 8 * v15);
                if (!v10)
                {
                  while (!__OFADD__(v15, 1))
                  {
                    OUTLINED_FUNCTION_106_0();
                    if (v12 == v13)
                      goto LABEL_35;
                    OUTLINED_FUNCTION_105();
                    v15 = v16 + 1;
                    if (v10)
                      goto LABEL_29;
                  }
                  goto LABEL_39;
                }
                v11 = v15;
              }
            }
          }
        }
LABEL_29:
        v5 = (v10 - 1) & v10;
        v8 = __clz(__rbit64(v10)) + (v11 << 6);
        v6 = v11;
      }
      v17 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v8);
      v19 = *v17;
      v18 = v17[1];
      v20 = *(void **)(*(_QWORD *)(a1 + 56) + 8 * v8);
      swift_bridgeObjectRetain();
      v21 = v20;
      v22 = specialized __RawDictionaryStorage.find<A>(_:)(v19, v18);
      v23 = v22;
      if ((v24 & 1) == 0)
        break;
      v25 = (uint64_t *)(v2[6] + 16 * v22);
      swift_bridgeObjectRelease();
      *v25 = v19;
      v25[1] = v18;
      v26 = v2[7];

      *(_QWORD *)(v26 + 8 * v23) = v21;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v22;
    v27 = (uint64_t *)(v2[6] + 16 * v22);
    *v27 = v19;
    v27[1] = v18;
    *(_QWORD *)(v2[7] + 8 * v22) = v21;
    v28 = v2[2];
    v13 = __OFADD__(v28, 1);
    v29 = v28 + 1;
    if (v13)
      goto LABEL_37;
    v2[2] = v29;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

unint64_t specialized _dictionaryUpCast<A, B, C, D>(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  unint64_t result;
  unint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t *v16;
  void *v17;
  id v18;
  unint64_t v19;
  char v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t *v25;
  uint64_t *v26;
  _OWORD *v27;
  uint64_t *v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  _OWORD v41[2];

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Any>);
    v2 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  v33 = v1 + 64;
  v3 = -1 << *(_BYTE *)(v1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(v1 + 64);
  v32 = (unint64_t)(63 - v3) >> 6;
  v6 = &v38;
  v7 = &v40;
  result = swift_bridgeObjectRetain();
  v34 = 0;
  v9 = (unint64_t *)&lazy cache variable for type metadata for MLMultiArray;
  v10 = 0x1E0C9E970uLL;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        v35 = (v5 - 1) & v5;
        v11 = __clz(__rbit64(v5)) | (v34 << 6);
      }
      else
      {
        v12 = v34 + 1;
        if (__OFADD__(v34, 1))
          goto LABEL_34;
        if (v12 >= v32)
        {
LABEL_31:
          outlined consume of [String : MLFeatureValue].Iterator._Variant();
          return (unint64_t)v2;
        }
        v13 = *(_QWORD *)(v33 + 8 * v12);
        v14 = v34 + 1;
        if (!v13)
        {
          v14 = v34 + 2;
          if (v34 + 2 >= v32)
            goto LABEL_31;
          v13 = *(_QWORD *)(v33 + 8 * v14);
          if (!v13)
          {
            v14 = v34 + 3;
            if (v34 + 3 >= v32)
              goto LABEL_31;
            v13 = *(_QWORD *)(v33 + 8 * v14);
            if (!v13)
            {
              v14 = v34 + 4;
              if (v34 + 4 >= v32)
                goto LABEL_31;
              v13 = *(_QWORD *)(v33 + 8 * v14);
              if (!v13)
              {
                v15 = v34 + 5;
                if (v34 + 5 >= v32)
                  goto LABEL_31;
                v13 = *(_QWORD *)(v33 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    v14 = v15 + 1;
                    if (__OFADD__(v15, 1))
                      goto LABEL_35;
                    if (v14 >= v32)
                      goto LABEL_31;
                    v13 = *(_QWORD *)(v33 + 8 * v14);
                    ++v15;
                    if (v13)
                      goto LABEL_25;
                  }
                }
                v14 = v34 + 5;
              }
            }
          }
        }
LABEL_25:
        v34 = v14;
        v35 = (v13 - 1) & v13;
        v11 = __clz(__rbit64(v13)) + (v14 << 6);
      }
      v16 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v11);
      v17 = *(void **)(*(_QWORD *)(v1 + 56) + 8 * v11);
      v36 = *v16;
      v37 = v16[1];
      type metadata accessor for MLMultiArray(0, v9);
      swift_bridgeObjectRetain();
      v18 = v17;
      swift_dynamicCast();
      outlined init with take of Any(v6, v7);
      outlined init with take of Any(v7, v41);
      outlined init with take of Any(v41, &v39);
      result = specialized __RawDictionaryStorage.find<A>(_:)(v36, v37);
      v19 = result;
      if ((v20 & 1) == 0)
        break;
      v21 = v7;
      v22 = v6;
      v23 = v1;
      v24 = v10;
      v25 = v9;
      v26 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v26 = v36;
      v26[1] = v37;
      v9 = v25;
      v10 = v24;
      v1 = v23;
      v6 = v22;
      v7 = v21;
      v27 = (_OWORD *)(v2[7] + 32 * v19);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
      result = (unint64_t)outlined init with take of Any(&v39, v27);
      v5 = v35;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v28 = (uint64_t *)(v2[6] + 16 * result);
    *v28 = v36;
    v28[1] = v37;
    result = (unint64_t)outlined init with take of Any(&v39, (_OWORD *)(v2[7] + 32 * result));
    v29 = v2[2];
    v30 = __OFADD__(v29, 1);
    v31 = v29 + 1;
    if (v30)
      goto LABEL_33;
    v2[2] = v31;
    v5 = v35;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay10Foundation3URLVG_SSs5NeverOTg5166_s7SiriCam13CoreMLHandlerC15findModelFolder11assetOutput10Foundation3URLVAH8modelUrl_AA0bF8MetadataV0lN0t_tKFSSAHcfu_33_43697e1f61f7e10b647d882195ad8775AHSSTf3nnnpk_nTf1cn_n(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v13 = MEMORY[0x1E0DEE9D8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    v2 = v13;
    v4 = *(_QWORD *)(type metadata accessor for URL() - 8);
    v5 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v6 = *(_QWORD *)(v4 + 72);
    do
    {
      v7 = URL.path.getter();
      v9 = v8;
      v10 = *(_QWORD *)(v13 + 16);
      if (v10 >= *(_QWORD *)(v13 + 24) >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      *(_QWORD *)(v13 + 16) = v10 + 1;
      v11 = v13 + 16 * v10;
      *(_QWORD *)(v11 + 32) = v7;
      *(_QWORD *)(v11 + 40) = v9;
      v5 += v6;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t CoreMLHandler.init(forModelWithName:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  char *v30;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
  OUTLINED_FUNCTION_1_1();
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_78_2();
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v29 - v14;
  *(_QWORD *)(v2 + 24) = a2;
  *(_QWORD *)(v2 + 32) = 0;
  *(_QWORD *)(v2 + 16) = a1;
  v16 = (char *)&v29 + *(int *)(v13 + 48) - v14;
  swift_bridgeObjectRetain();
  static AssetProvider.fetchModel(_:)((uint64_t)v15, (uint64_t)v16, a1, a2);
  if (v3)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    type metadata accessor for CoreMLHandler();
    swift_deallocPartialClassInstance();
  }
  else
  {
    swift_bridgeObjectRelease();
    v17 = *(int *)(v7 + 48);
    v29 = 0;
    v18 = v4 + v17;
    v19 = OUTLINED_FUNCTION_50_6();
    v30 = v11;
    v20 = *(_QWORD *)(v19 - 8);
    OUTLINED_FUNCTION_101_0(v4);
    OUTLINED_FUNCTION_13_22((uint64_t)v16, v21, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
    outlined init with take of CamModelMetadata(v18, v2 + OBJC_IVAR____TtC7SiriCam13CoreMLHandler_modelMetadata);
    v22 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
    v23 = (uint64_t)v30;
    v24 = v4;
    v25 = v22;
    v22(v24, v19);
    v26 = v23 + *(int *)(v7 + 48);
    OUTLINED_FUNCTION_101_0(v23);
    _s7SiriCam0B13ModelMetadataVWOcTm_0((uint64_t)v16, v26, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
    v27 = v29;
    CoreMLHandler.loadModel(from:)(v23, v26);
    if (v27)
      swift_release();
    outlined destroy of CaarHandler?((uint64_t)v15, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    outlined destroy of CamModelMetadata(v26);
    v25(v23, v19);
  }
  return v2;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CoreMLHandler.update()()
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  int v57;
  uint64_t v58;
  void (*v59)(uint64_t, uint64_t, uint64_t);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  os_log_type_t v72;
  uint8_t *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(uint64_t, uint64_t);
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  void (*v90)(uint64_t, uint64_t, uint64_t);
  uint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_2_12();
  v97 = v7;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v8);
  v96 = (char *)&v82 - v9;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_13_3();
  v95 = v11;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_76_2();
  v14 = MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v82 - v15;
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_78_2();
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_43_10();
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_72_3();
  v20 = v2 + v19;
  v21 = *(_QWORD *)(v0 + 16);
  v22 = *(_QWORD *)(v0 + 24);
  OUTLINED_FUNCTION_2();
  v23 = v21;
  v24 = v98;
  static AssetProvider.fetchModel(_:)(v2, v20, v23, v22);
  swift_bridgeObjectRelease();
  if (v24)
    goto LABEL_2;
  v86 = v3;
  v87 = v16;
  v94 = 0;
  v88 = v1;
  v98 = v0;
  v92 = v5;
  v25 = (_QWORD *)(v4 + *(int *)(v5 + 48));
  v26 = OUTLINED_FUNCTION_50_6();
  v27 = *(_QWORD *)(v26 - 8);
  v90 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16);
  v90(v4, v2, v26);
  v93 = (uint64_t *)v20;
  _s7SiriCam0B13ModelMetadataVWOcTm_0(v20, (uint64_t)v25, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
  v28 = v25[2];
  v29 = v25[3];
  v30 = v25[5];
  v89 = v25[4];
  outlined copy of CamModelVersion?(v28, v29, v89, v30);
  outlined destroy of CamModelMetadata((uint64_t)v25);
  v84 = v27;
  v31 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
  v91 = v26;
  v31(v4, v26);
  if (v30 == 1)
  {
    if (one-time initialization token for common != -1)
      swift_once();
    v32 = OUTLINED_FUNCTION_14_1();
    __swift_project_value_buffer(v32, (uint64_t)static Logger.common);
    OUTLINED_FUNCTION_20_14();
    v33 = Logger.logObject.getter();
    v34 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)OUTLINED_FUNCTION_4();
      v100 = OUTLINED_FUNCTION_4();
      *(_DWORD *)v35 = 136315138;
      OUTLINED_FUNCTION_36_0();
      v36 = OUTLINED_FUNCTION_59_1();
      OUTLINED_FUNCTION_54_1(v36);
      OUTLINED_FUNCTION_99_0();
      OUTLINED_FUNCTION_6_19();
      OUTLINED_FUNCTION_13();
      OUTLINED_FUNCTION_88(&dword_1C2E0C000, v33, v34, "%s: UAF didn't provide model version to check if it's a newer model. Skipping update", v35);
      OUTLINED_FUNCTION_13_1();
      OUTLINED_FUNCTION_3();
    }
    OUTLINED_FUNCTION_6_19();

    v42 = v2;
LABEL_22:
    outlined destroy of CaarHandler?(v42, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    goto LABEL_2;
  }
  v83 = v31;
  v85 = v2;
  v37 = (uint64_t *)(v98 + OBJC_IVAR____TtC7SiriCam13CoreMLHandler_modelMetadata);
  OUTLINED_FUNCTION_93_0();
  v39 = v37[2];
  v38 = v37[3];
  v41 = v37[4];
  v40 = v37[5];
  if (v40 == 1)
  {
    outlined consume of CamModelVersion?(v28, v29, v89, v30);
    outlined consume of CamModelVersion?(v39, v38, v41, 1);
  }
  else
  {
    v43 = v89;
    v44 = static CamModelVersion.== infix(_:_:)(v28, v29, v89, v30, v37[2], v37[3], v37[4], v40);
    outlined consume of CamModelVersion?(v28, v29, v43, v30);
    v45 = (uint64_t)v93;
    if ((v44 & 1) != 0)
    {
      v46 = v85;
      v47 = v98;
      v48 = v91;
      if (one-time initialization token for common != -1)
        swift_once();
      v49 = OUTLINED_FUNCTION_14_1();
      __swift_project_value_buffer(v49, (uint64_t)static Logger.common);
      v50 = v86;
      v51 = v90;
      v90(v86, v46, v48);
      OUTLINED_FUNCTION_86_2(v45, v52, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
      v53 = (uint64_t)v87;
      outlined init with copy of CamUserParse?(v50, (uint64_t)v87, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
      v54 = v88;
      outlined init with take of (modelUrl: URL, modelMetadata: CamModelMetadata)(v50, v88);
      OUTLINED_FUNCTION_20_14();
      v55 = Logger.logObject.getter();
      v56 = static os_log_type_t.default.getter();
      v57 = v56;
      if (os_log_type_enabled(v55, v56))
      {
        v58 = OUTLINED_FUNCTION_4();
        v97 = OUTLINED_FUNCTION_4();
        v101 = v97;
        *(_DWORD *)v58 = 136315394;
        v59 = v51;
        v60 = *(_QWORD *)(v47 + 16);
        OUTLINED_FUNCTION_50_1();
        v99 = OUTLINED_FUNCTION_40_5(v60, v61, &v101);
        v93 = &v100;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        OUTLINED_FUNCTION_6_19();
        OUTLINED_FUNCTION_5();
        *(_WORD *)(v58 + 12) = 2080;
        v89 = v58 + 14;
        LODWORD(v98) = v57;
        v62 = *(int *)(v92 + 48);
        v63 = v95;
        v64 = v95 + v62;
        v65 = v53 + v62;
        v59(v95, v53, v48);
        _s7SiriCam0B13ModelMetadataVWOcTm_0(v65, v64, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
        (*(void (**)(char *, uint64_t, uint64_t))(v84 + 32))(v96, v63, v48);
        OUTLINED_FUNCTION_94_0(v64);
        v66 = String.init<A>(describing:)();
        v99 = OUTLINED_FUNCTION_67_2(v66, v67);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        OUTLINED_FUNCTION_5();
        OUTLINED_FUNCTION_7_25(v88);
        OUTLINED_FUNCTION_7_25(v53);
        OUTLINED_FUNCTION_16_8(&dword_1C2E0C000, v55, (os_log_type_t)v98, "%s: Not updating the model %s as it has not changed", (uint8_t *)v58);
        OUTLINED_FUNCTION_14_9();
        OUTLINED_FUNCTION_3();
      }

      OUTLINED_FUNCTION_7_25(v54);
      OUTLINED_FUNCTION_7_25(v53);
      OUTLINED_FUNCTION_6_19();
      v42 = v46;
      goto LABEL_22;
    }
  }
  v68 = v98;
  v69 = v92;
  if (one-time initialization token for common != -1)
    swift_once();
  v70 = OUTLINED_FUNCTION_14_1();
  __swift_project_value_buffer(v70, (uint64_t)static Logger.common);
  swift_retain();
  v71 = Logger.logObject.getter();
  v72 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v71, v72))
  {
    v73 = (uint8_t *)OUTLINED_FUNCTION_4();
    v101 = OUTLINED_FUNCTION_4();
    *(_DWORD *)v73 = 136315138;
    v74 = *(_QWORD *)(v68 + 16);
    v75 = *(_QWORD *)(v68 + 24);
    swift_bridgeObjectRetain();
    v76 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v74, v75, &v101);
    OUTLINED_FUNCTION_80_1(v76);
    OUTLINED_FUNCTION_99_0();
    swift_release();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_88(&dword_1C2E0C000, v71, v72, "%s: Found a different model than current. Trying provisional model", v73);
    OUTLINED_FUNCTION_13_1();
    OUTLINED_FUNCTION_3();
  }

  swift_release();
  v77 = (uint64_t)v93;
  v78 = v85;
  v79 = v91;
  v80 = v97;
  v81 = v97 + *(int *)(v69 + 48);
  v90(v97, v85, v91);
  _s7SiriCam0B13ModelMetadataVWOcTm_0(v77, v81, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
  CoreMLHandler.loadModel(from:)(v80, v81);
  outlined destroy of CaarHandler?(v78, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
  outlined destroy of CamModelMetadata(v81);
  v83(v80, v79);
LABEL_2:
  OUTLINED_FUNCTION_4_9();
}

MLDictionaryFeatureProvider __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CoreMLHandler.predict(from:)(Swift::OpaquePointer from)
{
  uint64_t v1;
  void *v2;
  os_log_type_t v3;
  uint64_t v4;
  void *v5;
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  id v33;
  char v34;
  id v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  Swift::String v62;
  Swift::String v63;
  id v64;
  unint64_t v65;
  uint64_t v66;
  NSObject *v67;
  os_log_type_t v68;
  uint8_t *v69;
  uint64_t v70;
  id v71;
  id v72;
  void *v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  id v111;
  unint64_t v112;
  _QWORD *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  os_log_type_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t *v132;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  id v156;
  void *v157;
  void *v158;
  uint64_t v159;
  uint64_t v160;
  char v161[8];
  unint64_t v162;
  ValueMetadata *v163;
  unint64_t v164;
  uint64_t v165;

  v4 = v1;
  v165 = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(v1 + 32);
  if (v5)
  {
    v7 = v5;
    specialized _dictionaryUpCast<A, B, C, D>(_:)((uint64_t)from._rawValue);
    v8 = objc_allocWithZone(MEMORY[0x1E0C9E8F8]);
    v9 = @nonobjc MLDictionaryFeatureProvider.init(dictionary:)();
    if (v2)
    {
      v10 = v2;
    }
    else
    {
      v33 = v9;
      v163 = &type metadata for CamFeatureFlag;
      v164 = lazy protocol witness table accessor for type CamFeatureFlag and conformance CamFeatureFlag();
      v161[0] = 0;
      v34 = isFeatureEnabled(_:)();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v161);
      if ((v34 & 1) != 0)
      {
        v35 = OUTLINED_FUNCTION_79_2();
        OUTLINED_FUNCTION_29((uint64_t)v35, (unint64_t *)&lazy cache variable for type metadata for MLFeatureValue);
        v36 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

        CoreMLHandler.logModelFeatures(modelFeatures:)(v36);
        OUTLINED_FUNCTION_21_2();
      }
      else
      {
        v155 = (uint64_t)v7;
        if (one-time initialization token for common != -1)
          swift_once();
        v38 = OUTLINED_FUNCTION_14_1();
        __swift_project_value_buffer(v38, (uint64_t)static Logger.common);
        OUTLINED_FUNCTION_37_12();
        v39 = Logger.logObject.getter();
        v40 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v39, v40))
        {
          v41 = (uint8_t *)OUTLINED_FUNCTION_4();
          *(_QWORD *)v161 = OUTLINED_FUNCTION_4();
          *(_DWORD *)v41 = 136315138;
          v42 = *(_QWORD *)(v4 + 16);
          OUTLINED_FUNCTION_50_1();
          OUTLINED_FUNCTION_40_5(v42, v43, (uint64_t *)v161);
          OUTLINED_FUNCTION_25_14();
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release();
          OUTLINED_FUNCTION_5();
          OUTLINED_FUNCTION_88(&dword_1C2E0C000, v39, v40, "%s: Feature flag for verbose logging is disabled. Not logging model features", v41);
          OUTLINED_FUNCTION_13_1();
          OUTLINED_FUNCTION_3();
        }

        swift_release();
        v7 = (id)v155;
      }
      v156 = objc_msgSend(v7, sel_modelDescription);
      v44 = objc_msgSend(v156, sel_inputDescriptionsByName);
      OUTLINED_FUNCTION_29((uint64_t)v44, &lazy cache variable for type metadata for MLFeatureDescription);
      v45 = OUTLINED_FUNCTION_69_3();

      v46 = swift_bridgeObjectRetain();
      v144 = v45;
      v47 = specialized Set.init<A>(_:)(v46);
      v48 = OUTLINED_FUNCTION_79_2();
      OUTLINED_FUNCTION_29((uint64_t)v48, (unint64_t *)&lazy cache variable for type metadata for MLFeatureValue);
      v49 = OUTLINED_FUNCTION_69_3();

      v50 = specialized Set.init<A>(_:)(v49);
      v51 = specialized Set.subtracting(_:)(v50, v47);
      v52 = v33;
      v53 = v51;
      OUTLINED_FUNCTION_12();
      if (*(_QWORD *)(v53 + 16))
      {
        *(_QWORD *)v161 = 0;
        v162 = 0xE000000000000000;
        _StringGuts.grow(_:)(71);
        v54 = OUTLINED_FUNCTION_11_3();
        OUTLINED_FUNCTION_10_20(v54, v55, v56, v57, v58, v59, v60, v61, v134, (uint64_t)v52, v144, v4, (uint64_t)v156, v159, v161[0]);
        OUTLINED_FUNCTION_3_1();
        v62._object = (void *)0x80000001C2E9BF50;
        v62._countAndFlagsBits = 0xD00000000000001FLL;
        String.append(_:)(v62);
        v63._countAndFlagsBits = Set.description.getter();
        String.append(_:)(v63);
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_3_1();
        OUTLINED_FUNCTION_18_16(0xD000000000000024, (uint64_t)" in the MLDictionaryFeatureProvider.");
        v64 = *(id *)v161;
        v65 = v162;
        if (one-time initialization token for common != -1)
          swift_once();
        v66 = OUTLINED_FUNCTION_14_1();
        v67 = __swift_project_value_buffer(v66, (uint64_t)static Logger.common);
        OUTLINED_FUNCTION_21_7();
        Logger.logObject.getter();
        v68 = OUTLINED_FUNCTION_29_1();
        if (OUTLINED_FUNCTION_1_14(v68))
        {
          v69 = (uint8_t *)OUTLINED_FUNCTION_4();
          *(_QWORD *)v161 = OUTLINED_FUNCTION_4();
          *(_DWORD *)v69 = 136315138;
          swift_bridgeObjectRetain();
          OUTLINED_FUNCTION_82_2((uint64_t)v64, v70, (uint64_t *)v161);
          OUTLINED_FUNCTION_25_14();
          OUTLINED_FUNCTION_99_0();
          OUTLINED_FUNCTION_41_3();
          OUTLINED_FUNCTION_88(&dword_1C2E0C000, v67, (os_log_type_t)v48, "%s", v69);
          OUTLINED_FUNCTION_13_1();
          OUTLINED_FUNCTION_3();
        }

        OUTLINED_FUNCTION_1_10();
        lazy protocol witness table accessor for type ModelError and conformance ModelError();
        v10 = (void *)OUTLINED_FUNCTION_2_1();
        *v84 = v64;
        v84[1] = v65;
        OUTLINED_FUNCTION_20((uint64_t)v84, 1);

        OUTLINED_FUNCTION_46_5(v85, v86, v87, v88, v89, v90, v91, v92, v136, (uint64_t)v140, v145, v149, v157);
        OUTLINED_FUNCTION_45_8();
        v4 = v150;
      }
      else
      {
        swift_bridgeObjectRelease();
        *(_QWORD *)v161 = 0;
        v71 = objc_msgSend(v7, sel_predictionFromFeatures_error_, v52, v161);
        v72 = *(id *)v161;
        v73 = v52;
        if (v71)
        {
          objc_opt_self();
          v74 = swift_dynamicCastObjCClass();
          if (v74)
          {
            v29 = v74;
            v75 = v72;

            OUTLINED_FUNCTION_46_5(v76, v77, v78, v79, v80, v81, v82, v83, v134, v138, v144, v4, v156);
            OUTLINED_FUNCTION_45_8();
            return (MLDictionaryFeatureProvider)v29;
          }
          *(_QWORD *)v161 = 0;
          v162 = 0xE000000000000000;
          v102 = v72;
          _StringGuts.grow(_:)(65);
          v103 = OUTLINED_FUNCTION_11_3();
          OUTLINED_FUNCTION_10_20(v103, v104, v105, v106, v107, v108, v109, v110, v134, v138, v144, v4, (uint64_t)v156, v159, v161[0]);
          OUTLINED_FUNCTION_3_1();
          OUTLINED_FUNCTION_18_16(0xD00000000000003FLL, (uint64_t)": Model output was not castable to MLDictionaryFeatureProvider.");
          v111 = *(id *)v161;
          v112 = v162;
          lazy protocol witness table accessor for type ModelError and conformance ModelError();
          v10 = (void *)OUTLINED_FUNCTION_2_1();
          *v113 = v111;
          v113[1] = v112;
          OUTLINED_FUNCTION_20((uint64_t)v113, 1);

          OUTLINED_FUNCTION_46_5(v114, v115, v116, v117, v118, v119, v120, v121, v137, v141, v146, v152, v158);
          OUTLINED_FUNCTION_45_8();
          swift_unknownObjectRelease();
        }
        else
        {
          v93 = *(id *)v161;
          v10 = (void *)_convertNSErrorToError(_:)();

          swift_willThrow();
          OUTLINED_FUNCTION_46_5(v94, v95, v96, v97, v98, v99, v100, v101, v134, v138, v144, v4, v156);
          OUTLINED_FUNCTION_45_8();
          v4 = v151;
        }
      }
    }
    *(_QWORD *)v161 = v10;
    v122 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    v123 = String.init<A>(reflecting:)();
    v125 = v124;
    if (one-time initialization token for common != -1)
      swift_once();
    v126 = OUTLINED_FUNCTION_14_1();
    v29 = __swift_project_value_buffer(v126, (uint64_t)static Logger.common);
    OUTLINED_FUNCTION_20_14();
    OUTLINED_FUNCTION_21_7();
    Logger.logObject.getter();
    v127 = OUTLINED_FUNCTION_29_1();
    if (os_log_type_enabled(v29, v127))
    {
      v128 = OUTLINED_FUNCTION_4();
      *(_QWORD *)v161 = OUTLINED_FUNCTION_4();
      *(_DWORD *)v128 = 136315394;
      v129 = *(_QWORD *)(v4 + 16);
      OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_85_2(v129, v130, (uint64_t *)v161);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_6_19();
      OUTLINED_FUNCTION_1_0();
      *(_WORD *)(v128 + 12) = 2080;
      OUTLINED_FUNCTION_50_1();
      OUTLINED_FUNCTION_40_5(v123, v131, (uint64_t *)v161);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_41_3();
      OUTLINED_FUNCTION_16_8(&dword_1C2E0C000, v29, v127, "%s: Model prediction failed with error : %s", (uint8_t *)v128);
      OUTLINED_FUNCTION_14_9();
      OUTLINED_FUNCTION_3();
    }

    OUTLINED_FUNCTION_1_10();
    OUTLINED_FUNCTION_6_19();
    lazy protocol witness table accessor for type ModelError and conformance ModelError();
    OUTLINED_FUNCTION_2_1();
    *v132 = v123;
    v132[1] = v125;
    OUTLINED_FUNCTION_20((uint64_t)v132, 1);

  }
  else
  {
    v162 = 0xE000000000000000;
    _StringGuts.grow(_:)(53);
    v11 = OUTLINED_FUNCTION_11_3();
    OUTLINED_FUNCTION_10_20(v11, v12, v13, v14, v15, v16, v17, v18, v134, v138, v142, v147, v153, v159, 0);
    OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_18_16(0xD000000000000031, (uint64_t)": Prediction called without a model instance for ");
    v19 = OUTLINED_FUNCTION_11_3();
    OUTLINED_FUNCTION_10_20(v19, v20, v21, v22, v23, v24, v25, v26, v135, v139, v143, v148, v154, v160, v161[0]);
    OUTLINED_FUNCTION_3_1();
    v27 = *(id *)v161;
    if (one-time initialization token for common != -1)
      swift_once();
    v28 = OUTLINED_FUNCTION_14_1();
    v29 = __swift_project_value_buffer(v28, (uint64_t)static Logger.common);
    OUTLINED_FUNCTION_21_7();
    Logger.logObject.getter();
    v30 = OUTLINED_FUNCTION_29_1();
    if (OUTLINED_FUNCTION_1_14(v30))
    {
      v31 = (uint8_t *)OUTLINED_FUNCTION_4();
      *(_QWORD *)v161 = OUTLINED_FUNCTION_4();
      *(_DWORD *)v31 = 136315138;
      OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_85_2((uint64_t)v27, v32, (uint64_t *)v161);
      OUTLINED_FUNCTION_25_14();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_41_3();
      OUTLINED_FUNCTION_88(&dword_1C2E0C000, v29, v3, "%s", v31);
      OUTLINED_FUNCTION_13_1();
      OUTLINED_FUNCTION_3();
    }

    OUTLINED_FUNCTION_1_10();
    lazy protocol witness table accessor for type CamError and conformance CamError();
    OUTLINED_FUNCTION_2_1();
    *v37 = *(_QWORD *)v161;
    v37[1] = 0xE000000000000000;
    OUTLINED_FUNCTION_20((uint64_t)v37, 2);
  }
  return (MLDictionaryFeatureProvider)v29;
}

void CoreMLHandler.getMetadata()(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC7SiriCam13CoreMLHandler_modelMetadata;
  swift_beginAccess();
  _s7SiriCam0B13ModelMetadataVWOcTm_0(v3, a1, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
}

void CoreMLHandler.loadModel(from:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void (*v3)(void);
  uint64_t v4;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t, uint64_t);
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
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  NSObject *v57;
  void (*v58)(void);
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  os_log_type_t v64;
  int v65;
  _BOOL4 v66;
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
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  void (*v84)(void);
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void (*v99)(void);
  NSObject *v100;
  os_log_type_t v101;
  int v102;
  uint64_t v103;
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
  void (*v117)(uint64_t, uint64_t, uint64_t);
  uint64_t v118;
  unint64_t v119;
  uint64_t v120;
  unint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  NSObject *v130;
  os_log_type_t v131;
  _BOOL4 v132;
  uint64_t v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t (*v141)(uint64_t, uint64_t, uint64_t);
  uint64_t v142;
  unint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void (*v146)(uint64_t, uint64_t);
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  id v163;
  uint64_t v164;
  uint64_t v165;
  void (*v166)(uint64_t, uint64_t, uint64_t);
  uint64_t v167;
  uint64_t v168;
  void (*v169)(_QWORD, uint64_t, uint64_t);
  uint64_t v170;
  void (*v171)(void);
  uint64_t v172;
  void *v173;
  uint64_t v174;
  uint64_t v175;
  os_log_type_t v176;
  uint8_t *v177;
  uint64_t v178;
  uint64_t v179;
  unint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  int v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  void (*v192)(uint64_t, uint64_t, uint64_t);
  char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  char *v203;
  uint64_t v204;
  void *v205;
  uint64_t v206;
  uint64_t v207;
  char *v208;
  uint64_t v209;
  void (*v210)(uint64_t, uint64_t);
  id v211;
  uint64_t v212;
  os_log_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;

  v4 = v2;
  v189 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata)?);
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_2_12();
  v188 = v7;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v8);
  v193 = (char *)&v184 - v9;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v10);
  v194 = (uint64_t)&v184 - v11;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v184 - v13;
  type metadata accessor for CamModelMetadata();
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_9_7();
  v196 = v16;
  v17 = OUTLINED_FUNCTION_50_6();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_2_12();
  v187 = v19;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v20);
  OUTLINED_FUNCTION_13_3();
  v191 = v21;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v22);
  OUTLINED_FUNCTION_13_3();
  v201 = v23;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v24);
  v208 = (char *)&v184 - v25;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x1E0C80A78](v27);
  OUTLINED_FUNCTION_2_12();
  v210 = v28;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v29);
  OUTLINED_FUNCTION_13_3();
  v209 = v30;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v31);
  v203 = (char *)&v184 - v32;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v33);
  OUTLINED_FUNCTION_13_3();
  v190 = v34;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v35);
  OUTLINED_FUNCTION_13_3();
  v192 = v36;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v37);
  OUTLINED_FUNCTION_13_3();
  v202 = v38;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v39);
  v199 = (uint64_t)&v184 - v40;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v41);
  v197 = (uint64_t)&v184 - v42;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v43);
  OUTLINED_FUNCTION_13_3();
  v195 = v44;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v45);
  OUTLINED_FUNCTION_13_3();
  v204 = v46;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v47);
  OUTLINED_FUNCTION_13_3();
  v207 = v48;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v49);
  OUTLINED_FUNCTION_13_3();
  v211 = v50;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v51);
  OUTLINED_FUNCTION_76_2();
  v53 = MEMORY[0x1E0C80A78](v52);
  v55 = (char *)&v184 - v54;
  MEMORY[0x1E0C80A78](v53);
  v57 = ((char *)&v184 + *(int *)(v26 + 48) - v56);
  v212 = v18;
  v58 = *(void (**)(void))(v18 + 16);
  v216 = (uint64_t)&v184 - v56;
  v59 = v57;
  v214 = (uint64_t)v58;
  v58();
  _s7SiriCam0B13ModelMetadataVWOcTm_0(a2, (uint64_t)v59, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
  static AssetProvider.setAssetsProvisional()();
  if (one-time initialization token for common != -1)
    swift_once();
  v60 = OUTLINED_FUNCTION_14_1();
  v61 = __swift_project_value_buffer(v60, (uint64_t)static Logger.common);
  OUTLINED_FUNCTION_65_1((uint64_t)v55, v216);
  v213 = v59;
  OUTLINED_FUNCTION_13_22((uint64_t)v59, v62, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
  outlined init with copy of CamUserParse?((uint64_t)v55, (uint64_t)v3, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
  outlined init with take of (modelUrl: URL, modelMetadata: CamModelMetadata)((uint64_t)v55, (uint64_t)v211);
  swift_retain();
  v206 = v61;
  v63 = Logger.logObject.getter();
  v64 = static os_log_type_t.debug.getter();
  v215 = v26;
  v65 = v64;
  v66 = os_log_type_enabled(v63, v64);
  v67 = v4;
  v198 = v14;
  if (v66)
  {
    v68 = OUTLINED_FUNCTION_4();
    v186 = OUTLINED_FUNCTION_4();
    v217 = v186;
    *(_DWORD *)v68 = 136315394;
    v185 = v65;
    v69 = *(_QWORD *)(v67 + 16);
    v200 = v67;
    OUTLINED_FUNCTION_50_1();
    v218 = OUTLINED_FUNCTION_40_5(v69, v70, &v217);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    OUTLINED_FUNCTION_5();
    *(_WORD *)(v68 + 12) = 2080;
    v184 = v68 + 14;
    v71 = *(int *)(v215 + 48);
    v72 = v207;
    v73 = v207 + v71;
    v74 = (uint64_t)v3 + v71;
    OUTLINED_FUNCTION_65_1(v207, (uint64_t)v3);
    OUTLINED_FUNCTION_86_2(v74, v75, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
    v76 = v17;
    v77 = URL.absoluteString.getter();
    (*(void (**)(uint64_t, uint64_t))(v212 + 8))(v72, v76);
    outlined destroy of CamModelMetadata(v73);
    v218 = OUTLINED_FUNCTION_40_5(v77, v78, &v217);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_7_25((uint64_t)v211);
    OUTLINED_FUNCTION_7_25((uint64_t)v3);
    OUTLINED_FUNCTION_16_8(&dword_1C2E0C000, v63, (os_log_type_t)v185, "%s: Loading model from url : %s", (uint8_t *)v68);
    OUTLINED_FUNCTION_14_9();
    OUTLINED_FUNCTION_3();
  }
  swift_release();
  OUTLINED_FUNCTION_7_25((uint64_t)v211);
  OUTLINED_FUNCTION_7_25((uint64_t)v3);

  v79 = v4;
  v80 = (uint64_t)v208;
  v81 = v209;
  v82 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C9E958]), sel_init);
  objc_msgSend(v82, sel_setComputeUnits_, 0);
  v83 = v204;
  v84 = (void (*)(void))(v204 + *(int *)(v215 + 48));
  OUTLINED_FUNCTION_66_0(v204, v216);
  OUTLINED_FUNCTION_13_22((uint64_t)v213, v85, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
  v86 = v205;
  CoreMLHandler.findModelFolder(assetOutput:)(v83, v84, v80);
  if (v86)
  {
    outlined destroy of CamModelMetadata((uint64_t)v84);
    (*(void (**)(uint64_t, uint64_t))(v212 + 8))(v83, v17);
    v87 = v215;
    v96 = (uint64_t)v203;
    ((void (*)(char *, uint64_t, uint64_t))v3)(v203, v216, v17);
    OUTLINED_FUNCTION_13_22((uint64_t)v213, v97, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
    OUTLINED_FUNCTION_56_5(v96, v98, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    outlined init with take of (modelUrl: URL, modelMetadata: CamModelMetadata)(v96, (uint64_t)v210);
    swift_retain();
    OUTLINED_FUNCTION_100();
    swift_retain();
    OUTLINED_FUNCTION_100();
    v99 = v3;
    v100 = OUTLINED_FUNCTION_74_2();
    v101 = static os_log_type_t.error.getter();
    v102 = v101;
    if (os_log_type_enabled(v100, v101))
    {
      v103 = OUTLINED_FUNCTION_4();
      LODWORD(v215) = v102;
      v104 = v103;
      v214 = OUTLINED_FUNCTION_4();
      v217 = v214;
      *(_DWORD *)v104 = 136315650;
      v211 = v82;
      v213 = v100;
      v205 = v86;
      v105 = v17;
      v106 = *(_QWORD *)(v79 + 16);
      swift_bridgeObjectRetain();
      v108 = OUTLINED_FUNCTION_82_2(v106, v107, &v217);
      OUTLINED_FUNCTION_54_1(v108);
      v208 = v109;
      OUTLINED_FUNCTION_31_8();
      OUTLINED_FUNCTION_6_19();
      swift_bridgeObjectRelease();
      *(_WORD *)(v104 + 12) = 2080;
      v110 = *(int *)(v87 + 48);
      v111 = v207;
      v112 = v207 + v110;
      v113 = v81 + v110;
      OUTLINED_FUNCTION_55_5();
      v99();
      _s7SiriCam0B13ModelMetadataVWOcTm_0(v113, v112, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
      v114 = v202;
      OUTLINED_FUNCTION_90_0();
      v115 = v105;
      v116 = (uint64_t)v205;
      v117(v114, v111, v115);
      OUTLINED_FUNCTION_94_0(v112);
      v118 = String.init<A>(describing:)();
      v218 = OUTLINED_FUNCTION_58_4(v118, v119);
      OUTLINED_FUNCTION_31_8();
      OUTLINED_FUNCTION_21_2();
      OUTLINED_FUNCTION_35_9((uint64_t)v210);
      OUTLINED_FUNCTION_35_9(v209);
      *(_WORD *)(v104 + 22) = 2080;
      v218 = v116;
      OUTLINED_FUNCTION_100();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
      v120 = String.init<A>(reflecting:)();
      v218 = OUTLINED_FUNCTION_58_4(v120, v121);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_21_2();
      OUTLINED_FUNCTION_51_4();
      OUTLINED_FUNCTION_51_4();
      _os_log_impl(&dword_1C2E0C000, v213, (os_log_type_t)v215, "%s: Model load failed for model: %s with error: %s", (uint8_t *)v104, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
    }
    OUTLINED_FUNCTION_6_19();
    outlined destroy of CaarHandler?((uint64_t)v210, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    outlined destroy of CaarHandler?(v81, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    OUTLINED_FUNCTION_51_4();
    OUTLINED_FUNCTION_51_4();

    swift_willThrow();
    v122 = &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata);
    v123 = v216;
  }
  else
  {
    outlined destroy of CamModelMetadata((uint64_t)v84);
    v88 = v82;
    v89 = v17;
    v90 = *(uint64_t (**)(uint64_t, uint64_t))(v212 + 8);
    v91 = v90(v83, v89);
    v92 = OUTLINED_FUNCTION_29(v91, &lazy cache variable for type metadata for MLModel);
    v93 = v201;
    ((void (*)(uint64_t, uint64_t, uint64_t))v3)(v201, v80, v89);
    v211 = v88;
    v94 = v88;
    v95 = @nonobjc MLModel.__allocating_init(contentsOf:configuration:)(v93, v94);
    v209 = v92;
    v210 = (void (*)(uint64_t, uint64_t))v90;
    v211 = v94;
    v205 = 0;
    v124 = *(void **)(v79 + 32);
    *(_QWORD *)(v79 + 32) = v95;

    v125 = v215;
    v126 = v195;
    ((void (*)(uint64_t, uint64_t, uint64_t))v3)(v195, v216, v89);
    OUTLINED_FUNCTION_13_22((uint64_t)v213, v127, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
    v128 = v197;
    OUTLINED_FUNCTION_56_5(v126, v129, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    outlined init with take of (modelUrl: URL, modelMetadata: CamModelMetadata)(v126, v199);
    OUTLINED_FUNCTION_20_14();
    v130 = OUTLINED_FUNCTION_74_2();
    v131 = static os_log_type_t.default.getter();
    v132 = os_log_type_enabled(v130, v131);
    v200 = v79;
    if (v132)
    {
      v133 = OUTLINED_FUNCTION_4();
      v204 = OUTLINED_FUNCTION_4();
      v217 = v204;
      *(_DWORD *)v133 = 136315394;
      OUTLINED_FUNCTION_36_0();
      v134 = OUTLINED_FUNCTION_59_1();
      OUTLINED_FUNCTION_54_1(v134);
      v203 = v135;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_6_19();
      OUTLINED_FUNCTION_13();
      *(_WORD *)(v133 + 12) = 2080;
      v201 = v133 + 14;
      v136 = *(int *)(v215 + 48);
      v137 = v207 + v136;
      v138 = v128 + v136;
      OUTLINED_FUNCTION_55_5();
      v3();
      _s7SiriCam0B13ModelMetadataVWOcTm_0(v138, v137, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
      v139 = v202;
      v140 = v202 + *(int *)(v215 + 48);
      OUTLINED_FUNCTION_90_0();
      OUTLINED_FUNCTION_84_1(v139, v141);
      outlined init with take of CamModelMetadata(v137, v140);
      v142 = String.init<A>(describing:)();
      v218 = OUTLINED_FUNCTION_58_4(v142, v143);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_13();
      OUTLINED_FUNCTION_35_9(v199);
      outlined destroy of CaarHandler?(v197, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
      OUTLINED_FUNCTION_16_8(&dword_1C2E0C000, v130, v131, "%s: Model load succeeded for model: %s", (uint8_t *)v133);
      OUTLINED_FUNCTION_14_9();
      OUTLINED_FUNCTION_3();
    }

    OUTLINED_FUNCTION_7_25(v199);
    OUTLINED_FUNCTION_7_25(v128);
    OUTLINED_FUNCTION_6_19();
    v144 = v125;
    v145 = v89;
    v146 = v210;
    v210((uint64_t)v208, v89);
    v147 = (uint64_t)v198;
    v148 = v207;
    v149 = v144;
    v150 = v207 + *(int *)(v144 + 48);
    ((void (*)(uint64_t, uint64_t, uint64_t))v3)(v207, v216, v145);
    OUTLINED_FUNCTION_13_22((uint64_t)v213, v151, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
    v152 = v196;
    OUTLINED_FUNCTION_94_0(v150);
    v153 = v200;
    v154 = v200 + OBJC_IVAR____TtC7SiriCam13CoreMLHandler_modelMetadata;
    OUTLINED_FUNCTION_93_0();
    outlined assign with take of CamModelMetadata(v152, v154);
    swift_endAccess();
    v155 = v145;
    v146(v148, v145);
    if (*(_QWORD *)(v153 + 16) != 0xD000000000000025 || *(_QWORD *)(v153 + 24) != 0x80000001C2E997D0)
    {
      v156 = _stringCompareWithSmolCheck(_:_:expecting:)();
      if ((v156 & 1) == 0)
      {
        OUTLINED_FUNCTION_52_1(v156, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
        OUTLINED_FUNCTION_147();
        goto LABEL_12;
      }
    }
    v157 = v149;
    __swift_storeEnumTagSinglePayload(v147, 1, 1, v149);
    v158 = v194;
    v159 = v205;
    static AssetProvider.fetchModel(_:)(v194, v194 + *(int *)(v149 + 48), 0xD000000000000029, 0x80000001C2E99760);
    if (v159)
    {

      v205 = 0;
      v160 = 1;
    }
    else
    {
      v205 = 0;
      v160 = 0;
    }
    v161 = (uint64_t)v193;
    v162 = v155;
    __swift_storeEnumTagSinglePayload(v158, v160, 1, v149);
    outlined assign with take of (modelUrl: URL, modelMetadata: CamModelMetadata)?(v158, v147);
    outlined init with copy of CamUserParse?(v147, v161, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata)?);
    if (__swift_getEnumTagSinglePayload(v161, 1, v149) == 1)
    {
      outlined destroy of CaarHandler?(v161, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata)?);
      v163 = v211;
    }
    else
    {
      v165 = *(int *)(v149 + 48);
      v166 = v192;
      v167 = (uint64_t)v192 + v165;
      v168 = v161 + v165;
      OUTLINED_FUNCTION_90_0();
      v169(v166, v161, v162);
      outlined init with take of CamModelMetadata(v168, v167);
      v170 = v190;
      v171 = (void (*)(void))(v190 + *(int *)(v157 + 48));
      OUTLINED_FUNCTION_66_0(v190, (uint64_t)v166);
      _s7SiriCam0B13ModelMetadataVWOcTm_0(v167, (uint64_t)v171, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
      v172 = v191;
      v173 = v205;
      CoreMLHandler.findModelFolder(assetOutput:)(v170, v171, v191);
      if (v173)
      {
        outlined destroy of CaarHandler?((uint64_t)v166, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
        OUTLINED_FUNCTION_103_0();
        OUTLINED_FUNCTION_42_7(v170);
        v175 = (uint64_t)v198;
        OUTLINED_FUNCTION_74_2();
        v176 = OUTLINED_FUNCTION_29_1();
        if (OUTLINED_FUNCTION_1_14(v176))
        {
          v177 = (uint8_t *)OUTLINED_FUNCTION_4();
          v218 = OUTLINED_FUNCTION_4();
          *(_DWORD *)v177 = 136315138;
          OUTLINED_FUNCTION_93_0();
          OUTLINED_FUNCTION_56_5(v175, v178, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata)?);
          v179 = String.init<A>(describing:)();
          v181 = OUTLINED_FUNCTION_67_2(v179, v180);
          OUTLINED_FUNCTION_80_1(v181);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          OUTLINED_FUNCTION_5();
          OUTLINED_FUNCTION_88(&dword_1C2E0C000, 0xD000000000000025, (os_log_type_t)v166, "Load model failed for %s. Skipping promotion of all assets", v177);
          OUTLINED_FUNCTION_13_1();
          OUTLINED_FUNCTION_3();
        }

        OUTLINED_FUNCTION_147();
        OUTLINED_FUNCTION_52_1(v182, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
        v122 = &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata)?;
        v123 = v175;
        goto LABEL_11;
      }
      OUTLINED_FUNCTION_103_0();
      OUTLINED_FUNCTION_42_7(v170);
      v174 = v187;
      v166(v187, v172, v162);

      v183 = OUTLINED_FUNCTION_42_7(v172);
      OUTLINED_FUNCTION_68_2(v183, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
      v163 = v211;
      v147 = (uint64_t)v198;
    }
    static AssetProvider.promoteAssets()();

    OUTLINED_FUNCTION_52_1(v164, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    v122 = &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata)?;
    v123 = v147;
  }
LABEL_11:
  outlined destroy of CaarHandler?(v123, v122);
LABEL_12:
  OUTLINED_FUNCTION_4_9();
}

id @nonobjc MLModel.__allocating_init(contentsOf:configuration:)(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v11;
  NSURL *v12;

  v12 = (NSURL *)*MEMORY[0x1E0C80C00];
  URL._bridgeToObjectiveC()(v12);
  v5 = v4;
  v11 = 0;
  v6 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_modelWithContentsOfURL_configuration_error_, v4, a2, &v11);

  if (v6)
  {
    v7 = v11;
  }
  else
  {
    v8 = v11;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }

  v9 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(a1, v9);
  return v6;
}

void CoreMLHandler.findModelFolder(assetOutput:)(uint64_t a1@<X0>, void (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  NSURL *v44;
  void *v45;
  void *v46;
  void (*v47)(char *, uint64_t);
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v58;
  _QWORD *v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  Swift::String v68;
  id v69;
  unint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  NSObject *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  os_log_type_t v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void (*v91)(void);
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
  void (*v102)(void);
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void (*v109)(uint64_t, uint64_t, uint64_t);
  void (*v110)(void);
  uint64_t v111;
  uint64_t (*v112)(uint64_t, uint64_t, uint64_t);
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void (*v121)(void);
  NSObject *v122;
  os_log_type_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t *v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  unint64_t v134;
  uint64_t v135;
  char *v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  NSObject *v140;
  uint64_t v141;
  char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void (*v151)(char *, uint64_t);
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void (*v155)(void);
  char *v156;
  char *v157;
  uint64_t v158;
  id v159;
  unint64_t v160;
  uint64_t v161;

  v155 = a2;
  v139 = a3;
  v161 = *MEMORY[0x1E0C80C00];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_2_12();
  v138 = v7;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v135 - v9;
  v11 = OUTLINED_FUNCTION_50_6();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_2_12();
  v145 = v13;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v14);
  v136 = (char *)&v135 - v15;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v16);
  v156 = (char *)&v135 - v17;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v18);
  v157 = (char *)&v135 - v19;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x1E0C80A78](v21);
  OUTLINED_FUNCTION_2_12();
  v147 = v22;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v23);
  OUTLINED_FUNCTION_13_3();
  v143 = v24;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v25);
  v137 = (char *)&v135 - v26;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v27);
  v142 = (char *)&v135 - v28;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v29);
  v146 = (uint64_t)&v135 - v30;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v31);
  OUTLINED_FUNCTION_13_3();
  v141 = v32;
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v33);
  v140 = ((char *)&v135 - v34);
  OUTLINED_FUNCTION_3_7();
  MEMORY[0x1E0C80A78](v35);
  OUTLINED_FUNCTION_43_10();
  MEMORY[0x1E0C80A78](v36);
  OUTLINED_FUNCTION_72_3();
  v38 = v3 + v37;
  v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
  v39(v3, a1, v11);
  OUTLINED_FUNCTION_70_2((uint64_t)v155, v40, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
  v41 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v149 = v20;
  v42 = v4 + *(int *)(v20 + 48);
  v155 = (void (*)(void))v39;
  v39(v4, v3, v11);
  v43 = v11;
  v148 = v38;
  _s7SiriCam0B13ModelMetadataVWOcTm_0(v38, v42, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
  URL._bridgeToObjectiveC()(v44);
  v46 = v45;
  OUTLINED_FUNCTION_103_0();
  v154 = v12;
  v47 = *(void (**)(char *, uint64_t))(v12 + 8);
  v144 = v4;
  v151 = v47;
  v47((char *)v4, v43);
  v159 = 0;
  v48 = objc_msgSend(v41, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v46, 0, 0, &v159);

  v49 = v159;
  if (!v48)
  {
    v72 = v49;
    _convertNSErrorToError(_:)();

LABEL_23:
    swift_willThrow();
    outlined destroy of CaarHandler?(v3, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    goto LABEL_33;
  }
  v150 = v3;
  v50 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v159 = (id)MEMORY[0x1E0DEE9D8];
  v51 = *(_QWORD *)(v50 + 16);
  v152 = v43;
  v153 = v51;
  v52 = v154;
  if (!v51)
  {
LABEL_19:
    OUTLINED_FUNCTION_14_10((uint64_t)v10, 1);
LABEL_20:
    swift_bridgeObjectRelease();
    outlined destroy of CaarHandler?((uint64_t)v10, &demangling cache variable for type metadata for URL?);
    v63 = (uint64_t)v159;
    if (*((_QWORD *)v159 + 2) <= 1uLL)
    {
      if (one-time initialization token for common != -1)
        goto LABEL_35;
      goto LABEL_25;
    }
    v159 = 0;
    v160 = 0xE000000000000000;
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    v159 = (id)0xD00000000000002CLL;
    v160 = 0x80000001C2E9BEE0;
    v64 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay10Foundation3URLVG_SSs5NeverOTg5166_s7SiriCam13CoreMLHandlerC15findModelFolder11assetOutput10Foundation3URLVAH8modelUrl_AA0bF8MetadataV0lN0t_tKFSSAHcfu_33_43697e1f61f7e10b647d882195ad8775AHSSTf3nnnpk_nTf1cn_n(v63);
    OUTLINED_FUNCTION_35();
    v158 = v64;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    lazy protocol witness table accessor for type [String] and conformance [A]();
    v65 = BidirectionalCollection<>.joined(separator:)();
    v67 = v66;
    OUTLINED_FUNCTION_1_0();
    v68._countAndFlagsBits = v65;
    v68._object = v67;
    String.append(_:)(v68);
    OUTLINED_FUNCTION_5();
    v69 = v159;
    v70 = v160;
    lazy protocol witness table accessor for type CamError and conformance CamError();
    OUTLINED_FUNCTION_2_1();
    *(_QWORD *)v71 = v69;
    *(_QWORD *)(v71 + 8) = v70;
    *(_BYTE *)(v71 + 16) = 2;
    v3 = v150;
    goto LABEL_23;
  }
  v53 = 0;
  while (v53 < *(_QWORD *)(v50 + 16))
  {
    v54 = (*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80);
    v55 = *(_QWORD *)(v52 + 72);
    OUTLINED_FUNCTION_92_1();
    OUTLINED_FUNCTION_14_10((uint64_t)v10, 0);
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v43) == 1)
      goto LABEL_20;
    OUTLINED_FUNCTION_62_3((uint64_t)v157, (uint64_t)v10);
    if (URL.pathExtension.getter() == 0x636C65646F6D6C6DLL && v56 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
LABEL_13:
      OUTLINED_FUNCTION_62_3((uint64_t)v156, (uint64_t)v157);
      v59 = v159;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v59[2] + 1, 1);
        v59 = v159;
      }
      v61 = v59[2];
      v60 = v59[3];
      if (v61 >= v60 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v60 > 1, v61 + 1, 1);
        v59 = v159;
      }
      v59[2] = v61 + 1;
      v62 = (uint64_t)v59 + v54 + v61 * v55;
      v43 = v152;
      OUTLINED_FUNCTION_62_3(v62, (uint64_t)v156);
      v159 = v59;
      goto LABEL_18;
    }
    v58 = _stringCompareWithSmolCheck(_:_:expecting:)();
    OUTLINED_FUNCTION_12();
    if ((v58 & 1) != 0)
      goto LABEL_13;
    v151(v157, v43);
LABEL_18:
    ++v53;
    v52 = v154;
    if (v153 == v53)
      goto LABEL_19;
  }
  __break(1u);
LABEL_35:
  swift_once();
LABEL_25:
  v73 = OUTLINED_FUNCTION_14_1();
  v74 = (char *)__swift_project_value_buffer(v73, (uint64_t)static Logger.common);
  v75 = v149;
  v76 = v140;
  OUTLINED_FUNCTION_92_1();
  v77 = v148;
  OUTLINED_FUNCTION_70_2(v148, v78, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
  v79 = v141;
  outlined init with copy of CamUserParse?((uint64_t)v76, v141, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
  v80 = v146;
  outlined init with take of (modelUrl: URL, modelMetadata: CamModelMetadata)((uint64_t)v76, v146);
  OUTLINED_FUNCTION_20_14();
  v157 = v74;
  v81 = Logger.logObject.getter();
  v82 = static os_log_type_t.info.getter();
  v83 = v82;
  if (os_log_type_enabled(v81, v82))
  {
    v84 = OUTLINED_FUNCTION_4();
    v156 = (char *)OUTLINED_FUNCTION_4();
    v159 = v156;
    *(_DWORD *)v84 = 136315394;
    v135 = v84 + 4;
    v85 = *(int *)(v75 + 48);
    LODWORD(v153) = v83;
    v140 = v81;
    v86 = v144 + v85;
    v87 = v79 + v85;
    v88 = v152;
    OUTLINED_FUNCTION_92_1();
    OUTLINED_FUNCTION_70_2(v87, v89, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
    v90 = (uint64_t)v136;
    OUTLINED_FUNCTION_55_5();
    v91();
    outlined destroy of CamModelMetadata(v86);
    lazy protocol witness table accessor for type RRDataSourceMetadataValue and conformance RRDataSourceMetadataValue(&lazy protocol witness table cache variable for type URL and conformance URL, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v92 = dispatch thunk of CustomStringConvertible.description.getter();
    OUTLINED_FUNCTION_15_11(v90);
    v158 = OUTLINED_FUNCTION_85_2(v92, v93, (uint64_t *)&v159);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    OUTLINED_FUNCTION_1_0();
    outlined destroy of CaarHandler?(v146, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    outlined destroy of CaarHandler?(v79, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    *(_WORD *)(v84 + 12) = 2080;
    v94 = swift_retain();
    v95 = MEMORY[0x1C3BCA9B8](v94, v88);
    OUTLINED_FUNCTION_35();
    v158 = OUTLINED_FUNCTION_82_2(v95, v96, (uint64_t *)&v159);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    OUTLINED_FUNCTION_6_19();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_16_8(&dword_1C2E0C000, v140, (os_log_type_t)v153, "Searching %s found folders %s", (uint8_t *)v84);
    OUTLINED_FUNCTION_14_9();
    OUTLINED_FUNCTION_3();
  }
  OUTLINED_FUNCTION_35_9(v80);
  OUTLINED_FUNCTION_35_9(v79);

  OUTLINED_FUNCTION_6_19();
  OUTLINED_FUNCTION_89_2();
  v97 = v75;
  v98 = v152;
  specialized Collection.first.getter();
  OUTLINED_FUNCTION_35();
  v99 = (uint64_t)v142;
  v100 = (uint64_t)&v142[*(int *)(v97 + 48)];
  v101 = v150;
  v102 = v155;
  ((void (*)(char *))v155)(v142);
  OUTLINED_FUNCTION_13_22(v77, v103, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
  if (__swift_getEnumTagSinglePayload(v80, 1, v98) == 1)
  {
    v104 = *(int *)(v97 + 48);
    v105 = v144;
    v106 = v99;
    v107 = v144 + v104;
    v108 = v80;
    v109 = *(void (**)(uint64_t, uint64_t, uint64_t))(v154 + 32);
    v109(v144, v106, v98);
    outlined init with take of CamModelMetadata(v100, v107);
    v110 = v155;
    v109(v79, v105, v98);
    outlined destroy of CamModelMetadata(v107);
    v111 = v108;
    v102 = v110;
    v77 = v148;
    outlined destroy of CaarHandler?(v111, &demangling cache variable for type metadata for URL?);
  }
  else
  {
    outlined destroy of CaarHandler?(v99, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    OUTLINED_FUNCTION_90_0();
    OUTLINED_FUNCTION_84_1(v79, v112);
  }
  v113 = v145;
  v114 = (uint64_t)v137;
  v115 = v101;
  OUTLINED_FUNCTION_55_5();
  v102();
  OUTLINED_FUNCTION_13_22(v77, v116, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
  v117 = v143;
  OUTLINED_FUNCTION_56_5(v114, v118, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
  v119 = v114;
  v120 = v147;
  outlined init with take of (modelUrl: URL, modelMetadata: CamModelMetadata)(v119, v147);
  ((void (*)(uint64_t, uint64_t, uint64_t))v102)(v113, v79, v98);
  v121 = v102;
  v122 = Logger.logObject.getter();
  v123 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v122, v123))
  {
    v124 = OUTLINED_FUNCTION_4();
    v157 = (char *)OUTLINED_FUNCTION_4();
    v159 = v157;
    *(_DWORD *)v124 = 136315394;
    v156 = (char *)(v124 + 4);
    v125 = *(int *)(v149 + 48);
    v126 = v144;
    v127 = (uint64_t *)(v144 + v125);
    v128 = v117 + v125;
    OUTLINED_FUNCTION_55_5();
    v121();
    OUTLINED_FUNCTION_86_2(v128, v129, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
    v131 = *v127;
    v130 = v127[1];
    OUTLINED_FUNCTION_36_0();
    outlined destroy of CamModelMetadata((uint64_t)v127);
    OUTLINED_FUNCTION_15_11(v126);
    v158 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v131, v130, (uint64_t *)&v159);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    OUTLINED_FUNCTION_13();
    outlined destroy of CaarHandler?(v147, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    outlined destroy of CaarHandler?(v117, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    *(_WORD *)(v124 + 12) = 2080;
    lazy protocol witness table accessor for type RRDataSourceMetadataValue and conformance RRDataSourceMetadataValue(&lazy protocol witness table cache variable for type URL and conformance URL, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v132 = v145;
    v133 = dispatch thunk of CustomStringConvertible.description.getter();
    v158 = OUTLINED_FUNCTION_58_4(v133, v134);
    OUTLINED_FUNCTION_31_8();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_15_11(v132);
    OUTLINED_FUNCTION_16_8(&dword_1C2E0C000, v122, v123, "%s: Resolved model url %s", (uint8_t *)v124);
    OUTLINED_FUNCTION_14_9();
    OUTLINED_FUNCTION_3();
  }

  OUTLINED_FUNCTION_15_11(v113);
  OUTLINED_FUNCTION_7_25(v120);
  OUTLINED_FUNCTION_7_25(v117);
  outlined destroy of CaarHandler?(v115, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
LABEL_33:
  OUTLINED_FUNCTION_4_9();
}

uint64_t CoreMLHandler.logModelFeatures(modelFeatures:)(uint64_t a1)
{
  uint64_t v1;
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  id v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  Swift::String v26;
  Swift::String v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v43;
  unint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65[3];

  v3 = type metadata accessor for UUID();
  v4 = *(_QWORD *)(v3 - 8);
  v61 = v3;
  v62 = v4;
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_9_7();
  v60 = v5;
  v6 = type metadata accessor for URL();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_43_10();
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v50 - v10;
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v50 - v12;
  type metadata accessor for String.Encoding();
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x1E0C80A78](v14);
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  v15 = JSONEncoder.init()();
  v65[0] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : MLFeatureValue]);
  lazy protocol witness table accessor for type [String : MLFeatureValue] and conformance <> [A : B]();
  v16 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  v18 = v17;
  v54 = v7;
  v55 = v1;
  v57 = v13;
  v58 = v15;
  v59 = v6;
  static String.Encoding.utf8.getter();
  v19 = String.init(data:encoding:)();
  if (v20)
  {
    v52 = v20;
    v53 = v16;
    v51 = v19;
    v56 = v18;
    v21 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    v22 = objc_msgSend(v21, sel_temporaryDirectory);

    v23 = v11;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v65[0] = 1601003875;
    v65[1] = 0xE400000000000000;
    v24 = v60;
    UUID.init()();
    lazy protocol witness table accessor for type RRDataSourceMetadataValue and conformance RRDataSourceMetadataValue((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
    v25 = v61;
    v26._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v26);
    OUTLINED_FUNCTION_1_0();
    (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v24, v25);
    v27._countAndFlagsBits = 0x6E6F736A2ELL;
    v27._object = (void *)0xE500000000000000;
    String.append(_:)(v27);
    v28 = v57;
    URL.appendingPathComponent(_:)();
    OUTLINED_FUNCTION_1_0();
    v29 = v54;
    v30 = v59;
    v62 = *(_QWORD *)(v54 + 8);
    ((void (*)(char *, uint64_t))v62)(v23, v59);
    if (one-time initialization token for common != -1)
      swift_once();
    v31 = type metadata accessor for Logger();
    v32 = __swift_project_value_buffer(v31, (uint64_t)static Logger.common);
    (*(void (**)(uint64_t, char *, uint64_t))(v29 + 16))(v55, v28, v30);
    v33 = v63;
    OUTLINED_FUNCTION_37_12();
    v34 = Logger.logObject.getter();
    v35 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = OUTLINED_FUNCTION_4();
      v37 = OUTLINED_FUNCTION_4();
      v61 = v32;
      v65[0] = v37;
      *(_DWORD *)v36 = 136315394;
      v38 = *(_QWORD *)(v63 + 16);
      OUTLINED_FUNCTION_36_0();
      v64 = OUTLINED_FUNCTION_62_0(v38, v39, v65);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      OUTLINED_FUNCTION_13();
      *(_WORD *)(v36 + 12) = 2080;
      lazy protocol witness table accessor for type RRDataSourceMetadataValue and conformance RRDataSourceMetadataValue(&lazy protocol witness table cache variable for type URL and conformance URL, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
      v40 = dispatch thunk of CustomStringConvertible.description.getter();
      v64 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v40, v41, v65);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_39_6();
      OUTLINED_FUNCTION_16_8(&dword_1C2E0C000, v34, v35, "%s: Writing CAM features to file: %s", (uint8_t *)v36);
      OUTLINED_FUNCTION_14_9();
      OUTLINED_FUNCTION_3();
    }
    swift_release();
    OUTLINED_FUNCTION_39_6();

    v43 = v53;
    Data.write(to:options:)();
    OUTLINED_FUNCTION_20_14();
    v44 = v52;
    swift_bridgeObjectRetain();
    v45 = Logger.logObject.getter();
    v46 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = OUTLINED_FUNCTION_4();
      v65[0] = OUTLINED_FUNCTION_4();
      *(_DWORD *)v47 = 136315394;
      v48 = *(_QWORD *)(v33 + 16);
      OUTLINED_FUNCTION_36_0();
      v64 = OUTLINED_FUNCTION_62_0(v48, v49, v65);
      OUTLINED_FUNCTION_12_8();
      OUTLINED_FUNCTION_29_8();
      OUTLINED_FUNCTION_13();
      *(_WORD *)(v47 + 12) = 2080;
      swift_bridgeObjectRetain();
      v64 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v51, v44, v65);
      OUTLINED_FUNCTION_12_8();
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_16_8(&dword_1C2E0C000, v45, v46, "%s: Making predictions from features : %s", (uint8_t *)v47);
      OUTLINED_FUNCTION_14_9();
      OUTLINED_FUNCTION_3();
    }
    OUTLINED_FUNCTION_33_11();
    OUTLINED_FUNCTION_40_9(v43);
    OUTLINED_FUNCTION_29_8();
    swift_bridgeObjectRelease_n();

    return ((uint64_t (*)(char *, uint64_t))v62)(v28, v30);
  }
  else
  {
    OUTLINED_FUNCTION_33_11();
    return outlined consume of Data._Representation(v16, v18);
  }
}

uint64_t CoreMLHandler.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  outlined destroy of CamModelMetadata(v0 + OBJC_IVAR____TtC7SiriCam13CoreMLHandler_modelMetadata);
  return v0;
}

uint64_t CoreMLHandler.__deallocating_deinit()
{
  CoreMLHandler.deinit();
  return swift_deallocClassInstance();
}

uint64_t ObjC metadata update function for CoreMLHandler()
{
  return type metadata accessor for CoreMLHandler();
}

uint64_t type metadata accessor for CoreMLHandler()
{
  uint64_t result;

  result = type metadata singleton initialization cache for CoreMLHandler;
  if (!type metadata singleton initialization cache for CoreMLHandler)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata completion function for CoreMLHandler()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for CamModelMetadata();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void protocol witness for ModelHandler.update() in conformance CoreMLHandler()
{
  CoreMLHandler.update()();
}

void protocol witness for ModelHandler.getMetadata() in conformance CoreMLHandler(uint64_t a1@<X8>)
{
  CoreMLHandler.getMetadata()(a1);
}

MLDictionaryFeatureProvider protocol witness for ModelHandler.predict(from:) in conformance CoreMLHandler(Swift::OpaquePointer a1)
{
  return CoreMLHandler.predict(from:)(a1);
}

unint64_t lazy protocol witness table accessor for type MLFeatureValue and conformance MLFeatureValue()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type MLFeatureValue and conformance MLFeatureValue;
  if (!lazy protocol witness table cache variable for type MLFeatureValue and conformance MLFeatureValue)
  {
    v1 = type metadata accessor for MLMultiArray(255, (unint64_t *)&lazy cache variable for type metadata for MLFeatureValue);
    result = MEMORY[0x1C3BCB3E4](&protocol conformance descriptor for MLFeatureValue, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MLFeatureValue and conformance MLFeatureValue);
  }
  return result;
}

id @nonobjc MLDictionaryFeatureProvider.init(dictionary:)()
{
  void *v0;
  Class isa;
  id v2;
  id v3;
  id v4;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x1E0C80C00];
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  OUTLINED_FUNCTION_1_0();
  v6[0] = 0;
  v2 = objc_msgSend(v0, sel_initWithDictionary_error_, isa, v6);

  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v2;
}

uint64_t outlined init with take of (modelUrl: URL, modelMetadata: CamModelMetadata)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined assign with take of CamModelMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CamModelMetadata();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t outlined assign with take of (modelUrl: URL, modelMetadata: CamModelMetadata)?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata)?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t outlined copy of CamModelVersion?(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  if (a4 != 1)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t specialized Dictionary.startIndex.getter(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  uint64_t i;

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
  v2 = 64;
  for (i = 10; i - 8 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    v1 = *(_QWORD *)(a1 + 8 * i);
    v2 += 64;
    if (v1)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

_QWORD *specialized Dictionary.subscript.getter(_QWORD *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void *v6;
  id v7;

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
    v6 = *(void **)(*(_QWORD *)(a5 + 56) + 8 * a2);
    *result = v6;
    swift_bridgeObjectRetain();
    v7 = v6;
    return (_QWORD *)v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

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

void _s7SiriCam0B13ModelMetadataVWOcTm_0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = a3(0);
  OUTLINED_FUNCTION_34_6(v3);
  OUTLINED_FUNCTION_1_5();
}

void OUTLINED_FUNCTION_7_25(uint64_t a1)
{
  uint64_t *v1;

  outlined destroy of CaarHandler?(a1, v1);
}

void OUTLINED_FUNCTION_10_20(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  void *v15;
  uint64_t v16;
  Swift::String v17;

  v17._countAndFlagsBits = v16;
  v17._object = v15;
  String.append(_:)(v17);
}

void OUTLINED_FUNCTION_13_22(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  _s7SiriCam0B13ModelMetadataVWOcTm_0(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_15_11(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 - 184))(a1, v1);
}

void OUTLINED_FUNCTION_18_16(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v2;

  v2 = (a2 - 32) | 0x8000000000000000;
  String.append(_:)(*(Swift::String *)&a1);
}

uint64_t OUTLINED_FUNCTION_33_11()
{
  return swift_release();
}

void OUTLINED_FUNCTION_35_9(uint64_t a1)
{
  uint64_t *v1;

  outlined destroy of CaarHandler?(a1, v1);
}

uint64_t OUTLINED_FUNCTION_37_12()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_39_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 - 128))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_40_9(uint64_t a1)
{
  uint64_t v1;

  return outlined consume of Data._Representation(a1, *(_QWORD *)(v1 - 176));
}

uint64_t OUTLINED_FUNCTION_42_7(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_45_8()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_46_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{

}

char *OUTLINED_FUNCTION_48_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  return &a10;
}

uint64_t OUTLINED_FUNCTION_50_6()
{
  return type metadata accessor for URL();
}

void OUTLINED_FUNCTION_51_4()
{
  void *v0;

}

void OUTLINED_FUNCTION_52_1(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  outlined destroy of CaarHandler?(*(_QWORD *)(v2 - 128), a2);
}

uint64_t OUTLINED_FUNCTION_54_1(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 72) = result;
  return result;
}

void OUTLINED_FUNCTION_56_5(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  outlined init with copy of CamUserParse?(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_58_4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, (uint64_t *)(v2 - 112));
}

uint64_t OUTLINED_FUNCTION_59_1()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v0, v1, (uint64_t *)(v2 - 112));
}

uint64_t OUTLINED_FUNCTION_62_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_65_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 - 144))(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_66_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 - 144))(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_67_2(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, (uint64_t *)(v2 - 72));
}

void OUTLINED_FUNCTION_68_2(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  outlined destroy of CaarHandler?(*(_QWORD *)(v2 - 320), a2);
}

uint64_t OUTLINED_FUNCTION_69_3()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

void OUTLINED_FUNCTION_70_2(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  _s7SiriCam0B13ModelMetadataVWOcTm_0(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_74_2()
{
  return Logger.logObject.getter();
}

id OUTLINED_FUNCTION_79_2()
{
  uint64_t v0;
  void *v1;

  return objc_msgSend(v1, (SEL)(v0 + 712));
}

uint64_t OUTLINED_FUNCTION_80_1(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 120) = a1;
  return v1 - 120;
}

uint64_t OUTLINED_FUNCTION_82_2(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_84_1@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_85_2(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, v3, a3);
}

void OUTLINED_FUNCTION_86_2(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  _s7SiriCam0B13ModelMetadataVWOcTm_0(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_91_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_92_1()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 - 152))();
}

uint64_t OUTLINED_FUNCTION_93_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_94_0(uint64_t a1)
{
  uint64_t v1;

  return outlined init with take of CamModelMetadata(a1, v1);
}

uint64_t OUTLINED_FUNCTION_99_0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

id OUTLINED_FUNCTION_100()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_101_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v1, v2);
}

uint64_t OUTLINED_FUNCTION_103_0()
{
  uint64_t v0;

  return outlined destroy of CamModelMetadata(v0);
}

uint64_t ActionCandidate.flowHandlerId.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ActionCandidate.parse.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_17_2() + 20);
  return outlined init with copy of CamParse(v3, a1);
}

uint64_t type metadata accessor for ActionCandidate()
{
  uint64_t result;

  result = type metadata singleton initialization cache for ActionCandidate;
  if (!type metadata singleton initialization cache for ActionCandidate)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ActionCandidate.affinityScore.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(OUTLINED_FUNCTION_17_2() + 24));
}

uint64_t ActionCandidate.userData.getter()
{
  OUTLINED_FUNCTION_17_2();
  return swift_bridgeObjectRetain();
}

uint64_t ActionCandidate.loggingId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_17_2() + 32);
  v4 = OUTLINED_FUNCTION_1_12();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t ActionCandidate.inferredBundleId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(OUTLINED_FUNCTION_17_2() + 36));
  swift_bridgeObjectRetain();
  return v1;
}

void ActionCandidate.inferredBundleId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + *(int *)(OUTLINED_FUNCTION_17_2() + 36));
  swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  OUTLINED_FUNCTION_31();
}

uint64_t (*ActionCandidate.inferredBundleId.modify())(_QWORD)
{
  OUTLINED_FUNCTION_17_2();
  return destructiveProjectEnumData for FeatureDictionaryError;
}

uint64_t ActionCandidate.init(flowHandlerId:parse:affinityScore:loggingId:userData:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  int *v14;
  _QWORD *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;

  v14 = (int *)OUTLINED_FUNCTION_17_2();
  v15 = (_QWORD *)((char *)a7 + v14[9]);
  *a7 = a1;
  a7[1] = a2;
  outlined init with copy of CamParse(a3, (uint64_t)a7 + v14[5]);
  *(_QWORD *)((char *)a7 + v14[6]) = a4;
  *(_QWORD *)((char *)a7 + v14[7]) = a6;
  v16 = (char *)a7 + v14[8];
  v17 = OUTLINED_FUNCTION_1_12();
  v18 = *(_QWORD *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v16, a5, v17);
  *v15 = 0;
  v15[1] = 0;
  specialized ActionProtocol.inferBundleId()();
  v20 = v19;
  v22 = v21;
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a5, v17);
  outlined destroy of CamParse(a3);
  result = swift_bridgeObjectRelease();
  *v15 = v20;
  v15[1] = v22;
  return result;
}

uint64_t ActionCandidate.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  Swift::String v3;
  Swift::String v4;
  Swift::String v5;
  Swift::String v6;
  Swift::String v7;
  Swift::String v8;
  Swift::String v10;
  Swift::String v11;
  Swift::String v12;
  Swift::String v13;

  _StringGuts.grow(_:)(93);
  v10._countAndFlagsBits = 0xD00000000000001FLL;
  v10._object = (void *)0x80000001C2E9BFE0;
  OUTLINED_FUNCTION_0_6(v10);
  v1 = *v0;
  v2 = (void *)v0[1];
  swift_bridgeObjectRetain();
  v3._countAndFlagsBits = v1;
  v3._object = v2;
  String.append(_:)(v3);
  OUTLINED_FUNCTION_1_0();
  v4._countAndFlagsBits = 0x3A6573726170202CLL;
  v4._object = (void *)0xE900000000000020;
  String.append(_:)(v4);
  OUTLINED_FUNCTION_17_2();
  OUTLINED_FUNCTION_20_6();
  _print_unlocked<A, B>(_:_:)();
  v5._object = (void *)0x80000001C2E9C000;
  v5._countAndFlagsBits = 0xD000000000000011;
  String.append(_:)(v5);
  v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  OUTLINED_FUNCTION_0_6(v11);
  OUTLINED_FUNCTION_1_0();
  v6._countAndFlagsBits = 0x614472657375202CLL;
  v6._object = (void *)0xEC000000203A6174;
  String.append(_:)(v6);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]?);
  v12._countAndFlagsBits = String.init<A>(describing:)();
  OUTLINED_FUNCTION_0_6(v12);
  OUTLINED_FUNCTION_1_0();
  v7._countAndFlagsBits = 0x6E6967676F6C202CLL;
  v7._object = (void *)0xED0000203A644967;
  String.append(_:)(v7);
  OUTLINED_FUNCTION_1_12();
  lazy protocol witness table accessor for type UUID and conformance UUID();
  v13._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  OUTLINED_FUNCTION_0_6(v13);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 41;
  v8._object = (void *)0xE100000000000000;
  String.append(_:)(v8);
  return 0;
}

_QWORD *initializeBufferWithCopyOfBuffer for ActionCandidate(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  void **v9;
  void **v10;
  uint64_t v11;
  int EnumCaseMultiPayload;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) == 0)
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a3[5];
    v9 = (void **)((char *)a1 + v8);
    v10 = (void **)((char *)a2 + v8);
    v11 = type metadata accessor for CamParse(0);
    swift_bridgeObjectRetain();
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v21 = *v10;
      *v9 = *v10;
      v22 = v21;
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
LABEL_12:
        v30 = a3[7];
        *(_QWORD *)((char *)v4 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
        *(_QWORD *)((char *)v4 + v30) = *(_QWORD *)((char *)a2 + v30);
        v31 = a3[8];
        v32 = (char *)v4 + v31;
        v33 = (char *)a2 + v31;
        v34 = type metadata accessor for UUID();
        v35 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 16);
        swift_bridgeObjectRetain();
        v35(v32, v33, v34);
        v36 = a3[9];
        v37 = (_QWORD *)((char *)v4 + v36);
        v38 = (_QWORD *)((char *)a2 + v36);
        v39 = v38[1];
        *v37 = *v38;
        v37[1] = v39;
        swift_bridgeObjectRetain();
        return v4;
      }
      v13 = type metadata accessor for Siri_Nlu_External_UserParse();
      (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v9, v10, v13);
      v14 = (int *)type metadata accessor for CamUSOParse(0);
      v15 = v14[5];
      v16 = (char *)v9 + v15;
      v17 = (char *)v10 + v15;
      v18 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
      if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v18))
      {
        v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
        memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
        __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v18);
      }
      v23 = v14[6];
      v24 = (void **)((char *)v9 + v23);
      v25 = (void **)((char *)v10 + v23);
      v26 = v25[1];
      *v24 = *v25;
      v24[1] = v26;
      v27 = v14[7];
      v28 = (char *)v9 + v27;
      v29 = (char *)v10 + v27;
      v28[4] = v29[4];
      *(_DWORD *)v28 = *(_DWORD *)v29;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
    goto LABEL_12;
  }
  v20 = *a2;
  *v4 = *a2;
  v4 = (_QWORD *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
  swift_retain();
  return v4;
}

uint64_t destroy for ActionCandidate(uint64_t a1, uint64_t a2)
{
  id *v4;
  int EnumCaseMultiPayload;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  swift_bridgeObjectRelease();
  v4 = (id *)(a1 + *(int *)(a2 + 20));
  type metadata accessor for CamParse(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {

  }
  else if (!EnumCaseMultiPayload)
  {
    v6 = type metadata accessor for Siri_Nlu_External_UserParse();
    (*(void (**)(id *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
    v7 = (uint64_t)v4 + *(int *)(type metadata accessor for CamUSOParse(0) + 20);
    v8 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
    if (!__swift_getEnumTagSinglePayload(v7, 1, v8))
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  v9 = a1 + *(int *)(a2 + 32);
  v10 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for ActionCandidate(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void **v8;
  void **v9;
  uint64_t v10;
  int EnumCaseMultiPayload;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[5];
  v8 = (void **)((char *)a1 + v7);
  v9 = (void **)((char *)a2 + v7);
  v10 = type metadata accessor for CamParse(0);
  swift_bridgeObjectRetain();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v19 = *v9;
    *v8 = *v9;
    v20 = v19;
LABEL_9:
    swift_storeEnumTagMultiPayload();
    goto LABEL_10;
  }
  if (!EnumCaseMultiPayload)
  {
    v12 = type metadata accessor for Siri_Nlu_External_UserParse();
    (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v8, v9, v12);
    v13 = (int *)type metadata accessor for CamUSOParse(0);
    v14 = v13[5];
    v15 = (char *)v8 + v14;
    v16 = (char *)v9 + v14;
    v17 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
    if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
      __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v17);
    }
    v21 = v13[6];
    v22 = (void **)((char *)v8 + v21);
    v23 = (void **)((char *)v9 + v21);
    v24 = v23[1];
    *v22 = *v23;
    v22[1] = v24;
    v25 = v13[7];
    v26 = (char *)v8 + v25;
    v27 = (char *)v9 + v25;
    v26[4] = v27[4];
    *(_DWORD *)v26 = *(_DWORD *)v27;
    swift_bridgeObjectRetain();
    goto LABEL_9;
  }
  memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
LABEL_10:
  v28 = a3[7];
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  *(_QWORD *)((char *)a1 + v28) = *(_QWORD *)((char *)a2 + v28);
  v29 = a3[8];
  v30 = (char *)a1 + v29;
  v31 = (char *)a2 + v29;
  v32 = type metadata accessor for UUID();
  v33 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 16);
  swift_bridgeObjectRetain();
  v33(v30, v31, v32);
  v34 = a3[9];
  v35 = (_QWORD *)((char *)a1 + v34);
  v36 = (_QWORD *)((char *)a2 + v34);
  v37 = v36[1];
  *v35 = *v36;
  v35[1] = v37;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ActionCandidate(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  void **v7;
  void **v8;
  uint64_t v9;
  int EnumCaseMultiPayload;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  int v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    v6 = a3[5];
    v7 = (void **)((char *)a1 + v6);
    v8 = (void **)((char *)a2 + v6);
    outlined destroy of CamParse((uint64_t)a1 + v6);
    v9 = type metadata accessor for CamParse(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v18 = *v8;
      *v7 = *v8;
      v19 = v18;
LABEL_10:
      swift_storeEnumTagMultiPayload();
      goto LABEL_11;
    }
    if (!EnumCaseMultiPayload)
    {
      v11 = type metadata accessor for Siri_Nlu_External_UserParse();
      (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v7, v8, v11);
      v12 = (int *)type metadata accessor for CamUSOParse(0);
      v13 = v12[5];
      v14 = (char *)v7 + v13;
      v15 = (char *)v8 + v13;
      v16 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
      if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
      {
        v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
        memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
        __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
      }
      v20 = v12[6];
      v21 = (void **)((char *)v7 + v20);
      v22 = (void **)((char *)v8 + v20);
      *v21 = *v22;
      v21[1] = v22[1];
      v23 = v12[7];
      v24 = (char *)v7 + v23;
      v25 = (char *)v8 + v23;
      v26 = *(_DWORD *)v25;
      v24[4] = v25[4];
      *(_DWORD *)v24 = v26;
      swift_bridgeObjectRetain();
      goto LABEL_10;
    }
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
LABEL_11:
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v27 = a3[8];
  v28 = (char *)a1 + v27;
  v29 = (char *)a2 + v27;
  v30 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v30 - 8) + 24))(v28, v29, v30);
  v31 = a3[9];
  v32 = (_QWORD *)((char *)a1 + v31);
  v33 = (_QWORD *)((char *)a2 + v31);
  *v32 = *v33;
  v32[1] = v33[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for ActionCandidate(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for CamParse(0);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    v10 = type metadata accessor for Siri_Nlu_External_UserParse();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    v11 = (int *)type metadata accessor for CamUSOParse(0);
    v12 = v11[5];
    v13 = &v7[v12];
    v14 = &v8[v12];
    v15 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
    if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15))
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
      memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
      __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
    }
    *(_OWORD *)&v7[v11[6]] = *(_OWORD *)&v8[v11[6]];
    v17 = v11[7];
    v18 = &v7[v17];
    v19 = &v8[v17];
    v18[4] = v19[4];
    *(_DWORD *)v18 = *(_DWORD *)v19;
    swift_storeEnumTagMultiPayload();
  }
  v20 = a3[7];
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  *(_QWORD *)((char *)a1 + v20) = *(_QWORD *)((char *)a2 + v20);
  v21 = a3[8];
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v22, v23, v24);
  *(_OWORD *)((char *)a1 + a3[9]) = *(_OWORD *)((char *)a2 + a3[9]);
  return a1;
}

_QWORD *assignWithTake for ActionCandidate(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
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
  _QWORD *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    v7 = a3[5];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    outlined destroy of CamParse((uint64_t)a1 + v7);
    v10 = type metadata accessor for CamParse(0);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      v11 = type metadata accessor for Siri_Nlu_External_UserParse();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
      v12 = (int *)type metadata accessor for CamUSOParse(0);
      v13 = v12[5];
      v14 = &v8[v13];
      v15 = &v9[v13];
      v16 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
      if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
      {
        v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
        memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
        __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
      }
      *(_OWORD *)&v8[v12[6]] = *(_OWORD *)&v9[v12[6]];
      v18 = v12[7];
      v19 = &v8[v18];
      v20 = &v9[v18];
      v19[4] = v20[4];
      *(_DWORD *)v19 = *(_DWORD *)v20;
      swift_storeEnumTagMultiPayload();
    }
  }
  v21 = a3[7];
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  *(_QWORD *)((char *)a1 + v21) = *(_QWORD *)((char *)a2 + v21);
  swift_bridgeObjectRelease();
  v22 = a3[8];
  v23 = (char *)a1 + v22;
  v24 = (char *)a2 + v22;
  v25 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 40))(v23, v24, v25);
  v26 = a3[9];
  v27 = (_QWORD *)((char *)a1 + v26);
  v28 = (_QWORD *)((char *)a2 + v26);
  v30 = *v28;
  v29 = v28[1];
  *v27 = v30;
  v27[1] = v29;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ActionCandidate()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1C2E8E070(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = OUTLINED_FUNCTION_20_6();
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == (_DWORD)a2)
    {
      v9 = v8;
      v10 = *(int *)(a3 + 20);
    }
    else
    {
      v9 = OUTLINED_FUNCTION_1_12();
      v10 = *(int *)(a3 + 32);
    }
    return __swift_getEnumTagSinglePayload(a1 + v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for ActionCandidate()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1C2E8E10C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(a1 + 8) = (a2 - 1);
    OUTLINED_FUNCTION_31();
  }
  else
  {
    v8 = OUTLINED_FUNCTION_20_6();
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
    {
      v9 = v8;
      v10 = *(int *)(a4 + 20);
    }
    else
    {
      v9 = OUTLINED_FUNCTION_1_12();
      v10 = *(int *)(a4 + 32);
    }
    __swift_storeEnumTagSinglePayload(a1 + v10, a2, a2, v9);
  }
}

uint64_t type metadata completion function for ActionCandidate()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for CamParse(319);
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for UUID();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t FeatureExtracting.extract(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  Swift::String v12;
  uint64_t v13;
  Swift::String v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v21[2];
  uint64_t v22;

  v6 = (*(uint64_t (**)(void))(a3 + 32))();
  if (!v3)
  {
    v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
    v8 = specialized Set.init<A>(_:)(v7);
    swift_getAssociatedTypeWitness();
    OUTLINED_FUNCTION_0_35();
    v21[0] = swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_0_35();
    v9 = type metadata accessor for Dictionary.Keys();
    MEMORY[0x1C3BCB3E4](MEMORY[0x1E0DE9ED0], v9);
    OUTLINED_FUNCTION_0_35();
    v10 = Set.init<A>(_:)();
    v11 = specialized Set.subtracting(_:)(v10, v8);
    swift_bridgeObjectRelease();
    if ((Set.isEmpty.getter() & 1) != 0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      v21[1] = 0xE000000000000000;
      _StringGuts.grow(_:)(53);
      v12._countAndFlagsBits = 0x7365727574616546;
      v12._object = (void *)0xE900000000000020;
      String.append(_:)(v12);
      v22 = v11;
      v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Set<String>);
      MEMORY[0x1C3BCB3E4](MEMORY[0x1E0DEB3E8], v13);
      DefaultStringInterpolation.appendInterpolation<A>(_:)();
      swift_bridgeObjectRelease();
      v14._object = (void *)0x80000001C2E9A200;
      v14._countAndFlagsBits = 0xD00000000000002ALL;
      String.append(_:)(v14);
      if (one-time initialization token for common != -1)
        swift_once();
      v15 = type metadata accessor for Logger();
      __swift_project_value_buffer(v15, (uint64_t)static Logger.common);
      swift_bridgeObjectRetain_n();
      v16 = Logger.logObject.getter();
      v17 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = (uint8_t *)swift_slowAlloc();
        v21[0] = swift_slowAlloc();
        *(_DWORD *)v18 = 136315138;
        swift_bridgeObjectRetain();
        v22 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0, 0xE000000000000000, v21);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1C2E0C000, v16, v17, "%s", v18, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_3();
      }

      swift_bridgeObjectRelease_n();
      lazy protocol witness table accessor for type CamError and conformance CamError();
      swift_allocError();
      *(_QWORD *)v19 = 0;
      *(_QWORD *)(v19 + 8) = 0xE000000000000000;
      *(_BYTE *)(v19 + 16) = 1;
      swift_willThrow();
    }
  }
  return v6;
}

id static CaarResponseLogger.wrapIntoLogEvent(message:)(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D99388]), sel_init);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D99360]), sel_init);
  if (v4)
  {
    objc_msgSend(v3, sel_setEnded_, a1);
    objc_msgSend(v4, sel_setCaarRequestContext_, v3);
  }

  return v4;
}

void *static AppShortcutFeatureExtractor.extractedFeatures.getter()
{
  return &outlined read-only object #0 of static AppShortcutFeatureExtractor.extractedFeatures.getter;
}

uint64_t AppShortcutFeatureExtractor.extractImpl(from:)(uint64_t a1)
{
  BOOL v1;
  uint64_t inited;

  v1 = AppShortcutFeatureExtractor.extractIsAppShortcut(from:)(a1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, MLFeatureValue)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C2E94230;
  *(_QWORD *)(inited + 32) = 0x535F5050415F5349;
  *(_QWORD *)(inited + 40) = 0xEF54554354524F48;
  *(_QWORD *)(inited + 48) = objc_msgSend((id)objc_opt_self(), sel_featureValueWithInt64_, v1);
  type metadata accessor for MLFeatureValue();
  return Dictionary.init(dictionaryLiteral:)();
}

BOOL AppShortcutFeatureExtractor.extractIsAppShortcut(from:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v2 = type metadata accessor for CamParse(0);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for CamUSOParse(0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for ActionCandidate();
  outlined init with copy of CamParse(a1 + *(int *)(v8 + 20), (uint64_t)v4);
  if (swift_getEnumCaseMultiPayload())
  {
    outlined destroy of CamModelMetadata((uint64_t)v4, type metadata accessor for CamParse);
    return 0;
  }
  else
  {
    outlined init with take of CamUSOParse((uint64_t)v4, (uint64_t)v7);
    v10 = CamUSOParse.appShortcutInvocation.getter();
    v9 = v11 != 0;
    if (v11)
      outlined consume of AppShortcutInvocation?(v10, v11);
    outlined destroy of CamModelMetadata((uint64_t)v7, type metadata accessor for CamUSOParse);
  }
  return v9;
}

uint64_t protocol witness for FeatureExtracting.extractImpl(from:) in conformance AppShortcutFeatureExtractor(uint64_t a1)
{
  return AppShortcutFeatureExtractor.extractImpl(from:)(a1);
}

ValueMetadata *type metadata accessor for AppShortcutFeatureExtractor()
{
  return &type metadata for AppShortcutFeatureExtractor;
}

void specialized static FeatureStoreLoggingProtocol.write(streamId:object:requestId:rcId:)()
{
  specialized static FeatureStoreLoggingProtocol.write(streamId:object:requestId:rcId:)();
}

{
  uint64_t v0;
  uint64_t v1;

  type metadata accessor for String.Encoding();
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_15_12();
  v1 = type metadata accessor for JSONEncoder.NonConformingFloatEncodingStrategy();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_4_28();
}

void sub_1C2E8E8DC(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  int v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  Swift::String v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;

  v9 = MGGetBoolAnswer();

  if (v9)
  {
    type metadata accessor for JSONEncoder();
    OUTLINED_FUNCTION_37_7();
    JSONEncoder.init()();
    *v5 = 6712937;
    v5[1] = 0xE300000000000000;
    v5[2] = 1718511917;
    v5[3] = 0xE400000000000000;
    v5[4] = 7233902;
    v5[5] = 0xE300000000000000;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v2 + 104))(v5, *MEMORY[0x1E0CAE180], v4);
    dispatch thunk of JSONEncoder.nonConformingFloatEncodingStrategy.setter();
    __swift_project_boxed_opaque_existential_1(v3, v3[3]);
    v10 = dispatch thunk of JSONEncoder.encode<A>(_:)();
    if (v1)
    {
LABEL_19:
      swift_release();
      return;
    }
    v12 = v10;
    v13 = v11;
    static String.Encoding.utf8.getter();
    v14 = String.init(data:encoding:)();
    if (v15)
    {
      v16 = v15;
      *(_QWORD *)(v7 - 152) = v14;
      if (one-time initialization token for common != -1)
        swift_once();
      v17 = OUTLINED_FUNCTION_14_1();
      v18 = __swift_project_value_buffer(v17, (uint64_t)static Logger.common);
      OUTLINED_FUNCTION_21_7();
      OUTLINED_FUNCTION_21_7();
      Logger.logObject.getter();
      v19 = OUTLINED_FUNCTION_47();
      v20 = v19;
      v21 = os_log_type_enabled(v18, v19);
      v22 = *(_QWORD *)(v7 - 104);
      if (v21)
      {
        v23 = OUTLINED_FUNCTION_4();
        *(_QWORD *)(v7 - 160) = v13;
        v24 = v23;
        v25 = OUTLINED_FUNCTION_4();
        *(_QWORD *)(v7 - 168) = v25;
        *(_QWORD *)(v7 - 96) = v25;
        *(_DWORD *)v24 = 136315394;
        *(_DWORD *)(v7 - 172) = v20;
        v26 = swift_bridgeObjectRetain();
        *(_QWORD *)(v7 - 72) = OUTLINED_FUNCTION_39_7(v26, v27, (uint64_t *)(v7 - 96));
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        OUTLINED_FUNCTION_41_3();
        *(_WORD *)(v24 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v7 - 72) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(*(_QWORD *)(v7 - 152), v16, (uint64_t *)(v7 - 96));
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        OUTLINED_FUNCTION_41_3();
        _os_log_impl(&dword_1C2E0C000, v18, (os_log_type_t)*(_DWORD *)(v7 - 172), "Writing object to Feature Store for %s: %s", (uint8_t *)v24, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_3();
      }

      OUTLINED_FUNCTION_1_10();
      OUTLINED_FUNCTION_1_10();
      *(_QWORD *)(v7 - 96) = v22;
      *(_QWORD *)(v7 - 88) = v6;
      swift_bridgeObjectRetain();
      v34._countAndFlagsBits = 58;
      v34._object = (void *)0xE100000000000000;
      String.append(_:)(v34);
      String.append(_:)(*(Swift::String *)(v7 - 120));
      v35 = *(_QWORD *)(v7 - 96);
      v36 = *(_QWORD *)(v7 - 88);
      v37 = objc_allocWithZone(MEMORY[0x1E0D20F68]);
      v38 = @nonobjc FSFCurareInteractionAsJsonStr.init(jsonStr:interactionId:dataVersion:)(*(_QWORD *)(v7 - 152), v16, v35, v36, 1);
      if (v38)
      {
        v39 = v38;
        specialized static FeatureStoreLoggingProtocol.write(streamId:interaction:)(*(_QWORD *)(v7 - 144), *(_QWORD *)(v7 - 136), (uint64_t)v38);

LABEL_18:
        outlined consume of Data._Representation(v12, v13);
        goto LABEL_19;
      }
      lazy protocol witness table accessor for type CamError and conformance CamError();
      OUTLINED_FUNCTION_2_1();
      *(_QWORD *)v32 = 0xD00000000000001ELL;
      v33 = "InteractionInitializationError";
    }
    else
    {
      lazy protocol witness table accessor for type CamError and conformance CamError();
      OUTLINED_FUNCTION_2_1();
      *(_QWORD *)v32 = 0xD00000000000001DLL;
      v33 = "JSONStringInitializationError";
    }
    *(_QWORD *)(v32 + 8) = (unint64_t)(v33 - 32) | 0x8000000000000000;
    *(_BYTE *)(v32 + 16) = 4;
    swift_willThrow();
    goto LABEL_18;
  }
  if (one-time initialization token for common != -1)
    swift_once();
  v28 = OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_8_1(v28, (uint64_t)static Logger.common);
  v29 = OUTLINED_FUNCTION_47();
  if (OUTLINED_FUNCTION_7_7(v29))
  {
    *(_WORD *)OUTLINED_FUNCTION_4() = 0;
    OUTLINED_FUNCTION_11_15(&dword_1C2E0C000, v30, v31, "Skipping FS logging on prod build.");
    OUTLINED_FUNCTION_3();
  }

}

void specialized static FeatureStoreLoggingProtocol.write(streamId:interaction:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  _DWORD *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  id v25[2];

  v25[1] = *(id *)MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)objc_opt_self(), sel_isSupportedUser))
  {
    if (one-time initialization token for common != -1)
      swift_once();
    v12 = OUTLINED_FUNCTION_14_1();
    v7 = (id)OUTLINED_FUNCTION_8_1(v12, (uint64_t)static Logger.common);
    v13 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_7_7(v13))
    {
      *(_WORD *)OUTLINED_FUNCTION_4() = 0;
      OUTLINED_FUNCTION_11_15(&dword_1C2E0C000, v14, v15, "Cannot write to Feature Store because the user is not supported.");
      OUTLINED_FUNCTION_3();
    }
    goto LABEL_12;
  }
  v4 = (void *)objc_opt_self();
  v5 = OUTLINED_FUNCTION_47_7();
  v6 = (void *)MEMORY[0x1C3BCA844](v5);
  v7 = objc_msgSend(v4, sel_getWithStreamId_, v6);

  if (v7)
  {
LABEL_5:
    v25[0] = 0;
    if ((objc_msgSend(v7, sel_insert_error_, a3, v25) & 1) != 0)
    {
      v11 = v25[0];
    }
    else
    {
      v16 = v25[0];
      _convertNSErrorToError(_:)();

      swift_willThrow();
    }
LABEL_12:

    return;
  }
  v8 = OUTLINED_FUNCTION_47_7();
  v10 = specialized static FeatureStoreLoggingProtocol.createStream(streamId:)(v8, v9);
  if (v10)
  {
    v7 = v10;
    goto LABEL_5;
  }
  if (one-time initialization token for common != -1)
    swift_once();
  v17 = OUTLINED_FUNCTION_14_1();
  __swift_project_value_buffer(v17, (uint64_t)static Logger.common);
  OUTLINED_FUNCTION_21_7();
  v18 = Logger.logObject.getter();
  v19 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (_DWORD *)OUTLINED_FUNCTION_4();
    v25[0] = (id)OUTLINED_FUNCTION_4();
    *v20 = 136315138;
    swift_bridgeObjectRetain();
    v21 = OUTLINED_FUNCTION_47_7();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    OUTLINED_FUNCTION_41_3();
    OUTLINED_FUNCTION_26_12(&dword_1C2E0C000, v18, v24, "Failed to write to Feature Store because the stream %s cannot be found or created");
    OUTLINED_FUNCTION_13_2();
    OUTLINED_FUNCTION_3();
  }

  OUTLINED_FUNCTION_1_10();
}

id specialized static FeatureStoreLoggingProtocol.createStream(streamId:)(uint64_t a1, unint64_t a2)
{
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v11;

  v4 = objc_allocWithZone(MEMORY[0x1E0D20F70]);
  swift_bridgeObjectRetain();
  v5 = @nonobjc FSFCurareInteractionStream.init(streamId:)(a1, a2);
  if (v5)
  {
    if (one-time initialization token for common != -1)
      swift_once();
    v6 = type metadata accessor for Logger();
    __swift_project_value_buffer(v6, (uint64_t)static Logger.common);
    swift_bridgeObjectRetain_n();
    v7 = Logger.logObject.getter();
    v8 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)OUTLINED_FUNCTION_4();
      v11 = OUTLINED_FUNCTION_4();
      *(_DWORD *)v9 = 136315138;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &v11);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C2E0C000, v7, v8, "Successfully created Feature Store stream: %s", v9, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
    }

    swift_bridgeObjectRelease_n();
  }
  return v5;
}

void specialized implicit closure #2 in implicit closure #1 in AnyEncodable.init<A>(_:)(_QWORD *a1)
{
  CamModelMetadata.encode(to:)(a1);
}

{
  CamLogOutput.encode(to:)(a1);
}

uint64_t specialized implicit closure #2 in implicit closure #1 in AnyEncodable.init<A>(_:)()
{
  type metadata accessor for MLMultiArray(0, (unint64_t *)&lazy cache variable for type metadata for MLMultiArray);
  lazy protocol witness table accessor for type MLFeatureValue and conformance MLFeatureValue(&lazy protocol witness table cache variable for type MLMultiArray and conformance MLMultiArray, (unint64_t *)&lazy cache variable for type metadata for MLMultiArray);
  return Dictionary<>.encode(to:)();
}

{
  return specialized implicit closure #2 in implicit closure #1 in AnyEncodable.init<A>(_:)();
}

uint64_t specialized ReflectedStringConvertible.description.getter()
{
  return specialized ReflectedStringConvertible.description.getter((uint64_t (*)(_QWORD))type metadata accessor for CamOutput);
}

uint64_t specialized ReflectedStringConvertible.description.getter(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  Swift::String v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mirror?);
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_15_12();
  v5 = type metadata accessor for Mirror();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v23 - v10;
  v26 = a1(0);
  v24 = v1;
  swift_retain();
  Mirror.init(reflecting:)();
  Mirror.subjectType.getter();
  v24 = _typeName(_:qualified:)();
  v25 = v12;
  v13._countAndFlagsBits = 40;
  v13._object = (void *)0xE100000000000000;
  String.append(_:)(v13);
  Mirror.superclassMirror.getter();
  if (__swift_getEnumTagSinglePayload(v2, 1, v5) == 1)
  {
    outlined destroy of RRDataSourceMetadataValue?(v2, &demangling cache variable for type metadata for Mirror?);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v9, v2, v5);
    Mirror.children.getter();
    v14 = specialized ReflectedStringConvertible.printElements(_:)();
    v16 = v15;
    swift_release();
    v23._countAndFlagsBits = v14;
    v23._object = v16;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_46_6(8236);
    swift_bridgeObjectRelease();
    String.append(_:)(v23);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  Mirror.children.getter();
  v17 = specialized ReflectedStringConvertible.printElements(_:)();
  v19 = v18;
  swift_release();
  v20._countAndFlagsBits = v17;
  v20._object = v19;
  String.append(_:)(v20);
  swift_bridgeObjectRelease();
  v21._countAndFlagsBits = 41;
  v21._object = (void *)0xE100000000000000;
  String.append(_:)(v21);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return v24;
}

uint64_t specialized ReflectedStringConvertible.printElements(_:)()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  void *v3;
  uint64_t v4;
  Swift::String v5;
  Swift::String v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD v11[3];
  uint64_t v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  v16 = 0;
  v17 = 0xE000000000000000;
  swift_retain();
  dispatch thunk of _AnySequenceBox._makeIterator()();
  swift_release();
  swift_retain();
  v0 = OUTLINED_FUNCTION_41_10();
  OUTLINED_FUNCTION_40_10(v0, v1);
  if (v15)
  {
    v2 = 1;
    do
    {
      v4 = v12;
      v3 = v13;
      outlined init with take of Any(&v14, v11);
      if (v3)
      {
        if ((v2 & 1) == 0)
          OUTLINED_FUNCTION_46_6(8236);
        v5._countAndFlagsBits = v4;
        v5._object = v3;
        String.append(_:)(v5);
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_46_6(8250);
        _print_unlocked<A, B>(_:_:)();
        v6._countAndFlagsBits = 0;
        v6._object = (void *)0xE000000000000000;
        String.append(_:)(v6);
        swift_bridgeObjectRelease();
        v2 = 0;
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
      v7 = OUTLINED_FUNCTION_41_10();
      OUTLINED_FUNCTION_40_10(v7, v8);
    }
    while (v15);
    v9 = v16;
  }
  else
  {
    v9 = 0;
  }
  swift_release_n();
  return v9;
}

void specialized static CamFeatureStoreLoggingProtocol.writeData(modelFeatures:modelOutput:modelMetadata:requestId:rcId:fsStream:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t inited;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;

  v24 = a8;
  v25 = a7;
  v23[3] = a6;
  v23[2] = a5;
  v23[1] = a4;
  v11 = type metadata accessor for CamModelMetadata();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  v14 = MEMORY[0x1E0C80A78](v11);
  v15 = (char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)v23 - v16;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, AnyEncodable)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C2E93F60;
  *(_QWORD *)(inited + 32) = 0x7365727574616566;
  *(_QWORD *)(inited + 40) = 0xE800000000000000;
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = a1;
  *(_QWORD *)(inited + 48) = partial apply for specialized implicit closure #2 in implicit closure #1 in AnyEncodable.init<A>(_:);
  *(_QWORD *)(inited + 56) = v19;
  *(_QWORD *)(inited + 64) = 0x74757074756FLL;
  *(_QWORD *)(inited + 72) = 0xE600000000000000;
  *(_QWORD *)(inited + 80) = partial apply for specialized implicit closure #2 in implicit closure #1 in AnyEncodable.init<A>(_:);
  *(_QWORD *)(inited + 88) = a2;
  *(_QWORD *)(inited + 96) = 0x617461646174656DLL;
  *(_QWORD *)(inited + 104) = 0xE800000000000000;
  outlined init with copy of RankedAction(a3, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
  outlined init with copy of RankedAction((uint64_t)v17, (uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
  v20 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v21 = swift_allocObject();
  outlined init with take of CamModelMetadata((uint64_t)v15, v21 + v20, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
  swift_bridgeObjectRetain();
  swift_retain();
  outlined destroy of CamParse((uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
  *(_QWORD *)(inited + 112) = _s7SiriCam12AnyEncodableVyACxcSERzlufcys7Encoder_pKcxcfu_ysAD_pKcfu0_AA0B13ModelMetadataV_Tg5TA_0;
  *(_QWORD *)(inited + 120) = v21;
  v22 = Dictionary.init(dictionaryLiteral:)();
  v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : AnyEncodable]);
  v28 = lazy protocol witness table accessor for type [String : AnyEncodable] and conformance <> [A : B]();
  v26 = v22;
  specialized static FeatureStoreLoggingProtocol.write(streamId:object:requestId:rcId:)();
}

void sub_1C2E8F948()
{
  void *v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;

  if (v0)
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1(v2 - 256);
    if (one-time initialization token for common != -1)
      swift_once();
    v3 = type metadata accessor for Logger();
    __swift_project_value_buffer(v3, (uint64_t)static Logger.common);
    v4 = v0;
    v5 = v0;
    v6 = Logger.logObject.getter();
    v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = OUTLINED_FUNCTION_4();
      *(_QWORD *)(v2 - 256) = OUTLINED_FUNCTION_4();
      *(_DWORD *)v8 = 136315394;
      if (v1)
      {
        if (v1 == 1)
          v9 = 0x65646F4D72616143;
        else
          v9 = 0x646E65536F747541;
        if (v1 == 1)
          v10 = 0xE90000000000006CLL;
        else
          v10 = 0xED00006C65646F4DLL;
      }
      else
      {
        v10 = 0xE800000000000000;
        v9 = 0x6C65646F4D6D6143;
      }
      *(_QWORD *)(v2 - 272) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, (uint64_t *)(v2 - 256));
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v8 + 12) = 2080;
      swift_getErrorValue();
      v11 = Error.localizedDescription.getter();
      *(_QWORD *)(v2 - 272) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v11, v12, (uint64_t *)(v2 - 256));
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_4_15();
      OUTLINED_FUNCTION_4_15();
      _os_log_impl(&dword_1C2E0C000, v6, v7, "Failed to write %s data to Feature Store, %s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
    }
    OUTLINED_FUNCTION_4_15();
    OUTLINED_FUNCTION_4_15();
    OUTLINED_FUNCTION_4_15();

  }
  else
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1(v2 - 256);
  }
}

uint64_t AutoSendCoreHandler.init()()
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  ValueMetadata *v19;
  _UNKNOWN **v20;

  v2 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WordEmbeddingFeatureExtractor?);
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_4_5();
  v6 = v5 - v4;
  type metadata accessor for AutoSendInputFeatureExtractor();
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_4_5();
  v10 = (_QWORD *)(v9 - v8);
  v12 = v9 - v8 + *(int *)(v11 + 36);
  v13 = type metadata accessor for WordEmbeddingFeatureExtractor();
  OUTLINED_FUNCTION_10_21();
  *v10 = 0x3FF0000000000000;
  v10[1] = 0;
  type metadata accessor for LatticePathFeatureExtractor();
  v10[2] = swift_allocObject();
  v19 = &type metadata for CamFeatureFlag;
  v20 = (_UNKNOWN **)lazy protocol witness table accessor for type CamFeatureFlag and conformance CamFeatureFlag();
  LOBYTE(v18) = 1;
  v14 = isFeatureEnabled(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v18);
  if ((v14 & 1) != 0 && (static WordEmbeddingFeatureExtractor.currentLocaleIsSupported()() & 1) != 0)
  {
    v15 = WordEmbeddingFeatureExtractor.init()(v6);
    if (v1)
      goto LABEL_7;
    __swift_storeEnumTagSinglePayload(v6, 0, 1, v13);
    outlined assign with take of WordEmbeddingFeatureExtractor?(v6, v12);
  }
  else
  {
    outlined destroy of RRDataSourceMetadataValue?(v12, &demangling cache variable for type metadata for WordEmbeddingFeatureExtractor?);
    OUTLINED_FUNCTION_10_21();
  }
  outlined init with take of CamModelMetadata((uint64_t)v10, v2 + OBJC_IVAR____TtC7SiriCam19AutoSendCoreHandler_autoSendInputFeatureExtractor, (uint64_t (*)(_QWORD))type metadata accessor for AutoSendInputFeatureExtractor);
  v16 = type metadata accessor for CoreMLHandler();
  OUTLINED_FUNCTION_37_7();
  v15 = CoreMLHandler.init(forModelWithName:)(0xD000000000000029, 0x80000001C2E99760);
  if (!v1)
  {
    v19 = (ValueMetadata *)v16;
    v20 = &protocol witness table for CoreMLHandler;
    *(_QWORD *)&v18 = v15;
    outlined init with take of AppSelectionSignalComponent(&v18, v2 + 16);
    OUTLINED_FUNCTION_4_28();
  }
LABEL_7:
  OUTLINED_FUNCTION_32_10(v15, (uint64_t (*)(_QWORD))type metadata accessor for AutoSendInputFeatureExtractor);
  type metadata accessor for AutoSendCoreHandler();
  swift_deallocPartialClassInstance();
  return v2;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> AutoSendCoreHandler.update()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t);

  swift_beginAccess();
  AutoSendInputFeatureExtractor.update()();
  swift_endAccess();
  if (!v1)
  {
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
    v2 = OUTLINED_FUNCTION_47_7();
    v3(v2);
  }
}

uint64_t (*AutoSendCoreHandler.handle(_:)(uint64_t a1))()
{
  os_log_type_t v1;
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
  char *v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  _BOOL4 v36;
  uint64_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t (*v42)();
  id v43;
  uint64_t v44;
  uint64_t (*v45)();
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t (*v51)();
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t (*v55)();
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  os_log_type_t v65;
  _BOOL4 v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  _BOOL4 v71;
  uint64_t v72;
  uint64_t (**v73)();
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t (*v77)();
  uint64_t v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t);
  uint64_t v81;
  NSObject *v82;
  os_log_type_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  Swift::String v90;
  uint64_t v91;
  uint64_t v92;
  NSObject *v93;
  os_log_type_t v94;
  _DWORD *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  unint64_t v106;
  _QWORD *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
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
  char *v132;
  char *v133;
  NSObject *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t (**v137)();
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t (*v141)();
  uint64_t (*v142)();
  uint64_t aBlock;
  uint64_t v144;
  uint64_t (*v145)(uint64_t);
  void *v146;
  void (*v147)();
  _QWORD *v148;
  uint64_t v149;
  uint64_t v150;

  v131 = type metadata accessor for DispatchWorkItemFlags();
  OUTLINED_FUNCTION_19_14(*(_QWORD *)(v131 - 8));
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_37_3(v4);
  v128 = type metadata accessor for DispatchQoS();
  OUTLINED_FUNCTION_19_14(*(_QWORD *)(v128 - 8));
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_37_3(v6);
  v125 = type metadata accessor for DispatchQoS.QoSClass();
  OUTLINED_FUNCTION_19_14(*(_QWORD *)(v125 - 8));
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_9_7();
  v123 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_9_7();
  v116 = v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CamLogOutput, CamModelMetadata));
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_37_3(v13);
  v117 = type metadata accessor for CamModelMetadata();
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_37_3(v15);
  type metadata accessor for AutoSendInputFeatureExtractor();
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_9_7();
  v140 = v17;
  v139 = type metadata accessor for OSSignpostID();
  v18 = *(_QWORD *)(v139 - 8);
  v19 = MEMORY[0x1E0C80A78](v139);
  v21 = (char *)&v112 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v19);
  v23 = (char *)&v112 - v22;
  v136 = type metadata accessor for AutoSendInput();
  v121 = *(_QWORD *)(v136 - 8);
  v24 = MEMORY[0x1E0C80A78](v136);
  v119 = (uint64_t)&v112 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x1E0C80A78](v24);
  v118 = (char *)&v112 - v27;
  v28 = MEMORY[0x1E0C80A78](v26);
  v135 = (uint64_t)&v112 - v29;
  v122 = v30;
  MEMORY[0x1E0C80A78](v28);
  v32 = (char *)&v112 - v31;
  if (one-time initialization token for autoSend != -1)
    swift_once();
  v33 = OUTLINED_FUNCTION_14_1();
  v34 = __swift_project_value_buffer(v33, (uint64_t)static Logger.autoSend);
  outlined init with copy of RankedAction(a1, (uint64_t)v32, (uint64_t (*)(_QWORD))type metadata accessor for AutoSendInput);
  v134 = v34;
  Logger.logObject.getter();
  v35 = OUTLINED_FUNCTION_47();
  v36 = OUTLINED_FUNCTION_16_4(v35);
  v115 = v11;
  if (v36)
  {
    v37 = OUTLINED_FUNCTION_4();
    v137 = (uint64_t (**)())a1;
    v38 = (uint8_t *)v37;
    v39 = OUTLINED_FUNCTION_4();
    v132 = v21;
    aBlock = v39;
    v138 = v18;
    *(_DWORD *)v38 = 136315138;
    v133 = v23;
    outlined init with copy of RankedAction((uint64_t)v32, v135, (uint64_t (*)(_QWORD))type metadata accessor for AutoSendInput);
    v40 = String.init<A>(describing:)();
    v149 = OUTLINED_FUNCTION_45_9(v40, v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    outlined destroy of CamParse((uint64_t)v32, (uint64_t (*)(_QWORD))type metadata accessor for AutoSendInput);
    _os_log_impl(&dword_1C2E0C000, v34, v1, "Handling AutoSend input: %s", v38, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
  }
  outlined destroy of CamParse((uint64_t)v32, (uint64_t (*)(_QWORD))type metadata accessor for AutoSendInput);

  v42 = v142;
  if (one-time initialization token for autoSend != -1)
    swift_once();
  v43 = (id)static Log.autoSend;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  OUTLINED_FUNCTION_16_17();
  v44 = (uint64_t)v42 + OBJC_IVAR____TtC7SiriCam19AutoSendCoreHandler_autoSendInputFeatureExtractor;
  swift_beginAccess();
  outlined init with copy of RankedAction(v44, v140, (uint64_t (*)(_QWORD))type metadata accessor for AutoSendInputFeatureExtractor);
  v45 = v141;
  v46 = specialized FeatureExtracting.extract(from:)(a1);
  if (v45)
  {
    OUTLINED_FUNCTION_32_10(v46, (uint64_t (*)(_QWORD))type metadata accessor for AutoSendInputFeatureExtractor);
    OUTLINED_FUNCTION_9_14((uint64_t)v23);
  }
  else
  {
    v47 = v46;
    v137 = (uint64_t (**)())a1;
    v138 = v18;
    OUTLINED_FUNCTION_32_10(v46, (uint64_t (*)(_QWORD))type metadata accessor for AutoSendInputFeatureExtractor);
    v48 = (void *)static Log.autoSend;
    static os_signpost_type_t.end.getter();
    OUTLINED_FUNCTION_16_17();
    v49 = v48;
    OSSignpostID.init(log:)();
    static os_signpost_type_t.begin.getter();
    os_signpost(_:dso:log:name:signpostID:)();
    v50 = *((_QWORD *)v42 + 5);
    v51 = v42;
    v52 = (uint64_t)v21;
    v53 = *((_QWORD *)v51 + 6);
    OUTLINED_FUNCTION_37_13();
    v54 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v53 + 32))(v47, v50, v53);
    static os_signpost_type_t.end.getter();
    os_signpost(_:dso:log:name:signpostID:)();
    AutoSendOutputProvider.toAutoSendOutput(from:)(v54);
    v140 = v47;
    v113 = v54;
    v141 = v55;
    v132 = (char *)v52;
    v117 = swift_allocBox();
    v58 = v57;
    v59 = *((_QWORD *)v142 + 5);
    v60 = *((_QWORD *)v142 + 6);
    OUTLINED_FUNCTION_37_13();
    v61 = *(void (**)(uint64_t, uint64_t))(v60 + 24);
    v114 = v58;
    v61(v59, v60);
    v62 = (uint64_t)v137;
    v63 = (uint64_t)v118;
    OUTLINED_FUNCTION_35_10((uint64_t)v137);
    v64 = v119;
    outlined init with copy of RankedAction(v62, v119, (uint64_t (*)(_QWORD))type metadata accessor for AutoSendInput);
    OUTLINED_FUNCTION_86();
    v65 = OUTLINED_FUNCTION_47();
    v66 = os_log_type_enabled((os_log_t)type metadata accessor for AutoSendInput, v65);
    v133 = v23;
    if (v66)
    {
      v67 = OUTLINED_FUNCTION_4();
      *(_DWORD *)v67 = 67109376;
      v68 = v136;
      v69 = *(unsigned __int8 *)(v63 + *(int *)(v136 + 28));
      OUTLINED_FUNCTION_10_6(v63);
      LODWORD(aBlock) = v69;
      OUTLINED_FUNCTION_17_15();
      *(_WORD *)(v67 + 8) = 1024;
      v70 = v64;
      v71 = (*(_BYTE *)(v64 + *(int *)(v68 + 28)) & 1) == 0;
      OUTLINED_FUNCTION_10_6(v70);
      LODWORD(aBlock) = v71;
      OUTLINED_FUNCTION_17_15();
      _os_log_impl(&dword_1C2E0C000, (os_log_t)type metadata accessor for AutoSendInput, v65, "Feature opt in status is %{BOOL}d, overriding shadow log field to %{BOOL}d.", (uint8_t *)v67, 0xEu);
      OUTLINED_FUNCTION_3();
    }
    outlined destroy of CamParse(v64, (uint64_t (*)(_QWORD))type metadata accessor for AutoSendInput);
    outlined destroy of CamParse(v63, (uint64_t (*)(_QWORD))type metadata accessor for AutoSendInput);
    v72 = v136;

    v73 = v137;
    v74 = v114;
    *(_BYTE *)(v114 + 48) = (*((_BYTE *)v137 + *(int *)(v72 + 28)) & 1) == 0;
    v75 = *(_QWORD *)((char *)v142 + OBJC_IVAR____TtC7SiriCam19AutoSendCoreHandler_autoSendEnforcer + 24);
    v76 = *(_QWORD *)((char *)v142 + OBJC_IVAR____TtC7SiriCam19AutoSendCoreHandler_autoSendEnforcer + 32);
    __swift_project_boxed_opaque_existential_1((uint64_t (*)())((char *)v142 + OBJC_IVAR____TtC7SiriCam19AutoSendCoreHandler_autoSendEnforcer), v75);
    v77 = type metadata accessor for CamModelMetadata;
    v78 = v74;
    v79 = v120;
    outlined init with copy of RankedAction(v78, v120, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t (*)(), uint64_t (**)(), uint64_t, uint64_t, uint64_t))(v76 + 8))(&aBlock, v140, v141, v73, v79, v75, v76);
    OUTLINED_FUNCTION_10_6(v79);
    v80 = v145;
    if (v145)
    {
      v81 = v144;
      LODWORD(v142) = aBlock;
      v77 = v141;
      swift_retain_n();
      OUTLINED_FUNCTION_21_7();
      v82 = OUTLINED_FUNCTION_86();
      v83 = static os_log_type_t.info.getter();
      if (OUTLINED_FUNCTION_16_4(v83))
      {
        v84 = OUTLINED_FUNCTION_4();
        v120 = OUTLINED_FUNCTION_4();
        aBlock = v120;
        *(_DWORD *)v84 = 136315650;
        LOBYTE(v150) = *((_BYTE *)v77 + 57);
        v85 = String.init<A>(describing:)();
        v87 = OUTLINED_FUNCTION_45_9(v85, v86);
        OUTLINED_FUNCTION_48(v87);
        OUTLINED_FUNCTION_17_15();
        OUTLINED_FUNCTION_6_19();
        swift_bridgeObjectRelease();
        *(_WORD *)(v84 + 12) = 2080;
        LOBYTE(v150) = (_BYTE)v142;
        v88 = String.init<A>(describing:)();
        v150 = OUTLINED_FUNCTION_45_9(v88, v89);
        OUTLINED_FUNCTION_17_15();
        swift_bridgeObjectRelease();
        *(_WORD *)(v84 + 22) = 2080;
        swift_bridgeObjectRetain();
        v150 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v81, (unint64_t)v80, &aBlock);
        OUTLINED_FUNCTION_17_15();
        OUTLINED_FUNCTION_41_3();
        _os_log_impl(&dword_1C2E0C000, v82, (os_log_type_t)v72, "Overriding %s with %s due to %s", (uint8_t *)v84, 0x20u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_3();
      }

      OUTLINED_FUNCTION_1_10();
      OUTLINED_FUNCTION_6_19();
      OUTLINED_FUNCTION_12_18();
      LOBYTE(aBlock) = (_BYTE)v142;
      v90._countAndFlagsBits = v81;
      v90._object = v80;
      AutoSendOutput.overrideAction(action:enforcer:)((SiriCam::AutoConfirmAction)&aBlock, v90);
      swift_bridgeObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_12_18();
    }
    v91 = (uint64_t)v73 + *(int *)(v75 + 48);
    *v73 = v141;
    outlined init with copy of RankedAction(v114, v91, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
    v92 = type metadata accessor for UUID();
    __swift_storeEnumTagSinglePayload((uint64_t)v77, 1, 1, v92);
    swift_retain();
    specialized static CamLoggingProtocol.log(from:forRequestId:forCamId:forRcId:forTrpId:forFeature:)();
    outlined destroy of RRDataSourceMetadataValue?((uint64_t)v77, &demangling cache variable for type metadata for UUID?);
    outlined destroy of RRDataSourceMetadataValue?((uint64_t)v73, &demangling cache variable for type metadata for (CamLogOutput, CamModelMetadata));
    swift_retain_n();
    v93 = OUTLINED_FUNCTION_86();
    v94 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v93, v94))
    {
      v95 = (_DWORD *)OUTLINED_FUNCTION_4();
      v96 = OUTLINED_FUNCTION_4();
      *v95 = 136315138;
      v142 = (uint64_t (*)())(v95 + 1);
      aBlock = v96;
      swift_retain();
      specialized ReflectedStringConvertible.description.getter((uint64_t (*)(_QWORD))type metadata accessor for AutoSendOutput);
      v97 = swift_release();
      v99 = OUTLINED_FUNCTION_39_7(v97, v98, &aBlock);
      OUTLINED_FUNCTION_48(v99);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_6_19();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_26_12(&dword_1C2E0C000, v93, v100, "Returning AutoSend output: %s");
      OUTLINED_FUNCTION_13_2();
      OUTLINED_FUNCTION_3();
    }

    v42 = v141;
    OUTLINED_FUNCTION_6_19();
    type metadata accessor for MLMultiArray(0, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue);
    v101 = v124;
    v102 = v123;
    v103 = v125;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v124 + 104))(v123, *MEMORY[0x1E0DEF520], v125);
    v104 = (void *)static OS_dispatch_queue.global(qos:)();
    (*(void (**)(uint64_t, uint64_t))(v101 + 8))(v102, v103);
    v105 = v135;
    OUTLINED_FUNCTION_35_10((uint64_t)v137);
    v106 = (*(unsigned __int8 *)(v121 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v121 + 80);
    v107 = (_QWORD *)swift_allocObject();
    v107[2] = v140;
    v107[3] = v42;
    v107[4] = v117;
    outlined init with take of CamModelMetadata(v105, (uint64_t)v107 + v106, (uint64_t (*)(_QWORD))type metadata accessor for AutoSendInput);
    v147 = partial apply for closure #1 in AutoSendCoreHandler.handle(_:);
    v148 = v107;
    aBlock = MEMORY[0x1E0C809B0];
    v144 = 1107296256;
    v145 = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    v146 = &block_descriptor_3;
    v108 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    v109 = v126;
    static DispatchQoS.unspecified.getter();
    v150 = MEMORY[0x1E0DEE9D8];
    lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
    v110 = v129;
    v111 = v131;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    MEMORY[0x1C3BCAB44](0, v109, v110, v108);
    _Block_release(v108);

    (*(void (**)(uint64_t, uint64_t))(v130 + 8))(v110, v111);
    (*(void (**)(uint64_t, uint64_t))(v127 + 8))(v109, v128);
    OUTLINED_FUNCTION_9_14((uint64_t)v132);
    OUTLINED_FUNCTION_9_14((uint64_t)v133);
    swift_release();
    swift_release();
  }
  return v42;
}

void closure #1 in AutoSendCoreHandler.handle(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v7 = type metadata accessor for CamModelMetadata();
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = swift_projectBox();
  swift_beginAccess();
  outlined init with copy of RankedAction(v10, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for CamModelMetadata);
  v11 = type metadata accessor for AutoSendInput();
  v12 = UUID.uuidString.getter();
  specialized static CamFeatureStoreLoggingProtocol.writeData(modelFeatures:modelOutput:modelMetadata:requestId:rcId:fsStream:)(a1, a2, (uint64_t)v9, v12, v13, *(_QWORD *)(a4 + *(int *)(v11 + 24)), *(_QWORD *)(a4 + *(int *)(v11 + 24) + 8), 2);
}

void sub_1C2E90E48()
{
  uint64_t (*v0)(_QWORD);
  uint64_t v1;

  swift_bridgeObjectRelease();
  outlined destroy of CamParse(v1, v0);
}

uint64_t AutoSendCoreHandler.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  outlined destroy of CamParse(v0 + OBJC_IVAR____TtC7SiriCam19AutoSendCoreHandler_autoSendInputFeatureExtractor, (uint64_t (*)(_QWORD))type metadata accessor for AutoSendInputFeatureExtractor);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC7SiriCam19AutoSendCoreHandler_autoSendEnforcer);
  return v0;
}

uint64_t AutoSendCoreHandler.__deallocating_deinit()
{
  AutoSendCoreHandler.deinit();
  return swift_deallocClassInstance();
}

uint64_t ObjC metadata update function for AutoSendCoreHandler()
{
  return type metadata accessor for AutoSendCoreHandler();
}

uint64_t type metadata accessor for AutoSendCoreHandler()
{
  uint64_t result;

  result = type metadata singleton initialization cache for AutoSendCoreHandler;
  if (!type metadata singleton initialization cache for AutoSendCoreHandler)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata completion function for AutoSendCoreHandler()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for AutoSendInputFeatureExtractor();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

id @nonobjc FSFCurareInteractionAsJsonStr.init(jsonStr:interactionId:dataVersion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v9;
  void *v10;
  id v11;

  if (!a2)
  {
    v9 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v9 = (void *)MEMORY[0x1C3BCA844]();
  swift_bridgeObjectRelease();
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v10 = (void *)MEMORY[0x1C3BCA844](a3, a4);
  swift_bridgeObjectRelease();
LABEL_6:
  v11 = objc_msgSend(v5, sel_initWithJsonStr_interactionId_dataVersion_, v9, v10, a5);

  return v11;
}

id @nonobjc FSFCurareInteractionStream.init(streamId:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  if (a2)
  {
    v3 = (void *)MEMORY[0x1C3BCA844]();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  v4 = objc_msgSend(v2, sel_initWithStreamId_, v3);

  return v4;
}

uint64_t sub_1C2E910AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  v1 = type metadata accessor for AutoSendInput();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 40) & ~v2;
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v4 = v0 + v3;
  v5 = type metadata accessor for UUID();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);

  swift_bridgeObjectRelease();
  v6(v4 + *(int *)(v1 + 32), v5);
  return swift_deallocObject();
}

void partial apply for closure #1 in AutoSendCoreHandler.handle(_:)()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AutoSendInput() - 8) + 80);
  closure #1 in AutoSendCoreHandler.handle(_:)(v0[2], v0[3], v0[4], (uint64_t)v0 + ((v1 + 40) & ~v1));
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

uint64_t sub_1C2E911DC()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for specialized implicit closure #2 in implicit closure #1 in AnyEncodable.init<A>(_:)()
{
  return specialized implicit closure #2 in implicit closure #1 in AnyEncodable.init<A>(_:)();
}

uint64_t sub_1C2E91230()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for CamModelMetadata();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v3 + 40) != 1)
    swift_bridgeObjectRelease();
  v4 = v3 + *(int *)(v1 + 28);
  v5 = type metadata accessor for Locale();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_deallocObject();
}

void _s7SiriCam12AnyEncodableVyACxcSERzlufcys7Encoder_pKcxcfu_ysAD_pKcfu0_AA0B13ModelMetadataV_Tg5TA_0(_QWORD *a1)
{
  type metadata accessor for CamModelMetadata();
  CamModelMetadata.encode(to:)(a1);
}

void lazy protocol witness table accessor for type MLFeatureValue and conformance MLFeatureValue(_QWORD *a1, unint64_t *a2)
{
  if (!*a1)
  {
    type metadata accessor for MLMultiArray(255, a2);
    OUTLINED_FUNCTION_44_7();
  }
  OUTLINED_FUNCTION_1_5();
}

uint64_t outlined assign with take of WordEmbeddingFeatureExtractor?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WordEmbeddingFeatureExtractor?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    OUTLINED_FUNCTION_44_7();
  }
  OUTLINED_FUNCTION_1_5();
}

void OUTLINED_FUNCTION_4_28()
{
  JUMPOUT(0x1C3BCA844);
}

uint64_t OUTLINED_FUNCTION_10_21()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v0, 1, 1, v1);
}

void OUTLINED_FUNCTION_11_15(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_15_12()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_16_17()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t OUTLINED_FUNCTION_17_15()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

void OUTLINED_FUNCTION_19_14(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
}

void OUTLINED_FUNCTION_26_12(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  uint8_t *v4;
  os_log_type_t v5;

  _os_log_impl(a1, a2, v5, a4, v4, 0xCu);
}

void OUTLINED_FUNCTION_32_10(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  outlined destroy of CamParse(v2, a2);
}

void OUTLINED_FUNCTION_35_10(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);
  uint64_t v2;

  outlined init with copy of RankedAction(a1, v2, v1);
}

_QWORD *OUTLINED_FUNCTION_37_13()
{
  uint64_t v0;
  _QWORD *v1;

  return __swift_project_boxed_opaque_existential_1(v1, v0);
}

uint64_t OUTLINED_FUNCTION_39_7(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  unint64_t v4;

  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_40_10(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  return outlined init with take of (label: String?, value: Any)?((uint64_t)va, (uint64_t)va1);
}

uint64_t OUTLINED_FUNCTION_41_10()
{
  return dispatch thunk of _AnyIteratorBoxBase.next()();
}

void OUTLINED_FUNCTION_44_7()
{
  JUMPOUT(0x1C3BCB3E4);
}

uint64_t OUTLINED_FUNCTION_45_9(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, (uint64_t *)(v2 - 160));
}

void OUTLINED_FUNCTION_46_6(uint64_t a1)
{
  unint64_t v1;

  v1 = 0xE200000000000000;
  String.append(_:)(*(Swift::String *)&a1);
}

uint64_t OUTLINED_FUNCTION_47_7()
{
  uint64_t v0;

  return v0;
}

uint64_t static TrialProvider.fetchBoolFactorFromTrial(_:)()
{
  void *v0;
  void *v1;
  uint64_t v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15[3];

  if (one-time initialization token for cachedFactors != -1)
    swift_once();
  OUTLINED_FUNCTION_1_31();
  v4 = static TrialProvider.cachedFactors;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_21();
  OUTLINED_FUNCTION_13_23();
  OUTLINED_FUNCTION_1_0();
  if (one-time initialization token for common != -1)
    swift_once();
  v5 = OUTLINED_FUNCTION_14_1();
  __swift_project_value_buffer(v5, (uint64_t)static Logger.common);
  OUTLINED_FUNCTION_22_11();
  OUTLINED_FUNCTION_3_27();
  v6 = v1;
  OUTLINED_FUNCTION_21_18();
  v7 = OUTLINED_FUNCTION_47();
  if (OUTLINED_FUNCTION_2_33(v7))
  {
    OUTLINED_FUNCTION_4();
    v15[0] = OUTLINED_FUNCTION_9_24();
    v8 = OUTLINED_FUNCTION_7_26(4.8151e-34);
    OUTLINED_FUNCTION_14_18(v8, v9, v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    OUTLINED_FUNCTION_15_13();
    *(_WORD *)(v2 + 12) = 2080;
    if (v4)
      OUTLINED_FUNCTION_19_15();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Bool?);
    v11 = String.init<A>(describing:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v11, v12, v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_5_19(&dword_1C2E0C000, v13, v3, "[TrialProvider] Fetched %s = %s");
    OUTLINED_FUNCTION_4_29();
    OUTLINED_FUNCTION_3();
  }

  OUTLINED_FUNCTION_9_16();
  if (!v4)
    return 2;
  v10 = OUTLINED_FUNCTION_19_15();

  return (uint64_t)v10;
}

uint64_t static TrialProvider.fetchDoubleFactorFromTrial(_:)()
{
  void *v0;
  void *v1;
  uint64_t v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23[2];
  BOOL v24;

  if (one-time initialization token for cachedFactors != -1)
    swift_once();
  OUTLINED_FUNCTION_1_31();
  v4 = static TrialProvider.cachedFactors;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_21();
  OUTLINED_FUNCTION_13_23();
  OUTLINED_FUNCTION_1_0();
  if (one-time initialization token for common != -1)
    swift_once();
  v5 = OUTLINED_FUNCTION_14_1();
  __swift_project_value_buffer(v5, (uint64_t)static Logger.common);
  OUTLINED_FUNCTION_22_11();
  OUTLINED_FUNCTION_3_27();
  v6 = v1;
  OUTLINED_FUNCTION_21_18();
  v7 = OUTLINED_FUNCTION_47();
  if (OUTLINED_FUNCTION_2_33(v7))
  {
    OUTLINED_FUNCTION_4();
    v23[0] = OUTLINED_FUNCTION_9_24();
    v8 = OUTLINED_FUNCTION_7_26(4.8151e-34);
    OUTLINED_FUNCTION_14_18(v8, v9, v23);
    OUTLINED_FUNCTION_6_23();
    OUTLINED_FUNCTION_15_13();
    *(_WORD *)(v2 + 12) = 2080;
    if (v4)
      OUTLINED_FUNCTION_20_16();
    else
      v10 = 0;
    v23[1] = v10;
    v24 = v4 == 0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Double?);
    v14 = OUTLINED_FUNCTION_18_17();
    OUTLINED_FUNCTION_24_16(v14, v15, v16, v17, v18, v19, v20, v21, v23[0]);
    OUTLINED_FUNCTION_11_16();

    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_5_19(&dword_1C2E0C000, v22, v3, "[TrialProvider] Fetched %s = %s");
    OUTLINED_FUNCTION_4_29();
    OUTLINED_FUNCTION_3();
  }

  OUTLINED_FUNCTION_9_16();
  if (!v4)
    return 0;
  OUTLINED_FUNCTION_20_16();
  v12 = v11;

  return v12;
}

uint64_t static TrialProvider.fetchStringFactorFromTrial(_:)()
{
  void *v0;
  void *v1;
  uint64_t v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v24[4];

  if (one-time initialization token for cachedFactors != -1)
    swift_once();
  OUTLINED_FUNCTION_1_31();
  v4 = static TrialProvider.cachedFactors;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_21();
  OUTLINED_FUNCTION_13_23();
  OUTLINED_FUNCTION_1_0();
  if (one-time initialization token for common != -1)
    swift_once();
  v5 = OUTLINED_FUNCTION_14_1();
  __swift_project_value_buffer(v5, (uint64_t)static Logger.common);
  OUTLINED_FUNCTION_22_11();
  OUTLINED_FUNCTION_3_27();
  v6 = v1;
  OUTLINED_FUNCTION_21_18();
  v7 = OUTLINED_FUNCTION_47();
  if (OUTLINED_FUNCTION_2_33(v7))
  {
    OUTLINED_FUNCTION_4();
    v24[0] = OUTLINED_FUNCTION_9_24();
    v8 = OUTLINED_FUNCTION_7_26(4.8151e-34);
    OUTLINED_FUNCTION_14_18(v8, v9, v24);
    OUTLINED_FUNCTION_6_23();
    OUTLINED_FUNCTION_15_13();
    *(_WORD *)(v2 + 12) = 2080;
    if (v4)
    {
      v10 = outlined bridged method (pb) of @objc TRILevel.stringValue.getter(v1);
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
    v24[1] = v10;
    v24[2] = v11;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
    v12 = OUTLINED_FUNCTION_18_17();
    OUTLINED_FUNCTION_24_16(v12, v13, v14, v15, v16, v17, v18, v19, v24[0]);
    OUTLINED_FUNCTION_11_16();

    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_5_19(&dword_1C2E0C000, v20, v3, "[TrialProvider] Fetched %s = %s");
    OUTLINED_FUNCTION_4_29();
    OUTLINED_FUNCTION_3();
  }

  OUTLINED_FUNCTION_9_16();
  if (v4)
  {
    v21 = objc_msgSend(v1, sel_stringValue);
    if (v21)
    {
      v22 = v21;
      v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();

    }
    else
    {

      return 0;
    }
  }
  return v4;
}

double one-time initialization function for enrollment()
{
  double result;
  _OWORD v1[2];
  __int128 v2;
  __int128 v3;

  static TrialProvider.fetchTrialEnrollment()((uint64_t *)v1);
  static TrialProvider.enrollment = v1[0];
  *(_OWORD *)&qword_1ED79B950 = v1[1];
  result = *(double *)&v2;
  xmmword_1ED79B960 = v2;
  *(_OWORD *)&qword_1ED79B970 = v3;
  return result;
}

void static TrialProvider.fetchTrialEnrollment()(uint64_t *a1@<X8>)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (one-time initialization token for ranker != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Logger.ranker);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C2E0C000, v3, v4, "[TrialProvider] Fetching enrollment metadata.", v5, 2u);
    MEMORY[0x1C3BCB4A4](v5, -1, -1);
  }

  if (one-time initialization token for triClient != -1)
    swift_once();
  v6 = (id)static TrialProvider.triClient;
  v7 = (void *)MEMORY[0x1C3BCA844](0xD000000000000021, 0x80000001C2E9C0F0);
  v8 = objc_msgSend(v6, sel_experimentIdentifiersWithNamespaceName_, v7);

  if (v8)
  {
    v9 = objc_msgSend(v8, sel_experimentId);
    v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v11 = v10;

    v12 = objc_msgSend(v8, sel_treatmentId);
    v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v15 = v14;

    objc_msgSend(v8, sel_deploymentId);
  }
  else
  {
    v13 = 0;
    v15 = 0;
    v25 = 0;
    v11 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Int32?);
  v16 = String.init<A>(describing:)();
  v18 = v17;
  v19 = (id)static TrialProvider.triClient;
  v20 = (void *)MEMORY[0x1C3BCA844](0xD000000000000021, 0x80000001C2E9C0F0);
  v21 = objc_msgSend(v19, sel_rolloutIdentifiersWithNamespaceName_, v20);

  if (v21)
  {
    v22 = objc_msgSend(v21, sel_rolloutId);

    v21 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    v24 = v23;

  }
  else
  {

    v24 = 0;
  }
  *a1 = v25;
  a1[1] = v11;
  a1[2] = v13;
  a1[3] = v15;
  a1[4] = v16;
  a1[5] = v18;
  a1[6] = (uint64_t)v21;
  a1[7] = v24;
}

uint64_t one-time initialization function for cachedFactors()
{
  uint64_t result;

  result = static TrialProvider.fetchFactorValues()();
  static TrialProvider.cachedFactors = result;
  return result;
}

uint64_t static TrialProvider.fetchFactorValues()()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v22;
  char v23;
  uint64_t v24;
  _BOOL8 v25;
  Swift::Int v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t result;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  id v40;

  if (one-time initialization token for ranker != -1)
LABEL_32:
    swift_once();
  v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.ranker);
  v1 = Logger.logObject.getter();
  v2 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1C2E0C000, v1, v2, "[TrialProvider] Fetching factor values.", v3, 2u);
    MEMORY[0x1C3BCB4A4](v3, -1, -1);
  }

  if (one-time initialization token for triClient != -1)
    swift_once();
  v4 = (id)static TrialProvider.triClient;
  v5 = (void *)MEMORY[0x1C3BCA844](0xD000000000000021, 0x80000001C2E9C0F0);
  v6 = objc_msgSend(v4, sel_factorLevelsWithNamespaceName_, v5);

  type metadata accessor for MLMultiArray(0, &lazy cache variable for type metadata for TRIFactorLevel);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  type metadata accessor for MLMultiArray(0, &lazy cache variable for type metadata for TRILevel);
  v8 = (_QWORD *)Dictionary.init(dictionaryLiteral:)();
  if (!(v7 >> 62))
  {
    v9 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_28:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v8;
  }
  swift_bridgeObjectRetain_n();
  v9 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v9)
    goto LABEL_28;
LABEL_8:
  v10 = v7 & 0xC000000000000001;
  v11 = 4;
  v38 = v9;
  v39 = v7;
  v37 = v7 & 0xC000000000000001;
  while (1)
  {
    if (v10)
      v12 = (id)MEMORY[0x1C3BCAC88](v11 - 4, v7);
    else
      v12 = *(id *)(v7 + 8 * v11);
    v13 = v12;
    v14 = v11 - 3;
    if (__OFADD__(v11 - 4, 1))
    {
      __break(1u);
LABEL_30:
      __break(1u);
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
    v15 = objc_msgSend(v12, sel_factor);
    if (!v15)
      break;
    v16 = outlined bridged method (ob) of @objc TRIFactor.name.getter(v15);
    if (v17)
    {
      v18 = v16;
      v19 = v17;
      v20 = objc_msgSend(v13, sel_level);
      if (v20)
      {
        v40 = v20;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v22 = specialized __RawDictionaryStorage.find<A>(_:)(v18, v19);
        v24 = v8[2];
        v25 = (v23 & 1) == 0;
        v26 = v24 + v25;
        if (__OFADD__(v24, v25))
          goto LABEL_30;
        v27 = v22;
        v28 = v23;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, TRILevel>);
        if (_NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v26))
        {
          v29 = specialized __RawDictionaryStorage.find<A>(_:)(v18, v19);
          if ((v28 & 1) != (v30 & 1))
            goto LABEL_36;
          v27 = v29;
        }
        if ((v28 & 1) != 0)
        {
          v31 = v8[7];

          *(_QWORD *)(v31 + 8 * v27) = v40;
        }
        else
        {
          v8[(v27 >> 6) + 8] |= 1 << v27;
          v32 = (uint64_t *)(v8[6] + 16 * v27);
          *v32 = v18;
          v32[1] = v19;
          *(_QWORD *)(v8[7] + 8 * v27) = v40;
          v33 = v8[2];
          v34 = __OFADD__(v33, 1);
          v35 = v33 + 1;
          if (v34)
            goto LABEL_31;
          v8[2] = v35;
          swift_bridgeObjectRetain();
        }

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v9 = v38;
        v7 = v39;
        v10 = v37;
      }
      else
      {

        swift_bridgeObjectRelease();
      }
    }
    else
    {

    }
    ++v11;
    if (v14 == v9)
      goto LABEL_28;
  }
  __break(1u);
LABEL_36:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

id one-time initialization function for triClient()
{
  id result;

  result = closure #1 in variable initialization expression of static TrialProvider.triClient();
  static TrialProvider.triClient = (uint64_t)result;
  return result;
}

id closure #1 in variable initialization expression of static TrialProvider.triClient()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];

  if (one-time initialization token for ranker != -1)
    swift_once();
  v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.ranker);
  v1 = Logger.logObject.getter();
  v2 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1C2E0C000, v1, v2, "[TrialProvider] New TRIClient instance.", v3, 2u);
    MEMORY[0x1C3BCB4A4](v3, -1, -1);
  }

  v4 = objc_msgSend((id)objc_opt_self(), sel_clientWithIdentifier_, 115);
  v5 = (void *)MEMORY[0x1C3BCA844](0xD000000000000021, 0x80000001C2E9C0F0);
  v9[4] = closure #1 in closure #1 in variable initialization expression of static TrialProvider.triClient;
  v9[5] = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@guaranteed TRINamespaceUpdateProtocol) -> ();
  v9[3] = &block_descriptor_4;
  v6 = _Block_copy(v9);
  v7 = objc_msgSend(v4, sel_addUpdateHandlerForNamespaceName_usingBlock_, v5, v6);
  _Block_release(v6);
  swift_unknownObjectRelease();

  return v4;
}

uint64_t closure #1 in closure #1 in variable initialization expression of static TrialProvider.triClient()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  if (one-time initialization token for ranker != -1)
    swift_once();
  v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.ranker);
  v1 = Logger.logObject.getter();
  v2 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1C2E0C000, v1, v2, "[TrialProvider] Update handler called.", v3, 2u);
    MEMORY[0x1C3BCB4A4](v3, -1, -1);
  }

  return static TrialProvider.refreshClient()();
}

uint64_t static TrialProvider.refreshClient()()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  _OWORD v6[4];

  if (one-time initialization token for ranker != -1)
    swift_once();
  v0 = OUTLINED_FUNCTION_14_1();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.ranker);
  v1 = Logger.logObject.getter();
  v2 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)OUTLINED_FUNCTION_4();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1C2E0C000, v1, v2, "[TrialProvider] Refreshing TRIClient instance.", v3, 2u);
    OUTLINED_FUNCTION_3();
  }

  if (one-time initialization token for triClient != -1)
    swift_once();
  objc_msgSend((id)static TrialProvider.triClient, sel_refresh);
  if (one-time initialization token for cachedFactors != -1)
    swift_once();
  v4 = static TrialProvider.fetchFactorValues()();
  swift_beginAccess();
  static TrialProvider.cachedFactors = v4;
  swift_bridgeObjectRelease();
  if (one-time initialization token for enrollment != -1)
    swift_once();
  static TrialProvider.fetchTrialEnrollment()((uint64_t *)v6);
  static TrialProvider.enrollment = v6[0];
  *(_OWORD *)&qword_1ED79B950 = v6[1];
  xmmword_1ED79B960 = v6[2];
  *(_OWORD *)&qword_1ED79B970 = v6[3];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed TRINamespaceUpdateProtocol) -> ()(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t outlined bridged method (ob) of @objc TRIFactor.name.getter(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_name);

  if (!v2)
    return 0;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
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

uint64_t outlined bridged method (pb) of @objc TRILevel.stringValue.getter(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_stringValue);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t OUTLINED_FUNCTION_1_31()
{
  return swift_beginAccess();
}

BOOL OUTLINED_FUNCTION_2_33(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_3_27()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_4_29()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_5_19(void *a1, uint64_t a2, os_log_type_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_impl(a1, v4, a3, a4, v5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_6_23()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_7_26(float a1)
{
  float *v1;

  *v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_8_21()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return specialized Dictionary.subscript.getter(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_9_24()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_11_16()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_13_23()
{
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_14_18(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;
  uint64_t v4;

  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, a3);
}

uint64_t OUTLINED_FUNCTION_15_13()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_18_17()
{
  return String.init<A>(describing:)();
}

id OUTLINED_FUNCTION_19_15()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 3347));
}

id OUTLINED_FUNCTION_20_16()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 3144));
}

uint64_t OUTLINED_FUNCTION_21_18()
{
  return Logger.logObject.getter();
}

id OUTLINED_FUNCTION_22_11()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_24_16(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &a9);
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t JSONDecoder.init()()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t type metadata accessor for JSONEncoder.NonConformingFloatEncodingStrategy()
{
  return MEMORY[0x1E0CAE190]();
}

uint64_t dispatch thunk of JSONEncoder.nonConformingFloatEncodingStrategy.setter()
{
  return MEMORY[0x1E0CAE198]();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t JSONEncoder.init()()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t URL.pathExtension.getter()
{
  return MEMORY[0x1E0CAFD98]();
}

uint64_t URL.absoluteString.getter()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t URL.init(fileURLWithPath:isDirectory:)()
{
  return MEMORY[0x1E0CAFDD8]();
}

uint64_t URL.hasDirectoryPath.getter()
{
  return MEMORY[0x1E0CAFDF8]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
  MEMORY[0x1E0CAFE38](retstr);
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return MEMORY[0x1E0CAFE78]();
}

uint64_t URL.appendingPathComponent(_:)()
{
  return MEMORY[0x1E0CAFE80]();
}

uint64_t static URL.== infix(_:_:)()
{
  return MEMORY[0x1E0CAFED8]();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t URL.path.getter()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t Data.write(to:options:)()
{
  return MEMORY[0x1E0CB0270]();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return MEMORY[0x1E0CB05D8]();
}

uint64_t Date.init(timeIntervalSince1970:)()
{
  return MEMORY[0x1E0CB07B0]();
}

uint64_t Date.timeIntervalSince1970.getter()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t Date.init()()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t UUID.init(uuidString:)()
{
  return MEMORY[0x1E0CB0900]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x1E0CB0910]();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)MEMORY[0x1E0CB0930]();
}

uint64_t static UUID.== infix(_:_:)()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t UUID.uuid.getter()
{
  return MEMORY[0x1E0CB0978]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t Locale.init(identifier:)()
{
  return MEMORY[0x1E0CB0A80]();
}

uint64_t Locale.identifier.getter()
{
  return MEMORY[0x1E0CB0A90]();
}

uint64_t Locale.regionCode.getter()
{
  return MEMORY[0x1E0CB0A98]();
}

uint64_t Locale.languageCode.getter()
{
  return MEMORY[0x1E0CB0B28]();
}

NSLocale __swiftcall Locale._bridgeToObjectiveC()()
{
  return (NSLocale)MEMORY[0x1E0CB0BE0]();
}

uint64_t static Locale.current.getter()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t type metadata accessor for Locale()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse()
{
  return MEMORY[0x1E0D6D1E0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_Sash.appID.getter()
{
  return MEMORY[0x1E0D6DB08]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_Sash()
{
  return MEMORY[0x1E0D6DB10]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ExperienceComponent.layoutExperience.getter()
{
  return MEMORY[0x1E0D6F790]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ExperienceComponent()
{
  return MEMORY[0x1E0D6F7B0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LayoutSnippetComponent.sash.getter()
{
  return MEMORY[0x1E0D6FC68]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LayoutSnippetComponent.hasSash.getter()
{
  return MEMORY[0x1E0D6FC70]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_LayoutSnippetComponent()
{
  return MEMORY[0x1E0D6FC78]();
}

uint64_t type metadata accessor for SignalValue()
{
  return MEMORY[0x1E0DA4728]();
}

uint64_t SignalGatherer.ValuesWithTimings.values.getter()
{
  return MEMORY[0x1E0DA4788]();
}

uint64_t type metadata accessor for SignalGatherer.ValuesWithTimings()
{
  return MEMORY[0x1E0DA4790]();
}

uint64_t dispatch thunk of SignalGatherer.gatherValuesAndTimings(completion:)()
{
  return MEMORY[0x1E0DA47A0]();
}

uint64_t SignalGatherer.init(signals:candidateAppBundleIds:)()
{
  return MEMORY[0x1E0DA47A8]();
}

uint64_t type metadata accessor for SignalGatherer()
{
  return MEMORY[0x1E0DA47B0]();
}

uint64_t dispatch thunk of SignalProviding.id.getter()
{
  return MEMORY[0x1E0DA47C8]();
}

uint64_t DeviceClassSignal.init()()
{
  return MEMORY[0x1E0DA4868]();
}

uint64_t type metadata accessor for DeviceClassSignal()
{
  return MEMORY[0x1E0DA4870]();
}

uint64_t ClientCarplaySignal.init()()
{
  return MEMORY[0x1E0DA48E0]();
}

uint64_t type metadata accessor for ClientCarplaySignal()
{
  return MEMORY[0x1E0DA48E8]();
}

uint64_t type metadata accessor for SignalGathererError()
{
  return MEMORY[0x1E0DA48F0]();
}

uint64_t static AppLaunchCountSignal.instances()()
{
  return MEMORY[0x1E0DA4908]();
}

uint64_t type metadata accessor for AppLaunchCountSignal()
{
  return MEMORY[0x1E0DA4910]();
}

uint64_t ClientDaylightSignal.init()()
{
  return MEMORY[0x1E0DA4920]();
}

uint64_t type metadata accessor for ClientDaylightSignal()
{
  return MEMORY[0x1E0DA4928]();
}

uint64_t ClientHourOfDaySignal.init()()
{
  return MEMORY[0x1E0DA49B8]();
}

uint64_t type metadata accessor for ClientHourOfDaySignal()
{
  return MEMORY[0x1E0DA49C0]();
}

uint64_t ClientTimeRangeSignal.init()()
{
  return MEMORY[0x1E0DA49D0]();
}

uint64_t type metadata accessor for ClientTimeRangeSignal()
{
  return MEMORY[0x1E0DA49D8]();
}

uint64_t dispatch thunk of AppSelectionSignalComponent.name.getter()
{
  return MEMORY[0x1E0DA4AD0]();
}

uint64_t static TimeSinceAppLastLaunchedSignal.instances()()
{
  return MEMORY[0x1E0DA4B08]();
}

uint64_t static TimeSinceAppLastInstalledSignal.instances()()
{
  return MEMORY[0x1E0DA4B10]();
}

uint64_t static AppDisambiguationFrequencySignal.instances()()
{
  return MEMORY[0x1E0DA4B18]();
}

uint64_t static LastAppDisambiguationResultSignal.instances()()
{
  return MEMORY[0x1E0DA4B20]();
}

uint64_t static LastAppDisambiguationRecencySignal.instances()()
{
  return MEMORY[0x1E0DA4B28]();
}

uint64_t static ActionDisambiguationFrequencySignal.instances()()
{
  return MEMORY[0x1E0DA4B30]();
}

uint64_t static LastActionDisambiguationResultSignal.instances()()
{
  return MEMORY[0x1E0DA4B38]();
}

uint64_t static LastActionDisambiguationRecencySignal.instances()()
{
  return MEMORY[0x1E0DA4B40]();
}

uint64_t static SelectedAppDisambiguationFrequencySignal.instances()()
{
  return MEMORY[0x1E0DA4B48]();
}

uint64_t static SelectedActionDisambiguationFrequencySignal.instances()()
{
  return MEMORY[0x1E0DA4B50]();
}

uint64_t isFeatureEnabled(_:)()
{
  return MEMORY[0x1E0D20EF8]();
}

uint64_t type metadata accessor for TokenChain()
{
  return MEMORY[0x1E0D50610]();
}

uint64_t dispatch thunk of ConfigurableAnalyzer.analyzeString(string:)()
{
  return MEMORY[0x1E0D50628]();
}

uint64_t type metadata accessor for ConfigurationFeature()
{
  return MEMORY[0x1E0D50678]();
}

uint64_t dispatch thunk of DefaultAnalyzerFactory.getAnalyzer(locale:)()
{
  return MEMORY[0x1E0D50688]();
}

uint64_t DefaultAnalyzerFactory.init(configOptions:)()
{
  return MEMORY[0x1E0D50690]();
}

uint64_t type metadata accessor for DefaultAnalyzerFactory()
{
  return MEMORY[0x1E0D50698]();
}

uint64_t registerDataPathForLocaleWithError(locale:path:)()
{
  return MEMORY[0x1E0D506A8]();
}

uint64_t Token.cleanValue.getter()
{
  return MEMORY[0x1E0D506B0]();
}

Swift::Bool __swiftcall Token.isSignificant()()
{
  return MEMORY[0x1E0D506B8]();
}

uint64_t type metadata accessor for Token()
{
  return MEMORY[0x1E0D506C0]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UUID()
{
  return MEMORY[0x1E0D9F0E0]();
}

uint64_t Siri_Nlu_External_Parser.ParserIdentifier.rawValue.getter()
{
  return MEMORY[0x1E0D9F130]();
}

uint64_t type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier()
{
  return MEMORY[0x1E0D9F140]();
}

uint64_t Siri_Nlu_External_UsoGraph.identifiers.getter()
{
  return MEMORY[0x1E0D9F230]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UsoGraph()
{
  return MEMORY[0x1E0D9F270]();
}

uint64_t Siri_Nlu_External_UserParse.userDialogActs.getter()
{
  return MEMORY[0x1E0D9F2B8]();
}

uint64_t Siri_Nlu_External_UserParse.repetitionResult.getter()
{
  return MEMORY[0x1E0D9F2D0]();
}

uint64_t Siri_Nlu_External_UserParse.comparableProbability.getter()
{
  return MEMORY[0x1E0D9F2E8]();
}

uint64_t static Siri_Nlu_External_UserParse.== infix(_:_:)()
{
  return MEMORY[0x1E0D9F2F8]();
}

uint64_t Siri_Nlu_External_UserParse.id.getter()
{
  return MEMORY[0x1E0D9F308]();
}

uint64_t Siri_Nlu_External_UserParse.interpretableAsUniversalCommand.getter()
{
  return MEMORY[0x1E0D9F310]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserParse()
{
  return MEMORY[0x1E0D9F340]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasAccepted.getter()
{
  return MEMORY[0x1E0D9F400]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasRejected.getter()
{
  return MEMORY[0x1E0D9F410]();
}

uint64_t Siri_Nlu_External_UserDialogAct.userStatedTask.getter()
{
  return MEMORY[0x1E0D9F448]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserDialogAct()
{
  return MEMORY[0x1E0D9F4B0]();
}

uint64_t Siri_Nlu_External_UserStatedTask.task.getter()
{
  return MEMORY[0x1E0D9F5C8]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserStatedTask()
{
  return MEMORY[0x1E0D9F5E8]();
}

uint64_t type metadata accessor for Siri_Nlu_External_RepetitionResult.RepetitionType()
{
  return MEMORY[0x1E0D9F6D0]();
}

uint64_t Siri_Nlu_External_RepetitionResult.repetitionType.getter()
{
  return MEMORY[0x1E0D9F6E0]();
}

uint64_t type metadata accessor for Siri_Nlu_External_RepetitionResult()
{
  return MEMORY[0x1E0D9F6E8]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UsoEntityIdentifier.NluComponent()
{
  return MEMORY[0x1E0D9F850]();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.sourceComponent.getter()
{
  return MEMORY[0x1E0D9F868]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UsoEntityIdentifier()
{
  return MEMORY[0x1E0D9F890]();
}

uint64_t static SiriNLUTypesPrintUtils.printableProtoObject(object:)()
{
  return MEMORY[0x1E0D9F908]();
}

uint64_t type metadata accessor for SiriNLUTypesPrintUtils()
{
  return MEMORY[0x1E0D9F910]();
}

uint64_t static ConversionUtils.convertProtoToUuid(protoUuid:)()
{
  return MEMORY[0x1E0D9F928]();
}

uint64_t static ConversionUtils.convertUserDialogActToTasks(userDialogAct:)()
{
  return MEMORY[0x1E0D9F938]();
}

uint64_t Siri_Nl_Core_Protocol_UsoEntityIdentifier.NluComponent.init(rawValue:)()
{
  return MEMORY[0x1E0DA03C8]();
}

uint64_t type metadata accessor for Siri_Nl_Core_Protocol_UsoEntityIdentifier.NluComponent()
{
  return MEMORY[0x1E0DA03D0]();
}

uint64_t UsoIdentifier.appBundleId.getter()
{
  return MEMORY[0x1E0DA05E0]();
}

uint64_t type metadata accessor for UsoIdentifier.NluComponent()
{
  return MEMORY[0x1E0DA0620]();
}

uint64_t UsoIdentifier.sourceComponent.getter()
{
  return MEMORY[0x1E0DA0638]();
}

uint64_t UsoIdentifier.value.getter()
{
  return MEMORY[0x1E0DA0678]();
}

uint64_t UsoIdentifier.namespace.getter()
{
  return MEMORY[0x1E0DA0680]();
}

uint64_t type metadata accessor for UsoIdentifier()
{
  return MEMORY[0x1E0DA0688]();
}

uint64_t dispatch thunk of CodeGenGlobalArgs.getUsoIdentifiersFor(attributeName:)()
{
  return MEMORY[0x1E0DA0DB8]();
}

uint64_t static UsoConversionUtils.convertUserDialogActToTasks(userDialogAct:)()
{
  return MEMORY[0x1E0DA0EB8]();
}

uint64_t static UsoTask_CodegenConverter.convert(task:)()
{
  return MEMORY[0x1E0DA12F8]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_Reference.reference.getter()
{
  return MEMORY[0x1E0DA1620]();
}

uint64_t type metadata accessor for UsoTask_run_common_VoiceCommand()
{
  return MEMORY[0x1E0DA2000]();
}

uint64_t type metadata accessor for UsoTask_execute_common_VoiceCommand()
{
  return MEMORY[0x1E0DA2460]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceVoiceCommandPayload.reference.getter()
{
  return MEMORY[0x1E0DA27A8]();
}

uint64_t UsoTask.verbString.getter()
{
  return MEMORY[0x1E0DA2A48]();
}

uint64_t UsoTask.baseEntityAsString.getter()
{
  return MEMORY[0x1E0DA2A50]();
}

uint64_t UsoTask.arguments.getter()
{
  return MEMORY[0x1E0DA2A58]();
}

uint64_t dispatch thunk of UsoValue.getUsoIdentifiers()()
{
  return MEMORY[0x1E0DA2AB0]();
}

uint64_t dispatch thunk of UsoValue.getAsEntity()()
{
  return MEMORY[0x1E0DA2AB8]();
}

uint64_t UsoEntity.attributes.getter()
{
  return MEMORY[0x1E0DA2BA8]();
}

uint64_t UsoEntity.valueTypeString.getter()
{
  return MEMORY[0x1E0DA2BC0]();
}

uint64_t SiriEnvironment.currentDevice.getter()
{
  return MEMORY[0x1E0DA7AB0]();
}

uint64_t static SiriEnvironment.default.getter()
{
  return MEMORY[0x1E0DA7AE8]();
}

uint64_t type metadata accessor for SiriEnvironment()
{
  return MEMORY[0x1E0DA7AF8]();
}

uint64_t type metadata accessor for DeviceIdiom()
{
  return MEMORY[0x1E0DA7CA8]();
}

uint64_t ResponseMode.aceValue.getter()
{
  return MEMORY[0x1E0DA7DD8]();
}

uint64_t type metadata accessor for ResponseMode()
{
  return MEMORY[0x1E0DA7DE8]();
}

uint64_t dispatch thunk of CurrentDevice.deviceIdiom.getter()
{
  return MEMORY[0x1E0DA7E70]();
}

uint64_t dispatch thunk of CurrentDevice.preferencesLanguageCode.getter()
{
  return MEMORY[0x1E0DA7F00]();
}

uint64_t Regex.init(_regexString:version:)()
{
  return MEMORY[0x1E0DF1EB8]();
}

uint64_t Regex.firstMatch(in:)()
{
  return MEMORY[0x1E0DF1EC0]();
}

uint64_t Regex.Match.subscript.getter()
{
  return MEMORY[0x1E0DF1F18]();
}

uint64_t JSONEncodingOptions.init()()
{
  return MEMORY[0x1E0D3EA48]();
}

uint64_t type metadata accessor for JSONEncodingOptions()
{
  return MEMORY[0x1E0D3EA50]();
}

uint64_t Message.jsonString(options:)()
{
  return MEMORY[0x1E0D3EC20]();
}

uint64_t dispatch thunk of PommesResponse.experiences.getter()
{
  return MEMORY[0x1E0D98AC8]();
}

uint64_t dispatch thunk of PommesResponse.primaryCatIds()()
{
  return MEMORY[0x1E0D98AF8]();
}

uint64_t PommesResponse.metadataDomainName.getter()
{
  return MEMORY[0x1E0D98B10]();
}

uint64_t dispatch thunk of PommesResponse.primaryQueryConfidence()()
{
  return MEMORY[0x1E0D98B38]();
}

uint64_t dispatch thunk of PommesResponse.primaryPluginIdentifier()()
{
  return MEMORY[0x1E0D98B50]();
}

uint64_t dispatch thunk of PommesResponse.isPersonalDomainFallback.getter()
{
  return MEMORY[0x1E0D98B58]();
}

uint64_t type metadata accessor for PommesResponse()
{
  return MEMORY[0x1E0D98C70]();
}

uint64_t GenericExperience.components.getter()
{
  return MEMORY[0x1E0D98E30]();
}

uint64_t type metadata accessor for GenericExperience()
{
  return MEMORY[0x1E0D98E48]();
}

uint64_t os_signpost(_:dso:log:name:signpostID:_:_:)()
{
  return MEMORY[0x1E0DF2088]();
}

uint64_t os_signpost(_:dso:log:name:signpostID:)()
{
  return MEMORY[0x1E0DF2090]();
}

uint64_t OSSignpostID.init(log:)()
{
  return MEMORY[0x1E0DF2100]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t Logger.init(_:)()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t type metadata accessor for RRMetadata()
{
  return MEMORY[0x1E0DA3D58]();
}

uint64_t RRCandidate.entity.getter()
{
  return MEMORY[0x1E0DA3D68]();
}

uint64_t type metadata accessor for RRCandidate()
{
  return MEMORY[0x1E0DA3D70]();
}

uint64_t type metadata accessor for RRDataSourceMetadataValue()
{
  return MEMORY[0x1E0DA3DC8]();
}

uint64_t RREntity.id.getter()
{
  return MEMORY[0x1E0DA3E20]();
}

uint64_t RREntity.metadata.getter()
{
  return MEMORY[0x1E0DA3E40]();
}

uint64_t RREntity.usoEntity.getter()
{
  return MEMORY[0x1E0DA3E48]();
}

uint64_t type metadata accessor for RREntity()
{
  return MEMORY[0x1E0DA3E50]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t static DispatchQoS.background.getter()
{
  return MEMORY[0x1E0DEF570]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t static DispatchQoS.userInitiated.getter()
{
  return MEMORY[0x1E0DEF580]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x1E0DEF5B0]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x1E0CB17D8]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t Dictionary.description.getter()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t Dictionary.Keys.description.getter()
{
  return MEMORY[0x1E0DE9E90]();
}

uint64_t type metadata accessor for Dictionary.Keys()
{
  return MEMORY[0x1E0DE9EC0]();
}

uint64_t Dictionary.keys.getter()
{
  return MEMORY[0x1E0DE9EE8]();
}

uint64_t Dictionary<>.encode(to:)()
{
  return MEMORY[0x1E0DEA070]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t BidirectionalCollection<>.starts<A>(with:)()
{
  return MEMORY[0x1E0DF1FA0]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x1E0DEA568]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x1E0CB1940]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return MEMORY[0x1E0CB1988]();
}

uint64_t String.init(data:encoding:)()
{
  return MEMORY[0x1E0CB1990]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x1E0DEA5F8]();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0;
  void *v1;
  Swift::String result;

  v0 = MEMORY[0x1E0DEA610]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.init<A>(reflecting:)()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t String.removeSubrange(_:)()
{
  return MEMORY[0x1E0DEA668]();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t String.index(before:)()
{
  return MEMORY[0x1E0DEA7C8]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x1E0DEA800](a1._countAndFlagsBits, a1._object);
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t String.UTF8View._foreignDistance(from:to:)()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x1E0DEA908]();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return MEMORY[0x1E0DEA940](a1._countAndFlagsBits, a1._object);
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x1E0DEAA08]();
}

{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t Sequence<>.joined(separator:)()
{
  return MEMORY[0x1E0DEABB0]();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1E0DEADA0]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x1E0CB1AC0]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t Array<A>.encode(to:)()
{
  return MEMORY[0x1E0DEAED8]();
}

uint64_t Bool.init(truncating:)()
{
  return MEMORY[0x1E0CB1B20]();
}

Swift::Bool_optional __swiftcall Bool.init(_:)(Swift::String a1)
{
  return (Swift::Bool_optional)MEMORY[0x1E0DEAFE0](a1._countAndFlagsBits, a1._object);
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t static TaskPriority.background.getter()
{
  return MEMORY[0x1E0DF06F8]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t Double.init(truncating:)()
{
  return MEMORY[0x1E0CB1B48]();
}

NSNumber __swiftcall Double._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x1E0CB1B50]();
}

uint64_t Double.init(exactly:)()
{
  return MEMORY[0x1E0CB1B70]();
}

uint64_t Double.write<A>(to:)()
{
  return MEMORY[0x1E0DEB030]();
}

uint64_t Set.description.getter()
{
  return MEMORY[0x1E0DEB220]();
}

uint64_t Set.init(minimumCapacity:)()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t Set.isEmpty.getter()
{
  return MEMORY[0x1E0DEB300]();
}

uint64_t Set.init<A>(_:)()
{
  return MEMORY[0x1E0DEB3B0]();
}

uint64_t Int.init(truncating:)()
{
  return MEMORY[0x1E0CB1C00]();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x1E0CB1C10]();
}

uint64_t static Int._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1E0CB1C20]();
}

uint64_t Int.init(exactly:)()
{
  return MEMORY[0x1E0CB1C30]();
}

Swift::OpaquePointer_optional __swiftcall NLEmbedding.vector(for:)(Swift::String a1)
{
  void *v1;
  Swift::Bool v2;
  Swift::OpaquePointer_optional result;

  v1 = (void *)MEMORY[0x1E0DEFC18](a1._countAndFlagsBits, a1._object);
  result.value._rawValue = v1;
  result.is_nil = v2;
  return result;
}

uint64_t MLMultiArray.init<A>(_:)()
{
  return MEMORY[0x1E0C9E7D0]();
}

{
  return MEMORY[0x1E0C9E7D8]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return MEMORY[0x1E0CB2410]();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)()
{
  return MEMORY[0x1E0DEFF58]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t _HashTable.occupiedBucket(after:)()
{
  return MEMORY[0x1E0DEC070]();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x1E0DEC168](seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return MEMORY[0x1E0DEC280]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x1E0DEC2A8](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t StaticString.description.getter()
{
  return MEMORY[0x1E0DEC338]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t dispatch thunk of _AnySequenceBox._makeIterator()()
{
  return MEMORY[0x1E0DEC888]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x1E0DEC8E0]();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return MEMORY[0x1E0DECAE0](isUnique, capacity);
}

Swift::Void __swiftcall _NativeDictionary.copy()()
{
  MEMORY[0x1E0DECAF8]();
}

uint64_t _NativeDictionary._delete(at:)()
{
  return MEMORY[0x1E0DECB00]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1E0DECBE0]();
}

{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t dispatch thunk of _AnyIteratorBoxBase.next()()
{
  return MEMORY[0x1E0DECD90]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x1E0DECF28](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x1E0DECF58]();
}

{
  return MEMORY[0x1E0DECF60]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x1E0DECFC0]();
}

{
  return MEMORY[0x1E0DED028]();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x1E0DED070]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x1E0DED090]();
}

{
  return MEMORY[0x1E0DED098]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x1E0DED0F0]();
}

{
  return MEMORY[0x1E0DED100]();
}

{
  return MEMORY[0x1E0DED110]();
}

{
  return MEMORY[0x1E0DED140]();
}

{
  return MEMORY[0x1E0DED158]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x1E0DED120]();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return MEMORY[0x1E0DED1B0](a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x1E0DED550]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t _findStringSwitchCaseWithCache(cases:string:cache:)()
{
  return MEMORY[0x1E0DED998]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t Error._code.getter()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t Error._domain.getter()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x1E0DEDEF8]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x1E0DEDF10](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
  MEMORY[0x1E0DEDF30](a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t Mirror.superclassMirror.getter()
{
  return MEMORY[0x1E0DEDF78]();
}

uint64_t Mirror.init(reflecting:)()
{
  return MEMORY[0x1E0DEDF80]();
}

uint64_t Mirror.subjectType.getter()
{
  return MEMORY[0x1E0DEDF90]();
}

uint64_t Mirror.children.getter()
{
  return MEMORY[0x1E0DEDFF8]();
}

uint64_t type metadata accessor for Mirror()
{
  return MEMORY[0x1E0DEE000]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t AFDeviceSupportsFullSiriUOD()
{
  return MEMORY[0x1E0CFE408]();
}

uint64_t AFDeviceSupportsSAE()
{
  return MEMORY[0x1E0CFE438]();
}

uint64_t AFShouldRunAsrOnServerForUOD()
{
  return MEMORY[0x1E0CFE610]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1E0DEEA50]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
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

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1E0DEED80]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

