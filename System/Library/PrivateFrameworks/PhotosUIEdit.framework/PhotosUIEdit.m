double static PhotoStyleDPad.Configuration.PhotoStyleDPadGridStyle.lines.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = 12;
  *(_OWORD *)a1 = xmmword_20D195220;
  *(_WORD *)(a1 + 16) = 0;
  return result;
}

double static PhotoStyleDPad.Configuration.PhotoStyleDPadGridStyle.dotted.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = 10;
  *(_OWORD *)a1 = xmmword_20D195230;
  *(_WORD *)(a1 + 16) = -32511;
  return result;
}

uint64_t PhotoStyleDPad.Configuration.showDecorativeElements.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t PhotoStyleDPad.Configuration.showDecorativeElements.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*PhotoStyleDPad.Configuration.showDecorativeElements.modify())()
{
  return nullsub_1;
}

double PhotoStyleDPad.Configuration.visibleGridCount.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

void PhotoStyleDPad.Configuration.visibleGridCount.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 8) = a1;
}

uint64_t (*PhotoStyleDPad.Configuration.visibleGridCount.modify())()
{
  return nullsub_1;
}

double PhotoStyleDPad.Configuration.reachableGridCount.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

void PhotoStyleDPad.Configuration.reachableGridCount.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 16) = a1;
}

uint64_t (*PhotoStyleDPad.Configuration.reachableGridCount.modify())()
{
  return nullsub_1;
}

double PhotoStyleDPad.Configuration.padCornerRadius.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

void PhotoStyleDPad.Configuration.padCornerRadius.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 24) = a1;
}

uint64_t (*PhotoStyleDPad.Configuration.padCornerRadius.modify())()
{
  return nullsub_1;
}

double PhotoStyleDPad.Configuration.valueIndicatorActiveDimension.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 32);
}

void PhotoStyleDPad.Configuration.valueIndicatorActiveDimension.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 32) = a1;
}

uint64_t (*PhotoStyleDPad.Configuration.valueIndicatorActiveDimension.modify())()
{
  return nullsub_1;
}

double PhotoStyleDPad.Configuration.valueIndicatorInactiveDimension.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 40);
}

void PhotoStyleDPad.Configuration.valueIndicatorInactiveDimension.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 40) = a1;
}

uint64_t (*PhotoStyleDPad.Configuration.valueIndicatorInactiveDimension.modify())()
{
  return nullsub_1;
}

double PhotoStyleDPad.Configuration.valueIndicatorActiveShadowRadius.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 48);
}

void PhotoStyleDPad.Configuration.valueIndicatorActiveShadowRadius.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 48) = a1;
}

uint64_t (*PhotoStyleDPad.Configuration.valueIndicatorActiveShadowRadius.modify())()
{
  return nullsub_1;
}

double PhotoStyleDPad.Configuration.defaultValueIndicatorDimension.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 56);
}

void PhotoStyleDPad.Configuration.defaultValueIndicatorDimension.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 56) = a1;
}

uint64_t (*PhotoStyleDPad.Configuration.defaultValueIndicatorDimension.modify())()
{
  return nullsub_1;
}

double PhotoStyleDPad.Configuration.gridDotDimension.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 64);
}

void PhotoStyleDPad.Configuration.gridDotDimension.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 64) = a1;
}

uint64_t (*PhotoStyleDPad.Configuration.gridDotDimension.modify())()
{
  return nullsub_1;
}

uint64_t PhotoStyleDPad.Configuration.useDepthEffects.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 72);
}

uint64_t PhotoStyleDPad.Configuration.useDepthEffects.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 72) = result;
  return result;
}

uint64_t (*PhotoStyleDPad.Configuration.useDepthEffects.modify())()
{
  return nullsub_1;
}

__n128 PhotoStyleDPad.Configuration.gridStyle.getter@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v1;
  unsigned __int16 v2;
  __n128 result;

  v2 = v1[6].n128_u16[0];
  result = v1[5];
  *a1 = result;
  a1[1].n128_u16[0] = v2;
  return result;
}

__n128 PhotoStyleDPad.Configuration.gridStyle.setter(__n128 *a1)
{
  __n128 *v1;
  unsigned __int16 v2;
  __n128 result;

  v2 = a1[1].n128_u16[0];
  result = *a1;
  v1[5] = *a1;
  v1[6].n128_u16[0] = v2;
  return result;
}

uint64_t (*PhotoStyleDPad.Configuration.gridStyle.modify())()
{
  return nullsub_1;
}

double PhotoStyleDPad.Configuration.edgeAntiAliasingSafetyInset.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 104);
}

void PhotoStyleDPad.Configuration.edgeAntiAliasingSafetyInset.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 104) = a1;
}

uint64_t (*PhotoStyleDPad.Configuration.edgeAntiAliasingSafetyInset.modify())()
{
  return nullsub_1;
}

double PhotoStyleDPad.Configuration.axisCollisionHapticsIntensity.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 112);
}

void PhotoStyleDPad.Configuration.axisCollisionHapticsIntensity.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 112) = a1;
}

uint64_t (*PhotoStyleDPad.Configuration.axisCollisionHapticsIntensity.modify())()
{
  return nullsub_1;
}

double PhotoStyleDPad.Configuration.gestureActivationHapticsIntensity.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 120);
}

void PhotoStyleDPad.Configuration.gestureActivationHapticsIntensity.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 120) = a1;
}

uint64_t (*PhotoStyleDPad.Configuration.gestureActivationHapticsIntensity.modify())()
{
  return nullsub_1;
}

BOOL PhotoStyleDPad.Configuration.isDottedGridAnimated.getter()
{
  uint64_t v0;

  return (~*(unsigned __int16 *)(v0 + 96) & 0x8100) == 0;
}

BOOL sub_20D13F948@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = PhotoStyleDPad.Configuration.isDottedGridAnimated.getter();
  *a1 = result;
  return result;
}

uint64_t sub_20D13F974(unsigned __int8 *a1)
{
  return PhotoStyleDPad.Configuration.isDottedGridAnimated.setter(*a1);
}

uint64_t PhotoStyleDPad.Configuration.isDottedGridAnimated.setter(uint64_t result)
{
  uint64_t v1;
  __int16 v2;

  if (*(__int16 *)(v1 + 96) < 0)
  {
    if ((result & 1) != 0)
      v2 = -32512;
    else
      v2 = 0x8000;
    *(_WORD *)(v1 + 96) = v2 & 0xFFFE | *(_WORD *)(v1 + 96) & 1;
  }
  return result;
}

_BYTE *(*PhotoStyleDPad.Configuration.isDottedGridAnimated.modify(uint64_t a1))(_QWORD *a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = (~*(unsigned __int16 *)(v1 + 96) & 0x8100) == 0;
  return sub_20D13F9E8;
}

_BYTE *sub_20D13F9E8(_QWORD *a1)
{
  _BYTE *result;
  uint64_t v2;
  uint64_t v3;
  int v4;
  __int16 v5;

  v3 = *a1;
  result = a1 + 1;
  v2 = v3;
  v4 = *(__int16 *)(v3 + 96);
  if (v4 < 0)
  {
    if (*result)
      v5 = 256;
    else
      v5 = 0;
    *(_WORD *)(v2 + 96) = v5 & 0xFFFE | v4 & 1 | 0x8000;
  }
  return result;
}

BOOL PhotoStyleDPad.Configuration.snapIndicatorToGrid.getter()
{
  uint64_t v0;

  return (~*(unsigned __int16 *)(v0 + 96) & 0x8001) == 0;
}

BOOL sub_20D13FA2C@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = PhotoStyleDPad.Configuration.snapIndicatorToGrid.getter();
  *a1 = result;
  return result;
}

uint64_t sub_20D13FA58(unsigned __int8 *a1)
{
  return PhotoStyleDPad.Configuration.snapIndicatorToGrid.setter(*a1);
}

uint64_t PhotoStyleDPad.Configuration.snapIndicatorToGrid.setter(uint64_t result)
{
  uint64_t v1;
  int v2;

  v2 = *(__int16 *)(v1 + 96);
  if (v2 < 0)
    *(_WORD *)(v1 + 96) = v2 & 0x100 | result & 1 | 0x8000;
  return result;
}

unsigned __int8 *(*PhotoStyleDPad.Configuration.snapIndicatorToGrid.modify(uint64_t a1))(_QWORD *a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = (~*(unsigned __int16 *)(v1 + 96) & 0x8001) == 0;
  return sub_20D13FAC4;
}

unsigned __int8 *sub_20D13FAC4(_QWORD *a1)
{
  unsigned __int8 *result;
  uint64_t v2;
  uint64_t v3;
  int v4;

  v3 = *a1;
  result = (unsigned __int8 *)(a1 + 1);
  v2 = v3;
  v4 = *(__int16 *)(v3 + 96);
  if (v4 < 0)
    *(_WORD *)(v2 + 96) = v4 & 0x100 | *result | 0x8000;
  return result;
}

__n128 PhotoStyleDPad.Configuration.init(showDecorativeElements:visibleGridCount:reachableGridCount:padCornerRadius:valueIndicatorActiveDimension:valueIndicatorInactiveDimension:valueIndicatorActiveShadowRadius:defaultValueIndicatorDimension:gridDotDimension:useDepthEffects:gridStyle:edgeAntiAliasingSafetyInset:axisCollisionHapticsIntensity:gestureActivationHapticsIntensity:)@<Q0>(char a1@<W0>, char a2@<W1>, __n128 *a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>, double a9@<D4>, double a10@<D5>, double a11@<D6>, double a12@<D7>, __int128 a13, uint64_t a14)
{
  unsigned __int16 v14;
  __n128 result;

  v14 = a3[1].n128_u16[0];
  *(_BYTE *)a4 = a1;
  *(double *)(a4 + 8) = a5;
  *(double *)(a4 + 16) = a6;
  *(double *)(a4 + 24) = a7;
  *(double *)(a4 + 32) = a8;
  *(double *)(a4 + 40) = a9;
  *(double *)(a4 + 48) = a10;
  *(double *)(a4 + 56) = a11;
  *(double *)(a4 + 64) = a12;
  *(_BYTE *)(a4 + 72) = a2;
  result = *a3;
  *(__n128 *)(a4 + 80) = *a3;
  *(_WORD *)(a4 + 96) = v14;
  *(_OWORD *)(a4 + 104) = a13;
  *(_QWORD *)(a4 + 120) = a14;
  return result;
}

void static PhotoStyleDPad.Configuration.mac.getter(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 1;
  *(_OWORD *)(a1 + 8) = xmmword_20D195240;
  *(_OWORD *)(a1 + 24) = xmmword_20D195250;
  *(_OWORD *)(a1 + 40) = xmmword_20D195260;
  *(_OWORD *)(a1 + 56) = xmmword_20D195270;
  *(_BYTE *)(a1 + 72) = 1;
  *(_OWORD *)(a1 + 80) = xmmword_20D195280;
  *(_WORD *)(a1 + 96) = -32511;
  OUTLINED_FUNCTION_9(a1, (__n128)xmmword_20D195290);
}

void _s12PhotosUIEdit14PhotoStyleDPadV13ConfigurationV9automaticAEvgZ_0(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 1;
  *(_OWORD *)(a1 + 8) = xmmword_20D1952A0;
  *(_OWORD *)(a1 + 24) = xmmword_20D1952B0;
  *(_OWORD *)(a1 + 40) = xmmword_20D195260;
  *(_OWORD *)(a1 + 56) = xmmword_20D195270;
  *(_BYTE *)(a1 + 72) = 0;
  *(_OWORD *)(a1 + 80) = xmmword_20D195230;
  *(_WORD *)(a1 + 96) = -32511;
  OUTLINED_FUNCTION_9(a1, (__n128)xmmword_20D1952C0);
}

uint64_t PhotoStyleDPad.subscript.getter()
{
  uint64_t v0;
  uint64_t v2;

  OUTLINED_FUNCTION_18(&v2, (const void *)(v0 + 176));
  return swift_getAtKeyPath();
}

void sub_20D13FC34()
{
  uint64_t v0;
  double v1;
  double v2;
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;

  if ((~*(unsigned __int16 *)(v0 + 272) & 0x8001) != 0
    || (v1 = *(double *)(v0 + 112),
        v2 = *(double *)(v0 + 120),
        v3 = *(double *)(v0 + 128),
        v4 = *(double *)(v0 + 136),
        v5 = *(_QWORD *)(v0 + 256),
        v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8498),
        MEMORY[0x212B9E378](&v9, v6),
        LOBYTE(v9) == 1))
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A84A8);
    MEMORY[0x212B9E378](&v9, v7);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A84A8);
    MEMORY[0x212B9E378](&v9, v8);
    sub_20D150FF0(v5, v1, v2, v3, v4, v9);
  }
}

void *PhotoStyleDPad.init(value:isActive:pulsingValueIndicator:defaultValue:minValue:maxValue:backgroundImage:backgroundColor:gradientImageName:configuration:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, double a10@<D0>, double a11@<D1>, double a12@<D2>, double a13@<D3>, double a14@<D4>, double a15@<D5>, double a16@<D6>, double a17@<D7>, uint64_t a18, uint64_t a19, const void *a20)
{
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v44[128];
  _QWORD __src[40];

  OUTLINED_FUNCTION_18(v44, a20);
  type metadata accessor for CGPoint(0);
  OUTLINED_FUNCTION_17();
  v28 = __src[0];
  v29 = __src[1];
  v30 = __src[2];
  swift_retain();
  OUTLINED_FUNCTION_17();
  v31 = __src[0];
  v32 = __src[1];
  swift_retain();
  sub_20D191454();
  sub_20D144044();
  OUTLINED_FUNCTION_15();
  swift_release();
  swift_release();
  sub_20D191454();
  sub_20D191D0C();
  OUTLINED_FUNCTION_15();
  swift_release();
  swift_release();
  v33 = sub_20D19143C();
  swift_release();
  swift_release();
  __src[0] = a1;
  __src[1] = a2;
  *(double *)&__src[2] = a10;
  *(double *)&__src[3] = a11;
  __src[4] = a3;
  __src[5] = a4;
  LOBYTE(__src[6]) = a5;
  BYTE1(__src[6]) = a6;
  __src[7] = v28;
  __src[8] = v29;
  __src[9] = v30;
  LOBYTE(__src[10]) = v31;
  __src[11] = v32;
  *(double *)&__src[12] = a12;
  *(double *)&__src[13] = a13;
  *(double *)&__src[14] = a14;
  *(double *)&__src[15] = a15;
  *(double *)&__src[16] = a16;
  *(double *)&__src[17] = a17;
  __src[18] = a7;
  __src[19] = a8;
  __src[20] = a18;
  __src[21] = a19;
  OUTLINED_FUNCTION_18(&__src[22], v44);
  __src[38] = v33;
  sub_20D14409C((uint64_t)__src);
  swift_release();
  swift_release();
  sub_20D14413C((uint64_t)__src);
  return memcpy(a9, __src, 0x138uLL);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_20D14A9B0(a1, &qword_2549A8310);
}

void PhotoStyleDPad.body.getter(uint64_t a1@<X8>)
{
  const void *v1;
  const void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE v13[312];

  v2 = v1;
  v4 = sub_20D191820();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A81E8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v13[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  memcpy(v13, v2, sizeof(v13));
  sub_20D1400AC((uint64_t)v13, (uint64_t)v10);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDF0248], v4);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A81F0);
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v5 + 16))(a1 + *(int *)(v11 + 36), v7, v4);
  sub_20D14B85C((uint64_t)v10, a1, &qword_2549A81E8);
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  sub_20D14B87C((uint64_t)v10, &qword_2549A81E8);
}

void sub_20D1400AC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  char *v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  double v43;
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
  uint64_t OpaqueTypeConformance2;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double v67[2];
  _OWORD v68[20];

  v66 = a2;
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8260);
  MEMORY[0x24BDAC7A8](v61);
  v4 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8250);
  MEMORY[0x24BDAC7A8](v62);
  v6 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8240);
  v7 = MEMORY[0x24BDAC7A8](v65);
  v9 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v58 - v10;
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8488);
  MEMORY[0x24BDAC7A8](v63);
  v64 = (uint64_t)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8490);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v58 - v18;
  if ((*(_BYTE *)(a1 + 248) & 1) != 0)
  {
    memcpy(v68, (const void *)a1, 0x138uLL);
    v59 = v11;
    sub_20D1406F8((uint64_t)v17);
    v68[0] = *(_OWORD *)(a1 + 32);
    LOBYTE(v68[1]) = *(_BYTE *)(a1 + 48);
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8498);
    MEMORY[0x212B9E378](v67);
    if (LOBYTE(v67[0]))
      v29 = 0.995;
    else
      v29 = 1.0;
    v68[0] = *(_OWORD *)(a1 + 32);
    LOBYTE(v68[1]) = *(_BYTE *)(a1 + 48);
    MEMORY[0x212B9E378](v67, v28);
    if (LOBYTE(v67[0]))
      v30 = 0.995;
    else
      v30 = 1.0;
    sub_20D191D60();
    v32 = v31;
    v34 = v33;
    v35 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
    v60 = v13;
    v35(v4, v17, v13);
    v36 = &v4[*(int *)(v61 + 36)];
    *(double *)v36 = v29;
    *((double *)v36 + 1) = v30;
    *((_QWORD *)v36 + 2) = v32;
    *((_QWORD *)v36 + 3) = v34;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
    v68[0] = *(_OWORD *)(a1 + 56);
    *(_QWORD *)&v68[1] = *(_QWORD *)(a1 + 72);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A84A0);
    sub_20D191B8C();
    v37 = v67[0] * 0.0174532925;
    sub_20D191D60();
    v39 = v38;
    v41 = v40;
    sub_20D14B85C((uint64_t)v4, (uint64_t)v6, &qword_2549A8260);
    v42 = &v6[*(int *)(v62 + 36)];
    *(double *)v42 = v37;
    v62 = xmmword_20D1952D0;
    *(_OWORD *)(v42 + 8) = xmmword_20D1952D0;
    *((_QWORD *)v42 + 3) = 0;
    *((_QWORD *)v42 + 4) = v39;
    *((_QWORD *)v42 + 5) = v41;
    *((_OWORD *)v42 + 3) = xmmword_20D1952D0;
    sub_20D14B87C((uint64_t)v4, &qword_2549A8260);
    v68[0] = *(_OWORD *)(a1 + 56);
    *(_QWORD *)&v68[1] = *(_QWORD *)(a1 + 72);
    sub_20D191B8C();
    v43 = v67[1] * 0.0174532925;
    sub_20D191D60();
    v45 = v44;
    v47 = v46;
    sub_20D14B85C((uint64_t)v6, (uint64_t)v9, &qword_2549A8250);
    v48 = &v9[*(int *)(v65 + 36)];
    *(double *)v48 = v43;
    *((_QWORD *)v48 + 2) = 0;
    *((_QWORD *)v48 + 3) = 0;
    *((_QWORD *)v48 + 1) = 0xBFF0000000000000;
    *((_QWORD *)v48 + 4) = v45;
    *((_QWORD *)v48 + 5) = v47;
    *((_OWORD *)v48 + 3) = v62;
    sub_20D14B87C((uint64_t)v6, &qword_2549A8250);
    v49 = (uint64_t)v59;
    sub_20D14B8A4((uint64_t)v9, (uint64_t)v59, &qword_2549A8240);
    sub_20D14B85C(v49, v64, &qword_2549A8240);
    swift_storeEnumTagMultiPayload();
    v50 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8218);
    v51 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8220);
    type metadata accessor for CGPoint(255);
    v53 = v52;
    sub_20D14B9E8((uint64_t)&unk_2549A8228);
    v55 = v54;
    sub_20D145754((uint64_t)&unk_2549A8230);
    *(_QWORD *)&v68[0] = v51;
    *((_QWORD *)&v68[0] + 1) = v53;
    *(_QWORD *)&v68[1] = v55;
    *((_QWORD *)&v68[1] + 1) = v56;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    *(_QWORD *)&v68[0] = v50;
    *((_QWORD *)&v68[0] + 1) = MEMORY[0x24BEE1328];
    *(_QWORD *)&v68[1] = OpaqueTypeConformance2;
    *((_QWORD *)&v68[1] + 1) = MEMORY[0x24BEE1340];
    swift_getOpaqueTypeConformance2();
    sub_20D14B754((uint64_t)&unk_2549A8238);
    sub_20D1917C0();
    sub_20D14B87C(v49, &qword_2549A8240);
  }
  else
  {
    memcpy(v68, (const void *)a1, 0x138uLL);
    sub_20D1406F8((uint64_t)v19);
    (*(void (**)(uint64_t, char *, uint64_t))(v14 + 16))(v64, v19, v13);
    swift_storeEnumTagMultiPayload();
    v20 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8218);
    v21 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8220);
    type metadata accessor for CGPoint(255);
    v23 = v22;
    sub_20D14B9E8((uint64_t)&unk_2549A8228);
    v25 = v24;
    sub_20D145754((uint64_t)&unk_2549A8230);
    *(_QWORD *)&v68[0] = v21;
    *((_QWORD *)&v68[0] + 1) = v23;
    *(_QWORD *)&v68[1] = v25;
    *((_QWORD *)&v68[1] + 1) = v26;
    v27 = swift_getOpaqueTypeConformance2();
    *(_QWORD *)&v68[0] = v20;
    *((_QWORD *)&v68[0] + 1) = MEMORY[0x24BEE1328];
    *(_QWORD *)&v68[1] = v27;
    *((_QWORD *)&v68[1] + 1) = MEMORY[0x24BEE1340];
    swift_getOpaqueTypeConformance2();
    sub_20D14B754((uint64_t)&unk_2549A8238);
    sub_20D1917C0();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
  }
}

uint64_t sub_20D1406F8@<X0>(uint64_t a1@<X8>)
{
  const void *v1;
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
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[2];
  _OWORD v40[20];

  v35 = a1;
  v2 = sub_20D191550();
  v3 = *(_QWORD *)(v2 - 8);
  v30 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_20D19158C();
  v31 = *(_QWORD *)(v6 - 8);
  v32 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8218);
  v10 = *(_QWORD *)(v9 - 8);
  v33 = v9;
  v34 = v10;
  MEMORY[0x24BDAC7A8](v9);
  v28 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  memcpy(v40, v1, 0x138uLL);
  v12 = swift_allocObject();
  memcpy((void *)(v12 + 16), v1, 0x138uLL);
  v39[0] = sub_20D14A3C0;
  v39[1] = v12;
  sub_20D14409C((uint64_t)v40);
  sub_20D191538();
  sub_20D191574();
  v29 = *(void (**)(char *, uint64_t))(v3 + 8);
  v29(v5, v2);
  v36 = v40[0];
  v37 = v40[1];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A84A8);
  MEMORY[0x212B9E378](&v38, v13);
  v36 = v38;
  v14 = swift_allocObject();
  memcpy((void *)(v14 + 16), v40, 0x138uLL);
  sub_20D14409C((uint64_t)v40);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8220);
  type metadata accessor for CGPoint(0);
  v17 = v16;
  sub_20D14B9E8((uint64_t)&unk_2549A8228);
  v19 = v18;
  sub_20D145754((uint64_t)&unk_2549A8230);
  v21 = v20;
  sub_20D1919C4();
  swift_release();
  v22 = v32;
  v23 = *(void (**)(char *, uint64_t))(v31 + 8);
  v23(v8, v32);
  swift_release();
  sub_20D191544();
  sub_20D191574();
  v29(v5, v30);
  v36 = v40[2];
  LOBYTE(v37) = v40[3];
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8498);
  MEMORY[0x212B9E378](v39, v24);
  *(_QWORD *)&v36 = v15;
  *((_QWORD *)&v36 + 1) = v17;
  *(_QWORD *)&v37 = v19;
  *((_QWORD *)&v37 + 1) = v21;
  swift_getOpaqueTypeConformance2();
  v25 = v33;
  v26 = v28;
  sub_20D1919D0();
  v23(v8, v22);
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v26, v25);
}

void sub_20D140A40(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  __int128 v12;
  _OWORD v13[3];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A84B8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (uint64_t *)((char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v8 = sub_20D191CAC();
  v8[1] = v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A84C0);
  sub_20D140B54(a2, a1, (uint64_t)v8 + *(int *)(v10 + 44));
  sub_20D19146C();
  sub_20D19146C();
  sub_20D191CAC();
  sub_20D191424();
  sub_20D14B85C((uint64_t)v8, a3, &qword_2549A84B8);
  v11 = (_OWORD *)(a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549A84C8) + 36));
  v12 = v13[1];
  *v11 = v13[0];
  v11[1] = v12;
  v11[2] = v13[2];
  sub_20D14B87C((uint64_t)v8, &qword_2549A84B8);
}

void sub_20D140B54(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  double *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
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
  double v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t (*v60)(void);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int64x2_t *v65;
  char *v66;
  uint64_t v67;
  double v68;
  uint64_t v69;
  double v70;
  double v71;
  uint64_t v72;
  double *v73;
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
  int64x2_t *v86;
  double v87;
  uint64_t v88;
  double v89;
  double v90;
  uint64_t v91;
  double *v92;
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
  uint64_t v106;
  CGFloat v107;
  CGFloat v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void (*v117)(char *, char *, uint64_t);
  uint64_t v118;
  int *v119;
  void (*v120)(char *, uint64_t);
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
  char *v154;
  uint64_t v155;
  uint64_t v156;
  char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  double v166[35];
  _BYTE v167[312];
  id v168;
  __int128 v169;
  uint64_t v170;
  __int128 v171;
  char v172;

  v158 = a3;
  v153 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A84D0);
  v151 = *(_QWORD *)(v153 - 8);
  MEMORY[0x24BDAC7A8](v153);
  v152 = (uint64_t)&v121 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A84D8);
  v7 = *(_QWORD *)(v6 - 8);
  v155 = v6;
  v156 = v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v157 = (char *)&v121 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v154 = (char *)&v121 - v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A84E0);
  MEMORY[0x24BDAC7A8](v11);
  v150 = (uint64_t)&v121 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v149 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A84E8);
  v13 = MEMORY[0x24BDAC7A8](v149);
  v160 = (uint64_t)&v121 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v164 = (uint64_t)&v121 - v15;
  v148 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A84F0);
  v16 = MEMORY[0x24BDAC7A8](v148);
  v165 = (uint64_t)&v121 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v163 = (uint64_t)&v121 - v18;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A84F8);
  MEMORY[0x24BDAC7A8](v19);
  v159 = (uint64_t)&v121 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8500);
  MEMORY[0x24BDAC7A8](v130);
  v134 = (uint64_t)&v121 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8508);
  MEMORY[0x24BDAC7A8](v129);
  v133 = (uint64_t)&v121 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8510);
  MEMORY[0x24BDAC7A8](v128);
  v135 = (uint64_t)&v121 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8518);
  MEMORY[0x24BDAC7A8](v131);
  v137 = (uint64_t)&v121 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8520);
  MEMORY[0x24BDAC7A8](v136);
  v142 = (uint64_t)&v121 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8528);
  MEMORY[0x24BDAC7A8](v139);
  v143 = (uint64_t)&v121 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v138 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8530);
  MEMORY[0x24BDAC7A8](v138);
  v144 = (uint64_t)&v121 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8538);
  v28 = MEMORY[0x24BDAC7A8](v140);
  v146 = (uint64_t)&v121 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = MEMORY[0x24BDAC7A8](v28);
  v141 = (uint64_t)&v121 - v31;
  MEMORY[0x24BDAC7A8](v30);
  v145 = (uint64_t)&v121 - v32;
  v33 = sub_20D1915D4();
  MEMORY[0x24BDAC7A8](v33);
  v35 = (double *)((char *)&v121 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0));
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8540);
  MEMORY[0x24BDAC7A8](v36);
  v38 = (char *)&v121 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8548);
  MEMORY[0x24BDAC7A8](v121);
  v40 = (char *)&v121 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8550);
  MEMORY[0x24BDAC7A8](v122);
  v42 = (char *)&v121 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8558);
  MEMORY[0x24BDAC7A8](v123);
  v126 = (uint64_t)&v121 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8560);
  v44 = MEMORY[0x24BDAC7A8](v125);
  v132 = (uint64_t)&v121 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = MEMORY[0x24BDAC7A8](v44);
  v124 = (uint64_t)&v121 - v47;
  MEMORY[0x24BDAC7A8](v46);
  v127 = (uint64_t)&v121 - v48;
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8568);
  v50 = MEMORY[0x24BDAC7A8](v49);
  v161 = (uint64_t)&v121 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v50);
  v162 = (uint64_t)&v121 - v52;
  v53 = a1;
  if ((*(_BYTE *)(a1 + 248) & 1) != 0)
  {
    v55 = *(double *)(a1 + 200) + 3.0;
    v56 = (char *)v35 + *(int *)(v33 + 20);
    v147 = a2;
    v57 = *MEMORY[0x24BDEEB68];
    v58 = sub_20D191748();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 104))(v56, v57, v58);
    *v35 = v55;
    v35[1] = v55;
    sub_20D191A90();
    v59 = sub_20D191AB4();
    swift_release();
    v60 = MEMORY[0x24BDED998];
    sub_20D14A880((uint64_t)v35, (uint64_t)v38, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
    *(_QWORD *)&v38[*(int *)(v36 + 52)] = v59;
    *(_WORD *)&v38[*(int *)(v36 + 56)] = 256;
    sub_20D14A8AC((uint64_t)v35, (uint64_t (*)(_QWORD))v60);
    sub_20D191D60();
    v62 = v61;
    v64 = v63;
    sub_20D14B85C((uint64_t)v38, (uint64_t)v40, &qword_2549A8540);
    v65 = (int64x2_t *)&v40[*(int *)(v121 + 36)];
    *v65 = vdupq_n_s64(0x3FF07AE147AE147BuLL);
    v65[1].i64[0] = v62;
    v65[1].i64[1] = v64;
    sub_20D14B87C((uint64_t)v38, &qword_2549A8540);
    sub_20D14B85C((uint64_t)v40, (uint64_t)v42, &qword_2549A8548);
    v66 = &v42[*(int *)(v122 + 36)];
    *(_QWORD *)v66 = 0x4020000000000000;
    v66[8] = 0;
    sub_20D14B87C((uint64_t)v40, &qword_2549A8548);
    v171 = *(_OWORD *)(v53 + 32);
    v172 = *(_BYTE *)(v53 + 48);
    *(_OWORD *)v167 = *(_OWORD *)(v53 + 32);
    v167[16] = *(_BYTE *)(v53 + 48);
    v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8498);
    MEMORY[0x212B9E378](v166);
    if (LOBYTE(v166[0]))
      v68 = 0.9;
    else
      v68 = 0.5;
    v69 = v126;
    sub_20D14B85C((uint64_t)v42, v126, &qword_2549A8550);
    *(double *)(v69 + *(int *)(v123 + 36)) = v68;
    sub_20D14B87C((uint64_t)v42, &qword_2549A8550);
    v169 = *(_OWORD *)(v53 + 56);
    v170 = *(_QWORD *)(v53 + 72);
    *(_OWORD *)v167 = *(_OWORD *)(v53 + 56);
    *(_QWORD *)&v167[16] = *(_QWORD *)(v53 + 72);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A84A0);
    sub_20D191B8C();
    v70 = v166[0] * -7.0;
    *(_OWORD *)v167 = v169;
    *(_QWORD *)&v167[16] = v170;
    sub_20D191B8C();
    v71 = v166[1] * -7.0;
    v72 = v124;
    sub_20D14B85C(v69, v124, &qword_2549A8558);
    v73 = (double *)(v72 + *(int *)(v125 + 36));
    *v73 = v70;
    v73[1] = v71;
    sub_20D14B87C(v69, &qword_2549A8558);
    v74 = v72;
    v75 = v127;
    sub_20D14B8A4(v74, v127, &qword_2549A8560);
    memcpy(v167, (const void *)v53, sizeof(v167));
    sub_20D19146C();
    v76 = v159;
    sub_20D141B50(v159);
    v77 = v134;
    sub_20D14B85C(v76, v134, &qword_2549A84F8);
    *(_QWORD *)(v77 + *(int *)(v130 + 36)) = 0x4010000000000000;
    sub_20D14B87C(v76, &qword_2549A84F8);
    v78 = v133;
    sub_20D14B85C(v77, v133, &qword_2549A8500);
    *(_QWORD *)(v78 + *(int *)(v129 + 36)) = 0x3FB999999999999ALL;
    sub_20D14B87C(v77, &qword_2549A8500);
    v79 = v135;
    sub_20D14B85C(v78, v135, &qword_2549A8508);
    v80 = v79 + *(int *)(v128 + 36);
    *(_QWORD *)v80 = 0x4049000000000000;
    *(_BYTE *)(v80 + 8) = 0;
    sub_20D14B87C(v78, &qword_2549A8508);
    sub_20D191D60();
    v82 = v81;
    v84 = v83;
    v85 = v137;
    sub_20D14B85C(v79, v137, &qword_2549A8510);
    v86 = (int64x2_t *)(v85 + *(int *)(v131 + 36));
    *v86 = vdupq_n_s64(0x3FEB333333333333uLL);
    v86[1].i64[0] = v82;
    v86[1].i64[1] = v84;
    sub_20D14B87C(v79, &qword_2549A8510);
    *(_OWORD *)v167 = v171;
    v167[16] = v172;
    MEMORY[0x212B9E378](v166, v67);
    if (LOBYTE(v166[0]))
      v87 = 0.4;
    else
      v87 = 0.1;
    v88 = v142;
    sub_20D14B85C(v85, v142, &qword_2549A8518);
    *(double *)(v88 + *(int *)(v136 + 36)) = v87;
    sub_20D14B87C(v85, &qword_2549A8518);
    *(_OWORD *)v167 = v169;
    *(_QWORD *)&v167[16] = v170;
    sub_20D191B8C();
    v89 = v166[0] * 7.0;
    *(_OWORD *)v167 = v169;
    *(_QWORD *)&v167[16] = v170;
    sub_20D191B8C();
    v90 = v166[1] * 7.0;
    v91 = v143;
    sub_20D14B85C(v88, v143, &qword_2549A8520);
    v92 = (double *)(v91 + *(int *)(v139 + 36));
    *v92 = v89;
    v92[1] = v90;
    sub_20D14B87C(v88, &qword_2549A8520);
    v93 = *(_QWORD *)(v53 + 304);
    v94 = v144;
    sub_20D14B85C(v91, v144, &qword_2549A8528);
    *(_QWORD *)(v94 + *(int *)(v138 + 36)) = v93;
    swift_retain();
    sub_20D14B87C(v91, &qword_2549A8528);
    sub_20D14B8A4(v53 + 144, (uint64_t)&v168, &qword_2549A85C8);
    v95 = v141;
    sub_20D14B85C(v94, v141, &qword_2549A8530);
    sub_20D14B8A4((uint64_t)&v168, v95 + *(int *)(v140 + 52), &qword_2549A85C8);
    sub_20D14A4EC(&v168);
    a2 = v147;
    sub_20D14B87C(v94, &qword_2549A8530);
    v96 = v145;
    sub_20D14B8A4(v95, v145, &qword_2549A8538);
    v97 = v132;
    sub_20D14B85C(v75, v132, &qword_2549A8560);
    v98 = v146;
    sub_20D14B85C(v96, v146, &qword_2549A8538);
    v99 = v161;
    sub_20D14B85C(v97, v161, &qword_2549A8560);
    v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A85D0);
    sub_20D14B85C(v98, v99 + *(int *)(v100 + 48), &qword_2549A8538);
    sub_20D14B87C(v96, &qword_2549A8538);
    sub_20D14B87C(v75, &qword_2549A8560);
    sub_20D14B87C(v98, &qword_2549A8538);
    sub_20D14B87C(v97, &qword_2549A8560);
    v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8570);
    __swift_storeEnumTagSinglePayload(v99, 0, 1, v101);
    sub_20D14B8A4(v99, v162, &qword_2549A8568);
  }
  else
  {
    v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8570);
    __swift_storeEnumTagSinglePayload(v162, 1, 1, v54);
  }
  v102 = v159;
  memcpy(v167, (const void *)v53, sizeof(v167));
  sub_20D19146C();
  sub_20D141B50(v102);
  v103 = v165;
  sub_20D14B85C(v102, v165, &qword_2549A84F8);
  *(_QWORD *)(v103 + *(int *)(v148 + 36)) = 0x3FF0000000000000;
  sub_20D14B87C(v102, &qword_2549A84F8);
  sub_20D14B8A4(v103, v163, &qword_2549A84F0);
  v104 = v150;
  sub_20D141FA8(v53, a2, v150);
  v105 = v160;
  sub_20D14B85C(v104, v160, &qword_2549A84E0);
  *(_QWORD *)(v105 + *(int *)(v149 + 36)) = 0x4000000000000000;
  sub_20D14B87C(v104, &qword_2549A84E0);
  sub_20D14B8A4(v105, v164, &qword_2549A84E8);
  sub_20D1426B0(v53, (uint64_t)v166);
  LOBYTE(v166[34]) = 0;
  memcpy(v167, (const void *)v53, sizeof(v167));
  sub_20D19146C();
  v106 = v152;
  sub_20D14308C(v152, v107, v108);
  sub_20D1913DC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8578);
  sub_20D14A3D4();
  sub_20D14B9E8((uint64_t)&unk_2549A85B8);
  v109 = v157;
  v110 = v153;
  sub_20D191A0C();
  (*(void (**)(uint64_t, uint64_t))(v151 + 8))(v106, v110);
  memcpy(v167, v166, 0x111uLL);
  sub_20D14A478((uint64_t)v167);
  v111 = v155;
  v112 = v156;
  v113 = v154;
  (*(void (**)(char *, char *, uint64_t))(v156 + 32))(v154, v109, v155);
  v114 = v161;
  sub_20D14B85C(v162, v161, &qword_2549A8568);
  v115 = v165;
  sub_20D14B85C(v163, v165, &qword_2549A84F0);
  v116 = v160;
  sub_20D14B85C(v164, v160, &qword_2549A84E8);
  v117 = *(void (**)(char *, char *, uint64_t))(v112 + 16);
  v117(v109, v113, v111);
  v118 = v158;
  sub_20D14B85C(v114, v158, &qword_2549A8568);
  v119 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2549A85C0);
  sub_20D14B85C(v115, v118 + v119[12], &qword_2549A84F0);
  sub_20D14B85C(v116, v118 + v119[16], &qword_2549A84E8);
  v117((char *)(v118 + v119[20]), v109, v111);
  v120 = *(void (**)(char *, uint64_t))(v112 + 8);
  v120(v113, v111);
  sub_20D14B87C(v164, &qword_2549A84E8);
  sub_20D14B87C(v163, &qword_2549A84F0);
  sub_20D14B87C(v162, &qword_2549A8568);
  v120(v109, v111);
  sub_20D14B87C(v116, &qword_2549A84E8);
  sub_20D14B87C(v165, &qword_2549A84F0);
  sub_20D14B87C(v161, &qword_2549A8568);
}

void sub_20D141B50(uint64_t a1@<X8>)
{
  const void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(void);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(void);
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[40];

  v31 = a1;
  v2 = sub_20D1915D4();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (uint64_t *)((char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v30 = sub_20D1915C8();
  MEMORY[0x24BDAC7A8](v30);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8690);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (uint64_t *)((char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8698);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A86A0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  memcpy(v35, v1, 0x138uLL);
  *v9 = sub_20D191CAC();
  v9[1] = v16;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A86A8);
  sub_20D1434F0((uint64_t)v35, (uint64_t)v9 + *(int *)(v17 + 44));
  sub_20D191CAC();
  sub_20D191424();
  sub_20D14B85C((uint64_t)v9, (uint64_t)v12, &qword_2549A8690);
  v18 = &v12[*(int *)(v10 + 36)];
  v19 = v33;
  *(_OWORD *)v18 = v32;
  *((_OWORD *)v18 + 1) = v19;
  *((_OWORD *)v18 + 2) = v34;
  sub_20D14B87C((uint64_t)v9, &qword_2549A8690);
  sub_20D14B85C((uint64_t)v12, (uint64_t)v15, &qword_2549A8698);
  sub_20D14B87C((uint64_t)v12, &qword_2549A8698);
  v20 = v35[25];
  v21 = v35[35];
  v22 = (char *)v4 + *(int *)(v2 + 20);
  v23 = *MEMORY[0x24BDEEB68];
  v24 = sub_20D191748();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 104))(v22, v23, v24);
  *v4 = v20;
  v4[1] = v20;
  v25 = MEMORY[0x24BDED998];
  sub_20D14A880((uint64_t)v4, (uint64_t)v6, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_QWORD *)&v6[*(int *)(v30 + 20)] = v21;
  sub_20D14A8AC((uint64_t)v4, (uint64_t (*)(_QWORD))v25);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A84F8);
  v27 = v31;
  v28 = v31 + *(int *)(v26 + 36);
  v29 = MEMORY[0x24BDED970];
  sub_20D14A880((uint64_t)v6, v28, (uint64_t (*)(_QWORD))MEMORY[0x24BDED970]);
  *(_WORD *)(v28 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549A86B0) + 36)) = 256;
  sub_20D14B85C((uint64_t)v15, v27, &qword_2549A86A0);
  sub_20D14A8AC((uint64_t)v6, (uint64_t (*)(_QWORD))v29);
  sub_20D14B87C((uint64_t)v15, &qword_2549A86A0);
}

uint64_t sub_20D141E6C(uint64_t TupleTypeMetadata, uint64_t a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  int *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v4 = (uint64_t *)TupleTypeMetadata;
  v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    v6 = *v5;
  }
  else
  {
    MEMORY[0x24BDAC7A8](TupleTypeMetadata);
    v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a2)
    {
      v9 = v5;
      v10 = v8;
      v11 = a2;
      do
      {
        v12 = *v9++;
        *v10++ = v12;
        --v11;
      }
      while (v11);
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    v6 = TupleTypeMetadata;
  }
  MEMORY[0x24BDAC7A8](TupleTypeMetadata);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v15 = (int *)(v6 + 32);
    v16 = a2;
    do
    {
      if (a2 == 1)
        v17 = 0;
      else
        v17 = *v15;
      v19 = *v5++;
      v18 = v19;
      v20 = *v4++;
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(&v14[v17], v20);
      v15 += 4;
      --v16;
    }
    while (v16);
  }
  return sub_20D191D3C();
}

void sub_20D141FA8(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  char v50;
  _BYTE *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  char v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _BYTE *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char v97;
  _OWORD v98[20];

  v92 = a2;
  v96 = a3;
  v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8640);
  MEMORY[0x24BDAC7A8](v94);
  v93 = (char *)&v80 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_20D1916F4();
  v90 = *(_QWORD *)(v5 - 8);
  v91 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v89 = (char *)&v80 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8648);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v80 - v12;
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8650);
  MEMORY[0x24BDAC7A8](v95);
  v15 = (char *)&v80 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8658);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v80 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8660);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (uint64_t *)((char *)&v80 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  v23 = *(__int16 *)(a1 + 272);
  if (v23 < 0)
  {
    v84 = *(_QWORD *)(a1 + 256);
    v85 = v18;
    v81 = v11;
    v82 = v13;
    v83 = v8;
    v86 = v7;
    v87 = v15;
    v88 = v20;
    v33 = *(double *)(a1 + 184);
    v34 = *(double *)(a1 + 192);
    v35 = *(double *)(a1 + 216);
    v36 = *(_QWORD *)(a1 + 264);
    if ((v23 & 0x100) != 0)
    {
      v98[0] = *(_OWORD *)(a1 + 32);
      LOBYTE(v98[1]) = *(_BYTE *)(a1 + 48);
      sub_20D14409C(a1);
      v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8498);
      MEMORY[0x212B9E378](&v97, v55);
      v56 = v97;
      memcpy(v98, (const void *)a1, 0x138uLL);
      sub_20D13FC34();
      sub_20D151020(*(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128) - *(double *)(a1 + 112), *(double *)(a1 + 136) - *(double *)(a1 + 120));
      v57 = v84;
      sub_20D151C78(0.0, 0.0, (double)v84, (double)v84);
      v59 = v58;
      v61 = v60;
      sub_20D14413C(a1);
      sub_20D19146C();
      v62 = (v33 - v34) / v33;
      v64 = v62 * v63 - v35;
      v66 = v62 * v65 - v35;
      if (v64 >= 0.0)
        v67 = v64;
      else
        v67 = 0.0;
      if (v66 >= 0.0)
        v68 = v66;
      else
        v68 = 0.0;
      v69 = sub_20D1918A4();
      LOBYTE(v98[0]) = v56;
      *((_QWORD *)&v98[0] + 1) = v59;
      *(double *)&v98[1] = (double)v57 - v61;
      *((_QWORD *)&v98[1] + 1) = v57;
      *(_QWORD *)&v98[2] = v36;
      *((_QWORD *)&v98[2] + 1) = 0x3FD47AE147AE147BLL;
      LOBYTE(v98[3]) = 1;
      BYTE8(v98[3]) = v69;
      *(double *)&v98[4] = v68;
      *((double *)&v98[4] + 1) = v67;
      *(double *)&v98[5] = v68;
      *((double *)&v98[5] + 1) = v67;
      LOBYTE(v98[6]) = 0;
      v71 = v89;
      v70 = v90;
      v72 = v91;
      (*(void (**)(char *, _QWORD, uint64_t))(v90 + 104))(v89, *MEMORY[0x24BDEE8B0], v91);
      v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8668);
      sub_20D14B754((uint64_t)&unk_2549A8670);
      v75 = v74;
      v76 = v81;
      sub_20D1919A0();
      (*(void (**)(char *, uint64_t))(v70 + 8))(v71, v72);
      v78 = v82;
      v77 = v83;
      v79 = v86;
      (*(void (**)(char *, char *, uint64_t))(v83 + 32))(v82, v76, v86);
      (*(void (**)(_BYTE *, char *, uint64_t))(v77 + 16))(v93, v78, v79);
      swift_storeEnumTagMultiPayload();
      *(_QWORD *)&v98[0] = v73;
      *((_QWORD *)&v98[0] + 1) = v75;
      swift_getOpaqueTypeConformance2();
      v54 = (uint64_t)v87;
      sub_20D1917C0();
      (*(void (**)(char *, uint64_t))(v77 + 8))(v78, v79);
    }
    else
    {
      v37 = *(_BYTE *)(a1 + 176) & 1;
      memcpy(v98, (const void *)a1, 0x138uLL);
      sub_20D14409C(a1);
      sub_20D13FC34();
      sub_20D151020(*(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128) - *(double *)(a1 + 112), *(double *)(a1 + 136) - *(double *)(a1 + 120));
      v38 = v84;
      sub_20D151C78(0.0, 0.0, (double)v84, (double)v84);
      v40 = v39;
      v42 = v41;
      sub_20D14413C(a1);
      sub_20D19146C();
      v43 = (v33 - v34) / v33;
      v45 = v43 * v44 - v35;
      v47 = v43 * v46 - v35;
      if (v45 >= 0.0)
        v48 = v45;
      else
        v48 = 0.0;
      if (v47 >= 0.0)
        v49 = v47;
      else
        v49 = 0.0;
      v50 = sub_20D1918A4();
      v51 = v93;
      *v93 = 0;
      *((_QWORD *)v51 + 1) = v40;
      *((double *)v51 + 2) = (double)v38 - v42;
      *((_QWORD *)v51 + 3) = v38;
      *((_QWORD *)v51 + 4) = v36;
      *((_QWORD *)v51 + 5) = 0x3FD47AE147AE147BLL;
      v51[48] = v37;
      v51[56] = v50;
      *((double *)v51 + 8) = v49;
      *((double *)v51 + 9) = v48;
      *((double *)v51 + 10) = v49;
      *((double *)v51 + 11) = v48;
      v51[96] = 0;
      swift_storeEnumTagMultiPayload();
      v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8668);
      sub_20D14B754((uint64_t)&unk_2549A8670);
      *(_QWORD *)&v98[0] = v52;
      *((_QWORD *)&v98[0] + 1) = v53;
      swift_getOpaqueTypeConformance2();
      v54 = (uint64_t)v87;
      sub_20D1917C0();
    }
    sub_20D14B85C(v54, (uint64_t)v85, &qword_2549A8650);
    swift_storeEnumTagMultiPayload();
    sub_20D14B9E8((uint64_t)&unk_2549A8680);
    sub_20D14A7C8();
    sub_20D1917C0();
    v31 = v54;
    v32 = &qword_2549A8650;
  }
  else
  {
    v24 = *(_QWORD *)(a1 + 200);
    v25 = (_QWORD *)((char *)v22 + *(int *)(v20 + 36));
    v26 = v20;
    v27 = *(_QWORD *)(a1 + 256);
    v28 = (char *)v25 + *(int *)(sub_20D1915D4() + 20);
    v29 = *MEMORY[0x24BDEEB68];
    v30 = sub_20D191748();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 104))(v28, v29, v30);
    *v25 = v24;
    v25[1] = v24;
    *v22 = v27;
    *(_QWORD *)((char *)v22 + *(int *)(v26 + 40)) = 0;
    sub_20D14B85C((uint64_t)v22, (uint64_t)v18, &qword_2549A8660);
    swift_storeEnumTagMultiPayload();
    sub_20D14B9E8((uint64_t)&unk_2549A8680);
    sub_20D14A7C8();
    sub_20D1917C0();
    v31 = (uint64_t)v22;
    v32 = &qword_2549A8660;
  }
  sub_20D14B87C(v31, v32);
}

void sub_20D1426B0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v32;
  double v33;
  double v34;
  double v35;
  double MinX;
  double MaxX;
  double MinY;
  double MaxY;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  double v63;
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
  double v74;
  double v75;
  uint64_t v76;
  uint64_t v77;
  unsigned __int8 v78;
  char v79;
  double v80;
  double v81;
  double v82;
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
  char v93;
  double v94;
  double v95;
  double v96;
  uint64_t v97;
  uint64_t v98;
  int v99;
  int v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  uint64_t v114;
  double v115;
  uint64_t v116;
  double v117;
  uint64_t v118;
  double v119;
  double v120;
  double v121;
  uint64_t v122;
  double v123;
  double v124;
  double v125;
  unsigned __int8 v126;
  _QWORD v127[22];
  char v128;
  _OWORD v129[20];
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;

  v114 = a2;
  v3 = sub_20D191A60();
  MEMORY[0x24BDAC7A8](v3);
  v5 = *(double *)(a1 + 184);
  v6 = *(double *)(a1 + 192);
  v7 = *(double *)(a1 + 216);
  v8 = *(_QWORD *)(a1 + 232);
  v117 = *(double *)(a1 + 208);
  v118 = v8;
  v9 = *(_QWORD *)(a1 + 256);
  v10 = *(unsigned __int16 *)(a1 + 272);
  (*(void (**)(char *, _QWORD))(v11 + 104))((char *)&v97 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x24BDF3C28]);
  v116 = sub_20D191AD8();
  v12 = *(_QWORD *)(a1 + 104);
  v14 = *(double *)(a1 + 112);
  v13 = *(double *)(a1 + 120);
  v15 = *(double *)(a1 + 128);
  v16 = *(double *)(a1 + 136);
  v123 = *(double *)(a1 + 96);
  v124 = v15;
  v122 = v12;
  if ((~v10 & 0x8001) == 0)
    sub_20D150FF0(v9, v14, v13, v124, v16, v123);
  sub_20D19146C();
  v18 = v17;
  v20 = v19;
  v21 = (v5 - v6) / v5;
  v22 = v21 * v17 - v7;
  v120 = v21;
  v125 = v7;
  v23 = v21 * v20 - v7;
  v24 = 0.0;
  if (v22 >= 0.0)
    v25 = v22;
  else
    v25 = 0.0;
  if (v23 >= 0.0)
    v24 = v23;
  v26 = 0;
  v27 = 0;
  v130 = CGRectInset(*(CGRect *)(&v18 - 2), v25, v24);
  x = v130.origin.x;
  v130.origin.x = v14;
  y = v130.origin.y;
  width = v130.size.width;
  height = v130.size.height;
  v130.size.width = v124 - v130.origin.x;
  v32 = v16 - v13;
  v124 = v130.origin.x;
  v121 = v130.size.width;
  sub_20D151020(v130.origin.x, v13, v130.size.width, v32);
  v115 = v33;
  v35 = v34;
  v131.origin.x = x;
  v131.origin.y = y;
  v131.size.width = width;
  v131.size.height = height;
  MinX = CGRectGetMinX(v131);
  v132.origin.x = x;
  v132.origin.y = y;
  v132.size.width = width;
  v132.size.height = height;
  MaxX = CGRectGetMaxX(v132);
  if (MinX > MaxX)
  {
    __break(1u);
    goto LABEL_25;
  }
  v119 = v32;
  v113 = MaxX;
  v133.origin.x = x;
  v133.origin.y = y;
  v133.size.width = width;
  v133.size.height = height;
  MinY = CGRectGetMinY(v133);
  v134.origin.x = x;
  v134.origin.y = y;
  v134.size.width = width;
  v134.size.height = height;
  MaxY = CGRectGetMaxY(v134);
  v112 = MinY;
  if (MinY > MaxY)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v109 = MaxY;
  v110 = MinX;
  v111 = v35;
  sub_20D191454();
  sub_20D191CE8();
  sub_20D191CDC();
  swift_release();
  sub_20D191460();
  swift_release();
  swift_release();
  sub_20D191454();
  sub_20D191CF4();
  sub_20D191460();
  swift_release();
  swift_release();
  *(double *)&v40 = COERCE_DOUBLE(sub_20D19143C());
  swift_release();
  swift_release();
  *(_QWORD *)&v129[0] = 0;
  *((_QWORD *)&v129[0] + 1) = 0xE000000000000000;
  *(double *)v127 = v123;
  v127[1] = v122;
  type metadata accessor for CGPoint(0);
  sub_20D191EEC();
  v41 = v129[0];
  memcpy(v129, (const void *)a1, 0x138uLL);
  v100 = sub_20D142DCC();
  v129[0] = *(_OWORD *)(a1 + 32);
  LOBYTE(v129[1]) = *(_BYTE *)(a1 + 48);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8498);
  MEMORY[0x212B9E378](v127, v42);
  v99 = LOBYTE(v127[0]);
  v123 = COERCE_DOUBLE(sub_20D191AA8());
  v43 = sub_20D191CAC();
  v45 = v44;
  v122 = sub_20D191CAC();
  v108 = v46;
  sub_20D142EA4(a1, (uint64_t *)v129);
  v101 = *(_QWORD *)&v129[0];
  v106 = *(_QWORD *)&v129[1];
  v107 = *((_QWORD *)&v129[0] + 1);
  v104 = *((_QWORD *)&v129[2] + 1);
  v47 = *(_QWORD *)&v129[2];
  v105 = *((_QWORD *)&v129[1] + 1);
  v102 = *((_QWORD *)&v129[3] + 1);
  v103 = *(_QWORD *)&v129[3];
  memcpy(v129, (const void *)a1, 0x138uLL);
  sub_20D13FC34();
  sub_20D19146C();
  v49 = v48;
  v51 = v50;
  v52 = v120 * v48 - v125;
  v53 = v120 * v50 - v125;
  if (v52 >= 0.0)
    v54 = v52;
  else
    v54 = 0.0;
  if (v53 >= 0.0)
    v55 = v53;
  else
    v55 = 0.0;
  v56 = *(_BYTE *)(a1 + 49);
  v126 = 0;
  v57 = 0;
  v58 = 0;
  v135 = CGRectInset(*(CGRect *)(&v49 - 2), v54, v55);
  v59 = v135.origin.x;
  v60 = v135.origin.y;
  v61 = v135.size.width;
  v62 = v135.size.height;
  sub_20D151020(v124, v13, v121, v119);
  v64 = v63;
  v66 = v65;
  v136.origin.x = v59;
  v136.origin.y = v60;
  v136.size.width = v61;
  v136.size.height = v62;
  v67 = CGRectGetMinX(v136);
  v137.origin.x = v59;
  v137.origin.y = v60;
  v137.size.width = v61;
  v137.size.height = v62;
  v68 = CGRectGetMaxX(v137);
  if (v67 > v68)
    goto LABEL_26;
  v69 = v68;
  v124 = v66;
  v138.origin.x = v59;
  v138.origin.y = v60;
  v138.size.width = v61;
  v138.size.height = v62;
  v70 = CGRectGetMinY(v138);
  v139.origin.x = v59;
  v139.origin.y = v60;
  v139.size.width = v61;
  v139.size.height = v62;
  v71 = CGRectGetMaxY(v139);
  if (v70 > v71)
  {
LABEL_27:
    __break(1u);
    return;
  }
  v72 = v67 + v64 * (v69 - v67);
  v73 = 1.0;
  v120 = v110 + v115 * (v113 - v110);
  v121 = v112 + (1.0 - v111) * (v109 - v112);
  if (v99)
    v74 = v117;
  else
    v74 = v125;
  v115 = v74;
  if ((v100 & 1) == 0)
    v73 = 0.0;
  v125 = v73;
  v75 = v70 + (1.0 - v124) * (v71 - v70);
  v76 = v47;
  v97 = v45;
  v98 = v47;
  v117 = *(double *)&v40;
  v124 = *((double *)&v41 + 1);
  v77 = v45;
  v119 = *(double *)&v41;
  v78 = v126;
  LODWORD(v113) = v126;
  memcpy(v129, (const void *)a1, 0x138uLL);
  v79 = v56;
  sub_20D142FC4();
  v111 = v81;
  v112 = v80;
  LOBYTE(v127[0]) = v56;
  *(double *)&v127[1] = v74;
  v83 = v122;
  v82 = v123;
  *(double *)&v127[2] = v123;
  v127[3] = 0x3FD6666666666666;
  LOBYTE(v127[4]) = v78;
  v84 = v114;
  v85 = v108;
  v127[5] = v122;
  v127[6] = v108;
  v86 = v101;
  v127[7] = v101;
  v88 = v106;
  v87 = v107;
  v127[8] = v107;
  v127[9] = v106;
  v89 = v104;
  v90 = v105;
  v127[10] = v105;
  v127[11] = v76;
  v92 = v102;
  v91 = v103;
  v127[12] = v104;
  v127[13] = v103;
  v127[14] = v102;
  v127[15] = v43;
  v127[16] = v77;
  *(double *)&v127[17] = v72;
  *(double *)&v127[18] = v75;
  *(double *)&v127[19] = v80;
  *(double *)&v127[20] = v81;
  v128 = 1;
  v127[21] = 0x4010000000000000;
  memcpy((void *)(v114 + 96), v127, 0xB0uLL);
  v93 = v128;
  *(_BYTE *)v84 = 0;
  *(_QWORD *)(v84 + 8) = v118;
  v94 = v117;
  *(_QWORD *)(v84 + 16) = v116;
  *(_QWORD *)(v84 + 24) = 0;
  *(_BYTE *)(v84 + 32) = v93;
  v95 = v121;
  *(double *)(v84 + 40) = v120;
  *(double *)(v84 + 48) = v95;
  v96 = v119;
  *(double *)(v84 + 56) = v94;
  *(double *)(v84 + 64) = v96;
  *(double *)(v84 + 72) = v124;
  *(double *)(v84 + 80) = v125;
  *(_QWORD *)(v84 + 88) = 0x4008000000000000;
  LOBYTE(v129[0]) = v79;
  *((double *)v129 + 1) = v115;
  *(double *)&v129[1] = v82;
  *((_QWORD *)&v129[1] + 1) = 0x3FD6666666666666;
  LOBYTE(v129[2]) = LOBYTE(v113);
  *((_QWORD *)&v129[2] + 1) = v83;
  *(_QWORD *)&v129[3] = v85;
  *((_QWORD *)&v129[3] + 1) = v86;
  *(_QWORD *)&v129[4] = v87;
  *((_QWORD *)&v129[4] + 1) = v88;
  *(_QWORD *)&v129[5] = v90;
  *((_QWORD *)&v129[5] + 1) = v98;
  *(_QWORD *)&v129[6] = v89;
  *((_QWORD *)&v129[6] + 1) = v91;
  *(_QWORD *)&v129[7] = v92;
  *((_QWORD *)&v129[7] + 1) = v43;
  *(_QWORD *)&v129[8] = v97;
  *((double *)&v129[8] + 1) = v72;
  *(double *)&v129[9] = v75;
  *((double *)&v129[9] + 1) = v112;
  *(double *)&v129[10] = v111;
  *((_QWORD *)&v129[10] + 1) = 0x4010000000000000;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_20D14A6FC((uint64_t)v127);
  sub_20D14A744((uint64_t)v129);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

uint64_t sub_20D142DCC()
{
  uint64_t v0;
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  double v11;

  if (*(_BYTE *)(v0 + 176) != 1)
    return 0;
  if ((~*(unsigned __int16 *)(v0 + 272) & 0x8001) != 0)
    return 1;
  v1 = *(double *)(v0 + 96);
  v2 = *(double *)(v0 + 112);
  v3 = *(double *)(v0 + 120);
  v4 = *(double *)(v0 + 128);
  v5 = *(double *)(v0 + 136);
  v6 = *(_QWORD *)(v0 + 256);
  v7 = sub_20D150FF0(v6, v2, v3, v4, v5, (v2 + v4) * 0.5);
  v9 = v8;
  v10 = sub_20D150FF0(v6, v2, v3, v4, v5, v1) != v7;
  return v11 != v9 || v10;
}

uint64_t sub_20D142EA4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;

  sub_20D191AA8();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8498);
  MEMORY[0x212B9E378](&v9);
  v5 = sub_20D191AB4();
  swift_release();
  v6 = *(_QWORD *)(a1 + 224);
  sub_20D191A90();
  MEMORY[0x212B9E378](&v9, v4);
  v7 = sub_20D191AB4();
  result = swift_release();
  *a2 = v5;
  a2[1] = v6;
  a2[2] = 0;
  a2[3] = 0;
  a2[4] = v7;
  a2[5] = 0x4014000000000000;
  a2[6] = 0;
  a2[7] = 0;
  return result;
}

void sub_20D142FC4()
{
  uint64_t v0;
  double v1;
  double v2;
  double v3;
  double v4;
  uint64_t v5;
  double v6;
  double v7;

  if ((*(_BYTE *)(v0 + 248) & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A84A0);
    sub_20D191B8C();
    sub_20D15108C(-1.0, -1.0, 1.0, 1.0);
    v2 = v1;
    v4 = v3;
    v5 = sub_20D191B8C();
    MEMORY[0x212B9E654](v5, v6, v7, v2, v4);
  }
}

uint64_t sub_20D14308C@<X0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>)
{
  const void *v3;
  const void *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v24;
  uint64_t v25;
  _QWORD v27[2];
  double v28[40];
  CGRect v29;
  CGRect v30;

  v4 = v3;
  v27[1] = a1;
  v7 = sub_20D1917D8();
  MEMORY[0x24BDAC7A8](v7);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A85D8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A85E0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  memcpy(v28, v4, 0x138uLL);
  v15 = (v28[23] - v28[24]) / v28[23];
  v16 = v15 * a2 - v28[27];
  v17 = v15 * a3 - v28[27];
  if (v16 >= 0.0)
    v18 = v16;
  else
    v18 = 0.0;
  if (v17 >= 0.0)
    v19 = v17;
  else
    v19 = 0.0;
  v29.origin.x = 0.0;
  v29.origin.y = 0.0;
  v29.size.width = a2;
  v29.size.height = a3;
  v30 = CGRectInset(v29, v18, v19);
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  height = v30.size.height;
  sub_20D1915A4();
  sub_20D191808();
  sub_20D191394();
  v24 = swift_allocObject();
  memcpy((void *)(v24 + 16), v28, 0x138uLL);
  *(CGFloat *)(v24 + 328) = a2;
  *(CGFloat *)(v24 + 336) = a3;
  *(CGFloat *)(v24 + 344) = x;
  *(CGFloat *)(v24 + 352) = y;
  *(CGFloat *)(v24 + 360) = width;
  *(CGFloat *)(v24 + 368) = height;
  sub_20D14409C((uint64_t)v28);
  sub_20D14B9E8((uint64_t)&unk_2549A85E8);
  sub_20D14A530();
  sub_20D191C10();
  swift_release();
  sub_20D14B87C((uint64_t)v10, &qword_2549A85D8);
  v25 = swift_allocObject();
  memcpy((void *)(v25 + 16), v28, 0x138uLL);
  sub_20D14409C((uint64_t)v28);
  sub_20D14B9E8((uint64_t)&unk_2549A8608);
  sub_20D191C04();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

BOOL sub_20D143360(double *a1, double *a2, _OWORD *a3)
{
  double v4;
  double v5;
  double v6;
  double v7;
  _OWORD v10[19];
  char v11;

  v4 = *a1;
  v5 = a1[1];
  v6 = *a2;
  v7 = a2[1];
  v10[0] = a3[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A84B0);
  sub_20D191B8C();
  if (v11 == 1)
  {
    memcpy(v10, a3, 0x138uLL);
    return sub_20D143404(v4, v5, v6, v7);
  }
  else
  {
    return 0;
  }
}

BOOL sub_20D143404(double a1, double a2, double a3, double a4)
{
  double *v4;
  double v6;
  _BOOL8 result;
  double v8;
  _BOOL4 v9;

  if (a1 == a3 && a2 == a4)
    return 0;
  v6 = (v4[17] + v4[15]) * 0.5;
  if (a1 == a3)
    goto LABEL_6;
  v8 = (v4[16] + v4[14]) * 0.5;
  if (a1 < a3)
  {
    if (v8 > a1)
    {
      v9 = v8 <= a3;
      goto LABEL_17;
    }
LABEL_6:
    if (a2 != a4)
    {
      if (a2 >= a4)
      {
        if (v6 >= a4)
          return v6 < a2;
      }
      else if (v6 > a2)
      {
        return v6 <= a4;
      }
    }
    return 0;
  }
  if (v8 < a3)
    goto LABEL_6;
  v9 = v8 < a1;
LABEL_17:
  if (a2 == a4)
    return v9;
  if (a2 >= a4)
  {
    if (v6 < a4)
      return v9;
    result = v6 < a2;
    if (v9)
      return 1;
  }
  else
  {
    if (v6 <= a2)
      return v9;
    result = v6 <= a4;
    if (v9)
      return 1;
  }
  return result;
}

void sub_20D1434F0(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  _QWORD *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  void (**v39)(_QWORD, _QWORD);
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  char *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  uint64_t v65;
  _QWORD *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t (*v72)(void);
  uint64_t v73;
  double v74;
  uint64_t v75;
  uint64_t v76;
  __int128 v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  char *v95;
  uint64_t *v96;
  char *v97;
  uint64_t v98;
  _QWORD *v99;
  char *v100;
  id v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  __int128 v122;
  __int128 v123;
  uint64_t v124;
  id v125;
  uint64_t v126;

  v121 = a2;
  v3 = sub_20D191D24();
  v119 = *(_QWORD *)(v3 - 8);
  v120 = v3;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v118 = (char *)&v92 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A86B8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v115 = (uint64_t)&v92 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v108 = sub_20D191A60();
  v107 = *(_QWORD *)(v108 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v109 = (char *)&v92 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v105 = sub_20D1915D4();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v112 = (char *)&v92 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A86C0);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v113 = (uint64_t)&v92 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A86C8);
  v9 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v117 = (char *)&v92 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v116 = (uint64_t)&v92 - v11;
  v102 = (char *)sub_20D191B14();
  v101 = (id)*((_QWORD *)v102 - 1);
  MEMORY[0x24BDAC7A8](v102);
  v100 = (char *)&v92 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A86D0);
  MEMORY[0x24BDAC7A8](v103);
  v14 = (char *)&v92 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A86D8);
  MEMORY[0x24BDAC7A8](v104);
  v99 = (uint64_t *)((char *)&v92 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A86E0);
  MEMORY[0x24BDAC7A8](v98);
  v17 = (char *)&v92 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = (_QWORD *)sub_20D191CA0();
  v19 = (char *)*(v18 - 1);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v92 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A86E8);
  v23 = MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v92 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v92 - v26;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A86F0);
  v29 = MEMORY[0x24BDAC7A8](v28);
  v106 = (uint64_t)&v92 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)&v92 - v31;
  v33 = a1;
  v34 = *(_QWORD *)(a1 + 168);
  if (v34)
  {
    v35 = v33;
    v36 = *(_QWORD *)(v33 + 160);
    v37 = (void *)objc_opt_self();
    swift_bridgeObjectRetain();
    v38 = objc_msgSend(v37, sel_pe_bundle);
    sub_20D191AFC();
    v39 = (void (**)(_QWORD, _QWORD))v101;
    v40 = v100;
    v41 = v102;
    (*((void (**)(char *, _QWORD, char *))v101 + 13))(v100, *MEMORY[0x24BDF3FD0], v102);
    v42 = sub_20D191B2C();
    swift_release();
    ((void (**)(char *, char *))v39)[1](v40, v41);
    v43 = *(_QWORD *)(v35 + 304);
    *(_QWORD *)v14 = v42;
    *((_WORD *)v14 + 4) = 0;
    *((_QWORD *)v14 + 2) = 0;
    *((_WORD *)v14 + 12) = 257;
    *((_QWORD *)v14 + 4) = v43;
    *((_QWORD *)v14 + 5) = v36;
    *((_QWORD *)v14 + 6) = v34;
    *((_QWORD *)v14 + 7) = 0x3FF0000000000000;
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8708);
    sub_20D14A8D4();
    sub_20D14B9E8((uint64_t)&unk_2549A8738);
    sub_20D1917C0();
    v44 = v35;
  }
  else
  {
    v94 = v22;
    v95 = v21;
    v96 = (uint64_t *)v25;
    v100 = v19;
    v101 = v18;
    v97 = v27;
    v102 = (char *)&v92 - v31;
    v44 = v33;
    v45 = *(void **)(v33 + 144);
    sub_20D14B8A4(v33 + 152, (uint64_t)&v125, &qword_2549A86F8);
    sub_20D14B8A4((uint64_t)&v125, (uint64_t)&v126, &qword_2549A86F8);
    v46 = v126;
    v93 = v45;
    if (v126)
    {
      v47 = v45;
      sub_20D14A4EC(&v125);
      v48 = MEMORY[0x212B9E288](v46);
    }
    else
    {
      v47 = v45;
      v48 = sub_20D191A78();
    }
    v92 = v48;
    v49 = v101;
    v50 = (uint64_t)v17;
    v51 = v95;
    v52 = (uint64_t)v14;
    v53 = *(_QWORD *)(v44 + 304);
    v101 = v47;
    swift_retain();
    v54 = sub_20D191A9C();
    sub_20D191C94();
    v55 = sub_20D1918A4();
    v56 = v100;
    (*((void (**)(uint64_t, char *, id))v100 + 2))(v50, v51, v49);
    *(_BYTE *)(v50 + *(int *)(v98 + 36)) = v55;
    v57 = v96;
    sub_20D14B85C(v50, (uint64_t)v96 + *(int *)(v94 + 36), &qword_2549A86E0);
    *v57 = v54;
    swift_retain();
    sub_20D14B87C(v50, &qword_2549A86E0);
    (*((void (**)(char *, id))v56 + 1))(v51, v49);
    swift_release();
    v58 = (uint64_t)v97;
    sub_20D14B8A4((uint64_t)v57, (uint64_t)v97, &qword_2549A86E8);
    sub_20D14B85C(v58, (uint64_t)v57, &qword_2549A86E8);
    v59 = (uint64_t)v99;
    v60 = v93;
    v61 = v92;
    *v99 = v93;
    *(_QWORD *)(v59 + 8) = v61;
    *(_BYTE *)(v59 + 16) = 1;
    *(_QWORD *)(v59 + 24) = 0;
    *(_WORD *)(v59 + 32) = 257;
    *(_QWORD *)(v59 + 40) = 0x4000000000000000;
    *(_QWORD *)(v59 + 48) = v53;
    *(_QWORD *)(v59 + 56) = v60;
    v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8700);
    sub_20D14B85C((uint64_t)v57, v59 + *(int *)(v62 + 48), &qword_2549A86E8);
    *(_QWORD *)(v59 + *(int *)(v62 + 64)) = 0x3FF0000000000000;
    v63 = v101;
    swift_retain_n();
    swift_retain_n();
    v64 = v63;
    sub_20D14B87C((uint64_t)v57, &qword_2549A86E8);
    swift_release();
    swift_release();

    sub_20D14B85C(v59, v52, &qword_2549A86D8);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8708);
    sub_20D14A8D4();
    sub_20D14B9E8((uint64_t)&unk_2549A8738);
    v32 = v102;
    sub_20D1917C0();
    sub_20D14B87C(v59, &qword_2549A86D8);
    sub_20D14B87C((uint64_t)v97, &qword_2549A86E8);
    swift_release();
    swift_release();

  }
  v65 = *(_QWORD *)(v44 + 200);
  v66 = v112;
  v67 = &v112[*(int *)(v105 + 20)];
  v68 = *MEMORY[0x24BDEEB68];
  v69 = sub_20D191748();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v69 - 8) + 104))(v67, v68, v69);
  *v66 = v65;
  v66[1] = v65;
  v70 = v109;
  (*(void (**)(char *, _QWORD, uint64_t))(v107 + 104))(v109, *MEMORY[0x24BDF3C28], v108);
  v71 = MEMORY[0x212B9E270](v70, 0.38, 0.38, 0.38, 1.0);
  sub_20D1913E8();
  v72 = MEMORY[0x24BDED998];
  v73 = v113;
  sub_20D14A880((uint64_t)v66, v113, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  v74 = *(double *)&v122 * 0.5;
  v75 = v115;
  sub_20D14A880((uint64_t)v66, v115, (uint64_t (*)(_QWORD))v72);
  *(double *)(v75 + *(int *)(sub_20D1915C8() + 20)) = v74;
  v76 = v75 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549A8740) + 36);
  v77 = v123;
  *(_OWORD *)v76 = v122;
  *(_OWORD *)(v76 + 16) = v77;
  *(_QWORD *)(v76 + 32) = v124;
  v78 = v114;
  *(_QWORD *)(v75 + *(int *)(v114 + 52)) = v71;
  *(_WORD *)(v75 + *(int *)(v78 + 56)) = 256;
  v79 = sub_20D191CAC();
  v81 = v80;
  v82 = v73 + *(int *)(v110 + 68);
  v83 = (uint64_t *)(v82 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549A8748) + 36));
  *v83 = v79;
  v83[1] = v81;
  sub_20D14B8A4(v75, v82, &qword_2549A86B8);
  sub_20D14A8AC((uint64_t)v66, (uint64_t (*)(_QWORD))v72);
  v85 = v118;
  v84 = v119;
  v86 = v120;
  (*(void (**)(char *, _QWORD, uint64_t))(v119 + 104))(v118, *MEMORY[0x24BDF50E8], v120);
  v87 = (uint64_t)v117;
  (*(void (**)(char *, char *, uint64_t))(v84 + 16))(&v117[*(int *)(v111 + 36)], v85, v86);
  sub_20D14B85C(v73, v87, &qword_2549A86C0);
  (*(void (**)(char *, uint64_t))(v84 + 8))(v85, v86);
  sub_20D14B87C(v73, &qword_2549A86C0);
  v88 = v116;
  sub_20D14B8A4(v87, v116, &qword_2549A86C8);
  v89 = v106;
  sub_20D14B85C((uint64_t)v32, v106, &qword_2549A86F0);
  sub_20D14B85C(v88, v87, &qword_2549A86C8);
  v90 = v121;
  sub_20D14B85C(v89, v121, &qword_2549A86F0);
  v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8750);
  sub_20D14B85C(v87, v90 + *(int *)(v91 + 48), &qword_2549A86C8);
  sub_20D14B87C(v88, &qword_2549A86C8);
  sub_20D14B87C((uint64_t)v32, &qword_2549A86F0);
  sub_20D14B87C(v87, &qword_2549A86C8);
  sub_20D14B87C(v89, &qword_2549A86F0);
}

uint64_t sub_20D144044()
{
  return sub_20D191CF4();
}

uint64_t sub_20D14409C(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 144);
  v3 = *(void **)(a1 + 152);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v4 = v2;
  v5 = v3;
  return a1;
}

uint64_t sub_20D14413C(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 144);
  v3 = *(void **)(a1 + 152);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212B9EFF0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_20D14421C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_20D14422C(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
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
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  void *v37;
  char v38;
  uint64_t v39;
  char *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  uint64_t v55;
  _QWORD v56[2];
  void (*v57)(char *, uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  __int128 aBlock;
  uint64_t (*v70)(uint64_t);
  void *v71;
  _QWORD *(*v72)();
  uint64_t v73;
  uint64_t v74;

  v68 = a1;
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A85F8);
  MEMORY[0x24BDAC7A8](v67);
  v16 = (char *)v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = sub_20D1913B8();
  v60 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v18 = (char *)v56 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_20D191DC0();
  v65 = *(_QWORD *)(v19 - 8);
  v66 = v19;
  MEMORY[0x24BDAC7A8](v19);
  v64 = (char *)v56 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_20D191DD8();
  v63 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v62 = (char *)v56 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_20D191DF0();
  v24 = *(_QWORD *)(v23 - 8);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)v56 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)v56 - v28;
  aBlock = *(_OWORD *)(a2 + 32);
  LOBYTE(v70) = *(_BYTE *)(a2 + 48);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8498);
  MEMORY[0x212B9E378](&v74, v30);
  if ((v74 & 1) == 0)
  {
    v31 = sub_20D144044();
    v58 = v23;
    v59 = v21;
    MEMORY[0x24BDAC7A8](v31);
    v56[-2] = a2;
    sub_20D1914B4();
    v56[1] = 0;
    swift_release();
    sub_20D14A608();
    v56[0] = sub_20D191EA4();
    sub_20D191DE4();
    MEMORY[0x212B9E5A0](v27, 0.2);
    v57 = *(void (**)(char *, uint64_t))(v24 + 8);
    v57(v27, v23);
    v32 = swift_allocObject();
    memcpy((void *)(v32 + 16), (const void *)a2, 0x138uLL);
    v72 = sub_20D14A6BC;
    v73 = v32;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v70 = sub_20D1635CC;
    v71 = &block_descriptor;
    v33 = _Block_copy(&aBlock);
    sub_20D14409C(a2);
    swift_release();
    v34 = v62;
    sub_20D191DCC();
    *(_QWORD *)&aBlock = MEMORY[0x24BEE4AF8];
    sub_20D145754((uint64_t)&unk_2549A8618);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8620);
    sub_20D14B9E8((uint64_t)&unk_2549A8628);
    v35 = v64;
    v36 = v66;
    sub_20D191EC8();
    v37 = (void *)v56[0];
    MEMORY[0x212B9E63C](v29, v34, v35, v33);
    _Block_release(v33);

    (*(void (**)(char *, uint64_t))(v65 + 8))(v35, v36);
    (*(void (**)(char *, uint64_t))(v63 + 8))(v34, v59);
    v57(v29, v58);
  }
  sub_20D14B85C(v68, (uint64_t)v16, &qword_2549A85F8);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    v41 = &qword_2549A85F8;
    v42 = (uint64_t)v16;
    goto LABEL_8;
  }
  v38 = *v16;
  v39 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549A8630) + 48);
  v40 = &v16[v39];
  if ((v38 & 1) == 0 || __swift_getEnumTagSinglePayload((uint64_t)&v16[v39], 1, v61) == 1)
  {
    v41 = (uint64_t *)&unk_2549A8638;
    v42 = (uint64_t)v40;
LABEL_8:
    sub_20D14B87C(v42, v41);
    return;
  }
  v43 = v60;
  v44 = v61;
  (*(void (**)(char *, char *, uint64_t))(v60 + 32))(v18, v40, v61);
  sub_20D1913AC();
  sub_20D151020(0.0, 0.0, a3, a4);
  sub_20D151C78(-1.0, -1.0, 2.0, 2.0);
  v46 = v45;
  v48 = v47;
  sub_20D1913AC();
  sub_20D151020(a5, a6, a7, a8);
  v49 = *(double *)(a2 + 120);
  v50 = *(double *)(a2 + 136);
  sub_20D151C78(*(double *)(a2 + 112), v49, *(double *)(a2 + 128) - *(double *)(a2 + 112), v50 - v49);
  v52 = v51;
  v54 = v49 + v50 - v53;
  v55 = sub_20D191CD0();
  MEMORY[0x24BDAC7A8](v55);
  v56[-6] = a2;
  v56[-5] = v52;
  *(double *)&v56[-4] = v54;
  v56[-3] = v46;
  v56[-2] = v48;
  sub_20D1914B4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v18, v44);
}

uint64_t sub_20D144844()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8498);
  return sub_20D191BE0();
}

_QWORD *sub_20D1448A0()
{
  _QWORD *result;
  uint64_t v1;
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A84B0);
  result = (_QWORD *)sub_20D191B8C();
  if ((v2 & 1) == 0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8498);
    result = MEMORY[0x212B9E378](&v2, v1);
    if (v2 == 1)
    {
      LOBYTE(v2) = 1;
      return (_QWORD *)sub_20D191B98();
    }
  }
  return result;
}

uint64_t sub_20D144950(double *a1)
{
  sub_20D15108C(a1[14], a1[15], a1[16], a1[17]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A84A8);
  sub_20D191BE0();
  sub_20D15108C(-3.0, -3.0, 3.0, 3.0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A84A0);
  return sub_20D191B98();
}

uint64_t sub_20D144A1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 __dst[8];
  __int128 v6;
  _BYTE v7[16];
  __int16 v8;

  __dst[0] = *(_OWORD *)(a2 + 80);
  v7[0] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A84B0);
  sub_20D191B98();
  memcpy(__dst, (const void *)(a2 + 176), sizeof(__dst));
  sub_20D14A5C0(&__dst[5], (uint64_t)&v6);
  sub_20D14A5C0(&v6, (uint64_t)v7);
  if (v8 < 0)
    v8 &= ~0x8000u;
  v3 = sub_20D144B1C();
  MEMORY[0x24BDAC7A8](v3);
  sub_20D1914B4();
  return swift_release();
}

uint64_t sub_20D144B1C()
{
  return sub_20D191CF4();
}

uint64_t sub_20D144B74(uint64_t a1)
{
  sub_20D14409C(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8498);
  sub_20D191BE0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A84A0);
  sub_20D191B98();
  return sub_20D14413C(a1);
}

uint64_t destroy for PhotoStyleDPad(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for PhotoStyleDPad(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  v6 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v6;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  v8 = *(void **)(a2 + 144);
  v7 = *(void **)(a2 + 152);
  *(_QWORD *)(a1 + 144) = v8;
  *(_QWORD *)(a1 + 152) = v7;
  v9 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v9;
  memcpy((void *)(a1 + 176), (const void *)(a2 + 176), 0x80uLL);
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v10 = v8;
  v11 = v7;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for PhotoStyleDPad(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  __int128 v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  v4 = *(void **)(a1 + 144);
  v5 = *(void **)(a2 + 144);
  *(_QWORD *)(a1 + 144) = v5;
  v6 = v5;

  v7 = *(void **)(a1 + 152);
  v8 = *(void **)(a2 + 152);
  *(_QWORD *)(a1 + 152) = v8;
  v9 = v8;

  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 176) = *(_BYTE *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_BYTE *)(a1 + 248) = *(_BYTE *)(a2 + 248);
  v10 = *(_OWORD *)(a2 + 256);
  *(_WORD *)(a1 + 272) = *(_WORD *)(a2 + 272);
  *(_OWORD *)(a1 + 256) = v10;
  *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy312_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x138uLL);
}

uint64_t assignWithTake for PhotoStyleDPad(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  void *v5;
  uint64_t v6;

  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_release();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_release();
  v4 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v4;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);

  v5 = *(void **)(a1 + 152);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);

  v6 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 176) = *(_BYTE *)(a2 + 176);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_BYTE *)(a1 + 248) = *(_BYTE *)(a2 + 248);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  *(_WORD *)(a1 + 272) = *(_WORD *)(a2 + 272);
  *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
  *(_OWORD *)(a1 + 288) = *(_OWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotoStyleDPad(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 312))
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

uint64_t storeEnumTagSinglePayload for PhotoStyleDPad(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
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
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 312) = 1;
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
    *(_BYTE *)(result + 312) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for PhotoStyleDPad()
{
  OUTLINED_FUNCTION_14();
}

void *__swift_memcpy128_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x80uLL);
}

uint64_t getEnumTagSinglePayload for PhotoStyleDPad.Configuration(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0x3FFF && *(_BYTE *)(a1 + 128))
    {
      v2 = *(_DWORD *)a1 + 16382;
    }
    else
    {
      v2 = (*(_WORD *)(a1 + 96) & 0xFE | (*(unsigned __int16 *)(a1 + 96) >> 15) | (*(unsigned __int16 *)(a1 + 96) >> 1) & 0x3F00) ^ 0x3FFF;
      if (v2 >= 0x3FFE)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for PhotoStyleDPad.Configuration(uint64_t result, unsigned int a2, unsigned int a3)
{
  unsigned int v3;

  if (a2 > 0x3FFE)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x3FFF;
    if (a3 >= 0x3FFF)
      *(_BYTE *)(result + 128) = 1;
  }
  else
  {
    if (a3 >= 0x3FFF)
      *(_BYTE *)(result + 128) = 0;
    if (a2)
    {
      v3 = ((-a2 >> 1) & 0x1FFF) - (a2 << 13);
      *(_QWORD *)(result + 80) = 0;
      *(_QWORD *)(result + 88) = 0;
      *(_WORD *)(result + 96) = (4 * v3) & 0xFE00 | (2 * (v3 & 0x7F));
    }
  }
  return result;
}

void type metadata accessor for PhotoStyleDPad.Configuration()
{
  OUTLINED_FUNCTION_14();
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for PhotoStyleDPad.Configuration.PhotoStyleDPadGridStyle(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0x3FFF && *(_BYTE *)(a1 + 18))
    {
      v2 = *(_DWORD *)a1 + 16382;
    }
    else
    {
      v2 = (*(_WORD *)(a1 + 16) & 0xFE | (*(unsigned __int16 *)(a1 + 16) >> 15) | (*(unsigned __int16 *)(a1 + 16) >> 1) & 0x3F00) ^ 0x3FFF;
      if (v2 >= 0x3FFE)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for PhotoStyleDPad.Configuration.PhotoStyleDPadGridStyle(uint64_t result, unsigned int a2, unsigned int a3)
{
  unsigned int v3;

  if (a2 > 0x3FFE)
  {
    *(_WORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x3FFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x3FFF)
      *(_BYTE *)(result + 18) = 1;
  }
  else
  {
    if (a3 >= 0x3FFF)
      *(_BYTE *)(result + 18) = 0;
    if (a2)
    {
      v3 = ((-a2 >> 1) & 0x1FFF) - (a2 << 13);
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 0;
      *(_WORD *)(result + 16) = (4 * v3) & 0xFE00 | (2 * (v3 & 0x7F));
    }
  }
  return result;
}

uint64_t sub_20D145390(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 16) >> 15;
}

uint64_t sub_20D14539C(uint64_t result)
{
  *(_WORD *)(result + 16) &= ~0x8000u;
  return result;
}

uint64_t sub_20D1453AC(uint64_t result, __int16 a2)
{
  *(_WORD *)(result + 16) = *(_WORD *)(result + 16) & 0x101 | (a2 << 15);
  return result;
}

void type metadata accessor for PhotoStyleDPad.Configuration.PhotoStyleDPadGridStyle()
{
  OUTLINED_FUNCTION_14();
}

unint64_t sub_20D1453D0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_2549A81F8;
  if (!qword_2549A81F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A81F0);
    sub_20D14B684((uint64_t)&unk_2549A8200);
    v3 = v2;
    sub_20D145754((uint64_t)&unk_2549A8268);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2549A81F8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212B9EFFC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_20D1454B8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[6];

  result = qword_2549A8208;
  if (!qword_2549A8208)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8210);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8218);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8220);
    type metadata accessor for CGPoint(255);
    sub_20D14B9E8((uint64_t)&unk_2549A8228);
    sub_20D145754((uint64_t)&unk_2549A8230);
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v6[2] = v2;
    v6[3] = MEMORY[0x24BEE1328];
    v6[4] = OpaqueTypeConformance2;
    v6[5] = MEMORY[0x24BEE1340];
    v4 = swift_getOpaqueTypeConformance2();
    sub_20D14B754((uint64_t)&unk_2549A8238);
    v6[0] = v4;
    v6[1] = v5;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDEF3E0], v1, v6);
    atomic_store(result, (unint64_t *)&qword_2549A8208);
  }
  return result;
}

void sub_20D145604()
{
  sub_20D14B754((uint64_t)&unk_2549A8248);
}

unint64_t sub_20D145628()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  _QWORD v4[6];

  result = qword_2549A8258;
  if (!qword_2549A8258)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8260);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8218);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8220);
    type metadata accessor for CGPoint(255);
    sub_20D14B9E8((uint64_t)&unk_2549A8228);
    sub_20D145754((uint64_t)&unk_2549A8230);
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v4[2] = v2;
    v4[3] = MEMORY[0x24BEE1328];
    v4[4] = OpaqueTypeConformance2;
    v4[5] = MEMORY[0x24BEE1340];
    v4[0] = swift_getOpaqueTypeConformance2();
    v4[1] = MEMORY[0x24BDEBF50];
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2549A8258);
  }
  return result;
}

void sub_20D145754(uint64_t a1)
{
  void (*v1)(uint64_t);

  if (!OUTLINED_FUNCTION_12(a1))
  {
    v1(255);
    OUTLINED_FUNCTION_19();
  }
  OUTLINED_FUNCTION_1();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_20D145790(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_20D1457B0(uint64_t result, int a2, int a3)
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
  sub_20D14A9B0(a1, &qword_2549A8270);
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

uint64_t sub_20D1457F8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_20D145818(uint64_t result, int a2, int a3)
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

void type metadata accessor for UIEdgeInsets(uint64_t a1)
{
  sub_20D14A9B0(a1, &qword_2549A8278);
}

void type metadata accessor for PISemanticStyleCast(uint64_t a1)
{
  sub_20D14A9B0(a1, qword_2549A8280);
}

uint64_t destroy for PhotoStyleDPad.ValueIndicator()
{
  return swift_release();
}

uint64_t initializeWithCopy for PhotoStyleDPad.ValueIndicator(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for PhotoStyleDPad.ValueIndicator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  v4 = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v4;
  return a1;
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

uint64_t assignWithTake for PhotoStyleDPad.ValueIndicator(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotoStyleDPad.ValueIndicator(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 33))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for PhotoStyleDPad.ValueIndicator(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 33) = 1;
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
    *(_BYTE *)(result + 33) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotoStyleDPad.ValueIndicator()
{
  return &type metadata for PhotoStyleDPad.ValueIndicator;
}

uint64_t initializeBufferWithCopyOfBuffer for PhotoStyleDPad.DottedGrid(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
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

uint64_t getEnumTagSinglePayload for PhotoStyleDPad.DottedGrid(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  unsigned int v3;
  BOOL v4;

  if (a2)
  {
    if (a2 >= 0xFF && a1[49])
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

uint64_t storeEnumTagSinglePayload for PhotoStyleDPad.DottedGrid(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 49) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 49) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotoStyleDPad.DottedGrid()
{
  return &type metadata for PhotoStyleDPad.DottedGrid;
}

uint64_t sub_20D145B14()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_20D145B1C()
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

uint64_t *sub_20D145B98(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 64) + 7;
  if (v5 > 7
    || (*(_DWORD *)(v4 + 80) & 0x100000) != 0
    || ((v6 + ((v5 + 8) & ~v5)) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v9 + ((v5 & 0xF8 ^ 0x1F8) & (v5 + 16)));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    v10 = ((unint64_t)a1 + v5 + 8) & ~v5;
    v11 = ((unint64_t)a2 + v5 + 8) & ~v5;
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v10, v11);
    *(_QWORD *)((v6 + v10) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v6 + v11) & 0xFFFFFFFFFFFFF8);
  }
  return v3;
}

uint64_t sub_20D145C70(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((a1 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

_QWORD *sub_20D145C90(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v6, v7);
  *(_QWORD *)((*(_QWORD *)(v4 + 64) + 7 + v6) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v4 + 64) + 7 + v7) & 0xFFFFFFFFFFFFF8);
  return a1;
}

_QWORD *sub_20D145D10(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  (*(void (**)(uint64_t, uint64_t))(v4 + 24))(v6, v7);
  *(_QWORD *)((*(_QWORD *)(v4 + 64) + 7 + v6) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v4 + 64) + 7 + v7) & 0xFFFFFFFFFFFFF8);
  return a1;
}

_QWORD *sub_20D145D90(_QWORD *a1, _QWORD *a2, uint64_t a3)
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

_QWORD *sub_20D145E10(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  (*(void (**)(uint64_t, uint64_t))(v4 + 40))(v6, v7);
  *(_QWORD *)((*(_QWORD *)(v4 + 64) + 7 + v6) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v4 + 64) + 7 + v7) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_20D145E90(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 >= a2)
  {
    if ((_DWORD)v6)
      return __swift_getEnumTagSinglePayload((a1 + v7 + 8) & ~v7, v6, v4);
    return 0;
  }
  if (((((*(_QWORD *)(v5 + 64) + ((v7 + 8) & ~v7) + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
    v8 = 2;
  else
    v8 = a2 - v6 + 1;
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
  return ((uint64_t (*)(void))((char *)&loc_20D145F10 + 4 * byte_20D195400[v10]))();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

void sub_20D145F80(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  int v12;
  unsigned int v13;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = ((*(_QWORD *)(v6 + 64)
       + ((*(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
       + 7) & 0xFFFFFFFFFFFFFFF8)
     + 8;
  if (v7 >= a3)
  {
    v12 = 0;
  }
  else
  {
    v9 = a3 - v7;
    if (((*(_DWORD *)(v6 + 64) + ((*(unsigned __int8 *)(v6 + 80) + 8) & ~*(unsigned __int8 *)(v6 + 80)) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
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
  __asm { BR              X12 }
}

uint64_t sub_20D146074@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  *(_BYTE *)(v5 + v6) = 0;
  if ((_DWORD)a1)
    return __swift_storeEnumTagSinglePayload((v5 + v4 + 8) & a4, a1, a2, a3);
  return result;
}

void sub_20D1460B8(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_WORD *)(v2 + v3) = 0;
  if (!a2)
    JUMPOUT(0x20D1460C0);
  JUMPOUT(0x20D146098);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t type metadata accessor for PhotoStyleDPad.SpiderGrid(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PhotoStyleDPad.SpiderGrid);
}

ValueMetadata *type metadata accessor for PhotoStyleDPad.CompositeGradient()
{
  return &type metadata for PhotoStyleDPad.CompositeGradient;
}

void type metadata accessor for CGImage(uint64_t a1)
{
  sub_20D14A9B0(a1, &qword_2549A8308);
}

uint64_t destroy for PhotoStyleDPad.BackdropImage(id *a1)
{

  return swift_release();
}

void _s12PhotosUIEdit14PhotoStyleDPadV13BackdropImageVwCP_0(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)a2;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = v2;
  swift_retain();
  OUTLINED_FUNCTION_1();
}

uint64_t assignWithCopy for PhotoStyleDPad.BackdropImage(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for PhotoStyleDPad.BackdropImage(uint64_t a1, uint64_t a2)
{

  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotoStyleDPad.BackdropImage(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 17))
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

uint64_t storeEnumTagSinglePayload for PhotoStyleDPad.BackdropImage(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PhotoStyleDPad.BackdropImage()
{
  return &type metadata for PhotoStyleDPad.BackdropImage;
}

uint64_t sub_20D1462C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D1462D0@<X0>(uint64_t a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;

  v3 = *((_QWORD *)v1 + 2);
  swift_retain_n();
  v4 = 1.0;
  sub_20D1913E8();
  v5 = sub_20D191CAC();
  v17 = v6;
  v18 = v5;
  v7 = *((double *)v1 + 3);
  v8 = v1[32];
  sub_20D191CAC();
  sub_20D191424();
  v9 = *v1;
  sub_20D191D60();
  v11 = v10;
  v13 = v12;
  if (v9 == 1)
  {
    sub_20D191D18();
    v14 = sub_20D191CC4();
    result = swift_release();
    v4 = 2.2;
  }
  else
  {
    result = sub_20D191D18();
    v14 = result;
  }
  v16 = 0.0;
  if (!v8)
    v16 = v7;
  *(_QWORD *)a1 = v19;
  *(_QWORD *)(a1 + 8) = v20;
  *(_QWORD *)(a1 + 16) = v21;
  *(_QWORD *)(a1 + 24) = v22;
  *(_QWORD *)(a1 + 32) = v23;
  *(_QWORD *)(a1 + 40) = v3;
  *(_WORD *)(a1 + 48) = 256;
  *(_QWORD *)(a1 + 56) = v3;
  *(_WORD *)(a1 + 64) = 256;
  *(_QWORD *)(a1 + 72) = v18;
  *(_QWORD *)(a1 + 80) = v17;
  *(double *)(a1 + 88) = v16;
  *(_QWORD *)(a1 + 96) = v24;
  *(_BYTE *)(a1 + 104) = v25;
  *(_QWORD *)(a1 + 112) = v26;
  *(_BYTE *)(a1 + 120) = v27;
  *(_QWORD *)(a1 + 128) = v28;
  *(_QWORD *)(a1 + 136) = v29;
  *(double *)(a1 + 144) = v4;
  *(double *)(a1 + 152) = v4;
  *(_QWORD *)(a1 + 160) = v11;
  *(_QWORD *)(a1 + 168) = v13;
  *(_QWORD *)(a1 + 176) = v14;
  *(_BYTE *)(a1 + 184) = v9;
  return result;
}

uint64_t sub_20D1464BC@<X0>(uint64_t a1@<X8>)
{
  return sub_20D1462D0(a1);
}

void *sub_20D1464F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[128];

  v2 = sub_20D191CAC();
  v4 = v3;
  sub_20D146548((uint64_t)v6);
  *a1 = v2;
  a1[1] = v4;
  return memcpy(a1 + 2, v6, 0x80uLL);
}

double sub_20D146548@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t, uint64_t);
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
  double result;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;

  v2 = sub_20D191A60();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8448);
  v6 = swift_allocObject();
  v24 = xmmword_20D1952E0;
  *(_OWORD *)(v6 + 16) = xmmword_20D1952E0;
  v7 = *MEMORY[0x24BDF3C28];
  v8 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v8(v5, v7, v2);
  MEMORY[0x212B9E270](v5, 0.86, 0.86, 0.86, 1.0);
  *(_QWORD *)(v6 + 32) = sub_20D191C58();
  *(_QWORD *)(v6 + 40) = v9;
  sub_20D191A9C();
  *(_QWORD *)(v6 + 48) = sub_20D191C58();
  *(_QWORD *)(v6 + 56) = v10;
  MEMORY[0x212B9E408](v6);
  sub_20D1914CC();
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = v24;
  v8(v5, v7, v2);
  MEMORY[0x212B9E270](v5, 0.93, 0.93, 0.93, 1.0);
  *(_QWORD *)(v11 + 32) = sub_20D191C58();
  *(_QWORD *)(v11 + 40) = v12;
  sub_20D191A9C();
  *(_QWORD *)(v11 + 48) = sub_20D191C58();
  *(_QWORD *)(v11 + 56) = v13;
  MEMORY[0x212B9E408](v11);
  sub_20D1914CC();
  v14 = v28;
  v23 = v29;
  v15 = v30;
  v16 = v31;
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = v24;
  sub_20D191A9C();
  *(_QWORD *)(v17 + 32) = sub_20D191C58();
  *(_QWORD *)(v17 + 40) = v18;
  v8(v5, v7, v2);
  MEMORY[0x212B9E270](v5, 0.07, 0.07, 0.07, 1.0);
  *(_QWORD *)(v17 + 48) = sub_20D191C58();
  *(_QWORD *)(v17 + 56) = v19;
  MEMORY[0x212B9E408](v17);
  sub_20D191D48();
  sub_20D191D54();
  sub_20D1914CC();
  v20 = v32;
  *(_QWORD *)a1 = v25;
  *(_OWORD *)(a1 + 8) = v26;
  *(_OWORD *)(a1 + 24) = v27;
  *(_QWORD *)(a1 + 40) = v14;
  *(_OWORD *)(a1 + 48) = v23;
  *(_QWORD *)(a1 + 64) = v15;
  *(_QWORD *)(a1 + 72) = v16;
  *(_QWORD *)(a1 + 80) = 0x3FE3333333333333;
  *(_QWORD *)(a1 + 88) = v20;
  result = *(double *)&v33;
  v22 = v34;
  *(_OWORD *)(a1 + 96) = v33;
  *(_OWORD *)(a1 + 112) = v22;
  return result;
}

uint64_t sub_20D146820@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  _BYTE *v15;
  void (*v16)(_BYTE *, uint64_t);
  _BYTE v18[16];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8408);
  v7 = a1 + 16;
  v6 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(v7 + 8);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  sub_20D1913F4();
  sub_20D19152C();
  v22 = v6;
  v23 = MEMORY[0x24BDF3E48];
  v24 = MEMORY[0x24BDF5158];
  v25 = v5;
  v26 = MEMORY[0x24BDF3E18];
  v27 = MEMORY[0x24BDF5138];
  sub_20D1917F0();
  sub_20D1915E0();
  sub_20D19152C();
  swift_getTupleTypeMetadata2();
  v8 = sub_20D191D30();
  MEMORY[0x212B9F008](MEMORY[0x24BDF5428], v8);
  v9 = sub_20D191BC8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = &v18[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v11);
  v15 = &v18[-v14];
  v19 = v6;
  v20 = v5;
  v21 = v2;
  sub_20D191CAC();
  sub_20D191BBC();
  MEMORY[0x212B9F008](MEMORY[0x24BDF4750], v9);
  sub_20D163278((uint64_t)v13, v9, (uint64_t)v15);
  v16 = *(void (**)(_BYTE *, uint64_t))(v10 + 8);
  v16(v13, v9);
  sub_20D1524DC((uint64_t)v15, v9, a2);
  return ((uint64_t (*)(_BYTE *, uint64_t))v16)(v15, v9);
}

uint64_t sub_20D146A50@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  uint64_t AssociatedTypeWitness;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  _QWORD *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  uint64_t (*v33)(void);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(uint64_t, uint64_t);
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  _QWORD v60[4];
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(char *, uint64_t);
  char *v69;
  void (*v70)(char *);
  unsigned int v71;
  uint64_t v72;
  char *v73;
  char *v74;
  char *v75;
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
  uint64_t *v87;
  char *v88;
  uint64_t v89;
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[28];
  _QWORD v95[29];

  v87 = a1;
  v83 = a4;
  v6 = sub_20D191A60();
  v76 = *(_QWORD *)(v6 - 8);
  v77 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v73 = (char *)v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v95[0] = a2;
  v95[1] = MEMORY[0x24BDF3E48];
  v95[2] = MEMORY[0x24BDF5158];
  v95[3] = a3;
  v95[4] = MEMORY[0x24BDF3E18];
  v95[5] = MEMORY[0x24BDF5138];
  v8 = sub_20D1917F0();
  v9 = *(_QWORD *)(v8 - 8);
  v78 = v8;
  v82 = v9;
  MEMORY[0x24BDAC7A8](v8);
  v74 = (char *)v60 - v10;
  sub_20D1915E0();
  v11 = sub_20D19152C();
  v12 = *(_QWORD *)(v11 - 8);
  v80 = v11;
  v81 = v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v75 = (char *)v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v79 = (uint64_t)v60 - v15;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v72 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v17 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v69 = (char *)v60 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)v60 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = sub_20D191D24();
  v21 = *(_QWORD **)(v84 - 8);
  MEMORY[0x24BDAC7A8](v84);
  v23 = (char *)v60 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8408);
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)v60 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = AssociatedTypeWitness;
  v64 = *(_QWORD *)(swift_getAssociatedConformanceWitness() + 8);
  v66 = sub_20D1913F4();
  v67 = sub_20D19152C();
  v86 = *(_QWORD *)(v67 - 8);
  v27 = MEMORY[0x24BDAC7A8](v67);
  v61 = (char *)v60 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v85 = (uint64_t)v60 - v29;
  v30 = a3;
  sub_20D147150(v87, (uint64_t)v94);
  memcpy(v95, v94, 0xE0uLL);
  v71 = *MEMORY[0x24BDF50E8];
  v70 = (void (*)(char *))v21[13];
  v31 = v84;
  v70(v23);
  v32 = (void (*)(char *, char *, uint64_t))v21[2];
  v65 = v23;
  v32(v20, v23, v31);
  v33 = MEMORY[0x24BDEDB60];
  sub_20D14A880((uint64_t)v20, (uint64_t)&v26[*(int *)(v24 + 36)], (uint64_t (*)(_QWORD))MEMORY[0x24BDEDB60]);
  memcpy(v26, v95, 0xE0uLL);
  sub_20D14A0E4(v95);
  sub_20D14A8AC((uint64_t)v20, (uint64_t (*)(_QWORD))v33);
  v68 = (void (*)(char *, uint64_t))v21[1];
  v68(v23, v31);
  sub_20D14A1E0(v94);
  v60[1] = a2;
  v60[2] = v30;
  v35 = type metadata accessor for PhotoStyleDPad.SpiderGrid(0, a2, v30, v34);
  v36 = *(int *)(v35 + 36);
  v60[3] = *(int *)(v35 + 40);
  v62 = (char *)v87 + v36;
  v37 = v69;
  sub_20D1914F0();
  sub_20D14B754((uint64_t)&unk_2549A8410);
  v39 = v38;
  v40 = (uint64_t)v61;
  v41 = v63;
  sub_20D191A48();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v37, v41);
  sub_20D14B87C((uint64_t)v26, &qword_2549A8408);
  v42 = MEMORY[0x212B9F008](MEMORY[0x24BDEB950], v66);
  v93[0] = v39;
  v93[1] = v42;
  v43 = v67;
  v69 = (char *)MEMORY[0x212B9F008](MEMORY[0x24BDED308], v67, v93);
  sub_20D163278(v40, v43, v85);
  v72 = *(_QWORD *)(v86 + 8);
  v44 = v40;
  ((void (*)(uint64_t, uint64_t))v72)(v40, v43);
  v45 = v73;
  (*(void (**)(char *, _QWORD, uint64_t))(v76 + 104))(v73, *MEMORY[0x24BDF3C28], v77);
  v91[0] = MEMORY[0x212B9E270](v45, 0.38, 0.38, 0.38, 1.0);
  sub_20D1528BC();
  v46 = v74;
  sub_20D1528C4();
  swift_release();
  v47 = v65;
  v48 = v84;
  ((void (*)(char *, _QWORD, uint64_t))v70)(v65, v71, v84);
  v49 = v78;
  v50 = MEMORY[0x212B9F008](MEMORY[0x24BDEFA70], v78);
  v51 = (uint64_t)v75;
  sub_20D191A3C();
  v68(v47, v48);
  (*(void (**)(char *, uint64_t))(v82 + 8))(v46, v49);
  v92[0] = v50;
  v92[1] = MEMORY[0x24BDEDB58];
  v52 = v80;
  v53 = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v80, v92);
  v54 = v79;
  sub_20D163278(v51, v52, v79);
  v55 = v81;
  v56 = *(void (**)(uint64_t, uint64_t))(v81 + 8);
  v56(v51, v52);
  v57 = v85;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v86 + 16))(v44, v85, v43);
  v91[0] = v44;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v55 + 16))(v51, v54, v52);
  v91[1] = v51;
  v90[0] = v43;
  v90[1] = v52;
  v88 = v69;
  v89 = v53;
  sub_20D141E6C((uint64_t)v91, 2, (uint64_t)v90);
  v56(v54, v52);
  v58 = (uint64_t (*)(uint64_t, uint64_t))v72;
  ((void (*)(uint64_t, uint64_t))v72)(v57, v43);
  v56(v51, v52);
  return v58(v44, v43);
}

uint64_t sub_20D147150@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
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
  _QWORD v32[2];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE v43[11];
  __int16 v44;
  _BYTE v45[7];
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

  v4 = sub_20D191A60();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *a1;
  v9 = *MEMORY[0x24BDF3C28];
  v37 = *(void (**)(char *))(v8 + 104);
  v37(v6);
  v42 = sub_20D191AD8();
  sub_20D1913E8();
  v10 = v46;
  v11 = v47;
  v12 = v48;
  v40 = v49;
  v13 = v50;
  v36 = sub_20D191CAC();
  v35 = v14;
  v15 = 0;
  v41 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v38 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v34 = v7;
  if ((v7 & 1) == 0)
  {
    ((void (*)(char *, uint64_t, uint64_t))v37)(v6, v9, v4);
    v38 = MEMORY[0x212B9E270](v6, 0.92, 0.92, 0.96, 1.0);
    sub_20D1913E8();
    v16 = v52;
    v41 = v51;
    v17 = v53;
    v18 = v54;
    v19 = v55;
    v21 = sub_20D191CAC();
    v23 = 0x3FE75C28F5C28F5CLL;
    v20 = 256;
    v15 = 2;
  }
  v33 = v23;
  v39 = v22;
  v32[1] = v21;
  v24 = v9;
  v25 = v15;
  v26 = v20;
  ((void (*)(char *, uint64_t, uint64_t))v37)(v6, v24, v4);
  MEMORY[0x212B9E270](v6, 0.92, 0.92, 0.96, 1.0);
  v37 = (void (*)(char *))sub_20D191AB4();
  swift_release();
  *(_DWORD *)(a2 + 9) = *(_DWORD *)v45;
  *(_DWORD *)(a2 + 12) = *(_DWORD *)&v45[3];
  *(_DWORD *)(a2 + 66) = *(_DWORD *)&v43[7];
  *(_WORD *)(a2 + 70) = v44;
  *(_DWORD *)(a2 + 209) = *(_DWORD *)v43;
  *(_DWORD *)(a2 + 212) = *(_DWORD *)&v43[3];
  *(_QWORD *)a2 = v34;
  *(_BYTE *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = v10;
  *(_QWORD *)(a2 + 24) = v11;
  *(_QWORD *)(a2 + 32) = v12;
  *(_QWORD *)(a2 + 40) = v40;
  *(_QWORD *)(a2 + 48) = v13;
  *(_QWORD *)(a2 + 56) = v42;
  *(_WORD *)(a2 + 64) = 256;
  v27 = v35;
  *(_QWORD *)(a2 + 72) = v36;
  *(_QWORD *)(a2 + 80) = v27;
  *(_QWORD *)(a2 + 88) = 0x3FD3333333333333;
  *(_QWORD *)(a2 + 96) = v25;
  v28 = v41;
  *(_QWORD *)(a2 + 104) = 0;
  *(_QWORD *)(a2 + 112) = v28;
  *(_QWORD *)(a2 + 120) = v16;
  *(_QWORD *)(a2 + 128) = v17;
  *(_QWORD *)(a2 + 136) = v18;
  *(_QWORD *)(a2 + 144) = v19;
  *(_QWORD *)(a2 + 152) = v38;
  *(_QWORD *)(a2 + 160) = v26;
  v29 = v39;
  *(_QWORD *)(a2 + 168) = v21;
  *(_QWORD *)(a2 + 176) = v29;
  *(_QWORD *)(a2 + 184) = v33;
  *(_QWORD *)(a2 + 192) = &unk_24C615E78;
  *(_QWORD *)(a2 + 200) = v37;
  *(_BYTE *)(a2 + 208) = 1;
  *(_QWORD *)(a2 + 216) = 0x3FD5C28F5C28F5C3;
  swift_bridgeObjectRetain();
  swift_retain();
  v30 = v41;
  sub_20D14A1B0(v25, 0, v41, v16, v17, v18);
  sub_20D14A2A8(v25, 0, v30, v16, v17, v18);
  swift_release();
  return swift_bridgeObjectRelease();
}

__n128 sub_20D147544@<Q0>(void (**a1)(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  __int128 v4;
  __n128 result;

  v3 = swift_allocObject();
  v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v3 + 32) = v4;
  result = *(__n128 *)(v1 + 32);
  *(__n128 *)(v3 + 48) = result;
  *(_BYTE *)(v3 + 64) = *(_BYTE *)(v1 + 48);
  *a1 = sub_20D149CA0;
  a1[1] = (void (*)(uint64_t@<X0>, uint64_t@<X8>))v3;
  return result;
}

void sub_20D147598(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double *v15;
  uint64_t v16;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8350);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v8 = sub_20D191CAC();
  *((_QWORD *)v8 + 1) = v9;
  *((_QWORD *)v8 + 2) = 0;
  v8[24] = 0;
  *((_QWORD *)v8 + 4) = 0;
  v8[40] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8358);
  sub_20D1476AC(a2, a1);
  sub_20D19146C();
  v11 = (double)*(uint64_t *)(a2 + 24);
  v12 = v10 * -0.5 / v11;
  sub_20D19146C();
  v14 = v13 * -0.5 / v11;
  sub_20D14B85C((uint64_t)v8, a3, &qword_2549A8350);
  v15 = (double *)(a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549A8360) + 36));
  *v15 = v12;
  v15[1] = v14;
  sub_20D14B87C((uint64_t)v8, &qword_2549A8350);
}

uint64_t sub_20D1476AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  __int128 v13;
  _QWORD v14[2];

  v4 = sub_20D191484();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  result = MEMORY[0x24BDAC7A8](v4);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
  {
    __break(1u);
  }
  else if ((v10 & 0x8000000000000000) == 0)
  {
    v14[0] = 0;
    v14[1] = v10;
    swift_getKeyPath();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v4);
    v11 = (*(unsigned __int8 *)(v5 + 80) + 65) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    v12 = swift_allocObject();
    v13 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v12 + 16) = *(_OWORD *)a1;
    *(_OWORD *)(v12 + 32) = v13;
    *(_OWORD *)(v12 + 48) = *(_OWORD *)(a1 + 32);
    *(_BYTE *)(v12 + 64) = *(_BYTE *)(a1 + 48);
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v12 + v11, (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8368);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8370);
    sub_20D149D28();
    sub_20D14B9E8((uint64_t)&unk_2549A8388);
    return sub_20D191BF8();
  }
  __break(1u);
  return result;
}

uint64_t sub_20D14783C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;

  v6 = *a1;
  *(_QWORD *)a4 = 0;
  *(_BYTE *)(a4 + 8) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8370);
  return sub_20D14789C(a2, v6, a3);
}

uint64_t sub_20D14789C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  __int128 v15;
  _QWORD v16[2];

  v6 = sub_20D191484();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  result = MEMORY[0x24BDAC7A8](v6);
  v10 = *(_QWORD *)(a1 + 24);
  v11 = __OFADD__(v10, 1);
  v12 = v10 + 1;
  if (v11)
  {
    __break(1u);
  }
  else if ((v12 & 0x8000000000000000) == 0)
  {
    v16[0] = 0;
    v16[1] = v12;
    swift_getKeyPath();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v6);
    v13 = (*(unsigned __int8 *)(v7 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v14 = swift_allocObject();
    v15 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v14 + 16) = *(_OWORD *)a1;
    *(_OWORD *)(v14 + 32) = v15;
    *(_OWORD *)(v14 + 48) = *(_OWORD *)(a1 + 32);
    *(_BYTE *)(v14 + 64) = *(_BYTE *)(a1 + 48);
    *(_QWORD *)(v14 + 72) = a2;
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v14 + v13, (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8368);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8390);
    sub_20D149D28();
    sub_20D149E54();
    return sub_20D191BF8();
  }
  __break(1u);
  return result;
}

uint64_t sub_20D147A1C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _BOOL8 a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _OWORD *v25;
  __int128 v26;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BOOL8 v37;
  uint64_t v38;
  uint64_t v39;
  _BOOL8 v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  char v49;
  __int128 v50;

  v32 = a4;
  v35 = a5;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A83A0);
  v31 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8400);
  v33 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v29 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *a1;
  v12 = sub_20D147DA0(a3, *a1);
  sub_20D147DD4();
  v14 = v13;
  sub_20D191CAC();
  sub_20D191424();
  LOBYTE(v42) = v12;
  *((_QWORD *)&v42 + 1) = v14;
  *(_QWORD *)&v43 = v46;
  BYTE8(v43) = v47;
  *(_QWORD *)&v44 = v48;
  BYTE8(v44) = v49;
  v45 = v50;
  sub_20D144B1C();
  v39 = a2;
  v40 = a3;
  v41 = v11;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A83B0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A83B8);
  sub_20D14B754((uint64_t)&unk_2549A83C0);
  v18 = v17;
  v19 = sub_20D149FB8();
  sub_20D191A30();
  swift_release();
  sub_20D144B1C();
  v36 = a2;
  v37 = a3;
  v38 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A83A8);
  *(_QWORD *)&v42 = v15;
  *((_QWORD *)&v42 + 1) = v16;
  *(_QWORD *)&v43 = v18;
  *((_QWORD *)&v43 + 1) = v19;
  swift_getOpaqueTypeConformance2();
  sub_20D14A03C();
  v20 = v29;
  v21 = v30;
  sub_20D191A30();
  swift_release();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v21);
  sub_20D19146C();
  sub_20D19146C();
  sub_20D191CAC();
  sub_20D191424();
  v22 = v33;
  v23 = v35;
  v24 = v34;
  (*(void (**)(uint64_t, char *, uint64_t))(v33 + 16))(v35, v20, v34);
  v25 = (_OWORD *)(v23 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549A8390) + 36));
  v26 = v43;
  *v25 = v42;
  v25[1] = v26;
  v25[2] = v44;
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v20, v24);
}

BOOL sub_20D147DA0(_BOOL8 result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(v2 + 24);
  v4 = __OFADD__(v3, 1);
  v5 = v3 + 1;
  if (v4)
  {
    __break(1u);
  }
  else if ((v5 & 1) != 0)
  {
    v6 = v5 / 2;
    return v6 == result && v6 == a2;
  }
  else
  {
    return 0;
  }
  return result;
}

void sub_20D147DD4()
{
  uint64_t v0;
  double v1;

  if ((*(_BYTE *)v0 & 1) != 0)
  {
    v1 = (double)*(uint64_t *)(v0 + 24);
    sub_20D151020(0.0, 0.0, v1, v1);
    sub_20D151020(0.0, 0.0, v1, v1);
    if (*(double *)(v0 + 40) < 0.0)
      __break(1u);
  }
}

void sub_20D147E8C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v19;
  uint64_t v20;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A83B8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(_BYTE *)a2 & 1) == 0)
  {
LABEL_8:
    v17 = 0.0;
LABEL_9:
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A83E0);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v12, a1, v19);
    *(double *)&v12[*(int *)(v10 + 36)] = v17;
    sub_20D14B8A4((uint64_t)v12, a5, &qword_2549A83B8);
    return;
  }
  v13 = *(_QWORD *)(a2 + 24);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (!v14)
  {
    if ((v15 & 1) != 0)
    {
      v16 = v15 / 2;
      v17 = 0.5;
      if (v16 == a3 || v16 == a4)
        goto LABEL_9;
    }
    goto LABEL_8;
  }
  __break(1u);
}

void sub_20D147F90(uint64_t a1@<X0>, _BYTE *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A83A8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2[48] & 1) != 0 && (*a2 & 1) == 0 && (sub_20D148090(a3, a4) & 1) != 0)
    v13 = 0x3FECCCCCCCCCCCCDLL;
  else
    v13 = 0;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A83F8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, a1, v14);
  *(_QWORD *)&v12[*(int *)(v10 + 36)] = v13;
  sub_20D14B8A4((uint64_t)v12, a5, &qword_2549A83A8);
}

uint64_t sub_20D148090(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  double v3;
  double v4;

  if ((*(_BYTE *)v2 & 1) != 0)
    return 0;
  v3 = round(*(double *)(v2 + 8));
  if ((~*(_QWORD *)&v3 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v3 <= -9.22337204e18)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v3 >= 9.22337204e18)
  {
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if ((uint64_t)v3 == a2)
    return 1;
  v4 = round(*(double *)(v2 + 16));
  if ((~*(_QWORD *)&v4 & 0x7FF0000000000000) == 0)
    goto LABEL_15;
  if (v4 <= -9.22337204e18)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v4 < 9.22337204e18)
    return (uint64_t)v4 == result;
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_20D148140()
{
  return sub_20D1919AC();
}

double sub_20D148158@<D0>(void (**a1)(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_20D147544(a1).n128_u64[0];
  return result;
}

uint64_t sub_20D148198@<X0>(char a1@<W0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  double v9;
  uint64_t v16;
  uint64_t v17;
  char v18;
  double v19;
  _OWORD v20[8];
  char v21;
  _BYTE v22[128];
  _OWORD v23[6];
  uint64_t v24;
  char v25;

  v17 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8818);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D148360(a1, (uint64_t)v23);
  v9 = 0.0;
  if (a3 >= 0.0)
    v9 = a3;
  if (a3 > 1.0)
    v9 = 1.0;
  v21 = v25;
  v20[0] = v23[0];
  v20[1] = v23[1];
  v20[2] = v23[2];
  v20[3] = v23[3];
  v20[4] = v23[4];
  v20[5] = v23[5];
  *(_QWORD *)&v20[6] = v24;
  BYTE8(v20[6]) = v25;
  __asm { FMOV            V2.2D, #0.5 }
  v20[7] = vmlaq_n_f64((float64x2_t)xmmword_20D1952F0, _Q2, v9);
  sub_20D1484F0();
  v18 = a1;
  v19 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8820);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8828);
  sub_20D14B754((uint64_t)&unk_2549A8830);
  sub_20D14B2B8();
  sub_20D191A30();
  swift_release();
  memcpy(v22, v20, sizeof(v22));
  sub_20D14B33C((uint64_t)v22);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(v17, v8, v5);
}

double sub_20D148360@<D0>(char a1@<W0>, uint64_t a2@<X8>)
{
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  char v12;

  sub_20D191AA8();
  if ((a1 & 1) != 0)
  {
    sub_20D191AB4();
    swift_release();
    sub_20D1913E8();
    sub_20D191CAC();
    sub_20D191D60();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8870);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8890);
  sub_20D14B234();
  sub_20D14B9E8((uint64_t)&unk_2549A8888);
  sub_20D1917C0();
  result = *(double *)&v5;
  *(_OWORD *)a2 = v5;
  *(_OWORD *)(a2 + 16) = v6;
  *(_OWORD *)(a2 + 32) = v7;
  *(_OWORD *)(a2 + 48) = v8;
  *(_OWORD *)(a2 + 64) = v9;
  *(_OWORD *)(a2 + 80) = v10;
  *(_QWORD *)(a2 + 96) = v11;
  *(_BYTE *)(a2 + 104) = v12;
  return result;
}

uint64_t sub_20D1484F0()
{
  return sub_20D191CF4();
}

uint64_t sub_20D148548@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>, double a4@<D0>)
{
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  double *v13;

  v6 = sub_20D1485D0(a2, a4);
  sub_20D191D60();
  v8 = v7;
  v10 = v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A88A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a3, a1, v11);
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8828);
  v13 = (double *)(a3 + *(int *)(result + 36));
  *v13 = v6;
  v13[1] = v6;
  *((_QWORD *)v13 + 2) = v8;
  *((_QWORD *)v13 + 3) = v10;
  return result;
}

double sub_20D1485D0(int a1, double a2)
{
  double v2;
  double v3;
  _BOOL4 v4;
  double result;

  v2 = -0.1;
  if (a2 >= -0.1)
    v2 = a2;
  if (a2 > 1.0)
    v2 = 1.0;
  v3 = v2 * 3.5 + 1.0;
  if (v3 < 0.0)
    v3 = 0.0;
  v4 = a2 > 0.0;
  result = v3 * 0.5;
  if (v3 * 0.5 < 1.0)
    result = 1.0;
  if ((v4 & a1) == 0)
    return v3;
  return result;
}

uint64_t sub_20D148624@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_20D148198(*(_BYTE *)v1, a1, *(double *)(v1 + 8));
}

double sub_20D148630@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  __int128 v4;
  char v5;

  sub_20D191910();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_20D14868C(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v7;
  uint64_t v13;
  uint64_t result;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v7 = a6 + 1;
  if (__OFADD__(a6, 1))
  {
    __break(1u);
    goto LABEL_12;
  }
  if (v7 < 0)
  {
LABEL_12:
    __break(1u);
    return result;
  }
  if (a6 != -1)
  {
    v13 = 0;
    do
    {
      if ((a7 & 1) != 0 || v13 && a6 != v13)
      {
        v16.origin.x = a1;
        v16.origin.y = a2;
        v16.size.width = a3;
        v16.size.height = a4;
        CGRectGetWidth(v16);
        v17.origin.x = a1;
        v17.origin.y = a2;
        v17.size.width = a3;
        v17.size.height = a4;
        CGRectGetHeight(v17);
        v18.origin.x = a1;
        v18.origin.y = a2;
        v18.size.width = a3;
        v18.size.height = a4;
        CGRectGetMinX(v18);
        sub_20D1918F8();
        v19.origin.x = a1;
        v19.origin.y = a2;
        v19.size.width = a3;
        v19.size.height = a4;
        CGRectGetMaxX(v19);
        sub_20D191904();
        v20.origin.x = a1;
        v20.origin.y = a2;
        v20.size.width = a3;
        v20.size.height = a4;
        CGRectGetMinY(v20);
        sub_20D1918F8();
        v21.origin.x = a1;
        v21.origin.y = a2;
        v21.size.width = a3;
        v21.size.height = a4;
        CGRectGetMaxY(v21);
        result = sub_20D191904();
      }
      ++v13;
    }
    while (v7 != v13);
  }
  return result;
}

double sub_20D1487E0@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  _OWORD v4[2];
  char v5;

  sub_20D148630((uint64_t)v4);
  result = *(double *)v4;
  v3 = v4[1];
  *(_OWORD *)a1 = v4[0];
  *(_OWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_20D148830()
{
  return sub_20D191B38();
}

uint64_t sub_20D148848()
{
  uint64_t v0;

  return nullsub_1(*(_QWORD *)v0, *(unsigned __int8 *)(v0 + 8));
}

void (*sub_20D148858(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_20D191358();
  return sub_20D1488B4;
}

void sub_20D1488B4(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_20D1488E4()
{
  sub_20D14B8F0();
  return sub_20D191B74();
}

uint64_t sub_20D148934()
{
  sub_20D14B8F0();
  return sub_20D191B44();
}

uint64_t sub_20D148984()
{
  sub_20D14B8F0();
  return sub_20D191B5C();
}

uint64_t sub_20D1489BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t (**a4)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v8;

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  *(_BYTE *)(v8 + 32) = a3;
  *a4 = sub_20D14B3EC;
  a4[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v8;
  swift_bridgeObjectRetain();
  return swift_retain();
}

uint64_t sub_20D148A20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[2];

  v18[0] = a5;
  v9 = sub_20D191484();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v12 = swift_bridgeObjectRetain();
  v13 = sub_20D14B3F8(v12);
  swift_bridgeObjectRelease();
  v18[1] = v13;
  swift_getKeyPath();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  v14 = (*(unsigned __int8 *)(v10 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a2;
  *(_QWORD *)(v15 + 24) = a3;
  *(_BYTE *)(v15 + 32) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v15 + v14, (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = sub_20D14B5E0;
  *(_QWORD *)(v16 + 24) = v15;
  swift_bridgeObjectRetain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A88B0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A88B8);
  sub_20D14B9E8((uint64_t)&unk_2549A88C0);
  sub_20D14B684((uint64_t)&unk_2549A88C8);
  return sub_20D191BF8();
}

uint64_t sub_20D148BFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>, double a7@<D0>)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(void);
  char *v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  char v43;
  uint64_t result;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  void (*v72)(char *, uint64_t);
  CGFloat MidX;
  double v74;
  CGFloat v75;
  double v76;
  CGFloat v77;
  double v78;
  CGFloat v79;
  double v80;
  CGFloat v81;
  CGFloat MidY;
  uint64_t v83;
  CGFloat *v84;
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
  __int128 v96;
  __int128 v97;
  uint64_t v98;
  CGRect v99;
  CGRect v100;

  v92 = a3;
  v93 = a5;
  v94 = a2;
  v95 = a1;
  v10 = sub_20D1917D8();
  v91 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v86 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_20D1915D4();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (double *)((char *)&v86 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8908);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v86 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A88F8);
  MEMORY[0x24BDAC7A8](v89);
  v20 = (char *)&v86 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A88E8);
  MEMORY[0x24BDAC7A8](v90);
  v22 = (char *)&v86 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A88D8);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v86 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a4 & 1) != 0)
  {
    v27 = *(_QWORD *)(v94 + 16);
    v28 = v27 != 0;
    v29 = v27 - 1;
    if (v28 && v29 == v95)
      return __swift_storeEnumTagSinglePayload(a6, 1, 1, v24);
  }
  v87 = v24;
  v88 = a6;
  v31 = (char *)v15 + *(int *)(v13 + 20);
  v32 = *MEMORY[0x24BDEEB68];
  v33 = sub_20D191748();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 104))(v31, v32, v33);
  *v15 = a7;
  v15[1] = a7;
  v34 = v92;
  swift_retain();
  sub_20D1913E8();
  v35 = MEMORY[0x24BDED998];
  sub_20D14A880((uint64_t)v15, (uint64_t)v18, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  v36 = &v18[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549A8918) + 36)];
  v37 = v97;
  *(_OWORD *)v36 = v96;
  *((_OWORD *)v36 + 1) = v37;
  *((_QWORD *)v36 + 4) = v98;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8920);
  *(_QWORD *)&v18[*(int *)(v38 + 52)] = v34;
  *(_WORD *)&v18[*(int *)(v38 + 56)] = 256;
  v39 = sub_20D191CAC();
  v41 = v40;
  v42 = (uint64_t *)&v18[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549A8928) + 36)];
  *v42 = v39;
  v42[1] = v41;
  sub_20D14A8AC((uint64_t)v15, (uint64_t (*)(_QWORD))v35);
  v43 = sub_20D191898();
  result = sub_20D19146C();
  if (__OFSUB__(*(_QWORD *)(v94 + 16) - 1, v95))
  {
    __break(1u);
  }
  else
  {
    sub_20D191370();
    v46 = v45;
    v48 = v47;
    v50 = v49;
    v52 = v51;
    sub_20D14B85C((uint64_t)v18, (uint64_t)v20, &qword_2549A8908);
    v53 = &v20[*(int *)(v89 + 36)];
    *v53 = v43;
    *((_QWORD *)v53 + 1) = v46;
    *((_QWORD *)v53 + 2) = v48;
    *((_QWORD *)v53 + 3) = v50;
    *((_QWORD *)v53 + 4) = v52;
    v53[40] = 0;
    sub_20D14B87C((uint64_t)v18, &qword_2549A8908);
    v54 = sub_20D1918BC();
    sub_20D19146C();
    sub_20D191370();
    v56 = v55;
    v58 = v57;
    v60 = v59;
    v62 = v61;
    sub_20D14B85C((uint64_t)v20, (uint64_t)v22, &qword_2549A88F8);
    v63 = &v22[*(int *)(v90 + 36)];
    *v63 = v54;
    *((_QWORD *)v63 + 1) = v56;
    *((_QWORD *)v63 + 2) = v58;
    *((_QWORD *)v63 + 3) = v60;
    *((_QWORD *)v63 + 4) = v62;
    v63[40] = 0;
    sub_20D14B87C((uint64_t)v20, &qword_2549A88F8);
    sub_20D191808();
    sub_20D191478();
    v65 = v64;
    v67 = v66;
    v69 = v68;
    v71 = v70;
    v72 = *(void (**)(char *, uint64_t))(v91 + 8);
    v72(v12, v10);
    v99.origin.x = v65;
    v99.origin.y = v67;
    v99.size.width = v69;
    v99.size.height = v71;
    MidX = CGRectGetMidX(v99);
    sub_20D191808();
    sub_20D191478();
    v75 = v74;
    v77 = v76;
    v79 = v78;
    v81 = v80;
    v72(v12, v10);
    v100.origin.x = v75;
    v100.origin.y = v77;
    v100.size.width = v79;
    v100.size.height = v81;
    MidY = CGRectGetMidY(v100);
    sub_20D14B85C((uint64_t)v22, (uint64_t)v26, &qword_2549A88E8);
    v83 = v87;
    v84 = (CGFloat *)&v26[*(int *)(v87 + 36)];
    *v84 = MidX;
    v84[1] = MidY;
    sub_20D14B87C((uint64_t)v22, &qword_2549A88E8);
    v85 = v88;
    sub_20D14B8A4((uint64_t)v26, v88, &qword_2549A88D8);
    return __swift_storeEnumTagSinglePayload(v85, 0, 1, v83);
  }
  return result;
}

uint64_t sub_20D149130@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v1;

  return sub_20D1489BC(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_BYTE *)(v1 + 16), a1);
}

uint64_t sub_20D14913C@<X0>(void *a1@<X0>, void *a2@<X1>, int a3@<W2>, uint64_t *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;

  *a4 = sub_20D191CAC();
  a4[1] = v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8450);
  return sub_20D149198(a1, a2, a3, (uint64_t)a4 + *(int *)(v9 + 44));
}

uint64_t sub_20D149198@<X0>(void *a1@<X0>, void *a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t);
  void (*v30)(char *, uint64_t);
  id v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  _QWORD v42[4];
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  int v50;

  v50 = a3;
  v47 = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8458);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_20D1915E0();
  MEMORY[0x24BDAC7A8](v9);
  v46 = (char *)v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_20D191D24();
  v44 = *(_QWORD *)(v11 - 8);
  v45 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v43 = (char *)v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8460);
  MEMORY[0x24BDAC7A8](v48);
  v14 = (char *)v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8468);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v49 = (uint64_t)v42 - v19;
  v20 = sub_20D191B14();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)v42 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8470);
  MEMORY[0x24BDAC7A8](v24);
  v27 = (_QWORD *)((char *)v42 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a1)
  {
    v42[1] = v25;
    v42[2] = v6;
    v42[3] = a4;
    v47 = a1;
    sub_20D191AF0();
    v28 = *MEMORY[0x24BDF3FD0];
    v29 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 104);
    v29(v23, v28, v20);
    v42[0] = sub_20D191B2C();
    swift_release();
    v30 = *(void (**)(char *, uint64_t))(v21 + 8);
    v30(v23, v20);
    if ((v50 & 1) != 0)
    {
      v31 = v47;
      sub_20D191AF0();
      v29(v23, v28, v20);
      v32 = sub_20D191B2C();
      swift_release();
      v30(v23, v20);
      v33 = v43;
      v34 = v44;
      v35 = v45;
      (*(void (**)(char *, _QWORD, uint64_t))(v44 + 104))(v43, *MEMORY[0x24BDF50D8], v45);
      v36 = (uint64_t)v46;
      (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v46, v33, v35);
      v37 = v48;
      sub_20D14A880(v36, (uint64_t)&v14[*(int *)(v48 + 36)], (uint64_t (*)(_QWORD))MEMORY[0x24BDEDB60]);
      *(_QWORD *)v14 = v32;
      *((_WORD *)v14 + 4) = 0;
      swift_retain();
      sub_20D14A8AC(v36, (uint64_t (*)(_QWORD))MEMORY[0x24BDEDB60]);
      (*(void (**)(char *, uint64_t))(v34 + 8))(v33, v35);
      swift_release();
      v38 = v49;
      sub_20D14B8A4((uint64_t)v14, v49, &qword_2549A8460);
      v39 = 0;
    }
    else
    {
      v39 = 1;
      v37 = v48;
      v38 = v49;
    }
    __swift_storeEnumTagSinglePayload(v38, v39, 1, v37);
    sub_20D14B85C(v38, (uint64_t)v18, &qword_2549A8468);
    *(_QWORD *)v8 = v42[0];
    *((_WORD *)v8 + 4) = 0;
    v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8480);
    sub_20D14B85C((uint64_t)v18, (uint64_t)&v8[*(int *)(v41 + 48)], &qword_2549A8468);
    swift_retain_n();
    sub_20D14B87C((uint64_t)v18, &qword_2549A8468);
    swift_release();
    sub_20D14B85C((uint64_t)v8, (uint64_t)v27, &qword_2549A8458);
    swift_storeEnumTagMultiPayload();
    sub_20D14B9E8((uint64_t)&unk_2549A8478);
    sub_20D1917C0();

    sub_20D14B87C((uint64_t)v8, &qword_2549A8458);
    sub_20D14B87C(v38, &qword_2549A8468);
    return swift_release();
  }
  else
  {
    *v27 = v47;
    swift_storeEnumTagMultiPayload();
    sub_20D14B9E8((uint64_t)&unk_2549A8478);
    swift_retain();
    return sub_20D1917C0();
  }
}

uint64_t sub_20D14969C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_20D14913C(*(void **)v1, *(void **)(v1 + 8), *(unsigned __int8 *)(v1 + 16), a1);
}

uint64_t sub_20D1496A8(uint64_t a1)
{
  MEMORY[0x212B9F008](&unk_20D195680, a1);
  return sub_20D191310();
}

uint64_t sub_20D1496E4()
{
  MEMORY[0x212B9F008](&unk_20D195680);
  return sub_20D191304();
}

uint64_t sub_20D14972C(uint64_t a1, uint64_t a2)
{
  sub_20D191F58();
  MEMORY[0x212B9F008](&unk_20D195680, a2);
  sub_20D191304();
  return sub_20D191F70();
}

void sub_20D149784()
{
  uint64_t *v0;

  sub_20D149B9C(*v0, (void (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_20D1497A8(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_20D191E20();
  *a2 = 0;
  return result;
}

uint64_t sub_20D149820(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_20D191E2C();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_20D14989C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_20D1498C0();
  *a1 = result;
  return result;
}

uint64_t sub_20D1498C0()
{
  uint64_t v0;

  sub_20D191E38();
  v0 = sub_20D191E14();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_20D1498F4()
{
  return sub_20D152308();
}

uint64_t sub_20D149900(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x212B9F008](&unk_20D195680, a3);
  return sub_20D1912F8();
}

void sub_20D14994C()
{
  sub_20D145754((uint64_t)&unk_2549A8318);
}

void sub_20D149978()
{
  sub_20D145754((uint64_t)&unk_2549A8320);
}

uint64_t sub_20D1499A4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D1499B4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D1499E8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D1499F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D149A08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_20D191E14();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_20D149A4C@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_20D152384(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_20D149A74()
{
  sub_20D145754((uint64_t)&unk_2549A8340);
  sub_20D145754((uint64_t)&unk_2549A8348);
  return sub_20D191F04();
}

void sub_20D149AF8()
{
  sub_20D145754((uint64_t)&unk_2549A8328);
}

void sub_20D149B24()
{
  sub_20D145754((uint64_t)&unk_2549A8330);
}

void sub_20D149B50()
{
  sub_20D145754((uint64_t)&unk_2549A8338);
}

void sub_20D149B7C()
{
  uint64_t *v0;

  sub_20D149B9C(*v0, MEMORY[0x24BEE0CD8]);
}

void sub_20D149B9C(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3;

  v3 = sub_20D191E38();
  a2(v3);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1();
}

uint64_t sub_20D149BD0()
{
  return sub_20D149BD8();
}

uint64_t sub_20D149BD8()
{
  sub_20D191E38();
  sub_20D191E44();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20D149C18()
{
  return sub_20D149C20();
}

uint64_t sub_20D149C20()
{
  uint64_t v0;

  sub_20D191E38();
  sub_20D191F58();
  sub_20D191E44();
  v0 = sub_20D191F70();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_20D149C90()
{
  return swift_deallocObject();
}

void sub_20D149CA0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  sub_20D147598(a1, v2 + 16, a2);
}

uint64_t sub_20D149CA8()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(*(_QWORD *)(v0 - 8));
  return OUTLINED_FUNCTION_7();
}

uint64_t sub_20D149CE4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_4() - 8) + 80);
  return sub_20D14783C(v0, v1 + 16, v1 + ((v3 + 65) & ~v3), v2);
}

unint64_t sub_20D149D28()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_2549A8378;
  if (!qword_2549A8378)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8368);
    v2 = sub_20D149D94();
    v3[0] = MEMORY[0x24BEE17A8];
    v3[1] = v2;
    result = MEMORY[0x212B9F008](MEMORY[0x24BEE1BD0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2549A8378);
  }
  return result;
}

unint64_t sub_20D149D94()
{
  unint64_t result;

  result = qword_2549A8380;
  if (!qword_2549A8380)
  {
    result = MEMORY[0x212B9F008](MEMORY[0x24BEE1790], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_2549A8380);
  }
  return result;
}

uint64_t sub_20D149DD0()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(*(_QWORD *)(v0 - 8));
  return OUTLINED_FUNCTION_7();
}

uint64_t sub_20D149E0C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_4() - 8) + 80);
  return sub_20D147A1C(v0, v1 + 16, *(_QWORD *)(v1 + 72), v1 + ((v3 + 80) & ~v3), v2);
}

unint64_t sub_20D149E54()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[6];

  result = qword_2549A8398;
  if (!qword_2549A8398)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8390);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A83A0);
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A83A8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A83B0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A83B8);
    v4 = MEMORY[0x24BDEBEE0];
    sub_20D14B754((uint64_t)&unk_2549A83C0);
    sub_20D149FB8();
    v5[2] = v2;
    v5[3] = v3;
    v5[4] = swift_getOpaqueTypeConformance2();
    v5[5] = sub_20D14A03C();
    v5[0] = swift_getOpaqueTypeConformance2();
    v5[1] = v4;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2549A8398);
  }
  return result;
}

unint64_t sub_20D149F7C()
{
  unint64_t result;

  result = qword_2549A83C8;
  if (!qword_2549A83C8)
  {
    result = MEMORY[0x212B9F008](&unk_20D195AC4, &type metadata for PhotoStyleDPad.GridDot);
    atomic_store(result, (unint64_t *)&qword_2549A83C8);
  }
  return result;
}

unint64_t sub_20D149FB8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2549A83D0;
  if (!qword_2549A83D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A83B8);
    sub_20D14B9E8((uint64_t)&unk_2549A83D8);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDEE7D8];
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2549A83D0);
  }
  return result;
}

unint64_t sub_20D14A03C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2549A83E8;
  if (!qword_2549A83E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A83A8);
    sub_20D14B9E8((uint64_t)&unk_2549A83F0);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDEE7D8];
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2549A83E8);
  }
  return result;
}

void sub_20D14A0C0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  sub_20D147E8C(a1, v2[2], v2[3], v2[4], a2);
}

void sub_20D14A0CC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  sub_20D147F90(a1, *(_BYTE **)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), a2);
}

uint64_t sub_20D14A0D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_20D146A50(*(uint64_t **)(v1 + 32), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

_QWORD *sub_20D14A0E4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v2 = a1[14];
  v7 = a1[13];
  v8 = a1[12];
  v3 = a1[15];
  v4 = a1[16];
  v5 = a1[17];
  swift_bridgeObjectRetain();
  swift_retain();
  sub_20D14A1B0(v8, v7, v2, v3, v4, v5);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_20D14A1B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;

  if (a6)
  {
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

_QWORD *sub_20D14A1E0(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v7 = a1[13];
  v8 = a1[12];
  v2 = a1[15];
  v6 = a1[14];
  v3 = a1[16];
  v4 = a1[17];
  swift_release();
  swift_bridgeObjectRelease();
  sub_20D14A2A8(v8, v7, v6, v2, v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_20D14A2A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;

  if (a6)
  {
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

unint64_t sub_20D14A2D8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2549A8418;
  if (!qword_2549A8418)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8420);
    sub_20D14A364((uint64_t)&unk_2549A8428);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDF0390];
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2549A8418);
  }
  return result;
}

void sub_20D14A364(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;

  if (!OUTLINED_FUNCTION_12(a1))
  {
    OUTLINED_FUNCTION_2(0, v2);
    sub_20D14B9E8(v1);
    OUTLINED_FUNCTION_16();
  }
  OUTLINED_FUNCTION_5();
}

void sub_20D14A3C0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  sub_20D140A40(a1, v2 + 16, a2);
}

BOOL sub_20D14A3CC(double *a1, double *a2)
{
  uint64_t v2;

  return sub_20D143360(a1, a2, (_OWORD *)(v2 + 16));
}

unint64_t sub_20D14A3D4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_2549A8580;
  if (!qword_2549A8580)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8578);
    sub_20D14A364((uint64_t)&unk_2549A8588);
    v3 = v2;
    sub_20D14B9E8((uint64_t)&unk_2549A85A8);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2549A8580);
  }
  return result;
}

uint64_t sub_20D14A478(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return a1;
}

id *sub_20D14A4EC(id *a1)
{
  id v2;

  v2 = *a1;
  return a1;
}

uint64_t sub_20D14A514()
{
  return objectdestroy_10Tm();
}

void sub_20D14A51C(uint64_t a1)
{
  double *v1;

  sub_20D14422C(a1, (uint64_t)(v1 + 2), v1[41], v1[42], v1[43], v1[44], v1[45], v1[46]);
}

unint64_t sub_20D14A530()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2549A85F0;
  if (!qword_2549A85F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A85F8);
    sub_20D145754((uint64_t)&unk_2549A8600);
    v3[0] = MEMORY[0x24BEE1340];
    v3[1] = v2;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED490], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2549A85F0);
  }
  return result;
}

uint64_t sub_20D14A5B8(uint64_t a1)
{
  uint64_t v1;

  return sub_20D144A1C(a1, v1 + 16);
}

uint64_t sub_20D14A5C0(__int128 *a1, uint64_t a2)
{
  __int128 v2;

  v2 = *a1;
  *(_WORD *)(a2 + 16) = *((_WORD *)a1 + 8);
  *(_OWORD *)a2 = v2;
  return a2;
}

uint64_t sub_20D14A5D8()
{
  uint64_t v0;

  return sub_20D144B74(*(_QWORD *)(v0 + 16));
}

uint64_t sub_20D14A5F0()
{
  return sub_20D144844();
}

unint64_t sub_20D14A608()
{
  unint64_t result;

  result = qword_2549A8610;
  if (!qword_2549A8610)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2549A8610);
  }
  return result;
}

uint64_t objectdestroy_10Tm()
{
  uint64_t v0;

  swift_release();
  OUTLINED_FUNCTION_11();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

_QWORD *sub_20D14A6BC()
{
  return sub_20D1448A0();
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

uint64_t sub_20D14A6DC()
{
  uint64_t v0;

  return sub_20D144950(*(double **)(v0 + 16));
}

uint64_t sub_20D14A6FC(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_20D14A744(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

unint64_t sub_20D14A78C()
{
  unint64_t result;

  result = qword_2549A8678;
  if (!qword_2549A8678)
  {
    result = MEMORY[0x212B9F008](&unk_20D19574C, &type metadata for PhotoStyleDPad.DottedGrid);
    atomic_store(result, (unint64_t *)&qword_2549A8678);
  }
  return result;
}

unint64_t sub_20D14A7C8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];

  result = qword_2549A8688;
  if (!qword_2549A8688)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8650);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8668);
    sub_20D14B754((uint64_t)&unk_2549A8670);
    v4 = v3;
    v5[2] = v2;
    v5[3] = v3;
    v5[0] = swift_getOpaqueTypeConformance2();
    v5[1] = v4;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDEF3E0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2549A8688);
  }
  return result;
}

void sub_20D14A880(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = a3(0);
  OUTLINED_FUNCTION_6(v3);
  OUTLINED_FUNCTION_1();
}

void sub_20D14A8AC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_10(v2);
  OUTLINED_FUNCTION_1();
}

unint64_t sub_20D14A8D4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_2549A8710;
  if (!qword_2549A8710)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8708);
    sub_20D14B9E8((uint64_t)&unk_2549A8718);
    v3 = v2;
    sub_20D14B9E8((uint64_t)&unk_2549A8728);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2549A8710);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x212B9EF84](a1, v6, a5);
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_20D14A9B0(a1, &qword_2549A8758);
}

void sub_20D14A9B0(uint64_t a1, unint64_t *a2)
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

uint64_t getEnumTagSinglePayload for PhotoStyleDPad.GridDot(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  unsigned int v3;
  BOOL v4;

  if (a2)
  {
    if (a2 >= 0xFF && a1[16])
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

uint64_t storeEnumTagSinglePayload for PhotoStyleDPad.GridDot(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotoStyleDPad.GridDot()
{
  return &type metadata for PhotoStyleDPad.GridDot;
}

uint64_t destroy for PhotoStyleDPad.CoaxialRoundedRectangles()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

void _s12PhotosUIEdit14PhotoStyleDPadV24CoaxialRoundedRectanglesVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_retain();
  OUTLINED_FUNCTION_1();
}

uint64_t assignWithCopy for PhotoStyleDPad.CoaxialRoundedRectangles(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for PhotoStyleDPad.CoaxialRoundedRectangles(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotoStyleDPad.CoaxialRoundedRectangles(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 17))
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

uint64_t storeEnumTagSinglePayload for PhotoStyleDPad.CoaxialRoundedRectangles(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotoStyleDPad.CoaxialRoundedRectangles()
{
  return &type metadata for PhotoStyleDPad.CoaxialRoundedRectangles;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for PhotoStyleDPad.GridLines(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;
  BOOL v4;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for PhotoStyleDPad.GridLines(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_BYTE *)(result + 8) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotoStyleDPad.GridLines()
{
  return &type metadata for PhotoStyleDPad.GridLines;
}

unint64_t sub_20D14ACE4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_2549A8760;
  if (!qword_2549A8760)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8768);
    sub_20D14B754((uint64_t)&unk_2549A8770);
    v3 = v2;
    sub_20D14B9E8((uint64_t)&unk_2549A87B0);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2549A8760);
  }
  return result;
}

void sub_20D14AD88()
{
  sub_20D14B754((uint64_t)&unk_2549A8780);
}

unint64_t sub_20D14ADAC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2549A8790;
  if (!qword_2549A8790)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8798);
    sub_20D14B9E8((uint64_t)&unk_2549A87A0);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDEE7D8];
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2549A8790);
  }
  return result;
}

void sub_20D14AE30()
{
  sub_20D14B9E8((uint64_t)&unk_2549A87C0);
}

uint64_t sub_20D14AE5C()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8408);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  sub_20D1913F4();
  sub_20D19152C();
  sub_20D1917F0();
  sub_20D1915E0();
  sub_20D19152C();
  swift_getTupleTypeMetadata2();
  v0 = sub_20D191D30();
  MEMORY[0x212B9F008](MEMORY[0x24BDF5428], v0);
  v1 = sub_20D191BC8();
  return MEMORY[0x212B9F008](MEMORY[0x24BDF4750], v1);
}

void sub_20D14AFB4()
{
  sub_20D14B9E8((uint64_t)&unk_2549A87D0);
}

void sub_20D14AFE0()
{
  sub_20D14B9E8((uint64_t)&unk_2549A87E0);
}

void sub_20D14B00C()
{
  sub_20D14B9E8((uint64_t)&unk_2549A87F0);
}

unint64_t sub_20D14B03C()
{
  unint64_t result;

  result = qword_2549A8800;
  if (!qword_2549A8800)
  {
    result = MEMORY[0x212B9F008](MEMORY[0x24BDEEF18], MEMORY[0x24BDEEF38]);
    atomic_store(result, (unint64_t *)&qword_2549A8800);
  }
  return result;
}

unint64_t sub_20D14B07C()
{
  unint64_t result;

  result = qword_2549A8808;
  if (!qword_2549A8808)
  {
    result = MEMORY[0x212B9F008](&unk_20D1959D4, &type metadata for PhotoStyleDPad.GridLines);
    atomic_store(result, (unint64_t *)&qword_2549A8808);
  }
  return result;
}

unint64_t sub_20D14B0BC()
{
  unint64_t result;

  result = qword_2549A8810;
  if (!qword_2549A8810)
  {
    result = MEMORY[0x212B9F008](&unk_20D195984, &type metadata for PhotoStyleDPad.GridLines);
    atomic_store(result, (unint64_t *)&qword_2549A8810);
  }
  return result;
}

uint64_t sub_20D14B0F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D14B108()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D14B118@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_20D148548(a1, *(unsigned __int8 *)(v2 + 16), a2, *(double *)(v2 + 24));
}

unint64_t sub_20D14B124()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2549A8838;
  if (!qword_2549A8838)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8840);
    sub_20D14B684((uint64_t)&unk_2549A8848);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDECC38];
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2549A8838);
  }
  return result;
}

unint64_t sub_20D14B1B0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2549A8858;
  if (!qword_2549A8858)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8860);
    v2 = sub_20D14B234();
    sub_20D14B9E8((uint64_t)&unk_2549A8888);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDEF3E0], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2549A8858);
  }
  return result;
}

unint64_t sub_20D14B234()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2549A8868;
  if (!qword_2549A8868)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8870);
    sub_20D14B9E8((uint64_t)&unk_2549A8878);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDEBF50];
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2549A8868);
  }
  return result;
}

unint64_t sub_20D14B2B8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2549A8898;
  if (!qword_2549A8898)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8828);
    sub_20D14B9E8((uint64_t)&unk_2549A88A0);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDEBF50];
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2549A8898);
  }
  return result;
}

uint64_t sub_20D14B33C(uint64_t a1)
{
  sub_20D14B394(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_BYTE *)(a1 + 104));
  return a1;
}

uint64_t sub_20D14B394(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  if ((a14 & 1) == 0)
    swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_20D14B3C4()
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11();
  return swift_deallocObject();
}

uint64_t sub_20D14B3EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_20D148A20(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_BYTE *)(v2 + 32), a2);
}

uint64_t sub_20D14B3F8(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

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
      if (!v4)
      {
        v8 = v2[3];
        if ((uint64_t)((v8 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_26;
        v9 = v8 & 0xFFFFFFFFFFFFFFFELL;
        if (v9 <= 1)
          v10 = 1;
        else
          v10 = v9;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8930);
        v11 = (_QWORD *)swift_allocObject();
        v12 = (uint64_t)(_swift_stdlib_malloc_size(v11) - 32) / 16;
        v11[2] = v10;
        v11[3] = 2 * v12;
        v13 = (unint64_t)(v11 + 4);
        v14 = v2[3];
        v15 = v14 >> 1;
        if (v2[2])
        {
          if (v11 != v2 || v13 >= (unint64_t)&v2[2 * v15 + 4])
            memmove(v11 + 4, v2 + 4, 16 * v15);
          v2[2] = 0;
        }
        v6 = (_QWORD *)(v13 + 16 * v15);
        v4 = (v12 & 0x7FFFFFFFFFFFFFFFLL) - (v14 >> 1);
        result = swift_release();
        v2 = v11;
      }
      v17 = __OFSUB__(v4--, 1);
      if (v17)
        break;
      *v6 = v5;
      v6[1] = v7;
      v6 += 2;
      if (v1 == ++v5)
      {
        result = swift_bridgeObjectRelease();
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v4 = 0;
LABEL_21:
  v18 = v2[3];
  if (v18 < 2)
    return (uint64_t)v2;
  v19 = v18 >> 1;
  v17 = __OFSUB__(v19, v4);
  v20 = v19 - v4;
  if (!v17)
  {
    v2[2] = v20;
    return (uint64_t)v2;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_20D14B56C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = OUTLINED_FUNCTION_8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_20D14B5E0(double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_4() - 8) + 80);
  return sub_20D148BFC(v1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_BYTE *)(v2 + 32), v2 + ((v5 + 33) & ~v5), v3, a1);
}

uint64_t sub_20D14B638()
{
  OUTLINED_FUNCTION_11();
  return swift_deallocObject();
}

uint64_t sub_20D14B658(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, double))(v1 + 16))(*(_QWORD *)a1, *(double *)(a1 + 8));
}

void sub_20D14B684(uint64_t a1)
{
  void (*v1)(void);
  uint64_t *v2;

  if (!OUTLINED_FUNCTION_12(a1))
  {
    OUTLINED_FUNCTION_2(0, v2);
    v1();
    OUTLINED_FUNCTION_16();
  }
  OUTLINED_FUNCTION_5();
}

unint64_t sub_20D14B6C8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2549A88D0;
  if (!qword_2549A88D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A88D8);
    sub_20D14B754((uint64_t)&unk_2549A88E0);
    v3[0] = v2;
    v3[1] = sub_20D14B820();
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2549A88D0);
  }
  return result;
}

void sub_20D14B754(uint64_t a1)
{
  void (*v1)(void);
  uint64_t *v2;

  if (!OUTLINED_FUNCTION_12(a1))
  {
    OUTLINED_FUNCTION_2(0, v2);
    v1();
    OUTLINED_FUNCTION_16();
  }
  OUTLINED_FUNCTION_5();
}

unint64_t sub_20D14B79C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2549A88F0;
  if (!qword_2549A88F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A88F8);
    sub_20D14B9E8((uint64_t)&unk_2549A8900);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2549A88F0);
  }
  return result;
}

unint64_t sub_20D14B820()
{
  unint64_t result;

  result = qword_2549A8910;
  if (!qword_2549A8910)
  {
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED5C0], MEMORY[0x24BDED5D0]);
    atomic_store(result, (unint64_t *)&qword_2549A8910);
  }
  return result;
}

void sub_20D14B85C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_13(a1, a2, a3);
  OUTLINED_FUNCTION_6(v3);
  OUTLINED_FUNCTION_1();
}

void sub_20D14B87C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_10(v2);
  OUTLINED_FUNCTION_1();
}

void sub_20D14B8A4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = OUTLINED_FUNCTION_13(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

uint64_t sub_20D14B8DC(uint64_t a1)
{
  uint64_t v1;

  return sub_20D14868C(*(CGFloat *)(v1 + 32), *(CGFloat *)(v1 + 40), *(CGFloat *)(v1 + 48), *(CGFloat *)(v1 + 56), a1, *(_QWORD *)(v1 + 16), *(_BYTE *)(v1 + 24));
}

unint64_t sub_20D14B8F0()
{
  unint64_t result;

  result = qword_2549A8938;
  if (!qword_2549A8938)
  {
    result = MEMORY[0x212B9F008](&unk_20D195A24, &type metadata for PhotoStyleDPad.GridLines);
    atomic_store(result, (unint64_t *)&qword_2549A8938);
  }
  return result;
}

uint64_t sub_20D14B92C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8820);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8828);
  sub_20D14B754((uint64_t)&unk_2549A8830);
  sub_20D14B2B8();
  return swift_getOpaqueTypeConformance2();
}

void sub_20D14B9BC()
{
  sub_20D14B9E8((uint64_t)&unk_2549A8940);
}

void sub_20D14B9E8(uint64_t a1)
{
  uint64_t *v1;

  if (!OUTLINED_FUNCTION_12(a1))
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v1);
    OUTLINED_FUNCTION_19();
  }
  OUTLINED_FUNCTION_1();
}

uint64_t OUTLINED_FUNCTION_0()
{
  return objectdestroy_10Tm();
}

uint64_t OUTLINED_FUNCTION_2(uint64_t a1, uint64_t *a2)
{
  return __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
}

uint64_t OUTLINED_FUNCTION_3@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v3 + (v2 & ~v1));
}

uint64_t OUTLINED_FUNCTION_4()
{
  return sub_20D191484();
}

uint64_t OUTLINED_FUNCTION_6(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return sub_20D191484();
}

void OUTLINED_FUNCTION_9(uint64_t a1@<X8>, __n128 a2@<Q0>)
{
  *(__n128 *)(a1 + 104) = a2;
  *(_QWORD *)(a1 + 120) = 0x3FE3333333333333;
}

uint64_t OUTLINED_FUNCTION_10(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_12(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t OUTLINED_FUNCTION_13(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

uint64_t OUTLINED_FUNCTION_15()
{
  return sub_20D191460();
}

void OUTLINED_FUNCTION_16()
{
  JUMPOUT(0x212B9F008);
}

uint64_t OUTLINED_FUNCTION_17()
{
  return sub_20D191B80();
}

void *OUTLINED_FUNCTION_18(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x80uLL);
}

void OUTLINED_FUNCTION_19()
{
  JUMPOUT(0x212B9F008);
}

double PEPhotoStylePaletteSlider.value.getter()
{
  double v0;

  OUTLINED_FUNCTION_0_0();
  v0 = sub_20D14D5D4();
  OUTLINED_FUNCTION_3_0();
  return v0;
}

uint64_t PEPhotoStylePaletteSlider.value.setter()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_12_0();
  return OUTLINED_FUNCTION_2_0();
}

void sub_20D14BC2C(double a1)
{
  sub_20D14D1B8(1, a1);
}

void PEPhotoStylePaletteSlider.colors.getter()
{
  sub_20D14BFC8((void (*)(uint64_t))sub_20D14BE50);
}

void PEPhotoStylePaletteSlider.colors.setter()
{
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7_0();
}

void sub_20D14BD60(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = objc_msgSend(*a1, sel_colors);
  if (v3)
  {
    v4 = v3;
    sub_20D14E520(0, &qword_2549A8BC8);
    v5 = sub_20D191E68();

  }
  else
  {
    v5 = 0;
  }
  *a2 = v5;
}

void sub_20D14BDDC(_QWORD *a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*a1)
  {
    sub_20D14E520(0, &qword_2549A8BC8);
    v3 = sub_20D191E5C();
  }
  else
  {
    v3 = 0;
  }
  v4 = (id)v3;
  objc_msgSend(v2, sel_setColors_);

}

uint64_t sub_20D14BE50()
{
  swift_getKeyPath();
  sub_20D14E40C(&qword_2549A8980, _s16IntegrationModelCMa, (uint64_t)&unk_20D195CB0);
  sub_20D1912B0();
  swift_release();
  return swift_bridgeObjectRetain();
}

uint64_t sub_20D14BED8()
{
  swift_bridgeObjectRetain();
  swift_retain();
  sub_20D14BF28();
  return swift_release();
}

uint64_t sub_20D14BF28()
{
  swift_getKeyPath();
  sub_20D14D704();
  swift_release();
  return swift_bridgeObjectRelease();
}

void PEPhotoStylePaletteSlider.gradientCast.getter()
{
  sub_20D14BFC8((void (*)(uint64_t))sub_20D14C0BC);
}

void sub_20D14BFC8(void (*a1)(uint64_t))
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_0_0();
  a1(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1();
}

void PEPhotoStylePaletteSlider.gradientCast.setter()
{
  void *v0;

  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_9_0();

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7_0();
}

id sub_20D14C084@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_gradientCast);
  *a2 = result;
  return result;
}

id sub_20D14C0BC()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_20D14E40C(&qword_2549A8980, _s16IntegrationModelCMa, (uint64_t)&unk_20D195CB0);
  sub_20D1912B0();
  swift_release();
  return *(id *)(v0 + 40);
}

uint64_t sub_20D14C140(uint64_t a1, void *a2)
{
  swift_retain();
  sub_20D14C188(a2);
  return swift_release();
}

void sub_20D14C188(void *a1)
{
  swift_getKeyPath();
  sub_20D14D704();
  swift_release();

}

uint64_t PEPhotoStylePaletteSlider.onValueChanged.getter()
{
  return sub_20D14C808((uint64_t (*)(uint64_t))sub_20D14C3C4);
}

uint64_t sub_20D14C210(uint64_t a1, double a2)
{
  void (*v3)(uint64_t, double);
  uint64_t v4;

  v3 = *(void (**)(uint64_t, double))(a1 + 32);
  v4 = swift_retain();
  v3(v4, a2);
  return swift_release();
}

uint64_t PEPhotoStylePaletteSlider.onValueChanged.setter()
{
  return sub_20D14C880();
}

uint64_t sub_20D14C27C@<X0>(id *a1@<X0>, void (**a2)(double *a1)@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t result;

  v3 = objc_msgSend(*a1, sel_onValueChanged);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = sub_20D14E90C;
  *(_QWORD *)(result + 24) = v4;
  *a2 = sub_20D14E500;
  a2[1] = (void (*)(double *))result;
  return result;
}

void sub_20D14C304(uint64_t *a1, void **a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  v4 = *a1;
  v3 = a1[1];
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = v3;
  v6 = *a2;
  v8[4] = sub_20D14E4D0;
  v8[5] = v5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_20D14C210;
  v8[3] = &block_descriptor_67;
  v7 = _Block_copy(v8);
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_setOnValueChanged_, v7);
  _Block_release(v7);
}

uint64_t sub_20D14C3C4()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_20D14E40C(&qword_2549A8980, _s16IntegrationModelCMa, (uint64_t)&unk_20D195CB0);
  sub_20D1912B0();
  swift_release();
  v1 = *(_QWORD *)(v0 + 48);
  swift_retain();
  return v1;
}

id sub_20D14C474(void *a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4, uint64_t a5)
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[6];

  v8 = a1;
  v9 = a3();
  v11 = v10;

  v14[4] = v9;
  v14[5] = v11;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 1107296256;
  v14[2] = a4;
  v14[3] = a5;
  v12 = _Block_copy(v14);
  swift_release();
  return v12;
}

uint64_t PEPhotoStylePaletteSlider.onGestureDidBegin.getter()
{
  return sub_20D14C808((uint64_t (*)(uint64_t))sub_20D14C6EC);
}

void sub_20D14C528(void *a1, int a2, void *aBlock, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t))
{
  void *v9;
  uint64_t v10;
  id v11;

  v9 = _Block_copy(aBlock);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  v11 = a1;
  a6(a5, v10);

}

uint64_t PEPhotoStylePaletteSlider.onGestureDidBegin.setter()
{
  return sub_20D14C880();
}

uint64_t sub_20D14C5C0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t result;

  v3 = objc_msgSend(*a1, sel_onGestureDidBegin);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = sub_20D14E8F4;
  *(_QWORD *)(result + 24) = v4;
  *a2 = sub_20D14E894;
  a2[1] = result;
  return result;
}

void sub_20D14C648(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, SEL *a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[6];

  v13 = *a1;
  v12 = a1[1];
  v14 = OUTLINED_FUNCTION_4_0();
  *(_QWORD *)(v14 + 16) = v13;
  *(_QWORD *)(v14 + 24) = v12;
  v15 = *a2;
  v17[4] = a6;
  v17[5] = v14;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 1107296256;
  v17[2] = sub_20D1635CC;
  v17[3] = a7;
  v16 = _Block_copy(v17);
  swift_retain();
  swift_release();
  objc_msgSend(v15, *a8, v16);
  _Block_release(v16);
  OUTLINED_FUNCTION_5_0();
}

uint64_t sub_20D14C6EC()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_20D14E40C(&qword_2549A8980, _s16IntegrationModelCMa, (uint64_t)&unk_20D195CB0);
  sub_20D1912B0();
  swift_release();
  v1 = *(_QWORD *)(v0 + 64);
  swift_retain();
  return v1;
}

void sub_20D14C780()
{
  swift_getKeyPath();
  sub_20D14D704();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_5_0();
}

uint64_t PEPhotoStylePaletteSlider.onGestureDidEnd.getter()
{
  return sub_20D14C808((uint64_t (*)(uint64_t))sub_20D14C95C);
}

uint64_t sub_20D14C808(uint64_t (*a1)(uint64_t))
{
  uint64_t v2;
  uint64_t v3;

  v2 = OUTLINED_FUNCTION_0_0();
  v3 = a1(v2);
  OUTLINED_FUNCTION_3_0();
  return v3;
}

uint64_t PEPhotoStylePaletteSlider.onGestureDidEnd.setter()
{
  return sub_20D14C880();
}

uint64_t sub_20D14C880()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_13_0();
  return swift_release();
}

uint64_t sub_20D14C8D4@<X0>(id *a1@<X0>, void (**a2)()@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t result;

  v3 = objc_msgSend(*a1, sel_onGestureDidEnd);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = sub_20D14E8F4;
  *(_QWORD *)(result + 24) = v4;
  *a2 = sub_20D14E4C8;
  a2[1] = (void (*)())result;
  return result;
}

uint64_t sub_20D14C95C()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_20D14E40C(&qword_2549A8980, _s16IntegrationModelCMa, (uint64_t)&unk_20D195CB0);
  sub_20D1912B0();
  swift_release();
  v1 = *(_QWORD *)(v0 + 80);
  swift_retain();
  return v1;
}

void __swiftcall PEPhotoStylePaletteSlider.init(value:)(PEPhotoStylePaletteSlider *__return_ptr retstr, Swift::Double value)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithValue_, value);
}

id PEPhotoStylePaletteSlider.init(value:)()
{
  void *v0;
  id v1;

  v1 = objc_msgSend(v0, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  swift_retain();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_3_0();
  return v1;
}

void __swiftcall PEPhotoStylePaletteSlider.init(frame:)(PEPhotoStylePaletteSlider *__return_ptr retstr, __C::CGRect frame)
{
  id v2;
  double v3;
  id v4;
  SEL v5;

  OUTLINED_FUNCTION_11_0();
  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v3 = OUTLINED_FUNCTION_10_0();
  objc_msgSend(v4, v5, v3);
}

id PEPhotoStylePaletteSlider.init(frame:)()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char *v4;
  void *v5;
  char *v6;
  id v7;
  char *v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  double v14;
  objc_super *v15;
  SEL v16;
  id v17;
  _QWORD v19[2];

  OUTLINED_FUNCTION_11_0();
  v1 = _s15IntegrationViewVMa(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = &v0[OBJC_IVAR___PEPhotoStylePaletteSlider_touchAreaInsets];
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  v5 = (void *)*MEMORY[0x24BE71ED0];
  _s16IntegrationModelCMa(0);
  swift_allocObject();
  v6 = v0;
  *(_QWORD *)&v6[OBJC_IVAR___PEPhotoStylePaletteSlider_paletteSliderModel] = sub_20D14DA54(0, (uint64_t)v5, (uint64_t)nullsub_1, 0, (uint64_t)nullsub_1, 0, (uint64_t)nullsub_1, 0, 0.0);
  sub_20D14E40C(&qword_2549A8980, _s16IntegrationModelCMa, (uint64_t)&unk_20D195CB0);
  swift_retain();
  sub_20D191C34();
  v7 = objc_allocWithZone((Class)type metadata accessor for TouchAreaPaddingHostingView(0));
  v8 = (char *)sub_20D14DCD0((uint64_t)v3);
  if (qword_2549A81C0 != -1)
    swift_once();
  v9 = xmmword_2549A8950;
  v10 = qword_2549A8960;
  v11 = unk_2549A8968;
  *(_OWORD *)v4 = xmmword_2549A8950;
  *((_QWORD *)v4 + 2) = v10;
  *((_QWORD *)v4 + 3) = v11;
  v4[32] = 0;
  v12 = &v8[qword_2549A8988];
  *(_OWORD *)v12 = v9;
  *((_QWORD *)v12 + 2) = v10;
  *((_QWORD *)v12 + 3) = v11;
  *(_QWORD *)&v6[OBJC_IVAR___PEPhotoStylePaletteSlider_hostingView] = v8;
  v13 = v8;

  v19[0] = v6;
  v19[1] = PEPhotoStylePaletteSlider;
  v14 = OUTLINED_FUNCTION_10_0();
  v17 = objc_msgSendSuper2(v15, v16, v14);
  sub_20D14CD30();

  return v17;
}

uint64_t sub_20D14CD00(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return sub_20D14DCD0(a1);
}

void sub_20D14CD30()
{
  char *v0;
  char *v1;
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v1 = v0;
  v2 = OBJC_IVAR___PEPhotoStylePaletteSlider_hostingView;
  v3 = *(id *)&v0[OBJC_IVAR___PEPhotoStylePaletteSlider_hostingView];
  sub_20D1914E4();

  v4 = *(id *)&v1[v2];
  objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v1, sel_addSubview_, v4);
  v5 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BD0);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_20D195B40;
  v7 = objc_msgSend(v4, sel_topAnchor);
  v8 = objc_msgSend(v1, sel_topAnchor);
  v9 = objc_msgSend(v7, sel_constraintEqualToAnchor_, v8);

  *(_QWORD *)(v6 + 32) = v9;
  v10 = objc_msgSend(v4, sel_bottomAnchor);
  v11 = objc_msgSend(v1, sel_bottomAnchor);
  v12 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v11);

  *(_QWORD *)(v6 + 40) = v12;
  v13 = objc_msgSend(v4, sel_leadingAnchor);
  v14 = objc_msgSend(v1, sel_leadingAnchor);
  v15 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v14);

  *(_QWORD *)(v6 + 48) = v15;
  v16 = objc_msgSend(v4, sel_trailingAnchor);
  v17 = objc_msgSend(v1, sel_trailingAnchor);
  v18 = objc_msgSend(v16, sel_constraintEqualToAnchor_, v17);

  *(_QWORD *)(v6 + 56) = v18;
  sub_20D191E74();
  sub_20D14E520(0, &qword_2549A8BD8);
  v19 = (id)sub_20D191E5C();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_activateConstraints_, v19);

}

void __swiftcall PEPhotoStylePaletteSlider.init(coder:)(PEPhotoStylePaletteSlider *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

  OUTLINED_FUNCTION_1();
}

void PEPhotoStylePaletteSlider.init(coder:)()
{
  char *v0;
  char *v1;

  v1 = &v0[OBJC_IVAR___PEPhotoStylePaletteSlider_touchAreaInsets];
  *(_OWORD *)v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  v1[32] = 1;

  sub_20D191EF8();
  __break(1u);
}

Swift::Bool __swiftcall PEPhotoStylePaletteSlider.point(inside:with:)(CGPoint inside, UIEvent_optional with)
{
  char *v2;
  CGFloat y;
  CGFloat x;
  Swift::Bool result;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint v10;
  CGRect v11;

  y = inside.y;
  x = inside.x;
  result = objc_msgSend(v2, sel_bounds);
  if ((v2[OBJC_IVAR___PEPhotoStylePaletteSlider_touchAreaInsets + 32] & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v11.origin.x = UIEdgeInsetsInsetRect(v6, v7, v8, v9, *(double *)&v2[OBJC_IVAR___PEPhotoStylePaletteSlider_touchAreaInsets], *(double *)&v2[OBJC_IVAR___PEPhotoStylePaletteSlider_touchAreaInsets + 8]);
    v10.x = x;
    v10.y = y;
    return CGRectContainsPoint(v11, v10);
  }
  return result;
}

Swift::Void __swiftcall PEPhotoStylePaletteSlider.setValue(_:notifyObserver:)(Swift::Double _, Swift::Bool notifyObserver)
{
  OUTLINED_FUNCTION_0_0();
  sub_20D14D1B8(notifyObserver, _);
  OUTLINED_FUNCTION_2_0();
}

void sub_20D14D1B8(char a1, double a2)
{
  void (*v4)(double);

  if (vabdd_f64(a2, sub_20D14D5D4()) >= 2.22044605e-16)
  {
    sub_20D14D69C();
    if ((a1 & 1) != 0)
    {
      v4 = (void (*)(double))sub_20D14C3C4();
      v4(a2);
      swift_release();
    }
  }
}

void sub_20D14D278(uint64_t a1@<X8>)
{
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
  void (*v11)(char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  _QWORD v21[6];
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v21[0] = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(qword_2549A8B18);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v21 - v6;
  v8 = type metadata accessor for PhotoStylePaletteSlider();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D191C28();
  swift_getKeyPath();
  sub_20D191C40();
  swift_release();
  v11 = *(void (**)(char *, uint64_t))(v2 + 8);
  v11(v7, v1);
  v13 = v23;
  v12 = v24;
  v14 = v25;
  sub_20D191C28();
  swift_getKeyPath();
  sub_20D191C40();
  swift_release();
  v11(v5, v1);
  v15 = v21[4];
  v16 = v21[5];
  LOBYTE(v11) = v22;
  sub_20D191C1C();
  v17 = sub_20D14C0BC();
  v18 = PISemanticStyleCast.gradientColors.getter();
  swift_release();

  *((_QWORD *)v10 + 8) = 0;
  v21[1] = 0;
  sub_20D191B80();
  v19 = v21[3];
  *((_QWORD *)v10 + 9) = v21[2];
  *((_QWORD *)v10 + 10) = v19;
  v20 = (uint64_t *)&v10[*(int *)(v8 + 36)];
  *v20 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BB8);
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)v10 = v13;
  *((_QWORD *)v10 + 1) = v12;
  *((_QWORD *)v10 + 2) = v14;
  *((_OWORD *)v10 + 3) = xmmword_20D1952D0;
  *((_QWORD *)v10 + 3) = v15;
  *((_QWORD *)v10 + 4) = v16;
  v10[40] = (char)v11;
  swift_bridgeObjectRelease();
  *((_QWORD *)v10 + 8) = v18;
  sub_20D14E40C(&qword_2549A8BC0, (uint64_t (*)(uint64_t))type metadata accessor for PhotoStylePaletteSlider, (uint64_t)&unk_20D195EF0);
  sub_20D1919E8();
  sub_20D14E59C((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for PhotoStylePaletteSlider);
}

uint64_t sub_20D14D4EC()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_20D14E40C(&qword_2549A8980, _s16IntegrationModelCMa, (uint64_t)&unk_20D195CB0);
  sub_20D1912B0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t sub_20D14D570()
{
  swift_getKeyPath();
  sub_20D14D704();
  return swift_release();
}

double sub_20D14D5D4()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_20D14E40C(&qword_2549A8980, _s16IntegrationModelCMa, (uint64_t)&unk_20D195CB0);
  sub_20D1912B0();
  swift_release();
  return *(double *)(v0 + 16);
}

uint64_t sub_20D14D658()
{
  return sub_20D14BED8();
}

uint64_t sub_20D14D670()
{
  uint64_t v0;

  return sub_20D14C140(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t _s15IntegrationViewVMa(uint64_t a1)
{
  return sub_20D14DB04(a1, (uint64_t *)&unk_2549A8B78);
}

uint64_t sub_20D14D69C()
{
  swift_getKeyPath();
  sub_20D14D704();
  return swift_release();
}

uint64_t sub_20D14D704()
{
  sub_20D14E40C(&qword_2549A8980, _s16IntegrationModelCMa, (uint64_t)&unk_20D195CB0);
  return sub_20D1912A4();
}

uint64_t sub_20D14D7A4(uint64_t result, char a2)
{
  void (*v2)(void);

  if ((result & 1) != (a2 & 1))
  {
    if ((a2 & 1) != 0)
      v2 = (void (*)(void))sub_20D14C6EC();
    else
      v2 = (void (*)(void))sub_20D14C95C();
    v2();
    return swift_release();
  }
  return result;
}

uint64_t sub_20D14D7F4(char a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  v2 = *(unsigned __int8 *)(v1 + 24);
  *(_BYTE *)(v1 + 24) = a1;
  v3 = sub_20D14D4EC() & 1;
  return sub_20D14D7A4(v2, v3);
}

uint64_t sub_20D14D820()
{
  swift_bridgeObjectRetain();
  return sub_20D14BF28();
}

uint64_t sub_20D14D848(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 32) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_20D14D880(id *a1)
{
  sub_20D14C188(*a1);
}

void sub_20D14D8A8(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = a2;
  v3 = a2;

}

uint64_t sub_20D14D8D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 48) = a2;
  *(_QWORD *)(a1 + 56) = a3;
  swift_retain();
  return swift_release();
}

uint64_t sub_20D14D910(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 64) = a2;
  *(_QWORD *)(a1 + 72) = a3;
  swift_retain();
  return swift_release();
}

uint64_t sub_20D14D948@<X0>(uint64_t (*a1)(void)@<X3>, uint64_t a2@<X5>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v5 = a1();
  v7 = v6;
  result = OUTLINED_FUNCTION_4_0();
  *(_QWORD *)(result + 16) = v5;
  *(_QWORD *)(result + 24) = v7;
  *a3 = a2;
  a3[1] = result;
  return result;
}

void sub_20D14D99C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *a1;
  v2 = a1[1];
  v3 = OUTLINED_FUNCTION_4_0();
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = v2;
  swift_retain();
  OUTLINED_FUNCTION_13_0();
}

uint64_t sub_20D14DA08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 80) = a2;
  *(_QWORD *)(a1 + 88) = a3;
  swift_retain();
  return swift_release();
}

uint64_t _s16IntegrationModelCMa(uint64_t a1)
{
  return sub_20D14DB04(a1, qword_2549A89C8);
}

uint64_t sub_20D14DA54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9)
{
  uint64_t v9;

  *(_BYTE *)(v9 + 24) = 0;
  *(_QWORD *)(v9 + 32) = 0;
  sub_20D1912D4();
  *(double *)(v9 + 16) = a9;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v9 + 32) = a1;
  *(_QWORD *)(v9 + 40) = a2;
  *(_QWORD *)(v9 + 48) = a3;
  *(_QWORD *)(v9 + 56) = a4;
  *(_QWORD *)(v9 + 64) = a5;
  *(_QWORD *)(v9 + 72) = a6;
  *(_QWORD *)(v9 + 80) = a7;
  *(_QWORD *)(v9 + 88) = a8;
  return v9;
}

uint64_t type metadata accessor for TouchAreaPaddingHostingView(uint64_t a1)
{
  return sub_20D14DB04(a1, (uint64_t *)&unk_2549A8AC8);
}

uint64_t sub_20D14DB04(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_20D14DB34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  v1 = v0
     + OBJC_IVAR____TtCE12PhotosUIEditCSo25PEPhotoStylePaletteSliderP33_BAD2206819EDFB03A5A5AC328C9B469516IntegrationModel___observationRegistrar;
  v2 = sub_20D1912E0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_20D14DBA0()
{
  sub_20D14DB34();
  return swift_deallocClassInstance();
}

double sub_20D14DBC0()
{
  double result;

  result = -18.0;
  __asm { FMOV            V1.2D, #-13.0 }
  xmmword_2549A8950 = _Q1;
  *(_OWORD *)&qword_2549A8960 = xmmword_20D195B50;
  return result;
}

BOOL sub_20D14DC14(CGFloat a1, CGFloat a2)
{
  char *v2;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint v10;
  CGRect v11;

  objc_msgSend(v2, sel_bounds);
  v11.origin.x = UIEdgeInsetsInsetRect(v5, v6, v7, v8, *(double *)&v2[qword_2549A8988], *(double *)&v2[qword_2549A8988 + 8]);
  v10.x = a1;
  v10.y = a2;
  return CGRectContainsPoint(v11, v10);
}

BOOL sub_20D14DC68(void *a1, CGFloat a2, CGFloat a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  BOOL v10;

  v8 = a5;
  v9 = a1;
  v10 = sub_20D14DC14(a2, a3);

  return v10;
}

uint64_t sub_20D14DCD0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _OWORD *v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v10;

  v3 = _s15IntegrationViewVMa(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (_OWORD *)(v1 + qword_2549A8988);
  v7 = *(_OWORD *)(MEMORY[0x24BEBE158] + 16);
  *v6 = *MEMORY[0x24BEBE158];
  v6[1] = v7;
  sub_20D14E558(a1, (uint64_t)v5);
  v8 = sub_20D1914D8();
  sub_20D14E59C(a1, _s15IntegrationViewVMa);
  return v8;
}

double UIEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

char *keypath_get_selector_value()
{
  return sel_value;
}

void sub_20D14DDA0(id *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  objc_msgSend(*a1, sel_value);
  *a2 = v3;
  OUTLINED_FUNCTION_1();
}

id sub_20D14DDCC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setValue_, *a1);
}

char *keypath_get_selector_colors()
{
  return sel_colors;
}

char *keypath_get_selector_gradientCast()
{
  return sel_gradientCast;
}

id sub_20D14DE04(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setGradientCast_, *a1);
}

char *keypath_get_selector_onValueChanged()
{
  return sel_onValueChanged;
}

char *keypath_get_selector_onGestureDidBegin()
{
  return sel_onGestureDidBegin;
}

void sub_20D14DE3C(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_20D14C648(a1, a2, a3, a4, (uint64_t)&unk_24C616D20, (uint64_t)sub_20D14E894, (uint64_t)&block_descriptor_53, (SEL *)&selRef_setOnGestureDidBegin_);
}

char *keypath_get_selector_onGestureDidEnd()
{
  return sel_onGestureDidEnd;
}

void sub_20D14DE80(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_20D14C648(a1, a2, a3, a4, (uint64_t)&unk_24C616C80, (uint64_t)sub_20D14E4C8, (uint64_t)&block_descriptor_39, (SEL *)&selRef_setOnGestureDidEnd_);
}

uint64_t sub_20D14DEB4()
{
  return _s16IntegrationModelCMa(0);
}

uint64_t sub_20D14DEBC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20D1912E0();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for PEPhotoStylePaletteSlider(uint64_t a1)
{
  return sub_20D14E520(a1, &qword_2549A8AB0);
}

uint64_t sub_20D14DF7C()
{
  return swift_initClassMetadata2();
}

id sub_20D14DFC4(void *a1)
{
  char *v1;
  objc_class *ObjectType;
  char *v4;
  __int128 v5;
  id v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = &v1[qword_2549A8988];
  v5 = *(_OWORD *)(MEMORY[0x24BEBE158] + 16);
  *(_OWORD *)v4 = *MEMORY[0x24BEBE158];
  *((_OWORD *)v4 + 1) = v5;
  v8.receiver = v1;
  v8.super_class = ObjectType;
  v6 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);

  return v6;
}

id sub_20D14E030(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_20D14DFC4(a3);
}

id sub_20D14E054()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_20D14E088()
{
  return type metadata accessor for TouchAreaPaddingHostingView(0);
}

uint64_t sub_20D14E090(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2549A8B18);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_20D14E0D0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_2549A8B18);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_20D14E108(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2549A8B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_20D14E150(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2549A8B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_20D14E198(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2549A8B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_20D14E1E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2549A8B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_20D14E228()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D14E234(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2549A8B18);
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_20D14E26C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D14E278(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2549A8B18);
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

void sub_20D14E2B4()
{
  unint64_t v0;

  sub_20D14E31C();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_20D14E31C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2549A8B88[0])
  {
    _s16IntegrationModelCMa(255);
    v0 = sub_20D191C4C();
    if (!v1)
      atomic_store(v0, qword_2549A8B88);
  }
}

uint64_t sub_20D14E370()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_20D14E380()
{
  double *v0;

  OUTLINED_FUNCTION_8_0();
  *v0 = sub_20D14BC28();
  OUTLINED_FUNCTION_1();
}

void sub_20D14E3A0(double *a1)
{
  sub_20D14BC2C(*a1);
  OUTLINED_FUNCTION_1();
}

void sub_20D14E3C0()
{
  _BYTE *v0;

  OUTLINED_FUNCTION_8_0();
  *v0 = sub_20D14D4EC() & 1;
  OUTLINED_FUNCTION_1();
}

void sub_20D14E3E4()
{
  sub_20D14D570();
  OUTLINED_FUNCTION_1();
}

void sub_20D14E40C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x212B9F008](a3, v5), a1);
  }
  OUTLINED_FUNCTION_1();
}

uint64_t sub_20D14E448()
{
  uint64_t v0;

  return sub_20D14D7F4(*(_BYTE *)(v0 + 24));
}

uint64_t sub_20D14E478()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_20D14E49C()
{
  uint64_t v0;

  return j__OUTLINED_FUNCTION_12_3(*(_QWORD *)(v0 + 16));
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

uint64_t sub_20D14E4BC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

void sub_20D14E4C8()
{
  uint64_t v0;

  sub_20D164EE0(*(void (**)(void))(v0 + 16));
}

uint64_t sub_20D14E4D0(double a1)
{
  uint64_t v1;
  uint64_t (*v2)(double *);
  double v4;

  v2 = *(uint64_t (**)(double *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

void sub_20D14E500(double *a1)
{
  uint64_t v1;

  (*(void (**)(double))(v1 + 16))(*a1);
  OUTLINED_FUNCTION_1();
}

uint64_t sub_20D14E520(uint64_t a1, unint64_t *a2)
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

uint64_t sub_20D14E558(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = _s15IntegrationViewVMa(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_20D14E59C(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_1();
}

uint64_t sub_20D14E5D4@<X0>(_QWORD *a1@<X8>)
{
  return sub_20D14D948(sub_20D14C95C, (uint64_t)sub_20D14E894, a1);
}

void sub_20D14E600(uint64_t *a1)
{
  sub_20D14D99C(a1);
}

uint64_t sub_20D14E634()
{
  uint64_t *v0;

  return sub_20D14DA08(v0[2], v0[3], v0[4]);
}

uint64_t sub_20D14E650@<X0>(_QWORD *a1@<X8>)
{
  return sub_20D14D948(sub_20D14C6EC, (uint64_t)sub_20D14E894, a1);
}

void sub_20D14E67C(uint64_t *a1)
{
  sub_20D14D99C(a1);
}

uint64_t sub_20D14E6B0()
{
  uint64_t *v0;

  return sub_20D14D910(v0[2], v0[3], v0[4]);
}

uint64_t sub_20D14E6CC@<X0>(_QWORD *a1@<X8>)
{
  return sub_20D14D948(sub_20D14C3C4, (uint64_t)sub_20D14E898, a1);
}

void sub_20D14E6F8(uint64_t *a1)
{
  sub_20D14D99C(a1);
}

uint64_t sub_20D14E72C()
{
  uint64_t *v0;

  return sub_20D14D8D8(v0[2], v0[3], v0[4]);
}

uint64_t sub_20D14E748()
{
  swift_release();
  return swift_deallocObject();
}

void sub_20D14E76C()
{
  id *v0;

  OUTLINED_FUNCTION_8_0();
  *v0 = sub_20D14C0BC();
  OUTLINED_FUNCTION_1();
}

void sub_20D14E790()
{
  uint64_t v0;

  sub_20D14D8A8(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_20D14E7A8()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_8_0();
  *v0 = sub_20D14BE50();
  OUTLINED_FUNCTION_1();
}

uint64_t sub_20D14E7CC()
{
  uint64_t v0;

  return sub_20D14D848(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_20D14E7E4()
{
  double *v0;

  OUTLINED_FUNCTION_8_0();
  *v0 = sub_20D14D5D4();
  OUTLINED_FUNCTION_1();
}

void sub_20D14E804()
{
  sub_20D14D69C();
  OUTLINED_FUNCTION_1();
}

double sub_20D14E824()
{
  uint64_t v0;
  double result;

  result = *(double *)(v0 + 24);
  *(double *)(*(_QWORD *)(v0 + 16) + 16) = result;
  return result;
}

uint64_t sub_20D14E834()
{
  type metadata accessor for PhotoStylePaletteSlider();
  sub_20D14E40C(&qword_2549A8BC0, (uint64_t (*)(uint64_t))type metadata accessor for PhotoStylePaletteSlider, (uint64_t)&unk_20D195EF0);
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return sub_20D1914B4();
}

double OUTLINED_FUNCTION_10_0()
{
  double v0;

  return v0;
}

void OUTLINED_FUNCTION_12_0()
{
  double v0;

  sub_20D14D1B8(1, v0);
}

void OUTLINED_FUNCTION_13_0()
{
  sub_20D14C780();
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return sub_20D191D00();
}

uint64_t sub_20D14E9C8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    v6 = a2[2];
    *(_QWORD *)(a1 + 8) = a2[1];
    *(_QWORD *)(a1 + 16) = v6;
    v7 = a2[4];
    *(_QWORD *)(a1 + 24) = a2[3];
    *(_QWORD *)(a1 + 32) = v7;
    *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
    *(_OWORD *)(a1 + 48) = *((_OWORD *)a2 + 3);
    v8 = a2[9];
    *(_QWORD *)(a1 + 64) = a2[8];
    *(_QWORD *)(a1 + 72) = v8;
    v9 = *(int *)(a3 + 36);
    v10 = (_QWORD *)(a1 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    *(_QWORD *)(a1 + 80) = a2[10];
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BB8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_20D191508();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_20D14EB04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v4 = a1 + *(int *)(a2 + 36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BB8);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v5 = sub_20D191508();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_20D14EBA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  v7 = *(int *)(a3 + 36);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BB8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_20D191508();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_20D14ECB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v6 = *(int *)(a3 + 36);
    v7 = (_QWORD *)(a1 + v6);
    v8 = (_QWORD *)(a2 + v6);
    sub_20D14B87C(a1 + v6, &qword_2549A8BB8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BB8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v9 = sub_20D191508();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_20D14EE28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v4 = *(int *)(a3 + 36);
  v5 = (void *)(a1 + v4);
  v6 = (const void *)(a2 + v4);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BB8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = sub_20D191508();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t sub_20D14EF00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_release();
  if (a1 != a2)
  {
    v6 = *(int *)(a3 + 36);
    v7 = (void *)(a1 + v6);
    v8 = (const void *)(a2 + v6);
    sub_20D14B87C(a1 + v6, &qword_2549A8BB8);
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BB8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_20D191508();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_20D14F040()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D14F04C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BE0);
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 36), a2, v8);
  }
}

uint64_t sub_20D14F0C4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D14F0D0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BE0);
    return __swift_storeEnumTagSinglePayload(v5 + *(int *)(a4 + 36), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PhotoStylePaletteSlider()
{
  uint64_t result;

  result = qword_2549A8C40;
  if (!qword_2549A8C40)
    return swift_getSingletonMetadata();
  return result;
}

void sub_20D14F178()
{
  unint64_t v0;

  sub_20D14F214();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_20D14F214()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2549A8C50)
  {
    sub_20D191508();
    v0 = sub_20D1913D0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2549A8C50);
  }
}

uint64_t sub_20D14F268()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D14F278@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(_QWORD);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[6];

  v2 = v1;
  v23 = a1;
  v3 = sub_20D191568();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_20D19158C();
  v21 = *(_QWORD *)(v7 - 8);
  v22 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = OUTLINED_FUNCTION_4_1();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10);
  sub_20D14A880((uint64_t)v2, (uint64_t)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v13);
  v14 = OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_7_1(v14);
  v24[4] = sub_20D150948;
  v24[5] = v11;
  sub_20D191538();
  sub_20D191580();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v15 = v2[1];
  v16 = v2[2];
  v24[1] = *v2;
  v24[2] = v15;
  v24[3] = v16;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8C90);
  MEMORY[0x212B9E378](v24, v17);
  sub_20D14A880((uint64_t)v2, (uint64_t)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for PhotoStylePaletteSlider);
  v18 = OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_7_1(v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8C98);
  sub_20D150EAC(&qword_2549A8CA0, &qword_2549A8C98);
  sub_20D1919C4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v9, v22);
  return swift_release();
}

void sub_20D14F49C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  *a3 = sub_20D191CB8();
  a3[1] = v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8CA8);
  sub_20D14F4F0(a2, a1, (uint64_t)a3 + *(int *)(v7 + 44));
}

void sub_20D14F4F0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  double v40;
  double v41;
  char *v42;
  uint64_t v43;
  double v44;
  double v45;
  uint64_t v46;
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
  _QWORD v57[2];
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[17];
  char v74;
  _BYTE __dst[144];

  v57[1] = a2;
  v71 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8CB0);
  v6 = *(_QWORD *)(v5 - 8);
  v69 = v5;
  v70 = v6;
  MEMORY[0x24BDAC7A8](v5);
  v62 = (uint64_t)v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8CB8);
  v58 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v9 = (char *)v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8CC0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8CC8);
  v67 = *(_QWORD *)(v13 - 8);
  v68 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v61 = (char *)v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8CD0);
  v15 = MEMORY[0x24BDAC7A8](v66);
  v64 = (char *)v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v65 = (uint64_t)v57 - v17;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8CD8);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v63 = (uint64_t)v57 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (_QWORD *)((char *)v57 - v21);
  *v22 = sub_20D191CB8();
  v22[1] = v23;
  v59 = v22;
  v24 = (uint64_t)v22 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549A8CE0) + 44);
  v25 = a1;
  sub_20D14FA2C(a1, a2, v24);
  v26 = sub_20D191AA8();
  v27 = sub_20D191CAC();
  v29 = v28;
  sub_20D191A90();
  v30 = sub_20D191AB4();
  swift_release();
  v31 = sub_20D1918A4();
  sub_20D191370();
  v74 = 0;
  v73[0] = v26;
  LOWORD(v73[1]) = 256;
  v73[2] = 0x3FD6666666666666;
  v73[3] = v30;
  v73[4] = 0x4010000000000000;
  memset(&v73[5], 0, 24);
  v73[8] = 0x4008000000000000;
  v73[9] = v27;
  v73[10] = v29;
  LOBYTE(v73[11]) = v31;
  v73[12] = v32;
  v73[13] = v33;
  v73[14] = v34;
  v73[15] = v35;
  LOBYTE(v73[16]) = 0;
  sub_20D144044();
  v72 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8CE8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8CF0);
  sub_20D1509D4();
  sub_20D150B48();
  sub_20D191A30();
  swift_release();
  memcpy(__dst, v73, 0x81uLL);
  sub_20D150BCC((uint64_t)__dst);
  v36 = v58;
  v37 = v60;
  (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v12, v9, v60);
  v38 = &v12[*(int *)(v10 + 36)];
  *(_QWORD *)v38 = 0xC024000000000000;
  v38[8] = 0;
  (*(void (**)(char *, uint64_t))(v36 + 8))(v9, v37);
  sub_20D19146C();
  v39 = v62;
  sub_20D14FFE8(v62, v40, v41);
  sub_20D1913DC();
  sub_20D150C00();
  sub_20D150EAC(&qword_2549A8D60, &qword_2549A8CB0);
  v42 = v61;
  v43 = v69;
  sub_20D191A0C();
  (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v39, v43);
  sub_20D14B87C((uint64_t)v12, &qword_2549A8CC0);
  sub_20D19146C();
  sub_20D1502B4(v44, v45);
  v47 = v46;
  v49 = v67;
  v48 = v68;
  v50 = (uint64_t)v64;
  (*(void (**)(char *, char *, uint64_t))(v67 + 16))(v64, v42, v68);
  v51 = (_QWORD *)(v50 + *(int *)(v66 + 36));
  *v51 = v47;
  v51[1] = 0;
  (*(void (**)(char *, uint64_t))(v49 + 8))(v42, v48);
  v52 = v65;
  sub_20D14B8A4(v50, v65, &qword_2549A8CD0);
  v53 = (uint64_t)v59;
  v54 = v63;
  sub_20D14B85C((uint64_t)v59, v63, &qword_2549A8CD8);
  sub_20D14B85C(v52, v50, &qword_2549A8CD0);
  v55 = v71;
  sub_20D14B85C(v54, v71, &qword_2549A8CD8);
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8D68);
  sub_20D14B85C(v50, v55 + *(int *)(v56 + 48), &qword_2549A8CD0);
  sub_20D14B87C(v52, &qword_2549A8CD0);
  sub_20D14B87C(v53, &qword_2549A8CD8);
  sub_20D14B87C(v50, &qword_2549A8CD0);
  sub_20D14B87C(v54, &qword_2549A8CD8);
}

void sub_20D14FA2C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(void);
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(void);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  double v37;
  double v38;
  uint64_t v39;
  _OWORD *v40;
  __int128 v41;
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
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;

  v50 = a2;
  v48 = a1;
  v55 = a3;
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8D90);
  MEMORY[0x24BDAC7A8](v49);
  v47 = (uint64_t)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8D98);
  v4 = MEMORY[0x24BDAC7A8](v52);
  v54 = (uint64_t)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v51 = (uint64_t)&v46 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v53 = (uint64_t)&v46 - v8;
  v9 = sub_20D191BEC();
  v10 = MEMORY[0x24BDF48E8];
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v46 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8DA0);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v46 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v46 - v20;
  v22 = *MEMORY[0x24BDEEB78];
  v23 = sub_20D191748();
  v24 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 104);
  v24(v15, v22, v23);
  v25 = sub_20D191A78();
  sub_20D14A880((uint64_t)v15, (uint64_t)v19, (uint64_t (*)(_QWORD))v10);
  v26 = (uint64_t *)&v19[*(int *)(v16 + 52)];
  *v26 = v25;
  v26[1] = 2;
  v27 = (uint64_t)v21;
  *(_WORD *)&v19[*(int *)(v16 + 56)] = 256;
  v28 = (uint64_t)v15;
  v29 = v48;
  sub_20D14A8AC(v28, (uint64_t (*)(_QWORD))v10);
  sub_20D14B8A4((uint64_t)v19, (uint64_t)v21, &qword_2549A8DA0);
  v24(v13, v22, v23);
  if (!*(_QWORD *)(v29 + 64))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8DA8);
    v30 = swift_allocObject();
    *(_OWORD *)(v30 + 16) = xmmword_20D195E50;
    *(_QWORD *)(v30 + 32) = sub_20D191A78();
    *(_QWORD *)&v59 = v30;
    sub_20D191E74();
  }
  swift_bridgeObjectRetain();
  sub_20D191D6C();
  sub_20D191D78();
  v31 = swift_bridgeObjectRetain();
  MEMORY[0x212B9E414](v31);
  sub_20D1914CC();
  swift_bridgeObjectRelease();
  v32 = MEMORY[0x24BDF48E8];
  v33 = v47;
  sub_20D14A880((uint64_t)v13, v47, (uint64_t (*)(_QWORD))MEMORY[0x24BDF48E8]);
  v34 = v49;
  v35 = v33 + *(int *)(v49 + 52);
  v36 = v57;
  *(_OWORD *)v35 = v56;
  *(_OWORD *)(v35 + 16) = v36;
  *(_QWORD *)(v35 + 32) = v58;
  *(_WORD *)(v33 + *(int *)(v34 + 56)) = 256;
  sub_20D14A8AC((uint64_t)v13, (uint64_t (*)(_QWORD))v32);
  sub_20D19146C();
  sub_20D1502B4(v37, v38);
  sub_20D191CAC();
  sub_20D191424();
  v39 = v51;
  sub_20D14B85C(v33, v51, &qword_2549A8D90);
  v40 = (_OWORD *)(v39 + *(int *)(v52 + 36));
  v41 = v60;
  *v40 = v59;
  v40[1] = v41;
  v40[2] = v61;
  sub_20D14B87C(v33, &qword_2549A8D90);
  v42 = v53;
  sub_20D14B8A4(v39, v53, &qword_2549A8D98);
  sub_20D14B85C(v27, (uint64_t)v19, &qword_2549A8DA0);
  v43 = v54;
  sub_20D14B85C(v42, v54, &qword_2549A8D98);
  v44 = v55;
  sub_20D14B85C((uint64_t)v19, v55, &qword_2549A8DA0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8DB0);
  sub_20D14B85C(v43, v44 + *(int *)(v45 + 48), &qword_2549A8D98);
  sub_20D14B87C(v42, &qword_2549A8D98);
  sub_20D14B87C(v27, &qword_2549A8DA0);
  sub_20D14B87C(v43, &qword_2549A8D98);
  sub_20D14B87C((uint64_t)v19, &qword_2549A8DA0);
}

void sub_20D14FECC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  _QWORD v19[3];
  char v20;
  uint64_t v21;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8CF0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a2 + 32);
  v10 = *(_BYTE *)(a2 + 40);
  v19[1] = *(_QWORD *)(a2 + 24);
  v19[2] = v9;
  v20 = v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8498);
  MEMORY[0x212B9E378](&v21, v11);
  if ((_BYTE)v21)
    v12 = 1.4;
  else
    v12 = 1.0;
  sub_20D191D60();
  v14 = v13;
  v16 = v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8D40);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v8, a1, v17);
  v18 = &v8[*(int *)(v6 + 36)];
  *(double *)v18 = v12;
  *((double *)v18 + 1) = v12;
  *((_QWORD *)v18 + 2) = v14;
  *((_QWORD *)v18 + 3) = v16;
  sub_20D14B8A4((uint64_t)v8, a3, &qword_2549A8CF0);
}

uint64_t sub_20D14FFE8@<X0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = v3;
  v26 = a1;
  v7 = type metadata accessor for PhotoStylePaletteSlider();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_20D1917E4();
  MEMORY[0x24BDAC7A8](v11);
  v12 = sub_20D1913C4();
  v24 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8D70);
  v25 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D191814();
  sub_20D191394();
  sub_20D14A880(v4, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for PhotoStylePaletteSlider);
  v18 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v19 = swift_allocObject();
  sub_20D150904((uint64_t)v10, v19 + v18);
  v20 = (double *)(v19 + ((v18 + v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v20 = a2;
  v20[1] = a3;
  sub_20D150DBC(&qword_2549A8D78, (void (*)(uint64_t))MEMORY[0x24BDEB540]);
  sub_20D150DBC(&qword_2549A8600, (void (*)(uint64_t))MEMORY[0x24BDEB500]);
  sub_20D191C10();
  swift_release();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v14, v12);
  sub_20D14A880(v23, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for PhotoStylePaletteSlider);
  v21 = swift_allocObject();
  sub_20D150904((uint64_t)v10, v21 + v18);
  sub_20D150EAC(&qword_2549A8D80, &qword_2549A8D70);
  sub_20D191C04();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v17, v15);
}

_QWORD *sub_20D1502B4(double a1, double a2)
{
  uint64_t v2;
  double v3;
  double v4;
  uint64_t v5;
  _QWORD *result;
  double v7;
  double v8;
  uint64_t v9;

  v3 = a1 - a2;
  if (v3 >= 0.0)
    v4 = v3;
  else
    v4 = 0.0;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8C90);
  result = MEMORY[0x212B9E378](&v9, v5);
  v8 = *(double *)(v2 + 48);
  v7 = *(double *)(v2 + 56);
  if (v8 > v7)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v4 < 0.0)
LABEL_8:
    __break(1u);
  return result;
}

BOOL sub_20D150350(double *a1, double *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;
  double *v12;
  uint64_t v13;
  double *v14;
  double v15;
  double v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  double v20;
  double v21;
  double v23;
  double v24;
  _QWORD v25[3];
  char v26;
  uint64_t v27;

  v6 = type metadata accessor for PhotoStylePaletteSlider();
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (double *)((char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (double *)((char *)v25 - v11);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (double *)((char *)v25 - v13);
  v15 = *a1;
  v16 = *a2;
  v17 = *(_QWORD *)(a3 + 32);
  v18 = *(_BYTE *)(a3 + 40);
  v25[1] = *(_QWORD *)(a3 + 24);
  v25[2] = v17;
  v26 = v18;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8498);
  MEMORY[0x212B9E378](&v27, v19);
  if (v27 != 1)
    return 0;
  v20 = *(double *)(a3 + 48);
  sub_20D14A880(a3, (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for PhotoStylePaletteSlider);
  if (v15 == v20)
  {
    sub_20D14A8AC((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for PhotoStylePaletteSlider);
    sub_20D14A880(a3, (uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for PhotoStylePaletteSlider);
  }
  else
  {
    v23 = v14[6];
    sub_20D14A8AC((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for PhotoStylePaletteSlider);
    sub_20D14A880(a3, (uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for PhotoStylePaletteSlider);
    if (v16 == v23)
    {
      sub_20D14A8AC((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for PhotoStylePaletteSlider);
      return 1;
    }
  }
  v21 = v12[7];
  sub_20D150904((uint64_t)v12, (uint64_t)v9);
  if (v15 == v21)
  {
    sub_20D14A8AC((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for PhotoStylePaletteSlider);
    return 0;
  }
  v24 = v9[7];
  sub_20D14A8AC((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for PhotoStylePaletteSlider);
  return v16 == v24;
}

_QWORD *sub_20D15051C(double a1, double a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *result;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  char v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  double v30;
  uint64_t v31;
  _QWORD v32[2];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;

  v7 = sub_20D191508();
  v32[0] = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v32 - v11;
  v13 = a4[3];
  v14 = a4[4];
  v15 = *((_BYTE *)a4 + 40);
  v33 = v13;
  v34 = v14;
  LOBYTE(v35) = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8498);
  MEMORY[0x212B9E378](&v36);
  if ((LOBYTE(v36) & 1) == 0)
  {
    v33 = v13;
    v34 = v14;
    LOBYTE(v35) = v15;
    LOBYTE(v36) = 1;
    sub_20D191BE0();
    v16 = a4[1];
    v17 = a4[2];
    v33 = *a4;
    v34 = v16;
    v35 = v17;
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8C90);
    result = MEMORY[0x212B9E378](&v36, v18);
    v21 = *((double *)a4 + 6);
    v20 = *((double *)a4 + 7);
    if (v21 > v20)
    {
LABEL_16:
      __break(1u);
      return result;
    }
    if (v36 >= v21)
      v21 = v36;
    v22 = a4[10];
    if (v20 >= v36)
      v20 = v21;
    v33 = a4[9];
    v34 = v22;
    v36 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8D88);
    sub_20D191B98();
  }
  if (a1 - a2 >= 0.0)
    v23 = a1 - a2;
  else
    v23 = 0.0;
  result = (_QWORD *)sub_20D1913A0();
  if (v23 < 0.0)
  {
    __break(1u);
    goto LABEL_16;
  }
  v25 = v24 / v23;
  type metadata accessor for PhotoStylePaletteSlider();
  sub_20D15AF40();
  v26 = v32[0];
  (*(void (**)(char *, _QWORD, uint64_t))(v32[0] + 104))(v10, *MEMORY[0x24BDED118], v7);
  v27 = sub_20D1914FC();
  v28 = *(void (**)(char *, uint64_t))(v26 + 8);
  v28(v10, v7);
  v28(v12, v7);
  if ((v27 & 1) != 0)
    v25 = -v25;
  v29 = a4[10];
  v33 = a4[9];
  v34 = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8D88);
  sub_20D191B8C();
  v30 = v25 + v36;
  v31 = sub_20D191D18();
  MEMORY[0x24BDAC7A8](v31);
  v32[-2] = a4;
  *(double *)&v32[-1] = v30;
  sub_20D1914B4();
  return (_QWORD *)swift_release();
}

uint64_t sub_20D1507B4(uint64_t result)
{
  double v1;
  double v2;

  v2 = *(double *)(result + 48);
  v1 = *(double *)(result + 56);
  if (v2 > v1)
  {
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8C90);
    return sub_20D191BE0();
  }
  return result;
}

_QWORD *sub_20D15082C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *result;
  double v5;
  double v6;
  double v7;

  LOBYTE(v7) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8498);
  sub_20D191BE0();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8C90);
  result = MEMORY[0x212B9E378](&v7, v3);
  v6 = *(double *)(a2 + 48);
  v5 = *(double *)(a2 + 56);
  if (v6 > v5)
  {
    __break(1u);
  }
  else
  {
    if (v7 >= v6)
      v6 = v7;
    if (v5 >= v7)
      v5 = v6;
    v7 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8D88);
    return (_QWORD *)sub_20D191B98();
  }
  return result;
}

uint64_t sub_20D150904(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PhotoStylePaletteSlider();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_20D150948(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_6_0();
  sub_20D14F49C(a1, v4, a2);
}

BOOL sub_20D150984(double *a1, double *a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_4_1() - 8) + 80);
  return sub_20D150350(a1, a2, v2 + ((v5 + 16) & ~v5));
}

void sub_20D1509CC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  sub_20D14FECC(a1, *(_QWORD *)(v2 + 16), a2);
}

unint64_t sub_20D1509D4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549A8CF8;
  if (!qword_2549A8CF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8CE8);
    v2[0] = sub_20D150A40();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549A8CF8);
  }
  return result;
}

unint64_t sub_20D150A40()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2549A8D00;
  if (!qword_2549A8D00)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8D08);
    v2 = sub_20D150AC4();
    sub_20D150EAC(&qword_2549A8D20, &qword_2549A8D28);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2549A8D00);
  }
  return result;
}

unint64_t sub_20D150AC4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2549A8D10;
  if (!qword_2549A8D10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8D18);
    sub_20D150EAC(&qword_2549A8888, &qword_2549A8890);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDEE7D8];
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2549A8D10);
  }
  return result;
}

unint64_t sub_20D150B48()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2549A8D30;
  if (!qword_2549A8D30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8CF0);
    sub_20D150EAC(&qword_2549A8D38, &qword_2549A8D40);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDEBF50];
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2549A8D30);
  }
  return result;
}

uint64_t sub_20D150BCC(uint64_t a1)
{
  swift_release();
  swift_release();
  return a1;
}

unint64_t sub_20D150C00()
{
  unint64_t result;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  _QWORD v4[6];

  result = qword_2549A8D48;
  if (!qword_2549A8D48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8CC0);
    v4[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8CE8);
    v4[3] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8CF0);
    v4[4] = sub_20D1509D4();
    v4[5] = sub_20D150B48();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_20D150EAC(&qword_2549A8D50, &qword_2549A8D58);
    v4[0] = OpaqueTypeConformance2;
    v4[1] = v3;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2549A8D48);
  }
  return result;
}

uint64_t sub_20D150CD0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_0();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BB8);
  if (OUTLINED_FUNCTION_10_1() == 1)
  {
    v0 = sub_20D191508();
    OUTLINED_FUNCTION_10(v0);
  }
  else
  {
    swift_release();
  }
  return OUTLINED_FUNCTION_2_1();
}

_QWORD *sub_20D150D6C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  double *v5;

  v3 = *(_QWORD *)(OUTLINED_FUNCTION_4_1() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (double *)(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_20D15051C(*v5, v5[1], a1, (uint64_t *)(v1 + v4));
}

void sub_20D150DBC(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    OUTLINED_FUNCTION_19();
  }
  OUTLINED_FUNCTION_1();
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_0();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BB8);
  if (OUTLINED_FUNCTION_10_1() == 1)
  {
    v0 = sub_20D191508();
    OUTLINED_FUNCTION_10(v0);
  }
  else
  {
    swift_release();
  }
  return OUTLINED_FUNCTION_2_1();
}

_QWORD *sub_20D150E84(uint64_t a1)
{
  uint64_t v2;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_6_0();
  return sub_20D15082C(a1, v2);
}

void sub_20D150EAC(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_19();
  }
  OUTLINED_FUNCTION_1();
}

uint64_t sub_20D150EE0()
{
  uint64_t v0;

  return sub_20D1507B4(*(_QWORD *)(v0 + 16));
}

uint64_t sub_20D150EFC()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8C98);
  sub_20D150EAC(&qword_2549A8CA0, &qword_2549A8C98);
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return type metadata accessor for PhotoStylePaletteSlider();
}

uint64_t OUTLINED_FUNCTION_7_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return sub_20D150904(v1, a1 + v2);
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return swift_getEnumCaseMultiPayload();
}

double sub_20D150FF0(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  return (a4 - a2) / (double)a1 * round(a6 / ((a4 - a2) / (double)a1));
}

void sub_20D151020(double a1, double a2, double a3, double a4)
{
  double v4;
  double v5;

  OUTLINED_FUNCTION_16_0(*(CGRect *)&a1);
  if (v5 > OUTLINED_FUNCTION_19_0())
  {
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_15_0();
    if (v4 <= OUTLINED_FUNCTION_17_0())
    {
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  __break(1u);
}

void sub_20D15108C(double a1, double a2, double a3, double a4)
{
  if (a1 > a3)
  {
    __break(1u);
    goto LABEL_5;
  }
  if (a2 > a4)
LABEL_5:
    __break(1u);
}

uint64_t PISemanticStyleCast.gradientColors.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v10;
  uint64_t v12;
  uint64_t v14;
  uint64_t v16;
  uint64_t v18;
  uint64_t v20;
  uint64_t v22;
  uint64_t v24;
  uint64_t v26;
  uint64_t v28;
  uint64_t v30;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v39;
  uint64_t v41;
  uint64_t v42;

  v2 = sub_20D191A60();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D191E38();
  if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v6)
  {
    OUTLINED_FUNCTION_5_1();
LABEL_78:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8DA8);
    *(_OWORD *)(OUTLINED_FUNCTION_9_2() + 16) = xmmword_20D195F40;
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_3_1();
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_2();
  if ((v1 & 1) != 0)
    goto LABEL_78;
  sub_20D191E38();
  if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v8)
  {
    OUTLINED_FUNCTION_5_1();
    goto LABEL_80;
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_2();
  if ((v1 & 1) != 0)
    goto LABEL_80;
  sub_20D191E38();
  if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v10)
  {
    OUTLINED_FUNCTION_5_1();
LABEL_82:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8DA8);
    v41 = OUTLINED_FUNCTION_9_2();
    *(_OWORD *)(v41 + 16) = xmmword_20D195F40;
    OUTLINED_FUNCTION_0_1();
    *(_QWORD *)(v41 + 32) = MEMORY[0x212B9E270](v5, 1.0, 0.91, 0.91, 1.0);
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_3_1();
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_2();
  if ((v1 & 1) != 0)
    goto LABEL_82;
  sub_20D191E38();
  if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v12)
  {
    OUTLINED_FUNCTION_5_1();
LABEL_84:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8DA8);
    *(_OWORD *)(OUTLINED_FUNCTION_9_2() + 16) = xmmword_20D195F40;
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_3_1();
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_2();
  if ((v1 & 1) != 0)
    goto LABEL_84;
  sub_20D191E38();
  if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v14)
  {
    OUTLINED_FUNCTION_5_1();
LABEL_86:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8DA8);
    *(_OWORD *)(OUTLINED_FUNCTION_9_2() + 16) = xmmword_20D195F40;
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_3_1();
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_2();
  if ((v1 & 1) != 0)
    goto LABEL_86;
  sub_20D191E38();
  if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v16)
  {
    OUTLINED_FUNCTION_5_1();
LABEL_88:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8DA8);
    *(_OWORD *)(OUTLINED_FUNCTION_12_1() + 16) = xmmword_20D195E50;
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDF3C28], v2);
    OUTLINED_FUNCTION_3_1();
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_2();
  if ((v1 & 1) != 0)
    goto LABEL_88;
  sub_20D191E38();
  if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v18)
  {
    OUTLINED_FUNCTION_5_1();
LABEL_90:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8DA8);
    *(_OWORD *)(OUTLINED_FUNCTION_9_2() + 16) = xmmword_20D195F40;
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_3_1();
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_2();
  if ((v1 & 1) != 0)
    goto LABEL_90;
  sub_20D191E38();
  if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v20)
  {
    OUTLINED_FUNCTION_5_1();
LABEL_80:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8DA8);
    *(_OWORD *)(OUTLINED_FUNCTION_12_1() + 16) = xmmword_20D1952E0;
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_3_1();
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_2();
  if ((v1 & 1) != 0)
    goto LABEL_80;
  sub_20D191E38();
  if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v22)
  {
    OUTLINED_FUNCTION_5_1();
LABEL_94:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8DA8);
    *(_OWORD *)(OUTLINED_FUNCTION_9_2() + 16) = xmmword_20D195F40;
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_3_1();
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_2();
  if ((v1 & 1) != 0)
    goto LABEL_94;
  sub_20D191E38();
  if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v24)
  {
    OUTLINED_FUNCTION_5_1();
LABEL_96:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8DA8);
    *(_OWORD *)(OUTLINED_FUNCTION_9_2() + 16) = xmmword_20D195F40;
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_3_1();
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_2();
  if ((v1 & 1) != 0)
    goto LABEL_96;
  sub_20D191E38();
  if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v26)
  {
    OUTLINED_FUNCTION_5_1();
LABEL_98:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8DA8);
    *(_OWORD *)(OUTLINED_FUNCTION_9_2() + 16) = xmmword_20D195F40;
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_3_1();
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_2();
  if ((v1 & 1) != 0)
    goto LABEL_98;
  sub_20D191E38();
  if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v28)
  {
    OUTLINED_FUNCTION_5_1();
LABEL_100:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8DA8);
    *(_OWORD *)(OUTLINED_FUNCTION_9_2() + 16) = xmmword_20D195F40;
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_3_1();
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_2();
  if ((v1 & 1) != 0)
    goto LABEL_100;
  sub_20D191E38();
  if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v30)
  {
    OUTLINED_FUNCTION_5_1();
LABEL_102:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8DA8);
    *(_OWORD *)(OUTLINED_FUNCTION_9_2() + 16) = xmmword_20D195F40;
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_3_1();
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_2();
  if ((v1 & 1) != 0)
    goto LABEL_102;
  sub_20D191E38();
  if (v1 == OUTLINED_FUNCTION_2_2() && v0 == v32)
  {
    OUTLINED_FUNCTION_5_1();
LABEL_104:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8DA8);
    *(_OWORD *)(OUTLINED_FUNCTION_12_1() + 16) = xmmword_20D1952E0;
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_21();
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_2();
  if ((v1 & 1) != 0)
    goto LABEL_104;
  v34 = sub_20D191E38();
  v36 = v35;
  if (v34 == sub_20D191E38() && v36 == v37)
  {
    OUTLINED_FUNCTION_5_1();
LABEL_106:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8DA8);
    *(_OWORD *)(OUTLINED_FUNCTION_12_1() + 16) = xmmword_20D1952E0;
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_21();
  }
  v39 = OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_13_1();
  if ((v39 & 1) != 0)
    goto LABEL_106;
  return MEMORY[0x24BEE4AF8];
}

void sub_20D151C64(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
  OUTLINED_FUNCTION_0_1();
  JUMPOUT(0x20D151C08);
}

void sub_20D151C78(double a1, double a2, double a3, double a4)
{
  double v4;
  double v5;

  OUTLINED_FUNCTION_16_0(*(CGRect *)&a1);
  if (v5 > OUTLINED_FUNCTION_19_0())
  {
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_15_0();
    if (v4 <= OUTLINED_FUNCTION_17_0())
    {
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  __break(1u);
}

unint64_t PISemanticStyleCast.gradientImageName.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char v87;

  v0 = sub_20D191E38();
  v2 = v1;
  if (v0 == OUTLINED_FUNCTION_11_1() && v2 == v3)
  {
    OUTLINED_FUNCTION_7_2();
    return 0xD000000000000012;
  }
  v5 = OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_13_1();
  if ((v5 & 1) != 0)
    return 0xD000000000000012;
  v6 = sub_20D191E38();
  v8 = v7;
  if (v6 == OUTLINED_FUNCTION_11_1() && v8 == v9)
  {
    OUTLINED_FUNCTION_7_2();
    return 0xD000000000000010;
  }
  v11 = OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_13_1();
  if ((v11 & 1) != 0)
    return 0xD000000000000010;
  OUTLINED_FUNCTION_18_0();
  v12 = 0x4152475F45534F52;
  v14 = sub_20D191E38();
  v16 = v15;
  if (v14 == OUTLINED_FUNCTION_11_1() && v16 == v17)
    goto LABEL_82;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_2();
  if ((v14 & 1) != 0)
    return v12;
  v12 = 0x4152475F444C4F47;
  v19 = sub_20D191E38();
  v21 = v20;
  if (v19 == OUTLINED_FUNCTION_11_1() && v21 == v22)
    goto LABEL_82;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_2();
  if ((v19 & 1) != 0)
    return v12;
  v12 = 0x52475F5245424D41;
  v24 = sub_20D191E38();
  v26 = v25;
  if (v24 == OUTLINED_FUNCTION_11_1() && v26 == v27)
  {
LABEL_82:
    OUTLINED_FUNCTION_5_1();
    return v12;
  }
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_2();
  if ((v24 & 1) != 0)
    return v12;
  v29 = sub_20D191E38();
  v31 = v30;
  if (v29 == OUTLINED_FUNCTION_11_1() && v31 == v32)
  {
    OUTLINED_FUNCTION_7_2();
    return 0xD000000000000011;
  }
  v34 = OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_8_1();
  if ((v34 & 1) != 0)
    return 0xD000000000000011;
  v35 = sub_20D191E38();
  v37 = v36;
  if (v35 == OUTLINED_FUNCTION_11_1() && v37 == v38)
  {
    OUTLINED_FUNCTION_7_2();
    return 0xD000000000000010;
  }
  v40 = OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_8_1();
  if ((v40 & 1) != 0)
    return 0xD000000000000010;
  v41 = sub_20D191E38();
  v43 = v42;
  if (v41 == OUTLINED_FUNCTION_11_1() && v43 == v44)
  {
    OUTLINED_FUNCTION_7_2();
    return 0xD000000000000010;
  }
  v46 = OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_8_1();
  if ((v46 & 1) != 0)
    return 0xD000000000000010;
  v47 = sub_20D191E38();
  v49 = v48;
  if (v47 == OUTLINED_FUNCTION_11_1() && v49 == v50)
  {
    OUTLINED_FUNCTION_7_2();
    return 0xD000000000000011;
  }
  v52 = OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_8_1();
  if ((v52 & 1) != 0)
    return 0xD000000000000011;
  v53 = sub_20D191E38();
  v55 = v54;
  if (v53 == OUTLINED_FUNCTION_11_1() && v55 == v56)
  {
    OUTLINED_FUNCTION_7_2();
    return 0xD000000000000011;
  }
  v58 = OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_8_1();
  if ((v58 & 1) != 0)
    return 0xD000000000000011;
  v12 = 0x52475F5445495551;
  v59 = sub_20D191E38();
  v61 = v60;
  if (v59 == OUTLINED_FUNCTION_11_1() && v61 == v62)
    goto LABEL_82;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_2();
  if ((v59 & 1) == 0)
  {
    v12 = 0x4152475F595A4F43;
    v64 = sub_20D191E38();
    v66 = v65;
    if (v64 == OUTLINED_FUNCTION_11_1() && v66 == v67)
    {
      OUTLINED_FUNCTION_7_2();
      OUTLINED_FUNCTION_18_0();
      return v12;
    }
    v69 = OUTLINED_FUNCTION_6_1();
    OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_8_1();
    OUTLINED_FUNCTION_18_0();
    if ((v69 & 1) == 0)
    {
      v70 = sub_20D191E38();
      v72 = v71;
      if (v70 == OUTLINED_FUNCTION_11_1() && v72 == v73)
      {
        OUTLINED_FUNCTION_7_2();
      }
      else
      {
        v75 = OUTLINED_FUNCTION_6_1();
        OUTLINED_FUNCTION_14_1();
        OUTLINED_FUNCTION_13_1();
        if ((v75 & 1) == 0)
        {
          v76 = sub_20D191E38();
          v78 = v77;
          if (v76 == OUTLINED_FUNCTION_11_1() && v78 == v79)
          {
            OUTLINED_FUNCTION_7_2();
          }
          else
          {
            v81 = OUTLINED_FUNCTION_6_1();
            OUTLINED_FUNCTION_14_1();
            OUTLINED_FUNCTION_13_1();
            if ((v81 & 1) == 0)
            {
              v82 = sub_20D191E38();
              v84 = v83;
              if (v82 == OUTLINED_FUNCTION_11_1() && v84 == v85)
              {
                OUTLINED_FUNCTION_7_2();
              }
              else
              {
                v87 = OUTLINED_FUNCTION_6_1();
                OUTLINED_FUNCTION_14_1();
                swift_bridgeObjectRelease();
                if ((v87 & 1) == 0)
                  return 0;
              }
              return 0xD000000000000012;
            }
          }
          return 0xD000000000000012;
        }
      }
      return 0xD000000000000011;
    }
  }
  return v12;
}

uint64_t sub_20D152308()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_20D191E38();
  v2 = v1;
  if (v0 == sub_20D191E38() && v2 == v3)
    v5 = 1;
  else
    v5 = OUTLINED_FUNCTION_6_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_14_1();
  return v5 & 1;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v0, v2, v1);
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return sub_20D191F1C();
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return sub_20D191E38();
}

void OUTLINED_FUNCTION_3_1()
{
  JUMPOUT(0x212B9E270);
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return sub_20D191F1C();
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return sub_20D191E38();
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return swift_bridgeObjectRelease();
}

double OUTLINED_FUNCTION_15_0()
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

double OUTLINED_FUNCTION_16_0(CGRect rect)
{
  return CGRectGetMinX(rect);
}

double OUTLINED_FUNCTION_17_0()
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

double OUTLINED_FUNCTION_19_0()
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

void OUTLINED_FUNCTION_21()
{
  JUMPOUT(0x212B9E270);
}

uint64_t sub_20D1524DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1);
}

uint64_t sub_20D1524F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = sub_20D1917B4();
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_20D1917C0();
}

double sub_20D1525B8@<D0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v4;
  double result;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  char v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  _BYTE v14[24];

  v4 = a1[1];
  v11 = *a1;
  v12 = v4;
  sub_20D1625F4((uint64_t)&v11, (uint64_t)v14);
  v13 = *((_QWORD *)&v12 + 1);
  v10 = a1[2];
  sub_20D162630((uint64_t)v14);
  sub_20D162660((uint64_t)&v13);
  sub_20D162688((uint64_t)&v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A97D0);
  sub_20D162570();
  sub_20D1917C0();
  result = *(double *)&v6;
  *(_OWORD *)a2 = v6;
  *(_OWORD *)(a2 + 16) = v7;
  *(_OWORD *)(a2 + 32) = v8;
  *(_BYTE *)(a2 + 48) = v9;
  return result;
}

uint64_t sub_20D1526BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v5 = sub_20D1917B4();
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_20D1917C0();
}

uint64_t sub_20D152780(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[2];

  v16[1] = a6;
  v9 = *(_QWORD *)(a4 - 8);
  v10 = MEMORY[0x24BDAC7A8](a1);
  v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  (*(void (**)(char *, uint64_t))(v14 + 16))((char *)v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a1, a4);
  return sub_20D19137C();
}

uint64_t sub_20D152880@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_20D191EBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
}

uint64_t sub_20D1528BC()
{
  return 1;
}

uint64_t sub_20D1528C4()
{
  return sub_20D1528D0();
}

uint64_t sub_20D1528D0()
{
  _BYTE v1[40];

  sub_20D1913E8();
  sub_20D15B9B8();
  return sub_20D161A6C((uint64_t)v1);
}

void PhotoStyleValueLabels.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
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
  uint64_t v32;
  uint64_t v33;
  unsigned __int8 v34;
  unsigned __int8 v35;
  char v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t KeyPath;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
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
  unsigned int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;

  OUTLINED_FUNCTION_41();
  v4 = v1;
  v74 = v5;
  sub_20D191BEC();
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_2_3();
  v73 = v7;
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_2_3();
  v72 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_2_3();
  v70 = v11;
  v75 = OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_2_3();
  v66 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E10);
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_35();
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E18);
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_15_1();
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E20);
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_34();
  v20 = v19 - v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E28);
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_34();
  v24 = v23 - v22;
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E30);
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_3_2();
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E38);
  v63 = *(_QWORD *)(v26 - 8);
  v64 = v26;
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_2_3();
  v59 = v27;
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E40);
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_2_3();
  v62 = v29;
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E48);
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_2_3();
  v69 = v31;
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E50);
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_2_3();
  v68 = v33;
  v34 = sub_20D191874();
  v35 = sub_20D19188C();
  v36 = sub_20D191880();
  sub_20D191880();
  if (sub_20D191880() != v34)
    v36 = sub_20D191880();
  sub_20D191880();
  if (sub_20D191880() != v35)
    v36 = sub_20D191880();
  *v3 = v36;
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E58);
  sub_20D153074((uint64_t)&v3[*(int *)(v37 + 44)]);
  v38 = *(_BYTE *)(v4 + 25);
  OUTLINED_FUNCTION_64((uint64_t)v3, v0);
  *(_BYTE *)(v0 + *(int *)(v15 + 52)) = v38;
  OUTLINED_FUNCTION_62((uint64_t)v3);
  sub_20D191448();
  sub_20D191D0C();
  v39 = sub_20D191460();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_64(v0, v20);
  *(_QWORD *)(v20 + *(int *)(v58 + 36)) = v39;
  OUTLINED_FUNCTION_62(v0);
  sub_20D191CAC();
  sub_20D153698(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, v24, 0.0, 1, 28.0, 0);
  sub_20D14B87C(v20, &qword_2549A8E20);
  type metadata accessor for PhotoStyleValueLabels(0);
  sub_20D15B0FC(v66);
  v40 = (id)PXMonospacedNumberFontWithSizeAndWeight();
  v41 = sub_20D1918EC();
  OUTLINED_FUNCTION_58(v41, type metadata accessor for PhotoStyleValueLabels.Configuration);
  KeyPath = swift_getKeyPath();
  sub_20D162B6C(v24, v2, &qword_2549A8E28);
  v43 = (uint64_t *)(v2 + *(int *)(v61 + 36));
  *v43 = KeyPath;
  v43[1] = v41;
  sub_20D14B87C(v24, &qword_2549A8E28);
  sub_20D1918D4();
  sub_20D15BF4C();
  sub_20D191988();
  sub_20D14B87C(v2, &qword_2549A8E30);
  v44 = swift_getKeyPath();
  sub_20D191C88();
  v45 = OUTLINED_FUNCTION_36();
  __swift_storeEnumTagSinglePayload(v70, 0, 1, v45);
  v46 = (uint64_t *)(v62 + *(int *)(v60 + 36));
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EA0);
  OUTLINED_FUNCTION_64(v70, (uint64_t)v46 + *(int *)(v47 + 28));
  *v46 = v44;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v63 + 16))(v62, v59, v64);
  OUTLINED_FUNCTION_62(v70);
  (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v59, v64);
  sub_20D15B0FC(v66);
  sub_20D15C0AC(v66 + *(int *)(v75 + 24), v72, type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  sub_20D14A8AC(v66, type metadata accessor for PhotoStyleValueLabels.Configuration);
  v48 = *MEMORY[0x24BDEEB68];
  v71 = *MEMORY[0x24BDEEB68];
  v49 = sub_20D191748();
  v50 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 104);
  v50(v73, v48, v49);
  v51 = v69 + *(int *)(v65 + 36);
  sub_20D15C0AC(v72, v51, type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  v52 = v51 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EA8) + 36);
  OUTLINED_FUNCTION_63(v73, v52);
  sub_20D162B6C(v62, v69, &qword_2549A8E40);
  OUTLINED_FUNCTION_48(v73);
  OUTLINED_FUNCTION_56(v72);
  sub_20D14B87C(v62, &qword_2549A8E40);
  sub_20D15B0FC(v66);
  v53 = v66 + *(int *)(v75 + 32);
  v54 = *(_QWORD *)v53;
  v55 = *(_BYTE *)(v53 + 8);
  sub_20D14A8AC(v66, type metadata accessor for PhotoStyleValueLabels.Configuration);
  v50(v73, v71, v49);
  v56 = v68 + *(int *)(v67 + 36);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EB0);
  OUTLINED_FUNCTION_63(v73, v56 + *(int *)(v57 + 36));
  *(_QWORD *)v56 = v54;
  *(_BYTE *)(v56 + 8) = v55;
  *(_QWORD *)(v56 + *(int *)(v57 + 40)) = 0x3FA999999999999ALL;
  sub_20D162B6C(v69, v68, &qword_2549A8E48);
  OUTLINED_FUNCTION_48(v73);
  sub_20D14B87C(v69, &qword_2549A8E48);
  sub_20D162B40(v68, v74, &qword_2549A8E50);
  OUTLINED_FUNCTION_6_2();
}

uint64_t type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(uint64_t a1)
{
  return sub_20D14DB04(a1, (uint64_t *)&unk_2549A90B8);
}

uint64_t type metadata accessor for PhotoStyleValueLabels.Configuration(uint64_t a1)
{
  return sub_20D14DB04(a1, qword_2549A9000);
}

void sub_20D153074(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  _BYTE *v6;
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
  char *v19;
  uint64_t v20;
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
  uint64_t v33;

  v33 = a1;
  v1 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v28 - v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9820);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v32 = (uint64_t)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v31 = (uint64_t)&v28 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v29 = (uint64_t)&v28 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v28 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v28 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v28 - v20;
  v30 = (uint64_t)&v28 - v20;
  type metadata accessor for PhotoStyleValueLabels(0);
  sub_20D15B0FC((uint64_t)v6);
  sub_20D1533C8(v6, (uint64_t)v19);
  sub_20D14A8AC((uint64_t)v6, type metadata accessor for PhotoStyleValueLabels.Configuration);
  sub_20D162B40((uint64_t)v19, (uint64_t)v21, &qword_2549A9820);
  sub_20D15B0FC((uint64_t)v4);
  sub_20D15C0AC((uint64_t)v4, (uint64_t)v6, type metadata accessor for PhotoStyleValueLabels.Configuration);
  *v6 = 1;
  sub_20D14A8AC((uint64_t)v4, type metadata accessor for PhotoStyleValueLabels.Configuration);
  sub_20D1533C8(v6, (uint64_t)v16);
  sub_20D14A8AC((uint64_t)v6, type metadata accessor for PhotoStyleValueLabels.Configuration);
  sub_20D162B40((uint64_t)v16, (uint64_t)v19, &qword_2549A9820);
  sub_20D15B0FC((uint64_t)v4);
  sub_20D15C0AC((uint64_t)v4, (uint64_t)v6, type metadata accessor for PhotoStyleValueLabels.Configuration);
  *v6 = 2;
  sub_20D14A8AC((uint64_t)v4, type metadata accessor for PhotoStyleValueLabels.Configuration);
  v22 = v29;
  sub_20D1533C8(v6, v29);
  sub_20D14A8AC((uint64_t)v6, type metadata accessor for PhotoStyleValueLabels.Configuration);
  sub_20D162B40(v22, (uint64_t)v16, &qword_2549A9820);
  v23 = v30;
  sub_20D162B6C(v30, v22, &qword_2549A9820);
  v24 = v31;
  sub_20D162B6C((uint64_t)v19, v31, &qword_2549A9820);
  v25 = v32;
  sub_20D162B6C((uint64_t)v16, v32, &qword_2549A9820);
  v26 = v33;
  sub_20D162B6C(v22, v33, &qword_2549A9820);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9828);
  sub_20D162B6C(v24, v26 + *(int *)(v27 + 48), &qword_2549A9820);
  sub_20D162B6C(v25, v26 + *(int *)(v27 + 64), &qword_2549A9820);
  sub_20D14B87C((uint64_t)v16, &qword_2549A9820);
  sub_20D14B87C((uint64_t)v19, &qword_2549A9820);
  sub_20D14B87C(v23, &qword_2549A9820);
  sub_20D14B87C(v25, &qword_2549A9820);
  sub_20D14B87C(v24, &qword_2549A9820);
  sub_20D14B87C(v22, &qword_2549A9820);
}

void sub_20D1533C8(_BYTE *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
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
  char *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t KeyPath;
  char *v23;
  char *v24;
  uint64_t v25;
  char v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v3 = v2;
  v34 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9830);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9838);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9840);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9848);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *a1;
  v18 = sub_20D1916E8();
  v19 = 0x4000000000000000;
  if (!v17)
    v19 = 0x4020000000000000;
  *(_QWORD *)v7 = v18;
  *((_QWORD *)v7 + 1) = v19;
  v7[16] = 0;
  if (v17)
    v20 = 0.5;
  else
    v20 = 1.0;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9850);
  sub_20D1538D8(v3, a1, (uint64_t)&v7[*(int *)(v21 + 44)]);
  KeyPath = swift_getKeyPath();
  sub_20D162B6C((uint64_t)v7, (uint64_t)v10, &qword_2549A9830);
  v23 = &v10[*(int *)(v8 + 36)];
  *(_QWORD *)v23 = KeyPath;
  *((double *)v23 + 1) = v20;
  sub_20D14B87C((uint64_t)v7, &qword_2549A9830);
  sub_20D162B6C((uint64_t)v10, (uint64_t)v13, &qword_2549A9838);
  v24 = &v13[*(int *)(v11 + 36)];
  *(_QWORD *)v24 = 0;
  *((_WORD *)v24 + 4) = 1;
  sub_20D14B87C((uint64_t)v10, &qword_2549A9838);
  if (*a1)
    v25 = 0x4030000000000000;
  else
    v25 = 0x4036000000000000;
  v26 = sub_20D1918A4();
  sub_20D162B6C((uint64_t)v13, (uint64_t)v16, &qword_2549A9840);
  v27 = &v16[*(int *)(v14 + 36)];
  *v27 = v26;
  *((_QWORD *)v27 + 1) = 0x4018000000000000;
  *((_QWORD *)v27 + 2) = v25;
  *(_OWORD *)(v27 + 24) = xmmword_20D196140;
  v27[40] = 0;
  sub_20D14B87C((uint64_t)v13, &qword_2549A9840);
  v28 = swift_getKeyPath();
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9820);
  v30 = v34;
  v31 = (uint64_t *)(v34 + *(int *)(v29 + 36));
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A95F0);
  sub_20D15C0AC((uint64_t)a1, (uint64_t)v31 + *(int *)(v32 + 28), type metadata accessor for PhotoStyleValueLabels.Configuration);
  *v31 = v28;
  sub_20D162B40((uint64_t)v16, v30, &qword_2549A9848);
}

void *sub_20D153698@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v13;
  void *v23;
  uint64_t v24;
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
    sub_20D191E8C();
    v23 = (void *)sub_20D191868();
    sub_20D19134C();

  }
  sub_20D1915EC();
  sub_20D162B6C(v13, a9, &qword_2549A8E20);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E28);
  return memcpy((void *)(a9 + *(int *)(v24 + 36)), __src, 0x70uLL);
}

uint64_t type metadata accessor for PhotoStyleValueLabels(uint64_t a1)
{
  return sub_20D14DB04(a1, (uint64_t *)&unk_2549A8F48);
}

uint64_t sub_20D153848(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
  MEMORY[0x24BDAC7A8](v2);
  sub_20D162B6C(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_2549A8E08);
  return sub_20D191640();
}

BOOL sub_20D1538C8(char a1, char a2)
{
  return a1 == a2;
}

void sub_20D1538D8(uint64_t *a1@<X0>, _BYTE *a2@<X1>, uint64_t a3@<X8>)
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
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t *v84;
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
  char *v95;
  uint64_t v96;
  uint64_t v97;
  _BYTE *v98;
  uint64_t v99;
  uint64_t v100;
  _BYTE *v101;
  uint64_t *v102;
  uint64_t v103;
  char *v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;

  v98 = a2;
  v107 = a3;
  v99 = type metadata accessor for PhotoStyleValueLabels.ResetButton(0);
  MEMORY[0x24BDAC7A8](v99);
  v101 = (char *)&v94 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9858);
  MEMORY[0x24BDAC7A8](v103);
  v100 = (uint64_t)&v94 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9860);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v106 = (uint64_t)&v94 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v105 = (char *)&v94 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9868);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v94 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v94 - v14;
  v16 = type metadata accessor for PhotoStyleValueLabels.ValueLabel(0);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (uint64_t *)((char *)&v94 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v20 = MEMORY[0x24BDAC7A8](v17);
  v97 = (uint64_t)&v94 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v96 = (uint64_t)&v94 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v94 - v25;
  v27 = MEMORY[0x24BDAC7A8](v24);
  v29 = (uint64_t *)((char *)&v94 - v28);
  MEMORY[0x24BDAC7A8](v27);
  v31 = (uint64_t *)((char *)&v94 - v30);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9870);
  v33 = MEMORY[0x24BDAC7A8](v32);
  v109 = (uint64_t)&v94 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v33);
  v36 = (char *)&v94 - v35;
  v37 = *((_BYTE *)a1 + 24);
  v108 = (uint64_t)&v94 - v35;
  v104 = v15;
  if ((v37 & 1) != 0)
  {
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9880);
    __swift_storeEnumTagSinglePayload((uint64_t)v36, 1, 1, v38);
  }
  else
  {
    v39 = (void *)sub_20D191E14();
    v102 = a1;
    v40 = v39;
    v41 = PELocalizedString(v39);

    v42 = sub_20D191E38();
    v95 = v13;
    v43 = v42;
    v45 = v44;

    v46 = *v102;
    v31[2] = 0;
    v31[3] = 0;
    v47 = (uint64_t *)((char *)v31 + *(int *)(v16 + 28));
    *v47 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE0);
    swift_storeEnumTagMultiPayload();
    v48 = (uint64_t *)((char *)v31 + *(int *)(v16 + 32));
    *v48 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BB8);
    swift_storeEnumTagMultiPayload();
    *v31 = v43;
    v31[1] = v45;
    swift_bridgeObjectRelease();
    v31[2] = 0;
    v31[3] = 0;
    v31[4] = v46;
    v49 = (void *)sub_20D191E14();
    v50 = PELocalizedString(v49);

    v51 = sub_20D191E38();
    v53 = v52;

    v54 = v102[1];
    v29[2] = 0;
    v29[3] = 0;
    v55 = (uint64_t *)((char *)v29 + *(int *)(v16 + 28));
    *v55 = swift_getKeyPath();
    swift_storeEnumTagMultiPayload();
    v56 = (uint64_t *)((char *)v29 + *(int *)(v16 + 32));
    *v56 = swift_getKeyPath();
    v57 = v109;
    a1 = v102;
    swift_storeEnumTagMultiPayload();
    *v29 = v51;
    v29[1] = v53;
    v13 = v95;
    swift_bridgeObjectRelease();
    v29[2] = 0;
    v29[3] = 0;
    v29[4] = v54;
    sub_20D15C0AC((uint64_t)v31, (uint64_t)v26, type metadata accessor for PhotoStyleValueLabels.ValueLabel);
    v58 = v96;
    sub_20D15C0AC((uint64_t)v29, v96, type metadata accessor for PhotoStyleValueLabels.ValueLabel);
    sub_20D15C0AC((uint64_t)v26, v57, type metadata accessor for PhotoStyleValueLabels.ValueLabel);
    v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9878);
    sub_20D15C0AC(v58, v57 + *(int *)(v59 + 48), type metadata accessor for PhotoStyleValueLabels.ValueLabel);
    sub_20D14A8AC((uint64_t)v29, type metadata accessor for PhotoStyleValueLabels.ValueLabel);
    sub_20D14A8AC((uint64_t)v31, type metadata accessor for PhotoStyleValueLabels.ValueLabel);
    sub_20D14A8AC(v58, type metadata accessor for PhotoStyleValueLabels.ValueLabel);
    sub_20D14A8AC((uint64_t)v26, type metadata accessor for PhotoStyleValueLabels.ValueLabel);
    v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9880);
    __swift_storeEnumTagSinglePayload(v57, 0, 1, v60);
    sub_20D162B40(v57, v108, &qword_2549A9870);
  }
  if ((*((_BYTE *)a1 + 25) & 1) != 0)
  {
    v61 = 1;
    v63 = (uint64_t)v104;
    v62 = (uint64_t)v105;
  }
  else
  {
    v64 = 0xD000000000000012;
    v65 = (void *)sub_20D191E14();
    v66 = PELocalizedString(v65);

    v67 = sub_20D191E38();
    v69 = v68;

    if (*v98 == 2)
    {
      v70 = 0x800000020D1A13E0;
    }
    else
    {
      v64 = 0;
      v70 = 0;
    }
    v71 = a1[2];
    v19[2] = 0;
    v19[3] = 0;
    v72 = (uint64_t *)((char *)v19 + *(int *)(v16 + 28));
    *v72 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE0);
    swift_storeEnumTagMultiPayload();
    v73 = (uint64_t *)((char *)v19 + *(int *)(v16 + 32));
    *v73 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BB8);
    swift_storeEnumTagMultiPayload();
    *v19 = v67;
    v19[1] = v69;
    swift_bridgeObjectRelease();
    v19[2] = v64;
    v19[3] = v70;
    v19[4] = v71;
    v74 = (uint64_t)v19;
    v75 = v97;
    sub_20D162774(v74, v97, type metadata accessor for PhotoStyleValueLabels.ValueLabel);
    v63 = (uint64_t)v104;
    sub_20D162774(v75, (uint64_t)v104, type metadata accessor for PhotoStyleValueLabels.ValueLabel);
    v61 = 0;
    v62 = (uint64_t)v105;
  }
  v76 = v103;
  v77 = 1;
  __swift_storeEnumTagSinglePayload(v63, v61, 1, v16);
  if ((*((_BYTE *)a1 + 26) & 1) == 0)
  {
    v79 = a1[4];
    v78 = a1[5];
    v80 = v101;
    *v101 = *((_BYTE *)a1 + 27);
    v80[1] = v79;
    v80[2] = v78;
    v80[3] = 0x4018000000000000;
    v110 = 0;
    swift_retain();
    sub_20D191B80();
    v81 = v112;
    v80[4] = v111;
    v80[5] = v81;
    v82 = v99;
    v83 = (_QWORD *)((char *)v80 + *(int *)(v99 + 32));
    *v83 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE0);
    swift_storeEnumTagMultiPayload();
    v84 = (_QWORD *)((char *)v80 + *(int *)(v82 + 36));
    *v84 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BB8);
    swift_storeEnumTagMultiPayload();
    v85 = v100;
    sub_20D15C0AC((uint64_t)v80, v100, type metadata accessor for PhotoStyleValueLabels.ResetButton);
    *(_QWORD *)(v85 + *(int *)(v76 + 36)) = 0x3FF0000000000000;
    sub_20D14A8AC((uint64_t)v80, type metadata accessor for PhotoStyleValueLabels.ResetButton);
    sub_20D162B40(v85, v62, &qword_2549A9858);
    v77 = 0;
  }
  __swift_storeEnumTagSinglePayload(v62, v77, 1, v76);
  v86 = v108;
  v87 = v109;
  sub_20D162B6C(v108, v109, &qword_2549A9870);
  v88 = v63;
  v89 = v63;
  v90 = (uint64_t)v13;
  sub_20D162B6C(v88, (uint64_t)v13, &qword_2549A9868);
  v91 = v106;
  sub_20D162B6C(v62, v106, &qword_2549A9860);
  v92 = v107;
  sub_20D162B6C(v87, v107, &qword_2549A9870);
  v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9888);
  sub_20D162B6C(v90, v92 + *(int *)(v93 + 48), &qword_2549A9868);
  sub_20D162B6C(v91, v92 + *(int *)(v93 + 64), &qword_2549A9860);
  sub_20D14B87C(v62, &qword_2549A9860);
  sub_20D14B87C(v89, &qword_2549A9868);
  sub_20D14B87C(v86, &qword_2549A9870);
  sub_20D14B87C(v91, &qword_2549A9860);
  sub_20D14B87C(v90, &qword_2549A9868);
  sub_20D14B87C(v87, &qword_2549A9870);
}

void sub_20D15418C(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t KeyPath;
  char *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v2 = v1;
  v29 = a1;
  v3 = sub_20D191724();
  MEMORY[0x24BDAC7A8](v3);
  v4 = sub_20D191838();
  v26 = *(_QWORD *)(v4 - 8);
  v27 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9738);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9740);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9748);
  v25 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9750);
  MEMORY[0x24BDAC7A8](v28);
  v24 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v9 = sub_20D1916E8();
  *((_QWORD *)v9 + 1) = 0x4000000000000000;
  v9[16] = 0;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9758);
  sub_20D1544F8(v2, (uint64_t)&v9[*(int *)(v17 + 44)]);
  KeyPath = swift_getKeyPath();
  sub_20D162B6C((uint64_t)v9, (uint64_t)v12, &qword_2549A9738);
  v19 = &v12[*(int *)(v10 + 36)];
  *(_QWORD *)v19 = KeyPath;
  *((_QWORD *)v19 + 1) = 1;
  v19[16] = 0;
  sub_20D14B87C((uint64_t)v9, &qword_2549A9738);
  sub_20D19182C();
  v20 = sub_20D1622CC();
  sub_20D1919F4();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v6, v27);
  sub_20D14B87C((uint64_t)v12, &qword_2549A9740);
  v21 = v2[1];
  v22 = v2;
  v32 = *v2;
  v33 = v21;
  v30 = v10;
  v31 = v20;
  swift_getOpaqueTypeConformance2();
  sub_20D1620C0();
  v23 = (uint64_t)v24;
  sub_20D1919DC();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v15, v13);
  sub_20D191718();
  sub_20D19170C();
  v32 = sub_20D155668(*((double *)v22 + 4));
  sub_20D191700();
  sub_20D19170C();
  sub_20D19173C();
  sub_20D191520();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_20D14B87C(v23, &qword_2549A9750);
}

uint64_t sub_20D1544F8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
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
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  char *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[5];
  unsigned __int8 v34;

  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9780);
  MEMORY[0x24BDAC7A8](v32);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9788);
  v6 = MEMORY[0x24BDAC7A8](v31);
  v8 = (uint64_t *)((char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v25 - v9;
  v11 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D154798(a1, (uint64_t)v33);
  v14 = v33[2];
  v29 = v33[1];
  v30 = v33[0];
  v15 = v33[3];
  v28 = v33[4];
  v27 = v34;
  type metadata accessor for PhotoStyleValueLabels.ValueLabel(0);
  sub_20D15B0FC((uint64_t)v13);
  v16 = *((_QWORD *)v13 + 1);
  swift_retain();
  sub_20D14A8AC((uint64_t)v13, type metadata accessor for PhotoStyleValueLabels.Configuration);
  v17 = sub_20D191754();
  v18 = sub_20D1916DC();
  sub_20D154AB4((uint64_t)a1, (uint64_t)v5);
  v19 = (uint64_t *)&v5[*(int *)(v32 + 36)];
  *v19 = v17;
  v19[1] = v18;
  sub_20D162B6C((uint64_t)v5, (uint64_t)v8 + *(int *)(v31 + 36), &qword_2549A9780);
  *v8 = -100;
  sub_20D14B87C((uint64_t)v5, &qword_2549A9780);
  v26 = v10;
  sub_20D162B40((uint64_t)v8, (uint64_t)v10, &qword_2549A9788);
  sub_20D162B6C((uint64_t)v10, (uint64_t)v8, &qword_2549A9788);
  v21 = v29;
  v20 = v30;
  *(_QWORD *)a2 = v30;
  *(_QWORD *)(a2 + 8) = v21;
  *(_QWORD *)(a2 + 16) = v14;
  *(_QWORD *)(a2 + 24) = v15;
  v22 = v28;
  *(_QWORD *)(a2 + 32) = v28;
  LOBYTE(v10) = v27;
  *(_BYTE *)(a2 + 40) = v27;
  *(_QWORD *)(a2 + 48) = v16;
  *(_QWORD *)(a2 + 56) = 1;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9790);
  sub_20D162B6C((uint64_t)v8, a2 + *(int *)(v23 + 48), &qword_2549A9788);
  sub_20D162368(v20, v21, v14, v15, v22, (char)v10);
  swift_retain();
  sub_20D14B87C((uint64_t)v26, &qword_2549A9788);
  sub_20D14B87C((uint64_t)v8, &qword_2549A9788);
  sub_20D1623A8(v20, v21, v14, v15, v22, (char)v10);
  return swift_release();
}

double sub_20D154798@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  uint64_t v19;
  char v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  double result;
  __int128 v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  char v42;

  v4 = sub_20D191508();
  v33 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v32 - v8;
  v10 = sub_20D191B14();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A97F0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1[3])
  {
    v32 = a2;
    swift_bridgeObjectRetain();
    sub_20D191B08();
    sub_20D191760();
    v17 = sub_20D19176C();
    __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v17);
    sub_20D191B20();
    swift_release();
    sub_20D14B87C((uint64_t)v16, &qword_2549A97F0);
    (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x24BDF3FD0], v10);
    v18 = sub_20D191B2C();
    a2 = v32;
    swift_release();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    type metadata accessor for PhotoStyleValueLabels.ValueLabel(0);
    sub_20D15AF40();
    v19 = v33;
    (*(void (**)(char *, _QWORD, uint64_t))(v33 + 104))(v7, *MEMORY[0x24BDED100], v4);
    v20 = sub_20D1914FC();
    v21 = *(void (**)(char *, uint64_t))(v19 + 8);
    v21(v7, v4);
    v21(v9, v4);
    v22 = 0x4008000000000000;
    v34 = v18;
    if ((v20 & 1) == 0)
      v22 = 0;
    v35 = xmmword_20D196150;
    v36 = v22;
    v37 = 0;
    v38 = 0;
  }
  else
  {
    v23 = *a1;
    v24 = a1[1];
    *(_QWORD *)&v39 = v23;
    *((_QWORD *)&v39 + 1) = v24;
    sub_20D1620C0();
    swift_bridgeObjectRetain();
    v34 = sub_20D19194C();
    *(_QWORD *)&v35 = v25;
    *((_QWORD *)&v35 + 1) = v26 & 1;
    v36 = v27;
    v37 = 0;
    v38 = 1;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A97F8);
  sub_20D161C74(&qword_2549A9800, &qword_2549A97F8, (void (*)(void))sub_20D1626B0);
  sub_20D1917C0();
  result = *(double *)&v39;
  v29 = v40;
  v30 = v41;
  v31 = v42;
  *(_OWORD *)a2 = v39;
  *(_OWORD *)(a2 + 16) = v29;
  *(_QWORD *)(a2 + 32) = v30;
  *(_BYTE *)(a2 + 40) = v31;
  return result;
}

void sub_20D154AB4(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t KeyPath;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  _BYTE v36[199];
  _BYTE v37[192];
  _BYTE v38[216];

  v27 = a1;
  v32 = a2;
  v3 = sub_20D191508();
  v30 = *(_QWORD *)(v3 - 8);
  v31 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v29 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9798);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A97A0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A97A8);
  MEMORY[0x24BDAC7A8](v28);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_20D1916E8();
  sub_20D154DFC(a1, (uint64_t)v37);
  v38[200] = 0;
  memcpy(&v38[7], v37, 0xC0uLL);
  v33 = v17;
  v34 = 0;
  v35 = 0;
  memcpy(v36, v38, sizeof(v36));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A97B0);
  sub_20D150EAC(&qword_2549A97B8, &qword_2549A97B0);
  sub_20D1919B8();
  sub_20D1623E8((uint64_t)v37);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v14, v11, v8);
  *(_WORD *)&v14[*(int *)(v12 + 36)] = 1;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  type metadata accessor for PhotoStyleValueLabels.ValueLabel(0);
  sub_20D15B0FC((uint64_t)v7);
  v18 = *((_QWORD *)v7 + 1);
  swift_retain();
  sub_20D14A8AC((uint64_t)v7, type metadata accessor for PhotoStyleValueLabels.Configuration);
  sub_20D162B6C((uint64_t)v14, (uint64_t)v16, &qword_2549A97A0);
  *(_QWORD *)&v16[*(int *)(v28 + 36)] = v18;
  sub_20D14B87C((uint64_t)v14, &qword_2549A97A0);
  KeyPath = swift_getKeyPath();
  v21 = v29;
  v20 = v30;
  v22 = v31;
  (*(void (**)(char *, _QWORD, uint64_t))(v30 + 104))(v29, *MEMORY[0x24BDED100], v31);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A97C0);
  v24 = v32;
  v25 = (uint64_t *)(v32 + *(int *)(v23 + 36));
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A97C8);
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))((char *)v25 + *(int *)(v26 + 28), v21, v22);
  *v25 = KeyPath;
  sub_20D162B6C((uint64_t)v16, v24, &qword_2549A97A8);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v22);
  sub_20D14B87C((uint64_t)v16, &qword_2549A97A8);
}

uint64_t sub_20D154DFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  int v13;
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
  int v24;
  double v25;
  uint64_t result;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  char v50;
  uint64_t v51;
  char v52;
  double v53;
  uint64_t v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  char v61;
  char v62;
  int v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  int v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  double v89;
  char v90;
  char v91;
  char v92;
  uint64_t v93;
  _BYTE v94[7];
  char v95;
  _BYTE v96[7];
  char v97;
  _BYTE v98[7];
  char v99;
  _BYTE v100[7];
  char v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  unsigned __int8 v108;

  v77 = sub_20D191610();
  v76 = *(_QWORD *)(v77 - 8);
  MEMORY[0x24BDAC7A8](v77);
  v75 = (char *)&v73 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_20D191724();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v81 = (char *)&v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  MEMORY[0x24BDAC7A8](v8);
  v9 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D191730();
  v83 = sub_20D191940();
  v82 = v12;
  v78 = v13;
  v15 = v14;
  v79 = sub_20D155668(*(double *)(a1 + 32));
  v80 = sub_20D1918B0();
  type metadata accessor for PhotoStyleValueLabels.ValueLabel(0);
  sub_20D15B0FC((uint64_t)v11);
  sub_20D14A8AC((uint64_t)v11, type metadata accessor for PhotoStyleValueLabels.Configuration);
  sub_20D191370();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  sub_20D15B0FC((uint64_t)v11);
  v24 = v11[*(int *)(v9 + 36)];
  sub_20D14A8AC((uint64_t)v11, type metadata accessor for PhotoStyleValueLabels.Configuration);
  v84 = v15;
  if (v24 != 1)
  {
    sub_20D191718();
    sub_20D19170C();
    v45 = *(double *)(a1 + 32);
    result = sub_20D1556BC(v45);
    if ((result & 0x8000000000000000) == 0 || (v28 = __OFSUB__(0, result), result = -result, !v28))
    {
      v102 = result;
      sub_20D191700();
      sub_20D19170C();
      sub_20D19173C();
      v46 = sub_20D191940();
      v48 = v47;
      *(_QWORD *)&v85 = v46;
      *((_QWORD *)&v85 + 1) = v47;
      v50 = v49 & 1;
      LOBYTE(v86) = v49 & 1;
      v87 = v51;
      v88 = 0;
      v89 = v45;
      sub_20D162398(v46, v47, v49 & 1);
      swift_bridgeObjectRetain();
      sub_20D1525B8(&v85, (uint64_t)&v102);
      v42 = v102;
      v77 = v103;
      v43 = v105;
      v76 = v104;
      v75 = v106;
      v74 = v107;
      v44 = v108;
      sub_20D1623D8(v46, v48, v50);
      swift_bridgeObjectRelease();
      sub_20D1623D8(v46, v48, v50);
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
LABEL_15:
    __break(1u);
    return result;
  }
  sub_20D191718();
  sub_20D19170C();
  v25 = *(double *)(a1 + 32);
  result = sub_20D1556BC(v25);
  v27 = a1;
  if (result < 0)
  {
    v28 = __OFSUB__(0, result);
    result = -result;
    if (v28)
    {
      __break(1u);
      goto LABEL_15;
    }
  }
  v102 = result;
  sub_20D191700();
  sub_20D19170C();
  sub_20D19173C();
  v29 = sub_20D191940();
  v31 = v30;
  v33 = v32 & 1;
  sub_20D1556BC(v25);
  v34 = v75;
  sub_20D191604();
  v35 = sub_20D191928();
  v73 = v27;
  v37 = v36;
  v39 = v38;
  v41 = v40 & 1;
  sub_20D1623D8(v29, v31, v33);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v76 + 8))(v34, v77);
  *(_QWORD *)&v85 = v35;
  *((_QWORD *)&v85 + 1) = v37;
  a1 = v73;
  v86 = v41;
  v87 = v39;
  v89 = 0.0;
  v88 = 0;
  v90 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A97D0);
  sub_20D162570();
  sub_20D1917C0();
  v42 = v102;
  v77 = v103;
  v43 = v105;
  v76 = v104;
  v75 = v106;
  v74 = v107;
  v44 = v108;
LABEL_8:
  LODWORD(v73) = v44;
  v52 = v78 & 1;
  sub_20D191718();
  sub_20D19170C();
  v53 = *(double *)(a1 + 32);
  v54 = sub_20D155668(v53) % 10;
  if (v54 < 0)
    v54 = -v54;
  if (((v79 > 0) | (unint64_t)(v79 >> 63)) == 0xFFFFFFFFFFFFFFFFLL)
    v55 = 1.0;
  else
    v55 = 0.0;
  v93 = v54;
  sub_20D191700();
  sub_20D19170C();
  sub_20D19173C();
  v56 = sub_20D191940();
  v58 = v57;
  v79 = v59;
  v92 = v52;
  v91 = v44;
  v61 = v60 & 1;
  LODWORD(v81) = v60 & 1;
  v101 = v52;
  v62 = v52;
  v99 = 0;
  v97 = v44;
  v95 = v61;
  *(_DWORD *)(a2 + 17) = v93;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)((char *)&v93 + 3);
  *(_DWORD *)(a2 + 41) = *(_DWORD *)v100;
  *(_DWORD *)(a2 + 44) = *(_DWORD *)&v100[3];
  *(_DWORD *)(a2 + 81) = *(_DWORD *)v98;
  *(_DWORD *)(a2 + 84) = *(_DWORD *)&v98[3];
  v63 = *(_DWORD *)v96;
  *(_DWORD *)(a2 + 140) = *(_DWORD *)&v96[3];
  *(_DWORD *)(a2 + 137) = v63;
  LOBYTE(v63) = v95;
  v64 = *(_DWORD *)v94;
  *(_DWORD *)(a2 + 164) = *(_DWORD *)&v94[3];
  *(_DWORD *)(a2 + 161) = v64;
  v65 = v83;
  v66 = v82;
  *(_QWORD *)a2 = v83;
  *(_QWORD *)(a2 + 8) = v66;
  *(_BYTE *)(a2 + 16) = v52;
  *(_QWORD *)(a2 + 24) = v84;
  *(double *)(a2 + 32) = v55;
  *(_BYTE *)(a2 + 40) = v80;
  *(_QWORD *)(a2 + 48) = v17;
  *(_QWORD *)(a2 + 56) = v19;
  *(_QWORD *)(a2 + 64) = v21;
  *(_QWORD *)(a2 + 72) = v23;
  *(_BYTE *)(a2 + 80) = 0;
  v67 = v77;
  *(_QWORD *)(a2 + 88) = v42;
  *(_QWORD *)(a2 + 96) = v67;
  v68 = v76;
  *(_QWORD *)(a2 + 104) = v76;
  *(_QWORD *)(a2 + 112) = v43;
  v69 = (uint64_t)v75;
  v70 = v74;
  *(_QWORD *)(a2 + 120) = v75;
  *(_QWORD *)(a2 + 128) = v70;
  *(_BYTE *)(a2 + 136) = v44;
  *(_QWORD *)(a2 + 144) = v56;
  *(_QWORD *)(a2 + 152) = v57;
  v71 = v56;
  *(_BYTE *)(a2 + 160) = v63;
  *(_QWORD *)(a2 + 168) = v59;
  *(_QWORD *)(a2 + 176) = 0;
  *(double *)(a2 + 184) = v53;
  sub_20D162398(v65, v66, v62);
  swift_bridgeObjectRetain();
  sub_20D16252C(v42, v67, v68, v43, v69, v70, v73);
  v72 = (char)v81;
  sub_20D162398(v71, v58, (char)v81);
  swift_bridgeObjectRetain();
  sub_20D1623D8(v71, v58, v72);
  swift_bridgeObjectRelease();
  sub_20D1624B8(v42, v67, v68, v43, v69, v70, v91);
  sub_20D1623D8(v83, v82, v92);
  return swift_bridgeObjectRelease();
}

uint64_t sub_20D155668(double a1)
{
  double v1;
  uint64_t result;

  v1 = round(a1 * 100.0);
  if ((~*(_QWORD *)&v1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v1 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v1 < 9.22337204e18)
    return (uint64_t)v1;
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_20D1556BC(double a1)
{
  double v1;
  uint64_t result;

  v1 = round(a1 * 100.0);
  if ((~*(_QWORD *)&v1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v1 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v1 < 9.22337204e18)
    return (uint64_t)v1 / 10;
LABEL_7:
  __break(1u);
  return result;
}

void sub_20D155718()
{
  sub_20D19161C();
  OUTLINED_FUNCTION_1();
}

void sub_20D155734(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = OUTLINED_FUNCTION_52();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_16_1();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v1, a1);
  sub_20D191628();
  OUTLINED_FUNCTION_7_3();
}

void sub_20D155798(uint64_t a1@<X8>)
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
  uint64_t *v13;
  uint64_t v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9618);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9620);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D1558C4((uint64_t)v5, 0.0);
  sub_20D162B6C((uint64_t)v5, (uint64_t)v8, &qword_2549A9618);
  sub_20D14B87C((uint64_t)v5, &qword_2549A9618);
  v9 = sub_20D191CAC();
  v11 = v10;
  v12 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549A9628) + 36);
  sub_20D1558C4(v12, *(double *)(v1 + 24));
  v13 = (uint64_t *)(v12 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549A9630) + 36));
  *v13 = v9;
  v13[1] = v11;
  sub_20D162B40((uint64_t)v8, a1, &qword_2549A9620);
}

void sub_20D1558C4(uint64_t a1@<X8>, double a2@<D0>)
{
  _BYTE *v2;
  _BYTE *v3;
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
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t KeyPath;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  double v31;
  uint64_t v32;
  void *v33;
  id v34;
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
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  double v51;
  uint64_t v52;
  uint64_t v53;

  v3 = v2;
  v49 = a1;
  v5 = sub_20D1915BC();
  v6 = *(_QWORD *)(v5 - 8);
  v47 = v5;
  v48 = v6;
  MEMORY[0x24BDAC7A8](v5);
  v45 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for PhotoStyleValueLabels.ResetButton(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9638);
  v11 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9640);
  MEMORY[0x24BDAC7A8](v39);
  v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9648);
  v44 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46);
  v17 = (char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9650);
  MEMORY[0x24BDAC7A8](v42);
  v19 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9658);
  MEMORY[0x24BDAC7A8](v43);
  v41 = (uint64_t)&v38 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D15C0AC((uint64_t)v3, (uint64_t)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for PhotoStyleValueLabels.ResetButton);
  v21 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v22 = swift_allocObject();
  sub_20D162774((uint64_t)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v22 + v21, type metadata accessor for PhotoStyleValueLabels.ResetButton);
  v50 = v3;
  v51 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9660);
  sub_20D161BD0();
  sub_20D191BA4();
  v23 = v40;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v15, v13, v40);
  *(_OWORD *)&v15[*(int *)(v39 + 36)] = xmmword_20D196160;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v23);
  v24 = v45;
  sub_20D1915B0();
  sub_20D161E84();
  sub_20D150DBC(&qword_2549A96E8, (void (*)(uint64_t))MEMORY[0x24BDED868]);
  v25 = v47;
  sub_20D191994();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v24, v25);
  sub_20D14B87C((uint64_t)v15, &qword_2549A9640);
  LOBYTE(v25) = *v3;
  KeyPath = swift_getKeyPath();
  v27 = swift_allocObject();
  *(_BYTE *)(v27 + 16) = (v25 & 1) == 0;
  v28 = v44;
  v29 = v46;
  (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v19, v17, v46);
  v30 = (uint64_t *)&v19[*(int *)(v42 + 36)];
  *v30 = KeyPath;
  v30[1] = (uint64_t)sub_20D161FB8;
  v30[2] = v27;
  (*(void (**)(char *, uint64_t))(v28 + 8))(v17, v29);
  if (*v3)
    v31 = 1.0;
  else
    v31 = 0.3;
  v32 = v41;
  sub_20D162B6C((uint64_t)v19, v41, &qword_2549A9650);
  *(double *)(v32 + *(int *)(v43 + 36)) = v31;
  sub_20D14B87C((uint64_t)v19, &qword_2549A9650);
  v33 = (void *)sub_20D191E14();
  v34 = PELocalizedString(v33);

  v35 = sub_20D191E38();
  v37 = v36;

  v52 = v35;
  v53 = v37;
  sub_20D161C74(&qword_2549A96F0, &qword_2549A9658, (void (*)(void))sub_20D161FD0);
  sub_20D1620C0();
  sub_20D1919DC();
  swift_bridgeObjectRelease();
  sub_20D14B87C(v32, &qword_2549A9658);
}

uint64_t sub_20D155D7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  unint64_t v9;
  uint64_t v10;
  _BYTE v12[16];
  uint64_t v13;

  v1 = v0;
  v2 = type metadata accessor for PhotoStyleValueLabels.ResetButton(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = sub_20D191850();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_20D191844();
  v13 = v1;
  sub_20D15C0AC(v1, (uint64_t)&v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], type metadata accessor for PhotoStyleValueLabels.ResetButton);
  v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v10 = swift_allocObject();
  sub_20D162774((uint64_t)&v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], v10 + v9, type metadata accessor for PhotoStyleValueLabels.ResetButton);
  sub_20D191D00();
  sub_20D1914A8();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_20D155ED4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v17;
  uint64_t v18;
  uint64_t KeyPath;
  uint64_t v20;
  uint64_t v21;
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
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
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
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v53 = a2;
  v51 = sub_20D19185C();
  MEMORY[0x24BDAC7A8](v51);
  v4 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_20D191DB4();
  v48 = *(_QWORD *)(v5 - 8);
  v49 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v54 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = sub_20D191D9C();
  v52 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46);
  v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9718);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9688);
  MEMORY[0x24BDAC7A8](v45);
  v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9678);
  MEMORY[0x24BDAC7A8](v50);
  v47 = (uint64_t)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = sub_20D191B08();
  type metadata accessor for PhotoStyleValueLabels.ResetButton(0);
  sub_20D15B0FC((uint64_t)v14);
  sub_20D14A8AC((uint64_t)v14, type metadata accessor for PhotoStyleValueLabels.Configuration);
  sub_20D1918D4();
  v18 = sub_20D1918C8();
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v18);
  v43 = sub_20D1918E0();
  sub_20D14B87C((uint64_t)v11, &qword_2549A9718);
  KeyPath = swift_getKeyPath();
  sub_20D15B0FC((uint64_t)v14);
  v20 = *((_QWORD *)v14 + 1);
  swift_retain();
  sub_20D14A8AC((uint64_t)v14, type metadata accessor for PhotoStyleValueLabels.Configuration);
  v21 = *(_QWORD *)(a1 + 40);
  v55 = *(_QWORD *)(a1 + 32);
  v56 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9720);
  sub_20D191B8C();
  v22 = v57;
  v42 = v8;
  sub_20D191D90();
  LOBYTE(a1) = *(_BYTE *)a1;
  v23 = v54;
  sub_20D191DA8();
  sub_20D150DBC(&qword_2549A9728, (void (*)(uint64_t))MEMORY[0x24BDF55F0]);
  v24 = (uint64_t)v4;
  v25 = v46;
  sub_20D191D84();
  v26 = v51;
  v28 = v48;
  v27 = v49;
  (*(void (**)(uint64_t, char *, uint64_t))(v48 + 16))(v24 + *(int *)(v51 + 20), v23, v49);
  *(_BYTE *)(v24 + *(int *)(v26 + 24)) = a1;
  sub_20D15C0AC(v24, (uint64_t)&v16[*(int *)(v45 + 36)], (uint64_t (*)(_QWORD))MEMORY[0x24BDF1220]);
  v29 = v43;
  *(_QWORD *)v16 = v44;
  *((_QWORD *)v16 + 1) = KeyPath;
  *((_QWORD *)v16 + 2) = v29;
  *((_QWORD *)v16 + 3) = v20;
  *((_QWORD *)v16 + 4) = v22;
  *(_OWORD *)(v16 + 40) = xmmword_20D196170;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_20D14A8AC(v24, (uint64_t (*)(_QWORD))MEMORY[0x24BDF1220]);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v54, v27);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v42, v25);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  LOBYTE(v29) = sub_20D1918A4();
  sub_20D191370();
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v38 = v47;
  sub_20D162B6C((uint64_t)v16, v47, &qword_2549A9688);
  v39 = v38 + *(int *)(v50 + 36);
  *(_BYTE *)v39 = v29;
  *(_QWORD *)(v39 + 8) = v31;
  *(_QWORD *)(v39 + 16) = v33;
  *(_QWORD *)(v39 + 24) = v35;
  *(_QWORD *)(v39 + 32) = v37;
  *(_BYTE *)(v39 + 40) = 0;
  sub_20D14B87C((uint64_t)v16, &qword_2549A9688);
  v40 = v53;
  sub_20D162B6C(v38, v53, &qword_2549A9678);
  *(_BYTE *)(v40 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549A9660) + 36)) = 0;
  sub_20D14B87C(v38, &qword_2549A9678);
}

uint64_t sub_20D156398(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char v10;
  void (*v11)(char *, uint64_t);
  double v12;
  uint64_t v13;
  _QWORD v15[4];

  v2 = sub_20D191508();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)v15 - v8;
  (*(void (**)(uint64_t))(a1 + 8))(v7);
  type metadata accessor for PhotoStyleValueLabels.ResetButton(0);
  sub_20D15AF40();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v6, *MEMORY[0x24BDED100], v2);
  v10 = sub_20D1914FC();
  v11 = *(void (**)(char *, uint64_t))(v3 + 8);
  v11(v6, v2);
  v11(v9, v2);
  v12 = 6.28318531;
  if ((v10 & 1) != 0)
    v12 = -6.28318531;
  v13 = *(_QWORD *)(a1 + 40);
  v15[0] = *(_QWORD *)(a1 + 32);
  v15[1] = v13;
  *(double *)&v15[3] = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9720);
  return sub_20D191B98();
}

uint64_t sub_20D1564E0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9720);
  return sub_20D191B98();
}

uint64_t sub_20D156530()
{
  sub_20D161B5C();
  return sub_20D1916C4();
}

void sub_20D156564(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t (*v5)(_QWORD);
  uint64_t v6;

  v2 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D15C0AC(a1, (uint64_t)v4, v5);
  sub_20D1565E0((uint64_t)v4);
}

void sub_20D1565E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_3_2();
  sub_20D15C0AC(a1, v1, type metadata accessor for PhotoStyleValueLabels.Configuration);
  sub_20D161B5C();
  sub_20D1916D0();
  sub_20D14A8AC(a1, type metadata accessor for PhotoStyleValueLabels.Configuration);
  OUTLINED_FUNCTION_7_3();
}

uint64_t sub_20D15665C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;

  v2 = sub_20D191724();
  MEMORY[0x24BDAC7A8](v2);
  sub_20D191718();
  sub_20D19170C();
  sub_20D191700();
  sub_20D19170C();
  sub_20D19173C();
  v3 = sub_20D191940();
  v5 = v4;
  v7 = v6 & 1;
  v8 = sub_20D19191C();
  v10 = v9;
  v12 = v11 & 1;
  sub_20D1623D8(v3, v5, v7);
  swift_bridgeObjectRelease();
  v13 = sub_20D191934();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  sub_20D1623D8(v8, v10, v12);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v13;
  *(_QWORD *)(a1 + 8) = v15;
  *(_BYTE *)(a1 + 16) = v17 & 1;
  *(_QWORD *)(a1 + 24) = v19;
  return result;
}

uint64_t sub_20D1567EC@<X0>(uint64_t a1@<X8>)
{
  return sub_20D15665C(a1);
}

uint64_t sub_20D1567F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, char *, uint64_t);
  void (*v40)(char *, uint64_t);
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
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[2];
  _QWORD v61[2];
  uint64_t v62;
  _QWORD v63[2];
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  v52 = a1;
  v53 = a3;
  MEMORY[0x212B9F008](&unk_20D19672C);
  v4 = sub_20D1917FC();
  v6 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(v5 + 8);
  v8 = sub_20D191388();
  v9 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(255);
  v10 = MEMORY[0x212B9F008](MEMORY[0x24BDEB358], v8);
  sub_20D150DBC(&qword_2549A95D0, (void (*)(uint64_t))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  v64 = v8;
  v65 = v9;
  v66 = v10;
  v67 = v11;
  v49 = sub_20D191BB0();
  v48 = MEMORY[0x212B9F008](MEMORY[0x24BDF44C8], v49);
  v50 = sub_20D1917A8();
  v12 = sub_20D19152C();
  v13 = *(_QWORD *)(v12 - 8);
  v43 = v12;
  v51 = v13;
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v42 - v14;
  v64 = v6;
  v65 = MEMORY[0x24BDEC7D0];
  v16 = MEMORY[0x24BDF5158];
  v66 = MEMORY[0x24BDF5158];
  v67 = v5;
  v17 = MEMORY[0x24BDF5138];
  v68 = MEMORY[0x24BDEC7B8];
  v69 = MEMORY[0x24BDF5138];
  v18 = sub_20D1917F0();
  v64 = v6;
  v65 = MEMORY[0x24BDF3E48];
  v66 = v16;
  v67 = v7;
  v68 = MEMORY[0x24BDF3E18];
  v69 = v17;
  v19 = sub_20D191598();
  v20 = sub_20D1917CC();
  v21 = sub_20D191EBC();
  v22 = MEMORY[0x212B9F008](MEMORY[0x24BDEFA70], v18);
  v23 = MEMORY[0x212B9F008](MEMORY[0x24BDED500], v19);
  v63[0] = v22;
  v63[1] = v23;
  v62 = MEMORY[0x212B9F008](MEMORY[0x24BDEF3E0], v20, v63);
  v44 = v21;
  v45 = MEMORY[0x212B9F008](MEMORY[0x24BDF5578], v21, &v62);
  v46 = sub_20D1915F8();
  v24 = sub_20D19152C();
  v25 = *(_QWORD *)(v24 - 8);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v42 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v42 - v29;
  v31 = v6;
  v57 = v6;
  v58 = v5;
  v32 = v47;
  v59 = v47;
  v33 = MEMORY[0x212B9F008](MEMORY[0x24BDEFB78], v4);
  sub_20D191CAC();
  sub_20D191970();
  v54 = v31;
  v55 = v5;
  v56 = v32;
  v34 = MEMORY[0x212B9F008](MEMORY[0x24BDEF370], v50);
  v61[0] = v33;
  v61[1] = v34;
  v35 = MEMORY[0x24BDED308];
  v36 = v43;
  v37 = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v43, v61);
  sub_20D191CAC();
  sub_20D191A24();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v15, v36);
  v38 = MEMORY[0x212B9F008](MEMORY[0x24BDEDC10], v46);
  v60[0] = v37;
  v60[1] = v38;
  MEMORY[0x212B9F008](v35, v24, v60);
  v39 = *(void (**)(char *, char *, uint64_t))(v25 + 16);
  v39(v30, v28, v24);
  v40 = *(void (**)(char *, uint64_t))(v25 + 8);
  v40(v28, v24);
  v39(v53, v30, v24);
  return ((uint64_t (*)(char *, uint64_t))v40)(v30, v24);
}

uint64_t sub_20D156C48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
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
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  void (*v23)(char *, uint64_t);
  _QWORD v25[4];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v29 = a4;
  v27 = *(_QWORD *)(a3 + 8);
  v30 = a2;
  v31 = MEMORY[0x24BDEBF80];
  v32 = v27;
  v33 = MEMORY[0x24BDEBF68];
  v7 = sub_20D191388();
  v28 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v25 - v8;
  v10 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(255);
  v25[3] = v10;
  v11 = MEMORY[0x212B9F008](MEMORY[0x24BDEB358], v7);
  v25[2] = v11;
  sub_20D150DBC(&qword_2549A95D0, (void (*)(uint64_t))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  v25[1] = v12;
  v30 = v7;
  v31 = v10;
  v32 = v11;
  v33 = v12;
  v13 = sub_20D191BB0();
  v26 = *(_QWORD *)(v13 - 8);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v25 - v17;
  v20 = type metadata accessor for BackgroundPlatter(0, a2, a3, v19);
  v30 = sub_20D156E94(a1, v20);
  sub_20D152780((uint64_t)&v30, 256, a2, MEMORY[0x24BDEBF80], v27, MEMORY[0x24BDEBF68]);
  swift_release();
  sub_20D191A00();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v9, v7);
  MEMORY[0x212B9F008](MEMORY[0x24BDF44C8], v13);
  v21 = v26;
  v22 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
  v22(v18, v16, v13);
  v23 = *(void (**)(char *, uint64_t))(v21 + 8);
  v23(v16, v13);
  v22(v29, v18, v13);
  return ((uint64_t (*)(char *, uint64_t))v23)(v18, v13);
}

uint64_t sub_20D156E94(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t *v6;
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
  char *v19;
  uint64_t (*v20)(_QWORD);
  uint64_t ObjCClassFromMetadata;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v29 = a2;
  v31 = a1;
  v28 = sub_20D191D24();
  v2 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A95D8);
  MEMORY[0x24BDAC7A8](v30);
  v6 = (uint64_t *)((char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = sub_20D191CA0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v27 - v15;
  v17 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D15C0AC(v31, (uint64_t)v19, v20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_20D162B40((uint64_t)v19, (uint64_t)v16, &qword_2549A8E08);
    sub_20D162B6C((uint64_t)v16, (uint64_t)v14, &qword_2549A8E08);
    if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v7) == 1)
    {
      type metadata accessor for BundleClass();
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      v22 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
      sub_20D191C7C();

      sub_20D14B87C((uint64_t)v14, &qword_2549A8E08);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v14, v7);
    }
    v25 = sub_20D191430();
    sub_20D14B87C((uint64_t)v16, &qword_2549A8E08);
  }
  else
  {
    swift_release();
    sub_20D157948();
    v23 = sub_20D191AB4();
    swift_release();
    v24 = v28;
    (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BDF5108], v28);
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))((char *)v6 + *(int *)(v30 + 36), v4, v24);
    *v6 = v23;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v24);
    sub_20D150EAC(&qword_2549A95E0, &qword_2549A95D8);
    return sub_20D191430();
  }
  return v25;
}

uint64_t sub_20D1571D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
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
  void (*v38)(char *, char *, uint64_t);
  char *v39;
  void (*v40)(char *, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(char *, char *, uint64_t);
  char *v55;
  void (*v56)(char *, uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v66[2];
  uint64_t v67;
  char *v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD v85[2];
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;

  v78 = a4;
  v7 = *(_QWORD *)(a3 + 8);
  *(_QWORD *)&v87 = a2;
  *((_QWORD *)&v87 + 1) = MEMORY[0x24BDF3E48];
  v8 = MEMORY[0x24BDF5158];
  *(_QWORD *)&v88 = MEMORY[0x24BDF5158];
  *((_QWORD *)&v88 + 1) = v7;
  v66[1] = v7;
  v9 = MEMORY[0x24BDF5138];
  v89 = MEMORY[0x24BDF3E18];
  v90 = MEMORY[0x24BDF5138];
  v10 = sub_20D191598();
  v67 = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v68 = (char *)v66 - v14;
  v72 = a2;
  *(_QWORD *)&v87 = a2;
  *((_QWORD *)&v87 + 1) = MEMORY[0x24BDEC7D0];
  *(_QWORD *)&v88 = v8;
  *((_QWORD *)&v88 + 1) = a3;
  v73 = a3;
  v89 = MEMORY[0x24BDEC7B8];
  v90 = v9;
  v15 = sub_20D1917F0();
  v69 = *(_QWORD *)(v15 - 8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v70 = (char *)v66 - v19;
  v20 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v23 = (_QWORD *)((char *)v66 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)v66 - v24;
  v74 = v10;
  v26 = sub_20D1917CC();
  v77 = sub_20D191EBC();
  v76 = *(_QWORD *)(v77 - 8);
  v27 = MEMORY[0x24BDAC7A8](v77);
  v71 = (char *)v66 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v75 = (uint64_t)v66 - v29;
  sub_20D15C0AC(a1, (uint64_t)v25, type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  LODWORD(v9) = swift_getEnumCaseMultiPayload();
  sub_20D14A8AC((uint64_t)v25, type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  if ((_DWORD)v9 == 1)
  {
    type metadata accessor for BackgroundPlatter(0, v72, v73, v30);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8448);
    v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_20D196180;
    sub_20D191AA8();
    sub_20D191AB4();
    swift_release();
    *(_QWORD *)(v31 + 32) = sub_20D191C58();
    *(_QWORD *)(v31 + 40) = v32;
    sub_20D191A9C();
    *(_QWORD *)(v31 + 48) = sub_20D191C58();
    *(_QWORD *)(v31 + 56) = v33;
    sub_20D191A9C();
    *(_QWORD *)(v31 + 64) = sub_20D191C58();
    *(_QWORD *)(v31 + 72) = v34;
    sub_20D191AA8();
    sub_20D191AB4();
    swift_release();
    *(_QWORD *)(v31 + 80) = sub_20D191C58();
    *(_QWORD *)(v31 + 88) = v35;
    MEMORY[0x212B9E408](v31);
    sub_20D1914CC();
    v80 = v87;
    v81 = v88;
    v82 = v89;
    sub_20D1528D0();
    sub_20D161A44((uint64_t)&v87);
    v36 = MEMORY[0x212B9F008](MEMORY[0x24BDEFA70], v15);
    v37 = v69;
    v38 = *(void (**)(char *, char *, uint64_t))(v69 + 16);
    v39 = v70;
    v38(v70, v18, v15);
    v40 = *(void (**)(char *, uint64_t))(v37 + 8);
    v40(v18, v15);
    v38(v18, v39, v15);
    v41 = v26;
    v42 = v74;
    v43 = MEMORY[0x212B9F008](MEMORY[0x24BDED500], v74);
    v44 = (uint64_t)v71;
    sub_20D1524F4((uint64_t)v18, v15);
    v40(v18, v15);
    v40(v39, v15);
    __swift_storeEnumTagSinglePayload(v44, 0, 1, v41);
    v79 = v36;
    v45 = &v79;
    v46 = v44;
  }
  else
  {
    v47 = v73;
    v48 = v72;
    v46 = (uint64_t)v71;
    v49 = v26;
    v42 = v74;
    sub_20D15C0AC(a1, (uint64_t)v23, type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_20D14A8AC((uint64_t)v23, type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
      v41 = v49;
      __swift_storeEnumTagSinglePayload(v46, 1, 1, v49);
      v51 = MEMORY[0x212B9F008](MEMORY[0x24BDEFA70], v15);
      v43 = MEMORY[0x212B9F008](MEMORY[0x24BDED500], v42);
      v86 = v51;
      v45 = &v86;
    }
    else
    {
      v52 = *v23;
      type metadata accessor for BackgroundPlatter(0, v48, v47, v50);
      *(_QWORD *)&v87 = v52;
      sub_20D1528D0();
      v43 = MEMORY[0x212B9F008](MEMORY[0x24BDED500], v42);
      v53 = v67;
      v54 = *(void (**)(char *, char *, uint64_t))(v67 + 16);
      v55 = v68;
      v54(v68, v13, v42);
      v56 = *(void (**)(char *, uint64_t))(v53 + 8);
      v56(v13, v42);
      v54(v13, v55, v42);
      v57 = MEMORY[0x212B9F008](MEMORY[0x24BDEFA70], v15);
      sub_20D1526BC((uint64_t)v13, v15, v42);
      swift_release();
      v56(v13, v42);
      v56(v55, v42);
      v41 = v49;
      __swift_storeEnumTagSinglePayload(v46, 0, 1, v49);
      v83 = v57;
      v45 = &v83;
    }
  }
  v45[1] = v43;
  v58 = MEMORY[0x24BDEF3E0];
  MEMORY[0x212B9F008](MEMORY[0x24BDEF3E0], v41);
  v59 = v75;
  sub_20D152880(v46, v75);
  v60 = v76;
  v61 = *(void (**)(uint64_t, uint64_t))(v76 + 8);
  v62 = v77;
  v61(v46, v77);
  v63 = MEMORY[0x212B9F008](MEMORY[0x24BDEFA70], v15);
  v64 = MEMORY[0x212B9F008](MEMORY[0x24BDED500], v42);
  v85[0] = v63;
  v85[1] = v64;
  v84 = MEMORY[0x212B9F008](v58, v41, v85);
  MEMORY[0x212B9F008](MEMORY[0x24BDF5578], v62, &v84);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 16))(v78, v59, v62);
  return ((uint64_t (*)(uint64_t, uint64_t))v61)(v59, v62);
}

uint64_t sub_20D157948()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t (*v4)(_QWORD);
  uint64_t v5;
  id v6;
  uint64_t v8;

  v1 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D15C0AC(v0, (uint64_t)v3, v4);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_20D191A9C();
    sub_20D14A8AC((uint64_t)v3, type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  }
  else
  {
    sub_20D14A8AC((uint64_t)v3, type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
    v6 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
    return MEMORY[0x212B9E1F8](v6);
  }
  return v5;
}

uint64_t sub_20D157A2C()
{
  return sub_20D191418();
}

uint64_t sub_20D157A48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  void (*v24)(char *, uint64_t);
  _QWORD v26[3];
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];
  uint64_t v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v26[2] = a1;
  v27 = a3;
  MEMORY[0x212B9F008](&unk_20D1966DC);
  v4 = sub_20D1917FC();
  v5 = *(_QWORD *)(a2 + 24);
  v36 = *(_QWORD *)(a2 + 16);
  v6 = v36;
  v37 = MEMORY[0x24BDF3E48];
  v38 = v5;
  v39 = MEMORY[0x24BDF3E18];
  v7 = sub_20D191388();
  v8 = sub_20D19152C();
  sub_20D1915E0();
  v9 = sub_20D19152C();
  v10 = sub_20D19152C();
  v11 = sub_20D191EBC();
  v35[0] = MEMORY[0x212B9F008](MEMORY[0x24BDEB358], v7);
  v35[1] = MEMORY[0x24BDEE7D8];
  v12 = MEMORY[0x24BDED308];
  v34[0] = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v8, v35);
  v34[1] = MEMORY[0x24BDEDB58];
  v33[0] = MEMORY[0x212B9F008](v12, v9, v34);
  v33[1] = MEMORY[0x24BDECC38];
  v32 = MEMORY[0x212B9F008](v12, v10, v33);
  MEMORY[0x212B9F008](MEMORY[0x24BDF5578], v11, &v32);
  v13 = sub_20D1915F8();
  v14 = sub_20D19152C();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)v26 - v19;
  v28 = v6;
  v29 = v5;
  v30 = v26[1];
  v21 = MEMORY[0x212B9F008](MEMORY[0x24BDEFB78], v4);
  sub_20D191CAC();
  sub_20D191A24();
  v22 = MEMORY[0x212B9F008](MEMORY[0x24BDEDC10], v13);
  v31[0] = v21;
  v31[1] = v22;
  MEMORY[0x212B9F008](MEMORY[0x24BDED308], v14, v31);
  v23 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  v23(v20, v18, v14);
  v24 = *(void (**)(char *, uint64_t))(v15 + 8);
  v24(v18, v14);
  v23(v27, v20, v14);
  return ((uint64_t (*)(char *, uint64_t))v24)(v20, v14);
}

uint64_t sub_20D157CF0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  char *v42;
  void (*v43)(char *, uint64_t);
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t);
  uint64_t v49;
  uint64_t v50;
  _QWORD v52[3];
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[2];
  uint64_t v73;
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[2];
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[4];

  v69 = a3;
  v62 = sub_20D191D24();
  v63 = *(_QWORD *)(v62 - 8);
  MEMORY[0x24BDAC7A8](v62);
  v6 = (char *)v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1;
  v80[0] = a1;
  v80[1] = MEMORY[0x24BDF3E48];
  v8 = a2;
  v80[2] = a2;
  v80[3] = MEMORY[0x24BDF3E18];
  v9 = sub_20D191388();
  v54 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v52 - v10;
  v12 = sub_20D19152C();
  v59 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v55 = (char *)v52 - v13;
  sub_20D1915E0();
  v14 = sub_20D19152C();
  v58 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v56 = (char *)v52 - v15;
  v67 = v16;
  v17 = sub_20D19152C();
  v61 = *(_QWORD *)(v17 - 8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v57 = (char *)v52 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v60 = (char *)v52 - v20;
  v66 = sub_20D191EBC();
  v21 = *(_QWORD *)(v66 - 8);
  v22 = MEMORY[0x24BDAC7A8](v66);
  v24 = (char *)v52 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v68 = (uint64_t)v52 - v27;
  v28 = *(_BYTE *)(v26 + 8);
  v29 = MEMORY[0x24BDECC38];
  v65 = v12;
  v64 = v9;
  if ((v28 & 1) != 0 || *(double *)v26 <= 1.0)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v24, 1, 1, v17);
    v79[0] = MEMORY[0x212B9F008](MEMORY[0x24BDEB358], v9);
    v79[1] = MEMORY[0x24BDEE7D8];
    v46 = MEMORY[0x24BDED308];
    v78[0] = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v12, v79);
    v35 = MEMORY[0x24BDEDB58];
    v78[1] = MEMORY[0x24BDEDB58];
    v37 = v67;
    v77[0] = MEMORY[0x212B9F008](v46, v67, v78);
    v77[1] = v29;
    MEMORY[0x212B9F008](v46, v17, v77);
    v45 = v29;
  }
  else
  {
    v52[1] = v26;
    v52[2] = type metadata accessor for BrightnessMultiply(0, v7, v8, v25);
    v53 = v21;
    v80[0] = sub_20D191AA8();
    sub_20D152780((uint64_t)v80, 256, v7, MEMORY[0x24BDF3E48], v8, MEMORY[0x24BDF3E18]);
    swift_release();
    v30 = MEMORY[0x212B9F008](MEMORY[0x24BDEB358], v9);
    v31 = v55;
    sub_20D19197C();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v11, v9);
    v32 = v62;
    (*(void (**)(char *, _QWORD, uint64_t))(v63 + 104))(v6, *MEMORY[0x24BDF50F0], v62);
    v72[0] = v30;
    v72[1] = MEMORY[0x24BDEE7D8];
    v33 = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v12, v72);
    v34 = v56;
    sub_20D191A3C();
    (*(void (**)(char *, uint64_t))(v63 + 8))(v6, v32);
    (*(void (**)(char *, uint64_t))(v59 + 8))(v31, v12);
    v71[0] = v33;
    v35 = MEMORY[0x24BDEDB58];
    v71[1] = MEMORY[0x24BDEDB58];
    v36 = MEMORY[0x24BDED308];
    v37 = v67;
    v38 = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v67, v71);
    v39 = v57;
    sub_20D191A18();
    (*(void (**)(char *, uint64_t))(v58 + 8))(v34, v37);
    v70[0] = v38;
    v70[1] = MEMORY[0x24BDECC38];
    MEMORY[0x212B9F008](v36, v17, v70);
    v40 = v61;
    v41 = *(void (**)(char *, char *, uint64_t))(v61 + 16);
    v42 = v60;
    v41(v60, v39, v17);
    v43 = *(void (**)(char *, uint64_t))(v40 + 8);
    v44 = v39;
    v45 = MEMORY[0x24BDECC38];
    v43(v44, v17);
    v41(v24, v42, v17);
    v21 = v53;
    v43(v42, v17);
    __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v17);
  }
  v47 = v68;
  sub_20D152880((uint64_t)v24, v68);
  v48 = *(void (**)(char *, uint64_t))(v21 + 8);
  v49 = v66;
  v48(v24, v66);
  v76[0] = MEMORY[0x212B9F008](MEMORY[0x24BDEB358], v64);
  v76[1] = MEMORY[0x24BDEE7D8];
  v50 = MEMORY[0x24BDED308];
  v75[0] = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v65, v76);
  v75[1] = v35;
  v74[0] = MEMORY[0x212B9F008](v50, v37, v75);
  v74[1] = v45;
  v73 = MEMORY[0x212B9F008](v50, v17, v74);
  MEMORY[0x212B9F008](MEMORY[0x24BDF5578], v49, &v73);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v69, v47, v49);
  return ((uint64_t (*)(uint64_t, uint64_t))v48)(v47, v49);
}

void sub_20D1583A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  __swift_allocate_value_buffer(v0, qword_2549A8DB8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2549A8DB8);
  if (qword_2549A81D8 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_2549A8DD8);
  sub_20D15C0AC(v2, v1, type metadata accessor for PhotoStyleValueLabels.Configuration);
}

uint64_t sub_20D158430()
{
  uint64_t v0;

  if (qword_2549A81C8 != -1)
    swift_once();
  v0 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  return __swift_project_value_buffer(v0, (uint64_t)qword_2549A8DB8);
}

void sub_20D158478(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = sub_20D158430();
  sub_20D15C0AC(v2, a1, type metadata accessor for PhotoStyleValueLabels.Configuration);
}

uint64_t sub_20D1584A8()
{
  sub_20D150DBC(&qword_2549A98C8, (void (*)(uint64_t))type metadata accessor for PhotoStyleValueLabels.Configuration);
  return sub_20D1914C0();
}

void sub_20D158510()
{
  sub_20D191F64();
  OUTLINED_FUNCTION_1();
}

void sub_20D158530()
{
  OUTLINED_FUNCTION_59();
  sub_20D191F64();
  sub_20D191F70();
  OUTLINED_FUNCTION_46();
}

BOOL sub_20D158564(char *a1, char *a2)
{
  return sub_20D1538C8(*a1, *a2);
}

void sub_20D158570()
{
  sub_20D158530();
}

void sub_20D158578()
{
  sub_20D158510();
}

uint64_t sub_20D158580()
{
  sub_20D191F58();
  sub_20D191F64();
  return sub_20D191F70();
}

void sub_20D1585C0()
{
  id v0;
  unsigned __int8 v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_globalSettings);
  v1 = objc_msgSend(v0, sel_shouldUseFlipAnimationForValuePlatter);

  byte_2549A8DD0 = v1;
}

void sub_20D158618()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;

  v0 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  __swift_allocate_value_buffer((uint64_t)v3, qword_2549A8DD8);
  v4 = __swift_project_value_buffer((uint64_t)v3, (uint64_t)qword_2549A8DD8);
  v5 = sub_20D191CA0();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v5);
  swift_storeEnumTagMultiPayload();
  v6 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
  v7 = MEMORY[0x212B9E1F8](v6);
  if (qword_2549A81D0 != -1)
    swift_once();
  v8 = byte_2549A8DD0;
  *(_BYTE *)v4 = 0;
  *(_QWORD *)(v4 + 8) = v7;
  sub_20D162774((uint64_t)v2, v4 + v3[6], type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  *(_QWORD *)(v4 + v3[7]) = 0x4028000000000000;
  v9 = v4 + v3[8];
  *(_QWORD *)v9 = 0;
  *(_BYTE *)(v9 + 8) = 1;
  *(_BYTE *)(v4 + v3[9]) = v8;
}

void static PhotoStyleValueLabels.Configuration.glass.getter(uint64_t a1@<X8>)
{
  sub_20D158910(&qword_2549A81D8, (uint64_t)qword_2549A8DD8, a1);
}

void sub_20D158790()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;

  v0 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (uint64_t *)((char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  v3 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  __swift_allocate_value_buffer((uint64_t)v3, qword_2549A8DF0);
  v4 = __swift_project_value_buffer((uint64_t)v3, (uint64_t)qword_2549A8DF0);
  sub_20D191AC0();
  v5 = sub_20D191AB4();
  swift_release();
  *v2 = v5;
  swift_storeEnumTagMultiPayload();
  v6 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
  v7 = MEMORY[0x212B9E1F8](v6);
  if (qword_2549A81D0 != -1)
    swift_once();
  v8 = byte_2549A8DD0;
  *(_BYTE *)v4 = 0;
  *(_QWORD *)(v4 + 8) = v7;
  sub_20D162774((uint64_t)v2, v4 + v3[6], type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  *(_QWORD *)(v4 + v3[7]) = 0x4028000000000000;
  v9 = v4 + v3[8];
  *(_QWORD *)v9 = 0;
  *(_BYTE *)(v9 + 8) = 1;
  *(_BYTE *)(v4 + v3[9]) = v8;
}

void static PhotoStyleValueLabels.Configuration.bordered.getter(uint64_t a1@<X8>)
{
  sub_20D158910(&qword_2549A81E0, (uint64_t)qword_2549A8DF0, a1);
}

void sub_20D158910(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = OUTLINED_FUNCTION_26();
  v6 = __swift_project_value_buffer(v5, a2);
  sub_20D15C0AC(v6, a3, type metadata accessor for PhotoStyleValueLabels.Configuration);
  OUTLINED_FUNCTION_7_3();
}

void static PhotoStyleValueLabels.Configuration.glass(textColor:extendedBrightness:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_21_0();
  v1 = OUTLINED_FUNCTION_36();
  __swift_storeEnumTagSinglePayload(v0, 1, 1, v1);
  type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
  swift_storeEnumTagMultiPayload();
  v2 = qword_2549A81D0;
  swift_retain();
  if (v2 != -1)
    swift_once();
  OUTLINED_FUNCTION_8_2();
}

void static PhotoStyleValueLabels.Configuration.bordered(textColor:extendedBrightness:)()
{
  uint64_t *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_21_0();
  swift_retain();
  sub_20D191AC0();
  v1 = sub_20D191AB4();
  swift_release();
  *v0 = v1;
  type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
  swift_storeEnumTagMultiPayload();
  if (qword_2549A81D0 != -1)
    swift_once();
  OUTLINED_FUNCTION_8_2();
}

void PhotoStyleValueLabels.Configuration.BackgroundStyle.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t (*v12)(_QWORD);
  uint64_t v13;
  _QWORD v14[2];

  OUTLINED_FUNCTION_41();
  v3 = OUTLINED_FUNCTION_36();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_16_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
  OUTLINED_FUNCTION_0_2();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v14 - v9;
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_35();
  sub_20D15C0AC(v0, v2, v12);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_20D162B40(v2, (uint64_t)v10, &qword_2549A8E08);
    sub_20D162B6C((uint64_t)v10, (uint64_t)v8, &qword_2549A8E08);
    if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v3) == 1)
    {
      sub_20D14B87C((uint64_t)v10, &qword_2549A8E08);
      v13 = (uint64_t)v8;
    }
    else
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v1, v8, v3);
      v14[0] = 0;
      v14[1] = 0xE000000000000000;
      sub_20D191EEC();
      sub_20D191E44();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
      v13 = (uint64_t)v10;
    }
    sub_20D14B87C(v13, &qword_2549A8E08);
  }
  else
  {
    sub_20D191A84();
    swift_release();
  }
  OUTLINED_FUNCTION_6_2();
}

uint64_t static PhotoStyleValueLabels.Configuration.BackgroundStyle.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_3_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EB8);
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_15_1();
  v8 = v2 + *(int *)(v7 + 48);
  sub_20D15C0AC(a1, v2, type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  sub_20D15C0AC(a2, v8, type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
  if (OUTLINED_FUNCTION_57() != 1)
  {
    OUTLINED_FUNCTION_49(v2, v9, type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
    if (OUTLINED_FUNCTION_57() != 1)
    {
      v10 = sub_20D191A6C();
      OUTLINED_FUNCTION_27();
      v11 = swift_release();
      OUTLINED_FUNCTION_58(v11, type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
      return v10 & 1;
    }
    OUTLINED_FUNCTION_27();
    goto LABEL_6;
  }
  if (OUTLINED_FUNCTION_57() != 1)
  {
LABEL_6:
    sub_20D14B87C(v2, &qword_2549A8EB8);
    v10 = 0;
    return v10 & 1;
  }
  OUTLINED_FUNCTION_56(v8);
  OUTLINED_FUNCTION_56(v2);
  v10 = 1;
  return v10 & 1;
}

void PhotoStyleValueLabels.Configuration.BackgroundStyle.hashValue.getter()
{
  OUTLINED_FUNCTION_59();
  PhotoStyleValueLabels.Configuration.BackgroundStyle.hash(into:)();
  sub_20D191F70();
  OUTLINED_FUNCTION_46();
}

uint64_t sub_20D158DFC()
{
  sub_20D191F58();
  PhotoStyleValueLabels.Configuration.BackgroundStyle.hash(into:)();
  return sub_20D191F70();
}

void static PhotoStyleValueLabels.Configuration.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v4;

  if (*a1 == *a2 && (sub_20D191A6C() & 1) != 0)
  {
    v4 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
    static PhotoStyleValueLabels.Configuration.BackgroundStyle.== infix(_:_:)((uint64_t)&a1[*(int *)(v4 + 24)], (uint64_t)&a2[*(int *)(v4 + 24)]);
  }
  OUTLINED_FUNCTION_7_3();
}

uint64_t sub_20D158F08()
{
  return 0x4772657474616C70;
}

uint64_t sub_20D158F28()
{
  return swift_deallocClassInstance();
}

double PEPhotoStyleValuesPlatterView.tone.getter()
{
  return sub_20D1591FC((double (*)(uint64_t))sub_20D158FCC);
}

void PEPhotoStyleValuesPlatterView.tone.setter()
{
  sub_20D15928C();
}

double sub_20D158FCC()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_20D150DBC(&qword_2549A9818, (void (*)(uint64_t))_s16IntegrationModelCMa_0);
  sub_20D1912B0();
  swift_release();
  return *(double *)(v0 + 16);
}

double PEPhotoStyleValuesPlatterView.color.getter()
{
  return sub_20D1591FC((double (*)(uint64_t))sub_20D1590E4);
}

void PEPhotoStyleValuesPlatterView.color.setter()
{
  sub_20D15928C();
}

double sub_20D1590E4()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_20D150DBC(&qword_2549A9818, (void (*)(uint64_t))_s16IntegrationModelCMa_0);
  sub_20D1912B0();
  swift_release();
  return *(double *)(v0 + 24);
}

uint64_t sub_20D159168()
{
  swift_getKeyPath();
  OUTLINED_FUNCTION_33();
  return OUTLINED_FUNCTION_27();
}

double PEPhotoStyleValuesPlatterView.palette.getter()
{
  return sub_20D1591FC((double (*)(uint64_t))sub_20D1592CC);
}

double sub_20D1591FC(double (*a1)(uint64_t))
{
  uint64_t v2;
  double v3;

  v2 = OUTLINED_FUNCTION_0_0();
  v3 = a1(v2);
  OUTLINED_FUNCTION_3_0();
  return v3;
}

void PEPhotoStyleValuesPlatterView.palette.setter()
{
  sub_20D15928C();
}

void sub_20D15928C()
{
  sub_20D191D00();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7_0();
}

double sub_20D1592CC()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_20D150DBC(&qword_2549A9818, (void (*)(uint64_t))_s16IntegrationModelCMa_0);
  sub_20D1912B0();
  swift_release();
  return *(double *)(v0 + 32);
}

uint64_t sub_20D159350()
{
  OUTLINED_FUNCTION_19_1();
  sub_20D159168();
  return swift_release();
}

uint64_t PEPhotoStyleValuesPlatterView.hideToneAndColorLabels.getter()
{
  return sub_20D159754((uint64_t (*)(uint64_t))sub_20D15943C);
}

void PEPhotoStyleValuesPlatterView.hideToneAndColorLabels.setter()
{
  sub_20D1597D8();
}

uint64_t sub_20D15943C()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_20D150DBC(&qword_2549A9818, (void (*)(uint64_t))_s16IntegrationModelCMa_0);
  sub_20D1912B0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t PEPhotoStyleValuesPlatterView.hidePaletteLabel.getter()
{
  return sub_20D159754((uint64_t (*)(uint64_t))sub_20D159548);
}

void PEPhotoStyleValuesPlatterView.hidePaletteLabel.setter()
{
  sub_20D1597D8();
}

uint64_t sub_20D159548()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_20D150DBC(&qword_2549A9818, (void (*)(uint64_t))_s16IntegrationModelCMa_0);
  sub_20D1912B0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 41);
}

void sub_20D1595CC()
{
  swift_getKeyPath();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_7_0();
}

uint64_t PEPhotoStyleValuesPlatterView.hideResetButton.getter()
{
  return sub_20D159754((uint64_t (*)(uint64_t))sub_20D159694);
}

void PEPhotoStyleValuesPlatterView.hideResetButton.setter()
{
  sub_20D1597D8();
}

uint64_t sub_20D159694()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_20D150DBC(&qword_2549A9818, (void (*)(uint64_t))_s16IntegrationModelCMa_0);
  sub_20D1912B0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 42);
}

uint64_t PEPhotoStyleValuesPlatterView.isResetButtonEnabled.getter()
{
  return sub_20D159754((uint64_t (*)(uint64_t))sub_20D159818);
}

uint64_t sub_20D159754(uint64_t (*a1)(uint64_t))
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_0_0();
  LOBYTE(a1) = a1(v2);
  OUTLINED_FUNCTION_3_0();
  return a1 & 1;
}

void PEPhotoStyleValuesPlatterView.isResetButtonEnabled.setter()
{
  sub_20D1597D8();
}

void sub_20D1597D8()
{
  sub_20D191D00();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_20D159818()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_20D150DBC(&qword_2549A9818, (void (*)(uint64_t))_s16IntegrationModelCMa_0);
  sub_20D1912B0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 43);
}

uint64_t sub_20D15989C()
{
  OUTLINED_FUNCTION_19_1();
  sub_20D1595CC();
  return swift_release();
}

void PEPhotoStyleValuesPlatterView.resetAction.getter()
{
  OUTLINED_FUNCTION_0_0();
  sub_20D159BCC();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7_3();
}

void PEPhotoStyleValuesPlatterView.resetAction.setter()
{
  sub_20D191D00();
  OUTLINED_FUNCTION_9_0();
  swift_release();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_20D159A84@<X0>(id *a1@<X0>, void (**a2)()@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t result;

  v3 = objc_msgSend(*a1, sel_resetAction);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = sub_20D14E8F4;
  *(_QWORD *)(result + 24) = v4;
  *a2 = sub_20D14E4C8;
  a2[1] = (void (*)())result;
  return result;
}

void sub_20D159B0C(uint64_t *a1, void **a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  v4 = *a1;
  v3 = a1[1];
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = v3;
  v6 = *a2;
  v8[4] = sub_20D14E4C8;
  v8[5] = v5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_20D1635CC;
  v8[3] = &block_descriptor_60;
  v7 = _Block_copy(v8);
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_setResetAction_, v7);
  _Block_release(v7);
}

uint64_t sub_20D159BCC()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_20D150DBC(&qword_2549A9818, (void (*)(uint64_t))_s16IntegrationModelCMa_0);
  sub_20D1912B0();
  swift_release();
  v1 = *(_QWORD *)(v0 + 48);
  swift_retain();
  return v1;
}

uint64_t sub_20D159C60()
{
  swift_retain();
  swift_retain();
  sub_20D159CC4();
  return swift_release();
}

uint64_t sub_20D159CC4()
{
  swift_getKeyPath();
  sub_20D15A868();
  swift_release();
  return swift_release();
}

uint64_t PEPhotoStyleValuesPlatterView.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_0_0();
  sub_20D159DB4(a1);
  return swift_release();
}

void PEPhotoStyleValuesPlatterView.configuration.setter()
{
  uint64_t v0;

  sub_20D191D00();
  OUTLINED_FUNCTION_9_0();
  v0 = OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_58(v0, type metadata accessor for PhotoStyleValueLabels.Configuration);
  OUTLINED_FUNCTION_7_0();
}

void sub_20D159DB4(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  swift_getKeyPath();
  sub_20D150DBC(&qword_2549A9818, (void (*)(uint64_t))_s16IntegrationModelCMa_0);
  sub_20D1912B0();
  swift_release();
  v3 = v1
     + OBJC_IVAR____TtCE12PhotosUIEditCSo29PEPhotoStyleValuesPlatterViewP33_5CDC474A5E4048E96FA7A0FF4B3ACE2F16IntegrationModel__configuration;
  swift_beginAccess();
  sub_20D15C0AC(v3, a1, type metadata accessor for PhotoStyleValueLabels.Configuration);
}

uint64_t sub_20D159E6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(_QWORD);
  uint64_t v8;

  v3 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D15C0AC(a2, (uint64_t)v5, v6);
  swift_retain();
  sub_20D159F10((uint64_t)v5);
  return swift_release();
}

void sub_20D159F10(uint64_t a1)
{
  swift_getKeyPath();
  sub_20D15A868();
  swift_release();
  sub_20D14A8AC(a1, type metadata accessor for PhotoStyleValueLabels.Configuration);
}

void PEPhotoStyleValuesPlatterView.configuration.modify(_QWORD *a1)
{
  uint64_t v1;
  size_t v3;
  void *v4;

  *a1 = v1;
  v3 = *(_QWORD *)(*(_QWORD *)(OUTLINED_FUNCTION_26() - 8) + 64);
  a1[1] = malloc(v3);
  v4 = malloc(v3);
  a1[2] = v4;
  PEPhotoStyleValuesPlatterView.configuration.getter((uint64_t)v4);
  OUTLINED_FUNCTION_7_3();
}

void sub_20D159FD8(uint64_t a1, char a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 8);
  v3 = *(void **)(a1 + 16);
  if ((a2 & 1) != 0)
  {
    OUTLINED_FUNCTION_63(*(_QWORD *)(a1 + 16), (uint64_t)v2);
    PEPhotoStyleValuesPlatterView.configuration.setter();
    OUTLINED_FUNCTION_48((uint64_t)v3);
  }
  else
  {
    PEPhotoStyleValuesPlatterView.configuration.setter();
  }
  free(v3);
  free(v2);
}

void __swiftcall PEPhotoStyleValuesPlatterView.init(tone:color:palette:)(PEPhotoStyleValuesPlatterView *__return_ptr retstr, Swift::Double tone, Swift::Double color, Swift::Double palette)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithTone_color_palette_, tone, color, palette);
}

id PEPhotoStyleValuesPlatterView.init(tone:color:palette:)(double a1, double a2, double a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  objc_super v17;
  uint64_t v18;

  v8 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_3_2();
  v10 = qword_2549A81E0;
  v11 = v3;
  if (v10 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v8, (uint64_t)qword_2549A8DF0);
  OUTLINED_FUNCTION_49(v12, v13, type metadata accessor for PhotoStyleValueLabels.Configuration);
  _s16IntegrationModelCMa_0(0);
  swift_allocObject();
  v14 = sub_20D15AA84(0, 0, 0, v4, 0, (uint64_t)nullsub_1, 0, a1, a2, a3);
  *(_QWORD *)&v11[OBJC_IVAR___PEPhotoStyleValuesPlatterView_valueLabelsModel] = v14;
  objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EC8));
  v18 = v14;
  OUTLINED_FUNCTION_19_1();
  *(_QWORD *)&v11[OBJC_IVAR___PEPhotoStyleValuesPlatterView_hostingController] = sub_20D191790();

  v17.receiver = v11;
  v17.super_class = (Class)PEPhotoStyleValuesPlatterView;
  v15 = objc_msgSendSuper2(&v17, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_20D15A244();

  return v15;
}

uint64_t sub_20D15A214(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return sub_20D15ACA4(a1);
}

void sub_20D15A244()
{
  char *v0;
  char *v1;
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v1 = v0;
  v2 = OBJC_IVAR___PEPhotoStyleValuesPlatterView_hostingController;
  v3 = *(id *)&v0[OBJC_IVAR___PEPhotoStyleValuesPlatterView_hostingController];
  sub_20D191778();

  v4 = objc_msgSend(*(id *)&v1[v2], sel_view);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(*(id *)&v1[v2], sel_view);
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v1, sel_addSubview_, v6);

      v8 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
      objc_msgSend(v5, sel_setBackgroundColor_, v8);

      objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      v9 = (void *)objc_opt_self();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BD0);
      v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_20D195B40;
      v11 = objc_msgSend(v5, sel_topAnchor);
      v12 = objc_msgSend(v1, sel_topAnchor);
      v13 = objc_msgSend(v11, sel_constraintEqualToAnchor_, v12);

      *(_QWORD *)(v10 + 32) = v13;
      v14 = objc_msgSend(v5, sel_bottomAnchor);
      v15 = objc_msgSend(v1, sel_bottomAnchor);
      v16 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v15);

      *(_QWORD *)(v10 + 40) = v16;
      v17 = objc_msgSend(v5, sel_leadingAnchor);
      v18 = objc_msgSend(v1, sel_leadingAnchor);
      v19 = objc_msgSend(v17, sel_constraintEqualToAnchor_, v18);

      *(_QWORD *)(v10 + 48) = v19;
      v20 = objc_msgSend(v5, sel_trailingAnchor);
      v21 = objc_msgSend(v1, sel_trailingAnchor);
      v22 = objc_msgSend(v20, sel_constraintEqualToAnchor_, v21);

      *(_QWORD *)(v10 + 56) = v22;
      sub_20D191E74();
      sub_20D14E520(0, &qword_2549A8BD8);
      v23 = (id)sub_20D191E5C();
      swift_bridgeObjectRelease();
      objc_msgSend(v9, sel_activateConstraints_, v23);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void __swiftcall PEPhotoStyleValuesPlatterView.init(coder:)(PEPhotoStyleValuesPlatterView_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

  OUTLINED_FUNCTION_1();
}

void PEPhotoStyleValuesPlatterView.init(coder:)()
{
  sub_20D191EF8();
  __break(1u);
}

void sub_20D15A620(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  double v10;
  double v11;
  double v12;
  char v13;
  char v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t KeyPath;
  uint64_t *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = a1;
  v1 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for PhotoStyleValueLabels(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (double *)((char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A95E8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_20D158FCC();
  v11 = sub_20D1590E4();
  v12 = sub_20D1592CC();
  v13 = sub_20D15943C();
  v14 = sub_20D159548();
  v15 = sub_20D159694();
  v16 = sub_20D159818();
  v17 = sub_20D159BCC();
  *v6 = v10;
  v6[1] = v11;
  v6[2] = v12;
  *((_BYTE *)v6 + 24) = v13 & 1;
  *((_BYTE *)v6 + 25) = v14 & 1;
  *((_BYTE *)v6 + 26) = v15 & 1;
  *((_BYTE *)v6 + 27) = v16 & 1;
  *((_QWORD *)v6 + 4) = v17;
  *((_QWORD *)v6 + 5) = v18;
  v19 = (uint64_t *)((char *)v6 + *(int *)(v4 + 48));
  *v19 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE0);
  swift_storeEnumTagMultiPayload();
  KeyPath = swift_getKeyPath();
  sub_20D159DB4((uint64_t)v3);
  v21 = (uint64_t *)&v9[*(int *)(v7 + 36)];
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A95F0);
  sub_20D15C0AC((uint64_t)v3, (uint64_t)v21 + *(int *)(v22 + 28), type metadata accessor for PhotoStyleValueLabels.Configuration);
  *v21 = KeyPath;
  sub_20D15C0AC((uint64_t)v6, (uint64_t)v9, type metadata accessor for PhotoStyleValueLabels);
  sub_20D14A8AC((uint64_t)v3, type metadata accessor for PhotoStyleValueLabels.Configuration);
  sub_20D14A8AC((uint64_t)v6, type metadata accessor for PhotoStyleValueLabels);
  sub_20D161AC0();
  sub_20D1919E8();
  sub_20D14B87C((uint64_t)v9, &qword_2549A95E8);
}

void sub_20D15A860(uint64_t a1@<X8>)
{
  sub_20D15A620(a1);
}

uint64_t sub_20D15A868()
{
  sub_20D150DBC(&qword_2549A9818, (void (*)(uint64_t))_s16IntegrationModelCMa_0);
  return sub_20D1912A4();
}

uint64_t sub_20D15A908@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v2 = sub_20D159BCC();
  v4 = v3;
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v2;
  *(_QWORD *)(result + 24) = v4;
  *a1 = sub_20D14E894;
  a1[1] = result;
  return result;
}

uint64_t sub_20D15A960(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *a1;
  v2 = a1[1];
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = v2;
  swift_retain();
  return sub_20D159CC4();
}

void sub_20D15A9C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(_QWORD);

  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_49(a1, v9, v10);
  a5(v5);
  OUTLINED_FUNCTION_7_3();
}

uint64_t sub_20D15AA1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a1
     + OBJC_IVAR____TtCE12PhotosUIEditCSo29PEPhotoStyleValuesPlatterViewP33_5CDC474A5E4048E96FA7A0FF4B3ACE2F16IntegrationModel__configuration;
  swift_beginAccess();
  sub_20D1627F0(a2, v3);
  return swift_endAccess();
}

uint64_t sub_20D15AA84(char a1, char a2, char a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, double a8, double a9, double a10)
{
  uint64_t v10;

  sub_20D1912D4();
  *(double *)(v10 + 16) = a8;
  *(double *)(v10 + 24) = a9;
  *(double *)(v10 + 32) = a10;
  *(_BYTE *)(v10 + 40) = a1;
  *(_BYTE *)(v10 + 41) = a2;
  *(_BYTE *)(v10 + 42) = a3;
  *(_BYTE *)(v10 + 43) = a5;
  *(_QWORD *)(v10 + 48) = a6;
  *(_QWORD *)(v10 + 56) = a7;
  sub_20D162774(a4, v10+ OBJC_IVAR____TtCE12PhotosUIEditCSo29PEPhotoStyleValuesPlatterViewP33_5CDC474A5E4048E96FA7A0FF4B3ACE2F16IntegrationModel__configuration, type metadata accessor for PhotoStyleValueLabels.Configuration);
  return v10;
}

uint64_t sub_20D15AB38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  sub_20D14A8AC(v0+ OBJC_IVAR____TtCE12PhotosUIEditCSo29PEPhotoStyleValuesPlatterViewP33_5CDC474A5E4048E96FA7A0FF4B3ACE2F16IntegrationModel__configuration, type metadata accessor for PhotoStyleValueLabels.Configuration);
  v1 = v0
     + OBJC_IVAR____TtCE12PhotosUIEditCSo29PEPhotoStyleValuesPlatterViewP33_5CDC474A5E4048E96FA7A0FF4B3ACE2F16IntegrationModel___observationRegistrar;
  v2 = sub_20D1912E0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_20D15AB9C()
{
  sub_20D15AB38();
  return swift_deallocClassInstance();
}

void __swiftcall PEPhotoStyleValuesPlatterView.init(frame:)(PEPhotoStyleValuesPlatterView *__return_ptr retstr, __C::CGRect frame)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
}

void PEPhotoStyleValuesPlatterView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_20D15AC80()
{
  return sub_20D1528BC() & 1;
}

uint64_t sub_20D15ACA4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v3 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + qword_2549A92C8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v8 - v5, a1, v3);
  v6 = sub_20D191790();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return v6;
}

void *sub_20D15AD50(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return sub_20D15AD90(a1, a2);
}

void *sub_20D15AD90(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  uint64_t v11;

  v4 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v2) + qword_2549A92C8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *))(v5 + 16))((char *)&v11 - v6);
  v7 = (void *)sub_20D191784();
  v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v9 = v7;
  v8(a2, v4);
  if (v7)

  return v7;
}

id sub_20D15AE50(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v6;
  id v7;
  objc_super v9;

  v6 = (objc_class *)type metadata accessor for SecureDrawHostingController(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + qword_2549A92C8), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + qword_2549A92C8 + 8), a4);
  v9.receiver = v4;
  v9.super_class = v6;
  v7 = objc_msgSendSuper2(&v9, sel_initWithCoder_, a1);

  return v7;
}

id sub_20D15AEC4(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  return sub_20D15AE50(v3, v4, v5, v6);
}

id sub_20D15AEE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for SecureDrawHostingController(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + qword_2549A92C8), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + qword_2549A92C8 + 8), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

void sub_20D15AF40()
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
  os_log_type_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_41();
  v3 = v0;
  v5 = v4;
  v6 = sub_20D1916B8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_16_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BB8);
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_3_2();
  sub_20D162B6C(v3, v2, &qword_2549A8BB8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = OUTLINED_FUNCTION_52();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v5, v2, v9);
  }
  else
  {
    v10 = sub_20D191E8C();
    v11 = sub_20D191868();
    if (os_log_type_enabled(v11, v10))
    {
      v12 = swift_slowAlloc();
      v13 = swift_slowAlloc();
      *(_DWORD *)v12 = 136315138;
      *(_QWORD *)(v12 + 4) = sub_20D15BAB8(0x694474756F79614CLL, 0xEF6E6F6974636572, &v13);
      _os_log_impl(&dword_20D13D000, v11, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v12, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_55();
    }

    sub_20D1916AC();
    swift_getAtKeyPath();
    OUTLINED_FUNCTION_27();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v6);
  }
  OUTLINED_FUNCTION_6_2();
}

void sub_20D15B0FC(uint64_t a1@<X8>)
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
  os_log_type_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = v1;
  v4 = sub_20D1916B8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D162B6C(v2, (uint64_t)v10, &qword_2549A8EE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_20D162774((uint64_t)v10, a1, type metadata accessor for PhotoStyleValueLabels.Configuration);
  }
  else
  {
    v11 = sub_20D191E8C();
    v12 = sub_20D191868();
    if (os_log_type_enabled(v12, v11))
    {
      v13 = swift_slowAlloc();
      v14 = swift_slowAlloc();
      v16 = v14;
      *(_DWORD *)v13 = 136315138;
      *(_QWORD *)(v13 + 4) = sub_20D15BAB8(0x72756769666E6F43, 0xED00006E6F697461, &v16);
      _os_log_impl(&dword_20D13D000, v12, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212B9F080](v14, -1, -1);
      MEMORY[0x212B9F080](v13, -1, -1);
    }

    sub_20D1916AC();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_20D15B308@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t AssociatedTypeWitness;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  int v46;
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

  v49 = a5;
  v46 = a4;
  v42 = a3;
  v43 = a2;
  v53 = a1;
  v38 = a9;
  v50 = a12;
  v47 = *(_QWORD *)(a8 - 8);
  v44 = a8;
  MEMORY[0x24BDAC7A8](a1);
  v45 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = sub_20D1917A8();
  v16 = MEMORY[0x24BDAC7A8](v51);
  v48 = (char *)&v33 - v17;
  v40 = *(_QWORD *)(a7 - 8);
  v33 = a7;
  MEMORY[0x24BDAC7A8](v16);
  v39 = (char *)&v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = a10;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v36 = *(_QWORD *)(swift_getAssociatedConformanceWitness() + 8);
  v20 = sub_20D19149C();
  MEMORY[0x24BDAC7A8](v20);
  v21 = MEMORY[0x212B9F008](MEMORY[0x24BDEC4B8], v20);
  v54 = v20;
  v55 = a7;
  v56 = v21;
  v57 = a11;
  v41 = sub_20D191388();
  MEMORY[0x24BDAC7A8](v41);
  v35 = (char *)&v33 - v22;
  v37 = *(_QWORD *)(a6 - 8);
  v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16);
  v34 = a6;
  v23(a9, v53, a6);
  sub_20D1914F0();
  sub_20D191490();
  v24 = v40;
  v25 = v43;
  v26 = v33;
  (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v39, v43, v33);
  sub_20D19137C();
  v27 = v47;
  v28 = v44;
  v29 = v49;
  (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v45, v49, v44);
  sub_20D191CAC();
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v29, v28);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v26);
  v30 = v34;
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v53, v34);
  v31 = v50;
  sub_20D19179C();
  v54 = v30;
  v55 = v26;
  v56 = v28;
  v57 = v52;
  v58 = a11;
  v59 = v31;
  sub_20D1917F0();
  return sub_20D191514();
}

uint64_t sub_20D15B6D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
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
  char *v42;
  int v43;
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
  uint64_t v54;

  v43 = a4;
  v39 = a3;
  v40 = a2;
  v49 = a9;
  v50 = a1;
  v34 = a11;
  v35 = a10;
  v46 = a5;
  v47 = a12;
  v44 = *(_QWORD *)(a8 - 8);
  v41 = a8;
  MEMORY[0x24BDAC7A8](a1);
  v42 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = sub_20D1917A8();
  v15 = MEMORY[0x24BDAC7A8](v48);
  v45 = (char *)&v32 - v16;
  v37 = *(_QWORD *)(a7 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = *(_QWORD *)(a6 - 8);
  v20 = v36;
  MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v32 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_20D19149C();
  MEMORY[0x24BDAC7A8](v23);
  v24 = MEMORY[0x212B9F008](MEMORY[0x24BDEC4B8], v23);
  v51 = v23;
  v52 = a7;
  v53 = v24;
  v54 = a11;
  v38 = sub_20D191388();
  MEMORY[0x24BDAC7A8](v38);
  v25 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  v33 = a6;
  v25(v22, v50, a6);
  sub_20D191490();
  v26 = v37;
  v27 = v40;
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v19, v40, a7);
  sub_20D19137C();
  v28 = v44;
  v29 = v41;
  v30 = v46;
  (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v42, v46, v41);
  sub_20D191CAC();
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v30, v29);
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v27, a7);
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v50, v33);
  sub_20D19179C();
  return sub_20D191514();
}

void sub_20D15B9B8()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t, _QWORD);
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
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
  unsigned int v17;
  void (*v18)(uint64_t, uint64_t, uint64_t, _QWORD);

  OUTLINED_FUNCTION_41();
  v18 = v1;
  v3 = v2;
  v17 = v4;
  v6 = v5;
  v8 = v7;
  v9 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_34();
  v12 = v11 - v10;
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_15_1();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v0, v16, v15);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v12, v8, v3);
  swift_bridgeObjectRetain();
  v18(v0, v12, v6, v17);
  OUTLINED_FUNCTION_6_2();
}

unint64_t sub_20D15BAB8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_20D15BB88(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_20D162288((uint64_t)v12, *a3);
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
      sub_20D162288((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_20D15BB88(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  unint64_t result;
  uint64_t v10;
  unint64_t v11;
  _QWORD v12[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          result = 0;
          *((_BYTE *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_20D15BC84(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = sub_20D191EE0();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_20D15BC84(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_20D15BD18(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_20D15BE14(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_20D15BE14((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_20D15BD18(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  char v5;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_9;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_20D15BDB0(v2, 0);
      result = sub_20D191ED4();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = sub_20D191E50();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_20D15BDB0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9730);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_20D15BE14(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9730);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[v8] <= v12)
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void sub_20D15BEFC(uint64_t *a1@<X8>)
{
  *a1 = sub_20D191664();
  OUTLINED_FUNCTION_1();
}

uint64_t sub_20D15BF20()
{
  swift_retain();
  return sub_20D191670();
}

unint64_t sub_20D15BF4C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2549A8E60;
  if (!qword_2549A8E60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8E30);
    v2 = sub_20D161C74(&qword_2549A8E68, &qword_2549A8E28, (void (*)(void))sub_20D15BFF0);
    sub_20D150EAC(&qword_2549A8E90, &qword_2549A8E98);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2549A8E60);
  }
  return result;
}

unint64_t sub_20D15BFF0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_2549A8E70;
  if (!qword_2549A8E70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8E20);
    sub_20D150EAC(&qword_2549A8E78, &qword_2549A8E18);
    v3 = v2;
    sub_20D150EAC(&qword_2549A8E80, &qword_2549A8E88);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2549A8E70);
  }
  return result;
}

void sub_20D15C08C()
{
  sub_20D191634();
  OUTLINED_FUNCTION_1();
}

void sub_20D15C0AC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_38(a1, a2, a3);
  OUTLINED_FUNCTION_20_0(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_1();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_20D15C0F0()
{
  return sub_20D159350();
}

uint64_t sub_20D15C11C()
{
  return sub_20D159350();
}

uint64_t sub_20D15C148()
{
  return sub_20D159350();
}

uint64_t sub_20D15C174()
{
  OUTLINED_FUNCTION_45();
  return sub_20D15989C();
}

uint64_t sub_20D15C19C()
{
  OUTLINED_FUNCTION_45();
  return sub_20D15989C();
}

uint64_t sub_20D15C1C4()
{
  OUTLINED_FUNCTION_45();
  return sub_20D15989C();
}

uint64_t sub_20D15C1EC()
{
  OUTLINED_FUNCTION_45();
  return sub_20D15989C();
}

uint64_t sub_20D15C214()
{
  return sub_20D159C60();
}

uint64_t sub_20D15C230()
{
  uint64_t v0;

  return sub_20D159E6C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t _s16IntegrationModelCMa_0(uint64_t a1)
{
  return sub_20D14DB04(a1, qword_2549A91C8);
}

uint64_t sub_20D15C25C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_20D15C26C()
{
  sub_20D150DBC(&qword_2549A8ED8, (void (*)(uint64_t))type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
}

char *keypath_get_selector_tone()
{
  return sel_tone;
}

void sub_20D15C2A4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  objc_msgSend((id)OUTLINED_FUNCTION_23(a1), sel_tone);
  *v1 = v2;
  OUTLINED_FUNCTION_1();
}

id sub_20D15C2CC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTone_, *a1);
}

char *keypath_get_selector_color()
{
  return sel_color;
}

void sub_20D15C2EC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  objc_msgSend((id)OUTLINED_FUNCTION_23(a1), sel_color);
  *v1 = v2;
  OUTLINED_FUNCTION_1();
}

id sub_20D15C314(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setColor_, *a1);
}

char *keypath_get_selector_palette()
{
  return sel_palette;
}

void sub_20D15C334(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  objc_msgSend((id)OUTLINED_FUNCTION_23(a1), sel_palette);
  *v1 = v2;
  OUTLINED_FUNCTION_1();
}

id sub_20D15C35C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPalette_, *a1);
}

char *keypath_get_selector_hideToneAndColorLabels()
{
  return sel_hideToneAndColorLabels;
}

void sub_20D15C37C(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_23(a1), sel_hideToneAndColorLabels);
  OUTLINED_FUNCTION_1();
}

id sub_20D15C3A4(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHideToneAndColorLabels_, *a1);
}

char *keypath_get_selector_hidePaletteLabel()
{
  return sel_hidePaletteLabel;
}

void sub_20D15C3C4(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_23(a1), sel_hidePaletteLabel);
  OUTLINED_FUNCTION_1();
}

id sub_20D15C3EC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHidePaletteLabel_, *a1);
}

char *keypath_get_selector_hideResetButton()
{
  return sel_hideResetButton;
}

void sub_20D15C40C(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_23(a1), sel_hideResetButton);
  OUTLINED_FUNCTION_1();
}

id sub_20D15C434(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHideResetButton_, *a1);
}

char *keypath_get_selector_isResetButtonEnabled()
{
  return sel_isResetButtonEnabled;
}

void sub_20D15C454(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_23(a1), sel_isResetButtonEnabled);
  OUTLINED_FUNCTION_1();
}

id sub_20D15C47C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsResetButtonEnabled_, *a1);
}

char *keypath_get_selector_resetAction()
{
  return sel_resetAction;
}

void sub_20D15C4A4(uint64_t a1@<X8>)
{
  PEPhotoStyleValuesPlatterView.configuration.getter(a1);
  OUTLINED_FUNCTION_1();
}

void sub_20D15C4C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_20D15A9C0(a1, a2, a3, a4, (void (*)(uint64_t))PEPhotoStyleValuesPlatterView.configuration.setter);
}

_QWORD *initializeBufferWithCopyOfBuffer for PhotoStyleValueLabels(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;

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
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_DWORD *)(a1 + 24) = *((_DWORD *)a2 + 6);
    v5 = a2[5];
    v3[4] = a2[4];
    v3[5] = v5;
    v6 = *(int *)(a3 + 48);
    v7 = (char *)v3 + v6;
    v8 = (char *)a2 + v6;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *v7 = *v8;
      *((_QWORD *)v7 + 1) = *((_QWORD *)v8 + 1);
      v9 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
      v10 = v9[6];
      v11 = &v7[v10];
      v12 = &v8[v10];
      type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
      swift_retain();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v13 = sub_20D191CA0();
        if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13))
        {
          v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
          memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
          __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
        }
      }
      else
      {
        *(_QWORD *)v11 = *(_QWORD *)v12;
        swift_retain();
      }
      swift_storeEnumTagMultiPayload();
      *(_QWORD *)&v7[v9[7]] = *(_QWORD *)&v8[v9[7]];
      v16 = v9[8];
      v17 = &v7[v16];
      v18 = &v8[v16];
      *(_QWORD *)v17 = *(_QWORD *)v18;
      v17[8] = v18[8];
      v7[v9[9]] = v8[v9[9]];
    }
    else
    {
      *(_QWORD *)v7 = *(_QWORD *)v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v3;
}

uint64_t destroy for PhotoStyleValueLabels(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  swift_release();
  v4 = a1 + *(int *)(a2 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE0);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  swift_release();
  v5 = v4 + *(int *)(type metadata accessor for PhotoStyleValueLabels.Configuration(0) + 24);
  type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v6 = sub_20D191CA0();
  result = __swift_getEnumTagSinglePayload(v5, 1, v6);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return result;
}

uint64_t initializeWithCopy for PhotoStyleValueLabels(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  v5 = *(int *)(a3 + 48);
  v6 = a1 + v5;
  v7 = a2 + v5;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *(_BYTE *)v6 = *(_BYTE *)v7;
    *(_QWORD *)(v6 + 8) = *(_QWORD *)(v7 + 8);
    v8 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
    v9 = v8[6];
    v10 = (_QWORD *)(v6 + v9);
    v11 = (_QWORD *)(v7 + v9);
    type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
    swift_retain();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_20D191CA0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
      {
        v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
        memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
        __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
      }
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    *(_QWORD *)(v6 + v8[7]) = *(_QWORD *)(v7 + v8[7]);
    v14 = v8[8];
    v15 = v6 + v14;
    v16 = v7 + v14;
    *(_QWORD *)v15 = *(_QWORD *)v16;
    *(_BYTE *)(v15 + 8) = *(_BYTE *)(v16 + 8);
    *(_BYTE *)(v6 + v8[9]) = *(_BYTE *)(v7 + v8[9]);
  }
  else
  {
    *(_QWORD *)v6 = *(_QWORD *)v7;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for PhotoStyleValueLabels(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  *(_BYTE *)(a1 + 26) = *(_BYTE *)(a2 + 26);
  *(_BYTE *)(a1 + 27) = *(_BYTE *)(a2 + 27);
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v7 = *(int *)(a3 + 48);
    v8 = a1 + v7;
    v9 = a2 + v7;
    sub_20D14B87C(a1 + v7, &qword_2549A8EE0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *(_BYTE *)v8 = *(_BYTE *)v9;
      *(_QWORD *)(v8 + 8) = *(_QWORD *)(v9 + 8);
      v10 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
      v11 = v10[6];
      v12 = (_QWORD *)(v8 + v11);
      v13 = (_QWORD *)(v9 + v11);
      type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
      swift_retain();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v14 = sub_20D191CA0();
        if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14))
        {
          v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
          memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
        }
        else
        {
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
          __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v14);
        }
      }
      else
      {
        *v12 = *v13;
        swift_retain();
      }
      swift_storeEnumTagMultiPayload();
      *(_QWORD *)(v8 + v10[7]) = *(_QWORD *)(v9 + v10[7]);
      v16 = v10[8];
      v17 = v8 + v16;
      v18 = v9 + v16;
      v19 = *(_BYTE *)(v18 + 8);
      *(_QWORD *)v17 = *(_QWORD *)v18;
      *(_BYTE *)(v17 + 8) = v19;
      *(_BYTE *)(v8 + v10[9]) = *(_BYTE *)(v9 + v10[9]);
    }
    else
    {
      *(_QWORD *)v8 = *(_QWORD *)v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for PhotoStyleValueLabels(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v4 = *(int *)(a3 + 48);
  v5 = (_QWORD *)(a1 + v4);
  v6 = (_QWORD *)(a2 + v4);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *(_BYTE *)v5 = *(_BYTE *)v6;
    v5[1] = v6[1];
    v8 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
    v9 = v8[6];
    v10 = (char *)v5 + v9;
    v11 = (char *)v6 + v9;
    v12 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v13 = sub_20D191CA0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v13))
      {
        v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
        memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v10, v11, v13);
        __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v13);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    *(_QWORD *)((char *)v5 + v8[7]) = *(_QWORD *)((char *)v6 + v8[7]);
    v15 = v8[8];
    v16 = (char *)v5 + v15;
    v17 = (char *)v6 + v15;
    *(_QWORD *)v16 = *(_QWORD *)v17;
    v16[8] = v17[8];
    *((_BYTE *)v5 + v8[9]) = *((_BYTE *)v6 + v8[9]);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t assignWithTake for PhotoStyleValueLabels(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  *(_BYTE *)(a1 + 26) = *(_BYTE *)(a2 + 26);
  *(_BYTE *)(a1 + 27) = *(_BYTE *)(a2 + 27);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  if (a1 != a2)
  {
    v6 = *(int *)(a3 + 48);
    v7 = (_QWORD *)(a1 + v6);
    v8 = (_QWORD *)(a2 + v6);
    sub_20D14B87C(a1 + v6, &qword_2549A8EE0);
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *(_BYTE *)v7 = *(_BYTE *)v8;
      v7[1] = v8[1];
      v10 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
      v11 = v10[6];
      v12 = (char *)v7 + v11;
      v13 = (char *)v8 + v11;
      v14 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v15 = sub_20D191CA0();
        if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v15))
        {
          v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
          memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v12, v13, v15);
          __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v15);
        }
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
      }
      *(_QWORD *)((char *)v7 + v10[7]) = *(_QWORD *)((char *)v8 + v10[7]);
      v17 = v10[8];
      v18 = (char *)v7 + v17;
      v19 = (char *)v8 + v17;
      *(_QWORD *)v18 = *(_QWORD *)v19;
      v18[8] = v19[8];
      *((_BYTE *)v7 + v10[9]) = *((_BYTE *)v8 + v10[9]);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotoStyleValueLabels()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_20D15CF98()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_22();
  if (v2)
  {
    OUTLINED_FUNCTION_13_2(*(_QWORD *)(v0 + 32));
    OUTLINED_FUNCTION_7_3();
  }
  else
  {
    OUTLINED_FUNCTION_65();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE8);
    v3 = OUTLINED_FUNCTION_51(*(int *)(v1 + 48));
    OUTLINED_FUNCTION_4_3(v3, v4, v5);
  }
}

uint64_t storeEnumTagSinglePayload for PhotoStyleValueLabels()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_20D15CFF0()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_12_2();
  if (v3)
  {
    *(_QWORD *)(v1 + 32) = (v0 - 1);
    OUTLINED_FUNCTION_7_3();
  }
  else
  {
    v4 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE8);
    v5 = OUTLINED_FUNCTION_25(*(int *)(v4 + 48));
    OUTLINED_FUNCTION_5_2(v5, v6, v7, v8);
  }
}

void sub_20D15D03C()
{
  unint64_t v0;

  sub_20D15DF7C(319, qword_2549A8F58, type metadata accessor for PhotoStyleValueLabels.Configuration, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

_QWORD *initializeBufferWithCopyOfBuffer for PhotoStyleValueLabels.Configuration(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    a1[1] = a2[1];
    v7 = a3[6];
    v8 = (_QWORD *)((char *)a1 + v7);
    v9 = (_QWORD *)((char *)a2 + v7);
    type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
    swift_retain();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_20D191CA0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
      {
        v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
        memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
        __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
      }
    }
    else
    {
      *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v13 = a3[8];
    *(_QWORD *)((char *)v4 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
    v14 = (char *)v4 + v13;
    v15 = (char *)a2 + v13;
    *(_QWORD *)v14 = *(_QWORD *)v15;
    v14[8] = v15[8];
    *((_BYTE *)v4 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  }
  return v4;
}

uint64_t destroy for PhotoStyleValueLabels.Configuration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  swift_release();
  v4 = a1 + *(int *)(a2 + 24);
  type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v5 = sub_20D191CA0();
  result = __swift_getEnumTagSinglePayload(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return result;
}

uint64_t initializeWithCopy for PhotoStyleValueLabels.Configuration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v6 = a3[6];
  v7 = (_QWORD *)(a1 + v6);
  v8 = (_QWORD *)(a2 + v6);
  type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
  swift_retain();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = sub_20D191CA0();
    if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
    }
  }
  else
  {
    *v7 = *v8;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v11 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  v12 = a1 + v11;
  v13 = a2 + v11;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *(_BYTE *)(v12 + 8) = *(_BYTE *)(v13 + 8);
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  return a1;
}

uint64_t assignWithCopy for PhotoStyleValueLabels.Configuration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v6 = a3[6];
    v7 = (_QWORD *)(a1 + v6);
    v8 = (_QWORD *)(a2 + v6);
    sub_20D14A8AC(a1 + v6, type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
    type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v9 = sub_20D191CA0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
      {
        v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
        memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
        __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
      }
    }
    else
    {
      *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  v11 = a3[8];
  v12 = a1 + v11;
  v13 = (uint64_t *)(a2 + v11);
  v14 = *v13;
  *(_BYTE *)(v12 + 8) = *((_BYTE *)v13 + 8);
  *(_QWORD *)v12 = v14;
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  return a1;
}

uint64_t initializeWithTake for PhotoStyleValueLabels.Configuration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v6 = a3[6];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_20D191CA0();
    if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10))
    {
      v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v10);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  v12 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  v13 = a1 + v12;
  v14 = a2 + v12;
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *(_BYTE *)(v13 + 8) = *(_BYTE *)(v14 + 8);
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  return a1;
}

uint64_t assignWithTake for PhotoStyleValueLabels.Configuration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  if (a1 != a2)
  {
    v6 = a3[6];
    v7 = (void *)(a1 + v6);
    v8 = (const void *)(a2 + v6);
    sub_20D14A8AC(a1 + v6, type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
    v9 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_20D191CA0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10))
      {
        v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
        memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
        __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v10);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
  }
  v12 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  v13 = a1 + v12;
  v14 = a2 + v12;
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *(_BYTE *)(v13 + 8) = *(_BYTE *)(v14 + 8);
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotoStyleValueLabels.Configuration()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_20D15D878()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_22();
  if (v2)
  {
    OUTLINED_FUNCTION_13_2(*(_QWORD *)(v0 + 8));
    OUTLINED_FUNCTION_7_3();
  }
  else
  {
    OUTLINED_FUNCTION_65();
    OUTLINED_FUNCTION_30();
    v3 = OUTLINED_FUNCTION_51(*(int *)(v1 + 24));
    OUTLINED_FUNCTION_4_3(v3, v4, v5);
  }
}

uint64_t storeEnumTagSinglePayload for PhotoStyleValueLabels.Configuration()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_20D15D8C8()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_12_2();
  if (v3)
  {
    *(_QWORD *)(v1 + 8) = (v0 - 1);
    OUTLINED_FUNCTION_7_3();
  }
  else
  {
    v4 = v2;
    OUTLINED_FUNCTION_30();
    v5 = OUTLINED_FUNCTION_25(*(int *)(v4 + 24));
    OUTLINED_FUNCTION_5_2(v5, v6, v7, v8);
  }
}

uint64_t sub_20D15D90C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for PhotoStyleValueLabels.Configuration.BackgroundStyle(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
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
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_20D191CA0();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
      {
        v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for PhotoStyleValueLabels.Configuration.BackgroundStyle(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v2 = sub_20D191CA0();
  result = __swift_getEnumTagSinglePayload(a1, 1, v2);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return result;
}

_QWORD *initializeWithCopy for PhotoStyleValueLabels.Configuration.BackgroundStyle(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_20D191CA0();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v4))
    {
      v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v4);
    }
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *assignWithCopy for PhotoStyleValueLabels.Configuration.BackgroundStyle(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  if (a1 != a2)
  {
    sub_20D14A8AC((uint64_t)a1, type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v4 = sub_20D191CA0();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v4))
      {
        v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v4);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for PhotoStyleValueLabels.Configuration.BackgroundStyle(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_20D191CA0();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
    {
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for PhotoStyleValueLabels.Configuration.BackgroundStyle(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_20D14A8AC((uint64_t)a1, type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_20D191CA0();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
      {
        v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_20D15DEE0()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_20D15DEF0()
{
  unint64_t v0;

  sub_20D15DF7C(319, qword_2549A90C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF4E58], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  if (v0 <= 0x3F)
    swift_initEnumMetadataMultiPayload();
}

void sub_20D15DF7C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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
  OUTLINED_FUNCTION_7_3();
}

uint64_t type metadata accessor for BundleClass()
{
  return objc_opt_self();
}

uint64_t sub_20D15DFEC()
{
  return _s16IntegrationModelCMa_0(0);
}

uint64_t sub_20D15DFF4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for PhotoStyleValueLabels.Configuration(319);
  if (v1 <= 0x3F)
  {
    result = sub_20D1912E0();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for PEPhotoStyleValuesPlatterView(uint64_t a1)
{
  return sub_20D14E520(a1, &qword_2549A92C0);
}

uint64_t sub_20D15E0C4()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for SecureDrawHostingController(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SecureDrawHostingController);
}

unint64_t sub_20D15E114()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2549A9358;
  if (!qword_2549A9358)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8E50);
    v2 = sub_20D15E198();
    sub_20D150EAC(qword_2549A9380, &qword_2549A8EB0);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2549A9358);
  }
  return result;
}

unint64_t sub_20D15E198()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2549A9360;
  if (!qword_2549A9360)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8E48);
    v2 = sub_20D15E21C();
    sub_20D150EAC(&qword_2549A9378, &qword_2549A8EA8);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2549A9360);
  }
  return result;
}

unint64_t sub_20D15E21C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  _QWORD v4[4];

  result = qword_2549A9368;
  if (!qword_2549A9368)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8E40);
    v4[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A8E30);
    v4[3] = sub_20D15BF4C();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_20D150EAC(&qword_2549A9370, &qword_2549A8EA0);
    v4[0] = OpaqueTypeConformance2;
    v4[1] = v3;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2549A9368);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PhotoStyleValueLabels.Configuration.SizeFamily(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PhotoStyleValueLabels.Configuration.SizeFamily(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20D15E3A8 + 4 * byte_20D1961B5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_20D15E3DC + 4 * byte_20D1961B0[v4]))();
}

uint64_t sub_20D15E3DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D15E3E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20D15E3ECLL);
  return result;
}

uint64_t sub_20D15E3F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20D15E400);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_20D15E404(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D15E40C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D15E418(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_20D15E420(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PhotoStyleValueLabels.Configuration.SizeFamily()
{
  return &type metadata for PhotoStyleValueLabels.Configuration.SizeFamily;
}

ValueMetadata *_s15IntegrationViewVMa_0()
{
  return &_s15IntegrationViewVN;
}

uint64_t sub_20D15E448()
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

_QWORD *sub_20D15E4CC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = (_QWORD *)a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 64) + 7;
  if (v5 > 7
    || (*(_DWORD *)(v4 + 80) & 0x100000) != 0
    || ((v6 + ((v5 + 9) & ~v5)) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v9 + ((v5 & 0xF8 ^ 0x1F8) & (v5 + 16)));
    swift_retain();
  }
  else
  {
    *(_QWORD *)a1 = *a2;
    *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
    v10 = (a1 + v5 + 9) & ~v5;
    v11 = ((unint64_t)a2 + v5 + 9) & ~v5;
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v10, v11);
    *(_QWORD *)((v6 + v10) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v6 + v11) & 0xFFFFFFFFFFFFF8);
  }
  return v3;
}

uint64_t sub_20D15E5AC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((a1 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80) + 9) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

uint64_t sub_20D15E5CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = (v5 + 9 + a1) & ~v5;
  v7 = (v5 + 9 + a2) & ~v5;
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v6, v7);
  *(_QWORD *)((*(_QWORD *)(v4 + 64) + 7 + v6) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v4 + 64) + 7 + v7) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_20D15E654(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v4;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (v6 + 9 + a1) & ~v6;
  v8 = ((unint64_t)a2 + v6 + 9) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v5 + 24))(v7, v8);
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + v7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + v8) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_20D15E6DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = (v5 + 9 + a1) & ~v5;
  v7 = (v5 + 9 + a2) & ~v5;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v6, v7);
  *(_QWORD *)((*(_QWORD *)(v4 + 64) + 7 + v6) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v4 + 64) + 7 + v7) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_20D15E764(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = (v5 + 9 + a1) & ~v5;
  v7 = (v5 + 9 + a2) & ~v5;
  (*(void (**)(uint64_t, uint64_t))(v4 + 40))(v6, v7);
  *(_QWORD *)((*(_QWORD *)(v4 + 64) + 7 + v6) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v4 + 64) + 7 + v7) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_20D15E7EC(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 >= a2)
  {
    if ((_DWORD)v6)
      return __swift_getEnumTagSinglePayload((a1 + v7 + 9) & ~v7, v6, v4);
    return 0;
  }
  if (((((*(_QWORD *)(v5 + 64) + ((v7 + 9) & ~v7) + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
    v8 = 2;
  else
    v8 = a2 - v6 + 1;
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
  return ((uint64_t (*)(void))((char *)&loc_20D15E86C + 4 * byte_20D1961BA[v10]))();
}

void sub_20D15E8D0(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  int v12;
  unsigned int v13;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = ((*(_QWORD *)(v6 + 64)
       + ((*(unsigned __int8 *)(v6 + 80) + 9) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
       + 7) & 0xFFFFFFFFFFFFFFF8)
     + 8;
  if (v7 >= a3)
  {
    v12 = 0;
  }
  else
  {
    v9 = a3 - v7;
    if (((*(_DWORD *)(v6 + 64) + ((*(unsigned __int8 *)(v6 + 80) + 9) & ~*(unsigned __int8 *)(v6 + 80)) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
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
  __asm { BR              X12 }
}

uint64_t sub_20D15E9C4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  *(_BYTE *)(v5 + v6) = 0;
  if ((_DWORD)a1)
    return __swift_storeEnumTagSinglePayload((v5 + v4 + 9) & a4, a1, a2, a3);
  return result;
}

void sub_20D15EA08(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_WORD *)(v2 + v3) = 0;
  if (!a2)
    JUMPOUT(0x20D15EA10);
  JUMPOUT(0x20D15E9E8);
}

uint64_t type metadata accessor for BrightnessMultiply(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BrightnessMultiply);
}

uint64_t sub_20D15EA34()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_20D15EA3C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(319);
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

uint64_t *sub_20D15EAC4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  unint64_t v21;

  v6 = sub_20D191CA0();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84))
    v8 = *(_QWORD *)(v7 + 64);
  else
    v8 = *(_QWORD *)(v7 + 64) + 1;
  if (v8 <= 8)
    v9 = 8;
  else
    v9 = v8;
  v10 = *(_QWORD *)(a3 + 16);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_DWORD *)(v11 + 80);
  v13 = v9 + v12 + 1;
  v14 = v12 | *(_DWORD *)(v7 + 80) & 0xF8;
  if (v14 > 7
    || ((*(_DWORD *)(v7 + 80) | v12) & 0x100000) != 0
    || (v13 & ~(unint64_t)v12) + *(_QWORD *)(v11 + 64) > 0x18)
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + (((v14 | 7) + 16) & ~(unint64_t)(v14 | 7)));
    swift_retain();
  }
  else
  {
    v18 = v6;
    v19 = *((unsigned __int8 *)a2 + v9);
    if (v19 >= 2)
    {
      if (v9 <= 3)
        v20 = v9;
      else
        v20 = 4;
      __asm { BR              X13 }
    }
    v21 = ~(unint64_t)v12;
    if (v19 == 1)
    {
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
      {
        memcpy(a1, a2, v8);
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, v18);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v18);
      }
      *((_BYTE *)a1 + v9) = 1;
    }
    else
    {
      *a1 = *a2;
      *((_BYTE *)a1 + v9) = 0;
      swift_retain();
    }
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 16))(((unint64_t)a1 + v13) & v21, ((unint64_t)a2 + v13) & v21, v10);
  }
  return a1;
}

uint64_t sub_20D15ECA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;

  v4 = sub_20D191CA0();
  v5 = *(_QWORD *)(v4 - 8);
  if (*(_DWORD *)(v5 + 84))
    v6 = *(_QWORD *)(v5 + 64);
  else
    v6 = *(_QWORD *)(v5 + 64) + 1;
  if (v6 <= 8)
    v7 = 8;
  else
    v7 = v6;
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
  {
    if (!__swift_getEnumTagSinglePayload(a1, 1, v4))
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((a1 + v7 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

_QWORD *sub_20D15EDC8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;

  v6 = sub_20D191CA0();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84))
    v8 = *(_QWORD *)(v7 + 64);
  else
    v8 = *(_QWORD *)(v7 + 64) + 1;
  if (v8 <= 8)
    v9 = 8;
  else
    v9 = v8;
  v10 = *((unsigned __int8 *)a2 + v9);
  if (v10 >= 2)
  {
    if (v9 <= 3)
      v11 = v9;
    else
      v11 = 4;
    __asm { BR              X12 }
  }
  if (v10 == 1)
  {
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
    {
      memcpy(a1, a2, v8);
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(a1, a2, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
    }
    *((_BYTE *)a1 + v9) = 1;
  }
  else
  {
    *a1 = *a2;
    *((_BYTE *)a1 + v9) = 0;
    swift_retain();
  }
  v12 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v12 + 16))(((unint64_t)a1 + v9 + *(unsigned __int8 *)(v12 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80), ((unint64_t)a2 + v9 + *(unsigned __int8 *)(v12 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  return a1;
}

_QWORD *sub_20D15EF44(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  uint64_t v17;

  if (a1 != a2)
  {
    v6 = sub_20D191CA0();
    v7 = *(_QWORD *)(v6 - 8);
    if (*(_DWORD *)(v7 + 84))
      v8 = *(_QWORD *)(v7 + 64);
    else
      v8 = *(_QWORD *)(v7 + 64) + 1;
    if (v8 <= 8)
      v9 = 8;
    else
      v9 = v8;
    v10 = *((unsigned __int8 *)a1 + v9);
    if (v10 >= 2)
    {
      if (v9 <= 3)
        v11 = v9;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
    {
      if (!__swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6))
        (*(void (**)(_QWORD *, uint64_t))(v7 + 8))(a1, v6);
    }
    else
    {
      swift_release();
    }
    v12 = *((unsigned __int8 *)a2 + v9);
    if (v12 >= 2)
    {
      if (v9 <= 3)
        v13 = v9;
      else
        v13 = 4;
      __asm { BR              X12 }
    }
    if (v12 == 1)
    {
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
      {
        memcpy(a1, a2, v8);
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(a1, a2, v6);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      }
      *((_BYTE *)a1 + v9) = 1;
    }
    else
    {
      *a1 = *a2;
      *((_BYTE *)a1 + v9) = 0;
      swift_retain();
    }
  }
  v14 = *(_QWORD *)(sub_20D191CA0() - 8);
  v15 = *(_DWORD *)(v14 + 84);
  v16 = *(_QWORD *)(v14 + 64);
  if (!v15)
    ++v16;
  if (v16 <= 8)
    v16 = 8;
  v17 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v17 + 24))(((unint64_t)a1 + v16 + *(unsigned __int8 *)(v17 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80), ((unint64_t)a2 + v16 + *(unsigned __int8 *)(v17 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
  return a1;
}

_QWORD *sub_20D15F1A0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v6 = sub_20D191CA0();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84))
    v8 = *(_QWORD *)(v7 + 64);
  else
    v8 = *(_QWORD *)(v7 + 64) + 1;
  if (v8 <= 8)
    v9 = 8;
  else
    v9 = v8;
  v10 = *((unsigned __int8 *)a2 + v9);
  if (v10 >= 2)
  {
    if (v9 <= 3)
      v11 = v9;
    else
      v11 = 4;
    __asm { BR              X12 }
  }
  if (v10 == 1)
  {
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
    {
      memcpy(a1, a2, v8);
      v12 = 1;
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 32))(a1, a2, v6);
      v12 = 1;
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
    }
  }
  else
  {
    v12 = 0;
    *a1 = *a2;
  }
  *((_BYTE *)a1 + v9) = v12;
  v13 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v13 + 32))(((unint64_t)a1 + v9 + *(unsigned __int8 *)(v13 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), ((unint64_t)a2 + v9 + *(unsigned __int8 *)(v13 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
  return a1;
}

_QWORD *sub_20D15F31C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  int v16;
  unint64_t v17;
  uint64_t v18;

  if (a1 != a2)
  {
    v6 = sub_20D191CA0();
    v7 = *(_QWORD *)(v6 - 8);
    if (*(_DWORD *)(v7 + 84))
      v8 = *(_QWORD *)(v7 + 64);
    else
      v8 = *(_QWORD *)(v7 + 64) + 1;
    if (v8 <= 8)
      v9 = 8;
    else
      v9 = v8;
    v10 = *((unsigned __int8 *)a1 + v9);
    if (v10 >= 2)
    {
      if (v9 <= 3)
        v11 = v9;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
    {
      if (!__swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6))
        (*(void (**)(_QWORD *, uint64_t))(v7 + 8))(a1, v6);
    }
    else
    {
      swift_release();
    }
    v12 = *((unsigned __int8 *)a2 + v9);
    if (v12 >= 2)
    {
      if (v9 <= 3)
        v13 = v9;
      else
        v13 = 4;
      __asm { BR              X12 }
    }
    if (v12 == 1)
    {
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
      {
        memcpy(a1, a2, v8);
        v14 = 1;
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 32))(a1, a2, v6);
        v14 = 1;
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      }
    }
    else
    {
      v14 = 0;
      *a1 = *a2;
    }
    *((_BYTE *)a1 + v9) = v14;
  }
  v15 = *(_QWORD *)(sub_20D191CA0() - 8);
  v16 = *(_DWORD *)(v15 + 84);
  v17 = *(_QWORD *)(v15 + 64);
  if (!v16)
    ++v17;
  if (v17 <= 8)
    v17 = 8;
  v18 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v18 + 40))(((unint64_t)a1 + v17 + *(unsigned __int8 *)(v18 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80), ((unint64_t)a2 + v17 + *(unsigned __int8 *)(v18 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80));
  return a1;
}

uint64_t sub_20D15F578(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  int v18;
  unsigned int v20;
  int v21;
  int v22;
  unsigned int v23;

  v6 = *(_QWORD *)(sub_20D191CA0() - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(_QWORD *)(a3 + 16);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int *)(v10 + 84);
  if (v11 <= 0xFE)
    v12 = 254;
  else
    v12 = *(_DWORD *)(v10 + 84);
  if (v7)
    v13 = v8;
  else
    v13 = v8 + 1;
  if (v13 <= 8)
    v13 = 8;
  if (!a2)
    return 0;
  v14 = *(unsigned __int8 *)(v10 + 80);
  v15 = v13 + v14 + 1;
  if (a2 <= v12)
    goto LABEL_29;
  v16 = (v15 & ~v14) + *(_QWORD *)(v10 + 64);
  v17 = 8 * v16;
  if (v16 <= 3)
  {
    v20 = ((a2 - v12 + ~(-1 << v17)) >> v17) + 1;
    if (HIWORD(v20))
    {
      v18 = *(_DWORD *)(a1 + v16);
      if (!v18)
        goto LABEL_29;
      goto LABEL_20;
    }
    if (v20 > 0xFF)
    {
      v18 = *(unsigned __int16 *)(a1 + v16);
      if (!*(_WORD *)(a1 + v16))
        goto LABEL_29;
      goto LABEL_20;
    }
    if (v20 < 2)
    {
LABEL_29:
      if (v11 > 0xFE)
        return __swift_getEnumTagSinglePayload((v15 + a1) & ~v14, v11, v9);
      v23 = *(unsigned __int8 *)(a1 + v13);
      if (v23 >= 2)
        return (v23 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v18 = *(unsigned __int8 *)(a1 + v16);
  if (!*(_BYTE *)(a1 + v16))
    goto LABEL_29;
LABEL_20:
  v21 = (v18 - 1) << v17;
  if (v16 > 3)
    v21 = 0;
  if ((_DWORD)v16)
  {
    if (v16 <= 3)
      v22 = v16;
    else
      v22 = 4;
    __asm { BR              X12 }
  }
  return v12 + v21 + 1;
}

void sub_20D15F718(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  size_t v13;
  char v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  int v18;

  v8 = *(_QWORD *)(sub_20D191CA0() - 8);
  v9 = *(_DWORD *)(v8 + 84);
  v10 = *(_QWORD *)(v8 + 64);
  v11 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v11 + 84) <= 0xFEu)
    v12 = 254;
  else
    v12 = *(_DWORD *)(v11 + 84);
  if (!v9)
    ++v10;
  if (v10 <= 8)
    v10 = 8;
  v13 = ((v10 + *(unsigned __int8 *)(v11 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))
      + *(_QWORD *)(v11 + 64);
  v14 = 8 * v13;
  if (a3 <= v12)
  {
    v15 = 0;
  }
  else if (v13 <= 3)
  {
    v17 = ((a3 - v12 + ~(-1 << v14)) >> v14) + 1;
    if (HIWORD(v17))
    {
      v15 = 4u;
    }
    else if (v17 >= 0x100)
    {
      v15 = 2;
    }
    else
    {
      v15 = v17 > 1;
    }
  }
  else
  {
    v15 = 1u;
  }
  if (v12 < a2)
  {
    v16 = ~v12 + a2;
    if (v13 < 4)
    {
      if ((_DWORD)v13)
      {
        v18 = v16 & ~(-1 << v14);
        bzero(a1, v13);
        if ((_DWORD)v13 == 3)
        {
          *(_WORD *)a1 = v18;
          a1[2] = BYTE2(v18);
        }
        else if ((_DWORD)v13 == 2)
        {
          *(_WORD *)a1 = v18;
        }
        else
        {
          *a1 = v18;
        }
      }
    }
    else
    {
      bzero(a1, v13);
      *(_DWORD *)a1 = v16;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

void sub_20D15F990()
{
  uint64_t v0;
  int v1;

  *(_WORD *)v0 = v1;
  *(_BYTE *)(v0 + 2) = BYTE2(v1);
  JUMPOUT(0x20D15F97CLL);
}

void sub_20D15F9A0()
{
  _WORD *v0;
  __int16 v1;

  *v0 = v1;
  JUMPOUT(0x20D15F97CLL);
}

void sub_20D15F9A8()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
  JUMPOUT(0x20D15F97CLL);
}

uint64_t type metadata accessor for BackgroundPlatter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BackgroundPlatter);
}

_BYTE *sub_20D15F9C0(_BYTE *a1, uint64_t *a2, uint64_t a3)
{
  _BYTE *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *(_QWORD *)v4 = *a2;
    v4 = (_BYTE *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(_BYTE *)a2;
    v7 = a2[2];
    *((_QWORD *)v4 + 1) = a2[1];
    *((_QWORD *)v4 + 2) = v7;
    *(_OWORD *)(v4 + 24) = *(_OWORD *)(a2 + 3);
    v8 = *(int *)(a3 + 32);
    v9 = &v4[v8];
    v10 = (uint64_t)a2 + v8;
    *((_QWORD *)v4 + 5) = a2[5];
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *v9 = *(_BYTE *)v10;
      *((_QWORD *)v9 + 1) = *(_QWORD *)(v10 + 8);
      v11 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
      v12 = v11[6];
      v13 = &v9[v12];
      v14 = (_QWORD *)(v10 + v12);
      type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
      swift_retain();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v15 = sub_20D191CA0();
        if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15))
        {
          v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
          memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
        }
        else
        {
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
          __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
        }
      }
      else
      {
        *v13 = *v14;
        swift_retain();
      }
      swift_storeEnumTagMultiPayload();
      *(_QWORD *)&v9[v11[7]] = *(_QWORD *)(v10 + v11[7]);
      v18 = v11[8];
      v19 = &v9[v18];
      v20 = v10 + v18;
      *(_QWORD *)v19 = *(_QWORD *)v20;
      v19[8] = *(_BYTE *)(v20 + 8);
      v9[v11[9]] = *(_BYTE *)(v10 + v11[9]);
    }
    else
    {
      *(_QWORD *)v9 = *(_QWORD *)v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v21 = *(int *)(a3 + 36);
    v22 = &v4[v21];
    v23 = (uint64_t *)((char *)a2 + v21);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BB8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v24 = sub_20D191508();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
    }
    else
    {
      *v22 = *v23;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v4;
}

uint64_t sub_20D15FC60(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  swift_release();
  swift_release();
  v4 = a1 + *(int *)(a2 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE0);
  if (swift_getEnumCaseMultiPayload() == 1
    && (swift_release(),
        v5 = v4 + *(int *)(type metadata accessor for PhotoStyleValueLabels.Configuration(0) + 24),
        type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0),
        swift_getEnumCaseMultiPayload() == 1))
  {
    v6 = sub_20D191CA0();
    if (!__swift_getEnumTagSinglePayload(v5, 1, v6))
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  v7 = a1 + *(int *)(a2 + 36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BB8);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v8 = sub_20D191508();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

uint64_t sub_20D15FD88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
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

  v3 = a3;
  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v7 = *(int *)(a3 + 32);
  v8 = a1 + v7;
  v9 = a2 + v7;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v24 = v3;
    *(_BYTE *)v8 = *(_BYTE *)v9;
    *(_QWORD *)(v8 + 8) = *(_QWORD *)(v9 + 8);
    v10 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
    v11 = v10[6];
    v12 = (_QWORD *)(v8 + v11);
    v13 = (_QWORD *)(v9 + v11);
    type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
    swift_retain();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v14 = sub_20D191CA0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14))
      {
        v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
        memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
        __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v14);
      }
    }
    else
    {
      *v12 = *v13;
      swift_retain();
    }
    v3 = v24;
    swift_storeEnumTagMultiPayload();
    *(_QWORD *)(v8 + v10[7]) = *(_QWORD *)(v9 + v10[7]);
    v16 = v10[8];
    v17 = v8 + v16;
    v18 = v9 + v16;
    *(_QWORD *)v17 = *(_QWORD *)v18;
    *(_BYTE *)(v17 + 8) = *(_BYTE *)(v18 + 8);
    *(_BYTE *)(v8 + v10[9]) = *(_BYTE *)(v9 + v10[9]);
  }
  else
  {
    *(_QWORD *)v8 = *(_QWORD *)v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v19 = *(int *)(v3 + 36);
  v20 = (_QWORD *)(a1 + v19);
  v21 = (_QWORD *)(a2 + v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BB8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v22 = sub_20D191508();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v20, v21, v22);
  }
  else
  {
    *v20 = *v21;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_20D160000(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v7 = *(int *)(a3 + 32);
    v8 = a1 + v7;
    v9 = a2 + v7;
    sub_20D14B87C(a1 + v7, &qword_2549A8EE0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *(_BYTE *)v8 = *(_BYTE *)v9;
      *(_QWORD *)(v8 + 8) = *(_QWORD *)(v9 + 8);
      v10 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
      v11 = v10[6];
      v12 = (_QWORD *)(v8 + v11);
      v13 = (_QWORD *)(v9 + v11);
      type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
      swift_retain();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v14 = sub_20D191CA0();
        if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14))
        {
          v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
          memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
        }
        else
        {
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
          __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v14);
        }
      }
      else
      {
        *v12 = *v13;
        swift_retain();
      }
      swift_storeEnumTagMultiPayload();
      *(_QWORD *)(v8 + v10[7]) = *(_QWORD *)(v9 + v10[7]);
      v16 = v10[8];
      v17 = v8 + v16;
      v18 = v9 + v16;
      v19 = *(_BYTE *)(v18 + 8);
      *(_QWORD *)v17 = *(_QWORD *)v18;
      *(_BYTE *)(v17 + 8) = v19;
      *(_BYTE *)(v8 + v10[9]) = *(_BYTE *)(v9 + v10[9]);
    }
    else
    {
      *(_QWORD *)v8 = *(_QWORD *)v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v20 = *(int *)(a3 + 36);
    v21 = (_QWORD *)(a1 + v20);
    v22 = (_QWORD *)(a2 + v20);
    sub_20D14B87C(a1 + v20, &qword_2549A8BB8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BB8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v23 = sub_20D191508();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v21, v22, v23);
    }
    else
    {
      *v21 = *v22;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_20D1602B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void *v21;
  const void *v22;
  uint64_t v23;
  uint64_t v24;
  void *__dst;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v6 = *(int *)(a3 + 32);
  v7 = (_QWORD *)(a1 + v6);
  v8 = (_QWORD *)(a2 + v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *(_BYTE *)v7 = *(_BYTE *)v8;
    v7[1] = v8[1];
    v10 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
    v11 = v10[6];
    v12 = (char *)v7 + v11;
    v13 = (char *)v8 + v11;
    v14 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      __dst = v12;
      v15 = sub_20D191CA0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v15))
      {
        v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
        memcpy(__dst, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(__dst, v13, v15);
        __swift_storeEnumTagSinglePayload((uint64_t)__dst, 0, 1, v15);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    *(_QWORD *)((char *)v7 + v10[7]) = *(_QWORD *)((char *)v8 + v10[7]);
    v17 = v10[8];
    v18 = (char *)v7 + v17;
    v19 = (char *)v8 + v17;
    *(_QWORD *)v18 = *(_QWORD *)v19;
    v18[8] = v19[8];
    *((_BYTE *)v7 + v10[9]) = *((_BYTE *)v8 + v10[9]);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  v20 = *(int *)(a3 + 36);
  v21 = (void *)(a1 + v20);
  v22 = (const void *)(a2 + v20);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BB8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v24 = sub_20D191508();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v21, v22, v24);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  return a1;
}

uint64_t sub_20D160510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void *v21;
  const void *v22;
  uint64_t v23;
  uint64_t v24;
  void *__dst;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release();
  if (a1 != a2)
  {
    v6 = *(int *)(a3 + 32);
    v7 = (_QWORD *)(a1 + v6);
    v8 = (_QWORD *)(a2 + v6);
    sub_20D14B87C(a1 + v6, &qword_2549A8EE0);
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *(_BYTE *)v7 = *(_BYTE *)v8;
      v7[1] = v8[1];
      v10 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
      v11 = v10[6];
      v12 = (char *)v7 + v11;
      v13 = (char *)v8 + v11;
      v14 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        __dst = v12;
        v15 = sub_20D191CA0();
        if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v15))
        {
          v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
          memcpy(__dst, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(__dst, v13, v15);
          __swift_storeEnumTagSinglePayload((uint64_t)__dst, 0, 1, v15);
        }
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
      }
      *(_QWORD *)((char *)v7 + v10[7]) = *(_QWORD *)((char *)v8 + v10[7]);
      v17 = v10[8];
      v18 = (char *)v7 + v17;
      v19 = (char *)v8 + v17;
      *(_QWORD *)v18 = *(_QWORD *)v19;
      v18[8] = v19[8];
      *((_BYTE *)v7 + v10[9]) = *((_BYTE *)v8 + v10[9]);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    v20 = *(int *)(a3 + 36);
    v21 = (void *)(a1 + v20);
    v22 = (const void *)(a2 + v20);
    sub_20D14B87C(a1 + v20, &qword_2549A8BB8);
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BB8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v24 = sub_20D191508();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v21, v22, v24);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_20D1607A8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_20D1607B4()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_22();
  if (v3)
  {
    OUTLINED_FUNCTION_13_2(*(_QWORD *)(v1 + 8));
    OUTLINED_FUNCTION_7_3();
  }
  else
  {
    OUTLINED_FUNCTION_65();
    if (*(_DWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE8) - 8) + 84) == v0)
    {
      v4 = *(int *)(v2 + 32);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BE0);
      v4 = *(int *)(v2 + 36);
    }
    v5 = OUTLINED_FUNCTION_51(v4);
    OUTLINED_FUNCTION_4_3(v5, v6, v7);
  }
}

uint64_t sub_20D160828()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_20D160834()
{
  int v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_12_2();
  if (v4)
  {
    *(_QWORD *)(v1 + 8) = (v0 - 1);
    OUTLINED_FUNCTION_7_3();
  }
  else
  {
    v5 = v3;
    if (*(_DWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE8) - 8) + 84) == v2)
    {
      v6 = *(int *)(v5 + 32);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BE0);
      v6 = *(int *)(v5 + 36);
    }
    v7 = OUTLINED_FUNCTION_25(v6);
    OUTLINED_FUNCTION_5_2(v7, v8, v9, v10);
  }
}

uint64_t type metadata accessor for PhotoStyleValueLabels.ResetButton(uint64_t a1)
{
  return sub_20D14DB04(a1, qword_2549A94E0);
}

void sub_20D1608C0()
{
  unint64_t v0;
  unint64_t v1;

  sub_20D15DF7C(319, qword_2549A8F58, type metadata accessor for PhotoStyleValueLabels.Configuration, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560]);
  if (v0 <= 0x3F)
  {
    sub_20D15DF7C(319, (unint64_t *)&qword_2549A8C50, (uint64_t (*)(uint64_t))MEMORY[0x24BDED130], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t *sub_20D1609A4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
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
    v9 = *(int *)(a3 + 28);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    a1[4] = a2[4];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *v10 = *v11;
      *((_QWORD *)v10 + 1) = *((_QWORD *)v11 + 1);
      v12 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
      v13 = v12[6];
      v14 = &v10[v13];
      v15 = &v11[v13];
      type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
      swift_retain();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v16 = sub_20D191CA0();
        if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
        {
          v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
          memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
          __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
        }
      }
      else
      {
        *(_QWORD *)v14 = *(_QWORD *)v15;
        swift_retain();
      }
      swift_storeEnumTagMultiPayload();
      *(_QWORD *)&v10[v12[7]] = *(_QWORD *)&v11[v12[7]];
      v19 = v12[8];
      v20 = &v10[v19];
      v21 = &v11[v19];
      *(_QWORD *)v20 = *(_QWORD *)v21;
      v20[8] = v21[8];
      v10[v12[9]] = v11[v12[9]];
    }
    else
    {
      *(_QWORD *)v10 = *(_QWORD *)v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v22 = *(int *)(a3 + 32);
    v23 = (uint64_t *)((char *)a1 + v22);
    v24 = (uint64_t *)((char *)a2 + v22);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BB8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v25 = sub_20D191508();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v23, v24, v25);
    }
    else
    {
      *v23 = *v24;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_20D160C3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE0);
  if (swift_getEnumCaseMultiPayload() == 1
    && (swift_release(),
        v5 = v4 + *(int *)(type metadata accessor for PhotoStyleValueLabels.Configuration(0) + 24),
        type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0),
        swift_getEnumCaseMultiPayload() == 1))
  {
    v6 = sub_20D191CA0();
    if (!__swift_getEnumTagSinglePayload(v5, 1, v6))
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  v7 = a1 + *(int *)(a2 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BB8);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v8 = sub_20D191508();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

_QWORD *sub_20D160D64(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
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
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v25;

  v3 = a3;
  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  v8 = *(int *)(a3 + 28);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v25 = v3;
    *v9 = *v10;
    *((_QWORD *)v9 + 1) = *((_QWORD *)v10 + 1);
    v11 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
    v12 = v11[6];
    v13 = &v9[v12];
    v14 = &v10[v12];
    type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
    swift_retain();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v15 = sub_20D191CA0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15))
      {
        v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
        memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
        __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
      }
    }
    else
    {
      *(_QWORD *)v13 = *(_QWORD *)v14;
      swift_retain();
    }
    v3 = v25;
    swift_storeEnumTagMultiPayload();
    *(_QWORD *)&v9[v11[7]] = *(_QWORD *)&v10[v11[7]];
    v17 = v11[8];
    v18 = &v9[v17];
    v19 = &v10[v17];
    *(_QWORD *)v18 = *(_QWORD *)v19;
    v18[8] = v19[8];
    v9[v11[9]] = v10[v11[9]];
  }
  else
  {
    *(_QWORD *)v9 = *(_QWORD *)v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v20 = *(int *)(v3 + 32);
  v21 = (_QWORD *)((char *)a1 + v20);
  v22 = (_QWORD *)((char *)a2 + v20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BB8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v23 = sub_20D191508();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v21, v22, v23);
  }
  else
  {
    *v21 = *v22;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *sub_20D160FD4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  if (a1 != a2)
  {
    v6 = *(int *)(a3 + 28);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    sub_20D14B87C((uint64_t)a1 + v6, &qword_2549A8EE0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *v7 = *v8;
      *((_QWORD *)v7 + 1) = *((_QWORD *)v8 + 1);
      v9 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
      v10 = v9[6];
      v11 = &v7[v10];
      v12 = &v8[v10];
      type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
      swift_retain();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v13 = sub_20D191CA0();
        if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13))
        {
          v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
          memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
          __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
        }
      }
      else
      {
        *(_QWORD *)v11 = *(_QWORD *)v12;
        swift_retain();
      }
      swift_storeEnumTagMultiPayload();
      *(_QWORD *)&v7[v9[7]] = *(_QWORD *)&v8[v9[7]];
      v15 = v9[8];
      v16 = &v7[v15];
      v17 = &v8[v15];
      v18 = v17[8];
      *(_QWORD *)v16 = *(_QWORD *)v17;
      v16[8] = v18;
      v7[v9[9]] = v8[v9[9]];
    }
    else
    {
      *(_QWORD *)v7 = *(_QWORD *)v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v19 = *(int *)(a3 + 32);
    v20 = (_QWORD *)((char *)a1 + v19);
    v21 = (_QWORD *)((char *)a2 + v19);
    sub_20D14B87C((uint64_t)a1 + v19, &qword_2549A8BB8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BB8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v22 = sub_20D191508();
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

uint64_t sub_20D161284(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  void *v22;
  const void *v23;
  uint64_t v24;
  uint64_t v25;
  void *__dst;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v7 = *(int *)(a3 + 28);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *(_BYTE *)v8 = *(_BYTE *)v9;
    v8[1] = v9[1];
    v11 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
    v12 = v11[6];
    v13 = (char *)v8 + v12;
    v14 = (char *)v9 + v12;
    v15 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      __dst = v13;
      v16 = sub_20D191CA0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v16))
      {
        v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
        memcpy(__dst, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(__dst, v14, v16);
        __swift_storeEnumTagSinglePayload((uint64_t)__dst, 0, 1, v16);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    *(_QWORD *)((char *)v8 + v11[7]) = *(_QWORD *)((char *)v9 + v11[7]);
    v18 = v11[8];
    v19 = (char *)v8 + v18;
    v20 = (char *)v9 + v18;
    *(_QWORD *)v19 = *(_QWORD *)v20;
    v19[8] = v20[8];
    *((_BYTE *)v8 + v11[9]) = *((_BYTE *)v9 + v11[9]);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  v21 = *(int *)(a3 + 32);
  v22 = (void *)(a1 + v21);
  v23 = (const void *)(a2 + v21);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BB8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v25 = sub_20D191508();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v22, v23, v25);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  return a1;
}

_QWORD *sub_20D1614D4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *__dst;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  if (a1 != a2)
  {
    v8 = *(int *)(a3 + 28);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    sub_20D14B87C((uint64_t)a1 + v8, &qword_2549A8EE0);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *v9 = *v10;
      *((_QWORD *)v9 + 1) = *((_QWORD *)v10 + 1);
      v12 = (int *)type metadata accessor for PhotoStyleValueLabels.Configuration(0);
      v13 = v12[6];
      v14 = &v9[v13];
      v15 = &v10[v13];
      v16 = type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        __dst = v14;
        v17 = sub_20D191CA0();
        if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v17))
        {
          v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8E08);
          memcpy(__dst, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(__dst, v15, v17);
          __swift_storeEnumTagSinglePayload((uint64_t)__dst, 0, 1, v17);
        }
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
      }
      *(_QWORD *)&v9[v12[7]] = *(_QWORD *)&v10[v12[7]];
      v19 = v12[8];
      v20 = &v9[v19];
      v21 = &v10[v19];
      *(_QWORD *)v20 = *(_QWORD *)v21;
      v20[8] = v21[8];
      v9[v12[9]] = v10[v12[9]];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
    v22 = *(int *)(a3 + 32);
    v23 = (char *)a1 + v22;
    v24 = (char *)a2 + v22;
    sub_20D14B87C((uint64_t)a1 + v22, &qword_2549A8BB8);
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BB8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v26 = sub_20D191508();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 32))(v23, v24, v26);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_20D161764()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_20D161770()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_22();
  if (v3)
  {
    OUTLINED_FUNCTION_13_2(*(_QWORD *)(v1 + 8));
    OUTLINED_FUNCTION_7_3();
  }
  else
  {
    OUTLINED_FUNCTION_65();
    if (*(_DWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE8) - 8) + 84) == v0)
    {
      v4 = *(int *)(v2 + 28);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BE0);
      v4 = *(int *)(v2 + 32);
    }
    v5 = OUTLINED_FUNCTION_51(v4);
    OUTLINED_FUNCTION_4_3(v5, v6, v7);
  }
}

uint64_t sub_20D1617E4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_20D1617F0()
{
  int v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_12_2();
  if (v4)
  {
    *(_QWORD *)(v1 + 8) = (v0 - 1);
    OUTLINED_FUNCTION_7_3();
  }
  else
  {
    v5 = v3;
    if (*(_DWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE8) - 8) + 84) == v2)
    {
      v6 = *(int *)(v5 + 28);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BE0);
      v6 = *(int *)(v5 + 32);
    }
    v7 = OUTLINED_FUNCTION_25(v6);
    OUTLINED_FUNCTION_5_2(v7, v8, v9, v10);
  }
}

uint64_t type metadata accessor for PhotoStyleValueLabels.ValueLabel(uint64_t a1)
{
  return sub_20D14DB04(a1, qword_2549A9580);
}

void sub_20D16187C()
{
  unint64_t v0;
  unint64_t v1;

  sub_20D15DF7C(319, qword_2549A8F58, type metadata accessor for PhotoStyleValueLabels.Configuration, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560]);
  if (v0 <= 0x3F)
  {
    sub_20D15DF7C(319, (unint64_t *)&qword_2549A8C50, (uint64_t (*)(uint64_t))MEMORY[0x24BDED130], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t sub_20D161954()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D161964()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D161974()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_20D161988()
{
  unint64_t result;

  result = qword_2549A95C8;
  if (!qword_2549A95C8)
  {
    result = MEMORY[0x212B9F008](&unk_20D196698, &type metadata for PhotoStyleValueLabels.Configuration.SizeFamily);
    atomic_store(result, (unint64_t *)&qword_2549A95C8);
  }
  return result;
}

uint64_t sub_20D1619C4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D1619F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D161A2C@<X0>(char *a1@<X8>)
{
  uint64_t *v1;

  return sub_20D156C48(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_20D161A38@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_20D1571D4(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_20D161A44(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_20D161A6C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_20D161A94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_20D157CF0(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

void sub_20D161AA0()
{
  sub_20D156530();
  OUTLINED_FUNCTION_1();
}

unint64_t sub_20D161AC0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_2549A95F8;
  if (!qword_2549A95F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A95E8);
    sub_20D150DBC(&qword_2549A9600, (void (*)(uint64_t))type metadata accessor for PhotoStyleValueLabels);
    v3 = v2;
    sub_20D150EAC(&qword_2549A9608, &qword_2549A95F0);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2549A95F8);
  }
  return result;
}

unint64_t sub_20D161B5C()
{
  unint64_t result;

  result = qword_2549A9610;
  if (!qword_2549A9610)
  {
    result = MEMORY[0x212B9F008](&unk_20D196A68, &type metadata for PhotoStyleValueLabelsConfigurationKey);
    atomic_store(result, (unint64_t *)&qword_2549A9610);
  }
  return result;
}

void sub_20D161B9C()
{
  type metadata accessor for PhotoStyleValueLabels.ResetButton(0);
  OUTLINED_FUNCTION_50();
  sub_20D155D7C();
  OUTLINED_FUNCTION_1();
}

void sub_20D161BC4(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_20D155ED4(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_20D161BD0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2549A9668;
  if (!qword_2549A9668)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A9660);
    v2 = sub_20D161C74(&qword_2549A9670, &qword_2549A9678, (void (*)(void))sub_20D161CD8);
    sub_20D150EAC(&qword_2549A85A8, &qword_2549A85B0);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2549A9668);
  }
  return result;
}

uint64_t sub_20D161C74(uint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    OUTLINED_FUNCTION_16();
  }
  return result;
}

unint64_t sub_20D161CD8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2549A9680;
  if (!qword_2549A9680)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A9688);
    v2 = sub_20D161C74(&qword_2549A9690, &qword_2549A9698, (void (*)(void))sub_20D161D7C);
    sub_20D150DBC(&qword_2549A96D0, (void (*)(uint64_t))MEMORY[0x24BDF1220]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2549A9680);
  }
  return result;
}

unint64_t sub_20D161D7C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2549A96A0;
  if (!qword_2549A96A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A96A8);
    v2 = sub_20D161E00();
    sub_20D150EAC(&qword_2549A96C0, &qword_2549A96C8);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2549A96A0);
  }
  return result;
}

unint64_t sub_20D161E00()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2549A96B0;
  if (!qword_2549A96B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A96B8);
    sub_20D150EAC(&qword_2549A8E90, &qword_2549A8E98);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2549A96B0);
  }
  return result;
}

unint64_t sub_20D161E84()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2549A96D8;
  if (!qword_2549A96D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A9640);
    sub_20D150EAC(&qword_2549A96E0, &qword_2549A9638);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDEC438];
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2549A96D8);
  }
  return result;
}

uint64_t sub_20D161F08@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_20D191694();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_20D161F38()
{
  return sub_20D1916A0();
}

void sub_20D161F64()
{
  uint64_t v0;

  v0 = sub_20D19167C();
  OUTLINED_FUNCTION_39(v0);
  OUTLINED_FUNCTION_1();
}

void sub_20D161F88()
{
  sub_20D191688();
  OUTLINED_FUNCTION_1();
}

uint64_t sub_20D161FA8()
{
  return swift_deallocObject();
}

_BYTE *sub_20D161FB8(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

unint64_t sub_20D161FD0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  unint64_t v5;
  uint64_t v6;
  uint64_t OpaqueTypeConformance2;
  uint64_t v8;
  _QWORD v9[6];

  result = qword_2549A96F8;
  if (!qword_2549A96F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A9650);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A9640);
    v3 = sub_20D1915BC();
    v4 = (void (*)(uint64_t))MEMORY[0x24BDED868];
    v5 = sub_20D161E84();
    sub_20D150DBC(&qword_2549A96E8, v4);
    v9[2] = v2;
    v9[3] = v3;
    v9[4] = v5;
    v9[5] = v6;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_20D150EAC(&qword_2549A9700, &qword_2549A9708);
    v9[0] = OpaqueTypeConformance2;
    v9[1] = v8;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v9);
    atomic_store(result, (unint64_t *)&qword_2549A96F8);
  }
  return result;
}

unint64_t sub_20D1620C0()
{
  unint64_t result;

  result = qword_2549A9710;
  if (!qword_2549A9710)
  {
    result = MEMORY[0x212B9F008](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2549A9710);
  }
  return result;
}

uint64_t sub_20D1620FC()
{
  uint64_t v0;

  return sub_20D156398(*(_QWORD *)(v0 + 16));
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for PhotoStyleValueLabels.ResetButton(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  swift_release();
  swift_release();
  v3 = v0 + ((v2 + 16) & ~v2) + *(int *)(v1 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8EE0);
  if (OUTLINED_FUNCTION_67() == 1
    && (swift_release(),
        v4 = v3 + *(int *)(OUTLINED_FUNCTION_26() + 24),
        type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0),
        OUTLINED_FUNCTION_67() == 1))
  {
    v5 = OUTLINED_FUNCTION_36();
    if (!__swift_getEnumTagSinglePayload(v4, 1, v5))
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BB8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = OUTLINED_FUNCTION_52();
    OUTLINED_FUNCTION_10(v6);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_20D162248()
{
  type metadata accessor for PhotoStyleValueLabels.ResetButton(0);
  OUTLINED_FUNCTION_50();
  return sub_20D1564E0();
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

uint64_t sub_20D162288(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_20D1622CC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_2549A9760;
  if (!qword_2549A9760)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A9740);
    sub_20D150EAC(&qword_2549A9768, &qword_2549A9738);
    v3 = v2;
    sub_20D150EAC(&qword_2549A9770, &qword_2549A9778);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2549A9760);
  }
  return result;
}

uint64_t sub_20D162368(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if ((a6 & 1) == 0)
    return swift_retain();
  sub_20D162398(a1, a2, a3 & 1);
  return swift_bridgeObjectRetain();
}

uint64_t sub_20D162398(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_20D1623A8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if ((a6 & 1) == 0)
    return swift_release();
  sub_20D1623D8(a1, a2, a3 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_20D1623D8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_20D1623E8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v11;
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 88);
  v3 = *(_QWORD *)(a1 + 96);
  v4 = *(_QWORD *)(a1 + 104);
  v5 = *(_QWORD *)(a1 + 112);
  v6 = *(_QWORD *)(a1 + 120);
  v7 = *(_QWORD *)(a1 + 128);
  v8 = *(_BYTE *)(a1 + 136);
  v9 = *(_QWORD *)(a1 + 144);
  v11 = *(_BYTE *)(a1 + 160);
  v12 = *(_QWORD *)(a1 + 152);
  sub_20D1623D8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRelease();
  sub_20D1624B8(v2, v3, v4, v5, v6, v7, v8);
  sub_20D1623D8(v9, v12, v11);
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

uint64_t sub_20D1624B8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t result;

  sub_20D1623D8(a1, a2, a3 & 1);
  result = swift_bridgeObjectRelease();
  if ((a7 & 1) != 0)
    return swift_release();
  return result;
}

void sub_20D16250C()
{
  sub_20D19161C();
  OUTLINED_FUNCTION_1();
}

uint64_t sub_20D16252C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  sub_20D162398(a1, a2, a3 & 1);
  if ((a7 & 1) != 0)
    swift_retain();
  return swift_bridgeObjectRetain();
}

unint64_t sub_20D162570()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2549A97D8;
  if (!qword_2549A97D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A97D0);
    sub_20D150EAC(&qword_2549A97E0, &qword_2549A97E8);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2549A97D8);
  }
  return result;
}

uint64_t sub_20D1625F4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BDF1EB8] - 8) + 32))(a2, a1);
  return a2;
}

uint64_t sub_20D162630(uint64_t a1)
{
  sub_20D162398(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  return a1;
}

uint64_t sub_20D162660(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_20D162688(uint64_t a1)
{
  swift_retain();
  return a1;
}

unint64_t sub_20D1626B0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549A9808;
  if (!qword_2549A9808)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A9810);
    v2[0] = MEMORY[0x24BDF40E8];
    v2[1] = MEMORY[0x24BDEEC40];
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549A9808);
  }
  return result;
}

uint64_t sub_20D162714()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
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

uint64_t sub_20D162750()
{
  swift_release();
  return swift_deallocObject();
}

void sub_20D162774(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_38(a1, a2, a3);
  OUTLINED_FUNCTION_20_0(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_1();
}

void sub_20D1627A0(uint64_t a1@<X8>)
{
  sub_20D159DB4(a1);
  OUTLINED_FUNCTION_1();
}

void sub_20D1627BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_20D15A9C0(a1, a2, a3, a4, sub_20D159F10);
}

uint64_t sub_20D1627D8()
{
  uint64_t v0;

  return sub_20D15AA1C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_20D1627F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PhotoStyleValueLabels.Configuration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

void sub_20D16283C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_8_0();
  v0 = sub_20D159818();
  OUTLINED_FUNCTION_39(v0);
  OUTLINED_FUNCTION_1();
}

void sub_20D16285C(unsigned __int8 *a1)
{
  OUTLINED_FUNCTION_53(a1);
  sub_20D1595CC();
  OUTLINED_FUNCTION_1();
}

void sub_20D162888()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 43) = *(_BYTE *)(v0 + 24);
}

void sub_20D162898()
{
  uint64_t v0;

  OUTLINED_FUNCTION_8_0();
  v0 = sub_20D159694();
  OUTLINED_FUNCTION_39(v0);
  OUTLINED_FUNCTION_1();
}

void sub_20D1628B8(unsigned __int8 *a1)
{
  OUTLINED_FUNCTION_53(a1);
  sub_20D1595CC();
  OUTLINED_FUNCTION_1();
}

void sub_20D1628E4()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 42) = *(_BYTE *)(v0 + 24);
}

void sub_20D1628F4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_8_0();
  v0 = sub_20D159548();
  OUTLINED_FUNCTION_39(v0);
  OUTLINED_FUNCTION_1();
}

void sub_20D162914(unsigned __int8 *a1)
{
  OUTLINED_FUNCTION_53(a1);
  sub_20D1595CC();
  OUTLINED_FUNCTION_1();
}

void sub_20D162940()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 41) = *(_BYTE *)(v0 + 24);
}

void sub_20D162950()
{
  uint64_t v0;

  OUTLINED_FUNCTION_8_0();
  v0 = sub_20D15943C();
  OUTLINED_FUNCTION_39(v0);
  OUTLINED_FUNCTION_1();
}

void sub_20D162970(unsigned __int8 *a1)
{
  OUTLINED_FUNCTION_53(a1);
  sub_20D1595CC();
  OUTLINED_FUNCTION_1();
}

void sub_20D16299C()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 40) = *(_BYTE *)(v0 + 24);
}

void sub_20D1629AC()
{
  double *v0;

  OUTLINED_FUNCTION_8_0();
  *v0 = sub_20D1592CC();
  OUTLINED_FUNCTION_1();
}

void sub_20D1629CC()
{
  sub_20D159168();
  OUTLINED_FUNCTION_1();
}

double sub_20D1629FC()
{
  uint64_t v0;
  double result;

  result = *(double *)(v0 + 24);
  *(double *)(*(_QWORD *)(v0 + 16) + 32) = result;
  return result;
}

void sub_20D162A0C()
{
  double *v0;

  OUTLINED_FUNCTION_8_0();
  *v0 = sub_20D1590E4();
  OUTLINED_FUNCTION_1();
}

void sub_20D162A2C()
{
  sub_20D159168();
  OUTLINED_FUNCTION_1();
}

double sub_20D162A5C()
{
  uint64_t v0;
  double result;

  result = *(double *)(v0 + 24);
  *(double *)(*(_QWORD *)(v0 + 16) + 24) = result;
  return result;
}

void sub_20D162A6C()
{
  double *v0;

  OUTLINED_FUNCTION_8_0();
  *v0 = sub_20D158FCC();
  OUTLINED_FUNCTION_1();
}

void sub_20D162A8C()
{
  sub_20D159168();
  OUTLINED_FUNCTION_1();
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

void sub_20D162AFC(_QWORD *a1@<X8>)
{
  uint64_t v2;

  sub_20D19164C();
  *a1 = v2;
  OUTLINED_FUNCTION_1();
}

void sub_20D162B20()
{
  sub_20D191658();
  OUTLINED_FUNCTION_1();
}

void sub_20D162B40(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_13(a1, a2, a3);
  OUTLINED_FUNCTION_20_0(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_1();
}

void sub_20D162B6C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_13(a1, a2, a3);
  OUTLINED_FUNCTION_20_0(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_1();
}

ValueMetadata *type metadata accessor for PhotoStyleValueLabelsConfigurationKey()
{
  return &type metadata for PhotoStyleValueLabelsConfigurationKey;
}

ValueMetadata *type metadata accessor for PhotoStyleValueLabels.NumberSpaceMaintainer()
{
  return &type metadata for PhotoStyleValueLabels.NumberSpaceMaintainer;
}

void sub_20D162BB8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for BackgroundPlatter(255, *a1, a1[1], a4);
  OUTLINED_FUNCTION_43();
}

void sub_20D162BF8()
{
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_60();
  sub_20D191388();
  type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(255);
  OUTLINED_FUNCTION_42();
}

void sub_20D162C48()
{
  void (*v0)(uint64_t);

  sub_20D150DBC(&qword_2549A95D0, v0);
  OUTLINED_FUNCTION_60();
  sub_20D191BB0();
  OUTLINED_FUNCTION_42();
}

void sub_20D162C84()
{
  OUTLINED_FUNCTION_54();
  sub_20D1917A8();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_60();
  sub_20D1917F0();
  OUTLINED_FUNCTION_60();
  sub_20D191598();
  sub_20D1917CC();
  sub_20D191EBC();
  OUTLINED_FUNCTION_47();
}

void sub_20D162D28()
{
  OUTLINED_FUNCTION_16();
}

void sub_20D162D38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  uint64_t v17;

  a16 = a1;
  a14 = MEMORY[0x212B9F008](MEMORY[0x24BDEF3E0], v16, &a15);
  MEMORY[0x212B9F008](MEMORY[0x24BDF5578], v17, &a14);
  OUTLINED_FUNCTION_54();
  sub_20D1915F8();
  sub_20D19152C();
  OUTLINED_FUNCTION_43();
}

void sub_20D162D98()
{
  OUTLINED_FUNCTION_61();
}

void sub_20D162DA8()
{
  OUTLINED_FUNCTION_42();
}

void sub_20D162DC0()
{
  OUTLINED_FUNCTION_16();
}

void sub_20D162DD0()
{
  OUTLINED_FUNCTION_47();
}

void sub_20D162DFC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for BrightnessMultiply(255, *a1, a1[1], a4);
  OUTLINED_FUNCTION_43();
}

void sub_20D162E38()
{
  OUTLINED_FUNCTION_40();
  sub_20D191388();
  sub_20D19152C();
  sub_20D1915E0();
  OUTLINED_FUNCTION_54();
  sub_20D19152C();
  sub_20D19152C();
  sub_20D191EBC();
  OUTLINED_FUNCTION_42();
}

void sub_20D162ECC()
{
  OUTLINED_FUNCTION_61();
}

void sub_20D162EEC()
{
  OUTLINED_FUNCTION_16();
}

void sub_20D162F04()
{
  OUTLINED_FUNCTION_47();
}

void sub_20D162F1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;

  a12 = a1;
  MEMORY[0x212B9F008](MEMORY[0x24BDF5578], v12, &a12);
  OUTLINED_FUNCTION_54();
  sub_20D1915F8();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_43();
}

void sub_20D162F54()
{
  OUTLINED_FUNCTION_61();
}

void sub_20D162F64()
{
  OUTLINED_FUNCTION_16();
}

uint64_t sub_20D162F8C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A95E8);
  sub_20D161AC0();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_20D162FDC()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2549A9890;
  if (!qword_2549A9890)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A9628);
    v2 = sub_20D163060();
    sub_20D150EAC(&qword_2549A98B8, &qword_2549A9630);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2549A9890);
  }
  return result;
}

unint64_t sub_20D163060()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549A9898;
  if (!qword_2549A9898)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A9620);
    v2[0] = sub_20D1630CC();
    v2[1] = sub_20D163170();
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549A9898);
  }
  return result;
}

unint64_t sub_20D1630CC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2549A98A0;
  if (!qword_2549A98A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A9618);
    v2 = sub_20D161C74(&qword_2549A96F0, &qword_2549A9658, (void (*)(void))sub_20D161FD0);
    sub_20D150DBC(&qword_2549A98A8, MEMORY[0x24BDF1088]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2549A98A0);
  }
  return result;
}

unint64_t sub_20D163170()
{
  unint64_t result;

  result = qword_2549A98B0;
  if (!qword_2549A98B0)
  {
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED590], MEMORY[0x24BDED5B8]);
    atomic_store(result, (unint64_t *)&qword_2549A98B0);
  }
  return result;
}

unint64_t sub_20D1631B0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  _QWORD v4[4];

  result = qword_2549A98C0;
  if (!qword_2549A98C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A9750);
    v4[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A9740);
    v4[3] = sub_20D1622CC();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_20D150DBC(&qword_2549A98A8, MEMORY[0x24BDF1088]);
    v4[0] = OpaqueTypeConformance2;
    v4[1] = v3;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2549A98C0);
  }
  return result;
}

uint64_t sub_20D16325C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D16326C()
{
  return MEMORY[0x24BDF1F80];
}

uint64_t OUTLINED_FUNCTION_4_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_5_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

void OUTLINED_FUNCTION_8_2()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  int *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;

  v5 = byte_2549A8DD0;
  *(_BYTE *)v0 = 0;
  *(_QWORD *)(v0 + 8) = v4;
  *(_QWORD *)(v0 + v3[7]) = 0x4028000000000000;
  v6 = v0 + v3[8];
  *(_QWORD *)v6 = v2;
  *(_BYTE *)(v6 + 8) = v1 & 1;
  *(_BYTE *)(v0 + v3[9]) = v5;
}

uint64_t OUTLINED_FUNCTION_13_2@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF)
    LODWORD(a1) = -1;
  return (a1 + 1);
}

uint64_t OUTLINED_FUNCTION_19_1()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_20_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return type metadata accessor for PhotoStyleValueLabels.Configuration(0);
}

uint64_t OUTLINED_FUNCTION_23(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t OUTLINED_FUNCTION_25@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return v1 + a1;
}

uint64_t OUTLINED_FUNCTION_26()
{
  return type metadata accessor for PhotoStyleValueLabels.Configuration(0);
}

uint64_t OUTLINED_FUNCTION_27()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return type metadata accessor for PhotoStyleValueLabels.Configuration.BackgroundStyle(0);
}

uint64_t OUTLINED_FUNCTION_31()
{
  return sub_20D19152C();
}

uint64_t OUTLINED_FUNCTION_32()
{
  return sub_20D1914B4();
}

uint64_t OUTLINED_FUNCTION_33()
{
  return sub_20D15A868();
}

uint64_t OUTLINED_FUNCTION_36()
{
  return sub_20D191CA0();
}

uint64_t OUTLINED_FUNCTION_38(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

uint64_t OUTLINED_FUNCTION_39(uint64_t result)
{
  _BYTE *v1;

  *v1 = result & 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_40()
{
  return sub_20D1917FC();
}

void OUTLINED_FUNCTION_42()
{
  JUMPOUT(0x212B9F008);
}

void OUTLINED_FUNCTION_43()
{
  JUMPOUT(0x212B9F008);
}

uint64_t OUTLINED_FUNCTION_45()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

void OUTLINED_FUNCTION_47()
{
  JUMPOUT(0x212B9F008);
}

void OUTLINED_FUNCTION_48(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_20D14A8AC(a1, v1);
}

void OUTLINED_FUNCTION_49(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_20D15C0AC(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_51@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return v1 + a1;
}

uint64_t OUTLINED_FUNCTION_52()
{
  return sub_20D191508();
}

uint64_t OUTLINED_FUNCTION_53(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t OUTLINED_FUNCTION_54()
{
  return 255;
}

void OUTLINED_FUNCTION_55()
{
  JUMPOUT(0x212B9F080);
}

void OUTLINED_FUNCTION_56(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_20D14A8AC(a1, v1);
}

uint64_t OUTLINED_FUNCTION_57()
{
  return swift_getEnumCaseMultiPayload();
}

void OUTLINED_FUNCTION_58(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_20D14A8AC(v2, a2);
}

uint64_t OUTLINED_FUNCTION_59()
{
  return sub_20D191F58();
}

uint64_t OUTLINED_FUNCTION_60()
{
  return 255;
}

void OUTLINED_FUNCTION_61()
{
  JUMPOUT(0x212B9F008);
}

void OUTLINED_FUNCTION_62(uint64_t a1)
{
  uint64_t *v1;

  sub_20D14B87C(a1, v1);
}

void OUTLINED_FUNCTION_63(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_20D15C0AC(a1, a2, v2);
}

void OUTLINED_FUNCTION_64(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_20D162B6C(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_67()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_20D1635CC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_20D1635F8()
{
  return sub_20D191F64();
}

uint64_t sub_20D16361C()
{
  sub_20D191F58();
  sub_20D191F64();
  return sub_20D191F70();
}

uint64_t sub_20D163660()
{
  return sub_20D16361C();
}

uint64_t sub_20D163668()
{
  return sub_20D1635F8();
}

unint64_t static PEAlchemistSupport.kAlchemistIdentifier.getter()
{
  return 0xD00000000000001ALL;
}

id sub_20D16369C()
{
  id v0;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE3598]), sel_init);
  objc_msgSend(v0, sel_setDeliveryMode_, 1);
  objc_msgSend(v0, sel_setVersion_, 0);
  objc_msgSend(v0, sel_setNetworkAccessAllowed_, 1);
  objc_msgSend(v0, sel_setResizeMode_, 0);
  objc_msgSend(v0, sel_setDownloadPriority_, 0);
  objc_msgSend(v0, sel_setDownloadIntent_, 3);
  objc_msgSend(v0, sel_setProgressHandler_, 0);
  return v0;
}

uint64_t sub_20D16375C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return swift_task_switch();
}

uint64_t sub_20D163774()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = v0[4];
  v1 = v0[5];
  v3 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v0[6] = v3;
  v4 = (_QWORD *)swift_task_alloc();
  v0[7] = v4;
  v4[2] = v3;
  v4[3] = v2;
  v4[4] = v1;
  v5 = (_QWORD *)swift_task_alloc();
  v0[8] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9908);
  *v5 = v0;
  v5[1] = sub_20D163854;
  OUTLINED_FUNCTION_1_2();
  return sub_20D191F10();
}

uint64_t sub_20D163854()
{
  OUTLINED_FUNCTION_2_4();
  swift_task_dealloc();
  OUTLINED_FUNCTION_1_2();
  return OUTLINED_FUNCTION_0_3();
}

uint64_t sub_20D163898()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_20D1638CC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD aBlock[6];

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9910);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  v11 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v12 + v11, (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  aBlock[4] = sub_20D164DA8;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_20D163A58;
  aBlock[3] = &block_descriptor_26;
  v13 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_requestImageDataAndOrientationForAsset_options_resultHandler_, a3, a4, v13);
  _Block_release(v13);
}

uint64_t sub_20D163A14(uint64_t a1, unint64_t a2)
{
  sub_20D164E1C(a1, a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9910);
  return sub_20D191E80();
}

uint64_t sub_20D163A58(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v8;
  void (*v9)(void *, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  id v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v8 = a2;
  v9 = *(void (**)(void *, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    swift_retain();
    v10 = v8;
    v8 = (void *)sub_20D191298();
    v12 = v11;

    if (a3)
      goto LABEL_3;
LABEL_7:
    v13 = 0;
    if (!a5)
      goto LABEL_5;
    goto LABEL_4;
  }
  swift_retain();
  v12 = 0xF000000000000000;
  if (!a3)
    goto LABEL_7;
LABEL_3:
  v13 = sub_20D191E38();
  a3 = v14;
  if (a5)
LABEL_4:
    a5 = sub_20D191E08();
LABEL_5:
  v9(v8, v12, v13, a3, a4, a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_20D1649E8((uint64_t)v8, v12);
  return swift_release();
}

uint64_t sub_20D163B58(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return swift_task_switch();
}

uint64_t sub_20D163B70()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 24);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v2;
  sub_20D164CA8();
  *v2 = v0;
  v2[1] = sub_20D163C18;
  OUTLINED_FUNCTION_1_2();
  return sub_20D191F10();
}

uint64_t sub_20D163C18()
{
  OUTLINED_FUNCTION_2_4();
  swift_task_dealloc();
  OUTLINED_FUNCTION_1_2();
  return OUTLINED_FUNCTION_0_3();
}

uint64_t sub_20D163C5C()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

void sub_20D163C64(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9900);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v9 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = sub_20D164CF0;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_20D163DE0;
  aBlock[3] = &block_descriptor_19;
  v11 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_requestContentEditingInputWithOptions_completionHandler_, a3, v11);
  _Block_release(v11);
}

uint64_t sub_20D163D9C(void *a1)
{
  id v1;

  v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9900);
  return sub_20D191E80();
}

void sub_20D163DE0(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  sub_20D191E08();
  swift_retain();
  v4 = a2;
  v3();
  swift_release();
  swift_bridgeObjectRelease();

}

void sub_20D163E68(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  void *v16;
  void (*v17)(char *, uint64_t);
  id v18;
  id v19;
  const __CFData *v20;
  CGImageSourceRef v21;
  const __CFURL *v22;
  __CFString *v23;
  CGImageDestination *v24;
  char *v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  id v29;
  unsigned __int8 v30;
  id v31;
  void *v32;
  _BYTE *v33;
  char *v34;
  char v35;
  _BYTE *v36;
  void *v37;
  uint64_t v38;
  size_t PrimaryImageIndex;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  id aBlock[7];

  v40 = a1;
  v41 = a6;
  aBlock[6] = *(id *)MEMORY[0x24BDAC8D0];
  v8 = sub_20D191340();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_20D191280();
  v42 = *(_QWORD *)(v12 - 8);
  v43 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE3530]), sel_initWithContentEditingInput_, a4);
  objc_msgSend(v15, sel_setAdjustmentData_, a5);
  sub_20D191334();
  v16 = (void *)sub_20D191328();
  v17 = *(void (**)(char *, uint64_t))(v9 + 8);
  v17(v11, v8);
  aBlock[0] = 0;
  v18 = objc_msgSend(v15, sel_renderedContentURLForType_error_, v16, aBlock);

  v19 = aBlock[0];
  if (!v18)
  {
    v32 = v19;
    sub_20D19125C();

    swift_willThrow();
    return;
  }
  sub_20D191274();

  v20 = (const __CFData *)sub_20D19128C();
  v21 = CGImageSourceCreateWithData(v20, 0);

  if (!v21)
  {
    sub_20D164944();
    swift_allocError();
    *v33 = 1;
    swift_willThrow();

LABEL_13:
    (*(void (**)(char *, uint64_t))(v42 + 8))(v14, v43);
    return;
  }
  if (CGImageSourceGetCount(v21) != 3)
  {
    sub_20D164944();
    swift_allocError();
    v35 = 2;
LABEL_12:
    *v34 = v35;
    swift_willThrow();

    goto LABEL_13;
  }
  PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(v21);
  v22 = (const __CFURL *)sub_20D191268();
  sub_20D191334();
  sub_20D19131C();
  v17(v11, v8);
  v23 = (__CFString *)sub_20D191E14();
  swift_bridgeObjectRelease();
  v24 = CGImageDestinationCreateWithURL(v22, v23, 1uLL, 0);

  if (!v24)
  {
    sub_20D164944();
    swift_allocError();
    v35 = 3;
    goto LABEL_12;
  }
  v25 = v14;
  CGImageDestinationAddImageFromSource(v24, v21, PrimaryImageIndex, 0);
  if (CGImageDestinationFinalize(v24))
  {
    v26 = (_QWORD *)swift_allocObject();
    v27 = v40;
    v26[2] = v40;
    v26[3] = v15;
    aBlock[4] = sub_20D164C98;
    aBlock[5] = v26;
    aBlock[0] = (id)MEMORY[0x24BDAC760];
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_20D1635CC;
    aBlock[3] = &block_descriptor_12;
    v28 = _Block_copy(aBlock);
    v29 = v27;
    v15 = v15;
    swift_release();
    aBlock[0] = 0;
    v30 = objc_msgSend(v41, sel_performChangesAndWait_error_, v28, aBlock);
    _Block_release(v28);
    v31 = aBlock[0];
    if ((v30 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t))(v42 + 8))(v25, v43);

      return;
    }
    v37 = v31;
    sub_20D19125C();

  }
  else
  {
    sub_20D164944();
    swift_allocError();
    *v36 = 4;
  }
  swift_willThrow();

  (*(void (**)(char *, uint64_t))(v42 + 8))(v25, v43);
}

void sub_20D1642CC(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = objc_msgSend((id)objc_opt_self(), sel_changeRequestForAsset_, a1);
  objc_msgSend(v3, sel_setContentEditingOutput_, a2);

}

uint64_t static PEAlchemistSupport.revertToMono(asset:photoLibrary:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 120) = a1;
  *(_QWORD *)(v2 + 128) = a2;
  OUTLINED_FUNCTION_1_2();
  return OUTLINED_FUNCTION_0_3();
}

uint64_t sub_20D164388()
{
  uint64_t *v0;
  id v1;
  _QWORD *v2;

  v1 = sub_20D16369C();
  v0[17] = (uint64_t)v1;
  v2 = (_QWORD *)swift_task_alloc();
  v0[18] = (uint64_t)v2;
  *v2 = v0;
  v2[1] = sub_20D164410;
  return sub_20D16375C(v0[15], (uint64_t)v1);
}

uint64_t sub_20D164410()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_5_3();
  v1 = (void *)v0[17];
  v0[19] = v2;
  v0[20] = v3;
  swift_task_dealloc();

  OUTLINED_FUNCTION_1_2();
  return OUTLINED_FUNCTION_0_3();
}

uint64_t sub_20D164484()
{
  uint64_t v0;
  _BYTE *v1;
  id v3;
  void *v4;
  _QWORD *v5;

  if (*(_QWORD *)(v0 + 160) >> 60 == 15)
  {
    sub_20D164944();
    OUTLINED_FUNCTION_4_4();
    *v1 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE3528]), sel_init);
    *(_QWORD *)(v0 + 168) = v3;
    *(_QWORD *)(v0 + 48) = sub_20D1528BC;
    *(_QWORD *)(v0 + 56) = 0;
    *(_QWORD *)(v0 + 16) = MEMORY[0x24BDAC760];
    *(_QWORD *)(v0 + 24) = 1107296256;
    *(_QWORD *)(v0 + 32) = sub_20D164980;
    *(_QWORD *)(v0 + 40) = &block_descriptor_2;
    v4 = _Block_copy((const void *)(v0 + 16));
    objc_msgSend(v3, sel_setCanHandleAdjustmentData_, v4);
    _Block_release(v4);
    objc_msgSend(v3, sel_setNetworkAccessAllowed_, 1);
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 176) = v5;
    *v5 = v0;
    v5[1] = sub_20D164600;
    return sub_20D163B58(*(_QWORD *)(v0 + 120), (uint64_t)v3);
  }
}

uint64_t sub_20D164600()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_5_3();
  *(_QWORD *)(v1 + 184) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_1_2();
  return OUTLINED_FUNCTION_0_3();
}

uint64_t sub_20D164670()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t (*v26)(void);
  void *v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;

  v1 = objc_msgSend(*(id *)(v0 + 184), sel_adjustmentData);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v1, sel_formatIdentifier);
    v4 = sub_20D191E38();
    v6 = v5;

    if (v4 == 0xD00000000000001ALL && v6 == 0x800000020D1A1400)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v14 = sub_20D191F1C();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0)
      {
        sub_20D163E68(*(void **)(v0 + 120), *(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 184), (uint64_t)v2, *(void **)(v0 + 128));
        goto LABEL_11;
      }
    }
    v16 = *(void **)(v0 + 120);
    v15 = *(void **)(v0 + 128);
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = v16;
    *(_QWORD *)(v0 + 96) = sub_20D164AC0;
    *(_QWORD *)(v0 + 104) = v17;
    *(_QWORD *)(v0 + 64) = MEMORY[0x24BDAC760];
    *(_QWORD *)(v0 + 72) = 1107296256;
    *(_QWORD *)(v0 + 80) = sub_20D1635CC;
    *(_QWORD *)(v0 + 88) = &block_descriptor_6;
    v18 = _Block_copy((const void *)(v0 + 64));
    v19 = v16;
    swift_release();
    *(_QWORD *)(v0 + 112) = 0;
    LOBYTE(v15) = objc_msgSend(v15, sel_performChangesAndWait_error_, v18, v0 + 112);
    _Block_release(v18);
    v20 = *(id *)(v0 + 112);
    if ((v15 & 1) == 0)
    {
      v21 = v20;
      v22 = *(void **)(v0 + 184);
      v23 = *(_QWORD *)(v0 + 160);
      v24 = *(void **)(v0 + 168);
      v25 = *(_QWORD *)(v0 + 152);
      sub_20D19125C();

      swift_willThrow();
      v12 = v25;
      v13 = v23;
      goto LABEL_10;
    }
LABEL_11:
    v27 = *(void **)(v0 + 184);
    v28 = *(_QWORD *)(v0 + 160);
    v29 = *(void **)(v0 + 168);
    v30 = *(_QWORD *)(v0 + 152);

    sub_20D1649E8(v30, v28);
    v26 = *(uint64_t (**)(void))(v0 + 8);
    return v26();
  }
  v7 = *(void **)(v0 + 184);
  v8 = *(_QWORD *)(v0 + 160);
  v9 = *(void **)(v0 + 168);
  v10 = *(_QWORD *)(v0 + 152);
  sub_20D164944();
  OUTLINED_FUNCTION_4_4();
  *v11 = 5;
  swift_willThrow();

  v12 = v10;
  v13 = v8;
LABEL_10:
  sub_20D1649E8(v12, v13);
  v26 = *(uint64_t (**)(void))(v0 + 8);
  return v26();
}

unint64_t sub_20D164944()
{
  unint64_t result;

  result = qword_2549A98E0;
  if (!qword_2549A98E0)
  {
    result = MEMORY[0x212B9F008](&unk_20D196B34, &type metadata for PEAlchemistSupport.Error);
    atomic_store(result, &qword_2549A98E0);
  }
  return result;
}

uint64_t sub_20D164980(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);
  id v4;

  v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
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

uint64_t sub_20D1649E8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_20D1649FC(a1, a2);
  return a1;
}

uint64_t sub_20D1649FC(uint64_t a1, unint64_t a2)
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

void sub_20D164A40(uint64_t a1)
{
  id v1;

  v1 = objc_msgSend((id)objc_opt_self(), sel_changeRequestForAsset_, a1);
  objc_msgSend(v1, sel_revertAssetContentToOriginal);

}

uint64_t sub_20D164A9C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_20D164AC0()
{
  uint64_t v0;

  sub_20D164A40(*(_QWORD *)(v0 + 16));
}

ValueMetadata *type metadata accessor for PEAlchemistSupport()
{
  return &type metadata for PEAlchemistSupport;
}

uint64_t getEnumTagSinglePayload for PEAlchemistSupport.Error(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PEAlchemistSupport.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20D164BAC + 4 * byte_20D196AA5[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_20D164BE0 + 4 * byte_20D196AA0[v4]))();
}

uint64_t sub_20D164BE0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D164BE8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20D164BF0);
  return result;
}

uint64_t sub_20D164BFC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20D164C04);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_20D164C08(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D164C10(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PEAlchemistSupport.Error()
{
  return &type metadata for PEAlchemistSupport.Error;
}

unint64_t sub_20D164C30()
{
  unint64_t result;

  result = qword_2549A98F0;
  if (!qword_2549A98F0)
  {
    result = MEMORY[0x212B9F008](&unk_20D196B0C, &type metadata for PEAlchemistSupport.Error);
    atomic_store(result, (unint64_t *)&qword_2549A98F0);
  }
  return result;
}

uint64_t sub_20D164C6C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_20D164C98()
{
  uint64_t v0;

  sub_20D1642CC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_20D164CA0(uint64_t a1)
{
  uint64_t v1;

  sub_20D163C64(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

unint64_t sub_20D164CA8()
{
  unint64_t result;

  result = qword_2549A98F8;
  if (!qword_2549A98F8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2549A98F8);
  }
  return result;
}

uint64_t sub_20D164CE4()
{
  return objectdestroy_15Tm(&qword_2549A9900);
}

uint64_t sub_20D164CF0(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9900);
  OUTLINED_FUNCTION_50();
  return sub_20D163D9C(a1);
}

void sub_20D164D34(uint64_t a1)
{
  uint64_t v1;

  sub_20D1638CC(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_20D164D40()
{
  return objectdestroy_15Tm(&qword_2549A9910);
}

uint64_t objectdestroy_15Tm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  return swift_deallocObject();
}

uint64_t sub_20D164DA8(uint64_t a1, unint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9910);
  OUTLINED_FUNCTION_50();
  return sub_20D163A14(a1, a2);
}

uint64_t sub_20D164E1C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_20D164E30(a1, a2);
  return a1;
}

uint64_t sub_20D164E30(uint64_t a1, unint64_t a2)
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

uint64_t OUTLINED_FUNCTION_0_3()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  return swift_allocError();
}

void OUTLINED_FUNCTION_5_3()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

void sub_20D164EE0(void (*a1)(void))
{
  a1();
  OUTLINED_FUNCTION_1();
}

void PEPhotoStyleDPad.value.getter()
{
  OUTLINED_FUNCTION_0_0();
  sub_20D1674F0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23_0();
}

uint64_t PEPhotoStyleDPad.value.setter()
{
  double v0;
  double v1;

  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_0_0();
  v0 = OUTLINED_FUNCTION_21_1();
  sub_20D1672FC(1, v0, v1);
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_20D165000(double a1, double a2)
{
  return sub_20D1672FC(1, a1, a2);
}

void PEPhotoStyleDPad.defaultValue.getter()
{
  OUTLINED_FUNCTION_0_0();
  sub_20D165114();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23_0();
}

uint64_t PEPhotoStyleDPad.defaultValue.setter()
{
  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_21_1();
  sub_20D1675AC();
  return OUTLINED_FUNCTION_2_0();
}

double sub_20D165114()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_20D167980();
  sub_20D1912B0();
  swift_release();
  return *(double *)(v0 + 40);
}

uint64_t PEPhotoStyleDPad.backgroundImage.getter()
{
  return sub_20D1654CC((uint64_t (*)(uint64_t))sub_20D165250);
}

uint64_t PEPhotoStyleDPad.backgroundImage.setter(void *a1)
{
  return sub_20D16535C(a1);
}

id sub_20D165218@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_backgroundImage);
  *a2 = result;
  return result;
}

void *sub_20D165250()
{
  uint64_t v0;
  void *v1;
  id v2;

  swift_getKeyPath();
  sub_20D167980();
  sub_20D1912B0();
  swift_release();
  v1 = *(void **)(v0 + 56);
  v2 = v1;
  return v1;
}

uint64_t PEPhotoStyleDPad.backgroundColor.getter()
{
  return sub_20D1654CC((uint64_t (*)(uint64_t))sub_20D1653D8);
}

uint64_t PEPhotoStyleDPad.backgroundColor.setter(void *a1)
{
  return sub_20D16535C(a1);
}

uint64_t sub_20D16535C(void *a1)
{
  OUTLINED_FUNCTION_0_0();
  sub_20D16544C(a1);
  return OUTLINED_FUNCTION_7_4();
}

id sub_20D1653A0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_backgroundColor);
  *a2 = result;
  return result;
}

void *sub_20D1653D8()
{
  uint64_t v0;
  void *v1;
  id v2;

  swift_getKeyPath();
  sub_20D167980();
  sub_20D1912B0();
  swift_release();
  v1 = *(void **)(v0 + 64);
  v2 = v1;
  return v1;
}

void sub_20D16544C(void *a1)
{
  swift_getKeyPath();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_16_2();

  OUTLINED_FUNCTION_5_0();
}

uint64_t PEPhotoStyleDPad.gradientCast.getter()
{
  return sub_20D1654CC((uint64_t (*)(uint64_t))sub_20D16557C);
}

uint64_t sub_20D1654CC(uint64_t (*a1)(uint64_t))
{
  uint64_t v2;
  uint64_t v3;

  v2 = OUTLINED_FUNCTION_0_0();
  v3 = a1(v2);
  OUTLINED_FUNCTION_3_0();
  return v3;
}

uint64_t PEPhotoStyleDPad.gradientCast.setter(void *a1)
{
  OUTLINED_FUNCTION_0_0();
  sub_20D1655E8(a1);
  return OUTLINED_FUNCTION_11_2();
}

id sub_20D16557C()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_20D167980();
  sub_20D1912B0();
  swift_release();
  return *(id *)(v0 + 72);
}

void sub_20D1655E8(void *a1)
{
  swift_getKeyPath();
  sub_20D1675FC();
  swift_release();

}

void PEPhotoStyleDPad.onValueChanged.getter()
{
  sub_20D1660E8((void (*)(uint64_t))sub_20D16582C);
}

uint64_t sub_20D165670(uint64_t a1, double a2, double a3)
{
  void (*v5)(uint64_t, double, double);
  uint64_t v6;

  v5 = *(void (**)(uint64_t, double, double))(a1 + 32);
  v6 = swift_retain();
  v5(v6, a2, a3);
  return swift_release();
}

uint64_t PEPhotoStyleDPad.onValueChanged.setter()
{
  return sub_20D166158();
}

uint64_t sub_20D1656E4@<X0>(id *a1@<X0>, void (**a2)(double *a1)@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t result;

  v3 = objc_msgSend(*a1, sel_onValueChanged);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = sub_20D14E90C;
  *(_QWORD *)(result + 24) = v4;
  *a2 = sub_20D168F88;
  a2[1] = (void (*)(double *))result;
  return result;
}

void sub_20D16576C(uint64_t *a1, void **a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  v4 = *a1;
  v3 = a1[1];
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = v3;
  v6 = *a2;
  v8[4] = sub_20D168F84;
  v8[5] = v5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_20D165670;
  v8[3] = &block_descriptor_88;
  v7 = _Block_copy(v8);
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_setOnValueChanged_, v7);
  _Block_release(v7);
}

uint64_t sub_20D16582C()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_20D167980();
  sub_20D1912B0();
  swift_release();
  v1 = *(_QWORD *)(v0 + 232);
  swift_retain();
  return v1;
}

uint64_t PEPhotoStyleDPad.isActive.getter()
{
  return sub_20D16598C((uint64_t (*)(uint64_t))sub_20D1658E4);
}

uint64_t sub_20D1658E4()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_20D167980();
  sub_20D1912B0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t PEPhotoStyleDPad.pulsingValueIndicator.getter()
{
  return sub_20D16598C((uint64_t (*)(uint64_t))sub_20D165A54);
}

uint64_t sub_20D16598C(uint64_t (*a1)(uint64_t))
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_0_0();
  LOBYTE(a1) = a1(v2);
  OUTLINED_FUNCTION_3_0();
  return a1 & 1;
}

void PEPhotoStyleDPad.pulsingValueIndicator.setter()
{
  sub_20D191D00();
  sub_20D1914B4();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_20D165A54()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_20D167980();
  sub_20D1912B0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 33);
}

uint64_t sub_20D165AC0()
{
  swift_retain();
  sub_20D167754();
  return swift_release();
}

void PEPhotoStyleDPad.isDottedGridAnimated.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_0();
  sub_20D165C9C(&v0);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_18_1();
}

void PEPhotoStyleDPad.isDottedGridAnimated.setter(char a1)
{
  uint64_t v1;
  uint64_t v3;
  __int16 v4;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR___PEPhotoStyleDPad_stylePadModel);
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_24();
  sub_20D1912B0();
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_17_1();
  sub_20D1912C8();
  OUTLINED_FUNCTION_16_2();
  if (*(__int16 *)(v3 + 176) < 0)
  {
    if ((a1 & 1) != 0)
      v4 = -32512;
    else
      v4 = 0x8000;
    *(_WORD *)(v3 + 176) = v4 & 0xFFFE | *(_WORD *)(v3 + 176) & 1;
  }
  swift_getKeyPath();
  sub_20D1912BC();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_10_3();
}

void *sub_20D165C9C@<X0>(void *a1@<X8>)
{
  uint64_t v1;

  swift_getKeyPath();
  sub_20D167980();
  sub_20D1912B0();
  swift_release();
  return memcpy(a1, (const void *)(v1 + 80), 0x80uLL);
}

void PEPhotoStyleDPad.snapIndicatorToGrid.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_0();
  sub_20D165C9C(&v0);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_18_1();
}

void PEPhotoStyleDPad.snapIndicatorToGrid.setter(char a1)
{
  uint64_t v1;
  uint64_t v3;
  int v4;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR___PEPhotoStyleDPad_stylePadModel);
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_24();
  sub_20D1912B0();
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_17_1();
  sub_20D1912C8();
  OUTLINED_FUNCTION_16_2();
  v4 = *(__int16 *)(v3 + 176);
  if (v4 < 0)
    *(_WORD *)(v3 + 176) = v4 & 0x100 | a1 & 1 | 0x8000;
  swift_getKeyPath();
  sub_20D1912BC();
  OUTLINED_FUNCTION_15_2();
  swift_release();
  OUTLINED_FUNCTION_10_3();
}

void PEPhotoStyleDPad.onGestureDidBegin.getter()
{
  sub_20D1660E8((void (*)(uint64_t))sub_20D165FF8);
}

void sub_20D165EDC(void *a1, int a2, void *aBlock, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t))
{
  void *v9;
  uint64_t v10;
  id v11;

  v9 = _Block_copy(aBlock);
  v10 = OUTLINED_FUNCTION_12_1();
  *(_QWORD *)(v10 + 16) = v9;
  v11 = a1;
  a6(a5, v10);

}

uint64_t PEPhotoStyleDPad.onGestureDidBegin.setter()
{
  return sub_20D166158();
}

uint64_t sub_20D165F70@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t result;

  v3 = objc_msgSend(*a1, sel_onGestureDidBegin);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = sub_20D169340;
  *(_QWORD *)(result + 24) = v4;
  *a2 = sub_20D169344;
  a2[1] = result;
  return result;
}

uint64_t sub_20D165FF8()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_20D167980();
  sub_20D1912B0();
  swift_release();
  v1 = *(_QWORD *)(v0 + 248);
  swift_retain();
  return v1;
}

void sub_20D166074()
{
  swift_getKeyPath();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_5_0();
}

void PEPhotoStyleDPad.onGestureDidEnd.getter()
{
  sub_20D1660E8((void (*)(uint64_t))sub_20D1662DC);
}

void sub_20D1660E8(void (*a1)(uint64_t))
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_0_0();
  a1(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7_3();
}

uint64_t PEPhotoStyleDPad.onGestureDidEnd.setter()
{
  return sub_20D166158();
}

uint64_t sub_20D166158()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_26_0();
  return swift_release();
}

uint64_t sub_20D1661AC@<X0>(id *a1@<X0>, void (**a2)()@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t result;

  v3 = objc_msgSend(*a1, sel_onGestureDidEnd);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = sub_20D169340;
  *(_QWORD *)(result + 24) = v4;
  *a2 = sub_20D168F68;
  a2[1] = (void (*)())result;
  return result;
}

void sub_20D166234(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, SEL *a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[6];

  v13 = *a1;
  v12 = a1[1];
  v14 = OUTLINED_FUNCTION_12_1();
  *(_QWORD *)(v14 + 16) = v13;
  *(_QWORD *)(v14 + 24) = v12;
  v15 = *a2;
  v17[4] = a6;
  v17[5] = v14;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 1107296256;
  v17[2] = sub_20D1635CC;
  v17[3] = a7;
  v16 = _Block_copy(v17);
  swift_retain();
  swift_release();
  objc_msgSend(v15, *a8, v16);
  _Block_release(v16);
  OUTLINED_FUNCTION_5_0();
}

uint64_t sub_20D1662DC()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_20D167980();
  sub_20D1912B0();
  swift_release();
  v1 = *(_QWORD *)(v0 + 264);
  swift_retain();
  return v1;
}

uint64_t PEPhotoStyleDPad.configuration.getter@<X0>(void *a1@<X8>)
{
  OUTLINED_FUNCTION_0_0();
  sub_20D165C9C(a1);
  return OUTLINED_FUNCTION_11_2();
}

void *sub_20D166388@<X0>(void *a1@<X8>)
{
  _BYTE v3[128];

  PEPhotoStyleDPad.configuration.getter(v3);
  return memcpy(a1, v3, 0x80uLL);
}

uint64_t PEPhotoStyleDPad.configuration.setter(const void *a1)
{
  _BYTE v2[128];

  OUTLINED_FUNCTION_18(v2, a1);
  OUTLINED_FUNCTION_0_0();
  sub_20D16640C(v2);
  return swift_release();
}

uint64_t sub_20D16640C(void *__src)
{
  _BYTE __dst[128];

  memcpy(__dst, __src, sizeof(__dst));
  swift_getKeyPath();
  sub_20D1675FC();
  return swift_release();
}

void PEPhotoStyleDPad.configuration.modify(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[16] = v1;
  PEPhotoStyleDPad.configuration.getter(v3);
  OUTLINED_FUNCTION_7_3();
}

void sub_20D1664BC(const void **a1)
{
  void *v1;
  _BYTE v2[128];

  v1 = (void *)*a1;
  OUTLINED_FUNCTION_18(v2, *a1);
  PEPhotoStyleDPad.configuration.setter(v2);
  free(v1);
}

uint64_t PEPhotoStyleDPad.size.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_0();
  v0 = sub_20D1665BC();
  OUTLINED_FUNCTION_3_0();
  return v0;
}

uint64_t sub_20D166548()
{
  return PEPhotoStyleDPad.size.setter();
}

uint64_t PEPhotoStyleDPad.size.setter()
{
  OUTLINED_FUNCTION_0_0();
  sub_20D16662C();
  return OUTLINED_FUNCTION_7_4();
}

uint64_t sub_20D1665BC()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_20D167980();
  sub_20D1912B0();
  swift_release();
  return *(_QWORD *)(v0 + 208);
}

uint64_t sub_20D16662C()
{
  swift_getKeyPath();
  sub_20D1675FC();
  return swift_release();
}

void (*PEPhotoStyleDPad.size.modify(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v3;
  char v4;

  *(_QWORD *)(a1 + 24) = v1;
  *(_QWORD *)a1 = PEPhotoStyleDPad.size.getter();
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  return sub_20D1666E0;
}

void sub_20D1666E0()
{
  PEPhotoStyleDPad.size.setter();
  OUTLINED_FUNCTION_1();
}

char *PEPhotoStyleDPad.init(initialValue:defaultValue:gradientCast:configuration:onValueChanged:)(void *a1, const void *a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7, double a8)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  _BYTE *v21;
  id v22;
  char *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v16 = _s15IntegrationViewVMa_1(0);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = &v31[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v17);
  v21 = &v31[-v20];
  OUTLINED_FUNCTION_18(v31, a2);
  v22 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithSize_, 0.0, 0.0);
  _s16IntegrationModelCMa_1(0);
  OUTLINED_FUNCTION_28();
  v23 = (char *)v22;
  v24 = a1;
  OUTLINED_FUNCTION_24();
  *((_QWORD *)&v30 + 1) = nullsub_1;
  *((_QWORD *)&v29 + 1) = nullsub_1;
  *(_QWORD *)&v30 = 0;
  *(_QWORD *)&v29 = a4;
  *(_QWORD *)&v23[OBJC_IVAR___PEPhotoStyleDPad_stylePadModel] = sub_20D167BB0(0, 0, (uint64_t)v24, v31, 0, 0, 1, a3, a5, a6, a7, a8, v29, v30, 0);
  swift_release();
  sub_20D167980();
  swift_retain();
  sub_20D191C34();
  v25 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2549A9930));
  sub_20D167CBC((uint64_t)v21, (uint64_t)v19);
  v26 = sub_20D191790();
  sub_20D167D00((uint64_t)v21);
  v27 = *(void **)&v23[OBJC_IVAR___PEPhotoStyleDPad_hostingController];
  *(_QWORD *)&v23[OBJC_IVAR___PEPhotoStyleDPad_hostingController] = v26;

  sub_20D166948();
  OUTLINED_FUNCTION_15_2();
  return v23;
}

uint64_t sub_20D166918(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return sub_20D168780(a1);
}

void sub_20D166948()
{
  char *v0;
  char *v1;
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;

  v1 = v0;
  v2 = OBJC_IVAR___PEPhotoStyleDPad_hostingController;
  objc_msgSend(v0, sel_addChildViewController_, *(_QWORD *)&v0[OBJC_IVAR___PEPhotoStyleDPad_hostingController]);
  objc_msgSend(*(id *)&v0[v2], sel_didMoveToParentViewController_, v0);
  v3 = *(id *)&v0[v2];
  sub_20D191778();

  v4 = objc_msgSend(*(id *)&v1[v2], sel_view);
  if (!v4)
  {
    __break(1u);
    goto LABEL_10;
  }
  v5 = v4;
  v6 = objc_msgSend(v1, sel_view);
  if (!v6)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v7 = v6;
  v8 = objc_msgSend(*(id *)&v1[v2], sel_view);
  if (!v8)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v9 = v8;
  objc_msgSend(v7, sel_addSubview_, v8);

  v10 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  objc_msgSend(v5, sel_setBackgroundColor_, v10);

  objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A8BD0);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_20D195B40;
  v12 = objc_msgSend(v5, sel_topAnchor);
  v13 = objc_msgSend(v1, sel_view);
  if (!v13)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v14 = v13;
  v15 = objc_msgSend(v13, sel_topAnchor);

  v16 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v15);
  *(_QWORD *)(v11 + 32) = v16;
  v17 = objc_msgSend(v5, sel_bottomAnchor);
  v18 = objc_msgSend(v1, sel_view);
  if (!v18)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v19 = v18;
  v20 = objc_msgSend(v18, sel_bottomAnchor);

  v21 = objc_msgSend(v17, sel_constraintEqualToAnchor_, v20);
  *(_QWORD *)(v11 + 40) = v21;
  v22 = objc_msgSend(v5, sel_leadingAnchor);
  v23 = objc_msgSend(v1, sel_view);
  if (!v23)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v24 = v23;
  v25 = objc_msgSend(v23, sel_leadingAnchor);

  v26 = objc_msgSend(v22, sel_constraintEqualToAnchor_, v25);
  *(_QWORD *)(v11 + 48) = v26;
  v27 = objc_msgSend(v5, sel_trailingAnchor);
  v28 = objc_msgSend(v1, sel_view);
  if (v28)
  {
    v29 = v28;
    v30 = (void *)objc_opt_self();
    v31 = objc_msgSend(v29, sel_trailingAnchor);

    v32 = objc_msgSend(v27, sel_constraintEqualToAnchor_, v31);
    *(_QWORD *)(v11 + 56) = v32;
    sub_20D191E74();
    sub_20D14E520(0, &qword_2549A8BD8);
    v33 = (id)sub_20D191E5C();
    swift_bridgeObjectRelease();
    objc_msgSend(v30, sel_activateConstraints_, v33);

    return;
  }
LABEL_15:
  __break(1u);
}

void __swiftcall PEPhotoStyleDPad.init(size:)(PEPhotoStyleDPad *__return_ptr retstr, CGSize size)
{
  id v2;
  double v3;
  id v4;
  SEL v5;

  OUTLINED_FUNCTION_9_3();
  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v3 = OUTLINED_FUNCTION_21_1();
  objc_msgSend(v4, v5, v3);
}

id PEPhotoStyleDPad.init(size:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  void *v7;
  char *v8;
  id v9;
  uint64_t v10;
  id v11;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  char v16[8];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21;
  __int128 v22;
  __int16 v23;
  __int128 v24;
  uint64_t v25;

  OUTLINED_FUNCTION_9_3();
  v1 = _s15IntegrationViewVMa_1(0);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v15 - v5;
  v7 = (void *)*MEMORY[0x24BE71ED0];
  v16[0] = 1;
  v17 = xmmword_20D1952A0;
  v18 = xmmword_20D1952B0;
  v19 = xmmword_20D195260;
  v20 = xmmword_20D195270;
  v21 = 0;
  v22 = xmmword_20D195230;
  v23 = -32511;
  v24 = xmmword_20D1952C0;
  v25 = 0x3FE3333333333333;
  _s16IntegrationModelCMa_1(0);
  OUTLINED_FUNCTION_28();
  v8 = v0;
  *((_QWORD *)&v14 + 1) = nullsub_1;
  *((_QWORD *)&v13 + 1) = nullsub_1;
  *(_QWORD *)&v14 = 0;
  *(_QWORD *)&v13 = 0;
  *(_QWORD *)&v8[OBJC_IVAR___PEPhotoStyleDPad_stylePadModel] = sub_20D167BB0(0, 0, (uint64_t)v7, v16, 0, 0, 1, (uint64_t)nullsub_1, 0.0, 0.0, 0.0, 0.0, v13, v14, 0);
  sub_20D167980();
  swift_retain();
  sub_20D191C34();
  v9 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2549A9930));
  sub_20D167CBC((uint64_t)v6, (uint64_t)v4);
  v10 = sub_20D191790();
  sub_20D167D00((uint64_t)v6);
  *(_QWORD *)&v8[OBJC_IVAR___PEPhotoStyleDPad_hostingController] = v10;

  v15.receiver = v8;
  v15.super_class = (Class)PEPhotoStyleDPad;
  v11 = objc_msgSendSuper2(&v15, sel_initWithNibName_bundle_, 0, 0);
  PEPhotoStyleDPad.size.setter();
  sub_20D166948();

  return v11;
}

void __swiftcall PEPhotoStyleDPad.init(coder:)(PEPhotoStyleDPad_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

void PEPhotoStyleDPad.init(coder:)()
{
  sub_20D191EF8();
  __break(1u);
}

Swift::Void __swiftcall PEPhotoStyleDPad.setValue(_:animated:)(CGPoint _, Swift::Bool animated)
{
  sub_20D16721C(_.x, _.y, animated, (uint64_t)sub_20D167D3C);
}

uint64_t PEPhotoStyleDPad.withAnimation(duration:_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  _QWORD *v13;
  id v14;
  _BYTE v16[16];
  uint64_t v17;
  uint64_t v18;

  v9 = sub_20D191850();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = &v16[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_20D191D18();
  sub_20D191844();
  v17 = a1;
  v18 = a2;
  v13 = (_QWORD *)OUTLINED_FUNCTION_12_1();
  v13[2] = v4;
  v13[3] = a3;
  v13[4] = a4;
  v14 = v4;
  sub_20D167DB0(a3);
  sub_20D1914A8();
  swift_release();
  OUTLINED_FUNCTION_25_0();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v10 + 8))(v12, v9);
}

Swift::Void __swiftcall PEPhotoStyleDPad.setDefaultValue(_:animated:)(CGPoint _, Swift::Bool animated)
{
  sub_20D16721C(_.x, _.y, animated, (uint64_t)sub_20D167DC0);
}

uint64_t sub_20D16721C(double a1, double a2, uint64_t a3, uint64_t a4)
{
  _QWORD v5[6];

  *(double *)&v5[3] = a1;
  *(double *)&v5[4] = a2;
  return PEPhotoStyleDPad.withAnimation(duration:_:completion:)(a4, (uint64_t)v5, 0, 0);
}

Swift::Void __swiftcall PEPhotoStyleDPad.setValue(_:notifyObserver:)(CGPoint _, Swift::Bool notifyObserver)
{
  double v3;
  double v4;

  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_0_0();
  v3 = OUTLINED_FUNCTION_21_1();
  sub_20D1672FC(notifyObserver, v3, v4);
  OUTLINED_FUNCTION_2_0();
}

uint64_t sub_20D1672FC(char a1, double a2, double a3)
{
  uint64_t result;
  void (*v7)(double, double);

  sub_20D1674F0();
  if ((sub_20D1912EC() & 1) == 0 || (sub_20D1674F0(), result = sub_20D1912EC(), (result & 1) == 0))
  {
    result = sub_20D1675AC();
    if ((a1 & 1) != 0)
    {
      v7 = (void (*)(double, double))sub_20D16582C();
      v7(a2, a3);
      return swift_release();
    }
  }
  return result;
}

void sub_20D1673EC(uint64_t a1, void (*a2)(void))
{
  PEPhotoStyleDPad.resizeToFitContent()();
  if (a2)
    a2();
}

Swift::Void __swiftcall PEPhotoStyleDPad.resizeToFitContent()()
{
  char *v0;
  id v1;
  void *v2;
  id v3;

  v3 = objc_msgSend(v0, sel_view);
  if (v3)
  {
    v1 = objc_msgSend(*(id *)&v0[OBJC_IVAR___PEPhotoStyleDPad_hostingController], sel_view);
    if (v1)
    {
      v2 = v1;
      objc_msgSend(v1, sel_intrinsicContentSize);

      objc_msgSend(v3, sel_bounds);
      objc_msgSend(v3, sel_setBounds_);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

Swift::Bool __swiftcall PEPhotoStyleDPad._canShowWhileLocked()()
{
  return 1;
}

double sub_20D1674F0()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_20D167980();
  sub_20D1912B0();
  swift_release();
  return *(double *)(v0 + 16);
}

uint64_t sub_20D16755C()
{
  return sub_20D165AC0();
}

uint64_t sub_20D167578()
{
  return sub_20D1675AC();
}

uint64_t sub_20D1675AC()
{
  OUTLINED_FUNCTION_9_3();
  swift_getKeyPath();
  OUTLINED_FUNCTION_3_3();
  return OUTLINED_FUNCTION_27();
}

uint64_t sub_20D1675FC()
{
  sub_20D167980();
  return sub_20D1912A4();
}

uint64_t sub_20D167684(uint64_t result, char a2)
{
  void (*v3)(void);

  if ((result & 1) != (a2 & 1))
  {
    if ((sub_20D165A54() & 1) != 0)
    {
      sub_20D191D00();
      sub_20D1914B4();
      swift_release();
    }
    if ((a2 & 1) != 0)
      v3 = (void (*)(void))sub_20D165FF8();
    else
      v3 = (void (*)(void))sub_20D1662DC();
    v3();
    return swift_release();
  }
  return result;
}

uint64_t sub_20D167728(char a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  v2 = *(unsigned __int8 *)(v1 + 32);
  *(_BYTE *)(v1 + 32) = a1;
  v3 = sub_20D1658E4() & 1;
  return sub_20D167684(v2, v3);
}

void sub_20D167754()
{
  swift_getKeyPath();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_20D167794()
{
  return sub_20D1675AC();
}

void sub_20D1677C8(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_20D16544C(v1);
}

void sub_20D167804(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 56);
  *(_QWORD *)(a1 + 56) = a2;
  v3 = a2;

}

void sub_20D167834(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_20D16544C(v1);
}

void sub_20D167870(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = a2;
  v3 = a2;

}

void sub_20D1678A0(id *a1)
{
  sub_20D1655E8(*a1);
}

void sub_20D1678C8(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = a2;
  v3 = a2;

}

void *sub_20D1678F8@<X0>(void *a1@<X8>)
{
  _BYTE v3[128];

  sub_20D165C9C(v3);
  return memcpy(a1, v3, 0x80uLL);
}

uint64_t sub_20D16793C(void *__src)
{
  _BYTE v2[128];

  memcpy(v2, __src, sizeof(v2));
  return sub_20D16640C(v2);
}

unint64_t sub_20D167980()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2549A9928;
  if (!qword_2549A9928)
  {
    v1 = _s16IntegrationModelCMa_1(255);
    result = MEMORY[0x212B9F008](&unk_20D196D60, v1);
    atomic_store(result, (unint64_t *)&qword_2549A9928);
  }
  return result;
}

uint64_t _s16IntegrationModelCMa_1(uint64_t a1)
{
  return sub_20D14DB04(a1, qword_2549A9968);
}

uint64_t _s15IntegrationViewVMa_1(uint64_t a1)
{
  return sub_20D14DB04(a1, (uint64_t *)&unk_2549A9B70);
}

void sub_20D1679E8()
{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v2;
  char v3;

  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)v0 = v1();
  *(_QWORD *)(v0 + 8) = v2;
  *(_BYTE *)(v0 + 16) = v3 & 1;
  OUTLINED_FUNCTION_1();
}

uint64_t sub_20D167A10()
{
  return sub_20D16662C();
}

uint64_t sub_20D167A40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 232) = a2;
  *(_QWORD *)(a1 + 240) = a3;
  swift_retain();
  return swift_release();
}

uint64_t sub_20D167A78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 248) = a2;
  *(_QWORD *)(a1 + 256) = a3;
  swift_retain();
  return swift_release();
}

uint64_t sub_20D167AB0@<X0>(uint64_t (*a1)(void)@<X3>, uint64_t a2@<X5>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v5 = a1();
  v7 = v6;
  result = OUTLINED_FUNCTION_12_1();
  *(_QWORD *)(result + 16) = v5;
  *(_QWORD *)(result + 24) = v7;
  *a3 = a2;
  a3[1] = result;
  return result;
}

void sub_20D167B08(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *a1;
  v2 = a1[1];
  v3 = OUTLINED_FUNCTION_12_1();
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = v2;
  swift_retain();
  OUTLINED_FUNCTION_26_0();
}

uint64_t sub_20D167B78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 264) = a2;
  *(_QWORD *)(a1 + 272) = a3;
  swift_retain();
  return swift_release();
}

uint64_t sub_20D167BB0(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, double a9, double a10, double a11, double a12, __int128 a13, __int128 a14, uint64_t a15)
{
  uint64_t v15;

  *(_WORD *)(v15 + 32) = 0;
  *(_QWORD *)(v15 + 56) = 0;
  *(_QWORD *)(v15 + 64) = 0;
  *(_QWORD *)(v15 + 208) = 0;
  *(_QWORD *)(v15 + 216) = 0;
  *(_BYTE *)(v15 + 224) = 1;
  sub_20D1912D4();
  *(double *)(v15 + 16) = a9;
  *(double *)(v15 + 24) = a10;
  *(double *)(v15 + 40) = a11;
  *(double *)(v15 + 48) = a12;

  *(_QWORD *)(v15 + 56) = a1;
  *(_QWORD *)(v15 + 64) = a2;
  *(_QWORD *)(v15 + 72) = a3;
  memcpy((void *)(v15 + 80), a4, 0x80uLL);
  *(_QWORD *)(v15 + 208) = a5;
  *(_QWORD *)(v15 + 216) = a6;
  *(_BYTE *)(v15 + 224) = a7 & 1;
  *(_QWORD *)(v15 + 232) = a8;
  *(_OWORD *)(v15 + 240) = a13;
  *(_OWORD *)(v15 + 256) = a14;
  *(_QWORD *)(v15 + 272) = a15;
  return v15;
}

uint64_t sub_20D167CBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = _s15IntegrationViewVMa_1(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20D167D00(uint64_t a1)
{
  uint64_t v2;

  v2 = _s15IntegrationViewVMa_1(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_20D167D3C()
{
  return sub_20D167DCC((SEL *)&selRef_setValue_);
}

uint64_t sub_20D167D48()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_20D167D70()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
    swift_release();
  return swift_deallocObject();
}

void sub_20D167DA4()
{
  uint64_t v0;

  sub_20D1673EC(*(_QWORD *)(v0 + 16), *(void (**)(void))(v0 + 24));
}

uint64_t sub_20D167DB0(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

id sub_20D167DC0()
{
  return sub_20D167DCC((SEL *)&selRef_setDefaultValue_);
}

id sub_20D167DCC(SEL *a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + 16), *a1, *(double *)(v1 + 24), *(double *)(v1 + 32));
}

id *sub_20D167DE0()
{
  id *v0;
  char *v1;
  uint64_t v2;

  swift_release();
  swift_release();
  swift_release();
  v1 = (char *)v0
     + OBJC_IVAR____TtCE12PhotosUIEditCSo16PEPhotoStyleDPadP33_AA1EE9CF7D273E93D23CCED039C6510B16IntegrationModel___observationRegistrar;
  v2 = sub_20D1912E0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_20D167E54()
{
  sub_20D167DE0();
  return swift_deallocClassInstance();
}

uint64_t sub_20D167E74@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(_BYTE *, uint64_t);
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  _BYTE v24[4];
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[312];
  uint64_t v35;
  char v36;
  char v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char v41;
  __int128 v42;
  char v43;
  char v44;
  char v45;
  _QWORD v46[39];
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  __int128 v51;
  _BYTE v52[320];

  v33 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9B10);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = &v24[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v3);
  v7 = &v24[-v6];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9BB0);
  v31 = *(_QWORD *)(v8 - 8);
  v32 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v30 = &v24[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_20D191C28();
  swift_getKeyPath();
  sub_20D191C40();
  swift_release();
  v10 = *(void (**)(_BYTE *, uint64_t))(v2 + 8);
  v10(v7, v1);
  v28 = v46[1];
  v29 = v46[0];
  v11 = *(double *)&v46[2];
  v12 = *(double *)&v46[3];
  sub_20D191C28();
  swift_getKeyPath();
  sub_20D191C40();
  swift_release();
  v10(v5, v1);
  v26 = v48;
  v27 = v47;
  v25 = v49;
  sub_20D191C1C();
  LOBYTE(v2) = sub_20D165A54();
  swift_release();
  sub_20D191C1C();
  v13 = sub_20D165114();
  v15 = v14;
  swift_release();
  sub_20D191C1C();
  v16 = sub_20D165250();
  swift_release();
  sub_20D191C1C();
  v17 = sub_20D1653D8();
  swift_release();
  sub_20D191C1C();
  v18 = sub_20D16557C();
  v19 = PISemanticStyleCast.gradientImageName.getter();
  v21 = v20;
  swift_release();

  sub_20D191C1C();
  sub_20D165C9C(v34);
  swift_release();
  PhotoStyleDPad.init(value:isActive:pulsingValueIndicator:defaultValue:minValue:maxValue:backgroundImage:backgroundColor:gradientImageName:configuration:)(v29, v28, v27, v26, v25, v2 & 1, (uint64_t)v16, (uint64_t)v17, v52, v11, v12, v13, v15, -1.0, -1.0, 1.0, 1.0, v19, v21,
    v34);
  sub_20D191C1C();
  sub_20D1665BC();
  swift_release();
  sub_20D191C1C();
  sub_20D1665BC();
  swift_release();
  memcpy(v46, v52, sizeof(v46));
  v43 = 0;
  sub_20D191CAC();
  sub_20D191424();
  v45 = v48;
  v44 = v50;
  memcpy(v34, v46, sizeof(v34));
  v35 = 0x3FF0000000000000;
  v36 = v43;
  v37 = 0;
  v38 = v47;
  v39 = v48;
  v40 = v49;
  v41 = v50;
  v42 = v51;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9BB8);
  sub_20D168DB4(&qword_2549A9BC0, &qword_2549A9BB8, sub_20D168D90, MEMORY[0x24BDEBEE0]);
  v22 = v30;
  sub_20D1919E8();
  sub_20D14413C((uint64_t)v52);
  return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v31 + 32))(v33, v22, v32);
}

uint64_t sub_20D1682B8(double *a1)
{
  return sub_20D165000(*a1, a1[1]);
}

void __swiftcall PEPhotoStyleDPad.init(nibName:bundle:)(PEPhotoStyleDPad *__return_ptr retstr, Swift::String_optional nibName, NSBundle_optional bundle)
{
  Class isa;
  void *v4;

  isa = bundle.value.super.isa;
  if (nibName.value._object)
  {
    v4 = (void *)sub_20D191E14();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithNibName_bundle_, v4, isa);

}

void PEPhotoStyleDPad.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_20D168384(uint64_t a1)
{
  keypath_get_1Tm(a1);
}

id sub_20D168390(double *a1, id *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_2Tm(a1, a2, a3, a4, (SEL *)&selRef_setValue_);
}

char *keypath_get_selector_defaultValue()
{
  return sel_defaultValue;
}

void sub_20D1683A8(uint64_t a1)
{
  keypath_get_1Tm(a1);
}

void keypath_get_1Tm(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  SEL *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)OUTLINED_FUNCTION_23(a1);
  objc_msgSend(v2, *v3);
  *v1 = v4;
  v1[1] = v5;
  OUTLINED_FUNCTION_1();
}

id sub_20D1683D8(double *a1, id *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_2Tm(a1, a2, a3, a4, (SEL *)&selRef_setDefaultValue_);
}

id keypath_set_2Tm(double *a1, id *a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  return objc_msgSend(*a2, *a5, *a1, a1[1]);
}

char *keypath_get_selector_backgroundImage()
{
  return sel_backgroundImage;
}

id sub_20D168404(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setBackgroundImage_, *a1);
}

char *keypath_get_selector_backgroundColor()
{
  return sel_backgroundColor;
}

id sub_20D168428(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setBackgroundColor_, *a1);
}

id sub_20D168440(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setGradientCast_, *a1);
}

char *keypath_get_selector_pulsingValueIndicator()
{
  return sel_pulsingValueIndicator;
}

void sub_20D168468(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_23(a1), sel_pulsingValueIndicator);
  OUTLINED_FUNCTION_1();
}

id sub_20D168490(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPulsingValueIndicator_, *a1);
}

char *keypath_get_selector_isDottedGridAnimated()
{
  return sel_isDottedGridAnimated;
}

void sub_20D1684B0(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_23(a1), sel_isDottedGridAnimated);
  OUTLINED_FUNCTION_1();
}

id sub_20D1684D8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsDottedGridAnimated_, *a1);
}

char *keypath_get_selector_snapIndicatorToGrid()
{
  return sel_snapIndicatorToGrid;
}

void sub_20D1684F8(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_23(a1), sel_snapIndicatorToGrid);
  OUTLINED_FUNCTION_1();
}

id sub_20D168520(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSnapIndicatorToGrid_, *a1);
}

void sub_20D168538(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_20D166234(a1, a2, a3, a4, (uint64_t)&unk_24C617C10, (uint64_t)sub_20D169344, (uint64_t)&block_descriptor_74, (SEL *)&selRef_setOnGestureDidBegin_);
}

void sub_20D168570(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_20D166234(a1, a2, a3, a4, (uint64_t)&unk_24C617B70, (uint64_t)sub_20D168F68, (uint64_t)&block_descriptor_60_0, (SEL *)&selRef_setOnGestureDidEnd_);
}

void sub_20D1685A8(const void *a1)
{
  PEPhotoStyleDPad.configuration.setter(a1);
  OUTLINED_FUNCTION_1();
}

void sub_20D1685C4()
{
  sub_20D1679E8();
}

uint64_t sub_20D1685E4()
{
  return _s16IntegrationModelCMa_1(0);
}

uint64_t sub_20D1685EC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20D1912E0();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for PEPhotoStyleDPad(uint64_t a1)
{
  return sub_20D14E520(a1, &qword_2549A9A78);
}

uint64_t sub_20D16871C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_20D16875C()
{
  return sub_20D1528BC() & 1;
}

uint64_t sub_20D168780(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v3 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + qword_2549A9A80);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v8 - v5, a1, v3);
  v6 = sub_20D191790();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return v6;
}

void *sub_20D16882C(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return sub_20D16886C(a1, a2);
}

void *sub_20D16886C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  uint64_t v11;

  v4 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v2) + qword_2549A9A80);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *))(v5 + 16))((char *)&v11 - v6);
  v7 = (void *)sub_20D191784();
  v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v9 = v7;
  v8(a2, v4);
  if (v7)

  return v7;
}

id sub_20D16892C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v6;
  id v7;
  objc_super v9;

  v6 = (objc_class *)type metadata accessor for PadHostingController(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + qword_2549A9A80), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + qword_2549A9A80 + 8), a4);
  v9.receiver = v4;
  v9.super_class = v6;
  v7 = objc_msgSendSuper2(&v9, sel_initWithCoder_, a1);

  return v7;
}

id sub_20D1689A0(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  return sub_20D16892C(v3, v4, v5, v6);
}

id sub_20D1689C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for PadHostingController(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + qword_2549A9A80), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + qword_2549A9A80 + 8), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t type metadata accessor for PadHostingController(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PadHostingController);
}

uint64_t sub_20D168A28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9B10);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_20D168A68(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9B10);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_20D168AA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_20D168AE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_20D168B30(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_20D168B78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_20D168BC0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D168BCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9B10);
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_20D168C04()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D168C10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549A9B10);
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

void sub_20D168C4C()
{
  unint64_t v0;

  sub_20D168CB4();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_20D168CB4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2549A9B80)
  {
    _s16IntegrationModelCMa_1(255);
    v0 = sub_20D191C4C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2549A9B80);
  }
}

uint64_t sub_20D168D08()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_20D168D18()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_8_0();
  *(double *)v0 = sub_20D164FFC();
  *(_QWORD *)(v0 + 8) = v1;
  OUTLINED_FUNCTION_1();
}

void sub_20D168D3C()
{
  _BYTE *v0;

  OUTLINED_FUNCTION_8_0();
  *v0 = sub_20D1658E4() & 1;
  OUTLINED_FUNCTION_1();
}

void sub_20D168D60()
{
  sub_20D167754();
  OUTLINED_FUNCTION_1();
}

uint64_t sub_20D168D90()
{
  return sub_20D168DB4(&qword_2549A9BC8, &qword_2549A9BD0, (uint64_t (*)(void))sub_20D168E1C, MEMORY[0x24BDEEC40]);
}

uint64_t sub_20D168DB4(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4;
    result = MEMORY[0x212B9F008](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_20D168E1C()
{
  unint64_t result;

  result = qword_2549A9BD8;
  if (!qword_2549A9BD8)
  {
    result = MEMORY[0x212B9F008](&protocol conformance descriptor for PhotoStyleDPad, &type metadata for PhotoStyleDPad);
    atomic_store(result, (unint64_t *)&qword_2549A9BD8);
  }
  return result;
}

uint64_t sub_20D168E58()
{
  uint64_t v0;

  return sub_20D167728(*(_BYTE *)(v0 + 24));
}

void sub_20D168E88()
{
  sub_20D167754();
}

void sub_20D168EC0()
{
  _BYTE *v0;

  OUTLINED_FUNCTION_8_0();
  *v0 = sub_20D165A54() & 1;
  OUTLINED_FUNCTION_1();
}

void sub_20D168EE4()
{
  sub_20D167754();
  OUTLINED_FUNCTION_1();
}

void sub_20D168F14()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 33) = *(_BYTE *)(v0 + 24);
}

uint64_t sub_20D168F24()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_20D168F48()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_12_3(*(_QWORD *)(v0 + 16));
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

void sub_20D168F68()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_1();
}

void sub_20D168F88(double *a1)
{
  uint64_t v1;

  (*(void (**)(double, double))(v1 + 16))(*a1, a1[1]);
  OUTLINED_FUNCTION_1();
}

void sub_20D168FA8()
{
  sub_20D1679E8();
}

__n128 sub_20D168FC8()
{
  uint64_t v0;
  __n128 *v1;
  unsigned __int8 v2;
  __n128 result;

  v1 = *(__n128 **)(v0 + 16);
  v2 = *(_BYTE *)(v0 + 40);
  result = *(__n128 *)(v0 + 24);
  v1[13] = result;
  v1[14].n128_u8[0] = v2;
  return result;
}

void *sub_20D168FE0()
{
  uint64_t v0;

  return memcpy((void *)(*(_QWORD *)(v0 + 16) + 80), *(const void **)(v0 + 24), 0x80uLL);
}

uint64_t sub_20D168FF0@<X0>(_QWORD *a1@<X8>)
{
  return sub_20D167AB0(sub_20D1662DC, (uint64_t)sub_20D169344, a1);
}

void sub_20D16901C(uint64_t *a1)
{
  sub_20D167B08(a1);
}

uint64_t sub_20D169050()
{
  uint64_t *v0;

  return sub_20D167B78(v0[2], v0[3], v0[4]);
}

uint64_t sub_20D16906C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D169090@<X0>(_QWORD *a1@<X8>)
{
  return sub_20D167AB0(sub_20D165FF8, (uint64_t)sub_20D169344, a1);
}

void sub_20D1690BC(uint64_t *a1)
{
  sub_20D167B08(a1);
}

uint64_t sub_20D1690F0()
{
  uint64_t *v0;

  return sub_20D167A78(v0[2], v0[3], v0[4]);
}

uint64_t sub_20D16910C@<X0>(_QWORD *a1@<X8>)
{
  return sub_20D167AB0(sub_20D16582C, (uint64_t)sub_20D16939C, a1);
}

void sub_20D169138(uint64_t *a1)
{
  sub_20D167B08(a1);
}

uint64_t sub_20D16916C()
{
  uint64_t *v0;

  return sub_20D167A40(v0[2], v0[3], v0[4]);
}

uint64_t sub_20D169188(double a1, double a2)
{
  uint64_t v2;
  uint64_t (*v3)(_QWORD *);
  _QWORD v5[2];

  v3 = *(uint64_t (**)(_QWORD *))(v2 + 16);
  *(double *)v5 = a1;
  *(double *)&v5[1] = a2;
  return v3(v5);
}

void sub_20D1691B8()
{
  id *v0;

  OUTLINED_FUNCTION_8_0();
  *v0 = sub_20D16557C();
  OUTLINED_FUNCTION_1();
}

void sub_20D1691DC()
{
  uint64_t v0;

  sub_20D1678C8(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_20D1691F4()
{
  void **v0;

  OUTLINED_FUNCTION_8_0();
  *v0 = sub_20D1653D8();
  OUTLINED_FUNCTION_1();
}

void sub_20D169218()
{
  uint64_t v0;

  sub_20D167870(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_20D169230()
{
  void **v0;

  OUTLINED_FUNCTION_8_0();
  *v0 = sub_20D165250();
  OUTLINED_FUNCTION_1();
}

void sub_20D169254()
{
  uint64_t v0;

  sub_20D167804(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_20D16926C()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_8_0();
  *(double *)v0 = sub_20D165114();
  *(_QWORD *)(v0 + 8) = v1;
  OUTLINED_FUNCTION_1();
}

__n128 sub_20D169290()
{
  uint64_t v0;
  __n128 result;

  result = *(__n128 *)(v0 + 24);
  *(__n128 *)(*(_QWORD *)(v0 + 16) + 40) = result;
  return result;
}

void sub_20D1692A0()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_8_0();
  *(double *)v0 = sub_20D1674F0();
  *(_QWORD *)(v0 + 8) = v1;
  OUTLINED_FUNCTION_1();
}

__n128 sub_20D1692C4()
{
  uint64_t v0;
  __n128 result;

  result = *(__n128 *)(v0 + 24);
  *(__n128 *)(*(_QWORD *)(v0 + 16) + 16) = result;
  return result;
}

uint64_t sub_20D1692D4()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549A9BB8);
  sub_20D168DB4(&qword_2549A9BC0, &qword_2549A9BB8, sub_20D168D90, MEMORY[0x24BDEBEE0]);
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return sub_20D1675FC();
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_12_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_16_2()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return swift_getKeyPath();
}

double OUTLINED_FUNCTION_21_1()
{
  double v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_24()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return swift_release();
}

void OUTLINED_FUNCTION_26_0()
{
  sub_20D166074();
}

unint64_t OUTLINED_FUNCTION_27_0()
{
  return sub_20D167980();
}

uint64_t OUTLINED_FUNCTION_28()
{
  return swift_allocObject();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

void sub_20D169780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D16D468(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *PECopyEditsSettingIdentifierName(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8)
    return CFSTR("PECopyEditsSettingIdentifierCinematic");
  else
    return off_24C618160[a1 - 1];
}

void sub_20D1747A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_20D175060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

id getVNSceneprintClass()
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
  v0 = (void *)getVNSceneprintClass_softClass;
  v7 = getVNSceneprintClass_softClass;
  if (!getVNSceneprintClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getVNSceneprintClass_block_invoke;
    v3[3] = &unk_24C6184A8;
    v3[4] = &v4;
    __getVNSceneprintClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20D17571C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNSceneprintClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!VisionLibraryCore_frameworkLibrary)
    VisionLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!VisionLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *VisionLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PEEditAction.m"), 54, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("VNSceneprint");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getVNSceneprintClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PEEditAction.m"), 55, CFSTR("Unable to find class %s"), "VNSceneprint");

LABEL_8:
    __break(1u);
  }
  getVNSceneprintClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_20D177D14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Unwind_Resume(a1);
}

id PELocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = a1;
  if (PELocalizedString_once != -1)
    dispatch_once(&PELocalizedString_once, &__block_literal_global_542);
  objc_msgSend((id)PELocalizedString_frameworkBundle, "localizedStringForKey:value:table:", v1, &stru_24C619BD0, CFSTR("PhotosUIEdit"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", v1))
  {
    objc_msgSend((id)PELocalizedString_frameworkBundle, "localizedStringForKey:value:table:", v1, &stru_24C619BD0, CFSTR("PhotosUIEdit-Styles"));
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  if (objc_msgSend(v2, "isEqualToString:", v1))
  {
    objc_msgSend((id)PELocalizedString_frameworkBundle, "localizedStringForKey:value:table:", v1, &stru_24C619BD0, CFSTR("PhotosUIEdit-4K120"));
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
  }
  if (objc_msgSend(v2, "isEqualToString:", v1))
  {
    objc_msgSend((id)PELocalizedString_frameworkBundle, "localizedStringForKey:value:table:", v1, &stru_24C619BD0, CFSTR("PhotosUIEdit-SpatialAudio"));
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
  }

  return v2;
}

id PEStringWithValidatedFormat()
{
  PFStringWithValidatedFormatAndLocale();
  return (id)objc_claimAutoreleasedReturnValue();
}

id PELocalizedStringWithValidatedFormat(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCEA0];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PFStringWithValidatedFormatAndLocale();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

const __CFString *PEEditActionTypeString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 7)
    return CFSTR("Unknown");
  else
    return off_24C618660[a1 - 1];
}

const __CFString *PESCAPReviewFallbackReasonString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6)
    return CFSTR("Unknown");
  else
    return off_24C618720[a1 - 1];
}

const __CFString *PESCAPActionTypeString(uint64_t a1)
{
  if (a1)
    return CFSTR("Smart C&P");
  else
    return CFSTR("Legacy C&P");
}

void sub_20D180F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_20D184990(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1682(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1683(uint64_t a1)
{

}

void sub_20D185320(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_20D1861D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose(&STACK[0x220], 8);
  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose(&STACK[0x280], 8);
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_20D187914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,id location,char a47)
{
  objc_destroyWeak(&location);
  _Block_object_dispose(&a47, 8);
  _Unwind_Resume(a1);
}

void sub_20D187BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_20D187D70(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_20D1882C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1830(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1831(uint64_t a1)
{

}

void sub_20D189434(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D189758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D18A86C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1927(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1928(uint64_t a1)
{

}

uint64_t PECanRenderPortrait()
{
  if (PECanRenderPortrait_onceToken != -1)
    dispatch_once(&PECanRenderPortrait_onceToken, &__block_literal_global_38);
  return PECanRenderPortrait_canRenderPortrait;
}

void sub_20D18D538(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 88));
  _Unwind_Resume(a1);
}

const __CFString *PEPhotoEditSessionEndString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return CFSTR("Saved");
  else
    return off_24C619220[a1 - 1];
}

const __CFString *PEPhotoEditSessionEntryPointString(uint64_t a1)
{
  if (a1)
    return CFSTR("1UPQuickCrop");
  else
    return CFSTR("1UPButton");
}

const __CFString *PEPhotoEditSessionSaveActionTypeString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Save");
  if (a1 == 2)
    v1 = CFSTR("SaveAsDuplicate");
  if (a1 == 1)
    return CFSTR("SaveAsNewClip");
  else
    return v1;
}

void sub_20D18FB6C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2379(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2380(uint64_t a1)
{

}

uint64_t sub_20D19125C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_20D191268()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_20D191274()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_20D191280()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_20D19128C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_20D191298()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_20D1912A4()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_20D1912B0()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_20D1912BC()
{
  return MEMORY[0x24BEE5C48]();
}

uint64_t sub_20D1912C8()
{
  return MEMORY[0x24BEE5C50]();
}

uint64_t sub_20D1912D4()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_20D1912E0()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_20D1912EC()
{
  return MEMORY[0x24BE72880]();
}

uint64_t sub_20D1912F8()
{
  return MEMORY[0x24BEE5118]();
}

uint64_t sub_20D191304()
{
  return MEMORY[0x24BEE5120]();
}

uint64_t sub_20D191310()
{
  return MEMORY[0x24BEE5130]();
}

uint64_t sub_20D19131C()
{
  return MEMORY[0x24BEE6190]();
}

uint64_t sub_20D191328()
{
  return MEMORY[0x24BEE6238]();
}

uint64_t sub_20D191334()
{
  return MEMORY[0x24BEE62B8]();
}

uint64_t sub_20D191340()
{
  return MEMORY[0x24BEE63B8]();
}

uint64_t sub_20D19134C()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_20D191358()
{
  return MEMORY[0x24BDEAE98]();
}

uint64_t sub_20D191364()
{
  return MEMORY[0x24BDEAEB0]();
}

uint64_t sub_20D191370()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_20D19137C()
{
  return MEMORY[0x24BDEB330]();
}

uint64_t sub_20D191388()
{
  return MEMORY[0x24BDEB338]();
}

uint64_t sub_20D191394()
{
  return MEMORY[0x24BDEB4C0]();
}

uint64_t sub_20D1913A0()
{
  return MEMORY[0x24BDEB4D0]();
}

uint64_t sub_20D1913AC()
{
  return MEMORY[0x24BDEB4F8]();
}

uint64_t sub_20D1913B8()
{
  return MEMORY[0x24BDEB500]();
}

uint64_t sub_20D1913C4()
{
  return MEMORY[0x24BDEB540]();
}

uint64_t sub_20D1913D0()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_20D1913DC()
{
  return MEMORY[0x24BDEB5B8]();
}

uint64_t sub_20D1913E8()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_20D1913F4()
{
  return MEMORY[0x24BDEB938]();
}

uint64_t sub_20D191400()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_20D19140C()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_20D191418()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_20D191424()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_20D191430()
{
  return MEMORY[0x24BDEBF88]();
}

uint64_t sub_20D19143C()
{
  return MEMORY[0x24BDEBF98]();
}

uint64_t sub_20D191448()
{
  return MEMORY[0x24BDEBFA0]();
}

uint64_t sub_20D191454()
{
  return MEMORY[0x24BDEBFD0]();
}

uint64_t sub_20D191460()
{
  return MEMORY[0x24BDEBFF0]();
}

uint64_t sub_20D19146C()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_20D191478()
{
  return MEMORY[0x24BDEC138]();
}

uint64_t sub_20D191484()
{
  return MEMORY[0x24BDEC148]();
}

uint64_t sub_20D191490()
{
  return MEMORY[0x24BDEC498]();
}

uint64_t sub_20D19149C()
{
  return MEMORY[0x24BDEC4A0]();
}

uint64_t sub_20D1914A8()
{
  return MEMORY[0x24BDEC590]();
}

uint64_t sub_20D1914B4()
{
  return MEMORY[0x24BDEC5A0]();
}

uint64_t sub_20D1914C0()
{
  return MEMORY[0x24BDEC648]();
}

uint64_t sub_20D1914CC()
{
  return MEMORY[0x24BDEC7B0]();
}

uint64_t sub_20D1914D8()
{
  return MEMORY[0x24BDECCA0]();
}

uint64_t sub_20D1914E4()
{
  return MEMORY[0x24BDECCC0]();
}

uint64_t sub_20D1914F0()
{
  return MEMORY[0x24BDED0F0]();
}

uint64_t sub_20D1914FC()
{
  return MEMORY[0x24BDED128]();
}

uint64_t sub_20D191508()
{
  return MEMORY[0x24BDED130]();
}

uint64_t sub_20D191514()
{
  return MEMORY[0x24BDED198]();
}

uint64_t sub_20D191520()
{
  return MEMORY[0x24BDED1F8]();
}

uint64_t sub_20D19152C()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_20D191538()
{
  return MEMORY[0x24BDED438]();
}

uint64_t sub_20D191544()
{
  return MEMORY[0x24BDED440]();
}

uint64_t sub_20D191550()
{
  return MEMORY[0x24BDED448]();
}

uint64_t sub_20D19155C()
{
  return MEMORY[0x24BDED458]();
}

uint64_t sub_20D191568()
{
  return MEMORY[0x24BDED460]();
}

uint64_t sub_20D191574()
{
  return MEMORY[0x24BDED468]();
}

uint64_t sub_20D191580()
{
  return MEMORY[0x24BDED470]();
}

uint64_t sub_20D19158C()
{
  return MEMORY[0x24BDED480]();
}

uint64_t sub_20D191598()
{
  return MEMORY[0x24BDED4E0]();
}

uint64_t sub_20D1915A4()
{
  return MEMORY[0x24BDED7A8]();
}

uint64_t sub_20D1915B0()
{
  return MEMORY[0x24BDED860]();
}

uint64_t sub_20D1915BC()
{
  return MEMORY[0x24BDED868]();
}

uint64_t sub_20D1915C8()
{
  return MEMORY[0x24BDED970]();
}

uint64_t sub_20D1915D4()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_20D1915E0()
{
  return MEMORY[0x24BDEDB60]();
}

uint64_t sub_20D1915EC()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_20D1915F8()
{
  return MEMORY[0x24BDEDBF0]();
}

uint64_t sub_20D191604()
{
  return MEMORY[0x24BDEDD60]();
}

uint64_t sub_20D191610()
{
  return MEMORY[0x24BDEDDD8]();
}

uint64_t sub_20D19161C()
{
  return MEMORY[0x24BDEE070]();
}

uint64_t sub_20D191628()
{
  return MEMORY[0x24BDEE080]();
}

uint64_t sub_20D191634()
{
  return MEMORY[0x24BDEE148]();
}

uint64_t sub_20D191640()
{
  return MEMORY[0x24BDEE150]();
}

uint64_t sub_20D19164C()
{
  return MEMORY[0x24BDEE190]();
}

uint64_t sub_20D191658()
{
  return MEMORY[0x24BDEE198]();
}

uint64_t sub_20D191664()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_20D191670()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_20D19167C()
{
  return MEMORY[0x24BDEE468]();
}

uint64_t sub_20D191688()
{
  return MEMORY[0x24BDEE478]();
}

uint64_t sub_20D191694()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_20D1916A0()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_20D1916AC()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_20D1916B8()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_20D1916C4()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_20D1916D0()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_20D1916DC()
{
  return MEMORY[0x24BDEE6F8]();
}

uint64_t sub_20D1916E8()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_20D1916F4()
{
  return MEMORY[0x24BDEE8B8]();
}

uint64_t sub_20D191700()
{
  return MEMORY[0x24BDEE9E8]();
}

uint64_t sub_20D19170C()
{
  return MEMORY[0x24BDEEA28]();
}

uint64_t sub_20D191718()
{
  return MEMORY[0x24BDEEA30]();
}

uint64_t sub_20D191724()
{
  return MEMORY[0x24BDEEA40]();
}

uint64_t sub_20D191730()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_20D19173C()
{
  return MEMORY[0x24BDEEA60]();
}

uint64_t sub_20D191748()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_20D191754()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_20D191760()
{
  return MEMORY[0x24BDEF0D0]();
}

uint64_t sub_20D19176C()
{
  return MEMORY[0x24BDEF0E8]();
}

uint64_t sub_20D191778()
{
  return MEMORY[0x24BDEF190]();
}

uint64_t sub_20D191784()
{
  return MEMORY[0x24BDEF1A0]();
}

uint64_t sub_20D191790()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_20D19179C()
{
  return MEMORY[0x24BDEF350]();
}

uint64_t sub_20D1917A8()
{
  return MEMORY[0x24BDEF358]();
}

uint64_t sub_20D1917B4()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_20D1917C0()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_20D1917CC()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_20D1917D8()
{
  return MEMORY[0x24BDEF540]();
}

uint64_t sub_20D1917E4()
{
  return MEMORY[0x24BDEF950]();
}

uint64_t sub_20D1917F0()
{
  return MEMORY[0x24BDEFA58]();
}

uint64_t sub_20D1917FC()
{
  return MEMORY[0x24BDEFB50]();
}

uint64_t sub_20D191808()
{
  return MEMORY[0x24BDF0138]();
}

uint64_t sub_20D191814()
{
  return MEMORY[0x24BDF0158]();
}

uint64_t sub_20D191820()
{
  return MEMORY[0x24BDF0250]();
}

uint64_t sub_20D19182C()
{
  return MEMORY[0x24BDF0A10]();
}

uint64_t sub_20D191838()
{
  return MEMORY[0x24BDF0A20]();
}

uint64_t sub_20D191844()
{
  return MEMORY[0x24BDF0BD8]();
}

uint64_t sub_20D191850()
{
  return MEMORY[0x24BDF0BF8]();
}

uint64_t sub_20D19185C()
{
  return MEMORY[0x24BDF1220]();
}

uint64_t sub_20D191868()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_20D191874()
{
  return MEMORY[0x24BDF1450]();
}

uint64_t sub_20D191880()
{
  return MEMORY[0x24BDF1458]();
}

uint64_t sub_20D19188C()
{
  return MEMORY[0x24BDF1468]();
}

uint64_t sub_20D191898()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_20D1918A4()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_20D1918B0()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_20D1918BC()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_20D1918C8()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_20D1918D4()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_20D1918E0()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_20D1918EC()
{
  return MEMORY[0x24BDF1950]();
}

uint64_t sub_20D1918F8()
{
  return MEMORY[0x24BDF1AF0]();
}

uint64_t sub_20D191904()
{
  return MEMORY[0x24BDF1B30]();
}

uint64_t sub_20D191910()
{
  return MEMORY[0x24BDF1BD0]();
}

uint64_t sub_20D19191C()
{
  return MEMORY[0x24BDF1D20]();
}

uint64_t sub_20D191928()
{
  return MEMORY[0x24BDF1D48]();
}

uint64_t sub_20D191934()
{
  return MEMORY[0x24BDF1EC0]();
}

uint64_t sub_20D191940()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_20D19194C()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_20D191958()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_20D191964()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_20D191970()
{
  return MEMORY[0x24BDF20D8]();
}

uint64_t sub_20D19197C()
{
  return MEMORY[0x24BDF2110]();
}

uint64_t sub_20D191988()
{
  return MEMORY[0x24BDF2138]();
}

uint64_t sub_20D191994()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_20D1919A0()
{
  return MEMORY[0x24BDF24D0]();
}

uint64_t sub_20D1919AC()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_20D1919B8()
{
  return MEMORY[0x24BDF2860]();
}

uint64_t sub_20D1919C4()
{
  return MEMORY[0x24BDF28D8]();
}

uint64_t sub_20D1919D0()
{
  return MEMORY[0x24BDF28E8]();
}

uint64_t sub_20D1919DC()
{
  return MEMORY[0x24BDF2B50]();
}

uint64_t sub_20D1919E8()
{
  return MEMORY[0x24BDF2DC0]();
}

uint64_t sub_20D1919F4()
{
  return MEMORY[0x24BDF2F08]();
}

uint64_t sub_20D191A00()
{
  return MEMORY[0x24BDF33C8]();
}

uint64_t sub_20D191A0C()
{
  return MEMORY[0x24BDF3768]();
}

uint64_t sub_20D191A18()
{
  return MEMORY[0x24BDF37A8]();
}

uint64_t sub_20D191A24()
{
  return MEMORY[0x24BDF37B0]();
}

uint64_t sub_20D191A30()
{
  return MEMORY[0x24BDF3960]();
}

uint64_t sub_20D191A3C()
{
  return MEMORY[0x24BDF3978]();
}

uint64_t sub_20D191A48()
{
  return MEMORY[0x24BDF3980]();
}

uint64_t sub_20D191A54()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_20D191A60()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_20D191A6C()
{
  return MEMORY[0x24BDF3C50]();
}

uint64_t sub_20D191A78()
{
  return MEMORY[0x24BDF3CA8]();
}

uint64_t sub_20D191A84()
{
  return MEMORY[0x24BDF3CB8]();
}

uint64_t sub_20D191A90()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_20D191A9C()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_20D191AA8()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_20D191AB4()
{
  return MEMORY[0x24BDF3D78]();
}

uint64_t sub_20D191AC0()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_20D191ACC()
{
  return MEMORY[0x24BDF3E70]();
}

uint64_t sub_20D191AD8()
{
  return MEMORY[0x24BDF3E78]();
}

uint64_t sub_20D191AE4()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_20D191AF0()
{
  return MEMORY[0x24BDF3F68]();
}

uint64_t sub_20D191AFC()
{
  return MEMORY[0x24BDF3F70]();
}

uint64_t sub_20D191B08()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_20D191B14()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_20D191B20()
{
  return MEMORY[0x24BDF4050]();
}

uint64_t sub_20D191B2C()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_20D191B38()
{
  return MEMORY[0x24BDF4208]();
}

uint64_t sub_20D191B44()
{
  return MEMORY[0x24BDF4218]();
}

uint64_t sub_20D191B50()
{
  return MEMORY[0x24BDF4230]();
}

uint64_t sub_20D191B5C()
{
  return MEMORY[0x24BDF4238]();
}

uint64_t sub_20D191B68()
{
  return MEMORY[0x24BDF4248]();
}

uint64_t sub_20D191B74()
{
  return MEMORY[0x24BDF4278]();
}

uint64_t sub_20D191B80()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_20D191B8C()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_20D191B98()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_20D191BA4()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_20D191BB0()
{
  return MEMORY[0x24BDF44B0]();
}

uint64_t sub_20D191BBC()
{
  return MEMORY[0x24BDF4728]();
}

uint64_t sub_20D191BC8()
{
  return MEMORY[0x24BDF4730]();
}

uint64_t sub_20D191BD4()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_20D191BE0()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_20D191BEC()
{
  return MEMORY[0x24BDF48E8]();
}

uint64_t sub_20D191BF8()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_20D191C04()
{
  return MEMORY[0x24BDF4A28]();
}

uint64_t sub_20D191C10()
{
  return MEMORY[0x24BDF4A40]();
}

uint64_t sub_20D191C1C()
{
  return MEMORY[0x24BDF4BE0]();
}

uint64_t sub_20D191C28()
{
  return MEMORY[0x24BDF4C00]();
}

uint64_t sub_20D191C34()
{
  return MEMORY[0x24BDF4C08]();
}

uint64_t sub_20D191C40()
{
  return MEMORY[0x24BDF4C18]();
}

uint64_t sub_20D191C4C()
{
  return MEMORY[0x24BDF4C28]();
}

uint64_t sub_20D191C58()
{
  return MEMORY[0x24BDF4CE0]();
}

uint64_t sub_20D191C64()
{
  return MEMORY[0x24BDF4D00]();
}

uint64_t sub_20D191C70()
{
  return MEMORY[0x24BDF4D08]();
}

uint64_t sub_20D191C7C()
{
  return MEMORY[0x24BDF4DF8]();
}

uint64_t sub_20D191C88()
{
  return MEMORY[0x24BDF4E28]();
}

uint64_t sub_20D191C94()
{
  return MEMORY[0x24BDF4E30]();
}

uint64_t sub_20D191CA0()
{
  return MEMORY[0x24BDF4E58]();
}

uint64_t sub_20D191CAC()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_20D191CB8()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_20D191CC4()
{
  return MEMORY[0x24BDF4F70]();
}

uint64_t sub_20D191CD0()
{
  return MEMORY[0x24BDF4F78]();
}

uint64_t sub_20D191CDC()
{
  return MEMORY[0x24BDF4F98]();
}

uint64_t sub_20D191CE8()
{
  return MEMORY[0x24BDF4FB0]();
}

uint64_t sub_20D191CF4()
{
  return MEMORY[0x24BDF4FC8]();
}

uint64_t sub_20D191D00()
{
  return MEMORY[0x24BDF4FE0]();
}

uint64_t sub_20D191D0C()
{
  return MEMORY[0x24BDF4FF0]();
}

uint64_t sub_20D191D18()
{
  return MEMORY[0x24BDF5010]();
}

uint64_t sub_20D191D24()
{
  return MEMORY[0x24BDF5118]();
}

uint64_t sub_20D191D30()
{
  return MEMORY[0x24BDF53F0]();
}

uint64_t sub_20D191D3C()
{
  return MEMORY[0x24BDF5418]();
}

uint64_t sub_20D191D48()
{
  return MEMORY[0x24BDF5478]();
}

uint64_t sub_20D191D54()
{
  return MEMORY[0x24BDF5490]();
}

uint64_t sub_20D191D60()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_20D191D6C()
{
  return MEMORY[0x24BDF54A8]();
}

uint64_t sub_20D191D78()
{
  return MEMORY[0x24BDF54B0]();
}

uint64_t sub_20D191D84()
{
  return MEMORY[0x24BDF55D8]();
}

uint64_t sub_20D191D90()
{
  return MEMORY[0x24BDF55E8]();
}

uint64_t sub_20D191D9C()
{
  return MEMORY[0x24BDF55F0]();
}

uint64_t sub_20D191DA8()
{
  return MEMORY[0x24BDF5620]();
}

uint64_t sub_20D191DB4()
{
  return MEMORY[0x24BDF5628]();
}

uint64_t sub_20D191DC0()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_20D191DCC()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_20D191DD8()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_20D191DE4()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_20D191DF0()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_20D191DFC()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_20D191E08()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_20D191E14()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_20D191E20()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_20D191E2C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_20D191E38()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_20D191E44()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_20D191E50()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_20D191E5C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_20D191E68()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_20D191E74()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_20D191E80()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_20D191E8C()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_20D191E98()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_20D191EA4()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_20D191EB0()
{
  return MEMORY[0x24BE72B48]();
}

uint64_t sub_20D191EBC()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_20D191EC8()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_20D191ED4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_20D191EE0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_20D191EEC()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_20D191EF8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_20D191F04()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_20D191F10()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_20D191F1C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_20D191F28()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_20D191F34()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_20D191F40()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_20D191F4C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_20D191F58()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_20D191F64()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_20D191F70()
{
  return MEMORY[0x24BEE4328]();
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9058](idst, isrc, index, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9088](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9170](data, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x24BDD9188](isrc);
}

size_t CGImageSourceGetPrimaryImageIndex(CGImageSourceRef isrc)
{
  return MEMORY[0x24BDD9190](isrc);
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

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x24BDBF058]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF078]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CMTime *__cdecl CMTimeClampToRange(CMTime *__return_ptr retstr, CMTime *time, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x24BDC0430](retstr, time, range);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x24BDC0450](time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x24BDC0490](time);
  return result;
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x24BDC0550](retstr, start, end);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x24BDC0558](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x24BDC0580](retstr, start, duration);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x24BDC05A0](retstr, lhs, rhs);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t NUOrientationConcat()
{
  return MEMORY[0x24BE6C288]();
}

uint64_t NUOrientationInverse()
{
  return MEMORY[0x24BE6C290]();
}

uint64_t NUOrientationIsValid()
{
  return MEMORY[0x24BE6C298]();
}

uint64_t NUOrientationName()
{
  return MEMORY[0x24BE6C2A0]();
}

uint64_t NUOrientationTransformImageSize()
{
  return MEMORY[0x24BE6C2A8]();
}

uint64_t NUOrientationTransformRect()
{
  return MEMORY[0x24BE6C2B0]();
}

uint64_t NUOrientationTransformSize()
{
  return MEMORY[0x24BE6C2B8]();
}

uint64_t NUPixelRectToCGRect()
{
  return MEMORY[0x24BE6C2F0]();
}

uint64_t NUPixelSizeFromCGSize()
{
  return MEMORY[0x24BE6C300]();
}

uint64_t PFExists()
{
  return MEMORY[0x24BE71B90]();
}

uint64_t PFFilter()
{
  return MEMORY[0x24BE71B98]();
}

uint64_t PFFind()
{
  return MEMORY[0x24BE71BA0]();
}

uint64_t PFSizeWithAspectRatioFittingSize()
{
  return MEMORY[0x24BE71C00]();
}

uint64_t PFStringWithValidatedFormatAndLocale()
{
  return MEMORY[0x24BE71C18]();
}

uint64_t PFVideoComplementMetadataForVideoAtPath()
{
  return MEMORY[0x24BE72578]();
}

uint64_t PHVideoComplementVisibilityStateIsPlayable()
{
  return MEMORY[0x24BDE38D8]();
}

uint64_t PIAutoLoopFlavorFromString()
{
  return MEMORY[0x24BE71D58]();
}

uint64_t PIAutoLoopFlavorProducesOnlyVideo()
{
  return MEMORY[0x24BE71D60]();
}

uint64_t PICinematicAudioIsRenderSupported()
{
  return MEMORY[0x24BE71D78]();
}

uint64_t PISemanticStyleIsRenderSupported()
{
  return MEMORY[0x24BE71F00]();
}

uint64_t PLPhotoEditGetLog()
{
  return MEMORY[0x24BE722E0]();
}

uint64_t PXMonospacedNumberFontWithSizeAndWeight()
{
  return MEMORY[0x24BE72C50]();
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

uint64_t _PFAssertContinueHandler()
{
  return MEMORY[0x24BE71C28]();
}

uint64_t _PFAssertFailHandler()
{
  return MEMORY[0x24BE71C30]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
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

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
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

