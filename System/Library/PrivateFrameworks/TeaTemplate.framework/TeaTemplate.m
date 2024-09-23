ValueMetadata *type metadata accessor for LayoutOptions()
{
  return &type metadata for LayoutOptions;
}

void type metadata accessor for ColumnSystem.Options()
{
  OUTLINED_FUNCTION_8_3();
}

void *__swift_memcpy112_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

ValueMetadata *type metadata accessor for LayoutContentScale()
{
  return &type metadata for LayoutContentScale;
}

unint64_t sub_1BA162728(unint64_t *a1)
{
  return sub_1BA168614(*a1);
}

uint64_t sub_1BA162730()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1BA162774()
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

uint64_t static DebugLayoutData.empty.getter()
{
  if (qword_1ED5C9DA0 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_1BA162830()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1BA16288C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  type metadata accessor for LayoutContextRecords();
  v0 = swift_allocObject();
  v1 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v0 + 16) = MEMORY[0x1E0DEE9D8];
  type metadata accessor for DebugLayoutData();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v1;
  *(_QWORD *)(result + 24) = v0;
  qword_1ED5C9D98 = result;
  return result;
}

uint64_t sub_1BA1628E4(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_1BA162930(&qword_1ED5C9A50, (uint64_t)&protocol conformance descriptor for UIRectCorner);
  result = sub_1BA162930(&qword_1ED5C9A48, (uint64_t)&protocol conformance descriptor for UIRectCorner);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1BA162930(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for UIRectCorner(255);
    result = MEMORY[0x1BCCD6858](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for UIRectCorner(uint64_t a1)
{
  sub_1BA169D54(a1, &qword_1ED5C9A58);
}

uint64_t sub_1BA162984()
{
  return swift_initClassMetadata2();
}

void sub_1BA1629C4()
{
  type metadata accessor for EmbedFactory.Context();
}

uint64_t sub_1BA162A74()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1BA162AC0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1BA162B0C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1BA162B64(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *a3;
  v9 = *(_QWORD *)(*a3 + 8);
  a1[1] = MEMORY[0x1BCCD6858](MEMORY[0x1E0DEE9A0], a2, &v9);
  v8 = *(_QWORD *)(v5 + 16);
  a1[2] = MEMORY[0x1BCCD6858](MEMORY[0x1E0DEE988], a2, &v8);
  v7 = v5;
  result = MEMORY[0x1BCCD6858](&protocol conformance descriptor for <A> A?, a2, &v7);
  a1[3] = result;
  return result;
}

uint64_t sub_1BA162BF0()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1BA162C1C(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_1BA162C68(&qword_1ED5C9A88, MEMORY[0x1E0C9B9E0]);
  result = sub_1BA162C68(&qword_1ED5C9A80, MEMORY[0x1E0C9B9C0]);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1BA162C68(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for CGRect(255);
    result = MEMORY[0x1BCCD6858](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BA162CA8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1BA162CF0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1BA162D48()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1BA162D8C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t AssociatedTypeWitness;
  unint64_t v3;
  unint64_t v4;

  v0 = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    if (v3 > 0x3F)
    {
      return AssociatedTypeWitness;
    }
    else
    {
      v0 = swift_getAssociatedTypeWitness();
      if (v4 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return v0;
}

uint64_t sub_1BA162E84()
{
  return swift_initClassMetadata2();
}

uint64_t IfBuilder.__deallocating_deinit()
{
  IfBuilder.deinit();
  return swift_deallocClassInstance();
}

uint64_t IfBuilder.deinit()
{
  uint64_t v0;

  swift_release();
  sub_1BA162F64(*(_QWORD *)(v0 + 32));
  return v0;
}

uint64_t IfBuilder.else(elseBlock:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 32);
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  sub_1BA162F64(v3);
  return swift_retain();
}

uint64_t sub_1BA162F64(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_1BA162F74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BA162F88(a1, a2);
}

uint64_t sub_1BA162F88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BA162FA0(a1, a2);
}

uint64_t sub_1BA162FA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_1BA19ADEC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
}

void sub_1BA162FF0()
{
  OUTLINED_FUNCTION_6_22();
  sub_1BA19ABC4();
  OUTLINED_FUNCTION_3_35();
  OUTLINED_FUNCTION_3();
}

uint64_t EmbedFactoryCursor.adjustFrameBlock.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 232);
  swift_retain();
  return v1;
}

uint64_t sub_1BA163058()
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

uint64_t sub_1BA1630C8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1BA19ADEC();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void AltText.init(identifier:logic:attributedText:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, void *a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v8;
  id v9;
  id v10;

  v8 = *a3;
  v9 = a4;
  v10 = sub_1BA16EA30();

  *a5 = a1;
  a5[1] = a2;
  a5[2] = v9;
  a5[3] = v8;
  a5[4] = v10;
}

uint64_t sub_1BA163190(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v5;

  result = type metadata accessor for LayoutDecoder.ObjectPath(319, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), a4);
  if (v5 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void destroy for AltText(uint64_t a1)
{
  swift_bridgeObjectRelease();

  swift_release();
}

void BuilderType.hBox(name:reversed:size:_:block:)(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1BA1676A8(a1, a2, a3, a4, a5, a6, a7, a8, a9, 0);
}

uint64_t sub_1BA163264()
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

uint64_t LayoutContextRecords.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

void sub_1BA1632F8(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_1BA163350(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1BA163400 + 4 * byte_1BA19C8E7[a2]))(0x6C6C616D73);
}

void sub_1BA163400(uint64_t a1)
{
  uint64_t v1;

  if (a1 != 0x6C6C616D73 || v1 != 0xE500000000000000)
    OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0();
}

double LayoutOptions.init(boundingSize:viewportSize:visibleViewportSize:windowSize:screenNativeSize:traitCollection:layoutMargins:origin:layoutDirection:contentSizeCategory:safeAreaInsets:contentResizeScale:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>, double a6@<D0>, double a7@<D1>, double a8@<D2>, double a9@<D3>, double a10@<D4>, uint64_t a11@<D5>, double a12@<D6>, double a13@<D7>, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,__int128 a22,uint64_t a23,double a24)
{
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  double result;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v48;
  unint64_t v51;

  v33 = *a4;
  v51 = 0xF000000000000007;
  type metadata accessor for LayoutMarginAdjuster();
  OUTLINED_FUNCTION_1_0();
  v41 = OUTLINED_FUNCTION_0_1(&v51, v34, v35, v36, v37, v38, v39, v40, a16, a17, a18, a19, v45, a21, a11);
  *(double *)a5 = a6;
  *(double *)(a5 + 8) = a7;
  *(double *)(a5 + 16) = a8;
  *(double *)(a5 + 24) = a9;
  *(double *)(a5 + 32) = a10;
  *(_QWORD *)(a5 + 40) = v48;
  *(double *)(a5 + 48) = a12;
  *(double *)(a5 + 56) = a13;
  *(_QWORD *)(a5 + 64) = a14;
  *(_QWORD *)(a5 + 72) = a15;
  *(_QWORD *)(a5 + 80) = a1;
  *(_OWORD *)(a5 + 88) = v43;
  *(_OWORD *)(a5 + 104) = v44;
  *(_QWORD *)(a5 + 120) = a20;
  *(_QWORD *)(a5 + 128) = v46;
  *(_QWORD *)(a5 + 136) = a2;
  *(_QWORD *)(a5 + 144) = a3;
  *(_OWORD *)(a5 + 152) = a22;
  *(_QWORD *)(a5 + 168) = a23;
  result = a24;
  *(double *)(a5 + 176) = a24;
  *(_BYTE *)(a5 + 184) = v33;
  *(_QWORD *)(a5 + 192) = v41;
  return result;
}

uint64_t EmbedFactoryCursor.layoutOptions.getter@<X0>(void *a1@<X8>)
{
  _BYTE v3[200];

  OUTLINED_FUNCTION_6_2(v3);
  OUTLINED_FUNCTION_6_2(a1);
  return sub_1BA1667D4((uint64_t)v3);
}

uint64_t DebugLayoutData.__deallocating_deinit()
{
  DebugLayoutData.deinit();
  return swift_deallocClassInstance();
}

uint64_t DebugLayoutData.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t sub_1BA163690()
{
  sub_1BA1636B0();
  return swift_deallocClassInstance();
}

uint64_t sub_1BA1636B0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

double ColumnSystem.Options.scaleFactor.getter()
{
  char *v0;
  double v1;
  uint64_t v2;
  double v3;
  double v4;
  double v5;

  v1 = 1.0;
  if ((v0[8] & 4) == 0)
  {
    v2 = *v0;
    v3 = *((double *)v0 + 13);
    v4 = *((double *)v0 + 11);
    v5 = CGRectGetWidth(*(CGRect *)(v0 + 48)) - v4 - v3;
    if (v5 != 1.79769313e308)
      return v5 / dbl_1BA19CB20[v2];
  }
  return v1;
}

uint64_t initializeWithCopy for AltTextSized(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v5 = *(void **)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v4;
  v6 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v6;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v7 = *(void **)(a2 + 72);
  *(_QWORD *)(a1 + 72) = v7;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  v8 = v5;
  swift_retain();
  v9 = v6;
  v10 = v7;
  return a1;
}

void destroy for AltTextSized(id *a1)
{
  swift_bridgeObjectRelease();

  swift_release();
}

void BuilderType.hBox(name:reversed:size:positions:block:)(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1BA167824(a1, a2, a3, a4, a5, a6, a7, a8, a9, 0);
}

void BuilderType.mapFrameWithContext<A>(name:keyPath:size:positions:mapBlock:)()
{
  OUTLINED_FUNCTION_46();
}

void sub_1BA163860()
{
  OUTLINED_FUNCTION_15_1();
}

uint64_t sub_1BA163868()
{
  sub_1BA163884();
  return swift_deallocClassInstance();
}

uint64_t sub_1BA163884()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

void BuilderType.vBox(name:reversed:size:_:block:)()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  unint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  OUTLINED_FUNCTION_55();
  sub_1BA1676A8(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t LayoutBuilder.__deallocating_deinit()
{
  LayoutBuilder.deinit();
  return swift_deallocClassInstance();
}

uint64_t LayoutBuilder.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

void sub_1BA16390C(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1BA163954()
{
  OUTLINED_FUNCTION_4_27();
  return OUTLINED_FUNCTION_0_44();
}

uint64_t sub_1BA1639F4(uint64_t *a1, uint64_t a2)
{
  return sub_1BA163A0C(a1, a2);
}

uint64_t sub_1BA163A0C(uint64_t *a1, uint64_t a2)
{
  char v2;
  __int128 v3;
  _OWORD v5[2];
  char v6;
  uint64_t v7;

  v2 = *(_BYTE *)(a2 + 32);
  v7 = *a1;
  v3 = *(_OWORD *)(a2 + 16);
  v5[0] = *(_OWORD *)a2;
  v5[1] = v3;
  v6 = v2;
  return + infix<A>(_:_:)(&v7, v5);
}

uint64_t IfNode.__deallocating_deinit()
{
  IfNode.deinit();
  return swift_deallocClassInstance();
}

void IfNode.deinit()
{
  uint64_t v0;

  v0 = Node.deinit();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  swift_release();
  sub_1BA162F64(*(_QWORD *)(v0 + 96));
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_0();
}

unint64_t sub_1BA163AB4(unint64_t *a1)
{
  return sub_1BA171BFC(*a1);
}

void BuilderType.if (_:thenBlock:)()
{
  OUTLINED_FUNCTION_14_5();
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_13_5();
  swift_getAssociatedConformanceWitness();
  type metadata accessor for IfBuilder();
}

_QWORD *sub_1BA163B54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;

  v7 = sub_1BA163C50(v1, v4);
  type metadata accessor for IfNode(0, v5, v6, v8);
  v9 = (_QWORD *)OUTLINED_FUNCTION_6();
  v9[2] = v2;
  v9[3] = v0;
  v9[4] = v7;
  OUTLINED_FUNCTION_4_3();
  sub_1BA171AC4(v3);
  OUTLINED_FUNCTION_33();
  sub_1BA163CD4();
  v10 = (_QWORD *)OUTLINED_FUNCTION_6();
  v10[2] = v2;
  v10[3] = v0;
  v10[4] = v7;
  OUTLINED_FUNCTION_33();
  v11 = IfNode.Else(elseBlock:)((uint64_t)sub_1BA17298C, (uint64_t)v10);
  swift_release();
  OUTLINED_FUNCTION_9_12();
  OUTLINED_FUNCTION_4_20(v11, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 40));
  swift_release();
  return v7;
}

void type metadata accessor for IfBuilder()
{
  JUMPOUT(0x1BCCD681CLL);
}

_QWORD *sub_1BA163C50(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = (_QWORD *)swift_allocObject();
  result[4] = 0;
  result[5] = 0;
  result[2] = a1;
  result[3] = a2;
  return result;
}

uint64_t type metadata accessor for IfNode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for IfNode);
}

uint64_t IfNode.Else(elseBlock:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 96);
  *(_QWORD *)(v2 + 96) = a1;
  *(_QWORD *)(v2 + 104) = a2;
  sub_1BA162F64(v3);
  swift_retain();
  return swift_retain();
}

{
  uint64_t *v2;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  v5 = *v2;
  v6 = (_QWORD *)OUTLINED_FUNCTION_6();
  v6[2] = *(_QWORD *)(v5 + 136);
  v6[3] = *(_QWORD *)(v5 + 144);
  v6[4] = a1;
  v6[5] = a2;
  v7 = v2[12];
  v2[12] = (uint64_t)sub_1BA17DF34;
  v2[13] = (uint64_t)v6;
  swift_retain();
  sub_1BA162F64(v7);
  return swift_retain();
}

uint64_t sub_1BA163CD4()
{
  OUTLINED_FUNCTION_6();
  return sub_1BA163D20();
}

uint64_t sub_1BA163D20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v5;

  OUTLINED_FUNCTION_0_15();
  v2 = type metadata accessor for Conditional(0, *(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 144), v1);
  OUTLINED_FUNCTION_4_9(v2, (uint64_t)&protocol witness table for Conditional<A>);
  v5 = v3;
  return OUTLINED_FUNCTION_8_6(&v5);
}

void BuilderType.mapFrame<A>(name:keyPath:size:positions:mapBlock:)()
{
  OUTLINED_FUNCTION_46();
}

void sub_1BA163D94()
{
  OUTLINED_FUNCTION_15_1();
}

uint64_t LayoutOptions.makeCopy(layoutDirection:origin:layoutMarginAdjuster:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  __int128 v9;
  __int128 v10;
  id v11;
  id v12;

  v6 = *(void **)(v5 + 80);
  v7 = *(void **)(v5 + 144);
  v8 = *(_BYTE *)(v5 + 184);
  v9 = *(_OWORD *)(v5 + 16);
  *(_OWORD *)a3 = *(_OWORD *)v5;
  *(_OWORD *)(a3 + 16) = v9;
  v10 = *(_OWORD *)(v5 + 48);
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(v5 + 32);
  *(_OWORD *)(a3 + 48) = v10;
  *(_OWORD *)(a3 + 64) = *(_OWORD *)(v5 + 64);
  *(_QWORD *)(a3 + 80) = v6;
  *(_OWORD *)(a3 + 88) = *(_OWORD *)(v5 + 88);
  *(_OWORD *)(a3 + 104) = *(_OWORD *)(v5 + 104);
  *(double *)(a3 + 120) = a4;
  *(double *)(a3 + 128) = a5;
  *(_QWORD *)(a3 + 136) = a1;
  *(_QWORD *)(a3 + 144) = v7;
  *(_OWORD *)(a3 + 152) = *(_OWORD *)(v5 + 152);
  *(_OWORD *)(a3 + 168) = *(_OWORD *)(v5 + 168);
  *(_BYTE *)(a3 + 184) = v8;
  *(_QWORD *)(a3 + 192) = a2;
  v11 = v6;
  v12 = v7;
  return swift_retain();
}

uint64_t sub_1BA163E24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1BA163E44(a1, a2, a3, a4);
}

uint64_t sub_1BA163E44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  v5 = type metadata accessor for LayoutKeyedDecodingContainer(0, a2, a3, a4);
  sub_1BA163EE4(*(_QWORD *)(v4 + 16), *(_BYTE *)(v4 + 24));
  swift_bridgeObjectRetain();
  MEMORY[0x1BCCD6858](&unk_1BA19EB10, v5);
  return sub_1BA19AFCC();
}

uint64_t type metadata accessor for LayoutKeyedDecodingContainer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LayoutKeyedDecodingContainer);
}

uint64_t sub_1BA163EE4(uint64_t a1, char a2)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 32) = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(result + 16) = a1;
  *(_BYTE *)(result + 24) = a2 & 1;
  return result;
}

uint64_t sub_1BA163F34()
{
  sub_1BA163F50();
  return swift_deallocClassInstance();
}

uint64_t sub_1BA163F50()
{
  uint64_t v0;

  v0 = sub_1BA1685D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BA163F84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_1BA163FA4(a1, a2, a3);
}

uint64_t sub_1BA163FA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_1BA16E314(a1, a2, a3);
}

double LayoutOptions.scale.getter()
{
  uint64_t v0;
  void *v1;
  double v2;
  double result;

  v1 = *(void **)(v0 + 80);
  objc_msgSend(v1, sel_displayScale);
  if (v2 <= 0.0)
    return 1.0;
  objc_msgSend(v1, sel_displayScale);
  return result;
}

uint64_t FastLayoutDecoder.decodeFrame(_:)(uint64_t a1)
{
  uint64_t result;
  _BYTE *v3;

  result = OUTLINED_FUNCTION_0_16();
  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    sub_1BA18B270();
    OUTLINED_FUNCTION_7();
    *v3 = 0;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_1BA164074()
{
  sub_1BA1685D8();
  return swift_deallocClassInstance();
}

uint64_t sub_1BA164090(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char v7;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(void **)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_1BA1684BC(*(id *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t BoxBuilder.__deallocating_deinit()
{
  BoxBuilder.deinit();
  return swift_deallocClassInstance();
}

uint64_t BoxBuilder.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t Layout.__deallocating_deinit()
{
  Layout.deinit();
  return swift_deallocClassInstance();
}

uint64_t Layout.deinit()
{
  uint64_t v0;

  v0 = Node.deinit();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

unint64_t *sub_1BA1641B0(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a2;
  sub_1BA1683F8(*a2);
  *a1 = v3;
  return a1;
}

uint64_t Space.__deallocating_deinit()
{
  Space.deinit();
  return swift_deallocClassInstance();
}

uint64_t Space.deinit()
{
  uint64_t v0;

  v0 = Node.deinit();
  sub_1BA168614(*(_QWORD *)(v0 + 40));
  return v0;
}

uint64_t LayoutItemList.__deallocating_deinit()
{
  LayoutItemList.deinit();
  return swift_deallocClassInstance();
}

uint64_t LayoutItemList.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t LayoutItemList.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_4_10();
  v1 = sub_1BA19AB04();
  v2 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v0 + 16) = v1;
  *(_QWORD *)(v0 + 24) = v2;
  return v0;
}

Swift::Void __swiftcall LayoutBuilder.reserveCapacity(_:)(Swift::Int a1)
{
  sub_1BA1642B4();
}

uint64_t sub_1BA1642B4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  OUTLINED_FUNCTION_10_12();
  type metadata accessor for Node(255, *(_QWORD *)(v1 + 136), *(_QWORD *)(v1 + 152), v2);
  OUTLINED_FUNCTION_14();
  sub_1BA19AC84();
  return swift_endAccess();
}

uint64_t ColumnDebugView.init(columnSystem:)(uint64_t a1)
{
  _BYTE *v1;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  id v7;
  char *v8;
  double v9;
  SEL v10;
  uint64_t v11;
  id v12;
  char *v13;
  uint64_t v14;
  id v15;
  double v16;
  objc_super *v17;
  SEL v18;
  id v19;
  void *v20;
  char *v21;
  id v22;
  char *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t result;
  char *v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  char *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43[2];
  void *v44;
  uint64_t v45;

  OUTLINED_FUNCTION_10_11();
  *(_OWORD *)v43 = *(_OWORD *)a1;
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(_BYTE *)(a1 + 32);
  v1[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_showMargins] = 0;
  v1[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_showColumns] = 1;
  v6 = OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_leftMarginView;
  v7 = OUTLINED_FUNCTION_12_7();
  v8 = v1;
  v9 = OUTLINED_FUNCTION_3_30();
  *(_QWORD *)&v1[v6] = objc_msgSend(v7, v10, v9);
  v11 = OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_rightMarginView;
  v12 = OUTLINED_FUNCTION_12_7();
  *(_QWORD *)&v8[v11] = OUTLINED_FUNCTION_0_35(v12, sel_initWithFrame_);
  v13 = &v8[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_columnSystem];
  *(_OWORD *)v13 = *(_OWORD *)v43;
  *((_QWORD *)v13 + 2) = v3;
  *((_QWORD *)v13 + 3) = v4;
  v13[32] = v5;
  v45 = MEMORY[0x1E0DEE9D8];
  v14 = 18;
  sub_1BA19AEE8();
  do
  {
    v15 = OUTLINED_FUNCTION_12_7();
    OUTLINED_FUNCTION_0_35(v15, sel_initWithFrame_);
    sub_1BA19AEC4();
    sub_1BA19AEF4();
    sub_1BA19AF00();
    sub_1BA19AED0();
    --v14;
  }
  while (v14);
  *(_QWORD *)&v8[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_columnViews] = v45;

  v16 = OUTLINED_FUNCTION_3_30();
  v19 = objc_msgSendSuper2(v17, v18, v16);
  v20 = (void *)objc_opt_self();
  v21 = (char *)v19;
  v44 = v20;
  v22 = objc_msgSend(v20, sel_clearColor);
  objc_msgSend(v21, sel_setBackgroundColor_, v22);

  objc_msgSend(v21, sel_setUserInteractionEnabled_, 0);
  objc_msgSend(v21, sel_setPreservesSuperviewLayoutMargins_, 1);
  v23 = v21;
  v24 = *(_QWORD *)&v21[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_columnViews];
  if (!(v24 >> 62))
  {
    v25 = *(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v25)
      goto LABEL_5;
LABEL_11:
    swift_bridgeObjectRelease();
    v33 = v21;
    v34 = *(void **)&v21[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_rightMarginView];
    v35 = &v23[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_showMargins];
    v36 = *(id *)&v23[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_leftMarginView];
    v37 = v34;
    v38 = OUTLINED_FUNCTION_9_3((uint64_t)v37, sel_blueColor);
    v39 = OUTLINED_FUNCTION_6_17(v38, sel_colorWithAlphaComponent_);

    objc_msgSend(v36, sel_setBackgroundColor_, v39);
    OUTLINED_FUNCTION_0_14();
    objc_msgSend(v36, sel_setHidden_, (*v35 & 1) == 0);
    objc_msgSend(v23, sel_addSubview_, v36);

    v40 = v37;
    v41 = OUTLINED_FUNCTION_9_3((uint64_t)v40, sel_blueColor);
    v42 = OUTLINED_FUNCTION_6_17(v41, sel_colorWithAlphaComponent_);

    objc_msgSend(v40, sel_setBackgroundColor_, v42);
    objc_msgSend(v40, sel_setHidden_, (*v35 & 1) == 0);
    objc_msgSend(v33, sel_addSubview_, v40);

    return (uint64_t)v33;
  }
  swift_bridgeObjectRetain();
  result = sub_1BA19AF90();
  v25 = result;
  if (!result)
    goto LABEL_11;
LABEL_5:
  if (v25 >= 1)
  {
    v27 = &v21[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_showColumns];
    OUTLINED_FUNCTION_0_14();
    v28 = 0;
    do
    {
      if ((v24 & 0xC000000000000001) != 0)
        v29 = (id)MEMORY[0x1BCCD618C](v28, v24);
      else
        v29 = OUTLINED_FUNCTION_9_15(v24 + 8 * v28);
      v30 = v29;
      ++v28;
      v31 = objc_msgSend(v44, sel_redColor);
      v32 = OUTLINED_FUNCTION_6_17(v31, sel_colorWithAlphaComponent_);

      objc_msgSend(v30, sel_setBackgroundColor_, v32);
      objc_msgSend(v30, sel_setHidden_, (*v27 & 1) == 0);
      objc_msgSend(v21, sel_addSubview_, v30);

    }
    while (v25 != v28);
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

void EmbedFactory.Context.init(factory:model:options:)(uint64_t a1@<X0>, uint64_t a2@<X6>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1, a2);
  type metadata accessor for EmbedFactory.Context();
}

uint64_t sub_1BA164830(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v4 = v2 + *(int *)(a1 + 84);
  v5 = OUTLINED_FUNCTION_1_8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v4, v1, v5);
  v6 = v2 + *(int *)(a1 + 88);
  v7 = OUTLINED_FUNCTION_1_8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v6, v9, v7);
}

void BuilderType.embed<A, B>(name:keyPath:size:_:context:)()
{
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_35();
}

void sub_1BA164938(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  MEMORY[0x1E0C80A78](a1, a2);
  *(_QWORD *)(v8 - 152) = v4;
  *(_QWORD *)(v8 - 144) = v3;
  *(_QWORD *)(v8 - 136) = v6;
  *(_QWORD *)(v8 - 128) = v5;
  *(_QWORD *)(v8 - 120) = v7;
  *(_QWORD *)(v8 - 112) = v2;
  OUTLINED_FUNCTION_34();
}

void sub_1BA164978()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v4 - 152) = v1;
  v5 = *(_QWORD *)(v4 - 200);
  swift_bridgeObjectRetain();
  v6 = *(_QWORD *)(v4 - 216);
  OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_36((unint64_t *)(v4 - 152), *(_QWORD *)(v4 - 192), (unint64_t *)(v4 - 160));
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 16))(v3, *(_QWORD *)(v4 - 176), v0);
  sub_1BA164DC0(*(_QWORD *)(v4 - 168), v5, v6, (uint64_t *)(v4 - 160));
}

void sub_1BA1649EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 40))(a1, v1, v2);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_1_13();
}

void type metadata accessor for EmbedFactory()
{
  JUMPOUT(0x1BCCD681CLL);
}

void sub_1BA164A20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  _QWORD *v4;
  uint64_t v5;

  v5 = *a4;
  v4[5] = a3;
  v4[6] = v5;
  v4[7] = a1;
  v4[8] = a2;
  type metadata accessor for EmbedFactory.Context();
}

uint64_t sub_1BA164A98(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  char v13;

  v9 = *(_QWORD *)(a1 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v1, a1);
  v10 = (_QWORD *)(v2 + *(_QWORD *)(*(_QWORD *)v2 + 216));
  *v10 = v4;
  v10[1] = v3;
  v13 = 4;
  swift_bridgeObjectRetain();
  v11 = Node.init(kind:identifier:)(&v13, v6, v5);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v1, a1);
  return v11;
}

uint64_t sub_1BA164B1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 40) - 8);
  (*(void (**)(uint64_t, _QWORD))(v3 + 8))(a1, *(_QWORD *)(a2 + 40));
  v4 = *(_QWORD *)(v3 + 64) + a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v7 = (v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v7, AssociatedTypeWitness);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(unint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))((v7 + v8 + *(unsigned __int8 *)(*(_QWORD *)(v9 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v9 - 8) + 80), v9);
}

uint64_t sub_1BA164BEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 40) - 8);
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 16))(a1, a2, *(_QWORD *)(a3 + 40));
  v6 = *(_QWORD *)(v5 + 64);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v6 + v9;
  v11 = (v6 + v9 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v11, v12, AssociatedTypeWitness);
  v13 = *(_QWORD *)(v8 + 64);
  v14 = swift_getAssociatedTypeWitness();
  v15 = *(_QWORD *)(v14 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v15 + 16))((v13 + *(unsigned __int8 *)(v15 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80), (v13 + *(unsigned __int8 *)(v15 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80), v14);
  return a1;
}

void EmbedFactory.__deallocating_deinit()
{
  EmbedFactory.deinit();
}

uint64_t sub_1BA164CF0()
{
  return swift_deallocClassInstance();
}

void EmbedFactory.deinit()
{
  uint64_t v0;

  v0 = Node.deinit();
  swift_release();
  sub_1BA1790C0(*(_QWORD *)(v0 + 48));
  swift_bridgeObjectRelease();
  type metadata accessor for EmbedFactory.Context();
}

uint64_t sub_1BA164D74(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v2, a1);
  sub_1BA162F64(*(_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 216)));
  return v1;
}

void type metadata accessor for EmbedFactory.Context()
{
  JUMPOUT(0x1BCCD681CLL);
}

void sub_1BA164DC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  swift_allocObject();
  sub_1BA164A20(a1, a2, a3, a4);
}

uint64_t sub_1BA164E40()
{
  sub_1BA164E5C();
  return swift_deallocClassInstance();
}

uint64_t sub_1BA164E5C()
{
  uint64_t v0;

  v0 = Node.deinit();
  swift_release();
  sub_1BA19AA80(*(_QWORD *)(v0 + 48));
  swift_release();
  swift_bridgeObjectRelease();
  sub_1BA162F64(*(_QWORD *)(v0 + 80));
  return v0;
}

uint64_t sub_1BA164EA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1BA164ECC(a1, a2, a3, a4);
  return swift_deallocClassInstance();
}

void sub_1BA164ECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  v5 = type metadata accessor for LayoutDecoder.ObjectPath(0, *(_QWORD *)(*(_QWORD *)v4 + 80), *(_QWORD *)(*(_QWORD *)v4 + 88), a4);
  OUTLINED_FUNCTION_16_0(v5);
  OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1BA164F00(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = *(_QWORD *)(v2 + 64);
  if (v3 <= 9)
    v3 = 9;
  v4 = *(unsigned __int8 *)(a1 + v3);
  if (v4 < 2)
  {
    if (v4 == 1)
      return swift_bridgeObjectRelease();
    else
      return (*(uint64_t (**)(void))(v2 + 8))();
  }
  else
  {
    if (v3 <= 3)
      v5 = v3;
    else
      v5 = 4;
    return ((uint64_t (*)(void))((char *)&loc_1BA164F48 + 4 * byte_1BA19E36D[v5]))();
  }
}

void BuilderType.frame<A>(name:keyPath:size:_:)()
{
  uint64_t v0;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_32(v0);
  swift_getAssociatedConformanceWitness();
  type metadata accessor for Frame();
}

uint64_t sub_1BA16501C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;

  v8 = v4;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_36(&v8, v0, (unint64_t *)&v7);
  v5 = Frame.__allocating_init(name:_:_:mapBlock:)(v3, v2, v1, &v7, 0, 0);
  OUTLINED_FUNCTION_1_31(v5);
  return OUTLINED_FUNCTION_9_12();
}

uint64_t ListBuilder.__deallocating_deinit()
{
  ListBuilder.deinit();
  return swift_deallocClassInstance();
}

uint64_t ListBuilder.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BA1650CC()
{
  return sub_1BA1650E4();
}

uint64_t sub_1BA1650E4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_3_3();
  sub_1BA19B104();
  sub_1BA19ABC4();
  v0 = sub_1BA19B128();
  swift_bridgeObjectRelease();
  return v0;
}

void BuilderType.inheritedOverlay(name:reversed:size:positions:on:embedPath:block:)(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_21_1(a1, a2, a3, a4, a5, a6, a7, a8, a10, a9, v10, v11, v12, v13, 2);
}

void sub_1BA16516C()
{
  OUTLINED_FUNCTION_49();
}

void BuilderType.vOverlay(name:reversed:size:_:on:embedPath:block:)(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_22_1(a1, a2, a3, a4, a5, a6, a7, a8, a10, a9, v10, v11, v12, v13, 1);
}

void sub_1BA165194()
{
  OUTLINED_FUNCTION_49();
}

void sub_1BA16519C(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  uint64_t v13;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t AssociatedConformanceWitness;
  unint64_t v30[2];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v16 = *a4;
  v17 = OUTLINED_FUNCTION_16_2();
  swift_getAssociatedConformanceWitness();
  v18 = OUTLINED_FUNCTION_56();
  type metadata accessor for Overlay(v18, v19, v20, v21);
  v30[0] = v16;
  sub_1BA168200(v30, a5, (unint64_t *)&v33);
  LOBYTE(v30[0]) = a13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_26_0();
  v22 = sub_1BA1654E8(&v33, (char *)v30, a1, a2, a6, a7, a8, a3);
  OUTLINED_FUNCTION_3_27(v22, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a12 + 40));
  v23 = OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_39();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v30[0] = v17;
  v30[1] = v23;
  v31 = v13;
  v32 = AssociatedConformanceWitness;
  type metadata accessor for BoxBuilder();
}

uint64_t sub_1BA1652D4()
{
  uint64_t v0;
  void (*v2)(uint64_t);

  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_19_1();
  v2(v0);
  OUTLINED_FUNCTION_20();
  return swift_release();
}

void BuilderType.vOverlay(name:reversed:size:positions:on:embedPath:block:)(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_21_1(a1, a2, a3, a4, a5, a6, a7, a8, a10, a9, v10, v11, v12, v13, 1);
}

void sub_1BA165334()
{
  OUTLINED_FUNCTION_49();
}

void sub_1BA16533C(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t AssociatedConformanceWitness;
  unint64_t v26[4];
  uint64_t v27;

  v15 = *a4;
  v16 = OUTLINED_FUNCTION_17_1();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  type metadata accessor for Overlay(0, v16, AssociatedConformanceWitness, v17);
  v26[0] = v15;
  OUTLINED_FUNCTION_47(v26, a5, (unint64_t *)&v27);
  LOBYTE(v26[0]) = a13;
  OUTLINED_FUNCTION_43();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BA1654E8(&v27, (char *)v26, a1, a2, a6, a7, a8, a3);
  (*(void (**)(void))(a12 + 40))();
  v18 = OUTLINED_FUNCTION_17_1();
  v19 = swift_getAssociatedConformanceWitness();
  v26[0] = v16;
  v26[1] = v18;
  v26[2] = AssociatedConformanceWitness;
  v26[3] = v19;
  type metadata accessor for BoxBuilder();
}

uint64_t sub_1BA165498()
{
  uint64_t v0;
  void (*v2)(uint64_t);

  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_45();
  v2(v0);
  OUTLINED_FUNCTION_37();
  return OUTLINED_FUNCTION_20();
}

uint64_t type metadata accessor for Overlay(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Overlay);
}

uint64_t sub_1BA1654E8(uint64_t *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  swift_allocObject();
  return sub_1BA165578(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1BA165578(uint64_t *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  _QWORD *v8;
  uint64_t v9;
  char v10;
  char v12;
  uint64_t v13;
  char v14;

  v9 = *a1;
  v10 = *a2;
  v8[11] = a5;
  v8[12] = a6;
  v8[13] = a7;
  v14 = 3;
  v13 = v9;
  v12 = v10;
  return sub_1BA169174(&v14, &v13, &v12, a3, a4, a8);
}

uint64_t BuilderType.space(name:size:)(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v3 = *a3;
  v4 = OUTLINED_FUNCTION_14_5();
  v5 = OUTLINED_FUNCTION_13_5();
  type metadata accessor for Space(0, v4, v5, v6);
  v9 = v3;
  sub_1BA1683F8(v3);
  OUTLINED_FUNCTION_26_0();
  v7 = Space.__allocating_init(sizing:name:)(&v9);
  OUTLINED_FUNCTION_1_31(v7);
  return swift_release();
}

uint64_t type metadata accessor for Space(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Space);
}

uint64_t Space.__allocating_init(sizing:name:)(_QWORD *a1)
{
  OUTLINED_FUNCTION_1_1();
  return Space.init(sizing:name:)(a1);
}

uint64_t Space.init(sizing:name:)(_QWORD *a1)
{
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (_BYTE *)OUTLINED_FUNCTION_2_1(a1);
  return Node.init(kind:identifier:)(v1, v2, v3);
}

Swift::Void __swiftcall BoxBuilder.reserveCapacity(_:)(Swift::Int a1)
{
  sub_1BA165704();
}

uint64_t sub_1BA165704()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  OUTLINED_FUNCTION_0_14();
  type metadata accessor for Node(255, *(_QWORD *)(v1 + 136), *(_QWORD *)(v1 + 144), v2);
  OUTLINED_FUNCTION_14();
  sub_1BA19AC84();
  return swift_endAccess();
}

uint64_t LayoutItem.__deallocating_deinit()
{
  LayoutItem.deinit();
  return swift_deallocClassInstance();
}

uint64_t LayoutItem.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 96);
  v2 = OUTLINED_FUNCTION_6_6();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

void Layout.init(canvas:name:block:)(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  _QWORD v18[4];

  v7 = *v4;
  v17 = *a1;
  v9 = *((_QWORD *)a1 + 2);
  v8 = *((_QWORD *)a1 + 3);
  v10 = *((_BYTE *)a1 + 32);
  v16 = *((_BYTE *)a1 + 33);
  v11 = *(_QWORD *)(*v4 + 136);
  v12 = *(_QWORD *)(*v4 + 152);
  type metadata accessor for Node(0, v11, v12, a4);
  OUTLINED_FUNCTION_6_18();
  v13 = sub_1BA19AC9C();
  *(_OWORD *)(v4 + 5) = v17;
  v4[7] = v9;
  v4[8] = v8;
  *((_BYTE *)v4 + 72) = v10;
  *((_BYTE *)v4 + 73) = v16;
  v4[10] = v13;
  v4[11] = a2;
  v4[12] = a3;
  swift_bridgeObjectRetain();
  swift_release();
  LOBYTE(v18[0]) = 12;
  Node.init(kind:identifier:)(v18, a2, a3);
  v14 = *(_QWORD *)(v7 + 144);
  v15 = *(_QWORD *)(v7 + 160);
  v18[0] = v11;
  v18[1] = v14;
  v18[2] = v12;
  v18[3] = v15;
  type metadata accessor for LayoutBuilder();
}

uint64_t sub_1BA1658AC()
{
  uint64_t v0;
  uint64_t v1;
  void (*v3)(uint64_t);

  v1 = sub_1BA165A60(v0);
  swift_retain_n();
  v3(v1);
  swift_release();
  swift_release();
  return v0;
}

void Layout.init(tryCanvas:name:block:)(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  _QWORD v18[4];

  v7 = *v4;
  v17 = *a1;
  v8 = *((_QWORD *)a1 + 2);
  v9 = *((_QWORD *)a1 + 3);
  v10 = *((_BYTE *)a1 + 32);
  v16 = *((_BYTE *)a1 + 33);
  v11 = *(_QWORD *)(*v4 + 136);
  v12 = *(_QWORD *)(*v4 + 152);
  type metadata accessor for Node(0, v11, v12, a4);
  OUTLINED_FUNCTION_6_18();
  v13 = sub_1BA19AC9C();
  *(_OWORD *)(v4 + 5) = v17;
  v4[7] = v8;
  v4[8] = v9;
  *((_BYTE *)v4 + 72) = v10;
  *((_BYTE *)v4 + 73) = v16;
  v4[10] = v13;
  v4[11] = a2;
  v4[12] = a3;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_4_5();
  LOBYTE(v18[0]) = 12;
  Node.init(kind:identifier:)(v18, a2, a3);
  v14 = *(_QWORD *)(v7 + 144);
  v15 = *(_QWORD *)(v7 + 160);
  v18[0] = v11;
  v18[1] = v14;
  v18[2] = v12;
  v18[3] = v15;
  type metadata accessor for LayoutBuilder();
}

uint64_t sub_1BA1659E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v5)(uint64_t);

  v2 = sub_1BA165A60(v0);
  swift_retain_n();
  v3 = *(_QWORD *)(v1 - 72);
  v5(v2);
  OUTLINED_FUNCTION_2();
  swift_release();
  if (v3)
    swift_release();
  return v0;
}

void type metadata accessor for LayoutBuilder()
{
  JUMPOUT(0x1BCCD681CLL);
}

uint64_t sub_1BA165A60(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

uint64_t FastLayoutDecoder.decode<A>(_:)()
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
  _BYTE *v9;

  v1 = *(_QWORD *)(v0 + 32);
  if (v1 == 1)
  {
    LayoutItemList.flipRightToLeft(bounds:)(*(double *)v0, *(double *)(v0 + 8), *(double *)(v0 + 16), *(double *)(v0 + 24));
    OUTLINED_FUNCTION_0_16();
    swift_bridgeObjectRetain();
    v5 = OUTLINED_FUNCTION_4_5();
    MEMORY[0x1E0C80A78](v5, v6);
    OUTLINED_FUNCTION_2_36();
    v7 = OUTLINED_FUNCTION_14();
    MEMORY[0x1BCCD6858](MEMORY[0x1E0DEAF38], v7);
  }
  else
  {
    if (v1)
    {
      sub_1BA18B270();
      v8 = OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7_20(v8, v9);
      return v0;
    }
    v2 = OUTLINED_FUNCTION_0_16();
    MEMORY[0x1E0C80A78](v2, v3);
    OUTLINED_FUNCTION_2_36();
    v4 = OUTLINED_FUNCTION_14();
    swift_bridgeObjectRetain();
    MEMORY[0x1BCCD6858](MEMORY[0x1E0DEAF38], v4);
  }
  v0 = sub_1BA19ABF4();
  swift_bridgeObjectRelease();
  return v0;
}

void BuilderType.embed<A, B, C>(name:keyPath:size:_:layout:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5)
{
  unint64_t v5;
  unint64_t v6;

  v5 = *a4;
  sub_1BA168200(&v5, a5, &v6);
  v5 = v6;
  swift_getAssociatedConformanceWitness();
  Embed<A, B, C, D>(name:_:_:_:)();
}

uint64_t sub_1BA165CA8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  sub_1BA18D3BC(v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 40))(a1, v2, v1);
  return OUTLINED_FUNCTION_2_26();
}

void Embed<A, B, C, D>(name:_:_:_:)()
{
  OUTLINED_FUNCTION_0_11();
}

uint64_t sub_1BA165D2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v6;

  v6 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1BA1683F8(v4);
  swift_retain();
  return sub_1BA166004(v3, v2, v1, (uint64_t *)&v6, v0, 0, 0);
}

void BuilderType.mapEmbed<A, B, C>(name:keyPath:size:positions:layout:mapBlock:)(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4, uint64_t a5, _QWORD *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  OUTLINED_FUNCTION_44(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

void sub_1BA165DB4()
{
  OUTLINED_FUNCTION_15_1();
}

void sub_1BA165DBC(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4, uint64_t a5, _QWORD *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v16;
  unint64_t v17;

  v11 = *a3;
  v12 = (_QWORD *)*a6;
  v17 = *a4;
  sub_1BA168200(&v17, a5, &v16);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a9;
  v14 = *(_QWORD *)(v11 + *MEMORY[0x1E0DEE2A8] + 8);
  v13[3] = *(_QWORD *)(v14 + 80);
  v13[4] = v12[17];
  v13[5] = v12[18];
  v13[6] = a10;
  v13[7] = *(_QWORD *)(v14 + 88);
  v13[8] = v12[19];
  v13[9] = v12[20];
  v13[10] = a7;
  v13[11] = a8;
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_19_1();
  MapEmbed<A, B, C, D>(name:_:_:_:_:)();
}

uint64_t sub_1BA165ED4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v5;

  swift_release();
  sub_1BA18D3BC(v5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 40))(a1, v1, v2);
  return OUTLINED_FUNCTION_20();
}

void MapEmbed<A, B, C, D>(name:_:_:_:_:)()
{
  OUTLINED_FUNCTION_0_11();
}

uint64_t sub_1BA165F88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v8;

  v8 = v6;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1BA1683F8(v6);
  swift_retain();
  swift_retain();
  return sub_1BA166004(v5, v4, v3, (uint64_t *)&v8, v2, v1, v0);
}

void type metadata accessor for EmbedLayout()
{
  JUMPOUT(0x1BCCD681CLL);
}

uint64_t sub_1BA166004(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  swift_allocObject();
  return sub_1BA166084(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_1BA166084(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v10;
  char v12;

  v10 = *a4;
  v7[5] = a3;
  v7[6] = v10;
  v7[7] = a5;
  v7[8] = a1;
  v7[9] = a2;
  v7[10] = a6;
  v7[11] = a7;
  v12 = 4;
  swift_bridgeObjectRetain();
  return Node.init(kind:identifier:)(&v12, a1, a2);
}

uint64_t dispatch thunk of Layout.layout(layoutOptions:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

void sub_1BA166104()
{
  type metadata accessor for Layout.DebugLayoutAttributes();
}

void sub_1BA166158(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  MEMORY[0x1E0C80A78](a1, a2);
  *(_QWORD *)(v3 - 80) = 0;
  *(_OWORD *)(v3 - 112) = 0u;
  *(_OWORD *)(v3 - 96) = 0u;
  sub_1BA166240(v2, v3 - 112);
}

uint64_t sub_1BA1661A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  result = sub_1BA16AE90(v5 - 112);
  if (!v1)
  {
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v5 - 128) - 8) + 16))(v0, v3);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v3, v2);
  }
  return result;
}

uint64_t sub_1BA166200(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 8))();
  return swift_release();
}

void sub_1BA166240(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[20];
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v8[18] = a2;
  v3 = *(_QWORD *)(*(_QWORD *)v2 + 144);
  v8[4] = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  v8[6] = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = v5[19];
  v6 = v5[20];
  v9 = v5[17];
  v10 = v9;
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8[5] = v6;
  type metadata accessor for Layout.InternalLayoutResult();
}

void sub_1BA1662E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  const void *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  __int128 v15;
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
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  *(_QWORD *)(v2 + 24) = a1;
  MEMORY[0x1E0C80A78](a1, a2);
  *(_QWORD *)(v2 + 168) = (char *)&v34 - v10;
  OUTLINED_FUNCTION_7_0((void *)(v2 + 560), v3);
  OUTLINED_FUNCTION_7_0((void *)(v2 + 760), v3);
  if ((*(_BYTE *)(v9 + 73) & 1) != 0)
  {
    *(_QWORD *)(v2 + 8) = v7;
    *(_QWORD *)(v2 + 16) = v6;
    *(_QWORD *)(v2 + 152) = v5;
    *(_QWORD *)(v2 + 128) = 0;
    *(_QWORD *)(v2 + 136) = 0;
    *(_QWORD *)(v2 + 112) = 0;
    *(_QWORD *)(v2 + 120) = 0;
    *(_QWORD *)(v2 + 96) = 0;
    *(_QWORD *)(v2 + 104) = 0;
    *(_QWORD *)(v2 + 72) = 0;
    *(_QWORD *)(v2 + 80) = 0;
    v11 = 0;
    *(_QWORD *)(v2 + 56) = 0;
    *(_QWORD *)(v2 + 64) = 0;
    v12 = 0;
    v13 = 0;
    *(_QWORD *)(v2 + 88) = 3;
    goto LABEL_5;
  }
  v14 = *(_BYTE *)(v9 + 72);
  v15 = *(_OWORD *)(v9 + 56);
  *(_OWORD *)(v2 + 192) = *(_OWORD *)(v9 + 40);
  *(_OWORD *)(v2 + 208) = v15;
  *(_BYTE *)(v2 + 224) = v14 & 1;
  OUTLINED_FUNCTION_7_0((void *)(v2 + 248), v3);
  ColumnSystem.options(layoutOptions:)((void *)(v2 + 248), v2 + 448);
  if (!v5)
  {
    *(_QWORD *)(v2 + 8) = v7;
    *(_QWORD *)(v2 + 16) = v6;
    *(_QWORD *)(v2 + 152) = 0;
    *(_QWORD *)(v2 + 88) = *(unsigned __int8 *)(v2 + 448);
    v16 = v4[1];
    *(_QWORD *)(v2 + 128) = v4[2];
    *(_QWORD *)(v2 + 136) = v16;
    v17 = v4[3];
    *(_QWORD *)(v2 + 112) = v4[4];
    *(_QWORD *)(v2 + 120) = v17;
    v18 = v4[5];
    *(_QWORD *)(v2 + 96) = v4[6];
    *(_QWORD *)(v2 + 104) = v18;
    v19 = v4[7];
    v11 = v4[9];
    *(_QWORD *)(v2 + 72) = v4[8];
    *(_QWORD *)(v2 + 80) = v19;
    v20 = v4[10];
    *(_QWORD *)(v2 + 56) = v4[11];
    *(_QWORD *)(v2 + 64) = v20;
    v12 = v4[12];
    v13 = v4[13];
LABEL_5:
    sub_1BA19AD68();
    sub_1BA19ADC8();
    type metadata accessor for Cursor(0, *(_QWORD *)(v2 + 160), v8, v21);
    OUTLINED_FUNCTION_7_0((void *)(v2 + 248), (const void *)(v2 + 560));
    v22 = *(_QWORD *)(v2 + 136);
    *v4 = *(_QWORD *)(v2 + 88);
    v4[1] = v22;
    v23 = *(_QWORD *)(v2 + 120);
    v4[2] = *(_QWORD *)(v2 + 128);
    v4[3] = v23;
    v24 = *(_QWORD *)(v2 + 104);
    v4[4] = *(_QWORD *)(v2 + 112);
    v4[5] = v24;
    v25 = *(_QWORD *)(v2 + 80);
    v4[6] = *(_QWORD *)(v2 + 96);
    v4[7] = v25;
    v4[8] = *(_QWORD *)(v2 + 72);
    v4[9] = v11;
    v26 = *(_QWORD *)(v2 + 56);
    v4[10] = *(_QWORD *)(v2 + 64);
    v4[11] = v26;
    v4[12] = v12;
    v4[13] = v13;
    *(_BYTE *)(v2 + 247) = 1;
    sub_1BA16AECC(*(_QWORD *)(v2 + 144), v2 + 192);
    v27 = v4[29];
    v28 = v4[30];
    *(_QWORD *)(v2 + 184) = 0x8000000000000000;
    OUTLINED_FUNCTION_11_9();
    *(_QWORD *)(v2 + 144) = v8;
    sub_1BA18E954((_BYTE *)(v2 + 182));
    v29 = *(_BYTE *)(v2 + 183);
    *(_BYTE *)(v2 + 180) = *(_BYTE *)(v2 + 182);
    *(_BYTE *)(v2 + 181) = v29;
    v30 = sub_1BA180820(v2 + 248, (__int128 *)(v2 + 448), (char *)(v2 + 247), v2 + 192, v27, v28, 1, (char *)(v2 + 180), (uint64_t *)(v2 + 184), 0);
    type metadata accessor for LayoutContextRecords();
    v31 = OUTLINED_FUNCTION_6();
    *(_QWORD *)(v31 + 16) = MEMORY[0x1E0DEE9D8];
    type metadata accessor for LayoutContext();
    OUTLINED_FUNCTION_6();
    *v4 = sub_1BA167F50(v31);
    sub_1BA16D270(v9, 0, *(_QWORD *)(v9 + 88), *(_QWORD *)(v9 + 96));
    *(_QWORD *)(v2 + 272) = &unk_1E71E8D98;
    *(_QWORD *)(v2 + 280) = &off_1E71E8E28;
    v32 = OUTLINED_FUNCTION_6();
    *(_QWORD *)(v2 + 248) = v32;
    OUTLINED_FUNCTION_7_0((void *)(v32 + 16), (const void *)(v2 + 760));
    v33 = OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_7_0((void *)(v33 + 16), (const void *)(v2 + 560));
    OUTLINED_FUNCTION_11_9();
    OUTLINED_FUNCTION_11_9();
    sub_1BA192A08(v30, 1, v2 + 448, v2 + 248, (uint64_t)sub_1BA17175C, v33, *(_QWORD *)(v2 + 168));
  }
}

uint64_t sub_1BA1667D4(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 144);
  v3 = *(id *)(a1 + 80);
  v4 = v2;
  swift_retain();
  return a1;
}

void Layout.DebugLayoutAttributes.init(layoutAttributes:debugData:)(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  OUTLINED_FUNCTION_0_36(a1, a2, a3);
  OUTLINED_FUNCTION_13_7();
  type metadata accessor for Layout.DebugLayoutAttributes();
}

void sub_1BA16683C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + *(int *)(a1 + 52)) = v1;
  OUTLINED_FUNCTION_4_22();
}

void type metadata accessor for Layout.DebugLayoutAttributes()
{
  JUMPOUT(0x1BCCD681CLL);
}

uint64_t type metadata accessor for DebugLayoutData()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for LayoutContextRecords()
{
  return objc_opt_self();
}

void ColumnSystem.options(layoutOptions:)(void *__src@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t *v15;
  __int128 v16;
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
  char __dst[200];

  v5 = memcpy(__dst, __src, sizeof(__dst));
  v13 = *(_QWORD *)(v2 + 8);
  v14 = *(_OWORD *)(v2 + 16);
  if (*(_BYTE *)(v2 + 32) == 1)
  {
    if ((unint64_t)v14 | v13 | *(_QWORD *)v2 | *((_QWORD *)&v14 + 1))
    {
      LOBYTE(v17) = 1;
      LOBYTE(v29) = 1;
      OUTLINED_FUNCTION_4_6((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12, 1, 0, 0, 0, v17, v18, v19, v20, v21, v22, v23,
        v24,
        0,
        0,
        0,
        0,
        v29,
        v30,
        v31,
        v32,
        v33,
        v34,
        v35,
        __dst[0]);
      v15 = &v25;
    }
    else
    {
      LOBYTE(v23) = 1;
      LOBYTE(v17) = 1;
      OUTLINED_FUNCTION_4_6((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12, 0, 0, 0, 0, v17, v18, 0, 0, 0, 0, v23,
        v24,
        v25,
        v26,
        v27,
        v28,
        v29,
        v30,
        v31,
        v32,
        v33,
        v34,
        v35,
        __dst[0]);
      v15 = &v19;
    }
  }
  else
  {
    v31 = *(_QWORD *)v2;
    LOBYTE(v35) = 0;
    LOBYTE(v17) = 1;
    OUTLINED_FUNCTION_4_6((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12, 0, 0, 0, 0, v17, v18, v19, v20, v21, v22, v23,
      v24,
      v25,
      v26,
      v27,
      v28,
      v29,
      v30,
      v31,
      v13,
      v14,
      *((uint64_t *)&v14 + 1),
      v35,
      __dst[0]);
    v15 = &v31;
  }
  ColumnSystem.Options.init(columnSystem:layoutOptions:layoutMargins:)((double *)&v16, __src, (uint64_t)v15, a2);
}

void ColumnSystem.Options.init(columnSystem:layoutOptions:layoutMargins:)(double *a1@<X0>, const void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  double v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  id v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  double v26;
  double v27;
  id v28;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE v46[32];
  _QWORD __dst[26];
  double v48;

  sub_1BA166C84(a3, (uint64_t)&v45);
  v8 = *a1;
  v48 = a1[1];
  v42 = *((_QWORD *)a1 + 3);
  v43 = *((_QWORD *)a1 + 2);
  v9 = *((unsigned __int8 *)a1 + 32);
  memcpy(__dst, a2, 0xC8uLL);
  v10 = (void *)__dst[10];
  v11 = static ColumnSystem.specs(for:)((void *)__dst[10]);
  v12 = *(_QWORD *)(v11 + 16);
  if (v12)
  {
    v41 = v8;
    v13 = __dst[0];
    v14 = __dst[1];
    v15 = (double *)(v11 + 48);
    while (1)
    {
      v16 = *((char *)v15 - 16);
      v18 = *(v15 - 1);
      v17 = *v15;
      v19 = OUTLINED_FUNCTION_0_12();
      if (v18 <= v19 && v19 < v17)
        break;
      v15 += 3;
      if (!--v12)
      {
        OUTLINED_FUNCTION_1();
        v21 = v10;
        v22 = OUTLINED_FUNCTION_0_12();
        sub_1BA1787C0();
        OUTLINED_FUNCTION_7();
        *(_QWORD *)v23 = v21;
        *(double *)(v23 + 8) = v22;
        *(_QWORD *)(v23 + 16) = 0;
        *(_BYTE *)(v23 + 24) = 1;
        goto LABEL_10;
      }
    }
    OUTLINED_FUNCTION_1();
    if (!v9 || (v26 = 10.0, v27 = 10.0, !(v43 | *(_QWORD *)&v48 | *(_QWORD *)&v41 | v42)))
    {
      v27 = 28.0;
      if ((_BYTE)v16)
      {
        if (v16 == 1)
        {
          v28 = objc_msgSend(v10, sel_horizontalSizeClass);
          if (objc_msgSend(v10, sel_verticalSizeClass) == (id)1 && v28 == (id)1)
            v26 = 18.0;
          else
            v26 = 20.0;
        }
        else
        {
          v26 = 30.0;
        }
      }
      else
      {
        v26 = 18.0;
      }
    }
    v30 = OUTLINED_FUNCTION_0_12();
    Column.traits(for:viewportWidth:)(v10, &v44, v30);
    v31 = v44;
    sub_1BA166C84(a3, (uint64_t)v46);
    v32 = v27;
    v48 = LayoutMarginAdjuster.adjust(layoutMargins:hSpacing:vSpacing:)();
    v34 = v33;
    v36 = v35;
    v38 = v37;
    sub_1BA17AB1C((uint64_t)__dst);
    v39 = 1.0;
    if ((v31 & 4) == 0)
    {
      v40 = OUTLINED_FUNCTION_0_12() - v34 - v38;
      if (v40 != 1.79769313e308)
        v39 = v40 / dbl_1BA19CB20[v16];
    }
    *(_BYTE *)a4 = v16;
    *(_QWORD *)(a4 + 8) = v31;
    *(double *)(a4 + 16) = v32 * v39;
    *(double *)(a4 + 24) = v32;
    *(double *)(a4 + 32) = v26 * v39;
    *(double *)(a4 + 40) = v26;
    *(_QWORD *)(a4 + 48) = 0;
    *(_QWORD *)(a4 + 56) = 0;
    *(_QWORD *)(a4 + 64) = v13;
    *(_QWORD *)(a4 + 72) = v14;
    *(double *)(a4 + 80) = v48;
    *(double *)(a4 + 88) = v34;
    *(_QWORD *)(a4 + 96) = v36;
    *(double *)(a4 + 104) = v38;
  }
  else
  {
    OUTLINED_FUNCTION_1();
    sub_1BA1787C0();
    OUTLINED_FUNCTION_7();
    *(_QWORD *)(v24 + 8) = 0;
    *(_QWORD *)(v24 + 16) = 0;
    *(_QWORD *)v24 = v10;
    *(_BYTE *)(v24 + 24) = 2;
    v25 = v10;
LABEL_10:
    swift_willThrow();
    sub_1BA17AB1C((uint64_t)__dst);
  }
}

uint64_t sub_1BA166C84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BA166CE0(0, &qword_1ED5C9FB8, (uint64_t (*)(uint64_t))type metadata accessor for UIEdgeInsets, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1BA166CE0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

double LayoutMarginAdjuster.adjust(layoutMargins:hSpacing:vSpacing:)()
{
  _QWORD *v0;
  double v1;
  double v2;
  unint64_t v4;

  v4 = v0[2];
  sub_1BA166E90(v4);
  OUTLINED_FUNCTION_4_12(&v4);
  v2 = v1;
  OUTLINED_FUNCTION_6_7();
  v4 = v0[3];
  sub_1BA166E90(v4);
  OUTLINED_FUNCTION_4_12(&v4);
  OUTLINED_FUNCTION_6_7();
  v4 = v0[4];
  sub_1BA166E90(v4);
  OUTLINED_FUNCTION_4_12(&v4);
  OUTLINED_FUNCTION_6_7();
  v4 = v0[5];
  sub_1BA166E90(v4);
  OUTLINED_FUNCTION_4_12(&v4);
  OUTLINED_FUNCTION_6_7();
  return v2;
}

uint64_t LayoutMarginAdjuster.__deallocating_deinit()
{
  LayoutMarginAdjuster.deinit();
  return swift_deallocClassInstance();
}

unint64_t *LayoutMarginAdjuster.deinit()
{
  unint64_t *v0;

  sub_1BA166E7C(v0[2]);
  sub_1BA166E7C(v0[3]);
  sub_1BA166E7C(v0[4]);
  sub_1BA166E7C(v0[5]);
  return v0;
}

unint64_t sub_1BA166E7C(unint64_t result)
{
  if ((~result & 0xF000000000000007) != 0)
    return sub_1BA17FB74(result);
  return result;
}

unint64_t sub_1BA166E90(unint64_t result)
{
  if ((~result & 0xF000000000000007) != 0)
    return sub_1BA17FB44(result);
  return result;
}

_QWORD *sub_1BA166EA4(_QWORD *result)
{
  if ((~*result & 0xF000000000000007) != 0)
    __asm { BR              X11 }
  return result;
}

void sub_1BA166F18()
{
  JUMPOUT(0x1BA166ED4);
}

void sub_1BA166F20(uint64_t a1@<X8>, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  a3 = v3;
  sub_1BA17FB44(v3);
  sub_1BA17FB44(v3);
  sub_1BA17FB44(v4);
  sub_1BA166EA4(&a3);
  sub_1BA17FB74(v3);
  a3 = v4;
  sub_1BA17FB44(v4);
  sub_1BA166EA4(&a3);
  sub_1BA17FB74(v4);
  sub_1BA17FB74(v3);
  sub_1BA17FB74(v4);
  JUMPOUT(0x1BA166ED4);
}

void sub_1BA166FA4(uint64_t a1@<X8>, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  a3 = v3;
  sub_1BA17FB44(v3);
  sub_1BA17FB44(v3);
  sub_1BA17FB44(v4);
  sub_1BA166EA4(&a3);
  sub_1BA17FB74(v3);
  a3 = v4;
  sub_1BA17FB44(v4);
  sub_1BA166EA4(&a3);
  sub_1BA17FB74(v4);
  sub_1BA17FB74(v3);
  sub_1BA17FB74(v4);
  JUMPOUT(0x1BA166ED4);
}

void sub_1BA167028(uint64_t a1@<X8>, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  a3 = v3;
  sub_1BA17FB44(v3);
  sub_1BA17FB44(v3);
  sub_1BA17FB44(v4);
  sub_1BA166EA4(&a3);
  sub_1BA17FB74(v3);
  a3 = v4;
  sub_1BA17FB44(v4);
  sub_1BA166EA4(&a3);
  sub_1BA17FB74(v4);
  sub_1BA17FB74(v3);
  sub_1BA17FB74(v4);
  JUMPOUT(0x1BA166ED4);
}

void sub_1BA1670AC(uint64_t a1@<X8>, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  a3 = v3;
  sub_1BA17FB44(v3);
  sub_1BA17FB44(v3);
  sub_1BA17FB44(v4);
  sub_1BA166EA4(&a3);
  sub_1BA17FB74(v3);
  a3 = v4;
  sub_1BA17FB44(v4);
  sub_1BA166EA4(&a3);
  sub_1BA17FB74(v4);
  sub_1BA17FB74(v3);
  sub_1BA17FB74(v4);
  JUMPOUT(0x1BA166ED4);
}

void sub_1BA167130()
{
  JUMPOUT(0x1BA166ED4);
}

uint64_t static ColumnSystem.specs(for:)(void *a1)
{
  id v2;
  id v3;
  uint64_t result;
  _QWORD *v5;

  v2 = objc_msgSend(a1, sel_horizontalSizeClass);
  v3 = objc_msgSend(a1, sel_verticalSizeClass);
  if (v2 == (id)2)
  {
    if (v3 == (id)2)
    {
      OUTLINED_FUNCTION_9_2(2, &qword_1ED5C9AC0, (uint64_t (*)(uint64_t))sub_1BA173C54, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
      result = OUTLINED_FUNCTION_6();
      *(_OWORD *)(result + 16) = xmmword_1BA19C890;
      *(_BYTE *)(result + 32) = 0;
      *(_OWORD *)(result + 40) = xmmword_1BA19C8A0;
      *(_BYTE *)(result + 56) = 1;
      *(_OWORD *)(result + 64) = xmmword_1BA19C8B0;
      *(_BYTE *)(result + 80) = 2;
      *(_QWORD *)(result + 88) = 0x408EF00000000000;
      v5 = (_QWORD *)(result + 96);
      goto LABEL_11;
    }
    if (v3 == (id)1)
      goto LABEL_8;
    return MEMORY[0x1E0DEE9D8];
  }
  if (v2 != (id)1)
    return MEMORY[0x1E0DEE9D8];
  if (v3 == (id)1)
  {
LABEL_8:
    OUTLINED_FUNCTION_9_2((uint64_t)v3, &qword_1ED5C9AC0, (uint64_t (*)(uint64_t))sub_1BA173C54, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    result = OUTLINED_FUNCTION_6();
    *(_OWORD *)(result + 16) = xmmword_1BA19C0E0;
    *(_BYTE *)(result + 32) = 1;
    *(_QWORD *)(result + 40) = 0;
    v5 = (_QWORD *)(result + 48);
    goto LABEL_11;
  }
  if (v3 != (id)2)
    return MEMORY[0x1E0DEE9D8];
  OUTLINED_FUNCTION_9_2(2, &qword_1ED5C9AC0, (uint64_t (*)(uint64_t))sub_1BA173C54, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  result = OUTLINED_FUNCTION_6();
  *(_OWORD *)(result + 16) = xmmword_1BA19C8C0;
  *(_BYTE *)(result + 32) = 0;
  *(_OWORD *)(result + 40) = xmmword_1BA19C8D0;
  *(_BYTE *)(result + 56) = 1;
  *(_QWORD *)(result + 64) = 0x4083F80000000000;
  v5 = (_QWORD *)(result + 72);
LABEL_11:
  *v5 = 0x7FEFFFFFFFFFFFFFLL;
  return result;
}

void FastLayoutDecoder.decodeIfPresent<A>(_:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;

  v5 = *(_QWORD *)(*(_QWORD *)a1 + 80);
  sub_1BA19ADEC();
  OUTLINED_FUNCTION_11_12();
  MEMORY[0x1E0C80A78](v6, v7);
  OUTLINED_FUNCTION_6_23();
  MEMORY[0x1E0C80A78](v8, v9);
  OUTLINED_FUNCTION_9_18();
  if (v13)
  {
    OUTLINED_FUNCTION_8_19(v10, v11);
    OUTLINED_FUNCTION_0_16();
    OUTLINED_FUNCTION_4_28();
    OUTLINED_FUNCTION_4_5();
    if (__swift_getEnumTagSinglePayload(v2, 1, v5) != 1)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, v2, v5);
      goto LABEL_11;
    }
    OUTLINED_FUNCTION_12_10(v2, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
    v14 = *(_QWORD *)(v5 + 16);
    v15 = a2;
  }
  else
  {
    if (v12)
    {
      sub_1BA18B270();
      v16 = OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7_20(v16, v17);
      goto LABEL_11;
    }
    OUTLINED_FUNCTION_0_16();
    OUTLINED_FUNCTION_5_29();
    if (__swift_getEnumTagSinglePayload(v3, 1, v5) != 1)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, v3, v5);
      goto LABEL_11;
    }
    OUTLINED_FUNCTION_12_10(v3, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
    v14 = *(_QWORD *)(v5 + 16);
    v15 = a2;
  }
  __swift_storeEnumTagSinglePayload(v15, 1, 1, v14);
LABEL_11:
  OUTLINED_FUNCTION_3_37();
}

_QWORD *sub_1BA167440(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);

  *a1 = *a2;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = ((unint64_t)a1 + v6 + 8) & ~v6;
  v8 = ((unint64_t)a2 + v6 + 8) & ~v6;
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  swift_retain();
  v9(v7, v8, v4);
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + v7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + v8) & 0xFFFFFFFFFFFFF8);
  swift_retain();
  return a1;
}

void FastLayoutDecoder.decode<A>(_:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  char *v16;
  char v17;

  v5 = *(_QWORD *)(*(_QWORD *)a1 + 80);
  sub_1BA19ADEC();
  OUTLINED_FUNCTION_11_12();
  MEMORY[0x1E0C80A78](v6, v7);
  OUTLINED_FUNCTION_6_23();
  MEMORY[0x1E0C80A78](v8, v9);
  OUTLINED_FUNCTION_9_18();
  if (v13)
  {
    OUTLINED_FUNCTION_8_19(v10, v11);
    OUTLINED_FUNCTION_0_16();
    OUTLINED_FUNCTION_4_28();
    OUTLINED_FUNCTION_4_5();
    if (__swift_getEnumTagSinglePayload(v2, 1, v5) == 1)
    {
      v14 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8);
      v15 = v2;
      goto LABEL_7;
    }
LABEL_11:
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, v2, v5);
    goto LABEL_12;
  }
  if (v12)
  {
    sub_1BA18B270();
    OUTLINED_FUNCTION_7();
    v17 = 1;
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_5_29();
  if (__swift_getEnumTagSinglePayload(v3, 1, v5) != 1)
  {
    v2 = v3;
    goto LABEL_11;
  }
  v14 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8);
  v15 = v3;
LABEL_7:
  OUTLINED_FUNCTION_12_10(v15, v14);
  sub_1BA18B270();
  OUTLINED_FUNCTION_7();
  v17 = 0;
LABEL_9:
  *v16 = v17;
  swift_willThrow();
LABEL_12:
  OUTLINED_FUNCTION_3_37();
}

Swift::Void __swiftcall ListBuilder.reserveCapacity(_:)(Swift::Int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = OUTLINED_FUNCTION_2_32();
  OUTLINED_FUNCTION_1_39(v1, v2, v3, v4);
  OUTLINED_FUNCTION_14();
  sub_1BA19AC84();
  swift_endAccess();
  OUTLINED_FUNCTION_3_0();
}

void BuilderType.vBox(name:reversed:size:positions:block:)()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  unint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  OUTLINED_FUNCTION_55();
  sub_1BA167824(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9);
}

void sub_1BA1676A8(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  uint64_t v10;
  unint64_t v13;
  uint64_t AssociatedTypeWitness;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t AssociatedConformanceWitness;
  unint64_t v23[2];
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;

  v13 = *a4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_6_15();
  v15 = OUTLINED_FUNCTION_56();
  type metadata accessor for Box(v15, v16, v17, v18);
  v23[0] = v13;
  sub_1BA168200(v23, a5, (unint64_t *)&v27);
  LOBYTE(v23[0]) = a10;
  v26 = 2;
  swift_bridgeObjectRetain();
  sub_1BA16799C(&v26, &v27, (char *)v23, a1, a2, a3);
  (*(void (**)(void))(a9 + 40))();
  v19 = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v23[0] = AssociatedTypeWitness;
  v23[1] = v19;
  v24 = v10;
  v25 = AssociatedConformanceWitness;
  OUTLINED_FUNCTION_40();
  type metadata accessor for BoxBuilder();
}

uint64_t sub_1BA1677E4()
{
  uint64_t v0;
  void (*v2)(uint64_t);

  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_19_1();
  v2(v0);
  OUTLINED_FUNCTION_20();
  return swift_release();
}

void sub_1BA167824(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  unint64_t v11;
  unint64_t AssociatedTypeWitness;
  unint64_t AssociatedConformanceWitness;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v21[4];
  char v22;
  uint64_t v23;

  v11 = *a4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v15 = type metadata accessor for Box(0, AssociatedTypeWitness, AssociatedConformanceWitness, v14);
  v21[0] = v11;
  OUTLINED_FUNCTION_47(v21, a5, (unint64_t *)&v23);
  LOBYTE(v21[0]) = a10;
  v22 = 2;
  swift_bridgeObjectRetain();
  v16 = sub_1BA16799C(&v22, &v23, (char *)v21, a1, a2, a3);
  OUTLINED_FUNCTION_20_1(v16);
  OUTLINED_FUNCTION_10_9();
  v17 = OUTLINED_FUNCTION_7_13();
  v21[0] = AssociatedTypeWitness;
  v21[1] = v15;
  v21[2] = AssociatedConformanceWitness;
  v21[3] = v17;
  type metadata accessor for BoxBuilder();
}

uint64_t sub_1BA167940()
{
  uint64_t v0;
  void (*v2)(uint64_t);

  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_45();
  v2(v0);
  OUTLINED_FUNCTION_37();
  return OUTLINED_FUNCTION_20();
}

void type metadata accessor for BoxBuilder()
{
  JUMPOUT(0x1BCCD681CLL);
}

uint64_t type metadata accessor for Box(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Box);
}

uint64_t sub_1BA16799C(char *a1, uint64_t *a2, char *a3, uint64_t a4, uint64_t a5, char a6)
{
  swift_allocObject();
  return sub_1BA169174(a1, a2, a3, a4, a5, a6);
}

uint64_t LayoutItem.init(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 96);
  __swift_storeEnumTagSinglePayload(v3, 1, 1, *(_QWORD *)(*(_QWORD *)v1 + 80));
  OUTLINED_FUNCTION_0_14();
  v4 = sub_1BA19ADEC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  swift_endAccess();
  return v1;
}

uint64_t LayoutContext.__deallocating_deinit()
{
  LayoutContext.deinit();
  return swift_deallocClassInstance();
}

uint64_t LayoutContext.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t destroy for LayoutOptions(uint64_t a1)
{

  return swift_release();
}

uint64_t initializeWithCopy for LayoutOptions(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  v5 = *(void **)(a2 + 80);
  *(_QWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  v6 = *(void **)(a2 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v6;
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_BYTE *)(a1 + 184) = *(_BYTE *)(a2 + 184);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  v7 = v5;
  v8 = v6;
  swift_retain();
  return a1;
}

uint64_t type metadata accessor for LayoutMarginAdjuster()
{
  return objc_opt_self();
}

_QWORD *LayoutMarginAdjuster.init(top:left:bottom:right:)(_QWORD *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *a2;
  v6 = *a3;
  v7 = *a4;
  v4[2] = *a1;
  v4[3] = v5;
  v4[4] = v6;
  v4[5] = v7;
  return v4;
}

uint64_t sub_1BA167C0C()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

void sub_1BA167C40(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  OUTLINED_FUNCTION_0_36(a1, a2, a3);
  OUTLINED_FUNCTION_13_7();
  type metadata accessor for Layout.InternalLayoutResult();
}

void sub_1BA167C64(uint64_t a1)
{
  _OWORD *v1;
  uint64_t v2;
  _OWORD *v3;
  __int128 v4;
  __int128 v5;

  v3 = (_OWORD *)(v2 + *(int *)(a1 + 52));
  v4 = v1[1];
  *v3 = *v1;
  v3[1] = v4;
  v5 = v1[3];
  v3[2] = v1[2];
  v3[3] = v5;
  OUTLINED_FUNCTION_4_22();
}

void type metadata accessor for Layout.InternalLayoutResult()
{
  JUMPOUT(0x1BCCD681CLL);
}

uint64_t type metadata accessor for LayoutDecoder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LayoutDecoder);
}

uint64_t sub_1BA167C9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_11();
  v5 = swift_allocObject();
  OUTLINED_FUNCTION_2_14();
  sub_1BA1687E4(v6, a2, a3);
  return v5;
}

uint64_t sub_1BA167D18@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[6];

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 80);
  v6 = type metadata accessor for LayoutDecoder.ObjectPath(0, v5, *(_QWORD *)(*v2 + 88), a1);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)v16 - v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)v16 - v8, (uint64_t)v2 + *(_QWORD *)(v4 + 96), v6);
  if (swift_getEnumCaseMultiPayload() != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, v9, v5);
  v11 = *(_QWORD *)v9;
  v12 = v9[8];
  v13 = type metadata accessor for _LayoutDecoder();
  swift_allocObject();
  v14 = sub_1BA17165C(v11, v12);
  v16[4] = v13;
  v16[5] = sub_1BA17161C();
  v16[1] = v14;
  return sub_1BA19ACFC();
}

uint64_t sub_1BA167E50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  char v9;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 9uLL)
    v5 = 9;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *(unsigned __int8 *)(a2 + v5);
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 1)
  {
    v8 = *(_BYTE *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_BYTE *)(a1 + 8) = v8;
    swift_bridgeObjectRetain();
    v9 = 1;
  }
  else
  {
    (*(void (**)(uint64_t))(v4 + 16))(a1);
    v9 = 0;
  }
  *(_BYTE *)(a1 + v5) = v9;
  return a1;
}

uint64_t type metadata accessor for LayoutContext()
{
  return objc_opt_self();
}

uint64_t sub_1BA167F50(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = MEMORY[0x1E0DEE9E0];
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  *(_QWORD *)(v1 + 64) = v2;
  *(_QWORD *)(v1 + 72) = v2;
  *(_QWORD *)(v1 + 48) = a1;
  *(_QWORD *)(v1 + 56) = v2;
  return v1;
}

unint64_t sub_1BA167F70(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  unint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  result = a2();
  if (!v6)
  {
    MEMORY[0x1E0C80A78](result, v10);
    type metadata accessor for Positioning(255, a5, a6, v11);
    v12 = sub_1BA19ACE4();
    type metadata accessor for Sizing(0, a5, a6, v13);
    MEMORY[0x1BCCD6858](MEMORY[0x1E0DEAF38], v12);
    sub_1BA19AC00();
    swift_bridgeObjectRelease();
    sub_1BA16A170();
    return sub_1BA168614(v14);
  }
  return result;
}

void sub_1BA16809C()
{
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_40();
  type metadata accessor for Frame();
}

uint64_t sub_1BA168140()
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
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v14 = v7;
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_47(&v14, v1, (unint64_t *)(v8 - 72));
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v2;
  v9[3] = *(_QWORD *)(v3 + 80);
  v9[4] = v4;
  v9[5] = *(_QWORD *)(v3 + 88);
  v9[6] = v11;
  v9[7] = v0;
  swift_retain();
  Frame.__allocating_init(name:_:_:mapBlock:)(v12, v6, v5, (uint64_t *)(v8 - 72), v13, (uint64_t)v9);
  (*(void (**)(void))(v4 + 40))();
  return OUTLINED_FUNCTION_20();
}

uint64_t sub_1BA168200@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  unint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  char v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  uint64_t v18;
  unint64_t *v19;
  uint64_t AssociatedConformanceWitness;
  uint64_t v21;
  _QWORD v22[4];
  char v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;

  v5 = *a1;
  sub_1BA1683F8(*a1);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v21 = AssociatedTypeWitness;
  v8 = type metadata accessor for Positioning(0, AssociatedTypeWitness, AssociatedConformanceWitness, v7);
  swift_bridgeObjectRetain();
  v9 = sub_1BA19AC60();
  v26 = v9;
  if (v9 == MEMORY[0x1BCCD5FA0](a2, v8))
  {
    result = swift_bridgeObjectRelease();
LABEL_7:
    *a3 = v5;
  }
  else
  {
    v19 = a3;
    while (1)
    {
      v11 = sub_1BA19ACA8();
      sub_1BA19AC78();
      if ((v11 & 1) == 0)
        break;
      v12 = a2 + 32 + 40 * v9;
      v13 = *(void **)v12;
      v14 = *(_QWORD *)(v12 + 8);
      v16 = *(void **)(v12 + 16);
      v15 = *(_QWORD *)(v12 + 24);
      v17 = *(_BYTE *)(v12 + 32);
      swift_bridgeObjectRetain();
      sub_1BA1684BC(v13, v14, v16, v15, v17);
      MEMORY[0x1BCCD5FAC](&v26, a2, v8);
      swift_bridgeObjectRelease();
      v24 = v5;
      v22[0] = v13;
      v22[1] = v14;
      v22[2] = v16;
      v22[3] = v15;
      v23 = v17;
      type metadata accessor for Sizing(0, v21, AssociatedConformanceWitness, v18);
      Sizing.add(position:)((uint64_t)v22);
      sub_1BA18D3BC(v5);
      sub_1BA18DCE0(v13, v14, v16, v15, v17);
      v5 = v25;
      v9 = v26;
      if (v9 == MEMORY[0x1BCCD5FA0](a2, v8))
      {
        result = swift_bridgeObjectRelease();
        a3 = v19;
        goto LABEL_7;
      }
    }
    result = sub_1BA19AEAC();
    __break(1u);
  }
  return result;
}

unint64_t sub_1BA1683F8(unint64_t result)
{
  switch((result >> 59) & 0x1E | (result >> 2) & 1)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
      result = swift_retain();
      break;
    default:
      return result;
  }
  return result;
}

void sub_1BA168434(void *a1, uint64_t a2, void *a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 15:
    case 16:
    case 23:
    case 24:
      goto LABEL_3;
    case 17:
    case 18:
    case 19:
    case 20:
      swift_bridgeObjectRelease();
      a1 = a3;
LABEL_3:

      break;
    case 26:
      swift_bridgeObjectRelease();
      break;
    case 27:
    case 28:
      swift_release();
      break;
    default:
      return;
  }
}

uint64_t type metadata accessor for Positioning(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Positioning);
}

id sub_1BA1684BC(id result, uint64_t a2, void *a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 15:
    case 16:
    case 23:
    case 24:
      goto LABEL_3;
    case 17:
    case 18:
    case 19:
    case 20:
      swift_bridgeObjectRetain();
      result = a3;
LABEL_3:
      result = result;
      break;
    case 26:
      result = (id)swift_bridgeObjectRetain();
      break;
    case 27:
    case 28:
      result = (id)swift_retain();
      break;
    default:
      return result;
  }
  return result;
}

void Sizing.add(position:)(uint64_t a1)
{
  uint64_t *v1;
  char v2;
  __int128 v3;
  _OWORD v4[2];
  char v5;
  uint64_t v6;

  v2 = *(_BYTE *)(a1 + 32);
  v6 = *v1;
  v3 = *(_OWORD *)(a1 + 16);
  v4[0] = *(_OWORD *)a1;
  v4[1] = v3;
  v5 = v2;
  + infix<A>(_:_:)((uint64_t)&v6, (uint64_t)v4);
}

uint64_t Frame.__deallocating_deinit()
{
  Frame.deinit();
  return swift_deallocClassInstance();
}

uint64_t Frame.deinit()
{
  uint64_t v0;

  v0 = Node.deinit();
  swift_release();
  sub_1BA177098(*(_QWORD *)(v0 + 48));
  swift_bridgeObjectRelease();
  sub_1BA162F64(*(_QWORD *)(v0 + 72));
  return v0;
}

uint64_t sub_1BA1685D8()
{
  uint64_t v0;

  v0 = Node.deinit();
  sub_1BA168614(*(_QWORD *)(v0 + 40));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

unint64_t sub_1BA168614(unint64_t result)
{
  switch((result >> 59) & 0x1E | (result >> 2) & 1)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
      result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t Prop.__deallocating_deinit()
{
  Prop.deinit();
  return swift_deallocClassInstance();
}

uint64_t Prop.deinit()
{
  uint64_t v0;

  v0 = Node.deinit();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  return v0;
}

uint64_t Dynamic.__deallocating_deinit()
{
  Dynamic.deinit();
  return swift_deallocClassInstance();
}

uint64_t Dynamic.deinit()
{
  uint64_t v0;

  v0 = Node.deinit();
  swift_release();
  return v0;
}

uint64_t Node.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

void type metadata accessor for Frame()
{
  JUMPOUT(0x1BCCD681CLL);
}

uint64_t Frame.__allocating_init(name:_:_:mapBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  swift_allocObject();
  return Frame.init(name:_:_:mapBlock:)(a1, a2, a3, a4, a5, a6);
}

uint64_t Frame.init(name:_:_:mapBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v9;
  char v11;

  v9 = *a4;
  v6[5] = a3;
  v6[6] = v9;
  v6[7] = a1;
  v6[8] = a2;
  v6[9] = a5;
  v6[10] = a6;
  v11 = 0;
  swift_bridgeObjectRetain();
  return Node.init(kind:identifier:)(&v11, a1, a2);
}

uint64_t sub_1BA1687E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(void);
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(_QWORD *, char *, uint64_t);
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t, double);
  double v51;
  uint64_t v52;
  BOOL v53;
  uint64_t *v54;
  __int128 *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(uint64_t, uint64_t);
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(char *, uint64_t);
  _BYTE *v69;
  uint64_t result;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  _OWORD v82[2];
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  __int128 v86;
  unint64_t v87;
  _OWORD v88[2];
  __int128 v89;
  __int128 v90;
  uint64_t v91;
  uint64_t v92[2];
  __int128 v93;
  uint64_t v94;
  uint64_t v95;
  char v96[8];
  uint64_t v97;
  uint64_t v98;

  v9 = (char *)v3;
  OUTLINED_FUNCTION_4_11();
  v13 = v12;
  v79 = *v3;
  v14 = *(_QWORD *)(v79 + 80);
  v98 = sub_1BA19ADEC();
  v80 = *(_QWORD *)(v98 - 8);
  MEMORY[0x1E0C80A78](v98, v15);
  v17 = (char *)&v71 - v16;
  v76 = v14;
  OUTLINED_FUNCTION_21_0(*(_QWORD *)(v14 - 8));
  MEMORY[0x1E0C80A78](v18, v19);
  OUTLINED_FUNCTION_13_3();
  v74 = (char *)(v21 - v20);
  v75 = sub_1BA19B14C();
  OUTLINED_FUNCTION_21_0(*(_QWORD *)(v75 - 8));
  MEMORY[0x1E0C80A78](v22, v23);
  OUTLINED_FUNCTION_13_3();
  v26 = v25 - v24;
  MEMORY[0x1E0C80A78](v27, v28);
  OUTLINED_FUNCTION_13_3();
  v77 = v29;
  v30 = *(void (**)(void))(v29 + 16);
  ((void (*)(uint64_t, uint64_t, uint64_t))v30)(v32 - v31, v13, a3);
  sub_1BA16E868(0, &qword_1ED5C9E50);
  v33 = OUTLINED_FUNCTION_23();
  v78 = v13;
  if ((v33 & 1) != 0)
  {
    sub_1BA16DE20(&v89, (uint64_t)v92);
    v34 = *((_QWORD *)&v93 + 1);
    v35 = v94;
    __swift_project_boxed_opaque_existential_1(v92, *((uint64_t *)&v93 + 1));
    *(_QWORD *)&v89 = v8;
    *((_QWORD *)&v89 + 1) = v7;
    *(_QWORD *)&v90 = v6;
    *((_QWORD *)&v90 + 1) = v5;
    v91 = a2;
    (*(void (**)(__int128 *__return_ptr, __int128 *, uint64_t, uint64_t))(v35 + 8))(&v83, &v89, v34, v35);
    if (!v4)
    {
      v36 = v76;
      if ((OUTLINED_FUNCTION_23() & 1) != 0)
      {
        OUTLINED_FUNCTION_30_0((uint64_t)v17, 0);
        OUTLINED_FUNCTION_11_6();
        v37 = *(void (**)(_QWORD *, char *, uint64_t))(v73 + 32);
        v38 = v74;
        v37(v74, v17, v36);
        v37(&v9[*(_QWORD *)(*(_QWORD *)v9 + 96)], v38, v36);
        v39 = OUTLINED_FUNCTION_20_0();
        type metadata accessor for LayoutDecoder.ObjectPath(v39, v36, v40, v41);
        swift_storeEnumTagMultiPayload();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v92);
        return (uint64_t)v9;
      }
      OUTLINED_FUNCTION_30_0((uint64_t)v17, 1);
      OUTLINED_FUNCTION_29_0();
      v68(v17, v98);
      sub_1BA18B270();
      OUTLINED_FUNCTION_7();
      *v69 = 2;
      swift_willThrow();
    }
    OUTLINED_FUNCTION_11_6();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v92);
    swift_deallocPartialClassInstance();
    return (uint64_t)v9;
  }
  v98 = a2;
  v73 = v4;
  v74 = v9;
  v91 = 0;
  v89 = 0u;
  v90 = 0u;
  sub_1BA1713C0((uint64_t)&v89, &qword_1ED5C9E58, &qword_1ED5C9E50);
  *((_QWORD *)&v93 + 1) = a3;
  __swift_allocate_boxed_opaque_existential_0Tm(v92);
  v72 = a3;
  v30();
  sub_1BA19B134();
  sub_1BA19B140();
  sub_1BA19AF30();
  swift_release();
  swift_retain();
  OUTLINED_FUNCTION_26();
  v42 = (unint64_t)v92;
  OUTLINED_FUNCTION_24();
  v43 = v26;
  if (!v95)
  {
    v44 = (_QWORD *)MEMORY[0x1E0DEE9E0];
LABEL_60:
    swift_release_n();
    (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v78, v72);
    OUTLINED_FUNCTION_29_0();
    v63(v43, v75);
    v9 = v74;
    v64 = &v9[*(_QWORD *)(*(_QWORD *)v9 + 96)];
    *(_QWORD *)v64 = v44;
    v64[8] = 0;
    v65 = OUTLINED_FUNCTION_20_0();
    type metadata accessor for LayoutDecoder.ObjectPath(v65, v76, v66, v67);
    swift_storeEnumTagMultiPayload();
    return (uint64_t)v9;
  }
  v44 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  v71 = MEMORY[0x1E0DEE9B8] + 8;
  v80 = v26;
  while (1)
  {
    v45 = v92[0];
    v46 = v92[1];
    sub_1BA16E7BC(&v93, v88);
    if (!v46)
    {
      v55 = v88;
      goto LABEL_24;
    }
    if (!v98)
      break;
    if (v98 != 1)
    {
      OUTLINED_FUNCTION_17_0();
      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_2_24((uint64_t)&v97);
      OUTLINED_FUNCTION_8_12();
      if (v53)
        goto LABEL_65;
      OUTLINED_FUNCTION_3_24();
      if ((OUTLINED_FUNCTION_6_13() & 1) != 0)
      {
        OUTLINED_FUNCTION_4_18();
        OUTLINED_FUNCTION_10_7();
        if (!v47)
          goto LABEL_72;
        v42 = (unint64_t)v58;
      }
      v44 = (_QWORD *)v83;
      if ((v43 & 1) != 0)
        goto LABEL_50;
      OUTLINED_FUNCTION_0_28();
      if (v53)
        goto LABEL_68;
      goto LABEL_52;
    }
    v47 = v45 == 0x656D617266 && v46 == 0xE500000000000000;
    if (v47 || (sub_1BA19B020() & 1) != 0)
      goto LABEL_44;
    sub_1BA16E780((uint64_t)v88, (uint64_t)&v86);
    v42 = (unint64_t)&qword_1EF274700;
    sub_1BA16E868(0, &qword_1EF274700);
    if ((OUTLINED_FUNCTION_23() & 1) == 0)
    {
      v85 = 0;
      v84 = 0u;
      v83 = 0u;
      sub_1BA1713C0((uint64_t)&v83, &qword_1EF274708, &qword_1EF274700);
LABEL_44:
      OUTLINED_FUNCTION_17_0();
      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_2_24((uint64_t)&v97);
      OUTLINED_FUNCTION_8_12();
      if (v53)
        goto LABEL_66;
      OUTLINED_FUNCTION_3_24();
      if ((OUTLINED_FUNCTION_6_13() & 1) != 0)
      {
        OUTLINED_FUNCTION_4_18();
        OUTLINED_FUNCTION_10_7();
        if (!v47)
          goto LABEL_72;
        v42 = (unint64_t)v59;
      }
      v44 = (_QWORD *)v83;
      if ((v43 & 1) != 0)
      {
LABEL_50:
        OUTLINED_FUNCTION_22_0();
        sub_1BA16E7BC(&v89, (_OWORD *)v42);
LABEL_53:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v88);
        v43 = v80;
        goto LABEL_54;
      }
      OUTLINED_FUNCTION_0_28();
      if (v53)
        goto LABEL_69;
LABEL_52:
      OUTLINED_FUNCTION_28_0(v57);
      goto LABEL_53;
    }
    sub_1BA16DE20(&v83, (uint64_t)&v89);
    v48 = *((_QWORD *)&v90 + 1);
    v49 = v91;
    __swift_project_boxed_opaque_existential_1(&v89, *((uint64_t *)&v90 + 1));
    v50 = *(void (**)(uint64_t, uint64_t, double))(v49 + 8);
    *((_QWORD *)&v84 + 1) = v48;
    v85 = v49;
    __swift_allocate_boxed_opaque_existential_0Tm((uint64_t *)&v83);
    v51 = OUTLINED_FUNCTION_2_14();
    v50(v48, v49, v51);
    v42 = *((_QWORD *)&v84 + 1);
    __swift_project_boxed_opaque_existential_1(&v83, *((uint64_t *)&v84 + 1));
    v87 = v42;
    __swift_allocate_boxed_opaque_existential_0Tm((uint64_t *)&v86);
    (*(void (**)(uint64_t))(*(_QWORD *)(v42 - 8) + 16))(v52);
    sub_1BA16E7BC(&v86, v82);
    OUTLINED_FUNCTION_19_0();
    OUTLINED_FUNCTION_2_24((uint64_t)v96);
    OUTLINED_FUNCTION_8_12();
    if (v53)
      goto LABEL_70;
    OUTLINED_FUNCTION_3_24();
    if ((sub_1BA19AF54() & 1) != 0)
    {
      OUTLINED_FUNCTION_4_18();
      OUTLINED_FUNCTION_10_7();
      if (!v47)
        goto LABEL_72;
      v42 = (unint64_t)v54;
    }
    v44 = v81;
    if ((v49 & 1) != 0)
    {
      OUTLINED_FUNCTION_22_0();
      sub_1BA16E7BC(v82, (_OWORD *)v42);
    }
    else
    {
      v81[(v42 >> 6) + 8] |= 1 << v42;
      v60 = (uint64_t *)(v44[6] + 16 * v42);
      *v60 = v45;
      v60[1] = v46;
      sub_1BA16E7BC(v82, (_OWORD *)(v44[7] + 32 * v42));
      v61 = v44[2];
      v53 = __OFADD__(v61, 1);
      v62 = v61 + 1;
      if (v53)
        goto LABEL_71;
      OUTLINED_FUNCTION_28_0(v62);
    }
    v43 = v80;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v88);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v83);
    v55 = &v89;
LABEL_24:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v55);
LABEL_54:
    OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_24();
    if (!v95)
      goto LABEL_60;
  }
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_2_24((uint64_t)&v97);
  OUTLINED_FUNCTION_8_12();
  if (!v53)
  {
    OUTLINED_FUNCTION_3_24();
    if ((OUTLINED_FUNCTION_6_13() & 1) != 0)
    {
      OUTLINED_FUNCTION_4_18();
      OUTLINED_FUNCTION_10_7();
      if (!v47)
        goto LABEL_72;
      v42 = (unint64_t)v56;
    }
    v44 = (_QWORD *)v83;
    if ((v43 & 1) != 0)
      goto LABEL_50;
    OUTLINED_FUNCTION_0_28();
    if (v53)
      goto LABEL_67;
    goto LABEL_52;
  }
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
  result = sub_1BA19B0C8();
  __break(1u);
  return result;
}

unint64_t sub_1BA169038(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  OUTLINED_FUNCTION_10_2();
  sub_1BA19ABC4();
  v4 = sub_1BA19B128();
  return sub_1BA169094(a1, a2, v4);
}

unint64_t sub_1BA169094(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1BA19B020() & 1) == 0)
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
      while (!v14 && (sub_1BA19B020() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1BA169174(char *a1, uint64_t *a2, char *a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v15;

  v10 = *a1;
  v11 = *a2;
  v12 = *a3;
  type metadata accessor for Node(0, *(_QWORD *)(*(_QWORD *)v6 + 136), *(_QWORD *)(*(_QWORD *)v6 + 144), a4);
  swift_retain();
  *(_QWORD *)(v6 + 56) = OUTLINED_FUNCTION_14_6();
  *(_QWORD *)(v6 + 40) = v11;
  *(_BYTE *)(v6 + 48) = v12;
  v13 = OUTLINED_FUNCTION_14_6();
  OUTLINED_FUNCTION_0_14();
  *(_QWORD *)(v6 + 56) = v13;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v6 + 64) = a4;
  *(_QWORD *)(v6 + 72) = a5;
  *(_BYTE *)(v6 + 80) = a6;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_4_5();
  v15 = v10;
  return Node.init(kind:identifier:)(&v15, a4, a5);
}

uint64_t sub_1BA169248(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;

  v15 = OUTLINED_FUNCTION_51();
  v16 = OUTLINED_FUNCTION_52();
  type metadata accessor for Dynamic(0, v15, v16, v17);
  v18 = (_QWORD *)OUTLINED_FUNCTION_6();
  v18[2] = a5;
  v18[3] = a6;
  v18[4] = a3;
  v18[5] = a4;
  OUTLINED_FUNCTION_43();
  swift_retain();
  v19 = sub_1BA169338(a1, a2, a8, (uint64_t)v18);
  OUTLINED_FUNCTION_4_20(v19, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a6 + 40));
  return OUTLINED_FUNCTION_2_26();
}

uint64_t type metadata accessor for Dynamic(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Dynamic);
}

uint64_t sub_1BA169338(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_allocObject();
  return sub_1BA169398(a1, a2, a3, a4);
}

uint64_t sub_1BA169398(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  char v6;

  *(_QWORD *)(v4 + 40) = a3;
  *(_QWORD *)(v4 + 48) = a4;
  v6 = 6;
  return Node.init(kind:identifier:)(&v6, a1, a2);
}

uint64_t Node.init(kind:identifier:)(_BYTE *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v14;

  v4 = v3;
  v8 = sub_1BA19AAD4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78]();
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_BYTE *)(v4 + 32) = *a1;
  if (!a3)
  {
    sub_1BA19AAC8();
    a2 = sub_1BA19AABC();
    a3 = v12;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  *(_QWORD *)(v4 + 16) = a2;
  *(_QWORD *)(v4 + 24) = a3;
  return v4;
}

uint64_t sub_1BA169488(uint64_t a1)
{
  return BoxBuilder.add(node:)(a1);
}

uint64_t LayoutBuilder.add(node:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = *v1;
  sub_1BA1695F0();
  swift_allocObject();
  sub_1BA19AC6C();
  *v4 = a1;
  type metadata accessor for Node(0, *(_QWORD *)(v3 + 80), *(_QWORD *)(v3 + 96), v5);
  sub_1BA1695B8();
  swift_retain();
  sub_1BA1696DC();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t BoxBuilder.add(node:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = *v1;
  sub_1BA1695F0();
  swift_allocObject();
  sub_1BA19AC6C();
  *v4 = a1;
  type metadata accessor for Node(0, *(_QWORD *)(v3 + 80), *(_QWORD *)(v3 + 96), v5);
  sub_1BA1695B8();
  swift_retain();
  sub_1BA16963C();
  swift_release();
  return swift_bridgeObjectRelease();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1BA1695B8()
{
  uint64_t v0;

  v0 = sub_1BA19ACE4();
  nullsub_1(v0);
}

void sub_1BA1695F0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5C9FD0)
  {
    v0 = sub_1BA19AFE4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5C9FD0);
  }
}

uint64_t sub_1BA16963C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  OUTLINED_FUNCTION_0_14();
  type metadata accessor for Node(255, *(_QWORD *)(v1 + 136), *(_QWORD *)(v1 + 144), v2);
  v3 = OUTLINED_FUNCTION_14();
  swift_bridgeObjectRetain();
  MEMORY[0x1BCCD6858](MEMORY[0x1E0DEAF38], v3);
  sub_1BA19ACB4();
  swift_endAccess();
  return swift_retain();
}

uint64_t sub_1BA1696DC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  OUTLINED_FUNCTION_10_12();
  type metadata accessor for Node(255, *(_QWORD *)(v1 + 136), *(_QWORD *)(v1 + 152), v2);
  v3 = OUTLINED_FUNCTION_14();
  swift_bridgeObjectRetain();
  MEMORY[0x1BCCD6858](MEMORY[0x1E0DEAF38], v3);
  sub_1BA19ACB4();
  swift_endAccess();
  return swift_retain();
}

void SizerResult.nonIntegral.getter()
{
  OUTLINED_FUNCTION_16();
  __asm { BR              X11 }
}

void sub_1BA1697A8()
{
  OUTLINED_FUNCTION_2_19();
  SizerResult.nonIntegral.getter();
  OUTLINED_FUNCTION_8();
}

void sub_1BA1697BC()
{
  JUMPOUT(0x1BA1697B0);
}

__C::CGRect __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SizerResult.postProcess(frame:nonIntegral:)(__C::CGRect frame, Swift::Bool nonIntegral)
{
  __C::CGRect result;

  __asm { BR              X11 }
  return result;
}

void sub_1BA16981C()
{
  Swift::Bool v0;
  uint64_t v1;
  __C::CGRect v2;

  v2.origin.x = OUTLINED_FUNCTION_5_15();
  SizerResult.postProcess(frame:nonIntegral:)(v2, v0);
  if (!v1)
    OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_5_15();
}

void sub_1BA1698CC()
{
  OUTLINED_FUNCTION_5_15();
  JUMPOUT(0x1BA169838);
}

uint64_t sub_1BA169928(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1BA16996C()
{
  OUTLINED_FUNCTION_28();
  __asm { BR              X11 }
}

void sub_1BA1699C4()
{
  char v0;

  ((void (*)(_QWORD))sub_1BA16996C)(v0 & 1);
  OUTLINED_FUNCTION_3_20();
  OUTLINED_FUNCTION_17();
}

void sub_1BA169A18()
{
  char v0;

  OUTLINED_FUNCTION_14_2();
  if ((v0 & 1) == 0)
  {
    OUTLINED_FUNCTION_4_16();
    JUMPOUT(0x1BA1699E0);
  }
  JUMPOUT(0x1BA1699E4);
}

uint64_t sub_1BA169A2C()
{
  int v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_24_0();
  if (v3)
  {
    swift_bridgeObjectRetain();
    v5 = MEMORY[0x1E0DEE9D8];
    do
    {
      OUTLINED_FUNCTION_12_3();
      OUTLINED_FUNCTION_29();
      if (!(v9 ^ v10 | v8))
        v6 = v4;
      if (v0)
        v4 = v6;
      else
        v4 = v7;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_7_11();
        v5 = v12;
      }
      v11 = *(_QWORD *)(v5 + 16);
      v0 = v11 + 1;
      if (v11 >= *(_QWORD *)(v5 + 24) >> 1)
      {
        OUTLINED_FUNCTION_7_11();
        v5 = v13;
      }
      OUTLINED_FUNCTION_9_9();
    }
    while (!v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = MEMORY[0x1E0DEE9D8];
  }
  if (*(_QWORD *)(v1 + 16))
  {
    swift_bridgeObjectRetain();
    v14 = MEMORY[0x1E0DEE9D8];
    do
    {
      OUTLINED_FUNCTION_11_5();
      OUTLINED_FUNCTION_29();
      if (!(v9 ^ v10 | v8))
        v15 = v4;
      if (v2)
        v4 = v15;
      else
        v4 = v16;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_6_11();
        v14 = v18;
      }
      v17 = *(_QWORD *)(v14 + 16);
      v2 = v17 + 1;
      if (v17 >= *(_QWORD *)(v14 + 24) >> 1)
      {
        OUTLINED_FUNCTION_6_11();
        v14 = v19;
      }
      OUTLINED_FUNCTION_10_6();
    }
    while (!v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = MEMORY[0x1E0DEE9D8];
  }
  if (*(_QWORD *)(v5 + 16))
  {
    v20 = swift_bridgeObjectRetain();
    return ((uint64_t (*)(uint64_t))((char *)&loc_1BA169C58 + 4 * byte_1BA19DDEC[*(unsigned __int8 *)(v5 + 64)]))(v20);
  }
  else
  {
    OUTLINED_FUNCTION_14_1();
    if (!*(_QWORD *)(v14 + 16))
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_20();
      JUMPOUT(0x1BA1699E4);
    }
    v22 = swift_bridgeObjectRetain();
    return ((uint64_t (*)(uint64_t))((char *)&loc_1BA169CD4 + 4
                                                                     * byte_1BA19DDF2[*(unsigned __int8 *)(v14 + 64)]))(v22);
  }
}

void sub_1BA169D54(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1BA169D98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1BA16A8E4(a1, a2, a3, a4);
}

void sub_1BA169DA8(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  LayoutItemList.apply<A>(_:source:)(a1, a2, a3);
}

void LayoutItemList.apply<A>(_:source:)(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
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
  uint64_t *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t (*v31)(uint64_t, _QWORD, uint64_t);
  uint64_t *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46[2];
  uint64_t (*v47)(uint64_t, uint64_t);
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v4 = v3;
  v51 = a1;
  v52 = OUTLINED_FUNCTION_3_12(*v4);
  v50 = *(_QWORD *)(v52 - 8);
  OUTLINED_FUNCTION_12_2();
  MEMORY[0x1E0C80A78](v7, v8);
  OUTLINED_FUNCTION_11_3();
  v48 = v9;
  v12 = MEMORY[0x1E0C80A78](v10, v11);
  v49 = (char *)v46 - v13;
  v14 = *(_QWORD *)(a3 - 8);
  v16 = MEMORY[0x1E0C80A78](v12, v15);
  v18 = (char *)v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16, v19);
  v21 = (char *)v46 - v20;
  v23 = (_QWORD *)v4[3];
  v22 = v4 + 3;
  v24 = a2[3];
  v25 = a2[4];
  v26 = __swift_project_boxed_opaque_existential_1(a2, v24);
  v27 = *(uint64_t (**)(uint64_t, uint64_t))(v25 + 8);
  swift_bridgeObjectRetain();
  v46[1] = (unint64_t)v26;
  v47 = v27;
  v28 = v27(v24, v25);
  v46[0] = sub_1BA16A08C(v28, v29, v23);
  LOBYTE(v27) = v30;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v31 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v14 + 16);
  v32 = v22 - 1;
  if ((v27 & 1) != 0)
  {
    OUTLINED_FUNCTION_9_6((uint64_t)v18, v31);
    v38 = v48;
    v39 = OUTLINED_FUNCTION_2_10();
    __swift_storeEnumTagSinglePayload(v38, v39 ^ 1u, 1, (uint64_t)v18);
    OUTLINED_FUNCTION_0_14();
    OUTLINED_FUNCTION_10_3();
    sub_1BA19ACC0();
    OUTLINED_FUNCTION_8_7();
    v40 = v47(v24, v25);
    v42 = v41;
    sub_1BA16E0B4((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1BA16E110);
    v43 = *(_QWORD *)(*v22 + 16);
    sub_1BA16E074(v43, (uint64_t (*)(BOOL))sub_1BA16E110);
    v44 = *v22;
    *(_QWORD *)(v44 + 16) = v43 + 1;
    v45 = v44 + 16 * v43;
    *(_QWORD *)(v45 + 32) = v40;
    *(_QWORD *)(v45 + 40) = v42;
  }
  else
  {
    OUTLINED_FUNCTION_9_6((uint64_t)v21, v31);
    v33 = (uint64_t)v49;
    v34 = OUTLINED_FUNCTION_2_10();
    __swift_storeEnumTagSinglePayload(v33, v34 ^ 1u, 1, (uint64_t)v18);
    OUTLINED_FUNCTION_0_14();
    v35 = v52;
    sub_1BA19ACE4();
    sub_1BA19AC90();
    v36 = *v32;
    v37 = v46[0];
    sub_1BA16E9E0(v46[0], v36);
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v50 + 40))(v36+ ((*(unsigned __int8 *)(v50 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80))+ *(_QWORD *)(v50 + 72) * v37, v33, v35);
    OUTLINED_FUNCTION_8_7();
  }
  OUTLINED_FUNCTION_1_13();
}

uint64_t sub_1BA16A040()
{
  return Node.identifier.getter();
}

uint64_t Node.identifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1BA16A08C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  BOOL v7;
  uint64_t result;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  char v13;

  v3 = a3[2];
  if (!v3)
    return 0;
  v7 = a3[4] == a1 && a3[5] == a2;
  if (v7 || (sub_1BA19B020() & 1) != 0)
    return 0;
  v9 = 0;
  v10 = a3 + 7;
  v11 = 1;
  while (1)
  {
    if (v3 == v11)
      return 0;
    ++v9;
    if (*(v10 - 1) == a1 && *v10 == a2)
      break;
    v13 = sub_1BA19B020();
    result = v11++;
    v10 += 2;
    if ((v13 & 1) != 0)
      return result;
  }
  return v9;
}

void sub_1BA16A170()
{
  OUTLINED_FUNCTION_25_1();
  __asm { BR              X11 }
}

void sub_1BA16A1AC(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 16);
  v1[3] = &type metadata for PercentageSizer;
  v1[4] = &off_1E71E94A8;
  *v1 = v2;
}

uint64_t sub_1BA16A840@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1BA169928((a1 & 0xFFFFFFFFFFFFFFBLL) + 16, v1);
}

void sub_1BA16A868()
{
  JUMPOUT(0x1BA16A824);
}

void sub_1BA16A87C()
{
  _QWORD *v0;

  v0[3] = &type metadata for FlexibleSizer;
  v0[4] = &off_1E71E6180;
  *v0 = 0x3FF0000000000000;
  JUMPOUT(0x1BA16A828);
}

void SizerResult.isAmbiguous.getter()
{
  OUTLINED_FUNCTION_16();
  __asm { BR              X11 }
}

void sub_1BA16A8C8()
{
  OUTLINED_FUNCTION_2_19();
  SizerResult.isAmbiguous.getter();
  OUTLINED_FUNCTION_8();
}

void sub_1BA16A8DC()
{
  JUMPOUT(0x1BA16A8D0);
}

uint64_t sub_1BA16A8E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t result;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  OUTLINED_FUNCTION_4_11();
  v7 = v6;
  v9 = v8;
  result = OUTLINED_FUNCTION_0_16();
  if (byte_1ED5C9B08 == 1)
  {
    if (qword_1EF274300 != -1)
      swift_once();
    v11 = (id)qword_1EF278E80;
    sub_1BA19AD80();
    OUTLINED_FUNCTION_2_12();
    v12 = OUTLINED_FUNCTION_6();
    *(_OWORD *)(v12 + 16) = xmmword_1BA19C890;
    v13 = sub_1BA17F168(v7, 11765474, 0xA300000000000000);
    v15 = v14;
    v16 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v12 + 56) = MEMORY[0x1E0DEA968];
    v17 = sub_1BA176834();
    *(_QWORD *)(v12 + 64) = v17;
    *(_QWORD *)(v12 + 32) = v13;
    *(_QWORD *)(v12 + 40) = v15;
    v19 = sub_1BA17F2D0(v9, a3, a4, v18);
    *(_QWORD *)(v12 + 96) = v16;
    *(_QWORD *)(v12 + 104) = v17;
    *(_QWORD *)(v12 + 72) = v19;
    *(_QWORD *)(v12 + 80) = v20;
    v21 = OUTLINED_FUNCTION_1_15();
    *(_QWORD *)(v12 + 136) = v16;
    *(_QWORD *)(v12 + 144) = v17;
    *(_QWORD *)(v12 + 112) = v21;
    *(_QWORD *)(v12 + 120) = v22;
    sub_1BA19AAEC();

    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1BA16AA5C()
{
  OUTLINED_FUNCTION_28();
  __asm { BR              X11 }
}

void sub_1BA16AAB0()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_3_20();
  OUTLINED_FUNCTION_17();
}

void sub_1BA16AAF8()
{
  char v0;

  OUTLINED_FUNCTION_14_2();
  if ((v0 & 1) == 0)
  {
    OUTLINED_FUNCTION_4_16();
    JUMPOUT(0x1BA16AAC4);
  }
  JUMPOUT(0x1BA16AAC8);
}

uint64_t sub_1BA16AB0C()
{
  int v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_24_0();
  if (v3)
  {
    swift_bridgeObjectRetain();
    v5 = MEMORY[0x1E0DEE9D8];
    do
    {
      OUTLINED_FUNCTION_12_3();
      OUTLINED_FUNCTION_29();
      if (!(v9 ^ v10 | v8))
        v6 = v4;
      if (v0)
        v4 = v6;
      else
        v4 = v7;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_7_11();
        v5 = v12;
      }
      v11 = *(_QWORD *)(v5 + 16);
      v0 = v11 + 1;
      if (v11 >= *(_QWORD *)(v5 + 24) >> 1)
      {
        OUTLINED_FUNCTION_7_11();
        v5 = v13;
      }
      OUTLINED_FUNCTION_9_9();
    }
    while (!v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = MEMORY[0x1E0DEE9D8];
  }
  if (*(_QWORD *)(v1 + 16))
  {
    swift_bridgeObjectRetain();
    v14 = MEMORY[0x1E0DEE9D8];
    do
    {
      OUTLINED_FUNCTION_11_5();
      OUTLINED_FUNCTION_29();
      if (!(v9 ^ v10 | v8))
        v15 = v4;
      if (v2)
        v4 = v15;
      else
        v4 = v16;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_6_11();
        v14 = v18;
      }
      v17 = *(_QWORD *)(v14 + 16);
      v2 = v17 + 1;
      if (v17 >= *(_QWORD *)(v14 + 24) >> 1)
      {
        OUTLINED_FUNCTION_6_11();
        v14 = v19;
      }
      OUTLINED_FUNCTION_10_6();
    }
    while (!v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = MEMORY[0x1E0DEE9D8];
  }
  if (*(_QWORD *)(v5 + 16))
  {
    v20 = swift_bridgeObjectRetain();
    return ((uint64_t (*)(uint64_t))((char *)&loc_1BA16AD18 + 4 * byte_1BA19DE02[*(unsigned __int8 *)(v5 + 64)]))(v20);
  }
  else
  {
    OUTLINED_FUNCTION_14_1();
    if (!*(_QWORD *)(v14 + 16))
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_20();
      JUMPOUT(0x1BA16AAC8);
    }
    v22 = swift_bridgeObjectRetain();
    return ((uint64_t (*)(uint64_t))((char *)&loc_1BA16AD94 + 4
                                                                     * byte_1BA19DE08[*(unsigned __int8 *)(v14 + 64)]))(v22);
  }
}

void SizerResult.metadata.getter()
{
  __asm { BR              X11 }
}

uint64_t sub_1BA16AE28()
{
  OUTLINED_FUNCTION_2_19();
  return SizerResult.metadata.getter();
}

void sub_1BA16AE4C(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 24);
  OUTLINED_FUNCTION_27();
  swift_bridgeObjectRetain();
  SizerResult.metadata.getter();
  if (v2)
    sub_1BA186798(v2, v1);
  OUTLINED_FUNCTION_21();
  JUMPOUT(0x1BA16AE34);
}

uint64_t sub_1BA16AE90(uint64_t a1)
{
  uint64_t v2;

  sub_1BA16AF10();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BA16AECC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BA16AF10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1BA16AF10()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5C9E68[0])
  {
    sub_1BA173D58();
    v0 = sub_1BA19ADEC();
    if (!v1)
      atomic_store(v0, qword_1ED5C9E68);
  }
}

void sub_1BA16AF64()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  OUTLINED_FUNCTION_11_2();
  v3 = v1[4];
  v4 = v1[5];
  OUTLINED_FUNCTION_0_14();
  v5 = v1[7];
  OUTLINED_FUNCTION_0_14();
  v6 = v1[8];
  OUTLINED_FUNCTION_0_14();
  v7 = v1[9];
  v8 = v1[6];
  v9 = (_QWORD *)OUTLINED_FUNCTION_6();
  v9[2] = v2;
  v9[3] = v0;
  v9[4] = v3;
  v9[5] = v4;
  v9[8] = v6;
  v9[9] = v7;
  v9[6] = v8;
  v9[7] = v5;
  OUTLINED_FUNCTION_6_4();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  OUTLINED_FUNCTION_2_8();
}

Swift::Void __swiftcall LayoutContext.set(frame:direction:metadata:for:)(__C::CGRect frame, TeaTemplate::Direction direction, Swift::OpaquePointer_optional metadata, Swift::String_optional a4)
{
  uint64_t countAndFlagsBits;
  uint64_t v5;
  void *rawValue;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  char v11;
  uint64_t v12;
  uint64_t v13;

  if (a4.value._countAndFlagsBits)
  {
    countAndFlagsBits = a4.value._countAndFlagsBits;
    v5 = *(_QWORD *)&metadata.is_nil;
    rawValue = metadata.value._rawValue;
    height = frame.size.height;
    width = frame.size.width;
    y = frame.origin.y;
    x = frame.origin.x;
    v11 = *(_BYTE *)direction;
    type metadata accessor for LayoutContextFrame();
    v12 = OUTLINED_FUNCTION_6();
    *(CGFloat *)(v12 + 16) = x;
    *(CGFloat *)(v12 + 24) = y;
    *(CGFloat *)(v12 + 32) = width;
    *(CGFloat *)(v12 + 40) = height;
    *(_BYTE *)(v12 + 48) = v11;
    OUTLINED_FUNCTION_0_14();
    OUTLINED_FUNCTION_6_4();
    sub_1BA16F490(v12, v5, countAndFlagsBits, (void (*)(uint64_t, uint64_t, uint64_t))sub_1BA18B00C);
    OUTLINED_FUNCTION_7_4();
    if (rawValue)
    {
      OUTLINED_FUNCTION_0_14();
      v13 = OUTLINED_FUNCTION_13_0();
      sub_1BA16F490(v13, v5, countAndFlagsBits, (void (*)(uint64_t, uint64_t, uint64_t))sub_1BA1727B4);
      OUTLINED_FUNCTION_7_4();
    }
    OUTLINED_FUNCTION_12();
  }
}

void SizerResult.behavior.getter()
{
  __asm { BR              X12 }
}

void sub_1BA16B14C()
{
  OUTLINED_FUNCTION_19();
  SizerResult.behavior.getter();
  OUTLINED_FUNCTION_8();
}

uint64_t OUTLINED_FUNCTION_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return swift_allocObject();
}

double OUTLINED_FUNCTION_0()
{
  double v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return sub_1BA19ABD0();
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return sub_1BA19B110();
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return swift_release();
}

void OUTLINED_FUNCTION_1_6()
{
  sub_1BA16AA5C();
}

uint64_t OUTLINED_FUNCTION_9()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_1_7()
{
  return sub_1BA19ABD0();
}

uint64_t OUTLINED_FUNCTION_1_8()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_1_9()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_1_10()
{
  return sub_1BA19B020();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_allocError();
}

void *OUTLINED_FUNCTION_1_11(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char __src)
{
  uint64_t v10;

  *(_OWORD *)(a1 + 16) = *(_OWORD *)(v10 + 16);
  return memcpy((void *)(a1 + 32), &__src, 0x42uLL);
}

uint64_t OUTLINED_FUNCTION_1_12()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_1_15()
{
  CGFloat v0;
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;

  return sub_1BA17F390(v3, v2, v1, v0);
}

unint64_t OUTLINED_FUNCTION_1_16@<X0>(unint64_t result@<X0>, unint64_t *a2@<X8>)
{
  *a2 = result;
  return sub_1BA166E90(result);
}

double OUTLINED_FUNCTION_1_17()
{
  CGRect *v0;
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  double result;
  CGRect v6;

  v6.origin.x = v4;
  v6.origin.y = v3;
  v6.size.width = v2;
  v6.size.height = v1;
  *(_QWORD *)&result = (unint64_t)CGRectUnion(v0[14], v6);
  return result;
}

double OUTLINED_FUNCTION_4()
{
  CGFloat v0;
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  CGRect v5;

  v5.origin.x = v3;
  v5.origin.y = v2;
  v5.size.width = v1;
  v5.size.height = v0;
  return CGRectGetHeight(v5);
}

void *OUTLINED_FUNCTION_1_18@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  size_t v2;

  return memmove(__dst, a2, v2);
}

uint64_t OUTLINED_FUNCTION_1_19()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_1_20()
{
  return sub_1BA19AF3C();
}

void OUTLINED_FUNCTION_1_21(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;

  v3 = *a1;
  v4 = a1[1];
  *(_BYTE *)(v2 + 48) = v3;
  *(_BYTE *)(v2 + 49) = v4;
  *(_QWORD *)(v1 + 16) = v2;
  sub_1BA171B84();
}

uint64_t OUTLINED_FUNCTION_1_22()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 136) + 8))(v0, *(_QWORD *)(v1 - 128));
}

uint64_t OUTLINED_FUNCTION_1_23()
{
  return swift_bridgeObjectRelease();
}

double OUTLINED_FUNCTION_1_24()
{
  CGFloat v0;
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  CGRect v5;

  v5.origin.x = v2;
  v5.origin.y = v3;
  v5.size.width = v1;
  v5.size.height = v0;
  return CGRectGetMinX(v5);
}

uint64_t OUTLINED_FUNCTION_1_25()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_1_26(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;

  v3 = *a1;
  v4 = a1[1];
  *(_BYTE *)(v2 + 48) = v3;
  *(_BYTE *)(v2 + 49) = v4;
  *(_QWORD *)(v1 + 16) = v2;
  sub_1BA171B84();
}

void OUTLINED_FUNCTION_1_27()
{
  JUMPOUT(0x1BCCD5FA0);
}

id OUTLINED_FUNCTION_1_28(uint64_t a1, uint64_t a2)
{
  return sub_1BA189FA4(*(id *)a2, *(_QWORD *)(a2 + 8), *(_BYTE *)(a2 + 16));
}

unint64_t OUTLINED_FUNCTION_1_29(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BA169038(a2, a3);
}

uint64_t OUTLINED_FUNCTION_1_31(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 40))(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_1_32()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_1_33()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_1_34()
{
  return sub_1BA19AF3C();
}

id OUTLINED_FUNCTION_1_36()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 968));
}

uint64_t OUTLINED_FUNCTION_1_37()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 72) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_1_38()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 81) = 8;
  return sub_1BA194D54((char *)(v0 - 81), 0, 0);
}

uint64_t OUTLINED_FUNCTION_1_39(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return type metadata accessor for Node(255, *(_QWORD *)(v4 + 80), *(_QWORD *)(v4 + 96), a4);
}

uint64_t OUTLINED_FUNCTION_1_40()
{
  return swift_retain();
}

unint64_t OUTLINED_FUNCTION_1_41()
{
  return sub_1BA17C214();
}

uint64_t OUTLINED_FUNCTION_1_42()
{
  return sub_1BA19AF3C();
}

uint64_t OUTLINED_FUNCTION_1_43(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(a2 + 8))(v2);
}

uint64_t OUTLINED_FUNCTION_1_44()
{
  return swift_getAtKeyPath();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1BCCD681C](a1, v6, a5);
}

_QWORD *OUTLINED_FUNCTION_0_1(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v16;
  va_list va;
  uint64_t v18;
  va_list va1;
  va_list va2;

  va_start(va2, a15);
  va_start(va1, a15);
  va_start(va, a15);
  v16 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v18 = va_arg(va2, _QWORD);
  return LayoutMarginAdjuster.init(top:left:bottom:right:)(a1, (uint64_t *)va2, (uint64_t *)va1, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return sub_1BA19AFFC();
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return sub_1BA19B104();
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return swift_getAtKeyPath();
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  return sub_1BA19B110();
}

uint64_t OUTLINED_FUNCTION_0_7()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_0_8()
{
  return sub_1BA19ABD0();
}

uint64_t OUTLINED_FUNCTION_0_9()
{
  return swift_getAtKeyPath();
}

uint64_t OUTLINED_FUNCTION_0_10()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 - 144) + 8))(*(_QWORD *)(v0 - 168), *(_QWORD *)(v0 - 160));
}

void OUTLINED_FUNCTION_0_11()
{
  type metadata accessor for EmbedLayout();
}

double OUTLINED_FUNCTION_0_12()
{
  CGFloat v0;
  CGFloat v1;
  CGRect v3;

  v3.origin.x = 0.0;
  v3.origin.y = 0.0;
  v3.size.width = v0;
  v3.size.height = v1;
  return CGRectGetWidth(v3);
}

uint64_t OUTLINED_FUNCTION_0_13(uint64_t a1, ...)
{
  uint64_t v1;
  uint64_t v2;
  va_list va;

  va_start(va, a1);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(va, v2, v1);
}

uint64_t OUTLINED_FUNCTION_0_14()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_0_15()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 104) = 0;
  *(_QWORD *)(v0 + 112) = 0;
  *(_QWORD *)(v0 + 96) = 0;
  *(_BYTE *)(v0 + 120) = 0;
}

uint64_t OUTLINED_FUNCTION_0_16()
{
  return swift_beginAccess();
}

double OUTLINED_FUNCTION_0_17()
{
  return DimensionCursor.origin.getter();
}

unint64_t OUTLINED_FUNCTION_0_18(unint64_t result)
{
  return sub_1BA17FB44(result);
}

double OUTLINED_FUNCTION_5()
{
  CGFloat v0;
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  CGRect v5;

  v5.origin.x = v3;
  v5.origin.y = v2;
  v5.size.width = v1;
  v5.size.height = v0;
  return CGRectGetWidth(v5);
}

char *OUTLINED_FUNCTION_0_19(char *a1, int64_t a2)
{
  char *v2;

  return sub_1BA181B40(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_0_20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  return type metadata accessor for DimensionCursor(0, v5, v4, a4);
}

double OUTLINED_FUNCTION_0_21()
{
  double v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_0_22()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_0_23()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_0_24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return type metadata accessor for Dynamic.State(0, a6, a7, a4);
}

double OUTLINED_FUNCTION_0_25()
{
  CGFloat v0;
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  CGRect v5;

  v5.origin.x = v2;
  v5.origin.y = v3;
  v5.size.width = v1;
  v5.size.height = v0;
  return CGRectGetMinY(v5);
}

uint64_t OUTLINED_FUNCTION_0_26()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_0_27(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  return type metadata accessor for DimensionCursor(0, v5, v4, a4);
}

_OWORD *OUTLINED_FUNCTION_0_28()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_QWORD *)(v1 + 8 * (v0 >> 6) + 64) |= 1 << v0;
  v5 = (_QWORD *)(*(_QWORD *)(v1 + 48) + 16 * v0);
  *v5 = v2;
  v5[1] = v3;
  return sub_1BA16E7BC((_OWORD *)(v4 - 224), (_OWORD *)(*(_QWORD *)(v1 + 56) + 32 * v0));
}

uint64_t OUTLINED_FUNCTION_0_29()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_0_30(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_0_32(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 40))(a1, v2, v1);
}

void OUTLINED_FUNCTION_0_33()
{
  sub_1BA1720FC();
}

uint64_t OUTLINED_FUNCTION_0_34(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_BYTE *)(a2 + 48) = 2;
  return swift_willThrow();
}

id OUTLINED_FUNCTION_0_35(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, 0.0, 0.0, 0.0, 0.0);
}

uint64_t OUTLINED_FUNCTION_0_36@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1, a2);
}

_QWORD *OUTLINED_FUNCTION_0_37@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X1>, _BYTE *a3@<X8>)
{
  return sub_1BA193B40(a1, a2, a2 + 1, a3);
}

void OUTLINED_FUNCTION_0_38(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 16) = v1;
  sub_1BA171B84();
}

uint64_t OUTLINED_FUNCTION_0_40()
{
  return sub_1BA19ABD0();
}

void OUTLINED_FUNCTION_0_41()
{
  type metadata accessor for ListBuilder();
}

uint64_t OUTLINED_FUNCTION_0_42()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_0_43(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  return type metadata accessor for Sizing(0, v5, v4, a4);
}

uint64_t OUTLINED_FUNCTION_0_44()
{
  return swift_bridgeObjectRelease();
}

unint64_t OUTLINED_FUNCTION_0_45()
{
  return sub_1BA17C214();
}

uint64_t OUTLINED_FUNCTION_0_46()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0 + 536);
}

id OUTLINED_FUNCTION_4_0(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return sub_1BA19B11C();
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0 + 688);
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_4_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  return sub_1BA1667D4((uint64_t)&a32);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_4_7()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 32);

}

uint64_t OUTLINED_FUNCTION_4_8()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_4_9@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[8] = result;
  v3[9] = a2;
  v3[5] = v5;
  v3[10] = v4;
  v3[11] = v2;
  return result;
}

uint64_t OUTLINED_FUNCTION_4_10()
{
  return sub_1BA19ADEC();
}

_QWORD *OUTLINED_FUNCTION_4_12(_QWORD *result)
{
  return sub_1BA166EA4(result);
}

double OUTLINED_FUNCTION_4_16()
{
  CGFloat v0;
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  double result;
  CGRect v5;

  v5.origin.x = v2;
  v5.origin.y = v3;
  v5.size.width = v1;
  v5.size.height = v0;
  *(_QWORD *)&result = (unint64_t)CGRectIntegral(v5);
  return result;
}

double OUTLINED_FUNCTION_4_17()
{
  double v0;

  return v0;
}

unint64_t OUTLINED_FUNCTION_4_18()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1BA169038(v0, v1);
}

uint64_t OUTLINED_FUNCTION_4_19()
{
  return sub_1BA19AE1C();
}

uint64_t OUTLINED_FUNCTION_4_20@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v3, v2);
}

uint64_t OUTLINED_FUNCTION_4_21()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return sub_1BA19B158();
}

uint64_t OUTLINED_FUNCTION_4_23()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_4_24()
{
  return sub_1BA19AEA0();
}

uint64_t OUTLINED_FUNCTION_4_25()
{
  return swift_bridgeObjectRetain_n();
}

void OUTLINED_FUNCTION_4_26()
{
  sub_1BA16A170();
}

uint64_t OUTLINED_FUNCTION_4_27()
{
  return sub_1BA19ABC4();
}

uint64_t OUTLINED_FUNCTION_4_28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v0);
}

uint64_t OUTLINED_FUNCTION_3_2(uint64_t result)
{
  _QWORD *v1;

  *v1 &= result;
  return result;
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return sub_1BA19ABB8();
}

uint64_t OUTLINED_FUNCTION_3_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_3_7()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_3_8()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_3_9@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

void *OUTLINED_FUNCTION_3_10(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char __src)
{
  return memcpy(a1, &__src, 0x42uLL);
}

uint64_t OUTLINED_FUNCTION_3_12@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 120) = *(_QWORD *)(a1 + 80);
  return sub_1BA19ADEC();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return sub_1BA19ACE4();
}

uint64_t OUTLINED_FUNCTION_3_14(uint64_t a1)
{
  return sub_1BA17F168(a1, 0, 0xE000000000000000);
}

uint64_t OUTLINED_FUNCTION_3_15()
{
  return swift_allocObject();
}

void *OUTLINED_FUNCTION_7_0(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xC8uLL);
}

void OUTLINED_FUNCTION_3_16(uint64_t a1, unint64_t *a2)
{
  sub_1BA16E1EC(0, a2);
}

void OUTLINED_FUNCTION_3_17()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v2 - 264) = v1;
  *(_QWORD *)(v2 - 256) = v0;
  *(_QWORD *)(v2 - 248) = v4;
  *(_QWORD *)(v2 - 240) = v3;
}

double OUTLINED_FUNCTION_3_18()
{
  CGFloat v0;
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  CGRect v5;

  v5.origin.x = v3;
  v5.origin.y = v2;
  v5.size.width = v1;
  v5.size.height = v0;
  return CGRectGetMinY(v5);
}

uint64_t OUTLINED_FUNCTION_3_19(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  return type metadata accessor for Cursor(0, v5, v4, a4);
}

uint64_t OUTLINED_FUNCTION_3_21@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;

  v3 = *a1;
  v4 = a1[1];
  *(_BYTE *)(v1 + 48) = v3;
  *(_BYTE *)(v1 + 49) = v4;
  return v2;
}

void OUTLINED_FUNCTION_3_22()
{
  JUMPOUT(0x1BCCD5FA0);
}

double OUTLINED_FUNCTION_3_23()
{
  return DimensionCursor.position.getter();
}

void OUTLINED_FUNCTION_3_24()
{
  sub_1BA18B0D0();
}

uint64_t OUTLINED_FUNCTION_3_25(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_3_26()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_3_27@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v3, v2);
}

uint64_t OUTLINED_FUNCTION_3_28()
{
  return swift_release();
}

_BYTE *OUTLINED_FUNCTION_3_29(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v6;
  uint64_t v8;
  va_list va;
  uint64_t v10;
  va_list va1;

  va_start(va1, a6);
  va_start(va, a6);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  return sub_1BA184D70((uint64_t *)va, v6, (uint64_t)va1);
}

double OUTLINED_FUNCTION_3_30()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_3_31()
{
  return sub_1BA19ADF8();
}

uint64_t OUTLINED_FUNCTION_3_32()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_3_34()
{
  sub_1BA16A170();
}

uint64_t OUTLINED_FUNCTION_3_35()
{
  return sub_1BA19B128();
}

uint64_t OUTLINED_FUNCTION_3_36()
{
  return 0x656C616373202B20;
}

void OUTLINED_FUNCTION_2_0(uint64_t a1, id *a2)
{

}

uint64_t OUTLINED_FUNCTION_2_1(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 40) = *a1;
  *(_BYTE *)(v2 - 1) = 1;
  return v2 - 1;
}

uint64_t OUTLINED_FUNCTION_2_2(uint64_t result)
{
  _QWORD *v1;

  *v1 |= result;
  return result;
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return sub_1BA19B110();
}

void OUTLINED_FUNCTION_2_3()
{
  sub_1BA1773D8();
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 72) = v0;
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_2_6()
{
  JUMPOUT(0x1BCCD5FA0);
}

void OUTLINED_FUNCTION_2_7(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = v1;
}

uint64_t OUTLINED_FUNCTION_2_9()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_2_10()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_2_11()
{
  uint64_t v0;

  return v0 + *(_QWORD *)(*(_QWORD *)v0 + 96);
}

void OUTLINED_FUNCTION_2_12()
{
  sub_1BA17672C();
}

uint64_t OUTLINED_FUNCTION_2_13@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  unint64_t v2;
  uint64_t v3;

  *v1 = a1;
  sub_1BA17FB44(v2);
  return v3;
}

double OUTLINED_FUNCTION_2_14()
{
  double v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_2_15()
{
  return swift_bridgeObjectRelease();
}

double OUTLINED_FUNCTION_2_16()
{
  CGFloat v0;
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  CGRect v5;

  v5.origin.x = v3;
  v5.origin.y = v2;
  v5.size.width = v1;
  v5.size.height = v0;
  return CGRectGetMaxX(v5);
}

double OUTLINED_FUNCTION_2_17()
{
  return Cursor.remainingBounds.getter();
}

uint64_t OUTLINED_FUNCTION_2_18()
{
  return swift_dynamicCastClassUnconditional();
}

uint64_t OUTLINED_FUNCTION_2_20()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_2_21(uint64_t a1, uint64_t a2)
{
  return sub_1BA171B6C(*(id *)a2, *(_QWORD *)(a2 + 8), *(_BYTE *)(a2 + 16));
}

void OUTLINED_FUNCTION_2_22()
{
  JUMPOUT(0x1BCCD5FA0);
}

uint64_t OUTLINED_FUNCTION_2_23()
{
  return swift_allocObject();
}

unint64_t OUTLINED_FUNCTION_2_24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(a1 - 256) = v1;
  return sub_1BA169038(v2, v3);
}

uint64_t OUTLINED_FUNCTION_2_25()
{
  return sub_1BA19AE04();
}

uint64_t OUTLINED_FUNCTION_2_26()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_2_27()
{
  return sub_1BA19AF3C();
}

uint64_t OUTLINED_FUNCTION_2_28()
{
  return swift_bridgeObjectRelease();
}

__n128 *OUTLINED_FUNCTION_2_30(__n128 *result, __n128 a2)
{
  unint64_t v2;

  result[1] = a2;
  result[2].n128_u64[0] = v2;
  result[2].n128_u8[8] = 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_2_31()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_32()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_33@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(a1 + 64) = v6;
  *(_QWORD *)(a1 + 72) = v5;
  *(_BYTE *)(a1 + 80) = v2;
  *(_QWORD *)(a1 + 88) = v3;
  *(_QWORD *)(a1 + 96) = v1;
  *(_QWORD *)(a1 + 104) = v4;
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_2_36()
{
  return sub_1BA19ADEC();
}

uint64_t OUTLINED_FUNCTION_15()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return sub_1BA19AB88();
}

double OUTLINED_FUNCTION_15_2@<D0>(uint64_t a1@<X8>)
{
  return *(double *)((a1 & 0xFFFFFFFFFFFFFFFBLL) + 0x10);
}

uint64_t OUTLINED_FUNCTION_15_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, __int128 a14)
{
  uint64_t v14;

  *(_QWORD *)(v14 + 16) = a1;
  return sub_1BA16DE20(&a14, a1 + 16);
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0 - 192);
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  uint64_t v0;

  return sub_1BA179FE4(v0 + 688);
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_5_6(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  sub_1BA17D4D4(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t OUTLINED_FUNCTION_5_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_5_8()
{
  return sub_1BA19B170();
}

uint64_t OUTLINED_FUNCTION_5_9()
{
  return sub_1BA19AAEC();
}

double OUTLINED_FUNCTION_5_12()
{
  uint64_t v0;

  return *(double *)(v0 - 344);
}

uint64_t OUTLINED_FUNCTION_5_14()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0 - 120);
}

double OUTLINED_FUNCTION_5_15()
{
  double v0;

  return v0;
}

id OUTLINED_FUNCTION_5_16(uint64_t a1, const char *a2)
{
  void *v2;
  double v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_5_17()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_5_18()
{
  return sub_1BA19AF54();
}

uint64_t OUTLINED_FUNCTION_5_19()
{
  return sub_1BA19ABD0();
}

uint64_t OUTLINED_FUNCTION_5_20()
{
  return swift_release();
}

void OUTLINED_FUNCTION_5_21()
{
  _BYTE *v0;
  char v1;

  v1 = v0[271];
  v0[254] = v0[270];
  v0[255] = v1;
}

uint64_t OUTLINED_FUNCTION_5_22(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  return v7(a1, a2, a3, a4, a5, v5, v6);
}

_QWORD *OUTLINED_FUNCTION_5_23(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  return __swift_project_boxed_opaque_existential_1(&a18, a21);
}

uint64_t OUTLINED_FUNCTION_5_24()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_5_26()
{
  return swift_retain_n();
}

void OUTLINED_FUNCTION_5_27()
{
  sub_1BA16A170();
}

uint64_t OUTLINED_FUNCTION_5_28(uint64_t a1, ...)
{
  uint64_t (*v1)(char *, uint64_t);
  uint64_t v2;
  va_list va;

  va_start(va, a1);
  return v1(va, v2);
}

uint64_t OUTLINED_FUNCTION_5_29()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v0, v1);
}

uint64_t OUTLINED_FUNCTION_5_30()
{
  return swift_release();
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

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

double OUTLINED_FUNCTION_6_0()
{
  double v0;

  return v0;
}

double OUTLINED_FUNCTION_6_1()
{
  CGFloat v0;
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  CGRect v5;

  v5.origin.x = v0;
  v5.origin.y = v1;
  v5.size.width = v2;
  v5.size.height = v3;
  return CGRectGetWidth(v5);
}

void *OUTLINED_FUNCTION_6_2(void *a1)
{
  const void *v1;

  return memcpy(a1, v1, 0xC8uLL);
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  uint64_t v0;

  return sub_1BA171098(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88), *(_BYTE *)(v0 + 96));
}

uint64_t OUTLINED_FUNCTION_6_4()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_6_6()
{
  return sub_1BA19ADEC();
}

unint64_t OUTLINED_FUNCTION_6_7()
{
  unint64_t v0;

  return sub_1BA166E7C(v0);
}

void OUTLINED_FUNCTION_6_8()
{
  uint64_t v0;

}

double OUTLINED_FUNCTION_6_9()
{
  CGFloat v0;
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  CGRect v5;

  v5.origin.x = v3;
  v5.origin.y = v2;
  v5.size.width = v1;
  v5.size.height = v0;
  return CGRectGetMaxY(v5);
}

uint64_t OUTLINED_FUNCTION_6_10()
{
  return swift_dynamicCast();
}

void OUTLINED_FUNCTION_6_11()
{
  sub_1BA1711B4();
}

void OUTLINED_FUNCTION_6_12()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_6_13()
{
  return sub_1BA19AF54();
}

uint64_t OUTLINED_FUNCTION_6_14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_6_15()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t OUTLINED_FUNCTION_6_16@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BA16E314(a1, a1, a2);
}

id OUTLINED_FUNCTION_6_17(id a1, SEL a2)
{
  double v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_6_18()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_6_20@<X0>(uint64_t a1@<X8>)
{
  return sub_1BA17E7B4(*(_QWORD *)(a1 + 16));
}

uint64_t OUTLINED_FUNCTION_6_21()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_22()
{
  return sub_1BA19B104();
}

uint64_t OUTLINED_FUNCTION_6_24()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  uint64_t v0;

  return sub_1BA162F64(v0);
}

void OUTLINED_FUNCTION_7_2()
{
  SizerResult.nonIntegral.getter();
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  return swift_endAccess();
}

void OUTLINED_FUNCTION_7_5()
{
  JUMPOUT(0x1BCCD5FA0);
}

uint64_t OUTLINED_FUNCTION_7_6()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_7_7()
{
  return sub_1BA19ADEC();
}

uint64_t OUTLINED_FUNCTION_7_9()
{
  return swift_bridgeObjectRetain();
}

double OUTLINED_FUNCTION_7_10(double a1, double a2)
{
  return a2;
}

void OUTLINED_FUNCTION_7_11()
{
  sub_1BA1711B4();
}

uint64_t OUTLINED_FUNCTION_7_12(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_7_13()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t OUTLINED_FUNCTION_7_14()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1BA16AECC(v1, v0 + 272);
}

double OUTLINED_FUNCTION_7_15(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return sub_1BA16E818(a1, a2, v2, (_OWORD *)(v3 - 64));
}

uint64_t OUTLINED_FUNCTION_7_17()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_7_19(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  return type metadata accessor for FontSizer(0, v5, v4, a4);
}

uint64_t OUTLINED_FUNCTION_7_20(uint64_t a1, _BYTE *a2)
{
  *a2 = 1;
  return swift_willThrow();
}

void OUTLINED_FUNCTION_7_21(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v1[70] = v1[19];
  v1[71] = a1;
  v1[67] = v2;
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  uint64_t v0;

  return v0;
}

double OUTLINED_FUNCTION_8_1()
{
  CGFloat v0;
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  CGRect v5;

  v5.origin.x = v0;
  v5.origin.y = v1;
  v5.size.width = v2;
  v5.size.height = v3;
  return CGRectGetHeight(v5);
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_8_4()
{
  LayoutContext.contextFrame(for:)();
}

void OUTLINED_FUNCTION_8_5()
{
  _QWORD *v0;

  *v0 = 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_8_6(_BYTE *a1)
{
  return Node.init(kind:identifier:)(a1, 0, 0);
}

uint64_t OUTLINED_FUNCTION_8_7()
{
  return swift_endAccess();
}

double OUTLINED_FUNCTION_8_10(CGRect rect)
{
  return CGRectGetMaxX(rect);
}

double OUTLINED_FUNCTION_8_11()
{
  uint64_t v0;

  return *(double *)(v0 - 296);
}

uint64_t OUTLINED_FUNCTION_8_13(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_8_14@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  return sub_1BA16E314(a1, a1, a2);
}

uint64_t OUTLINED_FUNCTION_8_15()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0 + 248);
}

uint64_t OUTLINED_FUNCTION_8_16()
{
  return sub_1BA19AEA0();
}

void OUTLINED_FUNCTION_8_17(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v1 + 16) = a1;
  v5 = v1 + 80 * v4;
  *(_QWORD *)(v5 + 32) = v3;
  *(_QWORD *)(v5 + 40) = v2;
}

uint64_t OUTLINED_FUNCTION_8_18()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_8_19(uint64_t a1, uint64_t a2)
{
  double *v2;

  return LayoutItem.flipRightToLeft(bounds:)(a1, a2, *v2, v2[1], v2[2], v2[3]);
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return swift_release();
}

void OUTLINED_FUNCTION_9_2(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  sub_1BA166CE0(0, a2, a3, a4);
}

id OUTLINED_FUNCTION_9_3(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

unint64_t OUTLINED_FUNCTION_9_4()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1BA169038(v1, v0);
}

void OUTLINED_FUNCTION_9_5()
{
  JUMPOUT(0x1BCCD5FA0);
}

uint64_t OUTLINED_FUNCTION_9_6@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, *(_QWORD *)(v3 - 128), v2);
}

void OUTLINED_FUNCTION_9_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v1 + 16) = v0;
  v5 = v1 + v3 * v2;
  *(_QWORD *)(v5 + 32) = v4;
  *(_QWORD *)(v5 + 48) = 0;
  *(_QWORD *)(v5 + 56) = 0;
  *(_QWORD *)(v5 + 40) = 0;
  *(_BYTE *)(v5 + 64) = 0;
}

uint64_t OUTLINED_FUNCTION_9_10()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_9_11(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_9_12()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_9_13()
{
  return swift_release();
}

id OUTLINED_FUNCTION_9_15@<X0>(uint64_t a1@<X8>)
{
  return *(id *)(a1 + 32);
}

id OUTLINED_FUNCTION_9_16@<X0>(uint64_t a1@<X8>)
{
  return *(id *)((a1 & 0xFFFFFFFFFFFFFFBLL) + 0x10);
}

uint64_t OUTLINED_FUNCTION_9_17()
{
  return 0x676E696C69617274;
}

uint64_t OUTLINED_FUNCTION_9_19()
{
  return swift_release();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

double OUTLINED_FUNCTION_17()
{
  double v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  uint64_t v0;

  return sub_1BA16E780(v0 - 256, v0 - 224);
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return swift_getAssociatedTypeWitness();
}

id OUTLINED_FUNCTION_17_2()
{
  return sub_1BA16EA30();
}

id OUTLINED_FUNCTION_17_3()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_24()
{
  uint64_t v0;

  return sub_1BA16E230(v0 - 224, v0 - 176);
}

uint64_t OUTLINED_FUNCTION_25_0@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

void OUTLINED_FUNCTION_11_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 168) = *(_QWORD *)(v2 - 336);
  *(_QWORD *)(v2 - 160) = v0;
  *(_QWORD *)(v2 - 192) = v1;
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_11_4()
{
  return sub_1BA19B104();
}

double OUTLINED_FUNCTION_11_5()
{
  CGFloat v0;
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  CGRect v5;

  v5.origin.x = v2;
  v5.origin.y = v3;
  v5.size.width = v1;
  v5.size.height = v0;
  return CGRectGetHeight(v5);
}

uint64_t OUTLINED_FUNCTION_11_6()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(v1 - 408) + 8))(*(_QWORD *)(v1 - 400), v0);
}

uint64_t OUTLINED_FUNCTION_11_7(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_11_8()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0 + 632);
}

uint64_t OUTLINED_FUNCTION_11_9()
{
  uint64_t v0;

  return sub_1BA1667D4(v0 + 560);
}

uint64_t OUTLINED_FUNCTION_11_11()
{
  return 0x7265746E656368;
}

uint64_t OUTLINED_FUNCTION_11_13()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_14_5()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_14_6()
{
  return sub_1BA19AC9C();
}

uint64_t OUTLINED_FUNCTION_14_7()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1BA16AECC(v1, v0 + 248);
}

uint64_t OUTLINED_FUNCTION_14_9(__int128 *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  result = sub_1BA16DE20(a1, a2);
  *(_QWORD *)(v2 + 56) = v3;
  return result;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

void OUTLINED_FUNCTION_12_0()
{
  SizerResult.nonIntegral.getter();
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  return swift_release();
}

double OUTLINED_FUNCTION_12_3()
{
  CGFloat v0;
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  CGRect v5;

  v5.origin.x = v2;
  v5.origin.y = v3;
  v5.size.width = v1;
  v5.size.height = v0;
  return CGRectGetWidth(v5);
}

unint64_t OUTLINED_FUNCTION_12_4()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1BA169038(v1, v0);
}

uint64_t OUTLINED_FUNCTION_12_5()
{
  return sub_1BA19AE34();
}

void OUTLINED_FUNCTION_12_6()
{
  type metadata accessor for Prop();
}

id OUTLINED_FUNCTION_12_7()
{
  uint64_t v0;

  return objc_allocWithZone(*(Class *)(v0 + 3856));
}

uint64_t OUTLINED_FUNCTION_12_8()
{
  return sub_1BA19AEA0();
}

uint64_t OUTLINED_FUNCTION_12_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  return type metadata accessor for AnchorSizer(0, v5, v4, a4);
}

uint64_t OUTLINED_FUNCTION_12_10@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_16()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_16_0(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

unint64_t OUTLINED_FUNCTION_16_1()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 96) = 0;
  return sub_1BA18C2B8();
}

uint64_t OUTLINED_FUNCTION_16_2()
{
  return swift_getAssociatedTypeWitness();
}

void OUTLINED_FUNCTION_16_3()
{
  sub_1BA171B84();
}

void OUTLINED_FUNCTION_16_4()
{
  sub_1BA16A170();
}

uint64_t OUTLINED_FUNCTION_13()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_13_4()
{
  return sub_1BA19AE28();
}

uint64_t OUTLINED_FUNCTION_13_5()
{
  return swift_getAssociatedConformanceWitness();
}

id OUTLINED_FUNCTION_13_6()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

uint64_t OUTLINED_FUNCTION_13_7()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_13_8()
{
  return sub_1BA19AFFC();
}

uint64_t OUTLINED_FUNCTION_13_9()
{
  return 0x7265746E6563;
}

uint64_t OUTLINED_FUNCTION_13_10@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
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

uint64_t OUTLINED_FUNCTION_10()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_10_0()
{
  sub_1BA16AA5C();
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return sub_1BA19B104();
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  return sub_1BA19ACE4();
}

double OUTLINED_FUNCTION_10_4()
{
  double v0;

  return v0;
}

double OUTLINED_FUNCTION_10_5()
{
  double v0;

  return v0;
}

void OUTLINED_FUNCTION_10_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v0 + 16) = v1;
  v6 = v0 + v4 * v2;
  *(_QWORD *)(v6 + 32) = v5;
  *(_QWORD *)(v6 + 48) = 0;
  *(_QWORD *)(v6 + 56) = 0;
  *(_QWORD *)(v6 + 40) = 0;
  *(_BYTE *)(v6 + 64) = v3;
}

uint64_t OUTLINED_FUNCTION_10_8(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_10_9()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_10_11()
{
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_10_12()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_10_13()
{
  return 0x676E696461656CLL;
}

uint64_t sub_1BA16CC4C(uint64_t a1, uint64_t a2)
{
  swift_release();
  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((a1
                                                                                            + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80)
                                                                                            + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
  return swift_release();
}

uint64_t type metadata accessor for Dynamic.State(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Dynamic.State);
}

uint64_t OUTLINED_FUNCTION_20()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_20_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 40))(a1, v1, v2);
}

uint64_t OUTLINED_FUNCTION_20_2()
{
  return sub_1BA19ABD0();
}

uint64_t OUTLINED_FUNCTION_21()
{
  return swift_release();
}

void OUTLINED_FUNCTION_21_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
}

void OUTLINED_FUNCTION_21_1(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, unint64_t *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __n128 a10@<Q0>, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  uint64_t v15;

  sub_1BA16533C(a1, a2, a3, a4, a5, a6, a7, a8, a10.n128_i64[0], a10.n128_i64[1], a9, v15, a15);
}

void OUTLINED_FUNCTION_21_3(uint64_t a1@<X8>, double a2@<D0>)
{
  *(double *)a1 = a2;
  *(_BYTE *)(a1 + 8) = 0;
}

void sub_1BA16CD40()
{
  sub_1BA16CD5C();
}

void sub_1BA16CD5C()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  type metadata accessor for ListBuilder();
}

uint64_t sub_1BA16CE28()
{
  void (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v3 = sub_1BA16CEC0();
  v4 = v1;
  v0(v3, v2);
  if (!v6)
  {
    swift_beginAccess();
    v4 = *(_QWORD *)(v3 + 16);
    swift_bridgeObjectRetain();
  }
  swift_release();
  return v4;
}

void type metadata accessor for ListBuilder()
{
  JUMPOUT(0x1BCCD681CLL);
}

uint64_t sub_1BA16CEC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = swift_allocObject();
  sub_1BA16CEF4(v0, v1, v2, v3);
  return v0;
}

_QWORD *sub_1BA16CEF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  type metadata accessor for Node(0, *(_QWORD *)(*v4 + 80), *(_QWORD *)(*v4 + 96), a4);
  v4[2] = sub_1BA19AC9C();
  return v4;
}

void sub_1BA16CF2C()
{
  ListBuilder.add(node:)();
}

void ListBuilder.add(node:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = OUTLINED_FUNCTION_2_32();
  OUTLINED_FUNCTION_1_39(v0, v1, v2, v3);
  OUTLINED_FUNCTION_14();
  swift_retain();
  sub_1BA19ACC0();
  swift_endAccess();
  OUTLINED_FUNCTION_3_0();
}

uint64_t type metadata accessor for Node(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Node);
}

uint64_t sub_1BA16CFB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BA16AF10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

BOOL sub_1BA16CFF4(uint64_t a1)
{
  return a1 != 0;
}

void OUTLINED_FUNCTION_22()
{
  sub_1BA16AA5C();
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v1 + 56) + 32 * v0);
}

void OUTLINED_FUNCTION_22_1(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, unint64_t *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __n128 a10@<Q0>, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  uint64_t v15;

  sub_1BA16519C(a1, a2, a3, a4, a5, a6, a7, a8, a10.n128_i64[0], a10.n128_i64[1], a9, v15, a15);
}

uint64_t OUTLINED_FUNCTION_22_2()
{
  return sub_1BA19AF3C();
}

uint64_t OUTLINED_FUNCTION_22_3()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_18()
{
  char v0;

  return sub_1BA16AA5C(v0 & 1);
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  return swift_getAssociatedTypeWitness();
}

void OUTLINED_FUNCTION_18_2(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 16);
  v3[3] = v1;
  v3[4] = v2;
  *v3 = v4;
}

void OUTLINED_FUNCTION_18_3(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
}

void sub_1BA16D098()
{
  __asm { BR              X11 }
}

void sub_1BA16D0CC(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(v1 + 24) = &type metadata for FixedDimensionSizer;
  *(_QWORD *)(v1 + 32) = &off_1E71E7810;
  *(_QWORD *)v1 = v2;
  *(_QWORD *)(v1 + 8) = 0;
  *(_BYTE *)(v1 + 16) = 0;
}

uint64_t OUTLINED_FUNCTION_23()
{
  return swift_dynamicCast();
}

void OUTLINED_FUNCTION_23_0(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v3[3] = v1;
  v3[4] = v2;
  *v3 = a1;
  v3[1] = 0;
}

void OUTLINED_FUNCTION_23_1(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
}

uint64_t sub_1BA16D270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1BA16A8E4(a1, a2, a3, a4);
}

uint64_t sub_1BA16D280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1BA16A8E4(a1, a2, a3, a4);
}

void SizerResult.shouldResize.getter()
{
  OUTLINED_FUNCTION_16();
  __asm { BR              X11 }
}

void sub_1BA16D2BC()
{
  OUTLINED_FUNCTION_2_19();
  SizerResult.shouldResize.getter();
  OUTLINED_FUNCTION_8();
}

void sub_1BA16D2D0()
{
  JUMPOUT(0x1BA16D2C4);
}

void + infix<A>(_:_:)(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1BA16D32C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t result;
  __int128 v11;

  v5 = OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_43(v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_34();
  *(_QWORD *)(v5 + 40) = &type metadata for InsetSizer;
  *(_QWORD *)(v5 + 48) = &off_1E71E9400;
  v9 = (_QWORD *)OUTLINED_FUNCTION_6();
  *(_QWORD *)(v5 + 16) = v9;
  result = sub_1BA16DE20(&v11, (uint64_t)(v9 + 2));
  v9[7] = v0;
  v9[8] = v1;
  v9[9] = v2;
  v9[10] = v3;
  *v4 = v5 | 0xD000000000000000;
  return result;
}

uint64_t type metadata accessor for Sizing(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Sizing);
}

uint64_t sub_1BA16DE20(__int128 *a1, uint64_t a2)
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

uint64_t OUTLINED_FUNCTION_19_0()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_19_1()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_19_3@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  return sub_1BA171AEC(a1, a2, a3, a4, a5);
}

void type metadata accessor for Prop()
{
  JUMPOUT(0x1BCCD681CLL);
}

void sub_1BA16DE8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  LayoutItem.apply<A>(_:source:)(a1, a2, a3);
}

void LayoutItem.apply<A>(_:source:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
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
  int v17;
  uint64_t v18;
  uint64_t v19;

  v7 = *(_QWORD *)(*(_QWORD *)v3 + 80);
  v8 = OUTLINED_FUNCTION_7_7();
  v9 = *(_QWORD *)(v8 - 8);
  OUTLINED_FUNCTION_8_8();
  v12 = MEMORY[0x1E0C80A78](v10, v11);
  v14 = (char *)&v19 - v13;
  MEMORY[0x1E0C80A78](v12, v15);
  OUTLINED_FUNCTION_3_13();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v4, a1, a3);
  v17 = swift_dynamicCast();
  __swift_storeEnumTagSinglePayload((uint64_t)v14, v17 ^ 1u, 1, v7);
  v18 = v3 + *(_QWORD *)(*(_QWORD *)v3 + 96);
  OUTLINED_FUNCTION_0_14();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 40))(v18, v14, v8);
  swift_endAccess();
  OUTLINED_FUNCTION_1_14();
}

unint64_t sub_1BA16DFA4()
{
  unint64_t result;

  result = qword_1ED5C9130;
  if (!qword_1ED5C9130)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED5C9130);
  }
  return result;
}

uint64_t type metadata accessor for LayoutDecoder.ObjectPath(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LayoutDecoder.ObjectPath);
}

void SizerResult.shouldPostProcess.getter()
{
  OUTLINED_FUNCTION_16();
  __asm { BR              X11 }
}

void sub_1BA16E030()
{
  OUTLINED_FUNCTION_2_19();
  SizerResult.shouldPostProcess.getter();
  OUTLINED_FUNCTION_8();
}

void sub_1BA16E044()
{
  JUMPOUT(0x1BA16E038);
}

void destroy for FixedDimensionSizer.Fixed(uint64_t a1)
{
  sub_1BA16E060(*(id *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

void sub_1BA16E060(id a1, uint64_t a2, char a3)
{
  if (a3 == 2)

}

uint64_t sub_1BA16E074(uint64_t result, uint64_t (*a2)(BOOL))
{
  uint64_t v2;
  unint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)v2 + 24);
  if (result + 1 > (uint64_t)(v3 >> 1))
  {
    result = a2(v3 > 1);
    *(_QWORD *)v2 = result;
  }
  return result;
}

uint64_t sub_1BA16E0B4(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;

  v3 = *v1;
  result = swift_isUniquelyReferenced_nonNull_native();
  *v1 = v3;
  if (!(_DWORD)result)
  {
    result = a1(result, *(_QWORD *)(v3 + 16) + 1, 1, v3);
    *v1 = result;
  }
  return result;
}

uint64_t sub_1BA16E108()
{
  return swift_release();
}

void sub_1BA16E110()
{
  char *v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  OUTLINED_FUNCTION_8_9();
  if ((v4 & 1) != 0)
  {
    OUTLINED_FUNCTION_5_11();
    if (v6 != v7)
    {
      OUTLINED_FUNCTION_9_7();
      if (v6)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_4_13();
    }
  }
  else
  {
    v5 = v3;
  }
  v8 = *((_QWORD *)v0 + 2);
  if (v5 <= v8)
    v9 = *((_QWORD *)v0 + 2);
  else
    v9 = v5;
  if (v9)
  {
    OUTLINED_FUNCTION_3_16(v2, &qword_1ED5C9AC8);
    v10 = (char *)OUTLINED_FUNCTION_6();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = v0 + 32;
  if ((v1 & 1) != 0)
  {
    if (v10 != v0 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)v0 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5_0();
}

void sub_1BA16E1EC(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_1BA19AFE4();
    if (!v4)
      atomic_store(v3, a2);
  }
}

uint64_t sub_1BA16E230(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BA16E274();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1BA16E274()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5C9A10)
  {
    sub_1BA1738E0();
    v0 = sub_1BA19ADEC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5C9A10);
  }
}

uint64_t initializeBufferWithCopyOfBuffer for LayoutOptions(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

double UIEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

uint64_t sub_1BA16E314@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 *v24;
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
  __int128 v36[2];
  uint64_t v37;
  _BYTE v38[32];
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  _OWORD v42[2];
  __int128 v43;
  uint64_t v44;

  v35 = a1;
  v34 = a3;
  v33 = sub_1BA19ADEC();
  v5 = *(_QWORD *)(v33 - 8);
  v7 = MEMORY[0x1E0C80A78](v33, v6);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7, v10);
  v12 = (char *)&v32 - v11;
  v13 = *(_QWORD *)(v3 + 16);
  v14 = *(_BYTE *)(v3 + 24);
  v15 = sub_1BA19B158();
  if ((v14 & 1) == 0)
  {
    sub_1BA16E818(v15, v16, v13, &v43);
    swift_bridgeObjectRelease();
    if (v44)
    {
      sub_1BA16E7BC(&v43, v42);
      sub_1BA16E780((uint64_t)v42, (uint64_t)v38);
      sub_1BA16E868(0, &qword_1ED5C9120);
      if (swift_dynamicCast())
      {
        sub_1BA16DE20(v36, (uint64_t)&v39);
        v18 = v40;
        v19 = v41;
        __swift_project_boxed_opaque_existential_1(&v39, v40);
        (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v19 + 8))(v36, v18, v19);
        sub_1BA16E7CC();
        if (swift_dynamicCast())
        {
          __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, a2);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
          (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(v34, v12, a2);
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v39);
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 1, a2);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v33);
        sub_1BA18AEB0();
        swift_allocError();
        v28 = v27;
        v29 = v40;
        v30 = v41;
        __swift_project_boxed_opaque_existential_1(&v39, v40);
        (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v30);
        *(_QWORD *)(v28 + 32) = sub_1BA19B170();
        *(_QWORD *)(v28 + 40) = v31;
        *(_BYTE *)(v28 + 48) = 0;
        swift_willThrow();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
        v24 = &v39;
      }
      else
      {
        v37 = 0;
        memset(v36, 0, sizeof(v36));
        sub_1BA1913F4((uint64_t)v36, &qword_1EF2747A8, &qword_1ED5C9120);
        sub_1BA18AEB0();
        swift_allocError();
        v26 = v25;
        sub_1BA16E780((uint64_t)v42, v25);
        *(_BYTE *)(v26 + 48) = 1;
        swift_willThrow();
        v24 = v42;
      }
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
    }
LABEL_9:
    sub_1BA18AEB0();
    swift_allocError();
    *(_QWORD *)v20 = 1;
    *(_OWORD *)(v20 + 8) = 0u;
    *(_OWORD *)(v20 + 24) = 0u;
    *(_QWORD *)(v20 + 40) = 0;
    *(_BYTE *)(v20 + 48) = 2;
    return swift_willThrow();
  }
  sub_1BA16E818(v15, v16, v13, &v39);
  swift_bridgeObjectRelease();
  if (!v40)
    goto LABEL_9;
  sub_1BA16E7BC(&v39, v36);
  sub_1BA16E780((uint64_t)v36, (uint64_t)&v43);
  if (swift_dynamicCast())
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, a2);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(v34, v9, a2);
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, a2);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v33);
  sub_1BA18AEB0();
  swift_allocError();
  v22 = v21;
  sub_1BA16E780((uint64_t)v36, v21);
  *(_QWORD *)(v22 + 32) = sub_1BA19B170();
  *(_QWORD *)(v22 + 40) = v23;
  *(_BYTE *)(v22 + 48) = 0;
  swift_willThrow();
  v24 = v36;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
}

uint64_t sub_1BA16E780(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_1BA16E7BC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_1BA16E7CC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5C9AD0)
  {
    v0 = sub_1BA19ADEC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5C9AD0);
  }
}

double sub_1BA16E818@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  unint64_t v6;
  char v7;
  double result;

  if (*(_QWORD *)(a3 + 16) && (v6 = sub_1BA169038(a1, a2), (v7 & 1) != 0))
  {
    sub_1BA16E780(*(_QWORD *)(a3 + 56) + 32 * v6, (uint64_t)a4);
  }
  else
  {
    result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

uint64_t sub_1BA16E868(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void sub_1BA16E8B4(uint64_t a1@<X8>)
{
  sub_1BA16E8D4(a1);
}

void sub_1BA16E8D4(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v13;

  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 80);
  v5 = OUTLINED_FUNCTION_7_7();
  v6 = *(_QWORD *)(v5 - 8);
  OUTLINED_FUNCTION_8_8();
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v13 - v9;
  v11 = (uint64_t)v1 + *(_QWORD *)(v3 + 96);
  OUTLINED_FUNCTION_0_14();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v10, v11, v5);
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v4) == 1)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  else
  {
    *(_QWORD *)(a1 + 24) = v4;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)a1);
    (*(void (**)(uint64_t *, char *, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(boxed_opaque_existential_0, v10, v4);
  }
  OUTLINED_FUNCTION_1_14();
}

void sub_1BA16E9B4(id a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 - 5 <= 1)

}

void destroy for FixedSizer.Fixed(uint64_t a1)
{
  sub_1BA16E9B4(*(id *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_1BA16E9E0(unint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = _swift_isClassOrObjCExistentialType();
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  v5 = a2 & 0xFFFFFFFFFFFFF8;
  if ((result & 1) == 0)
    v5 = a2;
  if (*(_QWORD *)(v5 + 16) <= a1)
    goto LABEL_7;
  return result;
}

id sub_1BA16EA30()
{
  void *v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v11;
  id v12;
  _OWORD v13[2];
  _BYTE v14[24];
  uint64_t v15;

  v1 = objc_msgSend(v0, sel_string);
  v2 = sub_1BA19ABB8();
  v4 = v3;

  swift_bridgeObjectRelease();
  v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0)
    v5 = v2 & 0xFFFFFFFFFFFFLL;
  if (v5)
  {
    v6 = *MEMORY[0x1E0DC1178];
    if (objc_msgSend(v11, sel_attribute_atIndex_effectiveRange_, *MEMORY[0x1E0DC1178], 0, 0))
    {
      sub_1BA19AE40();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v13, 0, sizeof(v13));
    }
    sub_1BA16EC58((uint64_t)v13, (uint64_t)v14);
    if (v15)
    {
      sub_1BA16FBE0();
      if ((swift_dynamicCast() & 1) != 0)
      {
        if (objc_msgSend(v12, sel_lineBreakMode) == (id)4)
        {
          v7 = objc_msgSend(v11, sel_length);
          v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3778]), sel_initWithAttributedString_, v11);
          objc_msgSend(v8, sel_removeAttribute_range_, v6, 0, v7);
          v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC1288]), sel_init);
          objc_msgSend(v9, sel_setParagraphStyle_, v12);
          objc_msgSend(v9, sel_setLineBreakMode_, 0);
          objc_msgSend(v8, sel_addAttribute_value_range_, v6, v9, 0, v7);

          return v8;
        }

      }
    }
    else
    {
      sub_1BA170698((uint64_t)v14);
    }
  }
  return v11;
}

uint64_t type metadata accessor for DynamicSizer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DynamicSizer);
}

uint64_t type metadata accessor for AnchorSizer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AnchorSizer);
}

uint64_t sub_1BA16EC58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BA16E7CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BA16EC9C(uint64_t a1)
{
  return sub_1BA16ECB8(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1BA16ECDC);
}

uint64_t sub_1BA16ECB8(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v2;

  return a2(a1, v2[6], v2[7], v2[2], v2[3], v2[4], v2[5]);
}

uint64_t sub_1BA16ECDC@<X0>(uint64_t (*a1)(double, double, double, double)@<X1>, uint64_t a2@<X4>, uint64_t *a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  uint64_t v7;
  uint64_t result;

  a3[3] = a2;
  __swift_allocate_boxed_opaque_existential_0(a3);
  result = a1(a4, a5, a6, a7);
  if (v7)
    return __swift_deallocate_boxed_opaque_existential_0((uint64_t)a3);
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_1BA169D54(a1, &qword_1ED5C9A90);
}

_QWORD *sub_1BA16ED7C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

void SizerResult.text.getter()
{
  __asm { BR              X12 }
}

void sub_1BA16EDD8()
{
  OUTLINED_FUNCTION_19();
  SizerResult.text.getter();
  OUTLINED_FUNCTION_8();
}

id sub_1BA16EDFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v2;
  __int128 v3;

  v2 = *(void **)(v1 + 80);
  v3 = *(_OWORD *)(v1 + 64);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 32) = v2;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(v1 + 88);
  return v2;
}

double sub_1BA16EE24()
{
  sub_1BA16EE40();
  return 0.0;
}

double sub_1BA16EE40()
{
  return 0.0;
}

void sub_1BA16EE4C(double a1, double a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = v2[2];
  v5 = v2[3];
  OUTLINED_FUNCTION_0_14();
  v7 = v2[7];
  OUTLINED_FUNCTION_0_14();
  v8 = v2[8];
  OUTLINED_FUNCTION_0_14();
  v9 = v2[9];
  v10 = v2[6];
  v11 = OUTLINED_FUNCTION_6();
  *(_QWORD *)(v11 + 16) = v6;
  *(_QWORD *)(v11 + 24) = v5;
  *(double *)(v11 + 32) = a1;
  *(double *)(v11 + 40) = a2;
  *(_QWORD *)(v11 + 64) = v8;
  *(_QWORD *)(v11 + 72) = v9;
  *(_QWORD *)(v11 + 48) = v10;
  *(_QWORD *)(v11 + 56) = v7;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13_0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  OUTLINED_FUNCTION_2_8();
}

void LayoutContext.set(context:for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  if (a3)
  {
    OUTLINED_FUNCTION_0_14();
    OUTLINED_FUNCTION_6_4();
    v5 = swift_retain();
    sub_1BA16F490(v5, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_1BA16F798);
    OUTLINED_FUNCTION_7_4();
    OUTLINED_FUNCTION_12();
  }
}

void sub_1BA16EF7C(int64_t a1, char a2, uint64_t a3, double a4)
{
  void *v6;
  BOOL v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v27;

  if (a1 >= 1)
  {
    v6 = *(void **)(a3 + 32);
    v27 = MEMORY[0x1E0DEE9D8];
    sub_1BA16F1D8(0, a1, 0);
    v7 = 0;
    v8 = 1;
    v9 = a1;
    do
    {
      if (v7)
        goto LABEL_20;
      v11 = *(_QWORD *)(v27 + 16);
      v10 = *(_QWORD *)(v27 + 24);
      if (v11 >= v10 >> 1)
        sub_1BA16F1D8(v10 > 1, v11 + 1, 1);
      *(_QWORD *)(v27 + 16) = v11 + 1;
      v12 = v27 + 16 * v11;
      *(_QWORD *)(v12 + 32) = 87;
      *(_QWORD *)(v12 + 40) = 0xE100000000000000;
      v7 = v8 == a1;
      if (v8 == a1)
      {
        v8 = 0;
      }
      else if (__OFADD__(v8++, 1))
      {
        __break(1u);
        goto LABEL_19;
      }
      --v9;
    }
    while (v9);
    sub_1BA1706F0(0, (unint64_t *)&qword_1ED5C9A30, MEMORY[0x1E0DEA968], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
    sub_1BA16F2FC();
    v14 = sub_1BA19AB70();
    v16 = v15;
    swift_bridgeObjectRelease();
    if (v6)
    {
      v17 = v6;
      if ((uint64_t)objc_msgSend(v17, sel_length) > 0)
      {
        v18 = objc_msgSend(v17, sel_attributesAtIndex_effectiveRange_, 0, 0);
        type metadata accessor for Key(0);
        sub_1BA16F3F4();
        v19 = sub_1BA19AB1C();

LABEL_15:
        v20 = objc_allocWithZone(MEMORY[0x1E0CB3498]);
        v21 = sub_1BA16F33C(v14, v16, v19);
        objc_msgSend(v21, sel_boundingRectWithSize_options_context_, 33, 0, a4, 1.79769313e308);
        if ((a2 & 1) == 0)
          CGRectIntegral(*(CGRect *)&v22);

        return;
      }

    }
    v19 = 0;
    goto LABEL_15;
  }
LABEL_19:
  __break(1u);
LABEL_20:
  __break(1u);
}

uint64_t sub_1BA16F1D8(uint64_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1BA16F1F4(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

uint64_t sub_1BA16F1F4(uint64_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;

  v5 = result;
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
    sub_1BA1706F0(0, &qword_1ED5C9AC8, MEMORY[0x1E0DEA968], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
    v10 = swift_allocObject();
    v11 = _swift_stdlib_malloc_size((const void *)v10);
    *(_QWORD *)(v10 + 16) = v8;
    *(_QWORD *)(v10 + 24) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = MEMORY[0x1E0DEE9D8];
  }
  if ((v5 & 1) != 0)
  {
    sub_1BA181E90((char *)(a4 + 32), v8, (char *)(v10 + 32));
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

unint64_t sub_1BA16F2FC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED5C9A38;
  if (!qword_1ED5C9A38)
  {
    sub_1BA173858();
    result = MEMORY[0x1BCCD6858](MEMORY[0x1E0DEAF20], v1);
    atomic_store(result, (unint64_t *)&qword_1ED5C9A38);
  }
  return result;
}

id sub_1BA16F33C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)sub_1BA19AB94();
  swift_bridgeObjectRelease();
  if (a3)
  {
    type metadata accessor for Key(0);
    sub_1BA16F3F4();
    v6 = (void *)sub_1BA19AB10();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v3, sel_initWithString_attributes_, v5, v6);

  return v7;
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_1BA169D54(a1, &qword_1ED5C9A78);
}

unint64_t sub_1BA16F3F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED5C9A68;
  if (!qword_1ED5C9A68)
  {
    type metadata accessor for Key(255);
    result = MEMORY[0x1BCCD6858](&unk_1BA19BC70, v1);
    atomic_store(result, (unint64_t *)&qword_1ED5C9A68);
  }
  return result;
}

unint64_t sub_1BA16F434(uint64_t a1)
{
  uint64_t v1;

  return sub_1BA167F70(a1, *(uint64_t (**)(void))(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1BA16F454@<X0>(__int128 *a1@<X0>, char *a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  char v6;
  uint64_t result;

  v6 = *a2;
  result = sub_1BA16DE20(a1, a4);
  *(_BYTE *)(a4 + 40) = v6;
  *(_BYTE *)(a4 + 41) = a3;
  return result;
}

uint64_t sub_1BA16F490(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t))
{
  _QWORD *v4;
  uint64_t v10;

  swift_isUniquelyReferenced_nonNull_native();
  OUTLINED_FUNCTION_8_5();
  a4(a1, a2, a3);
  *v4 = v10;
  return OUTLINED_FUNCTION_1_12();
}

void BuilderType.prop<A>(name:keyPath:value:)()
{
  uint64_t v0;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_32(v0);
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_12_6();
}

uint64_t sub_1BA16F54C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  OUTLINED_FUNCTION_29_1(a1, a2);
  OUTLINED_FUNCTION_4_3();
  swift_bridgeObjectRetain();
  v5 = Prop.__allocating_init(_:_:name:)(v2, (uint64_t)&v7, v4, v3);
  OUTLINED_FUNCTION_1_31(v5);
  return OUTLINED_FUNCTION_9_12();
}

void BuilderType.prop<A>(keyPath:value:)(uint64_t *a1)
{
  OUTLINED_FUNCTION_32(*a1);
  OUTLINED_FUNCTION_39();
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_12_6();
}

uint64_t sub_1BA16F5F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  OUTLINED_FUNCTION_29_1(a1, a2);
  v2 = OUTLINED_FUNCTION_4_3();
  v3 = Prop.__allocating_init(_:_:)(v2, (uint64_t)&v5);
  OUTLINED_FUNCTION_0_32(v3);
  return OUTLINED_FUNCTION_9_12();
}

uint64_t sub_1BA16F620(uint64_t a1)
{
  return LayoutBuilder.add(node:)(a1);
}

uint64_t Prop.__allocating_init(_:_:)(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_0_29();
  return Prop.init(_:_:)(a1, a2);
}

uint64_t Prop.init(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  char v6;

  *(_QWORD *)(v2 + 40) = a1;
  sub_1BA169928(a2, v2 + 48);
  v6 = 5;
  v4 = Node.init(kind:identifier:)(&v6, 0, 0);
  __swift_destroy_boxed_opaque_existential_1(a2);
  return v4;
}

uint64_t Prop.__allocating_init(_:_:name:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_0_29();
  return Prop.init(_:_:name:)(a1, a2, a3, a4);
}

uint64_t Prop.init(_:_:name:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  char v10;

  *(_QWORD *)(v4 + 40) = a1;
  sub_1BA169928(a2, v4 + 48);
  v10 = 5;
  v8 = Node.init(kind:identifier:)(&v10, a3, a4);
  __swift_destroy_boxed_opaque_existential_1(a2);
  return v8;
}

uint64_t sub_1BA16F798(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1BA18B12C(a1, a2, a3, a4, &qword_1ED5C9FC0, (void (*)(uint64_t))type metadata accessor for LayoutContext);
}

void sub_1BA16F7AC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_1BA19AF78();
    if (!v5)
      atomic_store(v4, a2);
  }
  OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1BA16F804(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 8))();
}

void sub_1BA16F814(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1BA16F828(a1, a2);
}

void sub_1BA16F828(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  sub_1BA16F860(a1, *(uint64_t (**)(uint64_t))(v2 + 80), *(_QWORD *)(v2 + 24), a2);
  OUTLINED_FUNCTION_15_1();
}

uint64_t sub_1BA16F860@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t)@<X1>, uint64_t a3@<X4>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t result;

  a4[3] = a3;
  __swift_allocate_boxed_opaque_existential_0(a4);
  result = a2(a1);
  if (v4)
    return __swift_deallocate_boxed_opaque_existential_0((uint64_t)a4);
  return result;
}

uint64_t sub_1BA16F8CC(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 40);
  return a1;
}

_QWORD *sub_1BA16F910(uint64_t a1)
{
  uint64_t v1;

  return sub_1BA16F92C(a1, *(_QWORD *(**)(unint64_t *__return_ptr))(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

_QWORD *sub_1BA16F92C(uint64_t a1, _QWORD *(*a2)(unint64_t *__return_ptr), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;

  result = a2(&v12);
  if (!v5)
  {
    v10 = v12;
    v11 = type metadata accessor for Sizing(0, a4, a5, v9);
    sub_1BA16A170(v11);
    return (_QWORD *)sub_1BA168614(v10);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_26()
{
  return sub_1BA19AFA8();
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_26_1()
{
  return swift_bridgeObjectRetain();
}

__n128 *OUTLINED_FUNCTION_24_1(__n128 *result, __n128 a2)
{
  unint64_t v2;

  result[1] = a2;
  result[2].n128_u64[0] = v2;
  result[2].n128_u8[8] = 1;
  return result;
}

uint64_t sub_1BA16F9F8(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for MinRatioSizer(a2, a1);
  return a2;
}

uint64_t initializeWithCopy for MinRatioSizer(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

uint64_t sub_1BA16FA78(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_4_11();
  result = OUTLINED_FUNCTION_0_16();
  if (byte_1ED5C9B08 == 1)
  {
    if (qword_1EF274300 != -1)
      swift_once();
    v4 = (id)qword_1EF278E80;
    sub_1BA19AD80();
    OUTLINED_FUNCTION_2_12();
    v5 = OUTLINED_FUNCTION_6();
    *(_OWORD *)(v5 + 16) = xmmword_1BA19C8C0;
    v6 = OUTLINED_FUNCTION_3_14(a2);
    v8 = v7;
    v9 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v5 + 56) = MEMORY[0x1E0DEA968];
    v10 = sub_1BA176834();
    *(_QWORD *)(v5 + 64) = v10;
    *(_QWORD *)(v5 + 32) = v6;
    *(_QWORD *)(v5 + 40) = v8;
    v11 = OUTLINED_FUNCTION_1_15();
    *(_QWORD *)(v5 + 96) = v9;
    *(_QWORD *)(v5 + 104) = v10;
    *(_QWORD *)(v5 + 72) = v11;
    *(_QWORD *)(v5 + 80) = v12;
    OUTLINED_FUNCTION_5_9();

    return swift_bridgeObjectRelease();
  }
  return result;
}

void __swift_allocate_boxed_opaque_existential_0Tm(uint64_t *a1)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
    *a1 = swift_allocBox();
  OUTLINED_FUNCTION_0_0();
}

unint64_t sub_1BA16FBE0()
{
  unint64_t result;

  result = qword_1ED5C9A60;
  if (!qword_1ED5C9A60)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED5C9A60);
  }
  return result;
}

uint64_t sub_1BA16FC1C(uint64_t a1)
{
  return sub_1BA16ECB8(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1BA16FC38);
}

uint64_t sub_1BA16FC38@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, double, double, double, double)@<X1>, uint64_t a3@<X4>, uint64_t *a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>)
{
  uint64_t v8;
  uint64_t result;

  a4[3] = a3;
  __swift_allocate_boxed_opaque_existential_0(a4);
  result = a2(a1, a5, a6, a7, a8);
  if (v8)
    return __swift_deallocate_boxed_opaque_existential_0((uint64_t)a4);
  return result;
}

void sub_1BA16FCD4(char a1@<W3>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;

  v4 = swift_allocObject();
  OUTLINED_FUNCTION_0_20(v4, v5, v6, v7);
  v8 = DimensionCursor.position.getter();
  if ((a1 & 1) != 0)
    v9 = 1.79769313e308;
  else
    v9 = DimensionCursor.remainingBounds.getter();
  *(double *)(v4 + 16) = v8;
  *(double *)(v4 + 24) = v9;
  *(_BYTE *)(v4 + 32) = 0;
  *a2 = v4;
}

void sub_1BA16FDA0(uint64_t a1@<X3>, uint64_t a2@<X4>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;

  v6 = swift_allocObject();
  type metadata accessor for DimensionCursor(0, a1, a2, v7);
  v8 = DimensionCursor.position.getter();
  v9 = DimensionCursor.remainingBounds.getter();
  *(double *)(v6 + 16) = v8;
  *(double *)(v6 + 24) = v9;
  *(_BYTE *)(v6 + 32) = 1;
  *a3 = v6;
}

double DimensionCursor.remainingBounds.getter()
{
  char *v0;
  char v1;
  double v2;

  v1 = *v0;
  v2 = Cursor.remainingBounds.getter();
  if ((v1 & 1) != 0)
    return CGRectGetHeight(*(CGRect *)&v2);
  else
    return CGRectGetWidth(*(CGRect *)&v2);
}

uint64_t sub_1BA16FE94@<X0>(unint64_t *a1@<X0>, unint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t@<X8>, CGFloat@<D0>, CGFloat@<D1>, CGFloat@<D2>, CGFloat@<D3>);
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double (*v35)(CGFloat, CGFloat, CGFloat, CGFloat);
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  char v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  char v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;

  v5 = *a1;
  v6 = *a2;
  sub_1BA170484();
  v7 = v5 >> 61;
  if (v5 >> 61 == 1)
    goto LABEL_6;
  v8 = v6 >> 61;
  if (!(_DWORD)v7)
  {
    if (v8)
    {
      switch((int)v8)
      {
        case 1:
          goto LABEL_6;
        case 3:
          goto LABEL_8;
        case 4:
          goto LABEL_13;
        case 5:
          goto LABEL_18;
        case 6:
          goto LABEL_23;
        default:
          goto LABEL_30;
      }
    }
    v9 = *(_BYTE *)(v5 + 32);
    v11 = *(_QWORD *)(v5 + 16);
    v10 = *(_QWORD *)(v5 + 24);
    v12 = *(_QWORD *)(v6 + 16);
    v13 = *(_QWORD *)(v6 + 24);
    v14 = *(_BYTE *)(v6 + 32);
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v11;
    *(_QWORD *)(result + 24) = v12;
    *(_QWORD *)(result + 32) = v10;
    *(_QWORD *)(result + 40) = v13;
    *(_BYTE *)(result + 48) = v9;
    *(_BYTE *)(result + 49) = v14;
    goto LABEL_33;
  }
  if ((_DWORD)v8 == 1)
  {
LABEL_6:
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 40) = &type metadata for DimensionWiseSizer;
    *(_QWORD *)(v16 + 48) = &off_1E71E85D8;
    v17 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v17;
    sub_1BA190674(v3, v17 + 16);
    result = v16 | 0x2000000000000000;
LABEL_33:
    *a3 = result;
    return result;
  }
  if ((_DWORD)v7 == 4)
  {
    v5 = *(_QWORD *)(v5 + 16);
LABEL_14:
    swift_retain();
    swift_retain();
    v19 = swift_allocObject();
    v52 = v6;
    v53 = v5;
    sub_1BA16FE94((_QWORD *)(v19 + 16), &v53, &v52);
    swift_release();
    swift_release();
    result = v19 | 0x3000000000000000;
    goto LABEL_33;
  }
  if ((_DWORD)v8 == 4)
  {
LABEL_13:
    v6 = *(_QWORD *)(v6 + 16);
    goto LABEL_14;
  }
  if ((_DWORD)v7 == 5)
  {
    v20 = *(_QWORD *)(v5 + 16);
    v21 = *(_QWORD *)(v5 + 24);
    v22 = *(_QWORD *)(v5 + 32);
    v51 = v6;
    v52 = v20;
    swift_retain();
    swift_retain();
    sub_1BA16FE94(&v53, &v52, &v51);
    v23 = v53;
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = v23;
    v25 = swift_allocObject();
    *(_QWORD *)(v25 + 16) = v21;
    *(_QWORD *)(v25 + 24) = v22;
    v26 = sub_1BA171438;
LABEL_19:
    *(_QWORD *)(v24 + 24) = v26;
    *(_QWORD *)(v24 + 32) = v25;
    swift_release();
    result = v24 | 0x6000000000000000;
    goto LABEL_33;
  }
  if ((_DWORD)v8 == 5)
  {
LABEL_18:
    v27 = *(_QWORD *)(v6 + 24);
    v28 = *(_QWORD *)(v6 + 32);
    v51 = *(_QWORD *)(v6 + 16);
    v52 = v5;
    swift_retain();
    swift_retain();
    sub_1BA16FE94(&v53, &v52, &v51);
    v29 = v53;
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = v29;
    v25 = swift_allocObject();
    *(_QWORD *)(v25 + 16) = v27;
    *(_QWORD *)(v25 + 24) = v28;
    v26 = sub_1BA19061C;
    goto LABEL_19;
  }
  if ((_DWORD)v7 == 6)
  {
    v30 = *(_QWORD *)(v5 + 16);
    v31 = *(_QWORD *)(v5 + 24);
    v32 = *(_QWORD *)(v5 + 32);
    v33 = swift_allocObject();
    v52 = v6;
    v53 = v30;
    swift_retain();
    swift_retain();
    sub_1BA16FE94((_QWORD *)(v33 + 16), &v53, &v52);
    v34 = swift_allocObject();
    *(_QWORD *)(v34 + 16) = v31;
    *(_QWORD *)(v34 + 24) = v32;
    v35 = sub_1BA1905D8;
LABEL_24:
    *(_QWORD *)(v33 + 24) = v35;
    *(_QWORD *)(v33 + 32) = v34;
    swift_release();
    result = v33 | 0x7000000000000000;
    goto LABEL_33;
  }
  if ((_DWORD)v8 == 6)
  {
LABEL_23:
    v36 = *(_QWORD *)(v6 + 16);
    v37 = *(_QWORD *)(v6 + 24);
    v38 = *(_QWORD *)(v6 + 32);
    v33 = swift_allocObject();
    v52 = v36;
    v53 = v5;
    swift_retain();
    swift_retain();
    sub_1BA16FE94((_QWORD *)(v33 + 16), &v53, &v52);
    v34 = swift_allocObject();
    *(_QWORD *)(v34 + 16) = v37;
    *(_QWORD *)(v34 + 24) = v38;
    v35 = sub_1BA19059C;
    goto LABEL_24;
  }
  if ((_DWORD)v7 == 3)
  {
    v5 = *(_QWORD *)(v5 + 16);
    goto LABEL_9;
  }
  if ((_DWORD)v8 == 3)
  {
LABEL_8:
    v6 = *(_QWORD *)(v6 + 16);
LABEL_9:
    swift_retain();
    swift_retain();
    v18 = swift_allocObject();
    v52 = v6;
    v53 = v5;
    sub_1BA16FE94((_QWORD *)(v18 + 16), &v53, &v52);
    swift_release();
    swift_release();
    result = v18 | 0x5000000000000000;
    goto LABEL_33;
  }
  if ((_DWORD)v7 == 2)
  {
    v39 = *(_QWORD *)(v5 + 16);
    v40 = *(_QWORD *)(v5 + 24);
    v41 = *(_BYTE *)(v5 + 32);
    v51 = v6;
    v52 = v39;
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1BA16FE94(&v53, &v52, &v51);
    v42 = v53;
    v43 = swift_allocObject();
    *(_QWORD *)(v43 + 16) = v42;
    sub_1BA171B84();
    v44 = swift_allocObject();
    *(_OWORD *)(v44 + 16) = xmmword_1BA19C0E0;
    *(_QWORD *)(v44 + 32) = v40;
    *(_BYTE *)(v44 + 40) = v41;
    swift_release();
    swift_release();
    v45 = MEMORY[0x1E0DEE9D8];
    *(_QWORD *)(v43 + 24) = v44;
    *(_QWORD *)(v43 + 32) = v45;
LABEL_32:
    swift_release();
    result = v43 | 0x4000000000000000;
    goto LABEL_33;
  }
LABEL_30:
  if ((_DWORD)v8 == 2)
  {
    v46 = *(_QWORD *)(v6 + 16);
    v47 = *(_QWORD *)(v6 + 24);
    v48 = *(_BYTE *)(v6 + 32);
    v51 = v46;
    v52 = v5;
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1BA16FE94(&v53, &v52, &v51);
    v49 = v53;
    v43 = swift_allocObject();
    *(_QWORD *)(v43 + 16) = v49;
    sub_1BA171B84();
    v50 = swift_allocObject();
    *(_OWORD *)(v50 + 16) = xmmword_1BA19C0E0;
    *(_QWORD *)(v50 + 32) = v47;
    *(_BYTE *)(v50 + 40) = v48;
    swift_release();
    swift_release();
    *(_QWORD *)(v43 + 24) = MEMORY[0x1E0DEE9D8];
    *(_QWORD *)(v43 + 32) = v50;
    goto LABEL_32;
  }
  swift_retain();
  result = sub_1BA19B014();
  __break(1u);
  return result;
}

void sub_1BA170484()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1ED5C9138[0])
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, qword_1ED5C9138);
  }
}

void sub_1BA1704D8(_QWORD *a1@<X8>)
{
  uint64_t v1;

  sub_1BA1704FC(*(void **)v1, *(double *)(v1 + 8), *(_BYTE *)(v1 + 16), a1);
}

void sub_1BA1704FC(void *a1@<X3>, double a2@<X4>, char a3@<W5>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;

  if (a3)
  {
    if (a3 == 1)
    {
      v8 = OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_0_27(v8, v9, v10, v11);
      v12 = OUTLINED_FUNCTION_3_23();
      v13 = sub_1BA184D80() * *(double *)&a1;
      *(double *)(v4 + 16) = v12;
    }
    else
    {
      v19 = OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_0_27(v19, v20, v21, v22);
      v23 = OUTLINED_FUNCTION_3_23();
      objc_msgSend(a1, sel_scaledValueForValue_, a2);
      *(double *)(v4 + 16) = v23;
    }
    *(double *)(v4 + 24) = v13;
  }
  else
  {
    v14 = OUTLINED_FUNCTION_2_23();
    OUTLINED_FUNCTION_0_27(v14, v15, v16, v17);
    *(double *)(v4 + 16) = OUTLINED_FUNCTION_3_23();
    *(double *)(v4 + 24) = *(double *)&a1;
  }
  *(_BYTE *)(v4 + 32) = 1;
  *a4 = v4;
}

uint64_t type metadata accessor for DimensionCursor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DimensionCursor);
}

double DimensionCursor.position.getter()
{
  char *v0;
  char v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  v2 = *((_QWORD *)v0 + 1);
  v3 = v2 + 488;
  if ((v1 & 1) != 0)
  {
    OUTLINED_FUNCTION_0_23();
    v3 = v2 + 496;
  }
  else
  {
    OUTLINED_FUNCTION_0_23();
  }
  return *(double *)v3;
}

void sub_1BA170664(uint64_t a1@<X3>, uint64_t a2@<X4>, uint64_t *a3@<X8>)
{
  sub_1BA16FDA0(a1, a2, a3);
}

void sub_1BA170678(uint64_t *a1@<X8>)
{
  char *v1;

  sub_1BA16FCD4(*v1, a1);
}

uint64_t sub_1BA170698(uint64_t a1)
{
  uint64_t v2;

  sub_1BA1706F0(0, (unint64_t *)&qword_1ED5C9AD0, MEMORY[0x1E0DEE9B8] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1BA1706F0(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(0, a3);
    if (!v6)
      atomic_store(v5, a2);
  }
}

uint64_t sub_1BA170734(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  char v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = MEMORY[0x1E0DEE9E8];
    goto LABEL_38;
  }
  sub_1BA171040();
  result = sub_1BA19AE88();
  v3 = result;
  v28 = *(_QWORD *)(a1 + 16);
  if (!v28)
  {
LABEL_38:
    swift_bridgeObjectRelease();
    return v3;
  }
  v4 = 0;
  v5 = result + 56;
  while (v4 < *(_QWORD *)(a1 + 16))
  {
    v6 = a1 + 32 + 24 * v4;
    v8 = *(double *)v6;
    v7 = *(double *)(v6 + 8);
    v9 = *(unsigned __int8 *)(v6 + 16);
    sub_1BA19B104();
    sub_1BA19B110();
    if (v9 != 1)
    {
      sub_1BA19B11C();
      sub_1BA19B11C();
    }
    result = sub_1BA19B128();
    v10 = -1 << *(_BYTE *)(v3 + 32);
    v11 = result & ~v10;
    v12 = v11 >> 6;
    v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
    v14 = 1 << v11;
    v15 = *(_QWORD *)(v3 + 48);
    if (((1 << v11) & v13) != 0)
    {
      v16 = ~v10;
      if (*(_QWORD *)&v8 > 1uLL)
        v17 = v9;
      else
        v17 = 0;
      if (*(_QWORD *)&v8 ^ 1 | *(_QWORD *)&v7)
        v18 = 0;
      else
        v18 = v9;
      if (*(_QWORD *)&v8 | *(_QWORD *)&v7)
        v19 = 0;
      else
        v19 = v9;
      do
      {
        v20 = v15 + 24 * v11;
        v21 = *(double *)v20;
        v22 = *(double *)(v20 + 8);
        if (*(_BYTE *)(v20 + 16) == 1)
        {
          if (*(_QWORD *)&v21 | *(_QWORD *)&v22)
          {
            if (*(_QWORD *)&v21 ^ 1 | *(_QWORD *)&v22)
            {
              if ((v17 & 1) != 0)
                goto LABEL_35;
            }
            else if ((v18 & 1) != 0)
            {
              goto LABEL_35;
            }
          }
          else if ((v19 & 1) != 0)
          {
            goto LABEL_35;
          }
        }
        else if ((v9 & 1) == 0 && v21 == v8 && v22 == v7)
        {
          goto LABEL_35;
        }
        v11 = (v11 + 1) & v16;
        v12 = v11 >> 6;
        v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
        v14 = 1 << v11;
      }
      while ((v13 & (1 << v11)) != 0);
    }
    *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
    v24 = v15 + 24 * v11;
    *(double *)v24 = v8;
    *(double *)(v24 + 8) = v7;
    *(_BYTE *)(v24 + 16) = v9;
    v25 = *(_QWORD *)(v3 + 16);
    v26 = __OFADD__(v25, 1);
    v27 = v25 + 1;
    if (v26)
      goto LABEL_40;
    *(_QWORD *)(v3 + 16) = v27;
LABEL_35:
    if (++v4 == v28)
      goto LABEL_38;
  }
  __break(1u);
LABEL_40:
  __break(1u);
  return result;
}

void sub_1BA170980()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5C9AA0)
  {
    v0 = sub_1BA19AFE4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5C9AA0);
  }
}

uint64_t sub_1BA1709C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char *v3;
  unint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v10 = a2;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v3 = (char *)(a1 + 48);
    do
    {
      v4 = *((_QWORD *)v3 - 2);
      v5 = *((_QWORD *)v3 - 1);
      v6 = *v3;
      v3 += 24;
      sub_1BA170A38((uint64_t)&v9, v4, v5, v6);
      --v2;
    }
    while (v2);
    OUTLINED_FUNCTION_12();
    return v10;
  }
  else
  {
    v7 = a2;
    OUTLINED_FUNCTION_12();
  }
  return v7;
}

uint64_t sub_1BA170A38(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  BOOL v16;
  _BOOL4 v17;
  BOOL v18;
  uint64_t v19;
  double v20;
  double v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t result;
  uint64_t v25;
  uint64_t v26;

  v5 = v4;
  v10 = a4 & 1;
  v11 = *v5;
  sub_1BA19B104();
  sub_1BA19B110();
  if ((a4 & 1) == 0)
    sub_1BA1773D8();
  v12 = sub_1BA19B128();
  v13 = -1 << *(_BYTE *)(v11 + 32);
  v14 = v12 & ~v13;
  if (((*(_QWORD *)(v11 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v15 = ~v13;
    v16 = v10 != 0;
    v17 = a2 > 1 && v10 != 0;
    if (a2 ^ 1 | a3)
      v18 = 0;
    else
      v18 = v10 != 0;
    if (a2 | a3)
      v16 = 0;
    do
    {
      v19 = *(_QWORD *)(v11 + 48) + 24 * v14;
      v20 = *(double *)v19;
      v21 = *(double *)(v19 + 8);
      if (*(_BYTE *)(v19 + 16) == 1)
      {
        if (*(_QWORD *)&v20 | *(_QWORD *)&v21)
        {
          if (*(_QWORD *)&v20 ^ 1 | *(_QWORD *)&v21)
          {
            if (v17)
              goto LABEL_29;
          }
          else if (v18)
          {
            goto LABEL_29;
          }
        }
        else if (v16)
        {
          goto LABEL_29;
        }
      }
      else if (!v10 && v20 == *(double *)&a2 && v21 == *(double *)&a3)
      {
LABEL_29:
        result = 0;
        v25 = *(_QWORD *)(*v5 + 48) + 24 * v14;
        a2 = *(unint64_t *)v25;
        a3 = *(uint64_t *)(v25 + 8);
        LOBYTE(v10) = *(_BYTE *)(v25 + 16);
        goto LABEL_30;
      }
      v14 = (v14 + 1) & v15;
    }
    while (((*(_QWORD *)(v11 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0);
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v26 = *v5;
  *v5 = 0x8000000000000000;
  sub_1BA170C5C(a2, a3, v10, v14, isUniquelyReferenced_nonNull_native);
  *v5 = v26;
  swift_bridgeObjectRelease();
  result = 1;
LABEL_30:
  *(double *)a1 = *(double *)&a2;
  *(double *)(a1 + 8) = *(double *)&a3;
  *(_BYTE *)(a1 + 16) = v10;
  return result;
}

uint64_t sub_1BA170C5C(uint64_t result, uint64_t a2, unsigned __int8 a3, unint64_t a4, char a5)
{
  uint64_t *v5;
  double v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v9 = *(double *)&result;
  v10 = *(_QWORD *)(*v5 + 16);
  v11 = *(_QWORD *)(*v5 + 24);
  if (v11 <= v10 || (a5 & 1) == 0)
  {
    if ((a5 & 1) != 0)
    {
      sub_1BA198A04();
    }
    else
    {
      if (v11 > v10)
      {
        result = (uint64_t)sub_1BA198CF4();
        goto LABEL_28;
      }
      sub_1BA170EA8();
    }
    v12 = *v5;
    sub_1BA19B104();
    sub_1BA19B110();
    if ((a3 & 1) == 0)
      sub_1BA1773D8();
    result = sub_1BA19B128();
    v13 = -1 << *(_BYTE *)(v12 + 32);
    a4 = result & ~v13;
    if (((*(_QWORD *)(v12 + 56 + ((a4 >> 3) & 0xFFFFFFFFFFFFF8)) >> a4) & 1) != 0)
    {
      v14 = ~v13;
      do
      {
        v15 = *(_QWORD *)(v12 + 48) + 24 * a4;
        v16 = *(double *)v15;
        v17 = *(double *)(v15 + 8);
        if (*(_BYTE *)(v15 + 16) == 1)
        {
          if (*(_QWORD *)&v16 | *(_QWORD *)&v17)
          {
            if (*(_QWORD *)&v16 ^ 1 | *(_QWORD *)&v17)
            {
              if ((a3 & (*(_QWORD *)&v9 > 1uLL)) != 0)
                goto LABEL_31;
            }
            else if ((a3 & ((*(_QWORD *)&v9 ^ 1 | a2) == 0)) != 0)
            {
              goto LABEL_31;
            }
          }
          else if ((a3 & ((*(_QWORD *)&v9 | a2) == 0)) != 0)
          {
            goto LABEL_31;
          }
        }
        else if ((a3 & 1) == 0 && v16 == v9 && v17 == *(double *)&a2)
        {
          goto LABEL_31;
        }
        a4 = (a4 + 1) & v14;
      }
      while (((*(_QWORD *)(v12 + 56 + ((a4 >> 3) & 0xFFFFFFFFFFFFF8)) >> a4) & 1) != 0);
    }
  }
LABEL_28:
  v19 = *v5;
  *(_QWORD *)(*v5 + 8 * (a4 >> 6) + 56) |= 1 << a4;
  v20 = *(_QWORD *)(v19 + 48) + 24 * a4;
  *(double *)v20 = v9;
  *(double *)(v20 + 8) = *(double *)&a2;
  *(_BYTE *)(v20 + 16) = a3 & 1;
  v21 = *(_QWORD *)(v19 + 16);
  v22 = __OFADD__(v21, 1);
  v23 = v21 + 1;
  if (v22)
  {
    __break(1u);
LABEL_31:
    result = sub_1BA19B0BC();
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v19 + 16) = v23;
  }
  return result;
}

unint64_t sub_1BA170EA8()
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
  unint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t i;
  int64_t v13;
  unint64_t v14;
  int64_t v15;

  v1 = v0;
  v2 = *v0;
  sub_1BA171040();
  v3 = sub_1BA19AE7C();
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_23:
    result = swift_release();
    *v1 = v3;
    return result;
  }
  v4 = 1 << *(_BYTE *)(v2 + 32);
  v5 = v2 + 56;
  v6 = -1;
  if (v4 < 64)
    v6 = ~(-1 << v4);
  v7 = v6 & *(_QWORD *)(v2 + 56);
  v8 = (unint64_t)(v4 + 63) >> 6;
  result = swift_retain();
  v10 = 0;
  if (!v7)
    goto LABEL_6;
LABEL_5:
  v11 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (i = v11 | (v10 << 6); ; i = __clz(__rbit64(v14)) + (v10 << 6))
  {
    result = sub_1BA198BD8(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 24 * i), *(_QWORD *)(*(_QWORD *)(v2 + 48) + 24 * i + 8), *(_BYTE *)(*(_QWORD *)(v2 + 48) + 24 * i + 16), v3);
    if (v7)
      goto LABEL_5;
LABEL_6:
    v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v13 >= v8)
      goto LABEL_22;
    v14 = *(_QWORD *)(v5 + 8 * v13);
    ++v10;
    if (!v14)
    {
      v10 = v13 + 1;
      if (v13 + 1 >= v8)
        goto LABEL_22;
      v14 = *(_QWORD *)(v5 + 8 * v10);
      if (!v14)
      {
        v10 = v13 + 2;
        if (v13 + 2 >= v8)
          goto LABEL_22;
        v14 = *(_QWORD *)(v5 + 8 * v10);
        if (!v14)
          break;
      }
    }
LABEL_19:
    v7 = (v14 - 1) & v14;
  }
  v15 = v13 + 3;
  if (v15 >= v8)
  {
LABEL_22:
    swift_release();
    goto LABEL_23;
  }
  v14 = *(_QWORD *)(v5 + 8 * v15);
  if (v14)
  {
    v10 = v15;
    goto LABEL_19;
  }
  while (1)
  {
    v10 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v10 >= v8)
      goto LABEL_22;
    v14 = *(_QWORD *)(v5 + 8 * v10);
    ++v15;
    if (v14)
      goto LABEL_19;
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_1BA171040()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5C9A98)
  {
    sub_1BA173F6C();
    v0 = sub_1BA19AE94();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5C9A98);
  }
}

uint64_t sub_1BA171098(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 1u)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_1BA1710B0(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = OUTLINED_FUNCTION_0_16();
  if (byte_1ED5C9B08 == 1)
  {
    if (qword_1EF274300 != -1)
      swift_once();
    v4 = (id)qword_1EF278E80;
    sub_1BA19AD80();
    OUTLINED_FUNCTION_2_12();
    v5 = OUTLINED_FUNCTION_6();
    *(_OWORD *)(v5 + 16) = xmmword_1BA19C0E0;
    v6 = OUTLINED_FUNCTION_3_14(a2);
    v8 = v7;
    *(_QWORD *)(v5 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v5 + 64) = sub_1BA176834();
    *(_QWORD *)(v5 + 32) = v6;
    *(_QWORD *)(v5 + 40) = v8;
    OUTLINED_FUNCTION_5_9();

    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1BA1711B4()
{
  char *v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  size_t v14;

  OUTLINED_FUNCTION_8_9();
  if ((v4 & 1) != 0)
  {
    OUTLINED_FUNCTION_5_11();
    if (v6 != v7)
    {
      OUTLINED_FUNCTION_9_7();
      if (v6)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_4_13();
    }
  }
  else
  {
    v5 = v3;
  }
  v8 = *((_QWORD *)v0 + 2);
  if (v5 <= v8)
    v9 = *((_QWORD *)v0 + 2);
  else
    v9 = v5;
  if (v9)
  {
    OUTLINED_FUNCTION_3_16(v2, &qword_1ED5C9AB8);
    v10 = (char *)OUTLINED_FUNCTION_6();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = v0 + 32;
  v14 = 40 * v8;
  if ((v1 & 1) != 0)
  {
    if (v10 != v0 || &v13[v14] <= v12)
      memmove(v12, v13, v14);
    *((_QWORD *)v0 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v14);
  }
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7_8();
}

_QWORD *sub_1BA17128C@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t *a6@<X8>)
{
  return sub_1BA1712A0(a1, a2, a3, a4, a5, a6);
}

_QWORD *sub_1BA1712A0@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t *a6@<X8>)
{
  _QWORD *v6;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v22;
  _BYTE v23[8];
  uint64_t v24;
  uint64_t v25;

  v11 = *a1;
  v12 = *((_QWORD *)a1 + 1);
  v14 = v6[3];
  v13 = v6[4];
  __swift_project_boxed_opaque_existential_1(v6, v14);
  v20 = v11;
  v23[0] = v11;
  v15 = v12;
  v24 = v12;
  result = (*(_QWORD *(**)(uint64_t *__return_ptr, _BYTE *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 16))(&v25, v23, a2, a3, a4, a5, v14, v13);
  if (!v22)
  {
    v17 = v25;
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = v17;
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = a4;
    *(_QWORD *)(v19 + 24) = a5;
    *(_BYTE *)(v19 + 32) = v20;
    *(_QWORD *)(v19 + 40) = v15;
    *(_QWORD *)(v18 + 24) = sub_1BA171574;
    *(_QWORD *)(v18 + 32) = v19;
    *a6 = v18 | 0xA000000000000000;
    return (_QWORD *)swift_retain();
  }
  return result;
}

void sub_1BA1713C0(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  uint64_t v3;

  sub_1BA1713E8(0, a2, a3);
  OUTLINED_FUNCTION_16_0(v3);
  OUTLINED_FUNCTION_0_0();
}

void sub_1BA1713E8(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    sub_1BA16E868(255, a3);
    v4 = sub_1BA19ADEC();
    if (!v5)
      atomic_store(v4, a2);
  }
  OUTLINED_FUNCTION_0_0();
}

void sub_1BA171438(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  uint64_t v5;

  sub_1BA171440(*(void (**)(_QWORD *__return_ptr, _QWORD *))(v5 + 16), a1, a2, a3, a4, a5);
}

void sub_1BA171440(void (*a1)(_QWORD *__return_ptr, _QWORD *)@<X1>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  CGFloat MinX;
  uint64_t v13;
  uint64_t v14;
  CGFloat MinY;
  CGFloat Height;
  char v17;
  CGFloat v18;
  CGFloat v19;
  _QWORD v20[2];
  _QWORD v21[2];
  char v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  MinX = CGRectGetMinX(*(CGRect *)&a3);
  v23.origin.x = a3;
  v23.origin.y = a4;
  v23.size.width = a5;
  v23.size.height = a6;
  *(CGFloat *)v20 = MinX;
  v20[1] = CGRectGetWidth(v23);
  a1(v21, v20);
  v14 = v21[0];
  v13 = v21[1];
  if (v22)
  {
    if (v22 == 1)
    {
      v24.origin.x = a3;
      v24.origin.y = a4;
      v24.size.width = a5;
      v24.size.height = a6;
      MinY = CGRectGetMinY(v24);
      v25.origin.x = a3;
      v25.origin.y = a4;
      v25.size.width = a5;
      v25.size.height = a6;
      Height = CGRectGetHeight(v25);
      *(_QWORD *)a2 = v14;
      *(CGFloat *)(a2 + 8) = MinY;
      *(_QWORD *)(a2 + 16) = v13;
      *(CGFloat *)(a2 + 24) = Height;
      v17 = 1;
    }
    else
    {
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      v17 = 2;
    }
    *(_BYTE *)(a2 + 32) = v17;
  }
  else
  {
    v26.origin.x = a3;
    v26.origin.y = a4;
    v26.size.width = a5;
    v26.size.height = a6;
    v18 = CGRectGetMinY(v26);
    v27.origin.x = a3;
    v27.origin.y = a4;
    v27.size.width = a5;
    v27.size.height = a6;
    v19 = CGRectGetHeight(v27);
    *(_QWORD *)a2 = v14;
    *(CGFloat *)(a2 + 8) = v18;
    *(_QWORD *)(a2 + 16) = v13;
    *(CGFloat *)(a2 + 24) = v19;
    *(_BYTE *)(a2 + 32) = 0;
  }
}

double sub_1BA171574@<D0>(double *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1BA171584(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

double sub_1BA171584@<D0>(double *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  double v5;
  double v6;
  double result;

  v5 = *a1;
  v6 = a1[1];
  type metadata accessor for DimensionCursor(0, a2, a3, a2);
  result = DimensionCursor.remainingBounds.getter() - v6;
  *(double *)a4 = v5;
  *(double *)(a4 + 8) = result;
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

uint64_t type metadata accessor for _LayoutDecoder()
{
  return objc_opt_self();
}

unint64_t sub_1BA17161C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED5C8FE8;
  if (!qword_1ED5C8FE8)
  {
    v1 = type metadata accessor for _LayoutDecoder();
    result = MEMORY[0x1BCCD6858](&unk_1BA19E440, v1);
    atomic_store(result, (unint64_t *)&qword_1ED5C8FE8);
  }
  return result;
}

uint64_t sub_1BA17165C(uint64_t a1, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = MEMORY[0x1E0DEE9D8];
  sub_1BA19AF48();
  *(_QWORD *)(v2 + 40) = sub_1BA19AB34();
  *(_QWORD *)(v2 + 16) = a1;
  *(_BYTE *)(v2 + 24) = a2 & 1;
  return v2;
}

double sub_1BA1716CC()
{
  sub_1BA1716E8();
  return 0.0;
}

double sub_1BA1716E8()
{
  double *v0;
  CGRect v2;
  CGRect v3;

  if (*v0 == 1.79769313e308)
  {
    v2.origin.x = OUTLINED_FUNCTION_2_14();
    CGRectGetMaxX(v2);
  }
  v3.origin.x = OUTLINED_FUNCTION_2_14();
  CGRectGetHeight(v3);
  return 0.0;
}

void sub_1BA17175C(double *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  sub_1BA171774(a1, a2, a3, a4, a5);
}

void sub_1BA171774(double *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;

  v8 = a2;
  if (CGRectGetHeight(*(CGRect *)&a2) != 0.0)
  {
    sub_1BA19ADBC();
    v8 = v10;
    a3 = v11;
    a4 = v12;
    a5 = v13;
  }
  *a1 = v8;
  a1[1] = a3;
  a1[2] = a4;
  a1[3] = a5;
  a1[4] = v8;
  a1[5] = a3;
  a1[6] = a4;
  a1[7] = a5;
}

void sub_1BA17180C(_QWORD *a1)
{
  LayoutItemList.register(source:)(a1);
}

void LayoutItemList.register(source:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17[2];
  uint64_t v18;

  v2 = v1;
  v18 = OUTLINED_FUNCTION_3_12(*v2);
  MEMORY[0x1E0C80A78](v18, v4);
  v6 = (char *)v17 - v5;
  v7 = (_QWORD *)v2[3];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  swift_bridgeObjectRetain();
  v8 = OUTLINED_FUNCTION_13_1();
  v10 = sub_1BA171968(v8, v9, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v10 & 1) == 0)
  {
    v11 = OUTLINED_FUNCTION_13_1();
    v13 = v12;
    sub_1BA16E0B4((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1BA16E110);
    v14 = *(_QWORD *)(v2[3] + 16);
    sub_1BA16E074(v14, (uint64_t (*)(BOOL))sub_1BA16E110);
    v15 = v2[3];
    *(_QWORD *)(v15 + 16) = v14 + 1;
    v16 = v15 + 16 * v14;
    *(_QWORD *)(v16 + 32) = v11;
    *(_QWORD *)(v16 + 40) = v13;
    __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v17[1]);
    OUTLINED_FUNCTION_0_14();
    OUTLINED_FUNCTION_10_3();
    sub_1BA19ACC0();
    OUTLINED_FUNCTION_8_7();
  }
  OUTLINED_FUNCTION_1_13();
}

uint64_t sub_1BA171968(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  result = sub_1BA19B020();
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
    if (v12 || (sub_1BA19B020() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_1BA171A2C(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  id v9;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(void **)(a2 + 40);
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v5;
  v7 = *(_QWORD *)(a2 + 56);
  v8 = *(_BYTE *)(a2 + 64);
  v9 = v5;
  sub_1BA171AAC(v6, v7, v8);
  *(_QWORD *)(a1 + 48) = v6;
  *(_QWORD *)(a1 + 56) = v7;
  *(_BYTE *)(a1 + 64) = v8;
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  return a1;
}

uint64_t sub_1BA171AAC(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 1u)
    return swift_bridgeObjectRetain();
  return result;
}

unint64_t sub_1BA171AC4(unint64_t result)
{
  if ((result >> 62) <= 1)
    return swift_retain();
  return result;
}

uint64_t type metadata accessor for FontSizer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for FontSizer);
}

uint64_t sub_1BA171AEC@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t result;

  v8 = *a3;
  v9 = a3[1];
  v10 = *((_BYTE *)a3 + 16);
  result = sub_1BA16DE20(a1, a5);
  *(_QWORD *)(a5 + 40) = a2;
  *(_QWORD *)(a5 + 48) = v8;
  *(_QWORD *)(a5 + 56) = v9;
  *(_BYTE *)(a5 + 64) = v10;
  *(_BYTE *)(a5 + 65) = a4;
  return result;
}

void sub_1BA171B44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  OUTLINED_FUNCTION_2_21(a1, a2);
  *(_QWORD *)v2 = v3;
  *(_QWORD *)(v2 + 8) = v4;
  *(_BYTE *)(v2 + 16) = v5;
  OUTLINED_FUNCTION_5_0();
}

id sub_1BA171B6C(id result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 - 5 <= 1)
    return result;
  return result;
}

void sub_1BA171B84()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5C9AB0)
  {
    v0 = sub_1BA19AFE4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5C9AB0);
  }
}

unint64_t sub_1BA171BCC(unint64_t *a1)
{
  sub_1BA171BFC(*a1);
  sub_1BA168614(a1[1]);
  return sub_1BA168614(a1[2]);
}

unint64_t sub_1BA171BFC(unint64_t result)
{
  if ((result >> 62) <= 1)
    return swift_release();
  return result;
}

uint64_t type metadata accessor for IfSizer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for IfSizer);
}

_QWORD *sub_1BA171C24@<X0>(_QWORD *result@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *a2;
  v5 = *a3;
  *a4 = *result;
  a4[1] = v4;
  a4[2] = v5;
  return result;
}

uint64_t sub_1BA171C3C(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for OffsetSizer(a2, a1);
  return a2;
}

uint64_t initializeWithCopy for OffsetSizer(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  return a1;
}

double sub_1BA171CB4(double a1, double a2)
{
  return a1 + a2;
}

uint64_t sub_1BA171CBC(void *__src, uint64_t a2)
{
  uint64_t v2;
  _BYTE __dst[248];

  memcpy(__dst, __src, sizeof(__dst));
  return (*(uint64_t (**)(uint64_t, uint64_t, _BYTE *, _QWORD))(*(_QWORD *)(a2 + 72) + 40))(v2 + *(int *)(a2 + 84), v2 + *(int *)(a2 + 88), __dst, *(_QWORD *)(a2 + 40));
}

uint64_t destroy for AltFlexibleTextSizer(id *a1)
{

  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for Conditional(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Conditional);
}

uint64_t Conditional.condition.getter@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char v7;

  v4 = *v2;
  v5 = (unint64_t)*v2 >> 62;
  if ((_DWORD)v5)
  {
    if ((_DWORD)v5 == 1)
    {
      v6 = result;
      a2[3] = (uint64_t)&type metadata for NotCondition;
      a2[4] = (uint64_t)&off_1E71E8840;
      *a2 = OUTLINED_FUNCTION_9();
      return Conditional.condition.getter(v6);
    }
    if (v4 == 0x8000000000000000)
    {
      a2[3] = (uint64_t)&type metadata for FlexibleCondition;
      a2[4] = (uint64_t)&off_1E71EAB78;
      *(_BYTE *)a2 = 0;
      return result;
    }
    a2[3] = (uint64_t)&type metadata for FlexibleCondition;
    a2[4] = (uint64_t)&off_1E71EAB78;
    if (v4 == 0x8000000000000008)
      v7 = 1;
    else
      v7 = 2;
  }
  else
  {
    v7 = *(_BYTE *)(v4 + 16);
    a2[3] = (uint64_t)&type metadata for BoolCondition;
    a2[4] = (uint64_t)&off_1E71E62A8;
  }
  *(_BYTE *)a2 = v7;
  return result;
}

void LayoutContext.embedContext(for:)()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_0_14();
  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 72) + 16);
  OUTLINED_FUNCTION_6_4();
  if (v1)
  {
    OUTLINED_FUNCTION_9_4();
    if ((v2 & 1) != 0)
      OUTLINED_FUNCTION_4_8();
  }
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_0();
}

Swift::OpaquePointer_optional __swiftcall LayoutContext.metadata(for:)(Swift::String a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  void *v4;
  Swift::Bool v5;
  Swift::OpaquePointer_optional result;

  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_0_14();
  v2 = *(_QWORD *)(*(_QWORD *)(v1 + 64) + 16);
  OUTLINED_FUNCTION_6_4();
  if (v2)
  {
    OUTLINED_FUNCTION_9_4();
    if ((v3 & 1) != 0)
      swift_bridgeObjectRetain();
  }
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_0();
  result.value._rawValue = v4;
  result.is_nil = v5;
  return result;
}

uint64_t sub_1BA171F3C(uint64_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1BA171F58(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

uint64_t sub_1BA171F58(uint64_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;

  v5 = result;
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
    sub_1BA1706F0(0, &qword_1ED5C9AA8, (uint64_t)&type metadata for AltTextSized, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
    v10 = swift_allocObject();
    v11 = _swift_stdlib_malloc_size((const void *)v10);
    *(_QWORD *)(v10 + 16) = v8;
    *(_QWORD *)(v10 + 24) = 2 * ((uint64_t)(v11 - 32) / 96);
  }
  else
  {
    v10 = MEMORY[0x1E0DEE9D8];
  }
  if ((v5 & 1) != 0)
  {
    sub_1BA181E68((char *)(a4 + 32), v8, (char *)(v10 + 32));
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

unint64_t sub_1BA172068()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED5C9A28;
  if (!qword_1ED5C9A28)
  {
    sub_1BA1706F0(255, &qword_1ED5C9A20, (uint64_t)&type metadata for AltTextSized, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1BCCD6858](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1ED5C9A28);
  }
  return result;
}

unint64_t sub_1BA1720C0()
{
  unint64_t result;

  result = qword_1ED5C8C48;
  if (!qword_1ED5C8C48)
  {
    result = MEMORY[0x1BCCD6858](&unk_1BA19F148, &type metadata for AltTextSized);
    atomic_store(result, (unint64_t *)&qword_1ED5C8C48);
  }
  return result;
}

void sub_1BA1720FC()
{
  __asm { BR              X11 }
}

void sub_1BA172160(uint64_t a1@<X8>)
{
  const __CFAttributedString *v1;
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  double v6;
  uint64_t v7;
  CGRect v8;

  v6 = *(double *)(a1 + 16);
  if ((~*(_QWORD *)&v6 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v6 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v6 < 9.22337204e18)
  {
    v7 = *(unsigned __int8 *)(a1 + 24);
    v8.origin.x = v5;
    v8.origin.y = v4;
    v8.size.width = v3;
    v8.size.height = v2;
    CGRectGetWidth(v8);
    sub_1BA17244C(v1);
    __asm { BR              X9 }
  }
LABEL_7:
  __break(1u);
}

uint64_t sub_1BA17244C(const __CFAttributedString *a1)
{
  const __CTFramesetter *v2;
  const CGPath *Mutable;
  const __CTFrame *Frame;
  const __CFArray *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  CFRange v10;

  v2 = CTFramesetterCreateWithAttributedString(a1);
  Mutable = CGPathCreateMutable();
  sub_1BA19AD98();
  v10.length = (CFIndex)-[__CFAttributedString length](a1, sel_length, 0x3FF0000000000000, 0, 0, 0x3FF0000000000000, 0, 0);
  v10.location = 0;
  Frame = CTFramesetterCreateFrame(v2, v10, Mutable, 0);
  v5 = CTFrameGetLines(Frame);
  v6 = sub_1BA19AC54();

  v7 = sub_1BA1725A4(v6);
  swift_bridgeObjectRelease();
  if (v7)
  {
    if (v7 >> 62)
    {
      swift_bridgeObjectRetain();
      v8 = sub_1BA19AF90();

      swift_bridgeObjectRelease();
    }
    else
    {
      v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);

    }
    swift_bridgeObjectRelease();
  }
  else
  {

    v8 = 0;
    Mutable = Frame;
  }

  return v8;
}

uint64_t sub_1BA1725A4(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v7;

  v7 = MEMORY[0x1E0DEE9D8];
  v2 = a1 >> 62;
  if (a1 >> 62)
    goto LABEL_16;
  while (1)
  {
    sub_1BA19AEE8();
    if (v2)
      break;
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v3)
      return v7;
LABEL_6:
    for (i = 4; ; ++i)
    {
      v2 = i - 4;
      if ((a1 & 0xC000000000000001) != 0)
        MEMORY[0x1BCCD618C](i - 4, a1);
      else
        swift_unknownObjectRetain();
      v5 = i - 3;
      if (__OFADD__(v2, 1))
        break;
      type metadata accessor for CTLine(0);
      if (!swift_dynamicCastUnknownClass())
      {
        swift_unknownObjectRelease();
        swift_release();
        return 0;
      }
      sub_1BA19AEC4();
      sub_1BA19AEF4();
      sub_1BA19AF00();
      sub_1BA19AED0();
      if (v5 == v3)
        return v7;
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    sub_1BA19AF90();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  v3 = sub_1BA19AF90();
  swift_bridgeObjectRelease();
  if (v3)
    goto LABEL_6;
  return v7;
}

void type metadata accessor for CTLine(uint64_t a1)
{
  sub_1BA169D54(a1, &qword_1ED5C9EE8);
}

void sub_1BA17273C()
{
  sub_1BA172758();
}

void sub_1BA172750()
{
  OUTLINED_FUNCTION_0_0();
}

void sub_1BA172758()
{
  OUTLINED_FUNCTION_0_41();
}

void sub_1BA172778()
{
  uint64_t v0;

  sub_1BA16CEC0();
  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_2_31();
  swift_bridgeObjectRetain();
  swift_release();
  OUTLINED_FUNCTION_3_0();
}

uint64_t sub_1BA1727B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  char v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t result;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;

  OUTLINED_FUNCTION_1_29(a1, a2, a3);
  OUTLINED_FUNCTION_14_3();
  if (v7)
  {
    __break(1u);
    goto LABEL_9;
  }
  v8 = v5;
  v9 = v6;
  sub_1BA16F7AC(0, qword_1ED5C87B0, (void (*)(uint64_t))sub_1BA17395C);
  if ((OUTLINED_FUNCTION_5_18() & 1) == 0)
    goto LABEL_5;
  v10 = OUTLINED_FUNCTION_12_4();
  if ((v9 & 1) != (v11 & 1))
  {
LABEL_9:
    result = sub_1BA19B0C8();
    __break(1u);
    return result;
  }
  v8 = v10;
LABEL_5:
  if ((v9 & 1) != 0)
  {
    v12 = *(_QWORD *)(*(_QWORD *)v4 + 56);
    result = swift_bridgeObjectRelease();
    *(_QWORD *)(v12 + 8 * v8) = v3;
  }
  else
  {
    OUTLINED_FUNCTION_18_0();
    sub_1BA172A98(v14, v15, v16, v17, v18);
    return OUTLINED_FUNCTION_9_10();
  }
  return result;
}

unint64_t sub_1BA172874()
{
  unint64_t result;

  result = qword_1ED5C8798;
  if (!qword_1ED5C8798)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED5C8798);
  }
  return result;
}

uint64_t sub_1BA1728B0@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BA1728D0(a1);
}

uint64_t sub_1BA1728D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = *v1;
  OUTLINED_FUNCTION_0_14();
  sub_1BA19ADEC();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_7_6();
  MEMORY[0x1BCCD6858](MEMORY[0x1E0DEAF38], v3);
  v4 = sub_1BA19ABF4();
  swift_bridgeObjectRelease();
  result = sub_1BA19ACE4();
  a1[3] = result;
  *a1 = v4;
  return result;
}

void sub_1BA17298C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1BA1729A8(a1, a2, a3, a4);
  OUTLINED_FUNCTION_0_0();
}

void sub_1BA1729A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  if (v4[4])
    OUTLINED_FUNCTION_0_41();
  type metadata accessor for Node(0, *(_QWORD *)(*v4 + 80), *(_QWORD *)(*v4 + 96), a4);
  sub_1BA19AC9C();
  OUTLINED_FUNCTION_3_0();
}

void sub_1BA172A44()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5C87A8)
  {
    sub_1BA173CBC();
    v0 = sub_1BA19AFE4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5C87A8);
  }
}

unint64_t sub_1BA172A98(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
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

double sub_1BA172AE0@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4;
  char v5;
  double result;

  if (*(_QWORD *)(a1 + 16) && (v4 = sub_1BA172B30(), (v5 & 1) != 0))
  {
    sub_1BA16E780(*(_QWORD *)(a1 + 56) + 32 * v4, (uint64_t)a2);
  }
  else
  {
    result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t sub_1BA172B30()
{
  uint64_t v0;

  OUTLINED_FUNCTION_10_2();
  sub_1BA19ABC4();
  v0 = sub_1BA19B128();
  return sub_1BA172B7C(v0);
}

uint64_t sub_1BA172B7C(uint64_t a1)
{
  uint64_t v1;

  return a1 & ~(-1 << *(_BYTE *)(v1 + 32));
}

unint64_t sub_1BA172BA8()
{
  unint64_t result;

  result = qword_1ED5C8778;
  if (!qword_1ED5C8778)
  {
    result = MEMORY[0x1BCCD6858](&protocol conformance descriptor for SizerResultMetadataKey, &type metadata for SizerResultMetadataKey);
    atomic_store(result, (unint64_t *)&qword_1ED5C8778);
  }
  return result;
}

ValueMetadata *type metadata accessor for DimensionSizing()
{
  return &type metadata for DimensionSizing;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

unint64_t *sub_1BA172C08(unint64_t *result, uint64_t a2)
{
  unint64_t v2;

  if (a2 < 0x1D)
    v2 = (a2 << 59) & 0xF000000000000000 | (4 * (a2 & 1)) | *result & 0xFFFFFFFFFFFFFF8;
  else
    v2 = (8 * (a2 - 29)) | 0xE000000000000004;
  *result = v2;
  return result;
}

void sub_1BA172C40(uint64_t a1)
{
  sub_1BA168434(*(void **)a1, *(_QWORD *)(a1 + 8), *(void **)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

ValueMetadata *type metadata accessor for Ratio.Aspect()
{
  return &type metadata for Ratio.Aspect;
}

uint64_t BuilderType.dynamic(name:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1BA169248(a1, a2, a3, a4, a5, a6, (uint64_t)&unk_1E71E80B8, (uint64_t)sub_1BA16CD40);
}

ValueMetadata *type metadata accessor for Ratio()
{
  return &type metadata for Ratio;
}

ValueMetadata *type metadata accessor for ColumnSpec()
{
  return &type metadata for ColumnSpec;
}

ValueMetadata *type metadata accessor for PercentageFillSpacing()
{
  return &type metadata for PercentageFillSpacing;
}

void LayoutOptions.contentResizeScale.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 184);
}

uint64_t sub_1BA172CB4(uint64_t result, unsigned int a2)
{
  if (a2 >= 0x1D)
  {
    *(_QWORD *)result = a2 - 29;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 29;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
  }
  *(_BYTE *)(result + 32) = a2;
  return result;
}

double LayoutContentScale.scale.getter()
{
  char *v0;

  return dbl_1BA19DD78[*v0];
}

void type metadata accessor for PositioningAdjustmentOperator()
{
  OUTLINED_FUNCTION_8_3();
}

ValueMetadata *type metadata accessor for ColumnLayoutSize()
{
  return &type metadata for ColumnLayoutSize;
}

id LayoutOptions.traitCollection.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 80);
}

unint64_t destroy for DimensionSizing(unint64_t *a1)
{
  return sub_1BA172D3C(*a1);
}

unint64_t *sub_1BA172D10(unint64_t *result, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  if (a2 < 6)
  {
    v2 = *result & 0xFFFFFFFFFFFFFF8;
    v3 = a2 << 61;
  }
  else
  {
    v2 = 8 * (a2 - 6);
    v3 = 0xC000000000000000;
  }
  *result = v2 | v3;
  return result;
}

unint64_t sub_1BA172D3C(unint64_t result)
{
  switch(result >> 61)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BA172D6C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xE2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 227;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xE3)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xE3)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t sub_1BA172DB4(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xE3 && *(_BYTE *)(a1 + 33))
    {
      v2 = *(_DWORD *)a1 + 226;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 32);
      if (v3 <= 0x1D)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

ValueMetadata *type metadata accessor for ColumnSize()
{
  return &type metadata for ColumnSize;
}

uint64_t storeEnumTagSinglePayload for LayoutMarginAdjustment(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x7A)
  {
    *(_QWORD *)result = a2 - 123;
    if (a3 >= 0x7B)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7B)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
    {
      v3 = (-a2 >> 3) & 0xF | (16 * (-a2 & 0x7F));
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t type metadata accessor for LayoutItem(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LayoutItem);
}

double LayoutOptions.viewportSize.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

uint64_t sub_1BA172E6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = LayoutContentScale.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t LayoutContentScale.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1BA172EC8 + 4 * byte_1BA19DC80[*v0]))(0x616D536172747865, 0xEA00000000006C6CLL);
}

uint64_t sub_1BA172EC8()
{
  return 0x6C6C616D73;
}

uint64_t sub_1BA172EDC()
{
  return 0x6D756964656DLL;
}

uint64_t sub_1BA172EF0()
{
  return 0x72616C75676572;
}

uint64_t sub_1BA172F08()
{
  return 0x656772616CLL;
}

uint64_t sub_1BA172F1C()
{
  return 0x72614C6172747865;
}

uint64_t sub_1BA172F38()
{
  return 0x7478456172747865;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t ColumnSystem.Options.columns.getter()
{
  unsigned __int8 *v0;

  return 6 * *v0 + 6;
}

void sub_1BA172F7C(uint64_t a1)
{
  char *v1;

  sub_1BA16390C(a1, *v1);
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

_BYTE *sub_1BA172F90(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

uint64_t sub_1BA172F98(uint64_t result, int a2)
{
  char v2;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    v2 = 1;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
  }
  else
  {
    v2 = 0;
  }
  *(_BYTE *)(result + 33) = v2;
  return result;
}

ValueMetadata *type metadata accessor for Canvas()
{
  return &type metadata for Canvas;
}

ValueMetadata *type metadata accessor for Column()
{
  return &type metadata for Column;
}

ValueMetadata *type metadata accessor for SizerResultMetadataKey()
{
  return &type metadata for SizerResultMetadataKey;
}

double LayoutOptions.boundingSize.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

double LayoutOptions.origin.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 120);
}

id LayoutOptions.contentSizeCategory.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 144);
}

ValueMetadata *type metadata accessor for LayoutMarginAdjustment()
{
  return &type metadata for LayoutMarginAdjustment;
}

double LayoutOptions.layoutMargins.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 88);
}

uint64_t storeEnumTagSinglePayload for LayoutContentScale(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BA173078 + 4 * byte_1BA19DC8C[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_1BA1730AC + 4 * byte_1BA19DC87[v4]))();
}

uint64_t sub_1BA1730AC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA1730B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA1730BCLL);
  return result;
}

uint64_t sub_1BA1730C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA1730D0);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_1BA1730D4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA1730DC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t LayoutOptions.layoutDirection.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 136);
}

void ColumnSystem.Options.column.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t getEnumTagSinglePayload for DimensionSizerTrait(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

double LayoutOptions.safeAreaInsets.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 152);
}

uint64_t sub_1BA173128(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = *(_BYTE *)(result + 8) & 1 | (a2 << 6);
  return result;
}

uint64_t sub_1BA17313C(uint64_t result, int a2)
{
  char v2;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    v2 = 1;
  }
  else
  {
    v2 = 0;
  }
  *(_BYTE *)(result + 8) = v2;
  return result;
}

__C::CGRect __swiftcall CGRect.replacing(size:)(CGSize size)
{
  double v1;
  double v2;
  CGFloat height;
  CGFloat width;
  double v5;
  double v6;
  double v7;
  double v8;
  __C::CGRect result;

  height = size.height;
  width = size.width;
  v5 = v1;
  v6 = v2;
  v7 = width;
  v8 = height;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

uint64_t getEnumTagSinglePayload for LayoutContentScale(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFA)
  {
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
    v5 = (*a1 | (v4 << 8)) - 7;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v5 = v6 - 7;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

double UIEdgeInsets.replace(bottom:)(double a1, double a2)
{
  return a2;
}

void Column.layoutSize.getter(BOOL *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1 == 0;
}

uint64_t sub_1BA17322C(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t storeEnumTagSinglePayload for DimensionSizerTrait(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
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
  *(_BYTE *)(result + 9) = v3;
  return result;
}

double CGSize.replacing(height:)(double a1, double a2)
{
  return a2;
}

uint64_t getEnumTagSinglePayload for LayoutOptions(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 200))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 80);
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

double LayoutOptions.visibleViewportSize.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 32);
}

double LayoutOptions.windowSize.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 48);
}

_BYTE *sub_1BA1732C4(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void type metadata accessor for PositioningAdjustment()
{
  OUTLINED_FUNCTION_8_3();
}

uint64_t sub_1BA1732DC(uint64_t result, int a2)
{
  char v2;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    v2 = 1;
  }
  else
  {
    v2 = 0;
  }
  *(_BYTE *)(result + 32) = v2;
  return result;
}

void type metadata accessor for ColumnSystem()
{
  OUTLINED_FUNCTION_8_3();
}

ValueMetadata *type metadata accessor for AltText()
{
  return &type metadata for AltText;
}

__C::CGRect __swiftcall CGRect.replacing(origin:)(CGPoint origin)
{
  double v1;
  double v2;
  double v3;
  double v4;
  __C::CGRect result;

  v3 = v2;
  v4 = v1;
  result.origin.y = origin.y;
  result.origin.x = origin.x;
  result.size.height = v3;
  result.size.width = v4;
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

uint64_t Layout.DebugLayoutAttributes.layoutAttributes.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 24) - 8) + 16))(a2, v2);
}

void sub_1BA173354(char *a1)
{
  sub_1BA1632F8(*a1);
}

double EmbedFactoryCursor.boundingSize.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

uint64_t storeEnumTagSinglePayload for AltTextSized(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 96) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AltTextSized(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 96))
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

void type metadata accessor for PositioningAmount()
{
  OUTLINED_FUNCTION_8_3();
}

uint64_t type metadata accessor for LayoutItemList(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LayoutItemList);
}

double ColumnSystem.Options.vSpacing.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 32);
}

double ColumnSystem.Options.hSpacing.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

double ColumnSystem.Options.vSpacingUnscaled.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 40);
}

double ColumnSystem.Options.hSpacingUnscaled.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

double ColumnSystem.Options.columnWidth.getter()
{
  double *v0;
  double v1;

  v1 = dbl_1BA19CB08[*(char *)v0];
  return (v0[8] - v0[11] - v0[13] - v0[2] * (v1 + -1.0)) / v1;
}

ValueMetadata *type metadata accessor for AltTextLogic()
{
  return &type metadata for AltTextLogic;
}

void *__swift_memcpy200_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xC8uLL);
}

BOOL sub_1BA173490(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

void ColumnSystem.Options.traits.getter(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_2_7(a1);
}

BOOL sub_1BA1734B0(uint64_t *a1)
{
  uint64_t *v1;

  return sub_1BA173490(*a1, *v1);
}

void type metadata accessor for ColumnSystem.Options.Traits()
{
  OUTLINED_FUNCTION_8_3();
}

void static ColumnSystem.Options.Traits.condensed.getter(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_2_7(a1);
}

unint64_t *sub_1BA1734D0(unint64_t *result, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  if (a2 < 2)
  {
    v2 = *result & 0xFFFFFFFFFFFFFF8;
    v3 = a2 << 62;
  }
  else
  {
    v2 = 8 * (a2 - 2);
    v3 = 0x8000000000000000;
  }
  *result = v2 | v3;
  return result;
}

void PositioningAdjustment.init(integerLiteral:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  OUTLINED_FUNCTION_21_3(a2, (double)a1);
}

double static CGPoint.+ infix(_:_:)(double a1, double a2, double a3)
{
  return a1 + a3;
}

uint64_t sub_1BA173518()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1BA173524()
{
  return sub_1BA163264();
}

uint64_t sub_1BA173530()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t Layout.DebugLayoutAttributes.debugData.getter()
{
  return swift_retain();
}

uint64_t Column.count.getter()
{
  unsigned __int8 *v0;

  return 6 * *v0 + 6;
}

uint64_t sub_1BA173558()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1BA173560(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 104);
}

uint64_t sub_1BA173568(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 96);
}

uint64_t *sub_1BA173570(uint64_t *result, uint64_t a2)
{
  *result = *result & 0xFFFFFFFFFFFFFF8 | (a2 << 62);
  return result;
}

ValueMetadata *type metadata accessor for AltTextLogic.Operator()
{
  return &type metadata for AltTextLogic.Operator;
}

uint64_t dispatch thunk of LayoutAttributesType.frame.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_1BA1735A0()
{
  return sub_1BA163264();
}

uint64_t storeEnumTagSinglePayload for Column(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BA1735FC + 4 * byte_1BA19C0F5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1BA173630 + 4 * byte_1BA19C0F0[v4]))();
}

uint64_t sub_1BA173630(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA173638(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA173640);
  return result;
}

uint64_t sub_1BA17364C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA173654);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1BA173658(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA173660(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTagSinglePayload for Column(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFE)
  {
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
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

void *__swift_memcpy96_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x60uLL);
}

uint64_t sub_1BA173700()
{
  return 1;
}

BOOL CGFloat.isFlexible.getter(double a1)
{
  return a1 == 1.79769313e308;
}

ValueMetadata *type metadata accessor for Direction()
{
  return &type metadata for Direction;
}

double static CGPoint.- infix(_:_:)(double a1, double a2, double a3)
{
  return a1 - a3;
}

ValueMetadata *type metadata accessor for ResizeConstraint()
{
  return &type metadata for ResizeConstraint;
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

void sub_1BA173760()
{
  sub_1BA17378C(&qword_1ED5C9A70, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1BA19BBF8);
}

void sub_1BA17378C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x1BCCD6858](a3, v5), a1);
  }
  OUTLINED_FUNCTION_0_0();
}

void type metadata accessor for UIEdgeInsets(uint64_t a1)
{
  sub_1BA169D54(a1, &qword_1ED5C9FB0);
}

void UIEdgeInsets.replace(right:)()
{
  OUTLINED_FUNCTION_0_2();
}

double UIEdgeInsets.replace(left:)(double a1, double a2)
{
  return a2;
}

void sub_1BA173800()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5C9A40)
  {
    sub_1BA1739FC();
    v0 = sub_1BA19AD5C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5C9A40);
  }
}

void sub_1BA173858()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5C9A30)
  {
    v0 = sub_1BA19ACE4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5C9A30);
  }
}

void sub_1BA1738A0(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_1BA19ADEC();
    if (!v4)
      atomic_store(v3, a2);
  }
  OUTLINED_FUNCTION_0_0();
}

void sub_1BA1738E0()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1ED5C9A08)
  {
    sub_1BA1738A0(255, &qword_1ED5C9A18);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1ED5C9A08);
  }
}

void sub_1BA17395C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5C8790)
  {
    sub_1BA172BA8();
    v0 = sub_1BA19AB58();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5C8790);
  }
}

unint64_t sub_1BA1739C0()
{
  unint64_t result;

  result = qword_1ED5C9A00;
  if (!qword_1ED5C9A00)
  {
    result = MEMORY[0x1BCCD6858](MEMORY[0x1E0DEF078], MEMORY[0x1E0DEF040]);
    atomic_store(result, (unint64_t *)&qword_1ED5C9A00);
  }
  return result;
}

unint64_t sub_1BA1739FC()
{
  unint64_t result;

  result = qword_1ED5C99F8;
  if (!qword_1ED5C99F8)
  {
    result = MEMORY[0x1BCCD6858](MEMORY[0x1E0DEF068], MEMORY[0x1E0DEF040]);
    atomic_store(result, (unint64_t *)&qword_1ED5C99F8);
  }
  return result;
}

unint64_t sub_1BA173A38()
{
  unint64_t result;

  result = qword_1ED5C99F0;
  if (!qword_1ED5C99F0)
  {
    result = MEMORY[0x1BCCD6858](MEMORY[0x1E0DEF050], MEMORY[0x1E0DEF040]);
    atomic_store(result, (unint64_t *)&qword_1ED5C99F0);
  }
  return result;
}

unint64_t sub_1BA173A74(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_1BA1739C0();
  result = sub_1BA173A38();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1BA173AA0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1BA173AEC()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1BA173AF4()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Logging()
{
  return objc_opt_self();
}

uint64_t static Logging.debuggingEnabled.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  byte_1ED5C9B08 = a1;
  return result;
}

uint64_t sub_1BA173BA4()
{
  return swift_initClassMetadata2();
}

void type metadata accessor for Layout()
{
  JUMPOUT(0x1BCCD681CLL);
}

uint64_t sub_1BA173BF4()
{
  return swift_initClassMetadata2();
}

void sub_1BA173C54()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1ED5C94C0)
  {
    sub_1BA173800();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1ED5C94C0);
  }
}

void sub_1BA173CBC()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1ED5C8788)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1ED5C8788);
  }
}

unint64_t sub_1BA173D1C()
{
  unint64_t result;

  result = qword_1ED5C8780;
  if (!qword_1ED5C8780)
  {
    result = MEMORY[0x1BCCD6858](&protocol conformance descriptor for SizerResultMetadataKey, &type metadata for SizerResultMetadataKey);
    atomic_store(result, (unint64_t *)&qword_1ED5C8780);
  }
  return result;
}

unint64_t sub_1BA173D58()
{
  unint64_t result;

  result = qword_1ED5C9E60;
  if (!qword_1ED5C9E60)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED5C9E60);
  }
  return result;
}

unint64_t sub_1BA173DB0()
{
  unint64_t result;

  result = qword_1ED5C9F18[0];
  if (!qword_1ED5C9F18[0])
  {
    result = MEMORY[0x1BCCD6858](&protocol conformance descriptor for LayoutContentScale, &type metadata for LayoutContentScale);
    atomic_store(result, qword_1ED5C9F18);
  }
  return result;
}

uint64_t type metadata accessor for ColumnDebugView()
{
  return objc_opt_self();
}

void sub_1BA173E0C()
{
  word_1ED5C8FE0 = 257;
}

void sub_1BA173E20()
{
  word_1ED5C9B02 = 0;
}

uint64_t sub_1BA173E30()
{
  return swift_allocateGenericValueMetadata();
}

unint64_t sub_1BA173E40()
{
  unint64_t result;

  result = qword_1ED5C8C58[0];
  if (!qword_1ED5C8C58[0])
  {
    result = MEMORY[0x1BCCD6858](&protocol conformance descriptor for ColumnSystem.Options.Traits, &type metadata for ColumnSystem.Options.Traits);
    atomic_store(result, qword_1ED5C8C58);
  }
  return result;
}

unint64_t sub_1BA173E7C()
{
  unint64_t result;

  result = qword_1ED5C8C50;
  if (!qword_1ED5C8C50)
  {
    result = MEMORY[0x1BCCD6858](&protocol conformance descriptor for ColumnSystem.Options.Traits, &type metadata for ColumnSystem.Options.Traits);
    atomic_store(result, (unint64_t *)&qword_1ED5C8C50);
  }
  return result;
}

uint64_t type metadata accessor for Positioning.Anchor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Positioning.Anchor);
}

uint64_t sub_1BA173EC4()
{
  return swift_initClassMetadata2();
}

void BuilderType.hOverlay(name:reversed:size:positions:on:embedPath:block:)(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_21_1(a1, a2, a3, a4, a5, a6, a7, a8, a10, a9, v10, v11, v12, v13, 0);
}

void sub_1BA173F24()
{
  OUTLINED_FUNCTION_49();
}

unint64_t sub_1BA173F30()
{
  unint64_t result;

  result = qword_1ED5C88C0[0];
  if (!qword_1ED5C88C0[0])
  {
    result = MEMORY[0x1BCCD6858](&protocol conformance descriptor for SizerTrait, &type metadata for SizerTrait);
    atomic_store(result, qword_1ED5C88C0);
  }
  return result;
}

unint64_t sub_1BA173F6C()
{
  unint64_t result;

  result = qword_1ED5C88B8;
  if (!qword_1ED5C88B8)
  {
    result = MEMORY[0x1BCCD6858](&protocol conformance descriptor for SizerTrait, &type metadata for SizerTrait);
    atomic_store(result, (unint64_t *)&qword_1ED5C88B8);
  }
  return result;
}

BOOL static ColumnLayoutSize.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void ColumnLayoutSize.hash(into:)()
{
  sub_1BA19B110();
  OUTLINED_FUNCTION_0_0();
}

uint64_t ColumnLayoutSize.hashValue.getter()
{
  sub_1BA19B104();
  sub_1BA19B110();
  return sub_1BA19B128();
}

uint64_t sub_1BA174034()
{
  sub_1BA19B104();
  sub_1BA19B110();
  return sub_1BA19B128();
}

uint64_t ColumnLayoutSize.description.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x6C6C616D53;
  else
    return 0x656772614CLL;
}

unint64_t sub_1BA1740A4()
{
  unint64_t result;

  result = qword_1EF274318;
  if (!qword_1EF274318)
  {
    result = MEMORY[0x1BCCD6858](&protocol conformance descriptor for ColumnLayoutSize, &type metadata for ColumnLayoutSize);
    atomic_store(result, (unint64_t *)&qword_1EF274318);
  }
  return result;
}

uint64_t sub_1BA1740E0()
{
  return ColumnLayoutSize.description.getter();
}

uint64_t getEnumTagSinglePayload for ColumnLayoutSize(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ColumnLayoutSize(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BA1741CC + 4 * byte_1BA19B6D5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1BA174200 + 4 * byte_1BA19B6D0[v4]))();
}

uint64_t sub_1BA174200(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA174208(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA174210);
  return result;
}

uint64_t sub_1BA17421C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA174224);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1BA174228(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA174230(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for UIContentSizeCategory(uint64_t a1)
{
  sub_1BA169D54(a1, &qword_1EF274320);
}

void type metadata accessor for UIUserInterfaceLayoutDirection(uint64_t a1)
{
  sub_1BA169D54(a1, &qword_1EF274328);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_1BA169D54(a1, &qword_1EF274330);
}

uint64_t getEnumTagSinglePayload for RectDimension(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for RectDimension(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_1BA169D54(a1, &qword_1EF274338);
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

uint64_t sub_1BA1742EC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1BA17430C(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for UIUserInterfaceSizeClass(uint64_t a1)
{
  sub_1BA169D54(a1, &qword_1EF274340);
}

uint64_t sub_1BA17434C(uint64_t a1, id *a2)
{
  return sub_1BA1749C8(a1, a2);
}

uint64_t sub_1BA174360(uint64_t a1, id *a2)
{
  return sub_1BA174A2C(a1, a2) & 1;
}

uint64_t sub_1BA174378@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1BA17496C();
  *a1 = result;
  return result;
}

uint64_t sub_1BA17439C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_1BA174ACC(*a1, *v2);
  *a2 = result;
  return result;
}

void sub_1BA1743C8(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  *a2 = sub_1BA176278(*a1, *v2);
  OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1BA1743F0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_1BA1749B0(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_1BA17441C(_QWORD *a1, uint64_t *a2)
{
  return sub_1BA174974(a1, *a2);
}

uint64_t sub_1BA174424@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = sub_1BA174AD4(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_1BA174454@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = sub_1BA174B24(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_1BA174484(uint64_t *a1)
{
  return OUTLINED_FUNCTION_2_2(*a1);
}

uint64_t sub_1BA17448C(uint64_t *a1)
{
  return OUTLINED_FUNCTION_3_2(*a1);
}

uint64_t sub_1BA174494(uint64_t *a1)
{
  return sub_1BA1749A0(*a1);
}

uint64_t sub_1BA17449C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_1BA174B5C(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_1BA1744C8(uint64_t *a1)
{
  uint64_t *v1;

  return sub_1BA174960(*a1, *v1);
}

uint64_t sub_1BA1744D4()
{
  return sub_1BA174B64();
}

uint64_t sub_1BA1744E0()
{
  return sub_1BA19AD74();
}

uint64_t sub_1BA1744E8()
{
  return sub_1BA19AE4C();
}

uint64_t sub_1BA174500(uint64_t *a1)
{
  return sub_1BA1749B8(*a1);
}

_QWORD *sub_1BA174508@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

_QWORD *sub_1BA174514@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_1BA174524(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void sub_1BA174530()
{
  uint64_t *v0;

  sub_1BA174B6C(*v0, (void (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

void sub_1BA174550(_QWORD *a1@<X8>)
{
  uint64_t v2;

  sub_1BA174A9C();
  *a1 = v2;
}

void sub_1BA174574()
{
  uint64_t *v0;

  sub_1BA174B6C(*v0, MEMORY[0x1E0DEA950]);
}

uint64_t sub_1BA174594()
{
  return sub_1BA1748A8();
}

BOOL sub_1BA1745AC(uint64_t *a1, uint64_t *a2)
{
  return sub_1BA17626C(*a1, *a2);
}

uint64_t sub_1BA1745B8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = sub_1BA174B9C(a1);
  *a2 = result;
  return result;
}

void sub_1BA1745DC()
{
  sub_1BA17378C(&qword_1EF274348, (uint64_t (*)(uint64_t))type metadata accessor for UIRectCorner, (uint64_t)&unk_1BA19B868);
}

void sub_1BA174608()
{
  sub_1BA17378C(&qword_1EF274350, (uint64_t (*)(uint64_t))type metadata accessor for UIRectCorner, (uint64_t)&unk_1BA19B834);
}

void sub_1BA174634()
{
  sub_1BA17378C(&qword_1EF274358, (uint64_t (*)(uint64_t))type metadata accessor for UIRectCorner, (uint64_t)&unk_1BA19B894);
}

void sub_1BA174660()
{
  sub_1BA17378C(&qword_1EF274360, (uint64_t (*)(uint64_t))type metadata accessor for UIRectCorner, (uint64_t)&unk_1BA19B8D0);
}

uint64_t sub_1BA17468C()
{
  return sub_1BA1748E0() & 1;
}

uint64_t sub_1BA1746B0()
{
  sub_1BA17378C(&qword_1EF274380, (uint64_t (*)(uint64_t))type metadata accessor for UIContentSizeCategory, (uint64_t)&unk_1BA19BAA0);
  sub_1BA17378C(&qword_1EF274388, (uint64_t (*)(uint64_t))type metadata accessor for UIContentSizeCategory, (uint64_t)&unk_1BA19BA40);
  return sub_1BA19AFB4();
}

void sub_1BA174734()
{
  sub_1BA17378C(&qword_1EF274368, (uint64_t (*)(uint64_t))type metadata accessor for UIContentSizeCategory, (uint64_t)&unk_1BA19BA04);
}

void sub_1BA174760()
{
  sub_1BA17378C(&qword_1EF274370, (uint64_t (*)(uint64_t))type metadata accessor for UIContentSizeCategory, (uint64_t)&unk_1BA19B9D8);
}

uint64_t sub_1BA17478C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1BA19AB94();
  result = OUTLINED_FUNCTION_1();
  *a1 = v2;
  return result;
}

uint64_t sub_1BA1747CC@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_1BA1747F4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1BA1747F8()
{
  sub_1BA17378C((unint64_t *)&qword_1ED5C9A68, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1BA19BC70);
  sub_1BA17378C(&qword_1EF2743A0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1BA19BBC4);
  return sub_1BA19AFB4();
}

void sub_1BA17487C()
{
  sub_1BA17378C(&qword_1EF274378, (uint64_t (*)(uint64_t))type metadata accessor for UIContentSizeCategory, (uint64_t)&unk_1BA19BA74);
}

uint64_t sub_1BA1748A8()
{
  OUTLINED_FUNCTION_3_3();
  sub_1BA19ABC4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BA1748E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_1BA19ABB8();
  v2 = v1;
  if (v0 == sub_1BA19ABB8() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_1BA19B020();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1();
  return v5 & 1;
}

BOOL sub_1BA174960(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

uint64_t sub_1BA17496C()
{
  return 0;
}

BOOL sub_1BA174974(_QWORD *a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & a2;
  if (v3 != a2)
    *v2 |= a2;
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_1BA1749A0(uint64_t result)
{
  _QWORD *v1;

  *v1 ^= result;
  return result;
}

uint64_t sub_1BA1749B0(uint64_t a1, uint64_t a2)
{
  return a2 ^ a1;
}

uint64_t sub_1BA1749B8(uint64_t result)
{
  _QWORD *v1;

  *v1 &= ~result;
  return result;
}

uint64_t sub_1BA1749C8(uint64_t a1, id *a2)
{
  _QWORD *v2;
  uint64_t result;

  OUTLINED_FUNCTION_2_0(a1, a2);
  result = sub_1BA19ABA0();
  *v2 = 0;
  return result;
}

uint64_t sub_1BA174A2C(uint64_t a1, id *a2)
{
  _QWORD *v2;
  char v3;

  OUTLINED_FUNCTION_2_0(a1, a2);
  v3 = sub_1BA19ABAC();
  *v2 = 0;
  return v3 & 1;
}

void sub_1BA174A9C()
{
  sub_1BA19ABB8();
  sub_1BA19AB94();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1BA174ACC(uint64_t a1, uint64_t a2)
{
  return a2 | a1;
}

uint64_t sub_1BA174AD4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1;
  v4 = *v1 & a1;
  if ((sub_1BA19AD74() & 1) != 0)
    return 0;
  *v1 = v3 & ~a1;
  return v4;
}

uint64_t sub_1BA174B24(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = *v1 & a1;
  *v1 |= a1;
  if ((sub_1BA19AD74() & 1) != 0)
    return 0;
  else
    return v2;
}

uint64_t sub_1BA174B5C(uint64_t a1, uint64_t a2)
{
  return a2 & ~a1;
}

uint64_t sub_1BA174B64()
{
  return sub_1BA19AD74();
}

void sub_1BA174B6C(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3;

  v3 = sub_1BA19ABB8();
  a2(v3);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1BA174B9C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = 0;
    v3 = (uint64_t *)(a1 + 32);
    do
    {
      v5 = *v3++;
      v4 = v5;
      if ((v5 & ~v2) == 0)
        v4 = 0;
      v2 |= v4;
      --v1;
    }
    while (v1);
  }
  else
  {
    v2 = 0;
  }
  swift_bridgeObjectRelease();
  return v2;
}

void sub_1BA174BEC()
{
  sub_1BA17378C(&qword_1EF274390, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1BA19BB88);
}

void sub_1BA174C18()
{
  sub_1BA17378C(&qword_1EF274398, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1BA19BB5C);
}

void StackBuilder.layer(block:)()
{
  type metadata accessor for ListBuilder();
}

uint64_t sub_1BA174CBC()
{
  uint64_t v0;
  void (*v1)(void);
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v2 = sub_1BA16CEC0();
  v1();
  if (!v0)
  {
    type metadata accessor for StackLayer(0, v6, v5, v3);
    swift_beginAccess();
    sub_1BA165A60(*(_QWORD *)(v2 + 16));
    swift_bridgeObjectRetain();
    sub_1BA1894A8();
    swift_release();
  }
  return swift_release();
}

uint64_t StackBuilder.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t StackBuilder.__deallocating_deinit()
{
  StackBuilder.deinit();
  return swift_deallocClassInstance();
}

void type metadata accessor for StackBuilder()
{
  JUMPOUT(0x1BCCD681CLL);
}

uint64_t method lookup function for StackBuilder()
{
  return swift_lookUpClassMethod();
}

double LayoutOptions.screenNativeSize.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 64);
}

uint64_t LayoutOptions.layoutMarginAdjuster.getter()
{
  return swift_retain();
}

uint64_t LayoutOptions.init(boundingSize:viewportSize:visibleViewportSize:windowSize:screenNativeSize:traitCollection:layoutMargins:origin:layoutDirection:contentSizeCategory:safeAreaInsets:contentResizeScale:layoutMarginAdjuster:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>, double a7@<D0>, double a8@<D1>, double a9@<D2>, double a10@<D3>, double a11@<D4>, double a12@<D5>, double a13@<D6>, double a14@<D7>, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19, uint64_t a20,__int128 a21,uint64_t a22,uint64_t a23)
{
  char v23;

  v23 = *a4;
  *(double *)a6 = a7;
  *(double *)(a6 + 8) = a8;
  *(double *)(a6 + 16) = a9;
  *(double *)(a6 + 24) = a10;
  *(double *)(a6 + 32) = a11;
  *(double *)(a6 + 40) = a12;
  *(double *)(a6 + 48) = a13;
  *(double *)(a6 + 56) = a14;
  *(_QWORD *)(a6 + 64) = a15;
  *(_QWORD *)(a6 + 72) = a16;
  *(_QWORD *)(a6 + 80) = result;
  *(_OWORD *)(a6 + 88) = a17;
  *(_OWORD *)(a6 + 104) = a18;
  *(_QWORD *)(a6 + 120) = a19;
  *(_QWORD *)(a6 + 128) = a20;
  *(_QWORD *)(a6 + 136) = a2;
  *(_QWORD *)(a6 + 144) = a3;
  *(_OWORD *)(a6 + 152) = a21;
  *(_QWORD *)(a6 + 168) = a22;
  *(_QWORD *)(a6 + 176) = a23;
  *(_BYTE *)(a6 + 184) = v23;
  *(_QWORD *)(a6 + 192) = a5;
  return result;
}

id LayoutOptions.makeCopy(layoutDirection:origin:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  __int128 *v4;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
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
  _QWORD *v25;
  id v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  unint64_t v38;

  v34 = v4[1];
  v35 = *v4;
  v30 = v4[3];
  v32 = v4[2];
  v9 = *((_QWORD *)v4 + 8);
  v10 = *((_QWORD *)v4 + 9);
  v11 = (void *)*((_QWORD *)v4 + 10);
  v28 = *(__int128 *)((char *)v4 + 88);
  v12 = *((_QWORD *)v4 + 13);
  v13 = *((_QWORD *)v4 + 14);
  v14 = (void *)*((_QWORD *)v4 + 18);
  v36 = *(__int128 *)((char *)v4 + 152);
  v15 = *((_QWORD *)v4 + 21);
  v16 = *((_QWORD *)v4 + 22);
  v17 = *((_BYTE *)v4 + 184);
  v38 = 0xF000000000000007;
  v37 = v14;
  type metadata accessor for LayoutMarginAdjuster();
  OUTLINED_FUNCTION_1_0();
  v25 = OUTLINED_FUNCTION_0_1(&v38, v18, v19, v20, v21, v22, v23, v24, v28, *((uint64_t *)&v28 + 1), v30, *((uint64_t *)&v30 + 1), v32, *((uint64_t *)&v32 + 1), v34);
  *(_OWORD *)a2 = v35;
  *(_OWORD *)(a2 + 16) = v34;
  *(_OWORD *)(a2 + 32) = v33;
  *(_OWORD *)(a2 + 48) = v31;
  *(_QWORD *)(a2 + 64) = v9;
  *(_QWORD *)(a2 + 72) = v10;
  *(_QWORD *)(a2 + 80) = v11;
  *(_OWORD *)(a2 + 88) = v29;
  *(_QWORD *)(a2 + 104) = v12;
  *(_QWORD *)(a2 + 112) = v13;
  *(double *)(a2 + 120) = a3;
  *(double *)(a2 + 128) = a4;
  *(_QWORD *)(a2 + 136) = a1;
  *(_QWORD *)(a2 + 144) = v37;
  *(_OWORD *)(a2 + 152) = v36;
  *(_QWORD *)(a2 + 168) = v15;
  *(_QWORD *)(a2 + 176) = v16;
  *(_BYTE *)(a2 + 184) = v17;
  *(_QWORD *)(a2 + 192) = v25;
  v26 = v11;
  return v37;
}

uint64_t assignWithCopy for LayoutOptions(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  v4 = *(void **)(a2 + 80);
  v5 = *(void **)(a1 + 80);
  *(_QWORD *)(a1 + 80) = v4;
  v6 = v4;

  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  v7 = *(void **)(a2 + 144);
  v8 = *(void **)(a1 + 144);
  *(_QWORD *)(a1 + 144) = v7;
  v9 = v7;

  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_BYTE *)(a1 + 184) = *(_BYTE *)(a2 + 184);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for LayoutOptions(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  v6 = *(void **)(a1 + 80);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);

  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  v7 = *(_QWORD *)(a2 + 144);
  v8 = *(void **)(a1 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v7;

  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_BYTE *)(a1 + 184) = *(_BYTE *)(a2 + 184);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  swift_release();
  return a1;
}

uint64_t storeEnumTagSinglePayload for LayoutOptions(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 200) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 80) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 200) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t DimensionSizerTrait.hash(into:)()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 8) == 1)
    return sub_1BA19B110();
  sub_1BA19B110();
  return sub_1BA19B11C();
}

uint64_t static DimensionSizerTrait.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  double v2;
  double v3;
  unsigned int v4;
  BOOL v5;
  unsigned int v6;

  v2 = *(double *)a1;
  v3 = *(double *)a2;
  v4 = *(unsigned __int8 *)(a2 + 8);
  if (*(_BYTE *)(a1 + 8) != 1)
    return (v4 & 1) == 0 && v2 == v3;
  v5 = *(_QWORD *)&v3 == 0;
  if (v3 == 0.0)
    v6 = *(unsigned __int8 *)(a2 + 8);
  else
    v6 = 0;
  if (v5)
    v4 = 0;
  if (v2 == 0.0)
    return v6;
  else
    return v4;
}

uint64_t DimensionSizerTrait.hashValue.getter()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 8);
  sub_1BA19B104();
  sub_1BA19B110();
  if (v1 != 1)
    sub_1BA19B11C();
  return sub_1BA19B128();
}

uint64_t sub_1BA175290()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 8);
  sub_1BA19B104();
  sub_1BA19B110();
  if (v1 != 1)
    sub_1BA19B11C();
  return sub_1BA19B128();
}

unint64_t sub_1BA17530C()
{
  unint64_t result;

  result = qword_1EF2743A8;
  if (!qword_1EF2743A8)
  {
    result = MEMORY[0x1BCCD6858](&protocol conformance descriptor for DimensionSizerTrait, &type metadata for DimensionSizerTrait);
    atomic_store(result, (unint64_t *)&qword_1EF2743A8);
  }
  return result;
}

uint64_t sub_1BA17534C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

ValueMetadata *type metadata accessor for DimensionSizerTrait()
{
  return &type metadata for DimensionSizerTrait;
}

uint64_t dispatch thunk of DimensionSizerType.traits.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of DimensionSizerType.frameDimension<A>(cursor:template:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 16))();
}

uint64_t sub_1BA175398()
{
  return MEMORY[0x1E0DEE9E8];
}

uint64_t sub_1BA1753A8()
{
  return sub_1BA175398();
}

uint64_t sub_1BA1753B0()
{
  return sub_1BA175398();
}

uint64_t sub_1BA1753B8()
{
  return sub_1BA175398();
}

uint64_t Space.__allocating_init(_:)(_QWORD *a1)
{
  OUTLINED_FUNCTION_1_1();
  return Space.init(_:)(a1);
}

uint64_t Space.init(_:)(_QWORD *a1)
{
  _BYTE *v1;

  v1 = (_BYTE *)OUTLINED_FUNCTION_2_1(a1);
  return Node.init(kind:identifier:)(v1, 0, 0);
}

uint64_t sub_1BA175418(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t *v4;
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
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[3];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v8 = *v4;
  v34 = v4[5];
  v40 = v34;
  v9 = *(_QWORD *)(v8 + 136);
  v10 = *(_QWORD *)(v8 + 144);
  type metadata accessor for Sizing(0, v9, v10, (uint64_t)a4);
  sub_1BA16A170();
  v12 = v38;
  v11 = v39;
  __swift_project_boxed_opaque_existential_1(v37, v38);
  v13 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 8))(a1, a2, *a4, v9, v10, v12, v11);
  OUTLINED_FUNCTION_3_4(v13, v14, v15, v16, v17, v18, v19);
  if (!v35)
  {
    v36 = v13;
    v40 = v34;
    sub_1BA16A170();
    v20 = v38;
    v21 = v39;
    __swift_project_boxed_opaque_existential_1(v37, v38);
    v22 = (*(_QWORD *(**)(uint64_t *__return_ptr, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 16))(&v40, a1, a2, *a4, v9, v10, v20, v21);
    v30 = v40;
    OUTLINED_FUNCTION_3_4((uint64_t)v22, v23, v24, v25, v26, v27, v28);
    v37[0] = v30;
    SizerResult.isAmbiguous.getter();
    v12 = (uint64_t)v4;
    if ((v31 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      swift_release();
      swift_retain();
    }
    else
    {
      v37[0] = v30;
      v40 = v30;
      swift_retain();
      SizerResult.nonIntegral.getter();
      sub_1BA16996C();
      swift_release();
      OUTLINED_FUNCTION_0();
      sub_1BA169D98(v32, v33, 0, 0);
      LOBYTE(v37[0]) = 1;
      OUTLINED_FUNCTION_0();
      sub_1BA17FD24();
      OUTLINED_FUNCTION_0();
      sub_1BA17FE6C(v36);
      swift_bridgeObjectRelease();
      swift_release();
      return 0;
    }
  }
  return v12;
}

void Space.__allocating_init(kind:identifier:)()
{
  swift_initStackObject();
  Space.init(kind:identifier:)();
}

void Space.init(kind:identifier:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

unint64_t sub_1BA1756C8()
{
  uint64_t v0;

  return sub_1BA168614(*(_QWORD *)(v0 + 40));
}

uint64_t Space.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  sub_1BA19ABD0();
  v3 = type metadata accessor for Sizing(0, *(_QWORD *)(v1 + 136), *(_QWORD *)(v1 + 144), v2);
  MEMORY[0x1BCCD6858](&protocol conformance descriptor for Sizing<A>, v3);
  sub_1BA19AFFC();
  sub_1BA19ABD0();
  return 0;
}

uint64_t sub_1BA175770()
{
  return Space.description.getter();
}

uint64_t method lookup function for Space()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Space.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of Space.__allocating_init(sizing:name:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t sub_1BA1757AC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v20;
  unint64_t v21;
  uint64_t v23[3];
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;

  v7 = *a1;
  v20 = v4[2];
  v21 = v4[1];
  v26 = *v4;
  v8 = *(_QWORD *)(a4 + 16);
  v9 = *(_QWORD *)(a4 + 24);
  v10 = type metadata accessor for Conditional(0, v8, v9, a4);
  Conditional.condition.getter(v10, v23);
  v12 = v24;
  v11 = v25;
  __swift_project_boxed_opaque_existential_1(v23, v24);
  v13 = *(_QWORD *)(v7 + 80);
  v14 = *(_QWORD *)(v7 + 88);
  LOBYTE(v11) = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 8))(a1, a2, v13, v14, v12, v11);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  if ((v11 & 1) != 0)
    v15 = v21;
  else
    v15 = v20;
  v26 = v15;
  sub_1BA1683F8(v15);
  type metadata accessor for Sizing(0, v8, v9, v16);
  sub_1BA16A170();
  v17 = v24;
  v18 = v25;
  __swift_project_boxed_opaque_existential_1(v23, v24);
  (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 16))(a1, a2, a3, v13, v14, v17, v18);
  sub_1BA168614(v15);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
}

uint64_t sub_1BA1758FC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1BA1757AC(a1, a2, a3, a6);
}

uint64_t sub_1BA175914(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_1BA19AEA0();
  sub_1BA19ABD0();
  v3 = *(_QWORD *)(a1 + 16);
  v2 = *(_QWORD *)(a1 + 24);
  v5 = type metadata accessor for Conditional(0, v3, v2, v4);
  MEMORY[0x1BCCD6858](&protocol conformance descriptor for Conditional<A>, v5);
  sub_1BA19AFFC();
  OUTLINED_FUNCTION_1_2();
  v7 = type metadata accessor for Sizing(0, v3, v2, v6);
  MEMORY[0x1BCCD6858](&protocol conformance descriptor for Sizing<A>, v7);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  sub_1BA19ABD0();
  return 0;
}

unint64_t *sub_1BA175A3C(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *a2;
  sub_1BA171AC4(*a2);
  *a1 = v4;
  v5 = a2[1];
  sub_1BA1683F8(v5);
  a1[1] = v5;
  v6 = a2[2];
  sub_1BA1683F8(v6);
  a1[2] = v6;
  return a1;
}

unint64_t *sub_1BA175A98(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v4 = *a2;
  sub_1BA171AC4(*a2);
  v5 = *a1;
  *a1 = v4;
  sub_1BA171BFC(v5);
  v6 = a2[1];
  sub_1BA1683F8(v6);
  v7 = a1[1];
  a1[1] = v6;
  sub_1BA168614(v7);
  v8 = a2[2];
  sub_1BA1683F8(v8);
  v9 = a1[2];
  a1[2] = v8;
  sub_1BA168614(v9);
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

unint64_t *sub_1BA175B20(unint64_t *a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;

  sub_1BA171BFC(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_1BA168614(v4);
  v5 = a1[2];
  a1[2] = *(_QWORD *)(a2 + 16);
  sub_1BA168614(v5);
  return a1;
}

uint64_t sub_1BA175B6C(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0x7E && *(_BYTE *)(a1 + 24))
    {
      v2 = *(_DWORD *)a1 + 125;
    }
    else
    {
      v2 = (((*(_QWORD *)a1 >> 57) >> 5) | (4 * ((*(_QWORD *)a1 >> 57) & 0x18 | *(_QWORD *)a1 & 7))) ^ 0x7F;
      if (v2 >= 0x7D)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t sub_1BA175BC0(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x7D)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 126;
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
    {
      v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

id sub_1BA175C24(id result, id a2, uint64_t a3, char a4)
{
  switch(a4)
  {
    case 0:
    case 3:
    case 4:
    case 6:
      goto LABEL_2;
    case 1:
    case 2:
      result = result;
      break;
    case 5:
      swift_bridgeObjectRetain();
LABEL_2:
      result = (id)swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

void destroy for LayoutError(uint64_t a1)
{
  sub_1BA175C94(*(void **)a1, *(id *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
}

void sub_1BA175C94(void *a1, id a2, uint64_t a3, char a4)
{
  switch(a4)
  {
    case 0:
    case 3:
    case 4:
    case 6:
      goto LABEL_2;
    case 1:
    case 2:

      break;
    case 5:
      swift_bridgeObjectRelease();
LABEL_2:
      swift_bridgeObjectRelease();
      break;
    default:
      return;
  }
}

uint64_t initializeWithCopy for LayoutError(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_1BA175C24(*(id *)a2, v4, v5, v6);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for LayoutError(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_1BA175C24(*(id *)a2, v4, v5, v6);
  v7 = *(void **)a1;
  v8 = *(void **)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  v10 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v6;
  sub_1BA175C94(v7, v8, v9, v10);
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

uint64_t assignWithTake for LayoutError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_BYTE *)(a2 + 24);
  v5 = *(void **)a1;
  v7 = *(void **)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  v8 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v4;
  sub_1BA175C94(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for LayoutError(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xF9 && *(_BYTE *)(a1 + 25))
    {
      v2 = *(_DWORD *)a1 + 248;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 24);
      if (v3 <= 7)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LayoutError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF8)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 249;
    if (a3 >= 0xF9)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xF9)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = -(char)a2;
  }
  return result;
}

uint64_t sub_1BA175EA0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 6u)
    return *(unsigned __int8 *)(a1 + 24);
  else
    return (*(_DWORD *)a1 + 7);
}

uint64_t sub_1BA175EB8(uint64_t result, unsigned int a2)
{
  uint64_t v2;

  v2 = a2 - 7;
  if (a2 >= 7)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    LOBYTE(a2) = 7;
    *(_QWORD *)result = v2;
  }
  *(_BYTE *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for LayoutError()
{
  return &type metadata for LayoutError;
}

uint64_t sub_1BA175EE4()
{
  uint64_t v0;
  _QWORD *v1;

  v0 = sub_1BA19AAF8();
  __swift_allocate_value_buffer(v0, qword_1EF2743B0);
  v1 = (_QWORD *)__swift_project_value_buffer(v0, (uint64_t)qword_1EF2743B0);
  return sub_1BA175F2C(v1);
}

uint64_t sub_1BA175F2C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  sub_1BA181A6C();
  v3 = v2;
  v4 = *(_QWORD *)(v2 + 16);
  v5 = *(_QWORD *)(v2 + 24) >> 1;
  v6 = v4 + 1;
  if (v5 <= v4)
  {
    sub_1BA181A6C();
    v3 = v11;
    v5 = *(_QWORD *)(v11 + 24) >> 1;
  }
  *(_QWORD *)(v3 + 16) = v6;
  *(_QWORD *)(v3 + 8 * v4 + 32) = 0x4080F00000000000;
  v7 = v4 + 2;
  if ((uint64_t)v5 < (uint64_t)(v4 + 2))
  {
    sub_1BA181A6C();
    v3 = v12;
  }
  *(_QWORD *)(v3 + 16) = v7;
  *(_QWORD *)(v3 + 8 * v6 + 32) = 0x4085400000000000;
  if ((int64_t)(v4 + 3) > *(_QWORD *)(v3 + 24) >> 1)
  {
    sub_1BA181A6C();
    v3 = v13;
  }
  *(_QWORD *)(v3 + 16) = v4 + 3;
  *(_QWORD *)(v3 + 8 * v7 + 32) = 0x4090E00000000000;
  *a1 = v3;
  v8 = *MEMORY[0x1E0DBC448];
  v9 = sub_1BA19AAF8();
  return (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 104))(a1, v8, v9);
}

uint64_t static Gutters.columnSystem.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1EF2742F8 != -1)
    swift_once();
  v2 = sub_1BA19AAF8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EF2743B0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
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

__C::UIRectCorner __swiftcall UIRectCorner.flipRightToLeft(bounds:)(__C::CGRect bounds)
{
  char v1;
  __C::UIRectCorner v2;

  if ((v1 & 1) == 0)
  {
    if ((v1 & 2) != 0)
    {
      v2.rawValue = 1;
      if ((v1 & 4) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
    v2.rawValue = 0;
    if ((v1 & 4) != 0)
    {
LABEL_12:
      v2.rawValue |= 8;
      goto LABEL_13;
    }
LABEL_7:
    if ((v1 & 8) == 0)
      return v2;
    return (__C::UIRectCorner)(v2.rawValue | 4);
  }
  if ((v1 & 2) == 0)
  {
    v2.rawValue = 2;
    if ((v1 & 4) != 0)
      goto LABEL_12;
    goto LABEL_7;
  }
  v2.rawValue = 3;
  if ((v1 & 4) != 0)
    goto LABEL_12;
LABEL_13:
  if ((v1 & 8) != 0 && (v2.rawValue & 4) == 0)
    return (__C::UIRectCorner)(v2.rawValue | 4);
  return v2;
}

uint64_t sub_1BA17617C()
{
  sub_1BA162930(&qword_1EF274358, (uint64_t)&unk_1BA19B894);
  return sub_1BA19AC48();
}

uint64_t sub_1BA1761E8()
{
  sub_1BA162930(&qword_1EF274358, (uint64_t)&unk_1BA19B894);
  return sub_1BA19AC18();
}

__C::UIRectCorner sub_1BA176244@<X0>(__C::UIRectCorner *a1@<X8>, double a2@<D0>)
{
  __C::UIRectCorner result;

  result.rawValue = UIRectCorner.flipRightToLeft(bounds:)(*(__C::CGRect *)&a2).rawValue;
  a1->rawValue = result.rawValue;
  return result;
}

BOOL sub_1BA17626C(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_1BA176278(uint64_t a1, uint64_t a2)
{
  return a2 & a1;
}

uint64_t sub_1BA176280()
{
  return 1819044198;
}

ValueMetadata *type metadata accessor for FillDimensionSizer()
{
  return &type metadata for FillDimensionSizer;
}

uint64_t sub_1BA1762A0()
{
  return swift_deallocObject();
}

TeaTemplate::Column_optional __swiftcall Column.init(_:)(Swift::Int a1)
{
  char *v1;
  char v2;
  char v3;

  if (a1 == 18)
    v2 = 2;
  else
    v2 = 3;
  if (a1 == 12)
    v3 = 1;
  else
    v3 = v2;
  if (a1 == 6)
    v3 = 0;
  *v1 = v3;
  return (TeaTemplate::Column_optional)a1;
}

double Column.hSpacing(for:columnSystem:)(uint64_t a1, int8x16_t *a2)
{
  double result;
  int8x16_t v3;
  int8x8_t v4;

  result = 28.0;
  if (a2[2].i8[0] == 1)
  {
    v3 = vorrq_s8(*a2, a2[1]);
    v4 = vorr_s8(*(int8x8_t *)v3.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL));
    result = 10.0;
    if (!*(_QWORD *)&v4)
      return 28.0;
  }
  return result;
}

double Column.vSpacing(for:columnSystem:)(id a1, uint64_t a2, double result)
{
  _BYTE *v3;
  id v5;
  BOOL v6;

  if (*(_BYTE *)(a2 + 32) != 1
    || (result = 10.0, !(*(_QWORD *)(a2 + 16) | *(_QWORD *)(a2 + 24) | *(_QWORD *)a2 | *(_QWORD *)(a2 + 8))))
  {
    if (*v3)
    {
      if (*v3 == 1)
      {
        v5 = objc_msgSend(a1, sel_horizontalSizeClass, result);
        v6 = objc_msgSend(a1, sel_verticalSizeClass) == (id)1 && v5 == (id)1;
        result = 18.0;
        if (!v6)
          return 20.0;
      }
      else
      {
        return 30.0;
      }
    }
    else
    {
      return 18.0;
    }
  }
  return result;
}

uint64_t Column.traits(for:viewportWidth:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>)
{
  unsigned __int8 *v3;
  int v6;
  id v7;
  uint64_t result;
  BOOL v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;

  v6 = *v3;
  v7 = objc_msgSend(a1, sel_horizontalSizeClass);
  result = (uint64_t)OUTLINED_FUNCTION_4_0((uint64_t)v7, sel_verticalSizeClass);
  if (v7 == (id)1 && result == 1)
  {
    v13 = 1;
  }
  else
  {
    if (v6)
      v10 = 1;
    else
      v10 = a3 > 320.0;
    if (v10)
    {
      if ((unint64_t)v7 >= 3)
      {
        sub_1BA17672C();
        v11 = swift_allocObject();
        *(_OWORD *)(v11 + 16) = xmmword_1BA19C0E0;
        v12 = OUTLINED_FUNCTION_4_0(v11, sel_horizontalSizeClass);
        v14 = OUTLINED_FUNCTION_4_0((uint64_t)v12, sel_verticalSizeClass);
        sub_1BA1767D4();
        sub_1BA19AF3C();
        *(_QWORD *)(v11 + 56) = MEMORY[0x1E0DEA968];
        *(_QWORD *)(v11 + 64) = sub_1BA176834();
        *(_QWORD *)(v11 + 32) = 0;
        *(_QWORD *)(v11 + 40) = 0xE000000000000000;
        MEMORY[0x1BCCD5DB4]("Unknown size class in %{public}@", 32, 2, v11, v12, v14);
        result = swift_bridgeObjectRelease();
      }
      v13 = 0;
    }
    else
    {
      v13 = 2;
    }
  }
  *a2 = v13;
  return result;
}

double Column.designViewportWidth.getter()
{
  char *v0;

  return dbl_1BA19C290[*v0];
}

double Column.scaleFactor(forActualViewportWidth:)(double a1)
{
  char *v1;
  double v2;

  v2 = 1.0;
  if (a1 != 1.79769313e308)
    return a1 / dbl_1BA19C290[*v1];
  return v2;
}

uint64_t Column.maxWidth(for:)(void *a1)
{
  unsigned __int8 *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  double *v5;
  uint64_t result;
  double v7;

  v2 = *v1;
  v3 = static ColumnSystem.specs(for:)(a1);
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    v5 = (double *)(v3 + 48);
    while (*((unsigned __int8 *)v5 - 16) != v2)
    {
      v5 += 3;
      if (!--v4)
        goto LABEL_5;
    }
    v7 = *v5;
    swift_bridgeObjectRelease();
    *(double *)&result = v7 + -1.0;
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease();
    *(double *)&result = 0.0;
  }
  return result;
}

BOOL static Column.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t Column.hash(into:)()
{
  return OUTLINED_FUNCTION_1_3();
}

void *static Column.allCases.getter()
{
  return &unk_1E71E2938;
}

void Column.hashValue.getter()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_5_1();
  sub_1BA19B128();
  OUTLINED_FUNCTION_3();
}

void sub_1BA17662C(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E71E2938;
}

uint64_t Column.description.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 12849;
  if (*v0 != 1)
    v1 = 14385;
  if (*v0)
    return v1;
  else
    return 54;
}

BOOL static ColumnSpec.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ColumnSpec.hash(into:)()
{
  return OUTLINED_FUNCTION_1_3();
}

void ColumnSpec.hashValue.getter()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_5_1();
  sub_1BA19B128();
  OUTLINED_FUNCTION_3();
}

uint64_t ColumnSpec.description.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x676E696361705376;
  else
    return 0x676E696361705368;
}

uint64_t sub_1BA176708()
{
  return ColumnSpec.description.getter();
}

void sub_1BA176720(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void sub_1BA17672C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF2743C8)
  {
    sub_1BA176780();
    v0 = sub_1BA19AFE4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF2743C8);
  }
}

unint64_t sub_1BA176780()
{
  unint64_t result;

  result = qword_1EF2743D0;
  if (!qword_1EF2743D0)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF2743D0);
  }
  return result;
}

void sub_1BA1767D4()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1EF2743D8)
  {
    type metadata accessor for UIUserInterfaceSizeClass(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EF2743D8);
  }
}

unint64_t sub_1BA176834()
{
  unint64_t result;

  result = qword_1EF2743E0;
  if (!qword_1EF2743E0)
  {
    result = MEMORY[0x1BCCD6858](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EF2743E0);
  }
  return result;
}

unint64_t sub_1BA176874()
{
  unint64_t result;

  result = qword_1ED5C94C8[0];
  if (!qword_1ED5C94C8[0])
  {
    result = MEMORY[0x1BCCD6858](&protocol conformance descriptor for Column, &type metadata for Column);
    atomic_store(result, qword_1ED5C94C8);
  }
  return result;
}

unint64_t sub_1BA1768B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF2743E8;
  if (!qword_1EF2743E8)
  {
    sub_1BA1768F4();
    result = MEMORY[0x1BCCD6858](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1EF2743E8);
  }
  return result;
}

void sub_1BA1768F4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF2743F0)
  {
    v0 = sub_1BA19ACE4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF2743F0);
  }
}

unint64_t sub_1BA176940()
{
  unint64_t result;

  result = qword_1EF2743F8;
  if (!qword_1EF2743F8)
  {
    result = MEMORY[0x1BCCD6858](&protocol conformance descriptor for ColumnSpec, &type metadata for ColumnSpec);
    atomic_store(result, (unint64_t *)&qword_1EF2743F8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ColumnSpec(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BA1769C8 + 4 * byte_1BA19C0FF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1BA1769FC + 4 * byte_1BA19C0FA[v4]))();
}

uint64_t sub_1BA1769FC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA176A04(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA176A0CLL);
  return result;
}

uint64_t sub_1BA176A18(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA176A20);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1BA176A24(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA176A2C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA176A38(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(_QWORD *, uint64_t, uint64_t);
  _QWORD v12[5];

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 144);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](a2, a2);
  v7 = (char *)&v12[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAtKeyPath();
  v12[3] = v3;
  v12[4] = &protocol witness table for Node<A>;
  v12[0] = v2;
  v8 = *(_QWORD *)(v3 + 160);
  v9 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v8 + 8);
  swift_retain();
  v9(v12, v4, v8);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_1BA176AF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  CGFloat v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  void *v55;
  void *v56;
  Swift::String_optional v57;
  uint64_t v58;
  TeaTemplate::Direction v59;
  void (*v60)(uint64_t, double);
  double v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(_QWORD *, _QWORD *, uint64_t, uint64_t, uint64_t);
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(uint64_t, uint64_t);
  uint64_t v70;
  uint64_t v71;
  void (*v72)(_QWORD *, _QWORD *, uint64_t, uint64_t, uint64_t);
  uint64_t v73;
  uint64_t v74;
  void (*v75)(uint64_t, uint64_t);
  uint64_t v76;
  _QWORD *v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD v90[4];
  _QWORD v91[3];
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  Swift::OpaquePointer_optional v95;
  __C::CGRect v96;
  __C::CGRect v97;
  __C::CGRect v98;

  v82 = a3;
  v10 = *v3;
  v78 = *(_QWORD *)(*v3 + 144);
  v80 = *(_QWORD *)(v78 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  v79 = (char *)&v76 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = v12;
  v13 = v3[8];
  v81 = v3[7];
  v84 = v13;
  sub_1BA16AF64();
  v88 = v14;
  v86 = v3[6];
  v90[0] = v86;
  v15 = *(_QWORD *)(v10 + 136);
  v16 = *(_QWORD *)(v10 + 152);
  v85 = type metadata accessor for Sizing(0, v15, v16, v17);
  sub_1BA16A170();
  v18 = v92;
  v19 = v93;
  __swift_project_boxed_opaque_existential_1(v91, v92);
  v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 8);
  v87 = a1;
  v21 = a1;
  v22 = a2;
  v23 = a2;
  v25 = v88;
  v24 = v89;
  v26 = v20(v21, v23, v88, v15, v16, v18, v19);
  if (v24)
  {
    swift_release();
    return OUTLINED_FUNCTION_5_2();
  }
  else
  {
    v89 = v26;
    v76 = v10;
    v77 = v3;
    OUTLINED_FUNCTION_5_2();
    v90[0] = v86;
    sub_1BA16A170();
    v27 = v25;
    v28 = v92;
    v29 = v93;
    __swift_project_boxed_opaque_existential_1(v91, v92);
    (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 16))(v90, v87, v22, v27, v15, v16, v28, v29);
    v31 = v87;
    v32 = v90[0];
    OUTLINED_FUNCTION_5_2();
    v91[0] = v32;
    SizerResult.isAmbiguous.getter();
    if ((v33 & 1) != 0)
    {
      OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_10();
      swift_release();
      return swift_retain();
    }
    else
    {
      v91[0] = v32;
      v90[0] = v32;
      v94 = v32;
      OUTLINED_FUNCTION_4_1();
      SizerResult.nonIntegral.getter();
      sub_1BA16996C();
      OUTLINED_FUNCTION_9_0();
      OUTLINED_FUNCTION_3_5();
      v96.origin.x = v4;
      v96.origin.y = v5;
      v96.size.width = v6;
      v96.size.height = v7;
      SizerResult.postProcess(frame:nonIntegral:)(v96, 0);
      if (v34)
        goto LABEL_8;
      OUTLINED_FUNCTION_9_0();
      v91[0] = v32;
      v90[0] = v32;
      v94 = v32;
      OUTLINED_FUNCTION_4_1();
      SizerResult.nonIntegral.getter();
      sub_1BA16AA5C();
      v36 = v35;
      v38 = v37;
      v40 = v39;
      v42 = v41;
      OUTLINED_FUNCTION_3_5();
      v97.origin.x = v36;
      v97.origin.y = v38;
      v97.size.width = v40;
      v97.size.height = v42;
      SizerResult.postProcess(frame:nonIntegral:)(v97, 0);
      if (v43)
      {
LABEL_8:
        OUTLINED_FUNCTION_3_5();
        OUTLINED_FUNCTION_10();
        return OUTLINED_FUNCTION_2();
      }
      else
      {
        v85 = v32 & 0xFFFFFFFFFFFFFFFLL;
        sub_1BA182DA0();
        v45 = v44;
        v47 = v46;
        v49 = v48;
        v51 = v50;
        v52 = (uint64_t)v77;
        v53 = v81;
        v54 = v84;
        sub_1BA169D98((uint64_t)v77, v82, v81, v84);
        v86 = *v83;
        LOBYTE(v90[0]) = *(_BYTE *)(v31 + 48);
        v91[0] = v32;
        SizerResult.metadata.getter();
        v56 = v55;
        v98.origin.x = OUTLINED_FUNCTION_6_0();
        v95.value._rawValue = v56;
        v95.is_nil = v53;
        v98.size.height = v51;
        v57.value._countAndFlagsBits = v54;
        v58 = v86;
        LayoutContext.set(frame:direction:metadata:for:)(v98, v59, v95, v57);
        swift_bridgeObjectRelease();
        LOBYTE(v91[0]) = 0;
        OUTLINED_FUNCTION_6_0();
        sub_1BA17FD24();
        sub_1BA17FE6C(v89);
        swift_bridgeObjectRelease();
        v60 = *(void (**)(uint64_t, double))(v52 + 72);
        if (v60)
        {
          swift_retain();
          v61 = OUTLINED_FUNCTION_6_0();
          v60(v58, v61);
          OUTLINED_FUNCTION_0_5();
          OUTLINED_FUNCTION_11_0();
          v71 = *(_QWORD *)(v70 + 160);
          v72 = *(void (**)(_QWORD *, _QWORD *, uint64_t, uint64_t, uint64_t))(v71 + 16);
          OUTLINED_FUNCTION_4_1();
          v73 = v78;
          v72(v90, v91, MEMORY[0x1E0DEE9B8] + 8, v78, v71);
          OUTLINED_FUNCTION_3_5();
          OUTLINED_FUNCTION_7_1();
          OUTLINED_FUNCTION_1_4();
          v74 = OUTLINED_FUNCTION_8_0();
          v75(v74, v73);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v90);
        }
        else
        {
          OUTLINED_FUNCTION_0_5();
          v90[0] = v45;
          v90[1] = v47;
          v90[2] = v49;
          *(CGFloat *)&v90[3] = v51;
          OUTLINED_FUNCTION_11_0();
          v63 = *(_QWORD *)(v62 + 160);
          v64 = *(void (**)(_QWORD *, _QWORD *, uint64_t, uint64_t, uint64_t))(v63 + 16);
          type metadata accessor for CGRect(0);
          v66 = v65;
          OUTLINED_FUNCTION_4_1();
          v67 = v78;
          v64(v90, v91, v66, v78, v63);
          OUTLINED_FUNCTION_1_4();
          OUTLINED_FUNCTION_2();
          v68 = OUTLINED_FUNCTION_8_0();
          v69(v68, v67);
        }
        OUTLINED_FUNCTION_5_2();
        return 0;
      }
    }
  }
}

void Frame.__allocating_init(kind:identifier:)()
{
  swift_initStackObject();
  Frame.init(kind:identifier:)();
}

void Frame.init(kind:identifier:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1BA17706C()
{
  uint64_t v0;

  swift_release();
  sub_1BA177098(*(_QWORD *)(v0 + 48));
  swift_bridgeObjectRelease();
  return sub_1BA162F64(*(_QWORD *)(v0 + 72));
}

unint64_t sub_1BA177098(unint64_t result)
{
  switch((result >> 59) & 0x1E | (result >> 2) & 1)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
      result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t Frame.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  sub_1BA19ABD0();
  v3 = type metadata accessor for Sizing(0, *(_QWORD *)(v1 + 136), *(_QWORD *)(v1 + 152), v2);
  MEMORY[0x1BCCD6858](&protocol conformance descriptor for Sizing<A>, v3);
  sub_1BA19AFFC();
  sub_1BA19ABD0();
  return 0;
}

uint64_t sub_1BA177178()
{
  return Frame.description.getter();
}

uint64_t method lookup function for Frame()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Frame.__allocating_init(name:_:_:mapBlock:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

void SizerTrait.hash(into:)()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 16) == 1)
  {
    sub_1BA19B110();
    OUTLINED_FUNCTION_3_6();
  }
  else
  {
    sub_1BA19B110();
    sub_1BA1773D8();
  }
}

BOOL static SizerTrait.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  double v2;
  double v3;
  double v4;
  _BOOL8 result;

  v2 = *(double *)a1;
  v3 = *(double *)(a1 + 8);
  v4 = *(double *)a2;
  if (*(_BYTE *)(a1 + 16) == 1)
  {
    if (!(*(_QWORD *)&v2 | *(_QWORD *)&v3))
    {
      if (*(_BYTE *)(a2 + 16))
      {
LABEL_12:
        if (!(*(_QWORD *)&v4 | *(_QWORD *)(a2 + 8)))
          return 1;
      }
      return 0;
    }
    if (!(*(_QWORD *)&v2 ^ 1 | *(_QWORD *)&v3))
    {
      if (*(_BYTE *)(a2 + 16))
      {
        *(_QWORD *)&v4 ^= 1uLL;
        goto LABEL_12;
      }
      return 0;
    }
    if (!*(_BYTE *)(a2 + 16))
      return 0;
    result = 1;
    if (*(_QWORD *)&v4 <= 1uLL)
      return 0;
  }
  else
  {
    if ((*(_BYTE *)(a2 + 16) & 1) != 0)
      return 0;
    return v3 == *(double *)(a2 + 8) && v2 == v4;
  }
  return result;
}

void SizerTrait.hashValue.getter()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 16);
  sub_1BA19B104();
  if (v1 == 1)
  {
    sub_1BA19B110();
  }
  else
  {
    OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_2_3();
  }
  sub_1BA19B128();
  OUTLINED_FUNCTION_1_5();
}

void sub_1BA177354()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 16);
  sub_1BA19B104();
  if (v1 == 1)
  {
    sub_1BA19B110();
  }
  else
  {
    OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_2_3();
  }
  sub_1BA19B128();
  OUTLINED_FUNCTION_1_5();
}

void sub_1BA1773D8()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_3_6();
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for SizerTrait(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SizerTrait(uint64_t result, int a2, int a3)
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

uint64_t sub_1BA17746C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1BA177488(uint64_t result, int a2)
{
  char v2;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    v2 = 1;
  }
  else
  {
    v2 = 0;
  }
  *(_BYTE *)(result + 16) = v2;
  return result;
}

ValueMetadata *type metadata accessor for SizerTrait()
{
  return &type metadata for SizerTrait;
}

uint64_t dispatch thunk of SizerType.traits<A>(cursor:template:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 8))();
}

uint64_t dispatch thunk of SizerType.frame<A>(cursor:template:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 16))();
}

void sub_1BA1774E8(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v2 = swift_allocObject();
  *(double *)(v2 + 16) = Cursor.remainingBounds.getter();
  *(_QWORD *)(v2 + 24) = v3;
  *(_QWORD *)(v2 + 32) = v4;
  *(_QWORD *)(v2 + 40) = v5;
  if (qword_1ED5C9B10 != -1)
    swift_once();
  v6 = HIBYTE(word_1ED5C9B02);
  *(_BYTE *)(v2 + 48) = word_1ED5C9B02;
  *(_BYTE *)(v2 + 49) = v6;
  *a1 = v2;
}

void sub_1BA177580(uint64_t *a1@<X8>)
{
  sub_1BA1774E8(a1);
}

uint64_t sub_1BA177594()
{
  return 0x69466F54657A6973;
}

ValueMetadata *type metadata accessor for SizeToFitSizer()
{
  return &type metadata for SizeToFitSizer;
}

uint64_t sub_1BA1775C0()
{
  return swift_deallocObject();
}

uint64_t assignWithCopy for MinRatioSizer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  v4 = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v4;
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for MinRatioSizer(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for MinRatioSizer(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 49))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for MinRatioSizer(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 49) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MinRatioSizer()
{
  return &type metadata for MinRatioSizer;
}

uint64_t sub_1BA177870(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = *a1;
  v8 = v3[3];
  v9 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v8);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v9 + 8))(a1, a2, a3, *(_QWORD *)(v7 + 80), *(_QWORD *)(v7 + 88), v8, v9);
}

_QWORD *sub_1BA1778EC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *result;
  uint64_t v15;
  double v16;
  unsigned int v17;
  double v18;
  char v19;
  char v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double Height;
  double Width;
  char v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  double v55;
  double v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
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
  _QWORD v80[3];
  uint64_t v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;

  v6 = v4;
  v11 = *a1;
  v12 = *(_QWORD *)(v6 + 24);
  v13 = *(_QWORD *)(v6 + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)v6, v12);
  result = (*(_QWORD *(**)(_QWORD *__return_ptr, uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v13 + 16))(v80, a1, a2, a3, *(_QWORD *)(v11 + 80), *(_QWORD *)(v11 + 88), v12, v13);
  if (v5)
    return result;
  v15 = v80[0];
  v16 = *(double *)(v6 + 40);
  v17 = *(unsigned __int8 *)(v6 + 48);
  if (v17 >> 6)
  {
    if (v17 >> 6 == 1)
    {
      v81 = v80[0];
      OUTLINED_FUNCTION_4_3();
      OUTLINED_FUNCTION_7_2();
      OUTLINED_FUNCTION_1_6();
      OUTLINED_FUNCTION_0_7();
      v18 = OUTLINED_FUNCTION_6_1() * v16;
      OUTLINED_FUNCTION_2_4();
      OUTLINED_FUNCTION_7_2();
      OUTLINED_FUNCTION_1_6();
      OUTLINED_FUNCTION_0_7();
      OUTLINED_FUNCTION_8_1();
      OUTLINED_FUNCTION_11();
      if (v19 != v20)
      {
        OUTLINED_FUNCTION_2_4();
        OUTLINED_FUNCTION_7_2();
        OUTLINED_FUNCTION_1_6();
        OUTLINED_FUNCTION_0_7();
        v21 = OUTLINED_FUNCTION_8_1();
        if (v21 > v18)
          v18 = v21;
      }
      OUTLINED_FUNCTION_5_3();
      v22 = a1[61];
      v23 = a1[62];
      v81 = v15;
      OUTLINED_FUNCTION_4_3();
      OUTLINED_FUNCTION_12_0();
      OUTLINED_FUNCTION_10_0();
      v25 = v24;
      OUTLINED_FUNCTION_3_7();
      v26 = OUTLINED_FUNCTION_9();
      *(_QWORD *)(v26 + 16) = v22;
      *(_QWORD *)(v26 + 24) = v23;
      *(_QWORD *)(v26 + 32) = v25;
      *(double *)(v26 + 40) = v18;
      goto LABEL_38;
    }
    v81 = v80[0];
    OUTLINED_FUNCTION_4_3();
    OUTLINED_FUNCTION_7_2();
    OUTLINED_FUNCTION_1_6();
    OUTLINED_FUNCTION_0_7();
    OUTLINED_FUNCTION_6_1();
    Height = 0.0;
    OUTLINED_FUNCTION_11();
    Width = 0.0;
    if (!v36)
    {
      OUTLINED_FUNCTION_2_4();
      OUTLINED_FUNCTION_7_2();
      OUTLINED_FUNCTION_1_6();
      v38 = v37;
      v40 = v39;
      v42 = v41;
      v44 = v43;
      OUTLINED_FUNCTION_3_7();
      v82.origin.x = v38;
      v82.origin.y = v40;
      v82.size.width = v42;
      v82.size.height = v44;
      Width = CGRectGetWidth(v82);
    }
    OUTLINED_FUNCTION_2_4();
    OUTLINED_FUNCTION_7_2();
    OUTLINED_FUNCTION_1_6();
    v46 = v45;
    v48 = v47;
    v50 = v49;
    v52 = v51;
    OUTLINED_FUNCTION_3_7();
    v83.origin.x = v46;
    v83.origin.y = v48;
    v83.size.width = v50;
    v83.size.height = v52;
    CGRectGetHeight(v83);
    OUTLINED_FUNCTION_11();
    if (v36)
    {
      if ((v17 & 1) != 0)
        goto LABEL_43;
    }
    else
    {
      OUTLINED_FUNCTION_2_4();
      OUTLINED_FUNCTION_7_2();
      OUTLINED_FUNCTION_1_6();
      v69 = v68;
      v71 = v70;
      v73 = v72;
      v75 = v74;
      OUTLINED_FUNCTION_3_7();
      v76 = v69;
      v77 = v71;
      v78 = v73;
      v79 = v75;
      Height = CGRectGetHeight(*(CGRect *)&v76);
      if ((v17 & 1) != 0)
LABEL_43:
        __asm { BR              X9 }
    }
    v53 = Height * v16;
    if (Height <= Width && v53 <= Width)
    {
      if (Height <= Width / v16)
        Height = Width / v16;
      v85.origin.x = Cursor.remainingBounds.getter();
      v61 = CGRectGetHeight(v85);
      if (Height >= v61)
        v62 = v61;
      else
        v62 = Height;
      OUTLINED_FUNCTION_5_3();
      v63 = a1[61];
      v64 = a1[62];
      v81 = v15;
      OUTLINED_FUNCTION_4_3();
      OUTLINED_FUNCTION_12_0();
      OUTLINED_FUNCTION_10_0();
      v66 = v65;
      OUTLINED_FUNCTION_3_7();
      v26 = OUTLINED_FUNCTION_9();
      *(_QWORD *)(v26 + 16) = v63;
      *(_QWORD *)(v26 + 24) = v64;
      *(_QWORD *)(v26 + 32) = v66;
      *(double *)(v26 + 40) = v62;
      goto LABEL_38;
    }
    if (Width > v53)
      v55 = Width;
    else
      v55 = Height * v16;
    v84.origin.x = Cursor.remainingBounds.getter();
    v56 = CGRectGetWidth(v84);
    if (v55 >= v56)
      v57 = v56;
    else
      v57 = v55;
    OUTLINED_FUNCTION_5_3();
    v58 = a1[61];
    v59 = a1[62];
    v81 = v15;
    OUTLINED_FUNCTION_4_3();
    OUTLINED_FUNCTION_12_0();
    OUTLINED_FUNCTION_10_0();
    v32 = v60;
    OUTLINED_FUNCTION_3_7();
    v33 = OUTLINED_FUNCTION_9();
    v26 = v33;
    *(_QWORD *)(v33 + 16) = v58;
    *(_QWORD *)(v33 + 24) = v59;
    *(double *)(v33 + 32) = v57;
  }
  else
  {
    v81 = v80[0];
    OUTLINED_FUNCTION_4_3();
    OUTLINED_FUNCTION_7_2();
    OUTLINED_FUNCTION_1_6();
    OUTLINED_FUNCTION_0_7();
    v27 = OUTLINED_FUNCTION_8_1() * v16;
    OUTLINED_FUNCTION_2_4();
    OUTLINED_FUNCTION_7_2();
    OUTLINED_FUNCTION_1_6();
    OUTLINED_FUNCTION_0_7();
    OUTLINED_FUNCTION_6_1();
    OUTLINED_FUNCTION_11();
    if (v19 != v20)
    {
      OUTLINED_FUNCTION_2_4();
      OUTLINED_FUNCTION_7_2();
      OUTLINED_FUNCTION_1_6();
      OUTLINED_FUNCTION_0_7();
      v28 = OUTLINED_FUNCTION_6_1();
      if (v28 > v27)
        v27 = v28;
    }
    OUTLINED_FUNCTION_5_3();
    v29 = a1[61];
    v30 = a1[62];
    v81 = v15;
    OUTLINED_FUNCTION_4_3();
    OUTLINED_FUNCTION_12_0();
    OUTLINED_FUNCTION_10_0();
    v32 = v31;
    OUTLINED_FUNCTION_3_7();
    v33 = OUTLINED_FUNCTION_9();
    v26 = v33;
    *(_QWORD *)(v33 + 16) = v29;
    *(_QWORD *)(v33 + 24) = v30;
    *(double *)(v33 + 32) = v27;
  }
  *(_QWORD *)(v33 + 40) = v32;
LABEL_38:
  if (qword_1ED5C9B18 != -1)
    swift_once();
  v67 = HIBYTE(word_1ED5C8FE0);
  *(_BYTE *)(v26 + 48) = word_1ED5C8FE0;
  *(_BYTE *)(v26 + 49) = v67;
  result = (_QWORD *)OUTLINED_FUNCTION_3_7();
  *a4 = v26;
  return result;
}

uint64_t sub_1BA177D50(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_1BA177870(a1, a2, a3);
}

_QWORD *sub_1BA177D64@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BA1778EC(a1, a2, a3, a4);
}

uint64_t sub_1BA177D78()
{
  sub_1BA19ABD0();
  sub_1BA19AF3C();
  sub_1BA19ABD0();
  return 0;
}

uint64_t sub_1BA177E10()
{
  return swift_deallocObject();
}

uint64_t ColumnSize.init(integerLiteral:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_1BA177E28@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return ColumnSize.init(integerLiteral:)(*a1, a2);
}

void DimensionSizing.description.getter()
{
  __asm { BR              X11 }
}

uint64_t sub_1BA177E68()
{
  sub_1BA19ACF0();
  OUTLINED_FUNCTION_1_7();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_8();
  return 0x286465786966;
}

void sub_1BA1780C0()
{
  JUMPOUT(0x1BA1780A0);
}

unint64_t sub_1BA178140()
{
  unint64_t result;

  result = qword_1ED5C9128;
  if (!qword_1ED5C9128)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED5C9128);
  }
  return result;
}

unint64_t sub_1BA178198(unint64_t result)
{
  switch(result >> 61)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      result = swift_retain();
      break;
    default:
      return result;
  }
  return result;
}

double DimensionSizing.init(floatLiteral:)@<D0>(uint64_t *a1@<X8>, float a2@<S0>)
{
  uint64_t v4;
  double result;

  v4 = OUTLINED_FUNCTION_2_5();
  result = a2;
  *(double *)(v4 + 16) = a2;
  *a1 = v4;
  return result;
}

uint64_t sub_1BA178208()
{
  return swift_deallocObject();
}

double sub_1BA178218@<D0>(float *a1@<X0>, uint64_t *a2@<X8>)
{
  return DimensionSizing.init(floatLiteral:)(a2, *a1);
}

double DimensionSizing.init(integerLiteral:)@<D0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  double result;

  v4 = OUTLINED_FUNCTION_2_5();
  result = (double)a1;
  *(double *)(v4 + 16) = (double)a1;
  *a2 = v4;
  return result;
}

uint64_t sub_1BA178258()
{
  return MEMORY[0x1E0DEB488];
}

uint64_t sub_1BA178264()
{
  return MEMORY[0x1E0DEB1E0];
}

double sub_1BA178270@<D0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return DimensionSizing.init(integerLiteral:)(*a1, a2);
}

unint64_t *initializeBufferWithCopyOfBuffer for DimensionSizing(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a2;
  sub_1BA178198(*a2);
  *a1 = v3;
  return a1;
}

unint64_t *assignWithCopy for DimensionSizing(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a2;
  sub_1BA178198(*a2);
  v4 = *a1;
  *a1 = v3;
  sub_1BA172D3C(v4);
  return a1;
}

unint64_t *assignWithTake for DimensionSizing(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a1;
  *a1 = *a2;
  sub_1BA172D3C(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for DimensionSizing(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0x7A && *(_BYTE *)(a1 + 8))
    {
      v2 = *(_DWORD *)a1 + 121;
    }
    else
    {
      v2 = (((*(_QWORD *)a1 >> 57) >> 4) | (8 * ((*(_QWORD *)a1 >> 57) & 8 | *(_QWORD *)a1 & 7))) ^ 0x7F;
      if (v2 >= 0x79)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for DimensionSizing(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x79)
  {
    *(_QWORD *)result = a2 - 122;
    if (a3 >= 0x7A)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7A)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
    {
      v3 = (-a2 >> 3) & 0xF | (16 * (-a2 & 0x7F));
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_1BA1783B4(_QWORD *a1)
{
  uint64_t v1;

  v1 = *a1 >> 61;
  if (v1 <= 5)
    return v1;
  else
    return (*a1 >> 3) + 6;
}

_QWORD *sub_1BA1783D0(_QWORD *result)
{
  *result &= 0x1FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t getEnumTagSinglePayload for ColumnSize(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ColumnSize(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
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
  *(_BYTE *)(result + 8) = v3;
  return result;
}

uint64_t sub_1BA178428()
{
  return 0;
}

uint64_t sub_1BA178430()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_1BA178458@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  double v8;
  uint64_t v9;
  char v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  char v22;

  v3 = *(unsigned __int8 *)(a1 + 328);
  if (v3 == 3)
  {
    sub_1BA1787C0();
    swift_allocError();
    *(_QWORD *)(v4 + 8) = 0;
    *(_QWORD *)(v4 + 16) = 0;
    *(_QWORD *)v4 = 0;
    *(_BYTE *)(v4 + 24) = 7;
    return swift_willThrow();
  }
  v9 = *(_QWORD *)v2;
  v8 = *(double *)(v2 + 8);
  v10 = *(_BYTE *)(v2 + 16);
  v11 = *(double *)(a1 + 432);
  v12 = *(double *)(a1 + 416);
  v13 = *(double *)(a1 + 392);
  v14 = *(double *)(a1 + 344);
  swift_beginAccess();
  v15 = *(_QWORD *)(a1 + 488);
  v16 = *(_QWORD *)(a1 + 496);
  v17 = a1;
  Cursor.remainingBounds.getter();
  if (__OFSUB__(v9, 1))
  {
    __break(1u);
  }
  else
  {
    v19 = v18;
    if ((v10 & 1) != 0)
      v20 = dbl_1BA19C670[*(_QWORD *)&v8];
    else
      v20 = v8;
    v21 = (v14 * (double)(v9 - 1)
         + (v13 - v12 - v11 - v14 * (dbl_1BA19C658[(char)v3] + -1.0)) / dbl_1BA19C658[(char)v3] * (double)v9)
        / v20;
    result = swift_allocObject();
    v17 = result;
    *(_QWORD *)(result + 16) = v15;
    *(_QWORD *)(result + 24) = v16;
    *(_QWORD *)(result + 32) = v19;
    *(double *)(result + 40) = v21;
    if (qword_1ED5C9B18 == -1)
      goto LABEL_8;
  }
  result = swift_once();
LABEL_8:
  v22 = HIBYTE(word_1ED5C8FE0);
  *(_BYTE *)(v17 + 48) = word_1ED5C8FE0;
  *(_BYTE *)(v17 + 49) = v22;
  *a2 = v17;
  return result;
}

uint64_t sub_1BA178610@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BA178458(a1, a2);
}

uint64_t sub_1BA178624()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(unsigned __int8 *)(v0 + 16);
  sub_1BA19AEA0();
  swift_bridgeObjectRelease();
  strcpy((char *)v4, "columnRowSpan(");
  HIBYTE(v4[1]) = -18;
  sub_1BA19AFD8();
  sub_1BA19ABD0();
  swift_bridgeObjectRelease();
  sub_1BA19ABD0();
  if (v2 == 1)
    __asm { BR              X9 }
  sub_1BA19ACF0();
  sub_1BA19ABD0();
  swift_bridgeObjectRelease();
  sub_1BA19ABD0();
  return v4[0];
}

void sub_1BA178740()
{
  JUMPOUT(0x1BA178704);
}

void sub_1BA17874C()
{
  JUMPOUT(0x1BA178704);
}

void sub_1BA17875C()
{
  JUMPOUT(0x1BA178704);
}

uint64_t storeEnumTagSinglePayload for ColumnRowSpanSizer(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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

ValueMetadata *type metadata accessor for ColumnRowSpanSizer()
{
  return &type metadata for ColumnRowSpanSizer;
}

uint64_t sub_1BA1787B0()
{
  return swift_deallocObject();
}

unint64_t sub_1BA1787C0()
{
  unint64_t result;

  result = qword_1EF274400;
  if (!qword_1EF274400)
  {
    result = MEMORY[0x1BCCD6858](&protocol conformance descriptor for LayoutError, &type metadata for LayoutError);
    atomic_store(result, (unint64_t *)&qword_1EF274400);
  }
  return result;
}

double EmbedFactoryCursor.origin.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

uint64_t sub_1BA178804(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(_QWORD *, uint64_t, uint64_t);
  _QWORD v12[5];

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 144);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](a2, a2);
  v7 = (char *)&v12[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAtKeyPath();
  v12[3] = v3;
  v12[4] = &protocol witness table for Node<A>;
  v12[0] = v2;
  v8 = *(_QWORD *)(v3 + 168);
  v9 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v8 + 8);
  swift_retain();
  v9(v12, v4, v8);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_1BA1788C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v11;
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
  uint64_t (*v24)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[3];
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t AssociatedTypeWitness;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
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
  _QWORD v63[31];
  _BYTE v64[200];
  _QWORD v65[32];
  uint64_t v66;

  v9 = v4;
  v45 = a3;
  v54 = a2;
  v66 = a1;
  v11 = (_QWORD *)*v9;
  v44 = *(_QWORD *)(*v9 + 144);
  v40 = *(_QWORD *)(v44 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  v39 = (char *)v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = v11[22];
  v42 = v11[19];
  v43 = v13;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v38 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](AssociatedTypeWitness, v14);
  v37 = a4;
  v15 = v9[8];
  v46 = v9[7];
  v47 = v15;
  v48 = (char *)v35 - v16;
  sub_1BA16AF64();
  v18 = v17;
  v50 = v9[6];
  v63[0] = v50;
  v19 = v11[17];
  v20 = v11[20];
  v49 = type metadata accessor for Sizing(0, v19, v20, v21);
  sub_1BA16A170();
  v22 = v65[3];
  v23 = v65[4];
  __swift_project_boxed_opaque_existential_1(v65, v65[3]);
  v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 8);
  v53 = v18;
  v51 = v19;
  v25 = v52;
  v26 = v24(v66, v54, v18, v19, v20, v22, v23);
  if (v25)
  {
    swift_release();
    return OUTLINED_FUNCTION_4_4();
  }
  else
  {
    v52 = v26;
    v36 = v11;
    OUTLINED_FUNCTION_4_4();
    v63[0] = v50;
    sub_1BA16A170();
    v27 = v65[3];
    v28 = v65[4];
    __swift_project_boxed_opaque_existential_1(v65, v65[3]);
    (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 16))(v63, v66, v54, v53, v51, v20, v27, v28);
    v50 = v20;
    v30 = v63[0];
    OUTLINED_FUNCTION_4_4();
    v65[0] = v30;
    SizerResult.isAmbiguous.getter();
    if ((v31 & 1) == 0)
    {
      v32 = swift_allocObject();
      *(_BYTE *)(v32 + 16) = 0;
      v63[0] = v30;
      v55 = v30;
      swift_retain();
      SizerResult.nonIntegral.getter();
      sub_1BA16AA5C();
      OUTLINED_FUNCTION_9_0();
      swift_release();
      sub_1BA16D270((uint64_t)v9, v45, v46, v47);
      OUTLINED_FUNCTION_6_2(v64);
      v33 = swift_allocObject();
      *(_QWORD *)(v33 + 16) = v32;
      *(_QWORD *)(v33 + 24) = v30;
      v35[1] = v30;
      v65[0] = v5;
      v65[1] = v6;
      v65[2] = v7;
      v65[3] = v8;
      OUTLINED_FUNCTION_6_2(&v65[4]);
      v65[29] = sub_1BA179FCC;
      v65[30] = v33;
      v35[2] = v9;
      memcpy(v63, v65, sizeof(v63));
      swift_retain();
      sub_1BA1667D4((uint64_t)v64);
      v34 = v36[21];
      v49 = v32;
      swift_retain();
      v55 = v51;
      v56 = v44;
      v57 = v42;
      v58 = v42;
      v59 = v50;
      v60 = v34;
      v61 = v43;
      v62 = v43;
      type metadata accessor for EmbedFactory.Context();
    }
    swift_release();
    OUTLINED_FUNCTION_3_8();
    swift_release();
    return swift_retain();
  }
}

void sub_1BA178C64(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  Swift::String_optional v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  void (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  __C::CGRect v33;

  sub_1BA171CBC((void *)(v1 + 240), a1);
  if (v4)
  {
    OUTLINED_FUNCTION_3_8();
    OUTLINED_FUNCTION_9_1();
    swift_release();
    OUTLINED_FUNCTION_5_4();
    swift_release();
  }
  else
  {
    *(_QWORD *)(v1 + 136) = v3;
    *(_QWORD *)(v1 + 144) = v2;
    v10 = *(void (**)(uint64_t))(swift_getAssociatedConformanceWitness() + 16);
    v11 = OUTLINED_FUNCTION_8_2();
    v10(v11);
    OUTLINED_FUNCTION_9_0();
    *(_BYTE *)(v1 + 176) = *(_BYTE *)(*(_QWORD *)(v5 - 72) + 48);
    *(_QWORD *)(v1 + 240) = *(_QWORD *)(v1 + 8);
    SizerResult.metadata.getter();
    v33.origin.x = v6;
    v33.origin.y = v7;
    v33.size.width = v8;
    v13 = v12;
    v14 = *(_QWORD *)(v1 + 104);
    v15.value._countAndFlagsBits = *(_QWORD *)(v1 + 112);
    v33.size.height = v9;
    LayoutContext.set(frame:direction:metadata:for:)(v33, (TeaTemplate::Direction)(v1 - 80), *(Swift::OpaquePointer_optional *)&v13, v15);
    swift_bridgeObjectRelease();
    v16 = *(_QWORD **)(v1 + 16);
    *(_QWORD *)(v1 + 72) = v16[2];
    v17 = OUTLINED_FUNCTION_8_2();
    v10(v17);
    *(_QWORD *)(v1 + 80) = v10;
    *(_BYTE *)(v1 + 240) = 3;
    v18 = *(_QWORD *)(v1 + 120);
    sub_1BA17FD24();
    v19 = OUTLINED_FUNCTION_8_2();
    v10(v19);
    sub_1BA17FE6C(*(_QWORD *)(v1 + 152));
    v20 = v18;
    swift_bridgeObjectRelease();
    v21 = OUTLINED_FUNCTION_8_2();
    (*(void (**)(uint64_t))(v1 + 80))(v21);
    sub_1BA16D280((uint64_t)v16, *(_QWORD *)(v1 + 96), *(_QWORD *)(v1 + 104), *(_QWORD *)(v1 + 112));
    v22 = (char *)v16 + *(_QWORD *)(*v16 + 216);
    v23 = *(void (**)(uint64_t))v22;
    if (*(_QWORD *)v22)
    {
      v24 = *((_QWORD *)v22 + 1);
      swift_retain();
      v23(v18);
      OUTLINED_FUNCTION_0_9();
      *(_QWORD *)(v1 + 264) = *(_QWORD *)(v1 + 24);
      *(_QWORD *)(v1 + 272) = &protocol witness table for Node<A>;
      *(_QWORD *)(v1 + 240) = v16;
      v25 = *(_QWORD *)(v1 + 136);
      v26 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 16);
      swift_retain();
      v27 = v20;
      v28 = *(_QWORD *)(v1 + 88);
      v26(v1 + 176, v1 + 240, MEMORY[0x1E0DEE9B8] + 8, v28, v25);
      OUTLINED_FUNCTION_9_1();
      sub_1BA162F64((uint64_t)v23);
      OUTLINED_FUNCTION_5_4();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 56) + 8))(v24, v28);
      __swift_destroy_boxed_opaque_existential_1(v1 + 176);
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 + 40) + 8))(v27, *(_QWORD *)(v1 + 64));
    }
    else
    {
      OUTLINED_FUNCTION_0_9();
      *(_QWORD *)(v1 + 264) = *(_QWORD *)(v1 + 24);
      *(_QWORD *)(v1 + 272) = &protocol witness table for Node<A>;
      *(_QWORD *)(v1 + 240) = v16;
      v29 = *(_QWORD *)(v1 + 136);
      v30 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 16);
      swift_retain();
      v31 = *(_QWORD *)(v1 + 64);
      v32 = *(_QWORD *)(v1 + 88);
      v30(v18, v1 + 240, v31, v32, v29);
      OUTLINED_FUNCTION_9_1();
      OUTLINED_FUNCTION_5_4();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 56) + 8))(v18, v32);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 40) + 8))(v18, v31);
    }
    __swift_destroy_boxed_opaque_existential_1(v1 + 240);
    swift_release();
  }
  JUMPOUT(0x1BA178AC4);
}

void sub_1BA178F2C(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  __C::CGRect v10;

  swift_beginAccess();
  *(_BYTE *)(a1 + 16) = 1;
  v10.origin.x = a2;
  v10.origin.y = a3;
  v10.size.width = a4;
  v10.size.height = a5;
  SizerResult.postProcess(frame:nonIntegral:)(v10, 0);
}

void EmbedFactory.__allocating_init(kind:identifier:)()
{
  swift_allocObject();
  EmbedFactory.init(kind:identifier:)();
}

void EmbedFactory.init(kind:identifier:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_1BA17901C()
{
  uint64_t v0;

  swift_release();
  sub_1BA1790C0(*(_QWORD *)(v0 + 48));
  swift_bridgeObjectRelease();
  type metadata accessor for EmbedFactory.Context();
}

uint64_t sub_1BA179084(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
  return sub_1BA162F64(*(_QWORD *)(v2 + *(_QWORD *)(*(_QWORD *)v2 + 216)));
}

unint64_t sub_1BA1790C0(unint64_t result)
{
  switch((result >> 59) & 0x1E | (result >> 2) & 1)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
      result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t EmbedFactory.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  sub_1BA19AEA0();
  sub_1BA19ABD0();
  sub_1BA19B170();
  sub_1BA19ABD0();
  swift_bridgeObjectRelease();
  sub_1BA19ABD0();
  v3 = type metadata accessor for Sizing(0, *(_QWORD *)(v1 + 136), *(_QWORD *)(v1 + 160), v2);
  MEMORY[0x1BCCD6858](&protocol conformance descriptor for Sizing<A>, v3);
  sub_1BA19AFFC();
  sub_1BA19ABD0();
  return 0;
}

uint64_t sub_1BA1791F4()
{
  return EmbedFactory.description.getter();
}

uint64_t destroy for EmbedFactoryCursor(uint64_t a1)
{

  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for EmbedFactoryCursor(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  void *v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  v6 = *(void **)(a2 + 112);
  *(_QWORD *)(a1 + 112) = v6;
  v7 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = v7;
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  v8 = *(void **)(a2 + 176);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = v8;
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_BYTE *)(a1 + 216) = *(_BYTE *)(a2 + 216);
  v9 = *(_QWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 224) = *(_OWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 240) = v9;
  v10 = v6;
  v11 = v8;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for EmbedFactoryCursor(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  v4 = *(void **)(a2 + 112);
  v5 = *(void **)(a1 + 112);
  *(_QWORD *)(a1 + 112) = v4;
  v6 = v4;

  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  v7 = *(void **)(a2 + 176);
  v8 = *(void **)(a1 + 176);
  *(_QWORD *)(a1 + 176) = v7;
  v9 = v7;

  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_BYTE *)(a1 + 216) = *(_BYTE *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  swift_retain();
  swift_release();
  v10 = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 240) = v10;
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy248_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xF8uLL);
}

uint64_t assignWithTake for EmbedFactoryCursor(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  v6 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  v7 = *(void **)(a1 + 112);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);

  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  v8 = *(_QWORD *)(a2 + 176);
  v9 = *(void **)(a1 + 176);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = v8;

  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_BYTE *)(a1 + 216) = *(_BYTE *)(a2 + 216);
  swift_release();
  v10 = *(_QWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 224) = *(_OWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 240) = v10;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for EmbedFactoryCursor(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 248))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 112);
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

uint64_t storeEnumTagSinglePayload for EmbedFactoryCursor(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 248) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 112) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 248) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for EmbedFactoryCursor()
{
  return &type metadata for EmbedFactoryCursor;
}

uint64_t dispatch thunk of EmbedFactoryType.createLayoutAttributes(model:options:cursor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

uint64_t method lookup function for EmbedFactory()
{
  return swift_lookUpClassMethod();
}

uint64_t *sub_1BA17960C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t *, uint64_t *, uint64_t);
  unint64_t v24;
  uint64_t v26;
  uint64_t AssociatedTypeWitness;

  v3 = *(_QWORD *)(a3 + 40);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v7 = *(_DWORD *)(v6 + 80);
  v8 = v5 + v7;
  v9 = *(_QWORD *)(v6 + 64);
  v10 = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_DWORD *)(v11 + 80);
  v13 = v12;
  v26 = v9;
  v14 = ((v9 + v12 + (v8 & ~(unint64_t)v7)) & ~(unint64_t)v12)
      + *(_QWORD *)(v11 + 64);
  v15 = v7 | *(_DWORD *)(v4 + 80) | v12;
  v16 = (v7 | *(_BYTE *)(v4 + 80) | v12);
  v17 = v15 & 0x100000;
  if (v16 <= 7 && v14 <= 0x18 && v17 == 0)
  {
    v22 = v10;
    v23 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v4 + 16);
    v21 = a1;
    v23(a1, a2, v3);
    v24 = ((unint64_t)a2 + v8) & ~(unint64_t)v7;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16))(((unint64_t)a1 + v8) & ~(unint64_t)v7, v24, AssociatedTypeWitness);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 16))(((((unint64_t)a1 + v8) & ~(unint64_t)v7) + v26 + v13) & ~v13, (v24 + v26 + v13) & ~v13, v22);
  }
  else
  {
    v20 = *a2;
    *a1 = *a2;
    v21 = (uint64_t *)(v20 + ((v16 + 16) & ~v16));
    swift_retain();
  }
  return v21;
}

uint64_t sub_1BA1797A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 40) - 8);
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 24))(a1, a2, *(_QWORD *)(a3 + 40));
  v6 = *(_QWORD *)(v5 + 64);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v6 + v9;
  v11 = (v6 + v9 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24))(v11, v12, AssociatedTypeWitness);
  v13 = *(_QWORD *)(v8 + 64);
  v14 = swift_getAssociatedTypeWitness();
  v15 = *(_QWORD *)(v14 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v15 + 24))((v13 + *(unsigned __int8 *)(v15 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80), (v13 + *(unsigned __int8 *)(v15 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80), v14);
  return a1;
}

uint64_t sub_1BA179898(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 40) - 8);
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 32))(a1, a2, *(_QWORD *)(a3 + 40));
  v6 = *(_QWORD *)(v5 + 64);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v6 + v9;
  v11 = (v6 + v9 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v11, v12, AssociatedTypeWitness);
  v13 = *(_QWORD *)(v8 + 64);
  v14 = swift_getAssociatedTypeWitness();
  v15 = *(_QWORD *)(v14 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v15 + 32))((v13 + *(unsigned __int8 *)(v15 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80), (v13 + *(unsigned __int8 *)(v15 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80), v14);
  return a1;
}

uint64_t sub_1BA179990(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 40) - 8);
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 40))(a1, a2, *(_QWORD *)(a3 + 40));
  v6 = *(_QWORD *)(v5 + 64);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v6 + v9;
  v11 = (v6 + v9 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 40))(v11, v12, AssociatedTypeWitness);
  v13 = *(_QWORD *)(v8 + 64);
  v14 = swift_getAssociatedTypeWitness();
  v15 = *(_QWORD *)(v14 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v15 + 40))((v13 + *(unsigned __int8 *)(v15 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80), (v13 + *(unsigned __int8 *)(v15 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80), v14);
  return a1;
}

uint64_t sub_1BA179A88(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  int v22;
  unsigned int v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t AssociatedTypeWitness;

  v5 = *(_QWORD *)(a3 + 40);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int *)(v6 + 84);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v9 = *(unsigned int *)(v8 + 84);
  if (v9 <= v7)
    v10 = v7;
  else
    v10 = *(_DWORD *)(v8 + 84);
  v11 = swift_getAssociatedTypeWitness();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int *)(v12 + 84);
  if (v13 <= v10)
    v14 = v10;
  else
    v14 = *(_DWORD *)(v12 + 84);
  if (!a2)
    return 0;
  v15 = v11;
  v16 = *(unsigned __int8 *)(v8 + 80);
  v17 = *(_QWORD *)(v6 + 64) + v16;
  v18 = *(_QWORD *)(v8 + 64);
  v19 = *(unsigned __int8 *)(v12 + 80);
  if (a2 <= v14)
    goto LABEL_26;
  v20 = ((v18 + v19 + (v17 & ~v16)) & ~v19) + *(_QWORD *)(v12 + 64);
  v21 = 8 * v20;
  if (v20 <= 3)
  {
    v23 = ((a2 - v14 + ~(-1 << v21)) >> v21) + 1;
    if (HIWORD(v23))
    {
      v22 = *(_DWORD *)(a1 + v20);
      if (!v22)
        goto LABEL_26;
      goto LABEL_17;
    }
    if (v23 > 0xFF)
    {
      v22 = *(unsigned __int16 *)(a1 + v20);
      if (!*(_WORD *)(a1 + v20))
        goto LABEL_26;
      goto LABEL_17;
    }
    if (v23 < 2)
    {
LABEL_26:
      if (v14)
      {
        if ((_DWORD)v7 == v14)
          return __swift_getEnumTagSinglePayload(a1, v7, v5);
        v26 = (v17 + a1) & ~v16;
        if ((_DWORD)v9 == v14)
        {
          v13 = v9;
          v15 = AssociatedTypeWitness;
        }
        else
        {
          v26 = (v26 + v18 + v19) & ~v19;
        }
        return __swift_getEnumTagSinglePayload(v26, v13, v15);
      }
      return 0;
    }
  }
  v22 = *(unsigned __int8 *)(a1 + v20);
  if (!*(_BYTE *)(a1 + v20))
    goto LABEL_26;
LABEL_17:
  v24 = (v22 - 1) << v21;
  if (v20 > 3)
    v24 = 0;
  if ((_DWORD)v20)
  {
    if (v20 <= 3)
      v25 = v20;
    else
      v25 = 4;
    __asm { BR              X12 }
  }
  return v14 + v24 + 1;
}

void sub_1BA179CC4(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  size_t v13;
  char v14;
  _BYTE *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  int v19;

  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 40) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  if (*(_DWORD *)(v9 + 84) <= v8)
    v10 = v8;
  else
    v10 = *(_DWORD *)(v9 + 84);
  v11 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  if (*(_DWORD *)(v11 + 84) <= v10)
    v12 = v10;
  else
    v12 = *(_DWORD *)(v11 + 84);
  v13 = ((*(_QWORD *)(v9 + 64)
        + *(unsigned __int8 *)(v11 + 80)
        + ((*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))
      + *(_QWORD *)(v11 + 64);
  v14 = 8 * v13;
  if (a3 <= v12)
  {
    v16 = 0u;
    v15 = a1;
  }
  else
  {
    v15 = a1;
    if (v13 <= 3)
    {
      v18 = ((a3 - v12 + ~(-1 << v14)) >> v14) + 1;
      if (HIWORD(v18))
      {
        v16 = 4u;
      }
      else if (v18 >= 0x100)
      {
        v16 = 2;
      }
      else
      {
        v16 = v18 > 1;
      }
    }
    else
    {
      v16 = 1u;
    }
  }
  if (v12 < a2)
  {
    v17 = ~v12 + a2;
    if (v13 < 4)
    {
      if ((_DWORD)v13)
      {
        v19 = v17 & ~(-1 << v14);
        bzero(v15, v13);
        if ((_DWORD)v13 == 3)
        {
          *(_WORD *)v15 = v19;
          v15[2] = BYTE2(v19);
        }
        else if ((_DWORD)v13 == 2)
        {
          *(_WORD *)v15 = v19;
        }
        else
        {
          *v15 = v19;
        }
      }
    }
    else
    {
      bzero(v15, v13);
      *(_DWORD *)v15 = v17;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X16 }
}

uint64_t sub_1BA179F8C()
{
  return swift_deallocObject();
}

uint64_t sub_1BA179F9C()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_1BA179FCC(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  uint64_t v4;

  sub_1BA178F2C(*(_QWORD *)(v4 + 16), a1, a2, a3, a4);
}

uint64_t sub_1BA179FE4(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 112);
  v3 = *(void **)(a1 + 176);
  swift_release();
  swift_release();

  return a1;
}

uint64_t sub_1BA17A030(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(char *);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  v33 = a1;
  v5 = v4;
  v35 = a3;
  v8 = *(_QWORD *)(*(_QWORD *)v4 + 136);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = *(_QWORD *)(v12 + 144);
  v14 = type metadata accessor for Dynamic.State(0, v8, v37, v13);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14, v16);
  v18 = (char *)v30 - v17;
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v34 = a2;
  v20 = a2;
  v21 = v33;
  v31 = v8;
  v19(v11, v20, v8);
  v36 = a4;
  sub_1BA17A338(v21, (uint64_t)v11, *a4, v22, v18);
  v23 = *(void (**)(char *))(v5 + 40);
  swift_retain();
  swift_retain();
  v24 = v32;
  v23(v18);
  if (!v24)
  {
    v30[3] = v25;
    v30[4] = v15;
    v32 = v26;
    type metadata accessor for Node(0, v31, v37, v27);
    swift_bridgeObjectRetain();
    v29 = sub_1BA19AC60();
    OUTLINED_FUNCTION_1_9();
    v38 = v29;
    OUTLINED_FUNCTION_2_6();
  }
  return OUTLINED_FUNCTION_3_9(*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8));
}

uint64_t sub_1BA17A338@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v8 = *a1;
  *(_QWORD *)a5 = a1;
  v9 = *(_QWORD *)(v8 + 80);
  v10 = type metadata accessor for Dynamic.State(0, v9, *(_QWORD *)(v8 + 88), a4);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(&a5[*(int *)(v10 + 36)], a2, v9);
  *(_QWORD *)&a5[*(int *)(v10 + 40)] = a3;
  return result;
}

uint64_t Dynamic.State.cursor.getter()
{
  return swift_retain();
}

uint64_t Dynamic.State.template.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 36));
}

uint64_t Dynamic.State.context.getter()
{
  return swift_retain();
}

void Dynamic.__allocating_init(kind:identifier:)()
{
  swift_initStackObject();
  Dynamic.init(kind:identifier:)();
}

void Dynamic.init(kind:identifier:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1BA17A424()
{
  return swift_release();
}

uint64_t Dynamic.description.getter()
{
  return 0x63696D616E7944;
}

uint64_t sub_1BA17A444()
{
  return 0x63696D616E7944;
}

uint64_t method lookup function for Dynamic()
{
  return swift_lookUpClassMethod();
}

uint64_t *sub_1BA17A468(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = *(_QWORD *)(v5 + 64) + 7;
  v8 = *(_DWORD *)(v5 + 80) & 0x100000;
  v9 = *a2;
  *a1 = *a2;
  if (v6 > 7 || v8 != 0 || ((v7 + ((v6 + 8) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
  }
  else
  {
    v12 = ((unint64_t)a1 + v6 + 8) & ~v6;
    v13 = ((unint64_t)a2 + v6 + 8) & ~v6;
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_retain();
    v14(v12, v13, v4);
    *(_QWORD *)((v7 + v12) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v7 + v13) & 0xFFFFFFFFFFFFF8);
  }
  swift_retain();
  return a1;
}

_QWORD *sub_1BA17A548(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  swift_retain();
  swift_release();
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)a1 + v7 + 8) & ~v7;
  v9 = ((unint64_t)a2 + v7 + 8) & ~v7;
  (*(void (**)(uint64_t, uint64_t))(v6 + 24))(v8, v9);
  *(_QWORD *)((*(_QWORD *)(v6 + 64) + 7 + v8) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v6 + 64) + 7 + v9) & 0xFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *sub_1BA17A5F0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = ((unint64_t)a1 + v5 + 8) & ~v5;
  v7 = ((unint64_t)a2 + v5 + 8) & ~v5;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v6, v7);
  *(_QWORD *)((*(_QWORD *)(v4 + 64) + 7 + v6) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v4 + 64) + 7 + v7) & 0xFFFFFFFFFFFFF8);
  return a1;
}

_QWORD *sub_1BA17A670(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  swift_release();
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)a1 + v7 + 8) & ~v7;
  v9 = ((unint64_t)a2 + v7 + 8) & ~v7;
  (*(void (**)(uint64_t, uint64_t))(v6 + 40))(v8, v9);
  *(_QWORD *)((*(_QWORD *)(v6 + 64) + 7 + v8) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v6 + 64) + 7 + v9) & 0xFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_1BA17A708(uint64_t *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v13;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if (!a2)
    return 0;
  v8 = *(unsigned __int8 *)(v5 + 80);
  if (v7 >= a2)
  {
    if ((v6 & 0x80000000) != 0)
    {
      return __swift_getEnumTagSinglePayload(((unint64_t)a1 + v8 + 8) & ~v8, v6, v4);
    }
    else
    {
      v13 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v13) = -1;
      return (v13 + 1);
    }
  }
  else
  {
    if (((((*(_QWORD *)(v5 + 64) + ((v8 + 8) & ~v8) + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v7 + 1;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    return ((uint64_t (*)(void))((char *)&loc_1BA17A794 + 4 * byte_1BA19C7F8[v11]))();
  }
}

void sub_1BA17A810(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = ((*(_QWORD *)(v5 + 64)
       + ((*(unsigned __int8 *)(v5 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
       + 7) & 0xFFFFFFFFFFFFFFF8)
     + 8;
  if (v6 >= a3)
  {
    v10 = 0u;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + ((*(unsigned __int8 *)(v5 + 80) + 8) & ~*(unsigned __int8 *)(v5 + 80)) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v8 = a3 - v6 + 1;
    else
      v8 = 2;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
  }
  if (a2 > v6)
  {
    if ((_DWORD)v7)
    {
      v11 = ~v6 + a2;
      bzero(a1, v7);
      *a1 = v11;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X12 }
}

uint64_t sub_1BA17A910@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  *((_BYTE *)v5 + v6) = 0;
  if ((_DWORD)a1)
  {
    if ((a2 & 0x80000000) != 0)
    {
      return __swift_storeEnumTagSinglePayload(((unint64_t)v5 + v4 + 8) & a4, a1, a2, a3);
    }
    else
    {
      if ((a1 & 0x80000000) != 0)
        v7 = a1 ^ 0x80000000;
      else
        v7 = (a1 - 1);
      *v5 = v7;
    }
  }
  return result;
}

void Embed<A, B, C>(name:keyPath:sizing:context:)()
{
  type metadata accessor for EmbedFactory.Context();
}

void sub_1BA17AA00(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  MEMORY[0x1E0C80A78](a1, a2);
  *(_QWORD *)(v8 - 144) = v7;
  *(_QWORD *)(v8 - 136) = v2;
  *(_QWORD *)(v8 - 128) = v6;
  *(_QWORD *)(v8 - 120) = v5;
  *(_QWORD *)(v8 - 112) = v4;
  *(_QWORD *)(v8 - 104) = v3;
  type metadata accessor for EmbedFactory();
}

void sub_1BA17AA48()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v4 - 144) = v1;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 16))(v3, *(_QWORD *)(v4 - 176), v2);
  v5 = *(_QWORD *)(v4 - 168);
  swift_bridgeObjectRetain();
  v6 = *(_QWORD *)(v4 - 160);
  swift_retain();
  sub_1BA1683F8(v1);
  sub_1BA164DC0(*(_QWORD *)(v4 - 152), v5, v6, (uint64_t *)(v4 - 144));
}

uint64_t sub_1BA17AAC8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      v7 = *v5++;
      v6 = v7;
      if ((v7 & ~v4) == 0)
        v6 = 0;
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t sub_1BA17AB1C(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 80);
  v3 = *(void **)(a1 + 144);
  swift_release();

  return a1;
}

_QWORD *ColumnSystem.Options.traits.setter(_QWORD *result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = *result;
  return result;
}

uint64_t (*ColumnSystem.Options.traits.modify())()
{
  return nullsub_1;
}

double ColumnSystem.Options.origin.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 88);
}

double ColumnSystem.Options.bounds.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 48);
}

double ColumnSystem.Options.layoutMargins.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 80);
}

TeaTemplate::ColumnSystem::Options::Traits __swiftcall ColumnSystem.Options.Traits.init(rawValue:)(TeaTemplate::ColumnSystem::Options::Traits rawValue)
{
  TeaTemplate::ColumnSystem::Options::Traits *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static ColumnSystem.Options.Traits.compressed.getter(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_2_7(a1);
}

void static ColumnSystem.Options.Traits.noScaling.getter(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_2_7(a1);
}

uint64_t ColumnSystem.Options.Traits.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

TeaTemplate::ColumnSystem::Options::Traits sub_1BA17ABBC(Swift::Int *a1)
{
  return ColumnSystem.Options.Traits.init(rawValue:)(*a1);
}

uint64_t sub_1BA17ABC8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  return sub_1BA17ABD4(*a1, *v2, a2);
}

uint64_t sub_1BA17ABD4@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 | result;
  return result;
}

void sub_1BA17ABE0(_QWORD *a1@<X8>)
{
  sub_1BA17ABEC(a1);
}

void sub_1BA17ABEC(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_2_7(a1);
}

uint64_t sub_1BA17ABF4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  return sub_1BA17AC00(*a1, *v2, a2);
}

uint64_t sub_1BA17AC00@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 ^ result;
  return result;
}

uint64_t sub_1BA17AC0C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BA17AC14(*a1, a2);
}

uint64_t sub_1BA17AC14@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & result;
  if (v3)
    *v2 &= ~result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t sub_1BA17AC3C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BA17AC44(*a1, a2);
}

uint64_t sub_1BA17AC44@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *v2;
  *v2 |= result;
  v4 = v3 & result;
  *(_QWORD *)a2 = v4;
  *(_BYTE *)(a2 + 8) = v4 == 0;
  return result;
}

uint64_t sub_1BA17AC64(uint64_t *a1)
{
  return j__OUTLINED_FUNCTION_2_2(*a1);
}

uint64_t sub_1BA17AC6C(uint64_t *a1)
{
  return j__OUTLINED_FUNCTION_3_2(*a1);
}

uint64_t sub_1BA17AC78@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  return sub_1BA17AC84(*a1, *v2, a2);
}

uint64_t sub_1BA17AC84@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & ~result;
  return result;
}

BOOL sub_1BA17AC90(uint64_t *a1)
{
  uint64_t *v1;

  return sub_1BA17AC9C(*a1, *v1);
}

BOOL sub_1BA17AC9C(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_1BA17ACA8()
{
  uint64_t *v0;

  return sub_1BA17ACB0(*v0);
}

BOOL sub_1BA17ACB0(uint64_t a1)
{
  return a1 == 0;
}

TeaTemplate::ColumnSystem::Options::Traits sub_1BA17ACBC@<X0>(Swift::Int *a1@<X0>, uint64_t a2@<X8>)
{
  TeaTemplate::ColumnSystem::Options::Traits result;

  result.rawValue = ColumnSystem.Options.Traits.init(rawValue:)(*a1).rawValue;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_1BA17ACE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = ColumnSystem.Options.Traits.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1BA17AD08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = NodeKind.rawValue.getter();
  v2 = v1;
  if (v0 == NodeKind.rawValue.getter() && v2 == v3)
    v5 = 1;
  else
    v5 = OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_1();
  return v5 & 1;
}

void sub_1BA17AD88(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1BA17ADD0(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1BA17AE1C + 4 * byte_1BA19C8F2[a2]))(0x6563617073);
}

void sub_1BA17AE1C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  if (a1 != 0x6563617073 || v1 != v2)
    OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0();
}

uint64_t ColumnSystem.description.getter()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 32) == 1)
  {
    if (*(_QWORD *)(v0 + 8) | *(_QWORD *)v0 | *(_QWORD *)(v0 + 16) | *(_QWORD *)(v0 + 24))
      return 1685217635;
    else
      return 0x746C7561666564;
  }
  else
  {
    sub_1BA19AEA0();
    sub_1BA19ABD0();
    type metadata accessor for UIEdgeInsets(0);
    sub_1BA19AF3C();
    sub_1BA19ABD0();
    return 0;
  }
}

unint64_t sub_1BA17AF8C()
{
  unint64_t result;

  result = qword_1EF274408;
  if (!qword_1EF274408)
  {
    result = MEMORY[0x1BCCD6858](&protocol conformance descriptor for ColumnSystem.Options.Traits, &type metadata for ColumnSystem.Options.Traits);
    atomic_store(result, (unint64_t *)&qword_1EF274408);
  }
  return result;
}

unint64_t sub_1BA17AFCC()
{
  unint64_t result;

  result = qword_1EF274410[0];
  if (!qword_1EF274410[0])
  {
    result = MEMORY[0x1BCCD6858](&protocol conformance descriptor for ColumnSystem.Options.Traits, &type metadata for ColumnSystem.Options.Traits);
    atomic_store(result, qword_1EF274410);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ColumnSystem(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ColumnSystem(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 32) = 0;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
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
  *(_BYTE *)(result + 33) = v3;
  return result;
}

uint64_t sub_1BA17B060(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t getEnumTagSinglePayload for ColumnSystem.Options(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  unsigned int v3;
  BOOL v4;

  if (a2)
  {
    if (a2 >= 0xFE && a1[112])
    {
      v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      v3 = *a1;
      v4 = v3 >= 3;
      v2 = v3 - 3;
      if (!v4)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ColumnSystem.Options(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 112) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 112) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 2;
  }
  return result;
}

uint64_t sub_1BA17B11C(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);

  return sub_1BA171098(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_BYTE *)(a1 + 64));
}

uint64_t sub_1BA17B14C(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;

  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  v4 = *(void **)(a2 + 40);
  v5 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v4;
  v6 = v4;

  v7 = *(_QWORD *)(a2 + 48);
  v8 = *(_QWORD *)(a2 + 56);
  v9 = *(_BYTE *)(a2 + 64);
  sub_1BA171AAC(v7, v8, v9);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = v7;
  *(_QWORD *)(a1 + 56) = v8;
  v12 = *(_BYTE *)(a1 + 64);
  *(_BYTE *)(a1 + 64) = v9;
  sub_1BA171098(v10, v11, v12);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  return a1;
}

void *__swift_memcpy66_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x42uLL);
}

uint64_t sub_1BA17B1D4(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  v6 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;

  v7 = *(_BYTE *)(a2 + 64);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  v10 = *(_BYTE *)(a1 + 64);
  *(_BYTE *)(a1 + 64) = v7;
  sub_1BA171098(v8, v9, v10);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  return a1;
}

uint64_t sub_1BA17B238(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 66))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
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

uint64_t sub_1BA17B278(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 66) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

_QWORD *sub_1BA17B2CC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *result;
  _QWORD v14[13];

  v6 = v4;
  v14[12] = a4;
  v10 = *a1;
  v11 = v6[3];
  v12 = v6[4];
  __swift_project_boxed_opaque_existential_1(v6, v11);
  result = (*(_QWORD *(**)(_QWORD *__return_ptr, uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v12 + 16))(v14, a1, a2, a3, *(_QWORD *)(v10 + 80), *(_QWORD *)(v10 + 88), v11, v12);
  if (!v5)
    __asm { BR              X10 }
  return result;
}

#error "1BA17B6B8: call analysis failed (funcsize=59)"

double sub_1BA17B754(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double v7;
  CGRect v9;
  CGRect v10;
  CGRect v11;

  v7 = a1;
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = 0.0;
  v11.size.height = 0.0;
  if (!CGRectEqualToRect(*(CGRect *)&a1, v11))
  {
    v9.origin.x = v7;
    v9.origin.y = a2;
    v9.size.width = a3;
    v9.size.height = a4;
    CGRectGetMinY(v9);
    v10.origin.x = v7;
    v10.origin.y = a2;
    v10.size.width = a3;
    v10.size.height = a4;
    return CGRectGetMinX(v10);
  }
  return v7;
}

double sub_1BA17B82C(double a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, void *a6)
{
  double v10;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  v10 = a1;
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.width = 0.0;
  v14.size.height = 0.0;
  if (!CGRectEqualToRect(*(CGRect *)&a1, v14))
  {
    v12.origin.x = v10;
    v12.origin.y = a2;
    v12.size.width = a3;
    v12.size.height = a4;
    CGRectGetMinY(v12);
    objc_msgSend(a6, sel_descender);
    v13.origin.x = v10;
    v13.origin.y = a2;
    v13.size.width = a3;
    v13.size.height = a4;
    return CGRectGetMinX(v13);
  }
  return v10;
}

double sub_1BA17B91C(void *a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, uint64_t a6, uint64_t a7)
{
  double v12;
  CGRect v14;
  CGRect v15;

  v12 = a2;
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.width = 0.0;
  v15.size.height = 0.0;
  if (!CGRectEqualToRect(*(CGRect *)&a2, v15))
  {
    objc_msgSend(a1, sel_ascender);
    objc_msgSend(a1, sel_descender);
    objc_msgSend(a1, sel_descender);
    objc_msgSend(a1, sel_capHeight);
    CGRectGetMinY(*(CGRect *)(a7 + 16));
    v14.origin.x = v12;
    v14.origin.y = a3;
    v14.size.width = a4;
    v14.size.height = a5;
    return CGRectGetMinX(v14);
  }
  return v12;
}

double sub_1BA17BA4C(double a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, uint64_t a6, void *a7)
{
  double v12;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  v12 = a1;
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = 0.0;
  v16.size.height = 0.0;
  if (!CGRectEqualToRect(*(CGRect *)&a1, v16))
  {
    CGRectGetMaxY(*(CGRect *)(a6 + 16));
    v14.origin.x = v12;
    v14.origin.y = a2;
    v14.size.width = a3;
    v14.size.height = a4;
    CGRectGetHeight(v14);
    objc_msgSend(a7, sel_descender);
    v15.origin.x = v12;
    v15.origin.y = a2;
    v15.size.width = a3;
    v15.size.height = a4;
    return CGRectGetMinX(v15);
  }
  return v12;
}

double sub_1BA17BB58(double a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, void *a6)
{
  double v10;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  v10 = a1;
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.width = 0.0;
  v14.size.height = 0.0;
  if (!CGRectEqualToRect(*(CGRect *)&a1, v14))
  {
    objc_msgSend(a6, sel_ascender);
    v12.origin.x = v10;
    v12.origin.y = a2;
    v12.size.width = a3;
    v12.size.height = a4;
    CGRectGetMinY(v12);
    v13.origin.x = v10;
    v13.origin.y = a2;
    v13.size.width = a3;
    v13.size.height = a4;
    return CGRectGetMinX(v13);
  }
  return v10;
}

double sub_1BA17BC58(double a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, void *a6)
{
  double v10;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  v10 = a1;
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.width = 0.0;
  v14.size.height = 0.0;
  if (!CGRectEqualToRect(*(CGRect *)&a1, v14))
  {
    objc_msgSend(a6, sel_descender);
    v12.origin.x = v10;
    v12.origin.y = a2;
    v12.size.width = a3;
    v12.size.height = a4;
    CGRectGetMinY(v12);
    v13.origin.x = v10;
    v13.origin.y = a2;
    v13.size.width = a3;
    v13.size.height = a4;
    return CGRectGetMinX(v13);
  }
  return v10;
}

_QWORD *sub_1BA17BD58(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1BA17B2CC(a1, a2, a3, a6);
}

uint64_t sub_1BA17BD70(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  sub_1BA17C214();
  sub_1BA19AF3C();
  sub_1BA19ABD0();
  v3 = type metadata accessor for FontSizer.Align(0, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), v2);
  MEMORY[0x1BCCD6858](&unk_1BA19CB80, v3);
  sub_1BA19AFFC();
  sub_1BA19ABD0();
  return 0;
}

void sub_1BA17BE48()
{
  __asm { BR              X11 }
}

unint64_t sub_1BA17BE98()
{
  return 0xD000000000000012;
}

uint64_t sub_1BA17BF8C()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BA17BFC0()
{
  return sub_1BA17C038((uint64_t (*)(_QWORD, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD))sub_1BA17BC58);
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  sub_1BA171098(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 104), *(_BYTE *)(v0 + 112));
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_10_1();
  return swift_deallocObject();
}

uint64_t sub_1BA17C01C()
{
  return sub_1BA17C038((uint64_t (*)(_QWORD, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD))sub_1BA17BB58);
}

uint64_t sub_1BA17C038(uint64_t (*a1)(_QWORD, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD))
{
  uint64_t v1;

  return a1(*(unsigned __int8 *)(v1 + 32), *(_QWORD *)(v1 + 40), v1 + 48, *(_QWORD *)(v1 + 120), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1BA17C064()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_1BA17C088()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  sub_1BA171098(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_BYTE *)(v0 + 80));
  return swift_deallocObject();
}

uint64_t sub_1BA17C0C0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_6_3();
  swift_release();

  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_10_1();
  return swift_deallocObject();
}

double sub_1BA17C0F0(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  uint64_t v4;

  return sub_1BA17BA4C(a1, a2, a3, a4, v4 + 32, *(_QWORD *)(v4 + 104), *(void **)(v4 + 112));
}

uint64_t sub_1BA17C114()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  sub_1BA171098(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 96), *(_BYTE *)(v0 + 104));
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_10_1();
  return swift_deallocObject();
}

double sub_1BA17C154(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  uint64_t v4;

  return sub_1BA17B91C(*(void **)(v4 + 32), a1, a2, a3, a4, v4 + 40, *(_QWORD *)(v4 + 112));
}

uint64_t sub_1BA17C178()
{
  uint64_t v0;

  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_6_3();

  OUTLINED_FUNCTION_14_0();
  return swift_deallocObject();
}

double sub_1BA17C1A8(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  uint64_t v4;

  return sub_1BA17B82C(a1, a2, a3, a4, v4 + 32, *(void **)(v4 + 104));
}

uint64_t sub_1BA17C1C8()
{
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_14_0();
  return swift_deallocObject();
}

double sub_1BA17C1F0(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  return sub_1BA17B754(a1, a2, a3, a4);
}

unint64_t sub_1BA17C214()
{
  unint64_t result;

  result = qword_1ED5C99E8;
  if (!qword_1ED5C99E8)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED5C99E8);
  }
  return result;
}

uint64_t type metadata accessor for FontSizer.Align(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for FontSizer.Align);
}

uint64_t sub_1BA17C278(uint64_t a1)
{
  return sub_1BA171098(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_1BA17C288(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1BA171AAC(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t sub_1BA17C2D0(uint64_t a1, uint64_t a2)
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
  sub_1BA171AAC(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_1BA171098(v6, v7, v8);
  return a1;
}

uint64_t sub_1BA17C324(uint64_t a1, uint64_t a2)
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
  sub_1BA171098(v4, v5, v6);
  return a1;
}

uint64_t sub_1BA17C368(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFC && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 251;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 4)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1BA17C3A8(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 252;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_1BA17C3EC(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 3u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 4);
}

uint64_t sub_1BA17C404(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(_QWORD *)result = a2 - 4;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 4;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

uint64_t initializeWithCopy for ResizeSizer(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for ResizeSizer(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  return a1;
}

uint64_t assignWithTake for ResizeSizer(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for ResizeSizer(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for ResizeSizer(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ResizeSizer()
{
  return &type metadata for ResizeSizer;
}

uint64_t sub_1BA17C548@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
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

  v10 = *a1;
  v11 = v4[3];
  v12 = v4[4];
  __swift_project_boxed_opaque_existential_1(v4, v11);
  result = (uint64_t)(*(_QWORD *(**)(uint64_t *__return_ptr, uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v12 + 16))(&v27, a1, a2, a3, *(_QWORD *)(v10 + 80), *(_QWORD *)(v10 + 88), v11, v12);
  if (!v5)
  {
    v14 = v27;
    swift_retain();
    SizerResult.nonIntegral.getter();
    sub_1BA16AA5C();
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    swift_release();
    v23 = v16;
    v24 = v18;
    v25 = v20;
    v26 = v22;
    if (*((_BYTE *)a1 + 48) == 1)
      CGRectGetHeight(*(CGRect *)&v23);
    else
      CGRectGetWidth(*(CGRect *)&v23);
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v14;
    *a4 = result | 0x3000000000000000;
  }
  return result;
}

uint64_t sub_1BA17C690@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BA17C548(a1, a2, a3, a4);
}

uint64_t sub_1BA17C6A4()
{
  sub_1BA17C214();
  sub_1BA19AF3C();
  sub_1BA19ABD0();
  return 0;
}

uint64_t sub_1BA17C71C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t AltText.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

id AltText.attributedText.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

_QWORD *initializeWithCopy for AltText(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v5 = (void *)a2[2];
  v4 = a2[3];
  a1[2] = v5;
  a1[3] = v4;
  v6 = (void *)a2[4];
  a1[4] = v6;
  swift_bridgeObjectRetain();
  v7 = v5;
  swift_retain();
  v8 = v6;
  return a1;
}

_QWORD *assignWithCopy for AltText(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a2[2];
  v5 = (void *)a1[2];
  a1[2] = v4;
  v6 = v4;

  a1[3] = a2[3];
  swift_retain();
  swift_release();
  v7 = (void *)a2[4];
  v8 = (void *)a1[4];
  a1[4] = v7;
  v9 = v7;

  return a1;
}

uint64_t assignWithTake for AltText(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  v5 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);

  return a1;
}

uint64_t getEnumTagSinglePayload for AltText(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 40))
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

uint64_t storeEnumTagSinglePayload for AltText(uint64_t result, int a2, int a3)
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

id sub_1BA17C958(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t inited;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  sub_1BA17CB54();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BA19C0E0;
  v7 = (void *)*MEMORY[0x1E0DC1138];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1138];
  *(_QWORD *)(inited + 64) = sub_1BA17CC10();
  *(_QWORD *)(inited + 40) = a3;
  type metadata accessor for Key(0);
  sub_1BA16F3F4();
  v8 = v7;
  v9 = a3;
  v10 = sub_1BA19AB34();
  v11 = objc_allocWithZone(MEMORY[0x1E0CB3498]);
  v12 = sub_1BA16F33C(a1, a2, v10);

  return v12;
}

uint64_t sub_1BA17CA4C@<X0>(uint64_t a1@<X0>, void *a2@<X3>, uint64_t *a3@<X8>)
{
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;

  Cursor.remainingBounds.getter();
  objc_msgSend(a2, sel_boundingRectWithSize_options_context_, 33, 0, v6, v7);
  v9 = v8;
  v11 = v10;
  swift_beginAccess();
  v12 = *(_QWORD *)(a1 + 488);
  v13 = *(_QWORD *)(a1 + 496);
  v14 = a2;
  Cursor.remainingBounds.getter();
  v16 = v15;
  v18 = v17;
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v12;
  *(_QWORD *)(result + 24) = v13;
  *(_QWORD *)(result + 32) = v9;
  *(_QWORD *)(result + 40) = v11;
  *(_QWORD *)(result + 48) = v12;
  *(_QWORD *)(result + 56) = v13;
  *(_QWORD *)(result + 64) = v9;
  *(_QWORD *)(result + 72) = v11;
  *(_QWORD *)(result + 80) = v14;
  *(_QWORD *)(result + 88) = v16;
  *(_QWORD *)(result + 96) = v18;
  *a3 = result | 0x1000000000000000;
  return result;
}

uint64_t sub_1BA17CB2C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  void **v2;

  return sub_1BA17CA4C(a1, *v2, a2);
}

uint64_t sub_1BA17CB44()
{
  return 1954047348;
}

void sub_1BA17CB54()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF274498)
  {
    sub_1BA17CBA8();
    v0 = sub_1BA19AFE4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF274498);
  }
}

void sub_1BA17CBA8()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1EF2744A0)
  {
    type metadata accessor for Key(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EF2744A0);
  }
}

unint64_t sub_1BA17CC10()
{
  unint64_t result;

  result = qword_1EF2744A8;
  if (!qword_1EF2744A8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF2744A8);
  }
  return result;
}

ValueMetadata *type metadata accessor for TextSizer()
{
  return &type metadata for TextSizer;
}

uint64_t sub_1BA17CC5C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t type metadata accessor for LayoutContextFrame()
{
  return objc_opt_self();
}

void LayoutContext.contextFrame(for:)()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_0_14();
  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 56) + 16);
  OUTLINED_FUNCTION_6_4();
  if (v1)
  {
    OUTLINED_FUNCTION_9_4();
    if ((v2 & 1) != 0)
      OUTLINED_FUNCTION_4_8();
  }
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_0();
}

double LayoutContextFrame.frame.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

void LayoutContextFrame.direction.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 48);
}

uint64_t LayoutContextFrame.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t LayoutContextFrame.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void __swiftcall LayoutContext.frame(for:)(__C::CGRect_optional *__return_ptr retstr, Swift::String a2)
{
  uint64_t v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v6;
  char v7;
  CGPoint v8;
  CGSize v9;
  Swift::Bool v10;
  CGSize v11;
  CGPoint v12;

  object = a2._object;
  countAndFlagsBits = a2._countAndFlagsBits;
  OUTLINED_FUNCTION_0_14();
  v6 = *(_QWORD *)(v2 + 56);
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_5;
  OUTLINED_FUNCTION_15();
  sub_1BA169038(countAndFlagsBits, (uint64_t)object);
  if ((v7 & 1) == 0)
  {
    OUTLINED_FUNCTION_14_1();
LABEL_5:
    swift_endAccess();
    v8 = (CGPoint)0;
    v10 = 1;
    v9 = (CGSize)0;
    goto LABEL_6;
  }
  OUTLINED_FUNCTION_4_8();
  swift_endAccess();
  OUTLINED_FUNCTION_14_1();
  v11 = *(CGSize *)(v6 + 32);
  v12 = *(CGPoint *)(v6 + 16);
  swift_release();
  v9 = v11;
  v8 = v12;
  v10 = 0;
LABEL_6:
  retstr->value.origin = v8;
  retstr->value.size = v9;
  retstr->is_nil = v10;
}

unint64_t LayoutContext.description.getter()
{
  sub_1BA19AEA0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_14();
  type metadata accessor for LayoutContextFrame();
  OUTLINED_FUNCTION_13_0();
  sub_1BA19AB28();
  sub_1BA19ABD0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BA19ABD0();
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_15();
  sub_1BA19AB28();
  sub_1BA19ABD0();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_12();
  sub_1BA19ABD0();
  return 0xD000000000000015;
}

unint64_t sub_1BA17CF28()
{
  return LayoutContext.description.getter();
}

uint64_t sub_1BA17CF48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  OUTLINED_FUNCTION_8_5();
  sub_1BA18B020(a1, a2, a3);
  *v3 = v8;
  return OUTLINED_FUNCTION_1_12();
}

uint64_t method lookup function for LayoutContextFrame()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for LayoutContext()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1BA17CFB8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  _BYTE *v2;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;

  if (*(_BYTE *)(a1 + 328) == 3)
  {
    sub_1BA1787C0();
    OUTLINED_FUNCTION_7();
    *(_QWORD *)(v4 + 16) = 0;
    *(_QWORD *)v4 = 0;
LABEL_8:
    *(_QWORD *)(v4 + 8) = 0;
    *(_BYTE *)(v4 + 24) = 7;
    return swift_willThrow();
  }
  if ((*v2 & 1) == 0)
  {
    if ((*(_BYTE *)(a1 + 48) & 1) == 0)
    {
      v12 = *(_QWORD *)(a1 + 344);
      v13 = Cursor.remainingBounds.getter();
      v15 = v14;
      v17 = v16;
      result = OUTLINED_FUNCTION_9();
      *(double *)(result + 16) = v13;
      *(_QWORD *)(result + 24) = v15;
      *(_QWORD *)(result + 32) = v12;
      *(_QWORD *)(result + 40) = v17;
      goto LABEL_10;
    }
LABEL_7:
    sub_1BA1787C0();
    OUTLINED_FUNCTION_7();
    *(_QWORD *)(v4 + 16) = 0;
    *(_QWORD *)v4 = 4;
    goto LABEL_8;
  }
  if (!*(_BYTE *)(a1 + 48))
    goto LABEL_7;
  v5 = *(_QWORD *)(a1 + 360);
  v6 = Cursor.remainingBounds.getter();
  v8 = v7;
  v10 = v9;
  result = OUTLINED_FUNCTION_9();
  *(double *)(result + 16) = v6;
  *(_QWORD *)(result + 24) = v8;
  *(_QWORD *)(result + 32) = v10;
  *(_QWORD *)(result + 40) = v5;
LABEL_10:
  if (qword_1ED5C9B18 != -1)
  {
    v19 = result;
    swift_once();
    result = v19;
  }
  v18 = HIBYTE(word_1ED5C8FE0);
  *(_BYTE *)(result + 48) = word_1ED5C8FE0;
  *(_BYTE *)(result + 49) = v18;
  *a2 = result;
  return result;
}

uint64_t sub_1BA17D120@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BA17CFB8(a1, a2);
}

uint64_t sub_1BA17D134()
{
  sub_1BA19ABD0();
  swift_bridgeObjectRelease();
  sub_1BA19ABD0();
  return 0x70536E6D756C6F63;
}

uint64_t storeEnumTagSinglePayload for ColumnSpecSizer(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BA17D20C + 4 * byte_1BA19CD8D[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1BA17D240 + 4 * byte_1BA19CD88[v4]))();
}

uint64_t sub_1BA17D240(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA17D248(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA17D250);
  return result;
}

uint64_t sub_1BA17D25C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA17D264);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1BA17D268(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA17D270(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ColumnSpecSizer()
{
  return &type metadata for ColumnSpecSizer;
}

uint64_t sub_1BA17D28C()
{
  return swift_deallocObject();
}

uint64_t If<A>(_:then:)(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1BA17D304(a1, a2, a3, a4, a5);
}

{
  return sub_1BA17D304(a1, a2, a3, a4, a5);
}

uint64_t sub_1BA17D2B0()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1BA17D2D4()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 32))();
  OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1BA17D304(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v9;
  _QWORD *v10;

  v9 = *a1;
  type metadata accessor for IfNode(0, a4, a5, a4);
  v10 = (_QWORD *)OUTLINED_FUNCTION_6();
  v10[2] = a4;
  v10[3] = a5;
  v10[4] = a2;
  v10[5] = a3;
  sub_1BA171AC4(v9);
  swift_retain();
  return sub_1BA163CD4();
}

uint64_t sub_1BA17D3AC()
{
  uint64_t v0;

  return sub_1BA17D700(*(uint64_t (**)(void))(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void If<A, B>(_:then:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  OUTLINED_FUNCTION_5_6(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

{
  OUTLINED_FUNCTION_5_6(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t sub_1BA17D3F8()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1BA17D41C()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 64))();
  OUTLINED_FUNCTION_0_0();
}

void sub_1BA17D438()
{
  OUTLINED_FUNCTION_3_11();
  OUTLINED_FUNCTION_6();
  sub_1BA17D628();
}

void sub_1BA17D4D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;

  OUTLINED_FUNCTION_3_11();
  type metadata accessor for IfNode(0, v16, v17, v16);
  v18 = (_QWORD *)OUTLINED_FUNCTION_6();
  v18[2] = v11;
  v18[3] = v10;
  v18[4] = v9;
  v18[5] = a7;
  v18[6] = a8;
  v18[7] = a9;
  v18[8] = v13;
  v18[9] = v12;
  swift_retain();
  swift_retain();
  sub_1BA17D438();
}

uint64_t sub_1BA17D598(uint64_t (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t result;

  sub_1BA1695F0();
  swift_allocObject();
  v8 = sub_1BA19AC6C();
  *v9 = a1();
  type metadata accessor for Node(0, a3, a5, v10);
  result = v8;
  sub_1BA1695B8();
  return result;
}

uint64_t sub_1BA17D614()
{
  uint64_t v0;

  return sub_1BA17D598(*(uint64_t (**)(void))(v0 + 64), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

void sub_1BA17D628()
{
  OUTLINED_FUNCTION_0_15();
  type metadata accessor for ConditionalList();
}

uint64_t sub_1BA17D65C(uint64_t a1)
{
  char v1;
  char v3;

  OUTLINED_FUNCTION_4_9(a1, (uint64_t)&protocol witness table for ConditionalList<A, B>);
  v3 = v1;
  return OUTLINED_FUNCTION_8_6(&v3);
}

uint64_t sub_1BA17D700(uint64_t (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t result;

  sub_1BA1695F0();
  OUTLINED_FUNCTION_6();
  v7 = sub_1BA19AC6C();
  *v8 = a1();
  type metadata accessor for Node(0, a3, a4, v9);
  result = v7;
  sub_1BA1695B8();
  return result;
}

uint64_t sub_1BA17D778(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t result;
  uint64_t v6;

  v3 = *(_QWORD *)v2;
  *(_QWORD *)(v2 + 112) = sub_1BA17D8C4((uint64_t *)v2, a1, a2);
  *(_BYTE *)(v2 + 120) = v4;
  result = swift_bridgeObjectRelease();
  if (*(_QWORD *)(v2 + 112))
  {
    type metadata accessor for Node(0, *(_QWORD *)(v3 + 136), *(_QWORD *)(v3 + 144), v6);
    swift_bridgeObjectRetain();
    sub_1BA19AC60();
    OUTLINED_FUNCTION_9_5();
  }
  return result;
}

uint64_t sub_1BA17D8C4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  uint64_t v22;
  _QWORD v25[3];
  uint64_t v26;
  uint64_t v27;

  v6 = *a1;
  v7 = *(_QWORD *)(*a1 + 136);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = (_QWORD *)MEMORY[0x1E0C80A78](a1 + 5, a2);
  v11 = (char *)&v25[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[8];
  v13 = a1[9];
  __swift_project_boxed_opaque_existential_1(v9, v12);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v13 + 8))(v25, v12, v13);
  v14 = v26;
  v15 = v27;
  __swift_project_boxed_opaque_existential_1(v25, v26);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a3, v7);
  v16 = *(_QWORD *)(v6 + 144);
  v17 = (*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 8))(a2, v11, v7, v16, v14, v15);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  v18 = __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  if ((v17 & 1) != 0)
    return ((uint64_t (*)(uint64_t))a1[10])(v18);
  v21 = (uint64_t (*)(uint64_t))a1[12];
  if (v21)
  {
    v22 = swift_retain();
    v20 = v21(v22);
    sub_1BA162F64((uint64_t)v21);
  }
  else
  {
    type metadata accessor for Node(0, v7, v16, v19);
    return sub_1BA19AC9C();
  }
  return v20;
}

uint64_t sub_1BA17DA3C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = v2;
  v4 = *v2;
  sub_1BA17DC2C(v3, a1, a2);
  type metadata accessor for Node(255, *(_QWORD *)(v4 + 136), *(_QWORD *)(v4 + 144), v5);
  v6 = sub_1BA19ACE4();
  MEMORY[0x1BCCD6858](MEMORY[0x1E0DEAF50], v6);
  if ((sub_1BA19AD38() & 1) == 0)
  {
    swift_bridgeObjectRetain();
    sub_1BA19AC60();
    OUTLINED_FUNCTION_2_9();
    OUTLINED_FUNCTION_7_5();
  }
  OUTLINED_FUNCTION_2_9();
  return 0;
}

uint64_t sub_1BA17DC2C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
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
  uint64_t (*v21)(uint64_t);
  uint64_t v22;
  _QWORD v25[3];
  uint64_t v26;
  uint64_t v27;

  v4 = a2;
  v6 = *a1;
  v7 = *(_QWORD *)(*a1 + 136);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = (_QWORD *)MEMORY[0x1E0C80A78](a1 + 5, a2);
  v11 = (char *)&v25[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[8];
  v13 = a1[9];
  __swift_project_boxed_opaque_existential_1(v9, v12);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v13 + 8))(v25, v12, v13);
  v14 = v26;
  v15 = v27;
  __swift_project_boxed_opaque_existential_1(v25, v26);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a3, v7);
  v16 = *(_QWORD *)(v6 + 144);
  LOBYTE(v4) = (*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 8))(v4, v11, v7, v16, v14, v15);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  v17 = __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  v19 = a1[14];
  if ((v4 & 1) != 0)
  {
    if (!v19 || (a1[15] & 1) == 0)
      return ((uint64_t (*)(uint64_t))a1[10])(v17);
    goto LABEL_7;
  }
  if (v19 && (a1[15] & 1) == 0)
  {
LABEL_7:
    swift_bridgeObjectRetain();
    return v19;
  }
  v21 = (uint64_t (*)(uint64_t))a1[12];
  if (!v21)
  {
    type metadata accessor for Node(0, v7, v16, v18);
    return sub_1BA19AC9C();
  }
  v22 = swift_retain();
  v19 = v21(v22);
  sub_1BA162F64((uint64_t)v21);
  return v19;
}

void IfNode.__allocating_init(kind:identifier:)()
{
  swift_initStackObject();
  IfNode.init(kind:identifier:)();
}

void IfNode.init(kind:identifier:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1BA17DE08()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  swift_release();
  sub_1BA162F64(*(_QWORD *)(v0 + 96));
  return swift_bridgeObjectRelease();
}

uint64_t IfNode.description.getter()
{
  sub_1BA19ABD0();
  sub_1BA17DEB4();
  sub_1BA19AF3C();
  sub_1BA19ABD0();
  return 0;
}

unint64_t sub_1BA17DEB4()
{
  unint64_t result;

  result = qword_1EF2744B0[0];
  if (!qword_1EF2744B0[0])
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, qword_1EF2744B0);
  }
  return result;
}

uint64_t sub_1BA17DF08()
{
  return IfNode.description.getter();
}

uint64_t method lookup function for IfNode()
{
  return swift_lookUpClassMethod();
}

uint64_t LayoutItemList.values.getter()
{
  OUTLINED_FUNCTION_0_14();
  return swift_bridgeObjectRetain();
}

uint64_t LayoutItemList.values.setter(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_0_14();
  *(_QWORD *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*LayoutItemList.values.modify())()
{
  OUTLINED_FUNCTION_0_14();
  return j__swift_endAccess;
}

uint64_t LayoutItemList.__allocating_init()()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_6_5();
  LayoutItemList.init()();
  return v0;
}

uint64_t sub_1BA17E018(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_6_5();
  sub_1BA17E058(a1, a2);
  return v4;
}

uint64_t sub_1BA17E058(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  OUTLINED_FUNCTION_4_10();
  *(_QWORD *)(v2 + 16) = sub_1BA19AB04();
  *(_QWORD *)(v2 + 24) = MEMORY[0x1E0DEE9D8];
  OUTLINED_FUNCTION_0_14();
  *(_QWORD *)(v2 + 16) = a1;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 24) = a2;
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t LayoutItemList.description.getter()
{
  uint64_t v0;
  uint64_t v1;

  sub_1BA19B170();
  sub_1BA19ABD0();
  swift_bridgeObjectRelease();
  sub_1BA19ABD0();
  OUTLINED_FUNCTION_0_14();
  sub_1BA19ADEC();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_7_6();
  MEMORY[0x1BCCD6858](MEMORY[0x1E0DEAF38], v0);
  sub_1BA19ABF4();
  swift_bridgeObjectRelease();
  v1 = sub_1BA19ACE4();
  MEMORY[0x1BCCD6858](MEMORY[0x1E0DEAF68], v1);
  sub_1BA19AFFC();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1BA17E1F8()
{
  return LayoutItemList.description.getter();
}

uint64_t LayoutItemList.flipRightToLeft(bounds:)(double a1, double a2, double a3, double a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD v18[2];
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;

  v5 = v4;
  v10 = *v4;
  OUTLINED_FUNCTION_0_14();
  v23 = v4[2];
  v18[1] = *(_OWORD *)(v10 + 80);
  v19 = a1;
  v20 = a2;
  v21 = a3;
  v22 = a4;
  v11 = sub_1BA19ADEC();
  v12 = sub_1BA19ACE4();
  swift_bridgeObjectRetain();
  v13 = MEMORY[0x1BCCD6858](MEMORY[0x1E0DEAF50], v12);
  v15 = sub_1BA17E460((void (*)(char *, char *))sub_1BA17E7C0, (uint64_t)v18, v12, v11, MEMORY[0x1E0DEDCE8], v13, MEMORY[0x1E0DEDD18], v14);
  swift_bridgeObjectRelease();
  v16 = v5[3];
  swift_bridgeObjectRetain();
  return sub_1BA17E018(v15, v16);
}

uint64_t sub_1BA17E32C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v23;

  v16 = sub_1BA19ADEC();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16, v18);
  v20 = (char *)&v23 - v19;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))((char *)&v23 - v19, a1, v16);
  if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, a2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
    v21 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, double, double, double, double))(*(_QWORD *)(a3 + 24) + 8))(a2, a5, a6, a7, a8);
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(v20, a2);
    v21 = 0;
  }
  return __swift_storeEnumTagSinglePayload(a4, v21, 1, a2);
}

uint64_t sub_1BA17E460(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t result;
  uint64_t v31;
  void (*v32)(char *, _QWORD);
  char *v33;
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
  uint64_t v47;
  uint64_t AssociatedTypeWitness;
  void (*v49)(char *, char *);
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char v54[32];
  uint64_t v55;

  v41 = a5;
  v42 = a8;
  v49 = a1;
  v50 = a2;
  v40 = *(_QWORD *)(a5 - 8);
  OUTLINED_FUNCTION_12_2();
  MEMORY[0x1E0C80A78](v9, v10);
  v51 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v12 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](AssociatedTypeWitness, v13);
  v15 = (char *)&v38 - v14;
  OUTLINED_FUNCTION_12_2();
  MEMORY[0x1E0C80A78](v16, v17);
  v19 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = swift_getAssociatedTypeWitness();
  v43 = *(_QWORD *)(v20 - 8);
  v44 = v20;
  OUTLINED_FUNCTION_12_2();
  MEMORY[0x1E0C80A78](v21, v22);
  OUTLINED_FUNCTION_11_3();
  v39 = v23;
  MEMORY[0x1E0C80A78](v24, v25);
  v27 = (char *)&v38 - v26;
  v28 = sub_1BA19AD14();
  if (!v28)
    return sub_1BA19AC9C();
  v29 = v28;
  v55 = sub_1BA19AB04();
  v45 = sub_1BA19AF24();
  sub_1BA19AEDC();
  v47 = a6;
  result = sub_1BA19AD08();
  if ((v29 & 0x8000000000000000) == 0)
  {
    v31 = v29;
    v46 = v19;
    while (v31)
    {
      v52 = v31;
      v32 = (void (*)(char *, _QWORD))sub_1BA19AD50();
      (*(void (**)(char *))(v12 + 16))(v15);
      v32(v54, 0);
      v33 = v27;
      v34 = v53;
      v49(v15, v51);
      if (v34)
      {
        OUTLINED_FUNCTION_5_7();
        (*(void (**)(char *, uint64_t))(v43 + 8))(v27, v44);
        swift_release();
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v40 + 32))(v42, v51, v41);
      }
      v53 = 0;
      OUTLINED_FUNCTION_5_7();
      sub_1BA19AF0C();
      result = sub_1BA19AD20();
      v31 = v52 - 1;
      if (v52 == 1)
      {
        v36 = v43;
        v35 = v44;
        v37 = v39;
        (*(void (**)(uint64_t, char *, uint64_t))(v43 + 32))(v39, v33, v44);
        sub_1BA19AE64();
        (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v37, v35);
        return v55;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1BA17E780@<X0>(uint64_t *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  uint64_t result;

  result = LayoutItemList.flipRightToLeft(bounds:)(a2, a3, a4, a5);
  *a1 = result;
  return result;
}

uint64_t sub_1BA17E7A8()
{
  return sub_1BA16E0B4((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1BA181984);
}

uint64_t sub_1BA17E7B4(uint64_t a1)
{
  return sub_1BA16E074(a1, (uint64_t (*)(BOOL))sub_1BA181984);
}

uint64_t sub_1BA17E7C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1BA17E32C(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2, *(double *)(v2 + 32), *(double *)(v2 + 40), *(double *)(v2 + 48), *(double *)(v2 + 56));
}

uint64_t method lookup function for LayoutItemList()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LayoutItemList.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t Log.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  return Log.init(_:)(a1, a2);
}

uint64_t Log.init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v4;

  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  v4 = 10;
  return Node.init(kind:identifier:)(&v4, 0, 0);
}

uint64_t sub_1BA17E874()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_1EF274300 != -1)
    swift_once();
  v1 = (id)qword_1EF278E80;
  sub_1BA19AD80();
  sub_1BA17672C();
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1BA19C0E0;
  v4 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  *(_QWORD *)(v2 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v2 + 64) = sub_1BA176834();
  *(_QWORD *)(v2 + 32) = v4;
  *(_QWORD *)(v2 + 40) = v3;
  swift_bridgeObjectRetain();
  sub_1BA19AAEC();

  swift_bridgeObjectRelease();
  return 0;
}

void Log.__allocating_init(kind:identifier:)()
{
  swift_initStackObject();
  Log.init(kind:identifier:)();
}

void Log.init(kind:identifier:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1BA17E9AC()
{
  return swift_bridgeObjectRelease();
}

uint64_t Log.deinit()
{
  uint64_t v0;

  v0 = Node.deinit();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Log.__deallocating_deinit()
{
  Log.deinit();
  return swift_deallocClassInstance();
}

uint64_t Log.description.getter()
{
  swift_bridgeObjectRetain();
  sub_1BA19ABD0();
  swift_bridgeObjectRelease();
  sub_1BA19ABD0();
  return 677867340;
}

uint64_t sub_1BA17EA6C()
{
  return Log.description.getter();
}

uint64_t sub_1BA17EA8C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Log(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Log);
}

uint64_t method lookup function for Log()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Log.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

void LayoutItem.value.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  OUTLINED_FUNCTION_2_11();
  OUTLINED_FUNCTION_0_14();
  v3 = OUTLINED_FUNCTION_6_6();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
  OUTLINED_FUNCTION_3_0();
}

void LayoutItem.value.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  OUTLINED_FUNCTION_2_11();
  OUTLINED_FUNCTION_0_14();
  v3 = OUTLINED_FUNCTION_6_6();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
  swift_endAccess();
  OUTLINED_FUNCTION_3_0();
}

uint64_t (*LayoutItem.value.modify())()
{
  OUTLINED_FUNCTION_0_14();
  return j__swift_endAccess;
}

uint64_t LayoutItem.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  LayoutItem.init(_:)(a1);
  return v2;
}

uint64_t LayoutItem.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 80);
  v3 = sub_1BA19ADEC();
  v4 = *(_QWORD *)(v3 - 8);
  OUTLINED_FUNCTION_8_8();
  v7 = MEMORY[0x1E0C80A78](v5, v6);
  v9 = (char *)&v18 - v8;
  v10 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v7, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (uint64_t)v0 + *(_QWORD *)(v1 + 96);
  OUTLINED_FUNCTION_0_14();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v9, v14, v3);
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    v19 = OUTLINED_FUNCTION_5_8();
    v20 = v15;
    sub_1BA19ABD0();
    return v19;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v13, v9, v2);
    v19 = 0;
    v20 = 0xE000000000000000;
    OUTLINED_FUNCTION_5_8();
    sub_1BA19ABD0();
    swift_bridgeObjectRelease();
    sub_1BA19ABD0();
    sub_1BA19AFF0();
    sub_1BA19ABD0();
    v16 = v19;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v2);
  }
  return v16;
}

uint64_t sub_1BA17ED9C()
{
  return LayoutItem.description.getter();
}

uint64_t LayoutItem.flipRightToLeft(bounds:)(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v12 = *v6;
  v13 = *(_QWORD *)(*v6 + 80);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  OUTLINED_FUNCTION_3_13();
  sub_1BA19ADEC();
  OUTLINED_FUNCTION_8_8();
  MEMORY[0x1E0C80A78](v15, v16);
  v18 = (char *)&v22 - v17;
  v19 = (uint64_t)v6 + *(_QWORD *)(v12 + 96);
  OUTLINED_FUNCTION_0_14();
  v20 = 1;
  if (!__swift_getEnumTagSinglePayload(v19, 1, v13))
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v7, v19, v13);
    (*(void (**)(uint64_t, double, double, double, double))(*(_QWORD *)(*(_QWORD *)(v12 + 88) + 24) + 8))(v13, a3, a4, a5, a6);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v7, v13);
    v20 = 0;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v18, v20, 1, v13);
  return LayoutItem.__allocating_init(_:)((uint64_t)v18);
}

uint64_t sub_1BA17EF0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  uint64_t result;

  result = LayoutItem.flipRightToLeft(bounds:)(a1, a2, a4, a5, a6, a7);
  *a3 = result;
  return result;
}

uint64_t method lookup function for LayoutItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LayoutItem.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

double *sub_1BA17EF48@<X0>(double **a1@<X8>)
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double *result;
  double *v10;
  char v11;

  v2 = Cursor.remainingBounds.getter();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  result = (double *)swift_allocObject();
  v10 = result;
  result[2] = v2;
  *((_QWORD *)result + 3) = v4;
  *((_QWORD *)result + 4) = v6;
  *((_QWORD *)result + 5) = v8;
  if (qword_1ED5C9B18 != -1)
    result = (double *)swift_once();
  v11 = HIBYTE(word_1ED5C8FE0);
  *((_BYTE *)v10 + 48) = word_1ED5C8FE0;
  *((_BYTE *)v10 + 49) = v11;
  *a1 = v10;
  return result;
}

double *sub_1BA17F000@<X0>(double **a1@<X8>)
{
  return sub_1BA17EF48(a1);
}

ValueMetadata *type metadata accessor for FillSizer()
{
  return &type metadata for FillSizer;
}

uint64_t sub_1BA17F024()
{
  return swift_deallocObject();
}

uint64_t sub_1BA17F034()
{
  id v0;
  uint64_t result;

  v0 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  sub_1BA17F534(v0);
  sub_1BA17F5A0();
  result = sub_1BA19ADE0();
  qword_1EF278E80 = result;
  return result;
}

uint64_t static Logging.debuggingEnabled.getter()
{
  OUTLINED_FUNCTION_0_16();
  return byte_1ED5C9B08;
}

uint64_t (*static Logging.debuggingEnabled.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t Logging.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t Logging.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t method lookup function for Logging()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1BA17F168(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD v12[3];
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;

  v12[2] = a3;
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v3 = result;
    v12[1] = v12;
    v15 = MEMORY[0x1E0DEE9D8];
    sub_1BA16F1D8(0, 0, 0);
    v4 = v15;
    if (v3)
    {
      v5 = 0;
      do
      {
        if (v5 >= v3 - 1)
        {
          v13 = 2105376;
          v14 = 0xE300000000000000;
          sub_1BA19ABD0();
          v7 = v13;
          v6 = v14;
        }
        else
        {
          v6 = 0xE400000000000000;
          v7 = 2082480160;
        }
        v15 = v4;
        v9 = *(_QWORD *)(v4 + 16);
        v8 = *(_QWORD *)(v4 + 24);
        if (v9 >= v8 >> 1)
        {
          sub_1BA16F1D8(v8 > 1, v9 + 1, 1);
          v4 = v15;
        }
        ++v5;
        *(_QWORD *)(v4 + 16) = v9 + 1;
        v10 = v4 + 16 * v9;
        *(_QWORD *)(v10 + 32) = v7;
        *(_QWORD *)(v10 + 40) = v6;
      }
      while (v3 != v5);
    }
    v13 = v4;
    sub_1BA173858();
    sub_1BA16F2FC();
    v11 = sub_1BA19AB70();
    swift_release();
    return v11;
  }
  return result;
}

uint64_t sub_1BA17F2D0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = *a1;
  if (a3)
  {
    type metadata accessor for Node(0, *(_QWORD *)(v4 + 80), *(_QWORD *)(v4 + 88), a4);
    sub_1BA19AFF0();
    sub_1BA19ABD0();
    sub_1BA19ABD0();
    sub_1BA19ABD0();
  }
  else
  {
    type metadata accessor for Node(0, *(_QWORD *)(v4 + 80), *(_QWORD *)(v4 + 88), a4);
    sub_1BA19AFF0();
  }
  return 0;
}

uint64_t sub_1BA17F390(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGRect v9;
  CGRect v10;

  sub_1BA19AEA0();
  swift_bridgeObjectRelease();
  sub_1BA19ACF0();
  sub_1BA19ABD0();
  swift_bridgeObjectRelease();
  sub_1BA19ABD0();
  sub_1BA19ACF0();
  sub_1BA19ABD0();
  swift_bridgeObjectRelease();
  sub_1BA19ABD0();
  v9.origin.x = a1;
  v9.origin.y = a2;
  v9.size.width = a3;
  v9.size.height = a4;
  if (CGRectGetWidth(v9) != 1.79769313e308)
    sub_1BA19ACF0();
  sub_1BA19ABD0();
  swift_bridgeObjectRelease();
  sub_1BA19ABD0();
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  if (CGRectGetHeight(v10) != 1.79769313e308)
    sub_1BA19ACF0();
  sub_1BA19ABD0();
  swift_bridgeObjectRelease();
  sub_1BA19ABD0();
  return 40;
}

uint64_t sub_1BA17F534(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_bundleIdentifier);

  if (!v2)
    return 0;
  v3 = sub_1BA19ABB8();

  return v3;
}

unint64_t sub_1BA17F5A0()
{
  unint64_t result;

  result = qword_1EF274538;
  if (!qword_1EF274538)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF274538);
  }
  return result;
}

ValueMetadata *type metadata accessor for NonIntegralSizer()
{
  return &type metadata for NonIntegralSizer;
}

uint64_t sub_1BA17F5EC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v14;

  v8 = *a1;
  v9 = swift_allocObject();
  v11 = v4[3];
  v10 = v4[4];
  __swift_project_boxed_opaque_existential_1(v4, v11);
  result = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v10 + 16))(a1, a2, a3, *(_QWORD *)(v8 + 80), *(_QWORD *)(v8 + 88), v11, v10);
  if (v14)
    return swift_deallocUninitializedObject();
  *a4 = v9 | 0x5000000000000000;
  return result;
}

uint64_t sub_1BA17F6C8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BA17F5EC(a1, a2, a3, a4);
}

uint64_t sub_1BA17F6DC()
{
  sub_1BA19AEA0();
  sub_1BA17C214();
  sub_1BA19AF3C();
  sub_1BA19ABD0();
  return 0;
}

uint64_t sub_1BA17F774()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BA17F79C@<X0>(uint64_t a1@<X3>, uint64_t a2@<X4>, uint64_t *a3@<X8>)
{
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _BYTE v17[16];
  double v18;
  double v19;
  double v20;
  double v21;

  v5 = *v3;
  type metadata accessor for DimensionCursor(0, a1, a2, a1);
  sub_1BA184BF8((uint64_t)v17);
  if (v17[0] == 3)
  {
    sub_1BA1787C0();
    swift_allocError();
    *(_QWORD *)(v6 + 8) = 0;
    *(_QWORD *)(v6 + 16) = 0;
    *(_QWORD *)v6 = 0;
    *(_BYTE *)(v6 + 24) = 7;
    return swift_willThrow();
  }
  else
  {
    v8 = v21;
    v9 = v20;
    v10 = v19;
    v11 = v18;
    v12 = dbl_1BA19D130[v17[0]];
    v13 = OUTLINED_FUNCTION_0_17();
    v14 = DimensionCursor.position.getter();
    v15 = OUTLINED_FUNCTION_0_17();
    result = swift_allocObject();
    if (__OFSUB__(v5, 1))
    {
      __break(1u);
    }
    else
    {
      v16 = (v10 - v9 - v8 - v11 * (v12 + -1.0)) / v12;
      *(double *)(result + 16) = v13 + (v11 + v16) * ceil((v14 - v15) / (v11 + v16));
      *(double *)(result + 24) = v11 * (double)(v5 - 1) + v16 * (double)v5;
      *(_BYTE *)(result + 32) = 1;
      *a3 = result;
    }
  }
  return result;
}

uint64_t sub_1BA17F93C@<X0>(uint64_t a1@<X3>, uint64_t a2@<X4>, uint64_t *a3@<X8>)
{
  return sub_1BA17F79C(a1, a2, a3);
}

uint64_t sub_1BA17F950()
{
  sub_1BA19AFD8();
  sub_1BA19ABD0();
  swift_bridgeObjectRelease();
  sub_1BA19ABD0();
  return 0x28736E6D756C6F63;
}

ValueMetadata *type metadata accessor for ColumnDimensionSizer()
{
  return &type metadata for ColumnDimensionSizer;
}

uint64_t sub_1BA17F9E4()
{
  return swift_deallocObject();
}

_QWORD *LayoutMarginAdjuster.__allocating_init(top:left:bottom:right:)(_QWORD *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = (_QWORD *)swift_allocObject();
  v9 = *a2;
  v10 = *a3;
  v11 = *a4;
  result[2] = *a1;
  result[3] = v9;
  result[4] = v10;
  result[5] = v11;
  return result;
}

unint64_t + infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  OUTLINED_FUNCTION_5_10();
  v2 = OUTLINED_FUNCTION_3_15();
  *(_QWORD *)(v2 + 16) = v0;
  *(_QWORD *)(v2 + 24) = v1;
  v3 = OUTLINED_FUNCTION_2_13(v2 | 0x2000000000000000);
  return OUTLINED_FUNCTION_0_18(v3);
}

unint64_t - infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  OUTLINED_FUNCTION_5_10();
  v2 = OUTLINED_FUNCTION_3_15();
  *(_QWORD *)(v2 + 16) = v0;
  *(_QWORD *)(v2 + 24) = v1;
  v3 = OUTLINED_FUNCTION_2_13(v2 | 0x4000000000000000);
  return OUTLINED_FUNCTION_0_18(v3);
}

unint64_t * infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  OUTLINED_FUNCTION_5_10();
  v2 = OUTLINED_FUNCTION_3_15();
  *(_QWORD *)(v2 + 16) = v0;
  *(_QWORD *)(v2 + 24) = v1;
  v3 = OUTLINED_FUNCTION_2_13(v2 | 0x6000000000000000);
  return OUTLINED_FUNCTION_0_18(v3);
}

unint64_t / infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  OUTLINED_FUNCTION_5_10();
  v2 = OUTLINED_FUNCTION_3_15();
  *(_QWORD *)(v2 + 16) = v0;
  *(_QWORD *)(v2 + 24) = v1;
  v3 = OUTLINED_FUNCTION_2_13(v2 | 0x8000000000000000);
  return OUTLINED_FUNCTION_0_18(v3);
}

unint64_t LayoutMarginAdjuster.top.getter@<X0>(unint64_t *a1@<X8>)
{
  uint64_t v1;

  return OUTLINED_FUNCTION_1_16(*(_QWORD *)(v1 + 16), a1);
}

unint64_t LayoutMarginAdjuster.left.getter@<X0>(unint64_t *a1@<X8>)
{
  uint64_t v1;

  return OUTLINED_FUNCTION_1_16(*(_QWORD *)(v1 + 24), a1);
}

unint64_t LayoutMarginAdjuster.bottom.getter@<X0>(unint64_t *a1@<X8>)
{
  uint64_t v1;

  return OUTLINED_FUNCTION_1_16(*(_QWORD *)(v1 + 32), a1);
}

unint64_t LayoutMarginAdjuster.right.getter@<X0>(unint64_t *a1@<X8>)
{
  uint64_t v1;

  return OUTLINED_FUNCTION_1_16(*(_QWORD *)(v1 + 40), a1);
}

unint64_t sub_1BA17FB44(unint64_t result)
{
  switch(result >> 61)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
      result = swift_retain();
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1BA17FB74(unint64_t result)
{
  switch(result >> 61)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
      result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BA17FBA4()
{
  uint64_t v0;

  sub_1BA17FB74(*(_QWORD *)(v0 + 16));
  sub_1BA17FB74(*(_QWORD *)(v0 + 24));
  return swift_deallocObject();
}

unint64_t *initializeBufferWithCopyOfBuffer for LayoutMarginAdjustment(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a2;
  sub_1BA17FB44(*a2);
  *a1 = v3;
  return a1;
}

unint64_t destroy for LayoutMarginAdjustment(unint64_t *a1)
{
  return sub_1BA17FB74(*a1);
}

unint64_t *assignWithCopy for LayoutMarginAdjustment(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a2;
  sub_1BA17FB44(*a2);
  v4 = *a1;
  *a1 = v3;
  sub_1BA17FB74(v4);
  return a1;
}

unint64_t *assignWithTake for LayoutMarginAdjustment(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a1;
  *a1 = *a2;
  sub_1BA17FB74(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for LayoutMarginAdjustment(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0x7B && *(_BYTE *)(a1 + 8))
    {
      v2 = *(_DWORD *)a1 + 122;
    }
    else
    {
      v2 = (((*(_QWORD *)a1 >> 57) >> 4) | (8 * ((*(_QWORD *)a1 >> 57) & 8 | *(_QWORD *)a1 & 7))) ^ 0x7F;
      if (v2 >= 0x7A)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t sub_1BA17FCC4(_QWORD *a1)
{
  uint64_t v1;

  v1 = *a1 >> 61;
  if (v1 <= 4)
    return v1;
  else
    return (*a1 >> 3) + 5;
}

unint64_t *sub_1BA17FCE0(unint64_t *result, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  if (a2 < 5)
  {
    v2 = *result & 0xFFFFFFFFFFFFFF8;
    v3 = a2 << 61;
  }
  else
  {
    v2 = 8 * (a2 - 5);
    v3 = 0xA000000000000000;
  }
  *result = v2 | v3;
  return result;
}

uint64_t method lookup function for LayoutMarginAdjuster()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LayoutMarginAdjuster.__allocating_init(top:left:bottom:right:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_1BA17FD24()
{
  _QWORD *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v20)(uint64_t, uint64_t, char *, _QWORD *, uint64_t *, uint64_t, uint64_t, double, double, double, double);
  uint64_t v21;
  _QWORD v22[2];
  char v23;
  __int128 v24;
  uint64_t v25;
  _QWORD v26[3];
  uint64_t v27;
  uint64_t v28;

  OUTLINED_FUNCTION_4_11();
  v6 = v5;
  v8 = v7;
  v10 = *v9;
  sub_1BA16AECC((uint64_t)(v0 + 68), (uint64_t)&v24);
  if (!v25)
    return sub_1BA16AE90((uint64_t)&v24);
  sub_1BA16DE20(&v24, (uint64_t)v26);
  v11 = OUTLINED_FUNCTION_2_14();
  if (sub_1BA180E80(v11, v12, v13, v14))
  {
    v15 = v27;
    v16 = v28;
    __swift_project_boxed_opaque_existential_1(v26, v27);
    v23 = v10;
    OUTLINED_FUNCTION_0_14();
    v17 = v0[8];
    if (v17)
      v18 = v0[7];
    else
      v18 = 0;
    v22[0] = v18;
    v22[1] = v17;
    v21 = v0[11];
    v20 = *(void (**)(uint64_t, uint64_t, char *, _QWORD *, uint64_t *, uint64_t, uint64_t, double, double, double, double))(v16 + 16);
    swift_retain();
    swift_bridgeObjectRetain();
    v20(v8, v6, &v23, v22, &v21, v15, v16, v4, v3, v2, v1);
    swift_bridgeObjectRelease();
    swift_release();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
}

void sub_1BA17FE6C(uint64_t a1)
{
  uint64_t v1;
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  char v8;
  uint64_t v9;
  char v10;
  char v11;
  unint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  int64_t v19;
  double v20;
  double v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  char v30;
  CGFloat Width;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  CGFloat MaxY;
  double v41;
  CGFloat Height;
  double v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  CGFloat MaxX;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  double v57;
  double v58;
  double v59;
  uint64_t v60;
  double v61;
  double v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  v6 = v1;
  OUTLINED_FUNCTION_4_11();
  v65.origin.x = 0.0;
  v65.origin.y = 0.0;
  v65.size.width = 0.0;
  v65.size.height = 0.0;
  if (CGRectEqualToRect(v63, v65))
    return;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11();
  if (v8)
    return;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_11();
  if (v8)
    return;
  if (*(_QWORD *)(a1 + 16))
  {
    OUTLINED_FUNCTION_11_4();
    sub_1BA19B110();
    v9 = sub_1BA19B128();
    v10 = *(_BYTE *)(a1 + 32);
    v11 = v10 & 0x3F;
    for (i = v9 & ~(-1 << v10);
          ((*(_QWORD *)(a1 + 56 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0;
          i = (i + 1) & ~(-1 << v10))
    {
      v13 = *(_QWORD *)(a1 + 48) + 24 * i;
      if (*(_BYTE *)(v13 + 16) == 1 && *(_OWORD *)v13 == 0)
      {
        v20 = 0.0;
        v21 = 0.0;
LABEL_38:
        v30 = *(_BYTE *)(v6 + 48);
        if ((v30 & 1) != 0)
        {
          v61 = v21;
          Width = CGRectGetWidth(*(CGRect *)(v6 + 96));
          OUTLINED_FUNCTION_0_14();
          v62 = v20;
          v32 = v20 + *(double *)(v6 + 512) + v2;
          *(CGFloat *)(v6 + 504) = Width;
          *(double *)(v6 + 512) = v32;
          OUTLINED_FUNCTION_0_14();
          v33 = v5;
          v34 = v4;
          v35 = v3;
          v36 = v2;
          if ((*(_BYTE *)(v6 + 480) & 1) == 0)
          {
            v33 = OUTLINED_FUNCTION_1_17();
            v34 = v37;
            v35 = v38;
            v36 = v39;
          }
          *(double *)(v6 + 448) = v33;
          *(CGFloat *)(v6 + 456) = v34;
          *(CGFloat *)(v6 + 464) = v35;
          *(CGFloat *)(v6 + 472) = v36;
          *(_BYTE *)(v6 + 480) = 0;
          OUTLINED_FUNCTION_0_14();
          v60 = *(_QWORD *)(v6 + 488);
          v64.origin.x = v33;
          v64.origin.y = v34;
          v64.size.width = v35;
          v64.size.height = v36;
          MaxY = CGRectGetMaxY(v64);
          v21 = v61;
          *(_QWORD *)(v6 + 488) = v60;
          *(CGFloat *)(v6 + 496) = MaxY;
          v20 = v62;
        }
        else
        {
          OUTLINED_FUNCTION_0_14();
          v41 = v21 + *(double *)(v6 + 504) + v3;
          Height = CGRectGetHeight(*(CGRect *)(v6 + 96));
          *(double *)(v6 + 504) = v41;
          *(CGFloat *)(v6 + 512) = Height;
          OUTLINED_FUNCTION_0_14();
          v43 = OUTLINED_FUNCTION_2_14();
          if ((v47 & 1) == 0)
            v43 = OUTLINED_FUNCTION_1_17();
          *(double *)(v6 + 448) = v43;
          *(_QWORD *)(v6 + 456) = v44;
          *(_QWORD *)(v6 + 464) = v45;
          *(_QWORD *)(v6 + 472) = v46;
          *(_BYTE *)(v6 + 480) = 0;
          MaxX = CGRectGetMaxX(*(CGRect *)&v43);
          OUTLINED_FUNCTION_0_14();
          *(CGFloat *)(v6 + 488) = MaxX;
        }
        if (*(_QWORD *)(a1 + 16))
        {
          OUTLINED_FUNCTION_11_4();
          sub_1BA19B110();
          v49 = sub_1BA19B128();
          v50 = -1 << *(_BYTE *)(a1 + 32);
          v51 = v49 & ~v50;
          if (((*(_QWORD *)(a1 + 56 + ((v51 >> 3) & 0xFFFFFFFFFFFFF8)) >> v51) & 1) != 0)
          {
            v52 = ~v50;
            while (1)
            {
              v53 = *(_QWORD *)(a1 + 48) + 24 * v51;
              if (*(_BYTE *)(v53 + 16) == 1 && !(*(_QWORD *)v53 ^ 1 | *(_QWORD *)(v53 + 8)))
                break;
              v51 = (v51 + 1) & v52;
              if (((*(_QWORD *)(a1 + 56 + ((v51 >> 3) & 0xFFFFFFFFFFFFF8)) >> v51) & 1) == 0)
                return;
            }
            OUTLINED_FUNCTION_0_14();
            v54 = *(_QWORD *)(v6 + 64);
            if (v54)
            {
              v55 = *(_QWORD *)(v6 + 56);
              v56 = *(double *)(v6 + 72);
              v57 = *(double *)(v6 + 80);
              swift_bridgeObjectRetain();
              if ((v30 & 1) != 0)
              {
                v58 = v57 - (v20 + OUTLINED_FUNCTION_4());
                if (v58 < 0.0)
                  v57 = 0.0;
                else
                  v57 = v58;
                *(_QWORD *)(v6 + 56) = v55;
                *(_QWORD *)(v6 + 64) = v54;
                *(double *)(v6 + 72) = v56;
              }
              else
              {
                v59 = v56 - (v21 + OUTLINED_FUNCTION_5());
                if (v59 < 0.0)
                  v59 = 0.0;
                *(_QWORD *)(v6 + 56) = v55;
                *(_QWORD *)(v6 + 64) = v54;
                *(double *)(v6 + 72) = v59;
              }
              *(double *)(v6 + 80) = v57;
              swift_bridgeObjectRelease();
            }
          }
        }
        return;
      }
    }
  }
  else
  {
    v11 = *(_BYTE *)(a1 + 32) & 0x3F;
  }
  v14 = a1 + 56;
  v15 = 1 << v11;
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & *(_QWORD *)(a1 + 56);
  OUTLINED_FUNCTION_0_14();
  v18 = 0;
  v19 = (unint64_t)(v15 + 63) >> 6;
  v20 = 0.0;
  v21 = 0.0;
  while (v17)
  {
    v22 = __clz(__rbit64(v17));
    v17 &= v17 - 1;
    v23 = v22 | (v18 << 6);
LABEL_32:
    v27 = *(_QWORD *)(a1 + 48) + 24 * v23;
    if (*(_BYTE *)(v27 + 16) == 1)
    {
      if (*(_OWORD *)v27 >= 2uLL)
      {
        v28 = v4 - *(double *)(v6 + 496);
        v29 = v5 - *(double *)(v6 + 488);
        goto LABEL_36;
      }
    }
    else
    {
      v29 = *(double *)v27;
      v28 = *(double *)(v27 + 8);
LABEL_36:
      v21 = v21 + v29;
      v20 = v20 + v28;
    }
  }
  v24 = v18 + 1;
  if (__OFADD__(v18, 1))
  {
    __break(1u);
    goto LABEL_63;
  }
  if (v24 >= v19)
    goto LABEL_38;
  v25 = *(_QWORD *)(v14 + 8 * v24);
  ++v18;
  if (v25)
    goto LABEL_31;
  v18 = v24 + 1;
  if (v24 + 1 >= v19)
    goto LABEL_38;
  v25 = *(_QWORD *)(v14 + 8 * v18);
  if (v25)
    goto LABEL_31;
  v18 = v24 + 2;
  if (v24 + 2 >= v19)
    goto LABEL_38;
  v25 = *(_QWORD *)(v14 + 8 * v18);
  if (v25)
  {
LABEL_31:
    v17 = (v25 - 1) & v25;
    v23 = __clz(__rbit64(v25)) + (v18 << 6);
    goto LABEL_32;
  }
  v26 = v24 + 3;
  if (v26 >= v19)
    goto LABEL_38;
  v25 = *(_QWORD *)(v14 + 8 * v26);
  if (v25)
  {
    v18 = v26;
    goto LABEL_31;
  }
  while (1)
  {
    v18 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v18 >= v19)
      goto LABEL_38;
    v25 = *(_QWORD *)(v14 + 8 * v18);
    ++v26;
    if (v25)
      goto LABEL_31;
  }
LABEL_63:
  __break(1u);
}

double Cursor.remainingBounds.getter()
{
  uint64_t v0;
  double v1;
  CGRect v3;
  CGRect v4;

  OUTLINED_FUNCTION_0_14();
  v1 = *(double *)(v0 + 488);
  v3.origin.x = OUTLINED_FUNCTION_10_4();
  CGRectGetWidth(v3);
  v4.origin.x = OUTLINED_FUNCTION_10_4();
  CGRectGetHeight(v4);
  return v1;
}

uint64_t Pass.DynamicOptions.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

double Pass.DynamicOptions.flexibleArea.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

uint64_t Pass.cursorFramePass.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v1[1];
  if (v2)
    v3 = *v1;
  else
    v3 = 0;
  *a1 = v3;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

double Cursor.origin.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

double Cursor.initialOrigin.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 32);
}

void Cursor.direction.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 48);
}

uint64_t Cursor.pass.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  OUTLINED_FUNCTION_0_14();
  v3 = *(_QWORD *)(v1 + 80);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 56);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 64);
  *(_QWORD *)(a1 + 24) = v3;
  return swift_bridgeObjectRetain();
}

uint64_t Cursor.resizing.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 88);
  return swift_retain();
}

double Cursor.bounds.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 96);
}

uint64_t Cursor.layoutOptions.getter@<X0>(void *a1@<X8>)
{
  uint64_t v1;
  const void *v3;
  _BYTE v5[200];

  v3 = (const void *)(v1 + 128);
  OUTLINED_FUNCTION_7_0(v5, v3);
  OUTLINED_FUNCTION_7_0(a1, v3);
  return sub_1BA1667D4((uint64_t)v5);
}

uint64_t Cursor.reversed.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 440);
}

double Cursor.scaleFactor.getter()
{
  uint64_t v0;
  uint64_t v1;
  double v2;
  double v3;
  char v4;

  v1 = *(unsigned __int8 *)(v0 + 328);
  v2 = 1.0;
  if (v1 != 3 && (*(_BYTE *)(v0 + 336) & 4) == 0)
  {
    CGRectGetWidth(*(CGRect *)(v0 + 376));
    OUTLINED_FUNCTION_11();
    if (!v4)
      return v3 / dbl_1BA19D418[(char)v1];
  }
  return v2;
}

double Cursor.absoluteFrame.getter()
{
  uint64_t v0;
  double v1;

  v1 = *(double *)(v0 + 32);
  sub_1BA1805C0(v0);
  sub_1BA180690(v0);
  return v1;
}

double sub_1BA1805C0(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double MaxX;
  double v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGRect v11;
  CGRect v12;

  v2 = a1 + 480;
  v3 = *(double *)(a1 + 16);
  swift_beginAccess();
  MaxX = v3;
  if ((*(_BYTE *)(a1 + 480) & 1) == 0)
    MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 448));
  if (v3 > MaxX)
    MaxX = v3;
  v5 = MaxX - v3;
  if (*(_BYTE *)(v2 + 57) == 1)
  {
    v6 = *(double *)(a1 + 96);
    v7 = *(double *)(a1 + 104);
    v8 = *(double *)(a1 + 112);
    v9 = *(double *)(a1 + 120);
    v11.origin.x = v6;
    v11.origin.y = v7;
    v11.size.width = v8;
    v11.size.height = v9;
    if (CGRectGetWidth(v11) != 1.79769313e308)
    {
      v12.origin.x = v6;
      v12.origin.y = v7;
      v12.size.width = v8;
      v12.size.height = v9;
      return CGRectGetWidth(v12);
    }
  }
  return v5;
}

double sub_1BA180690(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double MaxY;
  double v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGRect v11;
  CGRect v12;

  v2 = a1 + 480;
  v3 = *(double *)(a1 + 24);
  swift_beginAccess();
  MaxY = v3;
  if ((*(_BYTE *)(a1 + 480) & 1) == 0)
    MaxY = CGRectGetMaxY(*(CGRect *)(a1 + 448));
  if (v3 > MaxY)
    MaxY = v3;
  v5 = MaxY - v3;
  if (*(_BYTE *)(v2 + 58) == 1)
  {
    v6 = *(double *)(a1 + 96);
    v7 = *(double *)(a1 + 104);
    v8 = *(double *)(a1 + 112);
    v9 = *(double *)(a1 + 120);
    v11.origin.x = v6;
    v11.origin.y = v7;
    v11.size.width = v8;
    v11.size.height = v9;
    if (CGRectGetHeight(v11) != 1.79769313e308)
    {
      v12.origin.x = v6;
      v12.origin.y = v7;
      v12.size.width = v8;
      v12.size.height = v9;
      return CGRectGetHeight(v12);
    }
  }
  return v5;
}

__n128 Cursor.filledBounds.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v3;
  __n128 result;
  __int128 v5;

  OUTLINED_FUNCTION_0_14();
  v3 = *(_BYTE *)(v1 + 480);
  result = *(__n128 *)(v1 + 448);
  v5 = *(_OWORD *)(v1 + 464);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 32) = v3;
  return result;
}

double Cursor.position.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_14();
  return *(double *)(v0 + 488);
}

double Cursor.filledArea.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_14();
  return *(double *)(v0 + 504);
}

void Cursor.sizingBehavior.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 538);
  *a1 = *(_BYTE *)(v1 + 537);
  a1[1] = v2;
}

uint64_t sub_1BA180820(uint64_t a1, __int128 *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, char *a8, uint64_t *a9, char a10)
{
  const void *v17;
  char v18;
  char v19;
  char v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  double v25;
  void *v26;
  __int128 *v27;
  char *v28;
  __int128 *v29;
  double v30;
  double v31;
  double v32;
  uint64_t v34;
  char v35[2];
  __int128 v36;
  __int128 v37;
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[208];

  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_7_0(v46, v17);
  v18 = *a3;
  v19 = *a8;
  v20 = a8[1];
  v21 = *a9;
  v22 = a2[1];
  v39 = *a2;
  v40 = v22;
  v23 = a2[3];
  v41 = a2[2];
  v42 = v23;
  v24 = a2[5];
  v43 = a2[4];
  v44 = v24;
  v45 = a2[6];
  v38 = v18;
  v36 = 0u;
  v37 = 0u;
  v35[0] = v19;
  v35[1] = v20;
  v34 = v21;
  v25 = OUTLINED_FUNCTION_2_14();
  return sub_1BA180924(v26, v27, v28, a4, v29, a5, a6, a7, v25, v30, v31, v32, v35, &v34, a10);
}

uint64_t sub_1BA180924(void *a1, __int128 *a2, char *a3, uint64_t a4, __int128 *a5, uint64_t a6, uint64_t a7, char a8, double a9, double a10, double a11, double a12, char *a13, uint64_t *a14, char a15)
{
  swift_allocObject();
  return sub_1BA1809FC(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
}

uint64_t sub_1BA1809FC(void *__src, __int128 *a2, char *a3, uint64_t a4, __int128 *a5, uint64_t a6, uint64_t a7, char a8, double a9, double a10, double a11, double a12, char *a13, uint64_t *a14, char a15)
{
  uint64_t v15;
  char v19;
  char v20;
  char v21;
  uint64_t v22;
  double v23;
  double v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  v34 = *a2;
  v32 = a2[2];
  v33 = a2[1];
  v30 = a2[4];
  v31 = a2[3];
  v28 = a2[6];
  v29 = a2[5];
  v19 = *a3;
  v26 = a5[1];
  v27 = *a5;
  v20 = *a13;
  v21 = a13[1];
  v22 = *a14;
  *(_OWORD *)(v15 + 448) = 0u;
  *(_OWORD *)(v15 + 464) = 0u;
  *(_BYTE *)(v15 + 480) = 1;
  *(_QWORD *)(v15 + 504) = 0;
  *(_QWORD *)(v15 + 512) = 0;
  *(double *)(v15 + 16) = a9;
  *(double *)(v15 + 24) = a10;
  if (a8)
  {
    if (a8 == 1)
    {
      v23 = *(double *)&a6 + a9;
      v24 = *(double *)&a7 + a10;
      a9 = *(double *)&a6 + a9;
      a10 = *(double *)&a7 + a10;
    }
    else
    {
      v23 = a9;
      v24 = a10;
    }
  }
  else
  {
    v23 = *(double *)&a6 + a9;
    v24 = *(double *)&a7 + a10;
  }
  *(double *)(v15 + 32) = v23;
  *(double *)(v15 + 40) = v24;
  *(double *)(v15 + 488) = a9;
  *(double *)(v15 + 496) = a10;
  *(_QWORD *)(v15 + 96) = 0;
  *(_QWORD *)(v15 + 104) = 0;
  *(double *)(v15 + 112) = a11;
  *(double *)(v15 + 120) = a12;
  memcpy((void *)(v15 + 128), __src, 0xC8uLL);
  *(_OWORD *)(v15 + 328) = v34;
  *(_OWORD *)(v15 + 344) = v33;
  *(_OWORD *)(v15 + 360) = v32;
  *(_OWORD *)(v15 + 376) = v31;
  *(_OWORD *)(v15 + 392) = v30;
  *(_OWORD *)(v15 + 408) = v29;
  *(_OWORD *)(v15 + 424) = v28;
  *(_BYTE *)(v15 + 48) = v19;
  *(_OWORD *)(v15 + 56) = v27;
  *(_OWORD *)(v15 + 72) = v26;
  *(double *)(v15 + 520) = *(double *)&a6;
  *(double *)(v15 + 528) = *(double *)&a7;
  *(_BYTE *)(v15 + 536) = a8;
  *(_BYTE *)(v15 + 537) = v20;
  *(_BYTE *)(v15 + 538) = v21;
  *(_QWORD *)(v15 + 88) = v22;
  sub_1BA16CFB0(a4, v15 + 544);
  *(_BYTE *)(v15 + 440) = a15 & 1;
  return v15;
}

char *sub_1BA180B94()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  _QWORD v29[2];
  uint64_t v30;
  __int128 v31;
  double v32;
  uint64_t v33;
  _BYTE v34[40];
  __int128 v35[7];
  _BYTE v36[200];
  _BYTE v37[200];
  char v38[2];
  char v39;

  v1 = (uint64_t)v0;
  v2 = *v0;
  v3 = sub_1BA19AAD4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  if (*(_QWORD *)(v1 + 64))
  {
    sub_1BA1787C0();
    swift_allocError();
    *(_QWORD *)(v8 + 8) = 0;
    *(_QWORD *)(v8 + 16) = 0;
    *(_QWORD *)v8 = 2;
    *(_BYTE *)(v8 + 24) = 7;
    swift_willThrow();
  }
  else
  {
    v9 = sub_1BA180DAC(v1);
    v11 = v10;
    sub_1BA19AAC8();
    v12 = sub_1BA19AABC();
    v29[1] = v2;
    v13 = v12;
    v15 = v14;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    v16 = *(double *)(v1 + 112);
    v17 = *(double *)(v1 + 120);
    v18 = *(double *)(v1 + 16);
    v19 = *(double *)(v1 + 24);
    OUTLINED_FUNCTION_6_2(v37);
    OUTLINED_FUNCTION_6_2(v36);
    v20 = *(_OWORD *)(v1 + 344);
    v35[0] = *(_OWORD *)(v1 + 328);
    v35[1] = v20;
    v21 = *(_OWORD *)(v1 + 376);
    v35[2] = *(_OWORD *)(v1 + 360);
    v35[3] = v21;
    v22 = *(_OWORD *)(v1 + 408);
    v35[4] = *(_OWORD *)(v1 + 392);
    v35[5] = v22;
    v23 = *(_OWORD *)(v1 + 424);
    v39 = *(_BYTE *)(v1 + 48);
    v35[6] = v23;
    sub_1BA16AECC(v1 + 544, (uint64_t)v34);
    *(_QWORD *)&v31 = v13;
    *((_QWORD *)&v31 + 1) = v15;
    v32 = v9;
    v33 = v11;
    v24 = *(_QWORD *)(v1 + 520);
    v25 = *(_QWORD *)(v1 + 528);
    v26 = *(_BYTE *)(v1 + 538);
    v27 = *(_BYTE *)(v1 + 536);
    v38[0] = *(_BYTE *)(v1 + 537);
    v38[1] = v26;
    v30 = *(_QWORD *)(v1 + 88);
    v7 = (char *)sub_1BA180924(v36, v35, &v39, (uint64_t)v34, &v31, v24, v25, v27, v18, v19, v16, v17, v38, &v30, *(_BYTE *)(v1 + 440));
    sub_1BA1667D4((uint64_t)v37);
    swift_retain();
  }
  return v7;
}

double sub_1BA180DAC(uint64_t a1)
{
  char v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  double Width;
  CGRect v9;
  CGRect v10;
  CGRect v11;

  v2 = *(_BYTE *)(a1 + 48);
  v4 = *(double *)(a1 + 96);
  v3 = *(double *)(a1 + 104);
  v6 = *(double *)(a1 + 112);
  v5 = *(double *)(a1 + 120);
  v9.origin.x = v4;
  v9.origin.y = v3;
  v9.size.width = v6;
  v9.size.height = v5;
  Width = CGRectGetWidth(v9);
  if ((v2 & 1) != 0)
  {
    v10.origin.x = v4;
    v10.origin.y = v3;
    v10.size.width = v6;
    v10.size.height = v5;
    CGRectGetHeight(v10);
    swift_beginAccess();
  }
  else
  {
    swift_beginAccess();
    Width = Width - *(double *)(a1 + 504);
    v11.origin.x = v4;
    v11.origin.y = v3;
    v11.size.width = v6;
    v11.size.height = v5;
    CGRectGetHeight(v11);
  }
  return Width;
}

BOOL sub_1BA180E80(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGRect v9;
  CGRect v10;
  CGRect v11;

  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = 0.0;
  v11.size.height = 0.0;
  if (CGRectEqualToRect(*(CGRect *)&a1, v11))
    return 0;
  v9.origin.x = a1;
  v9.origin.y = a2;
  v9.size.width = a3;
  v9.size.height = a4;
  if (CGRectGetWidth(v9) == 1.79769313e308)
    return 0;
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  return CGRectGetHeight(v10) != 1.79769313e308;
}

uint64_t Cursor.deinit()
{
  uint64_t v0;
  _BYTE v2[200];

  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_7_0(v2, (const void *)(v0 + 128));
  sub_1BA17AB1C((uint64_t)v2);
  sub_1BA16AE90(v0 + 544);
  return v0;
}

uint64_t Cursor.__deallocating_deinit()
{
  Cursor.deinit();
  return swift_deallocClassInstance();
}

uint64_t getEnumTagSinglePayload for Pass(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Pass(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

uint64_t sub_1BA18103C(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_1BA181054(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    result[2] = 0;
    result[3] = 0;
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

void type metadata accessor for Pass()
{
  OUTLINED_FUNCTION_8_3();
}

uint64_t destroy for Pass.DynamicOptions()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s11TeaTemplate4PassO14DynamicOptionsVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s11TeaTemplate4PassO14DynamicOptionsVwca_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

uint64_t _s11TeaTemplate4PassO14DynamicOptionsVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for Pass.DynamicOptions(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 32))
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

uint64_t storeEnumTagSinglePayload for Pass.DynamicOptions(uint64_t result, int a2, int a3)
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

void type metadata accessor for Pass.DynamicOptions()
{
  OUTLINED_FUNCTION_8_3();
}

uint64_t sub_1BA1811E4()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Cursor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Cursor);
}

uint64_t method lookup function for Cursor()
{
  return swift_lookUpClassMethod();
}

uint64_t getEnumTagSinglePayload for DimensionSizerResult.ProcessResult(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 2)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DimensionSizerResult.ProcessResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_1BA18132C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_1BA181344(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

void type metadata accessor for CursorInitialPosition()
{
  OUTLINED_FUNCTION_8_3();
}

void Template<A, B>(name:_:)()
{
  type metadata accessor for Layout();
}

uint64_t (*sub_1BA1813B8())()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t (*v6)();
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;

  v9 = v8;
  v10 = v2;
  v11 = v3;
  v12 = v4;
  v13 = v5;
  swift_bridgeObjectRetain();
  Layout.__allocating_init(canvas:name:)(&v9, v1, v0);
  v6 = sub_1BA181428();
  swift_release();
  return v6;
}

uint64_t (*sub_1BA181428())()
{
  swift_retain();
  return sub_1BA181458;
}

uint64_t SizeConstraints.width.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SizeConstraints.height.getter()
{
  return swift_bridgeObjectRetain();
}

TeaTemplate::SizeConstraints __swiftcall SizeConstraints.init(width:height:)(Swift::OpaquePointer width, Swift::OpaquePointer height)
{
  Swift::OpaquePointer *v2;
  TeaTemplate::SizeConstraints result;

  v2->_rawValue = width._rawValue;
  v2[1]._rawValue = height._rawValue;
  result.height = height;
  result.width = width;
  return result;
}

BOOL SizeConstraints.isEmpty.getter()
{
  _QWORD *v0;

  return !*(_QWORD *)(*v0 + 16) && *(_QWORD *)(v0[1] + 16) == 0;
}

uint64_t SizeConstraints.adding(widthConstraint:)@<X0>(uint64_t *a1@<X0>, char **a2@<X8>)
{
  char **v2;
  uint64_t v4;
  char v5;
  char *v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;

  v4 = *a1;
  v5 = *((_BYTE *)a1 + 8);
  v7 = *v2;
  v6 = v2[1];
  OUTLINED_FUNCTION_15();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v7 = OUTLINED_FUNCTION_0_19(0, *((_QWORD *)v7 + 2) + 1);
  v9 = *((_QWORD *)v7 + 2);
  v8 = *((_QWORD *)v7 + 3);
  if (v9 >= v8 >> 1)
    v7 = OUTLINED_FUNCTION_0_19((char *)(v8 > 1), v9 + 1);
  *((_QWORD *)v7 + 2) = v9 + 1;
  v10 = &v7[16 * v9];
  *((_QWORD *)v10 + 4) = v4;
  v10[40] = v5;
  *a2 = v7;
  a2[1] = v6;
  return swift_bridgeObjectRetain();
}

uint64_t SizeConstraints.adding(heightConstraint:)@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v4 = *a1;
  v5 = *((_BYTE *)a1 + 8);
  v7 = *v2;
  v6 = v2[1];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_15();
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    result = (uint64_t)OUTLINED_FUNCTION_0_19(0, *(_QWORD *)(v6 + 16) + 1);
    v6 = result;
  }
  v10 = *(_QWORD *)(v6 + 16);
  v9 = *(_QWORD *)(v6 + 24);
  if (v10 >= v9 >> 1)
  {
    result = (uint64_t)OUTLINED_FUNCTION_0_19((char *)(v9 > 1), v10 + 1);
    v6 = result;
  }
  *(_QWORD *)(v6 + 16) = v10 + 1;
  v11 = v6 + 16 * v10;
  *(_QWORD *)(v11 + 32) = v4;
  *(_BYTE *)(v11 + 40) = v5;
  *a2 = v7;
  a2[1] = v6;
  return result;
}

TeaTemplate::SizeConstraints __swiftcall SizeConstraints.adding(constraints:)(TeaTemplate::SizeConstraints constraints)
{
  _QWORD *v1;
  uint64_t *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  TeaTemplate::SizeConstraints result;
  uint64_t v10;

  v3 = v1;
  v4 = v2[1];
  v10 = *v2;
  swift_bridgeObjectRetain();
  v5 = OUTLINED_FUNCTION_15();
  sub_1BA1818B8(v5);
  swift_bridgeObjectRetain();
  v6 = swift_bridgeObjectRetain();
  v7 = (void *)sub_1BA1818B8(v6);
  *v3 = v10;
  v3[1] = v4;
  result.height._rawValue = v8;
  result.width._rawValue = v7;
  return result;
}

uint64_t static SizeConstraints.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[1];
  v3 = a2[1];
  if ((sub_1BA1816A8(*a1, *a2) & 1) != 0)
    return sub_1BA1816A8(v2, v3);
  else
    return 0;
}

uint64_t sub_1BA1816A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double *v3;
  double *i;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 == *(_QWORD *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
      return 1;
    v3 = (double *)(a1 + 40);
    for (i = (double *)(a2 + 40); ; i += 2)
    {
      if ((*(_BYTE *)v3 & 1) != 0)
      {
        if ((*(_BYTE *)i & 1) == 0)
          return 0;
      }
      else if ((*(_BYTE *)i & 1) != 0)
      {
        return 0;
      }
      if (*(v3 - 1) != *(i - 1))
        break;
      v3 += 2;
      if (!--v2)
        return 1;
    }
  }
  return 0;
}

void sub_1BA181720()
{
  qword_1EF274540 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)algn_1EF274548 = MEMORY[0x1E0DEE9D8];
}

uint64_t static SizeConstraints.none.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;

  if (qword_1EF274308 != -1)
    swift_once();
  v2 = *(_QWORD *)algn_1EF274548;
  *a1 = qword_1EF274540;
  a1[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void static SizeConstraints.minWidth(_:)(uint64_t *a1@<X8>, double a2@<D0>)
{
  sub_1BA1817AC(0, a1, a2);
}

void static SizeConstraints.minHeight(_:)(_QWORD *a1@<X8>, double a2@<D0>)
{
  sub_1BA181814(0, a1, a2);
}

void static SizeConstraints.maxWidth(_:)(uint64_t *a1@<X8>, double a2@<D0>)
{
  sub_1BA1817AC(1, a1, a2);
}

void sub_1BA1817AC(uint64_t a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>)
{
  char v3;
  uint64_t v6;
  uint64_t v7;

  v3 = a1;
  OUTLINED_FUNCTION_3_16(a1, (unint64_t *)&qword_1ED5C9AB0);
  v6 = OUTLINED_FUNCTION_6();
  *(_OWORD *)(v6 + 16) = xmmword_1BA19C0E0;
  *(double *)(v6 + 32) = a3;
  *(_BYTE *)(v6 + 40) = v3;
  v7 = MEMORY[0x1E0DEE9D8];
  *a2 = v6;
  a2[1] = v7;
  OUTLINED_FUNCTION_3_6();
}

void static SizeConstraints.maxHeight(_:)(_QWORD *a1@<X8>, double a2@<D0>)
{
  sub_1BA181814(1, a1, a2);
}

void sub_1BA181814(uint64_t a1@<X0>, _QWORD *a2@<X8>, double a3@<D0>)
{
  char v3;
  uint64_t v6;

  v3 = a1;
  OUTLINED_FUNCTION_3_16(a1, (unint64_t *)&qword_1ED5C9AB0);
  v6 = OUTLINED_FUNCTION_6();
  *(_OWORD *)(v6 + 16) = xmmword_1BA19C0E0;
  *(double *)(v6 + 32) = a3;
  *(_BYTE *)(v6 + 40) = v3;
  *a2 = MEMORY[0x1E0DEE9D8];
  a2[1] = v6;
  OUTLINED_FUNCTION_3_6();
}

BOOL static SizeConstraint.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 8) & 1) == 0)
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 8) & 1) != 0)
  {
    return 0;
  }
  return *(double *)a1 == *(double *)a2;
}

uint64_t sub_1BA1818B8(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

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
  if (!(_DWORD)result || v5 > *(_QWORD *)(v3 + 24) >> 1)
  {
    if (v4 <= v5)
      v7 = v4 + v2;
    else
      v7 = v4;
    result = (uint64_t)OUTLINED_FUNCTION_0_19((char *)result, v7);
    v3 = result;
  }
  if (!*(_QWORD *)(v6 + 16))
  {
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
  v8 = *(_QWORD *)(v3 + 16);
  if ((*(_QWORD *)(v3 + 24) >> 1) - v8 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = (uint64_t)memcpy((void *)(v3 + 16 * v8 + 32), (const void *)(v6 + 32), 16 * v2);
  if (!v2)
  {
LABEL_14:
    result = OUTLINED_FUNCTION_12();
    *v1 = v3;
    return result;
  }
  v9 = *(_QWORD *)(v3 + 16);
  v10 = __OFADD__(v9, v2);
  v11 = v9 + v2;
  if (!v10)
  {
    *(_QWORD *)(v3 + 16) = v11;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

void sub_1BA181984()
{
  char *v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  OUTLINED_FUNCTION_8_9();
  if ((v4 & 1) != 0)
  {
    OUTLINED_FUNCTION_5_11();
    if (v6 != v7)
    {
      OUTLINED_FUNCTION_9_7();
      if (v6)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_4_13();
    }
  }
  else
  {
    v5 = v3;
  }
  v8 = *((_QWORD *)v0 + 2);
  if (v5 <= v8)
    v9 = *((_QWORD *)v0 + 2);
  else
    v9 = v5;
  if (v9)
  {
    OUTLINED_FUNCTION_3_16(v2, &qword_1EF274550);
    v10 = (char *)OUTLINED_FUNCTION_6();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 80);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = v0 + 32;
  if ((v1 & 1) != 0)
  {
    if (v10 != v0 || &v13[80 * v8] <= v12)
      memmove(v12, v13, 80 * v8);
    *((_QWORD *)v0 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7_8();
}

void sub_1BA181A6C()
{
  char *v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  OUTLINED_FUNCTION_8_9();
  if ((v4 & 1) != 0)
  {
    OUTLINED_FUNCTION_5_11();
    if (v6 != v7)
    {
      OUTLINED_FUNCTION_9_7();
      if (v6)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_4_13();
    }
  }
  else
  {
    v5 = v3;
  }
  v8 = *((_QWORD *)v0 + 2);
  if (v5 <= v8)
    v9 = *((_QWORD *)v0 + 2);
  else
    v9 = v5;
  if (v9)
  {
    OUTLINED_FUNCTION_3_16(v2, &qword_1EF274558);
    v10 = (char *)OUTLINED_FUNCTION_6();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = v0 + 32;
  if ((v1 & 1) != 0)
  {
    if (v10 != v0 || &v13[8 * v8] <= v12)
      memmove(v12, v13, 8 * v8);
    *((_QWORD *)v0 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 8 * v8);
  }
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5_0();
}

char *sub_1BA181B40(char *result, int64_t a2, char a3, char *a4)
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
  size_t v14;

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
    sub_1BA16E1EC(0, (unint64_t *)&qword_1ED5C9AB0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  v14 = 16 * v8;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[v14] <= v12)
      memmove(v12, v13, v14);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v14);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t destroy for SizeConstraints()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s11TeaTemplate15SizeConstraintsVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for SizeConstraints(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for SizeConstraints(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SizeConstraints(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SizeConstraints(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SizeConstraints()
{
  return &type metadata for SizeConstraints;
}

uint64_t getEnumTagSinglePayload for SizeConstraint(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 1)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SizeConstraint(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_1BA181E44(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_1BA181E4C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SizeConstraint()
{
  return &type metadata for SizeConstraint;
}

char *sub_1BA181E68(char *result, uint64_t a2, char *a3)
{
  if (a3 != result || &result[96 * a2] <= a3)
    return (char *)OUTLINED_FUNCTION_1_18(a3, result);
  return result;
}

char *sub_1BA181E90(char *result, uint64_t a2, char *a3)
{
  if (a3 != result || &result[16 * a2] <= a3)
    return (char *)OUTLINED_FUNCTION_1_18(a3, result);
  return result;
}

uint64_t destroy for LayoutDecoderError(uint64_t result)
{
  unsigned int v1;

  v1 = *(unsigned __int8 *)(result + 48);
  if (v1 >= 2)
    v1 = *(_DWORD *)result + 2;
  if (v1 == 1)
    return __swift_destroy_boxed_opaque_existential_1(result);
  if (!v1)
  {
    if (*(_QWORD *)(result + 24))
      __swift_destroy_boxed_opaque_existential_1(result);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for LayoutDecoderError(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v4 = *(unsigned __int8 *)(a2 + 48);
  if (v4 >= 2)
    v4 = *(_DWORD *)a2 + 2;
  if (v4 == 1)
  {
    v6 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 24) = v6;
    (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1, a2);
    v7 = 1;
LABEL_9:
    *(_BYTE *)(a1 + 48) = v7;
    return a1;
  }
  if (v4)
  {
    v8 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v8;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    v7 = *(_BYTE *)(a2 + 48);
    goto LABEL_9;
  }
  v5 = *(_QWORD *)(a2 + 24);
  if (v5)
  {
    *(_QWORD *)(a1 + 24) = v5;
    (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1, a2);
  }
  else
  {
    v9 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v9;
  }
  v10 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v10;
  *(_BYTE *)(a1 + 48) = 0;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LayoutDecoderError(uint64_t a1, __int128 *a2)
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  if ((__int128 *)a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 48);
    if (v4 >= 2)
      v4 = *(_DWORD *)a1 + 2;
    if (v4 == 1)
    {
      __swift_destroy_boxed_opaque_existential_1(a1);
    }
    else if (!v4)
    {
      if (*(_QWORD *)(a1 + 24))
        __swift_destroy_boxed_opaque_existential_1(a1);
      swift_bridgeObjectRelease();
    }
    v5 = *((unsigned __int8 *)a2 + 48);
    if (v5 >= 2)
      v5 = *(_DWORD *)a2 + 2;
    if (v5 == 1)
    {
      v7 = *((_QWORD *)a2 + 3);
      *(_QWORD *)(a1 + 24) = v7;
      (**(void (***)(uint64_t, __int128 *))(v7 - 8))(a1, a2);
      *(_BYTE *)(a1 + 48) = 1;
    }
    else if (v5)
    {
      v8 = *a2;
      v9 = a2[1];
      v10 = a2[2];
      *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
      *(_OWORD *)(a1 + 16) = v9;
      *(_OWORD *)(a1 + 32) = v10;
      *(_OWORD *)a1 = v8;
    }
    else
    {
      v6 = *((_QWORD *)a2 + 3);
      if (v6)
      {
        *(_QWORD *)(a1 + 24) = v6;
        (**(void (***)(uint64_t, __int128 *))(v6 - 8))(a1, a2);
      }
      else
      {
        v11 = a2[1];
        *(_OWORD *)a1 = *a2;
        *(_OWORD *)(a1 + 16) = v11;
      }
      *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
      *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 5);
      *(_BYTE *)(a1 + 48) = 0;
      swift_bridgeObjectRetain();
    }
  }
  return a1;
}

uint64_t assignWithTake for LayoutDecoderError(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 48);
    if (v4 >= 2)
      v4 = *(_DWORD *)a1 + 2;
    if (v4 == 1)
    {
      __swift_destroy_boxed_opaque_existential_1(a1);
    }
    else if (!v4)
    {
      if (*(_QWORD *)(a1 + 24))
        __swift_destroy_boxed_opaque_existential_1(a1);
      swift_bridgeObjectRelease();
    }
    v5 = *(unsigned __int8 *)(a2 + 48);
    if (v5 >= 2)
      v5 = *(_DWORD *)a2 + 2;
    if (v5 == 1)
    {
      v7 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v7;
    }
    else
    {
      if (!v5)
      {
        v6 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v6;
        *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
        *(_BYTE *)(a1 + 48) = 0;
        return a1;
      }
      v8 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v8;
      *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
      LOBYTE(v5) = *(_BYTE *)(a2 + 48);
    }
    *(_BYTE *)(a1 + 48) = v5;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for LayoutDecoderError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 49))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 48);
  if (v3 >= 3)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for LayoutDecoderError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 48) = 0;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)result = 0u;
    *(_DWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 49) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 49) = 0;
    if (a2)
      *(_BYTE *)(result + 48) = -(char)a2;
  }
  return result;
}

uint64_t sub_1BA18224C(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 48);
  if (result >= 2)
    return (*(_DWORD *)a1 + 2);
  return result;
}

uint64_t sub_1BA182268(uint64_t result, unsigned int a2)
{
  if (a2 > 1)
  {
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)result = 0u;
    *(_DWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 48) = a2;
  return result;
}

ValueMetadata *type metadata accessor for LayoutDecoderError()
{
  return &type metadata for LayoutDecoderError;
}

uint64_t getEnumTagSinglePayload for SizeToFitDimensionSizer(unsigned __int8 *a1, unsigned int a2)
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
  v5 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SizeToFitDimensionSizer(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BA182384 + 4 * byte_1BA19D525[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1BA1823B8 + 4 * byte_1BA19D520[v4]))();
}

uint64_t sub_1BA1823B8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA1823C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA1823C8);
  return result;
}

uint64_t sub_1BA1823D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA1823DCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1BA1823E0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA1823E8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SizeToFitDimensionSizer()
{
  return &type metadata for SizeToFitDimensionSizer;
}

uint64_t sub_1BA182404()
{
  return swift_deallocObject();
}

uint64_t sub_1BA182414()
{
  return sub_1BA170734((uint64_t)&unk_1E71E2808);
}

void sub_1BA182440(uint64_t a1@<X0>, uint64_t a2@<X2>, void *a3@<X3>, uint64_t a4@<X4>, uint64_t *a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  Swift::String v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  id v59;
  id v60;
  char v61;
  char v62;
  double v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t inited;
  id v68;
  id v69;
  uint64_t v70;
  _QWORD v71[10];
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  id v81;
  __int128 v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;

  v6 = v5;
  swift_beginAccess();
  v12 = *(_QWORD *)(a1 + 64);
  if (!v12)
  {
    v33 = OUTLINED_FUNCTION_6();
    *(_QWORD *)(v33 + 40) = &type metadata for AltFlexibleTextSizer;
    *(_QWORD *)(v33 + 48) = &off_1E71E5A10;
    *(_QWORD *)(v33 + 16) = a3;
    *(_QWORD *)(v33 + 24) = a4;
    *a5 = v33 | 0x2000000000000000;
    v34 = a3;
    OUTLINED_FUNCTION_7_9();
    return;
  }
  v13 = *(double *)(a1 + 80);
  if (v13 <= 0.0)
  {
    v35 = OUTLINED_FUNCTION_6();
    *(_OWORD *)(v35 + 16) = 0u;
    *(_OWORD *)(v35 + 32) = 0u;
    if (qword_1ED5C9B18 != -1)
      swift_once();
    v36 = HIBYTE(word_1ED5C8FE0);
    *(_BYTE *)(v35 + 48) = word_1ED5C8FE0;
    *(_BYTE *)(v35 + 49) = v36;
    *a5 = v35;
  }
  else
  {
    v80 = a3;
    v14 = *(_QWORD *)(a1 + 56);
    v15 = *(_QWORD *)(a1 + 72);
    v16 = *(void **)(a2 + 24);
    if (v16)
    {
      v17 = *(_QWORD *)(a2 + 16);
      swift_bridgeObjectRetain();
      v18._countAndFlagsBits = v17;
      v18._object = v16;
      v19 = (unint64_t)LayoutContext.metadata(for:)(v18);
      if (v19)
      {
        v20 = v19;
        sub_1BA172AE0(v19, &v82);
        if (v84)
        {
          sub_1BA172874();
          if ((swift_dynamicCast() & 1) != 0)
          {
            v75 = (unint64_t *)a5;
            v21 = sub_1BA16EA30();
            OUTLINED_FUNCTION_3_17();
            sub_1BA182A20(v22, a1, v23, v24);
            swift_bridgeObjectRelease();

            v25 = v82;
            v26 = v83;
            v27 = v84;
            v28 = v85;
            v29 = v86;
            v30 = v87;
            v31 = OUTLINED_FUNCTION_6();
            v32 = OUTLINED_FUNCTION_6();
            *(_OWORD *)(v32 + 16) = v25;
            *(_QWORD *)(v32 + 32) = v26;
            *(_QWORD *)(v32 + 40) = v27;
            *(_OWORD *)(v32 + 48) = v25;
            *(_QWORD *)(v32 + 64) = v26;
            *(_QWORD *)(v32 + 72) = v27;
            *(_QWORD *)(v32 + 80) = v28;
            *(_QWORD *)(v32 + 88) = v29;
            *(_QWORD *)(v32 + 96) = v30;
            *(_QWORD *)(v31 + 16) = v32 | 0x1000000000000000;
            *(_QWORD *)(v31 + 24) = v20;
LABEL_25:
            *v75 = v31 | 0x9000000000000000;
            return;
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          sub_1BA170698((uint64_t)&v82);
        }
      }
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    OUTLINED_FUNCTION_3_17();
    v39 = sub_1BA182A20(v80, a1, v37, v38);
    v79 = v82;
    v40 = v83;
    v78 = *((_QWORD *)&v82 + 1);
    v41 = v84;
    v76 = v85;
    v42 = v86;
    v43 = v87;
    MEMORY[0x1E0C80A78](v39, v44);
    v71[2] = v80;
    v71[3] = a4;
    v71[4] = a1;
    v71[5] = v14;
    v71[6] = v12;
    v71[7] = v15;
    *(double *)&v71[8] = v13;
    OUTLINED_FUNCTION_7_9();
    v45 = sub_1BA187648((void (*)(uint64_t *__return_ptr, _QWORD *))sub_1BA182CCC, (uint64_t)v71, a4);
    OUTLINED_FUNCTION_1_9();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v82 = v45;
    sub_1BA1706F0(0, &qword_1ED5C9A20, (uint64_t)&type metadata for AltTextSized, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
    sub_1BA172068();
    sub_1BA1720C0();
    v46 = sub_1BA19ABE8();
    v47 = *(_QWORD *)(v45 + 16);
    if (v47)
    {
      v77 = v46;
      v72 = v43;
      v73 = v42;
      v75 = (unint64_t *)a5;
      swift_bridgeObjectRetain();
      v74 = v45;
      v48 = v45 + 64;
      while (1)
      {
        v49 = *(void **)(v48 - 16);
        v50 = *(void **)v48;
        v51 = *(_QWORD *)(v48 + 8);
        v52 = *(_QWORD *)(v48 + 16);
        v53 = *(_QWORD *)(v48 + 24);
        v54 = *(_QWORD *)(v48 + 32);
        v55 = *(void **)(v48 + 40);
        v56 = *(_QWORD *)(v48 + 48);
        v57 = *(_QWORD *)(v48 + 56);
        *(_QWORD *)&v82 = *(_QWORD *)(v48 - 8);
        swift_retain_n();
        v58 = v50;
        v59 = v55;
        OUTLINED_FUNCTION_7_9();
        v60 = v49;
        OUTLINED_FUNCTION_5_12();
        sub_1BA1720FC();
        if (v6)
        {
          OUTLINED_FUNCTION_2_15();
          OUTLINED_FUNCTION_6_8();
          OUTLINED_FUNCTION_1_19();

          OUTLINED_FUNCTION_1_9();
          swift_release_n();
          return;
        }
        v62 = v61;
        OUTLINED_FUNCTION_2();
        if ((v62 & 1) != 0)
          break;

        OUTLINED_FUNCTION_2();
        OUTLINED_FUNCTION_1_9();
        v48 += 96;
        if (!--v47)
        {
          OUTLINED_FUNCTION_2_15();
          OUTLINED_FUNCTION_1_19();
          a5 = (uint64_t *)v75;
          v42 = v73;
          v43 = v72;
          goto LABEL_22;
        }
      }
      OUTLINED_FUNCTION_2_15();
      OUTLINED_FUNCTION_1_19();
      v31 = OUTLINED_FUNCTION_6();
      v66 = OUTLINED_FUNCTION_6();
      *(_QWORD *)(v66 + 16) = v51;
      *(_QWORD *)(v66 + 24) = v52;
      *(_QWORD *)(v66 + 32) = v53;
      *(_QWORD *)(v66 + 40) = v54;
      *(_QWORD *)(v66 + 48) = v51;
      *(_QWORD *)(v66 + 56) = v52;
      *(_QWORD *)(v66 + 64) = v53;
      *(_QWORD *)(v66 + 72) = v54;
      *(_QWORD *)(v66 + 80) = v59;
      *(_QWORD *)(v66 + 88) = v56;
      *(_QWORD *)(v66 + 96) = v57;
      *(_QWORD *)(v31 + 16) = v66 | 0x1000000000000000;
      sub_1BA172A44();
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1BA19C0E0;
      *(_QWORD *)(inited + 56) = sub_1BA172874();
      *(_QWORD *)(inited + 32) = v60;
      sub_1BA172BA8();
      v68 = v59;
      v69 = v60;
      v70 = sub_1BA19AB34();

      OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_1_9();
      OUTLINED_FUNCTION_6_8();
      *(_QWORD *)(v31 + 24) = v70;
      goto LABEL_25;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_22:
    OUTLINED_FUNCTION_6();
    v63 = OUTLINED_FUNCTION_5_12();
    *(double *)(v64 + 16) = v63;
    *(_QWORD *)(v64 + 24) = v65;
    *(_QWORD *)(v64 + 32) = v40;
    *(_QWORD *)(v64 + 40) = v41;
    *(double *)(v64 + 48) = v63;
    *(_QWORD *)(v64 + 56) = v65;
    *(_QWORD *)(v64 + 64) = v40;
    *(_QWORD *)(v64 + 72) = v41;
    *(_QWORD *)(v64 + 80) = v76;
    *(_QWORD *)(v64 + 88) = v42;
    *(_QWORD *)(v64 + 96) = v43;
    *a5 = v64 | 0x1000000000000000;
  }
}

id sub_1BA182A20@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  double v6;
  double v7;
  CGFloat width;
  CGFloat height;
  __int128 v10;
  CGRect v13;

  v6 = *(double *)(a3 + 16);
  v7 = *(double *)(a3 + 24);
  objc_msgSend(a1, sel_boundingRectWithSize_options_context_, 33, 0, v6, v7);
  width = v13.size.width;
  height = v13.size.height;
  if (trunc(CGRectGetHeight(v13)) <= trunc(v7))
  {
    swift_beginAccess();
    v10 = *(_OWORD *)(a2 + 488);
  }
  else
  {
    v10 = 0uLL;
    width = 0.0;
    height = 0.0;
  }
  *(_OWORD *)a4 = v10;
  *(CGFloat *)(a4 + 16) = width;
  *(CGFloat *)(a4 + 24) = height;
  *(_QWORD *)(a4 + 32) = a1;
  *(double *)(a4 + 40) = v6;
  *(double *)(a4 + 48) = v7;
  return a1;
}

id sub_1BA182AD8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>, double a6@<D0>, double a7@<D1>)
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  id v17;
  _QWORD v19[4];
  _OWORD v20[2];
  uint64_t v21;
  __int128 v22;

  v9 = *a1;
  v8 = a1[1];
  v10 = (void *)a1[2];
  v11 = a1[3];
  v12 = (void *)a1[4];
  v19[0] = a3;
  v19[1] = a4;
  *(double *)&v19[2] = a6;
  *(double *)&v19[3] = a7;
  sub_1BA182A20(v12, a2, (uint64_t)v19, (uint64_t)v20);
  v13 = v21;
  v14 = v20[0];
  v15 = v20[1];
  v16 = v22;
  *(_QWORD *)a5 = v9;
  *(_QWORD *)(a5 + 8) = v8;
  *(_QWORD *)(a5 + 16) = v10;
  *(_QWORD *)(a5 + 24) = v11;
  *(_QWORD *)(a5 + 32) = v12;
  *(_OWORD *)(a5 + 40) = v14;
  *(_OWORD *)(a5 + 56) = v15;
  *(_QWORD *)(a5 + 72) = v13;
  *(_OWORD *)(a5 + 80) = v16;
  swift_retain();
  v17 = v12;
  swift_bridgeObjectRetain();
  return v10;
}

uint64_t sub_1BA182B94()
{
  return sub_1BA182414();
}

void sub_1BA182BA8(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v3;

  sub_1BA182440(a1, a2, *(void **)v3, *(_QWORD *)(v3 + 8), a3);
}

uint64_t sub_1BA182BC0()
{
  return 0x6978656C46746C61;
}

_QWORD *initializeBufferWithCopyOfBuffer for AltFlexibleTextSizer(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AltFlexibleTextSizer(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

id *assignWithTake for AltFlexibleTextSizer(id *a1, _OWORD *a2)
{

  *(_OWORD *)a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for AltFlexibleTextSizer()
{
  return &type metadata for AltFlexibleTextSizer;
}

uint64_t sub_1BA182CBC()
{
  return swift_deallocObject();
}

id sub_1BA182CCC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1BA182AD8(a1, *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), a2, *(double *)(v2 + 56), *(double *)(v2 + 64));
}

uint64_t sub_1BA182CF4()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1BA182D18()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BA182D48()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

double CGRect.replacing(width:)(double a1, double a2)
{
  return a2;
}

double CGRect.replacing(height:)(double a1, double a2)
{
  return a2;
}

void sub_1BA182DA0()
{
  uint64_t v0;
  double v1;
  double v2;
  char v3;
  CGFloat v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  OUTLINED_FUNCTION_4_11();
  if (*(_BYTE *)(v0 + 440) == 1)
  {
    if ((v3 & 1) != 0)
    {
      v4 = *(double *)(v0 + 16);
      v5 = *(double *)(v0 + 24);
    }
    else
    {
      v4 = v1;
      v5 = v2;
    }
    if ((*(_BYTE *)(v0 + 48) & 1) != 0)
    {
      sub_1BA19ADD4();
      v7 = v6;
      v9 = v8;
      OUTLINED_FUNCTION_5_13();
      CGRectGetMinX(v12);
      v13.origin.x = v4;
      v13.origin.y = v5;
      v13.size.width = v7;
      v13.size.height = v9;
      CGRectGetMaxY(v13);
      OUTLINED_FUNCTION_6_9();
    }
    else
    {
      sub_1BA19ADC8();
      v14.size.width = v10;
      v14.size.height = v11;
      v14.origin.x = v4;
      v14.origin.y = v5;
      CGRectGetMaxX(v14);
      OUTLINED_FUNCTION_2_16();
      OUTLINED_FUNCTION_3_18();
    }
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_4();
  }
  OUTLINED_FUNCTION_5_13();
  OUTLINED_FUNCTION_4_14();
}

void CGRect.replacing(minY:)(double a1, double a2)
{
  CGRect v2;

  v2.origin.x = OUTLINED_FUNCTION_7_10(a1, a2);
  CGRectGetMinX(v2);
  OUTLINED_FUNCTION_5_13();
  OUTLINED_FUNCTION_9_8();
}

__C::CGRect __swiftcall CGRect.flipRightToLeft(bounds:)(__C::CGRect bounds)
{
  double v1;
  double v2;
  double v3;
  double v4;
  __C::CGRect result;

  OUTLINED_FUNCTION_8_10((CGRect)bounds);
  OUTLINED_FUNCTION_2_16();
  OUTLINED_FUNCTION_3_18();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_4_14();
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

__C::CGRect __swiftcall CGRect.horizontalFlip(inBounds:)(__C::CGRect inBounds)
{
  double v1;
  double v2;
  double v3;
  double v4;
  __C::CGRect result;

  OUTLINED_FUNCTION_8_10((CGRect)inBounds);
  OUTLINED_FUNCTION_2_16();
  OUTLINED_FUNCTION_3_18();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_4_14();
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

void sub_1BA182F30(__C::CGRect *a1@<X8>, double a2@<D0>)
{
  *a1 = CGRect.flipRightToLeft(bounds:)(*(__C::CGRect *)&a2);
}

double CGRect.init(horizontal:vertical:)(uint64_t a1)
{
  return *(double *)a1;
}

void CGRect.horizontalDimension.getter()
{
  sub_1BA182F94((uint64_t)MEMORY[0x1E0C9D5C0], (double (*)(void))MEMORY[0x1E0C9D5D0]);
}

void CGRect.verticalDimension.getter()
{
  sub_1BA182F94((uint64_t)MEMORY[0x1E0C9D5C8], (double (*)(void))MEMORY[0x1E0C9D580]);
}

void sub_1BA182F94(uint64_t a1, double (*a2)(void))
{
  double *v3;
  double *v4;
  double (*v5)(void);
  double v6;
  double v7;

  OUTLINED_FUNCTION_4_11();
  v4 = v3;
  v6 = v5();
  OUTLINED_FUNCTION_5_13();
  v7 = a2();
  *v4 = v6;
  v4[1] = v7;
}

__C::CGRect __swiftcall CGRect.verticalFlip(inBounds:)(__C::CGRect inBounds)
{
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  double height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat MinX;
  CGRect v16;
  CGRect v17;
  __C::CGRect result;

  height = inBounds.size.height;
  width = inBounds.size.width;
  y = inBounds.origin.y;
  x = inBounds.origin.x;
  v16.origin.x = v1;
  v16.origin.y = v2;
  v16.size.width = v3;
  v16.size.height = v4;
  MinX = CGRectGetMinX(v16);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  CGRectGetMaxY(v17);
  v9 = height - OUTLINED_FUNCTION_6_9();
  v10 = OUTLINED_FUNCTION_5();
  v11 = OUTLINED_FUNCTION_4();
  v12 = MinX;
  v13 = v9;
  v14 = v10;
  result.size.height = v11;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

void CGRect.replacing(minX:)(double a1, double a2)
{
  CGRect v2;

  v2.origin.x = OUTLINED_FUNCTION_7_10(a1, a2);
  CGRectGetMinY(v2);
  OUTLINED_FUNCTION_9_8();
}

void static CGRect.| infix(_:_:)(uint64_t a1)
{
  __asm { BR              X11 }
}

void sub_1BA1830F8()
{
  OUTLINED_FUNCTION_9_8();
}

uint64_t getEnumTagSinglePayload for CGRectTransform(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFB && *(_BYTE *)(a1 + 33))
    {
      v2 = *(_DWORD *)a1 + 250;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 32);
      if (v3 <= 5)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CGRectTransform(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 251;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t sub_1BA1831E0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 4u)
    return *(unsigned __int8 *)(a1 + 32);
  else
    return (*(_DWORD *)a1 + 5);
}

uint64_t sub_1BA1831F8(uint64_t result, unsigned int a2)
{
  if (a2 >= 5)
  {
    *(_QWORD *)result = a2 - 5;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 5;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
  }
  *(_BYTE *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CGRectTransform()
{
  return &type metadata for CGRectTransform;
}

void Node.kind.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 32);
}

uint64_t Node.__allocating_init(kind:identifier:)(_BYTE *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  Node.init(kind:identifier:)(a1, a2, a3);
  return v6;
}

void sub_1BA183284()
{
  sub_1BA19AF84();
  __break(1u);
}

void sub_1BA1832DC()
{
  sub_1BA19AF84();
  __break(1u);
}

uint64_t Node.__deallocating_deinit()
{
  Node.deinit();
  return swift_deallocClassInstance();
}

TeaTemplate::NodeKind_optional __swiftcall NodeKind.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  TeaTemplate::NodeKind_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1BA19AFC0();
  result.value = swift_bridgeObjectRelease();
  v5 = 13;
  if (v3 < 0xD)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t NodeKind.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1BA1833D8 + 4 * byte_1BA19D648[*v0]))(0x656D617266, 0xE500000000000000);
}

uint64_t sub_1BA1833D8()
{
  return 0x6563617073;
}

uint64_t sub_1BA1833E8()
{
  return 7892834;
}

uint64_t sub_1BA1833F8()
{
  return 0x79616C7265766FLL;
}

uint64_t sub_1BA183410()
{
  return 0x6465626D65;
}

uint64_t sub_1BA183420()
{
  return 1886351984;
}

uint64_t sub_1BA183430()
{
  return 0x63696D616E7964;
}

uint64_t sub_1BA183448()
{
  return 0x6B63617473;
}

uint64_t sub_1BA183458()
{
  return 0x68636145726F66;
}

uint64_t sub_1BA183470()
{
  return 0x65736C456669;
}

uint64_t sub_1BA183484()
{
  return 6778732;
}

uint64_t sub_1BA183494()
{
  return 0x74636570736E69;
}

uint64_t sub_1BA1834AC()
{
  return 0x74756F79616CLL;
}

uint64_t sub_1BA1834C0()
{
  return sub_1BA17AD08();
}

unint64_t sub_1BA1834D0()
{
  unint64_t result;

  result = qword_1EF274560;
  if (!qword_1EF274560)
  {
    result = MEMORY[0x1BCCD6858](&protocol conformance descriptor for NodeKind, &type metadata for NodeKind);
    atomic_store(result, (unint64_t *)&qword_1EF274560);
  }
  return result;
}

void sub_1BA18350C()
{
  sub_1BA197A18();
}

void sub_1BA183514()
{
  sub_1BA197AC0();
}

void sub_1BA18351C()
{
  sub_1BA197C9C();
}

TeaTemplate::NodeKind_optional sub_1BA183524(Swift::String *a1)
{
  return NodeKind.init(rawValue:)(*a1);
}

uint64_t sub_1BA183530@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = NodeKind.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t method lookup function for Node()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Node.__allocating_init(kind:identifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t getEnumTagSinglePayload for NodeKind(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xF4)
  {
    if (a2 + 12 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 12) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 13;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xD;
  v5 = v6 - 13;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for NodeKind(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 12 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 12) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF4)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF3)
    return ((uint64_t (*)(void))((char *)&loc_1BA18363C + 4 * byte_1BA19D65A[v4]))();
  *a1 = a2 + 12;
  return ((uint64_t (*)(void))((char *)sub_1BA183670 + 4 * byte_1BA19D655[v4]))();
}

uint64_t sub_1BA183670(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA183678(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA183680);
  return result;
}

uint64_t sub_1BA18368C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA183694);
  *(_BYTE *)result = a2 + 12;
  return result;
}

uint64_t sub_1BA183698(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA1836A0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NodeKind()
{
  return &type metadata for NodeKind;
}

uint64_t LayoutAttributesType.flipRightToLeft(bounds:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, CGFloat a4@<D0>, CGFloat a5@<D1>, CGFloat a6@<D2>, CGFloat a7@<D3>)
{
  uint64_t v7;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v26[12];
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v15 = *(_QWORD *)(a1 - 8);
  v16 = MEMORY[0x1E0C80A78](a1, a2);
  v18 = &v26[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v16, v19);
  v21 = &v26[-v20];
  type metadata accessor for LayoutDecoder(0, a1, *(_QWORD *)(*(_QWORD *)(v22 + 8) + 8), v23);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v15 + 16))(v21, v7, a1);
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  v27.origin.x = a4;
  v27.origin.y = a5;
  v27.size.width = a6;
  v27.size.height = a7;
  CGRectGetMaxX(v27);
  v28.origin.x = OUTLINED_FUNCTION_0_21();
  CGRectGetMaxX(v28);
  v29.origin.x = OUTLINED_FUNCTION_0_21();
  CGRectGetMinY(v29);
  v30.origin.x = OUTLINED_FUNCTION_0_21();
  CGRectGetWidth(v30);
  v31.origin.x = OUTLINED_FUNCTION_0_21();
  CGRectGetHeight(v31);
  sub_1BA18A118();
  sub_1BA167D18(v24, (uint64_t)v18);
  swift_release();
  return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v15 + 32))(a3, v18, a1);
}

void RectDimension.init(origin:size:)(double *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  *a1 = a2;
  a1[1] = a3;
}

void sub_1BA1839A4()
{
  xmmword_1EF274568 = 0uLL;
}

double static RectDimension.zero.getter@<D0>(_OWORD *a1@<X8>)
{
  double result;

  if (qword_1EF274310 != -1)
    swift_once();
  result = *(double *)&xmmword_1EF274568;
  *a1 = xmmword_1EF274568;
  return result;
}

double RectDimension.origin.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

double RectDimension.size.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

float64x2_t RectDimension.integral.getter@<Q0>(float64x2_t *a1@<X8>)
{
  float64x2_t *v1;
  float64x2_t result;

  result = vrndpq_f64(*v1);
  *a1 = result;
  return result;
}

double RectDimension.union(_:)@<D0>(double *a1@<X0>, double *a2@<X8>)
{
  double *v2;
  double v3;
  double v4;
  double result;

  if (*a1 >= *v2)
    v3 = *v2;
  else
    v3 = *a1;
  v4 = *a1 + a1[1];
  if (*v2 + v2[1] > v4)
    v4 = *v2 + v2[1];
  result = v4 - v3;
  *a2 = v3;
  a2[1] = result;
  return result;
}

BOOL static RectDimension.== infix(_:_:)(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

ValueMetadata *type metadata accessor for RectDimension()
{
  return &type metadata for RectDimension;
}

uint64_t method lookup function for LayoutBuilder()
{
  return swift_lookUpClassMethod();
}

uint64_t destroy for ResizeConstrainingSizer(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ResizeConstrainingSizer(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ResizeConstrainingSizer(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
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

uint64_t assignWithTake for ResizeConstrainingSizer(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ResizeConstrainingSizer(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 64))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for ResizeConstrainingSizer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ResizeConstrainingSizer()
{
  return &type metadata for ResizeConstrainingSizer;
}

_QWORD *sub_1BA183C68@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[3];

  v6 = v4;
  v11 = *a1;
  v12 = *(_QWORD *)(v6 + 24);
  v13 = *(_QWORD *)(v6 + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)v6, v12);
  result = (*(_QWORD *(**)(_QWORD *__return_ptr, uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v13 + 16))(v26, a1, a2, a3, *(_QWORD *)(v11 + 80), *(_QWORD *)(v11 + 88), v12, v13);
  if (!v5)
  {
    v15 = v26[0];
    v17 = *(_QWORD *)(v6 + 48);
    v16 = *(_QWORD *)(v6 + 56);
    LayoutContext.contextFrame(for:)();
    if (v18)
    {
      v19 = v18;
      v20 = OUTLINED_FUNCTION_6();
      *(_QWORD *)(v20 + 16) = v15;
      v21 = *(_BYTE *)(v6 + 40);
      result = (_QWORD *)OUTLINED_FUNCTION_6();
      *((_BYTE *)result + 16) = v21;
      result[3] = v19;
      *(_QWORD *)(v20 + 24) = sub_1BA184090;
      *(_QWORD *)(v20 + 32) = result;
      v22 = v20 | 0x6000000000000000;
LABEL_4:
      *a4 = v22;
      return result;
    }
    swift_beginAccess();
    if (!a1[8])
    {
      v24 = OUTLINED_FUNCTION_6();
      *(_QWORD *)(v24 + 40) = &type metadata for ResizeConstrainingSizer;
      *(_QWORD *)(v24 + 48) = &off_1E71E5FB0;
      v25 = OUTLINED_FUNCTION_6();
      *(_QWORD *)(v24 + 16) = v25;
      sub_1BA184008(v6, v25 + 16);
      result = (_QWORD *)swift_release();
      v22 = v24 | 0x2000000000000000;
      goto LABEL_4;
    }
    sub_1BA1787C0();
    swift_allocError();
    *(_QWORD *)v23 = v17;
    *(_QWORD *)(v23 + 8) = v16;
    *(_QWORD *)(v23 + 16) = 0;
    *(_BYTE *)(v23 + 24) = 3;
    swift_bridgeObjectRetain();
    swift_willThrow();
    return (_QWORD *)swift_release();
  }
  return result;
}

void sub_1BA183E38(char a1@<W1>, _QWORD *a2@<X2>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, CGFloat Width@<D2>, CGFloat Height@<D3>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v12 = a2[2];
  v13 = a2[3];
  v14 = a2[4];
  v15 = a2[5];
  if ((a1 & 1) != 0)
    Width = CGRectGetWidth(*(CGRect *)&v12);
  else
    Height = CGRectGetHeight(*(CGRect *)&v12);
  *(double *)a3 = a4;
  *(double *)(a3 + 8) = a5;
  *(CGFloat *)(a3 + 16) = Width;
  *(CGFloat *)(a3 + 24) = Height;
  *(_BYTE *)(a3 + 32) = 1;
}

_QWORD *sub_1BA183EA4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BA183C68(a1, a2, a3, a4);
}

uint64_t sub_1BA183EB8()
{
  uint64_t v0;
  __int128 v2;

  BYTE8(v2) = 0;
  sub_1BA19AEA0();
  sub_1BA17C214();
  OUTLINED_FUNCTION_1_20();
  sub_1BA19ABD0();
  *(_QWORD *)&v2 = *(unsigned __int8 *)(v0 + 40);
  OUTLINED_FUNCTION_1_20();
  sub_1BA19ABD0();
  swift_bridgeObjectRetain();
  sub_1BA19ABD0();
  swift_bridgeObjectRelease();
  sub_1BA19ABD0();
  return *(_QWORD *)((char *)&v2 + 1);
}

uint64_t sub_1BA183FB8()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_1BA183FDC()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BA184008(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for ResizeConstrainingSizer(a2, a1);
  return a2;
}

uint64_t sub_1BA18403C()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BA18406C()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1BA184090(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  uint64_t v5;

  sub_1BA183E38(*(_BYTE *)(v5 + 16), *(_QWORD **)(v5 + 24), a1, a2, a3, a4, a5);
}

ValueMetadata *type metadata accessor for InvertSizer()
{
  return &type metadata for InvertSizer;
}

_QWORD *sub_1BA1840AC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v10 = *a1;
  v11 = v4[3];
  v12 = v4[4];
  __swift_project_boxed_opaque_existential_1(v4, v11);
  result = (*(_QWORD *(**)(uint64_t *__return_ptr, uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v12 + 16))(&v16, a1, a2, a3, *(_QWORD *)(v10 + 80), *(_QWORD *)(v10 + 88), v11, v12);
  if (!v5)
  {
    v14 = v16;
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v14;
    *(_QWORD *)(v15 + 24) = sub_1BA1842E8;
    *(_QWORD *)(v15 + 32) = a1;
    *a4 = v15 | 0x6000000000000000;
    return (_QWORD *)swift_retain();
  }
  return result;
}

void sub_1BA18417C(uint64_t a1@<X1>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  char v11;
  double v12;
  double Height;
  double Width;
  CGRect v18;
  CGRect v19;

  v11 = *(_BYTE *)(a1 + 48);
  v12 = Cursor.remainingBounds.getter();
  if ((v11 & 1) != 0)
  {
    Height = CGRectGetHeight(*(CGRect *)&v12);
    v18.origin.x = a3;
    v18.origin.y = a4;
    v18.size.width = a5;
    v18.size.height = a6;
    a6 = Height - CGRectGetHeight(v18);
  }
  else
  {
    Width = CGRectGetWidth(*(CGRect *)&v12);
    v19.origin.x = a3;
    v19.origin.y = a4;
    v19.size.width = a5;
    v19.size.height = a6;
    a5 = Width - CGRectGetWidth(v19);
  }
  *(CGFloat *)a2 = a3;
  *(CGFloat *)(a2 + 8) = a4;
  *(CGFloat *)(a2 + 16) = a5;
  *(CGFloat *)(a2 + 24) = a6;
  *(_BYTE *)(a2 + 32) = 1;
}

_QWORD *sub_1BA18422C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BA1840AC(a1, a2, a3, a4);
}

uint64_t sub_1BA184240()
{
  sub_1BA17C214();
  sub_1BA19AF3C();
  sub_1BA19ABD0();
  return 0;
}

uint64_t sub_1BA1842B8()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_1BA1842E8(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  uint64_t v5;

  sub_1BA18417C(v5, a1, a2, a3, a4, a5);
}

uint64_t sub_1BA1842F0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>)
{
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  OUTLINED_FUNCTION_0_16();
  if (*(_QWORD *)(a1 + 64))
  {
    v6 = *(double *)(a1 + 72);
    v7 = *(double *)(a1 + 80);
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
    {
      OUTLINED_FUNCTION_0_16();
      v8 = *(_QWORD *)(a1 + 488);
      v9 = *(_QWORD *)(a1 + 496);
      v10 = OUTLINED_FUNCTION_6();
      v11 = OUTLINED_FUNCTION_6();
      *(_QWORD *)(v11 + 16) = v8;
      *(_QWORD *)(v11 + 24) = v9;
      *(double *)(v11 + 32) = v6;
      *(double *)(v11 + 40) = v7 * a3;
      v12 = qword_1ED5C9B18;
      swift_bridgeObjectRetain();
      if (v12 != -1)
        swift_once();
      OUTLINED_FUNCTION_1_21((char *)&word_1ED5C8FE0);
      v13 = OUTLINED_FUNCTION_6();
      *(_OWORD *)(v13 + 16) = xmmword_1BA19C0E0;
      *(double *)(v13 + 32) = v7;
      *(_BYTE *)(v13 + 40) = 1;
      *(_QWORD *)(v10 + 24) = MEMORY[0x1E0DEE9D8];
      *(_QWORD *)(v10 + 32) = v13;
    }
    else
    {
      OUTLINED_FUNCTION_0_16();
      v16 = *(_QWORD *)(a1 + 488);
      v17 = *(_QWORD *)(a1 + 496);
      v10 = OUTLINED_FUNCTION_6();
      v18 = OUTLINED_FUNCTION_6();
      *(_QWORD *)(v18 + 16) = v16;
      *(_QWORD *)(v18 + 24) = v17;
      *(double *)(v18 + 32) = v6 * a3;
      *(double *)(v18 + 40) = v7;
      v19 = qword_1ED5C9B18;
      swift_bridgeObjectRetain();
      if (v19 != -1)
        swift_once();
      OUTLINED_FUNCTION_1_21((char *)&word_1ED5C8FE0);
      v20 = OUTLINED_FUNCTION_6();
      *(_OWORD *)(v20 + 16) = xmmword_1BA19C0E0;
      *(double *)(v20 + 32) = v6;
      *(_BYTE *)(v20 + 40) = 1;
      v21 = MEMORY[0x1E0DEE9D8];
      *(_QWORD *)(v10 + 24) = v20;
      *(_QWORD *)(v10 + 32) = v21;
    }
    result = swift_bridgeObjectRelease();
    v15 = 0x4000000000000000;
  }
  else
  {
    result = OUTLINED_FUNCTION_6();
    v10 = result;
    *(_QWORD *)(result + 40) = &type metadata for FlexibleSizer;
    *(_QWORD *)(result + 48) = &off_1E71E6180;
    *(double *)(result + 16) = a3;
    v15 = 0x2000000000000000;
  }
  *a2 = v15 | v10;
  return result;
}

uint64_t sub_1BA18451C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  double *v2;

  return sub_1BA1842F0(a1, a2, *v2);
}

uint64_t sub_1BA184534()
{
  sub_1BA19ACF0();
  sub_1BA19ABD0();
  swift_bridgeObjectRelease();
  sub_1BA19ABD0();
  return 0x656C626978656C66;
}

uint64_t sub_1BA18459C()
{
  return sub_1BA184534();
}

ValueMetadata *type metadata accessor for FlexibleSizer()
{
  return &type metadata for FlexibleSizer;
}

uint64_t sub_1BA1845B4()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BA1845EC()
{
  return swift_deallocObject();
}

uint64_t sub_1BA1845FC()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t storeEnumTagSinglePayload for BoolCondition(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BA18466C + 4 * byte_1BA19D951[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1BA1846A0 + 4 * byte_1BA19D94C[v4]))();
}

uint64_t sub_1BA1846A0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA1846A8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA1846B0);
  return result;
}

uint64_t sub_1BA1846BC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA1846C4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1BA1846C8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA1846D0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BoolCondition()
{
  return &type metadata for BoolCondition;
}

uint64_t sub_1BA1846EC()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t CursorFramePass.description.getter()
{
  uint64_t v0;

  if (!*(_QWORD *)(v0 + 8))
    return 7631665;
  sub_1BA19ABD0();
  return 0x202C646E32;
}

_QWORD *initializeBufferWithCopyOfBuffer for CursorFramePass(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for CursorFramePass(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for CursorFramePass(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CursorFramePass(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CursorFramePass(uint64_t result, unsigned int a2, unsigned int a3)
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

_QWORD *sub_1BA184894(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for CursorFramePass()
{
  return &type metadata for CursorFramePass;
}

uint64_t sub_1BA1848C8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  double v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  CGFloat v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double Height;
  double Width;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  char v27;
  uint64_t v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v5 = v2;
  v8 = *(double *)v5;
  v9 = *(unsigned __int8 *)(v5 + 8);
  if (v9 >> 6)
  {
    if (v9 >> 6 == 1)
    {
      OUTLINED_FUNCTION_0_22();
      OUTLINED_FUNCTION_2_17();
      v11 = v10;
      v29.origin.x = Cursor.remainingBounds.getter();
      v12 = CGRectGetWidth(v29) * v8;
      result = OUTLINED_FUNCTION_9();
      v14 = result;
      *(double *)(result + 16) = v3;
      *(_QWORD *)(result + 24) = v4;
      *(_QWORD *)(result + 32) = v11;
      *(CGFloat *)(result + 40) = v12;
      goto LABEL_15;
    }
    v31.origin.x = Cursor.remainingBounds.getter();
    Height = CGRectGetHeight(v31);
    if ((v9 & 1) != 0)
      v3 = dbl_1BA19DA00[*(_QWORD *)&v8];
    else
      v3 = v8;
    v32.origin.x = Cursor.remainingBounds.getter();
    Width = CGRectGetWidth(v32);
    v33.origin.x = Cursor.remainingBounds.getter();
    if (CGRectGetHeight(v33) > Width
      || (v17 = Height * v3, v34.origin.x = Cursor.remainingBounds.getter(), Height * v3 > CGRectGetWidth(v34)))
    {
      OUTLINED_FUNCTION_0_22();
      v20 = *(_QWORD *)(a1 + 488);
      v21 = *(_QWORD *)(a1 + 496);
      Cursor.remainingBounds.getter();
      v23 = v22;
      v35.origin.x = Cursor.remainingBounds.getter();
      v24 = CGRectGetWidth(v35);
      if ((v9 & 1) != 0)
        v25 = dbl_1BA19DA00[*(_QWORD *)&v8];
      else
        v25 = v8;
      v26 = v24 / v25;
      result = OUTLINED_FUNCTION_9();
      v14 = result;
      *(_QWORD *)(result + 16) = v20;
      *(_QWORD *)(result + 24) = v21;
      *(_QWORD *)(result + 32) = v23;
      *(double *)(result + 40) = v26;
      goto LABEL_15;
    }
    OUTLINED_FUNCTION_0_22();
    OUTLINED_FUNCTION_2_17();
    v16 = v28;
  }
  else
  {
    OUTLINED_FUNCTION_0_22();
    OUTLINED_FUNCTION_2_17();
    v16 = v15;
    v30.origin.x = Cursor.remainingBounds.getter();
    v17 = CGRectGetHeight(v30) * v8;
  }
  result = OUTLINED_FUNCTION_9();
  v14 = result;
  *(double *)(result + 16) = v3;
  *(_QWORD *)(result + 24) = v4;
  *(double *)(result + 32) = v17;
  *(_QWORD *)(result + 40) = v16;
LABEL_15:
  if (qword_1ED5C9B18 != -1)
    result = swift_once();
  v27 = HIBYTE(word_1ED5C8FE0);
  *(_BYTE *)(v14 + 48) = word_1ED5C8FE0;
  *(_BYTE *)(v14 + 49) = v27;
  *a2 = v14;
  return result;
}

uint64_t sub_1BA184A90@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BA1848C8(a1, a2);
}

uint64_t sub_1BA184AA4()
{
  sub_1BA19ABD0();
  sub_1BA19AF3C();
  sub_1BA19ABD0();
  return 0;
}

uint64_t getEnumTagSinglePayload for Ratio(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0x7E && *(_BYTE *)(a1 + 9))
    {
      v2 = *(_DWORD *)a1 + 125;
    }
    else
    {
      v2 = ((*(unsigned __int8 *)(a1 + 8) >> 6) & 0xFFFFFF83 | (4 * ((*(unsigned __int8 *)(a1 + 8) >> 1) & 0x1F))) ^ 0x7F;
      if (v2 >= 0x7D)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for Ratio(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 126;
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_BYTE *)(result + 8) = 2 * (((-a2 >> 2) & 0x1F) - 32 * a2);
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RatioSizer()
{
  return &type metadata for RatioSizer;
}

uint64_t sub_1BA184BE8()
{
  return swift_deallocObject();
}

__n128 sub_1BA184BF8@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;

  v2 = *(_QWORD *)(v1 + 8) + 328;
  v3 = *(_OWORD *)(*(_QWORD *)(v1 + 8) + 344);
  *(_OWORD *)a1 = *(_OWORD *)v2;
  *(_OWORD *)(a1 + 16) = v3;
  v4 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  v5 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  result = *(__n128 *)(v2 + 96);
  *(__n128 *)(a1 + 96) = result;
  return result;
}

double DimensionCursor.origin.getter()
{
  uint64_t v0;
  double result;
  uint64_t v2;

  result = 0.0;
  if ((*(_BYTE *)v0 & 1) == 0)
  {
    v2 = *(_QWORD *)(v0 + 8);
    if (*(_BYTE *)(v2 + 328) != 3)
      return *(double *)(v2 + 416);
  }
  return result;
}

uint64_t sub_1BA184C48(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  return a1;
}

uint64_t sub_1BA184C7C(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1BA184CBC(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t sub_1BA184CF4(uint64_t a1, int a2)
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

uint64_t sub_1BA184D34(uint64_t result, int a2, int a3)
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

_BYTE *sub_1BA184D70@<X0>(_BYTE *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_BYTE *)a3 = *result;
  *(_QWORD *)(a3 + 8) = a2;
  return result;
}

double sub_1BA184D80()
{
  return Cursor.scaleFactor.getter();
}

uint64_t HOverlay<A>(name:reversed:sizing:on:embedPath:)(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_1BA184E3C(a1, a2, a3, a4, a5, a6, a7, a8, a9, 0, (uint64_t (*)(void))sub_1BA184DD4);
}

uint64_t (*sub_1BA184DD4())()
{
  swift_retain();
  return sub_1BA185430;
}

uint64_t VOverlay<A>(name:reversed:sizing:on:embedPath:)(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_1BA184E3C(a1, a2, a3, a4, a5, a6, a7, a8, a9, 1, (uint64_t (*)(void))sub_1BA184F24);
}

uint64_t sub_1BA184E3C(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t (*a11)(void))
{
  unint64_t v17;
  uint64_t v18;
  char v20;
  unint64_t v21;

  v17 = *a4;
  type metadata accessor for Overlay(0, a8, a9, (uint64_t)a4);
  v21 = v17;
  v20 = a10;
  sub_1BA1683F8(v17);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BA1654E8((uint64_t *)&v21, &v20, a1, a2, a5, a6, a7, a3);
  v18 = a11();
  swift_release();
  return v18;
}

uint64_t (*sub_1BA184F24())()
{
  swift_retain();
  return sub_1BA185434;
}

uint64_t *sub_1BA184F54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  char v28;
  id v29;
  id v30;
  uint64_t v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  char v37;
  __int128 v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43[2];
  _BYTE v44[2];
  uint64_t v45[5];
  char v46;
  __int128 v47[7];
  _QWORD v48[2];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  _QWORD *v66;
  uint64_t v67[3];
  uint64_t v68;

  v10 = *v4;
  sub_1BA1851F4();
  if (!v5)
  {
    v12 = (_QWORD *)v11;
    v68 = a3;
    sub_1BA18F318(v11);
    type metadata accessor for Cursor(0, *(_QWORD *)(v10 + 272), *(_QWORD *)(v10 + 280), v13);
    v14 = v12[4];
    v41 = v12[3];
    v42 = v12[2];
    v15 = v12[5];
    v35 = *(_OWORD *)(a1 + 160);
    v36 = *(_OWORD *)(a1 + 144);
    v16 = *(_QWORD *)(a1 + 192);
    v17 = *(_QWORD *)(a1 + 200);
    v18 = *(void **)(a1 + 208);
    v33 = *(_OWORD *)(a1 + 216);
    v34 = *(_OWORD *)(a1 + 176);
    v19 = *(_QWORD *)(a1 + 232);
    v20 = *(_QWORD *)(a1 + 240);
    v39 = *(void **)(a1 + 272);
    v40 = *(_QWORD *)(a1 + 264);
    v38 = *(_OWORD *)(a1 + 280);
    v21 = *(_QWORD *)(a1 + 296);
    v22 = *(_QWORD *)(a1 + 304);
    v37 = *(_BYTE *)(a1 + 312);
    v48[0] = 0xF000000000000007;
    *(_QWORD *)&v47[0] = 0xF000000000000007;
    v45[0] = 0xF000000000000007;
    v67[0] = 0xF000000000000007;
    type metadata accessor for LayoutMarginAdjuster();
    swift_allocObject();
    v23 = LayoutMarginAdjuster.init(top:left:bottom:right:)(v48, (uint64_t *)v47, v45, v67);
    v48[0] = v14;
    v48[1] = v15;
    v49 = v36;
    v50 = v35;
    v51 = v34;
    v52 = v16;
    v53 = v17;
    v54 = v18;
    v55 = v33;
    v56 = v19;
    v57 = v20;
    v58 = 0;
    v59 = 0;
    v60 = v40;
    v61 = v39;
    v62 = v38;
    v63 = v21;
    v64 = v22;
    v65 = v37;
    v66 = v23;
    v24 = *(_OWORD *)(a1 + 344);
    v47[0] = *(_OWORD *)(a1 + 328);
    v47[1] = v24;
    v25 = *(_OWORD *)(a1 + 376);
    v47[2] = *(_OWORD *)(a1 + 360);
    v47[3] = v25;
    v26 = *(_OWORD *)(a1 + 408);
    v47[4] = *(_OWORD *)(a1 + 392);
    v27 = *(_OWORD *)(a1 + 424);
    v47[5] = v26;
    v47[6] = v27;
    v46 = *(_BYTE *)(a1 + 48);
    sub_1BA16AECC(a1 + 544, (uint64_t)v45);
    v67[0] = 0x8000000000000000;
    v28 = *(_BYTE *)(a1 + 440);
    v29 = v18;
    v30 = v39;
    sub_1BA18E954(v44);
    v43[0] = v44[0];
    v43[1] = v44[1];
    v31 = sub_1BA180820((uint64_t)v48, v47, &v46, (uint64_t)v45, v42, v41, 0, v43, v67, v28);
    v4 = (uint64_t *)sub_1BA18E9B0(v31, a2, v68, a4);
    swift_release();
    swift_release();
  }
  return v4;
}

void sub_1BA1851F4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
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
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0[13];
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain_n();
    swift_retain();
    v3 = v1 + 40;
    v4 = 0.0;
    v5 = 0.0;
    do
    {
      swift_bridgeObjectRetain();
      LayoutContext.embedContext(for:)();
      if (v6)
      {
        v7 = *(double *)(v6 + 40);
        v5 = v5 + *(double *)(v6 + 32);
        swift_release();
        swift_bridgeObjectRelease();
        v4 = v4 + v7;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v3 += 16;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease_n();
    v9 = v0[11];
    v8 = v0[12];
    LayoutContext.contextFrame(for:)();
    if (v10)
    {
      v11 = v10;
      sub_1BA19ADA4();
      sub_1BA19ADB0();
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      swift_release();
      v20 = *(_BYTE *)(v11 + 48);
      swift_release();
      type metadata accessor for LayoutContextFrame();
      v21 = swift_allocObject();
      *(_QWORD *)(v21 + 16) = v13;
      *(_QWORD *)(v21 + 24) = v15;
      *(_QWORD *)(v21 + 32) = v17;
      *(_QWORD *)(v21 + 40) = v19;
      *(_BYTE *)(v21 + 48) = v20;
    }
    else
    {
      sub_1BA1787C0();
      swift_allocError();
      *(_QWORD *)v26 = v1;
      *(_QWORD *)(v26 + 8) = v9;
      *(_QWORD *)(v26 + 16) = v8;
      *(_BYTE *)(v26 + 24) = 5;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_willThrow();
      swift_release();
    }
  }
  else
  {
    v23 = v0[11];
    v22 = v0[12];
    LayoutContext.contextFrame(for:)();
    if (!v24)
    {
      sub_1BA1787C0();
      swift_allocError();
      *(_QWORD *)v25 = v23;
      *(_QWORD *)(v25 + 8) = v22;
      *(_QWORD *)(v25 + 16) = 0;
      *(_BYTE *)(v25 + 24) = 4;
      swift_bridgeObjectRetain();
      swift_willThrow();
    }
  }
}

uint64_t sub_1BA185414()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

ValueMetadata *type metadata accessor for TextLinesSizer()
{
  return &type metadata for TextLinesSizer;
}

_QWORD *sub_1BA185448@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  _OWORD v19[3];
  char v20;

  v6 = v4;
  v11 = *a1;
  v12 = v6[3];
  v13 = v6[4];
  __swift_project_boxed_opaque_existential_1(v6, v12);
  result = (*(_QWORD *(**)(_OWORD *__return_ptr, uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v13 + 16))(v19, a1, a2, a3, *(_QWORD *)(v11 + 80), *(_QWORD *)(v11 + 88), v12, v13);
  if (!v5)
  {
    v15 = *(_QWORD *)&v19[0];
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v15;
    sub_1BA16F9F8((uint64_t)v6, (uint64_t)v19);
    v17 = swift_allocObject();
    v18 = v19[1];
    *(_OWORD *)(v17 + 16) = v19[0];
    *(_OWORD *)(v17 + 32) = v18;
    *(_OWORD *)(v17 + 48) = v19[2];
    *(_BYTE *)(v17 + 64) = v20;
    *(_QWORD *)(v17 + 72) = v15;
    *(_QWORD *)(v16 + 24) = sub_1BA1858F0;
    *(_QWORD *)(v16 + 32) = v17;
    *a4 = v16 | 0x6000000000000000;
    return (_QWORD *)swift_retain();
  }
  return result;
}

void sub_1BA18556C(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, CGFloat a5@<D0>, CGFloat a6@<D1>, CGFloat a7@<D2>, CGFloat a8@<D3>)
{
  int64_t v15;
  double Width;
  double v17;
  double v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  char v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  id v36[2];
  uint64_t v37;
  CGRect v38;
  CGRect v39;

  v15 = *(_QWORD *)(a2 + 40);
  if (*(_BYTE *)(a2 + 48) == 1)
  {
    if (v15 >= 1)
    {
      Width = CGRectGetWidth(*(CGRect *)&a5);
      SizerResult.text.getter();
      v30 = v34;
      v31 = v35;
      v28 = v36[0];
      v32 = *(_OWORD *)v36;
      v33 = v37;
      sub_1BA16EF7C(v15, a1 & 1, (uint64_t)&v30, Width);
      v18 = v17;

      v38.origin.x = a5;
      v38.origin.y = a6;
      v38.size.width = a7;
      v38.size.height = a8;
      if (v18 < CGRectGetHeight(v38))
      {
        *(_QWORD *)&v30 = a3;
        SizerResult.text.getter();
        v19 = v36[0];
        if (v36[0])
        {
          objc_msgSend(v36[0], sel_boundingRectWithSize_options_context_, 33, 0, *(double *)&v36[1], v18);
          v21 = v20;
          v23 = v22;

          *(CGFloat *)a4 = a5;
          *(CGFloat *)(a4 + 8) = a6;
          *(_QWORD *)(a4 + 16) = v21;
          *(_QWORD *)(a4 + 24) = v23;
        }
        else
        {
          *(CGFloat *)a4 = a5;
          *(CGFloat *)(a4 + 8) = a6;
          *(CGFloat *)(a4 + 16) = a7;
          *(double *)(a4 + 24) = v18;
        }
        goto LABEL_11;
      }
    }
  }
  else if (v15 >= 1)
  {
    v24 = CGRectGetWidth(*(CGRect *)&a5);
    SizerResult.text.getter();
    v30 = v34;
    v31 = v35;
    v29 = v36[0];
    v32 = *(_OWORD *)v36;
    v33 = v37;
    sub_1BA16EF7C(v15, a1 & 1, (uint64_t)&v30, v24);
    v26 = v25;

    v39.origin.x = a5;
    v39.origin.y = a6;
    v39.size.width = a7;
    v39.size.height = a8;
    if (CGRectGetHeight(v39) < v26)
    {
      *(_OWORD *)a4 = 0u;
      *(_OWORD *)(a4 + 16) = 0u;
LABEL_11:
      v27 = 1;
      goto LABEL_12;
    }
  }
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  v27 = 2;
LABEL_12:
  *(_BYTE *)(a4 + 32) = v27;
}

_QWORD *sub_1BA185788@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BA185448(a1, a2, a3, a4);
}

uint64_t sub_1BA18579C()
{
  uint64_t v0;

  sub_1BA185800(*(_QWORD *)(v0 + 40), *(_BYTE *)(v0 + 48));
  sub_1BA19ABD0();
  swift_bridgeObjectRelease();
  return 0x656E694C74786574;
}

uint64_t sub_1BA185800(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v4;

  if ((a2 & 1) != 0)
    v2 = 678977901;
  else
    v2 = 678324589;
  v4 = v2;
  sub_1BA19AFD8();
  sub_1BA19ABD0();
  swift_bridgeObjectRelease();
  sub_1BA19ABD0();
  return v4;
}

uint64_t sub_1BA185884()
{
  uint64_t v0;

  return sub_1BA185800(*(_QWORD *)v0, *(_BYTE *)(v0 + 8));
}

uint64_t sub_1BA185890()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BA1858C0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return swift_deallocObject();
}

void sub_1BA1858F0(char a1@<W0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  uint64_t v6;

  sub_1BA18556C(a1, v6 + 16, *(_QWORD *)(v6 + 72), a2, a3, a4, a5, a6);
}

ValueMetadata *type metadata accessor for TextLinesSizer.Lines()
{
  return &type metadata for TextLinesSizer.Lines;
}

_QWORD *sub_1BA18590C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_1BA185944(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_1BA185974(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD *__return_ptr, char *), uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  void (*v32)(uint64_t, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(_QWORD *__return_ptr, char *);
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[3];
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v43 = a4;
  v41 = a3;
  v42 = a5;
  v49 = a2;
  OUTLINED_FUNCTION_4_15();
  v9 = MEMORY[0x1E0C80A78](v7, v8);
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = v12;
  v13 = *(_QWORD *)(v12 + 80);
  v14 = *(_QWORD *)(v13 - 8);
  v16 = MEMORY[0x1E0C80A78](v9, v15);
  v45 = OUTLINED_FUNCTION_0_24(v16, v17, v18, v19, v20, v21, v22);
  v23 = *(_QWORD *)(v45 - 8);
  v25 = MEMORY[0x1E0C80A78](v45, v24);
  v27 = (char *)&v39 - v26;
  OUTLINED_FUNCTION_3_19(v25, v28, v29, v30);
  v31 = (uint64_t *)OUTLINED_FUNCTION_2_18();
  v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16);
  v33 = v41;
  v32(v5, v49, v13);
  OUTLINED_FUNCTION_6_10();
  sub_1BA17A338(v31, (uint64_t)v11, v33, v34, v27);
  swift_retain();
  swift_retain();
  v35 = v44;
  v43(v46, v27);
  if (v35)
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v27, v45);
  }
  else
  {
    v44 = v23;
    v36 = v47;
    v37 = v48;
    __swift_project_boxed_opaque_existential_1(v46, v47);
    v23 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(v37 + 8))(a1, v49, v33, v13, *(_QWORD *)(v40 + 88), v36, v37);
    OUTLINED_FUNCTION_1_22();
    OUTLINED_FUNCTION_5_14();
  }
  return v23;
}

uint64_t sub_1BA185B3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(_QWORD *__return_ptr, char *)@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
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
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  void (*v33)(uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
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
  void (*v49)(_QWORD *__return_ptr, char *);
  uint64_t v50;
  _QWORD v51[3];
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v49 = a4;
  v48 = a5;
  v46 = a3;
  v44 = a6;
  OUTLINED_FUNCTION_4_15();
  v11 = MEMORY[0x1E0C80A78](v9, v10);
  v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = v14;
  v15 = *(_QWORD *)(v14 + 80);
  v16 = *(_QWORD *)(v15 - 8);
  v18 = MEMORY[0x1E0C80A78](v11, v17);
  v47 = OUTLINED_FUNCTION_0_24(v18, v19, v20, v21, v22, v23, v24);
  v54 = *(_QWORD *)(v47 - 8);
  v26 = MEMORY[0x1E0C80A78](v47, v25);
  v28 = (char *)&v42 - v27;
  OUTLINED_FUNCTION_3_19(v26, v29, v30, v31);
  v32 = (uint64_t *)OUTLINED_FUNCTION_2_18();
  v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
  v34 = v46;
  v45 = a2;
  v33(v6, a2, v15);
  OUTLINED_FUNCTION_6_10();
  sub_1BA17A338(v32, (uint64_t)v13, v34, v35, v28);
  swift_retain();
  v36 = a1;
  swift_retain();
  v37 = v50;
  v49(v51, v28);
  if (v37)
    return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v28, v47);
  v39 = v47;
  v40 = v52;
  v41 = v53;
  __swift_project_boxed_opaque_existential_1(v51, v52);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(v41 + 16))(v36, v45, v34, v15, *(_QWORD *)(v43 + 88), v40, v41);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v28, v39);
  return OUTLINED_FUNCTION_5_14();
}

uint64_t sub_1BA185D14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1BA185974(a1, a2, a3, *(void (**)(_QWORD *__return_ptr, char *))v3, *(_QWORD *)(v3 + 8));
}

uint64_t sub_1BA185D34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;

  return sub_1BA185B3C(a1, a2, a3, *(void (**)(_QWORD *__return_ptr, char *))v4, *(_QWORD *)(v4 + 8), a4);
}

uint64_t sub_1BA185D54()
{
  return 0x63696D616E7964;
}

uint64_t *assignWithCopy for OffsetSizer(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  a1[5] = a2[5];
  a1[6] = a2[6];
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

uint64_t assignWithTake for OffsetSizer(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for OffsetSizer(uint64_t a1, int a2)
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
      v2 = *(_QWORD *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for OffsetSizer(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for OffsetSizer()
{
  return &type metadata for OffsetSizer;
}

uint64_t sub_1BA185EA0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t inited;

  v5 = v3;
  v9 = *a1;
  v10 = *(_QWORD *)(v5 + 24);
  v11 = *(_QWORD *)(v5 + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)v5, v10);
  result = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v11 + 8))(a1, a2, a3, *(_QWORD *)(v9 + 80), *(_QWORD *)(v9 + 88), v10, v11);
  v13 = result;
  if (!v4)
  {
    sub_1BA170980();
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1BA19C0E0;
    *(_OWORD *)(inited + 32) = *(_OWORD *)(v5 + 40);
    *(_BYTE *)(inited + 48) = 0;
    return sub_1BA1709C8(inited, v13);
  }
  return result;
}

_QWORD *sub_1BA185F6C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  _OWORD v21[3];
  uint64_t v22;

  v6 = v4;
  v11 = *a1;
  v12 = v6[3];
  v13 = v6[4];
  __swift_project_boxed_opaque_existential_1(v6, v12);
  result = (*(_QWORD *(**)(_OWORD *__return_ptr, uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v13 + 16))(v21, a1, a2, a3, *(_QWORD *)(v11 + 80), *(_QWORD *)(v11 + 88), v12, v13);
  if (!v5)
  {
    v15 = *(_QWORD *)&v21[0];
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v15;
    v17 = v6[5];
    v18 = v6[6];
    sub_1BA171C3C((uint64_t)v6, (uint64_t)v21);
    v19 = swift_allocObject();
    v20 = v21[1];
    *(_OWORD *)(v19 + 16) = v21[0];
    *(_OWORD *)(v19 + 32) = v20;
    *(_OWORD *)(v19 + 48) = v21[2];
    *(_QWORD *)(v19 + 64) = v22;
    *(_QWORD *)(v19 + 72) = v17;
    *(_QWORD *)(v19 + 80) = v18;
    *(_QWORD *)(v19 + 88) = a1;
    *(_QWORD *)(v16 + 24) = sub_1BA186290;
    *(_QWORD *)(v16 + 32) = v19;
    *a4 = v16 | 0x7000000000000000;
    return (_QWORD *)swift_retain();
  }
  return result;
}

double sub_1BA1860A0(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, uint64_t a6, uint64_t a7)
{
  double v11;
  CGRect v13;

  if (*(_BYTE *)(a7 + 440) == 1 && !*(_BYTE *)(a7 + 48))
    a5 = -a5;
  v11 = a5 + a1;
  CGRectGetWidth(*(CGRect *)&a1);
  v13.origin.x = a1;
  v13.origin.y = a2;
  v13.size.width = a3;
  v13.size.height = a4;
  CGRectGetHeight(v13);
  return v11;
}

uint64_t sub_1BA186158(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_1BA185EA0(a1, a2, a3);
}

_QWORD *sub_1BA18616C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BA185F6C(a1, a2, a3, a4);
}

uint64_t sub_1BA186180()
{
  sub_1BA17C214();
  OUTLINED_FUNCTION_1_20();
  sub_1BA19ABD0();
  type metadata accessor for CGPoint(0);
  OUTLINED_FUNCTION_1_20();
  sub_1BA19ABD0();
  return 0;
}

uint64_t sub_1BA186234()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BA186264()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return swift_deallocObject();
}

double sub_1BA186290(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  uint64_t v4;

  return sub_1BA1860A0(a1, a2, a3, a4, *(double *)(v4 + 72), v4 + 16, *(_QWORD *)(v4 + 88));
}

uint64_t initializeBufferWithCopyOfBuffer for LayoutDecoderObject(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for LayoutDecoderObject()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for LayoutDecoderObject(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for LayoutDecoderObject(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for LayoutDecoderObject()
{
  return &type metadata for LayoutDecoderObject;
}

uint64_t sub_1BA186378()
{
  return sub_1BA170734((uint64_t)&unk_1E71E27D0);
}

uint64_t sub_1BA1863A4@<X0>(uint64_t a1@<X0>, void *a2@<X3>, uint64_t *a3@<X8>)
{
  double v6;
  double v7;
  CGFloat width;
  CGFloat height;
  id v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  CGRect v18;

  OUTLINED_FUNCTION_0_16();
  if (*(_QWORD *)(a1 + 64))
  {
    v6 = *(double *)(a1 + 80);
    if (v6 <= 0.0)
    {
      result = OUTLINED_FUNCTION_6();
      v13 = result;
      *(_OWORD *)(result + 16) = 0u;
      *(_OWORD *)(result + 32) = 0u;
      if (qword_1ED5C9B18 != -1)
        result = swift_once();
      v14 = HIBYTE(word_1ED5C8FE0);
      *(_BYTE *)(v13 + 48) = word_1ED5C8FE0;
      *(_BYTE *)(v13 + 49) = v14;
      *a3 = v13;
    }
    else
    {
      v7 = *(double *)(a1 + 72);
      swift_bridgeObjectRetain();
      objc_msgSend(a2, sel_boundingRectWithSize_options_context_, 33, 0, v7, v6);
      width = v18.size.width;
      height = v18.size.height;
      if (trunc(CGRectGetHeight(v18)) <= trunc(v6))
      {
        OUTLINED_FUNCTION_0_16();
        v15 = *(_QWORD *)(a1 + 488);
        v16 = *(_QWORD *)(a1 + 496);
        v17 = a2;
        OUTLINED_FUNCTION_1_23();
        result = OUTLINED_FUNCTION_6();
        *(_QWORD *)(result + 16) = v15;
        *(_QWORD *)(result + 24) = v16;
        *(CGFloat *)(result + 32) = width;
        *(CGFloat *)(result + 40) = height;
        *(_QWORD *)(result + 48) = v15;
        *(_QWORD *)(result + 56) = v16;
        *(CGFloat *)(result + 64) = width;
        *(CGFloat *)(result + 72) = height;
      }
      else
      {
        v10 = a2;
        OUTLINED_FUNCTION_1_23();
        result = OUTLINED_FUNCTION_6();
        *(_OWORD *)(result + 16) = 0u;
        *(_OWORD *)(result + 32) = 0u;
        *(_OWORD *)(result + 48) = 0u;
        *(_OWORD *)(result + 64) = 0u;
      }
      *(_QWORD *)(result + 80) = a2;
      *(double *)(result + 88) = v7;
      *(double *)(result + 96) = v6;
      *a3 = result | 0x1000000000000000;
    }
  }
  else
  {
    v12 = OUTLINED_FUNCTION_6();
    *(_QWORD *)(v12 + 40) = &type metadata for FlexibleTextSizer;
    *(_QWORD *)(v12 + 48) = &off_1E71E6950;
    *(_QWORD *)(v12 + 16) = a2;
    *a3 = v12 | 0x2000000000000000;
    return (uint64_t)a2;
  }
  return result;
}

uint64_t sub_1BA186578()
{
  return sub_1BA186378();
}

uint64_t sub_1BA18658C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  void **v2;

  return sub_1BA1863A4(a1, *v2, a2);
}

uint64_t sub_1BA1865A4()
{
  return 0x656C626978656C66;
}

ValueMetadata *type metadata accessor for FlexibleTextSizer()
{
  return &type metadata for FlexibleTextSizer;
}

uint64_t sub_1BA1865D4()
{
  return swift_deallocObject();
}

uint64_t sub_1BA1865E4()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1BA186608()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

TeaTemplate::LayoutContentScale_optional __swiftcall LayoutContentScale.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  TeaTemplate::LayoutContentScale_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1BA19AFC0();
  result.value = swift_bridgeObjectRelease();
  v5 = 7;
  if (v3 < 7)
    v5 = v3;
  *v2 = v5;
  return result;
}

void sub_1BA186684()
{
  sub_1BA197A24();
}

void sub_1BA18668C()
{
  sub_1BA197C64();
}

TeaTemplate::LayoutContentScale_optional sub_1BA186694(Swift::String *a1)
{
  return LayoutContentScale.init(rawValue:)(*a1);
}

uint64_t SizerResult.cursorFrame.getter()
{
  return sub_1BA1866B8((uint64_t (*)(_QWORD))sub_1BA16996C);
}

uint64_t SizerResult.frame.getter()
{
  return sub_1BA1866B8((uint64_t (*)(_QWORD))sub_1BA16AA5C);
}

uint64_t sub_1BA1866B8(uint64_t (*a1)(_QWORD))
{
  char v2;

  SizerResult.nonIntegral.getter();
  return a1(v2 & 1);
}

double *static SizerResult.frame(_:)@<X0>(double **a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  double *result;
  double *v11;
  char v12;

  result = (double *)swift_allocObject();
  v11 = result;
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  result[5] = a5;
  if (qword_1ED5C9B18 != -1)
    result = (double *)swift_once();
  v12 = HIBYTE(word_1ED5C8FE0);
  *((_BYTE *)v11 + 48) = word_1ED5C8FE0;
  *((_BYTE *)v11 + 49) = v12;
  *a1 = v11;
  return result;
}

uint64_t sub_1BA186798(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = a2;
  sub_1BA186A8C(a1, (uint64_t)sub_1BA186A80, 0, isUniquelyReferenced_nonNull_native, &v8);
  v6 = v8;
  swift_bridgeObjectRelease();
  if (v2)
    swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1BA186814()
{
  return swift_deallocObject();
}

_QWORD *initializeBufferWithCopyOfBuffer for SizerResult(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for SizerResult()
{
  return swift_release();
}

_QWORD *assignWithCopy for SizerResult(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *assignWithTake for SizerResult(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SizerResult(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0x77 && *(_BYTE *)(a1 + 8))
    {
      v2 = *(_DWORD *)a1 + 118;
    }
    else
    {
      v2 = ((*(_QWORD *)a1 >> 60) & 0x8F | (16 * (*(_QWORD *)a1 & 7))) ^ 0x7F;
      if (v2 >= 0x76)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for SizerResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x76)
  {
    *(_QWORD *)result = a2 - 119;
    if (a3 >= 0x77)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x77)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
    {
      v3 = (-a2 >> 4) & 7 | (8 * (-a2 & 0x7F));
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_1BA18696C(_QWORD *a1)
{
  return *a1 >> 60;
}

_QWORD *sub_1BA186978(_QWORD *result)
{
  *result &= 0xFFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t *sub_1BA186988(uint64_t *result, uint64_t a2)
{
  *result = *result & 0xFFFFFFFFFFFFFF8 | (a2 << 60);
  return result;
}

ValueMetadata *type metadata accessor for SizerResult()
{
  return &type metadata for SizerResult;
}

uint64_t getEnumTagSinglePayload for SizerResult.ProcessResult(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 33))
    {
      v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 32);
      if (v3 <= 2)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SizerResult.ProcessResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t sub_1BA186A34(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 1u)
    return *(unsigned __int8 *)(a1 + 32);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_1BA186A4C(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 2;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
  }
  *(_BYTE *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SizerResult.ProcessResult()
{
  return &type metadata for SizerResult.ProcessResult;
}

uint64_t sub_1BA186A78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BA16E780(a3, a2);
}

uint64_t sub_1BA186A80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BA186A78(a1, a2, a1);
}

uint64_t sub_1BA186A8C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  _OWORD *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t result;
  _BYTE v22[32];
  _OWORD v23[2];
  _OWORD v24[2];
  __int128 v25;
  uint64_t v26;
  uint64_t v27;

  sub_1BA186F84(a1, a2, a3, &v27);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1BA186FC0(&v25);
  if (!v26)
  {
LABEL_14:
    swift_release();
    swift_bridgeObjectRelease();
    sub_1BA187164();
    return swift_release();
  }
  while (1)
  {
    sub_1BA16E7BC(&v25, v24);
    v7 = *a5;
    v9 = sub_1BA172B30();
    v10 = *(_QWORD *)(v7 + 16);
    v11 = (v8 & 1) == 0;
    v12 = v10 + v11;
    if (__OFADD__(v10, v11))
      break;
    v13 = v8;
    if (*(_QWORD *)(v7 + 24) >= v12)
    {
      if ((a4 & 1) != 0)
      {
        if ((v8 & 1) != 0)
          goto LABEL_9;
      }
      else
      {
        sub_1BA18716C(0, &qword_1EF2745A8, (uint64_t (*)(uint64_t, ValueMetadata *, uint64_t, unint64_t))MEMORY[0x1E0DECB20]);
        sub_1BA19AF60();
        if ((v13 & 1) != 0)
          goto LABEL_9;
      }
    }
    else
    {
      sub_1BA186C94(v12, a4 & 1);
      v14 = sub_1BA172B30();
      if ((v13 & 1) != (v15 & 1))
        goto LABEL_17;
      v9 = v14;
      if ((v13 & 1) != 0)
      {
LABEL_9:
        sub_1BA16E780(*(_QWORD *)(*a5 + 56) + 32 * v9, (uint64_t)v22);
        sub_1BA16E780((uint64_t)v22, (uint64_t)v23);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
        v16 = (_OWORD *)(*(_QWORD *)(*a5 + 56) + 32 * v9);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
        sub_1BA16E7BC(v23, v16);
        goto LABEL_13;
      }
    }
    v17 = *a5;
    *(_QWORD *)(*a5 + 8 * (v9 >> 6) + 64) |= 1 << v9;
    sub_1BA16E7BC(v24, (_OWORD *)(*(_QWORD *)(v17 + 56) + 32 * v9));
    v18 = *(_QWORD *)(v17 + 16);
    v19 = __OFADD__(v18, 1);
    v20 = v18 + 1;
    if (v19)
      goto LABEL_16;
    *(_QWORD *)(v17 + 16) = v20;
LABEL_13:
    sub_1BA186FC0(&v25);
    a4 = 1;
    if (!v26)
      goto LABEL_14;
  }
  __break(1u);
LABEL_16:
  __break(1u);
LABEL_17:
  result = sub_1BA19B0C8();
  __break(1u);
  return result;
}

uint64_t sub_1BA186C94(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  unint64_t i;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  _OWORD *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  _OWORD v31[2];

  v3 = v2;
  v5 = *v2;
  sub_1BA18716C(0, &qword_1ED5C87A0, MEMORY[0x1E0DECD58]);
  v6 = sub_1BA19AF9C();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v12 = (unint64_t)(v8 + 63) >> 6;
    v13 = v6 + 64;
    result = swift_retain();
    v15 = 0;
    if (!v11)
      goto LABEL_7;
LABEL_6:
    v16 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    for (i = v16 | (v15 << 6); ; i = __clz(__rbit64(v19)) + (v15 << 6))
    {
      v21 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * i);
      if ((a2 & 1) != 0)
        sub_1BA16E7BC(v21, v31);
      else
        sub_1BA16E780((uint64_t)v21, (uint64_t)v31);
      sub_1BA19B104();
      sub_1BA19ABC4();
      result = sub_1BA19B128();
      v22 = -1 << *(_BYTE *)(v7 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v13 + 8 * (v23 >> 6))) == 0)
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v22) >> 6;
        while (++v24 != v27 || (v26 & 1) == 0)
        {
          v28 = v24 == v27;
          if (v24 == v27)
            v24 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v13 + 8 * v24);
          if (v29 != -1)
          {
            v25 = __clz(__rbit64(~v29)) + (v24 << 6);
            goto LABEL_31;
          }
        }
        __break(1u);
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
        return result;
      }
      v25 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v13 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
      *(_QWORD *)(v13 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
      result = (uint64_t)sub_1BA16E7BC(v31, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v25));
      ++*(_QWORD *)(v7 + 16);
      if (v11)
        goto LABEL_6;
LABEL_7:
      v18 = v15 + 1;
      if (__OFADD__(v15, 1))
        goto LABEL_42;
      if (v18 >= v12)
        goto LABEL_33;
      v19 = v9[v18];
      ++v15;
      if (!v19)
      {
        v15 = v18 + 1;
        if (v18 + 1 >= v12)
          goto LABEL_33;
        v19 = v9[v15];
        if (!v19)
        {
          v20 = v18 + 2;
          if (v20 >= v12)
          {
LABEL_33:
            swift_release();
            if ((a2 & 1) == 0)
            {
              result = swift_release();
              v3 = v2;
              goto LABEL_40;
            }
            v30 = 1 << *(_BYTE *)(v5 + 32);
            if (v30 >= 64)
              sub_1BA1989E8(0, (unint64_t)(v30 + 63) >> 6, (_QWORD *)(v5 + 64));
            else
              *v9 = -1 << v30;
            v3 = v2;
            *(_QWORD *)(v5 + 16) = 0;
            break;
          }
          v19 = v9[v20];
          if (!v19)
          {
            while (1)
            {
              v15 = v20 + 1;
              if (__OFADD__(v20, 1))
                goto LABEL_43;
              if (v15 >= v12)
                goto LABEL_33;
              v19 = v9[v15];
              ++v20;
              if (v19)
                goto LABEL_18;
            }
          }
          v15 = v20;
        }
      }
LABEL_18:
      v11 = (v19 - 1) & v19;
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_1BA186F84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = -1 << *(_BYTE *)(a1 + 32);
  *a4 = a1;
  v7 = *(_QWORD *)(a1 + 64);
  result = a1 + 64;
  v6 = v7;
  a4[1] = result;
  a4[2] = ~v4;
  if (-v4 < 64)
    v8 = ~(-1 << -(char)v4);
  else
    v8 = -1;
  a4[3] = 0;
  a4[4] = v8 & v6;
  a4[5] = a2;
  a4[6] = a3;
  return result;
}

uint64_t sub_1BA186FC0@<X0>(_OWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  void (*v16)(_OWORD *);
  uint64_t result;
  _OWORD v18[2];
  __int128 v19;
  __int128 v20;
  _OWORD v21[2];

  v3 = *v1;
  v4 = v1[1];
  v6 = v1[2];
  v5 = v1[3];
  v7 = v5;
  v8 = v1[4];
  if (v8)
  {
    v9 = (v8 - 1) & v8;
    v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    sub_1BA16E780(*(_QWORD *)(v3 + 56) + 32 * v10, (uint64_t)v21);
    goto LABEL_23;
  }
  v11 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  v12 = (unint64_t)(v6 + 64) >> 6;
  if (v11 < v12)
  {
    v13 = *(_QWORD *)(v4 + 8 * v11);
    if (v13)
    {
LABEL_7:
      v9 = (v13 - 1) & v13;
      v10 = __clz(__rbit64(v13)) + (v11 << 6);
      v7 = v11;
      goto LABEL_3;
    }
    v14 = v5 + 2;
    v7 = v5 + 1;
    if (v5 + 2 < v12)
    {
      v13 = *(_QWORD *)(v4 + 8 * v14);
      if (v13)
      {
LABEL_10:
        v11 = v14;
        goto LABEL_7;
      }
      v7 = v5 + 2;
      if (v5 + 3 < v12)
      {
        v13 = *(_QWORD *)(v4 + 8 * (v5 + 3));
        if (v13)
        {
          v11 = v5 + 3;
          goto LABEL_7;
        }
        v14 = v5 + 4;
        v7 = v5 + 3;
        if (v5 + 4 < v12)
        {
          v13 = *(_QWORD *)(v4 + 8 * v14);
          if (v13)
            goto LABEL_10;
          v11 = v5 + 5;
          v7 = v5 + 4;
          if (v5 + 5 < v12)
          {
            v13 = *(_QWORD *)(v4 + 8 * v11);
            if (v13)
              goto LABEL_7;
            v7 = v12 - 1;
            v15 = v5 + 6;
            while (v15 < v12)
            {
              v13 = *(_QWORD *)(v4 + 8 * v15++);
              if (v13)
              {
                v11 = v15 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  v9 = 0;
  memset(v21, 0, sizeof(v21));
LABEL_23:
  *v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  v16 = (void (*)(_OWORD *))v1[5];
  result = sub_1BA1871D4((uint64_t)v21, (uint64_t)&v19);
  if (*((_QWORD *)&v20 + 1))
  {
    v18[0] = v19;
    v18[1] = v20;
    v16(v18);
    return sub_1BA1872CC((uint64_t)v18);
  }
  else
  {
    *a1 = 0u;
    a1[1] = 0u;
  }
  return result;
}

uint64_t sub_1BA187164()
{
  return swift_release();
}

void sub_1BA18716C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, uint64_t, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1BA172BA8();
    v7 = a3(a1, &type metadata for SizerResultMetadataKey, MEMORY[0x1E0DEE9B8] + 8, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_1BA1871D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BA187218();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1BA187218()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF2745B0)
  {
    sub_1BA18726C();
    v0 = sub_1BA19ADEC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF2745B0);
  }
}

void sub_1BA18726C()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1EF2745B8)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EF2745B8);
  }
}

uint64_t sub_1BA1872CC(uint64_t a1)
{
  uint64_t v2;

  sub_1BA18726C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_27()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t Optional<A>.flipRightToLeft(bounds:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
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
  uint64_t v23;
  uint64_t v25;

  v13 = *(_QWORD *)(a1 + 16);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x1E0C80A78](a1, a2);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15, v18);
  v20 = (char *)&v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v21 + 16))(v20, v22);
  v23 = 1;
  if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v13) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v17, v20, v13);
    (*(void (**)(uint64_t, double, double, double, double))(*(_QWORD *)(a2 + 24) + 8))(v13, a4, a5, a6, a7);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
    v23 = 0;
  }
  return __swift_storeEnumTagSinglePayload(a3, v23, 1, v13);
}

uint64_t sub_1BA18749C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  return Optional<A>.flipRightToLeft(bounds:)(a1, *(_QWORD *)(a2 - 8), a3, a4, a5, a6, a7);
}

BOOL static FastLayoutDecoderError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t FastLayoutDecoderError.hash(into:)()
{
  return sub_1BA19B110();
}

uint64_t FastLayoutDecoderError.hashValue.getter()
{
  sub_1BA19B104();
  sub_1BA19B110();
  return sub_1BA19B128();
}

unint64_t sub_1BA187534()
{
  unint64_t result;

  result = qword_1EF2745C0;
  if (!qword_1EF2745C0)
  {
    result = MEMORY[0x1BCCD6858](&protocol conformance descriptor for FastLayoutDecoderError, &type metadata for FastLayoutDecoderError);
    atomic_store(result, (unint64_t *)&qword_1EF2745C0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for FastLayoutDecoderError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BA1875BC + 4 * byte_1BA19DED5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1BA1875F0 + 4 * byte_1BA19DED0[v4]))();
}

uint64_t sub_1BA1875F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA1875F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA187600);
  return result;
}

uint64_t sub_1BA18760C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA187614);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1BA187618(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA187620(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FastLayoutDecoderError()
{
  return &type metadata for FastLayoutDecoderError;
}

uint64_t method lookup function for BoxBuilder()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1BA187648(void (*a1)(uint64_t *__return_ptr, _QWORD *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t result;
  void **v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v32;
  _QWORD v33[5];
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;

  v4 = v3;
  v5 = *(_QWORD *)(a3 + 16);
  result = MEMORY[0x1E0DEE9D8];
  if (v5)
  {
    v42 = MEMORY[0x1E0DEE9D8];
    sub_1BA171F3C(0, v5, 0);
    result = v42;
    v8 = (void **)(a3 + 64);
    while (1)
    {
      v32 = v4;
      v9 = result;
      v10 = (uint64_t)*(v8 - 3);
      v12 = *(v8 - 2);
      v11 = (uint64_t)*(v8 - 1);
      v13 = *v8;
      v33[0] = *(v8 - 4);
      v33[1] = v10;
      v33[2] = v12;
      v33[3] = v11;
      v33[4] = v13;
      swift_retain();
      v14 = v13;
      swift_bridgeObjectRetain();
      v15 = v12;
      a1(&v34, v33);
      if (v32)
        break;

      swift_release();
      OUTLINED_FUNCTION_2_9();
      v16 = v34;
      v17 = v35;
      v18 = v36;
      v19 = v37;
      v20 = v38;
      v21 = v39;
      v22 = v40;
      v23 = v41;
      result = v9;
      v24 = *(_QWORD *)(v9 + 16);
      v25 = *(_QWORD *)(result + 24);
      v42 = result;
      if (v24 >= v25 >> 1)
      {
        v29 = v38;
        v30 = v35;
        v27 = v41;
        v28 = v39;
        sub_1BA171F3C(v25 > 1, v24 + 1, 1);
        v23 = v27;
        v21 = v28;
        v20 = v29;
        v17 = v30;
        result = v42;
      }
      *(_QWORD *)(result + 16) = v24 + 1;
      v26 = result + 96 * v24;
      *(_QWORD *)(v26 + 32) = v16;
      *(_OWORD *)(v26 + 40) = v17;
      *(_QWORD *)(v26 + 56) = v18;
      *(_QWORD *)(v26 + 64) = v19;
      *(_OWORD *)(v26 + 72) = v20;
      *(_OWORD *)(v26 + 88) = v21;
      *(_QWORD *)(v26 + 104) = v22;
      *(_OWORD *)(v26 + 112) = v23;
      v8 += 5;
      --v5;
      v4 = 0;
      if (!v5)
        return result;
    }
    OUTLINED_FUNCTION_2();

    swift_release();
    return OUTLINED_FUNCTION_2_9();
  }
  return result;
}

void sub_1BA1877F8(uint64_t a1@<X0>, uint64_t a2@<X2>, void *a3@<X3>, uint64_t a4@<X4>, unint64_t *a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
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
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  char v47;
  char v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t inited;
  id v55;
  id v56;
  uint64_t v57;
  _QWORD v58[6];
  uint64_t v59;
  uint64_t v60;
  unint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  id v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;

  v6 = v5;
  v67 = a3;
  v10 = *(_QWORD *)(a2 + 24);
  if (v10)
  {
    v11 = *(_QWORD *)(a2 + 16);
    v12 = (unint64_t)LayoutContext.metadata(for:)(*(Swift::String *)(&v10 - 1));
    if (v12)
    {
      v13 = v12;
      sub_1BA172AE0(v12, &v69);
      if (v71)
      {
        sub_1BA172874();
        if ((swift_dynamicCast() & 1) != 0)
        {
          v14 = sub_1BA16EA30();
          sub_1BA187CC0(v14, a1, &v69);

          v15 = v69;
          v16 = v70;
          v17 = v71;
          v18 = v72;
          v19 = v73;
          v20 = v74;
          v21 = OUTLINED_FUNCTION_3_15();
          v22 = OUTLINED_FUNCTION_1_25();
          *(_OWORD *)(v22 + 16) = v15;
          *(_QWORD *)(v22 + 32) = v16;
          *(_QWORD *)(v22 + 40) = v17;
          *(_OWORD *)(v22 + 48) = v15;
          *(_QWORD *)(v22 + 64) = v16;
          *(_QWORD *)(v22 + 72) = v17;
          *(_QWORD *)(v22 + 80) = v18;
          *(_QWORD *)(v22 + 88) = v19;
          *(_QWORD *)(v22 + 96) = v20;
          *(_QWORD *)(v21 + 16) = v22 | 0x1000000000000000;
          *(_QWORD *)(v21 + 24) = v13;
          v23 = v21 | 0x9000000000000000;
LABEL_16:
          *a5 = v23;
          return;
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        sub_1BA170698((uint64_t)&v69);
      }
    }
  }
  sub_1BA187CC0(v67, a1, &v69);
  v66 = v69;
  v24 = v70;
  v65 = *((_QWORD *)&v69 + 1);
  v25 = v71;
  v26 = v72;
  v27 = v73;
  v28 = v74;
  MEMORY[0x1E0C80A78](v29, v30);
  v58[2] = v67;
  v58[3] = a4;
  v58[4] = a1;
  swift_bridgeObjectRetain();
  v31 = sub_1BA187648((void (*)(uint64_t *__return_ptr, _QWORD *))sub_1BA187E50, (uint64_t)v58, a4);
  OUTLINED_FUNCTION_1_9();
  *(_QWORD *)&v69 = v31;
  sub_1BA1706F0(0, &qword_1ED5C9A20, (uint64_t)&type metadata for AltTextSized, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1BA172068();
  sub_1BA1720C0();
  v32 = sub_1BA19ABE8();
  v33 = *(_QWORD *)(v31 + 16);
  if (!v33)
  {
    OUTLINED_FUNCTION_2_9();
    swift_bridgeObjectRelease();
LABEL_15:
    OUTLINED_FUNCTION_1_25();
    v49 = OUTLINED_FUNCTION_8_11();
    *(double *)(v50 + 16) = v49;
    *(_QWORD *)(v50 + 24) = v51;
    *(_QWORD *)(v50 + 32) = v24;
    *(_QWORD *)(v50 + 40) = v25;
    *(double *)(v50 + 48) = v49;
    *(_QWORD *)(v50 + 56) = v51;
    *(_QWORD *)(v50 + 64) = v24;
    *(_QWORD *)(v50 + 72) = v25;
    *(_QWORD *)(v50 + 80) = v26;
    *(_QWORD *)(v50 + 88) = v27;
    *(_QWORD *)(v50 + 96) = v28;
    v23 = v50 | 0x1000000000000000;
    goto LABEL_16;
  }
  v64 = v32;
  v59 = v28;
  v60 = v27;
  v63 = v26;
  v61 = a5;
  swift_bridgeObjectRetain();
  v62 = v31;
  v34 = v31 + 64;
  while (1)
  {
    v35 = *(void **)(v34 - 16);
    v36 = *(void **)v34;
    v37 = *(_QWORD *)(v34 + 8);
    v38 = *(_QWORD *)(v34 + 16);
    v39 = *(_QWORD *)(v34 + 24);
    v40 = *(_QWORD *)(v34 + 32);
    v41 = *(void **)(v34 + 40);
    v42 = *(_QWORD *)(v34 + 48);
    v43 = *(_QWORD *)(v34 + 56);
    *(_QWORD *)&v69 = *(_QWORD *)(v34 - 8);
    swift_retain_n();
    v44 = v36;
    v45 = v41;
    swift_bridgeObjectRetain();
    v46 = v35;
    OUTLINED_FUNCTION_8_11();
    sub_1BA1720FC();
    if (v6)
    {
      OUTLINED_FUNCTION_2_20();
      OUTLINED_FUNCTION_6_12();
      OUTLINED_FUNCTION_0_26();

      OUTLINED_FUNCTION_1_9();
      swift_release_n();
      return;
    }
    v48 = v47;
    OUTLINED_FUNCTION_2();
    if ((v48 & 1) != 0)
      break;

    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_1_9();
    v34 += 96;
    if (!--v33)
    {
      OUTLINED_FUNCTION_2_20();
      OUTLINED_FUNCTION_0_26();
      a5 = v61;
      v26 = v63;
      v27 = v60;
      v28 = v59;
      goto LABEL_15;
    }
  }
  OUTLINED_FUNCTION_2_20();
  OUTLINED_FUNCTION_0_26();
  v52 = OUTLINED_FUNCTION_3_15();
  v53 = OUTLINED_FUNCTION_1_25();
  *(_QWORD *)(v53 + 16) = v37;
  *(_QWORD *)(v53 + 24) = v38;
  *(_QWORD *)(v53 + 32) = v39;
  *(_QWORD *)(v53 + 40) = v40;
  *(_QWORD *)(v53 + 48) = v37;
  *(_QWORD *)(v53 + 56) = v38;
  *(_QWORD *)(v53 + 64) = v39;
  *(_QWORD *)(v53 + 72) = v40;
  *(_QWORD *)(v53 + 80) = v45;
  *(_QWORD *)(v53 + 88) = v42;
  *(_QWORD *)(v53 + 96) = v43;
  *(_QWORD *)(v52 + 16) = v53 | 0x1000000000000000;
  sub_1BA172A44();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BA19C0E0;
  *(_QWORD *)(inited + 56) = sub_1BA172874();
  *(_QWORD *)(inited + 32) = v46;
  sub_1BA172BA8();
  v55 = v45;
  v56 = v46;
  v57 = sub_1BA19AB34();

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_6_12();
  *(_QWORD *)(v52 + 24) = v57;
  *v61 = v52 | 0x9000000000000000;
}

void sub_1BA187CC0(void *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  Cursor.remainingBounds.getter();
  objc_msgSend(a1, sel_boundingRectWithSize_options_context_, 1, 0, v6, v7);
  v9 = v8;
  v11 = v10;
  swift_beginAccess();
  v12 = *(_QWORD *)(a2 + 488);
  v13 = *(_QWORD *)(a2 + 496);
  v14 = a1;
  Cursor.remainingBounds.getter();
  *a3 = v12;
  a3[1] = v13;
  a3[2] = v9;
  a3[3] = v11;
  a3[4] = v14;
  a3[5] = v15;
  a3[6] = v16;
}

id sub_1BA187D64@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  id v13;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  v5 = *a1;
  v4 = a1[1];
  v6 = (void *)a1[2];
  v7 = a1[3];
  v8 = (void *)a1[4];
  sub_1BA187CC0(v8, a2, v15);
  v9 = v16;
  v10 = v15[0];
  v11 = v15[1];
  v12 = v17;
  *(_QWORD *)a3 = v5;
  *(_QWORD *)(a3 + 8) = v4;
  *(_QWORD *)(a3 + 16) = v6;
  *(_QWORD *)(a3 + 24) = v7;
  *(_QWORD *)(a3 + 32) = v8;
  *(_OWORD *)(a3 + 40) = v10;
  *(_OWORD *)(a3 + 56) = v11;
  *(_QWORD *)(a3 + 72) = v9;
  *(_OWORD *)(a3 + 80) = v12;
  swift_retain();
  v13 = v8;
  swift_bridgeObjectRetain();
  return v6;
}

void sub_1BA187E10(uint64_t a1@<X0>, uint64_t a2@<X2>, unint64_t *a3@<X8>)
{
  uint64_t v3;

  sub_1BA1877F8(a1, a2, *(void **)v3, *(_QWORD *)(v3 + 8), a3);
}

uint64_t sub_1BA187E28()
{
  return 0x74786554746C61;
}

ValueMetadata *type metadata accessor for AltTextSizer()
{
  return &type metadata for AltTextSizer;
}

id sub_1BA187E50@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1BA187D64(a1, *(_QWORD *)(v2 + 32), a2);
}

uint64_t sub_1BA187E70()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1BA187E94()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t destroy for GeometrySizer(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return swift_release();
}

uint64_t initializeWithCopy for GeometrySizer(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_retain();
  return a1;
}

uint64_t *assignWithCopy for GeometrySizer(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;

  __swift_assign_boxed_opaque_existential_1(a1, a2);
  v4 = a2[6];
  a1[5] = a2[5];
  a1[6] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for GeometrySizer(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for GeometrySizer()
{
  return &type metadata for GeometrySizer;
}

_QWORD *sub_1BA187FC8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  _OWORD v19[3];
  uint64_t v20;

  v6 = v4;
  v11 = *a1;
  v12 = v6[3];
  v13 = v6[4];
  __swift_project_boxed_opaque_existential_1(v6, v12);
  result = (*(_QWORD *(**)(_OWORD *__return_ptr, uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v13 + 16))(v19, a1, a2, a3, *(_QWORD *)(v11 + 80), *(_QWORD *)(v11 + 88), v12, v13);
  if (!v5)
  {
    v15 = *(_QWORD *)&v19[0];
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v15;
    sub_1BA1881F4((uint64_t)v6, (uint64_t)v19);
    v17 = swift_allocObject();
    v18 = v19[1];
    *(_OWORD *)(v17 + 16) = v19[0];
    *(_OWORD *)(v17 + 32) = v18;
    *(_OWORD *)(v17 + 48) = v19[2];
    *(_QWORD *)(v17 + 64) = v20;
    *(_QWORD *)(v17 + 72) = a1;
    *(_QWORD *)(v16 + 24) = sub_1BA18825C;
    *(_QWORD *)(v16 + 32) = v17;
    *a4 = v16 | 0x8000000000000000;
    return (_QWORD *)swift_retain();
  }
  return result;
}

uint64_t sub_1BA1880E8(uint64_t a1, double *a2, double a3, double a4, double a5, double a6)
{
  return (*(uint64_t (**)(double, double, double, double, double, double, double, double))(a1 + 40))(a2[12], a2[13], a2[14], a2[15], a3, a4, a5, a6);
}

_QWORD *sub_1BA188134@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_1BA187FC8(a1, a2, a3, a4);
}

uint64_t sub_1BA188148()
{
  sub_1BA17C214();
  sub_1BA19AF3C();
  sub_1BA19ABD0();
  return 0;
}

uint64_t sub_1BA1881C4()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BA1881F4(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for GeometrySizer(a2, a1);
  return a2;
}

uint64_t sub_1BA188228()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BA18825C(double a1, double a2, double a3, double a4)
{
  uint64_t v4;

  return sub_1BA1880E8(v4 + 16, *(double **)(v4 + 72), a1, a2, a3, a4);
}

BOOL CursorResizing.isResizing.getter()
{
  _QWORD *v0;

  return *v0 >> 62 == 0;
}

uint64_t CursorResizing.isNestedResizing.getter()
{
  _QWORD *v0;
  uint64_t v1;
  char v2;

  v1 = *v0 >> 62;
  if ((_DWORD)v1)
  {
    if ((_DWORD)v1 == 1)
      v2 = CursorResizing.isNestedResizing.getter();
    else
      v2 = 0;
  }
  else
  {
    v2 = 1;
  }
  return v2 & 1;
}

uint64_t CursorResizing.identifier.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)v0 >> 62;
  if ((_DWORD)v1)
  {
    if ((_DWORD)v1 == 1)
      return CursorResizing.identifier.getter();
    else
      return 0;
  }
  else
  {
    v2 = *(_QWORD *)(*(_QWORD *)v0 + 16);
    swift_bridgeObjectRetain();
  }
  return v2;
}

uint64_t CursorResizing.description.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v1 = *v0 >> 62;
  if (!(_DWORD)v1)
  {
    v4 = 539782767;
    sub_1BA19ABD0();
    return v4;
  }
  if ((_DWORD)v1 == 1)
  {
    v4 = 0x202C6465626D65;
    v2 = swift_retain();
    CursorResizing.description.getter(v2);
    sub_1BA19ABD0();
    swift_release();
    swift_bridgeObjectRelease();
    return v4;
  }
  return 6710895;
}

_QWORD *initializeBufferWithCopyOfBuffer for AltTextLogic(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for AltTextLogic()
{
  return swift_release();
}

_QWORD *assignWithCopy for AltTextLogic(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *assignWithTake for AltTextLogic(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CursorResizing(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0x7E && *(_BYTE *)(a1 + 8))
    {
      v2 = *(_DWORD *)a1 + 125;
    }
    else
    {
      v2 = (((*(_QWORD *)a1 >> 57) >> 5) | (4 * ((*(_QWORD *)a1 >> 57) & 0x18 | *(_QWORD *)a1 & 7))) ^ 0x7F;
      if (v2 >= 0x7D)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for CursorResizing(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x7D)
  {
    *(_QWORD *)result = a2 - 126;
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
    {
      v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_1BA18856C(_QWORD *a1)
{
  uint64_t v1;

  v1 = *a1 >> 62;
  if (v1 <= 1)
    return v1;
  else
    return (*a1 >> 3) + 2;
}

_QWORD *sub_1BA188588(_QWORD *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

ValueMetadata *type metadata accessor for CursorResizing()
{
  return &type metadata for CursorResizing;
}

uint64_t sub_1BA1885AC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;

  v6 = *v2;
  v5 = v2[1];
  OUTLINED_FUNCTION_0_16();
  if (*(_QWORD *)(a1 + 64))
  {
    v8 = *(_QWORD *)(a1 + 72);
    v7 = *(_QWORD *)(a1 + 80);
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
    {
      OUTLINED_FUNCTION_0_16();
      v9 = *(_QWORD *)(a1 + 488);
      v10 = *(_QWORD *)(a1 + 496);
      v11 = OUTLINED_FUNCTION_6();
      v12 = (_QWORD *)OUTLINED_FUNCTION_6();
      v12[2] = v9;
      v12[3] = v10;
      v12[4] = v8;
      v12[5] = v7;
      v13 = qword_1ED5C9B18;
      swift_bridgeObjectRetain();
      if (v13 != -1)
        swift_once();
      OUTLINED_FUNCTION_1_26((char *)&word_1ED5C8FE0);
      v14 = OUTLINED_FUNCTION_6();
      *(_OWORD *)(v14 + 16) = xmmword_1BA19C0E0;
      *(_QWORD *)(v14 + 32) = v7;
      *(_BYTE *)(v14 + 40) = 1;
      *(_QWORD *)(v11 + 24) = MEMORY[0x1E0DEE9D8];
    }
    else
    {
      OUTLINED_FUNCTION_0_16();
      v18 = *(_QWORD *)(a1 + 488);
      v19 = *(_QWORD *)(a1 + 496);
      v11 = OUTLINED_FUNCTION_6();
      v20 = (_QWORD *)OUTLINED_FUNCTION_6();
      v20[2] = v18;
      v20[3] = v19;
      v20[4] = v8;
      v20[5] = v7;
      v21 = qword_1ED5C9B18;
      swift_bridgeObjectRetain();
      if (v21 != -1)
        swift_once();
      OUTLINED_FUNCTION_1_26((char *)&word_1ED5C8FE0);
      v22 = OUTLINED_FUNCTION_6();
      *(_OWORD *)(v22 + 16) = xmmword_1BA19C0E0;
      *(_QWORD *)(v22 + 32) = v8;
      *(_BYTE *)(v22 + 40) = 1;
      *(_QWORD *)(v11 + 24) = v22;
      v14 = MEMORY[0x1E0DEE9D8];
    }
    *(_QWORD *)(v11 + 32) = v14;
    swift_bridgeObjectRelease();
    v15 = OUTLINED_FUNCTION_6();
    *(_QWORD *)(v15 + 16) = v11 | 0x4000000000000000;
    *(_QWORD *)(v15 + 24) = v6;
    v16 = (_QWORD *)(v15 + 32);
    v17 = 0x4000000000000000;
  }
  else
  {
    v15 = OUTLINED_FUNCTION_6();
    *(_QWORD *)(v15 + 40) = &type metadata for FlexibleMaxSizer;
    *(_QWORD *)(v15 + 48) = &off_1E71E71B0;
    *(_QWORD *)(v15 + 16) = v6;
    v16 = (_QWORD *)(v15 + 24);
    v17 = 0x2000000000000000;
  }
  *v16 = v5;
  *a2 = v17 | v15;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BA1887F4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BA1885AC(a1, a2);
}

uint64_t sub_1BA188808()
{
  sub_1BA19AEA0();
  sub_1BA19ABD0();
  sub_1BA19AF3C();
  sub_1BA19ABD0();
  return 0;
}

ValueMetadata *type metadata accessor for FlexibleMaxSizer()
{
  return &type metadata for FlexibleMaxSizer;
}

uint64_t sub_1BA1888C4()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BA1888FC()
{
  return swift_deallocObject();
}

uint64_t sub_1BA18890C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t Inspect.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  return Inspect.init(_:)(a1, a2);
}

uint64_t Inspect.init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v4;

  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  v4 = 11;
  return Node.init(kind:identifier:)(&v4, 0, 0);
}

uint64_t sub_1BA1889AC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  _QWORD *v4;
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
  void (*v19)(char *);
  uint64_t v21;
  uint64_t *v22;

  v22 = a4;
  v7 = *(_QWORD *)(*v4 + 136);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Inspect.State(0, v7, *(_QWORD *)(v11 + 144), v12);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13, v15);
  v17 = (char *)&v21 - v16;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a2, v7);
  sub_1BA188AD0(a1, (uint64_t)v10, *v22, v18, v17);
  v19 = (void (*)(char *))v4[5];
  swift_retain();
  swift_retain();
  v19(v17);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  return 0;
}

uint64_t sub_1BA188AD0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v8 = *a1;
  *(_QWORD *)a5 = a1;
  v9 = *(_QWORD *)(v8 + 80);
  v10 = type metadata accessor for Inspect.State(0, v9, *(_QWORD *)(v8 + 88), a4);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(&a5[*(int *)(v10 + 36)], a2, v9);
  *(_QWORD *)&a5[*(int *)(v10 + 40)] = a3;
  return result;
}

uint64_t Inspect.State.cursor.getter()
{
  return swift_retain();
}

uint64_t Inspect.State.template.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 36));
}

uint64_t Inspect.State.context.getter()
{
  return swift_retain();
}

void Inspect.__allocating_init(kind:identifier:)()
{
  swift_initStackObject();
  Inspect.init(kind:identifier:)();
}

void Inspect.init(kind:identifier:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t Inspect.deinit()
{
  uint64_t v0;

  v0 = Node.deinit();
  swift_release();
  return v0;
}

uint64_t Inspect.__deallocating_deinit()
{
  Inspect.deinit();
  return swift_deallocClassInstance();
}

uint64_t Inspect.description.getter()
{
  return 0x74636570736E49;
}

uint64_t sub_1BA188C1C()
{
  return 0x74636570736E49;
}

uint64_t type metadata accessor for Inspect(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Inspect);
}

uint64_t method lookup function for Inspect()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Inspect.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t sub_1BA188C54(uint64_t *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v13;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if (!a2)
    return 0;
  v8 = *(unsigned __int8 *)(v5 + 80);
  if (v7 >= a2)
  {
    if ((v6 & 0x80000000) != 0)
    {
      return __swift_getEnumTagSinglePayload(((unint64_t)a1 + v8 + 8) & ~v8, v6, v4);
    }
    else
    {
      v13 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v13) = -1;
      return (v13 + 1);
    }
  }
  else
  {
    if (((((*(_QWORD *)(v5 + 64) + ((v8 + 8) & ~v8) + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v7 + 1;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    return ((uint64_t (*)(void))((char *)&loc_1BA188CE0 + 4 * byte_1BA19E168[v11]))();
  }
}

void sub_1BA188D5C(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = ((*(_QWORD *)(v5 + 64)
       + ((*(unsigned __int8 *)(v5 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
       + 7) & 0xFFFFFFFFFFFFFFF8)
     + 8;
  if (v6 >= a3)
  {
    v10 = 0u;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + ((*(unsigned __int8 *)(v5 + 80) + 8) & ~*(unsigned __int8 *)(v5 + 80)) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v8 = a3 - v6 + 1;
    else
      v8 = 2;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
  }
  if (a2 > v6)
  {
    if ((_DWORD)v7)
    {
      v11 = ~v6 + a2;
      bzero(a1, v7);
      *a1 = v11;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X12 }
}

uint64_t sub_1BA188E5C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  *((_BYTE *)v5 + v6) = 0;
  if ((_DWORD)a1)
  {
    if ((a2 & 0x80000000) != 0)
    {
      return __swift_storeEnumTagSinglePayload(((unint64_t)v5 + v4 + 8) & a4, a1, a2, a3);
    }
    else
    {
      if ((a1 & 0x80000000) != 0)
        v7 = a1 ^ 0x80000000;
      else
        v7 = (a1 - 1);
      *v5 = v7;
    }
  }
  return result;
}

uint64_t type metadata accessor for Inspect.State(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Inspect.State);
}

void sub_1BA188EE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  __asm { BR              X10 }
}

_QWORD *sub_1BA188F38()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  _QWORD *v7;
  char v8;

  OUTLINED_FUNCTION_0_22();
  v4 = *(_QWORD *)(v0 + 488);
  v5 = *(_QWORD *)(v0 + 496);
  result = (_QWORD *)OUTLINED_FUNCTION_9();
  v7 = result;
  result[2] = v4;
  result[3] = v5;
  result[4] = v2;
  result[5] = v3;
  if (qword_1ED5C9B18 != -1)
    result = (_QWORD *)swift_once();
  v8 = HIBYTE(word_1ED5C8FE0);
  *((_BYTE *)v7 + 48) = word_1ED5C8FE0;
  *((_BYTE *)v7 + 49) = v8;
  *v1 = v7;
  return result;
}

void sub_1BA189194(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_1BA188EE8(a1, a2, a3, *(_QWORD *)v3, *(_QWORD *)(v3 + 8), *(_BYTE *)(v3 + 16));
}

uint64_t sub_1BA1891B0()
{
  sub_1BA19ABD0();
  sub_1BA19AF3C();
  sub_1BA19ABD0();
  return 0;
}

uint64_t sub_1BA189244()
{
  return sub_1BA1891B0();
}

uint64_t sub_1BA189260(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1BA189268(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for FixedSizer.Fixed()
{
  return &type metadata for FixedSizer.Fixed;
}

void _s11TeaTemplate10FixedSizerVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  unsigned __int8 v8;

  OUTLINED_FUNCTION_2_21(a1, a2);
  v6 = *(void **)v2;
  v7 = *(_QWORD *)(v2 + 8);
  *(_QWORD *)v2 = v3;
  *(_QWORD *)(v2 + 8) = v4;
  v8 = *(_BYTE *)(v2 + 16);
  *(_BYTE *)(v2 + 16) = v5;
  sub_1BA16E9B4(v6, v7, v8);
  OUTLINED_FUNCTION_5_0();
}

uint64_t _s11TeaTemplate10FixedSizerVwta_0(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_1BA16E9B4(v4, v5, v6);
  return a1;
}

uint64_t _s11TeaTemplate10FixedSizerVwet_0(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFA && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 249;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 6)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t _s11TeaTemplate10FixedSizerVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF9)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 250;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFA)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFA)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for FixedSizer()
{
  return &type metadata for FixedSizer;
}

uint64_t sub_1BA18938C()
{
  return swift_deallocObject();
}

uint64_t sub_1BA18939C()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t Stack.__allocating_init(name:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_allocObject();
  return Stack.init(name:)(a1, a2, v4, v5);
}

uint64_t Stack.init(name:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v7;
  char v9;

  type metadata accessor for StackLayer(0, *(_QWORD *)(*v4 + 136), *(_QWORD *)(*v4 + 144), a4);
  swift_retain();
  v7 = sub_1BA19AB04();
  v4[6] = a2;
  v4[7] = v7;
  v4[5] = a1;
  swift_bridgeObjectRetain();
  swift_release();
  v9 = 7;
  return Node.init(kind:identifier:)(&v9, a1, a2);
}

uint64_t type metadata accessor for StackLayer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for StackLayer);
}

uint64_t sub_1BA1894A8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  swift_beginAccess();
  type metadata accessor for StackLayer(255, *(_QWORD *)(v1 + 136), *(_QWORD *)(v1 + 144), v2);
  sub_1BA19ACE4();
  swift_retain();
  sub_1BA19ACC0();
  return swift_endAccess();
}

void sub_1BA189528()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  sub_1BA18939C();
  type metadata accessor for StackLayer(0, *(_QWORD *)(v1 + 136), *(_QWORD *)(v1 + 144), v2);
  sub_1BA19AC60();
  OUTLINED_FUNCTION_2_22();
}

void sub_1BA189740(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;

  v5 = *v3;
  Cursor.remainingBounds.getter();
  sub_1BA16D270((uint64_t)v3, a3, v3[5], v3[6]);
  sub_1BA18939C();
  type metadata accessor for StackLayer(0, *(_QWORD *)(v5 + 136), *(_QWORD *)(v5 + 144), v6);
  sub_1BA19AC60();
  OUTLINED_FUNCTION_3_22();
}

void Stack.__allocating_init(kind:identifier:)()
{
  swift_initStackObject();
  Stack.init(kind:identifier:)();
}

void Stack.init(kind:identifier:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1BA189D80()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t Stack.deinit()
{
  uint64_t v0;

  v0 = Node.deinit();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Stack.__deallocating_deinit()
{
  Stack.deinit();
  return swift_deallocClassInstance();
}

uint64_t Stack.description.getter()
{
  return 0x6B63617453;
}

uint64_t sub_1BA189E00()
{
  return 0x6B63617453;
}

uint64_t sub_1BA189E14()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Stack(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Stack);
}

uint64_t method lookup function for Stack()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Stack.__allocating_init(name:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t sub_1BA189E80()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1BA189EC4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BA189EE0()
{
  sub_1BA189EC4();
  return swift_deallocClassInstance();
}

uint64_t sub_1BA189F00()
{
  sub_1BA19ABD0();
  sub_1BA19AF3C();
  sub_1BA19ABD0();
  return 0;
}

uint64_t sub_1BA189F94()
{
  return sub_1BA189F00();
}

id sub_1BA189FA4(id result, uint64_t a2, char a3)
{
  if (a3 == 2)
    return result;
  return result;
}

ValueMetadata *type metadata accessor for FixedDimensionSizer.Fixed()
{
  return &type metadata for FixedDimensionSizer.Fixed;
}

void _s11TeaTemplate19FixedDimensionSizerVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  OUTLINED_FUNCTION_1_28(a1, a2);
  *(_QWORD *)v2 = v3;
  *(_QWORD *)(v2 + 8) = v4;
  *(_BYTE *)(v2 + 16) = v5;
  OUTLINED_FUNCTION_5_0();
}

void _s11TeaTemplate19FixedDimensionSizerVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  char v8;

  OUTLINED_FUNCTION_1_28(a1, a2);
  v6 = *(void **)v2;
  v7 = *(_QWORD *)(v2 + 8);
  *(_QWORD *)v2 = v3;
  *(_QWORD *)(v2 + 8) = v4;
  v8 = *(_BYTE *)(v2 + 16);
  *(_BYTE *)(v2 + 16) = v5;
  sub_1BA16E060(v6, v7, v8);
  OUTLINED_FUNCTION_5_0();
}

uint64_t _s11TeaTemplate19FixedDimensionSizerVwta_0(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_1BA16E060(v4, v5, v6);
  return a1;
}

ValueMetadata *type metadata accessor for FixedDimensionSizer()
{
  return &type metadata for FixedDimensionSizer;
}

uint64_t sub_1BA18A088()
{
  return swift_deallocObject();
}

uint64_t sub_1BA18A098(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD v6[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_1BA16E7BC((_OWORD *)a1, v6);
    sub_1BA17CF48((uint64_t)v6, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1BA170698(a1);
    sub_1BA18AEEC(a2, a3, v6);
    swift_bridgeObjectRelease();
    return sub_1BA170698((uint64_t)v6);
  }
}

uint64_t sub_1BA18A118()
{
  uint64_t v0;

  OUTLINED_FUNCTION_4_11();
  v0 = swift_allocObject();
  OUTLINED_FUNCTION_2_14();
  sub_1BA18A16C();
  return v0;
}

uint64_t sub_1BA18A16C()
{
  _QWORD *v0;
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
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  unint64_t v19;
  char v20;
  unint64_t v21;
  char v22;
  _OWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t, uint64_t);
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t result;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  _OWORD v40[2];
  _OWORD v41[3];
  uint64_t v42[2];
  __int128 v43;
  uint64_t v44;
  unint64_t v45;

  OUTLINED_FUNCTION_4_11();
  v6 = v5;
  v39 = v0;
  v7 = *v0;
  v37 = sub_1BA19B14C();
  OUTLINED_FUNCTION_21_0(*(_QWORD *)(v37 - 8));
  MEMORY[0x1E0C80A78](v8, v9);
  OUTLINED_FUNCTION_13_3();
  v12 = v11 - v10;
  v13 = *(_QWORD *)(v7 + 80);
  *((_QWORD *)&v43 + 1) = v13;
  __swift_allocate_boxed_opaque_existential_0Tm(v42);
  v38 = v13;
  (*(void (**)(void))(*(_QWORD *)(v13 - 8) + 16))();
  sub_1BA19B134();
  v45 = MEMORY[0x1E0DEE9E0];
  sub_1BA19B140();
  sub_1BA19AF30();
  swift_release();
  swift_retain();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_24();
  if (!v44)
  {
LABEL_14:
    swift_release_n();
    type metadata accessor for CGRect(0);
    *((_QWORD *)&v43 + 1) = v28;
    v29 = (_QWORD *)swift_allocObject();
    v42[0] = (uint64_t)v29;
    v29[2] = v4;
    v29[3] = v3;
    v29[4] = v2;
    v29[5] = v1;
    sub_1BA18A098((uint64_t)v42, 0x656D617266, 0xE500000000000000);
    OUTLINED_FUNCTION_29_0();
    v30(v6, v38);
    OUTLINED_FUNCTION_29_0();
    v31(v12, v37);
    v32 = (char *)v39 + *(_QWORD *)(*v39 + 96);
    *(_QWORD *)v32 = v45;
    v32[8] = 1;
    v33 = OUTLINED_FUNCTION_20_0();
    type metadata accessor for LayoutDecoder.ObjectPath(v33, v38, v34, v35);
    swift_storeEnumTagMultiPayload();
    return (uint64_t)v39;
  }
  v14 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  while (1)
  {
    v15 = v42[0];
    v16 = v42[1];
    sub_1BA16E7BC(&v43, v41);
    if (!v16)
      goto LABEL_13;
    sub_1BA16E780((uint64_t)v41, (uint64_t)v40);
    swift_isUniquelyReferenced_nonNull_native();
    v45 = 0x8000000000000000;
    v17 = sub_1BA169038(v15, v16);
    if (__OFADD__(v14[2], (v18 & 1) == 0))
      break;
    v19 = v17;
    v20 = v18;
    sub_1BA18B0D0();
    if ((sub_1BA19AF54() & 1) != 0)
    {
      v21 = sub_1BA169038(v15, v16);
      if ((v20 & 1) != (v22 & 1))
        goto LABEL_17;
      v19 = v21;
    }
    if ((v20 & 1) != 0)
    {
      v23 = (_OWORD *)(v14[7] + 32 * v19);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
      sub_1BA16E7BC(v40, v23);
    }
    else
    {
      v14[(v19 >> 6) + 8] |= 1 << v19;
      v24 = (uint64_t *)(v14[6] + 16 * v19);
      *v24 = v15;
      v24[1] = v16;
      sub_1BA16E7BC(v40, (_OWORD *)(v14[7] + 32 * v19));
      v25 = v14[2];
      v26 = __OFADD__(v25, 1);
      v27 = v25 + 1;
      if (v26)
        goto LABEL_16;
      v14[2] = v27;
      swift_bridgeObjectRetain();
    }
    v45 = (unint64_t)v14;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_13:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_24();
    if (!v44)
      goto LABEL_14;
  }
  __break(1u);
LABEL_16:
  __break(1u);
LABEL_17:
  result = sub_1BA19B0C8();
  __break(1u);
  return result;
}

uint64_t sub_1BA18A4F4()
{
  uint64_t v0;

  sub_1BA18AEB0();
  OUTLINED_FUNCTION_7();
  *(_OWORD *)v0 = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_BYTE *)(v0 + 48) = 2;
  return swift_willThrow();
}

_QWORD *sub_1BA18A544(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  char v11;

  v3 = (_QWORD *)a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 9uLL)
    v5 = 9;
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
    v9 = *((unsigned __int8 *)a2 + v5);
    if (v9 >= 2)
    {
      if (v5 <= 3)
        v10 = v5;
      else
        v10 = 4;
      __asm { BR              X13 }
    }
    if (v9 == 1)
    {
      v11 = *((_BYTE *)a2 + 8);
      *(_QWORD *)a1 = *a2;
      *(_BYTE *)(a1 + 8) = v11;
      *(_BYTE *)(a1 + v5) = 1;
      swift_bridgeObjectRetain();
    }
    else
    {
      (*(void (**)(uint64_t))(v4 + 16))(a1);
      *((_BYTE *)v3 + v5) = 0;
    }
  }
  return v3;
}

uint64_t sub_1BA18A664(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  char v12;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 9uLL)
      v7 = 9;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = *(unsigned __int8 *)(a1 + v7);
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 == 1)
      swift_bridgeObjectRelease();
    else
      (*(void (**)(uint64_t, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
    v10 = *(unsigned __int8 *)(a2 + v7);
    if (v10 >= 2)
    {
      if (v7 <= 3)
        v11 = v7;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
    {
      v12 = *(_BYTE *)(a2 + 8);
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_BYTE *)(a1 + 8) = v12;
      *(_BYTE *)(a1 + v7) = 1;
      swift_bridgeObjectRetain();
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(a1, a2, v5);
      *(_BYTE *)(a1 + v7) = 0;
    }
  }
  return a1;
}

uint64_t sub_1BA18A7FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  char v8;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 9uLL)
    v5 = 9;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *(unsigned __int8 *)(a2 + v5);
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 1)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
    v8 = 1;
  }
  else
  {
    (*(void (**)(uint64_t))(v4 + 32))(a1);
    v8 = 0;
  }
  *(_BYTE *)(a1 + v5) = v8;
  return a1;
}

uint64_t sub_1BA18A8D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  char v12;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 9uLL)
      v7 = 9;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = *(unsigned __int8 *)(a1 + v7);
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 == 1)
      swift_bridgeObjectRelease();
    else
      (*(void (**)(uint64_t, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
    v10 = *(unsigned __int8 *)(a2 + v7);
    if (v10 >= 2)
    {
      if (v7 <= 3)
        v11 = v7;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
      v12 = 1;
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(a1, a2, v5);
      v12 = 0;
    }
    *(_BYTE *)(a1 + v7) = v12;
  }
  return a1;
}

uint64_t sub_1BA18AA6C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  int v6;
  unsigned int v8;
  int v9;
  unsigned int v10;

  v3 = 9;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) > 9uLL)
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_21;
  v4 = v3 + 1;
  v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    v8 = ((a2 + ~(-1 << v5) - 254) >> v5) + 1;
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
      if (v10 >= 2)
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
    return (v9 + 255);
  if (v4 > 3)
    LODWORD(v4) = 4;
  return ((uint64_t (*)(void))((char *)&loc_1BA18AB30 + 4 * byte_1BA19E390[(v4 - 1)]))();
}

void sub_1BA18AB7C(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  size_t v6;
  char v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  if (v5 <= 9)
    v5 = 9;
  v6 = v5 + 1;
  v7 = 8 * (v5 + 1);
  if (a3 < 0xFF)
  {
    v8 = 0u;
  }
  else if (v6 <= 3)
  {
    v10 = ((a3 + ~(-1 << v7) - 254) >> v7) + 1;
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
  if (a2 <= 0xFE)
    __asm { BR              X11 }
  v9 = a2 - 255;
  if (v6 < 4)
  {
    if ((_DWORD)v5 != -1)
    {
      v11 = v9 & ~(-1 << v7);
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *a1 = v11;
        *((_BYTE *)a1 + 2) = BYTE2(v11);
      }
      else if ((_DWORD)v6 == 2)
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
    bzero(a1, v5 + 1);
    *(_DWORD *)a1 = v9;
  }
  __asm { BR              X10 }
}

uint64_t sub_1BA18AD20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 9;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64) > 9uLL)
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (*(unsigned __int8 *)(a1 + v2) < 2u)
    return *(unsigned __int8 *)(a1 + v2);
  if (v2 <= 3)
    v3 = v2;
  else
    v3 = 4;
  return ((uint64_t (*)(void))((char *)&loc_1BA18AD68 + 4 * byte_1BA19E39E[v3]))();
}

void sub_1BA18ADB0(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) <= 9uLL)
    v4 = 9;
  else
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (a2 > 1)
  {
    v5 = a2 - 2;
    if (v4 < 4)
    {
      v6 = v5 >> (8 * v4);
      v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
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
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t sub_1BA18AE78()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BA18AE84()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BA18AE90()
{
  return sub_1BA18A4F4();
}

unint64_t sub_1BA18AEB0()
{
  unint64_t result;

  result = qword_1EF2746F8;
  if (!qword_1EF2746F8)
  {
    result = MEMORY[0x1BCCD6858](&unk_1BA19D4D4, &type metadata for LayoutDecoderError);
    atomic_store(result, (unint64_t *)&qword_1EF2746F8);
  }
  return result;
}

double sub_1BA18AEEC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  double result;
  uint64_t v11;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_1BA169038(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    *v4 = 0x8000000000000000;
    sub_1BA18B0D0();
    sub_1BA19AF54();
    swift_bridgeObjectRelease();
    sub_1BA16E7BC((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v8), a3);
    sub_1BA19AF6C();
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_1BA18B00C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1BA18B12C(a1, a2, a3, a4, (unint64_t *)&unk_1ED5CA100, (void (*)(uint64_t))type metadata accessor for LayoutContextFrame);
}

_OWORD *sub_1BA18B020(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  _OWORD *v12;
  _OWORD *result;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  _QWORD *v18;

  OUTLINED_FUNCTION_1_29(a1, a2, a3);
  OUTLINED_FUNCTION_14_3();
  if (v7)
  {
    __break(1u);
LABEL_10:
    result = (_OWORD *)sub_1BA19B0C8();
    __break(1u);
    return result;
  }
  v8 = v5;
  v9 = v6;
  sub_1BA18B0D0();
  if ((OUTLINED_FUNCTION_5_18() & 1) != 0)
  {
    OUTLINED_FUNCTION_12_4();
    OUTLINED_FUNCTION_10_7();
    if (!v11)
      goto LABEL_10;
    v8 = v10;
  }
  if ((v9 & 1) != 0)
  {
    v12 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)v4 + 56) + 32 * v8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    return sub_1BA16E7BC(v3, v12);
  }
  else
  {
    OUTLINED_FUNCTION_18_0();
    sub_1BA18B208(v14, v15, v16, v17, v18);
    return (_OWORD *)OUTLINED_FUNCTION_9_10();
  }
}

void sub_1BA18B0D0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5C9FC8)
  {
    v0 = sub_1BA19AF78();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5C9FC8);
  }
}

uint64_t sub_1BA18B12C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t *a5, void (*a6)(uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v10;
  char v11;
  char v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t result;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;

  OUTLINED_FUNCTION_1_29(a1, a2, a3);
  OUTLINED_FUNCTION_14_3();
  if (v12)
  {
    __break(1u);
    goto LABEL_9;
  }
  v13 = v10;
  v14 = v11;
  sub_1BA16F7AC(0, a5, a6);
  if ((OUTLINED_FUNCTION_5_18() & 1) == 0)
    goto LABEL_5;
  v15 = OUTLINED_FUNCTION_12_4();
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_9:
    result = sub_1BA19B0C8();
    __break(1u);
    return result;
  }
  v13 = v15;
LABEL_5:
  if ((v14 & 1) != 0)
  {
    v17 = *(_QWORD *)(*(_QWORD *)v7 + 56);
    result = swift_release();
    *(_QWORD *)(v17 + 8 * v13) = v6;
  }
  else
  {
    OUTLINED_FUNCTION_18_0();
    sub_1BA172A98(v19, v20, v21, v22, v23);
    return swift_bridgeObjectRetain();
  }
  return result;
}

_OWORD *sub_1BA18B208(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
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
  result = sub_1BA16E7BC(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

unint64_t sub_1BA18B270()
{
  unint64_t result;

  result = qword_1EF274710;
  if (!qword_1EF274710)
  {
    result = MEMORY[0x1BCCD6858](&protocol conformance descriptor for FastLayoutDecoderError, &type metadata for FastLayoutDecoderError);
    atomic_store(result, (unint64_t *)&qword_1EF274710);
  }
  return result;
}

uint64_t sub_1BA18B2AC()
{
  return swift_deallocObject();
}

uint64_t sub_1BA18B2BC()
{
  return sub_1BA18AE90();
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return sub_1BA19AFA8();
}

uint64_t OUTLINED_FUNCTION_28_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_30_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

void sub_1BA18B300(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1E0C80A78](a2, a2);
  swift_getAtKeyPath();
  type metadata accessor for Prop();
}

uint64_t sub_1BA18B378(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v6 - 64) = a1;
  *(_QWORD *)(v6 - 56) = &protocol witness table for Node<A>;
  *(_QWORD *)(v6 - 88) = v2;
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 8);
  swift_retain();
  v7(v6 - 88, v1, v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v1);
  return __swift_destroy_boxed_opaque_existential_1(v6 - 88);
}

void sub_1BA18B3D8(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1E0C80A78](a2, a2);
  swift_getAtKeyPath();
  type metadata accessor for Prop();
}

uint64_t sub_1BA18B45C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t);
  unint64_t v9;

  *(_QWORD *)(v7 - 80) = a1;
  *(_QWORD *)(v7 - 72) = &protocol witness table for Node<A>;
  *(_QWORD *)(v7 - 104) = v1;
  v8 = *(void (**)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(v5 + 16);
  v9 = sub_1BA16DFA4();
  swift_retain();
  v8(v4, v7 - 104, v9, v2, v5);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v3, v2);
  __swift_destroy_boxed_opaque_existential_1(v7 - 104);
  return 0;
}

void Prop.__allocating_init(kind:identifier:)()
{
  swift_initStackObject();
  Prop.init(kind:identifier:)();
}

void Prop.init(kind:identifier:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1BA18B524()
{
  uint64_t v0;

  swift_release();
  return __swift_destroy_boxed_opaque_existential_1(v0 + 48);
}

uint64_t Prop.description.getter()
{
  sub_1BA19ABD0();
  sub_1BA16DFA4();
  sub_1BA19AF3C();
  sub_1BA19ABD0();
  return 0;
}

uint64_t sub_1BA18B5C4()
{
  return Prop.description.getter();
}

uint64_t method lookup function for Prop()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Prop.__allocating_init(_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of Prop.__allocating_init(_:_:name:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t sub_1BA18B600()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

void ConditionalList.condition.getter(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
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
  uint64_t TupleTypeMetadata2;
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
  _QWORD v59[6];
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v69 = a2;
  v60 = a1[7];
  v2 = *(_QWORD *)(*(_QWORD *)(v60 + 24) + 16);
  v63 = a1[5];
  v3 = *(_QWORD *)(v63 + 8);
  v68 = a1;
  v4 = a1[3];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v59[4] = v2;
  v59[2] = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_14_4();
  MEMORY[0x1E0C80A78](v6, v7);
  v59[1] = (char *)v59 - v8;
  sub_1BA19ADEC();
  OUTLINED_FUNCTION_14_4();
  MEMORY[0x1E0C80A78](v9, v10);
  v62 = (char *)v59 - v11;
  v61 = *(_QWORD *)(AssociatedTypeWitness - 8);
  OUTLINED_FUNCTION_12_2();
  MEMORY[0x1E0C80A78](v12, v13);
  OUTLINED_FUNCTION_1_30();
  v59[3] = v14 - v15;
  v18 = MEMORY[0x1E0C80A78](v16, v17);
  v59[5] = (char *)v59 - v19;
  v21 = MEMORY[0x1E0C80A78](v18, v20);
  v65 = (char *)v59 - v22;
  MEMORY[0x1E0C80A78](v21, v23);
  v64 = (char *)v59 - v24;
  v67 = v3;
  v25 = swift_getAssociatedTypeWitness();
  v26 = sub_1BA19ADEC();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x1E0C80A78](TupleTypeMetadata2, v28);
  OUTLINED_FUNCTION_1_30();
  MEMORY[0x1E0C80A78](v31, v29 - v30);
  v66 = *(_QWORD *)(v26 - 8);
  OUTLINED_FUNCTION_12_2();
  MEMORY[0x1E0C80A78](v32, v33);
  OUTLINED_FUNCTION_1_30();
  v36 = MEMORY[0x1E0C80A78](v34, v35);
  v38 = MEMORY[0x1E0C80A78](v36, v37);
  v40 = MEMORY[0x1E0C80A78](v38, v39);
  v42 = MEMORY[0x1E0C80A78](v40, v41);
  MEMORY[0x1E0C80A78](v42, v43);
  v73 = *(_QWORD *)(v25 - 8);
  OUTLINED_FUNCTION_12_2();
  MEMORY[0x1E0C80A78](v44, v45);
  OUTLINED_FUNCTION_1_30();
  v48 = MEMORY[0x1E0C80A78](v46, v47);
  v50 = MEMORY[0x1E0C80A78](v48, v49);
  MEMORY[0x1E0C80A78](v50, v51);
  v52 = *(_QWORD *)(v4 - 8);
  v71 = v4;
  v72 = v52;
  OUTLINED_FUNCTION_12_2();
  MEMORY[0x1E0C80A78](v53, v54);
  OUTLINED_FUNCTION_1_30();
  v57 = MEMORY[0x1E0C80A78](v55, v56);
  MEMORY[0x1E0C80A78](v57, v58);
  __asm { BR              X10 }
}

uint64_t sub_1BA18B9C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t TupleTypeMetadata2;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  void (*v29)(uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;

  *(_QWORD *)(v14 - 184) = a8;
  *(_QWORD *)(v14 - 176) = a4;
  *(_QWORD *)(v14 - 168) = v9;
  *(_QWORD *)(v14 - 128) = a1;
  v15 = *(_QWORD *)(v14 - 120);
  v16 = v8;
  *(_QWORD *)(v14 - 192) = a3;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v19 = swift_projectBox();
  v20 = v19 + *(int *)(TupleTypeMetadata2 + 48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 112) + 16))(v10, v19, v15);
  v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 104) + 16);
  v21(a7, v20, v16);
  v22 = *(_QWORD *)(v14 - 192);
  sub_1BA19AD2C();
  *(_QWORD *)(v14 - 152) = a7;
  v21(v11, a7, v16);
  __swift_storeEnumTagSinglePayload(v11, 0, 1, v16);
  v23 = *(_QWORD *)(v14 - 128);
  v24 = v22 + *(int *)(v23 + 48);
  v25 = *(_QWORD *)(v14 - 160);
  OUTLINED_FUNCTION_8_13(v22, v12);
  OUTLINED_FUNCTION_8_13(v24, v11);
  OUTLINED_FUNCTION_6_14(v22, 1, v16);
  if (!v28)
  {
    OUTLINED_FUNCTION_8_13(*(_QWORD *)(v14 - 184), v22);
    OUTLINED_FUNCTION_6_14(v24, 1, v16);
    if (!v28)
    {
      v30 = *(_QWORD *)(v14 - 104);
      v31 = *(_QWORD *)(v14 - 176);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 32))(v31, v24, v16);
      v27 = sub_1BA19AB88();
      v32 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
      v32(v31, v16);
      OUTLINED_FUNCTION_9_11(v11);
      v26 = v30;
      OUTLINED_FUNCTION_9_11(v12);
      v32(*(_QWORD *)(v14 - 184), v16);
      OUTLINED_FUNCTION_9_11(*(_QWORD *)(v14 - 192));
      goto LABEL_10;
    }
    v29 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
    v29(v11, v13);
    v29(v12, v13);
    v26 = *(_QWORD *)(v14 - 104);
    (*(void (**)(_QWORD, uint64_t))(v26 + 8))(*(_QWORD *)(v14 - 184), v16);
LABEL_9:
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 168) + 8))(v22, v23);
    v27 = 0;
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_3_25(v11);
  OUTLINED_FUNCTION_3_25(v12);
  OUTLINED_FUNCTION_6_14(v24, 1, v16);
  v26 = *(_QWORD *)(v14 - 104);
  if (!v28)
    goto LABEL_9;
  OUTLINED_FUNCTION_3_25(v22);
  v27 = 1;
LABEL_10:
  v33 = *(_QWORD *)(v14 - 120);
  v34 = *(_QWORD *)(v14 - 136);
  *(_QWORD *)(v34 + 24) = &type metadata for BoolCondition;
  *(_QWORD *)(v34 + 32) = &off_1E71E62A8;
  *(_BYTE *)v34 = v27 & 1;
  (*(void (**)(_QWORD, uint64_t))(v26 + 8))(*(_QWORD *)(v14 - 152), v16);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 112) + 8))(v10, v33);
}

unint64_t sub_1BA18C2B8()
{
  unint64_t result;

  result = qword_1EF274718[0];
  if (!qword_1EF274718[0])
  {
    result = MEMORY[0x1BCCD6858](MEMORY[0x1E0DEB460], MEMORY[0x1E0DEB418]);
    atomic_store(result, qword_1EF274718);
  }
  return result;
}

uint64_t Conditional.description.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v4;
  uint64_t v6;

  v2 = *(_QWORD *)v1 >> 62;
  if (!(_DWORD)v2)
  {
    v6 = 0x28727078652ELL;
    sub_1BA19ABD0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_5_19();
    return v6;
  }
  if ((_DWORD)v2 == 1)
  {
    v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
    v6 = 0;
    sub_1BA171AC4(v4);
    sub_1BA19ABD0();
    MEMORY[0x1BCCD6858](&protocol conformance descriptor for Conditional<A>, a1);
    sub_1BA19AFFC();
    OUTLINED_FUNCTION_5_19();
    sub_1BA171BFC(v4);
    return v6;
  }
  return 0x6C626978656C662ELL;
}

uint64_t dispatch thunk of ConditionType.evaluate<A>(cursor:template:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of ConditionalProviding.condition.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

unint64_t *sub_1BA18C464(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a2;
  sub_1BA171AC4(*a2);
  *a1 = v3;
  return a1;
}

unint64_t *sub_1BA18C494(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a2;
  sub_1BA171AC4(*a2);
  v4 = *a1;
  *a1 = v3;
  sub_1BA171BFC(v4);
  return a1;
}

unint64_t *sub_1BA18C4CC(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a1;
  *a1 = *a2;
  sub_1BA171BFC(v3);
  return a1;
}

uint64_t sub_1BA18C4FC()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t getEnumTagSinglePayload for AltTextLogic(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0x7D && *(_BYTE *)(a1 + 8))
    {
      v2 = *(_DWORD *)a1 + 124;
    }
    else
    {
      v2 = (((*(_QWORD *)a1 >> 57) >> 5) | (4 * ((*(_QWORD *)a1 >> 57) & 0x18 | *(_QWORD *)a1 & 7))) ^ 0x7F;
      if (v2 >= 0x7C)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for AltTextLogic(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x7C)
  {
    *(_QWORD *)result = a2 - 125;
    if (a3 >= 0x7D)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7D)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
    {
      v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_1BA18C5A8(_QWORD *a1)
{
  return *a1 >> 62;
}

void type metadata accessor for ConditionalList()
{
  JUMPOUT(0x1BCCD681CLL);
}

void DimensionSizerResult.cursorValue.getter()
{
  OUTLINED_FUNCTION_3_26();
  sub_1BA18C5E8();
  OUTLINED_FUNCTION_8();
}

void sub_1BA18C5E8()
{
  __asm { BR              X11 }
}

uint64_t sub_1BA18C634()
{
  char v0;

  return ((uint64_t (*)(_QWORD))sub_1BA18C5E8)(v0 & 1);
}

void DimensionSizerResult.value.getter()
{
  OUTLINED_FUNCTION_3_26();
  sub_1BA18C7E0();
  OUTLINED_FUNCTION_8();
}

void sub_1BA18C7E0()
{
  __asm { BR              X11 }
}

uint64_t sub_1BA18C824()
{
  char v0;

  return ((uint64_t (*)(_QWORD))sub_1BA18C7E0)(v0 & 1);
}

void DimensionSizerResult.isAmbiguous.getter()
{
  __asm { BR              X11 }
}

void sub_1BA18C9A4()
{
  OUTLINED_FUNCTION_0_31();
  DimensionSizerResult.isAmbiguous.getter();
  OUTLINED_FUNCTION_8();
}

void sub_1BA18C9B8()
{
  JUMPOUT(0x1BA18C9ACLL);
}

void DimensionSizerResult.nonIntegral.getter()
{
  __asm { BR              X11 }
}

void sub_1BA18C9F4()
{
  OUTLINED_FUNCTION_0_31();
  DimensionSizerResult.nonIntegral.getter();
  OUTLINED_FUNCTION_8();
}

void DimensionSizerResult.constraints.getter()
{
  __asm { BR              X11 }
}

uint64_t sub_1BA18CA4C()
{
  OUTLINED_FUNCTION_0_31();
  return DimensionSizerResult.constraints.getter();
}

_QWORD *initializeBufferWithCopyOfBuffer for DimensionSizerResult(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for DimensionSizerResult()
{
  return swift_release();
}

_QWORD *assignWithCopy for DimensionSizerResult(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *assignWithTake for DimensionSizerResult(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_1BA18CB80(_QWORD *a1)
{
  return *a1 >> 61;
}

uint64_t *sub_1BA18CB8C(uint64_t *result, uint64_t a2)
{
  *result = *result & 0xFFFFFFFFFFFFFF8 | (a2 << 61);
  return result;
}

ValueMetadata *type metadata accessor for DimensionSizerResult()
{
  return &type metadata for DimensionSizerResult;
}

ValueMetadata *type metadata accessor for DimensionSizerResult.ProcessResult()
{
  return &type metadata for DimensionSizerResult.ProcessResult;
}

uint64_t sub_1BA18CBC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, char a3@<W4>, uint64_t *a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double v12;
  __int128 v13;
  float64x2_t v14;
  double v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  CGFloat Height;
  char v24;
  double v25;
  double v26[2];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  float64x2_t v30;
  uint64_t v31;
  float64x2_t v32;
  double v33;

  v5 = *(unsigned __int8 *)(a1 + 328);
  if (v5 == 3)
  {
    sub_1BA1787C0();
    swift_allocError();
    *(_QWORD *)(v6 + 8) = 0;
    *(_QWORD *)(v6 + 16) = 0;
    *(_QWORD *)v6 = 0;
    *(_BYTE *)(v6 + 24) = 7;
    return swift_willThrow();
  }
  v9 = a1;
  v10 = *(double *)(a1 + 432);
  v11 = *(_QWORD *)(a1 + 408);
  v12 = *(double *)(a1 + 336);
  LOBYTE(v26[0]) = *(_BYTE *)(a1 + 328);
  v26[1] = v12;
  v13 = *(_OWORD *)(a1 + 360);
  v27 = *(_OWORD *)(a1 + 344);
  v28 = v13;
  v14 = *(float64x2_t *)(a1 + 392);
  v29 = *(_OWORD *)(a1 + 376);
  v30 = v14;
  v31 = v11;
  v32 = *(float64x2_t *)(a1 + 416);
  v33 = v10;
  v15 = (vsubq_f64(v14, v32).f64[0] - v10 - (dbl_1BA19E6D8[(char)v5] + -1.0) * *(double *)&v27)
      / dbl_1BA19E6D8[(char)v5];
  v25 = *(double *)&v27;
  v16 = a3 & 1;
  sub_1BA18CD9C();
  v18 = v17;
  v20 = v19;
  sub_1BA18CE20(a2, v16, v26, (CGRect *)v9);
  if (__OFSUB__(v21, 1))
  {
    __break(1u);
    goto LABEL_7;
  }
  v22 = v15 * (double)v21 + v25 * (double)(v21 - 1);
  Height = CGRectGetHeight(*(CGRect *)(v9 + 96));
  result = swift_allocObject();
  v9 = result;
  *(_QWORD *)(result + 16) = v18;
  *(_QWORD *)(result + 24) = v20;
  *(double *)(result + 32) = v22;
  *(CGFloat *)(result + 40) = Height;
  if (qword_1ED5C9B18 != -1)
LABEL_7:
    result = swift_once();
  v24 = HIBYTE(word_1ED5C8FE0);
  *(_BYTE *)(v9 + 48) = word_1ED5C8FE0;
  *(_BYTE *)(v9 + 49) = v24;
  *a4 = v9;
  return result;
}

uint64_t sub_1BA18CD9C()
{
  return swift_beginAccess();
}

void sub_1BA18CE20(uint64_t a1, char a2, double *a3, CGRect *a4)
{
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;

  if ((a2 & 1) != 0)
  {
    v5 = a3[2];
    v6 = v5 + (a3[8] - a3[11] - a3[13] - v5 * (dbl_1BA19E6D8[*(char *)a3] + -1.0)) / dbl_1BA19E6D8[*(char *)a3];
    if (v6 != 0.0)
    {
      v7 = ceil((v5 + CGRectGetWidth(a4[3])) / v6);
      if (v7 <= -9.22337204e18)
      {
        __break(1u);
      }
      else if (v7 < 9.22337204e18)
      {
        v8 = *(_QWORD *)&v7 & 0x7FF0000000000000;
        v9 = *(double *)&a1 * (double)(uint64_t)v7;
        if (v8 != 0x7FF0000000000000 && (*(_QWORD *)&v9 & 0x7FF0000000000000) != 0x7FF0000000000000)
        {
          if (v9 > -9.22337204e18)
          {
            if (v9 < 9.22337204e18)
              return;
LABEL_16:
            __break(1u);
            return;
          }
LABEL_15:
          __break(1u);
          goto LABEL_16;
        }
LABEL_14:
        __break(1u);
        goto LABEL_15;
      }
      __break(1u);
      goto LABEL_14;
    }
  }
}

uint64_t sub_1BA18CF34@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_1BA18CBC4(a1, *(_QWORD *)v2, *(_BYTE *)(v2 + 8), a2);
}

uint64_t sub_1BA18CF6C()
{
  sub_1BA19ABD0();
  sub_1BA19AF3C();
  sub_1BA19ABD0();
  return 0;
}

uint64_t sub_1BA18D004()
{
  return sub_1BA18CF6C();
}

ValueMetadata *type metadata accessor for ColumnSizer.Column()
{
  return &type metadata for ColumnSizer.Column;
}

uint64_t __swift_memcpy10_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for ColumnSizer(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 10))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 1)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ColumnSizer(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_WORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 10) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 10) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ColumnSizer()
{
  return &type metadata for ColumnSizer;
}

uint64_t sub_1BA18D0E4()
{
  return swift_deallocObject();
}

void sub_1BA18D0F4(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

void BuilderType.mapFrame<A>(name:keyPath:size:_:mapBlock:)()
{
  OUTLINED_FUNCTION_38();
}

uint64_t sub_1BA18D130()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1BA18D154(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t *v2;
  void (*v3)(double);
  uint64_t v4;
  double v5;

  v2 = (uint64_t *)OUTLINED_FUNCTION_25_0(a1);
  v3 = *(void (**)(double))(v1 + 48);
  v2[3] = v4;
  __swift_allocate_boxed_opaque_existential_0(v2);
  v5 = OUTLINED_FUNCTION_31_0();
  v3(v5);
  OUTLINED_FUNCTION_48();
}

void BuilderType.mapFrameWithContext<A>(name:keyPath:size:_:mapBlock:)()
{
  OUTLINED_FUNCTION_38();
}

void sub_1BA18D1CC()
{
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_40();
  type metadata accessor for Frame();
}

uint64_t sub_1BA18D264()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v14 = v2;
  swift_bridgeObjectRetain();
  swift_retain();
  OUTLINED_FUNCTION_36(&v14, v1, (unint64_t *)&v13);
  v8 = (_QWORD *)OUTLINED_FUNCTION_6();
  v8[2] = v0;
  v8[3] = *(_QWORD *)(v7 + 80);
  v8[4] = v3;
  v8[5] = *(_QWORD *)(v7 + 88);
  v8[6] = v10;
  v8[7] = v6;
  OUTLINED_FUNCTION_54();
  Frame.__allocating_init(name:_:_:mapBlock:)(v11, v5, v4, &v13, v12, (uint64_t)v8);
  (*(void (**)(void))(v3 + 40))();
  return OUTLINED_FUNCTION_9_12();
}

void sub_1BA18D320(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t *v4;
  void (*v5)(uint64_t, double);
  uint64_t v6;
  double v7;

  v4 = (uint64_t *)OUTLINED_FUNCTION_25_0(a2);
  v5 = *(void (**)(uint64_t, double))(v2 + 48);
  v4[3] = v6;
  __swift_allocate_boxed_opaque_existential_0(v4);
  v7 = OUTLINED_FUNCTION_31_0();
  v5(a1, v7);
  OUTLINED_FUNCTION_48();
}

void BuilderType.hOverlay(name:reversed:size:_:on:embedPath:block:)(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_22_1(a1, a2, a3, a4, a5, a6, a7, a8, a10, a9, v10, v11, v12, v13, 0);
}

void sub_1BA18D38C()
{
  OUTLINED_FUNCTION_49();
}

void BuilderType.inheritedOverlay(name:reversed:size:_:on:embedPath:block:)(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_22_1(a1, a2, a3, a4, a5, a6, a7, a8, a10, a9, v10, v11, v12, v13, 2);
}

void sub_1BA18D3B4()
{
  OUTLINED_FUNCTION_49();
}

unint64_t sub_1BA18D3BC(unint64_t result)
{
  switch((result >> 59) & 0x1E | (result >> 2) & 1)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
      result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

void BuilderType.mapEmbed<A, B, C>(name:keyPath:size:_:layout:mapBlock:)(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4, uint64_t a5, _QWORD *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  OUTLINED_FUNCTION_44(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

void sub_1BA18D41C()
{
  OUTLINED_FUNCTION_15_1();
}

uint64_t sub_1BA18D424()
{
  swift_release();
  return swift_deallocObject();
}

void BuilderType.mapEmbedFactory<A, B>(name:keyPath:size:positions:context:mapBlock:)()
{
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_35();
}

void sub_1BA18D4E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  MEMORY[0x1E0C80A78](a1, a2);
  *(_QWORD *)(v7 - 152) = v6;
  *(_QWORD *)(v7 - 144) = v4;
  *(_QWORD *)(v7 - 136) = v5;
  *(_QWORD *)(v7 - 128) = v2;
  *(_QWORD *)(v7 - 120) = &protocol witness table for LayoutItemList<A>;
  *(_QWORD *)(v7 - 112) = v3;
  OUTLINED_FUNCTION_34();
}

void sub_1BA18D528(uint64_t a1)
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
  _QWORD *v10;
  uint64_t v11;

  *(_QWORD *)(v8 - 232) = a1;
  *(_QWORD *)(v8 - 152) = v6;
  swift_bridgeObjectRetain();
  swift_retain();
  v9 = *(_QWORD *)(v8 - 240);
  sub_1BA168200((unint64_t *)(v8 - 152), *(_QWORD *)(v8 - 224), (unint64_t *)(v8 - 160));
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 16))(v5, *(_QWORD *)(v8 - 208), v4);
  v10 = (_QWORD *)OUTLINED_FUNCTION_6();
  v10[2] = v9;
  v10[3] = *(_QWORD *)(v3 + 80);
  v10[4] = v7;
  v10[5] = v1;
  v11 = *(_QWORD *)(v8 - 248);
  v10[6] = *(_QWORD *)(v3 + 88);
  v10[7] = v11;
  v10[8] = *(_QWORD *)(v8 - 200);
  v10[9] = *(_QWORD *)(v8 - 192);
  swift_retain();
  sub_1BA164DC0(*(_QWORD *)(v8 - 184), *(_QWORD *)(v8 - 168), *(_QWORD *)(v8 - 176), (uint64_t *)(v8 - 160));
}

void sub_1BA18D5DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 40))(a1, v2, v1);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_1_13();
}

uint64_t sub_1BA18D604()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BA18D628@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t (*v4)(uint64_t);

  v4 = *(uint64_t (**)(uint64_t))(v2 + 64);
  a2[3] = *(_QWORD *)(v2 + 24);
  __swift_allocate_boxed_opaque_existential_0(a2);
  return v4(a1);
}

uint64_t sub_1BA18D66C()
{
  swift_release();
  return swift_deallocObject();
}

void BuilderType.if<A>(_:thenBlock:)()
{
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_40();
  type metadata accessor for IfBuilder();
}

void sub_1BA18D73C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;

  v20 = sub_1BA163C50(v19, v14);
  type metadata accessor for IfNode(0, v13, v17, v21);
  v22 = (_QWORD *)OUTLINED_FUNCTION_6();
  v22[2] = v16;
  v22[3] = a11;
  v22[4] = v15;
  v22[5] = a12;
  v22[6] = a13;
  v22[7] = v18;
  v22[8] = v20;
  swift_retain();
  swift_retain();
  OUTLINED_FUNCTION_33();
  sub_1BA17D438();
}

uint64_t sub_1BA18D7DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  v7 = (_QWORD *)OUTLINED_FUNCTION_6();
  v7[2] = v1;
  v7[3] = v4;
  v7[4] = v0;
  v7[5] = v5;
  v7[6] = v2;
  v7[7] = v3;
  v7[8] = v6;
  swift_retain();
  v8 = IfNode.Else(elseBlock:)((uint64_t)sub_1BA18D8A4, (uint64_t)v7);
  swift_release();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_3_27(v8, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 40));
  OUTLINED_FUNCTION_9_12();
  return v6;
}

uint64_t sub_1BA18D864()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1BA18D888()
{
  sub_1BA172758();
}

void sub_1BA18D89C()
{
  OUTLINED_FUNCTION_0_0();
}

void sub_1BA18D8A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1BA1729A8(a1, a2, a3, a4);
  OUTLINED_FUNCTION_0_0();
}

Swift::Void __swiftcall BuilderType.log(_:)(Swift::String a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_28_1();
  v3 = OUTLINED_FUNCTION_18_1();
  v4 = OUTLINED_FUNCTION_6_15();
  type metadata accessor for Log(0, v3, v4, v5);
  OUTLINED_FUNCTION_26_0();
  v6 = Log.__allocating_init(_:)(v2, v1);
  OUTLINED_FUNCTION_0_32(v6);
  OUTLINED_FUNCTION_5_20();
}

uint64_t BuilderType.inspect(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_28_1();
  v2 = OUTLINED_FUNCTION_18_1();
  v3 = OUTLINED_FUNCTION_6_15();
  type metadata accessor for Inspect(0, v2, v3, v4);
  swift_retain();
  v5 = Inspect.__allocating_init(_:)(v1, v0);
  OUTLINED_FUNCTION_0_32(v5);
  return OUTLINED_FUNCTION_5_20();
}

uint64_t sub_1BA18D9A4()
{
  swift_release();
  return swift_deallocObject();
}

void *sub_1BA18D9C8(void *a1)
{
  id v2;

  v2 = a1;
  return a1;
}

uint64_t BuilderType.dynamicWithErrorProcessor(name:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1BA169248(a1, a2, a3, a4, a5, a6, (uint64_t)&unk_1E71E80E0, (uint64_t)sub_1BA18DB64);
}

void sub_1BA18DA08()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  type metadata accessor for ListBuilder();
}

uint64_t sub_1BA18DAD4()
{
  void (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v3 = sub_1BA16CEC0();
  v0(v3, v2);
  if (!v5)
  {
    swift_beginAccess();
    v1 = *(_QWORD *)(v3 + 16);
    swift_bridgeObjectRetain();
  }
  swift_release();
  return v1;
}

void sub_1BA18DB64()
{
  sub_1BA18DA08();
}

void BuilderType.stack(name:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v6;
  uint64_t v7;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  type metadata accessor for Stack(0, AssociatedTypeWitness, AssociatedConformanceWitness, v6);
  OUTLINED_FUNCTION_26_0();
  v7 = Stack.__allocating_init(name:)(a1, a2);
  OUTLINED_FUNCTION_20_1(v7);
  OUTLINED_FUNCTION_10_9();
  OUTLINED_FUNCTION_7_13();
  type metadata accessor for StackBuilder();
}

uint64_t sub_1BA18DC48()
{
  uint64_t v0;
  uint64_t v1;
  void (*v3)(uint64_t);

  v1 = sub_1BA165A60(v0);
  OUTLINED_FUNCTION_54();
  v3(v1);
  swift_release();
  return OUTLINED_FUNCTION_20();
}

uint64_t dispatch thunk of BuilderType.add(node:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t __swift_deallocate_boxed_opaque_existential_0(uint64_t result)
{
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) - 8) + 80) & 0x20000) != 0)
    JUMPOUT(0x1BCCD6900);
  return result;
}

void sub_1BA18DCE0(void *a1, uint64_t a2, void *a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 15:
    case 16:
    case 23:
    case 24:
      goto LABEL_3;
    case 17:
    case 18:
    case 19:
    case 20:
      swift_bridgeObjectRelease();
      a1 = a3;
LABEL_3:

      break;
    case 26:
      swift_bridgeObjectRelease();
      break;
    case 27:
    case 28:
      swift_release();
      break;
    default:
      return;
  }
}

uint64_t OUTLINED_FUNCTION_29_1(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v2;
  va_list va;

  va_start(va, a2);
  return sub_1BA169928(v2, (uint64_t)va);
}

double OUTLINED_FUNCTION_31_0()
{
  double v0;

  return v0;
}

__n128 OUTLINED_FUNCTION_32@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(__n128 *)(a1 + v1);
}

uint64_t OUTLINED_FUNCTION_33()
{
  return swift_retain();
}

void OUTLINED_FUNCTION_34()
{
  type metadata accessor for EmbedFactory();
}

void OUTLINED_FUNCTION_35()
{
  type metadata accessor for EmbedFactory.Context();
}

uint64_t OUTLINED_FUNCTION_36@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_1BA168200(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_37()
{
  return swift_release();
}

void OUTLINED_FUNCTION_38()
{
  sub_1BA18D1CC();
}

uint64_t OUTLINED_FUNCTION_39()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_40()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_41()
{
  uint64_t v0;

  return sub_1BA165A60(v0);
}

uint64_t OUTLINED_FUNCTION_42()
{
  uint64_t v0;

  return sub_1BA165A60(v0);
}

uint64_t OUTLINED_FUNCTION_43()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_44(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, unint64_t *a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v9;

  sub_1BA165DBC(a1, a2, a3, a4, a5, a6, a7, a8, a9, v9);
}

uint64_t OUTLINED_FUNCTION_45()
{
  return swift_retain();
}

void OUTLINED_FUNCTION_46()
{
  sub_1BA16809C();
}

uint64_t OUTLINED_FUNCTION_47@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_1BA168200(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_51()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_52()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t OUTLINED_FUNCTION_54()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_56()
{
  return 0;
}

uint64_t sub_1BA18DED4(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a1 + 41) = *(_BYTE *)(a2 + 41);
  return a1;
}

__n128 __swift_memcpy42_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 26) = *(_OWORD *)(a2 + 26);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_1BA18DF20(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a1 + 41) = *(_BYTE *)(a2 + 41);
  return a1;
}

uint64_t sub_1BA18DF68(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 42))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
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

uint64_t sub_1BA18DFA8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 40) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 42) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 42) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_1BA18DFF4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v8 = *a1;
  v9 = v3[3];
  v10 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v9);
  result = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v10 + 8))(a1, a2, a3, *(_QWORD *)(v8 + 80), *(_QWORD *)(v8 + 88), v9, v10);
  if (!v4)
    return sub_1BA1709C8((uint64_t)&unk_1E71E28B0, result);
  return result;
}

_QWORD *sub_1BA18E08C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _OWORD v24[2];
  uint64_t v25;

  v25 = a4;
  v7 = v5;
  v12 = *a1;
  v13 = *(_QWORD *)(v7 + 24);
  v14 = *(_QWORD *)(v7 + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)v7, v13);
  result = (*(_QWORD *(**)(__int128 *__return_ptr, uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v14 + 16))(&v23, a1, a2, a3, *(_QWORD *)(v12 + 80), *(_QWORD *)(v12 + 88), v13, v14);
  if (!v6)
  {
    v16 = v25;
    v17 = v23;
    if (*(_BYTE *)(v7 + 41) == 1 && (unint64_t)a1[11] >> 62)
    {
      *a5 = v23;
    }
    else
    {
      v18 = OUTLINED_FUNCTION_6();
      v19 = OUTLINED_FUNCTION_6();
      *(_QWORD *)(v19 + 16) = v17;
      (*(void (**)(__int128 *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(&v23, v7, v16);
      v20 = OUTLINED_FUNCTION_6();
      v21 = v23;
      v22 = v24[0];
      *(_OWORD *)(v20 + 16) = *(_OWORD *)(v16 + 16);
      *(_OWORD *)(v20 + 32) = v21;
      *(_OWORD *)(v20 + 48) = v22;
      *(_OWORD *)(v20 + 58) = *(_OWORD *)((char *)v24 + 10);
      *(_QWORD *)(v20 + 80) = a1;
      *(_QWORD *)(v19 + 24) = sub_1BA18E934;
      *(_QWORD *)(v19 + 32) = v20;
      *(_QWORD *)(v18 + 16) = v19 | 0x7000000000000000;
      *a5 = v18 | 0x3000000000000000;
      return (_QWORD *)swift_retain();
    }
  }
  return result;
}

void sub_1BA18E1F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for AnchorSizer(0, a3, a4, a4);
  sub_1BA18E284(a2);
}

void sub_1BA18E284(uint64_t a1)
{
  char v1;

  sub_1BA18E648(a1, &v1);
  __asm { BR              X10 }
}

double sub_1BA18E2E8()
{
  CGRect *v0;
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  double v4;
  CGRect v6;
  CGRect v7;

  CGRectGetMinY(v0[3]);
  v6.origin.x = v4;
  v6.origin.y = v3;
  v6.size.width = v2;
  v6.size.height = v1;
  CGRectGetWidth(v6);
  v7.origin.x = v4;
  v7.origin.y = v3;
  v7.size.width = v2;
  v7.size.height = v1;
  CGRectGetHeight(v7);
  return v4;
}

uint64_t sub_1BA18E648@<X0>(uint64_t result@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(v2 + 40);
  if (*(_BYTE *)(result + 440) == 1)
    return ((uint64_t (*)(void))((char *)&loc_1BA18E674 + 4 * byte_1BA19E747[v3]))();
  *a2 = v3;
  return result;
}

void sub_1BA18E67C()
{
  JUMPOUT(0x1BA18E674);
}

void sub_1BA18E688()
{
  JUMPOUT(0x1BA18E674);
}

void sub_1BA18E694()
{
  JUMPOUT(0x1BA18E674);
}

void sub_1BA18E6A0()
{
  JUMPOUT(0x1BA18E674);
}

double sub_1BA18E6AC(uint64_t a1, double a2)
{
  uint64_t v4;

  swift_beginAccess();
  if (*(_QWORD *)(a1 + 64))
  {
    sub_1BA1787C0();
    swift_allocError();
    *(_QWORD *)(v4 + 8) = 0;
    *(_QWORD *)(v4 + 16) = 0;
    *(_QWORD *)v4 = 1;
    *(_BYTE *)(v4 + 24) = 7;
    swift_willThrow();
  }
  return a2;
}

uint64_t sub_1BA18E760(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_1BA18DFF4(a1, a2, a3);
}

_QWORD *sub_1BA18E774@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X5>, uint64_t *a5@<X8>)
{
  return sub_1BA18E08C(a1, a2, a3, a4, a5);
}

uint64_t sub_1BA18E78C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  if (*(_BYTE *)(v1 + 41) == 1)
    sub_1BA19AEA0();
  sub_1BA17C214();
  OUTLINED_FUNCTION_2_27();
  sub_1BA19ABD0();
  v4 = type metadata accessor for Positioning.Anchor(0, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), v3);
  MEMORY[0x1BCCD6858](&protocol conformance descriptor for Positioning<A>.Anchor, v4);
  sub_1BA19AFFC();
  sub_1BA19ABD0();
  return 0;
}

uint64_t sub_1BA18E8C0()
{
  OUTLINED_FUNCTION_1_32();
  return swift_deallocObject();
}

uint64_t sub_1BA18E8E0()
{
  OUTLINED_FUNCTION_1_32();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BA18E908()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  swift_release();
  return swift_deallocObject();
}

void sub_1BA18E934()
{
  uint64_t *v0;

  sub_1BA18E1F0((uint64_t)(v0 + 4), v0[10], v0[2], v0[3]);
}

uint64_t sub_1BA18E954@<X0>(_BYTE *a1@<X8>)
{
  char v2;
  uint64_t result;

  if (qword_1ED5C9B18 != -1)
    result = swift_once();
  v2 = HIBYTE(word_1ED5C8FE0);
  *a1 = word_1ED5C8FE0;
  a1[1] = v2;
  return result;
}

uint64_t sub_1BA18E9B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
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
  __int128 *v59;
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat v78;
  char v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  __int128 *v89;
  char *v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  Swift::String_optional v97;
  uint64_t v98;
  uint64_t v99;
  char v100;
  char v101;
  char *v102;
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
  int v118;
  uint64_t v119;
  char *v120;
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
  char v134[2];
  char v135;
  char v136;
  char v137;
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
  uint64_t v150;
  uint64_t v151;
  _QWORD v152[25];
  _QWORD v153[3];
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  Swift::OpaquePointer_optional v157;
  __C::CGRect v158;
  __C::CGRect v159;

  v5 = v4;
  v126 = a3;
  v156 = a2;
  v8 = *(_QWORD *)v5;
  v9 = sub_1BA19AAD4();
  v121 = *(_QWORD *)(v9 - 8);
  v122 = v9;
  MEMORY[0x1E0C80A78](v9, v10);
  v120 = (char *)&v102 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v125 = a4;
  v12 = *(_QWORD *)(v5 + 72);
  v123 = *(_QWORD *)(v5 + 64);
  v124 = v12;
  sub_1BA16AF64();
  v14 = v13;
  v128 = *(_QWORD *)(v5 + 40);
  v152[0] = v128;
  v16 = *(_QWORD *)(v8 + 136);
  v15 = *(_QWORD *)(v8 + 144);
  v127 = type metadata accessor for Sizing(0, v16, v15, v17);
  sub_1BA16A170();
  v18 = v154;
  v19 = v155;
  __swift_project_boxed_opaque_existential_1(v153, v154);
  v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 8);
  v130 = a1;
  v129 = v16;
  v131 = v15;
  v21 = v132;
  v22 = v20(a1, v156, v14, v16, v15, v18, v19);
  if (v21)
  {
    swift_release();
    return OUTLINED_FUNCTION_11_8();
  }
  v132 = v22;
  OUTLINED_FUNCTION_11_8();
  v152[0] = v128;
  sub_1BA16A170();
  v23 = v154;
  v24 = v155;
  __swift_project_boxed_opaque_existential_1(v153, v154);
  v25 = v129;
  v26 = v130;
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 16))(v152, v130, v156, v14, v129, v131, v23, v24);
  v27 = v14;
  v29 = (_QWORD *)v26;
  v30 = v131;
  v31 = v25;
  v32 = v152[0];
  OUTLINED_FUNCTION_11_8();
  v153[0] = v32;
  SizerResult.isAmbiguous.getter();
  if ((v33 & 1) != 0)
  {
    swift_release();
    OUTLINED_FUNCTION_2_28();
    swift_release();
    return swift_retain();
  }
  v119 = 0;
  v153[0] = v32;
  v152[0] = v32;
  v128 = v32;
  swift_retain();
  SizerResult.nonIntegral.getter();
  sub_1BA16AA5C();
  OUTLINED_FUNCTION_9_0();
  v117 = v32 & 0xFFFFFFFFFFFFFFFLL;
  swift_release();
  v34 = v5;
  OUTLINED_FUNCTION_0();
  sub_1BA16D270(v35, v36, v123, v124);
  v37 = (_QWORD *)(v5 + 56);
  v118 = *(unsigned __int8 *)(v5 + 80);
  v116 = v27;
  if (v118 == 1)
  {
    swift_beginAccess();
    v153[0] = *v37;
    v38 = v31;
    type metadata accessor for Node(255, v31, v30, v39);
    v40 = sub_1BA19ACE4();
    swift_bridgeObjectRetain();
    MEMORY[0x1BCCD6858](MEMORY[0x1E0DEAF38], v40);
    v127 = sub_1BA19AC0C();
  }
  else
  {
    swift_beginAccess();
    v127 = *v37;
    swift_bridgeObjectRetain();
    v38 = v31;
  }
  v42 = type metadata accessor for Cursor(0, v38, v30, v41);
  OUTLINED_FUNCTION_7_0(v153, v29 + 16);
  OUTLINED_FUNCTION_7_0(v152, v29 + 16);
  v44 = v29[41];
  v43 = v29[42];
  v45 = v29;
  v46 = v29[43];
  v47 = v45[44];
  v48 = v45[45];
  v49 = v45[46];
  v50 = v45[47];
  v51 = v45[48];
  v52 = v45[49];
  v53 = v45[50];
  v54 = v45[51];
  v55 = v45[52];
  v56 = v45[53];
  v57 = v45[54];
  v138 = v44;
  v139 = v43;
  v129 = v43;
  v140 = v46;
  v141 = v47;
  v114 = v48;
  v115 = v47;
  v142 = v48;
  v143 = v49;
  v112 = v50;
  v113 = v49;
  v144 = v50;
  v145 = v51;
  v110 = v52;
  v111 = v51;
  v146 = v52;
  v147 = v53;
  v108 = v54;
  v109 = v53;
  v148 = v54;
  v149 = v55;
  v106 = v56;
  v107 = v55;
  v150 = v56;
  v151 = v57;
  v105 = v57;
  v135 = *(_BYTE *)(v34 + 48);
  sub_1BA19673C((uint64_t)v45, &v137);
  v136 = v137;
  OUTLINED_FUNCTION_7_14();
  v133 = v128;
  sub_1BA1667D4((uint64_t)v153);
  SizerResult.behavior.getter();
  OUTLINED_FUNCTION_5_21();
  v133 = 0x8000000000000000;
  v100 = v118;
  OUTLINED_FUNCTION_0();
  v131 = v42;
  result = sub_1BA180820(v58, v59, v60, v61, 0, 0, 2, v62, &v133, v100);
  v63 = v126 + 1;
  if (__OFADD__(v126, 1))
  {
    __break(1u);
  }
  else
  {
    v64 = result;
    v65 = v119;
    v66 = sub_1BA18F820(v34, v127, result, v156, v126 + 1, v125);
    if (v65)
    {
      swift_release();
      OUTLINED_FUNCTION_2_28();
      OUTLINED_FUNCTION_3_28();
      swift_bridgeObjectRelease();
      return swift_release();
    }
    v67 = v34;
    v103 = v44;
    v104 = v64;
    v119 = v63;
    v68 = v128;
    v152[0] = v128;
    v69 = v66;
    v158.origin.x = Cursor.absoluteFrame.getter();
    SizerResult.postProcess(frame:nonIntegral:)(v158, 0);
    if (v70)
    {
      OUTLINED_FUNCTION_3_28();
      swift_release();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_2_28();
      OUTLINED_FUNCTION_9_13();
      return swift_release();
    }
    OUTLINED_FUNCTION_9_0();
    v102 = v69;
    sub_1BA182DA0();
    v72 = v71;
    v74 = v73;
    v76 = v75;
    v78 = v77;
    v152[0] = v68;
    SizerResult.shouldResize.getter();
    if ((v79 & 1) != 0 || (v152[0] = v68, SizerResult.shouldPostProcess.getter(), (v80 & 1) != 0))
    {
      OUTLINED_FUNCTION_0_21();
      v81 = v119;
      sub_1BA16FA78(v82, v119);
      OUTLINED_FUNCTION_7_0(v152, v153);
      v138 = v103;
      v139 = v129;
      v140 = v46;
      v141 = v115;
      v142 = v114;
      v143 = v113;
      v144 = v112;
      v145 = v111;
      v146 = v110;
      v147 = v109;
      v148 = v108;
      v149 = v107;
      v150 = v106;
      v151 = v105;
      v135 = *(_BYTE *)(v67 + 48);
      sub_1BA19673C(v130, &v137);
      v136 = v137;
      OUTLINED_FUNCTION_7_14();
      v83 = swift_allocObject();
      sub_1BA1667D4((uint64_t)v153);
      v84 = v120;
      sub_1BA19AAC8();
      v85 = sub_1BA19AABC();
      v87 = v86;
      (*(void (**)(char *, uint64_t))(v121 + 8))(v84, v122);
      *(_QWORD *)(v83 + 16) = v85;
      *(_QWORD *)(v83 + 24) = v87;
      v133 = v83;
      sub_1BA18E954(v134);
      OUTLINED_FUNCTION_5_21();
      v101 = v118;
      OUTLINED_FUNCTION_0_21();
      v93 = sub_1BA180820(v88, v89, v90, v91, 0, 0, 2, v92, &v133, v101);
      sub_1BA18F820(v67, v127, v93, v156, v81, v125);
      v119 = 0;
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
    }
    else
    {
      v119 = 0;
      swift_bridgeObjectRelease();
    }
    LOBYTE(v138) = v102[48];
    v152[0] = v128;
    SizerResult.metadata.getter();
    v159.origin.x = v72;
    v159.origin.y = v74;
    v159.size.width = v76;
    v157.value._rawValue = v94;
    v95 = v123;
    v96 = v124;
    v157.is_nil = v123;
    v159.size.height = v78;
    v97.value._countAndFlagsBits = v124;
    LayoutContext.set(frame:direction:metadata:for:)(v159, (TeaTemplate::Direction)&v138, v157, v97);
    swift_bridgeObjectRelease();
    LOBYTE(v152[0]) = 2;
    OUTLINED_FUNCTION_0_21();
    sub_1BA17FD24();
    OUTLINED_FUNCTION_0();
    sub_1BA17FE6C(v132);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_0_21();
    sub_1BA16D280(v98, v99, v95, v96);
    swift_release();
    OUTLINED_FUNCTION_3_28();
    OUTLINED_FUNCTION_9_13();
    swift_release();
    return 0;
  }
  return result;
}

void sub_1BA18F1CC()
{
  swift_initStackObject();
  sub_1BA18F428();
}

void sub_1BA18F1E8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  OUTLINED_FUNCTION_0_14();
  type metadata accessor for Node(0, *(_QWORD *)(v1 + 136), *(_QWORD *)(v1 + 144), v2);
  swift_bridgeObjectRetain();
  sub_1BA19AC60();
  OUTLINED_FUNCTION_9_5();
}

uint64_t sub_1BA18F318(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(v1 + 48) == 2)
    *(_BYTE *)(v1 + 48) = *(_BYTE *)(result + 48);
  return result;
}

uint64_t HBox<A>(name:reversed:_:)(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_1BA18F350(a1, a2, a3, a4, a5, a6, 0, (uint64_t (*)(void))sub_1BA184DD4);
}

uint64_t VBox<A>(name:reversed:_:)(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_1BA18F350(a1, a2, a3, a4, a5, a6, 1, (uint64_t (*)(void))sub_1BA184F24);
}

uint64_t sub_1BA18F350(uint64_t a1, uint64_t a2, char a3, unint64_t *a4, uint64_t a5, uint64_t a6, char a7, uint64_t (*a8)(void))
{
  unint64_t v13;
  uint64_t v14;
  char v16;
  char v17;
  unint64_t v18;

  v13 = *a4;
  type metadata accessor for Box(0, a5, a6, (uint64_t)a4);
  v18 = v13;
  v17 = a7;
  sub_1BA18D0F4(&v16);
  sub_1BA1683F8(v13);
  swift_bridgeObjectRetain();
  sub_1BA16799C(&v16, (uint64_t *)&v18, &v17, a1, a2, a3);
  v14 = a8();
  OUTLINED_FUNCTION_4_5();
  return v14;
}

void sub_1BA18F428()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1BA18F454()
{
  uint64_t v0;

  sub_1BA168614(*(_QWORD *)(v0 + 40));
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BA18F478()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  if (*((_BYTE *)v0 + 48) && *((_BYTE *)v0 + 48) != 1)
    sub_1BA19AEA0();
  sub_1BA19ABD0();
  v3 = type metadata accessor for Sizing(0, *(_QWORD *)(v1 + 136), *(_QWORD *)(v1 + 144), v2);
  MEMORY[0x1BCCD6858](&protocol conformance descriptor for Sizing<A>, v3);
  sub_1BA19AFFC();
  sub_1BA19ABD0();
  return 0;
}

uint64_t sub_1BA18F58C()
{
  return sub_1BA18F478();
}

uint64_t sub_1BA18F5AC()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

BOOL static AltTextLogic.Operator.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AltTextLogic.Operator.hash(into:)()
{
  return sub_1BA19B110();
}

uint64_t AltTextLogic.Operator.hashValue.getter()
{
  sub_1BA19B104();
  sub_1BA19B110();
  return sub_1BA19B128();
}

unint64_t sub_1BA18F688()
{
  unint64_t result;

  result = qword_1EF2747A0;
  if (!qword_1EF2747A0)
  {
    result = MEMORY[0x1BCCD6858](&protocol conformance descriptor for AltTextLogic.Operator, &type metadata for AltTextLogic.Operator);
    atomic_store(result, (unint64_t *)&qword_1EF2747A0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AltTextLogic.Operator(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFB)
  {
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
    v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v5 = v6 - 6;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AltTextLogic.Operator(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BA18F798 + 4 * byte_1BA19E8A5[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1BA18F7CC + 4 * byte_1BA19E8A0[v4]))();
}

uint64_t sub_1BA18F7CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA18F7D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA18F7DCLL);
  return result;
}

uint64_t sub_1BA18F7E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA18F7F0);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_1BA18F7F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA18F7FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t dispatch thunk of LayoutItemApplicable.register(source:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of LayoutItemApplicable.apply<A>(_:source:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of LayoutValueSource.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

char *sub_1BA18F820(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  char *v10;
  char v13;
  char v15;
  uint64_t v16;

  v10 = (char *)a3;
  v13 = sub_1BA18F93C(a3, a2, a4, a5, a6);
  if (!v6)
  {
    if ((v13 & 1) != 0)
    {
      v10 = sub_1BA180B94();
      swift_retain();
      sub_1BA1710B0(a1, a5);
      v15 = sub_1BA18F93C((uint64_t)v10, a2, a4, a5, a6);
      swift_release();
      if ((v15 & 1) != 0)
      {
        sub_1BA1787C0();
        swift_allocError();
        *(_QWORD *)(v16 + 8) = 0;
        *(_QWORD *)(v16 + 16) = 0;
        *(_QWORD *)v16 = 1;
        *(_BYTE *)(v16 + 24) = 7;
        swift_willThrow();
        swift_release();
      }
    }
    else
    {
      swift_retain();
    }
  }
  return v10;
}

uint64_t sub_1BA18F93C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  BOOL v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v24;
  uint64_t v25;
  void *v27;
  __int128 v28;
  char v29;
  uint64_t v30;

  v6 = v5;
  v11 = *(_QWORD *)(*(_QWORD *)a1 + 80);
  v12 = type metadata accessor for Node(0, v11, *(_QWORD *)(*(_QWORD *)a1 + 88), a4);
  swift_bridgeObjectRetain();
  v13 = sub_1BA19AC60();
  v30 = v13;
  if (v13 == MEMORY[0x1BCCD5FA0](a2, v12))
  {
    swift_bridgeObjectRelease();
    v14 = 0;
    return v14 & 1;
  }
  v24 = a4;
  v25 = a3;
  v14 = 0;
  while (1)
  {
    v15 = v11;
    v16 = sub_1BA19ACA8();
    sub_1BA19AC78();
    if ((v16 & 1) != 0)
    {
      v17 = *(_QWORD *)(a2 + 32 + 8 * v13);
      swift_retain();
    }
    else
    {
      v17 = sub_1BA19AEAC();
    }
    swift_bridgeObjectRetain();
    MEMORY[0x1BCCD5FAC](&v30, a2, v12);
    swift_bridgeObjectRelease();
    v18 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v17 + 128))(a1, v25, v24, a5);
    if (!v6)
    {
      v21 = v18;
      swift_release();
      v22 = sub_1BA16CFF4(v21);
      v11 = v15;
      swift_release();
      v14 |= v22;
      goto LABEL_18;
    }
    v19 = v6;
    sub_1BA18FBC4();
    if (!swift_dynamicCast())
      goto LABEL_22;
    if (!v29)
    {
      sub_1BA175C94(v27, (id)v28, *((uint64_t *)&v28 + 1), 0);
      swift_release();

      v6 = 0;
      v14 = 1;
      v11 = v15;
      goto LABEL_18;
    }
    v20 = v29 == 7 && v27 == (void *)1;
    if (!v20 || v28 != 0)
      break;
    v11 = v15;
    swift_release();

    v6 = 0;
    v14 = 1;
LABEL_18:
    v13 = v30;
    if (v13 == MEMORY[0x1BCCD5FA0](a2, v12))
    {
      swift_bridgeObjectRelease();
      return v14 & 1;
    }
  }
  sub_1BA175C94(v27, (id)v28, *((uint64_t *)&v28 + 1), v29);
LABEL_22:
  swift_bridgeObjectRelease();

  swift_willThrow();
  swift_release();
  return v14 & 1;
}

unint64_t sub_1BA18FBC4()
{
  unint64_t result;

  result = qword_1ED5C8770;
  if (!qword_1ED5C8770)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED5C8770);
  }
  return result;
}

ValueMetadata *type metadata accessor for ClipToBoundsSizer()
{
  return &type metadata for ClipToBoundsSizer;
}

_QWORD *sub_1BA18FC28@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v10 = *a1;
  v11 = v4[3];
  v12 = v4[4];
  __swift_project_boxed_opaque_existential_1(v4, v11);
  result = (*(_QWORD *(**)(uint64_t *__return_ptr, uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v12 + 16))(&v16, a1, a2, a3, *(_QWORD *)(v10 + 80), *(_QWORD *)(v10 + 88), v11, v12);
  if (!v5)
  {
    v14 = v16;
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v14;
    *(_QWORD *)(v15 + 24) = sub_1BA18FE4C;
    *(_QWORD *)(v15 + 32) = a1;
    *a4 = v15 | 0x6000000000000000;
    return (_QWORD *)swift_retain();
  }
  return result;
}

void sub_1BA18FCF8(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGRect v13;
  CGRect v14;

  v14.origin.x = Cursor.absoluteFrame.getter();
  v14.origin.y = v10;
  v14.size.width = v11;
  v14.size.height = v12;
  v13.origin.x = a2;
  v13.origin.y = a3;
  v13.size.width = a4;
  v13.size.height = a5;
  *(CGRect *)a1 = CGRectIntersection(v13, v14);
  *(_BYTE *)(a1 + 32) = 1;
}

_QWORD *sub_1BA18FD70@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BA18FC28(a1, a2, a3, a4);
}

uint64_t sub_1BA18FD84()
{
  sub_1BA19AEA0();
  sub_1BA17C214();
  sub_1BA19AF3C();
  sub_1BA19ABD0();
  return 0;
}

uint64_t sub_1BA18FE1C()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_1BA18FE4C(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  sub_1BA18FCF8(a1, a2, a3, a4, a5);
}

uint64_t sub_1BA18FE54@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  _QWORD *v4;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26[2];
  unint64_t v27;
  unint64_t v28;

  v7 = *a1;
  v8 = __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  LOBYTE(v26[0]) = 0;
  OUTLINED_FUNCTION_3_29((uint64_t)v8, v9, v10, v11, v12, v13);
  OUTLINED_FUNCTION_2_29();
  v14 = *(_QWORD *)(v7 + 80);
  v15 = *(_QWORD *)(v7 + 88);
  swift_retain();
  OUTLINED_FUNCTION_5_22((uint64_t)v26, a2, a3, v14, v15);
  result = OUTLINED_FUNCTION_4_21();
  if (!a3)
  {
    v25 = v28;
    v17 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v24 + 40), *(_QWORD *)(v24 + 64));
    LOBYTE(v26[0]) = 1;
    OUTLINED_FUNCTION_3_29((uint64_t)v17, v18, v19, v20, v21, v22);
    OUTLINED_FUNCTION_2_29();
    swift_retain();
    OUTLINED_FUNCTION_5_22((uint64_t)v26, a2, 0, v14, v15);
    OUTLINED_FUNCTION_4_21();
    v27 = v25;
    v26[0] = v28;
    sub_1BA16FE94(&v27, v26, a4);
    swift_release();
    return swift_release();
  }
  return result;
}

void sub_1BA18FFAC(void (*a1)(_QWORD *__return_ptr, _QWORD *)@<X1>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  CGFloat MinY;
  uint64_t v13;
  uint64_t v14;
  CGFloat MinX;
  CGFloat Width;
  char v17;
  CGFloat v18;
  CGFloat v19;
  _QWORD v20[2];
  _QWORD v21[2];
  char v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  MinY = CGRectGetMinY(*(CGRect *)&a3);
  v23.origin.x = a3;
  v23.origin.y = a4;
  v23.size.width = a5;
  v23.size.height = a6;
  *(CGFloat *)v20 = MinY;
  v20[1] = CGRectGetHeight(v23);
  a1(v21, v20);
  v14 = v21[0];
  v13 = v21[1];
  if (v22)
  {
    if (v22 == 1)
    {
      v24.origin.x = a3;
      v24.origin.y = a4;
      v24.size.width = a5;
      v24.size.height = a6;
      MinX = CGRectGetMinX(v24);
      v25.origin.x = a3;
      v25.origin.y = a4;
      v25.size.width = a5;
      v25.size.height = a6;
      Width = CGRectGetWidth(v25);
      *(CGFloat *)a2 = MinX;
      *(_QWORD *)(a2 + 8) = v14;
      *(CGFloat *)(a2 + 16) = Width;
      *(_QWORD *)(a2 + 24) = v13;
      v17 = 1;
    }
    else
    {
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      v17 = 2;
    }
    *(_BYTE *)(a2 + 32) = v17;
  }
  else
  {
    v26.origin.x = a3;
    v26.origin.y = a4;
    v26.size.width = a5;
    v26.size.height = a6;
    v18 = CGRectGetMinX(v26);
    v27.origin.x = a3;
    v27.origin.y = a4;
    v27.size.width = a5;
    v27.size.height = a6;
    v19 = CGRectGetWidth(v27);
    *(CGFloat *)a2 = v18;
    *(_QWORD *)(a2 + 8) = v14;
    *(CGFloat *)(a2 + 16) = v19;
    *(_QWORD *)(a2 + 24) = v13;
    *(_BYTE *)(a2 + 32) = 0;
  }
}

double sub_1BA1900E0(void (*a1)(double *__return_ptr, _QWORD *), CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v5;
  double MinX;
  _QWORD v13[2];
  double v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  MinX = CGRectGetMinX(*(CGRect *)&a2);
  v15.origin.x = a2;
  v15.origin.y = a3;
  v15.size.width = a4;
  v15.size.height = a5;
  *(double *)v13 = MinX;
  v13[1] = CGRectGetWidth(v15);
  a1(&v14, v13);
  if (!v5)
  {
    MinX = v14;
    v16.origin.x = a2;
    v16.origin.y = a3;
    v16.size.width = a4;
    v16.size.height = a5;
    CGRectGetMinY(v16);
    v17.origin.x = a2;
    v17.origin.y = a3;
    v17.size.width = a4;
    v17.size.height = a5;
    CGRectGetHeight(v17);
  }
  return MinX;
}

double sub_1BA1901C4(void (*a1)(uint64_t *__return_ptr, _QWORD *), CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double MinX;
  CGFloat MinY;
  _QWORD v13[2];
  uint64_t v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  MinX = CGRectGetMinX(*(CGRect *)&a2);
  v15.origin.x = a2;
  v15.origin.y = a3;
  v15.size.width = a4;
  v15.size.height = a5;
  CGRectGetWidth(v15);
  v16.origin.x = a2;
  v16.origin.y = a3;
  v16.size.width = a4;
  v16.size.height = a5;
  MinY = CGRectGetMinY(v16);
  v17.origin.x = a2;
  v17.origin.y = a3;
  v17.size.width = a4;
  v17.size.height = a5;
  *(CGFloat *)v13 = MinY;
  v13[1] = CGRectGetHeight(v17);
  a1(&v14, v13);
  return MinX;
}

uint64_t sub_1BA19029C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BA18FE54(a1, a2, a3, a4);
}

uint64_t sub_1BA1902B0()
{
  sub_1BA19AEA0();
  sub_1BA19ABD0();
  sub_1BA178140();
  OUTLINED_FUNCTION_1_34();
  sub_1BA19ABD0();
  OUTLINED_FUNCTION_1_34();
  sub_1BA19ABD0();
  return 0;
}

uint64_t destroy for DimensionWiseSizer(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 40);
}

uint64_t initializeWithCopy for DimensionWiseSizer(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  return a1;
}

uint64_t *assignWithCopy for DimensionWiseSizer(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  __swift_assign_boxed_opaque_existential_1(a1 + 5, a2 + 5);
  return a1;
}

void *__swift_memcpy80_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x50uLL);
}

uint64_t assignWithTake for DimensionWiseSizer(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for DimensionWiseSizer(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 80))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for DimensionWiseSizer(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DimensionWiseSizer()
{
  return &type metadata for DimensionWiseSizer;
}

uint64_t sub_1BA190548()
{
  OUTLINED_FUNCTION_1_32();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BA190578()
{
  OUTLINED_FUNCTION_1_32();
  return swift_deallocObject();
}

double sub_1BA19059C(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  uint64_t v4;

  return sub_1BA1901C4(*(void (**)(uint64_t *__return_ptr, _QWORD *))(v4 + 16), a1, a2, a3, a4);
}

uint64_t sub_1BA1905B4()
{
  swift_release();
  return swift_deallocObject();
}

double sub_1BA1905D8(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  uint64_t v4;

  return sub_1BA1900E0(*(void (**)(double *__return_ptr, _QWORD *))(v4 + 16), a1, a2, a3, a4);
}

uint64_t objectdestroy_6Tm()
{
  OUTLINED_FUNCTION_1_32();
  swift_release();
  return swift_deallocObject();
}

void sub_1BA19061C(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  uint64_t v5;

  sub_1BA18FFAC(*(void (**)(_QWORD *__return_ptr, _QWORD *))(v5 + 16), a1, a2, a3, a4, a5);
}

uint64_t sub_1BA190624()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_1BA190648()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return swift_deallocObject();
}

uint64_t sub_1BA190674(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for DimensionWiseSizer(a2, a1);
  return a2;
}

uint64_t sub_1BA1906A8()
{
  return swift_deallocObject();
}

ValueMetadata *type metadata accessor for NotCondition()
{
  return &type metadata for NotCondition;
}

BOOL sub_1BA1906D4(uint64_t *a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *a1;
  v6 = v2[3];
  v7 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v6);
  return ((*(uint64_t (**)(uint64_t *, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v7 + 8))(a1, a2, *(_QWORD *)(v5 + 80), *(_QWORD *)(v5 + 88), v6, v7) & 1) == 0;
}

uint64_t sub_1BA190744()
{
  uint64_t v0;

  sub_1BA19149C();
  sub_1BA1914F8();
  swift_bridgeObjectRetain();
  v0 = sub_1BA19ABF4();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BA1907E8()
{
  swift_bridgeObjectRetain();
  return sub_1BA19B164();
}

uint64_t sub_1BA190848()
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
  char v13;
  char v14;
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
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;

  v2 = *(_QWORD *)(v0 + 16);
  if ((*(_BYTE *)(v0 + 24) & 1) == 0)
  {
    v15 = OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_7_15(v15, v16);
    swift_bridgeObjectRelease();
    sub_1BA1913B0((uint64_t)&v39, (uint64_t)&v37);
    if (v38)
    {
      sub_1BA16E868(0, &qword_1ED5C9120);
      if ((swift_dynamicCast() & 1) != 0)
      {
        if (*((_QWORD *)&v27 + 1))
        {
          v17 = sub_1BA16DE20(&v26, (uint64_t)&v33);
          OUTLINED_FUNCTION_5_23(v17, v18, v19, v20, v21, v22, v23, v24, v26, *((uint64_t *)&v26 + 1), v27, *((uint64_t *)&v27 + 1), v28, v29, v30, v31, v32, v33, v34,
            v35,
            v36);
          (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v1 + 8))(&v26, v2, v1);
          sub_1BA170698((uint64_t)&v39);
          v14 = *((_QWORD *)&v27 + 1) != 0;
          sub_1BA170698((uint64_t)&v26);
          goto LABEL_9;
        }
      }
      else
      {
        v28 = 0;
        v26 = 0u;
        v27 = 0u;
      }
    }
    else
    {
      sub_1BA170698((uint64_t)&v37);
      v26 = 0u;
      v27 = 0u;
      v28 = 0;
    }
    sub_1BA170698((uint64_t)&v39);
    sub_1BA1913F4((uint64_t)&v26, &qword_1EF2747A8, &qword_1ED5C9120);
LABEL_14:
    v14 = 0;
    return v14 & 1;
  }
  v3 = OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_7_15(v3, v4);
  swift_bridgeObjectRelease();
  if (!v40)
    goto LABEL_14;
  sub_1BA16E7BC(&v39, &v37);
  sub_1BA16E780((uint64_t)&v37, (uint64_t)&v29);
  sub_1BA16E868(0, &qword_1EF2747B0);
  if (!swift_dynamicCast())
  {
    v28 = 0;
    v26 = 0u;
    v27 = 0u;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v37);
    sub_1BA1913F4((uint64_t)&v26, &qword_1EF2747B8, &qword_1EF2747B0);
    v14 = 1;
    return v14 & 1;
  }
  v5 = sub_1BA16DE20(&v26, (uint64_t)&v33);
  OUTLINED_FUNCTION_5_23(v5, v6, v7, v8, v9, v10, v11, v12, v26, *((uint64_t *)&v26 + 1), v27, *((uint64_t *)&v27 + 1), v28, v29, v30, v31, v32, v33, v34,
    v35,
    v36);
  v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v1);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v37);
  v14 = v13 ^ 1;
LABEL_9:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v33);
  return v14 & 1;
}

BOOL sub_1BA190A6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[4];
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD v17[2];

  v1 = *(_QWORD *)(v0 + 16);
  if ((*(_BYTE *)(v0 + 24) & 1) == 0)
  {
    v5 = OUTLINED_FUNCTION_3_1();
    sub_1BA16E818(v5, v6, v1, v17);
    swift_bridgeObjectRelease();
    sub_1BA1913B0((uint64_t)v17, (uint64_t)v10);
    if (v10[3])
    {
      sub_1BA16E868(0, &qword_1ED5C9120);
      if ((swift_dynamicCast() & 1) != 0)
      {
        if (*((_QWORD *)&v12 + 1))
        {
          sub_1BA16DE20(&v11, (uint64_t)&v14);
          v7 = v15;
          v8 = v16;
          __swift_project_boxed_opaque_existential_1(&v14, v15);
          (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v8 + 8))(&v11, v7, v8);
          sub_1BA170698((uint64_t)v17);
          v4 = *((_QWORD *)&v12 + 1) == 0;
          sub_1BA170698((uint64_t)&v11);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
          return v4;
        }
      }
      else
      {
        v13 = 0;
        v11 = 0u;
        v12 = 0u;
      }
    }
    else
    {
      sub_1BA170698((uint64_t)v10);
      v11 = 0u;
      v12 = 0u;
      v13 = 0;
    }
    sub_1BA170698((uint64_t)v17);
    sub_1BA1913F4((uint64_t)&v11, &qword_1EF2747A8, &qword_1ED5C9120);
    return 0;
  }
  v2 = OUTLINED_FUNCTION_3_1();
  sub_1BA16E818(v2, v3, v1, &v14);
  swift_bridgeObjectRelease();
  v4 = v15 == 0;
  sub_1BA170698((uint64_t)&v14);
  return v4;
}

void sub_1BA190C04()
{
  char v0;

  OUTLINED_FUNCTION_6_16(MEMORY[0x1E0DEAFA0], (uint64_t)&v0);
  OUTLINED_FUNCTION_1_35();
}

uint64_t sub_1BA190C3C()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = OUTLINED_FUNCTION_6_16(MEMORY[0x1E0DEA968], (uint64_t)&v2);
  if (!v0)
    return v2;
  return result;
}

double sub_1BA190C74()
{
  uint64_t v0;
  double result;
  double v2;

  OUTLINED_FUNCTION_6_16(MEMORY[0x1E0DEB070], (uint64_t)&v2);
  if (!v0)
    return v2;
  return result;
}

float sub_1BA190CAC()
{
  uint64_t v0;
  float result;
  float v2;

  OUTLINED_FUNCTION_6_16(MEMORY[0x1E0DEB188], (uint64_t)&v2);
  if (!v0)
    return v2;
  return result;
}

void sub_1BA190CE4()
{
  uint64_t v0;
  char v1;

  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_8_14(v0, (uint64_t)&v1);
  OUTLINED_FUNCTION_1_35();
}

void sub_1BA190D10()
{
  uint64_t v0;
  __int16 v1;

  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_8_14(v0, (uint64_t)&v1);
  OUTLINED_FUNCTION_1_35();
}

void sub_1BA190D3C()
{
  uint64_t v0;
  int v1;

  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_8_14(v0, (uint64_t)&v1);
  OUTLINED_FUNCTION_1_35();
}

uint64_t sub_1BA190D68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  OUTLINED_FUNCTION_10_10();
  result = OUTLINED_FUNCTION_8_14(v1, (uint64_t)&v3);
  if (!v0)
    return v3;
  return result;
}

void sub_1BA190D98()
{
  uint64_t v0;
  uint64_t v1;

  sub_1BA18AEB0();
  v0 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_34(v0, v1);
  OUTLINED_FUNCTION_9_14();
}

uint64_t sub_1BA190DC8()
{
  return sub_1BA190744();
}

uint64_t sub_1BA190DE8()
{
  return sub_1BA190848() & 1;
}

BOOL sub_1BA190E0C()
{
  return sub_1BA190A6C();
}

uint64_t sub_1BA190E30()
{
  char v0;

  sub_1BA190C04();
  return v0 & 1;
}

uint64_t sub_1BA190E54()
{
  return sub_1BA190C3C();
}

double sub_1BA190E74()
{
  return sub_1BA190C74();
}

float sub_1BA190E94()
{
  return sub_1BA190CAC();
}

uint64_t sub_1BA190EB4()
{
  return sub_1BA190D68();
}

void sub_1BA190EDC()
{
  sub_1BA190CE4();
}

void sub_1BA190F04()
{
  sub_1BA190D10();
}

void sub_1BA190F2C()
{
  sub_1BA190D3C();
}

uint64_t sub_1BA190F54()
{
  return sub_1BA190D68();
}

uint64_t sub_1BA190F7C()
{
  return sub_1BA19B098();
}

uint64_t sub_1BA190F90()
{
  return sub_1BA190D68();
}

void sub_1BA190FB8()
{
  sub_1BA190CE4();
}

void sub_1BA190FE0()
{
  sub_1BA190D10();
}

void sub_1BA191008()
{
  sub_1BA190D3C();
}

uint64_t sub_1BA191030()
{
  return sub_1BA190D68();
}

uint64_t sub_1BA191058()
{
  return sub_1BA19B0A4();
}

uint64_t sub_1BA19106C()
{
  return sub_1BA19B044();
}

uint64_t sub_1BA191080()
{
  return sub_1BA19B038();
}

uint64_t sub_1BA191094()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_1BA19B050();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_1BA1910B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BA19123C(a1, a2, a3, MEMORY[0x1E0DED7E8]);
}

uint64_t sub_1BA1910D0()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_1BA19B05C();
  if (v0)
    return v2;
  return result;
}

void sub_1BA1910F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BA1911BC(a1, a2, a3, MEMORY[0x1E0DED808]);
}

void sub_1BA19110C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BA1911FC(a1, a2, a3, MEMORY[0x1E0DED810]);
}

uint64_t sub_1BA191128(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BA19123C(a1, a2, a3, MEMORY[0x1E0DED818]);
}

uint64_t sub_1BA191144()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_1BA19B080();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_1BA191164(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BA1912A8(a1, a2, a3, MEMORY[0x1E0DED830]);
}

uint64_t sub_1BA191180()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_1BA19B068();
  if (v0)
    return v2;
  return result;
}

void sub_1BA1911A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BA1911BC(a1, a2, a3, MEMORY[0x1E0DED828]);
}

void sub_1BA1911BC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  OUTLINED_FUNCTION_1_35();
}

void sub_1BA1911E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1BA1911FC(a1, a2, a3, MEMORY[0x1E0DED838]);
}

void sub_1BA1911FC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  OUTLINED_FUNCTION_1_35();
}

uint64_t sub_1BA191220(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BA19123C(a1, a2, a3, MEMORY[0x1E0DED840]);
}

uint64_t sub_1BA19123C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v4;

  v4 = a4();
  return v4 | ((HIDWORD(v4) & 1) << 32);
}

uint64_t sub_1BA19126C()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_1BA19B08C();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_1BA19128C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BA1912A8(a1, a2, a3, MEMORY[0x1E0DED850]);
}

uint64_t sub_1BA1912A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  result = a4();
  if (v4)
    return v6;
  return result;
}

uint64_t sub_1BA1912CC()
{
  return sub_1BA19B074();
}

void sub_1BA1912F4()
{
  sub_1BA190D98();
}

BOOL sub_1BA191308(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int EnumTagSinglePayload;
  uint64_t v8;

  v3 = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1, v1);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v3 + 16))(v5);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v5, 1, *(_QWORD *)(a1 + 16));
  if (EnumTagSinglePayload != 1)
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, a1);
  return EnumTagSinglePayload == 1;
}

uint64_t sub_1BA1913A8(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 88);
}

uint64_t sub_1BA1913B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BA16E7CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BA1913F4(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  uint64_t v4;

  sub_1BA191430(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_1BA191430(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    sub_1BA16E868(255, a3);
    v4 = sub_1BA19ADEC();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_1BA191484()
{
  return sub_1BA1907E8();
}

void sub_1BA19149C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF2747C0)
  {
    v0 = sub_1BA19AB40();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF2747C0);
  }
}

unint64_t sub_1BA1914F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF2747C8;
  if (!qword_1EF2747C8)
  {
    sub_1BA19149C();
    result = MEMORY[0x1BCCD6858](MEMORY[0x1E0DE9ED0], v1);
    atomic_store(result, (unint64_t *)&qword_1EF2747C8);
  }
  return result;
}

TeaTemplate::CursorFrameKind_optional __swiftcall CursorFrameKind.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  TeaTemplate::CursorFrameKind_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1BA19AFC0();
  result.value = swift_bridgeObjectRelease();
  v5 = 4;
  if (v3 < 4)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t CursorFrameKind.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1BA1915BC + 4 * byte_1BA19EC90[*v0]))(0x656D617266, 0xE500000000000000);
}

uint64_t sub_1BA1915BC()
{
  return 0x6563617073;
}

uint64_t sub_1BA1915CC()
{
  return 7892834;
}

uint64_t sub_1BA1915DC()
{
  return 0x6465626D65;
}

void sub_1BA1915EC(char *a1)
{
  sub_1BA17AD88(*a1);
}

unint64_t sub_1BA1915FC()
{
  unint64_t result;

  result = qword_1EF2747D0;
  if (!qword_1EF2747D0)
  {
    result = MEMORY[0x1BCCD6858](&protocol conformance descriptor for CursorFrameKind, &type metadata for CursorFrameKind);
    atomic_store(result, (unint64_t *)&qword_1EF2747D0);
  }
  return result;
}

void sub_1BA191638()
{
  sub_1BA197A30();
}

void sub_1BA191640()
{
  sub_1BA197BF4();
}

void sub_1BA191648()
{
  sub_1BA197C58();
}

TeaTemplate::CursorFrameKind_optional sub_1BA191650(Swift::String *a1)
{
  return CursorFrameKind.init(rawValue:)(*a1);
}

uint64_t sub_1BA19165C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CursorFrameKind.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for CursorFrameKind(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CursorFrameKind(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BA191754 + 4 * byte_1BA19EC99[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1BA191788 + 4 * byte_1BA19EC94[v4]))();
}

uint64_t sub_1BA191788(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA191790(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA191798);
  return result;
}

uint64_t sub_1BA1917A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA1917ACLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1BA1917B0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA1917B8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CursorFrameKind()
{
  return &type metadata for CursorFrameKind;
}

__n128 ColumnDebugView.columnSystem.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  char v4;
  __n128 result;
  __int128 v6;

  v3 = v1 + OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_columnSystem;
  OUTLINED_FUNCTION_0_14();
  v4 = *(_BYTE *)(v3 + 32);
  result = *(__n128 *)v3;
  v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v3;
  *(_OWORD *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 32) = v4;
  return result;
}

__n128 sub_1BA191824@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char v4;
  __n128 result;
  __int128 v6;

  v3 = *a1 + OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_columnSystem;
  swift_beginAccess();
  v4 = *(_BYTE *)(v3 + 32);
  result = *(__n128 *)v3;
  v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a2 = *(_OWORD *)v3;
  *(_OWORD *)(a2 + 16) = v6;
  *(_BYTE *)(a2 + 32) = v4;
  return result;
}

id sub_1BA19187C(uint64_t a1)
{
  char v1;
  __int128 v2;
  __int128 v4[2];
  char v5;

  v1 = *(_BYTE *)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 16);
  v4[0] = *(_OWORD *)a1;
  v4[1] = v2;
  v5 = v1;
  return ColumnDebugView.columnSystem.setter(v4);
}

id ColumnDebugView.columnSystem.setter(__int128 *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char *v5;
  __int128 v7;

  v7 = *a1;
  v2 = *((_QWORD *)a1 + 2);
  v3 = *((_QWORD *)a1 + 3);
  v4 = *((_BYTE *)a1 + 32);
  v5 = &v1[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_columnSystem];
  OUTLINED_FUNCTION_0_14();
  *(_OWORD *)v5 = v7;
  *((_QWORD *)v5 + 2) = v2;
  *((_QWORD *)v5 + 3) = v3;
  v5[32] = v4;
  objc_msgSend(v1, sel_setNeedsLayout);
  return objc_msgSend(v1, sel_layoutIfNeeded);
}

void ColumnDebugView.columnSystem.modify(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_0_0();
}

void sub_1BA191984(uint64_t a1, char a2)
{
  void *v4;

  swift_endAccess();
  if ((a2 & 1) != 0)
  {
    OUTLINED_FUNCTION_0_0();
  }
  else
  {
    v4 = *(void **)(a1 + 24);
    objc_msgSend(v4, sel_setNeedsLayout);
    objc_msgSend(v4, sel_layoutIfNeeded);
  }
}

void ColumnDebugView.showMargins.getter()
{
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_7_16();
}

uint64_t sub_1BA191A0C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_showMargins);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t ColumnDebugView.showMargins.setter(char a1)
{
  return sub_1BA191BEC(a1, &OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_showMargins, (uint64_t (*)(uint64_t))sub_1BA191A70);
}

id sub_1BA191A70()
{
  uint64_t v0;
  void *v1;
  _BYTE *v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_leftMarginView);
  v2 = (_BYTE *)(v0 + OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_showMargins);
  swift_beginAccess();
  objc_msgSend(v1, sel_setHidden_, (*v2 & 1) == 0);
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_rightMarginView), sel_setHidden_, (*v2 & 1) == 0);
}

void ColumnDebugView.showMargins.modify(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1BA191B44(uint64_t a1, char a2)
{
  return sub_1BA191DB4(a1, a2, (uint64_t (*)(uint64_t))sub_1BA191A70);
}

void ColumnDebugView.showColumns.getter()
{
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_7_16();
}

uint64_t sub_1BA191B88@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_showColumns);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t ColumnDebugView.showColumns.setter(char a1)
{
  return sub_1BA191BEC(a1, &OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_showColumns, (uint64_t (*)(uint64_t))sub_1BA191C3C);
}

uint64_t sub_1BA191BEC(char a1, _QWORD *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v3;
  _BYTE *v6;
  uint64_t v7;

  v6 = (_BYTE *)(v3 + *a2);
  v7 = OUTLINED_FUNCTION_0_14();
  *v6 = a1;
  return a3(v7);
}

uint64_t sub_1BA191C3C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  _BYTE *v4;
  uint64_t i;
  id v6;
  void *v7;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_columnViews);
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  result = sub_1BA19AF90();
  v2 = result;
  if (!result)
    return swift_bridgeObjectRelease();
LABEL_3:
  if (v2 >= 1)
  {
    v4 = (_BYTE *)(v0 + OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_showColumns);
    swift_beginAccess();
    for (i = 0; i != v2; ++i)
    {
      if ((v1 & 0xC000000000000001) != 0)
        v6 = (id)MEMORY[0x1BCCD618C](i, v1);
      else
        v6 = *(id *)(v1 + 8 * i + 32);
      v7 = v6;
      objc_msgSend(v6, sel_setHidden_, (*v4 & 1) == 0);

    }
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

void ColumnDebugView.showColumns.modify(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1BA191DA8(uint64_t a1, char a2)
{
  return sub_1BA191DB4(a1, a2, (uint64_t (*)(uint64_t))sub_1BA191C3C);
}

uint64_t sub_1BA191DB4(uint64_t a1, char a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result;

  result = swift_endAccess();
  if ((a2 & 1) == 0)
    return a3(result);
  return result;
}

uint64_t ColumnDebugView.__allocating_init(columnSystem:)()
{
  uint64_t v0;

  OUTLINED_FUNCTION_13_6();
  return ColumnDebugView.init(columnSystem:)(v0);
}

id ColumnDebugView.__allocating_init(coder:)()
{
  void *v0;
  id v1;

  v1 = objc_msgSend(OUTLINED_FUNCTION_13_6(), sel_initWithCoder_, v0);

  return v1;
}

void ColumnDebugView.init(coder:)()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;

  v0[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_showMargins] = 0;
  v0[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_showColumns] = 1;
  v1 = OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_leftMarginView;
  *(_QWORD *)&v0[v1] = OUTLINED_FUNCTION_0_35(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_initWithFrame_);
  v2 = OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_rightMarginView;
  *(_QWORD *)&v0[v2] = OUTLINED_FUNCTION_0_35(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_initWithFrame_);

  sub_1BA19AF84();
  __break(1u);
}

Swift::Void __swiftcall ColumnDebugView.layoutSubviews()()
{
  char *v0;
  char *v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  char *v39;
  char v40;
  __int128 v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  double v52;
  id v53;
  SEL v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  uint64_t v59;
  double v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  CGFloat v65;
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
  _QWORD __dst[25];
  _OWORD v77[2];
  char v78;
  uint64_t v79[3];
  uint64_t v80[14];
  _QWORD __src[25];
  objc_super v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;

  v1 = v0;
  v82.receiver = v0;
  v82.super_class = (Class)OUTLINED_FUNCTION_10_11();
  v2 = objc_msgSendSuper2(&v82, sel_layoutSubviews);
  v3 = OUTLINED_FUNCTION_9_3((uint64_t)v2, sel_window);
  if (!v3)
    return;
  v4 = v3;
  OUTLINED_FUNCTION_1_36();
  v74 = v6;
  v75 = v5;
  OUTLINED_FUNCTION_1_36();
  v72 = v8;
  v73 = v7;
  OUTLINED_FUNCTION_1_36();
  v70 = v10;
  v71 = v9;
  objc_msgSend(v4, sel_bounds);
  v68 = v12;
  v69 = v11;
  v13 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v13, sel_nativeBounds);
  v66 = v15;
  v67 = v14;

  v17 = OUTLINED_FUNCTION_4_0(v16, sel_traitCollection);
  objc_msgSend(v1, sel_layoutMargins);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = (void *)objc_opt_self();
  v27 = objc_msgSend(v26, sel_userInterfaceLayoutDirectionForSemanticContentAttribute_, OUTLINED_FUNCTION_4_0((uint64_t)v26, sel_semanticContentAttribute));
  v28 = OUTLINED_FUNCTION_4_0((uint64_t)v27, sel_traitCollection);
  v29 = objc_msgSend(v28, sel_preferredContentSizeCategory);

  objc_msgSend(v1, sel_safeAreaInsets);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  __dst[0] = 0xF000000000000007;
  v80[0] = 0xF000000000000007;
  *(_QWORD *)&v77[0] = 0xF000000000000007;
  v79[0] = 0xF000000000000007;
  type metadata accessor for LayoutMarginAdjuster();
  swift_allocObject();
  v38 = LayoutMarginAdjuster.init(top:left:bottom:right:)(__dst, v80, (uint64_t *)v77, v79);
  __src[0] = v75;
  __src[1] = v74;
  __src[2] = v73;
  __src[3] = v72;
  __src[4] = v71;
  __src[5] = v70;
  __src[6] = v69;
  __src[7] = v68;
  __src[8] = v67;
  __src[9] = v66;
  __src[10] = v17;
  __src[11] = v19;
  __src[12] = v21;
  __src[13] = v23;
  __src[14] = v25;
  __src[16] = 0;
  __src[15] = 0;
  __src[17] = v27;
  __src[18] = v29;
  __src[19] = v31;
  __src[20] = v33;
  __src[21] = v35;
  __src[22] = v37;
  LOBYTE(__src[23]) = 3;
  v39 = &v1[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_columnSystem];
  __src[24] = v38;
  OUTLINED_FUNCTION_0_14();
  v40 = v39[32];
  v41 = *((_OWORD *)v39 + 1);
  v77[0] = *(_OWORD *)v39;
  v77[1] = v41;
  v78 = v40;
  memcpy(__dst, __src, sizeof(__dst));
  ColumnSystem.options(layoutOptions:)(__dst, (uint64_t)v80);
  v42 = LOBYTE(v80[0]);
  v43 = *(double *)&v80[2];
  v44 = *(double *)&v80[8];
  v45 = *(double *)&v80[11];
  v46 = *(double *)&v80[13];
  v47 = *(_QWORD *)&v1[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_columnViews];
  if (v47 >> 62)
  {
    swift_bridgeObjectRetain();
    v48 = sub_1BA19AF90();
  }
  else
  {
    v48 = *(_QWORD *)((v47 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  if (v48)
  {
    if (v48 < 1)
    {
LABEL_22:
      __break(1u);
      return;
    }
    v49 = 0;
    do
    {
      if ((v47 & 0xC000000000000001) != 0)
        v50 = (id)MEMORY[0x1BCCD618C](v49, v47);
      else
        v50 = OUTLINED_FUNCTION_9_15(v47 + 8 * v49);
      v51 = v50;
      ++v49;
      v52 = OUTLINED_FUNCTION_3_30();
      objc_msgSend(v53, v54, v52);

    }
    while (v48 != v49);
  }
  swift_bridgeObjectRelease();
  v55 = v47 & 0xC000000000000001;
  if ((v47 & 0xC000000000000001) == 0 && !*(_QWORD *)((v47 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_22;
  }
  v56 = 6 * v42;
  v57 = 6 * v42 + 6;
  v58 = (v44 - v45 - v46 - v43 * ((double)v57 + -1.0)) / (double)v57;
  sub_1BA192524(v56 + 5, v55 == 0, v47);
  v59 = 0;
  v60 = v45;
  do
  {
    if (v55)
      v61 = (id)MEMORY[0x1BCCD618C](v59, v47);
    else
      v61 = OUTLINED_FUNCTION_9_15(v47 + 8 * v59);
    v62 = v61;
    ++v59;
    OUTLINED_FUNCTION_1_36();
    objc_msgSend(v62, sel_setFrame_, v60, 0.0, v58);

    v60 = v43 + v58 + v60;
  }
  while (v57 != v59);
  v63 = *(void **)&v1[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_leftMarginView];
  OUTLINED_FUNCTION_1_36();
  objc_msgSend(v63, sel_setFrame_, 0.0, 0.0, v45, CGRectGetHeight(v83));
  v64 = *(void **)&v1[OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_rightMarginView];
  OUTLINED_FUNCTION_1_36();
  v65 = CGRectGetWidth(v84) - v46;
  OUTLINED_FUNCTION_1_36();
  objc_msgSend(v64, sel_setFrame_, v65, 0.0, v46, CGRectGetHeight(v85));

  sub_1BA17AB1C((uint64_t)__src);
}

id ColumnDebugView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void ColumnDebugView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ColumnDebugView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_10_11();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1BA192524(unint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

void sub_1BA192554(char *a1)
{
  ColumnDebugView.showMargins.setter(*a1);
  OUTLINED_FUNCTION_0_0();
}

void sub_1BA192578(char *a1)
{
  ColumnDebugView.showColumns.setter(*a1);
  OUTLINED_FUNCTION_0_0();
}

uint64_t method lookup function for ColumnDebugView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ColumnDebugView.__allocating_init(columnSystem:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_1BA1925AC(uint64_t a1)
{
  _OWORD v2[2];
  char v3;
  char v4;
  _OWORD v5[2];
  char v6;

  sub_1BA193020(a1, (uint64_t)v2);
  if ((v4 & 1) == 0)
  {
    v5[0] = v2[0];
    v5[1] = v2[1];
    v6 = v3;
    sub_1BA19ABD0();
    sub_1BA192668((uint64_t)v5);
    sub_1BA19ABD0();
  }
  sub_1BA19ABD0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BA192668(uint64_t a1)
{
  __int128 v2;
  char v3;

  sub_1BA193584(a1, (uint64_t)&v2);
  if (v3 != 1)
  {
    sub_1BA19AEA0();
    sub_1BA19ABD0();
    type metadata accessor for UIEdgeInsets(0);
    sub_1BA19AF3C();
    OUTLINED_FUNCTION_20_2();
  }
  sub_1BA19ABD0();
  return swift_bridgeObjectRelease();
}

uint64_t Layout.__allocating_init(canvas:name:)(__int128 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  OUTLINED_FUNCTION_7_17();
  return Layout.init(canvas:name:)(a1, a2, a3, v6);
}

uint64_t DebugLayoutData.frames.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DebugLayoutData.records.getter()
{
  return swift_retain();
}

uint64_t Layout.init(canvas:name:)(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  __int128 v13;
  char v14;

  v13 = *a1;
  v7 = *((_QWORD *)a1 + 2);
  v8 = *((_QWORD *)a1 + 3);
  v9 = *((_BYTE *)a1 + 32);
  v10 = *((_BYTE *)a1 + 33);
  type metadata accessor for Node(0, *(_QWORD *)(*(_QWORD *)v4 + 136), *(_QWORD *)(*(_QWORD *)v4 + 152), a4);
  OUTLINED_FUNCTION_6_18();
  v11 = sub_1BA19AC9C();
  *(_OWORD *)(v4 + 40) = v13;
  *(_QWORD *)(v4 + 56) = v7;
  *(_QWORD *)(v4 + 64) = v8;
  *(_BYTE *)(v4 + 72) = v9;
  *(_BYTE *)(v4 + 73) = v10;
  *(_QWORD *)(v4 + 80) = v11;
  *(_QWORD *)(v4 + 88) = a2;
  *(_QWORD *)(v4 + 96) = a3;
  swift_bridgeObjectRetain();
  swift_release();
  v14 = 12;
  return Node.init(kind:identifier:)(&v14, a2, a3);
}

void Layout.__allocating_init(canvas:name:block:)(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_7_17();
  Layout.init(canvas:name:block:)(a1, a2, a3, a4);
}

void Layout.__allocating_init(tryCanvas:name:block:)(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_6();
  Layout.init(tryCanvas:name:block:)(a1, a2, a3, a4);
}

void sub_1BA192980(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];

  v2 = type metadata accessor for CursorFrameContainer();
  v3 = OUTLINED_FUNCTION_6();
  *(_QWORD *)(v3 + 16) = MEMORY[0x1E0DEE9D8];
  v4[3] = v2;
  v4[4] = &off_1E71E9ED8;
  v4[0] = v3;
  sub_1BA166240(a1, (uint64_t)v4);
}

uint64_t sub_1BA1929E4()
{
  uint64_t v1;

  return sub_1BA16AE90((uint64_t)&v1);
}

void sub_1BA192A08(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[9];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v22[8] = a6;
  v24 = a5;
  v22[6] = a4;
  v26 = a3;
  v25 = a2;
  v22[2] = a7;
  v23 = *(_QWORD *)(*(_QWORD *)v7 + 144);
  v22[0] = *(_QWORD *)(v23 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  OUTLINED_FUNCTION_11_3();
  v22[1] = v8;
  v11 = MEMORY[0x1E0C80A78](v9, v10);
  v22[3] = (char *)v22 - v12;
  v14 = *(_QWORD *)(v13 + 136);
  v28 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v11, v15);
  OUTLINED_FUNCTION_11_3();
  v22[5] = v16;
  MEMORY[0x1E0C80A78](v17, v18);
  v22[4] = v19;
  v20 = *(_QWORD *)(v19 + 152);
  (*(void (**)(uint64_t, uint64_t))(v20 + 16))(v14, v20);
  sub_1BA167C0C();
  v22[7] = v20;
  type metadata accessor for Node(0, v14, v20, v21);
  v27 = sub_1BA19AC60();
  OUTLINED_FUNCTION_3_22();
}

void Layout.__allocating_init(kind:identifier:)()
{
  swift_initStackObject();
  Layout.init(kind:identifier:)();
}

void Layout.init(kind:identifier:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1BA192F3C()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t Layout.description.getter()
{
  uint64_t v0;
  _BYTE v2[40];

  sub_1BA19ABD0();
  sub_1BA19B170();
  sub_1BA19ABD0();
  swift_bridgeObjectRelease();
  sub_1BA19ABD0();
  sub_1BA193020(v0 + 40, (uint64_t)v2);
  sub_1BA1925AC((uint64_t)v2);
  OUTLINED_FUNCTION_20_2();
  return 0;
}

uint64_t sub_1BA193000()
{
  return Layout.description.getter();
}

uint64_t sub_1BA193020(uint64_t a1, uint64_t a2)
{
  __swift_memcpy34_8(a2, a1);
  return a2;
}

uint64_t dispatch thunk of LayoutType.frame.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of LayoutType.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t method lookup function for DebugLayoutData()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for Layout()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Layout.__allocating_init(canvas:name:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of Layout.__allocating_init(canvas:name:block:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of Layout.__allocating_init(tryCanvas:name:block:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t dispatch thunk of Layout.add(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of Layout.debugLayout(layoutOptions:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t *sub_1BA1930D4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    *(_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8);
  }
  swift_retain();
  return v4;
}

uint64_t sub_1BA193184(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 16))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  swift_retain();
  return a1;
}

uint64_t sub_1BA1931E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 24))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1BA193250(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 32))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1BA1932AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 40))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_1BA193310(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t v13;

  v4 = *(_QWORD *)(a3 + 24);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if (!a2)
    return 0;
  v8 = *(_QWORD *)(v5 + 64);
  if (v7 >= a2)
  {
    if (v6 < 0x7FFFFFFF)
    {
      v13 = *(_QWORD *)((a1 + v8 + 7) & 0xFFFFFFFFFFFFF8);
      if (v13 >= 0xFFFFFFFF)
        LODWORD(v13) = -1;
      return (v13 + 1);
    }
    else
    {
      return __swift_getEnumTagSinglePayload(a1, v6, v4);
    }
  }
  else
  {
    if (((((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v7 + 1;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    return ((uint64_t (*)(void))((char *)&loc_1BA19338C + 4 * byte_1BA19EDA0[v11]))();
  }
}

void sub_1BA19340C(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0u;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
  }
  if (a2 > v6)
  {
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      v10 = ~v6 + a2;
      bzero(a1, ((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
      *a1 = v10;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t sub_1BA1934F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  _QWORD *v8;
  uint64_t v9;

  *(_BYTE *)(v5 + v6) = 0;
  if ((_DWORD)a2)
  {
    if (a3 < 0x7FFFFFFF)
    {
      v8 = (_QWORD *)((v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8);
      if ((a2 & 0x80000000) != 0)
        v9 = a2 ^ 0x80000000;
      else
        v9 = (a2 - 1);
      *v8 = v9;
    }
    else
    {
      return __swift_storeEnumTagSinglePayload(v5, a2, a3, a4);
    }
  }
  return result;
}

uint64_t sub_1BA193584(uint64_t a1, uint64_t a2)
{
  __swift_memcpy33_8(a2, a1);
  return a2;
}

void type metadata accessor for AbsoluteLayoutBoundsAdjuster()
{
  OUTLINED_FUNCTION_8_3();
}

void type metadata accessor for EmbedLayoutBoundsAdjuster()
{
  OUTLINED_FUNCTION_8_3();
}

uint64_t *sub_1BA1935E0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  _OWORD *v10;
  __int128 *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 64 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = (_OWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    v11 = (__int128 *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    v12 = v11[3];
    v14 = *v11;
    v13 = v11[1];
    v10[2] = v11[2];
    v10[3] = v12;
    *v10 = v14;
    v10[1] = v13;
  }
  return v4;
}

uint64_t sub_1BA193698(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  __int128 *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (__int128 *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = v8[3];
  v11 = *v8;
  v10 = v8[1];
  v7[2] = v8[2];
  v7[3] = v9;
  *v7 = v11;
  v7[1] = v10;
  return a1;
}

uint64_t sub_1BA1936FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  v7[2] = v8[2];
  v7[3] = v8[3];
  v7[4] = v8[4];
  v7[5] = v8[5];
  v7[6] = v8[6];
  v7[7] = v8[7];
  return a1;
}

uint64_t sub_1BA193790(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  __int128 *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (__int128 *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = v8[3];
  v11 = *v8;
  v10 = v8[1];
  v7[2] = v8[2];
  v7[3] = v9;
  *v7 = v11;
  v7[1] = v10;
  return a1;
}

uint64_t sub_1BA1937F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  v7[2] = v8[2];
  v7[3] = v8[3];
  v7[4] = v8[4];
  v7[5] = v8[5];
  v7[6] = v8[6];
  v7[7] = v8[7];
  return a1;
}

uint64_t sub_1BA193888(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(a3 + 24);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 >= a2)
  {
    if ((_DWORD)v6)
      return __swift_getEnumTagSinglePayload(a1, v6, v4);
    return 0;
  }
  if (((((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 64) & 0xFFFFFFF8) != 0)
    v7 = 2;
  else
    v7 = a2 - v6 + 1;
  if (v7 >= 0x10000)
    v8 = 4;
  else
    v8 = 2;
  if (v7 < 0x100)
    v8 = 1;
  if (v7 >= 2)
    v9 = v8;
  else
    v9 = 0;
  return ((uint64_t (*)(void))((char *)&loc_1BA1938F8 + 4 * byte_1BA19EDAF[v9]))();
}

void sub_1BA19394C(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  int v12;
  unsigned int v13;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = ((*(_QWORD *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 64;
  if (v7 >= a3)
  {
    v12 = 0u;
  }
  else
  {
    v9 = a3 - v7;
    if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFC0)
      v10 = v9 + 1;
    else
      v10 = 2;
    if (v10 >= 0x10000)
      v11 = 4;
    else
      v11 = 2;
    if (v10 < 0x100)
      v11 = 1;
    if (v10 >= 2)
      v12 = v11;
    else
      v12 = 0;
  }
  if (a2 > v7)
  {
    if ((_DWORD)v8)
    {
      v13 = ~v7 + a2;
      bzero(a1, v8);
      *a1 = v13;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X10 }
}

uint64_t sub_1BA193A2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  *(_BYTE *)(v4 + v5) = 0;
  if ((_DWORD)a2)
    return __swift_storeEnumTagSinglePayload(v4, a2, a3, a4);
  return result;
}

void sub_1BA193A68(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_WORD *)(v2 + v3) = 0;
  if (!a2)
    JUMPOUT(0x1BA193A70);
  JUMPOUT(0x1BA193A50);
}

uint64_t sub_1BA193A88(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 64))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1BA193AA8(uint64_t result, int a2, int a3)
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

void type metadata accessor for LayoutPostProcessResult()
{
  OUTLINED_FUNCTION_8_3();
}

void SizingBehavior.width.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

void SizingBehavior.height.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 1);
}

_QWORD *static SizingBehavior.fixed.getter@<X0>(_BYTE *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_37(&qword_1ED5C9B18, &word_1ED5C8FE0, a1);
}

_QWORD *static SizingBehavior.sizeToFitContents.getter@<X0>(_BYTE *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_37(&qword_1ED5C9B10, &word_1ED5C9B02, a1);
}

_QWORD *sub_1BA193B40@<X0>(_QWORD *result@<X0>, _BYTE *a2@<X1>, char *a3@<X2>, _BYTE *a4@<X8>)
{
  char v7;

  if (*result != -1)
    result = (_QWORD *)swift_once();
  v7 = *a3;
  *a4 = *a2;
  a4[1] = v7;
  return result;
}

BOOL static DimensionSizingBehavior.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DimensionSizingBehavior.hash(into:)()
{
  return sub_1BA19B110();
}

uint64_t DimensionSizingBehavior.hashValue.getter()
{
  sub_1BA19B104();
  sub_1BA19B110();
  return sub_1BA19B128();
}

uint64_t DimensionSizingBehavior.description.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x6465786966;
  else
    return 0x69466F54657A6973;
}

unint64_t sub_1BA193C64()
{
  unint64_t result;

  result = qword_1EF274808[0];
  if (!qword_1EF274808[0])
  {
    result = MEMORY[0x1BCCD6858](&protocol conformance descriptor for DimensionSizingBehavior, &type metadata for DimensionSizingBehavior);
    atomic_store(result, qword_1EF274808);
  }
  return result;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SizingBehavior(unsigned __int16 *a1, unsigned int a2)
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
    if (a2 + 65281 <= 0xFFFEFFFF)
      v2 = 2;
    else
      v2 = 4;
    if (a2 + 65281 < 0xFF0000)
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
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    else
    {
      v4 = *((unsigned __int8 *)a1 + 2);
      if (!*((_BYTE *)a1 + 2))
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 16)) - 65282;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *(unsigned __int8 *)a1;
  v7 = v6 >= 2;
  v5 = v6 - 2;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SizingBehavior(_WORD *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 65281 <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (a3 + 65281 < 0xFF0000)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1BA193D88 + 4 * byte_1BA19EFC5[v4]))();
  *a1 = a2 - 255;
  return ((uint64_t (*)(void))((char *)sub_1BA193DBC + 4 * asc_1BA19EFC0[v4]))();
}

uint64_t sub_1BA193DBC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_1BA193DC4(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x1BA193DCCLL);
  return result;
}

uint64_t sub_1BA193DD8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x1BA193DE0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1BA193DE4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_1BA193DEC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SizingBehavior()
{
  return &type metadata for SizingBehavior;
}

uint64_t storeEnumTagSinglePayload for DimensionSizingBehavior(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BA193E54 + 4 * byte_1BA19EFCF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1BA193E88 + 4 * byte_1BA19EFCA[v4]))();
}

uint64_t sub_1BA193E88(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA193E90(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA193E98);
  return result;
}

uint64_t sub_1BA193EA4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA193EACLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1BA193EB0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA193EB8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DimensionSizingBehavior()
{
  return &type metadata for DimensionSizingBehavior;
}

uint64_t sub_1BA193ED4()
{
  sub_1BA178140();
  sub_1BA19AF3C();
  sub_1BA19ABD0();
  return 0;
}

ValueMetadata *type metadata accessor for InvertDimensionSizer()
{
  return &type metadata for InvertDimensionSizer;
}

uint64_t sub_1BA193F5C()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BA193F8C()
{
  swift_release();
  return swift_deallocObject();
}

double static CGFloat.flexible.getter()
{
  return 1.79769313e308;
}

_QWORD *assignWithCopy for AltTextSized(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a2[2];
  v5 = (void *)a1[2];
  a1[2] = v4;
  v6 = v4;

  a1[3] = a2[3];
  swift_retain();
  swift_release();
  v7 = (void *)a2[4];
  v8 = (void *)a1[4];
  a1[4] = v7;
  v9 = v7;

  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  v10 = (void *)a2[9];
  v11 = (void *)a1[9];
  a1[9] = v10;
  v12 = v10;

  a1[10] = a2[10];
  a1[11] = a2[11];
  return a1;
}

uint64_t assignWithTake for AltTextSized(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  v5 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);

  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v6 = *(void **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);

  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  return a1;
}

ValueMetadata *type metadata accessor for AltTextSized()
{
  return &type metadata for AltTextSized;
}

ValueMetadata *type metadata accessor for MinMaxSizer()
{
  return &type metadata for MinMaxSizer;
}

_QWORD *sub_1BA194144(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *result;
  uint64_t v13;

  v5 = v3;
  v9 = *a1;
  v10 = v5[3];
  v11 = v5[4];
  __swift_project_boxed_opaque_existential_1(v5, v10);
  result = (*(_QWORD *(**)(uint64_t *__return_ptr, uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v11 + 16))(&v13, a1, a2, a3, *(_QWORD *)(v9 + 80), *(_QWORD *)(v9 + 88), v10, v11);
  if (!v4)
    __asm { BR              X10 }
  return result;
}

_QWORD *sub_1BA1942E4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_1BA194144(a1, a2, a3);
}

void sub_1BA1942F8(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1BA194324()
{
  sub_1BA19ACF0();
  sub_1BA19ABD0();
  swift_bridgeObjectRelease();
  sub_1BA19ABD0();
  return 0x68746469576E696DLL;
}

void sub_1BA1943C0()
{
  uint64_t v0;

  sub_1BA1942F8(*(_QWORD *)v0, *(_BYTE *)(v0 + 8));
}

uint64_t sub_1BA1943CC()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t getEnumTagSinglePayload for MinMaxSizer.Adjust(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFD && *(_BYTE *)(a1 + 9))
    {
      v2 = *(_DWORD *)a1 + 252;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 3)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MinMaxSizer.Adjust(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_1BA194488(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for MinMaxSizer.Adjust()
{
  return &type metadata for MinMaxSizer.Adjust;
}

uint64_t initializeWithCopy for InsetSizer(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  return a1;
}

uint64_t *assignWithCopy for InsetSizer(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  return a1;
}

void *__swift_memcpy72_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x48uLL);
}

uint64_t assignWithTake for InsetSizer(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for InsetSizer(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 72))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for InsetSizer(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for InsetSizer()
{
  return &type metadata for InsetSizer;
}

_QWORD *sub_1BA194624@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;

  v6 = v4;
  v11 = *a1;
  v12 = *(_QWORD *)(v6 + 24);
  v13 = *(_QWORD *)(v6 + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)v6, v12);
  result = (*(_QWORD *(**)(uint64_t *__return_ptr, uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v13 + 16))(&v20, a1, a2, a3, *(_QWORD *)(v11 + 80), *(_QWORD *)(v11 + 88), v12, v13);
  if (!v5)
  {
    v15 = v20;
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v15;
    v19 = *(_OWORD *)(v6 + 40);
    v17 = *(_QWORD *)(v6 + 56);
    v18 = *(_QWORD *)(v6 + 64);
    result = (_QWORD *)swift_allocObject();
    *((_OWORD *)result + 1) = v19;
    result[4] = v17;
    result[5] = v18;
    *(_QWORD *)(v16 + 24) = sub_1BA19486C;
    *(_QWORD *)(v16 + 32) = result;
    *a4 = v16 | 0x6000000000000000;
  }
  return result;
}

void sub_1BA194734(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(double *)a1 = UIEdgeInsetsInsetRect(a2, a3, a4, a5, a6, a7);
  *(_QWORD *)(a1 + 8) = v8;
  *(_QWORD *)(a1 + 16) = v9;
  *(_QWORD *)(a1 + 24) = v10;
  *(_BYTE *)(a1 + 32) = 0;
}

_QWORD *sub_1BA194760@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BA194624(a1, a2, a3, a4);
}

uint64_t sub_1BA194774()
{
  sub_1BA17C214();
  OUTLINED_FUNCTION_1_20();
  sub_1BA19ABD0();
  type metadata accessor for UIEdgeInsets(0);
  OUTLINED_FUNCTION_1_20();
  sub_1BA19ABD0();
  return 0;
}

uint64_t sub_1BA19482C()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BA19485C()
{
  return swift_deallocObject();
}

void sub_1BA19486C(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  uint64_t v5;

  sub_1BA194734(a1, a2, a3, a4, a5, *(double *)(v5 + 16), *(double *)(v5 + 24));
}

uint64_t sub_1BA194878@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>)
{
  uint64_t v6;
  uint64_t v7;
  CGFloat v8;
  CGFloat v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CGFloat v14;
  CGFloat v15;
  char v16;
  CGRect v17;
  CGRect v18;

  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    swift_beginAccess();
    v6 = *(_QWORD *)(a1 + 488);
    v7 = *(_QWORD *)(a1 + 496);
    v17.origin.x = *(CGFloat *)(a1 + 96);
    v17.origin.y = *(CGFloat *)(a1 + 104);
    v8 = *(double *)(a1 + 112);
    v17.size.height = *(CGFloat *)(a1 + 120);
    v17.size.width = v8;
    v9 = CGRectGetHeight(v17) * a3;
    result = OUTLINED_FUNCTION_9();
    v11 = result;
    *(_QWORD *)(result + 16) = v6;
    *(_QWORD *)(result + 24) = v7;
    *(CGFloat *)(result + 32) = v8;
    *(CGFloat *)(result + 40) = v9;
  }
  else
  {
    swift_beginAccess();
    v12 = *(_QWORD *)(a1 + 488);
    v13 = *(_QWORD *)(a1 + 496);
    v18.origin.x = *(CGFloat *)(a1 + 96);
    v18.origin.y = *(CGFloat *)(a1 + 104);
    v18.size.width = *(CGFloat *)(a1 + 112);
    v14 = *(double *)(a1 + 120);
    v18.size.height = v14;
    v15 = CGRectGetWidth(v18) * a3;
    result = OUTLINED_FUNCTION_9();
    v11 = result;
    *(_QWORD *)(result + 16) = v12;
    *(_QWORD *)(result + 24) = v13;
    *(CGFloat *)(result + 32) = v15;
    *(CGFloat *)(result + 40) = v14;
  }
  if (qword_1ED5C9B18 != -1)
    result = swift_once();
  v16 = HIBYTE(word_1ED5C8FE0);
  *(_BYTE *)(v11 + 48) = word_1ED5C8FE0;
  *(_BYTE *)(v11 + 49) = v16;
  *a2 = v11;
  return result;
}

uint64_t sub_1BA19498C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  double *v2;

  return sub_1BA194878(a1, a2, *v2);
}

uint64_t sub_1BA1949A4()
{
  sub_1BA19ACF0();
  sub_1BA19ABD0();
  swift_bridgeObjectRelease();
  sub_1BA19ABD0();
  return 0x61746E6563726570;
}

uint64_t sub_1BA194A10()
{
  return sub_1BA1949A4();
}

ValueMetadata *type metadata accessor for PercentageSizer()
{
  return &type metadata for PercentageSizer;
}

uint64_t sub_1BA194A28()
{
  return swift_deallocObject();
}

double *sub_1BA194A38@<X0>(double **a1@<X8>)
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  double *result;
  double *v6;
  char v7;

  v2 = Cursor.remainingBounds.getter();
  v4 = v3;
  result = (double *)swift_allocObject();
  v6 = result;
  result[2] = v2;
  *((_QWORD *)result + 3) = v4;
  result[4] = 0.0;
  result[5] = 0.0;
  if (qword_1ED5C9B18 != -1)
    result = (double *)swift_once();
  v7 = HIBYTE(word_1ED5C8FE0);
  *((_BYTE *)v6 + 48) = word_1ED5C8FE0;
  *((_BYTE *)v6 + 49) = v7;
  *a1 = v6;
  return result;
}

double *sub_1BA194AE0@<X0>(double **a1@<X8>)
{
  return sub_1BA194A38(a1);
}

uint64_t sub_1BA194AF4()
{
  return 1869768058;
}

ValueMetadata *type metadata accessor for ZeroSizer()
{
  return &type metadata for ZeroSizer;
}

uint64_t sub_1BA194B14()
{
  return swift_deallocObject();
}

void ForEach<A, B>(_:block:)(uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  _QWORD v31[2];
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *);
  uint64_t v35;
  uint64_t v36;

  v34 = a2;
  v35 = a3;
  v32 = a1;
  v31[1] = a7;
  v10 = OUTLINED_FUNCTION_5_24();
  v36 = *(_QWORD *)(v10 - 8);
  OUTLINED_FUNCTION_0_39();
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)v31 - v13;
  sub_1BA19ADEC();
  OUTLINED_FUNCTION_0_39();
  v17 = MEMORY[0x1E0C80A78](v15, v16);
  v19 = (char *)v31 - v18;
  v20 = *(_QWORD *)(a5 - 8);
  MEMORY[0x1E0C80A78](v17, v21);
  v23 = (char *)v31 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = OUTLINED_FUNCTION_5_24();
  v33 = *(_QWORD *)(v24 - 8);
  OUTLINED_FUNCTION_0_39();
  MEMORY[0x1E0C80A78](v25, v26);
  v28 = (char *)v31 - v27;
  type metadata accessor for ForEachNode(0, a4, a6, v29);
  OUTLINED_FUNCTION_1_38();
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v23, v32, a5);
  sub_1BA19ABDC();
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_3_31();
  if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v10) != 1)
  {
    v30 = *(void (**)(char *, char *, uint64_t))(v36 + 32);
    do
    {
      v30(v14, v19, v10);
      v34(v14);
      sub_1BA194DA4();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v14, v10);
      OUTLINED_FUNCTION_3_31();
    }
    while (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v10) != 1);
  }
  (*(void (**)(char *, uint64_t))(v33 + 8))(v28, v24);
  OUTLINED_FUNCTION_1_13();
}

uint64_t type metadata accessor for ForEachNode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ForEachNode);
}

uint64_t sub_1BA194D54(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  swift_allocObject();
  return sub_1BA195410(a1, a2, a3, v6);
}

uint64_t sub_1BA194DA4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  swift_beginAccess();
  type metadata accessor for Node(255, *(_QWORD *)(v1 + 136), *(_QWORD *)(v1 + 144), v2);
  v3 = sub_1BA19ACE4();
  swift_bridgeObjectRetain();
  MEMORY[0x1BCCD6858](MEMORY[0x1E0DEAF38], v3);
  sub_1BA19ACB4();
  return swift_endAccess();
}

void ForEach<A, B>(_:block:)(void (*a1)(char *, char *, uint64_t), uint64_t (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, _QWORD, _QWORD);
  char *v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD v34[2];
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  char *v37;
  uint64_t (*v38)(char *);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v38 = a2;
  v39 = a3;
  v36 = a1;
  v34[0] = a5;
  v34[1] = a7;
  v10 = OUTLINED_FUNCTION_4_23();
  v40 = *(_QWORD *)(v10 - 8);
  OUTLINED_FUNCTION_0_39();
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)v34 - v13;
  sub_1BA19ADEC();
  OUTLINED_FUNCTION_0_39();
  v17 = MEMORY[0x1E0C80A78](v15, v16);
  v19 = (char *)v34 - v18;
  v20 = *(_QWORD *)(a5 - 8);
  MEMORY[0x1E0C80A78](v17, v21);
  v23 = (char *)v34 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = OUTLINED_FUNCTION_4_23();
  v35 = *(_QWORD *)(v24 - 8);
  OUTLINED_FUNCTION_0_39();
  MEMORY[0x1E0C80A78](v25, v26);
  v28 = (char *)v34 - v27;
  type metadata accessor for ForEachNode(0, a4, a6, v29);
  v41 = OUTLINED_FUNCTION_1_38();
  v30 = *(void (**)(char *, _QWORD, _QWORD))(v20 + 16);
  v31 = v28;
  v30(v23, v36, v34[0]);
  sub_1BA19ABDC();
  swift_getAssociatedConformanceWitness();
  sub_1BA19ADF8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v10) != 1)
  {
    v36 = *(void (**)(char *, char *, uint64_t))(v40 + 32);
    v37 = v28;
    do
    {
      v36(v14, v19, v10);
      sub_1BA1695F0();
      swift_allocObject();
      sub_1BA19AC6C();
      *v32 = v38(v14);
      type metadata accessor for Node(0, a4, a6, v33);
      sub_1BA1695B8();
      sub_1BA194DA4();
      v31 = v37;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v40 + 8))(v14, v10);
      sub_1BA19ADF8();
    }
    while (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v10) != 1);
  }
  (*(void (**)(char *, uint64_t))(v35 + 8))(v31, v24);
  OUTLINED_FUNCTION_1_13();
}

uint64_t sub_1BA1950F0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t i;

  v5 = *v2;
  swift_beginAccess();
  v6 = v2[5];
  v8 = type metadata accessor for Node(0, *(_QWORD *)(v5 + 136), *(_QWORD *)(v5 + 144), v7);
  swift_bridgeObjectRetain();
  v9 = sub_1BA19AC60();
  for (i = v9; v9 != MEMORY[0x1BCCD5FA0](v6, v8); v9 = i)
  {
    v11 = sub_1BA19ACA8();
    sub_1BA19AC78();
    if ((v11 & 1) != 0)
    {
      v12 = *(_QWORD *)(v6 + 32 + 8 * v9);
      swift_retain();
    }
    else
    {
      v12 = sub_1BA19AEAC();
    }
    swift_bridgeObjectRetain();
    MEMORY[0x1BCCD5FAC](&i, v6, v8);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v12 + 120))(a1, a2);
    swift_release();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BA195238(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v20;
  uint64_t v22;

  v8 = *v4;
  swift_beginAccess();
  v9 = v4[5];
  v11 = type metadata accessor for Node(0, *(_QWORD *)(v8 + 136), *(_QWORD *)(v8 + 144), v10);
  swift_bridgeObjectRetain();
  v12 = sub_1BA19AC60();
  v22 = v12;
  if (v12 == MEMORY[0x1BCCD5FA0](v9, v11))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  v20 = a1;
  v14 = 0;
  do
  {
    v15 = sub_1BA19ACA8();
    sub_1BA19AC78();
    if ((v15 & 1) != 0)
    {
      v16 = *(_QWORD *)(v9 + 32 + 8 * v12);
      swift_retain();
    }
    else
    {
      v16 = sub_1BA19AEAC();
    }
    swift_bridgeObjectRetain();
    MEMORY[0x1BCCD5FAC](&v22, v9, v11);
    swift_bridgeObjectRelease();
    v17 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v16 + 128))(v20, a2, a3, a4);
    swift_release();
    if (v5)
      return swift_bridgeObjectRelease();
    v18 = sub_1BA16CFF4(v17);
    swift_release();
    v14 |= v18;
    v12 = v22;
  }
  while (v12 != MEMORY[0x1BCCD5FA0](v9, v11));
  swift_bridgeObjectRelease();
  if ((v14 & 1) == 0)
    return 0;
  return swift_retain();
}

uint64_t sub_1BA195410(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  char v7;
  char v9;

  v7 = *a1;
  type metadata accessor for Node(0, *(_QWORD *)(*v4 + 136), *(_QWORD *)(*v4 + 144), a4);
  swift_retain();
  v4[5] = sub_1BA19AB04();
  swift_release();
  v9 = v7;
  return Node.init(kind:identifier:)(&v9, a2, a3);
}

uint64_t sub_1BA195490()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BA195498()
{
  uint64_t v0;

  v0 = Node.deinit();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BA1954C4()
{
  sub_1BA195498();
  return swift_deallocClassInstance();
}

uint64_t sub_1BA1954E0()
{
  return 0x68636145726F46;
}

uint64_t sub_1BA1954F8()
{
  return sub_1BA1954E0();
}

uint64_t sub_1BA195518()
{
  return swift_initClassMetadata2();
}

BOOL static ResizeConstraint.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ResizeConstraint.hash(into:)()
{
  return sub_1BA19B110();
}

uint64_t ResizeConstraint.hashValue.getter()
{
  sub_1BA19B104();
  sub_1BA19B110();
  return sub_1BA19B128();
}

unint64_t sub_1BA1955F0()
{
  unint64_t result;

  result = qword_1EF274890;
  if (!qword_1EF274890)
  {
    result = MEMORY[0x1BCCD6858](&protocol conformance descriptor for ResizeConstraint, &type metadata for ResizeConstraint);
    atomic_store(result, (unint64_t *)&qword_1EF274890);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ResizeConstraint(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BA195678 + 4 * byte_1BA19F305[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1BA1956AC + 4 * byte_1BA19F300[v4]))();
}

uint64_t sub_1BA1956AC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA1956B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA1956BCLL);
  return result;
}

uint64_t sub_1BA1956C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA1956D0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1BA1956D4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA1956DC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void static Sizing.size<A>(_:)(uint64_t *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = OUTLINED_FUNCTION_6();
  v7 = OUTLINED_FUNCTION_6();
  *(double *)(v7 + 16) = a2;
  *(_QWORD *)(v6 + 16) = v7;
  v8 = OUTLINED_FUNCTION_6();
  *(double *)(v8 + 16) = a3;
  *(_QWORD *)(v6 + 24) = v8;
  *a1 = v6 | 0x1000000000000000;
  OUTLINED_FUNCTION_19_2();
}

uint64_t sub_1BA19575C()
{
  uint64_t v0;

  sub_1BA172D3C(*(_QWORD *)(v0 + 16));
  sub_1BA172D3C(*(_QWORD *)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_1BA195788()
{
  return swift_deallocObject();
}

void static Sizing.scaledSize<A>(_:)(uint64_t *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = OUTLINED_FUNCTION_6();
  v7 = OUTLINED_FUNCTION_6();
  *(double *)(v7 + 16) = a2;
  *(_QWORD *)(v6 + 16) = v7 | 0x2000000000000000;
  v8 = OUTLINED_FUNCTION_6();
  *(double *)(v8 + 16) = a3;
  *(_QWORD *)(v6 + 24) = v8 | 0x2000000000000000;
  *a1 = v6 | 0x1000000000000000;
  OUTLINED_FUNCTION_19_2();
}

void Sizing.description.getter()
{
  OUTLINED_FUNCTION_25_1();
  __asm { BR              X11 }
}

uint64_t sub_1BA195860()
{
  sub_1BA19ACF0();
  sub_1BA19ABD0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_8();
  return 0x61746E6563726570;
}

void sub_1BA195F20()
{
  OUTLINED_FUNCTION_5_25();
  JUMPOUT(0x1BA195F4CLL);
}

void sub_1BA195F58(uint64_t a1)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_19();
  v3 = v2[2];
  v4 = v2[3];
  v5 = v2[4];
  sub_1BA171AC4(v3);
  sub_1BA1683F8(v4);
  sub_1BA1683F8(v5);
  sub_1BA19AEA0();
  sub_1BA19ABD0();
  v7 = type metadata accessor for Conditional(0, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), v6);
  MEMORY[0x1BCCD6858](&protocol conformance descriptor for Conditional<A>, v7);
  sub_1BA19AFFC();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x1BCCD6858](&protocol conformance descriptor for Sizing<A>, a1);
  OUTLINED_FUNCTION_13_8();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_13_8();
  OUTLINED_FUNCTION_0_8();
  sub_1BA168614(v5);
  sub_1BA168614(v4);
  sub_1BA171BFC(v3);
  JUMPOUT(0x1BA195EF8);
}

uint64_t sub_1BA196054@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))((char *)&loc_1BA196074 + *((int *)qword_1BA196188 + __ROR8__(a1 + 0x1FFFFFFFFFFFFFFCLL, 3))))();
}

void sub_1BA196084()
{
  JUMPOUT(0x1BA195EFCLL);
}

void sub_1BA1960BC()
{
  JUMPOUT(0x1BA195EFCLL);
}

void sub_1BA1960D4()
{
  JUMPOUT(0x1BA195EFCLL);
}

void sub_1BA1960E0()
{
  JUMPOUT(0x1BA1960B0);
}

void sub_1BA1960EC()
{
  JUMPOUT(0x1BA1960B0);
}

void sub_1BA1960FC()
{
  JUMPOUT(0x1BA1960B0);
}

unint64_t *sub_1BA1961B0(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a2;
  sub_1BA1683F8(*a2);
  v4 = *a1;
  *a1 = v3;
  sub_1BA168614(v4);
  return a1;
}

unint64_t *sub_1BA1961E8(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a1;
  *a1 = *a2;
  sub_1BA168614(v3);
  return a1;
}

uint64_t sub_1BA196218(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0x63 && *(_BYTE *)(a1 + 8))
    {
      v2 = *(_DWORD *)a1 + 98;
    }
    else
    {
      v2 = ((((*(_QWORD *)a1 >> 57) & 0x78 | *(_QWORD *)a1 & 7) >> 2) & 0xFFFFFF9F | (32 * (*(_QWORD *)a1 & 3))) ^ 0x7F;
      if (v2 >= 0x62)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t sub_1BA19626C(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x62)
  {
    *(_QWORD *)result = a2 - 99;
    if (a3 >= 0x63)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x63)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
    {
      v3 = (-a2 >> 5) & 3 | (4 * (-a2 & 0x7F));
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_1BA1962BC(_QWORD *a1)
{
  unsigned int v1;

  v1 = (*a1 >> 59) & 0x1E | (*a1 >> 2) & 1;
  if (v1 <= 0x1C)
    return v1;
  else
    return (*a1 >> 3) + 29;
}

_QWORD *sub_1BA1962E0(_QWORD *result)
{
  *result &= 0xFFFFFFFFFFFFFFBuLL;
  return result;
}

uint64_t sub_1BA1962F4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BA196318()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_28_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_29_2()
{
  return sub_1BA19ACF0();
}

uint64_t OUTLINED_FUNCTION_30_1()
{
  return swift_bridgeObjectRetain();
}

id OUTLINED_FUNCTION_31_1@<X0>(uint64_t a1@<X8>)
{
  return *(id *)(a1 + 32);
}

uint64_t getEnumTagSinglePayload for PercentageFillSizer(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 1)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PercentageFillSizer(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for PercentageFillSizer()
{
  return &type metadata for PercentageFillSizer;
}

void sub_1BA196400(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
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
  char v14;

  sub_1BA196634(*(_QWORD *)(v2 + 8), *(_BYTE *)(v2 + 16), a1, *(double *)v2);
  if (!v3)
  {
    v9 = v5;
    v10 = v6;
    v11 = v7;
    v12 = v8;
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v9;
    *(_QWORD *)(v13 + 24) = v10;
    *(_QWORD *)(v13 + 32) = v11;
    *(_QWORD *)(v13 + 40) = v12;
    if (qword_1ED5C9B18 != -1)
      swift_once();
    v14 = HIBYTE(word_1ED5C8FE0);
    *(_BYTE *)(v13 + 48) = word_1ED5C8FE0;
    *(_BYTE *)(v13 + 49) = v14;
    *a2 = v13;
  }
}

double sub_1BA1964C8(uint64_t a1, double a2, double a3)
{
  double v3;
  CGFloat v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  CGFloat rect;
  CGRect v17;
  CGRect v18;

  v3 = 0.0;
  if (a2 > 0.0)
  {
    v6 = *(double *)(a1 + 96);
    v7 = *(double *)(a1 + 104);
    v9 = *(double *)(a1 + 112);
    v8 = *(double *)(a1 + 120);
    rect = v8;
    v10 = v6;
    v11 = v7;
    v12 = v9;
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
    {
      CGRectGetHeight(*(CGRect *)&v10);
      swift_beginAccess();
      v3 = *(double *)(a1 + 488);
      v17.origin.x = v6;
      v17.origin.y = v7;
      v17.size.width = v9;
      v17.size.height = rect;
      CGRectGetWidth(v17);
    }
    else
    {
      CGRectGetWidth(*(CGRect *)&v10);
      swift_beginAccess();
      v13 = *(double *)(a1 + 488);
      v14 = -0.0;
      if (*(double *)(a1 + 16) < v13)
        v14 = a3;
      v3 = floor(v13 + v14);
      v18.origin.x = v6;
      v18.origin.y = v7;
      v18.size.width = v9;
      v18.size.height = rect;
      CGRectGetHeight(v18);
    }
  }
  return v3;
}

void sub_1BA196634(uint64_t a1, char a2, uint64_t a3, double a4)
{
  uint64_t v4;
  double v5;

  if ((a2 & 1) != 0)
  {
    v5 = *(double *)&a1;
LABEL_5:
    sub_1BA1964C8(a3, a4, v5);
    return;
  }
  if (*(_BYTE *)(a3 + 328) != 3)
  {
    if ((a1 & 1) != 0)
    {
      if (*(_BYTE *)(a3 + 48))
      {
        v5 = *(double *)(a3 + 360);
        goto LABEL_5;
      }
    }
    else if ((*(_BYTE *)(a3 + 48) & 1) == 0)
    {
      v5 = *(double *)(a3 + 344);
      goto LABEL_5;
    }
    sub_1BA1787C0();
    swift_allocError();
    *(_QWORD *)(v4 + 16) = 0;
    *(_QWORD *)v4 = 4;
    goto LABEL_12;
  }
  sub_1BA1787C0();
  swift_allocError();
  *(_QWORD *)(v4 + 16) = 0;
  *(_QWORD *)v4 = 0;
LABEL_12:
  *(_QWORD *)(v4 + 8) = 0;
  *(_BYTE *)(v4 + 24) = 7;
  swift_willThrow();
}

void sub_1BA196700(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1BA196400(a1, a2);
}

uint64_t sub_1BA196714()
{
  return swift_deallocObject();
}

BOOL static Direction.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1BA19673C@<X0>(uint64_t result@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v2;
  int v3;

  v3 = *v2;
  if (*v2 && v3 != 1)
    LOBYTE(v3) = *(_BYTE *)(result + 48);
  *a2 = v3;
  return result;
}

uint64_t Direction.hash(into:)()
{
  return OUTLINED_FUNCTION_1_3();
}

void Direction.hashValue.getter()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_5_1();
  sub_1BA19B128();
  OUTLINED_FUNCTION_3();
}

BOOL static BoxDirection.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t BoxDirection.hash(into:)()
{
  return OUTLINED_FUNCTION_1_3();
}

void BoxDirection.hashValue.getter()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_5_1();
  sub_1BA19B128();
  OUTLINED_FUNCTION_3();
}

unint64_t sub_1BA196810()
{
  unint64_t result;

  result = qword_1EF274898;
  if (!qword_1EF274898)
  {
    result = MEMORY[0x1BCCD6858](&protocol conformance descriptor for Direction, &type metadata for Direction);
    atomic_store(result, (unint64_t *)&qword_1EF274898);
  }
  return result;
}

unint64_t sub_1BA196850()
{
  unint64_t result;

  result = qword_1EF2748A0;
  if (!qword_1EF2748A0)
  {
    result = MEMORY[0x1BCCD6858](&protocol conformance descriptor for BoxDirection, &type metadata for BoxDirection);
    atomic_store(result, (unint64_t *)&qword_1EF2748A0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for Direction(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BA1968D8 + 4 * byte_1BA19F4F9[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1BA19690C + 4 * byte_1BA19F4F4[v4]))();
}

uint64_t sub_1BA19690C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA196914(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA19691CLL);
  return result;
}

uint64_t sub_1BA196928(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA196930);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1BA196934(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA19693C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t storeEnumTagSinglePayload for BoxDirection(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BA196994 + 4 * byte_1BA19F503[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1BA1969C8 + 4 * byte_1BA19F4FE[v4]))();
}

uint64_t sub_1BA1969C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA1969D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA1969D8);
  return result;
}

uint64_t sub_1BA1969E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA1969ECLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1BA1969F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA1969F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BoxDirection()
{
  return &type metadata for BoxDirection;
}

double CGPoint.replace(y:)(double a1, double a2)
{
  return a2;
}

uint64_t method lookup function for IfBuilder()
{
  return swift_lookUpClassMethod();
}

uint64_t CursorFrame.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

double CursorFrame.frame.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

void CursorFrame.kind.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 48);
}

uint64_t CursorFrame.pass.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 64);
  *a1 = *(_QWORD *)(v1 + 56);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t CursorFrame.resizing.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 72);
  return swift_retain();
}

uint64_t destroy for CursorFrame()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for CursorFrame(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v5 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v5;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CursorFrame(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for CursorFrame(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CursorFrame(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 80))
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

uint64_t storeEnumTagSinglePayload for CursorFrame(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CursorFrame()
{
  return &type metadata for CursorFrame;
}

double Ratio.Aspect.multiplier.getter()
{
  _BYTE *v0;

  if ((v0[8] & 1) != 0)
    return dbl_1BA19F6E8[*(_QWORD *)v0];
  else
    return *(double *)v0;
}

uint64_t Ratio.Aspect.description.getter()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 8) == 1)
    __asm { BR              X10 }
  return sub_1BA19ACF0();
}

void sub_1BA196D70()
{
  JUMPOUT(0x1BA196D68);
}

void sub_1BA196D7C()
{
  JUMPOUT(0x1BA196D68);
}

void sub_1BA196D8C()
{
  JUMPOUT(0x1BA196D68);
}

uint64_t sub_1BA196DA4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8) >> 6;
}

uint64_t sub_1BA196DB0(uint64_t result)
{
  *(_BYTE *)(result + 8) &= 0x3Fu;
  return result;
}

uint64_t method lookup function for ListBuilder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CursorFrameDebugging.frames.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of CursorFrameDebugging.add(identifier:frame:kind:pass:resizing:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 16))();
}

uint64_t dispatch thunk of CursorFrameDebugging.region(origin:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of CursorFrameDebugging.commit<A>(cursor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t sub_1BA196DEC(double a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;

  OUTLINED_FUNCTION_3_33();
  OUTLINED_FUNCTION_5_26();
  OUTLINED_FUNCTION_4_25();
  OUTLINED_FUNCTION_4_25();
  sub_1BA17E7A8();
  OUTLINED_FUNCTION_6_20(*(_QWORD *)(v2 + 16));
  OUTLINED_FUNCTION_8_17(v3 + 1);
  *(double *)(v6 + 48) = a1;
  *(double *)(v6 + 56) = a2;
  OUTLINED_FUNCTION_2_33(v6);
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_0_42();
}

uint64_t sub_1BA196E74@<X0>(uint64_t *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = type metadata accessor for CursorFrameContainerRegion();
  v8 = OUTLINED_FUNCTION_1_0();
  v9 = MEMORY[0x1E0DEE9D8];
  *(double *)(v8 + 16) = a2;
  *(double *)(v8 + 24) = a3;
  *(_QWORD *)(v8 + 32) = v3;
  *(_QWORD *)(v8 + 40) = v9;
  a1[3] = v7;
  a1[4] = (uint64_t)&off_1E71E9EB0;
  *a1 = v8;
  return OUTLINED_FUNCTION_1_40();
}

uint64_t sub_1BA196ECC()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CursorFrameContainer()
{
  return objc_opt_self();
}

uint64_t sub_1BA196F10()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BA196F1C(double a1, double a2)
{
  return sub_1BA196DEC(a1, a2);
}

uint64_t sub_1BA196F3C@<X0>(uint64_t *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  return sub_1BA196E74(a1, a2, a3);
}

uint64_t sub_1BA196F5C()
{
  uint64_t v0;
  uint64_t v1;
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;

  OUTLINED_FUNCTION_3_33();
  v3 = *(double *)(v0 + 16) + v2;
  v5 = *(double *)(v0 + 24) + v4;
  OUTLINED_FUNCTION_5_26();
  OUTLINED_FUNCTION_4_25();
  OUTLINED_FUNCTION_4_25();
  sub_1BA17E7A8();
  OUTLINED_FUNCTION_6_20(*(_QWORD *)(v0 + 40));
  OUTLINED_FUNCTION_8_17(v1 + 1);
  *(double *)(v6 + 48) = v3;
  *(double *)(v6 + 56) = v5;
  OUTLINED_FUNCTION_2_33(v6);
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_0_42();
}

uint64_t sub_1BA196FE8@<X0>(uint64_t *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  uint64_t v3;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)v3;
  v6 = *(double *)(v3 + 16) + a2;
  v7 = *(double *)(v3 + 24) + a3;
  v8 = *(_QWORD *)(v3 + 32);
  v9 = OUTLINED_FUNCTION_1_0();
  v10 = MEMORY[0x1E0DEE9D8];
  *(double *)(v9 + 16) = v6;
  *(double *)(v9 + 24) = v7;
  *(_QWORD *)(v9 + 32) = v8;
  *(_QWORD *)(v9 + 40) = v10;
  a1[3] = v5;
  a1[4] = (uint64_t)&off_1E71E9EB0;
  *a1 = v9;
  return OUTLINED_FUNCTION_1_40();
}

uint64_t sub_1BA197048()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  double v3;
  double v4;
  uint64_t v6;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 40) + 16);
  if (v1)
  {
    v2 = swift_bridgeObjectRetain() + 56;
    do
    {
      swift_retain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_0();
      sub_1BA182DA0();
      swift_bridgeObjectRetain();
      swift_retain();
      v3 = OUTLINED_FUNCTION_0();
      sub_1BA196DEC(v3, v4);
      swift_release_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      v2 += 80;
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
    v0 = v6;
  }
  *(_QWORD *)(v0 + 40) = MEMORY[0x1E0DEE9D8];
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BA1971A0()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BA1971C4()
{
  sub_1BA1971A0();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CursorFrameContainerRegion()
{
  return objc_opt_self();
}

uint64_t sub_1BA197204()
{
  return sub_1BA196F5C();
}

uint64_t sub_1BA197224@<X0>(uint64_t *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  return sub_1BA196FE8(a1, a2, a3);
}

uint64_t sub_1BA197244()
{
  return sub_1BA197048();
}

uint64_t sub_1BA197264()
{
  OUTLINED_FUNCTION_6_21();
  return swift_deallocObject();
}

uint64_t sub_1BA197280()
{
  OUTLINED_FUNCTION_22_3();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BA1972A8()
{
  uint64_t v0;

  swift_release();
  sub_1BA168614(*(_QWORD *)(v0 + 48));
  return swift_deallocObject();
}

uint64_t sub_1BA1972D4()
{
  OUTLINED_FUNCTION_6_21();
  return swift_deallocObject();
}

uint64_t sub_1BA1972F0()
{
  OUTLINED_FUNCTION_22_3();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BA197318()
{
  uint64_t v0;

  OUTLINED_FUNCTION_22_3();

  sub_1BA171098(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_BYTE *)(v0 + 80));
  return swift_deallocObject();
}

uint64_t sub_1BA19734C()
{
  OUTLINED_FUNCTION_6_21();
  return swift_deallocObject();
}

uint64_t sub_1BA197368()
{
  OUTLINED_FUNCTION_6_21();
  return swift_deallocObject();
}

uint64_t sub_1BA197384()
{
  OUTLINED_FUNCTION_6_21();
  return swift_deallocObject();
}

uint64_t sub_1BA1973A0()
{
  OUTLINED_FUNCTION_6_21();
  return swift_deallocObject();
}

uint64_t Positioning.Anchor.init(rawValue:)@<X0>(char *a1@<X8>)
{
  unint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_1BA19AFC0();
  result = swift_bridgeObjectRelease();
  v4 = 7;
  if (v2 < 7)
    v4 = v2;
  *a1 = v4;
  return result;
}

uint64_t Positioning.Anchor.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1BA19743C + 4 * byte_1BA19F864[*v0]))(7368564, 0xE300000000000000);
}

uint64_t sub_1BA19743C()
{
  return 0x6D6F74746F62;
}

uint64_t sub_1BA197458()
{
  return OUTLINED_FUNCTION_13_9();
}

uint64_t sub_1BA197464()
{
  return 0x7265746E656376;
}

uint64_t sub_1BA197480(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x1BCCD6858](&protocol conformance descriptor for Positioning<A>.Anchor, a3);
  return sub_1BA19B02C();
}

uint64_t sub_1BA1974D4(uint64_t a1)
{
  MEMORY[0x1BCCD6858](&protocol conformance descriptor for Positioning<A>.Anchor, a1);
  return sub_1BA19AC24();
}

uint64_t sub_1BA197520()
{
  MEMORY[0x1BCCD6858](&protocol conformance descriptor for Positioning<A>.Anchor);
  return sub_1BA19AC3C();
}

uint64_t sub_1BA197570()
{
  MEMORY[0x1BCCD6858](&protocol conformance descriptor for Positioning<A>.Anchor);
  return sub_1BA19AC30();
}

uint64_t sub_1BA1975C0@<X0>(char *a1@<X8>)
{
  return Positioning.Anchor.init(rawValue:)(a1);
}

uint64_t sub_1BA1975CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = Positioning.Anchor.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

double sub_1BA1975F0(double a1, double a2)
{
  return a1 - a2;
}

double sub_1BA1975F8(double a1, double a2)
{
  return a1 * a2;
}

void sub_1BA197604(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  PositioningAdjustment.init(integerLiteral:)(*a1, a2);
}

uint64_t sub_1BA19760C(double *a1)
{
  return PositioningAdjustment.init(floatLiteral:)(*a1);
}

BOOL static PositioningAdjustmentOperator.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t PositioningAdjustmentOperator.hash(into:)()
{
  return sub_1BA19B110();
}

uint64_t PositioningAdjustmentOperator.hashValue.getter()
{
  sub_1BA19B104();
  sub_1BA19B110();
  return sub_1BA19B128();
}

uint64_t Positioning.Anchor.description.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1BA1976D0 + 4 * byte_1BA19F86B[*v0]))(0x6D6F74746F62, 0xE600000000000000);
}

uint64_t sub_1BA1976D0()
{
  return 7368564;
}

uint64_t sub_1BA1976F0()
{
  return 0x7265746E656376;
}

uint64_t PositioningAdjustmentOperator.description.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x7463617274627573;
  else
    return 0x676E69646461;
}

void sub_1BA197750()
{
  JUMPOUT(0x1BCCD6858);
}

uint64_t sub_1BA197760()
{
  return MEMORY[0x1E0DEB0F0];
}

unint64_t sub_1BA197770()
{
  unint64_t result;

  result = qword_1EF274A28;
  if (!qword_1EF274A28)
  {
    result = MEMORY[0x1BCCD6858](&protocol conformance descriptor for PositioningAdjustmentOperator, &type metadata for PositioningAdjustmentOperator);
    atomic_store(result, (unint64_t *)&qword_1EF274A28);
  }
  return result;
}

uint64_t sub_1BA1977B0(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(void **)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_1BA1684BC(*(id *)a2, v4, v5, v6, v7);
  v8 = *(void **)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(void **)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v12 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v7;
  sub_1BA168434(v8, v9, v10, v11, v12);
  return a1;
}

uint64_t sub_1BA197820(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  char v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(void **)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(void **)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  v9 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v3;
  sub_1BA168434(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t sub_1BA197868(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 0x1Cu)
    return *(unsigned __int8 *)(a1 + 32);
  else
    return (*(_DWORD *)a1 + 29);
}

uint64_t sub_1BA197880(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BA1978CC + 4 * byte_1BA19F885[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_1BA197900 + 4 * byte_1BA19F880[v4]))();
}

uint64_t sub_1BA197900(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA197908(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA197910);
  return result;
}

uint64_t sub_1BA19791C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA197924);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_1BA197928(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA197930(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t storeEnumTagSinglePayload for PositioningAdjustmentOperator(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BA197988 + 4 * byte_1BA19F88F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1BA1979BC + 4 * byte_1BA19F88A[v4]))();
}

uint64_t sub_1BA1979BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA1979C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA1979CCLL);
  return result;
}

uint64_t sub_1BA1979D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA1979E0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1BA1979E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA1979EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_1BA197A18()
{
  sub_1BA197C9C();
}

void sub_1BA197A24()
{
  sub_1BA197A3C();
}

void sub_1BA197A30()
{
  sub_1BA197A3C();
}

void sub_1BA197A3C()
{
  uint64_t v0;

  v0 = sub_1BA19B104();
  OUTLINED_FUNCTION_5_28(v0);
  OUTLINED_FUNCTION_3_35();
  OUTLINED_FUNCTION_3();
}

uint64_t sub_1BA197A70()
{
  sub_1BA19B104();
  sub_1BA19ABC4();
  return sub_1BA19B128();
}

void sub_1BA197AC0()
{
  OUTLINED_FUNCTION_2_34();
  __asm { BR              X10 }
}

uint64_t sub_1BA197AE8()
{
  OUTLINED_FUNCTION_4_27();
  return OUTLINED_FUNCTION_0_44();
}

uint64_t sub_1BA197BDC()
{
  return sub_1BA19ABC4();
}

void sub_1BA197BF4()
{
  OUTLINED_FUNCTION_2_34();
  __asm { BR              X10 }
}

uint64_t sub_1BA197C1C()
{
  OUTLINED_FUNCTION_4_27();
  return OUTLINED_FUNCTION_0_44();
}

void sub_1BA197C58()
{
  sub_1BA197C70();
}

void sub_1BA197C64()
{
  sub_1BA197C70();
}

void sub_1BA197C70()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_6_22();
  OUTLINED_FUNCTION_5_28(v0);
  OUTLINED_FUNCTION_3_35();
  OUTLINED_FUNCTION_3();
}

void sub_1BA197C9C()
{
  OUTLINED_FUNCTION_6_22();
  NodeKind.rawValue.getter();
  OUTLINED_FUNCTION_4_27();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_35();
  OUTLINED_FUNCTION_3();
}

uint64_t SizerResultMetadataKey.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1BA19AFC0();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t SizerResultMetadataKey.rawValue.getter()
{
  return 0x74786554746C61;
}

uint64_t sub_1BA197D54@<X0>(BOOL *a1@<X8>)
{
  return SizerResultMetadataKey.init(rawValue:)(a1);
}

void sub_1BA197D60(_QWORD *a1@<X8>)
{
  *a1 = 0x74786554746C61;
  a1[1] = 0xE700000000000000;
}

uint64_t getEnumTagSinglePayload for SizerResultMetadataKey(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SizerResultMetadataKey(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1BA197E14 + 4 * byte_1BA19FBD8[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1BA197E34 + 4 * byte_1BA19FBDD[v4]))();
}

_BYTE *sub_1BA197E14(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1BA197E34(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BA197E3C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BA197E44(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BA197E4C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BA197E54(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SizeAdjustSizer()
{
  return &type metadata for SizeAdjustSizer;
}

_QWORD *sub_1BA197E70@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;

  v6 = v4;
  v11 = *a1;
  v12 = *(_QWORD *)(v6 + 24);
  v13 = *(_QWORD *)(v6 + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)v6, v12);
  result = (*(_QWORD *(**)(uint64_t *__return_ptr, uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v13 + 16))(&v20, a1, a2, a3, *(_QWORD *)(v11 + 80), *(_QWORD *)(v11 + 88), v12, v13);
  if (!v5)
  {
    v15 = v20;
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v15;
    v17 = *(_QWORD *)(v6 + 40);
    v18 = *(_BYTE *)(v6 + 48);
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = a1;
    *(_QWORD *)(v19 + 24) = v17;
    *(_BYTE *)(v19 + 32) = v18;
    *(_QWORD *)(v16 + 24) = sub_1BA1981D8;
    *(_QWORD *)(v16 + 32) = v19;
    *a4 = v16 | 0x6000000000000000;
    return (_QWORD *)swift_retain();
  }
  return result;
}

void sub_1BA197F70(uint64_t a1@<X1>, double a2@<X2>, unsigned __int8 a3@<W3>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>)
{
  double v15;
  __n128 v16;
  double (*v17)(double, __n128, __n128);
  __n128 v18;

  v15 = sub_1BA198020(a1);
  v17 = (double (*)(double, __n128, __n128))off_1E71EA788[a3 >> 6];
  v18.n128_f64[0] = a2;
  if (a2 == 0.0)
    v15 = v16.n128_f64[0];
  if ((a3 & 1) != 0)
    v16.n128_f64[0] = v15;
  else
    v16.n128_f64[0] = a2;
  if ((a3 & 0x20) != 0)
    a8 = v17(a8, v16, v18);
  else
    a7 = v17(a7, v16, v18);
  *(double *)a4 = a5;
  *(double *)(a4 + 8) = a6;
  *(double *)(a4 + 16) = a7;
  *(double *)(a4 + 24) = a8;
  *(_BYTE *)(a4 + 32) = 1;
}

double sub_1BA198020(uint64_t a1)
{
  double result;

  result = 0.0;
  if (*(_BYTE *)(a1 + 328) != 3)
    return *(double *)(a1 + 344);
  return result;
}

_QWORD *sub_1BA198040@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BA197E70(a1, a2, a3, a4);
}

uint64_t sub_1BA198054()
{
  sub_1BA19AEA0();
  OUTLINED_FUNCTION_1_41();
  OUTLINED_FUNCTION_1_20();
  sub_1BA19ABD0();
  OUTLINED_FUNCTION_1_20();
  sub_1BA19ABD0();
  return 0;
}

uint64_t sub_1BA198184()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BA1981B4()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1BA1981D8(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  uint64_t v5;

  sub_1BA197F70(*(_QWORD *)(v5 + 16), *(double *)(v5 + 24), *(_BYTE *)(v5 + 32), a1, a2, a3, a4, a5);
}

uint64_t getEnumTagSinglePayload for SizeAdjustSizer.Adjust(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0x1F && *(_BYTE *)(a1 + 9))
    {
      v2 = *(_DWORD *)a1 + 30;
    }
    else
    {
      v2 = (*(_BYTE *)(a1 + 8) & 0x1E | (*(unsigned __int8 *)(a1 + 8) >> 5) & 1) ^ 0x1F;
      if (v2 >= 0x1E)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for SizeAdjustSizer.Adjust(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x1E)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 31;
    if (a3 >= 0x1F)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0x1F)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_BYTE *)(result + 8) = 2 * ((((-a2 >> 1) & 0xF) - 16 * a2) & 0x1F);
    }
  }
  return result;
}

uint64_t sub_1BA198280(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 8) >> 5) & 1;
}

uint64_t sub_1BA19828C(uint64_t result)
{
  *(_BYTE *)(result + 8) &= ~0x20u;
  return result;
}

uint64_t sub_1BA19829C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = *(_BYTE *)(result + 8) & 0xC1 | (32 * (a2 & 1));
  return result;
}

ValueMetadata *type metadata accessor for SizeAdjustSizer.Adjust()
{
  return &type metadata for SizeAdjustSizer.Adjust;
}

uint64_t dispatch thunk of FastLayoutDecodable.fastDecode(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t initializeWithCopy for SizeScaleSizer(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  return a1;
}

uint64_t assignWithCopy for SizeScaleSizer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  v4 = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v4;
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  return a1;
}

__n128 __swift_memcpy50_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SizeScaleSizer(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  return a1;
}

uint64_t getEnumTagSinglePayload for SizeScaleSizer(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 50))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for SizeScaleSizer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 50) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 50) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SizeScaleSizer()
{
  return &type metadata for SizeScaleSizer;
}

uint64_t sub_1BA19846C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  void *v14;

  v5 = v3;
  v9 = *a1;
  v10 = *(_QWORD *)(v5 + 24);
  v11 = *(_QWORD *)(v5 + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)v5, v10);
  result = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v11 + 8))(a1, a2, a3, *(_QWORD *)(v9 + 80), *(_QWORD *)(v9 + 88), v10, v11);
  if (!v4)
  {
    v13 = result;
    if (*(_BYTE *)(v5 + 49))
      v14 = &unk_1E71E2878;
    else
      v14 = (void *)MEMORY[0x1E0DEE9D8];
    return sub_1BA1709C8((uint64_t)v14, v13);
  }
  return result;
}

_QWORD *sub_1BA198520@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;

  v6 = v4;
  v11 = *a1;
  v12 = *(_QWORD *)(v6 + 24);
  v13 = *(_QWORD *)(v6 + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)v6, v12);
  result = (*(_QWORD *(**)(uint64_t *__return_ptr, uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v13 + 16))(&v20, a1, a2, a3, *(_QWORD *)(v11 + 80), *(_QWORD *)(v11 + 88), v12, v13);
  if (!v5)
  {
    v15 = v20;
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v15;
    v17 = *(_QWORD *)(v6 + 40);
    v18 = *(_BYTE *)(v6 + 48);
    v19 = *(_BYTE *)(v6 + 49);
    result = (_QWORD *)swift_allocObject();
    result[2] = v17;
    *((_BYTE *)result + 24) = v18;
    *((_BYTE *)result + 25) = v19;
    *(_QWORD *)(v16 + 24) = sub_1BA1989C8;
    *(_QWORD *)(v16 + 32) = result;
    *a4 = v16 | 0x7000000000000000;
  }
  return result;
}

double sub_1BA198620(uint64_t a1, char a2, char a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  double v11;
  double v12;
  double v13;
  double Width;
  double v15;
  double v16;
  double Height;
  double v18;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v11 = a4;
  if (*(double *)&a1 <= 0.0)
    v12 = 1.0;
  else
    v12 = *(double *)&a1;
  if ((a2 & 1) != 0)
  {
    v16 = v12 * CGRectGetHeight(*(CGRect *)&a4);
    v23.origin.x = v11;
    v23.origin.y = a5;
    v23.size.width = a6;
    v23.size.height = a7;
    CGRectGetWidth(v23);
    if ((a3 & 1) != 0)
    {
      v24.origin.x = v11;
      v24.origin.y = a5;
      v24.size.width = a6;
      v24.size.height = a7;
      Height = CGRectGetHeight(v24);
      v25.origin.x = v11;
      v25.origin.y = a5;
      v25.size.width = a6;
      v25.size.height = a7;
      v18 = CGRectGetHeight(v25);
      if (Height >= v16 && v16 < v18)
      {
        v27.origin.x = v11;
        v27.origin.y = a5;
        v27.size.width = a6;
        v27.size.height = a7;
        CGRectGetHeight(v27);
      }
    }
  }
  else
  {
    v13 = v12 * CGRectGetWidth(*(CGRect *)&a4);
    v20.origin.x = v11;
    v20.origin.y = a5;
    v20.size.width = a6;
    v20.size.height = a7;
    CGRectGetHeight(v20);
    if ((a3 & 1) != 0)
    {
      v21.origin.x = v11;
      v21.origin.y = a5;
      v21.size.width = a6;
      v21.size.height = a7;
      Width = CGRectGetWidth(v21);
      v22.origin.x = v11;
      v22.origin.y = a5;
      v22.size.width = a6;
      v22.size.height = a7;
      v15 = CGRectGetWidth(v22);
      if (Width >= v13)
      {
        if (v13 < v15)
        {
          v26.origin.x = v11;
          v26.origin.y = a5;
          v26.size.width = a6;
          v26.size.height = a7;
          return (CGRectGetWidth(v26) - v13) * 0.5 + v11;
        }
      }
      else
      {
        return v11 + (v13 - v15) * -0.5;
      }
    }
  }
  return v11;
}

uint64_t sub_1BA1987D4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_1BA19846C(a1, a2, a3);
}

_QWORD *sub_1BA1987E8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BA198520(a1, a2, a3, a4);
}

uint64_t sub_1BA1987FC()
{
  uint64_t v0;
  uint64_t v2;

  if (*(_BYTE *)(v0 + 48) != 1)
  {
    if ((*(_BYTE *)(v0 + 49) & 1) != 0)
      goto LABEL_3;
LABEL_5:
    OUTLINED_FUNCTION_2_35();
    sub_1BA19AEA0();
    OUTLINED_FUNCTION_0_45();
    OUTLINED_FUNCTION_1_42();
    OUTLINED_FUNCTION_3_36();
    goto LABEL_6;
  }
  if ((*(_BYTE *)(v0 + 49) & 1) == 0)
    goto LABEL_5;
LABEL_3:
  OUTLINED_FUNCTION_2_35();
  sub_1BA19AEA0();
  OUTLINED_FUNCTION_0_45();
  OUTLINED_FUNCTION_1_42();
LABEL_6:
  sub_1BA19ABD0();
  sub_1BA19ACF0();
  sub_1BA19ABD0();
  OUTLINED_FUNCTION_12();
  sub_1BA19ABD0();
  return v2;
}

uint64_t sub_1BA198988()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BA1989B8()
{
  return swift_deallocObject();
}

double sub_1BA1989C8(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  uint64_t v4;

  return sub_1BA198620(*(_QWORD *)(v4 + 16), *(_BYTE *)(v4 + 24), *(_BYTE *)(v4 + 25), a1, a2, a3, a4);
}

uint64_t sub_1BA1989E8(uint64_t result, uint64_t a2, _QWORD *a3)
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

unint64_t sub_1BA198A04()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t i;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;

  v1 = v0;
  v2 = *v0;
  sub_1BA171040();
  v3 = sub_1BA19AE7C();
  if (*(_QWORD *)(v2 + 16))
  {
    v4 = 1 << *(_BYTE *)(v2 + 32);
    v5 = (_QWORD *)(v2 + 56);
    v6 = -1;
    if (v4 < 64)
      v6 = ~(-1 << v4);
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v4 + 63) >> 6;
    result = swift_retain();
    v10 = 0;
    if (!v7)
      goto LABEL_6;
LABEL_5:
    v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (i = v11 | (v10 << 6); ; i = __clz(__rbit64(v14)) + (v10 << 6))
    {
      result = sub_1BA198BD8(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 24 * i), *(_QWORD *)(*(_QWORD *)(v2 + 48) + 24 * i + 8), *(_BYTE *)(*(_QWORD *)(v2 + 48) + 24 * i + 16), v3);
      if (v7)
        goto LABEL_5;
LABEL_6:
      v13 = v10 + 1;
      if (__OFADD__(v10, 1))
      {
        __break(1u);
LABEL_28:
        __break(1u);
        return result;
      }
      if (v13 >= v8)
        goto LABEL_22;
      v14 = v5[v13];
      ++v10;
      if (!v14)
      {
        v10 = v13 + 1;
        if (v13 + 1 >= v8)
          goto LABEL_22;
        v14 = v5[v10];
        if (!v14)
        {
          v10 = v13 + 2;
          if (v13 + 2 >= v8)
            goto LABEL_22;
          v14 = v5[v10];
          if (!v14)
          {
            v15 = v13 + 3;
            if (v15 >= v8)
            {
LABEL_22:
              swift_release();
              v16 = 1 << *(_BYTE *)(v2 + 32);
              if (v16 > 63)
                sub_1BA1989E8(0, (unint64_t)(v16 + 63) >> 6, (_QWORD *)(v2 + 56));
              else
                *v5 = -1 << v16;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v14 = v5[v15];
            if (!v14)
            {
              while (1)
              {
                v10 = v15 + 1;
                if (__OFADD__(v15, 1))
                  goto LABEL_28;
                if (v10 >= v8)
                  goto LABEL_22;
                v14 = v5[v10];
                ++v15;
                if (v14)
                  goto LABEL_19;
              }
            }
            v10 = v15;
          }
        }
      }
LABEL_19:
      v7 = (v14 - 1) & v14;
    }
  }
  result = swift_release();
  *v1 = v3;
  return result;
}

unint64_t sub_1BA198BD8(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t result;
  uint64_t v9;

  sub_1BA19B104();
  sub_1BA19B110();
  if ((a3 & 1) == 0)
    sub_1BA1773D8();
  sub_1BA19B128();
  result = sub_1BA19AE58();
  *(_QWORD *)(a4 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  v9 = *(_QWORD *)(a4 + 48) + 24 * result;
  *(_QWORD *)v9 = a1;
  *(_QWORD *)(v9 + 8) = a2;
  *(_BYTE *)(v9 + 16) = a3 & 1;
  ++*(_QWORD *)(a4 + 16);
  return result;
}

void *sub_1BA198CF4()
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
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;

  v1 = v0;
  sub_1BA171040();
  v2 = *v0;
  v3 = sub_1BA19AE70();
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
  if (!v12)
    goto LABEL_12;
LABEL_11:
  v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (i = v14 | (v9 << 6); ; i = __clz(__rbit64(v17)) + (v9 << 6))
  {
    v19 = 3 * i;
    v20 = *(_QWORD *)(v2 + 48) + 8 * v19;
    v21 = *(_BYTE *)(v20 + 16);
    v22 = *(_QWORD *)(v4 + 48) + 8 * v19;
    *(_OWORD *)v22 = *(_OWORD *)v20;
    *(_BYTE *)(v22 + 16) = v21;
    if (v12)
      goto LABEL_11;
LABEL_12:
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_25:
    v12 = (v17 - 1) & v17;
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for SizeScaleSizer.Scale()
{
  return &type metadata for SizeScaleSizer.Scale;
}

void sub_1BA198EA8(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;

  *a1 = sub_1BA198ECC(*v1);
  a1[1] = v3;
  OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1BA198ECC(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1BA198EFC(char a1)
{
  return a1 & 1;
}

double sub_1BA198F04(double a1, double a2, double a3, double a4, double a5)
{
  return a5;
}

double sub_1BA198F0C(double a1, double a2, double a3, double a4, double a5)
{
  return a5;
}

uint64_t LayoutAdjustable.flipRightToLeft(bounds:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(a2, v2);
}

void sub_1BA198F30(_BYTE *a1@<X8>)
{
  char *v1;

  *a1 = sub_1BA198EFC(*v1) & 1;
  OUTLINED_FUNCTION_0_0();
}

void sub_1BA198F58(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = nullsub_1(*v1);
  OUTLINED_FUNCTION_0_0();
}

void sub_1BA198F7C(double *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  double *v5;

  *a1 = sub_1BA198F04(a2, a3, a4, a5, *v5);
  OUTLINED_FUNCTION_0_0();
}

uint64_t Array<A>.flipRightToLeft(bounds:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[10];

  v12[9] = a1;
  v12[2] = a2;
  v12[3] = a3;
  *(double *)&v12[4] = a4;
  *(double *)&v12[5] = a5;
  *(double *)&v12[6] = a6;
  *(double *)&v12[7] = a7;
  v8 = sub_1BA19ACE4();
  v9 = MEMORY[0x1BCCD6858](MEMORY[0x1E0DEAF50], v8);
  return sub_1BA17E460((void (*)(char *, char *))sub_1BA199030, (uint64_t)v12, v8, a2, MEMORY[0x1E0DEDCE8], v9, MEMORY[0x1E0DEDD18], v10);
}

uint64_t sub_1BA199030(uint64_t a1)
{
  uint64_t v1;

  return OUTLINED_FUNCTION_1_43(a1, *(_QWORD *)(v1 + 24));
}

uint64_t sub_1BA199060@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  uint64_t *v7;
  uint64_t result;

  result = Array<A>.flipRightToLeft(bounds:)(*v7, *(_QWORD *)(a1 + 16), *(_QWORD *)(a2 - 8), a4, a5, a6, a7);
  *a3 = result;
  return result;
}

uint64_t Dictionary<>.flipRightToLeft(bounds:)()
{
  return sub_1BA19AB4C();
}

uint64_t sub_1BA1990EC(uint64_t a1)
{
  uint64_t v1;

  return OUTLINED_FUNCTION_1_43(a1, *(_QWORD *)(v1 + 40));
}

uint64_t sub_1BA199120@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = Dictionary<>.flipRightToLeft(bounds:)();
  *a1 = result;
  return result;
}

uint64_t dispatch thunk of LayoutAdjustable.flipRightToLeft(bounds:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

void sub_1BA199160(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  double *v5;
  uint64_t v7;

  *(double *)a1 = sub_1BA198F0C(a2, a3, a4, a5, *v5);
  *(_QWORD *)(a1 + 8) = v7;
  OUTLINED_FUNCTION_0_0();
}

void destroy for SizerResultText(uint64_t a1)
{

}

uint64_t initializeWithCopy for SizerResultText(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  void *v4;
  id v5;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  v4 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v4;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  v5 = v4;
  return a1;
}

_QWORD *assignWithCopy for SizerResultText(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  v4 = (void *)a2[4];
  v5 = (void *)a1[4];
  a1[4] = v4;
  v6 = v4;

  a1[5] = a2[5];
  a1[6] = a2[6];
  return a1;
}

uint64_t assignWithTake for SizerResultText(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  void *v5;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);

  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for SizerResultText(uint64_t a1, int a2)
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
      v2 = *(_QWORD *)(a1 + 32);
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

uint64_t storeEnumTagSinglePayload for SizerResultText(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SizerResultText()
{
  return &type metadata for SizerResultText;
}

ValueMetadata *type metadata accessor for OffsetScaleSizer()
{
  return &type metadata for OffsetScaleSizer;
}

uint64_t sub_1BA199328(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v8 = *a1;
  v9 = v3[3];
  v10 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v9);
  result = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v10 + 8))(a1, a2, a3, *(_QWORD *)(v8 + 80), *(_QWORD *)(v8 + 88), v9, v10);
  if (!v4)
    return sub_1BA1709C8((uint64_t)&unk_1E71E2840, result);
  return result;
}

_QWORD *sub_1BA1993C0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = v4;
  v11 = *a1;
  v12 = v6[3];
  v13 = v6[4];
  __swift_project_boxed_opaque_existential_1(v6, v12);
  result = (*(_QWORD *(**)(uint64_t *__return_ptr, uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v13 + 16))(&v19, a1, a2, a3, *(_QWORD *)(v11 + 80), *(_QWORD *)(v11 + 88), v12, v13);
  if (!v5)
  {
    v15 = v19;
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v15;
    v17 = v6[5];
    v18 = v6[6];
    result = (_QWORD *)swift_allocObject();
    result[2] = v17;
    result[3] = v18;
    *(_QWORD *)(v16 + 24) = sub_1BA1996AC;
    *(_QWORD *)(v16 + 32) = result;
    *a4 = v16 | 0x7000000000000000;
  }
  return result;
}

CGFloat sub_1BA1994B8(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  CGFloat v9;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  v9 = CGRectGetWidth(*(CGRect *)&a1) * a5;
  v11.origin.x = a1;
  v11.origin.y = a2;
  v11.size.width = a3;
  v11.size.height = a4;
  CGRectGetHeight(v11);
  v12.origin.x = a1;
  v12.origin.y = a2;
  v12.size.width = a3;
  v12.size.height = a4;
  CGRectGetWidth(v12);
  v13.origin.x = a1;
  v13.origin.y = a2;
  v13.size.width = a3;
  v13.size.height = a4;
  CGRectGetHeight(v13);
  return v9 + a1;
}

uint64_t sub_1BA199574(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_1BA199328(a1, a2, a3);
}

_QWORD *sub_1BA199588@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1BA1993C0(a1, a2, a3, a4);
}

uint64_t sub_1BA19959C()
{
  sub_1BA19AEA0();
  sub_1BA17C214();
  OUTLINED_FUNCTION_1_20();
  sub_1BA19ABD0();
  type metadata accessor for CGPoint(0);
  OUTLINED_FUNCTION_1_20();
  sub_1BA19ABD0();
  return 0;
}

uint64_t sub_1BA19966C()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BA19969C()
{
  return swift_deallocObject();
}

CGFloat sub_1BA1996AC(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  uint64_t v4;

  return sub_1BA1994B8(a1, a2, a3, a4, *(double *)(v4 + 16));
}

ValueMetadata *type metadata accessor for FlexibleCondition()
{
  return &type metadata for FlexibleCondition;
}

BOOL sub_1BA1996DC(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_1BA1996EC()
{
  return sub_1BA19B110();
}

uint64_t sub_1BA199710()
{
  sub_1BA19B104();
  sub_1BA19B110();
  return sub_1BA19B128();
}

BOOL sub_1BA199754(char *a1, char *a2)
{
  return sub_1BA1996DC(*a1, *a2);
}

uint64_t sub_1BA199760()
{
  return sub_1BA199710();
}

uint64_t sub_1BA199768()
{
  return sub_1BA1996EC();
}

BOOL sub_1BA199770(uint64_t a1, uint64_t a2, char a3)
{
  double Height;

  if (!a3)
  {
    if ((*(_BYTE *)(a1 + 48) & 1) == 0)
      goto LABEL_3;
LABEL_5:
    Height = CGRectGetHeight(*(CGRect *)(a1 + 96));
    return Height == 1.79769313e308;
  }
  if (a3 != 1)
    goto LABEL_5;
LABEL_3:
  Height = CGRectGetWidth(*(CGRect *)(a1 + 96));
  return Height == 1.79769313e308;
}

BOOL sub_1BA1997C4(uint64_t a1, uint64_t a2)
{
  char *v2;

  return sub_1BA199770(a1, a2, *v2);
}

uint64_t _s11TeaTemplate17FlexibleConditionV15DirectionOptionOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BA199818 + 4 * byte_1BA19FE45[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1BA19984C + 4 * byte_1BA19FE40[v4]))();
}

uint64_t sub_1BA19984C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA199854(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA19985CLL);
  return result;
}

uint64_t sub_1BA199868(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA199870);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1BA199874(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA19987C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FlexibleCondition.DirectionOption()
{
  return &type metadata for FlexibleCondition.DirectionOption;
}

unint64_t sub_1BA19989C()
{
  unint64_t result;

  result = qword_1EF274A30;
  if (!qword_1EF274A30)
  {
    result = MEMORY[0x1BCCD6858](&unk_1BA19FEC4, &type metadata for FlexibleCondition.DirectionOption);
    atomic_store(result, (unint64_t *)&qword_1EF274A30);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for FastLayoutDecoder(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for FastLayoutDecoder(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
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
  *(_BYTE *)(result + 40) = v3;
  return result;
}

ValueMetadata *type metadata accessor for FastLayoutDecoder()
{
  return &type metadata for FastLayoutDecoder;
}

uint64_t LayoutContextRecords.records.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t LayoutContextRecords.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t LayoutContextRecord.identifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

void LayoutContextRecord.kind.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 32);
}

double LayoutContextRecord.startTime.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 40);
}

double LayoutContextRecord.endTime.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 48);
}

double LayoutContextRecord.durationInMilliseconds.getter()
{
  uint64_t v0;

  return (*(double *)(v0 + 48) - *(double *)(v0 + 40)) * 1000.0;
}

uint64_t LayoutContextRecord.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t LayoutContextRecord.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t method lookup function for LayoutContextRecords()
{
  return swift_lookUpClassMethod();
}

uint64_t type metadata accessor for LayoutContextRecord()
{
  return objc_opt_self();
}

uint64_t method lookup function for LayoutContextRecord()
{
  return swift_lookUpClassMethod();
}

uint64_t Canvas.description.getter()
{
  uint64_t v0;
  char v2;
  __int128 v3;
  _OWORD v4[2];
  char v5;

  if ((*(_BYTE *)(v0 + 33) & 1) != 0)
    return 0x746C7561666564;
  v2 = *(_BYTE *)(v0 + 32);
  v3 = *(_OWORD *)(v0 + 16);
  v4[0] = *(_OWORD *)v0;
  v4[1] = v3;
  v5 = v2 & 1;
  sub_1BA19ABD0();
  sub_1BA192668((uint64_t)v4);
  sub_1BA19ABD0();
  return 0;
}

__n128 __swift_memcpy34_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for Canvas(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 34))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Canvas(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_WORD *)(result + 32) = 0;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
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
  *(_BYTE *)(result + 34) = v3;
  return result;
}

uint64_t sub_1BA199B68(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t getEnumTagSinglePayload for Canvas.Options(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && a1[112])
    return (*(_DWORD *)a1 + 253);
  v3 = *a1;
  v4 = v3 >= 3;
  v5 = v3 - 3;
  if (!v4)
    v5 = -1;
  if (v5 + 1 >= 2)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Canvas.Options(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_OWORD *)(result + 80) = 0u;
    *(_OWORD *)(result + 96) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)result = 0u;
    *(_DWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 112) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 112) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 3;
  }
  return result;
}

uint64_t sub_1BA199C1C(unsigned __int8 *a1)
{
  unsigned int v1;

  v1 = *a1;
  if (v1 >= 3)
    return v1 - 2;
  else
    return 0;
}

double sub_1BA199C30(uint64_t a1, unsigned int a2)
{
  double result;

  if (a2 > 0xFD)
  {
    *(_QWORD *)(a1 + 104) = 0;
    result = 0.0;
    *(_OWORD *)(a1 + 88) = 0u;
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_QWORD *)a1 = a2 - 254;
  }
  else if (a2)
  {
    *(_BYTE *)a1 = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for Canvas.Options()
{
  return &type metadata for Canvas.Options;
}

double static CGSize.flexibleWidth(height:)()
{
  return 1.79769313e308;
}

uint64_t sub_1BA199C98(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_1BA199CE4(&qword_1EF274AF0, MEMORY[0x1E0C9BA08]);
  result = sub_1BA199CE4(&qword_1EF274AF8, MEMORY[0x1E0C9B9F0]);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1BA199CE4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for CGSize(255);
    result = MEMORY[0x1BCCD6858](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BA199D24(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(_QWORD *, uint64_t, uint64_t);
  _QWORD v12[5];

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 144);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](a2, a2);
  v7 = (char *)&v12[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAtKeyPath();
  v12[3] = v3;
  v12[4] = &protocol witness table for Node<A>;
  v12[0] = v2;
  v8 = *(_QWORD *)(v3 + 176);
  v9 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v8 + 8);
  swift_retain();
  v9(v12, v4, v8);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

void sub_1BA199DE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[28];
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

  v13 = a3;
  v19 = a2;
  v14 = a1;
  v4 = *(_QWORD **)v3;
  v10 = *(_QWORD *)(*(_QWORD *)v3 + 144);
  v9[23] = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  v9[21] = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = v4[20];
  v7 = v4[23];
  v8 = v4[24];
  v11 = v4[19];
  v12 = v7;
  v15 = v11;
  v16 = v6;
  v9[25] = v8;
  v9[26] = v6;
  v17 = v7;
  v18 = v8;
  type metadata accessor for Layout.InternalLayoutResult();
}

uint64_t sub_1BA199E98(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
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
  uint64_t (*v18)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  char v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  _BOOL4 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  _QWORD *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(uint64_t, uint64_t, double, double);
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  id v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __C::CGRect v83;
  CGRect v84;
  CGRect v85;

  *(_QWORD *)(v2 + 192) = a1;
  *(_QWORD *)(v2 + 176) = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  *(_QWORD *)(v2 + 216) = (char *)&v82 - v8;
  *(_QWORD *)(v2 + 272) = v3;
  v9 = v4[9];
  *(_QWORD *)(v2 + 232) = v4[8];
  *(_QWORD *)(v2 + 240) = v9;
  sub_1BA16AF64();
  v11 = v10;
  v12 = v4[6];
  *(_QWORD *)(v2 + 288) = v12;
  *(_QWORD *)(v2 + 416) = v12;
  v13 = *(_QWORD *)(v6 + 136);
  v14 = *(_QWORD *)(v6 + 168);
  *(_QWORD *)(v2 + 280) = type metadata accessor for Sizing(0, v13, v14, v15);
  sub_1BA16A170();
  v17 = *(_QWORD *)(v5 + 144);
  v16 = *(_QWORD *)(v5 + 152);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + 536), v17);
  v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 8);
  v19 = *(_QWORD *)(v2 + 312);
  v20 = *(_QWORD *)(v7 - 72);
  *(_QWORD *)(v2 + 304) = v11;
  v21 = *(_QWORD *)(v2 + 296);
  v22 = v18(v19, v20, v11, v13, v14, v17, v16);
  if (v21)
  {
    swift_release();
    return OUTLINED_FUNCTION_0_46();
  }
  *(_QWORD *)(v2 + 296) = v22;
  *(_QWORD *)(v2 + 152) = v6;
  *(_QWORD *)(v2 + 160) = v4;
  OUTLINED_FUNCTION_0_46();
  *(_QWORD *)(v2 + 416) = *(_QWORD *)(v2 + 288);
  sub_1BA16A170();
  v23 = *(_QWORD *)(v2 + 560);
  v24 = *(_QWORD *)(v2 + 568);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + 536), v23);
  v25 = *(_QWORD *)(v2 + 312);
  (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 16))(v25, *(_QWORD *)(v7 - 72), *(_QWORD *)(v2 + 304), v13, v14, v23, v24);
  v27 = *(_QWORD *)(v2 + 416);
  OUTLINED_FUNCTION_0_46();
  *(_QWORD *)(v2 + 536) = v27;
  SizerResult.isAmbiguous.getter();
  if ((v28 & 1) != 0)
  {
    OUTLINED_FUNCTION_3_7();
    OUTLINED_FUNCTION_11_13();
    swift_release();
    return swift_retain();
  }
  *(_QWORD *)v2 = v14;
  *(_QWORD *)(v2 + 8) = v13;
  *(_QWORD *)(v2 + 536) = v27;
  *(_QWORD *)(v2 + 416) = v27;
  swift_retain();
  SizerResult.nonIntegral.getter();
  sub_1BA16AA5C();
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  swift_release();
  v37 = *(_QWORD *)(v2 + 160);
  v38 = *(_QWORD *)(v37 + 16);
  *(_QWORD *)(v2 + 16) = *(_QWORD *)(v37 + 24);
  *(_QWORD *)(v2 + 24) = v38;
  LayoutContext.contextFrame(for:)();
  *(_QWORD *)(v2 + 280) = v27 & 0xFFFFFFFFFFFFFFFLL;
  *(_QWORD *)(v2 + 288) = v27;
  if (v39)
  {
    *(_QWORD *)(v2 + 536) = v27;
    v83.origin.x = v30;
    v83.origin.y = v32;
    v83.size.width = v34;
    v83.size.height = v36;
    SizerResult.postProcess(frame:nonIntegral:)(v83, 0);
    v41 = *(_QWORD *)(v2 + 240);
    if (v40)
    {
      OUTLINED_FUNCTION_2();

      v42 = *(_QWORD *)(v2 + 232);
    }
    else
    {
      sub_1BA182DA0();
      v84.origin.x = OUTLINED_FUNCTION_0_21();
      v43 = CGRectEqualToRect(v84, v85);
      v42 = *(_QWORD *)(v2 + 232);
      if (v43)
      {
        OUTLINED_FUNCTION_0_21();
        sub_1BA17FE6C(*(_QWORD *)(v2 + 296));
        OUTLINED_FUNCTION_3_7();
        swift_bridgeObjectRelease();
        swift_release();
        OUTLINED_FUNCTION_2();
        return 0;
      }
      OUTLINED_FUNCTION_2();
    }
  }
  else
  {
    v42 = *(_QWORD *)(v2 + 232);
    v41 = *(_QWORD *)(v2 + 240);
  }
  sub_1BA16D270(v37, *(_QWORD *)(v2 + 264), v42, v41);
  v44 = *(_OWORD *)(v25 + 144);
  *(_OWORD *)(v2 + 80) = *(_OWORD *)(v25 + 160);
  *(_OWORD *)(v2 + 96) = v44;
  v45 = *(_OWORD *)(v25 + 176);
  v46 = *(_QWORD *)(v25 + 192);
  v47 = *(_QWORD *)(v25 + 200);
  v48 = *(_QWORD *)(v25 + 208);
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(v25 + 216);
  *(_OWORD *)(v2 + 64) = v45;
  v49 = *(_QWORD *)(v25 + 232);
  v50 = *(_QWORD *)(v25 + 240);
  v51 = *(_QWORD *)(v25 + 272);
  *(_QWORD *)(v2 + 112) = *(_QWORD *)(v25 + 264);
  *(_OWORD *)(v2 + 32) = *(_OWORD *)(v25 + 280);
  *(CGFloat *)(v2 + 120) = v32;
  *(CGFloat *)(v2 + 128) = v30;
  v52 = *(_QWORD *)(v25 + 296);
  v53 = *(_QWORD *)(v25 + 304);
  v54 = *(_BYTE *)(v25 + 312);
  *(_QWORD *)(v2 + 536) = 0xF000000000000007;
  *(_QWORD *)(v2 + 416) = 0xF000000000000007;
  *(_QWORD *)(v2 + 368) = 0xF000000000000007;
  *(_QWORD *)(v2 + 328) = 0xF000000000000007;
  type metadata accessor for LayoutMarginAdjuster();
  OUTLINED_FUNCTION_6();
  v55 = LayoutMarginAdjuster.init(top:left:bottom:right:)((_QWORD *)(v2 + 536), (uint64_t *)(v2 + 416), (uint64_t *)(v2 + 368), (uint64_t *)(v2 + 328));
  *(CGFloat *)(v2 + 136) = v36;
  *(CGFloat *)(v2 + 144) = v34;
  *(CGFloat *)(v2 + 536) = v34;
  *(CGFloat *)(v2 + 544) = v36;
  *(_OWORD *)(v2 + 552) = *(_OWORD *)(v2 + 96);
  *(_OWORD *)(v2 + 568) = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v2 + 584) = *(_OWORD *)(v2 + 64);
  *(_QWORD *)(v2 + 600) = v46;
  *(_QWORD *)(v2 + 608) = v47;
  *(_QWORD *)(v2 + 96) = v48;
  *(_QWORD *)(v2 + 616) = v48;
  *(_OWORD *)(v2 + 624) = *(_OWORD *)(v2 + 48);
  *(_QWORD *)(v2 + 640) = v49;
  *(_QWORD *)(v2 + 648) = v50;
  *(_QWORD *)(v2 + 656) = 0;
  *(_QWORD *)(v2 + 664) = 0;
  *(_QWORD *)(v2 + 672) = *(_QWORD *)(v2 + 112);
  *(_QWORD *)(v2 + 680) = v51;
  *(_QWORD *)(v2 + 112) = v51;
  *(_OWORD *)(v2 + 688) = *(_OWORD *)(v2 + 32);
  *(_QWORD *)(v2 + 704) = v52;
  *(_QWORD *)(v2 + 712) = v53;
  *(_BYTE *)(v2 + 720) = v54;
  *(_QWORD *)(v2 + 728) = v55;
  v56 = *(_OWORD *)(v25 + 344);
  *(_OWORD *)(v2 + 416) = *(_OWORD *)(v25 + 328);
  *(_OWORD *)(v2 + 432) = v56;
  v57 = *(_OWORD *)(v25 + 376);
  *(_OWORD *)(v2 + 448) = *(_OWORD *)(v25 + 360);
  v58 = *(_OWORD *)(v25 + 392);
  v59 = *(_OWORD *)(v25 + 408);
  *(_OWORD *)(v2 + 464) = v57;
  *(_OWORD *)(v2 + 480) = v58;
  v60 = *(_OWORD *)(v25 + 424);
  *(_OWORD *)(v2 + 496) = v59;
  *(_OWORD *)(v2 + 512) = v60;
  *(_BYTE *)(v2 + 415) = *(_BYTE *)(v25 + 48);
  sub_1BA16AECC(v25 + 544, v2 + 328);
  v61 = *(_QWORD *)(v2 + 352);
  if (v61)
  {
    v62 = *(_QWORD *)(v2 + 360);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + 328), *(_QWORD *)(v2 + 352));
    v63 = v25;
    v64 = *(void (**)(uint64_t, uint64_t, double, double))(v62 + 24);
    v65 = *(id *)(v2 + 96);
    v66 = *(id *)(v2 + 112);
    v68 = *(_QWORD *)(v2 + 120);
    v67 = *(_QWORD *)(v2 + 128);
    v64(v61, v62, *(double *)&v67, *(double *)&v68);
    v25 = v63;
    __swift_destroy_boxed_opaque_existential_1(v2 + 328);
    v70 = *(_QWORD *)(v2 + 288);
    v71 = *(_QWORD *)(v2 + 256);
  }
  else
  {
    v72 = *(id *)(v2 + 96);
    v73 = *(id *)(v2 + 112);
    sub_1BA16AE90(v2 + 328);
    *(_OWORD *)(v2 + 368) = 0u;
    *(_OWORD *)(v2 + 384) = 0u;
    *(_QWORD *)(v2 + 400) = 0;
    v70 = *(_QWORD *)(v2 + 288);
    v71 = *(_QWORD *)(v2 + 256);
    v68 = *(_QWORD *)(v2 + 120);
    v67 = *(_QWORD *)(v2 + 128);
  }
  type metadata accessor for Cursor(0, *(_QWORD *)(v2 + 248), v71, v69);
  *(_QWORD *)(v2 + 328) = v70;
  SizerResult.behavior.getter();
  v74 = *(_BYTE *)(v2 + 327);
  *(_BYTE *)(v2 + 324) = *(_BYTE *)(v2 + 326);
  *(_BYTE *)(v2 + 325) = v74;
  v75 = OUTLINED_FUNCTION_6();
  *(_QWORD *)(v75 + 16) = *(_QWORD *)(v25 + 88);
  *(_QWORD *)(v2 + 328) = v75 | 0x4000000000000000;
  *(_QWORD *)(v2 + 312) = sub_1BA180820(v2 + 536, (__int128 *)(v2 + 416), (char *)(v2 + 415), v2 + 368, v67, v68, 0, (char *)(v2 + 324), (uint64_t *)(v2 + 328), 0);
  v76 = *(_QWORD *)(**(_QWORD **)(v2 + 272) + 48);
  type metadata accessor for LayoutContext();
  OUTLINED_FUNCTION_6();
  result = sub_1BA167F50(v76);
  *(_QWORD *)(v2 + 368) = result;
  v77 = *(_QWORD *)(v2 + 264);
  *(_QWORD *)(v2 + 128) = v77 + 1;
  if (!__OFADD__(v77, 1))
  {
    *(_QWORD *)(v2 + 560) = &unk_1E71E8DC0;
    *(_QWORD *)(v2 + 568) = &off_1E71E8E38;
    v78 = (_QWORD *)OUTLINED_FUNCTION_6();
    v79 = *(_QWORD *)(v2 + 248);
    v78[2] = *(_QWORD *)(v2 + 224);
    v78[3] = v79;
    v78[4] = *(_QWORD *)(v2 + 208);
    v80 = *(_QWORD *)(v2 + 256);
    v78[5] = *(_QWORD *)(*(_QWORD *)(v2 + 152) + 176);
    v78[6] = v80;
    v81 = *(_QWORD *)(v2 + 288);
    v78[7] = *(_QWORD *)(v2 + 200);
    v78[8] = v81;
    v78[9] = v25;
    swift_retain();
    OUTLINED_FUNCTION_4_3();
    OUTLINED_FUNCTION_4_1();
    OUTLINED_FUNCTION_4_3();
    sub_1BA192A08(*(_QWORD *)(v2 + 312), *(_QWORD *)(v2 + 128), v2 + 368, v2 + 536, (uint64_t)sub_1BA19AA5C, (uint64_t)v78, *(_QWORD *)(v2 + 216));
  }
  __break(1u);
  return result;
}

void sub_1BA19A7EC(CGFloat *a1@<X8>, double a2@<D0>)
{
  uint64_t v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __C::CGRect v15;

  v15 = SizerResult.postProcess(frame:nonIntegral:)(*(__C::CGRect *)&a2, 0);
  if (!v6)
  {
    x = v15.origin.x;
    y = v15.origin.y;
    width = v15.size.width;
    height = v15.size.height;
    sub_1BA182DA0();
    *a1 = x;
    a1[1] = y;
    a1[2] = width;
    a1[3] = height;
    *((_QWORD *)a1 + 4) = v11;
    *((_QWORD *)a1 + 5) = v12;
    *((_QWORD *)a1 + 6) = v13;
    *((_QWORD *)a1 + 7) = v14;
  }
}

void sub_1BA19A874()
{
  swift_initStackObject();
  sub_1BA19A890();
}

void sub_1BA19A890()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1BA19A8BC()
{
  uint64_t v0;

  swift_release();
  sub_1BA19AA80(*(_QWORD *)(v0 + 48));
  swift_release();
  swift_bridgeObjectRelease();
  return sub_1BA162F64(*(_QWORD *)(v0 + 80));
}

uint64_t sub_1BA19A8F0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  sub_1BA19AEA0();
  sub_1BA19ABD0();
  sub_1BA19B170();
  sub_1BA19ABD0();
  swift_bridgeObjectRelease();
  sub_1BA19ABD0();
  v3 = type metadata accessor for Sizing(0, *(_QWORD *)(v1 + 136), *(_QWORD *)(v1 + 168), v2);
  MEMORY[0x1BCCD6858](&protocol conformance descriptor for Sizing<A>, v3);
  sub_1BA19AFFC();
  sub_1BA19ABD0();
  return 0;
}

uint64_t sub_1BA19A9E4()
{
  return sub_1BA19A8F0();
}

uint64_t sub_1BA19AA04()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BA19AA2C()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_1BA19AA5C(CGFloat *a1@<X8>, double a2@<D0>)
{
  sub_1BA19A7EC(a1, a2);
}

unint64_t sub_1BA19AA80(unint64_t result)
{
  switch((result >> 59) & 0x1E | (result >> 2) & 1)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
      result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BA19AABC()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1BA19AAC8()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1BA19AAD4()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1BA19AAE0()
{
  return MEMORY[0x1E0DB3828]();
}

uint64_t sub_1BA19AAEC()
{
  return MEMORY[0x1E0DF2078]();
}

uint64_t sub_1BA19AAF8()
{
  return MEMORY[0x1E0DBC450]();
}

uint64_t sub_1BA19AB04()
{
  return MEMORY[0x1E0DE9D70]();
}

uint64_t sub_1BA19AB10()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1BA19AB1C()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1BA19AB28()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1BA19AB34()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1BA19AB40()
{
  return MEMORY[0x1E0DE9EC0]();
}

uint64_t sub_1BA19AB4C()
{
  return MEMORY[0x1E0DEA038]();
}

uint64_t sub_1BA19AB58()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1BA19AB64()
{
  return MEMORY[0x1E0DEA360]();
}

uint64_t sub_1BA19AB70()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1BA19AB7C()
{
  return MEMORY[0x1E0DEA3C8]();
}

uint64_t sub_1BA19AB88()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1BA19AB94()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1BA19ABA0()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1BA19ABAC()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1BA19ABB8()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1BA19ABC4()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1BA19ABD0()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1BA19ABDC()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t sub_1BA19ABE8()
{
  return MEMORY[0x1E0DB51B0]();
}

uint64_t sub_1BA19ABF4()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t sub_1BA19AC00()
{
  return MEMORY[0x1E0DEAB28]();
}

uint64_t sub_1BA19AC0C()
{
  return MEMORY[0x1E0DEAB50]();
}

uint64_t sub_1BA19AC18()
{
  return MEMORY[0x1E0DEACC0]();
}

uint64_t sub_1BA19AC24()
{
  return MEMORY[0x1E0DEAD00]();
}

uint64_t sub_1BA19AC30()
{
  return MEMORY[0x1E0DEAD08]();
}

uint64_t sub_1BA19AC3C()
{
  return MEMORY[0x1E0DEAD10]();
}

uint64_t sub_1BA19AC48()
{
  return MEMORY[0x1E0DEAD38]();
}

uint64_t sub_1BA19AC54()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1BA19AC60()
{
  return MEMORY[0x1E0DEADA8]();
}

uint64_t sub_1BA19AC6C()
{
  return MEMORY[0x1E0DEADC0]();
}

uint64_t sub_1BA19AC78()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_1BA19AC84()
{
  return MEMORY[0x1E0DEADD8]();
}

uint64_t sub_1BA19AC90()
{
  return MEMORY[0x1E0DEAE08]();
}

uint64_t sub_1BA19AC9C()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1BA19ACA8()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_1BA19ACB4()
{
  return MEMORY[0x1E0DEAE78]();
}

uint64_t sub_1BA19ACC0()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_1BA19ACCC()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t sub_1BA19ACD8()
{
  return MEMORY[0x1E0DEAEA8]();
}

uint64_t sub_1BA19ACE4()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1BA19ACF0()
{
  return MEMORY[0x1E0DEAFE8]();
}

uint64_t sub_1BA19ACFC()
{
  return MEMORY[0x1E0DEB120]();
}

uint64_t sub_1BA19AD08()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_1BA19AD14()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_1BA19AD20()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_1BA19AD2C()
{
  return MEMORY[0x1E0DEB620]();
}

uint64_t sub_1BA19AD38()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t sub_1BA19AD44()
{
  return MEMORY[0x1E0DEB6A8]();
}

uint64_t sub_1BA19AD50()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_1BA19AD5C()
{
  return MEMORY[0x1E0DEB848]();
}

uint64_t sub_1BA19AD68()
{
  return MEMORY[0x1E0DBCAF0]();
}

uint64_t sub_1BA19AD74()
{
  return MEMORY[0x1E0DBCB18]();
}

uint64_t sub_1BA19AD80()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1BA19AD8C()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1BA19AD98()
{
  return MEMORY[0x1E0C9B980]();
}

uint64_t sub_1BA19ADA4()
{
  return MEMORY[0x1E0DBCCE0]();
}

uint64_t sub_1BA19ADB0()
{
  return MEMORY[0x1E0DBCCE8]();
}

uint64_t sub_1BA19ADBC()
{
  return MEMORY[0x1E0DBCCF8]();
}

uint64_t sub_1BA19ADC8()
{
  return MEMORY[0x1E0DBCD38]();
}

uint64_t sub_1BA19ADD4()
{
  return MEMORY[0x1E0DBCD40]();
}

uint64_t sub_1BA19ADE0()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1BA19ADEC()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1BA19ADF8()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1BA19AE04()
{
  return MEMORY[0x1E0DEBD70]();
}

uint64_t sub_1BA19AE10()
{
  return MEMORY[0x1E0DEBD90]();
}

uint64_t sub_1BA19AE1C()
{
  return MEMORY[0x1E0DEBDF8]();
}

uint64_t sub_1BA19AE28()
{
  return MEMORY[0x1E0DEBE00]();
}

uint64_t sub_1BA19AE34()
{
  return MEMORY[0x1E0DEBE10]();
}

uint64_t sub_1BA19AE40()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1BA19AE4C()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1BA19AE58()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1BA19AE64()
{
  return MEMORY[0x1E0DEC130]();
}

uint64_t sub_1BA19AE70()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1BA19AE7C()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1BA19AE88()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1BA19AE94()
{
  return MEMORY[0x1E0DEC268]();
}

uint64_t sub_1BA19AEA0()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1BA19AEAC()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_1BA19AEB8()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1BA19AEC4()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1BA19AED0()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1BA19AEDC()
{
  return MEMORY[0x1E0DEC680]();
}

uint64_t sub_1BA19AEE8()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1BA19AEF4()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1BA19AF00()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1BA19AF0C()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t sub_1BA19AF18()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t sub_1BA19AF24()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t sub_1BA19AF30()
{
  return MEMORY[0x1E0DEC888]();
}

uint64_t sub_1BA19AF3C()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1BA19AF48()
{
  return MEMORY[0x1E0DEC990]();
}

uint64_t sub_1BA19AF54()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_1BA19AF60()
{
  return MEMORY[0x1E0DECAF8]();
}

uint64_t sub_1BA19AF6C()
{
  return MEMORY[0x1E0DECB00]();
}

uint64_t sub_1BA19AF78()
{
  return MEMORY[0x1E0DECB20]();
}

uint64_t sub_1BA19AF84()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1BA19AF90()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1BA19AF9C()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1BA19AFA8()
{
  return MEMORY[0x1E0DECD90]();
}

uint64_t sub_1BA19AFB4()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1BA19AFC0()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1BA19AFCC()
{
  return MEMORY[0x1E0DED058]();
}

uint64_t sub_1BA19AFD8()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1BA19AFE4()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_1BA19AFF0()
{
  return MEMORY[0x1E0DED548]();
}

uint64_t sub_1BA19AFFC()
{
  return MEMORY[0x1E0DED550]();
}

uint64_t sub_1BA19B008()
{
  return MEMORY[0x1E0DED5C0]();
}

uint64_t sub_1BA19B014()
{
  return MEMORY[0x1E0DED5F8]();
}

uint64_t sub_1BA19B020()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1BA19B02C()
{
  return MEMORY[0x1E0DED788]();
}

uint64_t sub_1BA19B038()
{
  return MEMORY[0x1E0DED7D0]();
}

uint64_t sub_1BA19B044()
{
  return MEMORY[0x1E0DED7D8]();
}

uint64_t sub_1BA19B050()
{
  return MEMORY[0x1E0DED7E0]();
}

uint64_t sub_1BA19B05C()
{
  return MEMORY[0x1E0DED7F0]();
}

uint64_t sub_1BA19B068()
{
  return MEMORY[0x1E0DED7F8]();
}

uint64_t sub_1BA19B074()
{
  return MEMORY[0x1E0DED800]();
}

uint64_t sub_1BA19B080()
{
  return MEMORY[0x1E0DED820]();
}

uint64_t sub_1BA19B08C()
{
  return MEMORY[0x1E0DED848]();
}

uint64_t sub_1BA19B098()
{
  return MEMORY[0x1E0DED858]();
}

uint64_t sub_1BA19B0A4()
{
  return MEMORY[0x1E0DED860]();
}

uint64_t sub_1BA19B0B0()
{
  return MEMORY[0x1E0DED9E8]();
}

uint64_t sub_1BA19B0BC()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1BA19B0C8()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1BA19B0D4()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1BA19B0E0()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1BA19B0EC()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1BA19B0F8()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1BA19B104()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1BA19B110()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1BA19B11C()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_1BA19B128()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1BA19B134()
{
  return MEMORY[0x1E0DEDF80]();
}

uint64_t sub_1BA19B140()
{
  return MEMORY[0x1E0DEDFF8]();
}

uint64_t sub_1BA19B14C()
{
  return MEMORY[0x1E0DEE000]();
}

uint64_t sub_1BA19B158()
{
  return MEMORY[0x1E0DEE8B8]();
}

uint64_t sub_1BA19B164()
{
  return MEMORY[0x1E0DEE8C8]();
}

uint64_t sub_1BA19B170()
{
  return MEMORY[0x1E0DEE978]();
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFArrayRef CTFrameGetLines(CTFrameRef frame)
{
  return (CFArrayRef)MEMORY[0x1E0CA7DB0](frame);
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x1E0CA7DD8](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x1E0CA7DE0](attrString);
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x1E0DEE9F8]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
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

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x1E0DEEB90]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x1E0DEEBD0]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1E0DEEC60]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1E0DEED28]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

