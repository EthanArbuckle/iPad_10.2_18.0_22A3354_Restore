double sub_2459B85EC@<D0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  double result;

  v4 = *a1;
  v5 = a1[1];
  v6 = *a2;
  v7 = a2[1];
  OUTLINED_FUNCTION_31();
  swift_bridgeObjectRetain();
  if ((sub_2459D189C(v4, v5, v6, v7) & 1) != 0)
  {
    *(_QWORD *)(a3 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  else
  {
    *(_QWORD *)(a3 + 24) = &unk_2516BF3F0;
    *(_QWORD *)(a3 + 32) = &off_2516BF408;
  }
  return result;
}

uint64_t sub_2459B8668(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[21] = a2;
  v3[22] = v2;
  v3[20] = a1;
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_2459B867C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v16;
  os_log_type_t v17;
  _WORD *v18;
  uint64_t v19;
  uint64_t v20;

  v2 = *(_QWORD *)(v1 + 176);
  v3 = *(_QWORD *)(v2 + OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_deviceContext);
  v4 = *(_QWORD *)(v3 + 40);
  if (v4)
  {
    v6 = *(_QWORD *)(v1 + 160);
    v5 = *(_QWORD *)(v1 + 168);
    v7 = *(_QWORD *)(v3 + 32);
    v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2
                                                                   + OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetSpeciferHandler);
    swift_bridgeObjectRetain();
    swift_retain();
    v8(v7, v4, v6, v5);
    swift_release();
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v1 + 80))
    {
      v9 = *(_QWORD *)(v1 + 176);
      sub_2459B9DDC((__int128 *)(v1 + 56), v1 + 16);
      v10 = OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetProvider;
      *(_QWORD *)(v1 + 184) = OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetProvider;
      v11 = (_QWORD *)(v9 + v10);
      OUTLINED_FUNCTION_5();
      __swift_project_boxed_opaque_existential_1(v11, v11[3]);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 40));
      *(_QWORD *)(v1 + 120) = &unk_2516BF3F0;
      *(_QWORD *)(v1 + 128) = &off_2516BF408;
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 96), (uint64_t)&unk_2516BF3F0);
      OUTLINED_FUNCTION_28();
      v12 = sub_2459BFA90();
      OUTLINED_FUNCTION_33(v12);
      v13 = OUTLINED_FUNCTION_28();
      OUTLINED_FUNCTION_16((uint64_t)v13, *(_QWORD *)(v1 + 120));
      v14 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v1 + 192) = v14;
      OUTLINED_FUNCTION_39(v14, (uint64_t)sub_2459B8878);
      return sub_2459BEC50();
    }
    sub_2459BB6C8(v1 + 56, &qword_2574D8DC8);
  }
  else
  {
    if (qword_2574D8AE8 != -1)
      swift_once();
    v16 = OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_23(v16, (uint64_t)qword_2574DA518);
    v17 = OUTLINED_FUNCTION_38();
    if (OUTLINED_FUNCTION_12(v17))
    {
      v18 = (_WORD *)OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_35(v18);
      OUTLINED_FUNCTION_11(&dword_2459B6000, v19, v20, "SafariSummarizationPrefetch - Missing countryCode, unable to subscribe to AssetProvider");
      OUTLINED_FUNCTION_2();
    }

  }
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2459B8878()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_7();
  v1 = v0 + 96;
  OUTLINED_FUNCTION_0();
  __swift_destroy_boxed_opaque_existential_1(v1);
  OUTLINED_FUNCTION_26();
  return OUTLINED_FUNCTION_3();
}

uint64_t sub_2459B88B8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_27(*(_QWORD *)(v0 + 184));
  v1 = (_QWORD *)OUTLINED_FUNCTION_25();
  *(_QWORD *)(v0 + 200) = v1;
  v2 = OUTLINED_FUNCTION_40(v1, (uint64_t)sub_2459B8900);
  return OUTLINED_FUNCTION_17(v2, v3);
}

uint64_t sub_2459B8900()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_26();
  return OUTLINED_FUNCTION_3();
}

uint64_t sub_2459B8934()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return OUTLINED_FUNCTION_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2459B8970(int a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  v5 = sub_2459D9728();
  v7 = v6;
  v3[4] = v6;
  a3;
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = sub_2459BB894;
  return sub_2459B8668(v5, v7);
}

uint64_t sub_2459B89FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D8E00);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2459D9890();
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v6);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  v7[5] = a2;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = &unk_2574D8E10;
  v8[5] = v7;
  sub_2459B9E9C((uint64_t)v5, (uint64_t)&unk_2574D8E20, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_2459B8AD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[18] = a2;
  v3[19] = v2;
  v3[17] = a1;
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_2459B8AEC()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, unint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  _BOOL4 v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  os_log_type_t v20;
  _WORD *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v26;
  uint64_t (*type)(_QWORD *);
  uint64_t v28;

  v2 = *(_QWORD *)(v1 + 152);
  v3 = *(_QWORD *)(v2 + OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_deviceContext);
  v4 = *(_QWORD *)(v3 + 40);
  if (v4)
  {
    v5 = *(_QWORD *)(v3 + 32);
    v7 = *(_QWORD *)(v1 + 136);
    v6 = *(_QWORD *)(v1 + 144);
    v8 = *(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v2
                                                                            + OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetSpeciferHandler);
    OUTLINED_FUNCTION_31();
    swift_retain();
    v8(v5, v4, v7, v6);
    swift_release();
    if (*(_QWORD *)(v1 + 80))
    {
      v9 = *(_QWORD *)(v1 + 152);
      sub_2459B9DDC((__int128 *)(v1 + 56), v1 + 16);
      v10 = OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetProvider;
      *(_QWORD *)(v1 + 160) = OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetProvider;
      v11 = (_QWORD *)(v9 + v10);
      v12 = OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_30(v12, v11[3]);
      OUTLINED_FUNCTION_15();
      if ((sub_2459BA3A0() & 1) == 0)
      {
        OUTLINED_FUNCTION_42();
        OUTLINED_FUNCTION_9();
        OUTLINED_FUNCTION_15();
        type = (uint64_t (*)(_QWORD *))((char *)&dword_2574D8DD8 + dword_2574D8DD8);
        v24 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v1 + 168) = v24;
        OUTLINED_FUNCTION_39(v24, (uint64_t)sub_2459B8E80);
        return type(v11);
      }
      if (qword_2574D8AE8 != -1)
        swift_once();
      v13 = OUTLINED_FUNCTION_24();
      __swift_project_value_buffer(v13, (uint64_t)qword_2574DA518);
      swift_bridgeObjectRetain_n();
      OUTLINED_FUNCTION_31();
      v14 = sub_2459D96A4();
      v15 = sub_2459D98F0();
      v16 = os_log_type_enabled(v14, v15);
      v17 = *(_QWORD *)(v1 + 144);
      if (v16)
      {
        v26 = *(_QWORD *)(v1 + 136);
        v18 = OUTLINED_FUNCTION_8();
        v28 = OUTLINED_FUNCTION_8();
        *(_DWORD *)v18 = 136643075;
        OUTLINED_FUNCTION_31();
        *(_QWORD *)(v1 + 120) = sub_2459D6FF4(v5, v4, &v28);
        sub_2459D9950();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v18 + 12) = 2085;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v1 + 128) = sub_2459D6FF4(v26, v17, &v28);
        sub_2459D9950();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2459B6000, v14, v15, "SafariSummarizationPrefetch - Asset already downloaded, skip triggering force download of asset with countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v18, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_2();
      }

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      __swift_destroy_boxed_opaque_existential_1(v1 + 16);
    }
    else
    {
      OUTLINED_FUNCTION_42();
      sub_2459BB6C8(v1 + 56, &qword_2574D8DC8);
    }
  }
  else
  {
    if (qword_2574D8AE8 != -1)
      swift_once();
    v19 = OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_23(v19, (uint64_t)qword_2574DA518);
    v20 = OUTLINED_FUNCTION_38();
    if (OUTLINED_FUNCTION_12(v20))
    {
      v21 = (_WORD *)OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_35(v21);
      OUTLINED_FUNCTION_11(&dword_2459B6000, v22, v23, "SafariSummarizationPrefetch - Missing countryCode, unable to call forceDownloadAssetsIfNeeded");
      OUTLINED_FUNCTION_2();
    }

  }
  return OUTLINED_FUNCTION_10(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_2459B8E80()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_26();
  return OUTLINED_FUNCTION_3();
}

uint64_t sub_2459B8EB4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_27(*(_QWORD *)(v0 + 160));
  v1 = (_QWORD *)OUTLINED_FUNCTION_25();
  *(_QWORD *)(v0 + 176) = v1;
  v2 = OUTLINED_FUNCTION_40(v1, (uint64_t)sub_2459B8EFC);
  return OUTLINED_FUNCTION_17(v2, v3);
}

uint64_t sub_2459B8EFC()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_26();
  return OUTLINED_FUNCTION_3();
}

uint64_t sub_2459B8F44(void *a1, int a2, void *a3, void *aBlock)
{
  void *v6;
  _QWORD *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v6 = _Block_copy(aBlock);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = a1;
  v8 = a3;
  v9 = a1;
  v10 = OUTLINED_FUNCTION_37();
  return sub_2459B89FC(v10, v11);
}

uint64_t sub_2459B8FB0(int a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  v5 = sub_2459D9728();
  v7 = v6;
  v3[4] = v6;
  a3;
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = sub_2459B903C;
  return sub_2459B8AD8(v5, v7);
}

uint64_t sub_2459B903C()
{
  uint64_t v0;
  uint64_t v1;
  void (**v2)(_QWORD);
  void *v3;

  OUTLINED_FUNCTION_7();
  v3 = *(void **)(v1 + 16);
  v2 = *(void (***)(_QWORD))(v1 + 24);
  OUTLINED_FUNCTION_0();
  swift_bridgeObjectRelease();

  v2[2](v2);
  _Block_release(v2);
  return OUTLINED_FUNCTION_14(*(uint64_t (**)(void))(v0 + 8));
}

id sub_2459B9090(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  id v20;
  uint64_t v22;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D8DD0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2459D9470();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_9();
  v11 = sub_2459D43F8(a1, a2);
  if (!v12)
    goto LABEL_4;
  v13 = (uint64_t)v11;
  v14 = v12;
  sub_2459D9464();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7) == 1)
  {
    swift_bridgeObjectRelease();
    sub_2459BB6C8((uint64_t)v6, &qword_2574D8DD0);
LABEL_4:
    v15 = objc_allocWithZone((Class)type metadata accessor for PrefilterSafariSummarizationPrefetchModel());
    return sub_2459B9AE4(0, 0, 0);
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
  v17 = sub_2459D9434();
  v19 = 0;
  if (v17)
  {
    v18 = *(_QWORD *)(v17 + 16);
    swift_bridgeObjectRelease();
    if (v18)
      v19 = 1;
  }
  v20 = objc_allocWithZone((Class)type metadata accessor for PrefilterSafariSummarizationPrefetchModel());
  v16 = sub_2459B9AE4(v13, v14, v19);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v16;
}

uint64_t sub_2459B9304(uint64_t a1, uint64_t a2)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(sub_2459B9090(a1, a2), sel_prefilterUrl);
  swift_unknownObjectRelease();
  if (!v2)
    return 0;
  v3 = sub_2459D9728();

  return v3;
}

uint64_t sub_2459B9400()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = v0;
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_2459B9410()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_9();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  OUTLINED_FUNCTION_39(v1, (uint64_t)sub_2459B9470);
  return sub_2459BE50C();
}

uint64_t sub_2459B9470()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0();
  return OUTLINED_FUNCTION_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2459B9500(const void *a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v4;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_2459B9560;
  return sub_2459B9400();
}

uint64_t sub_2459B9560()
{
  uint64_t v0;
  uint64_t v1;
  void (**v2)(_QWORD);
  void *v3;

  OUTLINED_FUNCTION_7();
  v2 = *(void (***)(_QWORD))(v1 + 24);
  v3 = *(void **)(v1 + 16);
  OUTLINED_FUNCTION_0();

  v2[2](v2);
  _Block_release(v2);
  return OUTLINED_FUNCTION_20(*(uint64_t (**)(void))(v0 + 8));
}

void sub_2459B95A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_9();
  sub_2459BE8D4();
  v1 = v0 + OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_filter;
  v2 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_16(v2, *(_QWORD *)(v1 + 24));
  sub_2459D2524();
}

uint64_t sub_2459B9648(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  void (*v9)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  _WORD *v15;
  __int128 v17;
  uint64_t v18;
  _QWORD v19[5];

  v3 = v2;
  v4 = *(_QWORD *)(v2 + OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_deviceContext);
  v5 = *(_QWORD *)(v4 + 40);
  if (v5)
  {
    v8 = *(_QWORD *)(v4 + 32);
    v9 = *(void (**)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t))(v3
                                                                                           + OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetSpeciferHandler);
    OUTLINED_FUNCTION_31();
    swift_retain();
    v9(&v17, v8, v5, a1, a2);
    OUTLINED_FUNCTION_42();
    swift_release();
    if (v18)
    {
      sub_2459B9DDC(&v17, (uint64_t)v19);
      v10 = v3 + OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetProvider;
      v11 = OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_16(v11, *(_QWORD *)(v10 + 24));
      __swift_project_boxed_opaque_existential_1(v19, v19[3]);
      sub_2459BAE54();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    }
    else
    {
      sub_2459BB6C8((uint64_t)&v17, &qword_2574D8DC8);
    }
  }
  else
  {
    if (qword_2574D8AE8 != -1)
      swift_once();
    v12 = OUTLINED_FUNCTION_24();
    v13 = OUTLINED_FUNCTION_23(v12, (uint64_t)qword_2574DA518);
    v14 = sub_2459D98D8();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (_WORD *)OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_35(v15);
      _os_log_impl(&dword_2459B6000, v13, v14, "SafariSummarizationPrefetch - Missing countryCode, unable to get Asset Version", 0, 2u);
      OUTLINED_FUNCTION_2();
    }

  }
  return OUTLINED_FUNCTION_37();
}

uint64_t sub_2459B9880()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = v0;
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_2459B9890()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  os_log_type_t v3;
  _WORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  if (qword_2574D8AE8 != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_24();
  v2 = (void *)OUTLINED_FUNCTION_23(v1, (uint64_t)qword_2574DA518);
  v3 = sub_2459D98C0();
  if (OUTLINED_FUNCTION_12(v3))
  {
    v4 = (_WORD *)OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_35(v4);
    OUTLINED_FUNCTION_11(&dword_2459B6000, v5, v6, "SafariSummarizationPrefetch - Loading data for filter");
    OUTLINED_FUNCTION_2();
  }

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_9();
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v7;
  OUTLINED_FUNCTION_39(v7, (uint64_t)sub_2459B9470);
  return sub_2459D268C();
}

void sub_2459B9970()
{
  OUTLINED_FUNCTION_43();
  __break(1u);
}

id sub_2459B99A0()
{
  return sub_2459B9B6C(type metadata accessor for SASafariAssistantAssetManager);
}

uint64_t type metadata accessor for SASafariAssistantAssetManager()
{
  return objc_opt_self();
}

uint64_t sub_2459B9A7C()
{
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_37();
}

uint64_t sub_2459B9AD4()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtC12SearchAssets41PrefilterSafariSummarizationPrefetchModel_hasMatchedPattern);
}

id sub_2459B9AE4(uint64_t a1, uint64_t a2, char a3)
{
  _BYTE *v3;
  _QWORD *v4;
  objc_super v6;

  v4 = &v3[OBJC_IVAR____TtC12SearchAssets41PrefilterSafariSummarizationPrefetchModel_prefilterUrl];
  *v4 = a1;
  v4[1] = a2;
  v3[OBJC_IVAR____TtC12SearchAssets41PrefilterSafariSummarizationPrefetchModel_hasMatchedPattern] = a3;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for PrefilterSafariSummarizationPrefetchModel();
  return objc_msgSendSuper2(&v6, sel_init);
}

void sub_2459B9B30()
{
  OUTLINED_FUNCTION_43();
  __break(1u);
}

id sub_2459B9B60()
{
  return sub_2459B9B6C(type metadata accessor for PrefilterSafariSummarizationPrefetchModel);
}

id sub_2459B9B6C(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for PrefilterSafariSummarizationPrefetchModel()
{
  return objc_opt_self();
}

uint64_t sub_2459B9BD0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
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

uint64_t sub_2459B9C18(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2459B9C38(uint64_t result, int a2, int a3)
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

void type metadata accessor for _opaque_pthread_cond_t(uint64_t a1)
{
  sub_2459B9D1C(a1, &qword_2574D8D50);
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_2459B9C98(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 64))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2459B9CB8(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 56) = 0;
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
  *(_BYTE *)(result + 64) = v3;
  return result;
}

void type metadata accessor for _opaque_pthread_mutex_t(uint64_t a1)
{
  sub_2459B9D1C(a1, &qword_2574D8D58);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_2459B9D1C(a1, &qword_2574D8D60);
}

void sub_2459B9D1C(uint64_t a1, unint64_t *a2)
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495408AC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2459B9DDC(__int128 *a1, uint64_t a2)
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

uint64_t sub_2459B9DF4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_2459BB88C;
  return v6();
}

uint64_t sub_2459B9E48(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_2459BB88C;
  return v7();
}

uint64_t sub_2459B9E9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_2459D9890();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_2459BB6C8(a1, &qword_2574D8E00);
  }
  else
  {
    sub_2459D9884();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2459D9854();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2459B9FE0(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2459BA044;
  return v6(a1);
}

uint64_t sub_2459BA044()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0();
  return OUTLINED_FUNCTION_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2459BA07C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[10] = a1;
  v2 = sub_2459D96BC();
  v1[11] = v2;
  v1[12] = *(_QWORD *)(v2 - 8);
  v1[13] = swift_task_alloc();
  v1[5] = &unk_2516BF3F0;
  v1[6] = &off_2516BF408;
  return swift_task_switch();
}

uint64_t sub_2459BA0F0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v2 = OUTLINED_FUNCTION_30(a1, (uint64_t)&unk_2516BF3F0);
  OUTLINED_FUNCTION_30((uint64_t)v2, *(_QWORD *)(v1 + 40));
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 112) = v3;
  *v3 = v1;
  v3[1] = sub_2459BA150;
  return sub_2459C03BC();
}

uint64_t sub_2459BA150()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_26();
    return OUTLINED_FUNCTION_21();
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1(v2 + 16);
    swift_task_dealloc();
    return OUTLINED_FUNCTION_20(*(uint64_t (**)(void))(v2 + 8));
  }
}

uint64_t sub_2459BA1BC(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  uint64_t v12;

  if (qword_2574D8AE8 != -1)
    a1 = swift_once();
  v2 = *(NSObject **)(v1 + 104);
  OUTLINED_FUNCTION_22(a1, (uint64_t)qword_2574DA518);
  sub_2459D96A4();
  v3 = OUTLINED_FUNCTION_38();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = OUTLINED_FUNCTION_8();
    v12 = OUTLINED_FUNCTION_8();
    *(_DWORD *)v4 = 136315651;
    *(_QWORD *)(v1 + 56) = sub_2459D6FF4(0xD000000000000014, 0x80000002459DC080, &v12);
    v5 = OUTLINED_FUNCTION_32();
    *(_WORD *)(v4 + 12) = 2085;
    *(_QWORD *)(v1 + 64) = OUTLINED_FUNCTION_6(v5, v6, &v12);
    v7 = OUTLINED_FUNCTION_29();
    *(_WORD *)(v4 + 22) = 2085;
    *(_QWORD *)(v1 + 72) = OUTLINED_FUNCTION_6(v7, v8, &v12);
    OUTLINED_FUNCTION_29();
    _os_log_impl(&dword_2459B6000, v2, v3, "SafariSummarizationPrefetch - Failed to update loadedAssets for assetSetName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v4, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2();
  }

  v9 = OUTLINED_FUNCTION_36();
  v10(v9);
  __swift_destroy_boxed_opaque_existential_1(v1 + 16);
  swift_task_dealloc();
  return OUTLINED_FUNCTION_10(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_2459BA3A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[3];
  void *v39;
  _UNKNOWN **v40;

  v0 = sub_2459D96BC();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v34 - v5;
  v39 = &unk_2516BF3F0;
  v40 = &off_2516BF408;
  __swift_project_boxed_opaque_existential_1(v38, (uint64_t)&unk_2516BF3F0);
  swift_beginAccess();
  swift_retain();
  sub_2459D1E14();
  v8 = v7;
  swift_release();
  sub_2459D20C0(v8);
  v10 = v9;
  swift_bridgeObjectRelease();
  if (v10
    && (__swift_project_boxed_opaque_existential_1(v38, (uint64_t)v39),
        sub_2459D20FC(v10),
        v12 = v11,
        swift_bridgeObjectRelease(),
        v12))
  {
    if (qword_2574D8AE8 != -1)
      swift_once();
    v13 = __swift_project_value_buffer(v0, (uint64_t)qword_2574DA518);
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v13, v0);
    v14 = v12;
    v15 = sub_2459D96A4();
    v16 = sub_2459D98F0();
    if (os_log_type_enabled(v15, v16))
    {
      v35 = v1;
      v17 = swift_slowAlloc();
      v34 = swift_slowAlloc();
      v37 = v34;
      *(_DWORD *)v17 = 136315907;
      v18 = objc_msgSend(v14, sel_metadata);
      v19 = sub_2459D96E0();

      if (qword_2574D8A88 != -1)
        swift_once();
      v20 = qword_2574DA458;
      v21 = unk_2574DA460;
      swift_bridgeObjectRetain();
      v22 = sub_2459D213C(v20, v21, v19);
      v24 = v23;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v24)
        v25 = v22;
      else
        v25 = 1701736302;
      if (!v24)
        v24 = 0xE400000000000000;
      v36 = sub_2459D6FF4(v25, v24, &v37);
      sub_2459D9950();

      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2080;
      v36 = sub_2459D6FF4(0xD000000000000014, 0x80000002459DC080, &v37);
      sub_2459D9950();
      *(_WORD *)(v17 + 22) = 2085;
      v36 = sub_2459D6FF4(0x6E6F6D6D6F63, 0xE600000000000000, &v37);
      sub_2459D9950();
      *(_WORD *)(v17 + 32) = 2085;
      v36 = sub_2459D6FF4(0x6E6F6D6D6F63, 0xE600000000000000, &v37);
      sub_2459D9950();
      _os_log_impl(&dword_2459B6000, v15, v16, "SafariSummarizationPrefetch - Has loadedAssets version %s, for assetSetName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v17, 0x2Au);
      v26 = v34;
      swift_arrayDestroy();
      MEMORY[0x249540954](v26, -1, -1);
      MEMORY[0x249540954](v17, -1, -1);

      (*(void (**)(char *, uint64_t))(v35 + 8))(v4, v0);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
    }
    v32 = 1;
  }
  else
  {
    if (qword_2574D8AE8 != -1)
      swift_once();
    v27 = __swift_project_value_buffer(v0, (uint64_t)qword_2574DA518);
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v6, v27, v0);
    v28 = sub_2459D96A4();
    v29 = sub_2459D98F0();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = swift_slowAlloc();
      v31 = swift_slowAlloc();
      v37 = v31;
      *(_DWORD *)v30 = 136315651;
      v36 = sub_2459D6FF4(0xD000000000000014, 0x80000002459DC080, &v37);
      sub_2459D9950();
      *(_WORD *)(v30 + 12) = 2085;
      v36 = sub_2459D6FF4(0x6E6F6D6D6F63, 0xE600000000000000, &v37);
      sub_2459D9950();
      *(_WORD *)(v30 + 22) = 2085;
      v36 = sub_2459D6FF4(0x6E6F6D6D6F63, 0xE600000000000000, &v37);
      sub_2459D9950();
      _os_log_impl(&dword_2459B6000, v28, v29, "SafariSummarizationPrefetch - No loadedAssets for assetSetName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v30, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x249540954](v31, -1, -1);
      MEMORY[0x249540954](v30, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
    v32 = 0;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
  return v32;
}

uint64_t sub_2459BA994(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[17] = a1;
  v1[18] = *a1;
  v2 = sub_2459D96C8();
  v1[19] = v2;
  v1[20] = *(_QWORD *)(v2 - 8);
  v1[21] = swift_task_alloc();
  v3 = sub_2459D96BC();
  v1[22] = v3;
  v1[23] = *(_QWORD *)(v3 - 8);
  v1[24] = swift_task_alloc();
  v1[5] = &unk_2516BF3F0;
  v1[6] = &off_2516BF408;
  return swift_task_switch();
}

void sub_2459BAA38(uint64_t a1)
{
  _QWORD *v1;
  NSObject *v2;
  os_log_type_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
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
  uint64_t v35[14];

  if (qword_2574D8AE8 != -1)
    a1 = swift_once();
  OUTLINED_FUNCTION_22(a1, (uint64_t)qword_2574DA518);
  v2 = sub_2459D96A4();
  v3 = sub_2459D98F0();
  v4 = os_log_type_enabled(v2, v3);
  v5 = v1[22];
  if (v4)
  {
    v31 = v1[24];
    v29 = v1[23];
    v6 = OUTLINED_FUNCTION_8();
    v35[0] = OUTLINED_FUNCTION_8();
    *(_DWORD *)v6 = 136316163;
    v1[12] = sub_2459D6FF4(0xD000000000000011, 0x80000002459DC0A0, v35);
    sub_2459D9950();
    *(_WORD *)(v6 + 12) = 2080;
    v1[13] = OUTLINED_FUNCTION_34(0xD000000000000018, (uint64_t)"bloom-urlpattern-filters", v25, (uint64_t)(v1 + 15), (uint64_t)(v1 + 16), v29, v31, v5);
    v7 = OUTLINED_FUNCTION_32();
    *(_WORD *)(v6 + 22) = 2085;
    v1[14] = OUTLINED_FUNCTION_6(v7, v8, v35);
    v9 = OUTLINED_FUNCTION_29();
    *(_WORD *)(v6 + 32) = 2085;
    v1[15] = OUTLINED_FUNCTION_6(v9, v10, v35);
    OUTLINED_FUNCTION_29();
    *(_WORD *)(v6 + 42) = 2080;
    v1[16] = OUTLINED_FUNCTION_34(0xD00000000000001DLL, (uint64_t)"com.apple.parsec.sba.prefetch", v26, v27, v28, v30, v32, v33);
    OUTLINED_FUNCTION_29();
    _os_log_impl(&dword_2459B6000, v2, v3, "SafariSummarizationPrefetch - Attempting to asynchronously retrieve assets on-demand, for subscriberName: %s, subscriptionName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s, assetName: %s", (uint8_t *)v6, 0x34u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2();
  }

  v11 = OUTLINED_FUNCTION_36();
  v12(v11);
  v13 = v1[17];
  if (!*(_QWORD *)(v13 + 96))
  {
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_15();
    v14 = sub_2459BFA90();
    OUTLINED_FUNCTION_33(v14);
    v13 = v1[17];
  }
  v16 = v1[20];
  v15 = v1[21];
  v18 = v1[18];
  v17 = v1[19];
  sub_2459BB46C(v13 + 40, (uint64_t)(v1 + 7));
  v19 = v1[10];
  v20 = v1[11];
  v21 = (_QWORD *)OUTLINED_FUNCTION_36();
  __swift_project_boxed_opaque_existential_1(v21, v22);
  sub_2459BB4B0();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v16 + 104))(v15, *MEMORY[0x24BEE5480], v17);
  v1[25] = sub_2459D98FC();
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  v23 = swift_allocObject();
  v1[26] = v23;
  *(_QWORD *)(v23 + 16) = v18;
  v34 = **(int **)(v20 + 16) + *(_QWORD *)(v20 + 16);
  v24 = (_QWORD *)swift_task_alloc();
  v1[27] = v24;
  *v24 = v1;
  v24[1] = sub_2459BADC0;
  v35[12] = v19;
  v35[13] = v20;
  __asm { BR              X8 }
}

uint64_t sub_2459BADC0()
{
  uint64_t v0;
  void *v1;

  OUTLINED_FUNCTION_7();
  v1 = *(void **)(v0 + 200);
  OUTLINED_FUNCTION_0();
  swift_release();

  OUTLINED_FUNCTION_26();
  return OUTLINED_FUNCTION_21();
}

uint64_t sub_2459BAE04()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_14(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2459BAE54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v33[4];
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[3];
  void *v39;
  _UNKNOWN **v40;

  v0 = sub_2459D96BC();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = &v33[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v2);
  v6 = &v33[-v5];
  v39 = &unk_2516BF3F0;
  v40 = &off_2516BF408;
  __swift_project_boxed_opaque_existential_1(v38, (uint64_t)&unk_2516BF3F0);
  swift_beginAccess();
  swift_retain();
  sub_2459D1E14();
  v8 = v7;
  swift_release();
  sub_2459D20C0(v8);
  v10 = v9;
  swift_bridgeObjectRelease();
  if (v10)
  {
    __swift_project_boxed_opaque_existential_1(v38, (uint64_t)v39);
    sub_2459D20FC(v10);
    v12 = v11;
    swift_bridgeObjectRelease();
    if (v12)
    {
      v13 = objc_msgSend(v12, sel_metadata);
      v14 = sub_2459D96E0();

      if (qword_2574D8A88 != -1)
        swift_once();
      v15 = qword_2574DA458;
      v16 = unk_2574DA460;
      swift_bridgeObjectRetain();
      v17 = sub_2459D213C(v15, v16, v14);
      v19 = v18;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v19)
      {
        if (qword_2574D8AE8 != -1)
          swift_once();
        v20 = __swift_project_value_buffer(v0, (uint64_t)qword_2574DA518);
        (*(void (**)(_BYTE *, uint64_t, uint64_t))(v1 + 16))(v4, v20, v0);
        swift_bridgeObjectRetain_n();
        v21 = sub_2459D96A4();
        v22 = sub_2459D98F0();
        v23 = v22;
        if (os_log_type_enabled(v21, v22))
        {
          v24 = swift_slowAlloc();
          v34 = v23;
          v25 = v24;
          v35 = swift_slowAlloc();
          v37 = v35;
          *(_DWORD *)v25 = 136315907;
          swift_bridgeObjectRetain();
          v36 = sub_2459D6FF4(v17, v19, &v37);
          sub_2459D9950();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v25 + 12) = 2080;
          v36 = sub_2459D6FF4(0xD000000000000014, 0x80000002459DC080, &v37);
          sub_2459D9950();
          *(_WORD *)(v25 + 22) = 2085;
          v36 = sub_2459D6FF4(0x6E6F6D6D6F63, 0xE600000000000000, &v37);
          sub_2459D9950();
          *(_WORD *)(v25 + 32) = 2085;
          v36 = sub_2459D6FF4(0x6E6F6D6D6F63, 0xE600000000000000, &v37);
          sub_2459D9950();
          _os_log_impl(&dword_2459B6000, v21, (os_log_type_t)v34, "SafariSummarizationPrefetch - Has loadedAssets version %s, for assetSetName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v25, 0x2Au);
          v26 = v35;
          swift_arrayDestroy();
          MEMORY[0x249540954](v26, -1, -1);
          MEMORY[0x249540954](v25, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }

        (*(void (**)(_BYTE *, uint64_t))(v1 + 8))(v4, v0);
        goto LABEL_18;
      }

    }
  }
  if (qword_2574D8AE8 != -1)
    swift_once();
  v27 = __swift_project_value_buffer(v0, (uint64_t)qword_2574DA518);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v1 + 16))(v6, v27, v0);
  v28 = sub_2459D96A4();
  v29 = sub_2459D98F0();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = swift_slowAlloc();
    v31 = swift_slowAlloc();
    v37 = v31;
    *(_DWORD *)v30 = 136315651;
    v36 = sub_2459D6FF4(0xD000000000000014, 0x80000002459DC080, &v37);
    sub_2459D9950();
    *(_WORD *)(v30 + 12) = 2085;
    v36 = sub_2459D6FF4(0x6E6F6D6D6F63, 0xE600000000000000, &v37);
    sub_2459D9950();
    *(_WORD *)(v30 + 22) = 2085;
    v36 = sub_2459D6FF4(0x6E6F6D6D6F63, 0xE600000000000000, &v37);
    sub_2459D9950();
    _os_log_impl(&dword_2459B6000, v28, v29, "SafariSummarizationPrefetch - No loadedAssets for assetSetName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v30, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x249540954](v31, -1, -1);
    MEMORY[0x249540954](v30, -1, -1);
  }

  (*(void (**)(_BYTE *, uint64_t))(v1 + 8))(v6, v0);
  v17 = 0;
LABEL_18:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
  return v17;
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

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_2459BB46C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_2459BB4B0()
{
  unint64_t result;

  result = qword_2574D8DE8;
  if (!qword_2574D8DE8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2574D8DE8);
  }
  return result;
}

uint64_t sub_2459BB4EC()
{
  return swift_deallocObject();
}

void sub_2459BB4FC(void *a1)
{
  sub_2459BE9B8(a1);
}

uint64_t sub_2459BB504()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_2459BB530()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2459BB88C;
  v2 = OUTLINED_FUNCTION_37();
  return v3(v2);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_2459BB5A0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2459BB88C;
  v2 = OUTLINED_FUNCTION_36();
  return v3(v2);
}

uint64_t objectdestroy_16Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2459BB644(uint64_t a1)
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
  v7[1] = sub_2459BB88C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2574D8E18 + dword_2574D8E18))(a1, v4, v5, v6);
}

uint64_t sub_2459BB6C8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2459BB704()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2459BB728(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)OUTLINED_FUNCTION_41();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2459BB794;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2574D8E28 + dword_2574D8E28))(a1, v4);
}

uint64_t sub_2459BB794()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0();
  return OUTLINED_FUNCTION_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2459BB7CC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_41();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_19(v1, (uint64_t)sub_2459BB794);
  return OUTLINED_FUNCTION_13(v2, v3, v4, v5);
}

uint64_t objectdestroy_32Tm()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_2459BB848()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_41();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_19(v1, (uint64_t)sub_2459BB88C);
  return OUTLINED_FUNCTION_13(v2, v3, v4, v5);
}

uint64_t OUTLINED_FUNCTION_0()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_1(uint64_t (*a1)(void))
{
  return a1();
}

void OUTLINED_FUNCTION_2()
{
  JUMPOUT(0x249540954);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_5()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_6(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_2459D6FF4(0x6E6F6D6D6F63, 0xE600000000000000, a3);
}

void OUTLINED_FUNCTION_7()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_slowAlloc();
}

_QWORD *OUTLINED_FUNCTION_9()
{
  _QWORD *v0;

  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

uint64_t OUTLINED_FUNCTION_10(uint64_t (*a1)(void))
{
  return a1();
}

void OUTLINED_FUNCTION_11(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  os_log_type_t v4;
  NSObject *v5;
  uint8_t *v6;

  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

BOOL OUTLINED_FUNCTION_12(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_14(uint64_t (*a1)(void))
{
  return a1();
}

_QWORD *OUTLINED_FUNCTION_15()
{
  _QWORD *v0;
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1(v0, *(_QWORD *)(v1 + 40));
}

_QWORD *OUTLINED_FUNCTION_16(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  return __swift_project_boxed_opaque_existential_1(v2, a2);
}

uint64_t OUTLINED_FUNCTION_17(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_19@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_20(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_21()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_22(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = __swift_project_value_buffer(v2, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v5, v2);
}

uint64_t OUTLINED_FUNCTION_23(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_2459D96A4();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return sub_2459D96BC();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return swift_task_alloc();
}

_QWORD *OUTLINED_FUNCTION_27@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + a1), *(_QWORD *)(v1 + a1 + 24));
  return __swift_project_boxed_opaque_existential_1(v2, *(_QWORD *)(v3 + 40));
}

_QWORD *OUTLINED_FUNCTION_28()
{
  _QWORD *v0;
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1(v0, *(_QWORD *)(v1 + 120));
}

uint64_t OUTLINED_FUNCTION_29()
{
  return sub_2459D9950();
}

_QWORD *OUTLINED_FUNCTION_30(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  return __swift_project_boxed_opaque_existential_1(v2, a2);
}

uint64_t OUTLINED_FUNCTION_31()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_32()
{
  return sub_2459D9950();
}

uint64_t OUTLINED_FUNCTION_33(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 96) = a1;
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  return sub_2459D6FF4(a1, (a2 - 32) | 0x8000000000000000, (uint64_t *)va);
}

_WORD *OUTLINED_FUNCTION_35(_WORD *result)
{
  *result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_36()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_37()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_38()
{
  return sub_2459D98D8();
}

_QWORD *OUTLINED_FUNCTION_39@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *result = v2;
  result[1] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_40@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_41()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_42()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_43()
{
  return _swift_stdlib_reportUnimplementedInitializer();
}

uint64_t sub_2459BBB24()
{
  return 0x6E6F697461727564;
}

uint64_t sub_2459BBB3C()
{
  return 1701869940;
}

BOOL sub_2459BBB4C(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  if (qword_2574D8AF8 != -1)
    goto LABEL_11;
  while (1)
  {
    v2 = *(_QWORD *)(qword_2574DA540 + 16);
    if (!v2)
      break;
    v3 = 0;
    while (1)
    {
      v4 = v3 + 1;
      if (__OFADD__(v3, 1))
        break;
      if (qword_2459DA5C8[*(char *)(qword_2574DA540 + 32 + v3)] == qword_2459DA5C8[a1])
      {
        v5 = *(unsigned __int8 *)(qword_2574DA540 + 32 + v3);
        return v5 == 41;
      }
      ++v3;
      if (v4 == v2)
        goto LABEL_7;
    }
    __break(1u);
LABEL_11:
    swift_once();
  }
LABEL_7:
  v5 = 41;
  return v5 == 41;
}

BOOL sub_2459BBBF4(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  if (qword_2574D8A98 != -1)
    goto LABEL_11;
  while (1)
  {
    v2 = *(_QWORD *)(qword_2574DA478 + 16);
    if (!v2)
      break;
    v3 = 0;
    while (1)
    {
      v4 = v3 + 1;
      if (__OFADD__(v3, 1))
        break;
      if (qword_2459DA5C8[*(char *)(qword_2574DA478 + 32 + v3)] == qword_2459DA5C8[a1])
      {
        v5 = *(unsigned __int8 *)(qword_2574DA478 + 32 + v3);
        return v5 == 41;
      }
      ++v3;
      if (v4 == v2)
        goto LABEL_7;
    }
    __break(1u);
LABEL_11:
    swift_once();
  }
LABEL_7:
  v5 = 41;
  return v5 == 41;
}

uint64_t sub_2459BBC9C(char a1)
{
  return qword_2459DA5C8[a1];
}

void sub_2459BBCB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __n128 *v13;
  __n128 *v14;
  __n128 *v15;
  __n128 *v16;

  switch(*(_QWORD *)(a10 + 16))
  {
    case 0:
      OUTLINED_FUNCTION_5_0();
      sub_2459D9674();
      return;
    case 1:
      OUTLINED_FUNCTION_4_0((uint64_t *)&unk_2574D90F0);
      v10 = OUTLINED_FUNCTION_3_0();
      *(_OWORD *)(v10 + 16) = xmmword_2459DA4A0;
      v11 = v10 + 32;
      v12 = a10 + 32;
      goto LABEL_8;
    case 2:
      OUTLINED_FUNCTION_4_0((uint64_t *)&unk_2574D90F0);
      v13 = (__n128 *)OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_0_0(v13, (__n128)xmmword_2459DA490);
      v11 = (uint64_t)&v13[4].n128_i64[1];
      v12 = a10 + 72;
      goto LABEL_8;
    case 3:
      OUTLINED_FUNCTION_4_0((uint64_t *)&unk_2574D90F0);
      v14 = (__n128 *)OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_0_0(v14, (__n128)xmmword_2459DA480);
      OUTLINED_FUNCTION_6_0();
      v11 = (uint64_t)&v14[7];
      v12 = a10 + 112;
      goto LABEL_8;
    case 4:
      OUTLINED_FUNCTION_4_0((uint64_t *)&unk_2574D90F0);
      v15 = (__n128 *)OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_0_0(v15, (__n128)xmmword_2459DA470);
      OUTLINED_FUNCTION_6_0();
      OUTLINED_FUNCTION_8_0();
      v11 = (uint64_t)&v15[9].n128_i64[1];
      v12 = a10 + 152;
      goto LABEL_8;
    case 5:
      OUTLINED_FUNCTION_4_0((uint64_t *)&unk_2574D90F0);
      v16 = (__n128 *)OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_0_0(v16, (__n128)xmmword_2459DA460);
      OUTLINED_FUNCTION_6_0();
      OUTLINED_FUNCTION_8_0();
      sub_2459BB46C(a10 + 152, (uint64_t)&v16[9].n128_i64[1]);
      v11 = (uint64_t)&v16[12];
      v12 = a10 + 192;
LABEL_8:
      sub_2459BB46C(v12, v11);
      OUTLINED_FUNCTION_5_0();
      sub_2459D9674();
      swift_bridgeObjectRelease();
      break;
    default:
      return;
  }
}

uint64_t sub_2459BBEB8()
{
  unsigned __int8 *v0;

  return sub_2459BBCB0(*v0);
}

BOOL sub_2459BBEC8()
{
  char *v0;

  return sub_2459BBBF4(*v0);
}

BOOL sub_2459BBED0()
{
  char *v0;

  return sub_2459BBB4C(*v0);
}

uint64_t OUTLINED_FUNCTION_0_0(__n128 *a1, __n128 a2)
{
  uint64_t v2;

  a1[1] = a2;
  return sub_2459BB46C(v2 + 32, (uint64_t)&a1[2]);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_4_0(uint64_t *a1)
{
  return __swift_instantiateConcreteTypeFromMangledName(a1);
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  uint64_t v0;
  uint64_t v1;

  return sub_2459BB46C(v0 + 72, v1 + 72);
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  uint64_t v0;
  uint64_t v1;

  return sub_2459BB46C(v0 + 112, v1 + 112);
}

uint64_t sub_2459BBF2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v1 = v0;
  v2 = sub_2459D95FC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  v6 = objc_msgSend((id)objc_opt_self(), sel_currentLocale);
  sub_2459D95F0();

  v7 = sub_2459D95E4();
  v9 = v8;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(_QWORD *)(v1 + 16) = v7;
  *(_QWORD *)(v1 + 24) = v9;
  swift_bridgeObjectRelease();
  v10 = objc_msgSend((id)objc_opt_self(), sel_sharedConfiguration);
  if (v10)
    sub_2459CB02C(v10);
  else
    v11 = 0;
  *(_QWORD *)(v1 + 32) = v10;
  *(_QWORD *)(v1 + 40) = v11;
  OUTLINED_FUNCTION_0_1();
  *(_QWORD *)(v1 + 48) = sub_2459D9614();
  *(_QWORD *)(v1 + 56) = v12;
  OUTLINED_FUNCTION_0_1();
  *(_QWORD *)(v1 + 64) = sub_2459D9620();
  *(_QWORD *)(v1 + 72) = v13;
  OUTLINED_FUNCTION_0_1();
  return v1;
}

uint64_t sub_2459BC058()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2459BC08C()
{
  sub_2459BC058();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DeviceContext()
{
  return objc_opt_self();
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2459BC0D8()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t *sub_2459BC154()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  MEMORY[0x249540954](*(uint64_t *)((char *)v0 + *(_QWORD *)(*v0 + 96)), -1, -1);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 88));
  return v0;
}

uint64_t sub_2459BC1A4()
{
  sub_2459BC154();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AtomicProperty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AtomicProperty);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x249540870](a1, v6, a5);
}

uint64_t sub_2459BC204()
{
  void *v0;

  return sub_2459BD134(v0);
}

uint64_t sub_2459BC210()
{
  return swift_initClassMetadata2();
}

id sub_2459BC25C()
{
  void *v0;

  return objc_msgSend(v0, sel_response);
}

uint64_t sub_2459BC280()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_unknownObjectRelease();
}

uint64_t *sub_2459BC2BC()
{
  uint64_t v0;
  uint64_t *v1;

  if ((*(_BYTE *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 120)) & 1) == 0)
    sub_2459BCC00();
  v1 = sub_2459CB220();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return v1;
}

uint64_t sub_2459BC324()
{
  sub_2459BC2BC();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for NetworkSpan(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for NetworkSpan);
}

uint64_t sub_2459BC350()
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
  unint64_t v13;
  uint64_t v14;
  __n128 *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __n128 v23;
  uint64_t ObjectType;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  int v32;
  unint64_t v33;
  __n128 *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __n128 v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  __n128 *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __n128 v55;
  uint64_t v56;
  uint64_t v57;
  __n128 *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  __n128 v66;
  uint64_t v67;
  __n128 *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __n128 v76;
  uint64_t v77;
  _QWORD *v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  __n128 *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  __n128 v90;
  __n128 v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  __n128 *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  __n128 v103;
  id v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v108;
  void (*v109)(uint64_t, uint64_t);
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void (*v114)(uint64_t, uint64_t, __n128);
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

  v1 = v0;
  v2 = *(_QWORD *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 128));
  sub_2459D98D8();
  v3 = sub_2459D9668();
  sub_2459CB2F8(v3, v4, v5, v6);
  sub_2459D98D8();
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D90F0);
  v8 = OUTLINED_FUNCTION_0_2();
  *(_OWORD *)(v8 + 16) = xmmword_2459DA4A0;
  v9 = *(_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 464) + 8);
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9110);
  v10 = OUTLINED_FUNCTION_11_0();
  v12 = v11;
  *(_QWORD *)(v8 + 56) = MEMORY[0x24BEE0D00];
  v13 = sub_2459BD084();
  *(_QWORD *)(v8 + 64) = v13;
  *(_QWORD *)(v8 + 32) = v10;
  *(_QWORD *)(v8 + 40) = v12;
  v14 = v2;
  sub_2459D9668();
  swift_bridgeObjectRelease();
  sub_2459D98D8();
  v15 = (__n128 *)OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3_1(v15, v16, v17, v18, v19, v20, v21, v22, v108, v115, v120, v7, v23);
  ObjectType = swift_getObjectType();
  v109 = *(void (**)(uint64_t, uint64_t))(v9 + 16);
  v109(ObjectType, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9108);
  v25 = OUTLINED_FUNCTION_10_0();
  v15[3].n128_u64[1] = MEMORY[0x24BEE0D00];
  v15[4].n128_u64[0] = v13;
  v15[2].n128_u64[0] = v25;
  v15[2].n128_u64[1] = v26;
  sub_2459D9668();
  OUTLINED_FUNCTION_14_0();
  v27 = sub_2459BC7A8();
  if ((v30 & 1) != 0)
  {
    sub_2459D98D8();
    v82 = (__n128 *)OUTLINED_FUNCTION_0_2();
    v91 = OUTLINED_FUNCTION_3_1(v82, v83, v84, v85, v86, v87, v88, v89, (uint64_t)v109, v13, v14, v125, v90);
    v114(ObjectType, v9, v91);
    v92 = OUTLINED_FUNCTION_10_0();
    v93 = MEMORY[0x24BEE0D00];
    v81 = v119;
    v82[3].n128_u64[1] = MEMORY[0x24BEE0D00];
    v82[4].n128_u64[0] = v119;
    v82[2].n128_u64[0] = v92;
    v82[2].n128_u64[1] = v94;
    sub_2459D9668();
    v80 = v93;
  }
  else
  {
    v31 = v28;
    v32 = v29;
    v33 = HIDWORD(v29);
    v110 = v27;
    sub_2459D98D8();
    v34 = (__n128 *)OUTLINED_FUNCTION_0_2();
    OUTLINED_FUNCTION_3_1(v34, v35, v36, v37, v38, v39, v40, v41, v110, v13, v14, v125, v42);
    v43 = MEMORY[0x24BEE17F0];
    v44[7] = v45;
    v44[8] = v43;
    v44[4] = v31;
    sub_2459D9668();
    swift_bridgeObjectRelease();
    sub_2459D98D8();
    v46 = (__n128 *)OUTLINED_FUNCTION_0_2();
    v47 = MEMORY[0x24BEE44F0];
    OUTLINED_FUNCTION_3_1(v46, v48, v49, v50, v51, v52, v53, v54, v111, v116, v121, v126, v55);
    v56 = MEMORY[0x24BEE4558];
    *(_QWORD *)(v57 + 56) = v47;
    *(_QWORD *)(v57 + 64) = v56;
    *(_DWORD *)(v57 + 32) = v33;
    OUTLINED_FUNCTION_4_1();
    OUTLINED_FUNCTION_14_0();
    sub_2459D98D8();
    v58 = (__n128 *)OUTLINED_FUNCTION_0_2();
    OUTLINED_FUNCTION_3_1(v58, v59, v60, v61, v62, v63, v64, v65, v112, v117, v122, v127, v66);
    *(_QWORD *)(v67 + 56) = v47;
    *(_QWORD *)(v67 + 64) = v56;
    *(_DWORD *)(v67 + 32) = v32;
    OUTLINED_FUNCTION_4_1();
    OUTLINED_FUNCTION_14_0();
    sub_2459D98D8();
    v68 = (__n128 *)OUTLINED_FUNCTION_0_2();
    OUTLINED_FUNCTION_3_1(v68, v69, v70, v71, v72, v73, v74, v75, v113, v118, v123, v128, v76);
    v77 = MEMORY[0x24BEE1448];
    v78[7] = v79;
    v78[8] = v77;
    v78[4] = v114;
    sub_2459D9668();
    v80 = MEMORY[0x24BEE0D00];
    v81 = v119;
  }
  swift_bridgeObjectRelease();
  sub_2459D98D8();
  v95 = (__n128 *)OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3_1(v95, v96, v97, v98, v99, v100, v101, v102, (uint64_t)v114, v119, v124, v129, v103);
  v104 = *(id *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 472));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9118);
  v105 = OUTLINED_FUNCTION_11_0();
  v95[3].n128_u64[1] = v80;
  v95[4].n128_u64[0] = v81;
  v95[2].n128_u64[0] = v105;
  v95[2].n128_u64[1] = v106;
  sub_2459D9668();
  swift_bridgeObjectRelease();
  sub_2459D98D8();
  return sub_2459D9668();
}

uint64_t sub_2459BC7A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  void *v4;
  void *v5;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
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
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
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
  uint64_t v96;
  uint64_t v97;
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
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  double v118;
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
  char v130;
  char v131;
  char v132;
  char v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  uint64_t v154;

  v1 = OUTLINED_FUNCTION_13_0();
  v2 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 16);
  v3 = v2(v1, v0);
  if (!v3)
    goto LABEL_7;
  v4 = (void *)v3;
  objc_opt_self();
  v5 = (void *)swift_dynamicCastObjCClass();
  if (!v5)
  {

LABEL_7:
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D90F0);
    v27 = OUTLINED_FUNCTION_0_2();
    *(_OWORD *)(v27 + 16) = xmmword_2459DA4A0;
    v2(v1, v0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9108);
    v28 = sub_2459D9764();
    v30 = v29;
    *(_QWORD *)(v27 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v27 + 64) = sub_2459BD084();
    *(_QWORD *)(v27 + 32) = v28;
    *(_QWORD *)(v27 + 40) = v30;
    OUTLINED_FUNCTION_5_1((uint64_t)"UNIDENTIFIED_RESPONSE_TYPE=%{signpost.description:attribute,public}s");
    swift_bridgeObjectRelease();
    sub_2459CB770();
    *(double *)&result = 0.0;
    return result;
  }
  objc_msgSend(v5, sel_statusCode);
  if (!(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v0))
  {

    *(double *)&result = 0.0;
    return result;
  }
  *(_QWORD *)&v150 = 0xD000000000000021;
  *((_QWORD *)&v150 + 1) = 0x80000002459DC3F0;
  v6 = OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_2_0(v6, v7, v8, v9, v10, v11, v12, v13, v109, v113, v119, v121, v126, v130, v134, v138, v142, v146, v150);
  v19 = OUTLINED_FUNCTION_6_1(v14, v15, v16, v17, v18);
  if (v154)
    OUTLINED_FUNCTION_1_0();
  else
    OUTLINED_FUNCTION_7_0(v19, v20, v21, v22, v23, v24, v25, v26, v110, v114);
  *(_QWORD *)&v151 = 0xD00000000000001DLL;
  *((_QWORD *)&v151 + 1) = 0x80000002459DC420;
  v32 = OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_2_0(v32, v33, v34, v35, v36, v37, v38, v39, v110, v114, v120, v122, v127, v131, v135, v139, v143, v147, v151);
  v45 = OUTLINED_FUNCTION_6_1(v40, v41, v42, v43, v44);
  if (v154)
    OUTLINED_FUNCTION_1_0();
  else
    OUTLINED_FUNCTION_7_0(v45, v46, v47, v48, v49, v50, v51, v52, v111, v115);
  v53 = OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_2_0(v53, v54, v55, v56, v57, v58, v59, v60, v111, 0xD00000000000001BLL, 0x80000002459DC440, v123, v128, v132, v136, v140, v144, v148, v152);
  v66 = OUTLINED_FUNCTION_6_1(v61, v62, v63, v64, v65);
  if (v154)
  {
    if (OUTLINED_FUNCTION_1_0())
    {
      v125 = v116;
      goto LABEL_19;
    }
  }
  else
  {
    OUTLINED_FUNCTION_7_0(v66, v67, v68, v69, v70, v71, v72, v73, v112, v116);
  }
  v74 = OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_2_0(v74, v75, v76, v77, v78, v79, v80, v81, v112, 0xD00000000000001BLL, 0x80000002459DC460, v124, v129, v133, v137, v141, v145, v149, v153);
  v87 = OUTLINED_FUNCTION_6_1(v82, v83, v84, v85, v86);
  if (!v154)
  {
    OUTLINED_FUNCTION_7_0(v87, v88, v89, v90, v91, v92, v93, v94, v112, v117);
    goto LABEL_22;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_22:
    swift_bridgeObjectRelease();

    goto LABEL_23;
  }
LABEL_19:
  v95 = *(double *)&v125;
  v96 = OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_2_0(v96, v97, v98, v99, v100, v101, v102, v103, v112, 0xD00000000000001ALL, 0x80000002459DC480, v125, v129, v133, v137, v141, v145, v149, v153);
  swift_bridgeObjectRelease();

  OUTLINED_FUNCTION_6_1(v104, v105, v106, v107, v108);
  if ((OUTLINED_FUNCTION_1_0() & 1) != 0)
  {
    *(double *)&result = v118 - v95;
    return result;
  }
LABEL_23:
  *(double *)&result = 0.0;
  return result;
}

uint64_t sub_2459BCB2C(uint64_t a1, unint64_t a2, double a3)
{
  int v3;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  v6 = HIDWORD(a2);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D90F0);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_2459DA470;
  v8 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v7 + 64) = v8;
  *(_QWORD *)(v7 + 32) = a1;
  v9 = MEMORY[0x24BEE44F0];
  v10 = MEMORY[0x24BEE4558];
  *(_QWORD *)(v7 + 96) = MEMORY[0x24BEE44F0];
  *(_QWORD *)(v7 + 104) = v10;
  *(_DWORD *)(v7 + 72) = v3;
  *(_QWORD *)(v7 + 136) = v9;
  *(_QWORD *)(v7 + 144) = v10;
  v11 = MEMORY[0x24BEE13C8];
  *(_DWORD *)(v7 + 112) = v6;
  v12 = MEMORY[0x24BEE1448];
  *(_QWORD *)(v7 + 176) = v11;
  *(_QWORD *)(v7 + 184) = v12;
  *(double *)(v7 + 152) = a3;
  sub_2459CBE04("statusCode=%{signpost.description:attribute,public}d, download=%{signpost.description:attribute}lu, upload=%{signpost.description:attribute}lu, runtime=%{signpost.description:attribute}f", 186, 2, v7);
  return swift_bridgeObjectRelease();
}

void sub_2459BCC00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 120)) & 1) == 0)
  {
    v2 = sub_2459BC7A8();
    if ((v5 & 1) != 0)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D90F0);
      v6 = OUTLINED_FUNCTION_0_2();
      *(_OWORD *)(v6 + 16) = xmmword_2459DA4A0;
      v7 = OUTLINED_FUNCTION_13_0();
      (*(void (**)(uint64_t, uint64_t))(v1 + 16))(v7, v1);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9108);
      v8 = sub_2459D9764();
      v10 = v9;
      *(_QWORD *)(v6 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v6 + 64) = sub_2459BD084();
      *(_QWORD *)(v6 + 32) = v8;
      *(_QWORD *)(v6 + 40) = v10;
      OUTLINED_FUNCTION_5_1((uint64_t)"UNIDENTIFIED_RESPONSE_TYPE=%{signpost.description:attribute,public}s");
      swift_bridgeObjectRelease();
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, double))(*(_QWORD *)v0 + 568))(v3, v4, *(double *)&v2);
    }
    sub_2459CB770();
  }
}

uint64_t sub_2459BCCF8()
{
  return sub_2459CB788((void (*)(void))sub_2459BD078);
}

uint64_t sub_2459BCD28(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (*(_QWORD *)(a1 + *(_QWORD *)(*(_QWORD *)a1 + 480)))
  {
    swift_unknownObjectRetain();
    if (nw_activity_is_activated())
    {
      nw_activity_complete_with_reason();
    }
    else
    {
      sub_2459D98C0();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D90F0);
      v3 = swift_allocObject();
      *(_OWORD *)(v3 + 16) = xmmword_2459DA4A0;
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D9FC0);
      v4 = sub_2459D9764();
      v6 = v5;
      *(_QWORD *)(v3 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v3 + 64) = sub_2459BD084();
      *(_QWORD *)(v3 + 32) = v4;
      *(_QWORD *)(v3 + 40) = v6;
      sub_2459D9668();
      swift_bridgeObjectRelease();
    }
    a1 = swift_unknownObjectRelease();
  }
  return a2(a1);
}

uint64_t sub_2459BCE68(uint64_t a1, unint64_t a2, double a3)
{
  uint64_t inited;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D90E0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2459DA470;
  if (qword_2574D8AC0 != -1)
    swift_once();
  v7 = (void *)unk_2574DA4D0;
  *(_QWORD *)(inited + 32) = qword_2574DA4C8;
  *(_QWORD *)(inited + 40) = v7;
  v8 = OUTLINED_FUNCTION_9_0();
  swift_bridgeObjectRetain();
  *(_QWORD *)(inited + 48) = objc_msgSend(v8, sel_initWithInteger_, a1);
  if (qword_2574D8AB8 != -1)
    swift_once();
  v9 = unk_2574DA4C0;
  *(_QWORD *)(inited + 56) = qword_2574DA4B8;
  *(_QWORD *)(inited + 64) = v9;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_12_0();
  *(_QWORD *)(inited + 72) = objc_msgSend(v7, sel_initWithDouble_, a3);
  *(_QWORD *)(inited + 80) = 0xD000000000000010;
  *(_QWORD *)(inited + 88) = 0x80000002459DC1A0;
  *(_QWORD *)(inited + 96) = objc_msgSend(OUTLINED_FUNCTION_9_0(), sel_initWithUnsignedInt_, a2);
  if (qword_2574D8AB0 != -1)
    swift_once();
  v10 = unk_2574DA4B0;
  *(_QWORD *)(inited + 104) = qword_2574DA4A8;
  *(_QWORD *)(inited + 112) = v10;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_12_0();
  *(_QWORD *)(inited + 120) = objc_msgSend(v7, sel_initWithUnsignedInt_, HIDWORD(a2));
  sub_2459BD03C();
  return sub_2459D96F8();
}

unint64_t sub_2459BD03C()
{
  unint64_t result;

  result = qword_2574D9C60;
  if (!qword_2574D9C60)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2574D9C60);
  }
  return result;
}

uint64_t sub_2459BD078()
{
  uint64_t v0;

  return sub_2459BCD28(*(_QWORD *)(v0 + 16), *(uint64_t (**)(uint64_t))(v0 + 24));
}

unint64_t sub_2459BD084()
{
  unint64_t result;

  result = qword_2574D9100;
  if (!qword_2574D9100)
  {
    result = MEMORY[0x2495408C4](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2574D9100);
  }
  return result;
}

uint64_t sub_2459BD0C0(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_2459BD0F4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_2574D9120);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2459BD134(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel__timingData);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_2459D96E0();

  return v3;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return swift_dynamicCast();
}

void OUTLINED_FUNCTION_2_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, __int128 a19)
{
  uint64_t v19;

  sub_2459D2074((uint64_t)&a14, v19, &a19);
}

__n128 OUTLINED_FUNCTION_3_1(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, __n128 a13)
{
  __n128 result;

  result = a13;
  a1[1] = a13;
  return result;
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return sub_2459D9668();
}

uint64_t OUTLINED_FUNCTION_5_1(uint64_t a1)
{
  uint64_t v1;

  return sub_2459CBE04(a1, 68, 2, v1);
}

uint64_t OUTLINED_FUNCTION_6_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  return sub_2459BD0C0((uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_7_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  return sub_2459BD0F4((uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return sub_2459D99A4();
}

id OUTLINED_FUNCTION_9_0()
{
  uint64_t v0;

  return objc_allocWithZone(*(Class *)(v0 + 1760));
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return sub_2459D9764();
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return sub_2459D9764();
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return sub_2459D99A4();
}

uint64_t AtomicValue.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  AtomicValue.init(_:)(a1);
  return v2;
}

char *AtomicValue.init(_:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;

  v3 = *(_QWORD *)v1;
  type metadata accessor for Lock();
  swift_allocObject();
  *((_QWORD *)v1 + 2) = Lock.init()();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 80) - 8) + 32))(&v1[*(_QWORD *)(*(_QWORD *)v1 + 96)], a1);
  return v1;
}

void AtomicValue.load()(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_1();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v2 + 80) - 8) + 16))(a1, v1);
  Lock.unlock()();
  OUTLINED_FUNCTION_2_1();
}

void AtomicValue.store(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_1();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v2 + 80) - 8) + 24))(v1, a1);
  swift_endAccess();
  Lock.unlock()();
  OUTLINED_FUNCTION_2_1();
}

void AtomicValue.store(resultOf:)(void (*a1)(_BYTE *))
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
  _BYTE v12[24];
  uint64_t v13;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](a1);
  v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v9 = &v12[-v8];
  Lock.lock()();
  v10 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 96);
  swift_beginAccess();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16))(v7, v10, v3);
  v11 = v13;
  a1(v7);
  OUTLINED_FUNCTION_0_3();
  if (!v11)
  {
    swift_beginAccess();
    (*(void (**)(uint64_t, _BYTE *, uint64_t))(v4 + 40))(v10, v9, v3);
    swift_endAccess();
  }
  sub_2459BD508();
}

void sub_2459BD508()
{
  Lock.unlock()();
}

uint64_t *AtomicValue.deinit()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_release();
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 96));
  return v0;
}

uint64_t AtomicValue.__deallocating_deinit()
{
  AtomicValue.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2459BD590()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for AtomicValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AtomicValue);
}

uint64_t method lookup function for AtomicValue()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AtomicValue.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  uint64_t v0;

  return v0 + *(_QWORD *)(*(_QWORD *)v0 + 96);
}

void OUTLINED_FUNCTION_3_2()
{
  Lock.lock()();
}

id sub_2459BD674(uint64_t a1, unint64_t a2)
{
  void *v2;
  void *v3;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;

  v3 = v2;
  v14 = *MEMORY[0x24BDAC8D0];
  swift_getObjectType();
  v6 = objc_msgSend(v3, sel_newHashesArray, sub_2459BD784(a1, a2), v14);
  v7 = MEMORY[0x24953FE5C](&v13, 8);
  v9 = v8;
  v10 = (void *)sub_2459D956C();

  v11 = objc_msgSend(v3, sel_getWithHashes_, v6);
  sub_2459BDE5C(v7, v9);

  return v11;
}

uint64_t sub_2459BD784(uint64_t a1, unint64_t a2)
{
  return sub_2459BD78C(a1, a2, 8);
}

uint64_t sub_2459BD78C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v3 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v3 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v3)
    return -1;
  v5 = sub_2459BD7F4();
  v7 = v6;
  v8 = sub_2459BDA68(v5, v6, a3);
  sub_2459BDE48(v5, v7);
  return v8;
}

uint64_t sub_2459BD7F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD v9[2];

  v0 = sub_2459D9758();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2459D974C();
  v4 = sub_2459D9734();
  v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v6 >> 60 != 15)
  {
    v7 = sub_2459D9848();
    *(_QWORD *)(v7 + 16) = 32;
    *(_OWORD *)(v7 + 32) = 0u;
    *(_OWORD *)(v7 + 48) = 0u;
    v9[1] = v7;
    __asm { BR              X10 }
  }
  return v4;
}

uint64_t sub_2459BDA68(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  if (a2 >> 60 == 15)
    return -1;
  if (a3 < 0)
  {
    __break(1u);
LABEL_13:
    v5 = (uint64_t)sub_2459BE178(v5);
    goto LABEL_8;
  }
  v3 = a2;
  v4 = a1;
  if (a3 >= 8)
    v7 = 8;
  else
    v7 = a3;
  sub_2459BDEA0(a1, a2);
  v5 = sub_2459BDBC0(0, v7);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    goto LABEL_13;
LABEL_8:
  v8 = sub_2459D9560();
  v10 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D91B0);
  sub_2459BE18C();
  sub_2459BE220(&qword_2574D91C0, &qword_2574D91B0, MEMORY[0x24BEE1BC0]);
  sub_2459D93F8();
  sub_2459BDE5C(v8, v10);
  v6 = *(_QWORD *)(v5 + 32);
  swift_bridgeObjectRelease();
  if (v6 < 0)
    v6 = -v6;
  sub_2459BDE48(v4, v3);
  return v6;
}

uint64_t sub_2459BDBC0(int a1, size_t a2)
{
  uint64_t v4;
  uint64_t result;

  if ((a2 & 0x8000000000000000) != 0)
  {
    result = sub_2459D9A10();
    __break(1u);
  }
  else
  {
    if (!a2)
      return MEMORY[0x24BEE4AF8];
    v4 = sub_2459D9848();
    *(_QWORD *)(v4 + 16) = a2;
    memset((void *)(v4 + 32), a1, a2);
    return v4;
  }
  return result;
}

unsigned __int8 *sub_2459BDC78(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v7;
  CC_LONG v8;
  unsigned __int8 *result;

  v7 = sub_2459D9584();
  if ((v7 & 0x8000000000000000) != 0 || (v8 = v7, HIDWORD(v7)))
  {
    result = (unsigned __int8 *)sub_2459D9A10();
    __break(1u);
  }
  else
  {
    sub_2459BDEE4(0);
    return CC_SHA256(a1, v8, (unsigned __int8 *)(*(_QWORD *)a5 + 32));
  }
  return result;
}

uint64_t sub_2459BDD6C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D91C8);
  v10 = sub_2459BE220(&qword_2574D91D0, &qword_2574D91C8, MEMORY[0x24BDCFBE0]);
  v8[0] = a1;
  v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  v3 = *v2 + 32;
  v4 = v3 + *(_QWORD *)(*v2 + 16);
  swift_bridgeObjectRetain();
  sub_2459BDF44(v3, v4, &v7);
  swift_bridgeObjectRelease();
  v5 = v7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

unint64_t sub_2459BDE24(uint64_t a1, unint64_t a2)
{
  return (unint64_t)sub_2459BD674(a1, a2) & 1;
}

uint64_t sub_2459BDE48(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2459BDE5C(a1, a2);
  return a1;
}

uint64_t sub_2459BDE5C(uint64_t a1, unint64_t a2)
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

uint64_t sub_2459BDEA0(uint64_t a1, unint64_t a2)
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

char *sub_2459BDEE4(int64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  char *result;
  int64_t v5;

  v3 = *v1;
  result = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)result || a1 > *(_QWORD *)(v3 + 24) >> 1)
  {
    if (*(_QWORD *)(v3 + 16) <= a1)
      v5 = a1;
    else
      v5 = *(_QWORD *)(v3 + 16);
    result = sub_2459C7E54(result, v5, 0, v3);
    v3 = (uint64_t)result;
  }
  *v1 = v3;
  return result;
}

uint64_t sub_2459BDF44@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
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
    result = sub_2459D953C();
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = MEMORY[0x24953FE2C]();
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = MEMORY[0x24953FE38]();
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_2459BDFB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t result;
  char *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;

  result = sub_2459D947C();
  v12 = (char *)result;
  if (result)
  {
    result = sub_2459D9494();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v12 += a1 - result;
  }
  v13 = __OFSUB__(a2, a1);
  v14 = a2 - a1;
  if (v13)
  {
    __break(1u);
    goto LABEL_13;
  }
  v15 = sub_2459D9488();
  if (v15 >= v14)
    v16 = v14;
  else
    v16 = v15;
  v17 = &v12[v16];
  if (v12)
    v18 = (uint64_t)v17;
  else
    v18 = 0;
  sub_2459BDC78(v12, v18, a4, a5, a6);
  return sub_2459BDE5C(a4, a5);
}

uint64_t sub_2459BE084(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v9;
  __int16 v10;
  char v11;
  char v12;
  char v13;
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v10 = a2;
  v11 = BYTE2(a2);
  v12 = BYTE3(a2);
  v13 = BYTE4(a2);
  v14 = BYTE5(a2);
  sub_2459BDC78(&v9, (uint64_t)&v9 + a3, a4, a5, a6);
  return sub_2459BDE5C(a4, a5);
}

char *sub_2459BE178(uint64_t a1)
{
  return sub_2459C7E54(0, *(_QWORD *)(a1 + 16), 0, a1);
}

unint64_t sub_2459BE18C()
{
  unint64_t result;

  result = qword_2574D91B8;
  if (!qword_2574D91B8)
  {
    result = MEMORY[0x2495408C4](MEMORY[0x24BDCDDC0], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2574D91B8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495408B8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2459BE20C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2459BDEA0(a1, a2);
  return a1;
}

uint64_t sub_2459BE220(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2495408C4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_2459BE260()
{
  qword_2574DA448 = 0x6E756F632E616273;
  unk_2574DA450 = 0xEF65646F63797274;
}

void sub_2459BE290()
{
  qword_2574DA458 = 0x6E6F6973726576;
  unk_2574DA460 = 0xE700000000000000;
}

_QWORD *sub_2459BE2B4(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = v3;
  v3[4] = 0;
  swift_unknownObjectWeakInit();
  v8 = objc_msgSend((id)objc_opt_self(), sel_sharedManager);
  v3[8] = sub_2459C5F88(0, &qword_2574D93B0);
  v3[9] = &off_2516BE718;
  v3[5] = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D93B8);
  sub_2459C5194();
  v9 = sub_2459D96F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D93C8);
  OUTLINED_FUNCTION_3_0();
  sub_2459C853C(v9);
  v4[11] = v10;
  v4[12] = 0;
  v4[2] = a1;
  swift_beginAccess();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  OUTLINED_FUNCTION_3_0();
  sub_2459C853C(a2);
  v4[11] = v11;
  swift_endAccess();
  OUTLINED_FUNCTION_14_0();
  swift_release();
  *((_BYTE *)v4 + 80) = a3;
  return v4;
}

uint64_t sub_2459BE42C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  if (*(_QWORD *)(v0 + 96))
  {
    swift_unknownObjectRetain();
    sub_2459C0358();
    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_5();
  swift_retain();
  sub_2459D1E14();
  v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9450);
  OUTLINED_FUNCTION_46();
  sub_2459D1FD4(v3);
  swift_release();
  swift_release();
  sub_2459C5F04(v0 + 24);
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  swift_release();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_2459BE4EC()
{
  sub_2459BE42C();
  return swift_deallocClassInstance();
}

uint64_t sub_2459BE50C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 64) = v0;
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_2459BE51C()
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
  _QWORD *v11;
  uint64_t v13;

  v1 = *(_QWORD *)(v0 + 64);
  OUTLINED_FUNCTION_5();
  swift_retain();
  sub_2459D1E14();
  v13 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9450);
  v3 = OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_145(v3, v4, v5, v6, v7, v8, v9, v10, v13);
  swift_release();
  if (*(_QWORD *)(v1 + 96))
  {
    swift_unknownObjectRetain();
    sub_2459C0358();
    swift_unknownObjectRelease();
  }
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v11;
  *v11 = v0;
  v11[1] = sub_2459BE5D0;
  return sub_2459BF7B8();
}

uint64_t sub_2459BE5D0()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_7();
  *v2 = *v1;
  *(_QWORD *)(v3 + 80) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_26();
  return OUTLINED_FUNCTION_3();
}

uint64_t sub_2459BE620()
{
  os_log_type_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  _WORD *v5;

  if (qword_2574D8AE8 != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_24();
  v3 = OUTLINED_FUNCTION_23(v2, (uint64_t)qword_2574DA518);
  v4 = sub_2459D98F0();
  if (OUTLINED_FUNCTION_12(v4))
  {
    v5 = (_WORD *)OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_35(v5);
    OUTLINED_FUNCTION_36_0(&dword_2459B6000, v3, v0, "SafariSummarizationPrefetch - Successfully cleaned cache");
    OUTLINED_FUNCTION_2();
  }

  return OUTLINED_FUNCTION_14(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_2459BE6C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _QWORD *a20,uint64_t a21,uint64_t a22)
{
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  os_log_type_t v27;
  _BOOL4 v28;
  void *v29;
  uint64_t v30;
  _QWORD *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  OUTLINED_FUNCTION_38_0();
  a21 = v23;
  a22 = v24;
  a20 = v22;
  if (qword_2574D8AE8 != -1)
    swift_once();
  v25 = v22[10];
  v26 = OUTLINED_FUNCTION_24();
  __swift_project_value_buffer(v26, (uint64_t)qword_2574DA518);
  OUTLINED_FUNCTION_115();
  OUTLINED_FUNCTION_115();
  OUTLINED_FUNCTION_148();
  v27 = OUTLINED_FUNCTION_38();
  v28 = os_log_type_enabled(v25, v27);
  v29 = (void *)v22[10];
  if (v28)
  {
    v30 = OUTLINED_FUNCTION_8();
    v31 = (_QWORD *)OUTLINED_FUNCTION_8();
    a11 = OUTLINED_FUNCTION_8();
    *(_DWORD *)v30 = 138412802;
    v32 = v29;
    v33 = _swift_stdlib_bridgeErrorToNSError();
    v22[5] = v33;
    OUTLINED_FUNCTION_22_0();
    *v31 = v33;
    OUTLINED_FUNCTION_63();
    OUTLINED_FUNCTION_63();
    *(_WORD *)(v30 + 12) = 2080;
    v22[6] = OUTLINED_FUNCTION_27_0(v34, 0x80000002459DC0A0, &a11);
    OUTLINED_FUNCTION_22_0();
    *(_WORD *)(v30 + 22) = 2080;
    v22[7] = sub_2459D6FF4(0xD000000000000014, 0x80000002459DC080, &a11);
    OUTLINED_FUNCTION_22_0();
    OUTLINED_FUNCTION_73(&dword_2459B6000, v25, v27, "SafariSummarizationPrefetch - Failed to unsubscribe with error: %@, from subscription name %s, assetSetName: %s", (uint8_t *)v30);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574D93E8);
    OUTLINED_FUNCTION_33_0();
    OUTLINED_FUNCTION_2();
  }
  OUTLINED_FUNCTION_63();
  OUTLINED_FUNCTION_63();
  OUTLINED_FUNCTION_63();

  OUTLINED_FUNCTION_52();
  return v35(v35, v36, v37, v38, v39, v40, v41, v42, a9, a10, a11, a12, a13, a14);
}

void sub_2459BE8D4()
{
  uint64_t v0;
  uint64_t v1;
  os_log_type_t v2;
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
  NSObject *v13;
  os_log_type_t v14;
  _WORD *v15;
  uint64_t v16;

  OUTLINED_FUNCTION_5();
  v1 = *(_QWORD *)(v0 + 88);
  swift_retain();
  v2 = v1;
  sub_2459D1E14();
  v16 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9450);
  v4 = OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_145(v4, v5, v6, v7, v8, v9, v10, v11, v16);
  swift_release();
  if (qword_2574D8AE8 != -1)
    swift_once();
  v12 = OUTLINED_FUNCTION_24();
  v13 = OUTLINED_FUNCTION_23(v12, (uint64_t)qword_2574DA518);
  v14 = sub_2459D98F0();
  if (OUTLINED_FUNCTION_120(v14))
  {
    v15 = (_WORD *)OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_35(v15);
    OUTLINED_FUNCTION_36_0(&dword_2459B6000, v13, v2, "SafariSummarizationPrefetch - Successfully cleaned cache");
    OUTLINED_FUNCTION_2();
  }

}

void sub_2459BE9B8(void *a1)
{
  uint64_t v2;
  os_log_type_t v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  _WORD *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (qword_2574D8AE8 != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_24();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2574DA518);
  v4 = a1;
  v5 = sub_2459D96A4();
  v6 = sub_2459D98F0();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = OUTLINED_FUNCTION_8();
    v8 = OUTLINED_FUNCTION_8();
    v20 = v8;
    *(_DWORD *)v7 = 134219522;
    v17 = OUTLINED_FUNCTION_111(v8, sel_downloadStatus);
    OUTLINED_FUNCTION_8_2();
    *(_WORD *)(v7 + 12) = 2048;
    objc_msgSend(v4, sel_completedPercent, v17, v20);
    v9 = OUTLINED_FUNCTION_8_2();
    *(_WORD *)(v7 + 22) = 2048;
    OUTLINED_FUNCTION_111(v9, sel_completedBytes);
    v10 = OUTLINED_FUNCTION_8_2();
    *(_WORD *)(v7 + 32) = 2048;
    OUTLINED_FUNCTION_111(v10, sel_totalBytes);
    OUTLINED_FUNCTION_8_2();

    *(_WORD *)(v7 + 42) = 2080;
    OUTLINED_FUNCTION_28_0();
    v18 = OUTLINED_FUNCTION_27_0(v11, v12, &v20);
    OUTLINED_FUNCTION_8_2();
    *(_WORD *)(v7 + 52) = 2080;
    v19 = OUTLINED_FUNCTION_91(0xD000000000000018, (uint64_t)"bloom-urlpattern-filters", v18);
    OUTLINED_FUNCTION_8_2();
    *(_WORD *)(v7 + 62) = 2080;
    OUTLINED_FUNCTION_91(0xD00000000000001DLL, (uint64_t)"com.apple.parsec.sba.prefetch", v19);
    OUTLINED_FUNCTION_22_0();
    _os_log_impl(&dword_2459B6000, v5, v6, "SafariSummarizationPrefetch - Progress retrieving assets on-demand has downloadStatus: %lu, completedPercent: %f%%, completedBytes: %ld, totalBytes: %ld, for subscriberName: %s, subscriptionName: %s, assetName: %s", (uint8_t *)v7, 0x48u);
    OUTLINED_FUNCTION_151();
    OUTLINED_FUNCTION_2();
  }

  if (OUTLINED_FUNCTION_111(v13, sel_downloadStatus) == (id)4)
  {
    v14 = sub_2459D96A4();
    v15 = sub_2459D98F0();
    if (OUTLINED_FUNCTION_120(v15))
    {
      v16 = (_WORD *)OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_35(v16);
      OUTLINED_FUNCTION_36_0(&dword_2459B6000, v14, v3, "SafariSummarizationPrefetch - Progress retrieving assets on-demand complete. Asset downloaded (or skipped)");
      OUTLINED_FUNCTION_2();
    }

  }
}

uint64_t sub_2459BEC50()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[39] = v0;
  v2 = OUTLINED_FUNCTION_24();
  v1[40] = v2;
  v1[41] = *(_QWORD *)(v2 - 8);
  v1[42] = OUTLINED_FUNCTION_12_1();
  v1[43] = OUTLINED_FUNCTION_12_1();
  v1[44] = OUTLINED_FUNCTION_12_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9430);
  v1[45] = OUTLINED_FUNCTION_26_0();
  v3 = sub_2459D95D8();
  v1[46] = v3;
  v1[47] = *(_QWORD *)(v3 - 8);
  v1[48] = OUTLINED_FUNCTION_12_1();
  v1[49] = OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_26();
  return OUTLINED_FUNCTION_3();
}

uint64_t sub_2459BECF8()
{
  uint64_t v0;
  uint64_t inited;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  os_log_type_t v24;
  _BOOL4 v25;
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
  void (*v40)(uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(unint64_t);
  uint64_t v45;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D93F0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2459DA490;
  if (qword_2574D8A80 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 392);
  v3 = *(_QWORD *)(v0 + 368);
  v43 = *(_QWORD *)(v0 + 376);
  v4 = *(_QWORD *)(v0 + 360);
  v5 = unk_2574DA450;
  *(_QWORD *)(inited + 32) = qword_2574DA448;
  *(_QWORD *)(inited + 40) = v5;
  *(_QWORD *)(inited + 48) = 0x6E6F6D6D6F63;
  *(_QWORD *)(inited + 56) = 0xE600000000000000;
  *(_QWORD *)(inited + 64) = 0xD000000000000010;
  *(_QWORD *)(inited + 72) = 0x80000002459DC670;
  *(_QWORD *)(inited + 80) = 0x6E6F6D6D6F63;
  *(_QWORD *)(inited + 88) = 0xE600000000000000;
  swift_bridgeObjectRetain();
  v6 = sub_2459D96F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9438);
  v7 = swift_initStackObject();
  *(_OWORD *)(v7 + 16) = xmmword_2459DA4A0;
  *(_QWORD *)(v7 + 32) = 0xD000000000000014;
  *(_QWORD *)(v7 + 40) = 0x80000002459DC080;
  *(_QWORD *)(v7 + 48) = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9440);
  v8 = sub_2459D96F8();
  sub_2459D95C0();
  sub_2459D9590();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 16))(v4, v2, v3);
  __swift_storeEnumTagSinglePayload(v4, 0, 1, v3);
  v9 = objc_allocWithZone(MEMORY[0x24BEBEE80]);
  OUTLINED_FUNCTION_28_0();
  v12 = sub_2459C5310(v10, v11, v8, 0, v4);
  *(_QWORD *)(v0 + 424) = v12;
  if (v12)
  {
    v13 = v12;
    sub_2459BB46C(*(_QWORD *)(v0 + 312) + 40, v0 + 168);
    v14 = *(_QWORD *)(v0 + 200);
    v15 = (_QWORD *)OUTLINED_FUNCTION_69();
    __swift_project_boxed_opaque_existential_1(v15, v16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9448);
    v17 = OUTLINED_FUNCTION_3_0();
    *(_OWORD *)(v17 + 16) = xmmword_2459DA8F0;
    *(_QWORD *)(v17 + 32) = v13;
    v45 = v17;
    sub_2459D983C();
    *(_QWORD *)(v0 + 400) = v45;
    v44 = (uint64_t (*)(unint64_t))(**(int **)(v14 + 8) + *(_QWORD *)(v14 + 8));
    v18 = v13;
    v19 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 408) = v19;
    *v19 = v0;
    v19[1] = sub_2459BF1D4;
    OUTLINED_FUNCTION_28_0();
    return v44(0xD000000000000011);
  }
  else
  {
    if (qword_2574D8AE8 != -1)
      swift_once();
    v21 = *(_QWORD *)(v0 + 328);
    v22 = __swift_project_value_buffer(*(_QWORD *)(v0 + 320), (uint64_t)qword_2574DA518);
    OUTLINED_FUNCTION_11_1(v22, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 16));
    v23 = (void *)sub_2459D96A4();
    v24 = sub_2459D98D8();
    v25 = OUTLINED_FUNCTION_95(v24);
    v26 = *(_QWORD *)(v0 + 392);
    v27 = *(_QWORD *)(v0 + 368);
    v28 = *(_QWORD *)(v0 + 344);
    v29 = *(_QWORD *)(v0 + 320);
    v30 = *(_QWORD *)(v0 + 328);
    if (v25)
    {
      v42 = *(_QWORD *)(v0 + 376);
      v41 = *(_QWORD *)(v0 + 320);
      v31 = OUTLINED_FUNCTION_8();
      v32 = OUTLINED_FUNCTION_8();
      v45 = v32;
      *(_DWORD *)v31 = 136315907;
      *(_QWORD *)(v0 + 232) = OUTLINED_FUNCTION_27_0(v32, 0x80000002459DC0A0, &v45);
      OUTLINED_FUNCTION_92();
      *(_WORD *)(v31 + 12) = 2080;
      *(_QWORD *)(v0 + 208) = OUTLINED_FUNCTION_125(0xD000000000000014, (uint64_t)"arizationPrefetchModel", v0 + 224, v28, v30, v41, v26, v42, v27, (uint64_t)"arizationPrefetchModel");
      v33 = OUTLINED_FUNCTION_92();
      *(_WORD *)(v31 + 22) = 2085;
      *(_QWORD *)(v0 + 216) = OUTLINED_FUNCTION_6(v33, v34, &v45);
      v35 = OUTLINED_FUNCTION_137();
      *(_WORD *)(v31 + 32) = 2085;
      *(_QWORD *)(v0 + 224) = OUTLINED_FUNCTION_6(v35, v36, &v45);
      OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_84(&dword_2459B6000, v37, v38, "SafariSummarizationPrefetch - Failed to initialize UAFAssetSetSubscription for subscription name %s, assetSetName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s");
      OUTLINED_FUNCTION_173();
      OUTLINED_FUNCTION_2();
    }

    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v28, v29);
    v39 = OUTLINED_FUNCTION_69();
    v40(v39);
    OUTLINED_FUNCTION_51();
    OUTLINED_FUNCTION_70();
    OUTLINED_FUNCTION_64();
    OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_66();
    OUTLINED_FUNCTION_65();
    return OUTLINED_FUNCTION_24_0(*(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_2459BF1D4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_118();
  *v3 = *v2;
  *(_QWORD *)(v0 + 416) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_26();
  return OUTLINED_FUNCTION_21();
}

uint64_t sub_2459BF22C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  os_log_type_t v4;
  _BOOL4 v5;
  void *v6;
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
  void (*v21)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  __swift_destroy_boxed_opaque_existential_1(v0 + 168);
  if (qword_2574D8AE8 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 328);
  v2 = __swift_project_value_buffer(*(_QWORD *)(v0 + 320), (uint64_t)qword_2574DA518);
  OUTLINED_FUNCTION_11_1(v2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16));
  v3 = (void *)sub_2459D96A4();
  v4 = sub_2459D98F0();
  v5 = OUTLINED_FUNCTION_95(v4);
  v6 = *(void **)(v0 + 424);
  v7 = *(_QWORD *)(v0 + 392);
  v8 = *(_QWORD *)(v0 + 368);
  v9 = *(_QWORD *)(v0 + 352);
  v10 = *(_QWORD *)(v0 + 320);
  v11 = *(_QWORD *)(v0 + 328);
  if (v5)
  {
    v25 = *(_QWORD *)(v0 + 376);
    v24 = *(_QWORD *)(v0 + 352);
    v12 = OUTLINED_FUNCTION_8();
    v13 = OUTLINED_FUNCTION_8();
    v26 = v13;
    *(_DWORD *)v12 = 136315907;
    *(_QWORD *)(v0 + 280) = OUTLINED_FUNCTION_27_0(v13, 0x80000002459DC0A0, &v26);
    OUTLINED_FUNCTION_92();
    *(_WORD *)(v12 + 12) = 2080;
    *(_QWORD *)(v0 + 288) = OUTLINED_FUNCTION_125(0xD000000000000014, (uint64_t)"arizationPrefetchModel", v23, (uint64_t)v6, v10, v24, v11, v25, v7, v8);
    v14 = OUTLINED_FUNCTION_137();
    *(_WORD *)(v12 + 22) = 2085;
    *(_QWORD *)(v0 + 296) = OUTLINED_FUNCTION_6(v14, v15, &v26);
    v16 = OUTLINED_FUNCTION_29();
    *(_WORD *)(v12 + 32) = 2085;
    *(_QWORD *)(v0 + 304) = OUTLINED_FUNCTION_6(v16, v17, &v26);
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_84(&dword_2459B6000, v18, v19, "SafariSummarizationPrefetch - Successfully UAFAssetSetManager.subscribed to assets with subscriberName: %s, assetSetName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s");
    OUTLINED_FUNCTION_173();
    OUTLINED_FUNCTION_2();
  }

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  v20 = OUTLINED_FUNCTION_69();
  v21(v20);
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_65();
  return OUTLINED_FUNCTION_24_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2459BF480()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  uint64_t v27;
  uint64_t v28;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 168);
  if (qword_2574D8AE8 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 328);
  v1 = *(_QWORD *)(v0 + 336);
  v3 = *(_QWORD *)(v0 + 320);
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2574DA518);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  OUTLINED_FUNCTION_115();
  OUTLINED_FUNCTION_115();
  v5 = OUTLINED_FUNCTION_148();
  v6 = sub_2459D98D8();
  v7 = os_log_type_enabled(v5, v6);
  v9 = *(void **)(v0 + 416);
  v8 = *(void **)(v0 + 424);
  v10 = *(_QWORD *)(v0 + 336);
  v27 = *(_QWORD *)(v0 + 328);
  v11 = *(_QWORD *)(v0 + 320);
  if (v7)
  {
    v12 = OUTLINED_FUNCTION_8();
    v13 = (_QWORD *)OUTLINED_FUNCTION_8();
    v28 = OUTLINED_FUNCTION_8();
    *(_DWORD *)v12 = 138413315;
    v14 = v9;
    v15 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 240) = v15;
    OUTLINED_FUNCTION_144();
    *v13 = v15;
    OUTLINED_FUNCTION_45();
    OUTLINED_FUNCTION_45();
    *(_WORD *)(v12 + 12) = 2080;
    OUTLINED_FUNCTION_28_0();
    *(_QWORD *)(v0 + 248) = OUTLINED_FUNCTION_27_0(v16, v17, &v28);
    OUTLINED_FUNCTION_18();
    *(_WORD *)(v12 + 22) = 2080;
    OUTLINED_FUNCTION_28_0();
    *(_QWORD *)(v0 + 256) = sub_2459D6FF4(v18, v19, &v28);
    v20 = OUTLINED_FUNCTION_18();
    *(_WORD *)(v12 + 32) = 2085;
    *(_QWORD *)(v0 + 264) = OUTLINED_FUNCTION_6(v20, v21, &v28);
    v22 = OUTLINED_FUNCTION_18();
    *(_WORD *)(v12 + 42) = 2085;
    *(_QWORD *)(v0 + 272) = OUTLINED_FUNCTION_6(v22, v23, &v28);
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_140(&dword_2459B6000, v5, v6, "SafariSummarizationPrefetch - Failed to UAFAssetSetManager.subscribe error: %@, subscriberName: %s, assetSetName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s");
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574D93E8);
    OUTLINED_FUNCTION_33_0();
    OUTLINED_FUNCTION_2();
  }

  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_45();

  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v10, v11);
  v24 = OUTLINED_FUNCTION_69();
  v25(v24);
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_65();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2459BF7B8()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  *(_QWORD *)(v1 + 24) = *v0;
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_2459BF7D0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 16);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v2;
  *v2 = v0;
  v2[1] = sub_2459BF864;
  OUTLINED_FUNCTION_26();
  return sub_2459D9AD0();
}

uint64_t sub_2459BF864()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_118();
  *v3 = *v2;
  *(_QWORD *)(v0 + 48) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_task_dealloc();
  OUTLINED_FUNCTION_26();
  return OUTLINED_FUNCTION_21();
}

uint64_t sub_2459BF8BC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2459BF8C8()
{
  uint64_t v0;

  swift_task_dealloc();
  return OUTLINED_FUNCTION_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2459BF8F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9428);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2459BB46C(a2 + 40, (uint64_t)v14);
  v8 = v15;
  v9 = v16;
  __swift_project_boxed_opaque_existential_1(v14, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v10 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v11 + v10, v7, v4);
  (*(void (**)(unint64_t, unint64_t, void *, _QWORD, uint64_t (*)(void *), uint64_t, uint64_t, uint64_t))(v9 + 48))(0xD000000000000011, 0x80000002459DC0A0, &unk_2516BE038, 0, sub_2459C5EC4, v11, v8, v9);
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
}

uint64_t sub_2459BFA30(void *a1)
{
  id v1;

  if (a1)
  {
    v1 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9428);
    return sub_2459D9860();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9428);
    return sub_2459D986C();
  }
}

uint64_t sub_2459BFA90()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD *, _QWORD, uint64_t (*)(), uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  _QWORD v9[4];
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  v1 = *v0;
  sub_2459BB46C((uint64_t)(v0 + 5), (uint64_t)v10);
  v2 = v11;
  v3 = v12;
  __swift_project_boxed_opaque_existential_1(v10, v11);
  v9[3] = MEMORY[0x24BEE0D00];
  v9[0] = 0xD000000000000014;
  v9[1] = 0x80000002459DC080;
  v4 = OUTLINED_FUNCTION_3_0();
  swift_weakInit();
  v5 = OUTLINED_FUNCTION_3_0();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = v1;
  v6 = *(uint64_t (**)(_QWORD *, _QWORD, uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v3 + 24);
  swift_retain();
  v7 = v6(v9, 0, sub_2459C5DB0, v5, v2, v3);
  swift_release();
  OUTLINED_FUNCTION_150();
  sub_2459BB6C8((uint64_t)v9, qword_2574D9120);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  return v7;
}

uint64_t sub_2459BFBA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t);
  uint64_t Strong;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41[3];

  v37 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D8E00);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2459D96BC();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v32 - v10;
  v38 = a1 + 16;
  if (qword_2574D8AE8 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v5, (uint64_t)qword_2574DA518);
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v35 = v12;
  v36 = v13;
  ((void (*)(char *))v13)(v11);
  v14 = sub_2459D96A4();
  v15 = sub_2459D98F0();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc();
    v32 = v4;
    v17 = v16;
    v18 = swift_slowAlloc();
    v41[0] = v18;
    *(_DWORD *)v17 = 136315651;
    v34 = v9;
    v40 = sub_2459D6FF4(0xD000000000000014, 0x80000002459DC080, v41);
    v33 = v5;
    sub_2459D9950();
    *(_WORD *)(v17 + 12) = 2085;
    v40 = sub_2459D6FF4(0x6E6F6D6D6F63, 0xE600000000000000, v41);
    sub_2459D9950();
    *(_WORD *)(v17 + 22) = 2085;
    v40 = sub_2459D6FF4(0x6E6F6D6D6F63, 0xE600000000000000, v41);
    v5 = v33;
    v9 = v34;
    sub_2459D9950();
    _os_log_impl(&dword_2459B6000, v14, v15, "SafariSummarizationPrefetch - Observing referenced assetSet is updated for assetSetName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v17, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x249540954](v18, -1, -1);
    v19 = v17;
    v4 = v32;
    MEMORY[0x249540954](v19, -1, -1);
  }

  v20 = *(void (**)(char *, uint64_t))(v6 + 8);
  v20(v11, v5);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v22 = Strong;
    v23 = sub_2459D9890();
    __swift_storeEnumTagSinglePayload((uint64_t)v4, 1, 1, v23);
    v24 = (_QWORD *)swift_allocObject();
    v24[2] = 0;
    v24[3] = 0;
    v25 = v37;
    v24[4] = v22;
    v24[5] = v25;
    sub_2459D229C((uint64_t)v4, (uint64_t)&unk_2574D9420, (uint64_t)v24);
    return swift_release();
  }
  else
  {
    v36(v9, v35, v5);
    v27 = sub_2459D96A4();
    v28 = sub_2459D98D8();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = swift_slowAlloc();
      v30 = swift_slowAlloc();
      v40 = v30;
      *(_DWORD *)v29 = 136315651;
      v34 = v9;
      v39 = sub_2459D6FF4(0xD000000000000014, 0x80000002459DC080, &v40);
      sub_2459D9950();
      *(_WORD *)(v29 + 12) = 2085;
      v39 = sub_2459D6FF4(0x6E6F6D6D6F63, 0xE600000000000000, &v40);
      sub_2459D9950();
      *(_WORD *)(v29 + 22) = 2085;
      v39 = sub_2459D6FF4(0x6E6F6D6D6F63, 0xE600000000000000, &v40);
      sub_2459D9950();
      _os_log_impl(&dword_2459B6000, v27, v28, "SafariSummarizationPrefetch - Failed to update loadedAssets due to self for assetSetName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v29, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x249540954](v30, -1, -1);
      MEMORY[0x249540954](v29, -1, -1);

      v31 = v34;
    }
    else
    {

      v31 = v9;
    }
    return ((uint64_t (*)(char *, uint64_t))v20)(v31, v5);
  }
}

uint64_t sub_2459C0080()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = sub_2459D96BC();
  v0[5] = v1;
  v0[6] = *(_QWORD *)(v1 - 8);
  v0[7] = swift_task_alloc();
  v2 = (_QWORD *)swift_task_alloc();
  v0[8] = v2;
  *v2 = v0;
  v2[1] = sub_2459C00F0;
  return sub_2459C03BC();
}

uint64_t sub_2459C00F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  _QWORD *v4;

  OUTLINED_FUNCTION_118();
  v3 = *v2;
  *v4 = v3;
  *(_QWORD *)(v0 + 72) = v1;
  swift_task_dealloc();
  if (v1)
  {
    OUTLINED_FUNCTION_26();
    return OUTLINED_FUNCTION_21();
  }
  else
  {
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v3 + 8))();
  }
}

uint64_t sub_2459C0150()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  os_log_type_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  uint64_t v16;

  if (qword_2574D8AE8 != -1)
    swift_once();
  v1 = *(NSObject **)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v4 = __swift_project_value_buffer((uint64_t)v1, (uint64_t)qword_2574DA518);
  (*(void (**)(uint64_t, uint64_t, NSObject *))(v3 + 16))(v2, v4, v1);
  OUTLINED_FUNCTION_148();
  v5 = OUTLINED_FUNCTION_38();
  if (os_log_type_enabled(v1, v5))
  {
    v6 = swift_slowAlloc();
    v16 = OUTLINED_FUNCTION_8();
    *(_DWORD *)v6 = 136315651;
    OUTLINED_FUNCTION_28_0();
    v8 = sub_2459D6FF4(0xD000000000000014, v7, &v16);
    OUTLINED_FUNCTION_90(v8);
    v9 = OUTLINED_FUNCTION_137();
    *(_WORD *)(v6 + 12) = 2085;
    *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_6(v9, v10, &v16);
    v11 = OUTLINED_FUNCTION_110();
    *(_WORD *)(v6 + 22) = 2085;
    *(_QWORD *)(v0 + 32) = OUTLINED_FUNCTION_6(v11, v12, &v16);
    OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_73(&dword_2459B6000, v1, v5, "SafariSummarizationPrefetch - Failed to update loadedAssets for assetSetName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v6);
    OUTLINED_FUNCTION_151();
    OUTLINED_FUNCTION_2();
  }

  v13 = OUTLINED_FUNCTION_36();
  v14(v13);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2459C0358()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t);
  _QWORD v4[4];

  sub_2459BB46C(v0 + 40, (uint64_t)v4);
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  v1 = OUTLINED_FUNCTION_36();
  v2(v1);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
}

uint64_t sub_2459C03BC()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1[43] = v0;
  v1[44] = *v0;
  v2 = OUTLINED_FUNCTION_24();
  v1[45] = v2;
  v1[46] = *(_QWORD *)(v2 - 8);
  v1[47] = OUTLINED_FUNCTION_12_1();
  v1[48] = OUTLINED_FUNCTION_12_1();
  v1[49] = OUTLINED_FUNCTION_12_1();
  v1[50] = OUTLINED_FUNCTION_12_1();
  v1[51] = OUTLINED_FUNCTION_12_1();
  v1[52] = OUTLINED_FUNCTION_12_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D93E0);
  v1[53] = OUTLINED_FUNCTION_26_0();
  v3 = sub_2459D9530();
  v1[54] = v3;
  v1[55] = *(_QWORD *)(v3 - 8);
  v1[56] = OUTLINED_FUNCTION_12_1();
  v1[57] = OUTLINED_FUNCTION_12_1();
  v1[58] = OUTLINED_FUNCTION_12_1();
  v4 = sub_2459D9608();
  v1[59] = v4;
  v1[60] = *(_QWORD *)(v4 - 8);
  v1[61] = OUTLINED_FUNCTION_26_0();
  sub_2459D9650();
  v1[62] = OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_26();
  return OUTLINED_FUNCTION_3();
}

uint64_t sub_2459C04BC()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t inited;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  char v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  os_log_type_t v25;
  uint64_t v26;
  _QWORD *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  uint64_t v35;
  _BYTE *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  _BOOL4 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t (*v55)(void);
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  NSObject *v94;
  _BOOL4 v95;
  NSObject *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  NSObject *v110;
  id v111;
  os_log_type_t v112;
  _BOOL4 v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  _QWORD *v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  _QWORD *v126;
  os_log_type_t v127;
  _WORD *v128;
  uint64_t v129;
  uint64_t v130;
  _BYTE *v131;
  id v132;
  id v133;
  NSObject *v134;
  os_log_type_t v135;
  _BOOL4 v136;
  uint64_t v137;
  id v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void (*v146)(uint64_t);
  NSObject *v147;
  _QWORD *v148;
  os_log_type_t v149;
  os_log_type_t v150;
  _QWORD *v151;
  uint64_t v152;
  unint64_t v153;
  void *v154;
  uint64_t v155[2];

  v1 = v0;
  v2 = v0[62];
  v3 = v0[43];
  v4 = *(_QWORD **)(v3 + 16);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[60] + 104))(v0[61], *MEMORY[0x24BE712E0], v0[59]);
  swift_retain();
  sub_2459D965C();
  type metadata accessor for ResourceAccessSpan();
  swift_allocObject();
  v5 = sub_2459D02F8(v4, 34, v2, 0, 1);
  v6 = v5;
  v0[63] = v5;
  if ((*(_BYTE *)(v3 + 80) & 1) == 0)
    *(_BYTE *)(v5 + qword_2574D9C88) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D93F0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2459DA490;
  if (qword_2574D8A80 != -1)
    swift_once();
  v8 = v0[43];
  v9 = unk_2574DA450;
  *(_QWORD *)(inited + 32) = qword_2574DA448;
  *(_QWORD *)(inited + 40) = v9;
  *(_QWORD *)(inited + 48) = 0x6E6F6D6D6F63;
  *(_QWORD *)(inited + 56) = 0xE600000000000000;
  *(_QWORD *)(inited + 64) = 0xD000000000000010;
  *(_QWORD *)(inited + 72) = 0x80000002459DC670;
  *(_QWORD *)(inited + 80) = 0x6E6F6D6D6F63;
  *(_QWORD *)(inited + 88) = 0xE600000000000000;
  swift_bridgeObjectRetain();
  v10 = sub_2459D96F8();
  v11 = (void *)MEMORY[0x2495404BC]();
  sub_2459C19D0(v8, v10, v6, v155);
  objc_autoreleasePoolPop(v11);
  OUTLINED_FUNCTION_17_0();
  v12 = (void *)v155[0];
  v0[64] = v155[0];
  v13 = v12;
  v14 = objc_msgSend(v12, sel_location);
  if (!v14)
  {
    __swift_storeEnumTagSinglePayload(v0[53], 1, 1, v0[54]);
    goto LABEL_9;
  }
  v15 = v14;
  v11 = 0;
  v16 = v0[57];
  v17 = v0[54];
  v18 = v0[55];
  v19 = v0[53];
  sub_2459D94E8();

  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32);
  v20(v19, v16, v17);
  __swift_storeEnumTagSinglePayload(v19, 0, 1, v17);
  if (__swift_getEnumTagSinglePayload(v19, 1, v17) == 1)
  {
LABEL_9:
    sub_2459BB6C8(v0[53], &qword_2574D93E0);
    OUTLINED_FUNCTION_106(qword_2574D9C80);
    if (qword_2574D8AE8 != -1)
      v22 = swift_once();
    v23 = v0[48];
    OUTLINED_FUNCTION_5_2(v22, (uint64_t)qword_2574DA518);
    v24 = v13;
    OUTLINED_FUNCTION_141();
    v25 = OUTLINED_FUNCTION_38();
    if (os_log_type_enabled(v23, v25))
    {
      v26 = OUTLINED_FUNCTION_8();
      v27 = (_QWORD *)OUTLINED_FUNCTION_8();
      v155[0] = OUTLINED_FUNCTION_8();
      *(_DWORD *)v26 = 138412803;
      v0[30] = v11;
      v28 = v11;
      sub_2459D9950();
      *v27 = v11;

      *(_WORD *)(v26 + 12) = 2085;
      v0[29] = OUTLINED_FUNCTION_6(v29, v30, v155);
      v31 = OUTLINED_FUNCTION_29();
      *(_WORD *)(v26 + 22) = 2085;
      v0[22] = OUTLINED_FUNCTION_6(v31, v32, v155);
      OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_73(&dword_2459B6000, v23, v25, "SafariSummarizationPrefetch - Failed to get asset location for asset: %@, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v26);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2574D93E8);
      OUTLINED_FUNCTION_33_0();
      OUTLINED_FUNCTION_2();
    }

    v33 = OUTLINED_FUNCTION_36();
    v34(v33);
    sub_2459C5454();
    v35 = OUTLINED_FUNCTION_10_1();
    OUTLINED_FUNCTION_29_0(v35, v36);

    OUTLINED_FUNCTION_171();
    goto LABEL_19;
  }
  v20(v0[58], v0[53], v0[54]);
  v21 = sub_2459D94DC();
  v151 = v0 + 26;
  v37 = v0 + 43;
  v38 = v13;
  if ((v21 & 1) != 0)
  {
    if (qword_2574D8AE8 != -1)
      swift_once();
    v39 = v0[46];
    v40 = __swift_project_value_buffer(v0[45], (uint64_t)qword_2574DA518);
    OUTLINED_FUNCTION_11_1(v40, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v39 + 16));
    v13 = v13;
    v41 = sub_2459D96A4();
    v42 = sub_2459D98F0();
    v43 = os_log_type_enabled(v41, v42);
    v44 = v0[52];
    v45 = v0[45];
    v46 = v0[46];
    if (v43)
    {
      v47 = OUTLINED_FUNCTION_8();
      v149 = v42;
      v48 = (_QWORD *)OUTLINED_FUNCTION_8();
      v155[0] = OUTLINED_FUNCTION_8();
      *(_DWORD *)v47 = 138412803;
      v0[40] = v13;
      v147 = v41;
      v49 = v13;
      sub_2459D9950();
      *v48 = v13;

      *(_WORD *)(v47 + 12) = 2085;
      v0[41] = OUTLINED_FUNCTION_6(v50, v51, v155);
      v52 = OUTLINED_FUNCTION_18();
      *(_WORD *)(v47 + 22) = 2085;
      v54 = OUTLINED_FUNCTION_6(v52, v53, v155);
      OUTLINED_FUNCTION_90(v54);
      OUTLINED_FUNCTION_18();
      OUTLINED_FUNCTION_73(&dword_2459B6000, v147, v149, "SafariSummarizationPrefetch - Successfully retrieved reachable asset location for asset: %@, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v47);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2574D93E8);
      OUTLINED_FUNCTION_33_0();
      OUTLINED_FUNCTION_2();
    }

    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v44, v45);
    v37 = v0 + 43;
  }
  v154 = v38;
  v57 = objc_msgSend(v38, sel_metadata);
  v58 = sub_2459D96E0();

  if (qword_2574D8A88 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  v59 = OUTLINED_FUNCTION_36();
  v61 = sub_2459D213C(v59, v60, v58);
  v63 = v62;
  OUTLINED_FUNCTION_17_0();
  swift_bridgeObjectRelease();
  v0[65] = v63;
  if (!v63)
  {
    OUTLINED_FUNCTION_78(qword_2574D9C80);
    if (qword_2574D8AE8 != -1)
      v109 = swift_once();
    v110 = v0[49];
    OUTLINED_FUNCTION_5_2(v109, (uint64_t)qword_2574DA518);
    v111 = v154;
    OUTLINED_FUNCTION_141();
    v112 = OUTLINED_FUNCTION_38();
    v113 = OUTLINED_FUNCTION_104(v112);
    v114 = v0[49];
    v115 = v1[45];
    v116 = v1[46];
    if (v113)
    {
      v117 = OUTLINED_FUNCTION_8();
      v118 = (_QWORD *)OUTLINED_FUNCTION_8();
      v155[0] = OUTLINED_FUNCTION_8();
      *(_DWORD *)v117 = 138412803;
      *v151 = v37;
      v119 = v37;
      sub_2459D9950();
      *v118 = v37;

      *(_WORD *)(v117 + 12) = 2085;
      v122 = OUTLINED_FUNCTION_6(v120, v121, v155);
      OUTLINED_FUNCTION_90(v122);
      v123 = OUTLINED_FUNCTION_92();
      *(_WORD *)(v117 + 22) = 2085;
      v1[28] = OUTLINED_FUNCTION_6(v123, v124, v155);
      OUTLINED_FUNCTION_110();
      OUTLINED_FUNCTION_73(&dword_2459B6000, v110, (os_log_type_t)v13, "SafariSummarizationPrefetch - Failed to get asset metadata version for asset: %@, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v117);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2574D93E8);
      OUTLINED_FUNCTION_33_0();
      OUTLINED_FUNCTION_2();
    }

    (*(void (**)(uint64_t, uint64_t))(v116 + 8))(v114, v115);
    OUTLINED_FUNCTION_147();
    v130 = OUTLINED_FUNCTION_10_1();
    OUTLINED_FUNCTION_29_0(v130, v131);
    OUTLINED_FUNCTION_150();

    OUTLINED_FUNCTION_119((uint64_t)v110, *(uint64_t (**)(uint64_t, uint64_t))(v114 + 8));
LABEL_19:
    swift_task_dealloc();
    OUTLINED_FUNCTION_70();
    OUTLINED_FUNCTION_64();
    OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_66();
    OUTLINED_FUNCTION_65();
    OUTLINED_FUNCTION_155();
    OUTLINED_FUNCTION_169();
    OUTLINED_FUNCTION_174();
    OUTLINED_FUNCTION_124();
    swift_task_dealloc();
    swift_task_dealloc();
    v55 = (uint64_t (*)(void))v1[1];
    return v55();
  }
  v152 = v61;
  v153 = v63;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_157();
  sub_2459D1E14();
  v65 = v64;
  swift_release();
  sub_2459D20C0(v65);
  v67 = v66;
  swift_bridgeObjectRelease();
  if (!v67)
    goto LABEL_34;
  sub_2459D20FC(v67);
  v69 = v68;
  OUTLINED_FUNCTION_17_0();
  if (!v69)
    goto LABEL_34;
  v70 = objc_msgSend(v69, sel_metadata);
  v71 = sub_2459D96E0();

  v72 = qword_2574DA458;
  v73 = unk_2574DA460;
  swift_bridgeObjectRetain();
  v74 = sub_2459D213C(v72, v73, v71);
  v76 = v75;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v76)
  {
LABEL_33:

LABEL_34:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574D93F8);
    v80 = swift_initStackObject();
    *(_OWORD *)(v80 + 16) = xmmword_2459DA4A0;
    *(_QWORD *)(v80 + 32) = v154;
    sub_2459C5F88(0, &qword_2574D9400);
    sub_2459C5CEC();
    v81 = v154;
    v82 = sub_2459D96F8();
    swift_retain();
    sub_2459D1E14();
    v84 = v83;
    swift_isUniquelyReferenced_nonNull_native();
    v155[0] = v84;
    sub_2459D1290(v82);
    v85 = v155[0];
    swift_bridgeObjectRelease();
    sub_2459D1FD4(v85);
    swift_release();
    if (qword_2574D8AE8 != -1)
      swift_once();
    v86 = v0[58];
    v88 = v0[55];
    v87 = v0[56];
    v89 = v0[54];
    v90 = v0[50];
    v91 = v0[45];
    v92 = v0[46];
    v93 = __swift_project_value_buffer(v91, (uint64_t)qword_2574DA518);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v92 + 16))(v90, v93, v91);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v88 + 16))(v87, v86, v89);
    OUTLINED_FUNCTION_113();
    v94 = sub_2459D96A4();
    v150 = sub_2459D98F0();
    v95 = os_log_type_enabled(v94, v150);
    v96 = v0[56];
    v97 = v0[50];
    v98 = v0[45];
    v99 = v0[46];
    if (v95)
    {
      v100 = OUTLINED_FUNCTION_8();
      v155[0] = OUTLINED_FUNCTION_8();
      *(_DWORD *)v100 = 136316163;
      OUTLINED_FUNCTION_67();
      v0[31] = sub_2459D6FF4(v152, v153, v155);
      OUTLINED_FUNCTION_144();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v100 + 12) = 2085;
      sub_2459C5D28();
      v101 = sub_2459D9AAC();
      v0[32] = sub_2459D6FF4(v101, v102, v155);
      OUTLINED_FUNCTION_144();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_107();
      *(_WORD *)(v100 + 22) = 2080;
      OUTLINED_FUNCTION_28_0();
      v0[33] = sub_2459D6FF4(v103, v104, v155);
      v105 = OUTLINED_FUNCTION_18();
      *(_WORD *)(v100 + 32) = 2085;
      v0[34] = OUTLINED_FUNCTION_6(v105, v106, v155);
      v107 = OUTLINED_FUNCTION_18();
      *(_WORD *)(v100 + 42) = 2085;
      v0[35] = OUTLINED_FUNCTION_6(v107, v108, v155);
      OUTLINED_FUNCTION_18();
      OUTLINED_FUNCTION_140(&dword_2459B6000, v94, v150, "SafariSummarizationPrefetch - Successfully loaded the retrieved asset version: %s, assetLocation: %{sensitive}s, assetName: %s, countryCode: %{sensitive}s, locale: %{sensitive}s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_154();
    OUTLINED_FUNCTION_107();

    (*(void (**)(uint64_t, uint64_t))(v99 + 8))(v97, v98);
    OUTLINED_FUNCTION_78(qword_2574D9C80);
    goto LABEL_43;
  }
  if (v74 == v61 && v76 == v153)
  {
    v79 = OUTLINED_FUNCTION_17_0();
  }
  else
  {
    v78 = sub_2459D9AC4();
    v79 = OUTLINED_FUNCTION_17_0();
    if ((v78 & 1) == 0)
      goto LABEL_33;
  }
  if (qword_2574D8AE8 != -1)
    v79 = swift_once();
  OUTLINED_FUNCTION_5_2(v79, (uint64_t)qword_2574DA518);
  v132 = v154;
  OUTLINED_FUNCTION_113();
  v133 = v132;
  v134 = sub_2459D96A4();
  v135 = sub_2459D98D8();
  v136 = os_log_type_enabled(v134, v135);
  v96 = v0[51];
  v97 = v0[45];
  if (v136)
  {
    v137 = OUTLINED_FUNCTION_8();
    v148 = (_QWORD *)OUTLINED_FUNCTION_8();
    v155[0] = OUTLINED_FUNCTION_8();
    *(_DWORD *)v137 = 136315907;
    swift_bridgeObjectRetain();
    v0[36] = sub_2459D6FF4(v61, v153, v155);
    sub_2459D9950();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v137 + 12) = 2112;
    v0[37] = v133;
    v138 = v133;
    OUTLINED_FUNCTION_36();
    sub_2459D9950();
    *v148 = v133;

    *(_WORD *)(v137 + 22) = 2085;
    v141 = OUTLINED_FUNCTION_6(v139, v140, v155);
    OUTLINED_FUNCTION_90(v141);
    v142 = OUTLINED_FUNCTION_18();
    *(_WORD *)(v137 + 32) = 2085;
    v144 = OUTLINED_FUNCTION_6(v142, v143, v155);
    OUTLINED_FUNCTION_90(v144);
    OUTLINED_FUNCTION_18();
    _os_log_impl(&dword_2459B6000, v134, v135, "SafariSummarizationPrefetch - Skipping update to loadedAssets, already updated to asset version: %s, asset: %@, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v137, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574D93E8);
    OUTLINED_FUNCTION_33_0();
    OUTLINED_FUNCTION_2();
  }
  OUTLINED_FUNCTION_154();

  v145 = OUTLINED_FUNCTION_69();
  v146(v145);
  OUTLINED_FUNCTION_78(qword_2574D9C80);

LABEL_43:
  v125 = MEMORY[0x2495409D8](v0[43] + 24);
  v0[66] = v125;
  if (!v125)
  {
    swift_bridgeObjectRelease();
    if (qword_2574D8AE8 != -1)
      swift_once();
    OUTLINED_FUNCTION_23(v0[45], (uint64_t)qword_2574DA518);
    v127 = OUTLINED_FUNCTION_38();
    if (OUTLINED_FUNCTION_12(v127))
    {
      v128 = (_WORD *)OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_35(v128);
      OUTLINED_FUNCTION_36_0(&dword_2459B6000, v96, (os_log_type_t)v97, "SafariSummarizationPrefetch - Failed to call didUpdateLoadedAssets since delegate is not set");
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_150();

    OUTLINED_FUNCTION_59();
    OUTLINED_FUNCTION_168(v129);
    OUTLINED_FUNCTION_70();
    OUTLINED_FUNCTION_64();
    OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_66();
    OUTLINED_FUNCTION_65();
    OUTLINED_FUNCTION_155();
    OUTLINED_FUNCTION_169();
    OUTLINED_FUNCTION_124();
    OUTLINED_FUNCTION_174();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v55 = (uint64_t (*)(void))v0[1];
    return v55();
  }
  v126 = (_QWORD *)swift_task_alloc();
  v0[67] = v126;
  *v126 = v0;
  v126[1] = sub_2459C18EC;
  return sub_2459B9880();
}

uint64_t sub_2459C18EC()
{
  OUTLINED_FUNCTION_7();
  swift_task_dealloc();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_26();
  return OUTLINED_FUNCTION_3();
}

uint64_t sub_2459C1934(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  OUTLINED_FUNCTION_38_0();
  v15 = *(void **)(v14 + 512);
  swift_release();
  swift_unknownObjectRelease();

  OUTLINED_FUNCTION_59();
  v28 = v17;
  v29 = v16;
  v30 = *(_QWORD *)(v14 + 376);
  OUTLINED_FUNCTION_168(v18);
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_155();
  OUTLINED_FUNCTION_169();
  OUTLINED_FUNCTION_124();
  OUTLINED_FUNCTION_174();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_52();
  return v19(v19, v20, v21, v22, v23, v24, v25, v26, v28, v29, v30, a12, a13, a14);
}

void sub_2459C19D0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  _BYTE *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39[3];
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v38 = a3;
  v7 = sub_2459D96BC();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v37 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v34 - v11;
  sub_2459BB46C(a1 + 40, (uint64_t)v39);
  v13 = v40;
  v14 = v41;
  __swift_project_boxed_opaque_existential_1(v39, v40);
  v15 = (*(uint64_t (**)(unint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(v14 + 32))(0xD000000000000014, 0x80000002459DC080, a2, v13, v14);
  if (v15)
  {
    v16 = (void *)v15;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
    v17 = (void *)sub_2459D971C();
    v18 = objc_msgSend(v16, sel_assetNamed_, v17);

    if (v18)
    {

      *a4 = v18;
    }
    else
    {
      if (qword_2574D8AE8 != -1)
        swift_once();
      v25 = v7;
      v26 = __swift_project_value_buffer(v7, (uint64_t)qword_2574DA518);
      v27 = v37;
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v37, v26, v25);
      v28 = sub_2459D96A4();
      v29 = sub_2459D98D8();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = swift_slowAlloc();
        v35 = swift_slowAlloc();
        v39[0] = v35;
        *(_DWORD *)v30 = 136315907;
        v36 = v25;
        v42 = sub_2459D6FF4(0xD000000000000014, 0x80000002459DC080, v39);
        sub_2459D9950();
        *(_WORD *)(v30 + 12) = 2080;
        v42 = sub_2459D6FF4(0xD00000000000001DLL, 0x80000002459DC0C0, v39);
        sub_2459D9950();
        *(_WORD *)(v30 + 22) = 2085;
        v42 = sub_2459D6FF4(0x6E6F6D6D6F63, 0xE600000000000000, v39);
        sub_2459D9950();
        *(_WORD *)(v30 + 32) = 2085;
        v42 = sub_2459D6FF4(0x6E6F6D6D6F63, 0xE600000000000000, v39);
        sub_2459D9950();
        _os_log_impl(&dword_2459B6000, v28, v29, "SafariSummarizationPrefetch - Failed to retrieve AssetSet: %s, with name: %s, countryCode: %{sensitive}s, locale: %{sensitive}s", (uint8_t *)v30, 0x2Au);
        v31 = v35;
        swift_arrayDestroy();
        MEMORY[0x249540954](v31, -1, -1);
        MEMORY[0x249540954](v30, -1, -1);

        (*(void (**)(char *, uint64_t))(v8 + 8))(v27, v36);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v8 + 8))(v27, v25);
      }
      *(_BYTE *)(v38 + qword_2574D9C80) = 82;
      sub_2459D0864();
      sub_2459C5454();
      swift_allocError();
      *v33 = 6;
      swift_willThrow();

    }
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
    if (qword_2574D8AE8 != -1)
      swift_once();
    v19 = v7;
    v20 = __swift_project_value_buffer(v7, (uint64_t)qword_2574DA518);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v12, v20, v7);
    v21 = sub_2459D96A4();
    v22 = sub_2459D98D8();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = swift_slowAlloc();
      v24 = swift_slowAlloc();
      v39[0] = v24;
      *(_DWORD *)v23 = 136315651;
      v36 = v19;
      v42 = sub_2459D6FF4(0xD000000000000014, 0x80000002459DC080, v39);
      sub_2459D9950();
      *(_WORD *)(v23 + 12) = 2085;
      v42 = sub_2459D6FF4(0x6E6F6D6D6F63, 0xE600000000000000, v39);
      sub_2459D9950();
      *(_WORD *)(v23 + 22) = 2085;
      v42 = sub_2459D6FF4(0x6E6F6D6D6F63, 0xE600000000000000, v39);
      sub_2459D9950();
      _os_log_impl(&dword_2459B6000, v21, v22, "SafariSummarizationPrefetch - Failed to retrieve AssetSet: %s, countryCode: %{sensitive}s, locale: %{sensitive}s. Most likely due to UAF assets not downloaded", (uint8_t *)v23, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x249540954](v24, -1, -1);
      MEMORY[0x249540954](v23, -1, -1);

      (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v36);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v19);
    }
    *(_BYTE *)(v38 + qword_2574D9C80) = 81;
    sub_2459D0864();
    sub_2459C5454();
    swift_allocError();
    *v32 = 6;
    swift_willThrow();
  }
}

NSObject *sub_2459C1FD0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
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
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  id v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  _BYTE *v48;
  uint64_t v49;
  id v50;
  os_log_type_t v51;
  uint64_t v52;
  _QWORD *v53;
  id v54;
  id v55;
  _BYTE *v56;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  NSObject *v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;

  v59 = a1;
  v4 = v1;
  v5 = OUTLINED_FUNCTION_24();
  v64 = *(_QWORD *)(v5 - 8);
  v65 = v5;
  OUTLINED_FUNCTION_32_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_57();
  v63 = v7;
  OUTLINED_FUNCTION_55();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_164();
  v62 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D93E0);
  OUTLINED_FUNCTION_32_0();
  MEMORY[0x24BDAC7A8](v10);
  v11 = OUTLINED_FUNCTION_35_0();
  v61 = *(_QWORD *)(v11 - 8);
  OUTLINED_FUNCTION_32_0();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_164();
  v58 = v14;
  v15 = OUTLINED_FUNCTION_128();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2459D9650();
  OUTLINED_FUNCTION_32_0();
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v58 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = *(_QWORD **)(v4 + 16);
  (*(void (**)(char *, _QWORD, uint64_t))(v16 + 104))(v18, *MEMORY[0x24BE712E0], v15);
  swift_retain();
  sub_2459D965C();
  type metadata accessor for ResourceAccessSpan();
  OUTLINED_FUNCTION_156();
  v23 = sub_2459D02F8(v22, 32, (uint64_t)v21, 0, 1);
  v24 = v23;
  if ((*(_BYTE *)(v4 + 80) & 1) == 0)
    *(_BYTE *)(v23 + qword_2574D9C88) = 1;
  swift_beginAccess();
  OUTLINED_FUNCTION_157();
  sub_2459D1E14();
  v26 = v25;
  swift_release();
  sub_2459D20C0(v26);
  v28 = v27;
  OUTLINED_FUNCTION_41_0();
  if (v28 && (sub_2459D20FC(v28), v30 = v29, OUTLINED_FUNCTION_17_0(), v30))
  {
    v31 = objc_msgSend(v30, sel_location);
    v33 = v64;
    v32 = v65;
    if (v31)
    {
      v34 = v31;
      sub_2459D94E8();

      v35 = v61;
      v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(v61 + 32);
      v36(v3, v2, v11);
      OUTLINED_FUNCTION_138(v3, 0);
      if (__swift_getEnumTagSinglePayload(v3, 1, v11) != 1)
      {
        v37 = v58;
        v36(v58, v3, v11);
        *(_BYTE *)(v24 + qword_2574D9C80) = 78;
        v38 = v35;
        OUTLINED_FUNCTION_165();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(v59, v37, v11);
        v39 = objc_msgSend(v30, sel_metadata);
        v40 = sub_2459D96E0();

        swift_release();
        (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v11);
        return v40;
      }
    }
    else
    {
      OUTLINED_FUNCTION_138(v3, 1);
    }
    sub_2459BB6C8(v3, &qword_2574D93E0);
    *(_BYTE *)(v24 + qword_2574D9C80) = 83;
    v61 = v24;
    OUTLINED_FUNCTION_165();
    if (qword_2574D8AE8 != -1)
      swift_once();
    v49 = __swift_project_value_buffer(v32, (uint64_t)qword_2574DA518);
    v40 = v62;
    (*(void (**)(NSObject *, uint64_t, uint64_t))(v33 + 16))(v62, v49, v32);
    v50 = v30;
    sub_2459D96A4();
    v51 = OUTLINED_FUNCTION_38();
    if (os_log_type_enabled(v40, v51))
    {
      v52 = OUTLINED_FUNCTION_8();
      v53 = (_QWORD *)OUTLINED_FUNCTION_8();
      v63 = OUTLINED_FUNCTION_8();
      v67 = v63;
      *(_DWORD *)v52 = 138412803;
      v66 = (uint64_t)v50;
      v54 = v50;
      v60 = v50;
      v55 = v54;
      sub_2459D9950();
      *v53 = v30;

      *(_WORD *)(v52 + 12) = 2085;
      v66 = OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_29();
      *(_WORD *)(v52 + 22) = 2085;
      v66 = OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_83(&dword_2459B6000, v40, v51, "SafariSummarizationPrefetch - Failed to get loaded asset location for asset: %@, countryCode: %{sensitive}s, locale: %{sensitive}s");
      __swift_instantiateConcreteTypeFromMangledName(&qword_2574D93E8);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2();
    }

    (*(void (**)(NSObject *, uint64_t))(v33 + 8))(v40, v32);
    sub_2459C5454();
    OUTLINED_FUNCTION_10_1();
    OUTLINED_FUNCTION_19_0(v56, 6);
    swift_release();

  }
  else
  {
    *(_BYTE *)(v24 + qword_2574D9C80) = 82;
    OUTLINED_FUNCTION_165();
    v42 = v64;
    v41 = v65;
    if (qword_2574D8AE8 != -1)
      swift_once();
    v43 = __swift_project_value_buffer(v41, (uint64_t)qword_2574DA518);
    v40 = v63;
    OUTLINED_FUNCTION_97((uint64_t)v63, v43, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v42 + 16));
    sub_2459D96A4();
    v44 = OUTLINED_FUNCTION_38();
    if (os_log_type_enabled(v40, v44))
    {
      v45 = OUTLINED_FUNCTION_8();
      v46 = OUTLINED_FUNCTION_8();
      v61 = v24;
      v67 = v46;
      *(_DWORD *)v45 = 136315651;
      OUTLINED_FUNCTION_28_0();
      v66 = sub_2459D6FF4(0xD000000000000014, v47, (uint64_t *)&v67);
      OUTLINED_FUNCTION_29();
      *(_WORD *)(v45 + 12) = 2085;
      v66 = OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_29();
      *(_WORD *)(v45 + 22) = 2085;
      v66 = OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_83(&dword_2459B6000, v40, v44, "SafariSummarizationPrefetch - Failed to get loaded asset for assetNamed: %s, countryCode: %{sensitive}s, locale: %{sensitive}s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2();
    }

    (*(void (**)(NSObject *, uint64_t))(v42 + 8))(v40, v41);
    sub_2459C5454();
    OUTLINED_FUNCTION_10_1();
    OUTLINED_FUNCTION_19_0(v48, 6);
    swift_release();
  }
  return v40;
}

uint64_t sub_2459C26EC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
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
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (**v27)(uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t result;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  char v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  void (*v67);
  NSObject *v68;
  os_log_type_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  char v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  NSObject *v83;
  os_log_type_t v84;
  os_log_type_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  _BYTE *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  os_log_type_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  _BYTE *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t (*v117)(uint64_t, uint64_t, uint64_t);
  uint64_t v118;
  os_log_type_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  _QWORD *v129;
  _BYTE *v130;
  uint64_t v131;
  uint64_t (**v132)(uint64_t, uint64_t);
  char *v133;
  uint64_t v134;
  uint64_t v135;
  char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  _QWORD *v140;
  uint64_t v141;
  uint64_t v142;
  NSObject *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  os_log_t v149;
  id v150;
  uint64_t v151;
  NSObject *v152;
  uint64_t v153;
  unint64_t v154;
  char *v155;
  unint64_t v156;
  unint64_t v157;
  uint64_t v158[4];
  uint64_t vars0;

  v154 = a2;
  v153 = a1;
  v140 = a3;
  v5 = OUTLINED_FUNCTION_24();
  v6 = *(_QWORD *)(v5 - 8);
  v147 = v5;
  v148 = v6;
  OUTLINED_FUNCTION_32_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_57();
  v143 = v8;
  OUTLINED_FUNCTION_55();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_132();
  v142 = v10;
  OUTLINED_FUNCTION_55();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_132();
  v139 = v12;
  OUTLINED_FUNCTION_55();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_164();
  v141 = v14;
  v15 = OUTLINED_FUNCTION_127();
  v145 = *(_QWORD *)(v15 - 8);
  v146 = v15;
  OUTLINED_FUNCTION_32_0();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_56();
  v144 = v17;
  v151 = OUTLINED_FUNCTION_128();
  v149 = *(os_log_t *)(v151 - 8);
  OUTLINED_FUNCTION_32_0();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_56();
  v150 = v19;
  sub_2459D9650();
  OUTLINED_FUNCTION_32_0();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_56();
  v152 = v21;
  v22 = sub_2459D9530();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_23_0();
  v25 = MEMORY[0x24BDAC7A8](v24);
  v27 = (uint64_t (**)(uint64_t, uint64_t))((char *)&v131 - v26);
  v28 = MEMORY[0x24BDAC7A8](v25);
  v30 = (char *)&v131 - v29;
  v31 = MEMORY[0x24BDAC7A8](v28);
  v33 = (char *)&v131 - v32;
  MEMORY[0x24BDAC7A8](v31);
  v35 = (char *)&v131 - v34;
  v36 = OUTLINED_FUNCTION_102();
  v37 = v3;
  v38 = (uint64_t)v155;
  result = (uint64_t)sub_2459C1FD0(v36);
  if (v38)
    return result;
  v134 = v4;
  v132 = v27;
  v133 = v30;
  v135 = 0;
  v137 = v23;
  v136 = v33;
  v155 = v35;
  v138 = v22;
  v158[3] = result;
  v40 = *(_QWORD **)(v3 + 16);
  v41 = result;
  ((void (*)(id, _QWORD, uint64_t))v149[13].isa)(v150, *MEMORY[0x24BE712E0], v151);
  OUTLINED_FUNCTION_157();
  v42 = (uint64_t)v152;
  sub_2459D965C();
  type metadata accessor for ResourceAccessSpan();
  OUTLINED_FUNCTION_156();
  v43 = sub_2459D02F8(v40, 33, v42, 0, 1);
  v44 = v43;
  if ((*(_BYTE *)(v37 + 80) & 1) == 0)
    *(_BYTE *)(v43 + qword_2574D9C88) = 1;
  v45 = sub_2459C5F88(0, &qword_2574D93D8);
  v46 = sub_2459BD784(v153, v154);
  if (v46 < 0)
  {
    result = sub_2459D9A10();
    __break(1u);
    return result;
  }
  v47 = v46;
  v48 = OUTLINED_FUNCTION_67();
  v49 = sub_2459C3618(v48);
  v51 = v50;
  OUTLINED_FUNCTION_68();
  if ((v51 & 1) != 0)
    v52 = 1;
  else
    v52 = v49;
  if (!v52)
  {
    __break(1u);
    goto LABEL_58;
  }
  v156 = v47 % v52;
  sub_2459D9AAC();
  v156 = 0xD000000000000019;
  v157 = 0x80000002459DC650;
  sub_2459D97A0();
  OUTLINED_FUNCTION_114();
  v53 = v156;
  v54 = v157;
  OUTLINED_FUNCTION_89();
  v154 = v53;
  v55 = sub_2459D213C(v53, v54, v41);
  v57 = v56;
  v58 = OUTLINED_FUNCTION_122();
  if (!v57)
  {
    if (qword_2574D8AE8 == -1)
    {
LABEL_14:
      OUTLINED_FUNCTION_133(v58, (uint64_t)qword_2574DA518);
      v66 = v143;
      v67(v143);
      OUTLINED_FUNCTION_89();
      v68 = v66;
      sub_2459D96A4();
      v69 = OUTLINED_FUNCTION_38();
      if (os_log_type_enabled(v66, v69))
      {
        v152 = v44;
        v70 = OUTLINED_FUNCTION_8();
        v158[0] = OUTLINED_FUNCTION_8();
        *(_DWORD *)v70 = 136315907;
        OUTLINED_FUNCTION_89();
        v156 = OUTLINED_FUNCTION_94();
        OUTLINED_FUNCTION_42_0();
        OUTLINED_FUNCTION_108();
        *(_WORD *)(v70 + 12) = 2053;
        v156 = v47;
        OUTLINED_FUNCTION_134();
        *(_WORD *)(v70 + 22) = 2048;
        v156 = v52;
        OUTLINED_FUNCTION_134();
        *(_WORD *)(v70 + 32) = 2080;
        if (qword_2574D8A88 != -1)
          swift_once();
        v71 = qword_2574DA458;
        v72 = unk_2574DA460;
        OUTLINED_FUNCTION_13_1();
        OUTLINED_FUNCTION_67();
        v73 = OUTLINED_FUNCTION_109(v71, v72);
        OUTLINED_FUNCTION_74();
        OUTLINED_FUNCTION_68();
        if (&vars0 == (uint64_t *)112)
          v74 = 6369134;
        else
          v74 = v73;
        v156 = OUTLINED_FUNCTION_131(v74);
        OUTLINED_FUNCTION_42_0();
        OUTLINED_FUNCTION_41_0();
        _os_log_impl(&dword_2459B6000, v68, v69, "SafariSummarizationPrefetch - Failed to find %s key in metadata dictionary for hash: %{sensitive}llu, numShards: %llu, version: %s", (uint8_t *)v70, 0x2Au);
        OUTLINED_FUNCTION_53();
        OUTLINED_FUNCTION_2();
      }

      OUTLINED_FUNCTION_16_0();
      OUTLINED_FUNCTION_143((uint64_t)v66, v27[1]);
      OUTLINED_FUNCTION_79(qword_2574D9C80);
      sub_2459C5454();
      OUTLINED_FUNCTION_10_1();
      OUTLINED_FUNCTION_19_0(v96, 8);
      OUTLINED_FUNCTION_171();
      OUTLINED_FUNCTION_117();
      goto LABEL_33;
    }
LABEL_58:
    v58 = swift_once();
    goto LABEL_14;
  }
  v153 = v45;
  v59 = v44;
  v156 = v55;
  v157 = v57;
  v60 = v144;
  v61 = v145;
  v62 = v146;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v145 + 104))(v144, *MEMORY[0x24BDCD7A0], v146);
  sub_2459C5490();
  v63 = (uint64_t)v136;
  sub_2459D9524();
  (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v60, v62);
  v64 = v135;
  sub_2459D94D0();
  if (v64)
  {
    OUTLINED_FUNCTION_122();
    OUTLINED_FUNCTION_68();
    swift_release();
    OUTLINED_FUNCTION_117();
LABEL_12:
    OUTLINED_FUNCTION_34_0(v65);
LABEL_33:
    v97 = (uint64_t)v155;
LABEL_34:
    OUTLINED_FUNCTION_34_0(v97);
    return swift_bridgeObjectRelease();
  }
  v151 = v55;
  OUTLINED_FUNCTION_117();
  v75 = v59;
  if ((v76 & 1) == 0)
  {
    OUTLINED_FUNCTION_68();
    OUTLINED_FUNCTION_122();
    if (qword_2574D8AE8 != -1)
      swift_once();
    v98 = v147;
    v99 = __swift_project_value_buffer(v147, (uint64_t)qword_2574DA518);
    v100 = v148;
    v101 = v142;
    OUTLINED_FUNCTION_158(v99, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v148 + 16));
    v102 = v134;
    OUTLINED_FUNCTION_97(v134, v63, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v137 + 16));
    sub_2459D96A4();
    v103 = OUTLINED_FUNCTION_96();
    if (OUTLINED_FUNCTION_40_0(v103))
    {
      v152 = v59;
      v104 = OUTLINED_FUNCTION_8();
      v158[0] = OUTLINED_FUNCTION_8();
      *(_DWORD *)v104 = 136643075;
      v105 = v102;
      v106 = OUTLINED_FUNCTION_142();
      v108 = OUTLINED_FUNCTION_86(v106, v107);
      OUTLINED_FUNCTION_129(v108);
      sub_2459D9950();
      OUTLINED_FUNCTION_17_0();
      OUTLINED_FUNCTION_34_0(v102);
      *(_WORD *)(v104 + 12) = 2080;
      if (qword_2574D8A88 != -1)
        swift_once();
      v109 = qword_2574DA458;
      v110 = unk_2574DA460;
      OUTLINED_FUNCTION_13_1();
      swift_bridgeObjectRetain();
      v111 = OUTLINED_FUNCTION_109(v109, v110);
      OUTLINED_FUNCTION_74();
      OUTLINED_FUNCTION_114();
      if (v105)
        v112 = v111;
      else
        v112 = 6369134;
      v156 = OUTLINED_FUNCTION_130(v112);
      sub_2459D9950();
      OUTLINED_FUNCTION_17_0();
      OUTLINED_FUNCTION_82(&dword_2459B6000, v59, v103, "SafariSummarizationPrefetch - Failed to find bloom filter asset at path: %{sensitive}s, version: %s", (uint8_t *)v104);
      OUTLINED_FUNCTION_53();
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_34_0(v102);

    (*(void (**)(uint64_t, uint64_t))(v100 + 8))(v101, v98);
    v97 = (uint64_t)v155;
    OUTLINED_FUNCTION_79(qword_2574D9C80);
    sub_2459C5454();
    OUTLINED_FUNCTION_10_1();
    *v113 = 0;
    swift_willThrow();
    OUTLINED_FUNCTION_171();
    OUTLINED_FUNCTION_34_0((uint64_t)v136);
    goto LABEL_34;
  }
  v135 = 0;
  sub_2459D9500();
  v77 = sub_2459C35B8();
  v78 = v63;
  if (!v77)
  {
    OUTLINED_FUNCTION_68();
    v114 = OUTLINED_FUNCTION_122();
    if (qword_2574D8AE8 != -1)
      v114 = swift_once();
    OUTLINED_FUNCTION_133(v114, (uint64_t)qword_2574DA518);
    v115 = v139;
    OUTLINED_FUNCTION_87(v116, v117);
    v118 = (uint64_t)v132;
    OUTLINED_FUNCTION_97((uint64_t)v132, v63, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v137 + 16));
    sub_2459D96A4();
    v119 = OUTLINED_FUNCTION_96();
    if (OUTLINED_FUNCTION_40_0(v119))
    {
      v152 = v75;
      v120 = OUTLINED_FUNCTION_8();
      v158[0] = OUTLINED_FUNCTION_8();
      *(_DWORD *)v120 = 136643075;
      v121 = v118;
      v122 = OUTLINED_FUNCTION_142();
      v124 = OUTLINED_FUNCTION_86(v122, v123);
      OUTLINED_FUNCTION_129(v124);
      OUTLINED_FUNCTION_42_0();
      OUTLINED_FUNCTION_17_0();
      OUTLINED_FUNCTION_34_0(v118);
      *(_WORD *)(v120 + 12) = 2080;
      if (qword_2574D8A88 != -1)
        swift_once();
      v125 = qword_2574DA458;
      v126 = unk_2574DA460;
      OUTLINED_FUNCTION_13_1();
      OUTLINED_FUNCTION_67();
      v127 = OUTLINED_FUNCTION_109(v125, v126);
      OUTLINED_FUNCTION_74();
      OUTLINED_FUNCTION_68();
      if (v121)
        v128 = v127;
      else
        v128 = 6369134;
      v156 = OUTLINED_FUNCTION_130(v128);
      OUTLINED_FUNCTION_42_0();
      OUTLINED_FUNCTION_17_0();
      OUTLINED_FUNCTION_82(&dword_2459B6000, v63, v119, "SafariSummarizationPrefetch - Failed to deserialize installed bloom filter binary at path: %{sensitive}s, version: %s", (uint8_t *)v120);
      OUTLINED_FUNCTION_53();
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_34_0(v118);

    OUTLINED_FUNCTION_143(v115, *(uint64_t (**)(uint64_t, uint64_t))(v63 + 8));
    OUTLINED_FUNCTION_79(qword_2574D9C80);
    sub_2459C5454();
    OUTLINED_FUNCTION_10_1();
    OUTLINED_FUNCTION_19_0(v130, 1);
    OUTLINED_FUNCTION_171();
    v65 = (uint64_t)v136;
    goto LABEL_12;
  }
  v150 = v77;
  v152 = v75;
  if (qword_2574D8AE8 != -1)
    swift_once();
  v79 = v147;
  v80 = __swift_project_value_buffer(v147, (uint64_t)qword_2574DA518);
  v81 = v141;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v148 + 16))(v141, v80, v79);
  v82 = (uint64_t)v133;
  OUTLINED_FUNCTION_97((uint64_t)v133, v78, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v137 + 16));
  OUTLINED_FUNCTION_89();
  OUTLINED_FUNCTION_67();
  v83 = sub_2459D96A4();
  v84 = sub_2459D98F0();
  if (os_log_type_enabled(v83, v84))
  {
    v85 = v84;
    v149 = v83;
    v86 = OUTLINED_FUNCTION_8();
    v158[0] = OUTLINED_FUNCTION_8();
    *(_DWORD *)v86 = 136315907;
    OUTLINED_FUNCTION_89();
    v156 = OUTLINED_FUNCTION_94();
    OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_108();
    *(_WORD *)(v86 + 12) = 2080;
    OUTLINED_FUNCTION_67();
    v156 = sub_2459D6FF4(v151, v57, v158);
    OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_108();
    *(_WORD *)(v86 + 22) = 2080;
    if (qword_2574D8A88 != -1)
      swift_once();
    v87 = qword_2574DA458;
    v88 = unk_2574DA460;
    OUTLINED_FUNCTION_13_1();
    OUTLINED_FUNCTION_159();
    v89 = OUTLINED_FUNCTION_109(v87, v88);
    v91 = v90;
    swift_endAccess();
    OUTLINED_FUNCTION_17_0();
    if (v91)
      v92 = v89;
    else
      v92 = 6369134;
    v156 = OUTLINED_FUNCTION_131(v92);
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_41_0();
    *(_WORD *)(v86 + 32) = 2085;
    v93 = (uint64_t)v133;
    v94 = sub_2459D9500();
    v156 = OUTLINED_FUNCTION_86(v94, v95);
    OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_103(v93);
    _os_log_impl(&dword_2459B6000, v149, v85, "SafariSummarizationPrefetch - Successfully fetched and deserialized bloom filter shard binary: %s, file: %s, version: %s, at path: %{sensitive}s", (uint8_t *)v86, 0x2Au);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2();
  }
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_126(v82);

  (*(void (**)(uint64_t, uint64_t))(v148 + 8))(v81, v79);
  v129 = v140;
  OUTLINED_FUNCTION_81(qword_2574D9C80);
  v129[3] = v153;
  v129[4] = &off_2516BE700;
  swift_release();
  *v129 = v150;
  OUTLINED_FUNCTION_126((uint64_t)v136);
  OUTLINED_FUNCTION_126((uint64_t)v155);
  return swift_bridgeObjectRelease();
}

id sub_2459C35B8()
{
  void *v0;
  id v1;

  v0 = (void *)sub_2459D971C();
  swift_bridgeObjectRelease();
  v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bloomFilterWithPathToFile_, v0);

  return v1;
}

uint64_t sub_2459C3618(uint64_t a1)
{
  char v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 *v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  os_log_type_t v22;
  _DWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  unsigned __int8 v29;
  BOOL v30;
  char v31;
  unint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  unsigned __int8 v36;
  uint64_t v37;
  unsigned __int8 v38;
  unint64_t v39;
  unsigned __int8 v40;
  uint64_t v41;
  unsigned __int8 v42;
  unint64_t v43;
  unsigned __int8 v44;
  unsigned __int8 v45;
  unint64_t v46;
  unint64_t v47;
  unsigned __int8 v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  _DWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v4 = OUTLINED_FUNCTION_24();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = ((char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v57 - v9;
  OUTLINED_FUNCTION_28_0();
  result = sub_2459D213C(0xD000000000000017, v11, a1);
  if (!v13)
  {
    if (qword_2574D8AE8 != -1)
      swift_once();
    v21 = __swift_project_value_buffer(v4, (uint64_t)qword_2574DA518);
    (*(void (**)(NSObject *, uint64_t, uint64_t))(v5 + 16))(v8, v21, v4);
    OUTLINED_FUNCTION_113();
    sub_2459D96A4();
    v22 = OUTLINED_FUNCTION_38();
    if (os_log_type_enabled(v8, v22))
    {
      v58 = v5;
      v23 = (_DWORD *)OUTLINED_FUNCTION_8();
      v59 = OUTLINED_FUNCTION_8();
      *v23 = 136315138;
      if (qword_2574D8A88 != -1)
        swift_once();
      v24 = qword_2574DA458;
      OUTLINED_FUNCTION_54();
      OUTLINED_FUNCTION_121();
      OUTLINED_FUNCTION_93();
      if (v2)
        v25 = v24;
      else
        v25 = 6369134;
      v26 = OUTLINED_FUNCTION_101(v25);
      OUTLINED_FUNCTION_44(v26);
      OUTLINED_FUNCTION_43_0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_149(&dword_2459B6000, v8, v22, "SafariSummarizationPrefetch - Failed to find num_bloom_filter_shards key in metadata dictionary, version: %s");
      OUTLINED_FUNCTION_33_0();
      OUTLINED_FUNCTION_2();
    }

    OUTLINED_FUNCTION_43_0();
    v33 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    v34 = (uint64_t)v8;
    goto LABEL_80;
  }
  v14 = v13;
  v15 = HIBYTE(v13) & 0xF;
  v16 = result & 0xFFFFFFFFFFFFLL;
  if ((v14 & 0x2000000000000000) != 0)
    v17 = v15;
  else
    v17 = result & 0xFFFFFFFFFFFFLL;
  if (!v17)
  {
    OUTLINED_FUNCTION_14_0();
LABEL_70:
    if (qword_2574D8AE8 != -1)
      swift_once();
    v49 = __swift_project_value_buffer(v4, (uint64_t)qword_2574DA518);
    OUTLINED_FUNCTION_11_1(v49, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
    OUTLINED_FUNCTION_113();
    v50 = sub_2459D96A4();
    v51 = sub_2459D98D8();
    if (os_log_type_enabled(v50, v51))
    {
      v58 = v5;
      v52 = (_DWORD *)OUTLINED_FUNCTION_8();
      v59 = OUTLINED_FUNCTION_8();
      *v52 = 136315138;
      if (qword_2574D8A88 != -1)
        swift_once();
      v53 = qword_2574DA458;
      OUTLINED_FUNCTION_54();
      OUTLINED_FUNCTION_121();
      OUTLINED_FUNCTION_93();
      if (v2)
        v54 = v53;
      else
        v54 = 6369134;
      v55 = OUTLINED_FUNCTION_101(v54);
      OUTLINED_FUNCTION_44(v55);
      OUTLINED_FUNCTION_43_0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_149(&dword_2459B6000, v50, v51, "SafariSummarizationPrefetch - num_bloom_filter_shards value incorrect in metadata dictionary, version: %s");
      OUTLINED_FUNCTION_33_0();
      OUTLINED_FUNCTION_2();
    }

    OUTLINED_FUNCTION_43_0();
    v33 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    v34 = (uint64_t)v10;
LABEL_80:
    OUTLINED_FUNCTION_119(v34, v33);
    return 0;
  }
  if ((v14 & 0x1000000000000000) != 0)
  {
    v19 = (unint64_t)sub_2459C54CC(result, v14, 10);
    v1 = v56;
    goto LABEL_60;
  }
  if ((v14 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0)
      v18 = (unsigned __int8 *)((v14 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v18 = (unsigned __int8 *)sub_2459D99E0();
    v19 = (unint64_t)sub_2459C55B0(v18, v16, 10);
    v1 = v20 & 1;
LABEL_60:
    OUTLINED_FUNCTION_14_0();
    if ((v1 & 1) == 0)
      return v19;
    goto LABEL_70;
  }
  v59 = result;
  v60 = v14 & 0xFFFFFFFFFFFFFFLL;
  if (result == 43)
  {
    if (!v15)
      goto LABEL_85;
    if (v15 == 1)
      goto LABEL_44;
    OUTLINED_FUNCTION_58();
    if (!v31 && v30)
      goto LABEL_44;
    v19 = v36;
    if (v35 != 2)
    {
      OUTLINED_FUNCTION_58();
      if (!v31 && v30)
        goto LABEL_44;
      v19 = 10 * v19 + v38;
      if (v37 != 3)
      {
        while (1)
        {
          OUTLINED_FUNCTION_98();
          if (!v31 && v30)
            goto LABEL_44;
          if (!is_mul_ok(v19, v39))
            goto LABEL_44;
          v30 = __CFADD__(10 * v19, v40);
          v19 = 10 * v19 + v40;
          if (v30)
            goto LABEL_44;
          OUTLINED_FUNCTION_100();
          if (v31)
            goto LABEL_60;
        }
      }
    }
LABEL_59:
    v1 = 0;
    goto LABEL_60;
  }
  if (result != 45)
  {
    if (!v15 || (result - 48) > 9u)
      goto LABEL_44;
    v19 = (result - 48);
    if (v15 != 1)
    {
      OUTLINED_FUNCTION_58();
      if (!v31 && v30)
        goto LABEL_44;
      v19 = 10 * v19 + v42;
      if (v41 != 2)
      {
        while (1)
        {
          OUTLINED_FUNCTION_98();
          if (!v31 && v30)
            goto LABEL_44;
          if (!is_mul_ok(v19, v43))
            goto LABEL_44;
          v30 = __CFADD__(10 * v19, v44);
          v19 = 10 * v19 + v44;
          if (v30)
            goto LABEL_44;
          OUTLINED_FUNCTION_100();
          if (v31)
            goto LABEL_60;
        }
      }
    }
    goto LABEL_59;
  }
  if (v15)
  {
    if (v15 != 1)
    {
      OUTLINED_FUNCTION_58();
      if (v31 || !v30)
      {
        v19 = 0;
        v30 = v29 == 0;
        v32 = -(uint64_t)v29;
        if (!v30)
          goto LABEL_45;
        if (v28 == 2)
        {
          v1 = 0;
          v19 = v32;
          goto LABEL_60;
        }
        v45 = v27 - 48;
        if ((v27 - 48) <= 9u && is_mul_ok(v32, 0xAuLL))
        {
          v46 = 10 * v32;
          v19 = v46 - v45;
          if (v46 >= v45)
          {
            if (v28 == 3)
              goto LABEL_59;
            while (1)
            {
              OUTLINED_FUNCTION_98();
              if (!v31 && v30)
                break;
              if (!is_mul_ok(v19, v47))
                break;
              v30 = 10 * v19 >= v48;
              v19 = 10 * v19 - v48;
              if (!v30)
                break;
              OUTLINED_FUNCTION_100();
              if (v31)
                goto LABEL_60;
            }
          }
        }
      }
    }
LABEL_44:
    v19 = 0;
LABEL_45:
    v1 = 1;
    goto LABEL_60;
  }
  __break(1u);
LABEL_85:
  __break(1u);
  return result;
}

uint64_t sub_2459C3C30(NSObject *a1, uint64_t a2, uint64_t a3)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  _BYTE *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  NSObject *v83;
  uint64_t v84;
  os_log_type_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  _BYTE *v99;
  char v100;
  uint64_t v101;
  uint64_t v102;
  NSObject *v103;
  uint64_t v104;
  NSObject *v105;
  os_log_type_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  unint64_t v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void (*v121)(uint64_t);
  uint64_t v123;
  char *v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  NSObject *v128;
  uint64_t v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  NSObject *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  uint64_t v140;
  NSObject *v141;
  uint64_t v142[3];

  v140 = a3;
  v135 = a1;
  v5 = OUTLINED_FUNCTION_24();
  v6 = *(_QWORD *)(v5 - 8);
  v136 = v5;
  v137 = v6;
  OUTLINED_FUNCTION_32_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_57();
  v134 = v8;
  OUTLINED_FUNCTION_55();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_132();
  v133 = v10;
  OUTLINED_FUNCTION_55();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_132();
  v131 = v12;
  OUTLINED_FUNCTION_55();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_164();
  v132 = v14;
  v15 = OUTLINED_FUNCTION_127();
  v138 = *(_QWORD *)(v15 - 8);
  v139 = v15;
  OUTLINED_FUNCTION_32_0();
  MEMORY[0x24BDAC7A8](v16);
  v17 = OUTLINED_FUNCTION_35_0();
  v18 = *(NSObject **)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_23_0();
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v123 - v21;
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)&v123 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v123 - v26;
  v28 = OUTLINED_FUNCTION_102();
  v29 = (uint64_t)v141;
  v30 = sub_2459C1FD0(v28);
  if (v29)
    return v17;
  v126 = v25;
  v127 = 0;
  v31 = v138;
  v32 = v139;
  v124 = v22;
  v125 = v3;
  v128 = v18;
  v129 = v17;
  v130 = v27;
  v141 = v30;
  v33 = sub_2459D213C(0xD000000000000015, 0x80000002459DC5F0, (uint64_t)v30);
  if (!v34)
  {
    OUTLINED_FUNCTION_81(qword_2574D9C80);
    v17 = (uint64_t)v130;
    if (qword_2574D8AE8 != -1)
      swift_once();
    v40 = v136;
    v41 = __swift_project_value_buffer(v136, (uint64_t)qword_2574DA518);
    v42 = v137;
    v43 = v134;
    OUTLINED_FUNCTION_158(v41, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v137 + 16));
    OUTLINED_FUNCTION_170();
    sub_2459D96A4();
    v44 = OUTLINED_FUNCTION_96();
    if (OUTLINED_FUNCTION_40_0(v44))
    {
      v45 = OUTLINED_FUNCTION_8();
      v140 = OUTLINED_FUNCTION_8();
      v142[0] = v140;
      *(_DWORD *)v45 = 136315394;
      v46 = sub_2459D6FF4(0xD000000000000015, 0x80000002459DC5F0, v142);
      OUTLINED_FUNCTION_160(v46);
      sub_2459D9950();
      *(_WORD *)(v45 + 12) = 2080;
      if (qword_2574D8A88 != -1)
        swift_once();
      v47 = qword_2574DA458;
      v48 = unk_2574DA460;
      OUTLINED_FUNCTION_170();
      v49 = sub_2459D213C(v47, v48, (uint64_t)v141);
      v51 = v50;
      swift_bridgeObjectRelease();
      if (v51)
        v52 = v49;
      else
        v52 = 6369134;
      if (v51)
        v53 = v51;
      else
        v53 = 0xE300000000000000;
      v54 = sub_2459D6FF4(v52, v53, v142);
      OUTLINED_FUNCTION_116(v54);
      sub_2459D9950();
      OUTLINED_FUNCTION_16_0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_82(&dword_2459B6000, v18, v44, "SafariSummarizationPrefetch - Failed to find path filter filename for %s in metadata, version: %s", (uint8_t *)v45);
      OUTLINED_FUNCTION_53();
      OUTLINED_FUNCTION_2();
    }

    OUTLINED_FUNCTION_16_0();
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v43, v40);
    sub_2459C5454();
    OUTLINED_FUNCTION_10_1();
    OUTLINED_FUNCTION_19_0(v78, 2);
    goto LABEL_59;
  }
  v35 = v33;
  v36 = v34;
  v142[0] = v33;
  v142[1] = v34;
  (*(void (**)(uint64_t, _QWORD, unint64_t))(v31 + 104))(v4, *MEMORY[0x24BDCD7A0], v32);
  sub_2459C5490();
  v37 = v135;
  v17 = (uint64_t)v130;
  sub_2459D9524();
  (*(void (**)(uint64_t, unint64_t))(v31 + 8))(v4, v32);
  v38 = v127;
  v39 = sub_2459D94DC();
  if (v38)
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_41_0();
    OUTLINED_FUNCTION_77((uint64_t)v37);
LABEL_59:
    OUTLINED_FUNCTION_77(v17);
    return v17;
  }
  v55 = v129;
  if ((v39 & 1) == 0)
  {
    OUTLINED_FUNCTION_41_0();
    OUTLINED_FUNCTION_81(qword_2574D9C80);
    v79 = v136;
    v80 = v137;
    if (qword_2574D8AE8 != -1)
      swift_once();
    v81 = __swift_project_value_buffer(v79, (uint64_t)qword_2574DA518);
    v82 = v133;
    OUTLINED_FUNCTION_87(v81, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v80 + 16));
    v83 = v128;
    v84 = v125;
    OUTLINED_FUNCTION_75(v125, (uint64_t (*)(uint64_t, uint64_t, uint64_t))v128[2].isa);
    OUTLINED_FUNCTION_54();
    sub_2459D96A4();
    v85 = OUTLINED_FUNCTION_96();
    if (OUTLINED_FUNCTION_40_0(v85))
    {
      v86 = v55;
      v87 = OUTLINED_FUNCTION_8();
      v140 = OUTLINED_FUNCTION_8();
      v142[0] = v140;
      *(_DWORD *)v87 = 136643075;
      v88 = OUTLINED_FUNCTION_146();
      v90 = OUTLINED_FUNCTION_139(v88, v89);
      OUTLINED_FUNCTION_160(v90);
      OUTLINED_FUNCTION_42_0();
      swift_bridgeObjectRelease();
      ((void (*)(uint64_t, uint64_t))v83[1].isa)(v84, v86);
      *(_WORD *)(v87 + 12) = 2080;
      if (qword_2574D8A88 != -1)
        swift_once();
      v91 = qword_2574DA458;
      v92 = unk_2574DA460;
      swift_bridgeObjectRetain();
      v93 = OUTLINED_FUNCTION_153(v91, v92);
      v95 = v94;
      OUTLINED_FUNCTION_114();
      if (v95)
        v96 = v93;
      else
        v96 = 6369134;
      if (v95)
        v97 = v95;
      else
        v97 = 0xE300000000000000;
      v98 = sub_2459D6FF4(v96, v97, v142);
      OUTLINED_FUNCTION_116(v98);
      OUTLINED_FUNCTION_42_0();
      OUTLINED_FUNCTION_16_0();
      OUTLINED_FUNCTION_114();
      OUTLINED_FUNCTION_82(&dword_2459B6000, v36, v85, "SafariSummarizationPrefetch - Failed to find path filter asset at path: %{sensitive}s, version: %s", (uint8_t *)v87);
      OUTLINED_FUNCTION_53();
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_77(v84);

    OUTLINED_FUNCTION_16_0();
    OUTLINED_FUNCTION_143(v82, *(uint64_t (**)(uint64_t, uint64_t))(v80 + 8));
    sub_2459C5454();
    OUTLINED_FUNCTION_10_1();
    v100 = 3;
    goto LABEL_58;
  }
  OUTLINED_FUNCTION_28_0();
  v57 = OUTLINED_FUNCTION_167(0xD000000000000015, v56);
  if (!v58)
  {
    OUTLINED_FUNCTION_41_0();
    OUTLINED_FUNCTION_81(qword_2574D9C80);
    if (qword_2574D8AE8 != -1)
      swift_once();
    v101 = v136;
    v102 = __swift_project_value_buffer(v136, (uint64_t)qword_2574DA518);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v137 + 16))(v131, v102, v101);
    v103 = v128;
    v104 = (uint64_t)v124;
    OUTLINED_FUNCTION_75((uint64_t)v124, (uint64_t (*)(uint64_t, uint64_t, uint64_t))v128[2].isa);
    OUTLINED_FUNCTION_54();
    v105 = sub_2459D96A4();
    v106 = sub_2459D98D8();
    if (os_log_type_enabled(v105, v106))
    {
      v107 = v55;
      v108 = OUTLINED_FUNCTION_8();
      v140 = OUTLINED_FUNCTION_8();
      v142[0] = v140;
      *(_DWORD *)v108 = 136643075;
      v109 = OUTLINED_FUNCTION_146();
      v111 = OUTLINED_FUNCTION_139(v109, v110);
      OUTLINED_FUNCTION_160(v111);
      sub_2459D9950();
      OUTLINED_FUNCTION_17_0();
      ((void (*)(uint64_t, uint64_t))v103[1].isa)(v104, v107);
      *(_WORD *)(v108 + 12) = 2080;
      if (qword_2574D8A88 != -1)
        swift_once();
      v113 = qword_2574DA458;
      v112 = unk_2574DA460;
      OUTLINED_FUNCTION_159();
      v114 = OUTLINED_FUNCTION_153(v113, v112);
      v116 = v115;
      OUTLINED_FUNCTION_17_0();
      if (v116)
        v117 = v114;
      else
        v117 = 6369134;
      if (v116)
        v118 = v116;
      else
        v118 = 0xE300000000000000;
      v119 = sub_2459D6FF4(v117, v118, v142);
      OUTLINED_FUNCTION_116(v119);
      OUTLINED_FUNCTION_42_0();
      OUTLINED_FUNCTION_16_0();
      OUTLINED_FUNCTION_17_0();
      OUTLINED_FUNCTION_82(&dword_2459B6000, v105, v106, "SafariSummarizationPrefetch - Failed to find path filter hash at path: %{sensitive}s, version: %s", (uint8_t *)v108);
      OUTLINED_FUNCTION_53();
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_77(v104);

    OUTLINED_FUNCTION_16_0();
    v120 = OUTLINED_FUNCTION_69();
    v121(v120);
    sub_2459C5454();
    OUTLINED_FUNCTION_10_1();
    v100 = 5;
LABEL_58:
    OUTLINED_FUNCTION_19_0(v99, v100);
    OUTLINED_FUNCTION_77((uint64_t)v135);
    v17 = (uint64_t)v130;
    goto LABEL_59;
  }
  v17 = v57;
  v134 = v35;
  v139 = (unint64_t)v36;
  if (qword_2574D8AE8 != -1)
    swift_once();
  v59 = v136;
  v60 = __swift_project_value_buffer(v136, (uint64_t)qword_2574DA518);
  v61 = v132;
  OUTLINED_FUNCTION_87(v60, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v137 + 16));
  OUTLINED_FUNCTION_75((uint64_t)v126, (uint64_t (*)(uint64_t, uint64_t, uint64_t))v128[2].isa);
  v62 = v139;
  OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_170();
  v63 = sub_2459D96A4();
  LODWORD(v138) = sub_2459D98F0();
  if (os_log_type_enabled(v63, (os_log_type_t)v138))
  {
    v135 = v63;
    v64 = OUTLINED_FUNCTION_8();
    v133 = OUTLINED_FUNCTION_8();
    v142[0] = v133;
    *(_DWORD *)v64 = 136315651;
    OUTLINED_FUNCTION_54();
    v65 = sub_2459D6FF4(v134, v62, v142);
    OUTLINED_FUNCTION_160(v65);
    v134 = v66 + 8;
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_108();
    *(_WORD *)(v64 + 12) = 2080;
    if (qword_2574D8A88 != -1)
      swift_once();
    v68 = qword_2574DA458;
    v67 = unk_2574DA460;
    OUTLINED_FUNCTION_159();
    v69 = OUTLINED_FUNCTION_167(v68, v67);
    v71 = v70;
    OUTLINED_FUNCTION_17_0();
    if (v71)
      v72 = v69;
    else
      v72 = 6369134;
    if (!v71)
      v71 = 0xE300000000000000;
    v73 = sub_2459D6FF4(v72, v71, v142);
    OUTLINED_FUNCTION_116(v73);
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_16_0();
    OUTLINED_FUNCTION_41_0();
    *(_WORD *)(v64 + 22) = 2085;
    v74 = (uint64_t)v126;
    v75 = OUTLINED_FUNCTION_142();
    v77 = OUTLINED_FUNCTION_139(v75, v76);
    OUTLINED_FUNCTION_116(v77);
    OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_103(v74);
    OUTLINED_FUNCTION_83(&dword_2459B6000, v135, (os_log_type_t)v138, "SafariSummarizationPrefetch - Successfully fetched url path filter jsonl file: %s, version: %s, at path: %{sensitive}s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2();
  }
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_103((uint64_t)v126);

  (*(void (**)(uint64_t, uint64_t))(v137 + 8))(v61, v59);
  OUTLINED_FUNCTION_81(qword_2574D9C80);
  OUTLINED_FUNCTION_103((uint64_t)v130);
  return v17;
}

BOOL sub_2459C4810(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_2459C4820()
{
  return sub_2459D9B30();
}

uint64_t sub_2459C4844()
{
  sub_2459D9B24();
  sub_2459D9B30();
  return sub_2459D9B3C();
}

uint64_t sub_2459C4888(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)v2 + 32) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

BOOL sub_2459C48BC(char *a1, char *a2)
{
  return sub_2459C4810(*a1, *a2);
}

uint64_t sub_2459C48C8()
{
  return sub_2459C4844();
}

uint64_t sub_2459C48D0()
{
  return sub_2459C4820();
}

uint64_t sub_2459C48D8()
{
  sub_2459D9B24();
  sub_2459D9B30();
  return sub_2459D9B3C();
}

uint64_t sub_2459C4928(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2574D9460 + dword_2574D9460);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_2459C49B4;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_2459C49B4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_9_1();
  return OUTLINED_FUNCTION_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2459C49D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  _QWORD *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = v4;
  v8 = sub_2459D971C();
  v5[15] = v8;
  sub_2459C5F88(0, &qword_2574D9468);
  v9 = sub_2459D9830();
  v5[16] = v9;
  v5[2] = v5;
  v5[3] = sub_2459C4AC4;
  v10 = swift_continuation_init();
  v5[10] = MEMORY[0x24BDAC760];
  v5[11] = 0x40000000;
  v5[12] = sub_2459C4B24;
  v5[13] = &block_descriptor_35;
  v5[14] = v10;
  objc_msgSend(v6, sel_subscribe_subscriptions_queue_completion_, v8, v9, a4, v5 + 10);
  return swift_continuation_await();
}

uint64_t sub_2459C4AC4()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  void *v5;

  OUTLINED_FUNCTION_7();
  v1 = *v0;
  *v2 = v1;
  v4 = (void *)v3[15];
  v5 = (void *)v3[16];
  if (v3[6])
    swift_willThrow();

  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2459C4B24(uint64_t a1, void *a2)
{
  if (a2)
    return sub_2459C4B60(*(_QWORD *)(a1 + 32), (uint64_t)a2);
  else
    return j__swift_continuation_throwingResume();
}

uint64_t sub_2459C4B60(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9470);
  swift_allocError();
  *v3 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_2459C4BB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v17;
  uint64_t (*v19)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t);

  v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t))((char *)&dword_2574D9458 + dword_2574D9458);
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v17;
  *v17 = v8;
  v17[1] = sub_2459C6174;
  return v19(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_2459C4C70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8)
{
  void *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v10 = v8;
  v16 = sub_2459D971C();
  v9[16] = v16;
  if (a4)
    a4 = sub_2459D971C();
  v9[17] = a4;
  if (a5)
    a5 = sub_2459D9830();
  v9[18] = a5;
  v17 = MEMORY[0x24BDAC760];
  if (a7)
  {
    v9[14] = a7;
    v9[15] = a8;
    v9[10] = v17;
    v9[11] = 1107296256;
    v9[12] = sub_2459C4E40;
    v9[13] = &block_descriptor_32;
    a7 = _Block_copy(v9 + 10);
    swift_retain();
    v17 = MEMORY[0x24BDAC760];
    swift_release();
  }
  v9[19] = a7;
  v9[2] = v9;
  v9[3] = sub_2459C4DF4;
  v18 = swift_continuation_init();
  v9[10] = v17;
  v9[11] = 0x40000000;
  v9[12] = sub_2459C4E90;
  v9[13] = &block_descriptor_29;
  v9[14] = v18;
  objc_msgSend(v10, sel_updateAssetsForSubscriber_subscriptionName_policies_queue_detailedProgress_completion_, v16, a4, a5, a6, a7, v9 + 10);
  return swift_continuation_await();
}

uint64_t sub_2459C4DF4()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;

  OUTLINED_FUNCTION_7();
  v2 = *(void **)(v1 + 144);
  v4 = *(void **)(v1 + 128);
  v3 = *(void **)(v1 + 136);
  v6 = *v0;
  _Block_release(*(const void **)(v1 + 152));

  return OUTLINED_FUNCTION_14(*(uint64_t (**)(void))(v6 + 8));
}

void sub_2459C4E40(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_2459C4E90(uint64_t a1)
{
  return j__swift_continuation_resume(*(_QWORD *)(a1 + 32));
}

id sub_2459C4E9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2459C4EBC(a1, a2, a3, a4);
}

id sub_2459C4EBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD aBlock[6];
  _QWORD v18[3];
  uint64_t v19;

  sub_2459C5F40(a1, (uint64_t)v18);
  v8 = v19;
  if (v19)
  {
    v9 = __swift_project_boxed_opaque_existential_1(v18, v19);
    v10 = *(_QWORD *)(v8 - 8);
    MEMORY[0x24BDAC7A8](v9);
    v12 = (char *)aBlock - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v12);
    v13 = sub_2459D9AB8();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  }
  else
  {
    v13 = 0;
  }
  aBlock[4] = a3;
  aBlock[5] = a4;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2459C5028;
  aBlock[3] = &block_descriptor_27;
  v14 = _Block_copy(aBlock);
  swift_retain();
  v15 = objc_msgSend(v4, sel_observeAssetSet_queue_handler_, v13, a2, v14);
  swift_unknownObjectRelease();
  _Block_release(v14);
  swift_release();
  return v15;
}

uint64_t sub_2459C5028(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_2459C5054(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_2459C5074(a1, a2, a3);
}

id sub_2459C5074(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v5;
  id v6;

  v5 = (void *)sub_2459D971C();
  if (a3)
    a3 = (void *)sub_2459D96D4();
  v6 = objc_msgSend(v3, sel_retrieveAssetSet_usages_, v5, a3);

  return v6;
}

id sub_2459C50F4(uint64_t a1)
{
  return sub_2459C5114(a1);
}

id sub_2459C5114(uint64_t a1)
{
  void *v1;

  return objc_msgSend(v1, sel_removeObserver_, a1);
}

void sub_2459C5128(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  sub_2459C51D0(a1, a2, a3, a4, a5, a6);
}

uint64_t type metadata accessor for SASafariAssistantAssetProvider()
{
  return objc_opt_self();
}

uint64_t sub_2459C5168()
{
  uint64_t v0;

  OUTLINED_FUNCTION_9_1();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_2459C5194()
{
  unint64_t result;

  result = qword_2574D93C0;
  if (!qword_2574D93C0)
  {
    result = MEMORY[0x2495408C4](&unk_2459DBA3C, &unk_2516BF3D0);
    atomic_store(result, (unint64_t *)&qword_2574D93C0);
  }
  return result;
}

void sub_2459C51D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  void *v6;
  void *v7;
  void *v11;
  void *v12;
  _QWORD v13[6];

  v7 = v6;
  v11 = (void *)sub_2459D971C();
  v12 = (void *)sub_2459D9830();
  if (a5)
  {
    v13[4] = a5;
    v13[5] = a6;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 1107296256;
    v13[2] = sub_2459C52BC;
    v13[3] = &block_descriptor;
    a5 = _Block_copy(v13);
    swift_retain();
    swift_release();
  }
  objc_msgSend(v7, sel_unsubscribe_subscriptionNames_queue_completion_, v11, v12, a4, a5);
  _Block_release(a5);

}

void sub_2459C52BC(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

id sub_2459C5310(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v6;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v6 = v5;
  v10 = (void *)sub_2459D971C();
  swift_bridgeObjectRelease();
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9440);
    v11 = (void *)sub_2459D96D4();
    swift_bridgeObjectRelease();
    if (a4)
    {
LABEL_3:
      v12 = (void *)sub_2459D96D4();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    v11 = 0;
    if (a4)
      goto LABEL_3;
  }
  v12 = 0;
LABEL_6:
  v13 = sub_2459D95D8();
  v14 = 0;
  if (__swift_getEnumTagSinglePayload(a5, 1, v13) != 1)
  {
    v14 = (void *)sub_2459D959C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(a5, v13);
  }
  v15 = objc_msgSend(v6, sel_initWithName_assetSets_usageAliases_expires_, v10, v11, v12, v14);

  return v15;
}

unint64_t sub_2459C5454()
{
  unint64_t result;

  result = qword_2574D93D0;
  if (!qword_2574D93D0)
  {
    result = MEMORY[0x2495408C4](&unk_2459DAAB0, &type metadata for SafariSummarizationPrefetchAssetsError);
    atomic_store(result, (unint64_t *)&qword_2574D93D0);
  }
  return result;
}

unint64_t sub_2459C5490()
{
  unint64_t result;

  result = qword_2574D9F80;
  if (!qword_2574D9F80)
  {
    result = MEMORY[0x2495408C4](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2574D9F80);
  }
  return result;
}

unsigned __int8 *sub_2459C54CC(uint64_t a1, uint64_t a2, int64_t a3)
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
  v5 = sub_2459D980C();
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
  v5 = sub_2459C582C();
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
    v7 = (unsigned __int8 *)sub_2459D99E0();
  }
LABEL_7:
  v11 = sub_2459C55B0(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_2459C55B0(unsigned __int8 *result, uint64_t a2, int64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  unint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  unsigned __int8 v15;
  BOOL v16;
  uint64_t v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  unsigned __int8 *v21;
  unsigned int v22;
  char v23;
  unint64_t v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned __int8 v28;
  unint64_t v29;
  unsigned int v30;
  char v31;
  unint64_t v32;
  unsigned __int8 v33;

  v3 = a2;
  v4 = *result;
  if (v4 == 43)
  {
    if (a2 >= 1)
    {
      v17 = a2 - 1;
      if (a2 != 1)
      {
        v18 = a3 + 48;
        v19 = a3 + 55;
        v20 = a3 + 87;
        if (a3 > 10)
        {
          v18 = 58;
        }
        else
        {
          v20 = 97;
          v19 = 65;
        }
        if (result)
        {
          v9 = 0;
          v21 = result + 1;
          do
          {
            v22 = *v21;
            if (v22 < 0x30 || v22 >= v18)
            {
              if (v22 < 0x41 || v22 >= v19)
              {
                v13 = 0;
                if (v22 < 0x61 || v22 >= v20)
                  return (unsigned __int8 *)v13;
                v23 = -87;
              }
              else
              {
                v23 = -55;
              }
            }
            else
            {
              v23 = -48;
            }
            if (!is_mul_ok(v9, a3))
              return 0;
            v24 = v9 * a3;
            v25 = v22 + v23;
            v16 = __CFADD__(v24, v25);
            v9 = v24 + v25;
            if (v16)
              return 0;
            ++v21;
            --v17;
          }
          while (v17);
          return (unsigned __int8 *)v9;
        }
        return 0;
      }
      return 0;
    }
  }
  else
  {
    if (v4 != 45)
    {
      if (a2)
      {
        v26 = a3 + 48;
        v27 = a3 + 55;
        v28 = a3 + 87;
        if (a3 > 10)
        {
          v26 = 58;
        }
        else
        {
          v28 = 97;
          v27 = 65;
        }
        if (result)
        {
          v29 = 0;
          do
          {
            v30 = *result;
            if (v30 < 0x30 || v30 >= v26)
            {
              if (v30 < 0x41 || v30 >= v27)
              {
                v13 = 0;
                if (v30 < 0x61 || v30 >= v28)
                  return (unsigned __int8 *)v13;
                v31 = -87;
              }
              else
              {
                v31 = -55;
              }
            }
            else
            {
              v31 = -48;
            }
            if (!is_mul_ok(v29, a3))
              return 0;
            v32 = v29 * a3;
            v33 = v30 + v31;
            v16 = __CFADD__(v32, v33);
            v29 = v32 + v33;
            if (v16)
              return 0;
            ++result;
            --v3;
          }
          while (v3);
          return (unsigned __int8 *)v29;
        }
        return 0;
      }
      return 0;
    }
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
                v13 = 0;
                if (v11 < 0x61 || v11 >= v8)
                  return (unsigned __int8 *)v13;
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
            if (!is_mul_ok(v9, a3))
              return 0;
            v14 = v9 * a3;
            v15 = v11 + v12;
            v16 = v14 >= v15;
            v9 = v14 - v15;
            if (!v16)
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
  }
  __break(1u);
  return result;
}

uint64_t sub_2459C582C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_2459C5888();
  v4 = sub_2459C58BC(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_2459C5888()
{
  return sub_2459D9818();
}

uint64_t sub_2459C58BC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    sub_2459C5A00(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      sub_2459D74DC(v9, 0);
      v12 = v11;
      sub_2459C5AEC(v16, v11 + 32, v10, a1, a2, a3, a4);
      v14 = v13;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v14 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v12 = MEMORY[0x24BEE4AF8];
    }
    v15 = MEMORY[0x249540060](v12 + 32, *(_QWORD *)(v12 + 16));
    swift_release();
    return v15;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x249540060);
LABEL_9:
      sub_2459D99E0();
      goto LABEL_12;
    }
    v16[0] = a3;
    v16[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x249540060]((char *)v16 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

void sub_2459C5A00(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v7 = a1;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    sub_2459D7538(a1, a3, a4);
    v7 = v10;
  }
  if ((a2 & 0xC) == v9)
  {
    sub_2459D7538(a2, a3, a4);
    a2 = v11;
    if ((a4 & 0x1000000000000000) == 0)
      return;
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return;
  }
  v12 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v12 = a3 & 0xFFFFFFFFFFFFLL;
  if (v12 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v12 >= a2 >> 16)
  {
    sub_2459D97E8();
    return;
  }
  __break(1u);
}

void sub_2459C5AEC(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v19;
  uint64_t v20;
  char v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v28;
  unint64_t v29;
  _QWORD v30[2];

  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v11 = a4;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v29 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = a4;
LABEL_33:
    *a1 = a4;
    a1[1] = a5;
    a1[2] = a6;
    a1[3] = a7;
    a1[4] = v11;
    return;
  }
  v13 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v23 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v24 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v25 = v16;
  v28 = a3 - 1;
  v11 = a4;
  while (1)
  {
    v17 = v11;
    if ((v11 & 0xC) == v15)
      sub_2459D7538(v11, a6, a7);
    if (v17 >> 14 < v29 || v17 >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      v21 = sub_2459D97F4();
    }
    else
    {
      v19 = v17 >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v30[0] = a6;
        v30[1] = v24;
        v21 = *((_BYTE *)v30 + v19);
      }
      else
      {
        v20 = v23;
        if ((a6 & 0x1000000000000000) == 0)
          v20 = sub_2459D99E0();
        v21 = *(_BYTE *)(v20 + v19);
      }
    }
    if ((v11 & 0xC) == v15)
    {
      sub_2459D7538(v11, a6, a7);
      v11 = v22;
      if ((a7 & 0x1000000000000000) == 0)
      {
LABEL_27:
        v11 = (v11 & 0xFFFFFFFFFFFF0000) + 65540;
        goto LABEL_31;
      }
    }
    else if ((a7 & 0x1000000000000000) == 0)
    {
      goto LABEL_27;
    }
    if (v25 <= v11 >> 16)
      goto LABEL_35;
    v11 = sub_2459D97D0();
LABEL_31:
    *(_BYTE *)(a2 + v13) = v21;
    if (v28 != v13)
    {
      ++v13;
      if (v10 != v11 >> 14)
        continue;
    }
    goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

unint64_t sub_2459C5CEC()
{
  unint64_t result;

  result = qword_2574D9408;
  if (!qword_2574D9408)
  {
    result = MEMORY[0x2495408C4](&unk_2459DBB04, &unk_2516BF340);
    atomic_store(result, (unint64_t *)&qword_2574D9408);
  }
  return result;
}

unint64_t sub_2459C5D28()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2574D9410;
  if (!qword_2574D9410)
  {
    v1 = sub_2459D9530();
    result = MEMORY[0x2495408C4](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, &qword_2574D9410);
  }
  return result;
}

uint64_t sub_2459C5D68()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2459C5D8C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2459C5DB0()
{
  uint64_t v0;

  return sub_2459BFBA8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_2459C5DB8()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2459C5DE4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2459C6174;
  return sub_2459C0080();
}

uint64_t sub_2459C5E5C(uint64_t a1)
{
  uint64_t v1;

  return sub_2459BF8F4(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_2459C5E64()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9428);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  OUTLINED_FUNCTION_69();
  return swift_deallocObject();
}

uint64_t sub_2459C5EC4(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9428);
  return sub_2459BFA30(a1);
}

uint64_t sub_2459C5F04(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
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

uint64_t sub_2459C5F40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2574D9120);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2459C5F88(uint64_t a1, unint64_t *a2)
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

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SafariSummarizationPrefetchAssetsError(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xF8)
  {
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
    v5 = (*a1 | (v4 << 8)) - 9;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v5 = v6 - 9;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SafariSummarizationPrefetchAssetsError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2459C60A0 + 4 * byte_2459DA905[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_2459C60D4 + 4 * byte_2459DA900[v4]))();
}

uint64_t sub_2459C60D4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2459C60DC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2459C60E4);
  return result;
}

uint64_t sub_2459C60F0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2459C60F8);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_2459C60FC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2459C6104(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2459C6110(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2459C611C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SafariSummarizationPrefetchAssetsError()
{
  return &type metadata for SafariSummarizationPrefetchAssetsError;
}

unint64_t sub_2459C6138()
{
  unint64_t result;

  result = qword_2574D9478;
  if (!qword_2574D9478)
  {
    result = MEMORY[0x2495408C4](&unk_2459DAA88, &type metadata for SafariSummarizationPrefetchAssetsError);
    atomic_store(result, (unint64_t *)&qword_2574D9478);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_5_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = __swift_project_value_buffer(v2, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v5, v2);
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  uint64_t v0;

  return sub_2459D6FF4(0x6E6F6D6D6F63, 0xE600000000000000, (uint64_t *)(v0 - 72));
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return sub_2459D9950();
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_11_1@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(v3, a1, v2);
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_18()
{
  return sub_2459D9950();
}

uint64_t OUTLINED_FUNCTION_19_0@<X0>(_BYTE *a1@<X1>, char a2@<W8>)
{
  *a1 = a2;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return sub_2459D9950();
}

uint64_t OUTLINED_FUNCTION_24_0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_27_0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  return sub_2459D6FF4(0xD000000000000011, a2, a3);
}

uint64_t OUTLINED_FUNCTION_29_0(uint64_t a1, _BYTE *a2)
{
  *a2 = 6;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_34_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  return sub_2459D9530();
}

void OUTLINED_FUNCTION_36_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 2u);
}

BOOL OUTLINED_FUNCTION_40_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_41_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  return sub_2459D9950();
}

uint64_t OUTLINED_FUNCTION_43_0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_44(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = a1;
  return sub_2459D9950();
}

void OUTLINED_FUNCTION_45()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_46()
{
  return sub_2459D9704();
}

uint64_t OUTLINED_FUNCTION_51()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_53()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_54()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_62()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_63()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_64()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_65()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_66()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_67()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_68()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_69()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_70()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_73(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0x20u);
}

uint64_t OUTLINED_FUNCTION_74()
{
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_75@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v3, v2);
}

uint64_t OUTLINED_FUNCTION_77(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

void OUTLINED_FUNCTION_78(uint64_t a1@<X8>)
{
  char v1;
  uint64_t v2;

  *(_BYTE *)(v2 + a1) = v1;
  sub_2459D0864();
}

void OUTLINED_FUNCTION_79(uint64_t a1@<X8>)
{
  char v1;
  uint64_t v2;

  *(_BYTE *)(v2 + a1) = v1;
  sub_2459D0864();
}

void OUTLINED_FUNCTION_81(uint64_t a1@<X8>)
{
  char v1;
  uint64_t v2;

  *(_BYTE *)(v2 + a1) = v1;
  sub_2459D0864();
}

void OUTLINED_FUNCTION_82(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_83(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0x20u);
}

void OUTLINED_FUNCTION_84(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_85()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_86(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_2459D6FF4(a1, a2, (uint64_t *)(v2 - 96));
}

uint64_t OUTLINED_FUNCTION_87@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(v2, a1, v3);
}

uint64_t OUTLINED_FUNCTION_89()
{
  return swift_bridgeObjectRetain();
}

_QWORD *OUTLINED_FUNCTION_90(uint64_t a1)
{
  _QWORD *v1;

  *v1 = a1;
  return v1;
}

uint64_t OUTLINED_FUNCTION_91@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  return sub_2459D6FF4(a1, (a2 - 32) | 0x8000000000000000, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_92()
{
  return sub_2459D9950();
}

uint64_t OUTLINED_FUNCTION_93()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_94()
{
  unint64_t v0;
  uint64_t v1;

  return sub_2459D6FF4(*(_QWORD *)(v1 - 136), v0, (uint64_t *)(v1 - 96));
}

BOOL OUTLINED_FUNCTION_95(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_96()
{
  return sub_2459D98D8();
}

uint64_t OUTLINED_FUNCTION_97@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_101(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;

  return sub_2459D6FF4(a1, v1, (uint64_t *)(v2 - 104));
}

uint64_t OUTLINED_FUNCTION_102()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  return v0;
}

uint64_t OUTLINED_FUNCTION_103(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

BOOL OUTLINED_FUNCTION_104(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_106(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 + a1) = 83;
  sub_2459D0864();
}

uint64_t OUTLINED_FUNCTION_107()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_108()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_109(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2459D213C(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_110()
{
  return sub_2459D9950();
}

id OUTLINED_FUNCTION_111(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_113()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_114()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_115()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_116(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 72) = a1;
  return v1 - 72;
}

void OUTLINED_FUNCTION_118()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_119@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

BOOL OUTLINED_FUNCTION_120(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_121()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return sub_2459D213C(v1, v2, v0);
}

uint64_t OUTLINED_FUNCTION_122()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_124()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_125@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  return sub_2459D6FF4(a1, a2 | 0x8000000000000000, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_126(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_127()
{
  return sub_2459D94AC();
}

uint64_t OUTLINED_FUNCTION_128()
{
  return sub_2459D9608();
}

uint64_t OUTLINED_FUNCTION_129(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 120) = a1;
  return v1 - 120;
}

uint64_t OUTLINED_FUNCTION_130(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;

  return sub_2459D6FF4(a1, v1, (uint64_t *)(v2 - 96));
}

uint64_t OUTLINED_FUNCTION_131(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;

  return sub_2459D6FF4(a1, v1, (uint64_t *)(v2 - 96));
}

uint64_t OUTLINED_FUNCTION_133(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_project_value_buffer(*(_QWORD *)(v2 - 192), a2);
}

uint64_t OUTLINED_FUNCTION_134()
{
  return sub_2459D9950();
}

uint64_t OUTLINED_FUNCTION_137()
{
  return sub_2459D9950();
}

uint64_t OUTLINED_FUNCTION_138(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_139(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_2459D6FF4(a1, a2, (uint64_t *)(v2 - 104));
}

void OUTLINED_FUNCTION_140(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0x34u);
}

uint64_t OUTLINED_FUNCTION_141()
{
  return sub_2459D96A4();
}

uint64_t OUTLINED_FUNCTION_142()
{
  return sub_2459D9500();
}

uint64_t OUTLINED_FUNCTION_143@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_144()
{
  return sub_2459D9950();
}

uint64_t OUTLINED_FUNCTION_145(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_2459D1FD4(a9);
}

uint64_t OUTLINED_FUNCTION_146()
{
  return sub_2459D9500();
}

unint64_t OUTLINED_FUNCTION_147()
{
  return sub_2459C5454();
}

uint64_t OUTLINED_FUNCTION_148()
{
  return sub_2459D96A4();
}

void OUTLINED_FUNCTION_149(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_150()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_151()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_153(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2459D213C(a1, a2, *(_QWORD *)(v2 - 112));
}

uint64_t OUTLINED_FUNCTION_154()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_155()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_156()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_157()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_158@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(v2, a1, v3);
}

uint64_t OUTLINED_FUNCTION_159()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_160(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 72) = result;
  return result;
}

void OUTLINED_FUNCTION_165()
{
  sub_2459D0864();
}

uint64_t OUTLINED_FUNCTION_167(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2459D213C(a1, a2, *(_QWORD *)(v2 - 112));
}

uint64_t OUTLINED_FUNCTION_168@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t OUTLINED_FUNCTION_169()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_170()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_171()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_173()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_174()
{
  return swift_task_dealloc();
}

uint64_t sub_2459C687C()
{
  return 41;
}

uint64_t sub_2459C6884()
{
  uint64_t v0;
  uint64_t v1;

  if ((*(_BYTE *)(v0 + 81) & 1) == 0)
    sub_2459CDF20();
  v1 = sub_2459CCFD4();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return v1;
}

uint64_t sub_2459C68E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  int v17;
  unint64_t v18;
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
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;

  v1 = v0;
  sub_2459D98D8();
  sub_2459D9668();
  sub_2459CD080();
  sub_2459D98D8();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D90F0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_2459DA4A0;
  v3 = *(_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 464) + 8);
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9110);
  v4 = sub_2459D9764();
  v6 = v5;
  *(_QWORD *)(v2 + 56) = MEMORY[0x24BEE0D00];
  v7 = sub_2459BD084();
  *(_QWORD *)(v2 + 64) = v7;
  *(_QWORD *)(v2 + 32) = v4;
  *(_QWORD *)(v2 + 40) = v6;
  sub_2459D9668();
  swift_bridgeObjectRelease();
  sub_2459D98D8();
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_2459DA4A0;
  ObjectType = swift_getObjectType();
  v40 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
  v40(ObjectType, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9108);
  v10 = sub_2459D9764();
  *(_QWORD *)(v8 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v8 + 64) = v7;
  *(_QWORD *)(v8 + 32) = v10;
  *(_QWORD *)(v8 + 40) = v11;
  sub_2459D9668();
  swift_bridgeObjectRelease();
  v12 = sub_2459CDAA4();
  if ((v15 & 1) != 0)
  {
    sub_2459D98D8();
    v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_2459DA4A0;
    v40(ObjectType, v3);
    v32 = sub_2459D9764();
    v33 = MEMORY[0x24BEE0D00];
    v30 = v7;
    *(_QWORD *)(v31 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v31 + 64) = v7;
    *(_QWORD *)(v31 + 32) = v32;
    *(_QWORD *)(v31 + 40) = v34;
    sub_2459D9668();
    v29 = v33;
  }
  else
  {
    v16 = v13;
    v17 = v14;
    v18 = HIDWORD(v14);
    v41 = v12;
    sub_2459D98D8();
    v19 = swift_allocObject();
    v20 = MEMORY[0x24BEE1768];
    *(_OWORD *)(v19 + 16) = xmmword_2459DA4A0;
    v21 = MEMORY[0x24BEE17F0];
    *(_QWORD *)(v19 + 56) = v20;
    *(_QWORD *)(v19 + 64) = v21;
    *(_QWORD *)(v19 + 32) = v16;
    sub_2459D9668();
    swift_bridgeObjectRelease();
    sub_2459D98D8();
    v22 = swift_allocObject();
    v23 = MEMORY[0x24BEE44F0];
    *(_OWORD *)(v22 + 16) = xmmword_2459DA4A0;
    v24 = MEMORY[0x24BEE4558];
    *(_QWORD *)(v22 + 56) = v23;
    *(_QWORD *)(v22 + 64) = v24;
    *(_DWORD *)(v22 + 32) = v18;
    sub_2459D9668();
    swift_bridgeObjectRelease();
    sub_2459D98D8();
    v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_2459DA4A0;
    *(_QWORD *)(v25 + 56) = v23;
    *(_QWORD *)(v25 + 64) = v24;
    *(_DWORD *)(v25 + 32) = v17;
    sub_2459D9668();
    swift_bridgeObjectRelease();
    sub_2459D98D8();
    v26 = swift_allocObject();
    v27 = MEMORY[0x24BEE13C8];
    *(_OWORD *)(v26 + 16) = xmmword_2459DA4A0;
    v28 = MEMORY[0x24BEE1448];
    *(_QWORD *)(v26 + 56) = v27;
    *(_QWORD *)(v26 + 64) = v28;
    *(_QWORD *)(v26 + 32) = v41;
    sub_2459D9668();
    v29 = MEMORY[0x24BEE0D00];
    v30 = v7;
  }
  swift_bridgeObjectRelease();
  sub_2459D98D8();
  v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_2459DA4A0;
  v36 = *(id *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 472));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9118);
  v37 = sub_2459D9764();
  *(_QWORD *)(v35 + 56) = v29;
  *(_QWORD *)(v35 + 64) = v30;
  *(_QWORD *)(v35 + 32) = v37;
  *(_QWORD *)(v35 + 40) = v38;
  sub_2459D9668();
  swift_bridgeObjectRelease();
  sub_2459D98D8();
  return sub_2459D9668();
}

uint64_t sub_2459C6DE4(uint64_t a1, unint64_t a2, double a3)
{
  int v3;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  v6 = HIDWORD(a2);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D90F0);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_2459DA470;
  v8 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v7 + 64) = v8;
  *(_QWORD *)(v7 + 32) = a1;
  v9 = MEMORY[0x24BEE44F0];
  v10 = MEMORY[0x24BEE4558];
  *(_QWORD *)(v7 + 96) = MEMORY[0x24BEE44F0];
  *(_QWORD *)(v7 + 104) = v10;
  *(_DWORD *)(v7 + 72) = v3;
  *(_QWORD *)(v7 + 136) = v9;
  *(_QWORD *)(v7 + 144) = v10;
  v11 = MEMORY[0x24BEE13C8];
  *(_DWORD *)(v7 + 112) = v6;
  v12 = MEMORY[0x24BEE1448];
  *(_QWORD *)(v7 + 176) = v11;
  *(_QWORD *)(v7 + 184) = v12;
  *(double *)(v7 + 152) = a3;
  sub_2459CEB94("statusCode=%{signpost.description:attribute,public}d, download=%{signpost.description:attribute}lu, upload=%{signpost.description:attribute}lu, runtime=%{signpost.description:attribute}f", 186, 2, v7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2459C6EB8()
{
  if (qword_2574D8AD8 != -1)
    swift_once();
  qword_2574DA468 = qword_2574DA4F8;
  unk_2574DA470 = unk_2574DA500;
  return swift_bridgeObjectRetain();
}

uint64_t *sub_2459C6F08()
{
  if (qword_2574D8A90 != -1)
    swift_once();
  return &qword_2574DA468;
}

void sub_2459C6F48()
{
  qword_2574DA478 = (uint64_t)&unk_2516BDFC0;
}

unint64_t sub_2459C6F5C()
{
  return 0xD000000000000010;
}

uint64_t sub_2459C6F78()
{
  uint64_t v0;

  sub_2459C6F08();
  v0 = qword_2574DA468;
  swift_bridgeObjectRetain();
  return v0;
}

void sub_2459C6FB0()
{
  sub_2459CEC6C();
}

void sub_2459C6FB8()
{
  sub_2459CED6C();
}

void sub_2459C6FC0()
{
  sub_2459CEE90();
}

uint64_t sub_2459C6FC8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2459C687C();
  *a1 = result;
  return result;
}

uint64_t sub_2459C6FF0@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;

  result = sub_2459BBC9C(*v1);
  *a1 = result;
  return result;
}

BOOL sub_2459C7018(char *a1, char *a2)
{
  return sub_2459CEC24(*a1, *a2);
}

uint64_t sub_2459C7024()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + qword_2574DA480;
  v2 = sub_2459D9650();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
}

uint64_t sub_2459C7060()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)(v0 + 81) & 1) == 0)
    sub_2459CDF20();
  v1 = sub_2459C6884();
  v2 = v1 + qword_2574DA480;
  v3 = sub_2459D9650();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  return v1;
}

uint64_t sub_2459C70B8()
{
  sub_2459C7060();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceAccessNetworkSpan()
{
  uint64_t result;

  result = qword_2574D94A8;
  if (!qword_2574D94A8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2459C7110()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2459D9650();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_2459C7184()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_2459D98D8();
  sub_2459D9668();
  sub_2459C68E4();
  sub_2459D98D8();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D90F0);
  v0 = OUTLINED_FUNCTION_0_2();
  *(_OWORD *)(v0 + 16) = xmmword_2459DA4A0;
  v1 = sub_2459D9638();
  v3 = v2;
  v4 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v0 + 56) = MEMORY[0x24BEE0D00];
  v5 = sub_2459BD084();
  *(_QWORD *)(v0 + 64) = v5;
  *(_QWORD *)(v0 + 32) = v1;
  *(_QWORD *)(v0 + 40) = v3;
  OUTLINED_FUNCTION_0_4();
  sub_2459D9668();
  swift_bridgeObjectRelease();
  sub_2459D98D8();
  v6 = OUTLINED_FUNCTION_0_2();
  *(_OWORD *)(v6 + 16) = xmmword_2459DA4A0;
  v7 = sub_2459D9638();
  *(_QWORD *)(v6 + 56) = v4;
  *(_QWORD *)(v6 + 64) = v5;
  *(_QWORD *)(v6 + 32) = v7;
  *(_QWORD *)(v6 + 40) = v8;
  OUTLINED_FUNCTION_0_4();
  sub_2459D9668();
  swift_bridgeObjectRelease();
  sub_2459D98D8();
  return sub_2459D9668();
}

uint64_t sub_2459C72F4(uint64_t a1, unint64_t a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v6 = sub_2459BCE68(a1, a2, a3);
  if (qword_2574D8AA8 != -1)
    swift_once();
  v7 = qword_2574DA498;
  v8 = unk_2574DA4A0;
  swift_bridgeObjectRetain();
  sub_2459D9644();
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithUnsignedInteger_, sub_2459D962C());
  swift_isUniquelyReferenced_nonNull_native();
  sub_2459D1188((uint64_t)v9, v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2459CEEF4(v6);
  swift_bridgeObjectRelease();
  return sub_2459C6DE4(a1, a2, a3);
}

uint64_t getEnumTagSinglePayload for ResourceAccessActivity(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xD8)
  {
    if (a2 + 40 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 40) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 41;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x29;
  v5 = v6 - 41;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ResourceNetworkActivity(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 40 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 40) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xD8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xD7)
    return ((uint64_t (*)(void))((char *)&loc_2459C74EC + 4 * byte_2459DAB05[v4]))();
  *a1 = a2 + 40;
  return ((uint64_t (*)(void))((char *)sub_2459C7520 + 4 * byte_2459DAB00[v4]))();
}

uint64_t sub_2459C7520(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2459C7528(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2459C7530);
  return result;
}

uint64_t sub_2459C753C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2459C7544);
  *(_BYTE *)result = a2 + 40;
  return result;
}

uint64_t sub_2459C7548(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2459C7550(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ResourceNetworkActivity()
{
  return &type metadata for ResourceNetworkActivity;
}

unint64_t sub_2459C7570()
{
  unint64_t result;

  result = qword_2574D9740;
  if (!qword_2574D9740)
  {
    result = MEMORY[0x2495408C4](&unk_2459DAB68, &type metadata for ResourceNetworkActivity);
    atomic_store(result, (unint64_t *)&qword_2574D9740);
  }
  return result;
}

unint64_t sub_2459C75AC(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_2459C75D8();
  result = sub_2459C7614();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_2459C75D8()
{
  unint64_t result;

  result = qword_2574D9748;
  if (!qword_2574D9748)
  {
    result = MEMORY[0x2495408C4](&unk_2459DABC8, &type metadata for ResourceNetworkActivity);
    atomic_store(result, (unint64_t *)&qword_2574D9748);
  }
  return result;
}

unint64_t sub_2459C7614()
{
  unint64_t result;

  result = qword_2574D9750;
  if (!qword_2574D9750)
  {
    result = MEMORY[0x2495408C4](&unk_2459DAB90, &type metadata for ResourceNetworkActivity);
    atomic_store(result, (unint64_t *)&qword_2574D9750);
  }
  return result;
}

unint64_t sub_2459C7654()
{
  unint64_t result;

  result = qword_2574D9758;
  if (!qword_2574D9758)
  {
    result = MEMORY[0x2495408C4](&unk_2459DB3A8, &type metadata for ResourceAccessActivity);
    atomic_store(result, (unint64_t *)&qword_2574D9758);
  }
  return result;
}

unint64_t sub_2459C7690(uint64_t a1)
{
  unint64_t result;

  result = sub_2459C76B4();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2459C76B4()
{
  unint64_t result;

  result = qword_2574D9798;
  if (!qword_2574D9798)
  {
    result = MEMORY[0x2495408C4](&unk_2459DAC28, &type metadata for ResourceNetworkActivity);
    atomic_store(result, (unint64_t *)&qword_2574D9798);
  }
  return result;
}

uint64_t sub_2459C7704()
{
  uint64_t v0;

  sub_2459C5F04(v0 + 16);
  return swift_deallocClassInstance();
}

_QWORD *sub_2459C7728(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  _DWORD *v5;
  uint64_t v6;

  v2[3] = 0;
  swift_unknownObjectWeakInit();
  type metadata accessor for Locker();
  v4 = OUTLINED_FUNCTION_3_0();
  v5 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = 0;
  v6 = MEMORY[0x24BEE4B00];
  v2[4] = v4;
  v2[5] = v6;
  v2[3] = a2;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v2;
}

uint64_t sub_2459C77BC()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v14;

  v1 = v0;
  v14 = MEMORY[0x24BEE4AF8];
  v2 = *(os_unfair_lock_s **)(*(_QWORD *)(v0 + 32) + 16);
  os_unfair_lock_lock(v2);
  swift_beginAccess();
  v3 = swift_bridgeObjectRetain();
  sub_2459C7A58(v3, (void (*)(uint64_t, uint64_t, uint64_t))sub_2459C8320);
  OUTLINED_FUNCTION_114();
  os_unfair_lock_unlock(v2);
  if (MEMORY[0x2495409D8](v1 + 16))
  {
    v4 = *(_QWORD *)(v1 + 24);
    ObjectType = swift_getObjectType();
    v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24);
    v7 = swift_bridgeObjectRetain();
    v6(v7, ObjectType, v4);
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_3_3();
  }
  v8 = *(_QWORD *)(v14 + 16);
  if (v8)
  {
    swift_bridgeObjectRetain();
    v9 = (uint64_t *)(v14 + 40);
    do
    {
      v10 = *v9;
      v11 = swift_getObjectType();
      v12 = *(void (**)(uint64_t, uint64_t))(v10 + 72);
      swift_unknownObjectRetain();
      v12(v11, v10);
      OUTLINED_FUNCTION_3_3();
      v9 += 2;
      --v8;
    }
    while (v8);
    OUTLINED_FUNCTION_114();
  }
  OUTLINED_FUNCTION_114();
  sub_2459C5F04(v1 + 16);
  swift_release();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_2459C791C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v16;
  uint64_t v17;

  v8 = MEMORY[0x2495409D8](a3 + 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)(a3 + 24);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v10 + 64))(ObjectType, v10);
    swift_unknownObjectRetain();
    sub_2459C7DD0();
    v12 = *(char **)(*a4 + 16);
    sub_2459C7E18(v12);
    v13 = *a4;
    *(_QWORD *)(v13 + 16) = v12 + 1;
    v14 = v13 + 16 * (_QWORD)v12;
    *(_QWORD *)(v14 + 32) = v9;
    *(_QWORD *)(v14 + 40) = v10;
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_2459C847C();
    v16 = (void *)sub_2459D9920();
    sub_2459D98D8();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D90F0);
    v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_2459DA4A0;
    *(_QWORD *)(v17 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v17 + 64) = sub_2459BD084();
    *(_QWORD *)(v17 + 32) = a1;
    *(_QWORD *)(v17 + 40) = a2;
    swift_bridgeObjectRetain();
    sub_2459D9668();

    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2459C7A58(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[5];

  sub_2459C8444(a1, v19);
  v3 = v19[0];
  v4 = v19[1];
  v5 = v19[3];
  v6 = v19[4];
  v7 = (unint64_t)(v19[2] + 64) >> 6;
  result = swift_bridgeObjectRetain();
  if (!v6)
    goto LABEL_3;
LABEL_2:
  v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  v10 = v9 | (v5 << 6);
  while (1)
  {
    v15 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v10);
    v16 = *v15;
    v17 = v15[1];
    v18 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
    swift_retain();
    a2(v16, v17, v18);
    swift_release();
    result = swift_bridgeObjectRelease();
    if (v6)
      goto LABEL_2;
LABEL_3:
    v11 = v5 + 1;
    if (__OFADD__(v5, 1))
      break;
    if (v11 >= v7)
      return swift_release();
    v12 = *(_QWORD *)(v4 + 8 * v11);
    v13 = v5 + 1;
    if (!v12)
    {
      v13 = v5 + 2;
      if (v5 + 2 >= v7)
        return swift_release();
      v12 = *(_QWORD *)(v4 + 8 * v13);
      if (!v12)
      {
        v13 = v5 + 3;
        if (v5 + 3 >= v7)
          return swift_release();
        v12 = *(_QWORD *)(v4 + 8 * v13);
        if (!v12)
        {
          v13 = v5 + 4;
          if (v5 + 4 >= v7)
            return swift_release();
          v12 = *(_QWORD *)(v4 + 8 * v13);
          if (!v12)
          {
            v13 = v5 + 5;
            if (v5 + 5 >= v7)
              return swift_release();
            v12 = *(_QWORD *)(v4 + 8 * v13);
            if (!v12)
            {
              v14 = v5 + 6;
              while (v14 < v7)
              {
                v12 = *(_QWORD *)(v4 + 8 * v14++);
                if (v12)
                {
                  v13 = v14 - 1;
                  goto LABEL_18;
                }
              }
              return swift_release();
            }
          }
        }
      }
    }
LABEL_18:
    v6 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
    v5 = v13;
  }
  __break(1u);
  return result;
}

uint64_t sub_2459C7BD8()
{
  sub_2459C77BC();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ActivityMonitor()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ActivityMonitor.WeakReference()
{
  return objc_opt_self();
}

uint64_t sub_2459C7C38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;

  swift_beginAccess();
  v8 = sub_2459C821C();
  swift_endAccess();
  result = swift_release();
  if (!v8)
  {
    if (MEMORY[0x2495409D8](a1 + 16))
    {
      v10 = *(_QWORD *)(a1 + 24);
      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 40))(a4, a5, ObjectType, v10);
      OUTLINED_FUNCTION_3_3();
    }
    v12 = swift_getObjectType();
    v13 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a5 + 32))(v12, a5);
    sub_2459D98D8();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D90F0);
    v14 = OUTLINED_FUNCTION_3_0();
    *(_OWORD *)(v14 + 16) = xmmword_2459DA490;
    v15 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 24))(v12, a5);
    v17 = v16;
    v18 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v14 + 56) = MEMORY[0x24BEE0D00];
    v19 = sub_2459BD084();
    *(_QWORD *)(v14 + 64) = v19;
    *(_QWORD *)(v14 + 32) = v15;
    *(_QWORD *)(v14 + 40) = v17;
    (*(void (**)(uint64_t, uint64_t))(a5 + 40))(v12, a5);
    v20 = sub_2459D99D4();
    *(_QWORD *)(v14 + 96) = v18;
    *(_QWORD *)(v14 + 104) = v19;
    *(_QWORD *)(v14 + 72) = v20;
    *(_QWORD *)(v14 + 80) = v21;
    sub_2459D9668();

    return OUTLINED_FUNCTION_4_2();
  }
  return result;
}

char *sub_2459C7DD0()
{
  uint64_t *v0;
  uint64_t v1;
  char *result;

  v1 = *v0;
  result = (char *)swift_isUniquelyReferenced_nonNull_native();
  *v0 = v1;
  if (!(_DWORD)result)
  {
    result = sub_2459C7F30(result, *(_QWORD *)(v1 + 16) + 1, 1, v1);
    *v0 = (uint64_t)result;
  }
  return result;
}

char *sub_2459C7E18(char *result)
{
  uint64_t *v1;
  unint64_t v2;

  v2 = *(_QWORD *)(*v1 + 24);
  if ((uint64_t)(result + 1) > (uint64_t)(v2 >> 1))
  {
    result = sub_2459C7F30((char *)(v2 > 1), (int64_t)(result + 1), 1, *v1);
    *v1 = (uint64_t)result;
  }
  return result;
}

char *sub_2459C7E54(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9990);
    v10 = (char *)OUTLINED_FUNCTION_3_0();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_2459D6BD8((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2459C801C(0, v8, v12, a4);
  }
  return v10;
}

char *sub_2459C7F30(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9980);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_2459D6DB4((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2459C8108(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

char *sub_2459C801C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4;
  char *v5;
  char *v6;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + a1 + 32);
    v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = (char *)sub_2459D9A4C();
  __break(1u);
  return result;
}

uint64_t sub_2459C8108(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9988);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_2459D9A4C();
  __break(1u);
  return result;
}

uint64_t sub_2459C821C()
{
  uint64_t *v0;
  uint64_t *v1;
  unint64_t v2;
  char v3;
  char v4;
  uint64_t v5;
  uint64_t v7;

  v1 = v0;
  swift_bridgeObjectRetain();
  v2 = sub_2459D7754();
  v4 = v3;
  swift_bridgeObjectRelease();
  if ((v4 & 1) == 0)
    return 0;
  swift_isUniquelyReferenced_nonNull_native();
  v7 = *v1;
  *v1 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9970);
  sub_2459D99EC();
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v2);
  type metadata accessor for ActivityMonitor.WeakReference();
  sub_2459D9A04();
  *v1 = v7;
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2459C8320(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_2459C791C(a1, a2, a3, *(uint64_t **)(v3 + 16));
}

uint64_t sub_2459C8328(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  os_unfair_lock_s *v11;

  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 56))(a3, a4);
  v10 = v9;
  v11 = *(os_unfair_lock_s **)(*(_QWORD *)(a2 + 32) + 16);
  os_unfair_lock_lock(v11);
  sub_2459C7C38(a2, v8, v10, a1, a4);
  os_unfair_lock_unlock(v11);
  OUTLINED_FUNCTION_4_2();
  swift_unknownObjectRetain();
  sub_2459C83D4(a2, a1, a3, a4);
  return swift_unknownObjectRelease();
}

uint64_t sub_2459C83D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t ObjectType;

  result = MEMORY[0x2495409D8](a1 + 16);
  if (result)
  {
    v8 = *(_QWORD *)(a1 + 24);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(a2, a4, ObjectType, v8);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_2459C8444@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v2 = -1;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  *a2 = a1;
  v6 = *(_QWORD *)(a1 + 64);
  result = a1 + 64;
  v5 = v6;
  if (-v3 < 64)
    v2 = ~(-1 << -(char)v3);
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

unint64_t sub_2459C847C()
{
  unint64_t result;

  result = qword_2574D9978;
  if (!qword_2574D9978)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2574D9978);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return swift_bridgeObjectRelease();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_2459C84CC()
{
  swift_bridgeObjectRetain();
  sub_2459D97A0();
  swift_bridgeObjectRetain();
  sub_2459D97A0();
  swift_bridgeObjectRelease();
}

void sub_2459C853C(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;

  *(_QWORD *)(v1 + 16) = a1;
  swift_bridgeObjectRetain();
  v2 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = 0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_5();
}

uint64_t sub_2459C857C(char a1)
{
  uint64_t v1;
  _DWORD *v2;

  *(_BYTE *)(v1 + 16) = a1;
  v2 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = 0;
  return v1;
}

_QWORD *sub_2459C85A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _DWORD *v6;

  v3[2] = a1;
  v3[3] = a2;
  v3[4] = a3;
  sub_2459C91AC(a1, a2);
  v6 = (_DWORD *)swift_slowAlloc();
  v3[5] = v6;
  *v6 = 0;
  sub_2459C91DC(a1, a2);
  return v3;
}

uint64_t sub_2459C8608(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;

  *(_QWORD *)(v1 + 16) = a1;
  swift_retain();
  v2 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = 0;
  swift_release();
  return v1;
}

uint64_t sub_2459C864C(char a1)
{
  uint64_t v1;

  type metadata accessor for Lock();
  swift_allocObject();
  *(_QWORD *)(v1 + 16) = Lock.init()();
  *(_BYTE *)(v1 + 24) = a1;
  return v1;
}

id sub_2459C869C(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  id v6;
  _OWORD v8[2];
  uint64_t v9;
  _OWORD v10[2];
  uint64_t v11;

  type metadata accessor for ActivityMonitor();
  swift_allocObject();
  v4 = sub_2459C7728(0, 0);
  type metadata accessor for DeviceContext();
  swift_allocObject();
  v5 = sub_2459BBF2C();
  v11 = 0;
  memset(v10, 0, sizeof(v10));
  memset(v8, 0, sizeof(v8));
  v9 = 0;
  v6 = objc_allocWithZone((Class)type metadata accessor for SASafariAssistantAssetManager());
  swift_bridgeObjectRetain();
  return sub_2459C8B64((uint64_t)v4, v5, a1, a2, (uint64_t)v10, (uint64_t)v8, 0, 0, v6);
}

SAAssetManagerFactory __swiftcall SAAssetManagerFactory.init()()
{
  return (SAAssetManagerFactory)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id SAAssetManagerFactory.init()()
{
  objc_super v1;

  v1.super_class = (Class)SAAssetManagerFactory;
  return objc_msgSendSuper2(&v1, sel_init);
}

unint64_t type metadata accessor for SAAssetManagerFactory()
{
  unint64_t result;

  result = qword_2574D99C0;
  if (!qword_2574D99C0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2574D99C0);
  }
  return result;
}

unint64_t sub_2459C8860(unint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  if (result)
  {
    v1 = result;
    v3 = 0;
    MEMORY[0x249540960](&v3, 8);
    result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          v3 = 0;
          MEMORY[0x249540960](&v3, 8);
        }
        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2459C88E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  __int128 v19;
  uint64_t v20;
  _UNKNOWN **v21;

  v20 = type metadata accessor for SASafariAssistantAssetProvider();
  v21 = &off_2516BE750;
  *(_QWORD *)&v19 = a5;
  *(_QWORD *)(a10 + 24) = 0;
  swift_unknownObjectWeakInit();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D99D8);
  swift_allocObject();
  *(_QWORD *)(a10 + 136) = sub_2459C857C(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D99E0);
  swift_allocObject();
  *(_QWORD *)(a10 + 152) = sub_2459C85A8(0, 0, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D99E8);
  swift_allocObject();
  *(_QWORD *)(a10 + 160) = sub_2459C864C(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D99F0);
  swift_allocObject();
  *(_QWORD *)(a10 + 168) = sub_2459C8608(0);
  *(_QWORD *)(a10 + 32) = a1;
  *(_QWORD *)(a10 + 40) = a2;
  *(_QWORD *)(a10 + 48) = a3;
  *(_QWORD *)(a10 + 56) = a4;
  sub_2459B9DDC(&v19, a10 + 64);
  *(_QWORD *)(a10 + 144) = 0;
  *(_BYTE *)(a10 + 128) = a7;
  *(_QWORD *)(a10 + 104) = a6;
  *(_QWORD *)(a10 + 112) = a8;
  *(_QWORD *)(a10 + 120) = a9;
  return a10;
}

uint64_t sub_2459C8A44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  _QWORD v24[3];
  uint64_t v25;
  _UNKNOWN **v26;

  v23 = a8;
  v25 = type metadata accessor for SASafariAssistantAssetProvider();
  v26 = &off_2516BE750;
  v24[0] = a5;
  type metadata accessor for SASafariAssistantPrefetchRequestFilter();
  v16 = swift_allocObject();
  v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v24, v25);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (_QWORD *)((char *)&v24[-1] - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v20 + 16))(v19);
  v21 = sub_2459C88E8(a1, a2, a3, a4, *v19, a6, a7, v23, a9, v16);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  return v21;
}

id sub_2459C8B64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  uint64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t (**v26)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  objc_class *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(id, _UNKNOWN **, uint64_t, uint64_t);
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(id, _UNKNOWN **, uint64_t, uint64_t);
  id v48;
  _QWORD v50[2];
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  objc_super v57;
  __int128 v58;
  uint64_t v59;
  __int128 v60;
  uint64_t v61;
  _UNKNOWN **v62;

  v56 = a6;
  v53 = a4;
  v51 = a3;
  v14 = OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_shouldReportAnalytics;
  v15 = a9;
  v16 = sub_2459C8860(0x3E8uLL);
  *((_BYTE *)a9 + v14) = v16 == 0;
  *(_QWORD *)&v15[OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_activityMonitor] = a1;
  v17 = &v15[OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_deviceContext];
  *(_QWORD *)v17 = a2;
  *((_QWORD *)v17 + 1) = &off_2516BE3E0;
  v55 = a5;
  sub_2459C90BC(a5, (uint64_t)&v58, &qword_2574D99C8);
  if (v59)
  {
    sub_2459B9DDC(&v58, (uint64_t)&v60);
    swift_retain();
    swift_retain();
  }
  else
  {
    swift_retain_n();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574D93B8);
    sub_2459C5194();
    v18 = sub_2459D96F8();
    v19 = type metadata accessor for SASafariAssistantAssetProvider();
    swift_allocObject();
    v20 = sub_2459BE2B4(a1, v18, v16 == 0);
    v61 = v19;
    v62 = &off_2516BE750;
    *(_QWORD *)&v60 = v20;
    sub_2459C9134((uint64_t)&v58, &qword_2574D99C8);
  }
  v54 = a1;
  v21 = (uint64_t)&v15[OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetProvider];
  sub_2459B9DDC(&v60, (uint64_t)&v15[OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetProvider]);
  if (a7)
  {
    v22 = swift_allocObject();
    v23 = a7;
    *(_QWORD *)(v22 + 16) = a7;
    *(_QWORD *)(v22 + 24) = a8;
    v24 = sub_2459C917C;
  }
  else
  {
    v23 = 0;
    v22 = 0;
    v24 = sub_2459B85EC;
  }
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = v24;
  *(_QWORD *)(v25 + 24) = v22;
  v26 = (uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))&v15[OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetSpeciferHandler];
  *v26 = sub_2459C9084;
  v26[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v25;
  sub_2459C90BC(v56, (uint64_t)&v58, &qword_2574D99D0);
  v52 = v23;
  if (v59)
  {
    sub_2459C9124(v23);
    swift_bridgeObjectRelease();
    sub_2459B9DDC(&v58, (uint64_t)&v60);
  }
  else
  {
    v27 = *(_QWORD *)(a2 + 32);
    v28 = *(_QWORD *)(a2 + 40);
    swift_beginAccess();
    sub_2459BB46C(v21, (uint64_t)&v60);
    v29 = *((_BYTE *)a9 + v14);
    v30 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v60, v61);
    v50[1] = v50;
    MEMORY[0x24BDAC7A8](v30);
    v32 = (_QWORD *)((char *)v50 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v33 + 16))(v32);
    v34 = *v32;
    v35 = v54;
    swift_retain();
    sub_2459C9124(v23);
    swift_bridgeObjectRetain();
    swift_retain();
    v36 = sub_2459C8A44(v27, v28, v51, v53, v34, v35, v29, (uint64_t)sub_2459C9084, v25);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
    v61 = type metadata accessor for SASafariAssistantPrefetchRequestFilter();
    v62 = &off_2516BF508;
    *(_QWORD *)&v60 = v36;
    sub_2459C9134((uint64_t)&v58, &qword_2574D99D0);
  }
  sub_2459B9DDC(&v60, (uint64_t)&v15[OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_filter]);

  v37 = (objc_class *)type metadata accessor for SASafariAssistantAssetManager();
  v57.receiver = v15;
  v57.super_class = v37;
  v38 = objc_msgSendSuper2(&v57, sel_init);
  v39 = (uint64_t)v38 + OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_assetProvider;
  swift_beginAccess();
  v40 = *(_QWORD *)(v39 + 24);
  v41 = *(_QWORD *)(v39 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v39, v40);
  v42 = *(void (**)(id, _UNKNOWN **, uint64_t, uint64_t))(v41 + 16);
  v43 = v38;
  v42(v38, &off_2516BE290, v40, v41);
  swift_endAccess();
  v44 = (uint64_t)v43 + OBJC_IVAR____TtC12SearchAssets29SASafariAssistantAssetManager_filter;
  swift_beginAccess();
  v45 = *(_QWORD *)(v44 + 24);
  v46 = *(_QWORD *)(v44 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v44, v45);
  v47 = *(void (**)(id, _UNKNOWN **, uint64_t, uint64_t))(v46 + 16);
  v48 = v43;
  v47(v38, &off_2516BE280, v45, v46);
  swift_endAccess();

  sub_2459C916C(v52);
  swift_release();
  swift_release();
  sub_2459C9134(v56, &qword_2574D99D0);
  sub_2459C9134(v55, &qword_2574D99C8);
  return v48;
}

uint64_t sub_2459C9060()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2459C9084(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t (*v5)(_QWORD *, _QWORD *);
  _QWORD v7[2];
  _QWORD v8[2];

  v5 = *(uint64_t (**)(_QWORD *, _QWORD *))(v4 + 16);
  v8[0] = a1;
  v8[1] = a2;
  v7[0] = a3;
  v7[1] = a4;
  return v5(v8, v7);
}

void sub_2459C90BC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_0_5();
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_2459C9124(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

void sub_2459C9134(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_0_5();
}

uint64_t sub_2459C916C(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_2459C917C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v2 + 16))(*a1, a1[1], *a2, a2[1]);
}

uint64_t sub_2459C91AC(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_2459C91DC(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2459C9218(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return 0;
  v3 = a1;
  v4 = (void *)sub_2459D971C();
  v5 = objc_msgSend(v4, sel__web_looksLikeIPAddress);

  if ((v5 & 1) != 0)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_2459C5490();
    v6 = sub_2459D9968();
    v3 = sub_2459C92F0(v6, v3);
    swift_bridgeObjectRelease();
  }
  return v3;
}

uint64_t sub_2459C92F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v10 = 0;
  v8 = 0;
  v9 = 0;
  sub_2459C93C4(a1, &v8, &v10);
  if (v10 == 1)
  {
    v3 = v8;
    v4 = v9;
    if (v9)
    {
      swift_bridgeObjectRetain();
      v5 = sub_2459D9794();
      swift_bridgeObjectRelease();
    }
    else
    {
      v5 = 0;
    }
    v6 = sub_2459D9794();
    if (v4 && v5 == v6)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      return a2;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t sub_2459C93C4(uint64_t a1, _QWORD *a2, char *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int IsDomainTopLevel;
  char v11;

  MEMORY[0x249540054](16);
  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
  {
    swift_bridgeObjectRetain();
    v7 = 0;
    v8 = a1 + 16 * v6 + 24;
    do
    {
      swift_bridgeObjectRetain();
      if (v7)
        sub_2459D97B8();
      sub_2459C9534();
      sub_2459D97AC();
      swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRelease();
      v9 = (void *)sub_2459D971C();
      IsDomainTopLevel = _CFHostIsDomainTopLevel();

      if (IsDomainTopLevel)
      {
        *a3 = 1;
        swift_bridgeObjectRelease();
      }
      else
      {
        v11 = *a3;
        swift_bridgeObjectRelease();
        if ((v11 & 1) != 0)
          break;
      }
      v8 -= 16;
      ++v7;
    }
    while (v6 != v7);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

unint64_t sub_2459C9534()
{
  unint64_t result;

  result = qword_2574D99F8;
  if (!qword_2574D99F8)
  {
    result = MEMORY[0x2495408C4](MEMORY[0x24BEE0D40], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2574D99F8);
  }
  return result;
}

uint64_t destroy for SASafariAssistantUrlPathFilterModel()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s12SearchAssets35SASafariAssistantUrlPathFilterModelVwCP_0(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for SASafariAssistantUrlPathFilterModel(_QWORD *a1, _QWORD *a2)
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

uint64_t assignWithTake for SASafariAssistantUrlPathFilterModel(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SASafariAssistantUrlPathFilterModel(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SASafariAssistantUrlPathFilterModel(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SASafariAssistantUrlPathFilterModel()
{
  return &type metadata for SASafariAssistantUrlPathFilterModel;
}

BOOL sub_2459C9724(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_2459C9734()
{
  return sub_2459D9B30();
}

uint64_t sub_2459C9758(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v7;

  v3 = a1 == 0x656D616E74736F68 && a2 == 0xE800000000000000;
  if (v3 || (sub_2459D9AC4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7265755168746170 && a2 == 0xEF676E6972747379)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_2459D9AC4();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2459C9854()
{
  return 2;
}

uint64_t sub_2459C985C()
{
  return 0;
}

uint64_t sub_2459C9868(char a1)
{
  if ((a1 & 1) != 0)
    return 0x7265755168746170;
  else
    return 0x656D616E74736F68;
}

BOOL sub_2459C98AC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2459C9724(*a1, *a2);
}

void sub_2459C98B8()
{
  sub_2459C9D2C();
}

uint64_t sub_2459C98D0()
{
  return sub_2459C9734();
}

uint64_t sub_2459C98DC()
{
  char *v0;

  return sub_2459C9868(*v0);
}

uint64_t sub_2459C98E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2459C9758(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2459C9908()
{
  return sub_2459C985C();
}

uint64_t sub_2459C9924@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2459C9854();
  *a1 = result;
  return result;
}

uint64_t sub_2459C9948()
{
  sub_2459CA058();
  return sub_2459D9B60();
}

uint64_t sub_2459C9970()
{
  sub_2459CA058();
  return sub_2459D9B6C();
}

void sub_2459C9998(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9A28);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_6_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2459CA058();
  sub_2459D9B54();
  sub_2459D9A88();
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9A10);
    sub_2459CA0D0(&qword_2574D9A30, (uint64_t (*)(void))sub_2459CA12C, MEMORY[0x24BEE12A0]);
    OUTLINED_FUNCTION_0_6();
  }
  OUTLINED_FUNCTION_8_3(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  OUTLINED_FUNCTION_2_2();
}

uint64_t sub_2459C9AB4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9A00);
  MEMORY[0x24BDAC7A8](v3);
  v4 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2459CA058();
  OUTLINED_FUNCTION_9_2();
  if (v1)
  {
    OUTLINED_FUNCTION_3_4();
  }
  else
  {
    v4 = sub_2459D9A64();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9A10);
    sub_2459CA0D0(&qword_2574D9A18, (uint64_t (*)(void))sub_2459CA094, MEMORY[0x24BEE12D0]);
    swift_bridgeObjectRetain();
    sub_2459D9A7C();
    OUTLINED_FUNCTION_1_2();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_3_4();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_68();
  }
  return v4;
}

uint64_t sub_2459C9C50(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v7;

  v3 = a1 == 1752457584 && a2 == 0xE400000000000000;
  if (v3 || (sub_2459D9AC4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7261507972657571 && a2 == 0xEA00000000006D61)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_2459D9AC4();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

void sub_2459C9D2C()
{
  sub_2459D9B24();
  sub_2459D9B30();
  sub_2459D9B3C();
  OUTLINED_FUNCTION_10_2();
}

uint64_t sub_2459C9D68(char a1)
{
  if ((a1 & 1) != 0)
    return 0x7261507972657571;
  else
    return 1752457584;
}

void sub_2459C9D9C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9A78);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_6_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2459CA47C();
  sub_2459D9B54();
  sub_2459D9A94();
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9A68);
    sub_2459CA4B8(&qword_2574D9A80, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    OUTLINED_FUNCTION_0_6();
  }
  OUTLINED_FUNCTION_8_3(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  OUTLINED_FUNCTION_2_2();
}

uint64_t sub_2459C9EAC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9A58);
  MEMORY[0x24BDAC7A8](v3);
  v4 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  sub_2459CA47C();
  OUTLINED_FUNCTION_9_2();
  if (!v1)
  {
    v4 = sub_2459D9A70();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9A68);
    sub_2459CA4B8(&qword_2574D9A70, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    sub_2459D9A7C();
    OUTLINED_FUNCTION_5_3();
  }
  OUTLINED_FUNCTION_3_4();
  return v4;
}

uint64_t sub_2459CA010@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = sub_2459C9AB4(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

void sub_2459CA03C(_QWORD *a1)
{
  sub_2459C9998(a1);
}

unint64_t sub_2459CA058()
{
  unint64_t result;

  result = qword_2574D9A08;
  if (!qword_2574D9A08)
  {
    result = MEMORY[0x2495408C4](&unk_2459DAF04, &type metadata for SASafariAssistantUrlPathFilterModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574D9A08);
  }
  return result;
}

unint64_t sub_2459CA094()
{
  unint64_t result;

  result = qword_2574D9A20;
  if (!qword_2574D9A20)
  {
    result = MEMORY[0x2495408C4](&unk_2459DAEDC, &type metadata for SASafariAssistantUrlPathFilterPatternModel);
    atomic_store(result, (unint64_t *)&qword_2574D9A20);
  }
  return result;
}

void sub_2459CA0D0(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (!*a1)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2574D9A10);
    v7 = a2();
    atomic_store(MEMORY[0x2495408C4](a3, v6, &v7), a1);
  }
  OUTLINED_FUNCTION_4_3();
}

unint64_t sub_2459CA12C()
{
  unint64_t result;

  result = qword_2574D9A38;
  if (!qword_2574D9A38)
  {
    result = MEMORY[0x2495408C4](&unk_2459DAEB4, &type metadata for SASafariAssistantUrlPathFilterPatternModel);
    atomic_store(result, (unint64_t *)&qword_2574D9A38);
  }
  return result;
}

_BYTE *sub_2459CA170(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SASafariAssistantUrlPathFilterModel.CodingKeys()
{
  return &type metadata for SASafariAssistantUrlPathFilterModel.CodingKeys;
}

_QWORD *initializeBufferWithCopyOfBuffer for SASafariAssistantUrlPathFilterPatternModel(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SASafariAssistantUrlPathFilterPatternModel()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for SASafariAssistantUrlPathFilterPatternModel(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for SASafariAssistantUrlPathFilterPatternModel(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SASafariAssistantUrlPathFilterPatternModel(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SASafariAssistantUrlPathFilterPatternModel(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SASafariAssistantUrlPathFilterPatternModel()
{
  return &type metadata for SASafariAssistantUrlPathFilterPatternModel;
}

unint64_t sub_2459CA2CC()
{
  unint64_t result;

  result = qword_2574D9A40;
  if (!qword_2574D9A40)
  {
    result = MEMORY[0x2495408C4](&unk_2459DAE8C, &type metadata for SASafariAssistantUrlPathFilterModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574D9A40);
  }
  return result;
}

void sub_2459CA308()
{
  sub_2459D9B24();
  sub_2459D9B30();
  sub_2459D9B3C();
  OUTLINED_FUNCTION_10_2();
}

uint64_t sub_2459CA340()
{
  char *v0;

  return sub_2459C9D68(*v0);
}

uint64_t sub_2459CA348@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2459C9C50(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2459CA36C()
{
  sub_2459CA47C();
  return sub_2459D9B60();
}

uint64_t sub_2459CA394()
{
  sub_2459CA47C();
  return sub_2459D9B6C();
}

uint64_t sub_2459CA3BC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = sub_2459C9EAC(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

void sub_2459CA3E4(_QWORD *a1)
{
  sub_2459C9D9C(a1);
}

unint64_t sub_2459CA400()
{
  unint64_t result;

  result = qword_2574D9A48;
  if (!qword_2574D9A48)
  {
    result = MEMORY[0x2495408C4](&unk_2459DADFC, &type metadata for SASafariAssistantUrlPathFilterModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574D9A48);
  }
  return result;
}

unint64_t sub_2459CA440()
{
  unint64_t result;

  result = qword_2574D9A50;
  if (!qword_2574D9A50)
  {
    result = MEMORY[0x2495408C4](&unk_2459DAE24, &type metadata for SASafariAssistantUrlPathFilterModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574D9A50);
  }
  return result;
}

unint64_t sub_2459CA47C()
{
  unint64_t result;

  result = qword_2574D9A60;
  if (!qword_2574D9A60)
  {
    result = MEMORY[0x2495408C4](&unk_2459DB00C, &type metadata for SASafariAssistantUrlPathFilterPatternModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574D9A60);
  }
  return result;
}

void sub_2459CA4B8(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (!*a1)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2574D9A68);
    v7 = a2;
    atomic_store(MEMORY[0x2495408C4](a3, v6, &v7), a1);
  }
  OUTLINED_FUNCTION_4_3();
}

uint64_t _s12SearchAssets35SASafariAssistantUrlPathFilterModelV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFF)
  {
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
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = v6 - 2;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s12SearchAssets35SASafariAssistantUrlPathFilterModelV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2459CA5E0 + 4 * byte_2459DAD45[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2459CA614 + 4 * asc_2459DAD40[v4]))();
}

uint64_t sub_2459CA614(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2459CA61C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2459CA624);
  return result;
}

uint64_t sub_2459CA630(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2459CA638);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2459CA63C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2459CA644(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SASafariAssistantUrlPathFilterPatternModel.CodingKeys()
{
  return &type metadata for SASafariAssistantUrlPathFilterPatternModel.CodingKeys;
}

unint64_t sub_2459CA664()
{
  unint64_t result;

  result = qword_2574D9A88;
  if (!qword_2574D9A88)
  {
    result = MEMORY[0x2495408C4](&unk_2459DAFE4, &type metadata for SASafariAssistantUrlPathFilterPatternModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574D9A88);
  }
  return result;
}

unint64_t sub_2459CA6A4()
{
  unint64_t result;

  result = qword_2574D9A90;
  if (!qword_2574D9A90)
  {
    result = MEMORY[0x2495408C4](&unk_2459DAF54, &type metadata for SASafariAssistantUrlPathFilterPatternModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574D9A90);
  }
  return result;
}

unint64_t sub_2459CA6E4()
{
  unint64_t result;

  result = qword_2574D9A98;
  if (!qword_2574D9A98)
  {
    result = MEMORY[0x2495408C4](&unk_2459DAF7C, &type metadata for SASafariAssistantUrlPathFilterPatternModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574D9A98);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  return sub_2459D9AA0();
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0);
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_8_3@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return sub_2459D9B48();
}

uint64_t sub_2459CA7EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_2459D95FC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend((id)objc_opt_self(), sel_currentLocale);
  sub_2459D95F0();

  v5 = sub_2459D95E4();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v5;
}

void sub_2459CA8B0()
{
  id v0;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedConfiguration);
  if (v0)
    sub_2459CB02C(v0);
}

id sub_2459CA8FC(void *a1, uint64_t a2, void (*a3)(void))
{
  void *v3;
  id v5;

  v5 = a1;
  a3();
  OUTLINED_FUNCTION_4_4();
  if (a3)
  {
    OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_2_3();
  }
  else
  {
    v3 = 0;
  }
  return OUTLINED_FUNCTION_1_3(v3);
}

id sub_2459CA960(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;

  v6 = a1;
  sub_2459CA9D0();
  OUTLINED_FUNCTION_4_4();
  if (a4)
  {
    OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_2_3();
  }
  else
  {
    a3 = 0;
  }
  return OUTLINED_FUNCTION_1_3(a3);
}

uint64_t sub_2459CA9D0()
{
  void *v0;
  uint64_t v1;
  uint64_t v3;

  v0 = (void *)sub_2459D971C();
  v1 = MGCopyAnswer();

  if (!v1)
    return 0;
  if (swift_dynamicCast())
    return v3;
  return 0;
}

uint64_t sub_2459CAA70()
{
  if (qword_2574D8AA0 != -1)
    swift_once();
  if (byte_2574DA490)
    return 2;
  else
    return 4;
}

void sub_2459CAAF0()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  sub_2459CB090(v0);
  if (v1)
  {
    v2 = (void *)objc_opt_self();
    v3 = (void *)OUTLINED_FUNCTION_3_5();
    v4 = objc_msgSend(v2, sel_safariAssistantAssetManagerWithLocale_, v3);

    v5 = (void *)OUTLINED_FUNCTION_3_5();
    swift_bridgeObjectRelease();
    v6 = objc_msgSend(v4, sel_assetVersionForLocale_, v5);

    swift_unknownObjectRelease();
    if (v6)
    {
      sub_2459D9728();

    }
  }
  OUTLINED_FUNCTION_7_2();
}

id SADeviceInfo.init()()
{
  objc_super v1;

  v1.super_class = (Class)SADeviceInfo;
  return objc_msgSendSuper2(&v1, sel_init);
}

id sub_2459CACD4(void *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;

  sub_2459CAD14(a3);
  if (v4)
  {
    sub_2459D971C();
    OUTLINED_FUNCTION_2_3();
  }
  else
  {
    a1 = 0;
  }
  return a1;
}

uint64_t sub_2459CAD14(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *a1);
  swift_bridgeObjectRetain();
  return v2;
}

void *sub_2459CAD54()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR___SATrialExperiment__deploymentID);
  v2 = v1;
  return v1;
}

void *sub_2459CADA0()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR___SATrialExperiment__compatibilityVersion);
  v2 = v1;
  return v1;
}

uint64_t sub_2459CADEC()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + OBJC_IVAR___SATrialExperiment__allocationStatus);
}

id _sSo12SADeviceInfoC12SearchAssetsEABycfC_0()
{
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id SATrialExperiment.init()()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  objc_super v5;

  v1 = (_QWORD *)(v0 + OBJC_IVAR___SATrialExperiment__experimentNamespace);
  *v1 = 0;
  v1[1] = 0;
  v2 = (_QWORD *)(v0 + OBJC_IVAR___SATrialExperiment__experimentID);
  *v2 = 0;
  v2[1] = 0;
  v3 = (_QWORD *)(v0 + OBJC_IVAR___SATrialExperiment__treatmentID);
  *v3 = 0;
  v3[1] = 0;
  *(_QWORD *)(v0 + OBJC_IVAR___SATrialExperiment__deploymentID) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR___SATrialExperiment__compatibilityVersion) = 0;
  *(_DWORD *)(v0 + OBJC_IVAR___SATrialExperiment__allocationStatus) = 0;
  v5.super_class = (Class)SATrialExperiment;
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for SADeviceInfo(uint64_t a1)
{
  return sub_2459C5F88(a1, &qword_2574D9AF8);
}

uint64_t type metadata accessor for SATrialExperiment(uint64_t a1)
{
  return sub_2459C5F88(a1, qword_2574D9B28);
}

uint64_t sub_2459CAF78()
{
  uint64_t result;

  result = sub_2459CAF98();
  byte_2574DA490 = result & 1;
  return result;
}

uint64_t sub_2459CAF98()
{
  void *v0;
  uint64_t v1;
  unsigned __int8 v3;

  v0 = (void *)sub_2459D971C();
  v1 = MGCopyAnswer();

  if (v1)
    return swift_dynamicCast() & v3;
  else
    return 0;
}

void sub_2459CB02C(void *a1)
{
  id v2;

  v2 = objc_msgSend(a1, sel_countryCode);

  if (v2)
  {
    sub_2459D9728();

  }
  OUTLINED_FUNCTION_7_2();
}

uint64_t sub_2459CB090(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_systemLocale);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_2459D9728();

  return v3;
}

id OUTLINED_FUNCTION_1_3(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return sub_2459D971C();
}

void OUTLINED_FUNCTION_4_4()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_5_4()
{
  return sub_2459D971C();
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return swift_bridgeObjectRelease();
}

void sub_2459CB144()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    sub_2459CBFDC();
    if (v1 <= 0x3F)
    {
      sub_2459D95D8();
      if (v2 <= 0x3F)
        swift_initClassMetadata2();
    }
  }
}

uint64_t *sub_2459CB220()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  if ((*((_BYTE *)v0 + *(_QWORD *)(*v0 + 120)) & 1) == 0)
    (*(void (**)(void))(v1 + 400))();
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_42();
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 112));

  sub_2459CC764((uint64_t)v0 + *(_QWORD *)(*v0 + 136), (uint64_t *)&unk_2574D9F70);
  v2 = sub_2459D95D8();
  OUTLINED_FUNCTION_5_5(v2);
  swift_release();
  return v0;
}

uint64_t sub_2459CB2F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
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
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;

  type metadata accessor for ActivitySpan.ActivityData(0, *(_QWORD *)(*(_QWORD *)v4 + 80), *(_QWORD *)(*(_QWORD *)v4 + 88), a4);
  swift_retain();
  sub_2459D936C((void (*)(void))sub_2459CC51C);
  swift_release();
  sub_2459D98D8();
  OUTLINED_FUNCTION_6_4();
  sub_2459D98D8();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D90F0);
  v5 = OUTLINED_FUNCTION_3_0();
  *(_OWORD *)(v5 + 16) = xmmword_2459DA480;
  sub_2459CB84C();
  v6 = sub_2459D99D4();
  v8 = v7;
  v9 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v5 + 56) = MEMORY[0x24BEE0D00];
  v10 = sub_2459BD084();
  *(_QWORD *)(v5 + 64) = v10;
  *(_QWORD *)(v5 + 32) = v6;
  *(_QWORD *)(v5 + 40) = v8;
  v11 = v9;
  v12 = v10;
  v13 = sub_2459CB820();
  *(_QWORD *)(v5 + 96) = v11;
  *(_QWORD *)(v5 + 104) = v12;
  *(_QWORD *)(v5 + 72) = v13;
  *(_QWORD *)(v5 + 80) = v14;
  v15 = sub_2459CB7F4();
  *(_QWORD *)(v5 + 136) = v11;
  *(_QWORD *)(v5 + 144) = v12;
  *(_QWORD *)(v5 + 112) = v15;
  *(_QWORD *)(v5 + 120) = v16;
  sub_2459D9668();
  OUTLINED_FUNCTION_114();
  if ((v30 & 1) == 0)
  {
    sub_2459D98D8();
    v17 = OUTLINED_FUNCTION_0_7();
    *(_OWORD *)(v17 + 16) = xmmword_2459DA4A0;
    v18 = sub_2459D99D4();
    *(_QWORD *)(v17 + 56) = v11;
    *(_QWORD *)(v17 + 64) = v12;
    *(_QWORD *)(v17 + 32) = v18;
    *(_QWORD *)(v17 + 40) = v19;
    OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_17_0();
    if (v32)
    {
      OUTLINED_FUNCTION_31();
      sub_2459D98D8();
      v20 = OUTLINED_FUNCTION_0_7();
      *(_OWORD *)(v20 + 16) = xmmword_2459DA4A0;
      *(_QWORD *)(v20 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9C48);
      *(_QWORD *)(v20 + 64) = sub_2459BE220((unint64_t *)&unk_2574D9C50, &qword_2574D9C48, MEMORY[0x24BDCFBF8]);
      *(_QWORD *)(v20 + 32) = v32;
      OUTLINED_FUNCTION_1_4();
      OUTLINED_FUNCTION_17_0();
    }
  }
  if (v31)
  {
    swift_bridgeObjectRetain();
    sub_2459D98D8();
    v21 = OUTLINED_FUNCTION_0_7();
    *(_OWORD *)(v21 + 16) = xmmword_2459DA4A0;
    *(_QWORD *)(v21 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9C38);
    *(_QWORD *)(v21 + 64) = sub_2459BE220(&qword_2574D9C40, &qword_2574D9C38, MEMORY[0x24BDCF848]);
    *(_QWORD *)(v21 + 32) = v31;
    OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_17_0();
  }
  if (v33 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_2459D9A28();
    v22 = result;
    if (!result)
      goto LABEL_13;
  }
  else
  {
    v22 = *(_QWORD *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (!v22)
      goto LABEL_13;
  }
  if (v22 < 1)
  {
    __break(1u);
    return result;
  }
  v24 = 0;
  v25 = MEMORY[0x24BEE0D00];
  do
  {
    ++v24;
    swift_unknownObjectRetain();
    sub_2459D98D8();
    v26 = OUTLINED_FUNCTION_3_0();
    *(_OWORD *)(v26 + 16) = xmmword_2459DA4A0;
    swift_unknownObjectRetain();
    v27 = sub_2459D9764();
    *(_QWORD *)(v26 + 56) = v25;
    *(_QWORD *)(v26 + 64) = v12;
    *(_QWORD *)(v26 + 32) = v27;
    *(_QWORD *)(v26 + 40) = v28;
    sub_2459D9668();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_4_2();
  }
  while (v22 != v24);
LABEL_13:
  OUTLINED_FUNCTION_122();
  sub_2459D98D8();
  v29 = OUTLINED_FUNCTION_6_4();
  if ((sub_2459CB87C(v29) & 1) != 0)
  {
    sub_2459D98E4();
    OUTLINED_FUNCTION_6_4();
  }
  OUTLINED_FUNCTION_122();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_42();
  return swift_unknownObjectRelease();
}

uint64_t sub_2459CB770()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t (*)(), _QWORD))(*(_QWORD *)v0 + 408))(nullsub_1, 0);
}

uint64_t sub_2459CB788(void (*a1)(void))
{
  uint64_t v1;
  os_unfair_lock_s *v3;

  v3 = *(os_unfair_lock_s **)(*(_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 152)) + 16);
  swift_retain();
  os_unfair_lock_lock(v3);
  sub_2459CC288(v1, a1);
  os_unfair_lock_unlock(v3);
  return swift_release();
}

uint64_t sub_2459CB7F4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)v0 + 88) + 24))();
}

uint64_t sub_2459CB820()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)v0 + 88) + 32))();
}

uint64_t sub_2459CB84C()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)v0 + 88) + 40))(*(_QWORD *)(*(_QWORD *)v0 + 80));
}

uint64_t sub_2459CB87C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  __int128 v8[2];
  uint64_t v9;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_15_1(v1 + *(_QWORD *)(v2 + 112), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9C68);
  if (swift_dynamicCast())
  {
    sub_2459B9DDC(v8, (uint64_t)v10);
    v4 = v11;
    v5 = v12;
    __swift_project_boxed_opaque_existential_1(v10, v11);
    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  else
  {
    v9 = 0;
    memset(v8, 0, sizeof(v8));
    sub_2459CC764((uint64_t)v8, (uint64_t *)&unk_2574D9C70);
    v6 = 0;
  }
  return v6 & 1;
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return 1;
}

uint64_t sub_2459CB96C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = sub_2459D95D8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_15_1(v0 + *(_QWORD *)(*(_QWORD *)v0 + 144), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16));
  sub_2459D95A8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
}

uint64_t sub_2459CBA24()
{
  return sub_2459D9764();
}

uint64_t sub_2459CBA50()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t, _QWORD);
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t Strong;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  _BYTE v32[12];
  int v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[22];
  char v43;

  v1 = (uint64_t)v0;
  v2 = *v0;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D9F70);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = &v32[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = &v32[-v8];
  v37 = v2;
  v41 = *(_QWORD *)(v2 + 80);
  v10 = *(_QWORD *)(v41 - 8);
  v11 = MEMORY[0x24BDAC7A8](v7);
  v13 = &v32[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v11);
  v15 = &v32[-v14];
  v35 = *(_QWORD *)(v1 + 24);
  v36 = (_QWORD *)(v1 + 24);
  v34 = *(_QWORD *)(v1 + 32);
  v33 = *(unsigned __int8 *)(v1 + 40);
  v16 = *(unsigned __int8 *)(v1 + 41);
  v17 = *(_QWORD *)(v1 + 48);
  v18 = *(_QWORD *)(v1 + 56);
  v19 = *(_QWORD *)(v1 + 64);
  v38 = *(_QWORD *)(v1 + 72);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_31();
  v39 = v19;
  swift_bridgeObjectRetain();
  v40 = v17;
  sub_2459CC2C4(v17);
  v20 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 112);
  v21 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v10 + 16);
  if ((v16 & 1) == 0 && v18)
  {
    OUTLINED_FUNCTION_11_2((uint64_t)v15, v20, v21);
    OUTLINED_FUNCTION_2_4();
    sub_2459CC6E8(v1, (uint64_t)v9);
    v22 = sub_2459D9698();
    result = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v22);
    if ((_DWORD)result != 1)
    {
      OUTLINED_FUNCTION_4_5();
      swift_bridgeObjectRetain();
      sub_2459CBEFC((uint64_t)v9, v16, v35, v34, v33, v18, v10, v18);
      OUTLINED_FUNCTION_8_4();
      (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v15, v10);
      (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v22 - 8) + 8))(v9, v22);
      goto LABEL_7;
    }
LABEL_14:
    __break(1u);
    return result;
  }
  OUTLINED_FUNCTION_11_2((uint64_t)v13, v20, v21);
  OUTLINED_FUNCTION_2_4();
  sub_2459CC6E8(v1, (uint64_t)v6);
  v24 = sub_2459D9698();
  result = __swift_getEnumTagSinglePayload((uint64_t)v6, 1, v24);
  if ((_DWORD)result == 1)
  {
    __break(1u);
    goto LABEL_14;
  }
  v25 = OUTLINED_FUNCTION_4_5();
  sub_2459CBE8C(v25, v16, v10, v18);
  (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v13, v10);
  (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v24 - 8) + 8))(v6, v24);
LABEL_7:
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v28 = Strong;
    v29 = type metadata accessor for ActivitySpan(0, v10, v18, v27);
    sub_2459C8328(v1, v28, v29, (uint64_t)&off_2516BEFF0);
    v43 = 1;
    *(_QWORD *)&v42[14] = 0;
    *(_QWORD *)&v42[6] = 0;
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_8_4();
    OUTLINED_FUNCTION_114();
    swift_release();
    v30 = v36;
    *v36 = 0;
    v30[1] = 0;
    *((_BYTE *)v30 + 16) = 0;
    *(_BYTE *)(v1 + 41) = v43;
    *(_OWORD *)(v1 + 42) = *(_OWORD *)v42;
    v31 = MEMORY[0x24BEE4AF8];
    *(_QWORD *)(v1 + 56) = *(_QWORD *)&v42[14];
    *(_QWORD *)(v1 + 64) = v31;
    *(_QWORD *)(v1 + 72) = 0;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_42();
    OUTLINED_FUNCTION_114();
    swift_unknownObjectRelease();
    *(_BYTE *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 120)) = 1;
    return swift_weakAssign();
  }
  else
  {
    if ((sub_2459CB87C(0) & 1) != 0)
    {
      sub_2459D98E4();
      sub_2459D9668();
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_8_4();
    return OUTLINED_FUNCTION_114();
  }
}

uint64_t sub_2459CBE08(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  os_unfair_lock_s *v9;

  v9 = *(os_unfair_lock_s **)(*(_QWORD *)(v4 + *(_QWORD *)(*(_QWORD *)v4 + 152)) + 16);
  swift_retain();
  os_unfair_lock_lock(v9);
  sub_2459CC44C(v4, a1, a2, a3, a4);
  os_unfair_lock_unlock(v9);
  return swift_release();
}

uint64_t sub_2459CBE8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2459D9908();
  (*(void (**)(uint64_t, uint64_t))(a4 + 40))(a3, a4);
  return sub_2459D9680();
}

void sub_2459CBEFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v16 = sub_2459D9908();
  v17 = (*(uint64_t (**)(uint64_t, uint64_t))(a8 + 40))(a7, a8);
  LOBYTE(v20) = a5;
  sub_2459BBCB4(v16, a2, v17, v18, v19, a1, a3, a4, v20, a6);
}

uint64_t sub_2459CBFAC()
{
  sub_2459CB220();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ActivitySpan(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ActivitySpan);
}

void sub_2459CBFDC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2574D9BB0[0])
  {
    sub_2459D9698();
    v0 = sub_2459D9938();
    if (!v1)
      atomic_store(v0, qword_2574D9BB0);
  }
}

uint64_t sub_2459CC030()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_2459CC038()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t sub_2459CC070(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v3 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v3;
  v4 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  return a1;
}

uint64_t sub_2459CC0D4(uint64_t a1, __int128 *a2)
{
  __int128 v4;

  v4 = *a2;
  *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
  *(_OWORD *)a1 = v4;
  *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
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

uint64_t sub_2459CC18C(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_unknownObjectRelease();
  return a1;
}

uint64_t sub_2459CC1F0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 40);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_2459CC230(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for ActivitySpan.ActivityData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ActivitySpan.ActivityData);
}

uint64_t sub_2459CC288(uint64_t result, void (*a2)(void))
{
  if ((*(_BYTE *)(result + *(_QWORD *)(*(_QWORD *)result + 120)) & 1) == 0)
  {
    a2();
    return sub_2459CBA50();
  }
  return result;
}

void sub_2459CC2C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (sub_2459CC524(a1))
  {
    sub_2459D98CC();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D90F0);
    v1 = OUTLINED_FUNCTION_3_0();
    *(_OWORD *)(v1 + 16) = xmmword_2459DA490;
    v2 = sub_2459CB820();
    v4 = v3;
    v5 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v1 + 56) = MEMORY[0x24BEE0D00];
    v6 = sub_2459BD084();
    *(_QWORD *)(v1 + 64) = v6;
    *(_QWORD *)(v1 + 32) = v2;
    *(_QWORD *)(v1 + 40) = v4;
    sub_2459BD03C();
    OUTLINED_FUNCTION_16_1();
    v7 = sub_2459D96EC();
    *(_QWORD *)(v1 + 96) = v5;
    *(_QWORD *)(v1 + 104) = v6;
    *(_QWORD *)(v1 + 72) = v7;
    *(_QWORD *)(v1 + 80) = v8;
    sub_2459D9668();
    swift_bridgeObjectRelease();
    sub_2459CB7F4();
    sub_2459CB820();
    sub_2459C84CC();
    v9 = (void *)sub_2459D971C();
    OUTLINED_FUNCTION_114();
    OUTLINED_FUNCTION_16_1();
    v10 = (id)sub_2459D96D4();
    AnalyticsSendEvent();
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_4_2();
    swift_bridgeObjectRelease();

  }
}

uint64_t sub_2459CC44C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  *(_QWORD *)(a1 + 24) = a2;
  *(_QWORD *)(a1 + 32) = a3;
  *(_BYTE *)(a1 + 40) = a4;
  *(_BYTE *)(a1 + 41) = 0;
  *(_QWORD *)(a1 + 56) = a5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2459CC484@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_BYTE *)(a1 + 40);
  v3 = *(_BYTE *)(a1 + 41);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 24);
  *(_BYTE *)(a2 + 16) = v2;
  *(_BYTE *)(a2 + 17) = v3;
  *(_QWORD *)(a2 + 24) = v4;
  *(_QWORD *)(a2 + 32) = v5;
  *(_QWORD *)(a2 + 40) = v7;
  *(_QWORD *)(a2 + 48) = v6;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_2459CC4EC()
{
  uint64_t v0;

  return *(id *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 128));
}

uint64_t sub_2459CC504()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 440))();
}

uint64_t sub_2459CC510()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t sub_2459CC51C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2459CC484(v1, a1);
}

uint64_t sub_2459CC524(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t DynamicType;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;

  v2 = v1;
  v4 = *v1;
  v5 = *(_QWORD *)(*v1 + 80);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, (uint64_t)v2 + *(_QWORD *)(v4 + 112), v5);
  DynamicType = swift_getDynamicType();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v10 = dynamic_cast_existential_1_conditional(DynamicType);
  v12 = 0;
  if (v10 && a1)
  {
    v13 = v10;
    v14 = v11;
    v15 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 16);
    OUTLINED_FUNCTION_31();
    v16 = v15(v13, v14);
    v18 = v17;
    sub_2459D9824();
    v19 = sub_2459D9944();
    swift_isUniquelyReferenced_nonNull_native();
    v26 = a1;
    sub_2459D1188(v19, v16, v18);
    v20 = v26;
    OUTLINED_FUNCTION_8_4();
    swift_bridgeObjectRelease();
    v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v13, v14);
    v23 = v22;
    sub_2459CB96C();
    v24 = sub_2459D98B4();
    swift_isUniquelyReferenced_nonNull_native();
    v27 = v20;
    sub_2459D1188(v24, v21, v23);
    v12 = v27;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v12;
}

uint64_t sub_2459CC6E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D9F70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t dynamic_cast_existential_1_conditional(uint64_t a1)
{
  if (swift_conformsToProtocol2())
    return a1;
  else
    return 0;
}

uint64_t sub_2459CC764(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_5_5(v3);
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_7()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return sub_2459D9668();
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_5_5(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_6_4()
{
  return sub_2459D9668();
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_11_2@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, _QWORD)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, *(_QWORD *)(v3 - 136));
}

uint64_t OUTLINED_FUNCTION_15_1@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(v3, a1, v2);
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  uint64_t v0;

  return v0;
}

void sub_2459CC860()
{
  OUTLINED_FUNCTION_0_8(&qword_2574DA498);
}

void sub_2459CC880()
{
  OUTLINED_FUNCTION_0_8(&qword_2574DA4A8);
}

void sub_2459CC8AC()
{
  OUTLINED_FUNCTION_0_8(&qword_2574DA4B8);
}

void sub_2459CC8CC()
{
  OUTLINED_FUNCTION_0_8(&qword_2574DA4C8);
}

void sub_2459CC8F4()
{
  OUTLINED_FUNCTION_0_8(&qword_2574DA4D8);
}

void sub_2459CC914()
{
  OUTLINED_FUNCTION_0_8(&qword_2574DA4E8);
}

void sub_2459CC934()
{
  OUTLINED_FUNCTION_0_8(&qword_2574DA4F8);
}

void sub_2459CC960()
{
  OUTLINED_FUNCTION_0_8(&qword_2574DA508);
}

void OUTLINED_FUNCTION_0_8(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v1;
  a1[1] = v2;
}

uint64_t sub_2459CC994()
{
  uint64_t v0;

  v0 = sub_2459D96BC();
  __swift_allocate_value_buffer(v0, qword_2574DA518);
  __swift_project_value_buffer(v0, (uint64_t)qword_2574DA518);
  return sub_2459D96B0();
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

uint64_t sub_2459CCA48(_QWORD *a1, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v6;
  id *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _DWORD *v21;
  unsigned __int8 v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  os_unfair_lock_s *v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t ObjectType;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  uint64_t result;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  _BYTE v47[4];
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE *v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;

  v7 = (id *)v6;
  v50 = a4;
  v51 = a6;
  v48 = a5;
  v49 = a3;
  v55 = a2;
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D9F70);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v52 = &v47[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v10);
  v13 = &v47[-v12];
  v14 = sub_2459D95D8();
  v53 = *(_QWORD *)(v14 - 8);
  v54 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v16 = &v47[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_weakInit();
  *(_QWORD *)(v6 + 24) = 0;
  *(_QWORD *)(v6 + 32) = 0;
  *(_WORD *)(v6 + 40) = 256;
  *(_QWORD *)(v6 + 48) = 0;
  *(_QWORD *)(v6 + 56) = 0;
  *(_QWORD *)(v6 + 64) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v6 + 72) = 0;
  *(_BYTE *)(v6 + 81) = 0;
  v58 = 0xD000000000000010;
  v59 = 0x80000002459DC730;
  v56 = 45;
  v57 = 0xE100000000000000;
  sub_2459C5F88(0, (unint64_t *)&qword_2574D9978);
  v60 = 95;
  v61 = 0xE100000000000000;
  v46 = sub_2459C5490();
  sub_2459D9974();
  if (qword_2574D8AF0 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  *(_QWORD *)(v6 + 88) = sub_2459D992C();
  v17 = v6 + *(_QWORD *)(*(_QWORD *)v6 + 136);
  v18 = sub_2459D9698();
  __swift_storeEnumTagSinglePayload(v17, 1, 1, v18);
  v19 = *((_QWORD *)*v7 + 19);
  type metadata accessor for Locker();
  v20 = swift_allocObject();
  v21 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v20 + 16) = v21;
  *v21 = 0;
  *(id *)((char *)v7 + v19) = (id)v20;
  sub_2459D95CC();
  (*(void (**)(char *, _BYTE *, uint64_t))(v53 + 32))((char *)v7 + *((_QWORD *)*v7 + 18), v16, v54);
  swift_weakAssign();
  v22 = v55;
  *((_BYTE *)v7 + 80) = v55;
  v23 = v7[11];
  swift_retain();
  sub_2459D968C();
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v18);
  v24 = (uint64_t)v7 + *((_QWORD *)*v7 + 17);
  swift_beginAccess();
  v54 = v24;
  sub_2459D10AC((uint64_t)v13, v24);
  swift_endAccess();
  v58 = (unint64_t)v7;
  swift_retain();
  v25 = sub_2459D9764();
  v27 = v26;
  v28 = *(os_unfair_lock_s **)(a1[4] + 16);
  os_unfair_lock_lock(v28);
  v29 = a1 + 2;
  v30 = a1;
  if (MEMORY[0x2495409D8](a1 + 2))
  {
    v53 = v18;
    v31 = a1[3];
    swift_beginAccess();
    v32 = a1;
    v33 = a1[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2459D220C(v25, v27, v33);
    v35 = v34;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    if (v35)
    {
      ObjectType = swift_getObjectType();
      (*(void (**)(id *, _UNKNOWN **, uint64_t, uint64_t))(v31 + 32))(v7, &off_2516BEFF0, ObjectType, v31);
    }
    swift_unknownObjectRelease();
    v30 = v32;
    v22 = v55;
    v18 = v53;
  }
  type metadata accessor for ActivityMonitor.WeakReference();
  v37 = swift_allocObject();
  *(_QWORD *)(v37 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v37 + 24) = &off_2516BEFF0;
  swift_unknownObjectWeakAssign();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_2459D10F4(v37, v25, v27);
  swift_endAccess();
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v28);
  swift_bridgeObjectRelease();
  if (MEMORY[0x2495409D8](v29))
  {
    v38 = v30[3];
    v39 = swift_getObjectType();
    (*(void (**)(id *, _UNKNOWN **, uint64_t, uint64_t))(v38 + 8))(v7, &off_2516BEFF0, v39, v38);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
  v40 = v52;
  sub_2459CC6E8(v54, (uint64_t)v52);
  result = __swift_getEnumTagSinglePayload((uint64_t)v40, 1, v18);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v42 = v7[11];
    v43 = sub_2459D9914();
    v44 = sub_2459CFE38(v22);
    LOBYTE(v46) = v48;
    sub_2459BBCB4(v43, (uint64_t)v42, v44, v45, 2, (uint64_t)v40, v49, v50, v46, v51);

    swift_bridgeObjectRelease();
    (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v40, v18);
    sub_2459CEF54();
    swift_release();
    return (uint64_t)v7;
  }
  return result;
}

uint64_t sub_2459CCFD8()
{
  uint64_t v0;
  uint64_t v1;

  if ((*(_BYTE *)(v0 + 81) & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)v0 + 400))();
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_42();
  swift_unknownObjectRelease();

  sub_2459D1598(v0 + *(_QWORD *)(*(_QWORD *)v0 + 136), (uint64_t *)&unk_2574D9F70);
  v1 = sub_2459D95D8();
  OUTLINED_FUNCTION_5_5(v1);
  swift_release();
  return v0;
}

void sub_2459CD080()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;

  v1 = *(os_unfair_lock_s **)(*(_QWORD *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 152)) + 16);
  OUTLINED_FUNCTION_16_2();
  os_unfair_lock_lock(v1);
  v28 = *(_BYTE *)(v0 + 41);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 64);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  v5 = v3;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_35_1();
  os_unfair_lock_unlock(v1);
  OUTLINED_FUNCTION_22_1();
  sub_2459D98D8();
  sub_2459D9668();
  sub_2459D98D8();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D90F0);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_2459DA480;
  sub_2459CFE38(*(_BYTE *)(v0 + 80));
  v7 = sub_2459D99D4();
  v9 = v8;
  v10 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v6 + 56) = MEMORY[0x24BEE0D00];
  v11 = sub_2459BD084();
  *(_QWORD *)(v6 + 64) = v11;
  *(_QWORD *)(v6 + 32) = v7;
  *(_QWORD *)(v6 + 40) = v9;
  if (qword_2574D8A90 != -1)
    swift_once();
  v13 = qword_2574DA468;
  v12 = unk_2574DA470;
  *(_QWORD *)(v6 + 96) = v10;
  *(_QWORD *)(v6 + 104) = v11;
  *(_QWORD *)(v6 + 72) = v13;
  *(_QWORD *)(v6 + 80) = v12;
  *(_QWORD *)(v6 + 136) = v10;
  *(_QWORD *)(v6 + 144) = v11;
  v27 = v11;
  *(_QWORD *)(v6 + 112) = 0xD000000000000010;
  *(_QWORD *)(v6 + 120) = 0x80000002459DC730;
  swift_bridgeObjectRetain();
  sub_2459D9668();
  swift_bridgeObjectRelease();
  if ((v28 & 1) == 0)
  {
    sub_2459D98D8();
    v14 = OUTLINED_FUNCTION_0_2();
    *(_OWORD *)(v14 + 16) = xmmword_2459DA4A0;
    v15 = sub_2459D99D4();
    *(_QWORD *)(v14 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v14 + 64) = v11;
    *(_QWORD *)(v14 + 32) = v15;
    *(_QWORD *)(v14 + 40) = v16;
    OUTLINED_FUNCTION_3_6();
    OUTLINED_FUNCTION_14_0();
    if (v5)
    {
      swift_bridgeObjectRetain();
      sub_2459D98D8();
      v17 = OUTLINED_FUNCTION_0_2();
      *(_OWORD *)(v17 + 16) = xmmword_2459DA4A0;
      *(_QWORD *)(v17 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9C48);
      sub_2459D155C((unint64_t *)&unk_2574D9C50, &qword_2574D9C48, MEMORY[0x24BDCFBF8]);
      *(_QWORD *)(v17 + 64) = v18;
      *(_QWORD *)(v17 + 32) = v5;
      OUTLINED_FUNCTION_3_6();
      OUTLINED_FUNCTION_14_0();
    }
  }
  if (v2)
  {
    swift_bridgeObjectRetain();
    sub_2459D98D8();
    v19 = OUTLINED_FUNCTION_0_2();
    *(_OWORD *)(v19 + 16) = xmmword_2459DA4A0;
    *(_QWORD *)(v19 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9C38);
    sub_2459D155C(&qword_2574D9C40, &qword_2574D9C38, MEMORY[0x24BDCF848]);
    *(_QWORD *)(v19 + 64) = v20;
    *(_QWORD *)(v19 + 32) = v2;
    OUTLINED_FUNCTION_3_6();
    OUTLINED_FUNCTION_14_0();
  }
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v21 = sub_2459D9A28();
  }
  else
  {
    v21 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  if (v21)
  {
    if (v21 < 1)
    {
      __break(1u);
      return;
    }
    v22 = 0;
    v23 = MEMORY[0x24BEE0D00];
    do
    {
      ++v22;
      swift_unknownObjectRetain();
      sub_2459D98D8();
      v24 = OUTLINED_FUNCTION_0_2();
      *(_OWORD *)(v24 + 16) = xmmword_2459DA4A0;
      swift_unknownObjectRetain();
      v25 = sub_2459D9764();
      *(_QWORD *)(v24 + 56) = v23;
      *(_QWORD *)(v24 + 64) = v27;
      *(_QWORD *)(v24 + 32) = v25;
      *(_QWORD *)(v24 + 40) = v26;
      sub_2459D9668();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
    }
    while (v21 != v22);
  }
  OUTLINED_FUNCTION_114();
  sub_2459D98D8();
  OUTLINED_FUNCTION_33_1();
  if (sub_2459CE104())
  {
    sub_2459D98E4();
    OUTLINED_FUNCTION_33_1();
  }
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_114();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7_3();
}

uint64_t sub_2459CD544()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;

  v1 = *(os_unfair_lock_s **)(*(_QWORD *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 152)) + 16);
  swift_retain();
  os_unfair_lock_lock(v1);
  v29 = *(_BYTE *)(v0 + 41);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 64);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  v5 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v1);
  swift_release();
  sub_2459D98D8();
  sub_2459D9668();
  sub_2459D98D8();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D90F0);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_2459DA480;
  sub_2459CFE38(*(_BYTE *)(v0 + 80));
  v7 = sub_2459D99D4();
  v9 = v8;
  v10 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v6 + 56) = MEMORY[0x24BEE0D00];
  v11 = sub_2459BD084();
  *(_QWORD *)(v6 + 64) = v11;
  *(_QWORD *)(v6 + 32) = v7;
  *(_QWORD *)(v6 + 40) = v9;
  if (qword_2574D8AF0 != -1)
    swift_once();
  v13 = qword_2574DA530;
  v12 = *(_QWORD *)algn_2574DA538;
  *(_QWORD *)(v6 + 96) = v10;
  *(_QWORD *)(v6 + 104) = v11;
  *(_QWORD *)(v6 + 72) = v13;
  *(_QWORD *)(v6 + 80) = v12;
  *(_QWORD *)(v6 + 136) = v10;
  *(_QWORD *)(v6 + 144) = v11;
  v28 = v11;
  *(_QWORD *)(v6 + 112) = 0xD000000000000010;
  *(_QWORD *)(v6 + 120) = 0x80000002459DC730;
  swift_bridgeObjectRetain();
  sub_2459D9668();
  swift_bridgeObjectRelease();
  if ((v29 & 1) == 0)
  {
    sub_2459D98D8();
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_2459DA4A0;
    v15 = sub_2459D99D4();
    *(_QWORD *)(v14 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v14 + 64) = v11;
    *(_QWORD *)(v14 + 32) = v15;
    *(_QWORD *)(v14 + 40) = v16;
    sub_2459D9668();
    swift_bridgeObjectRelease();
    if (v5)
    {
      swift_bridgeObjectRetain();
      sub_2459D98D8();
      v17 = swift_allocObject();
      *(_OWORD *)(v17 + 16) = xmmword_2459DA4A0;
      *(_QWORD *)(v17 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9C48);
      sub_2459D155C((unint64_t *)&unk_2574D9C50, &qword_2574D9C48, MEMORY[0x24BDCFBF8]);
      *(_QWORD *)(v17 + 64) = v18;
      *(_QWORD *)(v17 + 32) = v5;
      sub_2459D9668();
      swift_bridgeObjectRelease();
    }
  }
  if (v2)
  {
    swift_bridgeObjectRetain();
    sub_2459D98D8();
    v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_2459DA4A0;
    *(_QWORD *)(v19 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9C38);
    sub_2459D155C(&qword_2574D9C40, &qword_2574D9C38, MEMORY[0x24BDCF848]);
    *(_QWORD *)(v19 + 64) = v20;
    *(_QWORD *)(v19 + 32) = v2;
    sub_2459D9668();
    swift_bridgeObjectRelease();
  }
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_2459D9A28();
    v21 = result;
  }
  else
  {
    v21 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
  }
  if (v21)
  {
    if (v21 < 1)
    {
      __break(1u);
      return result;
    }
    v23 = 0;
    v24 = MEMORY[0x24BEE0D00];
    do
    {
      ++v23;
      swift_unknownObjectRetain();
      sub_2459D98D8();
      v25 = swift_allocObject();
      *(_OWORD *)(v25 + 16) = xmmword_2459DA4A0;
      swift_unknownObjectRetain();
      v26 = sub_2459D9764();
      *(_QWORD *)(v25 + 56) = v24;
      *(_QWORD *)(v25 + 64) = v28;
      *(_QWORD *)(v25 + 32) = v26;
      *(_QWORD *)(v25 + 40) = v27;
      sub_2459D9668();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
    }
    while (v21 != v23);
  }
  swift_bridgeObjectRelease();
  sub_2459D98D8();
  sub_2459D9668();
  if (sub_2459CE1E0())
  {
    sub_2459D98E4();
    sub_2459D9668();
  }
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2459CDAA4()
{
  _BYTE *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  void *v6;
  void *v7;
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
  unint64_t v35;
  uint64_t result;
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
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
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
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  double v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
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
  double v139;
  uint64_t v140;
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
  char v154;
  char v155;
  char v156;
  char v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  uint64_t v178;

  v2 = v0;
  v3 = OUTLINED_FUNCTION_13_0();
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  v5 = v4(v3, v1);
  if (v5)
  {
    v6 = (void *)v5;
    objc_opt_self();
    v7 = (void *)swift_dynamicCastObjCClass();
    if (v7)
    {
      objc_msgSend(v7, sel_statusCode);
      if (!(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v3, v1))
      {

        *(double *)&result = 0.0;
        return result;
      }
      *(_QWORD *)&v174 = 0xD000000000000021;
      *((_QWORD *)&v174 + 1) = 0x80000002459DC3F0;
      v8 = OUTLINED_FUNCTION_24_1();
      OUTLINED_FUNCTION_2_5(v8, v9, v10, v11, v12, v13, v14, v15, v122, v126, v130, v134, v140, v145, v150, v154, v158, v162, v166,
        v170,
        v174);
      v23 = OUTLINED_FUNCTION_17_1(v16, v17, v18, v19, v20, v21, v22);
      if (v178)
        OUTLINED_FUNCTION_1_5();
      else
        OUTLINED_FUNCTION_13_2(v23, qword_2574D9120, v24, v25, v26, v27, v28, v29, v123, v127, v131, v135, v141, v146);
      *(_QWORD *)&v175 = 0xD00000000000001DLL;
      *((_QWORD *)&v175 + 1) = 0x80000002459DC420;
      v37 = OUTLINED_FUNCTION_24_1();
      OUTLINED_FUNCTION_2_5(v37, v38, v39, v40, v41, v42, v43, v44, v123, v127, v131, v135, v141, v146, v151, v155, v159, v163, v167,
        v171,
        v175);
      v52 = OUTLINED_FUNCTION_17_1(v45, v46, v47, v48, v49, v50, v51);
      if (v178)
        OUTLINED_FUNCTION_1_5();
      else
        OUTLINED_FUNCTION_13_2(v52, qword_2574D9120, v53, v54, v55, v56, v57, v58, v124, v128, v132, v136, v142, v147);
      v62 = OUTLINED_FUNCTION_14_1();
      OUTLINED_FUNCTION_2_5(v62, v63, v64, v65, v66, v67, v68, v69, v124, v128, v132, 0xD00000000000001BLL, 0x80000002459DC440, v147, v152, v156, v160, v164, v168,
        v172,
        v176);
      v77 = OUTLINED_FUNCTION_17_1(v70, v71, v72, v73, v74, v75, v76);
      if (v178)
      {
        if ((OUTLINED_FUNCTION_1_5() & 1) != 0)
        {
          v149 = v137;
          goto LABEL_26;
        }
      }
      else
      {
        OUTLINED_FUNCTION_13_2(v77, qword_2574D9120, v78, v79, v80, v81, v82, v83, v125, v129, v133, v137, v143, v148);
      }
      v84 = OUTLINED_FUNCTION_14_1();
      OUTLINED_FUNCTION_2_5(v84, v85, v86, v87, v88, v89, v90, v91, v125, v129, v133, 0xD00000000000001BLL, 0x80000002459DC460, v148, v153, v157, v161, v165, v169,
        v173,
        v177);
      v99 = OUTLINED_FUNCTION_17_1(v92, v93, v94, v95, v96, v97, v98);
      if (v178)
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
LABEL_26:
          v106 = *(double *)&v149;
          v107 = OUTLINED_FUNCTION_14_1();
          OUTLINED_FUNCTION_2_5(v107, v108, v109, v110, v111, v112, v113, v114, v125, v129, v133, 0xD00000000000001ALL, 0x80000002459DC480, v149, v153, v157, v161, v165, v169,
            v173,
            v177);
          OUTLINED_FUNCTION_17_0();

          OUTLINED_FUNCTION_17_1(v115, v116, v117, v118, v119, v120, v121);
          if ((OUTLINED_FUNCTION_1_5() & 1) != 0)
          {
            *(double *)&result = v139 - v106;
            return result;
          }
          goto LABEL_30;
        }
      }
      else
      {
        OUTLINED_FUNCTION_13_2(v99, qword_2574D9120, v100, v101, v102, v103, v104, v105, v125, v129, v133, v138, v144, v149);
      }
      OUTLINED_FUNCTION_17_0();

LABEL_30:
      *(double *)&result = 0.0;
      return result;
    }

  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D90F0);
  v30 = OUTLINED_FUNCTION_0_2();
  *(_OWORD *)(v30 + 16) = xmmword_2459DA4A0;
  v4(v3, v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9108);
  v31 = OUTLINED_FUNCTION_30_0();
  v33 = v32;
  v34 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v30 + 56) = MEMORY[0x24BEE0D00];
  v35 = sub_2459BD084();
  *(_QWORD *)(v30 + 64) = v35;
  *(_QWORD *)(v30 + 32) = v31;
  *(_QWORD *)(v30 + 40) = v33;
  OUTLINED_FUNCTION_6_5((uint64_t)"UNIDENTIFIED_RESPONSE_TYPE=%{signpost.description:attribute,public}s", 68);
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_10_4();
  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_20_0();
  if ((v2[81] & 1) == 0)
  {
    if (*(_QWORD *)&v2[*(_QWORD *)(*(_QWORD *)v2 + 480)])
    {
      OUTLINED_FUNCTION_18_0();
      if (nw_activity_is_activated())
      {
        OUTLINED_FUNCTION_19_1();
        nw_activity_complete_with_reason();
      }
      else
      {
        sub_2459D98C0();
        v59 = OUTLINED_FUNCTION_0_2();
        *(_OWORD *)(v59 + 16) = xmmword_2459DA4A0;
        OUTLINED_FUNCTION_18_0();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D9FC0);
        v60 = OUTLINED_FUNCTION_30_0();
        *(_QWORD *)(v59 + 56) = v34;
        *(_QWORD *)(v59 + 64) = v35;
        *(_QWORD *)(v59 + 32) = v60;
        *(_QWORD *)(v59 + 40) = v61;
        sub_2459D9668();
        OUTLINED_FUNCTION_14_0();
      }
      swift_unknownObjectRelease();
    }
    sub_2459CE38C();
  }
  OUTLINED_FUNCTION_21_0();
  swift_release();
  OUTLINED_FUNCTION_22_1();
  *(double *)&result = 0.0;
  return result;
}

void sub_2459CDF20()
{
  _BYTE *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if ((v0[81] & 1) == 0)
  {
    v2 = v0;
    v3 = sub_2459CDAA4();
    v6 = MEMORY[0x24BEE0D00];
    if ((v7 & 1) != 0)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D90F0);
      v8 = OUTLINED_FUNCTION_0_2();
      *(_OWORD *)(v8 + 16) = xmmword_2459DA4A0;
      v9 = OUTLINED_FUNCTION_13_0();
      (*(void (**)(uint64_t, uint64_t))(v1 + 16))(v9, v1);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9108);
      v10 = OUTLINED_FUNCTION_31_0();
      v12 = v11;
      *(_QWORD *)(v8 + 56) = v6;
      *(_QWORD *)(v8 + 64) = sub_2459BD084();
      *(_QWORD *)(v8 + 32) = v10;
      *(_QWORD *)(v8 + 40) = v12;
      OUTLINED_FUNCTION_6_5((uint64_t)"UNIDENTIFIED_RESPONSE_TYPE=%{signpost.description:attribute,public}s", 68);
      OUTLINED_FUNCTION_42();
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, double))(*(_QWORD *)v0 + 568))(v4, v5, *(double *)&v3);
    }
    OUTLINED_FUNCTION_10_4();
    OUTLINED_FUNCTION_16_2();
    OUTLINED_FUNCTION_20_0();
    if ((v2[81] & 1) == 0)
    {
      if (*(_QWORD *)&v2[*(_QWORD *)(*(_QWORD *)v2 + 480)])
      {
        OUTLINED_FUNCTION_18_0();
        if (nw_activity_is_activated())
        {
          OUTLINED_FUNCTION_19_1();
          nw_activity_complete_with_reason();
        }
        else
        {
          sub_2459D98C0();
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D90F0);
          v13 = OUTLINED_FUNCTION_0_2();
          *(_OWORD *)(v13 + 16) = xmmword_2459DA4A0;
          OUTLINED_FUNCTION_18_0();
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D9FC0);
          v14 = OUTLINED_FUNCTION_31_0();
          v16 = v15;
          *(_QWORD *)(v13 + 56) = v6;
          *(_QWORD *)(v13 + 64) = sub_2459BD084();
          *(_QWORD *)(v13 + 32) = v14;
          *(_QWORD *)(v13 + 40) = v16;
          sub_2459D9668();
          swift_bridgeObjectRelease();
        }
        swift_unknownObjectRelease();
      }
      sub_2459CE38C();
    }
    OUTLINED_FUNCTION_21_0();
    swift_release();
    OUTLINED_FUNCTION_22_1();
  }
}

BOOL sub_2459CE104()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  _BOOL8 v7;
  _QWORD v9[5];

  v1 = *(_BYTE *)(v0 + 80);
  v9[3] = &type metadata for ResourceNetworkActivity;
  v9[4] = &off_2516BEA78;
  LOBYTE(v9[0]) = v1;
  v2 = *(char *)__swift_project_boxed_opaque_existential_1(v9, (uint64_t)&type metadata for ResourceNetworkActivity);
  if (qword_2574D8A98 != -1)
    goto LABEL_11;
  while (1)
  {
    v3 = *(_QWORD *)(qword_2574DA478 + 16);
    if (!v3)
      break;
    v4 = 0;
    while (1)
    {
      v5 = v4 + 1;
      if (__OFADD__(v4, 1))
        break;
      if (qword_2459DB508[*(char *)(qword_2574DA478 + 32 + v4)] == qword_2459DB508[v2])
      {
        v6 = *(unsigned __int8 *)(qword_2574DA478 + 32 + v4);
        goto LABEL_9;
      }
      ++v4;
      if (v5 == v3)
        goto LABEL_7;
    }
    __break(1u);
LABEL_11:
    swift_once();
  }
LABEL_7:
  v6 = 41;
LABEL_9:
  v7 = v6 == 41;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v7;
}

BOOL sub_2459CE1E0()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  _BOOL8 v7;
  _QWORD v9[5];

  v1 = *(_BYTE *)(v0 + 80);
  v9[3] = &type metadata for ResourceAccessActivity;
  v9[4] = &off_2516BF170;
  LOBYTE(v9[0]) = v1;
  v2 = *(char *)__swift_project_boxed_opaque_existential_1(v9, (uint64_t)&type metadata for ResourceAccessActivity);
  if (qword_2574D8AF8 != -1)
    goto LABEL_11;
  while (1)
  {
    v3 = *(_QWORD *)(qword_2574DA540 + 16);
    if (!v3)
      break;
    v4 = 0;
    while (1)
    {
      v5 = v4 + 1;
      if (__OFADD__(v4, 1))
        break;
      if (qword_2459DB508[*(char *)(qword_2574DA540 + 32 + v4)] == qword_2459DB508[v2])
      {
        v6 = *(unsigned __int8 *)(qword_2574DA540 + 32 + v4);
        goto LABEL_9;
      }
      ++v4;
      if (v5 == v3)
        goto LABEL_7;
    }
    __break(1u);
LABEL_11:
    swift_once();
  }
LABEL_7:
  v6 = 41;
LABEL_9:
  v7 = v6 == 41;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v7;
}

uint64_t sub_2459CE2BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v1 = sub_2459D95D8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0 + *(_QWORD *)(*(_QWORD *)v0 + 144), v1);
  sub_2459D95A8();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_2459CE38C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t Strong;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  os_unfair_lock_s *v31;
  uint64_t v32;
  uint64_t ObjectType;
  void (*v34)(uint64_t, _UNKNOWN **, uint64_t, uint64_t);
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D9F70);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v38 - v6;
  v9 = v0 + 24;
  v8 = *(_QWORD *)(v0 + 24);
  v10 = *(_QWORD *)(v0 + 32);
  v11 = *(_BYTE *)(v0 + 40);
  v12 = *(_BYTE *)(v0 + 41);
  v13 = (_QWORD *)(v0 + 48);
  v14 = *(_QWORD *)(v0 + 48);
  v39 = v8;
  v40 = v13;
  v15 = *(_QWORD *)(v1 + 56);
  v16 = *(_QWORD *)(v1 + 64);
  v41 = *(_QWORD *)(v1 + 72);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v42 = v16;
  swift_bridgeObjectRetain();
  v43 = v14;
  sub_2459CF14C(v14);
  v17 = *(_BYTE *)(v1 + 80);
  v18 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 136);
  if ((v12 & 1) == 0 && v15)
  {
    swift_beginAccess();
    sub_2459CC6E8(v18, (uint64_t)v7);
    v19 = sub_2459D9698();
    result = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v19);
    if ((_DWORD)result != 1)
    {
      v21 = *(_QWORD *)(v1 + 88);
      swift_bridgeObjectRetain();
      v22 = sub_2459D9908();
      v23 = sub_2459CFE38(v17);
      LOBYTE(v37) = v11;
      sub_2459BBCB4(v22, v21, v23, v24, 2, (uint64_t)v7, v39, v10, v37, v15);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v7, v19);
      goto LABEL_7;
    }
LABEL_17:
    __break(1u);
    return result;
  }
  swift_beginAccess();
  sub_2459CC6E8(v18, (uint64_t)v5);
  v25 = sub_2459D9698();
  result = __swift_getEnumTagSinglePayload((uint64_t)v5, 1, v25);
  if ((_DWORD)result == 1)
  {
    __break(1u);
    goto LABEL_17;
  }
  sub_2459D9908();
  sub_2459CFE38(v17);
  sub_2459D9680();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v25 - 8) + 8))(v5, v25);
LABEL_7:
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v27 = Strong;
    v44 = v1;
    swift_retain();
    v28 = sub_2459D9764();
    v30 = v29;
    v31 = *(os_unfair_lock_s **)(*(_QWORD *)(v27 + 32) + 16);
    os_unfair_lock_lock(v31);
    sub_2459C7C38(v27, v28, v30, v1, (uint64_t)&off_2516BEFF0);
    os_unfair_lock_unlock(v31);
    swift_bridgeObjectRelease();
    if (MEMORY[0x2495409D8](v27 + 16))
    {
      v32 = *(_QWORD *)(v27 + 24);
      ObjectType = swift_getObjectType();
      v34 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v32 + 16);
      v35 = swift_retain();
      v34(v35, &off_2516BEFF0, ObjectType, v32);
      swift_release_n();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_release();
    }
    v36 = v40;
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    *(_QWORD *)v9 = 0;
    *(_QWORD *)(v9 + 8) = 0;
    *(_BYTE *)(v9 + 16) = 0;
    *(_BYTE *)(v1 + 41) = 1;
    *v36 = 0;
    v36[1] = 0;
    *(_QWORD *)(v1 + 64) = MEMORY[0x24BEE4AF8];
    *(_QWORD *)(v1 + 72) = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    *(_BYTE *)(v1 + 81) = 1;
    return swift_weakAssign();
  }
  else
  {
    if (sub_2459CE104())
    {
      sub_2459D98E4();
      sub_2459D9668();
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2459CE790()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t Strong;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  os_unfair_lock_s *v31;
  uint64_t v32;
  uint64_t ObjectType;
  void (*v34)(uint64_t, _UNKNOWN **, uint64_t, uint64_t);
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D9F70);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v38 - v6;
  v9 = v0 + 24;
  v8 = *(_QWORD *)(v0 + 24);
  v10 = *(_QWORD *)(v0 + 32);
  v11 = *(_BYTE *)(v0 + 40);
  v12 = *(_BYTE *)(v0 + 41);
  v13 = (_QWORD *)(v0 + 48);
  v14 = *(_QWORD *)(v0 + 48);
  v39 = v8;
  v40 = v13;
  v15 = *(_QWORD *)(v1 + 56);
  v16 = *(_QWORD *)(v1 + 64);
  v41 = *(_QWORD *)(v1 + 72);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v42 = v16;
  swift_bridgeObjectRetain();
  v43 = v14;
  sub_2459CF334(v14);
  v17 = *(_BYTE *)(v1 + 80);
  v18 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 136);
  if ((v12 & 1) == 0 && v15)
  {
    swift_beginAccess();
    sub_2459CC6E8(v18, (uint64_t)v7);
    v19 = sub_2459D9698();
    result = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v19);
    if ((_DWORD)result != 1)
    {
      v21 = *(_QWORD *)(v1 + 88);
      swift_bridgeObjectRetain();
      v22 = sub_2459D9908();
      v23 = sub_2459CFE38(v17);
      LOBYTE(v37) = v11;
      sub_2459BBCB4(v22, v21, v23, v24, 2, (uint64_t)v7, v39, v10, v37, v15);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v7, v19);
      goto LABEL_7;
    }
LABEL_17:
    __break(1u);
    return result;
  }
  swift_beginAccess();
  sub_2459CC6E8(v18, (uint64_t)v5);
  v25 = sub_2459D9698();
  result = __swift_getEnumTagSinglePayload((uint64_t)v5, 1, v25);
  if ((_DWORD)result == 1)
  {
    __break(1u);
    goto LABEL_17;
  }
  sub_2459D9908();
  sub_2459CFE38(v17);
  sub_2459D9680();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v25 - 8) + 8))(v5, v25);
LABEL_7:
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v27 = Strong;
    v44 = v1;
    swift_retain();
    v28 = sub_2459D9764();
    v30 = v29;
    v31 = *(os_unfair_lock_s **)(*(_QWORD *)(v27 + 32) + 16);
    os_unfair_lock_lock(v31);
    sub_2459C7C38(v27, v28, v30, v1, (uint64_t)&off_2516BEFF0);
    os_unfair_lock_unlock(v31);
    swift_bridgeObjectRelease();
    if (MEMORY[0x2495409D8](v27 + 16))
    {
      v32 = *(_QWORD *)(v27 + 24);
      ObjectType = swift_getObjectType();
      v34 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v32 + 16);
      v35 = swift_retain();
      v34(v35, &off_2516BEFF0, ObjectType, v32);
      swift_release_n();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_release();
    }
    v36 = v40;
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    *(_QWORD *)v9 = 0;
    *(_QWORD *)(v9 + 8) = 0;
    *(_BYTE *)(v9 + 16) = 0;
    *(_BYTE *)(v1 + 41) = 1;
    *v36 = 0;
    v36[1] = 0;
    *(_QWORD *)(v1 + 64) = MEMORY[0x24BEE4AF8];
    *(_QWORD *)(v1 + 72) = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    *(_BYTE *)(v1 + 81) = 1;
    return swift_weakAssign();
  }
  else
  {
    if (sub_2459CE1E0())
    {
      sub_2459D98E4();
      sub_2459D9668();
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2459CEB98(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  os_unfair_lock_s *v9;

  v9 = *(os_unfair_lock_s **)(*(_QWORD *)(v4 + *(_QWORD *)(*(_QWORD *)v4 + 152)) + 16);
  swift_retain();
  os_unfair_lock_lock(v9);
  *(_QWORD *)(v4 + 24) = a1;
  *(_QWORD *)(v4 + 32) = a2;
  *(_BYTE *)(v4 + 40) = a3;
  *(_BYTE *)(v4 + 41) = 0;
  *(_QWORD *)(v4 + 56) = a4;
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_42();
  os_unfair_lock_unlock(v9);
  return swift_release();
}

BOOL sub_2459CEC24(char a1, char a2)
{
  return qword_2459DB508[a1] == qword_2459DB508[a2];
}

BOOL sub_2459CEC48(char a1, char a2)
{
  return qword_2459DB650[a1] == qword_2459DB650[a2];
}

void sub_2459CEC6C()
{
  OUTLINED_FUNCTION_39_0();
  OUTLINED_FUNCTION_38_1();
  OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_10_2();
}

uint64_t sub_2459CECA0()
{
  sub_2459D9B24();
  sub_2459D9B30();
  return sub_2459D9B3C();
}

uint64_t sub_2459CECF0()
{
  sub_2459D9B24();
  sub_2459D9B30();
  return sub_2459D9B3C();
}

void sub_2459CED44()
{
  OUTLINED_FUNCTION_39_0();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_10_2();
}

void sub_2459CED6C()
{
  sub_2459D9B30();
  OUTLINED_FUNCTION_0_5();
}

uint64_t sub_2459CED98()
{
  return sub_2459D9B30();
}

uint64_t sub_2459CEDC8()
{
  return sub_2459D9B30();
}

uint64_t sub_2459CEDF8()
{
  sub_2459D9B24();
  sub_2459D9B30();
  return sub_2459D9B3C();
}

uint64_t sub_2459CEE44()
{
  sub_2459D9B24();
  sub_2459D9B30();
  return sub_2459D9B3C();
}

void sub_2459CEE90()
{
  sub_2459D9B24();
  OUTLINED_FUNCTION_38_1();
  OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_10_2();
}

void sub_2459CEECC()
{
  sub_2459D9B24();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_10_2();
}

uint64_t sub_2459CEEF8(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_20_0();
  *(_QWORD *)(v1 + 48) = a1;
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_21_0();
  return swift_release();
}

uint64_t sub_2459CEF54()
{
  uint64_t v0;
  uint64_t v1;
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  _QWORD v8[5];

  v1 = v0;
  v2 = *(_BYTE *)(v0 + 80);
  v8[3] = &type metadata for ResourceAccessActivity;
  v8[4] = &off_2516BF198;
  LOBYTE(v8[0]) = v2;
  v3 = *(char *)__swift_project_boxed_opaque_existential_1(v8, (uint64_t)&type metadata for ResourceAccessActivity);
  if (qword_2574D8B00 != -1)
LABEL_13:
    swift_once();
  v4 = *(_QWORD *)(qword_2574DA548 + 16);
  if (v4)
  {
    for (i = 0; ; ++i)
    {
      v6 = i + 1;
      if (__OFADD__(i, 1))
      {
        __break(1u);
        goto LABEL_13;
      }
      if (qword_2459DB508[*(char *)(qword_2574DA548 + 32 + i)] == qword_2459DB508[v3])
        break;
      if (v6 == v4)
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
    }
    sub_2459D97A0();
    if (qword_2574D8AF0 != -1)
      swift_once();
    swift_bridgeObjectRetain();
    sub_2459D97A0();
    swift_bridgeObjectRelease();
    sub_2459CFE38(v2);
    sub_2459D99D4();
    sub_2459D97A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2459D97A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_retain();
    sub_2459CF7E4(0xD000000000000010, 0x80000002459DC730, v1);
    swift_bridgeObjectRelease();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

void sub_2459CF14C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (sub_2459CF51C(a1))
  {
    sub_2459D98CC();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D90F0);
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_2459DA490;
    if (qword_2574D8A90 != -1)
      swift_once();
    v2 = qword_2574DA468;
    v3 = unk_2574DA470;
    v4 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v1 + 56) = MEMORY[0x24BEE0D00];
    v5 = sub_2459BD084();
    *(_QWORD *)(v1 + 64) = v5;
    *(_QWORD *)(v1 + 32) = v2;
    *(_QWORD *)(v1 + 40) = v3;
    sub_2459C5F88(0, (unint64_t *)&qword_2574D9C60);
    swift_bridgeObjectRetain();
    v6 = sub_2459D96EC();
    *(_QWORD *)(v1 + 96) = v4;
    *(_QWORD *)(v1 + 104) = v5;
    *(_QWORD *)(v1 + 72) = v6;
    *(_QWORD *)(v1 + 80) = v7;
    sub_2459D9668();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2459C84CC();
    v8 = (void *)sub_2459D971C();
    swift_bridgeObjectRelease();
    v9 = (id)sub_2459D96D4();
    AnalyticsSendEvent();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
}

void sub_2459CF334(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (sub_2459CF664(a1))
  {
    sub_2459D98CC();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D90F0);
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_2459DA490;
    if (qword_2574D8AF0 != -1)
      swift_once();
    v2 = qword_2574DA530;
    v3 = *(_QWORD *)algn_2574DA538;
    v4 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v1 + 56) = MEMORY[0x24BEE0D00];
    v5 = sub_2459BD084();
    *(_QWORD *)(v1 + 64) = v5;
    *(_QWORD *)(v1 + 32) = v2;
    *(_QWORD *)(v1 + 40) = v3;
    sub_2459C5F88(0, (unint64_t *)&qword_2574D9C60);
    swift_bridgeObjectRetain();
    v6 = sub_2459D96EC();
    *(_QWORD *)(v1 + 96) = v4;
    *(_QWORD *)(v1 + 104) = v5;
    *(_QWORD *)(v1 + 72) = v6;
    *(_QWORD *)(v1 + 80) = v7;
    sub_2459D9668();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2459C84CC();
    v8 = (void *)sub_2459D971C();
    swift_bridgeObjectRelease();
    v9 = (id)sub_2459D96D4();
    AnalyticsSendEvent();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
}

uint64_t sub_2459CF51C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = dynamic_cast_existential_1_unconditional((uint64_t)&type metadata for ResourceNetworkActivity);
  if (!a1)
    return 0;
  v4 = v2;
  v5 = v3;
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);
  swift_bridgeObjectRetain();
  v7 = v6(v4, v5);
  v9 = v8;
  v10 = sub_2459D9944();
  swift_isUniquelyReferenced_nonNull_native();
  sub_2459D1188(v10, v7, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  v13 = v12;
  sub_2459CE2BC();
  v14 = sub_2459D98B4();
  swift_isUniquelyReferenced_nonNull_native();
  sub_2459D1188(v14, v11, v13);
  v15 = a1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_2459CF664(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = dynamic_cast_existential_1_unconditional((uint64_t)&type metadata for ResourceAccessActivity);
  if (!a1)
    return 0;
  v4 = v2;
  v5 = v3;
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);
  swift_bridgeObjectRetain();
  v7 = v6(v4, v5);
  v9 = v8;
  v10 = sub_2459D9944();
  swift_isUniquelyReferenced_nonNull_native();
  sub_2459D1188(v10, v7, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  v13 = v12;
  sub_2459CE2BC();
  v14 = sub_2459D98B4();
  swift_isUniquelyReferenced_nonNull_native();
  sub_2459D1188(v14, v11, v13);
  v15 = a1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_2459CF7AC(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a2 + 72) = os_transaction_create();
  return swift_unknownObjectRelease();
}

uint64_t sub_2459CF7E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    sub_2459D99B0();
    return swift_release();
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0)
    {
      v5 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      v6 = a1 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      v5 = sub_2459D99E0();
    }
    sub_2459D14FC(v5, v6, (uint64_t (*)(void))sub_2459D1170);
    return swift_release();
  }
  *(_QWORD *)(a3 + 72) = os_transaction_create();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_2459CF8E4(uint64_t a1)
{
  uint64_t result;

  switch(a1)
  {
    case 496:
      result = 15;
      break;
    case 497:
      result = 16;
      break;
    case 498:
      result = 17;
      break;
    case 499:
      result = 18;
      break;
    case 500:
      result = 19;
      break;
    case 501:
      result = 20;
      break;
    case 502:
      result = 21;
      break;
    case 503:
      result = 22;
      break;
    case 504:
      result = 23;
      break;
    case 505:
      result = 24;
      break;
    case 506:
      result = 25;
      break;
    case 507:
      result = 26;
      break;
    case 508:
      result = 27;
      break;
    case 509:
      result = 28;
      break;
    case 510:
      result = 29;
      break;
    case 511:
      result = 30;
      break;
    case 512:
      result = 31;
      break;
    case 513:
      result = 32;
      break;
    case 514:
      result = 33;
      break;
    case 515:
      result = 34;
      break;
    case 516:
      result = 35;
      break;
    case 517:
    case 518:
    case 519:
    case 520:
    case 521:
    case 522:
    case 523:
    case 524:
    case 525:
    case 526:
    case 527:
    case 528:
    case 529:
    case 530:
    case 531:
    case 532:
    case 533:
    case 534:
    case 535:
    case 536:
    case 537:
    case 538:
    case 539:
    case 540:
    case 541:
    case 542:
    case 543:
    case 544:
    case 545:
    case 546:
    case 547:
    case 548:
    case 549:
    case 559:
    case 560:
    case 561:
    case 562:
    case 563:
    case 564:
    case 565:
    case 566:
    case 567:
    case 568:
    case 569:
    case 570:
    case 571:
    case 572:
    case 573:
    case 574:
    case 578:
    case 579:
LABEL_22:
      result = 94;
      break;
    case 550:
      result = 36;
      break;
    case 551:
      result = 37;
      break;
    case 552:
      result = 38;
      break;
    case 553:
      result = 39;
      break;
    case 554:
      result = 40;
      break;
    case 555:
      result = 41;
      break;
    case 556:
      result = 42;
      break;
    case 557:
      result = 43;
      break;
    case 558:
      result = 44;
      break;
    case 575:
      result = 45;
      break;
    case 576:
      result = 46;
      break;
    case 577:
      result = 47;
      break;
    case 580:
      result = 48;
      break;
    case 581:
      result = 49;
      break;
    case 582:
      result = 50;
      break;
    case 583:
      result = 51;
      break;
    default:
      switch(a1)
      {
        case 1300:
          result = 78;
          break;
        case 1301:
          result = 79;
          break;
        case 1302:
          result = 80;
          break;
        case 1303:
          result = 81;
          break;
        case 1304:
          result = 82;
          break;
        case 1305:
          result = 83;
          break;
        case 1306:
          result = 84;
          break;
        case 1307:
          result = 85;
          break;
        case 1308:
          result = 86;
          break;
        case 1309:
          result = 87;
          break;
        case 1310:
          result = 88;
          break;
        case 1311:
          result = 89;
          break;
        case 1312:
          result = 90;
          break;
        case 1313:
          result = 91;
          break;
        case 1314:
          result = 92;
          break;
        case 1315:
          result = 93;
          break;
        default:
          result = 0;
          switch(a1)
          {
            case 0:
              return result;
            case 1:
              result = OUTLINED_FUNCTION_25_0();
              break;
            case 2:
              result = 2;
              break;
            case 3:
              result = 3;
              break;
            case 4:
              result = 4;
              break;
            case 5:
              result = 5;
              break;
            case 6:
              result = 6;
              break;
            case 7:
            case 8:
            case 9:
              goto LABEL_22;
            case 10:
              result = 7;
              break;
            case 11:
              result = 8;
              break;
            case 12:
              result = 9;
              break;
            default:
              result = 13;
              switch(a1)
              {
                case '2':
                  result = 10;
                  break;
                case '3':
                  result = 11;
                  break;
                case '4':
                  result = 12;
                  break;
                case '5':
                  return result;
                case '6':
                  result = 14;
                  break;
                default:
                  switch(a1)
                  {
                    case 600:
                      result = 52;
                      break;
                    case 601:
                      result = 53;
                      break;
                    case 602:
                      result = 54;
                      break;
                    case 603:
                      result = 55;
                      break;
                    default:
                      switch(a1)
                      {
                        case 1000:
                          result = 71;
                          break;
                        case 1001:
                          result = 72;
                          break;
                        case 1002:
                          result = 73;
                          break;
                        case 1003:
                          result = 74;
                          break;
                        default:
                          switch(a1)
                          {
                            case 700:
                              result = 56;
                              break;
                            case 701:
                              result = 57;
                              break;
                            case 702:
                              result = 58;
                              break;
                            case 1101:
                              result = 75;
                              break;
                            case 1102:
                              result = 76;
                              break;
                            case 1200:
                              result = 77;
                              break;
                            default:
                              goto LABEL_22;
                          }
                          break;
                      }
                      break;
                  }
                  break;
              }
              break;
          }
          break;
      }
      break;
  }
  return result;
}

uint64_t sub_2459CFCFC(char a1)
{
  return qword_2459DB650[a1];
}

BOOL sub_2459CFD10(char *a1, char *a2)
{
  return sub_2459CEC48(*a1, *a2);
}

uint64_t sub_2459CFD1C()
{
  return sub_2459CECA0();
}

uint64_t sub_2459CFD24()
{
  return sub_2459CEDC8();
}

uint64_t sub_2459CFD2C()
{
  return sub_2459CEDF8();
}

uint64_t sub_2459CFD34@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_2459CF8E4(*a1);
  *a2 = result;
  return result;
}

void sub_2459CFD5C(uint64_t *a1@<X8>)
{
  char *v1;

  *a1 = sub_2459CFCFC(*v1);
  OUTLINED_FUNCTION_0_5();
}

uint64_t sub_2459CFD80()
{
  if (qword_2574D8AE0 != -1)
    swift_once();
  qword_2574DA530 = qword_2574DA508;
  *(_QWORD *)algn_2574DA538 = unk_2574DA510;
  return swift_bridgeObjectRetain();
}

uint64_t *sub_2459CFDD0()
{
  if (qword_2574D8AF0 != -1)
    swift_once();
  return &qword_2574DA530;
}

void sub_2459CFE10()
{
  qword_2574DA540 = (uint64_t)&unk_2516BDFE8;
}

void sub_2459CFE24()
{
  qword_2574DA548 = (uint64_t)&unk_2516BE010;
}

uint64_t sub_2459CFE38(unsigned __int8 a1)
{
  return ((uint64_t (*)(const char *, uint64_t))((char *)sub_2459CFE64 + 4 * byte_2459DB1FE[a1]))("unknown", 7);
}

const char *sub_2459CFE64()
{
  return "configuration";
}

uint64_t sub_2459D0094(uint64_t a1)
{
  uint64_t result;

  result = 1;
  switch(a1)
  {
    case 0:
      result = 0;
      break;
    case 1:
      return result;
    case 2:
      result = 2;
      break;
    case 3:
      result = 3;
      break;
    case 4:
      result = 4;
      break;
    case 5:
      result = 5;
      break;
    case 6:
      result = 6;
      break;
    case 7:
      result = 7;
      break;
    case 8:
      result = 8;
      break;
    case 9:
      result = 9;
      break;
    case 10:
      result = 10;
      break;
    case 11:
      result = 11;
      break;
    case 12:
      result = 12;
      break;
    case 13:
      result = 13;
      break;
    case 14:
      result = 14;
      break;
    case 15:
      result = 15;
      break;
    case 16:
      result = 16;
      break;
    case 17:
      result = 17;
      break;
    case 18:
      result = 18;
      break;
    case 19:
      result = 19;
      break;
    case 20:
      result = 20;
      break;
    case 21:
      result = 21;
      break;
    case 22:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 64:
      goto LABEL_9;
    case 23:
      result = 22;
      break;
    case 24:
      result = 23;
      break;
    case 25:
      result = 24;
      break;
    case 26:
      result = 25;
      break;
    case 27:
      result = 26;
      break;
    case 28:
      result = 27;
      break;
    case 29:
      result = 28;
      break;
    case 50:
      result = 29;
      break;
    case 60:
      result = 30;
      break;
    case 61:
      result = 31;
      break;
    case 62:
      result = 32;
      break;
    case 63:
      result = 33;
      break;
    case 65:
      result = 34;
      break;
    case 66:
      result = 35;
      break;
    default:
      switch(a1)
      {
        case 100:
          result = 36;
          break;
        case 200:
          result = 37;
          break;
        case 300:
          result = 38;
          break;
        case 301:
          result = 39;
          break;
        case 400:
          result = 40;
          break;
        default:
LABEL_9:
          result = 41;
          break;
      }
      break;
  }
  return result;
}

uint64_t sub_2459D022C(char a1)
{
  return qword_2459DB508[a1];
}

uint64_t sub_2459D0240()
{
  return sub_2459CECF0();
}

uint64_t sub_2459D0248()
{
  return sub_2459CED98();
}

uint64_t sub_2459D0250()
{
  return sub_2459CEE44();
}

uint64_t sub_2459D0258@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_2459D0094(*a1);
  *a2 = result;
  return result;
}

void sub_2459D0280(uint64_t *a1@<X8>)
{
  char *v1;

  *a1 = sub_2459D022C(*v1);
  OUTLINED_FUNCTION_0_5();
}

uint64_t sub_2459D02A4()
{
  uint64_t v0;

  sub_2459CFDD0();
  v0 = qword_2574DA530;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_2459D02DC()
{
  unsigned __int8 *v0;

  return sub_2459CFE38(*v0);
}

uint64_t sub_2459D02F8(_QWORD *a1, int a2, uint64_t a3, unint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __n128 *inited;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  const char *v20;
  _QWORD *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  __n128 *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;

  v6 = v5;
  *(_BYTE *)(v6 + qword_2574D9C80) = 0;
  v11 = a5 & 1;
  *(_QWORD *)(v6 + qword_2574DA550) = 0;
  v12 = v6 + qword_2574DA558;
  *(_QWORD *)v12 = 0;
  *(_BYTE *)(v12 + 8) = 1;
  *(_BYTE *)(v6 + qword_2574D9C88) = 0;
  v13 = v6 + qword_2574DA560;
  v14 = OUTLINED_FUNCTION_32_1();
  v15 = *(_QWORD *)(v14 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v13, a3, v14);
  *(_QWORD *)v12 = a4;
  *(_BYTE *)(v12 + 8) = v11;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D90F0);
  if ((a5 & 1) != 0)
  {
    inited = (__n128 *)swift_initStackObject();
    v17 = OUTLINED_FUNCTION_27_1(inited, (__n128)xmmword_2459DA4A0);
    v19 = v18;
    inited[3].n128_u64[1] = MEMORY[0x24BEE0D00];
    inited[4].n128_u64[0] = sub_2459BD084();
    inited[2].n128_u64[0] = v17;
    inited[2].n128_u64[1] = v19;
    v20 = "client=%{signpost.description:attribute,public}s";
    v21 = a1;
    v22 = a2;
    v23 = 48;
    v24 = (uint64_t)inited;
  }
  else
  {
    v25 = (__n128 *)swift_initStackObject();
    v26 = OUTLINED_FUNCTION_27_1(v25, (__n128)xmmword_2459DA490);
    v28 = v27;
    v25[3].n128_u64[1] = MEMORY[0x24BEE0D00];
    v29 = sub_2459BD084();
    v25[2].n128_u64[0] = v26;
    v25[2].n128_u64[1] = v28;
    v30 = MEMORY[0x24BEE45B8];
    v25[6].n128_u64[0] = MEMORY[0x24BEE4568];
    v25[6].n128_u64[1] = v30;
    v25[4].n128_u64[0] = v29;
    v25[4].n128_u64[1] = a4;
    v20 = "client=%{signpost.description:attribute,public}s, identifier=%{signpost.description:attribute,public}llu";
    v21 = a1;
    v22 = a2;
    v23 = 104;
    v24 = (uint64_t)v25;
  }
  v31 = sub_2459CCA48(v21, v22, (uint64_t)v20, v23, 2, v24);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a3, v14);
  return v31;
}

uint64_t sub_2459D04B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  v1 = v0 + qword_2574DA560;
  v2 = OUTLINED_FUNCTION_32_1();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
}

void sub_2459D04FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)(v0 + 81) & 1) == 0)
    sub_2459D0864();
  v1 = sub_2459CCFD8();
  swift_release();
  v2 = v1 + qword_2574DA560;
  v3 = OUTLINED_FUNCTION_32_1();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  OUTLINED_FUNCTION_0_5();
}

uint64_t sub_2459D055C()
{
  sub_2459D04FC();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceAccessSpan()
{
  uint64_t result;

  result = qword_2574D9CB8;
  if (!qword_2574D9CB8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2459D05B4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2459D9650();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_2459D0648()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  unint64_t v14;

  sub_2459D98D8();
  sub_2459D9668();
  sub_2459CD544();
  sub_2459D98D8();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D90F0);
  v1 = OUTLINED_FUNCTION_0_2();
  *(_OWORD *)(v1 + 16) = xmmword_2459DA4A0;
  v2 = sub_2459D9764();
  v4 = v3;
  v5 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v1 + 56) = MEMORY[0x24BEE0D00];
  v6 = sub_2459BD084();
  *(_QWORD *)(v1 + 64) = v6;
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v4;
  OUTLINED_FUNCTION_9_3();
  swift_bridgeObjectRelease();
  sub_2459D98D8();
  v7 = OUTLINED_FUNCTION_0_2();
  *(_OWORD *)(v7 + 16) = xmmword_2459DA4A0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9FD0);
  v8 = sub_2459D9764();
  *(_QWORD *)(v7 + 56) = v5;
  *(_QWORD *)(v7 + 64) = v6;
  *(_QWORD *)(v7 + 32) = v8;
  *(_QWORD *)(v7 + 40) = v9;
  OUTLINED_FUNCTION_9_3();
  swift_bridgeObjectRelease();
  sub_2459D98D8();
  v10 = OUTLINED_FUNCTION_0_2();
  v11 = *(_QWORD *)(v0 + qword_2574DA550);
  *(_OWORD *)(v10 + 16) = xmmword_2459DA4A0;
  *(_QWORD *)(v10 + 56) = v5;
  *(_QWORD *)(v10 + 64) = v6;
  v12 = v11 == 0;
  v13 = 7562617;
  if (v12)
    v13 = 28526;
  v14 = 0xE300000000000000;
  if (v12)
    v14 = 0xE200000000000000;
  *(_QWORD *)(v10 + 32) = v13;
  *(_QWORD *)(v10 + 40) = v14;
  sub_2459D9668();
  OUTLINED_FUNCTION_14_0();
  sub_2459D98D8();
  return sub_2459D9668();
}

void sub_2459D0864()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t inited;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if ((*(_BYTE *)(v0 + 81) & 1) == 0)
  {
    v1 = v0;
    if (*(_QWORD *)(v0 + qword_2574DA550))
    {
      swift_retain();
      sub_2459CDF20();
      swift_release();
    }
    v2 = MEMORY[0x24BEE0D00];
    if ((*(_BYTE *)(v0 + qword_2574D9C88) & 1) == 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9F90);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_2459DA490;
      if (qword_2574D8AC8 != -1)
        swift_once();
      v4 = unk_2574DA4E0;
      *(_QWORD *)(inited + 32) = qword_2574DA4D8;
      *(_QWORD *)(inited + 40) = v4;
      swift_bridgeObjectRetain();
      sub_2459D9644();
      *(_QWORD *)(inited + 48) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithUnsignedInteger_, sub_2459D962C());
      if (qword_2574D8AD0 != -1)
        swift_once();
      v5 = unk_2574DA4F0;
      *(_QWORD *)(inited + 56) = qword_2574DA4E8;
      *(_QWORD *)(inited + 64) = v5;
      v6 = qword_2459DB650[*(char *)(v1 + qword_2574D9C80)];
      v7 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
      swift_bridgeObjectRetain();
      *(_QWORD *)(inited + 72) = objc_msgSend(v7, sel_initWithUnsignedInteger_, v6);
      sub_2459C5F88(0, (unint64_t *)&unk_2574D9F98);
      v8 = sub_2459D96F8();
      sub_2459D0E18(v8);
      v10 = v9;
      OUTLINED_FUNCTION_17_0();
      sub_2459CEEF8(v10);
      OUTLINED_FUNCTION_42();
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D90F0);
    v11 = OUTLINED_FUNCTION_0_2();
    *(_OWORD *)(v11 + 16) = xmmword_2459DA4A0;
    v12 = sub_2459D9764();
    v14 = v13;
    *(_QWORD *)(v11 + 56) = v2;
    *(_QWORD *)(v11 + 64) = sub_2459BD084();
    *(_QWORD *)(v11 + 32) = v12;
    *(_QWORD *)(v11 + 40) = v14;
    OUTLINED_FUNCTION_6_5((uint64_t)"outcome=%{signpost.description:attribute,public}s", 49);
    OUTLINED_FUNCTION_42();
    OUTLINED_FUNCTION_16_2();
    OUTLINED_FUNCTION_20_0();
    if ((*(_BYTE *)(v1 + 81) & 1) == 0)
      sub_2459CE790();
    OUTLINED_FUNCTION_21_0();
    OUTLINED_FUNCTION_22_1();
  }
  OUTLINED_FUNCTION_7_3();
}

uint64_t getEnumTagSinglePayload for ResourceAccessOutcome(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xA3)
  {
    if (a2 + 93 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 93) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 94;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x5E;
  v5 = v6 - 94;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ResourceAccessOutcome(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 93 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 93) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xA3)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xA2)
    return ((uint64_t (*)(void))((char *)&loc_2459D0BA8 + 4 * byte_2459DB26F[v4]))();
  *a1 = a2 + 93;
  return ((uint64_t (*)(void))((char *)sub_2459D0BDC + 4 * byte_2459DB26A[v4]))();
}

uint64_t sub_2459D0BDC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2459D0BE4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2459D0BECLL);
  return result;
}

uint64_t sub_2459D0BF8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2459D0C00);
  *(_BYTE *)result = a2 + 93;
  return result;
}

uint64_t sub_2459D0C04(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2459D0C0C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ResourceAccessOutcome()
{
  return &type metadata for ResourceAccessOutcome;
}

uint64_t storeEnumTagSinglePayload for ResourceAccessActivity(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 40 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 40) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xD8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xD7)
    return ((uint64_t (*)(void))((char *)&loc_2459D0C74 + 4 * byte_2459DB279[v4]))();
  *a1 = a2 + 40;
  return ((uint64_t (*)(void))((char *)sub_2459D0CA8 + 4 * byte_2459DB274[v4]))();
}

uint64_t sub_2459D0CA8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2459D0CB0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2459D0CB8);
  return result;
}

uint64_t sub_2459D0CC4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2459D0CCCLL);
  *(_BYTE *)result = a2 + 40;
  return result;
}

uint64_t sub_2459D0CD0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2459D0CD8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ResourceAccessActivity()
{
  return &type metadata for ResourceAccessActivity;
}

unint64_t sub_2459D0CF4(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_2459D0D20();
  result = sub_2459D0D5C();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_2459D0D20()
{
  unint64_t result;

  result = qword_2574D9F50;
  if (!qword_2574D9F50)
  {
    result = MEMORY[0x2495408C4](&unk_2459DB3FC, &type metadata for ResourceAccessActivity);
    atomic_store(result, (unint64_t *)&qword_2574D9F50);
  }
  return result;
}

unint64_t sub_2459D0D5C()
{
  unint64_t result;

  result = qword_2574D9F58;
  if (!qword_2574D9F58)
  {
    result = MEMORY[0x2495408C4](&unk_2459DB3C4, &type metadata for ResourceAccessActivity);
    atomic_store(result, (unint64_t *)&qword_2574D9F58);
  }
  return result;
}

unint64_t sub_2459D0D9C()
{
  unint64_t result;

  result = qword_2574D9F60;
  if (!qword_2574D9F60)
  {
    result = MEMORY[0x2495408C4](&unk_2459DB43C, &type metadata for ResourceAccessActivity);
    atomic_store(result, (unint64_t *)&qword_2574D9F60);
  }
  return result;
}

unint64_t sub_2459D0DDC()
{
  unint64_t result;

  result = qword_2574D9F68;
  if (!qword_2574D9F68)
  {
    result = MEMORY[0x2495408C4](&unk_2459DB4DC, &type metadata for ResourceAccessOutcome);
    atomic_store(result, (unint64_t *)&qword_2574D9F68);
  }
  return result;
}

void sub_2459D0E18(uint64_t a1)
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
  int64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D9FB0);
    v2 = (_QWORD *)sub_2459D9A40();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v28 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(63 - v3) >> 6;
  swift_bridgeObjectRetain();
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
          goto LABEL_34;
        if (v9 >= v27)
        {
LABEL_31:
          sub_2459D1554();
          return;
        }
        v10 = *(_QWORD *)(v28 + 8 * v9);
        v11 = v6 + 1;
        if (!v10)
        {
          v11 = v6 + 2;
          if (v6 + 2 >= v27)
            goto LABEL_31;
          v10 = *(_QWORD *)(v28 + 8 * v11);
          if (!v10)
          {
            v11 = v6 + 3;
            if (v6 + 3 >= v27)
              goto LABEL_31;
            v10 = *(_QWORD *)(v28 + 8 * v11);
            if (!v10)
            {
              v11 = v6 + 4;
              if (v6 + 4 >= v27)
                goto LABEL_31;
              v10 = *(_QWORD *)(v28 + 8 * v11);
              if (!v10)
              {
                v12 = v6 + 5;
                if (v6 + 5 >= v27)
                  goto LABEL_31;
                v10 = *(_QWORD *)(v28 + 8 * v12);
                if (!v10)
                {
                  while (1)
                  {
                    v11 = v12 + 1;
                    if (__OFADD__(v12, 1))
                      goto LABEL_35;
                    if (v11 >= v27)
                      goto LABEL_31;
                    v10 = *(_QWORD *)(v28 + 8 * v11);
                    ++v12;
                    if (v10)
                      goto LABEL_25;
                  }
                }
                v11 = v6 + 5;
              }
            }
          }
        }
LABEL_25:
        v5 = (v10 - 1) & v10;
        v8 = __clz(__rbit64(v10)) + (v11 << 6);
        v6 = v11;
      }
      v13 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v8);
      v15 = *v13;
      v14 = v13[1];
      v16 = *(void **)(*(_QWORD *)(a1 + 56) + 8 * v8);
      swift_bridgeObjectRetain();
      v17 = v16;
      v18 = sub_2459D7754();
      v19 = v18;
      if ((v20 & 1) == 0)
        break;
      v21 = (_QWORD *)(v2[6] + 16 * v18);
      swift_bridgeObjectRelease();
      *v21 = v15;
      v21[1] = v14;
      v22 = v2[7];

      *(_QWORD *)(v22 + 8 * v19) = v17;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v18;
    v23 = (_QWORD *)(v2[6] + 16 * v18);
    *v23 = v15;
    v23[1] = v14;
    *(_QWORD *)(v2[7] + 8 * v18) = v17;
    v24 = v2[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (v25)
      goto LABEL_33;
    v2[2] = v26;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
}

uint64_t sub_2459D10AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574D9F70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2459D10F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v3;
  *v3 = 0x8000000000000000;
  sub_2459D1364(a1, a2, a3);
  *v3 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2459D1170(uint64_t a1)
{
  uint64_t v1;

  return sub_2459CF7AC(a1, v1);
}

void sub_2459D1188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD **v3;
  unint64_t v7;
  char v8;
  char v9;
  unint64_t v10;
  char v11;
  unint64_t v12;
  char v13;
  _QWORD *v14;
  uint64_t v15;

  sub_2459D7754();
  OUTLINED_FUNCTION_29_1();
  if (v9)
  {
    __break(1u);
    goto LABEL_9;
  }
  v10 = v7;
  v11 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9FA8);
  if ((sub_2459D99EC() & 1) == 0)
    goto LABEL_5;
  v12 = sub_2459D7754();
  if ((v11 & 1) != (v13 & 1))
  {
LABEL_9:
    sub_2459D9ADC();
    __break(1u);
    return;
  }
  v10 = v12;
LABEL_5:
  v14 = *v3;
  if ((v11 & 1) != 0)
  {
    v15 = v14[7];

    *(_QWORD *)(v15 + 8 * v10) = a1;
  }
  else
  {
    sub_2459D14B4(v10, a2, a3, a1, v14);
    swift_bridgeObjectRetain();
  }
}

unint64_t sub_2459D1290(uint64_t a1)
{
  uint64_t *v1;
  unint64_t v3;
  char v4;
  char v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t result;

  sub_2459D77A8();
  OUTLINED_FUNCTION_29_1();
  if (v5)
  {
    __break(1u);
    goto LABEL_9;
  }
  v6 = v3;
  v7 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9FD8);
  if ((sub_2459D99EC() & 1) == 0)
    goto LABEL_5;
  v8 = sub_2459D77A8();
  if ((v7 & 1) != (v9 & 1))
  {
LABEL_9:
    result = sub_2459D9ADC();
    __break(1u);
    return result;
  }
  v6 = v8;
LABEL_5:
  v10 = *v1;
  if ((v7 & 1) == 0)
    return sub_2459D1478(v6, a1, v10);
  v11 = *(_QWORD *)(v10 + 56);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v11 + 8 * v6) = a1;
  return result;
}

uint64_t sub_2459D1364(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t result;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_2459D7754();
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9970);
  if ((sub_2459D99EC() & 1) == 0)
    goto LABEL_5;
  v13 = sub_2459D7754();
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    result = sub_2459D9ADC();
    __break(1u);
    return result;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = v15[7];
    result = swift_release();
    *(_QWORD *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_2459D14B4(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_2459D1478(unint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  BOOL v4;
  uint64_t v5;

  *(_QWORD *)(a3 + 8 * (result >> 6) + 64) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a3 + 56) + 8 * result) = a2;
  v3 = *(_QWORD *)(a3 + 16);
  v4 = __OFADD__(v3, 1);
  v5 = v3 + 1;
  if (v4)
    __break(1u);
  else
    *(_QWORD *)(a3 + 16) = v5;
  return result;
}

unint64_t sub_2459D14B4(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
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

uint64_t sub_2459D14FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t dynamic_cast_existential_1_unconditional(uint64_t a1)
{
  uint64_t result;

  result = swift_conformsToProtocol2();
  if (result)
    return a1;
  __break(1u);
  return result;
}

uint64_t sub_2459D1554()
{
  return swift_release();
}

void sub_2459D155C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x2495408C4](a3, v5), a1);
  }
  OUTLINED_FUNCTION_0_5();
}

void sub_2459D1598(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_5_5(v2);
  OUTLINED_FUNCTION_0_5();
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return swift_dynamicCast();
}

void OUTLINED_FUNCTION_2_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,__int128 a21)
{
  uint64_t v21;

  sub_2459D2074((uint64_t)&a16, v21, &a21);
}

uint64_t OUTLINED_FUNCTION_3_6()
{
  return sub_2459D9668();
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  return sub_2459D9788();
}

uint64_t OUTLINED_FUNCTION_6_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2459CEB98(a1, a2, 2, v2);
}

uint64_t OUTLINED_FUNCTION_8_5()
{
  return sub_2459D9788();
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return sub_2459D9668();
}

uint64_t OUTLINED_FUNCTION_10_4()
{
  return swift_retain();
}

void OUTLINED_FUNCTION_13_2(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  sub_2459D1598((uint64_t)va, a2);
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return sub_2459D99A4();
}

uint64_t OUTLINED_FUNCTION_16_2()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_17_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  return sub_2459BD0C0((uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return swift_unknownObjectRetain();
}

void OUTLINED_FUNCTION_20_0()
{
  os_unfair_lock_s *v0;

  os_unfair_lock_lock(v0);
}

void OUTLINED_FUNCTION_21_0()
{
  os_unfair_lock_s *v0;

  os_unfair_lock_unlock(v0);
}

uint64_t OUTLINED_FUNCTION_22_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_23_1()
{
  return sub_2459D9B3C();
}

uint64_t OUTLINED_FUNCTION_24_1()
{
  return sub_2459D99A4();
}

uint64_t OUTLINED_FUNCTION_27_1(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return sub_2459D9638();
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return sub_2459D9764();
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return sub_2459D9764();
}

uint64_t OUTLINED_FUNCTION_32_1()
{
  return sub_2459D9650();
}

uint64_t OUTLINED_FUNCTION_33_1()
{
  return sub_2459D9668();
}

uint64_t OUTLINED_FUNCTION_35_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_38_1()
{
  return sub_2459D9B30();
}

uint64_t OUTLINED_FUNCTION_39_0()
{
  return sub_2459D9B24();
}

uint64_t sub_2459D1760()
{
  uint64_t result;

  result = sub_2459D971C();
  qword_2574DA568 = result;
  return result;
}

uint64_t sub_2459D17A0()
{
  return 0;
}

void type metadata accessor for SafariAssistantAssetSpecifierLocale()
{
  OUTLINED_FUNCTION_2_6();
}

uint64_t sub_2459D17B4(unsigned int *a1, int a2)
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

uint64_t sub_2459D1804(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2459D1844 + 4 * byte_2459DB940[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2459D1864 + 4 * byte_2459DB945[v4]))();
}

_BYTE *sub_2459D1844(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2459D1864(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2459D186C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2459D1874(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2459D187C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2459D1884(_DWORD *result)
{
  *result = 0;
  return result;
}

void type metadata accessor for SafariAssistantAssetSpecifierCountryCode()
{
  OUTLINED_FUNCTION_2_6();
}

uint64_t sub_2459D189C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;

  if (qword_2574D8B10 != -1)
    swift_once();
  if ((sub_2459D1D24(a1, a2, (_QWORD *)qword_2574DA570) & 1) == 0)
    goto LABEL_8;
  if (qword_2574D8B18 != -1)
    swift_once();
  if ((sub_2459D1D24(a3, a4, (_QWORD *)qword_2574DA578) & 1) != 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
LABEL_8:
    if (qword_2574D8AE8 != -1)
      swift_once();
    v9 = sub_2459D96BC();
    __swift_project_value_buffer(v9, (uint64_t)qword_2574DA518);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10 = sub_2459D96A4();
    v11 = sub_2459D98D8();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = swift_slowAlloc();
      v13 = swift_slowAlloc();
      *(_DWORD *)v12 = 136643075;
      swift_bridgeObjectRetain();
      sub_2459D6FF4(a1, a2, &v13);
      sub_2459D9950();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v12 + 12) = 2085;
      swift_bridgeObjectRetain();
      sub_2459D6FF4(a3, a4, &v13);
      sub_2459D9950();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2459B6000, v10, v11, "SafariSummarizationPrefetch - Unsupported countryCode %{sensitive}s or locale %{sensitive}s", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2();
    }

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    return 1;
  }
}

BOOL sub_2459D1B38@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = sub_2459D1BBC();
  *a1 = result;
  return result;
}

unint64_t sub_2459D1B7C()
{
  unint64_t result;

  result = qword_2574D9FE0;
  if (!qword_2574D9FE0)
  {
    result = MEMORY[0x2495408C4](&unk_2459DBA7C, &unk_2516BF3D0);
    atomic_store(result, (unint64_t *)&qword_2574D9FE0);
  }
  return result;
}

BOOL sub_2459D1BBC()
{
  uint64_t v0;

  v0 = sub_2459D9A58();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

BOOL sub_2459D1BFC@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = sub_2459D1BBC();
  *a1 = result;
  return result;
}

uint64_t sub_2459D1C38@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = j__OUTLINED_FUNCTION_0_9();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_2459D1C60()
{
  unint64_t result;

  result = qword_2574D9FE8;
  if (!qword_2574D9FE8)
  {
    result = MEMORY[0x2495408C4](&unk_2459DBB44, &unk_2516BF340);
    atomic_store(result, (unint64_t *)&qword_2574D9FE8);
  }
  return result;
}

double sub_2459D1C9C(uint64_t a1)
{
  return sub_2459D1CCC(a1, 21333, 0xE200000000000000, &qword_2574DA570);
}

double sub_2459D1CB0(uint64_t a1)
{
  return sub_2459D1CCC(a1, 0x53555F6E65, 0xE500000000000000, &qword_2574DA578);
}

double sub_2459D1CCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  double result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9FF0);
  v7 = swift_allocObject();
  *(_QWORD *)&result = 1;
  *(_OWORD *)(v7 + 16) = xmmword_2459DA4A0;
  *(_QWORD *)(v7 + 32) = a2;
  *(_QWORD *)(v7 + 40) = a3;
  *a4 = v7;
  return result;
}

uint64_t sub_2459D1D24(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  result = sub_2459D9AC4();
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
    if (v12 || (sub_2459D9AC4() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

void type metadata accessor for SASafariAssistantAssetSpecifier()
{
  OUTLINED_FUNCTION_2_6();
}

uint64_t OUTLINED_FUNCTION_0_9()
{
  return 0x6E6F6D6D6F63;
}

void sub_2459D1E14()
{
  uint64_t v0;
  os_unfair_lock_s *v1;

  v1 = *(os_unfair_lock_s **)(v0 + 24);
  os_unfair_lock_lock(v1);
  OUTLINED_FUNCTION_159();
  os_unfair_lock_unlock(v1);
  OUTLINED_FUNCTION_0_5();
}

uint64_t sub_2459D1E48()
{
  _QWORD *v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = (os_unfair_lock_s *)v0[5];
  os_unfair_lock_lock(v1);
  v2 = v0[2];
  sub_2459C91AC(v2, v0[3]);
  os_unfair_lock_unlock(v1);
  return v2;
}

uint64_t sub_2459D1EA0()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = *(os_unfair_lock_s **)(v0 + 24);
  os_unfair_lock_lock(v1);
  v2 = *(unsigned __int8 *)(v0 + 16);
  os_unfair_lock_unlock(v1);
  return v2;
}

uint64_t sub_2459D1ED4()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = *(os_unfair_lock_s **)(v0 + 24);
  os_unfair_lock_lock(v1);
  v2 = *(_QWORD *)(v0 + 16);
  swift_retain();
  os_unfair_lock_unlock(v1);
  return v2;
}

void sub_2459D1F10(char a1)
{
  uint64_t v1;
  os_unfair_lock_s *v3;

  v3 = *(os_unfair_lock_s **)(v1 + 24);
  os_unfair_lock_lock(v3);
  *(_BYTE *)(v1 + 16) = a1;
  os_unfair_lock_unlock(v3);
}

uint64_t sub_2459D1F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  os_unfair_lock_s *v7;
  uint64_t v8;
  uint64_t v9;

  v7 = (os_unfair_lock_s *)v3[5];
  os_unfair_lock_lock(v7);
  v8 = v3[2];
  v9 = v3[3];
  v3[2] = a1;
  v3[3] = a2;
  v3[4] = a3;
  sub_2459C91AC(a1, a2);
  sub_2459C91DC(v8, v9);
  os_unfair_lock_unlock(v7);
  return sub_2459C91DC(a1, a2);
}

uint64_t sub_2459D1FD4(uint64_t a1)
{
  uint64_t v1;
  os_unfair_lock_s *v3;

  v3 = *(os_unfair_lock_s **)(v1 + 24);
  os_unfair_lock_lock(v3);
  *(_QWORD *)(v1 + 16) = a1;
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_114();
  os_unfair_lock_unlock(v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2459D2020(uint64_t a1)
{
  uint64_t v1;
  os_unfair_lock_s *v3;

  v3 = *(os_unfair_lock_s **)(v1 + 24);
  os_unfair_lock_lock(v3);
  *(_QWORD *)(v1 + 16) = a1;
  swift_retain();
  swift_release();
  os_unfair_lock_unlock(v3);
  return swift_release();
}

void sub_2459D2074(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v5;
  char v6;

  if (*(_QWORD *)(a2 + 16) && (v5 = sub_2459D7724(a1), (v6 & 1) != 0))
  {
    sub_2459D8208(*(_QWORD *)(a2 + 56) + 32 * v5, (uint64_t)a3);
  }
  else
  {
    *a3 = 0u;
    a3[1] = 0u;
    OUTLINED_FUNCTION_0_5();
  }
}

void sub_2459D20C0(uint64_t a1)
{
  char v1;

  if (*(_QWORD *)(a1 + 16))
  {
    sub_2459D77AC();
    if ((v1 & 1) != 0)
      swift_bridgeObjectRetain();
  }
  OUTLINED_FUNCTION_0_5();
}

void sub_2459D20FC(uint64_t a1)
{
  uint64_t v2;
  char v3;
  id v4;

  if (*(_QWORD *)(a1 + 16))
  {
    v2 = sub_2459D77AC();
    if ((v3 & 1) != 0)
      v4 = *(id *)(*(_QWORD *)(a1 + 56) + 8 * v2);
  }
  OUTLINED_FUNCTION_0_5();
}

uint64_t sub_2459D213C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  char v5;
  uint64_t v6;

  if (!*(_QWORD *)(a3 + 16))
    return 0;
  v4 = sub_2459D7754();
  if ((v5 & 1) == 0)
    return 0;
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 56) + 16 * v4);
  OUTLINED_FUNCTION_159();
  return v6;
}

uint64_t sub_2459D218C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16) && (sub_2459D7754(), (v3 & 1) != 0))
    return swift_bridgeObjectRetain();
  else
    return 0;
}

uint64_t sub_2459D21CC(uint64_t a1, uint64_t a2)
{
  char v2;

  if (*(_QWORD *)(a2 + 16) && (sub_2459D77FC(a1), (v2 & 1) != 0))
    return swift_bridgeObjectRetain();
  else
    return 0;
}

void sub_2459D220C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_2459D7754();
    if ((v3 & 1) != 0)
      swift_retain();
  }
  OUTLINED_FUNCTION_0_5();
}

void sub_2459D2248(char a1)
{
  uint64_t v1;

  Lock.lock()();
  swift_beginAccess();
  *(_BYTE *)(v1 + 24) = a1;
  Lock.unlock()();
}

uint64_t sub_2459D229C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_2459D9890();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_2459C9134(a1, &qword_2574D8E00);
  }
  else
  {
    sub_2459D9884();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2459D9854();
    swift_unknownObjectRelease();
  }
  v7 = OUTLINED_FUNCTION_3_0();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2459D23DC()
{
  char v0;

  OUTLINED_FUNCTION_157();
  v0 = sub_2459D1EA0();
  OUTLINED_FUNCTION_24_2();
  return v0 & 1;
}

uint64_t sub_2459D240C(char a1)
{
  OUTLINED_FUNCTION_157();
  sub_2459D1F10(a1);
  return OUTLINED_FUNCTION_61();
}

uint64_t sub_2459D2438()
{
  uint64_t v0;

  OUTLINED_FUNCTION_157();
  v0 = sub_2459D1E48();
  OUTLINED_FUNCTION_24_2();
  return v0;
}

uint64_t sub_2459D2480(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_157();
  v4 = OUTLINED_FUNCTION_112();
  sub_2459D1F48(v4, v5, a3);
  return swift_release();
}

void sub_2459D24C4()
{
  OUTLINED_FUNCTION_157();
  sub_2459D1ED4();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_0_5();
}

uint64_t sub_2459D24F0(uint64_t a1)
{
  swift_retain();
  OUTLINED_FUNCTION_157();
  sub_2459D2020(a1);
  OUTLINED_FUNCTION_24_2();
  return OUTLINED_FUNCTION_61();
}

void sub_2459D2524()
{
  NSObject *v0;
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  os_log_type_t v8;
  uint8_t *v9;
  NSObject *v10;

  if (qword_2574D8AE8 != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_24();
  __swift_project_value_buffer(v1, (uint64_t)qword_2574DA518);
  OUTLINED_FUNCTION_37_0();
  v2 = OUTLINED_FUNCTION_15_2();
  if (os_log_type_enabled(v0, v2))
  {
    v3 = (uint8_t *)OUTLINED_FUNCTION_8();
    *(_WORD *)v3 = 0;
    OUTLINED_FUNCTION_7_4(&dword_2459B6000, v0, v2, "SafariSummarizationPrefetch - Canceling task if needed", v3);
    OUTLINED_FUNCTION_2();
  }

  sub_2459D24C4();
  if (v4)
  {
    sub_2459D989C();
    OUTLINED_FUNCTION_24_2();
  }
  OUTLINED_FUNCTION_136();
  OUTLINED_FUNCTION_26();
  sub_2459D2480(v5, v6, v7);
  v10 = sub_2459D96A4();
  v8 = sub_2459D98F0();
  if (OUTLINED_FUNCTION_20_1(v10))
  {
    v9 = (uint8_t *)OUTLINED_FUNCTION_8();
    *(_WORD *)v9 = 0;
    OUTLINED_FUNCTION_7_4(&dword_2459B6000, v10, v8, "SafariSummarizationPrefetch - Successfully reset filter", v9);
    OUTLINED_FUNCTION_2();
  }

}

uint64_t sub_2459D268C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = v0;
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_2459D269C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  os_log_type_t v4;
  _WORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  os_log_type_t v10;
  _WORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 40) + 160);
  v2 = *(void **)(v1 + 16);
  swift_retain();
  Lock.lock()();
  OUTLINED_FUNCTION_130_0();
  if ((*(_BYTE *)(v1 + 24) & 1) != 0)
  {
    Lock.unlock()();
    OUTLINED_FUNCTION_30_1();
    if (qword_2574D8AE8 != -1)
      swift_once();
    v3 = OUTLINED_FUNCTION_24();
    __swift_project_value_buffer(v3, (uint64_t)qword_2574DA518);
    OUTLINED_FUNCTION_37_0();
    v4 = OUTLINED_FUNCTION_15_2();
    if (OUTLINED_FUNCTION_12(v4))
    {
      v5 = (_WORD *)OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_35(v5);
      OUTLINED_FUNCTION_11(&dword_2459B6000, v6, v7, "SafariSummarizationPrefetch - Throttling new submission. Loading the url path filter data is already in progress");
      OUTLINED_FUNCTION_2();
    }

    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
  else
  {
    *(_BYTE *)(v1 + 24) = 1;
    Lock.unlock()();
    OUTLINED_FUNCTION_30_1();
    if (qword_2574D8AE8 != -1)
      swift_once();
    v9 = OUTLINED_FUNCTION_24();
    *(_QWORD *)(v0 + 48) = __swift_project_value_buffer(v9, (uint64_t)qword_2574DA518);
    OUTLINED_FUNCTION_37_0();
    v10 = OUTLINED_FUNCTION_15_2();
    if (OUTLINED_FUNCTION_12(v10))
    {
      v11 = (_WORD *)OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_35(v11);
      OUTLINED_FUNCTION_11(&dword_2459B6000, v12, v13, "SafariSummarizationPrefetch - Start loading the url path filter data");
      OUTLINED_FUNCTION_2();
    }

    v14 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 56) = v14;
    *v14 = v0;
    v14[1] = sub_2459D2840;
    return sub_2459D2B18();
  }
}

uint64_t sub_2459D2840(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v5 = (_QWORD *)*v4;
  v5[8] = a1;
  v5[9] = a2;
  v5[10] = a3;
  v5[11] = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_26();
  return OUTLINED_FUNCTION_3();
}

uint64_t sub_2459D28A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  void *v9;
  os_log_type_t v10;
  _WORD *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  os_log_type_t v15;
  uint64_t v16;
  void *v17;
  os_log_type_t v18;
  _WORD *v19;
  uint64_t v20;
  uint64_t v21;

  swift_bridgeObjectRetain();
  v1 = sub_2459D2438();
  v3 = *(_QWORD *)(v0 + 72);
  if (v2)
  {
    v4 = v1;
    v5 = v2;
    v6 = *(_QWORD *)(v0 + 64);
    swift_bridgeObjectRetain();
    sub_2459C91DC(v4, v5);
    if (v6 == v4 && v5 == v3)
    {
      OUTLINED_FUNCTION_17_0();
      OUTLINED_FUNCTION_41_0();
LABEL_14:
      OUTLINED_FUNCTION_41_0();
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    v8 = OUTLINED_FUNCTION_122_0();
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_41_0();
    if ((v8 & 1) != 0)
      goto LABEL_14;
  }
  else
  {
    OUTLINED_FUNCTION_14_0();
  }
  if ((sub_2459D98A8() & 1) == 0)
  {
    v17 = *(void **)(v0 + 48);
    sub_2459D2480(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
    v14 = v17;
    sub_2459D96A4();
    v18 = OUTLINED_FUNCTION_15_2();
    if (!OUTLINED_FUNCTION_12(v18))
    {
      v16 = 1;
      goto LABEL_20;
    }
LABEL_18:
    v19 = (_WORD *)OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_35(v19);
    OUTLINED_FUNCTION_11(&dword_2459B6000, v20, v21, "SafariSummarizationPrefetch - Finish loading the url path filter data");
    OUTLINED_FUNCTION_2();
  }
  v9 = *(void **)(v0 + 48);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_42();
  sub_2459D96A4();
  v10 = OUTLINED_FUNCTION_15_2();
  if (OUTLINED_FUNCTION_12(v10))
  {
    v11 = (_WORD *)OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_35(v11);
    OUTLINED_FUNCTION_11(&dword_2459B6000, v12, v13, "SafariSummarizationPrefetch - Task cancelled, skip updating urlRedactPatterns");
    OUTLINED_FUNCTION_2();
  }

LABEL_15:
  v14 = *(void **)(v0 + 48);
  sub_2459D96A4();
  v15 = OUTLINED_FUNCTION_15_2();
  if (OUTLINED_FUNCTION_12(v15))
    goto LABEL_18;
  v16 = 0;
LABEL_20:

  OUTLINED_FUNCTION_157();
  sub_2459D2248(0);
  OUTLINED_FUNCTION_24_2();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v16);
}

uint64_t sub_2459D2A84()
{
  uint64_t v0;
  void *v1;
  os_log_type_t v2;
  _WORD *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(void **)(v0 + 48);
  sub_2459D96A4();
  v2 = OUTLINED_FUNCTION_15_2();
  if (OUTLINED_FUNCTION_12(v2))
  {
    v3 = (_WORD *)OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_35(v3);
    OUTLINED_FUNCTION_11(&dword_2459B6000, v4, v5, "SafariSummarizationPrefetch - Finish loading the url path filter data");
    OUTLINED_FUNCTION_2();
  }

  OUTLINED_FUNCTION_157();
  sub_2459D2248(0);
  OUTLINED_FUNCTION_24_2();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_2459D2B18()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1[30] = v0;
  v2 = sub_2459D93BC();
  v1[31] = v2;
  v1[32] = *(_QWORD *)(v2 - 8);
  v1[33] = OUTLINED_FUNCTION_26_0();
  v3 = sub_2459D9758();
  v1[34] = v3;
  v1[35] = *(_QWORD *)(v3 - 8);
  v1[36] = OUTLINED_FUNCTION_26_0();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574DA230);
  v1[37] = v4;
  v1[38] = *(_QWORD *)(v4 - 8);
  v1[39] = OUTLINED_FUNCTION_26_0();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574DA238);
  v1[40] = v5;
  v1[41] = *(_QWORD *)(v5 - 8);
  v1[42] = OUTLINED_FUNCTION_26_0();
  v6 = OUTLINED_FUNCTION_100_0();
  v1[43] = v6;
  v1[44] = *(_QWORD *)(v6 - 8);
  v1[45] = OUTLINED_FUNCTION_12_1();
  v1[46] = OUTLINED_FUNCTION_12_1();
  v1[47] = OUTLINED_FUNCTION_12_1();
  v1[48] = OUTLINED_FUNCTION_12_1();
  v7 = sub_2459D9608();
  v1[49] = v7;
  v1[50] = *(_QWORD *)(v7 - 8);
  v1[51] = OUTLINED_FUNCTION_26_0();
  sub_2459D9650();
  v1[52] = OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_26();
  return OUTLINED_FUNCTION_3();
}

uint64_t sub_2459D2C28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  os_log_type_t v18;
  uint8_t *v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  os_log_type_t v28;
  char v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(NSObject *, uint64_t, uint64_t);
  os_log_type_t v37;
  _BOOL4 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint8_t *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(_QWORD, _QWORD);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _BYTE *v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63[2];

  v2 = v0 + 240;
  v1 = *(_QWORD *)(v0 + 240);
  v3 = *(_QWORD *)(v0 + 416);
  v4 = *(_QWORD **)(v1 + 104);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 400) + 104))(*(_QWORD *)(v0 + 408), *MEMORY[0x24BE712E0], *(_QWORD *)(v0 + 392));
  swift_retain();
  sub_2459D965C();
  OUTLINED_FUNCTION_134_0();
  OUTLINED_FUNCTION_156();
  v5 = OUTLINED_FUNCTION_41_1(v4, 30, v3);
  v6 = v5;
  *(_QWORD *)(v0 + 424) = v5;
  if ((*(_BYTE *)(v1 + 128) & 1) == 0)
    *(_BYTE *)(v5 + qword_2574D9C88) = 1;
  v7 = *(_QWORD **)v2;
  v8 = *(_QWORD *)(*(_QWORD *)v2 + 40);
  if (!v8)
  {
    if (qword_2574D8AE8 != -1)
      swift_once();
    v17 = OUTLINED_FUNCTION_24();
    __swift_project_value_buffer(v17, (uint64_t)qword_2574DA518);
    OUTLINED_FUNCTION_37_0();
    v18 = OUTLINED_FUNCTION_15_2();
    if (OUTLINED_FUNCTION_60(0))
    {
      v19 = (uint8_t *)OUTLINED_FUNCTION_8();
      *(_WORD *)v19 = 0;
      OUTLINED_FUNCTION_7_4(&dword_2459B6000, 0, v18, "SafariSummarizationPrefetch - AssetProvider or CountryCode are nil, return empty UrlRedactMap", v19);
      OUTLINED_FUNCTION_2();
    }

    OUTLINED_FUNCTION_59_0(qword_2574D9C80);
    goto LABEL_12;
  }
  v9 = v7[4];
  v10 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v7[14];
  v11 = v7[6];
  v12 = v7[7];
  swift_retain();
  v10(v9, v8, v11, v12);
  OUTLINED_FUNCTION_125_0();
  if (!*(_QWORD *)(v0 + 80))
  {
    sub_2459C9134(v0 + 56, &qword_2574D8DC8);
LABEL_12:
    sub_2459D8384();
    OUTLINED_FUNCTION_10_1();
    *v20 = 0;
    OUTLINED_FUNCTION_57_0();
    OUTLINED_FUNCTION_30_1();
LABEL_30:
    OUTLINED_FUNCTION_78_0();
    swift_task_dealloc();
    OUTLINED_FUNCTION_64();
    OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_66();
    OUTLINED_FUNCTION_65();
    OUTLINED_FUNCTION_155();
    OUTLINED_FUNCTION_169();
    OUTLINED_FUNCTION_124();
    OUTLINED_FUNCTION_174();
    OUTLINED_FUNCTION_70();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v13 = *(NSObject **)(v0 + 376);
  v14 = *(_QWORD *)(v0 + 240);
  sub_2459B9DDC((__int128 *)(v0 + 56), v0 + 16);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v14 + 64), *(_QWORD *)(v14 + 88));
  v15 = sub_2459C3C30(v13, v0 + 16, v6);
  *(_QWORD *)(v0 + 432) = v15;
  *(_QWORD *)(v0 + 440) = v16;
  v21 = v15;
  v22 = v16;
  v61 = (_QWORD *)v0;
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 352) + 32))(*(_QWORD *)(v0 + 384), *(_QWORD *)(v0 + 376), *(_QWORD *)(v0 + 344));
  v23 = sub_2459D2438();
  if (!v24)
    goto LABEL_19;
  v26 = v23;
  v27 = v24;
  v28 = v25;
  swift_bridgeObjectRetain();
  sub_2459C91DC(v26, v27);
  if (v21 == v26 && v27 == v22)
  {
    OUTLINED_FUNCTION_17_0();
    goto LABEL_24;
  }
  v30 = OUTLINED_FUNCTION_122_0();
  OUTLINED_FUNCTION_17_0();
  if ((v30 & 1) != 0)
  {
LABEL_24:
    if (qword_2574D8AE8 != -1)
      swift_once();
    v45 = OUTLINED_FUNCTION_24();
    v46 = __swift_project_value_buffer(v45, (uint64_t)qword_2574DA518);
    OUTLINED_FUNCTION_170();
    sub_2459D96A4();
    v47 = OUTLINED_FUNCTION_15_2();
    if (OUTLINED_FUNCTION_92_0(v47))
    {
      v48 = (uint8_t *)OUTLINED_FUNCTION_8();
      v49 = OUTLINED_FUNCTION_8();
      *(_DWORD *)v48 = 136315138;
      v63[0] = v49;
      OUTLINED_FUNCTION_170();
      *(_QWORD *)(v0 + 232) = OUTLINED_FUNCTION_71(v21, v50, v63);
      sub_2459D9950();
      OUTLINED_FUNCTION_42_1();
      OUTLINED_FUNCTION_29_2(&dword_2459B6000, v46, v28, "SafariSummarizationPrefetch - Skip processing for Url Path Filter, already loaded hash %s", v48);
      OUTLINED_FUNCTION_33_0();
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_16_0();

    v57 = *(_QWORD *)(v0 + 384);
    v59 = *(_QWORD *)(v0 + 344);
    v58 = *(_QWORD *)(v0 + 352);
    OUTLINED_FUNCTION_59_0(qword_2574D9C80);
    sub_2459D8384();
    OUTLINED_FUNCTION_10_1();
    *v60 = 2;
    OUTLINED_FUNCTION_57_0();
    OUTLINED_FUNCTION_30_1();
    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v57, v59);
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    goto LABEL_30;
  }
LABEL_19:
  if (qword_2574D8AE8 != -1)
    swift_once();
  v31 = *(_QWORD *)(v0 + 384);
  v32 = *(NSObject **)(v0 + 368);
  v34 = *(_QWORD *)(v0 + 344);
  v33 = *(_QWORD *)(v0 + 352);
  v35 = OUTLINED_FUNCTION_24();
  v61[56] = __swift_project_value_buffer(v35, (uint64_t)qword_2574DA518);
  v36 = *(void (**)(NSObject *, uint64_t, uint64_t))(v33 + 16);
  v61[57] = v36;
  v36(v32, v31, v34);
  sub_2459D96A4();
  v37 = OUTLINED_FUNCTION_39_1();
  v38 = OUTLINED_FUNCTION_28_1(v37);
  v39 = v61[46];
  v40 = v61[44];
  if (v38)
  {
    v41 = (uint64_t *)(v2 - 16);
    v62 = v61[43];
    v42 = (uint8_t *)OUTLINED_FUNCTION_8();
    v63[0] = OUTLINED_FUNCTION_8();
    *(_DWORD *)v42 = 136642819;
    v43 = OUTLINED_FUNCTION_128_0();
    *v41 = sub_2459D6FF4(v43, v44, v63);
    sub_2459D9950();
    OUTLINED_FUNCTION_68();
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v39, v62);
    OUTLINED_FUNCTION_29_2(&dword_2459B6000, v32, (os_log_type_t)v34, "SafariSummarizationPrefetch - Scanning url path filter jsonl file at path: %{sensitive}s", v42);
    OUTLINED_FUNCTION_33_0();
    OUTLINED_FUNCTION_2();
  }
  v51 = *(void (**)(_QWORD, _QWORD))(v40 + 8);
  v51(v61[46], v61[43]);

  v61[58] = v51;
  v52 = v61[38];
  v53 = v61[39];
  v54 = v61[37];
  v61[59] = __swift_instantiateConcreteTypeFromMangledName(&qword_2574DA248);
  v61[23] = sub_2459D96F8();
  sub_2459D950C();
  sub_2459D94A0();
  (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v53, v54);
  v61[60] = sub_2459D83C0();
  v55 = (_QWORD *)swift_task_alloc();
  v61[61] = v55;
  *v55 = v61;
  v55[1] = sub_2459D3410;
  return sub_2459D9878();
}

uint64_t sub_2459D3410()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_118();
  OUTLINED_FUNCTION_35_2(v2);
  if (v1)
  {
    *(_QWORD *)(v0 + 520) = v1;
  }
  else
  {
    *(_DWORD *)(v0 + 544) = *MEMORY[0x24BDCB1A0];
    *(_BYTE *)(v0 + 548) = 0;
    *(_QWORD *)(v0 + 496) = 0;
  }
  OUTLINED_FUNCTION_26();
  return OUTLINED_FUNCTION_21();
}

uint64_t sub_2459D3474()
{
  uint64_t v0;

  *(_OWORD *)(v0 + 504) = *(_OWORD *)(v0 + 144);
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_2459D348C()
{
  uint64_t v0;
  _QWORD *v1;
  NSObject *v2;
  _WORD *v3;
  uint64_t v4;
  void *v5;
  _BYTE *v6;
  NSObject *v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  os_log_type_t v31;
  _WORD *v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  void (*v37)(uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  void (*v41)(uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t, uint64_t);
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  _QWORD *v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  unint64_t v72;
  char v73;
  unint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  BOOL v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  char v84;
  unint64_t v85;
  char v86;
  unint64_t v87;
  char v88;
  _QWORD *v89;
  uint64_t result;
  _QWORD *v91;
  uint64_t v92;
  _QWORD *v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD *v96;
  _QWORD *v97;
  os_log_type_t v98;
  _QWORD *v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  _QWORD *v103;
  uint64_t v104[2];

  v1 = (_QWORD *)(v0 + 184);
  if (!*(_QWORD *)(v0 + 512))
  {
    v20 = *(NSObject **)(v0 + 448);
    OUTLINED_FUNCTION_129_0(*(_QWORD *)(v0 + 328));
    v21 = *(_QWORD *)(v0 + 184);
    OUTLINED_FUNCTION_35_1();
    sub_2459D96A4();
    v22 = OUTLINED_FUNCTION_15_2();
    if (OUTLINED_FUNCTION_60(v20))
    {
      v23 = (uint8_t *)OUTLINED_FUNCTION_8();
      *(_DWORD *)v23 = 134217984;
      *(_QWORD *)(v0 + 192) = *(_QWORD *)(v21 + 16);
      sub_2459D9950();
      OUTLINED_FUNCTION_41_0();
      OUTLINED_FUNCTION_29_2(&dword_2459B6000, v20, v22, "SafariSummarizationPrefetch - Made UrlRedactMap with %ld entries", v23);
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_41_0();

    v36 = 78;
    switch(*(_BYTE *)(v0 + 548))
    {
      case 0:
        goto LABEL_17;
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 0x10:
      case 0x11:
      case 0x12:
      case 0x13:
      case 0x14:
      case 0x15:
      case 0x16:
      case 0x17:
        v36 = *(_BYTE *)(v0 + 548);
LABEL_17:
        v37 = *(void (**)(uint64_t, uint64_t))(v0 + 464);
        v38 = *(_QWORD *)(v0 + 384);
        v39 = *(_QWORD *)(v0 + 344);
        *(_BYTE *)(*(_QWORD *)(v0 + 424) + qword_2574D9C80) = v36;
        sub_2459D0864();
        OUTLINED_FUNCTION_24_2();
        v37(v38, v39);
        __swift_destroy_boxed_opaque_existential_1(v0 + 16);
        OUTLINED_FUNCTION_130_0();
        OUTLINED_FUNCTION_155();
        OUTLINED_FUNCTION_169();
        OUTLINED_FUNCTION_124();
        OUTLINED_FUNCTION_174();
        OUTLINED_FUNCTION_64();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        OUTLINED_FUNCTION_46_0();
        __asm { BR              X3 }
        return result;
      case 8:
      case 9:
      case 0xA:
      case 0xB:
      case 0xC:
      case 0xD:
      case 0xE:
      case 0xF:
        goto LABEL_54;
      default:
        __asm { BR              X11 }
        return result;
    }
    goto LABEL_54;
  }
  if ((sub_2459D98A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_14_0();
    OUTLINED_FUNCTION_42();
    *(_QWORD *)(v0 + 184) = sub_2459D96F8();
    swift_bridgeObjectRelease();
    v2 = sub_2459D96A4();
    sub_2459D98D8();
    if (OUTLINED_FUNCTION_20_1(v2))
    {
      v3 = (_WORD *)OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_35(v3);
      OUTLINED_FUNCTION_3_7(&dword_2459B6000, v2, v4, "SafariSummarizationPrefetch - Task cancelled, exit scanning path filter json file");
      OUTLINED_FUNCTION_2();
    }

    OUTLINED_FUNCTION_81(qword_2574D9C80);
    sub_2459D8384();
    v5 = (void *)OUTLINED_FUNCTION_10_1();
    *v6 = 3;
    swift_willThrow();
    v7 = *(NSObject **)(v0 + 472);
    v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 456);
    v9 = *(_QWORD *)(v0 + 384);
    v10 = *(_QWORD *)(v0 + 360);
    v11 = *(_QWORD *)(v0 + 344);
    OUTLINED_FUNCTION_129_0(*(_QWORD *)(v0 + 328));
    *(_QWORD *)(v0 + 184) = sub_2459D96F8();
    swift_bridgeObjectRelease();
    v8(v10, v9, v11);
    v12 = v5;
    v13 = v5;
    sub_2459D96A4();
    v14 = OUTLINED_FUNCTION_96();
    if (OUTLINED_FUNCTION_60(v7))
    {
      v15 = OUTLINED_FUNCTION_8();
      v99 = (_QWORD *)OUTLINED_FUNCTION_8();
      v104[0] = OUTLINED_FUNCTION_8();
      *(_DWORD *)v15 = 136643075;
      v16 = OUTLINED_FUNCTION_128_0();
      v98 = v14;
      *(_QWORD *)(v0 + 168) = sub_2459D6FF4(v16, v17, v104);
      sub_2459D9950();
      OUTLINED_FUNCTION_42();
      OUTLINED_FUNCTION_118_0();
      *(_WORD *)(v15 + 12) = 2112;
      v18 = v5;
      v19 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v0 + 176) = v19;
      OUTLINED_FUNCTION_18();
      *v99 = v19;
      OUTLINED_FUNCTION_93_0();
      OUTLINED_FUNCTION_93_0();
      OUTLINED_FUNCTION_82(&dword_2459B6000, v7, v98, "SafariSummarizationPrefetch - Failed while scanning url path filter jsonl file at path: %{sensitive}s, with error: %@", (uint8_t *)v15);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2574D93E8);
      OUTLINED_FUNCTION_33_0();
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_118_0();
    OUTLINED_FUNCTION_93_0();
    OUTLINED_FUNCTION_93_0();

    v41 = *(void (**)(uint64_t, uint64_t))(v0 + 464);
    v42 = *(_QWORD *)(v0 + 384);
    v43 = *(_QWORD *)(v0 + 344);
    OUTLINED_FUNCTION_81(qword_2574D9C80);
    swift_willThrow();
    OUTLINED_FUNCTION_24_2();
    v41(v42, v43);
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    OUTLINED_FUNCTION_78_0();
    swift_task_dealloc();
    OUTLINED_FUNCTION_70();
    OUTLINED_FUNCTION_64();
    OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_66();
    OUTLINED_FUNCTION_155();
    OUTLINED_FUNCTION_169();
    OUTLINED_FUNCTION_124();
    OUTLINED_FUNCTION_174();
    OUTLINED_FUNCTION_65();
    OUTLINED_FUNCTION_46_0();
    __asm { BR              X0 }
  }
  v25 = *(_QWORD *)(v0 + 280);
  v24 = *(_QWORD *)(v0 + 288);
  v26 = *(_QWORD *)(v0 + 272);
  sub_2459D974C();
  v27 = sub_2459D9734();
  v29 = v28;
  OUTLINED_FUNCTION_42();
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
  if (v29 >> 60 == 15)
  {
    v30 = *(void **)(v0 + 448);
    sub_2459D96A4();
    v31 = OUTLINED_FUNCTION_38();
    if (OUTLINED_FUNCTION_12(v31))
    {
      v32 = (_WORD *)OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_35(v32);
      OUTLINED_FUNCTION_11(&dword_2459B6000, v33, v34, "SafariSummarizationPrefetch - Failed to scan line in path filter jsonl file");
      OUTLINED_FUNCTION_2();
    }

    v35 = 86;
LABEL_42:
    *(_BYTE *)(v0 + 549) = v35;
    v89 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 536) = v89;
    OUTLINED_FUNCTION_102_0(v89);
LABEL_43:
    OUTLINED_FUNCTION_46_0();
    return sub_2459D9878();
  }
  v45 = *(void **)(v0 + 496);
  v46 = *(unsigned int *)(v0 + 544);
  v48 = *(_QWORD *)(v0 + 256);
  v47 = *(_QWORD *)(v0 + 264);
  v101 = v27;
  v102 = v29;
  v49 = *(_QWORD *)(v0 + 248);
  sub_2459D93EC();
  OUTLINED_FUNCTION_156();
  sub_2459D93E0();
  v50 = *(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 104);
  v51 = v101;
  v50(v47, v46, v49);
  sub_2459D93C8();
  sub_2459D8404();
  sub_2459D93D4();
  if (v45)
  {
    v52 = *(NSObject **)(v0 + 448);
    OUTLINED_FUNCTION_30_1();
    OUTLINED_FUNCTION_132_0();
    OUTLINED_FUNCTION_132_0();
    sub_2459D96A4();
    v53 = OUTLINED_FUNCTION_38();
    if (OUTLINED_FUNCTION_92_0(v53))
    {
      v54 = OUTLINED_FUNCTION_8();
      v55 = (_QWORD *)OUTLINED_FUNCTION_8();
      v104[0] = OUTLINED_FUNCTION_8();
      *(_DWORD *)v54 = 136643075;
      sub_2459D974C();
      v56 = sub_2459D9740();
      if (v57)
      {
        v58 = v57;
      }
      else
      {
        v56 = 0;
        v58 = 0xE000000000000000;
      }
      *(_QWORD *)(v54 + 4) = sub_2459D6FF4(v56, v58, v104);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_94_0();
      *(_WORD *)(v54 + 12) = 2112;
      v59 = v45;
      v60 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v54 + 14) = v60;
      *v55 = v60;
      OUTLINED_FUNCTION_43_1();
      OUTLINED_FUNCTION_43_1();
      OUTLINED_FUNCTION_82(&dword_2459B6000, v52, (os_log_type_t)(v0 - 112), "SafariSummarizationPrefetch - Failed to deserialize scanned json line %{sensitive}s, with error: %@. Skipping this line", (uint8_t *)v54);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2574D93E8);
      OUTLINED_FUNCTION_33_0();
      OUTLINED_FUNCTION_2();
    }
    sub_2459BDE48(v101, v102);
    OUTLINED_FUNCTION_43_1();
    OUTLINED_FUNCTION_94_0();
    OUTLINED_FUNCTION_43_1();
    OUTLINED_FUNCTION_43_1();

    v35 = 87;
    goto LABEL_42;
  }
  v100 = *(_QWORD *)(v0 + 96);
  v61 = *(_QWORD *)(v0 + 112);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9A68);
  v62 = sub_2459D96F8();
  v63 = (_QWORD *)v0;
  v64 = (_QWORD *)v62;
  v65 = *(_QWORD *)(v61 + 16);
  v97 = v63;
  if (!v65)
    goto LABEL_37;
  v103 = v1;
  v66 = v63 + 26;
  OUTLINED_FUNCTION_159();
  v67 = (uint64_t *)(v61 + 40);
  do
  {
    v68 = *(v67 - 1);
    v69 = *v67;
    OUTLINED_FUNCTION_54();
    swift_isUniquelyReferenced_nonNull_native();
    *v66 = v64;
    v70 = sub_2459D77FC(v68);
    if (__OFADD__(v64[2], (v71 & 1) == 0))
    {
      __break(1u);
LABEL_52:
      __break(1u);
LABEL_53:
      __break(1u);
      goto LABEL_54;
    }
    v72 = v70;
    v73 = v71;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574DA260);
    if ((sub_2459D99EC() & 1) != 0)
    {
      v74 = sub_2459D77FC(v68);
      if ((v73 & 1) != (v75 & 1))
        goto LABEL_44;
      v72 = v74;
    }
    v64 = (_QWORD *)*v66;
    if ((v73 & 1) != 0)
    {
      v76 = v64[7];
      swift_bridgeObjectRelease();
      *(_QWORD *)(v76 + 8 * v72) = v69;
    }
    else
    {
      v64[(v72 >> 6) + 8] |= 1 << v72;
      *(_QWORD *)(v64[6] + 8 * v72) = v68;
      *(_QWORD *)(v64[7] + 8 * v72) = v69;
      v77 = v64[2];
      v78 = __OFADD__(v77, 1);
      v79 = v77 + 1;
      if (v78)
        goto LABEL_52;
      v64[2] = v79;
    }
    swift_bridgeObjectRelease();
    v67 += 2;
    --v65;
  }
  while (v65);
  swift_bridgeObjectRelease();
  v1 = v103;
  v51 = v101;
LABEL_37:
  v80 = swift_bridgeObjectRetain();
  v81 = *v1;
  v82 = v80;
  swift_isUniquelyReferenced_nonNull_native();
  v97[27] = v81;
  v83 = OUTLINED_FUNCTION_101_0();
  if (__OFADD__(*(_QWORD *)(v81 + 16), (v84 & 1) == 0))
    goto LABEL_53;
  v85 = v83;
  v86 = v84;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574DA268);
  if ((sub_2459D99EC() & 1) == 0)
  {
LABEL_46:
    v91 = (_QWORD *)v97[27];
    if ((v86 & 1) != 0)
    {
      v92 = v91[7];
      swift_bridgeObjectRelease();
      *(_QWORD *)(v92 + 8 * v85) = v64;
LABEL_50:
      v97[23] = v91;
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_8_4();
      swift_release();
      sub_2459BDE48(v51, v102);
      OUTLINED_FUNCTION_8_4();
      swift_bridgeObjectRelease();
      v96 = (_QWORD *)swift_task_alloc();
      v97[66] = v96;
      OUTLINED_FUNCTION_102_0(v96);
      goto LABEL_43;
    }
    v91[(v85 >> 6) + 8] |= 1 << v85;
    v93 = (_QWORD *)(v91[6] + 16 * v85);
    *v93 = v100;
    v93[1] = v82;
    *(_QWORD *)(v91[7] + 8 * v85) = v64;
    v94 = v91[2];
    v78 = __OFADD__(v94, 1);
    v95 = v94 + 1;
    if (!v78)
    {
      v91[2] = v95;
      OUTLINED_FUNCTION_54();
      goto LABEL_50;
    }
LABEL_54:
    __break(1u);
    JUMPOUT(0x2459D3F88);
  }
  v87 = OUTLINED_FUNCTION_101_0();
  if ((v86 & 1) == (v88 & 1))
  {
    v85 = v87;
    goto LABEL_46;
  }
LABEL_44:
  OUTLINED_FUNCTION_46_0();
  return sub_2459D9ADC();
}

uint64_t sub_2459D4048()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 160) = *(_QWORD *)(v0 + 520);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9470);
  swift_willThrowTypedImpl();
  OUTLINED_FUNCTION_17_0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_26();
  return OUTLINED_FUNCTION_21();
}

uint64_t sub_2459D40AC()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  _QWORD *v18;
  uint64_t v19;

  v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 456);
  v2 = *(_QWORD *)(v0 + 384);
  v3 = *(_QWORD *)(v0 + 360);
  v4 = *(_QWORD *)(v0 + 344);
  OUTLINED_FUNCTION_129_0(*(_QWORD *)(v0 + 328));
  *(_QWORD *)(v0 + 184) = sub_2459D96F8();
  swift_bridgeObjectRelease();
  v1(v3, v2, v4);
  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_105();
  v5 = sub_2459D96A4();
  v6 = sub_2459D98D8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = *(_QWORD *)(v0 + 360);
    v16 = *(_QWORD *)(v0 + 344);
    v17 = *(void (**)(uint64_t, uint64_t))(v0 + 464);
    v8 = OUTLINED_FUNCTION_8();
    v18 = (_QWORD *)OUTLINED_FUNCTION_8();
    v19 = OUTLINED_FUNCTION_8();
    *(_DWORD *)v8 = 136643075;
    v9 = OUTLINED_FUNCTION_128_0();
    *(_QWORD *)(v0 + 168) = sub_2459D6FF4(v9, v10, &v19);
    sub_2459D9950();
    swift_bridgeObjectRelease();
    v17(v7, v16);
    *(_WORD *)(v8 + 12) = 2112;
    OUTLINED_FUNCTION_105();
    v11 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 176) = v11;
    OUTLINED_FUNCTION_18();
    *v18 = v11;
    OUTLINED_FUNCTION_72();
    OUTLINED_FUNCTION_72();
    OUTLINED_FUNCTION_82(&dword_2459B6000, v5, v6, "SafariSummarizationPrefetch - Failed while scanning url path filter jsonl file at path: %{sensitive}s, with error: %@", (uint8_t *)v8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574D93E8);
    OUTLINED_FUNCTION_33_0();
    OUTLINED_FUNCTION_2();
  }
  (*(void (**)(_QWORD, _QWORD))(v0 + 464))(*(_QWORD *)(v0 + 360), *(_QWORD *)(v0 + 344));
  OUTLINED_FUNCTION_72();
  OUTLINED_FUNCTION_72();

  v12 = *(void (**)(uint64_t, uint64_t))(v0 + 464);
  v13 = *(_QWORD *)(v0 + 384);
  v14 = *(_QWORD *)(v0 + 344);
  OUTLINED_FUNCTION_81(qword_2574D9C80);
  swift_willThrow();
  OUTLINED_FUNCTION_24_2();
  v12(v13, v14);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  OUTLINED_FUNCTION_78_0();
  swift_task_dealloc();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_155();
  OUTLINED_FUNCTION_169();
  OUTLINED_FUNCTION_124();
  OUTLINED_FUNCTION_174();
  OUTLINED_FUNCTION_64();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2459D4350()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_118();
  OUTLINED_FUNCTION_35_2(v2);
  if (v1)
    *(_QWORD *)(v0 + 520) = v1;
  else
    *(_QWORD *)(v0 + 496) = 0;
  OUTLINED_FUNCTION_26();
  return OUTLINED_FUNCTION_21();
}

uint64_t sub_2459D43A0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_118();
  OUTLINED_FUNCTION_35_2(v2);
  if (v1)
  {
    *(_QWORD *)(v0 + 520) = v1;
  }
  else
  {
    *(_BYTE *)(v0 + 548) = *(_BYTE *)(v0 + 549);
    *(_QWORD *)(v0 + 496) = 0;
  }
  OUTLINED_FUNCTION_26();
  return OUTLINED_FUNCTION_21();
}

char *sub_2459D43F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, char *, uint64_t);
  uint64_t v46;
  double v47;
  double v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  os_log_type_t v52;
  uint8_t *v53;
  void (*v54)(uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(__int128 *__return_ptr, uint64_t, NSObject *, uint64_t, uint64_t);
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  os_log_type_t v89;
  uint8_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint8_t *v93;
  uint64_t v94;
  os_log_type_t v95;
  NSObject *v96;
  os_log_type_t v97;
  uint8_t *v98;
  uint64_t v99;
  char *v100;
  char *v101;
  void (*v102)(uint64_t, uint64_t);
  os_log_type_t v103;
  _BOOL4 v104;
  uint64_t v105;
  _WORD *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t isa;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  NSObject *v123;
  __int128 v124[2];
  __int128 v125;
  uint8_t *v126;
  uint64_t v127;
  uint64_t v128[5];

  v123 = OUTLINED_FUNCTION_24();
  isa = (uint64_t)v123[-1].isa;
  OUTLINED_FUNCTION_32_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_77_0(v7);
  v113 = sub_2459D9608();
  v111 = *(_QWORD *)(v113 - 8);
  OUTLINED_FUNCTION_32_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_77_0(v9);
  sub_2459D9650();
  OUTLINED_FUNCTION_11_3();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_56();
  v114 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D8E00);
  OUTLINED_FUNCTION_11_3();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_77_0(v13);
  v110 = sub_2459D95D8();
  v14 = *(_QWORD *)(v110 - 8);
  MEMORY[0x24BDAC7A8](v110);
  OUTLINED_FUNCTION_33_2();
  v17 = v16 - v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D8DD0);
  OUTLINED_FUNCTION_11_3();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_57();
  v119 = v19;
  OUTLINED_FUNCTION_55();
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v107 - v21;
  v23 = OUTLINED_FUNCTION_135();
  v120 = *(_QWORD *)(v23 - 8);
  OUTLINED_FUNCTION_32_0();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_56();
  v121 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D93E0);
  OUTLINED_FUNCTION_11_3();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_58_0();
  v27 = sub_2459D9530();
  v28 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_6_2();
  v115 = a1;
  v122 = a2;
  sub_2459D9518();
  if (__swift_getEnumTagSinglePayload(v3, 1, v27) == 1)
  {
    sub_2459C9134(v3, &qword_2574D93E0);
    if (qword_2574D8AE8 != -1)
      swift_once();
    __swift_project_value_buffer((uint64_t)v123, (uint64_t)qword_2574DA518);
    OUTLINED_FUNCTION_113();
    sub_2459D96A4();
    v29 = OUTLINED_FUNCTION_96();
    if (OUTLINED_FUNCTION_21_1(v29))
    {
      v30 = (uint8_t *)OUTLINED_FUNCTION_8();
      v128[0] = OUTLINED_FUNCTION_8();
      *(_DWORD *)v30 = 136642819;
      OUTLINED_FUNCTION_170();
      v32 = OUTLINED_FUNCTION_71(v115, v31, v128);
      OUTLINED_FUNCTION_131_0(v32);
      sub_2459D9950();
      OUTLINED_FUNCTION_42_1();
      OUTLINED_FUNCTION_29_2(&dword_2459B6000, v14, (os_log_type_t)v2, "SafariSummarizationPrefetch - Invalid URL (%{sensitive}s) found", v30);
      OUTLINED_FUNCTION_33_0();
      OUTLINED_FUNCTION_2();
    }

    OUTLINED_FUNCTION_16_0();
    return 0;
  }
  v108 = v28;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 32))(v2, v3, v27);
  sub_2459D944C();
  v33 = v27;
  if (__swift_getEnumTagSinglePayload((uint64_t)v22, 1, v23) == 1)
  {
    sub_2459C9134((uint64_t)v22, &qword_2574D8DD0);
    v34 = v119;
    OUTLINED_FUNCTION_127_0(v119, 1);
    OUTLINED_FUNCTION_126_0(v2, v34);
    OUTLINED_FUNCTION_91_0();
    sub_2459C9134(v34, &qword_2574D8DD0);
    if (qword_2574D8AE8 != -1)
      swift_once();
    v35 = (uint64_t)v123;
    v36 = __swift_project_value_buffer((uint64_t)v123, (uint64_t)qword_2574DA518);
    v37 = isa;
    v38 = v117;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(isa + 16))(v117, v36, v35);
    OUTLINED_FUNCTION_113();
    v39 = sub_2459D96A4();
    v40 = sub_2459D98CC();
    if (OUTLINED_FUNCTION_28_1(v40))
    {
      v41 = (uint8_t *)OUTLINED_FUNCTION_8();
      v128[0] = OUTLINED_FUNCTION_8();
      *(_DWORD *)v41 = 136642819;
      v121 = v2;
      v122 = v33;
      v42 = OUTLINED_FUNCTION_170();
      v44 = OUTLINED_FUNCTION_54_0(v42, v43, v128);
      OUTLINED_FUNCTION_131_0(v44);
      sub_2459D9950();
      OUTLINED_FUNCTION_16_0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_29_2(&dword_2459B6000, v39, (os_log_type_t)a2, "SafariSummarizationPrefetch - Url unredacted due to no matching url pattern with query items, return original url: %{sensitive}s", v41);
      OUTLINED_FUNCTION_33_0();
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_16_0();

    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v38, v35);
    goto LABEL_20;
  }
  v45 = *(void (**)(uint64_t, char *, uint64_t))(v120 + 32);
  isa = v23;
  v45(v121, v22, v23);
  v46 = v116;
  if ((sub_2459D23DC() & 1) == 0)
  {
    sub_2459D95CC();
    sub_2459D95B4();
    v48 = v47;
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v17, v110);
    if (v48 < *(double *)(v46 + 144))
    {
      v49 = v2;
      v50 = v123;
      if (qword_2574D8AE8 != -1)
        swift_once();
      v51 = __swift_project_value_buffer((uint64_t)v50, (uint64_t)qword_2574DA518);
      swift_retain();
      sub_2459D96A4();
      v52 = OUTLINED_FUNCTION_39_1();
      if (OUTLINED_FUNCTION_120(v52))
      {
        v53 = (uint8_t *)OUTLINED_FUNCTION_8();
        *(_DWORD *)v53 = 134217984;
        v128[0] = *(_QWORD *)(v46 + 144);
        sub_2459D9950();
        OUTLINED_FUNCTION_150();
        OUTLINED_FUNCTION_29_2(&dword_2459B6000, v50, (os_log_type_t)v51, "SafariSummarizationPrefetch - Skipping, assets unavailable. Consider request eligible. Next check at %f", v53);
        OUTLINED_FUNCTION_2();
      }

      OUTLINED_FUNCTION_150();
      v86 = v108;
      v87 = v120;
      OUTLINED_FUNCTION_31_1(*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v120 + 16));
      OUTLINED_FUNCTION_64_0();
      OUTLINED_FUNCTION_67_0(v49, v46);
      OUTLINED_FUNCTION_91_0();
      sub_2459C9134(v46, &qword_2574D8DD0);
      (*(void (**)(uint64_t, uint64_t))(v87 + 8))(v27, v51);
      v54 = *(void (**)(uint64_t, uint64_t))(v86 + 8);
      v55 = v49;
      goto LABEL_34;
    }
    v56 = MEMORY[0x2495409D8](v46 + 16);
    if (!v56)
    {
      v92 = v120;
      OUTLINED_FUNCTION_31_1(*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v120 + 16));
      OUTLINED_FUNCTION_64_0();
      OUTLINED_FUNCTION_67_0(v2, v46);
      OUTLINED_FUNCTION_91_0();
      sub_2459C9134(v46, &qword_2574D8DD0);
      (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v27, v17);
LABEL_20:
      OUTLINED_FUNCTION_123_0();
      v55 = v2;
LABEL_34:
      v54(v55, v33);
      return v22;
    }
    v57 = v56;
    v58 = *(_QWORD *)(v46 + 24);
    v59 = sub_2459D9890();
    v60 = v109;
    __swift_storeEnumTagSinglePayload(v109, 1, 1, v59);
    v61 = OUTLINED_FUNCTION_3_0();
    swift_weakInit();
    v62 = (_QWORD *)OUTLINED_FUNCTION_3_0();
    v62[2] = 0;
    v62[3] = 0;
    v62[4] = v61;
    v62[5] = v57;
    v62[6] = v58;
    swift_unknownObjectRetain();
    v63 = sub_2459D229C(v60, (uint64_t)&unk_2574DA218, (uint64_t)v62);
    sub_2459D24F0(v63);
    swift_unknownObjectRelease();
  }
  v64 = *(_QWORD **)(v46 + 104);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v111 + 104))(v112, *MEMORY[0x24BE712E0], v113);
  OUTLINED_FUNCTION_157();
  v65 = v114;
  sub_2459D965C();
  OUTLINED_FUNCTION_134_0();
  OUTLINED_FUNCTION_156();
  v66 = OUTLINED_FUNCTION_41_1(v64, 31, v65);
  v67 = v66;
  if ((*(_BYTE *)(v46 + 128) & 1) == 0)
    *(_BYTE *)(v66 + qword_2574D9C88) = 1;
  v68 = *(NSObject **)(v46 + 40);
  v69 = v2;
  if (!v68)
  {
    OUTLINED_FUNCTION_70_0(qword_2574D9C80);
    v83 = v120;
    v84 = v119;
    OUTLINED_FUNCTION_52_0(v119, *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v120 + 16));
    __swift_storeEnumTagSinglePayload(v84, 0, 1, 0);
    OUTLINED_FUNCTION_67_0(v69, v84);
    v22 = v85;
    swift_release();
    sub_2459C9134(v84, &qword_2574D8DD0);
    OUTLINED_FUNCTION_119((uint64_t)v64, *(uint64_t (**)(uint64_t, uint64_t))(v83 + 8));
    (*(void (**)(uint64_t, uint64_t))(v108 + 8))(v69, v33);
    return v22;
  }
  v70 = *(_QWORD *)(v46 + 32);
  v71 = *(void (**)(__int128 *__return_ptr, uint64_t, NSObject *, uint64_t, uint64_t))(v46 + 112);
  v72 = *(_QWORD *)(v46 + 120);
  v73 = *(_QWORD *)(v46 + 48);
  v74 = *(_QWORD *)(v46 + 56);
  swift_retain();
  v71(&v125, v70, v68, v73, v74);
  swift_release();
  if (!v126)
  {
    OUTLINED_FUNCTION_125_0();
    OUTLINED_FUNCTION_14_2();
    OUTLINED_FUNCTION_19_2();
    sub_2459C9134((uint64_t)&v125, &qword_2574D8DC8);
    return 0;
  }
  sub_2459B9DDC(&v125, (uint64_t)v128);
  v75 = sub_2459D94F4();
  if (!v76)
  {
LABEL_37:
    if (qword_2574D8AE8 != -1)
      swift_once();
    __swift_project_value_buffer((uint64_t)v123, (uint64_t)qword_2574DA518);
    OUTLINED_FUNCTION_113();
    sub_2459D96A4();
    v89 = OUTLINED_FUNCTION_96();
    if (OUTLINED_FUNCTION_21_1(v89))
    {
      v90 = (uint8_t *)OUTLINED_FUNCTION_8();
      *(_QWORD *)&v125 = OUTLINED_FUNCTION_8();
      *(_DWORD *)v90 = 136642819;
      OUTLINED_FUNCTION_170();
      *(_QWORD *)&v124[0] = OUTLINED_FUNCTION_71(v115, v91, (uint64_t *)&v125);
      sub_2459D9950();
      OUTLINED_FUNCTION_42_1();
      OUTLINED_FUNCTION_29_2(&dword_2459B6000, v68, (os_log_type_t)v72, "SafariSummarizationPrefetch - Invalid URL (%{sensitive}s) found", v90);
      OUTLINED_FUNCTION_33_0();
      OUTLINED_FUNCTION_2();
    }

    OUTLINED_FUNCTION_16_0();
    OUTLINED_FUNCTION_70_0(qword_2574D9C80);
    OUTLINED_FUNCTION_125_0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v128);
    OUTLINED_FUNCTION_14_2();
    OUTLINED_FUNCTION_19_2();
    return 0;
  }
  v72 = v75;
  v68 = v76;
  v77 = sub_2459D94F4();
  if (!v78 || (v79 = sub_2459C9218(v77, v78), v81 = v80, OUTLINED_FUNCTION_17_0(), !v81))
  {
    OUTLINED_FUNCTION_41_0();
    goto LABEL_37;
  }
  v82 = v67;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v116 + 64), *(_QWORD *)(v116 + 88));
  sub_2459C26EC(v79, v81, v124);
  sub_2459B9DDC(v124, (uint64_t)&v125);
  sub_2459D240C(1);
  v93 = v126;
  v94 = v127;
  __swift_project_boxed_opaque_existential_1(&v125, (uint64_t)v126);
  v95 = (*(unsigned __int8 (**)(uint64_t, unint64_t, uint8_t *, uint64_t))(v94 + 8))(v79, v81, v93, v94);
  OUTLINED_FUNCTION_14_0();
  if ((v95 & 1) == 0)
  {
    OUTLINED_FUNCTION_41_0();
    if (qword_2574D8AE8 != -1)
      swift_once();
    __swift_project_value_buffer((uint64_t)v123, (uint64_t)qword_2574DA518);
    OUTLINED_FUNCTION_37_0();
    v103 = OUTLINED_FUNCTION_39_1();
    v104 = OUTLINED_FUNCTION_120(v103);
    v105 = v108;
    if (v104)
    {
      v106 = (_WORD *)OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_35(v106);
      OUTLINED_FUNCTION_7_4(&dword_2459B6000, v68, v95, "SafariSummarizationPrefetch - Domain is not in allow-list, request ineligible", v93);
      OUTLINED_FUNCTION_2();
    }

    *(_BYTE *)(v82 + qword_2574D9C80) = 90;
    sub_2459D0864();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v128);
    OUTLINED_FUNCTION_14_2();
    (*(void (**)(uint64_t, uint64_t))(v105 + 8))(v69, v33);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v125);
    return 0;
  }
  if (qword_2574D8AE8 != -1)
    swift_once();
  __swift_project_value_buffer((uint64_t)v123, (uint64_t)qword_2574DA518);
  v96 = OUTLINED_FUNCTION_37_0();
  v97 = sub_2459D98F0();
  if (OUTLINED_FUNCTION_60(v96))
  {
    v98 = (uint8_t *)OUTLINED_FUNCTION_8();
    *(_WORD *)v98 = 0;
    OUTLINED_FUNCTION_7_4(&dword_2459B6000, v96, v97, "SafariSummarizationPrefetch - Domain is in allow-list, request eligible", v98);
    OUTLINED_FUNCTION_2();
  }

  v99 = v121;
  sub_2459D5724(v69, v121, v72, (uint64_t)v68);
  v101 = v100;
  OUTLINED_FUNCTION_41_0();
  OUTLINED_FUNCTION_70_0(qword_2574D9C80);
  v22 = v101;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v128);
  OUTLINED_FUNCTION_123_0();
  v102(v99, isa);
  OUTLINED_FUNCTION_19_2();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v125);
  return v22;
}

uint64_t sub_2459D5294(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 56) = a4;
  *(_QWORD *)(v5 + 64) = a5;
  return swift_task_switch();
}

uint64_t sub_2459D52AC()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;

  OUTLINED_FUNCTION_130_0();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 72) = Strong;
  if (!Strong)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v2 = (_QWORD *)Strong;
  if (qword_2574D8AE8 != -1)
    swift_once();
  v3 = OUTLINED_FUNCTION_24();
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2574DA518);
  *(_QWORD *)(v0 + 80) = v4;
  swift_retain();
  sub_2459D96A4();
  v5 = OUTLINED_FUNCTION_15_2();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = OUTLINED_FUNCTION_8();
    v13 = OUTLINED_FUNCTION_8();
    *(_DWORD *)v6 = 136643075;
    v7 = v2[6];
    v8 = v2[7];
    OUTLINED_FUNCTION_54();
    *(_QWORD *)(v0 + 40) = sub_2459D6FF4(v7, v8, &v13);
    sub_2459D9950();
    OUTLINED_FUNCTION_8_4();
    *(_WORD *)(v6 + 12) = 2048;
    *(_QWORD *)(v0 + 48) = v2[18];
    sub_2459D9950();
    OUTLINED_FUNCTION_30_1();
    OUTLINED_FUNCTION_82(&dword_2459B6000, v4, v5, "SafariSummarizationPrefetch - Call delegate.didNotFindAssetAfterThrottlingPeriodExpired for locale %{sensitive}s. No loaded assets. Next check at %f", (uint8_t *)v6);
    OUTLINED_FUNCTION_33_0();
    OUTLINED_FUNCTION_2();
  }
  OUTLINED_FUNCTION_30_1();

  v11 = v2[6];
  v10 = v2[7];
  *(_QWORD *)(v0 + 88) = v10;
  OUTLINED_FUNCTION_35_1();
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v12;
  *v12 = v0;
  v12[1] = sub_2459D54CC;
  return sub_2459B8668(v11, v10);
}

uint64_t sub_2459D54CC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  OUTLINED_FUNCTION_35_2(&v2);
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_26();
  return OUTLINED_FUNCTION_3();
}

uint64_t sub_2459D5514()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint8_t *v8;
  _WORD *v9;
  uint64_t v10;
  void *v11;
  os_log_type_t v12;
  _WORD *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  sub_2459D2438();
  if (v2)
  {
    v3 = *(_QWORD *)(v1 + 16);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_41_0();
    v4 = v3 != 0;
    v5 = sub_2459D96A4();
    v6 = sub_2459D98F0();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = v3 != 0;
      v8 = (uint8_t *)OUTLINED_FUNCTION_8();
      *(_DWORD *)v8 = 67109120;
      *(_DWORD *)(v0 + 104) = v7;
      sub_2459D9950();
      _os_log_impl(&dword_2459B6000, v5, v6, "SafariSummarizationPrefetch - After delegate.didNotFindAssetAfterThrottlingPeriodExpired hasUrlRedactMap %{BOOL}d", v8, 8u);
      goto LABEL_6;
    }
  }
  else
  {
    v5 = sub_2459D96A4();
    sub_2459D98F0();
    if (OUTLINED_FUNCTION_20_1(v5))
    {
      v9 = (_WORD *)OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_35(v9);
      OUTLINED_FUNCTION_3_7(&dword_2459B6000, v5, v10, "SafariSummarizationPrefetch - After delegate.didNotFindAssetAfterThrottlingPeriodExpired, no urlRedactPatterns");
LABEL_6:
      OUTLINED_FUNCTION_2();
    }
    v4 = 0;
  }
  v11 = *(void **)(v0 + 80);

  sub_2459D68A4(v4);
  sub_2459D96A4();
  v12 = OUTLINED_FUNCTION_15_2();
  if (OUTLINED_FUNCTION_12(v12))
  {
    v13 = (_WORD *)OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_35(v13);
    OUTLINED_FUNCTION_11(&dword_2459B6000, v14, v15, "SafariSummarizationPrefetch - Posting notification SafariAssistantFilterDataLoaded");
    OUTLINED_FUNCTION_2();
  }

  v16 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_2574D8B08 != -1)
    swift_once();
  objc_msgSend(v16, sel_postNotificationName_object_, qword_2574DA568, 0);

  OUTLINED_FUNCTION_136();
  OUTLINED_FUNCTION_30_1();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_2459D5724(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t, uint64_t);
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
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  os_log_type_t v57;
  uint8_t *v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  os_log_type_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  void (*v74)(uint64_t);
  uint64_t v75;
  void (*v76)(uint64_t);
  uint64_t v77;
  _QWORD *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void (*v93)(char *, uint64_t, uint64_t);
  os_log_type_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  void (*v104)(char *, uint64_t);
  uint64_t v105;
  os_log_type_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132[2];

  v120 = a3;
  v121 = a4;
  v129 = OUTLINED_FUNCTION_24();
  v7 = *(_QWORD *)(v129 - 8);
  MEMORY[0x24BDAC7A8](v129);
  OUTLINED_FUNCTION_33_2();
  v10 = v9 - v8;
  v126 = OUTLINED_FUNCTION_100_0();
  v128 = *(_QWORD *)(v126 - 8);
  OUTLINED_FUNCTION_32_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_57();
  v124 = v12;
  OUTLINED_FUNCTION_55();
  MEMORY[0x24BDAC7A8](v13);
  v113 = (char *)&v112 - v14;
  OUTLINED_FUNCTION_55();
  MEMORY[0x24BDAC7A8](v15);
  v118 = (char *)&v112 - v16;
  OUTLINED_FUNCTION_55();
  MEMORY[0x24BDAC7A8](v17);
  v117 = (char *)&v112 - v18;
  v19 = sub_2459D9608();
  v114 = *(_QWORD *)(v19 - 8);
  v115 = v19;
  OUTLINED_FUNCTION_32_0();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_58_0();
  sub_2459D9650();
  OUTLINED_FUNCTION_11_3();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_56();
  v116 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D8DD0);
  OUTLINED_FUNCTION_11_3();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_33_2();
  v26 = (v25 - v24);
  v27 = OUTLINED_FUNCTION_135();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_33_2();
  v30 = v29 - v28;
  v130 = v31;
  v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16);
  v32(v29 - v28, a2, v27);
  v33 = sub_2459D9434();
  if (!v33)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v26, 1, 1, v27);
    OUTLINED_FUNCTION_126_0(a1, (uint64_t)v26);
    v51 = v50;
    v53 = v52;
    OUTLINED_FUNCTION_119_0(v50, &qword_2574D8DD0);
    if (qword_2574D8AE8 != -1)
      swift_once();
    v54 = v129;
    v55 = __swift_project_value_buffer(v129, (uint64_t)qword_2574DA518);
    v56 = v7;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v10, v55, v54);
    OUTLINED_FUNCTION_113();
    sub_2459D96A4();
    v57 = OUTLINED_FUNCTION_39_1();
    if (OUTLINED_FUNCTION_60(v26))
    {
      v119 = v27;
      v122 = v30;
      v58 = (uint8_t *)OUTLINED_FUNCTION_8();
      v127 = OUTLINED_FUNCTION_8();
      v132[0] = v127;
      *(_DWORD *)v58 = 136642819;
      if (v53)
        v59 = v51;
      else
        v59 = 6369134;
      v128 = v56;
      if (v53)
        v60 = v53;
      else
        v60 = 0xE300000000000000;
      swift_bridgeObjectRetain();
      v131 = sub_2459D6FF4(v59, v60, v132);
      sub_2459D9950();
      OUTLINED_FUNCTION_16_0();
      OUTLINED_FUNCTION_68();
      OUTLINED_FUNCTION_29_2(&dword_2459B6000, v26, v57, "SafariSummarizationPrefetch - Url unredacted due to no matching url pattern with query items, return original url: %{sensitive}s", v58);
      OUTLINED_FUNCTION_33_0();
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_16_0();

    (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v10, v54);
    v75 = OUTLINED_FUNCTION_115_0();
    goto LABEL_37;
  }
  v34 = v33;
  v32((uint64_t)v26, v30, v27);
  __swift_storeEnumTagSinglePayload((uint64_t)v26, 0, 1, v27);
  OUTLINED_FUNCTION_67_0(a1, (uint64_t)v26);
  v127 = v35;
  v37 = v36;
  OUTLINED_FUNCTION_119_0(v35, &qword_2574D8DD0);
  v123 = v37;
  if (!v37)
  {
    v73 = OUTLINED_FUNCTION_115_0();
    v74(v73);
    OUTLINED_FUNCTION_114();
    goto LABEL_38;
  }
  v112 = a1;
  v122 = v30;
  v119 = v27;
  v38 = v125;
  v39 = sub_2459D2438();
  if (!v40)
    goto LABEL_17;
  v42 = v39;
  v43 = v40;
  v44 = v41;
  v45 = v121;
  swift_bridgeObjectRetain();
  v46 = sub_2459D218C(v120, v45, v44);
  OUTLINED_FUNCTION_68();
  sub_2459C91DC(v42, v43);
  if (!v46)
  {
LABEL_17:
    OUTLINED_FUNCTION_114();
    if (qword_2574D8AE8 != -1)
      swift_once();
    __swift_project_value_buffer(v129, (uint64_t)qword_2574DA518);
    v61 = v128;
    v62 = v124;
    v63 = v126;
    (*(void (**)(char *, uint64_t, uint64_t))(v128 + 16))(v124, v112, v126);
    OUTLINED_FUNCTION_113();
    sub_2459D96A4();
    v64 = OUTLINED_FUNCTION_39_1();
    if (OUTLINED_FUNCTION_21_1(v64))
    {
      v65 = OUTLINED_FUNCTION_8();
      v129 = OUTLINED_FUNCTION_8();
      v132[0] = v129;
      v66 = OUTLINED_FUNCTION_86_0(4.9655e-34);
      v68 = OUTLINED_FUNCTION_54_0(v66, v67, v132);
      OUTLINED_FUNCTION_34_1(v68);
      OUTLINED_FUNCTION_110_0();
      *(_WORD *)(v65 + 12) = 2085;
      v69 = sub_2459D94B8();
      v71 = OUTLINED_FUNCTION_86(v69, v70);
      OUTLINED_FUNCTION_48(v71);
      OUTLINED_FUNCTION_17_0();
      OUTLINED_FUNCTION_62_0();
      v72 = "SafariSummarizationPrefetch - Url redacted due to no matching url pattern with domain, return Redacted url s"
            "tring %{sensitive}s, from original url: %{sensitive}s";
      goto LABEL_21;
    }
    goto LABEL_36;
  }
  v47 = *(_QWORD *)(sub_2459D94C4() + 16);
  swift_bridgeObjectRelease();
  if (v47 < 2)
  {
    v49 = 0;
  }
  else
  {
    v48 = *(_QWORD *)(sub_2459D94C4() + 16);
    swift_bridgeObjectRelease();
    v49 = v48 - 1;
  }
  v77 = sub_2459D21CC(v49, v46);
  OUTLINED_FUNCTION_95_0();
  if (!v77)
  {
    OUTLINED_FUNCTION_114();
    v63 = v126;
    if (qword_2574D8AE8 != -1)
      swift_once();
    __swift_project_value_buffer(v129, (uint64_t)qword_2574DA518);
    v61 = v128;
    v62 = v113;
    (*(void (**)(char *, uint64_t, uint64_t))(v128 + 16))(v113, v112, v63);
    OUTLINED_FUNCTION_113();
    sub_2459D96A4();
    v94 = OUTLINED_FUNCTION_39_1();
    if (OUTLINED_FUNCTION_21_1(v94))
    {
      v65 = OUTLINED_FUNCTION_8();
      v129 = OUTLINED_FUNCTION_8();
      v132[0] = v129;
      v95 = OUTLINED_FUNCTION_86_0(4.9655e-34);
      v97 = OUTLINED_FUNCTION_54_0(v95, v96, v132);
      OUTLINED_FUNCTION_34_1(v97);
      OUTLINED_FUNCTION_110_0();
      *(_WORD *)(v65 + 12) = 2085;
      v98 = sub_2459D94B8();
      v100 = OUTLINED_FUNCTION_86(v98, v99);
      OUTLINED_FUNCTION_48(v100);
      OUTLINED_FUNCTION_17_0();
      OUTLINED_FUNCTION_62_0();
      v72 = "SafariSummarizationPrefetch - Url unredacted due to no matching url pattern with number of components, retur"
            "n Redacted url string %{sensitive}s, from original url: %{sensitive}s";
LABEL_21:
      OUTLINED_FUNCTION_82(&dword_2459B6000, v26, (os_log_type_t)v34, v72, (uint8_t *)v65);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2();
    }
LABEL_36:

    (*(void (**)(char *, uint64_t))(v61 + 8))(v62, v63);
    OUTLINED_FUNCTION_16_0();
    v75 = OUTLINED_FUNCTION_114_0();
LABEL_37:
    v76(v75);
    goto LABEL_38;
  }
  OUTLINED_FUNCTION_113_0();
  v78 = *(_QWORD **)(v38 + 104);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v114 + 104))(v4, *MEMORY[0x24BE712E0], v115);
  OUTLINED_FUNCTION_157();
  v79 = v116;
  sub_2459D965C();
  OUTLINED_FUNCTION_134_0();
  OUTLINED_FUNCTION_156();
  v80 = OUTLINED_FUNCTION_41_1(v78, 35, v79);
  v81 = v80;
  v82 = v126;
  if ((*(_BYTE *)(v38 + 128) & 1) == 0)
    *(_BYTE *)(v80 + qword_2574D9C88) = 1;
  v83 = sub_2459D60F4(v34, v77);
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_14_0();
  v84 = v112;
  v85 = v117;
  if (!*(_QWORD *)(v83 + 16))
    OUTLINED_FUNCTION_17_0();
  v86 = v119;
  v87 = v128;
  v88 = v122;
  sub_2459D9440();
  *(_BYTE *)(v81 + qword_2574D9C80) = 78;
  sub_2459D0864();
  v32((uint64_t)v26, v88, v86);
  OUTLINED_FUNCTION_127_0((uint64_t)v26, 0);
  OUTLINED_FUNCTION_126_0(v84, (uint64_t)v26);
  v90 = v89;
  v92 = v91;
  OUTLINED_FUNCTION_119_0(v89, &qword_2574D8DD0);
  v93 = *(void (**)(char *, uint64_t, uint64_t))(v87 + 16);
  v93(v85, v84, v82);
  v123 = v92;
  v124 = (char *)v81;
  if (v92)
  {
    v127 = v90;
  }
  else
  {
    v127 = sub_2459D94B8();
    v123 = v101;
  }
  v102 = v129;
  v103 = v118;
  v104 = *(void (**)(char *, uint64_t))(v87 + 8);
  v104(v85, v82);
  if (qword_2574D8AE8 != -1)
    swift_once();
  __swift_project_value_buffer(v102, (uint64_t)qword_2574DA518);
  v105 = OUTLINED_FUNCTION_112();
  ((void (*)(uint64_t))v93)(v105);
  OUTLINED_FUNCTION_113();
  sub_2459D96A4();
  v106 = OUTLINED_FUNCTION_39_1();
  if (OUTLINED_FUNCTION_28_1(v106))
  {
    v107 = v103;
    v108 = OUTLINED_FUNCTION_8();
    v132[0] = OUTLINED_FUNCTION_8();
    *(_DWORD *)v108 = 136643075;
    OUTLINED_FUNCTION_170();
    v131 = OUTLINED_FUNCTION_71(v127, v109, v132);
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_42_1();
    *(_WORD *)(v108 + 12) = 2085;
    v110 = sub_2459D94B8();
    v131 = OUTLINED_FUNCTION_86(v110, v111);
    sub_2459D9950();
    OUTLINED_FUNCTION_17_0();
    v104(v107, v82);
    OUTLINED_FUNCTION_82(&dword_2459B6000, v93, (os_log_type_t)v87, "SafariSummarizationPrefetch - Redacted url string %{sensitive}s, from original %{sensitive}s", (uint8_t *)v108);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2();
  }

  swift_release();
  v104(v103, v82);
  OUTLINED_FUNCTION_16_0();
  (*(void (**)(uint64_t, uint64_t))(v130 + 8))(v122, v86);
LABEL_38:
  OUTLINED_FUNCTION_47();
}

uint64_t sub_2459D60F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  char v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v33 = sub_2459D9428();
  v7 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_6_2();
  v8 = *(_QWORD *)(a1 + 16);
  v9 = MEMORY[0x24BEE4AF8];
  if (v8)
  {
    v34 = MEMORY[0x24BEE4AF8];
    sub_2459D7FB8(0, v8, 0);
    v10 = a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    v30 = *(_QWORD *)(v7 + 72);
    v31 = v7;
    do
    {
      v29(v2, v10, v33);
      sub_2459D9410();
      OUTLINED_FUNCTION_91_0();
      v11 = sub_2459D941C();
      v13 = v12;
      OUTLINED_FUNCTION_119(v2, *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
      v9 = v34;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2459D7FB8(0, *(_QWORD *)(v34 + 16) + 1, 1);
        v9 = v34;
      }
      v15 = *(_QWORD *)(v9 + 16);
      v14 = *(_QWORD *)(v9 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_2459D7FB8((char *)(v14 > 1), v15 + 1, 1);
        v9 = v34;
      }
      *(_QWORD *)(v9 + 16) = v15 + 1;
      v16 = (_QWORD *)(v9 + 32 * v15);
      v16[4] = v3;
      v16[5] = v4;
      v16[6] = v11;
      v16[7] = v13;
      v7 = v31;
      v10 += v30;
      --v8;
    }
    while (v8);
  }
  v17 = sub_2459D65D8(v9);
  v32 = *(_QWORD *)(a2 + 16);
  if (v32)
  {
    sub_2459C5490();
    OUTLINED_FUNCTION_35_1();
    v18 = 0;
    v19 = v32;
    while (1)
    {
      v20 = sub_2459D9968();
      v21 = *(_QWORD *)(v20 + 16);
      if (!v21)
      {
LABEL_27:
        swift_bridgeObjectRelease();
        goto LABEL_28;
      }
      if (*(_QWORD *)(v17 + 16))
      {
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_170();
        OUTLINED_FUNCTION_82_0();
        if ((v22 & 1) != 0)
        {
          v23 = 0;
          v24 = v20 + 56;
          v25 = v21 - 1;
          while (1)
          {
            result = OUTLINED_FUNCTION_95_0();
            if (v25 == v23)
            {
              OUTLINED_FUNCTION_113_0();
              goto LABEL_27;
            }
            if ((unint64_t)++v23 >= *(_QWORD *)(v20 + 16))
              break;
            if (!*(_QWORD *)(v17 + 16))
            {
              OUTLINED_FUNCTION_16_0();
              goto LABEL_22;
            }
            OUTLINED_FUNCTION_170();
            OUTLINED_FUNCTION_82_0();
            v24 += 16;
            if ((v27 & 1) == 0)
            {
              OUTLINED_FUNCTION_16_0();
              OUTLINED_FUNCTION_95_0();
LABEL_22:
              v19 = v32;
              goto LABEL_23;
            }
          }
          __break(1u);
          return result;
        }
        OUTLINED_FUNCTION_16_0();
        OUTLINED_FUNCTION_95_0();
      }
      else
      {
        OUTLINED_FUNCTION_68();
      }
LABEL_23:
      if (++v18 == v19)
      {
        OUTLINED_FUNCTION_113_0();
        v20 = MEMORY[0x24BEE4AF8];
        goto LABEL_28;
      }
    }
  }
  v20 = MEMORY[0x24BEE4AF8];
LABEL_28:
  swift_bridgeObjectRetain();
  v28 = sub_2459D6400(v20, v17);
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_68();
  return v28;
}

uint64_t sub_2459D6400(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v23 = sub_2459D9428();
  v5 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  v24 = a2;
  v22[1] = v2;
  v25 = MEMORY[0x24BEE4AF8];
  sub_2459D7F9C(0, v8, 0);
  v9 = v25;
  v10 = a1 + 40;
  do
  {
    v11 = v24;
    v12 = *(_QWORD *)(v24 + 16);
    swift_bridgeObjectRetain();
    if (v12)
    {
      v13 = sub_2459D7754();
      if ((v14 & 1) != 0)
      {
        v15 = (uint64_t *)(*(_QWORD *)(v11 + 56) + 16 * v13);
        v16 = *v15;
        v17 = v15[1];
        swift_bridgeObjectRetain();
        v18 = v17;
        goto LABEL_9;
      }
      v16 = 0;
    }
    else
    {
      v16 = 0;
    }
    v18 = 1;
LABEL_9:
    sub_2459D9404();
    sub_2459D7FD4(v16, v18);
    swift_bridgeObjectRelease();
    v25 = v9;
    v20 = *(_QWORD *)(v9 + 16);
    v19 = *(_QWORD *)(v9 + 24);
    if (v20 >= v19 >> 1)
    {
      sub_2459D7F9C(v19 > 1, v20 + 1, 1);
      v9 = v25;
    }
    v10 += 16;
    *(_QWORD *)(v9 + 16) = v20 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v20, v7, v23);
    --v8;
  }
  while (v8);
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_2459D65D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574DA1F0);
    v3 = sub_2459D9A40();
  }
  else
  {
    v3 = MEMORY[0x24BEE4B00];
  }
  v6 = v3;
  sub_2459D7DB4(a1, 1, &v6);
  v4 = v6;
  if (v1)
    swift_release();
  return v4;
}

void sub_2459D6664(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v6;
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
  char *v17;
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

  v27 = a1;
  v6 = OUTLINED_FUNCTION_135();
  v26 = *(_QWORD *)(v6 - 8);
  OUTLINED_FUNCTION_32_0();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D93E0);
  OUTLINED_FUNCTION_11_3();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_6_2();
  v11 = OUTLINED_FUNCTION_100_0();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v26 - v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D8DD0);
  OUTLINED_FUNCTION_11_3();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_33_2();
  v21 = v20 - v19;
  sub_2459D6AF4(a2, v20 - v19);
  if ((a3 & 1) != 0 && !OUTLINED_FUNCTION_99())
    sub_2459D9440();
  if (OUTLINED_FUNCTION_99())
  {
    __swift_storeEnumTagSinglePayload(v3, 1, 1, v11);
  }
  else
  {
    v22 = v26;
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v9, v21, v6);
    sub_2459D9458();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v9, v6);
  }
  OUTLINED_FUNCTION_63_0((uint64_t)v15, v27, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 16));
  if (__swift_getEnumTagSinglePayload(v3, 1, v11) == 1)
  {
    OUTLINED_FUNCTION_63_0((uint64_t)v17, (uint64_t)v15, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 32));
    sub_2459C9134(v3, &qword_2574D93E0);
  }
  else
  {
    OUTLINED_FUNCTION_119((uint64_t)v15, *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8));
    OUTLINED_FUNCTION_63_0((uint64_t)v17, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 32));
  }
  v23 = sub_2459D94B8();
  v25 = v24;
  OUTLINED_FUNCTION_119((uint64_t)v17, *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8));
  v28 = v23;
  v29 = v25;
  sub_2459C5490();
  sub_2459D9980();
  OUTLINED_FUNCTION_114();
  sub_2459C9134(v21, &qword_2574D8DD0);
  OUTLINED_FUNCTION_47();
}

uint64_t sub_2459D68A4(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t result;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);

  v2 = v1;
  v4 = sub_2459D95D8();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_6_2();
  if ((a1 & 1) != 0)
    return sub_2459D240C(1);
  sub_2459D240C(0);
  v6 = 0.0;
  result = sub_2459D98A8();
  if ((result & 1) == 0)
  {
    sub_2459D95CC();
    sub_2459D95B4();
    v8 = v7;
    v9 = OUTLINED_FUNCTION_112();
    result = v10(v9);
    v6 = v8 + 3600.0;
  }
  *(double *)(v2 + 144) = v6;
  return result;
}

uint64_t sub_2459D6974()
{
  uint64_t v0;

  sub_2459C5F04(v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_2459D69D8()
{
  sub_2459D6974();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SASafariAssistantPrefetchRequestFilter()
{
  return objc_opt_self();
}

void sub_2459D6A1C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_159();
  OUTLINED_FUNCTION_0_5();
}

ValueMetadata *type metadata accessor for SAPrefetchUrlRedactPatterns()
{
  return &type metadata for SAPrefetchUrlRedactPatterns;
}

void sub_2459D6A60()
{
  sub_2459D9B30();
  OUTLINED_FUNCTION_0_5();
}

uint64_t sub_2459D6A80()
{
  sub_2459D9B24();
  sub_2459D9B30();
  return OUTLINED_FUNCTION_23_1();
}

uint64_t sub_2459D6AC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)v2 + 24) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t sub_2459D6AF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D8DD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2459D6B3C()
{
  return sub_2459D6A80();
}

void sub_2459D6B44()
{
  sub_2459D6A60();
}

uint64_t sub_2459D6B4C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2459D6BB0;
  return v6(a1);
}

uint64_t sub_2459D6BB0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_9_1();
  return OUTLINED_FUNCTION_1(*(uint64_t (**)(void))(v0 + 8));
}

char *sub_2459D6BD8(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    OUTLINED_FUNCTION_90_0();
    __src = (char *)OUTLINED_FUNCTION_50();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_2459D6C34(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    result = sub_2459D9A4C();
    __break(1u);
  }
  else if (a3 < a1 || (result = sub_2459D9428(), a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    sub_2459D9428();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_2459D6D30(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_2459D9A4C();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

char *sub_2459D6DB4(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_90_0();
    __src = (char *)OUTLINED_FUNCTION_50();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_2459D6E14(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(sub_2459D9428() - 8) + 72) * a2;
    v6 = a3 + v5;
    v7 = a1 + v5;
    if (v6 <= a1 || v7 <= a3)
      return swift_arrayInitWithCopy();
  }
  result = sub_2459D9A4C();
  __break(1u);
  return result;
}

uint64_t sub_2459D6F08(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 32 * a2 > a1 ? (v3 = a1 + 32 * a2 > a3) : (v3 = 0), v3))
  {
    result = sub_2459D9A4C();
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574DA208);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_2459D6FF4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  _QWORD *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[3];
  uint64_t ObjectType;

  OUTLINED_FUNCTION_26();
  v9 = sub_2459D70C0(v6, v7, v8, 1, a1, a2);
  v10 = v15[0];
  if (v9)
  {
    v11 = v9;
    ObjectType = swift_getObjectType();
    v15[0] = v11;
    v12 = *a3;
    if (*a3)
    {
      sub_2459D8208((uint64_t)v15, *a3);
      *a3 = v12 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v15[0] = a1;
    v15[1] = a2;
    v13 = *a3;
    if (*a3)
    {
      sub_2459D8208((uint64_t)v15, *a3);
      *a3 = v13 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return v10;
}

uint64_t sub_2459D70C0(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_2459D7214((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_2459D995C();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_2459D72D8(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_2459D99E0();
    if (!v8)
    {
      result = sub_2459D9A10();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *sub_2459D7214(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2459D9A4C();
  __break(1u);
  return result;
}

uint64_t sub_2459D72D8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2459D736C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_2459D758C(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_2459D758C((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2459D736C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_2459D97C4();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  sub_2459D74DC(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_2459D99C8();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return v4;
  }
  sub_2459D9A4C();
  __break(1u);
LABEL_14:
  result = sub_2459D9A10();
  __break(1u);
  return result;
}

void sub_2459D74DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9990);
    v4 = (_QWORD *)OUTLINED_FUNCTION_3_0();
    v5 = _swift_stdlib_malloc_size(v4);
    v4[2] = a1;
    v4[3] = 2 * v5 - 64;
  }
  OUTLINED_FUNCTION_0_5();
}

void sub_2459D7538(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v4 = sub_2459D9800();
    OUTLINED_FUNCTION_76(v4);
  }
  else
  {
    v3 = MEMORY[0x2495400C0](15, a1 >> 16);
    OUTLINED_FUNCTION_76(v3);
  }
  OUTLINED_FUNCTION_0_5();
}

char *sub_2459D758C(char *result, int64_t a2, char a3, uint64_t a4)
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
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574D9990);
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_2459D6BD8(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2459D7660(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2459D7660(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2459D9A4C();
  __break(1u);
  return result;
}

unint64_t sub_2459D7724(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2459D998C();
  return sub_2459D782C(a1, v2);
}

unint64_t sub_2459D7754()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_103_0();
  sub_2459D9788();
  OUTLINED_FUNCTION_23_1();
  v0 = OUTLINED_FUNCTION_112();
  return sub_2459D78F0(v0, v1, v2);
}

uint64_t sub_2459D77AC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_103_0();
  sub_2459D9788();
  v0 = OUTLINED_FUNCTION_23_1();
  return sub_2459D79D0(v0);
}

unint64_t sub_2459D77FC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2459D9B18();
  return sub_2459D79FC(a1, v2);
}

unint64_t sub_2459D782C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_2459D8440(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x24954027C](v9, a1);
      sub_2459BD0C0((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_2459D78F0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2459D9AC4() & 1) == 0)
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
      while (!v14 && (sub_2459D9AC4() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2459D79D0(uint64_t a1)
{
  uint64_t v1;

  return a1 & ~(-1 << *(_BYTE *)(v1 + 32));
}

unint64_t sub_2459D79FC(uint64_t a1, uint64_t a2)
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

uint64_t sub_2459D7A98(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  _QWORD *v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  __int128 v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574DA1F0);
  v36 = a2;
  v6 = sub_2459D9A34();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_39;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v34 = v2;
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  if (!v10)
    goto LABEL_7;
LABEL_6:
  v15 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (i = v15 | (v14 << 6); ; i = __clz(__rbit64(v19)) + (v14 << 6))
  {
    v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * i);
    v23 = *v21;
    v22 = v21[1];
    v37 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + 16 * i);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_2459D9B24();
    sub_2459D9788();
    result = sub_2459D9B3C();
    v24 = -1 << *(_BYTE *)(v7 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6))) == 0)
    {
      v28 = 0;
      v29 = (unint64_t)(63 - v24) >> 6;
      while (++v26 != v29 || (v28 & 1) == 0)
      {
        v30 = v26 == v29;
        if (v26 == v29)
          v26 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v12 + 8 * v26);
        if (v31 != -1)
        {
          v27 = __clz(__rbit64(~v31)) + (v26 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    v27 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v12 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
    v32 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v27);
    *v32 = v23;
    v32[1] = v22;
    *(_OWORD *)(*(_QWORD *)(v7 + 56) + 16 * v27) = v37;
    ++*(_QWORD *)(v7 + 16);
    if (v10)
      goto LABEL_6;
LABEL_7:
    v17 = v14 + 1;
    if (__OFADD__(v14, 1))
      goto LABEL_41;
    if (v17 >= v11)
    {
      swift_release();
      v3 = v34;
      v18 = (_QWORD *)(v5 + 64);
      goto LABEL_34;
    }
    v18 = (_QWORD *)(v5 + 64);
    v19 = *(_QWORD *)(v35 + 8 * v17);
    ++v14;
    if (!v19)
    {
      v14 = v17 + 1;
      if (v17 + 1 >= v11)
        goto LABEL_32;
      v19 = *(_QWORD *)(v35 + 8 * v14);
      if (!v19)
        break;
    }
LABEL_18:
    v10 = (v19 - 1) & v19;
  }
  v20 = v17 + 2;
  if (v20 < v11)
  {
    v19 = *(_QWORD *)(v35 + 8 * v20);
    if (!v19)
    {
      while (1)
      {
        v14 = v20 + 1;
        if (__OFADD__(v20, 1))
          goto LABEL_42;
        if (v14 >= v11)
          goto LABEL_32;
        v19 = *(_QWORD *)(v35 + 8 * v14);
        ++v20;
        if (v19)
          goto LABEL_18;
      }
    }
    v14 = v20;
    goto LABEL_18;
  }
LABEL_32:
  swift_release();
  v3 = v34;
LABEL_34:
  if ((v36 & 1) != 0)
  {
    v33 = 1 << *(_BYTE *)(v5 + 32);
    if (v33 >= 64)
      sub_2459D7D98(0, (unint64_t)(v33 + 63) >> 6, v18);
    else
      *v18 = -1 << v33;
    *(_QWORD *)(v5 + 16) = 0;
  }
LABEL_39:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_2459D7D98(uint64_t result, uint64_t a2, _QWORD *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_2459D7DB4(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t *i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  char v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;

  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
    return swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  for (i = (uint64_t *)(a1 + 56); ; i += 4)
  {
    v8 = *(i - 3);
    v7 = *(i - 2);
    v9 = *i;
    v30 = *(i - 1);
    v10 = (_QWORD *)*a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12 = sub_2459D7754();
    v13 = v10[2];
    v14 = (v11 & 1) == 0;
    v15 = v13 + v14;
    if (__OFADD__(v13, v14))
      break;
    v16 = v11;
    if (v10[3] >= v15)
    {
      if ((a2 & 1) == 0)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2574DA1F8);
        sub_2459D99F8();
      }
    }
    else
    {
      sub_2459D7A98(v15, a2 & 1);
      v17 = sub_2459D7754();
      if ((v16 & 1) != (v18 & 1))
        goto LABEL_18;
      v12 = v17;
    }
    v19 = (_QWORD *)*a3;
    if ((v16 & 1) != 0)
    {
      v20 = (uint64_t *)(v19[7] + 16 * v12);
      v22 = *v20;
      v21 = v20[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v23 = (_QWORD *)(v19[7] + 16 * v12);
      swift_bridgeObjectRelease();
      *v23 = v22;
      v23[1] = v21;
    }
    else
    {
      v19[(v12 >> 6) + 8] |= 1 << v12;
      v24 = (_QWORD *)(v19[6] + 16 * v12);
      *v24 = v8;
      v24[1] = v7;
      v25 = (_QWORD *)(v19[7] + 16 * v12);
      *v25 = v30;
      v25[1] = v9;
      v26 = v19[2];
      v27 = __OFADD__(v26, 1);
      v28 = v26 + 1;
      if (v27)
        goto LABEL_17;
      v19[2] = v28;
    }
    a2 = 1;
    if (!--v4)
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  result = sub_2459D9ADC();
  __break(1u);
  return result;
}

size_t sub_2459D7F9C(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_2459D7FE8(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_2459D7FB8(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_2459D8128(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

uint64_t sub_2459D7FD4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
    return swift_bridgeObjectRelease();
  return result;
}

size_t sub_2459D7FE8(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574DA1E8);
  v10 = *(_QWORD *)(sub_2459D9428() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_24;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(unsigned __int8 *)(*(_QWORD *)(sub_2459D9428() - 8) + 80);
  v16 = (v15 + 32) & ~v15;
  v17 = (unint64_t)v13 + v16;
  v18 = a4 + v16;
  if ((v5 & 1) != 0)
  {
    sub_2459D6C34(v18, v8, v17);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2459D6E14(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

char *sub_2459D8128(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574DA200);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_2459D6D30(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2459D6F08((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_2459D8208(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2459D8244()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2459D8268()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2459D829C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v2 = swift_task_alloc();
  v3 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)v2 = v1;
  *(_QWORD *)(v2 + 8) = sub_2459C5168;
  *(_OWORD *)(v2 + 56) = v3;
  OUTLINED_FUNCTION_26();
  return OUTLINED_FUNCTION_3();
}

uint64_t sub_2459D82F0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2459D8314(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2459C49B4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2574DA220 + dword_2574DA220))(a1, v4);
}

unint64_t sub_2459D8384()
{
  unint64_t result;

  result = qword_2574DA240;
  if (!qword_2574DA240)
  {
    result = MEMORY[0x2495408C4](&unk_2459DBDB8, &type metadata for SafariSummarizationPrefetchRequestFilterError);
    atomic_store(result, (unint64_t *)&qword_2574DA240);
  }
  return result;
}

unint64_t sub_2459D83C0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2574DA250;
  if (!qword_2574DA250)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2574DA238);
    result = MEMORY[0x2495408C4](MEMORY[0x24BDCC670], v1);
    atomic_store(result, (unint64_t *)&qword_2574DA250);
  }
  return result;
}

unint64_t sub_2459D8404()
{
  unint64_t result;

  result = qword_2574DA258;
  if (!qword_2574DA258)
  {
    result = MEMORY[0x2495408C4](&unk_2459DAD9C, &type metadata for SASafariAssistantUrlPathFilterModel);
    atomic_store(result, (unint64_t *)&qword_2574DA258);
  }
  return result;
}

uint64_t sub_2459D8440(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t getEnumTagSinglePayload for SafariSummarizationPrefetchRequestFilterError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SafariSummarizationPrefetchRequestFilterError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2459D8550 + 4 * byte_2459DBBE5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2459D8584 + 4 * byte_2459DBBE0[v4]))();
}

uint64_t sub_2459D8584(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2459D858C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2459D8594);
  return result;
}

uint64_t sub_2459D85A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2459D85A8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2459D85AC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2459D85B4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SafariSummarizationPrefetchRequestFilterError()
{
  return &type metadata for SafariSummarizationPrefetchRequestFilterError;
}

unint64_t sub_2459D85D4()
{
  unint64_t result;

  result = qword_2574DA270;
  if (!qword_2574DA270)
  {
    result = MEMORY[0x2495408C4](&unk_2459DBD90, &type metadata for SafariSummarizationPrefetchRequestFilterError);
    atomic_store(result, (unint64_t *)&qword_2574DA270);
  }
  return result;
}

void OUTLINED_FUNCTION_3_7(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  os_log_type_t v4;
  uint8_t *v5;

  _os_log_impl(a1, a2, v4, a4, v5, 2u);
}

void OUTLINED_FUNCTION_7_4(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 - 264) + 8))(*(_QWORD *)(v0 - 256), *(_QWORD *)(v0 - 280));
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  return sub_2459D98F0();
}

uint64_t OUTLINED_FUNCTION_19_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 360) + 8))(v1, v0);
}

BOOL OUTLINED_FUNCTION_20_1(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

BOOL OUTLINED_FUNCTION_21_1(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_24_2()
{
  return swift_release();
}

BOOL OUTLINED_FUNCTION_28_1(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_29_2(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_30_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_31_1@<X0>(uint64_t (*a1)(_QWORD, _QWORD, _QWORD)@<X8>)
{
  uint64_t v1;

  return a1(*(_QWORD *)(v1 - 272), *(_QWORD *)(v1 - 256), *(_QWORD *)(v1 - 280));
}

uint64_t OUTLINED_FUNCTION_34_1(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = a1;
  return sub_2459D9950();
}

uint64_t OUTLINED_FUNCTION_35_2@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = v1;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  return sub_2459D96A4();
}

uint64_t OUTLINED_FUNCTION_39_1()
{
  return sub_2459D98F0();
}

uint64_t OUTLINED_FUNCTION_41_1(_QWORD *a1, int a2, uint64_t a3)
{
  return sub_2459D02F8(a1, a2, a3, 0, 1);
}

uint64_t OUTLINED_FUNCTION_42_1()
{
  return swift_bridgeObjectRelease_n();
}

void OUTLINED_FUNCTION_43_1()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_48(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = a1;
  return sub_2459D9950();
}

uint64_t OUTLINED_FUNCTION_50()
{
  return sub_2459D9A4C();
}

uint64_t OUTLINED_FUNCTION_52_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD, _QWORD)@<X8>)
{
  uint64_t v2;

  return a2(a1, *(_QWORD *)(v2 - 256), *(_QWORD *)(v2 - 280));
}

uint64_t OUTLINED_FUNCTION_54_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  unint64_t v4;

  return sub_2459D6FF4(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_57_0()
{
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_58_0()
{
  return 0;
}

void OUTLINED_FUNCTION_59_0(uint64_t a1@<X8>)
{
  char v1;
  uint64_t v2;

  *(_BYTE *)(v2 + a1) = v1;
  sub_2459D0864();
}

BOOL OUTLINED_FUNCTION_60(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_61()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_62_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 128) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_63_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_64_0()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
}

void OUTLINED_FUNCTION_67_0(uint64_t a1, uint64_t a2)
{
  sub_2459D6664(a1, a2, 1);
}

void OUTLINED_FUNCTION_70_0(uint64_t a1@<X8>)
{
  char v1;
  uint64_t v2;

  *(_BYTE *)(v2 + a1) = v1;
  sub_2459D0864();
}

uint64_t OUTLINED_FUNCTION_71(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  return sub_2459D6FF4(a1, v3, a3);
}

void OUTLINED_FUNCTION_72()
{
  void *v0;

}

unint64_t OUTLINED_FUNCTION_76(uint64_t a1)
{
  char v1;

  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

uint64_t OUTLINED_FUNCTION_77_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return 0;
}

unint64_t OUTLINED_FUNCTION_82_0()
{
  return sub_2459D7754();
}

uint64_t OUTLINED_FUNCTION_86_0(float a1)
{
  float *v1;

  *v1 = a1;
  return swift_bridgeObjectRetain();
}

BOOL OUTLINED_FUNCTION_92_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_93_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_94_0()
{
  unint64_t v0;
  uint64_t v1;

  sub_2459BDE48(v1, v0);
  return sub_2459BDE48(v1, v0);
}

uint64_t OUTLINED_FUNCTION_95_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_99()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_100_0()
{
  return sub_2459D9530();
}

unint64_t OUTLINED_FUNCTION_101_0()
{
  return sub_2459D7754();
}

_QWORD *OUTLINED_FUNCTION_102_0(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;

  *result = v2;
  result[1] = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_103_0()
{
  return sub_2459D9B24();
}

id OUTLINED_FUNCTION_105()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_110_0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_112()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_113_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_114_0()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 176);
}

uint64_t OUTLINED_FUNCTION_115_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_118_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

void OUTLINED_FUNCTION_119_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_2459C9134(v2, a2);
}

uint64_t OUTLINED_FUNCTION_122_0()
{
  return sub_2459D9AC4();
}

id OUTLINED_FUNCTION_124_0()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_125_0()
{
  return swift_release();
}

void OUTLINED_FUNCTION_126_0(uint64_t a1, uint64_t a2)
{
  sub_2459D6664(a1, a2, 0);
}

uint64_t OUTLINED_FUNCTION_127_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_128_0()
{
  return sub_2459D9500();
}

uint64_t OUTLINED_FUNCTION_129_0@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 8))();
}

uint64_t OUTLINED_FUNCTION_130_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_131_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 184) = a1;
  return v1 - 184;
}

id OUTLINED_FUNCTION_132_0()
{
  void *v0;
  unint64_t v1;
  uint64_t v2;

  sub_2459BE20C(v2, v1);
  return v0;
}

uint64_t OUTLINED_FUNCTION_134_0()
{
  return type metadata accessor for ResourceAccessSpan();
}

uint64_t OUTLINED_FUNCTION_135()
{
  return sub_2459D9470();
}

uint64_t OUTLINED_FUNCTION_136()
{
  return sub_2459D24F0(0);
}

void Lock.__allocating_init()()
{
  OUTLINED_FUNCTION_8_6();
  Lock.init()();
  OUTLINED_FUNCTION_0_5();
}

Swift::Void __swiftcall Lock.lock()()
{
  sub_2459D8AA8(MEMORY[0x24BDAF8D0]);
}

Swift::Void __swiftcall Lock.unlock()()
{
  sub_2459D8AA8(MEMORY[0x24BDAF8E0]);
}

uint64_t sub_2459D8AA8(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t result;

  result = a1(*(_QWORD *)(v1 + 16));
  if ((_DWORD)result)
    __break(1u);
  return result;
}

uint64_t Lock.init()()
{
  uint64_t v0;
  pthread_mutex_t *v1;
  uint64_t result;

  v1 = (pthread_mutex_t *)swift_slowAlloc();
  *(_QWORD *)(v0 + 16) = v1;
  result = pthread_mutex_init(v1, 0);
  if (!(_DWORD)result)
    return v0;
  __break(1u);
  return result;
}

void Lock.deinit()
{
  OUTLINED_FUNCTION_2();
}

uint64_t sub_2459D8B10()
{
  uint64_t v0;

  return v0;
}

void Lock.__deallocating_deinit()
{
  OUTLINED_FUNCTION_2();
}

uint64_t sub_2459D8B2C()
{
  return swift_deallocClassInstance();
}

void Lock.withLock<A>(_:)()
{
  void (*v0)(void);

  OUTLINED_FUNCTION_7_5();
  Lock.lock()();
  v0();
  Lock.unlock()();
}

void Lock.withLockVoid(_:)()
{
  void (*v0)(void);

  OUTLINED_FUNCTION_7_5();
  Lock.lock()();
  v0();
  Lock.unlock()();
}

void ConditionLock.__allocating_init(value:)(uint64_t a1)
{
  swift_allocObject();
  ConditionLock.init(value:)(a1);
  OUTLINED_FUNCTION_0_5();
}

uint64_t ConditionLock.init(value:)(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v2 = v1;
  v4 = *(_QWORD *)v1;
  v5 = *(_QWORD *)(v4 + 112);
  *(_QWORD *)&v2[v5] = swift_slowAlloc();
  v6 = *(_QWORD *)(v4 + 80);
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(&v2[*(_QWORD *)(*(_QWORD *)v2 + 96)], a1, v6);
  type metadata accessor for Lock();
  v8 = OUTLINED_FUNCTION_8_6();
  Lock.init()();
  *(_QWORD *)&v2[*(_QWORD *)(*(_QWORD *)v2 + 104)] = v8;
  LODWORD(v8) = pthread_cond_init(*(pthread_cond_t **)&v2[*(_QWORD *)(*(_QWORD *)v2 + 112)], 0);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  if (!(_DWORD)v8)
    return (uint64_t)v2;
  __break(1u);
  return result;
}

uint64_t type metadata accessor for Lock()
{
  return objc_opt_self();
}

void ConditionLock.deinit()
{
  OUTLINED_FUNCTION_2();
}

void sub_2459D8D10()
{
  uint64_t v0;
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 80) - 8) + 8))(v1 + *(_QWORD *)(*(_QWORD *)v1 + 96));
  swift_release();
  OUTLINED_FUNCTION_0_5();
}

void ConditionLock.__deallocating_deinit()
{
  ConditionLock.deinit();
}

uint64_t sub_2459D8D54()
{
  return swift_deallocClassInstance();
}

Swift::Void __swiftcall ConditionLock.lock()()
{
  Lock.lock()();
}

Swift::Void __swiftcall ConditionLock.unlock()()
{
  Lock.unlock()();
}

void ConditionLock.value.getter(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1;
  ConditionLock.lock()();
  v4 = (uint64_t)v1 + *(_QWORD *)(*v1 + 96);
  OUTLINED_FUNCTION_5();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 80) - 8) + 16))(a1, v4);
  ConditionLock.unlock()();
  OUTLINED_FUNCTION_2_1();
}

uint64_t ConditionLock.lock(whenValue:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  char v10;
  uint64_t result;

  v3 = v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_3_8();
  ConditionLock.lock()();
  v6 = *(_QWORD *)(*(_QWORD *)v1 + 104);
  v7 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 96);
  v8 = *(_QWORD *)(*(_QWORD *)v1 + 112);
  OUTLINED_FUNCTION_5();
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  while (1)
  {
    v9(v2, v7, v4);
    v10 = OUTLINED_FUNCTION_4_7();
    result = OUTLINED_FUNCTION_5_6(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
    if ((v10 & 1) != 0)
      break;
    result = pthread_cond_wait(*(pthread_cond_t **)(v3 + v8), *(pthread_mutex_t **)(*(_QWORD *)(v3 + v6) + 16));
    if ((_DWORD)result)
    {
      __break(1u);
      return result;
    }
  }
  return result;
}

uint64_t ConditionLock.lock(whenValue:timeoutSeconds:)(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  char v16;
  int v17;
  uint64_t result;
  timespec v19;
  timeval v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 80);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_3_8();
  if (v7 < 0.0)
  {
    __break(1u);
    goto LABEL_14;
  }
  ConditionLock.lock()();
  v8 = a2 * 1000000000.0;
  if ((~*(_QWORD *)&v8 & 0x7FF0000000000000) == 0)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v8 <= -9.22337204e18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v8 >= 9.22337204e18)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20.tv_sec = 0;
  v20.tv_usec = 0;
  gettimeofday(&v20, 0);
  v9 = 1000 * v20.tv_usec;
  v10 = __OFADD__((uint64_t)v8, v9);
  v11 = (uint64_t)v8 + v9;
  if (v10)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
  }
  if (__OFADD__(v20.tv_sec, v11 / 1000000000))
    goto LABEL_18;
  v19.tv_sec = v20.tv_sec + v11 / 1000000000;
  v19.tv_nsec = v11 % 1000000000;
  v12 = *(_QWORD *)(*(_QWORD *)v2 + 104);
  v13 = v2 + *(_QWORD *)(*(_QWORD *)v2 + 96);
  v14 = *(_QWORD *)(*(_QWORD *)v2 + 112);
  OUTLINED_FUNCTION_5();
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  do
  {
    v15(v3, v13, v5);
    v16 = OUTLINED_FUNCTION_4_7();
    OUTLINED_FUNCTION_5_6(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
    if ((v16 & 1) != 0)
      return v16 & 1;
    v17 = pthread_cond_timedwait(*(pthread_cond_t **)(v2 + v14), *(pthread_mutex_t **)(*(_QWORD *)(v2 + v12) + 16), &v19);
  }
  while (!v17);
  if (v17 == 60)
  {
    ConditionLock.unlock()();
    return v16 & 1;
  }
  sub_2459D99BC();
  sub_2459D97A0();
  sub_2459D9AAC();
  sub_2459D97A0();
  swift_bridgeObjectRelease();
  sub_2459D97A0();
  result = sub_2459D9A1C();
  __break(1u);
  return result;
}

void ConditionLock.unlock(withValue:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1;
  v4 = (uint64_t)v1 + *(_QWORD *)(*v1 + 96);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 80) - 8) + 24))(v4, a1);
  swift_endAccess();
  ConditionLock.unlock()();
  if (pthread_cond_broadcast(*(pthread_cond_t **)((char *)v1 + *(_QWORD *)(*v1 + 112))))
    __break(1u);
  else
    OUTLINED_FUNCTION_2_1();
}

uint64_t method lookup function for Lock()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Lock.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_2459D9224()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for ConditionLock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ConditionLock);
}

uint64_t method lookup function for ConditionLock()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ConditionLock.__allocating_init(value:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t OUTLINED_FUNCTION_4_7()
{
  return sub_2459D9710();
}

uint64_t OUTLINED_FUNCTION_5_6@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_8_6()
{
  return swift_allocObject();
}

uint64_t sub_2459D9320()
{
  uint64_t v0;

  MEMORY[0x249540954](*(_QWORD *)(v0 + 16), -1, -1);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Locker()
{
  return objc_opt_self();
}

void sub_2459D936C(void (*a1)(void))
{
  uint64_t v1;
  os_unfair_lock_s *v3;

  v3 = *(os_unfair_lock_s **)(v1 + 16);
  os_unfair_lock_lock(v3);
  a1();
  os_unfair_lock_unlock(v3);
}

uint64_t sub_2459D93BC()
{
  return MEMORY[0x24BDCB1A8]();
}

uint64_t sub_2459D93C8()
{
  return MEMORY[0x24BDCB1B0]();
}

uint64_t sub_2459D93D4()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_2459D93E0()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_2459D93EC()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_2459D93F8()
{
  return MEMORY[0x24BDCB7C8]();
}

uint64_t sub_2459D9404()
{
  return MEMORY[0x24BDCB958]();
}

uint64_t sub_2459D9410()
{
  return MEMORY[0x24BDCB960]();
}

uint64_t sub_2459D941C()
{
  return MEMORY[0x24BDCB980]();
}

uint64_t sub_2459D9428()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t sub_2459D9434()
{
  return MEMORY[0x24BDCBA58]();
}

uint64_t sub_2459D9440()
{
  return MEMORY[0x24BDCBA60]();
}

uint64_t sub_2459D944C()
{
  return MEMORY[0x24BDCBAB0]();
}

uint64_t sub_2459D9458()
{
  return MEMORY[0x24BDCBAC0]();
}

uint64_t sub_2459D9464()
{
  return MEMORY[0x24BDCBB30]();
}

uint64_t sub_2459D9470()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_2459D947C()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_2459D9488()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_2459D9494()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_2459D94A0()
{
  return MEMORY[0x24BDCC650]();
}

uint64_t sub_2459D94AC()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_2459D94B8()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_2459D94C4()
{
  return MEMORY[0x24BDCD830]();
}

uint64_t sub_2459D94D0()
{
  return MEMORY[0x24BDCD958]();
}

uint64_t sub_2459D94DC()
{
  return MEMORY[0x24BDCD980]();
}

uint64_t sub_2459D94E8()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_2459D94F4()
{
  return MEMORY[0x24BDCD9D8]();
}

uint64_t sub_2459D9500()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_2459D950C()
{
  return MEMORY[0x24BDCDA10]();
}

uint64_t sub_2459D9518()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_2459D9524()
{
  return MEMORY[0x24BDCDAA8]();
}

uint64_t sub_2459D9530()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2459D953C()
{
  return MEMORY[0x24BDCDB58]();
}

uint64_t sub_2459D9548()
{
  return MEMORY[0x24BDCDB68]();
}

uint64_t sub_2459D9554()
{
  return MEMORY[0x24BDCDBD0]();
}

uint64_t sub_2459D9560()
{
  return MEMORY[0x24BDCDC58]();
}

uint64_t sub_2459D956C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2459D9578()
{
  return MEMORY[0x24BDCDD00]();
}

uint64_t sub_2459D9584()
{
  return MEMORY[0x24BDCDD10]();
}

uint64_t sub_2459D9590()
{
  return MEMORY[0x24BDCE2E8]();
}

uint64_t sub_2459D959C()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_2459D95A8()
{
  return MEMORY[0x24BDCE628]();
}

uint64_t sub_2459D95B4()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_2459D95C0()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_2459D95CC()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_2459D95D8()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2459D95E4()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_2459D95F0()
{
  return MEMORY[0x24BDCECE0]();
}

uint64_t sub_2459D95FC()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_2459D9608()
{
  return MEMORY[0x24BE712F8]();
}

uint64_t sub_2459D9614()
{
  return MEMORY[0x24BE71318]();
}

uint64_t sub_2459D9620()
{
  return MEMORY[0x24BE71320]();
}

uint64_t sub_2459D962C()
{
  return MEMORY[0x24BE71338]();
}

uint64_t sub_2459D9638()
{
  return MEMORY[0x24BE715C0]();
}

uint64_t sub_2459D9644()
{
  return MEMORY[0x24BE715C8]();
}

uint64_t sub_2459D9650()
{
  return MEMORY[0x24BE715D0]();
}

uint64_t sub_2459D965C()
{
  return MEMORY[0x24BE715E0]();
}

uint64_t sub_2459D9668()
{
  return MEMORY[0x24BEE76E8]();
}

uint64_t sub_2459D9674()
{
  return MEMORY[0x24BEE76F8]();
}

uint64_t sub_2459D9680()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_2459D968C()
{
  return MEMORY[0x24BEE7710]();
}

uint64_t sub_2459D9698()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_2459D96A4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2459D96B0()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2459D96BC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2459D96C8()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_2459D96D4()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2459D96E0()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2459D96EC()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_2459D96F8()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_2459D9704()
{
  return MEMORY[0x24BEE0418]();
}

uint64_t sub_2459D9710()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2459D971C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2459D9728()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2459D9734()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_2459D9740()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_2459D974C()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_2459D9758()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_2459D9764()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2459D9770()
{
  return MEMORY[0x24BEE0A70]();
}

uint64_t sub_2459D977C()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_2459D9788()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2459D9794()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_2459D97A0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2459D97AC()
{
  return MEMORY[0x24BEE0BD0]();
}

uint64_t sub_2459D97B8()
{
  return MEMORY[0x24BEE0BD8]();
}

uint64_t sub_2459D97C4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2459D97D0()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_2459D97DC()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_2459D97E8()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_2459D97F4()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_2459D9800()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_2459D980C()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_2459D9818()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_2459D9824()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_2459D9830()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2459D983C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2459D9848()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2459D9854()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2459D9860()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_2459D986C()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_2459D9878()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_2459D9884()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2459D9890()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2459D989C()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_2459D98A8()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t sub_2459D98B4()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_2459D98C0()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2459D98CC()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2459D98D8()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2459D98E4()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_2459D98F0()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2459D98FC()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_2459D9908()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_2459D9914()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_2459D9920()
{
  return MEMORY[0x24BEE7978]();
}

uint64_t sub_2459D992C()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_2459D9938()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2459D9944()
{
  return MEMORY[0x24BDD0498]();
}

uint64_t sub_2459D9950()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2459D995C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2459D9968()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_2459D9974()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_2459D9980()
{
  return MEMORY[0x24BDD0590]();
}

uint64_t sub_2459D998C()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_2459D9998()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_2459D99A4()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_2459D99B0()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_2459D99BC()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2459D99C8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2459D99D4()
{
  return MEMORY[0x24BEE25B8]();
}

uint64_t sub_2459D99E0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2459D99EC()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_2459D99F8()
{
  return MEMORY[0x24BEE2E68]();
}

uint64_t sub_2459D9A04()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_2459D9A10()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2459D9A1C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2459D9A28()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2459D9A34()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2459D9A40()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2459D9A4C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2459D9A58()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2459D9A64()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2459D9A70()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_2459D9A7C()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2459D9A88()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2459D9A94()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_2459D9AA0()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2459D9AAC()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2459D9AB8()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_2459D9AC4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2459D9AD0()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_2459D9ADC()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2459D9AE8()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2459D9AF4()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2459D9B00()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2459D9B0C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2459D9B18()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_2459D9B24()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2459D9B30()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2459D9B3C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2459D9B48()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2459D9B54()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2459D9B60()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2459D9B6C()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFHostIsDomainTopLevel()
{
  return MEMORY[0x24BDB7560]();
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

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x24BDE0960]();
}

uint64_t nw_activity_is_activated()
{
  return MEMORY[0x24BDE09D0]();
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

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7C8](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x24BDAF7D8](a1, a2);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x24BDAF7F0](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x24BDAF800](a1, a2);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
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

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

uint64_t swift_weakAssign()
{
  return MEMORY[0x24BEE5010]();
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

