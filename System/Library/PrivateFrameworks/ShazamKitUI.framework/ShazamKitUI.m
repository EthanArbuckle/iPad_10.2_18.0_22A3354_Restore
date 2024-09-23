void sub_2287ABBD0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_2287B0468(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2287B0488(uint64_t result, int a2, int a3)
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
  sub_2287B16A4(a1, &qword_2559BD328);
}

void type metadata accessor for SHError(uint64_t a1)
{
  sub_2287B16A4(a1, &qword_2559BD330);
}

void type metadata accessor for SHListeningLayerState(uint64_t a1)
{
  sub_2287B16A4(a1, &qword_2559BD338);
}

ValueMetadata *type metadata accessor for AttributedListeningView()
{
  return &type metadata for AttributedListeningView;
}

uint64_t sub_2287B04FC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2287B050C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;

  result = sub_2287CD5A4();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 24) = sub_2287B0544;
  *(_QWORD *)(a1 + 32) = 0;
  return result;
}

double sub_2287B0544@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  double result;
  __int128 v8;
  _OWORD v9[8];
  _OWORD v10[2];
  _BYTE v11[160];

  v2 = sub_2287CD538();
  sub_2287B065C((uint64_t)v9);
  *(_OWORD *)&v11[119] = v9[7];
  *(_OWORD *)&v11[103] = v9[6];
  *(_OWORD *)&v11[55] = v9[3];
  *(_OWORD *)&v11[39] = v9[2];
  *(_OWORD *)&v11[135] = v10[0];
  *(_OWORD *)&v11[144] = *(_OWORD *)((char *)v10 + 9);
  *(_OWORD *)&v11[71] = v9[4];
  *(_OWORD *)&v11[87] = v9[5];
  *(_OWORD *)&v11[7] = v9[0];
  *(_OWORD *)&v11[23] = v9[1];
  v3 = *(_OWORD *)&v11[112];
  *(_OWORD *)(a1 + 113) = *(_OWORD *)&v11[96];
  *(_OWORD *)(a1 + 129) = v3;
  v4 = *(_OWORD *)&v11[144];
  *(_OWORD *)(a1 + 145) = *(_OWORD *)&v11[128];
  *(_OWORD *)(a1 + 161) = v4;
  v5 = *(_OWORD *)&v11[48];
  *(_OWORD *)(a1 + 49) = *(_OWORD *)&v11[32];
  *(_OWORD *)(a1 + 65) = v5;
  v6 = *(_OWORD *)&v11[80];
  *(_OWORD *)(a1 + 81) = *(_OWORD *)&v11[64];
  *(_OWORD *)(a1 + 97) = v6;
  result = *(double *)v11;
  v8 = *(_OWORD *)&v11[16];
  *(_OWORD *)(a1 + 17) = *(_OWORD *)v11;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_OWORD *)(a1 + 33) = v8;
  return result;
}

uint64_t sub_2287B065C@<X0>(uint64_t a1@<X8>)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  __int128 v16;
  _BYTE v17[7];
  _BYTE v18[7];
  int v19;
  __int16 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[32];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  char v28;
  _BYTE v29[135];
  char v30;
  _BYTE v31[24];
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int16 v36;
  int v37;
  __int16 v38;
  uint64_t v39;
  char v40;
  _BYTE v41[7];
  uint64_t v42;
  char v43;
  _BYTE v44[7];
  __int128 v45;

  type metadata accessor for SHListeningLayerState(0);
  sub_2287CD8B0();
  v11 = *(_QWORD *)&v29[16];
  swift_retain();
  swift_retain();
  sub_2287CD8B0();
  v3 = *(_OWORD *)&v31[8];
  sub_2287CD8B0();
  swift_release();
  swift_release();
  v4 = *(_OWORD *)&v31[8];
  sub_2287CD430();
  sub_2287CD430();
  sub_2287CD8F8();
  sub_2287CD424();
  v37 = v19;
  v38 = v20;
  *(_DWORD *)v41 = *(_DWORD *)v18;
  *(_DWORD *)&v41[3] = *(_DWORD *)&v18[3];
  *(_DWORD *)&v44[3] = *(_DWORD *)&v17[3];
  *(_DWORD *)v44 = *(_DWORD *)v17;
  *(_WORD *)&v24[30] = v20;
  *(_DWORD *)&v24[26] = v19;
  HIDWORD(v25) = *(_DWORD *)&v18[3];
  v21 = *(_OWORD *)v29;
  *(_QWORD *)&v22 = *(_QWORD *)&v29[16];
  *((_QWORD *)&v22 + 1) = 4;
  v23 = *(_OWORD *)&v31[8];
  *(_QWORD *)v24 = 4;
  *(_OWORD *)&v24[8] = *(_OWORD *)&v31[8];
  *(_WORD *)&v24[24] = 0;
  *(_QWORD *)&v25 = v12;
  BYTE8(v25) = v13;
  *(_DWORD *)((char *)&v25 + 9) = *(_DWORD *)v18;
  *(_QWORD *)&v26 = v14;
  BYTE8(v26) = v15;
  *(_DWORD *)((char *)&v26 + 9) = *(_DWORD *)v17;
  HIDWORD(v26) = *(_DWORD *)&v17[3];
  v27 = v16;
  v30 = 1;
  *(_OWORD *)&v29[55] = *(_OWORD *)v24;
  *(_OWORD *)&v29[39] = *(_OWORD *)&v31[8];
  *(_OWORD *)&v29[23] = v22;
  *(_OWORD *)&v29[7] = *(_OWORD *)v29;
  v2 = *(_OWORD *)&v29[7];
  *(_OWORD *)&v29[119] = v16;
  *(_OWORD *)&v29[103] = v26;
  *(_OWORD *)&v29[87] = v25;
  *(_OWORD *)&v29[71] = *(_OWORD *)&v24[16];
  v28 = 1;
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
  v5 = *(_OWORD *)&v29[16];
  *(_OWORD *)(a1 + 9) = *(_OWORD *)v29;
  v6 = *(_OWORD *)&v29[80];
  *(_OWORD *)(a1 + 73) = *(_OWORD *)&v29[64];
  v7 = *(_OWORD *)&v29[32];
  *(_OWORD *)(a1 + 57) = *(_OWORD *)&v29[48];
  *(_OWORD *)(a1 + 41) = v7;
  *(_OWORD *)(a1 + 25) = v5;
  v8 = *(_OWORD *)&v29[96];
  v9 = *(_OWORD *)&v29[112];
  *(_QWORD *)(a1 + 136) = *(_QWORD *)&v29[127];
  *(_QWORD *)(a1 + 144) = 0;
  *(_OWORD *)(a1 + 121) = v9;
  *(_OWORD *)(a1 + 105) = v8;
  *(_OWORD *)(a1 + 89) = v6;
  *(_BYTE *)(a1 + 152) = 1;
  *(_OWORD *)v31 = v2;
  *(_QWORD *)&v31[16] = v11;
  v32 = 4;
  v33 = v3;
  v34 = 4;
  v35 = v4;
  v36 = 0;
  v39 = v12;
  v40 = v13;
  v42 = v14;
  v43 = v15;
  v45 = v16;
  sub_2287B1360((uint64_t)&v21);
  return sub_2287B13CC((uint64_t)v31);
}

uint64_t sub_2287B091C()
{
  return sub_2287CD7A8();
}

uint64_t sub_2287B0938(uint64_t a1, uint64_t a2)
{
  return sub_2287B0A80(a1, a2, MEMORY[0x24BEE0CD8]);
}

id sub_2287B0958()
{
  id *v0;

  return *v0;
}

uint64_t sub_2287B0960@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_2287B0968()
{
  sub_2287B108C(&qword_2559BD388, (uint64_t (*)(uint64_t))type metadata accessor for SHError, (uint64_t)&unk_2287CF4E0);
  return sub_2287CD250();
}

uint64_t sub_2287B09C0(uint64_t a1, uint64_t a2)
{
  return sub_2287B0A80(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_2287B09CC()
{
  sub_2287CD9D0();
  sub_2287CD9DC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2287B0A0C()
{
  uint64_t v0;

  sub_2287CD9D0();
  sub_2287CDC10();
  sub_2287CD9DC();
  v0 = sub_2287CDC1C();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2287B0A80(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_2287CD9D0();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2287B0ABC(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_2287CD9B8();
  *a2 = 0;
  return result;
}

uint64_t sub_2287B0B30(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_2287CD9C4();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2287B0BAC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_2287CD9D0();
  v2 = sub_2287CD9A0();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2287B0BEC()
{
  return sub_2287CD9D0();
}

uint64_t sub_2287B0BFC()
{
  sub_2287B108C(&qword_2559BD388, (uint64_t (*)(uint64_t))type metadata accessor for SHError, (uint64_t)&unk_2287CF4E0);
  return sub_2287CD268();
}

uint64_t sub_2287B0C3C()
{
  sub_2287B108C(&qword_2559BD388, (uint64_t (*)(uint64_t))type metadata accessor for SHError, (uint64_t)&unk_2287CF4E0);
  return sub_2287CD244();
}

uint64_t sub_2287B0C7C(void *a1)
{
  id v2;

  sub_2287B108C(&qword_2559BD388, (uint64_t (*)(uint64_t))type metadata accessor for SHError, (uint64_t)&unk_2287CF4E0);
  v2 = a1;
  return sub_2287CD238();
}

uint64_t sub_2287B0CE0()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = *v0;
  v2 = sub_2287CDAA8();

  return v2;
}

uint64_t sub_2287B0D14()
{
  sub_2287B108C(&qword_2559BD388, (uint64_t (*)(uint64_t))type metadata accessor for SHError, (uint64_t)&unk_2287CF4E0);
  return sub_2287CD25C();
}

uint64_t sub_2287B0D64()
{
  sub_2287CDC10();
  sub_2287CD97C();
  return sub_2287CDC1C();
}

_QWORD *sub_2287B0DC0@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_2287B0DD0(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_2287B0DDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_2287CD9D0();
  v2 = v1;
  if (v0 == sub_2287CD9D0() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_2287CDBD4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2287B0E68()
{
  sub_2287B108C(&qword_2559BD408, (uint64_t (*)(uint64_t))type metadata accessor for DocumentAttributeKey, (uint64_t)&unk_2287CF9C4);
  sub_2287B108C(&qword_2559BD410, (uint64_t (*)(uint64_t))type metadata accessor for DocumentAttributeKey, (uint64_t)&unk_2287CF924);
  return sub_2287CDBBC();
}

uint64_t sub_2287B0EEC()
{
  sub_2287B108C(&qword_2559BD418, (uint64_t (*)(uint64_t))type metadata accessor for DocumentReadingOptionKey, (uint64_t)&unk_2287CFA04);
  sub_2287B108C(&qword_2559BD420, (uint64_t (*)(uint64_t))type metadata accessor for DocumentReadingOptionKey, (uint64_t)&unk_2287CF824);
  return sub_2287CDBBC();
}

uint64_t sub_2287B0F70()
{
  sub_2287B108C(&qword_2559BD350, (uint64_t (*)(uint64_t))type metadata accessor for SHError, (uint64_t)&unk_2287CF49C);
  return sub_2287CDBF8();
}

uint64_t sub_2287B0FB0()
{
  sub_2287B108C(&qword_2559BD350, (uint64_t (*)(uint64_t))type metadata accessor for SHError, (uint64_t)&unk_2287CF49C);
  return sub_2287CDBEC();
}

uint64_t sub_2287B0FF4()
{
  sub_2287B108C(&qword_2559BD388, (uint64_t (*)(uint64_t))type metadata accessor for SHError, (uint64_t)&unk_2287CF4E0);
  return sub_2287CD22C();
}

uint64_t sub_2287B1034()
{
  return sub_2287B108C((unint64_t *)&qword_2559BD340, (uint64_t (*)(uint64_t))type metadata accessor for SHError, (uint64_t)&unk_2287CF3B4);
}

uint64_t sub_2287B1060()
{
  return sub_2287B108C(&qword_2559BD348, (uint64_t (*)(uint64_t))type metadata accessor for SHError, (uint64_t)&unk_2287CF3E0);
}

uint64_t sub_2287B108C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22E2B5980](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2287B10CC()
{
  return sub_2287B108C(&qword_2559BD350, (uint64_t (*)(uint64_t))type metadata accessor for SHError, (uint64_t)&unk_2287CF49C);
}

uint64_t sub_2287B10F8()
{
  return sub_2287B108C(&qword_2559BD358, (uint64_t (*)(uint64_t))type metadata accessor for SHError, (uint64_t)&unk_2287CF468);
}

uint64_t sub_2287B1124()
{
  return sub_2287B108C(&qword_2559BD360, (uint64_t (*)(uint64_t))type metadata accessor for SHError, (uint64_t)&unk_2287CF424);
}

uint64_t sub_2287B1150()
{
  return sub_2287B108C(&qword_2559BD368, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_2287CF588);
}

void type metadata accessor for Code(uint64_t a1)
{
  sub_2287B16A4(a1, &qword_2559BD3A8);
}

uint64_t sub_2287B1190()
{
  return sub_2287B108C(&qword_2559BD370, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_2287CF54C);
}

unint64_t sub_2287B11C0()
{
  unint64_t result;

  result = qword_2559BD378;
  if (!qword_2559BD378)
  {
    result = MEMORY[0x22E2B5980](MEMORY[0x24BEE17C8], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_2559BD378);
  }
  return result;
}

uint64_t sub_2287B1204()
{
  return sub_2287B108C(&qword_2559BD380, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_2287CF5C4);
}

uint64_t sub_2287B1230()
{
  return sub_2287B108C(&qword_2559BD388, (uint64_t (*)(uint64_t))type metadata accessor for SHError, (uint64_t)&unk_2287CF4E0);
}

BOOL sub_2287B125C(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2287B1270@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2287CD9A0();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2287B12B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2287CD9D0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2287B12DC()
{
  sub_2287B108C((unint64_t *)&qword_2559BD428, (uint64_t (*)(uint64_t))type metadata accessor for SHAnalyticsPayload, (uint64_t)&unk_2287CFA44);
  sub_2287B108C(&qword_2559BD430, (uint64_t (*)(uint64_t))type metadata accessor for SHAnalyticsPayload, (uint64_t)&unk_2287CF724);
  return sub_2287CDBBC();
}

uint64_t sub_2287B1360(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_2287B13CC(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

void type metadata accessor for DocumentAttributeKey(uint64_t a1)
{
  sub_2287B16A4(a1, &qword_2559BD390);
}

void type metadata accessor for DocumentReadingOptionKey(uint64_t a1)
{
  sub_2287B16A4(a1, &qword_2559BD398);
}

void type metadata accessor for SHAnalyticsPayload(uint64_t a1)
{
  sub_2287B16A4(a1, &qword_2559BD3A0);
}

unint64_t sub_2287B1474()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2559BD3B0;
  if (!qword_2559BD3B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BD3B8);
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDF4700], v1);
    atomic_store(result, (unint64_t *)&qword_2559BD3B0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2B5974](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2287B1504()
{
  return sub_2287B108C(&qword_2559BD3C0, (uint64_t (*)(uint64_t))type metadata accessor for SHAnalyticsPayload, (uint64_t)&unk_2287CF6EC);
}

uint64_t sub_2287B1530()
{
  return sub_2287B108C(&qword_2559BD3C8, (uint64_t (*)(uint64_t))type metadata accessor for SHAnalyticsPayload, (uint64_t)&unk_2287CF6C4);
}

uint64_t sub_2287B155C()
{
  return sub_2287B108C(&qword_2559BD3D0, (uint64_t (*)(uint64_t))type metadata accessor for DocumentReadingOptionKey, (uint64_t)&unk_2287CF7EC);
}

uint64_t sub_2287B1588()
{
  return sub_2287B108C(&qword_2559BD3D8, (uint64_t (*)(uint64_t))type metadata accessor for DocumentReadingOptionKey, (uint64_t)&unk_2287CF7C4);
}

uint64_t sub_2287B15B4()
{
  return sub_2287B108C(&qword_2559BD3E0, (uint64_t (*)(uint64_t))type metadata accessor for DocumentAttributeKey, (uint64_t)&unk_2287CF8EC);
}

uint64_t sub_2287B15E0()
{
  return sub_2287B108C(&qword_2559BD3E8, (uint64_t (*)(uint64_t))type metadata accessor for DocumentAttributeKey, (uint64_t)&unk_2287CF8C4);
}

uint64_t sub_2287B160C()
{
  return sub_2287B108C(&qword_2559BD3F0, (uint64_t (*)(uint64_t))type metadata accessor for DocumentAttributeKey, (uint64_t)&unk_2287CF954);
}

uint64_t sub_2287B1638()
{
  return sub_2287B108C(&qword_2559BD3F8, (uint64_t (*)(uint64_t))type metadata accessor for DocumentReadingOptionKey, (uint64_t)&unk_2287CF854);
}

uint64_t sub_2287B1664()
{
  return sub_2287B108C(&qword_2559BD400, (uint64_t (*)(uint64_t))type metadata accessor for SHAnalyticsPayload, (uint64_t)&unk_2287CF754);
}

void type metadata accessor for SHMediaItemPresentationStyle(uint64_t a1)
{
  sub_2287B16A4(a1, &qword_2559BD438);
}

void sub_2287B16A4(uint64_t a1, unint64_t *a2)
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

void sub_2287B16F0(char a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v6 = sub_2287CD298();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) == 0 && a2)
  {
    v10 = a2;
    if (qword_2559BD320 != -1)
      swift_once();
    v11 = sub_2287CD328();
    __swift_project_value_buffer(v11, (uint64_t)qword_2559C0880);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a3, v6);
    v12 = a2;
    v13 = a2;
    v14 = sub_2287CD310();
    v15 = sub_2287CDA78();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = swift_slowAlloc();
      v23 = (_QWORD *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      v26 = v24;
      *(_DWORD *)v16 = 136315394;
      sub_2287B23B8();
      v17 = sub_2287CDBC8();
      v25 = sub_2287B1A20(v17, v18, &v26);
      sub_2287CDB14();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      *(_WORD *)(v16 + 12) = 2112;
      v19 = a2;
      v20 = _swift_stdlib_bridgeErrorToNSError();
      v25 = v20;
      sub_2287CDB14();
      v21 = v23;
      *v23 = v20;

      _os_log_impl(&dword_2287A6000, v14, v15, "Failed to launch url: %s error: %@", (uint8_t *)v16, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD450);
      swift_arrayDestroy();
      MEMORY[0x22E2B5A04](v21, -1, -1);
      v22 = v24;
      swift_arrayDestroy();
      MEMORY[0x22E2B5A04](v22, -1, -1);
      MEMORY[0x22E2B5A04](v16, -1, -1);

    }
    else
    {

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
  }
}

void sub_2287B19C0(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_2287B1A20(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2287B1AF0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2287B2420((uint64_t)v12, *a3);
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
      sub_2287B2420((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2287B1AF0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2287CDB20();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2287B1CA8(a5, a6);
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
  v8 = sub_2287CDB50();
  if (!v8)
  {
    sub_2287CDB68();
    __break(1u);
LABEL_17:
    result = sub_2287CDBB0();
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

uint64_t sub_2287B1CA8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2287B1D3C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2287B1F14(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2287B1F14(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2287B1D3C(uint64_t a1, unint64_t a2)
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
      v3 = sub_2287B1EB0(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2287CDB2C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2287CDB68();
      __break(1u);
LABEL_10:
      v2 = sub_2287CD9E8();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2287CDBB0();
    __break(1u);
LABEL_14:
    result = sub_2287CDB68();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2287B1EB0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD458);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2287B1F14(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD458);
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
  result = sub_2287CDBB0();
  __break(1u);
  return result;
}

void sub_2287B2060(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD aBlock[6];

  v2 = sub_2287CD298();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC15A0]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD440);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2287CFAC0;
  *(_QWORD *)(inited + 32) = sub_2287CD9D0();
  *(_QWORD *)(inited + 40) = v7;
  v8 = MEMORY[0x24BEE1328];
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 48) = 1;
  *(_QWORD *)(inited + 80) = sub_2287CD9D0();
  *(_QWORD *)(inited + 88) = v9;
  *(_QWORD *)(inited + 120) = v8;
  *(_BYTE *)(inited + 96) = 1;
  sub_2287BB890(inited);
  v10 = (void *)sub_2287CD958();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setFrontBoardOptions_, v10);

  v11 = (void *)objc_opt_self();
  v12 = (void *)sub_2287CD280();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  v13 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v14 + v13, (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  aBlock[4] = sub_2287B233C;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2287B19C0;
  aBlock[3] = &block_descriptor;
  v15 = _Block_copy(aBlock);
  v16 = v5;
  swift_release();
  objc_msgSend(v11, sel_openWithURL_configuration_completionHandler_, v12, v16, v15);
  _Block_release(v15);

}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2B5968]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2287B22DC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_2287CD298();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

void sub_2287B233C(char a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(sub_2287CD298() - 8) + 80);
  sub_2287B16F0(a1, a2, v2 + ((v5 + 16) & ~v5));
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_2287B23B8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2559BD448;
  if (!qword_2559BD448)
  {
    v1 = sub_2287CD298();
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, (unint64_t *)&qword_2559BD448);
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

uint64_t sub_2287B2420(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

ValueMetadata *type metadata accessor for NoMatch()
{
  return &type metadata for NoMatch;
}

uint64_t sub_2287B2470()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2287B2480@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned __int8 v3;
  unsigned __int8 v4;
  char v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  char v32;
  _OWORD v33[9];
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;

  v41 = a1;
  v42 = 0xD000000000000015;
  v43 = 0x80000002287D16C0;
  v44 = 0xD000000000000018;
  v45 = 0x80000002287D16E0;
  sub_2287CD904();
  sub_2287B2694(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v46, 0.0, 1, 0.0, 1);
  v3 = sub_2287CD6A0();
  v4 = sub_2287CD6B8();
  v5 = sub_2287CD6AC();
  sub_2287CD6AC();
  if (sub_2287CD6AC() != v3)
    v5 = sub_2287CD6AC();
  sub_2287CD6AC();
  if (sub_2287CD6AC() != v4)
    v5 = sub_2287CD6AC();
  sub_2287CD3A0();
  v6 = v52;
  v33[6] = v52;
  v33[7] = v53;
  v33[8] = v54;
  v7 = v48;
  v33[2] = v48;
  v33[3] = v49;
  v33[4] = v50;
  v33[5] = v51;
  v33[0] = v46;
  v33[1] = v47;
  v26 = v52;
  v27 = v53;
  v28 = v54;
  v22 = v48;
  v23 = v49;
  v24 = v50;
  v25 = v51;
  v34 = v55;
  *(_QWORD *)&v29 = v55;
  v20 = v46;
  v21 = v47;
  BYTE8(v29) = v5;
  *(_QWORD *)&v30 = v8;
  *((_QWORD *)&v30 + 1) = v9;
  *(_QWORD *)&v31 = v10;
  *((_QWORD *)&v31 + 1) = v11;
  v32 = 0;
  *(_BYTE *)(a2 + 192) = 0;
  v12 = v27;
  *(_OWORD *)(a2 + 96) = v6;
  *(_OWORD *)(a2 + 112) = v12;
  v13 = v23;
  v15 = v24;
  v14 = v25;
  *(_OWORD *)(a2 + 32) = v7;
  *(_OWORD *)(a2 + 48) = v13;
  *(_OWORD *)(a2 + 64) = v15;
  *(_OWORD *)(a2 + 80) = v14;
  v16 = v21;
  *(_OWORD *)a2 = v20;
  *(_OWORD *)(a2 + 16) = v16;
  v17 = v29;
  *(_OWORD *)(a2 + 128) = v28;
  *(_OWORD *)(a2 + 144) = v17;
  v18 = v31;
  *(_OWORD *)(a2 + 160) = v30;
  *(_OWORD *)(a2 + 176) = v18;
  v35 = v5;
  v36 = v8;
  v37 = v9;
  v38 = v10;
  v39 = v11;
  v40 = 0;
  sub_2287B2AF4((uint64_t)&v20);
  return sub_2287B2B28((uint64_t)v33);
}

uint64_t sub_2287B2694@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v13;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;

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
    sub_2287CDA84();
    v23 = (void *)sub_2287CD688();
    sub_2287CD304();

  }
  sub_2287CD4B4();
  v24 = *(_OWORD *)(v13 + 8);
  v34 = *(_OWORD *)(v13 + 24);
  v35 = v24;
  v25 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v13;
  *(_OWORD *)(a9 + 16) = v25;
  *(_OWORD *)(a9 + 88) = v30;
  *(_OWORD *)(a9 + 104) = v31;
  *(_OWORD *)(a9 + 120) = v32;
  *(_OWORD *)(a9 + 136) = v33;
  *(_OWORD *)(a9 + 40) = v27;
  *(_OWORD *)(a9 + 56) = v28;
  *(_QWORD *)(a9 + 32) = *(_QWORD *)(v13 + 32);
  *(_OWORD *)(a9 + 72) = v29;
  sub_2287B2B5C((uint64_t)&v35);
  return sub_2287B2B5C((uint64_t)&v34);
}

__n128 sub_2287B2850@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  void *v22;
  __n128 result;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __n128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

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
    sub_2287CDA84();
    v22 = (void *)sub_2287CD688();
    sub_2287CD304();

  }
  sub_2287CD4B4();
  a9[4] = v28;
  a9[5] = v29;
  a9[6] = v30;
  *a9 = v24;
  a9[1] = v25;
  result = v27;
  a9[2] = v26;
  a9[3] = v27;
  return result;
}

double sub_2287B29D8@<D0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  double result;
  __int128 v11;
  _OWORD v12[12];
  char v13;
  _BYTE v14[200];

  v3 = *v1;
  v4 = sub_2287CD5A4();
  sub_2287B2480(v3, (uint64_t)v12);
  *(_OWORD *)&v14[151] = v12[9];
  *(_OWORD *)&v14[167] = v12[10];
  *(_OWORD *)&v14[183] = v12[11];
  v14[199] = v13;
  *(_OWORD *)&v14[87] = v12[5];
  *(_OWORD *)&v14[103] = v12[6];
  *(_OWORD *)&v14[119] = v12[7];
  *(_OWORD *)&v14[135] = v12[8];
  *(_OWORD *)&v14[23] = v12[1];
  *(_OWORD *)&v14[39] = v12[2];
  *(_OWORD *)&v14[55] = v12[3];
  *(_OWORD *)&v14[71] = v12[4];
  *(_OWORD *)&v14[7] = v12[0];
  v5 = *(_OWORD *)&v14[128];
  *(_OWORD *)(a1 + 161) = *(_OWORD *)&v14[144];
  v6 = *(_OWORD *)&v14[176];
  *(_OWORD *)(a1 + 177) = *(_OWORD *)&v14[160];
  *(_OWORD *)(a1 + 193) = v6;
  v7 = *(_OWORD *)&v14[64];
  *(_OWORD *)(a1 + 97) = *(_OWORD *)&v14[80];
  v8 = *(_OWORD *)&v14[112];
  *(_OWORD *)(a1 + 113) = *(_OWORD *)&v14[96];
  *(_OWORD *)(a1 + 129) = v8;
  *(_OWORD *)(a1 + 145) = v5;
  v9 = *(_OWORD *)v14;
  *(_OWORD *)(a1 + 33) = *(_OWORD *)&v14[16];
  result = *(double *)&v14[32];
  v11 = *(_OWORD *)&v14[48];
  *(_OWORD *)(a1 + 49) = *(_OWORD *)&v14[32];
  *(_OWORD *)(a1 + 65) = v11;
  *(_OWORD *)(a1 + 81) = v7;
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 209) = *(_QWORD *)&v14[192];
  *(_OWORD *)(a1 + 17) = v9;
  return result;
}

uint64_t sub_2287B2AF4(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2287B2B28(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2287B2B5C(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t sub_2287B2B88()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2559BD460;
  if (!qword_2559BD460)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BD468);
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDF4700], v1);
    atomic_store(result, (unint64_t *)&qword_2559BD460);
  }
  return result;
}

uint64_t sub_2287B2BD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD488);
  sub_2287CD88C();
  swift_bridgeObjectRetain();
  swift_release();
  sub_2287B4FBC();
  v0 = sub_2287CD76C();
  v2 = v1;
  v4 = v3 & 1;
  sub_2287CD88C();
  swift_retain();
  swift_release();
  v5 = sub_2287CD730();
  v7 = v6;
  v9 = v8;
  swift_release();
  sub_2287B4820(v0, v2, v4);
  swift_bridgeObjectRelease();
  sub_2287CD7FC();
  v10 = sub_2287CD718();
  swift_release();
  sub_2287B4820(v5, v7, v9 & 1);
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t ExpandableTextView.init(text:font:numberOfLines:expandTextToken:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>)
{
  uint64_t result;
  uint64_t v19;
  uint64_t v20;

  type metadata accessor for ExpandableTextViewModel();
  swift_allocObject();
  sub_2287B4688(a1, a2, a3, a4, a5, a6, a7, a8);
  sub_2287CD880();
  sub_2287B4808(a7);
  result = swift_release();
  *a9 = v19;
  a9[1] = v20;
  return result;
}

uint64_t type metadata accessor for ExpandableTextViewModel()
{
  uint64_t result;

  result = qword_2559BD510;
  if (!qword_2559BD510)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ExpandableTextView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
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
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t KeyPath;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  _BYTE *v33;
  uint64_t v34;
  unint64_t v35;
  _BYTE *v36;
  uint64_t v37;
  _BYTE *v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE v50[4];
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _BYTE *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _BYTE *v59;
  uint64_t v60;
  uint64_t v61;
  _BYTE *v62;
  _BYTE *v63;
  uint64_t v64;
  uint64_t v65;
  _BYTE *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  uint64_t v79;

  v69 = a1;
  v2 = sub_2287CDA60();
  v67 = *(_QWORD *)(v2 - 8);
  v68 = v2;
  MEMORY[0x24BDAC7A8]();
  v66 = &v50[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v57 = sub_2287CD748();
  v56 = *(_QWORD *)(v57 - 8);
  MEMORY[0x24BDAC7A8]();
  v55 = &v50[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_2287CD1E4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = &v50[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD470);
  v60 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8]();
  v59 = &v50[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD478);
  v64 = *(_QWORD *)(v10 - 8);
  v65 = v10;
  MEMORY[0x24BDAC7A8]();
  v63 = &v50[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD480);
  MEMORY[0x24BDAC7A8]();
  v62 = &v50[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = v1[1];
  v72 = *v1;
  v14 = v72;
  v73 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD488);
  sub_2287CD88C();
  v15 = v79;
  swift_getKeyPath();
  v72 = v15;
  sub_2287B108C(&qword_2559BD498, (uint64_t (*)(uint64_t))type metadata accessor for ExpandableTextViewModel, (uint64_t)&unk_2287CFCB0);
  sub_2287CD2C8();
  swift_release();
  v16 = v15 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__attributedText;
  swift_beginAccess();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 16))(v8, v16, v5);
  swift_release();
  v17 = sub_2287CD760();
  v19 = v18;
  LOBYTE(v8) = v20 & 1;
  v72 = v14;
  v73 = v13;
  sub_2287CD88C();
  swift_retain();
  swift_release();
  v53 = sub_2287CD730();
  v52 = v21;
  v51 = v22;
  v54 = v23;
  swift_release();
  sub_2287B4820(v17, v19, (char)v8);
  swift_bridgeObjectRelease();
  v72 = v14;
  v73 = v13;
  sub_2287CD88C();
  v24 = v70;
  swift_getKeyPath();
  v72 = v24;
  sub_2287CD2C8();
  swift_release();
  v25 = 0;
  v26 = *(_BYTE *)(v24
                 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__expanded);
  if ((v26 & 1) == 0)
    v25 = *(_QWORD *)(v24 + 40);
  swift_release();
  KeyPath = swift_getKeyPath();
  v72 = v53;
  v73 = v52;
  v74 = v51 & 1;
  v75 = v54;
  v76 = KeyPath;
  v77 = v25;
  v78 = v26;
  v70 = v14;
  v71 = v13;
  v28 = sub_2287B2BD4();
  v30 = v29;
  v32 = v31 & 1;
  v33 = v55;
  sub_2287CD73C();
  sub_2287B4820(v28, v30, v32);
  swift_bridgeObjectRelease();
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD4B0);
  v35 = sub_2287B4894();
  v36 = v59;
  sub_2287CD790();
  (*(void (**)(_BYTE *, uint64_t))(v56 + 8))(v33, v57);
  sub_2287B4820(v72, v73, v74);
  swift_bridgeObjectRelease();
  swift_release();
  v37 = swift_allocObject();
  *(_QWORD *)(v37 + 16) = v14;
  *(_QWORD *)(v37 + 24) = v13;
  swift_retain();
  swift_retain();
  v72 = v34;
  v73 = v35;
  swift_getOpaqueTypeConformance2();
  v38 = v63;
  v39 = v61;
  sub_2287CD79C();
  swift_release();
  (*(void (**)(_BYTE *, uint64_t))(v60 + 8))(v36, v39);
  v40 = swift_allocObject();
  *(_QWORD *)(v40 + 16) = v14;
  *(_QWORD *)(v40 + 24) = v13;
  swift_retain();
  swift_retain();
  v41 = v66;
  sub_2287CDA48();
  v42 = (uint64_t)v62;
  v43 = &v62[*(int *)(v58 + 36)];
  v44 = sub_2287CD460();
  v46 = v67;
  v45 = v68;
  (*(void (**)(char *, _BYTE *, uint64_t))(v67 + 16))(&v43[*(int *)(v44 + 20)], v41, v68);
  *(_QWORD *)v43 = &unk_2559BD4D8;
  *((_QWORD *)v43 + 1) = v40;
  v48 = v64;
  v47 = v65;
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v64 + 16))(v42, v38, v65);
  (*(void (**)(_BYTE *, uint64_t))(v46 + 8))(v41, v45);
  (*(void (**)(_BYTE *, uint64_t))(v48 + 8))(v38, v47);
  return sub_2287B4A20(v42, v69);
}

uint64_t sub_2287B345C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  swift_getKeyPath();
  sub_2287B108C(&qword_2559BD498, (uint64_t (*)(uint64_t))type metadata accessor for ExpandableTextViewModel, (uint64_t)&unk_2287CFCB0);
  sub_2287CD2C8();
  swift_release();
  v3 = v1 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__attributedText;
  swift_beginAccess();
  v4 = sub_2287CD1E4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_2287B3520()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD488);
  sub_2287CD88C();
  sub_2287B356C();
  return swift_release();
}

uint64_t sub_2287B356C()
{
  uint64_t v0;
  uint64_t result;
  void (*v2)(_QWORD);

  swift_getKeyPath();
  sub_2287B108C(&qword_2559BD498, (uint64_t (*)(uint64_t))type metadata accessor for ExpandableTextViewModel, (uint64_t)&unk_2287CFCB0);
  sub_2287CD2BC();
  swift_release();
  swift_getKeyPath();
  sub_2287CD2C8();
  result = swift_release();
  v2 = *(void (**)(_QWORD))(v0
                                     + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__onExpandTextHandler);
  if (v2)
  {
    swift_getKeyPath();
    swift_retain();
    sub_2287CD2C8();
    swift_release();
    v2(*(unsigned __int8 *)(v0
                          + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__expanded));
    return sub_2287B4808((uint64_t)v2);
  }
  return result;
}

uint64_t sub_2287B36B8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[5] = a1;
  v2[6] = a2;
  sub_2287CDA3C();
  v2[7] = sub_2287CDA30();
  v2[8] = sub_2287CDA18();
  v2[9] = v3;
  return swift_task_switch();
}

uint64_t sub_2287B3724()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = v0[6];
  v0[2] = v0[5];
  v0[3] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD488);
  sub_2287CD88C();
  v0[10] = v0[4];
  v2 = (_QWORD *)swift_task_alloc();
  v0[11] = v2;
  *v2 = v0;
  v2[1] = sub_2287B3798;
  return sub_2287B381C();
}

uint64_t sub_2287B3798()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2287B37EC()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2287B381C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[20] = v0;
  sub_2287CD220();
  v1[21] = swift_task_alloc();
  v2 = sub_2287CD1E4();
  v1[22] = v2;
  v1[23] = *(_QWORD *)(v2 - 8);
  v1[24] = swift_task_alloc();
  v1[25] = swift_task_alloc();
  sub_2287CDA3C();
  v1[26] = sub_2287CDA30();
  v1[27] = sub_2287CDA18();
  v1[28] = v3;
  return swift_task_switch();
}

uint64_t sub_2287B38E0()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = v0[20];
  v2 = (void *)objc_opt_self();
  v0[29] = *(_QWORD *)(v1 + 48);
  v0[30] = *(_QWORD *)(v1 + 56);
  v3 = sub_2287CD9A0();
  v0[31] = v3;
  sub_2287BB9C4(MEMORY[0x24BEE4AF8]);
  type metadata accessor for DocumentReadingOptionKey(0);
  sub_2287B108C(&qword_2559BD418, (uint64_t (*)(uint64_t))type metadata accessor for DocumentReadingOptionKey, (uint64_t)&unk_2287CFA04);
  v4 = sub_2287CD958();
  v0[32] = v4;
  swift_bridgeObjectRelease();
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_2287B3A1C;
  v5 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v6 = v0 + 10;
  v6[1] = 0x40000000;
  v6[2] = sub_2287B4458;
  v6[3] = &block_descriptor_0;
  v6[4] = v5;
  objc_msgSend(v2, sel_loadFromHTMLWithString_options_completionHandler_, v3, v4, v6);
  return swift_continuation_await();
}

uint64_t sub_2287B3A1C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 264) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2287B3A78()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t KeyPath;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v13;

  v2 = *(void **)(v0 + 248);
  v1 = *(void **)(v0 + 256);
  v3 = *(_QWORD *)(v0 + 200);
  v5 = *(_QWORD *)(v0 + 184);
  v4 = *(_QWORD *)(v0 + 192);
  v13 = *(_QWORD *)(v0 + 176);
  v6 = *(_QWORD *)(v0 + 160);
  swift_release();
  v7 = *(void **)(v0 + 120);
  swift_bridgeObjectRelease();

  v8 = v7;
  sub_2287CD1FC();
  KeyPath = swift_getKeyPath();
  *(_QWORD *)swift_task_alloc() = KeyPath;
  swift_getKeyPath();
  swift_task_dealloc();
  *(_QWORD *)(v0 + 144) = *(_QWORD *)(v6 + 16);
  sub_2287B4DE4();
  swift_retain();
  sub_2287CD1D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v3, v13);
  swift_getKeyPath();
  v10 = swift_task_alloc();
  *(_QWORD *)(v10 + 16) = v6;
  *(_QWORD *)(v10 + 24) = v4;
  *(_QWORD *)(v0 + 152) = v6;
  sub_2287B108C(&qword_2559BD498, (uint64_t (*)(uint64_t))type metadata accessor for ExpandableTextViewModel, (uint64_t)&unk_2287CFCB0);
  sub_2287CD2BC();
  swift_release();
  swift_task_dealloc();
  v11 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v11(v4, v13);

  v11(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 176));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2287B3C44()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = *(void **)(v0 + 256);
  v1 = *(void **)(v0 + 264);
  v3 = *(void **)(v0 + 248);
  v4 = *(_QWORD *)(v0 + 200);
  v8 = *(_QWORD *)(v0 + 184);
  v5 = *(_QWORD *)(v0 + 160);
  swift_release();
  swift_willThrow();

  swift_bridgeObjectRetain();
  sub_2287CD214();
  sub_2287CD1F0();
  swift_getKeyPath();
  v6 = swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v5;
  *(_QWORD *)(v6 + 24) = v4;
  *(_QWORD *)(v0 + 136) = v5;
  sub_2287B108C(&qword_2559BD498, (uint64_t (*)(uint64_t))type metadata accessor for ExpandableTextViewModel, (uint64_t)&unk_2287CFCB0);
  sub_2287CD2BC();
  swift_release();
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v8 + 8))(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 176));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2287B3DA8()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_2287B108C(&qword_2559BD498, (uint64_t (*)(uint64_t))type metadata accessor for ExpandableTextViewModel, (uint64_t)&unk_2287CFCB0);
  sub_2287CD2C8();
  swift_release();
  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__expanded);
}

uint64_t sub_2287B3E34@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a1;
  swift_getKeyPath();
  sub_2287B108C(&qword_2559BD498, (uint64_t (*)(uint64_t))type metadata accessor for ExpandableTextViewModel, (uint64_t)&unk_2287CFCB0);
  sub_2287CD2C8();
  swift_release();
  v4 = v3 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__attributedText;
  swift_beginAccess();
  v5 = sub_2287CD1E4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_2287B3EF8(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE v10[16];
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;

  v4 = sub_2287CD1E4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = *a2;
  swift_getKeyPath();
  v11 = v8;
  v12 = v7;
  v13 = v8;
  sub_2287B108C(&qword_2559BD498, (uint64_t (*)(uint64_t))type metadata accessor for ExpandableTextViewModel, (uint64_t)&unk_2287CFCB0);
  sub_2287CD2BC();
  swift_release();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_2287B4004(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a1 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__attributedText;
  swift_beginAccess();
  v4 = sub_2287CD1E4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(v3, a2, v4);
  return swift_endAccess();
}

uint64_t sub_2287B4080@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_2287B108C(&qword_2559BD498, (uint64_t (*)(uint64_t))type metadata accessor for ExpandableTextViewModel, (uint64_t)&unk_2287CFCB0);
  sub_2287CD2C8();
  result = swift_release();
  *a2 = *(_BYTE *)(v3
                 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__expanded);
  return result;
}

uint64_t sub_2287B4114()
{
  swift_getKeyPath();
  sub_2287B108C(&qword_2559BD498, (uint64_t (*)(uint64_t))type metadata accessor for ExpandableTextViewModel, (uint64_t)&unk_2287CFCB0);
  sub_2287CD2BC();
  return swift_release();
}

uint64_t sub_2287B41BC()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_2287B108C(&qword_2559BD498, (uint64_t (*)(uint64_t))type metadata accessor for ExpandableTextViewModel, (uint64_t)&unk_2287CFCB0);
  sub_2287CD2C8();
  swift_release();
  v1 = *(_QWORD *)(v0
                 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__onExpandTextHandler);
  sub_2287B4F88(v1);
  return v1;
}

uint64_t sub_2287B4260@<X0>(uint64_t *a1@<X0>, uint64_t (**a2)(unsigned __int8 *a1)@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(unsigned __int8 *);

  v3 = *a1;
  swift_getKeyPath();
  sub_2287B108C(&qword_2559BD498, (uint64_t (*)(uint64_t))type metadata accessor for ExpandableTextViewModel, (uint64_t)&unk_2287CFCB0);
  sub_2287CD2C8();
  swift_release();
  v4 = *(_QWORD *)(v3
                 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__onExpandTextHandler);
  v5 = *(_QWORD *)(v3
                 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__onExpandTextHandler
                 + 8);
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_2287B4F98;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)(unsigned __int8 *))v6;
  return sub_2287B4F88(v4);
}

uint64_t sub_2287B4334(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(char);

  v2 = *a1;
  v1 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v2;
    *(_QWORD *)(v3 + 24) = v1;
    v4 = sub_2287B4F58;
  }
  else
  {
    v4 = 0;
  }
  swift_getKeyPath();
  MEMORY[0x24BDAC7A8]();
  sub_2287B4F88(v2);
  sub_2287B108C(&qword_2559BD498, (uint64_t (*)(uint64_t))type metadata accessor for ExpandableTextViewModel, (uint64_t)&unk_2287CFCB0);
  sub_2287CD2BC();
  sub_2287B4808((uint64_t)v4);
  return swift_release();
}

uint64_t sub_2287B4458(uint64_t result, void *a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  _QWORD *v6;
  id v7;
  uint64_t v9;
  _QWORD *v10;
  id v11;

  v4 = *(_QWORD *)(result + 32);
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD5F8);
    swift_allocError();
    *v6 = a4;
    v7 = a4;
    return swift_continuation_throwingResumeWithError();
  }
  else if (a2)
  {
    type metadata accessor for DocumentAttributeKey(0);
    sub_2287B108C(&qword_2559BD408, (uint64_t (*)(uint64_t))type metadata accessor for DocumentAttributeKey, (uint64_t)&unk_2287CF9C4);
    v9 = sub_2287CD964();
    v10 = *(_QWORD **)(*(_QWORD *)(v4 + 64) + 40);
    *v10 = a2;
    v10[1] = v9;
    v11 = a2;
    return swift_continuation_throwingResume();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2287B4530()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD5F0);
  return sub_2287CD994() & 1;
}

uint64_t sub_2287B4588()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__attributedText;
  v2 = sub_2287CD1E4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_2287B4808(*(_QWORD *)(v0
                          + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__onExpandTextHandler));
  v3 = v0
     + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel___observationRegistrar;
  v4 = sub_2287CD2F8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance();
}

uint64_t sub_2287B462C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_2287CD520();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_2287B465C()
{
  return sub_2287CD52C();
}

_QWORD *sub_2287B4688(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v28 = a8;
  v24 = a5;
  v25 = a6;
  sub_2287CD220();
  MEMORY[0x24BDAC7A8]();
  v14 = sub_2287CD1E4();
  v26 = *(_QWORD *)(v14 - 8);
  v27 = v14;
  MEMORY[0x24BDAC7A8]();
  v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((_BYTE *)v8 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__expanded) = 0;
  v17 = (_QWORD *)((char *)v8
                 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__onExpandTextHandler);
  *v17 = 0;
  v17[1] = 0;
  sub_2287CD2EC();
  v8[6] = a1;
  v8[7] = a2;
  v18 = v24;
  v8[2] = a3;
  v8[3] = v18;
  v8[4] = v25;
  v8[5] = a4;
  v19 = (_QWORD *)((char *)v8
                 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__onExpandTextHandler);
  v20 = *(_QWORD *)((char *)v8
                  + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__onExpandTextHandler);
  swift_bridgeObjectRetain();
  swift_retain();
  v21 = v28;
  sub_2287B4F88(a7);
  sub_2287B4808(v20);
  *v19 = a7;
  v19[1] = v21;
  sub_2287CD214();
  sub_2287CD1F0();
  (*(void (**)(uint64_t, char *, uint64_t))(v26 + 32))((uint64_t)v8+ OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__attributedText, v16, v27);
  return v8;
}

uint64_t sub_2287B4808(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_2287B4820(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_2287B4838@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_2287CD520();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_2287B4868()
{
  return sub_2287CD52C();
}

unint64_t sub_2287B4894()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_2559BD4B8;
  if (!qword_2559BD4B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BD4B0);
    v2 = sub_2287B4900();
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2559BD4B8);
  }
  return result;
}

unint64_t sub_2287B4900()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2559BD4C0;
  if (!qword_2559BD4C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BD4C8);
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDF1028], v1);
    atomic_store(result, (unint64_t *)&qword_2559BD4C0);
  }
  return result;
}

uint64_t sub_2287B4950()
{
  return sub_2287B3520();
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2287B4988()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_2287B49D8;
  return sub_2287B36B8(v2, v3);
}

uint64_t sub_2287B49D8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2287B4A20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD480);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2287B4A68()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for ExpandableTextView()
{
  swift_release();
  return swift_release();
}

_QWORD *_s11ShazamKitUI18ExpandableTextViewVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for ExpandableTextView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for ExpandableTextView(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ExpandableTextView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ExpandableTextView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ExpandableTextView()
{
  return &type metadata for ExpandableTextView;
}

uint64_t sub_2287B4C04()
{
  return type metadata accessor for ExpandableTextViewModel();
}

uint64_t sub_2287B4C0C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_2287CD1E4();
  if (v1 <= 0x3F)
  {
    result = sub_2287CD2F8();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

unint64_t sub_2287B4CD4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[4];

  result = qword_2559BD5D0;
  if (!qword_2559BD5D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BD480);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BD470);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BD4B0);
    sub_2287B4894();
    v3[2] = v2;
    v3[3] = swift_getOpaqueTypeConformance2();
    v3[0] = swift_getOpaqueTypeConformance2();
    v3[1] = sub_2287B108C(&qword_2559BD5D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDEC4E0], MEMORY[0x24BDEC4C8]);
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2559BD5D0);
  }
  return result;
}

uint64_t sub_2287B4DB0()
{
  uint64_t v0;

  return sub_2287B4004(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_2287B4DC8()
{
  sub_2287CD1CC();
  __break(1u);
}

unint64_t sub_2287B4DE4()
{
  unint64_t result;

  result = qword_2559BD5E8;
  if (!qword_2559BD5E8)
  {
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDEACD0], MEMORY[0x24BDEACE0]);
    atomic_store(result, (unint64_t *)&qword_2559BD5E8);
  }
  return result;
}

void sub_2287B4E28()
{
  sub_2287B4DE4();
  sub_2287CD274();
  __break(1u);
}

uint64_t sub_2287B4E4C()
{
  return 8;
}

uint64_t sub_2287B4E58()
{
  return swift_release();
}

uint64_t sub_2287B4E60(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_2287B4E70()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD5F0);
  return sub_2287CD988();
}

_QWORD *sub_2287B4EB4(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

void sub_2287B4EC0()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16)
           + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__expanded) = *(_BYTE *)(v0 + 24);
}

uint64_t sub_2287B4EE0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v1 = v0[3];
  v2 = v0[4];
  v3 = (uint64_t *)(v0[2]
                 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__onExpandTextHandler);
  v4 = *v3;
  *v3 = v1;
  v3[1] = v2;
  sub_2287B4F88(v1);
  return sub_2287B4808(v4);
}

uint64_t sub_2287B4F34()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2287B4F58(char a1)
{
  uint64_t v1;
  uint64_t (*v2)(char *);
  char v4;

  v2 = *(uint64_t (**)(char *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t sub_2287B4F88(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_2287B4F98(unsigned __int8 *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

unint64_t sub_2287B4FBC()
{
  unint64_t result;

  result = qword_2559BD600;
  if (!qword_2559BD600)
  {
    result = MEMORY[0x22E2B5980](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2559BD600);
  }
  return result;
}

uint64_t sub_2287B5004()
{
  return sub_2287B4DB0();
}

void sub_2287B5018()
{
  sub_2287B4EC0();
}

ValueMetadata *type metadata accessor for AmbientArtworkUnavailableView()
{
  return &type metadata for AmbientArtworkUnavailableView;
}

uint64_t sub_2287B503C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_2287B504C()
{
  qword_2559BD608 = 0x636973756DLL;
  unk_2559BD610 = 0xE500000000000000;
}

uint64_t sub_2287B506C(uint64_t a1)
{
  return sub_2287B5094(a1, (SEL *)&selRef_systemFillColor, &qword_2559BD618);
}

uint64_t sub_2287B5080(uint64_t a1)
{
  return sub_2287B5094(a1, (SEL *)&selRef_systemGray5Color, &qword_2559BD620);
}

uint64_t sub_2287B5094(uint64_t a1, SEL *a2, uint64_t *a3)
{
  id v4;
  uint64_t result;

  v4 = objc_msgSend((id)objc_opt_self(), *a2);
  result = MEMORY[0x22E2B4F0C](v4);
  *a3 = result;
  return result;
}

__n128 sub_2287B50D8@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  __n128 result;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  __n128 v30;
  uint64_t v31;
  uint64_t v32;

  v2 = sub_2287CD8F8();
  v4 = v3;
  sub_2287B5184((uint64_t)&v19);
  v5 = v19;
  v6 = v20;
  v7 = v21;
  v8 = v22;
  v9 = v23;
  v10 = v24;
  v11 = v25;
  v12 = v26;
  v13 = v27;
  v14 = v28;
  v15 = v29;
  v16 = v31;
  v17 = v32;
  result = v30;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 25) = v7;
  *(_QWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  *(_BYTE *)(a1 + 48) = v10;
  *(_BYTE *)(a1 + 49) = v11;
  *(_QWORD *)(a1 + 56) = v12;
  *(_BYTE *)(a1 + 64) = v13;
  *(_QWORD *)(a1 + 72) = v14;
  *(_BYTE *)(a1 + 80) = v15;
  *(__n128 *)(a1 + 88) = result;
  *(_QWORD *)(a1 + 104) = v16;
  *(_QWORD *)(a1 + 112) = v17;
  return result;
}

uint64_t sub_2287B5184@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t KeyPath;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;

  v2 = sub_2287CD838();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2559BD250 != -1)
    swift_once();
  v6 = qword_2559BD620;
  v7 = qword_2559BD240;
  swift_retain();
  if (v7 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_2287CD850();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDF3FD0], v2);
  v8 = sub_2287CD868();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_2287CD430();
  sub_2287CD430();
  sub_2287CD8F8();
  sub_2287CD424();
  v9 = v18;
  v10 = v19;
  v11 = v20;
  v12 = v21;
  v13 = v22;
  v14 = v23;
  if (qword_2559BD248 != -1)
    swift_once();
  v15 = qword_2559BD618;
  KeyPath = swift_getKeyPath();
  *(_QWORD *)a1 = v6;
  *(_WORD *)(a1 + 8) = 256;
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = 0;
  *(_WORD *)(a1 + 32) = 1;
  *(_QWORD *)(a1 + 40) = v9;
  *(_BYTE *)(a1 + 48) = v10;
  *(_QWORD *)(a1 + 56) = v11;
  *(_BYTE *)(a1 + 64) = v12;
  *(_QWORD *)(a1 + 72) = v13;
  *(_QWORD *)(a1 + 80) = v14;
  *(_QWORD *)(a1 + 88) = KeyPath;
  *(_QWORD *)(a1 + 96) = v15;
  swift_retain();
  swift_retain();
  return swift_release();
}

void sub_2287B53C4(__n128 (**a1)@<Q0>(uint64_t a1@<X8>)@<X8>)
{
  *a1 = sub_2287B50D8;
  a1[1] = 0;
}

unint64_t sub_2287B53E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2559BD628;
  if (!qword_2559BD628)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BD630);
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDEC6F8], v1);
    atomic_store(result, (unint64_t *)&qword_2559BD628);
  }
  return result;
}

uint64_t sub_2287B542C(double a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(double *)(v5 + 80) = a1;
  *(double *)(v5 + 88) = a2;
  *(_QWORD *)(v5 + 64) = a4;
  *(_QWORD *)(v5 + 72) = a5;
  return swift_task_switch();
}

uint64_t sub_2287B5448()
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
  unint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  void (*v36)(uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t, uint64_t, uint64_t);

  v1 = sub_2287CD298();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  v4 = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD648);
  sub_2287CD8D4();
  v5 = *(_QWORD *)(v0 + 56) + OBJC_IVAR____TtC11ShazamKitUI17LocationViewModel_albumArtURL;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD650);
  v6 = swift_task_alloc();
  sub_2287B7790(v5, v6, &qword_2559BD650);
  swift_release();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v6, 1, v1) == 1)
  {
    sub_2287B741C(v6, &qword_2559BD650);
  }
  else
  {
    v7 = *(_QWORD *)(v0 + 72);
    v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32);
    v36(v4, v6, v1);
    swift_task_dealloc();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD658);
    v8 = swift_task_alloc();
    v9 = sub_2287CDA60();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
    v10 = swift_task_alloc();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v10, v4, v1);
    v11 = *(_QWORD *)(type metadata accessor for LocationViewPopulator() - 8);
    v37 = v4;
    v12 = swift_task_alloc();
    sub_2287B72A0(v7, v12);
    v13 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
    v14 = (v3 + *(unsigned __int8 *)(v11 + 80) + v13) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = 0;
    *(_QWORD *)(v15 + 24) = 0;
    v36(v15 + v13, v10, v1);
    sub_2287B7360(v12, v15 + v14);
    swift_task_dealloc();
    swift_task_dealloc();
    sub_2287B5CC4(v8, (uint64_t)&unk_2559BD690, v15);
    sub_2287B741C(v8, &qword_2559BD658);
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v37, v1);
  }
  v17 = *(double *)(v0 + 80);
  v16 = *(double *)(v0 + 88);
  v18 = *(_QWORD *)(v0 + 72);
  swift_task_dealloc();
  swift_task_dealloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD658);
  v19 = swift_task_alloc();
  v20 = sub_2287CDA60();
  v38 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56);
  v38(v19, 1, 1, v20);
  v21 = *(_QWORD *)(type metadata accessor for LocationViewPopulator() - 8);
  v22 = *(_QWORD *)(v21 + 64);
  v23 = swift_task_alloc();
  sub_2287B72A0(v18, v23);
  v24 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  v25 = v24 + v22;
  v26 = swift_allocObject();
  *(_QWORD *)(v26 + 16) = 0;
  *(_QWORD *)(v26 + 24) = 0;
  sub_2287B7360(v23, v26 + v24);
  swift_task_dealloc();
  sub_2287B5CC4(v19, (uint64_t)&unk_2559BD668, v26);
  sub_2287B741C(v19, &qword_2559BD658);
  swift_task_dealloc();
  if (v17 > 0.0 && v16 > 0.0)
  {
    v28 = *(_QWORD *)(v0 + 80);
    v27 = *(_QWORD *)(v0 + 88);
    v29 = *(_QWORD *)(v0 + 72);
    v30 = swift_task_alloc();
    v38(v30, 1, 1, v20);
    v31 = swift_task_alloc();
    sub_2287B72A0(v29, v31);
    v32 = swift_allocObject();
    *(_QWORD *)(v32 + 16) = 0;
    *(_QWORD *)(v32 + 24) = 0;
    sub_2287B7360(v31, v32 + v24);
    v33 = (_QWORD *)(v32 + ((v25 + 7) & 0xFFFFFFFFFFFFFFF8));
    *v33 = v28;
    v33[1] = v27;
    swift_task_dealloc();
    sub_2287B5CC4(v30, (uint64_t)&unk_2559BD680, v32);
    sub_2287B741C(v30, &qword_2559BD658);
    swift_task_dealloc();
  }
  if (!__isPlatformVersionAtLeast(2, 18, 0, 0))
    return swift_task_switch();
  v34 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD670);
  *v34 = v0;
  v34[1] = sub_2287B5914;
  return sub_2287CDA24();
}

uint64_t sub_2287B5914()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2287B595C()
{
  return swift_taskGroup_wait_next_throwing();
}

uint64_t sub_2287B5978()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 104) = v0;
  if (v0 || (*(_BYTE *)(v1 + 112) & 1) == 0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2287B59B4()
{
  return swift_unexpectedError();
}

uint64_t sub_2287B59D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t);

  *(_QWORD *)(v5 + 32) = a5;
  v9 = (uint64_t (*)(uint64_t))((char *)&dword_2559BD638 + dword_2559BD638);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 40) = v7;
  *v7 = v5;
  v7[1] = sub_2287B5A34;
  return v9(a4);
}

uint64_t sub_2287B5A34(uint64_t a1)
{
  void *v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 48) = v1;
  swift_task_dealloc();
  if (v1)

  else
    *(_QWORD *)(v4 + 56) = a1;
  return swift_task_switch();
}

uint64_t sub_2287B5AB0()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = v0[7];
  v0[8] = v0[6];
  v0[9] = v1;
  sub_2287CDA3C();
  v0[10] = sub_2287CDA30();
  sub_2287CDA18();
  return swift_task_switch();
}

uint64_t sub_2287B5B20()
{
  _QWORD *v0;

  sub_2287CDA3C();
  v0[8] = 0;
  v0[9] = 0;
  v0[10] = sub_2287CDA30();
  sub_2287CDA18();
  return swift_task_switch();
}

uint64_t sub_2287B5B8C()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v1 = (void *)v0[9];
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD648);
  sub_2287CD8D4();
  v2 = v0[2];
  swift_getKeyPath();
  v3 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  v0[3] = v2;
  sub_2287B7728();
  v4 = v1;
  sub_2287CD2BC();

  swift_release();
  swift_release();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2287B5C94()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2287B5CC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
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
  _QWORD *v18;
  _QWORD v20[4];
  _QWORD v21[4];

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD658);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287B7790(a1, (uint64_t)v10, &qword_2559BD658);
  v11 = sub_2287CDA60();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_2287B741C((uint64_t)v10, &qword_2559BD658);
    if (*(_QWORD *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v13 = sub_2287CDA18();
      v15 = v14;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_2287CDA54();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    if (*(_QWORD *)(a3 + 16))
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v16 = *v4;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  v18 = (_QWORD *)(v15 | v13);
  if (v15 | v13)
  {
    v21[0] = 0;
    v21[1] = 0;
    v18 = v21;
    v21[2] = v13;
    v21[3] = v15;
  }
  v20[1] = 1;
  v20[2] = v18;
  v20[3] = v16;
  swift_task_create();
  return swift_release();
}

uint64_t sub_2287B5E70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 128) = a4;
  return swift_task_switch();
}

uint64_t sub_2287B5E88()
{
  _QWORD *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFA68]), sel_init);
  v0[17] = v1;
  v0[18] = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD648);
  sub_2287CD8D4();
  v2 = *(void **)(v0[10] + 16);
  v0[19] = v2;
  v3 = v2;
  swift_release();
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_2287B5F88;
  v0[14] = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_2287B6290;
  v0[13] = &block_descriptor_27;
  objc_msgSend(v1, sel_reverseGeocodeLocation_completionHandler_, v3, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_2287B5F88()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 160) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

void sub_2287B5FE8()
{
  uint64_t v0;
  unint64_t v1;
  id v2;
  uint64_t v3;
  void *v4;

  v1 = *(_QWORD *)(v0 + 120);

  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_2287CDB80();
    swift_bridgeObjectRelease();
    if (v3)
      goto LABEL_3;
LABEL_8:
    v4 = *(void **)(v0 + 136);
    swift_bridgeObjectRelease();

    (*(void (**)(void))(v0 + 8))();
    return;
  }
  if (!*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_8;
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    v2 = (id)MEMORY[0x22E2B5260](0, v1);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v2 = *(id *)(v1 + 32);
LABEL_6:
    *(_QWORD *)(v0 + 168) = v2;
    swift_bridgeObjectRelease();
    sub_2287CDA3C();
    *(_QWORD *)(v0 + 176) = sub_2287CDA30();
    sub_2287CDA18();
    swift_task_switch();
    return;
  }
  __break(1u);
}

uint64_t sub_2287B60FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  swift_release();
  sub_2287CD8D4();
  v1 = *(_QWORD *)(v0 + 80);
  v2 = sub_2287B6328();
  v4 = v3;
  swift_getKeyPath();
  v5 = (_QWORD *)swift_task_alloc();
  v5[2] = v1;
  v5[3] = v2;
  v5[4] = v4;
  *(_QWORD *)(v0 + 80) = v1;
  sub_2287B7728();
  sub_2287CD2BC();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2287B6200()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 136);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2287B6238()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(v0 + 152);
  v2 = *(void **)(v0 + 160);
  v3 = *(void **)(v0 + 136);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2287B6290(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD5F8);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    sub_2287B788C();
    **(_QWORD **)(*(_QWORD *)(v3 + 64) + 40) = sub_2287CDA00();
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_2287B6328()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBAD78]), sel_init);
  v2 = objc_msgSend(v0, sel_thoroughfare);
  if (v2)
  {
    v3 = v2;
    sub_2287CD9D0();

  }
  v4 = (void *)sub_2287CD9A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setStreet_, v4);

  v5 = objc_msgSend(v0, sel_locality);
  if (v5)
  {
    v6 = v5;
    sub_2287CD9D0();

  }
  v7 = (void *)sub_2287CD9A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setCity_, v7);

  v8 = objc_msgSend(v0, sel_subLocality);
  if (v8)
  {
    v9 = v8;
    sub_2287CD9D0();

  }
  v10 = (void *)sub_2287CD9A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setSubLocality_, v10);

  v11 = objc_msgSend(v0, sel_subAdministrativeArea);
  if (v11)
  {
    v12 = v11;
    sub_2287CD9D0();

  }
  v13 = (void *)sub_2287CD9A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setSubAdministrativeArea_, v13);

  v14 = objc_msgSend(v0, sel_administrativeArea);
  if (v14)
  {
    v15 = v14;
    sub_2287CD9D0();

  }
  v16 = (void *)sub_2287CD9A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setState_, v16);

  v17 = objc_msgSend(v0, sel_country);
  if (v17)
  {
    v18 = v17;
    sub_2287CD9D0();

  }
  v19 = (void *)sub_2287CD9A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setCountry_, v19);

  v20 = objc_msgSend((id)objc_opt_self(), sel_singleLineStringFromPostalAddress_addCountryName_, v1, 1);
  if (v20)
  {
    v21 = v20;
    v22 = sub_2287CD9D0();

  }
  else
  {

    return 0;
  }
  return v22;
}

uint64_t sub_2287B6650(double a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  *(double *)(v6 + 48) = a1;
  *(double *)(v6 + 56) = a2;
  *(_QWORD *)(v6 + 40) = a6;
  return swift_task_switch();
}

uint64_t sub_2287B666C()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  __int128 v4;

  *(_QWORD *)(v0 + 64) = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD648);
  sub_2287CD8D4();
  v1 = *(void **)(*(_QWORD *)(v0 + 16) + 16);
  *(_QWORD *)(v0 + 72) = v1;
  v2 = v1;
  swift_release();
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v3;
  *(_QWORD *)v3 = v0;
  *(_QWORD *)(v3 + 8) = sub_2287B6714;
  v4 = *(_OWORD *)(v0 + 48);
  *(_QWORD *)(v3 + 152) = *(_QWORD *)(v0 + 40);
  *(_OWORD *)(v3 + 136) = v4;
  *(_QWORD *)(v3 + 128) = v2;
  return swift_task_switch();
}

uint64_t sub_2287B6714(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(*(_QWORD *)v1 + 72);
  *(_QWORD *)(*(_QWORD *)v1 + 88) = a1;
  swift_task_dealloc();

  return swift_task_switch();
}

uint64_t sub_2287B6774()
{
  uint64_t v0;

  sub_2287CDA3C();
  *(_QWORD *)(v0 + 96) = sub_2287CDA30();
  sub_2287CDA18();
  return swift_task_switch();
}

uint64_t sub_2287B67DC()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v1 = (void *)v0[11];
  swift_release();
  sub_2287CD8D4();
  v2 = v0[3];
  swift_getKeyPath();
  v3 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  v0[4] = v2;
  sub_2287B7728();
  v4 = v1;
  sub_2287CD2BC();

  swift_release();
  swift_release();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2287B68D8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2287B6908(uint64_t a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 152) = v3;
  *(double *)(v4 + 136) = a2;
  *(double *)(v4 + 144) = a3;
  *(_QWORD *)(v4 + 128) = a1;
  return swift_task_switch();
}

uint64_t sub_2287B6928()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = sub_2287B6AE4(*(void **)(v0 + 128), *(double *)(v0 + 136), *(double *)(v0 + 144));
  *(_QWORD *)(v0 + 160) = v1;
  *(_QWORD *)(v0 + 56) = v0 + 120;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_2287B69D8;
  v2 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v3 = (_QWORD *)(v0 + 80);
  v3[1] = 0x40000000;
  v3[2] = sub_2287B6BF8;
  v3[3] = &block_descriptor_1;
  v3[4] = v2;
  objc_msgSend(v1, sel_startWithCompletionHandler_, v3);
  return swift_continuation_await();
}

uint64_t sub_2287B69D8()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 168) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2287B6A38()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(v0 + 160);
  v2 = *(void **)(v0 + 120);
  v3 = objc_msgSend(v2, sel_image);

  return (*(uint64_t (**)(id))(v0 + 8))(v3);
}

uint64_t sub_2287B6A98()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 160);
  v2 = *(void **)(v0 + 168);
  swift_willThrow();

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

id sub_2287B6AE4(void *a1, double a2, double a3)
{
  id v6;
  double v7;
  double v8;
  id v9;
  id v10;

  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDB120]), sel_init);
  objc_msgSend(a1, sel_coordinate);
  v9 = objc_msgSend((id)objc_opt_self(), sel_cameraLookingAtCenterCoordinate_fromDistance_pitch_heading_, v7, v8, 8000.0, 0.0, 0.0);
  objc_msgSend(v6, sel_setCamera_, v9);

  objc_msgSend(v6, sel_setMapType_, 0);
  objc_msgSend(v6, sel_setSize_, a2, a3);
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDB128]), sel_initWithOptions_, v6);

  return v10;
}

uint64_t sub_2287B6BF8(uint64_t result, void *a2, void *a3)
{
  _QWORD *v4;
  id v5;
  id v6;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD5F8);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else if (a2)
  {
    **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 64) + 40) = a2;
    v6 = a2;
    return swift_continuation_throwingResume();
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_2287B6C84@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_2287B7728();
  sub_2287CD2C8();
  swift_release();
  v4 = *(void **)(v3 + 40);
  *a2 = v4;
  return v4;
}

void sub_2287B6CF8(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_2287B7728();
  v2 = v1;
  sub_2287CD2BC();
  swift_release();

}

id sub_2287B6D94@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_2287B7728();
  sub_2287CD2C8();
  swift_release();
  v4 = *(void **)(v3 + 48);
  *a2 = v4;
  return v4;
}

void sub_2287B6E08(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_2287B7728();
  v2 = v1;
  sub_2287CD2BC();
  swift_release();

}

uint64_t sub_2287B6EA4(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2287B6F08;
  return v6(a1);
}

uint64_t sub_2287B6F08()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2287B6F54(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[2] = a1;
  v2 = sub_2287CD298();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = swift_task_alloc();
  v3 = sub_2287CD1C0();
  v1[6] = v3;
  v1[7] = *(_QWORD *)(v3 - 8);
  v1[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2287B6FDC()
{
  _QWORD *v0;
  _QWORD *v1;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[4] + 16))(v0[5], v0[2], v0[3]);
  sub_2287CD1B4();
  v0[9] = objc_msgSend((id)objc_opt_self(), sel_sharedSession);
  v1 = (_QWORD *)swift_task_alloc();
  v0[10] = v1;
  *v1 = v0;
  v1[1] = sub_2287B7088;
  return sub_2287CDA6C();
}

uint64_t sub_2287B7088(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v8;
  void *v9;

  v8 = *v4;
  v9 = *(void **)(*v4 + 72);
  *(_QWORD *)(*v4 + 88) = v3;
  swift_task_dealloc();

  if (!v3)
  {

    *(_QWORD *)(v8 + 96) = a2;
    *(_QWORD *)(v8 + 104) = a1;
  }
  return swift_task_switch();
}

uint64_t sub_2287B7114()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 64);
  v5 = *(_QWORD *)(v0 + 48);
  v6 = objc_allocWithZone(MEMORY[0x24BEBD640]);
  v7 = (void *)sub_2287CD2A4();
  v8 = objc_msgSend(v6, sel_initWithData_, v7);
  sub_2287B7220(v2, v1);

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v8);
}

uint64_t sub_2287B71D0()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 56) + 8))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 48));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2287B7220(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for LocationViewPopulator()
{
  uint64_t result;

  result = qword_2559BD718;
  if (!qword_2559BD718)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2287B72A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LocationViewPopulator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2287B72E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for LocationViewPopulator() - 8) + 80);
  v2 = (v1 + 32) & ~v1;
  swift_unknownObjectRelease();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD648);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v0 + v2, v3);
  return swift_deallocObject();
}

uint64_t sub_2287B7360(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LocationViewPopulator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2287B73A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for LocationViewPopulator() - 8) + 80);
  v3 = v0 + ((v2 + 32) & ~v2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_2287B49D8;
  v4[16] = v3;
  return swift_task_switch();
}

uint64_t sub_2287B741C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2287B7458()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for LocationViewPopulator() - 8) + 80);
  v2 = (v1 + 32) & ~v1;
  swift_unknownObjectRelease();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD648);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v0 + v2, v3);
  return swift_deallocObject();
}

uint64_t sub_2287B74E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v2 = *(_QWORD *)(type metadata accessor for LocationViewPopulator() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v0 + v3;
  v5 = (uint64_t *)(v0 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  v6 = *v5;
  v7 = v5[1];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v8;
  *v8 = v1;
  v8[1] = sub_2287B7BB8;
  v8[6] = v6;
  v8[7] = v7;
  v8[5] = v4;
  return swift_task_switch();
}

uint64_t sub_2287B757C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v1 = sub_2287CD298();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for LocationViewPopulator() - 8) + 80);
  v6 = (v3 + v4 + v5) & ~v5;
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD648);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v0 + v6, v7);
  return swift_deallocObject();
}

uint64_t sub_2287B7640()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t);

  v2 = *(_QWORD *)(sub_2287CD298() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for LocationViewPopulator() - 8) + 80);
  v6 = v3 + v4 + v5;
  v7 = v0 + v3;
  v8 = v0 + (v6 & ~v5);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v9;
  *v9 = v1;
  v9[1] = sub_2287B7BB8;
  v9[4] = v8;
  v12 = (uint64_t (*)(uint64_t))((char *)&dword_2559BD638 + dword_2559BD638);
  v10 = (_QWORD *)swift_task_alloc();
  v9[5] = v10;
  *v10 = v9;
  v10[1] = sub_2287B5A34;
  return v12(v7);
}

void sub_2287B7710()
{
  uint64_t v0;

  sub_2287BA088(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

unint64_t sub_2287B7728()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2559BD698;
  if (!qword_2559BD698)
  {
    v1 = type metadata accessor for LocationViewModel();
    result = MEMORY[0x22E2B5980](&protocol conformance descriptor for LocationViewModel, v1);
    atomic_store(result, &qword_2559BD698);
  }
  return result;
}

void sub_2287B7778()
{
  uint64_t v0;

  sub_2287B9FE4(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_2287B7790(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2287B77D4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2287B77F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2287B49D8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2559BD6A8 + dword_2559BD6A8))(a1, v4);
}

uint64_t sub_2287B7870()
{
  uint64_t *v0;

  return sub_2287B9D88(v0[2], v0[3], v0[4]);
}

unint64_t sub_2287B788C()
{
  unint64_t result;

  result = qword_2559BD6B8;
  if (!qword_2559BD6B8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2559BD6B8);
  }
  return result;
}

uint64_t sub_2287B78C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD648);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_2287B7908(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD648);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_2287B7940(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD648);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_2287B7988(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD648);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_2287B79D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD648);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_2287B7A18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD648);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_2287B7A60()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2287B7A6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD648);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_2287B7AAC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2287B7AB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD648);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

void sub_2287B7AFC()
{
  unint64_t v0;

  sub_2287B7B64();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_2287B7B64()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2559BD728[0])
  {
    type metadata accessor for LocationViewModel();
    v0 = sub_2287CD8EC();
    if (!v1)
      atomic_store(v0, qword_2559BD728);
  }
}

void sub_2287B7BBC()
{
  sub_2287B7710();
}

void sub_2287B7BD0()
{
  sub_2287B7778();
}

_QWORD *initializeBufferWithCopyOfBuffer for SizeChangeModifier(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for SizeChangeModifier()
{
  return swift_release();
}

_QWORD *assignWithCopy for SizeChangeModifier(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for SizeChangeModifier(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for SizeChangeModifier()
{
  return &type metadata for SizeChangeModifier;
}

uint64_t sub_2287B7C90()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2287B7CA0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_2287CD808();
  sub_2287CD430();
  v8 = v7;
  v10 = v9;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a1;
  *(_QWORD *)(v11 + 24) = a2;
  *a3 = v6;
  a3[1] = v8;
  a3[2] = v10;
  a3[3] = (uint64_t)sub_2287B7EC0;
  a3[4] = v11;
  return swift_retain();
}

void sub_2287B7D24()
{
  xmmword_2559BD758 = 0uLL;
}

double sub_2287B7D34@<D0>(_OWORD *a1@<X8>)
{
  double result;

  if (qword_2559BD258 != -1)
    swift_once();
  result = *(double *)&xmmword_2559BD758;
  *a1 = xmmword_2559BD758;
  return result;
}

double sub_2287B7D88(_OWORD *a1, void (*a2)(__int128 *__return_ptr))
{
  double result;
  __int128 v4;

  a2(&v4);
  result = *(double *)&v4;
  *a1 = v4;
  return result;
}

uint64_t sub_2287B7DD0()
{
  return sub_2287CD418();
}

uint64_t sub_2287B7DE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)@<X0>(uint64_t *@<X8>);
  uint64_t (*v10)@<X0>(uint64_t *@<X8>);
  uint64_t v11;
  uint64_t result;
  uint64_t (**v13)@<X0>(uint64_t *@<X8>);

  v6 = *v2;
  v5 = v2[1];
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  *(_QWORD *)(v7 + 24) = v5;
  swift_retain();
  v8 = sub_2287CD8F8();
  v10 = v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD768);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a2, a1, v11);
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD770);
  v13 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(a2 + *(int *)(result + 36));
  *v13 = sub_2287B7EB8;
  v13[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v7;
  v13[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v8;
  v13[3] = v10;
  return result;
}

uint64_t sub_2287B7E94()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2287B7EB8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_2287B7CA0(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_2287B7EC0(double *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(double, double))(v1 + 16))(*a1, a1[1]);
}

ValueMetadata *type metadata accessor for SizeChangeModifier.SizePreferenceKey()
{
  return &type metadata for SizeChangeModifier.SizePreferenceKey;
}

unint64_t sub_2287B7EF8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559BD778;
  if (!qword_2559BD778)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BD770);
    v2[0] = sub_2287B7F94(&qword_2559BD780, &qword_2559BD768, MEMORY[0x24BDEFB78]);
    v2[1] = sub_2287B7F94(&qword_2559BD788, &qword_2559BD790, MEMORY[0x24BDEF370]);
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559BD778);
  }
  return result;
}

uint64_t sub_2287B7F94(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22E2B5980](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

id sub_2287B7FDC(double a1, double a2, double a3, double a4)
{
  char *v4;
  char *v5;
  objc_class *ObjectType;
  uint64_t v11;
  id v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  objc_super v18;

  v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  v11 = OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLayerView;
  v12 = objc_allocWithZone(MEMORY[0x24BEBDB00]);
  v13 = v4;
  *(_QWORD *)&v5[v11] = objc_msgSend(v12, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v14 = OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLayer;
  *(_QWORD *)&v13[v14] = objc_msgSend(objc_allocWithZone((Class)SHListeningLayer), sel_initWithIntroAnimation_useCustomCompatibleBackground_, 0, 1);
  v15 = OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLabel;
  *(_QWORD *)&v13[v15] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v18.receiver = v13;
  v18.super_class = ObjectType;
  v16 = objc_msgSendSuper2(&v18, sel_initWithFrame_, a1, a2, a3, a4);
  sub_2287B8114();

  return v16;
}

id sub_2287B8114()
{
  char *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t ObjCClassFromMetadata;
  id v7;
  void *v8;
  uint64_t v9;
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
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v30;
  id v31;

  swift_getObjectType();
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v1 = *(void **)&v0[OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLayerView];
  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v2 = objc_msgSend(v1, sel_layer);
  v31 = *(id *)&v0[OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLayer];
  objc_msgSend(v2, sel_addSublayer_);

  objc_msgSend(v0, sel_addSubview_, v1);
  v3 = *(void **)&v0[OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLabel];
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v0, sel_addSubview_, v3);
  v4 = objc_msgSend((id)objc_opt_self(), sel_systemFontOfSize_weight_, 62.0, *MEMORY[0x24BEBB610]);
  objc_msgSend(v3, sel_setFont_, v4);

  v5 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
  objc_msgSend(v3, sel_setTextColor_, v5);

  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v7 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_2287CD208();

  v8 = (void *)sub_2287CD9A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_setText_, v8, 0xE000000000000000);

  v30 = (id)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD7D8);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_2287CFF90;
  v10 = objc_msgSend(v1, sel_leadingAnchor);
  v11 = objc_msgSend(v0, sel_leadingAnchor);
  v12 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v11);

  *(_QWORD *)(v9 + 32) = v12;
  v13 = objc_msgSend(v1, sel_centerYAnchor);
  v14 = objc_msgSend(v0, sel_centerYAnchor);
  v15 = objc_msgSend(v13, (SEL)&selRef_setClipsToBounds_ + 6, v14);

  *(_QWORD *)(v9 + 40) = v15;
  v16 = objc_msgSend(v1, sel_heightAnchor);
  v17 = objc_msgSend(v0, sel_heightAnchor);
  v18 = objc_msgSend(v16, sel_constraintEqualToAnchor_multiplier_, v17, 0.65);

  *(_QWORD *)(v9 + 48) = v18;
  v19 = objc_msgSend(v1, sel_widthAnchor);
  v20 = objc_msgSend(v0, sel_heightAnchor);
  v21 = objc_msgSend(v19, sel_constraintEqualToAnchor_multiplier_, v20, 0.65);

  *(_QWORD *)(v9 + 56) = v21;
  v22 = objc_msgSend(v3, sel_centerYAnchor);
  v23 = objc_msgSend(v0, sel_centerYAnchor);
  v24 = objc_msgSend(v22, sel_constraintEqualToAnchor_, v23);

  *(_QWORD *)(v9 + 64) = v24;
  v25 = objc_msgSend(v3, sel_trailingAnchor);
  v26 = objc_msgSend(v0, sel_trailingAnchor);
  v27 = objc_msgSend(v25, sel_constraintEqualToAnchor_constant_, v26, -36.0);

  *(_QWORD *)(v9 + 72) = v27;
  sub_2287CDA0C();
  sub_2287B8928();
  v28 = (void *)sub_2287CD9F4();
  swift_bridgeObjectRelease();
  objc_msgSend(v30, sel_activateConstraints_, v28);

  return objc_msgSend(v31, sel_startActiveListeningAnimation);
}

id sub_2287B8648(void *a1)
{
  char *v1;
  char *v2;
  objc_class *ObjectType;
  uint64_t v5;
  id v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  objc_super v14;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  v5 = OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLayerView;
  v6 = objc_allocWithZone(MEMORY[0x24BEBDB00]);
  v7 = v2;
  *(_QWORD *)&v2[v5] = objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v8 = OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLayer;
  *(_QWORD *)&v7[v8] = objc_msgSend(objc_allocWithZone((Class)SHListeningLayer), sel_initWithIntroAnimation_useCustomCompatibleBackground_, 0, 1);
  v9 = OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLabel;
  *(_QWORD *)&v7[v9] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v14.receiver = v7;
  v14.super_class = ObjectType;
  v10 = objc_msgSendSuper2(&v14, sel_initWithCoder_, a1);
  v11 = v10;
  if (v10)
  {
    v12 = v10;
    sub_2287B8114();

  }
  return v11;
}

id sub_2287B888C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AmbientListeningUIView()
{
  return objc_opt_self();
}

unint64_t sub_2287B8928()
{
  unint64_t result;

  result = qword_2559BD7E0;
  if (!qword_2559BD7E0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2559BD7E0);
  }
  return result;
}

uint64_t sub_2287B8964()
{
  return MEMORY[0x24BEE0948];
}

uint64_t sub_2287B8970@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  sub_2287B89B0();
  result = sub_2287CDB38();
  *a1 = result;
  return result;
}

unint64_t sub_2287B89B0()
{
  unint64_t result;

  result = qword_2559BD7E8;
  if (!qword_2559BD7E8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2559BD7E8);
  }
  return result;
}

uint64_t MatchResult.showStreamingServiceLink.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t MatchResult.showStreamingServiceLink.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*MatchResult.showStreamingServiceLink.modify())()
{
  return nullsub_1;
}

ShazamKitUI::MatchResult __swiftcall MatchResult.init(mediaItem:)(ShazamKitUI::MatchResult mediaItem)
{
  uint64_t v1;

  *(_BYTE *)v1 = 1;
  *(_QWORD *)(v1 + 8) = *(_QWORD *)&mediaItem.showStreamingServiceLink;
  return mediaItem;
}

uint64_t static MatchResult.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 != *a2)
    return 0;
  sub_2287B8A78();
  return sub_2287CDA9C() & 1;
}

unint64_t sub_2287B8A78()
{
  unint64_t result;

  result = qword_2559BD7F0;
  if (!qword_2559BD7F0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2559BD7F0);
  }
  return result;
}

uint64_t sub_2287B8AB4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 != *a2)
    return 0;
  sub_2287B8A78();
  return sub_2287CDA9C() & 1;
}

BOOL _s11ShazamKitUI17MatchingFlowStateO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  char v9;
  char v10;
  void *v12;
  void *v13;
  char v14;
  id v16;
  void *v17;

  v3 = *(void **)a1;
  v2 = *(void **)(a1 + 8);
  v4 = *(unsigned __int8 *)(a1 + 16);
  v6 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v7 = *(unsigned __int8 *)(a2 + 16);
  if (*(_BYTE *)(a1 + 16))
  {
    if (v4 == 1)
    {
      if (v7 == 1)
      {
        if (v3)
        {
          v17 = *(void **)a1;
          if (v6)
          {
            type metadata accessor for SHError(0);
            v8 = 1;
            sub_2287B9054(v3, v2, 1);
            sub_2287B9054((id)v6, (void *)v5, 1);
            sub_2287B9054(v3, v2, 1);
            sub_2287B9054((id)v6, (void *)v5, 1);
            sub_2287B9054(v3, v2, 1);
            sub_2287B9054((id)v6, (void *)v5, 1);
            sub_2287B9054(v3, v2, 1);
            sub_2287B925C();
            v9 = sub_2287CD994();
            sub_2287B9080(v3, v2, 1);
            sub_2287B9080((void *)v6, (void *)v5, 1);
            sub_2287B9080((void *)v6, (void *)v5, 1);
            sub_2287B9080(v3, v2, 1);
            sub_2287B9080((void *)v6, (void *)v5, 1);

            sub_2287B9080(v3, v2, 1);
            if ((v9 & 1) != 0)
              return v8;
            return 0;
          }
          sub_2287B9054(0, (void *)v5, 1);
          sub_2287B9054(v3, v2, 1);
          sub_2287B9054(0, (void *)v5, 1);
          sub_2287B9054(v3, v2, 1);
          sub_2287B9054(0, (void *)v5, 1);
          sub_2287B9054(v3, v2, 1);
          sub_2287B9080(v3, v2, 1);
          sub_2287B9080(0, (void *)v5, 1);

          sub_2287B9080(v3, v2, 1);
          v12 = 0;
        }
        else
        {
          v16 = (id)v6;
          v8 = 1;
          sub_2287B9054((id)v6, (void *)v5, 1);
          sub_2287B9054(0, v2, 1);
          sub_2287B9080(0, v2, 1);
          sub_2287B9080((void *)v6, (void *)v5, 1);
          if (!v6)
            return v8;
          sub_2287B9080(0, v2, 1);
          v12 = (void *)v6;
        }
        v13 = (void *)v5;
        v14 = 1;
        goto LABEL_17;
      }
    }
    else if (v7 == 2 && (v5 | v6) == 0)
    {
      sub_2287B9080(*(void **)a1, v2, 2);
      sub_2287B9080(0, 0, 2);
      return 1;
    }
    goto LABEL_16;
  }
  if (*(_BYTE *)(a2 + 16))
  {
LABEL_16:
    sub_2287B9054(*(id *)a2, *(void **)(a2 + 8), v7);
    sub_2287B9054(v3, v2, v4);
    sub_2287B9080(v3, v2, v4);
    v12 = (void *)v6;
    v13 = (void *)v5;
    v14 = v7;
LABEL_17:
    sub_2287B9080(v12, v13, v14);
    return 0;
  }
  if (((*(_QWORD *)a1 & 1) == 0) == (v6 & 1))
  {
    sub_2287B9054(*(id *)a2, *(void **)(a2 + 8), 0);
    sub_2287B9054(v3, v2, 0);
    sub_2287B9080(v3, v2, 0);
    v12 = (void *)v6;
    v13 = (void *)v5;
    v14 = 0;
    goto LABEL_17;
  }
  sub_2287B8A78();
  sub_2287B9054((id)v6, (void *)v5, 0);
  sub_2287B9054(v3, v2, 0);
  sub_2287B9054((id)v6, (void *)v5, 0);
  sub_2287B9054(v3, v2, 0);
  v10 = sub_2287CDA9C();
  sub_2287B9080(v3, v2, 0);
  sub_2287B9080((void *)v6, (void *)v5, 0);
  sub_2287B9080((void *)v6, (void *)v5, 0);
  sub_2287B9080(v3, v2, 0);
  return (v10 & 1) != 0;
}

uint64_t initializeBufferWithCopyOfBuffer for MatchResult(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v3;
  v4 = v3;
  return a1;
}

void destroy for MatchResult(uint64_t a1)
{

}

uint64_t assignWithCopy for MatchResult(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(void **)(a2 + 8);
  v4 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v3;
  v5 = v3;

  return a1;
}

uint64_t assignWithTake for MatchResult(uint64_t a1, uint64_t a2)
{
  void *v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for MatchResult(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MatchResult(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MatchResult()
{
  return &type metadata for MatchResult;
}

id sub_2287B9054(id result, void *a2, char a3)
{
  if (a3)
  {
    if (a3 != 1)
      return result;
    a2 = result;
  }
  return a2;
}

void destroy for MatchingFlowState(uint64_t a1)
{
  sub_2287B9080(*(void **)a1, *(void **)(a1 + 8), *(_BYTE *)(a1 + 16));
}

void sub_2287B9080(void *a1, void *a2, char a3)
{
  if (a3)
  {
    if (a3 != 1)
      return;
    a2 = a1;
  }

}

uint64_t _s11ShazamKitUI17MatchingFlowStateOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  char v5;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_2287B9054(*(id *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for MatchingFlowState(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_2287B9054(*(id *)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_2287B9080(v6, v7, v8);
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

uint64_t assignWithTake for MatchingFlowState(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  void *v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_2287B9080(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for MatchingFlowState(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MatchingFlowState(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_2287B921C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_2287B9234(uint64_t result, unsigned int a2)
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

ValueMetadata *type metadata accessor for MatchingFlowState()
{
  return &type metadata for MatchingFlowState;
}

unint64_t sub_2287B925C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2559BD340;
  if (!qword_2559BD340)
  {
    type metadata accessor for SHError(255);
    result = MEMORY[0x22E2B5980](&unk_2287CF3B4, v1);
    atomic_store(result, (unint64_t *)&qword_2559BD340);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for MatchResultTitles(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for MatchResultTitles()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MatchResultTitles(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for MatchResultTitles(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for MatchResultTitles(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MatchResultTitles(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MatchResultTitles(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MatchResultTitles()
{
  return &type metadata for MatchResultTitles;
}

uint64_t sub_2287B94B8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2287B94C8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t KeyPath;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE v49[7];

  swift_bridgeObjectRetain();
  sub_2287CD574();
  type metadata accessor for LocalizationBundle();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v5 = (void *)objc_opt_self();
  v6 = objc_msgSend(v5, sel_bundleForClass_, ObjCClassFromMetadata);
  LOWORD(v32) = 256;
  v7 = sub_2287CD754();
  v45 = v8;
  v46 = v7;
  v10 = v9;
  v48 = v11;
  if (qword_2559BD310 != -1)
    swift_once();
  v38 = qword_2559C0860;
  v39 = *a1;
  v44 = *(_QWORD *)algn_2559C0868;
  swift_bridgeObjectRetain();
  v37 = sub_2287CD67C();
  sub_2287CD928();
  v13 = v12;
  v15 = v14;
  v43 = sub_2287CD6E8();
  KeyPath = swift_getKeyPath();
  if (qword_2559BD2A0 != -1)
    swift_once();
  v16 = qword_2559C0800;
  v47 = swift_getKeyPath();
  v41 = v16;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_2287CD574();
  v17 = objc_msgSend(v5, sel_bundleForClass_, ObjCClassFromMetadata, 0, v32);
  v18 = sub_2287CD754();
  v20 = v19;
  v22 = v21;
  v40 = v23;
  if (qword_2559BD318 != -1)
    swift_once();
  v35 = qword_2559C0870;
  v36 = *(_QWORD *)algn_2559C0878;
  swift_bridgeObjectRetain();
  v34 = sub_2287CD67C();
  sub_2287CD928();
  v25 = v24;
  v27 = v26;
  v28 = sub_2287CD6C4();
  v29 = swift_getKeyPath();
  if (qword_2559BD2A8 != -1)
    swift_once();
  v30 = qword_2559C0808;
  v33 = swift_getKeyPath();
  *(_QWORD *)a2 = v46;
  *(_QWORD *)(a2 + 8) = v45;
  *(_BYTE *)(a2 + 16) = v10 & 1;
  *(_QWORD *)(a2 + 24) = v48;
  *(_QWORD *)(a2 + 32) = v38;
  *(_QWORD *)(a2 + 40) = v44;
  *(_QWORD *)(a2 + 48) = v39;
  *(_DWORD *)(a2 + 56) = v37;
  *(_QWORD *)(a2 + 64) = v13;
  *(_QWORD *)(a2 + 72) = v15;
  *(_BYTE *)(a2 + 80) = 1;
  *(_QWORD *)(a2 + 88) = KeyPath;
  *(_QWORD *)(a2 + 96) = v43;
  *(_QWORD *)(a2 + 104) = v47;
  *(_QWORD *)(a2 + 112) = v41;
  *(_QWORD *)(a2 + 120) = v18;
  *(_QWORD *)(a2 + 128) = v20;
  *(_BYTE *)(a2 + 136) = v22 & 1;
  *(_QWORD *)(a2 + 144) = v40;
  *(_QWORD *)(a2 + 152) = v35;
  *(_QWORD *)(a2 + 160) = v36;
  *(_QWORD *)(a2 + 168) = v39;
  *(_DWORD *)(a2 + 176) = v34;
  *(_QWORD *)(a2 + 184) = v25;
  *(_QWORD *)(a2 + 192) = v27;
  *(_BYTE *)(a2 + 200) = 1;
  *(_DWORD *)(a2 + 201) = *(_DWORD *)v49;
  *(_DWORD *)(a2 + 204) = *(_DWORD *)&v49[3];
  *(_QWORD *)(a2 + 208) = v29;
  *(_QWORD *)(a2 + 216) = v28;
  *(_QWORD *)(a2 + 224) = v33;
  *(_QWORD *)(a2 + 232) = v30;
  sub_2287B9A60(v46, v45, v10 & 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2287B9A60(v18, v20, v22 & 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain_n();
  sub_2287B4820(v18, v20, v22 & 1);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2287B4820(v46, v45, v10 & 1);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

__n128 sub_2287B9968@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __n128 result;
  _OWORD v11[2];
  uint64_t v12;
  _OWORD v13[15];

  v3 = *(_OWORD *)(v1 + 16);
  v11[0] = *(_OWORD *)v1;
  v11[1] = v3;
  v12 = *(_QWORD *)(v1 + 32);
  sub_2287B94C8((uint64_t *)v11, (uint64_t)v13);
  v4 = v13[13];
  *(_OWORD *)(a1 + 192) = v13[12];
  *(_OWORD *)(a1 + 208) = v4;
  *(_OWORD *)(a1 + 224) = v13[14];
  v5 = v13[9];
  *(_OWORD *)(a1 + 128) = v13[8];
  *(_OWORD *)(a1 + 144) = v5;
  v6 = v13[11];
  *(_OWORD *)(a1 + 160) = v13[10];
  *(_OWORD *)(a1 + 176) = v6;
  v7 = v13[5];
  *(_OWORD *)(a1 + 64) = v13[4];
  *(_OWORD *)(a1 + 80) = v7;
  v8 = v13[7];
  *(_OWORD *)(a1 + 96) = v13[6];
  *(_OWORD *)(a1 + 112) = v8;
  v9 = v13[1];
  *(_OWORD *)a1 = v13[0];
  *(_OWORD *)(a1 + 16) = v9;
  result = (__n128)v13[3];
  *(_OWORD *)(a1 + 32) = v13[2];
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t sub_2287B9A08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2287CD508();
  *a1 = result;
  return result;
}

uint64_t sub_2287B9A30()
{
  swift_retain();
  return sub_2287CD514();
}

uint64_t sub_2287B9A60(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

unint64_t sub_2287B9A74()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2559BD7F8;
  if (!qword_2559BD7F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BD800);
    v2 = sub_2287B9AD8();
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDF3F50], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559BD7F8);
  }
  return result;
}

unint64_t sub_2287B9AD8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2559BD808;
  if (!qword_2559BD808)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BD810);
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDF5428], v1);
    atomic_store(result, (unint64_t *)&qword_2559BD808);
  }
  return result;
}

uint64_t LocationViewModel.address.setter()
{
  swift_getKeyPath();
  sub_2287B7728();
  sub_2287CD2BC();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t LocationViewModel.address.getter()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_2287B7728();
  sub_2287CD2C8();
  swift_release();
  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2287B9C50@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_2287B7728();
  sub_2287CD2C8();
  swift_release();
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 32);
  *a2 = *(_QWORD *)(v3 + 24);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2287B9CE0()
{
  swift_getKeyPath();
  sub_2287B7728();
  swift_bridgeObjectRetain();
  sub_2287CD2BC();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2287B9D88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  *(_QWORD *)(a1 + 24) = a2;
  *(_QWORD *)(a1 + 32) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for LocationViewModel()
{
  uint64_t result;

  result = qword_2559BD848;
  if (!qword_2559BD848)
    return swift_getSingletonMetadata();
  return result;
}

void (*LocationViewModel.address.modify(_QWORD *a1))(_QWORD **a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x30uLL);
  *a1 = v4;
  v4[3] = v2;
  swift_getKeyPath();
  v4[4] = OBJC_IVAR____TtC11ShazamKitUI17LocationViewModel___observationRegistrar;
  *v4 = v2;
  v4[5] = sub_2287B7728();
  sub_2287CD2C8();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_2287CD2E0();
  swift_release();
  swift_beginAccess();
  return sub_2287B9F08;
}

void sub_2287B9F08(_QWORD **a1)
{
  _QWORD *v1;

  v1 = *a1;
  swift_endAccess();
  *v1 = v1[3];
  swift_getKeyPath();
  sub_2287CD2D4();
  swift_release();
  free(v1);
}

void *sub_2287B9F70()
{
  uint64_t v0;
  void *v1;
  id v2;

  swift_getKeyPath();
  sub_2287B7728();
  sub_2287CD2C8();
  swift_release();
  v1 = *(void **)(v0 + 40);
  v2 = v1;
  return v1;
}

void sub_2287B9FE4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = a2;
  v3 = a2;

}

void *sub_2287BA014()
{
  uint64_t v0;
  void *v1;
  id v2;

  swift_getKeyPath();
  sub_2287B7728();
  sub_2287CD2C8();
  swift_release();
  v1 = *(void **)(v0 + 48);
  v2 = v1;
  return v1;
}

void sub_2287BA088(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = a2;
  v3 = a2;

}

uint64_t LocationViewModel.__allocating_init(location:albumArtURL:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD650);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287BA180(a2, (uint64_t)v5);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 24) = 0u;
  *(_OWORD *)(v6 + 40) = 0u;
  sub_2287CD2EC();
  *(_QWORD *)(v6 + 16) = a1;
  sub_2287BA1C8((uint64_t)v5, v6 + OBJC_IVAR____TtC11ShazamKitUI17LocationViewModel_albumArtURL);
  *(_QWORD *)(v6 + 56) = 0;
  sub_2287BA210(a2);
  return v6;
}

uint64_t sub_2287BA180(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD650);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2287BA1C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD650);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2287BA210(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD650);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t LocationViewModel.__allocating_init(location:artworkView:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD650);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2287CD298();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 24) = 0u;
  *(_OWORD *)(v7 + 40) = 0u;
  sub_2287CD2EC();
  *(_QWORD *)(v7 + 16) = a1;
  sub_2287BA1C8((uint64_t)v5, v7 + OBJC_IVAR____TtC11ShazamKitUI17LocationViewModel_albumArtURL);
  *(_QWORD *)(v7 + 56) = a2;
  return v7;
}

id *LocationViewModel.deinit()
{
  id *v0;
  char *v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_release();
  sub_2287BA210((uint64_t)v0 + OBJC_IVAR____TtC11ShazamKitUI17LocationViewModel_albumArtURL);
  v1 = (char *)v0 + OBJC_IVAR____TtC11ShazamKitUI17LocationViewModel___observationRegistrar;
  v2 = sub_2287CD2F8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t LocationViewModel.__deallocating_deinit()
{
  id *v0;
  char *v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_release();
  sub_2287BA210((uint64_t)v0 + OBJC_IVAR____TtC11ShazamKitUI17LocationViewModel_albumArtURL);
  v1 = (char *)v0 + OBJC_IVAR____TtC11ShazamKitUI17LocationViewModel___observationRegistrar;
  v2 = sub_2287CD2F8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_2287BA42C()
{
  return type metadata accessor for LocationViewModel();
}

void sub_2287BA434()
{
  unint64_t v0;
  unint64_t v1;

  sub_2287BA4F0();
  if (v0 <= 0x3F)
  {
    sub_2287CD2F8();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for LocationViewModel()
{
  return swift_lookUpClassMethod();
}

void sub_2287BA4F0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2559BD858[0])
  {
    sub_2287CD298();
    v0 = sub_2287CDB08();
    if (!v1)
      atomic_store(v0, qword_2559BD858);
  }
}

uint64_t sub_2287BA554()
{
  return sub_2287B7870();
}

ValueMetadata *type metadata accessor for MediaLibraryItemRow()
{
  return &type metadata for MediaLibraryItemRow;
}

uint64_t sub_2287BA578()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_2287BA588(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  void (*v14)(char *, uint64_t);
  id v15;
  uint64_t v16;
  __int16 v17;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD910);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v16 - v9;
  v16 = 0;
  v17 = 1;
  *(_QWORD *)(swift_allocObject() + 16) = a1;
  v11 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD918);
  sub_2287BACB4();
  sub_2287CD79C();
  swift_release();
  v12 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v12(v8, v10, v4);
  *(_QWORD *)a2 = v11;
  *(int64x2_t *)(a2 + 8) = vdupq_n_s64(0x4044000000000000uLL);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD938);
  v12((char *)(a2 + *(int *)(v13 + 48)), v8, v4);
  v14 = *(void (**)(char *, uint64_t))(v5 + 8);
  v15 = v11;
  v14(v10, v4);
  v14(v8, v4);

}

uint64_t sub_2287BA708(void *a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD658);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2287CDA60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  sub_2287CDA3C();
  v5 = a1;
  v6 = sub_2287CDA30();
  v7 = (_QWORD *)swift_allocObject();
  v8 = MEMORY[0x24BEE6930];
  v7[2] = v6;
  v7[3] = v8;
  v7[4] = v5;
  sub_2287C2508((uint64_t)v3, (uint64_t)&unk_2559BD948, (uint64_t)v7);
  return swift_release();
}

uint64_t sub_2287BA7E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[15] = a1;
  v4[16] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD950);
  v4[17] = v5;
  v4[18] = *(_QWORD *)(v5 - 8);
  v4[19] = swift_task_alloc();
  v4[20] = swift_task_alloc();
  v4[21] = swift_task_alloc();
  sub_2287CDA3C();
  v4[22] = sub_2287CDA30();
  v4[23] = sub_2287CDA18();
  v4[24] = v6;
  return swift_task_switch();
}

uint64_t sub_2287BA898()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[21];
  v2 = v0[16];
  v3 = (void *)objc_opt_self();
  v0[7] = v1;
  v0[2] = v0;
  v0[3] = sub_2287BA94C;
  v4 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v5 = v0 + 10;
  v5[1] = 0x40000000;
  v5[2] = sub_2287BAB40;
  v5[3] = &block_descriptor_2;
  v5[4] = v4;
  objc_msgSend(v3, sel_presentMediaItem_presentationSettings_completionHandler_, v2, 0, v5);
  return swift_continuation_await();
}

uint64_t sub_2287BA94C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 48);
  *(_QWORD *)(*v0 + 200) = v2;
  if (!v2)
    *(_DWORD *)(v1 + 208) = *(_DWORD *)(*(_QWORD *)(v1 + 136) + 48);
  return swift_task_switch();
}

uint64_t sub_2287BA9B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  char *v13;
  char *v14;

  v1 = *(int *)(v0 + 208);
  v2 = *(uint64_t **)(v0 + 168);
  v4 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 160);
  v5 = *(_QWORD *)(v0 + 136);
  v6 = *(_QWORD *)(v0 + 144);
  v7 = *(_QWORD **)(v0 + 120);
  swift_release();
  v8 = (char *)v2 + v1;
  v9 = (char *)(v3 + *(int *)(v5 + 48));
  v10 = *v2;
  v11 = sub_2287CD298();
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32);
  v12(v9, v8, v11);
  v13 = (char *)(v4 + *(int *)(v5 + 48));
  v12(v13, v9, v11);
  v14 = (char *)v7 + *(int *)(v5 + 48);
  *v7 = v10;
  v12(v14, v13, v11);
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v7, 0, 1, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2287BAAB0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void **)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 144);
  v4 = *(_QWORD *)(v0 + 120);
  swift_release();
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v4, 1, 1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2287BAB40(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  uint64_t v14;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD950);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (uint64_t *)((char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = *(_QWORD *)(a1 + 32);
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD5F8);
    swift_allocError();
    *v11 = a4;
    v12 = a4;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    *v9 = a2;
    sub_2287CD28C();
    sub_2287BB658((uint64_t)v9, *(_QWORD *)(*(_QWORD *)(v10 + 64) + 40), &qword_2559BD950);
    return swift_continuation_throwingResume();
  }
}

void sub_2287BAC3C(uint64_t a1@<X8>)
{
  void **v1;
  void *v3;
  uint64_t v4;

  v3 = *v1;
  *(_QWORD *)a1 = sub_2287CD538();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD908);
  sub_2287BA588(v3, a1 + *(int *)(v4 + 44));
}

uint64_t sub_2287BAC88()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2287BACAC()
{
  uint64_t v0;

  return sub_2287BA708(*(void **)(v0 + 16));
}

unint64_t sub_2287BACB4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2559BD920;
  if (!qword_2559BD920)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BD918);
    v2 = sub_2287B7F94(&qword_2559BD928, &qword_2559BD930, MEMORY[0x24BDEFAD8]);
    v3[0] = MEMORY[0x24BDF4610];
    v3[1] = v2;
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2559BD920);
  }
  return result;
}

uint64_t sub_2287BAD38()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_2287BAD64(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_2287B49D8;
  return sub_2287BA7E4(a1, v4, v5, v6);
}

uint64_t initializeBufferWithCopyOfBuffer for MediaLibraryItemRowContent(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v4 = v3;
  return a1;
}

void destroy for MediaLibraryItemRowContent(id *a1)
{

}

uint64_t assignWithCopy for MediaLibraryItemRowContent(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
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

uint64_t assignWithTake for MediaLibraryItemRowContent(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for MediaLibraryItemRowContent(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MediaLibraryItemRowContent(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MediaLibraryItemRowContent()
{
  return &type metadata for MediaLibraryItemRowContent;
}

uint64_t sub_2287BAF44()
{
  return sub_2287B7F94(&qword_2559BD958, &qword_2559BD960, MEMORY[0x24BDF4498]);
}

uint64_t sub_2287BAF70()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2287BAF80@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  _QWORD v38[2];
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;

  v37 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD650);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for AlbumArt();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD968);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v35 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v35 - v16;
  v18 = objc_msgSend(a1, sel_artworkURL);
  if (v18)
  {
    v19 = v18;
    sub_2287CD28C();

    v20 = sub_2287CD298();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v5, 0, 1, v20);
  }
  else
  {
    v21 = sub_2287CD298();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v5, 1, 1, v21);
  }
  sub_2287BB658((uint64_t)v5, (uint64_t)v8, &qword_2559BD650);
  *(_QWORD *)&v8[*(int *)(v6 + 20)] = 0;
  sub_2287CD8F8();
  sub_2287CD424();
  sub_2287BB5D8((uint64_t)v8, (uint64_t)v15);
  v22 = &v15[*(int *)(v9 + 36)];
  v23 = v46;
  *(_OWORD *)v22 = v45;
  *((_OWORD *)v22 + 1) = v23;
  *((_OWORD *)v22 + 2) = v47;
  sub_2287BB61C((uint64_t)v8);
  sub_2287BB658((uint64_t)v15, (uint64_t)v17, &qword_2559BD968);
  v35 = sub_2287CD5A4();
  sub_2287BB2B8(a1, (uint64_t)v38);
  v24 = v38[0];
  v25 = v38[1];
  v26 = v39;
  v28 = v40;
  v27 = v41;
  v29 = v42;
  v30 = v43;
  v31 = v44;
  sub_2287BB69C((uint64_t)v17, (uint64_t)v12);
  v36 = v17;
  v32 = v37;
  sub_2287BB69C((uint64_t)v12, v37);
  v33 = v32 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2559BD970) + 48);
  *(_QWORD *)v33 = v35;
  *(_QWORD *)(v33 + 8) = 0;
  *(_BYTE *)(v33 + 16) = 1;
  *(_QWORD *)(v33 + 24) = v24;
  *(_QWORD *)(v33 + 32) = v25;
  *(_BYTE *)(v33 + 40) = v26;
  *(_QWORD *)(v33 + 48) = v28;
  *(_QWORD *)(v33 + 56) = v27;
  *(_QWORD *)(v33 + 64) = v29;
  *(_BYTE *)(v33 + 72) = v30;
  *(_QWORD *)(v33 + 80) = v31;
  sub_2287B9A60(v24, v25, v26);
  swift_bridgeObjectRetain();
  sub_2287B9A60(v27, v29, v30);
  swift_bridgeObjectRetain();
  sub_2287BB6E4((uint64_t)v36);
  sub_2287B4820(v24, v25, v26);
  swift_bridgeObjectRelease();
  sub_2287B4820(v27, v29, v30);
  swift_bridgeObjectRelease();
  return sub_2287BB6E4((uint64_t)v12);
}

uint64_t sub_2287BB2B8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  char v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v3 = objc_msgSend(a1, sel_title);
  if (v3)
  {
    v4 = v3;
    sub_2287CD9D0();

  }
  sub_2287B4FBC();
  v5 = sub_2287CD76C();
  v7 = v6;
  v9 = v8 & 1;
  sub_2287CD6C4();
  v10 = sub_2287CD730();
  v12 = v11;
  v14 = v13;
  swift_release();
  sub_2287B4820(v5, v7, v9);
  swift_bridgeObjectRelease();
  if (qword_2559BD2A0 != -1)
    swift_once();
  v15 = sub_2287CD718();
  v42 = v16;
  v43 = v15;
  v40 = v17;
  v44 = v18;
  sub_2287B4820(v10, v12, v14 & 1);
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(a1, sel_subtitle);
  if (v19)
  {
    v20 = v19;
    sub_2287CD9D0();

  }
  v21 = sub_2287CD76C();
  v23 = v22;
  v25 = v24 & 1;
  sub_2287CD6DC();
  v26 = sub_2287CD730();
  v28 = v27;
  v30 = v29;
  swift_release();
  sub_2287B4820(v21, v23, v25);
  swift_bridgeObjectRelease();
  if (qword_2559BD2A8 != -1)
    swift_once();
  v31 = v30 & 1;
  v32 = sub_2287CD718();
  v34 = v33;
  v36 = v35;
  v38 = v37 & 1;
  sub_2287B4820(v26, v28, v31);
  swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v43;
  *(_QWORD *)(a2 + 8) = v42;
  *(_BYTE *)(a2 + 16) = v40 & 1;
  *(_QWORD *)(a2 + 24) = v44;
  *(_QWORD *)(a2 + 32) = v32;
  *(_QWORD *)(a2 + 40) = v34;
  *(_BYTE *)(a2 + 48) = v38;
  *(_QWORD *)(a2 + 56) = v36;
  sub_2287B9A60(v43, v42, v40 & 1);
  swift_bridgeObjectRetain();
  sub_2287B9A60(v32, v34, v38);
  swift_bridgeObjectRetain();
  sub_2287B4820(v32, v34, v38);
  swift_bridgeObjectRelease();
  sub_2287B4820(v43, v42, v40 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2287BB5CC@<X0>(uint64_t a1@<X8>)
{
  void **v1;

  return sub_2287BAF80(*v1, a1);
}

uint64_t sub_2287BB5D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AlbumArt();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2287BB61C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AlbumArt();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2287BB658(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2287BB69C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD968);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2287BB6E4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD968);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2287BB728()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559BD978;
  if (!qword_2559BD978)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BD980);
    v2 = sub_2287B7F94(&qword_2559BD988, &qword_2559BD990, MEMORY[0x24BDF5428]);
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDF3F50], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559BD978);
  }
  return result;
}

void sub_2287BB7AC()
{
  qword_2559C07A0 = 0x6E20747369747241;
  *(_QWORD *)algn_2559C07A8 = 0xEB00000000656D61;
}

void sub_2287BB7D8()
{
  qword_2559C07B0 = 0x6D616E20676E6F53;
  *(_QWORD *)algn_2559C07B8 = 0xE900000000000065;
}

void sub_2287BB800()
{
  strcpy((char *)&qword_2559C07C0, "Artwork image");
  *(_WORD *)&algn_2559C07C8[6] = -4864;
}

void sub_2287BB830()
{
  qword_2559C07D0 = 0x20676E697373694DLL;
  *(_QWORD *)algn_2559C07D8 = 0xEF6B726F77747261;
}

void sub_2287BB860()
{
  strcpy((char *)&qword_2559C07E0, "Shazam Counts");
  *(_WORD *)&algn_2559C07E8[6] = -4864;
}

unint64_t sub_2287BB890(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD9B8);
  v2 = sub_2287CDBA4();
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
    sub_2287B7790(v6, (uint64_t)&v15, &qword_2559BD9C0);
    v7 = v15;
    v8 = v16;
    result = sub_2287BBDBC(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_2287BCEA4(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_2287BB9C4(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD9C8);
  v2 = sub_2287CDBA4();
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
    sub_2287B7790(v6, (uint64_t)&v13, &qword_2559BD9D0);
    v7 = v13;
    result = sub_2287BBE20(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_2287BCEA4(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
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

unint64_t sub_2287BBAF0(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  void *v5;
  id v6;
  id v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD9B0);
  v2 = (_QWORD *)sub_2287CDBA4();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = *(v4 - 1);
    v7 = v5;
    result = sub_2287BBE20((uint64_t)v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = 8 * result;
    *(_QWORD *)(v2[6] + v10) = v6;
    *(_QWORD *)(v2[7] + v10) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 2;
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

unint64_t sub_2287BBBF8(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD9A8);
  v2 = (_QWORD *)sub_2287CDBA4();
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
    result = sub_2287BBDBC(v5, v6);
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

uint64_t sub_2287BBD10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2287CD9D0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2287BBD40(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = a2;
  sub_2287BC100(a1, (uint64_t)sub_2287BC8C4, 0, isUniquelyReferenced_nonNull_native, &v8);
  v6 = v8;
  swift_bridgeObjectRelease();
  if (v2)
    swift_bridgeObjectRelease();
  return v6;
}

unint64_t sub_2287BBDBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2287CDC10();
  sub_2287CD9DC();
  v4 = sub_2287CDC1C();
  return sub_2287BBEAC(a1, a2, v4);
}

unint64_t sub_2287BBE20(uint64_t a1)
{
  uint64_t v2;

  sub_2287CD9D0();
  sub_2287CDC10();
  sub_2287CD9DC();
  v2 = sub_2287CDC1C();
  swift_bridgeObjectRelease();
  return sub_2287BBF8C(a1, v2);
}

unint64_t sub_2287BBEAC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2287CDBD4() & 1) == 0)
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
      while (!v14 && (sub_2287CDBD4() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2287BBF8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_2287CD9D0();
    v8 = v7;
    if (v6 == sub_2287CD9D0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_2287CDBD4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_2287CD9D0();
          v15 = v14;
          if (v13 == sub_2287CD9D0() && v15 == v16)
            break;
          v18 = sub_2287CDBD4();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_2287BC100(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  unint64_t v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  _QWORD *v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  _BOOL8 v45;
  uint64_t v46;
  char v47;
  char v48;
  _QWORD *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t result;
  void *v54;

  swift_bridgeObjectRetain();
  swift_retain();
  sub_2287BC8FC();
  if (!v8)
    goto LABEL_23;
  v10 = v7;
  v11 = v8;
  v54 = v9;
  v12 = (_QWORD *)*a5;
  v14 = sub_2287BBDBC(v7, v8);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v18 = v13;
  if (v12[3] >= v17)
  {
    if ((a4 & 1) != 0)
    {
      v21 = (_QWORD *)*a5;
      if ((v13 & 1) != 0)
        goto LABEL_9;
    }
    else
    {
      sub_2287BC714();
      v21 = (_QWORD *)*a5;
      if ((v18 & 1) != 0)
        goto LABEL_9;
    }
LABEL_11:
    v21[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v21[6] + 16 * v14);
    *v25 = v10;
    v25[1] = v11;
    *(_QWORD *)(v21[7] + 8 * v14) = v54;
    v26 = v21[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    v21[2] = v28;
LABEL_13:
    sub_2287BC8FC();
    if (v30)
    {
      v32 = v29;
      v33 = v30;
      v34 = v31;
      do
      {
        v41 = (_QWORD *)*a5;
        v42 = sub_2287BBDBC(v32, v33);
        v44 = v41[2];
        v45 = (v43 & 1) == 0;
        v27 = __OFADD__(v44, v45);
        v46 = v44 + v45;
        if (v27)
          goto LABEL_24;
        v47 = v43;
        if (v41[3] < v46)
        {
          sub_2287BC408(v46, 1);
          v42 = sub_2287BBDBC(v32, v33);
          if ((v47 & 1) != (v48 & 1))
            goto LABEL_26;
        }
        v49 = (_QWORD *)*a5;
        if ((v47 & 1) != 0)
        {
          v35 = 8 * v42;
          v36 = *(id *)(v49[7] + 8 * v42);
          swift_bridgeObjectRelease();

          v37 = v49[7];
          *(_QWORD *)(v37 + v35) = v36;
        }
        else
        {
          v49[(v42 >> 6) + 8] |= 1 << v42;
          v50 = (uint64_t *)(v49[6] + 16 * v42);
          *v50 = v32;
          v50[1] = v33;
          *(_QWORD *)(v49[7] + 8 * v42) = v34;
          v51 = v49[2];
          v27 = __OFADD__(v51, 1);
          v52 = v51 + 1;
          if (v27)
            goto LABEL_25;
          v49[2] = v52;
        }
        sub_2287BC8FC();
        v32 = v38;
        v33 = v39;
        v34 = v40;
      }
      while (v39);
    }
LABEL_23:
    swift_release();
    swift_bridgeObjectRelease();
    sub_2287BCE9C();
    return swift_release();
  }
  sub_2287BC408(v17, a4 & 1);
  v19 = sub_2287BBDBC(v10, v11);
  if ((v18 & 1) == (v20 & 1))
  {
    v14 = v19;
    v21 = (_QWORD *)*a5;
    if ((v18 & 1) == 0)
      goto LABEL_11;
LABEL_9:
    v22 = 8 * v14;
    v23 = *(id *)(v21[7] + 8 * v14);
    swift_bridgeObjectRelease();

    v24 = v21[7];
    *(_QWORD *)(v24 + v22) = v23;
    goto LABEL_13;
  }
LABEL_26:
  result = sub_2287CDBE0();
  __break(1u);
  return result;
}

uint64_t sub_2287BC408(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD9A8);
  v38 = a2;
  v6 = sub_2287CDB98();
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
    sub_2287CDC10();
    sub_2287CD9DC();
    result = sub_2287CDC1C();
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

id sub_2287BC714()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD9A8);
  v2 = *v0;
  v3 = sub_2287CDB8C();
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

id sub_2287BC8C4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  id v4;

  v2 = a1[1];
  v4 = (id)a1[2];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v4;
  swift_bridgeObjectRetain();
  return v4;
}

void sub_2287BC8FC()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void (*v11)(uint64_t *__return_ptr, _QWORD *);
  id v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  _QWORD v20[3];

  v1 = *v0;
  v3 = v0[3];
  v2 = v0[4];
  v4 = v3;
  if (v2)
  {
    v5 = (v2 - 1) & v2;
    v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    v7 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v6);
    v8 = *v7;
    v9 = v7[1];
    v10 = *(void **)(*(_QWORD *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    v11 = (void (*)(uint64_t *__return_ptr, _QWORD *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    v20[2] = v10;
    swift_bridgeObjectRetain();
    v12 = v10;
    v11(&v19, v20);

    swift_bridgeObjectRelease();
    return;
  }
  v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      v15 = v0[1];
      v16 = *(_QWORD *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        v5 = (v16 - 1) & v16;
        v6 = __clz(__rbit64(v16)) + (v13 << 6);
        v4 = v13;
        goto LABEL_3;
      }
      v17 = v3 + 2;
      v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        v16 = *(_QWORD *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          v13 = v17;
          goto LABEL_7;
        }
        v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          v16 = *(_QWORD *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            v13 = v3 + 3;
            goto LABEL_7;
          }
          v17 = v3 + 4;
          v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            v16 = *(_QWORD *)(v15 + 8 * v17);
            if (v16)
              goto LABEL_10;
            v13 = v3 + 5;
            v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              v16 = *(_QWORD *)(v15 + 8 * v13);
              if (v16)
                goto LABEL_7;
              v4 = v14 - 1;
              v18 = v3 + 6;
              while (v14 != v18)
              {
                v16 = *(_QWORD *)(v15 + 8 * v18++);
                if (v16)
                {
                  v13 = v18 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    v0[3] = v4;
    v0[4] = 0;
  }
}

void sub_2287BCA88(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;
  uint64_t inited;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  type metadata accessor for SHAnalyticsPayload(0);
  sub_2287B8A78();
  sub_2287BCE54();
  v2 = sub_2287CD970();
  v3 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v4 = objc_msgSend(v3, sel_bundleIdentifier);

  if (v4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD9A0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2287D0390;
    v6 = (void *)*MEMORY[0x24BE905B0];
    *(_QWORD *)(inited + 32) = *MEMORY[0x24BE905B0];
    *(_QWORD *)(inited + 40) = v4;
    v7 = v6;
    v8 = inited;
  }
  else
  {
    v8 = MEMORY[0x24BEE4AF8];
  }
  sub_2287BBAF0(v8);
  v9 = sub_2287CD970();
  swift_bridgeObjectRelease();
  sub_2287BBD40(v9, v2);
  v10 = (void *)objc_opt_self();
  v11 = (void *)sub_2287CD958();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_sendEvent_withPayload_, a1, v11);

}

void sub_2287BCC5C(uint64_t a1, uint64_t a2)
{
  uint64_t inited;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD998);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2287D0390;
  *(_QWORD *)(inited + 32) = sub_2287CD9D0();
  *(_QWORD *)(inited + 40) = v4;
  sub_2287CD9D0();
  v5 = sub_2287CD9A0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 48) = v5;
  v6 = sub_2287BBBF8(inited);
  v7 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v8 = objc_msgSend(v7, sel_bundleIdentifier);

  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD9A0);
    v9 = swift_initStackObject();
    *(_OWORD *)(v9 + 16) = xmmword_2287D0390;
    v10 = (void *)*MEMORY[0x24BE905B0];
    *(_QWORD *)(v9 + 32) = *MEMORY[0x24BE905B0];
    *(_QWORD *)(v9 + 40) = v8;
    v11 = v10;
    v12 = v9;
  }
  else
  {
    v12 = MEMORY[0x24BEE4AF8];
  }
  sub_2287BBAF0(v12);
  type metadata accessor for SHAnalyticsPayload(0);
  sub_2287B8A78();
  sub_2287BCE54();
  v13 = sub_2287CD970();
  swift_bridgeObjectRelease();
  sub_2287BBD40(v13, v6);
  v14 = (void *)objc_opt_self();
  v15 = (void *)sub_2287CD958();
  swift_bridgeObjectRelease();
  objc_msgSend(v14, sel_sendEvent_withPayload_, a2, v15);

}

unint64_t sub_2287BCE54()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2559BD428;
  if (!qword_2559BD428)
  {
    type metadata accessor for SHAnalyticsPayload(255);
    result = MEMORY[0x22E2B5980](&unk_2287CFA44, v1);
    atomic_store(result, (unint64_t *)&qword_2559BD428);
  }
  return result;
}

uint64_t sub_2287BCE9C()
{
  return swift_release();
}

_OWORD *sub_2287BCEA4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2287BCEB4@<X0>(uint64_t *a1@<X8>)
{
  return sub_2287BBD10(a1);
}

void sub_2287BCEC8()
{
  char *v0;
  void *v1;
  id v2;
  id v3;
  uint64_t ObjCClassFromMetadata;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  swift_getObjectType();
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v1 = *(void **)&v0[OBJC_IVAR____TtC11ShazamKitUI20AmbientNoMatchUIView_titleLabel];
  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v0, sel_addSubview_, v1);
  v2 = objc_msgSend((id)objc_opt_self(), sel_systemFontOfSize_weight_, 62.0, *MEMORY[0x24BEBB610]);
  objc_msgSend(v1, sel_setFont_, v2);

  v3 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
  objc_msgSend(v1, sel_setTextColor_, v3);

  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v5 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_2287CD208();

  v6 = (void *)sub_2287CD9A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setText_, v6, 0xE000000000000000);

  v7 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD7D8);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_2287D03A0;
  v9 = objc_msgSend(v1, sel_centerXAnchor);
  v10 = objc_msgSend(v0, sel_centerXAnchor);
  v11 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v10);

  *(_QWORD *)(v8 + 32) = v11;
  v12 = objc_msgSend(v1, sel_centerYAnchor);
  v13 = objc_msgSend(v0, sel_centerYAnchor);
  v14 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v13);

  *(_QWORD *)(v8 + 40) = v14;
  sub_2287CDA0C();
  sub_2287B8928();
  v15 = (id)sub_2287CD9F4();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_activateConstraints_, v15);

}

id sub_2287BD29C(void *a1)
{
  char *v1;
  objc_class *ObjectType;
  uint64_t v4;
  id v5;
  char *v6;
  id v7;
  id v8;
  id v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR____TtC11ShazamKitUI20AmbientNoMatchUIView_titleLabel;
  v5 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v6 = v1;
  *(_QWORD *)&v1[v4] = objc_msgSend(v5, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v11.receiver = v6;
  v11.super_class = ObjectType;
  v7 = objc_msgSendSuper2(&v11, sel_initWithCoder_, a1);
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    sub_2287BCEC8();

  }
  return v8;
}

uint64_t type metadata accessor for AmbientNoMatchUIView()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for MediaLibraryViewModel()
{
  return &type metadata for MediaLibraryViewModel;
}

uint64_t sub_2287BD438()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Assets()
{
  return objc_opt_self();
}

id sub_2287BD468()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for Assets();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_2559C07F0 = (uint64_t)result;
  return result;
}

void sub_2287BD4BC()
{
  qword_2559BDA08 = 0x746954686374616DLL;
  unk_2559BDA10 = 0xEF726F6C6F43656CLL;
}

uint64_t sub_2287BD4EC(uint64_t a1)
{
  return sub_2287BD6A0(a1, 0xD000000000000013, 0x80000002287D1BC0, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BDF3E88], &qword_2559C07F8);
}

uint64_t sub_2287BD518()
{
  uint64_t v0;
  id v1;
  uint64_t result;

  if (qword_2559BD290 != -1)
    swift_once();
  v0 = qword_2559BD288;
  swift_bridgeObjectRetain();
  if (v0 != -1)
    swift_once();
  v1 = (id)qword_2559C07F0;
  result = sub_2287CD820();
  qword_2559C0800 = result;
  return result;
}

uint64_t sub_2287BD5C0(uint64_t a1)
{
  return sub_2287BD6A0(a1, 0xD000000000000012, 0x80000002287D1BA0, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BDF3E88], &qword_2559C0808);
}

uint64_t sub_2287BD5EC(uint64_t a1)
{
  return sub_2287BD6A0(a1, 0xD000000000000011, 0x80000002287D1B80, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BDF3E88], &qword_2559C0810);
}

uint64_t sub_2287BD618(uint64_t a1)
{
  return sub_2287BD6A0(a1, 0xD000000000000016, 0x80000002287D1B60, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BDF3E88], &qword_2559C0818);
}

void sub_2287BD644()
{
  strcpy((char *)&qword_2559BDA18, "appleMusicLogo");
  unk_2559BDA27 = -18;
}

uint64_t sub_2287BD674(uint64_t a1)
{
  return sub_2287BD6A0(a1, 0xD000000000000014, 0x80000002287D1B40, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BDF4130], &qword_2559C0820);
}

uint64_t sub_2287BD6A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t), uint64_t *a5)
{
  uint64_t v9;
  id v10;
  uint64_t result;

  if (qword_2559BD288 != -1)
    swift_once();
  v9 = qword_2559C07F0;
  v10 = (id)qword_2559C07F0;
  result = a4(a2, a3, v9);
  *a5 = result;
  return result;
}

uint64_t sub_2287BD720()
{
  uint64_t v0;
  id v1;
  uint64_t result;

  if (qword_2559BD2C0 != -1)
    swift_once();
  v0 = qword_2559BD288;
  swift_bridgeObjectRetain();
  if (v0 != -1)
    swift_once();
  v1 = (id)qword_2559C07F0;
  result = sub_2287CD874();
  qword_2559C0828 = result;
  return result;
}

ValueMetadata *type metadata accessor for AmbientListening()
{
  return &type metadata for AmbientListening;
}

uint64_t sub_2287BD7D8()
{
  return MEMORY[0x24BDF5560];
}

id sub_2287BD7E4()
{
  type metadata accessor for AmbientListeningUIView();
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

uint64_t sub_2287BD81C()
{
  return sub_2287CD5E0();
}

uint64_t sub_2287BD85C()
{
  sub_2287BD968();
  return sub_2287CD640();
}

uint64_t sub_2287BD8AC()
{
  sub_2287BD968();
  return sub_2287CD5EC();
}

void sub_2287BD8FC()
{
  sub_2287BD968();
  sub_2287CD634();
  __break(1u);
}

unint64_t sub_2287BD924()
{
  unint64_t result;

  result = qword_2559BDAC0;
  if (!qword_2559BDAC0)
  {
    result = MEMORY[0x22E2B5980](&unk_2287D0404, &type metadata for AmbientListening);
    atomic_store(result, (unint64_t *)&qword_2559BDAC0);
  }
  return result;
}

unint64_t sub_2287BD968()
{
  unint64_t result;

  result = qword_2559BDAC8;
  if (!qword_2559BDAC8)
  {
    result = MEMORY[0x22E2B5980](&unk_2287D0454, &type metadata for AmbientListening);
    atomic_store(result, (unint64_t *)&qword_2559BDAC8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for MatchSnippet(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v3 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = v3;
  return a1;
}

void destroy for MatchSnippet(uint64_t a1)
{

}

uint64_t assignWithCopy for MatchSnippet(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v3 = *(void **)(a2 + 16);
  v4 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v3;
  v5 = v3;

  return a1;
}

uint64_t assignWithTake for MatchSnippet(uint64_t a1, uint64_t a2)
{
  void *v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v3 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  return a1;
}

uint64_t getEnumTagSinglePayload for MatchSnippet(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MatchSnippet(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MatchSnippet()
{
  return &type metadata for MatchSnippet;
}

uint64_t sub_2287BDB0C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2287BDB1C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  int v16;
  void *v17;
  uint64_t v18;
  unsigned __int8 v19;
  char v20;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  unsigned __int8 v51;
  uint64_t v52;
  unsigned __int8 v53;
  uint64_t v54;
  unsigned __int8 v55;
  uint64_t v56;
  unsigned __int8 v57;
  uint64_t v58;
  unsigned __int8 v59;
  uint64_t v60;
  uint64_t v61;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDAD0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDAD8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v34 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v34 - v13;
  v15 = *(char **)v1;
  v16 = *(unsigned __int8 *)(v1 + 8);
  v17 = *(void **)(v1 + 16);
  *(_QWORD *)a1 = sub_2287CD5A4();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  sub_2287CD904();
  sub_2287B2850(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, &v49, 0.0, 1, 0.0, 1);
  v48 = v49;
  v47 = BYTE8(v49);
  v46 = v50;
  v45 = v51;
  v44 = v52;
  v43 = v53;
  v42 = v54;
  v41 = v55;
  v40 = v56;
  v39 = v57;
  v38 = v58;
  v37 = v59;
  v36 = v60;
  v35 = v61;
  *(_QWORD *)v5 = sub_2287CD538();
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDAE0);
  sub_2287BDF14(v15, v16, v17, (uint64_t)&v5[*(int *)(v18 + 44)]);
  LOBYTE(v17) = sub_2287CD6A0();
  v19 = sub_2287CD6B8();
  v20 = sub_2287CD6AC();
  sub_2287CD6AC();
  if (sub_2287CD6AC() != v17)
    v20 = sub_2287CD6AC();
  sub_2287CD6AC();
  if (sub_2287CD6AC() != v19)
    v20 = sub_2287CD6AC();
  v21 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2559BDAE8) + 44);
  sub_2287CD3A0();
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  sub_2287B7790((uint64_t)v5, (uint64_t)v12, &qword_2559BDAD0);
  v30 = &v12[*(int *)(v6 + 36)];
  *v30 = v20;
  *((_QWORD *)v30 + 1) = v23;
  *((_QWORD *)v30 + 2) = v25;
  *((_QWORD *)v30 + 3) = v27;
  *((_QWORD *)v30 + 4) = v29;
  v30[40] = 0;
  sub_2287B741C((uint64_t)v5, &qword_2559BDAD0);
  sub_2287BB658((uint64_t)v12, (uint64_t)v14, &qword_2559BDAD8);
  sub_2287B7790((uint64_t)v14, (uint64_t)v9, &qword_2559BDAD8);
  *(_QWORD *)v21 = v48;
  *(_BYTE *)(v21 + 8) = v47;
  *(_QWORD *)(v21 + 16) = v46;
  *(_BYTE *)(v21 + 24) = v45;
  *(_QWORD *)(v21 + 32) = v44;
  *(_BYTE *)(v21 + 40) = v43;
  *(_QWORD *)(v21 + 48) = v42;
  *(_BYTE *)(v21 + 56) = v41;
  *(_QWORD *)(v21 + 64) = v40;
  *(_BYTE *)(v21 + 72) = v39;
  *(_QWORD *)(v21 + 80) = v38;
  *(_BYTE *)(v21 + 88) = v37;
  v31 = v35;
  *(_QWORD *)(v21 + 96) = v36;
  *(_QWORD *)(v21 + 104) = v31;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDAF0);
  sub_2287B7790((uint64_t)v9, v21 + *(int *)(v32 + 48), &qword_2559BDAD8);
  sub_2287B741C((uint64_t)v14, &qword_2559BDAD8);
  return sub_2287B741C((uint64_t)v9, &qword_2559BDAD8);
}

uint64_t sub_2287BDF14@<X0>(char *a1@<X0>, int a2@<W1>, void *a3@<X2>, uint64_t a4@<X8>)
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  id v40;
  void *v41;
  void (*v42)(char *, uint64_t, uint64_t, uint64_t);
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  __int128 v54;
  char *v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  id v67;
  id v68;
  void *v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  id v75;
  uint64_t v76;
  void *v77;
  unint64_t v78;
  unint64_t v79;
  id v80;
  void *v81;
  char *v82;
  void (*v83)(char *, char *, uint64_t);
  uint64_t v84;
  int v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  char *v90;
  char *v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  void (*v100)(char *, char *, uint64_t);
  uint64_t v101;
  void (*v102)(char *, uint64_t);
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
  char *v113;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  int v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void (*v134)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v135;
  char *v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  char *v140;
  uint64_t v141;
  uint64_t v142;
  char *v143;
  uint64_t v144;
  char *v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;

  v128 = a2;
  v145 = a1;
  v141 = a4;
  v117 = sub_2287CD3B8();
  v116 = *(_QWORD *)(v117 - 8);
  MEMORY[0x24BDAC7A8](v117);
  v115 = (char *)&v115 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDAF8);
  v123 = *(_QWORD *)(v124 - 8);
  MEMORY[0x24BDAC7A8](v124);
  v121 = (char *)&v115 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDB00);
  v119 = *(_QWORD *)(v120 - 8);
  MEMORY[0x24BDAC7A8](v120);
  v118 = (char *)&v115 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDB08);
  v125 = *(_QWORD *)(v127 - 8);
  v8 = MEMORY[0x24BDAC7A8](v127);
  v126 = (char *)&v115 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v122 = (char *)&v115 - v10;
  v11 = sub_2287CD298();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v129 = (char *)&v115 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v143 = (char *)&v115 - v15;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDB10);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v140 = (char *)&v115 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v130 = (uint64_t)&v115 - v19;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD650);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v136 = (char *)&v115 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v115 - v23;
  v25 = type metadata accessor for AlbumArt();
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)&v115 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDB18);
  MEMORY[0x24BDAC7A8](v131);
  v29 = (char *)&v115 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDB20);
  MEMORY[0x24BDAC7A8](v132);
  v31 = (char *)&v115 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDB28);
  MEMORY[0x24BDAC7A8](v133);
  v33 = (char *)&v115 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDB30);
  v34 = MEMORY[0x24BDAC7A8](v135);
  v138 = (uint64_t)&v115 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = MEMORY[0x24BDAC7A8](v34);
  v38 = (char *)&v115 - v37;
  MEMORY[0x24BDAC7A8](v36);
  v142 = (uint64_t)&v115 - v39;
  v137 = a3;
  v40 = objc_msgSend(a3, sel_artworkURL);
  v139 = v11;
  if (v40)
  {
    v41 = v40;
    sub_2287CD28C();

    v42 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
    v43 = v24;
    v44 = 0;
  }
  else
  {
    v42 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
    v43 = v24;
    v44 = 1;
  }
  v134 = v42;
  v42(v43, v44, 1, v11);
  v144 = v12;
  sub_2287BB658((uint64_t)v24, (uint64_t)v27, &qword_2559BD650);
  *(_QWORD *)&v27[*(int *)(v25 + 20)] = 0x4022000000000000;
  if (qword_2559BD308 != -1)
    swift_once();
  v46 = qword_2559C0850;
  v45 = *(_QWORD *)algn_2559C0858;
  swift_bridgeObjectRetain();
  v47 = sub_2287CD670();
  sub_2287CD928();
  v49 = v48;
  v51 = v50;
  sub_2287BB5D8((uint64_t)v27, (uint64_t)v29);
  v52 = &v29[*(int *)(v131 + 36)];
  *(_QWORD *)v52 = v46;
  *((_QWORD *)v52 + 1) = v45;
  *((_QWORD *)v52 + 2) = v145;
  *((_DWORD *)v52 + 6) = v47;
  *((_QWORD *)v52 + 4) = v49;
  *((_QWORD *)v52 + 5) = v51;
  v52[48] = 1;
  sub_2287BB61C((uint64_t)v27);
  sub_2287CD8F8();
  sub_2287CD424();
  sub_2287B7790((uint64_t)v29, (uint64_t)v31, &qword_2559BDB18);
  v53 = &v31[*(int *)(v132 + 36)];
  v54 = v147;
  *(_OWORD *)v53 = v146;
  *((_OWORD *)v53 + 1) = v54;
  *((_OWORD *)v53 + 2) = v148;
  sub_2287B741C((uint64_t)v29, &qword_2559BDB18);
  sub_2287B7790((uint64_t)v31, (uint64_t)v33, &qword_2559BDB20);
  v55 = &v33[*(int *)(v133 + 36)];
  *(_QWORD *)v55 = 0;
  *((_WORD *)v55 + 4) = 1;
  sub_2287B741C((uint64_t)v31, &qword_2559BDB20);
  v56 = sub_2287CD6B8();
  sub_2287CD3A0();
  v58 = v57;
  v60 = v59;
  v62 = v61;
  v64 = v63;
  sub_2287B7790((uint64_t)v33, (uint64_t)v38, &qword_2559BDB28);
  v65 = &v38[*(int *)(v135 + 36)];
  *v65 = v56;
  *((_QWORD *)v65 + 1) = v58;
  *((_QWORD *)v65 + 2) = v60;
  *((_QWORD *)v65 + 3) = v62;
  *((_QWORD *)v65 + 4) = v64;
  v65[40] = 0;
  sub_2287B741C((uint64_t)v33, &qword_2559BDB28);
  v66 = v142;
  sub_2287BB658((uint64_t)v38, v142, &qword_2559BDB30);
  v132 = sub_2287CD5A4();
  v67 = v137;
  v68 = objc_msgSend(v137, sel_title);
  if (v68)
  {
    v69 = v68;
    v135 = sub_2287CD9D0();
    v71 = v70;

  }
  else
  {
    v135 = 0;
    v71 = 0xE000000000000000;
  }
  v72 = v139;
  v73 = (uint64_t)v140;
  v74 = v143;
  v75 = objc_msgSend(v67, sel_subtitle);
  v76 = v144;
  if (v75)
  {
    v77 = v75;
    v140 = (char *)sub_2287CD9D0();
    v79 = v78;

  }
  else
  {
    v140 = 0;
    v79 = 0xE000000000000000;
  }
  v133 = v71;
  v80 = objc_msgSend(v67, sel_appleMusicURL);
  if (!v80)
  {
    v84 = (uint64_t)v136;
    v134(v136, 1, 1, v72);
    goto LABEL_17;
  }
  v81 = v80;
  v82 = v129;
  sub_2287CD28C();

  v83 = *(void (**)(char *, char *, uint64_t))(v76 + 32);
  v84 = (uint64_t)v136;
  v83(v136, v82, v72);
  v134((char *)v84, 0, 1, v72);
  v85 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v76 + 48))(v84, 1, v72);
  v86 = v145;
  if (v85 == 1)
  {
LABEL_17:
    sub_2287B741C(v84, &qword_2559BD650);
LABEL_18:
    v105 = v133;
    v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDB38);
    v104 = v130;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v106 - 8) + 56))(v130, 1, 1, v106);
    goto LABEL_19;
  }
  v83(v74, (char *)v84, v72);
  if ((v128 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v76 + 8))(v74, v72);
    goto LABEL_18;
  }
  v87 = (*(uint64_t (**)(char *, char *, uint64_t))(v76 + 16))(v129, v74, v72);
  MEMORY[0x24BDAC7A8](v87);
  *(&v115 - 4) = v86;
  *((_BYTE *)&v115 - 24) = 1;
  *(&v115 - 2) = (char *)v67;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDB48);
  v88 = v72;
  sub_2287BEC78();
  v89 = v118;
  sub_2287CD6F4();
  v90 = v115;
  sub_2287CD3AC();
  v91 = v121;
  v92 = v117;
  sub_2287CD8C8();
  (*(void (**)(char *, uint64_t))(v116 + 8))(v90, v92);
  sub_2287CD3C4();
  sub_2287B7F94(&qword_2559BDBA8, &qword_2559BDB00, MEMORY[0x24BDF19E0]);
  sub_2287B7F94(&qword_2559BDBB0, &qword_2559BDAF8, MEMORY[0x24BDEC410]);
  v93 = v126;
  v94 = v120;
  v95 = v124;
  sub_2287CD7C0();
  (*(void (**)(char *, uint64_t))(v123 + 8))(v91, v95);
  v96 = v94;
  v66 = v142;
  (*(void (**)(char *, uint64_t))(v119 + 8))(v89, v96);
  v97 = v125;
  v98 = v122;
  v99 = v127;
  (*(void (**)(char *, char *, uint64_t))(v125 + 32))(v122, v93, v127);
  v100 = *(void (**)(char *, char *, uint64_t))(v97 + 16);
  v100(v93, v98, v99);
  *(_QWORD *)v73 = 0;
  *(_BYTE *)(v73 + 8) = 1;
  v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDBB8);
  v100((char *)(v73 + *(int *)(v101 + 48)), v93, v99);
  v102 = *(void (**)(char *, uint64_t))(v97 + 8);
  v102(v98, v99);
  (*(void (**)(char *, uint64_t))(v144 + 8))(v143, v88);
  v102(v93, v99);
  v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDB38);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v103 - 8) + 56))(v73, 0, 1, v103);
  v104 = v130;
  sub_2287BB658(v73, v130, &qword_2559BDB10);
  v105 = v133;
LABEL_19:
  v107 = v132;
  v108 = v138;
  sub_2287B7790(v66, v138, &qword_2559BDB30);
  sub_2287B7790(v104, v73, &qword_2559BDB10);
  v109 = v141;
  sub_2287B7790(v108, v141, &qword_2559BDB30);
  v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDB40);
  v111 = v109 + *(int *)(v110 + 48);
  *(_QWORD *)v111 = v107;
  *(_QWORD *)(v111 + 8) = 0x3FF0000000000000;
  *(_BYTE *)(v111 + 16) = 0;
  v112 = v135;
  *(_QWORD *)(v111 + 24) = v145;
  *(_QWORD *)(v111 + 32) = v112;
  v113 = v140;
  *(_QWORD *)(v111 + 40) = v105;
  *(_QWORD *)(v111 + 48) = v113;
  *(_QWORD *)(v111 + 56) = v79;
  sub_2287B7790(v73, v109 + *(int *)(v110 + 64), &qword_2559BDB10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2287B741C(v104, &qword_2559BDB10);
  sub_2287B741C(v66, &qword_2559BDB30);
  sub_2287B741C(v73, &qword_2559BDB10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_2287B741C(v108, &qword_2559BDB30);
}

uint64_t sub_2287BEACC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDBC0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2559BD2D0 != -1)
    swift_once();
  v7 = *MEMORY[0x24BDF4068];
  v8 = sub_2287CD85C();
  v9 = *(_QWORD *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 104))(v6, v7, v8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  v10 = sub_2287CD844();
  sub_2287B741C((uint64_t)v6, &qword_2559BDBC0);
  v11 = sub_2287CD67C();
  sub_2287CD928();
  v13 = v12;
  v15 = v14;
  LODWORD(v7) = sub_2287CD664();
  v16 = sub_2287CD814();
  result = swift_getKeyPath();
  *(_QWORD *)a2 = v10;
  *(_QWORD *)(a2 + 8) = 0xD000000000000014;
  *(_QWORD *)(a2 + 16) = 0x80000002287D1BE0;
  *(_QWORD *)(a2 + 24) = a1;
  *(_DWORD *)(a2 + 32) = v11;
  *(_QWORD *)(a2 + 40) = v13;
  *(_QWORD *)(a2 + 48) = v15;
  *(_BYTE *)(a2 + 56) = 1;
  *(_DWORD *)(a2 + 60) = v7;
  *(_QWORD *)(a2 + 64) = result;
  *(_QWORD *)(a2 + 72) = v16;
  return result;
}

void sub_2287BEC48()
{
  sub_2287BCC5C(*MEMORY[0x24BE90570], *MEMORY[0x24BE90590]);
}

uint64_t sub_2287BEC68@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2287BEACC(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_2287BEC78()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559BDB50;
  if (!qword_2559BDB50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BDB48);
    v2[0] = sub_2287BECFC();
    v2[1] = sub_2287B7F94(&qword_2559BDB98, &qword_2559BDBA0, MEMORY[0x24BDF1028]);
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559BDB50);
  }
  return result;
}

unint64_t sub_2287BECFC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559BDB58;
  if (!qword_2559BDB58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BDB60);
    v2[0] = sub_2287BED80();
    v2[1] = sub_2287B7F94(&qword_2559BDB88, &qword_2559BDB90, MEMORY[0x24BDF0710]);
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559BDB58);
  }
  return result;
}

unint64_t sub_2287BED80()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2559BDB68;
  if (!qword_2559BDB68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BDB70);
    v2 = sub_2287B7F94(&qword_2559BDB78, &qword_2559BDB80, MEMORY[0x24BDEFFA0]);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2559BDB68);
  }
  return result;
}

uint64_t sub_2287BEE04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2287CD4C0();
  *a1 = result;
  return result;
}

uint64_t sub_2287BEE2C()
{
  swift_retain();
  return sub_2287CD4CC();
}

uint64_t sub_2287BEE54@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2287CD4C0();
  *a1 = result;
  return result;
}

uint64_t sub_2287BEE7C()
{
  swift_retain();
  return sub_2287CD4CC();
}

uint64_t sub_2287BEEA4()
{
  return sub_2287B7F94(&qword_2559BDBC8, &qword_2559BDBD0, MEMORY[0x24BDF4700]);
}

uint64_t AmbientMatchingFlowView.viewModel.getter()
{
  return swift_retain();
}

uint64_t AmbientMatchingFlowView.viewModel.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_release();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t (*AmbientMatchingFlowView.viewModel.modify())()
{
  return nullsub_1;
}

uint64_t AmbientMatchingFlowView.$viewModel.getter()
{
  type metadata accessor for MatchingFlowViewModel();
  sub_2287BEF58();
  return sub_2287CD478();
}

unint64_t sub_2287BEF58()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2559BDBD8;
  if (!qword_2559BDBD8)
  {
    v1 = type metadata accessor for MatchingFlowViewModel();
    result = MEMORY[0x22E2B5980](&protocol conformance descriptor for MatchingFlowViewModel, v1);
    atomic_store(result, (unint64_t *)&qword_2559BDBD8);
  }
  return result;
}

uint64_t AmbientMatchingFlowView.init(viewModel:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  type metadata accessor for MatchingFlowViewModel();
  sub_2287BEF58();
  result = sub_2287CD46C();
  *a1 = result;
  a1[1] = v3;
  a1[2] = 0;
  return result;
}

uint64_t AmbientMatchingFlowView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  _QWORD *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[3];
  uint64_t v16;
  char v17;
  char v18;

  v3 = *v1;
  v4 = v1[1];
  v5 = v1[2];
  v6 = sub_2287CD598();
  sub_2287BF0CC((uint64_t)v15);
  v13 = v15[1];
  v14 = v15[0];
  v12 = v15[2];
  v7 = v16;
  v8 = v17;
  v9 = v18;
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = v3;
  v10[3] = v4;
  v10[4] = v5;
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_OWORD *)(a1 + 24) = v14;
  *(_OWORD *)(a1 + 40) = v13;
  *(_OWORD *)(a1 + 56) = v12;
  *(_QWORD *)(a1 + 72) = v7;
  *(_BYTE *)(a1 + 80) = v8;
  *(_BYTE *)(a1 + 81) = v9;
  *(_QWORD *)(a1 + 88) = sub_2287BF6A4;
  *(_QWORD *)(a1 + 96) = v10;
  return swift_retain();
}

double sub_2287BF0CC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  double result;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[9];
  char v17;
  void *v18;
  void *v19;
  char v20;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2287CD370();
  swift_release();
  swift_release();
  swift_release();
  if (v20)
  {
    if (v20 == 1)
    {
      sub_2287B9080(v18, v19, 1);
    }
    else
    {
      *(_OWORD *)&v16[-7] = 0u;
      v14 = 0u;
      v15 = 0u;
      v13 = 0u;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDC28);
      sub_2287BD924();
      sub_2287BFB18(&qword_2559BDC20, &qword_2559BDC28, (uint64_t (*)(void))sub_2287BFAD4);
      sub_2287CD658();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDC08);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDC10);
    sub_2287BFA50();
    sub_2287BFB18(&qword_2559BDC38, &qword_2559BDC10, (uint64_t (*)(void))sub_2287BFB84);
    sub_2287CD658();
  }
  else
  {
    type metadata accessor for AmbientMatchActionHandler();
    v2 = swift_allocObject();
    *(_BYTE *)(v2 + 16) = v18 & 1;
    *(_QWORD *)(v2 + 24) = v19;
    *(_QWORD *)&v13 = v18 & 1;
    *((_QWORD *)&v13 + 1) = v19;
    *(_QWORD *)&v14 = v2;
    *((_QWORD *)&v14 + 1) = sub_2287BF4B8;
    *(_QWORD *)v16 = 0;
    v15 = 0uLL;
    v16[8] = 1;
    sub_2287B9054(v18, v19, 0);
    sub_2287B9054(v18, v19, 0);
    v4 = v19;
    swift_retain();
    sub_2287B4F88((uint64_t)sub_2287BF4B8);
    sub_2287B4F88(0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDC28);
    sub_2287BD924();
    sub_2287BFB18(&qword_2559BDC20, &qword_2559BDC28, (uint64_t (*)(void))sub_2287BFAD4);
    sub_2287CD658();
    sub_2287BFBC8(v5, v6, v7, v8, v9, v10, v11, v12);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDC08);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDC10);
    sub_2287BFA50();
    sub_2287BFB18(&qword_2559BDC38, &qword_2559BDC10, (uint64_t (*)(void))sub_2287BFB84);
    sub_2287CD658();
    sub_2287B9080(v18, v19, 0);
    sub_2287BFC2C(v5, v6, v7, v8, v9, v10, v11, v12);
    swift_release();

    sub_2287B4808((uint64_t)sub_2287BF4B8);
    sub_2287B4808(0);
  }
  result = *(double *)&v13;
  *(_OWORD *)a1 = v13;
  *(_OWORD *)(a1 + 16) = v14;
  *(_OWORD *)(a1 + 32) = v15;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)v16;
  *(_BYTE *)(a1 + 56) = v16[8];
  *(_BYTE *)(a1 + 57) = v17;
  return result;
}

uint64_t sub_2287BF4B8()
{
  uint64_t v0;
  uint64_t inited;
  void *v2;
  id v3;

  v0 = *MEMORY[0x24BE90588];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD9A0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2287D0390;
  v2 = (void *)*MEMORY[0x24BE905A8];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BE905A8];
  sub_2287BFC90();
  v3 = v2;
  *(_QWORD *)(inited + 40) = sub_2287CDA90();
  sub_2287BBAF0(inited);
  sub_2287BCA88(v0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2287BF55C()
{
  uint64_t v0;
  uint64_t inited;
  void *v2;
  id v3;

  v0 = *MEMORY[0x24BE90588];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD9A0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2287D0390;
  v2 = (void *)*MEMORY[0x24BE905A8];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BE905A8];
  sub_2287BFC90();
  v3 = v2;
  *(_QWORD *)(inited + 40) = sub_2287CDA90();
  sub_2287BBAF0(inited);
  sub_2287BCA88(v0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2287BF600(double a1, double a2, uint64_t a3, uint64_t a4)
{
  void (**v6)(uint64_t, double, double);
  uint64_t result;
  void (*v8)(uint64_t, double, double);
  uint64_t v9;

  v6 = (void (**)(uint64_t, double, double))(a4
                                                     + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_sizeUpdatedHandler);
  result = swift_beginAccess();
  v8 = *v6;
  if (*v6)
  {
    v9 = swift_retain();
    v8(v9, a1, a2);
    return sub_2287B4808((uint64_t)v8);
  }
  return result;
}

uint64_t sub_2287BF680()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2287BF6A4(double a1, double a2)
{
  uint64_t v2;

  return sub_2287BF600(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_2287BF6B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2287BF6C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  _QWORD *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[3];
  uint64_t v16;
  char v17;
  char v18;

  v3 = *v1;
  v4 = v1[1];
  v5 = v1[2];
  v6 = sub_2287CD598();
  sub_2287BF0CC((uint64_t)v15);
  v13 = v15[1];
  v14 = v15[0];
  v12 = v15[2];
  v7 = v16;
  v8 = v17;
  v9 = v18;
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = v3;
  v10[3] = v4;
  v10[4] = v5;
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_OWORD *)(a1 + 24) = v14;
  *(_OWORD *)(a1 + 40) = v13;
  *(_OWORD *)(a1 + 56) = v12;
  *(_QWORD *)(a1 + 72) = v7;
  *(_BYTE *)(a1 + 80) = v8;
  *(_BYTE *)(a1 + 81) = v9;
  *(_QWORD *)(a1 + 88) = sub_2287BFCD0;
  *(_QWORD *)(a1 + 96) = v10;
  return swift_retain();
}

uint64_t sub_2287BF79C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(a1 + 8);
  return swift_retain();
}

uint64_t sub_2287BF7A8(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_retain();
  result = swift_release();
  *(_QWORD *)(a2 + 8) = v3;
  return result;
}

_QWORD *sub_2287BF7EC(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for AmbientMatchingFlowView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  return a1;
}

_QWORD *assignWithTake for AmbientMatchingFlowView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_release();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for AmbientMatchingFlowView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AmbientMatchingFlowView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AmbientMatchingFlowView()
{
  return &type metadata for AmbientMatchingFlowView;
}

unint64_t sub_2287BF94C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559BDBE0;
  if (!qword_2559BDBE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BDBE8);
    v2[0] = sub_2287BF9B8();
    v2[1] = sub_2287BFA04();
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559BDBE0);
  }
  return result;
}

unint64_t sub_2287BF9B8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2559BDBF0;
  if (!qword_2559BDBF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BDBF8);
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDF4700], v1);
    atomic_store(result, (unint64_t *)&qword_2559BDBF0);
  }
  return result;
}

unint64_t sub_2287BFA04()
{
  unint64_t result;

  result = qword_2559BDC00;
  if (!qword_2559BDC00)
  {
    result = MEMORY[0x22E2B5980](&unk_2287CFED4, &type metadata for SizeChangeModifier);
    atomic_store(result, (unint64_t *)&qword_2559BDC00);
  }
  return result;
}

unint64_t sub_2287BFA50()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559BDC18;
  if (!qword_2559BDC18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BDC08);
    v2[0] = sub_2287BD924();
    v2[1] = sub_2287BFB18(&qword_2559BDC20, &qword_2559BDC28, (uint64_t (*)(void))sub_2287BFAD4);
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559BDC18);
  }
  return result;
}

unint64_t sub_2287BFAD4()
{
  unint64_t result;

  result = qword_2559BDC30;
  if (!qword_2559BDC30)
  {
    result = MEMORY[0x22E2B5980](&unk_2287D07E8, &type metadata for AmbientMatch);
    atomic_store(result, (unint64_t *)&qword_2559BDC30);
  }
  return result;
}

uint64_t sub_2287BFB18(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3();
    v7[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDED308], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2287BFB84()
{
  unint64_t result;

  result = qword_2559BDC40;
  if (!qword_2559BDC40)
  {
    result = MEMORY[0x22E2B5980](&unk_2287D10C4, &type metadata for AmbientNoMatch);
    atomic_store(result, (unint64_t *)&qword_2559BDC40);
  }
  return result;
}

uint64_t sub_2287BFBC8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  id v10;
  uint64_t result;

  if ((a8 & 1) != 0)
  {
    v10 = a2;
    swift_retain();
    sub_2287B4F88(a4);
    return sub_2287B4F88(a6);
  }
  return result;
}

uint64_t sub_2287BFC2C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t result;

  if ((a8 & 1) != 0)
  {

    swift_release();
    sub_2287B4808(a4);
    return sub_2287B4808(a6);
  }
  return result;
}

unint64_t sub_2287BFC90()
{
  unint64_t result;

  result = qword_2559BDC48;
  if (!qword_2559BDC48)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2559BDC48);
  }
  return result;
}

void MediaLibrary.init()(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = sub_2287BFCE8;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 0;
}

uint64_t sub_2287BFCE8()
{
  uint64_t v0;

  type metadata accessor for MediaLibraryController();
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_QWORD *)(v0 + 48) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDCA8);
  sub_2287CD340();
  return v0;
}

uint64_t MediaLibrary.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
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
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
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
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v35 = a1;
  v2 = sub_2287CDA60();
  v32 = *(_QWORD *)(v2 - 8);
  v33 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v30 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDC50);
  v28 = *(_QWORD *)(v4 - 8);
  v29 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDC58);
  v7 = MEMORY[0x24BDAC7A8](v34);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v31 = (uint64_t)&v27 - v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDC60);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (uint64_t *)((char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = *v1;
  v15 = v1[1];
  v16 = *((_BYTE *)v1 + 16);
  sub_2287C00C8();
  type metadata accessor for MediaLibraryController();
  sub_2287B108C(&qword_2559BDC68, (uint64_t (*)(uint64_t))type metadata accessor for MediaLibraryController, (uint64_t)&unk_2287D0990);
  sub_2287CD3D0();
  sub_2287C00D0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2287CD370();
  swift_release();
  swift_release();
  swift_release();
  if (v36)
  {
    *v13 = v36;
    swift_storeEnumTagMultiPayload();
    sub_2287C05FC();
    sub_2287C0640();
    return sub_2287CD658();
  }
  else
  {
    sub_2287CD3E8();
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = v14;
    *(_QWORD *)(v18 + 24) = v15;
    *(_BYTE *)(v18 + 32) = v16;
    sub_2287C00C8();
    v19 = v30;
    sub_2287CDA48();
    v20 = &v9[*(int *)(v34 + 36)];
    v21 = sub_2287CD460();
    v23 = v32;
    v22 = v33;
    (*(void (**)(char *, char *, uint64_t))(v32 + 16))(&v20[*(int *)(v21 + 20)], v19, v33);
    *(_QWORD *)v20 = &unk_2559BDC78;
    *((_QWORD *)v20 + 1) = v18;
    v25 = v28;
    v24 = v29;
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v9, v6, v29);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v19, v22);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v6, v24);
    v26 = v31;
    sub_2287C056C((uint64_t)v9, v31);
    sub_2287C05B4(v26, (uint64_t)v13);
    swift_storeEnumTagMultiPayload();
    sub_2287C05FC();
    sub_2287C0640();
    sub_2287CD658();
    return sub_2287C0710(v26);
  }
}

uint64_t sub_2287C00C8()
{
  return swift_retain();
}

uint64_t sub_2287C00D0()
{
  return swift_release();
}

uint64_t sub_2287C00D8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v3 + 160) = a3;
  *(_QWORD *)(v3 + 64) = a1;
  *(_QWORD *)(v3 + 72) = a2;
  *(_QWORD *)(v3 + 80) = sub_2287CDA3C();
  *(_QWORD *)(v3 + 88) = sub_2287CDA30();
  *(_QWORD *)(v3 + 96) = sub_2287CDA18();
  *(_QWORD *)(v3 + 104) = v4;
  return swift_task_switch();
}

uint64_t sub_2287C014C()
{
  _QWORD *v0;
  uint64_t v1;

  sub_2287C00C8();
  type metadata accessor for MediaLibraryController();
  sub_2287B108C(&qword_2559BDC68, (uint64_t (*)(uint64_t))type metadata accessor for MediaLibraryController, (uint64_t)&unk_2287D0990);
  v0[14] = sub_2287CD3D0();
  sub_2287C00D0();
  v0[15] = sub_2287CDA30();
  v0[16] = sub_2287CDA18();
  v0[17] = v1;
  return swift_task_switch();
}

uint64_t sub_2287C022C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t, uint64_t);

  sub_2287C3D70((uint64_t)(v0 + 2));
  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  v5 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v2 + 8) + *(_QWORD *)(v2 + 8));
  v3 = (_QWORD *)swift_task_alloc();
  v0[18] = v3;
  *v3 = v0;
  v3[1] = sub_2287C02B8;
  return v5(v1, v2);
}

uint64_t sub_2287C02B8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 152) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2287C0310()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 152);
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  *(_QWORD *)(v0 + 56) = v1;
  swift_retain();
  sub_2287CD37C();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2287C03B4()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2287C03E8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2287CD370();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2287C0468()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_2287CD37C();
}

uint64_t sub_2287C04E4()
{
  sub_2287C00D0();
  return swift_deallocObject();
}

uint64_t sub_2287C050C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  _QWORD *v5;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = *(_BYTE *)(v0 + 32);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_2287B49D8;
  return sub_2287C00D8(v2, v3, v4);
}

uint64_t sub_2287C056C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDC58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2287C05B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDC58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_2287C05FC()
{
  unint64_t result;

  result = qword_2559BDC80;
  if (!qword_2559BDC80)
  {
    result = MEMORY[0x22E2B5980](&unk_2287D1014, &type metadata for MediaLibraryList);
    atomic_store(result, (unint64_t *)&qword_2559BDC80);
  }
  return result;
}

unint64_t sub_2287C0640()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559BDC88;
  if (!qword_2559BDC88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BDC58);
    v2[0] = sub_2287C06C4();
    v2[1] = sub_2287B108C(&qword_2559BD5D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDEC4E0], MEMORY[0x24BDEC4C8]);
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559BDC88);
  }
  return result;
}

unint64_t sub_2287C06C4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2559BDC90;
  if (!qword_2559BDC90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BDC50);
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDEBC00], v1);
    atomic_store(result, (unint64_t *)&qword_2559BDC90);
  }
  return result;
}

uint64_t sub_2287C0710(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDC58);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2287C0750()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for MediaLibrary()
{
  return sub_2287C00D0();
}

uint64_t _s11ShazamKitUI12MediaLibraryVwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_2287C00C8();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for MediaLibrary(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_2287C00C8();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_2287C00D0();
  return a1;
}

uint64_t assignWithTake for MediaLibrary(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_2287C00D0();
  return a1;
}

uint64_t getEnumTagSinglePayload for MediaLibrary(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MediaLibrary(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for MediaLibrary()
{
  return &type metadata for MediaLibrary;
}

unint64_t sub_2287C08F4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559BDC98;
  if (!qword_2559BDC98)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BDCA0);
    v2[0] = sub_2287C05FC();
    v2[1] = sub_2287C0640();
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559BDC98);
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

void sub_2287C0984()
{
  qword_2559BDCB0 = 0x636973756DLL;
  *(_QWORD *)algn_2559BDCB8 = 0xE500000000000000;
}

uint64_t LocationView.init(viewModel:strokeColor:)@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  type metadata accessor for LocationViewModel();
  result = sub_2287CD880();
  *a2 = v5;
  a2[1] = v6;
  a2[2] = a1;
  return result;
}

uint64_t LocationView.body.getter@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)@<X0>(uint64_t@<X0>, uint64_t@<X8>);

  v3 = *v1;
  v4 = v1[1];
  v5 = v1[2];
  v6 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))swift_allocObject();
  *((_QWORD *)v6 + 2) = v3;
  *((_QWORD *)v6 + 3) = v4;
  *((_QWORD *)v6 + 4) = v5;
  *a1 = sub_2287C0C80;
  a1[1] = v6;
  swift_retain();
  swift_retain();
  return swift_retain();
}

uint64_t sub_2287C0A5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v31 = a5;
  v32 = sub_2287CDA60();
  v30 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2287CD43C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDCD0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (uint64_t *)((char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v17 = sub_2287CD8F8();
  v17[1] = v18;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDCD8);
  sub_2287C0C9C(a2, a3, a4, (uint64_t)v17 + *(int *)(v19 + 44));
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  v20 = (*(unsigned __int8 *)(v12 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v21 = (char *)swift_allocObject();
  *((_QWORD *)v21 + 2) = a2;
  *((_QWORD *)v21 + 3) = a3;
  *((_QWORD *)v21 + 4) = a4;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v21[v20], v14, v11);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2287CDA48();
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDCF0);
  v23 = v31;
  v24 = (char *)(v31 + *(int *)(v22 + 36));
  v25 = sub_2287CD460();
  v26 = v30;
  v27 = v32;
  (*(void (**)(char *, char *, uint64_t))(v30 + 16))(&v24[*(int *)(v25 + 20)], v10, v32);
  *(_QWORD *)v24 = &unk_2559BDCE8;
  *((_QWORD *)v24 + 1) = v21;
  sub_2287B7790((uint64_t)v17, v23, &qword_2559BDCD0);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v10, v27);
  return sub_2287B741C((uint64_t)v17, &qword_2559BDCD0);
}

uint64_t sub_2287C0C80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  return sub_2287C0A5C(a1, v2[2], v2[3], v2[4], a2);
}

uint64_t sub_2287C0C8C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2287C0C9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
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
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  char v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t (*v52)(void);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
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
  uint64_t v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  int v89;
  uint64_t v90;
  __int128 v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unsigned __int8 v113;
  uint64_t v114;
  uint64_t v115;
  __int128 v116;
  __int128 v117;
  uint64_t v118;

  v106 = a4;
  v107 = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDD08);
  MEMORY[0x24BDAC7A8](v6);
  v104 = (uint64_t)&v85 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDD10);
  MEMORY[0x24BDAC7A8](v95);
  v96 = (uint64_t)&v85 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v108 = sub_2287CD4A8();
  MEMORY[0x24BDAC7A8](v108);
  v94 = (char *)&v85 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDD18);
  MEMORY[0x24BDAC7A8](v93);
  v98 = (char *)&v85 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDD20);
  MEMORY[0x24BDAC7A8](v97);
  v100 = (char *)&v85 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDD28);
  MEMORY[0x24BDAC7A8](v102);
  v101 = (uint64_t)&v85 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDD30);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v105 = (char *)&v85 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v103 = (uint64_t)&v85 - v16;
  v17 = sub_2287CD838();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v85 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDD38);
  MEMORY[0x24BDAC7A8](v92);
  v22 = (char *)&v85 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDD40);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v85 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDD48);
  v27 = MEMORY[0x24BDAC7A8](v26);
  v99 = (uint64_t)&v85 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v109 = (uint64_t)&v85 - v29;
  v110 = a1;
  *(_QWORD *)&v91 = a1;
  v30 = a2;
  v111 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDCF8);
  sub_2287CD88C();
  v31 = v116;
  swift_getKeyPath();
  v110 = v31;
  sub_2287B108C(&qword_2559BD698, (uint64_t (*)(uint64_t))type metadata accessor for LocationViewModel, (uint64_t)&protocol conformance descriptor for LocationViewModel);
  sub_2287CD2C8();
  swift_release();
  v32 = *(void **)(v31 + 40);
  v33 = v32;
  swift_release();
  if (v32)
  {
    v34 = v33;
    sub_2287CD82C();
    (*(void (**)(char *, _QWORD, uint64_t))(v18 + 104))(v20, *MEMORY[0x24BDF3FD0], v17);
    v35 = sub_2287CD868();
    swift_release();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    v110 = v35;
    sub_2287CD7CC();
    swift_release();
    sub_2287B7790((uint64_t)v22, (uint64_t)v25, &qword_2559BDD38);
    swift_storeEnumTagMultiPayload();
    sub_2287C2088();
    sub_2287CD658();

    sub_2287B741C((uint64_t)v22, &qword_2559BDD38);
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    sub_2287C2088();
    sub_2287CD658();
  }
  sub_2287C16B8(v91, v30, (uint64_t)&v116);
  v36 = v116;
  v37 = v117;
  v38 = v118;
  sub_2287CD8F8();
  sub_2287CD424();
  v90 = v110;
  v89 = v111;
  v88 = v112;
  v87 = v113;
  v86 = v114;
  v85 = v115;
  v39 = v94;
  v40 = &v94[*(int *)(v108 + 20)];
  LODWORD(v92) = *MEMORY[0x24BDEEB68];
  v41 = v92;
  v42 = sub_2287CD58C();
  v43 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 104);
  v43(v40, v41, v42);
  __asm { FMOV            V0.2D, #4.0 }
  v91 = _Q0;
  *(_OWORD *)v39 = _Q0;
  v49 = v96;
  sub_2287C210C((uint64_t)v39, v96);
  *(_WORD *)(v49 + *(int *)(v95 + 36)) = 256;
  v50 = (uint64_t)v98;
  sub_2287B7790(v49, (uint64_t)&v98[*(int *)(v93 + 36)], &qword_2559BDD10);
  *(_OWORD *)v50 = v36;
  *(_OWORD *)(v50 + 16) = v37;
  *(_BYTE *)(v50 + 32) = v38;
  *(_QWORD *)(v50 + 40) = v90;
  *(_BYTE *)(v50 + 48) = v89;
  *(_QWORD *)(v50 + 56) = v88;
  *(_BYTE *)(v50 + 64) = v87;
  v51 = v85;
  *(_QWORD *)(v50 + 72) = v86;
  *(_QWORD *)(v50 + 80) = v51;
  sub_2287C2150(v36, *((uint64_t *)&v36 + 1), v37, *((uint64_t *)&v37 + 1), v38);
  sub_2287B741C(v49, &qword_2559BDD10);
  v52 = MEMORY[0x24BDED998];
  sub_2287C2160((uint64_t)v39, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  sub_2287C219C(v36, *((uint64_t *)&v36 + 1), v37, *((uint64_t *)&v37 + 1), v38);
  v43(&v39[*(int *)(v108 + 20)], v92, v42);
  *(_OWORD *)v39 = v91;
  v53 = v107;
  swift_retain();
  sub_2287CD3DC();
  v54 = v104;
  sub_2287C210C((uint64_t)v39, v104);
  v55 = v54 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2559BDD60) + 36);
  v56 = v117;
  *(_OWORD *)v55 = v116;
  *(_OWORD *)(v55 + 16) = v56;
  *(_QWORD *)(v55 + 32) = v118;
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDD68);
  *(_QWORD *)(v54 + *(int *)(v57 + 52)) = v53;
  *(_WORD *)(v54 + *(int *)(v57 + 56)) = 256;
  v58 = sub_2287CD8F8();
  v60 = v59;
  v61 = (uint64_t *)(v54 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2559BDD70) + 36));
  *v61 = v58;
  v61[1] = v60;
  sub_2287C2160((uint64_t)v39, (uint64_t (*)(_QWORD))v52);
  v62 = sub_2287CD8F8();
  v64 = v63;
  v65 = (uint64_t)v100;
  v66 = (uint64_t)&v100[*(int *)(v97 + 36)];
  sub_2287B7790(v54, v66, &qword_2559BDD08);
  v67 = (uint64_t *)(v66 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2559BDD78) + 36));
  *v67 = v62;
  v67[1] = v64;
  sub_2287B7790(v50, v65, &qword_2559BDD18);
  sub_2287B741C(v54, &qword_2559BDD08);
  sub_2287B741C(v50, &qword_2559BDD18);
  LOBYTE(v62) = sub_2287CD694();
  sub_2287CD3A0();
  v69 = v68;
  v71 = v70;
  v73 = v72;
  v75 = v74;
  v76 = v101;
  sub_2287B7790(v65, v101, &qword_2559BDD20);
  v77 = v76 + *(int *)(v102 + 36);
  *(_BYTE *)v77 = v62;
  *(_QWORD *)(v77 + 8) = v69;
  *(_QWORD *)(v77 + 16) = v71;
  *(_QWORD *)(v77 + 24) = v73;
  *(_QWORD *)(v77 + 32) = v75;
  *(_BYTE *)(v77 + 40) = 0;
  sub_2287B741C(v65, &qword_2559BDD20);
  sub_2287C22D4(&qword_2559BDD80, &qword_2559BDD28, (uint64_t (*)(void))sub_2287C21AC, MEMORY[0x24BDECC60]);
  v78 = (uint64_t)v105;
  sub_2287CD7CC();
  sub_2287B741C(v76, &qword_2559BDD28);
  v79 = v103;
  sub_2287C24B4(v78, v103);
  v80 = v109;
  v81 = v99;
  sub_2287B7790(v109, v99, &qword_2559BDD48);
  sub_2287B7790(v79, v78, &qword_2559BDD30);
  v82 = v106;
  sub_2287B7790(v81, v106, &qword_2559BDD48);
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDDF0);
  sub_2287B7790(v78, v82 + *(int *)(v83 + 48), &qword_2559BDD30);
  sub_2287B741C(v79, &qword_2559BDD30);
  sub_2287B741C(v80, &qword_2559BDD48);
  sub_2287B741C(v78, &qword_2559BDD30);
  return sub_2287B741C(v81, &qword_2559BDD48);
}

void sub_2287C16B8(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  int64x2_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;

  v6 = sub_2287CD838();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = a1;
  v25 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDCF8);
  sub_2287CD88C();
  v10 = *(_QWORD *)(v20 + 56);
  swift_retain();
  swift_release();
  if (v10)
  {
    v20 = v10;
    LOBYTE(v21) = 0;
    swift_retain();
    sub_2287CD658();
    v20 = v24;
    v21 = v25;
    v22 = 0uLL;
    v23 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDDD0);
    sub_2287C240C();
    sub_2287C2470();
    sub_2287CD658();
    swift_release();
  }
  else
  {
    v24 = a1;
    v25 = a2;
    sub_2287CD88C();
    v11 = v20;
    swift_getKeyPath();
    v24 = v11;
    sub_2287B108C(&qword_2559BD698, (uint64_t (*)(uint64_t))type metadata accessor for LocationViewModel, (uint64_t)&protocol conformance descriptor for LocationViewModel);
    sub_2287CD2C8();
    swift_release();
    v12 = *(void **)(v11 + 48);
    v13 = v12;
    swift_release();
    if (v12)
    {
      v14 = v13;
      sub_2287CD82C();
      (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BDF3FD0], v6);
      v15 = sub_2287CD868();
      swift_release();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      v20 = v15;
      LOBYTE(v21) = 1;
      swift_retain();
      sub_2287CD658();
      v20 = v24;
      v21 = v25;
      v22 = 0uLL;
      v23 = 0;
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDDD0);
      sub_2287C240C();
      sub_2287C2470();
      sub_2287CD658();
      swift_release();
      swift_release();

    }
    else
    {
      if (qword_2559BD2D8 != -1)
        swift_once();
      v20 = qword_2559BDCB0;
      v21 = *(_QWORD *)algn_2559BDCB8;
      v22 = vdupq_n_s64(0x3FE3333333333333uLL);
      v23 = 1;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDDD0);
      sub_2287C240C();
      sub_2287C2470();
      sub_2287CD658();
    }
  }
  v16 = v25;
  v17 = v26;
  v18 = v27;
  v19 = v28;
  *(_QWORD *)a3 = v24;
  *(_QWORD *)(a3 + 8) = v16;
  *(_QWORD *)(a3 + 16) = v17;
  *(_QWORD *)(a3 + 24) = v18;
  *(_BYTE *)(a3 + 32) = v19;
}

uint64_t sub_2287C1A50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[6] = a2;
  v4[7] = a4;
  v4[5] = a1;
  type metadata accessor for LocationViewPopulator();
  v4[8] = swift_task_alloc();
  sub_2287CDA3C();
  v4[9] = sub_2287CDA30();
  v4[10] = sub_2287CDA18();
  v4[11] = v5;
  return swift_task_switch();
}

uint64_t sub_2287C1AE0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0[6];
  v0[2] = v0[5];
  v0[3] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDCF8);
  sub_2287CD88C();
  type metadata accessor for LocationViewModel();
  sub_2287B108C(&qword_2559BD698, (uint64_t (*)(uint64_t))type metadata accessor for LocationViewModel, (uint64_t)&protocol conformance descriptor for LocationViewModel);
  sub_2287CD8E0();
  sub_2287CD430();
  v0[12] = v2;
  v0[13] = v3;
  return swift_task_switch();
}

uint64_t sub_2287C1B94()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = v0[12];
  v1 = v0[13];
  v3 = v0[8];
  v4 = (_QWORD *)swift_task_alloc();
  v0[14] = v4;
  v4[2] = v3;
  v4[3] = v2;
  v4[4] = v1;
  v5 = (_QWORD *)swift_task_alloc();
  v0[15] = v5;
  *v5 = v0;
  v5[1] = sub_2287C1C30;
  return sub_2287CDB5C();
}

uint64_t sub_2287C1C30()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2287C1C8C()
{
  return swift_task_switch();
}

uint64_t sub_2287C1C9C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  swift_release();
  sub_2287C2160(v1, (uint64_t (*)(_QWORD))type metadata accessor for LocationViewPopulator);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2287C1CE4@<X0>(uint64_t (**a1)@<X0>(uint64_t@<X0>, uint64_t@<X8>)@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)@<X0>(uint64_t@<X0>, uint64_t@<X8>);

  v3 = *v1;
  v4 = v1[1];
  v5 = v1[2];
  v6 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))swift_allocObject();
  *((_QWORD *)v6 + 2) = v3;
  *((_QWORD *)v6 + 3) = v4;
  *((_QWORD *)v6 + 4) = v5;
  *a1 = sub_2287C2504;
  a1[1] = v6;
  swift_retain();
  swift_retain();
  return swift_retain();
}

uint64_t destroy for LocationView()
{
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *_s11ShazamKitUI12LocationViewVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for LocationView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for LocationView(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for LocationView()
{
  return &type metadata for LocationView;
}

uint64_t sub_2287C1E9C()
{
  return sub_2287B7F94(&qword_2559BDCC0, &qword_2559BDCC8, MEMORY[0x24BDEC6F8]);
}

uint64_t objectdestroyTm_0()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2287C1F00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_2287CD43C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_2287C1F84()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(sub_2287CD43C() - 8) + 80);
  v3 = v0[2];
  v4 = v0[3];
  v5 = v0[4];
  v6 = (uint64_t)v0 + ((v2 + 40) & ~v2);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_2287B49D8;
  return sub_2287C1A50(v3, v4, v5, v6);
}

uint64_t sub_2287C2004(uint64_t a1, uint64_t a2)
{
  double *v2;
  uint64_t v3;
  uint64_t v6;
  double v7;
  double v8;
  _QWORD *v9;

  v6 = *((_QWORD *)v2 + 2);
  v7 = v2[3];
  v8 = v2[4];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v9;
  *v9 = v3;
  v9[1] = sub_2287B7BB8;
  return sub_2287B542C(v7, v8, a1, a2, v6);
}

unint64_t sub_2287C2088()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2559BDD50;
  if (!qword_2559BDD50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BDD38);
    v2 = sub_2287B108C(&qword_2559BDD58, MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2559BDD50);
  }
  return result;
}

uint64_t sub_2287C210C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2287CD4A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2287C2150(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if ((a5 & 1) != 0)
    return swift_bridgeObjectRetain();
  else
    return swift_retain();
}

uint64_t sub_2287C2160(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2287C219C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if ((a5 & 1) != 0)
    return swift_bridgeObjectRelease();
  else
    return swift_release();
}

unint64_t sub_2287C21AC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559BDD88;
  if (!qword_2559BDD88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BDD20);
    v2[0] = sub_2287C2230();
    v2[1] = sub_2287B7F94(&qword_2559BDDE8, &qword_2559BDD78, MEMORY[0x24BDEDC10]);
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559BDD88);
  }
  return result;
}

unint64_t sub_2287C2230()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559BDD90;
  if (!qword_2559BDD90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BDD18);
    v2[0] = sub_2287C22D4(&qword_2559BDD98, &qword_2559BDDA0, (uint64_t (*)(void))sub_2287C233C, MEMORY[0x24BDEBEE0]);
    v2[1] = sub_2287B7F94(&qword_2559BDDE0, &qword_2559BDD10, MEMORY[0x24BDEB950]);
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559BDD90);
  }
  return result;
}

uint64_t sub_2287C22D4(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
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
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2287C233C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2559BDDA8;
  if (!qword_2559BDDA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BDDB0);
    v2 = sub_2287C23A0();
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDF3F50], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559BDDA8);
  }
  return result;
}

unint64_t sub_2287C23A0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559BDDB8;
  if (!qword_2559BDDB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BDDC0);
    v2[0] = sub_2287C240C();
    v2[1] = sub_2287C2470();
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559BDDB8);
  }
  return result;
}

unint64_t sub_2287C240C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559BDDC8;
  if (!qword_2559BDDC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BDDD0);
    v2[0] = MEMORY[0x24BDF4760];
    v2[1] = MEMORY[0x24BDF40E8];
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559BDDC8);
  }
  return result;
}

unint64_t sub_2287C2470()
{
  unint64_t result;

  result = qword_2559BDDD8;
  if (!qword_2559BDDD8)
  {
    result = MEMORY[0x22E2B5980](&protocol conformance descriptor for ArtworkUnavailableView, &type metadata for ArtworkUnavailableView);
    atomic_store(result, (unint64_t *)&qword_2559BDDD8);
  }
  return result;
}

uint64_t sub_2287C24B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDD30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2287C2508(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2287CDA60();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2287CDA54();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2287B741C(a1, &qword_2559BD658);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2287CDA18();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDED8);
  return swift_task_create();
}

uint64_t sub_2287C265C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2287CDA60();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2287CDA54();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2287B741C(a1, &qword_2559BD658);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2287CDA18();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

id sub_2287C27A8(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  char *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  char *v29;
  _BOOL8 v30;
  void (*v31)(char *, uint64_t, uint64_t, uint64_t);
  void *v32;
  uint64_t ObjCClassFromMetadata;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  void *v38;
  char *v40;
  id v41;

  v3 = sub_2287CD298();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v40 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD650);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD658);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  v13 = (void *)*((_QWORD *)v1 + 1);
  v14 = *((_QWORD *)v1 + 2);
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDA20]), sel_initWithTarget_action_, v14, sel_displayMatchedMediaItemAction);
  objc_msgSend(a1, sel_addGestureRecognizer_, v15);

  v16 = sub_2287CDA60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v11, 1, 1, v16);
  sub_2287CDA3C();
  v17 = a1;
  v18 = v13;
  swift_retain();
  v19 = sub_2287CDA30();
  v20 = swift_allocObject();
  v21 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v20 + 16) = v19;
  *(_QWORD *)(v20 + 24) = v21;
  *(_BYTE *)(v20 + 32) = v12;
  *(_QWORD *)(v20 + 40) = v18;
  *(_QWORD *)(v20 + 48) = v14;
  *(_QWORD *)(v20 + 56) = v17;
  sub_2287C265C((uint64_t)v11, (uint64_t)&unk_2559BDEA0, v20);
  swift_release();
  v22 = *(void **)&v17[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_titleLabel];
  v23 = objc_msgSend(v18, sel_title);
  v41 = v22;
  objc_msgSend(v22, sel_setText_, v23);

  v24 = *(void **)&v17[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_artistLabel];
  v25 = objc_msgSend(v18, sel_artist);
  objc_msgSend(v24, sel_setText_, v25);

  v26 = *(void **)&v17[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_appleMusicButton];
  v27 = objc_msgSend(v18, sel_appleMusicURL);
  if (v27)
  {
    v28 = v27;
    v29 = v40;
    sub_2287CD28C();

    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v8, v29, v3);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v8, 0, 1, v3);
    v30 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v8, 1, v3) == 1;
  }
  else
  {
    v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    v30 = 1;
    v31(v8, 1, 1, v3);
  }
  sub_2287B741C((uint64_t)v8, &qword_2559BD650);
  objc_msgSend(v26, sel_setHidden_, v30);
  objc_msgSend(v26, sel_addTarget_action_forControlEvents_, v14, sel_appleMusicButtonAction, 64);
  v32 = *(void **)&v17[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamCountLabel];
  type metadata accessor for AmbientMatchUIView();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v34 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_2287CD208();

  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDEA8);
  v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_2287D0390;
  v36 = objc_msgSend(v18, sel_shazamCount);
  v37 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v35 + 56) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v35 + 64) = v37;
  *(_QWORD *)(v35 + 32) = v36;
  sub_2287CD9AC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v38 = (void *)sub_2287CD9A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v32, sel_setText_, v38);

  objc_msgSend(v32, sel_setHidden_, objc_msgSend(v18, sel_shazamCount) == 0);
  objc_msgSend(v26, sel_setAlpha_, 0.0);
  objc_msgSend(*(id *)&v17[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamCountStackView], sel_setAlpha_, 0.0);
  objc_msgSend(v41, sel_setAlpha_, 0.0);
  return objc_msgSend(v24, sel_setAlpha_, 0.0);
}

uint64_t sub_2287C2C9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v7[2] = a5;
  v7[3] = a7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD650);
  v7[4] = swift_task_alloc();
  v8 = sub_2287CD298();
  v7[5] = v8;
  v7[6] = *(_QWORD *)(v8 - 8);
  v7[7] = swift_task_alloc();
  v7[8] = swift_task_alloc();
  sub_2287CDA3C();
  v7[9] = sub_2287CDA30();
  v7[10] = sub_2287CDA18();
  v7[11] = v9;
  return swift_task_switch();
}

uint64_t sub_2287C2D64()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);

  v1 = objc_msgSend(*(id *)(v0 + 16), sel_artworkURL);
  if (v1)
  {
    v2 = v1;
    v4 = *(_QWORD *)(v0 + 48);
    v3 = *(_QWORD *)(v0 + 56);
    v6 = *(_QWORD *)(v0 + 32);
    v5 = *(_QWORD *)(v0 + 40);
    sub_2287CD28C();

    v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32);
    v7(v6, v3, v5);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v4 + 56))(v6, 0, 1, v5);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v6, 1, v5) != 1)
    {
      v8 = *(_QWORD *)(v0 + 24);
      v7(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
      *(_QWORD *)(v0 + 96) = *(_QWORD *)(v8 + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtImageView);
      v12 = (uint64_t (*)(uint64_t))((char *)&dword_2559BD638 + dword_2559BD638);
      v9 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 104) = v9;
      *v9 = v0;
      v9[1] = sub_2287C2EE0;
      return v12(*(_QWORD *)(v0 + 64));
    }
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 48) + 56))(*(_QWORD *)(v0 + 32), 1, 1, *(_QWORD *)(v0 + 40));
  }
  v11 = *(_QWORD *)(v0 + 32);
  swift_release();
  sub_2287B741C(v11, &qword_2559BD650);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2287C2EE0(uint64_t a1)
{
  void *v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  swift_task_dealloc();
  if (v1)

  else
    *(_QWORD *)(v4 + 112) = a1;
  return swift_task_switch();
}

uint64_t sub_2287C2F58()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void **)(v0 + 112);
  swift_release();
  v2 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 48);
  objc_msgSend(*(id *)(v0 + 96), sel_setImage_, v1);

  sub_2287C96A8();
  sub_2287C9AC0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2287C2FF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  swift_release();
  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  objc_msgSend(*(id *)(v0 + 96), sel_setImage_, 0);
  sub_2287C96A8();
  sub_2287C9AC0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_2287C3080()
{
  type metadata accessor for AmbientMatchUIView();
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

uint64_t sub_2287C30AC()
{
  sub_2287C3668();
  return sub_2287CD640();
}

uint64_t sub_2287C30FC()
{
  sub_2287C3668();
  return sub_2287CD5EC();
}

void sub_2287C314C()
{
  sub_2287C3668();
  sub_2287CD634();
  __break(1u);
}

uint64_t sub_2287C317C(SEL *a1)
{
  uint64_t v1;
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
  id v13;
  void *v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v17;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD650);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2287CD298();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v17 - v11;
  v13 = objc_msgSend(*(id *)(v1 + 24), *a1);
  if (v13)
  {
    v14 = v13;
    sub_2287CD28C();

    v15 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v15(v5, v10, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
    {
      v15(v12, v5, v6);
      sub_2287B2060((uint64_t)v12);
      return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  }
  return sub_2287B741C((uint64_t)v5, &qword_2559BD650);
}

uint64_t sub_2287C3310(uint64_t a1, uint64_t a2, SEL *a3)
{
  swift_retain();
  sub_2287C317C(a3);
  return swift_release();
}

uint64_t sub_2287C3340()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AmbientMatchActionHandler()
{
  return objc_opt_self();
}

uint64_t destroy for AmbientMatch(uint64_t a1)
{

  return swift_release();
}

uint64_t _s11ShazamKitUI12AmbientMatchVwCP_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(void **)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  v5 = v3;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AmbientMatch(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  v6 = v4;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for AmbientMatch(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for AmbientMatch()
{
  return &type metadata for AmbientMatch;
}

uint64_t sub_2287C34A4()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2287C34E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(unsigned __int8 *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_QWORD *)(v1 + 48);
  v9 = *(_QWORD *)(v1 + 56);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_2287B49D8;
  return sub_2287C2C9C(a1, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_2287C3570(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2287C371C;
  return v6(a1);
}

uint64_t sub_2287C35D4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2287C35F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2287B7BB8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2559BDEB0 + dword_2559BDEB0))(a1, v4);
}

unint64_t sub_2287C3668()
{
  unint64_t result;

  result = qword_2559BDEC0;
  if (!qword_2559BDEC0)
  {
    result = MEMORY[0x22E2B5980](&unk_2287D0838, &type metadata for AmbientMatch);
    atomic_store(result, (unint64_t *)&qword_2559BDEC0);
  }
  return result;
}

uint64_t sub_2287C36AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2287B49D8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2559BDEC8 + dword_2559BDEC8))(a1, v4);
}

ValueMetadata *type metadata accessor for MediaLibraryHeaderRow()
{
  return &type metadata for MediaLibraryHeaderRow;
}

uint64_t sub_2287C3734()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2287C3744@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  char v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;

  v1 = sub_2287CD568();
  MEMORY[0x24BDAC7A8](v1);
  sub_2287CD574();
  type metadata accessor for LocalizationBundle();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v39 = (void *)objc_opt_self();
  v3 = objc_msgSend(v39, sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = sub_2287CD754();
  v6 = v5;
  v8 = v7 & 1;
  sub_2287CD6DC();
  v9 = sub_2287CD730();
  v11 = v10;
  v13 = v12;
  swift_release();
  sub_2287B4820(v4, v6, v8);
  swift_bridgeObjectRelease();
  if (qword_2559BD2B0 != -1)
    swift_once();
  v40 = sub_2287CD718();
  v41 = v14;
  v16 = v15;
  v38 = v17;
  sub_2287B4820(v9, v11, v13 & 1);
  swift_bridgeObjectRelease();
  sub_2287CD55C();
  sub_2287CD550();
  sub_2287CD544();
  sub_2287CD550();
  sub_2287CD580();
  v18 = objc_msgSend(v39, sel_bundleForClass_, ObjCClassFromMetadata);
  v19 = sub_2287CD754();
  v21 = v20;
  v23 = v22 & 1;
  sub_2287CD6DC();
  v24 = sub_2287CD730();
  v26 = v25;
  v28 = v27;
  swift_release();
  sub_2287B4820(v19, v21, v23);
  swift_bridgeObjectRelease();
  if (qword_2559BD2B8 != -1)
    swift_once();
  v29 = v28 & 1;
  v30 = sub_2287CD718();
  v32 = v31;
  v34 = v33;
  v36 = v35 & 1;
  sub_2287B4820(v24, v26, v29);
  swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v40;
  *(_QWORD *)(a1 + 8) = v16;
  *(_BYTE *)(a1 + 16) = v38 & 1;
  *(_QWORD *)(a1 + 24) = v41;
  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 40) = 1;
  *(_QWORD *)(a1 + 48) = v30;
  *(_QWORD *)(a1 + 56) = v32;
  *(_BYTE *)(a1 + 64) = v36;
  *(_QWORD *)(a1 + 72) = v34;
  sub_2287B9A60(v40, v16, v38 & 1);
  swift_bridgeObjectRetain();
  sub_2287B9A60(v30, v32, v36);
  swift_bridgeObjectRetain();
  sub_2287B4820(v30, v32, v36);
  swift_bridgeObjectRelease();
  sub_2287B4820(v40, v16, v38 & 1);
  return swift_bridgeObjectRelease();
}

__n128 sub_2287C3B54@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  __n128 result;
  __int128 v10;
  __n128 v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  __int128 v16;
  char v17;
  uint64_t v18;

  v2 = sub_2287CD538();
  sub_2287C3744((uint64_t)&v11);
  v3 = v12;
  v4 = v13;
  v5 = v14;
  v6 = v15;
  v7 = v17;
  v8 = v18;
  result = v11;
  v10 = v16;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(__n128 *)(a1 + 24) = result;
  *(_BYTE *)(a1 + 40) = v3;
  *(_QWORD *)(a1 + 48) = v4;
  *(_QWORD *)(a1 + 56) = v5;
  *(_BYTE *)(a1 + 64) = v6;
  *(_OWORD *)(a1 + 72) = v10;
  *(_BYTE *)(a1 + 88) = v7;
  *(_QWORD *)(a1 + 96) = v8;
  return result;
}

unint64_t sub_2287C3BE0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2559BDEE0;
  if (!qword_2559BDEE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BDEE8);
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDF4498], v1);
    atomic_store(result, (unint64_t *)&qword_2559BDEE0);
  }
  return result;
}

uint64_t sub_2287C3C2C()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2287CD370();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2287C3C9C()
{
  return swift_task_switch();
}

uint64_t sub_2287C3CB0()
{
  uint64_t v0;

  sub_2287CD94C();
  *(_QWORD *)(v0 + 16) = sub_2287CD940();
  sub_2287CDA3C();
  *(_QWORD *)(v0 + 24) = sub_2287CDA30();
  sub_2287CDA18();
  return swift_task_switch();
}

uint64_t sub_2287C3D2C()
{
  uint64_t v0;
  uint64_t v1;

  swift_release();
  v1 = sub_2287CD934();
  swift_release();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_2287C3D70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  _BYTE v5[40];
  __int128 v6;
  ValueMetadata *v7;
  _UNKNOWN **v8;

  v3 = v1 + 16;
  swift_beginAccess();
  sub_2287C4000(v3, (uint64_t)&v6);
  if (!v7)
  {
    sub_2287C3FC0((uint64_t)&v6);
    v7 = &type metadata for MediaLibraryLoader;
    v8 = &off_24F137638;
    sub_2287C4048((uint64_t)&v6, (uint64_t)v5);
    swift_beginAccess();
    sub_2287C408C((uint64_t)v5, v3);
    swift_endAccess();
  }
  return sub_2287C40D4(&v6, a1);
}

uint64_t sub_2287C3E1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_2287C3FC0(v0 + 16);
  v1 = v0 + OBJC_IVAR____TtC11ShazamKitUI22MediaLibraryController__items;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDFC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_2287C3E78()
{
  return type metadata accessor for MediaLibraryController();
}

uint64_t type metadata accessor for MediaLibraryController()
{
  uint64_t result;

  result = qword_2559BDF20;
  if (!qword_2559BDF20)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2287C3EBC()
{
  unint64_t v0;

  sub_2287C3F34();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_2287C3F34()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2559BDF30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BDCA8);
    v0 = sub_2287CD388();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2559BDF30);
  }
}

uint64_t sub_2287C3F8C()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_2287C3F98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2287CD334();
  *a1 = result;
  return result;
}

uint64_t sub_2287C3FC0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDFB8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2287C4000(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDFB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2287C4048(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2287C408C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDFB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2287C40D4(__int128 *a1, uint64_t a2)
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

ValueMetadata *type metadata accessor for MediaLibraryLoader()
{
  return &type metadata for MediaLibraryLoader;
}

uint64_t sub_2287C4104(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_2287CDA60();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_2287CDA54();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_2287B741C(a1, &qword_2559BD658);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2287CDA18();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t MatchingFlowViewModel.__allocating_init()()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v0 = swift_allocObject();
  sub_2287CD340();
  v1 = (_QWORD *)(v0 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_sizeUpdatedHandler);
  *v1 = 0;
  v1[1] = 0;
  v2 = (_QWORD *)(v0 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_cancellationHandler);
  *v2 = 0;
  v2[1] = 0;
  return v0;
}

uint64_t MatchingFlowView.viewModel.getter()
{
  return swift_retain();
}

uint64_t MatchingFlowView.viewModel.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_release();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t (*MatchingFlowView.viewModel.modify())()
{
  return nullsub_1;
}

uint64_t MatchingFlowView.$viewModel.getter()
{
  type metadata accessor for MatchingFlowViewModel();
  sub_2287BEF58();
  return sub_2287CD478();
}

uint64_t MatchingFlowView.init(viewModel:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  type metadata accessor for MatchingFlowViewModel();
  sub_2287BEF58();
  result = sub_2287CD46C();
  *a1 = result;
  a1[1] = v3;
  a1[2] = 0;
  return result;
}

uint64_t MatchingFlowView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char v16;
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
  char v29;
  char *v30;
  uint64_t (*v31)(double, double);
  uint64_t (**v32)(double, double);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;

  v38 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDFD8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDFE0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDFE8);
  MEMORY[0x24BDAC7A8](v36);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDFF0);
  MEMORY[0x24BDAC7A8](v37);
  v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *v1;
  v12 = v1[1];
  v14 = (void *)v1[2];
  *(_QWORD *)v4 = sub_2287CD598();
  *((_QWORD *)v4 + 1) = 0;
  v4[16] = 1;
  v15 = (uint64_t)&v4[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2559BDFF8) + 44)];
  v35 = v13;
  sub_2287C46B0(v14, v15);
  LOBYTE(v13) = sub_2287CD694();
  v16 = sub_2287CD6AC();
  sub_2287CD6AC();
  if (sub_2287CD6AC() != v13)
    v16 = sub_2287CD6AC();
  sub_2287CD3A0();
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  sub_2287B7790((uint64_t)v4, (uint64_t)v7, &qword_2559BDFD8);
  v25 = &v7[*(int *)(v5 + 36)];
  *v25 = v16;
  *((_QWORD *)v25 + 1) = v18;
  *((_QWORD *)v25 + 2) = v20;
  *((_QWORD *)v25 + 3) = v22;
  *((_QWORD *)v25 + 4) = v24;
  v25[40] = 0;
  sub_2287B741C((uint64_t)v4, &qword_2559BDFD8);
  v26 = sub_2287CD910();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2287CD370();
  swift_release();
  swift_release();
  swift_release();
  v27 = v39;
  v28 = v40;
  v29 = v41;
  sub_2287B7790((uint64_t)v7, (uint64_t)v9, &qword_2559BDFE0);
  v30 = &v9[*(int *)(v36 + 36)];
  *(_QWORD *)v30 = v26;
  *((_QWORD *)v30 + 1) = v27;
  *((_QWORD *)v30 + 2) = v28;
  v30[24] = v29;
  sub_2287B741C((uint64_t)v7, &qword_2559BDFE0);
  v31 = (uint64_t (*)(double, double))swift_allocObject();
  *((_QWORD *)v31 + 2) = v35;
  *((_QWORD *)v31 + 3) = v12;
  *((_QWORD *)v31 + 4) = v14;
  sub_2287B7790((uint64_t)v9, (uint64_t)v11, &qword_2559BDFE8);
  v32 = (uint64_t (**)(double, double))&v11[*(int *)(v37 + 36)];
  *v32 = sub_2287C5DBC;
  v32[1] = v31;
  swift_retain();
  sub_2287B741C((uint64_t)v9, &qword_2559BDFE8);
  return sub_2287BB658((uint64_t)v11, v38, &qword_2559BDFF0);
}

uint64_t sub_2287C46B0@<X0>(void *a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (**v31)();
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  id v38;
  char v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  char v57;
  uint64_t v58;
  char v59;
  id v60;
  char v61;
  __int128 v62;

  v48 = a1;
  v54 = a2;
  v2 = sub_2287CD3B8();
  v42 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDAF8);
  v43 = *(_QWORD *)(v5 - 8);
  v44 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE168);
  v45 = *(_QWORD *)(v8 - 8);
  v46 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE170);
  v11 = MEMORY[0x24BDAC7A8](v50);
  v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v47 = (uint64_t)&v41 - v14;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE178);
  MEMORY[0x24BDAC7A8](v52);
  v16 = (uint64_t *)((char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE180);
  MEMORY[0x24BDAC7A8](v49);
  v18 = (char *)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE188);
  MEMORY[0x24BDAC7A8](v53);
  v51 = (char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2287CD370();
  swift_release();
  swift_release();
  swift_release();
  v20 = v55;
  v21 = v56;
  if (v57)
  {
    if (v57 == 1)
    {
      sub_2287B9080(v55, v56, 1);
      *v16 = sub_2287CD91C();
      v16[1] = (uint64_t)sub_2287BF55C;
      v16[3] = 0;
      v16[4] = 0;
      v16[2] = 0;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE190);
      sub_2287C62D8();
      sub_2287C22D4(&qword_2559BE1D8, &qword_2559BE190, (uint64_t (*)(void))sub_2287C6548, MEMORY[0x24BDF0910]);
      return sub_2287CD658();
    }
    sub_2287CD8F8();
    sub_2287CD424();
    v37 = v59;
    v38 = v60;
    v39 = v61;
    *(_QWORD *)v18 = v58;
    v18[8] = v37;
    *((_QWORD *)v18 + 2) = v38;
    v18[24] = v39;
    *((_OWORD *)v18 + 2) = v62;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE1A8);
    sub_2287C22D4(&qword_2559BE1A0, &qword_2559BE1A8, (uint64_t (*)(void))sub_2287C6364, MEMORY[0x24BDEBEE0]);
    sub_2287C63A8();
    v40 = (uint64_t)v51;
    sub_2287CD658();
    v32 = &qword_2559BE188;
    sub_2287B7790(v40, (uint64_t)v16, &qword_2559BE188);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE190);
    sub_2287C62D8();
    sub_2287C22D4(&qword_2559BE1D8, &qword_2559BE190, (uint64_t (*)(void))sub_2287C6548, MEMORY[0x24BDF0910]);
    sub_2287CD658();
    v36 = v40;
  }
  else
  {
    v58 = sub_2287CD91C();
    v23 = v20 & 1;
    v59 = v20 & 1;
    v60 = v21;
    v61 = 0;
    v24 = v21;
    v48 = v20;
    v25 = v24;
    sub_2287CD3AC();
    v26 = swift_allocObject();
    v41 = v21;
    *(_BYTE *)(v26 + 16) = v23;
    *(_QWORD *)(v26 + 24) = v25;
    v27 = v25;
    sub_2287CD8C8();
    swift_release();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v4, v2);
    sub_2287CD3C4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE1C0);
    sub_2287C6480();
    sub_2287B7F94(&qword_2559BDBB0, &qword_2559BDAF8, MEMORY[0x24BDEC410]);
    v28 = v44;
    sub_2287CD7D8();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v7, v28);

    v30 = v45;
    v29 = v46;
    (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v13, v10, v46);
    v31 = (uint64_t (**)())&v13[*(int *)(v50 + 36)];
    *v31 = sub_2287BF4B8;
    v31[1] = 0;
    v31[2] = 0;
    v31[3] = 0;
    (*(void (**)(char *, uint64_t))(v30 + 8))(v10, v29);
    v32 = &qword_2559BE170;
    v33 = (uint64_t)v13;
    v34 = v47;
    sub_2287BB658(v33, v47, &qword_2559BE170);
    sub_2287B7790(v34, (uint64_t)v18, &qword_2559BE170);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE1A8);
    sub_2287C22D4(&qword_2559BE1A0, &qword_2559BE1A8, (uint64_t (*)(void))sub_2287C6364, MEMORY[0x24BDEBEE0]);
    sub_2287C63A8();
    v35 = (uint64_t)v51;
    sub_2287CD658();
    sub_2287B7790(v35, (uint64_t)v16, &qword_2559BE188);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE190);
    sub_2287C62D8();
    sub_2287C22D4(&qword_2559BE1D8, &qword_2559BE190, (uint64_t (*)(void))sub_2287C6548, MEMORY[0x24BDF0910]);
    sub_2287CD658();
    sub_2287B9080(v48, v41, 0);
    sub_2287B741C(v35, &qword_2559BE188);
    v36 = v34;
  }
  return sub_2287B741C(v36, v32);
}

uint64_t sub_2287C4DA0(uint64_t a1, char a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD658);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2287CDA60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_2287CDA3C();
  v9 = a3;
  v10 = sub_2287CDA30();
  v11 = swift_allocObject();
  v12 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v11 + 16) = v10;
  *(_QWORD *)(v11 + 24) = v12;
  *(_BYTE *)(v11 + 32) = a2;
  *(_QWORD *)(v11 + 40) = v9;
  sub_2287C4104((uint64_t)v7, (uint64_t)&unk_2559BE1F0, v11);
  return swift_release();
}

uint64_t sub_2287C4E90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[15] = a5;
  sub_2287CDA3C();
  v5[16] = sub_2287CDA30();
  v5[17] = sub_2287CDA18();
  v5[18] = v6;
  return swift_task_switch();
}

uint64_t sub_2287C4EFC()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[15];
  sub_2287BCC5C(*MEMORY[0x24BE90578], *MEMORY[0x24BE90590]);
  v2 = (void *)objc_opt_self();
  v0[2] = v0;
  v0[3] = sub_2287C4FC0;
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_2287CC258;
  v4[3] = &block_descriptor_3;
  v4[4] = v3;
  objc_msgSend(v2, sel_presentMediaItem_completionHandler_, v1, v4);
  return swift_continuation_await();
}

uint64_t sub_2287C4FC0()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 152) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2287C501C()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2287C5050()
{
  uint64_t v0;

  swift_release();
  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2287C5094(double a1, double a2, uint64_t a3, uint64_t a4)
{
  void (**v6)(uint64_t, double, double);
  uint64_t result;
  void (*v8)(uint64_t, double, double);
  uint64_t v9;

  v6 = (void (**)(uint64_t, double, double))(a4
                                                     + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_sizeUpdatedHandler);
  result = swift_beginAccess();
  v8 = *v6;
  if (*v6)
  {
    v9 = swift_retain();
    v8(v9, a1, a2);
    return sub_2287B4808((uint64_t)v8);
  }
  return result;
}

double sub_2287C5114@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  char v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2287CD370();
  swift_release();
  swift_release();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_BYTE *)(a1 + 16) = v4;
  return result;
}

uint64_t sub_2287C5198(uint64_t a1)
{
  void *v1;
  void *v2;
  char v3;

  v1 = *(void **)a1;
  v2 = *(void **)(a1 + 8);
  v3 = *(_BYTE *)(a1 + 16);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2287B9054(v1, v2, v3);
  swift_retain();
  return sub_2287CD37C();
}

uint64_t sub_2287C5228()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2287CD370();
  swift_release();
  return swift_release();
}

uint64_t sub_2287C528C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_2287CD37C();
}

void (*sub_2287C5308(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2287CD364();
  return sub_2287C5380;
}

void sub_2287C5380(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_2287C53CC()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE000);
  sub_2287CD34C();
  return swift_endAccess();
}

uint64_t sub_2287C5430(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, uint64_t, uint64_t);
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE008);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v11 - v7;
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  v9(v6, (uint64_t)v8, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE000);
  sub_2287CD358();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t sub_2287C5540()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE000);
  sub_2287CD34C();
  return swift_endAccess();
}

uint64_t sub_2287C55A0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE008);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE000);
  sub_2287CD358();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_2287C5674(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE008);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel__state;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE000);
  sub_2287CD34C();
  swift_endAccess();
  return sub_2287C573C;
}

void sub_2287C573C(uint64_t a1, char a2)
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
  v4 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a1 + 88) + 16);
  v4(*(_QWORD *)(*(_QWORD *)a1 + 104), v3[14], v3[10]);
  v5 = (void *)v3[13];
  v6 = (void *)v3[14];
  v8 = v3[11];
  v7 = (void *)v3[12];
  v9 = v3[10];
  if ((a2 & 1) != 0)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_2287CD358();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v5, v9);
  }
  else
  {
    swift_beginAccess();
    sub_2287CD358();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v6, v9);
  free(v6);
  free(v5);
  free(v7);
  free(v3);
}

uint64_t sub_2287C5854@<X0>(_QWORD *a1@<X0>, uint64_t (**a2)(double *a1)@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(double *);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_sizeUpdatedHandler);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_2287B7EC0;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)(double *))v6;
  return sub_2287B4F88(v4);
}

uint64_t sub_2287C58E8(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(double, double);
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_2287C62A8;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_sizeUpdatedHandler);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_2287B4F88(v3);
  return sub_2287B4808(v8);
}

uint64_t sub_2287C59A0()
{
  return sub_2287C5B70(&OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_sizeUpdatedHandler, (void (*)(_QWORD, _QWORD))sub_2287C6664);
}

uint64_t sub_2287C59B4(uint64_t a1, uint64_t a2)
{
  return sub_2287C5BE4(a1, a2, &OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_sizeUpdatedHandler, (uint64_t (*)(uint64_t, uint64_t))sub_2287C6668);
}

uint64_t (*sub_2287C59C8())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2287C5A10@<X0>(_QWORD *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_cancellationHandler);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_2287C6288;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_2287B4F88(v4);
}

uint64_t sub_2287C5AA4(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_2287C6288;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_cancellationHandler);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_2287B4F88(v3);
  return sub_2287B4808(v8);
}

uint64_t sub_2287C5B5C()
{
  return sub_2287C5B70(&OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_cancellationHandler, (void (*)(_QWORD, _QWORD))sub_2287B4F88);
}

uint64_t sub_2287C5B70(_QWORD *a1, void (*a2)(_QWORD, _QWORD))
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)(v2 + *a1);
  swift_beginAccess();
  v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t sub_2287C5BD0(uint64_t a1, uint64_t a2)
{
  return sub_2287C5BE4(a1, a2, &OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_cancellationHandler, (uint64_t (*)(uint64_t, uint64_t))sub_2287B4808);
}

uint64_t sub_2287C5BE4(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  v9 = *v8;
  v10 = v8[1];
  *v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t (*sub_2287C5C40())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t MatchingFlowViewModel.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD v9[3];
  char v10;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE000);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = v0 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel__state;
  v9[1] = 0;
  v9[2] = 0;
  v10 = 2;
  sub_2287CD340();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v5, v4, v1);
  v6 = (_QWORD *)(v0 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_sizeUpdatedHandler);
  *v6 = 0;
  v6[1] = 0;
  v7 = (_QWORD *)(v0 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_cancellationHandler);
  *v7 = 0;
  v7[1] = 0;
  return v0;
}

uint64_t type metadata accessor for MatchingFlowViewModel()
{
  uint64_t result;

  result = qword_2559BE038;
  if (!qword_2559BE038)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2287C5D98()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2287C5DBC(double a1, double a2)
{
  uint64_t v2;

  return sub_2287C5094(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t MatchingFlowViewModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel__state;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE000);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_2287B4808(*(_QWORD *)(v0 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_sizeUpdatedHandler));
  sub_2287B4808(*(_QWORD *)(v0 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_cancellationHandler));
  return v0;
}

uint64_t MatchingFlowViewModel.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel__state;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE000);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_2287B4808(*(_QWORD *)(v0 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_sizeUpdatedHandler));
  sub_2287B4808(*(_QWORD *)(v0 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_cancellationHandler));
  return swift_deallocClassInstance();
}

uint64_t sub_2287C5EB4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2287C5EC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for MatchingFlowViewModel();
  result = sub_2287CD334();
  *a1 = result;
  return result;
}

uint64_t sub_2287C5F00@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(a1 + 8);
  return swift_retain();
}

uint64_t sub_2287C5F0C(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_retain();
  result = swift_release();
  *(_QWORD *)(a2 + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for MatchingFlowView()
{
  return &type metadata for MatchingFlowView;
}

uint64_t sub_2287C5F74()
{
  return type metadata accessor for MatchingFlowViewModel();
}

void sub_2287C5F7C()
{
  unint64_t v0;

  sub_2287C6098();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for MatchingFlowViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MatchingFlowViewModel.state.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of MatchingFlowViewModel.state.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of MatchingFlowViewModel.state.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of MatchingFlowViewModel.$state.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of MatchingFlowViewModel.$state.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of MatchingFlowViewModel.$state.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of MatchingFlowViewModel.sizeUpdatedHandler.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of MatchingFlowViewModel.sizeUpdatedHandler.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of MatchingFlowViewModel.sizeUpdatedHandler.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of MatchingFlowViewModel.cancellationHandler.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of MatchingFlowViewModel.cancellationHandler.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of MatchingFlowViewModel.cancellationHandler.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of MatchingFlowViewModel.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

void sub_2287C6098()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2559BE048[0])
  {
    v0 = sub_2287CD388();
    if (!v1)
      atomic_store(v0, qword_2559BE048);
  }
}

unint64_t sub_2287C60F0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559BE138;
  if (!qword_2559BE138)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BDFF0);
    v2[0] = sub_2287C615C();
    v2[1] = sub_2287BFA04();
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559BE138);
  }
  return result;
}

unint64_t sub_2287C615C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559BE140;
  if (!qword_2559BE140)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BDFE8);
    v2[0] = sub_2287C61E0();
    v2[1] = sub_2287B7F94(&qword_2559BE158, &qword_2559BE160, MEMORY[0x24BDEEC10]);
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559BE140);
  }
  return result;
}

unint64_t sub_2287C61E0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559BE148;
  if (!qword_2559BE148)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BDFE0);
    v2[0] = sub_2287B7F94(&qword_2559BE150, &qword_2559BDFD8, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559BE148);
  }
  return result;
}

uint64_t sub_2287C6264()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2287C6288()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_2287C62A8(double a1, double a2)
{
  uint64_t v2;
  uint64_t (*v3)(_QWORD *);
  _QWORD v5[2];

  v3 = *(uint64_t (**)(_QWORD *))(v2 + 16);
  *(double *)v5 = a1;
  *(double *)&v5[1] = a2;
  return v3(v5);
}

unint64_t sub_2287C62D8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559BE198;
  if (!qword_2559BE198)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BE188);
    v2[0] = sub_2287C22D4(&qword_2559BE1A0, &qword_2559BE1A8, (uint64_t (*)(void))sub_2287C6364, MEMORY[0x24BDEBEE0]);
    v2[1] = sub_2287C63A8();
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559BE198);
  }
  return result;
}

unint64_t sub_2287C6364()
{
  unint64_t result;

  result = qword_2559BE1B0;
  if (!qword_2559BE1B0)
  {
    result = MEMORY[0x22E2B5980](&unk_2287CF358, &type metadata for AttributedListeningView);
    atomic_store(result, (unint64_t *)&qword_2559BE1B0);
  }
  return result;
}

unint64_t sub_2287C63A8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[6];

  result = qword_2559BE1B8;
  if (!qword_2559BE1B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BE170);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BE1C0);
    v2[3] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BDAF8);
    v2[4] = sub_2287C6480();
    v2[5] = sub_2287B7F94(&qword_2559BDBB0, &qword_2559BDAF8, MEMORY[0x24BDEC410]);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559BE1B8);
  }
  return result;
}

unint64_t sub_2287C6480()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559BE1C8;
  if (!qword_2559BE1C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BE1C0);
    v2[0] = sub_2287C6504();
    v2[1] = sub_2287B7F94(&qword_2559BD928, &qword_2559BD930, MEMORY[0x24BDEFAD8]);
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559BE1C8);
  }
  return result;
}

unint64_t sub_2287C6504()
{
  unint64_t result;

  result = qword_2559BE1D0;
  if (!qword_2559BE1D0)
  {
    result = MEMORY[0x22E2B5980](&unk_2287D04F4, &type metadata for MatchSnippet);
    atomic_store(result, (unint64_t *)&qword_2559BE1D0);
  }
  return result;
}

unint64_t sub_2287C6548()
{
  unint64_t result;

  result = qword_2559BE1E0;
  if (!qword_2559BE1E0)
  {
    result = MEMORY[0x22E2B5980](&unk_2287CFAD8, &type metadata for NoMatch);
    atomic_store(result, &qword_2559BE1E0);
  }
  return result;
}

uint64_t sub_2287C658C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2287C65B0(uint64_t a1)
{
  uint64_t v1;

  return sub_2287C4DA0(a1, *(_BYTE *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_2287C65BC()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_2287C65E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(unsigned __int8 *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_2287B49D8;
  return sub_2287C4E90(a1, v4, v5, v6, v7);
}

uint64_t ArtworkUnavailableView.init(placeholderImage:widthRatio:heightRatio:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, uint64_t a7@<X8>)
{
  double v8;

  v8 = 0.6;
  if ((a4 & 1) != 0)
    a3 = 0.6;
  *(_QWORD *)a7 = result;
  *(_QWORD *)(a7 + 8) = a2;
  if ((a6 & 1) == 0)
    v8 = a5;
  *(double *)(a7 + 16) = a3;
  *(double *)(a7 + 24) = v8;
  return result;
}

uint64_t ArtworkUnavailableView.body.getter@<X0>(double (**a1)@<D0>(uint64_t a1@<X8>)@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double (*v7)@<D0>(uint64_t@<X8>);

  v4 = *v1;
  v3 = v1[1];
  v5 = v1[2];
  v6 = v1[3];
  v7 = (double (*)@<D0>(uint64_t@<X8>))swift_allocObject();
  *((_QWORD *)v7 + 2) = v4;
  *((_QWORD *)v7 + 3) = v3;
  *((_QWORD *)v7 + 4) = v5;
  *((_QWORD *)v7 + 5) = v6;
  *a1 = sub_2287C67FC;
  a1[1] = v7;
  return swift_bridgeObjectRetain();
}

__n128 sub_2287C670C@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  __n128 result;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  __n128 v24;
  uint64_t v25;
  uint64_t v26;

  v2 = sub_2287CD8F8();
  v4 = v3;
  sub_2287C6818((uint64_t)&v16);
  v5 = v17;
  v6 = v18;
  v7 = v19;
  v8 = v20;
  v9 = v21;
  v10 = v22;
  v11 = v23;
  v12 = v25;
  v13 = v26;
  result = v24;
  v15 = v16;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_OWORD *)(a1 + 16) = v15;
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = v6;
  *(_BYTE *)(a1 + 41) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  *(_BYTE *)(a1 + 56) = v9;
  *(_QWORD *)(a1 + 64) = v10;
  *(_BYTE *)(a1 + 72) = v11;
  *(__n128 *)(a1 + 80) = result;
  *(_QWORD *)(a1 + 96) = v12;
  *(_QWORD *)(a1 + 104) = v13;
  return result;
}

uint64_t sub_2287C67D8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

double sub_2287C67FC@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_2287C670C(a1).n128_u64[0];
  return result;
}

uint64_t sub_2287C6808()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2287C6818@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;

  v2 = sub_2287CD838();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (void *)objc_opt_self();
  v15 = MEMORY[0x22E2B4F0C](objc_msgSend(v6, sel_systemGray5Color));
  swift_bridgeObjectRetain();
  sub_2287CD850();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDF3FD0], v2);
  v7 = sub_2287CD868();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_2287CD430();
  sub_2287CD430();
  sub_2287CD8F8();
  sub_2287CD424();
  v8 = v16;
  LOBYTE(v5) = v17;
  v9 = v18;
  LOBYTE(v3) = v19;
  v11 = v20;
  v10 = v21;
  v12 = MEMORY[0x22E2B4F0C](objc_msgSend(v6, sel_systemFillColor));
  result = swift_getKeyPath();
  *(_QWORD *)a1 = v15;
  *(_QWORD *)(a1 + 8) = v7;
  *(_QWORD *)(a1 + 16) = 0;
  *(_WORD *)(a1 + 24) = 1;
  *(_QWORD *)(a1 + 32) = v8;
  *(_BYTE *)(a1 + 40) = (_BYTE)v5;
  *(_QWORD *)(a1 + 48) = v9;
  *(_BYTE *)(a1 + 56) = v3;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v10;
  *(_QWORD *)(a1 + 80) = result;
  *(_QWORD *)(a1 + 88) = v12;
  return result;
}

uint64_t sub_2287C69F0@<X0>(double (**a1)@<D0>(uint64_t@<X8>)@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double (*v7)@<D0>(uint64_t@<X8>);

  v4 = *v1;
  v3 = v1[1];
  v5 = v1[2];
  v6 = v1[3];
  v7 = (double (*)@<D0>(uint64_t@<X8>))swift_allocObject();
  *((_QWORD *)v7 + 2) = v4;
  *((_QWORD *)v7 + 3) = v3;
  *((_QWORD *)v7 + 4) = v5;
  *((_QWORD *)v7 + 5) = v6;
  *a1 = sub_2287C6C24;
  a1[1] = v7;
  return swift_bridgeObjectRetain();
}

uint64_t destroy for ArtworkUnavailableView()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ArtworkUnavailableView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ArtworkUnavailableView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
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

uint64_t assignWithTake for ArtworkUnavailableView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for ArtworkUnavailableView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ArtworkUnavailableView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ArtworkUnavailableView()
{
  return &type metadata for ArtworkUnavailableView;
}

unint64_t sub_2287C6BCC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2559BE1F8;
  if (!qword_2559BE1F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BE200);
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDEC6F8], v1);
    atomic_store(result, (unint64_t *)&qword_2559BE1F8);
  }
  return result;
}

uint64_t ListeningView.init(state:bass:treble:showIntroAnimation:compatibleWithCustomBackground:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, char a11, char a12)
{
  uint64_t v17;
  uint64_t result;
  uint64_t v21;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (a5)
  {
    v17 = a5;
    swift_retain();
    swift_retain();
  }
  else
  {
    swift_retain();
    swift_retain();
    sub_2287CD8B0();
    a4 = v24;
    v17 = v25;
    a6 = v26;
  }
  if (a8)
  {
    swift_release();
    result = swift_release();
    v21 = a7;
  }
  else
  {
    sub_2287CD8B0();
    swift_release();
    result = swift_release();
    v21 = v24;
    a8 = v25;
    a10 = v26;
  }
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = v17;
  *(_QWORD *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = v21;
  *(_QWORD *)(a9 + 56) = a8;
  *(_QWORD *)(a9 + 64) = a10;
  *(_BYTE *)(a9 + 72) = a11 & 1;
  *(_BYTE *)(a9 + 73) = a12 & 1;
  return result;
}

double ListeningView.body.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  double result;
  char v4;
  char v5;
  __int128 v6;
  double v7;

  v4 = *(_BYTE *)(v1 + 73);
  v5 = *(_BYTE *)(v1 + 72);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE208);
  sub_2287CD8A4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE210);
  sub_2287CD8A4();
  sub_2287CD8A4();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  result = v7;
  *(_OWORD *)a1 = v6;
  *(double *)(a1 + 16) = v7;
  *(_OWORD *)(a1 + 24) = v6;
  *(double *)(a1 + 40) = v7;
  *(_OWORD *)(a1 + 48) = v6;
  *(double *)(a1 + 64) = v7;
  *(_BYTE *)(a1 + 72) = v5;
  *(_BYTE *)(a1 + 73) = v4;
  *(_QWORD *)(a1 + 80) = 0;
  *(_WORD *)(a1 + 88) = 1;
  return result;
}

uint64_t sub_2287C6EE8()
{
  return swift_getOpaqueTypeConformance2();
}

__n128 __swift_memcpy74_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 58) = *(_OWORD *)(a2 + 58);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

ValueMetadata *type metadata accessor for ListeningView()
{
  return &type metadata for ListeningView;
}

id sub_2287C6F48(uint64_t a1, double a2, double a3)
{
  void *v3;
  id result;
  char **v7;

  objc_msgSend(v3, sel_setBass_);
  objc_msgSend(v3, sel_setTreble_, a3);
  result = objc_msgSend(v3, sel_state);
  switch(a1)
  {
    case 1:
      if (result != (id)1)
        goto LABEL_3;
      break;
    case 2:
      if (result != (id)2)
      {
        v7 = &selRef_startIdleAnimation;
        goto LABEL_13;
      }
      break;
    case 3:
      if (result != (id)3)
      {
        v7 = &selRef_startPassiveListeningAnimation;
        if (result == (id)4)
          goto LABEL_9;
        goto LABEL_13;
      }
      break;
    case 4:
      if (result != (id)4)
      {
        v7 = &selRef_startActiveListeningAnimation;
        if (result == (id)3)
LABEL_9:
          objc_msgSend(v3, sel_stopAllAnimations);
        goto LABEL_13;
      }
      break;
    default:
LABEL_3:
      v7 = &selRef_stopAllAnimations;
LABEL_13:
      result = objc_msgSend(v3, *v7);
      break;
  }
  return result;
}

uint64_t type metadata accessor for ListeningLayerPlatformWrapper.ListeningUIView()
{
  return objc_opt_self();
}

unint64_t sub_2287C71D0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559BE248;
  if (!qword_2559BE248)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BE250);
    v2[0] = sub_2287C723C();
    v2[1] = MEMORY[0x24BDEEC40];
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559BE248);
  }
  return result;
}

unint64_t sub_2287C723C()
{
  unint64_t result;

  result = qword_2559BE258;
  if (!qword_2559BE258)
  {
    result = MEMORY[0x22E2B5980](&unk_2287D0DAC, &type metadata for ListeningLayerPlatformWrapper);
    atomic_store(result, (unint64_t *)&qword_2559BE258);
  }
  return result;
}

uint64_t _s11ShazamKitUI13ListeningViewVwxx_0()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t _s11ShazamKitUI13ListeningViewVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_BYTE *)(a1 + 73) = *(_BYTE *)(a2 + 73);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t _s11ShazamKitUI13ListeningViewVwca_0(uint64_t a1, uint64_t a2)
{
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
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_BYTE *)(a1 + 73) = *(_BYTE *)(a2 + 73);
  return a1;
}

uint64_t _s11ShazamKitUI13ListeningViewVwta_0(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_BYTE *)(a1 + 73) = *(_BYTE *)(a2 + 73);
  return a1;
}

uint64_t _s11ShazamKitUI13ListeningViewVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 74))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_2287C751C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 72) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 74) = 1;
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
    *(_BYTE *)(result + 74) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ListeningLayerPlatformWrapper()
{
  return &type metadata for ListeningLayerPlatformWrapper;
}

void sub_2287C7584(void *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;

  type metadata accessor for ListeningLayerPlatformWrapper.ListeningUIView();
  v2 = swift_dynamicCastClass();
  if (v2)
  {
    v3 = *(void **)(v2 + OBJC_IVAR____TtCV11ShazamKitUI29ListeningLayerPlatformWrapper15ListeningUIView_listeningLayer);
    v4 = a1;
    v5 = v3;
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE208);
    MEMORY[0x22E2B4FB4](&v10, v6);
    v7 = *(_QWORD *)&v10;
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE210);
    MEMORY[0x22E2B4FB4](&v10);
    v9 = v10;
    MEMORY[0x22E2B4FB4](&v10, v8);
    sub_2287C6F48(v7, v9, v10);

  }
}

id sub_2287C768C()
{
  uint64_t v0;
  id v1;
  objc_class *v2;
  char *v3;
  id v4;
  id v5;
  id v6;
  objc_super v8;

  v1 = objc_msgSend(objc_allocWithZone((Class)SHListeningLayer), sel_initWithIntroAnimation_useCustomCompatibleBackground_, *(unsigned __int8 *)(v0 + 72), *(unsigned __int8 *)(v0 + 73));
  v2 = (objc_class *)type metadata accessor for ListeningLayerPlatformWrapper.ListeningUIView();
  v3 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v3[OBJC_IVAR____TtCV11ShazamKitUI29ListeningLayerPlatformWrapper15ListeningUIView_listeningLayer] = v1;
  v8.receiver = v3;
  v8.super_class = v2;
  v4 = v1;
  v5 = objc_msgSendSuper2(&v8, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v6 = objc_msgSend(v5, sel_layer, v8.receiver, v8.super_class);
  objc_msgSend(v6, sel_addSublayer_, v4);

  return v5;
}

unint64_t sub_2287C776C(uint64_t a1)
{
  unint64_t result;

  result = sub_2287C7790();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2287C7790()
{
  unint64_t result;

  result = qword_2559BE260;
  if (!qword_2559BE260)
  {
    result = MEMORY[0x22E2B5980](&unk_2287D0D00, &type metadata for ListeningLayerPlatformWrapper);
    atomic_store(result, (unint64_t *)&qword_2559BE260);
  }
  return result;
}

uint64_t sub_2287C77D4()
{
  sub_2287C7790();
  return sub_2287CD640();
}

uint64_t sub_2287C7824()
{
  sub_2287C7790();
  return sub_2287CD5EC();
}

void sub_2287C7874()
{
  sub_2287C7790();
  sub_2287CD634();
  __break(1u);
}

uint64_t sub_2287C789C(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  id v4;
  uint64_t v5;

  v2 = v1;
  v4 = objc_allocWithZone(v1);
  v5 = sub_2287CA724(a1);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)((char *)v2 + qword_2559C0840) - 8) + 8))(a1);
  return v5;
}

id sub_2287C78FC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___albumArtContainerViewHeightConstraint;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___albumArtContainerViewHeightConstraint);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___albumArtContainerViewHeightConstraint);
  }
  else
  {
    v4 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtContainerView), sel_heightAnchor);
    v5 = objc_msgSend(v4, sel_constraintEqualToConstant_, 0.0);

    v6 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v5;
    v3 = v5;

    v2 = 0;
  }
  v7 = v2;
  return v3;
}

id sub_2287C79A0(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v3 = *a1;
  v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    v5 = *(id *)(v2 + *a1);
  }
  else
  {
    v6 = objc_msgSend(*(id *)(v2 + *a2), sel_centerYAnchor);
    v7 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtContainerView), sel_centerYAnchor);
    v8 = objc_msgSend(v6, sel_constraintEqualToAnchor_constant_, v7, 391.0);

    v9 = *(void **)(v2 + v3);
    *(_QWORD *)(v2 + v3) = v8;
    v5 = v8;

    v4 = 0;
  }
  v10 = v4;
  return v5;
}

void sub_2287C7A70(double a1, double a2, double a3, double a4)
{
  char *v4;
  objc_class *ObjectType;
  uint64_t v10;
  id v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  objc_super v25;

  ObjectType = (objc_class *)swift_getObjectType();
  v10 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtContainerView;
  v11 = objc_allocWithZone(MEMORY[0x24BEBDB00]);
  v12 = v4;
  *(_QWORD *)&v4[v10] = objc_msgSend(v11, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v13 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtImageView;
  *(_QWORD *)&v12[v13] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v14 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_titleLabel;
  *(_QWORD *)&v12[v14] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v15 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_artistLabel;
  *(_QWORD *)&v12[v15] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v16 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamLogoImageView;
  *(_QWORD *)&v12[v16] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v17 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamCountLabel;
  *(_QWORD *)&v12[v17] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v18 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_trackDetailsStackView;
  *(_QWORD *)&v12[v18] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD978]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v19 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamCountStackView;
  *(_QWORD *)&v12[v19] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD978]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v20 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_appleMusicButton;
  *(_QWORD *)&v12[v20] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD430]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v21 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2559BE3A8));
  v22 = (void *)sub_2287CD5BC();
  v23 = objc_msgSend(v22, sel_view);

  if (v23)
  {
    *(_QWORD *)&v12[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_placeholderArtworkView] = v23;
    *(_QWORD *)&v12[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___albumArtImageViewCenterYConstraint] = 0;
    *(_QWORD *)&v12[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___albumArtContainerViewHeightConstraint] = 0;
    *(_QWORD *)&v12[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___placeholderViewCenterYConstraint] = 0;

    v25.receiver = v12;
    v25.super_class = ObjectType;
    v24 = objc_msgSendSuper2(&v25, sel_initWithFrame_, a1, a2, a3, a4);
    sub_2287C7D28();

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2287C7D28()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  char *v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  void *v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  void *v125;
  _QWORD v127[3];
  char *v128;
  uint64_t v129;
  void *v130;
  id v131;
  char *v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;

  v1 = v0;
  v127[2] = swift_getObjectType();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE3B0);
  MEMORY[0x24BDAC7A8](v2);
  v132 = (char *)v127 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2287CDAB4();
  v129 = *(_QWORD *)(v4 - 8);
  v130 = (void *)v4;
  MEMORY[0x24BDAC7A8](v4);
  v128 = (char *)v127 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2287CDAF0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v139 = (char *)v127 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v9 = *(void **)&v0[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_trackDetailsStackView];
  objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v1, sel_addSubview_, v9);
  v10 = *(void **)&v1[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_titleLabel];
  objc_msgSend(v9, sel_addArrangedSubview_, v10);
  v11 = *(void **)&v1[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_artistLabel];
  objc_msgSend(v9, sel_addArrangedSubview_, v11);
  objc_msgSend(v9, sel_setAxis_, 1);
  objc_msgSend(v9, sel_setDistribution_, 0);
  v137 = v9;
  objc_msgSend(v9, sel_setAlignment_, 0);
  v12 = *(void **)&v1[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtContainerView];
  objc_msgSend(v12, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v1, sel_addSubview_, v12);
  v13 = *(void **)&v1[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtImageView];
  objc_msgSend(v13, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v138 = v12;
  objc_msgSend(v12, sel_addSubview_, v13);
  objc_msgSend(v13, sel__setContinuousCornerRadius_, 24.0);
  objc_msgSend(v13, sel_setClipsToBounds_, 1);
  v14 = objc_msgSend(v13, sel_layer);
  if (qword_2559BD2F0 != -1)
    swift_once();
  v140 = v7;
  v141 = v6;
  v15 = objc_msgSend((id)qword_2559BE278, sel_CGColor);
  objc_msgSend(v14, sel_setBorderColor_, v15);

  v16 = objc_msgSend(v13, sel_layer);
  objc_msgSend(v16, sel_setBorderWidth_, 0.5);

  v17 = objc_msgSend(v13, sel_layer);
  objc_msgSend(v17, sel_setBorderPathIsBounds_, 1);

  if (qword_2559BD270 != -1)
    swift_once();
  v18 = (void *)sub_2287CD9A0();
  objc_msgSend(v13, sel_setAccessibilityIdentifier_, v18);

  objc_msgSend(v10, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v19 = (void *)objc_opt_self();
  v20 = objc_msgSend(v19, sel_systemFontOfSize_weight_, 38.0, *MEMORY[0x24BEBB610]);
  objc_msgSend(v10, sel_setFont_, v20);

  v21 = (void *)objc_opt_self();
  v22 = objc_msgSend(v21, sel_whiteColor);
  objc_msgSend(v10, sel_setTextColor_, v22);

  objc_msgSend(v10, sel_setNumberOfLines_, 2);
  LODWORD(v23) = 1132068864;
  objc_msgSend(v10, sel_setContentCompressionResistancePriority_forAxis_, 0, v23);
  if (qword_2559BD268 != -1)
    swift_once();
  v24 = (void *)sub_2287CD9A0();
  objc_msgSend(v10, sel_setAccessibilityIdentifier_, v24);

  v25 = *(void **)&v1[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_placeholderArtworkView];
  objc_msgSend(v25, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v138, sel_addSubview_, v25);
  objc_msgSend(v25, sel__setContinuousCornerRadius_, 24.0);
  objc_msgSend(v25, sel_setClipsToBounds_, 1);
  if (qword_2559BD278 != -1)
    swift_once();
  v26 = (void *)sub_2287CD9A0();
  objc_msgSend(v25, sel_setAccessibilityIdentifier_, v26);

  v27 = objc_msgSend(v25, sel_layer);
  v28 = objc_msgSend((id)qword_2559BE278, sel_CGColor);
  objc_msgSend(v27, sel_setBorderColor_, v28);

  v29 = objc_msgSend(v25, sel_layer);
  objc_msgSend(v29, sel_setBorderWidth_, 0.5);

  v30 = objc_msgSend(v25, sel_layer);
  objc_msgSend(v30, sel_setBorderPathIsBounds_, 1);

  objc_msgSend(v25, sel_setOverrideUserInterfaceStyle_, 2);
  objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v31 = objc_msgSend(v19, sel_systemFontOfSize_weight_, 34.0, *MEMORY[0x24BEBB608]);
  objc_msgSend(v11, sel_setFont_, v31);

  objc_msgSend(v11, sel_setNumberOfLines_, 1);
  if (qword_2559BD2E0 != -1)
    swift_once();
  objc_msgSend(v11, sel_setTextColor_, qword_2559BE268);
  LODWORD(v32) = 1132068864;
  objc_msgSend(v11, sel_setContentCompressionResistancePriority_forAxis_, 0, v32);
  if (qword_2559BD260 != -1)
    swift_once();
  v136 = v25;
  v33 = (void *)sub_2287CD9A0();
  objc_msgSend(v11, sel_setAccessibilityIdentifier_, v33);

  v34 = *(void **)&v1[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamCountStackView];
  objc_msgSend(v34, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v1, sel_addSubview_, v34);
  v35 = *(void **)&v1[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamLogoImageView];
  objc_msgSend(v34, sel_addArrangedSubview_, v35);
  objc_msgSend(v34, sel_setCustomSpacing_afterView_, v35, 4.0);
  v36 = *(void **)&v1[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamCountLabel];
  objc_msgSend(v34, sel_addArrangedSubview_, v36);
  objc_msgSend(v34, sel_setAxis_, 0);
  objc_msgSend(v34, sel_setDistribution_, 0);
  v131 = v34;
  objc_msgSend(v34, sel_setAlignment_, 0);
  v127[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD7D8);
  v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_2287D0E00;
  *(_QWORD *)(v37 + 32) = objc_msgSend(v21, sel_blackColor);
  *(_QWORD *)(v37 + 40) = objc_msgSend(v21, sel_blackColor);
  if (qword_2559BD2E8 != -1)
    swift_once();
  v38 = (void *)qword_2559BE270;
  *(_QWORD *)(v37 + 48) = qword_2559BE270;
  v142 = v37;
  sub_2287CDA0C();
  sub_2287CA7A0(0, qword_2559BE3B8);
  v39 = v38;
  v40 = (void *)sub_2287CD9F4();
  swift_bridgeObjectRelease();
  v41 = objc_msgSend((id)objc_opt_self(), sel_configurationWithPaletteColors_, v40);

  v42 = v41;
  v43 = (void *)sub_2287CD9A0();
  v44 = (void *)objc_opt_self();
  v45 = objc_msgSend(v44, sel_systemImageNamed_withConfiguration_, v43, v42);

  v135 = v42;
  v133 = v35;
  v134 = v45;
  objc_msgSend(v35, sel_setImage_, v45);
  v46 = objc_msgSend(v19, sel_systemFontOfSize_weight_, 20.0, *MEMORY[0x24BEBB600]);
  objc_msgSend(v36, sel_setFont_, v46);

  objc_msgSend(v36, sel_setAdjustsFontForContentSizeCategory_, 1);
  objc_msgSend(v36, sel_setTextColor_, qword_2559BE270);
  LODWORD(v47) = 1132068864;
  objc_msgSend(v36, sel_setContentCompressionResistancePriority_forAxis_, 0, v47);
  if (qword_2559BD280 != -1)
    swift_once();
  v48 = (void *)sub_2287CD9A0();
  objc_msgSend(v36, sel_setAccessibilityIdentifier_, v48);

  v49 = *(void **)&v1[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_appleMusicButton];
  objc_msgSend(v49, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v50 = (void *)sub_2287CD9A0();
  objc_msgSend(v49, sel_setAccessibilityIdentifier_, v50);

  v51 = (void *)objc_opt_self();
  v52 = objc_msgSend(v51, sel_mainBundle);
  sub_2287CD208();

  v53 = (void *)sub_2287CD9A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v49, sel_setAccessibilityLabel_, v53);

  objc_msgSend(v1, sel_addSubview_, v49);
  v54 = v139;
  sub_2287CDAE4();
  v55 = objc_msgSend(v51, sel_bundleForClass_, swift_getObjCClassFromMetadata());
  v56 = (void *)sub_2287CD9A0();
  v57 = objc_msgSend(v44, sel_imageNamed_inBundle_withConfiguration_, v56, v55, 0);

  sub_2287CDAD8();
  if (qword_2559BD2F8 != -1)
    swift_once();
  v58 = (id)qword_2559BE280;
  sub_2287CDACC();
  (*(void (**)(char *, _QWORD, void *))(v129 + 104))(v128, *MEMORY[0x24BEBD070], v130);
  sub_2287CDAC0();
  v59 = v140;
  v60 = v141;
  v61 = v132;
  (*(void (**)(char *, char *, uint64_t))(v140 + 16))(v132, v54, v141);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v59 + 56))(v61, 0, 1, v60);
  sub_2287CDAFC();
  v132 = (char *)objc_opt_self();
  v62 = swift_allocObject();
  *(_OWORD *)(v62 + 16) = xmmword_2287D0E10;
  v63 = v138;
  v64 = objc_msgSend(v138, sel_leadingAnchor);
  v65 = objc_msgSend(v1, (SEL)&stru_24F13A120.type + 6);
  v66 = objc_msgSend(v64, sel_constraintEqualToAnchor_constant_, v65, 24.0);

  *(_QWORD *)(v62 + 32) = v66;
  *(_QWORD *)(v62 + 40) = sub_2287C78FC();
  v67 = objc_msgSend(v63, sel_widthAnchor);
  v68 = objc_msgSend(v63, sel_heightAnchor);
  v69 = objc_msgSend(v67, sel_constraintEqualToAnchor_, v68);

  *(_QWORD *)(v62 + 48) = v69;
  v70 = objc_msgSend(v63, sel_centerYAnchor);
  v71 = objc_msgSend(v1, (SEL)&selRef_circlePathForRect_ + 4);
  v72 = objc_msgSend(v70, sel_constraintEqualToAnchor_, v71);

  *(_QWORD *)(v62 + 56) = v72;
  v73 = objc_msgSend(v13, sel_centerXAnchor);
  v74 = objc_msgSend(v63, sel_centerXAnchor);
  v75 = objc_msgSend(v73, sel_constraintEqualToAnchor_, v74);

  *(_QWORD *)(v62 + 64) = v75;
  v76 = objc_msgSend(v13, (SEL)&selRef_inOutQuartMediaTimingFunction + 2);
  v77 = objc_msgSend(v63, (SEL)&selRef_inOutQuartMediaTimingFunction + 2);
  v78 = objc_msgSend(v76, sel_constraintEqualToAnchor_, v77);

  *(_QWORD *)(v62 + 72) = v78;
  v79 = objc_msgSend(v13, sel_widthAnchor);
  v80 = objc_msgSend(v63, sel_widthAnchor);
  v81 = objc_msgSend(v79, sel_constraintEqualToAnchor_, v80);

  *(_QWORD *)(v62 + 80) = v81;
  *(_QWORD *)(v62 + 88) = sub_2287C79A0(&OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___albumArtImageViewCenterYConstraint, &OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtImageView);
  v82 = v1;
  v83 = v137;
  v84 = objc_msgSend(v137, sel_leadingAnchor);
  v85 = objc_msgSend(v63, sel_trailingAnchor);
  v86 = objc_msgSend(v84, sel_constraintEqualToAnchor_constant_, v85, 38.0);

  *(_QWORD *)(v62 + 96) = v86;
  v87 = objc_msgSend(v83, sel_trailingAnchor);
  v88 = objc_msgSend(v82, sel_trailingAnchor);
  v89 = objc_msgSend(v87, sel_constraintEqualToAnchor_, v88);

  *(_QWORD *)(v62 + 104) = v89;
  v90 = objc_msgSend(v83, sel_centerYAnchor);
  v91 = objc_msgSend(v82, sel_centerYAnchor);
  v92 = objc_msgSend(v90, sel_constraintEqualToAnchor_, v91);

  *(_QWORD *)(v62 + 112) = v92;
  v93 = objc_msgSend(v49, sel_trailingAnchor);
  v130 = v82;
  v94 = objc_msgSend(v82, sel_trailingAnchor);
  v95 = objc_msgSend(v93, sel_constraintEqualToAnchor_, v94);

  *(_QWORD *)(v62 + 120) = v95;
  v96 = objc_msgSend(v49, sel_widthAnchor);
  v97 = objc_msgSend(v96, sel_constraintEqualToConstant_, 149.0);

  *(_QWORD *)(v62 + 128) = v97;
  v98 = objc_msgSend(v49, sel_heightAnchor);
  v99 = objc_msgSend(v98, sel_constraintEqualToConstant_, 50.0);

  *(_QWORD *)(v62 + 136) = v99;
  v100 = objc_msgSend(v49, sel_bottomAnchor);
  v101 = objc_msgSend(v63, sel_bottomAnchor);
  v102 = objc_msgSend(v100, sel_constraintEqualToAnchor_, v101);

  *(_QWORD *)(v62 + 144) = v102;
  v103 = v131;
  v104 = objc_msgSend(v131, sel_leadingAnchor);
  v105 = objc_msgSend(v83, sel_leadingAnchor);
  v106 = objc_msgSend(v104, (SEL)&selRef_setClipsToBounds_ + 6, v105);

  *(_QWORD *)(v62 + 152) = v106;
  v107 = objc_msgSend(v103, sel_centerYAnchor);
  v108 = objc_msgSend(v49, sel_centerYAnchor);
  v109 = objc_msgSend(v107, (SEL)&selRef_setClipsToBounds_ + 6, v108);

  *(_QWORD *)(v62 + 160) = v109;
  v110 = v133;
  v111 = objc_msgSend(v133, sel_heightAnchor);
  if (qword_2559BD300 != -1)
    swift_once();
  v112 = objc_retainAutoreleasedReturnValue(objc_msgSend(v111, sel_constraintEqualToConstant_, *((double *)&xmmword_2559BE288
                                                                                               + 1)));

  *(_QWORD *)(v62 + 168) = v112;
  v113 = objc_msgSend(v110, sel_widthAnchor);
  v114 = objc_msgSend(v113, sel_constraintEqualToConstant_, *(double *)&xmmword_2559BE288);

  *(_QWORD *)(v62 + 176) = v114;
  v115 = v136;
  v116 = objc_msgSend(v136, sel_centerXAnchor);
  v117 = objc_msgSend(v63, sel_centerXAnchor);
  v118 = objc_msgSend(v116, (SEL)&selRef_setClipsToBounds_ + 6, v117);

  *(_QWORD *)(v62 + 184) = v118;
  v119 = objc_msgSend(v115, sel_heightAnchor);
  v120 = objc_msgSend(v63, sel_heightAnchor);
  v121 = objc_msgSend(v119, (SEL)&selRef_setClipsToBounds_ + 6, v120);

  *(_QWORD *)(v62 + 192) = v121;
  v122 = objc_msgSend(v115, sel_widthAnchor);
  v123 = objc_msgSend(v63, sel_widthAnchor);
  v124 = objc_msgSend(v122, (SEL)&selRef_setClipsToBounds_ + 6, v123);

  *(_QWORD *)(v62 + 200) = v124;
  *(_QWORD *)(v62 + 208) = sub_2287C79A0(&OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___placeholderViewCenterYConstraint, &OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_placeholderArtworkView);
  v142 = v62;
  sub_2287CDA0C();
  sub_2287CA7A0(0, (unint64_t *)&qword_2559BD7E0);
  v125 = (void *)sub_2287CD9F4();
  swift_bridgeObjectRelease();
  objc_msgSend(v132, sel_activateConstraints_, v125);

  return (*(uint64_t (**)(char *, uint64_t))(v140 + 8))(v139, v141);
}

void sub_2287C91F0(void *a1)
{
  char *v1;
  objc_class *ObjectType;
  uint64_t v4;
  id v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  objc_super v20;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtContainerView;
  v5 = objc_allocWithZone(MEMORY[0x24BEBDB00]);
  v6 = v1;
  *(_QWORD *)&v1[v4] = objc_msgSend(v5, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v7 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtImageView;
  *(_QWORD *)&v6[v7] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v8 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_titleLabel;
  *(_QWORD *)&v6[v8] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v9 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_artistLabel;
  *(_QWORD *)&v6[v9] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v10 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamLogoImageView;
  *(_QWORD *)&v6[v10] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v11 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamCountLabel;
  *(_QWORD *)&v6[v11] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v12 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_trackDetailsStackView;
  *(_QWORD *)&v6[v12] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD978]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v13 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamCountStackView;
  *(_QWORD *)&v6[v13] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD978]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v14 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_appleMusicButton;
  *(_QWORD *)&v6[v14] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD430]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v15 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2559BE3A8));
  v16 = (void *)sub_2287CD5BC();
  v17 = objc_msgSend(v16, sel_view);

  if (v17)
  {
    *(_QWORD *)&v6[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_placeholderArtworkView] = v17;
    *(_QWORD *)&v6[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___albumArtImageViewCenterYConstraint] = 0;
    *(_QWORD *)&v6[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___albumArtContainerViewHeightConstraint] = 0;
    *(_QWORD *)&v6[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___placeholderViewCenterYConstraint] = 0;

    v20.receiver = v6;
    v20.super_class = ObjectType;
    v18 = objc_msgSendSuper2(&v20, sel_initWithCoder_, a1);
    if (v18)
    {
      v19 = v18;
      sub_2287C7D28();

    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t type metadata accessor for AmbientMatchUIView()
{
  return objc_opt_self();
}

uint64_t sub_2287C9668()
{
  return swift_initClassMetadata2();
}

void sub_2287C96A8()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  double v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  CGFloat v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  CGAffineTransform v21;
  CGAffineTransform aBlock;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtImageView);
  v2 = objc_msgSend(v1, sel_layer);
  v3 = objc_msgSend((id)objc_opt_self(), sel_blackColor);
  v4 = objc_msgSend(v3, sel_CGColor);

  objc_msgSend(v2, sel_setBackgroundColor_, v4);
  v5 = objc_msgSend(v1, sel_layer);
  LODWORD(v6) = 0;
  objc_msgSend(v5, sel_setOpacity_, v6);

  objc_msgSend(v1, sel_transform);
  CGAffineTransformScale(&v21, &aBlock, 0.9, 0.9);
  aBlock = v21;
  objc_msgSend(v1, sel_setTransform_, &aBlock);
  v7 = sub_2287C79A0(&OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___albumArtImageViewCenterYConstraint, &OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtImageView);
  objc_msgSend(v7, sel_setConstant_, 0.0);

  v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD970]), sel_initWithMass_stiffness_damping_initialVelocity_, 1.0, 120.0, 16.0, 0.0, 0.0);
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB20]), sel_initWithDuration_timingParameters_, v20, 0.0);
  v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  *(_QWORD *)&aBlock.tx = sub_2287CA6F4;
  *(_QWORD *)&aBlock.ty = v9;
  *(_QWORD *)&aBlock.a = MEMORY[0x24BDAC760];
  *(_QWORD *)&aBlock.b = 1107296256;
  *(_QWORD *)&aBlock.c = sub_2287C9EAC;
  *(_QWORD *)&aBlock.d = &block_descriptor_26;
  v10 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v8, sel_addAnimations_, v10);
  _Block_release(v10);
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD970]), sel_initWithMass_stiffness_damping_initialVelocity_, 1.0, 120.0, 20.0, 0.0, 0.0);
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB20]), sel_initWithDuration_timingParameters_, v11, 0.0);
  v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  *(_QWORD *)&aBlock.tx = sub_2287CA6FC;
  *(_QWORD *)&aBlock.ty = v13;
  v14 = MEMORY[0x24BDAC760];
  *(_QWORD *)&aBlock.a = MEMORY[0x24BDAC760];
  *(_QWORD *)&aBlock.b = 1107296256;
  *(_QWORD *)&aBlock.c = sub_2287C9EAC;
  *(_QWORD *)&aBlock.d = &block_descriptor_30;
  v15 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v12, sel_addAnimations_, v15);
  _Block_release(v15);
  v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v17 = objc_allocWithZone(MEMORY[0x24BEBDB20]);
  *(_QWORD *)&aBlock.tx = sub_2287CA71C;
  *(_QWORD *)&aBlock.ty = v16;
  aBlock.a = v14;
  *(_QWORD *)&aBlock.b = 1107296256;
  *(_QWORD *)&aBlock.c = sub_2287C9EAC;
  *(_QWORD *)&aBlock.d = &block_descriptor_34;
  v18 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v19 = objc_msgSend(v17, sel_initWithDuration_curve_animations_, 3, v18, 0.84);
  _Block_release(v18);
  swift_release();
  objc_msgSend(v8, sel_startAnimation);
  objc_msgSend(v12, sel_startAnimationAfterDelay_, 0.16);
  objc_msgSend(v19, sel_startAnimation);

}

void sub_2287C9AC0()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  CGFloat v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char *v14;
  id v15;
  CGAffineTransform v16;
  CGAffineTransform aBlock;

  v1 = *(void **)&v0[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_titleLabel];
  objc_msgSend(v1, sel_transform);
  CGAffineTransformTranslate(&v16, &aBlock, 0.0, 70.0);
  aBlock = v16;
  objc_msgSend(v1, sel_setTransform_, &aBlock);
  v2 = *(void **)&v0[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_artistLabel];
  objc_msgSend(v2, sel_transform);
  CGAffineTransformTranslate(&v16, &aBlock, 0.0, 80.0);
  aBlock = v16;
  objc_msgSend(v2, sel_setTransform_, &aBlock);
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD970]), sel_initWithMass_stiffness_damping_initialVelocity_, 1.0, 120.0, 20.0, 0.0, 0.0);
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB20]), sel_initWithDuration_timingParameters_, v15, 0.0);
  v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  *(_QWORD *)&aBlock.tx = sub_2287CA628;
  *(_QWORD *)&aBlock.ty = v4;
  v5 = MEMORY[0x24BDAC760];
  *(_QWORD *)&aBlock.a = MEMORY[0x24BDAC760];
  *(_QWORD *)&aBlock.b = 1107296256;
  *(_QWORD *)&aBlock.c = sub_2287C9EAC;
  *(_QWORD *)&aBlock.d = &block_descriptor_4;
  v6 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v3, sel_addAnimations_, v6);
  _Block_release(v6);
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD970]), sel_initWithMass_stiffness_damping_initialVelocity_, 1.0, 200.0, 27.0, 0.0, 0.0);
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB20]), sel_initWithDuration_timingParameters_, v7, 0.0);
  v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  *(_QWORD *)&aBlock.tx = sub_2287CA660;
  *(_QWORD *)&aBlock.ty = v9;
  aBlock.a = v5;
  *(_QWORD *)&aBlock.b = 1107296256;
  *(_QWORD *)&aBlock.c = sub_2287C9EAC;
  *(_QWORD *)&aBlock.d = &block_descriptor_4;
  v10 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v8, sel_addAnimations_, v10);
  _Block_release(v10);
  objc_msgSend(v3, sel_startAnimationAfterDelay_, 0.3);
  objc_msgSend(v8, sel_startAnimationAfterDelay_, 0.4);
  v11 = (void *)objc_opt_self();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v0;
  *(_QWORD *)&aBlock.tx = sub_2287CA6A4;
  *(_QWORD *)&aBlock.ty = v12;
  aBlock.a = v5;
  *(_QWORD *)&aBlock.b = 1107296256;
  *(_QWORD *)&aBlock.c = sub_2287C9EAC;
  *(_QWORD *)&aBlock.d = &block_descriptor_10;
  v13 = _Block_copy(&aBlock);
  v14 = v0;
  swift_release();
  objc_msgSend(v11, sel_animateKeyframesWithDuration_delay_options_animations_completion_, 0, v13, 0, 1.25, 0.25);

  _Block_release(v13);
}

void sub_2287C9E54(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = (void *)MEMORY[0x22E2B5AA0](v1);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, sel_layoutIfNeeded);

  }
}

uint64_t sub_2287C9EAC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_2287C9ED8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  double v6;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x22E2B5AA0](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = *(id *)(v2 + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtImageView);

    v5 = objc_msgSend(v4, sel_layer);
    LODWORD(v6) = 1.0;
    objc_msgSend(v5, sel_setOpacity_, v6);

  }
}

void sub_2287C9F70(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[6];

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x22E2B5AA0](v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = *(id *)(v4 + *a2);

    v7[0] = 0x3FF0000000000000;
    v7[1] = 0;
    v7[2] = 0;
    v7[3] = 0x3FF0000000000000;
    v7[4] = 0;
    v7[5] = 0;
    objc_msgSend(v6, sel_setTransform_, v7);

  }
}

void sub_2287C9FF8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  void (*v12)();
  uint64_t v13;

  v0 = (void *)objc_opt_self();
  v1 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v12 = sub_2287CA6AC;
  v13 = v1;
  v2 = MEMORY[0x24BDAC760];
  v8 = MEMORY[0x24BDAC760];
  v9 = 1107296256;
  v10 = sub_2287C9EAC;
  v11 = &block_descriptor_14;
  v3 = _Block_copy(&v8);
  swift_release();
  objc_msgSend(v0, sel_addKeyframeWithRelativeStartTime_relativeDuration_animations_, v3, 0.0, 1.0);
  _Block_release(v3);
  v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v12 = sub_2287CA6CC;
  v13 = v4;
  v8 = v2;
  v9 = 1107296256;
  v10 = sub_2287C9EAC;
  v11 = &block_descriptor_18;
  v5 = _Block_copy(&v8);
  swift_release();
  objc_msgSend(v0, sel_addKeyframeWithRelativeStartTime_relativeDuration_animations_, v5, 0.05, 0.9);
  _Block_release(v5);
  v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v12 = sub_2287CA6EC;
  v13 = v6;
  v8 = v2;
  v9 = 1107296256;
  v10 = sub_2287C9EAC;
  v11 = &block_descriptor_22;
  v7 = _Block_copy(&v8);
  swift_release();
  objc_msgSend(v0, sel_addKeyframeWithRelativeStartTime_relativeDuration_animations_, v7, 0.2, 0.8);
  _Block_release(v7);
}

void sub_2287CA1DC(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x22E2B5AA0](v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = *(id *)(v4 + *a2);

    objc_msgSend(v6, sel_setAlpha_, 1.0);
  }
}

void sub_2287CA254(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x22E2B5AA0](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = *(id *)(v2 + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamCountStackView);

    objc_msgSend(v4, sel_setAlpha_, 1.0);
  }
  swift_beginAccess();
  v5 = MEMORY[0x22E2B5AA0](v1);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = *(id *)(v5 + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_appleMusicButton);

    objc_msgSend(v7, sel_setAlpha_, 1.0);
  }
}

id sub_2287CA324()
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.6, 0.6, 0.6, 1.0);
  qword_2559BE268 = (uint64_t)result;
  return result;
}

id sub_2287CA36C()
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.447058824, 0.447058824, 0.447058824, 0.6);
  qword_2559BE270 = (uint64_t)result;
  return result;
}

void sub_2287CA3B8()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
  v1 = objc_msgSend(v0, sel_colorWithAlphaComponent_, 0.15);

  qword_2559BE278 = (uint64_t)v1;
}

id sub_2287CA424()
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.0980392157, 0.0980392157, 0.0980392157, 1.0);
  qword_2559BE280 = (uint64_t)result;
  return result;
}

__n128 sub_2287CA468()
{
  __n128 result;

  __asm { FMOV            V0.2D, #24.0 }
  xmmword_2559BE288 = (__int128)result;
  return result;
}

uint64_t sub_2287CA47C()
{
  return 1;
}

void *sub_2287CA484(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return sub_2287CA4C4(a1, a2);
}

void *sub_2287CA4C4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  uint64_t v11;

  v4 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v2) + qword_2559C0840);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *))(v5 + 16))((char *)&v11 - v6);
  v7 = (void *)sub_2287CD5B0();
  v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v9 = v7;
  v8(a2, v4);
  if (v7)

  return v7;
}

id sub_2287CA584(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)swift_getObjectType();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id sub_2287CA5D4(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_2287CA584(a3);
}

uint64_t type metadata accessor for SecureHostingController(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SecureHostingController);
}

uint64_t sub_2287CA604()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_2287CA628()
{
  uint64_t v0;

  sub_2287C9F70(v0, &OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_titleLabel);
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

void sub_2287CA660()
{
  uint64_t v0;

  sub_2287C9F70(v0, &OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_artistLabel);
}

uint64_t sub_2287CA680()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_2287CA6A4()
{
  sub_2287C9FF8();
}

void sub_2287CA6AC()
{
  uint64_t v0;

  sub_2287CA1DC(v0, &OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_titleLabel);
}

void sub_2287CA6CC()
{
  uint64_t v0;

  sub_2287CA1DC(v0, &OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_artistLabel);
}

void sub_2287CA6EC()
{
  uint64_t v0;

  sub_2287CA254(v0);
}

void sub_2287CA6F4()
{
  uint64_t v0;

  sub_2287C9E54(v0);
}

void sub_2287CA6FC()
{
  uint64_t v0;

  sub_2287C9F70(v0, &OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtImageView);
}

void sub_2287CA71C()
{
  uint64_t v0;

  sub_2287C9ED8(v0);
}

uint64_t sub_2287CA724(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *))(v1 + 16))((char *)&v4 - v2);
  return sub_2287CD5BC();
}

uint64_t sub_2287CA7A0(uint64_t a1, unint64_t *a2)
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

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x22E2B5914](a1, v6, a5);
}

void sub_2287CA844()
{
  qword_2559C0850 = 0x7472416D75626C61;
  *(_QWORD *)algn_2559C0858 = 0xE800000000000000;
}

void sub_2287CA868()
{
  qword_2559C0860 = 0x656C746974;
  *(_QWORD *)algn_2559C0868 = 0xE500000000000000;
}

void sub_2287CA888()
{
  qword_2559C0870 = 0x656C746974627573;
  *(_QWORD *)algn_2559C0878 = 0xE800000000000000;
}

uint64_t *sub_2287CA8AC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

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
    v7 = sub_2287CD298();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD650);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t sub_2287CA994(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = sub_2287CD298();
  v3 = *(_QWORD *)(v2 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return result;
}

char *sub_2287CA9FC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2287CD298();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD650);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_2287CAAB8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;

  v6 = sub_2287CD298();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD650);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_2287CABC0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2287CD298();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD650);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_2287CAC7C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;

  v6 = sub_2287CD298();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD650);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

uint64_t sub_2287CAD84()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2287CAD90(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD650);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_2287CADD0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2287CADDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD650);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for AlbumArt()
{
  uint64_t result;

  result = qword_2559BE418;
  if (!qword_2559BE418)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2287CAE5C()
{
  unint64_t v0;

  sub_2287BA4F0();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_2287CAED0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2287CAEE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  _QWORD *v13;
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
  id *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v57 = a1;
  v58 = a2;
  v60 = a3;
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE498);
  v3 = MEMORY[0x24BDAC7A8](v56);
  v48 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v49 = (uint64_t)&v47 - v5;
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE4B0);
  MEMORY[0x24BDAC7A8](v61);
  v59 = (uint64_t)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE4B8);
  MEMORY[0x24BDAC7A8](v53);
  v54 = (uint64_t)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE468);
  MEMORY[0x24BDAC7A8](v62);
  v55 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BDD10);
  MEMORY[0x24BDAC7A8](v51);
  v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2287CD4A8();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (uint64_t *)((char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = sub_2287CD838();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v47 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE478);
  v18 = MEMORY[0x24BDAC7A8](v52);
  v20 = (char *)&v47 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v50 = (uint64_t)&v47 - v21;
  v22 = sub_2287CD49C();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (id *)((char *)&v47 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(id *, uint64_t, uint64_t))(v23 + 16))(v25, v57, v22);
  v26 = (*(uint64_t (**)(id *, uint64_t))(v23 + 88))(v25, v22);
  if (v26 == *MEMORY[0x24BDECD30])
  {
    (*(void (**)(id *, uint64_t))(v23 + 96))(v25, v22);
    (*(void (**)(char *, _QWORD, uint64_t))(v15 + 104))(v17, *MEMORY[0x24BDF3FD0], v14);
    v27 = sub_2287CD868();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    v28 = *(_QWORD *)(v58 + *(int *)(type metadata accessor for AlbumArt() + 20));
    v29 = (char *)v13 + *(int *)(v11 + 20);
    v30 = *MEMORY[0x24BDEEB68];
    v31 = sub_2287CD58C();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 104))(v29, v30, v31);
    *v13 = v28;
    v13[1] = v28;
    sub_2287CBAD8((uint64_t)v13, (uint64_t)v10, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
    v32 = v52;
    *(_WORD *)&v10[*(int *)(v51 + 36)] = 256;
    sub_2287B7790((uint64_t)v10, (uint64_t)&v20[*(int *)(v32 + 36)], &qword_2559BDD10);
    *(_QWORD *)v20 = v27;
    *((_QWORD *)v20 + 1) = 0;
    *((_WORD *)v20 + 8) = 1;
    swift_retain();
    sub_2287B741C((uint64_t)v10, &qword_2559BDD10);
    sub_2287CBB1C((uint64_t)v13);
    swift_release();
    v33 = &qword_2559BE478;
    v34 = v50;
    sub_2287BB658((uint64_t)v20, v50, &qword_2559BE478);
    sub_2287B7790(v34, v54, &qword_2559BE478);
    swift_storeEnumTagMultiPayload();
    sub_2287CB944();
    sub_2287CB9E0();
    v35 = (uint64_t)v55;
    sub_2287CD658();
    sub_2287B7790(v35, v59, &qword_2559BE468);
    swift_storeEnumTagMultiPayload();
    sub_2287CB8D8();
    sub_2287CD658();
    swift_release();
    v36 = v35;
LABEL_9:
    sub_2287B741C(v36, &qword_2559BE468);
    return sub_2287B741C(v34, v33);
  }
  v37 = v58;
  v38 = v59;
  if (v26 == *MEMORY[0x24BDECD28])
  {
    (*(void (**)(id *, uint64_t))(v23 + 96))(v25, v22);

LABEL_6:
    if (qword_2559BD298 != -1)
      swift_once();
    v39 = qword_2559C07F8;
    v40 = *(_QWORD *)(v37 + *(int *)(type metadata accessor for AlbumArt() + 20));
    v41 = (char *)v13 + *(int *)(v11 + 20);
    v42 = *MEMORY[0x24BDEEB68];
    v43 = sub_2287CD58C();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 104))(v41, v42, v43);
    *v13 = v40;
    v13[1] = v40;
    sub_2287CBAD8((uint64_t)v13, (uint64_t)v10, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
    *(_WORD *)&v10[*(int *)(v51 + 36)] = 256;
    v44 = (uint64_t)v48;
    sub_2287B7790((uint64_t)v10, (uint64_t)&v48[*(int *)(v56 + 36)], &qword_2559BDD10);
    *(_QWORD *)v44 = v39;
    *(_QWORD *)(v44 + 8) = 0;
    *(_WORD *)(v44 + 16) = 1;
    swift_retain_n();
    sub_2287B741C((uint64_t)v10, &qword_2559BDD10);
    sub_2287CBB1C((uint64_t)v13);
    swift_release();
    v33 = &qword_2559BE498;
    v34 = v49;
    sub_2287BB658(v44, v49, &qword_2559BE498);
    sub_2287B7790(v34, v54, &qword_2559BE498);
    swift_storeEnumTagMultiPayload();
    sub_2287CB944();
    sub_2287CB9E0();
    v45 = (uint64_t)v55;
    sub_2287CD658();
    sub_2287B7790(v45, v38, &qword_2559BE468);
    swift_storeEnumTagMultiPayload();
    sub_2287CB8D8();
    sub_2287CD658();
    v36 = v45;
    goto LABEL_9;
  }
  if (v26 == *MEMORY[0x24BDECD10])
    goto LABEL_6;
  swift_storeEnumTagMultiPayload();
  sub_2287CB8D8();
  sub_2287CD658();
  return (*(uint64_t (**)(id *, uint64_t))(v23 + 8))(v25, v22);
}

uint64_t sub_2287CB618(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD650);
  MEMORY[0x24BDAC7A8](v4);
  sub_2287B7790(v1, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_2559BD650);
  sub_2287CBAD8(v1, (uint64_t)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for AlbumArt);
  v6 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v7 = swift_allocObject();
  sub_2287CB7DC((uint64_t)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE450);
  sub_2287CB86C();
  return sub_2287CD394();
}

uint64_t sub_2287CB748()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AlbumArt() - 8) + 80);
  v2 = (v1 + 16) & ~v1;
  v3 = sub_2287CD298();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v0 + v2, 1, v3))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v2, v3);
  return swift_deallocObject();
}

uint64_t sub_2287CB7DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AlbumArt();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2287CB820@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AlbumArt() - 8) + 80);
  return sub_2287CAEE0(a1, v2 + ((v5 + 16) & ~v5), a2);
}

unint64_t sub_2287CB86C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559BE458;
  if (!qword_2559BE458)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BE450);
    v2[0] = sub_2287CB8D8();
    v2[1] = MEMORY[0x24BDF5138];
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559BE458);
  }
  return result;
}

unint64_t sub_2287CB8D8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559BE460;
  if (!qword_2559BE460)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BE468);
    v2[0] = sub_2287CB944();
    v2[1] = sub_2287CB9E0();
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559BE460);
  }
  return result;
}

unint64_t sub_2287CB944()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559BE470;
  if (!qword_2559BE470)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BE478);
    v2[0] = sub_2287CBA7C(&qword_2559BE480, &qword_2559BE488, MEMORY[0x24BDF40E8]);
    v2[1] = sub_2287B7F94(&qword_2559BDDE0, &qword_2559BDD10, MEMORY[0x24BDEB950]);
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559BE470);
  }
  return result;
}

unint64_t sub_2287CB9E0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559BE490;
  if (!qword_2559BE490)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BE498);
    v2[0] = sub_2287CBA7C(&qword_2559BE4A0, &qword_2559BE4A8, MEMORY[0x24BDF3E20]);
    v2[1] = sub_2287B7F94(&qword_2559BDDE0, &qword_2559BDD10, MEMORY[0x24BDEB950]);
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559BE490);
  }
  return result;
}

uint64_t sub_2287CBA7C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3;
    v7[1] = MEMORY[0x24BDEEC40];
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDED308], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2287CBAD8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2287CBB1C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2287CD4A8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2287CBB58()
{
  return sub_2287B7F94(&qword_2559BE4C0, &qword_2559BE4C8, MEMORY[0x24BDEAF78]);
}

ValueMetadata *type metadata accessor for MusicRecognitionAttribution()
{
  return &type metadata for MusicRecognitionAttribution;
}

uint64_t sub_2287CBB94()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2287CBBA4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t ObjCClassFromMetadata;
  id v7;
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
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t KeyPath;
  uint64_t v35;
  char v36;
  char v37;
  int v38;
  int v39;
  uint64_t v40;
  uint64_t v42;
  int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned __int8 v51;
  uint64_t v52;
  unsigned __int8 v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  _BYTE v57[7];
  char v58;
  int v59;
  __int16 v60;
  char v61;
  _BYTE v62[7];
  char v63;
  _DWORD v64[2];
  char v65;

  v2 = sub_2287CD838();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2559BD2C8 != -1)
    swift_once();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDF3FD0], v2);
  v49 = sub_2287CD868();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_2287CD8F8();
  sub_2287CD424();
  v48 = v50;
  v44 = v51;
  v47 = v52;
  v43 = v53;
  v45 = v55;
  v46 = v54;
  sub_2287CD574();
  type metadata accessor for LocalizationBundle();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v7 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v8 = sub_2287CD754();
  v10 = v9;
  v12 = v11 & 1;
  sub_2287CD6C4();
  v13 = sub_2287CD730();
  v15 = v14;
  v17 = v16;
  swift_release();
  sub_2287B4820(v8, v10, v12);
  swift_bridgeObjectRelease();
  sub_2287CD6D0();
  v18 = sub_2287CD70C();
  v20 = v19;
  v22 = v21 & 1;
  sub_2287B4820(v13, v15, v17 & 1);
  swift_bridgeObjectRelease();
  v64[0] = sub_2287CD664();
  v23 = sub_2287CD724();
  v25 = v24;
  LOBYTE(v15) = v26 & 1;
  sub_2287B4820(v18, v20, v22);
  swift_bridgeObjectRelease();
  sub_2287CD814();
  v27 = sub_2287CD718();
  v29 = v28;
  v31 = v30;
  v33 = v32;
  swift_release();
  sub_2287B4820(v23, v25, v15);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  v35 = swift_getKeyPath();
  v36 = v44;
  v65 = v44;
  v37 = v43;
  v63 = v43;
  v61 = 1;
  v58 = v31 & 1;
  v56 = 0;
  *(_DWORD *)(a1 + 17) = v64[0];
  *(_DWORD *)(a1 + 20) = *(_DWORD *)((char *)v64 + 3);
  *(_DWORD *)(a1 + 33) = *(_DWORD *)v62;
  *(_DWORD *)(a1 + 36) = *(_DWORD *)&v62[3];
  v38 = v59;
  *(_WORD *)(a1 + 70) = v60;
  *(_DWORD *)(a1 + 66) = v38;
  v39 = *(_DWORD *)v57;
  *(_DWORD *)(a1 + 92) = *(_DWORD *)&v57[3];
  *(_DWORD *)(a1 + 89) = v39;
  v40 = v48;
  *(_QWORD *)a1 = v49;
  *(_QWORD *)(a1 + 8) = v40;
  *(_BYTE *)(a1 + 16) = v36;
  *(_QWORD *)(a1 + 24) = v47;
  *(_BYTE *)(a1 + 32) = v37;
  *(_QWORD *)(a1 + 40) = v46;
  *(_QWORD *)(a1 + 48) = v45;
  *(_QWORD *)(a1 + 56) = 0;
  *(_WORD *)(a1 + 64) = 1;
  *(_QWORD *)(a1 + 72) = v27;
  *(_QWORD *)(a1 + 80) = v29;
  *(_BYTE *)(a1 + 88) = v31 & 1;
  *(_QWORD *)(a1 + 96) = v33;
  *(_QWORD *)(a1 + 104) = KeyPath;
  *(_QWORD *)(a1 + 112) = 0x3FE0000000000000;
  *(_QWORD *)(a1 + 120) = v35;
  *(_QWORD *)(a1 + 128) = 2;
  *(_BYTE *)(a1 + 136) = 0;
  swift_retain();
  sub_2287B9A60(v27, v29, v31 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_2287B4820(v27, v29, v31 & 1);
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

double sub_2287CC018@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  double result;
  __int128 v7;
  _OWORD v8[7];
  _OWORD v9[2];
  _BYTE v10[144];

  v2 = sub_2287CD538();
  sub_2287CBBA4((uint64_t)v8);
  *(_OWORD *)&v10[103] = v8[6];
  *(_OWORD *)&v10[87] = v8[5];
  *(_OWORD *)&v10[39] = v8[2];
  *(_OWORD *)&v10[23] = v8[1];
  *(_OWORD *)&v10[119] = v9[0];
  *(_OWORD *)&v10[128] = *(_OWORD *)((char *)v9 + 9);
  *(_OWORD *)&v10[55] = v8[3];
  *(_OWORD *)&v10[71] = v8[4];
  *(_OWORD *)&v10[7] = v8[0];
  v3 = *(_OWORD *)&v10[64];
  *(_OWORD *)(a1 + 97) = *(_OWORD *)&v10[80];
  v4 = *(_OWORD *)&v10[112];
  *(_OWORD *)(a1 + 113) = *(_OWORD *)&v10[96];
  *(_OWORD *)(a1 + 129) = v4;
  *(_OWORD *)(a1 + 145) = *(_OWORD *)&v10[128];
  v5 = *(_OWORD *)v10;
  *(_OWORD *)(a1 + 33) = *(_OWORD *)&v10[16];
  result = *(double *)&v10[32];
  v7 = *(_OWORD *)&v10[48];
  *(_OWORD *)(a1 + 49) = *(_OWORD *)&v10[32];
  *(_OWORD *)(a1 + 65) = v7;
  *(_OWORD *)(a1 + 81) = v3;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_OWORD *)(a1 + 17) = v5;
  return result;
}

uint64_t sub_2287CC108@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2287CD4D8();
  *a1 = v3;
  return result;
}

uint64_t sub_2287CC130()
{
  return sub_2287CD4E4();
}

unint64_t sub_2287CC160()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2559BE4D0;
  if (!qword_2559BE4D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BE4D8);
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDF4498], v1);
    atomic_store(result, (unint64_t *)&qword_2559BE4D0);
  }
  return result;
}

uint64_t sub_2287CC1AC()
{
  uint64_t v0;

  v0 = sub_2287CD328();
  __swift_allocate_value_buffer(v0, qword_2559C0880);
  __swift_project_value_buffer(v0, (uint64_t)qword_2559C0880);
  return sub_2287CD31C();
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

uint64_t sub_2287CC258(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  if (!a2)
    return swift_continuation_throwingResume();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BD5F8);
  swift_allocError();
  *v3 = a2;
  v4 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t static SHLibrary.present()()
{
  return swift_task_switch();
}

uint64_t sub_2287CC2E0()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = (void *)objc_opt_self();
  v0[2] = v0;
  v0[3] = sub_2287CC378;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_2287CC258;
  v3[3] = &block_descriptor_5;
  v3[4] = v2;
  objc_msgSend(v1, sel__presentMediaLibraryWithCompletionHandler_, v3);
  return swift_continuation_await();
}

uint64_t sub_2287CC378()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 120) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2287CC3D8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2287CC3E4()
{
  uint64_t v0;

  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

ValueMetadata *type metadata accessor for MediaLibraryList()
{
  return &type metadata for MediaLibraryList;
}

uint64_t sub_2287CC430()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2287CC440@<X0>(unint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
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
  char *v15;
  char *v16;
  void (*v17)(char *, char *, uint64_t);
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  char *v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  void (*v26)(char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;

  v31 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE528);
  v4 = *(_QWORD *)(v3 - 8);
  v29 = v3;
  v30 = v4;
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v28 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE530);
  v32 = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v28 - v14;
  sub_2287CD3F4();
  sub_2287CC9F8();
  v16 = v15;
  sub_2287CD7B4();
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v28 = sub_2287CDB80();
    swift_bridgeObjectRelease();
  }
  else
  {
    v28 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v33 = a1;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE540);
  sub_2287CD2B0();
  sub_2287B7F94(&qword_2559BE548, &qword_2559BE540, MEMORY[0x24BEE12D8]);
  sub_2287CCA3C();
  sub_2287CCA80();
  sub_2287CD8BC();
  v17 = *(void (**)(char *, char *, uint64_t))(v32 + 16);
  v18 = v15;
  v19 = v10;
  v17(v13, v18, v10);
  v20 = v29;
  v21 = v30;
  v22 = *(void (**)(char *, char *, uint64_t))(v30 + 16);
  v22(v7, v9, v29);
  v23 = v31;
  v17(v31, v13, v19);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE568);
  *(_QWORD *)&v23[*(int *)(v24 + 48)] = v28;
  v22(&v23[*(int *)(v24 + 64)], v7, v20);
  v25 = *(void (**)(char *, uint64_t))(v21 + 8);
  v25(v9, v20);
  v26 = *(void (**)(char *, uint64_t))(v32 + 8);
  v26(v16, v19);
  v25(v7, v20);
  return ((uint64_t (*)(char *, uint64_t))v26)(v13, v19);
}

id sub_2287CC6EC@<X0>(void **a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;

  v2 = *a1;
  *a2 = v2;
  return v2;
}

uint64_t sub_2287CC6F8@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
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
  char *v12;
  uint64_t KeyPath;
  uint64_t *v14;
  _QWORD v16[6];

  v16[1] = a1;
  v2 = sub_2287CD490();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE4E8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE4F0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[4] = *v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE4F8);
  sub_2287B7F94(&qword_2559BE500, &qword_2559BE4F8, MEMORY[0x24BDF5428]);
  sub_2287CD700();
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v12, v9, v6);
  v14 = (uint64_t *)&v12[*(int *)(v10 + 36)];
  *v14 = KeyPath;
  v14[1] = 0x4034000000000000;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_2287CD484();
  sub_2287CC91C();
  sub_2287CD7E4();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_2287CC9B8((uint64_t)v12);
}

uint64_t sub_2287CC8C8@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_2287CC440(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_2287CC8D0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2287CD4F0();
  *a1 = v3;
  return result;
}

uint64_t sub_2287CC8F8()
{
  return sub_2287CD4FC();
}

unint64_t sub_2287CC91C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559BE508;
  if (!qword_2559BE508)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BE4F0);
    v2[0] = sub_2287B7F94(&qword_2559BE510, &qword_2559BE4E8, MEMORY[0x24BDF1A30]);
    v2[1] = sub_2287B7F94(&qword_2559BE518, &qword_2559BE520, MEMORY[0x24BDF1028]);
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559BE508);
  }
  return result;
}

uint64_t sub_2287CC9B8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559BE4F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2287CC9F8()
{
  unint64_t result;

  result = qword_2559BE538;
  if (!qword_2559BE538)
  {
    result = MEMORY[0x22E2B5980](&unk_2287D0F4C, &type metadata for MusicRecognitionAttribution);
    atomic_store(result, (unint64_t *)&qword_2559BE538);
  }
  return result;
}

unint64_t sub_2287CCA3C()
{
  unint64_t result;

  result = qword_2559BE550;
  if (!qword_2559BE550)
  {
    result = MEMORY[0x22E2B5980](&unk_2287D02C4, &type metadata for MediaLibraryItemRow);
    atomic_store(result, (unint64_t *)&qword_2559BE550);
  }
  return result;
}

unint64_t sub_2287CCA80()
{
  unint64_t result;
  unint64_t v1;

  result = qword_2559BE558;
  if (!qword_2559BE558)
  {
    v1 = sub_2287CCAC8();
    result = MEMORY[0x22E2B5980](MEMORY[0x24BDE97B0], v1);
    atomic_store(result, (unint64_t *)&qword_2559BE558);
  }
  return result;
}

unint64_t sub_2287CCAC8()
{
  unint64_t result;

  result = qword_2559BE560;
  if (!qword_2559BE560)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2559BE560);
  }
  return result;
}

uint64_t sub_2287CCB04()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559BE4F0);
  sub_2287CD490();
  sub_2287CC91C();
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for LocalizationBundle()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for AmbientNoMatch()
{
  return &type metadata for AmbientNoMatch;
}

id sub_2287CCB98()
{
  type metadata accessor for AmbientNoMatchUIView();
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

uint64_t sub_2287CCBC0()
{
  sub_2287CCC88();
  return sub_2287CD640();
}

uint64_t sub_2287CCC10()
{
  sub_2287CCC88();
  return sub_2287CD5EC();
}

void sub_2287CCC60()
{
  sub_2287CCC88();
  sub_2287CD634();
  __break(1u);
}

unint64_t sub_2287CCC88()
{
  unint64_t result;

  result = qword_2559BE608;
  if (!qword_2559BE608)
  {
    result = MEMORY[0x22E2B5980](&unk_2287D1114, &type metadata for AmbientNoMatch);
    atomic_store(result, (unint64_t *)&qword_2559BE608);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  BOOL v8;

  if (qword_2559C0788 == -1)
  {
    if (qword_2559C0790)
      return _availability_version_check();
  }
  else
  {
    dispatch_once_f(&qword_2559C0788, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_2559C0790)
      return _availability_version_check();
  }
  if (qword_2559C0780 == -1)
  {
    v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2)
      return 1;
  }
  else
  {
    dispatch_once_f(&qword_2559C0780, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2)
      return 1;
  }
  if (v8)
    return 0;
  if (dword_2559C0774 > a3)
    return 1;
  return dword_2559C0774 >= a3 && dword_2559C0778 >= a4;
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

  v30 = *MEMORY[0x24BDAC8D0];
  v1 = (uint64_t (*)(void))qword_2559C0790;
  if (qword_2559C0790)
    v2 = (_DWORD)result == 0;
  else
    v2 = 0;
  if (!v2)
  {
    if (MEMORY[0x24BDAC970])
    {
      qword_2559C0790 = (uint64_t)MEMORY[0x24BDAC970];
      v1 = MEMORY[0x24BDAC970];
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
                          v14 = MEMORY[0x22E2B5548](v13);
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
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals, &dword_2559C0774, &dword_2559C0778);
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

uint64_t sub_2287CD1B4()
{
  return MEMORY[0x24BDCB070]();
}

uint64_t sub_2287CD1C0()
{
  return MEMORY[0x24BDCB0C0]();
}

uint64_t sub_2287CD1CC()
{
  return MEMORY[0x24BDEAD60]();
}

uint64_t sub_2287CD1D8()
{
  return MEMORY[0x24BDCC2D8]();
}

uint64_t sub_2287CD1E4()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_2287CD1F0()
{
  return MEMORY[0x24BDCC5D8]();
}

uint64_t sub_2287CD1FC()
{
  return MEMORY[0x24BDCC618]();
}

uint64_t sub_2287CD208()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_2287CD214()
{
  return MEMORY[0x24BDCC890]();
}

uint64_t sub_2287CD220()
{
  return MEMORY[0x24BDCC898]();
}

uint64_t sub_2287CD22C()
{
  return MEMORY[0x24BDCD280]();
}

uint64_t sub_2287CD238()
{
  return MEMORY[0x24BDCD288]();
}

uint64_t sub_2287CD244()
{
  return MEMORY[0x24BDCD290]();
}

uint64_t sub_2287CD250()
{
  return MEMORY[0x24BDCD298]();
}

uint64_t sub_2287CD25C()
{
  return MEMORY[0x24BDCD2A8]();
}

uint64_t sub_2287CD268()
{
  return MEMORY[0x24BDCD2B8]();
}

uint64_t sub_2287CD274()
{
  return MEMORY[0x24BDEAD90]();
}

uint64_t sub_2287CD280()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2287CD28C()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_2287CD298()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2287CD2A4()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2287CD2B0()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2287CD2BC()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_2287CD2C8()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_2287CD2D4()
{
  return MEMORY[0x24BEE5C48]();
}

uint64_t sub_2287CD2E0()
{
  return MEMORY[0x24BEE5C50]();
}

uint64_t sub_2287CD2EC()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_2287CD2F8()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_2287CD304()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_2287CD310()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2287CD31C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2287CD328()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2287CD334()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_2287CD340()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_2287CD34C()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_2287CD358()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_2287CD364()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_2287CD370()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_2287CD37C()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_2287CD388()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_2287CD394()
{
  return MEMORY[0x24BDEAF58]();
}

uint64_t sub_2287CD3A0()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_2287CD3AC()
{
  return MEMORY[0x24BDEB2A0]();
}

uint64_t sub_2287CD3B8()
{
  return MEMORY[0x24BDEB2B0]();
}

uint64_t sub_2287CD3C4()
{
  return MEMORY[0x24BDEB5B8]();
}

uint64_t sub_2287CD3D0()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_2287CD3DC()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_2287CD3E8()
{
  return MEMORY[0x24BDEBBC8]();
}

uint64_t sub_2287CD3F4()
{
  return MEMORY[0x24BDEBD70]();
}

uint64_t sub_2287CD400()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_2287CD40C()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_2287CD418()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_2287CD424()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_2287CD430()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_2287CD43C()
{
  return MEMORY[0x24BDEC148]();
}

uint64_t sub_2287CD448()
{
  return MEMORY[0x24BDEC348]();
}

uint64_t sub_2287CD454()
{
  return MEMORY[0x24BDEC358]();
}

uint64_t sub_2287CD460()
{
  return MEMORY[0x24BDEC4E0]();
}

uint64_t sub_2287CD46C()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_2287CD478()
{
  return MEMORY[0x24BDEC9A0]();
}

uint64_t sub_2287CD484()
{
  return MEMORY[0x24BDECA00]();
}

uint64_t sub_2287CD490()
{
  return MEMORY[0x24BDECA08]();
}

uint64_t sub_2287CD49C()
{
  return MEMORY[0x24BDECD38]();
}

uint64_t sub_2287CD4A8()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_2287CD4B4()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_2287CD4C0()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_2287CD4CC()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_2287CD4D8()
{
  return MEMORY[0x24BDEE190]();
}

uint64_t sub_2287CD4E4()
{
  return MEMORY[0x24BDEE198]();
}

uint64_t sub_2287CD4F0()
{
  return MEMORY[0x24BDEE2A0]();
}

uint64_t sub_2287CD4FC()
{
  return MEMORY[0x24BDEE2A8]();
}

uint64_t sub_2287CD508()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_2287CD514()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_2287CD520()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_2287CD52C()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_2287CD538()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_2287CD544()
{
  return MEMORY[0x24BDEE9E8]();
}

uint64_t sub_2287CD550()
{
  return MEMORY[0x24BDEEA28]();
}

uint64_t sub_2287CD55C()
{
  return MEMORY[0x24BDEEA30]();
}

uint64_t sub_2287CD568()
{
  return MEMORY[0x24BDEEA40]();
}

uint64_t sub_2287CD574()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_2287CD580()
{
  return MEMORY[0x24BDEEA60]();
}

uint64_t sub_2287CD58C()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_2287CD598()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_2287CD5A4()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_2287CD5B0()
{
  return MEMORY[0x24BDEF1A0]();
}

uint64_t sub_2287CD5BC()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_2287CD5C8()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_2287CD5D4()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_2287CD5E0()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t sub_2287CD5EC()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_2287CD5F8()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_2287CD604()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_2287CD610()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_2287CD61C()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_2287CD628()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_2287CD634()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_2287CD640()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_2287CD64C()
{
  return MEMORY[0x24BDEF2D8]();
}

uint64_t sub_2287CD658()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_2287CD664()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_2287CD670()
{
  return MEMORY[0x24BDF0848]();
}

uint64_t sub_2287CD67C()
{
  return MEMORY[0x24BDF0850]();
}

uint64_t sub_2287CD688()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_2287CD694()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_2287CD6A0()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_2287CD6AC()
{
  return MEMORY[0x24BDF14E8]();
}

uint64_t sub_2287CD6B8()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_2287CD6C4()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_2287CD6D0()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_2287CD6DC()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_2287CD6E8()
{
  return MEMORY[0x24BDF1840]();
}

uint64_t sub_2287CD6F4()
{
  return MEMORY[0x24BDF19B0]();
}

uint64_t sub_2287CD700()
{
  return MEMORY[0x24BDF1A00]();
}

uint64_t sub_2287CD70C()
{
  return MEMORY[0x24BDF1BE8]();
}

uint64_t sub_2287CD718()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_2287CD724()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_2287CD730()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_2287CD73C()
{
  return MEMORY[0x24BDF1E90]();
}

uint64_t sub_2287CD748()
{
  return MEMORY[0x24BDF1E98]();
}

uint64_t sub_2287CD754()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_2287CD760()
{
  return MEMORY[0x24BDF1FD8]();
}

uint64_t sub_2287CD76C()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_2287CD778()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_2287CD784()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_2287CD790()
{
  return MEMORY[0x24BDF2248]();
}

uint64_t sub_2287CD79C()
{
  return MEMORY[0x24BDF2548]();
}

uint64_t sub_2287CD7A8()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_2287CD7B4()
{
  return MEMORY[0x24BDF29A0]();
}

uint64_t sub_2287CD7C0()
{
  return MEMORY[0x24BDF2E80]();
}

uint64_t sub_2287CD7CC()
{
  return MEMORY[0x24BDF3178]();
}

uint64_t sub_2287CD7D8()
{
  return MEMORY[0x24BDF3768]();
}

uint64_t sub_2287CD7E4()
{
  return MEMORY[0x24BDF3A68]();
}

uint64_t sub_2287CD7F0()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_2287CD7FC()
{
  return MEMORY[0x24BDF3C90]();
}

uint64_t sub_2287CD808()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_2287CD814()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_2287CD820()
{
  return MEMORY[0x24BDF3E88]();
}

uint64_t sub_2287CD82C()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_2287CD838()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_2287CD844()
{
  return MEMORY[0x24BDF4028]();
}

uint64_t sub_2287CD850()
{
  return MEMORY[0x24BDF4048]();
}

uint64_t sub_2287CD85C()
{
  return MEMORY[0x24BDF4070]();
}

uint64_t sub_2287CD868()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_2287CD874()
{
  return MEMORY[0x24BDF4130]();
}

uint64_t sub_2287CD880()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_2287CD88C()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_2287CD898()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_2287CD8A4()
{
  return MEMORY[0x24BDF47E0]();
}

uint64_t sub_2287CD8B0()
{
  return MEMORY[0x24BDF4808]();
}

uint64_t sub_2287CD8BC()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_2287CD8C8()
{
  return MEMORY[0x24BDF4A28]();
}

uint64_t sub_2287CD8D4()
{
  return MEMORY[0x24BDF4BE0]();
}

uint64_t sub_2287CD8E0()
{
  return MEMORY[0x24BDF4C08]();
}

uint64_t sub_2287CD8EC()
{
  return MEMORY[0x24BDF4C28]();
}

uint64_t sub_2287CD8F8()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_2287CD904()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_2287CD910()
{
  return MEMORY[0x24BDF5018]();
}

uint64_t sub_2287CD91C()
{
  return MEMORY[0x24BDF5258]();
}

uint64_t sub_2287CD928()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_2287CD934()
{
  return MEMORY[0x24BDE9798]();
}

uint64_t sub_2287CD940()
{
  return MEMORY[0x24BDE97A0]();
}

uint64_t sub_2287CD94C()
{
  return MEMORY[0x24BDE97A8]();
}

uint64_t sub_2287CD958()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2287CD964()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2287CD970()
{
  return MEMORY[0x24BE90510]();
}

uint64_t sub_2287CD97C()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_2287CD988()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_2287CD994()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2287CD9A0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2287CD9AC()
{
  return MEMORY[0x24BDCF9F0]();
}

uint64_t sub_2287CD9B8()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_2287CD9C4()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_2287CD9D0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2287CD9DC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2287CD9E8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2287CD9F4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2287CDA00()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2287CDA0C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2287CDA18()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2287CDA24()
{
  return MEMORY[0x24BEE6868]();
}

uint64_t sub_2287CDA30()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_2287CDA3C()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_2287CDA48()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_2287CDA54()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2287CDA60()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2287CDA6C()
{
  return MEMORY[0x24BDCFED8]();
}

uint64_t sub_2287CDA78()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2287CDA84()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_2287CDA90()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_2287CDA9C()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2287CDAA8()
{
  return MEMORY[0x24BEE5BD0]();
}

uint64_t sub_2287CDAB4()
{
  return MEMORY[0x24BEBD080]();
}

uint64_t sub_2287CDAC0()
{
  return MEMORY[0x24BEBD088]();
}

uint64_t sub_2287CDACC()
{
  return MEMORY[0x24BEBD128]();
}

uint64_t sub_2287CDAD8()
{
  return MEMORY[0x24BEBD1A8]();
}

uint64_t sub_2287CDAE4()
{
  return MEMORY[0x24BEBD1C8]();
}

uint64_t sub_2287CDAF0()
{
  return MEMORY[0x24BEBD1F8]();
}

uint64_t sub_2287CDAFC()
{
  return MEMORY[0x24BEBD218]();
}

uint64_t sub_2287CDB08()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2287CDB14()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2287CDB20()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2287CDB2C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2287CDB38()
{
  return MEMORY[0x24BEE2578]();
}

uint64_t sub_2287CDB44()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2287CDB50()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2287CDB5C()
{
  return MEMORY[0x24BEE6D68]();
}

uint64_t sub_2287CDB68()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2287CDB74()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2287CDB80()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2287CDB8C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2287CDB98()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2287CDBA4()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2287CDBB0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2287CDBBC()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_2287CDBC8()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2287CDBD4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2287CDBE0()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2287CDBEC()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_2287CDBF8()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_2287CDC04()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2287CDC10()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2287CDC1C()
{
  return MEMORY[0x24BEE4328]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D0](retstr, sx, sy, sz);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x24BDBDAB0](red, green, blue, alpha);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x24BDBDCE0](c, path);
}

void CGContextBeginPath(CGContextRef c)
{
  MEMORY[0x24BDBDD00](c);
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
  MEMORY[0x24BDBDE18](c, *(_QWORD *)&mode);
}

CGRect CGContextGetClipBoundingBox(CGContextRef c)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBDEA0](c);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x24BDBDFB0](c, *(_QWORD *)&mode);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
  MEMORY[0x24BDBEDA8](path, m, clockwise, x, y, radius, startAngle, endAngle);
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDB8](path, m, cp1x, cp1y, cp2x, cp2y, x, y);
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x24BDBEDC0](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x24BDBEDE8](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEF40](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
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

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t SHShazamKitUIServiceInterface()
{
  return MEMORY[0x24BDE9870]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _availability_version_check()
{
  return MEMORY[0x24BDAC970]();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x24BDADEA0](predicate, context, function);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x24BDAE4D8](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x24BDAE530](a1);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
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

void rewind(FILE *a1)
{
  MEMORY[0x24BDAFB98](a1);
}

uint64_t shcore_log_object()
{
  return MEMORY[0x24BE905B8]();
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_taskGroup_wait_next_throwing()
{
  return MEMORY[0x24BEE7218]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

