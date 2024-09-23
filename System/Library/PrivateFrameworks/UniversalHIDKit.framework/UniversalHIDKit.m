uint64_t sub_24996FBA4()
{
  return sub_24996FCF4(&qword_2578ADED8, (unint64_t *)&qword_2578ADEE0, 0x24BEBD870, (uint64_t)&protocol conformance descriptor for UIPress);
}

uint64_t sub_24996FBD8()
{
  return sub_24996FBF8();
}

uint64_t sub_24996FBF8()
{
  void *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(v0, sel_allPresses);
  sub_24996FD34(0, (unint64_t *)&qword_2578ADEE0);
  sub_24996FCF4((unint64_t *)&qword_2578ADF40, (unint64_t *)&qword_2578ADEE0, 0x24BEBD870, MEMORY[0x24BEE5BD8]);
  v2 = sub_24997791C();

  return v2;
}

uint64_t sub_24996FC90(uint64_t a1)
{
  return sub_24996FECC(a1);
}

uint64_t sub_24996FCB0(uint64_t a1)
{
  uint64_t result;

  result = sub_24996FCF4(&qword_2578ADF18, &qword_2578ADF20, 0x24BEBD878, (uint64_t)"@\n");
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24996FCF4(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = sub_24996FD34(255, a2);
    result = MEMORY[0x24BCFC08C](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24996FD34(uint64_t a1, unint64_t *a2)
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

uint64_t dispatch thunk of UIPressesEventProtocol.allPresses.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of UIPressesEventProtocol.presses(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t sub_24996FD7C(uint64_t *a1, uint64_t *a2)
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

uint64_t sub_24996FDC4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_24996FDE4(uint64_t result, int a2, int a3)
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
  sub_24996FE44(a1, &qword_2578ADF28);
}

void type metadata accessor for TouchType(uint64_t a1)
{
  sub_24996FE44(a1, &qword_2578ADF30);
}

void sub_24996FE44(uint64_t a1, unint64_t *a2)
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

unint64_t sub_24996FE8C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2578ADF38;
  if (!qword_2578ADF38)
  {
    type metadata accessor for TouchType(255);
    result = MEMORY[0x24BCFC08C](&unk_2499787B8, v1);
    atomic_store(result, (unint64_t *)&qword_2578ADF38);
  }
  return result;
}

uint64_t sub_24996FECC(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(v1, sel_pressesForGestureRecognizer_, a1);
  sub_24996FD34(0, (unint64_t *)&qword_2578ADEE0);
  sub_24996FCF4((unint64_t *)&qword_2578ADF40, (unint64_t *)&qword_2578ADEE0, 0x24BEBD870, MEMORY[0x24BEE5BD8]);
  v3 = sub_24997791C();

  return v3;
}

BOOL sub_24996FF68(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

BOOL sub_24996FF74(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_24996FF84()
{
  return sub_24996FF8C();
}

uint64_t sub_24996FF8C()
{
  sub_249977A90();
  sub_249977A9C();
  return sub_249977AA8();
}

void sub_24996FFD0()
{
  sub_24996FFD8();
}

void sub_24996FFD8()
{
  sub_249977A9C();
  OUTLINED_FUNCTION_0();
}

uint64_t sub_24996FFF8()
{
  return sub_249970000();
}

uint64_t sub_249970000()
{
  sub_249977A90();
  sub_249977A9C();
  return sub_249977AA8();
}

BOOL sub_249970040(uint64_t *a1, uint64_t *a2)
{
  return sub_24996FF68(*a1, *a2);
}

void sub_24997004C(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;

  sub_24997007C();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3 & 1;
}

void sub_249970084(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = nullsub_1(*v1);
  OUTLINED_FUNCTION_0();
}

uint64_t dispatch thunk of EventTranslator.eventMask.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of EventTranslator.translateEvent(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t UIEventProtocol.asPressesEvent.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  int v8;
  uint64_t v10;

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = swift_dynamicCast();
  return __swift_storeEnumTagSinglePayload(a2, v8 ^ 1u, 1, AssociatedTypeWitness);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

void UIEvent.senderID.getter()
{
  void *v0;
  id v1;
  id v2;
  void *v3;

  v1 = objc_msgSend(objc_retainAutorelease(v0), sel__hidEvent);
  if (v1)
  {
    v2 = v1;
    v3 = (void *)MEMORY[0x24BCFBC84]();

    objc_msgSend(v3, sel_senderID);
  }
  OUTLINED_FUNCTION_0();
}

void UIEvent.asPressesEvent.getter()
{
  void *v0;
  id v1;

  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    v1 = v0;
  OUTLINED_FUNCTION_0();
}

void sub_24997022C()
{
  sub_249970294(&qword_2578ADF48, &qword_2578ADF20, 0x24BEBD878, (uint64_t)&protocol conformance descriptor for UIPressesEvent);
}

void sub_249970260()
{
  sub_249970294(&qword_2578ADF50, (unint64_t *)&qword_2578ADF58, 0x24BEBDAA0, (uint64_t)&protocol conformance descriptor for UITouch);
}

void sub_249970294(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;

  if (!*a1)
  {
    v6 = sub_24996FD34(255, a2);
    atomic_store(MEMORY[0x24BCFC08C](a4, v6), a1);
  }
  OUTLINED_FUNCTION_0();
}

id sub_2499702D0()
{
  return sub_2499702F0();
}

id sub_2499702F0()
{
  void *v0;

  return objc_msgSend(v0, sel_type);
}

id sub_249970300()
{
  return sub_249970320();
}

id sub_249970320()
{
  void *v0;

  return objc_msgSend(v0, sel_timestamp);
}

uint64_t sub_249970330()
{
  return sub_249970350();
}

uint64_t sub_249970350()
{
  void *v0;

  return sub_249970468(v0);
}

uint64_t sub_249970358(uint64_t a1)
{
  return sub_249970378(a1);
}

uint64_t sub_249970378(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(v1, sel_touchesForGestureRecognizer_, a1);
  if (!v2)
    return 0;
  v3 = v2;
  sub_24996FD34(0, (unint64_t *)&qword_2578ADF58);
  sub_249970294((unint64_t *)&qword_2578ADFB0, (unint64_t *)&qword_2578ADF58, 0x24BEBDAA0, MEMORY[0x24BEE5BD8]);
  v4 = sub_24997791C();

  return v4;
}

void sub_249970420()
{
  UIEvent.senderID.getter();
}

uint64_t dispatch thunk of UIEventProtocol.type.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of UIEventProtocol.timestamp.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of UIEventProtocol.allTouches.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of UIEventProtocol.touches(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of UIEventProtocol.senderID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t sub_249970468(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_allTouches);
  if (!v1)
    return 0;
  v2 = v1;
  sub_24996FD34(0, (unint64_t *)&qword_2578ADF58);
  sub_249970294((unint64_t *)&qword_2578ADFB0, (unint64_t *)&qword_2578ADF58, 0x24BEBDAA0, MEMORY[0x24BEE5BD8]);
  v3 = sub_24997791C();

  return v3;
}

uint64_t static UIPressesFilter.== infix(_:_:)(void *a1, void *a2)
{
  id v4;
  id v5;

  sub_24997056C();
  v4 = a1;
  v5 = a2;
  LOBYTE(a1) = sub_249977988();

  return a1 & 1;
}

unint64_t sub_24997056C()
{
  unint64_t result;

  result = qword_2578ADFB8;
  if (!qword_2578ADFB8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2578ADFB8);
  }
  return result;
}

uint64_t sub_2499705A8(void **a1, void **a2)
{
  return static UIPressesFilter.== infix(_:_:)(*a1, *a2);
}

void **initializeBufferWithCopyOfBuffer for UIPressesFilter(void **a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  *a1 = *a2;
  v4 = v3;
  return a1;
}

void destroy for UIPressesFilter(id *a1)
{

}

void **assignWithCopy for UIPressesFilter(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *a2;
  v4 = *a1;
  *a1 = *a2;
  v5 = v3;

  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for UIPressesFilter(void **a1, void **a2)
{
  void *v3;

  v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for UIPressesFilter(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 8))
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

uint64_t storeEnumTagSinglePayload for UIPressesFilter(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 8) = 1;
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
    *(_BYTE *)(result + 8) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_2499706D4()
{
  return 0;
}

ValueMetadata *type metadata accessor for UIPressesFilter()
{
  return &type metadata for UIPressesFilter;
}

uint64_t dispatch thunk of UIPressesFilterConfigurable.pressesFilter.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of UIPressesFilterConfigurable.pressesFilter.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of UIPressesFilterConfigurable.pressesFilter.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t EventModifiers.rawValue.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*EventModifiers.rawValue.modify())()
{
  return nullsub_1;
}

uint64_t static EventModifiers.capsLock.getter()
{
  return 1;
}

uint64_t static EventModifiers.shift.getter()
{
  return 2;
}

uint64_t static EventModifiers.control.getter()
{
  return 4;
}

uint64_t static EventModifiers.option.getter()
{
  return 8;
}

uint64_t static EventModifiers.command.getter()
{
  return 16;
}

uint64_t static EventModifiers.numericPad.getter()
{
  return 32;
}

uint64_t static EventModifiers.help.getter()
{
  return 64;
}

uint64_t static EventModifiers.function.getter()
{
  return 128;
}

uint64_t sub_249970768(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unsigned __int8 *v3;
  int v4;
  int v5;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    LODWORD(v2) = 0;
    v3 = (unsigned __int8 *)(a1 + 32);
    do
    {
      v5 = *v3++;
      v4 = v5;
      if ((v5 & ~(_DWORD)v2) == 0)
        v4 = 0;
      v2 = v4 | v2;
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

uint64_t static EventModifiers.all.getter()
{
  return 255;
}

unint64_t sub_2499707C4()
{
  unint64_t result;

  result = qword_2578ADFC0;
  if (!qword_2578ADFC0)
  {
    result = MEMORY[0x24BCFC08C](&protocol conformance descriptor for EventModifiers, &type metadata for EventModifiers);
    atomic_store(result, (unint64_t *)&qword_2578ADFC0);
  }
  return result;
}

unint64_t sub_249970804()
{
  unint64_t result;

  result = qword_2578ADFC8;
  if (!qword_2578ADFC8)
  {
    result = MEMORY[0x24BCFC08C](&protocol conformance descriptor for EventModifiers, &type metadata for EventModifiers);
    atomic_store(result, (unint64_t *)&qword_2578ADFC8);
  }
  return result;
}

_BYTE *sub_249970840@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *result;
  return result;
}

unint64_t sub_249970850()
{
  unint64_t result;

  result = qword_2578ADFD0;
  if (!qword_2578ADFD0)
  {
    result = MEMORY[0x24BCFC08C](&protocol conformance descriptor for EventModifiers, &type metadata for EventModifiers);
    atomic_store(result, (unint64_t *)&qword_2578ADFD0);
  }
  return result;
}

unint64_t sub_249970890()
{
  unint64_t result;

  result = qword_2578ADFD8;
  if (!qword_2578ADFD8)
  {
    result = MEMORY[0x24BCFC08C](&protocol conformance descriptor for EventModifiers, &type metadata for EventModifiers);
    atomic_store(result, (unint64_t *)&qword_2578ADFD8);
  }
  return result;
}

uint64_t sub_2499708CC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2499706D4();
  *a1 = result;
  return result;
}

uint64_t sub_2499708F0@<X0>(unsigned __int8 *a1@<X0>, _BYTE *a2@<X8>)
{
  unsigned __int8 *v2;
  uint64_t result;

  result = sub_24997091C(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_24997091C(unsigned int a1, int a2)
{
  return a2 | a1;
}

uint64_t sub_249970924@<X0>(unsigned __int8 *a1@<X0>, _BYTE *a2@<X8>)
{
  unsigned __int8 *v2;
  uint64_t result;

  result = sub_249970950(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_249970950(unsigned int a1, int a2)
{
  return a2 & a1;
}

uint64_t sub_249970958@<X0>(unsigned __int8 *a1@<X0>, _BYTE *a2@<X8>)
{
  unsigned __int8 *v2;
  uint64_t result;

  result = sub_249970984(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_249970984(unsigned int a1, int a2)
{
  return a2 ^ a1;
}

BOOL sub_24997098C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_249970994(a1, *a2);
}

BOOL sub_249970994(unsigned __int8 *a1, unsigned __int8 a2)
{
  _BYTE *v2;
  int v3;

  v3 = (*v2 & a2);
  if (v3 != a2)
    *v2 |= a2;
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_2499709C4@<X0>(unsigned __int8 *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_2499709F4(*a1);
  *a2 = result;
  a2[1] = BYTE1(result) & 1;
  return result;
}

uint64_t sub_2499709F4(unsigned __int8 a1)
{
  char *v1;
  char v2;

  v2 = *v1;
  if ((*v1 & a1) != 0)
    *v1 = v2 & ~a1;
  return (v2 & a1) | (((v2 & a1) == 0) << 8);
}

uint64_t sub_249970A24@<X0>(char *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_249970A54(*a1);
  *a2 = result;
  a2[1] = BYTE1(result) & 1;
  return result;
}

uint64_t sub_249970A54(char a1)
{
  char *v1;
  char v2;

  v2 = *v1;
  *v1 |= a1;
  return (v2 & a1) | (((v2 & a1) == 0) << 8);
}

uint64_t sub_249970A7C(unsigned __int8 *a1)
{
  return sub_249970A84(*a1);
}

uint64_t sub_249970A84(uint64_t result)
{
  _BYTE *v1;

  *v1 |= result;
  return result;
}

uint64_t sub_249970A94(unsigned __int8 *a1)
{
  return sub_249970A9C(*a1);
}

uint64_t sub_249970A9C(uint64_t result)
{
  _BYTE *v1;

  *v1 &= result;
  return result;
}

uint64_t sub_249970AAC(unsigned __int8 *a1)
{
  return sub_249970AB4(*a1);
}

uint64_t sub_249970AB4(uint64_t result)
{
  _BYTE *v1;

  *v1 ^= result;
  return result;
}

uint64_t sub_249970AC4@<X0>(unsigned __int8 *a1@<X0>, _BYTE *a2@<X8>)
{
  unsigned __int8 *v2;
  uint64_t result;

  result = sub_249970AF0(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_249970AF0(int a1, int a2)
{
  return a2 & ~a1;
}

BOOL sub_249970AF8(char *a1)
{
  unsigned __int8 *v1;

  return sub_249970B04(*a1, *v1);
}

BOOL sub_249970B04(char a1, unsigned __int8 a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_249970B14(unsigned __int8 *a1)
{
  unsigned __int8 *v1;

  return sub_249970B20(*a1, *v1);
}

BOOL sub_249970B20(unsigned __int8 a1, unsigned __int8 a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_249970B30(unsigned __int8 *a1)
{
  char *v1;

  return sub_249970B3C(*a1, *v1);
}

BOOL sub_249970B3C(unsigned __int8 a1, char a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_249970B4C()
{
  char *v0;

  return sub_249970B54(*v0);
}

BOOL sub_249970B54(char a1)
{
  return a1 == 0;
}

uint64_t sub_249970B60()
{
  return sub_2499779AC();
}

uint64_t sub_249970B78(unsigned __int8 *a1)
{
  return sub_249970B80(*a1);
}

uint64_t sub_249970B80(uint64_t result)
{
  _BYTE *v1;

  *v1 &= ~(_BYTE)result;
  return result;
}

unsigned __int8 *sub_249970B90@<X0>(unsigned __int8 *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_249970BA0(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

BOOL sub_249970BAC(char *a1, char *a2)
{
  return sub_24996FF74(*a1, *a2);
}

uint64_t sub_249970BB8@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_249970768(a1);
  *a2 = result;
  return result;
}

ValueMetadata *type metadata accessor for EventModifiers()
{
  return &type metadata for EventModifiers;
}

uint64_t sub_249970BEC(char a1)
{
  uint64_t v2;
  unint64_t v3;
  unsigned __int16 v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  unsigned __int16 v8;
  uint64_t v9;
  unint64_t v10;
  unsigned __int16 v11;
  uint64_t v12;
  unint64_t v13;
  unsigned __int16 v14;
  uint64_t v15;
  unint64_t v16;
  unsigned __int16 v17;
  uint64_t v18;
  unint64_t v19;
  unsigned __int16 v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;

  if ((a1 & 1) == 0)
  {
    v2 = MEMORY[0x24BEE4AF8];
    if ((a1 & 2) == 0)
      goto LABEL_12;
    goto LABEL_7;
  }
  v2 = sub_2499770AC(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v3 = *(_QWORD *)(v2 + 24);
  if (*(_QWORD *)(v2 + 16) >= v3 >> 1)
    v2 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_2();
  *(_DWORD *)(v5 + 32) = v4 | 0x390000;
  if ((a1 & 2) != 0)
  {
LABEL_7:
    if ((OUTLINED_FUNCTION_4() & 1) == 0)
      v2 = OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_3();
    if (v7)
      v2 = OUTLINED_FUNCTION_0_0(v6);
    OUTLINED_FUNCTION_2();
    *(_DWORD *)(v9 + 32) = v8 | 0xE10000;
  }
LABEL_12:
  if ((a1 & 4) != 0)
  {
    if ((OUTLINED_FUNCTION_4() & 1) == 0)
      v2 = OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_3();
    if (v7)
      v2 = OUTLINED_FUNCTION_0_0(v10);
    OUTLINED_FUNCTION_2();
    *(_DWORD *)(v12 + 32) = v11 | 0xE00000;
    if ((a1 & 8) == 0)
    {
LABEL_14:
      if ((a1 & 0x10) == 0)
        goto LABEL_15;
      goto LABEL_28;
    }
  }
  else if ((a1 & 8) == 0)
  {
    goto LABEL_14;
  }
  if ((OUTLINED_FUNCTION_4() & 1) == 0)
    v2 = OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  if (v7)
    v2 = OUTLINED_FUNCTION_0_0(v13);
  OUTLINED_FUNCTION_2();
  *(_DWORD *)(v15 + 32) = v14 | 0xE20000;
  if ((a1 & 0x10) == 0)
  {
LABEL_15:
    if ((a1 & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_28:
  if ((OUTLINED_FUNCTION_4() & 1) == 0)
    v2 = OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  if (v7)
    v2 = OUTLINED_FUNCTION_0_0(v16);
  OUTLINED_FUNCTION_2();
  *(_DWORD *)(v18 + 32) = v17 | 0xE30000;
  if ((a1 & 0x40) == 0)
  {
LABEL_16:
    if ((a1 & 0x80) == 0)
      return v2;
    goto LABEL_38;
  }
LABEL_33:
  if ((OUTLINED_FUNCTION_4() & 1) == 0)
    v2 = OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  if (v7)
    v2 = OUTLINED_FUNCTION_0_0(v19);
  OUTLINED_FUNCTION_2();
  *(_DWORD *)(v21 + 32) = v20 | 0x750000;
  if (a1 < 0)
  {
LABEL_38:
    if ((OUTLINED_FUNCTION_4() & 1) == 0)
      v2 = OUTLINED_FUNCTION_1();
    v23 = *(_QWORD *)(v2 + 16);
    v22 = *(_QWORD *)(v2 + 24);
    if (v23 >= v22 >> 1)
      v2 = OUTLINED_FUNCTION_0_0(v22);
    *(_QWORD *)(v2 + 16) = v23 + 1;
    *(_DWORD *)(v2 + 4 * v23 + 32) = 196863;
  }
  return v2;
}

uint64_t OUTLINED_FUNCTION_0_0@<X0>(unint64_t a1@<X8>)
{
  uint64_t v1;
  int64_t v2;

  return sub_2499770AC(a1 > 1, v2, 1, v1);
}

uint64_t OUTLINED_FUNCTION_1()
{
  uint64_t v0;

  return sub_2499770AC(0, *(_QWORD *)(v0 + 16) + 1, 1, v0);
}

void OUTLINED_FUNCTION_2()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 16) = v1;
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

_UNKNOWN **sub_249970E3C()
{
  return &protocol witness table for UIKey;
}

id sub_249970E48()
{
  return sub_249970E68();
}

id sub_249970E68()
{
  void *v0;

  return objc_msgSend(v0, sel_phase);
}

id sub_249970E78@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_249970F50();
  *a1 = result;
  return result;
}

unint64_t sub_249970EA0(uint64_t a1)
{
  unint64_t result;

  result = sub_249970EC4();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_249970EC4()
{
  unint64_t result;
  unint64_t v1;

  result = qword_2578ADF40;
  if (!qword_2578ADF40)
  {
    v1 = sub_249970F04();
    result = MEMORY[0x24BCFC08C](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_2578ADF40);
  }
  return result;
}

unint64_t sub_249970F04()
{
  unint64_t result;

  result = qword_2578ADEE0;
  if (!qword_2578ADEE0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2578ADEE0);
  }
  return result;
}

uint64_t dispatch thunk of UIPressProtocol.phase.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of UIPressProtocol.key.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

id sub_249970F50()
{
  void *v0;

  return objc_msgSend(v0, sel_key);
}

uint64_t EventObserver<A>.init(eventMask:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t, uint64_t);
  uint64_t v52;
  char *v53;
  unint64_t v54;
  __int128 v55[2];
  __int128 v56;
  uint64_t v57;
  _QWORD v58[35];

  v2 = sub_24997788C();
  v51 = *(void (**)(char *, uint64_t, uint64_t))(v2 - 8);
  v52 = v2;
  MEMORY[0x24BDAC7A8]();
  v53 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE010);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_249978AE0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE018);
  OUTLINED_FUNCTION_3_0();
  v5 = sub_249971524();
  v6 = sub_249972048(&qword_2578AE020, &qword_2578AE018, (uint64_t)&protocol conformance descriptor for DigitizerEventTranslator<A>);
  *(_QWORD *)(inited + 32) = v5;
  *(_QWORD *)(inited + 40) = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE028);
  OUTLINED_FUNCTION_3_0();
  v7 = sub_2499715B0();
  v8 = sub_249972048(&qword_2578AE030, &qword_2578AE028, (uint64_t)&protocol conformance descriptor for KeyboardEventTranslator<A>);
  v9 = v8;
  *(_QWORD *)(inited + 48) = v7;
  *(_QWORD *)(inited + 56) = v8;
  v10 = MEMORY[0x24BEE4AF8];
  if ((v5[9] & a1) != 0)
  {
    v54 = v8;
    *(_QWORD *)&v56 = MEMORY[0x24BEE4AF8];
    swift_retain();
    sub_249971B74(0, 1, 1);
    v11 = v56;
    v13 = *(_QWORD *)(v56 + 16);
    v12 = *(_QWORD *)(v56 + 24);
    if (v13 >= v12 >> 1)
    {
      OUTLINED_FUNCTION_2_0(v12);
      v11 = v56;
    }
    *(_QWORD *)(v11 + 16) = v13 + 1;
    v14 = v11 + 16 * v13;
    *(_QWORD *)(v14 + 32) = v5;
    *(_QWORD *)(v14 + 40) = v6;
    v9 = v54;
  }
  else
  {
    v11 = MEMORY[0x24BEE4AF8];
  }
  if ((*(_QWORD *)(v7 + 40) & a1) != 0)
  {
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)&v56 = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_249971B74(0, *(_QWORD *)(v11 + 16) + 1, 1);
      v11 = v56;
    }
    v17 = *(_QWORD *)(v11 + 16);
    v16 = *(_QWORD *)(v11 + 24);
    if (v17 >= v16 >> 1)
    {
      OUTLINED_FUNCTION_2_0(v16);
      v11 = v56;
    }
    *(_QWORD *)(v11 + 16) = v17 + 1;
    v49 = v11;
    v18 = v11 + 16 * v17;
    *(_QWORD *)(v18 + 32) = v7;
    *(_QWORD *)(v18 + 40) = v9;
  }
  else
  {
    v49 = v11;
  }
  swift_release();
  type metadata accessor for NullService();
  v19 = OUTLINED_FUNCTION_3_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE038);
  v20 = swift_initStackObject();
  *(_OWORD *)(v20 + 16) = xmmword_249978AF0;
  v21 = (_QWORD *)sub_2499777F0();
  v22 = sub_249971B90();
  swift_retain();
  *(_QWORD *)(v20 + 32) = sub_2499777E4();
  v23 = v20 + 32;
  v24 = MEMORY[0x24BEBEF88];
  *(_QWORD *)(v20 + 56) = v21;
  *(_QWORD *)(v20 + 64) = v24;
  sub_249977850();
  OUTLINED_FUNCTION_0_1();
  v25 = sub_249977844();
  v26 = MEMORY[0x24BEBF138];
  *(_QWORD *)(v20 + 96) = v21;
  *(_QWORD *)(v20 + 104) = v26;
  *(_QWORD *)(v20 + 72) = v25;
  sub_249977838();
  OUTLINED_FUNCTION_0_1();
  v54 = v22;
  v27 = sub_24997782C();
  v28 = MEMORY[0x24BEBF038];
  *(_QWORD *)(v20 + 136) = v21;
  *(_QWORD *)(v20 + 144) = v28;
  *(_QWORD *)(v20 + 112) = v27;
  if (qword_2578ADED0 != -1)
LABEL_30:
    swift_once();
  v29 = v52;
  v30 = __swift_project_value_buffer(v52, (uint64_t)qword_2578AEC30);
  v31 = (void (*)(char *, uint64_t, uint64_t))*((_QWORD *)v51 + 2);
  v50 = v30;
  v51 = v31;
  v32 = v53;
  v31(v53, v30, v29);
  v33 = sub_2499777D8();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1();
  v34 = sub_2499777CC();
  v35 = MEMORY[0x24BEBEF68];
  *(_QWORD *)(v20 + 176) = v33;
  *(_QWORD *)(v20 + 184) = v35;
  *(_QWORD *)(v20 + 152) = v34;
  v51(v32, v50, v29);
  v36 = sub_2499777B4();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1();
  v37 = sub_2499777A8();
  v38 = MEMORY[0x24BEBEF28];
  *(_QWORD *)(v20 + 216) = v36;
  *(_QWORD *)(v20 + 224) = v38;
  *(_QWORD *)(v20 + 192) = v37;
  sub_24997776C();
  OUTLINED_FUNCTION_0_1();
  v53 = (char *)v19;
  v39 = sub_249977760();
  v19 = 0;
  v40 = MEMORY[0x24BEBEEE0];
  *(_QWORD *)(v20 + 256) = v21;
  *(_QWORD *)(v20 + 264) = v40;
  *(_QWORD *)(v20 + 232) = v39;
  v58[0] = v10;
  do
  {
    if (v19 >= *(_QWORD *)(v20 + 16))
    {
      __break(1u);
      goto LABEL_30;
    }
    sub_249971BE8(v23, (uint64_t)&v56);
    v21 = __swift_project_boxed_opaque_existential_1(&v56, v57);
    if ((sub_249977820() & a1) != 0)
    {
      sub_249971C50(&v56, (uint64_t)v55);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        v21 = v58;
        sub_249971B58(0, *(_QWORD *)(v10 + 16) + 1, 1);
      }
      v10 = v58[0];
      v42 = *(_QWORD *)(v58[0] + 16);
      v41 = *(_QWORD *)(v58[0] + 24);
      if (v42 >= v41 >> 1)
      {
        v21 = v58;
        sub_249971B58((_QWORD *)(v41 > 1), v42 + 1, 1);
        v10 = v58[0];
      }
      *(_QWORD *)(v10 + 16) = v42 + 1;
      sub_249971C50(v55, v10 + 40 * v42 + 32);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v56);
    }
    ++v19;
    v23 += 40;
  }
  while (v19 != 6);
  swift_setDeallocating();
  sub_249971AC0();
  v43 = v58[0];
  v44 = *(_QWORD *)(v58[0] + 16);
  if (v44)
  {
    v45 = v58[0] + 32;
    swift_retain();
    do
    {
      sub_249971BE8(v45, (uint64_t)&v56);
      __swift_project_boxed_opaque_existential_1(&v56, v57);
      sub_249977814();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v56);
      v45 += 40;
      --v44;
    }
    while (v44);
    swift_release();
  }
  OUTLINED_FUNCTION_3_0();
  v46 = sub_2499715FC(v49, v43);
  swift_release();
  return v46;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BCFC074]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *sub_249971524()
{
  _QWORD *v0;

  v0[2] = 0x3FF0000000000000;
  v0[3] = 0;
  v0[4] = 0;
  v0[5] = 0x3FF0000000000000;
  v0[7] = 0;
  v0[8] = 0;
  v0[6] = 0;
  sub_249977748();
  sub_249977754();
  v0[9] = sub_249977754();
  return v0;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BCFC080](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2499715B0()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = MEMORY[0x24BEE4B08];
  *(_BYTE *)(v0 + 24) = -1;
  *(_QWORD *)(v0 + 32) = 0;
  sub_24997773C();
  sub_249977754();
  *(_QWORD *)(v0 + 40) = sub_249977754();
  return v0;
}

uint64_t sub_2499715FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _OWORD v13[3];

  *(_QWORD *)(v2 + 96) = 0x3FF0000000000000;
  *(_QWORD *)(v2 + 104) = 0;
  *(_QWORD *)(v2 + 112) = 0;
  *(_QWORD *)(v2 + 128) = 0;
  *(_QWORD *)(v2 + 136) = 0;
  *(_QWORD *)(v2 + 120) = 0x3FF0000000000000;
  *(_BYTE *)(v2 + 144) = -1;
  *(_QWORD *)(v2 + 160) = 0;
  *(_QWORD *)(v2 + 152) = 0;
  *(_QWORD *)(v2 + 40) = __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE068);
  v5 = MEMORY[0x24BEE12C8];
  *(_QWORD *)(v2 + 48) = sub_249972048(&qword_2578AE070, &qword_2578AE068, MEMORY[0x24BEE12C8]);
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 80) = __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE078);
  *(_QWORD *)(v2 + 88) = sub_249972048(&qword_2578AE080, &qword_2578AE078, v5);
  *(_QWORD *)(v2 + 56) = a2;
  swift_beginAccess();
  v6 = *(_OWORD *)(v2 + 112);
  v7 = *(_OWORD *)(v2 + 128);
  v13[0] = *(_OWORD *)(v2 + 96);
  v13[1] = v6;
  v13[2] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2499717C4((uint64_t)v13);
  swift_beginAccess();
  sub_249971898(*(unsigned __int8 *)(v2 + 144));
  swift_beginAccess();
  v8 = *(void **)(v2 + 152);
  v9 = v8;
  sub_24997196C(v8, &qword_2578AE098);

  swift_beginAccess();
  v10 = *(void **)(v2 + 160);
  v11 = v10;
  sub_24997196C(v10, &qword_2578AE088);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v2;
}

uint64_t sub_2499717C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t ObjectType;
  void (*v8)(uint64_t, uint64_t, uint64_t);

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 40));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE0A8);
  v3 = sub_2499778BC();
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    v5 = (uint64_t *)(v3 + 40);
    do
    {
      v6 = *v5;
      ObjectType = swift_getObjectType();
      v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
      swift_unknownObjectRetain();
      v8(a1, ObjectType, v6);
      swift_unknownObjectRelease();
      v5 += 2;
      --v4;
    }
    while (v4);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_249971898(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t ObjectType;
  void (*v8)(uint64_t, uint64_t, uint64_t);

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 40));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE0A0);
  v3 = sub_2499778BC();
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    v5 = (uint64_t *)(v3 + 40);
    do
    {
      v6 = *v5;
      ObjectType = swift_getObjectType();
      v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
      swift_unknownObjectRetain();
      v8(a1, ObjectType, v6);
      swift_unknownObjectRelease();
      v5 += 2;
      --v4;
    }
    while (v4);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_24997196C(void *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t ObjectType;
  void (*v10)(void *, uint64_t, uint64_t);
  id v11;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 40));
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v5 = sub_2499778BC();
  v6 = *(_QWORD *)(v5 + 16);
  if (v6)
  {
    v7 = (uint64_t *)(v5 + 40);
    do
    {
      v8 = *v7;
      ObjectType = swift_getObjectType();
      v10 = *(void (**)(void *, uint64_t, uint64_t))(v8 + 16);
      swift_unknownObjectRetain();
      v11 = a1;
      v10(a1, ObjectType, v8);
      swift_unknownObjectRelease();
      v7 += 2;
      --v6;
    }
    while (v6);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_249971A44(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE090);
  __swift_instantiateConcreteTypeFromMangledName(a3);
  if (swift_dynamicCast())
    return v5;
  else
    return 0;
}

uint64_t sub_249971AC0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE0B0);
  swift_arrayDestroy();
  return swift_deallocClassInstance();
}

char *sub_249971B10(char *result, uint64_t a2, char *a3)
{
  if (a3 != result || &result[4 * a2] <= a3)
    return (char *)OUTLINED_FUNCTION_1_0(a3, result);
  return result;
}

char *sub_249971B30(char *result, uint64_t a2, char *a3)
{
  if (a3 != result || &result[24 * a2] <= a3)
    return (char *)OUTLINED_FUNCTION_1_0(a3, result);
  return result;
}

_QWORD *sub_249971B58(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_249971CE0(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_249971B74(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_249971E04(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

unint64_t sub_249971B90()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2578AE040;
  if (!qword_2578AE040)
  {
    v1 = type metadata accessor for NullService();
    result = MEMORY[0x24BCFC08C](&unk_249978D5C, v1);
    atomic_store(result, (unint64_t *)&qword_2578AE040);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_249971BE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_249971C50(__int128 *a1, uint64_t a2)
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

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_QWORD *sub_249971C88(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_249971F24(a1, a2, a3, *v3, &qword_2578AE048, &qword_2578AE050);
  *v3 = result;
  return result;
}

_QWORD *sub_249971CB4(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_249971F24(a1, a2, a3, *v3, &qword_2578AE058, &qword_2578AE060);
  *v3 = result;
  return result;
}

_QWORD *sub_249971CE0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE038);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &a4[5 * v8 + 4] <= v10 + 4)
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE0B0);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

_QWORD *sub_249971E04(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE010);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &a4[2 * v8 + 4] <= v10 + 4)
      memmove(v10 + 4, a4 + 4, 16 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE090);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

_QWORD *sub_249971F24(_QWORD *result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  char v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;

  v8 = (char)result;
  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v13 = (_QWORD *)OUTLINED_FUNCTION_3_0();
    v14 = _swift_stdlib_malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 24);
  }
  else
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v8 & 1) != 0)
  {
    if (v13 != a4 || &a4[3 * v11 + 4] <= v13 + 4)
      memmove(v13 + 4, a4 + 4, 24 * v11);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v13;
}

uint64_t sub_249972048(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24BCFC08C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_249972088@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2499720C0(a1, &qword_2578AE088, a2);
}

uint64_t sub_2499720A4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2499720C0(a1, &qword_2578AE098, a2);
}

uint64_t sub_2499720C0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v6;

  result = sub_249971A44(*a1, a1[1], a2);
  if (!v3)
  {
    *a3 = result;
    a3[1] = v6;
  }
  return result;
}

uint64_t sub_2499720F4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2499720C0(a1, &qword_2578AE0A0, a2);
}

uint64_t sub_249972110@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2499720C0(a1, &qword_2578AE0A8, a2);
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return swift_retain();
}

void *OUTLINED_FUNCTION_1_0@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  size_t v2;

  return memmove(__dst, a2, v2);
}

_QWORD *OUTLINED_FUNCTION_2_0@<X0>(unint64_t a1@<X8>)
{
  int64_t v1;

  return sub_249971B74((_QWORD *)(a1 > 1), v1, 1);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return swift_allocObject();
}

uint64_t DigitizerEventTranslator.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  DigitizerEventTranslator.init()();
  return v0;
}

_QWORD *DigitizerEventTranslator.init()()
{
  _QWORD *v0;

  v0[2] = 0x3FF0000000000000;
  v0[3] = 0;
  v0[4] = 0;
  v0[5] = 0x3FF0000000000000;
  v0[7] = 0;
  v0[8] = 0;
  v0[6] = 0;
  sub_249977748();
  sub_249977754();
  v0[9] = sub_249977754();
  return v0;
}

void sub_2499721F0(_OWORD *a1@<X8>)
{
  _OWORD *v1;
  __int128 v3;

  OUTLINED_FUNCTION_0_2();
  v3 = v1[2];
  *a1 = v1[1];
  a1[1] = v3;
  a1[2] = v1[3];
  OUTLINED_FUNCTION_1_1();
}

void sub_24997222C(_OWORD *a1)
{
  _OWORD *v1;
  __int128 v3;

  OUTLINED_FUNCTION_0_2();
  v3 = a1[1];
  v1[1] = *a1;
  v1[2] = v3;
  v1[3] = a1[2];
  OUTLINED_FUNCTION_1_1();
}

uint64_t (*sub_249972268())()
{
  OUTLINED_FUNCTION_0_2();
  return j_j__swift_endAccess;
}

void sub_2499722A0(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_249972308((uint64_t)v1);
}

void *sub_2499722CC()
{
  uint64_t v0;
  void *v1;
  id v2;

  OUTLINED_FUNCTION_0_2();
  v1 = *(void **)(v0 + 64);
  v2 = v1;
  return v1;
}

void sub_249972308(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  OUTLINED_FUNCTION_0_2();
  v3 = *(void **)(v1 + 64);
  *(_QWORD *)(v1 + 64) = a1;

  OUTLINED_FUNCTION_1_1();
}

uint64_t (*sub_249972340())()
{
  OUTLINED_FUNCTION_0_2();
  return j__swift_endAccess;
}

uint64_t DigitizerEventTranslator.eventMask.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 72);
}

uint64_t sub_249972384(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t KeyPath;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  void *v25;
  void (*v26)(uint64_t, uint64_t);
  id v27;
  _QWORD v29[4];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v4 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  if (OUTLINED_FUNCTION_8(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 40)))
    return MEMORY[0x24BEE4AF8];
  v5 = sub_2499722CC();
  v32 = v1;
  v33 = a1;
  if (!v5)
  {
    v11 = OUTLINED_FUNCTION_8(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 56));
    if (!v11)
    {
      OUTLINED_FUNCTION_7();
      v12 = OUTLINED_FUNCTION_6();
      if (!MEMORY[0x24BCFBC24](v12, a1))
        goto LABEL_12;
      v13 = OUTLINED_FUNCTION_5();
      v11 = sub_2499733FC(v12, a1, *(_QWORD *)(v13 + 8));
    }
    v10 = v11;
    goto LABEL_13;
  }
  v6 = v5;
  v7 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v3 + 64))(v5, v4, v3);
  if (!v7)
  {
    OUTLINED_FUNCTION_7();
    v8 = OUTLINED_FUNCTION_6();
    if (MEMORY[0x24BCFBC24](v8, a1))
    {
      v9 = OUTLINED_FUNCTION_5();
      v7 = sub_2499733FC(v8, a1, *(_QWORD *)(v9 + 8));
      goto LABEL_6;
    }

LABEL_12:
    v11 = swift_bridgeObjectRelease();
    v10 = MEMORY[0x24BEE4B08];
    goto LABEL_13;
  }
LABEL_6:
  v10 = v7;

LABEL_13:
  v34 = v10;
  MEMORY[0x24BDAC7A8](v11);
  v31 = v3;
  KeyPath = swift_getKeyPath();
  v29[2] = v4;
  v29[3] = v3;
  v30 = MEMORY[0x24BDAC7A8](KeyPath);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v15 = sub_249977934();
  type metadata accessor for TouchType(0);
  v17 = v16;
  v18 = MEMORY[0x24BCFC08C](MEMORY[0x24BEE1728], v15);
  v20 = sub_2499728C0((void (*)(char *, char *))sub_249973714, (uint64_t)v29, v15, v17, MEMORY[0x24BEE4078], v18, MEMORY[0x24BEE40A8], v19);
  swift_release();
  v21 = sub_249972C9C(v20);
  v22 = sub_24997329C((uint64_t)&unk_251AD1F60);
  v23 = sub_249972D3C(v21, v22);
  OUTLINED_FUNCTION_9();
  swift_bridgeObjectRelease();
  if ((v23 & 1) != 0)
  {
    v34 = v10;
    sub_2499728C0((void (*)(char *, char *))sub_24997373C, v32, v15, MEMORY[0x24BEBEF48], MEMORY[0x24BEE4078], v18, MEMORY[0x24BEE40A8], v24);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v3 + 48))(v4, v3);
    sub_24997785C();
    sub_249977778();
    LODWORD(v30) = 0;
    v25 = (void *)sub_2499777C0();
    v26 = *(void (**)(uint64_t, uint64_t))(v3 + 72);
    v27 = v25;
    v26(v4, v3);
    v34 = (uint64_t)v27;
    OUTLINED_FUNCTION_4_1();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_249972824@<X0>(uint64_t *a1@<X8>)
{
  uint64_t AssociatedConformanceWitness;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t result;

  swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v3 = *(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 32);
  v4 = swift_checkMetadataState();
  result = v3(v4, AssociatedConformanceWitness);
  *a1 = result;
  return result;
}

uint64_t sub_2499728C0(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  void (*v25)(char *, _QWORD);
  void (*v26)(char *);
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t AssociatedTypeWitness;
  void (*v45)(char *, char *);
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char v50[32];
  uint64_t v51;

  v37 = a5;
  v38 = a8;
  v45 = a1;
  v46 = a2;
  v36 = *(_QWORD *)(a5 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v47 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v13 = (char *)&v34 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = swift_getAssociatedTypeWitness();
  v39 = *(_QWORD *)(v16 - 8);
  v40 = v16;
  v17 = MEMORY[0x24BDAC7A8](v16);
  v35 = (char *)&v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v34 - v19;
  v21 = sub_24997794C();
  if (!v21)
    return sub_2499778EC();
  v22 = v21;
  v51 = sub_249977A60();
  v41 = sub_249977A6C();
  sub_249977A24();
  v43 = a6;
  result = sub_249977940();
  if ((v22 & 0x8000000000000000) == 0)
  {
    v24 = v22;
    v42 = v15;
    while (v24)
    {
      v48 = v24;
      v25 = (void (*)(char *, _QWORD))sub_249977964();
      v26 = *(void (**)(char *))(v10 + 16);
      v27 = v10;
      v28 = AssociatedTypeWitness;
      v26(v13);
      v25(v50, 0);
      v29 = v20;
      v30 = v49;
      v45(v13, v47);
      if (v30)
      {
        (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v28);
        (*(void (**)(char *, uint64_t))(v39 + 8))(v20, v40);
        swift_release();
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v36 + 32))(v38, v47, v37);
      }
      v49 = 0;
      (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v28);
      sub_249977A54();
      result = sub_249977958();
      v24 = v48 - 1;
      v10 = v27;
      if (v48 == 1)
      {
        v32 = v39;
        v31 = v40;
        v33 = v35;
        (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v35, v29, v40);
        sub_2499779B8();
        (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v31);
        return v51;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_249972C10(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int16 v7;
  uint64_t v8;

  sub_2499738C4();
  v2 = sub_249977928();
  v8 = v2;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = a1 + 34;
    do
    {
      sub_249973900(&v7, *(unsigned int *)(v4 - 2));
      v4 += 4;
      --v3;
    }
    while (v3);
    OUTLINED_FUNCTION_9();
    return v8;
  }
  else
  {
    v5 = v2;
    OUTLINED_FUNCTION_9();
  }
  return v5;
}

uint64_t sub_249972C9C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  type metadata accessor for TouchType(0);
  sub_249974980();
  v2 = sub_249977928();
  v9 = v2;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    for (i = 0; i != v3; ++i)
    {
      v5 = *(_QWORD *)(a1 + 8 * i + 32);
      sub_249973A58(&v8, v5);
    }
    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    v6 = v2;
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_249972D3C(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (result == a2)
    return 1;
  v3 = result;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v4 = 0;
  v5 = result + 56;
  v6 = 1 << *(_BYTE *)(result + 32);
  if (v6 < 64)
    v7 = ~(-1 << v6);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(result + 56);
  v9 = (unint64_t)(v6 + 63) >> 6;
  v10 = a2 + 56;
  do
  {
LABEL_7:
    if (v8)
    {
      v11 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v12 = v11 | (v4 << 6);
      goto LABEL_25;
    }
    v13 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
LABEL_35:
      __break(1u);
      return result;
    }
    if (v13 >= v9)
      return 1;
    v14 = *(_QWORD *)(v5 + 8 * v13);
    ++v4;
    if (v14)
      goto LABEL_24;
    v4 = v13 + 1;
    if (v13 + 1 >= v9)
      return 1;
    v14 = *(_QWORD *)(v5 + 8 * v4);
    if (v14)
      goto LABEL_24;
    v4 = v13 + 2;
    if (v13 + 2 >= v9)
      return 1;
    v14 = *(_QWORD *)(v5 + 8 * v4);
    if (v14)
      goto LABEL_24;
    v4 = v13 + 3;
    if (v13 + 3 >= v9)
      return 1;
    v14 = *(_QWORD *)(v5 + 8 * v4);
    if (v14)
      goto LABEL_24;
    v15 = v13 + 4;
    if (v15 >= v9)
      return 1;
    v14 = *(_QWORD *)(v5 + 8 * v15);
    if (!v14)
    {
      while (1)
      {
        v4 = v15 + 1;
        if (__OFADD__(v15, 1))
          goto LABEL_35;
        if (v4 >= v9)
          return 1;
        v14 = *(_QWORD *)(v5 + 8 * v4);
        ++v15;
        if (v14)
          goto LABEL_24;
      }
    }
    v4 = v15;
LABEL_24:
    v8 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v4 << 6);
LABEL_25:
    v16 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v12);
    sub_249977A90();
    sub_249977A9C();
    result = sub_249977AA8();
    v17 = -1 << *(_BYTE *)(a2 + 32);
    v18 = result & ~v17;
    if (((*(_QWORD *)(v10 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) == 0)
      return 0;
    v19 = *(_QWORD *)(a2 + 48);
  }
  while (*(_QWORD *)(v19 + 8 * v18) == v16);
  v20 = ~v17;
  while (1)
  {
    v18 = (v18 + 1) & v20;
    if (((*(_QWORD *)(v10 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) == 0)
      return 0;
    if (*(_QWORD *)(v19 + 8 * v18) == v16)
      goto LABEL_7;
  }
}

uint64_t sub_249972F30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t AssociatedConformanceWitness;
  double (*v3)(_QWORD, uint64_t, uint64_t);
  uint64_t v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  uint64_t result;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGPoint v11;

  swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v3 = *(double (**)(_QWORD, uint64_t, uint64_t))(AssociatedConformanceWitness + 40);
  v4 = swift_checkMetadataState();
  v5 = v3(0, v4, AssociatedConformanceWitness);
  v7 = v6;
  sub_2499721F0(&v10);
  v9 = v10;
  v11.x = v5;
  v11.y = v7;
  CGPointApplyAffineTransform(v11, &v9);
  sub_2499730E4();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(v4, AssociatedConformanceWitness);
  sub_24997785C();
  sub_249977784();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 48))(v4, AssociatedConformanceWitness);
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 56))(v4, AssociatedConformanceWitness);
  result = sub_2499777C0();
  *a1 = result;
  return result;
}

uint64_t sub_2499730E4()
{
  uint64_t AssociatedConformanceWitness;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  unint64_t v3;

  swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v1 = *(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24);
  v2 = swift_checkMetadataState();
  v3 = v1(v2, AssociatedConformanceWitness);
  return (v3 < 8) & (0xE7u >> v3);
}

uint64_t DigitizerEventTranslator.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t DigitizerEventTranslator.__deallocating_deinit()
{
  DigitizerEventTranslator.deinit();
  return swift_deallocClassInstance();
}

uint64_t (*sub_2499731DC(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_249972268();
  return sub_249973220;
}

uint64_t (*sub_24997322C(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_249972340();
  return sub_249973220;
}

void sub_249973270(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_24997329C(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = MEMORY[0x24BEE4B08];
    goto LABEL_16;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE170);
  result = sub_2499779DC();
  v3 = result;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return v3;
  }
  v5 = 0;
  v6 = result + 56;
  while (v5 < *(_QWORD *)(a1 + 16))
  {
    v7 = *(_QWORD *)(a1 + 32 + 8 * v5);
    sub_249977A90();
    sub_249977A9C();
    result = sub_249977AA8();
    v8 = -1 << *(_BYTE *)(v3 + 32);
    v9 = result & ~v8;
    v10 = v9 >> 6;
    v11 = *(_QWORD *)(v6 + 8 * (v9 >> 6));
    v12 = 1 << v9;
    v13 = *(_QWORD *)(v3 + 48);
    if (((1 << v9) & v11) != 0)
    {
      if (*(_QWORD *)(v13 + 8 * v9) == v7)
        goto LABEL_13;
      v14 = ~v8;
      while (1)
      {
        v9 = (v9 + 1) & v14;
        v10 = v9 >> 6;
        v11 = *(_QWORD *)(v6 + 8 * (v9 >> 6));
        v12 = 1 << v9;
        if ((v11 & (1 << v9)) == 0)
          break;
        if (*(_QWORD *)(v13 + 8 * v9) == v7)
          goto LABEL_13;
      }
    }
    *(_QWORD *)(v6 + 8 * v10) = v12 | v11;
    *(_QWORD *)(v13 + 8 * v9) = v7;
    v15 = *(_QWORD *)(v3 + 16);
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_18;
    *(_QWORD *)(v3 + 16) = v17;
LABEL_13:
    if (++v5 == v4)
      goto LABEL_16;
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_2499733FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
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
  char v17;
  uint64_t (*v18)(char *, unint64_t, uint64_t);
  uint64_t result;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  void (*v33)(char *, uint64_t);
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;

  v5 = a1;
  v45 = *(_QWORD *)(a2 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v44 = (char *)&v37 - v10;
  v37 = v11;
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v37 - v13;
  if (MEMORY[0x24BCFBC18](v12))
  {
    sub_2499779E8();
    v15 = sub_2499779DC();
  }
  else
  {
    v15 = MEMORY[0x24BEE4B08];
  }
  v40 = MEMORY[0x24BCFBC24](v5, a2);
  if (v40)
  {
    v16 = 0;
    v43 = v15 + 56;
    v38 = v14;
    v39 = v5;
    while (1)
    {
      v17 = sub_2499778F8();
      sub_2499778E0();
      if ((v17 & 1) != 0)
      {
        v18 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v45 + 16);
        result = v18(v14, v5+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(_QWORD *)(v45 + 72) * v16, a2);
      }
      else
      {
        result = sub_2499779F4();
        if (v37 != 8)
          goto LABEL_24;
        v46 = result;
        v18 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v45 + 16);
        v18(v14, (unint64_t)&v46, a2);
        result = swift_unknownObjectRelease();
      }
      v20 = __OFADD__(v16, 1);
      v21 = v16 + 1;
      if (v20)
        break;
      v22 = v45;
      v41 = *(void (**)(char *, char *, uint64_t))(v45 + 32);
      v42 = v21;
      v41(v44, v14, a2);
      v23 = sub_249977898();
      v24 = -1 << *(_BYTE *)(v15 + 32);
      v25 = v23 & ~v24;
      v26 = v25 >> 6;
      v27 = *(_QWORD *)(v43 + 8 * (v25 >> 6));
      v28 = 1 << v25;
      v29 = *(_QWORD *)(v22 + 72);
      if (((1 << v25) & v27) != 0)
      {
        v30 = ~v24;
        while (1)
        {
          v18(v8, *(_QWORD *)(v15 + 48) + v29 * v25, a2);
          v31 = a3;
          v32 = sub_2499778A4();
          v33 = *(void (**)(char *, uint64_t))(v45 + 8);
          v33(v8, a2);
          if ((v32 & 1) != 0)
            break;
          v25 = (v25 + 1) & v30;
          v26 = v25 >> 6;
          v27 = *(_QWORD *)(v43 + 8 * (v25 >> 6));
          v28 = 1 << v25;
          a3 = v31;
          if ((v27 & (1 << v25)) == 0)
          {
            v14 = v38;
            v5 = v39;
            goto LABEL_14;
          }
        }
        v33(v44, a2);
        a3 = v31;
        v14 = v38;
        v5 = v39;
      }
      else
      {
LABEL_14:
        v34 = v44;
        *(_QWORD *)(v43 + 8 * v26) = v28 | v27;
        result = ((uint64_t (*)(unint64_t, char *, uint64_t))v41)(*(_QWORD *)(v15 + 48) + v29 * v25, v34, a2);
        v35 = *(_QWORD *)(v15 + 16);
        v20 = __OFADD__(v35, 1);
        v36 = v35 + 1;
        if (v20)
          goto LABEL_23;
        *(_QWORD *)(v15 + 16) = v36;
      }
      v16 = v42;
      if (v42 == v40)
        goto LABEL_21;
    }
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
  }
  else
  {
LABEL_21:
    swift_bridgeObjectRelease();
    return v15;
  }
  return result;
}

uint64_t sub_249973714()
{
  return swift_getAtKeyPath();
}

uint64_t sub_24997373C@<X0>(uint64_t *a1@<X8>)
{
  return sub_249972F30(a1);
}

void sub_249973758(_OWORD *a1@<X8>)
{
  sub_2499721F0(a1);
  OUTLINED_FUNCTION_0();
}

void sub_249973774(_OWORD *a1)
{
  sub_24997222C(a1);
  OUTLINED_FUNCTION_0();
}

void sub_249973798(void **a1@<X8>)
{
  *a1 = sub_2499722CC();
  OUTLINED_FUNCTION_0();
}

uint64_t sub_2499737CC()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for DigitizerEventTranslator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DigitizerEventTranslator);
}

uint64_t method lookup function for DigitizerEventTranslator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DigitizerEventTranslator.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of DigitizerEventTranslator.coordinateTransform.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of DigitizerEventTranslator.coordinateTransform.setter(_OWORD *a1)
{
  uint64_t v1;
  uint64_t (*v2)(_OWORD *);
  __int128 v3;
  _OWORD v5[3];

  v2 = *(uint64_t (**)(_OWORD *))(*(_QWORD *)v1 + 136);
  v3 = a1[1];
  v5[0] = *a1;
  v5[1] = v3;
  v5[2] = a1[2];
  return v2(v5);
}

uint64_t dispatch thunk of DigitizerEventTranslator.coordinateTransform.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of DigitizerEventTranslator.touchesFilter.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of DigitizerEventTranslator.touchesFilter.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of DigitizerEventTranslator.touchesFilter.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of DigitizerEventTranslator.translateEvent(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

unint64_t sub_2499738C4()
{
  unint64_t result;

  result = qword_2578AE160;
  if (!qword_2578AE160)
  {
    result = MEMORY[0x24BCFC08C](MEMORY[0x24BEBF170], MEMORY[0x24BEBF168]);
    atomic_store(result, (unint64_t *)&qword_2578AE160);
  }
  return result;
}

uint64_t sub_249973900(_WORD *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  _WORD *v11;
  unsigned int v12;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;

  v5 = *v2;
  sub_249977A90();
  swift_bridgeObjectRetain();
  sub_249977874();
  v6 = sub_249977AA8();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    v12 = WORD1(a2);
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v14 = *v2;
    *v2 = 0x8000000000000000;
    sub_2499740F4(a2, v8, isUniquelyReferenced_nonNull_native);
    *v2 = v14;
    swift_bridgeObjectRelease();
    result = 1;
    goto LABEL_8;
  }
  if ((sub_249977868() & 1) == 0)
  {
    v9 = ~v7;
    do
    {
      v8 = (v8 + 1) & v9;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_7;
    }
    while ((sub_249977868() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  result = 0;
  v11 = (_WORD *)(*(_QWORD *)(*v2 + 48) + 4 * v8);
  LOWORD(a2) = *v11;
  LOWORD(v12) = v11[1];
LABEL_8:
  *a1 = a2;
  a1[1] = v12;
  return result;
}

uint64_t sub_249973A58(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;

  v5 = *v2;
  sub_249977A90();
  sub_249977A9C();
  v6 = sub_249977AA8();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v13 = *v2;
    *v2 = 0x8000000000000000;
    sub_24997424C(a2, v8, isUniquelyReferenced_nonNull_native);
    *v2 = v13;
    swift_bridgeObjectRelease();
    result = 1;
    goto LABEL_8;
  }
  v9 = *(_QWORD *)(v5 + 48);
  if (*(_QWORD *)(v9 + 8 * v8) != a2)
  {
    v10 = ~v7;
    do
    {
      v8 = (v8 + 1) & v10;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_7;
    }
    while (*(_QWORD *)(v9 + 8 * v8) != a2);
  }
  result = 0;
  a2 = *(_QWORD *)(*(_QWORD *)(*v2 + 48) + 8 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_249973B74()
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
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  __int16 *v17;
  __int16 v18;
  __int16 v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _WORD *v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE168);
  v3 = sub_2499779D0();
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
    if (!v7)
      goto LABEL_7;
LABEL_6:
    v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      v17 = (__int16 *)(*(_QWORD *)(v2 + 48) + 4 * i);
      v18 = *v17;
      v19 = v17[1];
      sub_249977A90();
      sub_249977874();
      result = sub_249977AA8();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          v26 = v22 == v25;
          if (v22 == v25)
            v22 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      v28 = (_WORD *)(*(_QWORD *)(v4 + 48) + 4 * v23);
      *v28 = v18;
      v28[1] = v19;
      ++*(_QWORD *)(v4 + 16);
      if (v7)
        goto LABEL_6;
LABEL_7:
      v14 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_38;
      if (v14 >= v8)
        goto LABEL_32;
      v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        v11 = v14 + 1;
        if (v14 + 1 >= v8)
          goto LABEL_32;
        v15 = v30[v11];
        if (!v15)
        {
          v11 = v14 + 2;
          if (v14 + 2 >= v8)
            goto LABEL_32;
          v15 = v30[v11];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              v1 = v0;
              v29 = 1 << *(_BYTE *)(v2 + 32);
              if (v29 > 63)
                sub_249974398(0, (unint64_t)(v29 + 63) >> 6, v30);
              else
                *v30 = -1 << v29;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                v11 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_39;
                if (v11 >= v8)
                  goto LABEL_32;
                v15 = v30[v11];
                ++v16;
                if (v15)
                  goto LABEL_20;
              }
            }
            v11 = v16;
          }
        }
      }
LABEL_20:
      v7 = (v15 - 1) & v15;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_249973E50()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE170);
  result = sub_2499779D0();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v6 = (_QWORD *)(v2 + 56);
    v7 = 1 << *(_BYTE *)(v2 + 32);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v2 + 56);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = result + 56;
    if (!v9)
      goto LABEL_7;
LABEL_6:
    v12 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    for (i = v12 | (v5 << 6); ; i = __clz(__rbit64(v15)) + (v5 << 6))
    {
      v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
      sub_249977A90();
      sub_249977A9C();
      result = sub_249977AA8();
      v18 = -1 << *(_BYTE *)(v4 + 32);
      v19 = result & ~v18;
      v20 = v19 >> 6;
      if (((-1 << v19) & ~*(_QWORD *)(v11 + 8 * (v19 >> 6))) == 0)
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v18) >> 6;
        while (++v20 != v23 || (v22 & 1) == 0)
        {
          v24 = v20 == v23;
          if (v20 == v23)
            v20 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v11 + 8 * v20);
          if (v25 != -1)
          {
            v21 = __clz(__rbit64(~v25)) + (v20 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      v21 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v11 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v11 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v21) = v17;
      ++*(_QWORD *)(v4 + 16);
      if (v9)
        goto LABEL_6;
LABEL_7:
      v14 = v5 + 1;
      if (__OFADD__(v5, 1))
        goto LABEL_38;
      if (v14 >= v10)
        goto LABEL_32;
      v15 = v6[v14];
      ++v5;
      if (!v15)
      {
        v5 = v14 + 1;
        if (v14 + 1 >= v10)
          goto LABEL_32;
        v15 = v6[v5];
        if (!v15)
        {
          v5 = v14 + 2;
          if (v14 + 2 >= v10)
            goto LABEL_32;
          v15 = v6[v5];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v10)
            {
LABEL_32:
              v26 = 1 << *(_BYTE *)(v2 + 32);
              if (v26 > 63)
                sub_249974398(0, (unint64_t)(v26 + 63) >> 6, (_QWORD *)(v2 + 56));
              else
                *v6 = -1 << v26;
              v1 = v0;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v15 = v6[v16];
            if (!v15)
            {
              while (1)
              {
                v5 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_39;
                if (v5 >= v10)
                  goto LABEL_32;
                v15 = v6[v5];
                ++v16;
                if (v15)
                  goto LABEL_20;
              }
            }
            v5 = v16;
          }
        }
      }
LABEL_20:
      v9 = (v15 - 1) & v15;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_2499740F4(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  int v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_249973B74();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_2499743B4();
      goto LABEL_14;
    }
    sub_2499746DC();
  }
  v8 = *v3;
  sub_249977A90();
  sub_249977874();
  result = sub_249977AA8();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    result = sub_249977868();
    if ((result & 1) != 0)
    {
LABEL_13:
      result = sub_249977A84();
      __break(1u);
    }
    else
    {
      v10 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v10;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        result = sub_249977868();
        if ((result & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v11 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_DWORD *)(*(_QWORD *)(v11 + 48) + 4 * a2) = v5;
  v12 = *(_QWORD *)(v11 + 16);
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    *(_QWORD *)(v11 + 16) = v14;
  return result;
}

uint64_t sub_24997424C(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_249973E50();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_249974548();
      goto LABEL_14;
    }
    sub_2499749C0();
  }
  v8 = *v3;
  sub_249977A90();
  sub_249977A9C();
  result = sub_249977AA8();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(_QWORD *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      type metadata accessor for TouchType(0);
      result = sub_249977A84();
      __break(1u);
    }
    else
    {
      v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(_QWORD *)(v10 + 8 * a2) == v5)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v12 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v12 + 48) + 8 * a2) = v5;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(v12 + 16) = v15;
  return result;
}

uint64_t sub_249974398(uint64_t result, uint64_t a2, _QWORD *a3)
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

void *sub_2499743B4()
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

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE168);
  v2 = *v0;
  v3 = sub_2499779C4();
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
    *(_DWORD *)(*(_QWORD *)(v4 + 48) + 4 * i) = *(_DWORD *)(*(_QWORD *)(v2 + 48) + 4 * i);
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

void *sub_249974548()
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

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE170);
  v2 = *v0;
  v3 = sub_2499779C4();
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
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * i) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
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

uint64_t sub_2499746DC()
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
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  __int16 *v17;
  __int16 v18;
  __int16 v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _WORD *v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE168);
  v3 = sub_2499779D0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_34:
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
  if (!v8)
    goto LABEL_7;
LABEL_6:
  v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    v17 = (__int16 *)(*(_QWORD *)(v2 + 48) + 4 * i);
    v18 = *v17;
    v19 = v17[1];
    sub_249977A90();
    sub_249977874();
    result = sub_249977AA8();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_WORD *)(*(_QWORD *)(v4 + 48) + 4 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v4 + 16);
    if (v8)
      goto LABEL_6;
LABEL_7:
    v14 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_36;
    if (v14 >= v29)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      v11 = v14 + 1;
      if (v14 + 1 >= v29)
        goto LABEL_32;
      v15 = *(_QWORD *)(v6 + 8 * v11);
      if (!v15)
      {
        v11 = v14 + 2;
        if (v14 + 2 >= v29)
          goto LABEL_32;
        v15 = *(_QWORD *)(v6 + 8 * v11);
        if (!v15)
          break;
      }
    }
LABEL_20:
    v8 = (v15 - 1) & v15;
  }
  v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_34;
  }
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
    v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    v11 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v11 >= v29)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v11);
    ++v16;
    if (v15)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_249974980()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2578AE178;
  if (!qword_2578AE178)
  {
    type metadata accessor for TouchType(255);
    result = MEMORY[0x24BCFC08C](&unk_249978774, v1);
    atomic_store(result, (unint64_t *)&qword_2578AE178);
  }
  return result;
}

uint64_t sub_2499749C0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE170);
  result = sub_2499779D0();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_34:
    *v1 = v4;
    return result;
  }
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = result + 56;
  if (!v9)
    goto LABEL_7;
LABEL_6:
  v12 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (i = v12 | (v5 << 6); ; i = __clz(__rbit64(v15)) + (v5 << 6))
  {
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
    sub_249977A90();
    sub_249977A9C();
    result = sub_249977AA8();
    v18 = -1 << *(_BYTE *)(v4 + 32);
    v19 = result & ~v18;
    v20 = v19 >> 6;
    if (((-1 << v19) & ~*(_QWORD *)(v11 + 8 * (v19 >> 6))) == 0)
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        v24 = v20 == v23;
        if (v20 == v23)
          v20 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v11 + 8 * v20);
        if (v25 != -1)
        {
          v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v21 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v11 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v11 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v21) = v17;
    ++*(_QWORD *)(v4 + 16);
    if (v9)
      goto LABEL_6;
LABEL_7:
    v14 = v5 + 1;
    if (__OFADD__(v5, 1))
      goto LABEL_36;
    if (v14 >= v10)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v14);
    ++v5;
    if (!v15)
    {
      v5 = v14 + 1;
      if (v14 + 1 >= v10)
        goto LABEL_32;
      v15 = *(_QWORD *)(v6 + 8 * v5);
      if (!v15)
      {
        v5 = v14 + 2;
        if (v14 + 2 >= v10)
          goto LABEL_32;
        v15 = *(_QWORD *)(v6 + 8 * v5);
        if (!v15)
          break;
      }
    }
LABEL_20:
    v9 = (v15 - 1) & v15;
  }
  v16 = v14 + 3;
  if (v16 >= v10)
  {
LABEL_32:
    result = swift_release();
    v1 = v0;
    goto LABEL_34;
  }
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
    v5 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    v5 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v5 >= v10)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v5);
    ++v16;
    if (v15)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24BCFC044](a1, v6, a5);
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return swift_beginAccess();
}

__n128 OUTLINED_FUNCTION_2_1(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return 16;
}

void OUTLINED_FUNCTION_4_1()
{
  JUMPOUT(0x24BCFBB10);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return sub_2499778EC();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_8@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_9()
{
  return swift_bridgeObjectRelease();
}

uint64_t static UITouchesFilter.== infix(_:_:)(void *a1, void *a2)
{
  id v4;
  id v5;

  sub_24997056C();
  v4 = a1;
  v5 = a2;
  LOBYTE(a1) = sub_249977988();

  return a1 & 1;
}

uint64_t sub_249974D3C(void **a1, void **a2)
{
  return static UITouchesFilter.== infix(_:_:)(*a1, *a2);
}

ValueMetadata *type metadata accessor for UITouchesFilter()
{
  return &type metadata for UITouchesFilter;
}

uint64_t dispatch thunk of UITouchesFilterConfigurable.touchesFilter.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of UITouchesFilterConfigurable.touchesFilter.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of UITouchesFilterConfigurable.touchesFilter.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t KeyboardEventTranslator.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  KeyboardEventTranslator.init()();
  return v0;
}

uint64_t sub_249974DA4(void (*a1)(uint64_t *__return_ptr, int *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t result;
  _BYTE *v9;
  char v10;
  int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;

  v4 = v3;
  v6 = *(_QWORD *)(a3 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v6)
  {
    v14 = MEMORY[0x24BEE4AF8];
    sub_249977A30();
    v9 = (_BYTE *)(a3 + 36);
    while (1)
    {
      v10 = *v9;
      v11 = *((_DWORD *)v9 - 1);
      v12 = v10;
      a1(&v13, &v11);
      if (v4)
        break;
      v4 = 0;
      v9 += 6;
      sub_249977A0C();
      sub_249977A3C();
      sub_249977A48();
      sub_249977A18();
      if (!--v6)
        return v14;
    }
    return swift_release();
  }
  return result;
}

uint64_t KeyboardEventTranslator.init()()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = MEMORY[0x24BEE4B08];
  *(_BYTE *)(v0 + 24) = -1;
  *(_QWORD *)(v0 + 32) = 0;
  sub_24997773C();
  sub_249977754();
  *(_QWORD *)(v0 + 40) = sub_249977754();
  return v0;
}

uint64_t sub_249974EE4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_249974EEC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_249974EFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_beginAccess();
  v1 = sub_249970BEC(~*(_BYTE *)(v0 + 24));
  v2 = sub_249972C10(v1);
  return sub_249974EEC(v2);
}

uint64_t sub_249974F3C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_2();
  return *(unsigned __int8 *)(v0 + 24);
}

void sub_249974F68(char a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_0_2();
  *(_BYTE *)(v1 + 24) = a1;
  sub_249974EFC();
  OUTLINED_FUNCTION_1_1();
}

void (*sub_249974F9C(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  OUTLINED_FUNCTION_0_2();
  return sub_249974FD8;
}

void sub_249974FD8(uint64_t a1, char a2)
{
  swift_endAccess();
  if ((a2 & 1) == 0)
    sub_249974EFC();
  OUTLINED_FUNCTION_0();
}

void sub_249975004(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_24997506C((uint64_t)v1);
}

void *sub_249975030()
{
  uint64_t v0;
  void *v1;
  id v2;

  OUTLINED_FUNCTION_0_2();
  v1 = *(void **)(v0 + 32);
  v2 = v1;
  return v1;
}

void sub_24997506C(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  OUTLINED_FUNCTION_0_2();
  v3 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = a1;

  OUTLINED_FUNCTION_1_1();
}

uint64_t (*sub_2499750A4())()
{
  OUTLINED_FUNCTION_0_2();
  return j__swift_endAccess;
}

uint64_t KeyboardEventTranslator.eventMask.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

uint64_t sub_2499750E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = v1;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 80);
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 88);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = sub_249977994();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v25 - v10;
  v12 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v25 - v13;
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v4 + 40))(v5, v4) != 4)
    return MEMORY[0x24BEE4AF8];
  v27 = v12;
  UIEventProtocol.asPressesEvent.getter(v5, (uint64_t)v11);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    return MEMORY[0x24BEE4AF8];
  }
  v26 = a1;
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v14, v11, AssociatedTypeWitness);
  v16 = sub_249975030();
  if (v16)
  {
    v17 = v16;
    v18 = OUTLINED_FUNCTION_2_2();
    v19 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v18 + 40))(v17, AssociatedTypeWitness, v18);

  }
  else
  {
    v20 = OUTLINED_FUNCTION_2_2();
    v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 32))(AssociatedTypeWitness, v20);
  }
  v28 = v19;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v21 = sub_249977934();
  __swift_instantiateConcreteTypeFromMangledName(qword_2578AE180);
  MEMORY[0x24BCFC08C](MEMORY[0x24BEE1718], v21);
  v22 = sub_2499778BC();
  v23 = swift_bridgeObjectRelease();
  MEMORY[0x24BDAC7A8](v23);
  *(&v25 - 4) = v5;
  *(&v25 - 3) = v4;
  *(&v25 - 2) = v26;
  *(&v25 - 1) = (uint64_t)v14;
  v15 = sub_249974DA4((void (*)(uint64_t *__return_ptr, int *))sub_2499758FC, (uint64_t)(&v25 - 6), v22);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v14, AssociatedTypeWitness);
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_2499753D0@<X0>(uint64_t a1@<X1>, _DWORD *a2@<X8>)
{
  uint64_t AssociatedConformanceWitness;
  uint64_t AssociatedTypeWitness;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  _DWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char v25;
  _QWORD v26[2];
  uint64_t v27;
  _DWORD *v28;

  v28 = a2;
  v26[1] = a1;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v27 = sub_249977994();
  v4 = *(_QWORD *)(v27 - 8);
  v5 = MEMORY[0x24BDAC7A8](v27);
  v7 = (char *)v26 - v6;
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)v26 - v9;
  v11 = *(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 40);
  v12 = swift_checkMetadataState();
  v11(v12, AssociatedConformanceWitness);
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, AssociatedTypeWitness) == 1)
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v27);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v7, AssociatedTypeWitness);
    v14 = 0x100000000;
    switch((*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 32))(v12, AssociatedConformanceWitness))
    {
      case 0:
        break;
      case 3:
      case 4:
        v14 = 0;
        break;
      default:
        result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, AssociatedTypeWitness);
        goto LABEL_5;
    }
    v17 = swift_getAssociatedConformanceWitness();
    v18 = AssociatedTypeWitness;
    v19 = *(uint64_t (**)(uint64_t, uint64_t))(v17 + 8);
    v20 = v19(v18, v17);
    v21 = v19(v18, v17);
    if (v20 == 3)
      v22 = 255;
    else
      v22 = 7;
    v23 = sub_249974EE4();
    v24 = v10;
    v25 = sub_2499756BC(v22 | (v21 << 16), v23);
    swift_bridgeObjectRelease();
    result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v24, v18);
    if ((v25 & 1) == 0)
    {
      v15 = v14 | (v21 << 16) | v22;
      goto LABEL_6;
    }
  }
LABEL_5:
  v15 = 0x200000000;
LABEL_6:
  v16 = v28;
  *v28 = v15;
  *((_BYTE *)v16 + 4) = BYTE4(v15);
  return result;
}

uint64_t sub_2499756A4@<X0>(_DWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_2499753D0(v1, a1);
}

uint64_t sub_2499756BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  unint64_t v9;

  if (!*(_QWORD *)(a2 + 16))
    goto LABEL_9;
  sub_249977A90();
  sub_249977874();
  v3 = sub_249977AA8();
  v4 = -1 << *(_BYTE *)(a2 + 32);
  v5 = v3 & ~v4;
  v6 = a2 + 56;
  if (((*(_QWORD *)(a2 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) == 0)
    goto LABEL_9;
  if ((sub_249977868() & 1) != 0)
  {
    v7 = 1;
    return v7 & 1;
  }
  v8 = ~v4;
  v9 = (v5 + 1) & v8;
  if (((*(_QWORD *)(v6 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_9:
    v7 = 0;
    return v7 & 1;
  }
  do
  {
    v7 = sub_249977868();
    if ((v7 & 1) != 0)
      break;
    v9 = (v9 + 1) & v8;
  }
  while (((*(_QWORD *)(v6 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  return v7 & 1;
}

void sub_2499757BC(uint64_t a1@<X3>, uint64_t a2@<X4>, _QWORD *a3@<X8>)
{
  void *v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  id v7;
  uint64_t v8;
  void *v9;

  (*(void (**)(uint64_t, uint64_t))(a2 + 48))(a1, a2);
  sub_24997785C();
  sub_249977790();
  v4 = (void *)sub_24997779C();
  swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(swift_getAssociatedConformanceWitness() + 8);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 72);
  v7 = v4;
  v8 = swift_checkMetadataState();
  v6(v8, v5);
  v9 = (void *)MEMORY[0x24BCFBB10](MEMORY[0x24BEBEF18], MEMORY[0x24BEBEF10]);
  IOHIDEventSetSenderID();

  *a3 = v7;
}

void sub_2499758FC(_QWORD *a1@<X8>)
{
  uint64_t v1;

  sub_2499757BC(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t KeyboardEventTranslator.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return v0;
}

uint64_t KeyboardEventTranslator.__deallocating_deinit()
{
  KeyboardEventTranslator.deinit();
  return swift_deallocClassInstance();
}

uint64_t (*sub_249975970(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_249974F9C((uint64_t)v2);
  return sub_249973220;
}

uint64_t (*sub_2499759BC(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_2499750A4();
  return sub_249973220;
}

void sub_249975A00(_BYTE *a1@<X8>)
{
  *a1 = sub_249974F3C();
  OUTLINED_FUNCTION_0();
}

void sub_249975A24(char *a1)
{
  sub_249974F68(*a1);
  OUTLINED_FUNCTION_0();
}

void sub_249975A4C(void **a1@<X8>)
{
  *a1 = sub_249975030();
  OUTLINED_FUNCTION_0();
}

uint64_t sub_249975A7C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for KeyboardEventTranslator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for KeyboardEventTranslator);
}

uint64_t method lookup function for KeyboardEventTranslator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of KeyboardEventTranslator.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of KeyboardEventTranslator.eventModifiersMask.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of KeyboardEventTranslator.eventModifiersMask.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of KeyboardEventTranslator.eventModifiersMask.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of KeyboardEventTranslator.pressesFilter.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of KeyboardEventTranslator.pressesFilter.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of KeyboardEventTranslator.pressesFilter.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of KeyboardEventTranslator.translateEvent(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_249975B68()
{
  return sub_249977AB4();
}

uint64_t sub_249975B74()
{
  return 0;
}

double sub_249975B7C@<D0>(_OWORD *a1@<X8>)
{
  double result;

  result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_249975B88()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for NullService()
{
  return objc_opt_self();
}

double sub_249975BBC@<D0>(_OWORD *a1@<X8>)
{
  return sub_249975B7C(a1);
}

void sub_249975BD0()
{
  uint64_t v0;

  v0 = sub_24997788C();
  __swift_allocate_value_buffer(v0, qword_2578AEC30);
  __swift_project_value_buffer(v0, (uint64_t)qword_2578AEC30);
  sub_249977880();
  OUTLINED_FUNCTION_0();
}

uint64_t EventObserver.__allocating_init<A, B>(translators:filters:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;

  v12 = swift_allocObject();
  EventObserver.init<A, B>(translators:filters:)(a1, a2, a3, a4, a5, a6);
  return v12;
}

uint64_t EventObserver.init<A, B>(translators:filters:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t *boxed_opaque_existential_1;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v21;

  *(_QWORD *)(v6 + 96) = 0x3FF0000000000000;
  *(_QWORD *)(v6 + 104) = 0;
  *(_QWORD *)(v6 + 112) = 0;
  *(_QWORD *)(v6 + 128) = 0;
  *(_QWORD *)(v6 + 136) = 0;
  *(_QWORD *)(v6 + 120) = 0x3FF0000000000000;
  *(_BYTE *)(v6 + 144) = -1;
  *(_QWORD *)(v6 + 160) = 0;
  *(_QWORD *)(v6 + 152) = 0;
  *(_QWORD *)(v6 + 40) = a3;
  *(_QWORD *)(v6 + 48) = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v6 + 16));
  v21 = *(_QWORD *)(a3 - 8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v21 + 16))(boxed_opaque_existential_1, a1, a3);
  *(_QWORD *)(v6 + 80) = a4;
  *(_QWORD *)(v6 + 88) = a6;
  v13 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v6 + 56));
  v14 = *(_QWORD *)(a4 - 8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v14 + 16))(v13, a2, a4);
  OUTLINED_FUNCTION_0_3();
  sub_249975E98();
  OUTLINED_FUNCTION_0_3();
  sub_249975F10(*(unsigned __int8 *)(v6 + 144));
  OUTLINED_FUNCTION_0_3();
  v15 = *(void **)(v6 + 152);
  v16 = v15;
  sub_249975F94(v15, &qword_2578AE098);

  OUTLINED_FUNCTION_0_3();
  v17 = *(void **)(v6 + 160);
  v18 = v17;
  sub_249975F94(v17, &qword_2578AE088);

  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a2, a4);
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(a1, a3);
  return v6;
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

void sub_249975E98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_7_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE0A8);
  v0 = OUTLINED_FUNCTION_6_0();
  v1 = *(_QWORD *)(v0 + 16);
  if (v1)
  {
    v2 = v0 + 40;
    do
    {
      OUTLINED_FUNCTION_9_0();
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_14();
      v2 += 16;
      --v1;
    }
    while (v1);
  }
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_2_3();
}

void sub_249975F10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_7_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE0A0);
  v5 = OUTLINED_FUNCTION_6_0();
  v6 = *(_QWORD *)(v5 + 16);
  if (v6)
  {
    v7 = v5 + 40;
    do
    {
      OUTLINED_FUNCTION_9_0();
      OUTLINED_FUNCTION_4_2();
      v3(a1, v2, v1);
      OUTLINED_FUNCTION_14();
      v7 += 16;
      --v6;
    }
    while (v6);
  }
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_2_3();
}

void sub_249975F94(void *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 40));
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v5 = sub_2499778BC();
  v6 = *(_QWORD *)(v5 + 16);
  if (v6)
  {
    v7 = v5 + 40;
    do
    {
      OUTLINED_FUNCTION_9_0();
      OUTLINED_FUNCTION_4_2();
      v8 = a1;
      OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_14();
      v7 += 16;
      --v6;
    }
    while (v6);
  }
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_2_3();
}

void EventObserver.coordinateTransform.getter(_OWORD *a1@<X8>)
{
  _OWORD *v1;
  __int128 v3;

  OUTLINED_FUNCTION_0_3();
  v3 = v1[7];
  *a1 = v1[6];
  a1[1] = v3;
  a1[2] = v1[8];
  OUTLINED_FUNCTION_1_1();
}

__n128 sub_249976078@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  __int128 v4;
  __n128 result;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_OWORD *)(v3 + 112);
  *(_OWORD *)a2 = *(_OWORD *)(v3 + 96);
  *(_OWORD *)(a2 + 16) = v4;
  result = *(__n128 *)(v3 + 128);
  *(__n128 *)(a2 + 32) = result;
  return result;
}

void EventObserver.coordinateTransform.setter(_OWORD *a1)
{
  _OWORD *v1;
  __int128 v3;

  OUTLINED_FUNCTION_0_2();
  v3 = a1[1];
  v1[6] = *a1;
  v1[7] = v3;
  v1[8] = a1[2];
  sub_249976120();
}

void sub_249976120()
{
  swift_beginAccess();
  if ((sub_24997797C() & 1) == 0)
    sub_249975E98();
}

void EventObserver.coordinateTransform.modify(_QWORD *a1)
{
  _OWORD *v1;
  _QWORD *v3;
  __int128 v4;

  v3 = malloc(0xB0uLL);
  *a1 = v3;
  v3[21] = v1;
  OUTLINED_FUNCTION_0_3();
  v4 = v1[7];
  *((_OWORD *)v3 + 6) = v1[6];
  *((_OWORD *)v3 + 7) = v4;
  *((_OWORD *)v3 + 8) = v1[8];
  OUTLINED_FUNCTION_5_0();
}

void sub_2499761D8(_OWORD **a1, char a2)
{
  _OWORD *v2;
  _OWORD *v3;
  __int128 v4;

  v2 = *a1;
  if ((a2 & 1) != 0)
    v3 = *a1;
  else
    v3 = *a1 + 3;
  v4 = v2[7];
  *v3 = v2[6];
  v3[1] = v4;
  v3[2] = v2[8];
  EventObserver.coordinateTransform.setter(v3);
  OUTLINED_FUNCTION_10(v2);
}

uint64_t EventObserver.eventModifiersMask.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_3();
  return *(unsigned __int8 *)(v0 + 144);
}

uint64_t sub_249976240@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_BYTE *)(v3 + 144);
  return result;
}

void EventObserver.eventModifiersMask.setter(char a1)
{
  uint64_t v1;
  unsigned __int8 v3;

  OUTLINED_FUNCTION_0_2();
  v3 = *(_BYTE *)(v1 + 144);
  *(_BYTE *)(v1 + 144) = a1;
  sub_2499762BC(v3);
  OUTLINED_FUNCTION_1_1();
}

void sub_2499762BC(unsigned __int8 a1)
{
  uint64_t v1;
  uint64_t v3;

  swift_beginAccess();
  v3 = *(unsigned __int8 *)(v1 + 144);
  if ((_DWORD)v3 != a1)
    sub_249975F10(v3);
}

void EventObserver.eventModifiersMask.modify()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = OUTLINED_FUNCTION_8_0();
  *v0 = v2;
  v2[3] = v1;
  OUTLINED_FUNCTION_0_3();
  *((_BYTE *)v2 + 32) = *(_BYTE *)(v1 + 144);
  OUTLINED_FUNCTION_5_0();
}

void sub_24997634C(uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  EventObserver.eventModifiersMask.setter(*(_BYTE *)(*(_QWORD *)a1 + 32));
  OUTLINED_FUNCTION_10(v1);
}

void EventObserver.pressesFilter.getter()
{
  uint64_t v0;
  id v1;

  OUTLINED_FUNCTION_0_3();
  v1 = *(id *)(v0 + 152);
  OUTLINED_FUNCTION_1_1();
}

id sub_2499763A4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(void **)(v3 + 152);
  *a2 = v4;
  return v4;
}

void sub_2499763E8(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  EventObserver.pressesFilter.setter(v1);
}

void EventObserver.pressesFilter.setter(void *a1)
{
  uint64_t v1;
  void *v3;
  id v4;

  OUTLINED_FUNCTION_0_2();
  v3 = *(void **)(v1 + 152);
  *(_QWORD *)(v1 + 152) = a1;
  v4 = a1;
  sub_249976464(v3);

  OUTLINED_FUNCTION_12();
}

void sub_249976464(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  id v5;
  id v6;
  char v7;

  v2 = v1;
  swift_beginAccess();
  v4 = *(void **)(v2 + 152);
  if (v4)
  {
    if (a1)
    {
      sub_24996FD34(0, (unint64_t *)&qword_2578ADFB8);
      v5 = a1;
      v6 = v4;
      v7 = sub_249977988();

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {
      v6 = v4;
    }
  }
  else
  {
    if (!a1)
      return;
    v6 = 0;
  }
  sub_249975F94(v4, &qword_2578AE098);
LABEL_9:

}

void EventObserver.pressesFilter.modify()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  void *v3;
  id v4;

  v2 = OUTLINED_FUNCTION_8_0();
  *v0 = v2;
  v2[4] = v1;
  OUTLINED_FUNCTION_0_3();
  v3 = *(void **)(v1 + 152);
  v2[3] = v3;
  v4 = v3;
  OUTLINED_FUNCTION_5_0();
}

void sub_249976588(uint64_t a1, char a2)
{
  sub_2499767B4(a1, a2, EventObserver.pressesFilter.setter);
}

void EventObserver.touchesFilter.getter()
{
  uint64_t v0;
  id v1;

  OUTLINED_FUNCTION_0_3();
  v1 = *(id *)(v0 + 160);
  OUTLINED_FUNCTION_1_1();
}

id sub_2499765C4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(void **)(v3 + 160);
  *a2 = v4;
  return v4;
}

void sub_249976608(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  EventObserver.touchesFilter.setter(v1);
}

void EventObserver.touchesFilter.setter(void *a1)
{
  uint64_t v1;
  void *v3;
  id v4;

  OUTLINED_FUNCTION_0_2();
  v3 = *(void **)(v1 + 160);
  *(_QWORD *)(v1 + 160) = a1;
  v4 = a1;
  sub_249976684(v3);

  OUTLINED_FUNCTION_12();
}

void sub_249976684(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  id v5;
  id v6;
  char v7;

  v2 = v1;
  swift_beginAccess();
  v4 = *(void **)(v2 + 160);
  if (v4)
  {
    if (a1)
    {
      sub_24996FD34(0, (unint64_t *)&qword_2578ADFB8);
      v5 = a1;
      v6 = v4;
      v7 = sub_249977988();

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {
      v6 = v4;
    }
  }
  else
  {
    if (!a1)
      return;
    v6 = 0;
  }
  sub_249975F94(v4, &qword_2578AE088);
LABEL_9:

}

void EventObserver.touchesFilter.modify()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  void *v3;
  id v4;

  v2 = OUTLINED_FUNCTION_8_0();
  *v0 = v2;
  v2[4] = v1;
  OUTLINED_FUNCTION_0_3();
  v3 = *(void **)(v1 + 160);
  v2[3] = v3;
  v4 = v3;
  OUTLINED_FUNCTION_5_0();
}

void sub_2499767A8(uint64_t a1, char a2)
{
  sub_2499767B4(a1, a2, EventObserver.touchesFilter.setter);
}

void sub_2499767B4(uint64_t a1, char a2, void (*a3)(id))
{
  void *v4;
  id v5;
  id *v6;
  id v7;

  v4 = *(void **)a1;
  v6 = (id *)(*(_QWORD *)a1 + 24);
  v5 = *v6;
  if ((a2 & 1) != 0)
  {
    v7 = v5;
    a3(v5);

  }
  else
  {
    a3(*(id *)(*(_QWORD *)a1 + 24));
  }
  free(v4);
}

uint64_t EventObserver.processEvent(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  __swift_instantiateConcreteTypeFromMangledName(qword_2578AE2F0);
  sub_2499778C8();
  v1 = sub_249976D80(v3);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_2499768C4(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  BOOL v13;
  unint64_t v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t isUniquelyReferenced_nonNull_native;
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t *v48;
  _QWORD v49[5];
  uint64_t v50[5];
  _QWORD v51[4];
  __int128 v52;
  uint64_t v53;
  uint64_t v54[3];
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  id v57;

  v46 = a4;
  v6 = *(_QWORD *)(a2 + 8);
  ObjectType = swift_getObjectType();
  v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 24))(a3, ObjectType, v6);
  if ((unint64_t)v8 >> 62)
    goto LABEL_38;
  v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v9)
  {
    while (1)
    {
      v10 = 0;
      v44 = (_QWORD *)(v46 + 56);
      v45 = v8 & 0xC000000000000001;
      v41 = v8 + 32;
      v48 = a1;
      v43 = v8;
      v42 = v9;
LABEL_4:
      v11 = v45;
      sub_2499772EC(v10, v45 == 0, v8);
      v12 = v11 ? (id)MEMORY[0x24BCFBD14](v10, v8) : *(id *)(v41 + 8 * v10);
      v57 = v12;
      v13 = __OFADD__(v10, 1);
      v14 = v10 + 1;
      if (!v13)
        break;
LABEL_37:
      __break(1u);
LABEL_38:
      v9 = sub_249977A78();
      if (!v9)
        return swift_bridgeObjectRelease();
    }
    v47 = v14;
    v15 = objc_msgSend(v57, sel_senderID);
    v16 = __swift_project_boxed_opaque_existential_1(v44, *(_QWORD *)(v46 + 80));
    MEMORY[0x24BDAC7A8](v16);
    (*(void (**)(char *))(v18 + 16))((char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    __swift_allocate_boxed_opaque_existential_1(v54);
    sub_2499778B0();
    while (1)
    {
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v54, AssociatedTypeWitness);
      sub_2499779A0();
      if (!v53)
        break;
      sub_249971C50(&v52, (uint64_t)v51);
      __swift_project_boxed_opaque_existential_1(v51, v51[3]);
      v19 = sub_24996FD34(0, &qword_2578AE378);
      v49[4] = MEMORY[0x24BEBF1C8];
      v49[3] = v19;
      v49[0] = v57;
      v20 = v57;
      sub_249977808();
      v22 = v21;
      sub_249977338((uint64_t)v50);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v49);
      v23 = *(_QWORD *)(v22 + 16);
      if (v23)
      {
        v50[0] = MEMORY[0x24BEE4AF8];
        sub_249971CB4(0, v23, 0);
        v24 = v50[0];
        v25 = (unint64_t *)(v22 + 40);
        do
        {
          v27 = *(v25 - 1);
          v26 = *v25;
          sub_2499772A8(v27, *v25);
          v50[0] = v24;
          v29 = *(_QWORD *)(v24 + 16);
          v28 = *(_QWORD *)(v24 + 24);
          if (v29 >= v28 >> 1)
          {
            sub_249971CB4((_QWORD *)(v28 > 1), v29 + 1, 1);
            v24 = v50[0];
          }
          v25 += 2;
          *(_QWORD *)(v24 + 16) = v29 + 1;
          v30 = (_QWORD *)(v24 + 24 * v29);
          v30[4] = v27;
          v30[5] = v26;
          v30[6] = v15;
          --v23;
        }
        while (v23);
        swift_bridgeObjectRelease();
        a1 = v48;
      }
      else
      {
        swift_bridgeObjectRelease();
        v24 = MEMORY[0x24BEE4AF8];
      }
      v31 = *(_QWORD *)(v24 + 16);
      v32 = *a1;
      v8 = *(_QWORD *)(*a1 + 16);
      v33 = v8 + v31;
      if (__OFADD__(v8, v31))
      {
        __break(1u);
LABEL_34:
        __break(1u);
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
        goto LABEL_37;
      }
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if (!(_DWORD)isUniquelyReferenced_nonNull_native || v33 > *(_QWORD *)(v32 + 24) >> 1)
      {
        if (v8 <= v33)
          v35 = v8 + v31;
        else
          v35 = v8;
        v32 = sub_24997719C(isUniquelyReferenced_nonNull_native, v35, 1, v32);
      }
      if (*(_QWORD *)(v24 + 16))
      {
        v36 = *(_QWORD *)(v32 + 16);
        if ((*(_QWORD *)(v32 + 24) >> 1) - v36 < v31)
          goto LABEL_35;
        v8 = v32 + 24 * v36 + 32;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE060);
        swift_arrayInitWithCopy();
        if (v31)
        {
          v37 = *(_QWORD *)(v32 + 16);
          v13 = __OFADD__(v37, v31);
          v38 = v37 + v31;
          if (v13)
            goto LABEL_36;
          *(_QWORD *)(v32 + 16) = v38;
        }
      }
      else if (v31)
      {
        goto LABEL_34;
      }
      swift_bridgeObjectRelease();
      *a1 = v32;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    }

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
    v10 = v47;
    v8 = v43;
    if (v47 != v42)
      goto LABEL_4;
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_249976D68(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2499768C4(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_249976D80(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v11 = MEMORY[0x24BEE4AF8];
    sub_249971C88(0, v1, 0);
    v2 = v11;
    v4 = (unint64_t *)(a1 + 40);
    do
    {
      sub_2499772A8(*(v4 - 1), *v4);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE060);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE050);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_249971C88(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v11;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_249971C88((_QWORD *)(v5 > 1), v6 + 1, 1);
        v2 = v11;
      }
      v4 += 3;
      *(_QWORD *)(v2 + 16) = v6 + 1;
      v7 = v2 + 24 * v6;
      *(_QWORD *)(v7 + 32) = v9;
      *(_OWORD *)(v7 + 40) = v10;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_249976ED8@<X0>(uint64_t *a1@<X2>, _QWORD *a2@<X8>)
{
  uint64_t result;

  swift_unknownObjectRetain();
  swift_getExtendedExistentialTypeMetadata();
  __swift_instantiateConcreteTypeFromMangledName(a1);
  result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
    *a2 = 0;
    a2[1] = 0;
  }
  return result;
}

uint64_t EventObserver.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);

  return v0;
}

uint64_t EventObserver.__deallocating_deinit()
{
  EventObserver.deinit();
  return swift_deallocClassInstance();
}

void sub_249976FBC(_OWORD *a1)
{
  EventObserver.coordinateTransform.setter(a1);
  OUTLINED_FUNCTION_0();
}

_QWORD *sub_249976FDC(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

void sub_249976FEC(char *a1)
{
  EventObserver.eventModifiersMask.setter(*a1);
  OUTLINED_FUNCTION_0();
}

uint64_t sub_249977028()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for EventObserver(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for EventObserver);
}

uint64_t method lookup function for EventObserver()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EventObserver.__allocating_init<A, B>(translators:filters:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t sub_2499770AC(uint64_t result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE388);
    v10 = swift_allocObject();
    v11 = _swift_stdlib_malloc_size((const void *)v10);
    *(_QWORD *)(v10 + 16) = v8;
    *(_QWORD *)(v10 + 24) = 2 * ((uint64_t)(v11 - 32) / 4);
  }
  else
  {
    v10 = MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    sub_249971B10((char *)(a4 + 32), v8, (char *)(v10 + 32));
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    memcpy((void *)(v10 + 32), (const void *)(a4 + 32), 4 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_24997719C(uint64_t result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE058);
    v10 = swift_allocObject();
    v11 = _swift_stdlib_malloc_size((const void *)v10);
    *(_QWORD *)(v10 + 16) = v8;
    *(_QWORD *)(v10 + 24) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    sub_249971B30((char *)(a4 + 32), v8, (char *)(v10 + 32));
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE060);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2499772A8(uint64_t a1, unint64_t a2)
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

unint64_t sub_2499772EC(unint64_t result, char a2, uint64_t a3)
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

uint64_t sub_249977338(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578AE380);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_249977378@<X0>(_QWORD *a1@<X8>)
{
  return sub_249976ED8(&qword_2578AE088, a1);
}

uint64_t sub_249977398@<X0>(_QWORD *a1@<X8>)
{
  return sub_249976ED8(&qword_2578AE098, a1);
}

uint64_t sub_2499773B8@<X0>(_QWORD *a1@<X8>)
{
  return sub_249976ED8(&qword_2578AE0A0, a1);
}

uint64_t sub_2499773D8@<X0>(_QWORD *a1@<X8>)
{
  return sub_249976ED8(&qword_2578AE0A8, a1);
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

uint64_t OUTLINED_FUNCTION_0_3()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return 8;
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return swift_unknownObjectRetain();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return sub_2499778BC();
}

_QWORD *OUTLINED_FUNCTION_7_0()
{
  uint64_t v0;

  return __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
}

void *OUTLINED_FUNCTION_8_0()
{
  return malloc(0x28uLL);
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return swift_getObjectType();
}

void OUTLINED_FUNCTION_10(void *a1)
{
  free(a1);
}

uint64_t OUTLINED_FUNCTION_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v0, v2, v1);
}

uint64_t OUTLINED_FUNCTION_13()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return swift_unknownObjectRelease();
}

uint64_t dispatch thunk of EventModifiersMaskConfigurable.eventModifiersMask.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of EventModifiersMaskConfigurable.eventModifiersMask.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of EventModifiersMaskConfigurable.eventModifiersMask.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

id sub_24997753C(uint64_t a1)
{
  return sub_24997755C(a1);
}

id sub_24997755C(uint64_t a1)
{
  void *v1;

  return objc_msgSend(v1, sel_locationInView_, a1);
}

id sub_249977570()
{
  return sub_249977590();
}

id sub_249977590()
{
  void *v0;

  return objc_msgSend(v0, sel__pathIndex);
}

id sub_2499775B0()
{
  return sub_2499776A0();
}

unint64_t sub_2499775D0(uint64_t a1)
{
  unint64_t result;

  result = sub_2499775F4();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2499775F4()
{
  unint64_t result;
  unint64_t v1;

  result = qword_2578ADFB0;
  if (!qword_2578ADFB0)
  {
    v1 = sub_249977634();
    result = MEMORY[0x24BCFC08C](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_2578ADFB0);
  }
  return result;
}

unint64_t sub_249977634()
{
  unint64_t result;

  result = qword_2578ADF58;
  if (!qword_2578ADF58)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2578ADF58);
  }
  return result;
}

uint64_t dispatch thunk of UITouchProtocol.timestamp.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of UITouchProtocol.phase.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of UITouchProtocol.type.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of UITouchProtocol.location(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of UITouchProtocol._pathIndex.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of UITouchProtocol._pathIdentity.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

id sub_2499776A0()
{
  void *v0;

  return objc_msgSend(v0, sel__pathIdentity);
}

uint64_t dispatch thunk of CoordinateTransformConfigurable.coordinateTransform.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of CoordinateTransformConfigurable.coordinateTransform.setter(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(_OWORD *);
  __int128 v4;
  _OWORD v6[3];

  v3 = *(uint64_t (**)(_OWORD *))(a3 + 16);
  v4 = a1[1];
  v6[0] = *a1;
  v6[1] = v4;
  v6[2] = a1[2];
  return v3(v6);
}

uint64_t dispatch thunk of CoordinateTransformConfigurable.coordinateTransform.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

id sub_249977704()
{
  return sub_24997772C();
}

uint64_t dispatch thunk of UIKeyProtocol.keyCode.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

id sub_24997772C()
{
  void *v0;

  return objc_msgSend(v0, sel_keyCode);
}

uint64_t sub_24997773C()
{
  return MEMORY[0x24BEBEEC0]();
}

uint64_t sub_249977748()
{
  return MEMORY[0x24BEBEEC8]();
}

uint64_t sub_249977754()
{
  return MEMORY[0x24BEBEED0]();
}

uint64_t sub_249977760()
{
  return MEMORY[0x24BEBEED8]();
}

uint64_t sub_24997776C()
{
  return MEMORY[0x24BEBEEE8]();
}

uint64_t sub_249977778()
{
  return MEMORY[0x24BEBEEF0]();
}

uint64_t sub_249977784()
{
  return MEMORY[0x24BEBEEF8]();
}

uint64_t sub_249977790()
{
  return MEMORY[0x24BEBEF00]();
}

uint64_t sub_24997779C()
{
  return MEMORY[0x24BEBEF08]();
}

uint64_t sub_2499777A8()
{
  return MEMORY[0x24BEBEF20]();
}

uint64_t sub_2499777B4()
{
  return MEMORY[0x24BEBEF30]();
}

uint64_t sub_2499777C0()
{
  return MEMORY[0x24BEBEF38]();
}

uint64_t sub_2499777CC()
{
  return MEMORY[0x24BEBEF60]();
}

uint64_t sub_2499777D8()
{
  return MEMORY[0x24BEBEF70]();
}

uint64_t sub_2499777E4()
{
  return MEMORY[0x24BEBEF80]();
}

uint64_t sub_2499777F0()
{
  return MEMORY[0x24BEBEF90]();
}

uint64_t sub_2499777FC()
{
  return MEMORY[0x24BEBEFA0]();
}

uint64_t sub_249977808()
{
  return MEMORY[0x24BEBEFB0]();
}

uint64_t sub_249977814()
{
  return MEMORY[0x24BEBEFB8]();
}

uint64_t sub_249977820()
{
  return MEMORY[0x24BEBEFC0]();
}

uint64_t sub_24997782C()
{
  return MEMORY[0x24BEBF030]();
}

uint64_t sub_249977838()
{
  return MEMORY[0x24BEBF040]();
}

uint64_t sub_249977844()
{
  return MEMORY[0x24BEBF130]();
}

uint64_t sub_249977850()
{
  return MEMORY[0x24BEBF140]();
}

uint64_t sub_24997785C()
{
  return MEMORY[0x24BEBF148]();
}

uint64_t sub_249977868()
{
  return MEMORY[0x24BEBF150]();
}

uint64_t sub_249977874()
{
  return MEMORY[0x24BEBF158]();
}

uint64_t sub_249977880()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_24997788C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_249977898()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_2499778A4()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2499778B0()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_2499778BC()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_2499778C8()
{
  return MEMORY[0x24BEE0EB0]();
}

uint64_t sub_2499778D4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2499778E0()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_2499778EC()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_2499778F8()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_249977904()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_249977910()
{
  return MEMORY[0x24BEE1228]();
}

uint64_t sub_24997791C()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_249977928()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_249977934()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t sub_249977940()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_24997794C()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_249977958()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_249977964()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_249977970()
{
  return MEMORY[0x24BEBF1B8]();
}

uint64_t sub_24997797C()
{
  return MEMORY[0x24BDBD808]();
}

uint64_t sub_249977988()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_249977994()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2499779A0()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_2499779AC()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_2499779B8()
{
  return MEMORY[0x24BEE2378]();
}

uint64_t sub_2499779C4()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2499779D0()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2499779DC()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2499779E8()
{
  return MEMORY[0x24BEE24D8]();
}

uint64_t sub_2499779F4()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_249977A00()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_249977A0C()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_249977A18()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_249977A24()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_249977A30()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_249977A3C()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_249977A48()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_249977A54()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_249977A60()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_249977A6C()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_249977A78()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_249977A84()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_249977A90()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_249977A9C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_249977AA8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_249977AB4()
{
  return MEMORY[0x24BEE4A98]();
}

CGPoint CGPointApplyAffineTransform(CGPoint point, CGAffineTransform *t)
{
  double v2;
  double v3;
  CGPoint result;

  MEMORY[0x24BDBEF90](t, (__n128)point, *(__n128 *)&point.y);
  result.y = v3;
  result.x = v2;
  return result;
}

uint64_t IOHIDEventAppendEvent()
{
  return MEMORY[0x24BDD8148]();
}

uint64_t IOHIDEventSetIntegerValue()
{
  return MEMORY[0x24BDD8320]();
}

uint64_t IOHIDEventSetSenderID()
{
  return MEMORY[0x24BDD8340]();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
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

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

