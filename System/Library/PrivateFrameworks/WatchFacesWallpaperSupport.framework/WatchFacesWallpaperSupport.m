uint64_t initializeBufferWithCopyOfBuffer for WeakPosterRotatingResponder(uint64_t *a1, uint64_t *a2)
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

uint64_t sub_24A26D960(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_24A26D980(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGAffineTransform(uint64_t a1)
{
  sub_24A26E12C(a1, &qword_25791F828);
}

void type metadata accessor for AnimationCurve(uint64_t a1)
{
  sub_24A26E12C(a1, &qword_25791F830);
}

void type metadata accessor for UIInterfaceOrientation(uint64_t a1)
{
  sub_24A26E12C(a1, &qword_25791F838);
}

void type metadata accessor for CGImage(uint64_t a1)
{
  sub_24A26E12C(a1, &qword_25791F840);
}

void type metadata accessor for MTLPixelFormat(uint64_t a1)
{
  sub_24A26E12C(a1, &qword_25791F848);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Keyframe.Progress(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Keyframe.Progress(uint64_t result, int a2, int a3)
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
  sub_24A26E12C(a1, &qword_25791F850);
}

uint64_t sub_24A26DA84(uint64_t a1)
{
  uint64_t result;

  if ((unint64_t)(a1 - 70) > 0x2D)
    goto LABEL_6;
  if (((1 << (a1 - 70)) & 0xC03) != 0)
    return 4;
  if (a1 == 115)
    return 8;
LABEL_6:
  sub_24A293054();
  sub_24A292E74();
  type metadata accessor for MTLPixelFormat(0);
  sub_24A2930C0();
  result = sub_24A2930D8();
  __break(1u);
  return result;
}

_QWORD *sub_24A26DB70@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_24A26DB80(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_24A26DB8C()
{
  return sub_24A26E220(&qword_25791F858, (uint64_t (*)(uint64_t))type metadata accessor for UIInterfaceOrientation, (uint64_t)&unk_24A293AE0);
}

BOOL sub_24A26DBB8(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void sub_24A26DBCC(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_24A26DBD4(uint64_t a1, uint64_t a2)
{
  return sub_24A26DD1C(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_24A26DBE0(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_24A292E14();
  *a2 = 0;
  return result;
}

uint64_t sub_24A26DC54(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_24A292E20();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_24A26DCD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_24A292E2C();
  v2 = sub_24A292E08();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24A26DD10(uint64_t a1, uint64_t a2)
{
  return sub_24A26DD1C(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_24A26DD1C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_24A292E2C();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_24A26DD58()
{
  sub_24A292E2C();
  sub_24A292E50();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A26DD98()
{
  uint64_t v0;

  sub_24A292E2C();
  sub_24A2931C8();
  sub_24A292E50();
  v0 = sub_24A2931E0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24A26DE08()
{
  sub_24A2931C8();
  sub_24A2931D4();
  return sub_24A2931E0();
}

uint64_t sub_24A26DE4C()
{
  return sub_24A2931D4();
}

uint64_t sub_24A26DE74()
{
  sub_24A2931C8();
  sub_24A2931D4();
  return sub_24A2931E0();
}

uint64_t sub_24A26DEB4(uint64_t a1)
{
  MEMORY[0x24BD0C4D4](&unk_24A293D4C, a1);
  return sub_24A292D54();
}

uint64_t sub_24A26DEF0()
{
  MEMORY[0x24BD0C4D4](&unk_24A293D4C);
  return sub_24A292D48();
}

uint64_t sub_24A26DF38(uint64_t a1, uint64_t a2)
{
  sub_24A2931C8();
  MEMORY[0x24BD0C4D4](&unk_24A293D4C, a2);
  sub_24A292D48();
  return sub_24A2931E0();
}

_QWORD *sub_24A26DF90@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_24A26DF9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_24A292E2C();
  v2 = v1;
  if (v0 == sub_24A292E2C() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_24A29315C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_24A26E024(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24BD0C4D4](&unk_24A293D4C, a3);
  return sub_24A292D3C();
}

uint64_t sub_24A26E070@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_24A292E08();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24A26E0B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_24A292E2C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void type metadata accessor for CGColorSpace(uint64_t a1)
{
  sub_24A26E12C(a1, &qword_25791F860);
}

void type metadata accessor for IOSurfacePropertyKey(uint64_t a1)
{
  sub_24A26E12C(a1, &qword_25791F868);
}

void type metadata accessor for CFString(uint64_t a1)
{
  sub_24A26E12C(a1, &qword_25791F870);
}

void type metadata accessor for IOSurfaceRef(uint64_t a1)
{
  sub_24A26E12C(a1, &qword_25791F878);
}

void sub_24A26E12C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24A26E170()
{
  sub_24A26E220(&qword_25791F8A8, (uint64_t (*)(uint64_t))type metadata accessor for IOSurfacePropertyKey, (uint64_t)&unk_24A293D0C);
  sub_24A26E220((unint64_t *)&unk_25791F8B0, (uint64_t (*)(uint64_t))type metadata accessor for IOSurfacePropertyKey, (uint64_t)&unk_24A293C6C);
  return sub_24A29312C();
}

uint64_t sub_24A26E1F4()
{
  return sub_24A26E220(&qword_25791F880, (uint64_t (*)(uint64_t))type metadata accessor for IOSurfacePropertyKey, (uint64_t)&unk_24A293C34);
}

uint64_t sub_24A26E220(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24BD0C4D4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24A26E260()
{
  return sub_24A26E220(&qword_25791F888, (uint64_t (*)(uint64_t))type metadata accessor for IOSurfacePropertyKey, (uint64_t)&unk_24A293C0C);
}

uint64_t sub_24A26E28C()
{
  return sub_24A26E220(&qword_25791F890, (uint64_t (*)(uint64_t))type metadata accessor for IOSurfacePropertyKey, (uint64_t)&unk_24A293C9C);
}

uint64_t sub_24A26E2B8()
{
  return sub_24A26E220((unint64_t *)&qword_25791F898, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_24A293D78);
}

uint64_t sub_24A26E2E4()
{
  return sub_24A26E220(&qword_25791F8A0, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_24A293BE0);
}

void sub_24A26E31C()
{
  qword_257922690 = 0x617A696C61636F4CLL;
  *(_QWORD *)algn_257922698 = 0xEB00000000656C62;
}

uint64_t static String.localized(key:tableSuffix:comment:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;

  if (qword_25791F7B0 != -1)
    swift_once();
  v8 = qword_257922690;
  v9 = *(_QWORD *)algn_257922698;
  v10 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v11 = sub_24A26E434(a1, a2, (uint64_t)v10, v8, v9, a3, a4);

  return v11;
}

uint64_t sub_24A26E434(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;

  if (a7 && sub_24A292E5C() > 0)
  {
    swift_bridgeObjectRetain();
    sub_24A292E74();
    swift_bridgeObjectRetain();
    sub_24A292EBC();
    sub_24A292E68();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  v7 = sub_24A292C1C();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t static String.localized(key:table:comment:)()
{
  id v0;
  uint64_t v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  swift_bridgeObjectRetain();
  v1 = sub_24A292C1C();

  swift_bridgeObjectRelease();
  return v1;
}

uint64_t DisplayLink.delegate.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return MEMORY[0x24BD0C63C](v0 + 16);
}

uint64_t DisplayLink.delegate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 24) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*DisplayLink.delegate.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  v4 = MEMORY[0x24BD0C63C](v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v3[3] = v4;
  v3[4] = v5;
  return sub_24A26E758;
}

void sub_24A26E758(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + 24) = *(_QWORD *)(*(_QWORD *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t DisplayLink.__allocating_init()()
{
  uint64_t v0;
  id v1;
  void *v2;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v0 + 32) = 0;
  v1 = objc_msgSend((id)objc_opt_self(), sel_displayLinkWithTarget_selector_, v0, sel__displayLinkFired);
  v2 = *(void **)(v0 + 32);
  *(_QWORD *)(v0 + 32) = v1;

  return v0;
}

uint64_t DisplayLink.init()()
{
  uint64_t v0;
  id v1;
  void *v2;

  *(_QWORD *)(v0 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v0 + 32) = 0;
  v1 = objc_msgSend((id)objc_opt_self(), sel_displayLinkWithTarget_selector_, v0, sel__displayLinkFired);
  v2 = *(void **)(v0 + 32);
  *(_QWORD *)(v0 + 32) = v1;

  return v0;
}

Swift::Void __swiftcall DisplayLink.add(to:forMode:)(NSRunLoop to, NSRunLoopMode forMode)
{
  sub_24A26E95C((uint64_t)to.super.isa, (uint64_t)forMode, (SEL *)&selRef_addToRunLoop_forMode_);
}

Swift::Void __swiftcall DisplayLink.remove(from:forMode:)(NSRunLoop from, NSRunLoopMode forMode)
{
  sub_24A26E95C((uint64_t)from.super.isa, (uint64_t)forMode, (SEL *)&selRef_removeFromRunLoop_forMode_);
}

id sub_24A26E95C(uint64_t a1, uint64_t a2, SEL *a3)
{
  uint64_t v3;
  id result;

  result = *(id *)(v3 + 32);
  if (result)
    return objc_msgSend(result, *a3, a1, a2);
  __break(1u);
  return result;
}

Swift::Void __swiftcall DisplayLink.invalidate()()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 32);
  if (v1)
    objc_msgSend(v1, sel_invalidate);
  else
    __break(1u);
}

SEL *DisplayLink.timestamp.getter()
{
  return sub_24A26E9B8((SEL *)&selRef_timestamp);
}

SEL *DisplayLink.duration.getter()
{
  return sub_24A26E9B8((SEL *)&selRef_duration);
}

SEL *DisplayLink.targetTimestamp.getter()
{
  return sub_24A26E9B8((SEL *)&selRef_targetTimestamp);
}

SEL *sub_24A26E9B8(SEL *result)
{
  uint64_t v1;

  if (*(_QWORD *)(v1 + 32))
    return (SEL *)objc_msgSend(*(id *)(v1 + 32), *result);
  __break(1u);
  return result;
}

id DisplayLink.isPaused.getter()
{
  uint64_t v0;
  id result;

  result = *(id *)(v0 + 32);
  if (result)
    return objc_msgSend(result, sel_isPaused);
  __break(1u);
  return result;
}

id DisplayLink.isPaused.setter(char a1)
{
  uint64_t v1;
  id result;

  result = *(id *)(v1 + 32);
  if (result)
    return objc_msgSend(result, sel_setPaused_, a1 & 1);
  __break(1u);
  return result;
}

id (*DisplayLink.isPaused.modify(_QWORD *a1))(unsigned __int8 *a1, char a2)
{
  uint64_t v1;
  _BYTE *v2;
  id (*result)(unsigned __int8 *, char);

  *a1 = v1;
  v2 = a1 + 1;
  result = *(id (**)(unsigned __int8 *, char))(v1 + 32);
  if (result)
  {
    *v2 = objc_msgSend(result, sel_isPaused);
    return sub_24A26EA60;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_24A26EA60(unsigned __int8 *a1, char a2)
{
  id result;

  result = *(id *)(*(_QWORD *)a1 + 32);
  if ((a2 & 1) != 0)
  {
    if (result)
      return objc_msgSend(result, sel_setPaused_, a1[8]);
    __break(1u);
  }
  if (result)
    return objc_msgSend(result, sel_setPaused_, a1[8]);
  __break(1u);
  return result;
}

id DisplayLink.preferredFramesPerSecond.getter()
{
  uint64_t v0;
  id result;

  result = *(id *)(v0 + 32);
  if (result)
    return objc_msgSend(result, sel_preferredFramesPerSecond);
  __break(1u);
  return result;
}

id DisplayLink.preferredFramesPerSecond.setter(uint64_t a1)
{
  uint64_t v1;
  id result;

  result = *(id *)(v1 + 32);
  if (result)
    return objc_msgSend(result, sel_setPreferredFramesPerSecond_, a1);
  __break(1u);
  return result;
}

id (*DisplayLink.preferredFramesPerSecond.modify(_QWORD *a1))(_QWORD *a1, char a2)
{
  uint64_t v1;
  id (*result)(_QWORD *, char);

  a1[1] = v1;
  result = *(id (**)(_QWORD *, char))(v1 + 32);
  if (result)
  {
    *a1 = objc_msgSend(result, sel_preferredFramesPerSecond);
    return sub_24A26EB0C;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_24A26EB0C(_QWORD *a1, char a2)
{
  id result;

  result = *(id *)(a1[1] + 32);
  if ((a2 & 1) != 0)
  {
    if (result)
      return objc_msgSend(result, sel_setPreferredFramesPerSecond_, *a1);
    __break(1u);
  }
  if (result)
    return objc_msgSend(result, sel_setPreferredFramesPerSecond_, *a1);
  __break(1u);
  return result;
}

id DisplayLink.preferredFrameRateRange.getter()
{
  uint64_t v0;
  id result;

  result = *(id *)(v0 + 32);
  if (result)
    return objc_msgSend(result, sel_preferredFrameRateRange);
  __break(1u);
  return result;
}

id DisplayLink.preferredFrameRateRange.setter()
{
  uint64_t v0;
  id result;

  result = *(id *)(v0 + 32);
  if (result)
    return objc_msgSend(result, sel_setPreferredFrameRateRange_);
  __break(1u);
  return result;
}

id (*DisplayLink.preferredFrameRateRange.modify(uint64_t a1))(_DWORD *a1, char a2, double a3, double a4, double a5)
{
  uint64_t v1;
  id (*result)(_DWORD *, char, double, double, double);
  int v4;
  int v5;
  int v6;

  *(_QWORD *)a1 = v1;
  result = *(id (**)(_DWORD *, char, double, double, double))(v1 + 32);
  if (result)
  {
    objc_msgSend(result, sel_preferredFrameRateRange);
    *(_DWORD *)(a1 + 8) = v4;
    *(_DWORD *)(a1 + 12) = v5;
    *(_DWORD *)(a1 + 16) = v6;
    return sub_24A26EBC4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_24A26EBC4(_DWORD *a1, char a2, double a3, double a4, double a5)
{
  id result;

  result = *(id *)(*(_QWORD *)a1 + 32);
  if ((a2 & 1) != 0)
  {
    if (result)
    {
LABEL_5:
      LODWORD(a4) = a1[3];
      LODWORD(a5) = a1[4];
      LODWORD(a3) = a1[2];
      return objc_msgSend(result, sel_setPreferredFrameRateRange_, a3, a4, a5);
    }
    __break(1u);
  }
  if (result)
    goto LABEL_5;
  __break(1u);
  return result;
}

uint64_t DisplayLink.deinit()
{
  uint64_t v0;

  sub_24A26EC1C(v0 + 16);

  return v0;
}

uint64_t sub_24A26EC1C(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t DisplayLink.__deallocating_deinit()
{
  uint64_t v0;

  sub_24A26EC1C(v0 + 16);

  return swift_deallocClassInstance();
}

uint64_t sub_24A26EC6C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v3 = *a1;
  v4 = *a1 + 16;
  swift_beginAccess();
  result = MEMORY[0x24BD0C63C](v4);
  v6 = *(_QWORD *)(v3 + 24);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_24A26ECC4(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 24) = v2;
  return swift_unknownObjectWeakAssign();
}

id sub_24A26ED1C@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = *(id *)(*(_QWORD *)a1 + 32);
  if (result)
  {
    result = objc_msgSend(result, sel_isPaused);
    *a2 = (_BYTE)result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_24A26ED58(unsigned __int8 *a1, uint64_t a2)
{
  id result;

  result = *(id *)(*(_QWORD *)a2 + 32);
  if (result)
    return objc_msgSend(result, sel_setPaused_, *a1);
  __break(1u);
  return result;
}

id sub_24A26ED7C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = *(id *)(*(_QWORD *)a1 + 32);
  if (result)
  {
    result = objc_msgSend(result, sel_preferredFramesPerSecond);
    *a2 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_24A26EDB8(_QWORD *a1, uint64_t a2)
{
  id result;

  result = *(id *)(*(_QWORD *)a2 + 32);
  if (result)
    return objc_msgSend(result, sel_setPreferredFramesPerSecond_, *a1);
  __break(1u);
  return result;
}

id sub_24A26EDDC@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  id result;
  int v4;
  int v5;
  int v6;

  result = *(id *)(*(_QWORD *)a1 + 32);
  if (result)
  {
    result = objc_msgSend(result, sel_preferredFrameRateRange);
    *a2 = v4;
    a2[1] = v5;
    a2[2] = v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_24A26EE1C(_DWORD *a1, uint64_t a2, double a3, double a4, double a5)
{
  id result;

  result = *(id *)(*(_QWORD *)a2 + 32);
  if (result)
  {
    LODWORD(a4) = a1[1];
    LODWORD(a5) = a1[2];
    LODWORD(a3) = *a1;
    return objc_msgSend(result, sel_setPreferredFrameRateRange_, a3, a4, a5);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t dispatch thunk of DisplayLinkDelegate.displayLinkFired(displayLink:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t type metadata accessor for DisplayLink()
{
  return objc_opt_self();
}

uint64_t method lookup function for DisplayLink()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DisplayLink.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t PRPosterContents.posterData<A>()@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  uint8_t *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id v45[5];

  v43 = a2;
  v45[4] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 - 8);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v41 - v9;
  v11 = (void *)MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v41 - v12;
  v45[0] = 0;
  v14 = objc_msgSend(v11, sel_loadUserInfoWithError_, v45);
  v15 = v45[0];
  if (v14)
  {
    v16 = v14;
    v17 = (void *)sub_24A292DC0();
    v18 = v15;

    sub_24A292B20();
    swift_allocObject();
    sub_24A292B14();
    v45[3] = (id)__swift_instantiateConcreteTypeFromMangledName(&qword_2544CE7F8);
    v45[0] = v17;
    swift_bridgeObjectRetain();
    sub_24A26F5E8(a1, v45);
    swift_bridgeObjectRelease();
    swift_release();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v45);
    if (qword_2544CE630 != -1)
      swift_once();
    v31 = sub_24A292D78();
    __swift_project_value_buffer(v31, (uint64_t)qword_2544CE7E0);
    v32 = v4;
    v33 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
    v33(v10, v13, a1);
    v34 = sub_24A292D60();
    v35 = sub_24A292F7C();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      v42 = (void *)swift_slowAlloc();
      v45[0] = v42;
      *(_DWORD *)v36 = 136315138;
      v41 = v36 + 4;
      v33(v7, v10, a1);
      v37 = sub_24A292E44();
      v44 = sub_24A26FA2C(v37, v38, (uint64_t *)v45);
      sub_24A292FF4();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v10, a1);
      _os_log_impl(&dword_24A26B000, v34, v35, "Decoded object from userInfo: %s", v36, 0xCu);
      v39 = v42;
      swift_arrayDestroy();
      MEMORY[0x24BD0C57C](v39, -1, -1);
      MEMORY[0x24BD0C57C](v36, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v32 + 8))(v10, a1);
    }

    v4 = v32;
    (*(void (**)(uint64_t, char *, uint64_t))(v32 + 32))(v43, v13, a1);
    v30 = 0;
  }
  else
  {
    v19 = v45[0];
    v20 = (void *)sub_24A292C28();

    swift_willThrow();
    if (qword_2544CE630 != -1)
      swift_once();
    v21 = sub_24A292D78();
    __swift_project_value_buffer(v21, (uint64_t)qword_2544CE7E0);
    v22 = v20;
    v23 = v20;
    v24 = sub_24A292D60();
    v25 = sub_24A292F70();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      v27 = (void *)swift_slowAlloc();
      v45[0] = v27;
      *(_DWORD *)v26 = 136315138;
      swift_getErrorValue();
      v28 = sub_24A29318C();
      v44 = sub_24A26FA2C(v28, v29, (uint64_t *)v45);
      sub_24A292FF4();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_24A26B000, v24, v25, "Could not load userInfo from poster contents: %s", v26, 0xCu);
      v30 = 1;
      swift_arrayDestroy();
      MEMORY[0x24BD0C57C](v27, -1, -1);
      MEMORY[0x24BD0C57C](v26, -1, -1);

    }
    else
    {

      v30 = 1;
    }
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v43, v30, 1, a1);
}

uint64_t sub_24A26F5E8(uint64_t a1, _QWORD *a2)
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v10;
  id v11[2];

  v11[1] = *(id *)MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_self();
  __swift_project_boxed_opaque_existential_0(a2, a2[3]);
  v11[0] = 0;
  v4 = objc_msgSend(v3, sel_dataWithJSONObject_options_error_, sub_24A293150(), 0, v11);
  swift_unknownObjectRelease();
  v5 = v11[0];
  if (v4)
  {
    v6 = sub_24A292C94();
    v8 = v7;

    sub_24A292B08();
    return sub_24A2700DC(v6, v8);
  }
  else
  {
    v10 = v5;
    sub_24A292C28();

    return swift_willThrow();
  }
}

Swift::OpaquePointer_optional __swiftcall Encodable.userInfo()()
{
  Swift::Bool v0;
  void *v1;
  void *v2;
  Swift::OpaquePointer_optional result;

  sub_24A292B44();
  swift_allocObject();
  sub_24A292B38();
  sub_24A26F818();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CE7F8);
  if (swift_dynamicCast())
    v1 = v2;
  else
    v1 = 0;
  result.value._rawValue = v1;
  result.is_nil = v0;
  return result;
}

uint64_t sub_24A26F818()
{
  uint64_t v0;
  uint64_t result;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  result = sub_24A292B2C();
  if (!v0)
  {
    v3 = result;
    v4 = v2;
    v5 = (void *)objc_opt_self();
    v6 = (void *)sub_24A292C88();
    v10[0] = 0;
    v7 = objc_msgSend(v5, sel_JSONObjectWithData_options_error_, v6, 4, v10);

    v8 = v10[0];
    if (v7)
    {
      sub_24A29300C();
      sub_24A2700DC(v3, v4);
      return swift_unknownObjectRelease();
    }
    else
    {
      v9 = v8;
      sub_24A292C28();

      swift_willThrow();
      return sub_24A2700DC(v3, v4);
    }
  }
  return result;
}

uint64_t sub_24A26F940(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_24A26F950(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_24A26F984(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24A26F9A4(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_24A26FA2C(v6, v7, a3);
  v8 = *a1 + 8;
  sub_24A292FF4();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_24A26FA2C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_24A26FAFC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_24A270144((uint64_t)v12, *a3);
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
      sub_24A270144((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24A26FAFC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24A293000();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_24A26FCB4(a5, a6);
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
  v8 = sub_24A293078();
  if (!v8)
  {
    sub_24A2930CC();
    __break(1u);
LABEL_17:
    result = sub_24A293120();
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

uint64_t sub_24A26FCB4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_24A26FD48(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_24A26FF20(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_24A26FF20(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24A26FD48(uint64_t a1, unint64_t a2)
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
      v3 = sub_24A26FEBC(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_24A293060();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_24A2930CC();
      __break(1u);
LABEL_10:
      v2 = sub_24A292E80();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_24A293120();
    __break(1u);
LABEL_14:
    result = sub_24A2930CC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_24A26FEBC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25791FAE8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24A26FF20(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25791FAE8);
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
  result = sub_24A293120();
  __break(1u);
  return result;
}

_BYTE **sub_24A27006C(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD0C4BC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
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

uint64_t sub_24A2700DC(uint64_t a1, unint64_t a2)
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

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_24A270144(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id PRPosterRenderingEnvironment.unlockState.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  double v3;
  double v4;
  double v5;
  BOOL v6;
  id result;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  objc_msgSend(v1, sel_unlockProgress);
  if (v3 < 0.0 || (objc_msgSend(v1, sel_unlockProgress), v4 > 1.0))
  {
    objc_msgSend(v1, sel_unlockProgress);
    v6 = v5 >= 0.0;
    result = objc_msgSend(v1, sel_unlockProgress);
    v9 = v8 < 0.0;
    v10 = 1.0;
    if (v9)
      v10 = 0.0;
    *(_BYTE *)a1 = v6;
    goto LABEL_6;
  }
  objc_msgSend(v1, sel_unlockProgress);
  v12 = v11;
  result = objc_msgSend(v1, sel_unlockProgress);
  v14 = v13;
  if (v12 != 0.0)
  {
    result = objc_msgSend(v1, sel_unlockProgress);
    if (v14 == 1.0)
      *(_BYTE *)a1 = 1;
    else
      *(_BYTE *)a1 = 2;
LABEL_6:
    *(double *)(a1 + 8) = v10;
    return result;
  }
  *(_BYTE *)a1 = 0;
  *(double *)(a1 + 8) = v13;
  return result;
}

id PRPosterRenderingEnvironment.wakeState.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  double v3;
  double v4;
  double v5;
  BOOL v6;
  double v7;
  double v8;
  id result;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  double v16;
  double v17;
  uint64_t v18;

  objc_msgSend(v1, sel_backlightProgress);
  if (v3 >= 0.0)
  {
    objc_msgSend(v1, sel_backlightProgress);
    if (v4 <= 1.0)
    {
      objc_msgSend(v1, sel_backlightProgress);
      if (v11 == 0.0)
      {
        objc_msgSend(v1, sel_linearBacklightProgress);
        v13 = v12;
        result = objc_msgSend(v1, sel_backlightProgress);
        v15 = 1;
      }
      else
      {
        objc_msgSend(v1, sel_backlightProgress);
        v17 = v16;
        objc_msgSend(v1, sel_linearBacklightProgress);
        v13 = v18;
        result = objc_msgSend(v1, sel_backlightProgress);
        if (v17 == 1.0)
        {
          *(_BYTE *)a1 = 0;
          goto LABEL_12;
        }
        v15 = 2;
      }
      *(_BYTE *)a1 = v15;
LABEL_12:
      *(_QWORD *)(a1 + 8) = v13;
      *(_QWORD *)(a1 + 16) = v14;
      return result;
    }
  }
  objc_msgSend(v1, sel_backlightProgress);
  v6 = v5 < 0.0;
  objc_msgSend(v1, sel_backlightProgress);
  if (v7 >= 0.0)
    v8 = 1.0;
  else
    v8 = 0.0;
  result = objc_msgSend(v1, sel_linearBacklightProgress);
  *(_BYTE *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v10;
  *(double *)(a1 + 16) = v8;
  return result;
}

id PRRenderer.isPreview.getter()
{
  return sub_24A2703C8((SEL *)&selRef_isPreview);
}

id PRRenderer.isSnapshot.getter()
{
  return sub_24A2703C8((SEL *)&selRef_isSnapshot);
}

id sub_24A2703C8(SEL *a1)
{
  void *v1;
  id v2;

  v2 = objc_msgSend(objc_msgSend(v1, sel_environment), *a1);
  swift_unknownObjectRelease();
  return v2;
}

uint64_t PRRenderer.wakeState.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  id v3;

  v3 = objc_msgSend(v1, sel_environment);
  PRPosterRenderingEnvironment.wakeState.getter(a1);
  return swift_unknownObjectRelease();
}

uint64_t PRRenderer.unlockState.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  id v3;

  v3 = objc_msgSend(v1, sel_environment);
  PRPosterRenderingEnvironment.unlockState.getter(a1);
  return swift_unknownObjectRelease();
}

id PRRenderer.posterContents.getter()
{
  void *v0;
  id v1;

  v1 = objc_msgSend(objc_msgSend(v0, sel_environment), sel_contents);
  swift_unknownObjectRelease();
  return v1;
}

double PRRenderer.snapshotBounds.getter()
{
  void *v0;
  id v1;
  double v2;
  double v3;

  v1 = objc_msgSend(v0, sel_backgroundView);
  objc_msgSend(v1, sel_bounds);
  v3 = v2;

  return v3;
}

BOOL static TransitionDirection.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t TransitionDirection.hash(into:)()
{
  return sub_24A2931D4();
}

uint64_t TransitionDirection.hashValue.getter()
{
  sub_24A2931C8();
  sub_24A2931D4();
  return sub_24A2931E0();
}

BOOL sub_24A2705EC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24A270600()
{
  sub_24A2931C8();
  sub_24A2931D4();
  return sub_24A2931E0();
}

uint64_t sub_24A270644()
{
  return sub_24A2931D4();
}

uint64_t sub_24A27066C()
{
  sub_24A2931C8();
  sub_24A2931D4();
  return sub_24A2931E0();
}

uint64_t StateTransition.previous.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t StateTransition.current.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 28));
}

uint64_t StateTransition.init(previous:current:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v11)(uint64_t, uint64_t);

  v11 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32);
  v11(a4, a1);
  v9 = a4 + *(int *)(type metadata accessor for StateTransition(0, a3, v7, v8) + 28);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v11)(v9, a2, a3);
}

uint64_t type metadata accessor for StateTransition(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for StateTransition);
}

unint64_t sub_24A270760()
{
  unint64_t result;

  result = qword_25791FAF0[0];
  if (!qword_25791FAF0[0])
  {
    result = MEMORY[0x24BD0C4D4](&protocol conformance descriptor for TransitionDirection, &type metadata for TransitionDirection);
    atomic_store(result, qword_25791FAF0);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TransitionDirection(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TransitionDirection(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A27088C + 4 * byte_24A293E55[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_24A2708C0 + 4 * byte_24A293E50[v4]))();
}

uint64_t sub_24A2708C0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A2708C8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A2708D0);
  return result;
}

uint64_t sub_24A2708DC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A2708E4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24A2708E8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A2708F0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A2708FC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_24A270908(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TransitionDirection()
{
  return &type metadata for TransitionDirection;
}

uint64_t sub_24A270920()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_24A270928()
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

uint64_t *sub_24A270994(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v14;
  void (*v15)(uint64_t *, uint64_t *, uint64_t);

  v4 = a1;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_DWORD *)(v6 + 80);
  v9 = ~v8;
  v10 = v7 + v8;
  v11 = ((v7 + v8) & ~v8) + v7;
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v11 > 0x18)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v14 + ((v8 + 16) & v9));
    swift_retain();
  }
  else
  {
    v15 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16);
    v15(a1, a2, *(_QWORD *)(a3 + 16));
    v15((uint64_t *)(((unint64_t)v4 + v10) & v9), (uint64_t *)(((unint64_t)a2 + v10) & v9), v5);
  }
  return v4;
}

uint64_t sub_24A270A48(unint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v6)(unint64_t, uint64_t);

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v6 = *(uint64_t (**)(unint64_t, uint64_t))(v4 + 8);
  v6(a1, v3);
  return v6((*(_QWORD *)(v4 + 64) + a1 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), v3);
}

unint64_t sub_24A270AB0(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(unint64_t, unint64_t, uint64_t);

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16);
  v7(a1, a2, v5);
  v7((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), v5);
  return a1;
}

unint64_t sub_24A270B1C(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(unint64_t, unint64_t, uint64_t);

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 24);
  v7(a1, a2, v5);
  v7((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), v5);
  return a1;
}

unint64_t sub_24A270B88(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(unint64_t, unint64_t, uint64_t);

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 32);
  v7(a1, a2, v5);
  v7((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), v5);
  return a1;
}

unint64_t sub_24A270BF4(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(unint64_t, unint64_t, uint64_t);

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 40);
  v7(a1, a2, v5);
  v7((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), v5);
  return a1;
}

uint64_t sub_24A270C60(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = a2 - v5;
  if (a2 <= v5)
    goto LABEL_18;
  v7 = ((*(_QWORD *)(v4 + 64) + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))
     + *(_QWORD *)(v4 + 64);
  v8 = 8 * v7;
  if (v7 <= 3)
  {
    v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      v9 = *(_DWORD *)(a1 + v7);
      if (!v9)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_18:
      if (v5)
        return (*(uint64_t (**)(void))(v4 + 48))();
      return 0;
    }
  }
  v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7))
    goto LABEL_18;
LABEL_11:
  v11 = (v9 - 1) << v8;
  if (v7 > 3)
    v11 = 0;
  if (!(_DWORD)v7)
    return v5 + v11 + 1;
  if (v7 > 3)
    LODWORD(v7) = 4;
  return ((uint64_t (*)(void))((char *)&loc_24A270D20 + 4 * byte_24A293E5A[(v7 - 1)]))();
}

void sub_24A270D70(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = ((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
     + *(_QWORD *)(v6 + 64);
  v9 = a3 >= v7;
  v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        v11 = 4u;
      }
      else if (v13 >= 0x100)
      {
        v11 = 2;
      }
      else
      {
        v11 = v13 > 1;
      }
    }
    else
    {
      v11 = 1u;
    }
  }
  else
  {
    v11 = 0;
  }
  if (v7 < a2)
  {
    v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }
        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24BD0C474](a1, v6, a5);
}

__n128 static WakeState.on.getter@<Q0>(uint64_t a1@<X8>)
{
  __n128 result;

  *(_BYTE *)a1 = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(__n128 *)(a1 + 8) = result;
  return result;
}

uint64_t WakeState.ScreenState.hash(into:)()
{
  return sub_24A2931D4();
}

uint64_t WakeState.ScreenState.hashValue.getter()
{
  sub_24A2931C8();
  sub_24A2931D4();
  return sub_24A2931E0();
}

void WakeState.screenState.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

double WakeState.linearProgress.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

double WakeState.backlightProgress.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

BOOL WakeState.isTransitioning.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16) > 0.01 && *(_BYTE *)v0 == 2;
}

BOOL static WakeState.ScreenState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

BOOL WakeState.isOn.getter()
{
  _BYTE *v0;

  return *v0 == 0;
}

BOOL WakeState.isNotOn.getter()
{
  _BYTE *v0;

  return *v0 != 0;
}

BOOL WakeState.isOff.getter()
{
  unsigned __int8 *v0;

  return *v0 == 1;
}

BOOL WakeState.isNotOff.getter()
{
  unsigned __int8 *v0;

  return *v0 != 1;
}

void static WakeState.off.getter(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 1;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
}

uint64_t WakeState.ScreenState.description.getter()
{
  char *v0;

  return qword_24A2940A8[*v0];
}

uint64_t WakeState.description.getter()
{
  sub_24A293054();
  sub_24A292E74();
  sub_24A292E74();
  swift_bridgeObjectRelease();
  sub_24A292E74();
  sub_24A292F40();
  sub_24A292E74();
  swift_bridgeObjectRelease();
  sub_24A292E74();
  sub_24A292F40();
  sub_24A292E74();
  swift_bridgeObjectRelease();
  return 0;
}

BOOL static WakeState.== infix(_:_:)(double *a1, double *a2)
{
  return *(unsigned __int8 *)a1 == *(unsigned __int8 *)a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

unint64_t sub_24A271208()
{
  unint64_t result;

  result = qword_25791FB78;
  if (!qword_25791FB78)
  {
    result = MEMORY[0x24BD0C4D4](&protocol conformance descriptor for WakeState.ScreenState, &type metadata for WakeState.ScreenState);
    atomic_store(result, (unint64_t *)&qword_25791FB78);
  }
  return result;
}

BOOL sub_24A27124C(double *a1, double *a2)
{
  return *(unsigned __int8 *)a1 == *(unsigned __int8 *)a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for WakeState(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && a1[24])
    return (*(_DWORD *)a1 + 254);
  v3 = *a1;
  v4 = v3 >= 3;
  v5 = v3 - 3;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for WakeState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for WakeState()
{
  return &type metadata for WakeState;
}

uint64_t storeEnumTagSinglePayload for WakeState.ScreenState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A27137C + 4 * byte_24A293F65[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_24A2713B0 + 4 * byte_24A293F60[v4]))();
}

uint64_t sub_24A2713B0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A2713B8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A2713C0);
  return result;
}

uint64_t sub_24A2713CC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A2713D4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24A2713D8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A2713E0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WakeState.ScreenState()
{
  return &type metadata for WakeState.ScreenState;
}

uint64_t sub_24A2713FC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocClassInstance();
}

uint64_t sub_24A271420()
{
  uint64_t v0;

  v0 = sub_24A292D78();
  __swift_allocate_value_buffer(v0, qword_25791FB80);
  __swift_project_value_buffer(v0, (uint64_t)qword_25791FB80);
  return sub_24A292D6C();
}

uint64_t static Logger.supression.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_25791F7B8 != -1)
    swift_once();
  v2 = sub_24A292D78();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_25791FB80);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_24A27150C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Weak(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Weak);
}

void sub_24A271558()
{
  qword_25791FB98 = MEMORY[0x24BEE4AF8];
}

uint64_t sub_24A27156C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v24[3];

  v1 = v0;
  if (qword_25791F7F8 != -1)
LABEL_30:
    swift_once();
  v2 = sub_24A292D78();
  __swift_project_value_buffer(v2, (uint64_t)qword_257920710);
  swift_retain_n();
  v3 = sub_24A292D60();
  v4 = sub_24A292F7C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v24[0] = v6;
    *(_DWORD *)v5 = 136315138;
    swift_beginAccess();
    sub_24A272220();
    swift_bridgeObjectRetain();
    v7 = sub_24A292DD8();
    v9 = v8;
    swift_bridgeObjectRelease();
    sub_24A26FA2C(v7, v9, v24);
    sub_24A292FF4();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A26B000, v3, v4, "Invalidating all render extensions: %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD0C57C](v6, -1, -1);
    MEMORY[0x24BD0C57C](v5, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v10 = v1 + 2;
  swift_beginAccess();
  v11 = v1[2];
  v12 = v11 + 64;
  v13 = 1 << *(_BYTE *)(v11 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v11 + 64);
  v16 = (unint64_t)(v13 + 63) >> 6;
  swift_bridgeObjectRetain();
  v17 = 0;
  while (1)
  {
    if (v15)
    {
      v18 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v19 = v18 | (v17 << 6);
      goto LABEL_9;
    }
    v20 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v16)
      goto LABEL_27;
    v21 = *(_QWORD *)(v12 + 8 * v20);
    ++v17;
    if (!v21)
    {
      v17 = v20 + 1;
      if (v20 + 1 >= v16)
        goto LABEL_27;
      v21 = *(_QWORD *)(v12 + 8 * v17);
      if (!v21)
      {
        v17 = v20 + 2;
        if (v20 + 2 >= v16)
          goto LABEL_27;
        v21 = *(_QWORD *)(v12 + 8 * v17);
        if (!v21)
        {
          v17 = v20 + 3;
          if (v20 + 3 >= v16)
            goto LABEL_27;
          v21 = *(_QWORD *)(v12 + 8 * v17);
          if (!v21)
            break;
        }
      }
    }
LABEL_26:
    v15 = (v21 - 1) & v21;
    v19 = __clz(__rbit64(v21)) + (v17 << 6);
LABEL_9:
    v1 = *(id *)(*(_QWORD *)(v11 + 56) + 8 * v19);
    objc_msgSend(objc_msgSend(v1, sel_assertion), sel_invalidate);

    swift_unknownObjectRelease();
  }
  v22 = v20 + 4;
  if (v22 < v16)
  {
    v21 = *(_QWORD *)(v12 + 8 * v22);
    if (!v21)
    {
      while (1)
      {
        v17 = v22 + 1;
        if (__OFADD__(v22, 1))
          goto LABEL_29;
        if (v17 >= v16)
          goto LABEL_27;
        v21 = *(_QWORD *)(v12 + 8 * v17);
        ++v22;
        if (v21)
          goto LABEL_26;
      }
    }
    v17 = v22;
    goto LABEL_26;
  }
LABEL_27:
  swift_release();
  *v10 = MEMORY[0x24BEE4B00];
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A2718E0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 16) = sub_24A27CB48(MEMORY[0x24BEE4AF8]);
  if (qword_25791F7C0 != -1)
    swift_once();
  __swift_instantiateConcreteTypeFromMangledName(qword_25791FCC8);
  swift_allocObject();
  swift_weakInit();
  swift_weakAssign();
  v1 = swift_beginAccess();
  MEMORY[0x24BD0BD00](v1);
  if (*(_QWORD *)((qword_25791FB98 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((qword_25791FB98 & 0xFFFFFFFFFFFFFF8)
                                                                                + 0x18) >> 1)
    sub_24A292EEC();
  sub_24A292EF8();
  sub_24A292EE0();
  swift_endAccess();
  return v0;
}

uint64_t sub_24A2719DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t i;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;

  if (qword_25791F7C0 != -1)
    swift_once();
  swift_beginAccess();
  v0 = qword_25791FB98;
  v6 = MEMORY[0x24BEE4AF8];
  if (!((unint64_t)qword_25791FB98 >> 62))
  {
    v1 = *(_QWORD *)((qword_25791FB98 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v1)
      goto LABEL_5;
LABEL_16:
    swift_bridgeObjectRelease();
    v5 = MEMORY[0x24BEE4AF8];
LABEL_17:
    qword_25791FB98 = v5;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_deallocClassInstance();
  }
  swift_bridgeObjectRetain();
  result = sub_24A2930F0();
  v1 = result;
  if (!result)
    goto LABEL_16;
LABEL_5:
  if (v1 >= 1)
  {
    for (i = 0; i != v1; ++i)
    {
      if ((v0 & 0xC000000000000001) != 0)
        MEMORY[0x24BD0BEA4](i, v0);
      else
        swift_retain();
      Strong = swift_weakLoadStrong();
      swift_release();
      if (Strong)
      {
        sub_24A293084();
        sub_24A2930A8();
        sub_24A2930B4();
        sub_24A293090();
      }
      else
      {
        swift_release();
      }
    }
    swift_bridgeObjectRelease();
    v5 = v6;
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for RendererTokenManager()
{
  return objc_opt_self();
}

uint64_t sub_24A271BB4(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  id v20;
  uint64_t *v21;
  char isUniquelyReferenced_nonNull_native;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28[3];

  v4 = v3;
  sub_24A271ED8(a2, a3);
  if (qword_25791F7F8 != -1)
    swift_once();
  v8 = sub_24A292D78();
  __swift_project_value_buffer(v8, (uint64_t)qword_257920710);
  v9 = a1;
  swift_bridgeObjectRetain_n();
  v10 = v9;
  v11 = sub_24A292D60();
  v12 = sub_24A292F7C();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v25 = swift_slowAlloc();
    v28[0] = v25;
    *(_DWORD *)v13 = 136315394;
    v14 = v10;
    v15 = objc_msgSend(v14, sel_description);
    v26 = v4;
    v16 = sub_24A292E2C();
    v18 = v17;

    sub_24A26FA2C(v16, v18, v28);
    sub_24A292FF4();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_24A26FA2C(a2, a3, v28);
    v4 = v26;
    sub_24A292FF4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24A26B000, v11, v12, "Requesting render extension on %s for reason: %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24BD0C57C](v25, -1, -1);
    MEMORY[0x24BD0C57C](v13, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  v19 = (void *)sub_24A292E08();
  v20 = objc_msgSend(v10, sel_extendRenderingSessionForReason_, v19);

  v21 = (uint64_t *)(v4 + 16);
  swift_beginAccess();
  if (v20)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v27 = *v21;
    *v21 = 0x8000000000000000;
    sub_24A2868FC((uint64_t)v20, a2, a3, isUniquelyReferenced_nonNull_native);
    *v21 = v27;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v23 = (void *)sub_24A272154(a2, a3);
    swift_bridgeObjectRelease();

  }
  return swift_endAccess();
}

void sub_24A271ED8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  char v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17[3];

  swift_beginAccess();
  v5 = *(_QWORD *)(v2 + 16);
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_8;
  swift_bridgeObjectRetain();
  v6 = sub_24A2852AC(a1, a2);
  if ((v7 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_8:
    swift_endAccess();
    return;
  }
  v8 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v6);
  swift_endAccess();
  v9 = v8;
  swift_bridgeObjectRelease();
  if (qword_25791F7F8 != -1)
    swift_once();
  v10 = sub_24A292D78();
  __swift_project_value_buffer(v10, (uint64_t)qword_257920710);
  swift_bridgeObjectRetain_n();
  v11 = sub_24A292D60();
  v12 = sub_24A292F7C();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v17[0] = v14;
    *(_DWORD *)v13 = 136315138;
    swift_bridgeObjectRetain();
    v16 = sub_24A26FA2C(a1, a2, v17);
    sub_24A292FF4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24A26B000, v11, v12, "Invalidating render extension of reason: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD0C57C](v14, -1, -1);
    MEMORY[0x24BD0C57C](v13, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  objc_msgSend(objc_msgSend(v9, sel_assertion, v16, v17[0]), sel_invalidate);
  swift_unknownObjectRelease();
  swift_beginAccess();
  v15 = (void *)sub_24A272154(a1, a2);
  swift_endAccess();

}

uint64_t sub_24A272154(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_24A2852AC(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_24A286D14();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v6);
  sub_24A286570(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_24A272220()
{
  unint64_t result;

  result = qword_25791FCC0;
  if (!qword_25791FCC0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25791FCC0);
  }
  return result;
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

uint64_t sub_24A27229C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  return PosterData.init(lookIdentifier:)(a1, a2, a3, a4, a5);
}

uint64_t PosterData.init(lookIdentifier:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unsigned int (*v20)(char *, uint64_t, uint64_t);
  void (*v21)(char *, uint64_t);
  char *v22;
  uint64_t v23;
  unsigned int v24;
  char *v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  uint64_t v29;
  char *v30;

  v30 = a5;
  v29 = sub_24A292FE8();
  v9 = *(_QWORD *)(v29 - 8);
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v29 - v14;
  v16 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  v19 = sub_24A272738(a1, a2);
  (*(void (**)(uint64_t))(a4 + 40))(v19);
  v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
  if (v20(v15, 1, a3) != 1)
  {
    swift_bridgeObjectRelease();
    v27 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
    v27(v18, v15, a3);
    v25 = v30;
LABEL_6:
    v27(v25, v18, a3);
    v26 = 0;
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v25, v26, 1, a3);
  }
  v21 = *(void (**)(char *, uint64_t))(v9 + 8);
  v22 = v15;
  v23 = v29;
  v21(v22, v29);
  (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(a4 + 48))(a1, a2, a3, a4);
  v24 = v20(v12, 1, a3);
  v25 = v30;
  if (v24 != 1)
  {
    v27 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
    v27(v18, v12, a3);
    goto LABEL_6;
  }
  v21(v12, v23);
  v26 = 1;
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v25, v26, 1, a3);
}

uint64_t sub_24A27248C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return PosterData.init(data:)(a1, a2, a3, a4);
}

uint64_t PosterData.init(data:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v14;

  v8 = sub_24A292FE8();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v14 - v9;
  sub_24A292B20();
  swift_allocObject();
  sub_24A292B14();
  sub_24A292B08();
  sub_24A2700DC(a1, a2);
  swift_release();
  v11 = *(_QWORD *)(a3 - 8);
  v12 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56);
  v12(v10, 0, 1, a3);
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(a4, v10, a3);
  return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v12)(a4, 0, 1, a3);
}

uint64_t sub_24A272620@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  return PosterData.init(string:)(a1, a2);
}

uint64_t PosterData.init(string:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(a2, 1, 1, a1);
}

id PosterData.editingLook.getter(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  (*(void (**)(void))(a2 + 80))();
  (*(void (**)(uint64_t, uint64_t))(a2 + 72))(a1, a2);
  v4 = objc_allocWithZone(MEMORY[0x24BE74DB0]);
  v5 = (void *)sub_24A292E08();
  swift_bridgeObjectRelease();
  v6 = (void *)sub_24A292E08();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v4, sel_initWithIdentifier_displayName_, v5, v6);

  return v7;
}

uint64_t sub_24A272738(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  _BYTE *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v14[2];
  uint64_t v15;
  __int128 v16;
  _QWORD v17[7];

  v17[5] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v16 = a1;
  *((_QWORD *)&v16 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25791FD50);
  if (!swift_dynamicCast())
  {
    v15 = 0;
    memset(v14, 0, sizeof(v14));
    sub_24A273EF8((uint64_t)v14);
    if ((a2 & 0x1000000000000000) != 0)
      goto LABEL_20;
    if ((a2 & 0x2000000000000000) != 0)
    {
      v17[0] = a1;
      v17[1] = a2 & 0xFFFFFFFFFFFFFFLL;
      v4 = (char *)v17 + (HIBYTE(a2) & 0xF);
      v5 = v17;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        v2 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        v3 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        v2 = sub_24A293078();
      }
      if (v2)
        v4 = (_BYTE *)(v2 + v3);
      else
        v4 = 0;
      v5 = (_BYTE *)v2;
    }
    v6 = sub_24A274664(v5, v4);
    v8 = v7;
    if (v7 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(_QWORD *)&v14[0] = v6;
      *((_QWORD *)&v14[0] + 1) = v8;
      return *(_QWORD *)&v14[0];
    }
    if ((a2 & 0x1000000000000000) != 0)
    {
LABEL_20:
      v9 = sub_24A292E80();
    }
    else if ((a2 & 0x2000000000000000) != 0)
    {
      v9 = HIBYTE(a2) & 0xF;
    }
    else
    {
      v9 = a1 & 0xFFFFFFFFFFFFLL;
    }
    *(_QWORD *)&v14[0] = sub_24A2746C8(v9);
    *((_QWORD *)&v14[0] + 1) = v10;
    MEMORY[0x24BDAC7A8]();
    sub_24A273FB0();
    __asm { BR              X12 }
  }
  sub_24A2747D4(v14, (uint64_t)v17);
  __swift_project_boxed_opaque_existential_0(v17, v17[3]);
  sub_24A292C10();
  swift_bridgeObjectRelease();
  v14[0] = v16;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
  return *(_QWORD *)&v14[0];
}

uint64_t dispatch thunk of PosterData.init(lookIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of PosterData.init(data:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of PosterData.init(string:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of static PosterData.fallbackData.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of PosterData.editingLook.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of PosterData.displayName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of PosterData.lookIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t sub_24A272C6C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t *sub_24A272C78(uint64_t *__dst, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;

  v3 = __dst;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = *(_DWORD *)(v4 + 80);
  if (v6 <= 7 && (unint64_t)(v5 + 1) <= 0x18 && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    v10 = *((unsigned __int8 *)a2 + v5);
    if (v10 >= 2)
    {
      if (v5 <= 3)
        v11 = v5;
      else
        v11 = 4;
      __asm { BR              X14 }
    }
    if (v10 == 1)
    {
      (*(void (**)(uint64_t *))(v4 + 16))(__dst);
      *((_BYTE *)v3 + v5) = 1;
    }
    else
    {
      (*(void (**)(uint64_t *))(v4 + 16))(__dst);
      *((_BYTE *)v3 + v5) = 0;
    }
  }
  else
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v9 + ((v6 + 16) & ~v6));
    swift_retain();
  }
  return v3;
}

uint64_t sub_24A272D94(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = *(_QWORD *)(v2 + 64);
  if (*(unsigned __int8 *)(a1 + v3) < 2u)
    return (*(uint64_t (**)(void))(v2 + 8))();
  if (v3 <= 3)
    v4 = v3;
  else
    v4 = 4;
  return ((uint64_t (*)(void))((char *)&loc_24A272DD0 + 4 * byte_24A294185[v4]))();
}

_BYTE *sub_24A272E24(_BYTE *__dst, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
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
    (*(void (**)(_BYTE *))(v4 + 16))(__dst);
    __dst[v5] = 1;
  }
  else
  {
    (*(void (**)(_BYTE *))(v4 + 16))(__dst);
    __dst[v5] = 0;
  }
  return __dst;
}

unsigned __int8 *sub_24A272F04(unsigned __int8 *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;

  if (__dst != __src)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(_QWORD *)(v6 + 64);
    if (__dst[v7] >= 2u)
    {
      if (v7 <= 3)
        v8 = v7;
      else
        v8 = 4;
      __asm { BR              X12 }
    }
    (*(void (**)(unsigned __int8 *, _QWORD))(v6 + 8))(__dst, *(_QWORD *)(a3 + 16));
    v9 = __src[v7];
    if (v9 >= 2)
    {
      if (v7 <= 3)
        v10 = v7;
      else
        v10 = 4;
      __asm { BR              X12 }
    }
    if (v9 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(__dst, __src, v5);
      __dst[v7] = 1;
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(__dst, __src, v5);
      __dst[v7] = 0;
    }
  }
  return __dst;
}

_BYTE *sub_24A27309C(_BYTE *__dst, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
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
    (*(void (**)(_BYTE *))(v4 + 32))(__dst);
    __dst[v5] = 1;
  }
  else
  {
    (*(void (**)(_BYTE *))(v4 + 32))(__dst);
    __dst[v5] = 0;
  }
  return __dst;
}

unsigned __int8 *sub_24A27317C(unsigned __int8 *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;

  if (__dst != __src)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(_QWORD *)(v6 + 64);
    if (__dst[v7] >= 2u)
    {
      if (v7 <= 3)
        v8 = v7;
      else
        v8 = 4;
      __asm { BR              X12 }
    }
    (*(void (**)(unsigned __int8 *, _QWORD))(v6 + 8))(__dst, *(_QWORD *)(a3 + 16));
    v9 = __src[v7];
    if (v9 >= 2)
    {
      if (v7 <= 3)
        v10 = v7;
      else
        v10 = 4;
      __asm { BR              X12 }
    }
    if (v9 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(__dst, __src, v5);
      __dst[v7] = 1;
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(__dst, __src, v5);
      __dst[v7] = 0;
    }
  }
  return __dst;
}

uint64_t sub_24A273314(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  int v6;
  unsigned int v8;
  int v9;
  unsigned int v10;

  if (!a2)
    return 0;
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (a2 < 0xFE)
    goto LABEL_19;
  v4 = v3 + 1;
  v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    v8 = ((a2 + ~(-1 << v5) - 253) >> v5) + 1;
    if (HIWORD(v8))
    {
      v6 = *(_DWORD *)(a1 + v4);
      if (!v6)
        goto LABEL_19;
      goto LABEL_12;
    }
    if (v8 > 0xFF)
    {
      v6 = *(unsigned __int16 *)(a1 + v4);
      if (!*(_WORD *)(a1 + v4))
        goto LABEL_19;
      goto LABEL_12;
    }
    if (v8 < 2)
    {
LABEL_19:
      v10 = *(unsigned __int8 *)(a1 + v3);
      if (v10 >= 3)
        return (v10 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v6 = *(unsigned __int8 *)(a1 + v4);
  if (!*(_BYTE *)(a1 + v4))
    goto LABEL_19;
LABEL_12:
  v9 = (v6 - 1) << v5;
  if (v4 > 3)
    v9 = 0;
  if (!(_DWORD)v4)
    return (v9 + 254);
  if (v4 > 3)
    LODWORD(v4) = 4;
  return ((uint64_t (*)(void))((char *)&loc_24A2733CC + 4 * byte_24A2941A8[(v4 - 1)]))();
}

void sub_24A273418(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  size_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  v6 = v5 + 1;
  if (a3 < 0xFE)
  {
    v7 = 0;
  }
  else if (v6 <= 3)
  {
    v9 = ((a3 + ~(-1 << (8 * v6)) - 253) >> (8 * v6)) + 1;
    if (HIWORD(v9))
    {
      v7 = 4u;
    }
    else if (v9 >= 0x100)
    {
      v7 = 2;
    }
    else
    {
      v7 = v9 > 1;
    }
  }
  else
  {
    v7 = 1u;
  }
  if (a2 <= 0xFD)
    __asm { BR              X11 }
  v8 = a2 - 254;
  if (v6 < 4)
  {
    if ((_DWORD)v5 != -1)
    {
      v10 = v8 & ~(-1 << (8 * v6));
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *a1 = v10;
        *((_BYTE *)a1 + 2) = BYTE2(v10);
      }
      else if ((_DWORD)v6 == 2)
      {
        *a1 = v10;
      }
      else
      {
        *(_BYTE *)a1 = v10;
      }
    }
  }
  else
  {
    bzero(a1, v5 + 1);
    *(_DWORD *)a1 = v8;
  }
  __asm { BR              X10 }
}

uint64_t sub_24A2735B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (*(unsigned __int8 *)(a1 + v2) < 2u)
    return *(unsigned __int8 *)(a1 + v2);
  if (v2 <= 3)
    v3 = v2;
  else
    v3 = 4;
  return ((uint64_t (*)(void))((char *)&loc_24A2735F0 + 4 * byte_24A2941B6[v3]))();
}

uint64_t type metadata accessor for PosterDataComparisonResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PosterDataComparisonResult);
}

uint64_t sub_24A273648()
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

uint64_t *sub_24A2736B0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = *(_DWORD *)(v4 + 80);
  if (v6 <= 7 && (unint64_t)(v5 + 1) <= 0x18 && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    v10 = *((unsigned __int8 *)a2 + v5);
    if (v10 >= 2)
    {
      if (v5 <= 3)
        v11 = v5;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
    *((_BYTE *)v3 + v5) = v10 == 1;
  }
  else
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v9 + ((v6 + 16) & ~v6));
    swift_retain();
  }
  return v3;
}

uint64_t sub_24A2737B4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_24A2737C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  BOOL v8;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
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
  v8 = v6 == 1;
  (*(void (**)(uint64_t))(v4 + 16))(a1);
  *(_BYTE *)(a1 + v5) = v8;
  return a1;
}

uint64_t sub_24A273880(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  BOOL v10;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(_QWORD *)(v6 + 64);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    v8 = *(unsigned __int8 *)(a2 + v7);
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    v10 = v8 == 1;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(a1, a2, v5);
    *(_BYTE *)(a1 + v7) = v10;
  }
  return a1;
}

uint64_t sub_24A273968(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  BOOL v8;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
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
  v8 = v6 == 1;
  (*(void (**)(uint64_t))(v4 + 32))(a1);
  *(_BYTE *)(a1 + v5) = v8;
  return a1;
}

uint64_t sub_24A273A24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  BOOL v10;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(_QWORD *)(v6 + 64);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    v8 = *(unsigned __int8 *)(a2 + v7);
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    v10 = v8 == 1;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(a1, a2, v5);
    *(_BYTE *)(a1 + v7) = v10;
  }
  return a1;
}

uint64_t sub_24A273B0C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  int v6;
  unsigned int v8;
  int v9;
  unsigned int v10;

  if (!a2)
    return 0;
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (a2 < 0xFF)
    goto LABEL_19;
  v4 = v3 + 1;
  v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    v8 = ((a2 + ~(-1 << v5) - 254) >> v5) + 1;
    if (HIWORD(v8))
    {
      v6 = *(_DWORD *)(a1 + v4);
      if (!v6)
        goto LABEL_19;
      goto LABEL_12;
    }
    if (v8 > 0xFF)
    {
      v6 = *(unsigned __int16 *)(a1 + v4);
      if (!*(_WORD *)(a1 + v4))
        goto LABEL_19;
      goto LABEL_12;
    }
    if (v8 < 2)
    {
LABEL_19:
      v10 = *(unsigned __int8 *)(a1 + v3);
      if (v10 >= 2)
        return (v10 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v6 = *(unsigned __int8 *)(a1 + v4);
  if (!*(_BYTE *)(a1 + v4))
    goto LABEL_19;
LABEL_12:
  v9 = (v6 - 1) << v5;
  if (v4 > 3)
    v9 = 0;
  if (!(_DWORD)v4)
    return (v9 + 255);
  if (v4 > 3)
    LODWORD(v4) = 4;
  return ((uint64_t (*)(void))((char *)&loc_24A273BC4 + 4 * byte_24A2941D4[(v4 - 1)]))();
}

void sub_24A273C10(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  size_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  v6 = v5 + 1;
  if (a3 < 0xFF)
  {
    v7 = 0;
  }
  else if (v6 <= 3)
  {
    v9 = ((a3 + ~(-1 << (8 * v6)) - 254) >> (8 * v6)) + 1;
    if (HIWORD(v9))
    {
      v7 = 4u;
    }
    else if (v9 >= 0x100)
    {
      v7 = 2;
    }
    else
    {
      v7 = v9 > 1;
    }
  }
  else
  {
    v7 = 1u;
  }
  if (a2 <= 0xFE)
    __asm { BR              X11 }
  v8 = a2 - 255;
  if (v6 < 4)
  {
    if ((_DWORD)v5 != -1)
    {
      v10 = v8 & ~(-1 << (8 * v6));
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *a1 = v10;
        *((_BYTE *)a1 + 2) = BYTE2(v10);
      }
      else if ((_DWORD)v6 == 2)
      {
        *a1 = v10;
      }
      else
      {
        *(_BYTE *)a1 = v10;
      }
    }
  }
  else
  {
    bzero(a1, v5 + 1);
    *(_DWORD *)a1 = v8;
  }
  __asm { BR              X10 }
}

uint64_t sub_24A273DAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (*(unsigned __int8 *)(a1 + v2) < 2u)
    return *(unsigned __int8 *)(a1 + v2);
  if (v2 <= 3)
    v3 = v2;
  else
    v3 = 4;
  return ((uint64_t (*)(void))((char *)&loc_24A273DE8 + 4 * byte_24A2941E2[v3]))();
}

void sub_24A273E30(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;

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

uint64_t type metadata accessor for PosterDataLoadResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PosterDataLoadResult);
}

uint64_t sub_24A273EF8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791FD58);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24A273F38(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_24A292EB0();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x24BD0BCD0](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

void sub_24A273FB0()
{
  __asm { BR              X11 }
}

_QWORD *sub_24A274010@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *(*v3)(_QWORD **__return_ptr, uint64_t *, char *);
  uint64_t v4;
  _QWORD *result;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;

  v8 = v4;
  LOWORD(v9) = a1;
  BYTE2(v9) = BYTE2(a1);
  HIBYTE(v9) = BYTE3(a1);
  v10 = BYTE4(a1);
  v11 = BYTE5(a1);
  v12 = BYTE6(a1);
  result = v3(&v7, &v8, (char *)&v8 + BYTE6(a1));
  if (!v2)
    result = v7;
  v6 = v9 | ((unint64_t)v10 << 32) | ((unint64_t)v11 << 40) | ((unint64_t)v12 << 48);
  *v1 = v8;
  v1[1] = v6;
  return result;
}

_BYTE *sub_24A2742A0@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
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
    result = (_BYTE *)sub_24A2744AC(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_24A27456C((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_24A2745E4((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

_QWORD *sub_24A274314(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a3)
  {
    result = a1(&v6, a3, a4 - a3);
    if (v4)
      return result;
    return (_QWORD *)v6;
  }
  result = a1(&v6, 0, 0);
  if (!v4)
    return (_QWORD *)v6;
  return result;
}

char *sub_24A274378(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v3;
  char *result;
  char *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = (char *)sub_24A292B68();
  if (!result)
    goto LABEL_12;
  v8 = result;
  result = (char *)sub_24A292B8C();
  v9 = a1 - (_QWORD)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v12 = sub_24A292B80();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3)
    return (char *)v14;
  return result;
}

uint64_t sub_24A274424@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  char v3;
  uint64_t v4;

  if (result)
  {
    swift_bridgeObjectRetain();
    result = sub_24A293060();
    if ((v3 & 1) == 0)
    {
      v4 = result;
      result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24A2744AC(_BYTE *__src, _BYTE *a2)
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

uint64_t sub_24A27456C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_24A292B98();
  swift_allocObject();
  result = sub_24A292B5C();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_24A292C64();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_24A2745E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_24A292B98();
  swift_allocObject();
  result = sub_24A292B5C();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

_BYTE *sub_24A274664(_BYTE *result, _BYTE *a2)
{
  uint64_t v2;

  if (result)
  {
    v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (_BYTE *)sub_24A2744AC(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (_BYTE *)sub_24A27456C((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (_BYTE *)sub_24A2745E4((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_24A2746C8(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      sub_24A292B98();
      swift_allocObject();
      sub_24A292B74();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_24A292C64();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

_QWORD *sub_24A274764@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[2];

  v5 = *(uint64_t **)(v3 + 16);
  v7 = *v5;
  v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  result = sub_24A274314((_QWORD *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_24A2747EC, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_24A2747C0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_24A2700DC(a1, a2);
  return a1;
}

uint64_t sub_24A2747D4(__int128 *a1, uint64_t a2)
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

uint64_t sub_24A2747EC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_24A274424(a1, a2);
}

uint64_t sub_24A274808()
{
  uint64_t v0;

  v0 = sub_24A292D78();
  __swift_allocate_value_buffer(v0, qword_25791FD60);
  __swift_project_value_buffer(v0, (uint64_t)qword_25791FD60);
  return sub_24A292D6C();
}

uint64_t static Logger.rotation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_25791F7C8 != -1)
    swift_once();
  v2 = sub_24A292D78();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_25791FD60);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

id PosterRotatingViewController.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id PosterRotatingViewController.init()()
{
  char *v0;
  id v1;
  id result;
  void *v3;
  id v4;
  objc_super v5;

  *(_QWORD *)&v0[OBJC_IVAR____TtC26WatchFacesWallpaperSupport28PosterRotatingViewController_rotatingResponders] = MEMORY[0x24BEE4AF8];
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for PosterRotatingViewController();
  v1 = objc_msgSendSuper2(&v5, sel_initWithNibName_bundle_, 0, 0);
  result = objc_msgSend(v1, sel_view);
  if (result)
  {
    v3 = result;
    v4 = objc_msgSend((id)objc_opt_self(), sel_blackColor);
    objc_msgSend(v3, sel_setBackgroundColor_, v4);

    return v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for PosterRotatingViewController()
{
  return objc_opt_self();
}

id PosterRotatingViewController.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

uint64_t PosterRotatingViewController.init(coder:)(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;

  v3 = OBJC_IVAR____TtC26WatchFacesWallpaperSupport28PosterRotatingViewController_rotatingResponders;
  v4 = v1;

  *(_QWORD *)&v1[v3] = MEMORY[0x24BEE4AF8];
  type metadata accessor for PosterRotatingViewController();
  swift_deallocPartialClassInstance();
  return 0;
}

id sub_24A274B14(char a1)
{
  void *v1;
  id result;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  double v10;
  objc_super v11;

  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for PosterRotatingViewController();
  objc_msgSendSuper2(&v11, sel_viewWillAppear_, a1 & 1);
  result = objc_msgSend(v1, sel_view);
  if (result)
  {
    v4 = result;
    objc_msgSend(result, sel_bounds);
    v6 = v5;
    v8 = v7;

    v9 = (unint64_t)objc_msgSend(v1, sel_interfaceOrientation) - 2;
    v10 = 0.0;
    if (v9 <= 2)
      v10 = dbl_24A2943B0[v9];
    return (id)sub_24A275650(v6, v8, v10);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_24A274C10(uint64_t a1)
{
  void *v1;
  id result;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  double v10;
  objc_super v11;

  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for PosterRotatingViewController();
  objc_msgSendSuper2(&v11, sel_willMoveToParentViewController_, a1);
  result = objc_msgSend(v1, sel_view);
  if (result)
  {
    v4 = result;
    objc_msgSend(result, sel_bounds);
    v6 = v5;
    v8 = v7;

    v9 = (unint64_t)objc_msgSend(v1, sel_interfaceOrientation) - 2;
    v10 = 0.0;
    if (v9 <= 2)
      v10 = dbl_24A2943B0[v9];
    return (id)sub_24A275650(v6, v8, v10);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_24A274D24(void *a1, long double a2, double a3)
{
  void *v3;
  void *v4;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id result;
  void *v16;
  long double v17;
  long double v18;
  double v19;
  long double v20;
  double v21;
  uint64_t v22;
  double v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  objc_class *v29;
  uint64_t v30;
  objc_super v31;
  long double aBlock;
  uint64_t v33;
  uint64_t (*v34)(uint64_t);
  void *v35;
  void *v36;
  uint64_t v37;

  v4 = v3;
  if (qword_25791F7C8 != -1)
    swift_once();
  v8 = sub_24A292D78();
  __swift_project_value_buffer(v8, (uint64_t)qword_25791FD60);
  v9 = sub_24A292D60();
  v10 = sub_24A292F64();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v30 = v12;
    *(_DWORD *)v11 = 136315138;
    aBlock = a2;
    *(double *)&v33 = a3;
    type metadata accessor for CGSize(0);
    v13 = sub_24A292E44();
    aBlock = COERCE_DOUBLE(sub_24A26FA2C(v13, v14, &v30));
    sub_24A292FF4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A26B000, v9, v10, "viewWillTransition to: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD0C57C](v12, -1, -1);
    MEMORY[0x24BD0C57C](v11, -1, -1);
  }

  result = objc_msgSend(v4, sel_view);
  if (result)
  {
    v16 = result;
    objc_msgSend(result, sel_transform);
    v17 = aBlock;
    v18 = *(double *)&v33;

    v19 = atan2(v18, v17);
    objc_msgSend(a1, sel_targetTransform);
    v20 = v19 - atan2(*(long double *)&v33, aBlock);
    v21 = fmod(v20, 3.14159265);
    if (v20 > 3.14159265)
      v20 = v21;
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = v4;
    *(long double *)(v22 + 24) = a2;
    *(double *)(v22 + 32) = a3;
    *(long double *)(v22 + 40) = v20;
    v36 = sub_24A276524;
    v37 = v22;
    v23 = MEMORY[0x24BDAC760];
    aBlock = MEMORY[0x24BDAC760];
    v33 = 1107296256;
    v34 = sub_24A275124;
    v35 = &block_descriptor;
    v24 = _Block_copy(&aBlock);
    v25 = v4;
    swift_release();
    v26 = swift_allocObject();
    *(_QWORD *)(v26 + 16) = v25;
    *(long double *)(v26 + 24) = a2;
    *(double *)(v26 + 32) = a3;
    *(long double *)(v26 + 40) = v20;
    v36 = sub_24A27654C;
    v37 = v26;
    aBlock = v23;
    v33 = 1107296256;
    v34 = sub_24A275124;
    v35 = &block_descriptor_6;
    v27 = _Block_copy(&aBlock);
    v28 = v25;
    swift_release();
    objc_msgSend(a1, sel_animateAlongsideTransition_completion_, v24, v27);
    _Block_release(v27);
    _Block_release(v24);
    v29 = (objc_class *)type metadata accessor for PosterRotatingViewController();
    v31.receiver = v28;
    v31.super_class = v29;
    return objc_msgSendSuper2(&v31, sel_viewWillTransitionToSize_withTransitionCoordinator_, a1, (double)a2, a3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24A275074(void *a1, double a2, double a3, double a4)
{
  double v8;
  double v9;
  id v10;
  __int128 v12;

  objc_msgSend(a1, sel_transitionDuration);
  v9 = v8;
  v10 = objc_msgSend(a1, sel_completionCurve);
  objc_msgSend(a1, sel_targetTransform);
  return sub_24A275A1C((uint64_t)v10, (uint64_t *)&v12, a2, a3, a4, v9);
}

uint64_t sub_24A275124(uint64_t a1)
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

double static PosterRotatingViewController.rotation(forOrientation:)(uint64_t a1)
{
  double result;

  result = 0.0;
  if ((unint64_t)(a1 - 2) <= 2)
    return dbl_24A2943B0[a1 - 2];
  return result;
}

uint64_t sub_24A2751F8(uint64_t a1, unint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t *v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v25;
  unint64_t v26;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  _BYTE v33[16];
  _QWORD *v34;
  uint64_t v35;
  unint64_t v36;

  if (qword_25791F7C8 != -1)
    goto LABEL_23;
  while (1)
  {
    v5 = sub_24A292D78();
    __swift_project_value_buffer(v5, (uint64_t)qword_25791FD60);
    swift_unknownObjectRetain_n();
    v6 = v2;
    v7 = sub_24A292D60();
    v8 = sub_24A292F64();
    v30 = a2;
    if (os_log_type_enabled(v7, v8))
    {
      v9 = swift_slowAlloc();
      v28 = swift_slowAlloc();
      v31 = v28;
      *(_DWORD *)v9 = 136315394;
      v35 = a1;
      v36 = a2;
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25791FD80);
      v10 = sub_24A292E44();
      v29 = a1;
      v35 = sub_24A26FA2C(v10, v11, &v31);
      sub_24A292FF4();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v9 + 12) = 2080;
      v12 = v6;
      v13 = objc_msgSend(v12, sel_description);
      v14 = sub_24A292E2C();
      v16 = v15;

      v35 = sub_24A26FA2C(v14, v16, &v31);
      sub_24A292FF4();

      a1 = v29;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24A26B000, v7, v8, "Adding responder %s to rotatingViewController: %s", (uint8_t *)v9, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24BD0C57C](v28, -1, -1);
      MEMORY[0x24BD0C57C](v9, -1, -1);

    }
    else
    {

      swift_unknownObjectRelease_n();
    }
    v17 = (_QWORD *)((char *)v6
                   + OBJC_IVAR____TtC26WatchFacesWallpaperSupport28PosterRotatingViewController_rotatingResponders);
    swift_beginAccess();
    v18 = (_QWORD *)*v17;
    a2 = MEMORY[0x24BEE4AF8];
    v34 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v19 = v18[2];
    swift_bridgeObjectRetain();
    if (!v19)
      break;
    v20 = 0;
    v21 = (uint64_t)(v18 + 4);
    v2 = (_QWORD *)MEMORY[0x24BEE4AF8];
    while (v20 < v18[2])
    {
      sub_24A2766A8(v21, (uint64_t)&v31);
      a2 = MEMORY[0x24BD0C63C](&v31);
      swift_unknownObjectRelease();
      if (a2)
      {
        sub_24A2766E0((uint64_t)&v31, (uint64_t)v33);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_24A276718(0, v2[2] + 1, 1);
        v2 = v34;
        a2 = v34[2];
        v22 = v34[3];
        if (a2 >= v22 >> 1)
        {
          sub_24A276718(v22 > 1, a2 + 1, 1);
          v2 = v34;
        }
        v2[2] = a2 + 1;
        sub_24A2766E0((uint64_t)v33, (uint64_t)&v2[2 * a2 + 4]);
      }
      else
      {
        sub_24A26EC1C((uint64_t)&v31);
      }
      ++v20;
      v21 += 16;
      if (v19 == v20)
      {
        a2 = (unint64_t)v34;
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_23:
    swift_once();
  }
LABEL_17:
  swift_bridgeObjectRelease();
  *v17 = a2;
  swift_bridgeObjectRelease();
  v32 = 0;
  swift_unknownObjectWeakInit();
  v32 = v30;
  swift_unknownObjectWeakAssign();
  sub_24A2766E0((uint64_t)&v31, (uint64_t)v33);
  swift_beginAccess();
  v23 = (_QWORD *)*v17;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v17 = (unint64_t)v23;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v23 = sub_24A276578(0, v23[2] + 1, 1, (unint64_t)v23);
    *v17 = (unint64_t)v23;
  }
  v26 = v23[2];
  v25 = v23[3];
  if (v26 >= v25 >> 1)
  {
    v23 = sub_24A276578((_QWORD *)(v25 > 1), v26 + 1, 1, (unint64_t)v23);
    *v17 = (unint64_t)v23;
  }
  v23[2] = v26 + 1;
  sub_24A2766E0((uint64_t)v33, (uint64_t)&v23[2 * v26 + 4]);
  return swift_endAccess();
}

uint64_t sub_24A275650(double a1, double a2, double a3)
{
  char *v3;
  char *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t result;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t ObjectType;
  char *v29;
  uint64_t v30;
  int v31;
  uint64_t v32[2];
  double v33;
  double v34;

  v4 = v3;
  v8 = sub_24A292D78();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = objc_msgSend(v4, sel_interfaceOrientation);
  if ((unint64_t)v12 <= 1)
    v13 = 1;
  else
    v13 = (uint64_t)v12;
  if (qword_25791F7C8 != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v8, (uint64_t)qword_25791FD60);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v14, v8);
  v15 = sub_24A292D60();
  v16 = sub_24A292F64();
  if (os_log_type_enabled(v15, (os_log_type_t)v16))
  {
    v31 = v16;
    v29 = v4;
    v17 = swift_slowAlloc();
    v30 = swift_slowAlloc();
    v32[0] = v30;
    *(_DWORD *)v17 = 136315650;
    v33 = a1;
    v34 = a2;
    type metadata accessor for CGSize(0);
    v18 = sub_24A292E44();
    v33 = COERCE_DOUBLE(sub_24A26FA2C(v18, v19, v32));
    sub_24A292FF4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2048;
    v33 = a3;
    sub_24A292FF4();
    *(_WORD *)(v17 + 22) = 2080;
    v20 = 0xD000000000000014;
    v21 = 0x800000024A2984D0;
    v4 = v29;
    switch(v13)
    {
      case 1:
        v21 = 0xE800000000000000;
        v20 = 0x7469617274726F50;
        break;
      case 2:
        break;
      case 3:
        v21 = 0xEF74686769522065;
        goto LABEL_12;
      case 4:
        v21 = 0xEE007466654C2065;
LABEL_12:
        v20 = 0x70616373646E614CLL;
        break;
      default:
        v21 = 0x800000024A2984B0;
        v4 = v29;
        break;
    }
    v33 = COERCE_DOUBLE(sub_24A26FA2C(v20, v21, v32));
    sub_24A292FF4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A26B000, v15, (os_log_type_t)v31, "Notifying rotating views apply size: %s rotation: %f orientation: %s", (uint8_t *)v17, 0x20u);
    v22 = v30;
    swift_arrayDestroy();
    MEMORY[0x24BD0C57C](v22, -1, -1);
    MEMORY[0x24BD0C57C](v17, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v23 = &v4[OBJC_IVAR____TtC26WatchFacesWallpaperSupport28PosterRotatingViewController_rotatingResponders];
  result = swift_beginAccess();
  v25 = *(_QWORD *)(*(_QWORD *)v23 + 16);
  if (v25)
  {
    v26 = *(_QWORD *)v23 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_24A2766A8(v26, (uint64_t)v32);
      if (MEMORY[0x24BD0C63C](v32))
      {
        v27 = v32[1];
        ObjectType = swift_getObjectType();
        (*(void (**)(uint64_t, uint64_t, uint64_t, double, double, double))(v27 + 8))(v13, ObjectType, v27, a1, a2, a3);
        swift_unknownObjectRelease();
      }
      sub_24A26EC1C((uint64_t)v32);
      v26 += 16;
      --v25;
    }
    while (v25);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24A275A1C(uint64_t a1, uint64_t *a2, double a3, double a4, double a5, double a6)
{
  char *v6;
  char *v7;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  const char *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t result;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t ObjectType;
  uint64_t v41;
  uint64_t v42;
  int v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55[8];
  uint64_t v56;
  uint64_t v57[4];

  v7 = v6;
  v46 = *a2;
  v13 = a2[2];
  v45 = a2[1];
  v15 = a2[3];
  v14 = a2[4];
  v16 = a2[5];
  v17 = sub_24A292D78();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = objc_msgSend(v7, sel_interfaceOrientation);
  if ((unint64_t)v21 <= 1)
    v22 = 1;
  else
    v22 = (uint64_t)v21;
  if (qword_25791F7C8 != -1)
    swift_once();
  v23 = __swift_project_value_buffer(v17, (uint64_t)qword_25791FD60);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v23, v17);
  v24 = sub_24A292D60();
  v25 = sub_24A292F64();
  if (os_log_type_enabled(v24, (os_log_type_t)v25))
  {
    v43 = v25;
    v44 = v7;
    v26 = swift_slowAlloc();
    v42 = swift_slowAlloc();
    v57[0] = v42;
    *(_DWORD *)v26 = 136316162;
    v47 = a3;
    v48 = a4;
    type metadata accessor for CGSize(0);
    v27 = sub_24A292E44();
    v47 = COERCE_DOUBLE(sub_24A26FA2C(v27, v28, v57));
    sub_24A292FF4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 12) = 2048;
    v47 = a5;
    sub_24A292FF4();
    *(_WORD *)(v26 + 22) = 2048;
    v47 = a6;
    sub_24A292FF4();
    *(_WORD *)(v26 + 32) = 2080;
    v29 = 0xD00000000000001DLL;
    v30 = 0x800000024A298600;
    switch(a1)
    {
      case 0:
        break;
      case 1:
        v31 = "UIViewAnimationCurveEaseIn";
        goto LABEL_13;
      case 2:
        v29 = 0xD00000000000001BLL;
        v30 = 0x800000024A2985C0;
        break;
      case 3:
        v31 = "UIViewAnimationCurveLinear";
LABEL_13:
        v30 = (unint64_t)(v31 - 32) | 0x8000000000000000;
        v29 = 0xD00000000000001ALL;
        break;
      default:
        v30 = 0xE700000000000000;
        v29 = 0x6E776F6E6B6E55;
        break;
    }
    v47 = COERCE_DOUBLE(sub_24A26FA2C(v29, v30, v57));
    sub_24A292FF4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 42) = 2080;
    v32 = 0xD000000000000014;
    v33 = 0x800000024A2984D0;
    switch(v22)
    {
      case 1:
        v33 = 0xE800000000000000;
        v32 = 0x7469617274726F50;
        break;
      case 2:
        break;
      case 3:
        v33 = 0xEF74686769522065;
        goto LABEL_19;
      case 4:
        v33 = 0xEE007466654C2065;
LABEL_19:
        v32 = 0x70616373646E614CLL;
        break;
      default:
        v32 = 0xD000000000000013;
        v33 = 0x800000024A2984B0;
        break;
    }
    v47 = COERCE_DOUBLE(sub_24A26FA2C(v32, v33, v57));
    sub_24A292FF4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A26B000, v24, (os_log_type_t)v43, "Notifying rotating views rotating to: %s rotation: %f duration: %f curve: %s orientation: %s", (uint8_t *)v26, 0x34u);
    v34 = v42;
    swift_arrayDestroy();
    MEMORY[0x24BD0C57C](v34, -1, -1);
    MEMORY[0x24BD0C57C](v26, -1, -1);

    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    v7 = v44;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  }
  v35 = &v7[OBJC_IVAR____TtC26WatchFacesWallpaperSupport28PosterRotatingViewController_rotatingResponders];
  result = swift_beginAccess();
  v37 = *(_QWORD *)(*(_QWORD *)v35 + 16);
  if (v37)
  {
    v38 = *(_QWORD *)v35 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_24A2766A8(v38, (uint64_t)v55);
      if (MEMORY[0x24BD0C63C](v55))
      {
        v39 = v56;
        ObjectType = swift_getObjectType();
        v47 = a6;
        v48 = *(double *)&a1;
        v49 = v46;
        v50 = v45;
        v51 = v13;
        v52 = v15;
        v53 = v14;
        v54 = v16;
        (*(void (**)(double *, uint64_t, uint64_t, uint64_t, double, double, double))(v39 + 16))(&v47, v22, ObjectType, v39, a3, a4, a5);
        swift_unknownObjectRelease();
      }
      sub_24A26EC1C((uint64_t)v55);
      v38 += 16;
      --v37;
    }
    while (v37);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24A275F64(double a1, double a2, double a3)
{
  char *v3;
  char *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t result;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t ObjectType;
  char *v29;
  uint64_t v30;
  int v31;
  uint64_t v32[2];
  double v33;
  double v34;

  v4 = v3;
  v8 = sub_24A292D78();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = objc_msgSend(v4, sel_interfaceOrientation);
  if ((unint64_t)v12 <= 1)
    v13 = 1;
  else
    v13 = (uint64_t)v12;
  if (qword_25791F7C8 != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v8, (uint64_t)qword_25791FD60);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v14, v8);
  v15 = sub_24A292D60();
  v16 = sub_24A292F64();
  if (os_log_type_enabled(v15, (os_log_type_t)v16))
  {
    v31 = v16;
    v29 = v4;
    v17 = swift_slowAlloc();
    v30 = swift_slowAlloc();
    v32[0] = v30;
    *(_DWORD *)v17 = 136315650;
    v33 = a1;
    v34 = a2;
    type metadata accessor for CGSize(0);
    v18 = sub_24A292E44();
    v33 = COERCE_DOUBLE(sub_24A26FA2C(v18, v19, v32));
    sub_24A292FF4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2048;
    v33 = a3;
    sub_24A292FF4();
    *(_WORD *)(v17 + 22) = 2080;
    v20 = 0xD000000000000014;
    v21 = 0x800000024A2984D0;
    v4 = v29;
    switch(v13)
    {
      case 1:
        v21 = 0xE800000000000000;
        v20 = 0x7469617274726F50;
        break;
      case 2:
        break;
      case 3:
        v21 = 0xEF74686769522065;
        goto LABEL_12;
      case 4:
        v21 = 0xEE007466654C2065;
LABEL_12:
        v20 = 0x70616373646E614CLL;
        break;
      default:
        v21 = 0x800000024A2984B0;
        v4 = v29;
        break;
    }
    v33 = COERCE_DOUBLE(sub_24A26FA2C(v20, v21, v32));
    sub_24A292FF4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A26B000, v15, (os_log_type_t)v31, "Notifying rotating views didRotate to: %s rotation: %f orientation: %s", (uint8_t *)v17, 0x20u);
    v22 = v30;
    swift_arrayDestroy();
    MEMORY[0x24BD0C57C](v22, -1, -1);
    MEMORY[0x24BD0C57C](v17, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v23 = &v4[OBJC_IVAR____TtC26WatchFacesWallpaperSupport28PosterRotatingViewController_rotatingResponders];
  result = swift_beginAccess();
  v25 = *(_QWORD *)(*(_QWORD *)v23 + 16);
  if (v25)
  {
    v26 = *(_QWORD *)v23 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_24A2766A8(v26, (uint64_t)v32);
      if (MEMORY[0x24BD0C63C](v32))
      {
        v27 = v32[1];
        ObjectType = swift_getObjectType();
        (*(void (**)(uint64_t, uint64_t, uint64_t, double, double, double))(v27 + 24))(v13, ObjectType, v27, a1, a2, a3);
        swift_unknownObjectRelease();
      }
      sub_24A26EC1C((uint64_t)v32);
      v26 += 16;
      --v25;
    }
    while (v25);
    return swift_bridgeObjectRelease();
  }
  return result;
}

id PosterRotatingViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_24A292E08();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void PosterRotatingViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id PosterRotatingViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PosterRotatingViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL UIInterfaceOrientation.useFlippedRotation.getter(uint64_t a1)
{
  return a1 == 4 || a1 == 2;
}

unint64_t UIInterfaceOrientation.description.getter(uint64_t a1)
{
  uint64_t v1;
  unint64_t result;

  v1 = a1 - 1;
  result = 0xD000000000000014;
  switch(v1)
  {
    case 0:
      result = 0x7469617274726F50;
      break;
    case 2:
    case 3:
      result = 0x70616373646E614CLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24A2764F8()
{
  uint64_t *v0;

  return UIInterfaceOrientation.description.getter(*v0);
}

uint64_t sub_24A276500()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_24A276524(void *a1)
{
  double *v1;

  return sub_24A275074(a1, v1[3], v1[4], v1[5]);
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

uint64_t sub_24A27654C()
{
  double *v0;

  return sub_24A275F64(v0[3], v0[4], v0[5]);
}

_QWORD *sub_24A276578(_QWORD *result, int64_t a2, char a3, unint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *(_QWORD *)(a4 + 24);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *(_QWORD *)(a4 + 16);
    if (v7 <= v8)
      v9 = *(_QWORD *)(a4 + 16);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25791FE20);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = (unint64_t)(v10 + 4);
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = MEMORY[0x24BEE4AF8] + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if ((unint64_t)v10 < a4 || v13 >= a4 + 32 + 16 * v8)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v10 != (_QWORD *)a4)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        *(_QWORD *)(a4 + 16) = 0;
        goto LABEL_26;
      }
    }
    sub_24A276BE4(0, v8, v13, a4);
LABEL_26:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24A2766A8(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectWeakCopyInit();
  *(_QWORD *)(a2 + 8) = *(_QWORD *)(a1 + 8);
  return a2;
}

uint64_t sub_24A2766E0(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectWeakTakeInit();
  *(_QWORD *)(a2 + 8) = *(_QWORD *)(a1 + 8);
  return a2;
}

uint64_t sub_24A276718(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_24A2768D0(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t dispatch thunk of PosterRotatingResponder.apply(size:rotation:orientation:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of PosterRotatingResponder.rotating(to:rotation:animation:orientation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of PosterRotatingResponder.didRotate(to:rotation:orientation:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t method lookup function for PosterRotatingViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PosterRotatingViewController.addResponder(responder:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t initializeWithCopy for WeakPosterRotatingResponder(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_unknownObjectWeakCopyInit();
  *(_QWORD *)(result + 8) = *(_QWORD *)(a2 + 8);
  return result;
}

uint64_t assignWithCopy for WeakPosterRotatingResponder(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_unknownObjectWeakCopyAssign();
  *(_QWORD *)(result + 8) = *(_QWORD *)(a2 + 8);
  return result;
}

uint64_t initializeWithTake for WeakPosterRotatingResponder(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_unknownObjectWeakTakeInit();
  *(_QWORD *)(result + 8) = *(_QWORD *)(a2 + 8);
  return result;
}

uint64_t assignWithTake for WeakPosterRotatingResponder(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_unknownObjectWeakTakeAssign();
  *(_QWORD *)(result + 8) = *(_QWORD *)(a2 + 8);
  return result;
}

uint64_t getEnumTagSinglePayload for WeakPosterRotatingResponder(uint64_t a1, int a2)
{
  int v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  if ((*(_QWORD *)(a1 + 8) & 0xF000000000000007) != 0)
    v2 = *(_DWORD *)a1 & 0x7FFFFFFF;
  else
    v2 = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WeakPosterRotatingResponder(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = 1;
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for WeakPosterRotatingResponder()
{
  return &type metadata for WeakPosterRotatingResponder;
}

uint64_t sub_24A2768B4(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_24A276A5C(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_24A2768D0(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_34;
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25791FE20);
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
  v13 = (unint64_t)(v10 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 < a4 || v13 >= v14 + 16 * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v10 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  if (v14 >= v13 + 16 * v8 || v13 >= v14 + 16 * v8)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_34:
  result = sub_24A293120();
  __break(1u);
  return result;
}

uint64_t sub_24A276A5C(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25791FE10);
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
  v13 = (unint64_t)(v10 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= v14 + 16 * v8)
      memmove(v10 + 4, a4 + 4, 16 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 16 * v8 || v13 >= v14 + 16 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25791FE18);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_24A293120();
  __break(1u);
  return result;
}

uint64_t sub_24A276BE4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_24A293120();
  __break(1u);
  return result;
}

uint64_t static PosterDataLoader.from(look:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v1 + 80);
  v3 = objc_msgSend(a1, sel_identifier);
  v4 = sub_24A292E2C();
  v6 = v5;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 + 88) + 32))(v4, v6, v2);
}

uint64_t static PosterDataLoader.from(renderer:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  void (**v5)(char *, uint64_t);
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
  char *v22;
  uint64_t v23;
  char *v24;
  id v25;
  void (**v26)(char *, uint64_t);
  int EnumCaseMultiPayload;
  void (*v28)(char *, uint64_t);
  char *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  char *v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  char *v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  uint64_t v53;
  uint8_t *v54;
  char *v55;
  void (**v56)(char *, uint64_t);
  char *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;

  v62 = a2;
  v4 = *(_QWORD *)(v2 + 80);
  v5 = *(void (***)(char *, uint64_t))(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v56 = (void (**)(char *, uint64_t))((char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = MEMORY[0x24BDAC7A8](v6);
  v58 = (char *)&v53 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v57 = (char *)&v53 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v55 = (char *)&v53 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v53 - v14;
  v16 = *(_QWORD *)(v2 + 88);
  v18 = type metadata accessor for PosterDataLoadResult(0, v4, v16, v17);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v53 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v53 - v23;
  v25 = objc_msgSend(objc_msgSend(a1, sel_environment), sel_contents);
  swift_unknownObjectRelease();
  static PosterDataLoader.posterDataResult<A>(from:)(v4, v16, v24);
  swift_unknownObjectRelease();
  v59 = v24;
  v60 = v19;
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v22, v24, v18);
  v61 = v18;
  v26 = v5;
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v28 = v5[4];
  if (EnumCaseMultiPayload == 1)
  {
    ((void (*)(char *, char *, uint64_t))v28)(v15, v22, v4);
    v29 = v15;
    v30 = v4;
    if (qword_2544CE630 != -1)
      swift_once();
    v31 = sub_24A292D78();
    __swift_project_value_buffer(v31, (uint64_t)qword_2544CE7E0);
    v32 = v5[2];
    v33 = v55;
    ((void (*)(char *, char *, uint64_t))v32)(v55, v15, v4);
    v34 = sub_24A292D60();
    v35 = sub_24A292F64();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = swift_slowAlloc();
      v56 = v26;
      v37 = (uint8_t *)v36;
      v38 = swift_slowAlloc();
      v58 = v15;
      v39 = v38;
      v64 = (char *)v38;
      *(_DWORD *)v37 = 136315138;
      v54 = v37 + 4;
      ((void (*)(char *, char *, uint64_t))v32)(v57, v33, v4);
      v40 = sub_24A292E44();
      v63 = sub_24A26FA2C(v40, v41, (uint64_t *)&v64);
      sub_24A292FF4();
      swift_bridgeObjectRelease();
      v56[1](v33, v4);
      _os_log_impl(&dword_24A26B000, v34, v35, "renderer posterData — fallbacking to: %s", v37, 0xCu);
      swift_arrayDestroy();
      v42 = v39;
      v29 = v58;
      MEMORY[0x24BD0C57C](v42, -1, -1);
      MEMORY[0x24BD0C57C](v37, -1, -1);

    }
    else
    {

      v26[1](v33, v4);
    }
    goto LABEL_12;
  }
  v29 = v58;
  ((void (*)(char *, char *, uint64_t))v28)(v58, v22, v4);
  v30 = v4;
  if (qword_2544CE630 != -1)
    swift_once();
  v43 = sub_24A292D78();
  __swift_project_value_buffer(v43, (uint64_t)qword_2544CE7E0);
  v44 = v5[2];
  v45 = (char *)v56;
  ((void (*)(void (**)(char *, uint64_t), char *, uint64_t))v44)(v56, v29, v4);
  v46 = sub_24A292D60();
  v47 = sub_24A292F64();
  if (!os_log_type_enabled(v46, v47))
  {

    v26[1](v45, v4);
LABEL_12:
    (*(void (**)(char *, uint64_t))(v60 + 8))(v59, v61);
    return ((uint64_t (*)(uint64_t, char *, uint64_t))v28)(v62, v29, v30);
  }
  v48 = (uint8_t *)swift_slowAlloc();
  v55 = (char *)swift_slowAlloc();
  v64 = v55;
  *(_DWORD *)v48 = 136315138;
  v54 = v48 + 4;
  ((void (*)(char *, char *, uint64_t))v44)(v57, v45, v30);
  v49 = sub_24A292E44();
  v63 = sub_24A26FA2C(v49, v50, (uint64_t *)&v64);
  sub_24A292FF4();
  swift_bridgeObjectRelease();
  v26[1](v45, v30);
  _os_log_impl(&dword_24A26B000, v46, v47, "renderer posterData — successfully loaded: %s", v48, 0xCu);
  v51 = v55;
  swift_arrayDestroy();
  MEMORY[0x24BD0C57C](v51, -1, -1);
  MEMORY[0x24BD0C57C](v48, -1, -1);

  (*(void (**)(char *, uint64_t))(v60 + 8))(v59, v61);
  v29 = v58;
  return ((uint64_t (*)(uint64_t, char *, uint64_t))v28)(v62, v29, v30);
}

uint64_t static PosterDataLoader.posterDataResult<A>(from:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char *a3@<X8>)
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
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  unint64_t v30;
  uint8_t *v31;
  uint64_t v32;
  _QWORD v34[2];
  uint8_t *v35;
  uint64_t v36;
  void (*v37)(char *, char *, uint64_t);
  char *v38;
  uint64_t v39;
  uint64_t v40;

  v38 = a3;
  v5 = sub_24A292FE8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v34 - v8;
  v10 = *(_QWORD *)(a1 - 8);
  v11 = MEMORY[0x24BDAC7A8](v7);
  v13 = (char *)v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)v34 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v34 - v17;
  swift_getObjectType();
  PRPosterContents.posterData<A>()(a1, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v9, 1, a1) == 1)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    if (qword_2544CE630 != -1)
      swift_once();
    v19 = sub_24A292D78();
    __swift_project_value_buffer(v19, (uint64_t)qword_2544CE7E0);
    v20 = sub_24A292D60();
    v21 = sub_24A292F64();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_24A26B000, v20, v21, "posterDataResult(from posterContents — using fallback", v22, 2u);
      MEMORY[0x24BD0C57C](v22, -1, -1);
    }

    (*(void (**)(uint64_t, uint64_t))(a2 + 56))(a1, a2);
  }
  else
  {
    v37 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v37(v18, v9, a1);
    if (qword_2544CE630 != -1)
      swift_once();
    v24 = sub_24A292D78();
    __swift_project_value_buffer(v24, (uint64_t)qword_2544CE7E0);
    v25 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
    v25(v16, v18, a1);
    v26 = sub_24A292D60();
    v27 = sub_24A292F64();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      v36 = swift_slowAlloc();
      v40 = v36;
      v35 = v28;
      *(_DWORD *)v28 = 136315138;
      v34[1] = v28 + 4;
      v25(v13, v16, a1);
      v29 = sub_24A292E44();
      v39 = sub_24A26FA2C(v29, v30, &v40);
      sub_24A292FF4();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v16, a1);
      v31 = v35;
      _os_log_impl(&dword_24A26B000, v26, v27, "posterDataResult(from posterContents — successfully loaded: %s", v35, 0xCu);
      v32 = v36;
      swift_arrayDestroy();
      MEMORY[0x24BD0C57C](v32, -1, -1);
      MEMORY[0x24BD0C57C](v31, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v10 + 8))(v16, a1);
    }

    v37(v38, v18, a1);
  }
  type metadata accessor for PosterDataLoadResult(0, a1, a2, v23);
  return swift_storeEnumTagMultiPayload();
}

uint64_t static PosterDataLoader.from(renderingEnvironment:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24A2776E4(a1, (SEL *)&selRef_contents, a2);
}

uint64_t static PosterDataLoader.from(editingEnvironment:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24A2776E4(a1, (SEL *)&selRef_sourceContents, a2);
}

uint64_t sub_24A2776E4@<X0>(void *a1@<X0>, SEL *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  id v27;
  int EnumCaseMultiPayload;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  char *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  uint64_t v38;
  void (*v39)(char *, char *, uint64_t);
  char *v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v49;
  uint8_t *v50;
  char *v51;
  char *v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  char *v60;

  v57 = a3;
  v58 = a1;
  v5 = *(_QWORD *)(v3 + 80);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](a1);
  v52 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v49 - v10;
  v12 = MEMORY[0x24BDAC7A8](v9);
  v53 = (char *)&v49 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v51 = (char *)&v49 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v49 - v16;
  v18 = *(_QWORD *)(v3 + 88);
  v20 = type metadata accessor for PosterDataLoadResult(0, v5, v18, v19);
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v49 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v49 - v25;
  v27 = objc_msgSend(v58, *a2);
  static PosterDataLoader.posterDataResult<A>(from:)(v5, v18, v26);
  swift_unknownObjectRelease();
  v54 = v26;
  v55 = v21;
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v26, v20);
  v56 = v20;
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v58 = *(id *)(v6 + 32);
  if (EnumCaseMultiPayload == 1)
  {
    ((void (*)(char *, char *, uint64_t))v58)(v17, v24, v5);
    if (qword_2544CE630 != -1)
      swift_once();
    v29 = sub_24A292D78();
    __swift_project_value_buffer(v29, (uint64_t)qword_2544CE7E0);
    v30 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
    v31 = v51;
    v30(v51, v17, v5);
    v32 = sub_24A292D60();
    v33 = sub_24A292F64();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      v52 = (char *)swift_slowAlloc();
      v60 = v52;
      *(_DWORD *)v34 = 136315138;
      v50 = v34 + 4;
      v30(v53, v31, v5);
      v35 = sub_24A292E44();
      v59 = sub_24A26FA2C(v35, v36, (uint64_t *)&v60);
      sub_24A292FF4();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v31, v5);
      _os_log_impl(&dword_24A26B000, v32, v33, "renderer posterData — fallbacking to: %s", v34, 0xCu);
      v37 = v52;
      swift_arrayDestroy();
      MEMORY[0x24BD0C57C](v37, -1, -1);
      MEMORY[0x24BD0C57C](v34, -1, -1);

    }
    else
    {

      (*(void (**)(char *, uint64_t))(v6 + 8))(v31, v5);
    }
    (*(void (**)(char *, uint64_t))(v55 + 8))(v54, v56);
  }
  else
  {
    ((void (*)(char *, char *, uint64_t))v58)(v11, v24, v5);
    if (qword_2544CE630 != -1)
      swift_once();
    v38 = sub_24A292D78();
    __swift_project_value_buffer(v38, (uint64_t)qword_2544CE7E0);
    v39 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
    v40 = v52;
    v39(v52, v11, v5);
    v41 = sub_24A292D60();
    v42 = sub_24A292F64();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = swift_slowAlloc();
      v51 = v11;
      v44 = (uint8_t *)v43;
      v45 = swift_slowAlloc();
      v60 = (char *)v45;
      *(_DWORD *)v44 = 136315138;
      v50 = v44 + 4;
      v39(v53, v40, v5);
      v46 = sub_24A292E44();
      v59 = sub_24A26FA2C(v46, v47, (uint64_t *)&v60);
      sub_24A292FF4();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v40, v5);
      _os_log_impl(&dword_24A26B000, v41, v42, "renderer posterData — successfully loaded: %s", v44, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BD0C57C](v45, -1, -1);
      MEMORY[0x24BD0C57C](v44, -1, -1);

      (*(void (**)(char *, uint64_t))(v55 + 8))(v54, v56);
      v17 = v51;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v6 + 8))(v40, v5);
      (*(void (**)(char *, uint64_t))(v55 + 8))(v54, v56);
      v17 = v11;
    }
  }
  return ((uint64_t (*)(uint64_t, char *, uint64_t))v58)(v57, v17, v5);
}

uint64_t static PosterDataLoader.from(editor:)@<X0>(void *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
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
  char *v21;
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
  id v32;
  NSObject *v33;
  os_log_type_t v34;
  _BOOL4 v35;
  SEL *v36;
  uint8_t *v37;
  id v38;
  char *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  id v46;
  char *v47;
  char *v48;
  NSObject *v49;
  os_log_type_t v50;
  SEL *v51;
  SEL *v52;
  uint8_t *v53;
  void *v54;
  id v55;
  uint64_t v56;
  unint64_t v57;
  void *v58;
  void (*v59)(char *, char *, uint64_t);
  char *v60;
  void (*v61)(char *, char *, uint64_t);
  NSObject *v62;
  os_log_type_t v63;
  uint64_t v64;
  uint8_t *v65;
  void *v66;
  uint64_t v67;
  unint64_t v68;
  uint8_t *v69;
  uint64_t v70;
  id v71;
  id v72;
  id v73;
  id v74;
  NSObject *v75;
  os_log_type_t v76;
  uint8_t *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t v84;
  void *v85;
  uint8_t *v86;
  uint64_t v87;
  char *v88;
  id v89;
  void *v90;
  NSObject *v91;
  os_log_type_t v92;
  uint8_t *v93;
  uint64_t v94;
  id v95;
  char *v96;
  char *v97;
  int EnumCaseMultiPayload;
  char *v99;
  void (*v100)(char *, char *, uint64_t);
  char *v101;
  NSObject *v102;
  os_log_type_t v103;
  uint8_t *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  unint64_t v108;
  void *v109;
  char *v110;
  void (*v111)(char *, char *, uint64_t);
  char *v112;
  NSObject *v113;
  os_log_type_t v114;
  uint8_t *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  unint64_t v119;
  void *v120;
  _QWORD v122[2];
  void *v123;
  uint64_t v124;
  char *v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char *v130;
  char *v131;
  char *v132;
  char *v133;
  uint64_t v134;
  char *v135;
  char *v136;
  uint64_t v137;
  uint64_t v138;
  char *v139;
  uint64_t v140;
  void (*v141)(char *, char *, uint64_t);
  uint64_t v142;
  id v143[3];

  v4 = v3;
  v138 = a3;
  v143[1] = *(id *)MEMORY[0x24BDAC8D0];
  v6 = *(_QWORD *)(v4 + 80);
  v129 = *(_QWORD *)(v4 + 88);
  v134 = type metadata accessor for PosterDataLoadResult(0, v6, v129, a2);
  v137 = *(_QWORD *)(v134 - 8);
  v7 = MEMORY[0x24BDAC7A8](v134);
  v130 = (char *)v122 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v136 = (char *)v122 - v9;
  v10 = sub_24A292FE8();
  v127 = *(_QWORD *)(v10 - 8);
  v128 = v10;
  v11 = MEMORY[0x24BDAC7A8](v10);
  v135 = (char *)v122 - v12;
  v13 = *(_QWORD *)(v6 - 8);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)v122 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v132 = (char *)v122 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)v122 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v131 = (char *)v122 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v133 = (char *)v122 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)v122 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v139 = (char *)v122 - v29;
  if (qword_2544CE630 != -1)
    swift_once();
  v30 = sub_24A292D78();
  v31 = __swift_project_value_buffer(v30, (uint64_t)qword_2544CE7E0);
  v32 = a1;
  v141 = (void (*)(char *, char *, uint64_t))v31;
  v33 = sub_24A292D60();
  v34 = sub_24A292F64();
  v35 = os_log_type_enabled(v33, v34);
  v36 = (SEL *)&unk_251BBC000;
  v140 = v13;
  v125 = v21;
  v126 = v16;
  if (v35)
  {
    v37 = (uint8_t *)swift_slowAlloc();
    v123 = (void *)swift_slowAlloc();
    v143[0] = v123;
    v124 = v4;
    *(_DWORD *)v37 = 136315138;
    v122[1] = v37 + 4;
    v38 = objc_msgSend(v32, sel_currentLook);
    v39 = v28;
    v40 = v6;
    v41 = objc_msgSend(v38, sel_identifier);

    v42 = sub_24A292E2C();
    v44 = v43;

    v6 = v40;
    v28 = v39;
    v36 = (SEL *)&unk_251BBC000;
    v142 = sub_24A26FA2C(v42, v44, (uint64_t *)v143);
    sub_24A292FF4();

    v13 = v140;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A26B000, v33, v34, "loading poster data, from editor with lookIdentifier: %s", v37, 0xCu);
    v45 = v123;
    swift_arrayDestroy();
    MEMORY[0x24BD0C57C](v45, -1, -1);
    MEMORY[0x24BD0C57C](v37, -1, -1);

  }
  else
  {

  }
  v46 = objc_msgSend(v32, v36[366]);
  v47 = v135;
  static PosterDataLoader.from(look:)(v46);

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v47, 1, v6) == 1)
  {
    (*(void (**)(char *, uint64_t))(v127 + 8))(v47, v128);
    v48 = (char *)v32;
    v49 = sub_24A292D60();
    v50 = sub_24A292F64();
    v51 = (SEL *)&unk_251BBC000;
    v52 = (SEL *)&unk_251BBC000;
    if (os_log_type_enabled(v49, v50))
    {
      v53 = (uint8_t *)swift_slowAlloc();
      v54 = (void *)swift_slowAlloc();
      v143[0] = v54;
      *(_DWORD *)v53 = 136315138;
      v55 = objc_msgSend(objc_msgSend(v48, sel_environment), sel_sourceContents);
      swift_unknownObjectRelease();
      v142 = (uint64_t)v55;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25791FE90);
      v56 = sub_24A292E44();
      v142 = sub_24A26FA2C(v56, v57, (uint64_t *)v143);
      v51 = (SEL *)&unk_251BBC000;
      sub_24A292FF4();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24A26B000, v49, v50, "loading poster data from %s", v53, 0xCu);
      swift_arrayDestroy();
      v58 = v54;
      v52 = (SEL *)&unk_251BBC000;
      MEMORY[0x24BD0C57C](v58, -1, -1);
      MEMORY[0x24BD0C57C](v53, -1, -1);

    }
    else
    {

    }
    v70 = v134;
    v71 = objc_msgSend(objc_msgSend(v48, v51[338]), v52[365]);
    swift_unknownObjectRelease();
    v143[0] = 0;
    v72 = objc_msgSend(v71, sel_loadUserInfoWithError_, v143);
    swift_unknownObjectRelease();
    v73 = v143[0];
    if (v72)
    {
      sub_24A292DC0();
      v74 = v73;

      swift_bridgeObjectRetain();
      v75 = sub_24A292D60();
      v76 = sub_24A292F64();
      if (os_log_type_enabled(v75, v76))
      {
        v77 = (uint8_t *)swift_slowAlloc();
        v78 = (void *)swift_slowAlloc();
        v139 = v48;
        v79 = v78;
        v143[0] = v78;
        *(_DWORD *)v77 = 136315138;
        v135 = (char *)(v77 + 4);
        swift_bridgeObjectRetain();
        v80 = v6;
        v81 = sub_24A292DCC();
        v83 = v82;
        swift_bridgeObjectRelease();
        v84 = v81;
        v6 = v80;
        v142 = sub_24A26FA2C(v84, v83, (uint64_t *)v143);
        sub_24A292FF4();
        swift_bridgeObjectRelease_n();
        v70 = v134;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24A26B000, v75, v76, "loaded userInfo: %s", v77, 0xCu);
        swift_arrayDestroy();
        v85 = v79;
        v48 = v139;
        MEMORY[0x24BD0C57C](v85, -1, -1);
        v86 = v77;
        v52 = (SEL *)&unk_251BBC000;
        MEMORY[0x24BD0C57C](v86, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v94 = v140;
      v51 = (SEL *)&unk_251BBC000;
    }
    else
    {
      v89 = v143[0];
      v90 = (void *)sub_24A292C28();

      swift_willThrow();
      v91 = sub_24A292D60();
      v92 = sub_24A292F64();
      if (os_log_type_enabled(v91, v92))
      {
        v93 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v93 = 0;
        _os_log_impl(&dword_24A26B000, v91, v92, "unable to load userInfo", v93, 2u);
        MEMORY[0x24BD0C57C](v93, -1, -1);
      }

      v94 = v140;
    }
    v95 = objc_msgSend(objc_msgSend(v48, v51[338]), v52[365]);
    swift_unknownObjectRelease();
    v96 = v136;
    static PosterDataLoader.posterDataResult<A>(from:)(v6, v129, v136);
    swift_unknownObjectRelease();
    v97 = v130;
    (*(void (**)(char *, char *, uint64_t))(v137 + 16))(v130, v96, v70);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v59 = *(void (**)(char *, char *, uint64_t))(v94 + 32);
    if (EnumCaseMultiPayload == 1)
    {
      v99 = v131;
      v59(v131, v97, v6);
      v100 = *(void (**)(char *, char *, uint64_t))(v94 + 16);
      v101 = v125;
      v100(v125, v99, v6);
      v102 = sub_24A292D60();
      v103 = sub_24A292F64();
      if (os_log_type_enabled(v102, v103))
      {
        v104 = (uint8_t *)swift_slowAlloc();
        v105 = (void *)swift_slowAlloc();
        v141 = v59;
        v106 = v105;
        v143[0] = v105;
        *(_DWORD *)v104 = 136315138;
        v100(v133, v101, v6);
        v107 = sub_24A292E44();
        v142 = sub_24A26FA2C(v107, v108, (uint64_t *)v143);
        sub_24A292FF4();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v140 + 8))(v101, v6);
        _os_log_impl(&dword_24A26B000, v102, v103, "editor posterData — fallbacking to: %s", v104, 0xCu);
        swift_arrayDestroy();
        v109 = v106;
        v59 = v141;
        MEMORY[0x24BD0C57C](v109, -1, -1);
        MEMORY[0x24BD0C57C](v104, -1, -1);

        (*(void (**)(char *, uint64_t))(v137 + 8))(v136, v134);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v94 + 8))(v101, v6);
        (*(void (**)(char *, uint64_t))(v137 + 8))(v136, v70);
      }
      v87 = v138;
      v88 = v131;
    }
    else
    {
      v110 = v132;
      v59(v132, v97, v6);
      v111 = *(void (**)(char *, char *, uint64_t))(v94 + 16);
      v112 = v126;
      v111(v126, v110, v6);
      v113 = sub_24A292D60();
      v114 = sub_24A292F64();
      if (os_log_type_enabled(v113, v114))
      {
        v115 = (uint8_t *)swift_slowAlloc();
        v116 = (void *)swift_slowAlloc();
        v141 = v59;
        v117 = v116;
        v143[0] = v116;
        *(_DWORD *)v115 = 136315138;
        v111(v133, v112, v6);
        v118 = sub_24A292E44();
        v142 = sub_24A26FA2C(v118, v119, (uint64_t *)v143);
        sub_24A292FF4();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v140 + 8))(v112, v6);
        _os_log_impl(&dword_24A26B000, v113, v114, "editor posterData — successfully loaded: %s", v115, 0xCu);
        swift_arrayDestroy();
        v120 = v117;
        v59 = v141;
        MEMORY[0x24BD0C57C](v120, -1, -1);
        MEMORY[0x24BD0C57C](v115, -1, -1);

        (*(void (**)(char *, uint64_t))(v137 + 8))(v136, v134);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v94 + 8))(v112, v6);
        (*(void (**)(char *, uint64_t))(v137 + 8))(v136, v70);
      }
      v87 = v138;
      v88 = v132;
    }
  }
  else
  {
    v59 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v60 = v139;
    v59(v139, v47, v6);
    v61 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    v61(v28, v60, v6);
    v62 = sub_24A292D60();
    v63 = sub_24A292F64();
    if (os_log_type_enabled(v62, v63))
    {
      v64 = swift_slowAlloc();
      v141 = v59;
      v65 = (uint8_t *)v64;
      v66 = (void *)swift_slowAlloc();
      v143[0] = v66;
      *(_DWORD *)v65 = 136315138;
      v61(v133, v28, v6);
      v67 = sub_24A292E44();
      v142 = sub_24A26FA2C(v67, v68, (uint64_t *)v143);
      sub_24A292FF4();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v140 + 8))(v28, v6);
      _os_log_impl(&dword_24A26B000, v62, v63, "currentLookKaleidoscopePosterData: %s", v65, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BD0C57C](v66, -1, -1);
      v69 = v65;
      v59 = v141;
      MEMORY[0x24BD0C57C](v69, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v13 + 8))(v28, v6);
    }

    v87 = v138;
    v88 = v139;
  }
  return ((uint64_t (*)(uint64_t, char *, uint64_t))v59)(v87, v88, v6);
}

uint64_t static PosterDataLoader.comparePosterData(from:to:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
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
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  NSObject *v22;
  os_log_type_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v36;
  int v37;
  os_log_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;

  v4 = v3;
  v43 = (char *)a2;
  v7 = *(_QWORD *)(v3 + 80);
  v8 = sub_24A292FE8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v42 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v36 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v36 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v36 - v18;
  objc_msgSend(objc_msgSend(a1, sel_environment), sel_contents);
  swift_unknownObjectRelease();
  swift_getObjectType();
  PRPosterContents.posterData<A>()(v7, (uint64_t)v19);
  swift_unknownObjectRelease();
  if (qword_2544CE630 != -1)
    swift_once();
  v20 = sub_24A292D78();
  __swift_project_value_buffer(v20, (uint64_t)qword_2544CE7E0);
  v21 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v21(v17, v19, v8);
  v21(v14, v43, v8);
  v22 = sub_24A292D60();
  v23 = sub_24A292F64();
  v24 = v23;
  if (os_log_type_enabled(v22, v23))
  {
    v25 = swift_slowAlloc();
    v40 = a3;
    v26 = v25;
    v39 = swift_slowAlloc();
    v45 = v39;
    *(_DWORD *)v26 = 136315394;
    v41 = v4;
    v38 = v22;
    v27 = v42;
    v21(v42, v17, v8);
    v28 = sub_24A292E44();
    v37 = v24;
    v44 = sub_24A26FA2C(v28, v29, &v45);
    v36 = v19;
    sub_24A292FF4();
    swift_bridgeObjectRelease();
    v30 = *(void (**)(char *, uint64_t))(v9 + 8);
    v30(v17, v8);
    *(_WORD *)(v26 + 12) = 2080;
    v21(v27, v14, v8);
    v31 = sub_24A292E44();
    v44 = sub_24A26FA2C(v31, v32, &v45);
    v19 = v36;
    sub_24A292FF4();
    swift_bridgeObjectRelease();
    v30(v14, v8);
    v22 = v38;
    _os_log_impl(&dword_24A26B000, v38, (os_log_type_t)v37, "updateResult from renderer data: %s compared to %s", (uint8_t *)v26, 0x16u);
    v33 = v39;
    swift_arrayDestroy();
    MEMORY[0x24BD0C57C](v33, -1, -1);
    v34 = v26;
    a3 = v40;
    MEMORY[0x24BD0C57C](v34, -1, -1);
  }
  else
  {
    v30 = *(void (**)(char *, uint64_t))(v9 + 8);
    v30(v17, v8);
    v30(v14, v8);
  }

  static PosterDataLoader.compare(newData:with:)((uint64_t)v19, (uint64_t)v43, a3);
  return ((uint64_t (*)(char *, uint64_t))v30)(v19, v8);
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  _BYTE *v7;
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
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  void (*v31)(NSObject *, _BYTE *);
  id v32;
  _BYTE *v33;
  _BYTE *v34;
  uint64_t v35;
  void (*v36)(NSObject *, _BYTE *, _BYTE *);
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  os_log_type_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  NSObject *v52;
  _BYTE *v53;
  void (*v54)(_BYTE *, uint64_t, _BYTE *);
  _BYTE *v55;
  _BYTE *v56;
  NSObject *v57;
  os_log_type_t v58;
  int v59;
  _BOOL4 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  void (*v65)(_BYTE *, uint64_t);
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  os_log_t v69;
  void (*v70)(_BYTE *, _BYTE *);
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v75;
  _BYTE v76[12];
  int v77;
  uint64_t v78;
  uint64_t v79;
  os_log_t v80;
  _BYTE *v81;
  _BYTE *v82;
  NSObject *v83;
  NSObject *v84;
  uint64_t v85;
  NSObject *v86;
  char *v87;
  _BYTE *v88;
  _BYTE *v89;
  uint64_t v90;
  _BYTE *v91;

  v4 = v3;
  v89 = (_BYTE *)a2;
  v87 = a3;
  v6 = *(_QWORD *)(v4 + 80);
  v7 = (_BYTE *)sub_24A292FE8();
  v8 = *((_QWORD *)v7 - 1);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v84 = &v76[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = MEMORY[0x24BDAC7A8](v9);
  v83 = &v76[-v12];
  v13 = MEMORY[0x24BDAC7A8](v11);
  v88 = &v76[-v14];
  v15 = MEMORY[0x24BDAC7A8](v13);
  v86 = &v76[-v16];
  v17 = MEMORY[0x24BDAC7A8](v15);
  v82 = &v76[-v18];
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = &v76[-v20];
  v22 = *(_QWORD *)(v6 - 8);
  v23 = MEMORY[0x24BDAC7A8](v19);
  v80 = (os_log_t)&v76[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v25 = MEMORY[0x24BDAC7A8](v23);
  v81 = &v76[-v26];
  MEMORY[0x24BDAC7A8](v25);
  v28 = &v76[-v27];
  v29 = objc_msgSend(a1, sel_currentLook);
  static PosterDataLoader.from(look:)(v29);

  if ((*(unsigned int (**)(NSObject *, uint64_t, uint64_t))(v22 + 48))(v21, 1, v6) == 1)
  {
    v30 = v21;
    v31 = *(void (**)(NSObject *, _BYTE *))(v8 + 8);
    v31(v30, v7);
    v32 = objc_msgSend(objc_msgSend(a1, sel_environment), sel_sourceContents);
    swift_unknownObjectRelease();
    swift_getObjectType();
    v33 = v88;
    PRPosterContents.posterData<A>()(v6, (uint64_t)v88);
    swift_unknownObjectRelease();
    v34 = v7;
    if (qword_2544CE630 != -1)
      swift_once();
    v35 = sub_24A292D78();
    __swift_project_value_buffer(v35, (uint64_t)qword_2544CE7E0);
    v36 = *(void (**)(NSObject *, _BYTE *, _BYTE *))(v8 + 16);
    v37 = v83;
    v36(v83, v33, v34);
    v38 = v84;
    v36(v84, v89, v34);
    v39 = sub_24A292D60();
    v40 = sub_24A292F64();
    v41 = v40;
    if (os_log_type_enabled(v39, v40))
    {
      v42 = swift_slowAlloc();
      LODWORD(v81) = v41;
      v43 = v42;
      v82 = (_BYTE *)swift_slowAlloc();
      v91 = v82;
      *(_DWORD *)v43 = 136315394;
      v85 = v4;
      v44 = v37;
      v45 = v86;
      v36(v86, v44, v34);
      v46 = sub_24A292E44();
      v80 = v39;
      v90 = sub_24A26FA2C(v46, v47, (uint64_t *)&v91);
      sub_24A292FF4();
      swift_bridgeObjectRelease();
      v31(v44, v34);
      *(_WORD *)(v43 + 12) = 2080;
      v36(v45, v38, v34);
      v48 = sub_24A292E44();
      v90 = sub_24A26FA2C(v48, v49, (uint64_t *)&v91);
      v33 = v88;
      sub_24A292FF4();
      swift_bridgeObjectRelease();
      v31(v38, v34);
      v39 = v80;
      _os_log_impl(&dword_24A26B000, v80, (os_log_type_t)v81, "updateResult from editor source contents: %s compared to %s", (uint8_t *)v43, 0x16u);
      v50 = v82;
      swift_arrayDestroy();
      MEMORY[0x24BD0C57C](v50, -1, -1);
      MEMORY[0x24BD0C57C](v43, -1, -1);
    }
    else
    {
      v31(v37, v34);
      v31(v38, v34);
    }

    static PosterDataLoader.compare(newData:with:)((uint64_t)v33, (uint64_t)v89, v87);
    return ((uint64_t (*)(_BYTE *, _BYTE *))v31)(v33, v34);
  }
  else
  {
    v88 = v7;
    v85 = v4;
    (*(void (**)(NSObject *, NSObject *, uint64_t))(v22 + 32))(v28, v21, v6);
    if (qword_2544CE630 != -1)
      swift_once();
    v51 = sub_24A292D78();
    __swift_project_value_buffer(v51, (uint64_t)qword_2544CE7E0);
    v52 = *(NSObject **)(v22 + 16);
    v53 = v81;
    v83 = v28;
    ((void (*)(_BYTE *, NSObject *, uint64_t))v52)(v81, v28, v6);
    v79 = v8;
    v54 = *(void (**)(_BYTE *, uint64_t, _BYTE *))(v8 + 16);
    v55 = v82;
    v56 = v88;
    v54(v82, (uint64_t)v89, v88);
    v57 = sub_24A292D60();
    v58 = sub_24A292F64();
    v59 = v58;
    v84 = v57;
    v60 = os_log_type_enabled(v57, v58);
    v61 = (uint64_t)v86;
    if (v60)
    {
      v62 = swift_slowAlloc();
      v78 = swift_slowAlloc();
      v91 = (_BYTE *)v78;
      *(_DWORD *)v62 = 136315394;
      v77 = v59;
      ((void (*)(os_log_t, _BYTE *, uint64_t))v52)(v80, v53, v6);
      v63 = sub_24A292E44();
      v90 = sub_24A26FA2C(v63, v64, (uint64_t *)&v91);
      v80 = v52;
      sub_24A292FF4();
      swift_bridgeObjectRelease();
      v65 = *(void (**)(_BYTE *, uint64_t))(v22 + 8);
      v65(v53, v6);
      *(_WORD *)(v62 + 12) = 2080;
      v66 = v22;
      v54((_BYTE *)v61, (uint64_t)v55, v88);
      v67 = sub_24A292E44();
      v90 = sub_24A26FA2C(v67, v68, (uint64_t *)&v91);
      sub_24A292FF4();
      v69 = v80;
      swift_bridgeObjectRelease();
      v70 = *(void (**)(_BYTE *, _BYTE *))(v79 + 8);
      v70(v55, v88);
      v71 = v84;
      _os_log_impl(&dword_24A26B000, v84, (os_log_type_t)v77, "updateResult from editor look identifier: %s compared to %s", (uint8_t *)v62, 0x16u);
      v72 = v78;
      swift_arrayDestroy();
      MEMORY[0x24BD0C57C](v72, -1, -1);
      v73 = v62;
      v56 = v88;
      MEMORY[0x24BD0C57C](v73, -1, -1);

      v22 = v66;
    }
    else
    {
      v65 = *(void (**)(_BYTE *, uint64_t))(v22 + 8);
      v65(v53, v6);
      v69 = v52;
      v70 = *(void (**)(_BYTE *, _BYTE *))(v79 + 8);
      v70(v55, v56);

    }
    v75 = v83;
    ((void (*)(uint64_t, NSObject *, uint64_t))v69)(v61, v83, v6);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v22 + 56))(v61, 0, 1, v6);
    static PosterDataLoader.compare(newData:with:)(v61, (uint64_t)v89, v87);
    v70((_BYTE *)v61, v56);
    return ((uint64_t (*)(NSObject *, uint64_t))v65)(v75, v6);
  }
}

uint64_t static PosterDataLoader.compare(newData:with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t TupleTypeMetadata2;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t);
  unsigned int (*v23)(char *, uint64_t, uint64_t);
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v31)(char *, char *, uint64_t);
  char *v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  char *v38;
  void (*v39)(char *, char *, uint64_t);
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint8_t *v47;
  void (*v48)(char *, uint64_t);
  uint64_t v49;
  void (*v50)(char *, uint64_t);
  void (*v51)(char *, char *, uint64_t);
  char *v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  uint64_t v57;
  char *v58;
  char *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  char *v63;

  v63 = a3;
  v6 = *(_QWORD *)(v3 + 80);
  v7 = *(_QWORD **)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](a1);
  v58 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v61 = (char *)&v58 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v60 = (char *)&v58 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v59 = (char *)&v58 - v14;
  v15 = sub_24A292FE8();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v17 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v19 = (char *)&v58 - v18;
  v20 = (char *)&v58 + *(int *)(v17 + 48) - v18;
  v21 = *(_QWORD *)(v15 - 8);
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 16);
  v22((char *)&v58 - v18, a1, v15);
  v22(v20, a2, v15);
  v23 = (unsigned int (*)(char *, uint64_t, uint64_t))v7[6];
  if (v23(v19, 1, v6) == 1)
  {
    if (qword_2544CE630 != -1)
      swift_once();
    v24 = sub_24A292D78();
    __swift_project_value_buffer(v24, (uint64_t)qword_2544CE7E0);
    v25 = sub_24A292D60();
    v26 = sub_24A292F64();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_24A26B000, v25, v26, "compare — newData nil", v27, 2u);
      MEMORY[0x24BD0C57C](v27, -1, -1);
    }

    v28 = *(_QWORD *)(v62 + 88);
    (*(void (**)(uint64_t, uint64_t))(v28 + 56))(v6, v28);
    type metadata accessor for PosterDataComparisonResult(0, v6, v28, v29);
    swift_storeEnumTagMultiPayload();
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v20, v15);
  }
  else if (v23(v20, 1, v6) == 1)
  {
    v31 = (void (*)(char *, char *, uint64_t))v7[4];
    v32 = v59;
    v31(v59, v19, v6);
    if (qword_2544CE630 != -1)
      swift_once();
    v33 = sub_24A292D78();
    __swift_project_value_buffer(v33, (uint64_t)qword_2544CE7E0);
    v34 = sub_24A292D60();
    v35 = sub_24A292F64();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_24A26B000, v34, v35, "compare — new data not nil; old data nil", v36, 2u);
      MEMORY[0x24BD0C57C](v36, -1, -1);
    }

    v31(v63, v32, v6);
    type metadata accessor for PosterDataComparisonResult(0, v6, *(_QWORD *)(v62 + 88), v37);
    return swift_storeEnumTagMultiPayload();
  }
  else
  {
    v38 = v20;
    v39 = (void (*)(char *, char *, uint64_t))v7[2];
    v40 = v60;
    v39(v60, v19, v6);
    v41 = v61;
    v39(v61, v38, v6);
    v42 = *(_QWORD *)(v62 + 88);
    if ((sub_24A292DFC() & 1) != 0)
    {
      if (qword_2544CE630 != -1)
        swift_once();
      v43 = sub_24A292D78();
      __swift_project_value_buffer(v43, (uint64_t)qword_2544CE7E0);
      v44 = sub_24A292D60();
      v45 = sub_24A292F64();
      if (os_log_type_enabled(v44, v45))
      {
        v46 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v46 = 0;
        _os_log_impl(&dword_24A26B000, v44, v45, "compare — new and old data are equal", v46, 2u);
        v47 = v46;
        v41 = v61;
        MEMORY[0x24BD0C57C](v47, -1, -1);
      }

      v48 = (void (*)(char *, uint64_t))v7[1];
      v48(v41, v6);
      v48(v40, v6);
      type metadata accessor for PosterDataComparisonResult(0, v6, v42, v49);
      swift_storeEnumTagMultiPayload();
      v48(v38, v6);
      return ((uint64_t (*)(char *, uint64_t))v48)(v19, v6);
    }
    else
    {
      v50 = (void (*)(char *, uint64_t))v7[1];
      v50(v41, v6);
      v50(v40, v6);
      v51 = (void (*)(char *, char *, uint64_t))v7[4];
      v52 = v58;
      v51(v58, v19, v6);
      if (qword_2544CE630 != -1)
        swift_once();
      v53 = sub_24A292D78();
      __swift_project_value_buffer(v53, (uint64_t)qword_2544CE7E0);
      v54 = sub_24A292D60();
      v55 = sub_24A292F64();
      if (os_log_type_enabled(v54, v55))
      {
        v56 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v56 = 0;
        _os_log_impl(&dword_24A26B000, v54, v55, "compare — new data different than old data", v56, 2u);
        MEMORY[0x24BD0C57C](v56, -1, -1);
      }

      v51(v63, v52, v6);
      type metadata accessor for PosterDataComparisonResult(0, v6, v42, v57);
      swift_storeEnumTagMultiPayload();
      return ((uint64_t (*)(char *, uint64_t))v50)(v38, v6);
    }
  }
}

uint64_t PosterDataLoader.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t PosterDataLoader.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_24A279B18()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for PosterDataLoader(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PosterDataLoader);
}

uint64_t method lookup function for PosterDataLoader()
{
  return swift_lookUpClassMethod();
}

ValueMetadata *type metadata accessor for WallpaperMetalCoordination()
{
  return &type metadata for WallpaperMetalCoordination;
}

unint64_t sub_24A279B74()
{
  uint64_t inited;
  unint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257920078);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24A294430;
  *(_QWORD *)(inited + 32) = 0x73646E756F62;
  *(_QWORD *)(inited + 40) = 0xE600000000000000;
  *(_QWORD *)(inited + 48) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEF8]), sel_init);
  *(_QWORD *)(inited + 56) = 0x6E6F697469736F70;
  *(_QWORD *)(inited + 64) = 0xE800000000000000;
  *(_QWORD *)(inited + 72) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEF8]), sel_init);
  *(_QWORD *)(inited + 80) = 0x6F50726F68636E61;
  *(_QWORD *)(inited + 88) = 0xEB00000000746E69;
  *(_QWORD *)(inited + 96) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEF8]), sel_init);
  *(_QWORD *)(inited + 104) = 0x73746E65746E6F63;
  *(_QWORD *)(inited + 112) = 0xE800000000000000;
  *(_QWORD *)(inited + 120) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEF8]), sel_init);
  result = sub_24A27CB54(inited);
  qword_2579226A0 = result;
  return result;
}

uint64_t sub_24A279C98()
{
  uint64_t result;

  type metadata accessor for WallpaperMetalCoordination.Resources();
  swift_allocObject();
  result = sub_24A279CD4();
  qword_2579226A8 = result;
  return result;
}

uint64_t sub_24A279CD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
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
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;

  v1 = v0;
  v2 = sub_24A292FA0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24A292F94();
  MEMORY[0x24BDAC7A8](v6);
  v25 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24A292DA8();
  MEMORY[0x24BDAC7A8](v8);
  v9 = sub_24A292D78();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MTLCreateSystemDefaultDevice();
  if (!v13)
    goto LABEL_5;
  v14 = v13;
  v24 = v3;
  v15 = objc_msgSend(v13, sel_newCommandQueue);
  if (!v15)
  {
    swift_unknownObjectRelease();
LABEL_5:
    type metadata accessor for WallpaperMetalCoordination.Resources();
    swift_deallocPartialClassInstance();
    return 0;
  }
  v16 = v15;
  *(_QWORD *)(v0 + OBJC_IVAR____TtCO26WatchFacesWallpaperSupport26WallpaperMetalCoordination9Resources_device) = v14;
  *(_QWORD *)(v0 + OBJC_IVAR____TtCO26WatchFacesWallpaperSupport26WallpaperMetalCoordination9Resources_commandQueue) = v15;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v23 = v2;
  v17 = sub_24A292E08();
  v22 = v5;
  v18 = (void *)v17;
  objc_msgSend(v16, sel_setLabel_, v17);

  sub_24A292D6C();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v0 + OBJC_IVAR____TtCO26WatchFacesWallpaperSupport26WallpaperMetalCoordination9Resources_log, v12, v9);
  sub_24A27AA58();
  sub_24A292D9C();
  v26 = MEMORY[0x24BEE4AF8];
  sub_24A26E220(&qword_257920088, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257920090);
  sub_24A27AA94();
  sub_24A293018();
  (*(void (**)(char *, _QWORD, uint64_t))(v24 + 104))(v22, *MEMORY[0x24BEE5750], v23);
  v19 = sub_24A292FC4();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  *(_QWORD *)(v1 + OBJC_IVAR____TtCO26WatchFacesWallpaperSupport26WallpaperMetalCoordination9Resources_snapshotQueue) = v19;
  return v1;
}

uint64_t sub_24A279FE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtCO26WatchFacesWallpaperSupport26WallpaperMetalCoordination9Resources_log;
  v2 = sub_24A292D78();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtCO26WatchFacesWallpaperSupport26WallpaperMetalCoordination9Resources_snapshotQueue));
  return swift_deallocClassInstance();
}

uint64_t sub_24A27A064()
{
  return type metadata accessor for WallpaperMetalCoordination.Resources();
}

uint64_t type metadata accessor for WallpaperMetalCoordination.Resources()
{
  uint64_t result;

  result = qword_25791FEC8;
  if (!qword_25791FEC8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24A27A0A8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24A292D78();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_24A27A12C(uint64_t a1, uint64_t a2, void *a3, void *a4, char *a5, double a6, double a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;

  v9 = v7;
  v16 = *a5;
  *(_QWORD *)(v7 + 16) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE5720]), sel_init);
  *(_QWORD *)(v7 + 24) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE56D0]), sel_init);
  *(_QWORD *)(v7 + 40) = 0;
  *(_BYTE *)(v7 + 48) = v16;
  if ((v16 & 1) != 0)
  {
    v17 = 0;
  }
  else
  {
    v22 = objc_msgSend((id)objc_opt_self(), sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 10, a1, a2, 0);
    objc_msgSend(v22, sel_setUsage_, 4);
    objc_msgSend(v22, sel_setStorageMode_, 2);
    v53 = MEMORY[0x24BEE4AF8];
    sub_24A2768B4(0, 3, 0);
    v17 = v53;
    v23 = sub_24A27A784(a1, a2, a3);
    if (v8)
    {
      swift_unknownObjectRelease();

      swift_release();
      type metadata accessor for WallpaperMetalCoordination.FloatingLayerManager();
      swift_deallocPartialClassInstance();
      return v9;
    }
    v25 = *(_QWORD *)(v53 + 16);
    v26 = *(_QWORD *)(v53 + 24);
    v27 = v25 + 1;
    if (v25 >= v26 >> 1)
    {
      v47 = v23;
      v50 = *(_QWORD *)(v53 + 16);
      v43 = v25 + 1;
      v45 = v24;
      sub_24A2768B4(v26 > 1, v25 + 1, 1);
      v23 = v47;
      v25 = v50;
      v27 = v43;
      v24 = v45;
      v17 = v53;
    }
    *(_QWORD *)(v17 + 16) = v27;
    v28 = v17 + 16 * v25;
    *(_QWORD *)(v28 + 32) = v23;
    *(_QWORD *)(v28 + 40) = v24;
    v29 = sub_24A27A784(a1, a2, a3);
    v31 = *(_QWORD *)(v17 + 16);
    v32 = *(_QWORD *)(v17 + 24);
    v33 = v31 + 1;
    if (v31 >= v32 >> 1)
    {
      v48 = v29;
      v51 = *(_QWORD *)(v17 + 16);
      v44 = v31 + 1;
      v46 = v30;
      sub_24A2768B4(v32 > 1, v31 + 1, 1);
      v29 = v48;
      v31 = v51;
      v33 = v44;
      v30 = v46;
    }
    *(_QWORD *)(v17 + 16) = v33;
    v34 = v17 + 16 * v31;
    *(_QWORD *)(v34 + 32) = v29;
    *(_QWORD *)(v34 + 40) = v30;
    v36 = sub_24A27A784(a1, a2, a3);
    v38 = v37;
    v39 = *(_QWORD *)(v17 + 16);
    v40 = *(_QWORD *)(v17 + 24);
    v41 = v39 + 1;
    if (v39 >= v40 >> 1)
    {
      v49 = *(_QWORD *)(v17 + 16);
      v52 = v39 + 1;
      sub_24A2768B4(v40 > 1, v39 + 1, 1);
      v39 = v49;
      v41 = v52;
    }
    *(_QWORD *)(v17 + 16) = v41;
    v42 = v17 + 16 * v39;
    *(_QWORD *)(v42 + 32) = v36;
    *(_QWORD *)(v42 + 40) = v38;

  }
  *(_QWORD *)(v9 + 32) = v17;
  v18 = *(void **)(v9 + 16);
  objc_msgSend(v18, sel_setSourceLayer_, a4);
  objc_msgSend(v18, sel_setPosition_, a6 * 0.5, a7 * 0.5);
  objc_msgSend(v18, sel_setBounds_, 0.0, 0.0, a6, a7);
  objc_msgSend(v18, sel_setAnchorPoint_, 0.0, 0.0);
  v19 = *(void **)(v9 + 24);
  objc_msgSend(v19, sel_setPosition_, 0.0, 0.0);
  objc_msgSend(v19, sel_setBounds_, 0.0, 0.0, a6, a7);
  v20 = v18;
  v21 = v19;
  objc_msgSend(v20, sel_setMask_, v21);

  swift_unknownObjectRelease();
  return v9;
}

uint64_t sub_24A27A4C8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  id v8;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 32);
  if (!v1)
    goto LABEL_10;
  v2 = *(_QWORD *)(v0 + 40);
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  v3 = *(_QWORD *)(v1 + 16);
  if (v2 >= v3)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    result = sub_24A2930D8();
    __break(1u);
    return result;
  }
  v4 = v1 + 16 * v2;
  v5 = *(_QWORD *)(v4 + 32);
  v6 = *(void **)(v4 + 40);
  if (v2 + 1 == v3)
    v7 = 0;
  else
    v7 = v2 + 1;
  *(_QWORD *)(v0 + 40) = v7;
  swift_unknownObjectRetain();
  v8 = v6;
  return v5;
}

uint64_t sub_24A27A58C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for WallpaperMetalCoordination.FloatingLayerManager()
{
  return objc_opt_self();
}

uint64_t getEnumTagSinglePayload for WallpaperMetalCoordination.Error(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for WallpaperMetalCoordination.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_24A27A6BC + 4 * byte_24A294445[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_24A27A6F0 + 4 * byte_24A294440[v4]))();
}

uint64_t sub_24A27A6F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A27A6F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A27A700);
  return result;
}

uint64_t sub_24A27A70C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A27A714);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_24A27A718(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A27A720(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WallpaperMetalCoordination.Error()
{
  return &type metadata for WallpaperMetalCoordination.Error;
}

unint64_t sub_24A27A740()
{
  unint64_t result;

  result = qword_257920058;
  if (!qword_257920058)
  {
    result = MEMORY[0x24BD0C4D4](&unk_24A294558, &type metadata for WallpaperMetalCoordination.Error);
    atomic_store(result, (unint64_t *)&qword_257920058);
  }
  return result;
}

void *sub_24A27A784(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t inited;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _BYTE *v23;
  _BYTE *v24;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257920060);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24A294430;
  v7 = (void *)*MEMORY[0x24BDD8D90];
  v8 = MEMORY[0x24BEE1768];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDD8D90];
  *(_QWORD *)(inited + 40) = a1;
  v9 = (void *)*MEMORY[0x24BDD8D58];
  *(_QWORD *)(inited + 64) = v8;
  *(_QWORD *)(inited + 72) = v9;
  *(_QWORD *)(inited + 80) = a2;
  v10 = (void *)*MEMORY[0x24BDD8D38];
  *(_QWORD *)(inited + 104) = v8;
  *(_QWORD *)(inited + 112) = v10;
  *(_QWORD *)(inited + 120) = 1;
  v11 = (void *)*MEMORY[0x24BDD8D60];
  *(_QWORD *)(inited + 144) = v8;
  *(_QWORD *)(inited + 152) = v11;
  *(_QWORD *)(inited + 184) = MEMORY[0x24BEE44F0];
  *(_DWORD *)(inited + 160) = 1093677112;
  v12 = v7;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  sub_24A27CC6C(inited);
  v16 = objc_allocWithZone(MEMORY[0x24BDD8DE8]);
  type metadata accessor for IOSurfacePropertyKey(0);
  sub_24A26E220(&qword_25791F8A8, (uint64_t (*)(uint64_t))type metadata accessor for IOSurfacePropertyKey, (uint64_t)&unk_24A293D0C);
  v17 = (void *)sub_24A292DB4();
  swift_bridgeObjectRelease();
  v18 = objc_msgSend(v16, sel_initWithProperties_, v17);

  if (v18)
  {
    v19 = (void *)objc_opt_self();
    v20 = v18;
    v21 = objc_msgSend(v19, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 10, a1, a2, 0);
    objc_msgSend(v21, sel_setUsage_, 4);
    objc_msgSend(v21, sel_setStorageMode_, 2);
    v22 = objc_msgSend(a3, sel_newTextureWithDescriptor_iosurface_plane_, v21, v20, 0);
    if (v22)
    {
      a3 = v22;
    }
    else
    {
      sub_24A27AA14();
      swift_allocError();
      *v24 = 4;
      swift_willThrow();

    }
  }
  else
  {
    sub_24A27AA14();
    swift_allocError();
    *v23 = 4;
    swift_willThrow();
  }
  return a3;
}

unint64_t sub_24A27AA14()
{
  unint64_t result;

  result = qword_257920070;
  if (!qword_257920070)
  {
    result = MEMORY[0x24BD0C4D4](&unk_24A294580, &type metadata for WallpaperMetalCoordination.Error);
    atomic_store(result, (unint64_t *)&qword_257920070);
  }
  return result;
}

unint64_t sub_24A27AA58()
{
  unint64_t result;

  result = qword_257920080;
  if (!qword_257920080)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257920080);
  }
  return result;
}

unint64_t sub_24A27AA94()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257920098;
  if (!qword_257920098)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257920090);
    result = MEMORY[0x24BD0C4D4](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_257920098);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD0C4C8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t WatchFacesWallpaperSupportFeatureFlags.isEnabled.getter()
{
  char *v0;
  char v1;
  char v2;
  _BYTE v4[24];
  ValueMetadata *v5;
  unint64_t v6;

  v1 = *v0;
  v5 = &type metadata for WatchFacesWallpaperSupportFeatureFlags;
  v6 = sub_24A27AB78();
  v4[0] = v1;
  v2 = sub_24A292D30();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  return v2 & 1;
}

unint64_t sub_24A27AB78()
{
  unint64_t result;

  result = qword_2579200A0;
  if (!qword_2579200A0)
  {
    result = MEMORY[0x24BD0C4D4](&protocol conformance descriptor for WatchFacesWallpaperSupportFeatureFlags, &type metadata for WatchFacesWallpaperSupportFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_2579200A0);
  }
  return result;
}

BOOL static WatchFacesWallpaperSupportFeatureFlags.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t WatchFacesWallpaperSupportFeatureFlags.hash(into:)()
{
  return sub_24A2931D4();
}

uint64_t WatchFacesWallpaperSupportFeatureFlags.hashValue.getter()
{
  sub_24A2931C8();
  sub_24A2931D4();
  return sub_24A2931E0();
}

const char *WatchFacesWallpaperSupportFeatureFlags.domain.getter()
{
  return "NanoTimeKit";
}

const char *WatchFacesWallpaperSupportFeatureFlags.feature.getter()
{
  _BYTE *v0;
  const char *v1;

  v1 = "catskill_poster";
  if (*v0 != 1)
    v1 = "rhizome";
  if (*v0)
    return v1;
  else
    return "extragalactic_poster";
}

const char *sub_24A27AC98()
{
  return "NanoTimeKit";
}

const char *sub_24A27ACAC()
{
  _BYTE *v0;
  const char *v1;

  v1 = "catskill_poster";
  if (*v0 != 1)
    v1 = "rhizome";
  if (*v0)
    return v1;
  else
    return "extragalactic_poster";
}

uint64_t PrivateFeatureFlags.isEnabled.getter()
{
  char *v0;
  char v1;
  char v2;
  _BYTE v4[24];
  ValueMetadata *v5;
  unint64_t v6;

  v1 = *v0;
  v5 = &type metadata for PrivateFeatureFlags;
  v6 = sub_24A27AD48();
  v4[0] = v1;
  v2 = sub_24A292D30();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  return v2 & 1;
}

unint64_t sub_24A27AD48()
{
  unint64_t result;

  result = qword_2579200A8;
  if (!qword_2579200A8)
  {
    result = MEMORY[0x24BD0C4D4](&protocol conformance descriptor for PrivateFeatureFlags, &type metadata for PrivateFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_2579200A8);
  }
  return result;
}

BOOL static PrivateFeatureFlags.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t PrivateFeatureFlags.hash(into:)()
{
  return sub_24A2931D4();
}

uint64_t PrivateFeatureFlags.hashValue.getter()
{
  sub_24A2931C8();
  sub_24A2931D4();
  return sub_24A2931E0();
}

BOOL sub_24A27AE10(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

const char *PrivateFeatureFlags.domain.getter()
{
  return "NanoTimeKitExtras";
}

const char *PrivateFeatureFlags.feature.getter()
{
  _BYTE *v0;

  if (*v0)
    return "rhizome_design_tweaks";
  else
    return "catskill_design_tweaks";
}

unint64_t sub_24A27AE6C()
{
  unint64_t result;

  result = qword_2579200B0;
  if (!qword_2579200B0)
  {
    result = MEMORY[0x24BD0C4D4](&protocol conformance descriptor for WatchFacesWallpaperSupportFeatureFlags, &type metadata for WatchFacesWallpaperSupportFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_2579200B0);
  }
  return result;
}

unint64_t sub_24A27AEB4()
{
  unint64_t result;

  result = qword_2579200B8;
  if (!qword_2579200B8)
  {
    result = MEMORY[0x24BD0C4D4](&protocol conformance descriptor for PrivateFeatureFlags, &type metadata for PrivateFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_2579200B8);
  }
  return result;
}

const char *sub_24A27AEF8()
{
  return "NanoTimeKitExtras";
}

const char *sub_24A27AF0C()
{
  _BYTE *v0;

  if (*v0)
    return "rhizome_design_tweaks";
  else
    return "catskill_design_tweaks";
}

uint64_t storeEnumTagSinglePayload for WatchFacesWallpaperSupportFeatureFlags(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A27AF84 + 4 * byte_24A2945D5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_24A27AFB8 + 4 * byte_24A2945D0[v4]))();
}

uint64_t sub_24A27AFB8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A27AFC0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A27AFC8);
  return result;
}

uint64_t sub_24A27AFD4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A27AFDCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24A27AFE0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A27AFE8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WatchFacesWallpaperSupportFeatureFlags()
{
  return &type metadata for WatchFacesWallpaperSupportFeatureFlags;
}

uint64_t getEnumTagSinglePayload for WallpaperMetalRenderingFloatingLayerStyle(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PrivateFeatureFlags(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A27B0E0 + 4 * byte_24A2945DF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24A27B114 + 4 * byte_24A2945DA[v4]))();
}

uint64_t sub_24A27B114(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A27B11C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A27B124);
  return result;
}

uint64_t sub_24A27B130(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A27B138);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24A27B13C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A27B144(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_24A27B150(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PrivateFeatureFlags()
{
  return &type metadata for PrivateFeatureFlags;
}

uint64_t sub_24A27B16C()
{
  uint64_t v0;

  v0 = sub_24A292D78();
  __swift_allocate_value_buffer(v0, qword_2579200C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2579200C0);
  return sub_24A292D6C();
}

uint64_t static Logger.rotationAnimator.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_25791F7E0 != -1)
    swift_once();
  v2 = sub_24A292D78();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2579200C0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_24A27B25C()
{
  uint64_t v0;

  swift_beginAccess();
  return MEMORY[0x24BD0C63C](v0 + 16);
}

uint64_t sub_24A27B2A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 24) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_24A27B300(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  v4 = MEMORY[0x24BD0C63C](v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v3[3] = v4;
  v3[4] = v5;
  return sub_24A26E758;
}

uint64_t sub_24A27B36C()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 32);
}

uint64_t sub_24A27B39C(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_QWORD *)(v1 + 32) = a1;
  return result;
}

uint64_t (*sub_24A27B3D8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

float sub_24A27B414()
{
  uint64_t v0;

  swift_beginAccess();
  return *(float *)(v0 + 40);
}

uint64_t sub_24A27B444(float a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(float *)(v1 + 40) = a1;
  return result;
}

uint64_t (*sub_24A27B480())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24A27B4BC()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 88);
}

uint64_t sub_24A27B4EC(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 88) = a1;
  return result;
}

uint64_t (*sub_24A27B528())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t PosterRotationAnimator.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  PosterRotationAnimator.init()();
  return v0;
}

void *PosterRotationAnimator.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *result;
  uint64_t v7;
  void *v8;
  id v9;

  v1 = v0;
  *(_QWORD *)(v0 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v0 + 32) = 0;
  *(_DWORD *)(v0 + 40) = 0;
  *(_QWORD *)(v0 + 48) = 0;
  type metadata accessor for DisplayLink();
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v2 + 32) = 0;
  v3 = objc_msgSend((id)objc_opt_self(), sel_displayLinkWithTarget_selector_, v2, sel__displayLinkFired);
  v4 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = v3;

  *(_QWORD *)(v1 + 56) = v2;
  type metadata accessor for RendererTokenManager();
  *(_QWORD *)(v1 + 64) = 0;
  *(_QWORD *)(v1 + 72) = 0;
  swift_allocObject();
  *(_QWORD *)(v1 + 80) = sub_24A2718E0();
  *(_BYTE *)(v1 + 88) = 0;
  v5 = *(_QWORD *)(v1 + 56);
  swift_beginAccess();
  *(_QWORD *)(v5 + 24) = &protocol witness table for PosterRotationAnimator;
  swift_unknownObjectWeakAssign();
  result = *(void **)(v5 + 32);
  if (result)
  {
    objc_msgSend(result, sel_setPaused_, 1);
    v7 = *(_QWORD *)(v1 + 56);
    v8 = (void *)objc_opt_self();
    swift_retain();
    v9 = objc_msgSend(v8, sel_currentRunLoop);
    result = *(void **)(v7 + 32);
    if (result)
    {
      objc_msgSend(result, sel_addToRunLoop_forMode_, v9, *MEMORY[0x24BDBCB80]);
      swift_release();

      return (void *)v1;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void *PosterRotationAnimator.deinit()
{
  uint64_t v0;
  void *result;

  result = *(void **)(*(_QWORD *)(v0 + 56) + 32);
  if (result)
  {
    objc_msgSend(result, sel_invalidate);
    swift_retain();
    sub_24A27156C();
    swift_release();
    sub_24A26EC1C(v0 + 16);
    swift_release();

    swift_release();
    return (void *)v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *PosterRotationAnimator.__deallocating_deinit()
{
  uint64_t v0;
  void *result;

  result = *(void **)(*(_QWORD *)(v0 + 56) + 32);
  if (result)
  {
    objc_msgSend(result, sel_invalidate);
    swift_retain();
    sub_24A27156C();
    swift_release();
    sub_24A26EC1C(v0 + 16);
    swift_release();

    swift_release();
    return (void *)swift_deallocClassInstance();
  }
  else
  {
    __break(1u);
  }
  return result;
}

BOOL sub_24A27B828(void *a1, void *a2)
{
  id v4;

  v4 = objc_msgSend(objc_msgSend(a1, sel_environment), sel_deviceOrientation);
  swift_unknownObjectRelease();
  return sub_24A27B8F4(a2, (uint64_t)v4, a1);
}

BOOL sub_24A27B894(void *a1, void *a2)
{
  id v3;

  v3 = objc_msgSend(objc_msgSend(a1, sel_environment), sel_deviceOrientation);
  swift_unknownObjectRelease();
  return sub_24A27B8F4(a2, (uint64_t)v3, 0);
}

BOOL sub_24A27B8F4(void *a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  void *v14;
  double v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  float v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t ObjectType;
  void *v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45[3];
  double v46;

  v4 = v3;
  v8 = sub_24A292D78();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v12 = *(_QWORD *)(v4 + 32);
  if (v12 == a2)
    return v12 != a2;
  v46 = 0.0;
  if (a1)
  {
    v13 = objc_msgSend(a1, sel_animationSettings);
    if (v13)
    {
      v14 = v13;
      objc_msgSend(v13, sel_duration);
      v46 = v15;
      v16 = objc_msgSend(v14, sel_timingFunction);
      if (!v16)
        v16 = objc_msgSend((id)objc_opt_self(), sel_functionWithName_, *MEMORY[0x24BDE5D20]);
      v17 = *(void **)(v4 + 72);
      *(_QWORD *)(v4 + 72) = v16;

    }
  }
  v43 = a3;
  if (qword_25791F7C8 != -1)
    swift_once();
  v18 = __swift_project_value_buffer(v8, (uint64_t)qword_25791FD60);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v18, v8);
  v19 = *(_QWORD *)&v46;
  v20 = sub_24A292D60();
  v21 = sub_24A292F7C();
  if (os_log_type_enabled(v20, v21))
  {
    v41 = v12;
    v22 = a2;
    v23 = swift_slowAlloc();
    v40 = swift_slowAlloc();
    v45[0] = v40;
    *(_DWORD *)v23 = 136315394;
    v42 = v22;
    v24 = 0xD000000000000014;
    v25 = 0x800000024A2984D0;
    switch(v22)
    {
      case 1:
        v25 = 0xE800000000000000;
        v24 = 0x7469617274726F50;
        break;
      case 2:
        break;
      case 3:
        v25 = 0xEF74686769522065;
        goto LABEL_16;
      case 4:
        v25 = 0xEE007466654C2065;
LABEL_16:
        v24 = 0x70616373646E614CLL;
        break;
      default:
        v25 = 0x800000024A2984B0;
        break;
    }
    v44 = sub_24A26FA2C(v24, v25, v45);
    sub_24A292FF4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v23 + 12) = 2048;
    v44 = v19;
    sub_24A292FF4();
    _os_log_impl(&dword_24A26B000, v20, v21, "Poster requested rotation to %s with duration: %f", (uint8_t *)v23, 0x16u);
    v26 = v40;
    swift_arrayDestroy();
    MEMORY[0x24BD0C57C](v26, -1, -1);
    MEMORY[0x24BD0C57C](v23, -1, -1);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    v12 = v41;
    a2 = v42;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  v27 = v43;
  swift_beginAccess();
  if (v46 > 0.00001)
  {
    v28 = v46;
    swift_beginAccess();
    *(float *)(v4 + 40) = v28;
    *(CFTimeInterval *)(v4 + 48) = CACurrentMediaTime();
    v29 = *(void **)(*(_QWORD *)(v4 + 56) + 32);
    if (v29)
    {
      objc_msgSend(v29, sel_setPaused_, 0);
      *(_QWORD *)(v4 + 64) = a2;
      swift_beginAccess();
      *(_BYTE *)(v4 + 88) = 1;
      if (v27)
      {
        v30 = qword_2579200D8;
        v31 = unk_2579200E0;
        v32 = v27;
        swift_retain();
        swift_bridgeObjectRetain();
        sub_24A271BB4(v32, v30, v31);

        swift_release();
        swift_bridgeObjectRelease();
      }
      return v12 != a2;
    }
    __break(1u);
LABEL_28:
    __break(1u);
    JUMPOUT(0x24A27BE30);
  }
  v33 = *(void **)(*(_QWORD *)(v4 + 56) + 32);
  if (!v33)
    goto LABEL_28;
  objc_msgSend(v33, sel_setPaused_, 1, v46);
  v34 = qword_2579200D8;
  v35 = unk_2579200E0;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_24A271ED8(v34, v35);
  swift_release();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v4 + 32) = a2;
  swift_beginAccess();
  if (MEMORY[0x24BD0C63C](v4 + 16))
  {
    v36 = *(_QWORD *)(v4 + 24);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(a2, ObjectType, v36);
    swift_unknownObjectRelease();
  }
  v38 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = 0;

  swift_beginAccess();
  *(_BYTE *)(v4 + 88) = 0;
  return v12 != a2;
}

void *PosterRotationAnimator.displayLinkFired(displayLink:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  float v4;
  double v5;
  float v6;
  void *v7;
  float v8;
  void *result;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = v1;
  v4 = CACurrentMediaTime() - *(double *)(v1 + 48);
  swift_beginAccess();
  if ((float)(v4 / *(float *)(v1 + 40)) <= 1.0)
    v6 = v4 / *(float *)(v1 + 40);
  else
    v6 = 1.0;
  v7 = *(void **)(v1 + 72);
  if (v7)
  {
    *(float *)&v5 = v6;
    objc_msgSend(v7, sel__solveForInput_, v5);
    v6 = v8;
  }
  swift_beginAccess();
  result = (void *)MEMORY[0x24BD0C63C](v1 + 16);
  if (result)
  {
    v10 = *(_QWORD *)(v1 + 24);
    ObjectType = swift_getObjectType();
    swift_beginAccess();
    (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t, float))(v10 + 8))(*(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 64), ObjectType, v10, v6);
    result = (void *)swift_unknownObjectRelease();
  }
  if (*(float *)(v1 + 40) <= v4)
  {
    v12 = *(_QWORD *)(v1 + 64);
    swift_beginAccess();
    *(_QWORD *)(v2 + 32) = v12;
    *(_QWORD *)(v2 + 64) = 0;
    result = *(void **)(a1 + 32);
    if (result)
    {
      objc_msgSend(result, sel_setPaused_, 1);
      swift_beginAccess();
      *(_BYTE *)(v2 + 88) = 0;
      v13 = qword_2579200D8;
      v14 = unk_2579200E0;
      swift_retain();
      swift_bridgeObjectRetain();
      sub_24A271ED8(v13, v14);
      swift_release();
      swift_bridgeObjectRelease();
      result = (void *)MEMORY[0x24BD0C63C](v2 + 16);
      if (result)
      {
        v15 = *(_QWORD *)(v2 + 24);
        v16 = swift_getObjectType();
        (*(void (**)(_QWORD, uint64_t, uint64_t))(v15 + 16))(*(_QWORD *)(v2 + 32), v16, v15);
        return (void *)swift_unknownObjectRelease();
      }
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_24A27C020@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v3 = *a1;
  v4 = *a1 + 16;
  swift_beginAccess();
  result = MEMORY[0x24BD0C63C](v4);
  v6 = *(_QWORD *)(v3 + 24);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_24A27C078(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 24) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_24A27C0D0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 32);
  return result;
}

uint64_t sub_24A27C114(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = swift_beginAccess();
  *(_QWORD *)(v3 + 32) = v2;
  return result;
}

float sub_24A27C154@<S0>(uint64_t *a1@<X0>, float *a2@<X8>)
{
  uint64_t v3;
  float result;

  v3 = *a1;
  swift_beginAccess();
  result = *(float *)(v3 + 40);
  *a2 = result;
  return result;
}

uint64_t sub_24A27C198(int *a1, uint64_t *a2)
{
  int v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = swift_beginAccess();
  *(_DWORD *)(v3 + 40) = v2;
  return result;
}

uint64_t sub_24A27C1E0@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_BYTE *)(v3 + 88);
  return result;
}

uint64_t sub_24A27C224(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = swift_beginAccess();
  *(_BYTE *)(v3 + 88) = v2;
  return result;
}

uint64_t dispatch thunk of PosterRotationAnimatorDelegate.rotating(progress:fromOrientation:toOrientation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of PosterRotationAnimatorDelegate.didRotate(orientation:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t type metadata accessor for PosterRotationAnimator()
{
  return objc_opt_self();
}

uint64_t method lookup function for PosterRotationAnimator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PosterRotationAnimator.delegate.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of PosterRotationAnimator.delegate.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of PosterRotationAnimator.delegate.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of PosterRotationAnimator.orientation.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of PosterRotationAnimator.orientation.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of PosterRotationAnimator.orientation.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of PosterRotationAnimator.rotationDuration.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of PosterRotationAnimator.rotationDuration.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of PosterRotationAnimator.rotationDuration.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of PosterRotationAnimator.isRotating.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of PosterRotationAnimator.isRotating.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of PosterRotationAnimator.isRotating.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of PosterRotationAnimator.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 368))();
}

uint64_t dispatch thunk of PosterRotationAnimator.startIfNeeded(renderer:transition:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of PosterRotationAnimator.startIfNeeded(editor:transition:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t FloatingPoint.reverse.getter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  swift_getAssociatedConformanceWitness();
  sub_24A293168();
  sub_24A293144();
  sub_24A2930E4();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, a1);
}

uint64_t FloatingPoint.smoothstep.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v20;
  char *v21;
  void (*v22)(char *, uint64_t);
  char *v23;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;

  v30 = a3;
  v25 = *(_QWORD *)(*(_QWORD *)(a2 + 16) + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v28 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v29 = *(_QWORD *)(a1 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v25 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v25 - v16;
  v18 = MEMORY[0x24BDAC7A8](v15);
  v27 = (char *)&v25 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v25 - v20;
  v26 = v3;
  sub_24A292F4C();
  swift_getAssociatedConformanceWitness();
  sub_24A293168();
  sub_24A293144();
  sub_24A293168();
  sub_24A293144();
  sub_24A292F4C();
  v22 = *(void (**)(char *, uint64_t))(v29 + 8);
  v22(v11, a1);
  v23 = v27;
  sub_24A2930E4();
  v22(v14, a1);
  v22(v17, a1);
  sub_24A292F4C();
  v22(v23, a1);
  return ((uint64_t (*)(char *, uint64_t))v22)(v21, a1);
}

uint64_t FloatingPoint.toRadians.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, uint64_t);
  _QWORD v17[3];

  v17[1] = a3;
  v17[2] = *(_QWORD *)(*(_QWORD *)(a2 + 16) + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v6 = *(_QWORD *)(a1 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)v17 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v17 - v13;
  sub_24A292DF0();
  swift_getAssociatedConformanceWitness();
  sub_24A293168();
  sub_24A293144();
  sub_24A292DE4();
  v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  v15(v9, a1);
  v15(v12, a1);
  sub_24A292F4C();
  return ((uint64_t (*)(char *, uint64_t))v15)(v14, a1);
}

uint64_t FloatingPoint.toDegrees.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, uint64_t);
  uint64_t v16;

  v16 = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v4 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v5 = *(_QWORD *)(a1 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v16 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v16 - v12;
  swift_getAssociatedConformanceWitness();
  sub_24A293168();
  sub_24A293144();
  sub_24A292DF0();
  sub_24A292DE4();
  v14 = *(void (**)(char *, uint64_t))(v5 + 8);
  v14(v8, a1);
  v14(v11, a1);
  sub_24A292F4C();
  return ((uint64_t (*)(char *, uint64_t))v14)(v13, a1);
}

Swift::Double __swiftcall Double.truncate(to:)(Swift::Int to)
{
  double v1;
  double v2;
  double v3;

  v2 = v1;
  v3 = __exp10((double)to);
  return floor(v3 * v2) / v3;
}

Swift::Float __swiftcall Float.truncate(to:)(Swift::Int to)
{
  float v1;
  float v2;
  float v3;

  v2 = v1;
  v3 = __exp10f((float)to);
  return floorf(v3 * v2) / v3;
}

unint64_t sub_24A27CB48(uint64_t a1)
{
  return sub_24A27CEBC(a1, &qword_2579202C8);
}

unint64_t sub_24A27CB54(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257920280);
  v2 = (_QWORD *)sub_24A293114();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    result = sub_24A2852AC(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
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

unint64_t sub_24A27CC6C(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257920210);
  v2 = sub_24A293114();
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
    sub_24A27ED2C(v6, (uint64_t)&v13, &qword_257920218);
    v7 = v13;
    result = sub_24A285310(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_24A27EB24(&v14, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_24A27CD98(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579202C0);
  v2 = (_QWORD *)sub_24A293114();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (id *)(a1 + 40);
  while (1)
  {
    v5 = *(v4 - 1);
    v6 = *v4;
    v7 = *v4;
    v8 = v5;
    result = sub_24A285390((uint64_t)v8);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = 8 * result;
    *(_QWORD *)(v2[6] + v11) = v8;
    *(_QWORD *)(v2[7] + v11) = v6;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v4 += 2;
    v2[2] = v14;
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

unint64_t sub_24A27CE98(uint64_t a1)
{
  return sub_24A27CEBC(a1, &qword_2579202A0);
}

unint64_t sub_24A27CEA4(uint64_t a1)
{
  return sub_24A27CEBC(a1, (uint64_t *)&unk_257920290);
}

unint64_t sub_24A27CEB0(uint64_t a1)
{
  return sub_24A27CEBC(a1, &qword_2579201F0);
}

unint64_t sub_24A27CEBC(uint64_t a1, uint64_t *a2)
{
  _QWORD *v3;
  uint64_t v4;
  void **v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v3 = (_QWORD *)sub_24A293114();
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  v5 = (void **)(a1 + 48);
  while (1)
  {
    v6 = (uint64_t)*(v5 - 2);
    v7 = (uint64_t)*(v5 - 1);
    v8 = *v5;
    swift_bridgeObjectRetain();
    v9 = v8;
    result = sub_24A2852AC(v6, v7);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = (uint64_t *)(v3[6] + 16 * result);
    *v12 = v6;
    v12[1] = v7;
    *(_QWORD *)(v3[7] + 8 * result) = v9;
    v13 = v3[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v3[2] = v15;
    v5 += 3;
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

unint64_t sub_24A27CFD0(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257920200);
  v2 = sub_24A293114();
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
    sub_24A27ED2C(v6, (uint64_t)&v13, &qword_257920208);
    v7 = v13;
    result = sub_24A285418(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_24A27EB24(&v14, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t SnapshotManager.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  *(_QWORD *)(v0 + 24) = sub_24A27CD98(MEMORY[0x24BEE4AF8]);
  return v0;
}

uint64_t SnapshotManager.init()()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  *(_QWORD *)(v0 + 24) = sub_24A27CD98(MEMORY[0x24BEE4AF8]);
  return v0;
}

uint64_t sub_24A27D1A8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  _QWORD v26[3];

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579201F8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v26[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *a1;
  v11 = a1[1];
  v25 = a1[2];
  v12 = objc_msgSend(*(id *)(v3 + 16), sel_URLsForDirectory_inDomains_, 13, 1);
  v13 = sub_24A292C4C();
  v14 = sub_24A292ED4();

  v15 = *(_QWORD *)(v13 - 8);
  if (*(_QWORD *)(v14 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v9, v14 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80)), v13);
    v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
    v16(v9, 0, 1, v13);
  }
  else
  {
    v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
    v16(v9, 1, 1, v13);
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v9, 1, v13) == 1)
  {
    sub_24A27EAE4((uint64_t)v9);
    v17 = 1;
  }
  else
  {
    v18 = a2[3];
    v19 = a2;
    v20 = a3;
    v21 = v11;
    v22 = v10;
    v23 = v19[4];
    __swift_project_boxed_opaque_existential_0(v19, v18);
    v26[0] = v22;
    v26[1] = v21;
    a3 = v20;
    v26[2] = v25;
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(v23 + 16))(v26, v18, v23);
    sub_24A292C34();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v9, v13);
    v17 = 0;
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v16)(a3, v17, 1, v13);
}

id sub_24A27D388(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v5;
  uint64_t v6;

  v2 = a1[1];
  v3 = a1[2];
  *(_QWORD *)&v5 = *a1;
  *((_QWORD *)&v5 + 1) = v2;
  v6 = v3;
  if (v2 < 0)
    return sub_24A27DB28(&v5, a2);
  else
    return sub_24A27D3D0((uint64_t *)&v5, a2);
}

id sub_24A27D3D0(uint64_t *a1, _QWORD *a2)
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
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  char *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  char *v41;
  uint64_t v42;
  _QWORD *v43;
  id v44;
  void *v45;
  id v46;
  NSObject *v47;
  NSObject *v48;
  os_log_type_t v49;
  _BOOL4 v50;
  uint8_t *v51;
  NSObject *v52;
  _QWORD *v53;
  uint8_t *v54;
  _QWORD *v55;
  NSObject *v56;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  char *v61;
  NSObject *v62;
  _QWORD v63[3];
  uint64_t v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579201F8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24A292C4C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v60 = (uint64_t *)((char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v9);
  v61 = (char *)&v58 - v11;
  v13 = *a1;
  v12 = a1[1];
  v14 = a1[2];
  v15 = a2[3];
  v16 = a2[4];
  __swift_project_boxed_opaque_existential_0(a2, v15);
  v65 = v13;
  v66 = v12;
  v67 = v14;
  v17 = (*(uint64_t (**)(NSObject **, uint64_t, uint64_t))(v16 + 8))(&v65, v15, v16);
  v59 = v13;
  v65 = v13;
  v18 = v12;
  v19 = v8;
  v66 = v18;
  v67 = v14;
  sub_24A27D1A8((uint64_t *)&v65, a2, (uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_24A27EAE4((uint64_t)v6);
    if (qword_25791F800 != -1)
      swift_once();
    v20 = sub_24A292D78();
    __swift_project_value_buffer(v20, (uint64_t)qword_257920728);
    sub_24A27ED70((uint64_t)a2, (uint64_t)&v65);
    v21 = sub_24A292D60();
    v22 = sub_24A292F64();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      v64 = v24;
      v62 = v17;
      *(_DWORD *)v23 = 136315138;
      v61 = (char *)(v23 + 4);
      v25 = v68;
      v26 = v69;
      __swift_project_boxed_opaque_existential_0(&v65, v68);
      v63[0] = v59;
      v63[1] = v18;
      v63[2] = v14;
      v27 = (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v26 + 16))(v63, v25, v26);
      v63[0] = sub_24A26FA2C(v27, v28, &v64);
      sub_24A292FF4();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v65);
      _os_log_impl(&dword_24A26B000, v21, v22, "_cachedOnDiskSnapshot: Could not generate URL for snapshotFilename: %s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BD0C57C](v24, -1, -1);
      MEMORY[0x24BD0C57C](v23, -1, -1);

    }
    else
    {

      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v65);
    }

    return 0;
  }
  v29 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v30 = v61;
  v29(v61, v6, v7);
  if (qword_25791F800 != -1)
    swift_once();
  v62 = v17;
  v31 = sub_24A292D78();
  v32 = __swift_project_value_buffer(v31, (uint64_t)qword_257920728);
  v33 = v60;
  (*(void (**)(_QWORD *, char *, uint64_t))(v19 + 16))(v60, v30, v7);
  v59 = v32;
  v34 = sub_24A292D60();
  v35 = sub_24A292F64();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = (uint8_t *)swift_slowAlloc();
    v37 = swift_slowAlloc();
    v65 = v37;
    *(_DWORD *)v36 = 136315138;
    sub_24A27EDB4();
    v38 = sub_24A293138();
    v63[0] = sub_24A26FA2C(v38, v39, (uint64_t *)&v65);
    sub_24A292FF4();
    swift_bridgeObjectRelease();
    v40 = v33;
    v41 = *(char **)(v19 + 8);
    ((void (*)(_QWORD *, uint64_t))v41)(v40, v7);
    _os_log_impl(&dword_24A26B000, v34, v35, "_cachedOnDiskSnapshot: Looking for snapshot at URL: %s", v36, 0xCu);
    swift_arrayDestroy();
    v42 = v37;
    v30 = v61;
    MEMORY[0x24BD0C57C](v42, -1, -1);
    MEMORY[0x24BD0C57C](v36, -1, -1);
  }
  else
  {
    v43 = v33;
    v41 = *(char **)(v19 + 8);
    ((void (*)(_QWORD *, uint64_t))v41)(v43, v7);
  }

  sub_24A292C40();
  v44 = objc_allocWithZone(MEMORY[0x24BEBD640]);
  v45 = (void *)sub_24A292E08();
  swift_bridgeObjectRelease();
  v46 = objc_msgSend(v44, sel_initWithContentsOfFile_, v45);

  v47 = v62;
  v48 = sub_24A292D60();
  v49 = sub_24A292F64();
  v62 = v48;
  v50 = os_log_type_enabled(v48, v49);
  if (!v46)
  {
    if (v50)
    {
      v61 = v41;
      v54 = (uint8_t *)swift_slowAlloc();
      v55 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v54 = 138543362;
      v65 = v47;
      v56 = v47;
      v41 = v61;
      sub_24A292FF4();
      *v55 = v47;

      _os_log_impl(&dword_24A26B000, v62, v49, "_cachedOnDiskSnapshot: No snapshot found on disk for key=%{public}@", v54, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2579202A8);
      swift_arrayDestroy();
      MEMORY[0x24BD0C57C](v55, -1, -1);
      MEMORY[0x24BD0C57C](v54, -1, -1);
    }
    else
    {

    }
    ((void (*)(char *, uint64_t))v41)(v30, v7);
    return 0;
  }
  if (v50)
  {
    v51 = (uint8_t *)swift_slowAlloc();
    v60 = (_QWORD *)swift_slowAlloc();
    v61 = (char *)v7;
    *(_DWORD *)v51 = 138543362;
    v65 = v47;
    v52 = v47;
    sub_24A292FF4();
    v53 = v60;
    *v60 = v47;

    _os_log_impl(&dword_24A26B000, v62, v49, "_cachedOnDiskSnapshot: Found cached snapshot on disk for key=%{public}@", v51, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579202A8);
    swift_arrayDestroy();
    v7 = (uint64_t)v61;
    MEMORY[0x24BD0C57C](v53, -1, -1);
    MEMORY[0x24BD0C57C](v51, -1, -1);
  }
  else
  {

  }
  ((void (*)(char *, uint64_t))v41)(v30, v7);
  return v46;
}

void *sub_24A27DB28(__int128 *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  char v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  _QWORD *v23;
  NSObject *v24;
  __int128 v26;
  _QWORD *v27;
  __int128 v28;
  uint64_t v29;

  v26 = *a1;
  v3 = *((_QWORD *)a1 + 2);
  v4 = a2[3];
  v5 = a2[4];
  __swift_project_boxed_opaque_existential_0(a2, v4);
  v28 = v26;
  v29 = v3;
  v6 = (void *)(*(uint64_t (**)(__int128 *, uint64_t, uint64_t))(v5 + 8))(&v28, v4, v5);
  swift_beginAccess();
  v7 = *(_QWORD *)(v2 + 24);
  if (*(_QWORD *)(v7 + 16))
  {
    v8 = v6;
    swift_bridgeObjectRetain();
    v9 = sub_24A285390((uint64_t)v8);
    if ((v10 & 1) != 0)
    {
      v11 = *(void **)(*(_QWORD *)(v7 + 56) + 8 * v9);
      v12 = v11;

      swift_bridgeObjectRelease();
      if (qword_25791F800 != -1)
        swift_once();
      v13 = sub_24A292D78();
      __swift_project_value_buffer(v13, (uint64_t)qword_257920728);
      v14 = v8;
      v15 = sub_24A292D60();
      v16 = sub_24A292F64();
      if (os_log_type_enabled(v15, v16))
      {
        v17 = (uint8_t *)swift_slowAlloc();
        v27 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v17 = 138543362;
        v18 = v14;
        sub_24A292FF4();
        *v27 = v14;

        _os_log_impl(&dword_24A26B000, v15, v16, "_cachedInMemorySnapshot: Found cached snapshot in memory for key=%{public}@", v17, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2579202A8);
        swift_arrayDestroy();
        MEMORY[0x24BD0C57C](v27, -1, -1);
        MEMORY[0x24BD0C57C](v17, -1, -1);
      }
      else
      {

        v15 = v14;
      }
      goto LABEL_14;
    }

    swift_bridgeObjectRelease();
  }
  if (qword_25791F800 != -1)
    swift_once();
  v19 = sub_24A292D78();
  __swift_project_value_buffer(v19, (uint64_t)qword_257920728);
  v20 = v6;
  v15 = sub_24A292D60();
  v21 = sub_24A292F64();
  if (os_log_type_enabled(v15, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    v23 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v22 = 138543362;
    v24 = v20;
    sub_24A292FF4();
    *v23 = v20;

    _os_log_impl(&dword_24A26B000, v15, v21, "_cachedInMemorySnapshot: No snapshot found in memory for key=%{public}@", v22, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579202A8);
    swift_arrayDestroy();
    MEMORY[0x24BD0C57C](v23, -1, -1);
    MEMORY[0x24BD0C57C](v22, -1, -1);
    v11 = 0;
  }
  else
  {

    v11 = 0;
    v15 = v20;
  }
LABEL_14:

  return v11;
}

void sub_24A27DEC0(UIImage *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  v3 = a2[1];
  v4 = a2[2];
  *(_QWORD *)&v5 = *a2;
  *((_QWORD *)&v5 + 1) = v3;
  v6 = v4;
  if (v3 < 0)
    sub_24A27DF08(a1, &v5, a3);
  else
    sub_24A27DFF4(a1, (uint64_t *)&v5, a3);
}

void sub_24A27DF08(void *a1, __int128 *a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  char isUniquelyReferenced_nonNull_native;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;

  v4 = v3;
  v13 = *a2;
  v6 = *((_QWORD *)a2 + 2);
  v7 = a3[3];
  v8 = a3[4];
  __swift_project_boxed_opaque_existential_0(a3, v7);
  v15 = v13;
  v16 = v6;
  v9 = (void *)(*(uint64_t (**)(__int128 *, uint64_t, uint64_t))(v8 + 8))(&v15, v7, v8);
  swift_beginAccess();
  v10 = v9;
  v11 = a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v14 = *(_QWORD *)(v4 + 24);
  *(_QWORD *)(v4 + 24) = 0x8000000000000000;
  sub_24A286908((uint64_t)a1, v10, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v4 + 24) = v14;

  swift_bridgeObjectRelease();
  swift_endAccess();

}

uint64_t sub_24A27DFF4(UIImage *a1, uint64_t *a2, _QWORD *a3)
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
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  NSData *v37;
  NSData *v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  id v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  _QWORD *v46;
  id v47;
  id v48;
  NSObject *v49;
  os_log_type_t v50;
  uint64_t v52;
  uint8_t *v53;
  _QWORD *v54;
  id v55;
  _QWORD *v56;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  UIImage *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;

  v62 = a1;
  v68 = sub_24A292C4C();
  v70 = *(_QWORD *)(v68 - 8);
  MEMORY[0x24BDAC7A8](v68);
  v67 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24A292D78();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v69 = (uint64_t)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579201F8);
  v9 = MEMORY[0x24BDAC7A8](v61);
  v66 = (unint64_t)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v60 = (uint64_t)&v58 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v64 = (uint64_t)&v58 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v58 - v15;
  v17 = *a2;
  v18 = a2[1];
  v19 = a2[2];
  v20 = a3[3];
  v21 = a3[4];
  __swift_project_boxed_opaque_existential_0(a3, v20);
  v72 = v17;
  v73 = v18;
  v74 = v19;
  v63 = (id)(*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v21 + 8))(&v72, v20, v21);
  v72 = v17;
  v73 = v18;
  v74 = v19;
  v22 = (uint64_t)v16;
  sub_24A27D1A8(&v72, a3, (uint64_t)v16);
  if (qword_25791F800 != -1)
    swift_once();
  v23 = __swift_project_value_buffer(v6, (uint64_t)qword_257920728);
  v24 = v69;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v69, v23, v6);
  v25 = v64;
  sub_24A27ED2C((uint64_t)v16, v64, &qword_2579201F8);
  v26 = sub_24A292D60();
  v27 = sub_24A292F64();
  if (os_log_type_enabled(v26, v27))
  {
    v59 = v6;
    v65 = v23;
    v28 = (uint8_t *)swift_slowAlloc();
    v29 = swift_slowAlloc();
    v72 = v29;
    *(_DWORD *)v28 = 136315138;
    v30 = v68;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v70 + 48))(v25, 1, v68) == 1)
    {
      v31 = 0xEE004C5255746F68;
      v32 = 0x7370616E53206F4ELL;
    }
    else
    {
      sub_24A27ED2C(v25, v60, &qword_2579201F8);
      v32 = sub_24A292E44();
      v31 = v35;
    }
    v71 = sub_24A26FA2C(v32, v31, &v72);
    sub_24A292FF4();
    swift_bridgeObjectRelease();
    sub_24A27EAE4(v25);
    _os_log_impl(&dword_24A26B000, v26, v27, "_saveSnapshotToDisk: snapshotURL: %s", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD0C57C](v29, -1, -1);
    MEMORY[0x24BD0C57C](v28, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v69, v59);
    v34 = v70;
    v33 = v67;
  }
  else
  {
    sub_24A27EAE4(v25);

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v24, v6);
    v33 = v67;
    v30 = v68;
    v34 = v70;
  }
  v36 = v66;
  sub_24A27ED2C(v22, v66, &qword_2579201F8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v36, 1, v30) == 1)
  {
    sub_24A27EAE4(v36);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v34 + 32))(v33, v36, v30);
    v37 = UIImagePNGRepresentation(v62);
    if (v37)
    {
      v38 = v37;
      v39 = sub_24A292C94();
      v41 = v40;

      sub_24A292CA0();
      v69 = v39;
      v48 = v63;
      v49 = sub_24A292D60();
      v50 = sub_24A292F58();
      if (os_log_type_enabled(v49, v50))
      {
        v52 = v22;
        v53 = (uint8_t *)swift_slowAlloc();
        v54 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v53 = 138543362;
        v72 = (uint64_t)v48;
        v66 = v41;
        v55 = v48;
        v33 = v67;
        sub_24A292FF4();
        *v54 = v48;

        v22 = v52;
        v30 = v68;
        _os_log_impl(&dword_24A26B000, v49, v50, "Saved snapshot view for key=%{public}@ to disk", v53, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2579202A8);
        swift_arrayDestroy();
        v56 = v54;
        v34 = v70;
        MEMORY[0x24BD0C57C](v56, -1, -1);
        MEMORY[0x24BD0C57C](v53, -1, -1);
        sub_24A2700DC(v69, v66);
      }
      else
      {
        sub_24A2700DC(v69, v41);

      }
      (*(void (**)(char *, uint64_t))(v34 + 8))(v33, v30);
      return sub_24A27EAE4(v22);
    }
    (*(void (**)(char *, uint64_t))(v34 + 8))(v33, v30);
  }
  v42 = v63;
  v43 = sub_24A292D60();
  v44 = sub_24A292F70();
  if (os_log_type_enabled(v43, v44))
  {
    v45 = (uint8_t *)swift_slowAlloc();
    v46 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v45 = 138543362;
    v72 = (uint64_t)v42;
    v47 = v42;
    sub_24A292FF4();
    *v46 = v42;

    _os_log_impl(&dword_24A26B000, v43, v44, "Failed to create PNG data when saving snapshot to disk for key=%{public}@", v45, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579202A8);
    swift_arrayDestroy();
    MEMORY[0x24BD0C57C](v46, -1, -1);
    MEMORY[0x24BD0C57C](v45, -1, -1);
  }
  else
  {

  }
  return sub_24A27EAE4(v22);
}

uint64_t sub_24A27E934()
{
  uint64_t v0;

  swift_beginAccess();
  *(_QWORD *)(v0 + 24) = MEMORY[0x24BEE4B00];
  return swift_bridgeObjectRelease();
}

uint64_t SnapshotManager.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SnapshotManager.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

void sub_24A27E9C4(UIImage *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  v3 = a2[1];
  v4 = a2[2];
  *(_QWORD *)&v5 = *a2;
  *((_QWORD *)&v5 + 1) = v3;
  v6 = v4;
  if (v3 < 0)
    sub_24A27DF08(a1, &v5, a3);
  else
    sub_24A27DFF4(a1, (uint64_t *)&v5, a3);
}

id sub_24A27EA18(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v5;
  uint64_t v6;

  v2 = a1[1];
  v3 = a1[2];
  *(_QWORD *)&v5 = *a1;
  *((_QWORD *)&v5 + 1) = v2;
  v6 = v3;
  if (v2 < 0)
    return sub_24A27DB28(&v5, a2);
  else
    return sub_24A27D3D0((uint64_t *)&v5, a2);
}

uint64_t dispatch thunk of SnapshotIdentifierProvider.snapshotKey(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of SnapshotIdentifierProvider.snapshotFilename(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of SnapshotManagerProtocol.saveSnapshot(image:type:filenameProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of SnapshotManagerProtocol.cachedSnapshot(for:filenameProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t type metadata accessor for SnapshotManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for SnapshotManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SnapshotManager.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of SnapshotManager.cachedSnapshot(for:filenameProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of SnapshotManager.saveSnapshot(image:type:filenameProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of SnapshotManager.removeLocalSnapshots()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t sub_24A27EAE4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579201F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_24A27EB24(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_24A27EB34(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  char v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v1 = a1[2];
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2579206A0);
  v3 = (_QWORD *)sub_24A293114();
  v5 = a1[4];
  v4 = a1[5];
  result = sub_24A2853C0(v5);
  if ((v7 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  v8 = a1 + 7;
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v3[6] + v9) = v5;
    *(_QWORD *)(v3[7] + v9) = v4;
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      break;
    v3[2] = v12;
    if (!--v1)
      goto LABEL_8;
    v13 = v8 + 2;
    v5 = *(v8 - 1);
    v14 = *v8;
    swift_bridgeObjectRetain();
    result = sub_24A2853C0(v5);
    v8 = v13;
    v4 = v14;
    if ((v15 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

unint64_t sub_24A27EC30(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  char v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v1 = a1[2];
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_257920288);
  v3 = (_QWORD *)sub_24A293114();
  v5 = a1[4];
  v4 = a1[5];
  result = sub_24A2853C0(v5);
  if ((v7 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_unknownObjectRetain();
    return (unint64_t)v3;
  }
  v8 = a1 + 7;
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v3[6] + v9) = v5;
    *(_QWORD *)(v3[7] + v9) = v4;
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      break;
    v3[2] = v12;
    if (!--v1)
      goto LABEL_8;
    v13 = v8 + 2;
    v5 = *(v8 - 1);
    v14 = *v8;
    swift_unknownObjectRetain();
    result = sub_24A2853C0(v5);
    v8 = v13;
    v4 = v14;
    if ((v15 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_24A27ED2C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24A27ED70(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_24A27EDB4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2579202B8;
  if (!qword_2579202B8)
  {
    v1 = sub_24A292C4C();
    result = MEMORY[0x24BD0C4D4](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, (unint64_t *)&qword_2579202B8);
  }
  return result;
}

void static UnlockState.locked.getter(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
}

uint64_t UnlockState.ScreenState.hash(into:)()
{
  return sub_24A2931D4();
}

uint64_t UnlockState.ScreenState.hashValue.getter()
{
  sub_24A2931C8();
  sub_24A2931D4();
  return sub_24A2931E0();
}

void UnlockState.screenState.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

double UnlockState.progress.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

double UnlockState.lockProgress.getter()
{
  uint64_t v0;

  return 1.0 - *(double *)(v0 + 8);
}

BOOL UnlockState.isTransitioning.getter()
{
  uint64_t v0;
  double v1;
  _BOOL4 v3;

  v1 = *(double *)(v0 + 8);
  v3 = v1 > 0.01 && *(_BYTE *)v0 == 2;
  return v1 < 0.99 && v3;
}

BOOL static UnlockState.ScreenState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

BOOL UnlockState.isLocked.getter()
{
  _BYTE *v0;

  return *v0 == 0;
}

BOOL UnlockState.isNotLocked.getter()
{
  _BYTE *v0;

  return *v0 != 0;
}

BOOL UnlockState.isUnlocked.getter()
{
  unsigned __int8 *v0;

  return *v0 == 1;
}

BOOL UnlockState.isNotUnlocked.getter()
{
  unsigned __int8 *v0;

  return *v0 != 1;
}

uint64_t UnlockState.description.getter()
{
  _QWORD v1[2];

  sub_24A293054();
  swift_bridgeObjectRelease();
  strcpy((char *)v1, "screenState:");
  sub_24A292E74();
  swift_bridgeObjectRelease();
  sub_24A292E74();
  sub_24A292F40();
  sub_24A292E74();
  swift_bridgeObjectRelease();
  return v1[0];
}

uint64_t UnlockState.ScreenState.description.getter()
{
  char *v0;

  return *(_QWORD *)&aLocked_0[8 * *v0];
}

BOOL static UnlockState.== infix(_:_:)(double *a1, double *a2)
{
  return *(unsigned __int8 *)a1 == *(unsigned __int8 *)a2 && a1[1] == a2[1];
}

unint64_t sub_24A27F054()
{
  unint64_t result;

  result = qword_2579202D0;
  if (!qword_2579202D0)
  {
    result = MEMORY[0x24BD0C4D4](&protocol conformance descriptor for UnlockState.ScreenState, &type metadata for UnlockState.ScreenState);
    atomic_store(result, (unint64_t *)&qword_2579202D0);
  }
  return result;
}

BOOL sub_24A27F098(double *a1, double *a2)
{
  return *(unsigned __int8 *)a1 == *(unsigned __int8 *)a2 && a1[1] == a2[1];
}

uint64_t getEnumTagSinglePayload for UnlockState(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && a1[16])
    return (*(_DWORD *)a1 + 254);
  v3 = *a1;
  v4 = v3 >= 3;
  v5 = v3 - 3;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for UnlockState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for UnlockState()
{
  return &type metadata for UnlockState;
}

uint64_t storeEnumTagSinglePayload for UnlockState.ScreenState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A27F1A4 + 4 * byte_24A294965[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_24A27F1D8 + 4 * byte_24A294960[v4]))();
}

uint64_t sub_24A27F1D8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A27F1E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A27F1E8);
  return result;
}

uint64_t sub_24A27F1F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A27F1FCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24A27F200(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A27F208(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UnlockState.ScreenState()
{
  return &type metadata for UnlockState.ScreenState;
}

void SnapshotType.init(renderer:)(void *a1@<X0>, _QWORD *a2@<X8>)
{
  unsigned int v4;
  unsigned int v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE v10[8];
  uint64_t v11;

  v4 = objc_msgSend(objc_msgSend(a1, sel_environment), sel_isSnapshot);
  swift_unknownObjectRelease();
  if (v4)
  {
    v5 = objc_msgSend(objc_msgSend(a1, sel_environment), sel_isPreview);
    swift_unknownObjectRelease();
    v6 = objc_msgSend(objc_msgSend(a1, sel_environment), sel_deviceOrientation);
    swift_unknownObjectRelease();
    if (v5)
    {

      a2[1] = 0;
      a2[2] = 0;
      *a2 = v6;
    }
    else
    {
      v7 = objc_msgSend(a1, sel_environment);
      swift_getObjectType();
      PRPosterRenderingEnvironment.unlockState.getter((uint64_t)v10);

      swift_unknownObjectRelease();
      v8 = v11;
      v9 = v10[0] | 0x8000000000000000;
      *a2 = v6;
      a2[1] = v9;
      a2[2] = v8;
    }
  }
  else
  {

    *(_OWORD *)a2 = xmmword_24A294AB0;
    a2[2] = 0;
  }
}

uint64_t SnapshotType.description.getter()
{
  uint64_t v0;
  uint64_t v2;

  if ((*(_QWORD *)(v0 + 8) & 0x8000000000000000) != 0)
  {
    v2 = 0x7265686374697773;
    sub_24A292E74();
    swift_bridgeObjectRelease();
    sub_24A292E74();
  }
  else
  {
    v2 = 0x2D77656976657270;
  }
  sub_24A292E74();
  swift_bridgeObjectRelease();
  return v2;
}

BOOL _s26WatchFacesWallpaperSupport12SnapshotTypeO2eeoiySbAC_ACtFZ_0(double *a1, double *a2)
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  double v5;
  uint64_t v8;

  v3 = *a1;
  v2 = *((_QWORD *)a1 + 1);
  v5 = *a2;
  v4 = *((_QWORD *)a2 + 1);
  if ((v2 & 0x8000000000000000) == 0)
    return v4 >= 0 && *(_QWORD *)&v3 == *(_QWORD *)&v5;
  v8 = 0;
  if (v4 < 0 && *(_QWORD *)&v3 == *(_QWORD *)&v5)
    return a1[2] == a2[2] && v4 == v2;
  return v8;
}

uint64_t getEnumTagSinglePayload for SnapshotType(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8) >> 2;
  if (v2 > 0x80000000)
    v3 = ~(_DWORD)v2;
  else
    v3 = -1;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for SnapshotType(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 4 * -a2;
      *(_QWORD *)(result + 16) = 0;
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_24A27F64C(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8) >> 63;
}

uint64_t sub_24A27F658(uint64_t result)
{
  *(_QWORD *)(result + 8) &= ~0x8000000000000000;
  return result;
}

uint64_t sub_24A27F668(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 8) = *(_QWORD *)(result + 8) & 3 | (a2 << 63);
  return result;
}

ValueMetadata *type metadata accessor for SnapshotType()
{
  return &type metadata for SnapshotType;
}

uint64_t WallpaperMetalCoordination.EditingCoordinator.renderingType.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t sub_24A27F694(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  _BYTE v5[40];

  sub_24A27F738(a1, (uint64_t)v5);
  v3 = *a2 + 32;
  swift_beginAccess();
  sub_24A287458((uint64_t)v5, v3);
  return swift_endAccess();
}

uint64_t sub_24A27F6F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  swift_beginAccess();
  return sub_24A27F738(v1 + 32, a1);
}

uint64_t sub_24A27F738(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579202F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static WallpaperMetalCoordination.EditingCoordinator.LookSelectionStyle.== infix(_:_:)(_QWORD **a1, _QWORD **a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = *a2;
  if (v2)
  {
    if (v3)
      return sub_24A27F7C8(v2, v3);
    return 0;
  }
  if (v3)
    return 0;
  swift_bridgeObjectRelease_n();
  return 1;
}

uint64_t sub_24A27F7C8(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  BOOL v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *i;
  BOOL v11;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_24A29315C(), result = 0, (v6 & 1) != 0))
  {
    v8 = v2 - 1;
    if (!v8)
      return 1;
    v9 = a1 + 7;
    for (i = a2 + 7; ; i += 2)
    {
      v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (sub_24A29315C() & 1) == 0)
        break;
      v9 += 2;
      if (!--v8)
        return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_24A27F88C(_QWORD **a1, _QWORD **a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = *a2;
  if (v2)
  {
    if (v3)
      return sub_24A27F7C8(v2, v3);
    return 0;
  }
  if (v3)
    return 0;
  swift_bridgeObjectRelease_n();
  return 1;
}

uint64_t WallpaperMetalCoordination.EditingCoordinator.lookSelectionStyle.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 72);
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A27F8E0()
{
  uint64_t v0;

  v0 = sub_24A292D78();
  __swift_allocate_value_buffer(v0, qword_2579202E0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2579202E0);
  return sub_24A292D6C();
}

uint64_t WallpaperMetalCoordination.EditingCoordinator.__allocating_init(identifier:rendering:environment:initialLookIdentifier:lookSelectionStyle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t *a8)
{
  uint64_t v16;

  v16 = swift_allocObject();
  WallpaperMetalCoordination.EditingCoordinator.init(identifier:rendering:environment:initialLookIdentifier:lookSelectionStyle:)(a1, a2, a3, a4, a5, a6, a7, a8);
  return v16;
}

uint64_t WallpaperMetalCoordination.EditingCoordinator.init(identifier:rendering:environment:initialLookIdentifier:lookSelectionStyle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t *a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  CGColorSpace *v21;
  id v22;
  char *v23;
  id v24;
  void *v25;
  id v26;
  BOOL v27;
  _BYTE *v28;
  id v29;
  _QWORD *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t (**v39)(void *);
  uint64_t v40;
  char *v41;
  uint64_t (*v43)(uint64_t, uint64_t);
  uint64_t v44;

  v9 = v8;
  *(_OWORD *)(v8 + 32) = 0u;
  *(_OWORD *)(v8 + 48) = 0u;
  v14 = v8 + 32;
  v15 = *a8;
  *(_OWORD *)(v14 + 272) = 0u;
  *(_OWORD *)(v14 + 288) = 0u;
  *(_DWORD *)(v14 + 304) = 0;
  *(_BYTE *)(v14 + 308) = -1;
  *(_QWORD *)(v14 + 312) = 0;
  *(_QWORD *)(v14 + 320) = 0;
  *(_BYTE *)(v14 + 328) = 1;
  *(_QWORD *)(v14 + 344) = 0;
  *(_QWORD *)(v14 + 352) = 0;
  *(_QWORD *)(v14 + 336) = 0x3FF0000000000000;
  *(_QWORD *)(v14 + 48) = a1;
  *(_QWORD *)(v14 + 56) = a2;
  *(_QWORD *)(v14 - 16) = a3;
  *(_QWORD *)(v14 - 8) = a4;
  *(_QWORD *)(v14 + 120) = a6;
  *(_QWORD *)(v14 + 128) = a7;
  *(_QWORD *)(v14 + 32) = 0;
  *(_QWORD *)(v14 + 40) = v15;
  v16 = qword_25791F7D8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v16 != -1)
    swift_once();
  v17 = qword_2579226A8;
  if (qword_2579226A8)
  {
    v44 = a6;
    v18 = *(_QWORD *)(qword_2579226A8
                    + OBJC_IVAR____TtCO26WatchFacesWallpaperSupport26WallpaperMetalCoordination9Resources_device);
    *(_QWORD *)(v9 + 96) = v18;
    *(_QWORD *)(v9 + 104) = *(_QWORD *)(v17
                                      + OBJC_IVAR____TtCO26WatchFacesWallpaperSupport26WallpaperMetalCoordination9Resources_commandQueue);
    v19 = *(uint64_t (**)(uint64_t, uint64_t))(a4 + 8);
    swift_unknownObjectRetain_n();
    swift_unknownObjectRetain();
    swift_retain();
    v43 = v19;
    v20 = v19(a3, a4);
    v21 = (CGColorSpace *)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
    v22 = objc_allocWithZone((Class)type metadata accessor for WallpaperMetalView(0));
    v23 = sub_24A28E3DC(v18, v20, v21);
    *(_QWORD *)(v9 + 112) = v23;
    v23[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_shouldDrawAutomatically] = 0;
    v24 = objc_msgSend((id)swift_unknownObjectRetain(), sel_traitCollection);
    if (v24)
    {
      v25 = v24;
      v26 = objc_msgSend(v24, sel_userInterfaceStyle);

      v27 = v26 == (id)2;
    }
    else
    {
      v27 = 0;
    }
    v29 = objc_msgSend(a5, sel_deviceOrientation);
    swift_unknownObjectRelease();
    *(_BYTE *)(v9 + 168) = 0;
    *(_QWORD *)(v9 + 176) = 0;
    *(_BYTE *)(v9 + 184) = 0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(v9 + 192) = _Q0;
    *(_BYTE *)(v9 + 208) = v27;
    *(_BYTE *)(v9 + 209) = 0;
    *(_QWORD *)(v9 + 216) = v44;
    *(_QWORD *)(v9 + 224) = a7;
    *(_QWORD *)(v9 + 232) = 0;
    *(_QWORD *)(v9 + 240) = 0;
    *(_DWORD *)(v9 + 248) = 0;
    *(_BYTE *)(v9 + 252) = 0;
    *(_QWORD *)(v9 + 256) = v29;
    *(_OWORD *)(v9 + 264) = 0u;
    *(_OWORD *)(v9 + 280) = 0u;
    *(_BYTE *)(v9 + 296) = 0;
    v35 = (_QWORD *)MEMORY[0x24BEE4AF8];
    *(_QWORD *)(v9 + 120) = sub_24A27CE98(MEMORY[0x24BEE4AF8]);
    *(_QWORD *)(v9 + 128) = sub_24A27EB34(v35);
    *(_QWORD *)(v9 + 136) = sub_24A27CEA4((uint64_t)v35);
    *(_QWORD *)(v9 + 144) = sub_24A27EC30(v35);
    swift_bridgeObjectRelease();
    if (v15)
    {
      swift_bridgeObjectRelease();
      v36 = v43(a3, a4);
      if ((unint64_t)(v36 - 70) <= 0x2D && ((1 << (v36 - 70)) & 0x200000000C03) != 0)
        goto LABEL_13;
      sub_24A293054();
      sub_24A292E74();
      v43(a3, a4);
      type metadata accessor for MTLPixelFormat(0);
      sub_24A2930C0();
      sub_24A292E74();
      sub_24A2930D8();
      __break(1u);
    }
    swift_bridgeObjectRelease();
LABEL_13:
    v37 = *(char **)(v9 + 112);
    v38 = swift_allocObject();
    swift_weakInit();
    v39 = (uint64_t (**)(void *))&v37[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_drawingHandler];
    v40 = *(_QWORD *)&v37[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_drawingHandler];
    *v39 = sub_24A2873D0;
    v39[1] = (uint64_t (*)(void *))v38;
    v41 = v37;
    swift_retain();
    sub_24A2873D8(v40);
    swift_release();

    swift_release();
    swift_unknownObjectRelease();
    return v9;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24A27AA14();
  swift_allocError();
  *v28 = 0;
  swift_willThrow();
  swift_unknownObjectRelease();
  sub_24A27FED0(v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24A27FF10(*(_QWORD *)(v9 + 304), *(_QWORD *)(v9 + 312), *(_QWORD *)(v9 + 320), *(_QWORD *)(v9 + 328), *(unsigned int *)(v14 + 304) | ((unint64_t)*(unsigned __int8 *)(v14 + 308) << 32));

  type metadata accessor for WallpaperMetalCoordination.EditingCoordinator();
  swift_deallocPartialClassInstance();
  return v9;
}

uint64_t sub_24A27FED0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579202F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24A27FF10(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (BYTE4(a5) != 255)
    return sub_24A27FF28(result, a2, a3, a4, a5, BYTE4(a5) & 1);
  return result;
}

uint64_t sub_24A27FF28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  if ((a6 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t type metadata accessor for WallpaperMetalCoordination.EditingCoordinator()
{
  return objc_opt_self();
}

uint64_t sub_24A27FF84(void *a1)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_24A281960(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_24A27FFE0(id a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  unint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id *v29;
  uint64_t v30;
  SEL *v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  unint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t result;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  void *v53;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  uint64_t v62;
  unint64_t v63;
  void *v64;
  unint64_t v65;
  char v66;
  id v67;
  uint64_t v68;
  id v69;
  _BYTE *v70;
  id v71;
  id v72;
  char v73;
  NSObject *v74;
  os_log_type_t v75;
  uint8_t *v76;
  void *v77;
  void *v78;
  unint64_t v79;
  void (*v80)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t);
  id v81;
  id v82;
  uint64_t v83;
  uint64_t v85;
  id v86[3];
  uint64_t v87[6];
  uint64_t v88[3];
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  CGRect v92;
  CGRect v93;

  v4 = v3;
  if (qword_25791F7E8 != -1)
    swift_once();
  v7 = v85 + 296;
  v8 = sub_24A292D78();
  __swift_project_value_buffer(v8, (uint64_t)qword_2579202E0);
  swift_bridgeObjectRetain_n();
  v9 = sub_24A292D60();
  v10 = sub_24A292F64();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = a3;
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    v88[0] = v13;
    *(_DWORD *)v12 = 136446210;
    swift_bridgeObjectRetain();
    v87[3] = sub_24A26FA2C(a2, v11, v88);
    v4 = v3;
    sub_24A292FF4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24A26B000, v9, v10, "populating views for ”%{public}s”", v12, 0xCu);
    swift_arrayDestroy();
    v14 = v13;
    v7 = v85 + 296;
    MEMORY[0x24BD0C57C](v14, -1, -1);
    v15 = v12;
    a3 = v11;
    MEMORY[0x24BD0C57C](v15, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  objc_msgSend(a1, sel_bounds);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  if ((*(_BYTE *)(v7 + 64) & 1) != 0)
  {
    v24 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
    objc_msgSend(v24, sel_nativeScale);
    v26 = v25;

    v92.origin.x = v17;
    v92.origin.y = v19;
    v92.size.width = v21;
    v92.size.height = v23;
    v27 = ceil(v26 * CGRectGetWidth(v92));
    v93.origin.x = v17;
    v93.origin.y = v19;
    v93.size.width = v21;
    v93.size.height = v23;
    v28 = ceil(v26 * CGRectGetHeight(v93));
    *(double *)(v85 + 344) = v27;
    *(double *)(v85 + 352) = v28;
    *(_BYTE *)(v7 + 64) = 0;
  }
  else
  {
    v27 = *(double *)(v85 + 344);
    v28 = *(double *)(v85 + 352);
  }
  v29 = (id *)(v85 + 32);
  swift_beginAccess();
  sub_24A27F738(v85 + 32, (uint64_t)v88);
  v30 = v89;
  sub_24A27FED0((uint64_t)v88);
  if (v30)
    goto LABEL_10;
  v40 = *(_QWORD *)(v85 + 16);
  v39 = *(_QWORD *)(v85 + 24);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v39 + 24))(v40, v39) & 1) != 0)
  {
    v41 = objc_msgSend(*(id *)(v85 + 104), sel_commandBuffer);
    if (!v41)
    {
      sub_24A27AA14();
      swift_allocError();
      *v70 = 1;
      return swift_willThrow();
    }
    v42 = v41;
    v43 = a3;
    v44 = (void *)sub_24A292E08();
    objc_msgSend(v42, sel_setLabel_, v44);

    a3 = v43;
  }
  else
  {
    v42 = 0;
  }
  if (v27 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_64;
  }
  if (v27 >= 9.22337204e18)
  {
LABEL_64:
    __break(1u);
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  if ((~*(_QWORD *)&v28 & 0x7FF0000000000000) == 0
    || (*(_QWORD *)&v27 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_65;
  }
  if (v28 <= -9.22337204e18)
  {
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  if (v28 >= 9.22337204e18)
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  v79 = a3;
  v46 = *(_QWORD *)(v85 + 88);
  v45 = *(_QWORD *)(v85 + 96);
  v83 = v4;
  v47 = *(_QWORD *)(v85 + 80);
  v80 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t))(v39 + 40);
  v89 = v40;
  v90 = v39;
  __swift_allocate_boxed_opaque_existential_1(v88);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  v80(v45, v47, v46, (uint64_t)v27, (uint64_t)v28, v42, v40, v39);
  if (v83)
  {
    __swift_deallocate_boxed_opaque_existential_1((uint64_t)v88);
    return swift_unknownObjectRelease();
  }
  swift_beginAccess();
  sub_24A287458((uint64_t)v88, (uint64_t)v29);
  swift_endAccess();
  if (v42)
    objc_msgSend(v42, sel_commit);
  v69 = objc_msgSend(*(id *)(v85 + 112), sel_layer);
  objc_opt_self();
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setDrawableSize_, v27, v28);

  sub_24A281F8C();
  swift_unknownObjectRelease();
  a3 = v79;
LABEL_10:
  v31 = (SEL *)&unk_251BBC000;
  if (*(_QWORD *)(v85 + 72))
  {
    v29 = (id *)(v85 + 120);
    swift_beginAccess();
    v32 = *(_QWORD *)(v85 + 120);
    v81 = a1;
    if (*(_QWORD *)(v32 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v33 = sub_24A2852AC(a2, a3);
      if ((v34 & 1) != 0)
      {
        v82 = *(id *)(*(_QWORD *)(v32 + 56) + 8 * v33);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain_n();
        v35 = sub_24A292D60();
        v36 = sub_24A292F64();
        if (os_log_type_enabled(v35, v36))
        {
          v37 = (uint8_t *)swift_slowAlloc();
          v38 = swift_slowAlloc();
          v87[0] = v38;
          *(_DWORD *)v37 = 136446210;
          swift_bridgeObjectRetain();
          v86[0] = (id)sub_24A26FA2C(a2, a3, v87);
          sub_24A292FF4();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_24A26B000, v35, v36, "reusing snapshot layer for “%{public}s”", v37, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24BD0C57C](v38, -1, -1);
          MEMORY[0x24BD0C57C](v37, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        goto LABEL_34;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRetain_n();
    v49 = sub_24A292D60();
    v50 = sub_24A292F64();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      v52 = swift_slowAlloc();
      v87[0] = v52;
      *(_DWORD *)v51 = 136446210;
      swift_bridgeObjectRetain();
      v86[0] = (id)sub_24A26FA2C(a2, a3, v87);
      sub_24A292FF4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24A26B000, v49, v50, "creating snapshot layer for “%{public}s”", v51, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BD0C57C](v52, -1, -1);
      MEMORY[0x24BD0C57C](v51, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    a1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE56D0]), sel_init);
    objc_msgSend(a1, sel_setAnchorPoint_, 0.0, 0.0);
    if (qword_25791F7D0 == -1)
    {
LABEL_33:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257920840);
      v53 = (void *)sub_24A292DB4();
      objc_msgSend(a1, sel_setActions_, v53);

      swift_beginAccess();
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v86[0] = *v29;
      *v29 = (id)0x8000000000000000;
      v82 = a1;
      sub_24A286A68((uint64_t)a1, a2, a3, isUniquelyReferenced_nonNull_native, &qword_2579202A0);
      *v29 = v86[0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
LABEL_34:
      v31 = (SEL *)&unk_251BBC000;
      v55 = *(_QWORD *)(v85 + 256);
      v56 = *(_QWORD *)(v85 + 264);
      v57 = *(unsigned __int8 *)(v85 + 296);
      swift_beginAccess();
      v58 = *(_QWORD *)(v85 + 128);
      if (*(_QWORD *)(v58 + 16) && (!v57 ? (v59 = v55) : (v59 = v56), v60 = sub_24A2853C0(v59), (v61 & 1) != 0))
      {
        v62 = *(_QWORD *)(*(_QWORD *)(v58 + 56) + 8 * v60);
        v63 = a3;
        v64 = v81;
        if (*(_QWORD *)(v62 + 16))
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v65 = sub_24A2852AC(a2, a3);
          if ((v66 & 1) != 0)
          {
            v67 = *(id *)(*(_QWORD *)(v62 + 56) + 8 * v65);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v86[0] = v67;
            type metadata accessor for CGImage(0);
            v68 = sub_24A293150();

            goto LABEL_50;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        v68 = 0;
      }
      else
      {
        v68 = 0;
        v63 = a3;
        v64 = v81;
      }
LABEL_50:
      objc_msgSend(v82, sel_setContents_, v68);
      swift_unknownObjectRelease();
      objc_msgSend(v82, sel_setBounds_, v17, v19, v21, v23);
      v71 = objc_msgSend(v64, sel_layer);
      objc_msgSend(v71, sel_addSublayer_, v82);

      swift_beginAccess();
      swift_bridgeObjectRetain();
      v72 = v64;
      v73 = swift_isUniquelyReferenced_nonNull_native();
      v91 = *(_QWORD *)(v85 + 136);
      *(_QWORD *)(v85 + 136) = 0x8000000000000000;
      sub_24A286A68((uint64_t)v72, a2, v63, v73, (uint64_t *)&unk_257920290);
      *(_QWORD *)(v85 + 136) = v91;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      if (*(_QWORD *)(v85 + 152) == a2 && *(_QWORD *)(v85 + 160) == v63 || (sub_24A29315C() & 1) != 0)
      {
        swift_bridgeObjectRetain_n();
        v74 = sub_24A292D60();
        v75 = sub_24A292F64();
        if (os_log_type_enabled(v74, v75))
        {
          v76 = (uint8_t *)swift_slowAlloc();
          v77 = (void *)swift_slowAlloc();
          v86[0] = v77;
          *(_DWORD *)v76 = 136446210;
          swift_bridgeObjectRetain();
          v91 = sub_24A26FA2C(a2, v63, (uint64_t *)v86);
          v31 = (SEL *)&unk_251BBC000;
          sub_24A292FF4();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_24A26B000, v74, v75, "adding main view to background for “%{public}s”", v76, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24BD0C57C](v77, -1, -1);
          MEMORY[0x24BD0C57C](v76, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        objc_msgSend(v72, sel_addSubview_, *(_QWORD *)(v85 + 112));

      }
      else
      {

      }
      goto LABEL_58;
    }
LABEL_68:
    swift_once();
    goto LABEL_33;
  }
  objc_msgSend(a1, sel_addSubview_, *(_QWORD *)(v85 + 112));
LABEL_58:
  v78 = *(void **)(v85 + 112);
  objc_msgSend(v78, v31[369], v17, v19, v21, v23);
  *((_BYTE *)v78 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_shouldDrawAutomatically) = 1;
  if (*(_QWORD *)(v85 + 80) == *(_QWORD *)(v85 + 152) && *(_QWORD *)(v85 + 88) == *(_QWORD *)(v85 + 160))
    return (uint64_t)objc_msgSend(v78, sel_setNeedsDisplay);
  result = sub_24A29315C();
  if ((result & 1) != 0)
    return (uint64_t)objc_msgSend(v78, sel_setNeedsDisplay);
  return result;
}

uint64_t sub_24A280D54(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  void (**v7)(char *, uint64_t, _QWORD);
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  uint64_t v16;
  char *v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  void (**v29)(char *, uint64_t, _QWORD);
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t v37;
  unint64_t v38;
  os_log_t v39;
  double Current;
  id v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  id v48;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  os_log_t v61;
  uint64_t v62;
  int v63;
  void (**v64)(char *, uint64_t, _QWORD);
  char *v65;
  id v66;
  _BOOL4 v67;
  __int128 v68;
  __int128 v69;
  _OWORD v70[2];
  __int128 v71;
  uint64_t v72;
  _QWORD v73[3];
  __int128 v74;
  __int128 v75;
  char v76;
  _OWORD v77[8];
  char v78;

  v3 = v2;
  v6 = sub_24A292D78();
  v7 = *(void (***)(char *, uint64_t, _QWORD))(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v65 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v3 + 160);
  *(_QWORD *)&v68 = *(_QWORD *)(v3 + 152);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  v10 = objc_msgSend(a1, sel_traitCollection);
  if (v10)
  {
    v11 = v10;
    v12 = objc_msgSend(v10, sel_userInterfaceStyle);

    v67 = v12 == (id)2;
  }
  else
  {
    v67 = 0;
  }
  v13 = objc_msgSend(a1, sel_deviceOrientation);
  swift_unknownObjectRelease();
  v14 = *(unsigned __int8 *)(v3 + 296);
  *((_QWORD *)&v68 + 1) = v9;
  if (!a2)
  {
    if (v14)
    {
      v19 = *(double *)(v3 + 280);
      v18 = *(double *)(v3 + 288);
      if (CFAbsoluteTimeGetCurrent() <= v18 + v19)
      {
        v20 = *(_QWORD *)(v3 + 256);
        v21 = *(_QWORD *)(v3 + 264);
        v22 = *(id *)(v3 + 272);
        v23 = *(_QWORD *)(v3 + 280);
        v24 = *(_QWORD *)(v3 + 288);
        v25 = *(unsigned __int8 *)(v3 + 296);
        sub_24A2874CC(v20, v21, v22, v23, v24, *(_BYTE *)(v3 + 296));
        sub_24A2874CC(v20, v21, v22, v23, v24, v25);
        v13 = (id)v20;
        LODWORD(v66) = v25;
        goto LABEL_33;
      }
    }
    goto LABEL_11;
  }
  v64 = v7;
  _ZF = v14 == 0;
  v16 = 256;
  if (!_ZF)
    v16 = 264;
  v17 = *(char **)(v3 + v16);
  v66 = a2;
  if (objc_msgSend(a1, sel_deviceOrientation) == v17)
  {

LABEL_11:
    objc_msgSend(*(id *)(v3 + 112), sel_setNeedsDisplay);
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    LOBYTE(v25) = 0;
    LODWORD(v66) = 255;
    goto LABEL_33;
  }
  if (qword_25791F7E8 != -1)
    swift_once();
  v26 = v6;
  v27 = __swift_project_value_buffer(v6, (uint64_t)qword_2579202E0);
  v29 = v64;
  v28 = v65;
  v64[2](v65, v27, v26);
  swift_unknownObjectRetain_n();
  v30 = sub_24A292D60();
  v63 = sub_24A292F64();
  if (os_log_type_enabled(v30, (os_log_type_t)v63))
  {
    v61 = v30;
    v62 = v26;
    v31 = swift_slowAlloc();
    v32 = swift_slowAlloc();
    *(_QWORD *)&v77[0] = v32;
    *(_DWORD *)v31 = 136446466;
    v33 = v32;
    v34 = 0xD000000000000014;
    v35 = 0x800000024A2984D0;
    switch((unint64_t)v17)
    {
      case 1uLL:
        v35 = 0xE800000000000000;
        v34 = 0x7469617274726F50;
        break;
      case 2uLL:
        break;
      case 3uLL:
        v35 = 0xEF74686769522065;
        goto LABEL_22;
      case 4uLL:
        v35 = 0xEE007466654C2065;
LABEL_22:
        v34 = 0x70616373646E614CLL;
        break;
      default:
        v33 = 0xD000000000000014;
        v35 = 0x800000024A2984B0;
        v34 = 0xD000000000000013;
        break;
    }
    *(_QWORD *)&v69 = sub_24A26FA2C(v34, v35, (uint64_t *)v77);
    sub_24A292FF4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 12) = 2082;
    v36 = (char *)objc_msgSend(a1, sel_deviceOrientation) - 1;
    v37 = 0xD000000000000014;
    v38 = 0x800000024A2984D0;
    switch((unint64_t)v36)
    {
      case 0uLL:
        v38 = 0xE800000000000000;
        v37 = 0x7469617274726F50;
        break;
      case 1uLL:
        break;
      case 2uLL:
        v38 = 0xEF74686769522065;
        goto LABEL_28;
      case 3uLL:
        v38 = 0xEE007466654C2065;
LABEL_28:
        v37 = 0x70616373646E614CLL;
        break;
      default:
        v38 = 0x800000024A2984B0;
        v37 = 0xD000000000000013;
        break;
    }
    *(_QWORD *)&v69 = sub_24A26FA2C(v37, v38, (uint64_t *)v77);
    sub_24A292FF4();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    v39 = v61;
    _os_log_impl(&dword_24A26B000, v61, (os_log_type_t)v63, "🔄 editor starting orientation transition %{public}s → %{public}s", (uint8_t *)v31, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24BD0C57C](v33, -1, -1);
    MEMORY[0x24BD0C57C](v31, -1, -1);

    ((void (*)(char *, uint64_t))v64[1])(v65, v62);
  }
  else
  {

    swift_unknownObjectRelease_n();
    ((void (*)(char *, uint64_t))v29[1])(v28, v26);
  }
  v65 = v17;
  v64 = (void (**)(char *, uint64_t, _QWORD))objc_msgSend(a1, sel_deviceOrientation);
  v22 = objc_msgSend(v66, sel_timingFunction);
  if (!v22)
    v22 = objc_msgSend((id)objc_opt_self(), sel_functionWithName_, *MEMORY[0x24BDE5D20]);
  Current = CFAbsoluteTimeGetCurrent();
  v41 = v66;
  objc_msgSend(v66, sel_delay);
  *(double *)&v43 = Current + v42;
  objc_msgSend(v41, sel_duration);
  v23 = v43;
  v24 = v44;
  objc_msgSend(v41, sel_delay);
  v46 = v45;
  objc_msgSend(v41, sel_duration);
  sub_24A28E95C(v46 + v47);

  v48 = v22;
  LODWORD(v66) = 1;
  v21 = (uint64_t)v64;
  v20 = (uint64_t)v65;
  v13 = v65;
  LOBYTE(v25) = 1;
LABEL_33:
  LOBYTE(v69) = 0;
  *((_QWORD *)&v69 + 1) = 0;
  LOBYTE(v70[0]) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)((char *)v70 + 8) = _Q0;
  WORD4(v70[1]) = v67;
  v71 = v68;
  v72 = 0;
  v73[0] = 0;
  *(_QWORD *)((char *)v73 + 5) = 0;
  v73[2] = v13;
  *(_QWORD *)&v74 = v21;
  *((_QWORD *)&v74 + 1) = v22;
  *(_QWORD *)&v75 = v23;
  *((_QWORD *)&v75 + 1) = v24;
  v53 = *(_OWORD *)(v3 + 248);
  v54 = *(_OWORD *)(v3 + 280);
  v77[6] = *(_OWORD *)(v3 + 264);
  v77[7] = v54;
  v55 = *(_OWORD *)(v3 + 184);
  v56 = *(_OWORD *)(v3 + 216);
  v77[2] = *(_OWORD *)(v3 + 200);
  v77[3] = v56;
  v77[4] = *(_OWORD *)(v3 + 232);
  v77[5] = v53;
  v77[0] = *(_OWORD *)(v3 + 168);
  v77[1] = v55;
  *(_OWORD *)(v3 + 248) = *(_OWORD *)&v73[1];
  v57 = v75;
  *(_OWORD *)(v3 + 264) = v74;
  *(_OWORD *)(v3 + 280) = v57;
  v58 = v69;
  *(_OWORD *)(v3 + 184) = v70[0];
  v59 = v71;
  *(_OWORD *)(v3 + 200) = v70[1];
  *(_OWORD *)(v3 + 216) = v59;
  *(_OWORD *)(v3 + 232) = 0u;
  v76 = v25;
  v78 = *(_BYTE *)(v3 + 296);
  *(_BYTE *)(v3 + 296) = v25;
  *(_OWORD *)(v3 + 168) = v58;
  sub_24A2874D8((uint64_t)&v69, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A2874A0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A2874CC);
  sub_24A2874D8((uint64_t)v77, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
  sub_24A281F8C();
  sub_24A287568(v20, v21, v22, v23, v24, v66);
  return sub_24A2874D8((uint64_t)&v69, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
}

void sub_24A2814B8(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v4 = v3;
  if (!*(_QWORD *)(v3 + 72))
  {
    if (*(double *)(v3 + 368) - a3 <= 0.9)
    {
      v10 = *(_QWORD *)(v3 + 160);
      v11 = a3;
      v12 = *(_QWORD *)(v3 + 304);
      v13 = *(_QWORD *)(v3 + 312);
      v14 = *(_QWORD *)(v3 + 320);
      v15 = *(_QWORD *)(v3 + 328);
      v16 = *(unsigned int *)(v3 + 336) | ((unint64_t)*(unsigned __int8 *)(v3 + 340) << 32);
      *(_QWORD *)(v3 + 304) = *(_QWORD *)(v3 + 152);
      *(_QWORD *)(v3 + 312) = v10;
      *(_QWORD *)(v3 + 320) = a1;
      *(_QWORD *)(v3 + 328) = a2;
      *(float *)(v3 + 336) = v11;
      *(_BYTE *)(v3 + 340) = 1;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24A27FF10(v12, v13, v14, v15, v16);
      objc_msgSend(*(id *)(v3 + 112), sel_setNeedsDisplay);
    }
    else
    {
      if (qword_25791F7E8 != -1)
        swift_once();
      v6 = sub_24A292D78();
      __swift_project_value_buffer(v6, (uint64_t)qword_2579202E0);
      v7 = sub_24A292D60();
      v8 = sub_24A292F70();
      if (os_log_type_enabled(v7, v8))
      {
        v9 = swift_slowAlloc();
        *(_DWORD *)v9 = 134218240;
        sub_24A292FF4();
        *(_WORD *)(v9 + 12) = 2048;
        sub_24A292FF4();
        _os_log_impl(&dword_24A26B000, v7, v8, "got a nonsense transition-progress change (%f → %f), ignoring", (uint8_t *)v9, 0x16u);
        MEMORY[0x24BD0C57C](v9, -1, -1);
      }

    }
    *(double *)(v4 + 368) = a3;
  }
}

id sub_24A28168C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
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
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  id v25;
  uint64_t v27;
  uint64_t v28[3];

  v3 = v2;
  if (qword_25791F7E8 != -1)
    swift_once();
  v6 = sub_24A292D78();
  __swift_project_value_buffer(v6, (uint64_t)qword_2579202E0);
  swift_bridgeObjectRetain_n();
  v7 = sub_24A292D60();
  v8 = sub_24A292F64();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v28[0] = v10;
    *(_DWORD *)v9 = 136446210;
    swift_bridgeObjectRetain();
    v27 = sub_24A26FA2C(a1, a2, v28);
    sub_24A292FF4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24A26B000, v7, v8, "finalized transition to “%{public}s”", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD0C57C](v10, -1, -1);
    MEMORY[0x24BD0C57C](v9, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(_QWORD *)(v3 + 152) = a1;
  *(_QWORD *)(v3 + 160) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(v3 + 216);
  v12 = *(_QWORD *)(v3 + 224);
  v13 = *(_QWORD *)(v3 + 232);
  v14 = *(_QWORD *)(v3 + 240);
  v15 = *(unsigned int *)(v3 + 248);
  v16 = *(_BYTE *)(v3 + 252);
  *(_QWORD *)(v3 + 216) = a1;
  *(_QWORD *)(v3 + 224) = a2;
  *(_QWORD *)(v3 + 232) = 0;
  *(_QWORD *)(v3 + 240) = 0;
  *(_QWORD *)(v3 + 245) = 0;
  swift_bridgeObjectRetain();
  sub_24A27FF28(v11, v12, v13, v14, v15, v16);
  v17 = *(_QWORD *)(v3 + 304);
  v18 = *(_QWORD *)(v3 + 312);
  v19 = *(_QWORD *)(v3 + 320);
  v20 = *(_QWORD *)(v3 + 328);
  v21 = *(unsigned int *)(v3 + 336) | ((unint64_t)*(unsigned __int8 *)(v3 + 340) << 32);
  *(_OWORD *)(v3 + 304) = 0u;
  *(_OWORD *)(v3 + 320) = 0u;
  *(_DWORD *)(v3 + 336) = 0;
  *(_BYTE *)(v3 + 340) = -1;
  sub_24A27FF10(v17, v18, v19, v20, v21);
  if (*(_QWORD *)(v3 + 72))
  {
    swift_beginAccess();
    v22 = *(_QWORD *)(v3 + 136);
    if (*(_QWORD *)(v22 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v23 = sub_24A2852AC(a1, a2);
      if ((v24 & 1) != 0)
      {
        v25 = *(id *)(*(_QWORD *)(v22 + 56) + 8 * v23);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        objc_msgSend(v25, sel_addSubview_, *(_QWORD *)(v3 + 112));

      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
    }
  }
  return objc_msgSend(*(id *)(v3 + 112), sel_setNeedsDisplay, v27, v28[0]);
}

void sub_24A281960(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
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
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
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
  char v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  char v41;
  char v42;
  char v43;
  char v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v51;
  char v52;
  _OWORD v53[8];
  char v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  char v63;
  _QWORD v64[3];
  uint64_t v65;
  uint64_t v66;

  swift_beginAccess();
  sub_24A27F738(v1 + 32, (uint64_t)&v55);
  if (*((_QWORD *)&v56 + 1))
  {
    sub_24A2747D4(&v55, (uint64_t)v64);
    v2 = objc_msgSend(*(id *)(v1 + 104), sel_commandBuffer);
    if (v2)
    {
      v3 = v2;
      if (*(unsigned __int8 *)(v1 + 340) == 255)
      {
        v4 = *(_OWORD *)(v1 + 248);
        v5 = *(_OWORD *)(v1 + 280);
        v61 = *(_OWORD *)(v1 + 264);
        v62 = v5;
        v63 = *(_BYTE *)(v1 + 296);
        v6 = *(_OWORD *)(v1 + 216);
        v59 = *(_OWORD *)(v1 + 232);
        v60 = v4;
        v57 = *(_OWORD *)(v1 + 200);
        v58 = v6;
        v7 = *(_OWORD *)(v1 + 184);
        v55 = *(_OWORD *)(v1 + 168);
        v56 = v7;
        v8 = *((_QWORD *)&v60 + 1);
        v48 = *((_QWORD *)&v61 + 1);
        v49 = v61;
        v46 = *((_QWORD *)&v5 + 1);
        v47 = v5;
        v10 = *((_QWORD *)&v6 + 1);
        v9 = v6;
        v11 = *((_QWORD *)&v59 + 1);
        v12 = v59;
        LODWORD(v13) = v60;
        LOBYTE(v14) = BYTE4(v60);
        v44 = BYTE9(v57);
        v45 = v63;
        v42 = v7;
        v43 = BYTE8(v57);
        v15 = *((_QWORD *)&v7 + 1);
        v16 = v57;
        v41 = v55;
        v17 = *((_QWORD *)&v55 + 1);
        sub_24A2874D8((uint64_t)&v55, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A2874A0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A2874CC);
      }
      else
      {
        v13 = *(unsigned int *)(v1 + 336) | ((unint64_t)*(unsigned __int8 *)(v1 + 340) << 32);
        v12 = *(_QWORD *)(v1 + 320);
        v22 = *(_QWORD *)(v1 + 328);
        v9 = *(_QWORD *)(v1 + 304);
        v10 = *(_QWORD *)(v1 + 312);
        v23 = *(_OWORD *)(v1 + 248);
        v24 = *(_OWORD *)(v1 + 280);
        v61 = *(_OWORD *)(v1 + 264);
        v62 = v24;
        v63 = *(_BYTE *)(v1 + 296);
        v25 = *(_OWORD *)(v1 + 200);
        v26 = *(_OWORD *)(v1 + 184);
        v55 = *(_OWORD *)(v1 + 168);
        v56 = v26;
        v27 = *(_OWORD *)(v1 + 216);
        v57 = v25;
        v58 = v27;
        v59 = *(_OWORD *)(v1 + 232);
        v60 = v23;
        v39 = *((_QWORD *)&v23 + 1);
        v48 = *((_QWORD *)&v61 + 1);
        v49 = v61;
        v46 = *((_QWORD *)&v62 + 1);
        v47 = v62;
        v44 = BYTE9(v25);
        v45 = v63;
        v42 = v56;
        v43 = BYTE8(v25);
        v15 = *((_QWORD *)&v56 + 1);
        v16 = v25;
        v41 = v55;
        v17 = *((_QWORD *)&v55 + 1);
        v28 = *((_QWORD *)&v27 + 1);
        v38 = v27;
        v40 = v2;
        v29 = *((_QWORD *)&v59 + 1);
        v30 = v59;
        v31 = v23;
        v37 = BYTE4(v23);
        v11 = v22;
        sub_24A287A2C(v9, v10, v12, v22, v13);
        sub_24A2874D8((uint64_t)&v55, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A2874A0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A2874CC);
        v32 = v28;
        v33 = v30;
        v8 = v39;
        v34 = v29;
        v14 = HIDWORD(v13) & 1;
        v3 = v40;
        sub_24A27FF28(v38, v32, v33, v34, v31, v37);
      }
      LOBYTE(v55) = v41;
      *((_QWORD *)&v55 + 1) = v17;
      LOBYTE(v56) = v42;
      *((_QWORD *)&v56 + 1) = v15;
      *(_QWORD *)&v57 = v16;
      BYTE8(v57) = v43;
      BYTE9(v57) = v44;
      *(_QWORD *)&v58 = v9;
      *((_QWORD *)&v58 + 1) = v10;
      *(_QWORD *)&v59 = v12;
      *((_QWORD *)&v59 + 1) = v11;
      LODWORD(v60) = v13;
      BYTE4(v60) = v14;
      *((_QWORD *)&v60 + 1) = v8;
      *(_QWORD *)&v61 = v49;
      *((_QWORD *)&v61 + 1) = v48;
      *(_QWORD *)&v62 = v47;
      *((_QWORD *)&v62 + 1) = v46;
      v63 = v45;
      v35 = v65;
      v36 = v66;
      __swift_project_boxed_opaque_existential_0(v64, v65);
      v53[7] = v62;
      v54 = v63;
      v53[2] = v57;
      v53[3] = v58;
      v53[5] = v60;
      v53[6] = v61;
      v53[4] = v59;
      v53[0] = v55;
      v53[1] = v56;
      sub_24A2874D8((uint64_t)&v55, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A2874A0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A2874CC);
      v51 = 0;
      v52 = -1;
      (*(void (**)(_OWORD *, id, uint64_t *, void *, uint64_t, uint64_t))(v36 + 48))(v53, objc_msgSend(a1, sel_texture), &v51, v3, v35, v36);
      sub_24A2874D8((uint64_t)&v55, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
      swift_unknownObjectRelease();
      objc_msgSend(v3, sel_commit);
      objc_msgSend(v3, sel_waitUntilScheduled);
      objc_msgSend(a1, sel_present);
      sub_24A2874D8((uint64_t)&v55, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
      swift_unknownObjectRelease();
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v64);
  }
  else
  {
    sub_24A27FED0((uint64_t)&v55);
    if (qword_25791F7E8 != -1)
      swift_once();
    v18 = sub_24A292D78();
    __swift_project_value_buffer(v18, (uint64_t)qword_2579202E0);
    v19 = sub_24A292D60();
    v20 = sub_24A292F70();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_24A26B000, v19, v20, "trying to update layer content with no renderer!", v21, 2u);
      MEMORY[0x24BD0C57C](v21, -1, -1);
    }

  }
}

void sub_24A281F8C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *);
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(void);
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  id v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t);
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  char *v61;
  uint64_t v62;
  char *v63;
  unint64_t *v64;
  double v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  __int128 *v71;
  id v72;
  id v73;
  NSObject *v74;
  os_log_type_t v75;
  uint64_t v76;
  _QWORD *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  NSObject *v89;
  os_log_type_t v90;
  _BOOL4 v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  os_log_type_t v95;
  uint8_t *v96;
  os_log_type_t v97;
  uint8_t *v98;
  uint64_t v99;
  CGColorSpaceRef v100;
  _QWORD *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  CGColorSpace *v106;
  double v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  _QWORD *v116;
  uint64_t v117;
  __int128 v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  __int128 v122;
  uint64_t v123;
  __int128 *v124;
  uint64_t v125;
  int v126;
  int v127;
  int v128;
  int v129;
  int v130;
  unsigned int v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  double v140;
  uint64_t v141;
  uint64_t v142;
  double v143;
  char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  char v148;
  _OWORD v149[8];
  char v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  char v159;
  char v160[8];
  uint64_t v161;
  char v162;
  uint64_t v163;
  uint64_t v164;
  __int16 v165;
  __int128 v166;
  __int128 v167;
  int v168;
  char v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  uint64_t v173;
  uint64_t v174;
  char v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  unsigned __int8 v184;
  _QWORD v185[3];
  uint64_t v186;
  uint64_t v187;

  v1 = v0;
  v2 = *v0;
  v3 = sub_24A292D78();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v144 = (char *)&v108 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v145 = v1[9];
  if (v145)
  {
    swift_beginAccess();
    sub_24A27F738((uint64_t)(v1 + 4), (uint64_t)&v176);
    if (*((_QWORD *)&v177 + 1))
    {
      sub_24A2747D4(&v176, (uint64_t)v185);
      if ((v1[45] & 1) != 0)
      {
        if (qword_25791F7E8 != -1)
          swift_once();
        __swift_project_value_buffer(v3, (uint64_t)qword_2579202E0);
        v6 = sub_24A292D60();
        v7 = sub_24A292F70();
        if (os_log_type_enabled(v6, v7))
        {
          v8 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v8 = 0;
          _os_log_impl(&dword_24A26B000, v6, v7, "trying to generate snapshots with no known pixel size", v8, 2u);
          MEMORY[0x24BD0C57C](v8, -1, -1);
        }
        goto LABEL_74;
      }
      v143 = *((double *)v1 + 43);
      v140 = *((double *)v1 + 44);
      v141 = v4;
      v12 = *(_OWORD *)(v1 + 31);
      v13 = *(_OWORD *)(v1 + 35);
      v182 = *(_OWORD *)(v1 + 33);
      v183 = v13;
      v184 = *((_BYTE *)v1 + 296);
      v14 = *(_OWORD *)(v1 + 23);
      v15 = *(_OWORD *)(v1 + 27);
      v178 = *(_OWORD *)(v1 + 25);
      v179 = v15;
      v180 = *(_OWORD *)(v1 + 29);
      v181 = v12;
      v176 = *(_OWORD *)(v1 + 21);
      v177 = v14;
      v16 = *((_QWORD *)&v12 + 1);
      v17 = (void *)*((_QWORD *)&v182 + 1);
      v18 = v182;
      v19 = *((_QWORD *)&v13 + 1);
      v20 = v13;
      v21 = v184;
      swift_bridgeObjectRetain();
      sub_24A2874D8((uint64_t)&v176, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A2874A0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A2874CC);
      if (v21 == 1)
      {
        sub_24A28755C(v16, v18, v17, v20, v19, 1);
        v17 = 0;
        v20 = 0;
        v19 = 0;
        v16 = v18;
        v18 = 0;
      }
      v120 = v2;
      v22 = *((_QWORD *)&v177 + 1);
      v23 = v178;
      v24 = *((_QWORD *)&v176 + 1);
      v126 = v176;
      v127 = v177;
      v160[0] = v176;
      v161 = *((_QWORD *)&v176 + 1);
      v162 = v177;
      v163 = *((_QWORD *)&v177 + 1);
      v164 = v178;
      v128 = BYTE8(v178);
      v129 = BYTE9(v178);
      v165 = WORD4(v178);
      v134 = *((_QWORD *)&v179 + 1);
      v135 = v179;
      v166 = v179;
      v132 = *((_QWORD *)&v180 + 1);
      v133 = v180;
      v167 = v180;
      v130 = BYTE4(v181);
      v131 = v181;
      v168 = v181;
      v169 = BYTE4(v181);
      v142 = v16;
      v170 = v16;
      v138 = v17;
      v139 = v18;
      v171 = v18;
      v172 = v17;
      v136 = v19;
      v137 = v20;
      v173 = v20;
      v174 = v19;
      v175 = 0;
      if (qword_25791F7E8 != -1)
        swift_once();
      v25 = v143;
      v26 = __swift_project_value_buffer(v3, (uint64_t)qword_2579202E0);
      v27 = v141;
      v28 = *(void (**)(char *))(v141 + 16);
      v146 = v26;
      v28(v144);
      v29 = sub_24A292D60();
      v30 = sub_24A292F64();
      if (os_log_type_enabled(v29, v30))
      {
        v116 = v1;
        v31 = (uint8_t *)swift_slowAlloc();
        v32 = swift_slowAlloc();
        *(_QWORD *)&v151 = v32;
        *(_DWORD *)v31 = 136315138;
        v33 = 0xD000000000000014;
        v34 = 0x800000024A2984D0;
        switch(v142)
        {
          case 1:
            v34 = 0xE800000000000000;
            v33 = 0x7469617274726F50;
            break;
          case 2:
            break;
          case 3:
            v34 = 0xEF74686769522065;
            goto LABEL_24;
          case 4:
            v34 = 0xEE007466654C2065;
LABEL_24:
            v33 = 0x70616373646E614CLL;
            break;
          default:
            v34 = 0x800000024A2984B0;
            break;
        }
        *(_QWORD *)&v149[0] = sub_24A26FA2C(v33, v34, (uint64_t *)&v151);
        sub_24A292FF4();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24A26B000, v29, v30, "generating look snapshots for orientation %s", v31, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24BD0C57C](v32, -1, -1);
        MEMORY[0x24BD0C57C](v31, -1, -1);

        (*(void (**)(char *, uint64_t))(v27 + 8))(v144, v3);
        v1 = v116;
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v27 + 8))(v144, v3);
      }
      v35 = v120;
      if (v25 <= -9.22337204e18)
      {
        __break(1u);
      }
      else if (v25 < 9.22337204e18)
      {
        if ((*(_QWORD *)&v143 & 0x7FF0000000000000) != 0x7FF0000000000000
          && (*(_QWORD *)&v140 & 0x7FF0000000000000) != 0x7FF0000000000000)
        {
          if (v140 > -9.22337204e18)
          {
            if (v140 < 9.22337204e18)
            {
              v36 = (uint64_t)v140;
              v37 = v1[2];
              v38 = *(uint64_t (**)(void))(v1[3] + 8);
              v114 = v1[3];
              v115 = v37;
              v39 = v38();
              v40 = (void *)objc_opt_self();
              v121 = v36;
              v41 = objc_msgSend(v40, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, v39, (uint64_t)v25, v36, 0);
              objc_msgSend(v41, sel_setUsage_, 4);
              objc_msgSend(v41, sel_setStorageMode_, 0);
              v42 = swift_allocObject();
              v43 = sub_24A26DA84(v39);
              v44 = (uint64_t)v25 * v43;
              v113 = (uint64_t)v25;
              if ((unsigned __int128)((uint64_t)v25 * (__int128)v43) >> 64 == v44 >> 63)
              {
                v119 = v42;
                *(_QWORD *)(v42 + 16) = v44;
                v45 = (uint64_t *)(v42 + 16);
                if (v44 <= 0)
                  v46 = -(-v44 & 0xF);
                else
                  v46 = v44 & 0xF;
                if (v46)
                {
                  v47 = 16 - v46;
                  v48 = __OFADD__(v44, v47);
                  v44 += v47;
                  if (v48)
                  {
LABEL_85:
                    __break(1u);
                    goto LABEL_86;
                  }
                  *v45 = v44;
                }
                v49 = v121 * v44;
                if ((unsigned __int128)(v121 * (__int128)v44) >> 64 == (v121 * v44) >> 63)
                {
                  v50 = *(_QWORD *)(v145 + 16);
                  if ((unsigned __int128)(v50 * (__int128)v49) >> 64 == (v50 * v49) >> 63)
                  {
                    v51 = objc_msgSend((id)v1[12], sel_newBufferWithLength_options_);
                    if (v51)
                    {
                      v110 = v39;
                      v52 = v51;
                      swift_unknownObjectRetain();
                      v53 = v41;
                      v54 = v49;
                      v55 = v53;
                      v109 = v54;
                      v56 = sub_24A2877D4(0, v50, v52, (uint64_t)v53, v54);
                      v112 = v52;
                      swift_unknownObjectRelease();
                      v111 = v55;

                      v140 = COERCE_DOUBLE(objc_msgSend((id)v1[13], sel_commandBuffer));
                      if (v140 != 0.0)
                      {
                        sub_24A292D0C();
                        v57 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCF428];
                        v108 = swift_allocBox();
                        v59 = v58;
                        *(_QWORD *)&v151 = MEMORY[0x24BEE4AF8];
                        sub_24A26E220(&qword_2579206C8, v57, MEMORY[0x24BDCF468]);
                        __swift_instantiateConcreteTypeFromMangledName(&qword_2579206D0);
                        sub_24A287B80((unint64_t *)&unk_2579206D8, &qword_2579206D0);
                        v141 = v59;
                        sub_24A293018();
                        v61 = *(char **)(v145 + 16);
                        if (!v61)
                        {
                          swift_bridgeObjectRelease();
LABEL_68:
                          v99 = (*(uint64_t (**)(void))(v114 + 16))();
                          if (v99)
                          {
                            v100 = (CGColorSpaceRef)v99;
LABEL_71:
                            v101 = (_QWORD *)swift_allocObject();
                            v101[2] = v142;
                            v101[3] = v1;
                            v102 = v145;
                            v101[4] = v112;
                            v101[5] = v102;
                            v103 = v109;
                            v101[6] = v108;
                            v101[7] = v103;
                            v104 = v121;
                            v101[8] = v113;
                            v101[9] = v104;
                            v101[10] = v119;
                            v101[11] = v100;
                            v101[12] = v110;
                            v101[13] = v35;
                            *(_QWORD *)&v153 = sub_24A287AA0;
                            *((_QWORD *)&v153 + 1) = v101;
                            *(_QWORD *)&v151 = MEMORY[0x24BDAC760];
                            *((_QWORD *)&v151 + 1) = 1107296256;
                            *(_QWORD *)&v152 = sub_24A275124;
                            *((_QWORD *)&v152 + 1) = &block_descriptor_0;
                            v105 = _Block_copy(&v151);
                            swift_unknownObjectRetain();
                            swift_retain();
                            swift_retain();
                            swift_retain();
                            v106 = v100;
                            swift_release();
                            v107 = v140;
                            objc_msgSend(*(id *)&v140, sel_addCompletedHandler_, v105);
                            _Block_release(v105);
                            objc_msgSend(*(id *)&v107, sel_commit);

                            swift_release();
                            swift_unknownObjectRelease();
                            swift_unknownObjectRelease();
                            swift_release();

                            sub_24A2874D8((uint64_t)v160, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
                            goto LABEL_75;
                          }
                          v100 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF228]);
                          if (v100)
                            goto LABEL_71;
LABEL_87:
                          __break(1u);
                          JUMPOUT(0x24A2830C0);
                        }
                        v116 = v1;
                        if ((unint64_t)v61 <= *(_QWORD *)(v56 + 16))
                        {
                          v62 = v56;
                          v63 = 0;
                          v124 = &v155;
                          v64 = (unint64_t *)(v145 + 40);
                          *(_QWORD *)&v60 = 136446210;
                          v122 = v60;
                          v117 = MEMORY[0x24BEE4AD8] + 8;
                          *(_QWORD *)&v60 = 136446466;
                          v118 = v60;
                          v65 = 0.0;
                          v144 = v61;
                          v125 = v56;
                          do
                          {
                            v67 = *((uint64_t *)v64 - 1);
                            v66 = *v64;
                            v68 = *(_QWORD *)(v62 + 8 * (_QWORD)v63 + 32);
                            if (v68)
                            {
                              v70 = v186;
                              v69 = v187;
                              __swift_project_boxed_opaque_existential_0(v185, v186);
                              swift_bridgeObjectRetain_n();
                              swift_unknownObjectRetain();
                              sub_24A2874D8((uint64_t)v160, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A2874A0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A2874CC);
                              sub_24A27FF28(v135, v134, v133, v132, v131, v130);
                              LOBYTE(v151) = v126;
                              *((_QWORD *)&v151 + 1) = v24;
                              LOBYTE(v152) = v127;
                              *((_QWORD *)&v152 + 1) = v22;
                              *(_QWORD *)&v153 = v23;
                              BYTE8(v153) = v128;
                              BYTE9(v153) = v129;
                              v143 = *(double *)&v67;
                              *(_QWORD *)&v154 = v67;
                              *((_QWORD *)&v154 + 1) = v66;
                              v71 = v124;
                              *(_QWORD *)((char *)v124 + 13) = 0;
                              *(_QWORD *)v71 = 0;
                              *((_QWORD *)v71 + 1) = 0;
                              *((_QWORD *)&v156 + 1) = v142;
                              *(_QWORD *)&v157 = v139;
                              *((_QWORD *)&v157 + 1) = v138;
                              *(_QWORD *)&v158 = v137;
                              *((_QWORD *)&v158 + 1) = v136;
                              v159 = 0;
                              v149[6] = v157;
                              v149[7] = v158;
                              v150 = 0;
                              v149[2] = v153;
                              v149[3] = v154;
                              v149[4] = v155;
                              v149[5] = v156;
                              v149[0] = v151;
                              v149[1] = v152;
                              v147 = 0;
                              v148 = -1;
                              (*(void (**)(_OWORD *, uint64_t, uint64_t *, double, uint64_t, uint64_t))(v69 + 48))(v149, v68, &v147, COERCE_DOUBLE(*(_QWORD *)&v140), v70, v69);
                              if (v65 == 0.0)
                              {
                                sub_24A2874D8((uint64_t)&v151, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
                                swift_bridgeObjectRetain();
                                v89 = sub_24A292D60();
                                v90 = sub_24A292F64();
                                v91 = os_log_type_enabled(v89, v90);
                                v61 = v144;
                                if (v91)
                                {
                                  v92 = swift_slowAlloc();
                                  v93 = swift_slowAlloc();
                                  *(_QWORD *)&v149[0] = v93;
                                  *(_DWORD *)v92 = v122;
                                  swift_bridgeObjectRetain();
                                  *(_QWORD *)(v92 + 4) = sub_24A26FA2C(*(uint64_t *)&v143, v66, (uint64_t *)v149);
                                  swift_bridgeObjectRelease_n();
                                  _os_log_impl(&dword_24A26B000, v89, v90, "snapshotted look “%{public}s”", (uint8_t *)v92, 0xCu);
                                  swift_arrayDestroy();
                                  MEMORY[0x24BD0C57C](v93, -1, -1);
                                  v94 = v92;
                                  v61 = v144;
                                  MEMORY[0x24BD0C57C](v94, -1, -1);

                                  swift_unknownObjectRelease();
                                }
                                else
                                {

                                  swift_unknownObjectRelease();
                                  swift_bridgeObjectRelease_n();
                                }
                                v62 = v125;
                              }
                              else
                              {
                                sub_24A2874D8((uint64_t)&v151, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
                                v72 = *(id *)&v65;
                                swift_bridgeObjectRetain();
                                v73 = *(id *)&v65;
                                v74 = sub_24A292D60();
                                v75 = sub_24A292F70();
                                if (os_log_type_enabled(v74, v75))
                                {
                                  v76 = swift_slowAlloc();
                                  v77 = (_QWORD *)swift_slowAlloc();
                                  v123 = swift_slowAlloc();
                                  *(_QWORD *)&v149[0] = v123;
                                  *(_DWORD *)v76 = v118;
                                  swift_bridgeObjectRetain();
                                  *(_QWORD *)(v76 + 4) = sub_24A26FA2C(*(uint64_t *)&v143, v66, (uint64_t *)v149);
                                  swift_bridgeObjectRelease_n();
                                  *(_WORD *)(v76 + 12) = 2112;
                                  v78 = *(id *)&v65;
                                  v79 = _swift_stdlib_bridgeErrorToNSError();
                                  *(_QWORD *)(v76 + 14) = v79;
                                  *v77 = v79;

                                  _os_log_impl(&dword_24A26B000, v74, v75, "couldn’t snapshot look “%{public}s” due to renderer error: %@", (uint8_t *)v76, 0x16u);
                                  __swift_instantiateConcreteTypeFromMangledName(&qword_2579202A8);
                                  swift_arrayDestroy();
                                  MEMORY[0x24BD0C57C](v77, -1, -1);
                                  v80 = v123;
                                  swift_arrayDestroy();
                                  MEMORY[0x24BD0C57C](v80, -1, -1);
                                  MEMORY[0x24BD0C57C](v76, -1, -1);
                                }
                                else
                                {
                                  swift_bridgeObjectRelease_n();

                                }
                                v62 = v125;
                                v61 = v144;
                                sub_24A292CF4();

                                swift_unknownObjectRelease();
                                v65 = 0.0;
                              }
                            }
                            else
                            {
                              swift_bridgeObjectRetain_n();
                              v81 = sub_24A292D60();
                              v82 = sub_24A292F70();
                              if (os_log_type_enabled(v81, (os_log_type_t)v82))
                              {
                                v83 = swift_slowAlloc();
                                v143 = v65;
                                v84 = v83;
                                v85 = v62;
                                v86 = swift_slowAlloc();
                                *(_QWORD *)&v151 = v86;
                                *(_DWORD *)v84 = v122;
                                swift_bridgeObjectRetain();
                                *(_QWORD *)(v84 + 4) = sub_24A26FA2C(v67, v66, (uint64_t *)&v151);
                                swift_bridgeObjectRelease_n();
                                _os_log_impl(&dword_24A26B000, v81, (os_log_type_t)v82, "couldn’t snapshot look “%{public}s”, didn’t get a texture from the buffer", (uint8_t *)v84, 0xCu);
                                swift_arrayDestroy();
                                v87 = v86;
                                v62 = v85;
                                MEMORY[0x24BD0C57C](v87, -1, -1);
                                v88 = v84;
                                v65 = v143;
                                v61 = v144;
                                MEMORY[0x24BD0C57C](v88, -1, -1);

                              }
                              else
                              {

                                swift_bridgeObjectRelease_n();
                              }
                              sub_24A292CF4();
                            }
                            ++v63;
                            v64 += 2;
                          }
                          while (v61 != v63);
                          swift_bridgeObjectRelease();
                          v1 = v116;
                          v35 = v120;
                          goto LABEL_68;
                        }
LABEL_86:
                        __break(1u);
                        goto LABEL_87;
                      }
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      v6 = sub_24A292D60();
                      v97 = sub_24A292F70();
                      if (os_log_type_enabled(v6, v97))
                      {
                        v98 = (uint8_t *)swift_slowAlloc();
                        *(_WORD *)v98 = 0;
                        _os_log_impl(&dword_24A26B000, v6, v97, "couldn’t make command buffer for look snapshotting", v98, 2u);
                        MEMORY[0x24BD0C57C](v98, -1, -1);

                        sub_24A2874D8((uint64_t)v160, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
                        swift_release();
                        swift_unknownObjectRelease();
                        goto LABEL_75;
                      }

                      swift_unknownObjectRelease();
                    }
                    else
                    {
                      swift_bridgeObjectRelease();
                      v6 = sub_24A292D60();
                      v95 = sub_24A292F70();
                      if (os_log_type_enabled(v6, v95))
                      {
                        v96 = (uint8_t *)swift_slowAlloc();
                        *(_WORD *)v96 = 0;
                        _os_log_impl(&dword_24A26B000, v6, v95, "couldn’t make buffer for look snapshots", v96, 2u);
                        MEMORY[0x24BD0C57C](v96, -1, -1);

                        sub_24A2874D8((uint64_t)v160, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
                        swift_release();
LABEL_75:
                        __swift_destroy_boxed_opaque_existential_0((uint64_t)v185);
                        return;
                      }

                    }
                    sub_24A2874D8((uint64_t)v160, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
                    swift_release();
LABEL_74:

                    goto LABEL_75;
                  }
                  goto LABEL_84;
                }
LABEL_83:
                __break(1u);
LABEL_84:
                __break(1u);
                goto LABEL_85;
              }
LABEL_82:
              __break(1u);
              goto LABEL_83;
            }
LABEL_81:
            __break(1u);
            goto LABEL_82;
          }
LABEL_80:
          __break(1u);
          goto LABEL_81;
        }
LABEL_79:
        __break(1u);
        goto LABEL_80;
      }
      __break(1u);
      goto LABEL_79;
    }
    sub_24A27FED0((uint64_t)&v176);
    if (qword_25791F7E8 != -1)
      swift_once();
    __swift_project_value_buffer(v3, (uint64_t)qword_2579202E0);
    v9 = sub_24A292D60();
    v10 = sub_24A292F70();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_24A26B000, v9, v10, "trying to generate snapshots when there’s no renderer yet", v11, 2u);
      MEMORY[0x24BD0C57C](v11, -1, -1);
    }

  }
}

void sub_24A2830D0(void *a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
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
  void *v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t aBlock[7];

  v60 = a7;
  v61 = a8;
  v64 = a5;
  v65 = a6;
  v58 = a12;
  v59 = a13;
  v66 = a11;
  v67 = a2;
  v62 = a4;
  v63 = a10;
  v56 = a3;
  v57 = a9;
  v14 = sub_24A292D84();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_24A292DA8();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v50 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_24A292D78();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v50 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(a1, sel_status) == (id)4)
  {
    v52 = v19;
    v54 = v17;
    if (qword_25791F7E8 != -1)
      swift_once();
    v53 = v18;
    v26 = __swift_project_value_buffer(v22, (uint64_t)qword_2579202E0);
    (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v25, v26, v22);
    v27 = sub_24A292D60();
    v28 = sub_24A292F64();
    v29 = os_log_type_enabled(v27, v28);
    v55 = v15;
    if (v29)
    {
      v51 = v14;
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      aBlock[0] = v31;
      *(_DWORD *)v30 = 136446210;
      v50 = v31;
      v32 = 0xD000000000000014;
      v33 = 0x800000024A2984D0;
      switch((unint64_t)v67)
      {
        case 1uLL:
          v33 = 0xE800000000000000;
          v32 = 0x7469617274726F50;
          break;
        case 2uLL:
          break;
        case 3uLL:
          v33 = 0xEF74686769522065;
          goto LABEL_16;
        case 4uLL:
          v33 = 0xEE007466654C2065;
LABEL_16:
          v32 = 0x70616373646E614CLL;
          break;
        default:
          v33 = 0x800000024A2984B0;
          break;
      }
      v68 = sub_24A26FA2C(v32, v33, aBlock);
      sub_24A292FF4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24A26B000, v27, v28, "snapshot rendering finished for %{public}s", v30, 0xCu);
      v36 = v50;
      swift_arrayDestroy();
      MEMORY[0x24BD0C57C](v36, -1, -1);
      MEMORY[0x24BD0C57C](v30, -1, -1);

      (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v22);
      v14 = v51;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v22);
    }
    sub_24A287BC0(0, (unint64_t *)&qword_257920080);
    v37 = (void *)sub_24A292FAC();
    v38 = swift_allocObject();
    swift_weakInit();
    v39 = (_QWORD *)swift_allocObject();
    v41 = v62;
    v40 = v63;
    v39[2] = v38;
    v39[3] = v41;
    v42 = v65;
    v39[4] = v64;
    v39[5] = v42;
    v43 = v61;
    v39[6] = v60;
    v39[7] = v43;
    v39[8] = v57;
    v39[9] = v40;
    v44 = v66;
    v45 = v58;
    v39[10] = v66;
    v39[11] = v45;
    v46 = v59;
    v39[12] = v67;
    v39[13] = v46;
    aBlock[4] = (uint64_t)sub_24A287B44;
    aBlock[5] = (uint64_t)v39;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_24A287C04;
    aBlock[3] = (uint64_t)&block_descriptor_13;
    v47 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    v48 = v44;
    swift_release();
    sub_24A292D90();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_24A26E220((unint64_t *)&qword_2579206E8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579206F0);
    sub_24A287B80((unint64_t *)&qword_2579206F8, &qword_2579206F0);
    v49 = v54;
    sub_24A293018();
    MEMORY[0x24BD0BDF0](0, v21, v49, v47);
    _Block_release(v47);

    (*(void (**)(char *, uint64_t))(v55 + 8))(v49, v14);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v21, v53);
  }
  else
  {
    if (qword_25791F7E8 != -1)
      swift_once();
    __swift_project_value_buffer(v22, (uint64_t)qword_2579202E0);
    v67 = sub_24A292D60();
    v34 = sub_24A292F70();
    if (os_log_type_enabled(v67, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_24A26B000, v67, v34, "look-snapshotting command buffer did not complete successfully", v35, 2u);
      MEMORY[0x24BD0C57C](v35, -1, -1);
    }

  }
}

uint64_t sub_24A2836D0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const char *a5, size_t a6, size_t a7, uint64_t a8, CGColorSpace *a9, uint64_t a10, uint64_t a11)
{
  NSObject *v14;
  unint64_t isa;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t result;
  uint64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t *v30;
  int64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  CGDataProvider *v35;
  CGBitmapInfo v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint8_t *v39;
  CGImageRef v40;
  CGImageRef v41;
  NSObject *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  _BOOL8 v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint8_t *v53;
  uint64_t *v54;
  _QWORD *v55;
  unint64_t v56;
  uint64_t v57;
  BOOL v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t *v62;
  __int128 v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  id v72;
  uint64_t v73;
  NSObject *v74;
  os_log_type_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  os_log_type_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  char v87;
  uint64_t v88;
  unint64_t v89;
  char v90;
  id v91;
  id v92;
  unint64_t v93;
  char *v94;
  NSObject *v95;
  os_log_type_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  NSObject *v105;
  os_log_type_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  unint64_t v114;
  char v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  char *v121;
  uint64_t v122;
  unint64_t v123;
  unint64_t v124;
  size_t *v125;
  CGColorSpaceRef v126;
  uint64_t v127;
  size_t v128;
  size_t v129;
  int64_t v130;
  NSObject *v131;
  __int128 v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t v135;
  void (*v136)(char *, _QWORD, uint64_t);
  uint64_t v137;
  __int128 v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142[2];

  v129 = a7;
  v128 = a6;
  v130 = (int64_t)a5;
  v14 = sub_24A292D78();
  isa = (unint64_t)v14[-1].isa;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v116 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v116 - v19;
  v137 = sub_24A292D0C();
  v139 = *(_QWORD *)(v137 - 8);
  MEMORY[0x24BDAC7A8](v137);
  v22 = (char *)&v116 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v138 = swift_projectBox();
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (!result)
    return result;
  v24 = result;
  v120 = v18;
  v25 = a11;
  *(_QWORD *)&v132 = objc_msgSend((id)swift_unknownObjectRetain(), sel_contents);
  v26 = a2;
  v27 = (uint64_t)v26;
  v28 = *(_QWORD *)(a3 + 16);
  v131 = v14;
  v123 = isa;
  v135 = v28;
  if (!v28)
  {
    v136 = 0;
    v102 = 256;
    if (*(_BYTE *)(v24 + 296))
      v102 = 264;
    isUniquelyReferenced_nonNull_native = *(_QWORD *)(v24 + v102);
    if (isUniquelyReferenced_nonNull_native == a11)
    {
LABEL_81:
      sub_24A284980((char *)v25);
      goto LABEL_94;
    }
    goto LABEL_76;
  }
  v121 = v20;
  v119 = (uint64_t)v26;
  v126 = a9;
  v118 = v24;
  v133 = (uint64_t *)(v24 + 128);
  swift_beginAccess();
  v125 = (size_t *)(a8 + 16);
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = 0;
  v27 = 0;
  v136 = *(void (**)(char *, _QWORD, uint64_t))(v139 + 16);
  v117 = a3;
  v30 = (uint64_t *)(a3 + 40);
  v122 = a10;
  v124 = a10 - 70;
  v134 = a11;
  isa = 0x25791F000;
  v24 = v135;
  v31 = v130;
  while (1)
  {
    v14 = v137;
    v136(v22, v138, v137);
    v34 = sub_24A292D00();
    (*(void (**)(char *, NSObject *))(v139 + 8))(v22, v14);
    if ((v34 & 1) == 0)
      break;
LABEL_7:
    ++v27;
    v30 += 2;
    if (v24 == v27)
    {
      v136 = (void (*)(char *, _QWORD, uint64_t))isUniquelyReferenced_nonNull_native;
      v24 = v118;
      v60 = 256;
      if (*(_BYTE *)(v118 + 296))
        v60 = 264;
      isUniquelyReferenced_nonNull_native = *(_QWORD *)(v118 + v60);
      if (isUniquelyReferenced_nonNull_native == v25)
      {
        v61 = v117;
        swift_bridgeObjectRetain();
        v139 = v24 + 120;
        swift_beginAccess();
        swift_beginAccess();
        v62 = (unint64_t *)(v61 + 40);
        *(_QWORD *)&v63 = 136446210;
        v138 = v63;
        v137 = MEMORY[0x24BEE4AD8] + 8;
        *(_QWORD *)&v63 = 136446466;
        v132 = v63;
        v130 = (int64_t)"Unknown Orientation";
        v129 = (size_t)"init(nibName:bundle:)";
        v64 = (uint64_t)v131;
        v65 = v135;
        while (1)
        {
          v67 = *(v62 - 1);
          v66 = *v62;
          v68 = *(_QWORD *)v139;
          v69 = *(_QWORD *)(*(_QWORD *)v139 + 16);
          swift_bridgeObjectRetain();
          if (!v69)
            goto LABEL_49;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v70 = sub_24A2852AC(v67, v66);
          if ((v71 & 1) == 0)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
LABEL_49:
            if (*(_QWORD *)(isa + 2024) != -1)
              swift_once();
            __swift_project_value_buffer(v64, (uint64_t)qword_2579202E0);
            swift_bridgeObjectRetain();
            v79 = sub_24A292D60();
            v80 = sub_24A292F70();
            if (os_log_type_enabled(v79, v80))
            {
              v81 = v65;
              v82 = swift_slowAlloc();
              v83 = swift_slowAlloc();
              v142[0] = v83;
              *(_DWORD *)v82 = v138;
              swift_bridgeObjectRetain();
              *(_QWORD *)(v82 + 4) = sub_24A26FA2C(v67, v66, v142);
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_24A26B000, v79, v80, "layer for the “%{public}s” snapshot does not exist!", (uint8_t *)v82, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x24BD0C57C](v83, -1, -1);
              v84 = v82;
              v65 = v81;
              MEMORY[0x24BD0C57C](v84, -1, -1);

            }
            else
            {

              swift_bridgeObjectRelease_n();
            }
            goto LABEL_41;
          }
          v135 = v65;
          v72 = *(id *)(*(_QWORD *)(v68 + 56) + 8 * v70);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (*(_QWORD *)(isa + 2024) != -1)
            swift_once();
          v73 = __swift_project_value_buffer(v64, (uint64_t)qword_2579202E0);
          swift_bridgeObjectRetain_n();
          v74 = sub_24A292D60();
          v75 = sub_24A292F64();
          if (os_log_type_enabled(v74, v75))
          {
            v76 = swift_slowAlloc();
            v77 = swift_slowAlloc();
            v142[0] = v77;
            *(_DWORD *)v76 = v138;
            swift_bridgeObjectRetain();
            *(_QWORD *)(v76 + 4) = sub_24A26FA2C(v67, v66, v142);
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_24A26B000, v74, v75, "applying snapshot to layer for “%{public}s”", (uint8_t *)v76, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x24BD0C57C](v77, -1, -1);
            v78 = v76;
            v64 = (uint64_t)v131;
            MEMORY[0x24BD0C57C](v78, -1, -1);

          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          v85 = *v133;
          if (!*(_QWORD *)(*v133 + 16))
            goto LABEL_60;
          v86 = sub_24A2853C0(v134);
          if ((v87 & 1) == 0)
            goto LABEL_60;
          v88 = *(_QWORD *)(*(_QWORD *)(v85 + 56) + 8 * v86);
          if (!*(_QWORD *)(v88 + 16))
            goto LABEL_60;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v89 = sub_24A2852AC(v67, v66);
          if ((v90 & 1) == 0)
            break;
          v91 = *(id *)(*(_QWORD *)(v88 + 56) + 8 * v89);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          v92 = v91;
          objc_msgSend(v72, sel_setContents_, v92);

LABEL_70:
          isa = 0x25791F000;
          v65 = v135;
LABEL_41:
          v62 += 2;
          if (!--v65)
          {
            swift_bridgeObjectRelease();
            v24 = v118;
            v25 = v134;
            v27 = v119;
            goto LABEL_81;
          }
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_60:
        v93 = v123;
        v94 = v121;
        (*(void (**)(char *, uint64_t, uint64_t))(v123 + 16))(v121, v73, v64);
        swift_bridgeObjectRetain();
        v95 = sub_24A292D60();
        v96 = sub_24A292F70();
        if (os_log_type_enabled(v95, v96))
        {
          v97 = swift_slowAlloc();
          v98 = swift_slowAlloc();
          v142[0] = v98;
          *(_DWORD *)v97 = v132;
          swift_bridgeObjectRetain();
          *(_QWORD *)(v97 + 4) = sub_24A26FA2C(v67, v66, v142);
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v97 + 12) = 2082;
          v99 = 0xD000000000000014;
          v100 = v130 | 0x8000000000000000;
          v101 = v121;
          switch(v134)
          {
            case 1:
              v100 = 0xE800000000000000;
              v99 = 0x7469617274726F50;
              break;
            case 2:
              break;
            case 3:
              v100 = 0xEF74686769522065;
              goto LABEL_66;
            case 4:
              v100 = 0xEE007466654C2065;
LABEL_66:
              v99 = 0x70616373646E614CLL;
              break;
            default:
              v100 = v129 | 0x8000000000000000;
              v99 = 0xD000000000000013;
              v101 = v121;
              break;
          }
          *(_QWORD *)(v97 + 14) = sub_24A26FA2C(v99, v100, v142);
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_24A26B000, v95, v96, "missing snapshot for “%{public}s” in orientation %{public}s — clearing contents", (uint8_t *)v97, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x24BD0C57C](v98, -1, -1);
          MEMORY[0x24BD0C57C](v97, -1, -1);

          v64 = (uint64_t)v131;
          (*(void (**)(char *, NSObject *))(v123 + 8))(v101, v131);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          (*(void (**)(char *, uint64_t))(v93 + 8))(v94, v64);
        }
        objc_msgSend(v72, sel_setContents_, 0);
        goto LABEL_70;
      }
      v14 = v131;
      isa = v123;
      v27 = v119;
LABEL_76:
      if (qword_25791F7E8 != -1)
        goto LABEL_99;
      goto LABEL_77;
    }
  }
  if ((unsigned __int128)(v27 * (__int128)v31) >> 64 == (v27 * v31) >> 63)
  {
    v35 = CGDataProviderCreateWithData(0, (const void *)(v132 + v27 * v31), v31, (CGDataProviderReleaseDataCallback)nullsub_2);
    if (v35)
    {
      v14 = v35;
      if (v124 < 2)
      {
        v36 = 16389;
      }
      else if ((unint64_t)(v122 - 80) >= 2)
      {
        if (v122 != 115)
          goto LABEL_101;
        v36 = 261;
      }
      else
      {
        v36 = 8198;
      }
      v40 = CGImageCreate(v128, v129, 8uLL, 0x20uLL, *v125, v126, v36, v35, 0, 0, kCGRenderingIntentDefault);
      if (v40)
      {
        v41 = v40;
        v24 = *v30;
        v127 = *(v30 - 1);
        isa = (unint64_t)v133;
        swift_beginAccess();
        swift_bridgeObjectRetain();
        v42 = v41;
        sub_24A2873D8(isUniquelyReferenced_nonNull_native);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v140 = *(_QWORD *)isa;
        v43 = v140;
        *(_QWORD *)isa = 0x8000000000000000;
        v25 = sub_24A2853C0(v25);
        v45 = *(_QWORD *)(v43 + 16);
        v46 = (v44 & 1) == 0;
        v47 = v45 + v46;
        if (__OFADD__(v45, v46))
          goto LABEL_97;
        isa = v44;
        if (*(_QWORD *)(v43 + 24) >= v47)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_24A287064();
            v43 = v140;
          }
        }
        else
        {
          sub_24A285F90(v47, isUniquelyReferenced_nonNull_native);
          type metadata accessor for UIInterfaceOrientation(0);
          v43 = v140;
          v48 = sub_24A2853C0(v134);
          if ((isa & 1) != (v49 & 1))
          {
            sub_24A293180();
            __break(1u);
LABEL_101:
            v142[0] = 0;
            v142[1] = 0xE000000000000000;
            sub_24A293054();
            sub_24A292E74();
            v140 = v122;
            type metadata accessor for MTLPixelFormat(0);
            sub_24A2930C0();
            sub_24A2930D8();
            __break(1u);
            JUMPOUT(0x24A284920);
          }
          v25 = v48;
        }
        v54 = v133;
        *v133 = v43;
        swift_bridgeObjectRelease();
        v55 = (_QWORD *)*v54;
        swift_bridgeObjectRetain();
        isUniquelyReferenced_nonNull_native = 8 * v25;
        if ((isa & 1) == 0)
        {
          v56 = sub_24A27CEB0(MEMORY[0x24BEE4AF8]);
          v55[(v25 >> 6) + 8] |= 1 << v25;
          *(_QWORD *)(v55[6] + 8 * v25) = v134;
          *(_QWORD *)(v55[7] + 8 * v25) = v56;
          v57 = v55[2];
          v58 = __OFADD__(v57, 1);
          v59 = v57 + 1;
          if (v58)
            goto LABEL_98;
          v55[2] = v59;
        }
        v32 = v55[7];
        swift_bridgeObjectRelease();
        v33 = swift_isUniquelyReferenced_nonNull_native();
        v140 = *(_QWORD *)(v32 + 8 * v25);
        *(_QWORD *)(v32 + 8 * v25) = 0x8000000000000000;
        sub_24A286A68((uint64_t)v42, v127, v24, v33, &qword_2579201F0);
        *(_QWORD *)(v32 + 8 * v25) = v140;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();

        v14 = v42;
        isUniquelyReferenced_nonNull_native = (uint64_t)sub_24A284954;
        v25 = v134;
        isa = 0x25791F000uLL;
        v24 = v135;
      }
      else
      {
        if (*(_QWORD *)(isa + 2024) != -1)
          swift_once();
        __swift_project_value_buffer((uint64_t)v131, (uint64_t)qword_2579202E0);
        v50 = sub_24A292D60();
        v51 = sub_24A292F70();
        if (os_log_type_enabled(v50, v51))
        {
          v52 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v52 = 0;
          _os_log_impl(&dword_24A26B000, v50, v51, "couldn’t create image from data", v52, 2u);
          v53 = v52;
          v24 = v135;
          MEMORY[0x24BD0C57C](v53, -1, -1);
        }

      }
      v31 = v130;
    }
    else
    {
      if (*(_QWORD *)(isa + 2024) != -1)
        swift_once();
      __swift_project_value_buffer((uint64_t)v131, (uint64_t)qword_2579202E0);
      v14 = sub_24A292D60();
      v37 = sub_24A292F70();
      if (os_log_type_enabled(v14, v37))
      {
        v38 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v38 = 0;
        _os_log_impl(&dword_24A26B000, v14, v37, "couldn’t create data provider", v38, 2u);
        v39 = v38;
        v31 = v130;
        MEMORY[0x24BD0C57C](v39, -1, -1);
      }
    }

    goto LABEL_7;
  }
  __break(1u);
LABEL_97:
  __break(1u);
LABEL_98:
  __break(1u);
LABEL_99:
  swift_once();
LABEL_77:
  v103 = __swift_project_value_buffer((uint64_t)v14, (uint64_t)qword_2579202E0);
  v104 = v120;
  (*(void (**)(char *, uint64_t, NSObject *))(isa + 16))(v120, v103, v14);
  v105 = sub_24A292D60();
  v106 = sub_24A292F64();
  if (os_log_type_enabled(v105, v106))
  {
    v119 = v27;
    v107 = v24;
    v108 = swift_slowAlloc();
    v109 = swift_slowAlloc();
    v142[0] = v109;
    *(_DWORD *)v108 = 136446466;
    v110 = isUniquelyReferenced_nonNull_native - 1;
    v111 = 0xD000000000000014;
    v112 = 0x800000024A2984D0;
    switch(v110)
    {
      case 0:
        v112 = 0xE800000000000000;
        v111 = 0x7469617274726F50;
        break;
      case 1:
        break;
      case 2:
        v112 = 0xEF74686769522065;
        goto LABEL_85;
      case 3:
        v112 = 0xEE007466654C2065;
LABEL_85:
        v111 = 0x70616373646E614CLL;
        break;
      default:
        v112 = 0x800000024A2984B0;
        v111 = 0xD000000000000013;
        break;
    }
    v140 = sub_24A26FA2C(v111, v112, v142);
    sub_24A292FF4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v108 + 12) = 2082;
    v113 = 0xD000000000000014;
    v114 = 0x800000024A2984D0;
    switch(v25)
    {
      case 1uLL:
        v114 = 0xE800000000000000;
        v113 = 0x7469617274726F50;
        break;
      case 2uLL:
        break;
      case 3uLL:
        v114 = 0xEF74686769522065;
        goto LABEL_91;
      case 4uLL:
        v114 = 0xEE007466654C2065;
LABEL_91:
        v113 = 0x70616373646E614CLL;
        break;
      default:
        v114 = 0x800000024A2984B0;
        break;
    }
    v140 = sub_24A26FA2C(v113, v114, v142);
    sub_24A292FF4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A26B000, v105, v106, "not applying snapshots (final orientation %{public}s, these are %{public}s)", (uint8_t *)v108, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24BD0C57C](v109, -1, -1);
    MEMORY[0x24BD0C57C](v108, -1, -1);

    (*(void (**)(char *, NSObject *))(v123 + 8))(v120, v131);
    v24 = v107;
    v27 = v119;
  }
  else
  {

    (*(void (**)(char *, NSObject *))(isa + 8))(v104, v14);
  }
LABEL_94:
  swift_beginAccess();
  swift_unknownObjectRetain();
  v115 = swift_isUniquelyReferenced_nonNull_native();
  v141 = *(_QWORD *)(v24 + 144);
  *(_QWORD *)(v24 + 144) = 0x8000000000000000;
  sub_24A286BDC(v27, v25, v115);
  *(_QWORD *)(v24 + 144) = v141;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_release();
  return sub_24A2873D8((uint64_t)v136);
}

unint64_t sub_24A284954@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result;

  result = sub_24A27CEB0(MEMORY[0x24BEE4AF8]);
  *a1 = result;
  return result;
}

uint64_t sub_24A284980(char *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  int64_t v34;
  unint64_t v35;
  int64_t v36;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v38;
  char v39;
  unint64_t v40;
  uint64_t v41;
  _BOOL8 v42;
  uint64_t v43;
  char v44;
  unint64_t v45;
  char v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  BOOL v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  unint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v58;
  uint64_t v59;
  int64_t v60;
  _QWORD *v61;
  uint64_t v62[3];
  uint64_t v63;

  v2 = v1;
  v4 = sub_24A292D78();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v58 - v9;
  v11 = 32;
  if (*((_BYTE *)v2 + 296))
    v11 = 33;
  if ((char *)v2[v11] == a1)
  {
    if (qword_25791F7E8 != -1)
LABEL_64:
      swift_once();
    v12 = __swift_project_value_buffer(v4, (uint64_t)qword_2579202E0);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v12, v4);
    v13 = sub_24A292D60();
    v14 = sub_24A292F64();
    if (os_log_type_enabled(v13, v14))
    {
      v60 = v5;
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      v62[0] = v16;
      *(_DWORD *)v15 = 136446210;
      v59 = v16;
      v17 = 0xD000000000000014;
      v18 = 0x800000024A2984D0;
      switch((unint64_t)a1)
      {
        case 1uLL:
          v18 = 0xE800000000000000;
          v17 = 0x7469617274726F50;
          break;
        case 2uLL:
          break;
        case 3uLL:
          v18 = 0xEF74686769522065;
          goto LABEL_16;
        case 4uLL:
          v18 = 0xEE007466654C2065;
LABEL_16:
          v17 = 0x70616373646E614CLL;
          break;
        default:
          v18 = 0x800000024A2984B0;
          break;
      }
      v63 = sub_24A26FA2C(v17, v18, v62);
      sub_24A292FF4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24A26B000, v13, v14, "cleaning up non-%{public}s snapshots", v15, 0xCu);
      v27 = v59;
      swift_arrayDestroy();
      MEMORY[0x24BD0C57C](v27, -1, -1);
      MEMORY[0x24BD0C57C](v15, -1, -1);

      (*(void (**)(char *, uint64_t))(v60 + 8))(v10, v4);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    }
    v63 = sub_24A2878EC((uint64_t)&unk_251BB02C8);
    sub_24A28CB14((uint64_t)a1);
    v5 = 0;
    v4 = v63;
    v28 = *(_QWORD *)(v63 + 56);
    v59 = v63 + 56;
    v29 = 1 << *(_BYTE *)(v63 + 32);
    v30 = -1;
    if (v29 < 64)
      v30 = ~(-1 << v29);
    v31 = v30 & v28;
    a1 = (char *)(v2 + 16);
    v2 += 18;
    v60 = (unint64_t)(v29 + 63) >> 6;
    while (1)
    {
      if (v31)
      {
        v32 = __clz(__rbit64(v31));
        v31 &= v31 - 1;
        v33 = v32 | (v5 << 6);
      }
      else
      {
        v34 = v5 + 1;
        if (__OFADD__(v5, 1))
          goto LABEL_62;
        if (v34 >= v60)
          return swift_release();
        v35 = *(_QWORD *)(v59 + 8 * v34);
        ++v5;
        if (!v35)
        {
          v5 = v34 + 1;
          if (v34 + 1 >= v60)
            return swift_release();
          v35 = *(_QWORD *)(v59 + 8 * v5);
          if (!v35)
          {
            v5 = v34 + 2;
            if (v34 + 2 >= v60)
              return swift_release();
            v35 = *(_QWORD *)(v59 + 8 * v5);
            if (!v35)
            {
              v36 = v34 + 3;
              if (v36 >= v60)
                return swift_release();
              v35 = *(_QWORD *)(v59 + 8 * v36);
              if (!v35)
              {
                while (1)
                {
                  v5 = v36 + 1;
                  if (__OFADD__(v36, 1))
                    goto LABEL_63;
                  if (v5 >= v60)
                    return swift_release();
                  v35 = *(_QWORD *)(v59 + 8 * v5);
                  ++v36;
                  if (v35)
                    goto LABEL_42;
                }
              }
              v5 = v36;
            }
          }
        }
LABEL_42:
        v31 = (v35 - 1) & v35;
        v33 = __clz(__rbit64(v35)) + (v5 << 6);
      }
      v10 = *(char **)(*(_QWORD *)(v4 + 48) + 8 * v33);
      swift_beginAccess();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v61 = *(_QWORD **)a1;
      v38 = v61;
      *(_QWORD *)a1 = 0x8000000000000000;
      v40 = sub_24A2853C0((uint64_t)v10);
      v41 = v38[2];
      v42 = (v39 & 1) == 0;
      v43 = v41 + v42;
      if (__OFADD__(v41, v42))
      {
        __break(1u);
LABEL_61:
        __break(1u);
LABEL_62:
        __break(1u);
LABEL_63:
        __break(1u);
        goto LABEL_64;
      }
      v44 = v39;
      if (v38[3] >= v43)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_24A287064();
      }
      else
      {
        sub_24A285F90(v43, isUniquelyReferenced_nonNull_native);
        v45 = sub_24A2853C0((uint64_t)v10);
        if ((v44 & 1) != (v46 & 1))
        {
          type metadata accessor for UIInterfaceOrientation(0);
          sub_24A293180();
          __break(1u);
          JUMPOUT(0x24A285130);
        }
        v40 = v45;
      }
      v47 = v61;
      if ((v44 & 1) != 0)
      {
        v48 = v61[7];
        swift_bridgeObjectRelease();
        *(_QWORD *)(v48 + 8 * v40) = MEMORY[0x24BEE4B00];
      }
      else
      {
        v61[(v40 >> 6) + 8] |= 1 << v40;
        *(_QWORD *)(v47[6] + 8 * v40) = v10;
        *(_QWORD *)(v47[7] + 8 * v40) = MEMORY[0x24BEE4B00];
        v49 = v47[2];
        v50 = __OFADD__(v49, 1);
        v51 = v49 + 1;
        if (v50)
          goto LABEL_61;
        v47[2] = v51;
      }
      *(_QWORD *)a1 = v47;
      swift_bridgeObjectRelease();
      swift_endAccess();
      swift_beginAccess();
      v52 = sub_24A2853C0((uint64_t)v10);
      if ((v53 & 1) != 0)
      {
        v54 = v52;
        v55 = swift_isUniquelyReferenced_nonNull_native();
        v56 = *v2;
        v61 = (_QWORD *)*v2;
        *v2 = 0x8000000000000000;
        if ((v55 & 1) == 0)
        {
          sub_24A286EC4();
          v56 = (uint64_t)v61;
        }
        sub_24A286744(v54, v56);
        v10 = (char *)*v2;
        *v2 = v56;
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
      }
      swift_endAccess();
    }
  }
  if (qword_25791F7E8 != -1)
    swift_once();
  v19 = __swift_project_value_buffer(v4, (uint64_t)qword_2579202E0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v19, v4);
  v20 = sub_24A292D60();
  v21 = sub_24A292F70();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    v23 = swift_slowAlloc();
    v62[0] = v23;
    *(_DWORD *)v22 = 136446210;
    v24 = a1 - 1;
    v25 = 0xD000000000000014;
    v26 = 0x800000024A2984D0;
    switch((unint64_t)v24)
    {
      case 0uLL:
        v26 = 0xE800000000000000;
        v25 = 0x7469617274726F50;
        break;
      case 1uLL:
        break;
      case 2uLL:
        v26 = 0xEF74686769522065;
        goto LABEL_19;
      case 3uLL:
        v26 = 0xEE007466654C2065;
LABEL_19:
        v25 = 0x70616373646E614CLL;
        break;
      default:
        v26 = 0x800000024A2984B0;
        break;
    }
    v63 = sub_24A26FA2C(v25, v26, v62);
    sub_24A292FF4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A26B000, v20, v21, "asked to clean up non-%{public}s snapshots while not in that orientation — skipping", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD0C57C](v23, -1, -1);
    MEMORY[0x24BD0C57C](v22, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t WallpaperMetalCoordination.EditingCoordinator.deinit()
{
  uint64_t v0;
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  _OWORD v6[8];
  char v7;

  sub_24A27FED0(v0 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = *(_OWORD *)(v0 + 248);
  v2 = *(_OWORD *)(v0 + 280);
  v6[6] = *(_OWORD *)(v0 + 264);
  v6[7] = v2;
  v7 = *(_BYTE *)(v0 + 296);
  v3 = *(_OWORD *)(v0 + 184);
  v4 = *(_OWORD *)(v0 + 216);
  v6[2] = *(_OWORD *)(v0 + 200);
  v6[3] = v4;
  v6[4] = *(_OWORD *)(v0 + 232);
  v6[5] = v1;
  v6[0] = *(_OWORD *)(v0 + 168);
  v6[1] = v3;
  sub_24A2874D8((uint64_t)v6, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
  sub_24A27FF10(*(_QWORD *)(v0 + 304), *(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 320), *(_QWORD *)(v0 + 328), *(unsigned int *)(v0 + 336) | ((unint64_t)*(unsigned __int8 *)(v0 + 340) << 32));

  return v0;
}

uint64_t WallpaperMetalCoordination.EditingCoordinator.__deallocating_deinit()
{
  WallpaperMetalCoordination.EditingCoordinator.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_24A28525C(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v5;
  uint64_t result;

  a4();
  v5 = *a1 + 8;
  result = sub_24A292FF4();
  *a1 = v5;
  return result;
}

unint64_t sub_24A2852AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_24A2931C8();
  sub_24A292E50();
  v4 = sub_24A2931E0();
  return sub_24A2854A0(a1, a2, v4);
}

unint64_t sub_24A285310(uint64_t a1)
{
  uint64_t v2;

  sub_24A292E2C();
  sub_24A2931C8();
  sub_24A292E50();
  v2 = sub_24A2931E0();
  swift_bridgeObjectRelease();
  return sub_24A285580(a1, v2);
}

unint64_t sub_24A285390(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_24A292FD0();
  return sub_24A2856F4(a1, v2);
}

unint64_t sub_24A2853C0(uint64_t a1)
{
  uint64_t v2;

  sub_24A2931C8();
  sub_24A2931D4();
  v2 = sub_24A2931E0();
  return sub_24A28580C(a1, v2);
}

unint64_t sub_24A285418(uint64_t a1)
{
  uint64_t v2;

  sub_24A2931C8();
  type metadata accessor for CFString(0);
  sub_24A26E220(&qword_2579206C0, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_24A293D4C);
  sub_24A292D48();
  v2 = sub_24A2931E0();
  return sub_24A2858A8(a1, v2);
}

unint64_t sub_24A2854A0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_24A29315C() & 1) == 0)
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
      while (!v14 && (sub_24A29315C() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_24A285580(uint64_t a1, uint64_t a2)
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
    v6 = sub_24A292E2C();
    v8 = v7;
    if (v6 == sub_24A292E2C() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_24A29315C();
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
          v13 = sub_24A292E2C();
          v15 = v14;
          if (v13 == sub_24A292E2C() && v15 == v16)
            break;
          v18 = sub_24A29315C();
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

unint64_t sub_24A2856F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_24A287BC0(0, &qword_257920708);
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = sub_24A292FDC();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = sub_24A292FDC();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_24A28580C(uint64_t a1, uint64_t a2)
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

unint64_t sub_24A2858A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  void *v6;
  id v7;
  char v8;
  uint64_t v9;
  id v10;
  char v11;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    type metadata accessor for CFString(0);
    v6 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * i);
    sub_24A26E220(&qword_2579206C0, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_24A293D4C);
    v7 = v6;
    v8 = sub_24A292D3C();

    if ((v8 & 1) == 0)
    {
      v9 = ~v4;
      for (i = (i + 1) & v9; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v9)
      {
        v10 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v11 = sub_24A292D3C();

        if ((v11 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

uint64_t sub_24A2859E8(uint64_t a1, char a2)
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
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579202C0);
  v6 = sub_24A293108();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v2;
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v37 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v36;
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v37 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = 8 * v21;
    v31 = *(void **)(*(_QWORD *)(v5 + 48) + v30);
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      v33 = v32;
      v34 = v31;
    }
    result = sub_24A292FD0();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = 8 * v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_24A285CB8(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  _QWORD *v32;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257920288);
  result = sub_24A293108();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v32 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v31 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v19 = v18 | (v8 << 6);
      }
      else
      {
        v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v20 >= v31)
          goto LABEL_33;
        v21 = v32[v20];
        ++v8;
        if (!v21)
        {
          v8 = v20 + 1;
          if (v20 + 1 >= v31)
            goto LABEL_33;
          v21 = v32[v8];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v31)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v30 = 1 << *(_BYTE *)(v5 + 32);
              if (v30 >= 64)
                bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v32 = -1 << v30;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v21 = v32[v22];
            if (!v21)
            {
              while (1)
              {
                v8 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_42;
                if (v8 >= v31)
                  goto LABEL_33;
                v21 = v32[v8];
                ++v22;
                if (v21)
                  goto LABEL_30;
              }
            }
            v8 = v22;
          }
        }
LABEL_30:
        v11 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      v27 = 8 * v19;
      v28 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v27);
      v29 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v27);
      if ((a2 & 1) == 0)
        swift_unknownObjectRetain();
      sub_24A2931C8();
      sub_24A2931D4();
      result = sub_24A2931E0();
      v13 = -1 << *(_BYTE *)(v7 + 32);
      v14 = result & ~v13;
      v15 = v14 >> 6;
      if (((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v25 = v15 == v24;
          if (v15 == v24)
            v15 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      v17 = 8 * v16;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v17) = v28;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v17) = v29;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_24A285F90(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  _QWORD *v32;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2579206A0);
  result = sub_24A293108();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v32 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v31 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v19 = v18 | (v8 << 6);
      }
      else
      {
        v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v20 >= v31)
          goto LABEL_33;
        v21 = v32[v20];
        ++v8;
        if (!v21)
        {
          v8 = v20 + 1;
          if (v20 + 1 >= v31)
            goto LABEL_33;
          v21 = v32[v8];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v31)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v30 = 1 << *(_BYTE *)(v5 + 32);
              if (v30 >= 64)
                bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v32 = -1 << v30;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v21 = v32[v22];
            if (!v21)
            {
              while (1)
              {
                v8 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_42;
                if (v8 >= v31)
                  goto LABEL_33;
                v21 = v32[v8];
                ++v22;
                if (v21)
                  goto LABEL_30;
              }
            }
            v8 = v22;
          }
        }
LABEL_30:
        v11 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      v27 = 8 * v19;
      v28 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v27);
      v29 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v27);
      if ((a2 & 1) == 0)
        swift_bridgeObjectRetain();
      sub_24A2931C8();
      sub_24A2931D4();
      result = sub_24A2931E0();
      v13 = -1 << *(_BYTE *)(v7 + 32);
      v14 = result & ~v13;
      v15 = v14 >> 6;
      if (((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v25 = v15 == v24;
          if (v15 == v24)
            v15 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      v17 = 8 * v16;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v17) = v28;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v17) = v29;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_24A286268(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  char v39;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v39 = a2;
  v7 = sub_24A293108();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v38 = v6 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v6 + 64);
  v36 = v3;
  v37 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37)
      break;
    v23 = (_QWORD *)(v6 + 64);
    v24 = *(_QWORD *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v37)
        goto LABEL_33;
      v24 = *(_QWORD *)(v38 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          v4 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v37)
              goto LABEL_33;
            v24 = *(_QWORD *)(v38 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(void **)(*(_QWORD *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v34 = v33;
    }
    sub_24A2931C8();
    sub_24A292E50();
    result = sub_24A2931E0();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release();
  v4 = v36;
  v23 = (_QWORD *)(v6 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v6 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v4 = v8;
  return result;
}

unint64_t sub_24A286570(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_24A293024();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_24A2931C8();
        swift_bridgeObjectRetain();
        sub_24A292E50();
        v9 = sub_24A2931E0();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_24A286744(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_24A293024();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_24A2931C8();
        sub_24A2931D4();
        result = sub_24A2931E0();
        v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8)
            goto LABEL_5;
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          v10 = *(_QWORD *)(a2 + 48);
          v11 = (_QWORD *)(v10 + 8 * v3);
          v12 = (_QWORD *)(v10 + 8 * v6);
          if (v3 != v6 || v11 >= v12 + 1)
            *v11 = *v12;
          v13 = *(_QWORD *)(a2 + 56);
          v14 = (_QWORD *)(v13 + 8 * v3);
          v15 = (_QWORD *)(v13 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v14 >= v15 + 1))
          {
            *v14 = *v15;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v17 = *v16;
    v18 = (-1 << v3) - 1;
  }
  else
  {
    v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    v18 = *v16;
    v17 = (-1 << result) - 1;
  }
  *v16 = v18 & v17;
  v19 = *(_QWORD *)(a2 + 16);
  v20 = __OFSUB__(v19, 1);
  v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_24A2868FC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_24A286A68(a1, a2, a3, a4, &qword_2579202C8);
}

void sub_24A286908(uint64_t a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  id v23;

  v4 = v3;
  v7 = *v3;
  v9 = sub_24A285390((uint64_t)a2);
  v10 = *(_QWORD *)(v7 + 16);
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v13 = v8;
  v14 = *(_QWORD *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_24A286D20();
LABEL_7:
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
    {
LABEL_8:
      v16 = v15[7];

      *(_QWORD *)(v16 + 8 * v9) = a1;
      return;
    }
LABEL_11:
    v15[(v9 >> 6) + 8] |= 1 << v9;
    v19 = 8 * v9;
    *(_QWORD *)(v15[6] + v19) = a2;
    *(_QWORD *)(v15[7] + v19) = a1;
    v20 = v15[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v15[2] = v22;
      v23 = a2;
      return;
    }
    goto LABEL_14;
  }
  sub_24A2859E8(v12, a3 & 1);
  v17 = sub_24A285390((uint64_t)a2);
  if ((v13 & 1) == (v18 & 1))
  {
    v9 = v17;
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_24A287BC0(0, &qword_257920708);
  sub_24A293180();
  __break(1u);
}

void sub_24A286A68(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  _QWORD *v5;
  _QWORD *v7;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;

  v7 = v5;
  v12 = *v5;
  v14 = sub_24A2852AC(a2, a3);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a4 & 1) == 0)
  {
    sub_24A287204(a5);
LABEL_7:
    v20 = (_QWORD *)*v7;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7];

      *(_QWORD *)(v21 + 8 * v14) = a1;
      return;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v24 = (uint64_t *)(v20[6] + 16 * v14);
    *v24 = a2;
    v24[1] = a3;
    *(_QWORD *)(v20[7] + 8 * v14) = a1;
    v25 = v20[2];
    v26 = __OFADD__(v25, 1);
    v27 = v25 + 1;
    if (!v26)
    {
      v20[2] = v27;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  sub_24A286268(v17, a4 & 1, a5);
  v22 = sub_24A2852AC(a2, a3);
  if ((v18 & 1) == (v23 & 1))
  {
    v14 = v22;
    v20 = (_QWORD *)*v7;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_24A293180();
  __break(1u);
}

uint64_t sub_24A286BDC(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v8 = *v3;
  v10 = sub_24A2853C0(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_24A286EC4();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];
      result = swift_unknownObjectRelease();
      *(_QWORD *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    v19 = 8 * v10;
    *(_QWORD *)(v16[6] + v19) = a2;
    *(_QWORD *)(v16[7] + v19) = a1;
    v20 = v16[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_24A285CB8(result, a3 & 1);
  result = sub_24A2853C0(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  type metadata accessor for UIInterfaceOrientation(0);
  result = sub_24A293180();
  __break(1u);
  return result;
}

id sub_24A286D14()
{
  return sub_24A287204(&qword_2579202C8);
}

id sub_24A286D20()
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
  void *v17;
  void *v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579202C0);
  v2 = *v0;
  v3 = sub_24A2930FC();
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(void **)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v18;
    result = v17;
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_24A286EC4()
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
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257920288);
  v2 = *v0;
  v3 = sub_24A2930FC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    result = (void *)swift_unknownObjectRetain();
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_24A287064()
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
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2579206A0);
  v2 = *v0;
  v3 = sub_24A2930FC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    result = (void *)swift_bridgeObjectRetain();
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_24A287204(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_24A2930FC();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      v10 = v23 + 1;
      if (v23 + 1 >= v14)
        goto LABEL_26;
      v24 = *(_QWORD *)(v7 + 8 * v10);
      if (!v24)
        break;
    }
LABEL_25:
    v13 = (v24 - 1) & v24;
    v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v16);
    v19 = v18[1];
    v20 = 8 * v16;
    v21 = *(void **)(*(_QWORD *)(v3 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    result = v21;
  }
  v25 = v23 + 2;
  if (v25 >= v14)
    goto LABEL_26;
  v24 = *(_QWORD *)(v7 + 8 * v25);
  if (v24)
  {
    v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v10);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_24A2873AC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_24A2873D0(void *a1)
{
  return sub_24A27FF84(a1);
}

uint64_t sub_24A2873D8(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
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

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) - 8) + 80) & 0x20000) != 0)
    JUMPOUT(0x24BD0C57CLL);
  return result;
}

uint64_t sub_24A287458(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579202F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A2874A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if ((a6 & 1) != 0)
    swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_24A2874CC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, char a6)
{
  id result;

  if ((a6 & 1) != 0)
    return a3;
  return result;
}

uint64_t sub_24A2874D8(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(a1 + 88);
  v6 = *(_QWORD *)(a1 + 96);
  v7 = *(_QWORD *)(a1 + 104);
  v8 = *(_QWORD *)(a1 + 112);
  v9 = *(_QWORD *)(a1 + 120);
  v10 = *(unsigned __int8 *)(a1 + 128);
  a2(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(unsigned int *)(a1 + 80), *(unsigned __int8 *)(a1 + 84));
  a3(v5, v6, v7, v8, v9, v10);
  return a1;
}

void sub_24A28755C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, char a6)
{
  if ((a6 & 1) != 0)

}

void sub_24A287568(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  if (a6 != 255)
    sub_24A28755C(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t sub_24A287580@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + 32;
  swift_beginAccess();
  return sub_24A27F738(v3, a2);
}

uint64_t method lookup function for WallpaperMetalCoordination.EditingCoordinator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WallpaperMetalCoordination.EditingCoordinator.renderer.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of WallpaperMetalCoordination.EditingCoordinator.__allocating_init(identifier:rendering:environment:initialLookIdentifier:lookSelectionStyle:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 512))();
}

uint64_t dispatch thunk of WallpaperMetalCoordination.EditingCoordinator.attachToViews(background:lookIdentifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 520))();
}

uint64_t dispatch thunk of WallpaperMetalCoordination.EditingCoordinator.handleEditingEnvironmentUpdate(_:animationSettings:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 528))();
}

uint64_t dispatch thunk of WallpaperMetalCoordination.EditingCoordinator.updateLookTransition(progress:destinationIdentifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 536))();
}

uint64_t dispatch thunk of WallpaperMetalCoordination.EditingCoordinator.finishLookTransition(toIdentifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 544))();
}

_QWORD *_s18EditingCoordinatorC18LookSelectionStyleOwCP(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s18EditingCoordinatorC18LookSelectionStyleOwxx()
{
  return swift_bridgeObjectRelease();
}

_QWORD *_s18EditingCoordinatorC18LookSelectionStyleOwca(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

_QWORD *_s18EditingCoordinatorC18LookSelectionStyleOwta(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s18EditingCoordinatorC18LookSelectionStyleOwet(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t _s18EditingCoordinatorC18LookSelectionStyleOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

uint64_t sub_24A28778C(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_24A2877A4(_QWORD *result, int a2)
{
  unsigned int v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2)
      return result;
    v2 = a2 - 1;
  }
  *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for WallpaperMetalCoordination.EditingCoordinator.LookSelectionStyle()
{
  return &type metadata for WallpaperMetalCoordination.EditingCoordinator.LookSelectionStyle;
}

uint64_t sub_24A2877D4(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;

  v5 = a2 - result;
  if (__OFSUB__(a2, result))
    goto LABEL_12;
  v6 = result;
  result = MEMORY[0x24BEE4AF8];
  if (v5)
  {
    v11 = MEMORY[0x24BEE4AF8];
    result = sub_24A29309C();
    if (a2 < v6 || v5 < 0)
      goto LABEL_13;
    while (a2 != v6)
    {
      if ((unsigned __int128)(a5 * (__int128)v6) >> 64 != (a5 * v6) >> 63)
        goto LABEL_11;
      objc_msgSend(a3, sel_newTextureWithDescriptor_offset_bytesPerRow_, a4);
      sub_24A293084();
      sub_24A2930A8();
      sub_24A2930B4();
      result = sub_24A293090();
      if (a2 == ++v6)
        return v11;
    }
    __break(1u);
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
  }
  return result;
}

uint64_t sub_24A2878EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2579206B0);
    v3 = sub_24A293048();
    v4 = 0;
    v5 = v3 + 56;
    v6 = a1 + 32;
    while (1)
    {
      v7 = *(_QWORD *)(v6 + 8 * v4);
      sub_24A2931C8();
      sub_24A2931D4();
      result = sub_24A2931E0();
      v9 = -1 << *(_BYTE *)(v3 + 32);
      v10 = result & ~v9;
      v11 = v10 >> 6;
      v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
      v13 = 1 << v10;
      v14 = *(_QWORD *)(v3 + 48);
      if (((1 << v10) & v12) != 0)
      {
        if (*(_QWORD *)(v14 + 8 * v10) == v7)
          goto LABEL_3;
        v15 = ~v9;
        while (1)
        {
          v10 = (v10 + 1) & v15;
          v11 = v10 >> 6;
          v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
          v13 = 1 << v10;
          if ((v12 & (1 << v10)) == 0)
            break;
          if (*(_QWORD *)(v14 + 8 * v10) == v7)
            goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v11) = v13 | v12;
      *(_QWORD *)(v14 + 8 * v10) = v7;
      v16 = *(_QWORD *)(v3 + 16);
      v17 = __OFADD__(v16, 1);
      v18 = v16 + 1;
      if (v17)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v18;
LABEL_3:
      if (++v4 == v1)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

uint64_t sub_24A287A2C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (BYTE4(a5) != 255)
    return sub_24A2874A0(result, a2, a3, a4, a5, BYTE4(a5) & 1);
  return result;
}

uint64_t sub_24A287A44()
{
  return swift_deallocObject();
}

uint64_t sub_24A287A54()
{
  uint64_t v0;

  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return swift_deallocObject();
}

void sub_24A287AA0(void *a1)
{
  uint64_t v1;

  sub_24A2830D0(a1, *(NSObject **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80), *(void **)(v1 + 88), *(_QWORD *)(v1 + 96), *(_QWORD *)(v1 + 104));
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

uint64_t sub_24A287AF8()
{
  uint64_t v0;

  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_24A287B44()
{
  uint64_t v0;

  return sub_24A2836D0(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(const char **)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(CGColorSpace **)(v0 + 80), *(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 96));
}

uint64_t sub_24A287B80(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24BD0C4D4](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24A287BC0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24A287C04(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t showSensitiveUIAlert(for:)(void *a1)
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
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD aBlock[6];

  v2 = sub_24A292D84();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24A292DA8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A27AA58();
  v10 = (void *)sub_24A292FAC();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a1;
  aBlock[4] = sub_24A287FBC;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24A287C04;
  aBlock[3] = &block_descriptor_1;
  v12 = _Block_copy(aBlock);
  v13 = a1;
  swift_release();
  sub_24A292D90();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_24A287FDC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579206F0);
  sub_24A288024();
  sub_24A293018();
  MEMORY[0x24BD0BDF0](0, v9, v5, v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void sub_24A287DF8(void *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[6];

  v2 = (void *)sub_24A292E08();
  v3 = (void *)sub_24A292E08();
  v4 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v2, v3, 1);

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = v4;
  v7 = (void *)sub_24A292E08();
  v10[4] = sub_24A288070;
  v10[5] = v5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_24A288088;
  v10[3] = &block_descriptor_6_0;
  v8 = _Block_copy(v10);
  swift_release();
  v9 = objc_msgSend((id)objc_opt_self(), sel_actionWithTitle_style_handler_, v7, 0, v8);
  _Block_release(v8);

  objc_msgSend(v6, sel_addAction_, v9);
  objc_msgSend(a1, sel_presentViewController_animated_completion_, v6, 1, 0);

}

uint64_t sub_24A287F98()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_24A287FBC()
{
  uint64_t v0;

  sub_24A287DF8(*(void **)(v0 + 16));
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

unint64_t sub_24A287FDC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2579206E8;
  if (!qword_2579206E8)
  {
    v1 = sub_24A292D84();
    result = MEMORY[0x24BD0C4D4](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_2579206E8);
  }
  return result;
}

unint64_t sub_24A288024()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2579206F8;
  if (!qword_2579206F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2579206F0);
    result = MEMORY[0x24BD0C4D4](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2579206F8);
  }
  return result;
}

id sub_24A288070()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_dismissViewControllerAnimated_completion_, 1, 0);
}

void sub_24A288088(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

unint64_t static Logger.subsystem.getter()
{
  return 0xD000000000000024;
}

uint64_t sub_24A288100(uint64_t a1)
{
  return sub_24A288208(a1, qword_2544CE7E0);
}

uint64_t static Logger.data.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24A288180(&qword_2544CE630, (uint64_t)qword_2544CE7E0, a1);
}

uint64_t sub_24A288140(uint64_t a1)
{
  return sub_24A288208(a1, qword_257920710);
}

uint64_t static Logger.rendering.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24A288180(&qword_25791F7F8, (uint64_t)qword_257920710, a1);
}

uint64_t sub_24A288180@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_24A292D78();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_24A2881E8(uint64_t a1)
{
  return sub_24A288208(a1, qword_257920728);
}

uint64_t sub_24A288208(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_24A292D78();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_24A292D6C();
}

uint64_t static Logger.snapshot.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24A288180(&qword_25791F800, (uint64_t)qword_257920728, a1);
}

BOOL static PosterLayout.LayoutType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t PosterLayout.LayoutType.hash(into:)()
{
  return sub_24A2931D4();
}

uint64_t PosterLayout.LayoutType.hashValue.getter()
{
  sub_24A2931C8();
  sub_24A2931D4();
  return sub_24A2931E0();
}

void sub_24A28831C()
{
  id v0;
  id v1;
  char v2;

  v0 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v1 = objc_msgSend(v0, sel_userInterfaceIdiom);

  if (!v1)
  {
    v2 = 1;
LABEL_5:
    byte_257920740 = v2;
    return;
  }
  if (v1 == (id)1)
  {
    v2 = 0;
    goto LABEL_5;
  }
  sub_24A2930D8();
  __break(1u);
}

uint64_t static PosterLayout.currentLayoutType.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  if (qword_25791F808 != -1)
    result = swift_once();
  *a1 = byte_257920740;
  return result;
}

double PosterLayout.Animation.duration.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

uint64_t PosterLayout.Animation.curve.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

__n128 PosterLayout.Animation.transform.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v2;
  __n128 result;

  v2 = *(_OWORD *)(v1 + 32);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(v1 + 48);
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t PosterLayout.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t PosterLayout.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

unint64_t sub_24A288470()
{
  unint64_t result;

  result = qword_257920748;
  if (!qword_257920748)
  {
    result = MEMORY[0x24BD0C4D4](&protocol conformance descriptor for PosterLayout.LayoutType, &type metadata for PosterLayout.LayoutType);
    atomic_store(result, (unint64_t *)&qword_257920748);
  }
  return result;
}

uint64_t type metadata accessor for PosterLayout()
{
  return objc_opt_self();
}

uint64_t method lookup function for PosterLayout()
{
  return swift_lookUpClassMethod();
}

uint64_t storeEnumTagSinglePayload for PosterLayout.LayoutType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A28852C + 4 * byte_24A294CE5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24A288560 + 4 * byte_24A294CE0[v4]))();
}

uint64_t sub_24A288560(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A288568(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A288570);
  return result;
}

uint64_t sub_24A28857C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A288584);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24A288588(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A288590(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PosterLayout.LayoutType()
{
  return &type metadata for PosterLayout.LayoutType;
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

uint64_t getEnumTagSinglePayload for PosterLayout.Animation(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 64))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PosterLayout.Animation(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PosterLayout.Animation()
{
  return &type metadata for PosterLayout.Animation;
}

uint64_t WallpaperMetalCoordination.RenderingCoordinator.renderingType.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t sub_24A288634(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  _BYTE v5[40];

  sub_24A27F738(a1, (uint64_t)v5);
  v3 = *a2 + 32;
  swift_beginAccess();
  sub_24A28C8A8((uint64_t)v5, v3, &qword_2579202F8);
  return swift_endAccess();
}

uint64_t WallpaperMetalCoordination.RenderingCoordinator.ContinuousRenderingToken.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t Strong;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257920810);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(v0 + 32);
  v5 = *(_QWORD *)(v0 + 40);
  v7 = qword_25791F810;
  swift_bridgeObjectRetain();
  if (v7 != -1)
    swift_once();
  v8 = sub_24A292D78();
  __swift_project_value_buffer(v8, (uint64_t)qword_2579207F0);
  swift_bridgeObjectRetain_n();
  v9 = sub_24A292D60();
  v10 = sub_24A292F64();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v21 = v12;
    *(_DWORD *)v11 = 136446210;
    swift_bridgeObjectRetain();
    v20 = sub_24A26FA2C(v6, v5, &v21);
    sub_24A292FF4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24A26B000, v9, v10, "ContinuousRenderingToken “%{public}s” deinit", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD0C57C](v12, -1, -1);
    MEMORY[0x24BD0C57C](v11, -1, -1);

    if ((*(_BYTE *)(v1 + 24) & 1) != 0)
      goto LABEL_9;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    if ((*(_BYTE *)(v1 + 24) & 1) != 0)
    {
LABEL_9:
      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
  }
  Strong = swift_weakLoadStrong();
  if (!Strong)
    goto LABEL_9;
  v14 = Strong;
  v15 = sub_24A292F34();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v4, 1, 1, v15);
  sub_24A292F1C();
  swift_retain();
  v16 = sub_24A292F10();
  v17 = (_QWORD *)swift_allocObject();
  v18 = MEMORY[0x24BEE6930];
  v17[2] = v16;
  v17[3] = v18;
  v17[4] = v14;
  v17[5] = v6;
  v17[6] = v5;
  sub_24A2889FC((uint64_t)v4, (uint64_t)&unk_257920820, (uint64_t)v17);
  swift_release();
  swift_release();
LABEL_10:
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_24A288944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  sub_24A292F1C();
  v6[5] = sub_24A292F10();
  sub_24A292F04();
  return swift_task_switch();
}

uint64_t sub_24A2889B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 24);
  swift_release();
  sub_24A28C5B4(v2, v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24A2889FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_24A292F34();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24A292F28();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_24A28E30C(a1, &qword_257920810);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24A292F04();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t WallpaperMetalCoordination.RenderingCoordinator.ContinuousRenderingToken.__deallocating_deinit()
{
  WallpaperMetalCoordination.RenderingCoordinator.ContinuousRenderingToken.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_24A288B68()
{
  uint64_t v0;

  v0 = sub_24A292D78();
  __swift_allocate_value_buffer(v0, qword_2579207F0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2579207F0);
  return sub_24A292D6C();
}

uint64_t sub_24A288BE0()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24A288C14(uint64_t a1)
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
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_24A288C94;
  return sub_24A288944(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_24A288C94()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t WallpaperMetalCoordination.RenderingCoordinator.__allocating_init(identifier:rendering:environment:lookIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;

  v14 = swift_allocObject();
  WallpaperMetalCoordination.RenderingCoordinator.init(identifier:rendering:environment:lookIdentifier:)(a1, a2, a3, a4, a5, a6, a7);
  return v14;
}

uint64_t *WallpaperMetalCoordination.RenderingCoordinator.init(identifier:rendering:environment:lookIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  CGColorSpace *v23;
  id v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  _BYTE *v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  char *v45;
  id v46;
  void *v47;
  id v48;
  BOOL v49;
  id v50;
  char v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  unsigned __int8 v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t (**v61)(void *);
  uint64_t v62;
  char *v63;
  _QWORD v65[3];
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  char v73;
  char v74[8];
  uint64_t v75;
  char v76;
  uint64_t v77;
  uint64_t v78;
  BOOL v79;
  unsigned __int8 v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  char v86;
  id v87;
  __int128 v88;
  __int128 v89;
  char v90;
  _QWORD v91[17];
  _BYTE v92[144];

  v9 = v7;
  v70 = a4;
  v71 = a7;
  v67 = a6;
  v68 = a5;
  v66 = *v7;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257920CA0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((_OWORD *)v7 + 2) = 0u;
  v16 = (uint64_t)(v7 + 4);
  *(_QWORD *)(v16 + 32) = 0;
  *(_OWORD *)(v16 + 16) = 0u;
  *(_QWORD *)(v16 + 96) = 0;
  *(_QWORD *)(v16 + 104) = 0;
  sub_24A28C814((uint64_t)v92);
  v69 = v16 + 112;
  sub_24A28C9B8((uint64_t)v92, v16 + 112, (uint64_t *)&unk_257920830);
  *(_QWORD *)(v16 + 264) = 0;
  *(_QWORD *)(v16 + 272) = 0;
  *(_QWORD *)(v16 + 280) = MEMORY[0x24BEE4B08];
  if (qword_25791F7D8 != -1)
    swift_once();
  v17 = qword_2579226A8;
  if (qword_2579226A8)
  {
    v65[2] = v8;
    v9[9] = a1;
    v9[10] = a2;
    v18 = v70;
    v9[2] = a3;
    v9[3] = v18;
    v19 = *(_QWORD *)(v17 + OBJC_IVAR____TtCO26WatchFacesWallpaperSupport26WallpaperMetalCoordination9Resources_device);
    v9[11] = v19;
    v9[12] = *(_QWORD *)(v17
                       + OBJC_IVAR____TtCO26WatchFacesWallpaperSupport26WallpaperMetalCoordination9Resources_commandQueue);
    v20 = *(uint64_t (**)(uint64_t, uint64_t))(v18 + 8);
    v21 = v17;
    swift_unknownObjectRetain_n();
    swift_unknownObjectRetain();
    v65[1] = v21;
    swift_retain();
    v22 = v20(a3, v18);
    v23 = (CGColorSpace *)(*(uint64_t (**)(uint64_t, uint64_t))(v18 + 16))(a3, v18);
    v24 = objc_allocWithZone((Class)type metadata accessor for WallpaperMetalView(0));
    v25 = sub_24A28E3DC(v19, v22, v23);
    v9[13] = (uint64_t)v25;
    if (qword_25791F810 != -1)
      swift_once();
    v26 = sub_24A292D78();
    v27 = __swift_project_value_buffer(v26, (uint64_t)qword_2579207F0);
    v28 = *(_QWORD *)(v26 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v15, v27, v26);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v15, 0, 1, v26);
    v29 = (uint64_t)&v25[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_log];
    swift_beginAccess();
    sub_24A28C8A8((uint64_t)v15, v29, &qword_257920CA0);
    swift_endAccess();
    *(_BYTE *)(v9[13] + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_shouldDrawAutomatically) = 0;
    v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE56D0]), sel_init);
    v9[14] = (uint64_t)v30;
    v31 = qword_25791F7D0;
    v32 = v30;
    if (v31 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257920840);
    v33 = (void *)sub_24A292DB4();
    objc_msgSend(v32, sel_setActions_, v33);

    v34 = (void *)v9[14];
    objc_msgSend(v34, sel_setPosition_, 0.0, 0.0);
    objc_msgSend(v34, sel_setAnchorPoint_, 0.0, 0.0);
    v35 = v34;
    v36 = (void *)sub_24A292E08();
    objc_msgSend(v35, sel_setName_, v36);

    (*(void (**)(_QWORD *__return_ptr, uint64_t))(v70 + 32))(v91, a3);
    if (LOBYTE(v91[0]) == 2)
    {
      v37 = 0;
      v38 = v68;
      v39 = v71;
    }
    else
    {
      v37 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE56D0]), sel_init);
      objc_msgSend(v37, sel_setAnchorPoint_, 0.0, 0.0);
      v41 = objc_msgSend((id)v9[14], sel_actions);
      if (v41)
      {
        sub_24A292DC0();

        v41 = (id)sub_24A292DB4();
        swift_bridgeObjectRelease();
      }
      objc_msgSend(v37, sel_setActions_, v41);

      objc_msgSend(v37, sel_setHidden_, 1);
      v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE56D0]), sel_init);
      objc_msgSend(v42, sel_setAnchorPoint_, 0.0, 0.0);
      v43 = objc_msgSend((id)v9[14], sel_actions);
      if (v43)
      {
        sub_24A292DC0();

        v43 = (id)sub_24A292DB4();
        swift_bridgeObjectRelease();
      }
      v38 = v68;
      v39 = v71;
      objc_msgSend(v42, sel_setActions_, v43);

      objc_msgSend(v37, sel_setMask_, v42);
    }
    v9[15] = (uint64_t)v37;
    v9[35] = v67;
    v9[36] = v39;
    swift_getObjectType();
    swift_bridgeObjectRetain();
    if ((objc_msgSend(v38, sel_isSnapshot) & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v44 = v69;
      sub_24A28C9B8(v69, (uint64_t)v91, (uint64_t *)&unk_257920830);
      v45 = v92;
    }
    else
    {
      v46 = objc_msgSend((id)swift_unknownObjectRetain(), sel_traitCollection);
      if (v46)
      {
        v47 = v46;
        v48 = objc_msgSend(v46, sel_userInterfaceStyle);

        v49 = v48 == (id)2;
      }
      else
      {
        v49 = 0;
      }
      v50 = objc_msgSend(v38, sel_deviceOrientation);
      PRPosterRenderingEnvironment.unlockState.getter((uint64_t)v74);
      v51 = v74[0];
      v52 = v75;
      PRPosterRenderingEnvironment.wakeState.getter((uint64_t)v91);
      v53 = v91[0];
      v54 = v91[1];
      v55 = v91[2];
      v56 = objc_msgSend(v38, sel_isSnapshot);
      swift_unknownObjectRelease();
      v73 = 0;
      v72 = 0;
      v74[0] = v51;
      v75 = v52;
      v76 = v53;
      v77 = v54;
      v78 = v55;
      v79 = v49;
      v80 = v56;
      v81 = v67;
      v82 = v71;
      v83 = 0;
      v84 = 0;
      v85 = 0;
      v86 = 0;
      v87 = v50;
      v88 = 0u;
      v89 = 0u;
      v90 = 0;
      nullsub_1(v74);
      v44 = v69;
      sub_24A28C9B8(v69, (uint64_t)v91, (uint64_t *)&unk_257920830);
      v45 = v74;
    }
    sub_24A28C9B8((uint64_t)v45, v44, (uint64_t *)&unk_257920830);
    sub_24A28C9FC((uint64_t)v91, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))sub_24A27FF28, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))sub_24A28755C);
    v57 = (char *)v9[13];
    v58 = swift_allocObject();
    swift_weakInit();
    v59 = swift_allocObject();
    v60 = v66;
    *(_QWORD *)(v59 + 16) = v58;
    *(_QWORD *)(v59 + 24) = v60;
    v61 = (uint64_t (**)(void *))&v57[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_drawingHandler];
    v62 = *(_QWORD *)&v57[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_drawingHandler];
    *v61 = sub_24A28C8A0;
    v61[1] = (uint64_t (*)(void *))v59;
    v63 = v57;
    swift_retain();
    sub_24A2873D8(v62);
    swift_release();

    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24A27AA14();
    swift_allocError();
    *v40 = 0;
    swift_willThrow();
    swift_unknownObjectRelease();
    sub_24A28E30C(v16, &qword_2579202F8);
    swift_release();
    swift_unknownObjectRelease();
    sub_24A28C9B8(v69, (uint64_t)v91, (uint64_t *)&unk_257920830);
    sub_24A28C9FC((uint64_t)v91, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))sub_24A27FF28, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))sub_24A28755C);

    swift_bridgeObjectRelease();
    type metadata accessor for WallpaperMetalCoordination.RenderingCoordinator();
    swift_deallocPartialClassInstance();
  }
  return v9;
}

uint64_t sub_24A2895F0(void *a1)
{
  uint64_t result;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  _OWORD v7[8];
  char v8;
  _BYTE v9[136];
  _BYTE v10[136];
  _OWORD v11[8];
  char v12;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_24A28C9B8(result + 144, (uint64_t)v10, (uint64_t *)&unk_257920830);
    sub_24A28C9B8((uint64_t)v10, (uint64_t)v11, (uint64_t *)&unk_257920830);
    if (sub_24A28C8EC((uint64_t)v11) == 1)
    {
      if (qword_25791F810 != -1)
        swift_once();
      v3 = sub_24A292D78();
      __swift_project_value_buffer(v3, (uint64_t)qword_2579207F0);
      v4 = sub_24A292D60();
      v5 = sub_24A292F70();
      if (os_log_type_enabled(v4, v5))
      {
        v6 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_24A26B000, v4, v5, "got a request to render, but have no non-snapshot state", v6, 2u);
        MEMORY[0x24BD0C57C](v6, -1, -1);
      }

      return swift_release();
    }
    else
    {
      v7[6] = v11[6];
      v7[7] = v11[7];
      v8 = v12;
      v7[2] = v11[2];
      v7[3] = v11[3];
      v7[4] = v11[4];
      v7[5] = v11[5];
      v7[0] = v11[0];
      v7[1] = v11[1];
      sub_24A28C9B8((uint64_t)v10, (uint64_t)v9, (uint64_t *)&unk_257920830);
      sub_24A2874D8((uint64_t)v9, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A2874A0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A2874CC);
      sub_24A28B50C((uint64_t)v7, 0, a1);
      swift_release();
      return sub_24A28C9FC((uint64_t)v10, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))sub_24A27FF28, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))sub_24A28755C);
    }
  }
  return result;
}

uint64_t sub_24A28999C(void *a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  _QWORD *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t);
  _BYTE *v64;
  uint8_t *v65;
  _BYTE *v66;
  uint64_t v67;
  uint64_t v69;
  _BYTE v70[136];
  uint64_t v71[3];
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  CGRect v75;
  CGRect v76;

  v4 = v3;
  v5 = v2;
  swift_beginAccess();
  v67 = v2 + 32;
  sub_24A27F738(v2 + 32, (uint64_t)v71);
  v7 = v72;
  sub_24A28E30C((uint64_t)v71, &qword_2579202F8);
  if (!v7)
    goto LABEL_6;
  if (qword_25791F810 != -1)
    goto LABEL_47;
  while (1)
  {
    v8 = sub_24A292D78();
    __swift_project_value_buffer(v8, (uint64_t)qword_2579207F0);
    v9 = sub_24A292D60();
    v10 = sub_24A292F70();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_24A26B000, v9, v10, "renderer should be nil at this point — attaching multiple times?", v11, 2u);
      MEMORY[0x24BD0C57C](v11, -1, -1);
    }

LABEL_6:
    objc_msgSend(a1, sel_bounds);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = objc_msgSend(a1, sel_window);
    if (!v20
      || (v21 = v20, v22 = objc_msgSend(v20, sel_screen), v21, !v22))
    {
      v22 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
    }
    objc_msgSend(v22, sel_nativeScale);
    v24 = v23;

    v75.origin.x = v13;
    v75.origin.y = v15;
    v75.size.width = v17;
    v75.size.height = v19;
    v25 = ceil(v24 * CGRectGetWidth(v75));
    if ((~*(_QWORD *)&v25 & 0x7FF0000000000000) == 0)
    {
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }
    if (v25 <= -9.22337204e18)
      goto LABEL_42;
    if (v25 >= 9.22337204e18)
      goto LABEL_43;
    v76.origin.x = v13;
    v76.origin.y = v15;
    v76.size.width = v17;
    v76.size.height = v19;
    v26 = ceil(v24 * CGRectGetHeight(v76));
    if ((~*(_QWORD *)&v26 & 0x7FF0000000000000) == 0)
      goto LABEL_44;
    if (v26 <= -9.22337204e18)
      goto LABEL_45;
    if (v26 < 9.22337204e18)
      break;
LABEL_46:
    __break(1u);
LABEL_47:
    swift_once();
  }
  v74 = (uint64_t)v25;
  v69 = (uint64_t)v26;
  v27 = *(void **)(v5 + 104);
  v28 = (double)(uint64_t)v25;
  v29 = (double)(uint64_t)v26;
  v30 = objc_msgSend(v27, sel_layer);
  objc_opt_self();
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setDrawableSize_, v28, v29);

  objc_msgSend(v27, sel_setBounds_, v13, v15, v17, v19);
  v31 = *(void **)(v5 + 112);
  objc_msgSend(v31, sel_setBounds_, v13, v15, v17, v19);
  objc_msgSend(a1, sel_addSubview_, v27);
  v32 = objc_msgSend(a1, sel_layer);
  objc_msgSend(v32, sel_addSublayer_, v31);

  v34 = *(_QWORD *)(v5 + 16);
  v33 = *(_QWORD *)(v5 + 24);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v33 + 32))(v71, v34, v33);
  v66 = v27;
  if (LOBYTE(v71[0]) == 2)
  {
    *(_QWORD *)(v5 + 128) = 0;
  }
  else
  {
    v35 = v71[0] & 1;
    v36 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    objc_msgSend(a2, sel_setBackgroundColor_, v36);

    v37 = *(void **)(v5 + 88);
    swift_unknownObjectRetain();
    v38 = objc_msgSend(v27, (SEL)0x251BBCE48);
    LOBYTE(v71[0]) = v35;
    type metadata accessor for WallpaperMetalCoordination.FloatingLayerManager();
    swift_allocObject();
    v39 = sub_24A27A12C(v74, v69, v37, v38, (char *)v71, v17, v19);
    if (v3)
    {
      if (qword_25791F810 != -1)
        swift_once();
      v40 = sub_24A292D78();
      __swift_project_value_buffer(v40, (uint64_t)qword_2579207F0);
      v41 = v3;
      v42 = v3;
      v43 = sub_24A292D60();
      v44 = sub_24A292F70();
      if (os_log_type_enabled(v43, v44))
      {
        v45 = (uint8_t *)swift_slowAlloc();
        v46 = (_QWORD *)swift_slowAlloc();
        v65 = v45;
        *(_DWORD *)v45 = 138543362;
        v47 = v3;
        v48 = _swift_stdlib_bridgeErrorToNSError();
        v71[0] = v48;
        sub_24A292FF4();
        *v46 = v48;

        _os_log_impl(&dword_24A26B000, v43, v44, "couldn’t set up floating layer: %{public}@", v65, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2579202A8);
        swift_arrayDestroy();
        MEMORY[0x24BD0C57C](v46, -1, -1);
        MEMORY[0x24BD0C57C](v65, -1, -1);

      }
      else
      {

      }
      v49 = 0;
      v4 = 0;
    }
    else
    {
      v49 = v39;
    }
    *(_QWORD *)(v5 + 128) = v49;
    swift_retain();
    swift_release();
    if (v49)
    {
      swift_retain();
      v50 = objc_msgSend(a2, sel_layer);
      objc_msgSend(v50, sel_addSublayer_, *(_QWORD *)(v49 + 16));
      swift_release();

    }
    v51 = *(void **)(v5 + 120);
    if (v51)
    {
      v52 = v51;
      objc_msgSend(v52, sel_setBounds_, v13, v15, v17, v19);
      v53 = objc_msgSend(v52, sel_mask);
      objc_msgSend(v53, sel_setBounds_, v13, v15, v17, v19);

      v54 = objc_msgSend(a2, sel_layer);
      objc_msgSend(v54, sel_addSublayer_, v52);

    }
  }
  v55 = v4;
  swift_release();
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v33 + 24))(v34, v33) & 1) != 0)
  {
    v56 = objc_msgSend(*(id *)(v5 + 96), sel_commandBuffer);
    if (v56)
    {
      v57 = v56;
      v58 = (void *)sub_24A292E08();
      objc_msgSend(v57, sel_setLabel_, v58);

      goto LABEL_33;
    }
    sub_24A27AA14();
    swift_allocError();
    *v64 = 1;
    return swift_willThrow();
  }
  else
  {
    v57 = 0;
LABEL_33:
    v60 = *(_QWORD *)(v5 + 80);
    v59 = *(_QWORD *)(v5 + 88);
    v61 = *(_QWORD *)(v5 + 72);
    v62 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t))(v33 + 40);
    v72 = v34;
    v73 = v33;
    __swift_allocate_boxed_opaque_existential_1(v71);
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    v62(v59, v61, v60, v74, v69, v57, v34, v33);
    if (v55)
    {
      __swift_deallocate_boxed_opaque_existential_1((uint64_t)v71);
    }
    else
    {
      swift_beginAccess();
      sub_24A28C8A8((uint64_t)v71, v67, &qword_2579202F8);
      swift_endAccess();
      if (v57)
        objc_msgSend(v57, sel_commit);
      sub_24A28C9B8(v5 + 144, (uint64_t)v70, (uint64_t *)&unk_257920830);
      sub_24A28C9B8((uint64_t)v70, (uint64_t)v71, (uint64_t *)&unk_257920830);
      if (sub_24A28C8EC((uint64_t)v71) != 1)
      {
        v66[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_shouldDrawAutomatically] = 1;
        objc_msgSend(v66, sel_setNeedsDisplay);
      }
    }
    return swift_unknownObjectRelease();
  }
}

uint64_t sub_24A28A294(void *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  BOOL v14;
  id v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int8 v21;
  void *v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  int v28;
  id v29;
  __int128 v30;
  __int128 v31;
  int v32;
  uint64_t v33;
  char *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  SEL *v39;
  unsigned int v40;
  _BYTE *v41;
  uint64_t v42;
  int v43;
  NSObject *v44;
  os_log_type_t v45;
  uint64_t v46;
  uint8_t *v47;
  uint8_t *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  _QWORD *v57;
  id v58;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  uint64_t v62;
  uint8_t *v63;
  uint8_t *v64;
  char *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  char *v72;
  void *v73;
  char *v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  NSObject *v84;
  os_log_type_t v85;
  int v86;
  uint64_t v87;
  uint8_t *v88;
  uint8_t *v89;
  id v90;
  uint64_t v91;
  unint64_t v92;
  uint8_t *v93;
  id v94;
  id v95;
  double Current;
  double v97;
  uint64_t v98;
  void *v99;
  void *v100;
  double v101;
  double v102;
  double v103;
  id v104;
  uint64_t v105;
  uint8_t *v106;
  void *v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  _QWORD v115[17];
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _OWORD v120[2];
  __int128 v121;
  __int128 v122;
  unsigned __int8 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  unsigned __int8 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  unsigned __int8 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  uint64_t v146;
  __int128 v147;
  id v148;
  __int128 v149;
  __int128 v150;
  char v151;
  unsigned __int8 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  uint64_t v158;

  v113 = a2;
  v3 = sub_24A292D78();
  v112 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v111 = (char *)&v104 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjectType();
  v5 = objc_msgSend(a1, sel_contents);
  v6 = (void *)sub_24A292E08();
  v7 = objc_msgSend(v5, sel_objectForUserInfoKey_, v6);

  swift_unknownObjectRelease();
  if (v7)
  {
    sub_24A29300C();
    swift_unknownObjectRelease();
  }
  else
  {
    v133 = 0u;
    v134 = 0u;
  }
  v109 = v3;
  sub_24A28C9B8((uint64_t)&v133, (uint64_t)&v142, &qword_257920850);
  if (*((_QWORD *)&v143 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v8 = v124;
      if (v124 == *(_OWORD *)(v114 + 280) || (sub_24A29315C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        if (qword_25791F810 != -1)
          swift_once();
        __swift_project_value_buffer(v109, (uint64_t)qword_2579207F0);
        swift_bridgeObjectRetain_n();
        v84 = sub_24A292D60();
        v85 = sub_24A292F64();
        v86 = v85;
        if (os_log_type_enabled(v84, v85))
        {
          v87 = swift_slowAlloc();
          LODWORD(v110) = v86;
          v88 = (uint8_t *)v87;
          v108 = (id)swift_slowAlloc();
          *(_QWORD *)&v142 = v108;
          *(_DWORD *)v88 = 136446210;
          v106 = v88 + 4;
          v89 = v88;
          swift_bridgeObjectRetain();
          *(_QWORD *)&v133 = sub_24A26FA2C(v8, *((unint64_t *)&v8 + 1), (uint64_t *)&v142);
          sub_24A292FF4();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_24A26B000, v84, (os_log_type_t)v110, "renderer got an update with a new look identifier %{public}s", v88, 0xCu);
          v90 = v108;
          swift_arrayDestroy();
          MEMORY[0x24BD0C57C](v90, -1, -1);
          MEMORY[0x24BD0C57C](v89, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        *(_OWORD *)(v114 + 280) = v8;
        swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
    sub_24A28E30C((uint64_t)&v142, &qword_257920850);
  }
  v10 = *(_QWORD *)(v114 + 280);
  v9 = *(_QWORD *)(v114 + 288);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  v11 = objc_msgSend(a1, sel_traitCollection);
  if (v11)
  {
    v12 = v11;
    v13 = objc_msgSend(v11, sel_userInterfaceStyle);

    v14 = v13 == (id)2;
  }
  else
  {
    v14 = 0;
  }
  v15 = objc_msgSend(a1, sel_deviceOrientation);
  PRPosterRenderingEnvironment.unlockState.getter((uint64_t)&v124);
  v16 = v124;
  v17 = *((_QWORD *)&v124 + 1);
  PRPosterRenderingEnvironment.wakeState.getter((uint64_t)&v133);
  v18 = v133;
  v19 = *((_QWORD *)&v133 + 1);
  v20 = v134;
  v21 = objc_msgSend(a1, sel_isSnapshot);
  swift_unknownObjectRelease();
  LOBYTE(v142) = v16;
  *((_QWORD *)&v142 + 1) = v17;
  LOBYTE(v143) = v18;
  *((_QWORD *)&v143 + 1) = v19;
  *(_QWORD *)&v144 = v20;
  BYTE8(v144) = v14;
  BYTE9(v144) = v21;
  *(_QWORD *)&v145 = v10;
  *((_QWORD *)&v145 + 1) = v9;
  *(_QWORD *)&v147 = 0;
  v146 = 0;
  *(_QWORD *)((char *)&v147 + 5) = 0;
  v110 = (uint64_t)v15;
  v148 = v15;
  v149 = 0u;
  v150 = 0u;
  v151 = 0;
  v153 = v142;
  v154 = v143;
  v158 = *((_QWORD *)&v147 + 1);
  v156 = v145;
  v157 = 0u;
  v155 = v144;
  v152 = 0;
  if (v113)
  {
    v22 = v113;
    objc_msgSend(v22, sel_duration);
    if (v23 > 0.0)
    {
      v108 = v22;
      sub_24A28C9B8(v114 + 144, (uint64_t)&v124, (uint64_t *)&unk_257920830);
      sub_24A28C9B8((uint64_t)&v124, (uint64_t)&v133, (uint64_t *)&unk_257920830);
      if (sub_24A28C8EC((uint64_t)&v133) == 1)
      {
        LOBYTE(v116) = v16;
        *((_QWORD *)&v116 + 1) = v17;
        LOBYTE(v117) = v18;
        *((_QWORD *)&v117 + 1) = v19;
        *(_QWORD *)&v118 = v20;
        BYTE8(v118) = v14;
        BYTE9(v118) = v21;
        *(_QWORD *)&v119 = v10;
        *((_QWORD *)&v119 + 1) = v9;
        memset(v120, 0, 21);
        v24 = v110;
        *((_QWORD *)&v120[1] + 1) = v110;
        v121 = 0u;
        v122 = 0u;
        v123 = 0;
        sub_24A2874D8((uint64_t)&v142, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A2874A0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A2874CC);
        sub_24A2874D8((uint64_t)&v116, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
      }
      else
      {
        sub_24A28C9B8((uint64_t)&v124, (uint64_t)&v116, (uint64_t *)&unk_257920830);
        v24 = *((_QWORD *)&v120[1] + 1);
        v30 = v121;
        v31 = v122;
        v32 = v123;
        sub_24A2874CC(*((uint64_t *)&v120[1] + 1), v121, *((void **)&v121 + 1), v122, *((uint64_t *)&v122 + 1), v123);
        if (v32 == 1)
        {
          sub_24A28755C(v24, v30, *((void **)&v30 + 1), v31, *((uint64_t *)&v31 + 1), 1);
          v24 = v30;
        }
      }
      v33 = v109;
      v34 = v111;
      v35 = objc_msgSend(a1, sel_deviceOrientation);
      v36 = v112;
      if (v35 != (id)v24)
      {
        if (qword_25791F810 != -1)
          swift_once();
        v77 = __swift_project_value_buffer(v33, (uint64_t)qword_2579207F0);
        (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v34, v77, v33);
        swift_unknownObjectRetain_n();
        v78 = sub_24A292D60();
        LODWORD(v113) = sub_24A292F64();
        if (os_log_type_enabled(v78, (os_log_type_t)v113))
        {
          v79 = swift_slowAlloc();
          v80 = swift_slowAlloc();
          *(_QWORD *)&v116 = v80;
          *(_DWORD *)v79 = 136315394;
          v106 = (uint8_t *)v80;
          v81 = 0xD000000000000014;
          v82 = 0x800000024A2984D0;
          switch(v24)
          {
            case 1:
              v82 = 0xE800000000000000;
              v81 = 0x7469617274726F50;
              break;
            case 2:
              break;
            case 3:
              v82 = 0xEF74686769522065;
              goto LABEL_70;
            case 4:
              v82 = 0xEE007466654C2065;
LABEL_70:
              v81 = 0x70616373646E614CLL;
              break;
            default:
              v82 = 0x800000024A2984B0;
              v81 = 0xD000000000000013;
              break;
          }
          v115[0] = sub_24A26FA2C(v81, v82, (uint64_t *)&v116);
          sub_24A292FF4();
          swift_bridgeObjectRelease();
          *(_WORD *)(v79 + 12) = 2080;
          v91 = 0xD000000000000014;
          v92 = 0x800000024A2984D0;
          switch((unint64_t)objc_msgSend(a1, sel_deviceOrientation))
          {
            case 1uLL:
              v92 = 0xE800000000000000;
              v91 = 0x7469617274726F50;
              break;
            case 2uLL:
              break;
            case 3uLL:
              v92 = 0xEF74686769522065;
              goto LABEL_76;
            case 4uLL:
              v92 = 0xEE007466654C2065;
LABEL_76:
              v91 = 0x70616373646E614CLL;
              break;
            default:
              v92 = 0x800000024A2984B0;
              break;
          }
          v115[0] = sub_24A26FA2C(v91, v92, (uint64_t *)&v116);
          sub_24A292FF4();
          swift_unknownObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_24A26B000, v78, (os_log_type_t)v113, "🔄 renderer starting orientation transition %s → %s", (uint8_t *)v79, 0x16u);
          v93 = v106;
          swift_arrayDestroy();
          MEMORY[0x24BD0C57C](v93, -1, -1);
          MEMORY[0x24BD0C57C](v79, -1, -1);

          (*(void (**)(char *, uint64_t))(v112 + 8))(v111, v109);
        }
        else
        {

          swift_unknownObjectRelease_n();
          (*(void (**)(char *, uint64_t))(v36 + 8))(v34, v33);
        }
        v111 = (char *)objc_msgSend(a1, sel_deviceOrientation);
        v94 = v108;
        v95 = objc_msgSend(v108, sel_timingFunction);
        if (!v95)
          v95 = objc_msgSend((id)objc_opt_self(), sel_functionWithName_, *MEMORY[0x24BDE5D20]);
        v113 = v95;
        Current = CFAbsoluteTimeGetCurrent();
        objc_msgSend(v94, sel_delay);
        *(double *)&v98 = Current + v97;
        objc_msgSend(v94, sel_duration);
        v37 = v98;
        v100 = v99;
        objc_msgSend(v94, sel_delay);
        v102 = v101;
        objc_msgSend(v94, sel_duration);
        sub_24A28E95C(v102 + v103);
        v29 = v100;

        v38 = 0;
        LODWORD(v106) = 1;
        goto LABEL_27;
      }

LABEL_26:
      v24 = 0;
      v111 = 0;
      v113 = 0;
      v37 = 0;
      v29 = 0;
      LODWORD(v106) = 255;
      v38 = 1;
LABEL_27:
      v39 = (SEL *)&unk_251BBC000;
      goto LABEL_28;
    }

  }
  sub_24A28C9B8(v114 + 144, (uint64_t)&v124, (uint64_t *)&unk_257920830);
  sub_24A28C9B8((uint64_t)&v124, (uint64_t)&v116, (uint64_t *)&unk_257920830);
  sub_24A28C9B8((uint64_t)&v124, (uint64_t)&v133, (uint64_t *)&unk_257920830);
  if (sub_24A28C8EC((uint64_t)&v133) == 1)
    goto LABEL_26;
  v25 = *((_QWORD *)&v120[1] + 1);
  v26 = v121;
  v27 = v122;
  v28 = v123;
  sub_24A28C9B8((uint64_t)&v116, (uint64_t)v115, (uint64_t *)&unk_257920830);
  v112 = v25;
  sub_24A2874CC(v25, v26, *((void **)&v26 + 1), v27, *((uint64_t *)&v27 + 1), v28);
  sub_24A28C9FC((uint64_t)&v124, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))sub_24A2874A0, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))sub_24A2874CC);
  sub_24A28C9FC((uint64_t)v115, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))sub_24A27FF28, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))sub_24A28755C);
  if (v28 != 1)
    goto LABEL_26;
  v29 = (id)*((_QWORD *)&v27 + 1);
  if (CFAbsoluteTimeGetCurrent() > *(double *)&v27 + *((double *)&v27 + 1))
  {
    sub_24A28755C(v112, v26, *((void **)&v26 + 1), v27, *((uint64_t *)&v27 + 1), 1);
    goto LABEL_26;
  }
  v113 = (void *)*((_QWORD *)&v26 + 1);
  v111 = (char *)v26;
  v38 = 0;
  LODWORD(v106) = 1;
  v39 = (SEL *)&unk_251BBC000;
  v37 = v27;
  v24 = v112;
LABEL_28:
  v40 = objc_msgSend(a1, v39[340]);
  v41 = *(_BYTE **)(v114 + 104);
  v42 = OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_shouldDrawAutomatically;
  v43 = v41[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_shouldDrawAutomatically];
  v108 = v29;
  v112 = v24;
  if (v40)
  {
    if (v43)
    {
      if (qword_25791F810 != -1)
        swift_once();
      __swift_project_value_buffer(v109, (uint64_t)qword_2579207F0);
      v44 = sub_24A292D60();
      v45 = sub_24A292F64();
      if (os_log_type_enabled(v44, v45))
      {
        v46 = v37;
        v47 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v47 = 0;
        _os_log_impl(&dword_24A26B000, v44, v45, "⏸️ disabling automatic drawing", v47, 2u);
        v48 = v47;
        v37 = v46;
        MEMORY[0x24BD0C57C](v48, -1, -1);
      }

      v24 = v112;
    }
    v41[v42] = 0;
    v135 = v155;
    v136 = v156;
    v137 = v157;
    v133 = v153;
    v134 = v154;
    *(_QWORD *)&v138 = v158;
    v49 = v110;
    *((_QWORD *)&v138 + 1) = v110;
    v139 = 0u;
    v140 = 0u;
    v141 = v152;
    v130 = 0u;
    v131 = 0u;
    v132 = v152;
    v126 = v155;
    v127 = v156;
    v128 = v157;
    v129 = v138;
    v124 = v153;
    v125 = v154;
    sub_24A2874D8((uint64_t)&v133, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A2874A0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A2874CC);
    v50 = v107;
    sub_24A28B50C((uint64_t)&v124, 1, 0);
    if (v50)
    {
      sub_24A2874D8((uint64_t)&v133, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
      v51 = v113;
      if (qword_25791F810 != -1)
        swift_once();
      __swift_project_value_buffer(v109, (uint64_t)qword_2579207F0);
      v52 = v50;
      v53 = v50;
      v54 = sub_24A292D60();
      v55 = sub_24A292F70();
      if (os_log_type_enabled(v54, v55))
      {
        v56 = (uint8_t *)swift_slowAlloc();
        v57 = (_QWORD *)swift_slowAlloc();
        v105 = v37;
        *(_DWORD *)v56 = 138412290;
        v113 = v51;
        v58 = v50;
        v59 = _swift_stdlib_bridgeErrorToNSError();
        *(_QWORD *)&v124 = v59;
        sub_24A292FF4();
        *v57 = v59;

        _os_log_impl(&dword_24A26B000, v54, v55, "failed to render for snapshot: %@", v56, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2579202A8);
        swift_arrayDestroy();
        MEMORY[0x24BD0C57C](v57, -1, -1);
        MEMORY[0x24BD0C57C](v56, -1, -1);

        sub_24A287568(v112, (uint64_t)v111, v113, v105, (uint64_t)v108, v106);
      }
      else
      {
        sub_24A287568(v24, (uint64_t)v111, v51, v37, (uint64_t)v108, v106);

      }
      v76 = 0;
      v66 = 0;
      v67 = 0;
      v68 = 0;
      v49 = v110;
    }
    else
    {
      sub_24A2874D8((uint64_t)&v133, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
      sub_24A287568(v24, (uint64_t)v111, v113, v37, (uint64_t)v108, v106);
      v76 = 0;
      v66 = 0;
      v67 = 0;
      v68 = 0;
    }
  }
  else
  {
    if ((v43 & 1) == 0)
    {
      if (qword_25791F810 != -1)
        swift_once();
      __swift_project_value_buffer(v109, (uint64_t)qword_2579207F0);
      v60 = sub_24A292D60();
      v61 = sub_24A292F64();
      if (os_log_type_enabled(v60, v61))
      {
        v62 = v37;
        v63 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v63 = 0;
        _os_log_impl(&dword_24A26B000, v60, v61, "▶️ reenabling automatic drawing", v63, 2u);
        v64 = v63;
        v37 = v62;
        MEMORY[0x24BD0C57C](v64, -1, -1);
      }

      v24 = v112;
      v29 = v108;
    }
    v41[v42] = 1;
    v104 = v41;
    v105 = v37;
    if ((v38 & 1) != 0)
    {
      v65 = 0;
      v66 = 0;
      v67 = 0;
      v68 = 0;
      v49 = v110;
    }
    else
    {
      v69 = (uint64_t)v29;
      v70 = v152;
      v71 = v24;
      v72 = v111;
      v49 = v24;
      v73 = v113;
      sub_24A2874CC(v71, (uint64_t)v111, v113, v37, v69, 1);
      sub_24A28755C(v110, 0, 0, 0, 0, v70);
      v152 = 1;
      v111 = v72;
      v65 = v72;
      v113 = v73;
      v66 = v73;
      v67 = v37;
      v68 = v69;
    }
    v118 = v155;
    v119 = v156;
    v120[0] = v157;
    v116 = v153;
    v117 = v154;
    *(_QWORD *)&v120[1] = v158;
    *((_QWORD *)&v120[1] + 1) = v49;
    *(_QWORD *)&v121 = v65;
    *((_QWORD *)&v121 + 1) = v66;
    *(_QWORD *)&v122 = v67;
    *((_QWORD *)&v122 + 1) = v68;
    v123 = v152;
    v132 = v152;
    v130 = v121;
    v131 = v122;
    v128 = v157;
    v129 = v120[1];
    v126 = v155;
    v127 = v156;
    v124 = v153;
    v125 = v154;
    v74 = v65;
    nullsub_1(&v124);
    v75 = v114 + 144;
    sub_24A28C9B8(v114 + 144, (uint64_t)&v133, (uint64_t *)&unk_257920830);
    sub_24A28C9B8((uint64_t)&v124, v75, (uint64_t *)&unk_257920830);
    sub_24A2874D8((uint64_t)&v116, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A2874A0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A2874CC);
    sub_24A28C9FC((uint64_t)&v133, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))sub_24A27FF28, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))sub_24A28755C);
    objc_msgSend(v104, sel_setNeedsDisplay);
    sub_24A287568(v112, (uint64_t)v111, v113, v105, (uint64_t)v108, v106);
    v76 = v74;
  }
  v135 = v155;
  v136 = v156;
  v137 = v157;
  v133 = v153;
  v134 = v154;
  *(_QWORD *)&v138 = v158;
  *((_QWORD *)&v138 + 1) = v49;
  *(_QWORD *)&v139 = v76;
  *((_QWORD *)&v139 + 1) = v66;
  *(_QWORD *)&v140 = v67;
  *((_QWORD *)&v140 + 1) = v68;
  v141 = v152;
  return sub_24A2874D8((uint64_t)&v133, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
}

uint64_t sub_24A28B42C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v7;

  type metadata accessor for WallpaperMetalCoordination.RenderingCoordinator.ContinuousRenderingToken();
  swift_allocObject();
  swift_retain();
  swift_bridgeObjectRetain();
  v5 = sub_24A28DD40(v2, a1, a2);
  swift_release();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_24A28D9FC(&v7, a1, a2);
  swift_endAccess();
  swift_bridgeObjectRelease();
  *(_BYTE *)(*(_QWORD *)(v2 + 104)
           + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_wantsIndefiniteContinuousRendering) = 1;
  sub_24A28F28C();
  return v5;
}

void sub_24A28B50C(uint64_t a1, int a2, id a3)
{
  _QWORD *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v10;
  void (**v11)(char *, uint64_t);
  uint64_t v12;
  char *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t);
  NSObject *v20;
  os_log_type_t v21;
  int v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  id v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint8_t *v55;
  void (**v56)(char *, uint64_t);
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  _BYTE *v62;
  NSObject *v63;
  os_log_type_t v64;
  uint8_t *v65;
  void *v66;
  NSObject *v67;
  os_log_type_t v68;
  uint8_t *v69;
  uint8_t *v70;
  void *v71;
  id v72;
  double v73;
  double v74;
  id v75;
  double v76;
  double v77;
  _QWORD *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  NSObject *v82;
  int v83;
  id v84;
  NSObject *v85;
  os_log_type_t v86;
  uint8_t *v87;
  uint64_t v88;
  uint64_t v89;
  void (*v90)(__int128 *, id, uint64_t *, void (**)(char *, uint64_t), uint64_t, uint64_t);
  id v91;
  void *v92;
  void (**v93)(char *, uint64_t);
  _BYTE *v94;
  void *v95;
  void *v96;
  id v97;
  uint64_t v98;
  _QWORD *v99;
  NSObject *v100;
  uint64_t v101;
  NSObject *v102;
  os_log_type_t v103;
  uint8_t *v104;
  uint8_t *v105;
  void *v106;
  id v107;
  id v108;
  void *v109;
  id v110;
  id v111;
  NSObject *v112;
  id v113;
  NSObject *v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  __int128 v119;
  uint64_t v120;
  id v121;
  NSObject *v122;
  void (**v123)(char *, uint64_t);
  void *v124;
  _QWORD *v125;
  uint64_t v126;
  char v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  char v136;
  _QWORD v137[3];
  uint64_t v138;
  uint64_t v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  char v148;
  int v149;
  int v150;

  v5 = v4;
  v6 = v3;
  v10 = sub_24A292D78();
  v11 = *(void (***)(char *, uint64_t))(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v115 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_OWORD *)(a1 + 112);
  v146 = *(_OWORD *)(a1 + 96);
  v147 = v14;
  v148 = *(_BYTE *)(a1 + 128);
  v15 = *(_OWORD *)(a1 + 48);
  v142 = *(_OWORD *)(a1 + 32);
  v143 = v15;
  v16 = *(_OWORD *)(a1 + 80);
  v144 = *(_OWORD *)(a1 + 64);
  v145 = v16;
  v17 = *(_OWORD *)(a1 + 16);
  v140 = *(_OWORD *)a1;
  v141 = v17;
  swift_beginAccess();
  sub_24A27F738((uint64_t)(v6 + 4), (uint64_t)&v128);
  if (*((_QWORD *)&v129 + 1))
  {
    sub_24A2747D4(&v128, (uint64_t)v137);
    if (qword_25791F810 != -1)
      swift_once();
    v18 = __swift_project_value_buffer(v10, (uint64_t)qword_2579207F0);
    v19 = v11[2];
    v120 = v18;
    ((void (*)(char *))v19)(v13);
    v123 = v11;
    sub_24A2874D8((uint64_t)&v140, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A2874A0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A2874CC);
    sub_24A2874D8((uint64_t)&v140, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A2874A0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A2874CC);
    sub_24A2874D8((uint64_t)&v140, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A2874A0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A2874CC);
    sub_24A2874D8((uint64_t)&v140, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A2874A0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A2874CC);
    sub_24A2874D8((uint64_t)&v140, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A2874A0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A2874CC);
    sub_24A2874D8((uint64_t)&v140, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A2874A0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A2874CC);
    sub_24A2874D8((uint64_t)&v140, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A2874A0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A2874CC);
    sub_24A2874D8((uint64_t)&v140, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A2874A0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A2874CC);
    v20 = sub_24A292D60();
    v21 = sub_24A292F64();
    v22 = v21;
    v122 = v20;
    v23 = os_log_type_enabled(v20, v21);
    v125 = v6;
    v150 = a2;
    if (v23)
    {
      v24 = swift_slowAlloc();
      v118 = swift_slowAlloc();
      v126 = v118;
      *(_DWORD *)v24 = 136447234;
      v149 = v22;
      v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_257920B10);
      v25 = swift_allocObject();
      v119 = xmmword_24A294DE0;
      *(_OWORD *)(v25 + 16) = xmmword_24A294DE0;
      v26 = *((_QWORD *)&v140 + 1);
      *(_QWORD *)(v25 + 56) = MEMORY[0x24BEE50B0];
      v27 = sub_24A28E280();
      v124 = v4;
      v28 = v27;
      *(_QWORD *)(v25 + 64) = v27;
      *(_QWORD *)(v25 + 32) = v26;
      v29 = sub_24A292E38();
      *(_QWORD *)&v128 = sub_24A26FA2C(v29, v30, &v126);
      v121 = a3;
      sub_24A292FF4();
      swift_bridgeObjectRelease();
      v117 = v13;
      sub_24A2874D8((uint64_t)&v140, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
      sub_24A2874D8((uint64_t)&v140, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
      *(_WORD *)(v24 + 12) = 2080;
      if (BYTE8(v142))
        v31 = 5457241;
      else
        v31 = 20302;
      if (BYTE8(v142))
        v32 = 0xE300000000000000;
      else
        v32 = 0xE200000000000000;
      *(_QWORD *)&v128 = sub_24A26FA2C(v31, v32, &v126);
      sub_24A292FF4();
      swift_bridgeObjectRelease();
      sub_24A2874D8((uint64_t)&v140, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
      sub_24A2874D8((uint64_t)&v140, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
      *(_WORD *)(v24 + 22) = 2082;
      v116 = v10;
      v33 = swift_allocObject();
      *(_OWORD *)(v33 + 16) = v119;
      v34 = *((_QWORD *)&v141 + 1);
      *(_QWORD *)(v33 + 56) = MEMORY[0x24BEE50B0];
      *(_QWORD *)(v33 + 64) = v28;
      *(_QWORD *)(v33 + 32) = v34;
      v35 = sub_24A292E38();
      *(_QWORD *)&v128 = sub_24A26FA2C(v35, v36, &v126);
      sub_24A292FF4();
      swift_bridgeObjectRelease();
      sub_24A2874D8((uint64_t)&v140, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
      sub_24A2874D8((uint64_t)&v140, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
      *(_WORD *)(v24 + 32) = 2080;
      v37 = swift_allocObject();
      *(_OWORD *)(v37 + 16) = v119;
      v134 = v146;
      v135 = v147;
      v136 = v148;
      v130 = v142;
      v131 = v143;
      v132 = v144;
      v133 = v145;
      v128 = v140;
      v129 = v141;
      WallpaperMetalCoordination.WallpaperState.rotationLandscapeAmount.getter();
      v38 = MEMORY[0x24BEE1568];
      *(_QWORD *)(v37 + 56) = MEMORY[0x24BEE14E8];
      *(_QWORD *)(v37 + 64) = v38;
      *(_DWORD *)(v37 + 32) = v39;
      v40 = sub_24A292E38();
      *(_QWORD *)&v128 = sub_24A26FA2C(v40, v41, &v126);
      a3 = v121;
      v5 = v124;
      sub_24A292FF4();
      swift_bridgeObjectRelease();
      sub_24A2874D8((uint64_t)&v140, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
      sub_24A2874D8((uint64_t)&v140, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
      *(_WORD *)(v24 + 42) = 2082;
      if ((v150 & 1) != 0)
        v42 = 5457241;
      else
        v42 = 20302;
      if ((v150 & 1) != 0)
        v43 = 0xE300000000000000;
      else
        v43 = 0xE200000000000000;
      *(_QWORD *)&v128 = sub_24A26FA2C(v42, v43, &v126);
      v6 = v125;
      sub_24A292FF4();
      swift_bridgeObjectRelease();
      v44 = v122;
      _os_log_impl(&dword_24A26B000, v122, (os_log_type_t)v149, "rendering state [unlock %{public}s, dark %s, dim %{public}s, land %s], is snapshot %{public}s", (uint8_t *)v24, 0x34u);
      v45 = v118;
      swift_arrayDestroy();
      MEMORY[0x24BD0C57C](v45, -1, -1);
      v46 = v24;
      v47 = v150;
      MEMORY[0x24BD0C57C](v46, -1, -1);

      v123[1](v117, v116);
      if ((v47 & 1) == 0)
        goto LABEL_18;
    }
    else
    {
      sub_24A2874D8((uint64_t)&v140, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
      sub_24A2874D8((uint64_t)&v140, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
      sub_24A2874D8((uint64_t)&v140, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
      sub_24A2874D8((uint64_t)&v140, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
      sub_24A2874D8((uint64_t)&v140, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
      sub_24A2874D8((uint64_t)&v140, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
      sub_24A2874D8((uint64_t)&v140, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
      sub_24A2874D8((uint64_t)&v140, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);

      v123[1](v13, v10);
      if ((a2 & 1) == 0)
      {
LABEL_18:
        if (!a3)
        {
          v63 = sub_24A292D60();
          v64 = sub_24A292F70();
          if (os_log_type_enabled(v63, v64))
          {
            v65 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v65 = 0;
            _os_log_impl(&dword_24A26B000, v63, v64, "no drawable available", v65, 2u);
            MEMORY[0x24BD0C57C](v65, -1, -1);
          }

          goto LABEL_63;
        }
        v48 = objc_msgSend((id)swift_unknownObjectRetain(), sel_texture);
        goto LABEL_30;
      }
    }
    v48 = (id)v6[17];
    if (v48)
    {
      swift_unknownObjectRetain();
      v52 = sub_24A292D60();
      v53 = sub_24A292F64();
      if (os_log_type_enabled(v52, v53))
      {
        v54 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v54 = 0;
        _os_log_impl(&dword_24A26B000, v52, v53, "reusing existing snapshot texture", v54, 2u);
        v55 = v54;
        v6 = v125;
        MEMORY[0x24BD0C57C](v55, -1, -1);
      }

      a3 = 0;
      goto LABEL_30;
    }
    v66 = v5;
    v67 = sub_24A292D60();
    v68 = sub_24A292F64();
    if (os_log_type_enabled(v67, v68))
    {
      v69 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v69 = 0;
      _os_log_impl(&dword_24A26B000, v67, v68, "making new snapshot texture", v69, 2u);
      v70 = v69;
      v6 = v125;
      MEMORY[0x24BD0C57C](v70, -1, -1);
    }

    v71 = (void *)v6[13];
    v72 = objc_msgSend(v71, sel_layer);
    objc_opt_self();
    objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_drawableSize);
    v74 = v73;

    if ((~*(_QWORD *)&v74 & 0x7FF0000000000000) != 0)
    {
      if (v74 > -9.22337204e18)
      {
        if (v74 < 9.22337204e18)
        {
          v75 = objc_msgSend(v71, sel_layer);
          objc_opt_self();
          objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_drawableSize);
          v77 = v76;

          if ((~*(_QWORD *)&v77 & 0x7FF0000000000000) != 0)
          {
            if (v77 > -9.22337204e18)
            {
              if (v77 < 9.22337204e18)
              {
                v78 = v125;
                v79 = (void *)v125[11];
                v80 = (*(uint64_t (**)(void))(v125[3] + 8))();
                v81 = sub_24A28E034((uint64_t)v74, (uint64_t)v77, v79, v80);
                v5 = v66;
                if (v66)
                {
LABEL_63:
                  __swift_destroy_boxed_opaque_existential_0((uint64_t)v137);
                  return;
                }
                v48 = v81;
                v78[17] = v81;
                swift_unknownObjectRetain();
                swift_unknownObjectRelease();
                a3 = 0;
                v6 = v78;
LABEL_30:
                v56 = (void (**)(char *, uint64_t))objc_msgSend((id)v6[12], sel_commandBuffer);
                if (!v56)
                {
                  sub_24A27AA14();
                  swift_allocError();
                  *v62 = 2;
                  swift_willThrow();
                  swift_unknownObjectRelease();
LABEL_62:
                  swift_unknownObjectRelease();
                  goto LABEL_63;
                }
                v57 = v6[16];
                v121 = a3;
                v123 = v56;
                v124 = v5;
                if (v57)
                {
                  if ((*(_BYTE *)(v57 + 48) & 1) == 0)
                  {
                    v61 = v48;
                    v60 = (void *)sub_24A27A4C8();
                    v122 = v82;
                    v83 = 0;
LABEL_60:
                    v88 = v138;
                    v89 = v139;
                    __swift_project_boxed_opaque_existential_0(v137, v138);
                    v134 = v146;
                    v135 = v147;
                    v136 = v148;
                    v130 = v142;
                    v131 = v143;
                    v132 = v144;
                    v133 = v145;
                    v128 = v140;
                    v129 = v141;
                    v126 = (uint64_t)v60;
                    v127 = v83;
                    v90 = *(void (**)(__int128 *, id, uint64_t *, void (**)(char *, uint64_t), uint64_t, uint64_t))(v89 + 48);
                    sub_24A28DFEC(v60, v83);
                    v91 = v61;
                    v93 = v123;
                    v92 = v124;
                    v90(&v128, v91, &v126, v123, v88, v89);
                    if (!v92)
                    {
                      sub_24A28E010(v60, v83);
                      objc_msgSend(v93, sel_commit);
                      v124 = 0;
                      LODWORD(v119) = v83;
                      if ((v150 & 1) != 0)
                      {
                        objc_msgSend(v93, sel_waitUntilCompleted);
                        v95 = (void *)v125[14];
                        v96 = (void *)v125[17];
                        if (v96 && (v97 = objc_msgSend(v96, sel_iosurface)) != 0)
                        {
                          *(_QWORD *)&v128 = v97;
                          type metadata accessor for IOSurfaceRef(0);
                          v98 = sub_24A293150();

                        }
                        else
                        {
                          v98 = 0;
                        }
                        objc_msgSend(v95, sel_setContents_, v98);
                        swift_unknownObjectRelease();
                        objc_msgSend(v95, sel_setHidden_, 0);
                        v109 = (void *)v125[15];
                        if (v109)
                        {
                          v110 = v109;
                          v111 = objc_msgSend(v95, sel_contents);
                          v112 = v122;
                          if (v111)
                          {
                            sub_24A29300C();
                            swift_unknownObjectRelease();
                            __swift_project_boxed_opaque_existential_0(&v128, *((uint64_t *)&v129 + 1));
                            v111 = (id)sub_24A293150();
                            __swift_destroy_boxed_opaque_existential_0((uint64_t)&v128);
                          }
                          objc_msgSend(v110, sel_setContents_, v111);
                          swift_unknownObjectRelease();
                          objc_msgSend(v110, sel_setHidden_, 0);
                          v113 = objc_msgSend(v110, sel_mask);
                          v114 = v112;
                          objc_msgSend(v113, sel_setContents_, v114);

                          swift_unknownObjectRelease();
                          swift_unknownObjectRelease();
                          sub_24A28E010(v60, v119);
                          swift_unknownObjectRelease();

                        }
                        else
                        {
                          swift_unknownObjectRelease();
                          swift_unknownObjectRelease();

                          sub_24A28E010(v60, v119);
                          swift_unknownObjectRelease();
                        }
                      }
                      else
                      {
                        objc_msgSend(v93, sel_waitUntilScheduled);
                        if (v121)
                          objc_msgSend(v121, sel_present);
                        v99 = v125;
                        v100 = v122;
                        if (v122)
                        {
                          v101 = v125[16];
                          if (v101)
                            objc_msgSend(*(id *)(v101 + 24), sel_setContents_, v122);
                        }
                        if (v99[17])
                        {
                          v102 = sub_24A292D60();
                          v103 = sub_24A292F64();
                          if (os_log_type_enabled(v102, v103))
                          {
                            v104 = (uint8_t *)swift_slowAlloc();
                            *(_WORD *)v104 = 0;
                            _os_log_impl(&dword_24A26B000, v102, v103, "discarding snapshot resources", v104, 2u);
                            v105 = v104;
                            v99 = v125;
                            MEMORY[0x24BD0C57C](v105, -1, -1);
                          }

                        }
                        v99[17] = 0;
                        swift_unknownObjectRelease();
                        v106 = (void *)v99[14];
                        objc_msgSend(v106, sel_setContents_, 0);
                        objc_msgSend(v106, sel_setHidden_, 1);
                        v107 = (id)v99[15];
                        objc_msgSend(v107, sel_setContents_, 0);
                        v108 = objc_msgSend(v107, sel_mask);
                        objc_msgSend(v108, sel_setContents_, 0);

                        objc_msgSend(v107, sel_setHidden_, 1);
                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();

                        sub_24A28E010(v60, v119);
                        swift_unknownObjectRelease();

                      }
                      goto LABEL_63;
                    }
                    sub_24A28E010(v60, v83);
                    objc_msgSend(v93, sel_commit);
                    sub_24A27AA14();
                    swift_allocError();
                    *v94 = 2;
                    swift_willThrow();
                    swift_unknownObjectRelease();
                    swift_unknownObjectRelease();

                    sub_24A28E010(v60, v83);
                    goto LABEL_62;
                  }
                  if ((v150 & 1) == 0)
                  {
                    v61 = v48;
                    v60 = *(void **)(v57 + 24);
                    v84 = v60;
                    goto LABEL_54;
                  }
                  v58 = (void *)v6[15];
                  if (v58)
                  {
                    swift_retain();
                    v59 = objc_msgSend(v58, sel_mask);
                    if (v59)
                    {
                      v60 = v59;
                      v61 = v48;
                      swift_release();
LABEL_54:
                      v122 = 0;
                      v83 = 1;
                      goto LABEL_60;
                    }
                  }
                  else
                  {
                    swift_retain();
                  }
                  v61 = v48;
                  v85 = sub_24A292D60();
                  v86 = sub_24A292F70();
                  if (os_log_type_enabled(v85, v86))
                  {
                    v87 = (uint8_t *)swift_slowAlloc();
                    *(_WORD *)v87 = 0;
                    _os_log_impl(&dword_24A26B000, v85, v86, "🚨 couldn’t find mask layer when creating snapshot! time occlusion may be wrong", v87, 2u);
                    MEMORY[0x24BD0C57C](v87, -1, -1);
                  }
                  swift_release();

                }
                else
                {
                  v61 = v48;
                }
                v122 = 0;
                v60 = 0;
                v83 = 255;
                goto LABEL_60;
              }
              goto LABEL_89;
            }
LABEL_88:
            __break(1u);
LABEL_89:
            __break(1u);
            return;
          }
LABEL_87:
          __break(1u);
          goto LABEL_88;
        }
LABEL_86:
        __break(1u);
        goto LABEL_87;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_86;
  }
  sub_24A28E30C((uint64_t)&v128, &qword_2579202F8);
  if (qword_25791F810 != -1)
    swift_once();
  __swift_project_value_buffer(v10, (uint64_t)qword_2579207F0);
  v49 = sub_24A292D60();
  v50 = sub_24A292F70();
  if (os_log_type_enabled(v49, v50))
  {
    v51 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v51 = 0;
    _os_log_impl(&dword_24A26B000, v49, v50, "got a rendering environment update before our renderer is set up", v51, 2u);
    MEMORY[0x24BD0C57C](v51, -1, -1);
  }

}

void sub_24A28C5B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;

  v3 = v2;
  v6 = v2 + 312;
  swift_beginAccess();
  v7 = *(_QWORD *)(*(_QWORD *)(v3 + 312) + 16);
  swift_beginAccess();
  sub_24A28CC38(a1, a2);
  swift_endAccess();
  swift_bridgeObjectRelease();
  if (v7)
  {
    if (!*(_QWORD *)(*(_QWORD *)v6 + 16))
    {
      *(_BYTE *)(*(_QWORD *)(v3 + 104)
               + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_wantsIndefiniteContinuousRendering) = 0;
      sub_24A28F28C();
    }
  }
}

id *WallpaperMetalCoordination.RenderingCoordinator.deinit()
{
  id *v0;
  _BYTE v2[136];

  sub_24A28E30C((uint64_t)(v0 + 4), &qword_2579202F8);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
  swift_unknownObjectRelease();
  sub_24A28C9B8((uint64_t)(v0 + 18), (uint64_t)v2, (uint64_t *)&unk_257920830);
  sub_24A28C9FC((uint64_t)v2, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))sub_24A27FF28, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))sub_24A28755C);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t WallpaperMetalCoordination.RenderingCoordinator.__deallocating_deinit()
{
  WallpaperMetalCoordination.RenderingCoordinator.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_24A28C744(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_24A28C764(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_24A28C7C8;
  return v6(a1);
}

uint64_t sub_24A28C7C8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

double sub_24A28C814(uint64_t a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 2;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_BYTE *)(a1 + 128) = 0;
  return result;
}

uint64_t type metadata accessor for WallpaperMetalCoordination.RenderingCoordinator()
{
  return objc_opt_self();
}

uint64_t sub_24A28C858()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_24A28C87C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24A28C8A0(void *a1)
{
  return sub_24A2895F0(a1);
}

uint64_t sub_24A28C8A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_24A28C8EC(uint64_t a1)
{
  unsigned int v1;
  BOOL v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = v1 >= 2;
  v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2)
    return (v3 + 1);
  else
    return 0;
}

void sub_24A28C908(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_24A292FF4();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
}

uint64_t sub_24A28C9B8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24A28C9FC(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t), uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))
{
  sub_24A28CA68(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_BYTE *)(a1 + 128), a2, a3);
  return a1;
}

uint64_t sub_24A28CA68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, void (*a18)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t), uint64_t (*a19)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))
{
  uint64_t result;

  if (a6 != 2)
  {
    a18(a7, a8, a9, a10, a11, HIDWORD(a11) & 1);
    return a19(a12, a13, a14, a15, a16, a17 & 1);
  }
  return result;
}

uint64_t type metadata accessor for WallpaperMetalCoordination.RenderingCoordinator.ContinuousRenderingToken()
{
  return objc_opt_self();
}

uint64_t sub_24A28CB14(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v3 = *v1;
  sub_24A2931C8();
  sub_24A2931D4();
  v4 = sub_24A2931E0();
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = v4 & ~v5;
  if (((*(_QWORD *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
    return 0;
  v7 = *(_QWORD *)(v3 + 48);
  if (*(_QWORD *)(v7 + 8 * v6) != a1)
  {
    v8 = ~v5;
    do
    {
      v6 = (v6 + 1) & v8;
      if (((*(_QWORD *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
        return 0;
    }
    while (*(_QWORD *)(v7 + 8 * v6) != a1);
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v10 = *v1;
  v13 = *v1;
  *v1 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_24A28CDC4();
    v10 = v13;
  }
  v11 = *(_QWORD *)(*(_QWORD *)(v10 + 48) + 8 * v6);
  sub_24A28D690(v6);
  *v1 = v13;
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_24A28CC38(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v19;

  v5 = *v2;
  sub_24A2931C8();
  swift_bridgeObjectRetain();
  sub_24A292E50();
  v6 = sub_24A2931E0();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  v9 = *(_QWORD *)(v5 + 48);
  v10 = (_QWORD *)(v9 + 16 * v8);
  v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_24A29315C() & 1) == 0)
  {
    v15 = ~v7;
    do
    {
      v8 = (v8 + 1) & v15;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_18;
      v16 = (_QWORD *)(v9 + 16 * v8);
      v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_24A29315C() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v13 = *v2;
  v19 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_24A28CF58();
    v13 = v19;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(v13 + 48) + 16 * v8);
  sub_24A28D838(v8);
  *v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

void *sub_24A28CDC4()
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
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2579206B0);
  v2 = *v0;
  v3 = sub_24A293030();
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
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
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
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
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
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_24A28CF58()
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
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257920B00);
  v2 = *v0;
  v3 = sub_24A293030();
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
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24A28D108()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257920B00);
  v3 = sub_24A29303C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_24A2931C8();
    swift_bridgeObjectRetain();
    sub_24A292E50();
    result = sub_24A2931E0();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24A28D3B4()
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
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257920B00);
  v3 = sub_24A29303C();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_24A2931C8();
      sub_24A292E50();
      result = sub_24A2931E0();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

unint64_t sub_24A28D690(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_24A293024();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_24A2931C8();
        sub_24A2931D4();
        v10 = sub_24A2931E0() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v10 < v9)
            goto LABEL_5;
        }
        else if (v10 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(v3 + 48);
          v12 = (_QWORD *)(v11 + 8 * v2);
          v13 = (_QWORD *)(v11 + 8 * v6);
          if (v2 != v6 || (v2 = v6, v12 >= v13 + 1))
          {
            *v12 = *v13;
            v2 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v14 = *(_QWORD *)(v3 + 16);
  v15 = __OFSUB__(v14, 1);
  v16 = v14 - 1;
  if (v15)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v16;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

unint64_t sub_24A28D838(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_24A293024();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_24A2931C8();
        swift_bridgeObjectRetain();
        sub_24A292E50();
        v10 = sub_24A2931E0();
        swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9)
            goto LABEL_5;
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(v3 + 48);
          v13 = (_OWORD *)(v12 + 16 * v2);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (v2 = v6, v13 >= v14 + 1))
          {
            *v13 = *v14;
            v2 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v15 = *(_QWORD *)(v3 + 16);
  v16 = __OFSUB__(v15, 1);
  v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_24A28D9FC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_24A2931C8();
  swift_bridgeObjectRetain();
  sub_24A292E50();
  v8 = sub_24A2931E0();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_24A29315C() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_24A29315C() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_24A28DBA8(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_24A28DBA8(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_24A28D3B4();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_24A28CF58();
      goto LABEL_22;
    }
    sub_24A28D108();
  }
  v11 = *v4;
  sub_24A2931C8();
  sub_24A292E50();
  result = sub_24A2931E0();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_24A29315C(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_24A293174();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_24A29315C();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

uint64_t sub_24A28DD40(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v13;

  v4 = v3;
  swift_weakInit();
  if (qword_25791F810 != -1)
    swift_once();
  v7 = sub_24A292D78();
  __swift_project_value_buffer(v7, (uint64_t)qword_2579207F0);
  swift_bridgeObjectRetain_n();
  v8 = sub_24A292D60();
  v9 = sub_24A292F64();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v13 = v11;
    *(_DWORD *)v10 = 136446210;
    swift_bridgeObjectRetain();
    sub_24A26FA2C(a2, a3, &v13);
    sub_24A292FF4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24A26B000, v8, v9, "ContinuousRenderingToken “%{public}s“ init", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD0C57C](v11, -1, -1);
    MEMORY[0x24BD0C57C](v10, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(_QWORD *)(v4 + 32) = a2;
  *(_QWORD *)(v4 + 40) = a3;
  swift_weakAssign();
  *(_BYTE *)(v4 + 24) = 0;
  return v4;
}

uint64_t sub_24A28DF1C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + 32;
  swift_beginAccess();
  return sub_24A27F738(v3, a2);
}

uint64_t method lookup function for WallpaperMetalCoordination.RenderingCoordinator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WallpaperMetalCoordination.RenderingCoordinator.renderer.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of WallpaperMetalCoordination.RenderingCoordinator.__allocating_init(identifier:rendering:environment:lookIdentifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 392))();
}

uint64_t dispatch thunk of WallpaperMetalCoordination.RenderingCoordinator.attachToViews(background:floating:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t dispatch thunk of WallpaperMetalCoordination.RenderingCoordinator.handleRenderingEnvironmentUpdate(_:animationSettings:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 408))();
}

uint64_t dispatch thunk of WallpaperMetalCoordination.RenderingCoordinator.startContinuousRendering(reason:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 416))();
}

uint64_t method lookup function for WallpaperMetalCoordination.RenderingCoordinator.ContinuousRenderingToken()
{
  return swift_lookUpClassMethod();
}

id sub_24A28DFEC(id result, unsigned __int8 a2)
{
  if (a2 != 255)
    return sub_24A28E004(result, a2 & 1);
  return result;
}

id sub_24A28E004(id a1, char a2)
{
  if ((a2 & 1) != 0)
    return a1;
  else
    return (id)swift_unknownObjectRetain();
}

void sub_24A28E010(void *a1, unsigned __int8 a2)
{
  if (a2 != 255)
    sub_24A28E028(a1, a2 & 1);
}

void sub_24A28E028(id a1, char a2)
{
  if ((a2 & 1) != 0)

  else
    swift_unknownObjectRelease();
}

void *sub_24A28E034(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t inited;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  const __CFDictionary *v18;
  IOSurfaceRef v19;
  void *v20;
  __IOSurface *v21;
  id v22;
  id v23;
  _BYTE *v24;
  _BYTE *v25;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257920B20);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24A294430;
  v9 = (void *)*MEMORY[0x24BDD8FD0];
  v10 = MEMORY[0x24BEE1768];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDD8FD0];
  *(_QWORD *)(inited + 40) = a1;
  v11 = (void *)*MEMORY[0x24BDD8EB0];
  *(_QWORD *)(inited + 64) = v10;
  *(_QWORD *)(inited + 72) = v11;
  *(_QWORD *)(inited + 80) = a2;
  v12 = (void *)*MEMORY[0x24BDD8E30];
  *(_QWORD *)(inited + 104) = v10;
  *(_QWORD *)(inited + 112) = v12;
  *(_QWORD *)(inited + 120) = 4;
  v13 = (void *)*MEMORY[0x24BDD8EF8];
  *(_QWORD *)(inited + 144) = v10;
  *(_QWORD *)(inited + 152) = v13;
  *(_QWORD *)(inited + 184) = MEMORY[0x24BEE44F0];
  *(_DWORD *)(inited + 160) = 1111970369;
  v14 = v9;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  sub_24A27CFD0(inited);
  type metadata accessor for CFString(0);
  sub_24A28E2C4();
  v18 = (const __CFDictionary *)sub_24A292DB4();
  swift_bridgeObjectRelease();
  v19 = IOSurfaceCreate(v18);

  if (v19)
  {
    v20 = (void *)objc_opt_self();
    v21 = v19;
    v22 = objc_msgSend(v20, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, a4, a1, a2, 0);
    objc_msgSend(v22, sel_setUsage_, 4);
    v23 = objc_msgSend(a3, sel_newTextureWithDescriptor_iosurface_plane_, v22, v21, 0);
    if (v23)
    {
      a3 = v23;
    }
    else
    {
      sub_24A27AA14();
      swift_allocError();
      *v25 = 3;
      swift_willThrow();
    }

  }
  else
  {
    sub_24A27AA14();
    swift_allocError();
    *v24 = 3;
    swift_willThrow();
  }
  return a3;
}

unint64_t sub_24A28E280()
{
  unint64_t result;

  result = qword_257920B18;
  if (!qword_257920B18)
  {
    result = MEMORY[0x24BD0C4D4](MEMORY[0x24BEE5108], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_257920B18);
  }
  return result;
}

unint64_t sub_24A28E2C4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25791F898;
  if (!qword_25791F898)
  {
    type metadata accessor for CFString(255);
    result = MEMORY[0x24BD0C4D4](&unk_24A293D78, v1);
    atomic_store(result, (unint64_t *)&qword_25791F898);
  }
  return result;
}

uint64_t sub_24A28E30C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24A28E348()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24A28E36C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_24A288C94;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_257920B30 + dword_257920B30))(a1, v4);
}

char *sub_24A28E3DC(uint64_t a1, uint64_t a2, CGColorSpace *a3)
{
  _BYTE *v3;
  _QWORD *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BYTE *v13;
  id v14;
  void *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  char *result;
  id v24;
  void *v25;
  id v26;
  id v27;
  CGColorSpaceRef v28;
  CGColorSpace *v29;
  objc_super v30;

  v7 = &v3[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_drawingHandler];
  *v7 = 0;
  v7[1] = 0;
  v3[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_shouldDrawAutomatically] = 1;
  v8 = &v3[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_log];
  v9 = sub_24A292D78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v3[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_wantsIndefiniteContinuousRendering] = 0;
  v10 = OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_displayLink;
  type metadata accessor for DisplayLink();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v11 + 32) = 0;
  v12 = (void *)objc_opt_self();
  v13 = v3;
  v14 = objc_msgSend(v12, sel_displayLinkWithTarget_selector_, v11, sel__displayLinkFired);
  v15 = *(void **)(v11 + 32);
  *(_QWORD *)(v11 + 32) = v14;

  *(_QWORD *)&v3[v10] = v11;
  v13[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_linkActive] = 0;
  v16 = &v13[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_timedRenderingInfo];
  v17 = type metadata accessor for WallpaperMetalView.TimedContinuousRenderingInfo(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 1, 1, v17);

  v30.receiver = v13;
  v30.super_class = (Class)type metadata accessor for WallpaperMetalView(0);
  v18 = (char *)objc_msgSendSuper2(&v30, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v19 = objc_msgSend(v18, sel_layer);
  objc_opt_self();
  v20 = (void *)swift_dynamicCastObjCClassUnconditional();
  v21 = OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_displayLink;
  v22 = *(_QWORD *)&v18[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_displayLink];
  swift_beginAccess();
  *(_QWORD *)(v22 + 24) = &off_251BB16D0;
  swift_unknownObjectWeakAssign();
  swift_retain();
  sub_24A292F88();
  result = *(char **)(v22 + 32);
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }
  objc_msgSend(result, sel_setPreferredFrameRateRange_);
  swift_release();
  result = *(char **)(*(_QWORD *)&v18[v21] + 32);
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  objc_msgSend(result, sel_setPaused_, 1);
  objc_msgSend(v20, sel_setDevice_, a1);
  objc_msgSend(v20, sel_setPixelFormat_, a2);
  v24 = objc_msgSend(v18, sel_layer);
  if (qword_25791F7D0 != -1)
    swift_once();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257920840);
  v25 = (void *)sub_24A292DB4();
  objc_msgSend(v24, sel_setActions_, v25);

  v26 = objc_msgSend(v18, sel_layer);
  objc_msgSend(v26, sel_setPosition_, 0.0, 0.0);

  v27 = objc_msgSend(v18, sel_layer);
  objc_msgSend(v27, sel_setAnchorPoint_, 0.0, 0.0);

  if (a3)
    v28 = a3;
  else
    v28 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF228]);
  v29 = a3;
  objc_msgSend(v20, sel_setColorspace_, v28);

  objc_msgSend(v20, sel_setAllowsDisplayCompositing_, 0);
  objc_msgSend(v20, sel_setDelegate_, v18);
  objc_msgSend(v20, sel_setPresentsWithTransaction_, 1);

  swift_unknownObjectRelease();
  return v18;
}

id sub_24A28E828()
{
  char *v0;
  id result;
  objc_super v2;

  result = *(id *)(*(_QWORD *)&v0[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_displayLink] + 32);
  if (result)
  {
    objc_msgSend(result, sel_invalidate);
    v2.receiver = v0;
    v2.super_class = (Class)type metadata accessor for WallpaperMetalView(0);
    return objc_msgSendSuper2(&v2, sel_dealloc);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24A28E95C(double a1)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id *v17;
  uint64_t v18;
  id *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(id *, uint64_t, uint64_t);
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  char *v56;
  id v57;
  char *v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(char *, uint64_t);
  NSObject *v64;
  os_log_type_t v65;
  uint8_t *v66;
  uint8_t *v67;
  uint64_t (*v68)(char *, uint64_t);
  char *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  void (*v77)(char *, uint64_t);
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  double v82;
  _QWORD aBlock[6];

  v2 = v1;
  v78 = sub_24A292D78();
  v80 = *(_QWORD *)(v78 - 8);
  v4 = MEMORY[0x24BDAC7A8](v78);
  v71 = (char *)&v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v70 = (char *)&v69 - v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257920CA0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v75 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v69 - v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257920CB0);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v74 = (char *)&v69 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (id *)((char *)&v69 - v16);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (id *)((char *)&v69 - v18);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_257920CB8);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v69 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_24A292CDC();
  v24 = *(_QWORD *)(v23 - 8);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v69 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BDAC7A8](v25);
  v30 = (char *)&v69 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&v69 - v31;
  sub_24A292CD0();
  v79 = v32;
  sub_24A292CAC();
  v77 = *(void (**)(char *, uint64_t))(v24 + 8);
  v77(v30, v23);
  v81 = v2;
  v33 = v2 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_timedRenderingInfo;
  swift_beginAccess();
  v73 = v33;
  sub_24A27ED2C(v33, (uint64_t)v19, &qword_257920CB0);
  v34 = type metadata accessor for WallpaperMetalView.TimedContinuousRenderingInfo(0);
  v76 = *(_QWORD *)(v34 - 8);
  v35 = *(uint64_t (**)(id *, uint64_t, uint64_t))(v76 + 48);
  if (v35(v19, 1, v34))
  {
    sub_24A28E30C((uint64_t)v19, &qword_257920CB0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56))(v22, 1, 1, v23);
LABEL_4:
    sub_24A28E30C((uint64_t)v22, &qword_257920CB8);
    v37 = v78;
LABEL_5:
    v38 = (uint64_t)v75;
    v39 = v73;
    sub_24A27ED2C(v73, (uint64_t)v17, &qword_257920CB0);
    v40 = v35(v17, 1, v34);
    v72 = v23;
    v41 = v37;
    if (v40)
    {
      sub_24A28E30C((uint64_t)v17, &qword_257920CB0);
    }
    else
    {
      v42 = *v17;
      sub_24A28E30C((uint64_t)v17, &qword_257920CB0);
      objc_msgSend(v42, sel_invalidate);

    }
    v43 = v80;
    v44 = (void *)objc_opt_self();
    v45 = swift_allocObject();
    v46 = v81;
    swift_unknownObjectWeakInit();
    aBlock[4] = sub_24A29039C;
    aBlock[5] = v45;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24A288088;
    aBlock[3] = &block_descriptor_2;
    v47 = _Block_copy(aBlock);
    swift_release();
    v48 = objc_msgSend(v44, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v47, a1);
    _Block_release(v47);
    v49 = v46 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_log;
    swift_beginAccess();
    sub_24A27ED2C(v49, v38, &qword_257920CA0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48))(v38, 1, v41))
    {
      sub_24A28E30C(v38, &qword_257920CA0);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v71, v38, v41);
      sub_24A28E30C(v38, &qword_257920CA0);
      v50 = sub_24A292D60();
      v51 = sub_24A292F7C();
      if (os_log_type_enabled(v50, v51))
      {
        v52 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v52 = 134349056;
        v82 = a1;
        sub_24A292FF4();
        _os_log_impl(&dword_24A26B000, v50, v51, "beginning timed continuous rendering for %{public}f seconds", v52, 0xCu);
        v41 = v78;
        MEMORY[0x24BD0C57C](v52, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v80 + 8))(v71, v41);
    }
    v53 = v76;
    v54 = v72;
    v55 = v74;
    v56 = v79;
    (*(void (**)(char *, char *, uint64_t))(v24 + 16))(&v74[*(int *)(v34 + 20)], v79, v72);
    *v55 = v48;
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v53 + 56))(v55, 0, 1, v34);
    swift_beginAccess();
    v57 = v48;
    sub_24A2903BC((uint64_t)v55, v39);
    swift_endAccess();
    sub_24A28F28C();
    sub_24A28E30C((uint64_t)v55, &qword_257920CB0);

    return ((uint64_t (*)(char *, uint64_t))v77)(v56, v54);
  }
  v69 = v27;
  v36 = v70;
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v22, (char *)v19 + *(int *)(v34 + 20), v23);
  sub_24A28E30C((uint64_t)v19, &qword_257920CB0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v22, 0, 1, v23);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23) == 1)
    goto LABEL_4;
  v59 = v69;
  (*(void (**)(void))(v24 + 32))();
  v60 = sub_24A292CB8();
  v37 = v78;
  if ((v60 & 1) == 0)
  {
    v77(v59, v23);
    goto LABEL_5;
  }
  v61 = v81 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_log;
  swift_beginAccess();
  sub_24A27ED2C(v61, (uint64_t)v11, &qword_257920CA0);
  v62 = v80;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v80 + 48))(v11, 1, v37))
  {
    v63 = v77;
    v77(v69, v23);
    v63(v79, v23);
    return sub_24A28E30C((uint64_t)v11, &qword_257920CA0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v36, v11, v37);
    sub_24A28E30C((uint64_t)v11, &qword_257920CA0);
    v64 = sub_24A292D60();
    v65 = sub_24A292F7C();
    if (os_log_type_enabled(v64, v65))
    {
      v66 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v66 = 0;
      _os_log_impl(&dword_24A26B000, v64, v65, "display link already running and will stop later than requested: not updating timer", v66, 2u);
      v67 = v66;
      v62 = v80;
      MEMORY[0x24BD0C57C](v67, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v62 + 8))(v36, v37);
    v68 = (uint64_t (*)(char *, uint64_t))v77;
    v77(v69, v23);
    return v68(v79, v23);
  }
}

void sub_24A28F190(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[24];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257920CB0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  v6 = MEMORY[0x24BD0C63C](a2 + 16);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = type metadata accessor for WallpaperMetalView.TimedContinuousRenderingInfo(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
    v9 = (uint64_t)v7 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_timedRenderingInfo;
    swift_beginAccess();
    sub_24A2903BC((uint64_t)v5, v9);
    swift_endAccess();
    sub_24A28F28C();
    sub_24A28E30C((uint64_t)v5, &qword_257920CB0);

  }
}

void sub_24A28F28C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  char *v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  char *v40;

  v1 = v0;
  v2 = sub_24A292D78();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v39 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257920CA0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v39 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_257920CB0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_BYTE *)(v1
                + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_wantsIndefiniteContinuousRendering) == 1)
  {
    v18 = (_BYTE *)(v1 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_linkActive);
    if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_linkActive) & 1) != 0)
      return;
    goto LABEL_6;
  }
  v40 = v6;
  v19 = v1 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_timedRenderingInfo;
  swift_beginAccess();
  sub_24A27ED2C(v19, (uint64_t)v17, &qword_257920CB0);
  v20 = type metadata accessor for WallpaperMetalView.TimedContinuousRenderingInfo(0);
  v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 48))(v17, 1, v20);
  sub_24A28E30C((uint64_t)v17, &qword_257920CB0);
  v18 = (_BYTE *)(v1 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_linkActive);
  if ((v21 != 1) != *(_BYTE *)(v1 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_linkActive))
  {
    if (v21 != 1)
    {
LABEL_6:
      v22 = v1 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_log;
      swift_beginAccess();
      sub_24A27ED2C(v22, (uint64_t)v14, &qword_257920CA0);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v14, 1, v2))
      {
        sub_24A28E30C((uint64_t)v14, &qword_257920CA0);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v8, v14, v2);
        sub_24A28E30C((uint64_t)v14, &qword_257920CA0);
        v23 = sub_24A292D60();
        v24 = sub_24A292F7C();
        if (os_log_type_enabled(v23, v24))
        {
          v25 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v25 = 0;
          _os_log_impl(&dword_24A26B000, v23, v24, "🟢 starting display link", v25, 2u);
          MEMORY[0x24BD0C57C](v25, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      }
      v26 = *(_QWORD *)(v1 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_displayLink);
      v27 = *(void **)(v26 + 32);
      if (v27)
      {
        objc_msgSend(v27, sel_setPaused_, 0);
        v28 = objc_msgSend((id)objc_opt_self(), sel_mainRunLoop);
        v29 = *(void **)(v26 + 32);
        if (v29)
        {
          objc_msgSend(v29, sel_addToRunLoop_forMode_, v28, *MEMORY[0x24BDBCB80]);

          *v18 = 1;
          return;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      goto LABEL_25;
    }
    v30 = *(_QWORD *)(v1 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_displayLink);
    v31 = objc_msgSend((id)objc_opt_self(), sel_mainRunLoop);
    v32 = *(void **)(v30 + 32);
    if (!v32)
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    objc_msgSend(v32, sel_removeFromRunLoop_forMode_, v31, *MEMORY[0x24BDBCB80]);

    v33 = *(void **)(v30 + 32);
    v34 = v40;
    if (!v33)
    {
LABEL_26:
      __break(1u);
      return;
    }
    objc_msgSend(v33, sel_setPaused_, 1);
    v35 = v1 + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_log;
    swift_beginAccess();
    sub_24A27ED2C(v35, (uint64_t)v12, &qword_257920CA0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v12, 1, v2))
    {
      sub_24A28E30C((uint64_t)v12, &qword_257920CA0);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v34, v12, v2);
      sub_24A28E30C((uint64_t)v12, &qword_257920CA0);
      v36 = sub_24A292D60();
      v37 = sub_24A292F7C();
      if (os_log_type_enabled(v36, v37))
      {
        v38 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v38 = 0;
        _os_log_impl(&dword_24A26B000, v36, v37, "🛑 stopped display link", v38, 2u);
        MEMORY[0x24BD0C57C](v38, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v34, v2);
    }
    *v18 = 0;
  }
}

uint64_t sub_24A28F790()
{
  return type metadata accessor for WallpaperMetalView(0);
}

uint64_t type metadata accessor for WallpaperMetalView(uint64_t a1)
{
  return sub_24A28F950(a1, (uint64_t *)&unk_257920B90);
}

void sub_24A28F828()
{
  unint64_t v0;
  unint64_t v1;

  sub_24A28F8F0(319, &qword_257920BA0, (void (*)(uint64_t))MEMORY[0x24BEE78D8]);
  if (v0 <= 0x3F)
  {
    sub_24A28F8F0(319, &qword_257920BA8, (void (*)(uint64_t))type metadata accessor for WallpaperMetalView.TimedContinuousRenderingInfo);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

void sub_24A28F8F0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_24A292FE8();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t type metadata accessor for WallpaperMetalView.TimedContinuousRenderingInfo(uint64_t a1)
{
  return sub_24A28F950(a1, qword_257920C68);
}

uint64_t sub_24A28F950(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void **sub_24A28F984(void **a1, void **a2, uint64_t a3)
{
  int v3;
  char *v4;
  void **v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  char *v11;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_24A292CDC();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    v11 = v4;
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_24A28FA18(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;

  v4 = (char *)a1 + *(int *)(a2 + 20);
  v5 = sub_24A292CDC();
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

void **sub_24A28FA60(void **a1, void **a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);
  id v10;

  v4 = *a2;
  *a1 = *a2;
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_24A292CDC();
  v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  v10 = v4;
  v9(v6, v7, v8);
  return a1;
}

void **sub_24A28FACC(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = v6;

  v9 = *(int *)(a3 + 20);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_24A292CDC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

_QWORD *sub_24A28FB3C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_24A292CDC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void **sub_24A28FB98(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v6 = *a1;
  *a1 = *a2;

  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_24A292CDC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_24A28FC04()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24A28FC10(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_24A292CDC();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_24A28FC8C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_24A28FC98(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_24A292CDC();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_24A28FD0C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24A292CDC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_24A28FD88()
{
  char *v0;
  void (*v1)(id);
  void *v2;
  id v3;
  id v4;

  v1 = *(void (**)(id))&v0[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_drawingHandler];
  if (v1)
  {
    swift_retain();
    v4 = objc_msgSend(v0, sel_layer);
    objc_opt_self();
    v2 = (void *)swift_dynamicCastObjCClass();
    if (v2)
    {
      v3 = objc_msgSend(v2, sel_nextDrawable);

      if (v3)
      {
        v1(v3);
        swift_unknownObjectRelease();
      }
      sub_24A2873D8((uint64_t)v1);
    }
    else
    {
      sub_24A2873D8((uint64_t)v1);

    }
  }
}

void sub_24A28FE80()
{
  _BYTE *v0;
  _QWORD *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  char *v8;
  uint64_t v9;

  v1 = &v0[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_drawingHandler];
  *v1 = 0;
  v1[1] = 0;
  v0[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_shouldDrawAutomatically] = 1;
  v2 = &v0[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_log];
  v3 = sub_24A292D78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  v0[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_wantsIndefiniteContinuousRendering] = 0;
  v4 = OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_displayLink;
  type metadata accessor for DisplayLink();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v5 + 32) = 0;
  v6 = objc_msgSend((id)objc_opt_self(), sel_displayLinkWithTarget_selector_, v5, sel__displayLinkFired);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  *(_QWORD *)&v0[v4] = v5;
  v0[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_linkActive] = 0;
  v8 = &v0[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_timedRenderingInfo];
  v9 = type metadata accessor for WallpaperMetalView.TimedContinuousRenderingInfo(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);

  sub_24A2930D8();
  __break(1u);
}

void sub_24A28FFE0()
{
  _BYTE *v0;
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  void (*v11)(id);
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  unsigned int v19;
  void *v20;
  uint64_t v21;
  id v22;
  unsigned int v23;

  v1 = v0;
  v2 = sub_24A292D78();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257920CA0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_shouldDrawAutomatically;
  if (v1[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_shouldDrawAutomatically] != 1)
    goto LABEL_9;
  v10 = *(void **)(*(_QWORD *)&v1[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_displayLink] + 32);
  if (!v10)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (!objc_msgSend(v10, sel_isPaused))
  {
LABEL_9:
    v14 = (uint64_t)&v1[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_log];
    swift_beginAccess();
    sub_24A27ED2C(v14, (uint64_t)v8, &qword_257920CA0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2))
    {
      sub_24A28E30C((uint64_t)v8, &qword_257920CA0);
      return;
    }
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v8, v2);
    sub_24A28E30C((uint64_t)v8, &qword_257920CA0);
    v15 = v1;
    v16 = sub_24A292D60();
    v17 = sub_24A292F64();
    if (!os_log_type_enabled(v16, v17))
    {

      v16 = v15;
      goto LABEL_15;
    }
    v18 = swift_slowAlloc();
    v19 = v1[v9];
    *(_DWORD *)v18 = 67109376;
    v23 = v19;
    sub_24A292FF4();
    *(_WORD *)(v18 + 8) = 1024;
    v20 = (void *)(*(_QWORD **)((char *)&v15->isa
                              + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_displayLink))[4];
    if (v20)
    {
      v23 = objc_msgSend(v20, sel_isPaused);
      sub_24A292FF4();

      _os_log_impl(&dword_24A26B000, v16, v17, "skipping needs-display render: should auto-draw %{BOOL}d, link paused %{BOOL}d", (uint8_t *)v18, 0xEu);
      MEMORY[0x24BD0C57C](v18, -1, -1);
LABEL_15:

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      return;
    }
LABEL_19:
    __break(1u);
    return;
  }
  v11 = *(void (**)(id))&v1[OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_drawingHandler];
  if (v11)
  {
    swift_retain();
    v22 = objc_msgSend(v1, sel_layer);
    objc_opt_self();
    v12 = (void *)swift_dynamicCastObjCClass();
    if (v12)
    {
      v13 = objc_msgSend(v12, sel_nextDrawable);

      if (v13)
      {
        v11(v13);
        swift_unknownObjectRelease();
      }
      sub_24A2873D8((uint64_t)v11);
    }
    else
    {
      sub_24A2873D8((uint64_t)v11);

    }
  }
}

unint64_t sub_24A29033C()
{
  unint64_t result;

  result = qword_257920CA8;
  if (!qword_257920CA8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257920CA8);
  }
  return result;
}

uint64_t sub_24A290378()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_24A29039C(uint64_t a1)
{
  uint64_t v1;

  sub_24A28F190(a1, v1);
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

uint64_t sub_24A2903BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257920CB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

unint64_t UIViewAnimationCurve.description.getter(uint64_t a1)
{
  unint64_t result;

  result = 0xD00000000000001DLL;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
    case 3:
      result = 0xD00000000000001ALL;
      break;
    case 2:
      result = 0xD00000000000001BLL;
      break;
    default:
      result = 0x6E776F6E6B6E55;
      break;
  }
  return result;
}

unint64_t sub_24A29049C()
{
  uint64_t *v0;

  return UIViewAnimationCurve.description.getter(*v0);
}

uint64_t sub_24A2904A4()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_24A292CDC();
  __swift_allocate_value_buffer(v0, qword_257920CC0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_257920CC0);
  return sub_24A2904EC(v1);
}

uint64_t sub_24A2904EC@<X0>(uint64_t a1@<X8>)
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257920CB8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257920CD8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257920CE0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_24A292C04();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_24A292CE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v10, 1, 1, v15);
  v16 = sub_24A292D24();
  v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v17(v7, 1, 1, v16);
  sub_24A292BEC();
  sub_24A292BC8();
  sub_24A292BD4();
  sub_24A292BA4();
  sub_24A292BBC();
  sub_24A292BE0();
  sub_24A292D18();
  v17(v7, 0, 1, v16);
  sub_24A292BF8();
  sub_24A292BB0();
  v18 = sub_24A292CDC();
  v19 = *(_QWORD *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v4, 1, v18) == 1)
  {
    sub_24A292CC4();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    return sub_24A290980((uint64_t)v4);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v19 + 32))(a1, v4, v18);
  }
}

uint64_t static Date.idealizedDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_25791F818 != -1)
    swift_once();
  v2 = sub_24A292CDC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_257920CC0);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static Date.idealizedDate.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_25791F818 != -1)
    swift_once();
  v2 = sub_24A292CDC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_257920CC0);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static Date.idealizedDate.modify())()
{
  uint64_t v0;

  if (qword_25791F818 != -1)
    swift_once();
  v0 = sub_24A292CDC();
  __swift_project_value_buffer(v0, (uint64_t)qword_257920CC0);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_24A290980(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257920CB8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

BOOL static Keyframe.Name.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t Keyframe.Name.hash(into:)()
{
  return sub_24A2931D4();
}

uint64_t Keyframe.Name.hashValue.getter()
{
  sub_24A2931C8();
  sub_24A2931D4();
  return sub_24A2931E0();
}

double Keyframe.Progress.wakeProgress.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

double Keyframe.Progress.unlockProgress.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

void Keyframe.Progress.init(wakeProgress:unlockProgress:)(double *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  *a1 = a2;
  a1[1] = a3;
}

unint64_t Keyframe.Progress.description.getter()
{
  sub_24A293054();
  swift_bridgeObjectRelease();
  sub_24A292F40();
  sub_24A292E74();
  swift_bridgeObjectRelease();
  sub_24A292E74();
  sub_24A292F40();
  sub_24A292E74();
  swift_bridgeObjectRelease();
  sub_24A292E74();
  return 0xD000000000000018;
}

unint64_t sub_24A290B30()
{
  unint64_t result;

  result = qword_257920CE8;
  if (!qword_257920CE8)
  {
    result = MEMORY[0x24BD0C4D4](&protocol conformance descriptor for Keyframe.Name, &type metadata for Keyframe.Name);
    atomic_store(result, (unint64_t *)&qword_257920CE8);
  }
  return result;
}

uint64_t sub_24A290B78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

ValueMetadata *type metadata accessor for Keyframe()
{
  return &type metadata for Keyframe;
}

uint64_t storeEnumTagSinglePayload for Keyframe.Name(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A290BDC + 4 * byte_24A295015[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_24A290C10 + 4 * byte_24A295010[v4]))();
}

uint64_t sub_24A290C10(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A290C18(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A290C20);
  return result;
}

uint64_t sub_24A290C2C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A290C34);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24A290C38(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A290C40(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Keyframe.Name()
{
  return &type metadata for Keyframe.Name;
}

ValueMetadata *type metadata accessor for Keyframe.Progress()
{
  return &type metadata for Keyframe.Progress;
}

uint64_t RotationFrame.fromOrientation.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t RotationFrame.toOrientation.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

double RotationFrame.fraction.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

uint64_t RotationFrame.clockwise.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _BOOL4 v5;
  unsigned int v7;

  v1 = *v0;
  v2 = v0[1];
  if (*v0 == 1 && v2 == 4)
    return 1;
  v5 = v1 == 3 && v2 == 1;
  v7 = v1 == 2 && v2 == 3 || v5;
  if (v1 == 4 && v2 == 2)
    return 1;
  else
    return v7;
}

uint64_t RotationFrame.init(from:to:fraction:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = a2;
  *(double *)(a3 + 16) = a4;
  return result;
}

uint64_t RotationFrame.init(orientation:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  a2[1] = result;
  a2[2] = 0x3FF0000000000000;
  return result;
}

uint64_t RotationFrame.description.getter()
{
  sub_24A293054();
  sub_24A292E74();
  sub_24A292E74();
  swift_bridgeObjectRelease();
  sub_24A292E74();
  sub_24A292E74();
  swift_bridgeObjectRelease();
  sub_24A292E74();
  sub_24A292F40();
  sub_24A292E74();
  swift_bridgeObjectRelease();
  sub_24A292E74();
  return 0;
}

uint64_t _s26WatchFacesWallpaperSupport13RotationFrameV2eeoiySbAC_ACtFZ_0(double *a1, uint64_t a2)
{
  uint64_t v2;
  double v3;
  double v4;
  uint64_t v5;
  double v6;
  double v10;

  v3 = *a1;
  v2 = *((_QWORD *)a1 + 1);
  v4 = a1[2];
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(double *)(a2 + 16);
  if (v4 == v6 && *(_QWORD *)&v3 == v5 && v2 == v5)
    return 1;
  if (*(_QWORD *)&v3 == v5)
  {
    if (v4 == 1.0 - v6)
      return 1;
  }
  else
  {
    v10 = 1.0 - v6;
    if (v2 == *(_QWORD *)a2 && v4 == v10)
      return 1;
  }
  return 0;
}

uint64_t getEnumTagSinglePayload for RotationFrame(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for RotationFrame(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
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
  *(_BYTE *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for RotationFrame()
{
  return &type metadata for RotationFrame;
}

uint64_t WallpaperMetalCoordination.WallpaperState.rotationLandscapeAmount.getter()
{
  uint64_t v0;
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  uint64_t result;
  _OWORD v6[5];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  char v10;

  v1 = *(_OWORD *)(v0 + 112);
  v8 = *(_OWORD *)(v0 + 96);
  v9 = v1;
  v10 = *(_BYTE *)(v0 + 128);
  v2 = *(_OWORD *)(v0 + 48);
  v6[2] = *(_OWORD *)(v0 + 32);
  v6[3] = v2;
  v3 = *(_OWORD *)(v0 + 80);
  v6[4] = *(_OWORD *)(v0 + 64);
  v7 = v3;
  v4 = *(_OWORD *)(v0 + 16);
  v6[0] = *(_OWORD *)v0;
  v6[1] = v4;
  if (v10 == 1)
  {
    if (*((_QWORD *)&v7 + 1) == 4)
    {
      if ((_QWORD)v8 == 3)
        return result;
LABEL_11:
      sub_24A2874D8((uint64_t)v6, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A2874A0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A2874CC);
      sub_24A291230();
      return sub_24A2874D8((uint64_t)v6, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A27FF28, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24A28755C);
    }
    if ((_QWORD)v8 == 4)
    {
      if (*((_QWORD *)&v7 + 1) != 3)
        goto LABEL_11;
    }
    else if (*((_QWORD *)&v7 + 1) == (_QWORD)v8 || (*((_QWORD *)&v7 + 1) == 3) != ((_QWORD)v8 == 3))
    {
      goto LABEL_11;
    }
  }
  return result;
}

double WallpaperMetalCoordination.WallpaperState.unlockState.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  double result;

  result = *(double *)(v1 + 8);
  *(_BYTE *)a1 = *(_BYTE *)v1;
  *(double *)(a1 + 8) = result;
  return result;
}

double WallpaperMetalCoordination.WallpaperState.unlockState.setter(uint64_t a1)
{
  uint64_t v1;
  double result;

  result = *(double *)(a1 + 8);
  *(_BYTE *)v1 = *(_BYTE *)a1;
  *(double *)(v1 + 8) = result;
  return result;
}

uint64_t (*WallpaperMetalCoordination.WallpaperState.unlockState.modify())()
{
  return nullsub_1;
}

__n128 WallpaperMetalCoordination.WallpaperState.wakeState.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __n128 result;

  *(_BYTE *)a1 = *(_BYTE *)(v1 + 16);
  result = *(__n128 *)(v1 + 24);
  *(__n128 *)(a1 + 8) = result;
  return result;
}

__n128 WallpaperMetalCoordination.WallpaperState.wakeState.setter(uint64_t a1)
{
  uint64_t v1;
  __n128 result;

  *(_BYTE *)(v1 + 16) = *(_BYTE *)a1;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v1 + 24) = result;
  return result;
}

uint64_t (*WallpaperMetalCoordination.WallpaperState.wakeState.modify())()
{
  return nullsub_1;
}

uint64_t WallpaperMetalCoordination.WallpaperState.isDarkMode.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t WallpaperMetalCoordination.WallpaperState.isDarkMode.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 40) = result;
  return result;
}

uint64_t (*WallpaperMetalCoordination.WallpaperState.isDarkMode.modify())()
{
  return nullsub_1;
}

uint64_t WallpaperMetalCoordination.WallpaperState.isTransient.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 41);
}

uint64_t WallpaperMetalCoordination.WallpaperState.isTransient.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 41) = result;
  return result;
}

uint64_t (*WallpaperMetalCoordination.WallpaperState.isTransient.modify())()
{
  return nullsub_1;
}

float WallpaperMetalCoordination.WallpaperState.rotationRadians.getter()
{
  uint64_t v0;
  _OWORD v2[3];

  sub_24A2917A4((__int128 *)(v0 + 88), v2);
  return sub_24A291230();
}

float sub_24A291230()
{
  __int128 *v0;
  void *v1;
  float v2;
  float v3;
  double v4;
  double v5;
  void *v6;
  id v7;
  CFAbsoluteTime v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  __int128 v15;
  void *v16;
  __int128 v17;
  void *v18;
  double v19;
  double v20;
  char v21;

  sub_24A2917A4(v0, &v15);
  v1 = v16;
  sub_24A2917A4(v0, &v17);
  if ((v21 & 1) != 0)
  {
    v2 = 0.0;
    v3 = 0.0;
    if ((unint64_t)(v17 - 2) <= 2)
      v3 = flt_24A2952C4[(_QWORD)v17 - 2];
    v4 = v19;
    v5 = v20;
    if ((unint64_t)(*((_QWORD *)&v17 + 1) - 2) <= 2)
      v2 = flt_24A2952C4[*((_QWORD *)&v17 + 1) - 2];
    v6 = v18;
    v7 = v1;
    v8 = (CFAbsoluteTimeGetCurrent() - v4) / v5;
    *(float *)&v8 = v8;
    if (*(float *)&v8 >= 1.0)
    {
      sub_24A29273C((uint64_t)v0, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A28755C);
    }
    else
    {
      if (*(float *)&v8 > 1.0)
        *(float *)&v8 = 1.0;
      objc_msgSend(v6, sel__solveForInput_, v8);
      v10 = v9;
      sub_24A29273C((uint64_t)v0, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A28755C);
      v11 = fabsf(vabds_f32(v2, v3) + -3.1416);
      v12 = (float)(v2 - v3) + 6.2832;
      if ((float)(v2 - v3) >= -3.1416)
        v12 = v2 - v3;
      if ((float)(v2 - v3) <= 3.1416)
        v13 = v12;
      else
        v13 = (float)(v2 - v3) + -6.2832;
      if (v11 < 0.1)
        v13 = 3.1416;
      return v3 + (float)(v10 * v13);
    }
  }
  else
  {
    v2 = 0.0;
    if ((unint64_t)(v17 - 2) < 3)
      return flt_24A2952C4[(_QWORD)v17 - 2];
  }
  return v2;
}

uint64_t WallpaperMetalCoordination.WallpaperState.look.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v2 = *(_QWORD *)(v1 + 48);
  v3 = *(_QWORD *)(v1 + 56);
  v4 = *(_QWORD *)(v1 + 64);
  v5 = *(_QWORD *)(v1 + 72);
  v6 = *(unsigned int *)(v1 + 80);
  v7 = *(_BYTE *)(v1 + 84);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_DWORD *)(a1 + 32) = v6;
  *(_BYTE *)(a1 + 36) = v7;
  return sub_24A2874A0(v2, v3, v4, v5, v6, v7);
}

__n128 WallpaperMetalCoordination.WallpaperState.look.setter(__n128 *a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unsigned __int32 v4;
  unsigned __int8 v5;
  __n128 result;
  __n128 v7;

  v7 = *a1;
  v2 = a1[1].n128_u64[0];
  v3 = a1[1].n128_u64[1];
  v4 = a1[2].n128_u32[0];
  v5 = a1[2].n128_u8[4];
  sub_24A27FF28(*(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), *(unsigned int *)(v1 + 80), *(_BYTE *)(v1 + 84));
  result = v7;
  *(__n128 *)(v1 + 48) = v7;
  *(_QWORD *)(v1 + 64) = v2;
  *(_QWORD *)(v1 + 72) = v3;
  *(_DWORD *)(v1 + 80) = v4;
  *(_BYTE *)(v1 + 84) = v5;
  return result;
}

uint64_t (*WallpaperMetalCoordination.WallpaperState.look.modify())()
{
  return nullsub_1;
}

BOOL sub_24A291488(__int128 *a1, __int128 *a2)
{
  __int128 v4[3];
  __int128 v5[3];

  sub_24A2917A4(a1, v4);
  sub_24A2917A4(a2, v5);
  return sub_24A2917BC(v4, v5);
}

id sub_24A2914D0()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE5760]), sel_init);
  objc_msgSend(v0, sel_setMass_, 1.0);
  objc_msgSend(v0, sel_setStiffness_, 61.69);
  objc_msgSend(v0, sel_setDamping_, 15.71);
  result = objc_msgSend(v0, sel_setDuration_, 1.2);
  qword_257920CF0 = (uint64_t)v0;
  return result;
}

double WallpaperMetalCoordination.WallpaperState.init()@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_BYTE *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)(a1 + 24) = _Q0;
  *(_WORD *)(a1 + 40) = 0;
  *(_OWORD *)(a1 + 48) = xmmword_24A2951D0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  *(_DWORD *)(a1 + 80) = 0;
  *(_BYTE *)(a1 + 84) = 0;
  *(_QWORD *)(a1 + 88) = 1;
  result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_BYTE *)(a1 + 128) = 0;
  return result;
}

double WallpaperMetalCoordination.WallpaperState.init(unlockProgress:linearWakeProgress:isDarkMode:orientation:)@<D0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  double v10;
  float v11;
  char v12;
  char v13;
  double result;

  v10 = 0.0;
  if (a5 > 0.0)
  {
    v10 = 1.0;
    if (a5 < 0.9999)
    {
      if (qword_25791F820 != -1)
        swift_once();
      *(float *)&v10 = a5;
      objc_msgSend((id)qword_257920CF0, sel__solveForInput_, v10);
      v10 = v11;
    }
  }
  if (a4 >= 1.0)
    v12 = 1;
  else
    v12 = 2;
  if (a4 <= 0.0)
    v12 = 0;
  *(_BYTE *)a3 = v12;
  *(double *)(a3 + 8) = a4;
  v13 = 2 * (v10 < 1.0);
  if (v10 <= 0.0)
    v13 = 1;
  *(_BYTE *)(a3 + 16) = v13;
  *(double *)(a3 + 24) = a5;
  *(double *)(a3 + 32) = v10;
  *(_BYTE *)(a3 + 40) = a1 & 1;
  *(_BYTE *)(a3 + 41) = 0;
  *(_OWORD *)(a3 + 48) = xmmword_24A2951D0;
  *(_QWORD *)(a3 + 64) = 0;
  *(_QWORD *)(a3 + 72) = 0;
  *(_DWORD *)(a3 + 80) = 0;
  *(_BYTE *)(a3 + 84) = 0;
  *(_QWORD *)(a3 + 88) = a2;
  result = 0.0;
  *(_OWORD *)(a3 + 96) = 0u;
  *(_OWORD *)(a3 + 112) = 0u;
  *(_BYTE *)(a3 + 128) = 0;
  return result;
}

uint64_t WallpaperMetalCoordination.WallpaperState.description.getter()
{
  sub_24A293054();
  swift_bridgeObjectRelease();
  sub_24A292F40();
  sub_24A292E74();
  swift_bridgeObjectRelease();
  sub_24A292E74();
  sub_24A292F40();
  sub_24A292E74();
  swift_bridgeObjectRelease();
  return 0x2093949FF0;
}

_OWORD *sub_24A2917A4(__int128 *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_OWORD *)((char *)a2 + 25) = *(__int128 *)((char *)a1 + 25);
  *a2 = v2;
  a2[1] = v3;
  return a2;
}

BOOL sub_24A2917BC(__int128 *a1, __int128 *a2)
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v9;
  double v10;
  char v11;
  __int128 v13;
  double v14;
  double v15;
  char v16;
  __int128 v17;
  double v18;
  double v19;
  char v20;

  sub_24A2917A4(a1, &v17);
  v4 = v17;
  if ((v20 & 1) != 0)
  {
    v5 = *((_QWORD *)&v17 + 1);
    v7 = v18;
    v6 = v19;
    sub_24A2917A4(a2, &v13);
    if (v16 != 1)
      return 0;
    if (v4 != (_QWORD)v13 || v5 != *((_QWORD *)&v13 + 1))
      return 0;
    v10 = v14;
    v9 = v15;
    sub_24A292700();
    sub_24A29273C((uint64_t)a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A2874CC);
    sub_24A29273C((uint64_t)a2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A2874CC);
    v11 = sub_24A292FDC();
    sub_24A29273C((uint64_t)a2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A28755C);
    sub_24A29273C((uint64_t)a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A28755C);
    if (v6 == v9)
      return v11 & (v7 == v10);
    else
      return 0;
  }
  else
  {
    sub_24A2917A4(a2, &v13);
    if ((v16 & 1) != 0)
      return 0;
    return v4 == (_QWORD)v13;
  }
}

BOOL _s26WatchFacesWallpaperSupport0C17MetalCoordinationO0C5StateV4LookO2eeoiySbAG_AGtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  float v39;

  v2 = *(_QWORD *)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 24);
  v39 = *(float *)(a1 + 32);
  v6 = *(_BYTE *)(a1 + 36);
  v8 = *(_QWORD *)a2;
  v7 = *(_QWORD *)(a2 + 8);
  v10 = *(_QWORD *)(a2 + 16);
  v9 = *(_QWORD *)(a2 + 24);
  v11 = *(unsigned int *)(a2 + 32);
  v12 = *(_BYTE *)(a2 + 36);
  if ((v6 & 1) == 0)
  {
    if ((*(_BYTE *)(a2 + 36) & 1) == 0)
    {
      if (v2 == v8 && v3 == v7)
      {
        v27 = 1;
        v28 = *(_QWORD *)a1;
      }
      else
      {
        v29 = *(_QWORD *)(a2 + 8);
        v28 = *(_QWORD *)a1;
        v30 = sub_24A29315C();
        v7 = v29;
        v27 = v30;
      }
      v38 = v7;
      sub_24A2874A0(v8, v7, v10, v9, v11, 0);
      sub_24A2874A0(v28, v3, v4, v5, LODWORD(v39), 0);
      sub_24A27FF28(v28, v3, v4, v5, LODWORD(v39), 0);
      sub_24A27FF28(v8, v38, v10, v9, v11, 0);
      return v27;
    }
    goto LABEL_10;
  }
  if ((*(_BYTE *)(a2 + 36) & 1) == 0)
  {
LABEL_10:
    v35 = *(_QWORD *)(a2 + 16);
    v37 = *(_QWORD *)(a2 + 8);
    v20 = *(_QWORD *)a1;
    sub_24A2874A0(*(_QWORD *)a2, v37, v35, v9, v11, v12);
    sub_24A2874A0(v20, v3, v4, v5, LODWORD(v39), v6);
    sub_24A27FF28(v20, v3, v4, v5, LODWORD(v39), v6);
    v21 = v8;
    v23 = v35;
    v22 = v37;
    v24 = v9;
    v25 = v11;
    v26 = v12;
LABEL_11:
    sub_24A27FF28(v21, v22, v23, v24, v25, v26);
    return 0;
  }
  if (v2 != v8 || v3 != v7)
  {
    v13 = *(_QWORD *)(a2 + 8);
    v14 = *(_QWORD *)a1;
    v15 = sub_24A29315C();
    v2 = v14;
    v7 = v13;
    if ((v15 & 1) == 0)
    {
      sub_24A2874A0(v8, v13, v10, v9, v11, 1);
      sub_24A2874A0(v14, v3, v4, v5, LODWORD(v39), 1);
      sub_24A27FF28(v14, v3, v4, v5, LODWORD(v39), 1);
      v21 = v8;
      v22 = v13;
      v23 = v10;
      v24 = v9;
      v25 = v11;
      v26 = 1;
      goto LABEL_11;
    }
  }
  if (v4 == v10 && v5 == v9)
  {
    v16 = v7;
    v17 = v11;
    v18 = v2;
    sub_24A2874A0(v8, v7, v4, v5, v11, 1);
    v19 = v39;
    sub_24A2874A0(v18, v3, v4, v5, LODWORD(v39), 1);
    sub_24A27FF28(v18, v3, v4, v5, LODWORD(v39), 1);
    sub_24A27FF28(v8, v16, v4, v5, v17, 1);
    return v19 == *(float *)&v17;
  }
  v31 = v9;
  v32 = v7;
  v17 = v11;
  v33 = v2;
  v36 = sub_24A29315C();
  sub_24A2874A0(v8, v32, v10, v31, v11, 1);
  v19 = v39;
  sub_24A2874A0(v33, v3, v4, v5, LODWORD(v39), 1);
  sub_24A27FF28(v33, v3, v4, v5, LODWORD(v39), 1);
  sub_24A27FF28(v8, v32, v10, v31, v17, 1);
  v27 = 0;
  if ((v36 & 1) != 0)
    return v19 == *(float *)&v17;
  return v27;
}

BOOL _s26WatchFacesWallpaperSupport0C17MetalCoordinationO0C5StateV2eeoiySbAE_AEtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  unsigned __int8 v13;
  int v14;
  unsigned __int8 v15;
  int v16;
  __int128 v17;
  __int128 v18;
  char v19;
  char v20;
  uint64_t v22;
  uint64_t v23;
  _OWORD v24[2];
  int v25;
  unsigned __int8 v26;
  _OWORD v27[2];
  int v28;
  unsigned __int8 v29;

  v2 = 0;
  if (*a1 == *a2
    && *((double *)a1 + 1) == *((double *)a2 + 1)
    && a1[16] == a2[16]
    && *((double *)a1 + 3) == *((double *)a2 + 3)
    && *((double *)a1 + 4) == *((double *)a2 + 4)
    && ((a1[40] ^ a2[40]) & 1) == 0
    && ((a1[41] ^ a2[41]) & 1) == 0)
  {
    v3 = *((_QWORD *)a1 + 11);
    v4 = *((_QWORD *)a1 + 12);
    v6 = (void *)*((_QWORD *)a1 + 13);
    v5 = *((uint64_t *)a1 + 14);
    v7 = a1[128];
    v9 = *((_QWORD *)a2 + 11);
    v8 = *((_QWORD *)a2 + 12);
    v11 = (void *)*((_QWORD *)a2 + 13);
    v10 = *((uint64_t *)a2 + 14);
    v22 = *((uint64_t *)a2 + 15);
    v23 = *((uint64_t *)a1 + 15);
    v12 = a2[128];
    v13 = a2[84];
    v14 = *((_DWORD *)a2 + 20);
    v15 = a1[84];
    v16 = *((_DWORD *)a1 + 20);
    v17 = *((_OWORD *)a1 + 4);
    v27[0] = *((_OWORD *)a1 + 3);
    v27[1] = v17;
    v28 = v16;
    v29 = v15;
    v18 = *((_OWORD *)a2 + 4);
    v24[0] = *((_OWORD *)a2 + 3);
    v24[1] = v18;
    v25 = v14;
    v26 = v13;
    if (!_s26WatchFacesWallpaperSupport0C17MetalCoordinationO0C5StateV4LookO2eeoiySbAG_AGtFZ_0((uint64_t)v27, (uint64_t)v24))return 0;
    if (!v7)
    {
      if (v3 == v9)
        v20 = v12;
      else
        v20 = 1;
      return (v20 & 1) == 0;
    }
    if ((v12 & 1) == 0)
      return 0;
    if (v3 != v9)
      return 0;
    if (v4 != v8)
      return 0;
    sub_24A292700();
    v2 = 1;
    sub_24A2874CC(v3, v4, v6, v5, v23, 1);
    sub_24A2874CC(v3, v4, v11, v10, v22, 1);
    v19 = sub_24A292FDC();
    sub_24A28755C(v3, v4, v11, v10, v22, 1);
    sub_24A28755C(v3, v4, v6, v5, v23, 1);
    if ((v19 & 1) == 0 || *(double *)&v5 != *(double *)&v10 || *(double *)&v23 != *(double *)&v22)
      return 0;
  }
  return v2;
}

void _s14WallpaperStateVwxx(uint64_t a1)
{
  sub_24A27FF28(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(unsigned int *)(a1 + 80), *(_BYTE *)(a1 + 84));
  sub_24A28755C(*(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(void **)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_BYTE *)(a1 + 128));
}

uint64_t _s14WallpaperStateVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v2 = a2;
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 40);
  v5 = *(_QWORD *)(a2 + 48);
  v6 = *(_QWORD *)(a2 + 56);
  v7 = *(_QWORD *)(a2 + 64);
  v8 = *(_QWORD *)(a2 + 72);
  v9 = *(unsigned int *)(a2 + 80);
  v10 = *(_BYTE *)(a2 + 84);
  sub_24A2874A0(v5, v6, v7, v8, v9, v10);
  *(_QWORD *)(a1 + 48) = v5;
  *(_QWORD *)(a1 + 56) = v6;
  *(_QWORD *)(a1 + 64) = v7;
  *(_QWORD *)(a1 + 72) = v8;
  *(_DWORD *)(a1 + 80) = v9;
  *(_BYTE *)(a1 + 84) = v10;
  v11 = *(_QWORD *)(v2 + 88);
  v12 = *(_QWORD *)(v2 + 96);
  v13 = *(void **)(v2 + 104);
  v14 = *(_QWORD *)(v2 + 112);
  v15 = *(_QWORD *)(v2 + 120);
  LOBYTE(v2) = *(_BYTE *)(v2 + 128);
  sub_24A2874CC(v11, v12, v13, v14, v15, v2);
  *(_QWORD *)(a1 + 88) = v11;
  *(_QWORD *)(a1 + 96) = v12;
  *(_QWORD *)(a1 + 104) = v13;
  *(_QWORD *)(a1 + 112) = v14;
  *(_QWORD *)(a1 + 120) = v15;
  *(_BYTE *)(a1 + 128) = v2;
  return a1;
}

uint64_t _s14WallpaperStateVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;

  v2 = a2;
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a1 + 41) = *(_BYTE *)(a2 + 41);
  v4 = *(_QWORD *)(a2 + 48);
  v5 = *(_QWORD *)(a2 + 56);
  v6 = *(_QWORD *)(a2 + 64);
  v7 = *(_QWORD *)(a2 + 72);
  v8 = *(unsigned int *)(a2 + 80);
  v9 = *(_BYTE *)(a2 + 84);
  sub_24A2874A0(v4, v5, v6, v7, v8, v9);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 72);
  v14 = *(unsigned int *)(a1 + 80);
  v15 = *(_BYTE *)(a1 + 84);
  *(_QWORD *)(a1 + 48) = v4;
  *(_QWORD *)(a1 + 56) = v5;
  *(_QWORD *)(a1 + 64) = v6;
  *(_QWORD *)(a1 + 72) = v7;
  *(_DWORD *)(a1 + 80) = v8;
  *(_BYTE *)(a1 + 84) = v9;
  sub_24A27FF28(v10, v11, v12, v13, v14, v15);
  v16 = *(_QWORD *)(v2 + 88);
  v17 = *(_QWORD *)(v2 + 96);
  v18 = *(void **)(v2 + 104);
  v19 = *(_QWORD *)(v2 + 112);
  v20 = *(_QWORD *)(v2 + 120);
  LOBYTE(v2) = *(_BYTE *)(v2 + 128);
  sub_24A2874CC(v16, v17, v18, v19, v20, v2);
  v21 = *(_QWORD *)(a1 + 88);
  v22 = *(_QWORD *)(a1 + 96);
  v23 = *(void **)(a1 + 104);
  v24 = *(_QWORD *)(a1 + 112);
  v25 = *(_QWORD *)(a1 + 120);
  v26 = *(_BYTE *)(a1 + 128);
  *(_QWORD *)(a1 + 88) = v16;
  *(_QWORD *)(a1 + 96) = v17;
  *(_QWORD *)(a1 + 104) = v18;
  *(_QWORD *)(a1 + 112) = v19;
  *(_QWORD *)(a1 + 120) = v20;
  *(_BYTE *)(a1 + 128) = v2;
  sub_24A28755C(v21, v22, v23, v24, v25, v26);
  return a1;
}

__n128 __swift_memcpy129_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  result = *(__n128 *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t _s14WallpaperStateVwta(uint64_t a1, uint64_t a2)
{
  int v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  __int128 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a1 + 41) = *(_BYTE *)(a2 + 41);
  v4 = *(_DWORD *)(a2 + 80);
  v5 = *(_BYTE *)(a2 + 84);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 72);
  v10 = *(unsigned int *)(a1 + 80);
  v11 = *(_BYTE *)(a1 + 84);
  v12 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v12;
  *(_DWORD *)(a1 + 80) = v4;
  *(_BYTE *)(a1 + 84) = v5;
  sub_24A27FF28(v6, v7, v8, v9, v10, v11);
  v13 = *(_QWORD *)(a2 + 120);
  v14 = *(_BYTE *)(a2 + 128);
  v15 = *(_QWORD *)(a1 + 88);
  v16 = *(_QWORD *)(a1 + 96);
  v17 = *(void **)(a1 + 104);
  v18 = *(_QWORD *)(a1 + 112);
  v19 = *(_QWORD *)(a1 + 120);
  v20 = *(_BYTE *)(a1 + 128);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 120) = v13;
  *(_BYTE *)(a1 + 128) = v14;
  sub_24A28755C(v15, v16, v17, v18, v19, v20);
  return a1;
}

uint64_t _s14WallpaperStateVwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 129))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s14WallpaperStateVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 128) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 129) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 129) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for WallpaperMetalCoordination.WallpaperState()
{
  return &type metadata for WallpaperMetalCoordination.WallpaperState;
}

uint64_t _s14WallpaperStateV4LookOwxx(uint64_t a1)
{
  return sub_24A27FF28(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(unsigned int *)(a1 + 32), *(_BYTE *)(a1 + 36));
}

uint64_t _s14WallpaperStateV4LookOwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(unsigned int *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 36);
  sub_24A2874A0(*(_QWORD *)a2, v4, v5, v6, v7, v8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_DWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 36) = v8;
  return a1;
}

uint64_t _s14WallpaperStateV4LookOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(unsigned int *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 36);
  sub_24A2874A0(*(_QWORD *)a2, v4, v5, v6, v7, v8);
  v9 = *(_QWORD *)a1;
  v10 = *(_QWORD *)(a1 + 8);
  v11 = *(_QWORD *)(a1 + 16);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = *(unsigned int *)(a1 + 32);
  v14 = *(_BYTE *)(a1 + 36);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_DWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 36) = v8;
  sub_24A27FF28(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 __swift_memcpy37_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 29) = *(_QWORD *)(a2 + 29);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t _s14WallpaperStateV4LookOwta(uint64_t a1, uint64_t a2)
{
  int v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  __int128 v11;

  v3 = *(_DWORD *)(a2 + 32);
  v4 = *(_BYTE *)(a2 + 36);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(unsigned int *)(a1 + 32);
  v10 = *(_BYTE *)(a1 + 36);
  v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v11;
  *(_DWORD *)(a1 + 32) = v3;
  *(_BYTE *)(a1 + 36) = v4;
  sub_24A27FF28(v5, v7, v6, v8, v9, v10);
  return a1;
}

uint64_t _s14WallpaperStateV4LookOwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 37))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 36);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s14WallpaperStateV4LookOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 36) = 0;
    *(_DWORD *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 37) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 37) = 0;
    if (a2)
      *(_BYTE *)(result + 36) = -(char)a2;
  }
  return result;
}

uint64_t sub_24A2924A8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 36);
}

uint64_t sub_24A2924B0(uint64_t result, char a2)
{
  *(_BYTE *)(result + 36) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for WallpaperMetalCoordination.WallpaperState.Look()
{
  return &type metadata for WallpaperMetalCoordination.WallpaperState.Look;
}

void _s14WallpaperStateV12RotationInfoOwxx(uint64_t a1)
{
  sub_24A28755C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(void **)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
}

uint64_t _s14WallpaperStateV12RotationInfoOwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(void **)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_24A2874CC(*(_QWORD *)a2, v4, v5, v6, v7, v8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  return a1;
}

uint64_t _s14WallpaperStateV12RotationInfoOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(void **)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_24A2874CC(*(_QWORD *)a2, v4, v5, v6, v7, v8);
  v9 = *(_QWORD *)a1;
  v10 = *(_QWORD *)(a1 + 8);
  v11 = *(void **)(a1 + 16);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(_BYTE *)(a1 + 40);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  sub_24A28755C(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t _s14WallpaperStateV12RotationInfoOwta(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  __int128 v11;

  v3 = *(_QWORD *)(a2 + 32);
  v4 = *(_BYTE *)(a2 + 40);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(void **)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_BYTE *)(a1 + 40);
  v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v11;
  *(_QWORD *)(a1 + 32) = v3;
  *(_BYTE *)(a1 + 40) = v4;
  sub_24A28755C(v5, v7, v6, v8, v9, v10);
  return a1;
}

uint64_t _s14WallpaperStateV12RotationInfoOwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s14WallpaperStateV12RotationInfoOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = -(char)a2;
  }
  return result;
}

uint64_t sub_24A2926DC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_24A2926E4(uint64_t result, char a2)
{
  *(_BYTE *)(result + 40) = a2 & 1;
  return result;
}

ValueMetadata *_s14WallpaperStateV12RotationInfoOMa()
{
  return &_s14WallpaperStateV12RotationInfoON;
}

unint64_t sub_24A292700()
{
  unint64_t result;

  result = qword_257920CF8;
  if (!qword_257920CF8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257920CF8);
  }
  return result;
}

uint64_t sub_24A29273C(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  return a1;
}

BOOL static WallpaperMetalRenderingFloatingLayerStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t WallpaperMetalRenderingFloatingLayerStyle.hash(into:)()
{
  return sub_24A2931D4();
}

uint64_t WallpaperMetalRenderingFloatingLayerStyle.hashValue.getter()
{
  sub_24A2931C8();
  sub_24A2931D4();
  return sub_24A2931E0();
}

unint64_t sub_24A292800()
{
  unint64_t result;

  result = qword_257920D00;
  if (!qword_257920D00)
  {
    result = MEMORY[0x24BD0C4D4](&protocol conformance descriptor for WallpaperMetalRenderingFloatingLayerStyle, &type metadata for WallpaperMetalRenderingFloatingLayerStyle);
    atomic_store(result, (unint64_t *)&qword_257920D00);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for WallpaperMetalRenderingFloatingLayerStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A292890 + 4 * byte_24A2952D5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24A2928C4 + 4 * byte_24A2952D0[v4]))();
}

uint64_t sub_24A2928C4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A2928CC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A2928D4);
  return result;
}

uint64_t sub_24A2928E0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A2928E8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24A2928EC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A2928F4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WallpaperMetalRenderingFloatingLayerStyle()
{
  return &type metadata for WallpaperMetalRenderingFloatingLayerStyle;
}

uint64_t initializeBufferWithCopyOfBuffer for WallpaperMetalRenderingFloatingLayerStyle.MaskResource(uint64_t a1, uint64_t a2)
{
  id v3;
  char v4;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_24A28E004(*(id *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

void destroy for WallpaperMetalRenderingFloatingLayerStyle.MaskResource(uint64_t a1)
{
  sub_24A28E028(*(id *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t assignWithCopy for WallpaperMetalRenderingFloatingLayerStyle.MaskResource(uint64_t a1, uint64_t a2)
{
  id v3;
  char v4;
  void *v5;
  char v6;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_24A28E004(*(id *)a2, v4);
  v5 = *(void **)a1;
  v6 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  sub_24A28E028(v5, v6);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for WallpaperMetalRenderingFloatingLayerStyle.MaskResource(uint64_t a1, uint64_t *a2)
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
  sub_24A28E028(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for WallpaperMetalRenderingFloatingLayerStyle.MaskResource(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WallpaperMetalRenderingFloatingLayerStyle.MaskResource(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_24A292A90(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_24A292A98(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for WallpaperMetalRenderingFloatingLayerStyle.MaskResource()
{
  return &type metadata for WallpaperMetalRenderingFloatingLayerStyle.MaskResource;
}

uint64_t dispatch thunk of static WallpaperMetalRendering.colorPixelFormat.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static WallpaperMetalRendering.colorSpace.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static WallpaperMetalRendering.needsCommandBufferForSetup.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static WallpaperMetalRendering.floatingLayerStyle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of WallpaperMetalRendering.init(device:identifier:pixelWidth:pixelHeight:commandBuffer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 40))();
}

uint64_t dispatch thunk of WallpaperMetalRendering.render(state:into:floatingLayerMask:commandBuffer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 48))();
}

uint64_t sub_24A292B08()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_24A292B14()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_24A292B20()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_24A292B2C()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_24A292B38()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_24A292B44()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_24A292B50()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_24A292B5C()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_24A292B68()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_24A292B74()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_24A292B80()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_24A292B8C()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_24A292B98()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_24A292BA4()
{
  return MEMORY[0x24BDCBCE0]();
}

uint64_t sub_24A292BB0()
{
  return MEMORY[0x24BDCBD00]();
}

uint64_t sub_24A292BBC()
{
  return MEMORY[0x24BDCBD10]();
}

uint64_t sub_24A292BC8()
{
  return MEMORY[0x24BDCBD28]();
}

uint64_t sub_24A292BD4()
{
  return MEMORY[0x24BDCBD48]();
}

uint64_t sub_24A292BE0()
{
  return MEMORY[0x24BDCBD68]();
}

uint64_t sub_24A292BEC()
{
  return MEMORY[0x24BDCBDA8]();
}

uint64_t sub_24A292BF8()
{
  return MEMORY[0x24BDCBDD8]();
}

uint64_t sub_24A292C04()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_24A292C10()
{
  return MEMORY[0x24BDCC1E0]();
}

uint64_t sub_24A292C1C()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_24A292C28()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_24A292C34()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_24A292C40()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_24A292C4C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_24A292C58()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_24A292C64()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_24A292C70()
{
  return MEMORY[0x24BDCDC28]();
}

uint64_t sub_24A292C7C()
{
  return MEMORY[0x24BDCDC40]();
}

uint64_t sub_24A292C88()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_24A292C94()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_24A292CA0()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_24A292CAC()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_24A292CB8()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_24A292CC4()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_24A292CD0()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_24A292CDC()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_24A292CE8()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_24A292CF4()
{
  return MEMORY[0x24BDCF3B0]();
}

uint64_t sub_24A292D00()
{
  return MEMORY[0x24BDCF3D8]();
}

uint64_t sub_24A292D0C()
{
  return MEMORY[0x24BDCF428]();
}

uint64_t sub_24A292D18()
{
  return MEMORY[0x24BDCF500]();
}

uint64_t sub_24A292D24()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_24A292D30()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_24A292D3C()
{
  return MEMORY[0x24BEE5118]();
}

uint64_t sub_24A292D48()
{
  return MEMORY[0x24BEE5120]();
}

uint64_t sub_24A292D54()
{
  return MEMORY[0x24BEE5130]();
}

uint64_t sub_24A292D60()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_24A292D6C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_24A292D78()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_24A292D84()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_24A292D90()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_24A292D9C()
{
  return MEMORY[0x24BEE54D0]();
}

uint64_t sub_24A292DA8()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_24A292DB4()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_24A292DC0()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_24A292DCC()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_24A292DD8()
{
  return MEMORY[0x24BEE02C0]();
}

uint64_t sub_24A292DE4()
{
  return MEMORY[0x24BEE0548]();
}

uint64_t sub_24A292DF0()
{
  return MEMORY[0x24BEE0570]();
}

uint64_t sub_24A292DFC()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_24A292E08()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24A292E14()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_24A292E20()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_24A292E2C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_24A292E38()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_24A292E44()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_24A292E50()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_24A292E5C()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_24A292E68()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_24A292E74()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_24A292E80()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_24A292E8C()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_24A292E98()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_24A292EA4()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_24A292EB0()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_24A292EBC()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_24A292EC8()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_24A292ED4()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_24A292EE0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_24A292EEC()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_24A292EF8()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_24A292F04()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_24A292F10()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_24A292F1C()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_24A292F28()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_24A292F34()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_24A292F40()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_24A292F4C()
{
  return MEMORY[0x24BEE17F8]();
}

uint64_t sub_24A292F58()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_24A292F64()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_24A292F70()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_24A292F7C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_24A292F88()
{
  return MEMORY[0x24BEE5CA8]();
}

uint64_t sub_24A292F94()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_24A292FA0()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_24A292FAC()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_24A292FB8()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_24A292FC4()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_24A292FD0()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_24A292FDC()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_24A292FE8()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_24A292FF4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_24A293000()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_24A29300C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_24A293018()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_24A293024()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_24A293030()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_24A29303C()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_24A293048()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_24A293054()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_24A293060()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_24A29306C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_24A293078()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_24A293084()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_24A293090()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_24A29309C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_24A2930A8()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_24A2930B4()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_24A2930C0()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_24A2930CC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_24A2930D8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_24A2930E4()
{
  return MEMORY[0x24BEE2F70]();
}

uint64_t sub_24A2930F0()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_24A2930FC()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_24A293108()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_24A293114()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_24A293120()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_24A29312C()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_24A293138()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_24A293144()
{
  return MEMORY[0x24BEE39E0]();
}

uint64_t sub_24A293150()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_24A29315C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_24A293168()
{
  return MEMORY[0x24BEE3DD8]();
}

uint64_t sub_24A293174()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_24A293180()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_24A29318C()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_24A293198()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_24A2931A4()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_24A2931B0()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_24A2931BC()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_24A2931C8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24A2931D4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24A2931E0()
{
  return MEMORY[0x24BEE4328]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE190](info, data, size, releaseData);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x24BDBE5E0](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8B50](properties);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BEBE2E0](image);
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

float __exp10f(float a1)
{
  float result;

  MEMORY[0x24BDAC7E0](a1);
  return result;
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

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x24BEE4C68]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x24BEE4FB8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x24BEE4FC0]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x24BEE4FE0]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x24BEE4FE8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
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

