uint64_t destroy for SymbolIconView.SymbolIconMetrics.Input()
{
  return swift_bridgeObjectRelease();
}

void type metadata accessor for IconSize()
{
  OUTLINED_FUNCTION_49();
}

void type metadata accessor for IconView()
{
  OUTLINED_FUNCTION_49();
}

ValueMetadata *type metadata accessor for TopHitCollectionViewStyle()
{
  return &type metadata for TopHitCollectionViewStyle;
}

uint64_t sub_20CE12118(uint64_t result, unsigned int a2)
{
  char v2;

  if (a2 < 4)
  {
    v2 = *(_BYTE *)(result + 16) & 1 | (32 * a2);
  }
  else
  {
    *(_QWORD *)result = a2 - 4;
    *(_QWORD *)(result + 8) = 0;
    v2 = 0x80;
  }
  *(_BYTE *)(result + 16) = v2;
  return result;
}

uint64_t _s16MaskShapeContextOwet(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_20CE121C8(uint64_t result)
{
  *(_BYTE *)(result + 16) &= 0x1Fu;
  return result;
}

uint64_t sub_20CE121D8(uint64_t a1)
{
  unsigned int v1;
  int v2;
  unsigned int v3;

  v1 = *(unsigned __int8 *)(a1 + 16);
  v2 = (char)v1;
  v3 = v1 >> 5;
  if (v2 >= 0)
    return v3;
  else
    return (*(_DWORD *)a1 + 4);
}

uint64_t _s16MaskShapeContextOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20CE12244 + 4 * byte_20CE6BDE5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_20CE12278 + 4 * byte_20CE6BDE0[v4]))();
}

uint64_t sub_20CE12278(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CE12280(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20CE12288);
  return result;
}

uint64_t sub_20CE12294(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20CE1229CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_20CE122A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CE122A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for IconView.DisplayMode()
{
  OUTLINED_FUNCTION_49();
}

ValueMetadata *type metadata accessor for EnvironmentValues.MaskShapeContext()
{
  return &type metadata for EnvironmentValues.MaskShapeContext;
}

uint64_t sub_20CE122D0(uint64_t result, int a2)
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

_BYTE *sub_20CE122F4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void type metadata accessor for IconCornerRadiusRatio()
{
  OUTLINED_FUNCTION_49();
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for ProbablyAlignedSymbol()
{
  return &type metadata for ProbablyAlignedSymbol;
}

uint64_t sub_20CE1233C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

void sub_20CE1235C(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
}

_BYTE *sub_20CE1236C@<X0>(_BYTE *a1@<X8>)
{
  _BYTE *result;

  result = sub_20CE2F034();
  *a1 = *result;
  return result;
}

_BYTE *sub_20CE12394@<X0>(_BYTE *a1@<X8>)
{
  _BYTE *result;

  result = sub_20CE2EEE8();
  *a1 = *result;
  return result;
}

uint64_t sub_20CE123BC(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
    *(_BYTE *)(result + 8) = 0;
  }
  else
  {
    if (!a2)
      return result;
    v2 = (a2 - 1);
  }
  *(_QWORD *)result = v2;
  return result;
}

uint64_t sub_20CE123E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_20CE180FC(*(uint64_t **)(v1 + 32), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1, *(double *)(v1 + 40), *(double *)(v1 + 48));
}

BOOL static TopHitCollectionViewStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

ValueMetadata *type metadata accessor for TopHitViewIconBackgroundStyle()
{
  return &type metadata for TopHitViewIconBackgroundStyle;
}

double TopHitCollectionViewStyle.contentViewHorizontalPadding.getter()
{
  char *v0;

  return dbl_20CE6D170[*v0];
}

id TopHitViewColorScheme.entityIconForeground.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 8);
}

uint64_t ProbablyAlignedSymbol.init(symbolName:fontSize:fontWeight:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = a2;
  *(double *)(a3 + 16) = a4;
  *(double *)(a3 + 24) = a5;
  return result;
}

double IconCornerRadiusRatio.value.getter()
{
  _BYTE *v0;

  if ((v0[8] & 1) != 0)
    return dbl_20CE6BDA8[*(_QWORD *)v0];
  else
    return *(double *)v0;
}

ValueMetadata *type metadata accessor for SymbolIconView()
{
  return &type metadata for SymbolIconView;
}

ValueMetadata *type metadata accessor for ImageIconView()
{
  return &type metadata for ImageIconView;
}

void type metadata accessor for AppIconView()
{
  OUTLINED_FUNCTION_49();
}

ValueMetadata *type metadata accessor for WorkflowGlyphIconView()
{
  return &type metadata for WorkflowGlyphIconView;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_20CE12644(a1, &qword_253CFA460);
}

ValueMetadata *type metadata accessor for TopHitViewIconBackgroundStyle.Resolved()
{
  return &type metadata for TopHitViewIconBackgroundStyle.Resolved;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

void type metadata accessor for WFIconColorBackgroundBlendMode(uint64_t a1)
{
  sub_20CE12644(a1, &qword_254996528);
}

double TopHitCollectionViewStyle.rowSpacing.getter()
{
  return 24.0;
}

double TopHitCollectionViewStyle.contentViewVerticalPadding.getter()
{
  char *v0;

  return dbl_20CE6D188[*v0];
}

uint64_t type metadata accessor for RoundedBackgroundIconView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for RoundedBackgroundIconView);
}

uint64_t sub_20CE12520()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20CE12554()
{
  return swift_allocateGenericValueMetadata();
}

id TopHitViewColorScheme.platterBackgroundGradient.getter()
{
  id *v0;

  return *v0;
}

uint64_t sub_20CE12564()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20CE12598()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_20CE125A0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20CE675F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

id sub_20CE12614()
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEC1350]), sel_init);
  qword_25499A198 = (uint64_t)result;
  return result;
}

void sub_20CE12644(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
  OUTLINED_FUNCTION_4();
}

void sub_20CE12684()
{
  unint64_t v0;
  unint64_t v1;

  sub_20CE12734(319, (unint64_t *)&qword_253CFA248, (void (*)(uint64_t))MEMORY[0x24BDEB418]);
  if (v0 <= 0x3F)
  {
    sub_20CE12734(319, &qword_253CFA258, (void (*)(uint64_t))MEMORY[0x24BDEEE00]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_20CE12734(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_20CE66E58();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t WFIconColorBackgroundBlendMode.blendMode.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  switch(a1)
  {
    case 2:
      v3 = (unsigned int *)MEMORY[0x24BDF5080];
      goto LABEL_5;
    case 1:
      v3 = (unsigned int *)MEMORY[0x24BDF5098];
LABEL_5:
      v4 = *v3;
LABEL_8:
      v5 = sub_20CE675F0();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(a2, v4, v5);
    case 0:
      v4 = *MEMORY[0x24BDF50D0];
      goto LABEL_8;
  }
  type metadata accessor for WFIconColorBackgroundBlendMode(0);
  result = sub_20CE6789C();
  __break(1u);
  return result;
}

void sub_20CE128E8(_BYTE *a1@<X8>)
{
  char v2;

  EnvironmentValues.maskShapeContext.getter();
  *a1 = v2;
  OUTLINED_FUNCTION_1_1();
}

unint64_t sub_20CE12918()
{
  unint64_t result;

  result = qword_254996CC0;
  if (!qword_254996CC0)
  {
    result = MEMORY[0x212B97A80](&unk_20CE6BFFC, &_s19MaskShapeContextKeyVN);
    atomic_store(result, (unint64_t *)&qword_254996CC0);
  }
  return result;
}

void sub_20CE12954(uint64_t a1@<X8>)
{
  char v2;

  *(_QWORD *)a1 = EnvironmentValues.symbolIconFontWeight.getter();
  *(_BYTE *)(a1 + 8) = v2 & 1;
  OUTLINED_FUNCTION_4();
}

unint64_t sub_20CE12980()
{
  unint64_t result;

  result = qword_253CFA348;
  if (!qword_253CFA348)
  {
    result = MEMORY[0x212B97A80](&unk_20CE6BBBC, &_s23SymbolIconFontWeightKeyVN);
    atomic_store(result, (unint64_t *)&qword_253CFA348);
  }
  return result;
}

uint64_t destroy for TopHitViewIconBackgroundStyle()
{
  swift_release();
  return swift_release();
}

uint64_t TopHitViewColorScheme.entityIconBackground.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = v1[3];
  v4 = v1[4];
  v3 = v1[5];
  *a1 = v1[2];
  a1[1] = v2;
  a1[2] = v4;
  a1[3] = v3;
  swift_retain();
  return OUTLINED_FUNCTION_8_4();
}

id static TopHitViewColorScheme.default(for:style:)@<X0>(void *a1@<X0>, unsigned __int8 *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  int *v41;
  uint64_t v42;
  uint64_t *v43;
  void *v44;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  char *v55;
  uint64_t *v56;
  uint64_t v57;
  id v58;

  v58 = a1;
  v5 = OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v6);
  v56 = (uint64_t *)((char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v8);
  v55 = (char *)&v51 - v9;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (uint64_t *)((char *)&v51 - v11);
  v13 = *a2;
  v14 = sub_20CE673E0();
  v15 = type metadata accessor for TopHitViewTextStyle.Resolved(0);
  v16 = (uint64_t)v12 + *(int *)(v15 + 20);
  v17 = *MEMORY[0x24BDF50D0];
  sub_20CE675F0();
  OUTLINED_FUNCTION_9_2(v16, v17);
  *v12 = v14;
  v18 = sub_20CE673F8();
  v57 = v5;
  v19 = *(int *)(v5 + 20);
  v20 = v58;
  v21 = (uint64_t *)((char *)v12 + v19);
  OUTLINED_FUNCTION_9_2((uint64_t)v12 + v19 + *(int *)(v15 + 20), v17);
  *v21 = v18;
  v22 = objc_msgSend(v20, sel_colorWithAlphaComponent_, 0.1);
  MEMORY[0x212B96C94](objc_msgSend(v22, sel_platformColor));

  if (v13)
  {
    v23 = objc_allocWithZone(MEMORY[0x24BEC1398]);
    OUTLINED_FUNCTION_52_1();
    if (v13 == 1)
    {
      v24 = objc_msgSend(v23, sel_initWithSystemColor_, 17);
      objc_msgSend(objc_allocWithZone(MEMORY[0x24BEC14B0]), sel_initWithColor_, v24);

      OUTLINED_FUNCTION_0_7();
      OUTLINED_FUNCTION_23_1();
      OUTLINED_FUNCTION_21_1(v25, v26);
      OUTLINED_FUNCTION_11_3();
      OUTLINED_FUNCTION_1_7();
      *((_BYTE *)a3 + v27) = 1;
    }
    else
    {
      v46 = objc_msgSend(v23, sel_initWithSystemColor_, 19);
      objc_msgSend(objc_allocWithZone(MEMORY[0x24BEC14B0]), sel_initWithColor_, v46);

      OUTLINED_FUNCTION_0_7();
      OUTLINED_FUNCTION_23_1();
      OUTLINED_FUNCTION_21_1(v47, v48);
      OUTLINED_FUNCTION_11_3();
      OUTLINED_FUNCTION_1_7();
      *((_BYTE *)a3 + v49) = 0;
    }
    v50 = v20;
    return (id)swift_retain_n();
  }
  else
  {
    v28 = objc_allocWithZone(MEMORY[0x24BEC1398]);
    OUTLINED_FUNCTION_52_1();
    v58 = objc_msgSend(v28, sel_initWithSystemColor_, 1);
    v29 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    v54 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEC14B0]), sel_initWithColor_, v29);

    sub_20CE67410();
    v53 = OUTLINED_FUNCTION_20_1();
    OUTLINED_FUNCTION_13_3();
    sub_20CE67410();
    v52 = OUTLINED_FUNCTION_20_1();
    OUTLINED_FUNCTION_13_3();
    v30 = sub_20CE67410();
    v31 = (uint64_t)v55;
    v32 = (uint64_t *)&v55[*(int *)(v57 + 20)];
    OUTLINED_FUNCTION_9_2((uint64_t)v32 + *(int *)(v15 + 20), v17);
    *v32 = v30;
    v33 = v31;
    sub_20CE15BB0((uint64_t)v32, v31, type metadata accessor for TopHitViewTextStyle.Resolved);
    sub_20CE67410();
    v34 = OUTLINED_FUNCTION_26_2();
    OUTLINED_FUNCTION_13_3();
    v35 = v56;
    OUTLINED_FUNCTION_9_2((uint64_t)v56 + *(int *)(v15 + 20), *MEMORY[0x24BDF5080]);
    *v35 = v34;
    sub_20CE67410();
    v36 = sub_20CE67404();
    OUTLINED_FUNCTION_13_3();
    v37 = (uint64_t *)((char *)v35 + *(int *)(v57 + 20));
    OUTLINED_FUNCTION_9_2((uint64_t)v37 + *(int *)(v15 + 20), *MEMORY[0x24BDF5098]);
    *v37 = v36;
    v38 = sub_20CE673D4();
    v39 = sub_20CE673D4();
    swift_release_n();
    sub_20CE41470((uint64_t)v12);
    v40 = v58;
    *a3 = v54;
    a3[1] = v40;
    a3[2] = v53;
    a3[3] = 2;
    a3[4] = v52;
    a3[5] = 1;
    v41 = (int *)OUTLINED_FUNCTION_0_7();
    OUTLINED_FUNCTION_23_1();
    sub_20CE13CB0(v33, v42, type metadata accessor for TopHitViewTextStyle);
    sub_20CE13CB0((uint64_t)v35, (uint64_t)a3 + v41[8], type metadata accessor for TopHitViewTextStyle);
    v43 = (_QWORD *)((char *)a3 + v41[9]);
    *v43 = v38;
    v43[1] = 0;
    v43[2] = v39;
    v43[3] = 0;
    v44 = v58;
    *(_QWORD *)((char *)a3 + v41[10]) = v58;
    *((_BYTE *)a3 + v41[11]) = 0;
    return v44;
  }
}

uint64_t TopHitViewTextStyle.Resolved.blendMode.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  type metadata accessor for TopHitViewTextStyle.Resolved(0);
  v3 = OUTLINED_FUNCTION_6_3();
  return OUTLINED_FUNCTION_3_5(a1, v1, v3, *(uint64_t (**)(void))(*(_QWORD *)(v3 - 8) + 16));
}

uint64_t sub_20CE12EE8(__int128 *a1, double a2)
{
  _QWORD *v2;
  _QWORD **v3;
  _QWORD *v6;
  unint64_t v7;
  char v8;
  unint64_t v9;
  char v10;
  uint64_t result;
  char v12;
  _QWORD *v13;

  v3 = (_QWORD **)v2;
  v6 = (_QWORD *)*v2;
  v7 = sub_20CE12FE0(a1);
  if (__OFADD__(v6[2], (v8 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v9 = v7;
  v10 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254996B28);
  result = sub_20CE6780C();
  if ((result & 1) == 0)
    goto LABEL_5;
  result = sub_20CE12FE0(a1);
  if ((v10 & 1) != (v12 & 1))
  {
LABEL_9:
    result = sub_20CE678A8();
    __break(1u);
    return result;
  }
  v9 = result;
LABEL_5:
  v13 = *v3;
  if ((v10 & 1) != 0)
  {
    *(double *)(v13[7] + 8 * v9) = a2;
  }
  else
  {
    sub_20CE2A6A0(v9, a1, v13, a2);
    return sub_20CE19768((uint64_t)a1);
  }
  return result;
}

unint64_t sub_20CE12FE0(__int128 *a1)
{
  uint64_t v2;

  sub_20CE678B4();
  sub_20CE13438();
  v2 = sub_20CE678E4();
  return sub_20CE13050(a1, v2);
}

unint64_t sub_20CE13050(__int128 *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  BOOL v10;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[24];

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v12 = ~v4;
    v13 = *(_QWORD *)(v2 + 48);
    v6 = *(_QWORD *)a1;
    v7 = *((_QWORD *)a1 + 1);
    sub_20CE196EC(a1 + 1, (uint64_t)v14);
    do
    {
      v8 = v13 + (v5 << 6);
      v9 = *(unsigned __int8 *)(v8 + 32);
      v10 = *(_QWORD *)v8 == v6 && *(_QWORD *)(v8 + 8) == v7;
      if (v10 || (sub_20CE67890() & 1) != 0)
        __asm { BR              X9 }
      v5 = (v5 + 1) & v12;
    }
    while (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

uint64_t sub_20CE13438()
{
  swift_bridgeObjectRetain();
  sub_20CE6765C();
  swift_bridgeObjectRelease();
  IconSize.hash(into:)();
  sub_20CE678CC();
  sub_20CE678D8();
  sub_20CE678D8();
  sub_20CE678CC();
  return sub_20CE678C0();
}

void IconSize.hash(into:)()
{
  __asm { BR              X10 }
}

uint64_t sub_20CE13548()
{
  sub_20CE678C0();
  return sub_20CE678D8();
}

uint64_t sub_20CE13638@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_20CE2F2B4();
  v3 = sub_20CE675F0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v2, v3);
}

uint64_t destroy for TopHitViewTextStyle.Resolved(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_20CE675F0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t destroy for TopHitViewTextStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v9)(uint64_t, uint64_t);

  swift_release();
  v4 = type metadata accessor for TopHitViewTextStyle.Resolved(0);
  v5 = a1 + *(int *)(v4 + 20);
  v6 = sub_20CE675F0();
  v9 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v9(v5, v6);
  v7 = a1 + *(int *)(a2 + 20);
  swift_release();
  return ((uint64_t (*)(uint64_t, uint64_t))v9)(v7 + *(int *)(v4 + 20), v6);
}

uint64_t Color.init(_:)(void *a1)
{
  uint64_t v2;

  v2 = MEMORY[0x212B96C94](objc_msgSend(a1, sel_platformColor));

  return v2;
}

void TopHitViewColorScheme.init(bundleIdentifier:style:)(char *a1@<X2>, _QWORD *a2@<X8>)
{
  char v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12[2];

  v12[1] = *(id *)MEMORY[0x24BDAC8D0];
  v3 = *a1;
  if (qword_2549963F0 != -1)
    swift_once();
  v4 = (void *)qword_25499A198;
  v5 = (void *)sub_20CE6762C();
  swift_bridgeObjectRelease();
  v12[0] = 0;
  v6 = objc_msgSend(v4, sel_colorsForBundleIdentifier_error_, v5, v12);

  v7 = v12[0];
  if (v6)
  {
    LOBYTE(v12[0]) = v3;
    v8 = v7;
    TopHitViewColorScheme.init(appShortcutColors:style:)(v6, (unsigned __int8 *)v12, a2);
  }
  else
  {
    v9 = v12[0];
    v10 = (void *)sub_20CE66D14();

    swift_willThrow();
    v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEC1398]), sel_initWithSystemColor_, 4);
    LOBYTE(v12[0]) = v3;
    OUTLINED_FUNCTION_25_2(v11, (unsigned __int8 *)v12);

  }
}

void TopHitViewColorScheme.init(appShortcutColors:style:)(void *a1@<X0>, unsigned __int8 *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  unsigned int v21;
  void *v22;
  char **v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  id v35;
  int *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  id v40;
  id v41;
  _BOOL4 v42;
  id v43;
  unsigned __int8 v44;
  unsigned __int8 v45;

  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v39 - v10;
  v12 = *a2;
  v14 = OUTLINED_FUNCTION_15_2(v13, sel_backgroundGradient);
  if (!v14)
  {
    v20 = OUTLINED_FUNCTION_15_2(0, sel_tintColor);
    v45 = v12;
    OUTLINED_FUNCTION_25_2(v20, &v45);
    goto LABEL_8;
  }
  v15 = v14;
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEC1398]), sel_initWithSystemColor_, 19);
  if (v12 != 1)
  {
    sub_20CE41434();
    v17 = objc_msgSend(v15, sel_baseColor);
    v18 = sub_20CE6774C();

    if ((v18 & 1) != 0)
    {
      v20 = OUTLINED_FUNCTION_15_2(v19, sel_tintColor);
      v44 = v12;
      OUTLINED_FUNCTION_25_2(v20, &v44);

LABEL_8:
      goto LABEL_23;
    }
  }
  v21 = objc_msgSend(a1, sel_isDefaultTintColor);
  v43 = v16;
  if (v21)
  {
    v22 = (void *)objc_opt_self();
    v23 = &selRef_whiteColor;
  }
  else
  {
    v23 = &selRef_tintColor;
    v22 = a1;
  }
  v42 = v12 == 1;
  v40 = objc_msgSend(v22, *v23);
  v41 = OUTLINED_FUNCTION_15_2((uint64_t)v40, sel_tintColor);
  v24 = OUTLINED_FUNCTION_18_1((uint64_t)v41, sel_isDark);
  if (v24)
    v25 = 3924420890;
  else
    v25 = 32;
  if (v24)
    v26 = 1;
  else
    v26 = 2;
  v27 = objc_msgSend((id)objc_opt_self(), sel_colorWithRGBAValue_, v25);
  v28 = MEMORY[0x212B96C94](objc_msgSend(v27, sel_platformColor));

  swift_retain();
  static TopHitViewColorScheme.entityTitleTextStyle(for:)();
  static TopHitViewColorScheme.noEntitiesLabelTextStyle(for:)();
  v30 = OUTLINED_FUNCTION_18_1(v29, sel_isDark);
  if (v30)
    v31 = 3924420900;
  else
    v31 = 64;
  if (v30)
    v32 = 1;
  else
    v32 = 2;
  v33 = objc_msgSend((id)objc_opt_self(), sel_colorWithRGBAValue_, v31);
  v34 = MEMORY[0x212B96C94](objc_msgSend(v33, sel_platformColor));

  swift_retain();
  v35 = v40;
  *a3 = v15;
  a3[1] = v35;
  a3[2] = v28;
  a3[3] = v26;
  a3[4] = v28;
  a3[5] = v26;
  v36 = (int *)OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_23_1();
  sub_20CE13CB0((uint64_t)v11, v37, type metadata accessor for TopHitViewTextStyle);
  sub_20CE13CB0((uint64_t)v8, (uint64_t)a3 + v36[8], type metadata accessor for TopHitViewTextStyle);
  v38 = (_QWORD *)((char *)a3 + v36[9]);
  *v38 = v34;
  v38[1] = v32;
  v38[2] = v34;
  v38[3] = v32;
  *(_QWORD *)((char *)a3 + v36[10]) = v41;
  *((_BYTE *)a3 + v36[11]) = v42;
LABEL_23:
  OUTLINED_FUNCTION_15();
}

uint64_t TopHitViewColorScheme.entityTitleTextStyle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_0_7();
  return sub_20CE15BB0(v1 + *(int *)(v3 + 28), a1, type metadata accessor for TopHitViewTextStyle);
}

uint64_t type metadata accessor for TopHitViewColorScheme()
{
  uint64_t result;

  result = qword_2549975F0;
  if (!qword_2549975F0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_20CE13CB0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_34(a1, a2, a3);
  OUTLINED_FUNCTION_9(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32));
  return v3;
}

void static TopHitViewColorScheme.noEntitiesLabelTextStyle(for:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_12_4();
  OUTLINED_FUNCTION_27_0();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_41();
  if (OUTLINED_FUNCTION_18_1(v3, sel_isDark))
  {
    sub_20CE673F8();
    v4 = OUTLINED_FUNCTION_26_2();
    v5 = (unsigned int *)MEMORY[0x24BDF5098];
  }
  else
  {
    sub_20CE673E0();
    v4 = sub_20CE67404();
    v5 = (unsigned int *)MEMORY[0x24BDF5080];
  }
  v6 = swift_release();
  OUTLINED_FUNCTION_17_2(v6, *v5);
  *v0 = v4;
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_14_2();
  v7 = OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_10_3(v7);
  OUTLINED_FUNCTION_15();
}

uint64_t static TopHitViewColorScheme.entityTitleTextStyle(for:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_12_4();
  OUTLINED_FUNCTION_27_0();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_41();
  if (OUTLINED_FUNCTION_18_1(v3, sel_isDark))
  {
    v4 = (unsigned int *)MEMORY[0x24BDF50D0];
    v5 = sub_20CE673F8();
    v6 = v5;
  }
  else
  {
    sub_20CE673E0();
    v6 = OUTLINED_FUNCTION_26_2();
    v5 = swift_release();
    v4 = (unsigned int *)MEMORY[0x24BDF5080];
  }
  OUTLINED_FUNCTION_17_2(v5, *v4);
  *v0 = v6;
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_14_2();
  v7 = OUTLINED_FUNCTION_6_5();
  return OUTLINED_FUNCTION_10_3(v7);
}

uint64_t sub_20CE13E80(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA3E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t assignWithCopy for TopHitViewColorScheme(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;

  v6 = *(void **)a2;
  v7 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v6;

  v9 = *(void **)(a2 + 8);
  v10 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v9;
  v11 = v9;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v12 = a3[7];
  v13 = a1 + v12;
  v14 = a2 + v12;
  *(_QWORD *)(a1 + v12) = *(_QWORD *)(a2 + v12);
  swift_retain();
  swift_release();
  v15 = type metadata accessor for TopHitViewTextStyle.Resolved(0);
  v16 = *(int *)(v15 + 20);
  v17 = (char *)(v13 + v16);
  v18 = (char *)(v14 + v16);
  v19 = sub_20CE675F0();
  v20 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 24);
  v20(v17, v18, v19);
  v21 = type metadata accessor for TopHitViewTextStyle(0);
  v22 = *(int *)(v21 + 20);
  v23 = (char *)(v13 + v22);
  v24 = (char *)(v14 + v22);
  *(_QWORD *)v23 = *(_QWORD *)v24;
  swift_retain();
  swift_release();
  v20(&v23[*(int *)(v15 + 20)], &v24[*(int *)(v15 + 20)], v19);
  v25 = a3[8];
  v26 = a1 + v25;
  v27 = a2 + v25;
  *(_QWORD *)(a1 + v25) = *(_QWORD *)(a2 + v25);
  swift_retain();
  swift_release();
  v20((char *)(v26 + *(int *)(v15 + 20)), (char *)(v27 + *(int *)(v15 + 20)), v19);
  v28 = *(int *)(v21 + 20);
  v29 = (char *)(v26 + v28);
  v30 = v27 + v28;
  *(_QWORD *)v29 = *(_QWORD *)(v27 + v28);
  swift_retain();
  swift_release();
  v20(&v29[*(int *)(v15 + 20)], (char *)(v30 + *(int *)(v15 + 20)), v19);
  v31 = a3[9];
  v32 = (_QWORD *)(a1 + v31);
  v33 = (_QWORD *)(a2 + v31);
  *(_QWORD *)(a1 + v31) = *(_QWORD *)(a2 + v31);
  swift_retain();
  swift_release();
  v32[1] = v33[1];
  v32[2] = v33[2];
  swift_retain();
  swift_release();
  v32[3] = v33[3];
  v34 = a3[10];
  v35 = *(void **)(a2 + v34);
  v36 = *(void **)(a1 + v34);
  *(_QWORD *)(a1 + v34) = v35;
  v37 = v35;

  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  return a1;
}

void destroy for IconView(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if ((unint64_t)v2 >= 2)

}

void TopHitViewIconBackgroundStyle.resolve(in:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v18;

  v3 = OUTLINED_FUNCTION_57_0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v17 - v9;
  v11 = *v1;
  v12 = v1[1];
  v14 = v1[2];
  v13 = v1[3];
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v4 + 16))((char *)&v17 - v9, a1, v3, v8);
  v15 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v10, v3);
  if ((_DWORD)v15 == *MEMORY[0x24BDEB400])
  {
    v17 = v11;
    v18 = v12;
    OUTLINED_FUNCTION_2_5(v15);
  }
  else
  {
    if ((_DWORD)v15 != *MEMORY[0x24BDEB3F0])
    {
      v17 = v11;
      v18 = v12;
      (*(void (**)(char *))(v4 + 104))(v6);
      swift_retain();
      OUTLINED_FUNCTION_10_2();
      v16 = *(void (**)(char *, uint64_t))(v4 + 8);
      v16(v6, v3);
      swift_release();
      v16(v10, v3);
      goto LABEL_7;
    }
    v17 = v14;
    v18 = v13;
    OUTLINED_FUNCTION_2_5(v15);
  }
  swift_retain();
  OUTLINED_FUNCTION_10_2();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_release();
LABEL_7:
  OUTLINED_FUNCTION_15();
}

void sub_20CE14298(uint64_t a1)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;

  v3 = OUTLINED_FUNCTION_57_0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_38();
  v7 = v6 - v5;
  v8 = sub_20CE6714C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_38();
  v12 = v11 - v10;
  v13 = *(_QWORD *)(v1 + 8);
  sub_20CE67140();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v7, a1, v3);
  sub_20CE67068();
  sub_20CE6741C();
  v14 = (void *)sub_20CE67428();
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithCGColor_, v14);

  if (!v15)
    v15 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEC1398]), sel_initWithPlatformColor_, v15);
  objc_msgSend(objc_allocWithZone(MEMORY[0x24BEC14D0]), sel_initWithColor_blendMode_, v16, v13);

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v12, v8);
  OUTLINED_FUNCTION_15();
}

uint64_t sub_20CE14408(id *a1)
{

  return swift_release();
}

uint64_t initializeWithCopy for ProbablyAlignedSymbol(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t initializeWithCopy for IconView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v4 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v6 = a2 + 32;
  v5 = *(void **)(a2 + 32);
  v7 = v4;
  if ((unint64_t)v5 >= 2)
  {
    *(_QWORD *)(a1 + 32) = v5;
    *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
    v8 = v5;
  }
  else
  {
    *(_QWORD *)(a1 + 32) = *(_QWORD *)v6;
    *(_BYTE *)(a1 + 40) = *(_BYTE *)(v6 + 8);
  }
  *(_BYTE *)(a1 + 41) = *(_BYTE *)(a2 + 41);
  return a1;
}

void Shape.fill(_:direction:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_20CE66E70();
  sub_20CE66F90();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  OUTLINED_FUNCTION_4_5(v0, v2);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  OUTLINED_FUNCTION_81();
  v1 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_74();
}

void sub_20CE14634(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;

  *(_QWORD *)(v11 - 376) = type metadata accessor for GradientColorResolverView(255, v9, a1, a4);
  OUTLINED_FUNCTION_10_4();
  v12 = sub_20CE66F90();
  v13 = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v11 - 368) = v12;
  OUTLINED_FUNCTION_0_8(v13);
  MEMORY[0x24BDAC7A8](v14);
  v16 = OUTLINED_FUNCTION_20_2((uint64_t)&a9 - v15);
  *(_QWORD *)(v11 - 352) = v16;
  v17 = MEMORY[0x212B97A80](MEMORY[0x24BDEB950], v10);
  *(_QWORD *)(v11 - 144) = v16;
  *(_QWORD *)(v11 - 136) = v17;
  OUTLINED_FUNCTION_10();
}

#error "20CE1470C: call analysis failed (funcsize=78)"

void sub_20CE14814(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_QWORD *)(v3 - 384);
  sub_20CE67398();
  OUTLINED_FUNCTION_15_3(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_16_2();

  sub_20CE37F38(v1, v3 - 128);
  OUTLINED_FUNCTION_2_8();
  sub_20CE673A4();
  sub_20CE14DBC(v3 - 128);
  v6 = MEMORY[0x24BDEDB58];
  *(_QWORD *)(v3 - 208) = a1;
  *(_QWORD *)(v3 - 200) = v6;
  v7 = *(_QWORD *)(v3 - 368);
  MEMORY[0x212B97A80](MEMORY[0x24BDED308], v7, v3 - 208);
  sub_20CE675CC();
  OUTLINED_FUNCTION_3_8();
  sub_20CE67368();
  OUTLINED_FUNCTION_15_3(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 256) + 8));
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 280) + 8))(v5, v7);
  OUTLINED_FUNCTION_21_2();
}

void sub_20CE14928()
{
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_6_6();
  OUTLINED_FUNCTION_15();
}

void Shape.fill(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_20CE66E70();
  v6 = sub_20CE66F90();
  OUTLINED_FUNCTION_0_8(*(_QWORD *)(v6 - 8));
  MEMORY[0x24BDAC7A8](v0);
  v5 = OUTLINED_FUNCTION_4_5(v1, v4);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_81();
  MEMORY[0x24BDAC7A8](v2);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_74();
}

void sub_20CE14A70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)(v10 - 376) = a1;
  type metadata accessor for GradientColorResolverView(255, v9, a1, a4);
  OUTLINED_FUNCTION_10_4();
  v11 = sub_20CE66F90();
  OUTLINED_FUNCTION_0_8(*(_QWORD *)(v11 - 8));
  MEMORY[0x24BDAC7A8](v12);
  *(_QWORD *)(v10 - 336) = OUTLINED_FUNCTION_20_2((uint64_t)&a9 - v13);
  OUTLINED_FUNCTION_22_0();
}

void sub_20CE14AE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 144) = v1;
  *(_QWORD *)(v2 - 136) = a1;
  OUTLINED_FUNCTION_22_0();
}

#error "20CE14B40: call analysis failed (funcsize=147)"

void sub_20CE14D58()
{
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_6_6();
  OUTLINED_FUNCTION_15();
}

uint64_t type metadata accessor for GradientColorResolverView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for GradientColorResolverView);
}

unint64_t sub_20CE14D80()
{
  unint64_t result;

  result = qword_253CFA280;
  if (!qword_253CFA280)
  {
    result = MEMORY[0x212B97A80](MEMORY[0x24BDEC7C0], MEMORY[0x24BDEC7D0]);
    atomic_store(result, (unint64_t *)&qword_253CFA280);
  }
  return result;
}

uint64_t sub_20CE14DBC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t GradientColorResolverView.init(gradient:_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

void sub_20CE14DF0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t KeyPath;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  char v27;
  id v28;
  id v29;
  __int128 __dst[7];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  __int16 v35;
  _BYTE __src[113];
  char v37;
  char v38;
  char v39;
  _OWORD v40[7];
  id v41[5];

  v2 = *(void **)a1;
  objc_opt_self();
  v3 = swift_dynamicCastObjCClass();
  if (v3)
  {
    v4 = v3;
    sub_20CE196EC((__int128 *)(a1 + 8), (uint64_t)v41);
    v5 = *(_BYTE *)(a1 + 41);
    *(_QWORD *)&__src[32] = swift_getKeyPath();
    __src[40] = 0;
    *(_QWORD *)&__src[48] = swift_getKeyPath();
    __src[88] = 0;
    *(_QWORD *)&v31 = 0;
    v6 = v2;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254996778);
    sub_20CE67548();
    *(_OWORD *)&__src[96] = v40[0];
    *(_QWORD *)__src = v4;
    sub_20CE196EC((__int128 *)v41, (uint64_t)&__src[8]);
    __src[112] = v5;
    memcpy(__dst, __src, 0x71uLL);
    sub_20CE21860((uint64_t)__dst, (uint64_t)__src);
    v37 = 0;
    sub_20CE19704();
    sub_20CE1713C();
    sub_20CE67200();
    sub_20CE2E628((uint64_t)&v31, (uint64_t)__src, &qword_253CFA370);
    v38 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA370);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA360);
    sub_20CE1707C();
    sub_20CE170A0();
    sub_20CE67200();
    sub_20CE21AE0((uint64_t)&v31, &qword_253CFA370);
    sub_20CE2E628((uint64_t)v40, (uint64_t)__src, &qword_253CFA380);
    v39 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA380);
    sub_20CE2BB64((uint64_t)&unk_253CFA378);
    sub_20CE67200();

    sub_20CE21AE0((uint64_t)v40, &qword_253CFA380);
    sub_20CE2189C((uint64_t)__dst);
  }
  else
  {
    objc_opt_self();
    v7 = swift_dynamicCastObjCClass();
    if (v7)
    {
      v8 = v7;
      sub_20CE196EC((__int128 *)(a1 + 8), (uint64_t)__dst);
      sub_20CE19388((uint64_t *)(a1 + 32), (uint64_t)v41);
      *(_QWORD *)__src = v8;
      sub_20CE196EC(__dst, (uint64_t)&__src[8]);
      sub_20CE19388((uint64_t *)v41, (uint64_t)&__src[32]);
      *(_QWORD *)&__src[48] = swift_getKeyPath();
      __src[56] = 0;
      *(_QWORD *)&__src[64] = swift_getKeyPath();
      *(_WORD *)&__src[72] = 0;
      KeyPath = swift_getKeyPath();
      type metadata accessor for SymbolIconView.SymbolIconMetrics();
      v10 = swift_allocObject();
      v28 = v2;
      sub_20CE18E38(v41);
      sub_20CE2D868();
      *(_QWORD *)(v10 + 16) = sub_20CE67620();
      *(_QWORD *)&v31 = v10;
      sub_20CE67548();
      v11 = *(void **)&__src[32];
      v12 = *(_QWORD *)&__src[48];
      v13 = __src[56];
      v14 = *(_QWORD *)&__src[64];
      v15 = __src[73];
      v16 = __src[72];
      v27 = __src[73];
      *(_QWORD *)&__src[80] = KeyPath;
      __src[88] = 0;
      *(_OWORD *)&__src[96] = v40[0];
      v37 = 1;
      v26 = *(id *)__src;
      sub_20CE15F58(v11);
      sub_20CE15B98(v12, v13);
      sub_20CE15BA4(v14, v16, v15);
      sub_20CE15B98(KeyPath, 0);
      sub_20CE19704();
      sub_20CE1713C();
      swift_retain();
      swift_retain();
      sub_20CE67200();
      sub_20CE2E628((uint64_t)&v31, (uint64_t)__src, &qword_253CFA370);
      v38 = 0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA370);
      __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA360);
      sub_20CE1707C();
      sub_20CE170A0();
      sub_20CE67200();
      sub_20CE21AE0((uint64_t)&v31, &qword_253CFA370);
      sub_20CE2E628((uint64_t)v40, (uint64_t)__src, &qword_253CFA380);
      v39 = 0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA380);
      sub_20CE2BB64((uint64_t)&unk_253CFA378);
      sub_20CE67200();

      sub_20CE21AE0((uint64_t)v40, &qword_253CFA380);
      sub_20CE17348(v11);
      sub_20CE158B0(v12, v13);
      sub_20CE158BC(v14, v16, v27);
      sub_20CE158B0(KeyPath, 0);
      swift_release();
      swift_release();
    }
    else
    {
      objc_opt_self();
      v17 = swift_dynamicCastObjCClass();
      if (v17)
      {
        v18 = v17;
        sub_20CE196EC((__int128 *)(a1 + 8), (uint64_t)__dst);
        sub_20CE19388((uint64_t *)(a1 + 32), (uint64_t)v41);
        *(_QWORD *)__src = v18;
        sub_20CE196EC(__dst, (uint64_t)&__src[8]);
        sub_20CE19388((uint64_t *)v41, (uint64_t)&__src[32]);
        v19 = swift_getKeyPath();
        v20 = *(void **)__src;
        v21 = *(void **)&__src[32];
        *(_QWORD *)&__src[24] = __src[24];
        *(_QWORD *)&__src[40] = __src[40];
        *(_QWORD *)&__src[48] = v19;
        *(_WORD *)&__src[56] = 0;
        v29 = v2;
        sub_20CE18E38(v41);
        v22 = v20;
        sub_20CE15F58(v21);
        sub_20CE15B98(v19, 0);
        sub_20CE19D7C();
        sub_20CE19D40();
        sub_20CE67200();
        *(_OWORD *)__src = v31;
        *(_OWORD *)&__src[16] = v32;
        *(_OWORD *)&__src[32] = v33;
        *(_QWORD *)&__src[48] = v34;
        *(_WORD *)&__src[56] = v35;
        v38 = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA370);
        __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA360);
        sub_20CE1707C();
        sub_20CE170A0();
        sub_20CE67200();
        sub_20CE2E628((uint64_t)v40, (uint64_t)__src, &qword_253CFA380);
        v39 = 0;
        __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA380);
        sub_20CE2BB64((uint64_t)&unk_253CFA378);
        sub_20CE67200();

        sub_20CE21AE0((uint64_t)v40, &qword_253CFA380);
        sub_20CE17348(v21);
        sub_20CE158B0(v19, 0);
      }
      else
      {
        objc_opt_self();
        if (swift_dynamicCastObjCClass())
        {
          sub_20CE19D7C();
          sub_20CE19D40();
          v23 = v2;
          sub_20CE67200();
          *(_OWORD *)__src = v31;
          *(_OWORD *)&__src[16] = v32;
          *(_OWORD *)&__src[32] = v33;
          *(_QWORD *)&__src[48] = v34;
          *(_WORD *)&__src[56] = v35;
          v38 = 1;
          __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA370);
          __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA360);
          sub_20CE1707C();
          sub_20CE170A0();
          sub_20CE67200();
          sub_20CE2E628((uint64_t)v40, (uint64_t)__src, &qword_253CFA380);
          v39 = 0;
          __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA380);
          sub_20CE2BB64((uint64_t)&unk_253CFA378);
          sub_20CE67200();
          sub_20CE21AE0((uint64_t)v40, &qword_253CFA380);

        }
        else
        {
          sub_20CE67794();
          swift_bridgeObjectRelease();
          v24 = v2;
          v25 = objc_msgSend(v24, sel_description);
          sub_20CE67638();

          sub_20CE67680();
          swift_bridgeObjectRelease();
          sub_20CE67824();
          __break(1u);
        }
      }
    }
  }
}

uint64_t sub_20CE157B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  sub_20CE158B0(*(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 56));
  sub_20CE158B0(*(_QWORD *)(a1 + 64), *(_BYTE *)(a1 + 72));
  v4 = a1 + *(int *)(a2 + 52);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254996990);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v5 = sub_20CE675F0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t destroy for SymbolIconView(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if ((unint64_t)v2 >= 2)

  sub_20CE158B0(*(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 56));
  sub_20CE158BC(*(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(_BYTE *)(a1 + 73));
  sub_20CE158B0(*(_QWORD *)(a1 + 80), *(_BYTE *)(a1 + 88));
  swift_release();
  return swift_release();
}

uint64_t sub_20CE158B0(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

uint64_t sub_20CE158BC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) == 0)
    return swift_release();
  return result;
}

uint64_t sub_20CE158C8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_BYTE *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_BYTE *)(a1 + 73);
  v7 = *(_QWORD *)(a1 + 80);
  v8 = *(_BYTE *)(a1 + 88);
  v9 = *(unsigned __int8 *)(a1 + 72);
  v10 = *(id *)a1;
  sub_20CE15F58(v2);
  sub_20CE15B98(v3, v4);
  sub_20CE15BA4(v5, v9, v6);
  sub_20CE15B98(v7, v8);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_20CE1598C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  char v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  v7 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v8 = *(_BYTE *)(a2 + 56);
  v9 = (id)v6;
  swift_retain();
  sub_20CE15B98(v7, v8);
  *(_QWORD *)(a1 + 48) = v7;
  *(_BYTE *)(a1 + 56) = v8;
  v10 = *(_QWORD *)(a2 + 64);
  LOBYTE(v7) = *(_BYTE *)(a2 + 72);
  sub_20CE15B98(v10, v7);
  *(_QWORD *)(a1 + 64) = v10;
  *(_BYTE *)(a1 + 72) = v7;
  v11 = *(int *)(a3 + 52);
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254996990);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = sub_20CE675F0();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  }
  else
  {
    *v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t initializeWithCopy for SymbolIconView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  unsigned __int8 v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;

  v4 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v6 = a2 + 32;
  v5 = *(void **)(a2 + 32);
  v7 = v4;
  if ((unint64_t)v5 >= 2)
  {
    *(_QWORD *)(a1 + 32) = v5;
    *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
    v8 = v5;
  }
  else
  {
    *(_QWORD *)(a1 + 32) = *(_QWORD *)v6;
    *(_BYTE *)(a1 + 40) = *(_BYTE *)(v6 + 8);
  }
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_BYTE *)(a2 + 56);
  sub_20CE15B98(v9, v10);
  *(_QWORD *)(a1 + 48) = v9;
  *(_BYTE *)(a1 + 56) = v10;
  v11 = *(_QWORD *)(a2 + 64);
  v12 = *(_BYTE *)(a2 + 73);
  v13 = *(_BYTE *)(a2 + 72);
  sub_20CE15BA4(v11, v13, v12);
  *(_QWORD *)(a1 + 64) = v11;
  *(_BYTE *)(a1 + 72) = v13;
  *(_BYTE *)(a1 + 73) = v12;
  v14 = *(_QWORD *)(a2 + 80);
  v15 = *(_BYTE *)(a2 + 88);
  sub_20CE15B98(v14, v15);
  *(_QWORD *)(a1 + 80) = v14;
  *(_BYTE *)(a1 + 88) = v15;
  v16 = *(_QWORD *)(a2 + 96);
  v17 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = v16;
  *(_QWORD *)(a1 + 104) = v17;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_20CE15B98(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t sub_20CE15BA4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t sub_20CE15BB0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_34(a1, a2, a3);
  OUTLINED_FUNCTION_9(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16));
  return v3;
}

void destroy for TopHitViewColorScheme(id *a1, int *a2)
{
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  char *v12;

  swift_release();
  swift_release();
  v4 = (char *)a1 + a2[7];
  swift_release();
  v5 = type metadata accessor for TopHitViewTextStyle.Resolved(0);
  v6 = &v4[*(int *)(v5 + 20)];
  v7 = sub_20CE675F0();
  v8 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  v9 = type metadata accessor for TopHitViewTextStyle(0);
  v10 = &v4[*(int *)(v9 + 20)];
  swift_release();
  v8(&v10[*(int *)(v5 + 20)], v7);
  v11 = (char *)a1 + a2[8];
  swift_release();
  v8(&v11[*(int *)(v5 + 20)], v7);
  v12 = &v11[*(int *)(v9 + 20)];
  swift_release();
  v8(&v12[*(int *)(v5 + 20)], v7);
  swift_release();
  swift_release();

}

_QWORD *initializeWithCopy for TopHitViewColorScheme(_QWORD *a1, uint64_t a2, int *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  char *v18;
  _QWORD *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  void (*v45)(char *, uint64_t, uint64_t);
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;

  v6 = *(void **)a2;
  v5 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v5;
  v7 = *(_QWORD *)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v7;
  v8 = *(_QWORD *)(a2 + 40);
  a1[4] = *(_QWORD *)(a2 + 32);
  a1[5] = v8;
  v9 = a3[7];
  v10 = (char *)a1 + v9;
  v11 = a2 + v9;
  *(_QWORD *)((char *)a1 + v9) = *(_QWORD *)(a2 + v9);
  v12 = type metadata accessor for TopHitViewTextStyle.Resolved(0);
  v13 = *(int *)(v12 + 20);
  v47 = &v10[v13];
  v49 = v12;
  v46 = v11 + v13;
  v14 = sub_20CE675F0();
  v45 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
  v15 = v6;
  v16 = v5;
  swift_retain();
  swift_retain();
  swift_retain();
  v45(v47, v46, v14);
  v48 = type metadata accessor for TopHitViewTextStyle(0);
  v17 = *(int *)(v48 + 20);
  v18 = &v10[v17];
  v19 = (_QWORD *)(v11 + v17);
  *(_QWORD *)v18 = *v19;
  v20 = *(int *)(v49 + 20);
  v21 = &v18[v20];
  v22 = (char *)v19 + v20;
  swift_retain();
  v45(v21, (uint64_t)v22, v14);
  v23 = a3[8];
  v24 = (_QWORD *)((char *)a1 + v23);
  v25 = a2 + v23;
  *v24 = *(_QWORD *)(a2 + v23);
  v26 = *(int *)(v49 + 20);
  v27 = (char *)v24 + v26;
  v28 = v25 + v26;
  swift_retain();
  v45(v27, v28, v14);
  v29 = *(int *)(v48 + 20);
  v30 = (_QWORD *)((char *)v24 + v29);
  v31 = (_QWORD *)(v25 + v29);
  *v30 = *v31;
  v32 = *(int *)(v49 + 20);
  v33 = (char *)v30 + v32;
  v34 = (char *)v31 + v32;
  swift_retain();
  v45(v33, (uint64_t)v34, v14);
  v35 = a3[9];
  v36 = a3[10];
  v37 = (_QWORD *)((char *)a1 + v35);
  v38 = (_QWORD *)(a2 + v35);
  v39 = v38[1];
  *v37 = *v38;
  v37[1] = v39;
  v41 = v38[2];
  v40 = v38[3];
  v37[2] = v41;
  v37[3] = v40;
  v42 = *(void **)(a2 + v36);
  *(_QWORD *)((char *)a1 + v36) = v42;
  *((_BYTE *)a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  swift_retain();
  swift_retain();
  v43 = v42;
  return a1;
}

uint64_t sub_20CE15EE0(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata accessor for TopHitViewTextStyle.Resolved(uint64_t a1)
{
  return sub_20CE15EE0(a1, (uint64_t *)&unk_254997578);
}

uint64_t type metadata accessor for TopHitViewTextStyle(uint64_t a1)
{
  return sub_20CE15EE0(a1, (uint64_t *)&unk_254997568);
}

uint64_t type metadata accessor for SymbolIconView.SymbolIconMetrics()
{
  return objc_opt_self();
}

id sub_20CE15F58(id result)
{
  if ((unint64_t)result >= 2)
    return result;
  return result;
}

uint64_t sub_20CE15F68(uint64_t a1, unint64_t *a2)
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

_QWORD *initializeWithCopy for TopHitViewTextStyle(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  char *v16;
  char *v17;

  *a1 = *a2;
  v6 = type metadata accessor for TopHitViewTextStyle.Resolved(0);
  v7 = *(int *)(v6 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_20CE675F0();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_retain();
  v11(v8, v9, v10);
  v12 = *(int *)(a3 + 20);
  v13 = (_QWORD *)((char *)a1 + v12);
  v14 = (_QWORD *)((char *)a2 + v12);
  *v13 = *v14;
  v15 = *(int *)(v6 + 20);
  v16 = (char *)v13 + v15;
  v17 = (char *)v14 + v15;
  swift_retain();
  v11(v16, v17, v10);
  return a1;
}

uint64_t TopHitViewTextStyle.resolve(in:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v5 = OUTLINED_FUNCTION_57_0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_38();
  v9 = v8 - v7;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v8 - v7, a1, v5);
  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 88))(v9, v5);
  if (v10 == *MEMORY[0x24BDEB400])
  {
    v11 = v2;
    return sub_20CE16154(v11, a2);
  }
  if (v10 == *MEMORY[0x24BDEB3F0])
  {
    v11 = v2 + *(int *)(type metadata accessor for TopHitViewTextStyle(0) + 20);
    return sub_20CE16154(v11, a2);
  }
  sub_20CE16154(v2, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
}

uint64_t sub_20CE16154(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TopHitViewTextStyle.Resolved(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_QWORD *initializeWithCopy for TopHitViewTextStyle.Resolved(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  v7 = sub_20CE675F0();
  v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
  swift_retain();
  v8(v5, v6, v7);
  return a1;
}

uint64_t sub_20CE16208@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  void (*v17)(char *, char *);
  void (*v18)(char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v25 = a2;
  v4 = sub_20CE671A0();
  v23 = *(_QWORD *)(v4 - 8);
  v24 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_20CE66E4C();
  v7 = *(_QWORD *)(v22 - 8);
  v8 = MEMORY[0x24BDAC7A8](v22);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(a1 + 16);
  v21 = *(_QWORD *)(v11 - 8);
  v12 = MEMORY[0x24BDAC7A8](v8);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v20 - v15;
  v17 = *(void (**)(char *, char *))(v2 + *(int *)(a1 + 40));
  sub_20CE1686C();
  sub_20CE16840();
  v17(v10, v6);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v24);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v22);
  sub_20CE16994(v14, v11, *(_QWORD *)(a1 + 24));
  v18 = *(void (**)(char *, uint64_t))(v21 + 8);
  v18(v14, v11);
  sub_20CE16998((uint64_t)v16, v11, v25);
  return ((uint64_t (*)(char *, uint64_t))v18)(v16, v11);
}

uint64_t sub_20CE163B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_20CE66E4C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  v5 = a1 + *(int *)(a2 + 36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA250);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_20CE671A0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  return swift_release();
}

_QWORD *sub_20CE16480(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_20CE66E4C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = *(int *)(a3 + 36);
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA250);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_20CE671A0();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v11 = *(int *)(a3 + 40);
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  swift_retain();
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212B97A68]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x212B979FC](a1, v6, a5);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212B97A74](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_20CE1666C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD);
  uint64_t (*v7)(_QWORD);
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  os_log_type_t v17;
  NSObject *v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  OUTLINED_FUNCTION_46_0();
  v4 = v3;
  v21 = v5;
  v7 = v6;
  v9 = v8;
  v10 = v0;
  v12 = v11;
  v13 = sub_20CE6714C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_41();
  __swift_instantiateConcreteTypeFromMangledName(v9);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_55_0();
  sub_20CE2E628(v10, v2, v9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v16 = v7(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v12, v2, v16);
  }
  else
  {
    v17 = sub_20CE67734();
    v18 = sub_20CE67224();
    if (os_log_type_enabled(v18, v17))
    {
      v19 = (uint8_t *)OUTLINED_FUNCTION_43_0();
      v22 = OUTLINED_FUNCTION_43_0();
      *(_DWORD *)v19 = 136315138;
      sub_20CE29ED4(v21, v4, &v22);
      OUTLINED_FUNCTION_85(v20);
      sub_20CE67764();
      _os_log_impl(&dword_20CE0F000, v18, v17, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v19, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_14_0();
    }

    sub_20CE67140();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v1, v13);
  }
  OUTLINED_FUNCTION_15();
}

void sub_20CE16840()
{
  sub_20CE1666C();
}

void sub_20CE1686C()
{
  OUTLINED_FUNCTION_60_0();
  sub_20CE1666C();
}

uint64_t sub_20CE1688C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_20CE1689C(a1, *(void (**)(void))(v2 + 40), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_20CE1689C@<X0>(uint64_t a1@<X0>, void (*a2)(void)@<X3>, uint64_t a3@<X5>, uint64_t a4@<X6>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  void (*v18)(char *, uint64_t);
  uint64_t v20;

  v9 = *(_QWORD *)(a3 - 8);
  v10 = MEMORY[0x24BDAC7A8](a1);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v20 - v14;
  v17 = sub_20CE169B0(v13, v16);
  a2();

  sub_20CE16994(v12, a3, a4);
  v18 = *(void (**)(char *, uint64_t))(v9 + 8);
  v18(v12, a3);
  sub_20CE16998((uint64_t)v15, a3, a5);
  return ((uint64_t (*)(char *, uint64_t))v18)(v15, a3);
}

uint64_t sub_20CE16998@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1);
}

id sub_20CE169B0(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  id v17;
  int v18;
  id v19;
  id v21;
  uint64_t v22;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253CFA230);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = &v9[*(int *)(v7 + 48)];
  v11 = sub_20CE66E4C();
  v12 = *(_QWORD *)(v11 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v9, a1, v11);
  v13 = sub_20CE671A0();
  v14 = *(_QWORD *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v10, a2, v13);
  v15 = (*(uint64_t (**)(char *, uint64_t))(v12 + 88))(v9, v11);
  if (v15 == *MEMORY[0x24BDEB400])
  {
    v16 = (*(uint64_t (**)(char *, uint64_t))(v14 + 88))(v10, v13);
    if (v16 == *MEMORY[0x24BDEEDE8])
    {
      v17 = objc_msgSend(v3, sel_baseColor);
LABEL_11:
      v19 = v17;
      (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
      return v19;
    }
    if (v16 == *MEMORY[0x24BDEEDF0])
    {
      v17 = objc_msgSend(v3, sel_accessibilityBaseColor);
      goto LABEL_11;
    }
  }
  else if (v15 == *MEMORY[0x24BDEB3F0])
  {
    v18 = (*(uint64_t (**)(char *, uint64_t))(v14 + 88))(v10, v13);
    if (v18 == *MEMORY[0x24BDEEDE8])
    {
      v17 = objc_msgSend(v3, sel_darkBaseColor);
      goto LABEL_11;
    }
    if (v18 == *MEMORY[0x24BDEEDF0])
    {
      v17 = objc_msgSend(v3, sel_darkAccessibilityBaseColor);
      goto LABEL_11;
    }
  }
  v21 = objc_msgSend(v3, sel_baseColor);
  sub_20CE3E454((uint64_t)v9, (uint64_t *)&unk_253CFA230);
  return v21;
}

void sub_20CE16BCC(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v2 + 16);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80);
  sub_20CE16BF8(a1, v2 + ((v4 + 32) & ~v4), v3, *(_QWORD *)(v2 + 24), a2);
}

void sub_20CE16BF8(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  id v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];

  v22 = a2;
  v23 = a5;
  v8 = MEMORY[0x24BDF3E48];
  v24[0] = a3;
  v24[1] = MEMORY[0x24BDF3E48];
  v9 = MEMORY[0x24BDF3E18];
  v24[2] = a4;
  v24[3] = MEMORY[0x24BDF3E18];
  v10 = sub_20CE66E34();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v22 - v15;
  v17 = a1;
  v18 = MEMORY[0x212B96C94](objc_msgSend(v17, sel_platformColor, v22));

  v24[0] = v18;
  v19 = sub_20CE3BCB4();
  sub_20CE16D6C((uint64_t)v24, v19 & 0x101, a3, v8, a4, v9);
  swift_release();
  v20 = MEMORY[0x212B97A80](MEMORY[0x24BDEB358], v10);
  sub_20CE16994(v14, v10, v20);
  v21 = *(void (**)(char *, uint64_t))(v11 + 8);
  v21(v14, v10);
  sub_20CE16998((uint64_t)v16, v10, v23);
  v21(v16, v10);
  OUTLINED_FUNCTION_15();
}

void sub_20CE16D6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = a6;
  v9 = *(_QWORD *)(a4 - 8);
  v10 = MEMORY[0x24BDAC7A8](a1);
  v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  (*(void (**)(char *, uint64_t))(v14 + 16))((char *)v15 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a1, a4);
  sub_20CE66E28();
  OUTLINED_FUNCTION_15();
}

uint64_t sub_20CE16E58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t result;
  _QWORD *v14;

  *a5 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
  swift_storeEnumTagMultiPayload();
  v11 = type metadata accessor for ColorReadingView(0, a3, a4, v10);
  v12 = (uint64_t *)((char *)a5 + *(int *)(v11 + 36));
  *v12 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA250);
  result = swift_storeEnumTagMultiPayload();
  v14 = (uint64_t *)((char *)a5 + *(int *)(v11 + 40));
  *v14 = a1;
  v14[1] = a2;
  return result;
}

uint64_t GradientColorResolverView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  __int128 *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t *, uint64_t);
  id v18;
  __int128 v20;

  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(a1 + 24);
  v7 = type metadata accessor for ColorReadingView(0, v5, v6, a2);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (uint64_t *)((char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v20 - v12;
  v14 = *((_QWORD *)v3 + 2);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v5;
  *(_QWORD *)(v15 + 24) = v6;
  v20 = *v3;
  *(_OWORD *)(v15 + 32) = v20;
  *(_QWORD *)(v15 + 48) = v14;
  sub_20CE16E58((uint64_t)sub_20CE1688C, v15, v5, v6, v11);
  v16 = MEMORY[0x212B97A80](&unk_20CE6CB58, v7);
  sub_20CE16994(v11, v7, v16);
  v17 = *(void (**)(uint64_t *, uint64_t))(v8 + 8);
  v18 = (id)v20;
  swift_retain();
  v17(v11, v7);
  sub_20CE16998((uint64_t)v13, v7, a3);
  return ((uint64_t (*)(char *, uint64_t))v17)(v13, v7);
}

uint64_t type metadata accessor for ColorReadingView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ColorReadingView);
}

void sub_20CE1707C()
{
  sub_20CE2BB64((uint64_t)&unk_253CFA368);
}

void sub_20CE170A0()
{
  sub_20CE2BB64((uint64_t)&unk_253CFA358);
}

unint64_t sub_20CE170C4()
{
  unint64_t result;

  result = qword_254996CD8;
  if (!qword_254996CD8)
  {
    result = MEMORY[0x212B97A80](&unk_20CE6BF54, &_s16IconBlendModeKeyVN);
    atomic_store(result, (unint64_t *)&qword_254996CD8);
  }
  return result;
}

unint64_t sub_20CE17100()
{
  unint64_t result;

  result = qword_254996CD0;
  if (!qword_254996CD0)
  {
    result = MEMORY[0x212B97A80](&unk_20CE6BF8C, &_s15ClipsCornersKeyVN);
    atomic_store(result, (unint64_t *)&qword_254996CD0);
  }
  return result;
}

unint64_t sub_20CE1713C()
{
  unint64_t result;

  result = qword_253CFA130;
  if (!qword_253CFA130)
  {
    result = MEMORY[0x212B97A80](&unk_20CE6BB6C, &type metadata for SymbolIconView);
    atomic_store(result, (unint64_t *)&qword_253CFA130);
  }
  return result;
}

double sub_20CE17178(double a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  unsigned __int8 v15;
  char v16;
  double v17;
  double v18;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  BOOL v28;
  double v29;
  double v30;
  unsigned __int8 v31;
  char v32;

  v3 = *(void **)v1;
  v22 = *(_QWORD *)(v1 + 16);
  v23 = *(_QWORD *)(v1 + 8);
  v21 = *(_BYTE *)(v1 + 24);
  v4 = *(void **)(v1 + 32);
  v5 = *(_QWORD *)(v1 + 48);
  v6 = *(_BYTE *)(v1 + 56);
  v7 = *(_QWORD *)(v1 + 80);
  v8 = *(_BYTE *)(v1 + 88);
  v9 = *(_QWORD *)(v1 + 104);
  *(_QWORD *)&v24 = *(_QWORD *)(v1 + 96);
  *((_QWORD *)&v24 + 1) = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA420);
  sub_20CE67554();
  v10 = objc_msgSend(v3, sel_symbolName);
  v20 = sub_20CE67638();
  v12 = v11;

  if (v4)
  {
    sub_20CE15F58(v4);
    sub_20CE15F58(v4);
    v13 = v4;
  }
  else
  {
    v13 = 0;
  }
  sub_20CE17348(v13);
  sub_20CE17348(0);
  sub_20CE17348(v13);
  sub_20CE15B98(v5, v6);
  v14 = sub_20CE17F3C(v5, v6);
  sub_20CE158B0(v5, v6);
  v15 = objc_msgSend(v3, sel_hasClearBackground);
  sub_20CE15B98(v7, v8);
  sub_20CE17358(v7, v8, &v24);
  sub_20CE158B0(v7, v8);
  v16 = v24;
  *(_QWORD *)&v24 = v20;
  *((_QWORD *)&v24 + 1) = v12;
  v25 = v23;
  v26 = v22;
  v27 = v21;
  v28 = v4 == 0;
  v29 = v14;
  v30 = a1;
  v31 = v15;
  v32 = v16;
  sub_20CE193D4(&v24);
  v18 = v17;
  swift_bridgeObjectRelease();
  swift_release();
  return v18;
}

void sub_20CE17348(id a1)
{
  if ((unint64_t)a1 >= 2)

}

uint64_t sub_20CE17358@<X0>(uint64_t a1@<X0>, char a2@<W1>, _BYTE *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  os_log_type_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[3];
  uint64_t v19;

  v6 = sub_20CE6714C();
  v7 = *(_QWORD *)(v6 - 8);
  result = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    *a3 = a1 & 1;
  }
  else
  {
    sub_20CE15B98(a1, 0);
    v11 = sub_20CE67734();
    v12 = sub_20CE67224();
    v13 = v11;
    if (os_log_type_enabled(v12, v11))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      v18[1] = a3;
      v16 = v15;
      v19 = v15;
      *(_DWORD *)v14 = 136315138;
      sub_20CE29ED4(0xD000000000000010, 0x800000020CE6DDB0, &v19);
      v18[2] = v17;
      sub_20CE67764();
      _os_log_impl(&dword_20CE0F000, v12, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212B97B1C](v16, -1, -1);
      MEMORY[0x212B97B1C](v14, -1, -1);
    }

    sub_20CE67140();
    swift_getAtKeyPath();
    sub_20CE158B0(a1, 0);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  return result;
}

void RoundedBackgroundIconView.body.getter(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 *v2;
  __int128 *v3;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38[9];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 *v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  __int128 v64;
  char v65;

  v3 = v2;
  v50 = a2;
  v5 = *(_QWORD *)(a1 + 16);
  sub_20CE66FCC();
  OUTLINED_FUNCTION_86();
  v39 = sub_20CE66F90();
  v41 = sub_20CE66F90();
  v40 = sub_20CE66F90();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996998);
  v42 = OUTLINED_FUNCTION_62_0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253CFA270);
  v51 = OUTLINED_FUNCTION_62_0();
  v43 = sub_20CE6720C();
  v6 = sub_20CE67458();
  v38[3] = *(_QWORD *)(sub_20CE66F90() - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_81();
  v38[5] = v8;
  MEMORY[0x24BDAC7A8](v9);
  v38[4] = (uint64_t)v38 - v10;
  v38[2] = *(_QWORD *)(a1 - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_38_0(v12, v38[0]);
  v49 = v13;
  v38[8] = *(_QWORD *)(sub_20CE6720C() - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_81();
  v38[7] = v15;
  MEMORY[0x24BDAC7A8](v16);
  v38[6] = (uint64_t)v38 - v17;
  v48 = v18;
  v19 = sub_20CE6720C();
  v46 = *(_QWORD *)(v19 - 8);
  v47 = v19;
  OUTLINED_FUNCTION_56_0();
  MEMORY[0x24BDAC7A8](v20);
  v45 = (char *)v38 - v21;
  v44 = *(_QWORD *)(v6 - 8);
  OUTLINED_FUNCTION_1();
  v23 = MEMORY[0x24BDAC7A8](v22);
  v24 = MEMORY[0x24BDAC7A8](v23);
  MEMORY[0x24BDAC7A8](v24);
  v25 = *((_BYTE *)v2 + 16);
  v64 = *v2;
  v65 = v25;
  sub_20CE17EE8();
  sub_20CE17D04();
  v27 = v26;
  objc_msgSend(v26, sel_size);
  v29 = v28;

  v30 = sub_20CE269EC(v29);
  v31 = *(_QWORD *)(a1 + 24);
  v52 = v5;
  v53 = v31;
  v54 = v3;
  v55 = v30;
  v56 = v32;
  v63[0] = v31;
  v63[1] = MEMORY[0x24BDEDB58];
  v33 = MEMORY[0x24BDED308];
  v62[0] = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v39, v63);
  v62[1] = MEMORY[0x24BDEC438];
  v61[0] = MEMORY[0x212B97A80](v33, v41, v62);
  v61[1] = MEMORY[0x24BDEBEE0];
  v34 = MEMORY[0x212B97A80](v33, v40, v61);
  sub_20CE18AAC((uint64_t)&unk_2549969A0);
  v60[0] = v34;
  v60[1] = v35;
  v36 = MEMORY[0x212B97A80](v33, v42, v60);
  sub_20CE18AAC((uint64_t)&unk_253CFA268);
  v59[0] = v36;
  v59[1] = v37;
  v57 = MEMORY[0x212B97A80](v33, v51, v59);
  v58 = v31;
  OUTLINED_FUNCTION_74();
}

void sub_20CE178BC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_20CE6744C();
  v6 = *(unsigned __int8 *)(v3 + 16);
  v7 = v6 >> 5;
  v1[21] = a1;
  if (!(v6 >> 5) || v7 == 3 || v7 == 4 && v6 == 128 && !*(_QWORD *)(v3 + 8) && *(_QWORD *)v3 == 2)
  {
    *(_QWORD *)(v4 - 232) = a1;
    OUTLINED_FUNCTION_6();
  }
  v9 = v1[1];
  v8 = v1[2];
  OUTLINED_FUNCTION_79(v9, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16));
  *v1 = v2;
  if (v7 == 2)
  {
    v10 = *(_QWORD *)(v9 + 24);
    OUTLINED_FUNCTION_28(v9, *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
    if (!v10)
    {
      sub_20CE675D8();
      v1[31] = a1;
      OUTLINED_FUNCTION_6();
    }
  }
  else
  {
    OUTLINED_FUNCTION_28(v9, *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  }
  sub_20CE675CC();
  v1[39] = a1;
  OUTLINED_FUNCTION_6();
}

void sub_20CE17AD4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  sub_20CE67344();
  *(_QWORD *)(v1 + 296) = a1;
  *(_QWORD *)(v1 + 304) = v2;
  OUTLINED_FUNCTION_6();
}

void sub_20CE17B20()
{
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_35_0();
  OUTLINED_FUNCTION_50_0();
  OUTLINED_FUNCTION_24_0();
  sub_20CE18ADC();
  JUMPOUT(0x20CE17B38);
}

void sub_20CE17B60(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 272) = a1;
  *(_QWORD *)(v1 + 280) = v2;
  OUTLINED_FUNCTION_6();
}

void sub_20CE17B78(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 256) = a1;
  *(_QWORD *)(v1 + 264) = a1;
  OUTLINED_FUNCTION_10();
}

void sub_20CE17B90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v4 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 64);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, v2, v1);
  OUTLINED_FUNCTION_52_0();
  sub_20CE17C8C();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v5(v4, v1);
  v5(v2, v1);
  JUMPOUT(0x20CE17BE8);
}

void sub_20CE17C08(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 352) = a1;
  *(_QWORD *)(v1 + 360) = MEMORY[0x24BDEBEE0];
  OUTLINED_FUNCTION_6();
}

void sub_20CE17C2C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 336) = a1;
  *(_QWORD *)(v1 + 344) = a1;
  OUTLINED_FUNCTION_10();
}

void sub_20CE17C44(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 320) = a1;
  *(_QWORD *)(v1 + 328) = v2;
  OUTLINED_FUNCTION_74();
}

void sub_20CE17C58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v0 + 128);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 16))(*(_QWORD *)(v0 + 160), v2, v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v1);
  OUTLINED_FUNCTION_13();
}

void sub_20CE17C8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_56_0();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))((char *)&v4 - v3, v1, v0);
  swift_storeEnumTagMultiPayload();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_34_0();
}

void sub_20CE17D04()
{
  __asm { BR              X13 }
}

id sub_20CE17D40@<X0>(double a1@<X8>, double a2@<D1>)
{
  double v2;

  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BE51AB0]), sel_initWithSize_scale_, a1 * a2, a1 * a2, v2);
}

id sub_20CE17DAC()
{
  void *v0;

  v0 = (void *)objc_opt_self();
  return OUTLINED_FUNCTION_63_0(v0, sel_imageDescriptorNamed_);
}

double sub_20CE17EA4(uint64_t a1, double result)
{
  unsigned int v2;
  unsigned int v3;
  BOOL v4;
  BOOL v5;

  v2 = *(unsigned __int8 *)(a1 + 16);
  v3 = v2 >> 5;
  if (v2 >> 5)
    v4 = v3 == 3;
  else
    v4 = 1;
  if (!v4)
  {
    if (v3 != 4)
      return result / 0.8;
    v5 = v2 == 128 && *(_QWORD *)(a1 + 8) == 0;
    if (!v5 || *(_QWORD *)a1 != 2)
      return result / 0.8;
  }
  return result;
}

double sub_20CE17EE8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  double v3;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_BYTE *)(v0 + 56);
  sub_20CE15B98(v1, v2);
  v3 = sub_20CE17F3C(v1, v2);
  sub_20CE158B0(v1, v2);
  return v3;
}

double sub_20CE17F3C(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  double v16;

  v4 = sub_20CE6714C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return *(double *)&a1;
  swift_retain();
  v8 = sub_20CE67734();
  v9 = sub_20CE67224();
  v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v16 = *(double *)&v12;
    *(_DWORD *)v11 = 136315138;
    sub_20CE29ED4(0x74616F6C464743, 0xE700000000000000, (uint64_t *)&v16);
    v15 = v13;
    sub_20CE67764();
    _os_log_impl(&dword_20CE0F000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212B97B1C](v12, -1, -1);
    MEMORY[0x212B97B1C](v11, -1, -1);
  }

  sub_20CE67140();
  swift_getAtKeyPath();
  sub_20CE158B0(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v16;
}

uint64_t sub_20CE180FC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>)
{
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  void *v39;
  void (*v40)(double, double);
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  void *v49;
  void *v50;
  void (*v51)(char *, char *, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(char *, uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  void (*v85)(char *, char *, uint64_t);
  void (*v86)(char *, uint64_t);
  char *v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t *v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  char *v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char v125;
  _QWORD v126[2];
  _QWORD v127[2];
  _QWORD v128[2];
  _QWORD v129[2];
  _QWORD v130[2];
  _QWORD v131[2];
  _QWORD v132[2];
  _QWORD v133[2];
  _QWORD v134[2];
  _QWORD v135[2];
  _QWORD v136[2];
  _QWORD v137[2];
  _QWORD v138[2];
  _QWORD v139[2];
  _QWORD v140[2];
  _QWORD v141[3];

  v115 = a3;
  v118 = a4;
  v114 = sub_20CE675F0();
  v102 = *(uint64_t **)(v114 - 8);
  MEMORY[0x24BDAC7A8](v114);
  v101 = (char *)&v97 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CE66FCC();
  v11 = sub_20CE66F90();
  v103 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v119 = (char *)&v97 - v12;
  v122 = v13;
  v14 = sub_20CE66F90();
  v105 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v104 = (char *)&v97 - v15;
  v121 = v16;
  v17 = sub_20CE66F90();
  v107 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v106 = (char *)&v97 - v18;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996998);
  v120 = v17;
  v19 = sub_20CE66F90();
  v110 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v108 = (char *)&v97 - v20;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253CFA270);
  v21 = sub_20CE66F90();
  v111 = *(_QWORD *)(v21 - 8);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v97 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v22);
  v109 = (char *)&v97 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v112 = (char *)&v97 - v28;
  v29 = *(_QWORD *)(a2 - 8);
  v30 = MEMORY[0x24BDAC7A8](v27);
  v32 = (char *)&v97 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30);
  v34 = (char *)&v97 - v33;
  v35 = sub_20CE6720C();
  v116 = *(_QWORD *)(v35 - 8);
  v117 = v35;
  v36 = MEMORY[0x24BDAC7A8](v35);
  v38 = (char *)&v97 - v37;
  v39 = (void *)a1[3];
  if (v39)
  {
    v97 = v24;
    v98 = v38;
    v99 = v21;
    v100 = v19;
    v40 = (void (*)(double, double))a1[4];
    v113 = v39;
    v40(a5, a6);
    v41 = v115;
    type metadata accessor for RoundedBackgroundIconView(0, a2, v115, v42);
    v43 = v101;
    sub_20CE1666C();
    v44 = v41;
    sub_20CE67398();
    ((void (*)(char *, uint64_t))v102[1])(v43, v114);
    v45 = *(void (**)(char *, uint64_t))(v29 + 8);
    v114 = a2;
    v45(v34, a2);
    v46 = *a1;
    v47 = a1[1];
    v48 = *((unsigned __int8 *)a1 + 16);
    sub_20CE17EE8();
    v102 = a1;
    if (v48 < 0x20)
    {
      v123 = v46;
      v124 = v47;
      v125 = v48;
      sub_20CE17D04();
      v50 = v49;
      objc_msgSend(v49, sel_size);

    }
    v65 = MEMORY[0x24BDEC438];
    v130[0] = v44;
    v130[1] = MEMORY[0x24BDEDB58];
    v66 = MEMORY[0x24BDED308];
    v67 = v122;
    v68 = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v122, v130);
    v69 = v104;
    v70 = v119;
    sub_20CE67350();
    (*(void (**)(char *, uint64_t))(v103 + 8))(v70, v67);
    v129[0] = v68;
    v129[1] = v65;
    v71 = v121;
    v72 = MEMORY[0x212B97A80](v66, v121, v129);
    sub_20CE675CC();
    v73 = v106;
    sub_20CE67344();
    v74 = (*(uint64_t (**)(char *, uint64_t))(v105 + 8))(v69, v71);
    MEMORY[0x24BDAC7A8](v74);
    *(&v97 - 6) = (char *)v114;
    *(&v97 - 5) = (char *)v44;
    *(&v97 - 4) = (char *)v102;
    *((double *)&v97 - 3) = a5;
    *((double *)&v97 - 2) = a6;
    *(&v97 - 1) = v113;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254996B30);
    v128[0] = v72;
    v128[1] = MEMORY[0x24BDEBEE0];
    v75 = v120;
    v76 = MEMORY[0x212B97A80](v66, v120, v128);
    sub_20CE2BB64((uint64_t)&unk_254996B38);
    sub_20CE30BD8();
    v77 = v108;
    sub_20CE672F0();
    (*(void (**)(char *, uint64_t))(v107 + 8))(v73, v75);
    sub_20CE18AAC((uint64_t)&unk_2549969A0);
    v127[0] = v76;
    v127[1] = v78;
    v52 = v44;
    v79 = MEMORY[0x24BDED308];
    v19 = v100;
    v80 = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v100, v127);
    v81 = v109;
    sub_20CE6735C();
    (*(void (**)(char *, uint64_t))(v110 + 8))(v77, v19);
    sub_20CE18AAC((uint64_t)&unk_253CFA268);
    v126[0] = v80;
    v126[1] = v82;
    v21 = v99;
    MEMORY[0x212B97A80](v79, v99, v126);
    v83 = v111;
    v84 = v112;
    v85 = *(void (**)(char *, char *, uint64_t))(v111 + 16);
    v85(v112, v81, v21);
    v86 = *(void (**)(char *, uint64_t))(v83 + 8);
    v86(v81, v21);
    v87 = v97;
    v85(v97, v84, v21);
    v64 = v98;
    sub_20CE17C8C();

    v88 = v87;
    v62 = v121;
    v86(v88, v21);
    v63 = v120;
    v86(v84, v21);
    v61 = v122;
  }
  else
  {
    ((void (*)(uint64_t, double, double))a1[4])(v36, a5, a6);
    v51 = *(void (**)(char *, char *, uint64_t))(v29 + 16);
    v51(v34, v32, a2);
    v119 = *(char **)(v29 + 8);
    ((void (*)(char *, uint64_t))v119)(v32, a2);
    v51(v32, v34, a2);
    v52 = v115;
    v141[0] = v115;
    v141[1] = MEMORY[0x24BDEDB58];
    v53 = MEMORY[0x24BDED308];
    v140[0] = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v122, v141);
    v140[1] = MEMORY[0x24BDEC438];
    v139[0] = MEMORY[0x212B97A80](v53, v121, v140);
    v139[1] = MEMORY[0x24BDEBEE0];
    v54 = v53;
    v55 = v120;
    v56 = MEMORY[0x212B97A80](v54, v120, v139);
    sub_20CE18AAC((uint64_t)&unk_2549969A0);
    v138[0] = v56;
    v138[1] = v57;
    v58 = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v19, v138);
    sub_20CE18AAC((uint64_t)&unk_253CFA268);
    v137[0] = v58;
    v137[1] = v59;
    MEMORY[0x212B97A80](MEMORY[0x24BDED308], v21, v137);
    sub_20CE18ADC();
    v60 = (void (*)(char *, uint64_t))v119;
    ((void (*)(char *, uint64_t))v119)(v32, a2);
    v60(v34, a2);
    v62 = v121;
    v61 = v122;
    v63 = v55;
    v64 = v38;
  }
  v136[0] = v52;
  v136[1] = MEMORY[0x24BDEDB58];
  v89 = MEMORY[0x24BDED308];
  v135[0] = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v61, v136);
  v135[1] = MEMORY[0x24BDEC438];
  v134[0] = MEMORY[0x212B97A80](v89, v62, v135);
  v134[1] = MEMORY[0x24BDEBEE0];
  v90 = MEMORY[0x212B97A80](v89, v63, v134);
  sub_20CE18AAC((uint64_t)&unk_2549969A0);
  v133[0] = v90;
  v133[1] = v91;
  v92 = MEMORY[0x212B97A80](v89, v19, v133);
  sub_20CE18AAC((uint64_t)&unk_253CFA268);
  v132[0] = v92;
  v132[1] = v93;
  v131[0] = MEMORY[0x212B97A80](v89, v21, v132);
  v131[1] = v52;
  v94 = v117;
  MEMORY[0x212B97A80](MEMORY[0x24BDEF3E0], v117, v131);
  v95 = v116;
  (*(void (**)(uint64_t, char *, uint64_t))(v116 + 16))(v118, v64, v94);
  return (*(uint64_t (**)(char *, uint64_t))(v95 + 8))(v64, v94);
}

void sub_20CE18AAC(uint64_t a1)
{
  uint64_t *v1;

  if (!OUTLINED_FUNCTION_48(a1))
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v1);
    OUTLINED_FUNCTION_66();
  }
  OUTLINED_FUNCTION_4();
}

void sub_20CE18ADC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_56_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_79((uint64_t)&v4 - v3, v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16));
  swift_storeEnumTagMultiPayload();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_34_0();
}

uint64_t sub_20CE18B50@<X0>(uint64_t a1@<X8>, double a2@<D1>)
{
  uint64_t v2;

  return sub_20CE18B58(v2 + 16, a1, a2);
}

uint64_t sub_20CE18B58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D1>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t KeyPath;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD __dst[14];
  __int128 v31;
  id v32[2];
  void *v33;
  _BYTE v34[32];

  v29 = a2;
  v5 = sub_20CE66F78();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(id *)a1;
  v10 = objc_msgSend(*(id *)a1, sel_symbolName);
  v28 = sub_20CE67638();
  v27 = v11;

  memcpy(__dst, (const void *)a1, sizeof(__dst));
  v12 = sub_20CE17178(a3);
  v13 = *(_QWORD *)(a1 + 64);
  v14 = *(unsigned __int8 *)(a1 + 72);
  v15 = *(unsigned __int8 *)(a1 + 73);
  sub_20CE15BA4(v13, v14, *(_BYTE *)(a1 + 73));
  v16 = sub_20CE18EE8(v13, v14 | (v15 << 8));
  v18 = v17;
  sub_20CE158BC(v13, v14, v15);
  if ((v18 & 1) != 0)
  {
    sub_20CE67260();
    v19 = v20;
  }
  else
  {
    v19 = v16;
  }
  sub_20CE19388((uint64_t *)(a1 + 32), (uint64_t)v32);
  sub_20CE19388((uint64_t *)v32, (uint64_t)&v33);
  v21 = v33;
  if (v33 == (void *)1)
  {
    v23 = sub_20CE67410();
  }
  else
  {
    sub_20CE158C8(a1);
    if (v21)
    {
      sub_20CE18E38(v32);
      v23 = MEMORY[0x212B96C94](objc_msgSend(v21, sel_platformColor));
      sub_20CE190BC(v32);
    }
    else
    {
      v22 = objc_msgSend(v9, sel_symbolColor);
      v23 = MEMORY[0x212B96C94](objc_msgSend(v22, sel_platformColor));

    }
    sub_20CE190E8(a1);
  }
  KeyPath = swift_getKeyPath();
  __dst[0] = v28;
  __dst[1] = v27;
  *(double *)&__dst[2] = v12;
  __dst[3] = v19;
  __dst[4] = KeyPath;
  __dst[5] = v23;
  sub_20CE196EC((__int128 *)(a1 + 8), (uint64_t)&v31);
  sub_20CE196EC(&v31, (uint64_t)v34);
  if (v34[16] > 0x1Fu)
    sub_20CE66F6C();
  else
    sub_20CE66F60();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA2A0);
  sub_20CE18E64();
  sub_20CE67320();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

id *sub_20CE18E38(id *a1)
{
  sub_20CE15F58(*a1);
  return a1;
}

unint64_t sub_20CE18E64()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_253CFA298;
  if (!qword_253CFA298)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253CFA2A0);
    v2 = sub_20CE19BEC();
    sub_20CE18AAC((uint64_t)&unk_253CFA3D0);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_253CFA298);
  }
  return result;
}

uint64_t sub_20CE18EE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[2];
  uint64_t v16;

  v4 = sub_20CE6714C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 0x100) == 0)
  {
    swift_retain();
    v8 = sub_20CE67734();
    v9 = sub_20CE67224();
    v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v16 = v12;
      *(_DWORD *)v11 = 136315138;
      v15[0] = v11 + 4;
      sub_20CE29ED4(0xD000000000000010, 0x800000020CE6DD90, &v16);
      v15[1] = v13;
      sub_20CE67764();
      _os_log_impl(&dword_20CE0F000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212B97B1C](v12, -1, -1);
      MEMORY[0x212B97B1C](v11, -1, -1);
    }

    sub_20CE67140();
    swift_getAtKeyPath();
    sub_20CE158BC(a1, a2, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v16;
  }
  return a1;
}

id *sub_20CE190BC(id *a1)
{
  sub_20CE17348(*a1);
  return a1;
}

uint64_t sub_20CE190E8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_BYTE *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_BYTE *)(a1 + 73);
  v7 = *(_QWORD *)(a1 + 80);
  v8 = *(_BYTE *)(a1 + 88);
  v9 = *(unsigned __int8 *)(a1 + 72);

  sub_20CE17348(v2);
  sub_20CE158B0(v3, v4);
  sub_20CE158BC(v5, v9, v6);
  sub_20CE158B0(v7, v8);
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_20CE191AC@<X0>(uint64_t a1@<X8>)
{
  const void *v1;
  const void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  id __dst[14];
  __int128 v16;
  uint64_t v17[2];
  uint64_t v18;
  char v19;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA210);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&__dst[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&__dst[-1] - v8;
  memcpy(__dst, v2, sizeof(__dst));
  sub_20CE19388((uint64_t *)&__dst[4], (uint64_t)v17);
  sub_20CE19388(v17, (uint64_t)&v18);
  if (v18 && (v18 == 1 || v19 != 1))
    v10 = 0;
  else
    v10 = objc_msgSend(__dst[0], sel_background);
  sub_20CE196EC((__int128 *)&__dst[1], (uint64_t)&v16);
  v11 = swift_allocObject();
  memcpy((void *)(v11 + 16), __dst, 0x70uLL);
  *((_QWORD *)v7 + 6) = swift_getKeyPath();
  v7[56] = 0;
  *((_QWORD *)v7 + 8) = swift_getKeyPath();
  v7[72] = 0;
  v12 = (uint64_t *)&v7[*(int *)(v4 + 52)];
  *v12 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254996990);
  swift_storeEnumTagMultiPayload();
  sub_20CE196EC(&v16, (uint64_t)v7);
  *((_QWORD *)v7 + 3) = v10;
  *((_QWORD *)v7 + 4) = sub_20CE18B50;
  *((_QWORD *)v7 + 5) = v11;
  sub_20CE193A0((uint64_t)v7, (uint64_t)v9, &qword_253CFA210);
  sub_20CE193A0((uint64_t)v9, a1, &qword_253CFA210);
  return sub_20CE158C8((uint64_t)__dst);
}

uint64_t sub_20CE19388(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *a1;
  *(_BYTE *)(a2 + 8) = *((_BYTE *)a1 + 8);
  *(_QWORD *)a2 = v2;
  return a2;
}

void sub_20CE193A0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = OUTLINED_FUNCTION_35(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

uint64_t sub_20CE193D4(__int128 *a1)
{
  uint64_t v1;
  __int128 v2;
  uint64_t result;
  char v4;
  __int128 v5;
  double v6;
  double v7;
  double v8;
  int v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[26];
  __int128 v30;
  __int128 v31;
  _BYTE v32[24];

  v2 = a1[2];
  v28 = a1[1];
  *(_OWORD *)v29 = v2;
  v27 = *a1;
  *(_OWORD *)&v29[10] = *(__int128 *)((char *)a1 + 42);
  if ((BYTE1(v2) & 1) != 0
    || (sub_20CE196EC(&v28, (uint64_t)&v30), result = sub_20CE196EC(&v30, (uint64_t)v32), (v32[16] & 0xE0) != 0x40))
  {
    swift_beginAccess();
    if (*(_QWORD *)(*(_QWORD *)(v1 + 16) + 16))
    {
      sub_20CE19768((uint64_t)&v27);
      swift_bridgeObjectRetain();
      sub_20CE12FE0(&v27);
      if ((v4 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return sub_20CE19740((uint64_t)&v27);
      }
      swift_bridgeObjectRelease();
      sub_20CE19740((uint64_t)&v27);
    }
    v5 = v27;
    if ((sub_20CE67698() & 1) != 0 || (sub_20CE67698() & 1) != 0)
    {
      if (v29[25] == 1)
        v6 = 0.528;
      else
        v6 = 0.66;
      v7 = *(double *)&v29[16] * v6;
      goto LABEL_13;
    }
    v9 = v29[25];
    v10 = *(double *)&v29[16] * 0.58;
    v7 = *(double *)&v29[16] * 0.464;
    if (v29[25])
      v11 = *(double *)&v29[16] * 0.464;
    else
      v11 = *(double *)&v29[16] * 0.58;
    sub_20CE15F68(0, &qword_254996B20);
    v12 = *(double *)&v29[8];
    sub_20CE19768((uint64_t)&v27);
    v13 = sub_20CE261D0(v11, v12, v5, *((uint64_t *)&v5 + 1), 1);
    if (v13)
    {
      v14 = v13;
      objc_msgSend(v13, sel_sizeInPoints);
      v16 = v15;
      v18 = v17;

    }
    else
    {
      v18 = 0.0;
      v16 = 0.0;
    }
    sub_20CE196EC(&v28, (uint64_t)&v31);
    sub_20CE196EC(&v31, (uint64_t)&v26);
    sub_20CE17D04();
    v20 = v19;
    objc_msgSend(v19, sel_size);
    v22 = v21;

    if (v16 > v18)
      v23 = v16;
    else
      v23 = v18;
    v24 = v23 / v22;
    if (v9)
    {
      v25 = 0.608;
      if (v24 <= 0.608)
        goto LABEL_13;
    }
    else
    {
      v25 = 0.76;
      v7 = v10;
      if (v24 <= 0.76)
      {
LABEL_13:
        v8 = round(v7 * *(double *)&v29[8]) / *(double *)&v29[8];
        swift_beginAccess();
        sub_20CE19768((uint64_t)&v27);
        sub_20CE2A62C(&v27, v8);
        swift_endAccess();
        return sub_20CE19740((uint64_t)&v27);
      }
    }
    v7 = v11 * v25 / v24;
    goto LABEL_13;
  }
  return result;
}

uint64_t sub_20CE196EC(__int128 *a1, uint64_t a2)
{
  __int128 v2;

  v2 = *a1;
  *(_BYTE *)(a2 + 16) = *((_BYTE *)a1 + 16);
  *(_OWORD *)a2 = v2;
  return a2;
}

unint64_t sub_20CE19704()
{
  unint64_t result;

  result = qword_253CFA118;
  if (!qword_253CFA118)
  {
    result = MEMORY[0x212B97A80](&protocol conformance descriptor for AppIconView, &type metadata for AppIconView);
    atomic_store(result, (unint64_t *)&qword_253CFA118);
  }
  return result;
}

uint64_t sub_20CE19740(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_20CE19768(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void type metadata accessor for CGImage(uint64_t a1)
{
  sub_20CE12644(a1, (unint64_t *)&unk_253CFA450);
}

void sub_20CE1981C(uint64_t a1)
{
  uint64_t *v1;

  if (!OUTLINED_FUNCTION_48(a1))
  {
    OUTLINED_FUNCTION_4_0(0, v1);
    OUTLINED_FUNCTION_66_0();
    OUTLINED_FUNCTION_10();
  }
  OUTLINED_FUNCTION_46();
}

unint64_t sub_20CE1985C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253CFA3B8;
  if (!qword_253CFA3B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_253CFA3C0);
    result = MEMORY[0x212B97A80](MEMORY[0x24BDF1028], v1);
    atomic_store(result, (unint64_t *)&qword_253CFA3B8);
  }
  return result;
}

unint64_t sub_20CE198A0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_253CFA388;
  if (!qword_253CFA388)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253CFA390);
    sub_20CE2BB64((uint64_t)&unk_253CFA378);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDF5560];
    result = MEMORY[0x212B97A80](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_253CFA388);
  }
  return result;
}

uint64_t sub_20CE1992C()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_20CE675F0();
  __swift_allocate_value_buffer(v0, qword_254996CA8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_254996CA8);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v0 - 8) + 104))(v1, *MEMORY[0x24BDF50D0], v0);
}

unint64_t sub_20CE19984()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_253CFA328;
  if (!qword_253CFA328)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253CFA330);
    v2[0] = sub_20CE199F0();
    v2[1] = MEMORY[0x24BDEC438];
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_253CFA328);
  }
  return result;
}

unint64_t sub_20CE199F0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_253CFA2F8;
  if (!qword_253CFA2F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253CFA300);
    v2 = sub_20CE1985C();
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_253CFA2F8);
  }
  return result;
}

uint64_t sub_20CE19A5C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20CE19A6C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_20CE19AA0()
{
  unint64_t v0;

  sub_20CE12734(319, &qword_2549969D0, (void (*)(uint64_t))MEMORY[0x24BDF5118]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_20CE19B48()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_20CE19B50()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for TopHitViewTextStyle(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_20CE19BEC()
{
  unint64_t result;

  result = qword_253CFA180[0];
  if (!qword_253CFA180[0])
  {
    result = MEMORY[0x212B97A80](&protocol conformance descriptor for ProbablyAlignedSymbol, &type metadata for ProbablyAlignedSymbol);
    atomic_store(result, qword_253CFA180);
  }
  return result;
}

uint64_t sub_20CE19C28()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20CE19C38()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for TopHitViewTextStyle.Resolved(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_20CE19CA0()
{
  void *result;

  type metadata accessor for CGSize(0);
  result = (void *)sub_20CE67620();
  off_253CFA138 = result;
  return result;
}

uint64_t sub_20CE19CE0()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for SymbolIconView.SymbolIconMetrics.Input()
{
  return &type metadata for SymbolIconView.SymbolIconMetrics.Input;
}

unint64_t sub_20CE19D04()
{
  unint64_t result;

  result = qword_253CFA128;
  if (!qword_253CFA128)
  {
    result = MEMORY[0x212B97A80](&unk_20CE6BA64, &type metadata for SymbolIconView.SymbolIconMetrics.Input);
    atomic_store(result, (unint64_t *)&qword_253CFA128);
  }
  return result;
}

unint64_t sub_20CE19D40()
{
  unint64_t result;

  result = qword_253CFA120;
  if (!qword_253CFA120)
  {
    result = MEMORY[0x212B97A80](&unk_20CE6BACC, &type metadata for ImageIconView);
    atomic_store(result, (unint64_t *)&qword_253CFA120);
  }
  return result;
}

unint64_t sub_20CE19D7C()
{
  unint64_t result;

  result = qword_253CFA108;
  if (!qword_253CFA108)
  {
    result = MEMORY[0x212B97A80](&unk_20CE6BB1C, &type metadata for WorkflowGlyphIconView);
    atomic_store(result, (unint64_t *)&qword_253CFA108);
  }
  return result;
}

void ShortcutIndexedSearchView.init(descriptor:)(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t *v5;

  *a2 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  OUTLINED_FUNCTION_24();
  v4 = type metadata accessor for ShortcutIndexedSearchView(0);
  v5 = (uint64_t *)((char *)a2 + *(int *)(v4 + 20));
  *v5 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
  OUTLINED_FUNCTION_24();
  *(uint64_t *)((char *)a2 + *(int *)(v4 + 24)) = a1;
  OUTLINED_FUNCTION_21();
}

void ShortcutIndexedSearchView.body.getter(uint64_t a1@<X8>)
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
  uint64_t KeyPath;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE v28[80];
  char v29[8];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254996408);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_42();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996410);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_3();
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996418);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_41();
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996420);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_40();
  sub_20CE1A04C(v5);
  v11 = sub_20CE1A4C0();
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_51(v5, v3);
  v13 = (uint64_t *)(v3 + *(int *)(v7 + 36));
  *v13 = KeyPath;
  v13[1] = v11;
  sub_20CE21AE0(v5, &qword_254996408);
  sub_20CE1A6F4((uint64_t)v28);
  sub_20CE21A24((uint64_t)v28, (uint64_t)v29, &qword_254996428);
  if (v34)
  {
    v14 = v30;
    v15 = v31;
    v16 = v32;
    v17 = v33;
    sub_20CE1EC80((uint64_t)v28);
  }
  else
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
  }
  v18 = sub_20CE67230();
  sub_20CE21AA4(v3, v2, &qword_254996410);
  v19 = v2 + *(int *)(v26 + 36);
  *(_BYTE *)v19 = v18;
  *(_QWORD *)(v19 + 8) = v14;
  *(_QWORD *)(v19 + 16) = v15;
  *(_QWORD *)(v19 + 24) = v16;
  *(_QWORD *)(v19 + 32) = v17;
  *(_BYTE *)(v19 + 40) = 0;
  sub_20CE21AE0(v3, &qword_254996410);
  v20 = sub_20CE675CC();
  v22 = v21;
  v23 = v4 + *(int *)(v25 + 36);
  sub_20CE1A99C(v1, v23);
  v24 = (uint64_t *)(v23 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254996430) + 36));
  *v24 = v20;
  v24[1] = v22;
  sub_20CE21A24(v2, v4, &qword_254996418);
  sub_20CE21A24(v4, a1, &qword_254996420);
  OUTLINED_FUNCTION_15();
}

void sub_20CE1A04C(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
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
  void (*v16)(char *, _QWORD, uint64_t);
  char v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
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
  char *v36;
  uint64_t v37;
  _BYTE v38[80];
  _BYTE v39[80];
  _QWORD v40[10];
  _QWORD __src[10];
  _QWORD __dst[11];

  v37 = a1;
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996508);
  MEMORY[0x24BDAC7A8](v35);
  v3 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996858);
  MEMORY[0x24BDAC7A8](v32);
  v34 = (uint64_t)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996408);
  MEMORY[0x24BDAC7A8](v5);
  v36 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549964F8);
  MEMORY[0x24BDAC7A8](v33);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_20CE66DC8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v31 - v14;
  sub_20CE2930C();
  v16 = *(void (**)(char *, _QWORD, uint64_t))(v10 + 104);
  v16(v13, *MEMORY[0x24BDFBAD0], v9);
  v17 = sub_20CE66DBC();
  v18 = *(void (**)(char *, uint64_t))(v10 + 8);
  v18(v13, v9);
  v18(v15, v9);
  if ((v17 & 1) != 0)
  {
    sub_20CE1A6F4((uint64_t)v38);
    sub_20CE21A24((uint64_t)v38, (uint64_t)__src, &qword_254996428);
    if (__src[9])
    {
      memcpy(__dst, __src, 0x50uLL);
      v19 = sub_20CE671B8();
      v20 = __dst[5];
      *(_QWORD *)v8 = v19;
      *((_QWORD *)v8 + 1) = v20;
      v8[16] = 0;
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996868);
      sub_20CE1B478(v1, (uint64_t)__dst, (uint64_t)&v8[*(int *)(v21 + 44)]);
      v22 = &qword_2549964F8;
      sub_20CE21AA4((uint64_t)v8, v34, &qword_2549964F8);
      swift_storeEnumTagMultiPayload();
      sub_20CE21718((uint64_t)&unk_2549964F0);
      sub_20CE21718((uint64_t)&unk_254996500);
      v23 = (uint64_t)v36;
      sub_20CE67200();
      sub_20CE1EC80((uint64_t)v38);
      v24 = (uint64_t)v8;
LABEL_7:
      sub_20CE21AE0(v24, v22);
      v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549964E8);
      __swift_storeEnumTagSinglePayload(v23, 0, 1, v29);
      sub_20CE21A24(v23, v37, &qword_254996408);
      return;
    }
  }
  sub_20CE2930C();
  v16(v13, *MEMORY[0x24BDFBAE0], v9);
  v25 = sub_20CE66DBC();
  v18(v13, v9);
  v18(v15, v9);
  if ((v25 & 1) != 0)
  {
    sub_20CE1A6F4((uint64_t)v39);
    sub_20CE21A24((uint64_t)v39, (uint64_t)v40, &qword_254996428);
    if (v40[9])
    {
      memcpy(__dst, v40, 0x50uLL);
      v26 = sub_20CE67188();
      v27 = __dst[5];
      *(_QWORD *)v3 = v26;
      *((_QWORD *)v3 + 1) = v27;
      v3[16] = 0;
      v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996860);
      sub_20CE1BAB4(v1, (uint64_t)__dst, (uint64_t)&v3[*(int *)(v28 + 44)]);
      v22 = &qword_254996508;
      sub_20CE21AA4((uint64_t)v3, v34, &qword_254996508);
      swift_storeEnumTagMultiPayload();
      sub_20CE21718((uint64_t)&unk_2549964F0);
      sub_20CE21718((uint64_t)&unk_254996500);
      v23 = (uint64_t)v36;
      sub_20CE67200();
      sub_20CE1EC80((uint64_t)v39);
      v24 = (uint64_t)v3;
      goto LABEL_7;
    }
  }
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549964E8);
  __swift_storeEnumTagSinglePayload(v37, 1, 1, v30);
}

uint64_t sub_20CE1A4C0()
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  int v15;
  id v17;
  id v18;
  char v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;

  v1 = sub_20CE66E4C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v21 - v6;
  v8 = type metadata accessor for ShortcutIndexedSearchView(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_20CE66DC8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CE2930C();
  v15 = (*(uint64_t (**)(char *, uint64_t))(v12 + 88))(v14, v11);
  if (v15 == *MEMORY[0x24BDFBAD0])
    return sub_20CE673F8();
  if (v15 == *MEMORY[0x24BDFBAE0])
  {
    v17 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
    v18 = objc_msgSend(v17, sel_userInterfaceIdiom);

    sub_20CE20E18(v0, (uint64_t)v10, type metadata accessor for ShortcutIndexedSearchView);
    if (v18)
    {
      sub_20CE1686C();
      (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v5, *MEMORY[0x24BDEB3F0], v1);
      v19 = sub_20CE66E40();
      v20 = *(void (**)(char *, uint64_t))(v2 + 8);
      v20(v5, v1);
      v20(v7, v1);
      sub_20CE21374((uint64_t)v10, type metadata accessor for ShortcutIndexedSearchView);
      if ((v19 & 1) == 0)
        return sub_20CE673E0();
    }
    else
    {
      sub_20CE21374((uint64_t)v10, type metadata accessor for ShortcutIndexedSearchView);
    }
    return sub_20CE673F8();
  }
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return 0;
}

void sub_20CE1A6F4(uint64_t a1@<X8>)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double Width;
  double v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  CGRect v35;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA3E8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_3();
  v10 = sub_20CE67290();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = OUTLINED_FUNCTION_11();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_38();
  v16 = v15 - v14;
  OUTLINED_FUNCTION_61();
  v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 88))(v16, v12);
  if ((_DWORD)v17 == *MEMORY[0x24BDFBAD0])
  {
    OUTLINED_FUNCTION_45(v17, *MEMORY[0x24BDF18F0]);
    v18 = sub_20CE67248();
    OUTLINED_FUNCTION_7(v18);
    sub_20CE21AE0(v2, &qword_253CFA3E8);
    OUTLINED_FUNCTION_28(v3, *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
    sub_20CE67260();
    sub_20CE67284();
    OUTLINED_FUNCTION_56();
    v19 = 0;
    _Q1 = xmmword_20CE6AC60;
    __asm { FMOV            V0.2D, #24.0 }
    v26 = 0x402A000000000000;
    v27 = 0x402E000000000000;
    v28 = 0x4032000000000000;
  }
  else if ((_DWORD)v17 == *MEMORY[0x24BDFBAE0])
  {
    v1 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
    objc_msgSend(v1, sel_bounds);
    OUTLINED_FUNCTION_53();

    v35.origin.x = v4;
    v35.origin.y = v5;
    v35.size.width = v6;
    v35.size.height = v7;
    Width = CGRectGetWidth(v35);
    if (qword_2549963A0 != -1)
    {
      v33 = Width;
      v29 = swift_once();
      Width = v33;
    }
    _NF = *(double *)&qword_25499A160 < Width;
    v31 = 16.0;
    if (_NF)
      v31 = 20.0;
    v34 = *(_QWORD *)&v31;
    OUTLINED_FUNCTION_45(v29, *MEMORY[0x24BDF18F0]);
    v32 = sub_20CE67248();
    OUTLINED_FUNCTION_7(v32);
    sub_20CE21AE0(v2, &qword_253CFA3E8);
    OUTLINED_FUNCTION_28(v3, *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
    sub_20CE67260();
    sub_20CE67284();
    OUTLINED_FUNCTION_56();
    v28 = 0;
    v27 = v34;
    __asm { FMOV            V1.2D, #14.0 }
    *(_QWORD *)&_Q1 = v34;
    _Q0 = xmmword_20CE6AC50;
    v19 = 0x4034000000000000;
    v26 = 0x402A000000000000;
  }
  else
  {
    _Q1 = 0uLL;
    if ((_DWORD)v17 != *MEMORY[0x24BDFBAD8])
    {
      OUTLINED_FUNCTION_50(v16, *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8));
      _Q1 = 0uLL;
    }
    v28 = 0;
    v27 = 0;
    v26 = 0;
    v19 = 0;
    v1 = 0;
    _Q0 = 0uLL;
  }
  *(_QWORD *)a1 = v28;
  *(_QWORD *)(a1 + 8) = v26;
  *(_QWORD *)(a1 + 16) = v27;
  *(_QWORD *)(a1 + 24) = v26;
  *(_OWORD *)(a1 + 32) = _Q1;
  *(_OWORD *)(a1 + 48) = _Q0;
  *(_QWORD *)(a1 + 64) = v19;
  *(_QWORD *)(a1 + 72) = v1;
  OUTLINED_FUNCTION_5();
}

uint64_t sub_20CE1A99C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  _BYTE *v15;
  char v16;
  void (*v17)(_BYTE *, uint64_t);
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  _BYTE v28[80];
  _QWORD v29[11];

  v27 = a2;
  v3 = sub_20CE66FC0();
  MEMORY[0x24BDAC7A8](v3);
  v5 = &v28[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996850);
  MEMORY[0x24BDAC7A8](v6);
  v8 = &v28[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v9 = sub_20CE66DC8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = &v28[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  MEMORY[0x24BDAC7A8](v11);
  v15 = &v28[-v14 - 8];
  sub_20CE2930C();
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v10 + 104))(v13, *MEMORY[0x24BDFBAD0], v9);
  v16 = sub_20CE66DBC();
  v17 = *(void (**)(_BYTE *, uint64_t))(v10 + 8);
  v17(v13, v9);
  v17(v15, v9);
  if ((v16 & 1) != 0
    && (sub_20CE1A6F4((uint64_t)v28), sub_20CE21A24((uint64_t)v28, (uint64_t)v29, &qword_254996428), v29[9]))
  {
    v18 = v29[0];
    v19 = (char *)v5 + *(int *)(v3 + 20);
    v20 = *MEMORY[0x24BDEEB68];
    v21 = sub_20CE67194();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v19, v20, v21);
    *v5 = v18;
    v5[1] = v18;
    v22 = objc_msgSend(*(id *)(a1 + *(int *)(type metadata accessor for ShortcutIndexedSearchView(0) + 24)), sel_backgroundColor);
    v23 = objc_msgSend(v22, sel_paletteGradient);

    sub_20CE1AC1C(v23, (uint64_t)v8);
    sub_20CE1EC80((uint64_t)v28);
    sub_20CE21374((uint64_t)v5, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
    v24 = v27;
    sub_20CE21A24((uint64_t)v8, v27, &qword_254996850);
    v25 = 0;
  }
  else
  {
    v25 = 1;
    v24 = v27;
  }
  return __swift_storeEnumTagSinglePayload(v24, v25, 1, v6);
}

void sub_20CE1AC1C(void *a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
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
  uint64_t (*v18)(void);
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  unsigned int *v29;
  uint64_t (*v30)(void);
  id v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;

  v50 = a2;
  v43 = a1;
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA260);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_2();
  v48 = v5;
  v47 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549970A0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_2();
  v46 = v7;
  sub_20CE66FCC();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_38();
  v11 = v10 - v9;
  v12 = sub_20CE675F0();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_19();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v41 - v15;
  v17 = OUTLINED_FUNCTION_63();
  v18 = MEMORY[0x24BDED998];
  v19 = *(_QWORD *)(v17 - 8);
  v20 = *(_QWORD *)(v19 + 64);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v41 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254996820);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_39();
  v45 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549970B0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_18(v24, v41);
  sub_20CE20E18(v51, (uint64_t)v21, (uint64_t (*)(_QWORD))v18);
  v25 = (*(unsigned __int8 *)(v19 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v26 = swift_allocObject();
  sub_20CE217D4((uint64_t)v21, v26 + v25, (uint64_t (*)(_QWORD))v18);
  v27 = v43;
  v28 = objc_msgSend(v27, sel_blendMode);
  v29 = (unsigned int *)MEMORY[0x24BDF5110];
  if (v28 != (id)1)
    v29 = (unsigned int *)MEMORY[0x24BDF50D0];
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v13 + 104))(v3, *v29, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 32))(v16, v3, v12);
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 16))(v11, v16, v12);
  v30 = MEMORY[0x24BDEDB60];
  sub_20CE20E18(v11, (uint64_t)v2 + *(int *)(v42 + 36), (uint64_t (*)(_QWORD))MEMORY[0x24BDEDB60]);
  *v2 = v27;
  v2[1] = sub_20CE219B8;
  v2[2] = v26;
  v31 = v27;
  swift_retain();
  sub_20CE21374(v11, (uint64_t (*)(_QWORD))v30);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  swift_release();

  Gradient.init(_:)(v31);
  OUTLINED_FUNCTION_16();
  v32 = v48;
  OUTLINED_FUNCTION_52(v51);
  *(_WORD *)(v32 + *(int *)(v49 + 36)) = 256;
  v33 = v46;
  OUTLINED_FUNCTION_37(v32, v46 + *(int *)(v47 + 36));
  v34 = v53;
  *(_OWORD *)v33 = v52;
  *(_OWORD *)(v33 + 16) = v34;
  *(_QWORD *)(v33 + 32) = v54;
  OUTLINED_FUNCTION_55(v32);
  v35 = sub_20CE675CC();
  v37 = v36;
  v38 = v44;
  v39 = v44 + *(int *)(v45 + 36);
  OUTLINED_FUNCTION_37(v33, v39);
  v40 = (uint64_t *)(v39 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254996830) + 36));
  *v40 = v35;
  v40[1] = v37;
  sub_20CE21AA4((uint64_t)v2, v38, (uint64_t *)&unk_254996820);
  OUTLINED_FUNCTION_55(v33);
  sub_20CE21AE0((uint64_t)v2, (uint64_t *)&unk_254996820);
  sub_20CE21AA4(v38, v50, (uint64_t *)&unk_2549970B0);
  sub_20CE21AE0(v38, (uint64_t *)&unk_2549970B0);
  OUTLINED_FUNCTION_15();
}

void sub_20CE1AF9C(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  id v20;
  unsigned int *v21;
  uint64_t v22;
  uint64_t (*v23)(void);
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;

  v33 = a2;
  v3 = sub_20CE66FCC();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_20CE675F0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v32 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549967A0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (_QWORD *)((char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549967A8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = a1;
  v20 = objc_msgSend(v19, sel_blendMode);
  v21 = (unsigned int *)MEMORY[0x24BDF5110];
  if (v20 != (id)1)
    v21 = (unsigned int *)MEMORY[0x24BDF50D0];
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v10, *v21, v6);
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v10, v6);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v5, v12, v6);
  v22 = (uint64_t)v15 + *(int *)(v13 + 36);
  v23 = MEMORY[0x24BDEDB60];
  sub_20CE20E18((uint64_t)v5, v22, (uint64_t (*)(_QWORD))MEMORY[0x24BDEDB60]);
  *v15 = v19;
  v15[1] = sub_20CE218D0;
  v15[2] = 0;
  v24 = v19;
  sub_20CE21374((uint64_t)v5, (uint64_t (*)(_QWORD))v23);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);

  Gradient.init(_:)(v24);
  sub_20CE66F54();
  v25 = v34;
  v32 = v35;
  v26 = v36;
  v27 = v37;
  v28 = sub_20CE675CC();
  v30 = v29;
  sub_20CE21AA4((uint64_t)v15, (uint64_t)v18, &qword_2549967A0);
  v31 = &v18[*(int *)(v16 + 36)];
  *(_QWORD *)v31 = v25;
  *(_OWORD *)(v31 + 8) = v32;
  *((_QWORD *)v31 + 3) = v26;
  *((_QWORD *)v31 + 4) = v27;
  *((_WORD *)v31 + 20) = 256;
  *((_QWORD *)v31 + 6) = v28;
  *((_QWORD *)v31 + 7) = v30;
  sub_20CE21AE0((uint64_t)v15, &qword_2549967A0);
  sub_20CE21AA4((uint64_t)v18, v33, &qword_2549967A8);
  sub_20CE21AE0((uint64_t)v18, &qword_2549967A8);
}

void sub_20CE1B250(void *a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  id v17;
  id v18;
  unsigned int *v19;
  uint64_t v20;
  uint64_t (*v21)(void);
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;

  v31 = a2;
  sub_20CE66FCC();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_17();
  v8 = sub_20CE675F0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_19();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v30 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996840);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_3();
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996848);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_40();
  v17 = a1;
  v18 = objc_msgSend(v17, sel_blendMode);
  v19 = (unsigned int *)MEMORY[0x24BDF5110];
  if (v18 != (id)1)
    v19 = (unsigned int *)MEMORY[0x24BDF50D0];
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v9 + 104))(v4, *v19, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 32))(v12, v4, v8);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 16))(v5, v12, v8);
  v20 = (uint64_t)v2 + *(int *)(v13 + 36);
  v21 = MEMORY[0x24BDEDB60];
  sub_20CE20E18(v5, v20, (uint64_t (*)(_QWORD))MEMORY[0x24BDEDB60]);
  *v2 = v17;
  v2[1] = sub_20CE218D0;
  v2[2] = 0;
  v22 = v17;
  sub_20CE21374(v5, (uint64_t (*)(_QWORD))v21);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);

  Gradient.init(_:)(v22);
  OUTLINED_FUNCTION_16();
  v23 = v32;
  v30 = v33;
  v24 = v34;
  v25 = v35;
  v26 = sub_20CE675CC();
  v28 = v27;
  OUTLINED_FUNCTION_51((uint64_t)v2, v3);
  v29 = v3 + *(int *)(v15 + 36);
  *(_QWORD *)v29 = v23;
  *(_OWORD *)(v29 + 8) = v30;
  *(_QWORD *)(v29 + 24) = v24;
  *(_QWORD *)(v29 + 32) = v25;
  *(_WORD *)(v29 + 40) = 256;
  *(_QWORD *)(v29 + 48) = v26;
  *(_QWORD *)(v29 + 56) = v28;
  sub_20CE21AE0((uint64_t)v2, &qword_254996840);
  sub_20CE21AA4(v3, v31, &qword_254996848);
  sub_20CE21AE0(v3, &qword_254996848);
  OUTLINED_FUNCTION_13();
}

void sub_20CE1B478(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t KeyPath;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v32[80];
  _QWORD v33[9];

  v31 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996870);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v30 - v9;
  *(_QWORD *)v10 = sub_20CE67188();
  *((_QWORD *)v10 + 1) = 0;
  v10[16] = 1;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996878);
  sub_20CE1B6E0(a1, a2, (uint64_t)&v10[*(int *)(v11 + 44)]);
  v12 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(a1
                                                              + *(int *)(type metadata accessor for ShortcutIndexedSearchView(0)
                                                                       + 24)), sel_name));
  v13 = sub_20CE67638();
  v15 = v14;

  v33[0] = v13;
  v33[1] = v15;
  sub_20CE21A50();
  v16 = sub_20CE672CC();
  v18 = v17;
  v20 = v19 & 1;
  sub_20CE1A6F4((uint64_t)v32);
  sub_20CE21A24((uint64_t)v32, (uint64_t)v33, &qword_254996428);
  v21 = sub_20CE672C0();
  v23 = v22;
  v25 = v24;
  LOBYTE(v15) = v26 & 1;
  sub_20CE1EC80((uint64_t)v32);
  sub_20CE21A8C(v16, v18, v20);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  sub_20CE21AA4((uint64_t)v10, (uint64_t)v8, &qword_254996870);
  v28 = v31;
  sub_20CE21AA4((uint64_t)v8, v31, &qword_254996870);
  v29 = v28 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254996888) + 48);
  *(_QWORD *)v29 = v21;
  *(_QWORD *)(v29 + 8) = v23;
  *(_BYTE *)(v29 + 16) = v15;
  *(_QWORD *)(v29 + 24) = v25;
  *(_QWORD *)(v29 + 32) = KeyPath;
  *(_QWORD *)(v29 + 40) = 2;
  *(_BYTE *)(v29 + 48) = 0;
  *(_QWORD *)(v29 + 56) = 0x3FF0000000000000;
  sub_20CE21AD0(v21, v23, v15);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_20CE21AE0((uint64_t)v10, &qword_254996870);
  sub_20CE21A8C(v21, v23, v15);
  swift_release();
  swift_bridgeObjectRelease();
  sub_20CE21AE0((uint64_t)v8, &qword_254996870);
}

void sub_20CE1B6E0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char *v17;
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  __int128 v23;

  v6 = (int *)type metadata accessor for ShortcutIndexedSearchView.DeepLinkButton(0);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (uint64_t *)((char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v23 - v10;
  v12 = type metadata accessor for ShortcutIndexedSearchView.BadgedIconView(0);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (uint64_t *)((char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v23 - v16;
  v18 = *(void **)(a1 + *(int *)(type metadata accessor for ShortcutIndexedSearchView(0) + 24));
  v23 = *(_OWORD *)(a2 + 56);
  *v15 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  swift_storeEnumTagMultiPayload();
  *(uint64_t *)((char *)v15 + *(int *)(v12 + 20)) = (uint64_t)v18;
  *(_OWORD *)((char *)v15 + *(int *)(v12 + 24)) = v23;
  sub_20CE217D4((uint64_t)v15, (uint64_t)v17, type metadata accessor for ShortcutIndexedSearchView.BadgedIconView);
  *v9 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549971B0);
  swift_storeEnumTagMultiPayload();
  v19 = (uint64_t *)((char *)v9 + v6[5]);
  *v19 = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  *(uint64_t *)((char *)v9 + v6[6]) = (uint64_t)v18;
  memcpy((char *)v9 + v6[7], (const void *)a2, 0x50uLL);
  sub_20CE217D4((uint64_t)v9, (uint64_t)v11, type metadata accessor for ShortcutIndexedSearchView.DeepLinkButton);
  sub_20CE20E18((uint64_t)v17, (uint64_t)v15, type metadata accessor for ShortcutIndexedSearchView.BadgedIconView);
  sub_20CE20E18((uint64_t)v11, (uint64_t)v9, type metadata accessor for ShortcutIndexedSearchView.DeepLinkButton);
  sub_20CE20E18((uint64_t)v15, a3, type metadata accessor for ShortcutIndexedSearchView.BadgedIconView);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996890);
  v21 = a3 + *(int *)(v20 + 48);
  *(_QWORD *)v21 = 0;
  *(_BYTE *)(v21 + 8) = 1;
  sub_20CE20E18((uint64_t)v9, a3 + *(int *)(v20 + 64), type metadata accessor for ShortcutIndexedSearchView.DeepLinkButton);
  v22 = v18;
  sub_20CE21B10(a2);
  sub_20CE21374((uint64_t)v11, type metadata accessor for ShortcutIndexedSearchView.DeepLinkButton);
  sub_20CE21374((uint64_t)v17, type metadata accessor for ShortcutIndexedSearchView.BadgedIconView);
  sub_20CE21374((uint64_t)v9, type metadata accessor for ShortcutIndexedSearchView.DeepLinkButton);
  sub_20CE21374((uint64_t)v15, type metadata accessor for ShortcutIndexedSearchView.BadgedIconView);
}

uint64_t sub_20CE1B97C(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v9;
  _BYTE v10[8];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254996660);
  MEMORY[0x24BDAC7A8](v2);
  v4 = &v10[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 16];
  v5 = *a1;
  v6 = a1[2];
  v12 = a1[1];
  v13 = v5;
  v11 = v6;
  v9 = *(_OWORD *)(a1 + 3);
  sub_20CE21A24((uint64_t)&v9 + 8, (uint64_t)v10, &qword_254996678);
  v7 = *((_OWORD *)a1 + 1);
  *(_OWORD *)v4 = *(_OWORD *)a1;
  *((_OWORD *)v4 + 1) = v7;
  *((_QWORD *)v4 + 4) = a1[4];
  swift_storeEnumTagMultiPayload();
  sub_20CE213A4((uint64_t)&v13);
  sub_20CE213A4((uint64_t)&v12);
  sub_20CE213A4((uint64_t)&v11);
  swift_retain();
  sub_20CE213A4((uint64_t)v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549965D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254996600);
  sub_20CE2105C();
  sub_20CE21164();
  return sub_20CE67200();
}

void sub_20CE1BAB4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  _BYTE *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t KeyPath;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  _BYTE *v34;
  _BYTE *v35;
  uint64_t v36;
  int *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  _BYTE v42[12];
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _BYTE *v48;
  const void *v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE *v52;
  _BYTE v53[80];
  _QWORD v54[9];
  __int128 v55;

  v49 = (const void *)a2;
  v51 = a3;
  v50 = type metadata accessor for ShortcutIndexedSearchView.DeepLinkButton(0);
  v5 = MEMORY[0x24BDAC7A8](v50);
  v7 = (uint64_t *)&v42[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v52 = &v42[-v8];
  v9 = type metadata accessor for ShortcutIndexedSearchView.BadgedIconView(0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (uint64_t *)&v42[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v10);
  v14 = &v42[-v13];
  v48 = &v42[-v13];
  v46 = *(int *)(type metadata accessor for ShortcutIndexedSearchView(0) + 24);
  v15 = *(void **)(a1 + v46);
  v55 = *(_OWORD *)(a2 + 56);
  *v12 = swift_getKeyPath();
  v47 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  swift_storeEnumTagMultiPayload();
  *(uint64_t *)((char *)v12 + *(int *)(v9 + 20)) = (uint64_t)v15;
  *(_OWORD *)((char *)v12 + *(int *)(v9 + 24)) = v55;
  sub_20CE217D4((uint64_t)v12, (uint64_t)v14, type metadata accessor for ShortcutIndexedSearchView.BadgedIconView);
  v16 = objc_msgSend(v15, sel_name);
  v17 = sub_20CE67638();
  v19 = v18;

  v54[0] = v17;
  v54[1] = v19;
  sub_20CE21A50();
  v20 = sub_20CE672CC();
  v22 = v21;
  v24 = v23 & 1;
  sub_20CE1A6F4((uint64_t)v53);
  sub_20CE21A24((uint64_t)v53, (uint64_t)v54, &qword_254996428);
  v25 = sub_20CE672C0();
  v44 = v26;
  v45 = v27;
  v43 = v28 & 1;
  sub_20CE1EC80((uint64_t)v53);
  sub_20CE21A8C(v20, v22, v24);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  v46 = *(_QWORD *)(a1 + v46);
  v30 = v46;
  *v7 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549971B0);
  swift_storeEnumTagMultiPayload();
  v31 = v50;
  v32 = (uint64_t *)((char *)v7 + *(int *)(v50 + 20));
  *v32 = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  *(uint64_t *)((char *)v7 + *(int *)(v31 + 24)) = v30;
  v33 = (uint64_t)v49;
  memcpy((char *)v7 + *(int *)(v31 + 28), v49, 0x50uLL);
  v34 = v52;
  sub_20CE217D4((uint64_t)v7, (uint64_t)v52, type metadata accessor for ShortcutIndexedSearchView.DeepLinkButton);
  v35 = v48;
  sub_20CE20E18((uint64_t)v48, (uint64_t)v12, type metadata accessor for ShortcutIndexedSearchView.BadgedIconView);
  sub_20CE20E18((uint64_t)v34, (uint64_t)v7, type metadata accessor for ShortcutIndexedSearchView.DeepLinkButton);
  v36 = v51;
  sub_20CE20E18((uint64_t)v12, v51, type metadata accessor for ShortcutIndexedSearchView.BadgedIconView);
  v37 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_254996898);
  v38 = v36 + v37[12];
  v39 = v44;
  *(_QWORD *)v38 = v25;
  *(_QWORD *)(v38 + 8) = v39;
  LOBYTE(v34) = v43;
  *(_BYTE *)(v38 + 16) = v43;
  *(_QWORD *)(v38 + 24) = v45;
  *(_QWORD *)(v38 + 32) = KeyPath;
  *(_QWORD *)(v38 + 40) = 2;
  *(_BYTE *)(v38 + 48) = 0;
  *(_QWORD *)(v38 + 56) = 0x3FF0000000000000;
  v40 = v36 + v37[16];
  *(_QWORD *)v40 = 0;
  *(_BYTE *)(v40 + 8) = 1;
  sub_20CE20E18((uint64_t)v7, v36 + v37[20], type metadata accessor for ShortcutIndexedSearchView.DeepLinkButton);
  sub_20CE21AD0(v25, v39, (char)v34);
  swift_bridgeObjectRetain();
  swift_retain();
  v41 = (id)v46;
  sub_20CE21B10(v33);
  sub_20CE21374((uint64_t)v52, type metadata accessor for ShortcutIndexedSearchView.DeepLinkButton);
  sub_20CE21374((uint64_t)v35, type metadata accessor for ShortcutIndexedSearchView.BadgedIconView);
  sub_20CE21374((uint64_t)v7, type metadata accessor for ShortcutIndexedSearchView.DeepLinkButton);
  sub_20CE21A8C(v25, v39, (char)v34);
  swift_release();
  swift_bridgeObjectRelease();
  sub_20CE21374((uint64_t)v12, type metadata accessor for ShortcutIndexedSearchView.BadgedIconView);
}

BOOL sub_20CE1BF30(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void sub_20CE1BF3C(unsigned __int8 a1, char a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;

  v2 = 0xEF65727574616E67;
  v3 = 0x6953657361726870;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 0xD000000000000010;
    else
      v5 = 0xD00000000000001DLL;
    if (v4 == 1)
      v6 = 0x800000020CE6D570;
    else
      v6 = 0x800000020CE6D590;
  }
  else
  {
    v5 = 0x6953657361726870;
    v6 = 0xEF65727574616E67;
  }
  if (a2)
  {
    if (a2 == 1)
      v3 = 0xD000000000000010;
    else
      v3 = 0xD00000000000001DLL;
    if (a2 == 1)
      v2 = 0x800000020CE6D570;
    else
      v2 = 0x800000020CE6D590;
  }
  if (v5 != v3 || v6 != v2)
    sub_20CE67890();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_21();
}

uint64_t sub_20CE1C03C()
{
  return 1;
}

void sub_20CE1C044(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  ShortcutIndexedSearchView.init(from:)(a1, a2);
}

void ShortcutIndexedSearchView.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254996438);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v5);
  v6 = OUTLINED_FUNCTION_17();
  v7 = type metadata accessor for ShortcutIndexedSearchView(v6);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_3();
  *v3 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  swift_storeEnumTagMultiPayload();
  v9 = (uint64_t *)((char *)v3 + *(int *)(v7 + 20));
  *v9 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
  swift_storeEnumTagMultiPayload();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20CE1ECCC();
  sub_20CE678F0();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    sub_20CE21AE0((uint64_t)v3, &qword_254996448);
    sub_20CE21AE0((uint64_t)v9, &qword_254996450);
  }
  else
  {
    sub_20CE1ED28();
    sub_20CE67860();
    sub_20CE218E4(0, &qword_254996460);
    sub_20CE218E4(0, &qword_254996468);
    v10 = sub_20CE67740();
    v11 = v10;
    if (v10)
    {
      OUTLINED_FUNCTION_27();
      OUTLINED_FUNCTION_60();
      *(uint64_t *)((char *)v3 + *(int *)(v7 + 24)) = v11;
      sub_20CE20E18((uint64_t)v3, a2, type metadata accessor for ShortcutIndexedSearchView);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      sub_20CE21374((uint64_t)v3, type metadata accessor for ShortcutIndexedSearchView);
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_20CE1C2B4()
{
  return ShortcutIndexedSearchView.encode(to:)();
}

uint64_t ShortcutIndexedSearchView.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  id v14[3];

  v1 = v0;
  v14[2] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996470);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_3();
  v3 = (_QWORD *)OUTLINED_FUNCTION_64();
  __swift_project_boxed_opaque_existential_1(v3, v4);
  sub_20CE1ECCC();
  sub_20CE678FC();
  v5 = (void *)objc_opt_self();
  v6 = *(_QWORD *)(v1 + *(int *)(type metadata accessor for ShortcutIndexedSearchView(0) + 24));
  v14[0] = 0;
  v7 = objc_msgSend(v5, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v6, 1, v14);
  v8 = v14[0];
  if (v7)
  {
    v9 = (void *)sub_20CE66D74();
    v11 = v10;

    v14[0] = v9;
    v14[1] = v11;
    sub_20CE1EDA8();
    sub_20CE67878();
    OUTLINED_FUNCTION_29();
    return sub_20CE1ED64((uint64_t)v9, (unint64_t)v11);
  }
  else
  {
    v13 = v8;
    sub_20CE66D14();

    swift_willThrow();
    return OUTLINED_FUNCTION_29();
  }
}

BOOL sub_20CE1C460()
{
  uint64_t v0;

  v0 = sub_20CE67848();
  OUTLINED_FUNCTION_30();
  return v0 != 0;
}

uint64_t sub_20CE1C4B0()
{
  sub_20CE678B4();
  sub_20CE6765C();
  return sub_20CE678E4();
}

uint64_t sub_20CE1C504(char a1)
{
  return sub_20CE1C638(0, a1);
}

uint64_t sub_20CE1C510()
{
  sub_20CE678B4();
  sub_20CE678C0();
  return sub_20CE678E4();
}

void sub_20CE1C558()
{
  sub_20CE678C0();
  OUTLINED_FUNCTION_4();
}

uint64_t sub_20CE1C578(uint64_t a1, char a2)
{
  if (a2)
  {
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_31();
  }
  else
  {
    OUTLINED_FUNCTION_12();
  }
  sub_20CE6765C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CE1C5C8()
{
  return sub_20CE6765C();
}

uint64_t sub_20CE1C5E8()
{
  sub_20CE678B4();
  sub_20CE6765C();
  return sub_20CE678E4();
}

uint64_t sub_20CE1C638(uint64_t a1, char a2)
{
  sub_20CE678B4();
  if (a2)
  {
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_31();
  }
  else
  {
    OUTLINED_FUNCTION_12();
  }
  sub_20CE6765C();
  OUTLINED_FUNCTION_30();
  return sub_20CE678E4();
}

uint64_t sub_20CE1C6A8()
{
  sub_20CE678B4();
  sub_20CE678C0();
  return sub_20CE678E4();
}

BOOL sub_20CE1C6E8@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = sub_20CE1C460();
  *a1 = result;
  return result;
}

void sub_20CE1C71C(_QWORD *a1@<X8>)
{
  *a1 = 0x7470697263736564;
  a1[1] = 0xEA0000000000726FLL;
}

uint64_t sub_20CE1C73C()
{
  return 0x7470697263736564;
}

uint64_t sub_20CE1C758@<X0>(BOOL *a1@<X8>)
{
  uint64_t result;

  result = sub_20CE1C4A0();
  *a1 = result != 0;
  return result;
}

uint64_t sub_20CE1C784()
{
  return 0;
}

void sub_20CE1C790(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_20CE1C79C()
{
  sub_20CE1ECCC();
  return sub_20CE67908();
}

uint64_t sub_20CE1C7C4()
{
  sub_20CE1ECCC();
  return sub_20CE67914();
}

unint64_t sub_20CE1C7EC()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  double v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v21[2];

  v1 = v0;
  v21[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend((id)objc_opt_self(), sel_standardClient);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549967B0);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_20CE6AC70;
  v4 = type metadata accessor for ShortcutIndexedSearchView.BadgedIconView(0);
  v5 = objc_msgSend(*(id *)(v1 + *(int *)(v4 + 20)), sel_glyphCharacter);
  *(_QWORD *)(v3 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithUnsignedShort_, v5);
  v21[0] = (id)v3;
  sub_20CE676C8();
  sub_20CE218E4(0, &qword_2549967B8);
  v6 = (void *)sub_20CE676B0();
  swift_bridgeObjectRelease();
  v7 = *(double *)(v1 + *(int *)(v4 + 24));
  v21[0] = 0;
  v8 = objc_msgSend(v2, sel_drawGlyphs_atSize_withBackgroundColorValues_error_, v6, 0, v21, v7, v7);

  v9 = v21[0];
  if (!v8)
  {
    v17 = v21[0];
    v18 = (void *)sub_20CE66D14();

    swift_willThrow();
    return 0;
  }
  v10 = sub_20CE676BC();
  v11 = v9;

  v12 = sub_20CE1CA9C(v10);
  swift_bridgeObjectRelease();
  if (!v12)
    return v12;
  if (v12 >> 62)
  {
    swift_bridgeObjectRetain();
    v19 = sub_20CE67830();
    swift_bridgeObjectRelease();
    if (v19)
      goto LABEL_5;
    goto LABEL_11;
  }
  if (!*(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_11:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_5:
  if ((v12 & 0xC000000000000001) != 0)
  {
    v13 = (id)MEMORY[0x212B97000](0, v12);
  }
  else
  {
    if (!*(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
      __break(1u);
    v13 = *(id *)(v12 + 32);
  }
  v14 = v13;
  swift_bridgeObjectRelease();
  v15 = objc_msgSend((id)objc_opt_self(), sel_imageWithCGImage_, v14);
  v16 = objc_msgSend(v15, sel_platformImage);
  v12 = _s7SwiftUI5ImageV18WorkflowUIServicesE08platformC0ACSo7UIImageC_tcfC_0();

  return v12;
}

uint64_t sub_20CE1CA9C(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  _BYTE v5[32];
  uint64_t v6;

  v6 = MEMORY[0x24BEE4AF8];
  v2 = *(_QWORD *)(a1 + 16);
  sub_20CE677DC();
  if (!v2)
    return v6;
  for (i = a1 + 32; ; i += 32)
  {
    sub_20CE21918(i, (uint64_t)v5);
    type metadata accessor for CGImage(0);
    if (!swift_dynamicCast())
      break;
    sub_20CE677C4();
    sub_20CE677E8();
    sub_20CE677F4();
    sub_20CE677D0();
    if (!--v2)
      return v6;
  }
  swift_release();

  return 0;
}

void sub_20CE1CB94(uint64_t a1@<X8>)
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
  uint64_t *v10;
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
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t KeyPath;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  id v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  __int128 *v73;
  unint64_t v74;
  unint64_t v75;
  id v76;
  unint64_t v77;
  uint64_t v78;
  char v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  id v100;
  __int128 v101;
  char v102;
  char v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char v137;
  id v138;
  uint64_t v139;
  uint64_t v140;
  char v141;
  __int128 v142;
  uint64_t v143;
  char v144;
  __int128 v145;
  char v146;
  _QWORD v147[2];
  char v148;
  uint64_t v149;
  char v150;
  __int128 v151;
  char v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int16 v160;
  char v161;

  v8 = v1;
  v136 = a1;
  v118 = type metadata accessor for SpotlightUiShadow(0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_2();
  v117 = v10;
  v128 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254997010);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_2();
  v119 = v12;
  v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996690);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_2();
  v127 = v14;
  v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996698);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_2();
  v122 = v16;
  v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549966A0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_41();
  v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549966A8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_2();
  v123 = v19;
  v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549966B0);
  OUTLINED_FUNCTION_0();
  v21 = MEMORY[0x24BDAC7A8](v20);
  v126 = (char *)&v116 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v129 = (uint64_t)&v116 - v23;
  v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549966B8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_2();
  v133 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549966C0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_2();
  v135 = v27;
  v28 = sub_20CE67488();
  v130 = *(_QWORD *)(v28 - 8);
  v131 = (id)v28;
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v29);
  v30 = OUTLINED_FUNCTION_11();
  v31 = MEMORY[0x24BDAC7A8](v30);
  v33 = (char *)&v116 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v31);
  v35 = (char *)&v116 - v34;
  OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_58(v36, *MEMORY[0x24BDFBAD0]);
  v37 = OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_33((uint64_t)v33);
  OUTLINED_FUNCTION_33((uint64_t)v35);
  if ((v37 & 1) != 0)
  {
    v38 = type metadata accessor for ShortcutIndexedSearchView.BadgedIconView(0);
    v39 = objc_msgSend(*(id *)(v8 + *(int *)(v38 + 20)), sel_associatedAppBundleIdentifier);
    if (v39)
    {
      v40 = v39;
      v41 = sub_20CE67638();
      v43 = v42;

      v44 = objc_msgSend((id)objc_opt_self(), sel_sharedResolver);
      v45 = objc_allocWithZone(MEMORY[0x24BDD9BD0]);
      v46 = sub_20CE1EB5C(v41, v43);
      v47 = objc_msgSend(v44, sel_resolvedAppMatchingDescriptor_, v46);

      if (v47)
      {
        if (objc_msgSend(v47, sel_isInstalled))
        {
          sub_20CE21800(v47);
          if (v48)
          {
            v49 = *(_QWORD *)(v8 + *(int *)(v38 + 24));
            sub_20CE218E4(0, &qword_253CFA470);
            v50 = sub_20CE1D778();
            KeyPath = swift_getKeyPath();
            v161 = 0;
            v52 = swift_getKeyPath();
            v137 = 0;
            v147[0] = 0;
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254996778);
            OUTLINED_FUNCTION_47();
            v138 = v50;
            v139 = v49;
            v140 = 0;
            v141 = 97;
            *(_QWORD *)&v142 = KeyPath;
            BYTE8(v142) = v161;
            v143 = v52;
            v144 = v137;
            v145 = v153;
            v146 = 0;
            sub_20CE21860((uint64_t)&v138, (uint64_t)&v153);
            HIBYTE(v160) = 0;
            __swift_instantiateConcreteTypeFromMangledName(&qword_254996708);
            sub_20CE19704();
            sub_20CE216C8((uint64_t)&qword_254996700);
            sub_20CE67200();

            sub_20CE2189C((uint64_t)&v138);
            sub_20CE21A24((uint64_t)v147, (uint64_t)&v153, &qword_2549966D8);
LABEL_18:
            v72 = v135;
            v71 = v136;
            OUTLINED_FUNCTION_37((uint64_t)&v153, v133);
            OUTLINED_FUNCTION_24();
            __swift_instantiateConcreteTypeFromMangledName(&qword_2549966D8);
            sub_20CE213CC();
            sub_20CE214B8();
            OUTLINED_FUNCTION_8();
            v73 = &v153;
LABEL_27:
            OUTLINED_FUNCTION_55((uint64_t)v73);
            v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549966C8);
            OUTLINED_FUNCTION_44(v72, 0, v113, v112);
            sub_20CE21A24(v72, v71, &qword_2549966C0);
            goto LABEL_28;
          }
        }

      }
    }
    if (sub_20CE1C7EC())
    {
      v69 = v130;
      (*(void (**)(uint64_t, _QWORD, id))(v130 + 104))(v3, *MEMORY[0x24BDF3FD0], v131);
      OUTLINED_FUNCTION_32();
      v70 = sub_20CE674DC();
      OUTLINED_FUNCTION_50(v3, *(uint64_t (**)(uint64_t, uint64_t))(v69 + 8));
      sub_20CE675CC();
      sub_20CE66EAC();
      v147[0] = v70;
      v147[1] = v138;
      v148 = v139;
      v149 = v140;
      v150 = v141;
      v151 = v142;
      v152 = 1;
      swift_retain_n();
      __swift_instantiateConcreteTypeFromMangledName(&qword_254996708);
      sub_20CE19704();
      sub_20CE216C8((uint64_t)&qword_254996700);
      sub_20CE67200();
      swift_release_n();
      swift_release();
    }
    else
    {
      v159 = 0u;
      v158 = 0u;
      v157 = 0u;
      v156 = 0u;
      v155 = 0u;
      v154 = 0u;
      v153 = 0u;
      v160 = -256;
    }
    goto LABEL_18;
  }
  sub_20CE2930C();
  OUTLINED_FUNCTION_58(v53, *MEMORY[0x24BDFBAE0]);
  v54 = OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_33((uint64_t)v33);
  OUTLINED_FUNCTION_33((uint64_t)v35);
  if ((v54 & 1) != 0)
  {
    v55 = type metadata accessor for ShortcutIndexedSearchView.BadgedIconView(0);
    v56 = objc_msgSend(*(id *)(v8 + *(int *)(v55 + 20)), sel_associatedAppBundleIdentifier);
    if (v56)
    {
      v57 = v56;
      v58 = sub_20CE67638();
      v60 = v59;

      v61 = objc_msgSend((id)objc_opt_self(), sel_sharedResolver);
      v62 = objc_allocWithZone(MEMORY[0x24BDD9BD0]);
      v63 = sub_20CE1EB5C(v58, v60);
      v64 = objc_msgSend(v61, sel_resolvedAppMatchingDescriptor_, v63);

      if (v64)
      {
        if (objc_msgSend(v64, sel_isInstalled))
        {
          sub_20CE21800(v64);
          if (v65)
          {
            sub_20CE218E4(0, &qword_253CFA470);
            OUTLINED_FUNCTION_64();
            v66 = sub_20CE1D778();

            goto LABEL_21;
          }
        }

      }
    }
    v66 = 0;
LABEL_21:
    v74 = sub_20CE1C7EC();
    if (v74)
    {
      v75 = v74;
      v77 = v130;
      v76 = v131;
      (*(void (**)(uint64_t, _QWORD, id))(v130 + 104))(v3, *MEMORY[0x24BDF3FD0], v131);
      OUTLINED_FUNCTION_32();
      v119 = sub_20CE674DC();
      (*(void (**)(uint64_t, id))(v77 + 8))(v3, v76);
      LODWORD(v118) = sub_20CE67230();
      sub_20CE66E1C();
      OUTLINED_FUNCTION_53();
      v130 = v75;
      sub_20CE675CC();
      sub_20CE66EAC();
      v78 = v153;
      v131 = v66;
      v79 = BYTE8(v153);
      v80 = v154;
      v81 = BYTE8(v154);
      v116 = *((_QWORD *)&v155 + 1);
      v117 = (uint64_t *)v155;
      v82 = sub_20CE675CC();
      v84 = v83;
      v85 = v122;
      sub_20CE1D7E4(v8, v122);
      v86 = (uint64_t *)(v85 + *(int *)(v121 + 36));
      *v86 = v82;
      v86[1] = v84;
      sub_20CE21AA4(v85, v2 + *(int *)(v120 + 36), &qword_254996698);
      *(_QWORD *)v2 = v119;
      *(_BYTE *)(v2 + 8) = v118;
      *(_QWORD *)(v2 + 16) = v4;
      *(_QWORD *)(v2 + 24) = v5;
      *(_QWORD *)(v2 + 32) = v6;
      *(_QWORD *)(v2 + 40) = v7;
      *(_BYTE *)(v2 + 48) = 0;
      *(_QWORD *)(v2 + 56) = v78;
      *(_BYTE *)(v2 + 64) = v79;
      v66 = v131;
      *(_QWORD *)(v2 + 72) = v80;
      *(_BYTE *)(v2 + 80) = v81;
      v87 = v116;
      *(_QWORD *)(v2 + 88) = v117;
      *(_QWORD *)(v2 + 96) = v87;
      v88 = OUTLINED_FUNCTION_64();
      sub_20CE21AE0(v88, v89);
      v90 = sub_20CE675CC();
      v92 = v91;
      v93 = v123;
      v94 = v123 + *(int *)(v124 + 36);
      sub_20CE1D96C(v66, v8, v94);
      v95 = (uint64_t *)(v94 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254996760) + 36));
      *v95 = v90;
      v95[1] = v92;
      sub_20CE21A24(v2, v93, &qword_2549966A0);
      sub_20CE21AA4(v93, v127, &qword_2549966A8);
      OUTLINED_FUNCTION_24();
      sub_20CE2153C();
      sub_20CE21740();
      v96 = (uint64_t)v126;
      OUTLINED_FUNCTION_64();
      sub_20CE67200();
      swift_release();
      v97 = v93;
      v98 = &qword_2549966A8;
    }
    else
    {
      if (!v66)
      {
        v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549966D0);
        v111 = v129;
        OUTLINED_FUNCTION_44(v129, 1, v115, v114);
        goto LABEL_26;
      }
      v130 = *(_QWORD *)(v8 + *(int *)(v55 + 24));
      v123 = swift_getKeyPath();
      LOBYTE(v138) = 0;
      v99 = swift_getKeyPath();
      v161 = 0;
      v147[0] = 0;
      v100 = v66;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254996778);
      OUTLINED_FUNCTION_47();
      v101 = v153;
      v102 = (char)v138;
      v103 = v161;
      v104 = swift_getKeyPath();
      v105 = (uint64_t)v117;
      *v117 = v104;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
      OUTLINED_FUNCTION_24();
      v106 = v118;
      v107 = v119;
      *(_QWORD *)(v105 + *(int *)(v118 + 20)) = 0x3FA999999999999ALL;
      *(_QWORD *)(v105 + *(int *)(v106 + 24)) = 0x4020000000000000;
      v131 = v66;
      sub_20CE217D4(v105, v107 + *(int *)(v128 + 36), type metadata accessor for SpotlightUiShadow);
      v108 = v130;
      *(_QWORD *)v107 = v100;
      *(_QWORD *)(v107 + 8) = v108;
      *(_QWORD *)(v107 + 16) = 0;
      *(_BYTE *)(v107 + 24) = 97;
      *(_QWORD *)(v107 + 32) = v123;
      *(_BYTE *)(v107 + 40) = v102;
      *(_QWORD *)(v107 + 48) = v99;
      *(_BYTE *)(v107 + 88) = v103;
      *(_OWORD *)(v107 + 96) = v101;
      *(_BYTE *)(v107 + 112) = 0;
      OUTLINED_FUNCTION_51(v107, v127);
      swift_storeEnumTagMultiPayload();
      sub_20CE2153C();
      sub_20CE21740();
      v96 = (uint64_t)v126;
      v66 = v131;
      sub_20CE67200();
      v97 = v107;
      v98 = (uint64_t *)&unk_254997010;
    }
    sub_20CE21AE0(v97, v98);
    v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549966D0);
    OUTLINED_FUNCTION_44(v96, 0, v110, v109);
    v111 = v129;
    sub_20CE21A24(v96, v129, &qword_2549966B0);
LABEL_26:
    v72 = v135;
    v71 = v136;
    OUTLINED_FUNCTION_37(v111, v133);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549966D8);
    sub_20CE213CC();
    sub_20CE214B8();
    OUTLINED_FUNCTION_8();

    v73 = (__int128 *)v111;
    goto LABEL_27;
  }
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549966C8);
  OUTLINED_FUNCTION_44(v136, 1, v68, v67);
LABEL_28:
  OUTLINED_FUNCTION_5();
}

id sub_20CE1D778()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_20CE6762C();
  OUTLINED_FUNCTION_30();
  v2 = objc_msgSend(v0, sel_initWithBundleIdentifier_, v1);

  return v2;
}

void sub_20CE1D7E4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v4 = type metadata accessor for SpotlightUiShadow(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (uint64_t *)((char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996790);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(*(id *)(a1 + *(int *)(type metadata accessor for ShortcutIndexedSearchView.BadgedIconView(0) + 20)), sel_backgroundColor);
  v11 = objc_msgSend(v10, sel_paletteGradient);

  sub_20CE1AF9C(v11, (uint64_t)v9);
  *v6 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  swift_storeEnumTagMultiPayload();
  *(uint64_t *)((char *)v6 + *(int *)(v4 + 20)) = 0x3FA999999999999ALL;
  *(uint64_t *)((char *)v6 + *(int *)(v4 + 24)) = 0x4020000000000000;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996798);
  sub_20CE217D4((uint64_t)v6, a2 + *(int *)(v12 + 36), type metadata accessor for SpotlightUiShadow);
  sub_20CE21A24((uint64_t)v9, a2, &qword_254996790);
}

uint64_t sub_20CE1D96C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  double *v12;
  double v13;
  double v14;
  id v15;
  __int128 v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  double *v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t KeyPath;
  uint64_t v27;
  uint64_t v28;
  _DWORD v29[2];
  __int128 v30;
  __int128 v31;
  _DWORD v32[2];

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254997010);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996788);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
    return __swift_storeEnumTagSinglePayload(a3, 1, 1, v9);
  v27 = a3;
  v12 = (double *)(a2 + *(int *)(type metadata accessor for ShortcutIndexedSearchView.BadgedIconView(0) + 24));
  v13 = v12[1];
  v14 = *v12 + v13 * -0.5 + 3.0;
  KeyPath = swift_getKeyPath();
  LOBYTE(v32[0]) = 0;
  v25 = swift_getKeyPath();
  LOBYTE(v29[0]) = 0;
  v28 = 0;
  v15 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254996778);
  sub_20CE67548();
  v16 = v30;
  v17 = v32[0];
  v18 = v29[0];
  if (qword_2549963B0 != -1)
    swift_once();
  v19 = type metadata accessor for SpotlightUiShadow(0);
  v20 = __swift_project_value_buffer(v19, (uint64_t)qword_254996D80);
  sub_20CE20E18(v20, (uint64_t)&v8[*(int *)(v6 + 36)], type metadata accessor for SpotlightUiShadow);
  *((double *)v8 + 1) = v13;
  v21 = v31;
  *(_OWORD *)(v8 + 56) = v30;
  *(_QWORD *)v8 = v15;
  *((_QWORD *)v8 + 2) = 0;
  v8[24] = 97;
  *(_DWORD *)(v8 + 25) = v28;
  *((_DWORD *)v8 + 7) = *(_DWORD *)((char *)&v28 + 3);
  *((_QWORD *)v8 + 4) = KeyPath;
  v8[40] = v17;
  *(_DWORD *)(v8 + 41) = v32[0];
  *((_DWORD *)v8 + 11) = *(_DWORD *)((char *)v32 + 3);
  *((_QWORD *)v8 + 6) = v25;
  *(_OWORD *)(v8 + 72) = v21;
  v8[88] = v18;
  *(_DWORD *)(v8 + 89) = v29[0];
  *((_DWORD *)v8 + 23) = *(_DWORD *)((char *)v29 + 3);
  *((_OWORD *)v8 + 6) = v16;
  v8[112] = 0;
  sub_20CE21AA4((uint64_t)v8, (uint64_t)v11, (uint64_t *)&unk_254997010);
  v22 = (double *)&v11[*(int *)(v9 + 36)];
  *v22 = v14;
  v22[1] = v14;
  sub_20CE21AE0((uint64_t)v8, (uint64_t *)&unk_254997010);
  v23 = v27;
  sub_20CE21A24((uint64_t)v11, v27, &qword_254996788);
  return __swift_storeEnumTagSinglePayload(v23, 0, 1, v9);
}

void sub_20CE1DC1C()
{
  sub_20CE67050();
  OUTLINED_FUNCTION_4();
}

void sub_20CE1DC38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_20CE1EA1C(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BDFBAE8], MEMORY[0x24BDFBB50]);
}

uint64_t type metadata accessor for ShortcutIndexedSearchView(uint64_t a1)
{
  return sub_20CE15EE0(a1, (uint64_t *)&unk_2549964A0);
}

uint64_t sub_20CE1DC60()
{
  return sub_20CE6732C();
}

void sub_20CE1DC7C(uint64_t a1@<X8>)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64x2_t *v30;
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

  v4 = v2;
  v49 = a1;
  v48 = sub_20CE67218();
  v50 = *(_QWORD *)(v48 - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_2();
  v47 = v6;
  v7 = sub_20CE67020();
  v45 = *(_QWORD *)(v7 - 8);
  v46 = v7;
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_18(v9, v37);
  v38 = sub_20CE66FA8();
  v43 = *(_QWORD *)(v38 - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_39();
  v11 = OUTLINED_FUNCTION_62();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v40 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254996590) - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_38();
  v17 = v16 - v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996598);
  v41 = *(_QWORD *)(v18 - 8);
  v42 = v18;
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v37 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549965A0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_52(v4);
  v23 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v24 = swift_allocObject();
  sub_20CE217D4((uint64_t)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v24 + v23, type metadata accessor for ShortcutIndexedSearchView.DeepLinkButton);
  v51 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549965A8);
  sub_20CE20F78();
  sub_20CE67578();
  sub_20CE66F9C();
  sub_20CE21718((uint64_t)&unk_254996630);
  sub_20CE1EE3C((uint64_t)&unk_254996638);
  sub_20CE67308();
  OUTLINED_FUNCTION_28(v1, *(uint64_t (**)(uint64_t, uint64_t))(v43 + 8));
  OUTLINED_FUNCTION_50(v17, *(uint64_t (**)(uint64_t, uint64_t))(v40 + 8));
  v25 = v44;
  sub_20CE66FFC();
  sub_20CE67614();
  v27 = v26;
  v29 = v28;
  v30 = (int64x2_t *)(v3 + *(int *)(v39 + 36));
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996640);
  v33 = v45;
  v32 = v46;
  (*(void (**)(__int8 *, uint64_t, uint64_t))(v45 + 16))(&v30->i8[*(int *)(v31 + 40)], v25, v46);
  *v30 = vdupq_n_s64(0x3FEB333333333333uLL);
  v30[1].i64[0] = v27;
  v30[1].i64[1] = v29;
  v30[2].i8[0] = 0;
  v35 = v41;
  v34 = v42;
  (*(void (**)(uint64_t, char *, uint64_t))(v41 + 16))(v3, v21, v42);
  (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v25, v32);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v21, v34);
  v36 = v47;
  sub_20CE6702C();
  sub_20CE2126C();
  sub_20CE1EE3C((uint64_t)&unk_254996658);
  sub_20CE67314();
  OUTLINED_FUNCTION_28(v36, *(uint64_t (**)(uint64_t, uint64_t))(v50 + 8));
  sub_20CE21AE0(v3, &qword_2549965A0);
  OUTLINED_FUNCTION_13();
}

void sub_20CE1E008()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v13 = sub_20CE66F00();
  v1 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254996680);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_20CE66D50();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = 0;
  v15 = 0xE000000000000000;
  sub_20CE67794();
  swift_bridgeObjectRelease();
  v14 = 0xD00000000000001FLL;
  v15 = 0x800000020CE6D990;
  v11 = objc_msgSend(*(id *)(v0 + *(int *)(type metadata accessor for ShortcutIndexedSearchView.DeepLinkButton(0) + 24)), sel_name);
  sub_20CE67638();

  sub_20CE67680();
  swift_bridgeObjectRelease();
  sub_20CE66D44();
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7) == 1)
  {
    sub_20CE21AE0((uint64_t)v6, (uint64_t *)&unk_254996680);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    sub_20CE29340();
    sub_20CE66EF4();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v13);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

void sub_20CE1E20C(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  void (*v27)(char *, _QWORD, uint64_t);
  char v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t KeyPath;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _OWORD *v48;
  __int128 v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;

  v73 = a2;
  v69 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254996660);
  MEMORY[0x24BDAC7A8](v69);
  v70 = (uint64_t)&v59 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549965A8);
  MEMORY[0x24BDAC7A8](v4);
  v71 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_20CE67020();
  v67 = *(_QWORD *)(v6 - 8);
  v68 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v65 = (char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = type metadata accessor for SizedEllipsis();
  MEMORY[0x24BDAC7A8](v59);
  v61 = (uint64_t *)((char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996610);
  MEMORY[0x24BDAC7A8](v60);
  v63 = (uint64_t)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996600);
  v10 = MEMORY[0x24BDAC7A8](v66);
  v62 = (char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v64 = (uint64_t)&v59 - v12;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA3E8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996670);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v59 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_20CE66DC8();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v59 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v59 - v24;
  v26 = type metadata accessor for ShortcutIndexedSearchView.DeepLinkButton(0);
  v72 = a1;
  sub_20CE2930C();
  v27 = *(void (**)(char *, _QWORD, uint64_t))(v20 + 104);
  v27(v23, *MEMORY[0x24BDFBAD0], v19);
  v28 = sub_20CE66DBC();
  v29 = *(void (**)(char *, uint64_t))(v20 + 8);
  v29(v23, v19);
  v29(v25, v19);
  if ((v28 & 1) != 0)
  {
    sub_20CE6747C();
    sub_20CE671C4();
    v30 = sub_20CE671DC();
    __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v30);
    v31 = sub_20CE674C4();
    swift_release();
    sub_20CE21AE0((uint64_t)v18, &qword_254996670);
    sub_20CE673F8();
    v32 = sub_20CE67404();
    swift_release();
    v33 = sub_20CE673F8();
    v34 = sub_20CE67248();
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 1, 1, v34);
    v35 = sub_20CE6726C();
    sub_20CE21AE0((uint64_t)v15, &qword_253CFA3E8);
    KeyPath = swift_getKeyPath();
    *(_QWORD *)&v74 = v31;
    *((_QWORD *)&v74 + 1) = v32;
    *(_QWORD *)&v75 = v33;
    *((_QWORD *)&v75 + 1) = KeyPath;
    *(_QWORD *)&v76 = v35;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    v37 = v73;
    sub_20CE1B97C((uint64_t *)&v74);
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549965C0);
    v39 = v37;
    v40 = 0;
  }
  else
  {
    v42 = v72;
    v41 = v73;
    sub_20CE2930C();
    v27(v23, *MEMORY[0x24BDFBAE0], v19);
    v43 = sub_20CE66DBC();
    v29(v23, v19);
    v29(v25, v19);
    if ((v43 & 1) != 0)
    {
      v44 = *(_QWORD *)(v42 + *(int *)(v26 + 28) + 48);
      v45 = swift_getKeyPath();
      v46 = (uint64_t)v61;
      *v61 = v45;
      __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
      swift_storeEnumTagMultiPayload();
      *(_QWORD *)(v46 + *(int *)(v59 + 20)) = v44;
      sub_20CE675E4();
      sub_20CE66EAC();
      v47 = v63;
      sub_20CE20E18(v46, v63, (uint64_t (*)(_QWORD))type metadata accessor for SizedEllipsis);
      v48 = (_OWORD *)(v47 + *(int *)(v60 + 36));
      v49 = v75;
      *v48 = v74;
      v48[1] = v49;
      v48[2] = v76;
      sub_20CE21374(v46, (uint64_t (*)(_QWORD))type metadata accessor for SizedEllipsis);
      v50 = v65;
      sub_20CE67008();
      v51 = (uint64_t)v62;
      v52 = &v62[*(int *)(v66 + 36)];
      v53 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254997170);
      v55 = v67;
      v54 = v68;
      (*(void (**)(char *, char *, uint64_t))(v67 + 16))(&v52[*(int *)(v53 + 40)], v50, v68);
      *v52 = 0;
      sub_20CE21AA4(v47, v51, &qword_254996610);
      (*(void (**)(char *, uint64_t))(v55 + 8))(v50, v54);
      sub_20CE21AE0(v47, &qword_254996610);
      v56 = v64;
      sub_20CE21A24(v51, v64, &qword_254996600);
      sub_20CE21AA4(v56, v70, &qword_254996600);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2549965D0);
      sub_20CE2105C();
      sub_20CE21164();
      v57 = (uint64_t)v71;
      sub_20CE67200();
      sub_20CE21AE0(v56, &qword_254996600);
      v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549965C0);
      __swift_storeEnumTagSinglePayload(v57, 0, 1, v58);
      sub_20CE21A24(v57, v41, &qword_2549965A8);
      return;
    }
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549965C0);
    v39 = v41;
    v40 = 1;
  }
  __swift_storeEnumTagSinglePayload(v39, v40, 1, v38);
}

BOOL sub_20CE1E924(double a1, double a2, double a3, double a4)
{
  return a2 == a4 && a1 == a3;
}

uint64_t sub_20CE1E938(double *a1, double *a2)
{
  if (*a1 == *a2 && (sub_20CE66E10() & 1) != 0 && a1[5] == a2[5] && a1[6] == a2[6] && a1[7] == a2[7] && a1[8] == a2[8])
    return sub_20CE6723C();
  else
    return 0;
}

BOOL sub_20CE1E9DC(double *a1, double *a2)
{
  return sub_20CE1E924(*a1, a1[1], *a2, a2[1]);
}

void sub_20CE1E9EC()
{
  sub_20CE6705C();
  OUTLINED_FUNCTION_4();
}

void sub_20CE1EA08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_20CE1EA1C(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BDEB418], (void (*)(char *))MEMORY[0x24BDEDEF8]);
}

void sub_20CE1EA1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD), void (*a6)(char *))
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v8 = a5(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v12 - v9;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v12 - v9, a1);
  a6(v10);
  OUTLINED_FUNCTION_21();
}

uint64_t sub_20CE1EA90@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  id v5;
  uint64_t v6;
  uint64_t result;

  v5 = a1;
  v6 = MEMORY[0x212B96C94](objc_msgSend(v5, sel_platformColor));

  sub_20CE20E18(a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2549970C0);
  *(_QWORD *)(a3 + *(int *)(result + 52)) = v6;
  *(_WORD *)(a3 + *(int *)(result + 56)) = 256;
  return result;
}

uint64_t sub_20CE1EB14(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  v2 = MEMORY[0x212B96C94](objc_msgSend(v1, sel_platformColor));

  return v2;
}

id sub_20CE1EB5C(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  if (a2)
  {
    v3 = (void *)sub_20CE6762C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  v4 = objc_msgSend(v2, sel_initWithBundleIdentifier_, v3);

  return v4;
}

void sub_20CE1EBBC(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;

  sub_20CE1EBEC();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3 & 1;
}

void sub_20CE1EBF4()
{
  _QWORD *v0;
  uint64_t v1;
  double v2;
  double v3;

  v1 = OUTLINED_FUNCTION_23();
  *v0 = nullsub_1(v1, v2, v3);
  OUTLINED_FUNCTION_4();
}

BOOL sub_20CE1EC14(uint64_t *a1, uint64_t *a2)
{
  return sub_20CE1BF30(*a1, *a2);
}

uint64_t sub_20CE1EC20()
{
  return sub_20CE1C510();
}

void sub_20CE1EC28()
{
  sub_20CE1C558();
}

uint64_t sub_20CE1EC30()
{
  return sub_20CE1C6A8();
}

void sub_20CE1EC38(uint64_t *a1@<X8>)
{
  *a1 = sub_20CE670A4();
  OUTLINED_FUNCTION_4();
}

void sub_20CE1EC5C()
{
  swift_retain();
  sub_20CE670B0();
  OUTLINED_FUNCTION_4();
}

uint64_t sub_20CE1EC80(uint64_t a1)
{
  swift_release();
  return a1;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_20CE1ECCC()
{
  unint64_t result;

  result = qword_254996440;
  if (!qword_254996440)
  {
    result = MEMORY[0x212B97A80](&unk_20CE6B164, &unk_24C5A9730);
    atomic_store(result, (unint64_t *)&qword_254996440);
  }
  return result;
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

unint64_t sub_20CE1ED28()
{
  unint64_t result;

  result = qword_254996458;
  if (!qword_254996458)
  {
    result = MEMORY[0x212B97A80](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_254996458);
  }
  return result;
}

uint64_t sub_20CE1ED64(uint64_t a1, unint64_t a2)
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

unint64_t sub_20CE1EDA8()
{
  unint64_t result;

  result = qword_254996478;
  if (!qword_254996478)
  {
    result = MEMORY[0x212B97A80](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_254996478);
  }
  return result;
}

void sub_20CE1EDE4()
{
  sub_20CE1EE3C((uint64_t)&unk_254996480);
}

void sub_20CE1EE10()
{
  sub_20CE1EE3C((uint64_t)&unk_254996488);
}

void sub_20CE1EE3C(uint64_t a1)
{
  void (*v1)(uint64_t);

  if (!OUTLINED_FUNCTION_48(a1))
  {
    v1(255);
    OUTLINED_FUNCTION_66();
  }
  OUTLINED_FUNCTION_4();
}

void sub_20CE1EE6C()
{
  sub_20CE1EE3C((uint64_t)&unk_254996490);
}

uint64_t sub_20CE1EE98()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for ShortcutIndexedSearchView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_20CE66DC8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = *(int *)(a3 + 20);
    v10 = (uint64_t *)((char *)a1 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_20CE66E4C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v13 = *(int *)(a3 + 24);
    v14 = *(void **)((char *)a2 + v13);
    *(uint64_t *)((char *)a1 + v13) = (uint64_t)v14;
    v15 = v14;
  }
  return a1;
}

void destroy for ShortcutIndexedSearchView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_20CE66DC8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  v5 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_20CE66E4C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }

}

_QWORD *initializeWithCopy for ShortcutIndexedSearchView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_20CE66DC8();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_20CE66E4C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v11 = *(int *)(a3 + 24);
  v12 = *(void **)((char *)a2 + v11);
  *(_QWORD *)((char *)a1 + v11) = v12;
  v13 = v12;
  return a1;
}

_QWORD *assignWithCopy for ShortcutIndexedSearchView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  if (a1 != a2)
  {
    sub_20CE21AE0((uint64_t)a1, (uint64_t *)&unk_2549963F8);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_20CE66DC8();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v7 = *(int *)(a3 + 20);
    v8 = (_QWORD *)((char *)a1 + v7);
    v9 = (_QWORD *)((char *)a2 + v7);
    sub_20CE21AE0((uint64_t)a1 + v7, &qword_253CFA240);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_20CE66E4C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v11 = *(int *)(a3 + 24);
  v12 = *(void **)((char *)a2 + v11);
  v13 = *(void **)((char *)a1 + v11);
  *(_QWORD *)((char *)a1 + v11) = v12;
  v14 = v12;

  return a1;
}

char *initializeWithTake for ShortcutIndexedSearchView(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_20CE66DC8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v12 = sub_20CE66E4C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  *(_QWORD *)&a1[*(int *)(a3 + 24)] = *(_QWORD *)&a2[*(int *)(a3 + 24)];
  return a1;
}

char *assignWithTake for ShortcutIndexedSearchView(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  if (a1 != a2)
  {
    sub_20CE21AE0((uint64_t)a1, (uint64_t *)&unk_2549963F8);
    v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_20CE66DC8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    v8 = *(int *)(a3 + 20);
    v9 = &a1[v8];
    v10 = &a2[v8];
    sub_20CE21AE0((uint64_t)&a1[v8], &qword_253CFA240);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_20CE66E4C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  v13 = *(int *)(a3 + 24);
  v14 = *(void **)&a1[v13];
  *(_QWORD *)&a1[v13] = *(_QWORD *)&a2[v13];

  return a1;
}

uint64_t getEnumTagSinglePayload for ShortcutIndexedSearchView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_20CE1F5F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_get_extra_inhabitant_indexTm(a1, a2, a3, &qword_254996448, &qword_254996450);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for ShortcutIndexedSearchView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_20CE1F620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, (uint64_t)&qword_254996448, &qword_254996450);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

void sub_20CE1F640()
{
  unint64_t v0;
  unint64_t v1;

  sub_20CE206D0(319, (unint64_t *)&unk_2549964B0, (void (*)(uint64_t))MEMORY[0x24BDFBAE8]);
  if (v0 <= 0x3F)
  {
    sub_20CE206D0(319, (unint64_t *)&qword_253CFA248, (void (*)(uint64_t))MEMORY[0x24BDEB418]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

unint64_t sub_20CE1F6F4()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2549964C0;
  if (!qword_2549964C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996420);
    v2 = sub_20CE1F778();
    sub_20CE21718((uint64_t)&unk_254996510);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2549964C0);
  }
  return result;
}

unint64_t sub_20CE1F778()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549964C8;
  if (!qword_2549964C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996418);
    v2[0] = sub_20CE1F7E4();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549964C8);
  }
  return result;
}

unint64_t sub_20CE1F7E4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_2549964D0;
  if (!qword_2549964D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996410);
    sub_20CE213E8((uint64_t)&unk_2549964D8);
    v3 = v2;
    sub_20CE21718((uint64_t)&unk_253CFA3D0);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2549964D0);
  }
  return result;
}

unint64_t sub_20CE1F880()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_2549964E0;
  if (!qword_2549964E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549964E8);
    sub_20CE21718((uint64_t)&unk_2549964F0);
    v3 = v2;
    sub_20CE21718((uint64_t)&unk_254996500);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDEF3E0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2549964E0);
  }
  return result;
}

void type metadata accessor for WFIconViewDrawingStyle(uint64_t a1)
{
  sub_20CE12644(a1, (unint64_t *)&unk_254996518);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_20CE1F940(unsigned int *a1, int a2)
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

uint64_t sub_20CE1F990(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_20CE1F9D0 + 4 * byte_20CE6AC80[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_20CE1F9F0 + 4 * byte_20CE6AC85[v4]))();
}

_BYTE *sub_20CE1F9D0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_20CE1F9F0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_20CE1F9F8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_20CE1FA00(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_20CE1FA08(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_20CE1FA10(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_20CE1FA1C()
{
  return 0;
}

void type metadata accessor for ShortcutIndexedSearchView.CodingKeys()
{
  OUTLINED_FUNCTION_49();
}

uint64_t initializeBufferWithCopyOfBuffer for WorkflowGlyphIconView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_20CE1FA60()
{
  return swift_release();
}

uint64_t sub_20CE1FA68(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_retain();
  return a1;
}

_QWORD *sub_20CE1FABC(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy80_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x50uLL);
}

uint64_t sub_20CE1FB44(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_release();
  return a1;
}

uint64_t sub_20CE1FB8C(uint64_t a1, int a2)
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
      v2 = *(_QWORD *)(a1 + 72);
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

uint64_t sub_20CE1FBCC(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 72) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for ShortcutIndexedSearchView.Metrics()
{
  OUTLINED_FUNCTION_49();
}

uint64_t *sub_20CE1FC2C(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char *v16;
  char *v17;
  id v18;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549971B0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_20CE66F00();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      *v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = a3[5];
    v10 = (uint64_t *)((char *)v4 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_20CE66DC8();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v13 = a3[6];
    v14 = a3[7];
    v15 = *(void **)((char *)a2 + v13);
    *(uint64_t *)((char *)v4 + v13) = (uint64_t)v15;
    v16 = (char *)v4 + v14;
    v17 = (char *)a2 + v14;
    *(_QWORD *)v16 = *(_QWORD *)v17;
    *(_OWORD *)(v16 + 8) = *(_OWORD *)(v17 + 8);
    *(_OWORD *)(v16 + 24) = *(_OWORD *)(v17 + 24);
    *(_OWORD *)(v16 + 40) = *(_OWORD *)(v17 + 40);
    *(_OWORD *)(v16 + 56) = *(_OWORD *)(v17 + 56);
    *((_QWORD *)v16 + 9) = *((_QWORD *)v17 + 9);
    v18 = v15;
  }
  swift_retain();
  return v4;
}

uint64_t sub_20CE1FDC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549971B0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_20CE66F00();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  v5 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_20CE66DC8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }

  return swift_release();
}

_QWORD *sub_20CE1FEA0(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char *v14;
  char *v15;
  id v16;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549971B0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_20CE66F00();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = a3[5];
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_20CE66DC8();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v11 = a3[6];
  v12 = a3[7];
  v13 = *(void **)((char *)a2 + v11);
  *(_QWORD *)((char *)a1 + v11) = v13;
  v14 = (char *)a1 + v12;
  v15 = (char *)a2 + v12;
  *(_QWORD *)v14 = *(_QWORD *)v15;
  *(_OWORD *)(v14 + 8) = *(_OWORD *)(v15 + 8);
  *(_OWORD *)(v14 + 24) = *(_OWORD *)(v15 + 24);
  *(_OWORD *)(v14 + 40) = *(_OWORD *)(v15 + 40);
  *(_OWORD *)(v14 + 56) = *(_OWORD *)(v15 + 56);
  *((_QWORD *)v14 + 9) = *((_QWORD *)v15 + 9);
  v16 = v13;
  swift_retain();
  return a1;
}

_QWORD *sub_20CE20014(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;

  if (a1 != a2)
  {
    sub_20CE21AE0((uint64_t)a1, (uint64_t *)&unk_2549971B0);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549971B0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_20CE66F00();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v7 = a3[5];
    v8 = (_QWORD *)((char *)a1 + v7);
    v9 = (_QWORD *)((char *)a2 + v7);
    sub_20CE21AE0((uint64_t)a1 + v7, (uint64_t *)&unk_2549963F8);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_20CE66DC8();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v11 = a3[6];
  v12 = *(void **)((char *)a2 + v11);
  v13 = *(void **)((char *)a1 + v11);
  *(_QWORD *)((char *)a1 + v11) = v12;
  v14 = v12;

  v15 = a3[7];
  v16 = (_QWORD *)((char *)a1 + v15);
  v17 = (_QWORD *)((char *)a2 + v15);
  *v16 = *v17;
  v16[1] = v17[1];
  v16[2] = v17[2];
  v16[3] = v17[3];
  v16[4] = v17[4];
  v16[5] = v17[5];
  v16[6] = v17[6];
  v16[7] = v17[7];
  v16[8] = v17[8];
  v16[9] = v17[9];
  swift_retain();
  swift_release();
  return a1;
}

char *sub_20CE201E4(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549971B0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_20CE66F00();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v12 = sub_20CE66DC8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  v13 = a3[7];
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  memcpy(&a1[v13], &a2[v13], 0x50uLL);
  return a1;
}

char *sub_20CE2031C(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  __int128 v18;
  __int128 v19;

  if (a1 != a2)
  {
    sub_20CE21AE0((uint64_t)a1, (uint64_t *)&unk_2549971B0);
    v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549971B0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_20CE66F00();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = &a2[v8];
    sub_20CE21AE0((uint64_t)&a1[v8], (uint64_t *)&unk_2549963F8);
    v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_20CE66DC8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  v13 = a3[6];
  v14 = *(void **)&a1[v13];
  *(_QWORD *)&a1[v13] = *(_QWORD *)&a2[v13];

  v15 = a3[7];
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = *((_OWORD *)v17 + 1);
  *(_OWORD *)v16 = *(_OWORD *)v17;
  *((_OWORD *)v16 + 1) = v18;
  v19 = *((_OWORD *)v17 + 3);
  *((_OWORD *)v16 + 2) = *((_OWORD *)v17 + 2);
  *((_OWORD *)v16 + 3) = v19;
  *((_QWORD *)v16 + 8) = *((_QWORD *)v17 + 8);
  *((_QWORD *)v16 + 9) = *((_QWORD *)v17 + 9);
  swift_release();
  return a1;
}

uint64_t sub_20CE204A8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_20CE204B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_get_extra_inhabitant_indexTm(a1, a2, a3, (uint64_t *)&unk_254996530, &qword_254996448);
}

void __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a4);
  if (*(_DWORD *)(*(_QWORD *)(v9 - 8) + 84) == (_DWORD)a2)
  {
    v10 = v9;
    v11 = a1;
LABEL_5:
    OUTLINED_FUNCTION_14(v11, a2, v10);
    return;
  }
  v12 = __swift_instantiateConcreteTypeFromMangledName(a5);
  if (*(_DWORD *)(*(_QWORD *)(v12 - 8) + 84) == (_DWORD)a2)
  {
    v10 = v12;
    v11 = a1 + *(int *)(a3 + 20);
    goto LABEL_5;
  }
  OUTLINED_FUNCTION_67(*(_QWORD *)(a1 + *(int *)(a3 + 24)));
  OUTLINED_FUNCTION_21();
}

uint64_t sub_20CE20550()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_20CE2055C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, (uint64_t)&unk_254996530, &qword_254996448);
}

void __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;

  OUTLINED_FUNCTION_65();
  __swift_instantiateConcreteTypeFromMangledName(v10);
  OUTLINED_FUNCTION_43();
  if (v14)
  {
    v12 = v11;
    v13 = v7;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    OUTLINED_FUNCTION_43();
    if (!v14)
    {
      *(_QWORD *)(v7 + *(int *)(v8 + 24)) = (v6 - 1);
      return;
    }
    v12 = v15;
    v13 = v7 + *(int *)(v8 + 20);
  }
  __swift_storeEnumTagSinglePayload(v13, v6, v6, v12);
}

uint64_t type metadata accessor for ShortcutIndexedSearchView.DeepLinkButton(uint64_t a1)
{
  return sub_20CE15EE0(a1, (uint64_t *)&unk_254996540);
}

void sub_20CE20614()
{
  unint64_t v0;
  unint64_t v1;

  sub_20CE206D0(319, (unint64_t *)&qword_254996550, (void (*)(uint64_t))MEMORY[0x24BDEC2E0]);
  if (v0 <= 0x3F)
  {
    sub_20CE206D0(319, (unint64_t *)&unk_2549964B0, (void (*)(uint64_t))MEMORY[0x24BDFBAE8]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_20CE206D0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_20CE66E58();
    if (!v5)
      atomic_store(v4, a2);
  }
  OUTLINED_FUNCTION_4();
}

uint64_t *sub_20CE20718(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_20CE66DC8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = *(int *)(a3 + 20);
    v10 = *(int *)(a3 + 24);
    v11 = *(void **)((char *)a2 + v9);
    *(uint64_t *)((char *)a1 + v9) = (uint64_t)v11;
    *(_OWORD *)((char *)a1 + v10) = *(_OWORD *)((char *)a2 + v10);
    v12 = v11;
  }
  return a1;
}

void sub_20CE207FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_20CE66DC8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }

}

_QWORD *sub_20CE2086C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_20CE66DC8();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = *(void **)((char *)a2 + v7);
  *(_QWORD *)((char *)a1 + v7) = v9;
  *(_OWORD *)((char *)a1 + v8) = *(_OWORD *)((char *)a2 + v8);
  v10 = v9;
  return a1;
}

_QWORD *sub_20CE20924(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;

  if (a1 != a2)
  {
    sub_20CE21AE0((uint64_t)a1, (uint64_t *)&unk_2549963F8);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_20CE66DC8();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)((char *)a2 + v7);
  v9 = *(void **)((char *)a1 + v7);
  *(_QWORD *)((char *)a1 + v7) = v8;
  v10 = v8;

  v11 = *(int *)(a3 + 24);
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  *v12 = *v13;
  v12[1] = v13[1];
  return a1;
}

char *sub_20CE20A10(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_20CE66DC8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = *(int *)(a3 + 24);
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  *(_OWORD *)&a1[v8] = *(_OWORD *)&a2[v8];
  return a1;
}

char *sub_20CE20AC0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (a1 != a2)
  {
    sub_20CE21AE0((uint64_t)a1, (uint64_t *)&unk_2549963F8);
    v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_20CE66DC8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = *(int *)(a3 + 20);
  v9 = *(void **)&a1[v8];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];

  *(_OWORD *)&a1[*(int *)(a3 + 24)] = *(_OWORD *)&a2[*(int *)(a3 + 24)];
  return a1;
}

uint64_t sub_20CE20B94()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_20CE20BA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996448);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    OUTLINED_FUNCTION_14(a1, a2, v6);
  }
  else
  {
    OUTLINED_FUNCTION_67(*(_QWORD *)(a1 + *(int *)(a3 + 20)));
    OUTLINED_FUNCTION_21();
  }
}

uint64_t sub_20CE20C00()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_20CE20C0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  OUTLINED_FUNCTION_65();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254996448);
  OUTLINED_FUNCTION_43();
  if (v4)
  {
    __swift_storeEnumTagSinglePayload(v1, v0, v0, v3);
  }
  else
  {
    *(_QWORD *)(v1 + *(int *)(v2 + 20)) = (v0 - 1);
    OUTLINED_FUNCTION_21();
  }
}

uint64_t type metadata accessor for ShortcutIndexedSearchView.BadgedIconView(uint64_t a1)
{
  return sub_20CE15EE0(a1, (uint64_t *)&unk_254996560);
}

void sub_20CE20C7C()
{
  unint64_t v0;

  sub_20CE206D0(319, (unint64_t *)&unk_2549964B0, (void (*)(uint64_t))MEMORY[0x24BDFBAE8]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_20CE20D0C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20CE20D1C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_20CE20D30()
{
  unint64_t result;

  result = qword_254996570;
  if (!qword_254996570)
  {
    result = MEMORY[0x212B97A80](&unk_20CE6B090, &unk_24C5A9730);
    atomic_store(result, (unint64_t *)&qword_254996570);
  }
  return result;
}

void sub_20CE20D6C()
{
  sub_20CE1EE3C((uint64_t)&unk_254996578);
}

unint64_t sub_20CE20D9C()
{
  unint64_t result;

  result = qword_254996580;
  if (!qword_254996580)
  {
    result = MEMORY[0x212B97A80](&unk_20CE6AFC8, &unk_24C5A9730);
    atomic_store(result, (unint64_t *)&qword_254996580);
  }
  return result;
}

unint64_t sub_20CE20DDC()
{
  unint64_t result;

  result = qword_254996588;
  if (!qword_254996588)
  {
    result = MEMORY[0x212B97A80](&unk_20CE6AFF0, &unk_24C5A9730);
    atomic_store(result, (unint64_t *)&qword_254996588);
  }
  return result;
}

void sub_20CE20E18(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_34(a1, a2, a3);
  OUTLINED_FUNCTION_9(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_4();
}

uint64_t sub_20CE20E44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = OUTLINED_FUNCTION_62();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 16) & ~v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549971B0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_20CE66F00();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v0 + v3, v4);
  }
  else
  {
    swift_release();
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_20CE66DC8();
    OUTLINED_FUNCTION_25(v5);
  }
  else
  {
    swift_release();
  }

  swift_release();
  return swift_deallocObject();
}

void sub_20CE20F4C()
{
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_57();
  sub_20CE1E008();
  OUTLINED_FUNCTION_4();
}

void sub_20CE20F70(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_20CE1E20C(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_20CE20F78()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_2549965B0;
  if (!qword_2549965B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549965A8);
    sub_20CE20FFC((uint64_t)&unk_2549965B8);
    v3 = v2;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDF5578], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_2549965B0);
  }
  return result;
}

void sub_20CE20FFC(uint64_t a1)
{
  unint64_t *v1;
  uint64_t *v2;
  uint64_t (*v3)(void);
  uint64_t (*v4)(void);
  uint64_t (*v5)(void);
  uint64_t (*v6)(void);
  uint64_t v7;
  _QWORD v8[2];

  if (!OUTLINED_FUNCTION_48(a1))
  {
    v5 = v4;
    v6 = v3;
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(v2);
    v8[0] = v6();
    v8[1] = v5();
    atomic_store(MEMORY[0x212B97A80](MEMORY[0x24BDEF3E0], v7, v8), v1);
  }
  OUTLINED_FUNCTION_46();
}

unint64_t sub_20CE2105C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2549965C8;
  if (!qword_2549965C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549965D0);
    v2 = sub_20CE210E0();
    sub_20CE21718((uint64_t)&qword_253CFA3B8);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2549965C8);
  }
  return result;
}

unint64_t sub_20CE210E0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2549965D8;
  if (!qword_2549965D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549965E0);
    sub_20CE21718((uint64_t)&unk_2549965E8);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2549965D8);
  }
  return result;
}

unint64_t sub_20CE21164()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2549965F8;
  if (!qword_2549965F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996600);
    v2 = sub_20CE211E8();
    sub_20CE21718((uint64_t)&unk_254996620);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2549965F8);
  }
  return result;
}

unint64_t sub_20CE211E8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_254996608;
  if (!qword_254996608)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996610);
    sub_20CE1EE3C((uint64_t)&unk_254996618);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254996608);
  }
  return result;
}

unint64_t sub_20CE2126C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t OpaqueTypeConformance2;
  uint64_t v8;
  _QWORD v9[6];

  result = qword_254996648;
  if (!qword_254996648)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549965A0);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996590);
    v3 = sub_20CE66FA8();
    sub_20CE21718((uint64_t)&unk_254996630);
    v5 = v4;
    sub_20CE1EE3C((uint64_t)&unk_254996638);
    v9[2] = v2;
    v9[3] = v3;
    v9[4] = v5;
    v9[5] = v6;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_20CE21718((uint64_t)&unk_254996650);
    v9[0] = OpaqueTypeConformance2;
    v9[1] = v8;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v9);
    atomic_store(result, (unint64_t *)&qword_254996648);
  }
  return result;
}

void sub_20CE21374(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_26(v2);
  OUTLINED_FUNCTION_4();
}

uint64_t sub_20CE213A4(uint64_t a1)
{
  swift_retain();
  return a1;
}

void sub_20CE213CC()
{
  sub_20CE213E8((uint64_t)&unk_2549966E0);
}

void sub_20CE213E8(uint64_t a1)
{
  unint64_t *v1;
  uint64_t (*v2)(void);
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  if (!OUTLINED_FUNCTION_48(a1))
  {
    v4 = OUTLINED_FUNCTION_20(0, v3);
    v5 = v2();
    atomic_store(MEMORY[0x212B97A80](MEMORY[0x24BDF5578], v4, &v5), v1);
  }
  OUTLINED_FUNCTION_46();
}

unint64_t sub_20CE21434()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549966E8;
  if (!qword_2549966E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2549966F0);
    v2[0] = sub_20CE19704();
    v2[1] = sub_20CE216C8((uint64_t)&qword_254996700);
    result = MEMORY[0x212B97A80](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549966E8);
  }
  return result;
}

unint64_t sub_20CE214B8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_254996710;
  if (!qword_254996710)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549966B0);
    sub_20CE20FFC((uint64_t)&unk_254996718);
    v3 = v2;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDF5578], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_254996710);
  }
  return result;
}

unint64_t sub_20CE2153C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_254996720;
  if (!qword_254996720)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549966A8);
    v2 = sub_20CE215C0();
    sub_20CE21718((uint64_t)&unk_254996758);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_254996720);
  }
  return result;
}

unint64_t sub_20CE215C0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_254996728;
  if (!qword_254996728)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549966A0);
    v2 = sub_20CE21644();
    sub_20CE21718((uint64_t)&unk_254996750);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_254996728);
  }
  return result;
}

unint64_t sub_20CE21644()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254996730;
  if (!qword_254996730)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996738);
    v2[0] = sub_20CE216C8((uint64_t)&unk_254996740);
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254996730);
  }
  return result;
}

unint64_t sub_20CE216C8(uint64_t a1)
{
  unint64_t *v1;
  uint64_t v2;
  unint64_t result;
  uint64_t *v4;
  uint64_t v5;
  _QWORD v6[2];

  result = OUTLINED_FUNCTION_48(a1);
  if (!result)
  {
    v5 = OUTLINED_FUNCTION_20(0, v4);
    v6[0] = MEMORY[0x24BDF40E8];
    v6[1] = v2;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v5, v6);
    atomic_store(result, v1);
  }
  return result;
}

void sub_20CE21718(uint64_t a1)
{
  uint64_t *v1;

  if (!OUTLINED_FUNCTION_48(a1))
  {
    OUTLINED_FUNCTION_20(0, v1);
    OUTLINED_FUNCTION_66();
  }
  OUTLINED_FUNCTION_4();
}

unint64_t sub_20CE21740()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_254997080;
  if (!qword_254997080)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_254997010);
    v2 = sub_20CE19704();
    sub_20CE1EE3C((uint64_t)&unk_254996770);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_254997080);
  }
  return result;
}

void sub_20CE217D4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_34(a1, a2, a3);
  OUTLINED_FUNCTION_9(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_4();
}

uint64_t sub_20CE21800(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_bundleIdentifier);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_20CE67638();

  return v3;
}

uint64_t sub_20CE21860(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for AppIconView(a2, a1);
  return a2;
}

uint64_t sub_20CE2189C(uint64_t a1)
{
  destroy for AppIconView(a1);
  return a1;
}

void sub_20CE218D0(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_20CE219F4(a1, a2);
}

void sub_20CE218E4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    objc_opt_self();
    atomic_store(swift_getObjCClassMetadata(), a2);
  }
  OUTLINED_FUNCTION_4();
}

uint64_t sub_20CE21918(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_20CE21954()
{
  uint64_t v0;

  OUTLINED_FUNCTION_63();
  v0 = sub_20CE67194();
  OUTLINED_FUNCTION_25(v0);
  return swift_deallocObject();
}

uint64_t sub_20CE219B8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  OUTLINED_FUNCTION_63();
  OUTLINED_FUNCTION_57();
  return sub_20CE1EA90(a1, v2 + v5, a2);
}

void sub_20CE219F4(void *a1@<X0>, uint64_t a2@<X8>)
{
  char v3;
  char v4;

  *(_QWORD *)a2 = sub_20CE1EB14(a1);
  *(_BYTE *)(a2 + 8) = v3 & 1;
  *(_BYTE *)(a2 + 9) = v4 & 1;
  OUTLINED_FUNCTION_4();
}

void sub_20CE21A24(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_35(a1, a2, a3);
  OUTLINED_FUNCTION_9(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_4();
}

unint64_t sub_20CE21A50()
{
  unint64_t result;

  result = qword_254996880;
  if (!qword_254996880)
  {
    result = MEMORY[0x212B97A80](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_254996880);
  }
  return result;
}

uint64_t sub_20CE21A8C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

void sub_20CE21AA4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_35(a1, a2, a3);
  OUTLINED_FUNCTION_9(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_4();
}

uint64_t sub_20CE21AD0(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

void sub_20CE21AE0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_26(v2);
  OUTLINED_FUNCTION_4();
}

uint64_t sub_20CE21B10(uint64_t a1)
{
  swift_retain();
  return a1;
}

void type metadata accessor for WFContextualActionIconDisplayStyle(uint64_t a1)
{
  sub_20CE12644(a1, &qword_2549968A0);
}

void type metadata accessor for DisplayStyle(uint64_t a1)
{
  sub_20CE12644(a1, &qword_2549968A8);
}

uint64_t sub_20CE21B60(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_20CE21B80(uint64_t result, int a2, int a3)
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

void type metadata accessor for ShortcutIndexedSearchView.Metrics.Icon()
{
  OUTLINED_FUNCTION_49();
}

uint64_t sub_20CE21BB4()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549965A0);
  sub_20CE67218();
  sub_20CE2126C();
  sub_20CE1EE3C((uint64_t)&unk_254996658);
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_20CE21C40()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_2549968B0;
  if (!qword_2549968B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549966C0);
    sub_20CE20FFC((uint64_t)&unk_2549968B8);
    v3 = v2;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDF5578], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_2549968B0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_7(uint64_t a1)
{
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  return sub_20CE67278();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return sub_20CE67200();
}

uint64_t OUTLINED_FUNCTION_9@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_11()
{
  return sub_20CE66DC8();
}

uint64_t OUTLINED_FUNCTION_14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_16()
{
  return sub_20CE66F54();
}

uint64_t OUTLINED_FUNCTION_17()
{
  return 0;
}

void OUTLINED_FUNCTION_18(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 184) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_20(uint64_t a1, uint64_t *a2)
{
  return __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
}

uint64_t OUTLINED_FUNCTION_23()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t OUTLINED_FUNCTION_24()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_25(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_26(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_27()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v1, *(_QWORD *)(v2 - 72));
}

uint64_t OUTLINED_FUNCTION_28@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_29()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_30()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_32()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_33(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_34(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

uint64_t OUTLINED_FUNCTION_35(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

void OUTLINED_FUNCTION_37(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_20CE21AA4(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, 1, a4);
}

uint64_t OUTLINED_FUNCTION_45(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 104))(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_47()
{
  return sub_20CE67548();
}

uint64_t OUTLINED_FUNCTION_48(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t OUTLINED_FUNCTION_50@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

void OUTLINED_FUNCTION_51(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_20CE21AA4(a1, a2, v2);
}

void OUTLINED_FUNCTION_52(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);
  uint64_t v2;

  sub_20CE20E18(a1, v2, v1);
}

void OUTLINED_FUNCTION_55(uint64_t a1)
{
  uint64_t *v1;

  sub_20CE21AE0(a1, v1);
}

uint64_t OUTLINED_FUNCTION_56()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_58(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;

  return v3(v4, a2, v2);
}

uint64_t OUTLINED_FUNCTION_59()
{
  return sub_20CE66DBC();
}

uint64_t OUTLINED_FUNCTION_60()
{
  unint64_t v0;
  uint64_t v1;

  return sub_20CE1ED64(v1, v0);
}

void OUTLINED_FUNCTION_61()
{
  sub_20CE2930C();
}

uint64_t OUTLINED_FUNCTION_62()
{
  return type metadata accessor for ShortcutIndexedSearchView.DeepLinkButton(0);
}

uint64_t OUTLINED_FUNCTION_63()
{
  return sub_20CE66FC0();
}

uint64_t OUTLINED_FUNCTION_64()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_66()
{
  JUMPOUT(0x212B97A80);
}

uint64_t OUTLINED_FUNCTION_67@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF)
    LODWORD(a1) = -1;
  return (a1 + 1);
}

uint64_t *sub_20CE22124(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_20CE66E4C();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t sub_20CE221FC(uint64_t a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v2 = sub_20CE66E4C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

_QWORD *sub_20CE22260(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_20CE66E4C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  return a1;
}

_QWORD *sub_20CE2230C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_20CE22D8C((uint64_t)a1, &qword_253CFA240);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_20CE66E4C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  return a1;
}

char *sub_20CE223D0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_20CE66E4C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_20CE22478(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_20CE22D8C((uint64_t)a1, &qword_253CFA240);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_20CE66E4C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

uint64_t sub_20CE22538()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20CE22544(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996450);
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_20CE2257C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20CE22588(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996450);
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t type metadata accessor for SizedEllipsis()
{
  uint64_t result;

  result = qword_254996920;
  if (!qword_254996920)
    return swift_getSingletonMetadata();
  return result;
}

void sub_20CE225FC()
{
  unint64_t v0;

  sub_20CE22670();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_20CE22670()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253CFA248)
  {
    sub_20CE66E4C();
    v0 = sub_20CE66E58();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253CFA248);
  }
}

uint64_t sub_20CE226C4()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_20CE226D4(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t KeyPath;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;

  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996930);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_38();
  v4 = (uint64_t *)(v3 - v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254996670);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_38();
  v8 = v7 - v6;
  v9 = sub_20CE67488();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_38();
  v13 = v12 - v11;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996938);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_38();
  v17 = v16 - v15;
  sub_20CE6747C();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v10 + 104))(v13, *MEMORY[0x24BDF3FD0], v9);
  v18 = sub_20CE674DC();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v13, v9);
  type metadata accessor for SizedEllipsis();
  sub_20CE675CC();
  sub_20CE66EAC();
  sub_20CE671D0();
  v19 = sub_20CE671DC();
  __swift_storeEnumTagSinglePayload(v8, 0, 1, v19);
  KeyPath = swift_getKeyPath();
  sub_20CE22D4C(v8, (uint64_t)v4 + *(int *)(v25 + 28), &qword_254996670);
  *v4 = KeyPath;
  sub_20CE22D4C((uint64_t)v4, v17 + *(int *)(v24 + 36), &qword_254996930);
  *(_QWORD *)v17 = v18;
  *(_QWORD *)(v17 + 8) = v27;
  *(_BYTE *)(v17 + 16) = v28;
  *(_QWORD *)(v17 + 24) = v29;
  *(_BYTE *)(v17 + 32) = v30;
  *(_QWORD *)(v17 + 40) = v31;
  *(_QWORD *)(v17 + 48) = v32;
  swift_retain();
  sub_20CE22D8C((uint64_t)v4, &qword_254996930);
  sub_20CE22D8C(v8, &qword_254996670);
  swift_release();
  v21 = sub_20CE22998();
  v22 = sub_20CE22A78();
  sub_20CE22D4C(v17, a1, &qword_254996938);
  v23 = (uint64_t *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254996940) + 36));
  *v23 = v21;
  v23[1] = v22;
  sub_20CE22D8C(v17, &qword_254996938);
}

uint64_t sub_20CE22998()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  char v7;
  void (*v8)(char *, uint64_t);
  uint64_t v10;

  v0 = sub_20CE66E4C();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v10 - v5;
  sub_20CE1686C();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x24BDEB3F0], v0);
  v7 = sub_20CE66E40();
  v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  if ((v7 & 1) != 0)
    return sub_20CE673F8();
  else
    return sub_20CE673E0();
}

uint64_t sub_20CE22A78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char v14;
  void (*v15)(char *, uint64_t);
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[2];

  v0 = sub_20CE675F0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549971A0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (_QWORD *)((char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = sub_20CE66E4C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v19 - v12;
  sub_20CE1686C();
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v11, *MEMORY[0x24BDEB3F0], v7);
  v14 = sub_20CE66E40();
  v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  v15(v11, v7);
  v15(v13, v7);
  if ((v14 & 1) != 0)
  {
    sub_20CE673F8();
    v16 = sub_20CE67404();
    swift_release();
    (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDF5098], v0);
    (*(void (**)(char *, char *, uint64_t))(v1 + 16))((char *)v6 + *(int *)(v4 + 36), v3, v0);
    *v6 = v16;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_20CE22F34(&qword_254996948, (uint64_t *)&unk_2549971A0, MEMORY[0x24BDEF780]);
  }
  else
  {
    sub_20CE673E0();
    v17 = sub_20CE67404();
    swift_release();
    v19[1] = v17;
  }
  return sub_20CE66EB8();
}

uint64_t sub_20CE22CA8()
{
  return sub_20CE670C8();
}

uint64_t sub_20CE22CC8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996670);
  MEMORY[0x24BDAC7A8](v2);
  sub_20CE22D4C(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_254996670);
  return sub_20CE670D4();
}

void sub_20CE22D4C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_4();
}

void sub_20CE22D8C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_4();
}

unint64_t sub_20CE22DC8()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_254996950;
  if (!qword_254996950)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996940);
    v2 = sub_20CE22E4C();
    sub_20CE22F34(&qword_254996968, (uint64_t *)&unk_254997160, MEMORY[0x24BDF0978]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_254996950);
  }
  return result;
}

unint64_t sub_20CE22E4C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_254996958;
  if (!qword_254996958)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996938);
    v2 = sub_20CE22ED0();
    sub_20CE22F34(&qword_254996960, &qword_254996930, MEMORY[0x24BDF1028]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_254996958);
  }
  return result;
}

unint64_t sub_20CE22ED0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254996700;
  if (!qword_254996700)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996708);
    v2[0] = MEMORY[0x24BDF40E8];
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254996700);
  }
  return result;
}

void sub_20CE22F34(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x212B97A80](a3, v5), a1);
  }
  OUTLINED_FUNCTION_4();
}

uint64_t WFImage.image.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  unsigned int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996970);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (uint64_t)OUTLINED_FUNCTION_0_0(v4, sel_representationType);
  if (v5 == 5)
  {
    v5 = sub_20CE231B0(v0, (SEL *)&selRef_name);
    if (v6)
    {
      v7 = OUTLINED_FUNCTION_0_0(v5, sel_bundle);
      v8 = sub_20CE674E8();
      goto LABEL_10;
    }
  }
  v9 = (uint64_t)OUTLINED_FUNCTION_0_0(v5, sel_representationType);
  if (v9 != 4 || (v9 = sub_20CE231B0(v0, (SEL *)&selRef_symbolName), !v10))
  {
    v13 = OUTLINED_FUNCTION_0_0(v9, sel_platformImage);
    goto LABEL_9;
  }
  v11 = OUTLINED_FUNCTION_0_0(v9, sel_symbolConfiguration);

  if (v11)
  {
    v12 = swift_bridgeObjectRelease();
    v13 = OUTLINED_FUNCTION_0_0(v12, sel_untintedPlatformImage);
LABEL_9:
    v14 = v13;
    v8 = _s7SwiftUI5ImageV18WorkflowUIServicesE08platformC0ACSo7UIImageC_tcfC_0();
    goto LABEL_10;
  }
  v8 = sub_20CE674B8();
LABEL_10:
  v15 = OUTLINED_FUNCTION_0_0(v8, sel_renderingMode);
  if (v15 == (id)1)
  {
    v16 = (unsigned int *)MEMORY[0x24BDF4060];
  }
  else
  {
    if (v15 != (id)2)
    {
      v21 = sub_20CE674D0();
      v19 = (uint64_t)v3;
      v20 = 1;
      goto LABEL_16;
    }
    v16 = (unsigned int *)MEMORY[0x24BDF4068];
  }
  v17 = *v16;
  v18 = sub_20CE674D0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v3, v17, v18);
  v19 = (uint64_t)v3;
  v20 = 0;
  v21 = v18;
LABEL_16:
  __swift_storeEnumTagSinglePayload(v19, v20, 1, v21);
  v22 = sub_20CE674AC();
  swift_release();
  sub_20CE23170((uint64_t)v3);
  return v22;
}

uint64_t sub_20CE23170(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996970);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20CE231B0(void *a1, SEL *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, *a2);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = sub_20CE67638();

  return v4;
}

id OUTLINED_FUNCTION_0_0(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

double AppIconView.init(icon:size:animated:)@<D0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char v9;
  double result;
  __int128 v11;

  v7 = *a2;
  v8 = a2[1];
  v9 = *((_BYTE *)a2 + 16);
  *(_QWORD *)(a4 + 32) = swift_getKeyPath();
  *(_BYTE *)(a4 + 40) = 0;
  *(_QWORD *)(a4 + 48) = swift_getKeyPath();
  *(_BYTE *)(a4 + 88) = 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254996778);
  sub_20CE67548();
  result = *(double *)&v11;
  *(_OWORD *)(a4 + 96) = v11;
  *(_QWORD *)a4 = a1;
  *(_QWORD *)(a4 + 8) = v7;
  *(_QWORD *)(a4 + 16) = v8;
  *(_BYTE *)(a4 + 24) = v9;
  *(_BYTE *)(a4 + 112) = a3;
  return result;
}

CGSize __swiftcall IconDisplaySizeWithPadding(_:)(CGSize a1)
{
  double v1;
  double v2;
  CGSize result;

  v1 = a1.width / 0.8;
  v2 = a1.height / 0.8;
  result.height = v2;
  result.width = v1;
  return result;
}

double IconSize.cornerRadiusRatio.getter()
{
  uint64_t v0;

  if ((*(_BYTE *)(v0 + 16) & 0xE0) != 0x60)
    return 0.225;
  if ((*(_BYTE *)(v0 + 16) & 1) != 0)
    return dbl_20CE6BDA8[*(_QWORD *)(v0 + 8)];
  return *(double *)(v0 + 8);
}

uint64_t static IconSize.== infix(_:_:)(uint64_t a1)
{
  return ((uint64_t (*)(void))((char *)sub_20CE23348 + 4 * byte_20CE6B535[*(unsigned __int8 *)(a1 + 16) >> 5]))();
}

BOOL sub_20CE23348()
{
  unsigned int v0;
  double v1;
  double v2;

  return v0 < 0x20 && v2 == v1;
}

BOOL static IconCornerRadiusRatio.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  double v2;
  double v3;
  BOOL v4;
  char v6;
  char v7;

  v2 = *(double *)a1;
  v3 = *(double *)a2;
  if (*(_BYTE *)(a1 + 8) != 1)
  {
    if ((*(_BYTE *)(a2 + 8) & 1) == 0)
      return v2 == *(double *)a2;
    return 0;
  }
  if (v2 == 0.0)
  {
    v4 = *(_QWORD *)&v3 == 0;
  }
  else
  {
    if (*(_QWORD *)&v2 != 1)
    {
      if (*(_QWORD *)&v3 > 1uLL)
        v7 = *(_BYTE *)(a2 + 8);
      else
        v7 = 0;
      return (v7 & 1) != 0;
    }
    v4 = *(_QWORD *)&v3 == 1;
  }
  if (v4)
    v6 = *(_BYTE *)(a2 + 8);
  else
    v6 = 0;
  return (v6 & 1) != 0;
}

uint64_t IconSize.hashValue.getter()
{
  OUTLINED_FUNCTION_29_0();
  IconSize.hash(into:)();
  return OUTLINED_FUNCTION_67_0();
}

uint64_t sub_20CE23568()
{
  sub_20CE678B4();
  IconSize.hash(into:)();
  return sub_20CE678E4();
}

void IconCornerRadiusRatio.hash(into:)()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 8) == 1)
  {
    sub_20CE678C0();
  }
  else
  {
    OUTLINED_FUNCTION_80();
    sub_20CE678D8();
  }
  OUTLINED_FUNCTION_4();
}

uint64_t IconCornerRadiusRatio.hashValue.getter()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 8);
  OUTLINED_FUNCTION_29_0();
  if (v1 == 1)
  {
    sub_20CE678C0();
  }
  else
  {
    OUTLINED_FUNCTION_80();
    sub_20CE678D8();
  }
  return OUTLINED_FUNCTION_67_0();
}

uint64_t sub_20CE236A0()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 8);
  sub_20CE678B4();
  sub_20CE678C0();
  if (v1 != 1)
    sub_20CE678D8();
  return sub_20CE678E4();
}

void CGSize.hash(into:)()
{
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_84();
}

void IconView.DisplayMode.hash(into:)()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  if (*v0 && v1 != (void *)1)
  {
    sub_20CE678C0();
    v2 = v1;
    sub_20CE67758();
    sub_20CE678CC();
    sub_20CE17348(v1);
  }
  else
  {
    sub_20CE678C0();
  }
}

uint64_t static IconView.DisplayMode.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  char v3;
  void *v4;
  char v5;
  char v6;
  void *v7;
  char v8;

  v2 = *(void **)a1;
  v3 = *(_BYTE *)(a1 + 8);
  v4 = *(void **)a2;
  v5 = *(_BYTE *)(a2 + 8);
  if (!*(_QWORD *)a1)
  {
    if (!v4)
    {
      sub_20CE17348(0);
      OUTLINED_FUNCTION_36_0(0);
      v6 = 1;
      return v6 & 1;
    }
    goto LABEL_8;
  }
  if (v2 == (void *)1)
  {
    if (v4 == (void *)1)
    {
      v6 = 1;
      sub_20CE17348((id)1);
      OUTLINED_FUNCTION_36_0((id)1);
      return v6 & 1;
    }
LABEL_8:
    v7 = OUTLINED_FUNCTION_49_0();
    sub_20CE17348(v7);
    OUTLINED_FUNCTION_36_0(v4);
    v6 = 0;
    return v6 & 1;
  }
  if ((unint64_t)v4 < 2)
    goto LABEL_8;
  OUTLINED_FUNCTION_58_0(a1, (unint64_t *)&qword_253CFA468);
  OUTLINED_FUNCTION_49_0();
  v8 = sub_20CE6774C();
  sub_20CE17348(v2);
  OUTLINED_FUNCTION_36_0(v4);
  if ((v8 & 1) != 0)
    v6 = ((v3 & 1) == 0) ^ v5;
  else
    v6 = 0;
  return v6 & 1;
}

uint64_t IconView.DisplayMode.hashValue.getter()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  OUTLINED_FUNCTION_29_0();
  sub_20CE678C0();
  if ((unint64_t)v1 > 1)
  {
    v2 = v1;
    sub_20CE67758();
    sub_20CE678CC();
    OUTLINED_FUNCTION_36_0(v1);
  }
  return OUTLINED_FUNCTION_67_0();
}

uint64_t sub_20CE23994()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  sub_20CE678B4();
  sub_20CE678C0();
  if ((unint64_t)v1 > 1)
  {
    v2 = v1;
    sub_20CE67758();
    sub_20CE678CC();
    sub_20CE17348(v1);
  }
  return sub_20CE678E4();
}

id IconView.icon.getter()
{
  id *v0;

  return *v0;
}

__n128 IconView.size.getter@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v1;
  unsigned __int8 v2;
  __n128 result;

  v2 = *(_BYTE *)(v1 + 24);
  result = *(__n128 *)(v1 + 8);
  *a1 = result;
  a1[1].n128_u8[0] = v2;
  return result;
}

id IconView.displayMode.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 32);
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(v1 + 40);
  return sub_20CE15F58(v2);
}

uint64_t IconView.animated.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 41);
}

__n128 IconView.init(_:size:displayMode:animated:)@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X1>, uint64_t *a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  unsigned __int8 v5;
  uint64_t v6;
  char v7;
  __n128 result;

  v5 = a2[1].n128_u8[0];
  v6 = *a3;
  v7 = *((_BYTE *)a3 + 8);
  *(_QWORD *)a5 = a1;
  result = *a2;
  *(__n128 *)(a5 + 8) = *a2;
  *(_BYTE *)(a5 + 24) = v5;
  *(_QWORD *)(a5 + 32) = v6;
  *(_BYTE *)(a5 + 40) = v7;
  *(_BYTE *)(a5 + 41) = a4;
  return result;
}

void IconView.body.getter()
{
  __int128 *v0;
  __int128 v1;
  __int128 v2;
  _OWORD v3[2];

  v1 = v0[1];
  v2 = *v0;
  v3[0] = v1;
  *(_OWORD *)((char *)v3 + 10) = *(__int128 *)((char *)v0 + 26);
  sub_20CE14DF0((uint64_t)&v2);
}

id sub_20CE23AC8()
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCE40]), sel_init);
  qword_254996978 = (uint64_t)result;
  return result;
}

void sub_20CE23AF8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[3];
  uint64_t v4;
  uint64_t v5;

  if (!a1)
  {
    sub_20CE29374((uint64_t)v3);
    if (v4)
    {
      v1 = v5;
      __swift_project_boxed_opaque_existential_1(v3, v4);
      v2 = sub_20CE23B9C();
      (*(void (**)(uint64_t))(v1 + 16))(v2);
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
    }
    else
    {
      sub_20CE21AE0((uint64_t)v3, &qword_254996C40);
    }
  }
}

uint64_t sub_20CE23B9C()
{
  sub_20CE67800();
  return 0;
}

void sub_20CE23BEC(void *a1)
{
  id v2;
  void *v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254996980);
  sub_20CE67554();
  v2 = a1;
  sub_20CE67560();
  sub_20CE23AF8((uint64_t)v3);

}

void AppIconView.body.getter(uint64_t a1@<X8>)
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
  char v15;
  uint64_t KeyPath;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41[2];
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  __int128 v48;
  char v49;
  _QWORD v50[16];
  char v51;
  char v52;
  char v53;
  _OWORD v54[9];

  v3 = v1;
  v46 = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA3F0);
  v5 = *(_QWORD *)(v4 - 8);
  v42 = v4;
  v43 = v5;
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v6);
  v47 = (char *)v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA3F8);
  v9 = *(_QWORD *)(v8 - 8);
  v44 = v8;
  v45 = v9;
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_38_0(v11, v41[0]);
  v54[0] = *(_OWORD *)(v1 + 96);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254996980);
  sub_20CE67554();
  v12 = v50[0];
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_44_0();
  v13 = *(_QWORD *)(v1 + 8);
  v14 = *(_QWORD *)(v1 + 16);
  v15 = *(_BYTE *)(v1 + 24);
  KeyPath = swift_getKeyPath();
  v17 = swift_getKeyPath();
  v18 = swift_getKeyPath();
  OUTLINED_FUNCTION_51_0(v18, (uint64_t)v54);
  v19 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_37_0((void *)(v19 + 16), v54);
  v53 = 0;
  v52 = 0;
  v51 = 0;
  v50[0] = v12;
  v50[1] = v2;
  v50[2] = v13;
  v50[3] = v14;
  LOBYTE(v50[4]) = v15;
  BYTE1(v50[4]) = 1;
  v50[5] = 0;
  v50[6] = KeyPath;
  LOBYTE(v50[7]) = 0;
  v50[8] = v17;
  LOBYTE(v50[9]) = 0;
  v50[10] = v18;
  LOBYTE(v50[11]) = 0;
  v50[12] = sub_20CE2A7D8;
  v50[13] = v19;
  v50[14] = 0;
  v50[15] = 0;
  OUTLINED_FUNCTION_25_0();
  v20 = OUTLINED_FUNCTION_44_0();
  *(_QWORD *)&v48 = v2;
  OUTLINED_FUNCTION_51_0(v20, (uint64_t)v54);
  v21 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_37_0((void *)(v21 + 16), v54);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA290);
  sub_20CE2D6DC((uint64_t)&unk_253CFA288);
  v24 = v23;
  v25 = sub_20CE2A894();
  v26 = MEMORY[0x24BEE50B0];
  sub_20CE67380();
  swift_release();
  memcpy(v54, v50, 0x80uLL);
  v27 = sub_20CE2A8D0((uint64_t)v54);
  *(_QWORD *)&v48 = *(_QWORD *)v3;
  v28 = (void *)v48;
  OUTLINED_FUNCTION_51_0(v27, (uint64_t)v50);
  v29 = OUTLINED_FUNCTION_7_0();
  v30 = OUTLINED_FUNCTION_32_0(v29);
  v31 = OUTLINED_FUNCTION_58_0((uint64_t)v30, &qword_253CFA470);
  v32 = v28;
  v50[0] = v22;
  v50[1] = v26;
  v50[2] = v24;
  v50[3] = v25;
  v33 = OUTLINED_FUNCTION_45_0();
  v34 = sub_20CE2A998();
  v35 = v41[1];
  v36 = v42;
  v37 = v47;
  sub_20CE67380();
  swift_release();

  v38 = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v37, v36);
  v39 = *(_BYTE *)(v3 + 24);
  v48 = *(_OWORD *)(v3 + 8);
  v49 = v39;
  OUTLINED_FUNCTION_51_0(v38, (uint64_t)v50);
  v40 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_32_0(v40);
  v50[0] = v36;
  v50[1] = v31;
  v50[2] = v33;
  v50[3] = v34;
  OUTLINED_FUNCTION_45_0();
  sub_20CE2A9EC();
  sub_20CE67380();
  swift_release();
  OUTLINED_FUNCTION_28(v35, *(uint64_t (**)(uint64_t, uint64_t))(v45 + 8));
  OUTLINED_FUNCTION_13();
}

Swift::Void __swiftcall AppIconView.reloadImage()()
{
  id *v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  id v10;
  id v11;
  char v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  uint64_t aBlock;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  void (*v29)(void *);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;

  v1 = (uint64_t)v0;
  if (qword_254996390 != -1)
    swift_once();
  v24 = (id)qword_254996978;
  v2 = objc_msgSend(*v0, sel_bundleIdentifier, *v0);
  v3 = sub_20CE67638();
  v5 = v4;

  v6 = *(_QWORD *)(v1 + 8);
  v7 = *(_QWORD *)(v1 + 16);
  v8 = *(_BYTE *)(v1 + 24);
  OUTLINED_FUNCTION_58_0(v9, &qword_254996988);
  aBlock = v6;
  v26 = v7;
  LOBYTE(v27) = v8;
  sub_20CE678B4();
  IconSize.hash(into:)();
  sub_20CE678E4();
  sub_20CE67884();
  v31 = v3;
  v32 = v5;
  swift_bridgeObjectRetain();
  sub_20CE67680();
  swift_bridgeObjectRelease();
  v10 = sub_20CE244C4();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v24, sel_objectForKey_, v10);

  if (v11)
  {
    sub_20CE23BEC(v11);
  }
  else
  {
    v12 = v8;
    v13 = v6;
    v14 = objc_msgSend(v23, sel_bundleIdentifier);
    if (!v14)
    {
      sub_20CE67638();
      v14 = (id)sub_20CE6762C();
      swift_bridgeObjectRelease();
    }
    v15 = (void *)objc_opt_self();
    v31 = v13;
    v32 = v7;
    v33 = v12;
    OUTLINED_FUNCTION_48_0();
    OUTLINED_FUNCTION_78();
    sub_20CE17D04();
    v17 = v16;
    objc_msgSend(v16, sel_size);
    v19 = v18;

    v20 = OUTLINED_FUNCTION_48_0();
    OUTLINED_FUNCTION_78();
    sub_20CE21860(v1, (uint64_t)&v31);
    v21 = OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_37_0((void *)(v21 + 16), &v31);
    v29 = sub_20CE2AA2C;
    v30 = v21;
    aBlock = MEMORY[0x24BDAC760];
    v26 = 1107296256;
    v27 = sub_20CE24470;
    v28 = &block_descriptor;
    v22 = _Block_copy(&aBlock);
    swift_release();
    objc_msgSend(v15, sel_applicationIconImageForBundleIdentifier_length_scale_completionHandler_, v14, v22, v19, v20);
    _Block_release(v22);

  }
}

void sub_20CE242D0(void *a1, id *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  if (a1 && (v3 = objc_msgSend(a1, sel_CGImage)) != 0)
  {
    v4 = v3;
    v5 = v3;
    sub_20CE23BEC(v4);
    if (qword_254996390 != -1)
      swift_once();
    v6 = (void *)qword_254996978;
    v7 = objc_msgSend(*a2, sel_bundleIdentifier);
    v8 = sub_20CE67638();
    v10 = v9;

    sub_20CE15F68(0, &qword_254996988);
    sub_20CE678B4();
    IconSize.hash(into:)();
    sub_20CE678E4();
    sub_20CE67884();
    swift_bridgeObjectRetain();
    sub_20CE67680();
    swift_bridgeObjectRelease();
    v11 = sub_20CE244C4();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setObject_forKey_, v5, v11, v8, v10);

  }
  else
  {
    sub_20CE23BEC(0);
  }
}

void sub_20CE24470(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

id sub_20CE244C4()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_20CE6762C();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithString_, v1);

  return v2;
}

uint64_t sub_20CE24538@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t KeyPath;
  uint64_t v16;
  uint64_t result;

  v3 = *(id *)v1;
  v4 = *(_QWORD *)(v1 + 8);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(unsigned __int8 *)(v1 + 24);
  v7 = objc_msgSend(*(id *)v1, sel_image);
  v8 = (uint64_t)objc_msgSend(v7, sel_CGImage);

  if (v8)
  {
    v9 = (id)v8;
    v10 = objc_msgSend(v3, sel_image);
    objc_msgSend(v10, sel_scale);
    v12 = v11;

    v13 = objc_msgSend(v3, sel_image);
    v14 = objc_msgSend(v13, sel_displayStyle);

    KeyPath = swift_getKeyPath();
    v16 = swift_getKeyPath();
    result = swift_getKeyPath();
  }
  else
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v14 = 0;
    KeyPath = 0;
    v16 = 0;
    result = 0;
    v12 = 0;
    v8 = 1;
  }
  *(_QWORD *)a1 = v8;
  *(_QWORD *)(a1 + 8) = v12;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v14;
  *(_QWORD *)(a1 + 48) = KeyPath;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = v16;
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = result;
  *(_BYTE *)(a1 + 88) = 0;
  return result;
}

void sub_20CE246A0(uint64_t a1@<X8>, double a2@<D0>)
{
  const void *v2;
  uint64_t v4;
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
  char *v18;
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  char v38;
  char v39;
  uint64_t v40;
  char v41;
  double v42;
  char v43;
  double v44;
  BOOL HasTransparentPixelAtPoint;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  char v69;
  uint64_t v70;
  char v71;
  double v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t *v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  double v90;
  double *v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t KeyPath;
  uint64_t (*v97)(void);
  char *v98;
  uint64_t *v99;
  uint64_t v100;
  _OWORD *v101;
  __int128 v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  double *v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  char *v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 __dst[6];
  __int128 v140;
  __int128 v141;
  char v142[8];
  double v143;
  char v144;
  uint64_t v145;
  double v146;
  char v147;

  v135 = a1;
  v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA2B8);
  MEMORY[0x24BDAC7A8](v109);
  v111 = (char *)&v103 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA310);
  v5 = MEMORY[0x24BDAC7A8](v134);
  v110 = (uint64_t)&v103 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v103 - v7;
  v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996AD8);
  MEMORY[0x24BDAC7A8](v132);
  v133 = (uint64_t)&v103 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v130 = sub_20CE6717C();
  v129 = *(_QWORD *)(v130 - 8);
  v10 = MEMORY[0x24BDAC7A8](v130);
  v127 = (char *)&v103 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v128 = (char *)&v103 - v12;
  v107 = sub_20CE673C8();
  v105 = *(_QWORD *)(v107 - 8);
  MEMORY[0x24BDAC7A8](v107);
  v106 = (char *)&v103 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996AB8);
  MEMORY[0x24BDAC7A8](v116);
  v120 = (char *)&v103 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v119 = sub_20CE67020();
  v118 = *(_QWORD *)(v119 - 8);
  MEMORY[0x24BDAC7A8](v119);
  v117 = (char *)&v103 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v112 = sub_20CE67494();
  v16 = *(_QWORD *)(v112 - 8);
  MEMORY[0x24BDAC7A8](v112);
  v18 = (char *)&v103 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_20CE67488();
  v114 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v113 = (char *)&v103 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996A50);
  MEMORY[0x24BDAC7A8](v115);
  v22 = (char *)&v103 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996A40);
  MEMORY[0x24BDAC7A8](v122);
  v123 = (uint64_t)&v103 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996A30);
  MEMORY[0x24BDAC7A8](v121);
  v125 = (char *)&v103 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996A20);
  v25 = MEMORY[0x24BDAC7A8](v131);
  v124 = (uint64_t)&v103 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v126 = (uint64_t)&v103 - v27;
  v28 = sub_20CE66FC0();
  v29 = MEMORY[0x24BDAC7A8](v28);
  v108 = (double *)((char *)&v103 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v29);
  v32 = (double *)((char *)&v103 - v31);
  memcpy(__dst, v2, 0x59uLL);
  v33 = *(void **)&__dst[0];
  if (!*(_QWORD *)&__dst[0] || (BYTE1(__dst[2]) & 1) == 0)
  {
    if (*((_QWORD *)&__dst[2] + 1) != 1)
      goto LABEL_4;
LABEL_9:
    sub_20CE2D1C8();
    goto LABEL_16;
  }
  v42 = 0.0;
  HasTransparentPixelAtPoint = CGImageHasTransparentPixelAtPoint(*(CGImage **)&__dst[0], 0.0, 0.0);
  if (*((_QWORD *)&__dst[2] + 1) == 1)
    goto LABEL_9;
  if (!HasTransparentPixelAtPoint)
  {
LABEL_4:
    v34 = v28;
    v35 = *(_QWORD *)&__dst[5];
    v104 = v22;
    v103 = v19;
    v36 = v18;
    v37 = v8;
    v38 = BYTE8(__dst[5]);
    sub_20CE15B98(*(uint64_t *)&__dst[5], SBYTE8(__dst[5]));
    v39 = sub_20CE29560(v35, v38);
    v40 = v35;
    v28 = v34;
    v41 = v38;
    v8 = v37;
    v18 = v36;
    v19 = v103;
    v22 = v104;
    sub_20CE158B0(v40, v41);
    v42 = 0.0;
    if ((v39 & 1) != 0)
    {
      sub_20CE196EC(&__dst[1], (uint64_t)&v141);
      sub_20CE196EC(&v141, (uint64_t)v142);
      v43 = v144;
      if ((v144 & 0xE0) == 0x60)
      {
        v144 &= 0x1Fu;
        if ((v43 & 1) != 0)
          v44 = dbl_20CE6BDA8[*(_QWORD *)&v143];
        else
          v44 = v143;
      }
      else
      {
        v44 = 0.225;
      }
      v42 = v44 * a2;
    }
  }
  v46 = v28;
  v47 = (char *)v32 + *(int *)(v28 + 20);
  v48 = *MEMORY[0x24BDEEB68];
  v49 = sub_20CE67194();
  v50 = v47;
  v28 = v46;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 104))(v50, v48, v49);
  *v32 = v42;
  v32[1] = v42;
  sub_20CE1EE3C((uint64_t)&unk_2549971C0);
LABEL_16:
  v51 = sub_20CE675A8();
  if (v33)
  {
    v111 = v33;
    sub_20CE67470();
    v52 = v114;
    v53 = v113;
    (*(void (**)(char *, _QWORD, uint64_t))(v114 + 104))(v113, *MEMORY[0x24BDF3FD0], v19);
    sub_20CE674DC();
    swift_release();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v53, v19);
    v54 = v112;
    (*(void (**)(char *, _QWORD, uint64_t))(v16 + 104))(v18, *MEMORY[0x24BDF3FF8], v112);
    v55 = v16;
    v56 = sub_20CE674A0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v18, v54);
    sub_20CE675CC();
    sub_20CE66EAC();
    v114 = v136;
    LODWORD(v113) = BYTE8(v136);
    v57 = v137;
    LODWORD(v112) = BYTE8(v137);
    v109 = *((_QWORD *)&v138 + 1);
    v110 = v138;
    v58 = *(_QWORD *)&__dst[4];
    v59 = BYTE8(__dst[4]);
    j__swift_retain();
    v60 = sub_20CE29718(v58, v59);
    j__swift_release();
    if (!v60)
    {
      v145 = sub_20CE673EC();
      v60 = sub_20CE66EB8();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA488);
    v61 = v118;
    v62 = swift_allocObject();
    *(_OWORD *)(v62 + 16) = xmmword_20CE6BDC0;
    swift_retain();
    sub_20CE67014();
    sub_20CE66FF0();
    sub_20CE66FFC();
    sub_20CE67008();
    v145 = v62;
    sub_20CE1EE3C((uint64_t)&unk_253CFA340);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA430);
    sub_20CE18AAC((uint64_t)&unk_253CFA438);
    v63 = v117;
    v64 = v119;
    sub_20CE67788();
    v65 = (uint64_t)v120;
    (*(void (**)(char *, char *, uint64_t))(v61 + 16))(&v120[*(int *)(v116 + 40)], v63, v64);
    *(_QWORD *)v65 = v51;
    *(_BYTE *)(v65 + 8) = 0;
    sub_20CE2E628(v65, (uint64_t)&v22[*(int *)(v115 + 36)], &qword_254996AB8);
    *(_QWORD *)v22 = v56;
    *((_QWORD *)v22 + 1) = 0;
    *((_WORD *)v22 + 8) = 257;
    *((_QWORD *)v22 + 3) = v114;
    v22[32] = (char)v113;
    *((_QWORD *)v22 + 5) = v57;
    v22[48] = v112;
    v66 = v109;
    *((_QWORD *)v22 + 7) = v110;
    *((_QWORD *)v22 + 8) = v66;
    *((_WORD *)v22 + 36) = 256;
    *((_QWORD *)v22 + 10) = v60;
    *((_QWORD *)v22 + 11) = v51;
    *((_WORD *)v22 + 48) = 256;
    swift_retain_n();
    swift_retain();
    swift_retain();
    sub_20CE21AE0(v65, &qword_254996AB8);
    (*(void (**)(char *, uint64_t))(v61 + 8))(v63, v64);
    swift_release();
    swift_release();
    swift_release();
    v67 = *(_QWORD *)&__dst[3];
    v68 = BYTE8(__dst[3]);
    sub_20CE15B98(*(uint64_t *)&__dst[3], SBYTE8(__dst[3]));
    v69 = sub_20CE29560(v67, v68);
    sub_20CE158B0(v67, v68);
    if ((v69 & 1) != 0)
    {
      v70 = sub_20CE673F8();
    }
    else
    {
      (*(void (**)(char *, _QWORD, uint64_t))(v105 + 104))(v106, *MEMORY[0x24BDF3C28], v107);
      v70 = sub_20CE67434();
    }
    v73 = v70;
    v74 = v123;
    sub_20CE2E628((uint64_t)v22, v123, &qword_254996A50);
    *(_QWORD *)(v74 + *(int *)(v122 + 36)) = v73;
    sub_20CE21AE0((uint64_t)v22, &qword_254996A50);
    v75 = sub_20CE675CC();
    v77 = v76;
    v78 = (uint64_t)v125;
    v79 = (uint64_t)&v125[*(int *)(v121 + 36)];
    v80 = v111;
    sub_20CE25560((uint64_t)__dst, v111, v79, a2);
    v81 = (uint64_t *)(v79 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254996AC8) + 36));
    *v81 = v75;
    v81[1] = v77;
    sub_20CE193A0(v74, v78, &qword_254996A40);
    v82 = v128;
    sub_20CE67170();
    v83 = v129;
    v84 = v130;
    (*(void (**)(char *, char *, uint64_t))(v129 + 16))(v127, v82, v130);
    sub_20CE1EE3C((uint64_t)&unk_253CFA350);
    v85 = sub_20CE66EC4();
    v86 = v124;
    sub_20CE2E628(v78, v124, &qword_254996A30);
    *(_QWORD *)(v86 + *(int *)(v131 + 36)) = v85;
    (*(void (**)(char *, uint64_t))(v83 + 8))(v82, v84);
    sub_20CE21AE0(v78, &qword_254996A30);
    v87 = &qword_254996A20;
    v88 = v126;
    sub_20CE193A0(v86, v126, &qword_254996A20);
    sub_20CE2E628(v88, v133, &qword_254996A20);
    swift_storeEnumTagMultiPayload();
    sub_20CE2CD20();
    sub_20CE2D0DC();
    sub_20CE67200();

    swift_release();
    v89 = v88;
  }
  else
  {
    sub_20CE196EC(&__dst[1], (uint64_t)&v140);
    sub_20CE196EC(&v140, (uint64_t)&v145);
    v71 = v147;
    if ((v147 & 0xE0) == 0x60)
    {
      v147 &= 0x1Fu;
      if ((v71 & 1) != 0)
        v72 = dbl_20CE6BDA8[*(_QWORD *)&v146];
      else
        v72 = v146;
    }
    else
    {
      v72 = 0.225;
    }
    v90 = v72 * a2;
    v91 = v108;
    v92 = (char *)v108 + *(int *)(v28 + 20);
    v93 = *MEMORY[0x24BDEEB68];
    v94 = sub_20CE67194();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v94 - 8) + 104))(v92, v93, v94);
    *v91 = v90;
    v91[1] = v90;
    sub_20CE67410();
    v95 = sub_20CE67404();
    swift_release();
    KeyPath = swift_getKeyPath();
    v97 = MEMORY[0x24BDED998];
    v98 = v111;
    sub_20CE2D24C((uint64_t)v91, (uint64_t)v111, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
    v99 = (uint64_t *)&v98[*(int *)(v109 + 36)];
    *v99 = KeyPath;
    v99[1] = v95;
    sub_20CE21374((uint64_t)v91, (uint64_t (*)(_QWORD))v97);
    sub_20CE675CC();
    sub_20CE66EAC();
    v100 = v110;
    sub_20CE2E628((uint64_t)v98, v110, &qword_253CFA2B8);
    v101 = (_OWORD *)(v100 + *(int *)(v134 + 36));
    v102 = v137;
    *v101 = v136;
    v101[1] = v102;
    v101[2] = v138;
    sub_20CE21AE0((uint64_t)v98, &qword_253CFA2B8);
    v87 = &qword_253CFA310;
    sub_20CE193A0(v100, (uint64_t)v8, &qword_253CFA310);
    sub_20CE2E628((uint64_t)v8, v133, &qword_253CFA310);
    swift_storeEnumTagMultiPayload();
    sub_20CE2CD20();
    sub_20CE2D0DC();
    sub_20CE67200();
    swift_release();
    v89 = (uint64_t)v8;
  }
  sub_20CE21AE0(v89, v87);
}

void sub_20CE25560(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v7;
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int *v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char v19;
  double v20;
  double v21;
  double v22;
  id v23;
  double v24;
  double v25;
  uint64_t *v26;
  char *v27;
  char *v28;
  char v29;
  double v30;
  char *v31;
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
  uint64_t (*v42)(void);
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  __int128 v47;
  char v48[8];
  double v49;
  char v50;
  char v51[8];
  double v52;
  char v53;

  v45 = a3;
  v7 = sub_20CE66FC0();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (double *)((char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996AE0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (int *)type metadata accessor for BlendedBorderView();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (double *)((char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996AE8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CE196EC((__int128 *)(a1 + 16), (uint64_t)&v47);
  sub_20CE196EC(&v47, (uint64_t)v51);
  v19 = v53;
  v20 = 0.225;
  v21 = 0.225;
  if ((v53 & 0xE0) == 0x60)
  {
    v53 &= 0x1Fu;
    if ((v19 & 1) != 0)
      v21 = dbl_20CE6BDA8[*(_QWORD *)&v52];
    else
      v21 = v52;
  }
  v22 = v21 * a4;
  v46 = 0;
  v23 = a2;
  sub_20CE67548();
  v24 = v49;
  *((_BYTE *)v15 + 16) = v48[0];
  v15[3] = v24;
  v46 = 0;
  sub_20CE67548();
  v25 = v49;
  *((_BYTE *)v15 + 32) = v48[0];
  v15[5] = v25;
  v26 = (uint64_t *)((char *)v15 + v13[8]);
  *v26 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
  swift_storeEnumTagMultiPayload();
  v27 = (char *)v15 + v13[9];
  *(_QWORD *)v27 = swift_getKeyPath();
  v27[8] = 0;
  v28 = (char *)v15 + v13[10];
  *(_QWORD *)v28 = swift_getKeyPath();
  v28[8] = 0;
  *v15 = v22;
  *((_QWORD *)v15 + 1) = v23;
  sub_20CE196EC(&v47, (uint64_t)v48);
  v29 = v50;
  if ((v50 & 0xE0) == 0x60)
  {
    v50 &= 0x1Fu;
    if ((v29 & 1) != 0)
      v20 = dbl_20CE6BDA8[*(_QWORD *)&v49];
    else
      v20 = v49;
  }
  v30 = v20 * a4 + 0.05;
  v31 = (char *)v9 + *(int *)(v7 + 20);
  v32 = *MEMORY[0x24BDEEB68];
  v33 = sub_20CE67194();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 104))(v31, v32, v33);
  *v9 = v30;
  v9[1] = v30;
  LOBYTE(v31) = sub_20CE67230();
  sub_20CE66E1C();
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v42 = MEMORY[0x24BDED998];
  sub_20CE2D24C((uint64_t)v9, (uint64_t)v12, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  v43 = &v12[*(int *)(v10 + 36)];
  *v43 = (char)v31;
  *((_QWORD *)v43 + 1) = v35;
  *((_QWORD *)v43 + 2) = v37;
  *((_QWORD *)v43 + 3) = v39;
  *((_QWORD *)v43 + 4) = v41;
  v43[40] = 0;
  sub_20CE21374((uint64_t)v9, (uint64_t (*)(_QWORD))v42);
  sub_20CE2E628((uint64_t)v12, (uint64_t)&v18[*(int *)(v16 + 36)], &qword_254996AE0);
  sub_20CE2D24C((uint64_t)v15, (uint64_t)v18, (uint64_t (*)(_QWORD))type metadata accessor for BlendedBorderView);
  sub_20CE21AE0((uint64_t)v12, &qword_254996AE0);
  sub_20CE21374((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for BlendedBorderView);
  sub_20CE193A0((uint64_t)v18, v45, &qword_254996AE8);
}

void sub_20CE25918(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  char v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  unsigned int v20;
  id v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  CGImage *v26;
  int64_t Height;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  _OWORD *v42;
  __int128 v43;
  uint64_t v44;
  _OWORD *v45;
  __int128 v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  char *v50;
  unsigned int v51;
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
  int v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  char v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;

  v60 = a1;
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549969D8);
  MEMORY[0x24BDAC7A8](v61);
  v53 = (uint64_t)&v47 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549969E0);
  MEMORY[0x24BDAC7A8](v58);
  v59 = (uint64_t)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549969E8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549969F0);
  MEMORY[0x24BDAC7A8](v55);
  v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549969F8);
  MEMORY[0x24BDAC7A8](v56);
  v57 = (uint64_t)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void **)v1;
  v11 = *(_QWORD *)(v1 + 8);
  v12 = *(_QWORD *)(v1 + 16);
  v13 = *(_QWORD *)(v1 + 24);
  v14 = *(unsigned __int8 *)(v1 + 32);
  v67 = *(unsigned __int8 *)(v1 + 33);
  v54 = *(_QWORD *)(v1 + 40);
  v66 = *(_QWORD *)(v1 + 48);
  v15 = *(_BYTE *)(v1 + 56);
  v65 = *(_QWORD *)(v1 + 64);
  v64 = *(unsigned __int8 *)(v1 + 72);
  v63 = *(_QWORD *)(v1 + 80);
  v62 = *(unsigned __int8 *)(v1 + 88);
  *(_QWORD *)&v68 = v12;
  *((_QWORD *)&v68 + 1) = v13;
  LOBYTE(v69) = v14;
  sub_20CE17D04();
  v17 = v16;
  objc_msgSend(v16, sel_size);
  v19 = v18;

  v20 = v14 >> 5;
  if (v10 && v67)
  {
    v21 = v10;
    v52 = v13;
    v22 = v15;
    v23 = v66;
    sub_20CE15B98(v66, v22);
    v51 = v14 >> 5;
    v50 = v6;
    j__swift_retain();
    v49 = v12;
    v24 = v63;
    v48 = v10;
    v25 = v62;
    sub_20CE15B98(v63, v62);
    v26 = (CGImage *)v21;
    Height = CGImageGetHeight(v26);
    CGImageHasTransparentPixelAtPoint(v26, 0.0, (double)(Height / 2));

    v28 = v23;
    v15 = v22;
    v13 = v52;
    sub_20CE158B0(v28, v15);
    v20 = v51;
    v6 = v50;
    j__swift_release();
    v29 = v24;
    v12 = v49;
    v30 = v25;
    v10 = v48;
    sub_20CE158B0(v29, v30);
  }
  *(_QWORD *)&v68 = v10;
  *((_QWORD *)&v68 + 1) = v11;
  *(_QWORD *)&v69 = v12;
  *((_QWORD *)&v69 + 1) = v13;
  LOBYTE(v70) = v14;
  BYTE1(v70) = v67;
  *((_QWORD *)&v70 + 1) = v54;
  v71 = v66;
  v72 = v15;
  v73 = v65;
  v74 = v64;
  v75 = v63;
  v76 = v62;
  sub_20CE246A0((uint64_t)v6, v19);
  v31 = sub_20CE67230();
  sub_20CE66E1C();
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  sub_20CE2E628((uint64_t)v6, (uint64_t)v8, &qword_2549969E8);
  v40 = &v8[*(int *)(v55 + 36)];
  *v40 = v31;
  *((_QWORD *)v40 + 1) = v33;
  *((_QWORD *)v40 + 2) = v35;
  *((_QWORD *)v40 + 3) = v37;
  *((_QWORD *)v40 + 4) = v39;
  v40[40] = 0;
  sub_20CE21AE0((uint64_t)v6, &qword_2549969E8);
  sub_20CE675CC();
  sub_20CE66EAC();
  v41 = v57;
  sub_20CE2E628((uint64_t)v8, v57, &qword_2549969F0);
  v42 = (_OWORD *)(v41 + *(int *)(v56 + 36));
  v43 = v78;
  *v42 = v77;
  v42[1] = v43;
  v42[2] = v79;
  sub_20CE21AE0((uint64_t)v8, &qword_2549969F0);
  if (v20 == 2)
  {
    sub_20CE2E628(v41, v59, &qword_2549969F8);
    swift_storeEnumTagMultiPayload();
    sub_20CE2CC70();
    sub_20CE2D19C();
    sub_20CE67200();
  }
  else
  {
    sub_20CE675CC();
    sub_20CE66EAC();
    v44 = v53;
    sub_20CE2E628(v41, v53, &qword_2549969F8);
    v45 = (_OWORD *)(v44 + *(int *)(v61 + 36));
    v46 = v69;
    *v45 = v68;
    v45[1] = v46;
    v45[2] = v70;
    sub_20CE2E628(v44, v59, &qword_2549969D8);
    swift_storeEnumTagMultiPayload();
    sub_20CE2CC70();
    sub_20CE2D19C();
    sub_20CE67200();
    sub_20CE21AE0(v44, &qword_2549969D8);
  }
  sub_20CE21AE0(v41, &qword_2549969F8);
}

uint64_t sub_20CE25FD0(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  char v3;
  int v4;
  double v5;
  double v6;
  unsigned __int8 v7;
  int v8;
  int v9;
  double v10;
  double v11;
  unsigned __int8 v12;
  BOOL v13;
  int v14;
  char v15;
  char v16;
  uint64_t result;
  __int128 v19;
  __int128 v20;
  char v21;

  v2 = *(_OWORD *)(a1 + 16);
  v3 = *(_BYTE *)(a1 + 32);
  v4 = *(unsigned __int8 *)(a1 + 33);
  v5 = *(double *)(a1 + 40);
  v6 = *(double *)(a1 + 48);
  v7 = *(_BYTE *)(a1 + 56);
  v8 = *(unsigned __int8 *)(a1 + 57);
  v9 = *(unsigned __int8 *)(a2 + 33);
  v10 = *(double *)(a2 + 40);
  v11 = *(double *)(a2 + 48);
  v12 = *(_BYTE *)(a2 + 56);
  v13 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  v14 = *(unsigned __int8 *)(a2 + 57);
  if (v13 || (v19 = *(_OWORD *)(a1 + 16), v15 = sub_20CE67890(), v2 = v19, v16 = v15, result = 0, (v16 & 1) != 0))
  {
    v20 = v2;
    v21 = v3;
    if ((static IconSize.== infix(_:_:)((uint64_t)&v20) & 1) == 0 || ((v4 ^ v9) & 1) != 0)
    {
      return 0;
    }
    else
    {
      result = 0;
      if (v5 == v10 && v6 == v11)
      {
        if (((v7 ^ v12) & 1) != 0)
          return 0;
        else
          return v8 ^ v14 ^ 1u;
      }
    }
  }
  return result;
}

uint64_t sub_20CE260D8()
{
  sub_20CE678B4();
  sub_20CE13438();
  return sub_20CE678E4();
}

uint64_t sub_20CE26158()
{
  sub_20CE678B4();
  sub_20CE13438();
  return sub_20CE678E4();
}

id sub_20CE261D0(double a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v8;
  id v9;

  v8 = (void *)sub_20CE6762C();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_glyphNamed_pointSize_symbolSize_scaleFactor_, v8, a5, a1, a2);

  return v9;
}

uint64_t sub_20CE26250()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

void RoundedBackgroundIconView.init(size:background:iconView:)()
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
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;

  OUTLINED_FUNCTION_46_0();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = *v12;
  v14 = v12[1];
  v15 = *((_BYTE *)v12 + 16);
  *(_QWORD *)(v10 + 48) = swift_getKeyPath();
  *(_BYTE *)(v11 + 56) = 0;
  *(_QWORD *)(v11 + 64) = swift_getKeyPath();
  *(_BYTE *)(v11 + 72) = 0;
  v17 = (uint64_t *)(v11 + *(int *)(type metadata accessor for RoundedBackgroundIconView(0, v3, v1, v16) + 52));
  *v17 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254996990);
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)v11 = v13;
  *(_QWORD *)(v11 + 8) = v14;
  *(_BYTE *)(v11 + 16) = v15;
  *(_QWORD *)(v11 + 24) = v9;
  *(_QWORD *)(v11 + 32) = v7;
  *(_QWORD *)(v11 + 40) = v5;
  OUTLINED_FUNCTION_15();
}

void sub_20CE2632C()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_89();
  *v0 = v1;
  OUTLINED_FUNCTION_4();
}

void sub_20CE26348()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_89();
  *v0 = v1;
  OUTLINED_FUNCTION_4();
}

void sub_20CE26364()
{
  OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_4();
}

void sub_20CE2637C()
{
  OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_4();
}

uint64_t EnvironmentValues.symbolIconFontWeight.getter()
{
  uint64_t v1;

  sub_20CE12980();
  sub_20CE67158();
  return v1;
}

void sub_20CE263D0()
{
  EnvironmentValues.symbolIconFontWeight.setter();
  OUTLINED_FUNCTION_4();
}

uint64_t EnvironmentValues.symbolIconFontWeight.setter()
{
  sub_20CE12980();
  return sub_20CE67164();
}

uint64_t sub_20CE26438()
{
  sub_20CE1981C((uint64_t)&unk_254996AF8);
  return sub_20CE66F18();
}

void (*EnvironmentValues.symbolIconFontWeight.modify(_QWORD *a1))(_QWORD **a1)
{
  uint64_t v1;
  _QWORD *v3;
  char v4;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = v1;
  v3[5] = sub_20CE12980();
  sub_20CE67158();
  v4 = *((_BYTE *)v3 + 24);
  *v3 = v3[2];
  *((_BYTE *)v3 + 8) = v4;
  return sub_20CE26520;
}

void sub_20CE26520(_QWORD **a1)
{
  _BYTE *v1;
  char v2;

  v2 = *((_BYTE *)*a1 + 8);
  v1 = *a1;
  *((_QWORD *)v1 + 2) = **a1;
  v1[24] = v2;
  sub_20CE67164();
  free(v1);
}

uint64_t sub_20CE26568@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v9;
  id v10;
  _OWORD *v11;
  __int128 v12;
  uint64_t *v13;
  __int128 v15;
  __int128 v16;
  uint64_t v17[5];
  __int128 v18;
  uint64_t v19[2];
  uint64_t v20;
  char v21;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996B10);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v15 - v7;
  v9 = v1[1];
  v15 = *v1;
  v16 = v9;
  *(_OWORD *)v17 = v1[2];
  *(_OWORD *)((char *)&v17[1] + 1) = *(__int128 *)((char *)v1 + 41);
  sub_20CE19388(v17, (uint64_t)v19);
  sub_20CE19388(v19, (uint64_t)&v20);
  if (v20 && (v20 == 1 || v21 != 1))
    v10 = 0;
  else
    v10 = objc_msgSend((id)v15, sel_background);
  sub_20CE196EC((__int128 *)((char *)&v15 + 8), (uint64_t)&v18);
  v11 = (_OWORD *)swift_allocObject();
  v12 = v16;
  v11[1] = v15;
  v11[2] = v12;
  v11[3] = *(_OWORD *)v17;
  *(_OWORD *)((char *)v11 + 57) = *(_OWORD *)((char *)&v17[1] + 1);
  *((_QWORD *)v5 + 6) = swift_getKeyPath();
  v5[56] = 0;
  *((_QWORD *)v5 + 8) = swift_getKeyPath();
  v5[72] = 0;
  v13 = (uint64_t *)&v5[*(int *)(v3 + 52)];
  *v13 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254996990);
  swift_storeEnumTagMultiPayload();
  sub_20CE196EC(&v18, (uint64_t)v5);
  *((_QWORD *)v5 + 3) = v10;
  *((_QWORD *)v5 + 4) = sub_20CE2D34C;
  *((_QWORD *)v5 + 5) = v11;
  sub_20CE193A0((uint64_t)v5, (uint64_t)v8, &qword_254996B10);
  sub_20CE193A0((uint64_t)v8, a1, &qword_254996B10);
  return sub_20CE2D354((uint64_t)&v15);
}

void sub_20CE26750(uint64_t a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  double v8;
  double v9;
  unsigned __int16 v10;
  id v11;
  id v12;
  uint64_t v13;
  char v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  id v24[2];
  void *v25;
  uint64_t v26;
  char v27;
  _BYTE v28[24];

  sub_20CE19388((uint64_t *)(a1 + 32), (uint64_t)v24);
  sub_20CE19388((uint64_t *)v24, (uint64_t)&v26);
  v8 = 0.75;
  if (v26 && (v26 == 1 || (v27 & 1) == 0))
    v8 = 1.0;
  sub_20CE196EC((__int128 *)(a1 + 8), (uint64_t)&v23);
  sub_20CE196EC(&v23, (uint64_t)v28);
  if ((v28[16] & 0xE0) == 0x40)
    v9 = *MEMORY[0x24BEC1CE0];
  else
    v9 = v8 * a3;
  v10 = (unsigned __int16)objc_msgSend(*(id *)a1, sel_glyph);
  v11 = objc_allocWithZone(MEMORY[0x24BEC1680]);
  v12 = sub_20CE29C90(9, v10, 0, 0xF000000000000000);
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(_BYTE *)(a1 + 56);
  sub_20CE15B98(v13, v14);
  v15 = sub_20CE17F3C(v13, v14);
  sub_20CE158B0(v13, v14);
  sub_20CE19388((uint64_t *)v24, (uint64_t)&v25);
  v16 = v25;
  if (v25 == (void *)1)
  {
    v19 = objc_allocWithZone(MEMORY[0x24BEC1398]);
    sub_20CE2D354(a1);
    v18 = objc_msgSend(v19, sel_initWithSystemColor_, 1);
    goto LABEL_12;
  }
  if (!v25)
  {
    v17 = (void *)objc_opt_self();
    sub_20CE2D354(a1);
    v18 = objc_msgSend(v17, sel_whiteColor);
LABEL_12:
    v16 = v18;
    goto LABEL_14;
  }
  sub_20CE2D354(a1);
LABEL_14:
  v20 = (void *)objc_opt_self();
  sub_20CE18E38(v24);
  sub_20CE2D3B4(a1);
  v21 = objc_msgSend(v20, sel_imageWithIcon_size_scale_padding_glyphColor_background_, v12, v16, 0, v9, v8 * a4, v15, 0.0, 0.0);

  if (v21)
  {
    v22 = WFImage.image.getter();

  }
  else
  {
    v22 = 0;
  }
  *a2 = v22;
}

uint64_t sub_20CE26994()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_BYTE *)(v0 + 72);
  sub_20CE15B98(v1, v2);
  v3 = sub_20CE29560(v1, v2);
  sub_20CE158B0(v1, v2);
  return v3 & 1;
}

double sub_20CE269EC(double a1)
{
  uint64_t v1;

  sub_20CE17EA4(v1, a1);
  return a1;
}

void sub_20CE26A30(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>, double a7@<D1>)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t *v28;
  double v29;
  double v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;

  v36 = a3;
  v37 = a4;
  v34 = a5;
  v35 = a2;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996BA8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996C18);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_20CE66FC0();
  MEMORY[0x24BDAC7A8](v16);
  v18 = (double *)((char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996B48);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v34 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v34 - v23;
  type metadata accessor for RoundedBackgroundIconView(0, v36, v37, v25);
  if ((sub_20CE26994() & 1) != 0)
  {
    v37 = v19;
    if ((*(_BYTE *)(a1 + 16) & 0xE0) == 0x60)
    {
      if ((*(_BYTE *)(a1 + 16) & 1) != 0)
        v26 = dbl_20CE6BDA8[*(_QWORD *)(a1 + 8)];
      else
        v26 = *(double *)(a1 + 8);
    }
    else
    {
      v26 = 0.225;
    }
    v29 = v26 * a6;
    v30 = v26 * a7;
    v31 = (char *)v18 + *(int *)(v16 + 20);
    v32 = *MEMORY[0x24BDEEB68];
    v33 = sub_20CE67194();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 104))(v31, v32, v33);
    *v18 = v29;
    v18[1] = v30;
    sub_20CE26D20(v35, (uint64_t)v22);
    sub_20CE21374((uint64_t)v18, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
    sub_20CE193A0((uint64_t)v22, (uint64_t)v24, &qword_254996B48);
    sub_20CE2E628((uint64_t)v24, (uint64_t)v15, &qword_254996B48);
    swift_storeEnumTagMultiPayload();
    sub_20CE2D448();
    sub_20CE2D614();
    sub_20CE67200();
    v27 = (uint64_t)v24;
    v28 = &qword_254996B48;
  }
  else
  {
    sub_20CE2737C(v35, (uint64_t)v12);
    sub_20CE2E628((uint64_t)v12, (uint64_t)v15, &qword_254996BA8);
    swift_storeEnumTagMultiPayload();
    sub_20CE2D448();
    sub_20CE2D614();
    sub_20CE67200();
    v27 = (uint64_t)v12;
    v28 = &qword_254996BA8;
  }
  sub_20CE21AE0(v27, v28);
}

void sub_20CE26D20(void *a1@<X0>, uint64_t a2@<X8>)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t (*v37)(void);
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v49 = a2;
  v45 = sub_20CE66FC0();
  MEMORY[0x24BDAC7A8](v45);
  v38 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996850);
  MEMORY[0x24BDAC7A8](v40);
  v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996C20);
  MEMORY[0x24BDAC7A8](v46);
  v47 = (uint64_t)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996C28);
  MEMORY[0x24BDAC7A8](v41);
  v42 = (uint64_t)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996B58);
  MEMORY[0x24BDAC7A8](v48);
  v44 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_20CE675F0();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549971A0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (uint64_t *)((char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996B68);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v39 = (uint64_t)&v38 - v20;
  objc_opt_self();
  v21 = swift_dynamicCastObjCClass();
  if (v21)
  {
    v22 = (void *)v21;
    v38 = a1;
    v23 = objc_msgSend(v22, sel_color);
    v24 = MEMORY[0x212B96C94](objc_msgSend(v23, sel_platformColor));

    WFIconColorBackgroundBlendMode.blendMode.getter((uint64_t)objc_msgSend(v22, sel_blendMode), (uint64_t)v12);
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))((char *)v15 + *(int *)(v13 + 36), v12, v9);
    *v15 = v24;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    sub_20CE2D24C(v43, (uint64_t)v19, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
    sub_20CE2E628((uint64_t)v15, (uint64_t)&v19[*(int *)(v16 + 52)], (uint64_t *)&unk_2549971A0);
    *(_WORD *)&v19[*(int *)(v16 + 56)] = 256;
    sub_20CE21AE0((uint64_t)v15, (uint64_t *)&unk_2549971A0);
    v25 = v39;
    sub_20CE193A0((uint64_t)v19, v39, &qword_254996B68);
    sub_20CE2E628(v25, v42, &qword_254996B68);
    swift_storeEnumTagMultiPayload();
    sub_20CE18AAC((uint64_t)&unk_254996B60);
    sub_20CE2D6DC((uint64_t)&unk_254996B70);
    v26 = (uint64_t)v44;
    sub_20CE67200();
    sub_20CE2E628(v26, v47, &qword_254996B58);
    swift_storeEnumTagMultiPayload();
    sub_20CE2D4CC();
    sub_20CE1EE3C((uint64_t)&unk_253CFA338);
    sub_20CE67200();

    sub_20CE21AE0(v26, &qword_254996B58);
    v27 = v25;
    v28 = &qword_254996B68;
  }
  else
  {
    v29 = (uint64_t)v38;
    v39 = v16;
    v30 = v42;
    v32 = v43;
    v31 = (uint64_t)v44;
    v33 = v47;
    objc_opt_self();
    v34 = swift_dynamicCastObjCClass();
    if (!v34)
    {
      v37 = MEMORY[0x24BDED998];
      sub_20CE2D24C(v32, v29, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
      sub_20CE2D24C(v29, v33, (uint64_t (*)(_QWORD))v37);
      swift_storeEnumTagMultiPayload();
      sub_20CE2D4CC();
      sub_20CE1EE3C((uint64_t)&unk_253CFA338);
      sub_20CE67200();
      sub_20CE21374(v29, (uint64_t (*)(_QWORD))v37);
      return;
    }
    v35 = (void *)v34;
    v38 = a1;
    v36 = objc_msgSend(v35, sel_gradient);
    sub_20CE1AC1C(v36, (uint64_t)v5);

    sub_20CE2E628((uint64_t)v5, v30, &qword_254996850);
    swift_storeEnumTagMultiPayload();
    sub_20CE18AAC((uint64_t)&unk_254996B60);
    sub_20CE2D6DC((uint64_t)&unk_254996B70);
    sub_20CE67200();
    sub_20CE2E628(v31, v33, &qword_254996B58);
    swift_storeEnumTagMultiPayload();
    sub_20CE2D4CC();
    sub_20CE1EE3C((uint64_t)&unk_253CFA338);
    sub_20CE67200();

    sub_20CE21AE0(v31, &qword_254996B58);
    v27 = (uint64_t)v5;
    v28 = &qword_254996850;
  }
  sub_20CE21AE0(v27, v28);
}

void sub_20CE2737C(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v40 = a2;
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996BD8);
  MEMORY[0x24BDAC7A8](v36);
  v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996C30);
  MEMORY[0x24BDAC7A8](v42);
  v43 = (uint64_t)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996C38);
  MEMORY[0x24BDAC7A8](v37);
  v38 = (uint64_t)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996BB8);
  MEMORY[0x24BDAC7A8](v41);
  v39 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_20CE675F0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549971A0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (uint64_t *)((char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996BC8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v35 = (char *)&v34 - v19;
  objc_opt_self();
  v20 = swift_dynamicCastObjCClass();
  if (v20)
  {
    v21 = (void *)v20;
    v34 = a1;
    v22 = objc_msgSend(v21, sel_color);
    v23 = MEMORY[0x212B96C94](objc_msgSend(v22, sel_platformColor));

    WFIconColorBackgroundBlendMode.blendMode.getter((uint64_t)objc_msgSend(v21, sel_blendMode), (uint64_t)v11);
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)v14 + *(int *)(v12 + 36), v11, v8);
    *v14 = v23;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    sub_20CE2E628((uint64_t)v14, (uint64_t)v18, (uint64_t *)&unk_2549971A0);
    *(_WORD *)&v18[*(int *)(v15 + 56)] = 256;
    sub_20CE21AE0((uint64_t)v14, (uint64_t *)&unk_2549971A0);
    v24 = &qword_254996BC8;
    v25 = (uint64_t)v35;
    sub_20CE193A0((uint64_t)v18, (uint64_t)v35, &qword_254996BC8);
    sub_20CE2E628(v25, v38, &qword_254996BC8);
    swift_storeEnumTagMultiPayload();
    sub_20CE18AAC((uint64_t)&unk_254996BC0);
    sub_20CE2D6DC((uint64_t)&unk_254996BD0);
    v26 = (uint64_t)v39;
    sub_20CE67200();
    sub_20CE2E628(v26, v43, &qword_254996BB8);
    swift_storeEnumTagMultiPayload();
    sub_20CE2D638();
    sub_20CE2D824();
    sub_20CE67200();

    sub_20CE21AE0(v26, &qword_254996BB8);
    v27 = v25;
  }
  else
  {
    v28 = v38;
    v29 = v43;
    v30 = (uint64_t)v39;
    objc_opt_self();
    v31 = swift_dynamicCastObjCClass();
    if (!v31)
    {
      swift_storeEnumTagMultiPayload();
      sub_20CE2D638();
      sub_20CE2D824();
      sub_20CE67200();
      return;
    }
    v32 = (void *)v31;
    v35 = a1;
    v33 = objc_msgSend(v32, sel_gradient);
    sub_20CE1B250(v33, (uint64_t)v4);

    v24 = &qword_254996BD8;
    sub_20CE2E628((uint64_t)v4, v28, &qword_254996BD8);
    swift_storeEnumTagMultiPayload();
    sub_20CE18AAC((uint64_t)&unk_254996BC0);
    sub_20CE2D6DC((uint64_t)&unk_254996BD0);
    sub_20CE67200();
    sub_20CE2E628(v30, v29, &qword_254996BB8);
    swift_storeEnumTagMultiPayload();
    sub_20CE2D638();
    sub_20CE2D824();
    sub_20CE67200();

    sub_20CE21AE0(v30, &qword_254996BB8);
    v27 = (uint64_t)v4;
  }
  sub_20CE21AE0(v27, v24);
}

void sub_20CE27908()
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  OUTLINED_FUNCTION_46_0();
  v27 = v2;
  v3 = OUTLINED_FUNCTION_18_0();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v23 = OUTLINED_FUNCTION_57_0();
  v25 = *(_QWORD *)(v23 - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_38();
  v9 = v8 - v7;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA408);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_38();
  v13 = v12 - v11;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996C68);
  v24 = *(_QWORD *)(v26 - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_55_0();
  sub_20CE27B68(v0, v13);
  v21 = v0;
  OUTLINED_FUNCTION_60_0();
  sub_20CE1666C();
  sub_20CE2D24C(v0, (uint64_t)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for BlendedBorderView);
  v15 = OUTLINED_FUNCTION_64_0();
  OUTLINED_FUNCTION_59_0(v15);
  sub_20CE1981C((uint64_t)&unk_253CFA400);
  sub_20CE1EE3C((uint64_t)&unk_253CFA228);
  sub_20CE6738C();
  swift_release();
  OUTLINED_FUNCTION_28(v9, *(uint64_t (**)(uint64_t, uint64_t))(v25 + 8));
  sub_20CE21AE0(v13, &qword_253CFA408);
  sub_20CE2D24C(v21, (uint64_t)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for BlendedBorderView);
  v16 = OUTLINED_FUNCTION_64_0();
  OUTLINED_FUNCTION_59_0(v16);
  v17 = v24;
  v18 = v27;
  OUTLINED_FUNCTION_79(v27, v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v24 + 16));
  v19 = (_QWORD *)(v18 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254996C70) + 36));
  *v19 = sub_20CE2E26C;
  v19[1] = v4;
  v19[2] = 0;
  v19[3] = 0;
  OUTLINED_FUNCTION_28(v1, *(uint64_t (**)(uint64_t, uint64_t))(v17 + 8));
  OUTLINED_FUNCTION_15();
}

uint64_t sub_20CE27B68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  _QWORD *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(void);
  uint64_t v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t);
  unsigned int *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  char *v70;
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char v85;
  _OWORD v86[2];
  uint64_t v87;

  v84 = a2;
  v74 = sub_20CE66E4C();
  v79 = *(_QWORD *)(v74 - 8);
  MEMORY[0x24BDAC7A8](v74);
  v78 = (char *)&v66 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v77 = (char *)&v66 - v5;
  v6 = sub_20CE675F0();
  v81 = *(_QWORD *)(v6 - 8);
  v82 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v80 = (char *)&v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA220);
  MEMORY[0x24BDAC7A8](v75);
  v76 = (uint64_t)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = sub_20CE66FC0();
  MEMORY[0x24BDAC7A8](v73);
  v10 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA3A0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA2C8);
  MEMORY[0x24BDAC7A8](v83);
  v15 = (char *)&v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v66 - v17;
  v19 = type metadata accessor for BlendedBorderView();
  v20 = a1;
  v21 = a1 + *(int *)(v19 + 36);
  v22 = *(_QWORD *)v21;
  v23 = *(_BYTE *)(v21 + 8);
  sub_20CE15B98(*(_QWORD *)v21, v23);
  sub_20CE298D8(v22, v23, v86);
  sub_20CE158B0(v22, v23);
  v24 = v86[0];
  if (LOBYTE(v86[0]) == 2)
    goto LABEL_8;
  v67 = v19;
  v68 = v11;
  v69 = v10;
  v70 = v18;
  v71 = v15;
  v72 = v13;
  v25 = v20;
  v26 = *(_BYTE *)(v20 + 32);
  v27 = *(_QWORD *)(v20 + 40);
  LOBYTE(v86[0]) = v26;
  *((_QWORD *)&v86[0] + 1) = v27;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA428);
  sub_20CE67554();
  if ((v24 & 1) != 0 && (v85 & 1) != 0)
    goto LABEL_8;
  v28 = *(_QWORD *)(v25 + 24);
  LOBYTE(v86[0]) = *(_BYTE *)(v25 + 16);
  *((_QWORD *)&v86[0] + 1) = v28;
  sub_20CE67554();
  if (v85 != 1)
  {
LABEL_8:
    v64 = 1;
    v59 = v83;
    v63 = v84;
  }
  else
  {
    sub_20CE281F4(v25);
    LOBYTE(v86[0]) = v26;
    *((_QWORD *)&v86[0] + 1) = v27;
    sub_20CE67554();
    v29 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
    objc_msgSend(v29, sel_scale);

    v30 = *(_QWORD *)v25;
    v31 = v69;
    v32 = (char *)v69 + *(int *)(v73 + 20);
    v33 = *MEMORY[0x24BDEEB68];
    v34 = sub_20CE67194();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 104))(v32, v33, v34);
    *v31 = v30;
    v31[1] = v30;
    v35 = v25 + *(int *)(v67 + 40);
    v36 = *(_QWORD *)v35;
    LOBYTE(v33) = *(_BYTE *)(v35 + 8);
    sub_20CE15B98(*(_QWORD *)v35, v33);
    sub_20CE29560(v36, v33);
    sub_20CE158B0(v36, v33);
    v37 = sub_20CE67404();
    sub_20CE66E64();
    v38 = MEMORY[0x24BDED998];
    v39 = (uint64_t)v72;
    sub_20CE2D24C((uint64_t)v31, (uint64_t)v72, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
    v40 = *(double *)v86 * 0.5;
    v41 = v76;
    sub_20CE2D24C((uint64_t)v31, v76, (uint64_t (*)(_QWORD))v38);
    *(double *)(v41 + *(int *)(sub_20CE66FB4() + 20)) = v40;
    v42 = v41 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253CFA278) + 36);
    v43 = v86[1];
    *(_OWORD *)v42 = v86[0];
    *(_OWORD *)(v42 + 16) = v43;
    *(_QWORD *)(v42 + 32) = v87;
    v44 = v75;
    *(_QWORD *)(v41 + *(int *)(v75 + 52)) = v37;
    *(_WORD *)(v41 + *(int *)(v44 + 56)) = 256;
    v45 = sub_20CE675CC();
    v47 = v46;
    v48 = v39 + *(int *)(v68 + 68);
    v49 = (uint64_t *)(v48 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253CFA2A8) + 36));
    *v49 = v45;
    v49[1] = v47;
    sub_20CE193A0(v41, v48, &qword_253CFA220);
    sub_20CE21374((uint64_t)v31, (uint64_t (*)(_QWORD))v38);
    v50 = v77;
    sub_20CE1666C();
    v52 = v78;
    v51 = v79;
    v53 = v74;
    (*(void (**)(char *, _QWORD, uint64_t))(v79 + 104))(v78, *MEMORY[0x24BDEB400], v74);
    LOBYTE(v38) = sub_20CE66E40();
    swift_release();
    v54 = *(void (**)(char *, uint64_t))(v51 + 8);
    v54(v52, v53);
    v54(v50, v53);
    v55 = (unsigned int *)MEMORY[0x24BDF50C8];
    v57 = v80;
    v56 = v81;
    if ((v38 & 1) == 0)
      v55 = (unsigned int *)MEMORY[0x24BDF50E0];
    v58 = v82;
    (*(void (**)(char *, _QWORD, uint64_t))(v81 + 104))(v80, *v55, v82);
    v59 = v83;
    v60 = (uint64_t)v71;
    (*(void (**)(char *, char *, uint64_t))(v56 + 16))(&v71[*(int *)(v83 + 36)], v57, v58);
    sub_20CE2E628(v39, v60, &qword_253CFA3A0);
    (*(void (**)(char *, uint64_t))(v56 + 8))(v57, v58);
    sub_20CE21AE0(v39, &qword_253CFA3A0);
    v61 = (uint64_t)v70;
    sub_20CE193A0(v60, (uint64_t)v70, &qword_253CFA2C8);
    v62 = v61;
    v63 = v84;
    sub_20CE193A0(v62, v84, &qword_253CFA2C8);
    v64 = 0;
  }
  return __swift_storeEnumTagSinglePayload(v63, v64, 1, v59);
}

uint64_t sub_20CE281F4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  char v13;
  void (*v14)(_BYTE *, uint64_t);
  uint64_t v15;
  _BYTE v17[16];
  uint64_t v18;

  v2 = sub_20CE673C8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = &v17[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_20CE66E4C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v10);
  v12 = &v17[-v11];
  type metadata accessor for BlendedBorderView();
  sub_20CE1666C();
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BDEB400], v6);
  v13 = sub_20CE66E40();
  v14 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
  v14(v9, v6);
  v14(v12, v6);
  if ((v13 & 1) == 0)
  {
    v15 = *(_QWORD *)(a1 + 40);
    v17[8] = *(_BYTE *)(a1 + 32);
    v18 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA428);
    sub_20CE67554();
  }
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDF3C28], v2);
  return sub_20CE67434();
}

void sub_20CE283EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = type metadata accessor for BlendedBorderView();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253CFA440);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CE676F8();
  v7 = sub_20CE67710();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v7);
  sub_20CE2D24C(v0, (uint64_t)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for BlendedBorderView);
  v8 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = 0;
  *(_QWORD *)(v9 + 24) = 0;
  sub_20CE2E228((uint64_t)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v9 + v8);
  sub_20CE29040((uint64_t)v6, (uint64_t)&unk_254996C80, v9);
  swift_release();
  sub_20CE21AE0((uint64_t)v6, (uint64_t *)&unk_253CFA440);
}

uint64_t sub_20CE28528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[9] = a4;
  v5 = *(_QWORD *)(type metadata accessor for BlendedBorderView() - 8);
  v4[10] = v5;
  v4[11] = *(_QWORD *)(v5 + 64);
  v4[12] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253CFA440);
  v4[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20CE285AC()
{
  uint64_t v0;
  CFDataRef v1;

  v1 = sub_20CE28838();
  *(_QWORD *)(v0 + 112) = v1;
  if (v1)
  {
    *(_QWORD *)(v0 + 120) = sub_20CE676EC();
    *(_QWORD *)(v0 + 128) = sub_20CE676E0();
    sub_20CE676D4();
    return OUTLINED_FUNCTION_23_0();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_20CE28648()
{
  uint64_t v0;
  const __CFData *v1;

  v1 = *(const __CFData **)(v0 + 112);
  swift_release();
  *(_BYTE *)(v0 + 136) = sub_20CE28880(v1) & 1;
  return OUTLINED_FUNCTION_23_0();
}

uint64_t sub_20CE28694()
{
  uint64_t v0;
  const __CFData *v1;
  int64_t Height;
  int64_t v3;
  uint64_t inited;
  BOOL v5;
  char v6;
  void *v7;
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
  _BYTE *v18;

  v1 = *(const __CFData **)(v0 + 112);
  Height = CGImageGetHeight(*(CGImageRef *)(*(_QWORD *)(v0 + 72) + 8));
  v3 = sub_20CE28DF0(v1, 0, Height / 2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA480);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20CE6BDD0;
  *(_QWORD *)(inited + 40) = 0;
  *(_QWORD *)(inited + 48) = 0;
  *(_QWORD *)(inited + 32) = 0;
  if (v3)
  {
    v5 = sub_20CE29D20(v3, inited);
    swift_setDeallocating();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_setDeallocating();
    v5 = 0;
  }
  v6 = *(_BYTE *)(v0 + 136);
  v7 = *(void **)(v0 + 112);
  v9 = *(_QWORD *)(v0 + 96);
  v8 = *(_QWORD *)(v0 + 104);
  v11 = *(_QWORD *)(v0 + 80);
  v10 = *(_QWORD *)(v0 + 88);
  v12 = *(_QWORD *)(v0 + 72);
  v13 = sub_20CE67710();
  __swift_storeEnumTagSinglePayload(v8, 1, 1, v13);
  sub_20CE2D24C(v12, v9, (uint64_t (*)(_QWORD))type metadata accessor for BlendedBorderView);
  v14 = sub_20CE676E0();
  v15 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v16 = swift_allocObject();
  v17 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v16 + 16) = v14;
  *(_QWORD *)(v16 + 24) = v17;
  sub_20CE2E228(v9, v16 + v15);
  v18 = (_BYTE *)(v16 + v15 + v10);
  *v18 = v6;
  v18[1] = v5;
  sub_20CE30D78(v8, (uint64_t)&unk_254996C90, v16);
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

CFDataRef sub_20CE28838()
{
  CGImage *v0;
  CGDataProvider *v1;
  CGDataProvider *v2;
  CFDataRef v3;

  v1 = CGImageGetDataProvider(v0);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = CGDataProviderCopyData(v1);

  return v3;
}

uint64_t sub_20CE28880(const __CFData *a1)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  CGImage *v12;
  int64_t Height;
  uint64_t v14;
  char v15;
  double v16;
  int64_t v17;
  uint64_t v18;
  char v19;
  double v20;
  int64_t Width;
  uint64_t v22;
  char v23;
  double v24;
  int64_t v25;
  uint64_t v26;
  char v27;
  int64_t v28;
  int64_t v29;
  double *v30;
  char v31;
  size_t v32;
  int64_t v33;
  char v34;
  int64_t v35;
  char v36;
  int64_t v37;
  size_t v38;
  uint64_t result;
  unint64_t v40;
  char v41;
  __int128 v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  os_log_type_t v48;
  NSObject *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  char v57;
  void (*v58)(char *, uint64_t);
  BOOL v59;
  _QWORD v60[2];
  __int128 v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  unsigned int v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  char v76;
  uint64_t v77;
  char v78;
  uint64_t v79;
  char v80;

  v64 = sub_20CE6714C();
  v63 = *(_QWORD *)(v64 - 8);
  MEMORY[0x24BDAC7A8](v64);
  v4 = (char *)v60 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
  MEMORY[0x24BDAC7A8](v5);
  v65 = (char *)v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_20CE66E4C();
  v70 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v69 = (char *)v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v60 - v10;
  v68 = v1;
  v12 = *(CGImage **)(v1 + 8);
  Height = CGImageGetHeight(v12);
  v14 = sub_20CE29140(a1, 0, Height / 2);
  if ((v15 & 1) == 0)
  {
    v16 = *(double *)&v14;
    v17 = CGImageGetHeight(v12);
    v18 = sub_20CE29140(a1, 2, v17 / 2);
    if ((v19 & 1) == 0)
    {
      v20 = *(double *)&v18;
      Width = CGImageGetWidth(v12);
      v22 = sub_20CE29140(a1, Width / 2, 0);
      if ((v23 & 1) == 0)
      {
        v24 = *(double *)&v22;
        v25 = CGImageGetWidth(v12);
        v26 = sub_20CE29140(a1, v25 / 2, 2);
        if ((v27 & 1) == 0 && vabdd_f64(v16, v20) > 0.1 && vabdd_f64(v24, *(double *)&v26) > 0.1)
          return 0;
      }
    }
  }
  v28 = CGImageGetHeight(v12);
  if (CGImageHasTransparentPixelAtPoint(v12, 0.0, (double)(v28 / 3)))
    return 0;
  v67 = v7;
  v72 = xmmword_20CE6BDC0;
  v29 = CGImageGetHeight(v12);
  v73 = sub_20CE29140(a1, 0, v29 / 2);
  v30 = (double *)&v74;
  v74 = v31 & 1;
  v32 = CGImageGetWidth(v12);
  v33 = CGImageGetHeight(v12);
  v75 = sub_20CE29140(a1, v32, v33 / 2);
  v76 = v34 & 1;
  v35 = CGImageGetWidth(v12);
  v77 = sub_20CE29140(a1, v35 / 2, 0);
  v78 = v36 & 1;
  v37 = (uint64_t)CGImageGetWidth(v12) / 2;
  v38 = CGImageGetHeight(v12);
  result = sub_20CE29140(a1, v37, v38);
  v40 = 0;
  v79 = result;
  v80 = v41 & 1;
  v66 = *MEMORY[0x24BDEB3F0];
  *(_QWORD *)&v42 = 136315138;
  v61 = v42;
  v60[1] = MEMORY[0x24BEE4AD8] + 8;
  v43 = (uint64_t)v65;
  v62 = v5;
  while (v40 < (unint64_t)v72)
  {
    if ((*(_BYTE *)v30 & 1) == 0)
    {
      v44 = *(v30 - 1);
      v45 = type metadata accessor for BlendedBorderView();
      sub_20CE2E628(v68 + *(int *)(v45 + 32), v43, &qword_253CFA240);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v46 = v70;
        v47 = v67;
        (*(void (**)(char *, uint64_t, uint64_t))(v70 + 32))(v11, v43, v67);
      }
      else
      {
        v48 = sub_20CE67734();
        v49 = sub_20CE67224();
        if (os_log_type_enabled(v49, v48))
        {
          v50 = v11;
          v51 = swift_slowAlloc();
          v52 = swift_slowAlloc();
          v71 = v52;
          *(_DWORD *)v51 = v61;
          sub_20CE29ED4(0x686353726F6C6F43, 0xEB00000000656D65, &v71);
          *(_QWORD *)(v51 + 4) = v53;
          _os_log_impl(&dword_20CE0F000, v49, v48, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v51, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x212B97B1C](v52, -1, -1);
          v54 = v51;
          v11 = v50;
          MEMORY[0x212B97B1C](v54, -1, -1);
        }

        sub_20CE67140();
        swift_getAtKeyPath();
        swift_release();
        (*(void (**)(char *, uint64_t))(v63 + 8))(v4, v64);
        v43 = (uint64_t)v65;
        v47 = v67;
        v46 = v70;
      }
      v55 = v11;
      v56 = v69;
      (*(void (**)(char *, _QWORD, uint64_t))(v46 + 104))(v69, v66, v47);
      v57 = sub_20CE66E40();
      v58 = *(void (**)(char *, uint64_t))(v46 + 8);
      v58(v56, v47);
      result = ((uint64_t (*)(char *, uint64_t))v58)(v55, v47);
      v59 = v44 > 0.85;
      if ((v57 & 1) != 0)
        v59 = v44 < 0.2;
      v11 = v55;
      if (v59)
        return 1;
    }
    ++v40;
    v30 += 2;
    if (v40 == 4)
      return 0;
  }
  __break(1u);
  return result;
}

int64_t sub_20CE28DF0(const __CFData *a1, int64_t a2, int64_t a3)
{
  CGImage *v3;
  CGImage *v4;
  int64_t result;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  unint64_t v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  _BYTE *v16;
  unint64_t v17;
  double v18;
  unint64_t v19;
  double v20;
  double v21;

  v4 = v3;
  result = (int64_t)CFDataGetBytePtr(a1);
  if (!result)
    return result;
  v8 = result;
  result = CGImageGetWidth(v4);
  if (result < 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  v9 = result;
  result = 0;
  if (a2 < 0 || v9 <= a2)
    return result;
  result = CGImageGetHeight(v4);
  if (result < 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v10 = result;
  result = 0;
  if ((a3 & 0x8000000000000000) == 0 && v10 > a3)
  {
    result = CGImageGetBytesPerRow(v4);
    v11 = a3 * result;
    if ((unsigned __int128)(a3 * (__int128)result) >> 64 == (a3 * result) >> 63)
    {
      result = CGImageGetBitsPerPixel(v4);
      if ((unsigned __int128)(a2 * (__int128)result) >> 64 == (a2 * result) >> 63)
      {
        v13 = a2 * result / 8;
        v14 = v11 + v13;
        if (!__OFADD__(v11, v13))
        {
          v15 = v14 + 2;
          if (!__OFADD__(v14, 2))
          {
            v16 = (_BYTE *)(v8 + v14);
            LOBYTE(v12) = v16[1];
            *(double *)&v17 = (double)v12;
            v18 = *(double *)&v17 / 255.0;
            LOBYTE(v17) = *v16;
            *(double *)&v19 = (double)v17;
            v20 = *(double *)&v19 / 255.0;
            LOBYTE(v19) = *(_BYTE *)(v8 + v15);
            v21 = (double)v19 / 255.0;
            __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA480);
            result = swift_allocObject();
            *(_OWORD *)(result + 16) = xmmword_20CE6BDD0;
            *(double *)(result + 32) = v20;
            *(double *)(result + 40) = v18;
            *(double *)(result + 48) = v21;
            return result;
          }
LABEL_19:
          __break(1u);
          return result;
        }
LABEL_18:
        __break(1u);
        goto LABEL_19;
      }
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  return result;
}

uint64_t sub_20CE28F3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6)
{
  uint64_t v6;

  *(_BYTE *)(v6 + 50) = a6;
  *(_BYTE *)(v6 + 49) = a5;
  *(_QWORD *)(v6 + 32) = a4;
  sub_20CE676EC();
  *(_QWORD *)(v6 + 40) = sub_20CE676E0();
  sub_20CE676D4();
  return swift_task_switch();
}

uint64_t sub_20CE28FB0()
{
  uint64_t v0;
  char v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_BYTE *)(v0 + 50);
  v2 = *(_BYTE *)(v0 + 49);
  v3 = *(_QWORD *)(v0 + 32);
  swift_release();
  v4 = *(_QWORD *)(v3 + 24);
  *(_BYTE *)(v0 + 16) = *(_BYTE *)(v3 + 16);
  *(_QWORD *)(v0 + 24) = v4;
  *(_BYTE *)(v0 + 48) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA428);
  OUTLINED_FUNCTION_82();
  v5 = *(_QWORD *)(v3 + 40);
  *(_BYTE *)(v0 + 16) = *(_BYTE *)(v3 + 32);
  *(_QWORD *)(v0 + 24) = v5;
  *(_BYTE *)(v0 + 48) = v1;
  OUTLINED_FUNCTION_82();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20CE29040(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  sub_20CE29D94(a1, 0, 0, 0, 1, 0, 0);
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_20CE676D4();
    swift_unknownObjectRelease();
  }
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a2;
  *(_QWORD *)(v5 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_20CE29140(const __CFData *a1, int64_t a2, int64_t a3)
{
  uint64_t result;
  unint64_t v4;
  double v5;
  double v6;

  *(double *)&result = COERCE_DOUBLE(sub_20CE28DF0(a1, a2, a3));
  if (*(double *)&result != 0.0)
  {
    v4 = *(_QWORD *)(result + 16);
    if (v4)
    {
      if (v4 != 1)
      {
        if (v4 >= 3)
        {
          v5 = *(double *)(result + 32) * 0.299 + *(double *)(result + 40) * 0.587;
          v6 = *(double *)(result + 48);
          swift_bridgeObjectRelease();
          *(double *)&result = v5 + v6 * 0.114;
          return result;
        }
LABEL_9:
        __break(1u);
        return result;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_9;
  }
  return result;
}

void sub_20CE291DC()
{
  _BYTE *v0;

  *v0 = OUTLINED_FUNCTION_88() & 1;
  OUTLINED_FUNCTION_4();
}

void sub_20CE291FC()
{
  OUTLINED_FUNCTION_75();
  OUTLINED_FUNCTION_4();
}

void sub_20CE29214()
{
  EnvironmentValues.iconBlendMode.getter();
  OUTLINED_FUNCTION_4();
}

void sub_20CE29230(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = sub_20CE675F0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_41();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v1, a1);
  EnvironmentValues.iconBlendMode.setter(v1);
  OUTLINED_FUNCTION_21();
}

void sub_20CE29294()
{
  EnvironmentValues.asyncViewWaiter.getter();
  OUTLINED_FUNCTION_4();
}

void sub_20CE292B0()
{
  EnvironmentValues.asyncViewWaiter.getter();
  OUTLINED_FUNCTION_4();
}

uint64_t sub_20CE292CC(uint64_t a1)
{
  _BYTE v2[40];

  sub_20CE2E628(a1, (uint64_t)v2, &qword_254996C40);
  return EnvironmentValues.asyncViewWaiter.setter((uint64_t)v2);
}

void sub_20CE2930C()
{
  sub_20CE1666C();
}

void sub_20CE29340()
{
  sub_20CE1666C();
}

void sub_20CE29374(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[3];
  uint64_t v16;
  _QWORD v17[5];
  char v18;

  v2 = v1;
  v4 = sub_20CE6714C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CE2E628(v2, (uint64_t)v17, &qword_2549969C0);
  if (v18 == 1)
  {
    sub_20CE193A0((uint64_t)v17, a1, &qword_254996C40);
  }
  else
  {
    v8 = sub_20CE67734();
    v9 = sub_20CE67224();
    v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v15[1] = a1;
      v13 = v12;
      v16 = v12;
      *(_DWORD *)v11 = 136315138;
      sub_20CE29ED4(0xD000000000000019, 0x800000020CE6DDD0, &v16);
      v15[2] = v14;
      sub_20CE67764();
      _os_log_impl(&dword_20CE0F000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212B97B1C](v13, -1, -1);
      MEMORY[0x212B97B1C](v11, -1, -1);
    }

    sub_20CE67140();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_20CE29560(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v4 = sub_20CE6714C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return a1 & 1;
  swift_retain();
  v8 = sub_20CE67734();
  v9 = sub_20CE67224();
  v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v16 = v12;
    *(_DWORD *)v11 = 136315138;
    sub_20CE29ED4(1819242306, 0xE400000000000000, &v16);
    v15 = v13;
    sub_20CE67764();
    _os_log_impl(&dword_20CE0F000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212B97B1C](v12, -1, -1);
    MEMORY[0x212B97B1C](v11, -1, -1);
  }

  sub_20CE67140();
  swift_getAtKeyPath();
  sub_20CE158B0(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v16;
}

uint64_t sub_20CE29718(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v4 = sub_20CE6714C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    v8 = sub_20CE67734();
    v9 = sub_20CE67224();
    v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v16 = v12;
      *(_DWORD *)v11 = 136315138;
      sub_20CE29ED4(0xD000000000000017, 0x800000020CE6DD50, &v16);
      v15 = v13;
      sub_20CE67764();
      _os_log_impl(&dword_20CE0F000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212B97B1C](v12, -1, -1);
      MEMORY[0x212B97B1C](v11, -1, -1);
    }

    sub_20CE67140();
    swift_getAtKeyPath();
    j__swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v16;
  }
  return a1;
}

void sub_20CE298D8(uint64_t a1@<X0>, char a2@<W1>, _BYTE *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  os_log_type_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[3];
  uint64_t v18;

  v6 = sub_20CE6714C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    *a3 = a1;
  }
  else
  {
    sub_20CE15B98(a1, 0);
    v10 = sub_20CE67734();
    v11 = sub_20CE67224();
    v12 = v10;
    if (os_log_type_enabled(v11, v10))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      v17[1] = a3;
      v15 = v14;
      v18 = v14;
      *(_DWORD *)v13 = 136315138;
      sub_20CE29ED4(0x7453726564726F42, 0xEB00000000656C79, &v18);
      v17[2] = v16;
      sub_20CE67764();
      _os_log_impl(&dword_20CE0F000, v11, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212B97B1C](v15, -1, -1);
      MEMORY[0x212B97B1C](v13, -1, -1);
    }

    sub_20CE67140();
    swift_getAtKeyPath();
    sub_20CE158B0(a1, 0);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

id sub_20CE29AAC()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  os_log_type_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  OUTLINED_FUNCTION_46_0();
  v21 = v0;
  v22 = v1;
  v3 = v2;
  v19 = v4;
  v5 = sub_20CE6714C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_38();
  v9 = v8 - v7;
  if ((v3 & 1) != 0)
    return v19;
  swift_retain();
  v10 = sub_20CE67734();
  v11 = sub_20CE67224();
  v12 = v10;
  if (os_log_type_enabled(v11, v10))
  {
    v13 = (uint8_t *)OUTLINED_FUNCTION_43_0();
    v14 = OUTLINED_FUNCTION_43_0();
    v20 = v14;
    *(_DWORD *)v13 = 136315138;
    OUTLINED_FUNCTION_58_0(v14, &qword_254996B18);
    v15 = sub_20CE67920();
    sub_20CE29ED4(v15, v16, &v20);
    OUTLINED_FUNCTION_85(v17);
    sub_20CE67764();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_20CE0F000, v11, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v13, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_14_0();
  }

  sub_20CE67140();
  swift_getAtKeyPath();
  sub_20CE2D428(v19, 0);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
  return (id)v20;
}

uint64_t sub_20CE29C68()
{
  swift_retain();
  return sub_20CE67098();
}

id sub_20CE29C90(uint64_t a1, unsigned __int16 a2, uint64_t a3, unint64_t a4)
{
  void *v4;
  void *v7;
  id v10;

  if (a4 >> 60 == 15)
  {
    v7 = 0;
  }
  else
  {
    v7 = (void *)sub_20CE66D5C();
    sub_20CE2D414(a3, a4);
  }
  v10 = objc_msgSend(v4, sel_initWithPaletteColor_glyphCharacter_customImageData_, a1, a2, v7);

  return v10;
}

BOOL sub_20CE29D20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _BOOL8 result;
  uint64_t v4;
  double *v5;
  double *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v12;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  if (*(double *)(a1 + 32) != *(double *)(a2 + 32))
    return 0;
  if (v2 == 1)
    return 1;
  v4 = v2 - 2;
  v5 = (double *)(a1 + 40);
  v6 = (double *)(a2 + 40);
  do
  {
    v7 = *v5++;
    v8 = v7;
    v9 = *v6++;
    v10 = v9;
    v12 = v4-- != 0;
    result = v8 == v10;
  }
  while (v8 == v10 && v12);
  return result;
}

uint64_t sub_20CE29D94(uint64_t a1, char a2, char a3, char a4, char a5, char a6, char a7)
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t result;
  unsigned __int8 v19;
  uint64_t v20;

  v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253CFA440);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CE2E628(a1, (uint64_t)v16, (uint64_t *)&unk_253CFA440);
  v17 = sub_20CE67710();
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17) == 1)
  {
    sub_20CE21AE0((uint64_t)v16, (uint64_t *)&unk_253CFA440);
    result = 0;
    if ((a2 & 1) == 0)
      goto LABEL_3;
  }
  else
  {
    v19 = sub_20CE67704();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);
    result = v19;
    if ((a2 & 1) == 0)
    {
LABEL_3:
      if ((a3 & 1) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  result |= 0x100uLL;
  if ((a3 & 1) != 0)
  {
LABEL_4:
    result |= 0x400uLL;
    if ((a4 & 1) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  if ((a4 & 1) == 0)
  {
LABEL_5:
    if ((a5 & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_15:
  result |= 0x800uLL;
  if ((a5 & 1) != 0)
LABEL_6:
    result |= 0x1000uLL;
LABEL_7:
  if ((a6 & 1) != 0)
    result |= 0x2000uLL;
  if ((a7 & 1) != 0)
    return result | 0x4000;
  return result;
}

void sub_20CE29ED4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[3];
  uint64_t ObjectType;

  v6 = sub_20CE29F94(v10, 0, 0, 1, a1, a2);
  if (v6)
  {
    v7 = v6;
    ObjectType = swift_getObjectType();
    v10[0] = v7;
    v8 = *a3;
    if (*a3)
    {
      sub_20CE21918((uint64_t)v10, *a3);
      *a3 = v8 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v10[0] = a1;
    v10[1] = a2;
    v9 = *a3;
    if (*a3)
    {
      sub_20CE21918((uint64_t)v10, *a3);
      *a3 = v9 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  OUTLINED_FUNCTION_33_0();
}

uint64_t sub_20CE29F94(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_20CE2A0E8((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_20CE67770();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_20CE2A1AC(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_20CE677B8();
    if (!v8)
    {
      result = sub_20CE67818();
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

void *sub_20CE2A0E8(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_20CE6783C();
  __break(1u);
  return result;
}

uint64_t sub_20CE2A1AC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_20CE2A240(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_20CE2A414(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_20CE2A414((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_20CE2A240(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_20CE6768C();
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
  v3 = sub_20CE2A3B0(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_20CE677A0();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_20CE6783C();
  __break(1u);
LABEL_14:
  result = sub_20CE67818();
  __break(1u);
  return result;
}

_QWORD *sub_20CE2A3B0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254996AF0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_20CE2A414(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254996AF0);
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
    sub_20CE2A5AC(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_20CE2A4E8(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_20CE2A4E8(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_20CE6783C();
  __break(1u);
  return result;
}

char *sub_20CE2A5AC(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_20CE6783C();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_20CE2A62C(__int128 *a1, double a2)
{
  uint64_t *v2;
  uint64_t v6;

  swift_isUniquelyReferenced_nonNull_native();
  v6 = *v2;
  *v2 = 0x8000000000000000;
  sub_20CE12EE8(a1, a2);
  *v2 = v6;
  return swift_bridgeObjectRelease();
}

unint64_t sub_20CE2A6A0(unint64_t result, _OWORD *a2, _QWORD *a3, double a4)
{
  _OWORD *v4;
  __int128 v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a3[(result >> 6) + 8] |= 1 << result;
  v4 = (_OWORD *)(a3[6] + (result << 6));
  v5 = a2[1];
  *v4 = *a2;
  v4[1] = v5;
  v4[2] = a2[2];
  *(_OWORD *)((char *)v4 + 42) = *(_OWORD *)((char *)a2 + 42);
  *(double *)(a3[7] + 8 * result) = a4;
  v6 = a3[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a3[2] = v8;
  return result;
}

void sub_20CE2A6FC()
{
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_84();
}

void sub_20CE2A72C(_BYTE *a1@<X8>)
{
  *a1 = sub_20CE67110() & 1;
  OUTLINED_FUNCTION_4();
}

void sub_20CE2A754()
{
  sub_20CE6711C();
  OUTLINED_FUNCTION_4();
}

void sub_20CE2A774(uint64_t *a1@<X8>)
{
  *a1 = sub_20CE6708C();
  OUTLINED_FUNCTION_4();
}

void sub_20CE2A79C()
{
  _BYTE *v0;

  *v0 = OUTLINED_FUNCTION_88() & 1;
  OUTLINED_FUNCTION_4();
}

void sub_20CE2A7BC()
{
  OUTLINED_FUNCTION_75();
  OUTLINED_FUNCTION_4();
}

void sub_20CE2A7D8()
{
  AppIconView.reloadImage()();
  OUTLINED_FUNCTION_4();
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  OUTLINED_FUNCTION_72();
  sub_20CE158B0(*(_QWORD *)(v0 + 48), *(_BYTE *)(v0 + 56));
  if ((*(_BYTE *)(v0 + 104) & 1) != 0)
  {
    if (*(_QWORD *)(v0 + 88))
      __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  }
  else
  {
    swift_release();
  }

  swift_release();
  return swift_deallocObject();
}

unint64_t sub_20CE2A858()
{
  unint64_t result;

  result = qword_253CFA150;
  if (!qword_253CFA150)
  {
    result = MEMORY[0x212B97A80](&unk_20CE6BBF4, &type metadata for RoundedImageView);
    atomic_store(result, (unint64_t *)&qword_253CFA150);
  }
  return result;
}

unint64_t sub_20CE2A894()
{
  unint64_t result;

  result = qword_253CFA100;
  if (!qword_253CFA100)
  {
    result = MEMORY[0x212B97A80](MEMORY[0x24BEE50E0], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_253CFA100);
  }
  return result;
}

uint64_t sub_20CE2A8D0(uint64_t a1)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_BYTE *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 80);
  v5 = *(_BYTE *)(a1 + 88);
  v6 = *(_QWORD *)(a1 + 96);
  v7 = *(_QWORD *)(a1 + 112);

  sub_20CE158B0(v2, v3);
  j__swift_release();
  sub_20CE158B0(v4, v5);
  sub_20CE2A984(v6);
  sub_20CE2A984(v7);
  return a1;
}

uint64_t sub_20CE2A984(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

unint64_t sub_20CE2A998()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253CFA478;
  if (!qword_253CFA478)
  {
    v1 = sub_20CE15F68(255, &qword_253CFA470);
    result = MEMORY[0x212B97A80](MEMORY[0x24BEE5BE0], v1);
    atomic_store(result, (unint64_t *)&qword_253CFA478);
  }
  return result;
}

unint64_t sub_20CE2A9EC()
{
  unint64_t result;

  result = qword_253CFA218;
  if (!qword_253CFA218)
  {
    result = MEMORY[0x212B97A80](&protocol conformance descriptor for IconSize, &type metadata for IconSize);
    atomic_store(result, (unint64_t *)&qword_253CFA218);
  }
  return result;
}

void sub_20CE2AA2C(void *a1)
{
  uint64_t v1;

  sub_20CE242D0(a1, (id *)(v1 + 16));
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

void sub_20CE2AA4C()
{
  EnvironmentValues.iconBlendMode.getter();
  OUTLINED_FUNCTION_4();
}

unint64_t sub_20CE2AA74()
{
  unint64_t result;

  result = qword_2549969A8;
  if (!qword_2549969A8)
  {
    result = MEMORY[0x212B97A80](&protocol conformance descriptor for IconCornerRadiusRatio, &type metadata for IconCornerRadiusRatio);
    atomic_store(result, (unint64_t *)&qword_2549969A8);
  }
  return result;
}

unint64_t sub_20CE2AAB4()
{
  unint64_t result;

  result = qword_2549969B0;
  if (!qword_2549969B0)
  {
    result = MEMORY[0x212B97A80](&protocol conformance descriptor for IconView.DisplayMode, &type metadata for IconView.DisplayMode);
    atomic_store(result, (unint64_t *)&qword_2549969B0);
  }
  return result;
}

uint64_t sub_20CE2AAF0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t getEnumTagSinglePayload for IconSize(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0x7C && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 123;
    }
    else
    {
      v2 = ((*(unsigned __int8 *)(a1 + 16) >> 5) & 0xFFFFFF87 | (8 * ((*(unsigned __int8 *)(a1 + 16) >> 1) & 0xF))) ^ 0x7F;
      if (v2 >= 0x7B)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for IconSize(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7B)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 124;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7C)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0x7C)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 0;
      *(_BYTE *)(result + 16) = 2 * (((-a2 >> 3) & 0xF) - 16 * a2);
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for IconCornerRadiusRatio(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for IconCornerRadiusRatio(uint64_t result, int a2, int a3)
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

uint64_t assignWithCopy for IconView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  char v13;
  id v14;
  id v15;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(_OWORD *)(a2 + 8);
  v8 = (_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 32);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = v7;
  v11 = (_QWORD *)(a2 + 32);
  v10 = *(void **)(a2 + 32);
  if ((unint64_t)v9 >= 2)
  {
    if ((unint64_t)v10 >= 2)
    {
      *(_QWORD *)(a1 + 32) = v10;
      v15 = v10;

      *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
    }
    else
    {
      sub_20CE21AE0(a1 + 32, &qword_2549969B8);
      v13 = *(_BYTE *)(a2 + 40);
      *v8 = *v11;
      *(_BYTE *)(a1 + 40) = v13;
    }
  }
  else if ((unint64_t)v10 >= 2)
  {
    *(_QWORD *)(a1 + 32) = v10;
    *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
    v14 = v10;
  }
  else
  {
    v12 = *v11;
    *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
    *v8 = v12;
  }
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

uint64_t assignWithTake for IconView(uint64_t a1, uint64_t a2)
{
  void *v4;
  unint64_t v5;
  void *v6;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  v5 = *(_QWORD *)(a2 + 32);
  v6 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  if ((unint64_t)v6 >= 2)
  {
    if (v5 >= 2)
    {
      *(_QWORD *)(a1 + 32) = v5;

      *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
      goto LABEL_6;
    }
    sub_20CE21AE0(a1 + 32, &qword_2549969B8);
  }
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
LABEL_6:
  *(_BYTE *)(a1 + 41) = *(_BYTE *)(a2 + 41);
  return a1;
}

uint64_t getEnumTagSinglePayload for IconView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 42))
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

uint64_t storeEnumTagSinglePayload for IconView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 42) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for IconView.DisplayMode(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)a2;
  if (*(_QWORD *)a2 < 0xFFFFFFFFuLL)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  }
  else
  {
    *(_QWORD *)a1 = v3;
    *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
    v4 = v3;
  }
  return a1;
}

void destroy for IconView.DisplayMode(void **a1)
{
  void *v1;

  v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF)

}

uint64_t assignWithCopy for IconView.DisplayMode(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  if (*(_QWORD *)a1 < 0xFFFFFFFFuLL)
  {
    if ((unint64_t)v5 >= 0xFFFFFFFF)
    {
      *(_QWORD *)a1 = v5;
      *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
      v7 = v5;
      return a1;
    }
LABEL_7:
    v8 = *(void **)a2;
    *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
    *(_QWORD *)a1 = v8;
    return a1;
  }
  if ((unint64_t)v5 < 0xFFFFFFFF)
  {

    goto LABEL_7;
  }
  *(_QWORD *)a1 = v5;
  v6 = v5;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for IconView.DisplayMode(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  if (*(_QWORD *)a1 < 0xFFFFFFFFuLL)
    goto LABEL_5;
  if (*(_QWORD *)a2 < 0xFFFFFFFFuLL)
  {

LABEL_5:
    *(_QWORD *)a1 = *(_QWORD *)a2;
    goto LABEL_6;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;

LABEL_6:
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for IconView.DisplayMode(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *((_BYTE *)a1 + 9))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for IconView.DisplayMode(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 1;
  }
  return result;
}

uint64_t sub_20CE2B044(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

uint64_t getEnumTagSinglePayload for IconView.BorderStyle(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
  {
    v6 = *a1;
    v7 = v6 >= 2;
    v8 = (v6 + 2147483646) & 0x7FFFFFFF;
    if (!v7)
      v8 = -1;
    if (v8 + 1 >= 2)
      return v8;
    else
      return 0;
  }
  else
  {
    v2 = a2 + 2;
    if (a2 + 2 >= 0xFFFF00)
      v3 = 4;
    else
      v3 = 2;
    if (v2 >> 8 < 0xFF)
      v3 = 1;
    if (v2 >= 0x100)
      v4 = v3;
    else
      v4 = 0;
    return ((uint64_t (*)(void))((char *)&loc_20CE2B0AC + 4 * byte_20CE6B53F[v4]))();
  }
}

uint64_t storeEnumTagSinglePayload for IconView.BorderStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  v3 = a3 + 2;
  if (a3 + 2 >= 0xFFFF00)
    v4 = 4;
  else
    v4 = 2;
  if (v3 >> 8 < 0xFF)
    v4 = 1;
  if (v3 >= 0x100)
    LODWORD(v5) = v4;
  else
    LODWORD(v5) = 0;
  if (a3 >= 0xFE)
    v5 = v5;
  else
    v5 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_20CE2B164 + 4 * byte_20CE6B549[v5]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_20CE2B198 + 4 * byte_20CE6B544[v5]))();
}

uint64_t sub_20CE2B198(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CE2B1A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20CE2B1A8);
  return result;
}

uint64_t sub_20CE2B1B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20CE2B1BCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_20CE2B1C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CE2B1C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CE2B1D4(unsigned __int8 *a1)
{
  unsigned int v1;
  BOOL v2;
  int v3;

  v1 = *a1;
  v2 = v1 >= 2;
  v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2)
    return (v3 + 1);
  else
    return 0;
}

_BYTE *sub_20CE2B1F0(_BYTE *result, int a2)
{
  if (a2)
    *result = a2 + 1;
  return result;
}

void type metadata accessor for IconView.BorderStyle()
{
  OUTLINED_FUNCTION_49();
}

uint64_t destroy for AppIconView(uint64_t a1)
{

  sub_20CE158B0(*(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  if ((*(_BYTE *)(a1 + 88) & 1) != 0)
  {
    if (*(_QWORD *)(a1 + 72))
      __swift_destroy_boxed_opaque_existential_1(a1 + 48);
  }
  else
  {
    swift_release();
  }

  return swift_release();
}

uint64_t initializeWithCopy for AppIconView(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  _OWORD *v8;
  _OWORD *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  void *v13;
  uint64_t v14;
  id v15;

  v4 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 32);
  v6 = *(_BYTE *)(a2 + 40);
  v7 = v4;
  sub_20CE15B98(v5, v6);
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = v6;
  v8 = (_OWORD *)(a2 + 48);
  if ((*(_BYTE *)(a2 + 88) & 1) != 0)
  {
    v9 = (_OWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a2 + 72);
    if (v10)
    {
      v11 = *(_QWORD *)(a2 + 80);
      *(_QWORD *)(a1 + 72) = v10;
      *(_QWORD *)(a1 + 80) = v11;
      (**(void (***)(_OWORD *, _OWORD *))(v10 - 8))(v9, v8);
    }
    else
    {
      v12 = *(_OWORD *)(a2 + 64);
      *v9 = *v8;
      *(_OWORD *)(a1 + 64) = v12;
      *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
    }
    *(_BYTE *)(a1 + 88) = 1;
  }
  else
  {
    *(_QWORD *)(a1 + 48) = *(_QWORD *)v8;
    *(_BYTE *)(a1 + 88) = 0;
    swift_retain();
  }
  v13 = *(void **)(a2 + 96);
  v14 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = v13;
  *(_QWORD *)(a1 + 104) = v14;
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  v15 = v13;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AppIconView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  __int128 *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  void *v16;
  void *v17;
  id v18;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = v7;
  v8 = *(_QWORD *)(a2 + 32);
  v9 = *(_BYTE *)(a2 + 40);
  sub_20CE15B98(v8, v9);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_BYTE *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = v8;
  *(_BYTE *)(a1 + 40) = v9;
  sub_20CE158B0(v10, v11);
  if (a1 != a2)
  {
    v12 = (__int128 *)(a2 + 48);
    sub_20CE21AE0(a1 + 48, &qword_2549969C0);
    if ((*(_BYTE *)(a2 + 88) & 1) != 0)
    {
      v13 = *(_QWORD *)(a2 + 72);
      if (v13)
      {
        *(_QWORD *)(a1 + 72) = v13;
        *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
        (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 48, a2 + 48);
      }
      else
      {
        v14 = *v12;
        v15 = *(_OWORD *)(a2 + 64);
        *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
        *(_OWORD *)(a1 + 48) = v14;
        *(_OWORD *)(a1 + 64) = v15;
      }
      *(_BYTE *)(a1 + 88) = 1;
    }
    else
    {
      *(_QWORD *)(a1 + 48) = *(_QWORD *)v12;
      *(_BYTE *)(a1 + 88) = 0;
      swift_retain();
    }
  }
  v16 = *(void **)(a1 + 96);
  v17 = *(void **)(a2 + 96);
  *(_QWORD *)(a1 + 96) = v17;
  v18 = v17;

  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  return a1;
}

void *__swift_memcpy113_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x71uLL);
}

uint64_t assignWithTake for AppIconView(uint64_t a1, uint64_t a2)
{
  void *v4;
  char v5;
  uint64_t v6;
  char v7;
  __int128 v8;
  void *v9;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = *(_BYTE *)(a2 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_BYTE *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = v5;
  sub_20CE158B0(v6, v7);
  if (a1 != a2)
  {
    sub_20CE21AE0(a1 + 48, &qword_2549969C0);
    v8 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v8;
    *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  }
  v9 = *(void **)(a1 + 96);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);

  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_release();
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppIconView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 113))
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

uint64_t storeEnumTagSinglePayload for AppIconView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 112) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 113) = 1;
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
    *(_BYTE *)(result + 113) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_20CE2B5D4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  __int128 v7;
  uint64_t v8;
  char v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *(_QWORD *)v4 = *a2;
    v4 = v16 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    v8 = a2[6];
    *(_QWORD *)(a1 + 40) = a2[5];
    v9 = *((_BYTE *)a2 + 56);
    v10 = (id)v7;
    swift_retain();
    sub_20CE15B98(v8, v9);
    *(_QWORD *)(v4 + 48) = v8;
    *(_BYTE *)(v4 + 56) = v9;
    v11 = a2[8];
    LOBYTE(v8) = *((_BYTE *)a2 + 72);
    sub_20CE15B98(v11, v8);
    *(_QWORD *)(v4 + 64) = v11;
    *(_BYTE *)(v4 + 72) = v8;
    v12 = *(int *)(a3 + 52);
    v13 = (_QWORD *)(v4 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254996990);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v15 = sub_20CE675F0();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
    }
    else
    {
      *v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v4;
}

uint64_t sub_20CE2B718(uint64_t a1, __int128 *a2, uint64_t a3)
{
  __int128 v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;

  v6 = *a2;
  *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
  *(_OWORD *)a1 = v6;
  v7 = *(void **)(a1 + 24);
  v8 = (void *)*((_QWORD *)a2 + 3);
  *(_QWORD *)(a1 + 24) = v8;
  v9 = v8;

  v10 = *((_QWORD *)a2 + 5);
  *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
  *(_QWORD *)(a1 + 40) = v10;
  swift_retain();
  swift_release();
  v11 = *((_QWORD *)a2 + 6);
  v12 = *((_BYTE *)a2 + 56);
  sub_20CE15B98(v11, v12);
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(_BYTE *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = v11;
  *(_BYTE *)(a1 + 56) = v12;
  sub_20CE158B0(v13, v14);
  v15 = *((_QWORD *)a2 + 8);
  v16 = *((_BYTE *)a2 + 72);
  sub_20CE15B98(v15, v16);
  v17 = *(_QWORD *)(a1 + 64);
  v18 = *(_BYTE *)(a1 + 72);
  *(_QWORD *)(a1 + 64) = v15;
  *(_BYTE *)(a1 + 72) = v16;
  sub_20CE158B0(v17, v18);
  if ((__int128 *)a1 != a2)
  {
    v19 = *(int *)(a3 + 52);
    v20 = (_QWORD *)(a1 + v19);
    v21 = (_QWORD *)((char *)a2 + v19);
    sub_20CE21AE0(a1 + v19, &qword_254996990);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254996990);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v22 = sub_20CE675F0();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v20, v21, v22);
    }
    else
    {
      *v20 = *v21;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_20CE2B868(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  const void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v4;
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  v5 = *(int *)(a3 + 52);
  v6 = (const void *)(a2 + v5);
  v7 = (void *)(a1 + v5);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996990);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = sub_20CE675F0();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v6, v9);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v6, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  return a1;
}

uint64_t sub_20CE2B940(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  char v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  void *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v6 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  v7 = *(_BYTE *)(a2 + 56);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_BYTE *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = v7;
  sub_20CE158B0(v8, v9);
  v10 = *(_BYTE *)(a2 + 72);
  v11 = *(_QWORD *)(a1 + 64);
  v12 = *(_BYTE *)(a1 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = v10;
  sub_20CE158B0(v11, v12);
  if (a1 != a2)
  {
    v13 = *(int *)(a3 + 52);
    v14 = (void *)(a1 + v13);
    v15 = (const void *)(a2 + v13);
    sub_20CE21AE0(a1 + v13, &qword_254996990);
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996990);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v17 = sub_20CE675F0();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v14, v15, v17);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_20CE2BA68()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_20CE2BA74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    OUTLINED_FUNCTION_67(*(_QWORD *)(a1 + 32));
    OUTLINED_FUNCTION_21();
  }
  else
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549969C8);
    OUTLINED_FUNCTION_14(a1 + *(int *)(a3 + 52), a2, v6);
  }
}

uint64_t sub_20CE2BAD0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_20CE2BADC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_65_0();
  if (v3)
  {
    *(_QWORD *)(v1 + 32) = (v0 - 1);
    OUTLINED_FUNCTION_21();
  }
  else
  {
    v4 = v2;
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549969C8);
    OUTLINED_FUNCTION_26_0(v1 + *(int *)(v4 + 52), v0, v0, v5);
  }
}

void sub_20CE2BB30()
{
  sub_20CE1981C((uint64_t)&unk_253CFA410);
}

void sub_20CE2BB64(uint64_t a1)
{
  void (*v1)(void);
  uint64_t *v2;

  if (!OUTLINED_FUNCTION_48(a1))
  {
    OUTLINED_FUNCTION_4_0(0, v2);
    OUTLINED_FUNCTION_66_0();
    v1();
    OUTLINED_FUNCTION_10();
  }
  OUTLINED_FUNCTION_46();
}

void sub_20CE2BBB0()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253CFA3F8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253CFA3F0);
  sub_20CE15F68(255, &qword_253CFA470);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253CFA290);
  sub_20CE2D6DC((uint64_t)&unk_253CFA288);
  sub_20CE2A894();
  OUTLINED_FUNCTION_15_0();
  sub_20CE2A998();
  OUTLINED_FUNCTION_15_0();
  sub_20CE2A9EC();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_33_0();
}

void sub_20CE2BC94(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[3];

  v1 = *(_QWORD *)(a1 + 8);
  sub_20CE66FCC();
  OUTLINED_FUNCTION_86();
  v2 = sub_20CE66F90();
  v3 = sub_20CE66F90();
  v4 = sub_20CE66F90();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996998);
  OUTLINED_FUNCTION_86();
  v5 = sub_20CE66F90();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253CFA270);
  OUTLINED_FUNCTION_86();
  sub_20CE66F90();
  sub_20CE6720C();
  sub_20CE67458();
  sub_20CE66F90();
  sub_20CE6720C();
  sub_20CE6720C();
  v12[0] = v1;
  v12[1] = MEMORY[0x24BDEDB58];
  v6 = MEMORY[0x24BDED308];
  v11[0] = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v2, v12);
  v11[1] = MEMORY[0x24BDEC438];
  v10[0] = MEMORY[0x212B97A80](v6, v3, v11);
  v10[1] = MEMORY[0x24BDEBEE0];
  v7 = MEMORY[0x212B97A80](v6, v4, v10);
  sub_20CE18AAC((uint64_t)&unk_2549969A0);
  v9[0] = v7;
  v9[1] = v8;
  MEMORY[0x212B97A80](v6, v5, v9);
  sub_20CE18AAC((uint64_t)&unk_253CFA268);
  OUTLINED_FUNCTION_76();
}

void sub_20CE2BE60()
{
  OUTLINED_FUNCTION_6();
}

void sub_20CE2BE7C()
{
  OUTLINED_FUNCTION_10();
}

void sub_20CE2BE90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v16;

  a15 = a1;
  MEMORY[0x212B97A80](v16, v15, &a15);
  OUTLINED_FUNCTION_74();
}

uint64_t sub_20CE2BEB8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = a1;
  v6 = v2;
  return MEMORY[0x212B97A80](v1, v4, &v5);
}

uint64_t initializeWithCopy for SymbolIconView.SymbolIconMetrics.Input(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SymbolIconView.SymbolIconMetrics.Input(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  return a1;
}

__n128 __swift_memcpy58_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 42) = *(_OWORD *)(a2 + 42);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SymbolIconView.SymbolIconMetrics.Input(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  return a1;
}

uint64_t getEnumTagSinglePayload for SymbolIconView.SymbolIconMetrics.Input(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 58))
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

uint64_t storeEnumTagSinglePayload for SymbolIconView.SymbolIconMetrics.Input(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 56) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 58) = 1;
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
    *(_BYTE *)(result + 58) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void destroy for ImageIconView(id *a1)
{

}

uint64_t initializeWithCopy for ImageIconView(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = v3;
  return a1;
}

uint64_t assignWithCopy for ImageIconView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  __int128 v7;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = v7;
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

uint64_t assignWithTake for ImageIconView(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for ImageIconView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 25))
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

uint64_t storeEnumTagSinglePayload for ImageIconView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 25) = 1;
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
    *(_BYTE *)(result + 25) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t destroy for WorkflowGlyphIconView(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if ((unint64_t)v2 >= 2)

  return sub_20CE158B0(*(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 56));
}

uint64_t initializeWithCopy for WorkflowGlyphIconView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  char v10;

  v4 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v6 = a2 + 32;
  v5 = *(void **)(a2 + 32);
  v7 = v4;
  if ((unint64_t)v5 >= 2)
  {
    *(_QWORD *)(a1 + 32) = v5;
    *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
    v8 = v5;
  }
  else
  {
    *(_QWORD *)(a1 + 32) = *(_QWORD *)v6;
    *(_BYTE *)(a1 + 40) = *(_BYTE *)(v6 + 8);
  }
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_BYTE *)(a2 + 56);
  sub_20CE15B98(v9, v10);
  *(_QWORD *)(a1 + 48) = v9;
  *(_BYTE *)(a1 + 56) = v10;
  return a1;
}

uint64_t assignWithCopy for WorkflowGlyphIconView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  char v13;
  id v14;
  id v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(_OWORD *)(a2 + 8);
  v8 = (_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 32);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = v7;
  v11 = (_QWORD *)(a2 + 32);
  v10 = *(void **)(a2 + 32);
  if ((unint64_t)v9 >= 2)
  {
    if ((unint64_t)v10 >= 2)
    {
      *(_QWORD *)(a1 + 32) = v10;
      v15 = v10;

      *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
    }
    else
    {
      sub_20CE21AE0(a1 + 32, &qword_2549969B8);
      v13 = *(_BYTE *)(a2 + 40);
      *v8 = *v11;
      *(_BYTE *)(a1 + 40) = v13;
    }
  }
  else if ((unint64_t)v10 >= 2)
  {
    *(_QWORD *)(a1 + 32) = v10;
    *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
    v14 = v10;
  }
  else
  {
    v12 = *v11;
    *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
    *v8 = v12;
  }
  v16 = *(_QWORD *)(a2 + 48);
  v17 = *(_BYTE *)(a2 + 56);
  sub_20CE15B98(v16, v17);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_BYTE *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = v16;
  *(_BYTE *)(a1 + 56) = v17;
  sub_20CE158B0(v18, v19);
  return a1;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for WorkflowGlyphIconView(uint64_t a1, uint64_t a2)
{
  void *v4;
  unint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  char v9;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  v5 = *(_QWORD *)(a2 + 32);
  v6 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  if ((unint64_t)v6 >= 2)
  {
    if (v5 >= 2)
    {
      *(_QWORD *)(a1 + 32) = v5;

      *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
      goto LABEL_6;
    }
    sub_20CE21AE0(a1 + 32, &qword_2549969B8);
  }
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
LABEL_6:
  v7 = *(_BYTE *)(a2 + 56);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_BYTE *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = v7;
  sub_20CE158B0(v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkflowGlyphIconView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 57))
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

uint64_t storeEnumTagSinglePayload for WorkflowGlyphIconView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 56) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 57) = 1;
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
    *(_BYTE *)(result + 57) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t assignWithCopy for SymbolIconView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  char v13;
  id v14;
  id v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  unsigned __int8 v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(_OWORD *)(a2 + 8);
  v8 = (_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 32);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = v7;
  v11 = (_QWORD *)(a2 + 32);
  v10 = *(void **)(a2 + 32);
  if ((unint64_t)v9 >= 2)
  {
    if ((unint64_t)v10 >= 2)
    {
      *(_QWORD *)(a1 + 32) = v10;
      v15 = v10;

      *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
    }
    else
    {
      sub_20CE21AE0(a1 + 32, &qword_2549969B8);
      v13 = *(_BYTE *)(a2 + 40);
      *v8 = *v11;
      *(_BYTE *)(a1 + 40) = v13;
    }
  }
  else if ((unint64_t)v10 >= 2)
  {
    *(_QWORD *)(a1 + 32) = v10;
    *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
    v14 = v10;
  }
  else
  {
    v12 = *v11;
    *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
    *v8 = v12;
  }
  v16 = *(_QWORD *)(a2 + 48);
  v17 = *(_BYTE *)(a2 + 56);
  sub_20CE15B98(v16, v17);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_BYTE *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = v16;
  *(_BYTE *)(a1 + 56) = v17;
  sub_20CE158B0(v18, v19);
  v20 = *(_QWORD *)(a2 + 64);
  v21 = *(_BYTE *)(a2 + 73);
  v22 = *(_BYTE *)(a2 + 72);
  sub_20CE15BA4(v20, v22, v21);
  v23 = *(_QWORD *)(a1 + 64);
  v24 = *(_BYTE *)(a1 + 73);
  *(_QWORD *)(a1 + 64) = v20;
  v25 = *(unsigned __int8 *)(a1 + 72);
  *(_BYTE *)(a1 + 72) = v22;
  *(_BYTE *)(a1 + 73) = v21;
  sub_20CE158BC(v23, v25, v24);
  v26 = *(_QWORD *)(a2 + 80);
  v27 = *(_BYTE *)(a2 + 88);
  sub_20CE15B98(v26, v27);
  v28 = *(_QWORD *)(a1 + 80);
  v29 = *(_BYTE *)(a1 + 88);
  *(_QWORD *)(a1 + 80) = v26;
  *(_BYTE *)(a1 + 88) = v27;
  sub_20CE158B0(v28, v29);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy112_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

uint64_t assignWithTake for SymbolIconView(uint64_t a1, uint64_t a2)
{
  void *v4;
  unint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  char v9;
  char v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  v5 = *(_QWORD *)(a2 + 32);
  v6 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  if ((unint64_t)v6 >= 2)
  {
    if (v5 >= 2)
    {
      *(_QWORD *)(a1 + 32) = v5;

      *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
      goto LABEL_6;
    }
    sub_20CE21AE0(a1 + 32, &qword_2549969B8);
  }
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
LABEL_6:
  v7 = *(_BYTE *)(a2 + 56);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_BYTE *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = v7;
  sub_20CE158B0(v8, v9);
  v10 = *(_BYTE *)(a2 + 72);
  v11 = *(_BYTE *)(a2 + 73);
  v12 = *(_QWORD *)(a1 + 64);
  v13 = *(_BYTE *)(a1 + 73);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v14 = *(unsigned __int8 *)(a1 + 72);
  *(_BYTE *)(a1 + 72) = v10;
  *(_BYTE *)(a1 + 73) = v11;
  sub_20CE158BC(v12, v14, v13);
  v15 = *(_BYTE *)(a2 + 88);
  v16 = *(_QWORD *)(a1 + 80);
  v17 = *(_BYTE *)(a1 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = v15;
  sub_20CE158B0(v16, v17);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_release();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SymbolIconView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 112))
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

uint64_t storeEnumTagSinglePayload for SymbolIconView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 112) = 1;
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
    *(_BYTE *)(result + 112) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s23SymbolIconFontWeightKeyVMa()
{
  return &_s23SymbolIconFontWeightKeyVN;
}

uint64_t destroy for RoundedImageView(uint64_t a1)
{

  sub_20CE158B0(*(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 56));
  j__swift_release();
  return sub_20CE158B0(*(_QWORD *)(a1 + 80), *(_BYTE *)(a1 + 88));
}

uint64_t initializeWithCopy for RoundedImageView(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  id v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v2 = a2;
  v4 = *(void **)a2;
  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v7 = *(_BYTE *)(a2 + 56);
  v8 = v4;
  sub_20CE15B98(v6, v7);
  *(_QWORD *)(a1 + 48) = v6;
  *(_BYTE *)(a1 + 56) = v7;
  v9 = *(_QWORD *)(v2 + 64);
  v10 = *(_BYTE *)(v2 + 72);
  j__swift_retain();
  *(_QWORD *)(a1 + 64) = v9;
  *(_BYTE *)(a1 + 72) = v10;
  v11 = *(_QWORD *)(v2 + 80);
  LOBYTE(v2) = *(_BYTE *)(v2 + 88);
  sub_20CE15B98(v11, v2);
  *(_QWORD *)(a1 + 80) = v11;
  *(_BYTE *)(a1 + 88) = v2;
  return a1;
}

uint64_t assignWithCopy for RoundedImageView(uint64_t a1, void **a2)
{
  void **v2;
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v2 = a2;
  v4 = *(void **)a1;
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = v2[1];
  v7 = *((_OWORD *)v2 + 1);
  *(_BYTE *)(a1 + 32) = *((_BYTE *)v2 + 32);
  *(_OWORD *)(a1 + 16) = v7;
  *(_BYTE *)(a1 + 33) = *((_BYTE *)v2 + 33);
  *(_QWORD *)(a1 + 40) = v2[5];
  v8 = (uint64_t)v2[6];
  v9 = *((_BYTE *)v2 + 56);
  sub_20CE15B98(v8, v9);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_BYTE *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = v8;
  *(_BYTE *)(a1 + 56) = v9;
  sub_20CE158B0(v10, v11);
  v12 = v2[8];
  v13 = *((_BYTE *)v2 + 72);
  j__swift_retain();
  *(_QWORD *)(a1 + 64) = v12;
  *(_BYTE *)(a1 + 72) = v13;
  j__swift_release();
  v14 = (uint64_t)v2[10];
  LOBYTE(v2) = *((_BYTE *)v2 + 88);
  sub_20CE15B98(v14, (char)v2);
  v15 = *(_QWORD *)(a1 + 80);
  v16 = *(_BYTE *)(a1 + 88);
  *(_QWORD *)(a1 + 80) = v14;
  *(_BYTE *)(a1 + 88) = (_BYTE)v2;
  sub_20CE158B0(v15, v16);
  return a1;
}

void *__swift_memcpy89_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x59uLL);
}

uint64_t assignWithTake for RoundedImageView(uint64_t a1, uint64_t a2)
{
  void *v4;
  char v5;
  uint64_t v6;
  char v7;
  char v8;
  char v9;
  uint64_t v10;
  char v11;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  v5 = *(_BYTE *)(a2 + 56);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_BYTE *)(a1 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 56) = v5;
  sub_20CE158B0(v6, v7);
  v8 = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = v8;
  j__swift_release();
  v9 = *(_BYTE *)(a2 + 88);
  v10 = *(_QWORD *)(a1 + 80);
  v11 = *(_BYTE *)(a1 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = v9;
  sub_20CE158B0(v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for RoundedImageView(uint64_t *a1, unsigned int a2)
{
  int v2;
  uint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 89))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RoundedImageView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 88) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 89) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 89) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for RoundedImageView()
{
  return &type metadata for RoundedImageView;
}

uint64_t sub_20CE2CC40()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20CE2CC50()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20CE2CC60()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_20CE2CC70()
{
  sub_20CE2D6DC((uint64_t)&unk_254996A00);
}

unint64_t sub_20CE2CC94()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_254996A08;
  if (!qword_254996A08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549969F0);
    sub_20CE2BB64((uint64_t)&unk_254996A10);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254996A08);
  }
  return result;
}

unint64_t sub_20CE2CD20()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_254996A18;
  if (!qword_254996A18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996A20);
    v2 = sub_20CE2CDA4();
    sub_20CE18AAC((uint64_t)&unk_253CFA3A8);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_254996A18);
  }
  return result;
}

unint64_t sub_20CE2CDA4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_254996A28;
  if (!qword_254996A28)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996A30);
    sub_20CE2D6DC((uint64_t)&unk_254996A38);
    v3 = v2;
    sub_20CE18AAC((uint64_t)&unk_254996AC0);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_254996A28);
  }
  return result;
}

unint64_t sub_20CE2CE48()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_254996A48;
  if (!qword_254996A48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996A50);
    v2 = sub_20CE2CECC();
    sub_20CE18AAC((uint64_t)&unk_254996AB0);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_254996A48);
  }
  return result;
}

unint64_t sub_20CE2CECC()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_254996A58;
  if (!qword_254996A58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996A60);
    v2 = sub_20CE2CF50();
    sub_20CE18AAC((uint64_t)&unk_254996AA8);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_254996A58);
  }
  return result;
}

unint64_t sub_20CE2CF50()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_254996A68;
  if (!qword_254996A68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996A70);
    v2 = sub_20CE2CFD4();
    sub_20CE18AAC((uint64_t)&unk_254996A98);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_254996A68);
  }
  return result;
}

unint64_t sub_20CE2CFD4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_254996A78;
  if (!qword_254996A78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996A80);
    sub_20CE2D6DC((uint64_t)&qword_253CFA318);
    v3 = v2;
    sub_20CE18AAC((uint64_t)&unk_254996A88);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_254996A78);
  }
  return result;
}

unint64_t sub_20CE2D078()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_253CFA2E0;
  if (!qword_253CFA2E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253CFA2F0);
    v2[0] = MEMORY[0x24BDF40E8];
    v2[1] = MEMORY[0x24BDEEC40];
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_253CFA2E0);
  }
  return result;
}

void sub_20CE2D0DC()
{
  sub_20CE2D6DC((uint64_t)&unk_253CFA308);
}

unint64_t sub_20CE2D100()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_253CFA2B0;
  if (!qword_253CFA2B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253CFA2B8);
    sub_20CE1EE3C((uint64_t)&unk_253CFA338);
    v3 = v2;
    sub_20CE18AAC((uint64_t)&unk_253CFA3D0);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_253CFA2B0);
  }
  return result;
}

void sub_20CE2D19C()
{
  sub_20CE2D6DC((uint64_t)&unk_254996AD0);
}

unint64_t sub_20CE2D1C8()
{
  unint64_t result;

  result = qword_2549971F0;
  if (!qword_2549971F0)
  {
    result = MEMORY[0x212B97A80](MEMORY[0x24BDF4440], MEMORY[0x24BDF4458]);
    atomic_store(result, (unint64_t *)&qword_2549971F0);
  }
  return result;
}

uint64_t type metadata accessor for BlendedBorderView()
{
  uint64_t result;

  result = qword_253CFA168;
  if (!qword_253CFA168)
    return swift_getSingletonMetadata();
  return result;
}

void sub_20CE2D24C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = a3(0);
  OUTLINED_FUNCTION_28_0(v3);
  OUTLINED_FUNCTION_4();
}

unint64_t sub_20CE2D27C()
{
  unint64_t result;

  result = qword_254996B08;
  if (!qword_254996B08)
  {
    result = MEMORY[0x212B97A80](MEMORY[0x24BDF1720], MEMORY[0x24BDF1718]);
    atomic_store(result, (unint64_t *)&qword_254996B08);
  }
  return result;
}

uint64_t sub_20CE2D2B8()
{
  uint64_t v0;
  void *v1;

  OUTLINED_FUNCTION_72();
  v1 = *(void **)(v0 + 48);
  if ((unint64_t)v1 >= 2)

  OUTLINED_FUNCTION_73();
  sub_20CE158BC(*(_QWORD *)(v0 + 80), *(unsigned __int8 *)(v0 + 88), *(_BYTE *)(v0 + 89));
  sub_20CE158B0(*(_QWORD *)(v0 + 96), *(_BYTE *)(v0 + 104));
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20CE2D318()
{
  uint64_t v0;
  void *v1;

  OUTLINED_FUNCTION_72();
  v1 = *(void **)(v0 + 48);
  if ((unint64_t)v1 >= 2)

  OUTLINED_FUNCTION_73();
  return swift_deallocObject();
}

void sub_20CE2D34C(uint64_t *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  uint64_t v3;

  sub_20CE26750(v3 + 16, a1, a2, a3);
}

uint64_t sub_20CE2D354(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_BYTE *)(a1 + 56);
  v5 = *(id *)a1;
  sub_20CE15F58(v2);
  sub_20CE15B98(v3, v4);
  return a1;
}

uint64_t sub_20CE2D3B4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_BYTE *)(a1 + 56);

  sub_20CE17348(v2);
  sub_20CE158B0(v3, v4);
  return a1;
}

uint64_t sub_20CE2D414(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_20CE1ED64(a1, a2);
  return a1;
}

void sub_20CE2D428(id a1, char a2)
{
  if ((a2 & 1) != 0)

  else
    swift_release();
}

void sub_20CE2D434(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_20CE26A30(*(_QWORD *)(v1 + 32), *(void **)(v1 + 56), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1, *(double *)(v1 + 40), *(double *)(v1 + 48));
}

unint64_t sub_20CE2D448()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_254996B40;
  if (!qword_254996B40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996B48);
    v2 = sub_20CE2D4CC();
    sub_20CE1EE3C((uint64_t)&unk_253CFA338);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDEF3E0], v1, v4);
    atomic_store(result, (unint64_t *)&qword_254996B40);
  }
  return result;
}

unint64_t sub_20CE2D4CC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_254996B50;
  if (!qword_254996B50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996B58);
    sub_20CE18AAC((uint64_t)&unk_254996B60);
    v3 = v2;
    sub_20CE2D6DC((uint64_t)&unk_254996B70);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDEF3E0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_254996B50);
  }
  return result;
}

unint64_t sub_20CE2D570()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_254996B78;
  if (!qword_254996B78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2549970B0);
    sub_20CE2D7C4((uint64_t)&unk_254996B80);
    v3 = v2;
    sub_20CE18AAC((uint64_t)&unk_254996B98);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_254996B78);
  }
  return result;
}

void sub_20CE2D614()
{
  sub_20CE2BB64((uint64_t)&unk_254996BA0);
}

unint64_t sub_20CE2D638()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_254996BB0;
  if (!qword_254996BB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996BB8);
    sub_20CE18AAC((uint64_t)&unk_254996BC0);
    v3 = v2;
    sub_20CE2D6DC((uint64_t)&unk_254996BD0);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDEF3E0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_254996BB0);
  }
  return result;
}

void sub_20CE2D6DC(uint64_t a1)
{
  uint64_t *v1;

  if (!OUTLINED_FUNCTION_48(a1))
  {
    OUTLINED_FUNCTION_4_0(0, v1);
    OUTLINED_FUNCTION_66_0();
    OUTLINED_FUNCTION_10();
  }
  OUTLINED_FUNCTION_46();
}

unint64_t sub_20CE2D720()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_254996BE0;
  if (!qword_254996BE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996848);
    sub_20CE2D7C4((uint64_t)&unk_254996BE8);
    v3 = v2;
    sub_20CE18AAC((uint64_t)&unk_254996C00);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_254996BE0);
  }
  return result;
}

void sub_20CE2D7C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;

  if (!OUTLINED_FUNCTION_48(a1))
  {
    OUTLINED_FUNCTION_4_0(0, v2);
    sub_20CE18AAC(v1);
    OUTLINED_FUNCTION_10();
  }
  OUTLINED_FUNCTION_46();
}

unint64_t sub_20CE2D824()
{
  unint64_t result;

  result = qword_254996C10;
  if (!qword_254996C10)
  {
    result = MEMORY[0x212B97A80](MEMORY[0x24BDF52D0], MEMORY[0x24BDF52F8]);
    atomic_store(result, (unint64_t *)&qword_254996C10);
  }
  return result;
}

unint64_t sub_20CE2D868()
{
  unint64_t result;

  result = qword_254996C48;
  if (!qword_254996C48)
  {
    result = MEMORY[0x212B97A80](&unk_20CE6BA8C, &type metadata for SymbolIconView.SymbolIconMetrics.Input);
    atomic_store(result, (unint64_t *)&qword_254996C48);
  }
  return result;
}

_QWORD *sub_20CE2D8A4(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = (void *)a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    *(_QWORD *)(a1 + 24) = a2[3];
    *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
    v8 = a3[8];
    v9 = (_QWORD *)(a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    *(_QWORD *)(a1 + 40) = a2[5];
    v11 = v7;
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_20CE66E4C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v9, v10, v12);
    }
    else
    {
      *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v14 = a3[9];
    v15 = (char *)v4 + v14;
    v16 = (uint64_t)a2 + v14;
    v17 = *(_QWORD *)v16;
    v18 = *(_BYTE *)(v16 + 8);
    sub_20CE15B98(*(_QWORD *)v16, v18);
    *(_QWORD *)v15 = v17;
    v15[8] = v18;
    v19 = a3[10];
    v20 = (char *)v4 + v19;
    v21 = (uint64_t)a2 + v19;
    v22 = *(_QWORD *)v21;
    v23 = *(_BYTE *)(v21 + 8);
    sub_20CE15B98(*(_QWORD *)v21, v23);
    *(_QWORD *)v20 = v22;
    v20[8] = v23;
  }
  return v4;
}

uint64_t sub_20CE2DA10(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  swift_release();
  v4 = a1 + a2[8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_20CE66E4C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  sub_20CE158B0(*(_QWORD *)(a1 + a2[9]), *(_BYTE *)(a1 + a2[9] + 8));
  return sub_20CE158B0(*(_QWORD *)(a1 + a2[10]), *(_BYTE *)(a1 + a2[10] + 8));
}

uint64_t sub_20CE2DAC4(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  v6 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v7 = a3[8];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v10 = v6;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_20CE66E4C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v8, v9, v11);
  }
  else
  {
    *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v12 = a3[9];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = *(_QWORD *)v14;
  v16 = *(_BYTE *)(v14 + 8);
  sub_20CE15B98(*(_QWORD *)v14, v16);
  *(_QWORD *)v13 = v15;
  *(_BYTE *)(v13 + 8) = v16;
  v17 = a3[10];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = *(_QWORD *)v19;
  v21 = *(_BYTE *)(v19 + 8);
  sub_20CE15B98(*(_QWORD *)v19, v21);
  *(_QWORD *)v18 = v20;
  *(_BYTE *)(v18 + 8) = v21;
  return a1;
}

uint64_t sub_20CE2DC04(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = *(void **)(a2 + 8);
  v7 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v6;
  v8 = v6;

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v9 = a3[8];
    v10 = (_QWORD *)(a1 + v9);
    v11 = (_QWORD *)(a2 + v9);
    sub_20CE21AE0(a1 + v9, &qword_253CFA240);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_20CE66E4C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v13 = a3[9];
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = *(_QWORD *)v15;
  v17 = *(_BYTE *)(v15 + 8);
  sub_20CE15B98(*(_QWORD *)v15, v17);
  v18 = *(_QWORD *)v14;
  v19 = *(_BYTE *)(v14 + 8);
  *(_QWORD *)v14 = v16;
  *(_BYTE *)(v14 + 8) = v17;
  sub_20CE158B0(v18, v19);
  v20 = a3[10];
  v21 = a1 + v20;
  v22 = a2 + v20;
  v23 = *(_QWORD *)v22;
  v24 = *(_BYTE *)(v22 + 8);
  sub_20CE15B98(*(_QWORD *)v22, v24);
  v25 = *(_QWORD *)v21;
  v26 = *(_BYTE *)(v21 + 8);
  *(_QWORD *)v21 = v23;
  *(_BYTE *)(v21 + 8) = v24;
  sub_20CE158B0(v25, v26);
  return a1;
}

uint64_t sub_20CE2DD8C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  v7 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v7;
  v8 = a3[8];
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v12 = sub_20CE66E4C();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  v13 = a3[9];
  v14 = a3[10];
  v15 = a1 + v13;
  v16 = a2 + v13;
  *(_QWORD *)v15 = *(_QWORD *)v16;
  *(_BYTE *)(v15 + 8) = *(_BYTE *)(v16 + 8);
  v17 = a1 + v14;
  v18 = a2 + v14;
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *(_BYTE *)(v17 + 8) = *(_BYTE *)(v18 + 8);
  return a1;
}

uint64_t sub_20CE2DE80(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release();
  if (a1 != a2)
  {
    v7 = a3[8];
    v8 = (void *)(a1 + v7);
    v9 = (const void *)(a2 + v7);
    sub_20CE21AE0(a1 + v7, &qword_253CFA240);
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v11 = sub_20CE66E4C();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
  }
  v12 = a3[9];
  v13 = a1 + v12;
  v14 = (uint64_t *)(a2 + v12);
  v15 = *v14;
  LOBYTE(v14) = *((_BYTE *)v14 + 8);
  v16 = *(_QWORD *)v13;
  v17 = *(_BYTE *)(v13 + 8);
  *(_QWORD *)v13 = v15;
  *(_BYTE *)(v13 + 8) = (_BYTE)v14;
  sub_20CE158B0(v16, v17);
  v18 = a3[10];
  v19 = a1 + v18;
  v20 = (uint64_t *)(a2 + v18);
  v21 = *v20;
  LOBYTE(v20) = *((_BYTE *)v20 + 8);
  v22 = *(_QWORD *)v19;
  v23 = *(_BYTE *)(v19 + 8);
  *(_QWORD *)v19 = v21;
  *(_BYTE *)(v19 + 8) = (_BYTE)v20;
  sub_20CE158B0(v22, v23);
  return a1;
}

uint64_t sub_20CE2DFE0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_20CE2DFEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    OUTLINED_FUNCTION_67(*(_QWORD *)(a1 + 8));
    OUTLINED_FUNCTION_21();
  }
  else
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996450);
    OUTLINED_FUNCTION_14(a1 + *(int *)(a3 + 32), a2, v6);
  }
}

uint64_t sub_20CE2E048()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_20CE2E054()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_65_0();
  if (v3)
  {
    *(_QWORD *)(v1 + 8) = (v0 - 1);
    OUTLINED_FUNCTION_21();
  }
  else
  {
    v4 = v2;
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996450);
    OUTLINED_FUNCTION_26_0(v1 + *(int *)(v4 + 32), v0, v0, v5);
  }
}

void sub_20CE2E0A8()
{
  unint64_t v0;

  sub_20CE12734(319, (unint64_t *)&qword_253CFA248, (void (*)(uint64_t))MEMORY[0x24BDEB418]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_20CE2E154()
{
  sub_20CE2BB64((uint64_t)&unk_254996C50);
}

void sub_20CE2E188()
{
  sub_20CE18AAC((uint64_t)&unk_253CFA208);
}

void sub_20CE2E1B4()
{
  sub_20CE18AAC((uint64_t)&unk_254996C60);
}

void sub_20CE2E1E0()
{
  sub_20CE1981C((uint64_t)&unk_253CFA160);
}

uint64_t sub_20CE2E214()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20CE2E228(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for BlendedBorderView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_20CE2E270()
{
  sub_20CE1981C((uint64_t)&unk_253CFA2D8);
}

unint64_t sub_20CE2E294()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_253CFA2C0;
  if (!qword_253CFA2C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253CFA2C8);
    sub_20CE18AAC((uint64_t)&unk_253CFA398);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDEDB58];
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_253CFA2C0);
  }
  return result;
}

uint64_t objectdestroy_70Tm()
{
  uint64_t v0;

  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_71();
  OUTLINED_FUNCTION_70();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
  if (OUTLINED_FUNCTION_42_0() == 1)
  {
    v0 = OUTLINED_FUNCTION_57_0();
    OUTLINED_FUNCTION_9_0(v0);
  }
  else
  {
    OUTLINED_FUNCTION_69();
  }
  OUTLINED_FUNCTION_2_0();
  return OUTLINED_FUNCTION_1_0();
}

void sub_20CE2E398()
{
  OUTLINED_FUNCTION_18_0();
  sub_20CE283EC();
  OUTLINED_FUNCTION_4();
}

uint64_t sub_20CE2E3C8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_71();
  OUTLINED_FUNCTION_70();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
  if (OUTLINED_FUNCTION_42_0() == 1)
  {
    v0 = OUTLINED_FUNCTION_57_0();
    OUTLINED_FUNCTION_9_0(v0);
  }
  else
  {
    OUTLINED_FUNCTION_69();
  }
  OUTLINED_FUNCTION_2_0();
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_20CE2E430()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_18_0() - 8) + 80);
  v3 = v0 + ((v2 + 32) & ~v2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  v5 = OUTLINED_FUNCTION_61_0(v4);
  return sub_20CE28528(v5, v6, v7, v3);
}

uint64_t sub_20CE2E4A0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_13_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20CE2E4CC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20CE2E4F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_71();
  OUTLINED_FUNCTION_70();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
  if (OUTLINED_FUNCTION_42_0() == 1)
  {
    v2 = OUTLINED_FUNCTION_57_0();
    OUTLINED_FUNCTION_9_0(v2);
  }
  else
  {
    OUTLINED_FUNCTION_69();
  }
  sub_20CE158B0(*(_QWORD *)(v1 + *(int *)(v0 + 36)), *(_BYTE *)(v1 + *(int *)(v0 + 36) + 8));
  sub_20CE158B0(*(_QWORD *)(v1 + *(int *)(v0 + 40)), *(_BYTE *)(v1 + *(int *)(v0 + 40) + 8));
  return OUTLINED_FUNCTION_1_0();
}

uint64_t sub_20CE2E594()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  char *v5;
  char v6;
  char v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(OUTLINED_FUNCTION_18_0() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v0 + v3;
  v5 = (char *)(v0 + *(_QWORD *)(v2 + 64) + v3);
  v6 = *v5;
  v7 = v5[1];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v8;
  v9 = OUTLINED_FUNCTION_61_0(v8);
  return sub_20CE28F3C(v9, v10, v11, v4, v6, v7);
}

void sub_20CE2E628(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_35(a1, a2, a3);
  OUTLINED_FUNCTION_28_0(v3);
  OUTLINED_FUNCTION_4();
}

unint64_t sub_20CE2E64C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[6];

  result = qword_254996C98;
  if (!qword_254996C98)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996C70);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253CFA408);
    v3 = sub_20CE66E4C();
    sub_20CE1981C((uint64_t)&unk_253CFA400);
    v5 = v4;
    sub_20CE1EE3C((uint64_t)&unk_253CFA228);
    v7[2] = v2;
    v7[3] = v3;
    v7[4] = v5;
    v7[5] = v6;
    v7[0] = swift_getOpaqueTypeConformance2();
    v7[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v7);
    atomic_store(result, (unint64_t *)&qword_254996C98);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_20CE158B0(*(_QWORD *)(v2 + *(int *)(v0 + 36)), *(_BYTE *)(v2 + *(int *)(v0 + 36) + 8));
  sub_20CE158B0(*(_QWORD *)(v2 + *(int *)(v0 + 40)), *(_BYTE *)(v2 + *(int *)(v0 + 40) + 8));
  return v1;
}

uint64_t OUTLINED_FUNCTION_4_0(uint64_t a1, uint64_t *a2)
{
  return __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
}

void OUTLINED_FUNCTION_6()
{
  JUMPOUT(0x212B97A80);
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_9_0(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

void OUTLINED_FUNCTION_10()
{
  JUMPOUT(0x212B97A80);
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return sub_20CE671F4();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_14_0()
{
  JUMPOUT(0x212B97B1CLL);
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v0 + 24) + 16))(*(_QWORD *)(v0 + 32), v2, v1);
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return sub_20CE67200();
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return type metadata accessor for BlendedBorderView();
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return sub_20CE678D8();
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  uint64_t v0;

  return v0;
}

double OUTLINED_FUNCTION_25_0()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_BYTE *)(v0 + 40);
  sub_20CE15B98(v1, v2);
  return sub_20CE17F3C(v1, v2);
}

uint64_t OUTLINED_FUNCTION_26_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_28_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return sub_20CE678B4();
}

void OUTLINED_FUNCTION_30_0()
{
  uint64_t v0;
  uint64_t v1;

}

void *OUTLINED_FUNCTION_32_0(uint64_t a1)
{
  uint64_t v1;

  return memcpy((void *)(a1 + 16), (const void *)(v1 + 88), 0x71uLL);
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

void OUTLINED_FUNCTION_36_0(id a1)
{
  sub_20CE17348(a1);
}

void *OUTLINED_FUNCTION_37_0(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x71uLL);
}

void OUTLINED_FUNCTION_38_0(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 8) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_43_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  uint64_t v0;
  char v1;

  return sub_20CE158B0(v0, v1);
}

uint64_t OUTLINED_FUNCTION_45_0()
{
  return swift_getOpaqueTypeConformance2();
}

double OUTLINED_FUNCTION_48_0()
{
  uint64_t v0;
  char v1;

  sub_20CE15B98(v0, v1);
  return sub_20CE17F3C(v0, v1);
}

void *OUTLINED_FUNCTION_49_0()
{
  void *v0;
  void *v1;

  sub_20CE15F58(v0);
  sub_20CE15F58(v1);
  return v1;
}

uint64_t OUTLINED_FUNCTION_50_0()
{
  uint64_t (*v0)(uint64_t, uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return v0(v3, v2, v1);
}

uint64_t OUTLINED_FUNCTION_51_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_20CE21860(v2, a2);
}

uint64_t OUTLINED_FUNCTION_52_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_57_0()
{
  return sub_20CE66E4C();
}

uint64_t OUTLINED_FUNCTION_58_0(uint64_t a1, unint64_t *a2)
{
  return sub_20CE15F68(0, a2);
}

uint64_t OUTLINED_FUNCTION_59_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return sub_20CE2E228(v1, a1 + v2);
}

uint64_t OUTLINED_FUNCTION_61_0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_62_0()
{
  return sub_20CE66F90();
}

id OUTLINED_FUNCTION_63_0(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_64_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_66_0()
{
  uint64_t (*v0)(void);

  return v0();
}

uint64_t OUTLINED_FUNCTION_67_0()
{
  return sub_20CE678E4();
}

uint64_t OUTLINED_FUNCTION_69()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_70()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_71()
{
  return swift_release();
}

void OUTLINED_FUNCTION_72()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_73()
{
  uint64_t v0;

  return sub_20CE158B0(*(_QWORD *)(v0 + 64), *(_BYTE *)(v0 + 72));
}

void OUTLINED_FUNCTION_74()
{
  JUMPOUT(0x212B97A80);
}

void OUTLINED_FUNCTION_75()
{
  EnvironmentValues.clipsCorners.setter();
}

void OUTLINED_FUNCTION_76()
{
  JUMPOUT(0x212B97A80);
}

uint64_t OUTLINED_FUNCTION_77(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_78()
{
  uint64_t v0;
  char v1;

  return sub_20CE158B0(v0, v1);
}

uint64_t OUTLINED_FUNCTION_79@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_80()
{
  return sub_20CE678C0();
}

uint64_t OUTLINED_FUNCTION_82()
{
  return sub_20CE67560();
}

uint64_t OUTLINED_FUNCTION_85(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_86()
{
  return 255;
}

uint64_t OUTLINED_FUNCTION_87()
{
  return sub_20CE67080();
}

uint64_t OUTLINED_FUNCTION_88()
{
  return EnvironmentValues.clipsCorners.getter();
}

uint64_t OUTLINED_FUNCTION_89()
{
  return sub_20CE67074();
}

BOOL static EnvironmentValues.MaskShapeContext.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t EnvironmentValues.maskShapeContext.getter()
{
  unint64_t v0;

  v0 = sub_20CE12918();
  OUTLINED_FUNCTION_6_0(v0, (uint64_t)&_s19MaskShapeContextKeyVN);
  return OUTLINED_FUNCTION_0_1();
}

void sub_20CE2EC64()
{
  OUTLINED_FUNCTION_12_1();
  EnvironmentValues.maskShapeContext.setter();
  OUTLINED_FUNCTION_1_1();
}

void EnvironmentValues.maskShapeContext.setter()
{
  sub_20CE12918();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_8_0();
}

uint64_t EnvironmentValues.iconViewBorderStyle.getter()
{
  unint64_t v0;

  v0 = sub_20CE2ECE0();
  OUTLINED_FUNCTION_6_0(v0, (uint64_t)&_s22IconViewBorderStyleKeyVN);
  return OUTLINED_FUNCTION_0_1();
}

unint64_t sub_20CE2ECE0()
{
  unint64_t result;

  result = qword_254996CC8;
  if (!qword_254996CC8)
  {
    result = MEMORY[0x212B97A80](&unk_20CE6BFC4, &_s22IconViewBorderStyleKeyVN);
    atomic_store(result, (unint64_t *)&qword_254996CC8);
  }
  return result;
}

void sub_20CE2ED1C(_BYTE *a1@<X8>)
{
  char v2;

  EnvironmentValues.iconViewBorderStyle.getter();
  *a1 = v2;
  OUTLINED_FUNCTION_1_1();
}

void sub_20CE2ED4C()
{
  OUTLINED_FUNCTION_12_1();
  EnvironmentValues.iconViewBorderStyle.setter();
  OUTLINED_FUNCTION_1_1();
}

void EnvironmentValues.iconViewBorderStyle.setter()
{
  sub_20CE2ECE0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_8_0();
}

void EnvironmentValues.iconViewBorderStyle.modify(_QWORD *a1)
{
  uint64_t v1;

  *a1 = v1;
  a1[1] = sub_20CE2ECE0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_21();
}

void sub_20CE2EDEC(uint64_t a1)
{
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a1 + 16);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4();
}

void sub_20CE2EE18(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t EnvironmentValues.clipsCorners.getter()
{
  unsigned __int8 v1;

  sub_20CE17100();
  OUTLINED_FUNCTION_3_0();
  return v1;
}

void EnvironmentValues.clipsCorners.setter()
{
  sub_20CE17100();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_8_0();
}

void EnvironmentValues.clipsCorners.modify(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = sub_20CE17100();
  OUTLINED_FUNCTION_3_0();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a1 + 17);
  OUTLINED_FUNCTION_21();
}

void sub_20CE2EEDC(uint64_t a1)
{
  sub_20CE2EF58(a1);
}

void *sub_20CE2EEE8()
{
  return &unk_254996CA0;
}

uint64_t sub_20CE2EEF4()
{
  return sub_20CE66F18();
}

void EnvironmentValues.maskShapeContext.modify(_QWORD *a1)
{
  uint64_t v1;

  *a1 = v1;
  a1[1] = sub_20CE12918();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_21();
}

void sub_20CE2EF4C(uint64_t a1)
{
  sub_20CE2EF58(a1);
}

void sub_20CE2EF58(uint64_t a1)
{
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a1 + 16);
  sub_20CE67164();
  OUTLINED_FUNCTION_4();
}

void EnvironmentValues.MaskShapeContext.hash(into:)()
{
  sub_20CE678C0();
  OUTLINED_FUNCTION_4();
}

uint64_t EnvironmentValues.MaskShapeContext.hashValue.getter()
{
  sub_20CE678B4();
  sub_20CE678C0();
  return sub_20CE678E4();
}

uint64_t sub_20CE2EFF4()
{
  sub_20CE678B4();
  sub_20CE678C0();
  return sub_20CE678E4();
}

void *sub_20CE2F034()
{
  return &unk_254996CA1;
}

uint64_t sub_20CE2F040()
{
  sub_20CE2F494();
  return sub_20CE66F18();
}

uint64_t EnvironmentValues.iconBlendMode.getter()
{
  unint64_t v0;

  v0 = sub_20CE170C4();
  OUTLINED_FUNCTION_6_0(v0, (uint64_t)&_s16IconBlendModeKeyVN);
  return OUTLINED_FUNCTION_0_1();
}

uint64_t EnvironmentValues.iconBlendMode.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __n128 v4;
  uint64_t v5;
  uint64_t v7;

  v2 = OUTLINED_FUNCTION_5_0();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v3 + 16))((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2, v4);
  sub_20CE170C4();
  OUTLINED_FUNCTION_4_1();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void EnvironmentValues.iconBlendMode.modify(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = OUTLINED_FUNCTION_5_0();
  v3[1] = v4;
  v3[2] = *(_QWORD *)(v4 - 8);
  v3[3] = OUTLINED_FUNCTION_7_1();
  v3[4] = OUTLINED_FUNCTION_7_1();
  v3[5] = OUTLINED_FUNCTION_7_1();
  v3[6] = sub_20CE170C4();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_21();
}

void sub_20CE2F1E0(uint64_t a1, char a2)
{
  _QWORD *v3;
  void (*v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t);

  v3 = *(_QWORD **)a1;
  v4 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a1 + 16) + 16);
  v4(*(_QWORD *)(*(_QWORD *)a1 + 32), v3[5], v3[1]);
  v5 = (void *)v3[5];
  v6 = (void *)v3[3];
  v7 = (void *)v3[4];
  v8 = v3[1];
  v9 = v3[2];
  if ((a2 & 1) != 0)
  {
    v4(v3[3], v3[4], v3[1]);
    OUTLINED_FUNCTION_10_0();
    v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
  }
  else
  {
    OUTLINED_FUNCTION_10_0();
    v10 = *(void (**)(void *, uint64_t))(v9 + 8);
  }
  v10(v5, v8);
  free(v5);
  free(v7);
  free(v6);
  free(v3);
}

uint64_t sub_20CE2F2B4()
{
  uint64_t v0;

  if (qword_254996398 != -1)
    swift_once();
  v0 = sub_20CE675F0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_254996CA8);
}

uint64_t sub_20CE2F2FC()
{
  sub_20CE2F908(&qword_254996D00, (void (*)(uint64_t))MEMORY[0x24BDF5118]);
  return sub_20CE66F18();
}

uint64_t View.iconBlendMode(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v6 = type metadata accessor for IconBlendModeModifier();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = OUTLINED_FUNCTION_5_0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v8, a1, v9);
  MEMORY[0x212B96BC8](v8, a2, v6, a3);
  return sub_20CE2F454((uint64_t)v8);
}

uint64_t type metadata accessor for IconBlendModeModifier()
{
  uint64_t result;

  result = qword_254996CF0;
  if (!qword_254996CF0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_20CE2F454(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for IconBlendModeModifier();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_20CE2F494()
{
  unint64_t result;

  result = qword_254996CE0;
  if (!qword_254996CE0)
  {
    result = MEMORY[0x212B97A80](&protocol conformance descriptor for EnvironmentValues.MaskShapeContext, &type metadata for EnvironmentValues.MaskShapeContext);
    atomic_store(result, (unint64_t *)&qword_254996CE0);
  }
  return result;
}

uint64_t sub_20CE2F4F0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_20CE2F4F8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

uint64_t sub_20CE2F504(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  type metadata accessor for IconBlendModeModifier();
  v2 = sub_20CE66F90();
  v4[0] = v1;
  v4[1] = sub_20CE2F908(&qword_254996CE8, (void (*)(uint64_t))type metadata accessor for IconBlendModeModifier);
  return MEMORY[0x212B97A80](MEMORY[0x24BDED308], v2, v4);
}

uint64_t sub_20CE2F584(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_20CE675F0();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_20CE2F5C0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_20CE675F0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_20CE2F5F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_20CE675F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_20CE2F638(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_20CE675F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_20CE2F67C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_20CE675F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_20CE2F6C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_20CE675F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_20CE2F704()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20CE2F710(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_5_0();
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_20CE2F740()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20CE2F74C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_5_0();
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t sub_20CE2F780()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20CE675F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *_s16IconBlendModeKeyVMa()
{
  return &_s16IconBlendModeKeyVN;
}

ValueMetadata *_s15ClipsCornersKeyVMa()
{
  return &_s15ClipsCornersKeyVN;
}

ValueMetadata *_s22IconViewBorderStyleKeyVMa()
{
  return &_s22IconViewBorderStyleKeyVN;
}

ValueMetadata *_s19MaskShapeContextKeyVMa()
{
  return &_s19MaskShapeContextKeyVN;
}

uint64_t sub_20CE2F828()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20CE2F838@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  KeyPath = swift_getKeyPath();
  v6 = (uint64_t *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254996D08) + 36));
  v7 = (char *)v6 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254996D10) + 28);
  v8 = sub_20CE675F0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v7, v2, v8);
  *v6 = KeyPath;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996D18);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a2, a1, v9);
}

uint64_t sub_20CE2F8EC()
{
  return sub_20CE66E94();
}

uint64_t sub_20CE2F908(uint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    a2(255);
    OUTLINED_FUNCTION_66();
  }
  return result;
}

unint64_t sub_20CE2F94C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254996D20;
  if (!qword_254996D20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996D08);
    v2[0] = sub_20CE2F9E8(&qword_254996D28, &qword_254996D18);
    v2[1] = sub_20CE2F9E8(&qword_254996D30, &qword_254996D10);
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254996D20);
  }
  return result;
}

uint64_t sub_20CE2F9E8(uint64_t *a1, uint64_t *a2)
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_66();
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return sub_20CE67158();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return sub_20CE67158();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return sub_20CE67164();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return sub_20CE675F0();
}

uint64_t OUTLINED_FUNCTION_6_0(uint64_t a1, uint64_t a2)
{
  return a2;
}

void *OUTLINED_FUNCTION_7_1()
{
  size_t v0;

  return malloc(v0);
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return sub_20CE67164();
}

uint64_t *sub_20CE2FA8C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  id v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549971B0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_20CE66F00();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = a3[5];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = *(id *)v11;
    v13 = v11[8];
    sub_20CE2FBB8(*(id *)v11, v13);
    *(_QWORD *)v10 = v12;
    v10[8] = v13;
    v14 = a3[6];
    v15 = a3[7];
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
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

id sub_20CE2FBB8(id a1, char a2)
{
  if ((a2 & 1) != 0)
    return a1;
  else
    return (id)swift_retain();
}

uint64_t sub_20CE2FBC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549971B0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_20CE66F00();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  sub_20CE2D428(*(id *)(a1 + *(int *)(a2 + 20)), *(_BYTE *)(a1 + *(int *)(a2 + 20) + 8));
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_20CE2FC5C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  id v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549971B0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_20CE66F00();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = *(id *)v9;
  v11 = v9[8];
  sub_20CE2FBB8(*(id *)v9, v11);
  *(_QWORD *)v8 = v10;
  v8[8] = v11;
  v12 = a3[6];
  v13 = a3[7];
  v14 = (_QWORD *)((char *)a1 + v12);
  v15 = (_QWORD *)((char *)a2 + v12);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v17 = (_QWORD *)((char *)a1 + v13);
  v18 = (_QWORD *)((char *)a2 + v13);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_20CE2FD5C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  id v10;
  char v11;
  void *v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;

  if (a1 != a2)
  {
    sub_20CE30AB4((uint64_t)a1, (uint64_t *)&unk_2549971B0);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549971B0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_20CE66F00();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = *(id *)v9;
  v11 = v9[8];
  sub_20CE2FBB8(*(id *)v9, v11);
  v12 = *(void **)v8;
  v13 = v8[8];
  *(_QWORD *)v8 = v10;
  v8[8] = v11;
  sub_20CE2D428(v12, v13);
  v14 = a3[6];
  v15 = (_QWORD *)((char *)a1 + v14);
  v16 = (_QWORD *)((char *)a2 + v14);
  *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = a3[7];
  v18 = (_QWORD *)((char *)a1 + v17);
  v19 = (_QWORD *)((char *)a2 + v17);
  *v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_20CE2FEA8(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549971B0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_20CE66F00();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[5];
  v9 = a3[6];
  v10 = &a1[v8];
  v11 = &a2[v8];
  *(_QWORD *)v10 = *(_QWORD *)v11;
  v10[8] = v11[8];
  *(_OWORD *)&a1[v9] = *(_OWORD *)&a2[v9];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  return a1;
}

char *sub_20CE2FF74(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void *v12;
  char v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;

  if (a1 != a2)
  {
    sub_20CE30AB4((uint64_t)a1, (uint64_t *)&unk_2549971B0);
    v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549971B0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_20CE66F00();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = *(_QWORD *)v10;
  LOBYTE(v10) = v10[8];
  v12 = *(void **)v9;
  v13 = v9[8];
  *(_QWORD *)v9 = v11;
  v9[8] = (char)v10;
  sub_20CE2D428(v12, v13);
  v14 = a3[6];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v18 = *(_QWORD *)v16;
  v17 = *((_QWORD *)v16 + 1);
  *(_QWORD *)v15 = v18;
  *((_QWORD *)v15 + 1) = v17;
  swift_bridgeObjectRelease();
  v19 = a3[7];
  v20 = &a1[v19];
  v21 = &a2[v19];
  v23 = *(_QWORD *)v21;
  v22 = *((_QWORD *)v21 + 1);
  *(_QWORD *)v20 = v23;
  *((_QWORD *)v20 + 1) = v22;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_20CE30088()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20CE30094(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254996530);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  return (v8 + 1);
}

uint64_t sub_20CE30114()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_20CE30120(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;

  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254996530);
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
    OUTLINED_FUNCTION_21();
  }
}

uint64_t type metadata accessor for AppShortcutPlatterMenu()
{
  uint64_t result;

  result = qword_254996D38;
  if (!qword_254996D38)
    return swift_getSingletonMetadata();
  return result;
}

void sub_20CE301CC()
{
  unint64_t v0;

  sub_20CE30248();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_20CE30248()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254996550)
  {
    sub_20CE66F00();
    v0 = sub_20CE66E58();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254996550);
  }
}

uint64_t sub_20CE3029C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_20CE302AC(uint64_t a1@<X8>)
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
  uint64_t v20[2];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = a1;
  v2 = OUTLINED_FUNCTION_4_2();
  v3 = *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64);
  MEMORY[0x24BDAC7A8](v2);
  v22 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254996D48) - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v4);
  v23 = (uint64_t)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v21 = (uint64_t)v20 - v7;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v20 - v9;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v20 - v12;
  sub_20CE30908(v1, (uint64_t)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_6_1(v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254996D50);
  sub_20CE30B14(&qword_254996D58, &qword_254996D50, MEMORY[0x24BDF41A8]);
  OUTLINED_FUNCTION_2_1();
  sub_20CE30908(v20[1], (uint64_t)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_6_1(v15);
  OUTLINED_FUNCTION_2_1();
  v16 = v21;
  OUTLINED_FUNCTION_5_1(v21, (uint64_t)v13);
  v17 = v23;
  OUTLINED_FUNCTION_5_1(v23, (uint64_t)v10);
  v18 = v24;
  OUTLINED_FUNCTION_5_1(v24, v16);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996D60);
  OUTLINED_FUNCTION_5_1(v18 + *(int *)(v19 + 48), v17);
  OUTLINED_FUNCTION_3_1((uint64_t)v10);
  OUTLINED_FUNCTION_3_1((uint64_t)v13);
  OUTLINED_FUNCTION_3_1(v17);
  OUTLINED_FUNCTION_3_1(v16);
  OUTLINED_FUNCTION_15();
}

uint64_t sub_20CE304CC()
{
  return sub_20CE674F4();
}

uint64_t sub_20CE30508()
{
  return sub_20CE3081C();
}

void sub_20CE30528()
{
  sub_20CE308B8();
}

void sub_20CE30548(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t *v15;
  unint64_t v16;
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
  unint64_t v28;

  v26 = a1;
  v2 = sub_20CE66F00();
  v24 = *(_QWORD *)(v2 - 8);
  v25 = v2;
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_2();
  v23 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254996680);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_20CE66D50();
  v22 = *(_QWORD *)(v8 - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_2();
  v21 = v10;
  v11 = sub_20CE66D08();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (uint64_t *)(v1 + *(int *)(OUTLINED_FUNCTION_4_2() + 24));
  v16 = v15[1];
  v27 = *v15;
  v28 = v16;
  swift_bridgeObjectRetain();
  sub_20CE66CFC();
  sub_20CE21A50();
  sub_20CE6777C();
  v18 = v17;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  swift_bridgeObjectRelease();
  if (v18)
  {
    v27 = 0;
    v28 = 0xE000000000000000;
    sub_20CE67794();
    sub_20CE67680();
    swift_bridgeObjectRetain();
    sub_20CE67680();
    swift_bridgeObjectRelease();
    sub_20CE67680();
    sub_20CE67680();
    swift_bridgeObjectRelease();
    sub_20CE66D44();
    swift_bridgeObjectRelease();
    if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) == 1)
    {
      sub_20CE30AB4((uint64_t)v7, (uint64_t *)&unk_254996680);
    }
    else
    {
      v20 = v21;
      v19 = v22;
      (*(void (**)(uint64_t, char *, uint64_t))(v22 + 32))(v21, v7, v8);
      sub_20CE29340();
      sub_20CE66EF4();
      OUTLINED_FUNCTION_8_1(v24);
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v8);
    }
  }
  OUTLINED_FUNCTION_15();
}

uint64_t sub_20CE307C0()
{
  return sub_20CE674F4();
}

uint64_t sub_20CE307FC()
{
  return sub_20CE3081C();
}

uint64_t sub_20CE3081C()
{
  uint64_t v0;
  char v1;
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7_2();
  if (!v1)
    swift_once();
  sub_20CE21A50();
  swift_bridgeObjectRetain();
  result = sub_20CE672CC();
  *(_QWORD *)v0 = result;
  *(_QWORD *)(v0 + 8) = v3;
  *(_BYTE *)(v0 + 16) = v4 & 1;
  *(_QWORD *)(v0 + 24) = v5;
  return result;
}

void sub_20CE30898()
{
  sub_20CE308B8();
}

void sub_20CE308B8()
{
  uint64_t *v0;
  char v1;

  OUTLINED_FUNCTION_7_2();
  if (!v1)
    swift_once();
  swift_bridgeObjectRetain();
  *v0 = sub_20CE674B8();
  OUTLINED_FUNCTION_21();
}

uint64_t sub_20CE30908(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AppShortcutPlatterMenu();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20CE30950(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AppShortcutPlatterMenu();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_20CE30994()
{
  OUTLINED_FUNCTION_0_2((uint64_t)"shortcuts://app-shortcut-add-home-screen?bundleID=");
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = OUTLINED_FUNCTION_4_2();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 16) & ~v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549971B0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_20CE66F00();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v0 + v3, v4);
  }
  else
  {
    swift_release();
  }
  sub_20CE2D428(*(id *)(v0 + v3 + *(int *)(v1 + 20)), *(_BYTE *)(v0 + v3 + *(int *)(v1 + 20) + 8));
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_13_1();
  return swift_deallocObject();
}

void sub_20CE30A6C()
{
  OUTLINED_FUNCTION_0_2((uint64_t)"shortcuts://app-shortcut-create-workflow?bundleID=");
}

void sub_20CE30A78(uint64_t a1)
{
  OUTLINED_FUNCTION_4_2();
  sub_20CE30548(a1);
}

uint64_t sub_20CE30AB4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_8_1(*(_QWORD *)(v3 - 8));
  return a1;
}

uint64_t sub_20CE30AE8()
{
  return sub_20CE30B14(&qword_254996D68, (uint64_t *)&unk_254996D70, MEMORY[0x24BDF5428]);
}

uint64_t sub_20CE30B14(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x212B97A80](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void OUTLINED_FUNCTION_0_2(uint64_t a1@<X8>)
{
  sub_20CE30A78((a1 - 32) | 0x8000000000000000);
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return sub_20CE67578();
}

uint64_t OUTLINED_FUNCTION_3_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return type metadata accessor for AppShortcutPlatterMenu();
}

uint64_t OUTLINED_FUNCTION_5_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_6_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return sub_20CE30950(v2, a1 + v1);
}

uint64_t OUTLINED_FUNCTION_8_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CE30BDC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t TupleTypeMetadata;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;

  v5 = a1;
  v6 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    TupleTypeMetadata = *v6;
  }
  else
  {
    v3 = (char *)&v23;
    MEMORY[0x24BDAC7A8](a1);
    OUTLINED_FUNCTION_38();
    v10 = (_QWORD *)(v9 - v8);
    if (a2)
    {
      v11 = v6;
      v12 = v10;
      v13 = a2;
      do
      {
        v14 = *v11++;
        *v12++ = v14;
        --v13;
      }
      while (v13);
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_40();
  if (a2)
  {
    v16 = (int *)(TupleTypeMetadata + 32);
    v17 = a2;
    do
    {
      if (a2 == 1)
        v18 = 0;
      else
        v18 = *v16;
      v20 = *v6++;
      v19 = v20;
      v21 = *v5++;
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(&v3[v18], v21);
      v16 += 4;
      --v17;
    }
    while (v17);
  }
  return sub_20CE67608();
}

void sub_20CE30CFC()
{
  sub_20CE670F8();
  OUTLINED_FUNCTION_4();
}

void sub_20CE30D18()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t);

  v0 = sub_20CE66F00();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_41();
  v1 = OUTLINED_FUNCTION_51_1();
  v2(v1);
  sub_20CE67104();
  OUTLINED_FUNCTION_21();
}

uint64_t sub_20CE30D78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_20CE67710();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_20CE21AE0(a1, (uint64_t *)&unk_253CFA440);
  }
  else
  {
    sub_20CE67704();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    OUTLINED_FUNCTION_68();
    sub_20CE676D4();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

void sub_20CE30EB8()
{
  qword_25499A160 = 0x4079E00000000000;
}

void AppShortcutIndexedSearchView.init(phraseSignature:bundleIdentifier:associatedAppBundleIdentifier:)()
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
  uint64_t *v12;
  uint64_t *v13;
  int *v14;
  uint64_t *v15;
  char *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;

  OUTLINED_FUNCTION_46_0();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  *v12 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  OUTLINED_FUNCTION_24();
  v14 = (int *)type metadata accessor for AppShortcutIndexedSearchView(0);
  v15 = (uint64_t *)((char *)v13 + v14[5]);
  *v15 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
  OUTLINED_FUNCTION_24();
  v16 = (char *)v13 + v14[6];
  *(_QWORD *)v16 = swift_getKeyPath();
  v16[8] = 0;
  v17 = (uint64_t *)((char *)v13 + v14[7]);
  *v17 = v11;
  v17[1] = v9;
  v18 = (uint64_t *)((char *)v13 + v14[8]);
  *v18 = v7;
  v18[1] = v5;
  v19 = (uint64_t *)((char *)v13 + v14[9]);
  *v19 = v3;
  v19[1] = v1;
  OUTLINED_FUNCTION_15();
}

uint64_t type metadata accessor for AppShortcutIndexedSearchView(uint64_t a1)
{
  return sub_20CE15EE0(a1, qword_254996E30);
}

void AppShortcutIndexedSearchView.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
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
  uint64_t KeyPath;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
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
  _BYTE v66[72];
  _OWORD v67[3];
  __int128 v68;
  char v69;
  _BYTE v70[32];
  __int128 v71;
  __int128 v72;

  OUTLINED_FUNCTION_46_0();
  v65 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254996D98);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996DA0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_38();
  v10 = v9 - v8;
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996DA8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_2();
  v60 = v12;
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996DB0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_2();
  v62 = v14;
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996DB8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_2();
  v61 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254996DC0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_2();
  v63 = v18;
  v19 = OUTLINED_FUNCTION_42_1();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_39();
  v57 = sub_20CE66E4C();
  v56 = *(_QWORD *)(v57 - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_41();
  type metadata accessor for AppShortcutIndexedSearchView.DerivedStyles(0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_38();
  v25 = v24 - v23;
  type metadata accessor for AppShortcutIndexedSearchView(0);
  swift_bridgeObjectRetain();
  sub_20CE31490(v2);
  sub_20CE2930C();
  sub_20CE31540();
  sub_20CE2930C();
  sub_20CE31F54(v0, (uint64_t)v66);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v0, v19);
  sub_20CE21A24((uint64_t)v66, (uint64_t)v67, &qword_254996DC8);
  if ((v69 & 1) != 0)
  {
    v26 = 1;
    v27 = v64;
    v28 = v63;
  }
  else
  {
    *(_OWORD *)v70 = v67[0];
    *(_OWORD *)&v70[16] = v67[1];
    v71 = v67[2];
    v72 = v68;
    v29 = *((_QWORD *)&v68 + 1);
    *(_QWORD *)v6 = sub_20CE67188();
    *((_QWORD *)v6 + 1) = v29;
    v6[16] = 0;
    v30 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254996DD0);
    sub_20CE3213C(v1, v25, (uint64_t)v70, (uint64_t)&v6[*(int *)(v30 + 44)]);
    v54 = *(_OWORD *)&v70[8];
    v31 = *(_QWORD *)&v70[24];
    v32 = v71;
    LOBYTE(v29) = sub_20CE67230();
    sub_20CE21AA4((uint64_t)v6, v10, &qword_254996D98);
    v33 = v10 + *(int *)(v55 + 36);
    *(_BYTE *)v33 = v29;
    *(_OWORD *)(v33 + 8) = v54;
    *(_QWORD *)(v33 + 24) = v31;
    *(_QWORD *)(v33 + 32) = v32;
    *(_BYTE *)(v33 + 40) = 0;
    sub_20CE21AE0((uint64_t)v6, &qword_254996D98);
    v34 = sub_20CE33BC4();
    KeyPath = swift_getKeyPath();
    v36 = v60;
    sub_20CE21AA4(v10, v60, &qword_254996DA0);
    v37 = (uint64_t *)(v36 + *(int *)(v59 + 36));
    *v37 = KeyPath;
    v37[1] = v34;
    sub_20CE21AE0(v10, &qword_254996DA0);
    v38 = sub_20CE675CC();
    v40 = v39;
    v41 = v62;
    v42 = v62 + *(int *)(v58 + 36);
    sub_20CE33D50((uint64_t *)v70, v25, v42);
    v43 = (uint64_t *)(v42 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254996430) + 36));
    *v43 = v38;
    v43[1] = v40;
    v44 = OUTLINED_FUNCTION_68();
    sub_20CE21A24(v44, v45, v46);
    v47 = swift_getKeyPath();
    sub_20CE31490(v2);
    v48 = v64;
    v49 = v61;
    v50 = (uint64_t *)(v61 + *(int *)(v64 + 36));
    v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996DE0);
    v52 = v56;
    v53 = v57;
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))((char *)v50 + *(int *)(v51 + 28), v2, v57);
    *v50 = v47;
    sub_20CE21AA4(v41, v49, &qword_254996DB0);
    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v2, v53);
    sub_20CE21AE0(v41, &qword_254996DB0);
    v28 = v63;
    sub_20CE21A24(v49, v63, &qword_254996DB8);
    v26 = 0;
    v27 = v48;
  }
  __swift_storeEnumTagSinglePayload(v28, v26, 1, v27);
  sub_20CE21A24(v28, v65, &qword_254996DC0);
  sub_20CE21374(v25, type metadata accessor for AppShortcutIndexedSearchView.DerivedStyles);
  OUTLINED_FUNCTION_15();
}

void sub_20CE31490(uint64_t a1@<X8>)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v3 = objc_msgSend(v2, sel_userInterfaceIdiom);

  if (v3)
  {
    type metadata accessor for AppShortcutIndexedSearchView(0);
    sub_20CE1686C();
  }
  else
  {
    v4 = *MEMORY[0x24BDEB3F0];
    v5 = sub_20CE66E4C();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(a1, v4, v5);
  }
}

void sub_20CE31540()
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
  id v32;
  void *v33;
  char *v34;
  id v35;
  char *v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  unsigned __int8 v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  unsigned int *v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
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
  int v71;
  id v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  id v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  int v90;
  uint64_t v91;
  id v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  void (*v104)(uint64_t, uint64_t);
  uint64_t v105;
  char v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t *v122;
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
  char *v135;
  char *v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;

  OUTLINED_FUNCTION_46_0();
  v127 = v1;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v141 = *MEMORY[0x24BDAC8D0];
  v121 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549971A0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_81();
  v120 = v11;
  MEMORY[0x24BDAC7A8](v12);
  v122 = (uint64_t *)((char *)&v114 - v13);
  v14 = OUTLINED_FUNCTION_42_1();
  v133 = *(_QWORD *)(v14 - 8);
  v134 = v14;
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_2();
  v128 = v16;
  v17 = sub_20CE66E4C();
  v131 = *(_QWORD *)(v17 - 8);
  v132 = v17;
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_2();
  v124 = v19;
  v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549972A0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_47_0();
  v23 = v21 - v22;
  MEMORY[0x24BDAC7A8](v24);
  v118 = (char *)&v114 - v25;
  type metadata accessor for TopHitViewColorScheme();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_31_0();
  v27 = sub_20CE675F0();
  v130 = *(_QWORD *)(v27 - 8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_81();
  v119 = v29;
  MEMORY[0x24BDAC7A8](v30);
  v135 = (char *)&v114 - v31;
  v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEC1350]), sel_init);
  v123 = v7;
  v129 = v5;
  v33 = (void *)sub_20CE6762C();
  v137 = 0;
  v34 = (char *)objc_msgSend(v32, sel_colorsForBundleIdentifier_error_, v33, &v137);

  v35 = v137;
  v136 = v34;
  if (v34)
  {
    v36 = v34;
    v37 = v35;
    v38 = objc_msgSend(v36, sel_backgroundGradient);
    if (v38)
    {
      v115 = v27;
      v117 = v9;
      *(_QWORD *)(v9 + 16) = v38;
      LOBYTE(v137) = 1;
      v39 = v38;
      swift_bridgeObjectRetain();
      TopHitViewColorScheme.init(bundleIdentifier:style:)((char *)&v137, v0);
      v41 = (void *)v0[2];
      v40 = v0[3];
      v42 = v0[4];
      v43 = v0[5];
      swift_retain();
      swift_retain();
      sub_20CE21374((uint64_t)v0, (uint64_t (*)(_QWORD))type metadata accessor for TopHitViewColorScheme);
      v137 = v41;
      v138 = v40;
      v139 = v42;
      v140 = v43;
      v116 = v3;
      TopHitViewIconBackgroundStyle.resolve(in:)(v3);
      v45 = v44;
      swift_release();
      swift_release();
      v46 = objc_msgSend(v39, sel_isDark);
      v47 = v125;
      v48 = v118;
      v49 = (uint64_t)&v118[*(int *)(v125 + 48)];
      if ((v46 & 1) != 0)
      {
        v126 = sub_20CE673F8();

        v50 = (unsigned int *)MEMORY[0x24BDF50D0];
      }
      else
      {
        sub_20CE673E0();
        v126 = sub_20CE67404();
        swift_release();

        v50 = (unsigned int *)MEMORY[0x24BDF5080];
      }
      v27 = v115;
      v66 = OUTLINED_FUNCTION_41_0(v49, *v50);
      OUTLINED_FUNCTION_26_1(v66, (uint64_t)&v48[*(int *)(v47 + 48)]);
      v118 = v136;
      v65 = v117;
      v64 = v116;
      goto LABEL_13;
    }

    v118 = v34;
    v53 = v3;
  }
  else
  {
    v51 = v137;
    v52 = (void *)sub_20CE66D14();

    swift_willThrow();
    v118 = 0;
    v53 = v3;
  }
  v54 = v124;
  v55 = v125;
  v56 = v9;
  *(_QWORD *)(v9 + 16) = 0;
  v58 = v131;
  v57 = v132;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v131 + 104))(v54, *MEMORY[0x24BDEB3F0], v132);
  v59 = v53;
  v60 = sub_20CE66E40();
  (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v54, v57);
  v61 = v23 + *(int *)(v55 + 48);
  if ((v60 & 1) != 0)
    v62 = sub_20CE673F8();
  else
    v62 = sub_20CE673E0();
  v126 = v62;
  v63 = OUTLINED_FUNCTION_41_0(v61, *MEMORY[0x24BDF50D0]);
  OUTLINED_FUNCTION_26_1(v63, v23 + *(int *)(v55 + 48));
  v64 = v59;
  v65 = v56;
LABEL_13:
  v68 = v133;
  v67 = v134;
  v70 = v127;
  v69 = v128;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v133 + 16))(v128, v127, v134);
  v71 = (*(uint64_t (**)(uint64_t, uint64_t))(v68 + 88))(v69, v67);
  if (v71 == *MEMORY[0x24BDFBAD0])
  {
    if (v136)
    {
      v72 = OUTLINED_FUNCTION_32_1();
      if (v72)
      {
        v73 = v72;
        v74 = v64;
        LOBYTE(v137) = 1;
        TopHitViewColorScheme.init(bundleIdentifier:style:)((char *)&v137, v0);
        v76 = (void *)v0[2];
        v75 = v0[3];
        v77 = v65;
        v78 = v0[4];
        v79 = v0[5];
        OUTLINED_FUNCTION_52_1();
        swift_retain();
        sub_20CE21374((uint64_t)v0, (uint64_t (*)(_QWORD))type metadata accessor for TopHitViewColorScheme);
        v137 = v76;
        v138 = v75;
        v139 = v78;
        v140 = v79;
        v65 = v77;
        TopHitViewIconBackgroundStyle.resolve(in:)(v64);
        v81 = v80;
        swift_release();
        swift_release();
        v82 = objc_msgSend(v81, sel_color);
        v83 = MEMORY[0x212B96C94](objc_msgSend(v82, sel_platformColor));

        v84 = objc_msgSend(v81, sel_blendMode);
        v85 = v119;
        WFIconColorBackgroundBlendMode.blendMode.getter((uint64_t)v84, v119);
        v86 = v122;
        v87 = v130;
        OUTLINED_FUNCTION_56_1((uint64_t)v122 + *(int *)(v121 + 36), v85, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v130 + 16));
        *v86 = v83;
        OUTLINED_FUNCTION_64_1(v85, *(uint64_t (**)(uint64_t, uint64_t))(v87 + 8));
        sub_20CE21AA4((uint64_t)v86, v120, (uint64_t *)&unk_2549971A0);
        sub_20CE3B618((uint64_t)&qword_254996948);
        v88 = sub_20CE66EB8();
        OUTLINED_FUNCTION_21_0();

        (*(void (**)(uint64_t, uint64_t))(v133 + 8))(v127, v134);
        (*(void (**)(uint64_t, uint64_t))(v131 + 8))(v74, v132);
        sub_20CE21AE0((uint64_t)v86, (uint64_t *)&unk_2549971A0);
        *(_QWORD *)v65 = v88;
LABEL_27:
        *(_BYTE *)(v65 + 8) = 1;
        goto LABEL_28;
      }
    }
    swift_bridgeObjectRelease();
    sub_20CE673F8();
    v94 = sub_20CE67404();
    OUTLINED_FUNCTION_48_1();
    v95 = v119;
    OUTLINED_FUNCTION_41_0(v119, *MEMORY[0x24BDF5098]);
    v96 = v122;
    v97 = v130;
    OUTLINED_FUNCTION_56_1((uint64_t)v122 + *(int *)(v121 + 36), v95, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v130 + 16));
    *v96 = v94;
    OUTLINED_FUNCTION_64_1(v95, *(uint64_t (**)(uint64_t, uint64_t))(v97 + 8));
    sub_20CE21AA4((uint64_t)v96, v120, (uint64_t *)&unk_2549971A0);
    sub_20CE3B618((uint64_t)&qword_254996948);
    OUTLINED_FUNCTION_54();
    v98 = sub_20CE66EB8();
    OUTLINED_FUNCTION_21_0();
    OUTLINED_FUNCTION_8_2();
    OUTLINED_FUNCTION_44_1();
    v99 = OUTLINED_FUNCTION_51_1();
    goto LABEL_26;
  }
  v89 = v71;
  v90 = *MEMORY[0x24BDFBAE0];
  swift_bridgeObjectRelease();
  if (v89 == v90)
  {
    v91 = v132;
    if (!v136 || (v92 = OUTLINED_FUNCTION_32_1()) == 0)
    {
      v105 = v124;
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v131 + 104))(v124, *MEMORY[0x24BDEB400], v91);
      v106 = sub_20CE66E40();
      OUTLINED_FUNCTION_66_1(v105);
      if ((v106 & 1) != 0)
      {
        sub_20CE673E0();
        v107 = (void *)sub_20CE67404();
        OUTLINED_FUNCTION_48_1();
        v137 = v107;
        swift_retain();
        v108 = sub_20CE66EB8();
        OUTLINED_FUNCTION_21_0();
        OUTLINED_FUNCTION_8_2();
        OUTLINED_FUNCTION_66_1(v64);
        swift_release();
        *(_QWORD *)v65 = v108;
        goto LABEL_27;
      }
      sub_20CE673F8();
      v131 = sub_20CE67404();
      OUTLINED_FUNCTION_48_1();
      v109 = v119;
      OUTLINED_FUNCTION_41_0(v119, *MEMORY[0x24BDF5098]);
      v110 = v122;
      v111 = v130;
      OUTLINED_FUNCTION_56_1((uint64_t)v122 + *(int *)(v121 + 36), v109, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v130 + 16));
      *v110 = v131;
      OUTLINED_FUNCTION_64_1(v109, *(uint64_t (**)(uint64_t, uint64_t))(v111 + 8));
      sub_20CE21AA4((uint64_t)v110, v120, (uint64_t *)&unk_2549971A0);
      sub_20CE3B618((uint64_t)&qword_254996948);
      OUTLINED_FUNCTION_54();
      v98 = sub_20CE66EB8();
      OUTLINED_FUNCTION_21_0();
      OUTLINED_FUNCTION_8_2();
      OUTLINED_FUNCTION_66_1(v64);
      v99 = (uint64_t)v110;
      v100 = (uint64_t *)&unk_2549971A0;
LABEL_26:
      sub_20CE21AE0(v99, v100);
      *(_QWORD *)v65 = v98;
      goto LABEL_27;
    }
    v93 = v92;
    OUTLINED_FUNCTION_21_0();
    OUTLINED_FUNCTION_8_2();
    (*(void (**)(uint64_t, uint64_t))(v131 + 8))(v64, v91);
    *(_QWORD *)v65 = v93;
    *(_BYTE *)(v65 + 8) = 0;
  }
  else
  {
    sub_20CE673F8();
    v101 = (void *)sub_20CE67404();
    swift_release();
    v137 = v101;
    OUTLINED_FUNCTION_52_1();
    v102 = sub_20CE66EB8();
    OUTLINED_FUNCTION_21_0();
    v103 = v134;
    v104 = *(void (**)(uint64_t, uint64_t))(v133 + 8);
    v104(v70, v134);
    OUTLINED_FUNCTION_44_1();
    swift_release();
    *(_QWORD *)v65 = v102;
    *(_BYTE *)(v65 + 8) = 1;
    v104(v128, v103);
  }
LABEL_28:
  v112 = (uint64_t *)(v65 + *(int *)(type metadata accessor for AppShortcutIndexedSearchView.DerivedStyles(0) + 24));
  *v112 = v126;
  v113 = OUTLINED_FUNCTION_43_1();
  ((void (*)(char *, char *, uint64_t))v125)((char *)v112 + *(int *)(v113 + 20), v135, v27);
  OUTLINED_FUNCTION_15();
}

void sub_20CE31F54(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  int v7;
  __int128 v8;
  char v9;
  uint64_t v11;
  uint64_t v12;
  id v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double Width;
  double v24;
  double v28;
  CGRect v29;

  v5 = OUTLINED_FUNCTION_42_1();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_41();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v2, a1, v5);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 88))(v2, v5);
  v8 = xmmword_20CE6C110;
  if (v7 == *MEMORY[0x24BDFBAD0])
  {
    v9 = 0;
    _Q1 = xmmword_20CE6C120;
    v11 = 0x402C000000000000;
    v12 = 0x4032000000000000;
  }
  else if (v7 == *MEMORY[0x24BDFBAE0])
  {
    v13 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
    objc_msgSend(v13, sel_bounds);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    v29.origin.x = v15;
    v29.origin.y = v17;
    v29.size.width = v19;
    v29.size.height = v21;
    Width = CGRectGetWidth(v29);
    if (qword_2549963A0 != -1)
    {
      v28 = Width;
      swift_once();
      Width = v28;
    }
    v12 = 0;
    v9 = 0;
    _NF = *(double *)&qword_25499A160 < Width;
    v24 = 16.0;
    if (_NF)
      v24 = 20.0;
    __asm { FMOV            V1.2D, #27.0 }
    *(double *)&_Q1 = v24;
    v11 = 0x4030000000000000;
    v8 = xmmword_20CE6C110;
  }
  else
  {
    _Q1 = 0uLL;
    if (v7 != *MEMORY[0x24BDFBAD8])
    {
      (*(void (**)(uint64_t, uint64_t, __int128, __n128))(v6 + 8))(v2, v5, xmmword_20CE6C110, (__n128)0);
      _Q1 = 0uLL;
    }
    v12 = 0;
    v11 = 0;
    v9 = 1;
    v8 = 0uLL;
  }
  *(_QWORD *)a2 = v12;
  *(_QWORD *)(a2 + 8) = v11;
  *(_QWORD *)(a2 + 16) = _Q1;
  *(_QWORD *)(a2 + 24) = v11;
  *(_OWORD *)(a2 + 32) = _Q1;
  *(_OWORD *)(a2 + 48) = v8;
  *(_BYTE *)(a2 + 64) = v9;
}

void sub_20CE3213C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  int *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  double v41;
  double v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  double *v47;
  void (**v48)(uint64_t@<X8>);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  _QWORD *v53;
  uint64_t v54;
  _QWORD *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t, uint64_t);
  char *v60;
  uint64_t v61;
  void (*v62)(char *, uint64_t);
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  void (*v70)(char *, uint64_t, uint64_t);
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t (*v75)(void);
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void (*v85)(char *, char *, uint64_t);
  uint64_t v86;
  char *v87;
  uint64_t v88;
  int *v89;
  uint64_t v90;
  void (*v91)(char *, uint64_t);
  uint64_t v92;
  id v93;
  uint64_t v94;
  char *v95;
  uint64_t KeyPath;
  char *v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  _QWORD *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;

  v108 = a3;
  v118 = a2;
  v112 = a4;
  v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549970C8);
  v111 = *(_QWORD *)(v114 - 8);
  MEMORY[0x24BDAC7A8](v114);
  v113 = (char *)&v92 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v110 = (char *)&v92 - v7;
  v8 = sub_20CE66FCC();
  MEMORY[0x24BDAC7A8](v8);
  v106 = (char *)&v92 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_20CE675F0();
  v104 = *(_QWORD *)(v10 - 8);
  v105 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v103 = (char *)&v92 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = sub_20CE66DC8();
  v98 = *(_QWORD *)(v100 - 8);
  MEMORY[0x24BDAC7A8](v100);
  v99 = (char *)&v92 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v97 = (char *)&v92 - v14;
  v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549970D0);
  MEMORY[0x24BDAC7A8](v102);
  v109 = (uint64_t)&v92 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v92 - v17;
  MEMORY[0x24BDAC7A8](v19);
  v116 = (uint64_t)&v92 - v20;
  v101 = type metadata accessor for AppShortcutIndexedSearchView.DerivedStyles(0);
  v94 = *(_QWORD *)(v101 - 8);
  v21 = *(_QWORD *)(v94 + 64);
  MEMORY[0x24BDAC7A8](v101);
  v22 = (char *)&v92 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v115 = (_QWORD *)sub_20CE66E4C();
  KeyPath = *(v115 - 1);
  MEMORY[0x24BDAC7A8](v115);
  v95 = (char *)&v92 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v92 - v25;
  v27 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549970D8);
  MEMORY[0x24BDAC7A8](v27);
  v107 = (uint64_t)&v92 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v29);
  v31 = (uint64_t *)((char *)&v92 - v30);
  v32 = type metadata accessor for AppShortcutIndexedSearchView(0);
  v33 = a1 + *(int *)(v32 + 24);
  v34 = *(id *)v33;
  v35 = *(_BYTE *)(v33 + 8);
  sub_20CE2FBB8(*(id *)v33, v35);
  v93 = sub_20CE29AAC();
  sub_20CE2D428(v34, v35);
  sub_20CE1686C();
  v36 = *(int *)(v32 + 36);
  v117 = a1;
  v37 = (uint64_t *)(a1 + v36);
  v38 = v37[1];
  v92 = *v37;
  v39 = qword_2549963A8;
  swift_bridgeObjectRetain();
  if (v39 != -1)
    swift_once();
  v40 = xmmword_25499A170;
  v41 = *(double *)&qword_25499A180;
  v42 = unk_25499A188;
  sub_20CE20E18(v118, (uint64_t)&v92 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AppShortcutIndexedSearchView.DerivedStyles);
  v43 = (*(unsigned __int8 *)(v94 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v94 + 80);
  v44 = swift_allocObject();
  sub_20CE217D4((uint64_t)v22, v44 + v43, type metadata accessor for AppShortcutIndexedSearchView.DerivedStyles);
  *v31 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  swift_storeEnumTagMultiPayload();
  v45 = v27[11];
  v46 = v93;
  *(uint64_t *)((char *)v31 + v27[10]) = (uint64_t)v93;
  v47 = (double *)((char *)v31 + v45);
  *(_OWORD *)v47 = v40;
  v47[2] = v41;
  v47[3] = v42;
  v48 = (void (**)(uint64_t@<X8>))((char *)v31 + v27[12]);
  *v48 = sub_20CE3ACF0;
  v48[1] = (void (*)(uint64_t@<X8>))v44;
  v49 = KeyPath;
  v50 = (uint64_t)v95;
  v51 = (uint64_t)v115;
  (*(void (**)(char *, char *, _QWORD *))(KeyPath + 16))(v95, v26, v115);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549970E0);
  swift_allocObject();
  v52 = v46;
  v53 = sub_20CE3614C(v52, *(double *)&v40, *((double *)&v40 + 1), v41, v42, v92, v38, v50);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v26, v51);
  v54 = v27[9];
  v115 = v31;
  v55 = (uint64_t *)((char *)v31 + v54);
  *v55 = v53;
  v55[1] = 0;
  KeyPath = swift_getKeyPath();
  v95 = (char *)sub_20CE671AC();
  v56 = v97;
  sub_20CE2930C();
  v57 = *MEMORY[0x24BDFBAD0];
  v58 = v98;
  v59 = *(void (**)(char *, uint64_t, uint64_t))(v98 + 104);
  v60 = v99;
  v61 = v100;
  v59(v99, v57, v100);
  LOBYTE(v53) = sub_20CE66DBC();
  v62 = *(void (**)(char *, uint64_t))(v58 + 8);
  v62(v60, v61);
  v62(v56, v61);
  v63 = 0;
  if ((v53 & 1) != 0)
  {
    v63 = *(_QWORD *)(v118 + *(int *)(v101 + 24));
    swift_retain();
  }
  v64 = swift_getKeyPath();
  sub_20CE2930C();
  v59(v60, v57, v61);
  v65 = sub_20CE66DBC();
  v62(v60, v61);
  v62(v56, v61);
  if ((v65 & 1) != 0)
  {
    v66 = v118 + *(int *)(v101 + 24);
    v67 = v66 + *(int *)(type metadata accessor for TopHitViewTextStyle.Resolved(0) + 20);
    v68 = v103;
    v69 = v104;
    v70 = *(void (**)(char *, uint64_t, uint64_t))(v104 + 16);
    v71 = v105;
    v70(v103, v67, v105);
  }
  else
  {
    v68 = v103;
    v69 = v104;
    v71 = v105;
    (*(void (**)(char *, _QWORD, uint64_t))(v104 + 104))(v103, *MEMORY[0x24BDF50D0], v105);
    v70 = *(void (**)(char *, uint64_t, uint64_t))(v69 + 16);
  }
  v72 = v108;
  v73 = *(_QWORD *)(v108 + 48);
  v74 = (uint64_t)v106;
  v70(v106, (uint64_t)v68, v71);
  v75 = MEMORY[0x24BDEDB60];
  sub_20CE20E18(v74, (uint64_t)&v18[*(int *)(v102 + 36)], (uint64_t (*)(_QWORD))MEMORY[0x24BDEDB60]);
  *(_QWORD *)v18 = KeyPath;
  v18[8] = 0;
  *((_QWORD *)v18 + 2) = v73;
  *((_QWORD *)v18 + 3) = v95;
  *((_QWORD *)v18 + 4) = sub_20CE32D34;
  *((_QWORD *)v18 + 5) = 0;
  *((_QWORD *)v18 + 6) = v64;
  *((_QWORD *)v18 + 7) = v63;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_20CE21374(v74, (uint64_t (*)(_QWORD))v75);
  (*(void (**)(char *, uint64_t))(v69 + 8))(v68, v71);
  swift_release();
  swift_release();
  swift_release();
  v76 = v116;
  sub_20CE21A24((uint64_t)v18, v116, &qword_2549970D0);
  MEMORY[0x24BDAC7A8](v77);
  *(&v92 - 2) = v117;
  MEMORY[0x24BDAC7A8](v78);
  v79 = v118;
  *(&v92 - 4) = v80;
  *(&v92 - 3) = v79;
  *(&v92 - 2) = v72;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549970E8);
  type metadata accessor for AppShortcutPlatterMenu();
  sub_20CE3AD34((uint64_t)&unk_2549970F0);
  sub_20CE1EE3C((uint64_t)&unk_254997180);
  v81 = v110;
  sub_20CE6729C();
  v82 = v107;
  sub_20CE21AA4((uint64_t)v115, v107, &qword_2549970D8);
  v83 = v109;
  sub_20CE21AA4(v76, v109, &qword_2549970D0);
  v84 = v111;
  v85 = *(void (**)(char *, char *, uint64_t))(v111 + 16);
  v87 = v113;
  v86 = v114;
  v85(v113, v81, v114);
  v88 = v112;
  sub_20CE21AA4(v82, v112, &qword_2549970D8);
  v89 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_254997188);
  sub_20CE21AA4(v83, v88 + v89[12], &qword_2549970D0);
  v90 = v88 + v89[16];
  *(_QWORD *)v90 = 0;
  *(_BYTE *)(v90 + 8) = 1;
  v85((char *)(v88 + v89[20]), v87, v86);
  v91 = *(void (**)(char *, uint64_t))(v84 + 8);
  v91(v81, v86);
  sub_20CE21AE0(v116, &qword_2549970D0);
  sub_20CE21AE0((uint64_t)v115, &qword_2549970D8);
  v91(v87, v86);
  sub_20CE21AE0(v83, &qword_2549970D0);
  sub_20CE21AE0(v82, &qword_2549970D8);
}

void sub_20CE32A90(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254997298);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996790);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254997220);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v17 - v14;
  v16 = *(void **)a1;
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    *(_QWORD *)v6 = v16;
    *((_WORD *)v6 + 4) = 256;
    swift_storeEnumTagMultiPayload();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254997288);
    sub_20CE3AEDC((uint64_t)&unk_254997230);
    sub_20CE3B618((uint64_t)&unk_254997280);
    sub_20CE67200();
  }
  else
  {
    sub_20CE33FF4(v16, 2, (uint64_t)v9);
    sub_20CE21AA4((uint64_t)v9, (uint64_t)v6, &qword_254996790);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254997288);
    sub_20CE3AEDC((uint64_t)&unk_254997230);
    sub_20CE3B618((uint64_t)&unk_254997280);
    sub_20CE67200();
    sub_20CE398A4(v16, 0);
    sub_20CE21AE0((uint64_t)v9, &qword_254996790);
  }
  sub_20CE21A24((uint64_t)v12, (uint64_t)v15, &qword_254997220);
  sub_20CE21A24((uint64_t)v15, a2, &qword_254997220);
}

uint64_t sub_20CE32D34()
{
  uint64_t v0;

  v0 = sub_20CE671B8();
  return MEMORY[0x212B967D8](v0);
}

uint64_t sub_20CE32D58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v18;

  v4 = (int *)type metadata accessor for AppShortcutPlatterMenu();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (uint64_t *)((char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = type metadata accessor for AppShortcutIndexedSearchView(0);
  v8 = *(int *)(v7 + 32);
  v9 = (uint64_t *)(a1 + *(int *)(v7 + 28));
  v11 = *v9;
  v10 = v9[1];
  v13 = *(_QWORD *)(a1 + v8);
  v12 = *(_QWORD *)(a1 + v8 + 8);
  *v6 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549971B0);
  swift_storeEnumTagMultiPayload();
  v14 = (char *)v6 + v4[5];
  *(_QWORD *)v14 = swift_getKeyPath();
  v14[8] = 0;
  v15 = (uint64_t *)((char *)v6 + v4[6]);
  *v15 = v11;
  v15[1] = v10;
  v16 = (uint64_t *)((char *)v6 + v4[7]);
  *v16 = v13;
  v16[1] = v12;
  sub_20CE217D4((uint64_t)v6, a2, (uint64_t (*)(_QWORD))type metadata accessor for AppShortcutPlatterMenu);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void sub_20CE32E78(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
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
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  void (*v36)(char *, _QWORD, uint64_t);
  char v37;
  void (*v38)(char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t KeyPath;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _OWORD *v47;
  __int128 v48;
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  void (*v62)(char *, uint64_t);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  double v76;
  char *v77;
  _BYTE *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  _BYTE v117[184];
  _BYTE v118[194];
  uint64_t v119;
  char v120;
  uint64_t v121;
  char v122;
  __int128 v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  char v128;
  uint64_t v129;
  char v130;
  __int128 v131;

  v106 = a2;
  v102 = a1;
  v116 = a3;
  v90 = type metadata accessor for SizedEllipsis();
  MEMORY[0x24BDAC7A8](v90);
  v92 = (uint64_t *)((char *)&v85 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996610);
  MEMORY[0x24BDAC7A8](v91);
  v94 = (uint64_t)&v85 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996600);
  MEMORY[0x24BDAC7A8](v114);
  v93 = (char *)&v85 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v95 = (uint64_t)&v85 - v7;
  v112 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254997190);
  MEMORY[0x24BDAC7A8](v112);
  v113 = (uint64_t)&v85 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549970E8);
  MEMORY[0x24BDAC7A8](v9);
  v115 = (char *)&v85 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v107 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254997170);
  MEMORY[0x24BDAC7A8](v107);
  v105 = (char *)&v85 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_20CE67020();
  v109 = *(_QWORD *)(v12 - 8);
  v110 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v108 = (char *)&v85 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996670);
  MEMORY[0x24BDAC7A8](v14);
  v101 = (char *)&v85 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_20CE67488();
  v99 = *(_QWORD *)(v16 - 8);
  v100 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v98 = (char *)&v85 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_254997110);
  MEMORY[0x24BDAC7A8](v111);
  v103 = (char *)&v85 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v104 = (uint64_t)&v85 - v20;
  v89 = sub_20CE675F0();
  v87 = *(_QWORD *)(v89 - 8);
  MEMORY[0x24BDAC7A8](v89);
  v86 = (char *)&v85 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549971A0);
  MEMORY[0x24BDAC7A8](v88);
  v85 = (uint64_t *)((char *)&v85 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  v23 = sub_20CE66E4C();
  v96 = *(_QWORD *)(v23 - 8);
  v97 = v23;
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v85 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v85 - v27;
  v29 = sub_20CE66DC8();
  v30 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)&v85 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v33);
  v35 = (char *)&v85 - v34;
  sub_20CE2930C();
  v36 = *(void (**)(char *, _QWORD, uint64_t))(v30 + 104);
  v36(v32, *MEMORY[0x24BDFBAD0], v29);
  v37 = sub_20CE66DBC();
  v38 = *(void (**)(char *, uint64_t))(v30 + 8);
  v38(v32, v29);
  v38(v35, v29);
  if ((v37 & 1) != 0)
  {
    if (*(_QWORD *)(v102 + 16) && *(_BYTE *)(v102 + 8) == 1)
    {
      v39 = *(_QWORD *)v102;
      swift_retain();
      v40 = sub_20CE673F8();
    }
    else
    {
      sub_20CE31490((uint64_t)v28);
      v59 = v96;
      v60 = v97;
      (*(void (**)(char *, _QWORD, uint64_t))(v96 + 104))(v25, *MEMORY[0x24BDEB400], v97);
      v61 = sub_20CE66E40();
      v62 = *(void (**)(char *, uint64_t))(v59 + 8);
      v62(v25, v60);
      v62(v28, v60);
      if ((v61 & 1) != 0)
      {
        v40 = sub_20CE673E0();
        sub_20CE673E0();
        v63 = sub_20CE67404();
        swift_release();
        *(_QWORD *)v118 = v63;
      }
      else
      {
        v40 = sub_20CE673F8();
        sub_20CE673F8();
        v65 = sub_20CE67404();
        swift_release();
        v67 = v86;
        v66 = v87;
        v68 = v89;
        (*(void (**)(char *, _QWORD, uint64_t))(v87 + 104))(v86, *MEMORY[0x24BDF5098], v89);
        v69 = v85;
        (*(void (**)(char *, char *, uint64_t))(v66 + 16))((char *)v85 + *(int *)(v88 + 36), v67, v68);
        *v69 = v65;
        (*(void (**)(char *, uint64_t))(v66 + 8))(v67, v68);
        sub_20CE3B618((uint64_t)&qword_254996948);
      }
      v39 = sub_20CE66EB8();
    }
    v70 = v100;
    v71 = (uint64_t)v101;
    v73 = v98;
    v72 = v99;
    sub_20CE6747C();
    (*(void (**)(char *, _QWORD, uint64_t))(v72 + 104))(v73, *MEMORY[0x24BDF3FD0], v70);
    sub_20CE674DC();
    swift_release();
    (*(void (**)(char *, uint64_t))(v72 + 8))(v73, v70);
    sub_20CE671D0();
    v74 = sub_20CE671DC();
    __swift_storeEnumTagSinglePayload(v71, 0, 1, v74);
    v75 = sub_20CE674C4();
    swift_release();
    sub_20CE21AE0(v71, &qword_254996670);
    swift_retain();
    swift_retain();
    sub_20CE675CC();
    sub_20CE66EAC();
    v124 = v75;
    v125 = v40;
    v126 = v39;
    v127 = v119;
    v128 = v120;
    v129 = v121;
    v130 = v122;
    v131 = v123;
    if (qword_2549963A8 != -1)
      swift_once();
    v76 = *(double *)&xmmword_25499A170;
    sub_20CE675CC();
    sub_20CE33A2C(0.0, 1, 0.0, 1, v76, 0, 0.0, 1, (uint64_t)v118, 0.0, 1, v76, 0);
    swift_release();
    swift_release();
    swift_release();
    memcpy(v117, v118, sizeof(v117));
    memcpy(v118, v117, 0xB8uLL);
    *(_QWORD *)&v118[184] = 0x3FF0000000000000;
    *(_WORD *)&v118[192] = 0;
    v77 = v108;
    sub_20CE67008();
    v78 = v105;
    v80 = v109;
    v79 = v110;
    (*(void (**)(char *, char *, uint64_t))(v109 + 16))(&v105[*(int *)(v107 + 40)], v77, v110);
    *v78 = 0;
    v81 = v103;
    sub_20CE21AA4((uint64_t)v78, (uint64_t)&v103[*(int *)(v111 + 36)], (uint64_t *)&unk_254997170);
    memcpy(v81, v118, 0xC2uLL);
    sub_20CE3AFF8((uint64_t)v118);
    sub_20CE21AE0((uint64_t)v78, (uint64_t *)&unk_254997170);
    (*(void (**)(char *, uint64_t))(v80 + 8))(v77, v79);
    sub_20CE3AFB4((uint64_t)v117);
    v82 = v104;
    sub_20CE21A24((uint64_t)v81, v104, &qword_254997110);
    sub_20CE21AA4(v82, v113, &qword_254997110);
    swift_storeEnumTagMultiPayload();
    sub_20CE3ADF0();
    sub_20CE21164();
    v83 = (uint64_t)v115;
    sub_20CE67200();
    swift_release();
    swift_release();
    sub_20CE21AE0(v82, &qword_254997110);
    v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_254997100);
    __swift_storeEnumTagSinglePayload(v83, 0, 1, v84);
    v57 = v83;
    v58 = v116;
  }
  else
  {
    sub_20CE2930C();
    v36(v32, *MEMORY[0x24BDFBAE0], v29);
    v41 = sub_20CE66DBC();
    v38(v32, v29);
    v38(v35, v29);
    if ((v41 & 1) == 0)
    {
      v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_254997100);
      __swift_storeEnumTagSinglePayload(v116, 1, 1, v64);
      return;
    }
    v42 = *(_QWORD *)(v106 + 40);
    KeyPath = swift_getKeyPath();
    v44 = (uint64_t)v92;
    *v92 = KeyPath;
    __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
    swift_storeEnumTagMultiPayload();
    *(_QWORD *)(v44 + *(int *)(v90 + 20)) = v42;
    v45 = v116;
    if (qword_2549963A8 != -1)
      swift_once();
    sub_20CE675E4();
    sub_20CE66EAC();
    v46 = v94;
    sub_20CE20E18(v44, v94, (uint64_t (*)(_QWORD))type metadata accessor for SizedEllipsis);
    v47 = (_OWORD *)(v46 + *(int *)(v91 + 36));
    v48 = *(_OWORD *)&v118[16];
    *v47 = *(_OWORD *)v118;
    v47[1] = v48;
    v47[2] = *(_OWORD *)&v118[32];
    sub_20CE21374(v44, (uint64_t (*)(_QWORD))type metadata accessor for SizedEllipsis);
    v49 = v108;
    sub_20CE67008();
    v50 = (uint64_t)v93;
    v51 = &v93[*(int *)(v114 + 36)];
    v53 = v109;
    v52 = v110;
    (*(void (**)(char *, char *, uint64_t))(v109 + 16))(&v51[*(int *)(v107 + 40)], v49, v110);
    *v51 = 0;
    sub_20CE21AA4(v46, v50, &qword_254996610);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v49, v52);
    sub_20CE21AE0(v46, &qword_254996610);
    v54 = v95;
    sub_20CE21A24(v50, v95, &qword_254996600);
    sub_20CE21AA4(v54, v113, &qword_254996600);
    swift_storeEnumTagMultiPayload();
    sub_20CE3ADF0();
    sub_20CE21164();
    v55 = (uint64_t)v115;
    sub_20CE67200();
    sub_20CE21AE0(v54, &qword_254996600);
    v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_254997100);
    __swift_storeEnumTagSinglePayload(v55, 0, 1, v56);
    v57 = v55;
    v58 = v45;
  }
  sub_20CE21A24(v57, v58, &qword_2549970E8);
}

void sub_20CE33A2C(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  const void *v13;
  void *v23;
  _BYTE __src[112];

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_20CE67734();
    v23 = (void *)sub_20CE67224();
    sub_20CE66DD4();

  }
  sub_20CE66FD8();
  memcpy((void *)a9, v13, 0x48uLL);
  memcpy((void *)(a9 + 72), __src, 0x70uLL);
  sub_20CE3AFF8((uint64_t)v13);
}

uint64_t sub_20CE33BC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int v11;
  char v12;
  void (*v13)(char *, uint64_t);
  uint64_t v15;

  v0 = sub_20CE66E4C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v15 - v5;
  v7 = sub_20CE66DC8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CE2930C();
  v11 = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v10, v7);
  if (v11 == *MEMORY[0x24BDFBAD0])
    return sub_20CE673F8();
  if (v11 == *MEMORY[0x24BDFBAE0])
  {
    sub_20CE31490((uint64_t)v6);
    (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDEB3F0], v0);
    v12 = sub_20CE66E40();
    v13 = *(void (**)(char *, uint64_t))(v1 + 8);
    v13(v3, v0);
    v13(v6, v0);
    if ((v12 & 1) != 0)
      return sub_20CE673F8();
    return sub_20CE673E0();
  }
  else
  {
    if (v11 != *MEMORY[0x24BDFBAD8])
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    return 0;
  }
}

uint64_t sub_20CE33D50@<X0>(uint64_t *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
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
  char v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v33 = a1;
  v34 = a2;
  v35 = a3;
  v3 = sub_20CE66FC0();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (uint64_t *)((char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996850);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v32 - v10;
  v12 = sub_20CE66DC8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v32 - v17;
  sub_20CE2930C();
  (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BDFBAD0], v12);
  v19 = sub_20CE66DBC();
  v20 = *(void (**)(char *, uint64_t))(v13 + 8);
  v20(v15, v12);
  v20(v18, v12);
  if ((v19 & 1) != 0)
  {
    v21 = *v33;
    v22 = (char *)v5 + *(int *)(v3 + 20);
    v23 = *MEMORY[0x24BDEEB68];
    v24 = sub_20CE67194();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 104))(v22, v23, v24);
    *v5 = v21;
    v5[1] = v21;
    v25 = *(void **)(v34 + 16);
    if (v25)
    {
      v26 = *(id *)(v34 + 16);
    }
    else
    {
      v29 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
      v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEC14B0]), sel_initWithColor_, v29);

      v25 = 0;
    }
    v30 = v25;
    sub_20CE3429C(v26, 2, (uint64_t)v8);

    sub_20CE21374((uint64_t)v5, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
    sub_20CE21A24((uint64_t)v8, (uint64_t)v11, &qword_254996850);
    v28 = v35;
    sub_20CE21A24((uint64_t)v11, v35, &qword_254996850);
    v27 = 0;
  }
  else
  {
    v27 = 1;
    v28 = v35;
  }
  return __swift_storeEnumTagSinglePayload(v28, v27, 1, v6);
}

void sub_20CE33FF4(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  id v20;
  id v21;
  unsigned int *v22;
  uint64_t v23;
  uint64_t (*v24)(void);
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;

  *(_QWORD *)&v33 = a2;
  v34 = a3;
  v4 = sub_20CE66FCC();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_20CE675F0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v33 - v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549967A0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (_QWORD *)((char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549967A8);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = a1;
  v21 = objc_msgSend(v20, sel_blendMode, (_QWORD)v33);
  v22 = (unsigned int *)MEMORY[0x24BDF5110];
  if (v21 != (id)1)
    v22 = (unsigned int *)MEMORY[0x24BDF50D0];
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *v22, v7);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v10, v7);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v6, v13, v7);
  v23 = (uint64_t)v16 + *(int *)(v14 + 36);
  v24 = MEMORY[0x24BDEDB60];
  sub_20CE20E18((uint64_t)v6, v23, (uint64_t (*)(_QWORD))MEMORY[0x24BDEDB60]);
  *v16 = v20;
  v16[1] = sub_20CE3B400;
  v16[2] = 0;
  v25 = v20;
  sub_20CE21374((uint64_t)v6, (uint64_t (*)(_QWORD))v24);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);

  sub_20CE37F38(v25, (uint64_t)&v35);
  v26 = v35;
  v33 = v36;
  v27 = v37;
  v28 = v38;
  v29 = sub_20CE675CC();
  v31 = v30;
  sub_20CE21AA4((uint64_t)v16, (uint64_t)v19, &qword_2549967A0);
  v32 = &v19[*(int *)(v17 + 36)];
  *(_QWORD *)v32 = v26;
  *(_OWORD *)(v32 + 8) = v33;
  *((_QWORD *)v32 + 3) = v27;
  *((_QWORD *)v32 + 4) = v28;
  *((_WORD *)v32 + 20) = 256;
  *((_QWORD *)v32 + 6) = v29;
  *((_QWORD *)v32 + 7) = v31;
  sub_20CE21AE0((uint64_t)v16, &qword_2549967A0);
  sub_20CE21AA4((uint64_t)v19, v34, &qword_2549967A8);
  sub_20CE21AE0((uint64_t)v19, &qword_2549967A8);
}

void sub_20CE3429C(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  uint64_t (*v15)(void);
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  char *v22;
  unint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  unsigned int *v27;
  uint64_t v28;
  uint64_t (*v29)(void);
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char *v43;
  id v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _OWORD v53[2];
  uint64_t v54;

  v51 = a3;
  v49 = a2;
  v44 = a1;
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA260);
  MEMORY[0x24BDAC7A8](v50);
  v48 = (uint64_t)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549970A0);
  MEMORY[0x24BDAC7A8](v47);
  v46 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_20CE66FCC();
  MEMORY[0x24BDAC7A8](v5);
  v43 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_20CE675F0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v42 - v12;
  v14 = sub_20CE66FC0();
  v15 = MEMORY[0x24BDED998];
  v16 = *(_QWORD *)(v14 - 8);
  v17 = *(_QWORD *)(v16 + 64);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254996820);
  MEMORY[0x24BDAC7A8](v42);
  v20 = (uint64_t *)((char *)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  v45 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549970B0);
  MEMORY[0x24BDAC7A8](v45);
  v22 = (char *)&v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CE20E18(v52, (uint64_t)v18, (uint64_t (*)(_QWORD))v15);
  v23 = (*(unsigned __int8 *)(v16 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v24 = swift_allocObject();
  sub_20CE217D4((uint64_t)v18, v24 + v23, (uint64_t (*)(_QWORD))v15);
  v25 = v44;
  v26 = objc_msgSend(v25, sel_blendMode);
  v27 = (unsigned int *)MEMORY[0x24BDF5110];
  if (v26 != (id)1)
    v27 = (unsigned int *)MEMORY[0x24BDF50D0];
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *v27, v7);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v10, v7);
  v28 = (uint64_t)v43;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v43, v13, v7);
  v29 = MEMORY[0x24BDEDB60];
  sub_20CE20E18(v28, (uint64_t)v20 + *(int *)(v42 + 36), (uint64_t (*)(_QWORD))MEMORY[0x24BDEDB60]);
  *v20 = v25;
  v20[1] = sub_20CE3AC24;
  v20[2] = v24;
  v30 = v25;
  swift_retain();
  sub_20CE21374(v28, (uint64_t (*)(_QWORD))v29);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  swift_release();

  v31 = v30;
  v32 = v52;
  sub_20CE37F38(v31, (uint64_t)v53);
  v33 = v32;
  v34 = v48;
  sub_20CE20E18(v33, v48, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_WORD *)(v34 + *(int *)(v50 + 36)) = 256;
  v35 = (uint64_t)v46;
  sub_20CE21AA4(v34, (uint64_t)&v46[*(int *)(v47 + 36)], &qword_253CFA260);
  v36 = v53[1];
  *(_OWORD *)v35 = v53[0];
  *(_OWORD *)(v35 + 16) = v36;
  *(_QWORD *)(v35 + 32) = v54;
  sub_20CE21AE0(v34, &qword_253CFA260);
  v37 = sub_20CE675CC();
  v39 = v38;
  v40 = (uint64_t)&v22[*(int *)(v45 + 36)];
  sub_20CE21AA4(v35, v40, (uint64_t *)&unk_2549970A0);
  v41 = (uint64_t *)(v40 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254996830) + 36));
  *v41 = v37;
  v41[1] = v39;
  sub_20CE21AA4((uint64_t)v20, (uint64_t)v22, (uint64_t *)&unk_254996820);
  sub_20CE21AE0(v35, (uint64_t *)&unk_2549970A0);
  sub_20CE21AE0((uint64_t)v20, (uint64_t *)&unk_254996820);
  sub_20CE21AA4((uint64_t)v22, v51, (uint64_t *)&unk_2549970B0);
  sub_20CE21AE0((uint64_t)v22, (uint64_t *)&unk_2549970B0);
}

void sub_20CE346DC(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  AppShortcutIndexedSearchView.init(from:)(a1, a2);
}

void AppShortcutIndexedSearchView.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t *v11;
  char *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996DE8);
  v24 = *(_QWORD *)(v6 - 8);
  v25 = v6;
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v7);
  v8 = OUTLINED_FUNCTION_31_0();
  v9 = (int *)type metadata accessor for AppShortcutIndexedSearchView(v8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_39();
  *v2 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  swift_storeEnumTagMultiPayload();
  v11 = (uint64_t *)((char *)v2 + v9[5]);
  *v11 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
  swift_storeEnumTagMultiPayload();
  v12 = (char *)v2 + v9[6];
  *(_QWORD *)v12 = swift_getKeyPath();
  v12[8] = 0;
  v26 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20CE38080();
  sub_20CE678F0();
  if (v3)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    sub_20CE21AE0((uint64_t)v2, &qword_254996448);
    sub_20CE21AE0((uint64_t)v11, &qword_254996450);
    sub_20CE2D428(*(id *)v12, v12[8]);
  }
  else
  {
    v13 = OUTLINED_FUNCTION_16_1();
    v14 = (uint64_t *)((char *)v2 + v9[7]);
    *v14 = v13;
    v14[1] = v15;
    v16 = OUTLINED_FUNCTION_16_1();
    v17 = (uint64_t *)((char *)v2 + v9[8]);
    *v17 = v16;
    v17[1] = v18;
    v19 = OUTLINED_FUNCTION_16_1();
    v21 = v20;
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v4, v25);
    v22 = (uint64_t *)((char *)v2 + v9[9]);
    *v22 = v19;
    v22[1] = v21;
    sub_20CE20E18((uint64_t)v2, a2, type metadata accessor for AppShortcutIndexedSearchView);
    __swift_destroy_boxed_opaque_existential_1(v26);
    sub_20CE21374((uint64_t)v2, type metadata accessor for AppShortcutIndexedSearchView);
  }
}

uint64_t sub_20CE34974(_QWORD *a1)
{
  return AppShortcutIndexedSearchView.encode(to:)(a1);
}

uint64_t AppShortcutIndexedSearchView.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254996DF8);
  OUTLINED_FUNCTION_55_1();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_38();
  v8 = v7 - v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20CE38080();
  sub_20CE678FC();
  type metadata accessor for AppShortcutIndexedSearchView(0);
  OUTLINED_FUNCTION_20_0();
  if (!v2)
  {
    OUTLINED_FUNCTION_20_0();
    OUTLINED_FUNCTION_20_0();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v8, v1);
}

uint64_t sub_20CE34AB4()
{
  unint64_t v0;

  v0 = sub_20CE67848();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_20CE34B00(char a1)
{
  if (!a1)
    return OUTLINED_FUNCTION_11_1();
  if (a1 == 1)
    return 0xD000000000000010;
  return 0xD00000000000001DLL;
}

void sub_20CE34B50(unsigned __int8 *a1, char *a2)
{
  sub_20CE1BF3C(*a1, *a2);
}

uint64_t sub_20CE34B5C()
{
  char *v0;

  return sub_20CE1C504(*v0);
}

uint64_t sub_20CE34B64(uint64_t a1)
{
  char *v1;

  return sub_20CE1C578(a1, *v1);
}

uint64_t sub_20CE34B6C(uint64_t a1)
{
  char *v1;

  return sub_20CE1C638(a1, *v1);
}

uint64_t sub_20CE34B74@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_20CE34AB4();
  *a1 = result;
  return result;
}

void sub_20CE34BA0(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t v3;

  *a1 = sub_20CE34B00(*v1);
  a1[1] = v3;
  OUTLINED_FUNCTION_4();
}

uint64_t sub_20CE34BC4()
{
  char *v0;

  return sub_20CE34B00(*v0);
}

uint64_t sub_20CE34BCC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_20CE34AFC();
  *a1 = result;
  return result;
}

void sub_20CE34BF0(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_20CE34BFC()
{
  sub_20CE38080();
  return sub_20CE67908();
}

uint64_t sub_20CE34C24()
{
  sub_20CE38080();
  return sub_20CE67914();
}

void sub_20CE34C4C()
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
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
  _QWORD v32[2];
  _QWORD v33[2];

  OUTLINED_FUNCTION_46_0();
  v27 = v0;
  v28 = v1;
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996FE8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_254996FF0);
  v26 = *(_QWORD *)(v3 + 16);
  type metadata accessor for SpotlightUiShadow(255);
  v4 = OUTLINED_FUNCTION_67_1();
  v5 = *(_QWORD *)(v3 + 24);
  sub_20CE1EE3C((uint64_t)&unk_254996770);
  v33[0] = v5;
  v33[1] = v6;
  MEMORY[0x212B97A80](MEMORY[0x24BDED308], v4, v33);
  sub_20CE671E8();
  sub_20CE66F90();
  OUTLINED_FUNCTION_40_0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254997000);
  OUTLINED_FUNCTION_40_0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254997008);
  OUTLINED_FUNCTION_62_1();
  v7 = OUTLINED_FUNCTION_58_1();
  MEMORY[0x212B97A80](MEMORY[0x24BDF5428], v7);
  v8 = sub_20CE67590();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v25 - v10;
  v12 = sub_20CE66F90();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_47_0();
  v16 = v14 - v15;
  MEMORY[0x24BDAC7A8](v17);
  sub_20CE675C0();
  v29 = v26;
  v30 = v5;
  v31 = v27;
  sub_20CE67584();
  v18 = MEMORY[0x212B97A80](MEMORY[0x24BDF4750], v8);
  sub_20CE673B0();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v32[0] = v18;
  v32[1] = MEMORY[0x24BDEDB80];
  v19 = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v12, v32);
  sub_20CE16994(v16, v12, v19);
  v20 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
  v20(v16, v12);
  v21 = OUTLINED_FUNCTION_68();
  sub_20CE16998(v21, v22, v23);
  v24 = OUTLINED_FUNCTION_68();
  ((void (*)(uint64_t))v20)(v24);
  OUTLINED_FUNCTION_15();
}

uint64_t sub_20CE34EC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
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
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t KeyPath;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void (*v93)(uint64_t, uint64_t);
  unint64_t v94;
  char *v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  unint64_t v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  id v110;
  __int128 v111;
  char v112;
  char v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  double v117;
  uint64_t v118;
  uint64_t v119;
  double *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  unint64_t v128;
  unint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void (*v136)(char *, uint64_t);
  _QWORD v138[2];
  uint64_t v139;
  uint64_t v140;
  char *v141;
  char *v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t *v146;
  uint64_t v147;
  uint64_t v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  char *v153;
  uint64_t v154;
  uint64_t v155;
  char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  char *v172;
  _QWORD v173[2];
  _QWORD v174[2];
  _QWORD v175[2];
  _QWORD v176[2];
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  __int128 v182;
  char v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  _DWORD v188[2];
  _OWORD v189[2];
  _QWORD v190[2];
  _QWORD v191[2];
  _QWORD v192[2];
  uint64_t v193;
  uint64_t v194;
  _QWORD v195[2];
  _QWORD v196[2];
  _QWORD v197[2];
  _QWORD v198[2];
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  unsigned __int8 v202;
  __int128 v203;

  v160 = a4;
  v150 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254997010);
  MEMORY[0x24BDAC7A8](v150);
  v149 = (char *)v138 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v162 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996788);
  MEMORY[0x24BDAC7A8](v162);
  v151 = (uint64_t)v138 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v158 = __swift_instantiateConcreteTypeFromMangledName(&qword_254997008);
  MEMORY[0x24BDAC7A8](v158);
  v159 = (uint64_t)v138 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v163 = (uint64_t)v138 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_254996FF0);
  v13 = type metadata accessor for SpotlightUiShadow(255);
  v14 = sub_20CE66F90();
  sub_20CE1EE3C((uint64_t)&unk_254996770);
  v198[0] = a3;
  v198[1] = v15;
  v138[0] = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v14, v198);
  v138[1] = v14;
  v16 = sub_20CE671E8();
  v140 = v12;
  v168 = v16;
  v17 = sub_20CE66F90();
  v139 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v141 = (char *)v138 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v142 = (char *)v138 - v20;
  v21 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996FE8);
  v169 = v17;
  v22 = sub_20CE6720C();
  v154 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v153 = (char *)v138 - v23;
  v164 = v13;
  MEMORY[0x24BDAC7A8](v24);
  v146 = (_QWORD *)((char *)v138 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v26);
  v147 = (uint64_t)v138 - v27;
  v28 = sub_20CE67488();
  v144 = *(_QWORD *)(v28 - 8);
  v145 = v28;
  MEMORY[0x24BDAC7A8](v28);
  v30 = (char *)v138 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v152 = v21;
  MEMORY[0x24BDAC7A8](v31);
  v33 = (char *)v138 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v34);
  v148 = (uint64_t)v138 - v35;
  v36 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254997000);
  v167 = v22;
  v155 = v36;
  v157 = sub_20CE6720C();
  v171 = *(_QWORD *)(v157 - 8);
  MEMORY[0x24BDAC7A8](v157);
  v156 = (char *)v138 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v38);
  v172 = (char *)v138 - v39;
  v40 = a3;
  v42 = type metadata accessor for AppShortcutIndexedSearchView.BadgedIconView(0, a2, a3, v41);
  v43 = *(int *)(v42 + 36);
  v170 = a1;
  v44 = (uint64_t *)(a1 + v43);
  v45 = *v44;
  v46 = v44[1];
  v166 = v44;
  v177 = v45;
  v178 = v46;
  type metadata accessor for AppShortcutIndexedSearchView.BadgedIconView.DerivedStyles(255, a2, v40, v47);
  v165 = sub_20CE6756C();
  sub_20CE67554();
  v48 = sub_20CE35FA4();
  swift_release();
  v161 = v42;
  if (v48)
  {
    v143 = v48;
    WFImage.image.getter();
    v50 = v144;
    v49 = v145;
    (*(void (**)(char *, _QWORD, uint64_t))(v144 + 104))(v30, *MEMORY[0x24BDF3FD0], v145);
    v142 = (char *)sub_20CE674DC();
    swift_release();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v30, v49);
    sub_20CE675CC();
    sub_20CE66EAC();
    v51 = v177;
    v52 = v178;
    v53 = v179;
    v54 = v180;
    v144 = v182;
    v145 = v181;
    v55 = v166[1];
    v199 = *v166;
    v200 = v55;
    sub_20CE67554();
    v56 = *(_QWORD *)(*(_QWORD *)&v189[0] + 56);
    swift_retain();
    swift_release();
    KeyPath = swift_getKeyPath();
    v58 = v146;
    *v146 = KeyPath;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
    swift_storeEnumTagMultiPayload();
    v59 = v164;
    *(uint64_t *)((char *)v58 + *(int *)(v164 + 20)) = 0x3FA999999999999ALL;
    *(uint64_t *)((char *)v58 + *(int *)(v59 + 24)) = 0x4020000000000000;
    v60 = (uint64_t)v58;
    v61 = v147;
    sub_20CE217D4(v60, v147, type metadata accessor for SpotlightUiShadow);
    sub_20CE20E18(v61, (uint64_t)&v33[*(int *)(v152 + 36)], type metadata accessor for SpotlightUiShadow);
    *(_QWORD *)v33 = v142;
    *((_QWORD *)v33 + 1) = 0;
    *((_WORD *)v33 + 8) = 257;
    *((_QWORD *)v33 + 3) = v51;
    v33[32] = v52;
    *((_QWORD *)v33 + 5) = v53;
    v33[48] = v54;
    v62 = v144;
    *((_QWORD *)v33 + 7) = v145;
    *((_QWORD *)v33 + 8) = v62;
    *((_QWORD *)v33 + 9) = v56;
    *((_WORD *)v33 + 40) = 256;
    sub_20CE21374(v61, type metadata accessor for SpotlightUiShadow);
    v63 = v148;
    sub_20CE21A24((uint64_t)v33, v148, &qword_254996FE8);
    v64 = sub_20CE3A834();
    v65 = sub_20CE3A9C8();
    v66 = v168;
    v67 = MEMORY[0x212B97A80](MEMORY[0x24BDEF370], v168);
    v174[0] = v65;
    v174[1] = v67;
    v68 = v169;
    v69 = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v169, v174);
    v70 = v153;
    sub_20CE17C8C();
    v173[0] = v64;
    v173[1] = v69;
    v71 = v167;
    MEMORY[0x212B97A80](MEMORY[0x24BDEF3E0], v167, v173);
    sub_20CE3AA6C((uint64_t)&unk_254997068);
    sub_20CE17C8C();

    (*(void (**)(char *, uint64_t))(v154 + 8))(v70, v71);
    sub_20CE21AE0(v63, &qword_254996FE8);
    v72 = v66;
    v73 = v166;
  }
  else
  {
    v147 = a2;
    v148 = v40;
    v177 = v45;
    v178 = v46;
    sub_20CE67554();
    v75 = *(_QWORD *)(v199 + 32);
    v74 = *(_QWORD *)(v199 + 40);
    swift_bridgeObjectRetain();
    swift_release();
    if (v74)
    {
      v76 = *(_QWORD *)(v170 + *(int *)(v161 + 44) + 16);
      sub_20CE67254();
      v78 = v77;
      sub_20CE675CC();
      sub_20CE66EAC();
      v79 = v199;
      v80 = v200;
      v81 = v201;
      LODWORD(v146) = v202;
      v144 = *((_QWORD *)&v203 + 1);
      v145 = v203;
      v177 = v45;
      v178 = v46;
      sub_20CE67554();
      v82 = v75;
      v83 = *(id *)(*(_QWORD *)&v189[0] + 48);
      swift_release();
      v84 = MEMORY[0x212B96C94](objc_msgSend(v83, sel_platformColor));

      v85 = swift_getKeyPath();
      v177 = v82;
      v178 = v74;
      v179 = v76;
      v180 = v78;
      v181 = v79;
      LOBYTE(v182) = v80;
      *((_QWORD *)&v182 + 1) = v81;
      v183 = (char)v146;
      v184 = v145;
      v185 = v144;
      v186 = v85;
      v187 = v84;
      MEMORY[0x24BDAC7A8](v85);
      v86 = v148;
      v138[-4] = v147;
      v138[-3] = v86;
      v138[-2] = v170;
      v87 = sub_20CE3A9C8();
      sub_20CE675CC();
      v88 = (uint64_t)v141;
      sub_20CE672F0();
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      v72 = v168;
      v89 = MEMORY[0x212B97A80](MEMORY[0x24BDEF370], v168);
      v176[0] = v87;
      v176[1] = v89;
      v90 = v169;
      v91 = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v169, v176);
      v92 = (uint64_t)v142;
      sub_20CE16994(v88, v90, v91);
      v93 = *(void (**)(uint64_t, uint64_t))(v139 + 8);
      v93(v88, v90);
      sub_20CE16998(v92, v90, v88);
      v94 = sub_20CE3A834();
      v95 = v153;
      sub_20CE18ADC();
      v93(v88, v90);
      v175[0] = v94;
      v175[1] = v91;
      v96 = v167;
      MEMORY[0x212B97A80](MEMORY[0x24BDEF3E0], v167, v175);
      sub_20CE3AA6C((uint64_t)&unk_254997068);
      sub_20CE17C8C();
      v97 = v95;
      v68 = v90;
      v71 = v96;
      (*(void (**)(char *, uint64_t))(v154 + 8))(v97, v96);
      v93(v92, v68);
    }
    else
    {
      v98 = sub_20CE673EC();
      sub_20CE675CC();
      sub_20CE66EAC();
      v177 = v98;
      v178 = v199;
      LOBYTE(v179) = v200;
      v180 = v201;
      LOBYTE(v181) = v202;
      v182 = v203;
      v99 = sub_20CE3A834();
      v100 = sub_20CE3A9C8();
      v72 = v168;
      v101 = MEMORY[0x212B97A80](MEMORY[0x24BDEF370], v168);
      v197[0] = v100;
      v197[1] = v101;
      v68 = v169;
      v102 = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v169, v197);
      v196[0] = v99;
      v196[1] = v102;
      v71 = v167;
      MEMORY[0x212B97A80](MEMORY[0x24BDEF3E0], v167, v196);
      sub_20CE3AA6C((uint64_t)&unk_254997068);
      sub_20CE18ADC();
      swift_release();
    }
    v73 = v166;
  }
  v103 = *v73;
  v104 = v73[1];
  *(_QWORD *)&v189[0] = v103;
  *((_QWORD *)&v189[0] + 1) = v104;
  sub_20CE67554();
  v105 = *(void **)(v195[0] + 24);
  v106 = v105;
  swift_release();
  if (v105)
  {
    v107 = v161;
    v108 = v170;
    v165 = *(_QWORD *)(v170 + *(int *)(v161 + 44) + 8);
    v166 = (uint64_t *)swift_getKeyPath();
    LOBYTE(v193) = 0;
    v109 = swift_getKeyPath();
    LOBYTE(v188[0]) = 0;
    v195[0] = 0;
    v110 = v106;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254996778);
    sub_20CE67548();
    v111 = v189[0];
    v112 = v193;
    v113 = v188[0];
    if (qword_2549963B0 != -1)
      swift_once();
    v114 = __swift_project_value_buffer(v164, (uint64_t)qword_254996D80);
    v115 = (uint64_t)v149;
    sub_20CE20E18(v114, (uint64_t)&v149[*(int *)(v150 + 36)], type metadata accessor for SpotlightUiShadow);

    v116 = v165;
    *(_QWORD *)v115 = v110;
    *(_QWORD *)(v115 + 8) = v116;
    *(_QWORD *)(v115 + 16) = 0;
    *(_BYTE *)(v115 + 24) = 64;
    *(_DWORD *)(v115 + 25) = v195[0];
    *(_DWORD *)(v115 + 28) = *(_DWORD *)((char *)v195 + 3);
    *(_QWORD *)(v115 + 32) = v166;
    *(_BYTE *)(v115 + 40) = v112;
    *(_DWORD *)(v115 + 41) = v193;
    *(_DWORD *)(v115 + 44) = *(_DWORD *)((char *)&v193 + 3);
    *(_QWORD *)(v115 + 48) = v109;
    *(_OWORD *)(v115 + 72) = v189[1];
    *(_OWORD *)(v115 + 56) = v189[0];
    *(_BYTE *)(v115 + 88) = v113;
    *(_DWORD *)(v115 + 89) = v188[0];
    *(_DWORD *)(v115 + 92) = *(_DWORD *)((char *)v188 + 3);
    *(_OWORD *)(v115 + 96) = v111;
    *(_BYTE *)(v115 + 112) = 0;
    v117 = *(double *)(v108 + *(int *)(v107 + 44)) + *(double *)(v108 + *(int *)(v107 + 44) + 8) * -0.5 + 3.0;
    v118 = v151;
    sub_20CE21AA4(v115, v151, (uint64_t *)&unk_254997010);
    v119 = v162;
    v120 = (double *)(v118 + *(int *)(v162 + 36));
    *v120 = v117;
    v120[1] = v117;
    sub_20CE21AE0(v115, (uint64_t *)&unk_254997010);
    v121 = v163;
    sub_20CE21A24(v118, v163, &qword_254996788);
    v122 = 0;
    v72 = v168;
    v123 = v169;
    v124 = v167;
  }
  else
  {
    v122 = 1;
    v123 = v68;
    v119 = v162;
    v121 = v163;
    v124 = v71;
  }
  __swift_storeEnumTagSinglePayload(v121, v122, 1, v119);
  v126 = v156;
  v125 = v157;
  (*(void (**)(char *, char *, uint64_t))(v171 + 16))(v156, v172, v157);
  *(_QWORD *)&v189[0] = v126;
  v127 = v159;
  sub_20CE21AA4(v121, v159, &qword_254997008);
  *((_QWORD *)&v189[0] + 1) = v127;
  v195[0] = v125;
  v195[1] = v158;
  v128 = sub_20CE3A834();
  v129 = sub_20CE3A9C8();
  v130 = MEMORY[0x212B97A80](MEMORY[0x24BDEF370], v72);
  v192[0] = v129;
  v192[1] = v130;
  v131 = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v123, v192);
  v191[0] = v128;
  v191[1] = v131;
  v132 = MEMORY[0x24BDEF3E0];
  v133 = MEMORY[0x212B97A80](MEMORY[0x24BDEF3E0], v124, v191);
  sub_20CE3AA6C((uint64_t)&unk_254997068);
  v190[0] = v133;
  v190[1] = v134;
  v193 = MEMORY[0x212B97A80](v132, v125, v190);
  sub_20CE3AD34((uint64_t)&unk_254997070);
  v194 = v135;
  sub_20CE30BDC((uint64_t *)v189, 2, (uint64_t)v195);
  sub_20CE21AE0(v121, &qword_254997008);
  v136 = *(void (**)(char *, uint64_t))(v171 + 8);
  v136(v172, v125);
  sub_20CE21AE0(v127, &qword_254997008);
  return ((uint64_t (*)(char *, uint64_t))v136)(v126, v125);
}

uint64_t sub_20CE35D28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
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
  void (*v26)(char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[2];

  v29 = a3;
  v30 = a1;
  v33 = a4;
  v6 = type metadata accessor for SpotlightUiShadow(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (uint64_t *)((char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v28 - v10;
  v31 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_20CE66F90();
  v32 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v28 - v19;
  v22 = type metadata accessor for AppShortcutIndexedSearchView.BadgedIconView(0, a2, a3, v21);
  (*(void (**)(void))(v30 + *(int *)(v22 + 48)))();
  *v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  swift_storeEnumTagMultiPayload();
  *(uint64_t *)((char *)v8 + *(int *)(v6 + 20)) = 0x3FA999999999999ALL;
  *(uint64_t *)((char *)v8 + *(int *)(v6 + 24)) = 0x4020000000000000;
  sub_20CE217D4((uint64_t)v8, (uint64_t)v11, type metadata accessor for SpotlightUiShadow);
  v23 = v29;
  MEMORY[0x212B96BC8](v11, a2, v6, v29);
  sub_20CE21374((uint64_t)v11, type metadata accessor for SpotlightUiShadow);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v14, a2);
  sub_20CE1EE3C((uint64_t)&unk_254996770);
  v34[0] = v23;
  v34[1] = v24;
  v25 = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v15, v34);
  sub_20CE16994(v17, v15, v25);
  v26 = *(void (**)(char *, uint64_t))(v32 + 8);
  v26(v17, v15);
  sub_20CE16998((uint64_t)v20, v15, v33);
  return ((uint64_t (*)(char *, uint64_t))v26)(v20, v15);
}

void *sub_20CE35FA4()
{
  uint64_t v0;
  _QWORD *KeyPath;
  void *v2;
  id v3;

  KeyPath = (_QWORD *)swift_getKeyPath();
  sub_20CE37368(KeyPath);
  OUTLINED_FUNCTION_48_1();
  v2 = *(void **)(v0 + 16);
  v3 = v2;
  return v2;
}

void sub_20CE35FF8(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_20CE360A0(v1);
}

void sub_20CE36024(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_254997220);
  sub_20CE3B208();
  swift_getKeyPath();
  sub_20CE373D8();
  swift_release();

}

void sub_20CE360A0(void *a1)
{
  _QWORD *KeyPath;

  KeyPath = (_QWORD *)swift_getKeyPath();
  sub_20CE37478(KeyPath);
  swift_release();

}

void sub_20CE3611C(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = a2;
  v3 = a2;

}

_QWORD *sub_20CE3614C(void *a1, double a2, double a3, double a4, double a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  _QWORD *v9;
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
  double *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  id v33;
  unint64_t v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  void *v48;
  id v49;
  id v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  id v65;
  uint64_t v66;
  unint64_t v67;
  id v68;
  id v69;
  void *v70;
  char *v71;
  void (*v72)(uint64_t, char *, uint64_t);
  char *v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  void *v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  id v83;
  void *v84;
  id v85;
  uint64_t v86;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  uint64_t v102;

  v9 = v8;
  v102 = *MEMORY[0x24BDAC8D0];
  v98 = sub_20CE66E4C();
  v93 = *(_QWORD *)(v98 - 8);
  MEMORY[0x24BDAC7A8](v98);
  v14 = (char *)&v88 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254996680);
  MEMORY[0x24BDAC7A8](v15);
  v95 = (char *)&v88 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = sub_20CE66D50();
  v96 = *(_QWORD *)(v92 - 8);
  MEMORY[0x24BDAC7A8](v92);
  v91 = (char *)&v88 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v89 = (char *)&v88 - v19;
  v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253CFA440);
  MEMORY[0x24BDAC7A8](v20);
  v88 = (uint64_t)&v88 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = sub_20CE66FC0();
  MEMORY[0x24BDAC7A8](v90);
  v23 = (double *)((char *)&v88 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8[2] = 0;
  sub_20CE66D98();
  v24 = (id)WFSpotlightResultRunnableImageDisplayStyle();
  v25 = objc_msgSend(a1, sel_valueForCustomKey_, v24);

  if (v25)
  {
    objc_opt_self();
    v26 = (void *)swift_dynamicCastObjCClass();
    if (v26)
      v94 = objc_msgSend(v26, sel_unsignedIntegerValue);
    else
      v94 = 0;
    swift_unknownObjectRelease();
  }
  else
  {
    v94 = 0;
  }
  v27 = objc_msgSend(a1, sel_thumbnailSymbolName);
  v97 = a8;
  if (v27)
  {
    v28 = v27;
    v29 = sub_20CE67638();
    v31 = v30;

    v32 = HIBYTE(v31) & 0xF;
    if ((v31 & 0x2000000000000000) == 0)
      v32 = v29 & 0xFFFFFFFFFFFFLL;
    if (v32)
      goto LABEL_20;
    swift_bridgeObjectRelease();
  }
  v33 = (id)WFSpotlightResultRunnableAccessorySystemImageNameKey();
  v31 = (unint64_t)objc_msgSend(a1, sel_valueForCustomKey_, v33);

  if (v31)
  {
    v101 = v31;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549971D0);
    if (!swift_dynamicCast())
    {
LABEL_18:
      v29 = 0;
      v31 = 0;
      goto LABEL_20;
    }
    v29 = v99;
    v31 = v100;
    v34 = HIBYTE(v100) & 0xF;
    if ((v100 & 0x2000000000000000) == 0)
      v34 = v99 & 0xFFFFFFFFFFFFLL;
    if (!v34)
    {
      swift_bridgeObjectRelease();
      goto LABEL_18;
    }
  }
  else
  {
    v29 = 0;
  }
LABEL_20:
  v9[4] = v29;
  v9[5] = v31;
  sub_20CE15F68(0, &qword_253CFA470);
  swift_bridgeObjectRetain();
  v9[3] = sub_20CE1D778();
  v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEC1350]), sel_init);
  v36 = (void *)sub_20CE6762C();
  swift_bridgeObjectRelease();
  v99 = 0;
  v37 = objc_msgSend(v35, sel_colorsForBundleIdentifier_error_, v36, &v99);

  if (v37)
  {
    v38 = (id)v99;
    v39 = v37;
    v40 = objc_msgSend(v39, sel_backgroundGradient);

    v41 = v93;
    if (v40)
    {
      if ((objc_msgSend(v39, sel_isDefaultTintColor) & 1) != 0)
        v42 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
      else
        v42 = objc_msgSend(v39, sel_tintColor);
      v50 = v42;

      v45 = v96;
      goto LABEL_32;
    }

  }
  else
  {
    v43 = (id)v99;
    v44 = (void *)sub_20CE66D14();

    swift_willThrow();
    v37 = 0;
    v41 = v93;
  }
  v45 = v96;
  v46 = v98;
  (*(void (**)(char *, _QWORD, uint64_t))(v41 + 104))(v14, *MEMORY[0x24BDEB3F0], v98);
  v47 = sub_20CE66E40();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v46);
  v48 = (void *)objc_opt_self();
  if ((v47 & 1) != 0)
    v49 = objc_msgSend(v48, sel_whiteColor);
  else
    v49 = objc_msgSend(v48, sel_blackColor);
  v50 = v49;
LABEL_32:
  v9[6] = v50;
  if (v94 == (id)1)
  {
    sub_20CE2D1C8();
  }
  else
  {
    v51 = (char *)v23 + *(int *)(v90 + 20);
    v52 = *MEMORY[0x24BDEEB68];
    v53 = sub_20CE67194();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 104))(v51, v52, v53);
    *v23 = a5;
    v23[1] = a5;
    sub_20CE1EE3C((uint64_t)&unk_2549971C0);
  }
  v54 = sub_20CE675A8();
  v55 = (uint64_t)v95;
  v9[7] = v54;
  v56 = (id)WFSpotlightResultRunnableLNPropertyIdentifier();
  v57 = objc_msgSend(a1, sel_valueForCustomKey_, v56);

  if (v57)
  {
    v101 = (unint64_t)v57;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549971D0);
    if (swift_dynamicCast())
    {
      v59 = v99;
      v58 = v100;
      if (qword_2549963E8 != -1)
        swift_once();
      v60 = sub_20CE41084();
      if (v61 >> 60 == 15)
      {
        v62 = sub_20CE67710();
        v63 = v88;
        __swift_storeEnumTagSinglePayload(v88, 1, 1, v62);
        v64 = (_QWORD *)swift_allocObject();
        v64[2] = 0;
        v64[3] = 0;
        v65 = v94;
        v64[4] = v9;
        v64[5] = v65;
        v64[6] = v59;
        v64[7] = v58;
        swift_retain();
        sub_20CE30D78(v63, (uint64_t)&unk_2549971E8, (uint64_t)v64);
        swift_release();
        v55 = (uint64_t)v95;
        v45 = v96;
      }
      else
      {
        v66 = v60;
        v67 = v61;
        swift_bridgeObjectRelease();
        sub_20CE15F68(0, &qword_254996B20);
        v68 = sub_20CE36B08(v66, v67);
        v55 = (uint64_t)v95;
        v45 = v96;
        if (v68)
          goto LABEL_54;
      }
    }
  }
  v69 = objc_msgSend(a1, sel_thumbnailURL);
  if (v69)
  {
    v70 = v69;
    v71 = v91;
    sub_20CE66D38();

    v72 = *(void (**)(uint64_t, char *, uint64_t))(v45 + 32);
    v73 = v71;
    v74 = v92;
    v72(v55, v73, v92);
    __swift_storeEnumTagSinglePayload(v55, 0, 1, v74);
    if (__swift_getEnumTagSinglePayload(v55, 1, v74) != 1)
    {
      v75 = v89;
      v72((uint64_t)v89, (char *)v55, v74);
      sub_20CE15F68(0, &qword_254996B20);
      v76 = v74;
      v77 = (uint64_t)v91;
      (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v91, v75, v76);
      v68 = sub_20CE36BDC(v77);
      (*(void (**)(char *, uint64_t))(v45 + 8))(v75, v76);
      goto LABEL_54;
    }
  }
  else
  {
    __swift_storeEnumTagSinglePayload(v55, 1, 1, v92);
  }
  sub_20CE21AE0(v55, (uint64_t *)&unk_254996680);
  v78 = objc_msgSend(a1, sel_thumbnailData);
  if (!v78)
  {
    sub_20CE15F68(0, &qword_2549971C8);
    sub_20CE67638();
    v83 = sub_20CE36C58();
    if (v83)
    {
      v84 = v83;
      v85 = objc_msgSend(a1, sel_valueForCustomKey_, v83);
      if (v85)
      {
        v101 = (unint64_t)v85;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549971D0);
        if ((swift_dynamicCast() & 1) != 0)
        {
          sub_20CE15F68(0, &qword_254996B20);
          v86 = (uint64_t)v91;
          sub_20CE66D20();
          swift_bridgeObjectRelease();
          v68 = sub_20CE36BDC(v86);

          goto LABEL_54;
        }
      }

    }
    v68 = 0;
    goto LABEL_54;
  }
  v79 = v78;
  v80 = sub_20CE66D74();
  v82 = v81;

  sub_20CE15F68(0, &qword_254996B20);
  v68 = sub_20CE36B08(v80, v82);
LABEL_54:
  sub_20CE36024(v68);

  (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v97, v98);
  return v9;
}

id sub_20CE36B08(uint64_t a1, unint64_t a2)
{
  void *v4;
  id v5;

  v4 = (void *)sub_20CE66D5C();
  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_imageWithData_, v4);
  sub_20CE1ED64(a1, a2);

  return v5;
}

uint64_t sub_20CE36B70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v11;

  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v11;
  *v11 = v7;
  v11[1] = sub_20CE2E74C;
  return sub_20CE36CC8(a5, a6, a7);
}

id sub_20CE36BDC(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v3 = (void *)sub_20CE66D2C();
  v4 = objc_msgSend(v2, sel_initWithContentsOfURL_, v3);

  v5 = sub_20CE66D50();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  return v4;
}

id sub_20CE36C58()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_20CE6762C();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithKeyName_, v1);

  return v2;
}

uint64_t sub_20CE36CC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  v4[20] = a3;
  v4[21] = v3;
  v4[18] = a1;
  v4[19] = a2;
  v4[22] = *v3;
  v5 = sub_20CE66DEC();
  v4[23] = v5;
  v4[24] = *(_QWORD *)(v5 - 8);
  v4[25] = swift_task_alloc();
  v4[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20CE36D44()
{
  _QWORD *v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v18;

  v0[27] = *MEMORY[0x24BEC1910];
  sub_20CE66DB0();
  v1 = sub_20CE66DE0();
  v2 = sub_20CE6771C();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)OUTLINED_FUNCTION_43_0();
    v18 = OUTLINED_FUNCTION_43_0();
    *(_DWORD *)v3 = 136315138;
    v4 = sub_20CE67920();
    sub_20CE29ED4(v4, v5, &v18);
    v0[17] = v6;
    sub_20CE67764();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_20CE0F000, v1, v2, "%s: Fetching image asynchronously", v3, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_14_0();
  }
  v7 = v0[26];
  v8 = v0[23];
  v9 = v0[24];

  v10 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  v10(v7, v8);
  v0[28] = v10;
  v11 = v0[18];
  v12 = objc_allocWithZone(MEMORY[0x24BEC1408]);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_51_1();
  v13 = (void *)sub_20CE6762C();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v12, sel_initWithLNPropertyIdentifier_displayStyle_, v13, v11);
  v0[29] = v14;

  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_20CE36F84;
  v15 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v16 = v0 + 10;
  v16[1] = 0x40000000;
  v16[2] = sub_20CE372BC;
  v16[3] = &block_descriptor_0;
  v16[4] = v15;
  objc_msgSend(v14, sel_loadLNPropertyImageWithCompletion_, v16);
  return swift_continuation_await();
}

uint64_t sub_20CE36F84()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 240) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_20CE36FE4()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v1 = *(void **)(v0 + 120);
  v2 = objc_msgSend(v1, sel_imageData);
  if (v2)
  {
    v3 = v2;
    v4 = sub_20CE66D74();
    v6 = v5;

    if (qword_2549963E8 != -1)
      swift_once();
    v7 = *(void **)(v0 + 232);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_50_1();
    sub_20CE41104(v4, v6);
    sub_20CE15F68(0, &qword_254996B20);
    OUTLINED_FUNCTION_50_1();
    v8 = sub_20CE36B08(v4, v6);
    sub_20CE36024(v8);

    sub_20CE1ED64(v4, v6);
  }
  else
  {
    v9 = *(void **)(v0 + 232);

  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20CE3711C()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  void *v11;

  v1 = *(void **)(v0 + 240);
  swift_willThrow();
  sub_20CE66DB0();
  v2 = v1;
  v3 = v1;
  v4 = sub_20CE66DE0();
  v5 = sub_20CE67728();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 240);
    v7 = (uint8_t *)OUTLINED_FUNCTION_43_0();
    v8 = (_QWORD *)OUTLINED_FUNCTION_43_0();
    *(_DWORD *)v7 = 138412290;
    v9 = v6;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 128) = v10;
    sub_20CE67764();
    *v8 = v10;
    OUTLINED_FUNCTION_25_1();
    OUTLINED_FUNCTION_25_1();
    _os_log_impl(&dword_20CE0F000, v4, v5, "Failed to load entity image: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254997210);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_14_0();
  }
  v11 = *(void **)(v0 + 232);
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_25_1();

  (*(void (**)(_QWORD, _QWORD))(v0 + 224))(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 184));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20CE372BC(uint64_t result, void *a2, void *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(result + 32);
  if (a3)
    return sub_20CE37308(v3, (uint64_t)a3);
  if (a2)
    return sub_20CE37358(v3, (uint64_t)a2);
  __break(1u);
  return result;
}

uint64_t sub_20CE37308(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254997218);
  swift_allocError();
  *v3 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_20CE37358(uint64_t a1, uint64_t a2)
{
  **(_QWORD **)(*(_QWORD *)(a1 + 64) + 40) = a2;
  return swift_continuation_throwingResume();
}

uint64_t sub_20CE37368(_QWORD *a1)
{
  MEMORY[0x212B97A80](&unk_20CE6C650, *(_QWORD *)(*a1 + *MEMORY[0x24BEE46A8]));
  return sub_20CE66D8C();
}

uint64_t sub_20CE373D8()
{
  sub_20CE3B618((uint64_t)&unk_254997290);
  return sub_20CE66D80();
}

uint64_t sub_20CE37478(_QWORD *a1)
{
  MEMORY[0x212B97A80](&unk_20CE6C650, *(_QWORD *)(*a1 + *MEMORY[0x24BEE46A8]));
  return sub_20CE66D80();
}

void sub_20CE37520()
{
  id *v0;
  uint64_t v1;

  swift_bridgeObjectRelease();
  swift_release();
  v1 = sub_20CE66DA4();
  OUTLINED_FUNCTION_26(v1);
  OUTLINED_FUNCTION_4();
}

uint64_t sub_20CE37578()
{
  sub_20CE37520();
  return swift_deallocClassInstance();
}

double sub_20CE375A0()
{
  double result;

  result = 60.0;
  xmmword_25499A170 = xmmword_20CE6C130;
  *(_OWORD *)&qword_25499A180 = xmmword_20CE6C140;
  return result;
}

BOOL sub_20CE375C0(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  _BOOL4 v8;

  v8 = a1 == a5;
  if (a2 != a6)
    v8 = 0;
  if (a3 != a7)
    v8 = 0;
  return a4 == a8 && v8;
}

BOOL sub_20CE375E4(double *a1, double *a2)
{
  return sub_20CE375C0(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

void *sub_20CE375F8(double a1)
{
  char v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD __src[16];
  _BYTE v9[135];

  OUTLINED_FUNCTION_22();
  v5 = v4;
  v6 = sub_20CE671B8();
  sub_20CE37690(v2, v1 & 1, __src);
  memcpy(&v9[7], __src, 0x80uLL);
  *(_QWORD *)v5 = v6;
  *(double *)(v5 + 8) = a1;
  *(_BYTE *)(v5 + 16) = 0;
  return memcpy((void *)(v5 + 17), v9, 0x87uLL);
}

uint64_t sub_20CE37690@<X0>(void *a1@<X0>, char a2@<W1>, _QWORD *a3@<X8>)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t KeyPath;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;

  v63 = a3;
  v4 = a2 & 1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA3E8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_20CE67290();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CE2FBB8(a1, v4);
  v12 = sub_20CE29AAC();
  sub_20CE2D428(a1, v4);
  v13 = sub_20CE3A740(v12, (SEL *)&selRef_displayName);
  v61 = v9;
  v62 = v8;
  if (v14)
  {
    v71 = v13;
    v72 = v14;
    sub_20CE21A50();
    v15 = sub_20CE672CC();
    v17 = v16;
    v68 = v18;
    v20 = v19 & 1;
    (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BDF18F0], v8);
    v21 = sub_20CE67248();
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v21);
    sub_20CE67278();
    sub_20CE21AE0((uint64_t)v7, &qword_253CFA3E8);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    sub_20CE67260();
    sub_20CE67284();
    swift_release();
    v70 = sub_20CE672C0();
    v65 = v23;
    v66 = v22;
    v25 = v24;
    swift_release();
    v69 = v25 & 1;
    sub_20CE21A8C(v15, v17, v20);
    swift_bridgeObjectRelease();
    KeyPath = swift_getKeyPath();
    v64 = 0x3FF0000000000000;
    v67 = 3;
    v68 = KeyPath;
  }
  else
  {
    v69 = 0;
    v70 = 0;
    v65 = 0;
    v66 = 0;
    v67 = 0;
    v68 = 0;
    v64 = 0;
  }
  sub_20CE2FBB8(a1, v4);
  v27 = sub_20CE29AAC();
  sub_20CE2D428(a1, v4);
  v28 = sub_20CE3A740(v27, (SEL *)&selRef_subtitle);
  if (v29)
  {
    v71 = v28;
    v72 = v29;
    sub_20CE21A50();
    v30 = sub_20CE672CC();
    v32 = v31;
    v34 = v33 & 1;
    v36 = v61;
    v35 = v62;
    (*(void (**)(char *, _QWORD, uint64_t))(v61 + 104))(v11, *MEMORY[0x24BDF1860], v62);
    v37 = sub_20CE67248();
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v37);
    sub_20CE67278();
    sub_20CE21AE0((uint64_t)v7, &qword_253CFA3E8);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v35);
    v38 = sub_20CE672C0();
    v61 = v39;
    v62 = v38;
    v41 = v40;
    v60 = v42;
    swift_release();
    v43 = v41 & 1;
    sub_20CE21A8C(v30, v32, v34);
    swift_bridgeObjectRelease();
    v44 = swift_getKeyPath();
    v45 = 0x3FF0000000000000;
    v46 = 3;
  }
  else
  {
    v61 = 0;
    v62 = 0;
    v43 = 0;
    v60 = 0;
    v44 = 0;
    v46 = 0;
    v45 = 0;
  }
  v47 = v63;
  v48 = v70;
  v49 = v65;
  v50 = v66;
  *v63 = v70;
  v47[1] = v50;
  v51 = v69;
  v47[2] = v69;
  v47[3] = v49;
  v52 = v51;
  v69 = v51;
  v53 = v68;
  v47[4] = v68;
  v68 = v53;
  v54 = v67;
  v47[5] = v67;
  v47[6] = 0;
  v67 = v54;
  v56 = v61;
  v55 = v62;
  v47[7] = v64;
  v47[8] = v55;
  v47[9] = v56;
  v47[10] = v43;
  v57 = v60;
  v47[11] = v60;
  v47[12] = v44;
  v47[13] = v46;
  v47[14] = 0;
  v47[15] = v45;
  sub_20CE3A7A8(v48, v50, v52, v49);
  sub_20CE3A7A8(v55, v56, v43, v57);
  sub_20CE3A7E4(v55, v56, v43, v57);
  return sub_20CE3A7E4(v70, v50, v69, v49);
}

void sub_20CE37B00(uint64_t *a1@<X8>)
{
  *a1 = sub_20CE67038();
  OUTLINED_FUNCTION_4();
}

uint64_t sub_20CE37B24(id *a1)
{
  id v1;

  v1 = *a1;
  return sub_20CE67044();
}

uint64_t type metadata accessor for AppShortcutIndexedSearchView.DerivedStyles(uint64_t a1)
{
  return sub_20CE15EE0(a1, qword_254996F40);
}

void *sub_20CE37B64()
{
  uint64_t v0;

  return sub_20CE375F8(*(double *)(v0 + 16));
}

BOOL sub_20CE37B7C(double *a1, double *a2)
{
  return *a1 == *a2 && (sub_20CE66E10() & 1) != 0 && a1[5] == a2[5] && a1[6] == a2[6] && a1[7] == a2[7];
}

void sub_20CE37C00()
{
  uint64_t v0;
  _QWORD *v1;

  v0 = OUTLINED_FUNCTION_30_1();
  __swift_allocate_value_buffer(v0, qword_254996D80);
  v1 = (_QWORD *)__swift_project_value_buffer(v0, (uint64_t)qword_254996D80);
  *v1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  OUTLINED_FUNCTION_24();
  *(_QWORD *)((char *)v1 + *(int *)(v0 + 20)) = 0x3FBEB851EB851EB8;
  *(_QWORD *)((char *)v1 + *(int *)(v0 + 24)) = 0x4018000000000000;
  OUTLINED_FUNCTION_4();
}

void static SpotlightUiShadow.badge.getter(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2549963B0 != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_30_1();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_254996D80);
  sub_20CE20E18(v3, a1, type metadata accessor for SpotlightUiShadow);
  OUTLINED_FUNCTION_4();
}

void SpotlightUiShadow.body(content:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996E00);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_40();
  sub_20CE673E0();
  if ((sub_20CE37DE0() & 1) != 0)
    OUTLINED_FUNCTION_30_1();
  v8 = sub_20CE67404();
  swift_release();
  v9 = *(_QWORD *)(v2 + *(int *)(OUTLINED_FUNCTION_30_1() + 24));
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996E08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v3, a1, v10);
  v11 = (uint64_t *)(v3 + *(int *)(v6 + 36));
  *v11 = v8;
  v11[1] = v9;
  v11[2] = 0;
  v11[3] = 0;
  sub_20CE21A24(v3, a2, &qword_254996E00);
}

uint64_t sub_20CE37DE0()
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  char v19;
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  OUTLINED_FUNCTION_46_0();
  v24 = v3;
  v25 = v4;
  v5 = v1;
  OUTLINED_FUNCTION_42_1();
  OUTLINED_FUNCTION_55_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_47_0();
  v9 = v7 - v8;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v23 - v11;
  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_38();
  v16 = v15 - v14;
  v17 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v18 = objc_msgSend(v17, sel_userInterfaceIdiom);

  sub_20CE20E18(v5, v16, type metadata accessor for SpotlightUiShadow);
  if (v18 == (id)1)
  {
    sub_20CE2930C();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v9, *MEMORY[0x24BDFBAE0], v0);
    v19 = sub_20CE66DBC();
    v20 = *(void (**)(uint64_t))(v2 + 8);
    v21 = OUTLINED_FUNCTION_51_1();
    v20(v21);
    ((void (*)(char *, uint64_t))v20)(v12, v0);
  }
  else
  {
    v19 = 0;
  }
  sub_20CE21374(v16, type metadata accessor for SpotlightUiShadow);
  return v19 & 1;
}

__n128 sub_20CE37F38@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __n128 result;
  uint64_t v4;
  __n128 v5;
  __int128 v6;

  Gradient.init(_:)(a1);
  sub_20CE66F54();
  result = v5;
  *(_QWORD *)a2 = v4;
  *(__n128 *)(a2 + 8) = v5;
  *(_OWORD *)(a2 + 24) = v6;
  return result;
}

uint64_t sub_20CE37FEC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_20CE38050;
  return v6(a1);
}

uint64_t sub_20CE38050()
{
  uint64_t v0;

  OUTLINED_FUNCTION_13_0();
  return OUTLINED_FUNCTION_24_1(*(uint64_t (**)(void))(v0 + 8));
}

unint64_t sub_20CE38080()
{
  unint64_t result;

  result = qword_254996DF0;
  if (!qword_254996DF0)
  {
    result = MEMORY[0x212B97A80](&unk_20CE6C66C, &unk_24C5A9B20);
    atomic_store(result, (unint64_t *)&qword_254996DF0);
  }
  return result;
}

uint64_t type metadata accessor for SpotlightUiShadow(uint64_t a1)
{
  return sub_20CE15EE0(a1, (uint64_t *)&unk_254996ED8);
}

void sub_20CE380D0()
{
  sub_20CE1EE3C((uint64_t)&unk_254996E10);
}

void sub_20CE380FC()
{
  sub_20CE1EE3C((uint64_t)&unk_254996E18);
}

void sub_20CE38128()
{
  sub_20CE1EE3C((uint64_t)&unk_254996E20);
}

uint64_t sub_20CE38154()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20CE38164()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for AppShortcutIndexedSearchView(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  id v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_20CE66DC8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = a3[5];
    v10 = (uint64_t *)((char *)a1 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_20CE66E4C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v13 = a3[6];
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    v16 = *(id *)v15;
    v17 = v15[8];
    sub_20CE2FBB8(*(id *)v15, v17);
    *(_QWORD *)v14 = v16;
    v14[8] = v17;
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
    v27 = (uint64_t *)((char *)a1 + v26);
    v28 = (uint64_t *)((char *)a2 + v26);
    v29 = v28[1];
    *v27 = *v28;
    v27[1] = v29;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for AppShortcutIndexedSearchView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_20CE66DC8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  v5 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_20CE66E4C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  sub_20CE2D428(*(id *)(a1 + *(int *)(a2 + 24)), *(_BYTE *)(a1 + *(int *)(a2 + 24) + 8));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for AppShortcutIndexedSearchView(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_20CE66DC8();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = a3[5];
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_20CE66E4C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v11 = a3[6];
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = *(id *)v13;
  v15 = v13[8];
  sub_20CE2FBB8(*(id *)v13, v15);
  *(_QWORD *)v12 = v14;
  v12[8] = v15;
  v16 = a3[7];
  v17 = a3[8];
  v18 = (_QWORD *)((char *)a1 + v16);
  v19 = (_QWORD *)((char *)a2 + v16);
  v20 = v19[1];
  *v18 = *v19;
  v18[1] = v20;
  v21 = (_QWORD *)((char *)a1 + v17);
  v22 = (_QWORD *)((char *)a2 + v17);
  v23 = v22[1];
  *v21 = *v22;
  v21[1] = v23;
  v24 = a3[9];
  v25 = (_QWORD *)((char *)a1 + v24);
  v26 = (_QWORD *)((char *)a2 + v24);
  v27 = v26[1];
  *v25 = *v26;
  v25[1] = v27;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for AppShortcutIndexedSearchView(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  id v14;
  char v15;
  void *v16;
  char v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;

  if (a1 != a2)
  {
    sub_20CE21AE0((uint64_t)a1, (uint64_t *)&unk_2549963F8);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_20CE66DC8();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v7 = a3[5];
    v8 = (_QWORD *)((char *)a1 + v7);
    v9 = (_QWORD *)((char *)a2 + v7);
    sub_20CE21AE0((uint64_t)a1 + v7, &qword_253CFA240);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_20CE66E4C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v11 = a3[6];
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = *(id *)v13;
  v15 = v13[8];
  sub_20CE2FBB8(*(id *)v13, v15);
  v16 = *(void **)v12;
  v17 = v12[8];
  *(_QWORD *)v12 = v14;
  v12[8] = v15;
  sub_20CE2D428(v16, v17);
  v18 = a3[7];
  v19 = (_QWORD *)((char *)a1 + v18);
  v20 = (_QWORD *)((char *)a2 + v18);
  *v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21 = a3[8];
  v22 = (_QWORD *)((char *)a1 + v21);
  v23 = (_QWORD *)((char *)a2 + v21);
  *v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v24 = a3[9];
  v25 = (_QWORD *)((char *)a1 + v24);
  v26 = (_QWORD *)((char *)a2 + v24);
  *v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *initializeWithTake for AppShortcutIndexedSearchView(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_20CE66DC8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v12 = sub_20CE66E4C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  v13 = a3[6];
  v14 = a3[7];
  v15 = &a1[v13];
  v16 = &a2[v13];
  *(_QWORD *)v15 = *(_QWORD *)v16;
  v15[8] = v16[8];
  *(_OWORD *)&a1[v14] = *(_OWORD *)&a2[v14];
  v17 = a3[9];
  *(_OWORD *)&a1[a3[8]] = *(_OWORD *)&a2[a3[8]];
  *(_OWORD *)&a1[v17] = *(_OWORD *)&a2[v17];
  return a1;
}

char *assignWithTake for AppShortcutIndexedSearchView(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void *v17;
  char v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
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

  if (a1 != a2)
  {
    sub_20CE21AE0((uint64_t)a1, (uint64_t *)&unk_2549963F8);
    v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_20CE66DC8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = &a2[v8];
    sub_20CE21AE0((uint64_t)&a1[v8], &qword_253CFA240);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_20CE66E4C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  v13 = a3[6];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = *(_QWORD *)v15;
  LOBYTE(v15) = v15[8];
  v17 = *(void **)v14;
  v18 = v14[8];
  *(_QWORD *)v14 = v16;
  v14[8] = (char)v15;
  sub_20CE2D428(v17, v18);
  v19 = a3[7];
  v20 = &a1[v19];
  v21 = &a2[v19];
  v23 = *(_QWORD *)v21;
  v22 = *((_QWORD *)v21 + 1);
  *(_QWORD *)v20 = v23;
  *((_QWORD *)v20 + 1) = v22;
  swift_bridgeObjectRelease();
  v24 = a3[8];
  v25 = &a1[v24];
  v26 = &a2[v24];
  v28 = *(_QWORD *)v26;
  v27 = *((_QWORD *)v26 + 1);
  *(_QWORD *)v25 = v28;
  *((_QWORD *)v25 + 1) = v27;
  swift_bridgeObjectRelease();
  v29 = a3[9];
  v30 = &a1[v29];
  v31 = &a2[v29];
  v33 = *(_QWORD *)v31;
  v32 = *((_QWORD *)v31 + 1);
  *(_QWORD *)v30 = v33;
  *((_QWORD *)v30 + 1) = v32;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppShortcutIndexedSearchView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_20CE38AF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_22();
  if (*(_DWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254996448) - 8) + 84) == (_DWORD)v3)
  {
    v6 = OUTLINED_FUNCTION_54();
LABEL_5:
    OUTLINED_FUNCTION_14(v6, v3, v7);
    return;
  }
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996450);
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v8;
    v6 = v4 + *(int *)(a3 + 20);
    goto LABEL_5;
  }
  OUTLINED_FUNCTION_67(*(_QWORD *)(v4 + *(int *)(a3 + 28) + 8));
  OUTLINED_FUNCTION_21();
}

uint64_t storeEnumTagSinglePayload for AppShortcutIndexedSearchView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_20CE38B88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  OUTLINED_FUNCTION_22();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254996448);
  OUTLINED_FUNCTION_43();
  if (v10)
  {
    v8 = v7;
    v9 = v5;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254996450);
    OUTLINED_FUNCTION_43();
    if (!v10)
    {
      *(_QWORD *)(v5 + *(int *)(a4 + 28) + 8) = (v4 - 1);
      OUTLINED_FUNCTION_21();
      return;
    }
    v8 = v11;
    v9 = v5 + *(int *)(a4 + 20);
  }
  OUTLINED_FUNCTION_26_0(v9, v4, v4, v8);
}

void sub_20CE38C0C()
{
  unint64_t v0;
  unint64_t v1;

  sub_20CE12734(319, (unint64_t *)&unk_2549964B0, (void (*)(uint64_t))MEMORY[0x24BDFBAE8]);
  if (v0 <= 0x3F)
  {
    sub_20CE12734(319, (unint64_t *)&qword_253CFA248, (void (*)(uint64_t))MEMORY[0x24BDEB418]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t sub_20CE38CCC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20CE66DA4();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for AppShortcutIndexedSearchView.BadgedIconView.DerivedStyles(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AppShortcutIndexedSearchView.BadgedIconView.DerivedStyles);
}

uint64_t *initializeBufferWithCopyOfBuffer for SpotlightUiShadow(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_20CE66DC8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
  }
  return a1;
}

uint64_t destroy for SpotlightUiShadow(uint64_t a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v2 = sub_20CE66DC8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

_QWORD *initializeWithCopy for SpotlightUiShadow(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_20CE66DC8();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  *(_QWORD *)((char *)a1 + v7) = *(_QWORD *)((char *)a2 + v7);
  return a1;
}

_QWORD *assignWithCopy for SpotlightUiShadow(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_20CE21AE0((uint64_t)a1, (uint64_t *)&unk_2549963F8);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_20CE66DC8();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

char *initializeWithTake for SpotlightUiShadow(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_20CE66DC8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = *(int *)(a3 + 24);
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];
  return a1;
}

char *assignWithTake for SpotlightUiShadow(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a1 != a2)
  {
    sub_20CE21AE0((uint64_t)a1, (uint64_t *)&unk_2549963F8);
    v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_20CE66DC8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = *(int *)(a3 + 24);
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];
  return a1;
}

uint64_t getEnumTagSinglePayload for SpotlightUiShadow()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20CE391C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_22();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254996448);
  v1 = OUTLINED_FUNCTION_54();
  return __swift_getEnumTagSinglePayload(v1, v0, v2);
}

uint64_t storeEnumTagSinglePayload for SpotlightUiShadow()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20CE39200()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_22();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254996448);
  v0 = OUTLINED_FUNCTION_61_1();
  return __swift_storeEnumTagSinglePayload(v0, v1, v2, v3);
}

void sub_20CE3922C()
{
  unint64_t v0;

  sub_20CE12734(319, (unint64_t *)&unk_2549964B0, (void (*)(uint64_t))MEMORY[0x24BDFBAE8]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_20CE392B4()
{
  sub_20CE3AD34((uint64_t)&unk_254996EE8);
}

unint64_t sub_20CE392E0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_254996EF0;
  if (!qword_254996EF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996DB8);
    v2 = sub_20CE39364();
    sub_20CE3B618((uint64_t)&unk_254996F20);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_254996EF0);
  }
  return result;
}

unint64_t sub_20CE39364()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_254996EF8;
  if (!qword_254996EF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996DB0);
    v2 = sub_20CE393E8();
    sub_20CE3B618((uint64_t)&unk_254996510);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_254996EF8);
  }
  return result;
}

unint64_t sub_20CE393E8()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_254996F00;
  if (!qword_254996F00)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996DA8);
    v2 = sub_20CE3946C();
    sub_20CE3B618((uint64_t)&unk_253CFA3D0);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_254996F00);
  }
  return result;
}

unint64_t sub_20CE3946C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_254996F08;
  if (!qword_254996F08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996DA0);
    sub_20CE3B618((uint64_t)&unk_254996F10);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254996F08);
  }
  return result;
}

unint64_t sub_20CE394F4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_254996F28;
  if (!qword_254996F28)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996E00);
    sub_20CE3B618((uint64_t)&unk_254996F30);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDEC468];
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254996F28);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TopHitCollectionViewStyle(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_20CE39600(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20CE3964C + 4 * byte_20CE6C155[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_20CE39680 + 4 * byte_20CE6C150[v4]))();
}

uint64_t sub_20CE39680(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CE39688(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20CE39690);
  return result;
}

uint64_t sub_20CE3969C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20CE396A4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_20CE396A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CE396B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for AppShortcutIndexedSearchView.CodingKeys()
{
  OUTLINED_FUNCTION_49();
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

uint64_t sub_20CE396DC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 64))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_20CE396FC(uint64_t result, int a2, int a3)
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

void type metadata accessor for AppShortcutIndexedSearchView.Metrics()
{
  OUTLINED_FUNCTION_49();
}

char *sub_20CE39744(char *a1, char **a2, uint64_t a3)
{
  int v5;
  char *v7;
  char v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  char *v18;
  char *v19;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = &v19[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    v7 = *a2;
    v8 = *((_BYTE *)a2 + 8);
    sub_20CE3982C(*a2, v8);
    *(_QWORD *)a1 = v7;
    a1[8] = v8;
    v9 = a2[2];
    *((_QWORD *)a1 + 2) = v9;
    v10 = *(int *)(a3 + 24);
    v11 = &a1[v10];
    v12 = (uint64_t)a2 + v10;
    *(_QWORD *)&a1[v10] = *(char **)((char *)a2 + v10);
    v13 = *(int *)(type metadata accessor for TopHitViewTextStyle.Resolved(0) + 20);
    v14 = &v11[v13];
    v15 = v12 + v13;
    v16 = sub_20CE675F0();
    v17 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
    v18 = v9;
    swift_retain();
    v17(v14, v15, v16);
  }
  return a1;
}

id sub_20CE3982C(void *a1, char a2)
{
  if ((a2 & 1) != 0)
    return (id)swift_retain();
  else
    return a1;
}

uint64_t sub_20CE39838(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_20CE398A4(*(void **)a1, *(_BYTE *)(a1 + 8));

  v4 = a1 + *(int *)(a2 + 24);
  swift_release();
  v5 = v4 + *(int *)(type metadata accessor for TopHitViewTextStyle.Resolved(0) + 20);
  v6 = sub_20CE675F0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

void sub_20CE398A4(void *a1, char a2)
{
  if ((a2 & 1) != 0)
    swift_release();
  else

}

uint64_t sub_20CE398B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  id v17;

  v6 = *(void **)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_20CE3982C(*(void **)a2, v7);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  v8 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v8;
  v9 = *(int *)(a3 + 24);
  v10 = a1 + v9;
  v11 = a2 + v9;
  *(_QWORD *)(a1 + v9) = *(_QWORD *)(a2 + v9);
  v12 = *(int *)(type metadata accessor for TopHitViewTextStyle.Resolved(0) + 20);
  v13 = v10 + v12;
  v14 = v11 + v12;
  v15 = sub_20CE675F0();
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
  v17 = v8;
  swift_retain();
  v16(v13, v14, v15);
  return a1;
}

uint64_t sub_20CE3996C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;

  v6 = *(void **)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_20CE3982C(*(void **)a2, v7);
  v8 = *(void **)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_20CE398A4(v8, v9);
  v10 = *(void **)(a1 + 16);
  v11 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  v12 = v11;

  v13 = *(int *)(a3 + 24);
  v14 = a1 + v13;
  v15 = (_QWORD *)(a2 + v13);
  *(_QWORD *)(a1 + v13) = *v15;
  swift_retain();
  swift_release();
  v16 = *(int *)(type metadata accessor for TopHitViewTextStyle.Resolved(0) + 20);
  v17 = v14 + v16;
  v18 = (char *)v15 + v16;
  v19 = sub_20CE675F0();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 24))(v17, v18, v19);
  return a1;
}

uint64_t sub_20CE39A38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(int *)(a3 + 24);
  v5 = a1 + v4;
  v6 = a2 + v4;
  *(_QWORD *)(a1 + v4) = *(_QWORD *)(a2 + v4);
  v7 = *(int *)(type metadata accessor for TopHitViewTextStyle.Resolved(0) + 20);
  v8 = v5 + v7;
  v9 = v6 + v7;
  v10 = sub_20CE675F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_20CE39AC0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;

  v6 = *a2;
  v7 = *((_BYTE *)a2 + 8);
  v8 = *(void **)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_20CE398A4(v8, v9);
  v10 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = a2[2];

  v11 = *(int *)(a3 + 24);
  v12 = a1 + v11;
  v13 = (uint64_t *)((char *)a2 + v11);
  *(_QWORD *)(a1 + v11) = *v13;
  swift_release();
  v14 = *(int *)(type metadata accessor for TopHitViewTextStyle.Resolved(0) + 20);
  v15 = v12 + v14;
  v16 = (char *)v13 + v14;
  v17 = sub_20CE675F0();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 40))(v15, v16, v17);
  return a1;
}

uint64_t sub_20CE39B6C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_20CE39B78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_DWORD)a2 == 2147483646)
  {
    OUTLINED_FUNCTION_21();
  }
  else
  {
    v6 = OUTLINED_FUNCTION_43_1();
    OUTLINED_FUNCTION_14(a1 + *(int *)(a3 + 24), a2, v6);
  }
}

uint64_t sub_20CE39BE4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_20CE39BF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_22();
  if (v3 == 2147483646)
  {
    *(_QWORD *)(v1 + 16) = v0;
    OUTLINED_FUNCTION_21();
  }
  else
  {
    v4 = v2;
    v5 = OUTLINED_FUNCTION_43_1();
    OUTLINED_FUNCTION_26_0(v1 + *(int *)(v4 + 24), v0, v0, v5);
  }
}

uint64_t sub_20CE39C44()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for TopHitViewTextStyle.Resolved(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_20CE39CC4(uint64_t a1)
{
  sub_20CE2D428(*(id *)a1, *(_BYTE *)(a1 + 8));
}

void sub_20CE39CD4(uint64_t a1, uint64_t a2)
{
  id v4;
  char v5;

  v4 = *(id *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_20CE2FBB8(*(id *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  OUTLINED_FUNCTION_21();
}

uint64_t sub_20CE39D1C(uint64_t a1, uint64_t a2)
{
  id v4;
  char v5;
  void *v6;
  char v7;

  v4 = *(id *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_20CE2FBB8(*(id *)a2, v5);
  v6 = *(void **)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_20CE2D428(v6, v7);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  return a1;
}

uint64_t sub_20CE39D78(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  char v5;
  void *v6;
  char v7;

  v4 = *a2;
  v5 = *((_BYTE *)a2 + 8);
  v6 = *(void **)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_20CE2D428(v6, v7);
  *(_QWORD *)(a1 + 16) = a2[2];
  return a1;
}

uint64_t sub_20CE39DC0(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 24))
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

uint64_t sub_20CE39E00(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

void type metadata accessor for AppShortcutIndexedSearchView.LabelsView()
{
  OUTLINED_FUNCTION_49();
}

void sub_20CE39E50()
{
  unint64_t v0;

  sub_20CE12734(319, (unint64_t *)&unk_2549964B0, (void (*)(uint64_t))MEMORY[0x24BDFBAE8]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t *sub_20CE39EF8(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  _OWORD *v18;
  __int128 v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  id v23;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_20CE66DC8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      *v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = a3[9];
    v10 = a3[10];
    v11 = (uint64_t *)((char *)v4 + v9);
    v12 = (uint64_t *)((char *)a2 + v9);
    v13 = v12[1];
    *v11 = *v12;
    v11[1] = v13;
    v14 = *(void **)((char *)a2 + v10);
    *(uint64_t *)((char *)v4 + v10) = (uint64_t)v14;
    v15 = a3[11];
    v16 = a3[12];
    v17 = (_OWORD *)((char *)v4 + v15);
    v18 = (_OWORD *)((char *)a2 + v15);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    v20 = (uint64_t *)((char *)v4 + v16);
    v21 = (uint64_t *)((char *)a2 + v16);
    v22 = v21[1];
    *v20 = *v21;
    v20[1] = v22;
    swift_retain();
    swift_retain();
    v23 = v14;
  }
  swift_retain();
  return v4;
}

uint64_t sub_20CE3A020(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_20CE66DC8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();

  return swift_release();
}

_QWORD *sub_20CE3A0C0(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  __int128 v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  id v21;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_20CE66DC8();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = a3[9];
  v8 = a3[10];
  v9 = (_QWORD *)((char *)a1 + v7);
  v10 = (_QWORD *)((char *)a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = *(void **)((char *)a2 + v8);
  *(_QWORD *)((char *)a1 + v8) = v12;
  v13 = a3[11];
  v14 = a3[12];
  v15 = (_OWORD *)((char *)a1 + v13);
  v16 = (_OWORD *)((char *)a2 + v13);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  v18 = (_QWORD *)((char *)a1 + v14);
  v19 = (_QWORD *)((char *)a2 + v14);
  v20 = v19[1];
  *v18 = *v19;
  v18[1] = v20;
  swift_retain();
  swift_retain();
  v21 = v12;
  swift_retain();
  return a1;
}

_QWORD *sub_20CE3A1C0(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;

  if (a1 != a2)
  {
    sub_20CE21AE0((uint64_t)a1, (uint64_t *)&unk_2549963F8);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_20CE66DC8();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v7 = a3[9];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  *(_QWORD *)((char *)a1 + v7) = *(_QWORD *)((char *)a2 + v7);
  swift_retain();
  swift_release();
  *((_QWORD *)v8 + 1) = *((_QWORD *)v9 + 1);
  swift_retain();
  swift_release();
  v10 = a3[10];
  v11 = *(void **)((char *)a2 + v10);
  v12 = *(void **)((char *)a1 + v10);
  *(_QWORD *)((char *)a1 + v10) = v11;
  v13 = v11;

  v14 = a3[11];
  v15 = (_QWORD *)((char *)a1 + v14);
  v16 = (_QWORD *)((char *)a2 + v14);
  *v15 = *v16;
  v15[1] = v16[1];
  v15[2] = v16[2];
  v15[3] = v16[3];
  v17 = a3[12];
  v18 = (_QWORD *)((char *)a1 + v17);
  v19 = (_QWORD *)((char *)a2 + v17);
  v20 = v19[1];
  *v18 = *v19;
  v18[1] = v20;
  swift_retain();
  swift_release();
  return a1;
}

char *sub_20CE3A324(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  __int128 v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_20CE66DC8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[10];
  *(_OWORD *)&a1[a3[9]] = *(_OWORD *)&a2[a3[9]];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];
  v9 = a3[11];
  v10 = a3[12];
  v11 = &a1[v9];
  v12 = &a2[v9];
  v13 = *((_OWORD *)v12 + 1);
  *(_OWORD *)v11 = *(_OWORD *)v12;
  *((_OWORD *)v11 + 1) = v13;
  *(_OWORD *)&a1[v10] = *(_OWORD *)&a2[v10];
  return a1;
}

char *sub_20CE3A3F0(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  __int128 v17;

  if (a1 != a2)
  {
    sub_20CE21AE0((uint64_t)a1, (uint64_t *)&unk_2549963F8);
    v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549963F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_20CE66DC8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = a3[9];
  v9 = &a1[v8];
  v10 = &a2[v8];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];
  swift_release();
  *((_QWORD *)v9 + 1) = *((_QWORD *)v10 + 1);
  swift_release();
  v11 = a3[10];
  v12 = *(void **)&a1[v11];
  *(_QWORD *)&a1[v11] = *(_QWORD *)&a2[v11];

  v13 = a3[11];
  v14 = a3[12];
  v15 = &a1[v13];
  v16 = &a2[v13];
  v17 = *((_OWORD *)v16 + 1);
  *(_OWORD *)v15 = *(_OWORD *)v16;
  *((_OWORD *)v15 + 1) = v17;
  *(_OWORD *)&a1[v14] = *(_OWORD *)&a2[v14];
  swift_release();
  return a1;
}

uint64_t sub_20CE3A514()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_20CE3A520(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996448);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    OUTLINED_FUNCTION_14(a1, a2, v6);
  }
  else
  {
    OUTLINED_FUNCTION_67(*(_QWORD *)(a1 + *(int *)(a3 + 36)));
    OUTLINED_FUNCTION_21();
  }
}

uint64_t sub_20CE3A580()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_20CE3A58C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  uint64_t v5;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_22();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254996448);
  OUTLINED_FUNCTION_43();
  if (v7)
  {
    v8 = OUTLINED_FUNCTION_61_1();
    OUTLINED_FUNCTION_26_0(v8, v9, v10, v11);
  }
  else
  {
    *(_QWORD *)(v5 + *(int *)(a4 + 36)) = (v4 - 1);
    OUTLINED_FUNCTION_21();
  }
}

uint64_t type metadata accessor for AppShortcutIndexedSearchView.BadgedIconView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AppShortcutIndexedSearchView.BadgedIconView);
}

uint64_t sub_20CE3A5E8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20CE3A61C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_20CE3A630()
{
  unint64_t result;

  result = qword_254996FD0;
  if (!qword_254996FD0)
  {
    result = MEMORY[0x212B97A80](&unk_20CE6C628, &unk_24C5A9B20);
    atomic_store(result, (unint64_t *)&qword_254996FD0);
  }
  return result;
}

unint64_t sub_20CE3A670()
{
  unint64_t result;

  result = qword_254996FD8;
  if (!qword_254996FD8)
  {
    result = MEMORY[0x212B97A80](&unk_20CE6C560, &unk_24C5A9B20);
    atomic_store(result, (unint64_t *)&qword_254996FD8);
  }
  return result;
}

unint64_t sub_20CE3A6B0()
{
  unint64_t result;

  result = qword_254996FE0;
  if (!qword_254996FE0)
  {
    result = MEMORY[0x212B97A80](&unk_20CE6C588, &unk_24C5A9B20);
    atomic_store(result, (unint64_t *)&qword_254996FE0);
  }
  return result;
}

void sub_20CE3A6EC(uint64_t a1@<X8>)
{
  char v2;

  *(_QWORD *)a1 = sub_20CE67128();
  *(_BYTE *)(a1 + 8) = v2 & 1;
  OUTLINED_FUNCTION_4();
}

void sub_20CE3A718()
{
  sub_20CE67134();
  OUTLINED_FUNCTION_4();
}

uint64_t sub_20CE3A740(void *a1, SEL *a2)
{
  id v3;
  uint64_t v4;

  v3 = objc_msgSend(a1, *a2);

  if (!v3)
    return 0;
  v4 = sub_20CE67638();

  return v4;
}

uint64_t sub_20CE3A7A8(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_20CE21AD0(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_20CE3A7E4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_20CE21A8C(result, a2, a3 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_20CE3A828@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_20CE34EC0(v1[4], v1[2], v1[3], a1);
}

unint64_t sub_20CE3A834()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_254997020;
  if (!qword_254997020)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996FE8);
    v2 = sub_20CE3A8B8();
    sub_20CE1EE3C((uint64_t)&unk_254996770);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_254997020);
  }
  return result;
}

unint64_t sub_20CE3A8B8()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_254997028;
  if (!qword_254997028)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_254997030);
    v2 = sub_20CE3A93C();
    sub_20CE3B618((uint64_t)&unk_254996AA8);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_254997028);
  }
  return result;
}

unint64_t sub_20CE3A93C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_253CFA318;
  if (!qword_253CFA318)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253CFA320);
    sub_20CE3AA6C((uint64_t)&qword_253CFA2E0);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_253CFA318);
  }
  return result;
}

unint64_t sub_20CE3A9C8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_254997048;
  if (!qword_254997048)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_254996FF0);
    sub_20CE3AEDC((uint64_t)&unk_254997050);
    v3 = v2;
    sub_20CE3B618((uint64_t)&unk_253CFA3D0);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_254997048);
  }
  return result;
}

void sub_20CE3AA6C(uint64_t a1)
{
  unint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  if (!OUTLINED_FUNCTION_48(a1))
  {
    v5 = v4;
    v6 = v3;
    v7 = OUTLINED_FUNCTION_36_1(0, v2);
    v8[0] = v6;
    v8[1] = v5;
    atomic_store(MEMORY[0x212B97A80](MEMORY[0x24BDED308], v7, v8), v1);
  }
  OUTLINED_FUNCTION_46();
}

unint64_t sub_20CE3AAB8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254997078;
  if (!qword_254997078)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996788);
    v2[0] = sub_20CE21740();
    v2[1] = sub_20CE3AB24();
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254997078);
  }
  return result;
}

unint64_t sub_20CE3AB24()
{
  unint64_t result;

  result = qword_254997090;
  if (!qword_254997090)
  {
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED5C0], MEMORY[0x24BDED5D0]);
    atomic_store(result, (unint64_t *)&qword_254997090);
  }
  return result;
}

uint64_t sub_20CE3AB70@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_20CE35D28(v1[4], v1[2], v1[3], a1);
}

void sub_20CE3AB7C(void **a1@<X8>)
{
  *a1 = sub_20CE35FA4();
  OUTLINED_FUNCTION_4();
}

uint64_t sub_20CE3ABA4()
{
  return 16;
}

__n128 sub_20CE3ABB0(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_20CE3ABBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_20CE66FC0();
  OUTLINED_FUNCTION_38_1();
  v3 = v0 + *(int *)(v1 + 20) + v2;
  v4 = sub_20CE67194();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocObject();
}

uint64_t sub_20CE3AC24@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  sub_20CE66FC0();
  OUTLINED_FUNCTION_57();
  return sub_20CE1EA90(a1, v2 + v5, a2);
}

uint64_t sub_20CE3AC64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  type metadata accessor for AppShortcutIndexedSearchView.DerivedStyles(0);
  OUTLINED_FUNCTION_38_1();
  v2 = v0 + v1;
  sub_20CE398A4(*(void **)(v0 + v1), *(_BYTE *)(v0 + v1 + 8));

  swift_release();
  OUTLINED_FUNCTION_43_1();
  v3 = sub_20CE675F0();
  OUTLINED_FUNCTION_26(v3);
  return swift_deallocObject();
}

void sub_20CE3ACF0(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  type metadata accessor for AppShortcutIndexedSearchView.DerivedStyles(0);
  OUTLINED_FUNCTION_57();
  sub_20CE32A90(v1 + v3, a1);
}

uint64_t sub_20CE3AD20@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_20CE32D58(*(_QWORD *)(v1 + 16), a1);
}

void sub_20CE3AD28(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_20CE32E78(*(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), a1);
}

void sub_20CE3AD34(uint64_t a1)
{
  unint64_t *v1;
  uint64_t *v2;
  uint64_t (*v3)(void);
  uint64_t (*v4)(void);
  uint64_t v5;
  uint64_t v6;

  if (!OUTLINED_FUNCTION_48(a1))
  {
    v4 = v3;
    v5 = OUTLINED_FUNCTION_36_1(0, v2);
    v6 = v4();
    atomic_store(MEMORY[0x212B97A80](MEMORY[0x24BDF5578], v5, &v6), v1);
  }
  OUTLINED_FUNCTION_46();
}

unint64_t sub_20CE3AD84()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549970F8;
  if (!qword_2549970F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254997100);
    v2[0] = sub_20CE3ADF0();
    v2[1] = sub_20CE21164();
    result = MEMORY[0x212B97A80](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549970F8);
  }
  return result;
}

unint64_t sub_20CE3ADF0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_254997108;
  if (!qword_254997108)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254997110);
    sub_20CE3AEDC((uint64_t)&unk_254997118);
    v3 = v2;
    sub_20CE3B618((uint64_t)&unk_254996620);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_254997108);
  }
  return result;
}

void sub_20CE3AE94()
{
  sub_20CE3AEDC((uint64_t)&unk_254997128);
}

void sub_20CE3AEB8()
{
  sub_20CE3AEDC((uint64_t)&unk_254997138);
}

void sub_20CE3AEDC(uint64_t a1)
{
  unint64_t *v1;
  uint64_t *v2;
  uint64_t (*v3)(void);
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);
  uint64_t v7;
  _QWORD v8[2];

  if (!OUTLINED_FUNCTION_48(a1))
  {
    v5 = v4;
    v6 = v3;
    v7 = OUTLINED_FUNCTION_36_1(0, v2);
    v8[0] = v6();
    v8[1] = v5;
    atomic_store(MEMORY[0x212B97A80](MEMORY[0x24BDED308], v7, v8), v1);
  }
  OUTLINED_FUNCTION_46();
}

unint64_t sub_20CE3AF30()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_254997148;
  if (!qword_254997148)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_254997150);
    sub_20CE3B618((uint64_t)&qword_254996968);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254997148);
  }
  return result;
}

uint64_t sub_20CE3AFB4(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

void sub_20CE3AFF8(uint64_t a1)
{
  OUTLINED_FUNCTION_48(a1);
  swift_retain();
  swift_retain();
  OUTLINED_FUNCTION_52_1();
  OUTLINED_FUNCTION_21();
}

void sub_20CE3B02C()
{
  sub_20CE670F8();
  OUTLINED_FUNCTION_4();
}

uint64_t sub_20CE3B04C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_20CE3B080(uint64_t a1)
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

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v9 = v1[6];
  v8 = v1[7];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_20CE2E4A0;
  return sub_20CE36B70(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_20CE3B10C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20CE3B130(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_20CE3B1A0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2549971F8 + dword_2549971F8))(a1, v4);
}

uint64_t sub_20CE3B1A0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_13_0();
  return OUTLINED_FUNCTION_24_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_20CE3B1C4(uint64_t a1, unint64_t a2)
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

unint64_t sub_20CE3B208()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_254997228;
  if (!qword_254997228)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254997220);
    sub_20CE3AEDC((uint64_t)&unk_254997230);
    v3 = v2;
    sub_20CE3B618((uint64_t)&unk_254997280);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDEF3E0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_254997228);
  }
  return result;
}

unint64_t sub_20CE3B2AC()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_254997240;
  if (!qword_254997240)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549967A8);
    v2 = sub_20CE3B330();
    sub_20CE3B618((uint64_t)&unk_254997270);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_254997240);
  }
  return result;
}

unint64_t sub_20CE3B330()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_254997250;
  if (!qword_254997250)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549967A0);
    sub_20CE3B618((uint64_t)&unk_254997260);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDEDB58];
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254997250);
  }
  return result;
}

void sub_20CE3B3B4()
{
  uint64_t v0;

  sub_20CE3611C(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_20CE3B3CC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;
  char v5;

  result = sub_20CE1EB14(a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  *(_BYTE *)(a2 + 9) = v5 & 1;
  return result;
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

uint64_t sub_20CE3B410(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_20CE3B430(uint64_t result, int a2, int a3)
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

void type metadata accessor for AppShortcutIndexedSearchView.BadgedIconMetrics()
{
  OUTLINED_FUNCTION_49();
}

uint64_t sub_20CE3B468(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_20CE3982C(*(void **)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

void sub_20CE3B4AC(uint64_t a1)
{
  sub_20CE398A4(*(void **)a1, *(_BYTE *)(a1 + 8));
}

uint64_t sub_20CE3B4BC(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_20CE3982C(*(void **)a2, v4);
  v5 = *(void **)a1;
  v6 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  sub_20CE398A4(v5, v6);
  return a1;
}

uint64_t sub_20CE3B50C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  char v4;
  void *v5;
  char v6;

  v3 = *a2;
  v4 = *((_BYTE *)a2 + 8);
  v5 = *(void **)a1;
  v6 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  sub_20CE398A4(v5, v6);
  return a1;
}

uint64_t sub_20CE3B548(uint64_t a1, unsigned int a2)
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

uint64_t sub_20CE3B588(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_20CE3B5CC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_20CE3B5D4(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

void type metadata accessor for AppShortcutIndexedSearchView.DerivedStyles.SymbolBackgroundStyle()
{
  OUTLINED_FUNCTION_49();
}

void sub_20CE3B5EC()
{
  sub_20CE3B618((uint64_t)&unk_2549972A8);
}

void sub_20CE3B618(uint64_t a1)
{
  uint64_t *v1;

  if (!OUTLINED_FUNCTION_48(a1))
  {
    OUTLINED_FUNCTION_36_1(0, v1);
    OUTLINED_FUNCTION_66();
  }
  OUTLINED_FUNCTION_4();
}

uint64_t sub_20CE3B644(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];
  _QWORD v10[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254996FE8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_254996FF0);
  type metadata accessor for SpotlightUiShadow(255);
  v2 = OUTLINED_FUNCTION_67_1();
  sub_20CE1EE3C((uint64_t)&unk_254996770);
  v10[0] = v1;
  v10[1] = v3;
  v4 = MEMORY[0x24BDED308];
  MEMORY[0x212B97A80](MEMORY[0x24BDED308], v2, v10);
  sub_20CE671E8();
  sub_20CE66F90();
  OUTLINED_FUNCTION_39_0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254997000);
  OUTLINED_FUNCTION_39_0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254997008);
  OUTLINED_FUNCTION_62_1();
  v5 = OUTLINED_FUNCTION_58_1();
  MEMORY[0x212B97A80](MEMORY[0x24BDF5428], v5);
  v6 = sub_20CE67590();
  v7 = sub_20CE66F90();
  v9[0] = MEMORY[0x212B97A80](MEMORY[0x24BDF4750], v6);
  v9[1] = MEMORY[0x24BDEDB80];
  return MEMORY[0x212B97A80](v4, v7, v9);
}

void sub_20CE3B7B4()
{
  sub_20CE3B3B4();
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 168) + 8))(v0, *(_QWORD *)(v1 - 160));
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return 0x6953657361726870;
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  return sub_20CE67854();
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return sub_20CE6786C();
}

void OUTLINED_FUNCTION_21_0()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_24_1(uint64_t (*a1)(void))
{
  return a1();
}

void OUTLINED_FUNCTION_25_1()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_26_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;

  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 32);
  v6 = *(_QWORD *)(v4 - 152);
  *(_QWORD *)(v4 - 232) = v5;
  return v5(v6, a2, v3);
}

uint64_t OUTLINED_FUNCTION_30_1()
{
  return type metadata accessor for SpotlightUiShadow(0);
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return 0;
}

id OUTLINED_FUNCTION_32_1()
{
  uint64_t v0;
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 - 288), (SEL)(v0 + 50));
}

uint64_t OUTLINED_FUNCTION_36_1(uint64_t a1, uint64_t *a2)
{
  return __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
}

uint64_t OUTLINED_FUNCTION_39_0()
{
  return sub_20CE6720C();
}

uint64_t OUTLINED_FUNCTION_40_0()
{
  return sub_20CE6720C();
}

uint64_t OUTLINED_FUNCTION_41_0(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_42_1()
{
  return sub_20CE66DC8();
}

uint64_t OUTLINED_FUNCTION_43_1()
{
  return type metadata accessor for TopHitViewTextStyle.Resolved(0);
}

uint64_t OUTLINED_FUNCTION_44_1()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 184) + 8))(v0, *(_QWORD *)(v1 - 176));
}

uint64_t OUTLINED_FUNCTION_48_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_50_1()
{
  uint64_t v0;
  unint64_t v1;

  return sub_20CE3B1C4(v0, v1);
}

uint64_t OUTLINED_FUNCTION_51_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_52_1()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_54()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_56_1@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_58_1()
{
  return sub_20CE675FC();
}

uint64_t OUTLINED_FUNCTION_60_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_61_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_62_1()
{
  return swift_getTupleTypeMetadata2();
}

uint64_t OUTLINED_FUNCTION_64_1@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_66_1(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_67_1()
{
  return sub_20CE66F90();
}

uint64_t OUTLINED_FUNCTION_68()
{
  uint64_t v0;

  return v0;
}

unint64_t StaticString._asString.getter(unint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
  {
    if (result)
      return sub_20CE67650();
    __break(1u);
  }
  if (HIDWORD(result))
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return sub_20CE67650();
  }
  if (result >> 11 == 27)
    goto LABEL_14;
  if (WORD1(result) > 0x10u)
    goto LABEL_11;
  if ((result & 0xFFFFFF80) != 0 || result <= 0xFF)
    return sub_20CE67650();
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

id static NSBundle._current.getter()
{
  if (qword_2549963B8 != -1)
    swift_once();
  return (id)qword_2549972C0;
}

id sub_20CE3BB10()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  _s2__CMa();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_2549972C0 = (uint64_t)result;
  return result;
}

uint64_t sub_20CE3BB64()
{
  return swift_deallocClassInstance();
}

uint64_t _s2__CMa()
{
  return objc_opt_self();
}

id Color.wfColor(with:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  uint64_t v13;

  v2 = sub_20CE66E4C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_20CE6714C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CE67140();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  sub_20CE67068();
  sub_20CE6741C();
  v10 = (void *)sub_20CE67428();
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEC1398]), sel_initWithCGColor_, v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v11;
}

uint64_t sub_20CE3BCB4()
{
  return 256;
}

void Shape.fill(_:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  _QWORD v12[62];

  v12[14] = a3;
  v12[5] = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_47_0();
  v12[4] = v3 - v4;
  MEMORY[0x24BDAC7A8](v5);
  v12[3] = (char *)v12 - v6;
  v12[57] = v7;
  v12[58] = MEMORY[0x24BDF3E48];
  v12[59] = v8;
  v12[60] = MEMORY[0x24BDF3E18];
  v9 = sub_20CE66E34();
  v12[2] = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_47_0();
  MEMORY[0x24BDAC7A8](v10);
  v12[6] = (char *)v12 - v11;
  OUTLINED_FUNCTION_15_1();
}

void sub_20CE3BDBC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = OUTLINED_FUNCTION_86();
  v0[13] = v4;
  v6 = type metadata accessor for GradientColorResolverView(v3, v1, v4, v5);
  sub_20CE66FCC();
  OUTLINED_FUNCTION_86();
  v0[16] = v6;
  sub_20CE66F90();
  v0[15] = v2;
  sub_20CE66E70();
  sub_20CE66F90();
  sub_20CE14D80();
  OUTLINED_FUNCTION_10();
}

void sub_20CE3BE30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
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
  char *v26;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;

  *(_QWORD *)(v17 - 136) = v15;
  *(_QWORD *)(v17 - 128) = a1;
  MEMORY[0x212B97A80](MEMORY[0x24BDED308], v14, v17 - 136);
  OUTLINED_FUNCTION_86();
  sub_20CE66FE4();
  OUTLINED_FUNCTION_86();
  v9[20] = v16;
  v9[18] = v18;
  v9[19] = sub_20CE66F90();
  sub_20CE66F90();
  v19 = OUTLINED_FUNCTION_10_1();
  v9[8] = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v9[7] = (char *)&a9 - v20;
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_47_0();
  MEMORY[0x24BDAC7A8](v22);
  v9[10] = v23;
  v24 = sub_20CE6720C();
  v9[11] = *(_QWORD *)(v24 - 8);
  v9[12] = v24;
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&a9 - v25;
  v27 = *(void **)v10;
  v28 = *(unsigned __int8 *)(v10 + 8);
  v29 = MEMORY[0x24BDEDB58];
  v9[17] = v26;
  if (v28)
  {
    if (v28 == 1)
    {
      *(_QWORD *)(v17 - 120) = v27;
      v9[1] = v27;
      swift_retain();
      sub_20CE16D6C(v17 - 120, 256, v12, MEMORY[0x24BDF3E48], v9[15], MEMORY[0x24BDF3E18]);
      v30 = v9[6];
      sub_20CE16994(v13, v11, v9[13]);
      OUTLINED_FUNCTION_12_3();
      sub_20CE16998(v30, v11, v13);
      v9[35] = MEMORY[0x212B97A80](&protocol conformance descriptor for GradientColorResolverView<A>, v9[16]);
      v9[36] = v29;
      OUTLINED_FUNCTION_1_2();
    }
    v32 = v9[3];
    sub_20CE16994(v9[9], v12, *(_QWORD *)(v9[15] + 16));
    sub_20CE16998(v32, v12, v9[4]);
    OUTLINED_FUNCTION_10();
  }
  v9[1] = v27;
  v31 = v27;
  Shape.fill(_:)();
}

void sub_20CE3C224(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 152) = a1;
  *(_QWORD *)(v2 - 144) = v1;
  OUTLINED_FUNCTION_1_2();
}

void sub_20CE3C238()
{
  OUTLINED_FUNCTION_8_3();
}

void sub_20CE3C248(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 168) = v1;
  *(_QWORD *)(v2 - 160) = a1;
  OUTLINED_FUNCTION_0_3();
}

void sub_20CE3C254(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 184) = a1;
  *(_QWORD *)(v1 - 176) = MEMORY[0x24BDF0390];
  OUTLINED_FUNCTION_2_2();
}

void sub_20CE3C26C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 104);
  *(_QWORD *)(v2 - 200) = a1;
  *(_QWORD *)(v2 - 192) = v3;
  OUTLINED_FUNCTION_15_1();
}

void sub_20CE3C288()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);

  sub_20CE18ADC();
  v4 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 40) + 8);
  v4(v3, v1);
  v4(v2, v1);
  JUMPOUT(0x20CE3C2D0);
}

void sub_20CE3C2DC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 216) = a1;
  *(_QWORD *)(v1 - 208) = MEMORY[0x24BDEDB58];
  OUTLINED_FUNCTION_1_2();
}

void sub_20CE3C2FC()
{
  OUTLINED_FUNCTION_8_3();
}

void sub_20CE3C30C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 232) = v1;
  *(_QWORD *)(v2 - 224) = a1;
  OUTLINED_FUNCTION_0_3();
}

void sub_20CE3C318(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 248) = a1;
  *(_QWORD *)(v2 - 240) = v1;
  OUTLINED_FUNCTION_2_2();
}

void sub_20CE3C324(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1[39] = a1;
  v1[40] = v4;
  v5 = MEMORY[0x24BDEF3E0];
  v1[37] = MEMORY[0x212B97A80](MEMORY[0x24BDEF3E0], v2, v1 + 39);
  v1[38] = v3;
  v6 = v5;
  v7 = v1[12];
  MEMORY[0x212B97A80](v6, v7, v1 + 37);
  v8 = v1[17];
  sub_20CE16998(v8, v7, v1[14]);
  OUTLINED_FUNCTION_14_1(v8, *(uint64_t (**)(uint64_t, uint64_t))(v1[11] + 8));
  OUTLINED_FUNCTION_15();
}

void sub_20CE3C38C(id a1, char a2)
{
  if (a2 == 1)
  {
    swift_release();
  }
  else if (!a2)
  {

  }
}

uint64_t initializeBufferWithCopyOfBuffer for SStackFill(uint64_t a1, uint64_t a2)
{
  id v3;
  char v4;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_20CE3C3EC(*(id *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

id sub_20CE3C3EC(id result, char a2)
{
  if (a2 == 1)
    return (id)swift_retain();
  if (!a2)
    return result;
  return result;
}

void destroy for SStackFill(uint64_t a1)
{
  sub_20CE3C38C(*(id *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t assignWithCopy for SStackFill(uint64_t a1, uint64_t a2)
{
  id v3;
  char v4;
  void *v5;
  char v6;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_20CE3C3EC(*(id *)a2, v4);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = v3;
  v6 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v4;
  sub_20CE3C38C(v5, v6);
  return a1;
}

uint64_t assignWithTake for SStackFill(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  char v5;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v3;
  sub_20CE3C38C(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for SStackFill(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 9))
    {
      v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for SStackFill(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_20CE3C528(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u)
    return *(unsigned __int8 *)(a1 + 8);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_20CE3C540(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SStackFill()
{
  return &type metadata for SStackFill;
}

void sub_20CE3C568()
{
  sub_20CE66E34();
  OUTLINED_FUNCTION_10();
}

void sub_20CE3C5C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v21 = type metadata accessor for GradientColorResolverView(255, v20, a1, a4);
  sub_20CE66FCC();
  OUTLINED_FUNCTION_86();
  v22 = sub_20CE66F90();
  v23 = sub_20CE66E70();
  v24 = sub_20CE66F90();
  v25 = sub_20CE14D80();
  v26 = MEMORY[0x212B97A80](MEMORY[0x24BDEB950], v23);
  a19 = v25;
  a20 = v26;
  v27 = MEMORY[0x24BDED308];
  MEMORY[0x212B97A80](MEMORY[0x24BDED308], v24, &a19);
  OUTLINED_FUNCTION_86();
  v28 = sub_20CE66FE4();
  v29 = sub_20CE66F90();
  v30 = sub_20CE66F90();
  sub_20CE6720C();
  OUTLINED_FUNCTION_10_1();
  a17 = MEMORY[0x212B97A80](&protocol conformance descriptor for GradientColorResolverView<A>, v21);
  a18 = MEMORY[0x24BDEDB58];
  v31 = MEMORY[0x212B97A80](v27, v22, &a17);
  v32 = MEMORY[0x212B97A80](MEMORY[0x24BDEDC10], v28);
  a15 = v31;
  a16 = v32;
  a13 = MEMORY[0x212B97A80](v27, v29, &a15);
  a14 = MEMORY[0x24BDF0390];
  MEMORY[0x212B97A80](v27, v30, &a13);
  OUTLINED_FUNCTION_10();
}

void sub_20CE3C734()
{
  OUTLINED_FUNCTION_15_1();
}

void OUTLINED_FUNCTION_0_3()
{
  JUMPOUT(0x212B97A80);
}

void OUTLINED_FUNCTION_1_2()
{
  JUMPOUT(0x212B97A80);
}

void OUTLINED_FUNCTION_2_2()
{
  JUMPOUT(0x212B97A80);
}

void OUTLINED_FUNCTION_5_2()
{
  sub_20CE17C8C();
}

void OUTLINED_FUNCTION_8_3()
{
  JUMPOUT(0x212B97A80);
}

uint64_t OUTLINED_FUNCTION_9_1(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return sub_20CE6720C();
}

uint64_t OUTLINED_FUNCTION_12_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

void OUTLINED_FUNCTION_13_2()
{
  JUMPOUT(0x212B97A80);
}

uint64_t OUTLINED_FUNCTION_14_1@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

void OUTLINED_FUNCTION_15_1()
{
  JUMPOUT(0x212B97A80);
}

uint64_t BlendMode.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int *v3;
  uint64_t v4;
  uint64_t v5;

  if (a1)
  {
    if (a1 == 1)
      v3 = (unsigned int *)MEMORY[0x24BDF5110];
    else
      v3 = (unsigned int *)MEMORY[0x24BDF50D0];
    v4 = *v3;
  }
  else
  {
    v4 = *MEMORY[0x24BDF50D0];
  }
  v5 = sub_20CE675F0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(a2, v4, v5);
}

uint64_t SStackView.top.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t SStackView.bottom.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t SStackView.init(top:bottom:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t SStackView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 *v2;
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
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v20 = a2;
  v4 = *(_QWORD *)(a1 + 24);
  sub_20CE66F90();
  OUTLINED_FUNCTION_3_2();
  v5 = *(_QWORD *)(a1 + 16);
  sub_20CE66F90();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_62_1();
  v6 = OUTLINED_FUNCTION_58_1();
  MEMORY[0x212B97A80](MEMORY[0x24BDF5428], v6);
  v7 = sub_20CE67590();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v19 - v12;
  v21 = v5;
  v22 = v4;
  v14 = *v2;
  v15 = v2[1];
  v23 = *(_OWORD *)(a1 + 32);
  v24 = v14;
  v25 = v15;
  sub_20CE675CC();
  sub_20CE67584();
  v16 = MEMORY[0x212B97A80](MEMORY[0x24BDF4750], v7);
  sub_20CE16994(v10, v7, v16);
  v17 = *(void (**)(char *, uint64_t))(v8 + 8);
  v17(v10, v7);
  sub_20CE16998((uint64_t)v13, v7, v20);
  return ((uint64_t (*)(char *, uint64_t))v17)(v13, v7);
}

uint64_t sub_20CE3CA74@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X1>, void (*a3)(__n128)@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  __n128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t);
  char *v47;
  void (*v48)(__n128);
  __int128 v50;
  char *v51;
  uint64_t v52;
  void (*v53)(__n128);
  uint64_t v54;
  char *v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  void (*v62)(uint64_t);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  char *v76;
  __int128 v77;

  v64 = a6;
  v53 = a3;
  v61 = a2;
  v62 = a1;
  v67 = a8;
  v63 = *(_QWORD *)(a4 - 8);
  v58 = a4;
  MEMORY[0x24BDAC7A8](a1);
  v57 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_20CE66F90();
  v12 = *(_QWORD *)(v11 - 8);
  v59 = v11;
  v65 = v12;
  MEMORY[0x24BDAC7A8](v11);
  v56 = (char *)&v50 - v13;
  v54 = sub_20CE66F90();
  v66 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v55 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v60 = (char *)&v50 - v16;
  v17 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v50 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_20CE66F90();
  v52 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v50 - v22;
  v24 = sub_20CE66F90();
  v68 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v50 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BDAC7A8](v27);
  v51 = (char *)&v50 - v29;
  v53(v28);
  sub_20CE672FC();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v20, a5);
  LOBYTE(v76) = 0;
  v50 = xmmword_20CE6C860;
  v77 = xmmword_20CE6C860;
  v75[0] = a7;
  v75[1] = MEMORY[0x24BDEEC40];
  v30 = MEMORY[0x24BDED308];
  v31 = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v21, v75);
  MEMORY[0x212B96BC8](&v76, v21, &type metadata for SStackEffect, v31);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v23, v21);
  v32 = sub_20CE3D740();
  v74[0] = v31;
  v74[1] = v32;
  v52 = MEMORY[0x212B97A80](v30, v24, v74);
  sub_20CE16994(v26, v24, v52);
  v53 = *(void (**)(__n128))(v68 + 8);
  v33 = ((uint64_t (*)(char *, uint64_t))v53)(v26, v24);
  v34 = v57;
  v62(v33);
  v35 = v56;
  v36 = v58;
  v37 = v64;
  sub_20CE672FC();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v34, v36);
  LOBYTE(v76) = 1;
  v77 = v50;
  v73[0] = v37;
  v73[1] = MEMORY[0x24BDEEC40];
  v38 = v59;
  v39 = MEMORY[0x212B97A80](v30, v59, v73);
  v40 = v55;
  MEMORY[0x212B96BC8](&v76, v38, &type metadata for SStackEffect, v39);
  (*(void (**)(char *, uint64_t))(v65 + 8))(v35, v38);
  v72[0] = v39;
  v72[1] = v32;
  v41 = v30;
  v42 = v54;
  v43 = MEMORY[0x212B97A80](v41, v54, v72);
  v44 = v60;
  sub_20CE16994(v40, v42, v43);
  v45 = v66;
  v46 = *(void (**)(char *, uint64_t))(v66 + 8);
  v46(v40, v42);
  v47 = v51;
  (*(void (**)(char *, char *, uint64_t))(v68 + 16))(v26, v51, v24);
  v76 = v26;
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v40, v44, v42);
  *(_QWORD *)&v77 = v40;
  v71[0] = v24;
  v71[1] = v42;
  v69 = v52;
  v70 = v43;
  sub_20CE30BDC((uint64_t *)&v76, 2, (uint64_t)v71);
  v46(v44, v42);
  v48 = v53;
  ((void (*)(char *, uint64_t))v53)(v47, v24);
  v46(v40, v42);
  return ((uint64_t (*)(char *, uint64_t))v48)(v26, v24);
}

uint64_t sub_20CE3CFA4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_20CE3CA74(*(void (**)(uint64_t))(v1 + 48), *(_QWORD *)(v1 + 56), *(void (**)(__n128))(v1 + 64), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), a1);
}

uint64_t sub_20CE3CFB8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20CE3CFF0()
{
  swift_release();
  return swift_release();
}

uint64_t sub_20CE3D018(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_20CE3D060(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_20CE3D0BC(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TopHitViewIconBackgroundStyle(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 32))
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

uint64_t storeEnumTagSinglePayload for TopHitViewIconBackgroundStyle(uint64_t result, int a2, int a3)
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

void type metadata accessor for SStackView()
{
  JUMPOUT(0x212B979FCLL);
}

void sub_20CE3D18C()
{
  uint64_t v0;

  sub_20CE66F90();
  OUTLINED_FUNCTION_2_3();
  sub_20CE66F90();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_62_1();
  v0 = OUTLINED_FUNCTION_58_1();
  MEMORY[0x212B97A80](MEMORY[0x24BDF5428], v0);
  sub_20CE67590();
  JUMPOUT(0x212B97A80);
}

uint64_t getEnumTagSinglePayload for SStackEffect(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  unsigned int v3;
  BOOL v4;

  if (a2)
  {
    if (a2 >= 0xFF && a1[24])
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *a1;
      v4 = v3 >= 2;
      v2 = (v3 + 2147483646) & 0x7FFFFFFF;
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

uint64_t storeEnumTagSinglePayload for SStackEffect(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for SStackEffect()
{
  return &type metadata for SStackEffect;
}

uint64_t sub_20CE3D2D4()
{
  return MEMORY[0x24BDF5560];
}

CGFloat sub_20CE3D2E0@<D0>(char a1@<W0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  double v11;
  CGFloat result;
  __int128 v13;
  __int128 v14;
  CGAffineTransform v15;
  CGAffineTransform v16;

  v11 = -a4;
  if ((a1 & 1) == 0)
    v11 = a4;
  v16.a = 1.0;
  v16.b = 0.0;
  v16.c = 0.0;
  v16.d = 1.0;
  v16.tx = 0.0;
  v16.ty = 0.0;
  CGAffineTransformTranslate(&v15, &v16, 0.0, v11 * (a6 * 0.229));
  v16 = v15;
  CGAffineTransformTranslate(&v15, &v16, (1.0 - a6) * 0.5 * a3, (1.0 - a6) * 0.5 * a4);
  v16 = v15;
  CGAffineTransformScale(&v15, &v16, a6, a6);
  v16 = v15;
  CGAffineTransformTranslate(&v15, &v16, 0.0, (1.0 - a5) * 0.5 * a4);
  v16 = v15;
  CGAffineTransformScale(&v15, &v16, 1.0, a5);
  v16 = v15;
  CGAffineTransformTranslate(&v15, &v16, a3 * 0.5, a4 * 0.5);
  v16 = v15;
  CGAffineTransformRotate(&v15, &v16, -0.785398163);
  v16 = v15;
  CGAffineTransformTranslate(&v15, &v16, a3 * -0.5, a4 * -0.5);
  result = v15.a;
  v13 = *(_OWORD *)&v15.c;
  v14 = *(_OWORD *)&v15.tx;
  *(_OWORD *)a2 = *(_OWORD *)&v15.a;
  *(_QWORD *)(a2 + 16) = 0;
  *(_OWORD *)(a2 + 24) = v13;
  *(_QWORD *)(a2 + 40) = 0;
  *(_OWORD *)(a2 + 48) = v14;
  *(_QWORD *)(a2 + 64) = 0x3FF0000000000000;
  return result;
}

void *sub_20CE3D4A0@<X0>(void *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  uint64_t v3;
  _BYTE __src[72];

  sub_20CE3D2E0(*(_BYTE *)v3, (uint64_t)__src, a2, a3, *(CGFloat *)(v3 + 8), *(CGFloat *)(v3 + 16));
  return memcpy(a1, __src, 0x48uLL);
}

uint64_t sub_20CE3D4E8()
{
  double *v0;

  return nullsub_1(*(unsigned __int8 *)v0, v0[1], v0[2]);
}

void (*sub_20CE3D4F8(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_20CE66DF8();
  return sub_20CE3D554;
}

void sub_20CE3D554(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_20CE3D584()
{
  sub_20CE3D77C();
  return sub_20CE66F48();
}

uint64_t sub_20CE3D5EC()
{
  sub_20CE3D77C();
  return sub_20CE66F24();
}

uint64_t sub_20CE3D654()
{
  sub_20CE3D77C();
  return sub_20CE66F3C();
}

void sub_20CE3D6AC()
{
  sub_20CE66EA0();
  __break(1u);
}

unint64_t sub_20CE3D6C0()
{
  unint64_t result;

  result = qword_254997348;
  if (!qword_254997348)
  {
    result = MEMORY[0x212B97A80](MEMORY[0x24BDEEF18], MEMORY[0x24BDEEF38]);
    atomic_store(result, (unint64_t *)&qword_254997348);
  }
  return result;
}

unint64_t sub_20CE3D700()
{
  unint64_t result;

  result = qword_254997350;
  if (!qword_254997350)
  {
    result = MEMORY[0x212B97A80](&unk_20CE6C978, &type metadata for SStackEffect);
    atomic_store(result, (unint64_t *)&qword_254997350);
  }
  return result;
}

unint64_t sub_20CE3D740()
{
  unint64_t result;

  result = qword_254997358;
  if (!qword_254997358)
  {
    result = MEMORY[0x212B97A80](&unk_20CE6C928, &type metadata for SStackEffect);
    atomic_store(result, (unint64_t *)&qword_254997358);
  }
  return result;
}

unint64_t sub_20CE3D77C()
{
  unint64_t result;

  result = qword_254997360;
  if (!qword_254997360)
  {
    result = MEMORY[0x212B97A80](&unk_20CE6C9C8, &type metadata for SStackEffect);
    atomic_store(result, (unint64_t *)&qword_254997360);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return sub_20CE66F90();
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return sub_20CE66F90();
}

double sub_20CE3D7D0()
{
  double result;

  qword_254997388 = 0;
  result = 0.0;
  xmmword_254997368 = 0u;
  unk_254997378 = 0u;
  return result;
}

__int128 *sub_20CE3D7E8()
{
  if (qword_2549963C0 != -1)
    swift_once();
  return &xmmword_254997368;
}

uint64_t sub_20CE3D828@<X0>(uint64_t a1@<X8>)
{
  __int128 *v2;

  v2 = sub_20CE3D7E8();
  return sub_20CE3D90C((uint64_t)v2, a1);
}

uint64_t EnvironmentValues.asyncViewWaiter.getter()
{
  sub_20CE3D880();
  return sub_20CE67158();
}

unint64_t sub_20CE3D880()
{
  unint64_t result;

  result = qword_254997390[0];
  if (!qword_254997390[0])
  {
    result = MEMORY[0x212B97A80](&unk_20CE6CA44, &_s18AsyncViewWaiterKeyVN);
    atomic_store(result, qword_254997390);
  }
  return result;
}

uint64_t EnvironmentValues.asyncViewWaiter.setter(uint64_t a1)
{
  _BYTE v3[40];

  sub_20CE3D90C(a1, (uint64_t)v3);
  sub_20CE3D880();
  sub_20CE67164();
  return sub_20CE3D954(a1);
}

uint64_t sub_20CE3D90C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996C40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20CE3D954(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996C40);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void (*EnvironmentValues.asyncViewWaiter.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[15] = v1;
  v3[16] = sub_20CE3D880();
  sub_20CE67158();
  return sub_20CE3D9F8;
}

void sub_20CE3D9F8(void **a1, char a2)
{
  void *v2;
  uint64_t v3;

  v2 = *a1;
  v3 = (uint64_t)*a1 + 40;
  if ((a2 & 1) != 0)
  {
    OUTLINED_FUNCTION_0_4();
    sub_20CE3D90C(v3, (uint64_t)v2 + 80);
    OUTLINED_FUNCTION_1_3();
    sub_20CE3D954(v3);
  }
  else
  {
    OUTLINED_FUNCTION_0_4();
    OUTLINED_FUNCTION_1_3();
  }
  sub_20CE3D954((uint64_t)v2);
  free(v2);
}

uint64_t dispatch thunk of AsyncViewWaiter.registerExpectation(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of AsyncViewWaiter.fulfillExpectation(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

ValueMetadata *_s18AsyncViewWaiterKeyVMa()
{
  return &_s18AsyncViewWaiterKeyVN;
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  uint64_t v0;
  uint64_t v1;

  return sub_20CE3D90C(v0, v1);
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return sub_20CE67164();
}

uint64_t Gradient.init(_:)(void *a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(qword_253CFA490);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_20CE6CA80;
  v3 = objc_msgSend(a1, sel_startColor);
  v4 = MEMORY[0x212B96C94](objc_msgSend(v3, sel_platformColor));

  *(_QWORD *)(v2 + 32) = v4;
  v5 = objc_msgSend(a1, sel_endColor);
  v6 = MEMORY[0x212B96C94](objc_msgSend(v5, sel_platformColor));

  *(_QWORD *)(v2 + 40) = v6;
  sub_20CE676C8();
  v7 = MEMORY[0x212B96E08](v2);

  return v7;
}

id GradientColorResolverView.gradient.getter()
{
  id *v0;

  return *v0;
}

uint64_t sub_20CE3DBC0()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20CE3DBEC(uint64_t a1, __int128 *a2)
{
  uint64_t v3;
  __int128 v4;
  id v5;

  v3 = *((_QWORD *)a2 + 2);
  v4 = *a2;
  *(_OWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 16) = v3;
  v5 = (id)v4;
  swift_retain();
  return a1;
}

uint64_t sub_20CE3DC2C(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v7;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_20CE3DC84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v4;
  swift_release();
  return a1;
}

uint64_t sub_20CE3DCC8(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 24))
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

uint64_t sub_20CE3DD08(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void sub_20CE3DD48(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for ColorReadingView(255, *a1, a1[1], a4);
  JUMPOUT(0x212B97A80);
}

uint64_t *sub_20CE3DD70(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_20CE66E4C();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = *(int *)(a3 + 36);
    v10 = (uint64_t *)((char *)a1 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA250);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_20CE671A0();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v13 = *(int *)(a3 + 40);
    v14 = (uint64_t *)((char *)a1 + v13);
    v15 = (uint64_t *)((char *)a2 + v13);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
  }
  swift_retain();
  return a1;
}

_QWORD *sub_20CE3DED4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  if (a1 != a2)
  {
    sub_20CE3E454((uint64_t)a1, &qword_253CFA240);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_20CE66E4C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v7 = *(int *)(a3 + 36);
    v8 = (_QWORD *)((char *)a1 + v7);
    v9 = (_QWORD *)((char *)a2 + v7);
    sub_20CE3E454((uint64_t)a1 + v7, &qword_253CFA250);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA250);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_20CE671A0();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v11 = *(int *)(a3 + 40);
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  swift_retain();
  swift_release();
  return a1;
}

char *sub_20CE3E044(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_20CE66E4C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = *(int *)(a3 + 36);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA250);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v12 = sub_20CE671A0();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  *(_OWORD *)&a1[*(int *)(a3 + 40)] = *(_OWORD *)&a2[*(int *)(a3 + 40)];
  return a1;
}

char *sub_20CE3E16C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  if (a1 != a2)
  {
    sub_20CE3E454((uint64_t)a1, &qword_253CFA240);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA240);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_20CE66E4C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    v8 = *(int *)(a3 + 36);
    v9 = &a1[v8];
    v10 = &a2[v8];
    sub_20CE3E454((uint64_t)&a1[v8], &qword_253CFA250);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA250);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_20CE671A0();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  *(_OWORD *)&a1[*(int *)(a3 + 40)] = *(_OWORD *)&a2[*(int *)(a3 + 40)];
  swift_release();
  return a1;
}

uint64_t sub_20CE3E2C8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20CE3E2D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996450);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  v9 = __swift_instantiateConcreteTypeFromMangledName(qword_254997418);
  if (*(_DWORD *)(*(_QWORD *)(v9 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v9;
    v8 = a1 + *(int *)(a3 + 36);
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 40));
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_20CE3E37C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20CE3E388(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254996450);
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
    return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
  }
  result = __swift_instantiateConcreteTypeFromMangledName(qword_254997418);
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
  {
    v9 = result;
    v10 = a1 + *(int *)(a4 + 36);
    return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 40)) = (a2 - 1);
  return result;
}

uint64_t sub_20CE3E434()
{
  return sub_20CE670BC();
}

uint64_t sub_20CE3E454(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_20CE3E490(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t static SymbolAlignment.customSymbolAlignments.getter()
{
  if (qword_253CFA148 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

uint64_t sub_20CE3E4D8(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t *v13;
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
  char v38;
  _QWORD *v40;
  char *v41;
  int64_t v42;
  uint64_t v43;

  if (qword_253CFA148 != -1)
LABEL_41:
    swift_once();
  v4 = off_253CFA138;
  v41 = (char *)off_253CFA138 + 64;
  v5 = 1 << *((_BYTE *)off_253CFA138 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *((_QWORD *)off_253CFA138 + 8);
  v42 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  v8 = 0;
  v40 = v4;
  while (1)
  {
    if (v7)
    {
      v43 = (v7 - 1) & v7;
      v9 = __clz(__rbit64(v7)) | (v8 << 6);
    }
    else
    {
      v10 = v8 + 1;
      if (__OFADD__(v8, 1))
        goto LABEL_39;
      if (v10 >= v42)
        return OUTLINED_FUNCTION_6_2();
      v11 = *(_QWORD *)&v41[8 * v10];
      ++v8;
      if (!v11)
      {
        v8 = v10 + 1;
        if (v10 + 1 >= v42)
          return OUTLINED_FUNCTION_6_2();
        v11 = *(_QWORD *)&v41[8 * v8];
        if (!v11)
        {
          v8 = v10 + 2;
          if (v10 + 2 >= v42)
            return OUTLINED_FUNCTION_6_2();
          v11 = *(_QWORD *)&v41[8 * v8];
          if (!v11)
          {
            v12 = v10 + 3;
            if (v12 >= v42)
              return OUTLINED_FUNCTION_6_2();
            v11 = *(_QWORD *)&v41[8 * v12];
            if (!v11)
            {
              while (1)
              {
                v8 = v12 + 1;
                if (__OFADD__(v12, 1))
                  goto LABEL_40;
                if (v8 >= v42)
                  return OUTLINED_FUNCTION_6_2();
                v11 = *(_QWORD *)&v41[8 * v8];
                ++v12;
                if (v11)
                  goto LABEL_20;
              }
            }
            v8 = v12;
          }
        }
      }
LABEL_20:
      v43 = (v11 - 1) & v11;
      v9 = __clz(__rbit64(v11)) + (v8 << 6);
    }
    v13 = (uint64_t *)(v4[6] + 16 * v9);
    v15 = *v13;
    v14 = v13[1];
    OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_2_4();
    if ((sub_20CE67698() & 1) != 0)
    {
      if (!__OFSUB__(0, OUTLINED_FUNCTION_0_5()))
      {
        sub_20CE67674();
        OUTLINED_FUNCTION_1_4();
        v16 = sub_20CE676A4();
        v18 = v17;
        v20 = v19;
        v22 = v21;
        OUTLINED_FUNCTION_4_3();
        v15 = MEMORY[0x212B96E98](v16, v18, v20, v22);
        v24 = v23;
        swift_bridgeObjectRelease();
        goto LABEL_25;
      }
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    OUTLINED_FUNCTION_1_4();
    v24 = v14;
LABEL_25:
    OUTLINED_FUNCTION_2_4();
    if ((sub_20CE67698() & 1) != 0)
    {
      if (__OFSUB__(0, OUTLINED_FUNCTION_0_5()))
        goto LABEL_38;
      sub_20CE67674();
      swift_bridgeObjectRetain();
      v25 = sub_20CE676A4();
      v27 = v26;
      v28 = a1;
      v30 = v29;
      v32 = v31;
      swift_bridgeObjectRelease();
      v33 = v30;
      a1 = v28;
      v4 = v40;
      v34 = MEMORY[0x212B96E98](v25, v27, v33, v32);
      v36 = v35;
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
      v34 = a1;
      v36 = a2;
    }
    if (v15 == v34 && v24 == v36)
      break;
    v38 = sub_20CE67890();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_4_3();
    v7 = v43;
    if ((v38 & 1) != 0)
      return OUTLINED_FUNCTION_6_2();
  }
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_6_2();
  return swift_bridgeObjectRelease_n();
}

id SymbolAlignment.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SymbolAlignment.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SymbolAlignment();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SymbolAlignment()
{
  return objc_opt_self();
}

id SymbolAlignment.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SymbolAlignment();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t ProbablyAlignedSymbol.body.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t KeyPath;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253CFA3E8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v1;
  v7 = v1[1];
  OUTLINED_FUNCTION_1_4();
  v8 = sub_20CE674B8();
  v9 = sub_20CE67248();
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v9);
  v10 = sub_20CE6726C();
  sub_20CE13E80((uint64_t)v5);
  KeyPath = swift_getKeyPath();
  type metadata accessor for SymbolAlignment();
  result = sub_20CE3E4D8(v6, v7);
  *a1 = v8;
  a1[1] = KeyPath;
  a1[2] = v10;
  a1[3] = v13;
  a1[4] = v14;
  return result;
}

void sub_20CE3EACC()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4();
}

void sub_20CE3EAE8()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4();
}

void sub_20CE3EB04()
{
  swift_retain();
  sub_20CE670EC();
  OUTLINED_FUNCTION_4();
}

_QWORD *assignWithCopy for ProbablyAlignedSymbol(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

uint64_t assignWithTake for ProbablyAlignedSymbol(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for ProbablyAlignedSymbol(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ProbablyAlignedSymbol(uint64_t result, int a2, int a3)
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

uint64_t OUTLINED_FUNCTION_0_5()
{
  return sub_20CE67668();
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return 0x6C6C69662ELL;
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return sub_20CE670E0();
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return swift_release();
}

id static IconViewImageGenerator.loadIcon(_:size:style:)(uint64_t a1, uint64_t a2, double a3, double a4)
{
  return objc_msgSend((id)objc_opt_self(), sel_loadIcon_size_style_, a1, a2, a3, a4);
}

uint64_t IconViewImageGenerator.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t IconViewImageGenerator.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

id sub_20CE3ED08()
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCE40]), sel_init);
  qword_2549974A0 = (uint64_t)result;
  return result;
}

id sub_20CE3ED38(void *a1, uint64_t a2, double a3, double a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double *v13;
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
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  _BOOL4 v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  double v41;
  double v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  void *v55;
  uint64_t v56;
  uint64_t *v57;
  char **v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  uint64_t v63;
  id v64;
  id v66;
  _BOOL4 v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  char v77;
  uint64_t v78;
  uint64_t v79;

  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549974B8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_2();
  v72 = v9;
  v70 = sub_20CE66FC0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_38();
  v13 = (double *)(v12 - v11);
  v14 = sub_20CE67488();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_38();
  v18 = v17 - v16;
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549974C0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_38();
  v22 = v21 - v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549974C8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_2();
  v73 = v24;
  if (qword_2549963D0 != -1)
    swift_once();
  v25 = (void *)qword_2549974A0;
  _s8CacheKeyCMa();
  v26 = OUTLINED_FUNCTION_3_4();
  *(_QWORD *)(v26 + 16) = a1;
  *(double *)(v26 + 24) = a3;
  *(double *)(v26 + 32) = a4;
  *(_QWORD *)(v26 + 40) = a2;
  v27 = a1;
  v28 = objc_msgSend(v25, sel_objectForKey_, v26);
  swift_release();
  if (!v28)
  {
    v30 = a2 == 3 || a2 == 5;
    objc_opt_self();
    v31 = swift_dynamicCastObjCClass();
    v32 = v27;
    v33 = a2;
    v68 = v27;
    if (v31)
    {
      v34 = (void *)v31;
      v67 = v30;
      v35 = v32;
      v36 = objc_msgSend(v34, sel_bundleIdentifier);
      if (!v36)
      {
        sub_20CE67638();
        v36 = (id)sub_20CE6762C();
        v33 = a2;
        swift_bridgeObjectRelease();
      }
      v37 = objc_msgSend((id)objc_opt_self(), sel_applicationIconImageForBundleIdentifier_format_, v36, 0);

      if (v37
        && (v38 = objc_msgSend(v37, sel_imageWithRenderingMode_, 1),
            v37,
            v38))
      {
        v39 = v38;
        WFImage.image.getter();
        v66 = v39;

        (*(void (**)(uint64_t, _QWORD, uint64_t))(v15 + 104))(v18, *MEMORY[0x24BDF3FD0], v14);
        v40 = sub_20CE674DC();
        swift_release();
        (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v18, v14);
        sub_20CE675CC();
        sub_20CE66EAC();
        v41 = 0.225;
        if (v67)
          v41 = 0.0;
        v42 = a4 * 0.95 * v41;
        v43 = (char *)v13 + *(int *)(v70 + 20);
        v44 = *MEMORY[0x24BDEEB68];
        v45 = sub_20CE67194();
        (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 104))(v43, v44, v45);
        *v13 = v42;
        v13[1] = v42;
        sub_20CE3FCF8((uint64_t)v13, v72);
        *(_BYTE *)(v72 + *(int *)(v71 + 36)) = 0;
        sub_20CE22D4C(v72, v22 + *(int *)(v69 + 36), &qword_2549974B8);
        *(_QWORD *)v22 = v40;
        *(_QWORD *)(v22 + 8) = v74;
        *(_BYTE *)(v22 + 16) = v75;
        *(_QWORD *)(v22 + 24) = v76;
        *(_BYTE *)(v22 + 32) = v77;
        *(_QWORD *)(v22 + 40) = v78;
        *(_QWORD *)(v22 + 48) = v79;
        swift_retain();
        sub_20CE22D8C(v72, &qword_2549974B8);
        sub_20CE3FD3C((uint64_t)v13);
        swift_release();
        v46 = 0;
        if (v33 == 5)
        {
          v47 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
          v48 = sub_20CE3F904((uint64_t)sub_20CE3F558, 0);
          v49 = objc_msgSend(v48, sel_CGColor);

          v46 = MEMORY[0x212B96C10](v49);
        }
        v50 = sub_20CE675CC();
        v52 = v51;
        sub_20CE22D4C(v22, v73, &qword_2549974C0);
        v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_254997530);
        v54 = (uint64_t *)(v73 + *(int *)(v53 + 36));
        *v54 = v46;
        v54[1] = v50;
        v54[2] = v52;
        sub_20CE22D8C(v22, &qword_2549974C0);
        __swift_storeEnumTagSinglePayload(v73, 0, 1, v53);
        v55 = v66;
      }
      else
      {
        v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_254997530);
        __swift_storeEnumTagSinglePayload(v73, 1, 1, v56);
        v55 = 0;
      }
      sub_20CE3FB8C();
      sub_20CE6759C();

      v57 = &qword_254997000;
      goto LABEL_34;
    }
    if (a2)
      sub_20CE67260();
    else
      sub_20CE67254();
    v57 = &qword_254997000;
    if ((objc_msgSend(v27, sel_hasClearBackground) & 1) != 0
      || objc_msgSend(v27, sel_hasTransparentBackground))
    {
      if (a2 == 2)
      {
        v58 = &selRef_whiteColor;
      }
      else
      {
        if (a2 != 1)
          goto LABEL_33;
        v58 = &selRef_tintColor;
      }
      v59 = objc_msgSend((id)objc_opt_self(), *v58);
      objc_msgSend(objc_allocWithZone(MEMORY[0x24BEC1398]), sel_initWithPlatformColor_, v59);

    }
LABEL_33:
    swift_getKeyPath();
    v60 = v68;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549974D0);
    sub_20CE3F9E4();
    sub_20CE6759C();
LABEL_34:
    swift_getKeyPath();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549974F8);
    sub_20CE3FAAC();
    sub_20CE6759C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254997528);
    swift_allocObject();
    swift_retain();
    sub_20CE66EE8();
    v61 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
    objc_msgSend(v61, sel_screenScale);

    sub_20CE66EDC();
    v28 = (id)sub_20CE66ED0();
    if (v28 && v33 != 5)
    {
      v62 = (void *)v57[148];
      v63 = OUTLINED_FUNCTION_3_4();
      *(_QWORD *)(v63 + 16) = v68;
      *(double *)(v63 + 24) = a3;
      *(double *)(v63 + 32) = a4;
      *(_QWORD *)(v63 + 40) = v33;
      v64 = v68;
      objc_msgSend(v62, sel_setObject_forKey_, v28, v63);
      swift_release();
    }
    swift_release();
    swift_release();
    swift_release();
  }
  return v28;
}

id sub_20CE3F558(void *a1)
{
  id v1;
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v1 = objc_msgSend(a1, sel_userInterfaceStyle);
  v2 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
  if (v1 == (id)1)
  {
    v3 = 0.929;
    v4 = 0.933;
    v5 = 0.937;
    v6 = 1.0;
  }
  else
  {
    v3 = 0.157;
    v5 = 0.165;
    v6 = 1.0;
    v4 = 0.157;
  }
  return objc_msgSend(v2, sel_initWithRed_green_blue_alpha_, v3, v4, v5, v6);
}

uint64_t sub_20CE3F624()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 16);
  sub_20CE67758();

  sub_20CE2A6FC();
  return sub_20CE678C0();
}

BOOL sub_20CE3F67C(uint64_t a1, uint64_t a2)
{
  BOOL v4;

  sub_20CE15F68(0, (unint64_t *)&qword_253CFA468);
  if ((sub_20CE6774C() & 1) != 0
    && (*(double *)(a1 + 24) == *(double *)(a2 + 24) ? (v4 = *(double *)(a1 + 32) == *(double *)(a2 + 32)) : (v4 = 0), v4))
  {
    return *(_QWORD *)(a1 + 40) == *(_QWORD *)(a2 + 40);
  }
  else
  {
    return 0;
  }
}

uint64_t sub_20CE3F6FC()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t sub_20CE3F720()
{
  sub_20CE678B4();
  sub_20CE3F624();
  return sub_20CE678E4();
}

BOOL sub_20CE3F75C(uint64_t *a1, uint64_t *a2)
{
  return sub_20CE3F67C(*a1, *a2);
}

uint64_t sub_20CE3F768()
{
  return sub_20CE3F720();
}

uint64_t sub_20CE3F788()
{
  return sub_20CE3F624();
}

uint64_t sub_20CE3F7A8()
{
  sub_20CE678B4();
  sub_20CE3F624();
  return sub_20CE678E4();
}

WFIconViewImageGenerator __swiftcall WFIconViewImageGenerator.init()()
{
  return (WFIconViewImageGenerator)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id WFIconViewImageGenerator.init()()
{
  objc_super v1;

  v1.super_class = (Class)WFIconViewImageGenerator;
  return objc_msgSendSuper2(&v1, sel_init);
}

uint64_t type metadata accessor for IconViewImageGenerator()
{
  return objc_opt_self();
}

uint64_t method lookup function for IconViewImageGenerator()
{
  return swift_lookUpClassMethod();
}

uint64_t _s8CacheKeyCMa()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for WFIconViewImageGenerator(uint64_t a1)
{
  return sub_20CE15F68(a1, &qword_2549974A8);
}

unint64_t sub_20CE3F8C4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2549974B0;
  if (!qword_2549974B0)
  {
    v1 = _s8CacheKeyCMa();
    result = MEMORY[0x212B97A80](&unk_20CE6CDAC, v1);
    atomic_store(result, (unint64_t *)&qword_2549974B0);
  }
  return result;
}

id sub_20CE3F904(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[6];

  v6[4] = a1;
  v6[5] = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 1107296256;
  v6[2] = sub_20CE3F98C;
  v6[3] = &block_descriptor_1;
  v3 = _Block_copy(v6);
  v4 = objc_msgSend(v2, sel_initWithDynamicProvider_, v3);
  _Block_release(v3);
  swift_release();
  return v4;
}

id sub_20CE3F98C(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);
  id v4;
  void *v5;

  v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v5 = (void *)v3();
  swift_release();

  return v5;
}

unint64_t sub_20CE3F9E4()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2549974D8;
  if (!qword_2549974D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549974D0);
    v2 = sub_20CE3FA68();
    sub_20CE22F34(&qword_2549974E8, &qword_2549974F0, MEMORY[0x24BDF1028]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2549974D8);
  }
  return result;
}

unint64_t sub_20CE3FA68()
{
  unint64_t result;

  result = qword_2549974E0;
  if (!qword_2549974E0)
  {
    result = MEMORY[0x212B97A80](&protocol conformance descriptor for IconView, &type metadata for IconView);
    atomic_store(result, (unint64_t *)&qword_2549974E0);
  }
  return result;
}

unint64_t sub_20CE3FAAC()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_254997500;
  if (!qword_254997500)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549974F8);
    v2 = sub_20CE3FB30();
    sub_20CE22F34(&qword_254997518, &qword_254997520, MEMORY[0x24BDF1028]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_254997500);
  }
  return result;
}

unint64_t sub_20CE3FB30()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_254997508;
  if (!qword_254997508)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254997510);
    v2 = MEMORY[0x24BDF4760];
    result = MEMORY[0x212B97A80](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_254997508);
  }
  return result;
}

unint64_t sub_20CE3FB8C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_254997538;
  if (!qword_254997538)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549974C8);
    v2 = sub_20CE3FBF0();
    result = MEMORY[0x212B97A80](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_254997538);
  }
  return result;
}

unint64_t sub_20CE3FBF0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_254997540;
  if (!qword_254997540)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254997530);
    v2 = sub_20CE3FC74();
    sub_20CE22F34(&qword_254997558, &qword_254997560, MEMORY[0x24BDEF370]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_254997540);
  }
  return result;
}

unint64_t sub_20CE3FC74()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_254997548;
  if (!qword_254997548)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549974C0);
    v2 = sub_20CE22ED0();
    sub_20CE22F34(&qword_254997550, &qword_2549974B8, MEMORY[0x24BDEFAD8]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B97A80](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_254997548);
  }
  return result;
}

uint64_t sub_20CE3FCF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_20CE66FC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20CE3FD3C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_20CE66FC0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return swift_allocObject();
}

uint64_t TopHitViewTextStyle.Resolved.init(color:blendMode:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;

  *a3 = a1;
  type metadata accessor for TopHitViewTextStyle.Resolved(0);
  v5 = OUTLINED_FUNCTION_6_3();
  return OUTLINED_FUNCTION_3_5((uint64_t)a3, a2, v5, *(uint64_t (**)(void))(*(_QWORD *)(v5 - 8) + 32));
}

uint64_t TopHitViewIconBackgroundStyle.Resolved.blendMode.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t TopHitViewIconBackgroundStyle.Resolved.init(color:blendMode:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

void TopHitViewIconBackgroundStyle.Resolved.init(color:blendMode:)(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;

  v6 = MEMORY[0x212B96C94](objc_msgSend(a1, sel_platformColor));

  *a3 = v6;
  a3[1] = a2;
  OUTLINED_FUNCTION_21();
}

uint64_t TopHitViewIconBackgroundStyle.init(common:)@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = a1[1];
  *a2 = *a1;
  a2[1] = v3;
  a2[2] = v2;
  a2[3] = v3;
  return swift_retain();
}

_QWORD *TopHitViewIconBackgroundStyle.init(lightMode:darkMode:)@<X0>(_QWORD *result@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = result[1];
  v4 = *a2;
  v5 = a2[1];
  *a3 = *result;
  a3[1] = v3;
  a3[2] = v4;
  a3[3] = v5;
  return result;
}

uint64_t TopHitViewTextStyle.init(common:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  sub_20CE16154(a1, a2);
  v4 = type metadata accessor for TopHitViewTextStyle(0);
  return OUTLINED_FUNCTION_4_4(a1, a2 + *(int *)(v4 + 20));
}

uint64_t TopHitViewTextStyle.init(lightMode:darkMode:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;

  sub_20CE3FED0(a1, a3);
  v5 = type metadata accessor for TopHitViewTextStyle(0);
  return OUTLINED_FUNCTION_4_4(a2, a3 + *(int *)(v5 + 20));
}

uint64_t sub_20CE3FED0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TopHitViewTextStyle.Resolved(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_QWORD *initializeWithCopy for TopHitViewIconBackgroundStyle(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for TopHitViewIconBackgroundStyle(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  return a1;
}

_QWORD *assignWithTake for TopHitViewIconBackgroundStyle(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  swift_release();
  v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_release();
  a1[3] = a2[3];
  return a1;
}

_QWORD *initializeBufferWithCopyOfBuffer for TopHitViewIconBackgroundStyle.Resolved(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for TopHitViewIconBackgroundStyle.Resolved()
{
  return swift_release();
}

_QWORD *assignWithCopy for TopHitViewIconBackgroundStyle.Resolved(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  return a1;
}

_QWORD *assignWithTake for TopHitViewIconBackgroundStyle.Resolved(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for TopHitViewIconBackgroundStyle.Resolved(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TopHitViewIconBackgroundStyle.Resolved(uint64_t result, int a2, int a3)
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

uint64_t *initializeBufferWithCopyOfBuffer for TopHitViewTextStyle(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v7;
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
  char *v18;
  char *v19;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = type metadata accessor for TopHitViewTextStyle.Resolved(0);
    v9 = *(int *)(v8 + 20);
    v10 = (char *)v7 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_20CE675F0();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_retain();
    v13(v10, v11, v12);
    v14 = *(int *)(a3 + 20);
    v15 = (uint64_t *)((char *)v7 + v14);
    v16 = (uint64_t *)((char *)a2 + v14);
    *v15 = *v16;
    v17 = *(int *)(v8 + 20);
    v18 = (char *)v15 + v17;
    v19 = (char *)v16 + v17;
    swift_retain();
    v13(v18, v19, v12);
  }
  return v7;
}

_QWORD *assignWithCopy for TopHitViewTextStyle(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  char *v14;

  *a1 = *a2;
  swift_retain();
  swift_release();
  v6 = type metadata accessor for TopHitViewTextStyle.Resolved(0);
  v7 = *(int *)(v6 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_20CE675F0();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 24);
  v11(v8, v9, v10);
  v12 = *(int *)(a3 + 20);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  *(_QWORD *)((char *)a1 + v12) = *(_QWORD *)v14;
  swift_retain();
  swift_release();
  v11(&v13[*(int *)(v6 + 20)], &v14[*(int *)(v6 + 20)], v10);
  return a1;
}

_QWORD *initializeWithTake for TopHitViewTextStyle(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  char *v14;

  *a1 = *a2;
  v6 = type metadata accessor for TopHitViewTextStyle.Resolved(0);
  v7 = *(int *)(v6 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_20CE675F0();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v12 = *(int *)(a3 + 20);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  *(_QWORD *)v13 = *(_QWORD *)v14;
  v11(&v13[*(int *)(v6 + 20)], &v14[*(int *)(v6 + 20)], v10);
  return a1;
}

_QWORD *assignWithTake for TopHitViewTextStyle(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  char *v14;

  *a1 = *a2;
  swift_release();
  v6 = type metadata accessor for TopHitViewTextStyle.Resolved(0);
  v7 = *(int *)(v6 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_20CE675F0();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v12 = *(int *)(a3 + 20);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  *(_QWORD *)((char *)a1 + v12) = *(_QWORD *)v14;
  swift_release();
  v11(&v13[*(int *)(v6 + 20)], &v14[*(int *)(v6 + 20)], v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for TopHitViewTextStyle()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20CE40470()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_7_3();
  return __swift_getEnumTagSinglePayload(v1, v0, v2);
}

uint64_t storeEnumTagSinglePayload for TopHitViewTextStyle()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20CE404A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_7_3();
  return __swift_storeEnumTagSinglePayload(v1, v0, v0, v2);
}

uint64_t *initializeBufferWithCopyOfBuffer for TopHitViewTextStyle.Resolved(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    v9 = sub_20CE675F0();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_retain();
    v10(v7, v8, v9);
  }
  return v5;
}

_QWORD *assignWithCopy for TopHitViewTextStyle.Resolved(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_retain();
  swift_release();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_20CE675F0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_QWORD *initializeWithTake for TopHitViewTextStyle.Resolved(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_20CE675F0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *assignWithTake for TopHitViewTextStyle.Resolved(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_release();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_20CE675F0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for TopHitViewTextStyle.Resolved()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20CE406B0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = sub_20CE675F0();
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + *(int *)(a3 + 20), a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for TopHitViewTextStyle.Resolved()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_20CE4073C(_QWORD *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 2147483646)
  {
    *a1 = a2;
    OUTLINED_FUNCTION_21();
  }
  else
  {
    v7 = sub_20CE675F0();
    __swift_storeEnumTagSinglePayload((uint64_t)a1 + *(int *)(a4 + 20), a2, a2, v7);
  }
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_2_5@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 104))(v2, a1, v1);
}

uint64_t OUTLINED_FUNCTION_3_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_4_4(uint64_t a1, uint64_t a2)
{
  return sub_20CE3FED0(a1, a2);
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return sub_20CE675F0();
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return type metadata accessor for TopHitViewTextStyle.Resolved(0);
}

void OUTLINED_FUNCTION_10_2()
{
  uint64_t v0;

  sub_20CE14298(v0);
}

void IconShape.init(insetFraction:)(double *a1@<X8>, double a2@<D0>)
{
  *a1 = a2;
}

double IconShape.path(in:)@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  __int128 v4;
  char v5;

  sub_20CE672B4();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_20CE40860(double a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD v14[6];
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  v9 = sub_20CE67194();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15.origin.x = a2;
  v15.origin.y = a3;
  v15.size.width = a4;
  v15.size.height = a5;
  CGRectGetHeight(v15);
  v16.origin.x = a2;
  v16.origin.y = a3;
  v16.size.width = a4;
  v16.size.height = a5;
  CGRectGetWidth(v16);
  v17.origin.x = a2;
  v17.origin.y = a3;
  v17.size.width = a4;
  v17.size.height = a5;
  CGRectGetHeight(v17);
  v18.origin.x = a2;
  v18.origin.y = a3;
  v18.size.width = a4;
  v18.size.height = a5;
  CGRectGetWidth(v18);
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x24BDEEB68], v9);
  v14[0] = 0x3FF0000000000000;
  v14[1] = 0;
  v14[2] = 0;
  v14[3] = 0x3FF0000000000000;
  v14[4] = 0;
  v14[5] = 0;
  sub_20CE672A8();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_20CE40A0C()
{
  double *v0;

  return sub_20CE40860(v0[2], v0[3], v0[4], v0[5], v0[6]);
}

unint64_t sub_20CE40A20()
{
  unint64_t result;

  result = qword_254997588;
  if (!qword_254997588)
  {
    result = MEMORY[0x212B97A80](&protocol conformance descriptor for IconShape, &type metadata for IconShape);
    atomic_store(result, (unint64_t *)&qword_254997588);
  }
  return result;
}

unint64_t sub_20CE40A60()
{
  unint64_t result;

  result = qword_254997590;
  if (!qword_254997590)
  {
    result = MEMORY[0x212B97A80](&protocol conformance descriptor for IconShape, &type metadata for IconShape);
    atomic_store(result, (unint64_t *)&qword_254997590);
  }
  return result;
}

double sub_20CE40A9C@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  _OWORD v4[2];
  char v5;

  IconShape.path(in:)((uint64_t)v4);
  result = *(double *)v4;
  v3 = v4[1];
  *(_OWORD *)a1 = v4[0];
  *(_OWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_20CE40AE4()
{
  return sub_20CE67500();
}

uint64_t sub_20CE40AFC(uint64_t a1, double a2, double a3)
{
  double *v3;

  return nullsub_1(a1, *v3, a3);
}

unint64_t sub_20CE40B08()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254997598;
  if (!qword_254997598)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549975A0);
    result = MEMORY[0x212B97A80](MEMORY[0x24BDEB358], v1);
    atomic_store(result, (unint64_t *)&qword_254997598);
  }
  return result;
}

uint64_t sub_20CE40B4C()
{
  sub_20CE40C34();
  return sub_20CE6753C();
}

uint64_t sub_20CE40B9C()
{
  sub_20CE40C34();
  return sub_20CE6750C();
}

uint64_t sub_20CE40BEC()
{
  sub_20CE40C34();
  return sub_20CE67524();
}

ValueMetadata *type metadata accessor for IconShape()
{
  return &type metadata for IconShape;
}

unint64_t sub_20CE40C34()
{
  unint64_t result;

  result = qword_2549975A8;
  if (!qword_2549975A8)
  {
    result = MEMORY[0x212B97A80](&protocol conformance descriptor for IconShape, &type metadata for IconShape);
    atomic_store(result, (unint64_t *)&qword_2549975A8);
  }
  return result;
}

uint64_t AppShortcutAdditionMenuItem.name.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppShortcutAdditionMenuItem.symbolName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

void sub_20CE40CC8()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  id v4;

  v0 = (void *)sub_20CE67650();
  if (qword_2549963B8 != -1)
    swift_once();
  v1 = (id)qword_2549972C0;
  v2 = (void *)OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_0_6();
  v3 = OUTLINED_FUNCTION_5_3();
  v4 = OUTLINED_FUNCTION_2_6(v3, sel_localizedStringForKey_value_table_);

  sub_20CE67638();
  OUTLINED_FUNCTION_6_4();
  qword_2549975B0 = (uint64_t)v0;
  *(_QWORD *)algn_2549975B8 = v1;
  qword_2549975C0 = 0x7070612E73756C70;
  unk_2549975C8 = 0xE800000000000000;
  OUTLINED_FUNCTION_21();
}

uint64_t static AppShortcutAdditionMenuItem.addToHomeScreen.getter()
{
  if (qword_2549963D8 != -1)
    swift_once();
  OUTLINED_FUNCTION_3_6(&qword_2549975B0);
  return OUTLINED_FUNCTION_1_6();
}

void sub_20CE40DE4()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  id v4;

  v0 = (void *)sub_20CE67650();
  if (qword_2549963B8 != -1)
    swift_once();
  v1 = (id)qword_2549972C0;
  v2 = (void *)OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_0_6();
  v3 = OUTLINED_FUNCTION_5_3();
  v4 = OUTLINED_FUNCTION_2_6(v3, sel_localizedStringForKey_value_table_);

  sub_20CE67638();
  OUTLINED_FUNCTION_6_4();
  qword_2549975D0 = (uint64_t)v0;
  *(_QWORD *)algn_2549975D8 = v1;
  strcpy((char *)&qword_2549975E0, "app.2.stack.3d");
  unk_2549975EF = -18;
  OUTLINED_FUNCTION_21();
}

uint64_t static AppShortcutAdditionMenuItem.addToShortcut.getter()
{
  if (qword_2549963E0 != -1)
    swift_once();
  OUTLINED_FUNCTION_3_6(&qword_2549975D0);
  return OUTLINED_FUNCTION_1_6();
}

uint64_t destroy for AppShortcutAdditionMenuItem()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for AppShortcutAdditionMenuItem(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for AppShortcutAdditionMenuItem(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for AppShortcutAdditionMenuItem(_QWORD *a1, _QWORD *a2)
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

ValueMetadata *type metadata accessor for AppShortcutAdditionMenuItem()
{
  return &type metadata for AppShortcutAdditionMenuItem;
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  return sub_20CE6762C();
}

uint64_t OUTLINED_FUNCTION_1_6()
{
  return swift_bridgeObjectRetain();
}

id OUTLINED_FUNCTION_2_6(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  return objc_msgSend(v3, a2, v4, v2, 0);
}

uint64_t OUTLINED_FUNCTION_3_6@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1[1];
  v3 = a1[2];
  v4 = a1[3];
  *v1 = *a1;
  v1[1] = v2;
  v1[2] = v3;
  v1[3] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_6_4()
{
  void *v0;

}

uint64_t sub_20CE41084()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(v0 + 16);
  v2 = (void *)sub_20CE6762C();
  v3 = objc_msgSend(v1, sel_objectForKey_, v2);

  if (v3)
  {
    sub_20CE66D68();

  }
  return 0;
}

uint64_t sub_20CE41104(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  void *v6;
  void *v7;
  void *v8;

  if (a2 >> 60 == 15)
    return swift_bridgeObjectRelease();
  v6 = *(void **)(v2 + 16);
  sub_20CE3B1C4(a1, a2);
  v7 = (void *)sub_20CE66D5C();
  v8 = (void *)sub_20CE6762C();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_setObject_forKey_, v7, v8);
  sub_20CE2D414(a1, a2);

  return sub_20CE2D414(a1, a2);
}

id sub_20CE411C4()
{
  uint64_t v0;
  id result;

  type metadata accessor for SpotlightImageCache();
  v0 = swift_allocObject();
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCE40]), sel_init);
  *(_QWORD *)(v0 + 16) = result;
  qword_25499A190 = v0;
  return result;
}

uint64_t sub_20CE41214()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SpotlightImageCache()
{
  return objc_opt_self();
}

uint64_t TopHitViewColorScheme.noEntitiesLabelTextStyle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_0_7();
  return sub_20CE15BB0(v1 + *(int *)(v3 + 32), a1, type metadata accessor for TopHitViewTextStyle);
}

uint64_t TopHitViewColorScheme.noEntitiesButtonBackground.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (uint64_t *)(v1 + *(int *)(OUTLINED_FUNCTION_0_7() + 36));
  v4 = *v3;
  v5 = v3[1];
  v7 = v3[2];
  v6 = v3[3];
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v7;
  a1[3] = v6;
  swift_retain();
  return OUTLINED_FUNCTION_8_4();
}

id TopHitViewColorScheme.sectionIconForegroundColor.getter()
{
  uint64_t v0;

  return *(id *)(v0 + *(int *)(OUTLINED_FUNCTION_0_7() + 40));
}

uint64_t TopHitViewColorScheme.shouldAlwaysTintIcon.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(OUTLINED_FUNCTION_0_7() + 44));
}

uint64_t static TopHitViewColorScheme.entityIconBackground(for:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  unsigned int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;

  v3 = objc_msgSend(a1, sel_isDark);
  v4 = (void *)objc_opt_self();
  if (v3)
    v5 = 3924420890;
  else
    v5 = 32;
  if (v3)
    v6 = 1;
  else
    v6 = 2;
  v7 = objc_msgSend(v4, sel_colorWithRGBAValue_, v5);
  v8 = MEMORY[0x212B96C94](objc_msgSend(v7, sel_platformColor));

  *a2 = v8;
  a2[1] = v6;
  a2[2] = v8;
  a2[3] = v6;
  return OUTLINED_FUNCTION_3_7();
}

uint64_t static TopHitViewColorScheme.noEntitiesButtonBackground(for:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  unsigned int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;

  v3 = objc_msgSend(a1, sel_isDark);
  v4 = (void *)objc_opt_self();
  if (v3)
    v5 = 3924420900;
  else
    v5 = 64;
  if (v3)
    v6 = 1;
  else
    v6 = 2;
  v7 = objc_msgSend(v4, sel_colorWithRGBAValue_, v5);
  v8 = MEMORY[0x212B96C94](objc_msgSend(v7, sel_platformColor));

  *a2 = v8;
  a2[1] = v6;
  a2[2] = v8;
  a2[3] = v6;
  return OUTLINED_FUNCTION_3_7();
}

unint64_t sub_20CE41434()
{
  unint64_t result;

  result = qword_253CFA468;
  if (!qword_253CFA468)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253CFA468);
  }
  return result;
}

uint64_t sub_20CE41470(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TopHitViewTextStyle(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *initializeBufferWithCopyOfBuffer for TopHitViewColorScheme(char *a1, char **a2, int *a3)
{
  int v3;
  char *v4;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  _QWORD *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  _QWORD *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  void (*v46)(char *, uint64_t, uint64_t);
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v7 = a1;
    v9 = a2[1];
    v8 = a2[2];
    *((_QWORD *)a1 + 1) = v9;
    *((_QWORD *)a1 + 2) = v8;
    v10 = a2[4];
    *((_QWORD *)a1 + 3) = a2[3];
    *((_QWORD *)a1 + 4) = v10;
    *((_QWORD *)a1 + 5) = a2[5];
    v11 = a3[7];
    v12 = &a1[v11];
    v13 = (uint64_t)a2 + v11;
    *(_QWORD *)&a1[v11] = *(char **)((char *)a2 + v11);
    v50 = type metadata accessor for TopHitViewTextStyle.Resolved(0);
    v14 = *(int *)(v50 + 20);
    v47 = v13 + v14;
    v48 = &v12[v14];
    v15 = sub_20CE675F0();
    v46 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
    v16 = v4;
    v17 = v9;
    swift_retain();
    swift_retain();
    swift_retain();
    v46(v48, v47, v15);
    v49 = type metadata accessor for TopHitViewTextStyle(0);
    v18 = *(int *)(v49 + 20);
    v19 = &v12[v18];
    v20 = (_QWORD *)(v13 + v18);
    *(_QWORD *)v19 = *v20;
    v21 = *(int *)(v50 + 20);
    v22 = &v19[v21];
    v23 = (char *)v20 + v21;
    swift_retain();
    v46(v22, (uint64_t)v23, v15);
    v24 = a3[8];
    v25 = &v7[v24];
    v26 = (uint64_t)a2 + v24;
    *(_QWORD *)v25 = *(char **)((char *)a2 + v24);
    v27 = *(int *)(v50 + 20);
    v28 = &v25[v27];
    v29 = v26 + v27;
    swift_retain();
    v46(v28, v29, v15);
    v30 = *(int *)(v49 + 20);
    v31 = &v25[v30];
    v32 = (_QWORD *)(v26 + v30);
    *(_QWORD *)v31 = *v32;
    v33 = *(int *)(v50 + 20);
    v34 = &v31[v33];
    v35 = (char *)v32 + v33;
    swift_retain();
    v46(v34, (uint64_t)v35, v15);
    v36 = a3[9];
    v37 = a3[10];
    v38 = &v7[v36];
    v39 = (char **)((char *)a2 + v36);
    v40 = v39[1];
    *(_QWORD *)v38 = *v39;
    *((_QWORD *)v38 + 1) = v40;
    v42 = v39[2];
    v41 = v39[3];
    *((_QWORD *)v38 + 2) = v42;
    *((_QWORD *)v38 + 3) = v41;
    v43 = *(char **)((char *)a2 + v37);
    *(_QWORD *)&v7[v37] = v43;
    v7[a3[11]] = *((_BYTE *)a2 + a3[11]);
    swift_retain();
    swift_retain();
    v44 = v43;
  }
  return v7;
}

char *initializeWithTake for TopHitViewColorScheme(char *a1, char *a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  __int128 v30;

  v6 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v6;
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  v7 = a3[7];
  v8 = &a1[v7];
  v9 = &a2[v7];
  *(_QWORD *)&a1[v7] = *(_QWORD *)&a2[v7];
  v10 = type metadata accessor for TopHitViewTextStyle.Resolved(0);
  v11 = *(int *)(v10 + 20);
  v12 = &v8[v11];
  v13 = &v9[v11];
  v14 = sub_20CE675F0();
  v15 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32);
  v15(v12, v13, v14);
  v16 = type metadata accessor for TopHitViewTextStyle(0);
  v17 = *(int *)(v16 + 20);
  v18 = &v8[v17];
  v19 = &v9[v17];
  *(_QWORD *)v18 = *(_QWORD *)v19;
  v15(&v18[*(int *)(v10 + 20)], &v19[*(int *)(v10 + 20)], v14);
  v20 = a3[8];
  v21 = &a1[v20];
  v22 = &a2[v20];
  *(_QWORD *)&a1[v20] = *(_QWORD *)&a2[v20];
  v15(&a1[v20 + *(int *)(v10 + 20)], &a2[v20 + *(int *)(v10 + 20)], v14);
  v23 = *(int *)(v16 + 20);
  v24 = &v21[v23];
  v25 = &v22[v23];
  *(_QWORD *)v24 = *(_QWORD *)v25;
  v15(&v24[*(int *)(v10 + 20)], &v25[*(int *)(v10 + 20)], v14);
  v26 = a3[9];
  v27 = a3[10];
  v28 = &a1[v26];
  v29 = &a2[v26];
  v30 = *((_OWORD *)v29 + 1);
  *(_OWORD *)v28 = *(_OWORD *)v29;
  *((_OWORD *)v28 + 1) = v30;
  *(_QWORD *)&a1[v27] = *(_QWORD *)&a2[v27];
  a1[a3[11]] = a2[a3[11]];
  return a1;
}

uint64_t assignWithTake for TopHitViewColorScheme(uint64_t a1, _QWORD *a2, int *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(uint64_t, char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  _QWORD *v26;
  char *v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v7 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = a2[1];

  *(_QWORD *)(a1 + 16) = a2[2];
  swift_release();
  v8 = a2[4];
  *(_QWORD *)(a1 + 24) = a2[3];
  *(_QWORD *)(a1 + 32) = v8;
  swift_release();
  *(_QWORD *)(a1 + 40) = a2[5];
  v9 = a3[7];
  v10 = a1 + v9;
  v11 = (char *)a2 + v9;
  *(_QWORD *)(a1 + v9) = *(_QWORD *)((char *)a2 + v9);
  swift_release();
  v12 = type metadata accessor for TopHitViewTextStyle.Resolved(0);
  v13 = *(int *)(v12 + 20);
  v14 = v10 + v13;
  v15 = &v11[v13];
  v16 = sub_20CE675F0();
  v17 = *(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 40);
  v17(v14, v15, v16);
  v18 = type metadata accessor for TopHitViewTextStyle(0);
  v19 = *(int *)(v18 + 20);
  v20 = (_QWORD *)(v10 + v19);
  v21 = &v11[v19];
  *v20 = *(_QWORD *)&v11[v19];
  swift_release();
  v17((uint64_t)v20 + *(int *)(v12 + 20), &v21[*(int *)(v12 + 20)], v16);
  v22 = a3[8];
  v23 = a1 + v22;
  v24 = (char *)a2 + v22;
  *(_QWORD *)(a1 + v22) = *(_QWORD *)((char *)a2 + v22);
  swift_release();
  v17(v23 + *(int *)(v12 + 20), &v24[*(int *)(v12 + 20)], v16);
  v25 = *(int *)(v18 + 20);
  v26 = (_QWORD *)(v23 + v25);
  v27 = &v24[v25];
  *v26 = *(_QWORD *)&v24[v25];
  swift_release();
  v17((uint64_t)v26 + *(int *)(v12 + 20), &v27[*(int *)(v12 + 20)], v16);
  v28 = a3[9];
  v29 = (_QWORD *)(a1 + v28);
  v30 = (_QWORD *)((char *)a2 + v28);
  *(_QWORD *)(a1 + v28) = *(_QWORD *)((char *)a2 + v28);
  swift_release();
  v31 = v30[2];
  v29[1] = v30[1];
  v29[2] = v31;
  swift_release();
  v29[3] = v30[3];
  v32 = a3[10];
  v33 = *(void **)(a1 + v32);
  *(_QWORD *)(a1 + v32) = *(_QWORD *)((char *)a2 + v32);

  *(_BYTE *)(a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
  return a1;
}

uint64_t getEnumTagSinglePayload for TopHitViewColorScheme()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20CE419EC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = OUTLINED_FUNCTION_6_5();
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for TopHitViewColorScheme()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_QWORD *sub_20CE41A68(_QWORD *result, uint64_t a2, int a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *result = (a2 - 1);
  }
  else
  {
    v7 = OUTLINED_FUNCTION_6_5();
    return (_QWORD *)__swift_storeEnumTagSinglePayload((uint64_t)v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_7()
{
  return type metadata accessor for TopHitViewColorScheme();
}

void OUTLINED_FUNCTION_1_7()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *v0 = v3;
  v0[1] = v4;
  v0[2] = v1;
  v0[3] = 0;
  v0[4] = v1;
  v0[5] = 0;
  v5 = (_QWORD *)((char *)v0 + *(int *)(v2 + 36));
  *v5 = v1;
  v5[1] = 0;
  v5[2] = v1;
  v5[3] = 0;
  *(_QWORD *)((char *)v0 + *(int *)(v2 + 40)) = v4;
}

uint64_t OUTLINED_FUNCTION_2_7()
{
  return type metadata accessor for TopHitViewTextStyle.Resolved(0);
}

uint64_t OUTLINED_FUNCTION_3_7()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v1 + *(int *)(v3 + 20), v2, v0);
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  return type metadata accessor for TopHitViewTextStyle(0);
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_9_2(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_10_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(_QWORD);
  uint64_t v3;

  return sub_20CE13CB0(v3, v1 + *(int *)(a1 + 20), v2);
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(_QWORD);

  return sub_20CE13CB0(v1, v0 + *(int *)(v2 + 32), v3);
}

uint64_t OUTLINED_FUNCTION_12_4()
{
  return sub_20CE675F0();
}

uint64_t OUTLINED_FUNCTION_13_3()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD);
  uint64_t v2;

  return sub_20CE15BB0(v2, v0, v1);
}

id OUTLINED_FUNCTION_15_2(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_17_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 104))(v3, a2, v2);
}

id OUTLINED_FUNCTION_18_1(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_20_1()
{
  return sub_20CE67404();
}

uint64_t OUTLINED_FUNCTION_21_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(_QWORD);

  return sub_20CE15BB0(v2, a2, v3);
}

id OUTLINED_FUNCTION_25_2(void *a1, unsigned __int8 *a2)
{
  _QWORD *v2;

  return static TopHitViewColorScheme.default(for:style:)(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_26_2()
{
  return sub_20CE67404();
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

void sub_20CE41C74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = OUTLINED_FUNCTION_9_3();
  v1 = MEMORY[0x212B97A80](MEMORY[0x24BDEB358], v0);
  type metadata accessor for GradientColorResolverView(255, v0, v1, v2);
  OUTLINED_FUNCTION_10_4();
  sub_20CE66F90();
  v3 = sub_20CE66E70();
  sub_20CE66F90();
  sub_20CE14D80();
  MEMORY[0x212B97A80](MEMORY[0x24BDEB950], v3);
  OUTLINED_FUNCTION_10();
}

void sub_20CE41D4C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_11_4();
  sub_20CE66F90();
  sub_20CE66F90();
  MEMORY[0x212B97A80](&protocol conformance descriptor for GradientColorResolverView<A>, v0);
  OUTLINED_FUNCTION_74();
}

void sub_20CE41DAC()
{
  OUTLINED_FUNCTION_10();
}

uint64_t sub_20CE41DBC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];
  _QWORD v7[18];

  v7[0] = v1;
  v7[1] = a1;
  v6[0] = MEMORY[0x212B97A80](v2, v3, v7);
  v6[1] = MEMORY[0x24BDF0390];
  return MEMORY[0x212B97A80](v2, v4, v6);
}

void OUTLINED_FUNCTION_0_8(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
}

__n128 OUTLINED_FUNCTION_2_8()
{
  uint64_t v0;
  __n128 result;
  __int128 v2;

  result = *(__n128 *)(v0 - 128);
  v2 = *(_OWORD *)(v0 - 112);
  *(__n128 *)(v0 - 192) = result;
  *(_OWORD *)(v0 - 176) = v2;
  *(_QWORD *)(v0 - 160) = *(_QWORD *)(v0 - 96);
  return result;
}

uint64_t OUTLINED_FUNCTION_3_8()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_4_5@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 272) = (char *)&a2 - a1;
  return sub_20CE675F0();
}

void OUTLINED_FUNCTION_5_5(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 224) = v1;
  *(_QWORD *)(v2 - 216) = a1;
  JUMPOUT(0x212B97A80);
}

uint64_t OUTLINED_FUNCTION_6_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 288) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_7_4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

void OUTLINED_FUNCTION_8_5(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 360) = (char *)&a2 - a1;
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return sub_20CE66E34();
}

uint64_t OUTLINED_FUNCTION_10_4()
{
  return sub_20CE66FCC();
}

uint64_t OUTLINED_FUNCTION_11_4()
{
  return sub_20CE66FE4();
}

uint64_t OUTLINED_FUNCTION_12_5(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 304) = a1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_15_3@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_16_2()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_18_2()
{
  return sub_20CE67338();
}

__n128 OUTLINED_FUNCTION_19_1()
{
  uint64_t v0;
  uint64_t v1;
  __n128 result;

  v1 = *(_QWORD *)(v0 - 112);
  result = *(__n128 *)(v0 - 128);
  *(__n128 *)(v0 - 192) = result;
  *(_QWORD *)(v0 - 176) = v1;
  return result;
}

unint64_t OUTLINED_FUNCTION_20_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return sub_20CE14D80();
}

void OUTLINED_FUNCTION_21_2()
{
  JUMPOUT(0x212B97A80);
}

void OUTLINED_FUNCTION_22_0()
{
  JUMPOUT(0x212B97A80);
}

double TopHitCollectionViewStyle.minimumColumnSpacing.getter()
{
  return 17.0;
}

uint64_t TopHitCollectionViewStyle.hash(into:)()
{
  return sub_20CE678C0();
}

uint64_t TopHitCollectionViewStyle.hashValue.getter()
{
  sub_20CE678B4();
  sub_20CE678C0();
  return sub_20CE678E4();
}

unint64_t sub_20CE41FDC()
{
  unint64_t result;

  result = qword_254997600;
  if (!qword_254997600)
  {
    result = MEMORY[0x212B97A80](&protocol conformance descriptor for TopHitCollectionViewStyle, &type metadata for TopHitCollectionViewStyle);
    atomic_store(result, (unint64_t *)&qword_254997600);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for TopHitCollectionViewStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20CE42064 + 4 * byte_20CE6D0C5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_20CE42098 + 4 * byte_20CE6D0C0[v4]))();
}

uint64_t sub_20CE42098(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CE420A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20CE420A8);
  return result;
}

uint64_t sub_20CE420B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20CE420BCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_20CE420C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CE420C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

double WFColor.luminance.getter(uint64_t a1)
{
  id v1;
  double v2;
  double v3;
  id v4;
  double v5;
  double v6;
  double v7;

  v1 = OUTLINED_FUNCTION_0_0(a1, sel_red);
  v3 = v2 * 0.2126;
  v4 = OUTLINED_FUNCTION_0_0((uint64_t)v1, sel_green);
  v6 = v3 + v5 * 0.7152;
  OUTLINED_FUNCTION_0_0((uint64_t)v4, sel_blue);
  return v6 + v7 * 0.0722;
}

id WFColor.luminanceAdjustedColor(in:)(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unsigned int v10;
  void (*v11)(char *, uint64_t, uint64_t);
  char v12;
  uint64_t (*v13)(char *, uint64_t);
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  double v18;
  double v19;
  id v20;
  double v21;
  id v22;
  double v23;
  double v24;
  id v25;
  double v26;
  id v27;
  double v28;
  double v29;
  double v30;
  id v31;
  char v32;
  uint64_t v33;
  double v34;
  char v35;
  uint64_t v36;
  double v37;
  double v38;
  uint64_t v39;
  id v40;
  double v41;
  double v42;
  id v43;
  double v44;
  double v45;
  id v46;
  double v47;
  double v48;
  double v49;
  id v50;
  uint64_t v52;
  uint64_t v53;

  v3 = sub_20CE66E4C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v52 - v8;
  sub_20CE67410();
  v10 = *MEMORY[0x24BDEB400];
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  v11(v6, *MEMORY[0x24BDEB400], v3);
  v53 = a1;
  v12 = sub_20CE66E40();
  v13 = *(uint64_t (**)(char *, uint64_t))(v4 + 8);
  OUTLINED_FUNCTION_1_8();
  if ((v12 & 1) != 0)
    v14 = *MEMORY[0x24BDEB3F0];
  else
    v14 = v10;
  v11(v9, v14, v3);
  v15 = Color.wfColor(with:)((uint64_t)v9);
  swift_release();
  v16 = v13(v9, v3);
  v17 = OUTLINED_FUNCTION_0_0(v16, sel_red);
  v19 = v18;
  v20 = OUTLINED_FUNCTION_4_6((uint64_t)v17, sel_red);
  if (vabdd_f64(v19, v21) >= 0.015
    || (v22 = OUTLINED_FUNCTION_0_0((uint64_t)v20, sel_green),
        v24 = v23,
        v25 = OUTLINED_FUNCTION_4_6((uint64_t)v22, sel_green),
        vabdd_f64(v24, v26) >= 0.015)
    || (v27 = OUTLINED_FUNCTION_0_0((uint64_t)v25, sel_blue),
        v29 = v28,
        OUTLINED_FUNCTION_4_6((uint64_t)v27, sel_blue),
        vabdd_f64(v29, v30) >= 0.015))
  {
    OUTLINED_FUNCTION_2_9();
    v32 = OUTLINED_FUNCTION_3_9();
    v33 = OUTLINED_FUNCTION_1_8();
    if ((v32 & 1) != 0)
      v34 = 0.17;
    else
      v34 = 0.97;
    if (vabdd_f64(WFColor.luminance.getter(v33), v34) >= 0.3)
    {
      v50 = v1;
    }
    else
    {
      OUTLINED_FUNCTION_2_9();
      v35 = OUTLINED_FUNCTION_3_9();
      v36 = OUTLINED_FUNCTION_1_8();
      if ((v35 & 1) != 0)
        v37 = 0.45;
      else
        v37 = 0.65;
      v38 = v37 - WFColor.luminance.getter(v36);
      v40 = OUTLINED_FUNCTION_0_0(v39, sel_red);
      v42 = v38 + v41;
      v43 = OUTLINED_FUNCTION_0_0((uint64_t)v40, sel_green);
      v45 = v38 + v44;
      v46 = OUTLINED_FUNCTION_0_0((uint64_t)v43, sel_blue);
      v48 = v38 + v47;
      OUTLINED_FUNCTION_0_0((uint64_t)v46, sel_alpha);
      v50 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEC1398]), sel_initWithRed_green_blue_alpha_, v42, v45, v48, v49);
    }
    v31 = v50;

  }
  else
  {
    sub_20CE67410();
    v31 = Color.wfColor(with:)(v53);

    swift_release();
  }
  return v31;
}

uint64_t OUTLINED_FUNCTION_1_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_2_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v2, v0, v1);
}

uint64_t OUTLINED_FUNCTION_3_9()
{
  return sub_20CE66E40();
}

id OUTLINED_FUNCTION_4_6(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id WFLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  WFCurrentBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, v1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id WFCurrentBundle()
{
  if (WFCurrentBundle_onceToken != -1)
    dispatch_once(&WFCurrentBundle_onceToken, &__block_literal_global_18);
  return (id)WFCurrentBundle_bundle;
}

id WFLocalizedStringFromTable(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = a1;
  WFCurrentBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

CGFloat WFCGColorPerceivedLightness(CGColor *a1)
{
  size_t NumberOfComponents;
  const CGFloat *Components;
  CGFloat result;

  NumberOfComponents = CGColorGetNumberOfComponents(a1);
  Components = CGColorGetComponents(a1);
  if (NumberOfComponents == 4)
    return sqrt(Components[1] * (Components[1] * 0.587)+ *Components * 0.299 * *Components+ Components[2] * 0.114 * Components[2]);
  result = 0.0;
  if (NumberOfComponents == 2)
    return *Components;
  return result;
}

BOOL WFCGColorIsPerceivedLight(CGColor *a1)
{
  return WFCGColorPerceivedLightness(a1) > 0.7;
}

void sub_20CE45810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CE45DD0(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void __getWFHomeWorkflowClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  WorkflowKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("WFHomeWorkflow");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getWFHomeWorkflowClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class  _Nonnull getWFHomeWorkflowClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFHomeWorkflowEditorViewController.m"), 127, CFSTR("Unable to find class %s"), "WFHomeWorkflow");

    __break(1u);
  }
}

void *WorkflowKitLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!WorkflowKitLibraryCore_frameworkLibrary)
    WorkflowKitLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)WorkflowKitLibraryCore_frameworkLibrary;
  if (!WorkflowKitLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *WorkflowKitLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFHomeWorkflowEditorViewController.m"), 21, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void __getWFWorkflowFileClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  WorkflowKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("WFWorkflowFile");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getWFWorkflowFileClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class  _Nonnull getWFWorkflowFileClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFHomeWorkflowEditorViewController.m"), 126, CFSTR("Unable to find class %s"), "WFWorkflowFile");

    __break(1u);
  }
}

id getWFWorkflowClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getWFWorkflowClass_softClass;
  v7 = getWFWorkflowClass_softClass;
  if (!getWFWorkflowClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getWFWorkflowClass_block_invoke;
    v3[3] = &unk_24C5AB7C0;
    v3[4] = &v4;
    __getWFWorkflowClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20CE461E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getWFWorkflowRecordClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  WorkflowKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("WFWorkflowRecord");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getWFWorkflowRecordClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class  _Nonnull getWFWorkflowRecordClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFHomeWorkflowEditorViewController.m"), 125, CFSTR("Unable to find class %s"), "WFWorkflowRecord");

    __break(1u);
  }
}

void __getWFHFTriggerActionSetsBuilderParameterStateClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  WorkflowKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("WFHFTriggerActionSetsBuilderParameterState");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getWFHFTriggerActionSetsBuilderParameterStateClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                             + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class  _Nonnull getWFHFTriggerActionSetsBuilderParameterStateClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFHomeWorkflowEditorViewController.m"), 132, CFSTR("Unable to find class %s"), "WFHFTriggerActionSetsBuilderParameterState");

    __break(1u);
  }
}

id getWFActionRegistryClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getWFActionRegistryClass_softClass;
  v7 = getWFActionRegistryClass_softClass;
  if (!getWFActionRegistryClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getWFActionRegistryClass_block_invoke;
    v3[3] = &unk_24C5AB7C0;
    v3[4] = &v4;
    __getWFActionRegistryClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20CE46420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getWFComposeViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!WorkflowUILibraryCore_frameworkLibrary)
    WorkflowUILibraryCore_frameworkLibrary = _sl_dlopen();
  if (!WorkflowUILibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *WorkflowUILibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFHomeWorkflowEditorViewController.m"), 19, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("WFComposeViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class  _Nonnull getWFComposeViewControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFHomeWorkflowEditorViewController.m"), 131, CFSTR("Unable to find class %s"), "WFComposeViewController");

LABEL_8:
    __break(1u);
  }
  getWFComposeViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getWFActionRegistryClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  WorkflowKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("WFActionRegistry");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getWFActionRegistryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class  _Nonnull getWFActionRegistryClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFHomeWorkflowEditorViewController.m"), 130, CFSTR("Unable to find class %s"), "WFActionRegistry");

    __break(1u);
  }
}

void __getWFWorkflowClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  WorkflowKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("WFWorkflow");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getWFWorkflowClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class  _Nonnull getWFWorkflowClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFHomeWorkflowEditorViewController.m"), 128, CFSTR("Unable to find class %s"), "WFWorkflow");

    __break(1u);
  }
}

id getWFHomeManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getWFHomeManagerClass_softClass;
  v7 = getWFHomeManagerClass_softClass;
  if (!getWFHomeManagerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getWFHomeManagerClass_block_invoke;
    v3[3] = &unk_24C5AB7C0;
    v3[4] = &v4;
    __getWFHomeManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20CE46894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getWFHomeManagerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  WorkflowKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("WFHomeManager");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getWFHomeManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class  _Nonnull getWFHomeManagerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFHomeWorkflowEditorViewController.m"), 129, CFSTR("Unable to find class %s"), "WFHomeManager");

    __break(1u);
  }
}

void sub_20CE48054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CE4815C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getLNFocusConfigurationSuggestionContextClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  LinkServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("LNFocusConfigurationSuggestionContext");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getLNFocusConfigurationSuggestionContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getLNFocusConfigurationSuggestionContextClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFFocusConfigurationOptions.m"), 14, CFSTR("Unable to find class %s"), "LNFocusConfigurationSuggestionContext");

    __break(1u);
  }
}

void LinkServicesLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!LinkServicesLibraryCore_frameworkLibrary)
    LinkServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!LinkServicesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *LinkServicesLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFFocusConfigurationOptions.m"), 12, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void __getLNFullyQualifiedActionIdentifierClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  LinkServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("LNFullyQualifiedActionIdentifier");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getLNFullyQualifiedActionIdentifierClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getLNFullyQualifiedActionIdentifierClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFFocusConfigurationOptions.m"), 13, CFSTR("Unable to find class %s"), "LNFullyQualifiedActionIdentifier");

    __break(1u);
  }
}

void sub_20CE48B48(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v2);
  objc_destroyWeak(v3);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 128));
  _Unwind_Resume(a1);
}

void sub_20CE4A01C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 96));
  _Unwind_Resume(a1);
}

void sub_20CE4BDA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CE4C1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getLNFullyQualifiedActionIdentifierClass_block_invoke_627(uint64_t a1)
{
  void *v2;
  void *v3;

  LinkServicesLibrary_634();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("LNFullyQualifiedActionIdentifier");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getLNFullyQualifiedActionIdentifierClass_softClass_626 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getLNFullyQualifiedActionIdentifierClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFFocusConfigurationRequest.m"), 18, CFSTR("Unable to find class %s"), "LNFullyQualifiedActionIdentifier");

    __break(1u);
  }
}

void __getLNActionClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  LinkServicesLibrary_634();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("LNAction");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getLNActionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getLNActionClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFFocusConfigurationRequest.m"), 17, CFSTR("Unable to find class %s"), "LNAction");

    __break(1u);
  }
}

void __getLNFocusConfigurationSuggestionContextClass_block_invoke_629(uint64_t a1)
{
  void *v2;
  void *v3;

  LinkServicesLibrary_634();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("LNFocusConfigurationSuggestionContext");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getLNFocusConfigurationSuggestionContextClass_softClass_628 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                            + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getLNFocusConfigurationSuggestionContextClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFFocusConfigurationRequest.m"), 20, CFSTR("Unable to find class %s"), "LNFocusConfigurationSuggestionContext");

    __break(1u);
  }
}

void LinkServicesLibrary_634()
{
  void *v0;
  void *v1;
  void *v2;

  if (!LinkServicesLibraryCore_frameworkLibrary_639)
    LinkServicesLibraryCore_frameworkLibrary_639 = _sl_dlopen();
  if (!LinkServicesLibraryCore_frameworkLibrary_639)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *LinkServicesLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFFocusConfigurationRequest.m"), 16, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void __getLNActionDefaultValueProviderClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  LinkServicesLibrary_634();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("LNActionDefaultValueProvider");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getLNActionDefaultValueProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getLNActionDefaultValueProviderClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFFocusConfigurationRequest.m"), 19, CFSTR("Unable to find class %s"), "LNActionDefaultValueProvider");

    __break(1u);
  }
}

void sub_20CE4F814()
{
  void *v0;
  void *v1;
  void (**v2)(_QWORD);
  uint64_t v3;

  v2[2](v2);

}

id unfilledVariantForSymbolName(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "hasSuffix:", CFSTR(".fill")))
  {
    objc_msgSend(v1, "substringToIndex:", objc_msgSend(v1, "length") - objc_msgSend(CFSTR(".fill"), "length"));
    v2 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v2;
  }
  return v1;
}

void sub_20CE54A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

WFShortcutsWidgetConfigurationIntent *WFCreateShortcutsWidgetConfigurationIntent()
{
  WFShortcutsWidgetConfigurationIntent *v0;
  WFFolder *v1;
  void *v2;
  WFFolder *v3;
  void *v4;
  void *v5;

  v0 = objc_alloc_init(WFShortcutsWidgetConfigurationIntent);
  -[WFShortcutsWidgetConfigurationIntent _setLaunchId:](v0, "_setLaunchId:", *MEMORY[0x24BEC17D8]);
  -[WFShortcutsWidgetConfigurationIntent _setExtensionBundleId:](v0, "_setExtensionBundleId:", CFSTR("com.apple.WorkflowKit.ShortcutsIntents"));
  v1 = [WFFolder alloc];
  WFLocalizedAllShortcutsString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[WFFolder initWithIdentifier:displayString:](v1, "initWithIdentifier:displayString:", 0, v2);
  -[WFShortcutsWidgetConfigurationIntent setFolder:](v0, "setFolder:", v3);

  objc_msgSend(MEMORY[0x24BDD9DA8], "systemImageNamed:", CFSTR("rectangle.grid.2x2"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFShortcutsWidgetConfigurationIntent folder](v0, "folder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisplayImage:", v4);

  return v0;
}

WFShortcutsSmallWidgetConfigurationIntent *WFCreateShortcutsSmallWidgetConfigurationIntent()
{
  WFShortcutsSmallWidgetConfigurationIntent *v0;
  void *v1;
  void *v2;
  id v3;
  NSObject *v4;
  WFShortcut *v5;
  void *v6;
  void *v7;
  WFShortcut *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CFMutableDataRef Mutable;
  void *v15;
  void *v16;
  void *v17;
  const void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  __int128 buf;
  uint64_t v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc_init(WFShortcutsSmallWidgetConfigurationIntent);
  -[WFShortcutsSmallWidgetConfigurationIntent _setLaunchId:](v0, "_setLaunchId:", *MEMORY[0x24BEC17D8]);
  -[WFShortcutsSmallWidgetConfigurationIntent _setExtensionBundleId:](v0, "_setExtensionBundleId:", CFSTR("com.apple.WorkflowKit.ShortcutsIntents"));
  objc_msgSend(MEMORY[0x24BEC1318], "standardClient");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = 0;
  objc_msgSend(v1, "firstUnsortedWorkflowWithBackgroundColorValue:error:", &v34, &v33);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v34;
  v32 = v33;

  if (!v2)
  {
    v4 = os_log_create("com.apple.shortcuts", "Widget");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v32;
      _os_log_error_impl(&dword_20CE0F000, v4, OS_LOG_TYPE_ERROR, "Failed to get first unsorted workflow in WFCreateShortcutsSmallWidgetConfigurationIntent: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  v5 = [WFShortcut alloc];
  objc_msgSend(v2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFShortcut initWithIdentifier:displayString:](v5, "initWithIdentifier:displayString:", v6, v7);

  if (objc_msgSend(v2, "glyphCharacter"))
  {
    if (v3)
    {
      v36 = v3;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = 0;
    }
    objc_msgSend(MEMORY[0x24BEC1318], "standardClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v2, "glyphCharacter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "drawGlyphs:atSize:withBackgroundColorValues:error:", v11, v31, 0, 30.0, 30.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      Mutable = CFDataCreateMutable(0, 0);
      objc_msgSend((id)*MEMORY[0x24BDF84F8], "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v38 = 0x2020000000;
      v16 = getCGImageDestinationCreateWithDataSymbolLoc_ptr;
      v39 = getCGImageDestinationCreateWithDataSymbolLoc_ptr;
      if (!getCGImageDestinationCreateWithDataSymbolLoc_ptr)
      {
        v17 = ImageIOLibrary();
        v16 = dlsym(v17, "CGImageDestinationCreateWithData");
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v16;
        getCGImageDestinationCreateWithDataSymbolLoc_ptr = v16;
      }
      _Block_object_dispose(&buf, 8);
      if (v16)
      {
        v18 = (const void *)((uint64_t (*)(CFMutableDataRef, void *, uint64_t, _QWORD))v16)(Mutable, v15, 1, 0);

        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v38 = 0x2020000000;
        v19 = getCGImageDestinationAddImageSymbolLoc_ptr;
        v39 = getCGImageDestinationAddImageSymbolLoc_ptr;
        if (!getCGImageDestinationAddImageSymbolLoc_ptr)
        {
          v20 = ImageIOLibrary();
          v19 = dlsym(v20, "CGImageDestinationAddImage");
          *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v19;
          getCGImageDestinationAddImageSymbolLoc_ptr = v19;
        }
        _Block_object_dispose(&buf, 8);
        if (v19)
        {
          ((void (*)(const void *, void *, _QWORD))v19)(v18, v13, 0);
          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v38 = 0x2020000000;
          v21 = getCGImageDestinationFinalizeSymbolLoc_ptr;
          v39 = getCGImageDestinationFinalizeSymbolLoc_ptr;
          if (!getCGImageDestinationFinalizeSymbolLoc_ptr)
          {
            v22 = ImageIOLibrary();
            v21 = dlsym(v22, "CGImageDestinationFinalize");
            *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v21;
            getCGImageDestinationFinalizeSymbolLoc_ptr = v21;
          }
          _Block_object_dispose(&buf, 8);
          if (v21)
          {
            ((void (*)(const void *))v21)(v18);
            objc_msgSend(MEMORY[0x24BDD9DA8], "imageWithImageData:", Mutable);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "_setRenderingMode:", 1);
            if (v23)
              -[WFShortcut setDisplayImage:](v8, "setDisplayImage:", v23);
            CFRelease(v18);
            CFRelease(Mutable);

            goto LABEL_22;
          }
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "_Bool WFCGImageDestinationFinalize(CGImageDestinationRef _Nonnull)");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("WFWidgetViewController.m"), 39, CFSTR("%s"), dlerror());

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void WFCGImageDestinationAddImage(CGImageDestinationRef _Nonnull, CGImageRef _Nonnull, CFDictionaryRef _Nullable)");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("WFWidgetViewController.m"), 38, CFSTR("%s"), dlerror());

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGImageDestinationRef  _Nullable WFCGImageDestinationCreateWithData(CFMutableDataRef _Nonnull, CFStringRef _Nonnull, size_t, CFDictionaryRef _Nullable)");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("WFWidgetViewController.m"), 37, CFSTR("%s"), dlerror());

      }
      __break(1u);
    }
LABEL_22:

  }
  -[WFShortcutsSmallWidgetConfigurationIntent setShortcut:](v0, "setShortcut:", v8);

  return v0;
}

void sub_20CE573A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *ImageIOLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!ImageIOLibraryCore_frameworkLibrary)
    ImageIOLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)ImageIOLibraryCore_frameworkLibrary;
  if (!ImageIOLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ImageIOLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFWidgetViewController.m"), 36, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

uint64_t (*initDOCCreateDefaultHomeScreenWidgetIntent())()
{
  uint64_t (*v0)();

  if (DocumentManagerUICoreLibrary_sOnce != -1)
    dispatch_once(&DocumentManagerUICoreLibrary_sOnce, &__block_literal_global_1397);
  v0 = (uint64_t (*)())dlsym((void *)DocumentManagerUICoreLibrary_sLib, "DOCCreateDefaultHomeScreenWidgetIntent");
  softLinkDOCCreateDefaultHomeScreenWidgetIntent = v0;
  if (v0)
  {
    v0();
    v0 = (uint64_t (*)())objc_claimAutoreleasedReturnValue();
  }
  return v0;
}

void WFWidgetGetDefaultColors(void *a1, _QWORD *a2, _QWORD *a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (a2)
    *a2 = 0;
  if (a3)
    *a3 = 0;
  v5 = (objc_class *)MEMORY[0x24BDC1528];
  v6 = a1;
  v14 = (id)objc_msgSend([v5 alloc], "initWithBundleIdentifier:error:", v6, 0);

  objc_msgSend(v14, "containingBundleRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "bundleIdentifier");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        if (a2 && !*a2)
        {
          v10 = (void *)MEMORY[0x24BEBD4B8];
          objc_msgSend(v8, "stringByAppendingString:", CFSTR("-Background"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "wf_colorNamed:inBundle:", v11, v9);
          *a2 = (id)objc_claimAutoreleasedReturnValue();

        }
        if (a3 && !*a3)
        {
          v12 = (void *)MEMORY[0x24BEBD4B8];
          objc_msgSend(v8, "stringByAppendingString:", CFSTR("-Accent"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "wf_colorNamed:inBundle:", v13, v9);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

        }
      }

    }
  }

}

void WFWidgetColorsFromBundle(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  _QWORD *v15;
  NSObject *v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (a2)
    *a2 = 0;
  if (a3)
    *a3 = 0;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "infoDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("NSWidgetBackgroundColorName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (a2 && v8)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "wf_colorNamed:inBundle:", v8, v6);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "infoDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("NSAccentColorName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 && v10)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "wf_colorNamed:inBundle:", v10, v6);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "hasPrefix:", CFSTR("com.apple")) && (!a2 || !*a2))
    {
      if (a3)
      {
        v12 = *a3;

        if (v12)
        {
LABEL_24:

          goto LABEL_25;
        }
        objc_msgSend(v6, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v13;
        v14 = a2;
        v15 = a3;
      }
      else
      {

        objc_msgSend(v6, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v13;
        v14 = a2;
        v15 = 0;
      }
      WFWidgetGetDefaultColors(v13, v14, v15);
    }

    goto LABEL_24;
  }
  getWFWidgetConfigurationLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    v17 = 136315138;
    v18 = "WFWidgetColorsFromBundle";
    _os_log_impl(&dword_20CE0F000, v16, OS_LOG_TYPE_FAULT, "%s Unable to open bundle URL passed to WFWidgetColorsFromBundle", (uint8_t *)&v17, 0xCu);
  }

LABEL_25:
}

void sub_20CE5BFF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getLNActionClass_block_invoke_1794(uint64_t a1)
{
  void *v2;
  void *v3;

  LinkServicesLibrary_1795();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("LNAction");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getLNActionClass_softClass_1793 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getLNActionClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFFocusConfigurationUIState.m"), 15, CFSTR("Unable to find class %s"), "LNAction");

    __break(1u);
  }
}

void __getLNDisplayRepresentationClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  LinkServicesLibrary_1795();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("LNDisplayRepresentation");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getLNDisplayRepresentationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getLNDisplayRepresentationClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFFocusConfigurationUIState.m"), 16, CFSTR("Unable to find class %s"), "LNDisplayRepresentation");

    __break(1u);
  }
}

void LinkServicesLibrary_1795()
{
  void *v0;
  void *v1;
  void *v2;

  if (!LinkServicesLibraryCore_frameworkLibrary_1803)
    LinkServicesLibraryCore_frameworkLibrary_1803 = _sl_dlopen();
  if (!LinkServicesLibraryCore_frameworkLibrary_1803)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *LinkServicesLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFFocusConfigurationUIState.m"), 14, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

id getWFSystemActionConfigurationLogObject()
{
  if (getWFSystemActionConfigurationLogObject_onceToken != -1)
    dispatch_once(&getWFSystemActionConfigurationLogObject_onceToken, &__block_literal_global_1852);
  return (id)getWFSystemActionConfigurationLogObject_log;
}

void __getWFSystemActionConfigurationLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x24BEC1968], "SystemActionConfiguration");
  v1 = (void *)getWFSystemActionConfigurationLogObject_log;
  getWFSystemActionConfigurationLogObject_log = (uint64_t)v0;

}

void sub_20CE5DA30(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 112));
  _Unwind_Resume(a1);
}

BOOL CGImageHasTransparentPixelAtPoint(CGImage *a1, double a2, double a3)
{
  CGContext *v6;
  CGFloat Width;
  unint64_t v8;
  char data;
  CGRect v11;

  data = 0;
  v6 = CGBitmapContextCreate(&data, 1uLL, 1uLL, 8uLL, 1uLL, 0, 7u);
  Width = (double)CGImageGetWidth(a1);
  v11.size.height = (double)CGImageGetHeight(a1);
  v11.origin.x = -a2;
  v11.origin.y = -a3;
  v11.size.width = Width;
  CGContextDrawImage(v6, v11, a1);
  CGContextRelease(v6);
  LOBYTE(v8) = data;
  return (double)v8 / 255.0 < 0.01;
}

id WFFocusConfigurationServiceXPCInterface()
{
  void *v0;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549C7B58);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_startConfigurationWithRequest_completion_, 0, 1);
  return v0;
}

uint64_t WFFocusConfigurationHostXPCInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549B0880);
}

id UIImageFromISIcon(void *a1, double a2, double a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)MEMORY[0x24BE51AB0];
  v6 = a1;
  v7 = [v5 alloc];
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = (void *)objc_msgSend(v7, "initWithSize:scale:", a2, a3, v9);

  v17[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepareImagesForImageDescriptors:", v11);

  objc_msgSend(v6, "imageForImageDescriptor:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BEBD640];
  v14 = objc_msgSend(v12, "CGImage");
  objc_msgSend(v12, "scale");
  objc_msgSend(v13, "imageWithCGImage:scale:orientation:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void sub_20CE625C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CE627D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id WFDarkenColor(void *a1, double a2, double a3)
{
  uint64_t v6;
  double v7;
  double v8;
  double v9;

  v8 = 0.0;
  v9 = 0.0;
  v6 = 0;
  v7 = 0.0;
  objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v9, &v8, &v7, &v6);
  v7 = v7 - a3;
  v8 = v8 - a2;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithHue:saturation:brightness:alpha:", v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

id getWFFocusConfigurationLogObject()
{
  if (getWFFocusConfigurationLogObject_onceToken != -1)
    dispatch_once(&getWFFocusConfigurationLogObject_onceToken, &__block_literal_global_2841);
  return (id)getWFFocusConfigurationLogObject_log;
}

void __getWFFocusConfigurationLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x24BEC1968], "FocusConfiguration");
  v1 = (void *)getWFFocusConfigurationLogObject_log;
  getWFFocusConfigurationLogObject_log = (uint64_t)v0;

}

uint64_t WFSystemActionConfigurationServiceXPCInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549C7BB8);
}

id WFSystemActionConfigurationHostXPCInterface()
{
  void *v0;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549B6460);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_didSelectSystemAction_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_didCancelSystemActionConfiguration_, 0, 0);
  return v0;
}

id WFWidgetConfigurationServiceXPCInterface()
{
  void *v0;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549C7C18);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_startConfigurationWithRequest_completion_, 0, 1);
  return v0;
}

uint64_t WFWidgetConfigurationHostXPCInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549BF300);
}

uint64_t sub_20CE66CFC()
{
  return MEMORY[0x24BDCB668]();
}

uint64_t sub_20CE66D08()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_20CE66D14()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_20CE66D20()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_20CE66D2C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_20CE66D38()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_20CE66D44()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_20CE66D50()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_20CE66D5C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_20CE66D68()
{
  return MEMORY[0x24BDCDCD8]();
}

uint64_t sub_20CE66D74()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_20CE66D80()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_20CE66D8C()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_20CE66D98()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_20CE66DA4()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_20CE66DB0()
{
  return MEMORY[0x24BEC1270]();
}

uint64_t sub_20CE66DBC()
{
  return MEMORY[0x24BDFBAC8]();
}

uint64_t sub_20CE66DC8()
{
  return MEMORY[0x24BDFBAE8]();
}

uint64_t sub_20CE66DD4()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_20CE66DE0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_20CE66DEC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_20CE66DF8()
{
  return MEMORY[0x24BDEAE98]();
}

uint64_t sub_20CE66E04()
{
  return MEMORY[0x24BDEAEB0]();
}

uint64_t sub_20CE66E10()
{
  return MEMORY[0x24BDEB030]();
}

uint64_t sub_20CE66E1C()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_20CE66E28()
{
  return MEMORY[0x24BDEB330]();
}

uint64_t sub_20CE66E34()
{
  return MEMORY[0x24BDEB338]();
}

uint64_t sub_20CE66E40()
{
  return MEMORY[0x24BDEB3E0]();
}

uint64_t sub_20CE66E4C()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_20CE66E58()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_20CE66E64()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_20CE66E70()
{
  return MEMORY[0x24BDEB938]();
}

uint64_t sub_20CE66E7C()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_20CE66E88()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_20CE66E94()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_20CE66EA0()
{
  return MEMORY[0x24BDEBE20]();
}

uint64_t sub_20CE66EAC()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_20CE66EB8()
{
  return MEMORY[0x24BDEBF88]();
}

uint64_t sub_20CE66EC4()
{
  return MEMORY[0x24BDEC000]();
}

uint64_t sub_20CE66ED0()
{
  return MEMORY[0x24BDEC168]();
}

uint64_t sub_20CE66EDC()
{
  return MEMORY[0x24BDEC180]();
}

uint64_t sub_20CE66EE8()
{
  return MEMORY[0x24BDEC1A0]();
}

uint64_t sub_20CE66EF4()
{
  return MEMORY[0x24BDEC298]();
}

uint64_t sub_20CE66F00()
{
  return MEMORY[0x24BDEC2E0]();
}

uint64_t sub_20CE66F0C()
{
  return MEMORY[0x24BDEC638]();
}

uint64_t sub_20CE66F18()
{
  return MEMORY[0x24BDEC648]();
}

uint64_t sub_20CE66F24()
{
  return MEMORY[0x24BDEC6B8]();
}

uint64_t sub_20CE66F30()
{
  return MEMORY[0x24BDEC6C0]();
}

uint64_t sub_20CE66F3C()
{
  return MEMORY[0x24BDEC6C8]();
}

uint64_t sub_20CE66F48()
{
  return MEMORY[0x24BDEC6D0]();
}

uint64_t sub_20CE66F54()
{
  return MEMORY[0x24BDEC7B0]();
}

uint64_t sub_20CE66F60()
{
  return MEMORY[0x24BDECB40]();
}

uint64_t sub_20CE66F6C()
{
  return MEMORY[0x24BDECB48]();
}

uint64_t sub_20CE66F78()
{
  return MEMORY[0x24BDECB68]();
}

uint64_t sub_20CE66F84()
{
  return MEMORY[0x24BDECC00]();
}

uint64_t sub_20CE66F90()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_20CE66F9C()
{
  return MEMORY[0x24BDED860]();
}

uint64_t sub_20CE66FA8()
{
  return MEMORY[0x24BDED868]();
}

uint64_t sub_20CE66FB4()
{
  return MEMORY[0x24BDED970]();
}

uint64_t sub_20CE66FC0()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_20CE66FCC()
{
  return MEMORY[0x24BDEDB60]();
}

uint64_t sub_20CE66FD8()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_20CE66FE4()
{
  return MEMORY[0x24BDEDBF0]();
}

uint64_t sub_20CE66FF0()
{
  return MEMORY[0x24BDEDCE0]();
}

uint64_t sub_20CE66FFC()
{
  return MEMORY[0x24BDEDCF0]();
}

uint64_t sub_20CE67008()
{
  return MEMORY[0x24BDEDCF8]();
}

uint64_t sub_20CE67014()
{
  return MEMORY[0x24BDEDD08]();
}

uint64_t sub_20CE67020()
{
  return MEMORY[0x24BDEDD10]();
}

uint64_t sub_20CE6702C()
{
  return MEMORY[0x24BDEDDF0]();
}

uint64_t sub_20CE67038()
{
  return MEMORY[0x24BDFBB28]();
}

uint64_t sub_20CE67044()
{
  return MEMORY[0x24BDFBB30]();
}

uint64_t sub_20CE67050()
{
  return MEMORY[0x24BDFBB48]();
}

uint64_t sub_20CE6705C()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_20CE67068()
{
  return MEMORY[0x24BDEDEF8]();
}

uint64_t sub_20CE67074()
{
  return MEMORY[0x24BDEDF68]();
}

uint64_t sub_20CE67080()
{
  return MEMORY[0x24BDEDF70]();
}

uint64_t sub_20CE6708C()
{
  return MEMORY[0x24BDEDFF8]();
}

uint64_t sub_20CE67098()
{
  return MEMORY[0x24BDEE000]();
}

uint64_t sub_20CE670A4()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_20CE670B0()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_20CE670BC()
{
  return MEMORY[0x24BDEE1C0]();
}

uint64_t sub_20CE670C8()
{
  return MEMORY[0x24BDEE1F0]();
}

uint64_t sub_20CE670D4()
{
  return MEMORY[0x24BDEE1F8]();
}

uint64_t sub_20CE670E0()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_20CE670EC()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_20CE670F8()
{
  return MEMORY[0x24BDEE400]();
}

uint64_t sub_20CE67104()
{
  return MEMORY[0x24BDEE410]();
}

uint64_t sub_20CE67110()
{
  return MEMORY[0x24BDEE468]();
}

uint64_t sub_20CE6711C()
{
  return MEMORY[0x24BDEE478]();
}

uint64_t sub_20CE67128()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_20CE67134()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_20CE67140()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_20CE6714C()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_20CE67158()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_20CE67164()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_20CE67170()
{
  return MEMORY[0x24BDEE628]();
}

uint64_t sub_20CE6717C()
{
  return MEMORY[0x24BDEE630]();
}

uint64_t sub_20CE67188()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_20CE67194()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_20CE671A0()
{
  return MEMORY[0x24BDEEE00]();
}

uint64_t sub_20CE671AC()
{
  return MEMORY[0x24BDEEF48]();
}

uint64_t sub_20CE671B8()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_20CE671C4()
{
  return MEMORY[0x24BDEF0B8]();
}

uint64_t sub_20CE671D0()
{
  return MEMORY[0x24BDEF0D8]();
}

uint64_t sub_20CE671DC()
{
  return MEMORY[0x24BDEF0E8]();
}

uint64_t sub_20CE671E8()
{
  return MEMORY[0x24BDEF358]();
}

uint64_t sub_20CE671F4()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_20CE67200()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_20CE6720C()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_20CE67218()
{
  return MEMORY[0x24BDEF428]();
}

uint64_t sub_20CE67224()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_20CE67230()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_20CE6723C()
{
  return MEMORY[0x24BDF15E8]();
}

uint64_t sub_20CE67248()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_20CE67254()
{
  return MEMORY[0x24BDF16E8]();
}

uint64_t sub_20CE67260()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_20CE6726C()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_20CE67278()
{
  return MEMORY[0x24BDF1768]();
}

uint64_t sub_20CE67284()
{
  return MEMORY[0x24BDF1798]();
}

uint64_t sub_20CE67290()
{
  return MEMORY[0x24BDF1900]();
}

uint64_t sub_20CE6729C()
{
  return MEMORY[0x24BDF1A48]();
}

uint64_t sub_20CE672A8()
{
  return MEMORY[0x24BDF1AE0]();
}

uint64_t sub_20CE672B4()
{
  return MEMORY[0x24BDF1BD0]();
}

uint64_t sub_20CE672C0()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_20CE672CC()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_20CE672D8()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_20CE672E4()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_20CE672F0()
{
  return MEMORY[0x24BDF20D8]();
}

uint64_t sub_20CE672FC()
{
  return MEMORY[0x24BDF2298]();
}

uint64_t sub_20CE67308()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_20CE67314()
{
  return MEMORY[0x24BDF2378]();
}

uint64_t sub_20CE67320()
{
  return MEMORY[0x24BDF2678]();
}

uint64_t sub_20CE6732C()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_20CE67338()
{
  return MEMORY[0x24BDF2938]();
}

uint64_t sub_20CE67344()
{
  return MEMORY[0x24BDF3628]();
}

uint64_t sub_20CE67350()
{
  return MEMORY[0x24BDF3698]();
}

uint64_t sub_20CE6735C()
{
  return MEMORY[0x24BDF3738]();
}

uint64_t sub_20CE67368()
{
  return MEMORY[0x24BDF37C8]();
}

uint64_t sub_20CE67374()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_20CE67380()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_20CE6738C()
{
  return MEMORY[0x24BDF3900]();
}

uint64_t sub_20CE67398()
{
  return MEMORY[0x24BDF3978]();
}

uint64_t sub_20CE673A4()
{
  return MEMORY[0x24BDF3980]();
}

uint64_t sub_20CE673B0()
{
  return MEMORY[0x24BDF39B8]();
}

uint64_t sub_20CE673BC()
{
  return MEMORY[0x24BDF3BD8]();
}

uint64_t sub_20CE673C8()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_20CE673D4()
{
  return MEMORY[0x24BDF3C90]();
}

uint64_t sub_20CE673E0()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_20CE673EC()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_20CE673F8()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_20CE67404()
{
  return MEMORY[0x24BDF3D78]();
}

uint64_t sub_20CE67410()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_20CE6741C()
{
  return MEMORY[0x24BDF3D90]();
}

uint64_t sub_20CE67428()
{
  return MEMORY[0x24BDF3DA0]();
}

uint64_t sub_20CE67434()
{
  return MEMORY[0x24BDF3E78]();
}

uint64_t sub_20CE67440()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_20CE6744C()
{
  return MEMORY[0x24BDF3F18]();
}

uint64_t sub_20CE67458()
{
  return MEMORY[0x24BDF3F28]();
}

uint64_t _s7SwiftUI5ImageV18WorkflowUIServicesE08platformC0ACSo7UIImageC_tcfC_0()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_20CE67470()
{
  return MEMORY[0x24BDF3F68]();
}

uint64_t sub_20CE6747C()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_20CE67488()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_20CE67494()
{
  return MEMORY[0x24BDF4010]();
}

uint64_t sub_20CE674A0()
{
  return MEMORY[0x24BDF4020]();
}

uint64_t sub_20CE674AC()
{
  return MEMORY[0x24BDF4028]();
}

uint64_t sub_20CE674B8()
{
  return MEMORY[0x24BDF4048]();
}

uint64_t sub_20CE674C4()
{
  return MEMORY[0x24BDF4050]();
}

uint64_t sub_20CE674D0()
{
  return MEMORY[0x24BDF4070]();
}

uint64_t sub_20CE674DC()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_20CE674E8()
{
  return MEMORY[0x24BDF4130]();
}

uint64_t sub_20CE674F4()
{
  return MEMORY[0x24BDF4150]();
}

uint64_t sub_20CE67500()
{
  return MEMORY[0x24BDF4208]();
}

uint64_t sub_20CE6750C()
{
  return MEMORY[0x24BDF4218]();
}

uint64_t sub_20CE67518()
{
  return MEMORY[0x24BDF4230]();
}

uint64_t sub_20CE67524()
{
  return MEMORY[0x24BDF4238]();
}

uint64_t sub_20CE67530()
{
  return MEMORY[0x24BDF4248]();
}

uint64_t sub_20CE6753C()
{
  return MEMORY[0x24BDF4278]();
}

uint64_t sub_20CE67548()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_20CE67554()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_20CE67560()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_20CE6756C()
{
  return MEMORY[0x24BDF42C0]();
}

uint64_t sub_20CE67578()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_20CE67584()
{
  return MEMORY[0x24BDF4728]();
}

uint64_t sub_20CE67590()
{
  return MEMORY[0x24BDF4730]();
}

uint64_t sub_20CE6759C()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_20CE675A8()
{
  return MEMORY[0x24BDF4BD0]();
}

uint64_t sub_20CE675B4()
{
  return MEMORY[0x24BDF4D08]();
}

uint64_t sub_20CE675C0()
{
  return MEMORY[0x24BDF4EC0]();
}

uint64_t sub_20CE675CC()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_20CE675D8()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_20CE675E4()
{
  return MEMORY[0x24BDF4F38]();
}

uint64_t sub_20CE675F0()
{
  return MEMORY[0x24BDF5118]();
}

uint64_t sub_20CE675FC()
{
  return MEMORY[0x24BDF53F0]();
}

uint64_t sub_20CE67608()
{
  return MEMORY[0x24BDF5418]();
}

uint64_t sub_20CE67614()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_20CE67620()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_20CE6762C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_20CE67638()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_20CE67644()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_20CE67650()
{
  return MEMORY[0x24BEE0AD0]();
}

uint64_t sub_20CE6765C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_20CE67668()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_20CE67674()
{
  return MEMORY[0x24BEE0B88]();
}

uint64_t sub_20CE67680()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_20CE6768C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_20CE67698()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_20CE676A4()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_20CE676B0()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_20CE676BC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_20CE676C8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_20CE676D4()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_20CE676E0()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_20CE676EC()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_20CE676F8()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_20CE67704()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_20CE67710()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_20CE6771C()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_20CE67728()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_20CE67734()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_20CE67740()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t sub_20CE6774C()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_20CE67758()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_20CE67764()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_20CE67770()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_20CE6777C()
{
  return MEMORY[0x24BDD0570]();
}

uint64_t sub_20CE67788()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_20CE67794()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_20CE677A0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_20CE677AC()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_20CE677B8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_20CE677C4()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_20CE677D0()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_20CE677DC()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_20CE677E8()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_20CE677F4()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_20CE67800()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_20CE6780C()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_20CE67818()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_20CE67824()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_20CE67830()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_20CE6783C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_20CE67848()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_20CE67854()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_20CE67860()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_20CE6786C()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_20CE67878()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_20CE67884()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_20CE67890()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_20CE6789C()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_20CE678A8()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_20CE678B4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_20CE678C0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_20CE678CC()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_20CE678D8()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_20CE678E4()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_20CE678F0()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_20CE678FC()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_20CE67908()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_20CE67914()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_20CE67920()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t BSFloatRoundForScale()
{
  return MEMORY[0x24BE0BC10]();
}

uint64_t BSPointRoundForScale()
{
  return MEMORY[0x24BE0BC90]();
}

uint64_t BSSizeCeilForScale()
{
  return MEMORY[0x24BE0BD38]();
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x24BDE5578](retstr, a, b);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x24BDE55C8](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D0](retstr, sx, sy, sz);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8F8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x24BDBDA78](space, components);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x24BDBDAB0](red, green, blue, alpha);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x24BDBDAF8](color);
}

CGColorRef CGColorGetConstantColor(CFStringRef colorName)
{
  return (CGColorRef)MEMORY[0x24BDBDB00](colorName);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x24BDBDB08](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x24BDBE168](provider);
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x24BDBE5F0](image, space);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x24BDBE630](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x24BDBE638](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x24BDBE648](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE668](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CHSWidgetFamilyDescription()
{
  return MEMORY[0x24BE16950]();
}

uint64_t CHSWidgetFamilyIsAccessory()
{
  return MEMORY[0x24BE16958]();
}

uint64_t INExtractAppInfoFromSiriLaunchId()
{
  return MEMORY[0x24BDD98D8]();
}

uint64_t INIntentWithTypedIntent()
{
  return MEMORY[0x24BDD9950]();
}

uint64_t INTypedIntentWithIntent()
{
  return MEMORY[0x24BDD9AF0]();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BEBD2C8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x24BEBE080](lhs, rhs);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BEBE280](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BEBE298]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BEBE2B0]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x24BEBE6B8]();
}

uint64_t VCDeviceHasBeenUnlocked()
{
  return MEMORY[0x24BEC17E0]();
}

uint64_t VCPerformOnFirstUnlock()
{
  return MEMORY[0x24BEC17F8]();
}

uint64_t WFLocalizedAllShortcutsString()
{
  return MEMORY[0x24BEC18E0]();
}

uint64_t WFSpotlightResultRunnableAccessorySystemImageNameKey()
{
  return MEMORY[0x24BEC1A58]();
}

uint64_t WFSpotlightResultRunnableImageDisplayStyle()
{
  return MEMORY[0x24BEC1A60]();
}

uint64_t WFSpotlightResultRunnableLNPropertyIdentifier()
{
  return MEMORY[0x24BEC1A68]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x24BDBCF60]();
}

uint64_t _UISheetMinimumTopInset()
{
  return MEMORY[0x24BEBEB88]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x24BDAE058](a1, a2);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t getWFGeneralLogObject()
{
  return MEMORY[0x24BEC1DA0]();
}

uint64_t getWFHomeLogObject()
{
  return MEMORY[0x24BEC1DA8]();
}

uint64_t getWFWidgetConfigurationLogObject()
{
  return MEMORY[0x24BEC1DD8]();
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
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

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

