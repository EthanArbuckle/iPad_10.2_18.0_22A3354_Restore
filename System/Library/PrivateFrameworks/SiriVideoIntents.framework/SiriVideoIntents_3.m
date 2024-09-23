uint64_t SearchAttributes.__allocating_init(identifier:display:pronunciationHint:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7_58();
  if (v5)
  {
    sub_21E9D8500();
    OUTLINED_FUNCTION_8_60();
  }
  else
  {
    v0 = 0;
  }
  OUTLINED_FUNCTION_12_40();
  OUTLINED_FUNCTION_10_43();
  if (v3)
  {
    OUTLINED_FUNCTION_13_46();
    OUTLINED_FUNCTION_11_51();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(OUTLINED_FUNCTION_1_54(), sel_initWithIdentifier_displayString_pronunciationHint_, v0, v2, v4);
  OUTLINED_FUNCTION_35_17();

  return v1;
}

void *SearchAttributes.init(identifier:display:pronunciationHint:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  OUTLINED_FUNCTION_7_58();
  if (v5)
  {
    sub_21E9D8500();
    OUTLINED_FUNCTION_8_60();
  }
  else
  {
    v0 = 0;
  }
  OUTLINED_FUNCTION_12_40();
  OUTLINED_FUNCTION_10_43();
  if (v3)
  {
    OUTLINED_FUNCTION_13_46();
    OUTLINED_FUNCTION_11_51();
  }
  else
  {
    v4 = 0;
  }
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for SearchAttributes();
  objc_msgSendSuper2(&v7, sel_initWithIdentifier_displayString_pronunciationHint_, v0, v2, v4);
  OUTLINED_FUNCTION_35_17();

  return v1;
}

uint64_t type metadata accessor for SearchAttributes()
{
  return objc_opt_self();
}

uint64_t SearchAttributes.__allocating_init(coder:)(uint64_t a1)
{
  uint64_t v1;

  objc_msgSend(OUTLINED_FUNCTION_1_54(), sel_initWithCoder_, a1);
  OUTLINED_FUNCTION_35_17();
  return v1;
}

void *SearchAttributes.init(coder:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for SearchAttributes();
  OUTLINED_FUNCTION_2_57((uint64_t)v8.super_class, sel_initWithCoder_, v1, v2, v3, v4, v5, v6, v8);
  OUTLINED_FUNCTION_35_17();
  return v0;
}

id SearchAttributes.__deallocating_deinit()
{
  return sub_21E9CDE7C(type metadata accessor for SearchAttributes);
}

id static SearchAttributesResolutionResult.success(with:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v8.receiver = (id)OUTLINED_FUNCTION_9_53();
  v8.super_class = (Class)&OBJC_METACLASS___SearchAttributesResolutionResult;
  v6 = OUTLINED_FUNCTION_2_57((uint64_t)v8.receiver, sel_successWithResolvedObject_, v0, v1, v2, v3, v4, v5, v8);
  return OUTLINED_FUNCTION_1_55(v6);
}

void static SearchAttributesResolutionResult.disambiguation(with:)(unint64_t a1)
{
  void *ObjCClassFromMetadata;
  void *v2;
  id v3;
  objc_super v4;

  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_14_47();
    swift_bridgeObjectRetain();
    sub_21E9D8B9C();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_21E9D8D4C();
    OUTLINED_FUNCTION_14_47();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  OUTLINED_FUNCTION_14_47();
  v2 = (void *)sub_21E9D86A4();
  swift_bridgeObjectRelease();
  v4.receiver = ObjCClassFromMetadata;
  v4.super_class = (Class)&OBJC_METACLASS___SearchAttributesResolutionResult;
  v3 = objc_msgSendSuper2(&v4, sel_disambiguationWithObjectsToDisambiguate_, v2);

  OUTLINED_FUNCTION_145_1();
}

id static SearchAttributesResolutionResult.confirmationRequired(with:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v8.receiver = (id)OUTLINED_FUNCTION_9_53();
  v8.super_class = (Class)&OBJC_METACLASS___SearchAttributesResolutionResult;
  v6 = OUTLINED_FUNCTION_2_57((uint64_t)v8.receiver, sel_confirmationRequiredWithObjectToConfirm_, v0, v1, v2, v3, v4, v5, v8);
  return OUTLINED_FUNCTION_1_55(v6);
}

void static SearchAttributesResolutionResult.success(with:)()
{
  OUTLINED_FUNCTION_0_76();
  __break(1u);
}

void static SearchAttributesResolutionResult.disambiguation(with:)()
{
  OUTLINED_FUNCTION_0_76();
  __break(1u);
}

void static SearchAttributesResolutionResult.confirmationRequired(with:)()
{
  OUTLINED_FUNCTION_0_76();
  __break(1u);
}

id SearchAttributesResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  id v5;

  v4 = OUTLINED_FUNCTION_1_54();
  sub_21E9D84A0();
  OUTLINED_FUNCTION_38_20();
  v5 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v2, a2);

  return v5;
}

void SearchAttributesResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v5;
  objc_super v6;

  sub_21E9D84A0();
  OUTLINED_FUNCTION_38_20();
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for SearchAttributesResolutionResult();
  objc_msgSendSuper2(&v6, sel_initWithJSONDictionary_forIntent_, v3, a2);
  OUTLINED_FUNCTION_35_17();
  v5 = v2;

  if (v5)
  OUTLINED_FUNCTION_145_1();
}

uint64_t type metadata accessor for SearchAttributesResolutionResult()
{
  return objc_opt_self();
}

id SearchAttributesResolutionResult.__deallocating_deinit()
{
  return sub_21E9CDE7C(type metadata accessor for SearchAttributesResolutionResult);
}

uint64_t OUTLINED_FUNCTION_0_76()
{
  return sub_21E9D8B90();
}

id static LiveServiceResolutionResult.success(with:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v8.receiver = (id)OUTLINED_FUNCTION_9_53();
  v8.super_class = (Class)&OBJC_METACLASS___LiveServiceResolutionResult;
  v6 = OUTLINED_FUNCTION_2_57((uint64_t)v8.receiver, sel_successWithResolvedObject_, v0, v1, v2, v3, v4, v5, v8);
  return OUTLINED_FUNCTION_1_55(v6);
}

void static LiveServiceResolutionResult.disambiguation(with:)(unint64_t a1)
{
  void *ObjCClassFromMetadata;
  void *v2;
  id v3;
  objc_super v4;

  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_14_47();
    swift_bridgeObjectRetain();
    sub_21E9D8B9C();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_21E9D8D4C();
    OUTLINED_FUNCTION_14_47();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  OUTLINED_FUNCTION_14_47();
  v2 = (void *)sub_21E9D86A4();
  swift_bridgeObjectRelease();
  v4.receiver = ObjCClassFromMetadata;
  v4.super_class = (Class)&OBJC_METACLASS___LiveServiceResolutionResult;
  v3 = objc_msgSendSuper2(&v4, sel_disambiguationWithObjectsToDisambiguate_, v2);

  OUTLINED_FUNCTION_145_1();
}

id static LiveServiceResolutionResult.confirmationRequired(with:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v8.receiver = (id)OUTLINED_FUNCTION_9_53();
  v8.super_class = (Class)&OBJC_METACLASS___LiveServiceResolutionResult;
  v6 = OUTLINED_FUNCTION_2_57((uint64_t)v8.receiver, sel_confirmationRequiredWithObjectToConfirm_, v0, v1, v2, v3, v4, v5, v8);
  return OUTLINED_FUNCTION_1_55(v6);
}

uint64_t static LiveService.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t LiveService.__allocating_init(identifier:display:pronunciationHint:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7_58();
  if (v5)
  {
    sub_21E9D8500();
    OUTLINED_FUNCTION_8_60();
  }
  else
  {
    v0 = 0;
  }
  OUTLINED_FUNCTION_12_40();
  OUTLINED_FUNCTION_10_43();
  if (v3)
  {
    OUTLINED_FUNCTION_13_46();
    OUTLINED_FUNCTION_11_51();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(OUTLINED_FUNCTION_1_54(), sel_initWithIdentifier_displayString_pronunciationHint_, v0, v2, v4);
  OUTLINED_FUNCTION_35_17();

  return v1;
}

void *LiveService.init(identifier:display:pronunciationHint:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  OUTLINED_FUNCTION_7_58();
  if (v5)
  {
    sub_21E9D8500();
    OUTLINED_FUNCTION_8_60();
  }
  else
  {
    v0 = 0;
  }
  OUTLINED_FUNCTION_12_40();
  OUTLINED_FUNCTION_10_43();
  if (v3)
  {
    OUTLINED_FUNCTION_13_46();
    OUTLINED_FUNCTION_11_51();
  }
  else
  {
    v4 = 0;
  }
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for LiveService();
  objc_msgSendSuper2(&v7, sel_initWithIdentifier_displayString_pronunciationHint_, v0, v2, v4);
  OUTLINED_FUNCTION_35_17();

  return v1;
}

uint64_t type metadata accessor for LiveService()
{
  return objc_opt_self();
}

uint64_t LiveService.__allocating_init(coder:)(uint64_t a1)
{
  uint64_t v1;

  objc_msgSend(OUTLINED_FUNCTION_1_54(), sel_initWithCoder_, a1);
  OUTLINED_FUNCTION_35_17();
  return v1;
}

void *LiveService.init(coder:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for LiveService();
  OUTLINED_FUNCTION_2_57((uint64_t)v8.super_class, sel_initWithCoder_, v1, v2, v3, v4, v5, v6, v8);
  OUTLINED_FUNCTION_35_17();
  return v0;
}

id LiveService.__deallocating_deinit()
{
  return sub_21E9CDE7C(type metadata accessor for LiveService);
}

void static LiveServiceResolutionResult.success(with:)()
{
  OUTLINED_FUNCTION_0_77();
  __break(1u);
}

void static LiveServiceResolutionResult.disambiguation(with:)()
{
  OUTLINED_FUNCTION_0_77();
  __break(1u);
}

void static LiveServiceResolutionResult.confirmationRequired(with:)()
{
  OUTLINED_FUNCTION_0_77();
  __break(1u);
}

id LiveServiceResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  id v5;

  v4 = OUTLINED_FUNCTION_1_54();
  sub_21E9D84A0();
  OUTLINED_FUNCTION_38_20();
  v5 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v2, a2);

  return v5;
}

void LiveServiceResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v5;
  objc_super v6;

  sub_21E9D84A0();
  OUTLINED_FUNCTION_38_20();
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for LiveServiceResolutionResult();
  objc_msgSendSuper2(&v6, sel_initWithJSONDictionary_forIntent_, v3, a2);
  OUTLINED_FUNCTION_35_17();
  v5 = v2;

  if (v5)
  OUTLINED_FUNCTION_145_1();
}

uint64_t type metadata accessor for LiveServiceResolutionResult()
{
  return objc_opt_self();
}

id LiveServiceResolutionResult.__deallocating_deinit()
{
  return sub_21E9CDE7C(type metadata accessor for LiveServiceResolutionResult);
}

uint64_t OUTLINED_FUNCTION_0_77()
{
  return sub_21E9D8B90();
}

uint64_t static UtsSearchParam.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t UtsSearchParam.__allocating_init(identifier:display:pronunciationHint:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7_58();
  if (v5)
  {
    sub_21E9D8500();
    OUTLINED_FUNCTION_8_60();
  }
  else
  {
    v0 = 0;
  }
  OUTLINED_FUNCTION_12_40();
  OUTLINED_FUNCTION_10_43();
  if (v3)
  {
    OUTLINED_FUNCTION_13_46();
    OUTLINED_FUNCTION_11_51();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(OUTLINED_FUNCTION_1_54(), sel_initWithIdentifier_displayString_pronunciationHint_, v0, v2, v4);
  OUTLINED_FUNCTION_35_17();

  return v1;
}

void *UtsSearchParam.init(identifier:display:pronunciationHint:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  OUTLINED_FUNCTION_7_58();
  if (v5)
  {
    sub_21E9D8500();
    OUTLINED_FUNCTION_8_60();
  }
  else
  {
    v0 = 0;
  }
  OUTLINED_FUNCTION_12_40();
  OUTLINED_FUNCTION_10_43();
  if (v3)
  {
    OUTLINED_FUNCTION_13_46();
    OUTLINED_FUNCTION_11_51();
  }
  else
  {
    v4 = 0;
  }
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for UtsSearchParam();
  objc_msgSendSuper2(&v7, sel_initWithIdentifier_displayString_pronunciationHint_, v0, v2, v4);
  OUTLINED_FUNCTION_35_17();

  return v1;
}

uint64_t type metadata accessor for UtsSearchParam()
{
  return objc_opt_self();
}

uint64_t UtsSearchParam.__allocating_init(coder:)(uint64_t a1)
{
  uint64_t v1;

  objc_msgSend(OUTLINED_FUNCTION_1_54(), sel_initWithCoder_, a1);
  OUTLINED_FUNCTION_35_17();
  return v1;
}

void *UtsSearchParam.init(coder:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for UtsSearchParam();
  OUTLINED_FUNCTION_2_57((uint64_t)v8.super_class, sel_initWithCoder_, v1, v2, v3, v4, v5, v6, v8);
  OUTLINED_FUNCTION_35_17();
  return v0;
}

id UtsSearchParam.__deallocating_deinit()
{
  return sub_21E9CDE7C(type metadata accessor for UtsSearchParam);
}

id static UtsSearchParamResolutionResult.success(with:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v8.receiver = (id)OUTLINED_FUNCTION_9_53();
  v8.super_class = (Class)&OBJC_METACLASS___UtsSearchParamResolutionResult;
  v6 = OUTLINED_FUNCTION_2_57((uint64_t)v8.receiver, sel_successWithResolvedObject_, v0, v1, v2, v3, v4, v5, v8);
  return OUTLINED_FUNCTION_1_55(v6);
}

void static UtsSearchParamResolutionResult.disambiguation(with:)(unint64_t a1)
{
  void *ObjCClassFromMetadata;
  void *v2;
  id v3;
  objc_super v4;

  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_14_47();
    swift_bridgeObjectRetain();
    sub_21E9D8B9C();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_21E9D8D4C();
    OUTLINED_FUNCTION_14_47();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  OUTLINED_FUNCTION_14_47();
  v2 = (void *)sub_21E9D86A4();
  swift_bridgeObjectRelease();
  v4.receiver = ObjCClassFromMetadata;
  v4.super_class = (Class)&OBJC_METACLASS___UtsSearchParamResolutionResult;
  v3 = objc_msgSendSuper2(&v4, sel_disambiguationWithObjectsToDisambiguate_, v2);

  OUTLINED_FUNCTION_145_1();
}

id static UtsSearchParamResolutionResult.confirmationRequired(with:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v8.receiver = (id)OUTLINED_FUNCTION_9_53();
  v8.super_class = (Class)&OBJC_METACLASS___UtsSearchParamResolutionResult;
  v6 = OUTLINED_FUNCTION_2_57((uint64_t)v8.receiver, sel_confirmationRequiredWithObjectToConfirm_, v0, v1, v2, v3, v4, v5, v8);
  return OUTLINED_FUNCTION_1_55(v6);
}

void static UtsSearchParamResolutionResult.success(with:)()
{
  OUTLINED_FUNCTION_0_78();
  __break(1u);
}

void static UtsSearchParamResolutionResult.disambiguation(with:)()
{
  OUTLINED_FUNCTION_0_78();
  __break(1u);
}

void static UtsSearchParamResolutionResult.confirmationRequired(with:)()
{
  OUTLINED_FUNCTION_0_78();
  __break(1u);
}

id UtsSearchParamResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  id v5;

  v4 = OUTLINED_FUNCTION_1_54();
  sub_21E9D84A0();
  OUTLINED_FUNCTION_38_20();
  v5 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v2, a2);

  return v5;
}

void UtsSearchParamResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v5;
  objc_super v6;

  sub_21E9D84A0();
  OUTLINED_FUNCTION_38_20();
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for UtsSearchParamResolutionResult();
  objc_msgSendSuper2(&v6, sel_initWithJSONDictionary_forIntent_, v3, a2);
  OUTLINED_FUNCTION_35_17();
  v5 = v2;

  if (v5)
  OUTLINED_FUNCTION_145_1();
}

uint64_t type metadata accessor for UtsSearchParamResolutionResult()
{
  return objc_opt_self();
}

id UtsSearchParamResolutionResult.__deallocating_deinit()
{
  return sub_21E9CDE7C(type metadata accessor for UtsSearchParamResolutionResult);
}

uint64_t OUTLINED_FUNCTION_0_78()
{
  return sub_21E9D8B90();
}

uint64_t static ResultEntity.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t ResultEntity.__allocating_init(identifier:display:pronunciationHint:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7_58();
  if (v5)
  {
    sub_21E9D8500();
    OUTLINED_FUNCTION_8_60();
  }
  else
  {
    v0 = 0;
  }
  OUTLINED_FUNCTION_12_40();
  OUTLINED_FUNCTION_10_43();
  if (v3)
  {
    OUTLINED_FUNCTION_13_46();
    OUTLINED_FUNCTION_11_51();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(OUTLINED_FUNCTION_1_54(), sel_initWithIdentifier_displayString_pronunciationHint_, v0, v2, v4);
  OUTLINED_FUNCTION_35_17();

  return v1;
}

void *ResultEntity.init(identifier:display:pronunciationHint:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  OUTLINED_FUNCTION_7_58();
  if (v5)
  {
    sub_21E9D8500();
    OUTLINED_FUNCTION_8_60();
  }
  else
  {
    v0 = 0;
  }
  OUTLINED_FUNCTION_12_40();
  OUTLINED_FUNCTION_10_43();
  if (v3)
  {
    OUTLINED_FUNCTION_13_46();
    OUTLINED_FUNCTION_11_51();
  }
  else
  {
    v4 = 0;
  }
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for ResultEntity();
  objc_msgSendSuper2(&v7, sel_initWithIdentifier_displayString_pronunciationHint_, v0, v2, v4);
  OUTLINED_FUNCTION_35_17();

  return v1;
}

uint64_t type metadata accessor for ResultEntity()
{
  return objc_opt_self();
}

uint64_t ResultEntity.__allocating_init(coder:)(uint64_t a1)
{
  uint64_t v1;

  objc_msgSend(OUTLINED_FUNCTION_1_54(), sel_initWithCoder_, a1);
  OUTLINED_FUNCTION_35_17();
  return v1;
}

void *ResultEntity.init(coder:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for ResultEntity();
  OUTLINED_FUNCTION_2_57((uint64_t)v8.super_class, sel_initWithCoder_, v1, v2, v3, v4, v5, v6, v8);
  OUTLINED_FUNCTION_35_17();
  return v0;
}

id ResultEntity.__deallocating_deinit()
{
  return sub_21E9CDE7C(type metadata accessor for ResultEntity);
}

id static ResultEntityResolutionResult.success(with:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v8.receiver = (id)OUTLINED_FUNCTION_9_53();
  v8.super_class = (Class)&OBJC_METACLASS___ResultEntityResolutionResult;
  v6 = OUTLINED_FUNCTION_2_57((uint64_t)v8.receiver, sel_successWithResolvedObject_, v0, v1, v2, v3, v4, v5, v8);
  return OUTLINED_FUNCTION_1_55(v6);
}

void static ResultEntityResolutionResult.disambiguation(with:)(unint64_t a1)
{
  void *ObjCClassFromMetadata;
  void *v2;
  id v3;
  objc_super v4;

  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_14_47();
    swift_bridgeObjectRetain();
    sub_21E9D8B9C();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_21E9D8D4C();
    OUTLINED_FUNCTION_14_47();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  OUTLINED_FUNCTION_14_47();
  v2 = (void *)sub_21E9D86A4();
  swift_bridgeObjectRelease();
  v4.receiver = ObjCClassFromMetadata;
  v4.super_class = (Class)&OBJC_METACLASS___ResultEntityResolutionResult;
  v3 = objc_msgSendSuper2(&v4, sel_disambiguationWithObjectsToDisambiguate_, v2);

  OUTLINED_FUNCTION_145_1();
}

id static ResultEntityResolutionResult.confirmationRequired(with:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v8.receiver = (id)OUTLINED_FUNCTION_9_53();
  v8.super_class = (Class)&OBJC_METACLASS___ResultEntityResolutionResult;
  v6 = OUTLINED_FUNCTION_2_57((uint64_t)v8.receiver, sel_confirmationRequiredWithObjectToConfirm_, v0, v1, v2, v3, v4, v5, v8);
  return OUTLINED_FUNCTION_1_55(v6);
}

void static ResultEntityResolutionResult.success(with:)()
{
  OUTLINED_FUNCTION_0_73();
  __break(1u);
}

void static ResultEntityResolutionResult.disambiguation(with:)()
{
  OUTLINED_FUNCTION_0_73();
  __break(1u);
}

void static ResultEntityResolutionResult.confirmationRequired(with:)()
{
  OUTLINED_FUNCTION_0_73();
  __break(1u);
}

id ResultEntityResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  id v5;

  v4 = OUTLINED_FUNCTION_1_54();
  sub_21E9D84A0();
  OUTLINED_FUNCTION_38_20();
  v5 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v2, a2);

  return v5;
}

void ResultEntityResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v5;
  objc_super v6;

  sub_21E9D84A0();
  OUTLINED_FUNCTION_38_20();
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for ResultEntityResolutionResult();
  objc_msgSendSuper2(&v6, sel_initWithJSONDictionary_forIntent_, v3, a2);
  OUTLINED_FUNCTION_35_17();
  v5 = v2;

  if (v5)
  OUTLINED_FUNCTION_145_1();
}

uint64_t type metadata accessor for ResultEntityResolutionResult()
{
  return objc_opt_self();
}

id ResultEntityResolutionResult.__deallocating_deinit()
{
  return sub_21E9CDE7C(type metadata accessor for ResultEntityResolutionResult);
}

uint64_t sub_21E9D6118()
{
  return MEMORY[0x24BDB4B50]();
}

uint64_t sub_21E9D6124()
{
  return MEMORY[0x24BDB4B60]();
}

uint64_t sub_21E9D6130()
{
  return MEMORY[0x24BDB4C70]();
}

uint64_t sub_21E9D613C()
{
  return MEMORY[0x24BDB4D38]();
}

uint64_t sub_21E9D6148()
{
  return MEMORY[0x24BDB4D40]();
}

uint64_t sub_21E9D6154()
{
  return MEMORY[0x24BDB5270]();
}

uint64_t sub_21E9D6160()
{
  return MEMORY[0x24BDB5278]();
}

uint64_t sub_21E9D616C()
{
  return MEMORY[0x24BDB5898]();
}

uint64_t sub_21E9D6178()
{
  return MEMORY[0x24BDB58A0]();
}

uint64_t sub_21E9D6184()
{
  return MEMORY[0x24BDB5CD8]();
}

uint64_t sub_21E9D6190()
{
  return MEMORY[0x24BDB5CF8]();
}

uint64_t sub_21E9D619C()
{
  return MEMORY[0x24BDB6170]();
}

uint64_t sub_21E9D61A8()
{
  return MEMORY[0x24BDB6180]();
}

uint64_t sub_21E9D61B4()
{
  return MEMORY[0x24BDCB068]();
}

uint64_t sub_21E9D61C0()
{
  return MEMORY[0x24BDCB088]();
}

uint64_t sub_21E9D61CC()
{
  return MEMORY[0x24BDCB0C0]();
}

uint64_t sub_21E9D61D8()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_21E9D61E4()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_21E9D61F0()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_21E9D61FC()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_21E9D6208()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_21E9D6214()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_21E9D6220()
{
  return MEMORY[0x24BDCB620]();
}

uint64_t sub_21E9D622C()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_21E9D6238()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_21E9D6244()
{
  return MEMORY[0x24BDCB958]();
}

uint64_t sub_21E9D6250()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t sub_21E9D625C()
{
  return MEMORY[0x24BDCBA60]();
}

uint64_t sub_21E9D6268()
{
  return MEMORY[0x24BDCBB08]();
}

uint64_t sub_21E9D6274()
{
  return MEMORY[0x24BDCBB68]();
}

uint64_t sub_21E9D6280()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_21E9D628C()
{
  return MEMORY[0x24BDCBCA0]();
}

uint64_t sub_21E9D6298()
{
  return MEMORY[0x24BDCBD18]();
}

uint64_t sub_21E9D62A4()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_21E9D62B0()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_21E9D62BC()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_21E9D62C8()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_21E9D62D4()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_21E9D62E0()
{
  return MEMORY[0x24BDCD520]();
}

uint64_t sub_21E9D62EC()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_21E9D62F8()
{
  return MEMORY[0x24BDCD860]();
}

uint64_t sub_21E9D6304()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_21E9D6310()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_21E9D631C()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_21E9D6328()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_21E9D6334()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_21E9D6340()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_21E9D634C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_21E9D6358()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_21E9D6364()
{
  return MEMORY[0x24BDCE2D8]();
}

uint64_t sub_21E9D6370()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_21E9D637C()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_21E9D6388()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_21E9D6394()
{
  return MEMORY[0x24BDCE628]();
}

uint64_t sub_21E9D63A0()
{
  return MEMORY[0x24BDCE778]();
}

uint64_t sub_21E9D63AC()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_21E9D63B8()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_21E9D63C4()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_21E9D63D0()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21E9D63DC()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_21E9D63E8()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_21E9D63F4()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_21E9D6400()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_21E9D640C()
{
  return MEMORY[0x24BDCEA18]();
}

uint64_t sub_21E9D6418()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_21E9D6424()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_21E9D6430()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_21E9D643C()
{
  return MEMORY[0x24BDCEBA0]();
}

uint64_t sub_21E9D6448()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_21E9D6454()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_21E9D6460()
{
  return MEMORY[0x24BDCF050]();
}

uint64_t sub_21E9D646C()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_21E9D6478()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_21E9D6484()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_21E9D6490()
{
  return MEMORY[0x24BDCF2D0]();
}

uint64_t sub_21E9D649C()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_21E9D64A8()
{
  return MEMORY[0x24BDCF500]();
}

uint64_t sub_21E9D64B4()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_21E9D64C0()
{
  return MEMORY[0x24BE6FBF8]();
}

uint64_t sub_21E9D64CC()
{
  return MEMORY[0x24BE6FC00]();
}

uint64_t sub_21E9D64D8()
{
  return MEMORY[0x24BE6FC10]();
}

uint64_t sub_21E9D64E4()
{
  return MEMORY[0x24BE6FC18]();
}

uint64_t sub_21E9D64F0()
{
  return MEMORY[0x24BE6FC40]();
}

uint64_t sub_21E9D64FC()
{
  return MEMORY[0x24BE6FC90]();
}

uint64_t sub_21E9D6508()
{
  return MEMORY[0x24BE70510]();
}

uint64_t sub_21E9D6514()
{
  return MEMORY[0x24BE70548]();
}

uint64_t sub_21E9D6520()
{
  return MEMORY[0x24BE70550]();
}

uint64_t sub_21E9D652C()
{
  return MEMORY[0x24BE70558]();
}

uint64_t sub_21E9D6538()
{
  return MEMORY[0x24BE70560]();
}

uint64_t sub_21E9D6544()
{
  return MEMORY[0x24BE70568]();
}

uint64_t sub_21E9D6550()
{
  return MEMORY[0x24BE70570]();
}

uint64_t sub_21E9D655C()
{
  return MEMORY[0x24BE70590]();
}

uint64_t sub_21E9D6568()
{
  return MEMORY[0x24BE70598]();
}

uint64_t sub_21E9D6574()
{
  return MEMORY[0x24BE705A0]();
}

uint64_t sub_21E9D6580()
{
  return MEMORY[0x24BE705A8]();
}

uint64_t sub_21E9D658C()
{
  return MEMORY[0x24BE705B0]();
}

uint64_t sub_21E9D6598()
{
  return MEMORY[0x24BE705B8]();
}

uint64_t sub_21E9D65A4()
{
  return MEMORY[0x24BE705C0]();
}

uint64_t sub_21E9D65B0()
{
  return MEMORY[0x24BE705C8]();
}

uint64_t sub_21E9D65BC()
{
  return MEMORY[0x24BE705D0]();
}

uint64_t sub_21E9D65C8()
{
  return MEMORY[0x24BE705D8]();
}

uint64_t sub_21E9D65D4()
{
  return MEMORY[0x24BE705F8]();
}

uint64_t sub_21E9D65E0()
{
  return MEMORY[0x24BE70638]();
}

uint64_t sub_21E9D65EC()
{
  return MEMORY[0x24BE70648]();
}

uint64_t sub_21E9D65F8()
{
  return MEMORY[0x24BE70650]();
}

uint64_t sub_21E9D6604()
{
  return MEMORY[0x24BE70660]();
}

uint64_t sub_21E9D6610()
{
  return MEMORY[0x24BE70668]();
}

uint64_t sub_21E9D661C()
{
  return MEMORY[0x24BE70670]();
}

uint64_t sub_21E9D6628()
{
  return MEMORY[0x24BE70678]();
}

uint64_t sub_21E9D6634()
{
  return MEMORY[0x24BE70730]();
}

uint64_t sub_21E9D6640()
{
  return MEMORY[0x24BE70748]();
}

uint64_t sub_21E9D664C()
{
  return MEMORY[0x24BE70758]();
}

uint64_t sub_21E9D6658()
{
  return MEMORY[0x24BE70778]();
}

uint64_t sub_21E9D6664()
{
  return MEMORY[0x24BE70780]();
}

uint64_t sub_21E9D6670()
{
  return MEMORY[0x24BE70788]();
}

uint64_t sub_21E9D667C()
{
  return MEMORY[0x24BE70790]();
}

uint64_t sub_21E9D6688()
{
  return MEMORY[0x24BE70798]();
}

uint64_t sub_21E9D6694()
{
  return MEMORY[0x24BE707A8]();
}

uint64_t sub_21E9D66A0()
{
  return MEMORY[0x24BE707B0]();
}

uint64_t sub_21E9D66AC()
{
  return MEMORY[0x24BE707B8]();
}

uint64_t sub_21E9D66B8()
{
  return MEMORY[0x24BE707C0]();
}

uint64_t sub_21E9D66C4()
{
  return MEMORY[0x24BE707C8]();
}

uint64_t sub_21E9D66D0()
{
  return MEMORY[0x24BE707D0]();
}

uint64_t sub_21E9D66DC()
{
  return MEMORY[0x24BE707D8]();
}

uint64_t sub_21E9D66E8()
{
  return MEMORY[0x24BE707E0]();
}

uint64_t sub_21E9D66F4()
{
  return MEMORY[0x24BE707E8]();
}

uint64_t sub_21E9D6700()
{
  return MEMORY[0x24BE707F0]();
}

uint64_t sub_21E9D670C()
{
  return MEMORY[0x24BE707F8]();
}

uint64_t sub_21E9D6718()
{
  return MEMORY[0x24BE70940]();
}

uint64_t sub_21E9D6724()
{
  return MEMORY[0x24BE70948]();
}

uint64_t sub_21E9D6730()
{
  return MEMORY[0x24BE70950]();
}

uint64_t sub_21E9D673C()
{
  return MEMORY[0x24BE70958]();
}

uint64_t sub_21E9D6748()
{
  return MEMORY[0x24BE70960]();
}

uint64_t sub_21E9D6754()
{
  return MEMORY[0x24BE70968]();
}

uint64_t sub_21E9D6760()
{
  return MEMORY[0x24BE70970]();
}

uint64_t sub_21E9D676C()
{
  return MEMORY[0x24BE70978]();
}

uint64_t sub_21E9D6778()
{
  return MEMORY[0x24BE70980]();
}

uint64_t sub_21E9D6784()
{
  return MEMORY[0x24BE70988]();
}

uint64_t sub_21E9D6790()
{
  return MEMORY[0x24BE709B0]();
}

uint64_t sub_21E9D679C()
{
  return MEMORY[0x24BE709B8]();
}

uint64_t sub_21E9D67A8()
{
  return MEMORY[0x24BE709C0]();
}

uint64_t sub_21E9D67B4()
{
  return MEMORY[0x24BE709C8]();
}

uint64_t sub_21E9D67C0()
{
  return MEMORY[0x24BE709D0]();
}

uint64_t sub_21E9D67CC()
{
  return MEMORY[0x24BE709D8]();
}

uint64_t sub_21E9D67D8()
{
  return MEMORY[0x24BE709E0]();
}

uint64_t sub_21E9D67E4()
{
  return MEMORY[0x24BE709E8]();
}

uint64_t sub_21E9D67F0()
{
  return MEMORY[0x24BE709F0]();
}

uint64_t sub_21E9D67FC()
{
  return MEMORY[0x24BE709F8]();
}

uint64_t sub_21E9D6808()
{
  return MEMORY[0x24BE70A00]();
}

uint64_t sub_21E9D6814()
{
  return MEMORY[0x24BE70B08]();
}

uint64_t sub_21E9D6820()
{
  return MEMORY[0x24BE70B10]();
}

uint64_t sub_21E9D682C()
{
  return MEMORY[0x24BE70B20]();
}

uint64_t sub_21E9D6838()
{
  return MEMORY[0x24BE70B28]();
}

uint64_t sub_21E9D6844()
{
  return MEMORY[0x24BE70BA0]();
}

uint64_t sub_21E9D6850()
{
  return MEMORY[0x24BE70BA8]();
}

uint64_t sub_21E9D685C()
{
  return MEMORY[0x24BE70BB0]();
}

uint64_t sub_21E9D6868()
{
  return MEMORY[0x24BE70BB8]();
}

uint64_t sub_21E9D6874()
{
  return MEMORY[0x24BE70BC0]();
}

uint64_t sub_21E9D6880()
{
  return MEMORY[0x24BE70BC8]();
}

uint64_t sub_21E9D688C()
{
  return MEMORY[0x24BE70BD0]();
}

uint64_t sub_21E9D6898()
{
  return MEMORY[0x24BE70BD8]();
}

uint64_t sub_21E9D68A4()
{
  return MEMORY[0x24BE70CB0]();
}

uint64_t sub_21E9D68B0()
{
  return MEMORY[0x24BE70CB8]();
}

uint64_t sub_21E9D68BC()
{
  return MEMORY[0x24BE70CC0]();
}

uint64_t sub_21E9D68C8()
{
  return MEMORY[0x24BE70DF0]();
}

uint64_t sub_21E9D68D4()
{
  return MEMORY[0x24BE70DF8]();
}

uint64_t sub_21E9D68E0()
{
  return MEMORY[0x24BE70E00]();
}

uint64_t sub_21E9D68EC()
{
  return MEMORY[0x24BE70E08]();
}

uint64_t sub_21E9D68F8()
{
  return MEMORY[0x24BE70E10]();
}

uint64_t sub_21E9D6904()
{
  return MEMORY[0x24BE70E20]();
}

uint64_t sub_21E9D6910()
{
  return MEMORY[0x24BE70E28]();
}

uint64_t sub_21E9D691C()
{
  return MEMORY[0x24BE70E30]();
}

uint64_t sub_21E9D6928()
{
  return MEMORY[0x24BE70E40]();
}

uint64_t sub_21E9D6934()
{
  return MEMORY[0x24BE70E48]();
}

uint64_t sub_21E9D6940()
{
  return MEMORY[0x24BE70E50]();
}

uint64_t sub_21E9D694C()
{
  return MEMORY[0x24BE70E58]();
}

uint64_t sub_21E9D6958()
{
  return MEMORY[0x24BE70E60]();
}

uint64_t sub_21E9D6964()
{
  return MEMORY[0x24BE70E68]();
}

uint64_t sub_21E9D6970()
{
  return MEMORY[0x24BE70E70]();
}

uint64_t sub_21E9D697C()
{
  return MEMORY[0x24BE70E78]();
}

uint64_t sub_21E9D6988()
{
  return MEMORY[0x24BE70E80]();
}

uint64_t sub_21E9D6994()
{
  return MEMORY[0x24BE70E88]();
}

uint64_t sub_21E9D69A0()
{
  return MEMORY[0x24BE70E90]();
}

uint64_t sub_21E9D69AC()
{
  return MEMORY[0x24BE70E98]();
}

uint64_t sub_21E9D69B8()
{
  return MEMORY[0x24BE70EB0]();
}

uint64_t sub_21E9D69C4()
{
  return MEMORY[0x24BE70EF8]();
}

uint64_t sub_21E9D69D0()
{
  return MEMORY[0x24BE70F00]();
}

uint64_t sub_21E9D69DC()
{
  return MEMORY[0x24BE70FA8]();
}

uint64_t sub_21E9D69E8()
{
  return MEMORY[0x24BE70FB0]();
}

uint64_t sub_21E9D69F4()
{
  return MEMORY[0x24BE71070]();
}

uint64_t sub_21E9D6A00()
{
  return MEMORY[0x24BE71190]();
}

uint64_t sub_21E9D6A0C()
{
  return MEMORY[0x24BE71198]();
}

uint64_t sub_21E9D6A18()
{
  return MEMORY[0x24BEAA5D8]();
}

uint64_t sub_21E9D6A24()
{
  return MEMORY[0x24BEAA6A8]();
}

uint64_t sub_21E9D6A30()
{
  return MEMORY[0x24BEAAA28]();
}

uint64_t sub_21E9D6A3C()
{
  return MEMORY[0x24BEAAA68]();
}

uint64_t sub_21E9D6A48()
{
  return MEMORY[0x24BEAB3D8]();
}

uint64_t sub_21E9D6A54()
{
  return MEMORY[0x24BEAB428]();
}

uint64_t sub_21E9D6A60()
{
  return MEMORY[0x24BEAB4E0]();
}

uint64_t sub_21E9D6A6C()
{
  return MEMORY[0x24BEAB8F0]();
}

uint64_t sub_21E9D6A78()
{
  return MEMORY[0x24BEAD1B8]();
}

uint64_t sub_21E9D6A84()
{
  return MEMORY[0x24BEAD200]();
}

uint64_t sub_21E9D6A90()
{
  return MEMORY[0x24BEAD338]();
}

uint64_t sub_21E9D6A9C()
{
  return MEMORY[0x24BEAD340]();
}

uint64_t sub_21E9D6AA8()
{
  return MEMORY[0x24BEAD348]();
}

uint64_t sub_21E9D6AB4()
{
  return MEMORY[0x24BEAD350]();
}

uint64_t sub_21E9D6AC0()
{
  return MEMORY[0x24BEAD360]();
}

uint64_t sub_21E9D6ACC()
{
  return MEMORY[0x24BEAD3D0]();
}

uint64_t sub_21E9D6AD8()
{
  return MEMORY[0x24BEAD3E0]();
}

uint64_t sub_21E9D6AE4()
{
  return MEMORY[0x24BE95FD0]();
}

uint64_t sub_21E9D6AF0()
{
  return MEMORY[0x24BE95FE0]();
}

uint64_t sub_21E9D6AFC()
{
  return MEMORY[0x24BE95FF0]();
}

uint64_t sub_21E9D6B08()
{
  return MEMORY[0x24BE96000]();
}

uint64_t sub_21E9D6B14()
{
  return MEMORY[0x24BE96008]();
}

uint64_t sub_21E9D6B20()
{
  return MEMORY[0x24BE96018]();
}

uint64_t sub_21E9D6B2C()
{
  return MEMORY[0x24BE96028]();
}

uint64_t sub_21E9D6B38()
{
  return MEMORY[0x24BE96038]();
}

uint64_t sub_21E9D6B44()
{
  return MEMORY[0x24BE960B8]();
}

uint64_t sub_21E9D6B50()
{
  return MEMORY[0x24BE960C8]();
}

uint64_t sub_21E9D6B5C()
{
  return MEMORY[0x24BE960D0]();
}

uint64_t sub_21E9D6B68()
{
  return MEMORY[0x24BE960E0]();
}

uint64_t sub_21E9D6B74()
{
  return MEMORY[0x24BE96200]();
}

uint64_t sub_21E9D6B80()
{
  return MEMORY[0x24BE96210]();
}

uint64_t sub_21E9D6B8C()
{
  return MEMORY[0x24BE96220]();
}

uint64_t sub_21E9D6B98()
{
  return MEMORY[0x24BE96230]();
}

uint64_t sub_21E9D6BA4()
{
  return MEMORY[0x24BE96290]();
}

uint64_t sub_21E9D6BB0()
{
  return MEMORY[0x24BE962B0]();
}

uint64_t sub_21E9D6BBC()
{
  return MEMORY[0x24BE962B8]();
}

uint64_t sub_21E9D6BC8()
{
  return MEMORY[0x24BE962C8]();
}

uint64_t sub_21E9D6BD4()
{
  return MEMORY[0x24BE962D8]();
}

uint64_t sub_21E9D6BE0()
{
  return MEMORY[0x24BE962E0]();
}

uint64_t sub_21E9D6BEC()
{
  return MEMORY[0x24BE962F0]();
}

uint64_t sub_21E9D6BF8()
{
  return MEMORY[0x24BE96300]();
}

uint64_t sub_21E9D6C04()
{
  return MEMORY[0x24BE96310]();
}

uint64_t sub_21E9D6C10()
{
  return MEMORY[0x24BE96460]();
}

uint64_t sub_21E9D6C1C()
{
  return MEMORY[0x24BE96490]();
}

uint64_t sub_21E9D6C28()
{
  return MEMORY[0x24BE96498]();
}

uint64_t sub_21E9D6C34()
{
  return MEMORY[0x24BE964A0]();
}

uint64_t sub_21E9D6C40()
{
  return MEMORY[0x24BE964B0]();
}

uint64_t sub_21E9D6C4C()
{
  return MEMORY[0x24BE964C0]();
}

uint64_t sub_21E9D6C58()
{
  return MEMORY[0x24BE964D0]();
}

uint64_t sub_21E9D6C64()
{
  return MEMORY[0x24BE964D8]();
}

uint64_t sub_21E9D6C70()
{
  return MEMORY[0x24BE96550]();
}

uint64_t sub_21E9D6C7C()
{
  return MEMORY[0x24BE96560]();
}

uint64_t sub_21E9D6C88()
{
  return MEMORY[0x24BE96570]();
}

uint64_t sub_21E9D6C94()
{
  return MEMORY[0x24BE96580]();
}

uint64_t sub_21E9D6CA0()
{
  return MEMORY[0x24BE965B0]();
}

uint64_t sub_21E9D6CAC()
{
  return MEMORY[0x24BE96610]();
}

uint64_t sub_21E9D6CB8()
{
  return MEMORY[0x24BE96620]();
}

uint64_t sub_21E9D6CC4()
{
  return MEMORY[0x24BE96630]();
}

uint64_t sub_21E9D6CD0()
{
  return MEMORY[0x24BE966C0]();
}

uint64_t sub_21E9D6CDC()
{
  return MEMORY[0x24BE966D0]();
}

uint64_t sub_21E9D6CE8()
{
  return MEMORY[0x24BE966E0]();
}

uint64_t sub_21E9D6CF4()
{
  return MEMORY[0x24BE966E8]();
}

uint64_t sub_21E9D6D00()
{
  return MEMORY[0x24BE96738]();
}

uint64_t sub_21E9D6D0C()
{
  return MEMORY[0x24BE96840]();
}

uint64_t sub_21E9D6D18()
{
  return MEMORY[0x24BE96848]();
}

uint64_t sub_21E9D6D24()
{
  return MEMORY[0x24BE968C8]();
}

uint64_t sub_21E9D6D30()
{
  return MEMORY[0x24BE96910]();
}

uint64_t sub_21E9D6D3C()
{
  return MEMORY[0x24BE96BA8]();
}

uint64_t sub_21E9D6D48()
{
  return MEMORY[0x24BE96BB8]();
}

uint64_t sub_21E9D6D54()
{
  return MEMORY[0x24BE96BE0]();
}

uint64_t sub_21E9D6D60()
{
  return MEMORY[0x24BE96BF0]();
}

uint64_t sub_21E9D6D6C()
{
  return MEMORY[0x24BE96C00]();
}

uint64_t sub_21E9D6D78()
{
  return MEMORY[0x24BE96C10]();
}

uint64_t sub_21E9D6D84()
{
  return MEMORY[0x24BE96C30]();
}

uint64_t sub_21E9D6D90()
{
  return MEMORY[0x24BE96C70]();
}

uint64_t sub_21E9D6D9C()
{
  return MEMORY[0x24BE96C78]();
}

uint64_t sub_21E9D6DA8()
{
  return MEMORY[0x24BE96C88]();
}

uint64_t sub_21E9D6DB4()
{
  return MEMORY[0x24BE96C90]();
}

uint64_t sub_21E9D6DC0()
{
  return MEMORY[0x24BE96C98]();
}

uint64_t sub_21E9D6DCC()
{
  return MEMORY[0x24BE96CA0]();
}

uint64_t sub_21E9D6DD8()
{
  return MEMORY[0x24BE96CA8]();
}

uint64_t sub_21E9D6DE4()
{
  return MEMORY[0x24BE96CB8]();
}

uint64_t sub_21E9D6DF0()
{
  return MEMORY[0x24BE96CD0]();
}

uint64_t sub_21E9D6DFC()
{
  return MEMORY[0x24BE96E78]();
}

uint64_t sub_21E9D6E08()
{
  return MEMORY[0x24BE96E80]();
}

uint64_t sub_21E9D6E14()
{
  return MEMORY[0x24BE96E98]();
}

uint64_t sub_21E9D6E20()
{
  return MEMORY[0x24BE96EA0]();
}

uint64_t sub_21E9D6E2C()
{
  return MEMORY[0x24BE96EC0]();
}

uint64_t sub_21E9D6E38()
{
  return MEMORY[0x24BE96ED0]();
}

uint64_t sub_21E9D6E44()
{
  return MEMORY[0x24BE96EE8]();
}

uint64_t sub_21E9D6E50()
{
  return MEMORY[0x24BE96F08]();
}

uint64_t sub_21E9D6E5C()
{
  return MEMORY[0x24BE96FC0]();
}

uint64_t sub_21E9D6E68()
{
  return MEMORY[0x24BE96FE8]();
}

uint64_t sub_21E9D6E74()
{
  return MEMORY[0x24BE97000]();
}

uint64_t sub_21E9D6E80()
{
  return MEMORY[0x24BE97008]();
}

uint64_t sub_21E9D6E8C()
{
  return MEMORY[0x24BE97010]();
}

uint64_t sub_21E9D6E98()
{
  return MEMORY[0x24BE97038]();
}

uint64_t sub_21E9D6EA4()
{
  return MEMORY[0x24BE97040]();
}

uint64_t sub_21E9D6EB0()
{
  return MEMORY[0x24BE97058]();
}

uint64_t sub_21E9D6EBC()
{
  return MEMORY[0x24BE971F8]();
}

uint64_t sub_21E9D6EC8()
{
  return MEMORY[0x24BE97208]();
}

uint64_t sub_21E9D6ED4()
{
  return MEMORY[0x24BE97238]();
}

uint64_t sub_21E9D6EE0()
{
  return MEMORY[0x24BE97240]();
}

uint64_t sub_21E9D6EEC()
{
  return MEMORY[0x24BE97250]();
}

uint64_t sub_21E9D6EF8()
{
  return MEMORY[0x24BE97388]();
}

uint64_t sub_21E9D6F04()
{
  return MEMORY[0x24BE97398]();
}

uint64_t sub_21E9D6F10()
{
  return MEMORY[0x24BE973E0]();
}

uint64_t sub_21E9D6F1C()
{
  return MEMORY[0x24BE97550]();
}

uint64_t sub_21E9D6F28()
{
  return MEMORY[0x24BE975A8]();
}

uint64_t sub_21E9D6F34()
{
  return MEMORY[0x24BE975D8]();
}

uint64_t sub_21E9D6F40()
{
  return MEMORY[0x24BE975E0]();
}

uint64_t sub_21E9D6F4C()
{
  return MEMORY[0x24BE975E8]();
}

uint64_t sub_21E9D6F58()
{
  return MEMORY[0x24BE975F0]();
}

uint64_t sub_21E9D6F64()
{
  return MEMORY[0x24BE975F8]();
}

uint64_t sub_21E9D6F70()
{
  return MEMORY[0x24BE97608]();
}

uint64_t sub_21E9D6F7C()
{
  return MEMORY[0x24BE97618]();
}

uint64_t sub_21E9D6F88()
{
  return MEMORY[0x24BE97620]();
}

uint64_t sub_21E9D6F94()
{
  return MEMORY[0x24BE97628]();
}

uint64_t sub_21E9D6FA0()
{
  return MEMORY[0x24BE97630]();
}

uint64_t sub_21E9D6FAC()
{
  return MEMORY[0x24BE97638]();
}

uint64_t sub_21E9D6FB8()
{
  return MEMORY[0x24BE97640]();
}

uint64_t sub_21E9D6FC4()
{
  return MEMORY[0x24BE97648]();
}

uint64_t sub_21E9D6FD0()
{
  return MEMORY[0x24BE97650]();
}

uint64_t sub_21E9D6FDC()
{
  return MEMORY[0x24BE97658]();
}

uint64_t sub_21E9D6FE8()
{
  return MEMORY[0x24BE97660]();
}

uint64_t sub_21E9D6FF4()
{
  return MEMORY[0x24BE97668]();
}

uint64_t sub_21E9D7000()
{
  return MEMORY[0x24BE97670]();
}

uint64_t sub_21E9D700C()
{
  return MEMORY[0x24BE97678]();
}

uint64_t sub_21E9D7018()
{
  return MEMORY[0x24BE97680]();
}

uint64_t sub_21E9D7024()
{
  return MEMORY[0x24BE97688]();
}

uint64_t sub_21E9D7030()
{
  return MEMORY[0x24BE97690]();
}

uint64_t sub_21E9D703C()
{
  return MEMORY[0x24BE97698]();
}

uint64_t sub_21E9D7048()
{
  return MEMORY[0x24BE976A0]();
}

uint64_t sub_21E9D7054()
{
  return MEMORY[0x24BE976A8]();
}

uint64_t sub_21E9D7060()
{
  return MEMORY[0x24BE976B8]();
}

uint64_t sub_21E9D706C()
{
  return MEMORY[0x24BE976C0]();
}

uint64_t sub_21E9D7078()
{
  return MEMORY[0x24BE97700]();
}

uint64_t sub_21E9D7084()
{
  return MEMORY[0x24BE97718]();
}

uint64_t sub_21E9D7090()
{
  return MEMORY[0x24BE97720]();
}

uint64_t sub_21E9D709C()
{
  return MEMORY[0x24BE97728]();
}

uint64_t sub_21E9D70A8()
{
  return MEMORY[0x24BE97730]();
}

uint64_t sub_21E9D70B4()
{
  return MEMORY[0x24BE97770]();
}

uint64_t sub_21E9D70C0()
{
  return MEMORY[0x24BE97778]();
}

uint64_t sub_21E9D70CC()
{
  return MEMORY[0x24BE97780]();
}

uint64_t sub_21E9D70D8()
{
  return MEMORY[0x24BE97968]();
}

uint64_t sub_21E9D70E4()
{
  return MEMORY[0x24BE979E8]();
}

uint64_t sub_21E9D70F0()
{
  return MEMORY[0x24BE97A50]();
}

uint64_t sub_21E9D70FC()
{
  return MEMORY[0x24BE97A58]();
}

uint64_t sub_21E9D7108()
{
  return MEMORY[0x24BE97A60]();
}

uint64_t sub_21E9D7114()
{
  return MEMORY[0x24BE97A68]();
}

uint64_t sub_21E9D7120()
{
  return MEMORY[0x24BE97A70]();
}

uint64_t sub_21E9D712C()
{
  return MEMORY[0x24BE97A78]();
}

uint64_t sub_21E9D7138()
{
  return MEMORY[0x24BE97A80]();
}

uint64_t sub_21E9D7144()
{
  return MEMORY[0x24BE97A88]();
}

uint64_t sub_21E9D7150()
{
  return MEMORY[0x24BE97A90]();
}

uint64_t sub_21E9D715C()
{
  return MEMORY[0x24BE97A98]();
}

uint64_t sub_21E9D7168()
{
  return MEMORY[0x24BE97AA8]();
}

uint64_t sub_21E9D7174()
{
  return MEMORY[0x24BE97AB0]();
}

uint64_t sub_21E9D7180()
{
  return MEMORY[0x24BE97AB8]();
}

uint64_t sub_21E9D718C()
{
  return MEMORY[0x24BE97B10]();
}

uint64_t sub_21E9D7198()
{
  return MEMORY[0x24BE97C10]();
}

uint64_t sub_21E9D71A4()
{
  return MEMORY[0x24BE97C18]();
}

uint64_t sub_21E9D71B0()
{
  return MEMORY[0x24BE97C20]();
}

uint64_t sub_21E9D71BC()
{
  return MEMORY[0x24BE97C68]();
}

uint64_t sub_21E9D71C8()
{
  return MEMORY[0x24BE97C70]();
}

uint64_t sub_21E9D71D4()
{
  return MEMORY[0x24BE97C78]();
}

uint64_t sub_21E9D71E0()
{
  return MEMORY[0x24BE97C88]();
}

uint64_t sub_21E9D71EC()
{
  return MEMORY[0x24BE97C98]();
}

uint64_t sub_21E9D71F8()
{
  return MEMORY[0x24BE97CB0]();
}

uint64_t sub_21E9D7204()
{
  return MEMORY[0x24BE97CB8]();
}

uint64_t sub_21E9D7210()
{
  return MEMORY[0x24BE97CC0]();
}

uint64_t sub_21E9D721C()
{
  return MEMORY[0x24BE97CD0]();
}

uint64_t sub_21E9D7228()
{
  return MEMORY[0x24BE97CE0]();
}

uint64_t sub_21E9D7234()
{
  return MEMORY[0x24BE97CE8]();
}

uint64_t sub_21E9D7240()
{
  return MEMORY[0x24BE97D08]();
}

uint64_t sub_21E9D724C()
{
  return MEMORY[0x24BE97D10]();
}

uint64_t sub_21E9D7258()
{
  return MEMORY[0x24BE97D40]();
}

uint64_t sub_21E9D7264()
{
  return MEMORY[0x24BE97D48]();
}

uint64_t sub_21E9D7270()
{
  return MEMORY[0x24BE97D58]();
}

uint64_t sub_21E9D727C()
{
  return MEMORY[0x24BE97DA0]();
}

uint64_t sub_21E9D7288()
{
  return MEMORY[0x24BE97DA8]();
}

uint64_t sub_21E9D7294()
{
  return MEMORY[0x24BE97DB0]();
}

uint64_t sub_21E9D72A0()
{
  return MEMORY[0x24BE97DD0]();
}

uint64_t sub_21E9D72AC()
{
  return MEMORY[0x24BE97DE0]();
}

uint64_t sub_21E9D72B8()
{
  return MEMORY[0x24BE97DF0]();
}

uint64_t sub_21E9D72C4()
{
  return MEMORY[0x24BE97E08]();
}

uint64_t sub_21E9D72D0()
{
  return MEMORY[0x24BE97E18]();
}

uint64_t sub_21E9D72DC()
{
  return MEMORY[0x24BE97E20]();
}

uint64_t sub_21E9D72E8()
{
  return MEMORY[0x24BE97E30]();
}

uint64_t sub_21E9D72F4()
{
  return MEMORY[0x24BE97E48]();
}

uint64_t sub_21E9D7300()
{
  return MEMORY[0x24BE97E50]();
}

uint64_t sub_21E9D730C()
{
  return MEMORY[0x24BE97E58]();
}

uint64_t sub_21E9D7318()
{
  return MEMORY[0x24BE97E78]();
}

uint64_t sub_21E9D7324()
{
  return MEMORY[0x24BE97F28]();
}

uint64_t sub_21E9D7330()
{
  return MEMORY[0x24BE97F30]();
}

uint64_t sub_21E9D733C()
{
  return MEMORY[0x24BE97F80]();
}

uint64_t sub_21E9D7348()
{
  return MEMORY[0x24BE97FA8]();
}

uint64_t sub_21E9D7354()
{
  return MEMORY[0x24BE97FC0]();
}

uint64_t sub_21E9D7360()
{
  return MEMORY[0x24BE97FD8]();
}

uint64_t sub_21E9D736C()
{
  return MEMORY[0x24BE97FE0]();
}

uint64_t sub_21E9D7378()
{
  return MEMORY[0x24BE98098]();
}

uint64_t sub_21E9D7384()
{
  return MEMORY[0x24BE980A0]();
}

uint64_t sub_21E9D7390()
{
  return MEMORY[0x24BE980A8]();
}

uint64_t sub_21E9D739C()
{
  return MEMORY[0x24BE98168]();
}

uint64_t sub_21E9D73A8()
{
  return MEMORY[0x24BE98170]();
}

uint64_t sub_21E9D73B4()
{
  return MEMORY[0x24BE98180]();
}

uint64_t sub_21E9D73C0()
{
  return MEMORY[0x24BE98188]();
}

uint64_t sub_21E9D73CC()
{
  return MEMORY[0x24BE981B8]();
}

uint64_t sub_21E9D73D8()
{
  return MEMORY[0x24BE981C0]();
}

uint64_t sub_21E9D73E4()
{
  return MEMORY[0x24BE98258]();
}

uint64_t sub_21E9D73F0()
{
  return MEMORY[0x24BE98268]();
}

uint64_t sub_21E9D73FC()
{
  return MEMORY[0x24BE98278]();
}

uint64_t sub_21E9D7408()
{
  return MEMORY[0x24BE98298]();
}

uint64_t sub_21E9D7414()
{
  return MEMORY[0x24BE98338]();
}

uint64_t sub_21E9D7420()
{
  return MEMORY[0x24BE98340]();
}

uint64_t sub_21E9D742C()
{
  return MEMORY[0x24BE98348]();
}

uint64_t sub_21E9D7438()
{
  return MEMORY[0x24BE98358]();
}

uint64_t sub_21E9D7444()
{
  return MEMORY[0x24BE98360]();
}

uint64_t sub_21E9D7450()
{
  return MEMORY[0x24BE98370]();
}

uint64_t sub_21E9D745C()
{
  return MEMORY[0x24BE983D0]();
}

uint64_t sub_21E9D7468()
{
  return MEMORY[0x24BE983D8]();
}

uint64_t sub_21E9D7474()
{
  return MEMORY[0x24BE98408]();
}

uint64_t sub_21E9D7480()
{
  return MEMORY[0x24BE984A0]();
}

uint64_t sub_21E9D748C()
{
  return MEMORY[0x24BE984A8]();
}

uint64_t sub_21E9D7498()
{
  return MEMORY[0x24BE984F0]();
}

uint64_t sub_21E9D74A4()
{
  return MEMORY[0x24BE98500]();
}

uint64_t sub_21E9D74B0()
{
  return MEMORY[0x24BE98558]();
}

uint64_t sub_21E9D74BC()
{
  return MEMORY[0x24BE98578]();
}

uint64_t sub_21E9D74C8()
{
  return MEMORY[0x24BE985F0]();
}

uint64_t sub_21E9D74D4()
{
  return MEMORY[0x24BE98610]();
}

uint64_t sub_21E9D74E0()
{
  return MEMORY[0x24BE98620]();
}

uint64_t sub_21E9D74EC()
{
  return MEMORY[0x24BE98638]();
}

uint64_t sub_21E9D74F8()
{
  return MEMORY[0x24BE98640]();
}

uint64_t sub_21E9D7504()
{
  return MEMORY[0x24BE98660]();
}

uint64_t sub_21E9D7510()
{
  return MEMORY[0x24BE98670]();
}

uint64_t sub_21E9D751C()
{
  return MEMORY[0x24BE98678]();
}

uint64_t sub_21E9D7528()
{
  return MEMORY[0x24BE98698]();
}

uint64_t sub_21E9D7534()
{
  return MEMORY[0x24BE986A0]();
}

uint64_t sub_21E9D7540()
{
  return MEMORY[0x24BE986B0]();
}

uint64_t sub_21E9D754C()
{
  return MEMORY[0x24BE986B8]();
}

uint64_t sub_21E9D7558()
{
  return MEMORY[0x24BE986D0]();
}

uint64_t sub_21E9D7564()
{
  return MEMORY[0x24BE986D8]();
}

uint64_t sub_21E9D7570()
{
  return MEMORY[0x24BE986E8]();
}

uint64_t sub_21E9D757C()
{
  return MEMORY[0x24BE98730]();
}

uint64_t sub_21E9D7588()
{
  return MEMORY[0x24BE98738]();
}

uint64_t sub_21E9D7594()
{
  return MEMORY[0x24BE98748]();
}

uint64_t sub_21E9D75A0()
{
  return MEMORY[0x24BE98750]();
}

uint64_t sub_21E9D75AC()
{
  return MEMORY[0x24BE98760]();
}

uint64_t sub_21E9D75B8()
{
  return MEMORY[0x24BE98768]();
}

uint64_t sub_21E9D75C4()
{
  return MEMORY[0x24BE98770]();
}

uint64_t sub_21E9D75D0()
{
  return MEMORY[0x24BE98808]();
}

uint64_t sub_21E9D75DC()
{
  return MEMORY[0x24BE98830]();
}

uint64_t sub_21E9D75E8()
{
  return MEMORY[0x24BE98848]();
}

uint64_t sub_21E9D75F4()
{
  return MEMORY[0x24BE98858]();
}

uint64_t sub_21E9D7600()
{
  return MEMORY[0x24BE98868]();
}

uint64_t sub_21E9D760C()
{
  return MEMORY[0x24BE98898]();
}

uint64_t sub_21E9D7618()
{
  return MEMORY[0x24BE988E0]();
}

uint64_t sub_21E9D7624()
{
  return MEMORY[0x24BE988F8]();
}

uint64_t sub_21E9D7630()
{
  return MEMORY[0x24BE98908]();
}

uint64_t sub_21E9D763C()
{
  return MEMORY[0x24BE98910]();
}

uint64_t sub_21E9D7648()
{
  return MEMORY[0x24BE98918]();
}

uint64_t sub_21E9D7654()
{
  return MEMORY[0x24BE98920]();
}

uint64_t sub_21E9D7660()
{
  return MEMORY[0x24BE98928]();
}

uint64_t sub_21E9D766C()
{
  return MEMORY[0x24BE98948]();
}

uint64_t sub_21E9D7678()
{
  return MEMORY[0x24BE98950]();
}

uint64_t sub_21E9D7684()
{
  return MEMORY[0x24BE98958]();
}

uint64_t sub_21E9D7690()
{
  return MEMORY[0x24BE98960]();
}

uint64_t sub_21E9D769C()
{
  return MEMORY[0x24BE98968]();
}

uint64_t sub_21E9D76A8()
{
  return MEMORY[0x24BE989A8]();
}

uint64_t sub_21E9D76B4()
{
  return MEMORY[0x24BE989B0]();
}

uint64_t sub_21E9D76C0()
{
  return MEMORY[0x24BE989B8]();
}

uint64_t sub_21E9D76CC()
{
  return MEMORY[0x24BE98A38]();
}

uint64_t sub_21E9D76D8()
{
  return MEMORY[0x24BE98A48]();
}

uint64_t sub_21E9D76E4()
{
  return MEMORY[0x24BE98A58]();
}

uint64_t sub_21E9D76F0()
{
  return MEMORY[0x24BE98A68]();
}

uint64_t sub_21E9D76FC()
{
  return MEMORY[0x24BE98A78]();
}

uint64_t sub_21E9D7708()
{
  return MEMORY[0x24BE98A88]();
}

uint64_t sub_21E9D7714()
{
  return MEMORY[0x24BE98A98]();
}

uint64_t sub_21E9D7720()
{
  return MEMORY[0x24BE98B38]();
}

uint64_t sub_21E9D772C()
{
  return MEMORY[0x24BE98B58]();
}

uint64_t sub_21E9D7738()
{
  return MEMORY[0x24BE98B68]();
}

uint64_t sub_21E9D7744()
{
  return MEMORY[0x24BE98B78]();
}

uint64_t sub_21E9D7750()
{
  return MEMORY[0x24BE98B88]();
}

uint64_t sub_21E9D775C()
{
  return MEMORY[0x24BE98C90]();
}

uint64_t sub_21E9D7768()
{
  return MEMORY[0x24BE98CA8]();
}

uint64_t sub_21E9D7774()
{
  return MEMORY[0x24BE98CB8]();
}

uint64_t sub_21E9D7780()
{
  return MEMORY[0x24BE98CF0]();
}

uint64_t sub_21E9D778C()
{
  return MEMORY[0x24BE98D18]();
}

uint64_t sub_21E9D7798()
{
  return MEMORY[0x24BE98D28]();
}

uint64_t sub_21E9D77A4()
{
  return MEMORY[0x24BE98DC0]();
}

uint64_t sub_21E9D77B0()
{
  return MEMORY[0x24BE98DD0]();
}

uint64_t sub_21E9D77BC()
{
  return MEMORY[0x24BE98DF0]();
}

uint64_t sub_21E9D77C8()
{
  return MEMORY[0x24BE98DF8]();
}

uint64_t sub_21E9D77D4()
{
  return MEMORY[0x24BE98E30]();
}

uint64_t sub_21E9D77E0()
{
  return MEMORY[0x24BE98E38]();
}

uint64_t sub_21E9D77EC()
{
  return MEMORY[0x24BE98E40]();
}

uint64_t sub_21E9D77F8()
{
  return MEMORY[0x24BE98EA8]();
}

uint64_t sub_21E9D7804()
{
  return MEMORY[0x24BE98EE0]();
}

uint64_t sub_21E9D7810()
{
  return MEMORY[0x24BE99050]();
}

uint64_t sub_21E9D781C()
{
  return MEMORY[0x24BE99078]();
}

uint64_t sub_21E9D7828()
{
  return MEMORY[0x24BE99080]();
}

uint64_t sub_21E9D7834()
{
  return MEMORY[0x24BE99090]();
}

uint64_t sub_21E9D7840()
{
  return MEMORY[0x24BEA6320]();
}

uint64_t sub_21E9D784C()
{
  return MEMORY[0x24BEA63E8]();
}

uint64_t sub_21E9D7858()
{
  return MEMORY[0x24BEA63F0]();
}

uint64_t sub_21E9D7864()
{
  return MEMORY[0x24BEA6408]();
}

uint64_t sub_21E9D7870()
{
  return MEMORY[0x24BEA6410]();
}

uint64_t sub_21E9D787C()
{
  return MEMORY[0x24BEA6418]();
}

uint64_t sub_21E9D7888()
{
  return MEMORY[0x24BEA6420]();
}

uint64_t sub_21E9D7894()
{
  return MEMORY[0x24BEA6428]();
}

uint64_t sub_21E9D78A0()
{
  return MEMORY[0x24BEA6430]();
}

uint64_t sub_21E9D78AC()
{
  return MEMORY[0x24BEA6448]();
}

uint64_t sub_21E9D78B8()
{
  return MEMORY[0x24BEA6460]();
}

uint64_t sub_21E9D78C4()
{
  return MEMORY[0x24BEA6468]();
}

uint64_t sub_21E9D78D0()
{
  return MEMORY[0x24BEA6548]();
}

uint64_t sub_21E9D78DC()
{
  return MEMORY[0x24BEA6550]();
}

uint64_t sub_21E9D78E8()
{
  return MEMORY[0x24BEA65A0]();
}

uint64_t sub_21E9D78F4()
{
  return MEMORY[0x24BEA65A8]();
}

uint64_t sub_21E9D7900()
{
  return MEMORY[0x24BEA65C0]();
}

uint64_t sub_21E9D790C()
{
  return MEMORY[0x24BEA65C8]();
}

uint64_t sub_21E9D7918()
{
  return MEMORY[0x24BEA6640]();
}

uint64_t sub_21E9D7924()
{
  return MEMORY[0x24BEA6690]();
}

uint64_t sub_21E9D7930()
{
  return MEMORY[0x24BEA6698]();
}

uint64_t sub_21E9D793C()
{
  return MEMORY[0x24BEA66A0]();
}

uint64_t sub_21E9D7948()
{
  return MEMORY[0x24BEA6710]();
}

uint64_t sub_21E9D7954()
{
  return MEMORY[0x24BEA67B8]();
}

uint64_t sub_21E9D7960()
{
  return MEMORY[0x24BEA67E8]();
}

uint64_t sub_21E9D796C()
{
  return MEMORY[0x24BEA68F0]();
}

uint64_t sub_21E9D7978()
{
  return MEMORY[0x24BEA68F8]();
}

uint64_t sub_21E9D7984()
{
  return MEMORY[0x24BEA6900]();
}

uint64_t sub_21E9D7990()
{
  return MEMORY[0x24BEA6950]();
}

uint64_t sub_21E9D799C()
{
  return MEMORY[0x24BEA6958]();
}

uint64_t sub_21E9D79A8()
{
  return MEMORY[0x24BEA6960]();
}

uint64_t sub_21E9D79B4()
{
  return MEMORY[0x24BEA6968]();
}

uint64_t sub_21E9D79C0()
{
  return MEMORY[0x24BEA6978]();
}

uint64_t sub_21E9D79CC()
{
  return MEMORY[0x24BEA69F0]();
}

uint64_t sub_21E9D79D8()
{
  return MEMORY[0x24BEA69F8]();
}

uint64_t sub_21E9D79E4()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_21E9D79F0()
{
  return MEMORY[0x24BE9C2B8]();
}

uint64_t sub_21E9D79FC()
{
  return MEMORY[0x24BE9E018]();
}

uint64_t sub_21E9D7A08()
{
  return MEMORY[0x24BE9EAF8]();
}

uint64_t sub_21E9D7A14()
{
  return MEMORY[0x24BE9EB20]();
}

uint64_t sub_21E9D7A20()
{
  return MEMORY[0x24BE9EE58]();
}

uint64_t sub_21E9D7A2C()
{
  return MEMORY[0x24BE9EE60]();
}

uint64_t sub_21E9D7A38()
{
  return MEMORY[0x24BE9EF18]();
}

uint64_t sub_21E9D7A44()
{
  return MEMORY[0x24BE9EF20]();
}

uint64_t sub_21E9D7A50()
{
  return MEMORY[0x24BE9F728]();
}

uint64_t sub_21E9D7A5C()
{
  return MEMORY[0x24BE9F730]();
}

uint64_t sub_21E9D7A68()
{
  return MEMORY[0x24BE9F750]();
}

uint64_t sub_21E9D7A74()
{
  return MEMORY[0x24BE9F988]();
}

uint64_t sub_21E9D7A80()
{
  return MEMORY[0x24BE9F990]();
}

uint64_t sub_21E9D7A8C()
{
  return MEMORY[0x24BE9F998]();
}

uint64_t sub_21E9D7A98()
{
  return MEMORY[0x24BE9F9A0]();
}

uint64_t sub_21E9D7AA4()
{
  return MEMORY[0x24BE9F9B8]();
}

uint64_t sub_21E9D7AB0()
{
  return MEMORY[0x24BE9FAB0]();
}

uint64_t sub_21E9D7ABC()
{
  return MEMORY[0x24BE9FAB8]();
}

uint64_t sub_21E9D7AC8()
{
  return MEMORY[0x24BE9FAC0]();
}

uint64_t sub_21E9D7AD4()
{
  return MEMORY[0x24BE93088]();
}

uint64_t sub_21E9D7AE0()
{
  return MEMORY[0x24BE9FBC0]();
}

uint64_t sub_21E9D7AEC()
{
  return MEMORY[0x24BE9FC08]();
}

uint64_t sub_21E9D7AF8()
{
  return MEMORY[0x24BE9FC10]();
}

uint64_t sub_21E9D7B04()
{
  return MEMORY[0x24BE9FCF8]();
}

uint64_t sub_21E9D7B10()
{
  return MEMORY[0x24BE9FD10]();
}

uint64_t sub_21E9D7B1C()
{
  return MEMORY[0x24BE9FE40]();
}

uint64_t sub_21E9D7B28()
{
  return MEMORY[0x24BE9FE70]();
}

uint64_t sub_21E9D7B34()
{
  return MEMORY[0x24BE9FFA0]();
}

uint64_t sub_21E9D7B40()
{
  return MEMORY[0x24BE9FFB0]();
}

uint64_t sub_21E9D7B4C()
{
  return MEMORY[0x24BE9FFD8]();
}

uint64_t sub_21E9D7B58()
{
  return MEMORY[0x24BEA0138]();
}

uint64_t sub_21E9D7B64()
{
  return MEMORY[0x24BEA0140]();
}

uint64_t sub_21E9D7B70()
{
  return MEMORY[0x24BEA0168]();
}

uint64_t sub_21E9D7B7C()
{
  return MEMORY[0x24BEA0170]();
}

uint64_t sub_21E9D7B88()
{
  return MEMORY[0x24BEA0180]();
}

uint64_t sub_21E9D7B94()
{
  return MEMORY[0x24BEA0188]();
}

uint64_t sub_21E9D7BA0()
{
  return MEMORY[0x24BEA01A8]();
}

uint64_t sub_21E9D7BAC()
{
  return MEMORY[0x24BEA06B0]();
}

uint64_t sub_21E9D7BB8()
{
  return MEMORY[0x24BEA0980]();
}

uint64_t sub_21E9D7BC4()
{
  return MEMORY[0x24BEA0A48]();
}

uint64_t sub_21E9D7BD0()
{
  return MEMORY[0x24BEA0B30]();
}

uint64_t sub_21E9D7BDC()
{
  return MEMORY[0x24BEA0B38]();
}

uint64_t sub_21E9D7BE8()
{
  return MEMORY[0x24BEA0B50]();
}

uint64_t sub_21E9D7BF4()
{
  return MEMORY[0x24BEA0B58]();
}

uint64_t sub_21E9D7C00()
{
  return MEMORY[0x24BEA0CB0]();
}

uint64_t sub_21E9D7C0C()
{
  return MEMORY[0x24BEA0CB8]();
}

uint64_t sub_21E9D7C18()
{
  return MEMORY[0x24BEA0CC0]();
}

uint64_t sub_21E9D7C24()
{
  return MEMORY[0x24BEA0CC8]();
}

uint64_t sub_21E9D7C30()
{
  return MEMORY[0x24BEA0D88]();
}

uint64_t sub_21E9D7C3C()
{
  return MEMORY[0x24BEA0D90]();
}

uint64_t sub_21E9D7C48()
{
  return MEMORY[0x24BEA1720]();
}

uint64_t sub_21E9D7C54()
{
  return MEMORY[0x24BEA1C08]();
}

uint64_t sub_21E9D7C60()
{
  return MEMORY[0x24BEA1CD8]();
}

uint64_t sub_21E9D7C6C()
{
  return MEMORY[0x24BEA20D8]();
}

uint64_t sub_21E9D7C78()
{
  return MEMORY[0x24BEA20F0]();
}

uint64_t sub_21E9D7C84()
{
  return MEMORY[0x24BEA2100]();
}

uint64_t sub_21E9D7C90()
{
  return MEMORY[0x24BEA2108]();
}

uint64_t sub_21E9D7C9C()
{
  return MEMORY[0x24BEA2B38]();
}

uint64_t sub_21E9D7CA8()
{
  return MEMORY[0x24BEA2B48]();
}

uint64_t sub_21E9D7CB4()
{
  return MEMORY[0x24BEA2B50]();
}

uint64_t sub_21E9D7CC0()
{
  return MEMORY[0x24BEA3600]();
}

uint64_t sub_21E9D7CCC()
{
  return MEMORY[0x24BEA3670]();
}

uint64_t sub_21E9D7CD8()
{
  return MEMORY[0x24BEA3700]();
}

uint64_t sub_21E9D7CE4()
{
  return MEMORY[0x24BEA3710]();
}

uint64_t sub_21E9D7CF0()
{
  return MEMORY[0x24BEA3818]();
}

uint64_t sub_21E9D7CFC()
{
  return MEMORY[0x24BE932B8]();
}

uint64_t sub_21E9D7D08()
{
  return MEMORY[0x24BE932C0]();
}

uint64_t sub_21E9D7D14()
{
  return MEMORY[0x24BE932C8]();
}

uint64_t sub_21E9D7D20()
{
  return MEMORY[0x24BE932D0]();
}

uint64_t sub_21E9D7D2C()
{
  return MEMORY[0x24BE932D8]();
}

uint64_t sub_21E9D7D38()
{
  return MEMORY[0x24BE932E0]();
}

uint64_t sub_21E9D7D44()
{
  return MEMORY[0x24BE932E8]();
}

uint64_t sub_21E9D7D50()
{
  return MEMORY[0x24BE932F0]();
}

uint64_t sub_21E9D7D5C()
{
  return MEMORY[0x24BE932F8]();
}

uint64_t sub_21E9D7D68()
{
  return MEMORY[0x24BE93300]();
}

uint64_t sub_21E9D7D74()
{
  return MEMORY[0x24BE93308]();
}

uint64_t sub_21E9D7D80()
{
  return MEMORY[0x24BE93310]();
}

uint64_t sub_21E9D7D8C()
{
  return MEMORY[0x24BE93318]();
}

uint64_t sub_21E9D7D98()
{
  return MEMORY[0x24BE93320]();
}

uint64_t sub_21E9D7DA4()
{
  return MEMORY[0x24BE93328]();
}

uint64_t sub_21E9D7DB0()
{
  return MEMORY[0x24BE93330]();
}

uint64_t sub_21E9D7DBC()
{
  return MEMORY[0x24BE93338]();
}

uint64_t sub_21E9D7DC8()
{
  return MEMORY[0x24BE93340]();
}

uint64_t sub_21E9D7DD4()
{
  return MEMORY[0x24BE937E8]();
}

uint64_t sub_21E9D7DE0()
{
  return MEMORY[0x24BE937F0]();
}

uint64_t sub_21E9D7DEC()
{
  return MEMORY[0x24BE937F8]();
}

uint64_t sub_21E9D7DF8()
{
  return MEMORY[0x24BE938B0]();
}

uint64_t sub_21E9D7E04()
{
  return MEMORY[0x24BE938B8]();
}

uint64_t sub_21E9D7E10()
{
  return MEMORY[0x24BE93948]();
}

uint64_t sub_21E9D7E1C()
{
  return MEMORY[0x24BE93950]();
}

uint64_t sub_21E9D7E28()
{
  return MEMORY[0x24BE93958]();
}

uint64_t sub_21E9D7E34()
{
  return MEMORY[0x24BE93978]();
}

uint64_t sub_21E9D7E40()
{
  return MEMORY[0x24BE93998]();
}

uint64_t sub_21E9D7E4C()
{
  return MEMORY[0x24BE939A8]();
}

uint64_t sub_21E9D7E58()
{
  return MEMORY[0x24BE939B8]();
}

uint64_t sub_21E9D7E64()
{
  return MEMORY[0x24BE93A20]();
}

uint64_t sub_21E9D7E70()
{
  return MEMORY[0x24BE93A38]();
}

uint64_t sub_21E9D7E7C()
{
  return MEMORY[0x24BE93A40]();
}

uint64_t sub_21E9D7E88()
{
  return MEMORY[0x24BE94110]();
}

uint64_t sub_21E9D7E94()
{
  return MEMORY[0x24BE941F0]();
}

uint64_t sub_21E9D7EA0()
{
  return MEMORY[0x24BE942A8]();
}

uint64_t sub_21E9D7EAC()
{
  return MEMORY[0x24BEA5B38]();
}

uint64_t sub_21E9D7EB8()
{
  return MEMORY[0x24BEA5B50]();
}

uint64_t sub_21E9D7EC4()
{
  return MEMORY[0x24BEA5B68]();
}

uint64_t sub_21E9D7ED0()
{
  return MEMORY[0x24BEA5B70]();
}

uint64_t sub_21E9D7EDC()
{
  return MEMORY[0x24BEA5C60]();
}

uint64_t sub_21E9D7EE8()
{
  return MEMORY[0x24BEA5C68]();
}

uint64_t sub_21E9D7EF4()
{
  return MEMORY[0x24BEA5C78]();
}

uint64_t sub_21E9D7F00()
{
  return MEMORY[0x24BEA5CC8]();
}

uint64_t sub_21E9D7F0C()
{
  return MEMORY[0x24BEA5CD0]();
}

uint64_t sub_21E9D7F18()
{
  return MEMORY[0x24BEA5D28]();
}

uint64_t sub_21E9D7F24()
{
  return MEMORY[0x24BEA5D48]();
}

uint64_t sub_21E9D7F30()
{
  return MEMORY[0x24BEA5D50]();
}

uint64_t sub_21E9D7F3C()
{
  return MEMORY[0x24BEA5D88]();
}

uint64_t sub_21E9D7F48()
{
  return MEMORY[0x24BEA5DB0]();
}

uint64_t sub_21E9D7F54()
{
  return MEMORY[0x24BEA5DB8]();
}

uint64_t sub_21E9D7F60()
{
  return MEMORY[0x24BEA5DD0]();
}

uint64_t sub_21E9D7F6C()
{
  return MEMORY[0x24BEA5DD8]();
}

uint64_t sub_21E9D7F78()
{
  return MEMORY[0x24BEA5EB8]();
}

uint64_t sub_21E9D7F84()
{
  return MEMORY[0x24BEA5ED0]();
}

uint64_t sub_21E9D7F90()
{
  return MEMORY[0x24BEA5F08]();
}

uint64_t sub_21E9D7F9C()
{
  return MEMORY[0x24BEA8848]();
}

uint64_t sub_21E9D7FA8()
{
  return MEMORY[0x24BEA8A48]();
}

uint64_t sub_21E9D7FB4()
{
  return MEMORY[0x24BEA8C48]();
}

uint64_t sub_21E9D7FC0()
{
  return MEMORY[0x24BE92840]();
}

uint64_t sub_21E9D7FCC()
{
  return MEMORY[0x24BE92848]();
}

uint64_t sub_21E9D7FD8()
{
  return MEMORY[0x24BE92920]();
}

uint64_t sub_21E9D7FE4()
{
  return MEMORY[0x24BE92930]();
}

uint64_t sub_21E9D7FF0()
{
  return MEMORY[0x24BE92938]();
}

uint64_t sub_21E9D7FFC()
{
  return MEMORY[0x24BE92BE0]();
}

uint64_t sub_21E9D8008()
{
  return MEMORY[0x24BE92BF0]();
}

uint64_t sub_21E9D8014()
{
  return MEMORY[0x24BE92BF8]();
}

uint64_t sub_21E9D8020()
{
  return MEMORY[0x24BE92C20]();
}

uint64_t sub_21E9D802C()
{
  return MEMORY[0x24BE90B80]();
}

uint64_t sub_21E9D8038()
{
  return MEMORY[0x24BE90B88]();
}

uint64_t sub_21E9D8044()
{
  return MEMORY[0x24BE90B90]();
}

uint64_t sub_21E9D8050()
{
  return MEMORY[0x24BE90BB8]();
}

uint64_t sub_21E9D805C()
{
  return MEMORY[0x24BE90CD0]();
}

uint64_t sub_21E9D8068()
{
  return MEMORY[0x24BE90D08]();
}

uint64_t sub_21E9D8074()
{
  return MEMORY[0x24BE90D10]();
}

uint64_t sub_21E9D8080()
{
  return MEMORY[0x24BE90D38]();
}

uint64_t sub_21E9D808C()
{
  return MEMORY[0x24BE90D70]();
}

uint64_t sub_21E9D8098()
{
  return MEMORY[0x24BE92EC8]();
}

uint64_t sub_21E9D80A4()
{
  return MEMORY[0x24BE93020]();
}

uint64_t sub_21E9D80B0()
{
  return MEMORY[0x24BE945C0]();
}

uint64_t sub_21E9D80BC()
{
  return MEMORY[0x24BE5BFC0]();
}

uint64_t sub_21E9D80C8()
{
  return MEMORY[0x24BE5BFC8]();
}

uint64_t sub_21E9D80D4()
{
  return MEMORY[0x24BE5C1B8]();
}

uint64_t sub_21E9D80E0()
{
  return MEMORY[0x24BE5C1D0]();
}

uint64_t sub_21E9D80EC()
{
  return MEMORY[0x24BE94678]();
}

uint64_t sub_21E9D80F8()
{
  return MEMORY[0x24BE946A8]();
}

uint64_t sub_21E9D8104()
{
  return MEMORY[0x24BE946B8]();
}

uint64_t sub_21E9D8110()
{
  return MEMORY[0x24BE946C0]();
}

uint64_t sub_21E9D811C()
{
  return MEMORY[0x24BE946F0]();
}

uint64_t sub_21E9D8128()
{
  return MEMORY[0x24BE94738]();
}

uint64_t sub_21E9D8134()
{
  return MEMORY[0x24BE94740]();
}

uint64_t sub_21E9D8140()
{
  return MEMORY[0x24BEA9000]();
}

uint64_t sub_21E9D814C()
{
  return MEMORY[0x24BEA9028]();
}

uint64_t sub_21E9D8158()
{
  return MEMORY[0x24BEA9048]();
}

uint64_t sub_21E9D8164()
{
  return MEMORY[0x24BEA9050]();
}

uint64_t sub_21E9D8170()
{
  return MEMORY[0x24BEA9060]();
}

uint64_t sub_21E9D817C()
{
  return MEMORY[0x24BEA9068]();
}

uint64_t sub_21E9D8188()
{
  return MEMORY[0x24BEA9080]();
}

uint64_t sub_21E9D8194()
{
  return MEMORY[0x24BEA9088]();
}

uint64_t sub_21E9D81A0()
{
  return MEMORY[0x24BEA9090]();
}

uint64_t sub_21E9D81AC()
{
  return MEMORY[0x24BEA90A8]();
}

uint64_t sub_21E9D81B8()
{
  return MEMORY[0x24BEA90B0]();
}

uint64_t sub_21E9D81C4()
{
  return MEMORY[0x24BEA90B8]();
}

uint64_t sub_21E9D81D0()
{
  return MEMORY[0x24BEA90C0]();
}

uint64_t sub_21E9D81DC()
{
  return MEMORY[0x24BEA90C8]();
}

uint64_t sub_21E9D81E8()
{
  return MEMORY[0x24BEA90D0]();
}

uint64_t sub_21E9D81F4()
{
  return MEMORY[0x24BEA90D8]();
}

uint64_t sub_21E9D8200()
{
  return MEMORY[0x24BEA90E0]();
}

uint64_t sub_21E9D820C()
{
  return MEMORY[0x24BEA9100]();
}

uint64_t sub_21E9D8218()
{
  return MEMORY[0x24BEA9108]();
}

uint64_t sub_21E9D8224()
{
  return MEMORY[0x24BEA9110]();
}

uint64_t sub_21E9D8230()
{
  return MEMORY[0x24BEA9120]();
}

uint64_t sub_21E9D823C()
{
  return MEMORY[0x24BEA9130]();
}

uint64_t sub_21E9D8248()
{
  return MEMORY[0x24BEA9160]();
}

uint64_t sub_21E9D8254()
{
  return MEMORY[0x24BEA9170]();
}

uint64_t sub_21E9D8260()
{
  return MEMORY[0x24BEA9180]();
}

uint64_t sub_21E9D826C()
{
  return MEMORY[0x24BEA9190]();
}

uint64_t sub_21E9D8278()
{
  return MEMORY[0x24BEA91A0]();
}

uint64_t sub_21E9D8284()
{
  return MEMORY[0x24BEA91B0]();
}

uint64_t sub_21E9D8290()
{
  return MEMORY[0x24BEA91C8]();
}

uint64_t sub_21E9D829C()
{
  return MEMORY[0x24BEA9250]();
}

uint64_t sub_21E9D82A8()
{
  return MEMORY[0x24BEA9280]();
}

uint64_t sub_21E9D82B4()
{
  return MEMORY[0x24BEA9288]();
}

uint64_t sub_21E9D82C0()
{
  return MEMORY[0x24BEA9290]();
}

uint64_t sub_21E9D82CC()
{
  return MEMORY[0x24BEA9298]();
}

uint64_t sub_21E9D82D8()
{
  return MEMORY[0x24BEA92B0]();
}

uint64_t sub_21E9D82E4()
{
  return MEMORY[0x24BEA92B8]();
}

uint64_t sub_21E9D82F0()
{
  return MEMORY[0x24BEA92F0]();
}

uint64_t sub_21E9D82FC()
{
  return MEMORY[0x24BEA92F8]();
}

uint64_t sub_21E9D8308()
{
  return MEMORY[0x24BDFCA98]();
}

uint64_t sub_21E9D8314()
{
  return MEMORY[0x24BEE76F8]();
}

uint64_t sub_21E9D8320()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_21E9D832C()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_21E9D8338()
{
  return MEMORY[0x24BEE7738]();
}

uint64_t sub_21E9D8344()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t sub_21E9D8350()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_21E9D835C()
{
  return MEMORY[0x24BEE7790]();
}

uint64_t sub_21E9D8368()
{
  return MEMORY[0x24BEE77C0]();
}

uint64_t sub_21E9D8374()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t sub_21E9D8380()
{
  return MEMORY[0x24BEE7818]();
}

uint64_t sub_21E9D838C()
{
  return MEMORY[0x24BEE7848]();
}

uint64_t sub_21E9D8398()
{
  return MEMORY[0x24BEE7868]();
}

uint64_t sub_21E9D83A4()
{
  return MEMORY[0x24BEE7870]();
}

uint64_t sub_21E9D83B0()
{
  return MEMORY[0x24BEE78A0]();
}

uint64_t sub_21E9D83BC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21E9D83C8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21E9D83D4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21E9D83E0()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_21E9D83EC()
{
  return MEMORY[0x24BEA5668]();
}

uint64_t sub_21E9D83F8()
{
  return MEMORY[0x24BEA5680]();
}

uint64_t sub_21E9D8404()
{
  return MEMORY[0x24BEA5A38]();
}

uint64_t sub_21E9D8410()
{
  return MEMORY[0x24BEA5A50]();
}

uint64_t sub_21E9D841C()
{
  return MEMORY[0x24BEA5A70]();
}

uint64_t sub_21E9D8428()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_21E9D8434()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_21E9D8440()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_21E9D844C()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_21E9D8458()
{
  return MEMORY[0x24BEE54D8]();
}

uint64_t sub_21E9D8464()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21E9D8470()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_21E9D847C()
{
  return MEMORY[0x24BEE5578]();
}

uint64_t sub_21E9D8488()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_21E9D8494()
{
  return MEMORY[0x24BEE5620]();
}

uint64_t sub_21E9D84A0()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_21E9D84AC()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_21E9D84B8()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_21E9D84C4()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_21E9D84D0()
{
  return MEMORY[0x24BEE02C0]();
}

uint64_t sub_21E9D84DC()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_21E9D84E8()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_21E9D84F4()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_21E9D8500()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21E9D850C()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_21E9D8518()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_21E9D8524()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21E9D8530()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_21E9D853C()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_21E9D8548()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_21E9D8554()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_21E9D8560()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_21E9D856C()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_21E9D8578()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_21E9D8584()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_21E9D8590()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21E9D859C()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_21E9D85A8()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_21E9D85B4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21E9D85C0()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21E9D85CC()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_21E9D85D8()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_21E9D85E4()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_21E9D85F0()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_21E9D85FC()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_21E9D8608()
{
  return MEMORY[0x24BEE0D58]();
}

uint64_t sub_21E9D8614()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_21E9D8620()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_21E9D862C()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_21E9D8638()
{
  return MEMORY[0x24BEE0E48]();
}

uint64_t sub_21E9D8644()
{
  return MEMORY[0x24BEE0E98]();
}

uint64_t sub_21E9D8650()
{
  return MEMORY[0x24BEE0EF0]();
}

uint64_t sub_21E9D865C()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_21E9D8668()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_21E9D8674()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_21E9D8680()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_21E9D868C()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_21E9D8698()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_21E9D86A4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_21E9D86B0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_21E9D86BC()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_21E9D86C8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_21E9D86D4()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_21E9D86E0()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_21E9D86EC()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_21E9D86F8()
{
  return MEMORY[0x24BEE1270]();
}

uint64_t sub_21E9D8704()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_21E9D8710()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_21E9D871C()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_21E9D8728()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_21E9D8734()
{
  return MEMORY[0x24BEE6938]();
}

uint64_t sub_21E9D8740()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_21E9D874C()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_21E9D8758()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t sub_21E9D8764()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_21E9D8770()
{
  return MEMORY[0x24BDCFC60]();
}

uint64_t sub_21E9D877C()
{
  return MEMORY[0x24BDCFC68]();
}

uint64_t sub_21E9D8788()
{
  return MEMORY[0x24BE90988]();
}

uint64_t sub_21E9D8794()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_21E9D87A0()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_21E9D87AC()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_21E9D87B8()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_21E9D87C4()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_21E9D87D0()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_21E9D87DC()
{
  return MEMORY[0x24BDCFD38]();
}

uint64_t sub_21E9D87E8()
{
  return MEMORY[0x24BDCFE18]();
}

uint64_t sub_21E9D87F4()
{
  return MEMORY[0x24BEA5FA0]();
}

uint64_t sub_21E9D8800()
{
  return MEMORY[0x24BEE5AB0]();
}

uint64_t sub_21E9D880C()
{
  return MEMORY[0x24BE99110]();
}

uint64_t sub_21E9D8818()
{
  return MEMORY[0x24BE99120]();
}

uint64_t sub_21E9D8824()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_21E9D8830()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_21E9D883C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21E9D8848()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_21E9D8854()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21E9D8860()
{
  return MEMORY[0x24BEE5660]();
}

uint64_t sub_21E9D886C()
{
  return MEMORY[0x24BEE5678]();
}

uint64_t sub_21E9D8878()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_21E9D8884()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_21E9D8890()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_21E9D889C()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_21E9D88A8()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_21E9D88B4()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_21E9D88C0()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_21E9D88CC()
{
  return MEMORY[0x24BEE5AC8]();
}

uint64_t sub_21E9D88D8()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_21E9D88E4()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_21E9D88F0()
{
  return MEMORY[0x24BE99130]();
}

uint64_t sub_21E9D88FC()
{
  return MEMORY[0x24BEE5B58]();
}

uint64_t sub_21E9D8908()
{
  return MEMORY[0x24BDD01E0]();
}

uint64_t sub_21E9D8914()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_21E9D8920()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_21E9D892C()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_21E9D8938()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_21E9D8944()
{
  return MEMORY[0x24BEE7968]();
}

uint64_t sub_21E9D8950()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_21E9D895C()
{
  return MEMORY[0x24BEE1C58]();
}

uint64_t sub_21E9D8968()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_21E9D8974()
{
  return MEMORY[0x24BEE1DB8]();
}

uint64_t sub_21E9D8980()
{
  return MEMORY[0x24BEE1E60]();
}

uint64_t sub_21E9D898C()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_21E9D8998()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21E9D89A4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21E9D89B0()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_21E9D89BC()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_21E9D89C8()
{
  return MEMORY[0x24BDD05C8]();
}

uint64_t sub_21E9D89D4()
{
  return MEMORY[0x24BDD05D8]();
}

uint64_t sub_21E9D89E0()
{
  return MEMORY[0x24BDD0620]();
}

uint64_t sub_21E9D89EC()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_21E9D89F8()
{
  return MEMORY[0x24BEE5E68]();
}

uint64_t sub_21E9D8A04()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_21E9D8A10()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_21E9D8A1C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21E9D8A28()
{
  return MEMORY[0x24BEE22D8]();
}

uint64_t sub_21E9D8A34()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_21E9D8A40()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_21E9D8A4C()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_21E9D8A58()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_21E9D8A64()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_21E9D8A70()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_21E9D8A7C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_21E9D8A88()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21E9D8A94()
{
  return MEMORY[0x24BEE2648]();
}

uint64_t sub_21E9D8AA0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21E9D8AAC()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_21E9D8AB8()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_21E9D8AC4()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_21E9D8AD0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21E9D8ADC()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_21E9D8AE8()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_21E9D8AF4()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_21E9D8B00()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_21E9D8B0C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_21E9D8B18()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_21E9D8B24()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_21E9D8B30()
{
  return MEMORY[0x24BEE2E68]();
}

uint64_t sub_21E9D8B3C()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_21E9D8B48()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_21E9D8B54()
{
  return MEMORY[0x24BEE2EE0]();
}

uint64_t sub_21E9D8B60()
{
  return MEMORY[0x24BEE2F08]();
}

uint64_t sub_21E9D8B6C()
{
  return MEMORY[0x24BEE2F18]();
}

uint64_t sub_21E9D8B78()
{
  return MEMORY[0x24BEE2F20]();
}

uint64_t sub_21E9D8B84()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21E9D8B90()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_21E9D8B9C()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_21E9D8BA8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21E9D8BB4()
{
  return MEMORY[0x24BEE3070]();
}

uint64_t sub_21E9D8BC0()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_21E9D8BCC()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_21E9D8BD8()
{
  return MEMORY[0x24BEE3090]();
}

uint64_t sub_21E9D8BE4()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21E9D8BF0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21E9D8BFC()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_21E9D8C08()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_21E9D8C14()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_21E9D8C20()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_21E9D8C2C()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_21E9D8C38()
{
  return MEMORY[0x24BEE32E0]();
}

uint64_t sub_21E9D8C44()
{
  return MEMORY[0x24BEE32E8]();
}

uint64_t sub_21E9D8C50()
{
  return MEMORY[0x24BEE32F8]();
}

uint64_t sub_21E9D8C5C()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_21E9D8C68()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_21E9D8C74()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_21E9D8C80()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_21E9D8C8C()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_21E9D8C98()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_21E9D8CA4()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_21E9D8CB0()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_21E9D8CBC()
{
  return MEMORY[0x24BEE3448]();
}

uint64_t sub_21E9D8CC8()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_21E9D8CD4()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_21E9D8CE0()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_21E9D8CEC()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_21E9D8CF8()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_21E9D8D04()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_21E9D8D10()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21E9D8D1C()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_21E9D8D28()
{
  return MEMORY[0x24BEE3938]();
}

uint64_t sub_21E9D8D34()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_21E9D8D40()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21E9D8D4C()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_21E9D8D58()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_21E9D8D64()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_21E9D8D70()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_21E9D8D7C()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_21E9D8D88()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_21E9D8D94()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_21E9D8DA0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21E9D8DAC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21E9D8DB8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21E9D8DC4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21E9D8DD0()
{
  return MEMORY[0x24BDD0730]();
}

uint64_t sub_21E9D8DDC()
{
  return MEMORY[0x24BDD0758]();
}

uint64_t sub_21E9D8DE8()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_21E9D8DF4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21E9D8E00()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21E9D8E0C()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_21E9D8E18()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_21E9D8E24()
{
  return MEMORY[0x24BEE4320]();
}

uint64_t sub_21E9D8E30()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_21E9D8E3C()
{
  return MEMORY[0x24BEE4330]();
}

uint64_t sub_21E9D8E48()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_21E9D8E54()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_21E9D8E60()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_21E9D8E6C()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_21E9D8E78()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AFCurrentUserInterfaceIdiom()
{
  return MEMORY[0x24BE08C08]();
}

uint64_t AFIsATV()
{
  return MEMORY[0x24BE08D78]();
}

uint64_t AFIsHorseman()
{
  return MEMORY[0x24BE08D98]();
}

uint64_t AFIsIPod()
{
  return MEMORY[0x24BE08DA0]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x24BE08DA8]();
}

uint64_t AFIsMac()
{
  return MEMORY[0x24BE08DB0]();
}

uint64_t AFIsNano()
{
  return MEMORY[0x24BE08DB8]();
}

uint64_t AFIsPad()
{
  return MEMORY[0x24BE08DC0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
}

uint64_t INPlayMediaIntentResponseCodeGetName()
{
  return MEMORY[0x24BDD9A08]();
}

uint64_t INTypedObjectWithCustomObject()
{
  return MEMORY[0x24BDD9B00]();
}

uint64_t MRAVEndpointMoveOutputGroupToDevicesFromSource()
{
  return MEMORY[0x24BE64DF8]();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationPlaybackState()
{
  return MEMORY[0x24BE65168]();
}

uint64_t MRMediaRemoteGetNowPlayingClient()
{
  return MEMORY[0x24BE65180]();
}

uint64_t MRNowPlayingClientGetBundleIdentifier()
{
  return MEMORY[0x24BE652A0]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint64_t archive_entry_filetype()
{
  return MEMORY[0x24BEDA318]();
}

uint64_t archive_entry_pathname_utf8()
{
  return MEMORY[0x24BEDA368]();
}

uint64_t archive_entry_perm()
{
  return MEMORY[0x24BEDA378]();
}

uint64_t archive_entry_set_perm()
{
  return MEMORY[0x24BEDA3D8]();
}

uint64_t archive_entry_size()
{
  return MEMORY[0x24BEDA3F8]();
}

uint64_t archive_entry_size_is_set()
{
  return MEMORY[0x24BEDA400]();
}

uint64_t archive_entry_update_pathname_utf8()
{
  return MEMORY[0x24BEDA420]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x24BEDA430]();
}

uint64_t archive_read_close()
{
  return MEMORY[0x24BEDA450]();
}

uint64_t archive_read_data_block()
{
  return MEMORY[0x24BEDA460]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x24BEDA4B8]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x24BEDA4C8]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x24BEDA4D0]();
}

uint64_t archive_read_open_memory()
{
  return MEMORY[0x24BEDA500]();
}

uint64_t archive_read_support_filter_all()
{
  return MEMORY[0x24BEDA528]();
}

uint64_t archive_read_support_format_zip()
{
  return MEMORY[0x24BEDA550]();
}

uint64_t archive_write_close()
{
  return MEMORY[0x24BEDA580]();
}

uint64_t archive_write_data_block()
{
  return MEMORY[0x24BEDA590]();
}

uint64_t archive_write_disk_new()
{
  return MEMORY[0x24BEDA598]();
}

uint64_t archive_write_disk_set_options()
{
  return MEMORY[0x24BEDA5A0]();
}

uint64_t archive_write_disk_set_standard_lookup()
{
  return MEMORY[0x24BEDA5A8]();
}

uint64_t archive_write_finish_entry()
{
  return MEMORY[0x24BEDA5B8]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x24BEDA5C0]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x24BEDA5C8]();
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
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

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
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

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x24BEE4DE8]();
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

uint64_t swift_initStaticObject()
{
  return MEMORY[0x24BEE4E50]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_readAtKeyPath()
{
  return MEMORY[0x24BEE4ED8]();
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

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return MEMORY[0x24BEE4F20]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
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

uint64_t swift_unownedRelease()
{
  return MEMORY[0x24BEE4FF0]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x24BEE4FF8]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x24BEE5000]();
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

