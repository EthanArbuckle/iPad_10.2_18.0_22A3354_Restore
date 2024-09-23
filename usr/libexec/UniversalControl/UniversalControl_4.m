void HIDVirtualService.dispatch<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v5 = v4;
  v32 = a4;
  v30 = a1;
  v8 = sub_1001E7608(0, a3);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v28 - v10;
  v12 = type metadata accessor for Optional(0, v8);
  __chkstk_darwin(v12);
  v14 = (char *)&v28 - v13;
  v31 = a3;
  v15 = sub_1001E7608(0, a3);
  __chkstk_darwin(v15);
  v17 = (char *)&v28 - v16;
  __chkstk_darwin(v18);
  v21 = (char *)&v28 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = v5[19];
  if (v22)
  {
    sub_1001E758C();
    swift_bridgeObjectRetain();
    v23 = Array.init<A>(_:)(v21, v8, a2, v31);
    v24 = sub_1000055B0(&qword_1002B58A0);
    v25 = _arrayForceCast<A, B>(_:)(v23, v8, v24);
    swift_bridgeObjectRelease();
    v33 = v22;
    sub_1001C4444(v25);
    v5[19] = v33;
    swift_bridgeObjectRelease();
  }
  else
  {
    v29 = v19;
    sub_1001E758C();
    v26 = v31;
    dispatch thunk of Sequence.makeIterator()(a2, v31);
    swift_getAssociatedConformanceWitness(v26, a2, v15);
    sub_1001E75A0();
    if (_s13EnsembleAgent26PasteboardAcquisitionErrorOwet_0((uint64_t)v14, 1, v8) != 1)
    {
      v27 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
      do
      {
        v27(v11, v14, v8);
        sub_1001E6ED8((uint64_t)v11, v5, v8, v32);
        (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
        sub_1001E75A0();
      }
      while (_s13EnsembleAgent26PasteboardAcquisitionErrorOwet_0((uint64_t)v14, 1, v8) != 1);
    }
    (*(void (**)(char *, uint64_t))(v29 + 8))(v17, v15);
  }
}

void HIDVirtualService.__allocating_init(properties:queue:appleVendorKeyboardGesture:appleVendorTopCaseGesture:consumerGesture:keyboardGesture:digitizerGesture:pointerGesture:scrollGesture:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;

  sub_1000088D8(v10, 160);
  HIDVirtualService.init(properties:queue:appleVendorKeyboardGesture:appleVendorTopCaseGesture:consumerGesture:keyboardGesture:digitizerGesture:pointerGesture:scrollGesture:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
  sub_1000088AC();
}

Swift::Void __swiftcall HIDVirtualService.activate()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[24];

  v1 = v0;
  v2 = *(_QWORD *)(v0 + 88);
  ObjectType = swift_getObjectType(*(_QWORD *)(v0 + 80));
  dispatch thunk of HIDVirtualEventServiceProtocol.activate()(ObjectType, v2);
  v4 = sub_1000269E0();
  v6 = dispatch thunk of HIDReportDescriptorItemProtocol.data.getter(v4, v5);
  sub_10000B2F8(v1 + 96, (uint64_t)v7, 1);
  *(_QWORD *)(v1 + 96) = v6;
}

Swift::Void __swiftcall HIDVirtualService.cancel()()
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
  uint64_t ObjectType;

  v1 = sub_10002D790();
  sub_1001E5194(v1, AppleVendorKeyboardReport.init());
  sub_10002645C();
  v2 = sub_10002D790();
  sub_1001E5194(v2, AppleVendorTopCaseReport.init());
  sub_10002645C();
  v3 = sub_10002D790();
  sub_1001E5194(v3, ConsumerReport.init());
  sub_10002645C();
  v4 = sub_10002D790();
  sub_1001E51E0(v4, (uint64_t (*)(void))DigitizerReport.init());
  sub_10002645C();
  v5 = sub_10002D790();
  sub_1001E5194(v5, (uint64_t (*)(void))KeyboardReport.init());
  sub_10002645C();
  v6 = sub_10002D790();
  sub_1001E51E0(v6, (uint64_t (*)(void))PointerReport.init());
  sub_10002645C();
  v7 = sub_10002D790();
  sub_1001E51E0(v7, ScrollReport.init());
  sub_10002645C();
  v8 = *(_QWORD *)(v0 + 88);
  ObjectType = swift_getObjectType(*(_QWORD *)(v0 + 80));
  dispatch thunk of HIDVirtualEventServiceProtocol.cancel()(ObjectType, v8);
  sub_10000B350();
}

BOOL sub_1001E4940(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;
  uint64_t v5;
  Swift::Int v6;
  char v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  _QWORD v14[9];

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  Hasher.init(_seed:)(v14, *(_QWORD *)(a2 + 40));
  HIDDeviceType.hash(into:)(v14, a1);
  v4 = Hasher._finalize()();
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = v4 & ~v5;
  sub_100026B68();
  if ((v7 & 1) == 0)
    return 0;
  if (sub_1001E75B4())
    return 1;
  v9 = ~v5;
  v10 = (v6 + 1) & v9;
  sub_100026B68();
  if ((v11 & 1) == 0)
    return 0;
  do
  {
    v8 = sub_1001E75B4();
    if (v8)
      break;
    v10 = (v10 + 1) & v9;
    sub_100026B68();
  }
  while ((v12 & 1) != 0);
  return v8;
}

uint64_t sub_1001E4A04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Swift::Int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t result;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  BOOL v19;
  _QWORD v20[9];

  if (*(_QWORD *)(a3 + 16))
  {
    Hasher.init(_seed:)(v20, *(_QWORD *)(a3 + 40));
    String.hash(into:)(v20, a1, a2);
    v6 = Hasher._finalize()();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = v11[1];
      v13 = *v11 == a1 && v12 == a2;
      if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v11, v12, a1, a2, 0) & 1) != 0)
        return 1;
      v15 = ~v7;
      v16 = (v8 + 1) & v15;
      if (((*(_QWORD *)(v9 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) != 0)
      {
        while (1)
        {
          v17 = (_QWORD *)(v10 + 16 * v16);
          v18 = v17[1];
          v19 = *v17 == a1 && v18 == a2;
          if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v17, v18, a1, a2, 0) & 1) != 0)
            break;
          result = 0;
          v16 = (v16 + 1) & v15;
          if (((*(_QWORD *)(v9 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t HIDVirtualService.appleVendorTopCaseGesture.getter()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(v0 + 16));
}

uint64_t HIDVirtualService.appleVendorKeyboardGesture.getter()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(v0 + 24));
}

uint64_t HIDVirtualService.consumerGesture.getter()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(v0 + 32));
}

uint64_t HIDVirtualService.digitizerGesture.getter()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(v0 + 40));
}

uint64_t HIDVirtualService.keyboardGesture.getter()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(v0 + 48));
}

uint64_t HIDVirtualService.pointerGesture.getter()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(v0 + 56));
}

uint64_t HIDVirtualService.scrollGesture.getter()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(v0 + 64));
}

uint64_t HIDVirtualService.serviceID.getter()
{
  uint64_t v0;
  _BYTE v2[24];

  sub_10005FE28(v0 + 96, (uint64_t)v2);
  return *(_QWORD *)(v0 + 96);
}

uint64_t HIDVirtualService.properties.getter()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  _BYTE v4[24];

  sub_10005FE28(v0 + 104, (uint64_t)v4);
  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(id *)(v0 + 112);
  return v1;
}

uint64_t sub_1001E4BD4()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10000897C(v0, qword_1002B5FA0);
  sub_100006FB4(v0, (uint64_t)qword_1002B5FA0);
  return Logger.init(subsystem:category:)(0xD00000000000001ALL, 0x8000000100251980, 1145653334, 0xE400000000000000);
}

void sub_1001E4C40()
{
  uint64_t v0;

  sub_1001E6964((uint64_t)&off_100290898);
  qword_1002B5FB8 = v0;
}

uint64_t HIDVirtualService.shouldDispatchScrollEvents.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 136);
}

id HIDVirtualService.queue.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 144);
}

void HIDVirtualService.__allocating_init(properties:queue:)(uint64_t a1, uint64_t a2, uint64_t a3)
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
  _BYTE *v24;
  uint64_t v25;
  void *v26;

  v4 = v3;
  v5 = type metadata accessor for AppleVendorKeyboardGesture(0);
  v6 = sub_1000088D8(v5, 32);
  *(_QWORD *)(v6 + 16) = AppleVendorKeyboardReport.init()();
  *(_QWORD *)(v6 + 24) = v7;
  v8 = type metadata accessor for AppleVendorTopCaseGesture(0);
  v9 = sub_1000088D8(v8, 32);
  *(_QWORD *)(v9 + 16) = AppleVendorTopCaseReport.init()();
  *(_QWORD *)(v9 + 24) = v10;
  v11 = type metadata accessor for ConsumerGesture(0);
  v12 = sub_1000088D8(v11, 32);
  *(_QWORD *)(v12 + 16) = ConsumerReport.init()();
  *(_QWORD *)(v12 + 24) = v13;
  v14 = type metadata accessor for KeyboardGesture(0);
  v15 = sub_1000088D8(v14, 32);
  KeyboardReport.init()();
  *(_QWORD *)(v15 + 16) = v16;
  *(_QWORD *)(v15 + 24) = v17;
  v18 = type metadata accessor for DigitizerGesture();
  sub_1000088D8(v18, 72);
  DigitizerGesture.init(style:useRemoteAcceleration:)(1, 0);
  v20 = v19;
  v21 = type metadata accessor for PointerGesture();
  sub_1000088D8(v21, 33);
  v22 = PointerGesture.init(useRemoteAcceleration:)(0);
  v23 = type metadata accessor for ScrollGesture();
  sub_1000088D8(v23, 19);
  v24 = ScrollGesture.init(style:useRemoteAcceleration:)(1, 0);
  sub_1000088D8(v4, 160);
  v25 = sub_1000269E0();
  HIDVirtualService.init(properties:queue:appleVendorKeyboardGesture:appleVendorTopCaseGesture:consumerGesture:keyboardGesture:digitizerGesture:pointerGesture:scrollGesture:)(v25, v26, a3, v6, v9, v12, v15, v20, v22, (uint64_t)v24);
  sub_1000088AC();
}

uint64_t HIDVirtualService.init(properties:queue:appleVendorKeyboardGesture:appleVendorTopCaseGesture:consumerGesture:keyboardGesture:digitizerGesture:pointerGesture:scrollGesture:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  Swift::String v23;
  void *object;
  Swift::UInt64 v25;
  id v26;
  char v27;
  id v28;
  char v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  char *v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;
  char *v39;
  uint64_t aBlock;
  unint64_t v47;
  uint64_t (*v48)(uint64_t);
  void *v49;
  uint64_t (*v50)(_QWORD);
  uint64_t v51;
  Swift::UInt64 v52;
  id v53;

  v11 = v10;
  *(_QWORD *)(v11 + 96) = 0;
  *(_QWORD *)(v11 + 120) = Dictionary.init(dictionaryLiteral:)(_swiftEmptyArrayStorage, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v15 = type metadata accessor for AnyCancellable(0);
  *(_QWORD *)(v11 + 128) = Dictionary.init(dictionaryLiteral:)(_swiftEmptyArrayStorage, &type metadata for Int32, v15, &protocol witness table for Int32);
  *(_QWORD *)(v11 + 152) = _swiftEmptyArrayStorage;
  v52 = a1;
  v53 = a2;
  v16 = a2;
  HIDServiceProperties.product.getter(a1, (uint64_t)v16, v17, v18, v19, v20, v21, v22);
  if (v23._object)
  {
    object = v23._object;
    aBlock = 11606;
    v47 = 0xE200000000000000;
    sub_1001E7600(v23);
    swift_bridgeObjectRelease(object);
    v23._countAndFlagsBits = 11606;
    v23._object = (void *)0xE200000000000000;
  }
  HIDServiceProperties.product.setter(v23._countAndFlagsBits, (uint64_t)v23._object);
  HIDServiceProperties.universalControlVirtualService.setter(1);
  v25 = v52;
  v26 = v53;
  v27 = HIDServiceProperties.deviceType.getter(v52, v26);

  if (static ReportID.== infix(_:_:)(v27, 0))
  {
    HIDServiceProperties.fnKeyboardUsageMap.setter(0xD000000000000057, 0x800000010025A4A0);
    v25 = v52;
    v26 = v53;
  }
  v28 = v26;
  v29 = HIDServiceProperties.deviceType.getter(v25, v28);

  *(_BYTE *)(v11 + 136) = !static ReportID.== infix(_:_:)(v29, 2);
  if (*(_BYTE *)(a9 + 17) == 1)
    HIDServiceProperties.pointerAccelerationSupport.setter(0);
  if (*(_BYTE *)(a10 + 17) == 1)
    HIDServiceProperties.scrollAccelerationSupport.setter(0);
  v30 = Dictionary.init(dictionaryLiteral:)(&off_100290838, &type metadata for String, &type metadata for Int, &protocol witness table for String);
  HIDServiceProperties.eventServiceProperties.setter(v30);
  v31 = v53;
  *(_QWORD *)(v11 + 104) = v52;
  *(_QWORD *)(v11 + 112) = v31;
  v32 = objc_allocWithZone((Class)type metadata accessor for HIDVirtualServiceDelegate());
  v33 = v31;
  v34 = (char *)objc_msgSend(v32, "init");
  v35 = objc_msgSend(objc_allocWithZone((Class)HIDVirtualEventService), "init");
  objc_msgSend(v35, "setDispatchQueue:", a3);
  v36 = sub_1000088D8((uint64_t)&unk_100293650, 24);
  *(_QWORD *)(v36 + 16) = v35;
  v50 = CGSize.init(_:);
  v51 = v36;
  aBlock = (uint64_t)_NSConcreteStackBlock;
  v47 = 1107296256;
  v48 = sub_10000E610;
  v49 = &unk_100293668;
  v37 = _Block_copy(&aBlock);
  v38 = v35;
  swift_release();
  objc_msgSend(v38, "setCancelHandler:", v37);
  _Block_release(v37);
  objc_msgSend(v38, "setDelegate:", v34);

  *(_QWORD *)(v11 + 16) = a5;
  *(_QWORD *)(v11 + 24) = a4;
  *(_QWORD *)(v11 + 32) = a6;
  *(_QWORD *)(v11 + 40) = a8;
  *(_QWORD *)(v11 + 48) = a7;
  *(_QWORD *)(v11 + 56) = a9;
  *(_QWORD *)(v11 + 64) = a10;
  *(_QWORD *)(v11 + 72) = v34;
  *(_QWORD *)(v11 + 80) = v38;
  *(_QWORD *)(v11 + 88) = &protocol witness table for HIDVirtualEventService;
  v39 = &v34[OBJC_IVAR____TtC11EnsembleHIDP33_70A939F407EA708C436DF5A2641C5F4325HIDVirtualServiceDelegate_service];
  *(_QWORD *)(v11 + 144) = a3;
  swift_weakAssign(v39, v11);
  return v11;
}

double sub_1001E5104()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  double result;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  v1 = v0[19];
  if (v1)
  {
    v0[19] = 0;
    v2 = *(_QWORD *)(v1 + 16);
    if (v2)
    {
      v3 = v1 + 32;
      do
      {
        sub_1000445C0(v3, (uint64_t)v8);
        v4 = v9;
        v5 = v10;
        v6 = sub_10000DBE4(v8, v9);
        sub_1001E6ED8((uint64_t)v6, v0, v4, v5);
        sub_100005988(v8);
        v3 += 40;
        --v2;
      }
      while (v2);
    }
    *(_QWORD *)&result = swift_bridgeObjectRelease().n128_u64[0];
  }
  return result;
}

uint64_t sub_1001E5194(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_1001E75D4(a1, a2);
  sub_1001E42AC(v3, v4, (uint64_t (*)(uint64_t))v2);
  v5 = sub_1001E75E4();
  if (*(_QWORD *)(v2 + 16))
    sub_1001E75C4(v5, (void (*)(void **__return_ptr, _QWORD *))sub_1001E5228);
  return sub_100084EF8(v2);
}

uint64_t sub_1001E51E0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v2;
  uint64_t v3;

  sub_1001E75D4(a1, a2);
  ((void (*)(void))v2)();
  v3 = sub_1001E75E4();
  if (*(_QWORD *)(v2 + 16))
    sub_1001E75C4(v3, (void (*)(void **__return_ptr, _QWORD *))sub_1001E5228);
  return sub_100084EF8(v2);
}

uint64_t HIDVirtualService.deinit()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 48));
  swift_release(*(_QWORD *)(v0 + 56));
  swift_release(*(_QWORD *)(v0 + 64));

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 80));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 120));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 128));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 152));
  return v0;
}

uint64_t HIDVirtualService.__deallocating_deinit()
{
  uint64_t v0;

  HIDVirtualService.deinit();
  return swift_deallocClassInstance(v0, 160, 7);
}

uint64_t sub_1001E52D0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  _BYTE v5[24];

  v1 = *v0;
  swift_beginAccess(v1 + 104, v5, 0, 0);
  v2 = *(_QWORD *)(v1 + 104);
  v3 = *(id *)(v1 + 112);
  return v2;
}

uint64_t sub_1001E5318()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = *v0;
  swift_beginAccess(*v0 + 96, v3, 0, 0);
  return *(_QWORD *)(v1 + 96);
}

void sub_1001E5354()
{
  HIDVirtualService.activate()();
}

void sub_1001E5374()
{
  HIDVirtualService.cancel()();
}

uint64_t HIDVirtualService.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  Swift::String v3;
  Swift::UInt64 v4;
  id v5;
  _QWORD v7[3];
  _BYTE v8[24];
  uint64_t v9;
  unint64_t v10;
  Swift::String v11;
  Swift::String v12;

  v1 = v0;
  v9 = 91;
  v10 = 0xE100000000000000;
  sub_10005FE28(v0 + 96, (uint64_t)v8);
  v7[0] = *(_QWORD *)(v0 + 96);
  v2 = sub_100168584();
  v11._countAndFlagsBits = String.init<A>(_:radix:uppercase:)(v7, 16, 0, &type metadata for UInt64, v2);
  sub_1001E7600(v11);
  sub_10000E594();
  v3._countAndFlagsBits = 8285;
  v3._object = (void *)0xE200000000000000;
  String.append(_:)(v3);
  sub_10005FE28(v0 + 104, (uint64_t)v7);
  v4 = *(_QWORD *)(v0 + 104);
  v5 = *(id *)(v1 + 112);
  v12._countAndFlagsBits = HIDServiceProperties.description.getter(v4, v5);
  sub_1001E7600(v12);

  sub_10000E594();
  return v9;
}

uint64_t sub_1001E5454()
{
  return HIDVirtualService.description.getter();
}

uint64_t HIDVirtualService.setProperty(_:forKey:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v8;
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
  NSObject *v19;
  uint64_t v20;
  os_log_type_t v21;
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
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE v58[24];
  uint64_t v59[3];
  _BYTE v60[32];

  v4 = v3;
  if (qword_1002B5200 != -1)
    swift_once(&qword_1002B5200, sub_1001E4C40);
  v8 = sub_1001E4A04(a2, a3, qword_1002B5FB8);
  if ((v8 & 1) != 0)
  {
    if (qword_1002B51F8 != -1)
      swift_once(&qword_1002B51F8, sub_1001E4BD4);
    v9 = type metadata accessor for Logger(0);
    v10 = sub_100006FB4(v9, (uint64_t)qword_1002B5FA0);
    sub_1001E75F4(v10, v11, v12, v13, v14, v15, v16, v17, v51, v53);
    swift_retain_n(v3, 2);
    v18 = swift_bridgeObjectRetain_n(a3, 2);
    v19 = Logger.logObject.getter(v18);
    v21 = static os_log_type_t.default.getter(v19, v20);
    if (os_log_type_enabled(v19, v21))
    {
      v55 = a1;
      v22 = swift_slowAlloc(32, -1);
      v54 = swift_slowAlloc(64, -1);
      v59[0] = v54;
      *(_DWORD *)v22 = 134218499;
      sub_10005FE28(v4 + 96, (uint64_t)v58);
      v23 = sub_10002645C();
      sub_1001E757C(v23, v24, v25, v22 + 12, v26, v27, v28);
      sub_10002645C();
      *(_WORD *)(v22 + 12) = 2082;
      sub_100040544();
      v56 = sub_100006FCC(a2, a3, v59);
      sub_1001E757C(v56, v29, v30, v22 + 22, v31, v32, v33);
      swift_bridgeObjectRelease_n(a3, 3);
      *(_WORD *)(v22 + 22) = 2081;
      v34 = sub_1001E5778((uint64_t)v60);
      v57 = sub_100006FCC(v34, v35, v59);
      sub_1001E757C(v57, v36, v37, v22 + 32, v38, v39, v40);
      swift_bridgeObjectRelease();
      sub_1000C2C88((uint64_t)v60, &qword_1002B34C0);
      _os_log_impl((void *)&_mh_execute_header, v19, v21, "%llx: SetProperty %{public}s: %{private}s", (uint8_t *)v22, 0x20u);
      swift_arrayDestroy(v54, 2, (char *)&type metadata for Any + 8);
      sub_100007958(v54);
      v41 = v22;
      a1 = v55;
      sub_100007958(v41);
    }
    else
    {
      swift_bridgeObjectRelease_n(a3, 2);
      swift_release_n(v4, 2);
      sub_1000C2C88((uint64_t)v60, &qword_1002B34C0);
    }

    sub_1001E75F4(v42, v43, v44, v45, v46, v47, v48, v49, v52, v54);
    sub_10000B2F8(v4 + 120, (uint64_t)v59, 33);
    sub_100040544();
    sub_100005410((uint64_t)v60, a2, a3);
    swift_endAccess(v59);
    if (a2 == 0xD00000000000001DLL && a3 == 0x8000000100259E20
      || (_stringCompareWithSmolCheck(_:_:expecting:)(a2, a3, 0xD00000000000001DLL, 0x8000000100259E20, 0) & 1) != 0)
    {
      sub_1001E580C(a1);
    }
  }
  return v8 & 1;
}

uint64_t sub_1001E5778(uint64_t a1)
{
  uint64_t v1;
  __int128 v3;
  uint64_t v4;
  _OWORD v5[2];

  sub_1001E72DC(a1, (uint64_t)&v3);
  if (v4)
  {
    sub_100005778(&v3, v5);
    sub_100007918((uint64_t)v5, (uint64_t)&v3);
    v1 = String.init<A>(describing:)(&v3, (char *)&type metadata for Any + 8);
    sub_100005988(v5);
  }
  else
  {
    sub_1000C2C88((uint64_t)&v3, &qword_1002B34C0);
    return 7104878;
  }
  return v1;
}

void sub_1001E580C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::UInt64 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15[3];
  __int128 v16;
  uint64_t v17;
  _BYTE v18[24];

  v2 = v1;
  swift_beginAccess(v2 + 104, v18, 0, 0);
  v4 = *(_QWORD *)(v2 + 104);
  v5 = *(id *)(v2 + 112);
  LOBYTE(v4) = HIDServiceProperties.deviceType.getter(v4, v5);

  if (static ReportID.== infix(_:_:)(v4, 2))
  {
    sub_1001E72DC(a1, (uint64_t)&v16);
    if (!v17)
    {
      sub_1000C2C88((uint64_t)&v16, &qword_1002B34C0);
      return;
    }
    v6 = sub_1000055B0((uint64_t *)&unk_1002B6170);
    if ((swift_dynamicCast(v15, &v16, (char *)&type metadata for Any + 8, v6, 6) & 1) == 0)
      return;
    v7 = v15[0];
    sub_100041C44(0xD000000000000027, 0x800000010025A660, v15[0], &v16);
    if (v17)
    {
      if (swift_dynamicCast(v15, &v16, (char *)&type metadata for Any + 8, &type metadata for Bool, 6))
      {
        v8 = LOBYTE(v15[0]);
        goto LABEL_10;
      }
    }
    else
    {
      sub_1000C2C88((uint64_t)&v16, &qword_1002B34C0);
    }
    v8 = 0;
LABEL_10:
    sub_100041C44(0x4950746E65696C43, 0xE900000000000044, v7, &v16);
    swift_bridgeObjectRelease();
    if (v17)
    {
      if (swift_dynamicCast(v15, &v16, (char *)&type metadata for Any + 8, &type metadata for Int32, 6))
      {
        v9 = LODWORD(v15[0]);
        if ((v8 & 1) == 0)
        {
LABEL_13:
          swift_beginAccess(v2 + 128, &v16, 32, 0);
          sub_1001E3E80(v9, *(_QWORD *)(v2 + 128));
          if (v10)
          {
            swift_endAccess(&v16);
            AnyCancellable.cancel()();
            swift_release();
          }
          else
          {
            swift_endAccess(&v16);
          }
          swift_beginAccess(v2 + 128, &v16, 33, 0);
          sub_1001D1100(v9);
          swift_endAccess(&v16);
          swift_release();
          goto LABEL_20;
        }
LABEL_17:
        v11 = swift_allocObject(&unk_100293730, 28, 7);
        *(_QWORD *)(v11 + 16) = v2;
        *(_DWORD *)(v11 + 24) = v9;
        swift_retain();
        v12 = sub_1001E5B14(v9, (uint64_t)sub_1001E74B8, v11);
        swift_release();
        swift_beginAccess(v2 + 128, &v16, 33, 0);
        sub_1001D122C(v12, v9);
        swift_endAccess(&v16);
LABEL_20:
        v13 = *(_QWORD *)(v2 + 40);
        swift_beginAccess(v2 + 128, &v16, 0, 0);
        v14 = *(_QWORD *)(*(_QWORD *)(v2 + 128) + 16) != 0;
        swift_beginAccess(v13 + 18, v15, 1, 0);
        *(_BYTE *)(v13 + 18) = v14;
        sub_1001E4338((uint64_t)_swiftEmptyArrayStorage, (void (*)(void **__return_ptr, _QWORD *))sub_1001E5228);
        return;
      }
    }
    else
    {
      sub_1000C2C88((uint64_t)&v16, &qword_1002B34C0);
    }
    v9 = 0xFFFFFFFFLL;
    if (!v8)
      goto LABEL_13;
    goto LABEL_17;
  }
}

uint64_t sub_1001E5B14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  __n128 v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t ObjectType;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)();
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD aBlock[6];

  v4 = v3;
  v31 = a2;
  v32 = a3;
  v6 = type metadata accessor for DispatchWorkItemFlags(0);
  v33 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for OS_dispatch_source.ProcessEvent(0, v11);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((int)a1 < 1)
  {
    v28 = type metadata accessor for AnyCancellable(0);
    swift_allocObject(v28, *(unsigned int *)(v28 + 48), *(unsigned __int16 *)(v28 + 52));
    v26 = (void (*)())CGSize.init(_:);
    v27 = 0;
  }
  else
  {
    sub_1000078E0(0, (unint64_t *)&qword_1002AAF50, OS_dispatch_source_ptr);
    v30 = v6;
    static OS_dispatch_source.ProcessEvent.exit.getter();
    v18 = static OS_dispatch_source.makeProcessSource(identifier:eventMask:queue:)(a1, v17, *(_QWORD *)(v4 + 144));
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    ObjectType = swift_getObjectType(v18);
    v20 = swift_allocObject(&unk_100293758, 32, 7);
    v21 = v32;
    *(_QWORD *)(v20 + 16) = v31;
    *(_QWORD *)(v20 + 24) = v21;
    aBlock[4] = sub_10018AE88;
    aBlock[5] = v20;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000E610;
    aBlock[3] = &unk_100293770;
    v22 = _Block_copy(aBlock);
    swift_retain();
    static DispatchQoS.unspecified.getter(v23);
    sub_10002DEB8();
    OS_dispatch_source.setEventHandler(qos:flags:handler:)(v13, v8, v22, ObjectType);
    _Block_release(v22);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v8, v30);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    swift_release();
    OS_dispatch_source.resume()();
    v24 = swift_allocObject(&unk_1002937A8, 24, 7);
    *(_QWORD *)(v24 + 16) = v18;
    v25 = type metadata accessor for AnyCancellable(0);
    swift_allocObject(v25, *(unsigned int *)(v25 + 48), *(unsigned __int16 *)(v25 + 52));
    v26 = sub_1001E750C;
    v27 = v24;
  }
  return AnyCancellable.init(_:)(v26, v27);
}

void sub_1001E5DA4(uint64_t a1)
{
  swift_getObjectType(a1);
  OS_dispatch_source.cancel()();
}

uint64_t sub_1001E5DC8(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE v7[24];

  v4 = a1 + 128;
  swift_beginAccess(a1 + 128, v7, 32, 0);
  sub_1001E3E80(a2, *(_QWORD *)(a1 + 128));
  if (v5)
  {
    swift_endAccess(v7);
    AnyCancellable.cancel()();
    swift_release();
  }
  else
  {
    swift_endAccess(v7);
  }
  swift_beginAccess(v4, v7, 33, 0);
  sub_1001D1100(a2);
  swift_endAccess(v7);
  return swift_release();
}

void sub_1001E5E78(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a1[3];
  v4 = a1[4];
  sub_10000DBE4(a1, v3);
  *a2 = dispatch thunk of HIDEventProtocol.wrappedValue.getter(v3, v4);
  sub_10000B350();
}

uint64_t sub_1001E5EB4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  char v8;

  result = swift_weakLoadStrong(v3 + OBJC_IVAR____TtC11EnsembleHIDP33_70A939F407EA708C436DF5A2641C5F4325HIDVirtualServiceDelegate_service);
  if (result)
  {
    if (a2 == 0xD000000000000019 && a3 == 0x800000010025A640
      || (_stringCompareWithSmolCheck(_:_:expecting:)(a2, a3, 0xD000000000000019, 0x800000010025A640, 0) & 1) != 0)
    {
      sub_1001E5104();
    }
    v8 = HIDVirtualService.setProperty(_:forKey:)(a1, a2, a3);
    swift_release();
    return v8 & 1;
  }
  return result;
}

double sub_1001E6058@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3;
  double result;

  if (swift_weakLoadStrong(v3 + OBJC_IVAR____TtC11EnsembleHIDP33_70A939F407EA708C436DF5A2641C5F4325HIDVirtualServiceDelegate_service))
  {
    HIDVirtualService.property(forKey:)(a1, a2, a3);
    swift_release();
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

id sub_1001E63F0()
{
  char *v0;
  objc_class *ObjectType;
  objc_super v3;

  ObjectType = (objc_class *)swift_getObjectType(v0);
  swift_weakInit(&v0[OBJC_IVAR____TtC11EnsembleHIDP33_70A939F407EA708C436DF5A2641C5F4325HIDVirtualServiceDelegate_service], 0);
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, "init");
}

_QWORD *sub_1001E6474(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *result;
  unint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _UNKNOWN **v12;
  uint64_t v13;
  __n128 v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  uint64_t v20;
  _UNKNOWN **v21;
  _QWORD *v22;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v18 = a1;
    else
      v18 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v2 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = _swiftEmptyArrayStorage;
  if (!v2)
    return v3;
  v22 = _swiftEmptyArrayStorage;
  result = sub_1001E663C(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v5 = 0;
    v3 = v22;
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
        v6 = (id)sub_1001E6658(v5, a1);
      else
        v6 = *(id *)(a1 + 8 * v5 + 32);
      v7 = v6;
      v8 = sub_1000078E0(0, (unint64_t *)&qword_1002B61E0, HIDEvent_ptr);
      v20 = v8;
      v21 = &protocol witness table for HIDEvent;
      v19[0] = v7;
      v22 = v3;
      v10 = v3[2];
      v9 = v3[3];
      if (v10 >= v9 >> 1)
      {
        sub_1001E663C((_QWORD *)(v9 > 1), v10 + 1, 1);
        v11 = v20;
        v12 = v21;
      }
      else
      {
        v11 = v8;
        v12 = &protocol witness table for HIDEvent;
      }
      ++v5;
      v13 = sub_10003FEF8((uint64_t)v19, v11);
      v14 = __chkstk_darwin(v13);
      v16 = (char *)v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, __n128))(v17 + 16))(v16, v14);
      sub_1001E6B30(v10, (uint64_t)v16, (uint64_t *)&v22, v11, (uint64_t)v12);
      sub_100005988(v19);
      v3 = v22;
    }
    while (v2 != v5);
    return v3;
  }
  __break(1u);
  return result;
}

_QWORD *sub_1001E663C(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_1001E6840(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

uint64_t sub_1001E6658(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  Swift::String v11;
  Swift::String v12;
  uint64_t ObjectType;
  Swift::String v14;
  __n128 v15;

  v4 = sub_1000078E0(0, (unint64_t *)&qword_1002B61E0, HIDEvent_ptr);
  if ((unint64_t)a2 >> 62)
  {
    if (a2 < 0)
      v8 = a2;
    else
      v8 = a2 & 0xFFFFFFFFFFFFFF8;
    a1 = _CocoaArrayWrapper.subscript.getter(a1, v8);
    v9 = objc_opt_self(HIDEvent);
    if (swift_dynamicCastObjCClass(a1, v9))
      return a1;
LABEL_13:
    _StringGuts.grow(_:)(85);
    v7 = 0xD000000000000046;
    v6 = 0x800000010025A6E0;
    goto LABEL_14;
  }
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (*(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a1)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  a1 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 8 * a1 + 0x20);
  swift_unknownObjectRetain(a1);
  v5 = objc_opt_self(HIDEvent);
  if (swift_dynamicCastObjCClass(a1, v5))
    return a1;
  _StringGuts.grow(_:)(82);
  v6 = 0x800000010025A690;
  v7 = 0xD000000000000043;
LABEL_14:
  String.append(_:)(*(Swift::String *)&v7);
  v11._countAndFlagsBits = _typeName(_:qualified:)(v4, 0);
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 0x756F662074756220;
  v12._object = (void *)0xEB0000000020646ELL;
  String.append(_:)(v12);
  ObjectType = swift_getObjectType(a1);
  swift_unknownObjectRelease(a1);
  v14._countAndFlagsBits = _typeName(_:qualified:)(ObjectType, 0);
  String.append(_:)(v14);
  v15 = swift_bridgeObjectRelease();
  result = _assertionFailure(_:_:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, 0, v15);
  __break(1u);
  return result;
}

_QWORD *sub_1001E6840(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  size_t v12;

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
    v10 = sub_1000055B0(&qword_1002B52F0);
    v11 = (_QWORD *)swift_allocObject(v10, 40 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v11[2] = v8;
    v11[3] = 2 * ((uint64_t)(v12 - 32) / 40);
  }
  else
  {
    v11 = _swiftEmptyArrayStorage;
  }
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || &a4[5 * v8 + 4] <= v11 + 4)
      memmove(v11 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
  }
  else
  {
    sub_1000055B0(&qword_1002B58A0);
    swift_arrayInitWithCopy(v11 + 4, a4 + 4);
  }
  swift_release();
  return v11;
}

void sub_1001E6964(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  Swift::Int v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  _QWORD *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[9];

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2
    || (sub_1000055B0((uint64_t *)&unk_1002B61F0),
        v3 = static _SetStorage.allocate(capacity:)(v2),
        v4 = v3,
        (v28 = *(_QWORD *)(a1 + 16)) == 0))
  {
LABEL_23:
    swift_bridgeObjectRelease();
    return;
  }
  v5 = 0;
  v6 = v3 + 56;
  while (v5 < *(_QWORD *)(a1 + 16))
  {
    v7 = (uint64_t *)(a1 + 32 + 16 * v5);
    v9 = *v7;
    v8 = v7[1];
    Hasher.init(_seed:)(v29, *(_QWORD *)(v4 + 40));
    swift_bridgeObjectRetain();
    String.hash(into:)(v29, v9, v8);
    v10 = Hasher._finalize()();
    v11 = -1 << *(_BYTE *)(v4 + 32);
    v12 = v10 & ~v11;
    v13 = v12 >> 6;
    v14 = *(_QWORD *)(v6 + 8 * (v12 >> 6));
    v15 = 1 << v12;
    if (((1 << v12) & v14) != 0)
    {
      v16 = *(_QWORD *)(v4 + 48);
      v17 = (_QWORD *)(v16 + 16 * v12);
      v18 = v17[1];
      v19 = *v17 == v9 && v18 == v8;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v17, v18, v9, v8, 0) & 1) != 0)
      {
LABEL_11:
        swift_bridgeObjectRelease();
        goto LABEL_22;
      }
      v20 = ~v11;
      while (1)
      {
        v12 = (v12 + 1) & v20;
        v13 = v12 >> 6;
        v14 = *(_QWORD *)(v6 + 8 * (v12 >> 6));
        v15 = 1 << v12;
        if ((v14 & (1 << v12)) == 0)
          break;
        v21 = (_QWORD *)(v16 + 16 * v12);
        v22 = v21[1];
        v23 = *v21 == v9 && v22 == v8;
        if (v23 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v21, v22, v9, v8, 0) & 1) != 0)
          goto LABEL_11;
      }
    }
    *(_QWORD *)(v6 + 8 * v13) = v15 | v14;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v24 = v9;
    v24[1] = v8;
    v25 = *(_QWORD *)(v4 + 16);
    v26 = __OFADD__(v25, 1);
    v27 = v25 + 1;
    if (v26)
      goto LABEL_25;
    *(_QWORD *)(v4 + 16) = v27;
LABEL_22:
    if (++v5 == v28)
      goto LABEL_23;
  }
  __break(1u);
LABEL_25:
  __break(1u);
}

uint64_t sub_1001E6B30(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v9;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v13 = a4;
  v14 = a5;
  v9 = sub_100005534(&v12);
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(v9, a2, a4);
  v10 = *a3;
  *(_QWORD *)(v10 + 16) = a1 + 1;
  return sub_100025A50(&v12, v10 + 40 * a1 + 32);
}

void sub_1001E6BA8(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __n128 v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t ObjectType;
  id v38;
  uint64_t v39;
  id v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE v47[24];

  v3 = a1;
  v4 = sub_1001E7514(v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = a2[7];
    swift_beginAccess(v6 + 24, v47, 0, 0);
    v7 = *(_QWORD *)(v6 + 24);
    *(_QWORD *)&v44 = v5;
    HIDEventProtocol.__bridgedValue.getter((uint64_t)&type metadata for PointerEvent, (uint64_t)&protocol witness table for PointerEvent);
    v9 = v8;
    IOHIDEventSetIntegerValue(v8, 1114115, v7);

    v10 = v5;
    v11 = objc_msgSend(v10, "children");
    if (v11)
    {
      v12 = v11;
      v13 = sub_1000078E0(0, (unint64_t *)&qword_1002B61E0, HIDEvent_ptr);
      v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v12, v13);

      v15 = sub_1001E6474(v14);
      swift_bridgeObjectRelease();
    }
    else
    {

      v15 = _swiftEmptyArrayStorage;
    }
    v19 = v15[2];
    if (v19)
    {
      v20 = (uint64_t)(v15 + 4);
      swift_bridgeObjectRetain();
      while (1)
      {
        sub_1000445C0(v20, (uint64_t)&v44);
        v21 = v45;
        v22 = v46;
        sub_10000DBE4(&v44, v45);
        v23 = dispatch thunk of HIDUsageProtocol.usage.getter(v21, v22);
        v24 = static ReportID.translation.getter();
        if (static HIDUsage.== infix(_:_:)(v23, v24))
          break;
        sub_100005988(&v44);
        v20 += 40;
        if (!--v19)
        {
          swift_bridgeObjectRelease();
          goto LABEL_11;
        }
      }
      swift_bridgeObjectRelease();
      sub_100025A50(&v44, (uint64_t)&v41);
    }
    else
    {
LABEL_11:
      v43 = 0;
      v41 = 0u;
      v42 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((_QWORD *)&v42 + 1))
    {
      sub_100025A50(&v41, (uint64_t)&v44);
      sub_1000445C0((uint64_t)&v44, (uint64_t)&v41);
      v25 = *((_QWORD *)&v42 + 1);
      v26 = v43;
      v27 = sub_10003FEF8((uint64_t)&v41, *((uint64_t *)&v42 + 1));
      v28 = __chkstk_darwin(v27);
      v30 = (char *)&v39 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, __n128))(v31 + 16))(v30, v28);
      v32 = (void *)sub_1001D3DB4((uint64_t)v30, v25, v26);
      sub_100005988(&v41);
      if (v32)
      {
        *(_QWORD *)&v41 = v32;
        HIDEventProtocol.__bridgedValue.getter((uint64_t)&type metadata for PointerEvent, (uint64_t)&protocol witness table for PointerEvent);
        v34 = v33;
        IOHIDEventSetIntegerValue(v33, 1114115, v7);

      }
      sub_100005988(&v44);
    }
    else
    {
      sub_1000C2C88((uint64_t)&v41, &qword_1002B5358);
    }
    v35 = a2[10];
    v36 = a2[11];
    ObjectType = swift_getObjectType(v35);
    v38 = v10;
    dispatch thunk of HIDVirtualEventServiceProtocol.dispatchEvent(_:)((uint64_t)v38, ObjectType, v36);

  }
  else
  {
    v16 = a2[10];
    v17 = a2[11];
    v18 = swift_getObjectType(v16);
    v40 = v3;
    dispatch thunk of HIDVirtualEventServiceProtocol.dispatchEvent(_:)((uint64_t)v40, v18, v17);

  }
}

uint64_t sub_1001E6ED8(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  __n128 v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, __n128);
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __n128 v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t ObjectType;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  _BYTE v57[24];

  v7 = *(_QWORD *)(a3 - 8);
  __chkstk_darwin(a1);
  v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)&v49 - v12;
  v14 = *(void (**)(char *, __n128))(v7 + 16);
  v14((char *)&v49 - v12, v11);
  ((void (*)(char *, char *, uint64_t))v14)(v9, v13, a3);
  v15 = sub_1001D3DB4((uint64_t)v9, a3, a4);
  if (v15)
  {
    v16 = (void *)v15;
    v17 = a2[7];
    swift_beginAccess(v17 + 24, v57, 0, 0);
    v18 = *(_QWORD *)(v17 + 24);
    *(_QWORD *)&v54 = v16;
    HIDEventProtocol.__bridgedValue.getter((uint64_t)&type metadata for PointerEvent, (uint64_t)&protocol witness table for PointerEvent);
    v20 = v19;
    IOHIDEventSetIntegerValue(v19, 1114115, v18);

    v21 = v16;
    v22 = objc_msgSend(v21, "children");
    if (v22)
    {
      v23 = v22;
      v24 = sub_1000078E0(0, (unint64_t *)&qword_1002B61E0, HIDEvent_ptr);
      v25 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v23, v24);

      v26 = sub_1001E6474(v25);
      swift_bridgeObjectRelease();
    }
    else
    {

      v26 = _swiftEmptyArrayStorage;
    }
    v30 = v26[2];
    if (v30)
    {
      v49 = v18;
      v50 = v7;
      v31 = (uint64_t)(v26 + 4);
      swift_bridgeObjectRetain();
      while (1)
      {
        sub_1000445C0(v31, (uint64_t)&v54);
        v32 = v55;
        v33 = v56;
        sub_10000DBE4(&v54, v55);
        v34 = dispatch thunk of HIDUsageProtocol.usage.getter(v32, v33);
        v35 = static ReportID.translation.getter();
        if (static HIDUsage.== infix(_:_:)(v34, v35))
          break;
        sub_100005988(&v54);
        v31 += 40;
        if (!--v30)
        {
          swift_bridgeObjectRelease();
          v18 = v49;
          v7 = v50;
          goto LABEL_11;
        }
      }
      swift_bridgeObjectRelease();
      sub_100025A50(&v54, (uint64_t)&v51);
      swift_bridgeObjectRelease();
      v18 = v49;
      v7 = v50;
    }
    else
    {
LABEL_11:
      v53 = 0;
      v51 = 0u;
      v52 = 0u;
      swift_bridgeObjectRelease();
    }
    if (*((_QWORD *)&v52 + 1))
    {
      sub_100025A50(&v51, (uint64_t)&v54);
      sub_1000445C0((uint64_t)&v54, (uint64_t)&v51);
      v36 = *((_QWORD *)&v52 + 1);
      v37 = v53;
      v38 = sub_10003FEF8((uint64_t)&v51, *((uint64_t *)&v52 + 1));
      v39 = __chkstk_darwin(v38);
      v41 = (char *)&v49 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, __n128))(v42 + 16))(v41, v39);
      v43 = (void *)sub_1001D3DB4((uint64_t)v41, v36, v37);
      sub_100005988(&v51);
      if (v43)
      {
        *(_QWORD *)&v51 = v43;
        HIDEventProtocol.__bridgedValue.getter((uint64_t)&type metadata for PointerEvent, (uint64_t)&protocol witness table for PointerEvent);
        v45 = v44;
        IOHIDEventSetIntegerValue(v44, 1114115, v18);

      }
      sub_100005988(&v54);
    }
    else
    {
      sub_1000C2C88((uint64_t)&v51, &qword_1002B5358);
    }
    v46 = a2[11];
    ObjectType = swift_getObjectType(a2[10]);
    v29 = v21;
    dispatch thunk of HIDVirtualEventServiceProtocol.dispatchEvent(_:)((uint64_t)v29, ObjectType, v46);

  }
  else
  {
    v27 = a2[11];
    v28 = swift_getObjectType(a2[10]);
    v29 = (id)dispatch thunk of HIDEventProtocol.wrappedValue.getter(a3, a4);
    dispatch thunk of HIDVirtualEventServiceProtocol.dispatchEvent(_:)((uint64_t)v29, v28, v27);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v13, a3);
}

uint64_t type metadata accessor for HIDVirtualServiceDelegate()
{
  return objc_opt_self(_TtC11EnsembleHIDP33_70A939F407EA708C436DF5A2641C5F4325HIDVirtualServiceDelegate);
}

uint64_t sub_1001E72A0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1001E72C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1001E72D4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1001E72DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000055B0(&qword_1002B34C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for HIDVirtualService()
{
  return objc_opt_self(_TtC11EnsembleHID17HIDVirtualService);
}

uint64_t *initializeBufferWithCopyOfBuffer for HIDVirtualService.State(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a2;
  *a1 = *a2;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for HIDVirtualService.State(_QWORD *a1)
{
  return swift_bridgeObjectRelease(*a1);
}

uint64_t *assignWithCopy for HIDVirtualService.State(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t *assignWithTake for HIDVirtualService.State(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for HIDVirtualService.State(uint64_t *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HIDVirtualService.State(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for HIDVirtualService.State()
{
  return &type metadata for HIDVirtualService.State;
}

uint64_t sub_1001E7494()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 28, 7);
}

uint64_t sub_1001E74B8()
{
  uint64_t v0;

  return sub_1001E5DC8(*(_QWORD *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

uint64_t sub_1001E74C4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1001E74E8()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_1001E750C()
{
  uint64_t v0;

  sub_1001E5DA4(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1001E7514(void *a1)
{
  int v2;
  int v3;
  int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  HIDEvent.eventType.getter();
  v3 = v2;
  v4 = static ReportID.translation.getter();
  if (static HIDUsage.== infix(_:_:)(v3, v4))
  {
    v5 = a1;
    CGSize.init(_:)(v5);
    v7 = v6;

  }
  else
  {

    return 0;
  }
  return v7;
}

uint64_t sub_1001E757C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  uint64_t v8;
  va_list va;

  va_start(va, a7);
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(va, v8, v7, a4);
}

uint64_t sub_1001E758C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v0 + 16))(v1, *(_QWORD *)(v3 - 112), v2);
}

uint64_t sub_1001E75A0()
{
  uint64_t v0;
  uint64_t v1;

  return dispatch thunk of IteratorProtocol.next()(v0, v1);
}

BOOL sub_1001E75B4()
{
  uint64_t v0;
  char v1;
  uint64_t v2;

  return static ReportID.== infix(_:_:)(*(_BYTE *)(*(_QWORD *)(v0 + 48) + v2), v1);
}

void sub_1001E75C4(uint64_t a1, void (*a2)(void **__return_ptr, _QWORD *))
{
  uint64_t v2;

  sub_1001E4338(v2, a2);
}

uint64_t sub_1001E75D4(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_1001E75E4()
{
  uint64_t v0;
  unint64_t v1;

  return sub_100022AEC(v0, v1);
}

uint64_t sub_1001E75F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  va_list va;

  va_start(va, a10);
  return sub_1001E72DC(v10, (uint64_t)va);
}

void sub_1001E7600(Swift::String a1)
{
  String.append(_:)(a1);
}

uint64_t sub_1001E7608(uint64_t a1, uint64_t a2)
{
  return swift_getAssociatedTypeWitness(a1, a2);
}

void sub_1001E7614(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1001E7664()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v6;
  _QWORD v7[2];
  _QWORD v8[11];

  if (BYTE6(v1) == 16)
  {
    v7[0] = 0;
    v7[1] = 0;
    v8[0] = v2;
    v8[1] = v1;
    v3 = sub_1000DF694();
    ((void (*)(_QWORD *, _QWORD *, void *, unint64_t))DataProtocol.copyBytes(to:))(v7, v8, &type metadata for Data, v3);
    UUID.init(uuid:)(LOBYTE(v7[0]), BYTE1(v7[0]), BYTE2(v7[0]), BYTE3(v7[0]), BYTE4(v7[0]), BYTE5(v7[0]));
    sub_1000DF6D0();
    v4 = type metadata accessor for UUID(0);
    return _s13EnsembleAgent26PasteboardAcquisitionErrorOwst_0(v0, 0, 1, v4);
  }
  else
  {
    sub_1000DF6D0();
    v6 = type metadata accessor for UUID(0);
    return _s13EnsembleAgent26PasteboardAcquisitionErrorOwst_0(v0, 1, 1, v6);
  }
}

void HIDReport.subscript.getter(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = sub_1000055B0(&qword_1002ACC90);
  __chkstk_darwin(v5);
  v6 = sub_10000E440();
  v7 = __chkstk_darwin(v6);
  UUID.init()(v7);
  if ((a1 & 7) == 0)
    __asm { BR              X11 }
  sub_1001E7CD4((uint64_t)"Fatal error", v8, v9, v10, 0x800000010025A750, (uint64_t)"HIDReport/HIDReportUUID.swift", v11, v12, 21, 0);
  __break(1u);
  JUMPOUT(0x1001E7968);
}

void HIDReport.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a2 & 7) == 0)
    __asm { BR              X12 }
  sub_1001E7CD4((uint64_t)"Fatal error", a2, a3, a4, 0x800000010025A750, (uint64_t)"HIDReport/HIDReportUUID.swift", a7, a8, 35, 0);
  __break(1u);
  JUMPOUT(0x1001E7B0CLL);
}

uint64_t sub_1001E7B1C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v6;
  uint64_t v7;
  _QWORD v8[5];

  v4 = a4 + 16;
  if (__OFADD__(a4, 16))
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v4 < a4)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  v8[3] = &type metadata for UnsafeMutableRawBufferPointer;
  v8[4] = &protocol witness table for UnsafeMutableRawBufferPointer;
  v8[0] = result;
  v8[1] = a2;
  v6 = sub_10000DBE4(v8, (uint64_t)&type metadata for UnsafeMutableRawBufferPointer);
  if (*v6)
    v7 = v6[1] - *v6;
  else
    v7 = 0;
  Data._Representation.replaceSubrange(_:with:count:)(a4, v4, *v6, v7);
  return sub_100005988(v8);
}

void (*HIDReport.subscript.modify(_QWORD *a1, uint64_t a2))(uint64_t **a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;

  v5 = malloc(0x30uLL);
  *a1 = v5;
  *v5 = a2;
  v5[1] = v2;
  v6 = sub_10000E440();
  v5[2] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v5[4] = malloc(v8);
  v5[5] = malloc(v8);
  HIDReport.subscript.getter(a2, *v2, v2[1]);
  return sub_1001E7C3C;
}

void sub_1001E7C3C(uint64_t **a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v8 = *a1;
  v9 = (void *)(*a1)[4];
  v10 = (void *)(*a1)[5];
  if ((a2 & 1) != 0)
  {
    v11 = v8[2];
    v12 = v8[3];
    v13 = *v8;
    (*(void (**)(uint64_t, void *, uint64_t))(v12 + 16))((*a1)[4], v10, v11);
    HIDReport.subscript.setter((uint64_t)v9, v13, v14, v15, v16, v17, v18, v19);
    (*(void (**)(void *, uint64_t))(v12 + 8))(v10, v11);
  }
  else
  {
    HIDReport.subscript.setter((*a1)[5], *v8, a3, a4, a5, a6, a7, a8);
  }
  free(v10);
  free(v9);
  free(v8);
}

uint64_t sub_1001E7CD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10)
{
  return _assertionFailure(_:_:file:line:flags:)(a1, 11, 2, 0xD00000000000002BLL, a5, a6, 29, 2, a9, a10);
}

uint64_t FixedWidthInteger.init(scaledValue:logicalMinimum:logicalMaximum:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  void (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  double v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  char v27;
  uint64_t v28;
  char v29;
  double v30;
  double v31;
  double v32;
  double v33;
  unint64_t v34;
  double v35;
  double v36;
  double v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;

  v41 = a2;
  v42 = a5;
  v10 = type metadata accessor for Optional(0, a3);
  v39 = *(_QWORD *)(v10 - 8);
  v40 = v10;
  v11 = __chkstk_darwin(v10);
  v13 = (char *)&v39 - v12;
  v14 = *(_QWORD *)(a3 - 8);
  v15 = __chkstk_darwin(v11);
  v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v19 = (char *)&v39 - v18;
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v43 = a1;
  v20((char *)&v39 - v18, a1, a3);
  v21 = *(_QWORD *)(a4 + 8);
  if (sub_1001E8128() < 65)
  {
    v23 = sub_1001E8104();
    v24 = sub_1001E8134();
    sub_10012417C((uint64_t)v19);
    if ((v23 & 1) != 0)
      v22 = (double)v24;
    else
      v22 = (double)(unint64_t)v24;
  }
  else
  {
    sub_1001E807C();
    sub_1001E80B8();
    sub_1001E8114((uint64_t)&v44, (uint64_t)v19, (uint64_t)&type metadata for Double);
    sub_10012417C((uint64_t)v19);
    v22 = v44;
  }
  v25 = v41;
  v20(v17, v41, a3);
  if (sub_1001E8128() <= 64)
  {
    v27 = sub_1001E8104();
    v28 = sub_1001E8134();
    sub_10012417C((uint64_t)v17);
    if ((v27 & 1) != 0)
      v26 = (double)v28;
    else
      v26 = (double)(unint64_t)v28;
  }
  else
  {
    sub_1001E807C();
    sub_1001E80B8();
    sub_1001E8114((uint64_t)&v44, (uint64_t)v17, (uint64_t)&type metadata for Double);
    sub_10012417C((uint64_t)v17);
    v26 = v44;
  }
  v29 = sub_1001E8104();
  v30 = v26 * a6;
  v31 = fabs(a6) * v22;
  if (a6 < 0.0)
    v30 = v31;
  if ((v29 & 1) != 0)
    v32 = v30;
  else
    v32 = v22 + (v26 - v22) * a6;
  if (v32 > v22)
    v33 = v32;
  else
    v33 = v22;
  if (v26 < v33)
    v33 = v26;
  v44 = v33;
  v34 = sub_1001E807C();
  dispatch thunk of BinaryInteger.init<A>(exactly:)(&v44, &type metadata for Double, v34, a3, v21);
  if (_s13EnsembleAgent26PasteboardAcquisitionErrorOwet_0((uint64_t)v13, 1, a3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v39 + 8))(v13, v40);
    v35 = 0.0 - v26;
    if (0.0 - v26 < INFINITY)
      *(_QWORD *)&v35 = ((COERCE__INT64(0.0 - v26) >> 63) | 1) + COERCE__INT64(0.0 - v26);
    v36 = -v35;
    v37 = v22 + 0.0;
    if (v22 + 0.0 < INFINITY)
      *(_QWORD *)&v37 += (*(uint64_t *)&v37 >> 63) | 1;
    if (v32 <= v36)
    {
      if (v32 >= v37)
      {
        if (v32 > v37)
          v37 = v32;
        if (v37 <= v36)
          v36 = v37;
        v44 = v36;
        dispatch thunk of BinaryInteger.init<A>(_:)(&v44, &type metadata for Double, v34, a3, v21);
        sub_10012417C(v25);
        return sub_10012417C(v43);
      }
      else
      {
        sub_10012417C(v25);
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(v42, v43, a3);
      }
    }
    else
    {
      sub_10012417C(v43);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(v42, v25, a3);
    }
  }
  else
  {
    sub_10012417C(v25);
    sub_10012417C(v43);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(v42, v13, a3);
  }
}

unint64_t sub_1001E807C()
{
  unint64_t result;

  result = qword_1002B6200;
  if (!qword_1002B6200)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Double, &type metadata for Double);
    atomic_store(result, (unint64_t *)&qword_1002B6200);
  }
  return result;
}

unint64_t sub_1001E80B8()
{
  unint64_t result;

  result = qword_1002B6208;
  if (!qword_1002B6208)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for UInt64, &type metadata for UInt64);
    atomic_store(result, (unint64_t *)&qword_1002B6208);
  }
  return result;
}

uint64_t dispatch thunk of HIDUsageProtocol.usage.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of HIDReportDescriptorItemProtocol.bTag.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_1001E8104()
{
  uint64_t v0;
  uint64_t v1;

  return dispatch thunk of static BinaryInteger.isSigned.getter(v0, v1);
}

uint64_t sub_1001E8114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return static BinaryFloatingPoint<>._convert<A>(from:)(a1, a2, a3, v3, v4, v5);
}

uint64_t sub_1001E8128()
{
  uint64_t v0;
  uint64_t v1;

  return dispatch thunk of BinaryInteger.bitWidth.getter(v0, v1);
}

uint64_t sub_1001E8134()
{
  uint64_t v0;
  uint64_t v1;

  return dispatch thunk of BinaryInteger._lowWord.getter(v0, v1);
}

uint64_t HIDReport.startIndex.getter(uint64_t a1, unint64_t a2)
{
  return ((uint64_t (*)(void))((char *)&loc_1001E8150 + dword_1001E8184[a2 >> 62]))();
}

uint64_t sub_1001E8164()
{
  uint64_t v0;
  char v1;

  sub_1000E7368();
  if (!v1)
  {
    __break(1u);
    JUMPOUT(0x1001E8184);
  }
  return sub_1001E8160(v0);
}

uint64_t HIDReport.init(bitCount:id:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  _QWORD v7[2];

  if ((a1 & 7) != 0)
    v4 = (a1 >> 3) + 1;
  else
    v4 = a1 >> 3;
  v7[0] = Data.init(count:)(v4);
  v7[1] = v5;
  sub_1001AEDEC((uint64_t)v7);
  result = v7[0];
  if (a1 >= 8)
  {
    Data._Representation.subscript.setter(a2, 0);
    return v7[0];
  }
  return result;
}

uint64_t HIDReport.reportID.setter(uint64_t a1)
{
  return Data._Representation.subscript.setter(a1, 0);
}

void HIDReport.init<A>(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  uint64_t v11;

  sub_1001EB888();
  v4 = *(_QWORD *)(v3 - 8);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v4 + 16))(v8, v2, v1, v6);
  Data.init<A>(_:)(v8, v1, v0);
  v9 = sub_1001847D8();
  v10(v9);
  sub_10002644C();
}

void HIDReport.initialize(from:)(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_1001E82E4()
{
  uint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_1001E831C + *((int *)qword_1001E8410 + (*(_QWORD *)(v0 + 8) >> 62))))();
}

uint64_t sub_1001E832C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  uint64_t result;

  if (a1 < BYTE6(v5))
    return 0;
  sub_100140EA0();
  sub_10013DE98(v3, v1);
  v7 = v6;
  sub_1001B76FC(v3);
  sub_10002517C(v4, v5);
  sub_10013DE98(v4, v5);
  v9 = v8;
  sub_1001E1A70();
  if ((v7 & 0x100) != 0)
  {
    if ((v9 & 0x100) != 0)
    {
LABEL_7:
      sub_100140EA0();
      sub_1001E1A70();
      *v2 = v3;
      v2[1] = v1;
      return 1;
    }
    return 0;
  }
  result = 0;
  if ((v9 & 0x100) == 0 && v7 == v9)
    goto LABEL_7;
  return result;
}

uint64_t HIDReport.reportID.getter(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;

  sub_1001B3530(a1, a2);
  v3 = sub_100026B88();
  sub_10013DE98(v3, v4);
  v6 = v5;
  sub_1001B76FC(v2);
  if ((v6 & 0x100) != 0)
    return 0;
  else
    return v6;
}

uint64_t sub_1001E8460@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = HIDReport.reportID.getter(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  *a2 = result;
  return result;
}

void HIDReport.reportID.modify(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int16 v7;
  __int16 v8;
  uint64_t v9;
  unint64_t v10;
  char v11;

  *(_QWORD *)a1 = v1;
  v3 = sub_1001847D8();
  sub_10002517C(v3, v4);
  v5 = sub_1001847D8();
  sub_10013DE98(v5, v6);
  v8 = v7;
  v9 = sub_1001847D8();
  sub_100022AEC(v9, v10);
  if ((v8 & 0x100) != 0)
    v11 = 0;
  else
    v11 = v8;
  *(_BYTE *)(a1 + 8) = v11;
  sub_10000B350();
}

void sub_1001E84E4(uint64_t a1)
{
  Data._Representation.subscript.setter(*(unsigned __int8 *)(a1 + 8));
  sub_1000050D4();
}

uint64_t HIDReport.withUnsafeBytes<A>(_:)()
{
  return Data.withUnsafeBytes<A>(_:)();
}

uint64_t sub_1001E851C()
{
  return HIDReport.withUnsafeBytes<A>(_:)();
}

uint64_t HIDReport.withUnsafeMutableBytes<A>(_:)()
{
  return Data.withUnsafeMutableBytes<A>(_:)();
}

void static HIDReport.< infix(_:_:)(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1001E8594()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_100140EA0();
  return sub_1001EA8C4(v1, v3 & 0xFFFFFFFFFFFFFFLL, v2, v0) & 1;
}

void sub_1001E8678(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_1001E86D8(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t __s2, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  _BYTE *v22;
  const void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  size_t v27;
  uint64_t result;
  BOOL v29;
  char v30;
  char v31;
  uint64_t v32;
  __int16 v33;
  char v34;
  char v35;
  char v36;
  char v37;

  v32 = v24;
  v33 = v26;
  v34 = BYTE2(v26);
  v35 = BYTE3(v26);
  v36 = BYTE4(v26);
  v37 = BYTE5(v26);
  if (!v23)
  {
    __break(1u);
    JUMPOUT(0x1001E8894);
  }
  if (BYTE6(v26) >= v25 - (uint64_t)v23)
    v27 = v25 - (_QWORD)v23;
  else
    v27 = BYTE6(v26);
  result = memcmp(v23, &v32, v27);
  if ((_DWORD)result)
    v29 = 0;
  else
    v29 = v25 - (uint64_t)v23 < BYTE6(v26);
  v30 = v29;
  if ((int)result >= 0)
    v31 = v30;
  else
    v31 = 1;
  *v22 = v31 & 1;
  return result;
}

uint64_t sub_1001E88CC@<X0>(uint64_t __s2@<X0>, void *__s1@<X2>, uint64_t a3@<X1>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  BOOL v9;
  char v10;
  char v11;

  if (!__s2)
  {
    if (__s1)
    {
LABEL_18:
      __break(1u);
      return __s2;
    }
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (!__s1)
    goto LABEL_17;
  v6 = a4 - (_QWORD)__s1;
  v7 = a3 - __s2;
  if (a3 - __s2 >= a4 - (uint64_t)__s1)
    v8 = a4 - (_QWORD)__s1;
  else
    v8 = a3 - __s2;
  __s2 = memcmp(__s1, (const void *)__s2, v8);
  if ((_DWORD)__s2)
    v9 = 0;
  else
    v9 = v6 < v7;
  v10 = v9;
  if ((int)__s2 >= 0)
    v11 = v10;
  else
    v11 = 1;
  *a5 = v11;
  return __s2;
}

void sub_1001E894C(uint64_t *a1)
{
  static HIDReport.< infix(_:_:)(*a1, a1[1]);
}

void sub_1001E8960()
{
  sub_1001F0118();
}

void sub_1001E8974(uint64_t *a1)
{
  sub_1001F0240(*a1, a1[1]);
}

void sub_1001E8988()
{
  sub_1001F0360();
}

void HIDReport.description.getter(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

void sub_1001E89C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  Swift::String v4;

  sub_1000E7368();
  if (!v3)
  {
    __break(1u);
    JUMPOUT(0x1001E8A5CLL);
  }
  if (v2 < 32)
  {
    HIDReport.debugDescription.getter(v0, v1);
  }
  else
  {
    HIDReport.count.getter(v0, v1);
    dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
    v4._countAndFlagsBits = 0x7374696220;
    v4._object = (void *)0xE500000000000000;
    String.append(_:)(v4);
  }
}

void HIDReport.debugDescription.getter(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1001E8AC8()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  unint64_t v8;
  _QWORD v10[16];

  sub_1000E7368();
  if (!v3)
  {
    __break(1u);
    JUMPOUT(0x1001E8BC8);
  }
  v4 = 8 * v2;
  if (8 * v2 < 1)
    return 0;
  v5 = 0;
  do
  {
    if (__OFADD__(v5, 8))
      v6 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v6 = v5 + 8;
    sub_1001E8BE0(v5, v1, v0);
    LOBYTE(v10[0]) = v7;
    v8 = sub_1001EB410();
    String.init<A>(_:radix:uppercase:)(v10, 16, 0, &type metadata for UInt8, v8);
    if (((uint64_t (*)(void))String.count.getter)() <= 1)
    {
      v10[0] = 48;
      v10[1] = 0xE100000000000000;
      sub_1001EB8B4();
      swift_bridgeObjectRelease();
    }
    sub_1001EB8B4();
    swift_bridgeObjectRelease();
    v5 = v6;
  }
  while (v6 < v4);
  return v10[2];
}

void sub_1001E8BE0(char a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3;

  v3 = a3 >> 62;
  if ((a1 & 7) != 0)
    __asm { BR              X13 }
  __asm { BR              X12 }
}

uint64_t sub_1001E8F04@<X0>(int a1@<W8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *(_QWORD *)(v3 + 16);
  if ((unint64_t)(v4 - 0x1000000000000000) >> 61 != 7)
  {
    __break(1u);
    JUMPOUT(0x1001E8F20);
  }
  if (__OFADD__(8 * v4, v2))
  {
    __break(1u);
    JUMPOUT(0x1001E8FB8);
  }
  return ((uint64_t (*)(void))((char *)&loc_1001E8D80 + dword_1001E905C[a1]))();
}

uint64_t sub_1001E906C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;

  sub_1001EB790();
  sub_1001EB818(v38, v39);
  sub_1001EB774();
  v43 = HIWORD(v42);
  v44 = HIBYTE(v37);
  v45 = v36 >> 8;
  v46 = v36 >> 16;
  v47 = v36 >> 24;
  v48 = HIDWORD(v36);
  v49 = v36 >> 40;
  if ((v40 & 7) != 0)
    return ((uint64_t (*)(uint64_t, unint64_t, unint64_t, unint64_t, unint64_t, unint64_t, unint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_1001E90F0 + dword_1001E95AC[v41]))(v40, v43, v44, v45, v46, v47, v48, v49, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27,
             a28,
             a29,
             a30,
             a31,
             a32,
             a33,
             a34,
             a35,
             a36);
  else
    return ((uint64_t (*)(uint64_t, unint64_t, unint64_t, unint64_t, unint64_t, unint64_t, unint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_1001E9374 + dword_1001E95CC[v41]))(v40, v43, v44, v45, v46, v47, v48, v49, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27,
             a28,
             a29,
             a30,
             a31,
             a32,
             a33,
             a34,
             a35,
             a36);
}

void sub_1001E95EC()
{
  uint64_t *v0;

  HIDReport.debugDescription.getter(*v0, v0[1]);
}

void sub_1001E95F4()
{
  uint64_t *v0;

  HIDReport.description.getter(*v0, v0[1]);
}

uint64_t HIDReport.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  sub_1001EB888();
  sub_10002517C(v1, v2);
  v3 = sub_1001847D8();
  Data.hash(into:)(v3, v4, v0);
  v5 = sub_100026B88();
  return sub_100022AEC(v5, v6);
}

Swift::Int HIDReport.hashValue.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, 0);
  v4 = sub_100026B88();
  sub_10002517C(v4, v5);
  Data.hash(into:)(v7, a1, a2);
  sub_1001B76FC(a1);
  return Hasher._finalize()();
}

Swift::Int sub_1001E9698()
{
  uint64_t *v0;

  return HIDReport.hashValue.getter(*v0, v0[1]);
}

uint64_t sub_1001E96A0()
{
  return HIDReport.hash(into:)();
}

Swift::Int sub_1001E96A8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  _QWORD v5[9];

  v2 = *v1;
  v3 = v1[1];
  Hasher.init(_seed:)(v5, a1);
  sub_10002517C(v2, v3);
  Data.hash(into:)(v5, v2, v3);
  sub_100022AEC(v2, v3);
  return Hasher._finalize()();
}

Swift::Int HIDReport.subscript.getter(Swift::Int a1, Swift::Int a2, uint64_t a3, uint64_t a4)
{
  Swift::Int v7;
  Swift::Int result;

  v7 = HIDReport.offset(for:)(a1);
  result = HIDReport.offset(for:)(a2);
  if (result >= v7)
    return Data._Representation.subscript.getter(v7, result, a3, a4);
  __break(1u);
  return result;
}

Swift::Int sub_1001E976C@<X0>(uint64_t *a1@<X0>, Swift::Int *a2@<X1>, Swift::Int *a3@<X8>)
{
  Swift::Int result;
  Swift::Int v5;

  result = HIDReport.subscript.getter(*a2, a2[1], *a1, a1[1]);
  *a3 = result;
  a3[1] = v5;
  return result;
}

Swift::Int sub_1001E9798(uint64_t *a1, uint64_t a2, Swift::Int *a3)
{
  Swift::Int v3;
  Swift::Int v4;
  uint64_t v5;
  unint64_t v6;

  v3 = *a3;
  v4 = a3[1];
  v5 = *a1;
  v6 = a1[1];
  sub_10002517C(*a1, v6);
  return HIDReport.subscript.setter(v5, v6, v3, v4);
}

Swift::Int HIDReport.subscript.setter(uint64_t a1, unint64_t a2, Swift::Int a3, Swift::Int a4)
{
  Swift::Int v7;
  Swift::Int result;

  v7 = sub_1001EB8A8(a3);
  result = sub_1001EB8A8(a4);
  if (result < v7)
  {
    __break(1u);
  }
  else
  {
    sub_1000E6CB8(a1, a2);
    return sub_100022AEC(a1, a2);
  }
  return result;
}

Swift::Int __swiftcall HIDReport.offset(for:)(Swift::Int a1)
{
  unint64_t v1;

  return ((uint64_t (*)(Swift::Int))((char *)&loc_1001E9888 + dword_1001E98B4[v1 >> 62]))(a1);
}

uint64_t sub_1001E9898(uint64_t a1, int a2)
{
  BOOL v2;
  uint64_t result;

  v2 = __OFADD__(a2, a1 >> 3);
  result = a2 + (a1 >> 3);
  if (v2)
  {
    __break(1u);
    JUMPOUT(0x1001E98B4);
  }
  return result;
}

void HIDReport.subscript.modify(_QWORD *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t *v3;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  Swift::Int v10;
  Swift::Int v11;
  uint64_t v12;

  v7 = malloc(0x28uLL);
  *a1 = v7;
  v7[3] = a3;
  v7[4] = v3;
  v7[2] = a2;
  v9 = *v3;
  v8 = v3[1];
  v10 = sub_1001EB90C(a2);
  v11 = sub_1001EB90C(a3);
  if (v11 < v10)
  {
    __break(1u);
  }
  else
  {
    *v7 = Data._Representation.subscript.getter(v10, v11, v9, v8);
    v7[1] = v12;
    sub_10002644C();
  }
}

void sub_1001E994C(uint64_t **a1, char a2)
{
  uint64_t *v3;
  Swift::Int v4;
  uint64_t v5;
  uint64_t v6;
  Swift::Int v7;
  Swift::Int v8;
  uint64_t v9;
  unint64_t v10;

  v3 = *a1;
  v4 = (*a1)[3];
  v5 = (*a1)[1];
  v6 = **a1;
  v7 = sub_1001EB8D4((*a1)[2]);
  v8 = sub_1001EB8D4(v4);
  if ((a2 & 1) != 0)
  {
    if (v8 >= v7)
    {
      sub_1001D2D70(v6);
      sub_1001EB858(v6, v5);
      sub_1001EB8F4();
      v9 = *v3;
      v10 = v3[1];
LABEL_6:
      sub_100022AEC(v9, v10);
      free(v3);
      return;
    }
    __break(1u);
  }
  else if (v8 >= v7)
  {
    sub_1001EB858(v6, v5);
    v9 = v6;
    v10 = v5;
    goto LABEL_6;
  }
  __break(1u);
}

Swift::Int __swiftcall HIDReport.shift(for:)(Swift::Int a1)
{
  return a1 & 7;
}

Swift::UInt8 __swiftcall HIDReport.mask(for:)(Swift::Int a1)
{
  return 1 << (a1 & 7);
}

BOOL HIDReport.subscript.getter()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  Swift::Int v3;
  Swift::Int v4;

  sub_1001EB888();
  v4 = HIDReport.offset(for:)(v3);
  return (Data.subscript.getter(v4, v1, v0) & (1 << (v2 & 7))) != 0;
}

BOOL sub_1001E9A70@<W0>(_BOOL8 *a1@<X8>)
{
  _BOOL8 result;

  result = HIDReport.subscript.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1001E9AA0(uint64_t *a1, uint64_t a2, Swift::Int *a3)
{
  return HIDReport.subscript.setter(*a1, *a3);
}

uint64_t HIDReport.subscript.setter(uint64_t a1, Swift::Int a2)
{
  char v2;
  Swift::Int v4;
  int v5;
  int v6;
  uint64_t v7;

  v2 = a2;
  v4 = sub_1001EB7EC(a2);
  v5 = 1 << (v2 & 7);
  v6 = sub_1001EB7F8(v4);
  if (a1)
    v7 = v6 | v5;
  else
    v7 = v6 & ~v5;
  return Data._Representation.subscript.setter(v7);
}

void HIDReport.subscript.modify(_QWORD *a1, Swift::Int a2)
{
  uint64_t *v2;
  char v3;
  uint64_t v5;
  uint64_t v6;
  Swift::Int v7;

  v3 = a2;
  a1[1] = a2;
  a1[2] = v2;
  v6 = *v2;
  v5 = v2[1];
  v7 = HIDReport.offset(for:)(a2);
  *a1 = (Data.subscript.getter(v7, v6, v5) & (1 << (v3 & 7))) != 0;
  sub_10000B350();
}

void sub_1001E9B94(uint64_t *a1)
{
  HIDReport.subscript.setter(*a1, a1[1]);
  sub_1000050D4();
}

Swift::Int __swiftcall HIDReport.index(after:)(Swift::Int after)
{
  BOOL v1;
  Swift::Int result;

  v1 = __OFADD__(after, 1);
  result = after + 1;
  if (v1)
    __break(1u);
  return result;
}

uint64_t HIDReport.endIndex.getter(uint64_t a1, unint64_t a2)
{
  return ((uint64_t (*)(void))((char *)&loc_1001E9BD4 + *((int *)qword_1001E9C10 + (a2 >> 62))))();
}

uint64_t sub_1001E9BE4()
{
  uint64_t v0;
  char v1;

  sub_1000E7368();
  if (!v1)
  {
    __break(1u);
    JUMPOUT(0x1001E9C10);
  }
  return sub_1001EB918(v0);
}

uint64_t HIDReport.indices.getter(uint64_t a1, unint64_t a2)
{
  return ((uint64_t (*)(_QWORD))((char *)&loc_1001E9C34 + *((int *)qword_1001E9CB0 + (a2 >> 62))))(0);
}

void sub_1001E9C48()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  sub_1000E7368();
  if (!v2)
  {
    __break(1u);
LABEL_4:
    __break(1u);
    JUMPOUT(0x1001E9CACLL);
  }
  if (8 * v1 < v0)
    goto LABEL_4;
}

Swift::Void __swiftcall HIDReport.swapAt(_:_:)(Swift::Int a1, Swift::Int a2)
{
  Swift::Int v4;
  _BOOL8 v5;
  Swift::Int v6;
  _BOOL8 v7;

  v4 = sub_1001EB7EC(a1);
  v5 = (sub_1001EB7F8(v4) & (1 << (a1 & 7))) != 0;
  v6 = sub_1001EB7EC(a2);
  v7 = (sub_1001EB7F8(v6) & (1 << (a2 & 7))) != 0;
  HIDReport.subscript.setter(v7, a1);
  HIDReport.subscript.setter(v5, a2);
}

uint64_t sub_1001E9D44(uint64_t *a1, Swift::Int *a2)
{
  return HIDReport.subscript.setter(*a1, *a2);
}

void (*sub_1001E9D50(_QWORD *a1, uint64_t *a2))(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a2;
  a1[1] = v2;
  a1[2] = v4;
  *a1 = HIDReport.subscript.getter();
  return sub_1001E9D8C;
}

void sub_1001E9D8C(uint64_t *a1)
{
  HIDReport.subscript.setter(*a1, a1[2]);
  sub_1000050D4();
}

Swift::Int sub_1001E9DAC(uint64_t a1, Swift::Int *a2)
{
  return HIDReport.subscript.setter(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *a2, a2[1]);
}

void (*sub_1001E9DC0(_QWORD *a1, Swift::Int *a2))(uint64_t **a1, char a2)
{
  uint64_t *v2;
  _QWORD *v5;
  Swift::Int v6;
  Swift::Int v7;
  uint64_t v8;

  v5 = malloc(0x28uLL);
  *a1 = v5;
  v6 = *a2;
  v7 = a2[1];
  v5[2] = v2;
  v5[3] = v6;
  v5[4] = v7;
  *v5 = HIDReport.subscript.getter(v6, v7, *v2, v2[1]);
  v5[1] = v8;
  return sub_1001E9E1C;
}

void sub_1001E9E1C(uint64_t **a1, char a2)
{
  uint64_t *v2;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    sub_1001D2D70(**a1);
    sub_1001EB804();
    sub_100022AEC(*v2, v2[1]);
  }
  else
  {
    sub_1001EB804();
  }
  free(v2);
}

void sub_1001E9E78(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  sub_1001E9EA0();
  if (!v1)
    *a1 = v3;
}

void sub_1001E9EA0()
{
  sub_1001EA9C0();
}

void sub_1001E9EB4(Swift::Int *a1, Swift::Int *a2)
{
  HIDReport.swapAt(_:_:)(*a1, *a2);
}

uint64_t sub_1001E9EC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:)(a1, a2, a4, a3);
}

uint64_t sub_1001E9EE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:)(a1, a2, a4, a3);
}

uint64_t sub_1001E9F00(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  BOOL v4;
  uint64_t v5;

  v4 = __OFADD__(a1, a2);
  v5 = a1 + a2;
  if (v4)
  {
    __break(1u);
    JUMPOUT(0x1001E9F90);
  }
  return ((uint64_t (*)(uint64_t))((char *)&loc_1001E9F18 + dword_1001E9F9C[a4 >> 62]))(v5);
}

uint64_t sub_1001E9FB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v9;

  sub_1001EA034(a1, a3, a4, a5);
  if (a2 < 1)
  {
    if (v9 <= 0 && v9 > a2)
      return 0;
  }
  else if ((v9 & 0x8000000000000000) == 0 && v9 < (unint64_t)a2)
  {
    return 0;
  }
  return sub_1001E9F00(a1, a2, a4, a5);
}

void sub_1001EA034(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X9 }
}

void sub_1001EA080()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  v5 = HIDReport.endIndex.getter(v2, v1);
  if (v0 >= 8 * v4)
  {
    v7 = __OFSUB__(v5, v0);
    v6 = v5 - v0 < 0;
  }
  else
  {
    v7 = 0;
    v6 = 1;
  }
  if (v6 == v7)
    __asm { BR              X10 }
  __break(1u);
  JUMPOUT(0x1001EA13CLL);
}

uint64_t sub_1001EA164@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = HIDReport.startIndex.getter(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  *a1 = result;
  return result;
}

uint64_t sub_1001EA18C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = HIDReport.endIndex.getter(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  *a1 = result;
  return result;
}

double (*sub_1001EA1B4(_QWORD *a1, Swift::Int *a2))(_QWORD)
{
  uint64_t *v2;
  Swift::Int v4;
  uint64_t v5;
  uint64_t v6;
  Swift::Int v7;

  v4 = *a2;
  v6 = *v2;
  v5 = v2[1];
  v7 = HIDReport.offset(for:)(*a2);
  LOBYTE(v4) = HIDReport.mask(for:)(v4);
  *a1 = (Data.subscript.getter(v7, v6, v5) & v4) != 0;
  return CGSize.init(_:);
}

Swift::Int sub_1001EA234@<X0>(Swift::Int *a1@<X0>, Swift::Int *a2@<X8>)
{
  uint64_t *v2;
  Swift::Int result;
  Swift::Int v5;

  result = HIDReport.subscript.getter(*a1, a1[1], *v2, v2[1]);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_1001EA264@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  result = HIDReport.indices.getter(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1001EA28C()
{
  uint64_t v0;

  return sub_1001EA294(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
}

uint64_t sub_1001EA294(uint64_t a1, unint64_t a2)
{
  return ((uint64_t (*)(void))((char *)&loc_1001EA2A4 + *((int *)qword_1001EA318 + (a2 >> 62))))();
}

BOOL sub_1001EA2B8(uint64_t a1, uint64_t a2)
{
  if (((unint64_t)BYTE6(a2) - 0x1000000000000000) >> 61 != 7)
  {
    __break(1u);
    JUMPOUT(0x1001EA314);
  }
  return 8 * BYTE6(a2) == 0;
}

uint64_t sub_1001EA328()
{
  _QWORD *v0;

  return HIDReport.count.getter(*v0, v0[1]);
}

void sub_1001EA330(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t sub_1001EA340(uint64_t *a1, uint64_t *a2)
{
  return sub_1001EA354(*a1, *a2, a2[1]);
}

uint64_t sub_1001EA354(uint64_t result, uint64_t a2, uint64_t a3)
{
  BOOL v3;
  BOOL v4;

  if (result >= a2)
  {
    v4 = __OFSUB__(result, a3);
    v3 = result - a3 < 0;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  if (v3 == v4)
    __break(1u);
  return result;
}

uint64_t sub_1001EA368(uint64_t *a1, uint64_t *a2)
{
  return sub_1001EA37C(*a1, *a2, a2[1]);
}

uint64_t sub_1001EA37C(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result < a2 || a3 < result)
    __break(1u);
  return result;
}

uint64_t sub_1001EA390(uint64_t *a1, uint64_t *a2)
{
  return sub_1001EA3A8(*a1, a1[1], *a2, a2[1]);
}

uint64_t sub_1001EA3A8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result < a3 || a4 < a2)
    __break(1u);
  return result;
}

Swift::Int sub_1001EA3BC@<X0>(Swift::Int *a1@<X0>, Swift::Int *a2@<X8>)
{
  Swift::Int result;

  result = HIDReport.index(after:)(*a1);
  *a2 = result;
  return result;
}

_QWORD *sub_1001EA3E4(_QWORD *result)
{
  if (__OFADD__(*result, 1))
    __break(1u);
  else
    ++*result;
  return result;
}

uint64_t sub_1001EA3FC@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_1001EA428(*a1, *(_QWORD *)v2, *(_QWORD *)(v2 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_1001EA428(uint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t v4;

  v3 = __OFSUB__(a1, 1);
  v4 = a1 - 1;
  if (v3)
  {
    __break(1u);
    JUMPOUT(0x1001EA4B8);
  }
  return ((uint64_t (*)(uint64_t))((char *)&loc_1001EA440 + dword_1001EA4C4[a3 >> 62]))(v4);
}

uint64_t sub_1001EA4D4(_QWORD *a1)
{
  uint64_t v1;

  if (__OFSUB__(*a1, 1))
  {
    __break(1u);
    JUMPOUT(0x1001EA570);
  }
  return ((uint64_t (*)(void))((char *)&loc_1001EA4F4 + dword_1001EA57C[*(_QWORD *)(v1 + 8) >> 62]))();
}

uint64_t sub_1001EA58C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = sub_1001E9F00(*a1, a2, *(_QWORD *)v3, *(_QWORD *)(v3 + 8));
  *a3 = result;
  return result;
}

void sub_1001EA5B8(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  char v6;

  *(_QWORD *)a4 = sub_1001E9FB0(*a1, a2, *a3, *(_QWORD *)v4, *(_QWORD *)(v4 + 8));
  *(_BYTE *)(a4 + 8) = v6 & 1;
  sub_1000050D4();
}

void sub_1001EA5EC(uint64_t *a1, uint64_t *a2)
{
  uint64_t *v2;

  sub_1001EA034(*a1, *a2, *v2, v2[1]);
}

uint64_t sub_1001EA5FC()
{
  uint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_1001EA610 + dword_1001EA654[*(_QWORD *)(v0 + 8) >> 62]))();
}

void sub_1001EA620(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v1;
  a1[1] = v2;
  a1[2] = 8 * v3;
}

void sub_1001EA630(_QWORD *a1@<X8>)
{
  int v1;

  if ((unint64_t)(v1 - 0x1000000000000000) >> 61 != 7)
  {
    __break(1u);
    JUMPOUT(0x1001EA654);
  }
  sub_1001EA620(a1);
}

uint64_t sub_1001EA664()
{
  uint64_t v0;

  return _s9HIDReportAAV5countSivg_0(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
}

uint64_t _s9HIDReportAAV5countSivg_0(uint64_t a1, unint64_t a2)
{
  return ((uint64_t (*)(void))((char *)&loc_1001EA68C + dword_1001EA6E4[a2 >> 62]))();
}

uint64_t sub_1001EA69C()
{
  uint64_t v0;
  char v1;

  sub_1000E7368();
  if (!v1)
  {
    __break(1u);
    JUMPOUT(0x1001EA6DCLL);
  }
  return sub_1001EB918(v0);
}

uint64_t sub_1001EA6F4()
{
  uint64_t v0;

  return sub_1001EA6FC(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
}

uint64_t sub_1001EA6FC(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_1001EAF3C(a1, a2);
  v5 = v4;
  sub_100022AEC(a1, a2);
  return v5;
}

uint64_t sub_1001EA73C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  return sub_1001EA744(a1, a2, a3, *v3, v3[1]);
}

uint64_t sub_1001EA748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = __DataStorage._bytes.getter();
  v11 = result;
  if (result)
  {
    result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = __DataStorage._length.getter();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_1001E8678(v11, v17, a4, a5);
  sub_100022AEC(a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

uint64_t sub_1001EA810(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = __DataStorage._bytes.getter();
  v11 = result;
  if (result)
  {
    result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = __DataStorage._length.getter();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_1001E88CC(v11, a4, v17, a5, &v19);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

uint64_t sub_1001EA8C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  char v9;
  uint64_t v10;
  __int16 v11;
  char v12;
  char v13;
  char v14;
  char v15;

  v10 = a1;
  v11 = a2;
  v12 = BYTE2(a2);
  v13 = BYTE3(a2);
  v14 = BYTE4(a2);
  v15 = BYTE5(a2);
  sub_1001E8678((uint64_t)&v10, (uint64_t)&v10 + BYTE6(a2), a3, a4);
  v5 = sub_100026B88();
  sub_100022AEC(v5, v6);
  if (!v4)
    v7 = v9;
  return v7 & 1;
}

void sub_1001EA9C0()
{
  __asm { BR              X12 }
}

uint64_t sub_1001EAA20()
{
  uint64_t v0;

  if (((unint64_t)BYTE6(v0) - 0x1000000000000000) >> 61 != 7)
  {
    __break(1u);
    JUMPOUT(0x1001EAED8);
  }
  if (8 * BYTE6(v0) > 0)
    __asm { BR              X9 }
  return 0;
}

void sub_1001EAF3C(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

_QWORD *sub_1001EAF80()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9[11];

  if (((unint64_t)BYTE6(v0) - 0x1000000000000000) >> 61 != 7)
  {
    __break(1u);
    goto LABEL_10;
  }
  v2 = 8 * BYTE6(v0);
  if (!v2)
    return _swiftEmptyArrayStorage;
  if (v2 <= 0)
  {
    v4 = _swiftEmptyArrayStorage;
  }
  else
  {
    v3 = sub_1000055B0(&qword_1002B6268);
    v4 = (_QWORD *)swift_allocObject(v3, ((unint64_t)BYTE6(v0) << 6) | 0x20, 7);
    v5 = j__malloc_size(v4);
    v4[2] = v2;
    v4[3] = 2 * ((uint64_t)(v5 - 32) / 8);
  }
  sub_10002517C(v1, v0);
  sub_1001EB094((uint64_t)v9, (uint64_t)(v4 + 4), v2, v1, v0);
  v7 = v6;
  sub_100022AEC(v9[0], v9[1]);
  if (v7 != v2)
  {
LABEL_10:
    __break(1u);
    JUMPOUT(0x1001EB07CLL);
  }
  return v4;
}

void sub_1001EB094(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __asm { BR              X10 }
}

uint64_t sub_1001EB0F0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a2)
  {
    if (a3)
    {
      if ((a3 & 0x8000000000000000) == 0)
        __asm { BR              X11 }
      __break(1u);
      JUMPOUT(0x1001EB370);
    }
  }
  else
  {
    a3 = 0;
  }
  *a1 = v6;
  a1[1] = v5;
  a1[2] = v4;
  return a3;
}

unint64_t sub_1001EB410()
{
  unint64_t result;

  result = qword_1002B6210;
  if (!qword_1002B6210)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for UInt8, &type metadata for UInt8);
    atomic_store(result, (unint64_t *)&qword_1002B6210);
  }
  return result;
}

unint64_t sub_1001EB450()
{
  unint64_t result;

  result = qword_1002B6218;
  if (!qword_1002B6218)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDReport, &type metadata for HIDReport);
    atomic_store(result, (unint64_t *)&qword_1002B6218);
  }
  return result;
}

unint64_t sub_1001EB490()
{
  unint64_t result;

  result = qword_1002B6220;
  if (!qword_1002B6220)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDReport, &type metadata for HIDReport);
    atomic_store(result, (unint64_t *)&qword_1002B6220);
  }
  return result;
}

unint64_t sub_1001EB4D0()
{
  unint64_t result;

  result = qword_1002B6228;
  if (!qword_1002B6228)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDReport, &type metadata for HIDReport);
    atomic_store(result, (unint64_t *)&qword_1002B6228);
  }
  return result;
}

unint64_t sub_1001EB510()
{
  unint64_t result;

  result = qword_1002B6230;
  if (!qword_1002B6230)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDReport, &type metadata for HIDReport);
    atomic_store(result, (unint64_t *)&qword_1002B6230);
  }
  return result;
}

uint64_t sub_1001EB54C()
{
  return sub_1001EB644(&qword_1002B6238, (uint64_t)&protocol conformance descriptor for <> Range<A>);
}

unint64_t sub_1001EB574()
{
  unint64_t result;

  result = qword_1002B6240;
  if (!qword_1002B6240)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDReport, &type metadata for HIDReport);
    atomic_store(result, (unint64_t *)&qword_1002B6240);
  }
  return result;
}

unint64_t sub_1001EB5B4()
{
  unint64_t result;

  result = qword_1002B6248;
  if (!qword_1002B6248)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDReport, &type metadata for HIDReport);
    atomic_store(result, (unint64_t *)&qword_1002B6248);
  }
  return result;
}

void *sub_1001EB5F0()
{
  return &protocol witness table for Int;
}

uint64_t sub_1001EB5FC()
{
  return sub_1001EB644((unint64_t *)&qword_1002AFF90, (uint64_t)&protocol conformance descriptor for <> Range<A>);
}

uint64_t sub_1001EB620()
{
  return sub_1001EB644(&qword_1002B6250, (uint64_t)&protocol conformance descriptor for <> Range<A>);
}

uint64_t sub_1001EB644(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_10000DCA0(&qword_1002AFF88);
    sub_1000CDB74();
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1001EB6B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1002B6258;
  if (!qword_1002B6258)
  {
    v1 = sub_10000DCA0(&qword_1002B6260);
    result = swift_getWitnessTable(&protocol conformance descriptor for IndexingIterator<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1002B6258);
  }
  return result;
}

void sub_1001EB6FC(unsigned __int8 *a1)
{
  HIDReport.reportID.setter(*a1);
  sub_1000050D4();
}

ValueMetadata *type metadata accessor for HIDReport()
{
  return &type metadata for HIDReport;
}

void sub_1001EB774()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = v0;
}

uint64_t sub_1001EB7AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return a13;
}

uint64_t sub_1001EB7C4()
{
  uint64_t v0;

  return v0;
}

Swift::Int sub_1001EB7EC(Swift::Int a1)
{
  return HIDReport.offset(for:)(a1);
}

uint64_t sub_1001EB7F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return Data.subscript.getter(a1, v1, v2);
}

Swift::Int sub_1001EB804()
{
  uint64_t v0;
  unint64_t v1;
  Swift::Int v2;
  Swift::Int v3;

  return HIDReport.subscript.setter(v0, v1, v3, v2);
}

void sub_1001EB818(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 120) = a2 >> 32;
}

uint64_t sub_1001EB834()
{
  return __DataStorage._offset.getter();
}

uint64_t sub_1001EB840()
{
  return __DataStorage._bytes.getter();
}

uint64_t sub_1001EB848(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;

  return sub_1001EA748(a1, a2, a3, v4, v3);
}

void sub_1001EB858(uint64_t a1, uint64_t a2)
{
  sub_1000E6CB8(a1, a2);
}

uint64_t sub_1001EB868()
{
  return __DataStorage._bytes.getter();
}

void sub_1001EB870()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 128) = v0;
}

uint64_t sub_1001EB898()
{
  return __DataStorage._bytes.getter();
}

uint64_t sub_1001EB8A0()
{
  return __DataStorage._bytes.getter();
}

Swift::Int sub_1001EB8A8(Swift::Int a1)
{
  return HIDReport.offset(for:)(a1);
}

void sub_1001EB8B4()
{
  void *v0;
  uint64_t v1;
  Swift::String v2;

  v2._countAndFlagsBits = v1;
  v2._object = v0;
  String.append(_:)(v2);
}

void sub_1001EB8C0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 128) = v0;
}

Swift::Int sub_1001EB8D4(Swift::Int a1)
{
  return HIDReport.offset(for:)(a1);
}

void sub_1001EB8E0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 128) = v0;
}

uint64_t sub_1001EB8F4()
{
  uint64_t v0;
  unint64_t v1;

  return sub_100022AEC(v0, v1);
}

uint64_t sub_1001EB900()
{
  return __DataStorage._bytes.getter();
}

Swift::Int sub_1001EB90C(Swift::Int a1)
{
  return HIDReport.offset(for:)(a1);
}

uint64_t sub_1001EB918@<X0>(uint64_t a1@<X8>)
{
  return 8 * a1;
}

uint64_t sub_1001EB920()
{
  return 0;
}

uint64_t sub_1001EB92C(unint64_t a1, unint64_t a2, double a3)
{
  unint64_t v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t result;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;
  uint64_t v19;
  unint64_t v20;

  v3 = a2;
  v5 = (double)a1;
  v6 = (double)a2;
  v7 = (double)a2 - (double)a1;
  v8 = v7 * a3 + (double)a1;
  if (v8 > (double)a1)
    v9 = v7 * a3 + (double)a1;
  else
    v9 = (double)a1;
  if (v9 > v6)
    v9 = (double)a2;
  if (sub_1001ECFB4((uint64_t)&v19, v9) && (v20 & 1) == 0)
    return v19;
  v10 = 0.0 - v6;
  if (0.0 - v6 < INFINITY)
    *(_QWORD *)&v10 = ((COERCE__INT64(0.0 - v6) >> 63) | 1) + COERCE__INT64(0.0 - v6);
  v11 = -v10;
  if (v8 > v11)
    return v3;
  *(_QWORD *)&v12 = ((*(uint64_t *)&v5 >> 63) | 1) + *(_QWORD *)&v5;
  v13 = v12;
  v3 = a1;
  if (v8 < v12)
    return v3;
  if (v8 > v12)
    v13 = v8;
  if (v13 <= v11)
    v11 = v13;
  sub_1001ECFB4((uint64_t)&v19, v11);
  if ((v20 & 1) == 0)
    return v19;
  v19 = 0;
  v20 = 0xE000000000000000;
  _StringGuts.grow(_:)(80);
  v15._countAndFlagsBits = 0x656C62756F44;
  v15._object = (void *)0xE600000000000000;
  String.append(_:)(v15);
  v16._object = (void *)0x800000010025A780;
  v16._countAndFlagsBits = 0xD00000000000001ELL;
  String.append(_:)(v16);
  v17._countAndFlagsBits = 0x3436746E4955;
  v17._object = (void *)0xE600000000000000;
  String.append(_:)(v17);
  v18._countAndFlagsBits = 0xD00000000000002ELL;
  v18._object = (void *)0x800000010025A7A0;
  String.append(_:)(v18);
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v19, v20, "Swift/Integers.swift", 20, 2, 3071, 0);
  __break(1u);
  return result;
}

uint64_t sub_1001EBAE0(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t result;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;
  uint64_t v19;
  unint64_t v20;

  v3 = a2;
  v5 = (double)a1;
  v6 = (double)a2;
  v7 = (double)a2 - (double)a1;
  v8 = v7 * a3 + (double)a1;
  if (v8 > (double)a1)
    v9 = v7 * a3 + (double)a1;
  else
    v9 = (double)a1;
  if (v9 > v6)
    v9 = (double)a2;
  if (sub_1001ED0CC((uint64_t)&v19, v9) && (v19 & 0x100000000) == 0)
    return v19;
  v10 = 0.0 - v6;
  if (0.0 - v6 < INFINITY)
    *(_QWORD *)&v10 = ((COERCE__INT64(0.0 - v6) >> 63) | 1) + COERCE__INT64(0.0 - v6);
  v11 = -v10;
  if (v8 > v11)
    return v3;
  *(_QWORD *)&v12 = ((*(uint64_t *)&v5 >> 63) | 1) + *(_QWORD *)&v5;
  v13 = v12;
  v3 = a1;
  if (v8 < v12)
    return v3;
  if (v8 > v12)
    v13 = v8;
  if (v13 <= v11)
    v11 = v13;
  sub_1001ED0CC((uint64_t)&v19, v11);
  if ((v19 & 0x100000000) == 0)
    return v19;
  v19 = 0;
  v20 = 0xE000000000000000;
  _StringGuts.grow(_:)(80);
  v15._countAndFlagsBits = 0x656C62756F44;
  v15._object = (void *)0xE600000000000000;
  String.append(_:)(v15);
  v16._object = (void *)0x800000010025A780;
  v16._countAndFlagsBits = 0xD00000000000001ELL;
  String.append(_:)(v16);
  v17._countAndFlagsBits = 0x3233746E4955;
  v17._object = (void *)0xE600000000000000;
  String.append(_:)(v17);
  v18._countAndFlagsBits = 0xD00000000000002ELL;
  v18._object = (void *)0x800000010025A7A0;
  String.append(_:)(v18);
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v19, v20, "Swift/Integers.swift", 20, 2, 3071, 0);
  __break(1u);
  return result;
}

uint64_t sub_1001EBC94(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t result;
  Swift::String v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t v18;
  unint64_t v19;

  v3 = a2;
  v5 = (double)(unsigned __int16)a1;
  v6 = (double)(unsigned __int16)a2;
  v7 = (v6 - v5) * a3 + v5;
  if (v7 > v5)
    v8 = (v6 - v5) * a3 + v5;
  else
    v8 = (double)(unsigned __int16)a1;
  if (v8 > v6)
    v8 = (double)(unsigned __int16)a2;
  if (sub_1001ED224((uint64_t)&v18, v8) && (v18 & 0x10000) == 0)
    return (unsigned __int16)v18;
  v9 = 0.0 - v6;
  if (0.0 - v6 < INFINITY)
    *(_QWORD *)&v9 = ((COERCE__INT64(0.0 - v6) >> 63) | 1) + COERCE__INT64(0.0 - v6);
  v10 = -v9;
  if (v7 > v10)
    return v3;
  *(_QWORD *)&v11 = ((*(uint64_t *)&v5 >> 63) | 1) + *(_QWORD *)&v5;
  v12 = v11;
  v3 = a1;
  if (v7 < v11)
    return v3;
  if (v7 > v11)
    v12 = v7;
  if (v12 <= v10)
    v10 = v12;
  sub_1001ED224((uint64_t)&v18, v10);
  if ((v18 & 0x10000) == 0)
    return (unsigned __int16)v18;
  v18 = 0;
  v19 = 0xE000000000000000;
  _StringGuts.grow(_:)(80);
  v14._countAndFlagsBits = 0x656C62756F44;
  v14._object = (void *)0xE600000000000000;
  String.append(_:)(v14);
  v15._object = (void *)0x800000010025A780;
  v15._countAndFlagsBits = 0xD00000000000001ELL;
  String.append(_:)(v15);
  v16._countAndFlagsBits = 0x3631746E4955;
  v16._object = (void *)0xE600000000000000;
  String.append(_:)(v16);
  v17._countAndFlagsBits = 0xD00000000000002ELL;
  v17._object = (void *)0x800000010025A7A0;
  String.append(_:)(v17);
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v18, v19, "Swift/Integers.swift", 20, 2, 3071, 0);
  __break(1u);
  return result;
}

uint64_t sub_1001EBE50(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t result;
  Swift::String v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t v18;
  unint64_t v19;

  v3 = a2;
  v5 = (double)a1;
  v6 = (double)a2;
  v7 = (v6 - v5) * a3 + v5;
  if (v7 > v5)
    v8 = (v6 - v5) * a3 + v5;
  else
    v8 = (double)a1;
  if (v8 > v6)
    v8 = (double)a2;
  if (sub_1001ED380(&v18, v8) && (v18 & 0x100) == 0)
    return v18;
  v9 = 0.0 - v6;
  if (0.0 - v6 < INFINITY)
    *(_QWORD *)&v9 = ((COERCE__INT64(0.0 - v6) >> 63) | 1) + COERCE__INT64(0.0 - v6);
  v10 = -v9;
  if (v7 > v10)
    return v3;
  *(_QWORD *)&v11 = ((*(uint64_t *)&v5 >> 63) | 1) + *(_QWORD *)&v5;
  v12 = v11;
  v3 = a1;
  if (v7 < v11)
    return v3;
  if (v7 > v11)
    v12 = v7;
  if (v12 <= v10)
    v10 = v12;
  sub_1001ED380(&v18, v10);
  if ((v18 & 0x100) == 0)
    return v18;
  v18 = 0;
  v19 = 0xE000000000000000;
  _StringGuts.grow(_:)(80);
  v14._countAndFlagsBits = 0x656C62756F44;
  v14._object = (void *)0xE600000000000000;
  String.append(_:)(v14);
  v15._object = (void *)0x800000010025A780;
  v15._countAndFlagsBits = 0xD00000000000001ELL;
  String.append(_:)(v15);
  v16._countAndFlagsBits = 0x38746E4955;
  v16._object = (void *)0xE500000000000000;
  String.append(_:)(v16);
  v17._countAndFlagsBits = 0xD00000000000002ELL;
  v17._object = (void *)0x800000010025A7A0;
  String.append(_:)(v17);
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v18, v19, "Swift/Integers.swift", 20, 2, 3071, 0);
  __break(1u);
  return result;
}

void sub_1001EC00C(uint64_t a1)
{
  double v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  double v12;
  double v13;
  char v14;
  char v15;
  char v16;
  char v17;
  double v18;
  double v19;
  Swift::String v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  char v31;
  char v32;

  sub_1001EDC14();
  v11 = sub_1001EDCD0(v3, v4, v5, v6, v7, v8, v9, v10, v27, v29, v31);
  if (sub_1001ED4DC(v11, v12) && (v32 & 1) == 0)
    goto LABEL_15;
  v13 = sub_1001EDC44();
  if (v14)
    v13 = sub_1001EDC2C(v13);
  sub_1001EDD54(v13);
  if (!(v14 ^ v15 | v17))
    goto LABEL_15;
  sub_1001EDBC4();
  if (v14)
    goto LABEL_15;
  if (!v17 & v16)
    v19 = v1;
  if (v19 <= v18)
    v18 = v19;
  sub_1001ED4DC(&v31, v18);
  if ((v32 & 1) != 0)
  {
    sub_1001EDBEC();
    sub_1001EDB74();
    sub_1001EDB54((uint64_t)" value cannot be converted to ");
    v20._countAndFlagsBits = 947154505;
    v20._object = (void *)0xE400000000000000;
    String.append(_:)(v20);
    sub_1001EDC5C(a1 + 16, (uint64_t)" because it is outside the representable range");
    sub_1001EDC94();
    sub_1001EDC00((uint64_t)"Fatal error", v21, v22, v23, v24, (uint64_t)"Swift/Integers.swift", v25, v26, v28, v30);
    __break(1u);
  }
  else
  {
LABEL_15:
    sub_1001EDC80();
  }
}

void sub_1001EC0FC(uint64_t a1)
{
  double v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  double v12;
  double v13;
  char v14;
  char v15;
  char v16;
  char v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  __int16 v30;
  char v31;

  sub_1001EDC14();
  v11 = sub_1001EDCD0(v3, v4, v5, v6, v7, v8, v9, v10, v26, v28, v30);
  if (sub_1001ED690((uint64_t)v11, v12) && (v31 & 1) == 0)
    goto LABEL_15;
  v13 = sub_1001EDC44();
  if (v14)
    v13 = sub_1001EDC2C(v13);
  sub_1001EDD54(v13);
  if (!(v14 ^ v15 | v17))
    goto LABEL_15;
  sub_1001EDBC4();
  if (v14)
    goto LABEL_15;
  if (!v17 & v16)
    v19 = v1;
  if (v19 <= v18)
    v18 = v19;
  sub_1001ED690((uint64_t)&v30, v18);
  if ((v31 & 1) != 0)
  {
    sub_1001EDBEC();
    sub_1001EDB74();
    sub_1001EDB54((uint64_t)" value cannot be converted to ");
    sub_1001EDD60(0x3631746E49);
    sub_1001EDC5C(a1 + 16, (uint64_t)" because it is outside the representable range");
    sub_1001EDC94();
    sub_1001EDC00((uint64_t)"Fatal error", v20, v21, v22, v23, (uint64_t)"Swift/Integers.swift", v24, v25, v27, v29);
    __break(1u);
  }
  else
  {
LABEL_15:
    sub_1001EDC80();
  }
}

void sub_1001EC1EC(uint64_t a1)
{
  double v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  double v12;
  double v13;
  char v14;
  char v15;
  char v16;
  char v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  char v31;

  sub_1001EDC14();
  v11 = sub_1001EDCD0(v3, v4, v5, v6, v7, v8, v9, v10, v26, v28, v30);
  if (sub_1001ED844((uint64_t)v11, v12) && (v31 & 1) == 0)
    goto LABEL_15;
  v13 = sub_1001EDC44();
  if (v14)
    v13 = sub_1001EDC2C(v13);
  sub_1001EDD54(v13);
  if (!(v14 ^ v15 | v17))
    goto LABEL_15;
  sub_1001EDBC4();
  if (v14)
    goto LABEL_15;
  if (!v17 & v16)
    v19 = v1;
  if (v19 <= v18)
    v18 = v19;
  sub_1001ED844((uint64_t)&v30, v18);
  if ((v31 & 1) != 0)
  {
    sub_1001EDBEC();
    sub_1001EDB74();
    sub_1001EDB54((uint64_t)" value cannot be converted to ");
    sub_1001EDD60(0x3233746E49);
    sub_1001EDC5C(a1 + 16, (uint64_t)" because it is outside the representable range");
    sub_1001EDC94();
    sub_1001EDC00((uint64_t)"Fatal error", v20, v21, v22, v23, (uint64_t)"Swift/Integers.swift", v24, v25, v27, v29);
    __break(1u);
  }
  else
  {
LABEL_15:
    sub_1001EDC80();
  }
}

uint64_t sub_1001EC2D4(uint64_t a1, uint64_t a2)
{
  double v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  double v14;
  double v15;
  char v16;
  char v17;
  char v18;
  char v19;
  double v20;
  double v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  char v34;

  sub_1001EDC14();
  v13 = sub_1001EDCD0(v5, v6, v7, v8, v9, v10, v11, v12, v29, v31, v33);
  if (sub_1001ED9EC((uint64_t)v13, v14) && (v34 & 1) == 0)
    return v33;
  v15 = sub_1001EDC44();
  if (v16)
    v15 = sub_1001EDC2C(v15);
  sub_1001EDD54(v15);
  if (!(v16 ^ v17 | v19))
    return a2;
  sub_1001EDBC4();
  a2 = a1;
  if (v16)
    return a2;
  if (!v19 & v18)
    v21 = v2;
  if (v21 <= v20)
    v20 = v21;
  sub_1001ED9EC((uint64_t)&v33, v20);
  if ((v34 & 1) == 0)
    return v33;
  sub_1001EDBEC();
  sub_1001EDB74();
  sub_1001EDB54((uint64_t)" value cannot be converted to ");
  sub_1001EDD60(0x3436746E49);
  sub_1001EDC5C(a1 + 16, (uint64_t)" because it is outside the representable range");
  sub_1001EDC94();
  result = sub_1001EDC00((uint64_t)"Fatal error", v23, v24, v25, v26, (uint64_t)"Swift/Integers.swift", v27, v28, v30, v32);
  __break(1u);
  return result;
}

void sub_1001EC3CC(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void sub_1001EC3D4(_BYTE *a1@<X8>)
{
  *a1 = -1;
}

uint64_t static UInt16.logicalMaximum.getter()
{
  return 0xFFFFLL;
}

void sub_1001EC3E8(_WORD *a1@<X8>)
{
  *a1 = 0;
}

void sub_1001EC3F0(_WORD *a1@<X8>)
{
  *a1 = -1;
}

void sub_1001EC3FC(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

void sub_1001EC404(_DWORD *a1@<X8>)
{
  *a1 = -1;
}

void sub_1001EC410(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void sub_1001EC418(_QWORD *a1@<X8>)
{
  *a1 = -1;
}

double HIDReport.scaledValue<A>(as:atIndex:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t AssociatedTypeWitness;
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
  char *v21;
  uint64_t v22;
  double v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  char v33;
  uint64_t v34;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  double v41;

  v37 = a4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, a6);
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(AssociatedTypeWitness);
  v39 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v15 = (char *)&v36 - v14;
  __chkstk_darwin(v16);
  v18 = (char *)&v36 - v17;
  __chkstk_darwin(v19);
  v21 = (char *)&v36 - v20;
  swift_getAssociatedConformanceWitness(a6, a5, AssociatedTypeWitness);
  v40 = v21;
  HIDReport.subscript.getter(a2, a3, v37, AssociatedTypeWitness, (uint64_t)v21);
  sub_1001EDD08();
  v22 = sub_1001EDCEC();
  v38 = v11;
  if (v22 < 65)
  {
    v24 = sub_1001EDCB8();
    v25 = sub_1001EDCE0();
    sub_1001EDCC8((uint64_t)v18);
    if ((v24 & 1) != 0)
      v23 = (double)v25;
    else
      v23 = (double)(unint64_t)v25;
  }
  else
  {
    sub_1001E807C();
    sub_1001EDD40();
    sub_1001EDC6C((uint64_t)&v41, (uint64_t)v18, (uint64_t)&type metadata for Double);
    sub_1001EDCC8((uint64_t)v18);
    v23 = v41;
  }
  sub_1001EDD08();
  v26 = sub_1001EDCEC();
  v27 = (uint64_t)v39;
  if (v26 <= 64)
  {
    v29 = sub_1001EDCB8();
    v30 = sub_1001EDCE0();
    sub_1001EDCC8((uint64_t)v15);
    if ((v29 & 1) != 0)
      v28 = (double)v30;
    else
      v28 = (double)(unint64_t)v30;
  }
  else
  {
    sub_1001E807C();
    sub_1001EDD40();
    sub_1001EDC6C((uint64_t)&v41, (uint64_t)v15, (uint64_t)&type metadata for Double);
    sub_1001EDCC8((uint64_t)v15);
    v28 = v41;
  }
  v31 = (uint64_t)v40;
  (*(void (**)(uint64_t, char *, uint64_t))(v38 + 16))(v27, v40, AssociatedTypeWitness);
  if (sub_1001EDCEC() <= 64)
  {
    v33 = sub_1001EDCB8();
    v34 = sub_1001EDCE0();
    sub_1001EDCC8(v27);
    if ((v33 & 1) != 0)
      v32 = (double)v34;
    else
      v32 = (double)(unint64_t)v34;
  }
  else
  {
    sub_1001E807C();
    sub_1001EDD40();
    sub_1001EDC6C((uint64_t)&v41, v27, (uint64_t)&type metadata for Double);
    sub_1001EDCC8(v27);
    v32 = v41;
  }
  sub_1001EDCC8(v31);
  return (v32 - v23) / (v28 - v23);
}

void HIDReport.setScaledValue<A>(_:as:atIndex:)(double a1, uint64_t a2, char a3, void *a4, uint64_t a5)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t AssociatedConformanceWitness;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v26;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, a5);
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(AssociatedTypeWitness);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v15 = (char *)&v26 - v14;
  __chkstk_darwin(v16);
  v18 = (char *)&v26 - v17;
  if (a4 == &type metadata for UInt8)
  {
    v20 = sub_1001EBE50(0, 255, a1);
    sub_1001EC968(v20, a3);
    goto LABEL_8;
  }
  if (a4 == &type metadata for UInt16)
  {
    v21 = sub_1001EBC94(0, 0xFFFFLL, a1);
    sub_1001ECAFC(v21, a3);
    goto LABEL_8;
  }
  if (a4 == &type metadata for UInt32)
  {
    sub_1001EBAE0(0, 0xFFFFFFFFLL, a1);
    sub_10009543C();
    sub_1001B5188(v22, v23);
  }
  else
  {
    if (a4 != &type metadata for UInt64)
    {
      sub_1001EDD68();
      sub_1001EDD68();
      AssociatedConformanceWitness = swift_getAssociatedConformanceWitness(a5, a4, AssociatedTypeWitness);
      FixedWidthInteger.init(scaledValue:logicalMinimum:logicalMaximum:)((uint64_t)v15, (uint64_t)v12, AssociatedTypeWitness, AssociatedConformanceWitness, (uint64_t)v18, a1);
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v15, v18, AssociatedTypeWitness);
      HIDReport.subscript.setter((uint64_t)v15, a3);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v18, AssociatedTypeWitness);
LABEL_8:
      sub_10009543C();
      return;
    }
    sub_1001EB92C(0, 0xFFFFFFFFFFFFFFFFLL, a1);
    sub_10009543C();
    sub_1001AE9C4(v24, v25);
  }
}

void sub_1001EC968(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 8) >> 62;
  if ((a2 & 7) != 0)
    __asm { BR              X11 }
  __asm { BR              X11 }
}

void sub_1001ECA64()
{
  char v0;

  sub_1000E7368();
  if (!v0)
    __break(1u);
  JUMPOUT(0x1001EC9B4);
}

void sub_1001ECA7C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  sub_1000E7368();
  if (v2)
    v1 *= 8;
  else
    __break(1u);
  if (!__OFADD__(v1, v0))
    JUMPOUT(0x1001ECA5CLL);
  __break(1u);
  JUMPOUT(0x1001ECAB4);
}

void sub_1001ECA94()
{
  char v0;

  sub_1000E7368();
  if (!v0)
  {
    __break(1u);
    JUMPOUT(0x1001ECAACLL);
  }
  JUMPOUT(0x1001EC9F0);
}

void sub_1001ECAFC(uint64_t a1, char a2)
{
  if ((a2 & 7) != 0)
  {
    sub_1001AEFF0();
    __asm { BR              X11 }
  }
  sub_1001AF00C();
  __asm { BR              X12 }
}

void sub_1001ECD24(uint64_t a1, char a2)
{
  if ((a2 & 7) != 0)
  {
    sub_1001AEFF0();
    __asm { BR              X11 }
  }
  sub_1001EDCF8();
  __asm { BR              X11 }
}

void sub_1001ECEE0()
{
  char v0;

  sub_1000E7368();
  if (!v0)
  {
    __break(1u);
    JUMPOUT(0x1001ECEF8);
  }
  JUMPOUT(0x1001ECDA0);
}

unint64_t sub_1001ECF6C()
{
  unint64_t result;

  result = qword_1002B6270;
  if (!qword_1002B6270)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for UInt8, &type metadata for UInt8);
    atomic_store(result, (unint64_t *)&qword_1002B6270);
  }
  return result;
}

BOOL sub_1001ECFB4(uint64_t a1, double a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;
  _BOOL8 result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v4 = (*(_QWORD *)&a2 >> 52) & 0x7FFLL;
  v5 = *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  v6 = v4 | *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (v6)
  {
    if (v4 != 2047 && a2 > -1.0)
    {
      v10 = Double.exponent.getter(a2);
      if (v10 <= 63)
      {
        v11 = v10;
        v12 = Double.significandWidth.getter(a2);
        v13 = v12 + __clz(__rbit64(v5));
        v14 = v11 - v13;
        if (__OFSUB__(v11, v13))
        {
          __break(1u);
        }
        else
        {
          if (v14 < -64 || v14 > 64)
          {
LABEL_12:
            v15 = 0;
            v16 = 0;
            if ((v11 & 0x8000000000000000) == 0)
              goto LABEL_22;
LABEL_23:
            LOBYTE(v6) = 0;
            v8 = v15 | v16;
            result = v11 >= v12;
            goto LABEL_24;
          }
          if ((v14 & 0x8000000000000000) == 0)
          {
            if ((unint64_t)v14 >= 0x40)
              goto LABEL_12;
            v15 = v5 << v14;
            if (v11 < 0)
              goto LABEL_17;
            goto LABEL_22;
          }
        }
        if ((unint64_t)v14 <= 0xFFFFFFFFFFFFFFC0)
          goto LABEL_12;
        v15 = v5 >> (v13 - v11);
        if (v11 < 0)
        {
LABEL_17:
          v16 = 0;
          goto LABEL_23;
        }
LABEL_22:
        v16 = 1 << v11;
        goto LABEL_23;
      }
    }
    v8 = 0;
    result = 0;
    LOBYTE(v6) = 1;
  }
  else
  {
    v8 = 0;
    result = 1;
  }
LABEL_24:
  *(_QWORD *)a1 = v8;
  *(_BYTE *)(a1 + 8) = v6;
  return result;
}

BOOL sub_1001ED0CC(uint64_t a1, double a2)
{
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  int v9;
  _BOOL8 result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;

  v4 = LODWORD(a2);
  v5 = (*(_QWORD *)&a2 >> 52) & 0x7FFLL;
  v6 = *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  v7 = v5 | *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (!v7)
  {
    v9 = 0;
    result = 1;
    goto LABEL_28;
  }
  if (v5 != 2047 && a2 > -1.0)
  {
    v11 = Double.exponent.getter(a2);
    if (v11 <= 31)
    {
      v12 = v11;
      v13 = Double.significandWidth.getter(a2);
      v14 = v13 + __clz(__rbit64(v6));
      v15 = v12 - v14;
      if (__OFSUB__(v12, v14))
      {
        __break(1u);
      }
      else
      {
        if (v14 <= 31)
        {
          if (v15 < -32 || v15 > 32)
          {
LABEL_13:
            LODWORD(v15) = 0;
            v16 = 0;
            if ((v12 & 0x8000000000000000) == 0)
              goto LABEL_26;
            goto LABEL_27;
          }
          if (v15 < 0)
          {
            if ((unint64_t)v15 <= 0xFFFFFFFFFFFFFFE0)
              goto LABEL_13;
            LODWORD(v15) = v4 >> (v14 - v12);
          }
          else
          {
            if ((unint64_t)v15 >= 0x20)
              goto LABEL_13;
            LODWORD(v15) = v4 << v15;
          }
LABEL_24:
          if ((v12 & 0x8000000000000000) == 0)
          {
LABEL_26:
            v16 = 1 << v12;
            goto LABEL_27;
          }
          v16 = 0;
LABEL_27:
          LOBYTE(v7) = 0;
          v9 = v15 | v16;
          result = v12 >= v13;
          goto LABEL_28;
        }
        if ((unint64_t)(v15 - 65) <= 0xFFFFFFFFFFFFFF7ELL)
        {
          LODWORD(v15) = 0;
          goto LABEL_24;
        }
        if ((v15 & 0x8000000000000000) == 0)
        {
          if ((unint64_t)v15 >= 0x40)
            LODWORD(v15) = 0;
          else
            v15 = v6 << v15;
          goto LABEL_24;
        }
      }
      if ((unint64_t)v15 <= 0xFFFFFFFFFFFFFFC0)
        LODWORD(v15) = 0;
      else
        v15 = v6 >> (v14 - v12);
      goto LABEL_24;
    }
  }
  v9 = 0;
  result = 0;
  LOBYTE(v7) = 1;
LABEL_28:
  *(_DWORD *)a1 = v9;
  *(_BYTE *)(a1 + 4) = v7;
  return result;
}

BOOL sub_1001ED224(uint64_t a1, double a2)
{
  int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  __int16 v9;
  _BOOL8 result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;

  v4 = LODWORD(a2);
  v5 = (*(_QWORD *)&a2 >> 52) & 0x7FFLL;
  v6 = *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  v7 = v5 | *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (!v7)
  {
    v9 = 0;
    result = 1;
    goto LABEL_28;
  }
  if (v5 != 2047 && a2 > -1.0)
  {
    v11 = Double.exponent.getter(a2);
    if (v11 <= 15)
    {
      v12 = v11;
      v13 = Double.significandWidth.getter(a2);
      v14 = v13 + __clz(__rbit64(v6));
      v15 = v12 - v14;
      if (__OFSUB__(v12, v14))
      {
        __break(1u);
      }
      else
      {
        if (v14 <= 15)
        {
          if (v15 < -16 || v15 > 16)
          {
LABEL_13:
            LOWORD(v15) = 0;
            LOWORD(v16) = 0;
            if ((v12 & 0x8000000000000000) == 0)
              goto LABEL_26;
            goto LABEL_27;
          }
          if (v15 < 0)
          {
            if ((unint64_t)v15 <= 0xFFFFFFFFFFFFFFF0)
              goto LABEL_13;
            LODWORD(v15) = (unsigned __int16)v4 >> (v14 - v12);
          }
          else
          {
            if ((unint64_t)v15 >= 0x10)
              goto LABEL_13;
            LODWORD(v15) = v4 << v15;
          }
LABEL_24:
          if ((v12 & 0x8000000000000000) == 0)
          {
LABEL_26:
            v16 = 1 << v12;
            goto LABEL_27;
          }
          LOWORD(v16) = 0;
LABEL_27:
          LOBYTE(v7) = 0;
          v9 = v15 | v16;
          result = v12 >= v13;
          goto LABEL_28;
        }
        if ((unint64_t)(v15 - 65) <= 0xFFFFFFFFFFFFFF7ELL)
        {
          LOWORD(v15) = 0;
          goto LABEL_24;
        }
        if ((v15 & 0x8000000000000000) == 0)
        {
          if ((unint64_t)v15 >= 0x40)
            LOWORD(v15) = 0;
          else
            v15 = v6 << v15;
          goto LABEL_24;
        }
      }
      if ((unint64_t)v15 <= 0xFFFFFFFFFFFFFFC0)
        LOWORD(v15) = 0;
      else
        v15 = v6 >> (v14 - v12);
      goto LABEL_24;
    }
  }
  v9 = 0;
  result = 0;
  LOBYTE(v7) = 1;
LABEL_28:
  *(_WORD *)a1 = v9;
  *(_BYTE *)(a1 + 2) = v7;
  return result;
}

BOOL sub_1001ED380(_BYTE *a1, double a2)
{
  int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char v9;
  _BOOL8 result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;

  v4 = LODWORD(a2);
  v5 = (*(_QWORD *)&a2 >> 52) & 0x7FFLL;
  v6 = *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  v7 = v5 | *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (!v7)
  {
    v9 = 0;
    result = 1;
    goto LABEL_28;
  }
  if (v5 != 2047 && a2 > -1.0)
  {
    v11 = Double.exponent.getter(a2);
    if (v11 <= 7)
    {
      v12 = v11;
      v13 = Double.significandWidth.getter(a2);
      v14 = v13 + __clz(__rbit64(v6));
      v15 = v12 - v14;
      if (__OFSUB__(v12, v14))
      {
        __break(1u);
      }
      else
      {
        if (v14 <= 7)
        {
          if (v15 < -8 || v15 > 8)
          {
LABEL_13:
            LOBYTE(v15) = 0;
            LOBYTE(v16) = 0;
            if ((v12 & 0x8000000000000000) == 0)
              goto LABEL_26;
            goto LABEL_27;
          }
          if (v15 < 0)
          {
            if ((unint64_t)v15 <= 0xFFFFFFFFFFFFFFF8)
              goto LABEL_13;
            LODWORD(v15) = v4 >> (v14 - v12);
          }
          else
          {
            if ((unint64_t)v15 >= 8)
              goto LABEL_13;
            LODWORD(v15) = v4 << v15;
          }
LABEL_24:
          if ((v12 & 0x8000000000000000) == 0)
          {
LABEL_26:
            v16 = 1 << v12;
            goto LABEL_27;
          }
          LOBYTE(v16) = 0;
LABEL_27:
          LOBYTE(v7) = 0;
          v9 = v15 | v16;
          result = v12 >= v13;
          goto LABEL_28;
        }
        if ((unint64_t)(v15 - 65) <= 0xFFFFFFFFFFFFFF7ELL)
        {
          LOBYTE(v15) = 0;
          goto LABEL_24;
        }
        if ((v15 & 0x8000000000000000) == 0)
        {
          if ((unint64_t)v15 >= 0x40)
            LOBYTE(v15) = 0;
          else
            v15 = v6 << v15;
          goto LABEL_24;
        }
      }
      if ((unint64_t)v15 <= 0xFFFFFFFFFFFFFFC0)
        LOBYTE(v15) = 0;
      else
        v15 = v6 >> (v14 - v12);
      goto LABEL_24;
    }
  }
  v9 = 0;
  result = 0;
  LOBYTE(v7) = 1;
LABEL_28:
  *a1 = v9;
  a1[1] = v7;
  return result;
}

BOOL sub_1001ED4DC(_BYTE *a1, double a2)
{
  int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;

  v4 = LODWORD(a2);
  v5 = (*(_QWORD *)&a2 >> 52) & 0x7FFLL;
  v6 = *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  v7 = v5 | *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (!v7)
  {
    LOBYTE(v15) = 0;
    result = 1;
    goto LABEL_29;
  }
  if (v5 == 2047 || (v8 = Double.exponent.getter(a2), v8 > 7))
  {
LABEL_38:
    LOBYTE(v15) = 0;
    result = 0;
    LOBYTE(v7) = 1;
    goto LABEL_29;
  }
  v9 = v8;
  v10 = Double.significandWidth.getter(a2);
  result = v9 >= v10;
  v12 = v10 + __clz(__rbit64(v6));
  v13 = v9 - v12;
  if (__OFSUB__(v9, v12))
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v12 > 7)
  {
    if ((unint64_t)(v13 - 65) > 0xFFFFFFFFFFFFFF7ELL)
    {
      if (v13 < 0)
      {
        if ((unint64_t)v13 <= 0xFFFFFFFFFFFFFFC0)
          LOBYTE(v13) = 0;
        else
          v13 = v6 >> (v12 - v9);
      }
      else if ((unint64_t)v13 >= 0x40)
      {
        LOBYTE(v13) = 0;
      }
      else
      {
        v13 = v6 << v13;
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
LABEL_20:
    if (v9 != 7)
    {
      if (v9 < 0)
      {
        LOBYTE(v14) = 0;
        goto LABEL_24;
      }
      goto LABEL_23;
    }
LABEL_31:
    if (a2 >= 0.0 || (_BYTE)v13)
      goto LABEL_38;
    goto LABEL_33;
  }
  if (v13 >= -8 && v13 <= 8)
  {
    if (v13 < 0)
    {
      if ((unint64_t)v13 <= 0xFFFFFFFFFFFFFFF8)
        goto LABEL_8;
      LODWORD(v13) = v4 >> (v12 - v9);
    }
    else
    {
      if ((unint64_t)v13 >= 8)
        goto LABEL_8;
      LODWORD(v13) = v4 << v13;
    }
    goto LABEL_20;
  }
LABEL_8:
  if (v9 == 7)
    goto LABEL_37;
  LOBYTE(v14) = 0;
  LOBYTE(v13) = 0;
  if ((v9 & 0x8000000000000000) == 0)
LABEL_23:
    v14 = 1 << v9;
LABEL_24:
  v15 = (char)(v13 | v14);
  if (a2 >= 0.0)
  {
    if ((v15 & 0x80000000) == 0)
    {
      LOBYTE(v7) = 0;
      goto LABEL_29;
    }
    goto LABEL_36;
  }
  if (v15 < 0)
  {
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    if (a2 >= 0.0)
      goto LABEL_38;
LABEL_33:
    LOBYTE(v7) = 0;
    LOBYTE(v15) = 0x80;
    goto LABEL_29;
  }
  LOBYTE(v7) = 0;
  v15 = -v15;
LABEL_29:
  *a1 = v15;
  a1[1] = v7;
  return result;
}

BOOL sub_1001ED690(uint64_t a1, double a2)
{
  int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;

  v4 = LODWORD(a2);
  v5 = (*(_QWORD *)&a2 >> 52) & 0x7FFLL;
  v6 = *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  v7 = v5 | *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (!v7)
  {
    LOWORD(v15) = 0;
    result = 1;
    goto LABEL_29;
  }
  if (v5 == 2047 || (v8 = Double.exponent.getter(a2), v8 > 15))
  {
LABEL_38:
    LOWORD(v15) = 0;
    result = 0;
    LOBYTE(v7) = 1;
    goto LABEL_29;
  }
  v9 = v8;
  v10 = Double.significandWidth.getter(a2);
  result = v9 >= v10;
  v12 = v10 + __clz(__rbit64(v6));
  v13 = v9 - v12;
  if (__OFSUB__(v9, v12))
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v12 > 15)
  {
    if ((unint64_t)(v13 - 65) > 0xFFFFFFFFFFFFFF7ELL)
    {
      if (v13 < 0)
      {
        if ((unint64_t)v13 <= 0xFFFFFFFFFFFFFFC0)
          LOWORD(v13) = 0;
        else
          v13 = v6 >> (v12 - v9);
      }
      else if ((unint64_t)v13 >= 0x40)
      {
        LOWORD(v13) = 0;
      }
      else
      {
        v13 = v6 << v13;
      }
    }
    else
    {
      LOWORD(v13) = 0;
    }
LABEL_20:
    if (v9 != 15)
    {
      if (v9 < 0)
      {
        LOWORD(v14) = 0;
        goto LABEL_24;
      }
      goto LABEL_23;
    }
LABEL_31:
    if (a2 >= 0.0 || (_WORD)v13)
      goto LABEL_38;
    goto LABEL_33;
  }
  if (v13 >= -16 && v13 <= 16)
  {
    if (v13 < 0)
    {
      if ((unint64_t)v13 <= 0xFFFFFFFFFFFFFFF0)
        goto LABEL_8;
      LODWORD(v13) = (unsigned __int16)v4 >> (v12 - v9);
    }
    else
    {
      if ((unint64_t)v13 >= 0x10)
        goto LABEL_8;
      LODWORD(v13) = v4 << v13;
    }
    goto LABEL_20;
  }
LABEL_8:
  if (v9 == 15)
    goto LABEL_37;
  LOWORD(v14) = 0;
  LOWORD(v13) = 0;
  if ((v9 & 0x8000000000000000) == 0)
LABEL_23:
    v14 = 1 << v9;
LABEL_24:
  v15 = (__int16)(v13 | v14);
  if (a2 >= 0.0)
  {
    if ((v15 & 0x80000000) == 0)
    {
      LOBYTE(v7) = 0;
      goto LABEL_29;
    }
    goto LABEL_36;
  }
  if (v15 < 0)
  {
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    if (a2 >= 0.0)
      goto LABEL_38;
LABEL_33:
    LOBYTE(v7) = 0;
    LOWORD(v15) = 0x8000;
    goto LABEL_29;
  }
  LOBYTE(v7) = 0;
  v15 = -v15;
LABEL_29:
  *(_WORD *)a1 = v15;
  *(_BYTE *)(a1 + 2) = v7;
  return result;
}

BOOL sub_1001ED844(uint64_t a1, double a2)
{
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;

  v4 = LODWORD(a2);
  v5 = (*(_QWORD *)&a2 >> 52) & 0x7FFLL;
  v6 = *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  v7 = v5 | *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (!v7)
  {
    v15 = 0;
    result = 1;
    goto LABEL_29;
  }
  if (v5 == 2047 || (v8 = Double.exponent.getter(a2), v8 > 31))
  {
LABEL_38:
    v15 = 0;
    result = 0;
    LOBYTE(v7) = 1;
    goto LABEL_29;
  }
  v9 = v8;
  v10 = Double.significandWidth.getter(a2);
  result = v9 >= v10;
  v12 = v10 + __clz(__rbit64(v6));
  v13 = v9 - v12;
  if (__OFSUB__(v9, v12))
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v12 > 31)
  {
    if ((unint64_t)(v13 - 65) > 0xFFFFFFFFFFFFFF7ELL)
    {
      if (v13 < 0)
      {
        if ((unint64_t)v13 <= 0xFFFFFFFFFFFFFFC0)
          LODWORD(v13) = 0;
        else
          v13 = v6 >> (v12 - v9);
      }
      else if ((unint64_t)v13 >= 0x40)
      {
        LODWORD(v13) = 0;
      }
      else
      {
        v13 = v6 << v13;
      }
    }
    else
    {
      LODWORD(v13) = 0;
    }
LABEL_20:
    if (v9 != 31)
    {
      if (v9 < 0)
      {
        v14 = 0;
        goto LABEL_24;
      }
      goto LABEL_23;
    }
LABEL_31:
    if (a2 >= 0.0 || (_DWORD)v13)
      goto LABEL_38;
    goto LABEL_33;
  }
  if (v13 >= -32 && v13 <= 32)
  {
    if (v13 < 0)
    {
      if ((unint64_t)v13 <= 0xFFFFFFFFFFFFFFE0)
        goto LABEL_8;
      LODWORD(v13) = v4 >> (v12 - v9);
    }
    else
    {
      if ((unint64_t)v13 >= 0x20)
        goto LABEL_8;
      LODWORD(v13) = v4 << v13;
    }
    goto LABEL_20;
  }
LABEL_8:
  if (v9 == 31)
    goto LABEL_37;
  v14 = 0;
  LODWORD(v13) = 0;
  if ((v9 & 0x8000000000000000) == 0)
LABEL_23:
    v14 = 1 << v9;
LABEL_24:
  v15 = v13 | v14;
  if (a2 >= 0.0)
  {
    if ((v15 & 0x80000000) == 0)
    {
      LOBYTE(v7) = 0;
      goto LABEL_29;
    }
    goto LABEL_36;
  }
  if (v15 < 0)
  {
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    if (a2 >= 0.0)
      goto LABEL_38;
LABEL_33:
    LOBYTE(v7) = 0;
    v15 = 0x80000000;
    goto LABEL_29;
  }
  LOBYTE(v7) = 0;
  v15 = -v15;
LABEL_29:
  *(_DWORD *)a1 = v15;
  *(_BYTE *)(a1 + 4) = v7;
  return result;
}

BOOL sub_1001ED9EC(uint64_t a1, double a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 result;
  unint64_t v11;
  uint64_t v12;
  uint64_t i;
  unint64_t v14;

  v4 = (*(_QWORD *)&a2 >> 52) & 0x7FFLL;
  v5 = *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  v6 = v4 | *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (!v6)
  {
    v12 = 0;
    result = 1;
    goto LABEL_22;
  }
  if (v4 != 2047)
  {
    v7 = Double.exponent.getter(a2);
    if (v7 <= 63)
    {
      v8 = v7;
      v9 = Double.significandWidth.getter(a2);
      result = v8 >= v9;
      v11 = v9 + __clz(__rbit64(v5));
      v12 = v8 - v11;
      if (__OFSUB__(v8, v11))
      {
        __break(1u);
      }
      else
      {
        if (v12 >= -64 && v12 <= 64)
        {
          if (v12 < 0)
            goto LABEL_29;
          if ((unint64_t)v12 < 0x40)
          {
            v14 = v5 << v12;
            goto LABEL_13;
          }
        }
LABEL_7:
        if (v8 != 63)
        {
          i = 0;
          v14 = 0;
          if (v8 < 0)
            goto LABEL_17;
LABEL_16:
          for (i = 1 << v8; ; i = 0)
          {
LABEL_17:
            v12 = v14 | i;
            if (a2 >= 0.0)
            {
              if ((v12 & 0x8000000000000000) == 0)
              {
                LOBYTE(v6) = 0;
                goto LABEL_22;
              }
            }
            else
            {
              if ((v12 & 0x8000000000000000) == 0)
              {
                LOBYTE(v6) = 0;
                v12 = -v12;
                goto LABEL_22;
              }
              __break(1u);
            }
            __break(1u);
LABEL_29:
            if ((unint64_t)v12 <= 0xFFFFFFFFFFFFFFC0)
              goto LABEL_7;
            v14 = v5 >> -(char)v12;
LABEL_13:
            if (v8 == 63)
              break;
            if ((v8 & 0x8000000000000000) == 0)
              goto LABEL_16;
          }
          if (a2 < 0.0 && !v14)
            goto LABEL_33;
          goto LABEL_25;
        }
      }
      if (a2 < 0.0)
      {
LABEL_33:
        LOBYTE(v6) = 0;
        v12 = 0x8000000000000000;
        goto LABEL_22;
      }
    }
  }
LABEL_25:
  v12 = 0;
  result = 0;
  LOBYTE(v6) = 1;
LABEL_22:
  *(_QWORD *)a1 = v12;
  *(_BYTE *)(a1 + 8) = v6;
  return result;
}

void sub_1001EDB54(uint64_t a1@<X8>)
{
  Swift::String v1;

  v1._object = (void *)((a1 - 32) | 0x8000000000000000);
  v1._countAndFlagsBits = 0xD00000000000001ELL;
  String.append(_:)(v1);
}

void sub_1001EDB74()
{
  Swift::String v0;

  v0._countAndFlagsBits = 0x656C62756F44;
  v0._object = (void *)0xE600000000000000;
  String.append(_:)(v0);
}

uint64_t sub_1001EDB94@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return Data.subscript.getter(a3 >> 3, a1, a2);
}

uint64_t sub_1001EDBB0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return Data.subscript.getter(a3 >> 3, a1, a2);
}

uint64_t sub_1001EDBE0@<X0>(int a1@<W8>)
{
  unsigned int v1;
  uint64_t v2;

  return Data._Representation.subscript.setter(a1 | v1, v2);
}

void sub_1001EDBEC()
{
  _StringGuts.grow(_:)(80);
}

uint64_t sub_1001EDC00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10)
{
  return _assertionFailure(_:_:file:line:flags:)(a1, 11, 2, a4, a5, a6, 20, 2, a9, a10);
}

double sub_1001EDC2C(double a1)
{
  double result;

  *(_QWORD *)&result = ((*(uint64_t *)&a1 >> 63) | 1) + *(_QWORD *)&a1;
  return result;
}

double sub_1001EDC44()
{
  double v0;

  return 0.0 - v0;
}

void sub_1001EDC5C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v2;

  v2 = (a2 - 32) | 0x8000000000000000;
  String.append(_:)(*(Swift::String *)&a1);
}

uint64_t sub_1001EDC6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return static BinaryFloatingPoint<>._convert<A>(from:)(a1, a2, a3, v3, v4, v5);
}

uint64_t sub_1001EDCA8(uint64_t a1, uint64_t a2)
{
  return Data._Representation.subscript.setter(a1, a2);
}

uint64_t sub_1001EDCB8()
{
  uint64_t v0;
  uint64_t v1;

  return dispatch thunk of static BinaryInteger.isSigned.getter(v0, v1);
}

uint64_t sub_1001EDCC8(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

char *sub_1001EDCD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  return &a11;
}

uint64_t sub_1001EDCE0()
{
  uint64_t v0;
  uint64_t v1;

  return dispatch thunk of BinaryInteger._lowWord.getter(v0, v1);
}

uint64_t sub_1001EDCEC()
{
  uint64_t v0;
  uint64_t v1;

  return dispatch thunk of BinaryInteger.bitWidth.getter(v0, v1);
}

uint64_t sub_1001EDD08()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

unint64_t sub_1001EDD40()
{
  return sub_1001E80B8();
}

uint64_t sub_1001EDD48@<X0>(uint64_t a1@<X8>)
{
  unsigned int v1;
  char v2;

  return Data._Representation.subscript.setter(v1 >> v2, a1 >> 3);
}

double sub_1001EDD54(double a1)
{
  return -a1;
}

void sub_1001EDD60(uint64_t a1)
{
  unint64_t v1;

  v1 = 0xE500000000000000;
  String.append(_:)(*(Swift::String *)&a1);
}

uint64_t sub_1001EDD68()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

void HIDReport.subscript.getter(uint64_t a1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  char v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t AssociatedTypeWitness;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[3];
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v8 = a1;
  v30 = *(_QWORD *)(a4 - 8);
  __chkstk_darwin(a1);
  v29 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v28 = (char *)v22 - v12;
  v27 = *(_QWORD *)(v13 + 8);
  v14 = *(_QWORD *)(*(_QWORD *)(v27 + 24) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, v14);
  __chkstk_darwin(AssociatedTypeWitness);
  v17 = (char *)v22 - v16;
  v18 = a3;
  swift_getAssociatedConformanceWitness(v14, a4, AssociatedTypeWitness);
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)(&unk_10022EB18, 256, AssociatedTypeWitness);
  v31 = a5;
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)(v17, a4, v14);
  v19 = a3 >> 62;
  v32 = a2;
  v20 = v8 & 7;
  v25 = v18;
  v26 = (int)a2;
  if ((v8 & 7) != 0)
  {
    sub_1001EE968();
    LODWORD(v23) = v8 & 7;
    v24 = 8 - v20;
    v22[2] = 0xFFuLL >> (8 - v20);
    __asm { BR              X10 }
  }
  v21 = sub_1001EE968();
  v23 = BYTE6(v18);
  v24 = v32 >> 32;
  if (!__OFSUB__(v21, 8))
    __asm { BR              X10 }
  __break(1u);
  JUMPOUT(0x1001EE310);
}

void HIDReport.subscript.setter(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __chkstk_darwin(a1);
  v6 = dispatch thunk of static FixedWidthInteger.bitWidth.getter(v4, v5);
  if ((a2 & 7) != 0)
    __asm { BR              X11 }
  if (!__OFSUB__(v6, 8))
    __asm { BR              X11 }
  __break(1u);
  JUMPOUT(0x1001EE790);
}

void (*HIDReport.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t **a1, char a2)
{
  uint64_t v6;
  _QWORD *v13;
  uint64_t v14;
  size_t v15;
  void *v16;

  v13 = malloc(0x48uLL);
  *a1 = v13;
  v13[4] = a6;
  v13[5] = v6;
  v13[2] = a4;
  v13[3] = a5;
  *v13 = a2;
  v13[1] = a3;
  v14 = *(_QWORD *)(a4 - 8);
  v13[6] = v14;
  v15 = *(_QWORD *)(v14 + 64);
  v13[7] = malloc(v15);
  v16 = malloc(v15);
  v13[8] = v16;
  HIDReport.subscript.getter(a2, *(_QWORD *)v6, *(_QWORD *)(v6 + 8), a4, (uint64_t)v16);
  return sub_1001EE8A8;
}

void sub_1001EE8A8(uint64_t **a1, char a2)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *a1;
  v3 = (void *)(*a1)[7];
  v4 = (void *)(*a1)[8];
  if ((a2 & 1) != 0)
  {
    v5 = v2[6];
    v6 = v2[2];
    v7 = *v2;
    (*(void (**)(uint64_t, void *, uint64_t))(v5 + 16))((*a1)[7], v4, v6);
    HIDReport.subscript.setter((uint64_t)v3, v7);
    (*(void (**)(void *, uint64_t))(v5 + 8))(v4, v6);
  }
  else
  {
    HIDReport.subscript.setter((*a1)[8], *v2);
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t sub_1001EE954()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t sub_1001EE960(uint64_t a1, uint64_t a2)
{
  return Data._Representation.subscript.setter(a1, a2);
}

uint64_t sub_1001EE968()
{
  uint64_t v0;
  uint64_t v1;

  return dispatch thunk of static FixedWidthInteger.bitWidth.getter(v0, v1);
}

uint64_t sub_1001EE978()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 96);
}

uint64_t sub_1001EE994()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1001EE9A0()
{
  return __DataStorage._offset.getter();
}

void HIDReport.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BR              X11 }
}

BOOL sub_1001EEA08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((unint64_t)((int)a2 - 0x1000000000000000) >> 61 != 7)
  {
    __break(1u);
LABEL_3:
    __break(1u);
    JUMPOUT(0x1001EEA30);
  }
  if (__OFADD__(a1, 8 * (int)a2))
    goto LABEL_3;
  return (Data.subscript.getter((a1 + 8 * (int)a2) >> 3, a2, a3) & (1 << (a1 & 7))) != 0;
}

void HIDReport.subscript.setter()
{
  __asm { BR              X12 }
}

void (*HIDReport.subscript.modify(uint64_t a1, uint64_t a2))()
{
  uint64_t *v2;
  char v4;

  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = v2;
  HIDReport.subscript.getter(a2, *v2, v2[1]);
  *(_BYTE *)(a1 + 16) = v4 & 1;
  return sub_1001EEB40;
}

void sub_1001EEB40()
{
  HIDReport.subscript.setter();
}

uint64_t static Int8.logicalMaximum.getter()
{
  return 127;
}

void sub_1001EEB6C(_BYTE *a1@<X8>)
{
  *a1 = 0x80;
}

void sub_1001EEB78(_BYTE *a1@<X8>)
{
  *a1 = 127;
}

uint64_t static Int16.logicalMinimum.getter()
{
  return 0x8000;
}

uint64_t static Int16.logicalMaximum.getter()
{
  return 0x7FFFLL;
}

void sub_1001EEB94(_WORD *a1@<X8>)
{
  *a1 = 0x8000;
}

void sub_1001EEBA0(_WORD *a1@<X8>)
{
  *a1 = 0x7FFF;
}

uint64_t static Int32.logicalMinimum.getter()
{
  return 0x80000000;
}

uint64_t static Int32.logicalMaximum.getter()
{
  return 0x7FFFFFFFLL;
}

void sub_1001EEBBC(_DWORD *a1@<X8>)
{
  *a1 = 0x80000000;
}

void sub_1001EEBC8(_DWORD *a1@<X8>)
{
  *a1 = 0x7FFFFFFF;
}

uint64_t static Int64.logicalMaximum.getter()
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

void sub_1001EEBDC(_QWORD *a1@<X8>)
{
  *a1 = 0x8000000000000000;
}

void sub_1001EEBE8(_QWORD *a1@<X8>)
{
  *a1 = 0x7FFFFFFFFFFFFFFFLL;
}

double sub_1001EEBF4(char a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  double result;

  sub_100128714(a1, a2, a3);
  result = (double)(unint64_t)v3 * 1.08420217e-19;
  if (v3 < 0)
    return ((double)(unint64_t)~v3 + 1.0) * -1.08420217e-19;
  return result;
}

#error "1001EEC44: call analysis failed (funcsize=18)"

double sub_1001EEC84(char a1, uint64_t a2, unint64_t a3)
{
  unsigned __int16 v3;

  sub_100128154(a1, a2, a3);
  if ((v3 & 0x8000) != 0)
    return ((double)(unsigned __int16)~v3 + 1.0) * -0.0000305175781;
  else
    return (double)v3 / 32767.0;
}

double sub_1001EECD8(char a1, uint64_t a2, unint64_t a3)
{
  unsigned __int8 v3;

  sub_100127CC4(a1, a2, a3);
  if ((v3 & 0x80) != 0)
    return ((double)~v3 + 1.0) * -0.0078125;
  else
    return (double)v3 / 127.0;
}

uint64_t HIDReport.scaledValue<A, B>(as:unsignedType:atIndex:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unint64_t a11)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
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
  char *v25;
  uint64_t AssociatedConformanceWitness;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  _QWORD v35[3];
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v39 = a4;
  v40 = a5;
  v38 = a3;
  v41 = a10;
  v35[1] = *(_QWORD *)(sub_1001F00C4(0, a8) - 8);
  sub_1000262EC();
  __chkstk_darwin(v12);
  v14 = (char *)v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v17 = (char *)v35 - v16;
  v18 = sub_1001F00C4(0, a9);
  v36 = *(_QWORD *)(v18 - 8);
  sub_1000262EC();
  __chkstk_darwin(v19);
  sub_10003D69C();
  v35[2] = v20;
  sub_1000A3464();
  __chkstk_darwin(v21);
  sub_1000A34C8();
  v35[0] = v22;
  sub_1000A3464();
  __chkstk_darwin(v23);
  v25 = (char *)v35 - v24;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness(a9, a7, v18);
  v37 = v25;
  v27 = v39;
  v28 = v40;
  v39 = AssociatedConformanceWitness;
  v40 = a11;
  HIDReport.subscript.getter(v38, v27, v28, v18, (uint64_t)v25);
  sub_1001F0054();
  if (sub_1001F00E8() < 65)
  {
    sub_1001F0074();
    sub_1001F00F4();
  }
  else
  {
    sub_1001E807C();
    sub_1001EDD40();
    sub_1001EFFE0((uint64_t)&v42, (uint64_t)v17, (uint64_t)&type metadata for Double);
  }
  sub_1001EFFB8();
  v29 = v37;
  sub_1001F0054();
  if (sub_1001F00E8() <= 64)
  {
    sub_1001F0074();
    sub_1001F00F4();
  }
  else
  {
    sub_1001E807C();
    sub_1001EDD40();
    sub_1001EFFE0((uint64_t)&v42, (uint64_t)v14, (uint64_t)&type metadata for Double);
  }
  sub_1001F00D0();
  v30 = v36;
  v31 = v40;
  if (dispatch thunk of FixedWidthInteger.leadingZeroBitCount.getter(v18, v39) > 0)
  {
    (*(void (**)(_QWORD, char *, uint64_t))(v30 + 16))(v35[0], v29, v18);
    if (sub_1001F0064() >= 65)
      goto LABEL_11;
LABEL_12:
    sub_1001F0044();
    sub_1001F0008();
    goto LABEL_13;
  }
  dispatch thunk of static BinaryInteger.~ prefix(_:)(v29, v18, *(_QWORD *)(v31 + 8));
  if (sub_1001F0064() < 65)
    goto LABEL_12;
LABEL_11:
  sub_1001E807C();
  v32 = sub_1001EDD40();
  sub_1001EFF8C(v32, v33, (uint64_t)&type metadata for Double);
LABEL_13:
  sub_1001EFF7C();
  return sub_1001F00A0();
}

void HIDReport.scaledValue<A>(as:atIndex:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, uint64_t a6)
{
  uint64_t AssociatedTypeWitness;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  Swift::String v32;

  if (a5 == &type metadata for Int8)
  {
    sub_1001EFFA8();
    sub_1000125AC();
    sub_1001EECD8(v16, v17, v18);
  }
  else if (a5 == &type metadata for Int16)
  {
    sub_1001EFFA8();
    sub_1000125AC();
    sub_1001EEC84(v19, v20, v21);
  }
  else if (a5 == &type metadata for Int32)
  {
    sub_1001EFFA8();
    sub_1000125AC();
    sub_1001EEC3C();
  }
  else if (a5 == &type metadata for Int64)
  {
    sub_1001EFFA8();
    sub_1000125AC();
    sub_1001EEBF4(v22, v23, v24);
  }
  else
  {
    AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, a6);
    swift_getAssociatedConformanceWitness(a6, a5, AssociatedTypeWitness);
    *((_QWORD *)&v12 + 1) = sub_1001F002C();
    *(_QWORD *)&v12 = *((_QWORD *)&v12 + 1) - 8;
    switch((unint64_t)(v12 >> 3))
    {
      case 0uLL:
        sub_1001EF3C0();
        sub_1001EF3FC();
        sub_1001F00AC();
        v15 = &type metadata for UInt8;
        goto LABEL_14;
      case 1uLL:
        sub_10013F740();
        sub_1000E6C00();
        sub_1001F00AC();
        v15 = &type metadata for UInt16;
        goto LABEL_14;
      case 3uLL:
        sub_1001EF384();
        sub_10002C9C0();
        sub_1001F00AC();
        v15 = &type metadata for UInt32;
        goto LABEL_14;
      case 7uLL:
        sub_1001EF30C();
        sub_1001EF348();
        sub_1001F00AC();
        v15 = &type metadata for UInt64;
LABEL_14:
        HIDReport.scaledValue<A, B>(as:unsignedType:atIndex:)(v13, v14, a2, a3, a4, (uint64_t)a5, (uint64_t)v15, a6, v29, v30, v31);
        sub_1000125AC();
        break;
      default:
        sub_1001EFFCC();
        swift_bridgeObjectRelease();
        sub_1001F002C();
        v32._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
        sub_1001F0100(v32);
        swift_bridgeObjectRelease();
        sub_1001EFFF4((uint64_t)"Fatal error", v25, v26, 0xD000000000000016, 0x800000010025A800, (uint64_t)"HIDReport/HIDReportScaledSigned.swift", v27, v28, 64, 0);
        __break(1u);
        break;
    }
  }
}

unint64_t sub_1001EF30C()
{
  unint64_t result;

  result = qword_1002B6318;
  if (!qword_1002B6318)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for UInt64, &type metadata for UInt64);
    atomic_store(result, (unint64_t *)&qword_1002B6318);
  }
  return result;
}

unint64_t sub_1001EF348()
{
  unint64_t result;

  result = qword_1002B6320;
  if (!qword_1002B6320)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for UInt64, &type metadata for UInt64);
    atomic_store(result, (unint64_t *)&qword_1002B6320);
  }
  return result;
}

unint64_t sub_1001EF384()
{
  unint64_t result;

  result = qword_1002B6328;
  if (!qword_1002B6328)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for UInt32, &type metadata for UInt32);
    atomic_store(result, (unint64_t *)&qword_1002B6328);
  }
  return result;
}

unint64_t sub_1001EF3C0()
{
  unint64_t result;

  result = qword_1002B6330;
  if (!qword_1002B6330)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for UInt8, &type metadata for UInt8);
    atomic_store(result, (unint64_t *)&qword_1002B6330);
  }
  return result;
}

unint64_t sub_1001EF3FC()
{
  unint64_t result;

  result = qword_1002B6338;
  if (!qword_1002B6338)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for UInt8, &type metadata for UInt8);
    atomic_store(result, (unint64_t *)&qword_1002B6338);
  }
  return result;
}

void sub_1001EF438(char a1, double a2)
{
  uint64_t v4;

  v4 = sub_1001EC2D4(0x8000000000000000, 0x7FFFFFFFFFFFFFFFLL);
  if (a2 >= 0.0 || v4 == 0)
  {
    if ((v4 & 0x8000000000000000) == 0)
      goto LABEL_10;
    __break(1u);
  }
  if (v4 >= 0)
    v4 = -v4;
LABEL_10:
  sub_1001AE9C4(v4, a1);
}

void sub_1001EF48C(char a1, double a2)
{
  uint64_t v4;

  sub_1001EC1EC(0x80000000);
  if (a2 >= 0.0 || (_DWORD)v4 == 0)
  {
    if ((v4 & 0x80000000) == 0)
      goto LABEL_11;
    __break(1u);
  }
  if ((int)v4 < 0)
    v4 = v4;
  else
    v4 = -(int)v4;
LABEL_11:
  sub_1001ECD24(v4, a1);
}

void sub_1001EF4E0(char a1, double a2)
{
  __int16 v4;
  uint64_t v5;

  sub_1001EC0FC(0x8000);
  v5 = v4;
  if (a2 < 0.0 && (_DWORD)v5 != 0)
    goto LABEL_8;
  if ((v5 & 0x80000000) != 0)
  {
    __break(1u);
LABEL_8:
    v5 = ((int)v5 >> 15) - (v5 ^ ((int)v5 >> 15));
  }
  sub_1000E4F5C(v5, a1);
}

void sub_1001EF53C(char a1, double a2)
{
  char v4;
  uint64_t v5;

  sub_1001EC00C(128);
  v5 = v4;
  if (a2 < 0.0 && (_DWORD)v5 != 0)
    goto LABEL_8;
  if ((v5 & 0x80000000) != 0)
  {
    __break(1u);
LABEL_8:
    v5 = ((int)v5 >> 7) - (v5 ^ ((int)v5 >> 7));
  }
  sub_1000E4D78(v5, a1);
}

uint64_t HIDReport.setScaledValue<A, B>(_:as:unsignedType:atIndex:)(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v14;
  uint64_t AssociatedTypeWitness;
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
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char *v48;
  uint64_t v49;
  BOOL v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
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
  char *v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD v80[2];
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t AssociatedConformanceWitness;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;

  v98 = a9;
  v97 = a8;
  v94 = a4;
  v95 = a3;
  v100 = *(_QWORD *)(a10 + 8);
  v14 = *(_QWORD *)(v100 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(255, a7);
  v16 = swift_getAssociatedTypeWitness(255, v14);
  v99 = v14;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness(v14, AssociatedTypeWitness, v16);
  v88 = *(_QWORD *)(AssociatedConformanceWitness + 16);
  v86 = swift_getAssociatedTypeWitness(0, v88);
  __chkstk_darwin(v86);
  v85 = (char *)v80 - v17;
  v18 = swift_checkMetadataState(0, v16);
  v90 = *(_QWORD *)(v18 - 8);
  sub_1000262EC();
  __chkstk_darwin(v19);
  sub_10003D69C();
  v84 = v20;
  sub_1000A3464();
  __chkstk_darwin(v21);
  sub_1000A34C8();
  v83 = v22;
  sub_1000A3464();
  __chkstk_darwin(v23);
  sub_1000A34C8();
  v87 = v24;
  sub_1000A3464();
  __chkstk_darwin(v25);
  sub_1000A34C8();
  v91 = v26;
  sub_1000A3464();
  __chkstk_darwin(v27);
  v29 = (char *)v80 - v28;
  v96 = a6;
  sub_1000262EC();
  __chkstk_darwin(v30);
  v101 = (char *)v80 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = swift_checkMetadataState(0, AssociatedTypeWitness);
  v33 = *(_QWORD *)(v32 - 8);
  v34 = __chkstk_darwin(v32);
  v36 = (char *)v80 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __chkstk_darwin(v34);
  v39 = (char *)v80 - v38;
  v40 = __chkstk_darwin(v37);
  v42 = (char *)v80 - v41;
  __chkstk_darwin(v40);
  v44 = (char *)v80 - v43;
  sub_1001F00DC();
  sub_1001F00DC();
  v45 = swift_getAssociatedConformanceWitness(a7, a5, v32);
  v92 = v42;
  FixedWidthInteger.init(scaledValue:logicalMinimum:logicalMaximum:)((uint64_t)v42, (uint64_t)v39, v32, v45, (uint64_t)v44, a1);
  v93 = v44;
  sub_1001F0094((uint64_t)v36);
  if (a1 < 0.0)
  {
    v82 = v36;
    dispatch thunk of Numeric.magnitude.getter(v32, v99);
    v46 = sub_1001F010C(v100);
    v47 = dispatch thunk of static BinaryInteger.isSigned.getter(v18, v46);
    v48 = v29;
    v49 = dispatch thunk of BinaryInteger.bitWidth.getter(v18, v46);
    if ((v47 & 1) != 0)
      v50 = v49 <= 64;
    else
      v50 = v49 <= 63;
    v51 = (uint64_t)v101;
    v52 = v33;
    if (v50)
    {
      v67 = (uint64_t)v48;
      v68 = dispatch thunk of BinaryInteger._lowWord.getter(v18, v46);
      sub_1000CF730(v67);
      v59 = v46;
      sub_1001F003C((uint64_t)v82);
      v60 = v99;
      if (v68 <= 0)
        goto LABEL_8;
    }
    else
    {
      v102 = 0;
      v53 = (uint64_t)v48;
      v54 = sub_10002C9FC();
      v55 = v91;
      dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)(&v102, &type metadata for Int, v54, v18, v46);
      v80[1] = v52;
      v56 = v99;
      v57 = sub_1001F010C(v99);
      v58 = dispatch thunk of static Comparable.< infix(_:_:)(v55, v48, v18, v57);
      sub_1000CF730(v55);
      sub_1000CF730(v53);
      v59 = v46;
      sub_1001F003C((uint64_t)v82);
      v60 = v56;
      if ((v58 & 1) == 0)
        goto LABEL_8;
    }
    v81 = v59;
    v69 = v83;
    v70 = (uint64_t)v93;
    dispatch thunk of Numeric.magnitude.getter(v32, v60);
    v71 = v88;
    v72 = v86;
    swift_getAssociatedConformanceWitness(v88, v18, v86);
    v73 = v85;
    dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)(&unk_10022EB38, 512, v72);
    v74 = v84;
    v75 = v73;
    v62 = v70;
    dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)(v75, v18, v71);
    v76 = v87;
    dispatch thunk of static AdditiveArithmetic.- infix(_:_:)(v69, v74, v18, *(_QWORD *)(AssociatedConformanceWitness + 8));
    sub_1000CF730(v74);
    v51 = (uint64_t)v101;
    sub_1000CF730(v69);
    v77 = v91;
    v78 = v81;
    dispatch thunk of static BinaryInteger.~ prefix(_:)(v76, v18, v81);
    sub_1000CF730(v76);
    v63 = *(_QWORD *)(v97 + 8);
    v64 = v77;
    v65 = v18;
    v66 = v78;
    goto LABEL_11;
  }
  sub_1001F003C((uint64_t)v36);
  v51 = (uint64_t)v101;
LABEL_8:
  v61 = (uint64_t)v92;
  v62 = (uint64_t)v93;
  sub_1001F0094((uint64_t)v92);
  v63 = *(_QWORD *)(v97 + 8);
  v64 = v61;
  v65 = v32;
  v66 = v100;
LABEL_11:
  dispatch thunk of BinaryInteger.init<A>(_:)(v64, v65, v66, v96, v63);
  HIDReport.subscript.setter(v51, v94);
  return sub_1001F003C(v62);
}

void HIDReport.setScaledValue<A>(_:as:atIndex:)(double a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  __int128 v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  char v17;
  double v18;
  char v19;
  double v20;
  char v21;
  double v22;
  char v23;
  double v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  Swift::String v35;

  if (a4 == &type metadata for Int8)
  {
    sub_1001F001C();
    if (!v16)
    {
      sub_1001F00B8();
      sub_1001EFF60();
      sub_1001EF53C(v17, v18);
      return;
    }
    __break(1u);
    goto LABEL_21;
  }
  if (a4 == &type metadata for Int16)
  {
    sub_1001F001C();
    if (!v16)
    {
      sub_1001F00B8();
      sub_1001EFF60();
      sub_1001EF4E0(v19, v20);
      return;
    }
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (a4 == &type metadata for Int32)
  {
    sub_1001F001C();
    if (v16)
    {
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    sub_1001F00B8();
    sub_1001EFF60();
    sub_1001EF48C(v21, v22);
  }
  else
  {
    v9 = *(_QWORD *)&a1 & 0x7FF0000000000000;
    if (a4 != &type metadata for Int64)
    {
      if (v9 != 0x7FF0000000000000)
      {
        AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, a5);
        swift_getAssociatedConformanceWitness(a5, a4, AssociatedTypeWitness);
        *((_QWORD *)&v13 + 1) = sub_1001F0084();
        *(_QWORD *)&v13 = *((_QWORD *)&v13 + 1) - 8;
        switch((unint64_t)(v13 >> 3))
        {
          case 0uLL:
            v14 = sub_1001ECF6C();
            v15 = sub_1001EF3FC();
            HIDReport.setScaledValue<A, B>(_:as:unsignedType:atIndex:)(a1, v15, (uint64_t)&type metadata for UInt8, a3, (uint64_t)a4, (uint64_t)&type metadata for UInt8, a5, v14, v15, a6);
            goto LABEL_19;
          case 1uLL:
            v27 = sub_1000E6B88();
            v28 = sub_1000E6C00();
            HIDReport.setScaledValue<A, B>(_:as:unsignedType:atIndex:)(a1, v28, (uint64_t)&type metadata for UInt16, a3, (uint64_t)a4, (uint64_t)&type metadata for UInt16, a5, v27, v28, a6);
            goto LABEL_19;
          case 3uLL:
            v29 = sub_10002C984();
            v30 = sub_10002C9C0();
            HIDReport.setScaledValue<A, B>(_:as:unsignedType:atIndex:)(a1, v30, (uint64_t)&type metadata for UInt32, a3, (uint64_t)a4, (uint64_t)&type metadata for UInt32, a5, v29, v30, a6);
            goto LABEL_19;
          case 7uLL:
            v25 = sub_1001E80B8();
            v26 = sub_1001EF348();
            HIDReport.setScaledValue<A, B>(_:as:unsignedType:atIndex:)(a1, v26, (uint64_t)&type metadata for UInt64, a3, (uint64_t)a4, (uint64_t)&type metadata for UInt64, a5, v25, v26, a6);
LABEL_19:
            sub_1001EFF60();
            return;
          default:
            goto LABEL_25;
        }
      }
      goto LABEL_22;
    }
    if (v9 == 0x7FF0000000000000)
    {
LABEL_24:
      __break(1u);
LABEL_25:
      sub_1001EFFCC();
      swift_bridgeObjectRelease();
      sub_1001F0084();
      v35._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
      sub_1001F0100(v35);
      swift_bridgeObjectRelease();
      sub_1001EFFF4((uint64_t)"Fatal error", v31, v32, 0xD000000000000016, 0x800000010025A800, (uint64_t)"HIDReport/HIDReportScaledSigned.swift", v33, v34, 110, 0);
      __break(1u);
      JUMPOUT(0x1001EFE40);
    }
    sub_1001F00B8();
    sub_1001EFF60();
    sub_1001EF438(v23, v24);
  }
}

unint64_t sub_1001EFE64()
{
  unint64_t result;

  result = qword_1002B6340;
  if (!qword_1002B6340)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Int8, &type metadata for Int8);
    atomic_store(result, (unint64_t *)&qword_1002B6340);
  }
  return result;
}

unint64_t sub_1001EFEA4()
{
  unint64_t result;

  result = qword_1002B6370;
  if (!qword_1002B6370)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Int16, &type metadata for Int16);
    atomic_store(result, (unint64_t *)&qword_1002B6370);
  }
  return result;
}

unint64_t sub_1001EFEE4()
{
  unint64_t result;

  result = qword_1002B63A0;
  if (!qword_1002B63A0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Int32, &type metadata for Int32);
    atomic_store(result, (unint64_t *)&qword_1002B63A0);
  }
  return result;
}

unint64_t sub_1001EFF24()
{
  unint64_t result;

  result = qword_1002B63D0;
  if (!qword_1002B63D0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Int64, &type metadata for Int64);
    atomic_store(result, (unint64_t *)&qword_1002B63D0);
  }
  return result;
}

uint64_t sub_1001EFF7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t sub_1001EFF8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return static BinaryFloatingPoint<>._convert<A>(from:)(v7 - 104, v6, a3, v3, v4, v5);
}

uint64_t sub_1001EFFA8()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1001EFFB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 168) + 8))(v0, v1);
}

void sub_1001EFFCC()
{
  _StringGuts.grow(_:)(24);
}

uint64_t sub_1001EFFE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return static BinaryFloatingPoint<>._convert<A>(from:)(a1, a2, a3, v5, v3, v4);
}

uint64_t sub_1001EFFF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10)
{
  return _assertionFailure(_:_:file:line:flags:)(a1, 11, 2, a4, a5, a6, 37, 2, a9, a10);
}

uint64_t sub_1001F0008()
{
  uint64_t v0;
  uint64_t v1;

  return dispatch thunk of BinaryInteger._lowWord.getter(v0, v1);
}

uint64_t sub_1001F002C()
{
  uint64_t v0;
  uint64_t v1;

  return dispatch thunk of static FixedWidthInteger.bitWidth.getter(v0, v1);
}

uint64_t sub_1001F003C(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t sub_1001F0044()
{
  uint64_t v0;
  uint64_t v1;

  return dispatch thunk of static BinaryInteger.isSigned.getter(v0, v1);
}

uint64_t sub_1001F0054()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t sub_1001F0064()
{
  uint64_t v0;
  uint64_t v1;

  return dispatch thunk of BinaryInteger.bitWidth.getter(v0, v1);
}

uint64_t sub_1001F0074()
{
  uint64_t v0;
  uint64_t v1;

  return dispatch thunk of static BinaryInteger.isSigned.getter(v1, v0);
}

uint64_t sub_1001F0084()
{
  uint64_t v0;
  uint64_t v1;

  return dispatch thunk of static FixedWidthInteger.bitWidth.getter(v0, v1);
}

uint64_t sub_1001F0094(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, v1, v3);
}

uint64_t sub_1001F00A0()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v2, v0);
}

uint64_t sub_1001F00B8()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1001F00C4(uint64_t a1, uint64_t a2)
{
  return swift_getAssociatedTypeWitness(a1, a2);
}

uint64_t sub_1001F00D0()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t sub_1001F00DC()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

uint64_t sub_1001F00E8()
{
  uint64_t v0;
  uint64_t v1;

  return dispatch thunk of BinaryInteger.bitWidth.getter(v1, v0);
}

uint64_t sub_1001F00F4()
{
  uint64_t v0;
  uint64_t v1;

  return dispatch thunk of BinaryInteger._lowWord.getter(v1, v0);
}

void sub_1001F0100(Swift::String a1)
{
  String.append(_:)(a1);
}

uint64_t sub_1001F010C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return swift_getAssociatedConformanceWitness(a1, v2, v1);
}

void sub_1001F0118()
{
  sub_1001F0FB0();
  __asm { BR              X10 }
}

void sub_1001F0150()
{
  uint64_t v0;
  uint64_t v1;

  sub_1001F0F5C();
  sub_1001F0FA0(v0, v1 & 0xFFFFFFFFFFFFFFLL);
  sub_1001AB0A0();
}

BOOL sub_1001F0208(unsigned int a1, unsigned int a2)
{
  return (unsigned __int16)a1 < (unsigned __int16)a2 || HIWORD(a2) >= HIWORD(a1);
}

BOOL sub_1001F0224(unsigned int a1, unsigned int a2)
{
  return (unsigned __int16)a2 < (unsigned __int16)a1 || HIWORD(a1) >= HIWORD(a2);
}

void sub_1001F0240(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

void sub_1001F0288()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_100140EA0();
  sub_1001EA8C4(v1, v3 & 0xFFFFFFFFFFFFFFLL, v2, v0);
  sub_1001AB0A0();
}

void sub_1001F0360()
{
  sub_1001F0FB0();
  __asm { BR              X10 }
}

void sub_1001F0398()
{
  uint64_t v0;
  uint64_t v1;

  sub_1001F0F5C();
  sub_1001F0FA0(v0, v1 & 0xFFFFFFFFFFFFFFLL);
  sub_1001AB0A0();
}

BOOL sub_1001F044C(unsigned int a1, unsigned int a2)
{
  return (unsigned __int16)a1 >= (unsigned __int16)a2 && HIWORD(a2) < HIWORD(a1);
}

uint64_t sub_1001F0468@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  return HIDUsageProtocol.init<A>(_:)(a1, a4, a2, a5, a3, a6);
}

uint64_t HIDUsageProtocol.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;

  v22 = a6;
  v11 = type metadata accessor for Optional(0, a2);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v21 - v13;
  v15 = sub_1000EFF50(*(uint64_t (**)(uint64_t, uint64_t))(a5 + 16));
  v16 = sub_1000EFF50(*(uint64_t (**)(uint64_t, uint64_t))(a5 + 24));
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 32))(v15, v16, a2, a4);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a1, a3);
  if (_s13EnsembleAgent26PasteboardAcquisitionErrorOwet_0((uint64_t)v14, 1, a2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    v17 = 1;
    v18 = v22;
  }
  else
  {
    v19 = v22;
    (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(v22, v14, a2);
    v17 = 0;
    v18 = v19;
  }
  return _s13EnsembleAgent26PasteboardAcquisitionErrorOwst_0(v18, v17, 1, a2);
}

uint64_t HIDUsage._usage.getter(unsigned int a1)
{
  return HIWORD(a1);
}

uint64_t HIDUsage.page.getter(uint64_t result)
{
  return (unsigned __int16)result;
}

HIDReport::HIDUsage __swiftcall HIDUsage.init(page:usage:)(Swift::Int page, Swift::Int usage)
{
  return (HIDReport::HIDUsage)((unsigned __int16)page | ((unsigned __int16)usage << 16));
}

uint64_t HIDUsage.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unsigned __int16 v6;

  v3 = a3;
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  LOWORD(v3) = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(a2, v3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  return v6 | ((unsigned __int16)v3 << 16);
}

void HIDUsage.hash(into:)(int a1, unsigned int a2)
{
  unsigned int v2;

  v2 = HIWORD(a2);
  Hasher._combine(_:)(a2);
  Hasher._combine(_:)(v2);
}

uint64_t sub_1001F0684(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  char v8;

  if (a1 == 0x656761705FLL && a2 == 0xE500000000000000)
  {
    v5 = 0xE500000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x656761705FLL, 0xE500000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x65676173755FLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease(0xE600000000000000);
    return 1;
  }
  else
  {
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)(0x65676173755FLL, 0xE600000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v8 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1001F0760(char a1)
{
  if ((a1 & 1) != 0)
    return 0x65676173755FLL;
  else
    return 0x656761705FLL;
}

uint64_t sub_1001F0790()
{
  char *v0;

  return sub_1001F0760(*v0);
}

uint64_t sub_1001F0798@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1001F0684(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1001F07BC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001F0908();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001F07E4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001F0908();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t HIDUsage.encode(to:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  char v14;
  char v15;

  v5 = sub_1000055B0(&qword_1002B6400);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_10000DBE4(a1, v9);
  v11 = sub_1001F0908();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for HIDUsage.CodingKeys, &type metadata for HIDUsage.CodingKeys, v11, v9, v10);
  v15 = 0;
  sub_1001F0F90(a2, (uint64_t)&v15);
  if (!v2)
  {
    v14 = 1;
    sub_1001F0F90(WORD1(a2), (uint64_t)&v14);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_1001F0908()
{
  unint64_t result;

  result = qword_1002B6408;
  if (!qword_1002B6408)
  {
    result = swift_getWitnessTable(&unk_10022EE00, &type metadata for HIDUsage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6408);
  }
  return result;
}

Swift::Int HIDUsage.hashValue.getter(unsigned int a1)
{
  Swift::UInt16 v1;
  unsigned int v2;
  _QWORD v4[9];

  v1 = a1;
  v2 = HIWORD(a1);
  Hasher.init(_seed:)(v4, 0);
  Hasher._combine(_:)(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t HIDUsage.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int16 v7;
  unsigned __int16 v8;
  char v10;
  char v11;

  v3 = sub_1000055B0(&qword_1002B6410);
  __chkstk_darwin(v3);
  v4 = a1[3];
  v5 = a1[4];
  sub_10000DBE4(a1, v4);
  v6 = sub_1001F0908();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for HIDUsage.CodingKeys, &type metadata for HIDUsage.CodingKeys, v6, v4, v5);
  if (v1)
  {
    sub_100005988(a1);
  }
  else
  {
    v11 = 0;
    v7 = sub_1001F0FD8((uint64_t)&v11);
    v10 = 1;
    v8 = sub_1001F0FD8((uint64_t)&v10);
    sub_1000876AC();
    sub_100005988(a1);
    return v7 | (v8 << 16);
  }
  return v4;
}

uint64_t sub_1001F0AC0()
{
  unsigned int *v0;

  return HIDUsage.page.getter(*v0);
}

uint64_t sub_1001F0AC8()
{
  unsigned int *v0;

  return HIDUsage._usage.getter(*v0);
}

HIDReport::HIDUsage sub_1001F0AD0@<W0>(Swift::Int a1@<X0>, Swift::Int a2@<X1>, uint64_t a3@<X8>)
{
  HIDReport::HIDUsage result;

  result = HIDUsage.init(page:usage:)(a1, a2);
  *(HIDReport::HIDUsage *)a3 = result;
  *(_BYTE *)(a3 + 4) = 0;
  return result;
}

uint64_t sub_1001F0AF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result;

  result = HIDUsage.init<A>(_:)(a1, a2, a3);
  *(_DWORD *)a4 = result;
  *(_BYTE *)(a4 + 4) = 0;
  return result;
}

uint64_t sub_1001F0B20@<X0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = HIDUsage.init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_1001F0B48(_QWORD *a1)
{
  unsigned int *v1;

  return HIDUsage.encode(to:)(a1, *v1);
}

Swift::Int sub_1001F0B60()
{
  unsigned int *v0;

  return HIDUsage.hashValue.getter(*v0);
}

void sub_1001F0B68(int a1)
{
  unsigned int *v1;

  HIDUsage.hash(into:)(a1, *v1);
}

Swift::Int sub_1001F0B70(uint64_t a1)
{
  Swift::UInt16 *v1;
  Swift::UInt16 v2;
  Swift::UInt16 v3;
  _QWORD v5[9];

  v2 = *v1;
  v3 = v1[1];
  Hasher.init(_seed:)(v5, a1);
  Hasher._combine(_:)(v2);
  Hasher._combine(_:)(v3);
  return Hasher._finalize()();
}

uint64_t HIDUsage.description.getter(unsigned int a1)
{
  uint64_t v1;
  unint64_t v2;
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
  void *v19;
  void *v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v24;

  v1 = HIWORD(a1);
  v24 = (unsigned __int16)a1;
  v2 = sub_10002C9FC();
  v10 = sub_1001F0F78(v2, v3, v4, v5, v6, v7, v8, v9, v24);
  v18 = sub_1001F0F78(v10, v11, v12, v13, v14, v15, v16, v17, v1);
  v20 = v19;
  v21._countAndFlagsBits = 58;
  v21._object = (void *)0xE100000000000000;
  String.append(_:)(v21);
  v22._countAndFlagsBits = v18;
  v22._object = v20;
  String.append(_:)(v22);
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1001F0C60()
{
  unsigned int *v0;

  return HIDUsage.description.getter(*v0);
}

BOOL static HIDUsage.< infix(_:_:)(unsigned int a1, unsigned int a2)
{
  return (unsigned __int16)a2 >= (unsigned __int16)a1 && HIWORD(a1) < HIWORD(a2);
}

unint64_t sub_1001F0C84(uint64_t a1)
{
  unint64_t result;

  result = sub_1001F0CA8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1001F0CA8()
{
  unint64_t result;

  result = qword_1002B6418;
  if (!qword_1002B6418)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDUsage, &type metadata for HIDUsage);
    atomic_store(result, (unint64_t *)&qword_1002B6418);
  }
  return result;
}

unint64_t sub_1001F0CE8()
{
  unint64_t result;

  result = qword_1002B6420;
  if (!qword_1002B6420)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDUsage, &type metadata for HIDUsage);
    atomic_store(result, (unint64_t *)&qword_1002B6420);
  }
  return result;
}

BOOL sub_1001F0D24(unsigned int *a1, unsigned int *a2)
{
  return static HIDUsage.< infix(_:_:)(*a1, *a2);
}

BOOL sub_1001F0D30(unsigned int *a1, unsigned int *a2)
{
  return sub_1001F0208(*a1, *a2);
}

BOOL sub_1001F0D3C(unsigned int *a1, unsigned int *a2)
{
  return sub_1001F0224(*a1, *a2);
}

BOOL sub_1001F0D48(unsigned int *a1, unsigned int *a2)
{
  return sub_1001F044C(*a1, *a2);
}

uint64_t dispatch thunk of HIDUsageProtocol.page.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of HIDUsageProtocol.init(page:usage:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of HIDUsageProtocol.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

_DWORD *initializeBufferWithCopyOfBuffer for HIDUsage(_DWORD *result, _DWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HIDUsage(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 4))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for HIDUsage(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
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
  *(_BYTE *)(result + 4) = v3;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage()
{
  return &type metadata for HIDUsage;
}

uint64_t storeEnumTagSinglePayload for HIDUsage.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1001F0E1C + 4 * byte_10022EBC5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1001F0E50 + 4 * byte_10022EBC0[v4]))();
}

uint64_t sub_1001F0E50(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001F0E58(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1001F0E60);
  return result;
}

uint64_t sub_1001F0E6C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1001F0E74);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1001F0E78(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001F0E80(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.CodingKeys()
{
  return &type metadata for HIDUsage.CodingKeys;
}

unint64_t sub_1001F0EA0()
{
  unint64_t result;

  result = qword_1002B6428;
  if (!qword_1002B6428)
  {
    result = swift_getWitnessTable(&unk_10022EDD8, &type metadata for HIDUsage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6428);
  }
  return result;
}

unint64_t sub_1001F0EE0()
{
  unint64_t result;

  result = qword_1002B6430;
  if (!qword_1002B6430)
  {
    result = swift_getWitnessTable(&unk_10022ED48, &type metadata for HIDUsage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6430);
  }
  return result;
}

unint64_t sub_1001F0F20()
{
  unint64_t result;

  result = qword_1002B6438;
  if (!qword_1002B6438)
  {
    result = swift_getWitnessTable(&unk_10022ED70, &type metadata for HIDUsage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6438);
  }
  return result;
}

uint64_t sub_1001F0F5C()
{
  unint64_t v0;
  uint64_t v1;

  return sub_10002517C(v1, v0);
}

uint64_t sub_1001F0F68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;

  return sub_1001EA748(a1, a2, a3, v4, v3);
}

uint64_t sub_1001F0F78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;

  return String.init<A>(_:radix:uppercase:)(&a9, 16, 1, v10, v9);
}

uint64_t sub_1001F0F90(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return KeyedEncodingContainer.encode(_:forKey:)(a1, a2, v2);
}

uint64_t sub_1001F0FA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return sub_1001EA8C4(a1, a2, v3, v2);
}

uint64_t sub_1001F0FC8()
{
  uint64_t v0;
  unint64_t v1;

  return sub_100022AEC(v0, v1);
}

uint64_t sub_1001F0FD8(uint64_t a1)
{
  uint64_t v1;

  return KeyedDecodingContainer.decode(_:forKey:)(a1, v1);
}

uint64_t sub_1001F0FE8(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  v9 = sub_1000055B0(&qword_1002B64B8);
  v10 = sub_10003A0A8(&qword_1002B64C0, &qword_1002B64B8, (uint64_t)&protocol conformance descriptor for <A> [A]);
  v8[0] = a1;
  v2 = sub_10000DBE4(v8, v9);
  v3 = *v2 + 32;
  v4 = v3 + *(_QWORD *)(*v2 + 16);
  swift_bridgeObjectRetain();
  sub_100040F5C(v3, v4, &v7);
  swift_bridgeObjectRelease();
  v5 = v7;
  sub_100005988(v8);
  return v5;
}

void HIDReportDescriptor.init(bytes:)(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;

  *a2 = sub_1001F0FE8(a1);
  a2[1] = v3;
  sub_1000050D4();
}

HIDReport::HIDReportDescriptor::ItemType_optional __swiftcall HIDReportDescriptor.ItemType.init(rawValue:)(Swift::UInt8 rawValue)
{
  _BYTE *v1;
  HIDReport::HIDReportDescriptor::ItemType_optional result;

  sub_1001F2DBC(v1);
  return result;
}

uint64_t Input.Bit0.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_1001F10DC(char a1, char a2)
{
  return byte_10022FAFE[a1] == byte_10022FAFE[a2];
}

Swift::Int sub_1001F1100()
{
  Swift::UInt8 *v0;

  return sub_1001F1108(*v0);
}

Swift::Int sub_1001F1108(Swift::UInt8 a1)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

Swift::Int sub_1001F114C(char a1)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(byte_10022FAFE[a1]);
  return Hasher._finalize()();
}

void sub_1001F119C()
{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  _QWORD v9[9];

  v0 = Hasher.init(_seed:)(v9, 0);
  sub_1001DCE98(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9[0]);
  Hasher._finalize()();
  sub_10000E59C();
}

void sub_1001F11D0(int a1)
{
  Swift::UInt8 *v1;

  sub_1001F11FC(a1, *v1);
}

void sub_1001F11D8(uint64_t a1, char a2)
{
  Hasher._combine(_:)(a2 & 1);
}

void sub_1001F11FC(int a1, Swift::UInt8 a2)
{
  Hasher._combine(_:)(a2);
}

void sub_1001F1220(uint64_t a1, char a2)
{
  Hasher._combine(_:)(byte_10022FAFE[a2]);
}

Swift::Int sub_1001F1250(uint64_t a1)
{
  Swift::UInt8 *v1;

  return sub_1001F12A4(a1, *v1);
}

Swift::Int sub_1001F1258(uint64_t a1, char a2)
{
  _QWORD v4[9];

  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(byte_10022FAFE[a2]);
  return Hasher._finalize()();
}

Swift::Int sub_1001F12A4(uint64_t a1, Swift::UInt8 a2)
{
  _QWORD v4[9];

  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(a2);
  return Hasher._finalize()();
}

void sub_1001F12E4(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  _QWORD v10[9];

  v1 = Hasher.init(_seed:)(v10, a1);
  sub_1001DCE98(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10[0]);
  Hasher._finalize()();
  sub_10000E59C();
}

HIDReport::HIDReportDescriptor::ItemType_optional sub_1001F1314(Swift::UInt8 *a1)
{
  return HIDReportDescriptor.ItemType.init(rawValue:)(*a1);
}

uint64_t sub_1001F131C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = Input.Bit0.rawValue.getter();
  *a1 = result;
  return result;
}

void HIDReportDescriptor.ItemTag.bType.getter(_BYTE *a1@<X8>)
{
  sub_1001F2DBC(a1);
}

uint64_t HIDReportDescriptor.ItemTag.rawValue.getter()
{
  char *v0;

  return byte_10022FAFE[*v0];
}

HIDReport::HIDReportDescriptor::ItemTag_optional __swiftcall HIDReportDescriptor.ItemTag.init(rawValue:)(Swift::UInt8 rawValue)
{
  _BYTE *v1;
  HIDReport::HIDReportDescriptor::ItemTag_optional result;

  sub_1001F2DBC(v1);
  return result;
}

BOOL sub_1001F146C(char *a1, char *a2)
{
  return sub_1001F10DC(*a1, *a2);
}

Swift::Int sub_1001F1478()
{
  char *v0;

  return sub_1001F114C(*v0);
}

void sub_1001F1480(uint64_t a1)
{
  char *v1;

  sub_1001F1220(a1, *v1);
}

Swift::Int sub_1001F1488(uint64_t a1)
{
  char *v1;

  return sub_1001F1258(a1, *v1);
}

HIDReport::HIDReportDescriptor::ItemTag_optional sub_1001F1490(Swift::UInt8 *a1)
{
  return HIDReportDescriptor.ItemTag.init(rawValue:)(*a1);
}

uint64_t sub_1001F1498@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = HIDReportDescriptor.ItemTag.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1001F14C0(uint64_t a1, unint64_t a2)
{
  char v4;

  sub_10002517C(a1, a2);
  v4 = Data.subscript.getter(0, a1, a2);
  sub_100022AEC(a1, a2);
  return qword_10022FB20[v4 & 3];
}

uint64_t sub_1001F151C(unsigned __int8 a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  char v5;
  char v7;

  v7 = 13;
  sub_1001F18A8((uint64_t)&v7, a1);
  v2 = v1;
  v4 = v3;
  v5 = Data.subscript.getter(0, v1, v3);
  sub_100022AEC(v2, v4);
  return qword_10022FB20[v5 & 3];
}

void HIDReportDescriptorItemProtocol.bSize.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (*(uint64_t (**)(void))(a2 + 40))();
  v4 = v3;
  Data.subscript.getter(0, v2, v3);
  sub_100022AEC(v2, v4);
  sub_10000B350();
}

HIDReport::HIDReportDescriptor::ItemTag_optional sub_1001F15EC@<W0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  unsigned __int8 v6;
  HIDReport::HIDReportDescriptor::ItemTag_optional result;
  char v8;

  sub_10002517C(a1, a2);
  v6 = Data.subscript.getter(0, a1, a2);
  sub_100022AEC(a1, a2);
  result.value = HIDReportDescriptor.ItemTag.init(rawValue:)(v6 >> 2).value;
  if (v8 == 27)
    __break(1u);
  else
    *a3 = byte_10022FB40[v8];
  return result;
}

HIDReport::HIDReportDescriptor::ItemTag_optional sub_1001F1670@<W0>(unsigned __int8 a1@<W0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unsigned __int8 v7;
  HIDReport::HIDReportDescriptor::ItemTag_optional result;
  char v9;
  char v10;

  v9 = 13;
  sub_1001F18A8((uint64_t)&v9, a1);
  v4 = v3;
  v6 = v5;
  v7 = Data.subscript.getter(0, v3, v5);
  sub_100022AEC(v4, v6);
  result.value = HIDReportDescriptor.ItemTag.init(rawValue:)(v7 >> 2).value;
  if (v10 == 27)
    __break(1u);
  else
    *a2 = byte_10022FB40[v10];
  return result;
}

void HIDReportDescriptorItemProtocol.bType.getter(uint64_t a1@<X1>, _BYTE *a2@<X8>)
{
  uint64_t v3;

  (*(void (**)(uint64_t *__return_ptr))(a1 + 32))(&v3);
  *a2 = byte_10022FB40[(char)v3];
  sub_1001F2D8C();
}

void sub_1001F1744(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  unsigned __int8 v6;
  char v7;

  sub_10002517C(a1, a2);
  v6 = Data.subscript.getter(0, a1, a2);
  sub_100022AEC(a1, a2);
  HIDReportDescriptor.ItemTag.init(rawValue:)(v6 >> 2);
  if (v7 == 27)
  {
    __break(1u);
  }
  else
  {
    *a3 = v7;
    sub_100026914();
  }
}

HIDReport::HIDReportDescriptor::ItemTag_optional sub_1001F17B0@<W0>(unsigned __int8 a1@<W0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unsigned __int8 v7;
  HIDReport::HIDReportDescriptor::ItemTag_optional result;
  char v9;
  char v10;

  v9 = 13;
  sub_1001F18A8((uint64_t)&v9, a1);
  v4 = v3;
  v6 = v5;
  v7 = Data.subscript.getter(0, v3, v5);
  sub_100022AEC(v4, v6);
  result.value = HIDReportDescriptor.ItemTag.init(rawValue:)(v7 >> 2).value;
  if (v10 == 27)
    __break(1u);
  else
    *a2 = v10;
  return result;
}

void HIDReportDescriptorItemProtocol.bTag.getter(uint64_t a1@<X1>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unsigned __int8 v6;
  char v7;

  v3 = (*(uint64_t (**)(void))(a1 + 40))();
  v5 = v4;
  v6 = Data.subscript.getter(0, v3, v4);
  sub_100022AEC(v3, v5);
  HIDReportDescriptor.ItemTag.init(rawValue:)(v6 >> 2);
  if (v7 == 27)
  {
    __break(1u);
  }
  else
  {
    *a2 = v7;
    sub_100026914();
  }
}

void sub_1001F18A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  if (a2 == (int)a2)
  {
    v3 = sub_1000055B0((uint64_t *)&unk_1002A8E50);
    v4 = sub_1001F2DEC(v3);
    sub_1001F2DE0(v4, (__n128)xmmword_10021BBA0);
    v6 = v5 >> 62;
    if (a2 >> 8 == a2 >> 7)
      __asm { BR              X11 }
    if (a2 >> 15 == a2 >> 16)
      __asm { BR              X11 }
    __asm { BR              X11 }
  }
  __break(1u);
  JUMPOUT(0x1001F1ACCLL);
}

void sub_1001F1B3C(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  if (!HIDWORD(a2))
  {
    v3 = sub_1000055B0((uint64_t *)&unk_1002A8E50);
    v4 = sub_1001F2DEC(v3);
    sub_1001F2DE0(v4, (__n128)xmmword_10021BBA0);
    v6 = v5 >> 62;
    if (a2 <= 0xFF)
      __asm { BR              X11 }
    if (!(a2 >> 16))
      __asm { BR              X11 }
    __asm { BR              X11 }
  }
  __break(1u);
  JUMPOUT(0x1001F1D44);
}

HIDReport::Input::Bit0_optional __swiftcall Input.Bit0.init(rawValue:)(Swift::UInt8 rawValue)
{
  _BYTE *v1;
  HIDReport::Input::Bit0_optional result;

  sub_1001F2DBC(v1);
  return result;
}

void sub_1001F1DD0()
{
  sub_1001F119C();
}

void sub_1001F1DE8(uint64_t a1)
{
  char *v1;

  sub_1001F11D8(a1, *v1);
}

void sub_1001F1DF0(uint64_t a1)
{
  sub_1001F12E4(a1);
}

HIDReport::Input::Bit0_optional sub_1001F1E08(Swift::UInt8 *a1)
{
  return Input.Bit0.init(rawValue:)(*a1);
}

void Input.init(_:_:_:_:_:_:_:_:)(unsigned __int8 *a1@<X0>, _BYTE *a2@<X1>, _BYTE *a3@<X2>, _BYTE *a4@<X3>, _BYTE *a5@<X4>, _BYTE *a6@<X5>, _BYTE *a7@<X6>, _QWORD *a8@<X8>)
{
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

  v9 = 2;
  if (!*a2)
    v9 = 0;
  v10 = v9 | *a1;
  v11 = 4;
  if (!*a3)
    v11 = 0;
  v12 = 8;
  if (!*a4)
    v12 = 0;
  v13 = v10 | v11 | v12;
  v14 = 16;
  if (!*a5)
    v14 = 0;
  v15 = 32;
  if (!*a6)
    v15 = 0;
  v16 = v14 | v15;
  v17 = 64;
  if (!*a7)
    v17 = 0;
  v20 = 0;
  sub_1001F18A8((uint64_t)&v20, v13 | v16 | v17);
  *a8 = v18;
  a8[1] = v19;
  sub_1001F2D8C();
}

uint64_t sub_1001F1EB8()
{
  uint64_t v0;

  return sub_1001F14C0(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
}

HIDReport::HIDReportDescriptor::ItemTag_optional sub_1001F1EC0@<W0>(_BYTE *a1@<X8>)
{
  uint64_t v1;

  return sub_1001F15EC(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), a1);
}

uint64_t sub_1001F1ECC(uint64_t (*a1)(void))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD v11[2];

  LOBYTE(v11[0]) = 3;
  sub_1001F18A8((uint64_t)v11, 0);
  v11[0] = v2;
  v11[1] = v3;
  v4 = a1();
  v6 = v5;
  Data.append(_:)(v4, v5);
  sub_100022AEC(v4, v6);
  v7 = sub_1001F0FE8((uint64_t)&off_100293800);
  v9 = v8;
  Data.append(_:)(v7, v8);
  sub_100022AEC(v7, v9);
  return v11[0];
}

uint64_t sub_1001F1F60(uint64_t (*a1)(void))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD v11[2];

  LOBYTE(v11[0]) = 3;
  sub_1001F18A8((uint64_t)v11, 1);
  v11[0] = v2;
  v11[1] = v3;
  v4 = a1();
  v6 = v5;
  Data.append(_:)(v4, v5);
  sub_100022AEC(v4, v6);
  v7 = sub_1001F0FE8((uint64_t)&off_100293828);
  v9 = v8;
  Data.append(_:)(v7, v8);
  sub_100022AEC(v7, v9);
  return v11[0];
}

uint64_t sub_1001F1FF4(uint64_t (*a1)(void))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD v11[2];

  LOBYTE(v11[0]) = 3;
  sub_1001F18A8((uint64_t)v11, 2);
  v11[0] = v2;
  v11[1] = v3;
  v4 = a1();
  v6 = v5;
  Data.append(_:)(v4, v5);
  sub_100022AEC(v4, v6);
  v7 = sub_1001F0FE8((uint64_t)&off_100293850);
  v9 = v8;
  Data.append(_:)(v7, v8);
  sub_100022AEC(v7, v9);
  return v11[0];
}

void PhysicalCollection.init(content:)(_QWORD *a1@<X8>)
{
  sub_1001F20AC((uint64_t (*)(void))sub_1001F1ECC, a1);
}

void ApplicationCollection.init(content:)(_QWORD *a1@<X8>)
{
  sub_1001F20AC((uint64_t (*)(void))sub_1001F1F60, a1);
}

void LogicalCollection.init(content:)(_QWORD *a1@<X8>)
{
  sub_1001F20AC((uint64_t (*)(void))sub_1001F1FF4, a1);
}

void sub_1001F20AC(uint64_t (*a1)(void)@<X2>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  *a2 = a1();
  a2[1] = v3;
  sub_1000050D4();
}

void UsagePage.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1001F22A8(a1, 5, (uint64_t (*)(char *, uint64_t))sub_1001F1B3C, a4, a5, a6, a7, a8);
}

{
  sub_1001F22D8(a1, 5, (uint64_t (*)(char *, uint64_t))sub_1001F1B3C, a4, a5, a6, a7, a8);
}

void LogicalMinimum.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1001F22A8(a1, 6, (uint64_t (*)(char *, uint64_t))sub_1001F18A8, a4, a5, a6, a7, a8);
}

void LogicalMaximum.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1001F22A8(a1, 7, (uint64_t (*)(char *, uint64_t))sub_1001F18A8, a4, a5, a6, a7, a8);
}

void PhysicalMinimum.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1001F22A8(a1, 8, (uint64_t (*)(char *, uint64_t))sub_1001F18A8, a4, a5, a6, a7, a8);
}

void PhysicalMaximum.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1001F22A8(a1, 9, (uint64_t (*)(char *, uint64_t))sub_1001F18A8, a4, a5, a6, a7, a8);
}

void UnitExponent.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1001F22A8(a1, 10, (uint64_t (*)(char *, uint64_t))sub_1001F18A8, a4, a5, a6, a7, a8);
}

void Unit.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1001F22A8(a1, 11, (uint64_t (*)(char *, uint64_t))sub_1001F18A8, a4, a5, a6, a7, a8);
}

uint64_t ReportID.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  dispatch thunk of RawRepresentable.rawValue.getter(&v6, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  return v6;
}

void ReportID.data.getter(unsigned __int8 a1)
{
  char v1;

  v1 = 13;
  sub_1001F18A8((uint64_t)&v1, a1);
}

uint64_t sub_1001F21C8()
{
  unsigned __int8 *v0;

  return sub_1001F151C(*v0);
}

HIDReport::HIDReportDescriptor::ItemTag_optional sub_1001F21D0@<W0>(_BYTE *a1@<X8>)
{
  unsigned __int8 *v1;

  return sub_1001F1670(*v1, a1);
}

HIDReport::HIDReportDescriptor::ItemTag_optional sub_1001F21D8@<W0>(_BYTE *a1@<X8>)
{
  unsigned __int8 *v1;

  return sub_1001F17B0(*v1, a1);
}

void sub_1001F21E0()
{
  unsigned __int8 *v0;

  ReportID.data.getter(*v0);
}

void ReportCount.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1001F22D8(a1, 14, (uint64_t (*)(char *, uint64_t))sub_1001F18A8, a4, a5, a6, a7, a8);
}

{
  sub_1001F22A8(a1, 14, (uint64_t (*)(char *, uint64_t))sub_1001F18A8, a4, a5, a6, a7, a8);
}

void Push.init()(uint64_t *a1@<X8>)
{
  HIDReportDescriptor.init(bytes:)((uint64_t)&off_100293878, a1);
}

void Pop.init()(uint64_t *a1@<X8>)
{
  HIDReportDescriptor.init(bytes:)((uint64_t)&off_1002938A0, a1);
}

void ReportSize.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1001F22A8(a1, 12, (uint64_t (*)(char *, uint64_t))sub_1001F1B3C, a4, a5, a6, a7, a8);
}

void sub_1001F2230(_BYTE *a1@<X8>)
{
  uint64_t v1;

  sub_1001F1744(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), a1);
}

void Usage.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1001F22A8(a1, 17, (uint64_t (*)(char *, uint64_t))sub_1001F1B3C, a4, a5, a6, a7, a8);
}

{
  sub_1001F22D8(a1, 17, (uint64_t (*)(char *, uint64_t))sub_1001F1B3C, a4, a5, a6, a7, a8);
}

void Usage.init(_:)(unsigned __int8 a1@<W0>, _QWORD *a2@<X8>)
{
  sub_1001F2308(a1, 17, a2);
}

void UsageMinimum.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1001F22A8(a1, 18, (uint64_t (*)(char *, uint64_t))sub_1001F1B3C, a4, a5, a6, a7, a8);
}

{
  sub_1001F22D8(a1, 18, (uint64_t (*)(char *, uint64_t))sub_1001F1B3C, a4, a5, a6, a7, a8);
}

void UsageMinimum.init(_:)(unsigned __int8 a1@<W0>, _QWORD *a2@<X8>)
{
  sub_1001F2308(a1, 18, a2);
}

void UsageMaximum.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1001F22A8(a1, 19, (uint64_t (*)(char *, uint64_t))sub_1001F1B3C, a4, a5, a6, a7, a8);
}

{
  sub_1001F22D8(a1, 19, (uint64_t (*)(char *, uint64_t))sub_1001F1B3C, a4, a5, a6, a7, a8);
}

void sub_1001F22A8(uint64_t a1, char a2, uint64_t (*a3)(char *, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *v8 = sub_1001F2D98(a1, a2, a3, a4, a5, a6, a7, a8, v10, v11, SWORD2(v11), SBYTE6(v11), SHIBYTE(v11));
  v8[1] = v9;
  sub_1001F2D8C();
}

void sub_1001F22D8(uint64_t a1, char a2, uint64_t (*a3)(char *, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    *v8 = sub_1001F2D98(a1, a2, a3, a4, a5, a6, a7, a8, v10, v11, SWORD2(v11), SBYTE6(v11), SHIBYTE(v11));
    v8[1] = v9;
    sub_1001F2D8C();
  }
}

void UsageMaximum.init(_:)(unsigned __int8 a1@<W0>, _QWORD *a2@<X8>)
{
  sub_1001F2308(a1, 19, a2);
}

void sub_1001F2308(unsigned __int8 a1@<W0>, char a2@<W1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char v6;

  v6 = a2;
  sub_1001F1B3C((uint64_t)&v6, a1);
  *a3 = v4;
  a3[1] = v5;
  sub_1001F2D8C();
}

void HIDReportDescriptor.init(content:)(uint64_t (*a1)(void)@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  *a2 = a1();
  a2[1] = v3;
  sub_1000050D4();
}

uint64_t static HIDReportDescriptor.Builder.buildBlock(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t result;
  __int128 v13[2];
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD v17[3];
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[5];
  __int128 v21;

  v21 = xmmword_1002236F0;
  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = a1 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_1000445C0(v2, (uint64_t)v20);
      sub_1000445C0((uint64_t)v20, (uint64_t)&v15);
      v3 = sub_1000055B0(&qword_1002B6440);
      v4 = sub_1000055B0(&qword_1002B6448);
      if (swift_dynamicCast(v13, &v15, v3, v4, 6))
      {
        sub_100025A50(v13, (uint64_t)v17);
        v5 = v18;
        v6 = v19;
        sub_10000DBE4(v17, v18);
        v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 40))(v5, v6);
        Data.append(_:)(v7, v8);
        sub_1000C2778();
        sub_100005988(v20);
        v9 = v17;
      }
      else
      {
        v14 = 0;
        memset(v13, 0, sizeof(v13));
        sub_1001F2550((uint64_t)v13);
        sub_1000445C0((uint64_t)v20, (uint64_t)v17);
        if (!swift_dynamicCast(&v15, v17, v3, &type metadata for HIDReportDescriptor, 6))
        {
          result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000022, 0x800000010025A850, "HIDReport/HIDReportDescriptor.swift", 35, 2, 492, 0);
          __break(1u);
          return result;
        }
        v10 = v15;
        v11 = v16;
        sub_10002517C(v15, v16);
        Data.append(_:)(v10, v11);
        sub_1000C2778();
        sub_1000C2778();
        v9 = v20;
      }
      sub_100005988(v9);
      v2 += 40;
      if (!--v1)
      {
        swift_bridgeObjectRelease();
        return v21;
      }
    }
  }
  return 0;
}

uint64_t sub_1001F2550(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000055B0(&qword_1002B6450);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1001F2594()
{
  unint64_t result;

  result = qword_1002B6458;
  if (!qword_1002B6458)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDReportDescriptor.ItemType, &type metadata for HIDReportDescriptor.ItemType);
    atomic_store(result, (unint64_t *)&qword_1002B6458);
  }
  return result;
}

unint64_t sub_1001F25D4()
{
  unint64_t result;

  result = qword_1002B6460;
  if (!qword_1002B6460)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDReportDescriptor.ItemTag, &type metadata for HIDReportDescriptor.ItemTag);
    atomic_store(result, (unint64_t *)&qword_1002B6460);
  }
  return result;
}

unint64_t sub_1001F2614()
{
  unint64_t result;

  result = qword_1002B6468;
  if (!qword_1002B6468)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Input.Bit0, &type metadata for Input.Bit0);
    atomic_store(result, (unint64_t *)&qword_1002B6468);
  }
  return result;
}

unint64_t sub_1001F2654()
{
  unint64_t result;

  result = qword_1002B6470;
  if (!qword_1002B6470)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Input.Bit1, &type metadata for Input.Bit1);
    atomic_store(result, (unint64_t *)&qword_1002B6470);
  }
  return result;
}

unint64_t sub_1001F2694()
{
  unint64_t result;

  result = qword_1002B6478;
  if (!qword_1002B6478)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Input.Bit2, &type metadata for Input.Bit2);
    atomic_store(result, (unint64_t *)&qword_1002B6478);
  }
  return result;
}

unint64_t sub_1001F26D4()
{
  unint64_t result;

  result = qword_1002B6480;
  if (!qword_1002B6480)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Input.Bit3, &type metadata for Input.Bit3);
    atomic_store(result, (unint64_t *)&qword_1002B6480);
  }
  return result;
}

unint64_t sub_1001F2714()
{
  unint64_t result;

  result = qword_1002B6488;
  if (!qword_1002B6488)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Input.Bit4, &type metadata for Input.Bit4);
    atomic_store(result, (unint64_t *)&qword_1002B6488);
  }
  return result;
}

unint64_t sub_1001F2754()
{
  unint64_t result;

  result = qword_1002B6490;
  if (!qword_1002B6490)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Input.Bit5, &type metadata for Input.Bit5);
    atomic_store(result, (unint64_t *)&qword_1002B6490);
  }
  return result;
}

unint64_t sub_1001F2794()
{
  unint64_t result;

  result = qword_1002B6498;
  if (!qword_1002B6498)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Input.Bit6, &type metadata for Input.Bit6);
    atomic_store(result, (unint64_t *)&qword_1002B6498);
  }
  return result;
}

unint64_t sub_1001F27D4()
{
  unint64_t result;

  result = qword_1002B64A0;
  if (!qword_1002B64A0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Input.Bit8, &type metadata for Input.Bit8);
    atomic_store(result, (unint64_t *)&qword_1002B64A0);
  }
  return result;
}

void type metadata accessor for HIDReportDescriptor()
{
  sub_10003B1DC();
}

uint64_t storeEnumTagSinglePayload for HIDReportDescriptor.ItemType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1001F286C + 4 * byte_10022EE85[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1001F28A0 + 4 * byte_10022EE80[v4]))();
}

uint64_t sub_1001F28A0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001F28A8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1001F28B0);
  return result;
}

uint64_t sub_1001F28BC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1001F28C4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1001F28C8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001F28D0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for HIDReportDescriptor.ItemType()
{
  sub_10003B1DC();
}

uint64_t getEnumTagSinglePayload for HIDReportDescriptor.ItemTag(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xE6)
  {
    if (a2 + 26 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 26) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 27;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x1B;
  v5 = v6 - 27;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDReportDescriptor.ItemTag(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 26 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 26) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE5)
    return ((uint64_t (*)(void))((char *)&loc_1001F29BC + 4 * byte_10022EE8F[v4]))();
  *a1 = a2 + 26;
  return ((uint64_t (*)(void))((char *)sub_1001F29F0 + 4 * byte_10022EE8A[v4]))();
}

uint64_t sub_1001F29F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001F29F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1001F2A00);
  return result;
}

uint64_t sub_1001F2A0C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1001F2A14);
  *(_BYTE *)result = a2 + 26;
  return result;
}

uint64_t sub_1001F2A18(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001F2A20(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for HIDReportDescriptor.ItemTag()
{
  sub_10003B1DC();
}

uint64_t dispatch thunk of HIDReportDescriptorItemProtocol.data.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

void type metadata accessor for Input()
{
  sub_10003B1DC();
}

void type metadata accessor for Input.Bit0()
{
  sub_10003B1DC();
}

void type metadata accessor for Input.Bit1()
{
  sub_10003B1DC();
}

void type metadata accessor for Input.Bit2()
{
  sub_10003B1DC();
}

void type metadata accessor for Input.Bit3()
{
  sub_10003B1DC();
}

void type metadata accessor for Input.Bit4()
{
  sub_10003B1DC();
}

void type metadata accessor for Input.Bit5()
{
  sub_10003B1DC();
}

void type metadata accessor for Input.Bit6()
{
  sub_10003B1DC();
}

uint64_t _s9HIDReport5InputV4Bit0Owst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1001F2AF4 + 4 * byte_10022EE99[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1001F2B28 + 4 * byte_10022EE94[v4]))();
}

uint64_t sub_1001F2B28(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001F2B30(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1001F2B38);
  return result;
}

uint64_t sub_1001F2B44(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1001F2B4CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1001F2B50(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1001F2B58(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for Input.Bit8()
{
  sub_10003B1DC();
}

void type metadata accessor for PhysicalCollection()
{
  sub_10003B1DC();
}

void type metadata accessor for ApplicationCollection()
{
  sub_10003B1DC();
}

void type metadata accessor for LogicalCollection()
{
  sub_10003B1DC();
}

void type metadata accessor for UsagePage()
{
  sub_10003B1DC();
}

void type metadata accessor for LogicalMinimum()
{
  sub_10003B1DC();
}

void type metadata accessor for LogicalMaximum()
{
  sub_10003B1DC();
}

void type metadata accessor for PhysicalMinimum()
{
  sub_10003B1DC();
}

void type metadata accessor for PhysicalMaximum()
{
  sub_10003B1DC();
}

void type metadata accessor for UnitExponent()
{
  sub_10003B1DC();
}

void type metadata accessor for Unit()
{
  sub_10003B1DC();
}

void type metadata accessor for ReportID()
{
  sub_10003B1DC();
}

void type metadata accessor for ReportCount()
{
  sub_10003B1DC();
}

void type metadata accessor for Push()
{
  sub_10003B1DC();
}

void type metadata accessor for Pop()
{
  sub_10003B1DC();
}

void type metadata accessor for ReportSize()
{
  sub_10003B1DC();
}

void type metadata accessor for Usage()
{
  sub_10003B1DC();
}

void type metadata accessor for UsageMinimum()
{
  sub_10003B1DC();
}

void _s9HIDReport19HIDReportDescriptorVwca_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = *a2;
  v4 = a2[1];
  sub_10002517C(*a2, v4);
  v5 = *a1;
  v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_100022AEC(v5, v6);
  sub_10000B350();
}

void type metadata accessor for UsageMaximum()
{
  sub_10003B1DC();
}

void type metadata accessor for HIDReportDescriptor.Builder()
{
  sub_10003B1DC();
}

uint64_t sub_1001F2C90(char a1, uint64_t a2)
{
  char v5;
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;

  v7 = sub_1000055B0(&qword_1002B64A8);
  v8 = sub_10003A0A8(&qword_1002B64B0, &qword_1002B64A8, (uint64_t)&protocol conformance descriptor for <A> CollectionOfOne<A>);
  LOBYTE(v6[0]) = a1;
  v5 = *(_BYTE *)sub_10000DBE4(v6, v7);
  Data._Representation.replaceSubrange(_:with:count:)(a2, a2, &v5, 1);
  return sub_100005988(v6);
}

uint64_t sub_1001F2D98(uint64_t a1, char a2, uint64_t (*a3)(char *, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  a13 = a2;
  return a3(&a13, a1);
}

uint64_t sub_1001F2DB0(uint64_t a1, uint64_t a2)
{
  char v2;

  return sub_1001F2C90(v2, a2);
}

void sub_1001F2DBC(_BYTE *a1@<X8>)
{
  char v1;

  *a1 = v1;
}

uint64_t sub_1001F2DC4(int a1)
{
  unsigned int v1;

  return Data._Representation.subscript.setter(a1 | v1, 0);
}

uint64_t sub_1001F2DD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return Data.subscript.getter(0, a9, a10);
}

uint64_t sub_1001F2DE0(uint64_t a1, __n128 a2)
{
  char v2;

  *(__n128 *)(a1 + 16) = a2;
  *(_BYTE *)(a1 + 32) = v2;
  return sub_1001F0FE8(a1);
}

uint64_t sub_1001F2DEC(uint64_t a1)
{
  return swift_allocObject(a1, 33, 7);
}

uint64_t sub_1001F2DF8(uint64_t a1, uint64_t a2)
{
  __int16 v2;

  return sub_1001F2C90(SHIBYTE(v2), a2);
}

_UNKNOWN **static HIDScrollMomentum.allCases.getter()
{
  return &off_1002952F8;
}

HIDUtils::HIDScrollMomentum __swiftcall HIDScrollMomentum.init(rawValue:)(Swift::Int rawValue)
{
  const char *v1;
  uint64_t v2;

  if (rawValue < 0)
  {
    sub_10006D098();
    v1 = "Negative value is not representable";
    v2 = 35;
  }
  else
  {
    if ((unint64_t)rawValue < 0x100)
      return (HIDUtils::HIDScrollMomentum)rawValue;
    sub_10006D098();
    v1 = "Not enough bits to represent the passed value";
    v2 = 45;
  }
  LOBYTE(rawValue) = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v1, v2, 2, "Swift/Integers.swift", 20);
  __break(1u);
  return (HIDUtils::HIDScrollMomentum)rawValue;
}

void sub_1001F2EA0(_QWORD *a1@<X8>)
{
  *a1 = &off_1002952F8;
}

uint64_t sub_1001F2EB0(unsigned __int8 *a1)
{
  return sub_1001F7F18(*a1);
}

uint64_t sub_1001F2EB8(unsigned __int8 *a1)
{
  return sub_1001F7E9C(*a1);
}

uint64_t sub_1001F2EC0(unsigned __int8 *a1)
{
  return sub_1001F7F20(*a1);
}

uint64_t sub_1001F2EC8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_100214904();
  *a1 = result;
  return result;
}

uint64_t HIDScrollMomentum.description.getter(char a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  char v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;

  if ((a1 & 2) != 0)
  {
    sub_1001F37E0(0, 1, 1);
    sub_1001F3EF0();
    if (v10)
      sub_1001F3EA8(v9);
    _swiftEmptyArrayStorage[2] = v1;
    *((_BYTE *)&_swiftEmptyArrayStorage[4] + v2) = 2;
    if ((a1 & 1) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((a1 & 1) == 0)
  {
    goto LABEL_3;
  }
  if ((sub_1001888A8() & 1) == 0)
    sub_1001F3EC0();
  sub_1001F3EF0();
  if (v10)
    sub_1001F3EA8(v11);
  _swiftEmptyArrayStorage[2] = v1;
  *((_BYTE *)&_swiftEmptyArrayStorage[4] + v2) = 1;
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_15:
  if ((sub_1001888A8() & 1) == 0)
    sub_1001F3EC0();
  sub_1001F3EF0();
  if (v10)
    sub_1001F3EA8(v12);
  _swiftEmptyArrayStorage[2] = v1;
  *((_BYTE *)&_swiftEmptyArrayStorage[4] + v2) = 4;
  if ((a1 & 0x10) == 0)
  {
LABEL_5:
    v4 = _swiftEmptyArrayStorage[2];
    if (!v4)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_20:
  if ((sub_1001888A8() & 1) == 0)
    sub_1001F3EC0();
  v14 = _swiftEmptyArrayStorage[2];
  v13 = _swiftEmptyArrayStorage[3];
  v4 = v14 + 1;
  if (v14 >= v13 >> 1)
    sub_1001F3EA8(v13);
  _swiftEmptyArrayStorage[2] = v4;
  *((_BYTE *)&_swiftEmptyArrayStorage[4] + v14) = 16;
LABEL_25:
  sub_100058678();
  v15 = 0;
  do
  {
    if ((*((_BYTE *)&_swiftEmptyArrayStorage[4] + v15) & 2) != 0)
    {
      v18 = 0xE500000000000000;
      v16 = 0x7472617473;
    }
    else if ((*((_BYTE *)&_swiftEmptyArrayStorage[4] + v15) & 1) != 0)
    {
      v18 = 0xE800000000000000;
      v16 = 0x65756E69746E6F63;
    }
    else if ((*((_BYTE *)&_swiftEmptyArrayStorage[4] + v15) & 4) != 0)
    {
      v18 = 0xE300000000000000;
      v16 = 6581861;
    }
    else if ((*((_BYTE *)&_swiftEmptyArrayStorage[4] + v15) & 0x10) != 0)
    {
      v18 = 0xEB00000000646574;
      v16 = 0x7075727265746E69;
    }
    else
    {
      v16 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for UInt8, &protocol witness table for UInt8);
      v18 = v17;
    }
    v19 = _swiftEmptyArrayStorage[2];
    if (v19 >= _swiftEmptyArrayStorage[3] >> 1)
      sub_100058678();
    ++v15;
    _swiftEmptyArrayStorage[2] = v19 + 1;
    v20 = &_swiftEmptyArrayStorage[2 * v19];
    v20[4] = v16;
    v20[5] = v18;
  }
  while (v4 != v15);
LABEL_6:
  sub_10002645C();
  v5 = sub_1000055B0((uint64_t *)&unk_1002AC160);
  v6 = sub_10003A0A8((unint64_t *)&qword_1002AB150, (uint64_t *)&unk_1002AC160, (uint64_t)&protocol conformance descriptor for [A]);
  v7 = BidirectionalCollection<>.joined(separator:)(44, 0xE100000000000000, v5, v6);
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_1001F31C0()
{
  char *v0;

  return HIDScrollMomentum.description.getter(*v0);
}

char *sub_1001F31C8(char *__src, size_t __len, char *__dst)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;

  if ((__len & 0x8000000000000000) != 0)
  {
    sub_10006D098();
    __src = (char *)sub_10007950C((uint64_t)"Fatal error", v4, v5, (uint64_t)"UnsafeMutablePointer.moveInitialize with negative count", v6, v7, (uint64_t)"Swift/UnsafePointer.swift", v8, v9, v10, v11);
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

char *sub_1001F3228(char *result, uint64_t a2, char *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;

  if (a2 < 0)
  {
    sub_10006D098();
    result = (char *)sub_10007950C((uint64_t)"Fatal error", v4, v5, (uint64_t)"UnsafeMutablePointer.moveInitialize with negative count", v6, v7, (uint64_t)"Swift/UnsafePointer.swift", v8, v9, v10, v11);
    __break(1u);
  }
  else if (a3 != result || &result[4 * a2] <= a3)
  {
    return (char *)sub_1000794FC(a3, result);
  }
  return result;
}

char *sub_1001F3280(char *result, uint64_t a2, char *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;

  if (a2 < 0)
  {
    sub_10006D098();
    result = (char *)sub_10007950C((uint64_t)"Fatal error", v4, v5, (uint64_t)"UnsafeMutablePointer.moveInitialize with negative count", v6, v7, (uint64_t)"Swift/UnsafePointer.swift", v8, v9, v10, v11);
    __break(1u);
  }
  else if (a3 != result || &result[144 * a2] <= a3)
  {
    return (char *)sub_1000794FC(a3, result);
  }
  return result;
}

uint64_t sub_1001F32DC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  char v8;

  if (a2 < 0)
  {
    v8 = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v8, 1046, 0);
    __break(1u);
  }
  else if (a3 < a1
         || (result = type metadata accessor for PropertyListNode(0),
             a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    v7 = type metadata accessor for PropertyListNode(0);
    return swift_arrayInitWithTakeFrontToBack(a3, a1, a2, v7);
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront(a3, a1, a2, result);
  }
  return result;
}

void *sub_1001F33D8(char *a1, size_t a2, char *a3)
{
  void *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;

  if ((a2 & 0x8000000000000000) != 0)
  {
    sub_10006D098();
    sub_10006D0F8();
  }
  else
  {
    if (&a3[a2] <= a1 || &a1[a2] <= a3)
      return sub_10006D250(a3, a1, a2);
    sub_10006D098();
    sub_10006D0E8();
  }
  result = (void *)sub_10006D0DC(v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
  __break(1u);
  return result;
}

void *sub_1001F3468(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  const void *v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  BOOL v8;
  void *result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;

  if (a2 < 0)
  {
    sub_10006D098();
    sub_10006D0F8();
  }
  else
  {
    sub_1001F3ED8();
    if (!v8 && v7)
    {
      v7 = v6 >= v3;
      v8 = v6 == v3;
    }
    else
    {
      v7 = 0;
      v8 = 0;
    }
    if (v8 || !v7)
      return sub_10006D250(v5, v4, 4 * v2);
    sub_10006D098();
    sub_10006D0E8();
  }
  result = (void *)sub_10006D0DC(v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20);
  __break(1u);
  return result;
}

uint64_t sub_1001F34EC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
  }
  else
  {
    if (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3)
      return swift_arrayInitWithCopy(a3, a1);
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  }
  __break(1u);
  return result;
}

void *sub_1001F35B8(char *__src, uint64_t a2, char *__dst)
{
  void *result;

  if (a2 < 0)
  {
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
  }
  else
  {
    if (&__dst[16 * a2] <= __src || &__src[16 * a2] <= __dst)
      return memcpy(__dst, __src, 16 * a2);
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  }
  __break(1u);
  return result;
}

uint64_t sub_1001F3680(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  if (a2 < 0)
  {
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
  }
  else
  {
    v5 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for PropertyListNode(0) - 8) + 72) * a2;
    v6 = a3 + v5;
    v7 = a1 + v5;
    if (v6 <= a1 || v7 <= a3)
      return swift_arrayInitWithCopy(a3, a1);
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  }
  __break(1u);
  return result;
}

void sub_1001F3774(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_1001F3A38(a1, a2, a3, *v3, &qword_1002B6508);
  *v3 = v4;
}

void sub_1001F3798(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_1001F3A38(a1, a2, a3, *v3, &qword_1002B6520);
  *v3 = v4;
}

void sub_1001F37BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_1001F3AF0(a1, a2, a3, *v3, &qword_1002B6548);
  *v3 = v4;
}

void sub_1001F37E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_1001F3AF0(a1, a2, a3, *v3, &qword_1002B6550);
  *v3 = v4;
}

unint64_t sub_1001F3808()
{
  unint64_t result;

  result = qword_1002B64D8;
  if (!qword_1002B64D8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDScrollMomentum, &type metadata for HIDScrollMomentum);
    atomic_store(result, (unint64_t *)&qword_1002B64D8);
  }
  return result;
}

unint64_t sub_1001F3848()
{
  unint64_t result;

  result = qword_1002B64E0;
  if (!qword_1002B64E0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDScrollMomentum, &type metadata for HIDScrollMomentum);
    atomic_store(result, (unint64_t *)&qword_1002B64E0);
  }
  return result;
}

uint64_t sub_1001F3884()
{
  return sub_10003A0A8(&qword_1002B64E8, &qword_1002B64F0, (uint64_t)&protocol conformance descriptor for [A]);
}

unint64_t sub_1001F38B4()
{
  unint64_t result;

  result = qword_1002B64F8;
  if (!qword_1002B64F8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDScrollMomentum, &type metadata for HIDScrollMomentum);
    atomic_store(result, (unint64_t *)&qword_1002B64F8);
  }
  return result;
}

unint64_t sub_1001F38F4()
{
  unint64_t result;

  result = qword_1002B6500;
  if (!qword_1002B6500)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDScrollMomentum, &type metadata for HIDScrollMomentum);
    atomic_store(result, (unint64_t *)&qword_1002B6500);
  }
  return result;
}

ValueMetadata *type metadata accessor for HIDScrollMomentum()
{
  return &type metadata for HIDScrollMomentum;
}

void sub_1001F3940(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_1001F3A38(a1, a2, a3, *v3, &qword_1002B6510);
  *v3 = v4;
}

void sub_1001F3964(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_1001F3C7C(a1, a2, a3, *v3, &qword_1002B6540, (void (*)(uint64_t, uint64_t, _QWORD *))sub_100078E4C, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1001F34EC);
  *v3 = v4;
}

void sub_1001F3998(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_1001F3C7C(a1, a2, a3, *v3, &qword_1002B6538, (void (*)(uint64_t, uint64_t, _QWORD *))sub_100078E4C, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1001F35B8);
  *v3 = v4;
}

char *sub_1001F39CC(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_1001F3B9C(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

void sub_1001F39E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_1001F3C7C(a1, a2, a3, *v3, &qword_1002B6528, (void (*)(uint64_t, uint64_t, _QWORD *))sub_100078E4C, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1001F35B8);
  *v3 = v4;
}

size_t sub_1001F3A1C(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_1001F3D4C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

void sub_1001F3A38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  char v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  size_t v14;
  char *v15;

  v6 = a1;
  if ((a3 & 1) != 0)
  {
    sub_10006D0CC();
    if (v8 != v9)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      sub_10006D0BC();
    }
  }
  else
  {
    v7 = a2;
  }
  v10 = *(_QWORD *)(a4 + 16);
  if (v7 <= v10)
    v11 = *(_QWORD *)(a4 + 16);
  else
    v11 = v7;
  if (v11)
  {
    v12 = sub_10006D248(a1, a2, a3, a4, a5);
    v13 = (char *)sub_1000088D8(v12, 4 * v11 + 32);
    v14 = j__malloc_size(v13);
    *((_QWORD *)v13 + 2) = v10;
    *((_QWORD *)v13 + 3) = 2 * ((uint64_t)(v14 - 32) / 4);
  }
  else
  {
    v13 = (char *)_swiftEmptyArrayStorage;
  }
  v15 = (char *)(a4 + 32);
  if ((v6 & 1) != 0)
  {
    sub_1001F3228(v15, v10, v13 + 32);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1001F3468((uint64_t)v15, v10);
  }
  sub_10002645C();
  sub_10000B350();
}

void sub_1001F3AF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  char v6;
  int64_t v7;
  char v8;
  char v9;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  size_t v14;
  char *v15;
  char *v16;

  v6 = a1;
  if ((a3 & 1) != 0)
  {
    sub_10006D0CC();
    if (v8 != v9)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      sub_10006D0BC();
    }
  }
  else
  {
    v7 = a2;
  }
  v10 = *(_QWORD *)(a4 + 16);
  if (v7 <= v10)
    v11 = *(_QWORD *)(a4 + 16);
  else
    v11 = v7;
  if (v11)
  {
    v12 = sub_10006D248(a1, a2, a3, a4, a5);
    v13 = (char *)sub_1000088D8(v12, v11 + 32);
    v14 = j__malloc_size(v13);
    *((_QWORD *)v13 + 2) = v10;
    *((_QWORD *)v13 + 3) = 2 * v14 - 64;
  }
  else
  {
    v13 = (char *)_swiftEmptyArrayStorage;
  }
  v15 = v13 + 32;
  v16 = (char *)(a4 + 32);
  if ((v6 & 1) != 0)
  {
    sub_1001F31C8(v16, v10, v15);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1001F33D8(v16, v10, v15);
  }
  sub_10002645C();
  sub_10000B350();
}

char *sub_1001F3B9C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
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
    v10 = sub_1000055B0(&qword_1002B6530);
    v11 = (char *)swift_allocObject(v10, 4 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 4);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1001F3228(v13, v8, v11 + 32);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1001F3468((uint64_t)v13, v8);
  }
  swift_release();
  return v11;
}

void sub_1001F3C7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, void (*a6)(uint64_t, uint64_t, _QWORD *), void (*a7)(uint64_t, uint64_t, _QWORD *))
{
  char v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  size_t v18;
  _QWORD *v19;
  uint64_t v20;

  v10 = a1;
  if ((a3 & 1) != 0)
  {
    sub_10006D0CC();
    if (v12 != v13)
    {
      if (v11 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      sub_10006D0BC();
    }
  }
  else
  {
    v11 = a2;
  }
  v14 = *(_QWORD *)(a4 + 16);
  if (v11 <= v14)
    v15 = *(_QWORD *)(a4 + 16);
  else
    v15 = v11;
  if (v15)
  {
    v16 = sub_10006D248(a1, a2, a3, a4, a5);
    v17 = (_QWORD *)sub_1000088D8(v16, 16 * v15 + 32);
    v18 = j__malloc_size(v17);
    v17[2] = v14;
    v17[3] = 2 * ((uint64_t)(v18 - 32) / 16);
  }
  else
  {
    v17 = _swiftEmptyArrayStorage;
  }
  v19 = v17 + 4;
  v20 = a4 + 32;
  if ((v10 & 1) != 0)
  {
    a6(v20, v14, v19);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    a7(v20, v14, v19);
  }
  sub_10002645C();
}

size_t sub_1001F3D4C(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;

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
    v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_1000055B0(&qword_1002B6518);
  v11 = *(_QWORD *)(type metadata accessor for PropertyListNode(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  result = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v14 == 0x8000000000000000 && v12 == -1)
    goto LABEL_24;
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(result - v14) / v12);
LABEL_19:
  v17 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PropertyListNode(0) - 8) + 80);
  v18 = (v17 + 32) & ~v17;
  v19 = (unint64_t)v15 + v18;
  v20 = a4 + v18;
  if ((v5 & 1) != 0)
  {
    sub_1001F32DC(v20, v8, v19);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1001F3680(v20, v8, v19);
  }
  swift_release();
  return (size_t)v15;
}

void type metadata accessor for CFNumber(uint64_t a1)
{
  sub_100025B50(a1, &qword_1002B6558, (uint64_t)&unk_1002956D0);
}

void sub_1001F3EA8(unint64_t a1@<X8>)
{
  uint64_t v1;

  sub_1001F37E0(a1 > 1, v1, 1);
}

void sub_1001F3EC0()
{
  uint64_t v0;

  sub_1001F37E0(0, *(_QWORD *)(v0 + 16) + 1, 1);
}

id RotationEvent.init(time:point:flags:)(uint64_t a1, uint64_t a2)
{
  void *RotationEvent;
  id v3;

  RotationEvent = (void *)IOHIDEventCreateRotationEvent(0, a1, a2);
  v3 = RotationEvent;

  return v3;
}

void RotationEvent.x.getter(void *a1)
{
  IOHIDEventGetFloatValue(a1, 327680);
  sub_1001F42E8();
  sub_1001A4570();
}

void RotationEvent.x.setter(void *a1)
{
  id v1;

  v1 = sub_1001F42F0(a1);
  sub_1001F42C0((uint64_t)v1, 327680);
  sub_1001F4284(v1);
}

void RotationEvent.x.modify(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v4 = sub_1001F4290(a1, a2);
  IOHIDEventGetFloatValue(v4, 327680);
  sub_1001F42E0();
  *v2 = v3;
  sub_1001A4570();
}

void sub_1001F3FE0(uint64_t a1, uint64_t a2)
{
  sub_1001F4114(a1, a2, 327680);
}

void RotationEvent.y.getter(void *a1)
{
  sub_1001F4304((uint64_t)a1);
  sub_1001F42E8();
  sub_1001A4570();
}

void RotationEvent.y.setter(void *a1)
{
  id v1;

  v1 = sub_1001F42F0(a1);
  sub_1001F42C0((uint64_t)v1, 327681);
  sub_1001F4284(v1);
}

void RotationEvent.y.modify(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v4 = sub_1001F4290(a1, a2);
  sub_1001F4304((uint64_t)v4);
  sub_1001F42E0();
  *v2 = v3;
  sub_1001A4570();
}

void sub_1001F407C(uint64_t a1, uint64_t a2)
{
  sub_1001F42C8(a1, a2, 1u);
}

void RotationEvent.rotation.getter(void *a1)
{
  sub_1001F42B4((uint64_t)a1);
  sub_1001F42E8();
  sub_1001A4570();
}

void RotationEvent.rotation.setter(void *a1)
{
  id v1;
  void *v2;

  v1 = sub_1001F42F0(a1);
  sub_1001F42A0((uint64_t)v1);
  sub_1001F4284(v2);
}

void RotationEvent.z.modify(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v4 = sub_1001F4290(a1, a2);
  sub_1001F42B4((uint64_t)v4);
  sub_1001F42E0();
  *v2 = v3;
  sub_1001A4570();
}

void sub_1001F410C(uint64_t a1, uint64_t a2)
{
  sub_1001F42C8(a1, a2, 2u);
}

void sub_1001F4114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  v4 = sub_1001F42D0(a1);
  sub_1001F42C0((uint64_t)v4, a3);

}

uint64_t sub_1001F4154@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

id sub_1001F415C()
{
  id *v0;

  return *v0;
}

void RotationEvent.rotation.modify(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v4 = sub_1001F4290(a1, a2);
  sub_1001F42B4((uint64_t)v4);
  sub_1001F42E0();
  *v2 = v3;
  sub_1001A4570();
}

void sub_1001F419C(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = sub_1001F42D0(a1);
  sub_1001F42A0((uint64_t)v1);
  sub_1001F4284(v2);
}

void sub_1001F41C4(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v2 = (void *)sub_1001F42F8(a1);
  RotationEvent.x.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_1001F41E4(uint64_t a1, void **a2)
{
  RotationEvent.x.setter(*a2);
}

void sub_1001F41F0(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v2 = (void *)sub_1001F42F8(a1);
  RotationEvent.y.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_1001F4210(uint64_t a1, void **a2)
{
  RotationEvent.y.setter(*a2);
}

void sub_1001F421C(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v2 = (void *)sub_1001F42F8(a1);
  RotationEvent.rotation.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_1001F423C(uint64_t a1, void **a2)
{
  RotationEvent.rotation.setter(*a2);
}

void sub_1001F4248(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v2 = (void *)sub_1001F42F8(a1);
  RotationEvent.rotation.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_1001F4268(uint64_t a1, void **a2)
{
  RotationEvent.rotation.setter(*a2);
}

ValueMetadata *type metadata accessor for RotationEvent()
{
  return &type metadata for RotationEvent;
}

void sub_1001F4284(id a1)
{

}

id sub_1001F4290(uint64_t a1, id a2)
{
  *(_QWORD *)(a1 + 8) = a2;
  return a2;
}

uint64_t sub_1001F42A0(uint64_t a1)
{
  double v1;

  return IOHIDEventSetFloatValue(a1, 327682, v1);
}

uint64_t sub_1001F42B4(uint64_t a1)
{
  return IOHIDEventGetFloatValue(a1, 327682);
}

uint64_t sub_1001F42C0(uint64_t a1, uint64_t a2)
{
  double v2;

  return IOHIDEventSetFloatValue(a1, a2, v2);
}

void sub_1001F42C8(uint64_t a1, uint64_t a2, unsigned __int16 a3)
{
  sub_1001F4114(a1, a2, a3 | 0x50000u);
}

id sub_1001F42D0(uint64_t a1)
{
  return *(id *)(a1 + 8);
}

double sub_1001F42E0()
{
  void *v0;
  double result;

  return result;
}

double sub_1001F42E8()
{
  void *v0;
  double result;

  return result;
}

id sub_1001F42F0(id a1)
{
  return a1;
}

uint64_t sub_1001F42F8(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t sub_1001F4304(uint64_t a1)
{
  return IOHIDEventGetFloatValue(a1, 327681);
}

_UNKNOWN **static HIDEventPhase.allCases.getter()
{
  return &off_100295320;
}

HIDUtils::HIDEventPhase __swiftcall HIDEventPhase.init(rawValue:)(Swift::Int rawValue)
{
  uint64_t v1;
  const char *v2;
  uint64_t v3;

  if (rawValue < 0)
  {
    sub_10006D098();
    v2 = "Negative value is not representable";
    v3 = 35;
  }
  else
  {
    if ((unint64_t)rawValue < 0x100)
      return (HIDUtils::HIDEventPhase)rawValue;
    sub_10006D098();
    v2 = "Not enough bits to represent the passed value";
    v3 = 45;
  }
  LOBYTE(rawValue) = sub_1000E7388((uint64_t)"Fatal error", 11, 2, (uint64_t)v2, v3, v1, (uint64_t)"Swift/Integers.swift");
  __break(1u);
  return (HIDUtils::HIDEventPhase)rawValue;
}

HIDUtils::HIDEventPhase __swiftcall HIDEventPhase.init(_:)(Swift::UInt16 a1)
{
  uint64_t v1;

  if (a1 >= 0x100u)
  {
    sub_10006D098();
    LOBYTE(a1) = sub_1000E7388((uint64_t)"Fatal error", 11, 2, (uint64_t)"Not enough bits to represent the passed value", 45, v1, (uint64_t)"Swift/Integers.swift");
    __break(1u);
  }
  return (HIDUtils::HIDEventPhase)a1;
}

void sub_1001F43F4(_QWORD *a1@<X8>)
{
  *a1 = &off_100295320;
}

void sub_1001F4404(char *a1)
{
  sub_1001F4B28(*a1);
}

void sub_1001F440C(char *a1)
{
  sub_1001F4B40(*a1);
}

void sub_1001F4414(char *a1)
{
  sub_1001F4B58(*a1);
}

uint64_t HIDEventPhase.description.getter(unsigned __int8 a1)
{
  uint64_t v1;
  int v2;
  char *v3;
  char v4;
  int v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = 5;
  v2 = a1;
  v3 = &byte_100295340;
  do
  {
    v5 = *v3++;
    v4 = v5;
    if ((v5 & v2) != 0)
    {
      if ((swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage) & 1) == 0)
        sub_1001F37BC(0, _swiftEmptyArrayStorage[2] + 1, 1);
      v7 = _swiftEmptyArrayStorage[2];
      v6 = _swiftEmptyArrayStorage[3];
      if (v7 >= v6 >> 1)
        sub_1001F37BC(v6 > 1, v7 + 1, 1);
      _swiftEmptyArrayStorage[2] = v7 + 1;
      *((_BYTE *)&_swiftEmptyArrayStorage[4] + v7) = v4;
    }
    --v1;
  }
  while (v1);
  v8 = _swiftEmptyArrayStorage[2];
  if (v8)
  {
    sub_100058678();
    v9 = 0;
    do
    {
      if ((*((_BYTE *)&_swiftEmptyArrayStorage[4] + v9) & 1) != 0)
      {
        v12 = 0xE500000000000000;
        v10 = 0x6E61676562;
      }
      else if ((*((_BYTE *)&_swiftEmptyArrayStorage[4] + v9) & 2) != 0)
      {
        v12 = 0xE700000000000000;
        v10 = 0x6465676E616863;
      }
      else if ((*((_BYTE *)&_swiftEmptyArrayStorage[4] + v9) & 4) != 0)
      {
        v12 = 0xE500000000000000;
        v10 = 0x6465646E65;
      }
      else if ((*((_BYTE *)&_swiftEmptyArrayStorage[4] + v9) & 8) != 0)
      {
        v12 = 0xE800000000000000;
        v10 = 0x64656C65636E6163;
      }
      else if ((*((_BYTE *)&_swiftEmptyArrayStorage[4] + v9) & 0x80) != 0)
      {
        v12 = 0xE800000000000000;
        v10 = 0x6E6967654279616DLL;
      }
      else
      {
        v10 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for UInt8, &protocol witness table for UInt8);
        v12 = v11;
      }
      v13 = _swiftEmptyArrayStorage[2];
      if (v13 >= _swiftEmptyArrayStorage[3] >> 1)
        sub_100058678();
      ++v9;
      _swiftEmptyArrayStorage[2] = v13 + 1;
      v14 = &_swiftEmptyArrayStorage[2 * v13];
      v14[4] = v10;
      v14[5] = v12;
    }
    while (v8 != v9);
  }
  swift_release();
  v15 = sub_1000055B0((uint64_t *)&unk_1002AC160);
  v16 = sub_10003A0A8((unint64_t *)&qword_1002AB150, (uint64_t *)&unk_1002AC160, (uint64_t)&protocol conformance descriptor for [A]);
  v17 = BidirectionalCollection<>.joined(separator:)(44, 0xE100000000000000, v15, v16);
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_1001F46B0()
{
  unsigned __int8 *v0;

  return HIDEventPhase.description.getter(*v0);
}

unint64_t sub_1001F46BC()
{
  unint64_t result;

  result = qword_1002B6560;
  if (!qword_1002B6560)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDEventPhase, &type metadata for HIDEventPhase);
    atomic_store(result, (unint64_t *)&qword_1002B6560);
  }
  return result;
}

unint64_t sub_1001F46FC()
{
  unint64_t result;

  result = qword_1002B6568;
  if (!qword_1002B6568)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDEventPhase, &type metadata for HIDEventPhase);
    atomic_store(result, (unint64_t *)&qword_1002B6568);
  }
  return result;
}

uint64_t sub_1001F4738()
{
  return sub_10003A0A8(&qword_1002B6570, &qword_1002B6578, (uint64_t)&protocol conformance descriptor for [A]);
}

unint64_t sub_1001F4768()
{
  unint64_t result;

  result = qword_1002B6580;
  if (!qword_1002B6580)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDEventPhase, &type metadata for HIDEventPhase);
    atomic_store(result, (unint64_t *)&qword_1002B6580);
  }
  return result;
}

unint64_t sub_1001F47A8()
{
  unint64_t result;

  result = qword_1002B6588;
  if (!qword_1002B6588)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDEventPhase, &type metadata for HIDEventPhase);
    atomic_store(result, (unint64_t *)&qword_1002B6588);
  }
  return result;
}

ValueMetadata *type metadata accessor for HIDEventPhase()
{
  return &type metadata for HIDEventPhase;
}

id TranslationEvent.init(time:delta:flags:)(uint64_t a1, uint64_t a2)
{
  void *TranslationEvent;
  id v3;

  TranslationEvent = (void *)IOHIDEventCreateTranslationEvent(0, a1, a2);
  v3 = TranslationEvent;

  return v3;
}

void TranslationEvent.x.getter(void *a1)
{
  IOHIDEventGetFloatValue(a1, 0x40000);
  sub_1001F42E8();
  sub_1001A4570();
}

void TranslationEvent.x.setter(void *a1)
{
  id v1;

  v1 = sub_1001F42F0(a1);
  sub_1001F42C0((uint64_t)v1, 0x40000);
  sub_1001F4284(v1);
}

void TranslationEvent.x.modify(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v4 = sub_1001F4290(a1, a2);
  IOHIDEventGetFloatValue(v4, 0x40000);
  sub_1001F42E0();
  *v2 = v3;
  sub_1001A4570();
}

void sub_1001F48D0(uint64_t a1, uint64_t a2)
{
  sub_1001F4A20(a1, a2, 0x40000);
}

void TranslationEvent.y.getter(void *a1)
{
  sub_1001F4B14((uint64_t)a1, 1u);
  sub_1001F42E8();
  sub_1001A4570();
}

void TranslationEvent.y.setter(void *a1)
{
  id v1;

  v1 = sub_1001F42F0(a1);
  sub_1001F42C0((uint64_t)v1, 262145);
  sub_1001F4284(v1);
}

void TranslationEvent.y.modify(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v4 = sub_1001F4290(a1, a2);
  sub_1001F4B14((uint64_t)v4, 1u);
  sub_1001F42E0();
  *v2 = v3;
  sub_1001A4570();
}

void sub_1001F4974(uint64_t a1, uint64_t a2)
{
  sub_1001F4B0C(a1, a2, 1u);
}

void TranslationEvent.z.getter(void *a1)
{
  sub_1001F4B14((uint64_t)a1, 2u);
  sub_1001F42E8();
  sub_1001A4570();
}

void TranslationEvent.z.setter(void *a1)
{
  id v1;

  v1 = sub_1001F42F0(a1);
  sub_1001F42C0((uint64_t)v1, 262146);
  sub_1001F4284(v1);
}

void TranslationEvent.z.modify(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v4 = sub_1001F4290(a1, a2);
  sub_1001F4B14((uint64_t)v4, 2u);
  sub_1001F42E0();
  *v2 = v3;
  sub_1001A4570();
}

void sub_1001F4A18(uint64_t a1, uint64_t a2)
{
  sub_1001F4B0C(a1, a2, 2u);
}

void sub_1001F4A20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  v4 = *(id *)(a1 + 8);
  sub_1001F42C0((uint64_t)v4, a3);

}

void sub_1001F4A6C(void **a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  TranslationEvent.x.getter(*a1);
  *a2 = v3;
  sub_1000050D4();
}

void sub_1001F4A90(uint64_t a1, void **a2)
{
  TranslationEvent.x.setter(*a2);
}

void sub_1001F4A9C(void **a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  TranslationEvent.y.getter(*a1);
  *a2 = v3;
  sub_1000050D4();
}

void sub_1001F4AC0(uint64_t a1, void **a2)
{
  TranslationEvent.y.setter(*a2);
}

void sub_1001F4ACC(void **a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  TranslationEvent.z.getter(*a1);
  *a2 = v3;
  sub_1000050D4();
}

void sub_1001F4AF0(uint64_t a1, void **a2)
{
  TranslationEvent.z.setter(*a2);
}

ValueMetadata *type metadata accessor for TranslationEvent()
{
  return &type metadata for TranslationEvent;
}

void sub_1001F4B0C(uint64_t a1, uint64_t a2, unsigned __int16 a3)
{
  sub_1001F4A20(a1, a2, a3 | 0x40000u);
}

uint64_t sub_1001F4B14(uint64_t a1, unsigned __int16 a2)
{
  return IOHIDEventGetFloatValue(a1, a2 | 0x40000u);
}

void sub_1001F4B1C(int a1)
{
  _DWORD *v1;

  sub_1001F8194(*v1 | a1);
}

void sub_1001F4B28(char a1)
{
  _BYTE *v1;

  sub_1001F818C(*v1 | a1);
}

void sub_1001F4B34(int a1)
{
  _DWORD *v1;

  sub_1001F8194(*v1 ^ a1);
}

void sub_1001F4B40(char a1)
{
  _BYTE *v1;

  sub_1001F818C(*v1 ^ a1);
}

void sub_1001F4B4C(int a1)
{
  _DWORD *v1;

  sub_1001F8194(*v1 & ~a1);
}

void sub_1001F4B58(char a1)
{
  _BYTE *v1;

  sub_1001F818C(*v1 & ~a1);
}

id IOHIDEventRef.__bridgedValue.getter()
{
  return sub_1001F8178();
}

void sub_1001F4B80(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = sub_1001F4BA0(a1);
  sub_1000050D4();
}

uint64_t sub_1001F4BA0(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a1[3];
  v3 = a1[4];
  sub_10000DBE4(a1, v2);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3) == 5)
  {
    v4 = a1[3];
    v5 = a1[4];
    sub_10000DBE4(a1, v4);
    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 352))(v4, v5);
  }
  else
  {
    v6 = 0;
  }
  sub_100005988(a1);
  return v6;
}

uint64_t sub_1001F4C28(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a1[3];
  v3 = a1[4];
  sub_10000DBE4(a1, v2);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3) == 4)
  {
    v4 = a1[3];
    v5 = a1[4];
    sub_10000DBE4(a1, v4);
    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 352))(v4, v5);
  }
  else
  {
    v6 = 0;
  }
  sub_100005988(a1);
  return v6;
}

uint64_t sub_1001F4CB0(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a1[3];
  v3 = a1[4];
  sub_10000DBE4(a1, v2);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3) == 22)
  {
    v4 = a1[3];
    v5 = a1[4];
    sub_10000DBE4(a1, v4);
    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 352))(v4, v5);
  }
  else
  {
    v6 = 0;
  }
  sub_100005988(a1);
  return v6;
}

uint64_t sub_1001F4D38(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a1[3];
  v3 = a1[4];
  sub_10000DBE4(a1, v2);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3) == 7)
  {
    v4 = a1[3];
    v5 = a1[4];
    sub_10000DBE4(a1, v4);
    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 352))(v4, v5);
  }
  else
  {
    v6 = 0;
  }
  sub_100005988(a1);
  return v6;
}

uint64_t sub_1001F4DC0(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a1[3];
  v3 = a1[4];
  sub_10000DBE4(a1, v2);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3) == 11)
  {
    v4 = a1[3];
    v5 = a1[4];
    sub_10000DBE4(a1, v4);
    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 352))(v4, v5);
  }
  else
  {
    v6 = 0;
  }
  sub_100005988(a1);
  return v6;
}

uint64_t sub_1001F4E48(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a1[3];
  v3 = a1[4];
  sub_10000DBE4(a1, v2);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3) == 17)
  {
    v4 = a1[3];
    v5 = a1[4];
    sub_10000DBE4(a1, v4);
    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 352))(v4, v5);
  }
  else
  {
    v6 = 0;
  }
  sub_100005988(a1);
  return v6;
}

uint64_t sub_1001F4ED0(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a1[3];
  v3 = a1[4];
  sub_10000DBE4(a1, v2);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3) == 1)
  {
    v4 = a1[3];
    v5 = a1[4];
    sub_10000DBE4(a1, v4);
    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 352))(v4, v5);
  }
  else
  {
    v6 = 0;
  }
  sub_100005988(a1);
  return v6;
}

uint64_t sub_1001F4F58(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a1[3];
  v3 = a1[4];
  sub_10000DBE4(a1, v2);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3) == 3)
  {
    v4 = a1[3];
    v5 = a1[4];
    sub_10000DBE4(a1, v4);
    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 352))(v4, v5);
  }
  else
  {
    v6 = 0;
  }
  sub_100005988(a1);
  return v6;
}

uint64_t _HIDEventImpl.init(event:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  int v10;
  uint64_t v11;

  sub_1001F8160(a1);
  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 24))(v4, v5);
  if (v10 == (*(unsigned int (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3))
  {
    sub_10000DBE4(a1, a1[3]);
    v11 = sub_1001F811C();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(a3 + 40))(v11, a2, a3);
    sub_100048C44(a4, 0);
    return sub_1001F80CC(a1);
  }
  else
  {
    sub_100005988(a1);
    return _s13EnsembleAgent26PasteboardAcquisitionErrorOwst_0(a4, 1, 1, a2);
  }
}

uint64_t sub_1001F50B8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1[3];
  v3 = a1[4];
  sub_10000DBE4(a1, v2);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 352))(v2, v3);
  sub_100005988(a1);
  return v4;
}

uint64_t _HIDEventImpl.init(wrappedValue:)(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_1001F8160(a1);
  v6 = sub_1001F811C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a3 + 40))(v6, a2, a3);
  return sub_1001F80CC(a1);
}

void sub_1001F5164(void *a1)
{
  uint64_t v1;
  unint64_t v2;

  if (objc_msgSend(a1, "children"))
  {
    v2 = sub_1001B57C0();
    sub_10000E5FC(v2);
    sub_10000E538();
    sub_1001E6474(v1);
    sub_1001F8154();
  }
  sub_1000050D4();
}

void HIDEventProtocol.children.getter(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  unint64_t v4;

  v2 = (void *)(*(uint64_t (**)(void))(a2 + 352))();
  v3 = objc_msgSend(v2, "children");

  if (v3)
  {
    v4 = sub_1001B57C0();
    sub_10000E5FC(v4);
    sub_10000E538();
    sub_1001E6474((uint64_t)v2);
    sub_1001F8154();
  }
  sub_1000050D4();
}

uint64_t sub_1001F522C()
{
  return static DigitizerEventMask.identity.getter();
}

uint64_t sub_1001F5234()
{
  return 0x400000;
}

uint64_t static DigitizerEventMask.fromEdgeTip.getter()
{
  return 2048;
}

uint64_t static DigitizerEventMask.tap.getter()
{
  return 0x20000;
}

uint64_t static DigitizerEventMask.swipeRight.getter()
{
  return 0x8000000;
}

uint64_t HIDEventProtocol.eventMask.getter(uint64_t a1, uint64_t a2)
{
  unsigned int v2;

  v2 = (*(uint64_t (**)(void))(a2 + 24))();
  HIDEventType.maskValue.getter(v2);
  return HIDEventType.maskValue.getter(v2);
}

uint64_t sub_1001F5280()
{
  return static ReportID.pointer.getter();
}

uint64_t static ZoomToggleEvent.eventType.getter()
{
  return 22;
}

uint64_t static FluidTouchGestureEvent.eventType.getter()
{
  return 27;
}

void _HIDEventImpl.eventType.getter(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(a2 + 16))();
  sub_1000050D4();
}

uint64_t sub_1001F52B8(void *a1)
{
  id v1;
  uint64_t EventFlags;

  v1 = a1;
  EventFlags = IOHIDEventGetEventFlags();

  return EventFlags;
}

void HIDEventProtocol.flags.getter(uint64_t a1, uint64_t a2)
{
  HIDEventProtocol.__bridgedValue.getter(a1, a2);
  IOHIDEventGetEventFlags();
  sub_10000E538();
  sub_1000050D4();
}

void sub_1001F5310(int a1, id a2)
{
  id v2;

  v2 = a2;
  IOHIDEventSetEventFlags();

}

void HIDEventProtocol.flags.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;

  sub_1001F80B0(a1, a2, a3);
  sub_1001F816C(v3);
  sub_1000AAEF4(v4);
}

void sub_1001F5374(void **a1)
{
  uint64_t v1;
  int v2;

  sub_1001F7F58(a1);
  sub_1001F7F70();
  sub_1001F7F68();
  *(_DWORD *)(v1 + 8) = v2;
  sub_10000B350();
}

void HIDEventProtocol.flags.modify(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  v4 = sub_1001B98D0(a1, a2, a3);
  HIDEventProtocol.flags.getter(v4, v5);
  *(_DWORD *)(v3 + 24) = v6;
  sub_1000050D4();
}

void sub_1001F53D4(uint64_t a1)
{
  HIDEventProtocol.flags.setter(*(unsigned int *)(a1 + 24), *(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  sub_1000050D4();
}

BOOL sub_1001F53F8(void *a1)
{
  id v1;
  int IsAbsolute;

  v1 = a1;
  IsAbsolute = IOHIDEventIsAbsolute();

  return IsAbsolute != 0;
}

void HIDEventProtocol.absolute.getter(uint64_t a1, uint64_t a2)
{
  sub_1001F5CC8(a1, a2, (void (*)(void))&_IOHIDEventIsAbsolute);
}

void sub_1001F5438(int a1, void *a2)
{
  char v2;
  int v3;
  id v4;

  sub_1001F8080(a1, a2);
  sub_1001F7F70();
  sub_1001F7F68();
  v4 = HIDVirtualEventService.bridgedValue.getter();
  IOHIDEventSetEventFlags(v4, v3 & 0xFFFFFFFE | v2 & 1);
  sub_1001F7F88(v4);
}

void HIDEventProtocol.absolute.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  int v6;

  sub_1001F7FC4(a1, a2, a3);
  sub_1001F7FDC(v6 & 0xFFFFFFFE | v5 & 1, v4, v3);
}

void sub_1001F54A0(void **a1)
{
  sub_1001F7F58(a1);
  sub_1001F8044();
  sub_1001F7F68();
  sub_1001F7FE8();
  sub_10000B350();
}

void HIDEventProtocol.absolute.modify(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v4 = sub_1001B98D0(a1, a2, a3);
  HIDEventProtocol.absolute.getter(v4, v5);
  *(_BYTE *)(v3 + 24) = v6 & 1;
  sub_1000050D4();
}

void sub_1001F5504(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_1001F802C(a1);
  HIDEventProtocol.absolute.setter(v1, v2, v3);
  sub_1000050D4();
}

uint64_t sub_1001F5520(void *a1)
{
  id v1;
  unsigned int EventFlags;

  v1 = a1;
  EventFlags = IOHIDEventGetEventFlags();

  return HIWORD(EventFlags) & 1;
}

uint64_t HIDEventProtocol.accelerated.getter(uint64_t a1, uint64_t a2)
{
  return (sub_1001F8100(a1, a2) >> 16) & 1;
}

void sub_1001F5568(int a1, void *a2)
{
  int v2;
  id v3;

  sub_1001F8080(a1, a2);
  sub_1001F7F70();
  sub_1001F7F68();
  v3 = HIDVirtualEventService.bridgedValue.getter();
  sub_1001F80F8((uint64_t)v3, v2 & 0xFFFEFFFF);
  sub_1001F7F88(v3);
}

void HIDEventProtocol.accelerated.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_1001F7FC4(a1, a2, a3);
  v4 = sub_1001F80BC(v3 & 0xFFFEFFFF);
  sub_1001F7FDC(v4, v5, v6);
}

void sub_1001F55E0(void **a1)
{
  sub_1001F7F58(a1);
  sub_1001F7F70();
  sub_1001F7F68();
  sub_1001F8074();
  sub_10000B350();
}

void HIDEventProtocol.accelerated.modify(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_BYTE *)(v3 + 24) = (sub_1001F7FA8(a1, a2, a3) >> 16) & 1;
  sub_1000050D4();
}

void sub_1001F5640(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_1001F802C(a1);
  HIDEventProtocol.accelerated.setter(v1, v2, v3);
  sub_1000050D4();
}

uint64_t sub_1001F565C(void *a1)
{
  id v1;
  unsigned int EventFlags;

  v1 = a1;
  EventFlags = IOHIDEventGetEventFlags();

  return (EventFlags >> 4) & 1;
}

uint64_t HIDEventProtocol.builtin.getter(uint64_t a1, uint64_t a2)
{
  return (sub_1001F8100(a1, a2) >> 4) & 1;
}

void sub_1001F56A4(int a1, void *a2)
{
  int v2;
  id v3;

  sub_1001F8080(a1, a2);
  sub_1001F7F70();
  sub_1001F7F68();
  v3 = HIDVirtualEventService.bridgedValue.getter();
  sub_1001F80F8((uint64_t)v3, v2 & 0xFFFFFFEF);
  sub_1001F7F88(v3);
}

void HIDEventProtocol.builtin.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_1001F7FC4(a1, a2, a3);
  v4 = sub_1001F80BC(v3 & 0xFFFFFFEF);
  sub_1001F7FDC(v4, v5, v6);
}

void sub_1001F571C(void **a1)
{
  sub_1001F7F58(a1);
  sub_1001F7F70();
  sub_1001F7F68();
  sub_1001F8068();
  sub_10000B350();
}

void HIDEventProtocol.builtin.modify(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_BYTE *)(v3 + 24) = (sub_1001F7FA8(a1, a2, a3) & 0x10) != 0;
  sub_1000050D4();
}

void sub_1001F577C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_1001F802C(a1);
  HIDEventProtocol.builtin.setter(v1, v2, v3);
  sub_1000050D4();
}

uint64_t sub_1001F5798(void *a1)
{
  id v1;
  unsigned int EventFlags;

  v1 = a1;
  EventFlags = IOHIDEventGetEventFlags();

  return (EventFlags >> 3) & 1;
}

uint64_t HIDEventProtocol.centerOrigin.getter(uint64_t a1, uint64_t a2)
{
  return (sub_1001F8100(a1, a2) >> 3) & 1;
}

void sub_1001F57E0(int a1, void *a2)
{
  int v2;
  id v3;

  sub_1001F8080(a1, a2);
  sub_1001F7F70();
  sub_1001F7F68();
  v3 = HIDVirtualEventService.bridgedValue.getter();
  sub_1001F80F8((uint64_t)v3, v2 & 0xFFFFFFF7);
  sub_1001F7F88(v3);
}

void HIDEventProtocol.centerOrigin.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_1001F7FC4(a1, a2, a3);
  v4 = sub_1001F80BC(v3 & 0xFFFFFFF7);
  sub_1001F7FDC(v4, v5, v6);
}

void sub_1001F5858(void **a1)
{
  sub_1001F7F58(a1);
  sub_1001F7F70();
  sub_1001F7F68();
  sub_1001F805C();
  sub_10000B350();
}

void HIDEventProtocol.centerOrigin.modify(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_BYTE *)(v3 + 24) = (sub_1001F7FA8(a1, a2, a3) & 8) != 0;
  sub_1000050D4();
}

void sub_1001F58B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_1001F802C(a1);
  HIDEventProtocol.centerOrigin.setter(v1, v2, v3);
  sub_1000050D4();
}

uint64_t sub_1001F58D4(void *a1)
{
  id v1;
  unsigned int EventFlags;

  v1 = a1;
  EventFlags = IOHIDEventGetEventFlags();

  return (EventFlags >> 1) & 1;
}

uint64_t HIDEventProtocol.collection.getter(uint64_t a1, uint64_t a2)
{
  return (sub_1001F8100(a1, a2) >> 1) & 1;
}

void sub_1001F591C(int a1, void *a2)
{
  int v2;
  id v3;

  sub_1001F8080(a1, a2);
  sub_1001F7F70();
  sub_1001F7F68();
  v3 = HIDVirtualEventService.bridgedValue.getter();
  sub_1001F80F8((uint64_t)v3, v2 & 0xFFFFFFFD);
  sub_1001F7F88(v3);
}

void HIDEventProtocol.collection.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_1001F7FC4(a1, a2, a3);
  v4 = sub_1001F80BC(v3 & 0xFFFFFFFD);
  sub_1001F7FDC(v4, v5, v6);
}

void sub_1001F5994(void **a1)
{
  sub_1001F7F58(a1);
  sub_1001F7F70();
  sub_1001F7F68();
  sub_1001F80A4();
  sub_10000B350();
}

void HIDEventProtocol.collection.modify(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_BYTE *)(v3 + 24) = (sub_1001F7FA8(a1, a2, a3) & 2) != 0;
  sub_1000050D4();
}

void sub_1001F59F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_1001F802C(a1);
  HIDEventProtocol.collection.setter(v1, v2, v3);
  sub_1000050D4();
}

uint64_t sub_1001F5A10(void *a1)
{
  id v1;
  unsigned int EventFlags;

  v1 = a1;
  EventFlags = IOHIDEventGetEventFlags();

  return (EventFlags >> 5) & 1;
}

uint64_t HIDEventProtocol.interpolated.getter(uint64_t a1, uint64_t a2)
{
  return (sub_1001F8100(a1, a2) >> 5) & 1;
}

void sub_1001F5A58(int a1, void *a2)
{
  int v2;
  id v3;

  sub_1001F8080(a1, a2);
  sub_1001F7F70();
  sub_1001F7F68();
  v3 = HIDVirtualEventService.bridgedValue.getter();
  sub_1001F80F8((uint64_t)v3, v2 & 0xFFFFFFDF);
  sub_1001F7F88(v3);
}

void HIDEventProtocol.interpolated.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_1001F7FC4(a1, a2, a3);
  v4 = sub_1001F80BC(v3 & 0xFFFFFFDF);
  sub_1001F7FDC(v4, v5, v6);
}

void sub_1001F5AD0(void **a1)
{
  sub_1001F7F58(a1);
  sub_1001F7F70();
  sub_1001F7F68();
  sub_1001F8098();
  sub_10000B350();
}

void HIDEventProtocol.interpolated.modify(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_BYTE *)(v3 + 24) = (sub_1001F7FA8(a1, a2, a3) & 0x20) != 0;
  sub_1000050D4();
}

void sub_1001F5B30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_1001F802C(a1);
  HIDEventProtocol.interpolated.setter(v1, v2, v3);
  sub_1000050D4();
}

uint64_t sub_1001F5B4C(void *a1)
{
  id v1;
  unsigned int EventFlags;

  v1 = a1;
  EventFlags = IOHIDEventGetEventFlags();

  return (EventFlags >> 2) & 1;
}

uint64_t HIDEventProtocol.pixelUnits.getter(uint64_t a1, uint64_t a2)
{
  return (sub_1001F8100(a1, a2) >> 2) & 1;
}

void sub_1001F5B94(int a1, void *a2)
{
  int v2;
  id v3;

  sub_1001F8080(a1, a2);
  sub_1001F7F70();
  sub_1001F7F68();
  v3 = HIDVirtualEventService.bridgedValue.getter();
  sub_1001F80F8((uint64_t)v3, v2 & 0xFFFFFFFB);
  sub_1001F7F88(v3);
}

void HIDEventProtocol.pixelUnits.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_1001F7FC4(a1, a2, a3);
  v4 = sub_1001F80BC(v3 & 0xFFFFFFFB);
  sub_1001F7FDC(v4, v5, v6);
}

void sub_1001F5C0C(void **a1)
{
  sub_1001F7F58(a1);
  sub_1001F7F70();
  sub_1001F7F68();
  sub_1001F808C();
  sub_10000B350();
}

void HIDEventProtocol.pixelUnits.modify(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_BYTE *)(v3 + 24) = (sub_1001F7FA8(a1, a2, a3) & 4) != 0;
  sub_1000050D4();
}

void sub_1001F5C6C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_1001F802C(a1);
  HIDEventProtocol.pixelUnits.setter(v1, v2, v3);
  sub_1000050D4();
}

BOOL sub_1001F5C88(void *a1)
{
  id v1;
  int IsRepeat;

  v1 = a1;
  IsRepeat = IOHIDEventIsRepeat();

  return IsRepeat != 0;
}

void HIDEventProtocol.repeat.getter(uint64_t a1, uint64_t a2)
{
  sub_1001F5CC8(a1, a2, (void (*)(void))&_IOHIDEventIsRepeat);
}

void sub_1001F5CC8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  void *v4;
  void *v5;

  HIDEventProtocol.__bridgedValue.getter(a1, a2);
  v5 = v4;
  a3();

  sub_1000050D4();
}

void sub_1001F5CFC(char a1, id a2)
{
  id v2;

  if ((a1 & 1) != 0)
  {
    v2 = a2;
    IOHIDEventSetRepeat();

  }
}

void HIDEventProtocol.repeat.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;

  if ((a1 & 1) != 0)
  {
    sub_1001F80B0(a1, a2, a3);
    v4 = v3;
    IOHIDEventSetRepeat();
    sub_1001F8144(v4);
  }
}

void sub_1001F5D64()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;

  v1 = sub_1001F7FF8();
  v2 = sub_1001F801C((uint64_t)v1);
  *(_QWORD *)(v0 + 32) = sub_1001F5D98(v2, v3);
  sub_10000B350();
}

uint64_t (*sub_1001F5D98(uint64_t a1, id a2))()
{
  id v3;
  int IsRepeat;

  *(_QWORD *)a1 = a2;
  v3 = a2;
  IsRepeat = IOHIDEventIsRepeat();

  *(_BYTE *)(a1 + 8) = IsRepeat != 0;
  return sub_1001F5DF0;
}

void sub_1001F5DF4(uint64_t a1)
{
  id v1;

  if (*(_BYTE *)(a1 + 8) == 1)
  {
    v1 = *(id *)a1;
    IOHIDEventSetRepeat();
    sub_1001F8144(v1);
  }
}

void HIDEventProtocol.repeat.modify(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v4 = sub_1001B98D0(a1, a2, a3);
  HIDEventProtocol.repeat.getter(v4, v5);
  *(_BYTE *)(v3 + 24) = v6 & 1;
  sub_1000050D4();
}

void sub_1001F5E68(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_1001F802C(a1);
  HIDEventProtocol.repeat.setter(v1, v2, v3);
  sub_1000050D4();
}

void sub_1001F5E84(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;

  v1 = a1;
  v2 = (id)IOHIDEventGetParent();

  if (v2)
  {
    sub_1001F814C();
    sub_1001F8180(v3, (uint64_t)&protocol witness table for IOHIDEventRef);
  }
  else
  {
    sub_1001F80E0();
  }
  sub_10000B350();
}

void HIDEventProtocol.parent.getter(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  HIDEventProtocol.__bridgedValue.getter(a1, a2);
  v3 = v2;
  v4 = (id)IOHIDEventGetParent();

  if (v4)
  {
    sub_1001F814C();
    sub_1001F8180(v5, (uint64_t)&protocol witness table for IOHIDEventRef);
  }
  else
  {
    sub_1001F80E0();
  }
  sub_10000B350();
}

void sub_1001F5F2C(void *a1)
{
  id v1;

  v1 = a1;
  IOHIDEventGetPhase();
  sub_10000E538();
  sub_1000050D4();
}

void HIDEventProtocol.phase.getter(uint64_t a1, uint64_t a2)
{
  HIDEventProtocol.__bridgedValue.getter(a1, a2);
  IOHIDEventGetPhase();
  sub_10000E538();
  sub_1000050D4();
}

void sub_1001F5F7C(int a1, id a2)
{
  id v2;

  v2 = a2;
  IOHIDEventSetPhase();

}

void HIDEventProtocol.phase.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;

  sub_1001F80B0(a1, a2, a3);
  v4 = v3;
  IOHIDEventSetPhase();
  sub_1000AAEF4(v4);
}

void sub_1001F5FE8(void **a1)
{
  uint64_t v1;
  char v2;

  sub_1001F7F98(a1);
  *(_BYTE *)(v1 + 8) = v2;
  sub_1000050D4();
}

void HIDEventProtocol.phase.modify(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v4 = sub_1001B98D0(a1, a2, a3);
  HIDEventProtocol.phase.getter(v4, v5);
  *(_BYTE *)(v3 + 24) = v6;
  sub_1000050D4();
}

void sub_1001F6040(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_1001F802C(a1);
  HIDEventProtocol.phase.setter(v1, v2, v3);
  sub_1000050D4();
}

uint64_t sub_1001F605C(void *a1)
{
  id v1;
  uint64_t ScrollMomentum;

  v1 = a1;
  ScrollMomentum = IOHIDEventGetScrollMomentum();

  return ScrollMomentum;
}

void HIDEventProtocol.momentum.getter(uint64_t a1, uint64_t a2)
{
  HIDEventProtocol.__bridgedValue.getter(a1, a2);
  IOHIDEventGetScrollMomentum();
  sub_10000E538();
  sub_1000050D4();
}

void sub_1001F60B4(int a1, id a2)
{
  id v2;

  v2 = a2;
  IOHIDEventSetScrollMomentum();

}

void HIDEventProtocol.momentum.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;

  sub_1001F80B0(a1, a2, a3);
  v4 = v3;
  IOHIDEventSetScrollMomentum();
  sub_1000AAEF4(v4);
}

void sub_1001F6120(void **a1)
{
  uint64_t v1;
  char v2;

  sub_1001F7F58(a1);
  sub_1001F803C();
  sub_1001F7F68();
  *(_BYTE *)(v1 + 8) = v2;
  sub_10000B350();
}

void HIDEventProtocol.momentum.modify(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v4 = sub_1001B98D0(a1, a2, a3);
  HIDEventProtocol.momentum.getter(v4, v5);
  *(_BYTE *)(v3 + 24) = v6;
  sub_1000050D4();
}

void sub_1001F6180(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_1001F802C(a1);
  HIDEventProtocol.momentum.setter(v1, v2, v3);
  sub_1000050D4();
}

uint64_t sub_1001F619C(void *a1)
{
  id v1;
  uint64_t SenderID;

  v1 = a1;
  SenderID = IOHIDEventGetSenderID();

  return SenderID;
}

void HIDEventProtocol.sender.getter(uint64_t a1, uint64_t a2)
{
  HIDEventProtocol.__bridgedValue.getter(a1, a2);
  IOHIDEventGetSenderID();
  sub_10000E538();
  sub_1000050D4();
}

void sub_1001F61F4(int a1, id a2)
{
  id v2;

  v2 = a2;
  IOHIDEventSetSenderID();

}

void HIDEventProtocol.sender.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1001F6360(a1, a2, a3, (void (*)(void))&_IOHIDEventSetSenderID);
}

void sub_1001F623C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  sub_1001F7F78(a1);
  sub_1001F804C();
  sub_1001F7F68();
  *v1 = v2;
  sub_10000B350();
}

void HIDEventProtocol.sender.modify(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_1001B98E8(a1, a2, a3);
  HIDEventProtocol.sender.getter(v4, v5);
  *v3 = v6;
  sub_1000050D4();
}

void sub_1001F62A0(uint64_t *a1)
{
  HIDEventProtocol.sender.setter(*a1, a1[1], a1[2]);
  sub_1000050D4();
}

uint64_t sub_1001F62C0(void *a1)
{
  id v1;
  uint64_t TimeStamp;

  v1 = a1;
  TimeStamp = IOHIDEventGetTimeStamp();

  return TimeStamp;
}

void HIDEventProtocol.time.getter(uint64_t a1, uint64_t a2)
{
  HIDEventProtocol.__bridgedValue.getter(a1, a2);
  IOHIDEventGetTimeStamp();
  sub_10000E538();
  sub_1000050D4();
}

void sub_1001F6318(int a1, id a2)
{
  id v2;

  v2 = a2;
  IOHIDEventSetTimeStamp();

}

void HIDEventProtocol.time.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1001F6360(a1, a2, a3, (void (*)(void))&_IOHIDEventSetTimeStamp);
}

void sub_1001F6360(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  void *v5;
  void *v6;

  sub_1001F80B0(a1, a2, a3);
  v6 = v5;
  a4();
  sub_1001F7F88(v6);
}

void sub_1001F6398(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  sub_1001F7F78(a1);
  sub_1001F8054();
  sub_1001F7F68();
  *v1 = v2;
  sub_10000B350();
}

void HIDEventProtocol.time.modify(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_1001B98E8(a1, a2, a3);
  HIDEventProtocol.time.getter(v4, v5);
  *v3 = v6;
  sub_1000050D4();
}

void sub_1001F63F8(uint64_t *a1)
{
  HIDEventProtocol.time.setter(*a1, a1[1], a1[2]);
  sub_1000050D4();
}

void HIDEventProtocol.append(_:)(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  sub_1001F64A0(a1, a2, a3, (void (*)(void *, void *, _QWORD))&_IOHIDEventAppendEvent);
}

void sub_1001F6424(_QWORD *a1, id a2, void (*a3)(id, void *, _QWORD))
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a2;
  v6 = a1[3];
  v7 = a1[4];
  sub_10000DBE4(a1, v6);
  HIDEventProtocol.__bridgedValue.getter(v6, v7);
  v9 = v8;
  a3(v5, v8, 0);

  sub_10002D720(v9);
}

void HIDEventProtocol.remove(_:)(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  sub_1001F64A0(a1, a2, a3, (void (*)(void *, void *, _QWORD))&IOHIDEventRemoveEvent);
}

void sub_1001F64A0(_QWORD *a1, uint64_t a2, uint64_t a3, void (*a4)(void *, void *, _QWORD))
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  sub_1001F80B0((uint64_t)a1, a2, a3);
  v7 = v6;
  v8 = a1[3];
  v9 = a1[4];
  sub_10000DBE4(a1, v8);
  HIDEventProtocol.__bridgedValue.getter(v8, v9);
  v11 = v10;
  a4(v7, v10, 0);

  sub_10002D720(v11);
}

void sub_1001F6510(int a1, int a2, id a3)
{
  id v3;
  id v4;
  uint64_t v5;

  v3 = a3;
  v4 = (id)IOHIDEventGetEventWithOptions();

  if (v4)
  {
    sub_1001F814C();
    sub_1001F8180(v5, (uint64_t)&protocol witness table for IOHIDEventRef);
  }
  else
  {
    sub_1001F80E0();
  }
  sub_10000B350();
}

double HIDEventProtocol.first(_:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  double result;

  HIDEventProtocol.__bridgedValue.getter(a3, a4);
  v5 = v4;
  v6 = (id)IOHIDEventGetEventWithOptions();

  if (!v6)
    return sub_1001F80E0();
  sub_1001F814C();
  sub_1001F8180(v7, (uint64_t)&protocol witness table for IOHIDEventRef);
  return result;
}

void sub_1001F65F4(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = sub_1001F4C28(a1);
  sub_1000050D4();
}

uint64_t sub_1001F6614()
{
  return static ReportID.rotation.getter();
}

uint64_t sub_1001F661C()
{
  return static ReportID.appleVendorTopCase.getter();
}

void (*sub_1001F6634(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD *)
{
  _QWORD *v6;
  uint64_t v7;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  HIDEventProtocol.flags.modify(v6, a2, a3);
  v6[4] = v7;
  return sub_1001F5D94;
}

void (*sub_1001F6698(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD *)
{
  _QWORD *v6;
  uint64_t v7;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  HIDEventProtocol.absolute.modify(v6, a2, a3);
  v6[4] = v7;
  return sub_1001F5D94;
}

void (*sub_1001F66FC(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD *)
{
  _QWORD *v6;
  uint64_t v7;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  HIDEventProtocol.accelerated.modify(v6, a2, a3);
  v6[4] = v7;
  return sub_1001F5D94;
}

void (*sub_1001F6760(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD *)
{
  _QWORD *v6;
  uint64_t v7;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  HIDEventProtocol.builtin.modify(v6, a2, a3);
  v6[4] = v7;
  return sub_1001F5D94;
}

void (*sub_1001F67C4(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD *)
{
  _QWORD *v6;
  uint64_t v7;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  HIDEventProtocol.centerOrigin.modify(v6, a2, a3);
  v6[4] = v7;
  return sub_1001F5D94;
}

void (*sub_1001F6828(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD *)
{
  _QWORD *v6;
  uint64_t v7;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  HIDEventProtocol.collection.modify(v6, a2, a3);
  v6[4] = v7;
  return sub_1001F5D94;
}

void (*sub_1001F688C(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD *)
{
  _QWORD *v6;
  uint64_t v7;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  HIDEventProtocol.interpolated.modify(v6, a2, a3);
  v6[4] = v7;
  return sub_1001F5D94;
}

void (*sub_1001F68F0(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD *)
{
  _QWORD *v6;
  uint64_t v7;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  HIDEventProtocol.pixelUnits.modify(v6, a2, a3);
  v6[4] = v7;
  return sub_1001F5D94;
}

void (*sub_1001F6954(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD *)
{
  _QWORD *v6;
  uint64_t v7;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  HIDEventProtocol.repeat.modify(v6, a2, a3);
  v6[4] = v7;
  return sub_1001F5D94;
}

void (*sub_1001F69BC(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD *)
{
  _QWORD *v6;
  uint64_t v7;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  HIDEventProtocol.phase.modify(v6, a2, a3);
  v6[4] = v7;
  return sub_1001F5D94;
}

void (*sub_1001F6A20(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD *)
{
  _QWORD *v6;
  uint64_t v7;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  HIDEventProtocol.momentum.modify(v6, a2, a3);
  v6[4] = v7;
  return sub_1001F5D94;
}

void (*sub_1001F6A84(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD *)
{
  _QWORD *v6;
  uint64_t v7;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  HIDEventProtocol.sender.modify(v6, a2, a3);
  v6[4] = v7;
  return sub_1001F5D94;
}

void (*sub_1001F6AE8(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD *)
{
  _QWORD *v6;
  uint64_t v7;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  HIDEventProtocol.time.modify(v6, a2, a3);
  v6[4] = v7;
  return sub_1001F5D94;
}

void HIDEvent.eventType.getter()
{
  id v0;

  v0 = HIDVirtualEventService.bridgedValue.getter();
  IOHIDEventGetType(v0);
  sub_10000E538();
  sub_1000050D4();
}

id HIDEvent.wrappedValue.getter()
{
  void *v0;

  return v0;
}

void sub_1001F6B80()
{
  HIDEvent.eventType.getter();
}

void sub_1001F6BA0()
{
  HIDEvent.wrappedValue.getter();
  sub_1000050D4();
}

void HIDEventProtocol.__bridgedValue.getter(uint64_t a1, uint64_t a2)
{

  sub_1000050D4();
}

void sub_1001F6BF0(uint64_t a1@<X1>, uint64_t a2@<X2>, _DWORD *a3@<X8>)
{
  int v4;

  HIDEventProtocol.flags.getter(*(_QWORD *)(a2 + a1 - 16), *(_QWORD *)(a2 + a1 - 8));
  *a3 = v4;
}

void sub_1001F6C20(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  HIDEventProtocol.flags.setter(*a1, *(_QWORD *)(a4 + a3 - 16), *(_QWORD *)(a4 + a3 - 8));
}

void sub_1001F6C4C(uint64_t a1@<X1>, uint64_t a2@<X2>, _BYTE *a3@<X8>)
{
  char v4;

  HIDEventProtocol.absolute.getter(*(_QWORD *)(a2 + a1 - 16), *(_QWORD *)(a2 + a1 - 8));
  *a3 = v4 & 1;
}

void sub_1001F6C80(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  HIDEventProtocol.absolute.setter(*a1, *(_QWORD *)(a4 + a3 - 16), *(_QWORD *)(a4 + a3 - 8));
}

uint64_t sub_1001F6CAC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = HIDEventProtocol.accelerated.getter(*(_QWORD *)(a2 + a1 - 16), *(_QWORD *)(a2 + a1 - 8));
  *a3 = result & 1;
  return result;
}

void sub_1001F6CE0(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  HIDEventProtocol.accelerated.setter(*a1, *(_QWORD *)(a4 + a3 - 16), *(_QWORD *)(a4 + a3 - 8));
}

uint64_t sub_1001F6D0C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = HIDEventProtocol.builtin.getter(*(_QWORD *)(a2 + a1 - 16), *(_QWORD *)(a2 + a1 - 8));
  *a3 = result & 1;
  return result;
}

void sub_1001F6D40(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  HIDEventProtocol.builtin.setter(*a1, *(_QWORD *)(a4 + a3 - 16), *(_QWORD *)(a4 + a3 - 8));
}

uint64_t sub_1001F6D6C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = HIDEventProtocol.centerOrigin.getter(*(_QWORD *)(a2 + a1 - 16), *(_QWORD *)(a2 + a1 - 8));
  *a3 = result & 1;
  return result;
}

void sub_1001F6DA0(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  HIDEventProtocol.centerOrigin.setter(*a1, *(_QWORD *)(a4 + a3 - 16), *(_QWORD *)(a4 + a3 - 8));
}

uint64_t sub_1001F6DCC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = HIDEventProtocol.collection.getter(*(_QWORD *)(a2 + a1 - 16), *(_QWORD *)(a2 + a1 - 8));
  *a3 = result & 1;
  return result;
}

void sub_1001F6E00(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  HIDEventProtocol.collection.setter(*a1, *(_QWORD *)(a4 + a3 - 16), *(_QWORD *)(a4 + a3 - 8));
}

uint64_t sub_1001F6E2C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = HIDEventProtocol.interpolated.getter(*(_QWORD *)(a2 + a1 - 16), *(_QWORD *)(a2 + a1 - 8));
  *a3 = result & 1;
  return result;
}

void sub_1001F6E60(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  HIDEventProtocol.interpolated.setter(*a1, *(_QWORD *)(a4 + a3 - 16), *(_QWORD *)(a4 + a3 - 8));
}

uint64_t sub_1001F6E8C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = HIDEventProtocol.pixelUnits.getter(*(_QWORD *)(a2 + a1 - 16), *(_QWORD *)(a2 + a1 - 8));
  *a3 = result & 1;
  return result;
}

void sub_1001F6EC0(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  HIDEventProtocol.pixelUnits.setter(*a1, *(_QWORD *)(a4 + a3 - 16), *(_QWORD *)(a4 + a3 - 8));
}

void sub_1001F6EEC(uint64_t a1@<X1>, uint64_t a2@<X2>, _BYTE *a3@<X8>)
{
  char v4;

  HIDEventProtocol.repeat.getter(*(_QWORD *)(a2 + a1 - 16), *(_QWORD *)(a2 + a1 - 8));
  *a3 = v4 & 1;
}

void sub_1001F6F20(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  HIDEventProtocol.repeat.setter(*a1, *(_QWORD *)(a4 + a3 - 16), *(_QWORD *)(a4 + a3 - 8));
}

void sub_1001F6F4C(uint64_t a1@<X1>, uint64_t a2@<X2>, _BYTE *a3@<X8>)
{
  char v4;

  HIDEventProtocol.phase.getter(*(_QWORD *)(a2 + a1 - 16), *(_QWORD *)(a2 + a1 - 8));
  *a3 = v4;
}

void sub_1001F6F7C(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  HIDEventProtocol.phase.setter(*a1, *(_QWORD *)(a4 + a3 - 16), *(_QWORD *)(a4 + a3 - 8));
}

void sub_1001F6FA8(uint64_t a1@<X1>, uint64_t a2@<X2>, _BYTE *a3@<X8>)
{
  char v4;

  HIDEventProtocol.momentum.getter(*(_QWORD *)(a2 + a1 - 16), *(_QWORD *)(a2 + a1 - 8));
  *a3 = v4;
}

void sub_1001F6FD8(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  HIDEventProtocol.momentum.setter(*a1, *(_QWORD *)(a4 + a3 - 16), *(_QWORD *)(a4 + a3 - 8));
}

void sub_1001F7004(uint64_t a1@<X1>, uint64_t a2@<X2>, _QWORD *a3@<X8>)
{
  uint64_t v4;

  HIDEventProtocol.sender.getter(*(_QWORD *)(a2 + a1 - 16), *(_QWORD *)(a2 + a1 - 8));
  *a3 = v4;
}

void sub_1001F7034(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  HIDEventProtocol.sender.setter(*a1, *(_QWORD *)(a4 + a3 - 16), *(_QWORD *)(a4 + a3 - 8));
}

void sub_1001F7060(uint64_t a1@<X1>, uint64_t a2@<X2>, _QWORD *a3@<X8>)
{
  uint64_t v4;

  HIDEventProtocol.time.getter(*(_QWORD *)(a2 + a1 - 16), *(_QWORD *)(a2 + a1 - 8));
  *a3 = v4;
}

void sub_1001F7090(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  HIDEventProtocol.time.setter(*a1, *(_QWORD *)(a4 + a3 - 16), *(_QWORD *)(a4 + a3 - 8));
}

void HIDEventProtocol.first(where:)(uint64_t (*a1)(_QWORD *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v12;
  void (*v13)(_QWORD *, uint64_t, uint64_t);
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
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
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49[2];
  _QWORD v50[3];
  uint64_t v51;
  uint64_t v52;

  v6 = v5;
  v51 = a3;
  v52 = a4;
  v12 = sub_100005534(v50);
  v13 = *(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16);
  v13(v12, v5, a3);
  v14 = a1(v50);
  v15 = v14;
  sub_1001F819C(v14, v16, v17, v18, v19, v20, v21, v22, v45, v47, *((uint64_t *)&v47 + 1));
  if ((v15 & 1) != 0)
  {
    a5[3] = a3;
    a5[4] = a4;
    v23 = sub_100005534(a5);
    v13(v23, v6, a3);
  }
  else
  {
    v24 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a3, a4);
    v25 = *(_QWORD *)(v24 + 16);
    if (v25)
    {
      v26 = v24 + 32;
      while (1)
      {
        sub_1000445C0(v26, (uint64_t)v50);
        v27 = v51;
        v28 = v52;
        sub_10000DBE4(v50, v51);
        HIDEventProtocol.first(where:)(&v47, a1, a2, v27, v28);
        if (v48)
          break;
        v29 = sub_1001B56A0((uint64_t)&v47);
        sub_1001F819C(v29, v30, v31, v32, v33, v34, v35, v36, v46, v47, *((uint64_t *)&v47 + 1));
        v26 += 40;
        if (!--v25)
          goto LABEL_7;
      }
      swift_bridgeObjectRelease();
      sub_100025A50(&v47, (uint64_t)v49);
      v37 = sub_100025A50(v49, (uint64_t)a5);
      sub_1001F819C(v37, v38, v39, v40, v41, v42, v43, v44, v46, v47, *((uint64_t *)&v47 + 1));
    }
    else
    {
LABEL_7:
      swift_bridgeObjectRelease();
      sub_1001F80E0();
    }
  }
}

uint64_t HIDEventProtocol.first<A>(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[6];
  __int128 v10;
  uint64_t v11;
  _QWORD v12[5];

  v9[2] = a1;
  v9[3] = a2;
  v9[4] = a3;
  v9[5] = a4;
  HIDEventProtocol.first(where:)((uint64_t (*)(_QWORD *))sub_1001F7B9C, (uint64_t)v9, a1, a3, &v10);
  if (v11)
  {
    sub_100025A50(&v10, (uint64_t)v12);
    sub_1000445C0((uint64_t)v12, (uint64_t)&v10);
    sub_1001F8130((uint64_t)&v10);
    sub_100005988(v12);
    v6 = a5;
    v7 = 0;
  }
  else
  {
    sub_1001B56A0((uint64_t)&v10);
    v6 = a5;
    v7 = 1;
  }
  return sub_100048C44(v6, v7);
}

BOOL sub_1001F72BC(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;

  v7 = a1[3];
  v8 = a1[4];
  sub_10000DBE4(a1, v7);
  LODWORD(v7) = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 24))(v7, v8);
  return (_DWORD)v7 == (*(unsigned int (**)(uint64_t, uint64_t))(a5 + 16))(a3, a5);
}

uint64_t HIDEventProtocol.first<A>(_:where:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[8];
  __int128 v12;
  uint64_t v13;
  _QWORD v14[5];

  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = a6;
  v11[6] = a1;
  v11[7] = a2;
  HIDEventProtocol.first(where:)(sub_1001F7BA8, (uint64_t)v11, a3, a5, &v12);
  if (v13)
  {
    sub_100025A50(&v12, (uint64_t)v14);
    sub_1000445C0((uint64_t)v14, (uint64_t)&v12);
    sub_1001F8130((uint64_t)&v12);
    sub_100005988(v14);
    v8 = a7;
    v9 = 0;
  }
  else
  {
    sub_1001B56A0((uint64_t)&v12);
    v8 = a7;
    v9 = 1;
  }
  return sub_100048C44(v8, v9);
}

uint64_t sub_1001F73DC(_QWORD *a1, uint64_t (*a2)(_QWORD *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  int v13;
  char v14;
  _QWORD v16[5];

  v11 = a1[3];
  v12 = a1[4];
  sub_10000DBE4(a1, v11);
  LODWORD(v11) = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 24))(v11, v12);
  v13 = (*(uint64_t (**)(uint64_t, uint64_t))(a7 + 16))(a5, a7);
  sub_1000445C0((uint64_t)a1, (uint64_t)v16);
  if ((_DWORD)v11 == v13)
    v14 = a2(v16);
  else
    v14 = 0;
  sub_100005988(v16);
  return v14 & 1;
}

uint64_t IOHIDEventRef.eventType.getter()
{
  uint64_t v0;

  return IOHIDEventGetType(v0);
}

uint64_t sub_1001F74AC()
{
  return IOHIDEventRef.eventType.getter();
}

void sub_1001F74CC()
{
  IOHIDEventRef.__bridgedValue.getter();
  sub_1000050D4();
}

void UInt32.stringValue.getter()
{
  id v0;

  v0 = (id)IOHIDEventTypeGetName();
  static String._unconditionallyBridgeFromObjectiveC(_:)(v0);

  sub_10000B350();
}

void sub_1001F7528(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = sub_1001F4CB0(a1);
  sub_1000050D4();
}

uint64_t sub_1001F7548()
{
  return sub_1001F5234();
}

uint64_t sub_1001F7550()
{
  return static ZoomToggleEvent.eventType.getter();
}

void sub_1001F7558(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = sub_1001F4D38(a1);
  sub_1000050D4();
}

void sub_1001F7578(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = sub_1001F50B8(a1);
  sub_1000050D4();
}

void sub_1001F7598()
{
  void **v0;

  sub_1001F5164(*v0);
}

uint64_t sub_1001F75B0()
{
  return static Int8.logicalMinimum.getter();
}

uint64_t sub_1001F75B8()
{
  return static ReportID.scroll.getter();
}

uint64_t sub_1001F75C0()
{
  void **v0;

  return sub_1001F52B8(*v0);
}

void sub_1001F75C8(int a1)
{
  id *v1;

  sub_1001F5310(a1, *v1);
}

void sub_1001F75D0(void **a1)
{
  uint64_t v1;
  int v2;

  sub_1001F7F58(a1);
  sub_1001F7F70();
  sub_1001F7F68();
  *(_DWORD *)(v1 + 8) = v2;
  sub_10000B350();
}

void sub_1001F7604(void **a1)
{
  id v1;
  void *v2;

  v1 = sub_1001F8114(*a1);
  sub_1001F816C((uint64_t)v1);
  sub_1000AAEF4(v2);
}

BOOL sub_1001F7630()
{
  void **v0;

  return sub_1001F53F8(*v0);
}

void sub_1001F7638(int a1)
{
  void **v1;

  sub_1001F5438(a1, *v1);
}

void sub_1001F7650(void **a1)
{
  sub_1001F7F58(a1);
  sub_1001F8044();
  sub_1001F7F68();
  sub_1001F7FE8();
  sub_10000B350();
}

void sub_1001F7684(uint64_t a1)
{
  int v1;
  void *v2;

  v1 = sub_1001F8108(a1);
  sub_1001F5438(v1, v2);
}

uint64_t sub_1001F769C()
{
  void **v0;

  return sub_1001F5520(*v0);
}

void sub_1001F76A4(int a1)
{
  void **v1;

  sub_1001F5568(a1, *v1);
}

void sub_1001F76BC(void **a1)
{
  sub_1001F7F58(a1);
  sub_1001F7F70();
  sub_1001F7F68();
  sub_1001F8074();
  sub_10000B350();
}

void sub_1001F76F0(uint64_t a1)
{
  int v1;
  void *v2;

  v1 = sub_1001F8108(a1);
  sub_1001F5568(v1, v2);
}

uint64_t sub_1001F7708()
{
  void **v0;

  return sub_1001F565C(*v0);
}

void sub_1001F7710(int a1)
{
  void **v1;

  sub_1001F56A4(a1, *v1);
}

void sub_1001F7728(void **a1)
{
  sub_1001F7F58(a1);
  sub_1001F7F70();
  sub_1001F7F68();
  sub_1001F8068();
  sub_10000B350();
}

void sub_1001F775C(uint64_t a1)
{
  int v1;
  void *v2;

  v1 = sub_1001F8108(a1);
  sub_1001F56A4(v1, v2);
}

uint64_t sub_1001F7774()
{
  void **v0;

  return sub_1001F5798(*v0);
}

void sub_1001F777C(int a1)
{
  void **v1;

  sub_1001F57E0(a1, *v1);
}

void sub_1001F7794(void **a1)
{
  sub_1001F7F58(a1);
  sub_1001F7F70();
  sub_1001F7F68();
  sub_1001F805C();
  sub_10000B350();
}

void sub_1001F77C8(uint64_t a1)
{
  int v1;
  void *v2;

  v1 = sub_1001F8108(a1);
  sub_1001F57E0(v1, v2);
}

uint64_t sub_1001F77E0()
{
  void **v0;

  return sub_1001F58D4(*v0);
}

void sub_1001F77E8(int a1)
{
  void **v1;

  sub_1001F591C(a1, *v1);
}

void sub_1001F7800(void **a1)
{
  sub_1001F7F58(a1);
  sub_1001F7F70();
  sub_1001F7F68();
  sub_1001F80A4();
  sub_10000B350();
}

void sub_1001F7834(uint64_t a1)
{
  int v1;
  void *v2;

  v1 = sub_1001F8108(a1);
  sub_1001F591C(v1, v2);
}

uint64_t sub_1001F784C()
{
  void **v0;

  return sub_1001F5A10(*v0);
}

void sub_1001F7854(int a1)
{
  void **v1;

  sub_1001F5A58(a1, *v1);
}

void sub_1001F786C(void **a1)
{
  sub_1001F7F58(a1);
  sub_1001F7F70();
  sub_1001F7F68();
  sub_1001F8098();
  sub_10000B350();
}

void sub_1001F78A0(uint64_t a1)
{
  int v1;
  void *v2;

  v1 = sub_1001F8108(a1);
  sub_1001F5A58(v1, v2);
}

uint64_t sub_1001F78B8()
{
  void **v0;

  return sub_1001F5B4C(*v0);
}

void sub_1001F78C0(int a1)
{
  void **v1;

  sub_1001F5B94(a1, *v1);
}

void sub_1001F78D8(void **a1)
{
  sub_1001F7F58(a1);
  sub_1001F7F70();
  sub_1001F7F68();
  sub_1001F808C();
  sub_10000B350();
}

void sub_1001F790C(uint64_t a1)
{
  int v1;
  void *v2;

  v1 = sub_1001F8108(a1);
  sub_1001F5B94(v1, v2);
}

BOOL sub_1001F7924()
{
  void **v0;

  return sub_1001F5C88(*v0);
}

void sub_1001F792C(char a1)
{
  id *v1;

  sub_1001F5CFC(a1, *v1);
}

void sub_1001F7934()
{
  void **v0;

  sub_1001F5E84(*v0);
}

void sub_1001F794C()
{
  void **v0;

  sub_1001F5F2C(*v0);
}

void sub_1001F7964(int a1)
{
  id *v1;

  sub_1001F5F7C(a1, *v1);
}

uint64_t sub_1001F796C()
{
  void **v0;

  return sub_1001F605C(*v0);
}

void sub_1001F7974(int a1)
{
  id *v1;

  sub_1001F60B4(a1, *v1);
}

void sub_1001F797C(void **a1)
{
  uint64_t v1;
  char v2;

  sub_1001F7F58(a1);
  sub_1001F803C();
  sub_1001F7F68();
  *(_BYTE *)(v1 + 8) = v2;
  sub_10000B350();
}

void sub_1001F79B0(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(a1 + 8);
  v2 = sub_1001F8114(*(void **)a1);
  IOHIDEventSetScrollMomentum(v2, v1);
  sub_1000AAEF4(v2);
}

uint64_t sub_1001F79E4()
{
  void **v0;

  return sub_1001F619C(*v0);
}

void sub_1001F79EC(int a1)
{
  id *v1;

  sub_1001F61F4(a1, *v1);
}

uint64_t sub_1001F79F4()
{
  void **v0;

  return sub_1001F62C0(*v0);
}

void sub_1001F79FC(int a1)
{
  id *v1;

  sub_1001F6318(a1, *v1);
}

void sub_1001F7A04(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  sub_1001F7F78(a1);
  sub_1001F8054();
  sub_1001F7F68();
  *v1 = v2;
  sub_10000B350();
}

void sub_1001F7A38(uint64_t *a1)
{
  uint64_t v1;
  id v2;

  v1 = *a1;
  v2 = sub_1001F8114((void *)a1[1]);
  IOHIDEventSetTimeStamp(v2, v1);
  sub_1000AAEF4(v2);
}

void sub_1001F7A68(_QWORD *a1)
{
  id *v1;

  sub_1001F6424(a1, *v1, (void (*)(id, void *, _QWORD))&_IOHIDEventAppendEvent);
}

void sub_1001F7A88(_QWORD *a1)
{
  id *v1;

  sub_1001F6424(a1, *v1, (void (*)(id, void *, _QWORD))&IOHIDEventRemoveEvent);
}

void sub_1001F7AA8(int a1, int a2)
{
  id *v2;

  sub_1001F6510(a1, a2, *v2);
}

void sub_1001F7AC0(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = sub_1001F4DC0(a1);
  sub_1000050D4();
}

uint64_t sub_1001F7AE0()
{
  return static DigitizerEventMask.fromEdgeTip.getter();
}

uint64_t sub_1001F7AE8()
{
  return static ReportID.dockSwipe.getter();
}

uint64_t sub_1001F7AF0()
{
  return static DigitizerEventMask.attribute.getter();
}

uint64_t sub_1001F7AF8()
{
  return static ReportID.button.getter();
}

void sub_1001F7B00(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = sub_1001F4E48(a1);
  sub_1000050D4();
}

uint64_t sub_1001F7B20()
{
  return static DigitizerEventMask.tap.getter();
}

uint64_t sub_1001F7B28()
{
  return static ReportID.translation.getter();
}

uint64_t sub_1001F7B30()
{
  return static DigitizerEventMask.swipeRight.getter();
}

uint64_t sub_1001F7B38()
{
  return static FluidTouchGestureEvent.eventType.getter();
}

void sub_1001F7B40(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = sub_1001F4ED0(a1);
  sub_1000050D4();
}

uint64_t sub_1001F7B60()
{
  return static ReportID.consumer.getter();
}

uint64_t sub_1001F7B68()
{
  return static ReportID.keyboard.getter();
}

void sub_1001F7B70(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

BOOL sub_1001F7B9C(_QWORD *a1)
{
  uint64_t *v1;

  return sub_1001F72BC(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_1001F7BA8(_QWORD *a1)
{
  uint64_t v1;

  return sub_1001F73DC(a1, *(uint64_t (**)(_QWORD *))(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t dispatch thunk of HIDVirtualEventServiceProtocol.logDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of HIDEventProtocol.flags.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of HIDEventProtocol.flags.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of HIDEventProtocol.absolute.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of HIDEventProtocol.absolute.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of HIDEventProtocol.absolute.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of HIDEventProtocol.accelerated.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of HIDEventProtocol.accelerated.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of HIDEventProtocol.accelerated.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

uint64_t dispatch thunk of HIDEventProtocol.builtin.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of HIDEventProtocol.builtin.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of HIDEventProtocol.builtin.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 120))();
}

uint64_t dispatch thunk of HIDEventProtocol.centerOrigin.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

uint64_t dispatch thunk of HIDEventProtocol.centerOrigin.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 136))();
}

uint64_t dispatch thunk of HIDEventProtocol.centerOrigin.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 144))();
}

uint64_t dispatch thunk of HIDEventProtocol.collection.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 152))();
}

uint64_t dispatch thunk of HIDEventProtocol.collection.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 160))();
}

uint64_t dispatch thunk of HIDEventProtocol.collection.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 168))();
}

uint64_t dispatch thunk of HIDEventProtocol.interpolated.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 176))();
}

uint64_t dispatch thunk of HIDEventProtocol.interpolated.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 184))();
}

uint64_t dispatch thunk of HIDEventProtocol.interpolated.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 192))();
}

uint64_t dispatch thunk of HIDEventProtocol.pixelUnits.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 200))();
}

uint64_t dispatch thunk of HIDEventProtocol.pixelUnits.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 208))();
}

uint64_t dispatch thunk of HIDEventProtocol.pixelUnits.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 216))();
}

uint64_t dispatch thunk of HIDEventProtocol.repeat.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 224))();
}

uint64_t dispatch thunk of HIDEventProtocol.repeat.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 232))();
}

uint64_t dispatch thunk of HIDEventProtocol.repeat.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 240))();
}

uint64_t dispatch thunk of HIDEventProtocol.parent.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 248))();
}

uint64_t dispatch thunk of HIDEventProtocol.phase.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 256))();
}

uint64_t dispatch thunk of HIDEventProtocol.phase.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 264))();
}

uint64_t dispatch thunk of HIDEventProtocol.phase.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 272))();
}

uint64_t dispatch thunk of HIDEventProtocol.momentum.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 280))();
}

uint64_t dispatch thunk of HIDEventProtocol.momentum.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 288))();
}

uint64_t dispatch thunk of HIDEventProtocol.momentum.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 296))();
}

uint64_t dispatch thunk of HIDEventProtocol.sender.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 304))();
}

uint64_t dispatch thunk of HIDEventProtocol.sender.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 312))();
}

uint64_t dispatch thunk of HIDEventProtocol.sender.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 320))();
}

uint64_t dispatch thunk of HIDEventProtocol.time.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 328))();
}

uint64_t dispatch thunk of HIDEventProtocol.time.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 336))();
}

uint64_t dispatch thunk of HIDEventProtocol.time.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 344))();
}

uint64_t dispatch thunk of HIDEventProtocol.wrappedValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 352))();
}

uint64_t dispatch thunk of HIDEventProtocol.append(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 360))();
}

uint64_t dispatch thunk of HIDEventProtocol.remove(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 368))();
}

uint64_t dispatch thunk of HIDEventProtocol.first(_:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 376))();
}

uint64_t dispatch thunk of HIDVirtualEventServiceProtocol.delegate.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of HIDVirtualEventServiceProtocol.delegate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

void sub_1001F7DF8(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = sub_1001F4F58(a1);
  sub_1000050D4();
}

uint64_t sub_1001F7E18()
{
  return static HIDEventPhase.canceled.getter();
}

uint64_t sub_1001F7E20()
{
  return static ReportID.appleVendorKeyboard.getter();
}

void sub_1001F7E28(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(a1 + 8);
  v2 = sub_1001F8114(*(void **)a1);
  IOHIDEventSetPhase(v2, v1);
  sub_1000AAEF4(v2);
}

void sub_1001F7E5C(uint64_t *a1)
{
  uint64_t v1;
  id v2;

  v1 = *a1;
  v2 = sub_1001F8114((void *)a1[1]);
  IOHIDEventSetSenderID(v2, v1);
  sub_1000AAEF4(v2);
}

id sub_1001F7F58(void **a1)
{
  void **v1;
  void *v3;

  v3 = *v1;
  *a1 = *v1;
  return v3;
}

void sub_1001F7F68()
{
  void *v0;

}

uint64_t sub_1001F7F70()
{
  return IOHIDEventGetEventFlags();
}

id sub_1001F7F78(uint64_t a1)
{
  void **v1;
  void *v3;

  v3 = *v1;
  *(_QWORD *)(a1 + 8) = *v1;
  return v3;
}

void sub_1001F7F88(id a1)
{

}

void sub_1001F7F98(void **a1)
{
  void **v1;
  void *v3;

  v3 = *v1;
  *a1 = *v1;
  sub_1001F5F2C(v3);
}

uint64_t sub_1001F7FA8(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  a1[1] = a3;
  a1[2] = v3;
  *a1 = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 32))(a2, a3);
}

void sub_1001F7FC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  HIDEventProtocol.flags.getter(a2, a3);
}

void sub_1001F7FDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  HIDEventProtocol.flags.setter(a1, a2, a3);
}

void sub_1001F7FE8()
{
  uint64_t v0;
  int v1;

  *(_BYTE *)(v0 + 8) = v1 != 0;
}

void *sub_1001F7FF8()
{
  return malloc(0x28uLL);
}

__n128 sub_1001F8004(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_1001F8010()
{
  return 16;
}

uint64_t sub_1001F801C(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t sub_1001F802C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t sub_1001F803C()
{
  return IOHIDEventGetScrollMomentum();
}

uint64_t sub_1001F8044()
{
  return IOHIDEventIsAbsolute();
}

uint64_t sub_1001F804C()
{
  return IOHIDEventGetSenderID();
}

uint64_t sub_1001F8054()
{
  return IOHIDEventGetTimeStamp();
}

void sub_1001F805C()
{
  uint64_t v0;
  char v1;

  *(_BYTE *)(v0 + 8) = (v1 & 8) != 0;
}

void sub_1001F8068()
{
  uint64_t v0;
  char v1;

  *(_BYTE *)(v0 + 8) = (v1 & 0x10) != 0;
}

void sub_1001F8074()
{
  uint64_t v0;
  int v1;

  *(_BYTE *)(v0 + 8) = BYTE2(v1) & 1;
}

id sub_1001F8080(int a1, id a2)
{
  return a2;
}

void sub_1001F808C()
{
  uint64_t v0;
  char v1;

  *(_BYTE *)(v0 + 8) = (v1 & 4) != 0;
}

void sub_1001F8098()
{
  uint64_t v0;
  char v1;

  *(_BYTE *)(v0 + 8) = (v1 & 0x20) != 0;
}

void sub_1001F80A4()
{
  uint64_t v0;
  char v1;

  *(_BYTE *)(v0 + 8) = (v1 & 2) != 0;
}

void sub_1001F80B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  HIDEventProtocol.__bridgedValue.getter(a2, a3);
}

uint64_t sub_1001F80BC@<X0>(int a1@<W8>)
{
  unsigned int v1;

  return a1 | v1;
}

uint64_t sub_1001F80CC(_QWORD *a1)
{
  return sub_100005988(a1);
}

double sub_1001F80E0()
{
  uint64_t v0;
  double result;

  *(_QWORD *)(v0 + 32) = 0;
  result = 0.0;
  *(_OWORD *)v0 = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  return result;
}

id HIDVirtualEventService.bridgedValue.getter()
{
  void *v0;

  return v0;
}

uint64_t sub_1001F80F8@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  unsigned int v2;

  return IOHIDEventSetEventFlags(a1, a2 | v2);
}

uint64_t sub_1001F8100(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_1001F8108(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

id sub_1001F8114@<X0>(void *a1@<X8>)
{
  return a1;
}

uint64_t sub_1001F811C()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 352))(v0, v1);
}

uint64_t sub_1001F8130(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, v2, v3);
}

void sub_1001F8144(id a1)
{

}

void sub_1001F814C()
{
  type metadata accessor for IOHIDEvent(0);
}

uint64_t sub_1001F8154()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

_QWORD *sub_1001F8160(_QWORD *a1)
{
  return sub_10000DBE4(a1, a1[3]);
}

uint64_t sub_1001F816C(uint64_t a1)
{
  uint64_t v1;

  return IOHIDEventSetEventFlags(a1, v1);
}

id sub_1001F8178()
{
  void *v0;

  return v0;
}

uint64_t sub_1001F8180@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v2[3] = result;
  v2[4] = a2;
  *v2 = v3;
  return result;
}

void sub_1001F818C(char a1@<W8>)
{
  _BYTE *v1;

  *v1 = a1;
}

void sub_1001F8194(int a1@<W8>)
{
  _DWORD *v1;

  *v1 = a1;
}

uint64_t sub_1001F819C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  return sub_100005988((uint64_t *)va);
}

void sub_1001F81A4(unsigned int a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  unsigned int v19;
  BOOL v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  double *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  _QWORD *v41;
  uint64_t v42[3];
  uint64_t v43[3];
  uint64_t v44[3];
  uint64_t v45[3];
  uint64_t v46[5];
  _QWORD *v47;

  v8 = HIWORD(a1);
  HIDWORD(v36) = (unsigned __int16)a1;
  v9 = HIWORD(a1) - (unsigned __int16)a1;
  if (HIWORD(a1) < (unsigned __int16)a1)
    v10 = -(uint64_t)((unsigned __int16)a1 - HIWORD(a1));
  else
    v10 = v8 - (unsigned __int16)a1;
  if (v10)
  {
    v47 = _swiftEmptyArrayStorage;
    sub_1001F3964(0, v10 & ~(v10 >> 63), 0);
    if ((v10 & 0x8000000000000000) == 0)
    {
      v39 = v4;
      v41 = v47;
      v35 = a2;
      swift_beginAccess(a2 + 16, v46, 0, 0);
      swift_beginAccess(a2 + 16, v45, 0, 0);
      swift_beginAccess(a2 + 16, v44, 1, 0);
      swift_beginAccess(a2 + 16, v43, 0, 0);
      v40 = (uint64_t *)(a2 + 16);
      swift_beginAccess(a2 + 16, v42, 1, 0);
      v11 = HIDWORD(v36);
      v33 = a4;
      v34 = a3;
      while (v10)
      {
        v12 = *v40 + 32;
        if (__OFADD__(*v40, 32))
          goto LABEL_24;
        if (HIDReport.count.getter(a3, a4) < v12)
          goto LABEL_20;
        v18 = v40;
        v19 = sub_1001E906C(*v40, a3, a4, v13, v14, v15, v16, v17, v32, v33, v34, v35, v36, v37, v38, v39, (uint64_t)v40, (uint64_t)v41, v42[0],
                v42[1],
                v42[2],
                v43[0],
                v43[1],
                v43[2],
                v44[0],
                v44[1],
                v44[2],
                v45[0],
                v45[1],
                v45[2],
                v46[0],
                v46[1],
                v46[2],
                v46[3],
                v46[4],
                (uint64_t)v47);
        *v18 = v12;
        v20 = __OFADD__(v12, 16);
        v21 = v12 + 16;
        if (v20)
          goto LABEL_25;
        v22 = v19;
        if (HIDReport.count.getter(a3, a4) < v21)
        {
LABEL_20:
          v30 = sub_1001F8D88();
          v31 = swift_allocError(&type metadata for HIDAccelerationTable.IndexOutOfBounds, v30, 0, 0);
          swift_willThrow(v31);
LABEL_21:
          swift_release();
          swift_release();
          sub_100022AEC(a3, a4);
          return;
        }
        v37 = v10;
        v38 = v9;
        sub_100128154(*(_QWORD *)(v35 + 16), a3, a4);
        v24 = bswap32(v23);
        *(_QWORD *)(v35 + 16) = v21;
        swift_retain();
        sub_10002517C(a3, a4);
        sub_1001F84AC(v24 & 0xFFFF0000, v35, a3, a4);
        if (v39)
          goto LABEL_21;
        v26 = v25;
        v47 = v41;
        v28 = v41[2];
        v27 = v41[3];
        if (v28 >= v27 >> 1)
        {
          sub_1001F3964(v27 > 1, v28 + 1, 1);
          v41 = v47;
        }
        v41[2] = v28 + 1;
        v29 = (double *)&v41[2 * v28];
        v29[4] = (double)(int)bswap32(v22) * 0.0000152587891;
        *((_QWORD *)v29 + 5) = v26;
        if (v8 < HIDWORD(v36))
          goto LABEL_26;
        if (v11 >= v8)
          goto LABEL_27;
        ++v11;
        v10 = v37 - 1;
        --v9;
        a4 = v33;
        a3 = v34;
        if (v38 == 1)
        {
          swift_release();
          goto LABEL_22;
        }
      }
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    swift_release();
LABEL_22:
    sub_100022AEC(a3, a4);
  }
}

void sub_1001F84AC(unsigned int a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unsigned int v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  unsigned int v22;
  BOOL v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  unsigned int v32;
  unint64_t v33;
  unint64_t v34;
  int64x2_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  float64x2_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t *v57;
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
  _QWORD *v75;

  v8 = HIWORD(a1);
  HIDWORD(v51) = (unsigned __int16)a1;
  v9 = v8 - (unsigned __int16)a1;
  if (v8 < (unsigned __int16)a1)
    v10 = -(uint64_t)((unsigned __int16)a1 - HIWORD(a1));
  else
    v10 = v8 - (unsigned __int16)a1;
  if (v10)
  {
    v75 = _swiftEmptyArrayStorage;
    sub_1001F3998(0, v10 & ~(v10 >> 63), 0);
    if ((v10 & 0x8000000000000000) == 0)
    {
      v38 = v4;
      v40 = a2;
      v11 = v75;
      swift_beginAccess(a2 + 16, &v70, 0, 0);
      swift_beginAccess(a2 + 16, &v67, 0, 0);
      swift_beginAccess(a2 + 16, &v64, 1, 0);
      swift_beginAccess(a2 + 16, &v61, 0, 0);
      v56 = (uint64_t *)(a2 + 16);
      swift_beginAccess(a2 + 16, &v58, 1, 0);
      v46 = (float64x2_t)vdupq_n_s64(0x3EF0000000000000uLL);
      v12 = HIDWORD(v51);
      v42 = a3;
      v44 = a4;
      while (v10)
      {
        v13 = *v56 + 32;
        if (__OFADD__(*v56, 32))
          goto LABEL_22;
        v14 = v11;
        v53 = v9;
        v15 = v8;
        if (HIDReport.count.getter(a3, a4) < v13)
          goto LABEL_18;
        v21 = v56;
        v22 = sub_1001E906C(*v56, a3, a4, v16, v17, v18, v19, v20, v38, v40, v42, v44, *(uint64_t *)&v46.f64[0], *(uint64_t *)&v46.f64[1], v49, v51, v53, (uint64_t)v56, v58,
                v59,
                v60,
                v61,
                v62,
                v63,
                v64,
                v65,
                v66,
                v67,
                v68,
                v69,
                v70,
                v71,
                v72,
                v73,
                v74,
                (uint64_t)v75);
        *v21 = v13;
        v23 = __OFADD__(v13, 32);
        v24 = v13 + 32;
        if (v23)
          goto LABEL_23;
        v25 = v22;
        if (HIDReport.count.getter(a3, a4) < v24)
        {
LABEL_18:
          v36 = sub_1001F8D88();
          v37 = swift_allocError(&type metadata for HIDAccelerationTable.IndexOutOfBounds, v36, 0, 0);
          swift_willThrow(v37);
          swift_release();
          swift_release();
          sub_100022AEC(a3, a4);
          return;
        }
        v31 = v57;
        v32 = sub_1001E906C(*v57, a3, a4, v26, v27, v28, v29, v30, v39, v41, v43, v45, v47, v48, v50, v52, v54, (uint64_t)v57, v58,
                v59,
                v60,
                v61,
                v62,
                v63,
                v64,
                v65,
                v66,
                v67,
                v68,
                v69,
                v70,
                v71,
                v72,
                v73,
                v74,
                (uint64_t)v75);
        *v31 = v24;
        v11 = v14;
        v75 = v14;
        v34 = v14[2];
        v33 = v14[3];
        if (v34 >= v33 >> 1)
        {
          sub_1001F3998(v33 > 1, v34 + 1, 1);
          v11 = v75;
        }
        v35.i64[0] = (int)bswap32(v25);
        v35.i64[1] = (int)bswap32(v32);
        v11[2] = v34 + 1;
        *(float64x2_t *)&v11[2 * v34 + 4] = vmulq_f64(vcvtq_f64_s64(v35), v46);
        if (v15 < HIDWORD(v51))
          goto LABEL_24;
        v8 = v15;
        if (v12 >= v15)
          goto LABEL_25;
        ++v12;
        --v10;
        v9 = v55 - 1;
        a3 = v42;
        a4 = v44;
        if (v55 == 1)
        {
          swift_release();
          goto LABEL_20;
        }
      }
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    swift_release();
LABEL_20:
    sub_100022AEC(a3, a4);
  }
}

double HIDPoint.y.getter(double a1, double a2)
{
  return a2;
}

void HIDPoint.y.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 8) = a1;
}

uint64_t (*HIDPoint.y.modify())(_QWORD)
{
  return CGSize.init(_:);
}

double HIDPoint.z.getter(double a1, double a2, double a3)
{
  return a3;
}

void HIDPoint.z.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 16) = a1;
}

uint64_t HIDAccelerationTableEntry.points.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease(*(_QWORD *)(v1 + 8));
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t HIDAccelerationTable.signature.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 8) = result;
  return result;
}

uint64_t HIDAccelerationTable.entry.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease(*(_QWORD *)(v1 + 16));
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t static HIDAccelerationTable.appleDefaultAccelerationTableSignature.getter()
{
  return 1077030960;
}

uint64_t static HIDAccelerationTable.appleMultitouchAccelerationTableSignature.getter()
{
  return 1431519786;
}

uint64_t HIDAccelerationTable.init(data:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  int v5;
  int v6;
  uint64_t result;
  int v9;
  unsigned int v10;

  v4 = swift_allocObject(&unk_100296268, 24, 7);
  *(_QWORD *)(v4 + 16) = 0;
  v5 = ((uint64_t (*)(void))sub_1001F8958)();
  v6 = sub_1001F8958(v4, a1, a2);
  if (v6 == 1077030960 || v6 == 1431519786)
  {
    sub_1001F8A48(v4, a1, a2);
    v10 = v9 << 16;
    swift_retain();
    sub_1001F81A4(v10, v4, a1, a2);
    sub_10002645C();
    *(double *)&result = (double)v5 * 0.0000152587891;
  }
  else
  {
    sub_10002645C();
    sub_10016B15C();
    *(double *)&result = 0.0;
  }
  return result;
}

#error "1001F8A04: call analysis failed (funcsize=59)"

void sub_1001F8A48(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _BYTE v11[24];
  _BYTE v12[24];
  _BYTE v13[24];

  v6 = (uint64_t *)(a1 + 16);
  swift_beginAccess(a1 + 16, v13, 0, 0);
  v7 = *(_QWORD *)(a1 + 16);
  v8 = v7 + 16;
  if (__OFADD__(v7, 16))
  {
    __break(1u);
  }
  else if (HIDReport.count.getter(a2, a3) >= v8)
  {
    swift_beginAccess(v6, v12, 0, 0);
    sub_100128154(*v6, a2, a3);
    swift_beginAccess(v6, v11, 1, 0);
    *v6 = v8;
  }
  else
  {
    v9 = sub_1001F8D88();
    v10 = swift_allocError(&type metadata for HIDAccelerationTable.IndexOutOfBounds, v9, 0, 0);
    swift_willThrow(v10);
  }
}

uint64_t sub_1001F8B3C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void type metadata accessor for HIDAccelerationPoint()
{
  sub_10003B1DC();
}

uint64_t getEnumTagSinglePayload for HIDPoint(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for HIDPoint(uint64_t result, int a2, int a3)
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

void type metadata accessor for HIDAccelerationSegment()
{
  sub_10003B1DC();
}

_QWORD *assignWithCopy for HIDAccelerationTableEntry(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = *a2;
  v3 = a2[1];
  v4 = a1[1];
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

_QWORD *assignWithTake for HIDAccelerationTableEntry(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  *a1 = *a2;
  v3 = a1[1];
  a1[1] = a2[1];
  swift_bridgeObjectRelease(v3);
  return a1;
}

void type metadata accessor for HIDAccelerationTableEntry()
{
  sub_10003B1DC();
}

uint64_t sub_1001F8C38(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t assignWithCopy for HIDAccelerationTable(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t assignWithTake for HIDAccelerationTable(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for HIDAccelerationTable(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for HIDAccelerationTable(uint64_t result, int a2, int a3)
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

void type metadata accessor for HIDAccelerationTable()
{
  sub_10003B1DC();
}

unint64_t sub_1001F8D88()
{
  unint64_t result;

  result = qword_1002B6590;
  if (!qword_1002B6590)
  {
    result = swift_getWitnessTable(&unk_100230174, &type metadata for HIDAccelerationTable.IndexOutOfBounds);
    atomic_store(result, (unint64_t *)&qword_1002B6590);
  }
  return result;
}

ValueMetadata *type metadata accessor for HIDAccelerationTable.IndexOutOfBounds()
{
  return &type metadata for HIDAccelerationTable.IndexOutOfBounds;
}

void HIDPoint.x.setter(double a1)
{
  double *v1;

  *v1 = a1;
}

unint64_t HIDUniversalControlMatchedServiceKey.getter()
{
  return sub_100206708();
}

unint64_t HIDUniversalControlVirtualServiceKey.getter()
{
  return sub_100206708();
}

unint64_t HIDUniversalControlBuiltInKey.getter()
{
  return 0xD000000000000017;
}

void HIDServiceProperties.dictionaryRepresentation.getter(uint64_t a1, void *a2)
{
  id v2;
  char *v3;

  v2 = a2;
  v3 = sub_1001F8E60(v2);

  sub_1001F9520((uint64_t)v3, &qword_1002AC350, (void (*)(uint64_t, uint64_t, void **))sub_10005C2E8);
  sub_100026914();
}

char *sub_1001F8E60(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  __int128 v12;
  __int128 v13;
  _QWORD v15[2];
  __int128 v16;
  __int128 v17;
  _OWORD v18[2];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _OWORD v22[2];
  _QWORD v23[7];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  __int128 *v28;

  v1 = a1;
  v2 = NSDictionary.makeIterator()();

  v27 = v2;
  v3 = type metadata accessor for NSDictionary.Iterator(0);
  sub_100205E00((uint64_t)&unk_1002B6738);
  v5 = v4;
  dispatch thunk of IteratorProtocol.next()(v3, v4);
  if (*((_QWORD *)&v24 + 1))
  {
    v6 = (char *)_swiftEmptyArrayStorage;
    v28 = &v20;
    do
    {
      v22[0] = *(_OWORD *)&v23[5];
      v22[1] = v24;
      *(_OWORD *)v23 = v25;
      *(_OWORD *)&v23[2] = v26;
      sub_100007918((uint64_t)v22, (uint64_t)&v16);
      sub_100007918((uint64_t)v23, (uint64_t)v18);
      if (swift_dynamicCast(v15, &v16, (char *)&type metadata for Any + 8, &type metadata for String, 6))
      {
        v7 = v15[0];
        v8 = v15[1];
        sub_100005988(v18);
        *(_QWORD *)&v19 = v7;
        *((_QWORD *)&v19 + 1) = v8;
        sub_100007918((uint64_t)v22, (uint64_t)&v16);
        sub_100007918((uint64_t)v23, (uint64_t)v18);
        sub_100005778(v18, v28);
        sub_100005988(&v16);
      }
      else
      {
        sub_100005988(v18);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
      }
      sub_10000E36C((uint64_t)v22, &qword_1002B6740);
      if (*((_QWORD *)&v19 + 1))
      {
        v16 = v19;
        v17 = v20;
        v18[0] = v21;
        if ((swift_isUniquelyReferenced_nonNull_native(v6) & 1) == 0)
          v6 = sub_1002041C4(0, *((_QWORD *)v6 + 2) + 1, 1, (uint64_t)v6);
        v10 = *((_QWORD *)v6 + 2);
        v9 = *((_QWORD *)v6 + 3);
        if (v10 >= v9 >> 1)
          v6 = sub_1002041C4((char *)(v9 > 1), v10 + 1, 1, (uint64_t)v6);
        *((_QWORD *)v6 + 2) = v10 + 1;
        v11 = &v6[48 * v10];
        v12 = v16;
        v13 = v18[0];
        *((_OWORD *)v11 + 3) = v17;
        *((_OWORD *)v11 + 4) = v13;
        *((_OWORD *)v11 + 2) = v12;
      }
      else
      {
        sub_10000E36C((uint64_t)&v19, &qword_1002B6748);
      }
      dispatch thunk of IteratorProtocol.next()(v3, v5);
    }
    while (*((_QWORD *)&v24 + 1));
  }
  else
  {
    v6 = (char *)_swiftEmptyArrayStorage;
  }
  swift_release();
  return v6;
}

char *sub_1001F90C0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;
  _QWORD v12[18];
  _BYTE v13[144];
  _BYTE v14[32];
  _OWORD v15[2];
  __int128 v16;
  uint64_t v17;
  HIDUtils::HIDServiceProperties::HIDAccelCurve_optional v18;
  _BYTE v19[160];
  NSDictionary v20;
  uint64_t v21;
  uint64_t v22;

  sub_10003AFC4();
  v21 = v0;
  v22 = v1;
  v3 = v2;
  v4 = type metadata accessor for NSFastEnumerationIterator(0);
  v11 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  sub_100026500();
  v5 = v3;
  NSArray.makeIterator()();

  sub_100205E00((uint64_t)&unk_1002B6720);
  sub_1002066F4();
  if (v17)
  {
    v6 = (char *)_swiftEmptyArrayStorage;
    do
    {
      sub_100005778(&v16, v15);
      sub_100007918((uint64_t)v15, (uint64_t)v14);
      sub_10005FC6C(0, &qword_1002B0910, NSDictionary_ptr);
      if (swift_dynamicCast(&v20, v14, (char *)&type metadata for Any + 8, v7, 6))
      {
        HIDServiceProperties.HIDAccelCurve.init(dictionaryRepresentation:)(&v18, v20);
        sub_1002068FC((uint64_t)&v18, (uint64_t)v13);
        sub_100005988(v15);
        sub_1002068FC((uint64_t)&v18, (uint64_t)v19);
        if (sub_100205DE4((uint64_t)v19) != 1)
        {
          if ((swift_isUniquelyReferenced_nonNull_native(v6) & 1) == 0)
            v6 = sub_1002068E4(0, *((_QWORD *)v6 + 2) + 1);
          v9 = *((_QWORD *)v6 + 2);
          v8 = *((_QWORD *)v6 + 3);
          if (v9 >= v8 >> 1)
            v6 = sub_1002068E4((char *)(v8 > 1), v9 + 1);
          sub_1002068FC((uint64_t)v13, (uint64_t)v12);
          *((_QWORD *)v6 + 2) = v9 + 1;
          memcpy(&v6[144 * v9 + 32], v12, 0x89uLL);
        }
      }
      else
      {
        sub_100005988(v15);
      }
      sub_1002066F4();
    }
    while (v17);
  }
  else
  {
    v6 = (char *)_swiftEmptyArrayStorage;
  }
  sub_1000A342C(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
  return v6;
}

char *sub_1001F92D0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  __int16 v10;
  __int16 v11;
  char v12;
  __int16 v13;
  __int16 v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v19;
  _BYTE v20[32];
  _OWORD v21[2];
  __int128 v22;
  uint64_t v23;
  void *v24;

  v2 = type metadata accessor for NSFastEnumerationIterator(0);
  v19 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v4 = &v20[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = a1;
  NSArray.makeIterator()();

  sub_100205E00((uint64_t)&unk_1002B6720);
  v7 = v6;
  dispatch thunk of IteratorProtocol.next()(v2, v6);
  if (v23)
  {
    v8 = (char *)_swiftEmptyArrayStorage;
    do
    {
      sub_100005778(&v22, v21);
      sub_100007918((uint64_t)v21, (uint64_t)v20);
      sub_10005FC6C(0, &qword_1002B0910, NSDictionary_ptr);
      if (!swift_dynamicCast(&v24, v20, (char *)&type metadata for Any + 8, v9, 6)
        || (v10 = sub_1001FBC3C(v24), (v12 & 1) != 0))
      {
        sub_100005988(v21);
      }
      else
      {
        v13 = v10;
        v14 = v11;
        sub_100005988(v21);
        if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0)
          v8 = sub_1002043AC(0, *((_QWORD *)v8 + 2) + 1, 1, (uint64_t)v8);
        v16 = *((_QWORD *)v8 + 2);
        v15 = *((_QWORD *)v8 + 3);
        if (v16 >= v15 >> 1)
          v8 = sub_1002043AC((char *)(v15 > 1), v16 + 1, 1, (uint64_t)v8);
        *((_QWORD *)v8 + 2) = v16 + 1;
        v17 = &v8[4 * v16];
        *((_WORD *)v17 + 16) = v14;
        *((_WORD *)v17 + 17) = v13;
      }
      dispatch thunk of IteratorProtocol.next()(v2, v7);
    }
    while (v23);
  }
  else
  {
    v8 = (char *)_swiftEmptyArrayStorage;
  }
  (*(void (**)(_BYTE *, uint64_t))(v19 + 8))(v4, v2);
  return v8;
}

void sub_1001F94F8(uint64_t a1)
{
  sub_1001F9520(a1, &qword_1002AC350, (void (*)(uint64_t, uint64_t, void **))sub_10005C2E8);
}

void sub_1001F950C(uint64_t a1)
{
  sub_1001F9520(a1, &qword_1002B6708, (void (*)(uint64_t, uint64_t, void **))sub_10020532C);
}

void sub_1001F9520(uint64_t a1, uint64_t *a2, void (*a3)(uint64_t, uint64_t, void **))
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    sub_1000055B0(a2);
    v5 = (void *)static _DictionaryStorage.allocate(capacity:)(v4);
  }
  else
  {
    v5 = &_swiftEmptyDictionarySingleton;
  }
  v7 = v5;
  v6 = sub_1000103C0();
  a3(v6, 1, &v7);
  sub_10000E410();
  sub_100026914();
}

void HIDServiceProperties.subscript.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
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
  uint64_t v31[9];

  v2 = sub_1002061B0(a1, a2);
  v9 = sub_1002060D0(v2, (uint64_t)&type metadata for String, v3, v4, v5, v6, v7, v8);
  v10 = sub_100206368(v9, "__swift_objectForKeyedSubscript:");
  v11 = sub_10005FF20();
  if (v10)
  {
    sub_100206260(v11, v12);
    v13 = sub_10000F718();
  }
  else
  {
    v17 = sub_10020607C();
  }
  sub_100205FD8(v13, v14, &qword_1002B34C0, v15, v16, v17);
  if (v31[8])
  {
    sub_100205FCC((uint64_t)v31 + 7, v18, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Bool, v19, v20, v21, v22, v30, v31[0]);
    sub_10000E410();
  }
  else
  {
    v23 = sub_10000E410();
    sub_100206088(v23, &qword_1002B34C0, v24, v25, v26, v27, v28, v29);
  }
  sub_1000C26D8();
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
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
  uint64_t v30[10];

  v2 = sub_1002061B0(a1, a2);
  v9 = sub_1002060D0(v2, (uint64_t)&type metadata for String, v3, v4, v5, v6, v7, v8);
  v10 = sub_100206368(v9, "__swift_objectForKeyedSubscript:");
  v11 = sub_10005FF20();
  if (v10)
  {
    sub_100206260(v11, v12);
    v13 = sub_10000F718();
  }
  else
  {
    v17 = sub_10020607C();
  }
  sub_100205FD8(v13, v14, &qword_1002B34C0, v15, v16, v17);
  if (v30[9])
  {
    sub_100205FCC((uint64_t)v30, v18, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Data, v19, v20, v21, v22, v30[0], v30[1]);
    sub_10000E410();
  }
  else
  {
    v23 = sub_10000E410();
    sub_100206088(v23, &qword_1002B34C0, v24, v25, v26, v27, v28, v29);
  }
  sub_1000C26D8();
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
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
  uint64_t v30[10];

  v2 = sub_1002061B0(a1, a2);
  v9 = sub_1002060D0(v2, (uint64_t)&type metadata for String, v3, v4, v5, v6, v7, v8);
  v10 = sub_100206368(v9, "__swift_objectForKeyedSubscript:");
  v11 = sub_10005FF20();
  if (v10)
  {
    sub_100206260(v11, v12);
    v13 = sub_10000F718();
  }
  else
  {
    v17 = sub_10020607C();
  }
  sub_100205FD8(v13, v14, &qword_1002B34C0, v15, v16, v17);
  if (v30[9])
  {
    sub_100205FCC((uint64_t)v30, v18, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for String, v19, v20, v21, v22, v30[0], v30[1]);
    sub_10000E410();
  }
  else
  {
    v23 = sub_10000E410();
    sub_100206088(v23, &qword_1002B34C0, v24, v25, v26, v27, v28, v29);
  }
  sub_1000C26D8();
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
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
  uint64_t v32[9];

  v2 = sub_1002061B0(a1, a2);
  v9 = sub_1002060D0(v2, (uint64_t)&type metadata for String, v3, v4, v5, v6, v7, v8);
  v10 = sub_100206368(v9, "__swift_objectForKeyedSubscript:");
  v11 = sub_10005FF20();
  if (v10)
  {
    sub_100206260(v11, v12);
    v13 = sub_10000F718();
  }
  else
  {
    v17 = sub_10020607C();
  }
  sub_100205FD8(v13, v14, &qword_1002B34C0, v15, v16, v17);
  if (v32[8])
  {
    v18 = sub_1000055B0(&qword_1002B6598);
    sub_100205FCC((uint64_t)v32, v19, (uint64_t)&type metadata for Any + 8, v18, v20, v21, v22, v23, v31, v32[0]);
    sub_10000E410();
  }
  else
  {
    v24 = sub_10000E410();
    sub_100206088(v24, &qword_1002B34C0, v25, v26, v27, v28, v29, v30);
  }
  sub_1000C26D8();
}

void sub_1001F9678(uint64_t *a1@<X1>, _BYTE *a2@<X8>)
{
  char v3;

  HIDServiceProperties.subscript.getter(*a1, a1[1]);
  *a2 = v3;
}

void sub_1001F96A4(char *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  char v4;

  v3 = *a3;
  v4 = *a1;
  swift_bridgeObjectRetain();
  HIDServiceProperties.subscript.setter(v4, v3);
}

void HIDServiceProperties.subscript.setter(char a1, uint64_t a2)
{
  Class isa;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a1 == 2)
    isa = 0;
  else
    isa = Bool._bridgeToObjectiveC()().super.super.isa;
  v4 = sub_1000103C0();
  v11 = sub_10020648C(v4, (uint64_t)&type metadata for String, v5, v6, v7, v8, v9, v10, a2);
  sub_1002063AC(v11, "__swift_setObject:forKeyedSubscript:");
  sub_10000E410();

  sub_100079914();
  sub_100026914();
}

void HIDServiceProperties.subscript.modify()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  sub_1000F3FA4();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v7 = malloc(0x60uLL);
  *v6 = v7;
  *((_QWORD *)v7 + 4) = v4;
  *((_QWORD *)v7 + 9) = v2;
  *((_QWORD *)v7 + 10) = v0;
  *((_QWORD *)v7 + 8) = v4;
  v8 = sub_100206150((uint64_t)v7);
  v9 = sub_100206484(v8, (uint64_t)&type metadata for String);
  v10 = sub_100206300(v9, "__swift_objectForKeyedSubscript:");
  sub_1002062F4();
  if (v4)
  {
    sub_1002062C0();
    v11 = sub_10002DA70();
  }
  else
  {
    sub_1002064DC();
  }
  sub_1002062CC(v11, v12, &qword_1002B34C0);
  if (!*((_QWORD *)v7 + 3))
  {
    v14 = sub_10000E594();
    sub_1002064C4(v14, &qword_1002B34C0);
LABEL_9:
    v13 = 2;
    goto LABEL_10;
  }
  if ((sub_1000AAF18((uint64_t)v7 + 89, (uint64_t)v7, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Bool) & 1) == 0)
  {
    sub_10000E594();
    goto LABEL_9;
  }
  v13 = *((_BYTE *)v7 + 89);
  sub_10000E594();
LABEL_10:
  *((_BYTE *)v7 + 88) = v13;
  sub_10002D8A4();
}

{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;

  sub_1000F3FA4();
  v4 = sub_100206620();
  *v2 = v4;
  v4[4] = v3;
  v4[13] = v1;
  v4[14] = v0;
  v4[12] = v3;
  v5 = sub_100206150((uint64_t)v4);
  v6 = sub_100206484(v5, (uint64_t)&type metadata for String);
  v7 = sub_100206300(v6, "__swift_objectForKeyedSubscript:");
  sub_1002062F4();
  if (v3)
  {
    sub_1002062C0();
    v8 = sub_10002DA70();
  }
  else
  {
    sub_1002064DC();
  }
  sub_1002062CC(v8, v9, &qword_1002B34C0);
  if (v4[3])
  {
    v10 = sub_1000AAF18((uint64_t)(v4 + 10), (uint64_t)v4, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Data);
    v11 = v4[10];
    v12 = v4[11];
    sub_10000E594();
    if (v10)
      v13 = v11;
    else
      v13 = 0;
    v14 = 0xF000000000000000;
    if (v10)
      v14 = v12;
  }
  else
  {
    v15 = sub_10000E594();
    sub_1002064C4(v15, &qword_1002B34C0);
    v13 = 0;
    v14 = 0xF000000000000000;
  }
  v4[8] = v13;
  v4[9] = v14;
  sub_10002D8A4();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;

  sub_1000F3FA4();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v7 = malloc(0x70uLL);
  *v6 = v7;
  v7[4] = v4;
  v7[12] = v2;
  v7[13] = v0;
  v7[11] = v4;
  v8 = sub_100206150((uint64_t)v7);
  v9 = sub_100206484(v8, (uint64_t)&type metadata for String);
  v10 = sub_100206300(v9, "__swift_objectForKeyedSubscript:");
  sub_1002062F4();
  if (v4)
  {
    sub_1002062C0();
    v11 = sub_10002DA70();
  }
  else
  {
    sub_1002064DC();
  }
  sub_1002062CC(v11, v12, &qword_1002B34C0);
  if (v7[3])
  {
    v13 = sub_1000AAF18((uint64_t)(v7 + 10), (uint64_t)v7, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int);
    v14 = v7[10];
    sub_10000E594();
    if (v13)
      v15 = v14;
    else
      v15 = 0;
    v16 = v13 ^ 1;
  }
  else
  {
    v17 = sub_10000E594();
    sub_1002064C4(v17, &qword_1002B34C0);
    v15 = 0;
    v16 = 1;
  }
  v7[8] = v15;
  *((_BYTE *)v7 + 72) = v16;
  sub_10002D8A4();
}

{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_1000F3FA4();
  v4 = sub_100206620();
  *v2 = v4;
  v4[4] = v3;
  v4[13] = v1;
  v4[14] = v0;
  v4[12] = v3;
  v5 = sub_100206150((uint64_t)v4);
  v6 = sub_100206484(v5, (uint64_t)&type metadata for String);
  v7 = sub_100206300(v6, "__swift_objectForKeyedSubscript:");
  sub_1002062F4();
  if (v3)
  {
    sub_1002062C0();
    v8 = sub_10002DA70();
  }
  else
  {
    sub_1002064DC();
  }
  sub_1002062CC(v8, v9, &qword_1002B34C0);
  if (!v4[3])
  {
    v12 = sub_10000E594();
    sub_1002064C4(v12, &qword_1002B34C0);
LABEL_9:
    v10 = 0;
    v11 = 0;
    goto LABEL_10;
  }
  if ((sub_1000AAF18((uint64_t)(v4 + 10), (uint64_t)v4, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for String) & 1) == 0)
  {
    sub_10000E594();
    goto LABEL_9;
  }
  v10 = v4[10];
  v11 = v4[11];
  sub_10000E594();
LABEL_10:
  v4[8] = v10;
  v4[9] = v11;
  sub_10002D8A4();
}

{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  sub_1000F3FA4();
  v4 = sub_1002063BC();
  *v2 = v4;
  v4[4] = v3;
  v4[11] = v1;
  v4[12] = v0;
  v4[10] = v3;
  v5 = sub_100206150((uint64_t)v4);
  v6 = sub_100206484(v5, (uint64_t)&type metadata for String);
  v7 = sub_100206300(v6, "__swift_objectForKeyedSubscript:");
  sub_1002062F4();
  if (v3)
  {
    sub_1002062C0();
    v8 = sub_10002DA70();
  }
  else
  {
    sub_1002064DC();
  }
  sub_1002062CC(v8, v9, &qword_1002B34C0);
  if (!v4[3])
  {
    v13 = sub_10000E594();
    sub_1002064C4(v13, &qword_1002B34C0);
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  sub_100060018(v10, &qword_1002B0900, NSArray_ptr);
  if ((sub_1000AAF18((uint64_t)(v4 + 9), (uint64_t)v4, (uint64_t)&type metadata for Any + 8, v11) & 1) == 0)
  {
    sub_10000E594();
    goto LABEL_9;
  }
  v12 = v4[9];
  sub_10000E594();
LABEL_10:
  v4[8] = v12;
  sub_10002D8A4();
}

{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  sub_1000F3FA4();
  v4 = sub_1002063BC();
  *v2 = v4;
  v4[4] = v3;
  v4[11] = v1;
  v4[12] = v0;
  v4[10] = v3;
  v5 = sub_100206150((uint64_t)v4);
  v6 = sub_100206484(v5, (uint64_t)&type metadata for String);
  v7 = sub_100206300(v6, "__swift_objectForKeyedSubscript:");
  sub_1002062F4();
  if (v3)
  {
    sub_1002062C0();
    v8 = sub_10002DA70();
  }
  else
  {
    sub_1002064DC();
  }
  sub_1002062CC(v8, v9, &qword_1002B34C0);
  if (!v4[3])
  {
    v13 = sub_10000E594();
    sub_1002064C4(v13, &qword_1002B34C0);
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  sub_100060018(v10, &qword_1002B0910, NSDictionary_ptr);
  if ((sub_1000AAF18((uint64_t)(v4 + 9), (uint64_t)v4, (uint64_t)&type metadata for Any + 8, v11) & 1) == 0)
  {
    sub_10000E594();
    goto LABEL_9;
  }
  v12 = v4[9];
  sub_10000E594();
LABEL_10:
  v4[8] = v12;
  sub_10002D8A4();
}

{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_1000F3FA4();
  v4 = sub_1002063BC();
  *v2 = v4;
  v4[4] = v3;
  v4[11] = v1;
  v4[12] = v0;
  v4[10] = v3;
  v5 = sub_100206150((uint64_t)v4);
  v6 = sub_100206484(v5, (uint64_t)&type metadata for String);
  v7 = sub_100206300(v6, "__swift_objectForKeyedSubscript:");
  sub_1002062F4();
  if (v3)
  {
    sub_1002062C0();
    v8 = sub_10002DA70();
  }
  else
  {
    sub_1002064DC();
  }
  sub_1002062CC(v8, v9, &qword_1002B34C0);
  if (!v4[3])
  {
    v12 = sub_10000E594();
    sub_1002064C4(v12, &qword_1002B34C0);
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  v10 = sub_1000055B0(&qword_1002B6598);
  if ((sub_1000AAF18((uint64_t)(v4 + 9), (uint64_t)v4, (uint64_t)&type metadata for Any + 8, v10) & 1) == 0)
  {
    sub_10000E594();
    goto LABEL_9;
  }
  v11 = v4[9];
  sub_10000E594();
LABEL_10:
  v4[8] = v11;
  sub_10002D8A4();
}

void sub_1001F9860(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  char v3;

  v1 = *(void **)a1;
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 64);
  v3 = *(_BYTE *)(*(_QWORD *)a1 + 88);
  sub_100043360();
  HIDServiceProperties.subscript.setter(v3, v2);
  sub_10005FFE4(v1);
}

uint64_t sub_1001F9974(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *a3;
  v4 = *a1;
  v5 = a1[1];
  swift_bridgeObjectRetain();
  sub_100025168(v4, v5);
  return HIDServiceProperties.subscript.setter(v4, v5, v3);
}

uint64_t HIDServiceProperties.subscript.setter(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v7;
  Class isa;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v7 = *(void **)(v3 + 8);
  if (a2 >> 60 == 15)
    isa = 0;
  else
    isa = Data._bridgeToObjectiveC()().super.isa;
  v9 = sub_1000103C0();
  objc_msgSend(v7, "__swift_setObject:forKeyedSubscript:", isa, sub_10020648C(v9, (uint64_t)&type metadata for String, v10, v11, v12, v13, v14, v15, a3));
  sub_100022AD8(a1, a2);
  sub_10000E410();

  return sub_10000F718();
}

void sub_1001F9B80()
{
  char v0;
  char v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  sub_1000F3FA4();
  v1 = v0;
  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 64);
  v5 = *(_QWORD *)(*v2 + 72);
  sub_1000432E0();
  if ((v1 & 1) != 0)
  {
    sub_100025168(v4, v5);
    sub_100206688();
    sub_100022AD8(*(_QWORD *)(v3 + 64), *(_QWORD *)(v3 + 72));
  }
  else
  {
    sub_100206688();
  }
  sub_100079700((void *)v3);
}

uint64_t HIDServiceProperties.subscript.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
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
  uint64_t v32;
  uint64_t v33[9];

  v2 = sub_1002061B0(a1, a2);
  v9 = sub_1002060D0(v2, (uint64_t)&type metadata for String, v3, v4, v5, v6, v7, v8);
  v10 = sub_100206368(v9, "__swift_objectForKeyedSubscript:");
  v11 = sub_10005FF20();
  if (v10)
  {
    sub_100206260(v11, v12);
    v13 = sub_10000F718();
  }
  else
  {
    v17 = sub_10020607C();
  }
  sub_100205FD8(v13, v14, &qword_1002B34C0, v15, v16, v17);
  if (v33[8])
  {
    if (sub_100205FCC((uint64_t)v33, v18, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int, v19, v20, v21, v22, v32, v33[0]))v23 = v33[0];
    else
      v23 = 0;
    sub_10000E410();
  }
  else
  {
    v24 = sub_10000E410();
    sub_100206088(v24, &qword_1002B34C0, v25, v26, v27, v28, v29, v30);
    return 0;
  }
  return v23;
}

uint64_t sub_1001F9CC0@<X0>(uint64_t *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = HIDServiceProperties.subscript.getter(*a1, a1[1]);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_1001F9CF4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a3;
  v4 = *(_QWORD *)a1;
  v5 = *(_BYTE *)(a1 + 8);
  swift_bridgeObjectRetain();
  HIDServiceProperties.subscript.setter(v4, v5, v3);
}

void HIDServiceProperties.subscript.setter(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;
  void *v5;
  NSNumber v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(void **)(v3 + 8);
  if ((a2 & 1) != 0)
    v6.super.super.isa = 0;
  else
    v6.super.super.isa = Int._bridgeToObjectiveC()().super.super.isa;
  v7 = sub_1000103C0();
  objc_msgSend(v5, "__swift_setObject:forKeyedSubscript:", v6.super.super.isa, sub_10020648C(v7, (uint64_t)&type metadata for String, v8, v9, v10, v11, v12, v13, a3));
  sub_10000E410();

  sub_100079914();
  sub_100026914();
}

void sub_1001F9EC8(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  v1 = *(void **)a1;
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 88);
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 64);
  v4 = *(_BYTE *)(*(_QWORD *)a1 + 72);
  sub_100043360();
  HIDServiceProperties.subscript.setter(v3, v4, v2);
  sub_10005FFE4(v1);
}

void sub_1001F9FE0(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(_QWORD, _QWORD, uint64_t, _QWORD)@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v6;

  *a5 = a4(*a2, a2[1], a3, *(_QWORD *)(a1 + 8));
  a5[1] = v6;
  sub_1000050D4();
}

void sub_1001FA00C(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a3;
  v4 = *a1;
  v5 = a1[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  HIDServiceProperties.subscript.setter(v4, v5, v3);
}

void HIDServiceProperties.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a2)
  {
    v4 = String._bridgeToObjectiveC()();
    sub_10000E50C();
  }
  else
  {
    v4 = 0;
  }
  v5 = sub_1000103C0();
  v12 = sub_10020648C(v5, (uint64_t)&type metadata for String, v6, v7, v8, v9, v10, v11, a3);
  sub_1002063AC(v12, "__swift_setObject:forKeyedSubscript:");
  sub_10000E410();

  sub_100079914();
  sub_1000F00A0();
}

void sub_1001FA1CC(void **a1, char a2)
{
  void *v2;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    sub_100040544();
    sub_1000432E0();
    sub_10020669C();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1000432E0();
    sub_10020669C();
  }
  sub_10005FFE4(v2);
}

uint64_t HIDServiceProperties.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sub_1001FA38C(a1, a2, a3, a4, &qword_1002B0900, NSArray_ptr);
}

{
  return sub_1001FA38C(a1, a2, a3, a4, &qword_1002B0910, NSDictionary_ptr);
}

uint64_t sub_1001FA23C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t result;

  result = HIDServiceProperties.subscript.getter(*a2, a2[1], a3, *(void **)(a1 + 8));
  *a4 = result;
  return result;
}

void sub_1001FA36C()
{
  sub_1001FA654();
}

uint64_t sub_1001FA38C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, unint64_t *a5, _QWORD *a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
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
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[8];

  v9 = sub_1002061B0(a1, a2);
  v16 = objc_msgSend(a4, "__swift_objectForKeyedSubscript:", sub_1002060D0(v9, (uint64_t)&type metadata for String, v10, v11, v12, v13, v14, v15));
  sub_10002DA70();
  if (v16)
  {
    _bridgeAnyObjectToAny(_:)(v39, v16);
    v17 = sub_100079914();
  }
  else
  {
    v21 = sub_10020607C();
  }
  sub_100205FD8(v17, v18, &qword_1002B34C0, v19, v20, v21);
  if (!v39[7])
  {
    v29 = sub_10000E410();
    sub_100206088(v29, &qword_1002B34C0, v30, v31, v32, v33, v34, v35);
    return 0;
  }
  sub_10005FC6C(0, a5, a6);
  if (!sub_100205FCC((uint64_t)&v38, v23, (uint64_t)&type metadata for Any + 8, v22, v24, v25, v26, v27, v37, v38))
  {
    sub_10000E410();
    return 0;
  }
  v28 = v38;
  sub_10000E410();
  return v28;
}

uint64_t sub_1001FA488@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t result;

  result = HIDServiceProperties.subscript.getter(*a2, a2[1], a3, *(void **)(a1 + 8));
  *a4 = result;
  return result;
}

void sub_1001FA4B4(id *a1, uint64_t a2, uint64_t *a3, uint64_t a4, void (*a5)(id, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  v6 = *a3;
  v7 = a3[1];
  v8 = *a1;
  v9 = *a1;
  sub_100040544();
  a5(v8, v6, v7);
  sub_10002644C();
}

void _s8HIDUtils20HIDServicePropertiesVySo7NSArrayCSgAA0B11PropertyKeyVcis_0(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  swift_bridgeObjectRetain();
  v10 = sub_10020648C(v3, (uint64_t)&type metadata for String, v4, v5, v6, v7, v8, v9, a2);
  sub_1002063AC(v10, "__swift_setObject:forKeyedSubscript:");
  sub_10000E410();

  sub_100079914();
  sub_100026914();
}

void sub_1001FA654()
{
  uint64_t v0;
  void *v1;
  id *v2;
  char v3;
  id v4;

  sub_1000F3FA4();
  v1 = *(void **)v0;
  v2 = (id *)(*(_QWORD *)v0 + 64);
  if ((v3 & 1) != 0)
  {
    v4 = *(id *)(*(_QWORD *)v0 + 64);
    sub_1000432E0();
    sub_100206738();

  }
  else
  {
    sub_1000432E0();
    sub_100206738();
  }
  sub_100079700(v1);
}

void sub_1001FA77C(uint64_t *a1@<X1>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  HIDServiceProperties.subscript.getter(*a1, a1[1]);
  *a2 = v3;
}

void sub_1001FA7A8(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a3;
  v4 = *a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  HIDServiceProperties.subscript.setter(v4, v3);
}

void HIDServiceProperties.subscript.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a1)
  {
    Dictionary._bridgeToObjectiveC()();
    sub_10000E50C();
  }
  v3 = sub_1000103C0();
  v10 = sub_10020648C(v3, (uint64_t)&type metadata for String, v4, v5, v6, v7, v8, v9, a2);
  sub_1002063AC(v10, "__swift_setObject:forKeyedSubscript:");
  sub_10000E410();
  sub_10005FF20();
  sub_100079914();
  sub_1000F00A0();
}

void sub_1001FA97C(void **a1, char a2)
{
  void *v2;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    sub_100043360();
    sub_100040544();
    sub_1002067B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_100040544();
    sub_1002067B0();
  }
  sub_10005FFE4(v2);
}

void HIDServiceProperties.accelParametricCurves.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
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
  uint64_t v31[9];

  sub_1002064A0();
  v31[1] = v3;
  v31[2] = v4;
  v8 = sub_1002064D4(v5, (uint64_t)&type metadata for String, v6, v7);
  v9 = sub_100032410(v8, "__swift_objectForKeyedSubscript:");
  v10 = sub_100206028();
  if (a2)
  {
    sub_10020601C(v10, v11);
    v12 = sub_100012644();
  }
  else
  {
    v16 = sub_10020607C();
  }
  sub_100205FD8(v12, v13, &qword_1002B34C0, v14, v15, v16);
  if (v31[8])
  {
    sub_100060018(v17, &qword_1002B0900, NSArray_ptr);
    if ((sub_100205FCC((uint64_t)v31, v25, (uint64_t)&type metadata for Any + 8, v24, v26, v27, v28, v29, v30, v31[0]) & 1) != 0)
    {
      sub_1002067C0();
      sub_100010BBC();
    }
  }
  else
  {
    sub_100206088(v17, &qword_1002B34C0, v18, v19, v20, v21, v22, v23);
  }
  sub_1000C26D8();
}

void sub_1001FAA9C(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  HIDServiceProperties.accelParametricCurves.getter(a1, *(_QWORD *)(a1 + 8));
  *a2 = v3;
}

uint64_t sub_1001FAAC4()
{
  objc_class *v0;

  swift_bridgeObjectRetain();
  return HIDServiceProperties.accelParametricCurves.setter(v0);
}

uint64_t HIDServiceProperties.accelParametricCurves.setter(objc_class *a1)
{
  return sub_1001FDB4C(a1, 0x6C65636341444948);
}

void __swiftcall HIDServiceProperties.HIDAccelCurve.init(dictionaryRepresentation:)(HIDUtils::HIDServiceProperties::HIDAccelCurve_optional *__return_ptr retstr, NSDictionary dictionaryRepresentation)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
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
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
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
  int v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
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
  int v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
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
  int v106;
  int v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char v116;
  uint64_t v117;
  id v118;
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
  char v134;
  char v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  id v144;
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
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  int v160;
  int v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  id v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  int v185;
  uint64_t v186;
  char v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  id v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  int v211;
  uint64_t v212;
  char v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  id v222;
  uint64_t v223;
  char v224;
  char v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  char v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  char v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  char v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  char v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  char v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  char v479;
  uint64_t v480;
  char v481;
  uint64_t v482;
  char v483;
  uint64_t v484;
  char v485;
  uint64_t v486;
  char v487;
  uint64_t v488;
  char v489;
  uint64_t v490;
  char v491;
  _BYTE v492[24];
  uint64_t v493;

  sub_1002062B4();
  v475 = v4;
  sub_1002063D0(v5, (uint64_t)&type metadata for String, v6, v7, v8, v9, v10, v11, v226, v243, v261, v280, v299, v317, v336, v354, v373, v391, v410,
    v428,
    (uint64_t)retstr,
    v465,
    v466,
    v467,
    v468,
    v469,
    v470,
    v471,
    v472,
    v473,
    17);
  v12 = sub_1001A2C10(dictionaryRepresentation.super.isa, "__swift_objectForKeyedSubscript:");
  sub_1002061A4();
  if (v2)
  {
    sub_10020628C();
    v13 = sub_10005FF20();
  }
  else
  {
    sub_100206494();
  }
  sub_100206280(v13, v14, &qword_1002B34C0, v15, v16, v17, v18, v19, v227, v244, v262, v281, v300, v318, v337, v355, v374, v392, v411,
    v429,
    v448,
    v465,
    v466,
    v467,
    v468,
    v469,
    v470,
    v471,
    v472,
    v473,
    v474);
  if (v477)
  {
    sub_1000AAF18((uint64_t)&v465, (uint64_t)&v474, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int);
    sub_100206334();
    v431 = v27;
    v29 = v28 ^ 1;
  }
  else
  {
    sub_100206428(v20, &qword_1002B34C0, v21, v22, v23, v24, v25, v26, v228, v245, v263, v282, v301, v319, v338, v356, v375, v393, v412,
      v430,
      v449,
      v465,
      v466,
      v467,
      v468,
      v469,
      v470,
      v471,
      v472,
      v473,
      v474);
    v431 = 0;
    v29 = 1;
  }
  HIDWORD(v412) = v29;
  sub_100206324();
  v37 = sub_1002063D0(v30, (uint64_t)&type metadata for String, v31, v32, v33, v34, v35, v36, v228, v245, v263, v282, v301, v319, v338, v356, v375, v393, v412,
          v431,
          v449,
          v465,
          v466,
          v467,
          v468,
          v469,
          v470,
          v471,
          v472,
          v473,
          v474);
  v38 = sub_100206128(v37);
  sub_1002061A4();
  if (v2)
  {
    sub_10020628C();
    v39 = sub_10005FF20();
  }
  else
  {
    sub_100206494();
  }
  sub_100206280(v39, v40, &qword_1002B34C0, v41, v42, v43, v44, v45, v229, v246, v264, v283, v302, v320, v339, v357, v376, v394, v413,
    v432,
    v450,
    v465,
    v466,
    v467,
    v468,
    v469,
    v470,
    v471,
    v472,
    v473,
    v474);
  if (v477)
  {
    sub_1000AAF18((uint64_t)&v465, (uint64_t)&v474, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int);
    sub_100206334();
    v396 = v53;
    v55 = v54 ^ 1;
  }
  else
  {
    sub_100206428(v46, &qword_1002B34C0, v47, v48, v49, v50, v51, v52, v230, v247, v265, v284, v303, v321, v340, v358, v377, v395, v414,
      v433,
      v451,
      v465,
      v466,
      v467,
      v468,
      v469,
      v470,
      v471,
      v472,
      v473,
      v474);
    v396 = 0;
    v55 = 1;
  }
  HIDWORD(v377) = v55;
  sub_100206324();
  v63 = sub_1002063D0(v56, (uint64_t)&type metadata for String, v57, v58, v59, v60, v61, v62, v230, v247, v265, v284, v303, v321, v340, v358, v377, v396, v414,
          v433,
          v451,
          v465,
          v466,
          v467,
          v468,
          v469,
          v470,
          v471,
          v472,
          v473,
          v474);
  v64 = sub_100206128(v63);
  sub_1002061A4();
  if (v2)
  {
    sub_10020628C();
    v65 = sub_10005FF20();
  }
  else
  {
    sub_100206494();
  }
  sub_100206280(v65, v66, &qword_1002B34C0, v67, v68, v69, v70, v71, v231, v248, v266, v285, v304, v322, v341, v359, v378, v397, v415,
    v434,
    v452,
    v465,
    v466,
    v467,
    v468,
    v469,
    v470,
    v471,
    v472,
    v473,
    v474);
  if (v477)
  {
    sub_1000AAF18((uint64_t)&v465, (uint64_t)&v474, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int);
    sub_100206334();
    v361 = v79;
    v81 = v80 ^ 1;
  }
  else
  {
    sub_100206428(v72, &qword_1002B34C0, v73, v74, v75, v76, v77, v78, v232, v249, v267, v286, v305, v323, v342, v360, v379, v398, v416,
      v435,
      v453,
      v465,
      v466,
      v467,
      v468,
      v469,
      v470,
      v471,
      v472,
      v473,
      v474);
    v361 = 0;
    v81 = 1;
  }
  HIDWORD(v342) = v81;
  sub_100206324();
  v89 = sub_1002063D0(v82, (uint64_t)&type metadata for String, v83, v84, v85, v86, v87, v88, v232, v249, v267, v286, v305, v323, v342, v361, v379, v398, v416,
          v435,
          v453,
          v465,
          v466,
          v467,
          v468,
          v469,
          v470,
          v471,
          v472,
          v473,
          v474);
  v90 = sub_100206128(v89);
  sub_1002061A4();
  if (v2)
  {
    sub_10020628C();
    v91 = sub_10005FF20();
  }
  else
  {
    sub_100206494();
  }
  sub_100206280(v91, v92, &qword_1002B34C0, v93, v94, v95, v96, v97, v233, v250, v268, v287, v306, v324, v343, v362, v380, v399, v417,
    v436,
    v454,
    v465,
    v466,
    v467,
    v468,
    v469,
    v470,
    v471,
    v472,
    v473,
    v474);
  if (v477)
  {
    sub_1000AAF18((uint64_t)&v465, (uint64_t)&v474, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int);
    sub_100206334();
    v326 = v105;
    v107 = v106 ^ 1;
  }
  else
  {
    sub_100206428(v98, &qword_1002B34C0, v99, v100, v101, v102, v103, v104, v234, v251, v269, v288, v307, v325, v344, v363, v381, v400, v418,
      v437,
      v455,
      v465,
      v466,
      v467,
      v468,
      v469,
      v470,
      v471,
      v472,
      v473,
      v474);
    v326 = 0;
    v107 = 1;
  }
  HIDWORD(v307) = v107;
  sub_1002061C4();
  v475 = v108;
  v117 = sub_1002063D0(v109, (uint64_t)&type metadata for String, v110, v111, v112, v113, v114, v115, v234, v251, v269, v288, v307, v326, v344, v363, v381, v400, v418,
           v437,
           v455,
           v465,
           v466,
           v467,
           v468,
           v469,
           v470,
           v471,
           v472,
           v473,
           v116);
  v118 = sub_100206128(v117);
  sub_1002061A4();
  if (v2)
  {
    sub_10020628C();
    v119 = sub_10005FF20();
  }
  else
  {
    sub_100206494();
  }
  sub_100206280(v119, v120, &qword_1002B34C0, v121, v122, v123, v124, v125, v235, v252, v270, v289, v308, v327, v345, v364, v382, v401, v419,
    v438,
    v456,
    v465,
    v466,
    v467,
    v468,
    v469,
    v470,
    v471,
    v472,
    v473,
    v474);
  if (v477)
  {
    sub_1000AAF18((uint64_t)&v465, (uint64_t)&v474, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int);
    sub_100206334();
    v291 = v133;
    v135 = v134 ^ 1;
  }
  else
  {
    sub_100206428(v126, &qword_1002B34C0, v127, v128, v129, v130, v131, v132, v236, v253, v271, v290, v309, v328, v346, v365, v383, v402, v420,
      v439,
      v457,
      v465,
      v466,
      v467,
      v468,
      v469,
      v470,
      v471,
      v472,
      v473,
      v474);
    v291 = 0;
    v135 = 1;
  }
  sub_100206324();
  v143 = sub_1002063D0(v136, (uint64_t)&type metadata for String, v137, v138, v139, v140, v141, v142, v236, v253, v271, v291, v309, v328, v346, v365, v383, v402, v420,
           v439,
           v457,
           v465,
           v466,
           v467,
           v468,
           v469,
           v470,
           v471,
           v472,
           v473,
           v474);
  v144 = sub_100206128(v143);
  sub_1002061A4();
  if (v2)
  {
    sub_10020628C();
    v145 = sub_10005FF20();
  }
  else
  {
    sub_100206494();
  }
  sub_100206280(v145, v146, &qword_1002B34C0, v147, v148, v149, v150, v151, v237, v254, v272, v292, v310, v329, v347, v366, v384, v403, v421,
    v440,
    v458,
    v465,
    v466,
    v467,
    v468,
    v469,
    v470,
    v471,
    v472,
    v473,
    v474);
  if (v477)
  {
    sub_1000AAF18((uint64_t)&v465, (uint64_t)&v474, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int);
    sub_100206334();
    v274 = v159;
    v161 = v160 ^ 1;
  }
  else
  {
    sub_100206428(v152, &qword_1002B34C0, v153, v154, v155, v156, v157, v158, v238, v255, v273, v293, v311, v330, v348, v367, v385, v404, v422,
      v441,
      v459,
      v465,
      v466,
      v467,
      v468,
      v469,
      v470,
      v471,
      v472,
      v473,
      v474);
    v274 = 0;
    v161 = 1;
  }
  HIDWORD(v255) = v161;
  sub_100206324();
  v169 = sub_1002063D0(v162, (uint64_t)&type metadata for String, v163, v164, v165, v166, v167, v168, v238, v255, v274, v293, v311, v330, v348, v367, v385, v404, v422,
           v441,
           v459,
           v465,
           v466,
           v467,
           v468,
           v469,
           v470,
           v471,
           v472,
           v473,
           v474);
  v170 = sub_100206128(v169);
  sub_1002061A4();
  if (v2)
  {
    sub_10020628C();
    v171 = sub_10005FF20();
  }
  else
  {
    sub_100206494();
  }
  sub_100206280(v171, v172, &qword_1002B34C0, v173, v174, v175, v176, v177, v239, v256, v275, v294, v312, v331, v349, v368, v386, v405, v423,
    v442,
    v460,
    v465,
    v466,
    v467,
    v468,
    v469,
    v470,
    v471,
    v472,
    v473,
    v474);
  if (v477)
  {
    v185 = sub_1000AAF18((uint64_t)&v465, (uint64_t)&v474, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int);
    if (v185)
      v186 = v465;
    else
      v186 = 0;
    v187 = v185 ^ 1;
  }
  else
  {
    sub_100206428(v178, &qword_1002B34C0, v179, v180, v181, v182, v183, v184, v240, v257, v276, v295, v313, v332, v350, v369, v387, v406, v424,
      v443,
      v461,
      v465,
      v466,
      v467,
      v468,
      v469,
      v470,
      v471,
      v472,
      v473,
      v474);
    v186 = 0;
    v187 = 1;
  }
  sub_100206324();
  v195 = sub_1002063D0(v188, (uint64_t)&type metadata for String, v189, v190, v191, v192, v193, v194, v240, v257, v276, v295, v313, v332, v350, v369, v387, v406, v424,
           v443,
           v461,
           v465,
           v466,
           v467,
           v468,
           v469,
           v470,
           v471,
           v472,
           v473,
           v474);
  v196 = sub_100206128(v195);
  sub_1002061A4();
  if (v2)
  {
    sub_10020628C();
    v197 = sub_10005FF20();
  }
  else
  {
    sub_100206494();
  }
  sub_100206280(v197, v198, &qword_1002B34C0, v199, v200, v201, v202, v203, v241, v258, v277, v296, v314, v333, v351, v370, v388, v407, v425,
    v444,
    v462,
    v465,
    v466,
    v467,
    v468,
    v469,
    v470,
    v471,
    v472,
    v473,
    v474);
  if (v477)
  {
    v211 = sub_1000AAF18((uint64_t)&v465, (uint64_t)&v474, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int);
    if (v211)
      v212 = v465;
    else
      v212 = 0;
    v213 = v211 ^ 1;
  }
  else
  {
    sub_100206428(v204, &qword_1002B34C0, v205, v206, v207, v208, v209, v210, v242, v259, v278, v297, v315, v334, v352, v371, v389, v408, v426,
      v445,
      v463,
      v465,
      v466,
      v467,
      v468,
      v469,
      v470,
      v471,
      v472,
      v473,
      v474);
    v212 = 0;
    v213 = 1;
  }
  sub_100206324();
  v221 = sub_1002063D0(v214, (uint64_t)&type metadata for String, v215, v216, v217, v218, v219, v220, v242, v259, v278, v297, v315, v334, v352, v371, v389, v408, v426,
           v445,
           v463,
           v465,
           v466,
           v467,
           v468,
           v469,
           v470,
           v471,
           v472,
           v473,
           v474);
  v222 = sub_100206128(v221);
  sub_1002061A4();
  sub_100206360(&v474);
  sub_10005FF20();

  sub_10005FA70((uint64_t)&v474, (uint64_t)v492, &qword_1002B34C0);
  if (v493)
  {
    sub_1000AAF18((uint64_t)&v465, (uint64_t)v492, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int);
    sub_100206334();
    v225 = v224 ^ 1;
  }
  else
  {
    sub_10000E36C((uint64_t)v492, &qword_1002B34C0);
    v223 = 0;
    v225 = 1;
  }
  LOBYTE(v465) = v427;
  LOBYTE(v473) = v390;
  LOBYTE(v472) = v353;
  LOBYTE(v471) = v316;
  LOBYTE(v470) = v135;
  LOBYTE(v469) = v260;
  LOBYTE(v468) = v187;
  LOBYTE(v467) = v213;
  LOBYTE(v466) = v225;
  v474 = v446;
  LOBYTE(v475) = v427;
  v476 = v409;
  LOBYTE(v477) = v390;
  v478 = v372;
  v479 = v353;
  v480 = v335;
  v481 = v316;
  v482 = v298;
  v483 = v135;
  v484 = v279;
  v485 = v260;
  v486 = v186;
  v487 = v187;
  v488 = v212;
  v489 = v213;
  v490 = v223;
  v491 = v225;
  sub_1001FB3F4((uint64_t)&v474);
  sub_10005FA70((uint64_t)&v474, v464, &qword_1002B65A0);
}

Class HIDServiceProperties.HIDAccelCurve.dictionaryRepresentation.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t inited;
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
  Class isa;
  _BYTE v25[320];
  _BYTE v26[16];
  _BYTE v27[16];
  _BYTE v28[16];
  _BYTE v29[16];
  _BYTE v30[16];
  _BYTE v31[16];
  _BYTE v32[16];
  _BYTE v33[16];
  _BYTE v34[16];

  v1 = sub_1000055B0(&qword_1002B65A8);
  inited = swift_initStackObject(v1, v25);
  *(_OWORD *)(inited + 16) = xmmword_10021E830;
  sub_1002062B4();
  *(_QWORD *)(v3 + 32) = 0xD000000000000011;
  *(_QWORD *)(v3 + 40) = v4;
  sub_10020622C(v0, (uint64_t)v34);
  sub_10020622C((uint64_t)v34, inited + 48);
  sub_1002062B4();
  *(_QWORD *)(inited + 64) = v6;
  *(_QWORD *)(inited + 72) = v5;
  sub_10020622C(v0 + 16, (uint64_t)v33);
  sub_10020622C((uint64_t)v33, inited + 80);
  sub_1002062B4();
  *(_QWORD *)(inited + 96) = v8;
  *(_QWORD *)(inited + 104) = v7;
  sub_10020622C(v0 + 32, (uint64_t)v32);
  sub_10020622C((uint64_t)v32, inited + 112);
  sub_1002062B4();
  *(_QWORD *)(inited + 128) = v10;
  *(_QWORD *)(inited + 136) = v9;
  sub_10020622C(v0 + 48, (uint64_t)v31);
  sub_10020622C((uint64_t)v31, inited + 144);
  sub_1002061C4();
  *(_QWORD *)(inited + 160) = v11;
  *(_QWORD *)(inited + 168) = v12;
  sub_10020622C(v0 + 64, (uint64_t)v30);
  sub_10020622C((uint64_t)v30, inited + 176);
  sub_1002062B4();
  *(_QWORD *)(inited + 192) = v14;
  *(_QWORD *)(inited + 200) = v13;
  sub_10020622C(v0 + 80, (uint64_t)v29);
  sub_10020622C((uint64_t)v29, inited + 208);
  sub_1002062B4();
  *(_QWORD *)(inited + 224) = v16;
  *(_QWORD *)(inited + 232) = v15;
  sub_10020622C(v0 + 96, (uint64_t)v28);
  sub_10020622C((uint64_t)v28, inited + 240);
  sub_1002062B4();
  *(_QWORD *)(inited + 256) = v18;
  *(_QWORD *)(inited + 264) = v17;
  sub_10020622C(v0 + 112, (uint64_t)v27);
  sub_10020622C((uint64_t)v27, inited + 272);
  sub_1002062B4();
  *(_QWORD *)(inited + 288) = v20;
  *(_QWORD *)(inited + 296) = v19;
  sub_10020622C(v0 + 128, (uint64_t)v26);
  sub_10020622C((uint64_t)v26, inited + 304);
  v21 = sub_1000055B0(&qword_1002B65B0);
  v22 = Dictionary.init(dictionaryLiteral:)(inited, &type metadata for String, v21, &protocol witness table for String);
  sub_1001FF4A4(v22);
  sub_10000E410();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  sub_10000E594();
  return isa;
}

uint64_t sub_1001FB3F4(uint64_t result)
{
  *(_BYTE *)(result + 137) = 0;
  return result;
}

void HIDServiceProperties.accelParametricCurves.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = sub_1002065CC(a1);
  HIDServiceProperties.accelParametricCurves.getter(v2, v3);
  *v1 = v4;
  sub_1000050D4();
}

void sub_1001FB428(uint64_t *a1, char a2)
{
  sub_1001FDC9C(a1, a2, (void (*)(uint64_t))HIDServiceProperties.accelParametricCurves.setter);
}

void HIDServiceProperties.appleVendorSupported.getter()
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
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26[9];

  sub_100206380();
  sub_100206044();
  v8 = sub_1002060D0(v1, (uint64_t)&type metadata for String, v2, v3, v4, v5, v6, v7);
  v9 = sub_100032410(v8, "__swift_objectForKeyedSubscript:");
  v10 = sub_100206028();
  if (v0)
  {
    sub_10020601C(v10, v11);
    v12 = sub_100012644();
  }
  else
  {
    v16 = sub_10020607C();
  }
  sub_100205FD8(v12, v13, &qword_1002B34C0, v14, v15, v16);
  if (v26[8])
  {
    sub_100205FCC((uint64_t)v26 + 7, v18, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Bool, v21, v22, v23, v24, v25, v26[0]);
    sub_1002062A4();
  }
  else
  {
    sub_100206088(v17, &qword_1002B34C0, v19, v20, v21, v22, v23, v24);
  }
  sub_10000E59C();
}

void sub_1001FB4E4(_BYTE *a1@<X8>)
{
  char v2;

  HIDServiceProperties.appleVendorSupported.getter();
  *a1 = v2;
}

void HIDServiceProperties.appleVendorSupported.setter(char a1)
{
  sub_100206164(a1, 20);
}

void HIDServiceProperties.appleVendorSupported.modify(_QWORD *a1)
{
  uint64_t v1;
  char v2;

  sub_100206200(a1);
  HIDServiceProperties.appleVendorSupported.getter();
  *(_BYTE *)(v1 + 8) = v2;
  sub_1000050D4();
}

void sub_1001FB550(uint64_t a1)
{
  char v1;

  v1 = sub_100206430(a1);
  sub_100206164(v1, 20);
  sub_1000050D4();
}

void HIDServiceProperties.authenticatedDevice.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1001FB640(a1, a2, 0x69746E6568747541, 0xED00006465746163, a5, a6, a7, a8);
}

void sub_1001FB5A4(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, _BYTE *a8@<X8>)
{
  char v9;

  HIDServiceProperties.authenticatedDevice.getter(a1, *(_QWORD *)(a1 + 8), a2, a3, a4, a5, a6, a7);
  *a8 = v9;
}

void HIDServiceProperties.authenticatedDevice.setter()
{
  char v0;
  uint64_t v1;

  sub_100206650();
  HIDServiceProperties.subscript.setter(v0, v1);
}

void HIDServiceProperties.authenticatedDevice.modify(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v2 = sub_100206200(a1);
  HIDServiceProperties.authenticatedDevice.getter((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  *(_BYTE *)(v1 + 8) = v10;
  sub_1000050D4();
}

void sub_1001FB608(uint64_t a1)
{
  char v1;
  uint64_t v2;

  sub_100206430(a1);
  sub_100206650();
  HIDServiceProperties.subscript.setter(v1, v2);
  sub_1000050D4();
}

void HIDServiceProperties.builtIn.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1001FB640(a1, a2, 0x6E492D746C697542, 0xE800000000000000, a5, a6, a7, a8);
}

void sub_1001FB640(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27[9];

  v27[5] = a3;
  v27[6] = a4;
  v9 = sub_1002060D0(a1, (uint64_t)&type metadata for String, a3, a4, a5, a6, a7, a8);
  v10 = sub_100032410(v9, "__swift_objectForKeyedSubscript:");
  v11 = sub_100206028();
  if (a2)
  {
    sub_10020601C(v11, v12);
    v13 = sub_100012644();
  }
  else
  {
    v17 = sub_10020607C();
  }
  sub_100205FD8(v13, v14, &qword_1002B34C0, v15, v16, v17);
  if (v27[8])
  {
    sub_100205FCC((uint64_t)v27 + 7, v19, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Bool, v22, v23, v24, v25, v26, v27[0]);
    sub_1002062A4();
  }
  else
  {
    sub_100206088(v18, &qword_1002B34C0, v20, v21, v22, v23, v24, v25);
  }
  sub_10000E59C();
}

void sub_1001FB6E8(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, _BYTE *a8@<X8>)
{
  char v9;

  HIDServiceProperties.builtIn.getter(a1, *(_QWORD *)(a1 + 8), a2, a3, a4, a5, a6, a7);
  *a8 = v9;
}

void HIDServiceProperties.builtIn.setter(char a1)
{
  HIDServiceProperties.subscript.setter(a1, 0x6E492D746C697542);
}

void HIDServiceProperties.builtIn.modify(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v2 = sub_100206200(a1);
  HIDServiceProperties.builtIn.getter((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  *(_BYTE *)(v1 + 8) = v10;
  sub_1000050D4();
}

void sub_1001FB754(uint64_t a1)
{
  char v1;

  v1 = sub_100206430(a1);
  HIDServiceProperties.subscript.setter(v1, 0x6E492D746C697542);
  sub_1000050D4();
}

void HIDServiceProperties.capsLockDelay.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100206404();
  sub_1001FC208(v0, v1, v2, v3, v4, v5, v6, v7);
}

void sub_1001FB794()
{
  HIDServiceProperties.capsLockDelay.setter();
}

void HIDServiceProperties.capsLockDelay.setter()
{
  uint64_t v0;
  char v1;
  uint64_t v2;

  sub_100206404();
  HIDServiceProperties.subscript.setter(v0, v1, v2);
}

void HIDServiceProperties.capsLockDelay.modify(uint64_t a1)
{
  uint64_t v1;
  char v2;

  sub_100206034(a1);
  HIDServiceProperties.capsLockDelay.getter();
  sub_1002060D8(v1, v2);
  sub_1000050D4();
}

void sub_1001FB800()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_100206404();
  sub_1001FEBA4(v0, v1, v2);
}

void HIDServiceProperties.capsLockLanguageSwitch.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28[9];

  sub_100206044();
  v10 = sub_1002060D0(v3, (uint64_t)&type metadata for String, v4, v5, v6, v7, v8, v9);
  v11 = sub_100032410(v10, "__swift_objectForKeyedSubscript:");
  v12 = sub_100206028();
  if (a2)
  {
    sub_10020601C(v12, v13);
    v14 = sub_100012644();
  }
  else
  {
    v18 = sub_10020607C();
  }
  sub_100205FD8(v14, v15, &qword_1002B34C0, v16, v17, v18);
  if (v28[8])
  {
    sub_100205FCC((uint64_t)v28 + 7, v20, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Bool, v23, v24, v25, v26, v27, v28[0]);
    sub_1002062A4();
  }
  else
  {
    sub_100206088(v19, &qword_1002B34C0, v21, v22, v23, v24, v25, v26);
  }
  sub_10000E59C();
}

void sub_1001FB8C8(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  char v3;

  HIDServiceProperties.capsLockLanguageSwitch.getter(a1, *(_QWORD *)(a1 + 8));
  *a2 = v3;
}

void HIDServiceProperties.capsLockLanguageSwitch.setter(char a1)
{
  sub_100206164(a1, 22);
}

void HIDServiceProperties.capsLockLanguageSwitch.modify(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  char v4;

  v2 = sub_100206200(a1);
  HIDServiceProperties.capsLockLanguageSwitch.getter((uint64_t)v2, v3);
  *(_BYTE *)(v1 + 8) = v4;
  sub_1000050D4();
}

void sub_1001FB934(uint64_t a1)
{
  char v1;

  v1 = sub_100206430(a1);
  sub_100206164(v1, 22);
  sub_1000050D4();
}

void HIDServiceProperties.deviceUsagePairs.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
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
  void *v27[9];

  sub_100206780();
  sub_100206728();
  v4 = sub_1002064D4(v1, (uint64_t)&type metadata for String, v2, v3);
  v5 = sub_100032410(v4, "__swift_objectForKeyedSubscript:");
  v6 = sub_100206028();
  if (v0)
  {
    sub_10020601C(v6, v7);
    v8 = sub_100012644();
  }
  else
  {
    v12 = sub_10020607C();
  }
  sub_100205FD8(v8, v9, &qword_1002B34C0, v10, v11, v12);
  if (v27[8])
  {
    sub_100060018(v13, &qword_1002B0900, NSArray_ptr);
    if ((sub_100205FCC((uint64_t)v27, v21, (uint64_t)&type metadata for Any + 8, v20, v22, v23, v24, v25, v26, (uint64_t)v27[0]) & 1) != 0)
    {
      sub_1001F92D0(v27[0]);
      sub_100010BBC();
    }
  }
  else
  {
    sub_100206088(v13, &qword_1002B34C0, v14, v15, v16, v17, v18, v19);
  }
  sub_1000C26D8();
}

void sub_1001FBA40(_QWORD *a1@<X8>)
{
  uint64_t v2;

  HIDServiceProperties.deviceUsagePairs.getter();
  *a1 = v2;
}

uint64_t sub_1001FBA68()
{
  uint64_t v0;

  swift_bridgeObjectRetain();
  return HIDServiceProperties.deviceUsagePairs.setter(v0);
}

uint64_t HIDServiceProperties.deviceUsagePairs.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned __int16 *v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Class isa;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v3 = specialized ContiguousArray.reserveCapacity(_:)(v2);
    sub_100060018(v3, &qword_1002B0910, NSDictionary_ptr);
    v4 = (unsigned __int16 *)(a1 + 34);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      v4 += 2;
      v7 = sub_1000055B0(&qword_1002B65B8);
      v8 = sub_100206928(v7);
      *(_OWORD *)(v8 + 16) = xmmword_10021DE60;
      *(_QWORD *)(v8 + 32) = 0x7355656369766544;
      *(_QWORD *)(v8 + 40) = 0xEB00000000656761;
      *(_QWORD *)(v8 + 56) = &type metadata for String;
      *(_QWORD *)(v8 + 64) = v6;
      *(_QWORD *)(v8 + 88) = &type metadata for Int;
      *(_QWORD *)(v8 + 96) = 0x7355656369766544;
      *(_QWORD *)(v8 + 104) = 0xEF65676150656761;
      *(_QWORD *)(v8 + 152) = &type metadata for Int;
      *(_QWORD *)(v8 + 120) = &type metadata for String;
      *(_QWORD *)(v8 + 128) = v5;
      NSDictionary.init(dictionaryLiteral:)();
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(_swiftEmptyArrayStorage[2]);
      v9 = sub_1002068F0();
      specialized ContiguousArray._endMutation()(v9);
      --v2;
    }
    while (v2);
    v10 = swift_bridgeObjectRelease(a1);
  }
  else
  {
    v10 = sub_10000E410();
  }
  sub_100060018(v10, &qword_1002B0910, NSDictionary_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  sub_10000E410();
  sub_1000955C0();
  return HIDServiceProperties.subscript.setter(isa, 0xD000000000000010);
}

uint64_t sub_1001FBC3C(void *a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[24];
  uint64_t v12;

  *(_QWORD *)&v9 = 0x7355656369766544;
  *((_QWORD *)&v9 + 1) = 0xEB00000000656761;
  v2 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v9, &type metadata for String);
  v3 = objc_msgSend(a1, "__swift_objectForKeyedSubscript:", v2);
  swift_unknownObjectRelease(v2);
  if (v3)
  {
    _bridgeAnyObjectToAny(_:)(&v9, v3);
    swift_unknownObjectRelease(v3);
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
  }
  sub_10005FA70((uint64_t)&v9, (uint64_t)v11, &qword_1002B34C0);
  if (!v12)
  {

LABEL_14:
    sub_10000E36C((uint64_t)v11, &qword_1002B34C0);
    return 0;
  }
  if ((swift_dynamicCast(&v8, v11, (char *)&type metadata for Any + 8, &type metadata for Int, 6) & 1) != 0)
  {
    v4 = v8;
    *(_QWORD *)&v9 = 0x7355656369766544;
    *((_QWORD *)&v9 + 1) = 0xEF65676150656761;
    v5 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v9, &type metadata for String);
    v6 = objc_msgSend(a1, "__swift_objectForKeyedSubscript:", v5);
    swift_unknownObjectRelease(v5);
    if (v6)
    {
      _bridgeAnyObjectToAny(_:)(&v9, v6);
      swift_unknownObjectRelease(v6);

    }
    else
    {

      v9 = 0u;
      v10 = 0u;
    }
    sub_10005FA70((uint64_t)&v9, (uint64_t)v11, &qword_1002B34C0);
    if (v12)
    {
      if ((swift_dynamicCast(&v8, v11, (char *)&type metadata for Any + 8, &type metadata for Int, 6) & 1) != 0)
        return v4;
      return 0;
    }
    goto LABEL_14;
  }

  return 0;
}

void HIDServiceProperties.deviceUsagePairs.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  sub_1002065CC(a1);
  HIDServiceProperties.deviceUsagePairs.getter();
  *v1 = v2;
  sub_1000050D4();
}

void sub_1001FBE54(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v3 = sub_1000103C0();
    HIDServiceProperties.deviceUsagePairs.setter(v3);
    sub_10019DC50(v2);
  }
  else
  {
    HIDServiceProperties.deviceUsagePairs.setter(*a1);
    sub_1000050D4();
  }
}

void HIDServiceProperties.eventServiceProperties.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
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
  int v32;
  uint64_t v33;
  uint64_t v34[9];

  sub_100206044();
  v10 = sub_1002060D0(v3, (uint64_t)&type metadata for String, v4, v5, v6, v7, v8, v9);
  v11 = sub_100032410(v10, "__swift_objectForKeyedSubscript:");
  v12 = sub_100206028();
  if (a2)
  {
    sub_10020601C(v12, v13);
    v14 = sub_100012644();
  }
  else
  {
    v18 = sub_10020607C();
  }
  sub_100205FD8(v14, v15, &qword_1002B34C0, v16, v17, v18);
  if (v34[8])
  {
    v26 = sub_1000055B0(&qword_1002B6598);
    v32 = sub_100205FCC((uint64_t)v34, v27, (uint64_t)&type metadata for Any + 8, v26, v28, v29, v30, v31, v33, v34[0]);
    sub_100206318(v32, v34[0]);
  }
  else
  {
    sub_100206088(v19, &qword_1002B34C0, v20, v21, v22, v23, v24, v25);
  }
  sub_10000E59C();
}

void sub_1001FBF4C(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  HIDServiceProperties.eventServiceProperties.getter(a1, *(_QWORD *)(a1 + 8));
  *a2 = v3;
}

void sub_1001FBF74()
{
  uint64_t v0;

  swift_bridgeObjectRetain();
  HIDServiceProperties.eventServiceProperties.setter(v0);
}

void HIDServiceProperties.eventServiceProperties.setter(uint64_t a1)
{
  HIDServiceProperties.subscript.setter(a1, 0xD000000000000019);
}

void HIDServiceProperties.eventServiceProperties.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = sub_1002065CC(a1);
  HIDServiceProperties.eventServiceProperties.getter(v2, v3);
  *v1 = v4;
  sub_1000050D4();
}

void sub_1001FBFE4(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v3 = sub_1000103C0();
    sub_100206910(v3);
    sub_10019DC50(v2);
  }
  else
  {
    sub_1000955C0();
    sub_100206910(v2);
    sub_1000050D4();
  }
}

void HIDServiceProperties.deviceTypeHint.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_10020643C();
  sub_1001FC4F8(v0, v1, v2, v3, v4, v5, v6, v7);
}

void sub_1001FC048(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  HIDServiceProperties.deviceTypeHint.getter();
  *a1 = v2;
  a1[1] = v3;
}

void HIDServiceProperties.deviceTypeHint.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_10020643C();
  HIDServiceProperties.subscript.setter(v0, v1, v2);
}

void HIDServiceProperties.deviceTypeHint.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  sub_100206034(a1);
  HIDServiceProperties.deviceTypeHint.getter();
  *v1 = v2;
  v1[1] = v3;
  sub_1000050D4();
}

void sub_1001FC0AC()
{
  uint64_t v0;
  char v1;

  sub_10020643C();
  sub_1001FE3E8(v0, v1);
}

void HIDServiceProperties.fnKeyboardUsageMap.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  Swift::Int v35;
  uint64_t v36[10];

  sub_100206044();
  v10 = sub_1002060D0(v3, (uint64_t)&type metadata for String, v4, v5, v6, v7, v8, v9);
  v11 = sub_100032410(v10, "__swift_objectForKeyedSubscript:");
  v12 = sub_100206028();
  if (a2)
  {
    sub_10020601C(v12, v13);
    v14 = sub_100012644();
  }
  else
  {
    v18 = sub_10020607C();
  }
  sub_100205FD8(v14, v15, &qword_1002B34C0, v16, v17, v18);
  if (v36[9])
  {
    v27 = sub_100205FCC((uint64_t)v36, v20, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for String, v23, v24, v25, v26, v36[0], v36[1]);
    sub_10020623C(v27, v28, v29, v30, v31, v32, v33, v34, v36[0]);
  }
  else
  {
    sub_100206088(v19, &qword_1002B34C0, v21, v22, v23, v24, v25, v26);
    HIDServicePropertyKey.init(intValue:)(v35);
  }
  sub_10000E59C();
}

void sub_1001FC174(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  HIDServiceProperties.fnKeyboardUsageMap.getter(a1, *(_QWORD *)(a1 + 8));
  *a2 = v3;
  a2[1] = v4;
}

void HIDServiceProperties.fnKeyboardUsageMap.setter(uint64_t a1, uint64_t a2)
{
  sub_1002062EC(a1, a2, 18);
}

void HIDServiceProperties.fnKeyboardUsageMap.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = sub_100206034(a1);
  HIDServiceProperties.fnKeyboardUsageMap.getter(v2, v3);
  *v1 = v4;
  v1[1] = v5;
  sub_1000050D4();
}

void sub_1001FC1E0(uint64_t a1, char a2)
{
  sub_1002062E4(a1, a2);
}

void HIDServiceProperties.keyboardCountryCode.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100206584();
  sub_1001FC208(v0, v1, v2, v3, v4, v5, v6, v7);
}

void sub_1001FC208(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36[9];

  v36[5] = a3;
  v36[6] = a4;
  v9 = sub_1002060D0(a1, (uint64_t)&type metadata for String, a3, a4, a5, a6, a7, a8);
  v10 = sub_100032410(v9, "__swift_objectForKeyedSubscript:");
  v11 = sub_100206028();
  if (a2)
  {
    sub_10020601C(v11, v12);
    v13 = sub_100012644();
  }
  else
  {
    v17 = sub_10020607C();
  }
  sub_100205FD8(v13, v14, &qword_1002B34C0, v15, v16, v17);
  if (v36[8])
  {
    v26 = sub_100205FCC((uint64_t)v36, v19, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int, v22, v23, v24, v25, v34, v36[0]);
    sub_100206054(v26, v27, v28, v29, v30, v31, v32, v33, v35, v36[0]);
  }
  else
  {
    sub_100206088(v18, &qword_1002B34C0, v20, v21, v22, v23, v24, v25);
    HIDServicePropertyKey.intValue.getter();
  }
  sub_10000E59C();
}

void sub_1001FC2AC()
{
  HIDServiceProperties.keyboardCountryCode.setter();
}

void HIDServiceProperties.keyboardCountryCode.setter()
{
  uint64_t v0;
  char v1;
  uint64_t v2;

  sub_100206584();
  HIDServiceProperties.subscript.setter(v0, v1, v2);
}

void HIDServiceProperties.keyboardCountryCode.modify(uint64_t a1)
{
  uint64_t v1;
  char v2;

  sub_100206034(a1);
  HIDServiceProperties.keyboardCountryCode.getter();
  sub_1002060D8(v1, v2);
  sub_1000050D4();
}

void sub_1001FC318()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_100206584();
  sub_1001FEBA4(v0, v1, v2);
}

void HIDServiceProperties.keyboardLanguage.getter()
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
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  Swift::Int v33;
  uint64_t v34[10];

  sub_100206780();
  sub_100206044();
  v8 = sub_1002060D0(v1, (uint64_t)&type metadata for String, v2, v3, v4, v5, v6, v7);
  v9 = sub_100032410(v8, "__swift_objectForKeyedSubscript:");
  v10 = sub_100206028();
  if (v0)
  {
    sub_10020601C(v10, v11);
    v12 = sub_100012644();
  }
  else
  {
    v16 = sub_10020607C();
  }
  sub_100205FD8(v12, v13, &qword_1002B34C0, v14, v15, v16);
  if (v34[9])
  {
    v25 = sub_100205FCC((uint64_t)v34, v18, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for String, v21, v22, v23, v24, v34[0], v34[1]);
    sub_10020623C(v25, v26, v27, v28, v29, v30, v31, v32, v34[0]);
  }
  else
  {
    sub_100206088(v17, &qword_1002B34C0, v19, v20, v21, v22, v23, v24);
    HIDServicePropertyKey.init(intValue:)(v33);
  }
  sub_10000E59C();
}

void sub_1001FC3D8(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  HIDServiceProperties.keyboardLanguage.getter();
  *a1 = v2;
  a1[1] = v3;
}

void HIDServiceProperties.keyboardLanguage.setter(uint64_t a1, uint64_t a2)
{
  sub_1002062EC(a1, a2, 16);
}

void HIDServiceProperties.keyboardLanguage.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  sub_100206034(a1);
  HIDServiceProperties.keyboardLanguage.getter();
  *v1 = v2;
  v1[1] = v3;
  sub_1000050D4();
}

void sub_1001FC444(uint64_t a1, char a2)
{
  sub_1002062E4(a1, a2);
}

void HIDServiceProperties.keyboardStandardType.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100206564();
  sub_1001FC208(v0, v1, v2, v3, v4, v5, v6, v7);
}

void sub_1001FC46C()
{
  HIDServiceProperties.keyboardStandardType.setter();
}

void HIDServiceProperties.keyboardStandardType.setter()
{
  uint64_t v0;
  char v1;
  uint64_t v2;

  sub_100206564();
  HIDServiceProperties.subscript.setter(v0, v1, v2);
}

void HIDServiceProperties.keyboardStandardType.modify(uint64_t a1)
{
  uint64_t v1;
  char v2;

  sub_100206034(a1);
  HIDServiceProperties.keyboardStandardType.getter();
  sub_1002060D8(v1, v2);
  sub_1000050D4();
}

void sub_1001FC4D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_100206564();
  sub_1001FEBA4(v0, v1, v2);
}

void HIDServiceProperties.manufacturer.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100206544();
  sub_1001FC4F8(v0, v1, v2, v3, v4, v5, v6, v7);
}

void sub_1001FC4F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  Swift::Int v34;
  uint64_t v35[10];

  v35[6] = a3;
  v35[7] = a4;
  v9 = sub_1002060D0(a1, (uint64_t)&type metadata for String, a3, a4, a5, a6, a7, a8);
  v10 = sub_100032410(v9, "__swift_objectForKeyedSubscript:");
  v11 = sub_100206028();
  if (a2)
  {
    sub_10020601C(v11, v12);
    v13 = sub_100012644();
  }
  else
  {
    v17 = sub_10020607C();
  }
  sub_100205FD8(v13, v14, &qword_1002B34C0, v15, v16, v17);
  if (v35[9])
  {
    v26 = sub_100205FCC((uint64_t)v35, v19, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for String, v22, v23, v24, v25, v35[0], v35[1]);
    sub_10020623C(v26, v27, v28, v29, v30, v31, v32, v33, v35[0]);
  }
  else
  {
    sub_100206088(v18, &qword_1002B34C0, v20, v21, v22, v23, v24, v25);
    HIDServicePropertyKey.init(intValue:)(v34);
  }
  sub_10000E59C();
}

void sub_1001FC5A0(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  HIDServiceProperties.manufacturer.getter();
  *a1 = v2;
  a1[1] = v3;
}

void HIDServiceProperties.manufacturer.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_100206544();
  HIDServiceProperties.subscript.setter(v0, v1, v2);
}

void HIDServiceProperties.manufacturer.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  sub_100206034(a1);
  HIDServiceProperties.manufacturer.getter();
  *v1 = v2;
  v1[1] = v3;
  sub_1000050D4();
}

void sub_1001FC604()
{
  uint64_t v0;
  char v1;

  sub_100206544();
  sub_1001FE3E8(v0, v1);
}

void HIDServiceProperties.mouseAcceleration.getter()
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
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35[9];

  sub_100206380();
  sub_100206044();
  v8 = sub_1002060D0(v1, (uint64_t)&type metadata for String, v2, v3, v4, v5, v6, v7);
  v9 = sub_100032410(v8, "__swift_objectForKeyedSubscript:");
  v10 = sub_100206028();
  if (v0)
  {
    sub_10020601C(v10, v11);
    v12 = sub_100012644();
  }
  else
  {
    v16 = sub_10020607C();
  }
  sub_100205FD8(v12, v13, &qword_1002B34C0, v14, v15, v16);
  if (v35[8])
  {
    v25 = sub_100205FCC((uint64_t)v35, v18, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int, v21, v22, v23, v24, v33, v35[0]);
    sub_100206054(v25, v26, v27, v28, v29, v30, v31, v32, v34, v35[0]);
  }
  else
  {
    sub_100206088(v17, &qword_1002B34C0, v19, v20, v21, v22, v23, v24);
    HIDServicePropertyKey.intValue.getter();
  }
  sub_10000E59C();
}

void sub_1001FC6C0(uint64_t a1)
{
  HIDServiceProperties.mouseAcceleration.setter(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

void HIDServiceProperties.mouseAcceleration.setter(uint64_t a1, char a2)
{
  sub_10020606C(a1, a2 & 1, 20);
}

void HIDServiceProperties.mouseAcceleration.modify(uint64_t a1)
{
  uint64_t v1;
  char v2;

  sub_100206034(a1);
  HIDServiceProperties.mouseAcceleration.getter();
  sub_1002060D8(v1, v2);
  sub_1000050D4();
}

void sub_1001FC734(uint64_t a1, uint64_t a2)
{
  sub_100206074(a1, a2, 20);
}

void HIDServiceProperties.mouseScrollAcceleration.getter()
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
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35[9];

  sub_100206790();
  sub_100206044();
  v8 = sub_1002060D0(v1, (uint64_t)&type metadata for String, v2, v3, v4, v5, v6, v7);
  v9 = sub_100032410(v8, "__swift_objectForKeyedSubscript:");
  v10 = sub_100206028();
  if (v0)
  {
    sub_10020601C(v10, v11);
    v12 = sub_100012644();
  }
  else
  {
    v16 = sub_10020607C();
  }
  sub_100205FD8(v12, v13, &qword_1002B34C0, v14, v15, v16);
  if (v35[8])
  {
    v25 = sub_100205FCC((uint64_t)v35, v18, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int, v21, v22, v23, v24, v33, v35[0]);
    sub_100206054(v25, v26, v27, v28, v29, v30, v31, v32, v34, v35[0]);
  }
  else
  {
    sub_100206088(v17, &qword_1002B34C0, v19, v20, v21, v22, v23, v24);
    HIDServicePropertyKey.intValue.getter();
  }
  sub_10000E59C();
}

void sub_1001FC7F8(uint64_t a1)
{
  HIDServiceProperties.mouseScrollAcceleration.setter(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

void HIDServiceProperties.mouseScrollAcceleration.setter(uint64_t a1, char a2)
{
  sub_10020606C(a1, a2 & 1, 26);
}

void HIDServiceProperties.mouseScrollAcceleration.modify(uint64_t a1)
{
  uint64_t v1;
  char v2;

  sub_100206034(a1);
  HIDServiceProperties.mouseScrollAcceleration.getter();
  sub_1002060D8(v1, v2);
  sub_1000050D4();
}

void sub_1001FC86C(uint64_t a1, uint64_t a2)
{
  sub_100206074(a1, a2, 26);
}

void HIDServiceProperties.pointerAccelerationMultiplier.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37[9];

  sub_100206044();
  v10 = sub_1002060D0(v3, (uint64_t)&type metadata for String, v4, v5, v6, v7, v8, v9);
  v11 = sub_100032410(v10, "__swift_objectForKeyedSubscript:");
  v12 = sub_100206028();
  if (a2)
  {
    sub_10020601C(v12, v13);
    v14 = sub_100012644();
  }
  else
  {
    v18 = sub_10020607C();
  }
  sub_100205FD8(v14, v15, &qword_1002B34C0, v16, v17, v18);
  if (v37[8])
  {
    v27 = sub_100205FCC((uint64_t)v37, v20, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int, v23, v24, v25, v26, v35, v37[0]);
    sub_100206054(v27, v28, v29, v30, v31, v32, v33, v34, v36, v37[0]);
  }
  else
  {
    sub_100206088(v19, &qword_1002B34C0, v21, v22, v23, v24, v25, v26);
    HIDServicePropertyKey.intValue.getter();
  }
  sub_10000E59C();
}

void sub_1001FC938(uint64_t a1)
{
  HIDServiceProperties.pointerAccelerationMultiplier.setter(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

void HIDServiceProperties.pointerAccelerationMultiplier.setter(uint64_t a1, char a2)
{
  sub_10020606C(a1, a2 & 1, 32);
}

void HIDServiceProperties.pointerAccelerationMultiplier.modify(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  v1 = sub_100206034(a1);
  HIDServiceProperties.pointerAccelerationMultiplier.getter(v1, v2);
  sub_1002060D8(v3, v4);
  sub_1000050D4();
}

void sub_1001FC9AC(uint64_t a1, uint64_t a2)
{
  sub_100206074(a1, a2, 32);
}

void HIDServiceProperties.pointerAccelerationTable.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35[10];

  sub_100206044();
  v10 = sub_1002060D0(v3, (uint64_t)&type metadata for String, v4, v5, v6, v7, v8, v9);
  v11 = sub_100032410(v10, "__swift_objectForKeyedSubscript:");
  v12 = sub_100206028();
  if (a2)
  {
    sub_10020601C(v12, v13);
    v14 = sub_100012644();
  }
  else
  {
    v18 = sub_10020607C();
  }
  sub_100205FD8(v14, v15, &qword_1002B34C0, v16, v17, v18);
  if (v35[9])
  {
    v27 = sub_100205FCC((uint64_t)v35, v20, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Data, v23, v24, v25, v26, v35[0], v35[1]);
    sub_10020623C(v27, v28, v29, v30, v31, v32, v33, v34, v35[0]);
  }
  else
  {
    sub_100206088(v19, &qword_1002B34C0, v21, v22, v23, v24, v25, v26);
  }
  sub_10000E59C();
}

void sub_1001FCA84(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  HIDServiceProperties.pointerAccelerationTable.getter(a1, *(_QWORD *)(a1 + 8));
  *a2 = v3;
  a2[1] = v4;
}

uint64_t sub_1001FCAAC(uint64_t *a1)
{
  uint64_t v1;
  unint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  sub_100025168(*a1, v2);
  return HIDServiceProperties.pointerAccelerationTable.setter(v1, v2);
}

uint64_t HIDServiceProperties.pointerAccelerationTable.setter(uint64_t a1, unint64_t a2)
{
  return sub_1002063F0(a1, a2, 27);
}

void HIDServiceProperties.pointerAccelerationTable.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = sub_100206034(a1);
  HIDServiceProperties.pointerAccelerationTable.getter(v2, v3);
  *v1 = v4;
  v1[1] = v5;
  sub_1000050D4();
}

void sub_1001FCB30(uint64_t *a1, char a2)
{
  sub_1002063E8(a1, a2);
}

void HIDServiceProperties.pointerAccelerationType.getter()
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
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  Swift::Int v33;
  uint64_t v34[10];

  sub_100206790();
  sub_100206044();
  v8 = sub_1002060D0(v1, (uint64_t)&type metadata for String, v2, v3, v4, v5, v6, v7);
  v9 = sub_100032410(v8, "__swift_objectForKeyedSubscript:");
  v10 = sub_100206028();
  if (v0)
  {
    sub_10020601C(v10, v11);
    v12 = sub_100012644();
  }
  else
  {
    v16 = sub_10020607C();
  }
  sub_100205FD8(v12, v13, &qword_1002B34C0, v14, v15, v16);
  if (v34[9])
  {
    v25 = sub_100205FCC((uint64_t)v34, v18, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for String, v21, v22, v23, v24, v34[0], v34[1]);
    sub_10020623C(v25, v26, v27, v28, v29, v30, v31, v32, v34[0]);
  }
  else
  {
    sub_100206088(v17, &qword_1002B34C0, v19, v20, v21, v22, v23, v24);
    HIDServicePropertyKey.init(intValue:)(v33);
  }
  sub_10000E59C();
}

void sub_1001FCBF8(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  HIDServiceProperties.pointerAccelerationType.getter();
  *a1 = v2;
  a1[1] = v3;
}

void HIDServiceProperties.pointerAccelerationType.setter(uint64_t a1, uint64_t a2)
{
  sub_1002062EC(a1, a2, 26);
}

void HIDServiceProperties.pointerAccelerationType.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  sub_100206034(a1);
  HIDServiceProperties.pointerAccelerationType.getter();
  *v1 = v2;
  v1[1] = v3;
  sub_1000050D4();
}

void sub_1001FCC64(uint64_t a1, char a2)
{
  sub_1002062E4(a1, a2);
}

void HIDServiceProperties.pointerButtonCount.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37[9];

  sub_100206044();
  v10 = sub_1002060D0(v3, (uint64_t)&type metadata for String, v4, v5, v6, v7, v8, v9);
  v11 = sub_100032410(v10, "__swift_objectForKeyedSubscript:");
  v12 = sub_100206028();
  if (a2)
  {
    sub_10020601C(v12, v13);
    v14 = sub_100012644();
  }
  else
  {
    v18 = sub_10020607C();
  }
  sub_100205FD8(v14, v15, &qword_1002B34C0, v16, v17, v18);
  if (v37[8])
  {
    v27 = sub_100205FCC((uint64_t)v37, v20, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int, v23, v24, v25, v26, v35, v37[0]);
    sub_100206054(v27, v28, v29, v30, v31, v32, v33, v34, v36, v37[0]);
  }
  else
  {
    sub_100206088(v19, &qword_1002B34C0, v21, v22, v23, v24, v25, v26);
    HIDServicePropertyKey.intValue.getter();
  }
  sub_10000E59C();
}

void sub_1001FCD30(uint64_t a1)
{
  HIDServiceProperties.pointerButtonCount.setter(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

void HIDServiceProperties.pointerButtonCount.setter(uint64_t a1, char a2)
{
  sub_10020606C(a1, a2 & 1, 21);
}

void HIDServiceProperties.pointerButtonCount.modify(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  v1 = sub_100206034(a1);
  HIDServiceProperties.pointerButtonCount.getter(v1, v2);
  sub_1002060D8(v3, v4);
  sub_1000050D4();
}

void sub_1001FCDA4(uint64_t a1, uint64_t a2)
{
  sub_100206074(a1, a2, 21);
}

void HIDServiceProperties.pointerButtonMode.getter()
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
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35[9];

  sub_100206380();
  sub_100206044();
  v8 = sub_1002060D0(v1, (uint64_t)&type metadata for String, v2, v3, v4, v5, v6, v7);
  v9 = sub_100032410(v8, "__swift_objectForKeyedSubscript:");
  v10 = sub_100206028();
  if (v0)
  {
    sub_10020601C(v10, v11);
    v12 = sub_100012644();
  }
  else
  {
    v16 = sub_10020607C();
  }
  sub_100205FD8(v12, v13, &qword_1002B34C0, v14, v15, v16);
  if (v35[8])
  {
    v25 = sub_100205FCC((uint64_t)v35, v18, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int, v21, v22, v23, v24, v33, v35[0]);
    sub_100206054(v25, v26, v27, v28, v29, v30, v31, v32, v34, v35[0]);
  }
  else
  {
    sub_100206088(v17, &qword_1002B34C0, v19, v20, v21, v22, v23, v24);
    HIDServicePropertyKey.intValue.getter();
  }
  sub_10000E59C();
}

void sub_1001FCE68(uint64_t a1)
{
  HIDServiceProperties.pointerButtonMode.setter(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

void HIDServiceProperties.pointerButtonMode.setter(uint64_t a1, char a2)
{
  sub_10020606C(a1, a2 & 1, 20);
}

void HIDServiceProperties.pointerButtonMode.modify(uint64_t a1)
{
  uint64_t v1;
  char v2;

  sub_100206034(a1);
  HIDServiceProperties.pointerButtonMode.getter();
  sub_1002060D8(v1, v2);
  sub_1000050D4();
}

void sub_1001FCEDC(uint64_t a1, uint64_t a2)
{
  sub_100206074(a1, a2, 20);
}

void HIDServiceProperties.pointerResolution.getter()
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
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35[9];

  sub_100206380();
  sub_100206044();
  v8 = sub_1002060D0(v1, (uint64_t)&type metadata for String, v2, v3, v4, v5, v6, v7);
  v9 = sub_100032410(v8, "__swift_objectForKeyedSubscript:");
  v10 = sub_100206028();
  if (v0)
  {
    sub_10020601C(v10, v11);
    v12 = sub_100012644();
  }
  else
  {
    v16 = sub_10020607C();
  }
  sub_100205FD8(v12, v13, &qword_1002B34C0, v14, v15, v16);
  if (v35[8])
  {
    v25 = sub_100205FCC((uint64_t)v35, v18, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int, v21, v22, v23, v24, v33, v35[0]);
    sub_100206054(v25, v26, v27, v28, v29, v30, v31, v32, v34, v35[0]);
  }
  else
  {
    sub_100206088(v17, &qword_1002B34C0, v19, v20, v21, v22, v23, v24);
    HIDServicePropertyKey.intValue.getter();
  }
  sub_10000E59C();
}

void sub_1001FCFA0(uint64_t a1)
{
  HIDServiceProperties.pointerResolution.setter(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

void HIDServiceProperties.pointerResolution.setter(uint64_t a1, char a2)
{
  sub_10020606C(a1, a2 & 1, 20);
}

void HIDServiceProperties.pointerResolution.modify(uint64_t a1)
{
  uint64_t v1;
  char v2;

  sub_100206034(a1);
  HIDServiceProperties.pointerResolution.getter();
  sub_1002060D8(v1, v2);
  sub_1000050D4();
}

void sub_1001FD014(uint64_t a1, uint64_t a2)
{
  sub_100206074(a1, a2, 20);
}

void HIDServiceProperties.pointerReportRate.getter()
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
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35[9];

  sub_100206380();
  sub_100206044();
  v8 = sub_1002060D0(v1, (uint64_t)&type metadata for String, v2, v3, v4, v5, v6, v7);
  v9 = sub_100032410(v8, "__swift_objectForKeyedSubscript:");
  v10 = sub_100206028();
  if (v0)
  {
    sub_10020601C(v10, v11);
    v12 = sub_100012644();
  }
  else
  {
    v16 = sub_10020607C();
  }
  sub_100205FD8(v12, v13, &qword_1002B34C0, v14, v15, v16);
  if (v35[8])
  {
    v25 = sub_100205FCC((uint64_t)v35, v18, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int, v21, v22, v23, v24, v33, v35[0]);
    sub_100206054(v25, v26, v27, v28, v29, v30, v31, v32, v34, v35[0]);
  }
  else
  {
    sub_100206088(v17, &qword_1002B34C0, v19, v20, v21, v22, v23, v24);
    HIDServicePropertyKey.intValue.getter();
  }
  sub_10000E59C();
}

void sub_1001FD0D8(uint64_t a1)
{
  HIDServiceProperties.pointerReportRate.setter(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

void HIDServiceProperties.pointerReportRate.setter(uint64_t a1, char a2)
{
  sub_10020606C(a1, a2 & 1, 20);
}

void HIDServiceProperties.pointerReportRate.modify(uint64_t a1)
{
  uint64_t v1;
  char v2;

  sub_100206034(a1);
  HIDServiceProperties.pointerReportRate.getter();
  sub_1002060D8(v1, v2);
  sub_1000050D4();
}

void sub_1001FD14C(uint64_t a1, uint64_t a2)
{
  sub_100206074(a1, a2, 20);
}

uint64_t HIDServiceProperties.primaryUsagePair.getter(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int16 v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[24];
  uint64_t v26;

  sub_1002062B4();
  *(_QWORD *)&v23 = 0xD000000000000010;
  *((_QWORD *)&v23 + 1) = v3;
  _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v23, &type metadata for String);
  v4 = sub_100095678(a2, "__swift_objectForKeyedSubscript:");
  v5 = sub_10005FF20();
  if (v4)
  {
    _bridgeAnyObjectToAny(_:)(&v23, v4);
    v5 = sub_10000F718();
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
  }
  sub_1002068D8(v5, v6, &qword_1002B34C0, v7, v8, v9, v10);
  if (!v26)
    goto LABEL_12;
  if ((sub_1000AAF18((uint64_t)&v22, (uint64_t)v25, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int) & 1) == 0)
    goto LABEL_13;
  v11 = v22;
  sub_100206514();
  *(_QWORD *)&v23 = v12;
  *((_QWORD *)&v23 + 1) = v13;
  _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v23, &type metadata for String);
  v14 = sub_100095678(a2, "__swift_objectForKeyedSubscript:");
  v15 = sub_10005FF20();
  if (v14)
  {
    _bridgeAnyObjectToAny(_:)(&v23, v14);
    v15 = sub_100012644();
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
  }
  sub_1002068D8(v15, v16, &qword_1002B34C0, v17, v18, v19, v20);
  if (!v26)
  {
LABEL_12:
    sub_10000E36C((uint64_t)v25, &qword_1002B34C0);
    goto LABEL_13;
  }
  if ((sub_1000AAF18((uint64_t)&v22, (uint64_t)v25, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int) & 1) != 0)
    return v11 | ((unsigned __int16)v22 << 16);
LABEL_13:
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000022, 0x800000010025AC10, "HIDUtils/HIDServiceProperties.swift", 35, 2, 218, 0);
  __break(1u);
  return result;
}

uint64_t sub_1001FD32C@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = HIDServiceProperties.primaryUsagePair.getter(a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void HIDServiceProperties.primaryUsagePair.setter()
{
  uint64_t v0;
  void *v1;
  Class isa;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Class v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = *(void **)(v0 + 8);
  isa = Int._bridgeToObjectiveC()().super.super.isa;
  objc_msgSend(v1, "__swift_setObject:forKeyedSubscript:", isa, sub_10020687C((uint64_t)isa, v3, v4, v5, v6, v7, v8, v9, 0xD000000000000010));

  sub_10002DA70();
  v10 = Int._bridgeToObjectiveC()().super.super.isa;
  sub_100206514();
  objc_msgSend(v1, "__swift_setObject:forKeyedSubscript:", v10, sub_10020687C(v11, v12, v13, v14, v15, v16, v17, v18, v19));

  sub_10005FF20();
  sub_1000F00A0();
}

void HIDServiceProperties.primaryUsagePair.modify(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  void *v3;

  v2 = sub_100206200(a1);
  *(_DWORD *)(v1 + 8) = HIDServiceProperties.primaryUsagePair.getter((uint64_t)v2, v3);
  sub_1000050D4();
}

void sub_1001FD438()
{
  HIDServiceProperties.primaryUsagePair.setter();
  sub_1000050D4();
}

void HIDServiceProperties.product.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1001FC4F8(a1, a2, 0x746375646F7250, 0xE700000000000000, a5, a6, a7, a8);
}

void sub_1001FD470(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, _QWORD *a8@<X8>)
{
  uint64_t v9;
  uint64_t v10;

  HIDServiceProperties.product.getter(a1, *(_QWORD *)(a1 + 8), a2, a3, a4, a5, a6, a7);
  *a8 = v9;
  a8[1] = v10;
}

void HIDServiceProperties.product.setter(uint64_t a1, uint64_t a2)
{
  HIDServiceProperties.subscript.setter(a1, a2, 0x746375646F7250);
}

void HIDServiceProperties.product.modify(uint64_t a1)
{
  _QWORD *v1;
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

  v2 = sub_100206034(a1);
  HIDServiceProperties.product.getter(v2, v3, v4, v5, v6, v7, v8, v9);
  *v1 = v10;
  v1[1] = v11;
  sub_1000050D4();
}

void sub_1001FD4DC(uint64_t a1, char a2)
{
  sub_1001FE3E8(a1, a2);
}

void HIDServiceProperties.productID.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100206754();
  sub_1001FC208(v0, v1, v2, v3, v4, v5, v6, v7);
}

void sub_1001FD504()
{
  HIDServiceProperties.productID.setter();
}

void HIDServiceProperties.productID.setter()
{
  uint64_t v0;
  char v1;
  uint64_t v2;

  sub_100206754();
  HIDServiceProperties.subscript.setter(v0, v1, v2);
}

void HIDServiceProperties.productID.modify(uint64_t a1)
{
  uint64_t v1;
  char v2;

  sub_100206034(a1);
  HIDServiceProperties.productID.getter();
  sub_1002060D8(v1, v2);
  sub_1000050D4();
}

void sub_1001FD570()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_100206754();
  sub_1001FEBA4(v0, v1, v2);
}

void HIDServiceProperties.reportDescriptor.getter()
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
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33[10];

  sub_100206780();
  sub_100206044();
  v8 = sub_1002060D0(v1, (uint64_t)&type metadata for String, v2, v3, v4, v5, v6, v7);
  v9 = sub_100032410(v8, "__swift_objectForKeyedSubscript:");
  v10 = sub_100206028();
  if (v0)
  {
    sub_10020601C(v10, v11);
    v12 = sub_100012644();
  }
  else
  {
    v16 = sub_10020607C();
  }
  sub_100205FD8(v12, v13, &qword_1002B34C0, v14, v15, v16);
  if (v33[9])
  {
    v25 = sub_100205FCC((uint64_t)v33, v18, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Data, v21, v22, v23, v24, v33[0], v33[1]);
    sub_10020623C(v25, v26, v27, v28, v29, v30, v31, v32, v33[0]);
  }
  else
  {
    sub_100206088(v17, &qword_1002B34C0, v19, v20, v21, v22, v23, v24);
  }
  sub_10000E59C();
}

void sub_1001FD638(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  HIDServiceProperties.reportDescriptor.getter();
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_1001FD660(uint64_t *a1)
{
  uint64_t v1;
  unint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  sub_100025168(*a1, v2);
  return HIDServiceProperties.reportDescriptor.setter(v1, v2);
}

uint64_t HIDServiceProperties.reportDescriptor.setter(uint64_t a1, unint64_t a2)
{
  return sub_1002063F0(a1, a2, 16);
}

void HIDServiceProperties.reportDescriptor.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  sub_100206034(a1);
  HIDServiceProperties.reportDescriptor.getter();
  *v1 = v2;
  v1[1] = v3;
  sub_1000050D4();
}

void sub_1001FD6E4(uint64_t *a1, char a2)
{
  sub_1002063E8(a1, a2);
}

void HIDServiceProperties.scrollAccelerationTable.getter()
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
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33[10];

  sub_100206790();
  sub_100206044();
  v8 = sub_1002060D0(v1, (uint64_t)&type metadata for String, v2, v3, v4, v5, v6, v7);
  v9 = sub_100032410(v8, "__swift_objectForKeyedSubscript:");
  v10 = sub_100206028();
  if (v0)
  {
    sub_10020601C(v10, v11);
    v12 = sub_100012644();
  }
  else
  {
    v16 = sub_10020607C();
  }
  sub_100205FD8(v12, v13, &qword_1002B34C0, v14, v15, v16);
  if (v33[9])
  {
    v25 = sub_100205FCC((uint64_t)v33, v18, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Data, v21, v22, v23, v24, v33[0], v33[1]);
    sub_10020623C(v25, v26, v27, v28, v29, v30, v31, v32, v33[0]);
  }
  else
  {
    sub_100206088(v17, &qword_1002B34C0, v19, v20, v21, v22, v23, v24);
  }
  sub_10000E59C();
}

void sub_1001FD7B4(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  HIDServiceProperties.scrollAccelerationTable.getter();
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_1001FD7DC(uint64_t *a1)
{
  uint64_t v1;
  unint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  sub_100025168(*a1, v2);
  return HIDServiceProperties.scrollAccelerationTable.setter(v1, v2);
}

uint64_t HIDServiceProperties.scrollAccelerationTable.setter(uint64_t a1, unint64_t a2)
{
  return sub_1002063F0(a1, a2, 26);
}

void HIDServiceProperties.scrollAccelerationTable.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  sub_100206034(a1);
  HIDServiceProperties.scrollAccelerationTable.getter();
  *v1 = v2;
  v1[1] = v3;
  sub_1000050D4();
}

void sub_1001FD860(uint64_t *a1, char a2)
{
  sub_1002063E8(a1, a2);
}

void sub_1001FD878(uint64_t *a1, char a2)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *a1;
  v3 = a1[1];
  if ((a2 & 1) != 0)
  {
    sub_100025168(*a1, v3);
    sub_1002066B0();
    sub_100022AD8(v2, v3);
  }
  else
  {
    sub_1002066B0();
    sub_10002644C();
  }
}

void HIDServiceProperties.scrollAccelerationType.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  Swift::Int v35;
  uint64_t v36[10];

  sub_100206044();
  v10 = sub_1002060D0(v3, (uint64_t)&type metadata for String, v4, v5, v6, v7, v8, v9);
  v11 = sub_100032410(v10, "__swift_objectForKeyedSubscript:");
  v12 = sub_100206028();
  if (a2)
  {
    sub_10020601C(v12, v13);
    v14 = sub_100012644();
  }
  else
  {
    v18 = sub_10020607C();
  }
  sub_100205FD8(v14, v15, &qword_1002B34C0, v16, v17, v18);
  if (v36[9])
  {
    v27 = sub_100205FCC((uint64_t)v36, v20, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for String, v23, v24, v25, v26, v36[0], v36[1]);
    sub_10020623C(v27, v28, v29, v30, v31, v32, v33, v34, v36[0]);
  }
  else
  {
    sub_100206088(v19, &qword_1002B34C0, v21, v22, v23, v24, v25, v26);
    HIDServicePropertyKey.init(intValue:)(v35);
  }
  sub_10000E59C();
}

void sub_1001FD990(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  HIDServiceProperties.scrollAccelerationType.getter(a1, *(_QWORD *)(a1 + 8));
  *a2 = v3;
  a2[1] = v4;
}

void HIDServiceProperties.scrollAccelerationType.setter(uint64_t a1, uint64_t a2)
{
  sub_1002062EC(a1, a2, 25);
}

void HIDServiceProperties.scrollAccelerationType.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = sub_100206034(a1);
  HIDServiceProperties.scrollAccelerationType.getter(v2, v3);
  *v1 = v4;
  v1[1] = v5;
  sub_1000050D4();
}

void sub_1001FD9FC(uint64_t a1, char a2)
{
  sub_1002062E4(a1, a2);
}

void HIDServiceProperties.scrollAccelParametricCurves.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
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
  uint64_t v27[9];

  sub_100206380();
  sub_100206728();
  v4 = sub_1002064D4(v1, (uint64_t)&type metadata for String, v2, v3);
  v5 = sub_100032410(v4, "__swift_objectForKeyedSubscript:");
  v6 = sub_100206028();
  if (v0)
  {
    sub_10020601C(v6, v7);
    v8 = sub_100012644();
  }
  else
  {
    v12 = sub_10020607C();
  }
  sub_100205FD8(v8, v9, &qword_1002B34C0, v10, v11, v12);
  if (v27[8])
  {
    sub_100060018(v13, &qword_1002B0900, NSArray_ptr);
    if ((sub_100205FCC((uint64_t)v27, v21, (uint64_t)&type metadata for Any + 8, v20, v22, v23, v24, v25, v26, v27[0]) & 1) != 0)
    {
      sub_1002067C0();
      sub_100010BBC();
    }
  }
  else
  {
    sub_100206088(v13, &qword_1002B34C0, v14, v15, v16, v17, v18, v19);
  }
  sub_1000C26D8();
}

void sub_1001FDAE0(_QWORD *a1@<X8>)
{
  uint64_t v2;

  HIDServiceProperties.scrollAccelParametricCurves.getter();
  *a1 = v2;
}

uint64_t sub_1001FDB08()
{
  objc_class *v0;

  swift_bridgeObjectRetain();
  return HIDServiceProperties.scrollAccelParametricCurves.setter(v0);
}

uint64_t HIDServiceProperties.scrollAccelParametricCurves.setter(objc_class *a1)
{
  return sub_1001FDB4C(a1, 0xD000000000000014);
}

uint64_t sub_1001FDB4C(objc_class *a1, uint64_t a2)
{
  Class isa;
  uint64_t v4;
  uint64_t v5;
  Class v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE __dst[137];

  isa = a1;
  if (a1)
  {
    v4 = *((_QWORD *)a1 + 2);
    if (v4)
    {
      specialized ContiguousArray.reserveCapacity(_:)(v4);
      v5 = 32;
      do
      {
        memcpy(__dst, (char *)isa + v5, sizeof(__dst));
        v6 = HIDServiceProperties.HIDAccelCurve.dictionaryRepresentation.getter();
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v6);
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(_swiftEmptyArrayStorage[2]);
        v7 = sub_1002068F0();
        specialized ContiguousArray._endMutation()(v7);
        v5 += 144;
        --v4;
      }
      while (v4);
      v8 = sub_10000E50C();
    }
    else
    {
      v8 = sub_10000E50C();
    }
    sub_100060018(v8, &qword_1002B0910, NSDictionary_ptr);
    isa = Array._bridgeToObjectiveC()().super.isa;
    sub_10000E420();
  }
  return HIDServiceProperties.subscript.setter(isa, a2);
}

void HIDServiceProperties.scrollAccelParametricCurves.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  sub_1002065CC(a1);
  HIDServiceProperties.scrollAccelParametricCurves.getter();
  *v1 = v2;
  sub_1000050D4();
}

void sub_1001FDC90(uint64_t *a1, char a2)
{
  sub_1001FDC9C(a1, a2, (void (*)(uint64_t))HIDServiceProperties.scrollAccelParametricCurves.setter);
}

void sub_1001FDC9C(uint64_t *a1, char a2, void (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = *a1;
  if ((a2 & 1) != 0)
  {
    v5 = sub_100043360();
    a3(v5);
    sub_10016A904(v4);
  }
  else
  {
    a3(*a1);
    sub_10000B350();
  }
}

void HIDServiceProperties.scrollReportRate.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37[9];

  sub_100206044();
  v10 = sub_1002060D0(v3, (uint64_t)&type metadata for String, v4, v5, v6, v7, v8, v9);
  v11 = sub_100032410(v10, "__swift_objectForKeyedSubscript:");
  v12 = sub_100206028();
  if (a2)
  {
    sub_10020601C(v12, v13);
    v14 = sub_100012644();
  }
  else
  {
    v18 = sub_10020607C();
  }
  sub_100205FD8(v14, v15, &qword_1002B34C0, v16, v17, v18);
  if (v37[8])
  {
    v27 = sub_100205FCC((uint64_t)v37, v20, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int, v23, v24, v25, v26, v35, v37[0]);
    sub_100206054(v27, v28, v29, v30, v31, v32, v33, v34, v36, v37[0]);
  }
  else
  {
    sub_100206088(v19, &qword_1002B34C0, v21, v22, v23, v24, v25, v26);
    HIDServicePropertyKey.intValue.getter();
  }
  sub_10000E59C();
}

void sub_1001FDD90(uint64_t a1)
{
  HIDServiceProperties.scrollReportRate.setter(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

void HIDServiceProperties.scrollReportRate.setter(uint64_t a1, char a2)
{
  sub_10020606C(a1, a2 & 1, 19);
}

void HIDServiceProperties.scrollReportRate.modify(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  v1 = sub_100206034(a1);
  HIDServiceProperties.scrollReportRate.getter(v1, v2);
  sub_1002060D8(v3, v4);
  sub_1000050D4();
}

void sub_1001FDE04(uint64_t a1, uint64_t a2)
{
  sub_100206074(a1, a2, 19);
}

void HIDServiceProperties.scrollResolution.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37[9];

  sub_100206044();
  v10 = sub_1002060D0(v3, (uint64_t)&type metadata for String, v4, v5, v6, v7, v8, v9);
  v11 = sub_100032410(v10, "__swift_objectForKeyedSubscript:");
  v12 = sub_100206028();
  if (a2)
  {
    sub_10020601C(v12, v13);
    v14 = sub_100012644();
  }
  else
  {
    v18 = sub_10020607C();
  }
  sub_100205FD8(v14, v15, &qword_1002B34C0, v16, v17, v18);
  if (v37[8])
  {
    v27 = sub_100205FCC((uint64_t)v37, v20, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int, v23, v24, v25, v26, v35, v37[0]);
    sub_100206054(v27, v28, v29, v30, v31, v32, v33, v34, v36, v37[0]);
  }
  else
  {
    sub_100206088(v19, &qword_1002B34C0, v21, v22, v23, v24, v25, v26);
    HIDServicePropertyKey.intValue.getter();
  }
  sub_10000E59C();
}

void sub_1001FDED0(uint64_t a1)
{
  HIDServiceProperties.scrollResolution.setter(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

void HIDServiceProperties.scrollResolution.setter(uint64_t a1, char a2)
{
  sub_10020606C(a1, a2 & 1, 19);
}

void HIDServiceProperties.scrollResolution.modify(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  v1 = sub_100206034(a1);
  HIDServiceProperties.scrollResolution.getter(v1, v2);
  sub_1002060D8(v3, v4);
  sub_1000050D4();
}

void sub_1001FDF44(uint64_t a1, uint64_t a2)
{
  sub_100206074(a1, a2, 19);
}

void HIDServiceProperties.supportsGestureScrolling.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28[9];

  sub_100206044();
  v10 = sub_1002060D0(v3, (uint64_t)&type metadata for String, v4, v5, v6, v7, v8, v9);
  v11 = sub_100032410(v10, "__swift_objectForKeyedSubscript:");
  v12 = sub_100206028();
  if (a2)
  {
    sub_10020601C(v12, v13);
    v14 = sub_100012644();
  }
  else
  {
    v18 = sub_10020607C();
  }
  sub_100205FD8(v14, v15, &qword_1002B34C0, v16, v17, v18);
  if (v28[8])
  {
    sub_100205FCC((uint64_t)v28 + 7, v20, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Bool, v23, v24, v25, v26, v27, v28[0]);
    sub_1002062A4();
  }
  else
  {
    sub_100206088(v19, &qword_1002B34C0, v21, v22, v23, v24, v25, v26);
  }
  sub_10000E59C();
}

void sub_1001FE014(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  char v3;

  HIDServiceProperties.supportsGestureScrolling.getter(a1, *(_QWORD *)(a1 + 8));
  *a2 = v3;
}

void HIDServiceProperties.supportsGestureScrolling.setter(char a1)
{
  sub_100206164(a1, 24);
}

void HIDServiceProperties.supportsGestureScrolling.modify(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  char v4;

  v2 = sub_100206200(a1);
  HIDServiceProperties.supportsGestureScrolling.getter((uint64_t)v2, v3);
  *(_BYTE *)(v1 + 8) = v4;
  sub_1000050D4();
}

void sub_1001FE080(uint64_t a1)
{
  char v1;

  v1 = sub_100206430(a1);
  sub_100206164(v1, 24);
  sub_1000050D4();
}

void HIDServiceProperties.trackpadAcceleration.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37[9];

  sub_100206044();
  v10 = sub_1002060D0(v3, (uint64_t)&type metadata for String, v4, v5, v6, v7, v8, v9);
  v11 = sub_100032410(v10, "__swift_objectForKeyedSubscript:");
  v12 = sub_100206028();
  if (a2)
  {
    sub_10020601C(v12, v13);
    v14 = sub_100012644();
  }
  else
  {
    v18 = sub_10020607C();
  }
  sub_100205FD8(v14, v15, &qword_1002B34C0, v16, v17, v18);
  if (v37[8])
  {
    v27 = sub_100205FCC((uint64_t)v37, v20, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int, v23, v24, v25, v26, v35, v37[0]);
    sub_100206054(v27, v28, v29, v30, v31, v32, v33, v34, v36, v37[0]);
  }
  else
  {
    sub_100206088(v19, &qword_1002B34C0, v21, v22, v23, v24, v25, v26);
    HIDServicePropertyKey.intValue.getter();
  }
  sub_10000E59C();
}

void sub_1001FE164(uint64_t a1)
{
  HIDServiceProperties.trackpadAcceleration.setter(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

void HIDServiceProperties.trackpadAcceleration.setter(uint64_t a1, char a2)
{
  sub_10020606C(a1, a2 & 1, 23);
}

void HIDServiceProperties.trackpadAcceleration.modify(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  v1 = sub_100206034(a1);
  HIDServiceProperties.trackpadAcceleration.getter(v1, v2);
  sub_1002060D8(v3, v4);
  sub_1000050D4();
}

void sub_1001FE1D8(uint64_t a1, uint64_t a2)
{
  sub_100206074(a1, a2, 23);
}

void HIDServiceProperties.trackpadScrollAcceleration.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37[9];

  sub_100206044();
  v10 = sub_1002060D0(v3, (uint64_t)&type metadata for String, v4, v5, v6, v7, v8, v9);
  v11 = sub_100032410(v10, "__swift_objectForKeyedSubscript:");
  v12 = sub_100206028();
  if (a2)
  {
    sub_10020601C(v12, v13);
    v14 = sub_100012644();
  }
  else
  {
    v18 = sub_10020607C();
  }
  sub_100205FD8(v14, v15, &qword_1002B34C0, v16, v17, v18);
  if (v37[8])
  {
    v27 = sub_100205FCC((uint64_t)v37, v20, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int, v23, v24, v25, v26, v35, v37[0]);
    sub_100206054(v27, v28, v29, v30, v31, v32, v33, v34, v36, v37[0]);
  }
  else
  {
    sub_100206088(v19, &qword_1002B34C0, v21, v22, v23, v24, v25, v26);
    HIDServicePropertyKey.intValue.getter();
  }
  sub_10000E59C();
}

void sub_1001FE2A4(uint64_t a1)
{
  HIDServiceProperties.trackpadScrollAcceleration.setter(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

void HIDServiceProperties.trackpadScrollAcceleration.setter(uint64_t a1, char a2)
{
  sub_10020606C(a1, a2 & 1, 29);
}

void HIDServiceProperties.trackpadScrollAcceleration.modify(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  v1 = sub_100206034(a1);
  HIDServiceProperties.trackpadScrollAcceleration.getter(v1, v2);
  sub_1002060D8(v3, v4);
  sub_1000050D4();
}

void sub_1001FE318(uint64_t a1, uint64_t a2)
{
  sub_100206074(a1, a2, 29);
}

void HIDServiceProperties.transport.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100206820();
  sub_1001FC4F8(v0, v1, v2, v3, v4, v5, v6, v7);
}

void sub_1001FE340(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  HIDServiceProperties.transport.getter();
  *a1 = v2;
  a1[1] = v3;
}

void sub_1001FE368(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;

  v6 = *a1;
  v7 = a1[1];
  sub_100040544();
  a5(v6, v7);
  sub_10000B350();
}

void HIDServiceProperties.transport.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_100206820();
  HIDServiceProperties.subscript.setter(v0, v1, v2);
}

void HIDServiceProperties.transport.modify(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  sub_100206034(a1);
  HIDServiceProperties.transport.getter();
  *v1 = v2;
  v1[1] = v3;
  sub_1000050D4();
}

void sub_1001FE3D8()
{
  uint64_t v0;
  char v1;

  sub_100206820();
  sub_1001FE3E8(v0, v1);
}

void sub_1001FE3E8(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
  {
    sub_100043360();
    sub_1002066E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1002066E0();
    sub_10002644C();
  }
}

void HIDServiceProperties.universalControlBuiltIn.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28[9];

  sub_100206044();
  v10 = sub_1002060D0(v3, (uint64_t)&type metadata for String, v4, v5, v6, v7, v8, v9);
  v11 = sub_100032410(v10, "__swift_objectForKeyedSubscript:");
  v12 = sub_100206028();
  if (a2)
  {
    sub_10020601C(v12, v13);
    v14 = sub_100012644();
  }
  else
  {
    v18 = sub_10020607C();
  }
  sub_100205FD8(v14, v15, &qword_1002B34C0, v16, v17, v18);
  if (v28[8])
  {
    sub_100205FCC((uint64_t)v28 + 7, v20, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Bool, v23, v24, v25, v26, v27, v28[0]);
    sub_1002062A4();
  }
  else
  {
    sub_100206088(v19, &qword_1002B34C0, v21, v22, v23, v24, v25, v26);
  }
  sub_10000E59C();
}

void sub_1001FE4F4(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  char v3;

  HIDServiceProperties.universalControlBuiltIn.getter(a1, *(_QWORD *)(a1 + 8));
  *a2 = v3;
}

void HIDServiceProperties.universalControlBuiltIn.setter(char a1)
{
  sub_100206164(a1, 23);
}

void HIDServiceProperties.universalControlBuiltIn.modify(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  char v4;

  v2 = sub_100206200(a1);
  HIDServiceProperties.universalControlBuiltIn.getter((uint64_t)v2, v3);
  *(_BYTE *)(v1 + 8) = v4;
  sub_1000050D4();
}

void sub_1001FE560(uint64_t a1)
{
  char v1;

  v1 = sub_100206430(a1);
  sub_100206164(v1, 23);
  sub_1000050D4();
}

void HIDServiceProperties.universalControlVirtualService.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28[9];

  sub_100206044();
  v10 = sub_1002060D0(v3, (uint64_t)&type metadata for String, v4, v5, v6, v7, v8, v9);
  v11 = sub_100032410(v10, "__swift_objectForKeyedSubscript:");
  v12 = sub_100206028();
  if (a2)
  {
    sub_10020601C(v12, v13);
    v14 = sub_100012644();
  }
  else
  {
    v18 = sub_10020607C();
  }
  sub_100205FD8(v14, v15, &qword_1002B34C0, v16, v17, v18);
  if (v28[8])
  {
    sub_100205FCC((uint64_t)v28 + 7, v20, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Bool, v23, v24, v25, v26, v27, v28[0]);
    sub_1002062A4();
  }
  else
  {
    sub_100206088(v19, &qword_1002B34C0, v21, v22, v23, v24, v25, v26);
  }
  sub_10000E59C();
}

void sub_1001FE648(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  char v3;

  HIDServiceProperties.universalControlVirtualService.getter(a1, *(_QWORD *)(a1 + 8));
  *a2 = v3;
}

void HIDServiceProperties.universalControlVirtualService.setter(char a1)
{
  sub_100206164(a1, 30);
}

void HIDServiceProperties.universalControlVirtualService.modify(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  char v4;

  v2 = sub_100206200(a1);
  HIDServiceProperties.universalControlVirtualService.getter((uint64_t)v2, v3);
  *(_BYTE *)(v1 + 8) = v4;
  sub_1000050D4();
}

void sub_1001FE6B4(uint64_t a1)
{
  char v1;

  v1 = sub_100206430(a1);
  sub_100206164(v1, 30);
  sub_1000050D4();
}

void HIDServiceProperties.userDeviceCreateInactive.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
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
  uint64_t v29[9];

  if (qword_1002B64D0 != -1)
    swift_once(&qword_1002B64D0, sub_10020EC58);
  v29[5] = qword_1002B6AE8;
  v29[6] = unk_1002B6AF0;
  v0 = swift_bridgeObjectRetain_n(unk_1002B6AF0, 2);
  v7 = sub_1002060D0(v0, (uint64_t)&type metadata for String, v1, v2, v3, v4, v5, v6);
  v8 = sub_100206368(v7, "__swift_objectForKeyedSubscript:");
  v9 = sub_10005FF20();
  if (v8)
  {
    sub_100206260(v9, v10);
    v11 = sub_10000F718();
  }
  else
  {
    v15 = sub_10020607C();
  }
  sub_100205FD8(v11, v12, &qword_1002B34C0, v13, v14, v15);
  if (v29[8])
  {
    sub_100205FCC((uint64_t)v29 + 7, v16, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Bool, v17, v18, v19, v20, v28, v29[0]);
    sub_10000E410();
  }
  else
  {
    v21 = sub_10000E410();
    sub_100206088(v21, &qword_1002B34C0, v22, v23, v24, v25, v26, v27);
  }
  sub_1000C26D8();
}

void sub_1001FE7E8(_BYTE *a1@<X8>)
{
  char v2;

  HIDServiceProperties.userDeviceCreateInactive.getter();
  *a1 = v2;
}

void HIDServiceProperties.userDeviceCreateInactive.setter(char a1)
{
  uint64_t v2;

  if (qword_1002B64D0 != -1)
    swift_once(&qword_1002B64D0, sub_10020EC58);
  v2 = qword_1002B6AE8;
  sub_100040544();
  HIDServiceProperties.subscript.setter(a1, v2);
}

void HIDServiceProperties.userDeviceCreateInactive.modify(_QWORD *a1)
{
  uint64_t v1;
  char v2;

  sub_100206200(a1);
  HIDServiceProperties.userDeviceCreateInactive.getter();
  *(_BYTE *)(v1 + 8) = v2;
  sub_1000050D4();
}

void sub_1001FE8A4(uint64_t a1)
{
  char v1;
  uint64_t v2;

  v1 = *(_BYTE *)(a1 + 8);
  if (qword_1002B64D0 != -1)
    swift_once(&qword_1002B64D0, sub_10020EC58);
  v2 = qword_1002B6AE8;
  sub_100040544();
  HIDServiceProperties.subscript.setter(v1, v2);
  sub_10000B350();
}

void HIDServiceProperties.vendorID.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1001FC208(a1, a2, 0x4449726F646E6556, 0xE800000000000000, a5, a6, a7, a8);
}

void sub_1001FE928(uint64_t a1)
{
  HIDServiceProperties.vendorID.setter(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

void HIDServiceProperties.vendorID.setter(uint64_t a1, char a2)
{
  HIDServiceProperties.subscript.setter(a1, a2 & 1, 0x4449726F646E6556);
}

void HIDServiceProperties.vendorID.modify(uint64_t a1)
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
  char v10;

  v1 = sub_100206034(a1);
  HIDServiceProperties.vendorID.getter(v1, v2, v3, v4, v5, v6, v7, v8);
  sub_1002060D8(v9, v10);
  sub_1000050D4();
}

void sub_1001FE99C(uint64_t a1, uint64_t a2)
{
  sub_1001FEBA4(a1, a2, 0x4449726F646E6556);
}

void HIDServiceProperties.reportInterval.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100206460();
  sub_1001FC208(v0, v1, v2, v3, v4, v5, v6, v7);
}

void sub_1001FE9C4()
{
  HIDServiceProperties.reportInterval.setter();
}

void HIDServiceProperties.reportInterval.setter()
{
  uint64_t v0;
  char v1;
  uint64_t v2;

  sub_100206460();
  HIDServiceProperties.subscript.setter(v0, v1, v2);
}

void HIDServiceProperties.reportInterval.modify(uint64_t a1)
{
  uint64_t v1;
  char v2;

  sub_100206034(a1);
  HIDServiceProperties.reportInterval.getter();
  sub_1002060D8(v1, v2);
  sub_1000050D4();
}

void sub_1001FEA30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_100206460();
  sub_1001FEBA4(v0, v1, v2);
}

void HIDServiceProperties.subinterfaceID.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37[9];

  sub_100206044();
  v10 = sub_1002060D0(v3, (uint64_t)&type metadata for String, v4, v5, v6, v7, v8, v9);
  v11 = sub_100032410(v10, "__swift_objectForKeyedSubscript:");
  v12 = sub_100206028();
  if (a2)
  {
    sub_10020601C(v12, v13);
    v14 = sub_100012644();
  }
  else
  {
    v18 = sub_10020607C();
  }
  sub_100205FD8(v14, v15, &qword_1002B34C0, v16, v17, v18);
  if (v37[8])
  {
    v27 = sub_100205FCC((uint64_t)v37, v20, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int, v23, v24, v25, v26, v35, v37[0]);
    sub_100206054(v27, v28, v29, v30, v31, v32, v33, v34, v36, v37[0]);
  }
  else
  {
    sub_100206088(v19, &qword_1002B34C0, v21, v22, v23, v24, v25, v26);
    HIDServicePropertyKey.intValue.getter();
  }
  sub_10000E59C();
}

void sub_1001FEAF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, _QWORD))
{
  uint64_t v4;
  char v5;

  v4 = a4(a1, *(_QWORD *)(a1 + 8));
  sub_1002060D8(v4, v5);
  sub_1000050D4();
}

void sub_1001FEB18(uint64_t a1)
{
  HIDServiceProperties.subinterfaceID.setter(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

void HIDServiceProperties.subinterfaceID.setter(uint64_t a1, char a2)
{
  sub_10020606C(a1, a2 & 1, 17);
}

void HIDServiceProperties.subinterfaceID.modify(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  v1 = sub_100206034(a1);
  HIDServiceProperties.subinterfaceID.getter(v1, v2);
  sub_1002060D8(v3, v4);
  sub_1000050D4();
}

void sub_1001FEB8C(uint64_t a1, uint64_t a2)
{
  sub_100206074(a1, a2, 17);
}

void sub_1001FEBA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  HIDServiceProperties.subscript.setter(*(_QWORD *)a1, *(_BYTE *)(a1 + 8), a3);
  sub_1000050D4();
}

uint64_t HIDServiceProperties.surfaceDimensions.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
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
  double v14;
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
  Swift::Int v28;
  uint64_t v30;
  NSDictionary dictionaryRepresentation;
  uint64_t v32;

  sub_100206728();
  v6 = sub_1002064D4(v3, (uint64_t)&type metadata for String, v4, v5);
  v7 = sub_100032410(v6, "__swift_objectForKeyedSubscript:");
  v8 = sub_100206028();
  if (a2)
  {
    sub_10020601C(v8, v9);
    v10 = sub_100012644();
  }
  else
  {
    v14 = sub_10020607C();
  }
  sub_100205FD8(v10, v11, &qword_1002B34C0, v12, v13, v14);
  if (v32)
  {
    sub_100060018(v15, &qword_1002B0910, NSDictionary_ptr);
    v28 = sub_100205FCC((uint64_t)&dictionaryRepresentation, v23, (uint64_t)&type metadata for Any + 8, v22, v24, v25, v26, v27, v30, (uint64_t)dictionaryRepresentation.super.isa);
    if ((v28 & 1) != 0)
      return (unint64_t)HIDServiceProperties.HIDSurfaceDimensions.init(dictionaryRepresentation:)(dictionaryRepresentation);
  }
  else
  {
    sub_100206088(v15, &qword_1002B34C0, v16, v17, v18, v19, v20, v21);
  }
  return HIDServicePropertyKey.init(intValue:)(v28).value.rawValue._countAndFlagsBits;
}

uint64_t sub_1001FECA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  char v5;

  result = HIDServiceProperties.surfaceDimensions.getter(a1, *(_QWORD *)(a1 + 8));
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v4;
  *(_BYTE *)(a2 + 16) = v5 & 1;
  return result;
}

uint64_t sub_1001FECD8(uint64_t a1)
{
  return HIDServiceProperties.surfaceDimensions.setter(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t HIDServiceProperties.surfaceDimensions.setter(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  if ((a3 & 1) == 0)
    HIDServiceProperties.HIDSurfaceDimensions.dictionaryRepresentation.getter(a1, a2);
  sub_1000955C0();
  return HIDServiceProperties.subscript.setter(v3, 0xD000000000000011);
}

HIDUtils::HIDServiceProperties::HIDSurfaceDimensions_optional __swiftcall HIDServiceProperties.HIDSurfaceDimensions.init(dictionaryRepresentation:)(NSDictionary dictionaryRepresentation)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
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
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  Swift::Bool v41;
  Swift::Int v42;
  Swift::Int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  HIDUtils::HIDServiceProperties::HIDSurfaceDimensions_optional result;

  sub_1002065B8();
  v47 = v2;
  v48 = v3;
  v7 = sub_1002064D4(v4, (uint64_t)&type metadata for String, v5, v6);
  v8 = sub_100095678(dictionaryRepresentation.super.isa, "__swift_objectForKeyedSubscript:");
  v9 = sub_10005FF20();
  if (v8)
  {
    sub_100206260(v9, v10);
    v11 = sub_10000F718();
  }
  else
  {
    v15 = sub_10020607C();
  }
  sub_100205FD8(v11, v12, &qword_1002B34C0, v13, v14, v15);
  if (!v49)
  {

    goto LABEL_14;
  }
  if ((sub_100205FCC((uint64_t)&v46, v16, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int, v17, v18, v19, v20, v44, v46) & 1) == 0)
  {

LABEL_15:
    v42 = 0;
    v21 = 0;
    v41 = 1;
    goto LABEL_16;
  }
  v21 = v46;
  sub_1002065A4();
  v47 = v22;
  v48 = v23;
  sub_1002064D4(v24, (uint64_t)&type metadata for String, v25, v26);
  v27 = sub_1001A2C10(dictionaryRepresentation.super.isa, "__swift_objectForKeyedSubscript:");
  sub_1002061A4();
  if (v7)
  {
    sub_100206360(&v47);
    sub_10005FF20();

  }
  else
  {

    v32 = sub_10020607C();
  }
  sub_100205FD8(v28, v29, &qword_1002B34C0, v30, v31, v32);
  if (!v49)
  {
LABEL_14:
    sub_100206088(v33, &qword_1002B34C0, v34, v35, v36, v37, v38, v39);
    goto LABEL_15;
  }
  if ((sub_100205FCC((uint64_t)&v46, v40, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int, v36, v37, v38, v39, v45, v46) & 1) == 0)goto LABEL_15;
  v41 = 0;
  v42 = v46;
LABEL_16:
  v43 = v21;
  result.value.height = v43;
  result.value.width = v42;
  result.is_nil = v41;
  return result;
}

uint64_t HIDServiceProperties.HIDSurfaceDimensions.dictionaryRepresentation.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1000055B0(&qword_1002B65B8);
  v5 = sub_100206928(v4);
  *(_OWORD *)(v5 + 16) = xmmword_10021DE60;
  *(_QWORD *)(v5 + 32) = 0x746867696548;
  *(_QWORD *)(v5 + 40) = 0xE600000000000000;
  *(_QWORD *)(v5 + 56) = &type metadata for String;
  *(_QWORD *)(v5 + 64) = a2;
  *(_QWORD *)(v5 + 88) = &type metadata for Int;
  *(_QWORD *)(v5 + 96) = 0x6874646957;
  *(_QWORD *)(v5 + 104) = 0xE500000000000000;
  *(_QWORD *)(v5 + 152) = &type metadata for Int;
  *(_QWORD *)(v5 + 120) = &type metadata for String;
  *(_QWORD *)(v5 + 128) = a1;
  sub_100060018(v5, &qword_1002B0910, NSDictionary_ptr);
  return NSDictionary.init(dictionaryLiteral:)(v5);
}

void HIDServiceProperties.surfaceDimensions.modify(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  char v4;

  *(_QWORD *)(a1 + 24) = v1;
  *(_QWORD *)a1 = HIDServiceProperties.surfaceDimensions.getter(a1, *(_QWORD *)(v1 + 8));
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  sub_1000050D4();
}

void sub_1001FEF90(uint64_t a1)
{
  HIDServiceProperties.surfaceDimensions.setter(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  sub_1000050D4();
}

void HIDServiceProperties.scrollAccelerationSupport.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28[9];

  sub_100206044();
  v10 = sub_1002060D0(v3, (uint64_t)&type metadata for String, v4, v5, v6, v7, v8, v9);
  v11 = sub_100032410(v10, "__swift_objectForKeyedSubscript:");
  v12 = sub_100206028();
  if (a2)
  {
    sub_10020601C(v12, v13);
    v14 = sub_100012644();
  }
  else
  {
    v18 = sub_10020607C();
  }
  sub_100205FD8(v14, v15, &qword_1002B34C0, v16, v17, v18);
  if (v28[8])
  {
    sub_100205FCC((uint64_t)v28 + 7, v20, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Bool, v23, v24, v25, v26, v27, v28[0]);
    sub_1002062A4();
  }
  else
  {
    sub_100206088(v19, &qword_1002B34C0, v21, v22, v23, v24, v25, v26);
  }
  sub_10000E59C();
}

void sub_1001FF070(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  char v3;

  HIDServiceProperties.scrollAccelerationSupport.getter(a1, *(_QWORD *)(a1 + 8));
  *a2 = v3;
}

void HIDServiceProperties.scrollAccelerationSupport.setter(char a1)
{
  sub_100206164(a1, 29);
}

void HIDServiceProperties.scrollAccelerationSupport.modify(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  char v4;

  v2 = sub_100206200(a1);
  HIDServiceProperties.scrollAccelerationSupport.getter((uint64_t)v2, v3);
  *(_BYTE *)(v1 + 8) = v4;
  sub_1000050D4();
}

void sub_1001FF0DC(uint64_t a1)
{
  char v1;

  v1 = sub_100206430(a1);
  sub_100206164(v1, 29);
  sub_1000050D4();
}

void HIDServiceProperties.pointerAccelerationSupport.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28[9];

  sub_100206044();
  v10 = sub_1002060D0(v3, (uint64_t)&type metadata for String, v4, v5, v6, v7, v8, v9);
  v11 = sub_100032410(v10, "__swift_objectForKeyedSubscript:");
  v12 = sub_100206028();
  if (a2)
  {
    sub_10020601C(v12, v13);
    v14 = sub_100012644();
  }
  else
  {
    v18 = sub_10020607C();
  }
  sub_100205FD8(v14, v15, &qword_1002B34C0, v16, v17, v18);
  if (v28[8])
  {
    sub_100205FCC((uint64_t)v28 + 7, v20, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Bool, v23, v24, v25, v26, v27, v28[0]);
    sub_1002062A4();
  }
  else
  {
    sub_100206088(v19, &qword_1002B34C0, v21, v22, v23, v24, v25, v26);
  }
  sub_10000E59C();
}

void sub_1001FF1C4(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  char v3;

  HIDServiceProperties.pointerAccelerationSupport.getter(a1, *(_QWORD *)(a1 + 8));
  *a2 = v3;
}

void HIDServiceProperties.pointerAccelerationSupport.setter(char a1)
{
  sub_100206164(a1, 30);
}

void HIDServiceProperties.pointerAccelerationSupport.modify(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  char v4;

  v2 = sub_100206200(a1);
  HIDServiceProperties.pointerAccelerationSupport.getter((uint64_t)v2, v3);
  *(_BYTE *)(v1 + 8) = v4;
  sub_1000050D4();
}

void sub_1001FF230(uint64_t a1)
{
  char v1;

  v1 = sub_100206430(a1);
  sub_100206164(v1, 30);
  sub_1000050D4();
}

uint64_t HIDServiceProperties.property(forKey:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X3>, _OWORD *a4@<X8>)
{
  _QWORD *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t result;
  _OWORD v19[2];

  swift_bridgeObjectRetain();
  v8 = (_QWORD *)static HIDServicePropertyKey.allCases.getter();
  v9 = sub_1001FF7C0(a1, a2, v8);
  sub_10000E50C();
  if ((v9 & 1) != 0)
  {
    *((_QWORD *)&v19[0] + 1) = a2;
    v10 = sub_1000103C0();
    sub_10020648C(v10, (uint64_t)&type metadata for String, v11, v12, v13, v14, v15, v16, a1);
    v17 = sub_1001A2C10(a3, "__swift_objectForKeyedSubscript:");
    sub_1002061A4();
    if (a3)
    {
      sub_100206360(v19);
      sub_10005FF20();
    }
    else
    {
      memset(v19, 0, sizeof(v19));
    }
    sub_10005FA70((uint64_t)v19, (uint64_t)a4, &qword_1002B34C0);
    return sub_10000E410();
  }
  else
  {
    result = sub_10000E410();
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

uint64_t HIDServiceProperties.HIDAccelCurve.gainCubic.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t HIDServiceProperties.HIDAccelCurve.gainCubic.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)v2 = result;
  *(_BYTE *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t HIDServiceProperties.HIDAccelCurve.gainLinear.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = result;
  *(_BYTE *)(v2 + 24) = a2 & 1;
  return result;
}

uint64_t HIDServiceProperties.HIDAccelCurve.gainParabolic.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t HIDServiceProperties.HIDAccelCurve.gainParabolic.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = result;
  *(_BYTE *)(v2 + 40) = a2 & 1;
  return result;
}

uint64_t (*HIDServiceProperties.HIDAccelCurve.gainParabolic.modify())(_QWORD)
{
  return CGSize.init(_:);
}

uint64_t HIDServiceProperties.HIDAccelCurve.gainQuartic.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

uint64_t HIDServiceProperties.HIDAccelCurve.gainQuartic.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = result;
  *(_BYTE *)(v2 + 56) = a2 & 1;
  return result;
}

uint64_t (*HIDServiceProperties.HIDAccelCurve.gainQuartic.modify())(_QWORD)
{
  return CGSize.init(_:);
}

uint64_t HIDServiceProperties.HIDAccelCurve.index.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 64);
}

uint64_t HIDServiceProperties.HIDAccelCurve.index.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 64) = result;
  *(_BYTE *)(v2 + 72) = a2 & 1;
  return result;
}

uint64_t (*HIDServiceProperties.HIDAccelCurve.index.modify())(_QWORD)
{
  return CGSize.init(_:);
}

uint64_t HIDServiceProperties.HIDAccelCurve.tangentSpeedCubicRoot.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 80);
}

uint64_t HIDServiceProperties.HIDAccelCurve.tangentSpeedCubicRoot.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 80) = result;
  *(_BYTE *)(v2 + 88) = a2 & 1;
  return result;
}

uint64_t (*HIDServiceProperties.HIDAccelCurve.tangentSpeedCubicRoot.modify())(_QWORD)
{
  return CGSize.init(_:);
}

uint64_t HIDServiceProperties.HIDAccelCurve.tangentSpeedLinear.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 96);
}

uint64_t HIDServiceProperties.HIDAccelCurve.tangentSpeedLinear.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 96) = result;
  *(_BYTE *)(v2 + 104) = a2 & 1;
  return result;
}

uint64_t (*HIDServiceProperties.HIDAccelCurve.tangentSpeedLinear.modify())(_QWORD)
{
  return CGSize.init(_:);
}

uint64_t HIDServiceProperties.HIDAccelCurve.tangentSpeedParabolicRoot.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 112);
}

uint64_t HIDServiceProperties.HIDAccelCurve.tangentSpeedParabolicRoot.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 112) = result;
  *(_BYTE *)(v2 + 120) = a2 & 1;
  return result;
}

uint64_t (*HIDServiceProperties.HIDAccelCurve.tangentSpeedParabolicRoot.modify())(_QWORD)
{
  return CGSize.init(_:);
}

uint64_t HIDServiceProperties.HIDAccelCurve.tangentSpeedQuarticRoot.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 128);
}

uint64_t HIDServiceProperties.HIDAccelCurve.tangentSpeedQuarticRoot.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 128) = result;
  *(_BYTE *)(v2 + 136) = a2 & 1;
  return result;
}

uint64_t (*HIDServiceProperties.HIDAccelCurve.tangentSpeedQuarticRoot.modify())(_QWORD)
{
  return CGSize.init(_:);
}

void sub_1001FF4A4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  Swift::Int v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD v31[9];
  _QWORD v32[5];
  _QWORD *v33;

  v1 = &_swiftEmptyDictionarySingleton;
  v33 = &_swiftEmptyDictionarySingleton;
  sub_10004307C(a1, v32);
  v2 = v32[0];
  v3 = v32[1];
  v4 = v32[3];
  v5 = v32[4];
  v6 = (unint64_t)(v32[2] + 64) >> 6;
  swift_bridgeObjectRetain();
  while (1)
  {
    do
    {
      if (v5)
      {
        v7 = __clz(__rbit64(v5));
        v5 &= v5 - 1;
        v8 = v7 | (v4 << 6);
      }
      else
      {
        v9 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
          goto LABEL_36;
        }
        if (v9 >= v6)
          goto LABEL_34;
        v10 = *(_QWORD *)(v3 + 8 * v9);
        v11 = v4 + 1;
        if (!v10)
        {
          v11 = v4 + 2;
          if (v4 + 2 >= v6)
            goto LABEL_34;
          v10 = *(_QWORD *)(v3 + 8 * v11);
          if (!v10)
          {
            v11 = v4 + 3;
            if (v4 + 3 >= v6)
              goto LABEL_34;
            v10 = *(_QWORD *)(v3 + 8 * v11);
            if (!v10)
            {
              v11 = v4 + 4;
              if (v4 + 4 >= v6)
                goto LABEL_34;
              v10 = *(_QWORD *)(v3 + 8 * v11);
              if (!v10)
              {
                v11 = v4 + 5;
                if (v4 + 5 >= v6)
                  goto LABEL_34;
                v10 = *(_QWORD *)(v3 + 8 * v11);
                if (!v10)
                {
                  v12 = v4 + 6;
                  while (v12 < v6)
                  {
                    v10 = *(_QWORD *)(v3 + 8 * v12++);
                    if (v10)
                    {
                      v11 = v12 - 1;
                      goto LABEL_19;
                    }
                  }
LABEL_34:
                  sub_10005E1F4(v2);
                  return;
                }
              }
            }
          }
        }
LABEL_19:
        v5 = (v10 - 1) & v10;
        v8 = __clz(__rbit64(v10)) + (v11 << 6);
        v4 = v11;
      }
      v13 = *(_QWORD *)(v2 + 56) + 16 * v8;
    }
    while ((*(_BYTE *)(v13 + 8) & 1) != 0);
    v14 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v8);
    v15 = *v14;
    v16 = v14[1];
    v30 = *(_QWORD *)v13;
    v17 = v1[2];
    if (v1[3] <= v17)
    {
      v18 = v17 + 1;
      swift_bridgeObjectRetain();
      sub_10020574C(v18, 1);
      v1 = v33;
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)(v31, v1[5]);
    String.hash(into:)(v31, v15, v16);
    v19 = Hasher._finalize()();
    v20 = (char *)(v1 + 8);
    v21 = -1 << *((_BYTE *)v1 + 32);
    v22 = v19 & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~v1[(v22 >> 6) + 8]) == 0)
      break;
    v24 = __clz(__rbit64((-1 << v22) & ~v1[(v22 >> 6) + 8])) | v22 & 0x7FFFFFFFFFFFFFC0;
LABEL_33:
    *(_QWORD *)&v20[(v24 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v24;
    v29 = (_QWORD *)(v1[6] + 16 * v24);
    *v29 = v15;
    v29[1] = v16;
    *(_QWORD *)(v1[7] + 8 * v24) = v30;
    ++v1[2];
  }
  v25 = 0;
  v26 = (unint64_t)(63 - v21) >> 6;
  while (++v23 != v26 || (v25 & 1) == 0)
  {
    v27 = v23 == v26;
    if (v23 == v26)
      v23 = 0;
    v25 |= v27;
    v28 = *(_QWORD *)&v20[8 * v23];
    if (v28 != -1)
    {
      v24 = __clz(__rbit64(~v28)) + (v23 << 6);
      goto LABEL_33;
    }
  }
LABEL_36:
  __break(1u);
}

uint64_t sub_1001FF750(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v3;

  v2 = a1;
  v3 = sub_1001FF7C0(a1, a2, &off_100295348);
  swift_bridgeObjectRelease();
  if ((v3 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v2;
}

_UNKNOWN **sub_1001FF7B0()
{
  return &off_100295348;
}

uint64_t sub_1001FF7C0(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t *v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;

  v3 = a3[2];
  if (!v3)
    return 0;
  v7 = a3[4];
  v8 = a3[5];
  if (v7 == a1 && v8 == a2)
    return 1;
  result = sub_10000E3A4(v7, v8);
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v11 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v13 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v14 = *(v11 - 1);
    v15 = *v11;
    v16 = v14 == a1 && v15 == a2;
    if (v16 || (sub_10000E3A4(v14, v15) & 1) != 0)
      return 1;
    result = 0;
    v11 += 2;
    if (v13 == v3)
      return result;
  }
  __break(1u);
  return result;
}

void sub_1001FF86C(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  sub_100200AD0(a1, (uint64_t (*)(_QWORD, _QWORD))CGSize.init(_:), a2);
}

uint64_t sub_1001FF878@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain(v2);
}

_UNKNOWN **sub_1001FF884@<X0>(_QWORD *a1@<X8>)
{
  _UNKNOWN **result;

  result = sub_1001FF7B0();
  *a1 = result;
  return result;
}

uint64_t sub_1001FF8A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result;
  uint64_t v5;

  result = sub_1001FF750(a1, a2);
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_1001FF8CC()
{
  return HIDServicePropertyKey.intValue.getter();
}

uint64_t sub_1001FF8E8@<X0>(Swift::Int a1@<X0>, HIDUtils::HIDServicePropertyKey_optional *a2@<X8>)
{
  uint64_t result;
  HIDUtils::HIDServicePropertyKey_optional v4;

  v4 = HIDServicePropertyKey.init(intValue:)(a1);
  result = v4.value.rawValue._countAndFlagsBits;
  *a2 = v4;
  return result;
}

void sub_1001FF90C()
{
  uint64_t *v0;

  sub_1001FF928(*v0);
}

void sub_1001FF928(uint64_t a1)
{
  _BYTE v1[72];

  sub_10000E5C0(a1);
  sub_1000103C0();
  sub_10016B9B0((uint64_t)v1);
  sub_10000E410();
  sub_10004740C();
  sub_10000E59C();
}

void sub_1001FF960(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  char v10;

  v1 = sub_10000E5C0(a1);
  sub_100206870(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10);
  sub_10004740C();
  sub_10000E59C();
}

uint64_t sub_1001FF988(uint64_t a1)
{
  uint64_t *v1;

  return sub_1001FF9A4(a1, *v1, v1[1]);
}

uint64_t sub_1001FF9A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_bridgeObjectRetain();
  sub_10016B9B0(a1);
  return sub_10016A904(a3);
}

void sub_1001FF9DC(int a1, Swift::UInt32 a2)
{
  Hasher._combine(_:)(a2);
  sub_1000050D4();
}

void sub_1001FF9FC(uint64_t a1)
{
  uint64_t *v1;

  sub_1001FFA40(a1, *v1);
}

void sub_1001FFA14(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  char v11;

  v2 = sub_1000A3780(a1, a2);
  sub_100206870(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11);
  sub_10004740C();
  sub_10000E59C();
}

void sub_1001FFA40(uint64_t a1, uint64_t a2)
{
  _BYTE v2[72];

  sub_1000A3780(a1, a2);
  sub_1000103C0();
  sub_10016B9B0((uint64_t)v2);
  sub_10000E410();
  sub_10004740C();
  sub_10000E59C();
}

uint64_t sub_1001FFA78(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10020405C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001FFAA0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10020405C();
  return CodingKey.debugDescription.getter(a1, v2);
}

void HIDServiceProperties.HIDAccelCurve.init(from:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  char v27;
  char v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;

  sub_10003AFC4();
  v2 = v1;
  v4 = v3;
  sub_1000055B0(&qword_1002B65C0);
  sub_10003B160();
  __chkstk_darwin(v5);
  sub_10000DBE4(v2, v2[3]);
  v6 = sub_10020405C();
  sub_1002066C4((uint64_t)&type metadata for HIDServiceProperties.HIDAccelCurve.HIDAccelCurveKey, v7, v6);
  if (v0)
  {
    sub_10003B008();
  }
  else
  {
    sub_1002062B4();
    v8 = sub_100206100();
    v10 = v9;
    v41 = v8;
    v11 = sub_100206090(0xD000000000000012);
    v42 = v12;
    v40 = v11;
    v13 = sub_100206090(0xD000000000000015);
    v38 = v14;
    v39 = v13;
    v15 = sub_100206090(0xD000000000000013);
    v36 = v16;
    v37 = v15;
    sub_1002061C4();
    v17 = sub_100206100();
    v34 = v18;
    v35 = v17;
    v19 = sub_100206090(0xD00000000000001DLL);
    v32 = v20;
    v33 = v19;
    v21 = sub_100206090(0xD00000000000001ALL);
    v30 = v22;
    v31 = v21;
    v23 = sub_100206090(0xD000000000000021);
    v28 = v24;
    v29 = v23;
    v25 = sub_100206090(0xD00000000000001FLL);
    v27 = v26;
    sub_100179480();
    sub_10003B008();
    *(_QWORD *)v4 = v41;
    *(_BYTE *)(v4 + 8) = v10 & 1;
    *(_QWORD *)(v4 + 16) = v40;
    *(_BYTE *)(v4 + 24) = v42 & 1;
    *(_QWORD *)(v4 + 32) = v39;
    *(_BYTE *)(v4 + 40) = v38 & 1;
    *(_QWORD *)(v4 + 48) = v37;
    *(_BYTE *)(v4 + 56) = v36 & 1;
    *(_QWORD *)(v4 + 64) = v35;
    *(_BYTE *)(v4 + 72) = v34 & 1;
    *(_QWORD *)(v4 + 80) = v33;
    *(_BYTE *)(v4 + 88) = v32 & 1;
    *(_QWORD *)(v4 + 96) = v31;
    *(_BYTE *)(v4 + 104) = v30 & 1;
    *(_QWORD *)(v4 + 112) = v29;
    *(_BYTE *)(v4 + 120) = v28 & 1;
    *(_QWORD *)(v4 + 128) = v25;
    *(_BYTE *)(v4 + 136) = v27 & 1;
  }
  sub_10003AF60();
}

void HIDServiceProperties.HIDAccelCurve.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;

  sub_10003AFC4();
  v2 = v0;
  v4 = v3;
  v5 = sub_1000055B0(&qword_1002B65D0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v4[3];
  v10 = v4[4];
  sub_10000DBE4(v4, v9);
  v11 = sub_10020405C();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for HIDServiceProperties.HIDAccelCurve.HIDAccelCurveKey, &type metadata for HIDServiceProperties.HIDAccelCurve.HIDAccelCurveKey, v11, v9, v10);
  sub_1002062B4();
  v19 = 0xD000000000000011;
  v20 = v12;
  sub_100206114(v13, v14);
  if (!v1)
  {
    sub_1002060B0(*(_QWORD *)(v2 + 16), *(unsigned __int8 *)(v2 + 24), 0xD000000000000012);
    sub_1002060B0(*(_QWORD *)(v2 + 32), *(unsigned __int8 *)(v2 + 40), 0xD000000000000015);
    sub_1002060B0(*(_QWORD *)(v2 + 48), *(unsigned __int8 *)(v2 + 56), 0xD000000000000013);
    sub_1002061C4();
    v19 = v15;
    v20 = v16;
    sub_100206114(v17, v18);
    sub_1002060B0(*(_QWORD *)(v2 + 80), *(unsigned __int8 *)(v2 + 88), 0xD00000000000001DLL);
    sub_1002060B0(*(_QWORD *)(v2 + 96), *(unsigned __int8 *)(v2 + 104), 0xD00000000000001ALL);
    sub_1002060B0(*(_QWORD *)(v2 + 112), *(unsigned __int8 *)(v2 + 120), 0xD000000000000021);
    sub_1002060B0(*(_QWORD *)(v2 + 128), *(unsigned __int8 *)(v2 + 136), 0xD00000000000001FLL);
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_10003AF60();
}

void HIDServiceProperties.HIDAccelCurve.hash(into:)()
{
  uint64_t v0;
  Swift::UInt v1;

  if (*(_BYTE *)(v0 + 8) == 1)
  {
    sub_1002063E0();
  }
  else
  {
    sub_1002063D8();
    sub_100206390();
  }
  if (*(_BYTE *)(v0 + 24) == 1)
  {
    sub_1002063E0();
  }
  else
  {
    sub_1002063D8();
    sub_100206390();
  }
  if (*(_BYTE *)(v0 + 40) == 1)
  {
    sub_1002063E0();
  }
  else
  {
    sub_1002063D8();
    sub_100206390();
  }
  if (*(_BYTE *)(v0 + 56) == 1)
  {
    sub_1002063E0();
  }
  else
  {
    sub_1002063D8();
    sub_100206390();
  }
  if (*(_BYTE *)(v0 + 72) == 1)
  {
    sub_1002063E0();
  }
  else
  {
    sub_1002063D8();
    sub_100206390();
  }
  if (*(_BYTE *)(v0 + 88) == 1)
  {
    sub_1002063E0();
  }
  else
  {
    sub_1002063D8();
    sub_100206390();
  }
  if (*(_BYTE *)(v0 + 104) == 1)
  {
    sub_1002063E0();
  }
  else
  {
    sub_1002063D8();
    sub_100206390();
  }
  if (*(_BYTE *)(v0 + 120) == 1)
  {
    sub_1002063E0();
  }
  else
  {
    sub_1002063D8();
    sub_100206390();
  }
  if (*(_BYTE *)(v0 + 136) == 1)
  {
    sub_1002063E0();
  }
  else
  {
    v1 = *(_QWORD *)(v0 + 128);
    sub_1002063D8();
    Hasher._combine(_:)(v1);
  }
  sub_10000B350();
}

uint64_t static HIDServiceProperties.HIDAccelCurve.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;

  v2 = *(_BYTE *)(a2 + 8);
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 8))
      return 0;
  }
  else
  {
    if (*(_QWORD *)a1 != *(_QWORD *)a2)
      v2 = 1;
    if ((v2 & 1) != 0)
      return 0;
  }
  v3 = *(_BYTE *)(a2 + 24);
  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 24))
      return 0;
  }
  else
  {
    if (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
      v3 = 1;
    if ((v3 & 1) != 0)
      return 0;
  }
  v4 = *(_BYTE *)(a2 + 40);
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 40))
      return 0;
  }
  else
  {
    if (*(_QWORD *)(a1 + 32) != *(_QWORD *)(a2 + 32))
      v4 = 1;
    if ((v4 & 1) != 0)
      return 0;
  }
  v5 = *(_BYTE *)(a2 + 56);
  if ((*(_BYTE *)(a1 + 56) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 56))
      return 0;
  }
  else
  {
    if (*(_QWORD *)(a1 + 48) != *(_QWORD *)(a2 + 48))
      v5 = 1;
    if ((v5 & 1) != 0)
      return 0;
  }
  v6 = *(_BYTE *)(a2 + 72);
  if ((*(_BYTE *)(a1 + 72) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 72))
      return 0;
  }
  else
  {
    if (*(_QWORD *)(a1 + 64) != *(_QWORD *)(a2 + 64))
      v6 = 1;
    if ((v6 & 1) != 0)
      return 0;
  }
  v7 = *(_BYTE *)(a2 + 88);
  if ((*(_BYTE *)(a1 + 88) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 88))
      return 0;
  }
  else
  {
    if (*(_QWORD *)(a1 + 80) != *(_QWORD *)(a2 + 80))
      v7 = 1;
    if ((v7 & 1) != 0)
      return 0;
  }
  v8 = *(_BYTE *)(a2 + 104);
  if ((*(_BYTE *)(a1 + 104) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 104))
      return 0;
  }
  else
  {
    if (*(_QWORD *)(a1 + 96) != *(_QWORD *)(a2 + 96))
      v8 = 1;
    if ((v8 & 1) != 0)
      return 0;
  }
  v9 = *(_BYTE *)(a2 + 120);
  if ((*(_BYTE *)(a1 + 120) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 120))
      return 0;
  }
  else
  {
    if (*(_QWORD *)(a1 + 112) != *(_QWORD *)(a2 + 112))
      v9 = 1;
    if ((v9 & 1) != 0)
      return 0;
  }
  v10 = *(_BYTE *)(a2 + 136);
  if ((*(_BYTE *)(a1 + 136) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 136) & 1) == 0)
      return 0;
  }
  else
  {
    if (*(_QWORD *)(a1 + 128) != *(_QWORD *)(a2 + 128))
      v10 = 1;
    if ((v10 & 1) != 0)
      return 0;
  }
  return 1;
}

void HIDServiceProperties.HIDAccelCurve.hashValue.getter(uint64_t a1)
{
  sub_10000E5C0(a1);
  HIDServiceProperties.HIDAccelCurve.hash(into:)();
  sub_10004740C();
  sub_10000E59C();
}

void sub_100200264(void *a1@<X8>)
{
  uint64_t v1;
  _BYTE v3[137];

  HIDServiceProperties.HIDAccelCurve.init(from:)();
  if (!v1)
    memcpy(a1, v3, 0x89uLL);
}

void sub_1002002AC()
{
  HIDServiceProperties.HIDAccelCurve.encode(to:)();
}

Swift::Int sub_1002002C8(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  HIDServiceProperties.HIDAccelCurve.hash(into:)();
  return Hasher._finalize()();
}

uint64_t sub_100200304(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  unint64_t v12;

  v3 = sub_1000055B0(&qword_1002B66F0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v8 = a1[4];
  sub_10000DBE4(a1, v7);
  v9 = sub_1002052F0();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for HIDServiceProperties.HIDDeviceUsagePair.HIDDeviceUsagePairKey, &type metadata for HIDServiceProperties.HIDDeviceUsagePair.HIDDeviceUsagePairKey, v9, v7, v8);
  if (!v1)
  {
    v11 = 0x7355656369766544;
    v12 = 0xEB00000000656761;
    v7 = KeyedDecodingContainer.decode(_:forKey:)(&v11, v3);
    v11 = 0x7355656369766544;
    v12 = 0xEF65676150656761;
    KeyedDecodingContainer.decode(_:forKey:)(&v11, v3);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  sub_100005988(a1);
  return v7;
}

uint64_t sub_10020047C(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v15;
  unint64_t v16;

  v7 = sub_1000055B0(&qword_1002B6700);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a1[3];
  v12 = a1[4];
  sub_10000DBE4(a1, v11);
  v13 = sub_1002052F0();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for HIDServiceProperties.HIDDeviceUsagePair.HIDDeviceUsagePairKey, &type metadata for HIDServiceProperties.HIDDeviceUsagePair.HIDDeviceUsagePairKey, v13, v11, v12);
  v15 = 0x7355656369766544;
  v16 = 0xEB00000000656761;
  KeyedEncodingContainer.encode(_:forKey:)(a2, &v15, v7);
  if (!v3)
  {
    v15 = 0x7355656369766544;
    v16 = 0xEF65676150656761;
    KeyedEncodingContainer.encode(_:forKey:)(a3, &v15, v7);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_1002005C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t *v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  if (*(_QWORD *)"DeviceUsage" == a1 && *(_QWORD *)"age" == a2)
    return v3;
  result = _stringCompareWithSmolCheck(_:_:expecting:)(*(_QWORD *)"DeviceUsage", *(_QWORD *)"age", a1, a2, 0);
  if ((result & 1) != 0)
    return v3;
  v6 = (uint64_t *)&unk_100295430;
  for (i = 1; ; ++i)
  {
    v8 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v9 = *(v6 - 1);
    v10 = *v6;
    if (v9 == v3 && v10 == a2)
      return v3;
    result = _stringCompareWithSmolCheck(_:_:expecting:)(v9, v10, v3, a2, 0);
    if ((result & 1) != 0)
      return v3;
    v6 += 2;
    if (v8 == 2)
    {
      swift_bridgeObjectRelease(a2);
      return 0;
    }
  }
  __break(1u);
  return result;
}

_UNKNOWN **sub_100200698()
{
  return &off_1002953F8;
}

void _s8HIDUtils20HIDServicePropertiesV20HIDSurfaceDimensionsV4hash4intoys6HasherVz_tF_0(int a1, Swift::UInt a2, Swift::UInt a3)
{
  Hasher._combine(_:)(a2);
  Hasher._combine(_:)(a3);
}

BOOL static HIDServiceProperties.HIDSurfaceDimensions.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1 == a3 && a2 == a4;
}

void sub_1002006E8(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  sub_100200AD0(a1, (uint64_t (*)(_QWORD, _QWORD))CGPoint.init(_:), a2);
}

_UNKNOWN **sub_1002006F4@<X0>(_QWORD *a1@<X8>)
{
  _UNKNOWN **result;

  result = sub_100200698();
  *a1 = result;
  return result;
}

uint64_t sub_100200718@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result;
  uint64_t v5;

  result = sub_1002005C4(a1, a2);
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_10020073C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1002052F0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100200764(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1002052F0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10020078C(uint64_t *a1, uint64_t *a2)
{
  return sub_1001F3EA4(*a1, a1[1], *a2, a2[1]);
}

uint64_t sub_1002007A0@<X0>(uint64_t *a1@<X8>)
{
  return sub_100200BE4((uint64_t (*)(void))sub_100200304, a1);
}

uint64_t sub_1002007BC(_QWORD *a1)
{
  uint64_t *v1;

  return sub_10020047C(a1, *v1, v1[1]);
}

void sub_1002007D4()
{
  uint64_t *v0;

  _s8HIDUtils20HIDServicePropertiesV20HIDSurfaceDimensionsV9hashValueSivg_0(*v0);
}

void sub_1002007EC(int a1)
{
  Swift::UInt *v1;

  _s8HIDUtils20HIDServicePropertiesV20HIDSurfaceDimensionsV4hash4intoys6HasherVz_tF_0(a1, *v1, v1[1]);
}

BOOL sub_1002007F8(uint64_t *a1, uint64_t *a2)
{
  return static HIDServiceProperties.HIDSurfaceDimensions.== infix(_:_:)(*a1, a1[1], *a2, a2[1]);
}

uint64_t HIDServiceProperties.HIDSurfaceDimensions.height.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t HIDServiceProperties.HIDSurfaceDimensions.height.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

uint64_t HIDServiceProperties.HIDSurfaceDimensions.init(from:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = sub_1000055B0(&qword_1002B65D8);
  __chkstk_darwin(v2);
  sub_100026500();
  v3 = a1[3];
  v4 = a1[4];
  sub_10000DBE4(a1, v3);
  v5 = sub_100204098();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for HIDServiceProperties.HIDSurfaceDimensions.HIDSurfaceDimensionsKey, &type metadata for HIDServiceProperties.HIDSurfaceDimensions.HIDSurfaceDimensionsKey, v5, v3, v4);
  sub_1002065B8();
  sub_1002064E8(v6);
  sub_1002065A4();
  v8 = sub_1002064E8(v7);
  sub_1000876AC();
  sub_10003B008();
  return v8;
}

void HIDServiceProperties.HIDSurfaceDimensions.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  sub_10003AFC4();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = sub_1000055B0(&qword_1002B65E8);
  sub_10003B160();
  __chkstk_darwin(v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000DBE4(v7, v7[3]);
  v12 = sub_100204098();
  sub_100206674((uint64_t)&type metadata for HIDServiceProperties.HIDSurfaceDimensions.HIDSurfaceDimensionsKey, v13, v12);
  sub_1002065B8();
  v18 = v14;
  v19 = v15;
  sub_100206770(v3, (uint64_t)&v18);
  if (!v0)
  {
    sub_1002065A4();
    v18 = v16;
    v19 = v17;
    sub_100206770(v5, (uint64_t)&v18);
  }
  (*(void (**)(char *, uint64_t))(v1 + 8))(v11, v8);
  sub_10003AF60();
}

uint64_t sub_1002009F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t *v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  if (*(_QWORD *)"Height" == a1 && a2 == 0xE600000000000000)
    return v3;
  result = _stringCompareWithSmolCheck(_:_:expecting:)(*(_QWORD *)"Height", 0xE600000000000000, a1, a2, 0);
  if ((result & 1) != 0)
    return v3;
  v6 = (uint64_t *)&unk_100295470;
  for (i = 1; ; ++i)
  {
    v8 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v9 = *(v6 - 1);
    v10 = *v6;
    if (v9 == v3 && v10 == a2)
      return v3;
    result = _stringCompareWithSmolCheck(_:_:expecting:)(v9, v10, v3, a2, 0);
    if ((result & 1) != 0)
      return v3;
    v6 += 2;
    if (v8 == 2)
    {
      swift_bridgeObjectRelease(a2);
      return 0;
    }
  }
  __break(1u);
  return result;
}

_UNKNOWN **sub_100200AC4()
{
  return &off_100295438;
}

void sub_100200AD0(_QWORD *a1@<X0>, uint64_t (*a2)(_QWORD, _QWORD)@<X3>, _QWORD *a3@<X8>)
{
  uint64_t v4;

  *a3 = a2(*a1, a1[1]);
  a3[1] = v4;
  sub_1000050D4();
}

_UNKNOWN **sub_100200AF8@<X0>(_QWORD *a1@<X8>)
{
  _UNKNOWN **result;

  result = sub_100200AC4();
  *a1 = result;
  return result;
}

uint64_t sub_100200B1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result;
  uint64_t v5;

  result = sub_1002009F0(a1, a2);
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_100200B40(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100204098();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100200B68(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100204098();
  return CodingKey.debugDescription.getter(a1, v2);
}

void _s8HIDUtils20HIDServicePropertiesV20HIDSurfaceDimensionsV9hashValueSivg_0(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  char v10;

  sub_10000E5C0(a1);
  sub_100206390();
  sub_100013C38(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10);
  sub_10004740C();
  sub_1000C26D8();
}

uint64_t sub_100200BC8@<X0>(uint64_t *a1@<X8>)
{
  return sub_100200BE4((uint64_t (*)(void))HIDServiceProperties.HIDSurfaceDimensions.init(from:), a1);
}

uint64_t sub_100200BE4@<X0>(uint64_t (*a1)(void)@<X4>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = a1();
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

void sub_100200C10()
{
  HIDServiceProperties.HIDSurfaceDimensions.encode(to:)();
}

uint64_t sub_100200C28()
{
  _QWORD *v0;

  return HIDServiceProperties.HIDSurfaceDimensions.hashValue.getter(*v0, v0[1]);
}

void sub_100200C30(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  char v11;

  v2 = sub_1000A3780(a1, a2);
  sub_100013C38(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11);
  sub_100206390();
  sub_10004740C();
  sub_1000C26D8();
}

_QWORD *HIDServiceProperties.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  NSNumber v21;
  uint64_t v22;
  uint64_t v23;
  Class isa;
  Class v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  void *v29;
  uint64_t v30;
  Class v31;
  Class v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int64_t v39;
  objc_class *v40;
  _QWORD *v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  char *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  NSNumber v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  NSNumber v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  NSNumber v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  Class v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  NSNumber v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  NSNumber v96;
  uint64_t v97;
  uint64_t v98;
  char v99;
  NSNumber v100;
  uint64_t v101;
  uint64_t v102;
  char v103;
  NSNumber v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  char v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  char v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  Class v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  char v136;
  NSNumber v137;
  uint64_t v138;
  uint64_t v139;
  char v140;
  NSNumber v141;
  uint64_t v142;
  uint64_t v143;
  char v144;
  NSNumber v145;
  uint64_t v146;
  uint64_t v147;
  NSNumber v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  NSString v153;
  uint64_t v154;
  uint64_t v155;
  char v156;
  NSNumber v157;
  uint64_t v158;
  uint64_t v159;
  char v160;
  NSNumber v161;
  uint64_t v162;
  uint64_t v163;
  NSNumber v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  char v168;
  void *v170;
  uint64_t v171;
  id v172;
  __int16 v173;
  __int16 v174;
  unint64_t v175;
  uint64_t v176;
  uint64_t v177;
  __int128 v178;
  char v179;
  objc_class *v180;
  uint64_t v181;
  _QWORD *v182;
  id v183;
  id v184;
  uint64_t v185;
  uint64_t v186;

  sub_10003AFC4();
  v185 = v1;
  v186 = v2;
  v4 = v3;
  v5 = sub_1000055B0(&qword_1002B65F0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_100026500();
  v7 = objc_msgSend(objc_allocWithZone((Class)NSMutableDictionary), "init");
  v183 = v7;
  v8 = sub_10000DBE4(v4, v4[3]);
  v9 = sub_1002040D4();
  sub_1002066C4((uint64_t)&type metadata for HIDServicePropertyKey, v10, v9);
  if (v0)
  {
    sub_10003B008();

  }
  else
  {
    sub_100206634();
    *(_QWORD *)&v178 = v11;
    *((_QWORD *)&v178 + 1) = v12;
    v13 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v178);
    if ((v14 & 1) != 0)
      v15 = 0;
    else
      v15 = v13;
    v182 = (_QWORD *)v15;
    sub_10003B038();
    sub_1002064A0();
    *(_QWORD *)&v178 = v16;
    *((_QWORD *)&v178 + 1) = v17;
    sub_10020684C((uint64_t)&unk_1002B6608);
    v19 = v18;
    sub_100206864();
    sub_1002062D8();
    v184 = v7;
    sub_10020671C();
    HIDServiceProperties.accelParametricCurves.setter(v180);
    *(_QWORD *)&v178 = v19;
    *((_QWORD *)&v178 + 1) = 0x800000010025A9F0;
    sub_10020624C();
    sub_100206748();
    if (v20)
      v21.super.super.isa = 0;
    else
      v21.super.super.isa = sub_100206618().super.super.isa;
    sub_100206854(0x800000010025A9F0);
    v23 = sub_1002060E8(v22, (uint64_t)&type metadata for String);
    sub_10020600C(v23, "__swift_setObject:forKeyedSubscript:");

    sub_1000A37CC();
    strcpy((char *)&v178, "Authenticated");
    HIWORD(v178) = -4864;
    sub_10020624C();
    sub_100206748();
    if (v20)
    {
      v25 = 0;
    }
    else
    {
      isa = sub_100206618().super.super.isa;
      v25 = isa;
    }
    strcpy((char *)&v178, "Authenticated");
    HIWORD(v178) = -4864;
    v26 = sub_1002060E8((uint64_t)isa, (uint64_t)&type metadata for String);
    sub_10020600C(v26, "__swift_setObject:forKeyedSubscript:");

    swift_unknownObjectRelease(v26);
    strcpy((char *)&v178, "CapsLockDelay");
    HIWORD(v178) = -4864;
    v27 = sub_100205FE4();
    if ((v28 & 1) != 0)
    {
      v29 = 0;
    }
    else
    {
      v27 = (uint64_t)Int._bridgeToObjectiveC()().super.super.isa;
      v29 = (void *)v27;
    }
    strcpy((char *)&v178, "CapsLockDelay");
    HIWORD(v178) = -4864;
    v30 = sub_1002060E8(v27, (uint64_t)&type metadata for String);
    sub_10020600C(v30, "__swift_setObject:forKeyedSubscript:");

    sub_1000A37CC();
    *(_QWORD *)&v178 = 0xD000000000000016;
    *((_QWORD *)&v178 + 1) = 0x800000010025AA10;
    sub_10020624C();
    sub_100206748();
    if (v20)
    {
      v32 = 0;
    }
    else
    {
      v31 = sub_100206618().super.super.isa;
      v32 = v31;
    }
    v33 = (_QWORD *)0xEE00746E69486570;
    *(_QWORD *)&v178 = 0xD000000000000016;
    *((_QWORD *)&v178 + 1) = 0x800000010025AA10;
    v34 = sub_1002060E8((uint64_t)v31, (uint64_t)&type metadata for String);
    sub_10020600C(v34, "__swift_setObject:forKeyedSubscript:");

    sub_1000A37CC();
    sub_100206808();
    sub_10020613C();
    if (v35)
    {
      sub_1002064CC();
      sub_100206298();
    }
    else
    {
      v32 = 0;
    }
    sub_100206808();
    v37 = sub_1002060E8(v36, (uint64_t)&type metadata for String);
    sub_10020600C(v37, "__swift_setObject:forKeyedSubscript:");

    sub_1000A37CC();
    sub_10003B038();
    sub_10020671C();
    sub_1002062B4();
    *(_QWORD *)&v178 = 0xEE00746E6948656CLL;
    *((_QWORD *)&v178 + 1) = v38;
    sub_10020684C((uint64_t)&unk_1002B6620);
    sub_100206864();
    sub_1002062D8();
    if (v180)
    {
      v39 = *((_QWORD *)v180 + 2);
      v40 = v180;
      if (v39)
      {
        *(_QWORD *)&v178 = _swiftEmptyArrayStorage;
        sub_1001F39CC(0, v39, 0);
        v41 = (_QWORD *)v178;
        v42 = *(_QWORD *)(v178 + 16);
        v43 = 4 * v42;
        v44 = (uint64_t *)((char *)v40 + 40);
        do
        {
          v45 = *(v44 - 1);
          v46 = *v44;
          *(_QWORD *)&v178 = v41;
          v47 = v41[3];
          v48 = v42 + 1;
          if (v42 >= v47 >> 1)
          {
            v174 = v45;
            v175 = v42 + 1;
            v173 = v46;
            sub_1001F39CC((char *)(v47 > 1), v42 + 1, 1);
            LOWORD(v46) = v173;
            LOWORD(v45) = v174;
            v48 = v175;
            v41 = (_QWORD *)v178;
          }
          v44 += 2;
          v41[2] = v48;
          v49 = (char *)v41 + v43;
          *((_WORD *)v49 + 16) = v46;
          *((_WORD *)v49 + 17) = v45;
          v43 += 4;
          v42 = v48;
          --v39;
        }
        while (v39);
        v33 = v41;
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_100075850();
        v33 = _swiftEmptyArrayStorage;
      }
      HIDServiceProperties.deviceUsagePairs.setter((uint64_t)v33);
      sub_10020671C();
    }
    v50 = (void *)sub_1000055B0(&qword_1002B6598);
    sub_1002063A0((uint64_t)v33 + 5);
    sub_100204868((uint64_t)&unk_1002B6630);
    sub_100206864();
    sub_1002062D8();
    if (v180)
    {
      Dictionary._bridgeToObjectiveC()();
      sub_100206298();
    }
    else
    {
      v50 = 0;
    }
    sub_1002063A0(0xD000000000000019);
    v52 = sub_1002060E8(v51, (uint64_t)&type metadata for String);
    sub_10020600C(v52, "__swift_setObject:forKeyedSubscript:");
    sub_10000F718();
    sub_1000A37CC();
    *(_QWORD *)&v178 = 0xD000000000000012;
    *((_QWORD *)&v178 + 1) = 0x800000010025AA70;
    v53 = sub_10020613C();
    if (v54)
    {
      sub_1002064CC();
      v53 = sub_100206298();
    }
    else
    {
      v50 = 0;
    }
    *(_QWORD *)&v178 = 0xD000000000000012;
    *((_QWORD *)&v178 + 1) = 0x800000010025AA70;
    v55 = sub_1002060E8(v53, (uint64_t)&type metadata for String);
    sub_10020600C(v55, "__swift_setObject:forKeyedSubscript:");

    sub_1000A37CC();
    *(_QWORD *)&v178 = 0x437972746E756F43;
    *((_QWORD *)&v178 + 1) = 0xEB0000000065646FLL;
    v56 = sub_100205FE4();
    if ((v57 & 1) != 0)
    {
      v58 = 0;
    }
    else
    {
      v56 = (uint64_t)Int._bridgeToObjectiveC()().super.super.isa;
      v58 = (void *)v56;
    }
    *(_QWORD *)&v178 = 0x437972746E756F43;
    *((_QWORD *)&v178 + 1) = 0xEB0000000065646FLL;
    v59 = sub_1002060E8(v56, (uint64_t)&type metadata for String);
    sub_10020600C(v59, "__swift_setObject:forKeyedSubscript:");

    sub_1000A37CC();
    *(_QWORD *)&v178 = 0xEE00746E6948656CLL;
    *((_QWORD *)&v178 + 1) = 0x800000010025AA90;
    v60 = sub_10020613C();
    if (v61)
    {
      sub_1002064CC();
      v60 = sub_100206298();
    }
    else
    {
      v58 = 0;
    }
    *(_QWORD *)&v178 = 0xEE00746E6948656CLL;
    *((_QWORD *)&v178 + 1) = 0x800000010025AA90;
    v62 = sub_1002060E8(v60, (uint64_t)&type metadata for String);
    sub_10020600C(v62, "__swift_setObject:forKeyedSubscript:");

    sub_1000A37CC();
    strcpy((char *)&v178, "StandardType");
    BYTE13(v178) = 0;
    HIWORD(v178) = -5120;
    v63 = sub_100205FE4();
    if ((v64 & 1) != 0)
    {
      v65 = 0;
    }
    else
    {
      v63 = (uint64_t)Int._bridgeToObjectiveC()().super.super.isa;
      v65 = (void *)v63;
    }
    strcpy((char *)&v178, "StandardType");
    BYTE13(v178) = 0;
    HIWORD(v178) = -5120;
    v66 = sub_1002060E8(v63, (uint64_t)&type metadata for String);
    sub_10020600C(v66, "__swift_setObject:forKeyedSubscript:");

    sub_1000A37CC();
    strcpy((char *)&v178, "Manufacturer");
    BYTE13(v178) = 0;
    HIWORD(v178) = -5120;
    sub_10020613C();
    if (v67)
    {
      sub_1002064CC();
      sub_100206298();
    }
    else
    {
      v65 = 0;
    }
    sub_1002068C4();
    *(_QWORD *)&v178 = v68;
    *((_QWORD *)&v178 + 1) = 0xEC00000072657275;
    v70 = sub_1002060E8(v69, (uint64_t)&type metadata for String);
    sub_10020600C(v70, "__swift_setObject:forKeyedSubscript:");

    sub_1000A37CC();
    sub_100206854(0x800000010025AAB0);
    sub_100205FE4();
    if ((v71 & 1) != 0)
      v72.super.super.isa = 0;
    else
      v72.super.super.isa = Int._bridgeToObjectiveC()().super.super.isa;
    sub_1002068B0();
    v74 = sub_1002060E8(v73, (uint64_t)&type metadata for String);
    sub_10020600C(v74, "__swift_setObject:forKeyedSubscript:");

    sub_1000A37CC();
    *(_QWORD *)&v178 = "rdLanguage";
    *((_QWORD *)&v178 + 1) = 0x800000010025AAD0;
    sub_100205FE4();
    if ((v75 & 1) != 0)
      v76.super.super.isa = 0;
    else
      v76.super.super.isa = Int._bridgeToObjectiveC()().super.super.isa;
    sub_1002063A0(0xD00000000000001ALL);
    v78 = sub_1002060E8(v77, (uint64_t)&type metadata for String);
    sub_10020600C(v78, "__swift_setObject:forKeyedSubscript:");

    sub_1000A37CC();
    *(_QWORD *)&v178 = 0xD000000000000020;
    *((_QWORD *)&v178 + 1) = 0x800000010025AAF0;
    sub_100205FE4();
    if ((v79 & 1) != 0)
      v80.super.super.isa = 0;
    else
      v80.super.super.isa = Int._bridgeToObjectiveC()().super.super.isa;
    sub_1002063A0(0xD000000000000020);
    v82 = sub_1002060E8(v81, (uint64_t)&type metadata for String);
    sub_10020600C(v82, "__swift_setObject:forKeyedSubscript:");

    sub_1000A37CC();
    sub_10020691C(0xD00000000000001BLL);
    sub_1000A2140();
    sub_100206500();
    sub_1002062D8();
    v83 = *((_QWORD *)&v178 + 1);
    v176 = v178;
    if (*((_QWORD *)&v178 + 1) >> 60 == 15)
      v84 = 0;
    else
      v84 = Data._bridgeToObjectiveC()().super.isa;
    sub_10020691C(0xD00000000000001BLL);
    v86 = (void *)sub_100206344(v85, (uint64_t)&type metadata for String);
    sub_1002067E0((uint64_t)v86, "__swift_setObject:forKeyedSubscript:");
    sub_100022AD8(v176, v83);

    sub_10000F718();
    sub_1002067A0();
    *(_QWORD *)&v178 = v87;
    *((_QWORD *)&v178 + 1) = 0x800000010025AB40;
    sub_10020613C();
    if (v88)
    {
      sub_1002064CC();
      sub_100206298();
    }
    else
    {
      v86 = 0;
    }
    sub_1002063A0(0xD00000000000001ALL);
    v90 = sub_1002060E8(v89, (uint64_t)&type metadata for String);
    sub_10020600C(v90, "__swift_setObject:forKeyedSubscript:");

    sub_1000A37CC();
    *(_QWORD *)&v178 = 0xD000000000000015;
    *((_QWORD *)&v178 + 1) = 0x800000010025AB60;
    sub_100205FE4();
    if ((v91 & 1) != 0)
      v92.super.super.isa = 0;
    else
      v92.super.super.isa = Int._bridgeToObjectiveC()().super.super.isa;
    sub_1002063A0(0xD000000000000015);
    v94 = sub_1002060E8(v93, (uint64_t)&type metadata for String);
    sub_10020600C(v94, "__swift_setObject:forKeyedSubscript:");

    sub_1000A37CC();
    *(_QWORD *)&v178 = 0xD000000000000014;
    *((_QWORD *)&v178 + 1) = 0x800000010025AB80;
    sub_100205FE4();
    if ((v95 & 1) != 0)
      v96.super.super.isa = 0;
    else
      v96.super.super.isa = Int._bridgeToObjectiveC()().super.super.isa;
    sub_1002068A4();
    v98 = sub_1002060E8(v97, (uint64_t)&type metadata for String);
    sub_10020600C(v98, "__swift_setObject:forKeyedSubscript:");

    sub_1000A37CC();
    *(_QWORD *)&v178 = 0xD000000000000014;
    *((_QWORD *)&v178 + 1) = 0x800000010025ABC0;
    sub_100205FE4();
    if ((v99 & 1) != 0)
      v100.super.super.isa = 0;
    else
      v100.super.super.isa = Int._bridgeToObjectiveC()().super.super.isa;
    sub_1002068B0();
    v102 = sub_1002060E8(v101, (uint64_t)&type metadata for String);
    sub_10020600C(v102, "__swift_setObject:forKeyedSubscript:");

    sub_1000A37CC();
    *(_QWORD *)&v178 = "HIDPointerResolution";
    *((_QWORD *)&v178 + 1) = 0x800000010025ABA0;
    sub_100205FE4();
    if ((v103 & 1) != 0)
      v104.super.super.isa = 0;
    else
      v104.super.super.isa = Int._bridgeToObjectiveC()().super.super.isa;
    sub_100206854(0x800000010025ABA0);
    v106 = sub_1002060E8(v105, (uint64_t)&type metadata for String);
    sub_10020600C(v106, "__swift_setObject:forKeyedSubscript:");

    sub_1000A37CC();
    strcpy((char *)&v178, "PrimaryUsage");
    BYTE13(v178) = 0;
    HIWORD(v178) = -5120;
    v107 = sub_100205FE4();
    if ((v108 & 1) != 0)
    {
      v109 = 0;
    }
    else
    {
      v107 = (uint64_t)Int._bridgeToObjectiveC()().super.super.isa;
      v109 = (void *)v107;
    }
    strcpy((char *)&v178, "PrimaryUsage");
    BYTE13(v178) = 0;
    HIWORD(v178) = -5120;
    v110 = sub_1002060E8(v107, (uint64_t)&type metadata for String);
    sub_10020600C(v110, "__swift_setObject:forKeyedSubscript:");

    sub_1000A37CC();
    *(_QWORD *)&v178 = 0xEE00746E6948656CLL;
    *((_QWORD *)&v178 + 1) = 0x8000000100258B50;
    v111 = sub_100205FE4();
    if ((v112 & 1) != 0)
    {
      v113 = 0;
    }
    else
    {
      v111 = (uint64_t)Int._bridgeToObjectiveC()().super.super.isa;
      v113 = (void *)v111;
    }
    *(_QWORD *)&v178 = 0xEE00746E6948656CLL;
    *((_QWORD *)&v178 + 1) = 0x8000000100258B50;
    v114 = sub_1002060E8(v111, (uint64_t)&type metadata for String);
    sub_10020600C(v114, "__swift_setObject:forKeyedSubscript:");

    sub_1000A37CC();
    *(_QWORD *)&v178 = 0x746375646F7250;
    *((_QWORD *)&v178 + 1) = 0xE700000000000000;
    v115 = sub_10020613C();
    if (v116)
    {
      sub_1002064CC();
      v115 = sub_100206298();
    }
    else
    {
      v113 = 0;
    }
    *(_QWORD *)&v178 = 0x746375646F7250;
    *((_QWORD *)&v178 + 1) = 0xE700000000000000;
    v117 = sub_1002060E8(v115, (uint64_t)&type metadata for String);
    sub_10020600C(v117, "__swift_setObject:forKeyedSubscript:");

    sub_1000A37CC();
    *(_QWORD *)&v178 = 0x49746375646F7250;
    *((_QWORD *)&v178 + 1) = 0xE900000000000044;
    v118 = sub_100205FE4();
    if ((v119 & 1) != 0)
    {
      v120 = 0;
    }
    else
    {
      v118 = (uint64_t)Int._bridgeToObjectiveC()().super.super.isa;
      v120 = (void *)v118;
    }
    *(_QWORD *)&v178 = 0x49746375646F7250;
    *((_QWORD *)&v178 + 1) = 0xE900000000000044;
    v121 = sub_1002060E8(v118, (uint64_t)&type metadata for String);
    sub_10020600C(v121, "__swift_setObject:forKeyedSubscript:");

    sub_1000A37CC();
    strcpy((char *)&v178, "ReportInterval");
    HIBYTE(v178) = -18;
    v122 = sub_100205FE4();
    if ((v123 & 1) != 0)
    {
      v124 = 0;
    }
    else
    {
      v122 = (uint64_t)Int._bridgeToObjectiveC()().super.super.isa;
      v124 = (void *)v122;
    }
    strcpy((char *)&v178, "ReportInterval");
    HIBYTE(v178) = -18;
    v125 = sub_1002060E8(v122, (uint64_t)&type metadata for String);
    sub_10020600C(v125, "__swift_setObject:forKeyedSubscript:");

    sub_1000A37CC();
    sub_1002067A0();
    sub_10020691C(v126);
    sub_100206500();
    sub_1002062D8();
    v127 = *((_QWORD *)&v178 + 1);
    v177 = v178;
    if (*((_QWORD *)&v178 + 1) >> 60 == 15)
      v128 = 0;
    else
      v128 = Data._bridgeToObjectiveC()().super.isa;
    sub_1002067A0();
    sub_10020691C(v129);
    v131 = (void *)sub_100206344(v130, (uint64_t)&type metadata for String);
    sub_1002067E0((uint64_t)v131, "__swift_setObject:forKeyedSubscript:");
    sub_100022AD8(v177, v127);

    sub_10000F718();
    *(_QWORD *)&v178 = 0xD000000000000019;
    *((_QWORD *)&v178 + 1) = 0x800000010025AC80;
    sub_10020613C();
    if (v132)
    {
      sub_1002064CC();
      sub_100206298();
    }
    else
    {
      v131 = 0;
    }
    sub_1002063A0(0xD000000000000019);
    v134 = sub_1002060E8(v133, (uint64_t)&type metadata for String);
    sub_10020600C(v134, "__swift_setObject:forKeyedSubscript:");

    sub_1000A37CC();
    sub_1002062B4();
    *(_QWORD *)&v178 = 0xD000000000000014;
    *((_QWORD *)&v178 + 1) = v135;
    sub_100206864();
    sub_1002062D8();
    HIDServiceProperties.scrollAccelParametricCurves.setter(v180);
    *(_QWORD *)&v178 = 0xD000000000000013;
    *((_QWORD *)&v178 + 1) = 0x800000010025ACC0;
    sub_100205FE4();
    if ((v136 & 1) != 0)
      v137.super.super.isa = 0;
    else
      v137.super.super.isa = Int._bridgeToObjectiveC()().super.super.isa;
    sub_1002068A4();
    v139 = sub_1002060E8(v138, (uint64_t)&type metadata for String);
    sub_10020616C(v139, "__swift_setObject:forKeyedSubscript:");

    sub_100206398();
    *(_QWORD *)&v178 = 0xD000000000000013;
    *((_QWORD *)&v178 + 1) = 0x800000010025ACE0;
    sub_100205FE4();
    if ((v140 & 1) != 0)
      v141.super.super.isa = 0;
    else
      v141.super.super.isa = Int._bridgeToObjectiveC()().super.super.isa;
    sub_1002068A4();
    v143 = sub_1002060E8(v142, (uint64_t)&type metadata for String);
    sub_10020616C(v143, "__swift_setObject:forKeyedSubscript:");

    sub_100206398();
    *(_QWORD *)&v178 = 0xD000000000000011;
    *((_QWORD *)&v178 + 1) = 0x800000010025AD60;
    sub_100205FE4();
    if ((v144 & 1) != 0)
      v145.super.super.isa = 0;
    else
      v145.super.super.isa = Int._bridgeToObjectiveC()().super.super.isa;
    sub_1002068A4();
    v147 = sub_1002060E8(v146, (uint64_t)&type metadata for String);
    sub_10020616C(v147, "__swift_setObject:forKeyedSubscript:");

    sub_100206398();
    *(_QWORD *)&v178 = 0xD000000000000018;
    *((_QWORD *)&v178 + 1) = 0x800000010025AD00;
    sub_10020624C();
    sub_100206748();
    if (v20)
      v148.super.super.isa = 0;
    else
      v148.super.super.isa = sub_100206618().super.super.isa;
    sub_1002063A0(0xD000000000000018);
    v150 = sub_1002060E8(v149, (uint64_t)&type metadata for String);
    sub_10020616C(v150, "__swift_setObject:forKeyedSubscript:");

    sub_100206398();
    sub_1002062B4();
    v180 = (objc_class *)0xD000000000000011;
    v181 = v151;
    sub_100204188();
    sub_100206500();
    sub_1002062D8();
    HIDServiceProperties.surfaceDimensions.setter(v178, *((uint64_t *)&v178 + 1), v179);
    sub_100206888();
    sub_10020613C();
    if (v152)
    {
      v153 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
    }
    else
    {
      v153 = 0;
    }
    sub_100206888();
    v155 = sub_1002060E8(v154, (uint64_t)&type metadata for String);
    sub_10020616C(v155, "__swift_setObject:forKeyedSubscript:");

    sub_100206398();
    *(_QWORD *)&v178 = 0xD000000000000017;
    *((_QWORD *)&v178 + 1) = 0x800000010025AD20;
    sub_100205FE4();
    if ((v156 & 1) != 0)
      v157.super.super.isa = 0;
    else
      v157.super.super.isa = Int._bridgeToObjectiveC()().super.super.isa;
    sub_1002063A0(0xD000000000000017);
    v159 = sub_1002060E8(v158, (uint64_t)&type metadata for String);
    sub_10020616C(v159, "__swift_setObject:forKeyedSubscript:");

    sub_100206398();
    *(_QWORD *)&v178 = 0xD00000000000001DLL;
    *((_QWORD *)&v178 + 1) = 0x800000010025AD40;
    sub_100205FE4();
    if ((v160 & 1) != 0)
      v161.super.super.isa = 0;
    else
      v161.super.super.isa = Int._bridgeToObjectiveC()().super.super.isa;
    sub_1002063A0(0xD00000000000001DLL);
    v163 = sub_1002060E8(v162, (uint64_t)&type metadata for String);
    sub_10020616C(v163, "__swift_setObject:forKeyedSubscript:");

    sub_100206398();
    *(_QWORD *)&v178 = 0xD000000000000017;
    *((_QWORD *)&v178 + 1) = 0x800000010025A9D0;
    sub_10020624C();
    sub_100206748();
    if (v20)
      v164.super.super.isa = 0;
    else
      v164.super.super.isa = sub_100206618().super.super.isa;
    sub_1002063A0(0xD000000000000017);
    v166 = sub_1002060E8(v165, (uint64_t)&type metadata for String);
    sub_10020616C(v166, "__swift_setObject:forKeyedSubscript:");

    sub_100206398();
    *(_QWORD *)&v178 = 0x4449726F646E6556;
    *((_QWORD *)&v178 + 1) = 0xE800000000000000;
    v167 = sub_100205FE4();
    if ((v168 & 1) != 0)
    {
      v170 = 0;
    }
    else
    {
      v167 = (uint64_t)Int._bridgeToObjectiveC()().super.super.isa;
      v170 = (void *)v167;
    }
    *(_QWORD *)&v178 = 0x4449726F646E6556;
    *((_QWORD *)&v178 + 1) = 0xE800000000000000;
    v171 = sub_1002060E8(v167, (uint64_t)&type metadata for String);
    sub_10020616C(v171, "__swift_setObject:forKeyedSubscript:");

    sub_100206398();
    sub_1000A342C(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
    v8 = v182;
    v172 = v183;
    sub_10003B008();

  }
  return v8;
}

void HIDServiceProperties.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  unsigned int v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unsigned int v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  char *v100;
  uint64_t v101;
  _QWORD *v102;
  unint64_t v103;
  uint64_t v104;
  unsigned __int16 *v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  unint64_t v109;
  _QWORD *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  id v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  int v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  int v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  id v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  int v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  char v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  char v167;
  uint64_t v168;
  char v169;
  uint64_t v170;
  char v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  char v183;
  uint64_t v184;
  char v185;
  uint64_t v186;
  char v187;
  uint64_t v188;
  char v189;
  uint64_t v190;
  char v191;
  uint64_t v192;
  char v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  char v198;
  uint64_t v199;
  char v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  void *v212;
  char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  char v218;
  uint64_t v219;
  char v220;
  uint64_t v221;
  char v222;
  uint64_t v223;
  uint64_t v224;
  HIDUtils::HIDServiceProperties::HIDSurfaceDimensions_optional v225;
  Swift::Bool is_nil;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  char v235;
  uint64_t v236;
  char v237;
  uint64_t v238;
  char v239;
  uint64_t v240;
  uint64_t v241;
  char *v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  void *v248;
  _OWORD v249[2];
  __int128 v250;
  Swift::Bool v251;
  uint64_t v252;
  void *v253;

  sub_10003AFC4();
  v253 = v2;
  v4 = v3;
  v6 = v5;
  v7 = sub_1000055B0(&qword_1002B6640);
  sub_10003B160();
  __chkstk_darwin(v8);
  v10 = (char *)&v240 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000DBE4(v6, v6[3]);
  v11 = sub_1002040D4();
  sub_100206674((uint64_t)&type metadata for HIDServicePropertyKey, v12, v11);
  if (!v4
    || (sub_100206634(),
        *(_QWORD *)&v250 = v13,
        *((_QWORD *)&v250 + 1) = v14,
        KeyedEncodingContainer.encode(_:forKey:)(v4, &v250, v7),
        !v0))
  {
    strcpy((char *)v249, "HIDAccelCurves");
    HIBYTE(v249[0]) = -18;
    v15 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(v249, &type metadata for String);
    v16 = objc_msgSend(v253, "__swift_objectForKeyedSubscript:", v15);
    swift_unknownObjectRelease(v15);
    v247 = v1;
    if (v16)
    {
      sub_100206188();
      v17 = sub_10000F718();
    }
    else
    {
      sub_100206354();
    }
    sub_10020617C(v17, v18, &qword_1002B34C0);
    if (v252)
    {
      sub_100060018(v19, &qword_1002B0900, NSArray_ptr);
      if ((sub_1002060F0(v20, v21, (uint64_t)&type metadata for Any + 8, v20) & 1) != 0)
      {
        v22 = v248;
        v23 = sub_1001F90C0();

        goto LABEL_12;
      }
    }
    else
    {
      sub_10020634C(v19, &qword_1002B34C0);
    }
    v23 = 0;
LABEL_12:
    *(_QWORD *)&v249[0] = v23;
    strcpy((char *)&v250, "HIDAccelCurves");
    HIBYTE(v250) = -18;
    v24 = sub_10003B038();
    sub_10020684C((uint64_t)&unk_1002B6648);
    v26 = v25;
    v27 = sub_100206534();
    sub_10020630C(v27, v28, v29, v24, v26);
    if (v0)
    {
      swift_bridgeObjectRelease();
LABEL_31:
      (*(void (**)(char *, uint64_t))(v247 + 8))(v10, v7);
      goto LABEL_32;
    }
    v246 = v26;
    sub_10020671C();
    v30 = sub_100075850();
    *(_QWORD *)&v250 = 0xEE00736576727543;
    *((_QWORD *)&v250 + 1) = 0x800000010025A9F0;
    v31 = sub_100206344(v30, (uint64_t)&type metadata for String);
    v32 = sub_1002061E8(v31, "__swift_objectForKeyedSubscript:");
    sub_1002061F4();
    if (&unk_1002B6600)
    {
      sub_100206188();
      v33 = sub_10000F718();
    }
    else
    {
      sub_100206354();
    }
    sub_10020617C(v33, v34, &qword_1002B34C0);
    if (v252)
    {
      sub_1002060F0(v35, v36, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Bool);
      sub_100206374();
      if (v39)
        v40 = v38;
      else
        v40 = v37;
    }
    else
    {
      sub_10020634C(v35, &qword_1002B34C0);
      v40 = 2;
    }
    *(_QWORD *)&v250 = 0xEE00736576727543;
    *((_QWORD *)&v250 + 1) = 0x800000010025A9F0;
    v41 = sub_10020626C(v40);
    v245 = v24;
    strcpy((char *)&v250, "Authenticated");
    HIWORD(v250) = -4864;
    v42 = sub_100206344(v41, (uint64_t)&type metadata for String);
    v43 = sub_1002061E8(v42, "__swift_objectForKeyedSubscript:");
    sub_1002061F4();
    if (&unk_1002B6600)
    {
      sub_100206188();
      v44 = sub_10000F718();
    }
    else
    {
      sub_100206354();
    }
    sub_10020617C(v44, v45, &qword_1002B34C0);
    if (v252)
    {
      sub_1002060F0(v46, v47, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Bool);
      sub_100206374();
      if (v39)
        v50 = v49;
      else
        v50 = v48;
    }
    else
    {
      sub_10020634C(v46, &qword_1002B34C0);
      v50 = 2;
    }
    strcpy((char *)&v250, "Authenticated");
    HIWORD(v250) = -4864;
    v51 = sub_10020626C(v50);
    *(_QWORD *)&v250 = 0x6E492D746C697542;
    *((_QWORD *)&v250 + 1) = 0xE800000000000000;
    v52 = sub_100206344(v51, (uint64_t)&type metadata for String);
    v53 = sub_1002061E8(v52, "__swift_objectForKeyedSubscript:");
    sub_1002061F4();
    if (&unk_1002B6600)
    {
      sub_100206188();
      v54 = sub_10000F718();
    }
    else
    {
      sub_100206354();
    }
    sub_10020617C(v54, v55, &qword_1002B34C0);
    if (v252)
    {
      sub_1002060F0(v56, v57, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Bool);
      sub_100206374();
      if (v39)
        v60 = v59;
      else
        v60 = v58;
    }
    else
    {
      sub_10020634C(v56, &qword_1002B34C0);
      v60 = 2;
    }
    *(_QWORD *)&v250 = 0xEE00736576727546;
    *((_QWORD *)&v250 + 1) = 0x800000010025A9D0;
    v61 = sub_10020626C(v60);
    strcpy((char *)&v250, "CapsLockDelay");
    HIWORD(v250) = -4864;
    v62 = sub_100206344(v61, (uint64_t)&type metadata for String);
    v63 = sub_1002061E8(v62, "__swift_objectForKeyedSubscript:");
    sub_1002061F4();
    if (&unk_1002B6600)
    {
      sub_100206188();
      v64 = sub_10000F718();
    }
    else
    {
      sub_100206354();
    }
    sub_10020617C(v64, v65, &qword_1002B34C0);
    if (v252)
    {
      v68 = sub_1002060F0(v66, v67, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int);
      v69 = sub_1002067F0(v68);
    }
    else
    {
      sub_10020634C(v66, &qword_1002B34C0);
      v69 = HIDServicePropertyKey.intValue.getter();
    }
    strcpy((char *)&v250, "CapsLockDelay");
    HIWORD(v250) = -4864;
    sub_100205FF8(v69, v70);
    sub_100206904(0xEE00736576727545);
    v72 = sub_100206344(v71, (uint64_t)&type metadata for String);
    v73 = sub_1002061E8(v72, "__swift_objectForKeyedSubscript:");
    sub_1002061F4();
    if (&unk_1002B6600)
    {
      sub_100206188();
      v74 = sub_10000F718();
    }
    else
    {
      sub_100206354();
    }
    sub_10020617C(v74, v75, &qword_1002B34C0);
    if (v252)
    {
      sub_1002060F0(v76, v77, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Bool);
      sub_100206374();
    }
    else
    {
      sub_10020634C(v76, &qword_1002B34C0);
    }
    sub_100206904(0xEE00736576727545);
    v79 = sub_10020626C(v78);
    strcpy((char *)&v250, "DeviceTypeHint");
    HIBYTE(v250) = -18;
    v80 = sub_100206344(v79, (uint64_t)&type metadata for String);
    v81 = sub_1002061E8(v80, "__swift_objectForKeyedSubscript:");
    sub_1002061F4();
    if (&type metadata for Any)
    {
      sub_100206188();
      v82 = sub_10000F718();
    }
    else
    {
      sub_100206354();
    }
    sub_10020617C(v82, v83, &qword_1002B34C0);
    if (v252)
    {
      v86 = sub_1002060F0(v84, v85, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for String);
      v87 = sub_100206318(v86, (uint64_t)v248);
      if (v39)
        v89 = 0;
      else
        v89 = v88;
    }
    else
    {
      sub_10020634C(v84, &qword_1002B34C0);
      v87 = 0;
      v89 = 0;
    }
    strcpy((char *)&v250, "DeviceTypeHint");
    HIBYTE(v250) = -18;
    sub_100206194(v87, v89, (uint64_t)&v250);
    sub_100075850();
    v90 = 0xEE0073657672753FLL;
    v91 = "CapsLockLanguageSwitch";
    *(_QWORD *)&v249[0] = 0xEE0073657672753FLL;
    *((_QWORD *)&v249[0] + 1) = 0x800000010025AA30;
    v92 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(v249, &type metadata for String);
    v93 = sub_1002061E8(v92, "__swift_objectForKeyedSubscript:");
    sub_1002061F4();
    if (&type metadata for Any)
    {
      sub_100206188();
      v94 = sub_10000F718();
    }
    else
    {
      sub_100206354();
    }
    sub_10020617C(v94, v95, &qword_1002B34C0);
    if (v252)
    {
      sub_100060018(v96, &qword_1002B0900, NSArray_ptr);
      if ((sub_1002060F0(v97, v98, (uint64_t)&type metadata for Any + 8, v97) & 1) != 0)
      {
        v99 = v248;
        v100 = sub_1001F92D0(v248);

LABEL_69:
        v101 = *((_QWORD *)v100 + 2);
        if (v101)
        {
          v243 = "CapsLockLanguageSwitch";
          v244 = 0xEE0073657672753FLL;
          *(_QWORD *)&v250 = _swiftEmptyArrayStorage;
          sub_1001F39E8(0, v101, 0);
          v102 = (_QWORD *)v250;
          v103 = *(_QWORD *)(v250 + 16);
          v104 = 2 * v103;
          v242 = v100;
          v105 = (unsigned __int16 *)(v100 + 34);
          do
          {
            v106 = *(v105 - 1);
            v107 = *v105;
            *(_QWORD *)&v250 = v102;
            v108 = v102[3];
            v109 = v103 + 1;
            if (v103 >= v108 >> 1)
            {
              v240 = v107;
              v241 = v106;
              sub_1001F39E8(v108 > 1, v103 + 1, 1);
              v107 = v240;
              v106 = v241;
              v102 = (_QWORD *)v250;
            }
            v105 += 2;
            v102[2] = v109;
            v110 = &v102[v104];
            v110[4] = v107;
            v110[5] = v106;
            v104 += 2;
            v103 = v109;
            --v101;
          }
          while (v101);
          swift_bridgeObjectRelease();
          v91 = v243;
          v90 = v244;
        }
        else
        {
          swift_bridgeObjectRelease();
          v102 = _swiftEmptyArrayStorage;
        }
        *(_QWORD *)&v249[0] = v102;
        *(_QWORD *)&v250 = v90;
        *((_QWORD *)&v250 + 1) = (unint64_t)v91 | 0x8000000000000000;
        v111 = sub_10003B038();
        sub_10020684C((uint64_t)&unk_1002B6658);
        v112 = sub_100206534();
        sub_10020630C(v112, v113, v114, v111, v115);
        swift_bridgeObjectRelease();
        sub_100206904(0xD000000000000019);
        v117 = sub_100206344(v116, (uint64_t)&type metadata for String);
        v118 = sub_1002061E8(v117, "__swift_objectForKeyedSubscript:");
        sub_1002061F4();
        if (&unk_1002B6618)
        {
          sub_100206188();
          v119 = sub_10000F718();
        }
        else
        {
          sub_100206354();
        }
        sub_10020617C(v119, v120, &qword_1002B34C0);
        if (v252)
        {
          v122 = sub_1000055B0(&qword_1002B6598);
          if (sub_1002060F0(v122, v123, (uint64_t)&type metadata for Any + 8, v122))
            v124 = v248;
          else
            v124 = 0;
        }
        else
        {
          sub_10020634C(v121, &qword_1002B34C0);
          v124 = 0;
        }
        *(_QWORD *)&v249[0] = v124;
        sub_100206904(0xD000000000000019);
        v125 = sub_1000055B0(&qword_1002B6598);
        sub_100204868((uint64_t)&unk_1002B6668);
        v126 = sub_100206534();
        sub_10020630C(v126, v127, v128, v125, v129);
        sub_100075850();
        sub_10020671C();
        *(_QWORD *)&v250 = 0xD000000000000012;
        *((_QWORD *)&v250 + 1) = 0x800000010025AA70;
        v131 = sub_100206344(v130, (uint64_t)&type metadata for String);
        v132 = sub_1002061E8(v131, "__swift_objectForKeyedSubscript:");
        sub_1002061F4();
        if (v125)
        {
          sub_100206188();
          v133 = sub_10000F718();
        }
        else
        {
          sub_100206354();
        }
        sub_10020617C(v133, v134, &qword_1002B34C0);
        if (v252)
        {
          v137 = sub_1002060F0(v135, v136, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for String);
          v138 = sub_100206318(v137, (uint64_t)v248);
          if (v39)
            v140 = 0;
          else
            v140 = v139;
        }
        else
        {
          sub_10020634C(v135, &qword_1002B34C0);
          v138 = 0;
          v140 = 0;
        }
        *(_QWORD *)&v250 = 0xD000000000000012;
        *((_QWORD *)&v250 + 1) = 0x800000010025AA70;
        sub_100206194(v138, v140, (uint64_t)&v250);
        v141 = sub_100075850();
        *(_QWORD *)&v250 = 0x437972746E756F43;
        *((_QWORD *)&v250 + 1) = 0xEB0000000065646FLL;
        v142 = sub_100206344(v141, (uint64_t)&type metadata for String);
        v143 = sub_1002061E8(v142, "__swift_objectForKeyedSubscript:");
        sub_1002061F4();
        if (v125)
        {
          sub_100206188();
          v144 = sub_10000F718();
        }
        else
        {
          sub_100206354();
        }
        sub_10020617C(v144, v145, &qword_1002B34C0);
        if (v252)
        {
          v148 = sub_1002060F0(v146, v147, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int);
          v149 = sub_1002067F0(v148);
        }
        else
        {
          sub_10020634C(v146, &qword_1002B34C0);
          v149 = HIDServicePropertyKey.intValue.getter();
        }
        *(_QWORD *)&v250 = 0x437972746E756F43;
        *((_QWORD *)&v250 + 1) = 0xEB0000000065646FLL;
        v151 = sub_100205FF8(v149, v150);
        *(_QWORD *)&v250 = v90;
        *((_QWORD *)&v250 + 1) = 0x800000010025AA90;
        v152 = sub_100206344(v151, (uint64_t)&type metadata for String);
        v153 = sub_1002061E8(v152, "__swift_objectForKeyedSubscript:");
        sub_1002061F4();
        if (v125)
        {
          sub_100206188();
          v154 = sub_10000F718();
        }
        else
        {
          sub_100206354();
        }
        sub_10020617C(v154, v155, &qword_1002B34C0);
        if (v252)
        {
          v158 = sub_1002060F0(v156, v157, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for String);
          v159 = sub_100206318(v158, (uint64_t)v248);
          if (v39)
            v161 = 0;
          else
            v161 = v160;
        }
        else
        {
          sub_10020634C(v156, &qword_1002B34C0);
          v159 = 0;
          v161 = 0;
        }
        *(_QWORD *)&v250 = v90;
        *((_QWORD *)&v250 + 1) = 0x800000010025AA90;
        sub_100206194(v159, v161, (uint64_t)&v250);
        sub_100075850();
        v162 = sub_100206234(0x647261646E617453, 0xEC00000065707954);
        strcpy((char *)&v250, "StandardType");
        BYTE13(v250) = 0;
        HIWORD(v250) = -5120;
        sub_100205FF8(v162, v163 & 1);
        sub_1002066D8(0x74636166756E614DLL, 0xEC00000072657275);
        strcpy((char *)&v250, "Manufacturer");
        BYTE13(v250) = 0;
        HIWORD(v250) = -5120;
        sub_100206194(v164, v165, (uint64_t)&v250);
        sub_100075850();
        v166 = sub_100206210((uint64_t)"HIDMouseAcceleration");
        *(_QWORD *)&v250 = v90;
        *((_QWORD *)&v250 + 1) = 0x74636166756E614DLL;
        sub_100205FF8(v166, v167 & 1);
        v168 = sub_100206234(v90 + 6, 0x800000010025AAD0);
        *(_QWORD *)&v250 = v90 + 6;
        *((_QWORD *)&v250 + 1) = 0x800000010025AAD0;
        sub_100205FF8(v168, v169 & 1);
        v170 = sub_100206234(v90 + 12, 0x800000010025AAF0);
        *(_QWORD *)&v250 = v90 + 12;
        *((_QWORD *)&v250 + 1) = 0x800000010025AAF0;
        sub_100205FF8(v170, v171 & 1);
        sub_1002065DC((uint64_t)"HIDPointerAccelerationTable");
        v173 = v172;
        *(_QWORD *)&v250 = v172;
        *((_QWORD *)&v250 + 1) = v174;
        *(_QWORD *)&v249[0] = v90 + 7;
        *((_QWORD *)&v249[0] + 1) = 0x800000010025AAF0;
        sub_1000A23DC();
        v175 = sub_1002067D0();
        v244 = v176;
        sub_10020630C(v175, v177, v178, v179, v176);
        sub_10020660C();
        sub_1002065F4((uint64_t)"HIDPointerAccelerationType");
        *(_QWORD *)&v250 = v90 + 6;
        *((_QWORD *)&v250 + 1) = v173;
        sub_100206194(v180, v181, (uint64_t)&v250);
        sub_100075850();
        v182 = sub_100206234(v90 + 1, 0x800000010025AB60);
        *(_QWORD *)&v250 = v90 + 1;
        *((_QWORD *)&v250 + 1) = 0x800000010025AB60;
        sub_100205FF8(v182, v183 & 1);
        v184 = sub_100206210((uint64_t)"HIDPointerButtonMode");
        *(_QWORD *)&v250 = v90;
        *((_QWORD *)&v250 + 1) = v90 + 1;
        sub_100205FF8(v184, v185 & 1);
        v186 = sub_100206210((uint64_t)"HIDPointerReportRate");
        *(_QWORD *)&v250 = v90;
        *((_QWORD *)&v250 + 1) = v90 + 1;
        sub_100205FF8(v186, v187 & 1);
        v188 = sub_100206210((uint64_t)"HIDPointerResolution");
        *(_QWORD *)&v250 = v90;
        *((_QWORD *)&v250 + 1) = v90 + 1;
        sub_100205FF8(v188, v189 & 1);
        v190 = sub_100206234(0x557972616D697250, 0xEC00000065676173);
        strcpy((char *)&v250, "PrimaryUsage");
        BYTE13(v250) = 0;
        HIWORD(v250) = -5120;
        sub_100205FF8(v190, v191 & 1);
        v192 = sub_100206234(v90, 0x8000000100258B50);
        *(_QWORD *)&v250 = v90;
        *((_QWORD *)&v250 + 1) = 0x8000000100258B50;
        sub_100205FF8(v192, v193 & 1);
        sub_1002066D8(0x746375646F7250, 0xE700000000000000);
        v195 = v194;
        *(_QWORD *)&v250 = 0x746375646F7250;
        *((_QWORD *)&v250 + 1) = 0xE700000000000000;
        sub_100206194(v196, v194, (uint64_t)&v250);
        sub_100075850();
        v197 = sub_100206234(0x49746375646F7250, 0xE900000000000044);
        *(_QWORD *)&v250 = 0x49746375646F7250;
        *((_QWORD *)&v250 + 1) = 0xE900000000000044;
        sub_100205FF8(v197, v198 & 1);
        v199 = sub_100206234(0x6E4974726F706552, 0xEE006C6176726574);
        strcpy((char *)&v250, "ReportInterval");
        HIBYTE(v250) = -18;
        sub_100205FF8(v199, v200 & 1);
        sub_1002065DC((uint64_t)"HIDScrollAccelerationTable");
        v202 = v201;
        *(_QWORD *)&v250 = v201;
        *((_QWORD *)&v250 + 1) = v203;
        *(_QWORD *)&v249[0] = v90 + 6;
        *((_QWORD *)&v249[0] + 1) = v195;
        v204 = sub_1002067D0();
        sub_10020630C(v204, v205, v206, v207, v244);
        sub_10020660C();
        sub_1002065F4((uint64_t)"HIDScrollAccelerationType");
        *(_QWORD *)&v250 = v90 + 5;
        *((_QWORD *)&v250 + 1) = v202;
        sub_100206194(v208, v209, (uint64_t)&v250);
        sub_100075850();
        v211 = HIDServiceProperties.subscript.getter(0xD000000000000014, 0x800000010025ACA0, v210, v253);
        if (v211)
        {
          v212 = (void *)v211;
          v213 = sub_1001F90C0();

        }
        else
        {
          v213 = 0;
        }
        *(_QWORD *)&v249[0] = v213;
        *(_QWORD *)&v250 = v90;
        *((_QWORD *)&v250 + 1) = 0x800000010025ACA0;
        v214 = sub_100206534();
        sub_10020630C(v214, v215, v216, v245, v246);
        sub_100075850();
        v217 = sub_100206234(v90 - 1, 0x800000010025ACC0);
        *(_QWORD *)&v250 = v90 - 1;
        *((_QWORD *)&v250 + 1) = 0x800000010025ACC0;
        sub_100205FF8(v217, v218 & 1);
        v219 = sub_100206234(v90 - 1, 0x800000010025ACE0);
        *(_QWORD *)&v250 = v90 - 1;
        *((_QWORD *)&v250 + 1) = 0x800000010025ACE0;
        sub_100205FF8(v219, v220 & 1);
        v221 = sub_100206234(v90 - 3, 0x800000010025AD60);
        *(_QWORD *)&v250 = v90 - 3;
        *((_QWORD *)&v250 + 1) = 0x800000010025AD60;
        sub_100205FF8(v221, v222 & 1);
        HIDServiceProperties.subscript.getter(v90 + 4, 0x800000010025AD00);
        *(_QWORD *)&v250 = v90 + 4;
        *((_QWORD *)&v250 + 1) = 0x800000010025AD00;
        sub_10020626C(v223);
        v225.value.width = HIDServiceProperties.subscript.getter(v90 - 3, 0x800000010025AD80, v224, v253);
        if (v225.value.width)
        {
          v225 = HIDServiceProperties.HIDSurfaceDimensions.init(dictionaryRepresentation:)((NSDictionary)v225.value.width);
          is_nil = v225.is_nil;
        }
        else
        {
          v225.value.height = 0;
          is_nil = 1;
        }
        *(_QWORD *)&v250 = v225.value.width;
        *((_QWORD *)&v250 + 1) = v225.value.height;
        v251 = is_nil;
        *(_QWORD *)&v249[0] = v90 - 3;
        *((_QWORD *)&v249[0] + 1) = 0x800000010025AD80;
        sub_1002048BC();
        v227 = sub_1002067D0();
        sub_10020630C(v227, v228, v229, v230, v231);
        sub_1002066D8(0x726F70736E617254, 0xE900000000000074);
        *(_QWORD *)&v250 = 0x726F70736E617254;
        *((_QWORD *)&v250 + 1) = 0xE900000000000074;
        sub_100206194(v232, v233, (uint64_t)&v250);
        swift_bridgeObjectRelease();
        v234 = sub_100206234(v90 + 3, 0x800000010025AD20);
        *(_QWORD *)&v250 = v90 + 3;
        *((_QWORD *)&v250 + 1) = 0x800000010025AD20;
        sub_100205FF8(v234, v235 & 1);
        v236 = sub_100206234(v90 + 9, 0x800000010025AD40);
        *(_QWORD *)&v250 = v90 + 9;
        *((_QWORD *)&v250 + 1) = 0x800000010025AD40;
        sub_100205FF8(v236, v237 & 1);
        v238 = sub_100206234(0x4449726F646E6556, 0xE800000000000000);
        *(_QWORD *)&v250 = 0x4449726F646E6556;
        *((_QWORD *)&v250 + 1) = 0xE800000000000000;
        sub_100205FF8(v238, v239 & 1);
        goto LABEL_31;
      }
    }
    else
    {
      sub_10020634C(v96, &qword_1002B34C0);
    }
    v100 = (char *)_swiftEmptyArrayStorage;
    goto LABEL_69;
  }
  (*(void (**)(char *, uint64_t))(v1 + 8))(v10, v7);
LABEL_32:
  sub_10003AF60();
}

uint64_t sub_100203218(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t result;
  uint64_t v14;
  void *v15;
  char *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[24];
  uint64_t v21;
  void *v22;

  *(_QWORD *)&v18 = 0xD000000000000010;
  *((_QWORD *)&v18 + 1) = 0x8000000100258B50;
  v3 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v18, &type metadata for String);
  v4 = objc_msgSend(a2, "__swift_objectForKeyedSubscript:", v3);
  swift_unknownObjectRelease(v3);
  if (v4)
  {
    _bridgeAnyObjectToAny(_:)(&v18, v4);
    swift_unknownObjectRelease(v4);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  sub_10005FA70((uint64_t)&v18, (uint64_t)v20, &qword_1002B34C0);
  if (!v21)
  {
    sub_10000E36C((uint64_t)v20, &qword_1002B34C0);
    goto LABEL_9;
  }
  if ((swift_dynamicCast(&v22, v20, (char *)&type metadata for Any + 8, &type metadata for Int, 6) & 1) == 0)
  {
LABEL_9:
    sub_10005FC6C(0, (unint64_t *)&qword_1002AAB80, NSError_ptr);
    v7 = 0xD000000000000022;
    v8 = 0x800000010025AE40;
    v9 = 707;
LABEL_17:
    v12 = NSError.init(NSPOSIXErrorDomain:debugDescription:__file:__line:)(22, v7, v8, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Ensemble_executables/HIDUtils/HIDServiceProperties.swift", 94, 2, v9);
    return swift_willThrow(v12);
  }
  strcpy((char *)&v18, "PrimaryUsage");
  BYTE13(v18) = 0;
  HIWORD(v18) = -5120;
  v5 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v18, &type metadata for String);
  v6 = objc_msgSend(a2, "__swift_objectForKeyedSubscript:", v5);
  swift_unknownObjectRelease(v5);
  if (v6)
  {
    _bridgeAnyObjectToAny(_:)(&v18, v6);
    swift_unknownObjectRelease(v6);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  sub_10005FA70((uint64_t)&v18, (uint64_t)v20, &qword_1002B34C0);
  if (!v21)
  {
    sub_10000E36C((uint64_t)v20, &qword_1002B34C0);
    goto LABEL_16;
  }
  if ((swift_dynamicCast(&v22, v20, (char *)&type metadata for Any + 8, &type metadata for Int, 6) & 1) == 0)
  {
LABEL_16:
    sub_10005FC6C(0, (unint64_t *)&qword_1002AAB80, NSError_ptr);
    v7 = 0xD00000000000001DLL;
    v8 = 0x800000010025AE70;
    v9 = 710;
    goto LABEL_17;
  }
  *(_QWORD *)&v18 = 0xD000000000000010;
  *((_QWORD *)&v18 + 1) = 0x800000010025AA30;
  v10 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v18, &type metadata for String);
  v11 = objc_msgSend(a2, "__swift_objectForKeyedSubscript:", v10);
  swift_unknownObjectRelease(v10);
  if (v11)
  {
    _bridgeAnyObjectToAny(_:)(&v18, v11);
    swift_unknownObjectRelease(v11);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  sub_10005FA70((uint64_t)&v18, (uint64_t)v20, &qword_1002B34C0);
  if (v21)
  {
    sub_10005FC6C(0, &qword_1002B0900, NSArray_ptr);
    if ((swift_dynamicCast(&v22, v20, (char *)&type metadata for Any + 8, v14, 6) & 1) != 0)
    {
      v15 = v22;
      v16 = sub_1001F92D0(v22);

      goto LABEL_25;
    }
  }
  else
  {
    sub_10000E36C((uint64_t)v20, &qword_1002B34C0);
  }
  v16 = (char *)_swiftEmptyArrayStorage;
LABEL_25:
  v17 = *((_QWORD *)v16 + 2);
  result = swift_bridgeObjectRelease(v16);
  if (!v17)
  {
    sub_10005FC6C(0, (unint64_t *)&qword_1002AAB80, NSError_ptr);
    v7 = 0xD000000000000022;
    v8 = 0x800000010025AE90;
    v9 = 713;
    goto LABEL_17;
  }
  return result;
}

uint64_t HIDServiceProperties.init(service:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v6;
  uint64_t ObjectType;
  uint64_t (*v8)(uint64_t, uint64_t);
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
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
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  id v35;

  v3 = v2;
  v6 = objc_msgSend(objc_allocWithZone((Class)NSMutableDictionary), "init");
  ObjectType = swift_getObjectType(a1);
  v8 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 16);
  v9 = v6;
  v10 = v8(ObjectType, a2);
  v11 = static HIDServicePropertyKey.allCases.getter();
  v12 = *(_QWORD *)(v11 + 16);
  if (v12)
  {
    v30 = v10;
    v35 = v9;
    v13 = *(void (**)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t))(a2 + 48);
    v14 = (uint64_t *)(v11 + 40);
    do
    {
      v16 = *(v14 - 1);
      v15 = *v14;
      sub_100040544();
      v13(&v31, v16, v15, ObjectType, a2);
      if (v32)
      {
        sub_100005778(&v31, &v33);
        v17 = v34;
        v18 = sub_10000DBE4(&v33, v34);
        v19 = _bridgeAnythingToObjectiveC<A>(_:)(v18, v17);
        *(_QWORD *)&v31 = v16;
        *((_QWORD *)&v31 + 1) = v15;
        sub_100040544();
        v20 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v31, &type metadata for String);
        objc_msgSend(v35, "__swift_setObject:forKeyedSubscript:", v19, v20);
        sub_100206398();
        v21 = swift_unknownObjectRelease(v20);
        sub_10020689C(v21, v22, v23, v24, v25, v26, v27, v28);
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        sub_10000E36C((uint64_t)&v31, &qword_1002B34C0);
      }
      v14 += 2;
      --v12;
    }
    while (v12);
    swift_bridgeObjectRelease();
    v9 = v35;
    v10 = v30;
    v3 = v2;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_100203218(v10, v9);

  if (v3)
  sub_10000F718();
  return v10;
}

HIDUtils::HIDServiceProperties __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HIDServiceProperties.init(serviceID:properties:)(Swift::UInt64 serviceID, Swift::OpaquePointer properties)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  objc_class *v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  char v21;
  uint64_t v22;
  _QWORD *v23;
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
  void *v42;
  HIDUtils::HIDServiceProperties result;
  uint64_t v44;
  char *v46;
  int64_t v47;
  _QWORD v48[2];
  __int128 v49;
  _OWORD v50[2];
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  void *v54;

  v3 = objc_msgSend(objc_allocWithZone((Class)NSMutableDictionary), "init");
  v4 = 1 << *((_BYTE *)properties._rawValue + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *((_QWORD *)properties._rawValue + 8);
  v47 = (unint64_t)(v4 + 63) >> 6;
  v7 = v3;
  v54 = v7;
  v9 = 0;
  v46 = (char *)properties._rawValue + 64;
  while (1)
  {
    if (v6)
    {
      v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v11 = v10 | (v9 << 6);
LABEL_6:
      v12 = *((_QWORD *)properties._rawValue + 7);
      v13 = (_QWORD *)(*((_QWORD *)properties._rawValue + 6) + 16 * v11);
      v14 = v13[1];
      *(_QWORD *)&v49 = *v13;
      *((_QWORD *)&v49 + 1) = v14;
      sub_100007918(v12 + 32 * v11, (uint64_t)v50);
      swift_bridgeObjectRetain(v14);
      goto LABEL_13;
    }
    v15 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_33;
    }
    if (v15 >= v47)
    {
      v17 = v9;
    }
    else
    {
      v16 = *(_QWORD *)&v46[8 * v15];
      if (v16)
        goto LABEL_10;
      v17 = v9 + 1;
      if (v9 + 2 < v47)
      {
        v16 = *(_QWORD *)&v46[8 * v9 + 16];
        if (v16)
        {
          v15 = v9 + 2;
LABEL_10:
          v6 = (v16 - 1) & v16;
          v11 = __clz(__rbit64(v16)) + (v15 << 6);
          v9 = v15;
          goto LABEL_6;
        }
        v17 = v9 + 2;
        if (v9 + 3 < v47)
        {
          v16 = *(_QWORD *)&v46[8 * v9 + 24];
          if (v16)
          {
            v15 = v9 + 3;
            goto LABEL_10;
          }
          v15 = v9 + 4;
          v17 = v9 + 3;
          if (v9 + 4 < v47)
          {
            v16 = *(_QWORD *)&v46[8 * v15];
            if (v16)
              goto LABEL_10;
            while (v9 + 5 < v47)
            {
              v16 = *((_QWORD *)properties._rawValue + v9++ + 13);
              if (v16)
              {
                v15 = v9 + 4;
                goto LABEL_10;
              }
            }
            v17 = v47 - 1;
          }
        }
      }
    }
    v6 = 0;
    memset(v50, 0, sizeof(v50));
    v9 = v17;
    v49 = 0u;
LABEL_13:
    sub_10005FA70((uint64_t)&v49, (uint64_t)&v51, &qword_1002B6678);
    v18 = v52;
    if (!v52)
      break;
    v19 = v51;
    sub_100005778(&v53, &v49);
    v20 = (_QWORD *)static HIDServicePropertyKey.allCases.getter();
    v21 = sub_1001FF7C0(v19, v18, v20);
    swift_bridgeObjectRelease(v20);
    if ((v21 & 1) != 0)
    {
      v22 = *((_QWORD *)&v50[0] + 1);
      v23 = sub_10000DBE4(&v49, *((uint64_t *)&v50[0] + 1));
      v24 = _bridgeAnythingToObjectiveC<A>(_:)(v23, v22);
      v48[0] = v19;
      v48[1] = v18;
      swift_bridgeObjectRetain(v18);
      v25 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(v48, &type metadata for String);
      objc_msgSend(v54, "__swift_setObject:forKeyedSubscript:", v24, v25);
      swift_unknownObjectRelease(v24);
      v26 = sub_10000F718();
      sub_10020689C(v26, v27, v28, v29, v30, v31, v32, v33);
      v7 = (id)swift_bridgeObjectRelease(v18);
    }
    else
    {
      v34 = swift_bridgeObjectRelease(v18);
      v7 = (id)sub_10020689C(v34, v35, v36, v37, v38, v39, v40, v41);
    }
  }
  swift_release();
  v42 = v54;
  sub_100203218(serviceID, v54);

  if (v44)
  v7 = (id)serviceID;
  v8 = (objc_class *)v42;
LABEL_33:
  result.storage.super.super.isa = v8;
  result.serviceID = (Swift::UInt64)v7;
  return result;
}

HIDUtils::HIDServiceProperties __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HIDServiceProperties.init(usages:)(Swift::OpaquePointer usages)
{
  id v2;
  Swift::UInt64 v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_class *v7;
  HIDUtils::HIDServiceProperties result;

  v2 = objc_msgSend(objc_allocWithZone((Class)NSMutableDictionary), "init");
  if (*((_QWORD *)usages._rawValue + 2))
  {
    HIDServiceProperties.primaryUsagePair.setter();
    HIDServiceProperties.deviceUsagePairs.setter((uint64_t)usages._rawValue);
    v3 = 0;
  }
  else
  {
    v4 = swift_bridgeObjectRelease(usages._rawValue);
    sub_100060018(v4, (unint64_t *)&qword_1002AAB80, NSError_ptr);
    sub_1000955C0();
    v6 = NSError.init(NSPOSIXErrorDomain:debugDescription:__file:__line:)(22, 0xD000000000000022, v5, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Ensemble_executables/HIDUtils/HIDServiceProperties.swift", 94, 2, 738);
    swift_willThrow(v6);

  }
  v7 = (objc_class *)v2;
  result.storage.super.super.isa = v7;
  result.serviceID = v3;
  return result;
}

_QWORD *sub_100203B98@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  _QWORD *result;
  uint64_t v4;

  result = HIDServiceProperties.init(from:)();
  if (!v1)
  {
    *a1 = result;
    a1[1] = v4;
  }
  return result;
}

void sub_100203BC0()
{
  HIDServiceProperties.encode(to:)();
}

uint64_t static HIDServiceProperties.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 != a3)
    return 0;
  sub_100060018(a1, (unint64_t *)&qword_1002AC3A0, NSObject_ptr);
  return static NSObject.== infix(_:_:)(a2, a4) & 1;
}

uint64_t sub_100203C34(uint64_t *a1, uint64_t *a2)
{
  return static HIDServiceProperties.== infix(_:_:)(*a1, a1[1], *a2, a2[1]);
}

void HIDServiceProperties.hash(into:)(uint64_t a1, Swift::UInt64 a2, void *a3)
{
  id v5;

  Hasher._combine(_:)(a2);
  v5 = a3;
  NSObject.hash(into:)(a1);

}

void HIDServiceProperties.hashValue.getter(Swift::UInt64 a1, void *a2)
{
  id v4;
  _BYTE v5[72];

  sub_10000E5C0(a1);
  Hasher._combine(_:)(a1);
  v4 = a2;
  NSObject.hash(into:)(v5);

  sub_10004740C();
  sub_1000C26D8();
}

void sub_100203CE0()
{
  uint64_t v0;

  HIDServiceProperties.hashValue.getter(*(_QWORD *)v0, *(void **)(v0 + 8));
}

void sub_100203CE8(uint64_t a1)
{
  uint64_t v1;

  HIDServiceProperties.hash(into:)(a1, *(_QWORD *)v1, *(void **)(v1 + 8));
}

Swift::Int sub_100203CF0(uint64_t a1)
{
  Swift::UInt64 *v1;
  Swift::UInt64 v2;
  void *v3;
  id v4;
  _QWORD v6[9];

  v2 = *v1;
  v3 = (void *)v1[1];
  Hasher.init(_seed:)(v6, a1);
  Hasher._combine(_:)(v2);
  v4 = v3;
  NSObject.hash(into:)(v6);

  return Hasher._finalize()();
}

uint64_t sub_100203D4C(uint64_t a1, uint64_t a2)
{
  Swift::String v2;

  if (!a2)
    return 0;
  String.append(_:)(*(Swift::String *)&a1);
  v2._countAndFlagsBits = 10322146;
  v2._object = (void *)0xA300000000000000;
  String.append(_:)(v2);
  return 2625692192;
}

uint64_t HIDServiceProperties.description.getter(Swift::UInt64 a1, void *a2)
{
  objc_class *v3;
  HIDUtils::HIDServiceProperties v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  Swift::String v9;
  unint64_t v10;
  Swift::String v11;
  void *object;
  Swift::String v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  Swift::String v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  Swift::String v86;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;

  v93 = 0;
  v94 = 0xE000000000000000;
  v3 = a2;
  v4.serviceID = a1;
  v4.storage.super.super.isa = v3;
  v5 = HIDDeviceType.init(properties:)(v4);
  if (v5)
  {
    if (v5 == 1)
      v6 = 0x6573756F4DLL;
    else
      v6 = 0x6461706B63617254;
    if (v5 == 1)
      v7 = 0xE500000000000000;
    else
      v7 = 0xE800000000000000;
  }
  else
  {
    v7 = 0xE800000000000000;
    v6 = 0x6472616F6279654BLL;
  }
  v8 = v7;
  String.append(_:)(*(Swift::String *)&v6);
  swift_bridgeObjectRelease(v7);
  v9._countAndFlagsBits = 91;
  v9._object = (void *)0xE100000000000000;
  String.append(_:)(v9);
  v90 = a1;
  v10 = sub_100168584();
  v11._countAndFlagsBits = String.init<A>(_:radix:uppercase:)(&v90, 16, 0, &type metadata for UInt64, v10);
  object = v11._object;
  String.append(_:)(v11);
  swift_bridgeObjectRelease(object);
  v13._countAndFlagsBits = 93;
  v13._object = (void *)0xE100000000000000;
  String.append(_:)(v13);
  v90 = 0x746375646F7250;
  v91 = 0xE700000000000000;
  sub_1002060D0(v14, (uint64_t)&type metadata for String, v15, v16, v17, v18, v19, v20);
  v21 = sub_1001A2C10(v3, "__swift_objectForKeyedSubscript:");
  v22 = sub_100079914();
  if (v21)
  {
    sub_100206260(v22, v23);
    v24 = sub_10000F718();
  }
  else
  {
    v28 = sub_10020607C();
  }
  sub_100205FD8(v24, v25, &qword_1002B34C0, v26, v27, v28);
  if (v92)
  {
    v37 = sub_100205FCC((uint64_t)&v88, v30, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for String, v33, v34, v35, v36, v88, v89);
    v45 = sub_10020623C(v37, v38, v39, v40, v41, v42, v43, v44, v88);
  }
  else
  {
    sub_100206088(v29, &qword_1002B34C0, v31, v32, v33, v34, v35, v36);
    v45 = 0;
  }
  v46 = sub_10020683C(v45);
  v48 = v47;
  sub_10000E420();
  v49._countAndFlagsBits = v46;
  v49._object = v48;
  String.append(_:)(v49);
  sub_10000E50C();
  sub_1002068C4();
  v90 = v50;
  v91 = 0xEC00000072657275;
  sub_1002060D0(v51, (uint64_t)&type metadata for String, v52, v53, v54, v55, v56, v57);
  v58 = sub_1001A2C10(v3, "__swift_objectForKeyedSubscript:");
  v59 = sub_100079914();
  if (v58)
  {
    sub_100206260(v59, v60);
    v61 = sub_10000F718();
  }
  else
  {
    v65 = sub_10020607C();
  }
  sub_100205FD8(v61, v62, &qword_1002B34C0, v63, v64, v65);
  if (v92)
  {
    v74 = sub_100205FCC((uint64_t)&v88, v67, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for String, v70, v71, v72, v73, v88, v89);
    v82 = sub_10020623C(v74, v75, v76, v77, v78, v79, v80, v81, v88);
  }
  else
  {
    sub_100206088(v66, &qword_1002B34C0, v68, v69, v70, v71, v72, v73);
    v82 = 0;
  }
  v83 = sub_10020683C(v82);
  v85 = v84;
  sub_10000E420();
  v86._countAndFlagsBits = v83;
  v86._object = v85;
  String.append(_:)(v86);
  sub_10000E594();
  return v93;
}

uint64_t sub_100204054()
{
  uint64_t v0;

  return HIDServiceProperties.description.getter(*(_QWORD *)v0, *(void **)(v0 + 8));
}

unint64_t sub_10020405C()
{
  unint64_t result;

  result = qword_1002B65C8;
  if (!qword_1002B65C8)
  {
    result = swift_getWitnessTable(&unk_10023087C, &type metadata for HIDServiceProperties.HIDAccelCurve.HIDAccelCurveKey);
    atomic_store(result, (unint64_t *)&qword_1002B65C8);
  }
  return result;
}

unint64_t sub_100204098()
{
  unint64_t result;

  result = qword_1002B65E0;
  if (!qword_1002B65E0)
  {
    result = swift_getWitnessTable(&unk_10023082C, &type metadata for HIDServiceProperties.HIDSurfaceDimensions.HIDSurfaceDimensionsKey);
    atomic_store(result, (unint64_t *)&qword_1002B65E0);
  }
  return result;
}

unint64_t sub_1002040D4()
{
  unint64_t result;

  result = qword_1002B65F8;
  if (!qword_1002B65F8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDServicePropertyKey, &type metadata for HIDServicePropertyKey);
    atomic_store(result, (unint64_t *)&qword_1002B65F8);
  }
  return result;
}

unint64_t sub_100204110()
{
  unint64_t result;

  result = qword_1002B6610;
  if (!qword_1002B6610)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDServiceProperties.HIDAccelCurve, &type metadata for HIDServiceProperties.HIDAccelCurve);
    atomic_store(result, (unint64_t *)&qword_1002B6610);
  }
  return result;
}

unint64_t sub_10020414C()
{
  unint64_t result;

  result = qword_1002B6628;
  if (!qword_1002B6628)
  {
    result = swift_getWitnessTable(&unk_100230804, &type metadata for HIDServiceProperties.HIDDeviceUsagePair);
    atomic_store(result, (unint64_t *)&qword_1002B6628);
  }
  return result;
}

unint64_t sub_100204188()
{
  unint64_t result;

  result = qword_1002B6638;
  if (!qword_1002B6638)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDServiceProperties.HIDSurfaceDimensions, &type metadata for HIDServiceProperties.HIDSurfaceDimensions);
    atomic_store(result, (unint64_t *)&qword_1002B6638);
  }
  return result;
}

char *sub_1002041C4(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
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
    v10 = sub_1000055B0(&qword_1002AA680);
    v11 = (char *)swift_allocObject(v10, 48 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 48);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  if ((v5 & 1) != 0)
  {
    sub_10007929C((char *)(a4 + 32), v8, v13);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease(a4);
  }
  else
  {
    sub_100204498(0, v8, (unint64_t)v13, a4);
  }
  return v11;
}

char *sub_1002042B8(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
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
    v10 = sub_1000055B0(&qword_1002B6728);
    v11 = (char *)swift_allocObject(v10, 144 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 144);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  if ((v5 & 1) != 0)
  {
    sub_1001F3280((char *)(a4 + 32), v8, v13);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1002045B4(0, v8, v13, a4);
  }
  return v11;
}

char *sub_1002043AC(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
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
    v10 = sub_1000055B0(&qword_1002B6530);
    v11 = (char *)swift_allocObject(v10, 4 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 4);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  if ((v5 & 1) != 0)
  {
    sub_1001F3228((char *)(a4 + 32), v8, v13);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease(a4);
  }
  else
  {
    sub_1002046AC(0, v8, v13, a4);
  }
  return v11;
}

uint64_t sub_100204498(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v7 = a4 + 48 * a1 + 32;
  v8 = a3 + 48 * v4;
  if (v7 >= v8 || v7 + 48 * v4 <= a3)
  {
    sub_1000055B0(&qword_1002AC358);
    swift_arrayInitWithCopy(a3, v7);
    swift_bridgeObjectRelease(a4);
    return v8;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

char *sub_1002045B4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v6;
  uint64_t v7;
  char *v8;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v6 = (char *)(a4 + 144 * a1 + 32);
  v7 = 9 * v4;
  v8 = &__dst[16 * v7];
  if (v6 >= v8 || &v6[16 * v7] <= __dst)
  {
    memcpy(__dst, v6, 16 * v7);
    swift_bridgeObjectRelease(a4);
    return v8;
  }
  result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

char *sub_1002046AC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v6 = (char *)(a4 + 4 * a1 + 32);
  v7 = &__dst[4 * v4];
  if (v6 >= v7 || &v6[4 * v4] <= __dst)
  {
    memcpy(__dst, v6, 4 * v4);
    swift_bridgeObjectRelease(a4);
    return v7;
  }
  result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_10020479C()
{
  unint64_t result;

  result = qword_1002B6650;
  if (!qword_1002B6650)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDServiceProperties.HIDAccelCurve, &type metadata for HIDServiceProperties.HIDAccelCurve);
    atomic_store(result, (unint64_t *)&qword_1002B6650);
  }
  return result;
}

void sub_1002047D8(uint64_t a1)
{
  unint64_t *v1;
  uint64_t *v2;
  void (*v3)(void);
  uint64_t v4;
  uint64_t v5;
  void (*v6)(void);
  uint64_t v7;

  if (!sub_1000F027C(a1))
  {
    v5 = v4;
    v6 = v3;
    v7 = sub_10000DCA0(v2);
    v6();
    atomic_store(swift_getWitnessTable(v5, v7), v1);
  }
  sub_100026914();
}

unint64_t sub_10020482C()
{
  unint64_t result;

  result = qword_1002B6660;
  if (!qword_1002B6660)
  {
    result = swift_getWitnessTable(&unk_1002307DC, &type metadata for HIDServiceProperties.HIDDeviceUsagePair);
    atomic_store(result, (unint64_t *)&qword_1002B6660);
  }
  return result;
}

void sub_100204868(uint64_t a1)
{
  unint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (!sub_1000F027C(a1))
  {
    v3 = v2;
    v4 = sub_10000DCA0(&qword_1002B6598);
    atomic_store(swift_getWitnessTable(v3, v4), v1);
  }
  sub_100026914();
}

unint64_t sub_1002048BC()
{
  unint64_t result;

  result = qword_1002B6670;
  if (!qword_1002B6670)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDServiceProperties.HIDSurfaceDimensions, &type metadata for HIDServiceProperties.HIDSurfaceDimensions);
    atomic_store(result, (unint64_t *)&qword_1002B6670);
  }
  return result;
}

unint64_t sub_1002048FC()
{
  unint64_t result;

  result = qword_1002B6680;
  if (!qword_1002B6680)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDServiceProperties.HIDAccelCurve, &type metadata for HIDServiceProperties.HIDAccelCurve);
    atomic_store(result, (unint64_t *)&qword_1002B6680);
  }
  return result;
}

unint64_t sub_10020493C()
{
  unint64_t result;

  result = qword_1002B6688;
  if (!qword_1002B6688)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDServiceProperties.HIDSurfaceDimensions, &type metadata for HIDServiceProperties.HIDSurfaceDimensions);
    atomic_store(result, (unint64_t *)&qword_1002B6688);
  }
  return result;
}

unint64_t sub_10020497C()
{
  unint64_t result;

  result = qword_1002B6690;
  if (!qword_1002B6690)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDServiceProperties, &type metadata for HIDServiceProperties);
    atomic_store(result, (unint64_t *)&qword_1002B6690);
  }
  return result;
}

void *sub_1002049B8()
{
  return &protocol witness table for UInt64;
}

void sub_1002049D4(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  sub_1001F9FE0(a1, a2, a3, (uint64_t (*)(_QWORD, _QWORD, uint64_t, _QWORD))HIDServiceProperties.subscript.getter, a4);
}

void sub_100204A0C(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  sub_1001F9FE0(a1, a2, a3, (uint64_t (*)(_QWORD, _QWORD, uint64_t, _QWORD))HIDServiceProperties.subscript.getter, a4);
}

void sub_100204A38(id *a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  sub_1001FA4B4(a1, a2, a3, a4, (void (*)(id, uint64_t, uint64_t))HIDServiceProperties.subscript.setter);
}

void sub_100204A60(id *a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  sub_1001FA4B4(a1, a2, a3, a4, (void (*)(id, uint64_t, uint64_t))HIDServiceProperties.subscript.setter);
}

void sub_100204AA0(unsigned __int8 *a1)
{
  char v1;

  v1 = sub_1002063F8(a1);
  HIDServiceProperties.appleVendorSupported.setter(v1);
  sub_1000050D4();
}

void sub_100204AC0(unsigned __int8 *a1)
{
  sub_1002063F8(a1);
  HIDServiceProperties.authenticatedDevice.setter();
  sub_1000050D4();
}

void sub_100204AE0(unsigned __int8 *a1)
{
  char v1;

  v1 = sub_1002063F8(a1);
  HIDServiceProperties.builtIn.setter(v1);
  sub_1000050D4();
}

void sub_100204AFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1001FEAF4(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD))HIDServiceProperties.capsLockDelay.getter);
}

void sub_100204B20(unsigned __int8 *a1)
{
  char v1;

  v1 = sub_1002063F8(a1);
  HIDServiceProperties.capsLockLanguageSwitch.setter(v1);
  sub_1000050D4();
}

void sub_100204B50(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1001FE368(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))HIDServiceProperties.deviceTypeHint.setter);
}

void sub_100204B70(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1001FE368(a1, a2, a3, a4, HIDServiceProperties.fnKeyboardUsageMap.setter);
}

void sub_100204B8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1001FEAF4(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD))HIDServiceProperties.keyboardCountryCode.getter);
}

void sub_100204BB0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1001FE368(a1, a2, a3, a4, HIDServiceProperties.keyboardLanguage.setter);
}

void sub_100204BCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1001FEAF4(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD))HIDServiceProperties.keyboardStandardType.getter);
}

void sub_100204BF0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1001FE368(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))HIDServiceProperties.manufacturer.setter);
}

void sub_100204C0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1001FEAF4(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD))HIDServiceProperties.mouseAcceleration.getter);
}

void sub_100204C2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1001FEAF4(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD))HIDServiceProperties.mouseScrollAcceleration.getter);
}

void sub_100204C4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1001FEAF4(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD))HIDServiceProperties.pointerAccelerationMultiplier.getter);
}

void sub_100204C78(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1001FE368(a1, a2, a3, a4, HIDServiceProperties.pointerAccelerationType.setter);
}

void sub_100204C94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1001FEAF4(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD))HIDServiceProperties.pointerButtonCount.getter);
}

void sub_100204CB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1001FEAF4(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD))HIDServiceProperties.pointerButtonMode.getter);
}

void sub_100204CD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1001FEAF4(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD))HIDServiceProperties.pointerResolution.getter);
}

void sub_100204CF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1001FEAF4(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD))HIDServiceProperties.pointerReportRate.getter);
}

void sub_100204D18()
{
  HIDServiceProperties.primaryUsagePair.setter();
  sub_1000050D4();
}

void sub_100204D3C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1001FE368(a1, a2, a3, a4, HIDServiceProperties.product.setter);
}

void sub_100204D58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1001FEAF4(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD))HIDServiceProperties.productID.getter);
}

void sub_100204D8C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1001FE368(a1, a2, a3, a4, HIDServiceProperties.scrollAccelerationType.setter);
}

void sub_100204DB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1001FEAF4(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD))HIDServiceProperties.scrollReportRate.getter);
}

void sub_100204DD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1001FEAF4(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD))HIDServiceProperties.scrollResolution.getter);
}

void sub_100204DF4(unsigned __int8 *a1)
{
  char v1;

  v1 = sub_1002063F8(a1);
  HIDServiceProperties.supportsGestureScrolling.setter(v1);
  sub_1000050D4();
}

void sub_100204E10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1001FEAF4(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD))HIDServiceProperties.trackpadAcceleration.getter);
}

void sub_100204E30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1001FEAF4(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD))HIDServiceProperties.trackpadScrollAcceleration.getter);
}

void sub_100204E54(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1001FE368(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))HIDServiceProperties.transport.setter);
}

void sub_100204E74(unsigned __int8 *a1)
{
  char v1;

  v1 = sub_1002063F8(a1);
  HIDServiceProperties.universalControlBuiltIn.setter(v1);
  sub_1000050D4();
}

void sub_100204E94(unsigned __int8 *a1)
{
  char v1;

  v1 = sub_1002063F8(a1);
  HIDServiceProperties.universalControlVirtualService.setter(v1);
  sub_1000050D4();
}

void sub_100204EB4(unsigned __int8 *a1)
{
  char v1;

  v1 = sub_1002063F8(a1);
  HIDServiceProperties.userDeviceCreateInactive.setter(v1);
  sub_1000050D4();
}

void sub_100204ED0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1001FEAF4(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD))HIDServiceProperties.vendorID.getter);
}

void sub_100204EF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1001FEAF4(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD))HIDServiceProperties.reportInterval.getter);
}

void sub_100204F10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1001FEAF4(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD))HIDServiceProperties.subinterfaceID.getter);
}

void sub_100204F3C(unsigned __int8 *a1)
{
  char v1;

  v1 = sub_1002063F8(a1);
  HIDServiceProperties.scrollAccelerationSupport.setter(v1);
  sub_1000050D4();
}

void sub_100204F5C(unsigned __int8 *a1)
{
  char v1;

  v1 = sub_1002063F8(a1);
  HIDServiceProperties.pointerAccelerationSupport.setter(v1);
  sub_1000050D4();
}

_QWORD *initializeBufferWithCopyOfBuffer for HIDServiceProperties(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  id v4;

  v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = v3;
  return a1;
}

_QWORD *assignWithCopy for HIDServiceProperties(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;

  *a1 = *a2;
  v3 = (void *)a2[1];
  v4 = (void *)a1[1];
  a1[1] = v3;
  v5 = v3;

  return a1;
}

_QWORD *assignWithTake for HIDServiceProperties(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;

  v3 = a2[1];
  v4 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v3;

  return a1;
}

void type metadata accessor for HIDServiceProperties()
{
  sub_10003B1DC();
}

void *initializeWithCopy for HIDServiceProperties.HIDAccelCurve(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x89uLL);
}

uint64_t getEnumTagSinglePayload for HIDServiceProperties.HIDAccelCurve(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 137))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for HIDServiceProperties.HIDAccelCurve(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 136) = 0;
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
  *(_BYTE *)(result + 137) = v3;
  return result;
}

void type metadata accessor for HIDServiceProperties.HIDAccelCurve()
{
  sub_10003B1DC();
}

void type metadata accessor for HIDServiceProperties.HIDSurfaceDimensions()
{
  sub_10003B1DC();
}

ValueMetadata *type metadata accessor for HIDServiceProperties.HIDDeviceUsagePair()
{
  return &type metadata for HIDServiceProperties.HIDDeviceUsagePair;
}

ValueMetadata *type metadata accessor for HIDServiceProperties.HIDSurfaceDimensions.HIDSurfaceDimensionsKey()
{
  return &type metadata for HIDServiceProperties.HIDSurfaceDimensions.HIDSurfaceDimensionsKey;
}

ValueMetadata *type metadata accessor for HIDServiceProperties.HIDAccelCurve.HIDAccelCurveKey()
{
  return &type metadata for HIDServiceProperties.HIDAccelCurve.HIDAccelCurveKey;
}

unint64_t sub_1002050EC()
{
  unint64_t result;

  result = qword_1002B6698;
  if (!qword_1002B6698)
  {
    result = swift_getWitnessTable(&unk_100230524, &type metadata for HIDServiceProperties.HIDAccelCurve.HIDAccelCurveKey);
    atomic_store(result, (unint64_t *)&qword_1002B6698);
  }
  return result;
}

void sub_100205128()
{
  sub_100205EE4((uint64_t)&unk_1002B66A0);
}

unint64_t sub_100205150()
{
  unint64_t result;

  result = qword_1002B66B0;
  if (!qword_1002B66B0)
  {
    result = swift_getWitnessTable(&unk_10023064C, &type metadata for HIDServiceProperties.HIDSurfaceDimensions.HIDSurfaceDimensionsKey);
    atomic_store(result, (unint64_t *)&qword_1002B66B0);
  }
  return result;
}

void sub_10020518C()
{
  sub_100205EE4((uint64_t)&unk_1002B66B8);
}

unint64_t sub_1002051B4()
{
  unint64_t result;

  result = qword_1002B66C8;
  if (!qword_1002B66C8)
  {
    result = swift_getWitnessTable(&unk_100230774, &type metadata for HIDServiceProperties.HIDDeviceUsagePair);
    atomic_store(result, (unint64_t *)&qword_1002B66C8);
  }
  return result;
}

unint64_t sub_1002051F4()
{
  unint64_t result;

  result = qword_1002B66D0;
  if (!qword_1002B66D0)
  {
    result = swift_getWitnessTable(&unk_100230674, &type metadata for HIDServiceProperties.HIDSurfaceDimensions.HIDSurfaceDimensionsKey);
    atomic_store(result, (unint64_t *)&qword_1002B66D0);
  }
  return result;
}

unint64_t sub_100205234()
{
  unint64_t result;

  result = qword_1002B66D8;
  if (!qword_1002B66D8)
  {
    result = swift_getWitnessTable(&unk_10023069C, &type metadata for HIDServiceProperties.HIDSurfaceDimensions.HIDSurfaceDimensionsKey);
    atomic_store(result, (unint64_t *)&qword_1002B66D8);
  }
  return result;
}

unint64_t sub_100205274()
{
  unint64_t result;

  result = qword_1002B66E0;
  if (!qword_1002B66E0)
  {
    result = swift_getWitnessTable(&unk_10023054C, &type metadata for HIDServiceProperties.HIDAccelCurve.HIDAccelCurveKey);
    atomic_store(result, (unint64_t *)&qword_1002B66E0);
  }
  return result;
}

unint64_t sub_1002052B4()
{
  unint64_t result;

  result = qword_1002B66E8;
  if (!qword_1002B66E8)
  {
    result = swift_getWitnessTable(&unk_100230574, &type metadata for HIDServiceProperties.HIDAccelCurve.HIDAccelCurveKey);
    atomic_store(result, (unint64_t *)&qword_1002B66E8);
  }
  return result;
}

unint64_t sub_1002052F0()
{
  unint64_t result;

  result = qword_1002B66F8;
  if (!qword_1002B66F8)
  {
    result = swift_getWitnessTable(&unk_100230A10, &type metadata for HIDServiceProperties.HIDDeviceUsagePair.HIDDeviceUsagePairKey);
    atomic_store(result, (unint64_t *)&qword_1002B66F8);
  }
  return result;
}

void sub_10020532C(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  char v20;
  unint64_t v21;
  uint64_t v22;
  _BOOL8 v23;
  uint64_t v24;
  char v25;
  unint64_t v26;
  char v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  Swift::String v35;
  Swift::String v36;
  _QWORD v37[2];
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  unint64_t v45;
  _QWORD v46[2];
  uint64_t v47;

  v43 = a3;
  v6 = type metadata accessor for PropertyListNode(0);
  v42 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1000055B0(&qword_1002B6710);
  __chkstk_darwin(v9);
  v13 = (_QWORD *)((char *)v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = *(_QWORD *)(a1 + 16);
  if (!v14)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v37[1] = v3;
  v38 = a1;
  v41 = (uint64_t)v13 + *(int *)(v10 + 48);
  v15 = a1 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  v39 = *(_QWORD *)(v11 + 72);
  swift_bridgeObjectRetain();
  v40 = v13;
  while (1)
  {
    sub_10005FAFC(v15, (uint64_t)v13, &qword_1002B6710);
    v17 = v13[1];
    v46[0] = *v13;
    v16 = v46[0];
    v46[1] = v17;
    v18 = (uint64_t)v8;
    sub_1002056CC(v41, (uint64_t)v8);
    v19 = (_QWORD *)*v43;
    v21 = sub_1000055F0(v16, v17);
    v22 = v19[2];
    v23 = (v20 & 1) == 0;
    v24 = v22 + v23;
    if (__OFADD__(v22, v23))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      __break(1u);
      goto LABEL_20;
    }
    v25 = v20;
    if (v19[3] < v24)
      break;
    if ((a2 & 1) != 0)
    {
      if ((v20 & 1) != 0)
        goto LABEL_14;
    }
    else
    {
      sub_1000055B0(&qword_1002B6718);
      _NativeDictionary.copy()();
      if ((v25 & 1) != 0)
        goto LABEL_14;
    }
LABEL_10:
    v28 = (_QWORD *)*v43;
    *(_QWORD *)(*v43 + 8 * (v21 >> 6) + 64) |= 1 << v21;
    v29 = (uint64_t *)(v28[6] + 16 * v21);
    *v29 = v16;
    v29[1] = v17;
    v8 = (char *)v18;
    sub_1002056CC(v18, v28[7] + *(_QWORD *)(v42 + 72) * v21);
    v30 = v28[2];
    v31 = __OFADD__(v30, 1);
    v32 = v30 + 1;
    if (v31)
      goto LABEL_18;
    v28[2] = v32;
    v13 = v40;
    v15 += v39;
    a2 = 1;
    if (!--v14)
    {
      swift_bridgeObjectRelease_n(v38, 2);
      return;
    }
  }
  sub_100205A44(v24, a2 & 1);
  v26 = sub_1000055F0(v16, v17);
  if ((v25 & 1) != (v27 & 1))
    goto LABEL_19;
  v21 = v26;
  if ((v25 & 1) == 0)
    goto LABEL_10;
LABEL_14:
  v33 = swift_allocError(&type metadata for _MergeError, &protocol witness table for _MergeError, 0, 0);
  swift_willThrow(v33);
  v47 = v33;
  swift_errorRetain(v33);
  v34 = sub_1000055B0((uint64_t *)&unk_1002AABA0);
  if ((swift_dynamicCast(v34, &v47, v34, &type metadata for _MergeError, 0) & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_100205710(v18);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_errorRelease(v47);
    return;
  }
LABEL_20:
  v44 = 0;
  v45 = 0xE000000000000000;
  _StringGuts.grow(_:)(30);
  v35._object = (void *)0x8000000100254120;
  v35._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v35);
  _print_unlocked<A, B>(_:_:)(v46, &v44, &type metadata for String, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v36._countAndFlagsBits = 39;
  v36._object = (void *)0xE100000000000000;
  String.append(_:)(v36);
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v44, v45, "Swift/NativeDictionary.swift", 28, 2, 783, 0);
  __break(1u);
}

uint64_t sub_1002056CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PropertyListNode(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100205710(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PropertyListNode(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_10020574C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t i;
  int64_t v16;
  _QWORD *v17;
  unint64_t v18;
  int64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  Swift::Int v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;
  _QWORD v39[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_1000055B0(&qword_1002B6730);
  v38 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_42;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v35 = v3;
  v36 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  swift_retain();
  v13 = 0;
  if (!v11)
    goto LABEL_10;
LABEL_9:
  v14 = __clz(__rbit64(v11));
  v11 &= v11 - 1;
  for (i = v14 | (v13 << 6); ; i = __clz(__rbit64(v18)) + (v13 << 6))
  {
    v20 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * i);
    v22 = *v20;
    v21 = v20[1];
    v23 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * i);
    if ((v38 & 1) == 0)
      swift_bridgeObjectRetain();
    Hasher.init(_seed:)(v39, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v39, v22, v21);
    v24 = Hasher._finalize()();
    v25 = -1 << *(_BYTE *)(v8 + 32);
    v26 = v24 & ~v25;
    v27 = v26 >> 6;
    if (((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6))) == 0)
    {
      v29 = 0;
      v30 = (unint64_t)(63 - v25) >> 6;
      while (++v27 != v30 || (v29 & 1) == 0)
      {
        v31 = v27 == v30;
        if (v27 == v30)
          v27 = 0;
        v29 |= v31;
        v32 = *(_QWORD *)(v12 + 8 * v27);
        if (v32 != -1)
        {
          v28 = __clz(__rbit64(~v32)) + (v27 << 6);
          goto LABEL_33;
        }
      }
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return;
    }
    v28 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
LABEL_33:
    *(_QWORD *)(v12 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
    v33 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v28);
    *v33 = v22;
    v33[1] = v21;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v28) = v23;
    ++*(_QWORD *)(v8 + 16);
    if (v11)
      goto LABEL_9;
LABEL_10:
    v16 = v13 + 1;
    if (__OFADD__(v13, 1))
      goto LABEL_44;
    if (v16 >= v36)
    {
      swift_release();
      v3 = v35;
      v17 = (_QWORD *)(v5 + 64);
      goto LABEL_37;
    }
    v17 = (_QWORD *)(v5 + 64);
    v18 = *(_QWORD *)(v37 + 8 * v16);
    ++v13;
    if (!v18)
    {
      v13 = v16 + 1;
      if (v16 + 1 >= v36)
        goto LABEL_35;
      v18 = *(_QWORD *)(v37 + 8 * v13);
      if (!v18)
        break;
    }
LABEL_21:
    v11 = (v18 - 1) & v18;
  }
  v19 = v16 + 2;
  if (v19 < v36)
  {
    v18 = *(_QWORD *)(v37 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        v13 = v19 + 1;
        if (__OFADD__(v19, 1))
          goto LABEL_45;
        if (v13 >= v36)
          goto LABEL_35;
        v18 = *(_QWORD *)(v37 + 8 * v13);
        ++v19;
        if (v18)
          goto LABEL_21;
      }
    }
    v13 = v19;
    goto LABEL_21;
  }
LABEL_35:
  swift_release();
  v3 = v35;
LABEL_37:
  if ((v38 & 1) != 0)
  {
    v34 = 1 << *(_BYTE *)(v5 + 32);
    if (v34 >= 64)
      sub_1001194A8(0, (unint64_t)(v34 + 63) >> 6, v17);
    else
      *v17 = -1 << v34;
    *(_QWORD *)(v5 + 16) = 0;
  }
LABEL_42:
  swift_release();
  *v3 = v8;
}

void sub_100205A44(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t i;
  int64_t v20;
  _QWORD *v21;
  unint64_t v22;
  int64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::Int v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  _QWORD *v42;
  uint64_t v43;
  int v44;
  _QWORD v45[9];

  v3 = v2;
  v6 = type metadata accessor for PropertyListNode(0);
  v43 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v3;
  if (*(_QWORD *)(*v3 + 24) > a1)
    a1 = *(_QWORD *)(*v3 + 24);
  sub_1000055B0(&qword_1002B6708);
  v44 = a2;
  v10 = static _DictionaryStorage.resize(original:capacity:move:)(v9, a1, a2);
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_42;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v42 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v40 = v3;
  v41 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  swift_retain();
  v17 = 0;
  if (!v15)
    goto LABEL_9;
LABEL_8:
  v18 = __clz(__rbit64(v15));
  v15 &= v15 - 1;
  for (i = v18 | (v17 << 6); ; i = __clz(__rbit64(v22)) + (v17 << 6))
  {
    v24 = (uint64_t *)(*(_QWORD *)(v9 + 48) + 16 * i);
    v26 = *v24;
    v25 = v24[1];
    v27 = *(_QWORD *)(v43 + 72);
    v28 = *(_QWORD *)(v9 + 56) + v27 * i;
    if ((v44 & 1) != 0)
    {
      sub_1002056CC(v28, (uint64_t)v8);
    }
    else
    {
      sub_100205DA0(v28, (uint64_t)v8);
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)(v45, *(_QWORD *)(v11 + 40));
    String.hash(into:)(v45, v26, v25);
    v29 = Hasher._finalize()();
    v30 = -1 << *(_BYTE *)(v11 + 32);
    v31 = v29 & ~v30;
    v32 = v31 >> 6;
    if (((-1 << v31) & ~*(_QWORD *)(v16 + 8 * (v31 >> 6))) == 0)
    {
      v34 = 0;
      v35 = (unint64_t)(63 - v30) >> 6;
      while (++v32 != v35 || (v34 & 1) == 0)
      {
        v36 = v32 == v35;
        if (v32 == v35)
          v32 = 0;
        v34 |= v36;
        v37 = *(_QWORD *)(v16 + 8 * v32);
        if (v37 != -1)
        {
          v33 = __clz(__rbit64(~v37)) + (v32 << 6);
          goto LABEL_33;
        }
      }
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return;
    }
    v33 = __clz(__rbit64((-1 << v31) & ~*(_QWORD *)(v16 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
LABEL_33:
    *(_QWORD *)(v16 + ((v33 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v33;
    v38 = (_QWORD *)(*(_QWORD *)(v11 + 48) + 16 * v33);
    *v38 = v26;
    v38[1] = v25;
    sub_1002056CC((uint64_t)v8, *(_QWORD *)(v11 + 56) + v27 * v33);
    ++*(_QWORD *)(v11 + 16);
    if (v15)
      goto LABEL_8;
LABEL_9:
    v20 = v17 + 1;
    if (__OFADD__(v17, 1))
      goto LABEL_44;
    if (v20 >= v41)
    {
      swift_release();
      v3 = v40;
      v21 = v42;
      goto LABEL_37;
    }
    v21 = v42;
    v22 = v42[v20];
    ++v17;
    if (!v22)
    {
      v17 = v20 + 1;
      if (v20 + 1 >= v41)
        goto LABEL_35;
      v22 = v42[v17];
      if (!v22)
        break;
    }
LABEL_20:
    v15 = (v22 - 1) & v22;
  }
  v23 = v20 + 2;
  if (v23 < v41)
  {
    v22 = v42[v23];
    if (!v22)
    {
      while (1)
      {
        v17 = v23 + 1;
        if (__OFADD__(v23, 1))
          goto LABEL_45;
        if (v17 >= v41)
          goto LABEL_35;
        v22 = v42[v17];
        ++v23;
        if (v22)
          goto LABEL_20;
      }
    }
    v17 = v23;
    goto LABEL_20;
  }
LABEL_35:
  swift_release();
  v3 = v40;
LABEL_37:
  if ((v44 & 1) != 0)
  {
    v39 = 1 << *(_BYTE *)(v9 + 32);
    if (v39 >= 64)
      sub_1001194A8(0, (unint64_t)(v39 + 63) >> 6, v21);
    else
      *v21 = -1 << v39;
    *(_QWORD *)(v9 + 16) = 0;
  }
LABEL_42:
  swift_release();
  *v3 = v11;
}

uint64_t sub_100205DA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PropertyListNode(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100205DE4(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 137))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

void sub_100205E00(uint64_t a1)
{
  unint64_t *v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (!sub_1000F027C(a1))
  {
    v4 = v3;
    v5 = v2(255);
    atomic_store(swift_getWitnessTable(v4, v5), v1);
  }
  sub_1000050D4();
}

void _s8HIDUtils20HIDServicePropertiesV20HIDSurfaceDimensionsV23HIDSurfaceDimensionsKeyVwca_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  sub_10000E420();
  sub_1000050D4();
}

ValueMetadata *type metadata accessor for HIDServiceProperties.HIDDeviceUsagePair.HIDDeviceUsagePairKey()
{
  return &type metadata for HIDServiceProperties.HIDDeviceUsagePair.HIDDeviceUsagePairKey;
}

unint64_t sub_100205E84()
{
  unint64_t result;

  result = qword_1002B6750;
  if (!qword_1002B6750)
  {
    result = swift_getWitnessTable(&unk_1002308E8, &type metadata for HIDServiceProperties.HIDDeviceUsagePair.HIDDeviceUsagePairKey);
    atomic_store(result, (unint64_t *)&qword_1002B6750);
  }
  return result;
}

void sub_100205EC0()
{
  sub_100205EE4((uint64_t)&unk_1002B6758);
}

void sub_100205EE4(uint64_t a1)
{
  unint64_t *v1;
  uint64_t *v2;
  uint64_t v3;

  if (!sub_1000F027C(a1))
  {
    v3 = sub_10000DCA0(v2);
    atomic_store(swift_getWitnessTable(&protocol conformance descriptor for [A], v3), v1);
  }
  sub_1000050D4();
}

unint64_t sub_100205F20()
{
  unint64_t result;

  result = qword_1002B6768;
  if (!qword_1002B6768)
  {
    result = swift_getWitnessTable(&unk_100230910, &type metadata for HIDServiceProperties.HIDDeviceUsagePair.HIDDeviceUsagePairKey);
    atomic_store(result, (unint64_t *)&qword_1002B6768);
  }
  return result;
}

unint64_t sub_100205F60()
{
  unint64_t result;

  result = qword_1002B6770;
  if (!qword_1002B6770)
  {
    result = swift_getWitnessTable(&unk_100230938, &type metadata for HIDServiceProperties.HIDDeviceUsagePair.HIDDeviceUsagePairKey);
    atomic_store(result, (unint64_t *)&qword_1002B6770);
  }
  return result;
}

uint64_t sub_100205FCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  return swift_dynamicCast(a1, va, a3, a4, 6);
}

void sub_100205FD8(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v5;
  va_list va;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  va_list va1;

  va_start(va1, a5);
  va_start(va, a5);
  v5 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  sub_10005FA70((uint64_t)va, (uint64_t)va1, a3);
}

uint64_t sub_100205FE4()
{
  uint64_t v0;
  uint64_t v1;

  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v1 - 136, v0);
}

uint64_t sub_100205FF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)(a1, a2, v3 - 112, v2);
}

id sub_10020600C(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend(*(id *)(v4 - 72), a2, v2, v3);
}

_QWORD *sub_10020601C(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v2;
  va_list va;

  va_start(va, a2);
  return _bridgeAnyObjectToAny(_:)((uint64_t *)va, v2);
}

uint64_t sub_100206028()
{
  uint64_t v0;

  return swift_unknownObjectRelease(v0);
}

uint64_t sub_100206034(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(result + 16) = v1;
  return result;
}

uint64_t sub_100206054(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  if (a1)
    return a10;
  else
    return 0;
}

void sub_10020606C(uint64_t a1, char a2, uint64_t a3)
{
  HIDServiceProperties.subscript.setter(a1, a2, a3 & 0xFFFFFFFFFFFFLL | 0xD000000000000000);
}

void sub_100206074(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1001FEBA4(a1, a2, a3 & 0xFFFFFFFFFFFFLL | 0xD000000000000000);
}

double sub_10020607C()
{
  return 0.0;
}

void sub_100206088(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  sub_10000E36C((uint64_t)va, a2);
}

uint64_t sub_100206090@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 104) = a1;
  *(_QWORD *)(v3 - 96) = (v1 - 32) | 0x8000000000000000;
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v3 - 104, v2);
}

uint64_t sub_1002060B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 - 96) = a3;
  *(_QWORD *)(v5 - 88) = (v3 - 32) | 0x8000000000000000;
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)(a1, a2, v5 - 96, v4);
}

uint64_t sub_1002060D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(va, a2);
}

uint64_t sub_1002060D8(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)v2 = result;
  *(_BYTE *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t sub_1002060E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(v2 - 136, a2);
}

uint64_t sub_1002060F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return swift_dynamicCast(v4 - 160, v4 - 112, a3, a4, 6);
}

uint64_t sub_100206100()
{
  uint64_t v0;
  uint64_t v1;

  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v1 - 104, v0);
}

uint64_t sub_100206114(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)(a1, a2, v3 - 96, v2);
}

id sub_100206128(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  return objc_msgSend(v1, *(SEL *)(v2 + 840), a1);
}

uint64_t sub_10020613C()
{
  uint64_t v0;
  uint64_t v1;

  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v1 - 136, v0);
}

uint64_t sub_100206150(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 40) = v1;
  return swift_bridgeObjectRetain_n(v1, 2);
}

void sub_100206164(char a1, uint64_t a2)
{
  HIDServiceProperties.subscript.setter(a1, a2 & 0xFFFFFFFFFFFFLL | 0xD000000000000000);
}

id sub_10020616C(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend(*(id *)(v4 - 72), a2, v2, v3);
}

void sub_10020617C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_10005FA70(v3 - 144, v3 - 112, a3);
}

_QWORD *sub_100206188()
{
  uint64_t v0;
  uint64_t v1;

  return _bridgeAnyObjectToAny(_:)((_QWORD *)(v1 - 144), v0);
}

uint64_t sub_100206194(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)(a1, a2, a3, v3);
}

uint64_t sub_1002061A4()
{
  uint64_t v0;

  return swift_unknownObjectRelease(v0);
}

uint64_t sub_1002061B0(uint64_t a1, uint64_t a2)
{
  return swift_bridgeObjectRetain_n(a2, 2);
}

id sub_1002061E8(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend(*(id *)(v3 - 72), a2, v2);
}

uint64_t sub_1002061F4()
{
  uint64_t v0;

  return swift_unknownObjectRelease(v0);
}

_QWORD *sub_100206200(_QWORD *result)
{
  uint64_t v1;

  *result = v1;
  return result;
}

uint64_t sub_100206210@<X0>(uint64_t a1@<X8>)
{
  return HIDServiceProperties.subscript.getter(0xD000000000000014, (a1 - 32) | 0x8000000000000000);
}

void sub_10020622C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_10005FA70(a1, a2, v2);
}

uint64_t sub_100206234(uint64_t a1, uint64_t a2)
{
  return HIDServiceProperties.subscript.getter(a1, a2);
}

uint64_t sub_10020623C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1)
    return a9;
  else
    return 0;
}

uint64_t sub_10020624C()
{
  uint64_t v0;
  uint64_t v1;

  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v1 - 136, v0);
}

_QWORD *sub_100206260(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v2;
  va_list va;

  va_start(va, a2);
  return _bridgeAnyObjectToAny(_:)((uint64_t *)va, v2);
}

uint64_t sub_10020626C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)(a1, v2 - 112, v1);
}

void sub_100206280(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  sub_10005FA70(v31 - 128, (uint64_t)&a31, a3);
}

_QWORD *sub_10020628C()
{
  uint64_t v0;
  uint64_t v1;

  return _bridgeAnyObjectToAny(_:)((_QWORD *)(v1 - 128), v0);
}

uint64_t sub_100206298()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

_QWORD *sub_1002062C0()
{
  _QWORD *v0;
  uint64_t v1;

  return _bridgeAnyObjectToAny(_:)(v0, v1);
}

void sub_1002062CC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  sub_10005FA70(v4, v3, a3);
}

uint64_t sub_1002062D8()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

void sub_1002062E4(uint64_t a1, char a2)
{
  sub_1001FE3E8(a1, a2);
}

void sub_1002062EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  HIDServiceProperties.subscript.setter(a1, a2, a3 & 0xFFFFFFFFFFFFLL | 0xD000000000000000);
}

uint64_t sub_1002062F4()
{
  uint64_t v0;

  return swift_unknownObjectRelease(v0);
}

id sub_100206300(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_10020630C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(a1, a2, a3, a4, a5);
}

uint64_t sub_100206318@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  if (a1)
    return a2;
  else
    return 0;
}

uint64_t sub_100206344(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(v2 - 112, a2);
}

void sub_10020634C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_10000E36C(v2 - 112, a2);
}

double sub_100206354()
{
  uint64_t v0;
  double result;

  result = 0.0;
  *(_OWORD *)(v0 - 144) = 0u;
  *(_OWORD *)(v0 - 128) = 0u;
  return result;
}

_QWORD *sub_100206360@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return _bridgeAnyObjectToAny(_:)(a1, v1);
}

id sub_100206368(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

void sub_100206390()
{
  Swift::UInt v0;

  Hasher._combine(_:)(v0);
}

uint64_t sub_100206398()
{
  uint64_t v0;

  return swift_unknownObjectRelease(v0);
}

void sub_1002063A0(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 136) = a1;
  *(_QWORD *)(v2 - 128) = v1 | 0x8000000000000000;
}

id sub_1002063AC(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend(v2, a2, v3, v4);
}

void *sub_1002063BC()
{
  return malloc(0x68uLL);
}

uint64_t sub_1002063D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&a31, a2);
}

void sub_1002063D8()
{
  Hasher._combine(_:)(1u);
}

void sub_1002063E0()
{
  Hasher._combine(_:)(0);
}

void sub_1002063E8(uint64_t *a1, char a2)
{
  sub_1001FD878(a1, a2);
}

uint64_t sub_1002063F0(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return HIDServiceProperties.subscript.setter(a1, a2, a3 & 0xFFFFFFFFFFFFLL | 0xD000000000000000);
}

uint64_t sub_1002063F8(unsigned __int8 *a1)
{
  return *a1;
}

void sub_100206428(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  sub_10000E36C((uint64_t)&a31, a2);
}

uint64_t sub_100206430(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_100206484(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(v2, a2);
}

uint64_t sub_10020648C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&a9, a2);
}

double sub_100206494()
{
  _OWORD *v0;
  double result;

  result = 0.0;
  *v0 = 0u;
  v0[1] = 0u;
  return result;
}

void sub_1002064C4(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_10000E36C(v2, a2);
}

NSString sub_1002064CC()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1002064D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(va, a2);
}

double sub_1002064DC()
{
  _OWORD *v0;
  double result;

  result = 0.0;
  *v0 = 0u;
  v0[1] = 0u;
  return result;
}

uint64_t sub_1002064E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 80) = a1;
  *(_QWORD *)(v3 - 72) = v1;
  return KeyedDecodingContainer.decode(_:forKey:)(v3 - 80, v2);
}

uint64_t sub_100206534()
{
  uint64_t v0;

  return v0 - 144;
}

uint64_t sub_1002065CC(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(result + 8) = v1;
  return result;
}

void sub_1002065DC(uint64_t a1@<X8>)
{
  uint64_t v1;

  HIDServiceProperties.subscript.getter(v1, (a1 - 32) | 0x8000000000000000);
}

void sub_1002065F4(uint64_t a1@<X8>)
{
  uint64_t v1;

  HIDServiceProperties.subscript.getter(v1, (a1 - 32) | 0x8000000000000000);
}

uint64_t sub_10020660C()
{
  unint64_t v0;
  uint64_t v1;

  return sub_100022AD8(v1, v0);
}

NSNumber sub_100206618()
{
  return Bool._bridgeToObjectiveC()();
}

void *sub_100206620()
{
  return malloc(0x78uLL);
}

uint64_t sub_100206674(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  return dispatch thunk of Encoder.container<A>(keyedBy:)(a1, a1, a3, v3, v4);
}

uint64_t sub_100206688()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  return HIDServiceProperties.subscript.setter(v0, v1, v2);
}

void sub_10020669C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  HIDServiceProperties.subscript.setter(v0, v1, v2);
}

uint64_t sub_1002066B0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  return HIDServiceProperties.subscript.setter(v0, v1, v2);
}

uint64_t sub_1002066C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  return dispatch thunk of Decoder.container<A>(keyedBy:)(a1, a1, a3, v3, v4);
}

void sub_1002066D8(uint64_t a1, uint64_t a2)
{
  HIDServiceProperties.subscript.getter(a1, a2);
}

void sub_1002066E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  HIDServiceProperties.subscript.setter(v2, v0, v1);
}

uint64_t sub_1002066F4()
{
  uint64_t v0;
  uint64_t v1;

  return dispatch thunk of IteratorProtocol.next()(v0, v1);
}

unint64_t sub_100206708()
{
  return 0xD00000000000001ELL;
}

uint64_t sub_100206738()
{
  uint64_t (*v0)(uint64_t, uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return v0(v1, v3, v2);
}

uint64_t sub_100206770(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return KeyedEncodingContainer.encode(_:forKey:)(a1, a2, v2);
}

void sub_1002067B0()
{
  uint64_t v0;
  uint64_t v1;

  HIDServiceProperties.subscript.setter(v0, v1);
}

char *sub_1002067C0()
{
  return sub_1001F90C0();
}

uint64_t sub_1002067D0()
{
  uint64_t v0;

  return v0 - 112;
}

id sub_1002067E0(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend(*(id *)(v4 - 72), a2, v3, v2);
}

uint64_t sub_1002067F0(int a1)
{
  uint64_t v1;

  if (a1)
    return *(_QWORD *)(v1 - 160);
  else
    return 0;
}

void sub_100206808()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 136) = 0x7954656369766544;
  *(_QWORD *)(v1 - 128) = v0;
}

uint64_t sub_10020683C(uint64_t a1)
{
  uint64_t v1;

  return sub_100203D4C(a1, v1);
}

void sub_10020684C(uint64_t a1)
{
  sub_1002047D8(a1);
}

void sub_100206854(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 136) = 0xD000000000000014;
  *(_QWORD *)(v1 - 128) = a1;
}

void sub_100206870(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  Swift::UInt32 v10;

  Hasher._combine(_:)(v10);
}

uint64_t sub_10020687C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&a9, v9);
}

void sub_100206888()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 136) = v0;
  *(_QWORD *)(v1 - 128) = 0xE900000000000074;
}

uint64_t sub_10020689C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  return sub_100005988((uint64_t *)va);
}

void sub_1002068A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 136) = v1;
  *(_QWORD *)(v2 - 128) = v0 | 0x8000000000000000;
}

void sub_1002068B0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 136) = 0xD000000000000014;
  *(_QWORD *)(v1 - 128) = v0 | 0x8000000000000000;
}

void sub_1002068D8(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v7 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  sub_10005FA70((uint64_t)va, (uint64_t)va1, a3);
}

char *sub_1002068E4(char *a1, int64_t a2)
{
  uint64_t v2;

  return sub_1002042B8(a1, a2, 1, v2);
}

uint64_t sub_1002068F0()
{
  uint64_t v0;
  uint64_t v1;

  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v1, v0);
}

void sub_1002068FC(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_10005FA70(a1, a2, v2);
}

void sub_100206904(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 112) = a1;
  *(_QWORD *)(v2 - 104) = v1 | 0x8000000000000000;
}

void sub_100206910(uint64_t a1)
{
  HIDServiceProperties.subscript.setter(a1, 0xD000000000000019);
}

void sub_10020691C(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 112) = a1;
  *(_QWORD *)(v2 - 104) = v1 | 0x8000000000000000;
}

uint64_t sub_100206928(uint64_t a1)
{
  return swift_allocObject(a1, 160, 7);
}

uint64_t static HIDEventFlags.accelerated.getter()
{
  return 0x10000;
}

uint64_t HIDFixed.rawValue.setter(uint64_t result)
{
  _DWORD *v1;

  *v1 = result;
  return result;
}

_UNKNOWN **static HIDEventFlags.allCases.getter()
{
  return &off_100295478;
}

HIDUtils::HIDEventFlags __swiftcall HIDEventFlags.init(rawValue:)(Swift::Int rawValue)
{
  const char *v1;
  uint64_t v2;

  if (rawValue < 0)
  {
    sub_10006D098();
    v1 = "Negative value is not representable";
    v2 = 35;
  }
  else
  {
    if (!HIDWORD(rawValue))
      return (HIDUtils::HIDEventFlags)rawValue;
    sub_10006D098();
    v1 = "Not enough bits to represent the passed value";
    v2 = 45;
  }
  LODWORD(rawValue) = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v1, v2, 2, "Swift/Integers.swift", 20);
  __break(1u);
  return (HIDUtils::HIDEventFlags)rawValue;
}

uint64_t static HIDEventFlags.ignore.getter()
{
  return 4026531840;
}

uint64_t static HIDEventFlags.zero.getter()
{
  return 0x800000;
}

void sub_1002069F0(_DWORD *a1@<X8>)
{
  sub_100207134(a1);
}

void sub_1002069F8(_QWORD *a1@<X8>)
{
  *a1 = &off_100295478;
}

BOOL sub_100206A08(int *a1)
{
  int *v1;

  return sub_1001F7EC0(*a1, *v1);
}

unint64_t sub_100206A14@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;

  result = sub_10020F1D4(*a1);
  *(_DWORD *)a2 = result;
  *(_BYTE *)(a2 + 4) = BYTE4(result) & 1;
  return result;
}

unint64_t sub_100206A44@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;

  result = sub_10020F1D8(*a1);
  *(_DWORD *)a2 = result;
  *(_BYTE *)(a2 + 4) = BYTE4(result) & 1;
  return result;
}

void sub_100206A74(int *a1)
{
  sub_1001F4B1C(*a1);
}

void sub_100206A7C(int *a1)
{
  sub_1001F4B34(*a1);
}

void sub_100206A84(int *a1)
{
  sub_1001F4B4C(*a1);
}

void sub_100206A8C(_DWORD *a1@<X8>)
{
  sub_100207134(a1);
}

uint64_t sub_100206A94@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result;

  result = sub_100214948();
  *a1 = result;
  return result;
}

uint64_t HIDEventFlags.momentumShift.getter()
{
  return 28;
}

uint64_t HIDEventFlags.phaseMask.getter()
{
  return 143;
}

HIDUtils::HIDEventFlags __swiftcall HIDEventFlags.init(momentum:)(HIDUtils::HIDScrollMomentum momentum)
{
  return (HIDUtils::HIDEventFlags)(((momentum.rawValue & 0x18) << 6) | ((momentum.rawValue & 7) << 28));
}

uint64_t HIDEventFlags.momentum.setter(uint64_t result)
{
  _DWORD *v1;

  *v1 = *v1 & 0x8FFFF9FF | ((result & 7) << 28) | ((((result & 0x18) >> 3) & 3) << 9);
  return result;
}

HIDUtils::HIDEventFlags __swiftcall HIDEventFlags.init(phase:)(HIDUtils::HIDEventPhase phase)
{
  return (HIDUtils::HIDEventFlags)((phase.rawValue & 0xFFFFFF8F) << 24);
}

uint64_t HIDEventFlags.phase.setter(uint64_t result)
{
  _DWORD *v1;

  *v1 = *v1 & 0x70FFFFFF | ((result & 0xFFFFFF8F) << 24);
  return result;
}

uint64_t HIDEventFlags.momentum.getter(unsigned int a1)
{
  return (a1 >> 6) & 0x18 | (a1 >> 28) & 7;
}

void (*HIDEventFlags.momentum.modify(uint64_t a1))(uint64_t a1)
{
  _DWORD *v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = (*v1 >> 6) & 0x18 | (*v1 >> 28) & 7;
  return sub_100206B68;
}

void sub_100206B68(uint64_t a1)
{
  HIDEventFlags.momentum.setter(*(unsigned __int8 *)(a1 + 8));
  sub_1000050D4();
}

uint64_t HIDEventFlags.phase.getter(unsigned int a1)
{
  return HIBYTE(a1) & 0xFFFFFF8F;
}

void (*HIDEventFlags.phase.modify(uint64_t a1))(_DWORD **a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(v1 + 3) & 0x8F;
  return sub_100206BB4;
}

void sub_100206BB4(_DWORD **a1)
{
  sub_100207134(*a1);
}

uint64_t HIDEventFlags.description.getter(int a1)
{
  uint64_t v1;
  int *v3;
  int v4;
  int v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  void *v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v1 = 9;
  v3 = &dword_100295498;
  do
  {
    v5 = *v3++;
    v4 = v5;
    if ((v5 & a1) != 0)
    {
      if ((swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage) & 1) == 0)
        sub_1001F3798(0, _swiftEmptyArrayStorage[2] + 1, 1);
      v7 = _swiftEmptyArrayStorage[2];
      v6 = _swiftEmptyArrayStorage[3];
      if (v7 >= v6 >> 1)
        sub_1001F3798(v6 > 1, v7 + 1, 1);
      _swiftEmptyArrayStorage[2] = v7 + 1;
      *((_DWORD *)&_swiftEmptyArrayStorage[4] + v7) = v4;
    }
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  v8 = _swiftEmptyArrayStorage[2];
  if (v8)
  {
    sub_100058678();
    v9 = 0;
    v10 = &protocol witness table for UInt32;
    do
    {
      v11 = *((_DWORD *)&_swiftEmptyArrayStorage[4] + v9);
      if ((v11 & 1) != 0)
      {
        v16 = 0xE800000000000000;
        v17 = 0x6574756C6F736261;
      }
      else if ((v11 & 0x10000) != 0)
      {
        v16 = 0xEB00000000646574;
        v17 = 0x6172656C65636361;
      }
      else if ((v11 & 0x10) != 0)
      {
        v16 = 0xE700000000000000;
        v17 = 0x6E69746C697562;
      }
      else if ((v11 & 8) != 0)
      {
        v16 = 0xEC0000006E696769;
        v17 = 0x724F7265746E6563;
      }
      else if ((v11 & 2) != 0)
      {
        v17 = 0x697463656C6C6F63;
        v16 = 0xEA00000000006E6FLL;
      }
      else if (v11 >> 28)
      {
        v16 = 0xE600000000000000;
        v17 = 0x65726F6E6769;
      }
      else if ((v11 & 0x20) != 0)
      {
        v16 = 0xEC00000064657461;
        v17 = 0x6C6F707265746E69;
      }
      else if ((v11 & 4) != 0)
      {
        v16 = 0xEA00000000007374;
        v17 = 0x696E556C65786970;
      }
      else if ((v11 & 0x800000) != 0)
      {
        v16 = 0xE400000000000000;
        v17 = 1869768058;
      }
      else
      {
        v12 = v10;
        v13 = (v11 >> 6) & 0x18 | (v11 >> 28);
        if (v13)
        {
          v14 = HIDScrollMomentum.description.getter(v13);
        }
        else
        {
          if ((HIBYTE(v11) & 0xFFFFFF8F) == 0)
          {
            v17 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for UInt32, v10);
            v10 = v12;
            v16 = v20;
            goto LABEL_34;
          }
          v14 = HIDEventPhase.description.getter(HIBYTE(v11) & 0x8F);
        }
        v17 = v14;
        v16 = v15;
        v10 = v12;
      }
LABEL_34:
      v18 = _swiftEmptyArrayStorage[2];
      if (v18 >= _swiftEmptyArrayStorage[3] >> 1)
      {
        sub_100058678();
        v10 = &protocol witness table for UInt32;
      }
      ++v9;
      _swiftEmptyArrayStorage[2] = v18 + 1;
      v19 = &_swiftEmptyArrayStorage[2 * v18];
      v19[4] = v17;
      v19[5] = v16;
    }
    while (v8 != v9);
  }
  swift_release();
  v21 = sub_1000055B0((uint64_t *)&unk_1002AC160);
  v22 = sub_10003A0A8((unint64_t *)&qword_1002AB150, (uint64_t *)&unk_1002AC160, (uint64_t)&protocol conformance descriptor for [A]);
  v23 = BidirectionalCollection<>.joined(separator:)(44, 0xE100000000000000, v21, v22);
  swift_bridgeObjectRelease();
  return v23;
}

uint64_t sub_100206F68()
{
  int *v0;

  return HIDEventFlags.description.getter(*v0);
}

unint64_t sub_100206F74()
{
  unint64_t result;

  result = qword_1002B6778;
  if (!qword_1002B6778)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDEventFlags, &type metadata for HIDEventFlags);
    atomic_store(result, (unint64_t *)&qword_1002B6778);
  }
  return result;
}

unint64_t sub_100206FB4()
{
  unint64_t result;

  result = qword_1002B6780;
  if (!qword_1002B6780)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDEventFlags, &type metadata for HIDEventFlags);
    atomic_store(result, (unint64_t *)&qword_1002B6780);
  }
  return result;
}

uint64_t sub_100206FF0()
{
  return sub_10003A0A8(&qword_1002B6788, &qword_1002B6790, (uint64_t)&protocol conformance descriptor for [A]);
}

unint64_t sub_100207020()
{
  unint64_t result;

  result = qword_1002B6798;
  if (!qword_1002B6798)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDEventFlags, &type metadata for HIDEventFlags);
    atomic_store(result, (unint64_t *)&qword_1002B6798);
  }
  return result;
}

unint64_t sub_100207060()
{
  unint64_t result;

  result = qword_1002B67A0;
  if (!qword_1002B67A0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDEventFlags, &type metadata for HIDEventFlags);
    atomic_store(result, (unint64_t *)&qword_1002B67A0);
  }
  return result;
}

void sub_10020709C(unsigned int *a1@<X0>, _BYTE *a2@<X8>)
{
  *a2 = HIDEventFlags.momentum.getter(*a1);
  sub_1000050D4();
}

void sub_1002070C0(unsigned __int8 *a1)
{
  HIDEventFlags.momentum.setter(*a1);
  sub_1000050D4();
}

void sub_1002070E0(unsigned int *a1@<X0>, _BYTE *a2@<X8>)
{
  *a2 = HIDEventFlags.phase.getter(*a1);
  sub_1000050D4();
}

void sub_100207104(unsigned __int8 *a1)
{
  HIDEventFlags.phase.setter(*a1);
  sub_1000050D4();
}

ValueMetadata *type metadata accessor for HIDEventFlags()
{
  return &type metadata for HIDEventFlags;
}

void sub_100207134(_DWORD *a1@<X8>)
{
  int v1;

  *a1 = v1;
}

id ZoomToggleEvent.init(time:flags:)(uint64_t a1, uint64_t a2)
{
  void *ZoomToggleEvent;
  id v3;

  ZoomToggleEvent = (void *)IOHIDEventCreateZoomToggleEvent(0, a1, 0, a2);
  v3 = ZoomToggleEvent;

  return v3;
}

ValueMetadata *type metadata accessor for ZoomToggleEvent()
{
  return &type metadata for ZoomToggleEvent;
}

double HIDFixed.doubleValue.getter(int a1)
{
  return (double)a1 * 0.0000152587891;
}

double static HIDFixed.scale.getter()
{
  return 65536.0;
}

uint64_t HIDFixed.intValue.getter(int a1)
{
  return (uint64_t)a1 >> 16;
}

HIDUtils::HIDFixed __swiftcall HIDFixed.init(intValue:)(Swift::Int intValue)
{
  if (intValue < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_5;
  }
  if (intValue > 0x7FFFFFFF)
  {
LABEL_5:
    __break(1u);
    return (HIDUtils::HIDFixed)intValue;
  }
  LODWORD(intValue) = (_DWORD)intValue << 16;
  return (HIDUtils::HIDFixed)intValue;
}

HIDUtils::HIDFixed_optional __swiftcall HIDFixed.init(doubleValue:)(Swift::Double doubleValue)
{
  uint64_t v1;
  uint64_t v2;
  double v3;
  uint64_t v4;

  v1 = *(_QWORD *)&doubleValue & 0x7FF0000000000000;
  if ((*(_QWORD *)&doubleValue & 0x7FF0000000000000) != 0x7FF0000000000000)
  {
    v3 = round(doubleValue * 65536.0);
    if (v3 <= -2147483650.0)
      v3 = -2147483650.0;
    if (v3 > 2147483650.0)
      v3 = 2147483650.0;
    if ((~*(_QWORD *)&v3 & 0x7FF0000000000000) != 0)
    {
      if (v3 > -2147483650.0)
      {
        if (v3 < 2147483650.0)
        {
          v2 = (int)v3;
          return (HIDUtils::HIDFixed_optional)(v2 | ((unint64_t)(v1 == 0x7FF0000000000000) << 32));
        }
LABEL_14:
        __break(1u);
        return (HIDUtils::HIDFixed_optional)v4;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_14;
  }
  v2 = 0;
  return (HIDUtils::HIDFixed_optional)(v2 | ((unint64_t)(v1 == 0x7FF0000000000000) << 32));
}

uint64_t static HIDFixed.+ infix(_:_:)(int a1, int a2)
{
  BOOL v2;
  uint64_t result;

  v2 = __OFADD__(a1, a2);
  result = (a1 + a2);
  if (v2)
    __break(1u);
  return result;
}

_DWORD *static HIDFixed.+= infix(_:_:)(_DWORD *result, int a2)
{
  if (__OFADD__(*result, a2))
    __break(1u);
  else
    *result += a2;
  return result;
}

uint64_t static HIDFixed.- infix(_:_:)(int a1, int a2)
{
  BOOL v2;
  uint64_t result;

  v2 = __OFSUB__(a1, a2);
  result = (a1 - a2);
  if (v2)
    __break(1u);
  return result;
}

_DWORD *static HIDFixed.-= infix(_:_:)(_DWORD *result, int a2)
{
  if (__OFSUB__(*result, a2))
    __break(1u);
  else
    *result -= a2;
  return result;
}

uint64_t sub_1002072DC@<X0>(int *a1@<X0>, int *a2@<X1>, _DWORD *a3@<X8>)
{
  uint64_t result;

  result = static HIDFixed.+ infix(_:_:)(*a1, *a2);
  *a3 = result;
  return result;
}

_DWORD *sub_100207308(_DWORD *a1, int *a2)
{
  return static HIDFixed.+= infix(_:_:)(a1, *a2);
}

uint64_t sub_100207310@<X0>(int *a1@<X0>, int *a2@<X1>, _DWORD *a3@<X8>)
{
  uint64_t result;

  result = static HIDFixed.- infix(_:_:)(*a1, *a2);
  *a3 = result;
  return result;
}

_DWORD *sub_10020733C(_DWORD *a1, int *a2)
{
  return static HIDFixed.-= infix(_:_:)(a1, *a2);
}

HIDUtils::HIDFixed sub_100207344@<W0>(Swift::Int *a1@<X0>, HIDUtils::HIDFixed *a2@<X8>)
{
  HIDUtils::HIDFixed result;

  result.rawValue = HIDFixed.init(intValue:)(*a1).rawValue;
  a2->rawValue = result.rawValue;
  return result;
}

HIDUtils::HIDFixed __swiftcall HIDFixed.init(floatLiteral:)(Swift::Double floatLiteral)
{
  uint64_t v1;

  *(HIDUtils::HIDFixed_optional *)&v1 = HIDFixed.init(doubleValue:)(floatLiteral);
  return (HIDUtils::HIDFixed)sub_100207E7C(v1);
}

HIDUtils::HIDFixed sub_100207384@<W0>(Swift::Double *a1@<X0>, HIDUtils::HIDFixed *a2@<X8>)
{
  HIDUtils::HIDFixed result;

  result.rawValue = HIDFixed.init(floatLiteral:)(*a1).rawValue;
  a2->rawValue = result.rawValue;
  return result;
}

unint64_t HIDFixed.init<A>(exactly:)(uint64_t a1, uint64_t a2, uint64_t a3)
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char v33;
  uint64_t (*v34)(uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  char v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  int v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  void (*v52)(char *, uint64_t, uint64_t);
  char v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  signed int v62;
  unint64_t result;
  int v64;
  uint64_t v65;
  unsigned __int8 v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  char v81;
  uint64_t v82;
  unint64_t v83;
  char v84;
  unint64_t v85;
  char v86;
  signed int v87;
  BOOL v88;
  char *v89;
  signed int v90;
  signed int v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t AssociatedTypeWitness;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  int v103;
  signed int v104;

  v98 = *(_QWORD *)(*(_QWORD *)(a3 + 24) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, v98);
  __chkstk_darwin(AssociatedTypeWitness);
  v96 = (char *)&v92 - v6;
  v7 = *(_QWORD *)(a2 - 8);
  __chkstk_darwin(v8);
  v94 = (uint64_t)&v92 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000A3464();
  __chkstk_darwin(v10);
  sub_1000A34C8();
  v95 = v11;
  sub_1000A3464();
  __chkstk_darwin(v12);
  sub_1000A34C8();
  v100 = v13;
  sub_1000A3464();
  __chkstk_darwin(v14);
  v16 = (char *)&v92 - v15;
  __chkstk_darwin(v17);
  v19 = (char *)&v92 - v18;
  __chkstk_darwin(v20);
  sub_1000A34C8();
  v99 = v21;
  sub_1000A3464();
  __chkstk_darwin(v22);
  sub_1000A34C8();
  v101 = v23;
  sub_1000A3464();
  __chkstk_darwin(v24);
  v26 = (char *)&v92 - v25;
  __chkstk_darwin(v27);
  v29 = (char *)&v92 - v28;
  __chkstk_darwin(v30);
  v32 = (char *)&v92 - v31;
  v33 = sub_100207E08();
  v102 = a1;
  if ((v33 & 1) != 0)
  {
    if (sub_100207E18() < 32)
    {
      v34 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
      v35 = (uint64_t)v32;
LABEL_12:
      sub_10003D65C(v35, a1, v34);
      v44 = sub_100207E24();
      sub_100207E88();
      v43 = v44 < -32768;
      goto LABEL_17;
    }
    v42 = sub_100207EC4(-32768);
    sub_100207DF0(v42, (uint64_t)&type metadata for Int32, v42);
    sub_100207E98();
LABEL_8:
    v43 = sub_100207E48(a1, v39, v40, v41);
    sub_100207E88();
    goto LABEL_17;
  }
  v36 = sub_100207E08();
  v37 = sub_100207E18();
  if ((v36 & 1) == 0)
  {
    if (v37 >= 32)
    {
      v43 = 0;
      a1 = v102;
      goto LABEL_17;
    }
    v34 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    v35 = (uint64_t)v32;
    a1 = v102;
    goto LABEL_12;
  }
  if (v37 > 32)
  {
    v38 = sub_100207EC4(-32768);
    sub_100207DF0(v38, (uint64_t)&type metadata for Int32, v38);
    sub_100207E98();
    a1 = v102;
    goto LABEL_8;
  }
  v93 = v19;
  v45 = v98;
  sub_100207ECC(v98);
  v46 = v96;
  sub_100207EA4((uint64_t)&unk_10022EB18);
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)(v46, a2, v45);
  sub_100207E98();
  v47 = v102;
  v51 = sub_100207E48(v102, v48, v49, v50);
  sub_100207DE8((uint64_t)v32);
  sub_10003D65C((uint64_t)v26, v47, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16));
  v43 = (v51 & 1) != 0 || (int)sub_100207E24() < -32768;
  sub_100207DE8((uint64_t)v26);
  a1 = v102;
  v19 = v93;
LABEL_17:
  v52 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v52(v29, a1, a2);
  if ((v43 & 1) != 0)
  {
    sub_100207DE8((uint64_t)v29);
LABEL_30:
    sub_100207DE8(v102);
    v65 = 0;
    v66 = 1;
LABEL_44:
    LOBYTE(v104) = v66;
    return v65 | ((unint64_t)v66 << 32);
  }
  v93 = v16;
  v53 = sub_100207E08();
  v54 = sub_100207E18();
  if ((v53 & 1) != 0)
  {
    if (v54 > 32)
      goto LABEL_21;
LABEL_29:
    v64 = sub_100207E24();
    sub_100207DE8((uint64_t)v29);
    if (v64 >= 0x8000)
      goto LABEL_30;
    goto LABEL_22;
  }
  if (v54 <= 31)
    goto LABEL_29;
LABEL_21:
  v55 = sub_100207EC4(0x7FFF);
  sub_100207DF0(v55, (uint64_t)&type metadata for Int32, v55);
  v56 = dispatch thunk of static Comparable.< infix(_:_:)(v32, v29, a2, *(_QWORD *)(*(_QWORD *)(a3 + 32) + 8));
  sub_100207DE8((uint64_t)v32);
  sub_100207DE8((uint64_t)v29);
  if ((v56 & 1) != 0)
    goto LABEL_30;
LABEL_22:
  v57 = v101;
  v52((char *)v101, v102, a2);
  v58 = sub_100207E08();
  v59 = v99;
  sub_100207E54(v99);
  if ((v58 & 1) == 0)
  {
    sub_100207DE8(v59);
    v61 = v100;
    goto LABEL_32;
  }
  v60 = sub_100207E18();
  sub_100207DE8(v59);
  v88 = v60 <= 32;
  v61 = v100;
  if (v88)
    goto LABEL_32;
  sub_100207E54((uint64_t)v19);
  v104 = 0x80000000;
  if ((sub_100207E08() & 1) == 0)
  {
    v81 = sub_100207E08();
    v82 = sub_100207E18();
    if ((v81 & 1) != 0)
    {
      if (v82 > 32)
      {
        v83 = sub_100207B2C();
        sub_100207DF0(v83, (uint64_t)&type metadata for Int32, v83);
        v84 = sub_100207E30();
        sub_100207DE8((uint64_t)v32);
        result = sub_100207DE8((uint64_t)v19);
        v57 = v101;
        if ((v84 & 1) != 0)
          goto LABEL_60;
        goto LABEL_32;
      }
      sub_100207ECC(v98);
      v89 = v96;
      sub_100207EA4((uint64_t)&unk_10022EB18);
      dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)(v89, a2, v98);
      LOBYTE(v89) = sub_100207E30();
      sub_100207DE8((uint64_t)v32);
      v73 = v94;
      sub_10003D65C(v94, (uint64_t)v19, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 32));
      if ((v89 & 1) != 0)
        goto LABEL_59;
      v90 = v104;
      v91 = sub_100207E24();
      result = sub_100207DE8(v73);
      v88 = v90 <= v91;
    }
    else
    {
      if (v82 >= 32)
      {
        sub_100207DE8((uint64_t)v19);
        v57 = v101;
        goto LABEL_32;
      }
      v87 = sub_100207E24();
      result = sub_100207DE8((uint64_t)v19);
      v88 = v104 <= v87;
    }
    v57 = v101;
    if (!v88)
      goto LABEL_60;
    goto LABEL_32;
  }
  if (sub_100207E18() >= 32)
  {
    v85 = sub_100207B2C();
    sub_100207DF0(v85, (uint64_t)&type metadata for Int32, v85);
    v86 = sub_100207E30();
    sub_100207DE8((uint64_t)v32);
    result = sub_100207DE8((uint64_t)v19);
    if ((v86 & 1) != 0)
      goto LABEL_60;
  }
  else
  {
    v62 = sub_100207E24();
    result = sub_100207DE8((uint64_t)v19);
    if (v104 > v62)
      goto LABEL_60;
  }
LABEL_32:
  v67 = sub_100207E18();
  v68 = (uint64_t)v93;
  sub_100207E54((uint64_t)v93);
  if (v67 < 33)
  {
    v69 = sub_100207E18();
    sub_100207DE8(v68);
    if (v69 != 32 || (sub_100207E08() & 1) != 0)
      goto LABEL_43;
  }
  else
  {
    sub_100207DE8(v68);
  }
  sub_100207E54(v61);
  v104 = 0x7FFFFFFF;
  v70 = sub_100207E08();
  v71 = sub_100207E18();
  if ((v70 & 1) == 0)
  {
    if (v71 > 31)
    {
      v103 = 0x7FFFFFFF;
      sub_10003D65C((uint64_t)v32, v61, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 32));
      v75 = sub_100207B2C();
      v76 = v95;
      dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)(&v103, &type metadata for Int32, v75, a2, a3);
      sub_100207E98();
      v73 = sub_100207E48(v76, v77, v78, v79);
      sub_100207DE8(v76);
      v74 = (uint64_t)v32;
      goto LABEL_42;
    }
LABEL_40:
    sub_100207E24();
    sub_100207DE8(v61);
    v57 = v101;
LABEL_43:
    v80 = sub_100207E24();
    sub_100207DE8(v57);
    sub_100207DE8(v102);
    v66 = 0;
    v65 = (v80 << 16);
    goto LABEL_44;
  }
  if (v71 <= 32)
    goto LABEL_40;
  v72 = sub_100207B2C();
  sub_100207DF0(v72, (uint64_t)&type metadata for Int32, v72);
  v73 = dispatch thunk of static Comparable.< infix(_:_:)(v32, v61, a2, *(_QWORD *)(*(_QWORD *)(a3 + 32) + 8));
  sub_100207DE8((uint64_t)v32);
  v74 = v61;
LABEL_42:
  sub_100207DE8(v74);
  v57 = v101;
  if ((v73 & 1) == 0)
    goto LABEL_43;
  __break(1u);
LABEL_59:
  result = sub_100207DE8(v73);
LABEL_60:
  __break(1u);
  return result;
}

unint64_t sub_100207B2C()
{
  unint64_t result;

  result = qword_1002B67A8;
  if (!qword_1002B67A8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Int32, &type metadata for Int32);
    atomic_store(result, (unint64_t *)&qword_1002B67A8);
  }
  return result;
}

uint64_t HIDFixed.magnitude.getter(uint64_t result)
{
  if ((int)result >= 0)
    return result;
  else
    return -(int)result;
}

unint64_t sub_100207B74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t result;

  result = HIDFixed.init<A>(exactly:)(a1, a2, a3);
  *(_DWORD *)a4 = result;
  *(_BYTE *)(a4 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t sub_100207BA0@<X0>(_DWORD *a1@<X8>)
{
  unsigned int *v1;
  uint64_t result;

  result = HIDFixed.magnitude.getter(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_100207BC8@<X0>(int *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = static HIDFixed.* infix(_:_:)(*a1);
  *a2 = result;
  return result;
}

uint64_t static HIDFixed.* infix(_:_:)(int a1)
{
  double v1;
  double v2;
  uint64_t v3;

  v1 = sub_100207E60(a1);
  *(HIDUtils::HIDFixed_optional *)&v3 = HIDFixed.init(doubleValue:)(v1 * v2);
  return sub_100207E7C(v3);
}

uint64_t sub_100207C14(int *a1)
{
  return static HIDFixed.*= infix(_:_:)(a1);
}

uint64_t static HIDFixed.*= infix(_:_:)(int *a1)
{
  uint64_t result;

  result = static HIDFixed.* infix(_:_:)(*a1);
  *a1 = result;
  return result;
}

uint64_t static HIDFixed.* infix(_:_:)()
{
  double v0;
  double v1;
  uint64_t v2;

  sub_100207EB0();
  *(HIDUtils::HIDFixed_optional *)&v2 = HIDFixed.init(doubleValue:)(v1 * v0);
  return sub_100207E7C(v2);
}

uint64_t static HIDFixed./ infix(_:_:)(int a1)
{
  double v1;
  double v2;
  uint64_t v3;

  v1 = sub_100207E60(a1);
  *(HIDUtils::HIDFixed_optional *)&v3 = HIDFixed.init(doubleValue:)(v1 / v2);
  return sub_100207E7C(v3);
}

uint64_t static HIDFixed./= infix(_:_:)(int *a1)
{
  uint64_t result;

  result = static HIDFixed./ infix(_:_:)(*a1);
  *a1 = result;
  return result;
}

uint64_t static HIDFixed./ infix(_:_:)()
{
  double v0;
  double v1;
  uint64_t v2;

  sub_100207EB0();
  *(HIDUtils::HIDFixed_optional *)&v2 = HIDFixed.init(doubleValue:)(v1 / v0);
  return sub_100207E7C(v2);
}

uint64_t HIDFixed.description.getter(int a1)
{
  return Double.description.getter((double)a1 * 0.0000152587891);
}

unint64_t sub_100207CE4()
{
  unint64_t result;

  result = qword_1002B67B0;
  if (!qword_1002B67B0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDFixed, &type metadata for HIDFixed);
    atomic_store(result, (unint64_t *)&qword_1002B67B0);
  }
  return result;
}

void *sub_100207D20()
{
  return &protocol witness table for Int;
}

void *sub_100207D2C()
{
  return &protocol witness table for Double;
}

unint64_t sub_100207D3C()
{
  unint64_t result;

  result = qword_1002B67B8;
  if (!qword_1002B67B8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDFixed, &type metadata for HIDFixed);
    atomic_store(result, (unint64_t *)&qword_1002B67B8);
  }
  return result;
}

unint64_t sub_100207D7C()
{
  unint64_t result;

  result = qword_1002B67C0;
  if (!qword_1002B67C0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDFixed, &type metadata for HIDFixed);
    atomic_store(result, (unint64_t *)&qword_1002B67C0);
  }
  return result;
}

void *sub_100207DB8()
{
  return &protocol witness table for Int32;
}

void *sub_100207DC4()
{
  return &protocol witness table for Int32;
}

uint64_t sub_100207DD0()
{
  int *v0;

  return HIDFixed.description.getter(*v0);
}

ValueMetadata *type metadata accessor for HIDFixed()
{
  return &type metadata for HIDFixed;
}

uint64_t sub_100207DE8(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t sub_100207DF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)(v5 - 84, a2, a3, v3, v4);
}

uint64_t sub_100207E08()
{
  uint64_t v0;
  uint64_t v1;

  return dispatch thunk of static BinaryInteger.isSigned.getter(v0, v1);
}

uint64_t sub_100207E18()
{
  uint64_t v0;
  uint64_t v1;

  return dispatch thunk of BinaryInteger.bitWidth.getter(v0, v1);
}

uint64_t sub_100207E24()
{
  uint64_t v0;
  uint64_t v1;

  return dispatch thunk of BinaryInteger._lowWord.getter(v0, v1);
}

uint64_t sub_100207E30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return dispatch thunk of static Comparable.< infix(_:_:)(v3, v2, v0, *(_QWORD *)(*(_QWORD *)(v1 + 32) + 8));
}

uint64_t sub_100207E48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  return dispatch thunk of static Comparable.< infix(_:_:)(a1, v5, v4, a4);
}

uint64_t sub_100207E54(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v2, v1);
}

double sub_100207E60(int a1)
{
  return (double)a1 * 0.0000152587891;
}

uint64_t sub_100207E7C(uint64_t result)
{
  if ((result & (unint64_t)&_mh_execute_header) != 0)
    return 0;
  else
    return result;
}

uint64_t sub_100207E88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t sub_100207EA4(uint64_t a1)
{
  uint64_t v1;

  return dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)(a1, 256, v1);
}

unint64_t sub_100207EC4@<X0>(int a1@<W8>)
{
  uint64_t v1;

  *(_DWORD *)(v1 - 84) = a1;
  return sub_100207B2C();
}

uint64_t sub_100207ECC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return swift_getAssociatedConformanceWitness(a1, v1, v2);
}

float sub_100207EDC()
{
  __int128 v0;
  float result;
  mach_timebase_info v2;

  v2 = 0;
  mach_timebase_info(&v2);
  *(_QWORD *)&v0 = v2.numer;
  *((_QWORD *)&v0 + 1) = v2.denom;
  result = *(float *)&v2.numer;
  xmmword_1002B67C8 = v0;
  return result;
}

uint64_t static HIDTime.timebase.getter()
{
  if (qword_1002B64C8 != -1)
    swift_once(&qword_1002B64C8, sub_100207EDC);
  return xmmword_1002B67C8;
}

HIDUtils::HIDTime __swiftcall HIDTime.init(nanoseconds:)(Swift::Double nanoseconds)
{
  char v2;
  HIDUtils::HIDTime result;
  char v4;
  char v5;

  if (qword_1002B64C8 != -1)
    swift_once(&qword_1002B64C8, sub_100207EDC);
  sub_100189CA0((double)*((unint64_t *)&xmmword_1002B67C8 + 1) * nanoseconds, (double)(unint64_t)xmmword_1002B67C8);
  if (!v2)
    goto LABEL_7;
  sub_100189CB8();
  if (v4)
  {
    __break(1u);
  }
  else
  {
    sub_100189CC8();
    if (!(v2 ^ v5 | v4))
    {
LABEL_7:
      sub_100189CD4();
      return result;
    }
  }
  __break(1u);
  return result;
}

HIDUtils::HIDTime __swiftcall HIDTime.init(nanoseconds:)(Swift::UInt64 nanoseconds)
{
  double v1;
  char v2;
  HIDUtils::HIDTime result;
  char v4;
  char v5;

  v1 = (double)nanoseconds;
  if (qword_1002B64C8 != -1)
    swift_once(&qword_1002B64C8, sub_100207EDC);
  sub_100189CA0(v1 * (double)*((unint64_t *)&xmmword_1002B67C8 + 1), (double)(unint64_t)xmmword_1002B67C8);
  if (!v2)
    goto LABEL_7;
  sub_100189CB8();
  if (v4)
  {
    __break(1u);
  }
  else
  {
    sub_100189CC8();
    if (!(v2 ^ v5 | v4))
    {
LABEL_7:
      sub_100189CD4();
      return result;
    }
  }
  __break(1u);
  return result;
}

void HIDTime.nanoseconds.getter(unint64_t a1)
{
  char v2;
  char v3;
  char v4;

  if (qword_1002B64C8 != -1)
    swift_once(&qword_1002B64C8, sub_100207EDC);
  sub_100189CA0((double)a1 * (double)(unint64_t)xmmword_1002B67C8, (double)*((unint64_t *)&xmmword_1002B67C8 + 1));
  if (v2)
  {
    sub_100189CB8();
    if (v3)
    {
      __break(1u);
    }
    else
    {
      sub_100189CC8();
      if (!(v2 ^ v4 | v3))
        return;
    }
    __break(1u);
  }
}

HIDUtils::HIDTime __swiftcall HIDTime.init(seconds:)(Swift::Double seconds)
{
  double v1;
  char v2;
  HIDUtils::HIDTime result;
  char v4;
  char v5;

  v1 = seconds * 1000000000.0;
  if (qword_1002B64C8 != -1)
    swift_once(&qword_1002B64C8, sub_100207EDC);
  sub_100189CA0(v1 * (double)*((unint64_t *)&xmmword_1002B67C8 + 1), (double)(unint64_t)xmmword_1002B67C8);
  if (!v2)
    goto LABEL_7;
  sub_100189CB8();
  if (v4)
  {
    __break(1u);
  }
  else
  {
    sub_100189CC8();
    if (!(v2 ^ v5 | v4))
    {
LABEL_7:
      sub_100189CD4();
      return result;
    }
  }
  __break(1u);
  return result;
}

void HIDTime.seconds.getter(unint64_t a1)
{
  char v2;
  char v3;
  char v4;

  if (qword_1002B64C8 != -1)
    swift_once(&qword_1002B64C8, sub_100207EDC);
  sub_100189CA0((double)a1 * (double)(unint64_t)xmmword_1002B67C8, (double)*((unint64_t *)&xmmword_1002B67C8 + 1));
  if (v2)
  {
    sub_100189CB8();
    if (v3)
    {
      __break(1u);
    }
    else
    {
      sub_100189CC8();
      if (!(v2 ^ v4 | v3))
        return;
    }
    __break(1u);
  }
}

HIDUtils::HIDTime static HIDTime.+ infix(_:_:)(unint64_t a1, double a2)
{
  unint64_t v3;

  HIDTime.nanoseconds.getter(a1);
  return HIDTime.init(nanoseconds:)(((double)v3 * 0.000000001 + a2) * 1000000000.0);
}

void static HIDTime.- infix(_:_:)(unint64_t a1, double a2)
{
  char v4;
  char v5;
  double v6;
  char v7;
  double v8;

  if (qword_1002B64C8 != -1)
    swift_once(&qword_1002B64C8, sub_100207EDC);
  sub_100189CA0((double)a1 * (double)(unint64_t)xmmword_1002B67C8, (double)*((unint64_t *)&xmmword_1002B67C8 + 1));
  if (!v4)
  {
    v8 = 1.84467441e10;
    goto LABEL_8;
  }
  sub_100189CB8();
  if (v5)
  {
    __break(1u);
    goto LABEL_12;
  }
  sub_100189CC8();
  if (v4 ^ v7 | v5)
  {
LABEL_12:
    __break(1u);
    return;
  }
  v8 = (double)(unint64_t)v6 * 0.000000001;
LABEL_8:
  if (v8 > a2)
    HIDTime.init(nanoseconds:)((v8 - a2) * 1000000000.0);
}

uint64_t HIDTime.description.getter(unint64_t a1)
{
  HIDTime.nanoseconds.getter(a1);
  return dispatch thunk of CustomStringConvertible.description.getter(&type metadata for UInt64, &protocol witness table for UInt64);
}

uint64_t sub_10020839C()
{
  unint64_t *v0;

  return HIDTime.description.getter(*v0);
}

unint64_t sub_1002083A8()
{
  unint64_t result;

  result = qword_1002B67D8;
  if (!qword_1002B67D8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDTime, &type metadata for HIDTime);
    atomic_store(result, (unint64_t *)&qword_1002B67D8);
  }
  return result;
}

ValueMetadata *type metadata accessor for HIDTime()
{
  return &type metadata for HIDTime;
}

id ScaleEvent.init(time:point:flags:)(uint64_t a1, uint64_t a2)
{
  void *ScaleEvent;
  id v3;

  ScaleEvent = (void *)IOHIDEventCreateScaleEvent(0, a1, a2);
  v3 = ScaleEvent;

  return v3;
}

void ScaleEvent.x.getter(void *a1)
{
  IOHIDEventGetFloatValue(a1, 458752);
  sub_1001F42E8();
  sub_1001A4570();
}

void ScaleEvent.x.setter(void *a1)
{
  id v1;

  v1 = sub_1001F42F0(a1);
  sub_1001F42C0((uint64_t)v1, 458752);
  sub_1001F4284(v1);
}

void ScaleEvent.x.modify(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v4 = sub_1001F4290(a1, a2);
  IOHIDEventGetFloatValue(v4, 458752);
  sub_1001F42E0();
  *v2 = v3;
  sub_1001A4570();
}

void sub_1002084D0(uint64_t a1, uint64_t a2)
{
  sub_1001F4A20(a1, a2, 458752);
}

void ScaleEvent.y.getter(void *a1)
{
  sub_1002086C8((uint64_t)a1, 1u);
  sub_1001F42E8();
  sub_1001A4570();
}

void ScaleEvent.y.setter(void *a1)
{
  id v1;

  v1 = sub_1001F42F0(a1);
  sub_1001F42C0((uint64_t)v1, 458753);
  sub_1001F4284(v1);
}

void ScaleEvent.y.modify(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v4 = sub_1001F4290(a1, a2);
  sub_1002086C8((uint64_t)v4, 1u);
  sub_1001F42E0();
  *v2 = v3;
  sub_1001A4570();
}

void sub_100208574(uint64_t a1, uint64_t a2)
{
  sub_1002086C0(a1, a2, 1u);
}

void ScaleEvent.z.getter(void *a1)
{
  sub_1002086C8((uint64_t)a1, 2u);
  sub_1001F42E8();
  sub_1001A4570();
}

void ScaleEvent.z.setter(void *a1)
{
  id v1;

  v1 = sub_1001F42F0(a1);
  sub_1001F42C0((uint64_t)v1, 458754);
  sub_1001F4284(v1);
}

void ScaleEvent.z.modify(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v4 = sub_1001F4290(a1, a2);
  sub_1002086C8((uint64_t)v4, 2u);
  sub_1001F42E0();
  *v2 = v3;
  sub_1001A4570();
}

void sub_100208618(uint64_t a1, uint64_t a2)
{
  sub_1002086C0(a1, a2, 2u);
}

void sub_100208620(void **a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  ScaleEvent.x.getter(*a1);
  *a2 = v3;
  sub_1000050D4();
}

void sub_100208644(uint64_t a1, void **a2)
{
  ScaleEvent.x.setter(*a2);
}

void sub_100208650(void **a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  ScaleEvent.y.getter(*a1);
  *a2 = v3;
  sub_1000050D4();
}

void sub_100208674(uint64_t a1, void **a2)
{
  ScaleEvent.y.setter(*a2);
}

void sub_100208680(void **a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  ScaleEvent.z.getter(*a1);
  *a2 = v3;
  sub_1000050D4();
}

void sub_1002086A4(uint64_t a1, void **a2)
{
  ScaleEvent.z.setter(*a2);
}

ValueMetadata *type metadata accessor for ScaleEvent()
{
  return &type metadata for ScaleEvent;
}

void sub_1002086C0(uint64_t a1, uint64_t a2, unsigned __int16 a3)
{
  sub_1001F4A20(a1, a2, a3 | 0x70000u);
}

uint64_t sub_1002086C8(uint64_t a1, unsigned __int16 a2)
{
  return IOHIDEventGetFloatValue(a1, a2 | 0x70000u);
}

_QWORD *sub_1002086D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int64_t v10;
  _QWORD *v11;
  uint64_t i;
  unint64_t v13;
  unint64_t v14;
  _QWORD v16[2];
  _QWORD *v17;

  v4 = v3;
  v16[0] = a1;
  v16[1] = a2;
  v6 = type metadata accessor for PropertyListNode(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(a3 + 16);
  v11 = _swiftEmptyArrayStorage;
  if (v10)
  {
    v17 = _swiftEmptyArrayStorage;
    sub_1001F3A1C(0, v10, 0);
    v11 = v17;
    for (i = a3 + 32; ; i += 32)
    {
      ((void (*)(uint64_t))v16[0])(i);
      if (v4)
        break;
      v4 = 0;
      v17 = v11;
      v14 = v11[2];
      v13 = v11[3];
      if (v14 >= v13 >> 1)
      {
        sub_1001F3A1C(v13 > 1, v14 + 1, 1);
        v11 = v17;
      }
      v11[2] = v14 + 1;
      sub_1002056CC((uint64_t)v9, (uint64_t)v11+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v14);
      if (!--v10)
        return v11;
    }
    swift_release();
  }
  return v11;
}

void visitNodes(node:parent:visitor:)(uint64_t a1, __int128 *a2, void (*a3)(__int128 *, uint64_t), uint64_t a4)
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
  char *v17;
  char v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(__int128 *, uint64_t);
  __int128 v29;
  char v30;

  v28 = a3;
  v23 = a1;
  sub_1000055B0(&qword_1002B67E0);
  sub_1000262EC();
  __chkstk_darwin(v6);
  sub_10000E5DC();
  v24 = v7;
  sub_1000055B0(&qword_1002B67E8);
  sub_1000262EC();
  __chkstk_darwin(v8);
  sub_10003D69C();
  v25 = v9;
  sub_1000A3464();
  __chkstk_darwin(v10);
  sub_1000055B0(&qword_1002B67F0);
  sub_1000262EC();
  __chkstk_darwin(v11);
  sub_1000268BC();
  __chkstk_darwin(v12);
  sub_10020E210();
  __chkstk_darwin(v13);
  v22 = sub_10020DF98();
  v26 = *(_QWORD *)(v22 - 8);
  sub_1000262EC();
  __chkstk_darwin(v14);
  sub_1000268BC();
  __chkstk_darwin(v15);
  v17 = (char *)&v21 - v16;
  v18 = *((_BYTE *)a2 + 16);
  v29 = *a2;
  v30 = v18;
  v19 = v23;
  v27 = a4;
  v28(&v29, v23);
  sub_10020E17C(v19);
  v20 = (char *)&loc_1002089A8 + *((int *)qword_100208D28 + swift_getEnumCaseMultiPayload(v17, v22));
  __asm { BR              X10 }
}

uint64_t sub_1002089B8()
{
  uint64_t v0;

  return sub_100022AEC(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
}

#error "100208D20: call analysis failed (funcsize=11)"

uint64_t type metadata accessor for PropertyListNode(uint64_t a1)
{
  uint64_t result;

  result = qword_1002B69B8;
  if (!qword_1002B69B8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PropertyListNode);
  return result;
}

uint64_t PropertyListNode.init(dictionaryLiteral:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_100066CF4((uint64_t)&unk_100297490);
  sub_1001F950C(a1);
  *(_QWORD *)(v4 + 16) = v5;
  *a2 = v4;
  v6 = sub_10020DF98();
  return swift_storeEnumTagMultiPayload(a2, v6, 7);
}

uint64_t sub_100208DDC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void PropertyListNode.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  sub_10020DF98();
  sub_1000262EC();
  __chkstk_darwin(v5);
  sub_10000E478();
  sub_1001F94F8(a1);
  sub_10020E19C();
  sub_100066CF4((uint64_t)&unk_100297490);
  sub_10020E110();
  sub_10017E5BC();
  *(_QWORD *)(v3 + 16) = v1;
  sub_10020E194();
  sub_10020E0FC();
  sub_10020E008(v2);
  sub_10020E194();
  sub_10002644C();
}

uint64_t sub_100208E88@<X0>(_QWORD *a1@<X0>, CFTypeID *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  const void *v6;
  CFTypeID v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFTypeID v17;
  uint64_t v18;
  __n128 v20;
  const __CFNumber *v21;
  CFNumberType Type;
  id v23;
  CFTypeID v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  CFTypeID v29;
  uint64_t v30;
  Swift::String v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  Swift::String v38;
  int v39;
  uint64_t v40;
  unint64_t v41;
  _OWORD v42[2];

  v4 = a1[3];
  v5 = sub_10000DBE4(a1, v4);
  v6 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)(v5, v4);
  v7 = CFGetTypeID(v6);
  if (CFDictionaryGetTypeID() == v7)
  {
    sub_100066CF4((uint64_t)&unk_100297490);
    sub_10020E1AC();
    v8 = sub_1000055B0((uint64_t *)&unk_1002B6170);
    v9 = sub_10020E01C(v8, (uint64_t)&type metadata for Swift.AnyObject);
    __chkstk_darwin(v9);
    sub_100095520();
    sub_10020C154((void (*)(_QWORD *, __n128))sub_10020DF24, v10, v40);
    sub_10020E230();
    sub_100079914();
    *(_QWORD *)(v7 + 16) = v2;
    *a2 = v7;
    sub_10020DF98();
    v11 = sub_10020E064();
    v13 = 7;
    return swift_storeEnumTagMultiPayload(v11, v12, v13);
  }
  if (CFArrayGetTypeID() == v7)
  {
    sub_100066CF4((uint64_t)&unk_1002974B8);
    sub_10020E1AC();
    v14 = sub_1000055B0(&qword_1002B09B0);
    v15 = sub_10020E01C(v14, (uint64_t)&type metadata for Swift.AnyObject);
    __chkstk_darwin(v15);
    sub_100095520();
    sub_1002086D0((uint64_t)sub_10020DF24, v16, v40);
    sub_10020E230();
    sub_100079914();
    *(_QWORD *)(v7 + 16) = v2;
    *a2 = v7;
    sub_10020DF98();
    v11 = sub_10020E064();
    v13 = 6;
    return swift_storeEnumTagMultiPayload(v11, v12, v13);
  }
  if (CFStringGetTypeID() == v7)
  {
    v40 = (uint64_t)v6;
    sub_10020E070((uint64_t)v42, (uint64_t)&v40, (uint64_t)&type metadata for Swift.AnyObject + 8, (uint64_t)&type metadata for String);
    v17 = *((_QWORD *)&v42[0] + 1);
    *a2 = *(_QWORD *)&v42[0];
    a2[1] = v17;
    sub_10020DF98();
    v11 = sub_10020E064();
    v13 = 2;
    return swift_storeEnumTagMultiPayload(v11, v12, v13);
  }
  if (CFDateGetTypeID() == v7)
  {
    *(_QWORD *)&v42[0] = v6;
    v18 = sub_10000E5D4();
    sub_10020E070((uint64_t)a2, (uint64_t)v42, (uint64_t)&type metadata for Swift.AnyObject + 8, v18);
    sub_10020DF98();
    v11 = sub_10020E064();
    v13 = 1;
    return swift_storeEnumTagMultiPayload(v11, v12, v13);
  }
  if (CFDataGetTypeID() == v7)
  {
    v40 = (uint64_t)v6;
    sub_10020E070((uint64_t)v42, (uint64_t)&v40, (uint64_t)&type metadata for Swift.AnyObject + 8, (uint64_t)&type metadata for Data);
    *(_OWORD *)a2 = v42[0];
    sub_10020DF98();
    v11 = sub_10020E064();
    v13 = 0;
    return swift_storeEnumTagMultiPayload(v11, v12, v13);
  }
  if (CFBooleanGetTypeID() == v7)
  {
    *(_QWORD *)&v42[0] = v6;
    sub_10020E01C((uint64_t)&type metadata for Bool, (uint64_t)&type metadata for Swift.AnyObject);
    *(_BYTE *)a2 = v40;
    sub_10020DF98();
    v11 = sub_10020E064();
    v13 = 3;
    return swift_storeEnumTagMultiPayload(v11, v12, v13);
  }
  if (CFNumberGetTypeID() != v7)
  {
    sub_10020E224();
    _StringGuts.grow(_:)(37);
    swift_bridgeObjectRelease();
    v40 = 0xD000000000000023;
    v41 = 0x800000010025AF00;
    sub_10020E140();
    v37 = sub_1000055B0(&qword_1002B6AE0);
    v38._countAndFlagsBits = sub_10020E23C(v37);
    String.append(_:)(v38);
    sub_10000E410();
    sub_10020DFEC();
    v36 = 113;
LABEL_27:
    sub_10020DFA0((uint64_t)"Fatal error", 11, 2, v32, v33, (uint64_t)"HIDUtils/PropertyListNode.swift", v34, v35, v36, v39);
    sub_10020E010();
  }
  type metadata accessor for CFNumber(0);
  v20 = swift_unknownObjectRetain(v6);
  v21 = (const __CFNumber *)swift_dynamicCastUnknownClassUnconditional(v20);
  Type = CFNumberGetType(v21);
  if ((unint64_t)Type > kCFNumberCGFloatType)
    goto LABEL_25;
  if (((1 << Type) & 0xCF9E) == 0)
  {
    if (((1 << Type) & 0x13060) != 0)
    {
      v28 = sub_10020E1BC(1);
      static Double._forceBridgeFromObjectiveC(_:result:)(v28, v42);
      if ((BYTE8(v42[0]) & 1) == 0)
      {
        v29 = *(_QWORD *)&v42[0];

        sub_100079914();
        *a2 = v29;
        sub_10020DF98();
        v25 = sub_10020E064();
        v27 = 5;
        return swift_storeEnumTagMultiPayload(v25, v26, v27);
      }
      goto LABEL_24;
    }
LABEL_25:
    sub_10020E224();
    _StringGuts.grow(_:)(41);
    swift_bridgeObjectRelease();
    v40 = 0xD000000000000027;
    v41 = 0x800000010025AF30;
    sub_10020E140();
    v30 = sub_1000055B0(&qword_1002B6AE0);
    v31._countAndFlagsBits = sub_10020E23C(v30);
    String.append(_:)(v31);
    sub_10000E410();
    sub_10020DFEC();
    v36 = 110;
    goto LABEL_27;
  }
  v23 = sub_10020E1BC(1);
  static UInt64._forceBridgeFromObjectiveC(_:result:)(v23, v42);
  if ((BYTE8(v42[0]) & 1) != 0)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v24 = *(_QWORD *)&v42[0];

  sub_100079914();
  *a2 = v24;
  sub_10020DF98();
  v25 = sub_10020E064();
  v27 = 4;
  return swift_storeEnumTagMultiPayload(v25, v26, v27);
}

void PropertyListNode.init(dictionary:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_10020DF98();
  sub_1000262EC();
  __chkstk_darwin(v3);
  sub_10000E478();
  sub_10020E19C();
  sub_100066CF4((uint64_t)&unk_100297490);
  sub_10020E110();
  sub_10017E5BC();
  *(_QWORD *)(v2 + 16) = v0;
  sub_10020E194();
  sub_10020E0FC();
  sub_10020E008(v1);
  sub_10020E194();
  sub_10002644C();
}

void PropertyListNode.init(wrapping:)(_QWORD *a1@<X0>, CFTypeID *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;

  sub_10020DF98();
  sub_1000262EC();
  __chkstk_darwin(v5);
  sub_1000601B4();
  swift_storeEnumTagMultiPayload(v2, v6, 8);
  sub_100208E88(a1, a2);
  sub_100005988(a1);
  sub_100205710(v2);
  sub_10000B350();
}

void PropertyListNode.asDictionary()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  sub_10020DF98();
  sub_1000262EC();
  __chkstk_darwin(v0);
  sub_10020DF4C(v1, v4);
  if (sub_10020DFD8() != 7)
  {
    sub_10020DFE4();
    sub_10020DFEC();
    sub_10020DFA0((uint64_t)"Fatal error", 11, 2, 0xD000000000000010, 0x800000010025AEE0, (uint64_t)"HIDUtils/PropertyListNode.swift", v2, v3, 147, v5);
    sub_10020E010();
  }
  sub_10020E184();
  sub_10002645C();
  sub_10000B350();
}

void PropertyListNode.asArray()()
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
  int v10;

  sub_10020DF98();
  sub_1000262EC();
  __chkstk_darwin(v0);
  sub_10020DF4C(v1, v9);
  if (sub_10020DFD8() != 6)
  {
    sub_10020DFE4();
    sub_10020DFEC();
    sub_10020E164();
    sub_10020DFA0(v3, v4, v5, v2 & 0xFFFFFFFFFFFFLL | 0x6120000000000000, 0xEC00000079617272, v6, v7, v8, 152, v10);
    sub_10020E010();
  }
  sub_10020E184();
  sub_10002645C();
  sub_10000B350();
}

void PropertyListNode.asDate()()
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
  int v16;

  v1 = v0;
  sub_10020DF98();
  sub_1000262EC();
  __chkstk_darwin(v2);
  sub_10002641C();
  v5 = v4 - v3;
  sub_100205DA0(v1, v4 - v3);
  v6 = sub_100141400();
  if (swift_getEnumCaseMultiPayload(v6, v7) != 1)
  {
    sub_100205710(v5);
    sub_10020DFEC();
    sub_10020E0B0();
    sub_10020DFA0(v9, v10, v11, v12, 0xEA00000000006574, v13, v14, v15, 157, v16);
    sub_10020E010();
  }
  v8 = sub_10000E5D4();
  sub_1001AB088(v8);
  sub_10000B350();
}

void PropertyListNode.asData()()
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
  int v10;

  sub_10020DF98();
  sub_1000262EC();
  __chkstk_darwin(v0);
  sub_10020DF4C(v1, v9);
  if (sub_10020DFD8())
  {
    sub_10020DFE4();
    sub_10020DFEC();
    sub_10020E0B0();
    sub_10020DFA0(v2, v3, v4, v5, 0xEA00000000006174, v6, v7, v8, 162, v10);
    sub_10020E010();
  }
  sub_10000B350();
}

Swift::Bool __swiftcall PropertyListNode.asBool()()
{
  Swift::Bool *v0;
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
  int v12;

  sub_10020DF98();
  sub_1000262EC();
  __chkstk_darwin(v1);
  sub_10020DF4C(v2, v11);
  if (sub_10020DFD8() != 3)
  {
    sub_10020DFE4();
    sub_10020DFEC();
    sub_10020E030();
    sub_10020DFA0(v5, v6, v7, v4 & 0xFFFFFFFFFFFFLL | 0x6F62000000000000, 0xEA00000000006C6FLL, v8, v9, v10, 167, v12);
    sub_10020E010();
  }
  return *v0;
}

Swift::String __swiftcall PropertyListNode.asString()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::String result;
  uint64_t v12;
  int v13;

  sub_10020DF98();
  sub_1000262EC();
  __chkstk_darwin(v0);
  sub_10020DF4C(v1, v12);
  if (sub_10020DFD8() != 2)
  {
    sub_10020DFE4();
    sub_10020DFEC();
    sub_10020E030();
    sub_10020DFA0(v5, v6, v7, v4 & 0xFFFFFFFFFFFFLL | 0x7473000000000000, 0xEC000000676E6972, v8, v9, v10, 172, v13);
    sub_10020E010();
  }
  sub_10000B350();
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

Swift::UInt64 __swiftcall PropertyListNode.asUInt64()()
{
  uint64_t v0;
  uint64_t v1;
  Swift::UInt64 result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  sub_10020DF98();
  sub_1000262EC();
  __chkstk_darwin(v0);
  sub_10020DF4C(v1, v10);
  if (sub_10020DFD8() != 4)
  {
    sub_10020DFE4();
    sub_10020DFEC();
    sub_10020E164();
    sub_10020DFA0(v4, v5, v6, v3 & 0xFFFFFFFFFFFFLL | 0x6920000000000000, 0xEE0072656765746ELL, v7, v8, v9, 177, v11);
    sub_10020E010();
  }
  sub_10000B350();
  return result;
}

Swift::Double __swiftcall PropertyListNode.asDouble()()
{
  Swift::Double *v0;
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
  int v12;

  sub_10020DF98();
  sub_1000262EC();
  __chkstk_darwin(v1);
  sub_10020DF4C(v2, v11);
  if (sub_10020DFD8() != 5)
  {
    sub_10020DFE4();
    sub_10020DFEC();
    sub_10020E030();
    sub_10020DFA0(v5, v6, v7, v4 & 0xFFFFFFFFFFFFLL | 0x6F64000000000000, 0xEC000000656C6275, v8, v9, v10, 182, v12);
    sub_10020E010();
  }
  return *v0;
}

void static PropertyListNode.== infix(_:_:)(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;

  sub_10000E5D4();
  sub_1000262EC();
  __chkstk_darwin(v3);
  sub_10000E5DC();
  v4 = sub_10020DF98();
  sub_1000262EC();
  __chkstk_darwin(v5);
  sub_10003D69C();
  sub_1000A3464();
  __chkstk_darwin(v6);
  __chkstk_darwin(v7);
  sub_10020E1FC();
  __chkstk_darwin(v8);
  sub_1000C27F4();
  __chkstk_darwin(v9);
  __chkstk_darwin(v10);
  sub_1001B08A8();
  __chkstk_darwin(v11);
  sub_10020E210();
  __chkstk_darwin(v12);
  sub_1000055B0(&qword_1002B67F8);
  sub_1000262EC();
  __chkstk_darwin(v13);
  sub_1000F0204();
  v15 = v2 + *(int *)(v14 + 48);
  sub_10020E008(a1);
  sub_100205DA0(a2, v15);
  v16 = (char *)sub_100209A00 + 4 * byte_100230FB0[swift_getEnumCaseMultiPayload(v2, v4)];
  __asm { BR              X10 }
}

uint64_t sub_100209A00()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  unint64_t v6;
  uint64_t v7;

  sub_100205DA0(v0, (uint64_t)v2);
  v3 = *v2;
  v4 = v2[1];
  if (sub_10020DFAC())
  {
    sub_1001E1A70();
    sub_10000E36C(v0, &qword_1002B67F8);
    v5 = 0;
  }
  else
  {
    v7 = *v1;
    v6 = v1[1];
    v5 = static Data.== infix(_:_:)(v3, v4, v7, v6);
    sub_100022AEC(v7, v6);
    sub_1001E1A70();
    sub_10020DFE4();
  }
  return v5 & 1;
}

uint64_t sub_100209C90(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  BOOL v17;
  uint64_t v19;

  v4 = type metadata accessor for PropertyListNode(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v10 = (char *)&v19 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      v15 = 1;
    }
    else
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v13 = *(_QWORD *)(v8 + 72);
      v14 = v11 - 1;
      do
      {
        sub_100205DA0(a1 + v12, (uint64_t)v10);
        sub_100205DA0(a2 + v12, (uint64_t)v6);
        v15 = static PropertyListNode.== infix(_:_:)(v10, v6);
        sub_100205710((uint64_t)v6);
        sub_100205710((uint64_t)v10);
        v17 = v14-- != 0;
        if ((v15 & 1) == 0)
          break;
        v12 += v13;
      }
      while (v17);
    }
  }
  else
  {
    v15 = 0;
  }
  return v15 & 1;
}

void sub_100209DAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  int64_t v38;
  uint64_t v39;
  int64_t v40;
  uint64_t v41;
  uint64_t v42;
  int64_t v43;

  v4 = type metadata accessor for PropertyListNode(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v10 = (char *)&v38 - v9;
  v11 = sub_1000055B0(&qword_1002B6AD8);
  __chkstk_darwin(v11);
  v13 = (int64_t *)((char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v14);
  v16 = (int64_t *)((char *)&v38 - v15);
  if (a1 == a2 || *(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return;
  v42 = v5;
  v43 = 0;
  v41 = a1;
  v17 = *(_QWORD *)(a1 + 64);
  v39 = a1 + 64;
  v18 = 1 << *(_BYTE *)(a1 + 32);
  v19 = -1;
  if (v18 < 64)
    v19 = ~(-1 << v18);
  v20 = v19 & v17;
  v40 = (unint64_t)(v18 + 63) >> 6;
  v38 = v40 - 1;
  while (1)
  {
    if (v20)
    {
      v21 = __clz(__rbit64(v20));
      v20 &= v20 - 1;
      v22 = v21 | (v43 << 6);
LABEL_8:
      v23 = *(_QWORD *)(v41 + 56);
      v24 = (_QWORD *)(*(_QWORD *)(v41 + 48) + 16 * v22);
      v25 = v24[1];
      *v13 = *v24;
      v13[1] = v25;
      v26 = v23 + *(_QWORD *)(v5 + 72) * v22;
      v27 = sub_1000055B0(&qword_1002B67F0);
      sub_100205DA0(v26, (uint64_t)v13 + *(int *)(v27 + 48));
      _s13EnsembleAgent26PasteboardAcquisitionErrorOwst_0((uint64_t)v13, 0, 1, v27);
      swift_bridgeObjectRetain();
      goto LABEL_30;
    }
    v28 = v43 + 1;
    if (__OFADD__(v43, 1))
    {
      __break(1u);
      goto LABEL_38;
    }
    if (v28 < v40)
    {
      v29 = *(_QWORD *)(v39 + 8 * v28);
      if (v29)
        goto LABEL_12;
      v30 = v43 + 2;
      ++v43;
      if (v28 + 1 < v40)
      {
        v29 = *(_QWORD *)(v39 + 8 * v30);
        if (v29)
          goto LABEL_15;
        v43 = v28 + 1;
        if (v28 + 2 < v40)
        {
          v29 = *(_QWORD *)(v39 + 8 * (v28 + 2));
          if (v29)
          {
            v28 += 2;
            goto LABEL_12;
          }
          v43 = v28 + 2;
          if (v28 + 3 < v40)
          {
            v29 = *(_QWORD *)(v39 + 8 * (v28 + 3));
            if (v29)
            {
              v28 += 3;
              goto LABEL_12;
            }
            v30 = v28 + 4;
            v43 = v28 + 3;
            if (v28 + 4 < v40)
              break;
          }
        }
      }
    }
LABEL_29:
    v31 = sub_1000055B0(&qword_1002B67F0);
    _s13EnsembleAgent26PasteboardAcquisitionErrorOwst_0((uint64_t)v13, 1, 1, v31);
    v20 = 0;
LABEL_30:
    sub_1001AABD4((uint64_t)v13, (uint64_t)v16, &qword_1002B6AD8);
    v32 = sub_1000055B0(&qword_1002B67F0);
    if (_s13EnsembleAgent26PasteboardAcquisitionErrorOwet_0((uint64_t)v16, 1, v32) == 1)
      return;
    v34 = *v16;
    v33 = v16[1];
    sub_1002056CC((uint64_t)v16 + *(int *)(v32 + 48), (uint64_t)v10);
    v35 = sub_1000055F0(v34, v33);
    LOBYTE(v34) = v36;
    swift_bridgeObjectRelease();
    if ((v34 & 1) == 0)
    {
      sub_100205710((uint64_t)v10);
      return;
    }
    v5 = v42;
    sub_100205DA0(*(_QWORD *)(a2 + 56) + *(_QWORD *)(v42 + 72) * v35, (uint64_t)v7);
    v37 = static PropertyListNode.== infix(_:_:)(v7, v10);
    sub_100205710((uint64_t)v7);
    sub_100205710((uint64_t)v10);
    if ((v37 & 1) == 0)
      return;
  }
  v29 = *(_QWORD *)(v39 + 8 * v30);
  if (v29)
  {
LABEL_15:
    v28 = v30;
LABEL_12:
    v20 = (v29 - 1) & v29;
    v22 = __clz(__rbit64(v29)) + (v28 << 6);
    v43 = v28;
    goto LABEL_8;
  }
  while (1)
  {
    v28 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v28 >= v40)
    {
      v43 = v38;
      goto LABEL_29;
    }
    v29 = *(_QWORD *)(v39 + 8 * v28);
    ++v30;
    if (v29)
      goto LABEL_12;
  }
LABEL_38:
  __break(1u);
}

void PropertyListNode.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;

  v1 = sub_10000E5D4();
  __chkstk_darwin(v1);
  sub_1000601B4();
  v2 = sub_10020DF98();
  sub_1000262EC();
  __chkstk_darwin(v3);
  sub_10002641C();
  v6 = v5 - v4;
  sub_10020E1F4(v0);
  v7 = (char *)sub_10020A20C + 4 * byte_100230FB9[swift_getEnumCaseMultiPayload(v6, v2)];
  __asm { BR              X10 }
}

uint64_t sub_10020A20C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *v1;
  v3 = v1[1];
  Hasher._combine(_:)(1uLL);
  Data.hash(into:)(v0, v2, v3);
  return sub_100022AEC(v2, v3);
}

uint64_t sub_10020A36C(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v8;
  unint64_t v10;
  unint64_t v12;
  unint64_t v14;
  unint64_t v16;
  unint64_t v18;
  unint64_t v20;
  char v22;

  if (a1 == 0x6C616974696E69 && a2 == 0xE700000000000000)
  {
    v5 = 0xE700000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6C616974696E69, 0xE700000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 1635017060 && a2 == 0xE400000000000000)
  {
    v8 = 0xE400000000000000;
    goto LABEL_16;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(1635017060, 0xE400000000000000, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
LABEL_16:
    swift_bridgeObjectRelease(v8);
    return 1;
  }
  if (a1 == 1702125924 && a2 == 0xE400000000000000)
  {
    v10 = 0xE400000000000000;
    goto LABEL_24;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(1702125924, 0xE400000000000000, a1, a2, 0) & 1) != 0)
  {
    v10 = a2;
LABEL_24:
    swift_bridgeObjectRelease(v10);
    return 2;
  }
  if (a1 == 0x676E69727473 && a2 == 0xE600000000000000)
  {
    v12 = 0xE600000000000000;
    goto LABEL_32;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x676E69727473, 0xE600000000000000, a1, a2, 0) & 1) != 0)
  {
    v12 = a2;
LABEL_32:
    swift_bridgeObjectRelease(v12);
    return 3;
  }
  if (a1 == 1819242338 && a2 == 0xE400000000000000)
  {
    v14 = 0xE400000000000000;
    goto LABEL_40;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(1819242338, 0xE400000000000000, a1, a2, 0) & 1) != 0)
  {
    v14 = a2;
LABEL_40:
    swift_bridgeObjectRelease(v14);
    return 4;
  }
  if (a1 == 0x72656765746E69 && a2 == 0xE700000000000000)
  {
    v16 = 0xE700000000000000;
    goto LABEL_48;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x72656765746E69, 0xE700000000000000, a1, a2, 0) & 1) != 0)
  {
    v16 = a2;
LABEL_48:
    swift_bridgeObjectRelease(v16);
    return 5;
  }
  if (a1 == 0x656C62756F64 && a2 == 0xE600000000000000)
  {
    v18 = 0xE600000000000000;
    goto LABEL_56;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x656C62756F64, 0xE600000000000000, a1, a2, 0) & 1) != 0)
  {
    v18 = a2;
LABEL_56:
    swift_bridgeObjectRelease(v18);
    return 6;
  }
  if (a1 == 0x7961727261 && a2 == 0xE500000000000000)
  {
    v20 = 0xE500000000000000;
    goto LABEL_64;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x7961727261, 0xE500000000000000, a1, a2, 0) & 1) != 0)
  {
    v20 = a2;
LABEL_64:
    swift_bridgeObjectRelease(v20);
    return 7;
  }
  if (a1 == 0x616E6F6974636964 && a2 == 0xEA00000000007972)
  {
    swift_bridgeObjectRelease(0xEA00000000007972);
    return 8;
  }
  else
  {
    v22 = _stringCompareWithSmolCheck(_:_:expecting:)(0x616E6F6974636964, 0xEA00000000007972, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v22 & 1) != 0)
      return 8;
    else
      return 9;
  }
}

uint64_t sub_10020A6C4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10020A6F8 + 4 * byte_100230FC2[a1]))(0x6C616974696E69, 0xE700000000000000);
}

uint64_t sub_10020A6F8()
{
  return 1635017060;
}

uint64_t sub_10020A708()
{
  return 1702125924;
}

uint64_t sub_10020A718()
{
  return 0x676E69727473;
}

uint64_t sub_10020A72C()
{
  return 1819242338;
}

uint64_t sub_10020A73C()
{
  return 0x72656765746E69;
}

uint64_t sub_10020A750()
{
  return 0x656C62756F64;
}

uint64_t sub_10020A764()
{
  return 0x7961727261;
}

uint64_t sub_10020A778()
{
  return 0x616E6F6974636964;
}

uint64_t sub_10020A794(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = _stringCompareWithSmolCheck(_:_:expecting:)(12383, 0xE200000000000000, a1, a2, 0);
    sub_10000E410();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void sub_10020A7FC(uint64_t a1)
{
  sub_10000E5C0(a1);
  sub_10020E1EC();
  sub_10004740C();
  sub_10000E59C();
}

void sub_10020A824(uint64_t a1)
{
  sub_10020A7FC(a1);
}

uint64_t sub_10020A83C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10020CB0C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10020A864(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10020CB0C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10020A88C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10020A794(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_10020A8B4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10020CBC0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10020A8DC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10020CBC0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10020A904()
{
  unsigned __int8 *v0;

  return sub_10020A6C4(*v0);
}

uint64_t sub_10020A90C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10020A36C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10020A930(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10020CA10();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10020A958(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10020CA10();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10020A980(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10020CC74();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10020A9A8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10020CC74();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10020A9D0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10020CC38();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10020A9F8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10020CC38();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10020AA20(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10020CA4C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10020AA48(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10020CA4C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10020AA70(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10020CB48();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10020AA98(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10020CB48();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10020AAC0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10020CCB0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10020AAE8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10020CCB0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10020AB10(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10020CB84();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10020AB38(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10020CB84();
  return CodingKey.debugDescription.getter(a1, v2);
}

void sub_10020AB60(uint64_t a1)
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, a1);
  sub_10020E1EC();
  sub_10004740C();
  sub_10000E59C();
}

uint64_t sub_10020AB8C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10020CBFC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10020ABB4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10020CBFC();
  return CodingKey.debugDescription.getter(a1, v2);
}

void PropertyListNode.encode(to:)(uint64_t a1)
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
  _QWORD *v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  sub_1000055B0(&qword_1002B6800);
  sub_1000262EC();
  __chkstk_darwin(v2);
  sub_10000E5DC();
  sub_1000055B0(&qword_1002B6808);
  sub_1000262EC();
  __chkstk_darwin(v3);
  sub_1000EFF34(v4, v35);
  sub_1000055B0(&qword_1002B6810);
  sub_1000262EC();
  __chkstk_darwin(v5);
  sub_1000A3698(v6, v36);
  sub_1000055B0(&qword_1002B6818);
  sub_1000262EC();
  __chkstk_darwin(v7);
  sub_10020E124(v8, v37);
  sub_1000055B0(&qword_1002B6820);
  sub_1000262EC();
  __chkstk_darwin(v9);
  sub_10000E5DC();
  sub_1000A3740(v10);
  v11 = sub_1000055B0(&qword_1002B6828);
  sub_1000A353C(v11, (uint64_t)&v41);
  sub_1000262EC();
  __chkstk_darwin(v12);
  sub_10000E5DC();
  sub_1000A3740(v13);
  v14 = sub_1000055B0(&qword_1002B6830);
  sub_1000A353C(v14, (uint64_t)&v40);
  sub_1000262EC();
  __chkstk_darwin(v15);
  sub_10000E5DC();
  sub_1000A3740(v16);
  v17 = type metadata accessor for Date(0);
  sub_1000A353C(v17, (uint64_t)&v39);
  sub_1000262EC();
  __chkstk_darwin(v18);
  sub_10000E5DC();
  sub_1000A3740(v19);
  sub_1000055B0(&qword_1002B6838);
  sub_1000262EC();
  __chkstk_darwin(v20);
  sub_10000E5DC();
  sub_1000A3740(v21);
  v22 = sub_1000055B0(&qword_1002B6840);
  __chkstk_darwin(v22);
  sub_1000F0204();
  v23 = sub_10020DF98();
  sub_1000262EC();
  __chkstk_darwin(v24);
  sub_10002641C();
  v27 = v26 - v25;
  sub_1000055B0(&qword_1002B6848);
  sub_1000262EC();
  __chkstk_darwin(v28);
  sub_10002641C();
  v29 = *(_QWORD *)(a1 + 24);
  v30 = *(_QWORD *)(a1 + 32);
  v31 = (_QWORD *)sub_100141400();
  sub_10000DBE4(v31, v32);
  v33 = sub_10020CA10();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for PropertyListNode.CodingKeys, &type metadata for PropertyListNode.CodingKeys, v33, v29, v30);
  sub_100205DA0(v38, v27);
  v34 = (char *)sub_10020AEB8 + 4 * word_100230FCC[swift_getEnumCaseMultiPayload(v27, v23)];
  __asm { BR              X10 }
}

void sub_10020AEB8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *v0;
  v3 = v0[1];
  *(_BYTE *)(v1 - 104) = 1;
  sub_10020CC74();
  v4 = *(_QWORD *)(v1 - 360);
  sub_10020DFC4((uint64_t)&type metadata for PropertyListNode.DataCodingKeys, v1 - 104);
  *(_QWORD *)(v1 - 104) = v2;
  *(_QWORD *)(v1 - 96) = v3;
  v5 = sub_1000A23DC();
  v6 = *(_QWORD *)(v1 - 344);
  KeyedEncodingContainer.encode<A>(_:forKey:)(v1 - 104, v7, v6, &type metadata for Data, v5);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 352) + 8))(v4, v6);
  sub_10020DFF8(*(_QWORD *)(v1 - 144));
  sub_100022AEC(v2, v3);
  sub_10020E048();
}

void PropertyListNode.hashValue.getter(uint64_t a1)
{
  sub_10000E5C0(a1);
  PropertyListNode.hash(into:)();
  sub_10004740C();
  sub_10000E59C();
}

void PropertyListNode.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74[19];
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
  _QWORD *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;

  v84 = a2;
  v6 = sub_1000055B0(&qword_1002B68D0);
  sub_1000A353C(v6, (uint64_t)&v97);
  v83 = v7;
  sub_1000262EC();
  __chkstk_darwin(v8);
  sub_1000EFF34(v9, v74[0]);
  v10 = sub_1000055B0(&qword_1002B68D8);
  sub_1000A353C(v10, (uint64_t)&v96);
  v82 = v11;
  sub_1000262EC();
  __chkstk_darwin(v12);
  sub_10000E5DC();
  v77 = v13;
  v14 = sub_1000055B0(&qword_1002B68E0);
  sub_1000A353C(v14, (uint64_t)&v95);
  v74[14] = v15;
  sub_1000262EC();
  __chkstk_darwin(v16);
  sub_10000E5DC();
  v81 = v17;
  v18 = sub_1000055B0(&qword_1002B68E8);
  sub_1000A353C(v18, (uint64_t)&v94);
  v74[13] = v19;
  sub_1000262EC();
  __chkstk_darwin(v20);
  sub_10000E5DC();
  v80 = v21;
  v75 = sub_1000055B0(&qword_1002B68F0);
  v74[12] = *(_QWORD *)(v75 - 8);
  sub_1000262EC();
  __chkstk_darwin(v22);
  sub_1000A3698(v23, v74[0]);
  v24 = sub_1000055B0(&qword_1002B68F8);
  sub_1000A353C(v24, (uint64_t)&v93);
  v74[11] = v25;
  sub_1000262EC();
  __chkstk_darwin(v26);
  sub_10000E5DC();
  v79 = v27;
  v28 = sub_1000055B0(&qword_1002B6900);
  sub_1000A353C(v28, (uint64_t)&v92);
  v74[10] = v29;
  sub_1000262EC();
  __chkstk_darwin(v30);
  sub_10000E5DC();
  v78 = v31;
  v32 = sub_1000055B0(&qword_1002B6908);
  sub_1000A353C(v32, (uint64_t)&v91);
  v74[9] = v33;
  sub_1000262EC();
  __chkstk_darwin(v34);
  sub_10020E124(v35, v74[0]);
  v87 = sub_1000055B0(&qword_1002B6910);
  v74[15] = *(_QWORD *)(v87 - 8);
  sub_1000262EC();
  __chkstk_darwin(v36);
  sub_10000E5DC();
  v76 = v37;
  v88 = sub_1000055B0(&qword_1002B6918);
  v86 = *(_QWORD *)(v88 - 8);
  sub_1000262EC();
  __chkstk_darwin(v38);
  sub_10002641C();
  v41 = v40 - v39;
  v85 = sub_10020DF98();
  sub_1000262EC();
  __chkstk_darwin(v42);
  sub_10003D69C();
  v74[8] = v43;
  sub_1000A3464();
  __chkstk_darwin(v44);
  v74[7] = (uint64_t)v74 - v45;
  sub_1000A3464();
  __chkstk_darwin(v46);
  sub_1001B08A8();
  __chkstk_darwin(v47);
  sub_1000C27F4();
  __chkstk_darwin(v48);
  sub_10020E1FC();
  __chkstk_darwin(v49);
  v51 = (char *)v74 - v50;
  __chkstk_darwin(v52);
  v54 = (char *)v74 - v53;
  v55 = a1[3];
  v56 = a1[4];
  v89 = a1;
  sub_10000DBE4(a1, v55);
  v57 = sub_10020CA10();
  v58 = v90;
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for PropertyListNode.CodingKeys, &type metadata for PropertyListNode.CodingKeys, v57, v55, v56);
  if (!v58)
  {
    v74[2] = (uint64_t)v51;
    v74[3] = v2;
    v74[4] = v3;
    v74[5] = v4;
    v74[6] = (uint64_t)v54;
    v59 = v88;
    v60 = v41;
    v61 = KeyedDecodingContainer.allKeys.getter(v88);
    v62 = *(_QWORD *)(v61 + 16);
    if (v62)
    {
      v90 = v41;
      v74[1] = 0;
      v63 = *(unsigned __int8 *)(v61 + 32);
      sub_1000EFDFC(1, v62, v61, v61 + 32, 0, (2 * v62) | 1);
      v65 = v64;
      v67 = v66;
      swift_bridgeObjectRelease();
      if (v65 == v67 >> 1)
        __asm { BR              X9 }
      v59 = v88;
      v60 = v90;
    }
    v68 = v85;
    v69 = type metadata accessor for DecodingError(0);
    swift_allocError(v69, &protocol witness table for DecodingError, 0, 0);
    v71 = v70;
    sub_1000055B0(&qword_1002ABBD0);
    *v71 = v68;
    v72 = KeyedDecodingContainer.codingPath.getter(v59);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)(v72, 0xD00000000000002BLL, 0x8000000100253AD0, 0);
    v73 = (*(uint64_t (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v69 - 8) + 104))(v71, enum case for DecodingError.typeMismatch(_:), v69);
    swift_willThrow(v73);
    sub_1000A34D4();
    (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v60, v59);
  }
  sub_100005988(v89);
  sub_10020E048();
}

Swift::Int sub_10020BE8C(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  PropertyListNode.hash(into:)();
  return Hasher._finalize()();
}

void sub_10020BEC4(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  PropertyListNode.init(from:)(a1, a2);
}

void sub_10020BED8(uint64_t a1)
{
  PropertyListNode.encode(to:)(a1);
}

void sub_10020BEF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFTypeID *v16;
  unint64_t v17;
  unint64_t i;
  char v19;
  BOOL v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  CFTypeID *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[4];
  uint64_t v38;

  v38 = a2;
  v35 = *(_QWORD *)(sub_10020DF98() - 8);
  sub_1000262EC();
  __chkstk_darwin(v3);
  sub_1000268BC();
  v6 = v4 - v5;
  __chkstk_darwin(v7);
  v34 = (CFTypeID *)((char *)&v30 - v8);
  sub_1000055B0(&qword_1002B6708);
  v9 = (_QWORD *)static _DictionaryStorage.copy(original:)(a1);
  v10 = 0;
  v36 = a1;
  sub_100084F48();
  v13 = v12 & v11;
  v31 = a1 + 64;
  v32 = (unint64_t)(v14 + 63) >> 6;
  v33 = v15 + 64;
  v16 = v34;
  if ((v12 & v11) == 0)
    goto LABEL_3;
LABEL_2:
  v17 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v17 | (v10 << 6); ; i = __clz(__rbit64(v22)) + (v10 << 6))
  {
    v24 = (uint64_t *)(*(_QWORD *)(v36 + 48) + 16 * i);
    v25 = *v24;
    v26 = v24[1];
    sub_100007918(*(_QWORD *)(v36 + 56) + 32 * i, (uint64_t)v37);
    sub_100205DA0(v38, v6);
    swift_bridgeObjectRetain();
    sub_100208E88(v37, v16);
    sub_100205710(v6);
    sub_100005988(v37);
    *(_QWORD *)(v33 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v27 = (_QWORD *)(v9[6] + 16 * i);
    *v27 = v25;
    v27[1] = v26;
    sub_1002056CC((uint64_t)v16, v9[7] + *(_QWORD *)(v35 + 72) * i);
    v28 = v9[2];
    v20 = __OFADD__(v28, 1);
    v29 = v28 + 1;
    if (v20)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v9[2] = v29;
    if (v13)
      goto LABEL_2;
LABEL_3:
    if (__OFADD__(v10, 1))
      goto LABEL_24;
    sub_10020E1D4();
    if (v19 == v20)
      return;
    sub_10020E1C8();
    v10 = v21;
    if (!v22)
    {
      v10 = v21 + 1;
      if (v21 + 1 >= v32)
        return;
      v22 = *(_QWORD *)(v31 + 8 * v10);
      if (!v22)
      {
        v10 = v21 + 2;
        if (v21 + 2 >= v32)
          return;
        v22 = *(_QWORD *)(v31 + 8 * v10);
        if (!v22)
          break;
      }
    }
LABEL_18:
    v13 = (v22 - 1) & v22;
  }
  sub_10020E1D4();
  if (v19 == v20)
    return;
  sub_10020E1C8();
  if (v22)
  {
    v10 = v23;
    goto LABEL_18;
  }
  while (1)
  {
    v10 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v10 >= v32)
      return;
    v22 = *(_QWORD *)(v31 + 8 * v10);
    ++v23;
    if (v22)
      goto LABEL_18;
  }
LABEL_25:
  __break(1u);
}

uint64_t sub_10020C154(void (*a1)(_QWORD *, __n128), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  _QWORD *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t i;
  BOOL v19;
  unint64_t v20;
  int64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  __n128 v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(_QWORD *, __n128);
  uint64_t v34;
  _QWORD v35[4];
  uint64_t v36;

  v33 = a1;
  v34 = a2;
  v5 = type metadata accessor for PropertyListNode(0);
  v32 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000055B0(&qword_1002B6708);
  result = static _DictionaryStorage.copy(original:)(a3);
  v9 = (_QWORD *)result;
  v10 = 0;
  v36 = a3;
  v13 = *(_QWORD *)(a3 + 64);
  v12 = a3 + 64;
  v11 = v13;
  v14 = 1 << *(_BYTE *)(v12 - 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & v11;
  v29 = v12;
  v30 = (unint64_t)(v14 + 63) >> 6;
  v31 = result + 64;
  if ((v15 & v11) == 0)
    goto LABEL_5;
LABEL_4:
  v17 = __clz(__rbit64(v16));
  v16 &= v16 - 1;
  for (i = v17 | (v10 << 6); ; i = __clz(__rbit64(v20)) + (v10 << 6))
  {
    v22 = (uint64_t *)(*(_QWORD *)(v36 + 48) + 16 * i);
    v23 = *v22;
    v24 = v22[1];
    sub_100007918(*(_QWORD *)(v36 + 56) + 32 * i, (uint64_t)v35);
    v25 = swift_bridgeObjectRetain();
    v33(v35, v25);
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_release();
      sub_100005988(v35);
      return (uint64_t)v9;
    }
    sub_100005988(v35);
    *(_QWORD *)(v31 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v26 = (_QWORD *)(v9[6] + 16 * i);
    *v26 = v23;
    v26[1] = v24;
    result = sub_1002056CC((uint64_t)v7, v9[7] + *(_QWORD *)(v32 + 72) * i);
    v27 = v9[2];
    v19 = __OFADD__(v27, 1);
    v28 = v27 + 1;
    if (v19)
    {
      __break(1u);
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    v9[2] = v28;
    if (v16)
      goto LABEL_4;
LABEL_5:
    v19 = __OFADD__(v10++, 1);
    if (v19)
      goto LABEL_27;
    if (v10 >= v30)
      return (uint64_t)v9;
    v20 = *(_QWORD *)(v29 + 8 * v10);
    if (!v20)
      break;
LABEL_15:
    v16 = (v20 - 1) & v20;
  }
  v21 = v10 + 1;
  if (v10 + 1 >= v30)
    return (uint64_t)v9;
  v20 = *(_QWORD *)(v29 + 8 * v21);
  if (v20)
    goto LABEL_14;
  v21 = v10 + 2;
  if (v10 + 2 >= v30)
    return (uint64_t)v9;
  v20 = *(_QWORD *)(v29 + 8 * v21);
  if (v20)
    goto LABEL_14;
  v21 = v10 + 3;
  if (v10 + 3 >= v30)
    return (uint64_t)v9;
  v20 = *(_QWORD *)(v29 + 8 * v21);
  if (v20)
  {
LABEL_14:
    v10 = v21;
    goto LABEL_15;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v30)
      return (uint64_t)v9;
    v20 = *(_QWORD *)(v29 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_15;
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_10020C3D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  Swift::UInt v16;
  Swift::UInt v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __n128 v38;
  uint64_t v39;
  int64_t v40;
  uint64_t v41;
  int64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int64_t v46;
  _OWORD v47[4];
  uint64_t v48;

  v4 = type metadata accessor for PropertyListNode(0);
  v43 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v45 = (uint64_t)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000055B0(&qword_1002B6AD8);
  __chkstk_darwin(v6);
  v8 = (uint64_t *)((char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v9);
  v11 = (uint64_t *)((char *)&v39 - v10);
  v12 = *(_QWORD *)(a2 + 64);
  v41 = a2 + 64;
  v13 = 1 << *(_BYTE *)(a2 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & v12;
  v42 = (unint64_t)(v13 + 63) >> 6;
  v40 = v42 - 1;
  v44 = a2;
  swift_bridgeObjectRetain();
  v16 = 0;
  v46 = 0;
  if (!v15)
    goto LABEL_6;
LABEL_4:
  v17 = v16;
  v18 = __clz(__rbit64(v15));
  v15 &= v15 - 1;
  v19 = v18 | (v46 << 6);
LABEL_5:
  v20 = (uint64_t *)(*(_QWORD *)(v44 + 48) + 16 * v19);
  v22 = *v20;
  v21 = v20[1];
  v23 = *(_QWORD *)(v44 + 56) + *(_QWORD *)(v43 + 72) * v19;
  v24 = sub_1000055B0(&qword_1002B67F0);
  sub_100205DA0(v23, (uint64_t)v8 + *(int *)(v24 + 48));
  *v8 = v22;
  v8[1] = v21;
  _s13EnsembleAgent26PasteboardAcquisitionErrorOwst_0((uint64_t)v8, 0, 1, v24);
  swift_bridgeObjectRetain();
  v16 = v17;
  while (1)
  {
    sub_1001AABD4((uint64_t)v8, (uint64_t)v11, &qword_1002B6AD8);
    v30 = sub_1000055B0(&qword_1002B67F0);
    if (_s13EnsembleAgent26PasteboardAcquisitionErrorOwet_0((uint64_t)v11, 1, v30) == 1)
    {
      swift_release();
      Hasher._combine(_:)(v16);
      return;
    }
    v31 = (uint64_t)v11 + *(int *)(v30 + 48);
    v32 = *v11;
    v33 = v11[1];
    v34 = v45;
    sub_1002056CC(v31, v45);
    v35 = *(_QWORD *)(a1 + 64);
    v36 = *(_OWORD *)(a1 + 16);
    v47[0] = *(_OWORD *)a1;
    v47[1] = v36;
    v37 = *(_OWORD *)(a1 + 48);
    v47[2] = *(_OWORD *)(a1 + 32);
    v47[3] = v37;
    v48 = v35;
    String.hash(into:)(v47, v32, v33);
    v38 = swift_bridgeObjectRelease();
    PropertyListNode.hash(into:)(v47, v38);
    sub_100205710(v34);
    v16 ^= Hasher._finalize()();
    if (v15)
      goto LABEL_4;
LABEL_6:
    v25 = v46 + 1;
    if (__OFADD__(v46, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v25 < v42)
    {
      v26 = *(_QWORD *)(v41 + 8 * v25);
      if (v26)
        goto LABEL_9;
      v27 = v46 + 2;
      ++v46;
      if (v25 + 1 < v42)
      {
        v26 = *(_QWORD *)(v41 + 8 * v27);
        if (v26)
        {
          ++v25;
LABEL_9:
          v17 = v16;
          v15 = (v26 - 1) & v26;
          v19 = __clz(__rbit64(v26)) + (v25 << 6);
          v46 = v25;
          goto LABEL_5;
        }
        v28 = v25 + 2;
        v46 = v25 + 1;
        if (v25 + 2 < v42)
          break;
      }
    }
LABEL_21:
    v29 = sub_1000055B0(&qword_1002B67F0);
    _s13EnsembleAgent26PasteboardAcquisitionErrorOwst_0((uint64_t)v8, 1, 1, v29);
    v15 = 0;
  }
  v26 = *(_QWORD *)(v41 + 8 * v28);
  if (v26)
  {
    v25 += 2;
    goto LABEL_9;
  }
  while (1)
  {
    v25 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v25 >= v42)
    {
      v46 = v40;
      goto LABEL_21;
    }
    v26 = *(_QWORD *)(v41 + 8 * v25);
    ++v28;
    if (v26)
      goto LABEL_9;
  }
LABEL_27:
  __break(1u);
}

void sub_10020C73C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  Swift::UInt v12;
  unint64_t v13;
  char *v14;
  _QWORD v15[4];

  v3 = type metadata accessor for Date(0);
  v15[2] = *(_QWORD *)(v3 - 8);
  v15[3] = v3;
  __chkstk_darwin(v3);
  v15[1] = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for PropertyListNode(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v11 = (char *)v15 - v10;
  v12 = *(_QWORD *)(a2 + 16);
  Hasher._combine(_:)(v12);
  if (v12)
  {
    v13 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    v15[0] = v5;
    sub_100205DA0(a2 + v13, (uint64_t)v11);
    sub_100205DA0((uint64_t)v11, (uint64_t)v8);
    v14 = (char *)&loc_10020C860 + 4 * byte_100230FF0[swift_getEnumCaseMultiPayload(v8, v5)];
    __asm { BR              X9 }
  }
}

unint64_t sub_10020CA10()
{
  unint64_t result;

  result = qword_1002B6850;
  if (!qword_1002B6850)
  {
    result = swift_getWitnessTable(&unk_100231C50, &type metadata for PropertyListNode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6850);
  }
  return result;
}

unint64_t sub_10020CA4C()
{
  unint64_t result;

  result = qword_1002B6858;
  if (!qword_1002B6858)
  {
    result = swift_getWitnessTable(&unk_100231C00, &type metadata for PropertyListNode.DictionaryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6858);
  }
  return result;
}

unint64_t sub_10020CA88()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1002B6868;
  if (!qword_1002B6868)
  {
    v1 = sub_10000DCA0(&qword_1002B6860);
    sub_10000E330(&qword_1002B6870, type metadata accessor for PropertyListNode, (uint64_t)&protocol conformance descriptor for PropertyListNode);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> [A : B], v1);
    atomic_store(result, (unint64_t *)&qword_1002B6868);
  }
  return result;
}

unint64_t sub_10020CB0C()
{
  unint64_t result;

  result = qword_1002B6878;
  if (!qword_1002B6878)
  {
    result = swift_getWitnessTable(&unk_100231BB0, &type metadata for PropertyListNode.ArrayCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6878);
  }
  return result;
}

unint64_t sub_10020CB48()
{
  unint64_t result;

  result = qword_1002B6890;
  if (!qword_1002B6890)
  {
    result = swift_getWitnessTable(&unk_100231B60, &type metadata for PropertyListNode.DoubleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6890);
  }
  return result;
}

unint64_t sub_10020CB84()
{
  unint64_t result;

  result = qword_1002B6898;
  if (!qword_1002B6898)
  {
    result = swift_getWitnessTable(&unk_100231B10, &type metadata for PropertyListNode.IntegerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6898);
  }
  return result;
}

unint64_t sub_10020CBC0()
{
  unint64_t result;

  result = qword_1002B68A0;
  if (!qword_1002B68A0)
  {
    result = swift_getWitnessTable(&unk_100231AC0, &type metadata for PropertyListNode.BoolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B68A0);
  }
  return result;
}

unint64_t sub_10020CBFC()
{
  unint64_t result;

  result = qword_1002B68A8;
  if (!qword_1002B68A8)
  {
    result = swift_getWitnessTable(&unk_100231A70, &type metadata for PropertyListNode.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B68A8);
  }
  return result;
}

unint64_t sub_10020CC38()
{
  unint64_t result;

  result = qword_1002B68B0;
  if (!qword_1002B68B0)
  {
    result = swift_getWitnessTable(&unk_100231A20, &type metadata for PropertyListNode.DateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B68B0);
  }
  return result;
}

unint64_t sub_10020CC74()
{
  unint64_t result;

  result = qword_1002B68C0;
  if (!qword_1002B68C0)
  {
    result = swift_getWitnessTable(&unk_1002319D0, &type metadata for PropertyListNode.DataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B68C0);
  }
  return result;
}

unint64_t sub_10020CCB0()
{
  unint64_t result;

  result = qword_1002B68C8;
  if (!qword_1002B68C8)
  {
    result = swift_getWitnessTable(&unk_100231980, &type metadata for PropertyListNode.InitialCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B68C8);
  }
  return result;
}

unint64_t sub_10020CCEC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1002B6920;
  if (!qword_1002B6920)
  {
    v1 = sub_10000DCA0(&qword_1002B6860);
    sub_10000E330(&qword_1002B6928, type metadata accessor for PropertyListNode, (uint64_t)&protocol conformance descriptor for PropertyListNode);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> [A : B], v1);
    atomic_store(result, (unint64_t *)&qword_1002B6920);
  }
  return result;
}

uint64_t sub_10020CD70(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v9 = sub_10000DCA0(&qword_1002B6880);
    sub_10000E330(a2, type metadata accessor for PropertyListNode, a3);
    result = swift_getWitnessTable(a4, v9);
    atomic_store(result, a1);
  }
  return result;
}

void sub_10020CDF4()
{
  sub_10000E330(&qword_1002B6940, type metadata accessor for PropertyListNode, (uint64_t)&protocol conformance descriptor for PropertyListNode);
}

uint64_t sub_10020CE24(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (!a3)
    return swift_bridgeObjectRetain(a2);
  return result;
}

uint64_t destroy for ContainerSubscript(uint64_t a1)
{
  return sub_10020CE48(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_10020CE48(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (!a3)
    return swift_bridgeObjectRelease(a2);
  return result;
}

void _s8HIDUtils18ContainerSubscriptOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_10020CE24(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_10000B350();
}

uint64_t assignWithCopy for ContainerSubscript(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_10020CE24(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_10020CE48(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for ContainerSubscript(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_10020CE48(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContainerSubscript(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ContainerSubscript(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_10020CFB8(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_10020CFD0(uint64_t result, unsigned int a2)
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

ValueMetadata *type metadata accessor for ContainerSubscript()
{
  return &type metadata for ContainerSubscript;
}

uint64_t *initializeBufferWithCopyOfBuffer for PropertyListNode(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  unint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload(a2, a3))
    {
      case 0u:
        v9 = *a2;
        v8 = a2[1];
        sub_10002517C(v9, v8);
        *a1 = v9;
        a1[1] = v8;
        v10 = a1;
        v11 = a3;
        v12 = 0;
        goto LABEL_10;
      case 1u:
        v14 = type metadata accessor for Date(0);
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(a1, a2, v14);
        v10 = a1;
        v11 = a3;
        v12 = 1;
        goto LABEL_10;
      case 2u:
        v15 = a2[1];
        *a1 = *a2;
        a1[1] = v15;
        swift_bridgeObjectRetain();
        v10 = a1;
        v11 = a3;
        v12 = 2;
        goto LABEL_10;
      case 6u:
        *a1 = *a2;
        swift_retain();
        v10 = a1;
        v11 = a3;
        v12 = 6;
        goto LABEL_10;
      case 7u:
        *a1 = *a2;
        swift_retain();
        v10 = a1;
        v11 = a3;
        v12 = 7;
LABEL_10:
        swift_storeEnumTagMultiPayload(v10, v11, v12);
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        break;
    }
  }
  return a1;
}

double destroy for PropertyListNode(uint64_t a1, uint64_t a2)
{
  double result;
  uint64_t v4;

  switch(swift_getEnumCaseMultiPayload(a1, a2))
  {
    case 0u:
      sub_100022AEC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
      break;
    case 1u:
      v4 = type metadata accessor for Date(0);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
      break;
    case 2u:
      *(_QWORD *)&result = swift_bridgeObjectRelease().n128_u64[0];
      break;
    case 6u:
    case 7u:
      swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t *initializeWithCopy for PropertyListNode(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  switch(swift_getEnumCaseMultiPayload(a2, a3))
  {
    case 0u:
      v7 = *a2;
      v6 = a2[1];
      sub_10002517C(v7, v6);
      *a1 = v7;
      a1[1] = v6;
      v8 = a1;
      v9 = a3;
      v10 = 0;
      goto LABEL_8;
    case 1u:
      v11 = type metadata accessor for Date(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
      v8 = a1;
      v9 = a3;
      v10 = 1;
      goto LABEL_8;
    case 2u:
      v12 = a2[1];
      *a1 = *a2;
      a1[1] = v12;
      swift_bridgeObjectRetain();
      v8 = a1;
      v9 = a3;
      v10 = 2;
      goto LABEL_8;
    case 6u:
      *a1 = *a2;
      swift_retain();
      v8 = a1;
      v9 = a3;
      v10 = 6;
      goto LABEL_8;
    case 7u:
      *a1 = *a2;
      swift_retain();
      v8 = a1;
      v9 = a3;
      v10 = 7;
LABEL_8:
      swift_storeEnumTagMultiPayload(v8, v9, v10);
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

uint64_t *assignWithCopy for PropertyListNode(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a1 != a2)
  {
    sub_100205710((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload(a2, a3))
    {
      case 0u:
        v7 = *a2;
        v6 = a2[1];
        sub_10002517C(v7, v6);
        *a1 = v7;
        a1[1] = v6;
        v8 = a1;
        v9 = a3;
        v10 = 0;
        goto LABEL_9;
      case 1u:
        v11 = type metadata accessor for Date(0);
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
        v8 = a1;
        v9 = a3;
        v10 = 1;
        goto LABEL_9;
      case 2u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        v8 = a1;
        v9 = a3;
        v10 = 2;
        goto LABEL_9;
      case 6u:
        *a1 = *a2;
        swift_retain();
        v8 = a1;
        v9 = a3;
        v10 = 6;
        goto LABEL_9;
      case 7u:
        *a1 = *a2;
        swift_retain();
        v8 = a1;
        v9 = a3;
        v10 = 7;
LABEL_9:
        swift_storeEnumTagMultiPayload(v8, v9, v10);
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

void *initializeWithTake for PropertyListNode(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
  {
    v6 = type metadata accessor for Date(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload(a1, a3, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for PropertyListNode(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_100205710((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      v6 = type metadata accessor for Date(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload(a1, a3, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10020D558(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[8];

  v4[0] = &unk_100231168;
  result = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    v4[2] = &unk_100231180;
    v4[3] = &unk_100231198;
    v4[4] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[5] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[6] = &unk_1002311B0;
    v4[7] = &unk_1002311B0;
    swift_initEnumMetadataMultiPayload(a1, 256, 8, v4);
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for PropertyListNode.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10020D644 + 4 * byte_10023101E[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_10020D678 + 4 * byte_100231019[v4]))();
}

uint64_t sub_10020D678(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10020D680(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10020D688);
  return result;
}

uint64_t sub_10020D694(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10020D69CLL);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_10020D6A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10020D6A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PropertyListNode.CodingKeys()
{
  return &type metadata for PropertyListNode.CodingKeys;
}

ValueMetadata *type metadata accessor for PropertyListNode.InitialCodingKeys()
{
  return &type metadata for PropertyListNode.InitialCodingKeys;
}

ValueMetadata *type metadata accessor for PropertyListNode.DataCodingKeys()
{
  return &type metadata for PropertyListNode.DataCodingKeys;
}

ValueMetadata *type metadata accessor for PropertyListNode.DateCodingKeys()
{
  return &type metadata for PropertyListNode.DateCodingKeys;
}

ValueMetadata *type metadata accessor for PropertyListNode.StringCodingKeys()
{
  return &type metadata for PropertyListNode.StringCodingKeys;
}

ValueMetadata *type metadata accessor for PropertyListNode.BoolCodingKeys()
{
  return &type metadata for PropertyListNode.BoolCodingKeys;
}

ValueMetadata *type metadata accessor for PropertyListNode.IntegerCodingKeys()
{
  return &type metadata for PropertyListNode.IntegerCodingKeys;
}

ValueMetadata *type metadata accessor for PropertyListNode.DoubleCodingKeys()
{
  return &type metadata for PropertyListNode.DoubleCodingKeys;
}

ValueMetadata *type metadata accessor for PropertyListNode.ArrayCodingKeys()
{
  return &type metadata for PropertyListNode.ArrayCodingKeys;
}

uint64_t _s8HIDUtils16PropertyListNodeO14DataCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_10020D788 + 4 * byte_100231023[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_10020D7A8 + 4 * byte_100231028[v4]))();
}

_BYTE *sub_10020D788(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_10020D7A8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10020D7B0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10020D7B8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10020D7C0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10020D7C8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for PropertyListNode.DictionaryCodingKeys()
{
  return &type metadata for PropertyListNode.DictionaryCodingKeys;
}

unint64_t sub_10020D7E8()
{
  unint64_t result;

  result = qword_1002B69F0;
  if (!qword_1002B69F0)
  {
    result = swift_getWitnessTable(&unk_100231348, &type metadata for PropertyListNode.DictionaryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B69F0);
  }
  return result;
}

unint64_t sub_10020D828()
{
  unint64_t result;

  result = qword_1002B69F8;
  if (!qword_1002B69F8)
  {
    result = swift_getWitnessTable(&unk_100231400, &type metadata for PropertyListNode.ArrayCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B69F8);
  }
  return result;
}

unint64_t sub_10020D868()
{
  unint64_t result;

  result = qword_1002B6A00;
  if (!qword_1002B6A00)
  {
    result = swift_getWitnessTable(&unk_1002314B8, &type metadata for PropertyListNode.DoubleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6A00);
  }
  return result;
}

unint64_t sub_10020D8A8()
{
  unint64_t result;

  result = qword_1002B6A08;
  if (!qword_1002B6A08)
  {
    result = swift_getWitnessTable(&unk_100231570, &type metadata for PropertyListNode.IntegerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6A08);
  }
  return result;
}

unint64_t sub_10020D8E8()
{
  unint64_t result;

  result = qword_1002B6A10;
  if (!qword_1002B6A10)
  {
    result = swift_getWitnessTable(&unk_100231628, &type metadata for PropertyListNode.BoolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6A10);
  }
  return result;
}

unint64_t sub_10020D928()
{
  unint64_t result;

  result = qword_1002B6A18;
  if (!qword_1002B6A18)
  {
    result = swift_getWitnessTable(&unk_1002316E0, &type metadata for PropertyListNode.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6A18);
  }
  return result;
}

unint64_t sub_10020D968()
{
  unint64_t result;

  result = qword_1002B6A20;
  if (!qword_1002B6A20)
  {
    result = swift_getWitnessTable(&unk_100231798, &type metadata for PropertyListNode.DateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6A20);
  }
  return result;
}

unint64_t sub_10020D9A8()
{
  unint64_t result;

  result = qword_1002B6A28;
  if (!qword_1002B6A28)
  {
    result = swift_getWitnessTable(&unk_100231850, &type metadata for PropertyListNode.DataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6A28);
  }
  return result;
}

unint64_t sub_10020D9E8()
{
  unint64_t result;

  result = qword_1002B6A30;
  if (!qword_1002B6A30)
  {
    result = swift_getWitnessTable(&unk_100231958, &type metadata for PropertyListNode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6A30);
  }
  return result;
}

unint64_t sub_10020DA28()
{
  unint64_t result;

  result = qword_1002B6A38;
  if (!qword_1002B6A38)
  {
    result = swift_getWitnessTable(&unk_100231878, &type metadata for PropertyListNode.InitialCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6A38);
  }
  return result;
}

unint64_t sub_10020DA68()
{
  unint64_t result;

  result = qword_1002B6A40;
  if (!qword_1002B6A40)
  {
    result = swift_getWitnessTable(&unk_1002318A0, &type metadata for PropertyListNode.InitialCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6A40);
  }
  return result;
}

unint64_t sub_10020DAA8()
{
  unint64_t result;

  result = qword_1002B6A48;
  if (!qword_1002B6A48)
  {
    result = swift_getWitnessTable(&unk_1002317C0, &type metadata for PropertyListNode.DataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6A48);
  }
  return result;
}

unint64_t sub_10020DAE8()
{
  unint64_t result;

  result = qword_1002B6A50;
  if (!qword_1002B6A50)
  {
    result = swift_getWitnessTable(&unk_1002317E8, &type metadata for PropertyListNode.DataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6A50);
  }
  return result;
}

unint64_t sub_10020DB28()
{
  unint64_t result;

  result = qword_1002B6A58;
  if (!qword_1002B6A58)
  {
    result = swift_getWitnessTable(&unk_100231708, &type metadata for PropertyListNode.DateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6A58);
  }
  return result;
}

unint64_t sub_10020DB68()
{
  unint64_t result;

  result = qword_1002B6A60;
  if (!qword_1002B6A60)
  {
    result = swift_getWitnessTable(&unk_100231730, &type metadata for PropertyListNode.DateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6A60);
  }
  return result;
}

unint64_t sub_10020DBA8()
{
  unint64_t result;

  result = qword_1002B6A68;
  if (!qword_1002B6A68)
  {
    result = swift_getWitnessTable(&unk_100231650, &type metadata for PropertyListNode.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6A68);
  }
  return result;
}

unint64_t sub_10020DBE8()
{
  unint64_t result;

  result = qword_1002B6A70;
  if (!qword_1002B6A70)
  {
    result = swift_getWitnessTable(&unk_100231678, &type metadata for PropertyListNode.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6A70);
  }
  return result;
}

unint64_t sub_10020DC28()
{
  unint64_t result;

  result = qword_1002B6A78;
  if (!qword_1002B6A78)
  {
    result = swift_getWitnessTable(&unk_100231598, &type metadata for PropertyListNode.BoolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6A78);
  }
  return result;
}

unint64_t sub_10020DC68()
{
  unint64_t result;

  result = qword_1002B6A80;
  if (!qword_1002B6A80)
  {
    result = swift_getWitnessTable(&unk_1002315C0, &type metadata for PropertyListNode.BoolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6A80);
  }
  return result;
}

unint64_t sub_10020DCA8()
{
  unint64_t result;

  result = qword_1002B6A88;
  if (!qword_1002B6A88)
  {
    result = swift_getWitnessTable(&unk_1002314E0, &type metadata for PropertyListNode.IntegerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6A88);
  }
  return result;
}

unint64_t sub_10020DCE8()
{
  unint64_t result;

  result = qword_1002B6A90;
  if (!qword_1002B6A90)
  {
    result = swift_getWitnessTable(&unk_100231508, &type metadata for PropertyListNode.IntegerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6A90);
  }
  return result;
}

unint64_t sub_10020DD28()
{
  unint64_t result;

  result = qword_1002B6A98;
  if (!qword_1002B6A98)
  {
    result = swift_getWitnessTable(&unk_100231428, &type metadata for PropertyListNode.DoubleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6A98);
  }
  return result;
}

unint64_t sub_10020DD68()
{
  unint64_t result;

  result = qword_1002B6AA0;
  if (!qword_1002B6AA0)
  {
    result = swift_getWitnessTable(&unk_100231450, &type metadata for PropertyListNode.DoubleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6AA0);
  }
  return result;
}

unint64_t sub_10020DDA8()
{
  unint64_t result;

  result = qword_1002B6AA8;
  if (!qword_1002B6AA8)
  {
    result = swift_getWitnessTable(&unk_100231370, &type metadata for PropertyListNode.ArrayCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6AA8);
  }
  return result;
}

unint64_t sub_10020DDE8()
{
  unint64_t result;

  result = qword_1002B6AB0;
  if (!qword_1002B6AB0)
  {
    result = swift_getWitnessTable(&unk_100231398, &type metadata for PropertyListNode.ArrayCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6AB0);
  }
  return result;
}

unint64_t sub_10020DE28()
{
  unint64_t result;

  result = qword_1002B6AB8;
  if (!qword_1002B6AB8)
  {
    result = swift_getWitnessTable(&unk_1002312B8, &type metadata for PropertyListNode.DictionaryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6AB8);
  }
  return result;
}

unint64_t sub_10020DE68()
{
  unint64_t result;

  result = qword_1002B6AC0;
  if (!qword_1002B6AC0)
  {
    result = swift_getWitnessTable(&unk_1002312E0, &type metadata for PropertyListNode.DictionaryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6AC0);
  }
  return result;
}

unint64_t sub_10020DEA8()
{
  unint64_t result;

  result = qword_1002B6AC8;
  if (!qword_1002B6AC8)
  {
    result = swift_getWitnessTable(&unk_1002318C8, &type metadata for PropertyListNode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6AC8);
  }
  return result;
}

unint64_t sub_10020DEE8()
{
  unint64_t result;

  result = qword_1002B6AD0;
  if (!qword_1002B6AD0)
  {
    result = swift_getWitnessTable(&unk_1002318F0, &type metadata for PropertyListNode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6AD0);
  }
  return result;
}

uint64_t sub_10020DF24()
{
  return sub_10020E1E0();
}

uint64_t sub_10020DF4C@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  return sub_100205DA0(v2, (uint64_t)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0));
}

uint64_t sub_10020DF6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)(a1, a2, *(_QWORD *)(v2 - 136), a1);
}

uint64_t sub_10020DF84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 256) + 8))(v2, v1);
}

uint64_t sub_10020DF98()
{
  return type metadata accessor for PropertyListNode(0);
}

uint64_t sub_10020DFA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10)
{
  return _assertionFailure(_:_:file:line:flags:)(a1, a2, a3, a4, a5, a6, 31, 2, a9, a10);
}

uint64_t sub_10020DFAC()
{
  uint64_t v0;
  uint64_t v1;

  return swift_getEnumCaseMultiPayload(v1, v0);
}

uint64_t sub_10020DFB8@<X0>(uint64_t (*a1)(_QWORD, _QWORD)@<X8>)
{
  uint64_t v1;

  return a1(*(_QWORD *)(v1 - 120), *(_QWORD *)(v1 - 136));
}

uint64_t sub_10020DFC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)(a1, a2, *(_QWORD *)(v2 - 128), a1);
}

uint64_t sub_10020DFD8()
{
  uint64_t v0;
  uint64_t v1;

  return swift_getEnumCaseMultiPayload(v0, v1);
}

uint64_t sub_10020DFE4()
{
  uint64_t v0;

  return sub_100205710(v0);
}

uint64_t sub_10020DFF8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

uint64_t sub_10020E008(uint64_t a1)
{
  uint64_t v1;

  return sub_100205DA0(a1, v1);
}

void sub_10020E010()
{
  __break(1u);
}

uint64_t sub_10020E01C@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return swift_dynamicCast(v2 - 128, v2 - 112, a2 + 8, a1, 7);
}

uint64_t sub_10020E064()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_10020E070(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_dynamicCast(a1, a2, a3, a4, 7);
}

uint64_t sub_10020E08C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)(a1, a2, *(_QWORD *)(v2 - 128), a1);
}

uint64_t sub_10020E0A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)(a1, a2, a3, a4, a5);
}

uint64_t sub_10020E0CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)(a1, a2, *(_QWORD *)(v2 - 128), a1);
}

_QWORD *sub_10020E0E0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)(v1 - 400);
  *v2 = v0;
  return v2;
}

uint64_t sub_10020E0FC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  *v1 = v2;
  return swift_storeEnumTagMultiPayload(v1, v0, 7);
}

void sub_10020E110()
{
  uint64_t v0;
  uint64_t v1;

  sub_10020BEF0(v0, v1);
}

void sub_10020E124(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 240) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_10020E140()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(v0 - 88);
  v2 = sub_10000DBE4((_QWORD *)(v0 - 112), v1);
  return swift_getDynamicType(v2, v1, 1);
}

uint64_t sub_10020E17C(uint64_t a1)
{
  uint64_t v1;

  return sub_100205DA0(a1, v1);
}

uint64_t sub_10020E184()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(*(_QWORD *)(*(_QWORD *)v0 + 16));
}

uint64_t sub_10020E194()
{
  uint64_t v0;

  return sub_100205710(v0);
}

uint64_t sub_10020E19C()
{
  uint64_t v0;
  uint64_t v1;

  return swift_storeEnumTagMultiPayload(v1, v0, 8);
}

uint64_t sub_10020E1AC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 112) = v0;
  return swift_unknownObjectRetain(v0);
}

id sub_10020E1BC@<X0>(char a1@<W8>)
{
  void *v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 112) = 0;
  *(_BYTE *)(v2 - 104) = a1;
  return v1;
}

uint64_t sub_10020E1E0()
{
  return sub_100208E88();
}

void sub_10020E1EC()
{
  Hasher._combine(_:)(0);
}

uint64_t sub_10020E1F4(uint64_t a1)
{
  uint64_t v1;

  return sub_100205DA0(a1, v1);
}

uint64_t sub_10020E224()
{
  uint64_t v0;
  uint64_t v1;

  return sub_100007918(v0, v1 - 112);
}

uint64_t sub_10020E230()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_10020E23C(uint64_t a1)
{
  uint64_t v1;

  return String.init<A>(describing:)(v1 - 136, a1);
}

uint64_t sub_10020E248()
{
  uint64_t v0;

  return v0;
}

void HIDServicePropertyKey.rawValue.getter(uint64_t a1, uint64_t a2)
{
  sub_10020EF18(a1, a2);
  sub_100026B88();
  sub_1000050D4();
}

HIDUtils::HIDServicePropertyKey_optional __swiftcall HIDServicePropertyKey.init(stringValue:)(Swift::String stringValue)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  void *v4;
  HIDUtils::HIDServicePropertyKey_optional result;

  static HIDServicePropertyKey.allCases.getter();
  v1 = sub_100026B88();
  v2 = sub_1001FF7BC(v1);
  swift_bridgeObjectRelease();
  if ((v2 & 1) == 0)
    swift_bridgeObjectRelease();
  v3 = sub_100026B88();
  result.value.rawValue._object = v4;
  result.value.rawValue._countAndFlagsBits = v3;
  return result;
}

uint64_t static HIDServicePropertyKey.allCases.getter()
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
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
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v0 = sub_1000055B0(&qword_1002B6AF8);
  v1 = swift_allocObject(v0, 752, 7);
  *(_OWORD *)(v1 + 16) = xmmword_100231CA0;
  *(_QWORD *)(v1 + 32) = 0x656369767265535FLL;
  *(_QWORD *)(v1 + 40) = 0xEA00000000004449;
  strcpy((char *)(v1 + 48), "HIDAccelCurves");
  *(_BYTE *)(v1 + 63) = -18;
  sub_10020EF38();
  *(_QWORD *)(v2 + 64) = v3;
  *(_QWORD *)(v2 + 72) = v4;
  strcpy((char *)(v2 + 80), "Authenticated");
  *(_WORD *)(v2 + 94) = -4864;
  *(_QWORD *)(v2 + 96) = 0x6E492D746C697542;
  *(_QWORD *)(v2 + 104) = 0xE800000000000000;
  strcpy((char *)(v2 + 112), "CapsLockDelay");
  *(_WORD *)(v2 + 126) = -4864;
  sub_10020EF0C();
  *(_QWORD *)(v5 + 128) = v6;
  *(_QWORD *)(v5 + 136) = v7;
  strcpy((char *)(v5 + 144), "DeviceTypeHint");
  *(_BYTE *)(v5 + 159) = -18;
  sub_10020EF38();
  *(_QWORD *)(v8 + 160) = v10;
  *(_QWORD *)(v8 + 168) = v9;
  sub_10020EF38();
  *(_QWORD *)(v11 + 176) = v13;
  *(_QWORD *)(v11 + 184) = v12;
  sub_10020EF00();
  *(_QWORD *)(v14 + 192) = v15;
  *(_QWORD *)(v14 + 200) = v16;
  *(_QWORD *)(v14 + 208) = 0x437972746E756F43;
  *(_QWORD *)(v14 + 216) = 0xEB0000000065646FLL;
  *(_QWORD *)(v14 + 224) = v17;
  *(_QWORD *)(v14 + 232) = 0x800000010025AA90;
  strcpy((char *)(v14 + 240), "StandardType");
  *(_BYTE *)(v14 + 253) = 0;
  *(_WORD *)(v14 + 254) = -5120;
  strcpy((char *)(v14 + 256), "Manufacturer");
  *(_BYTE *)(v14 + 269) = 0;
  *(_WORD *)(v14 + 270) = -5120;
  sub_10020EF38();
  *(_QWORD *)(v18 + 272) = v20;
  *(_QWORD *)(v18 + 280) = v19;
  sub_10020EF00();
  *(_QWORD *)(v21 + 288) = v22;
  *(_QWORD *)(v21 + 296) = v23;
  sub_10020EF00();
  *(_QWORD *)(v24 + 304) = v26;
  *(_QWORD *)(v24 + 312) = v25;
  sub_10020EF00();
  v27[40] = v29;
  v27[41] = v28;
  v27[42] = v30 | 1;
  v27[43] = 0x800000010025AB60;
  sub_10020EF00();
  *(_QWORD *)(v31 + 352) = v32;
  *(_QWORD *)(v31 + 360) = v33;
  sub_10020EF00();
  *(_QWORD *)(v34 + 368) = v35;
  *(_QWORD *)(v34 + 376) = v36;
  sub_10020EF00();
  *(_QWORD *)(v37 + 384) = v38;
  *(_QWORD *)(v37 + 392) = v39;
  strcpy((char *)(v37 + 400), "PrimaryUsage");
  *(_BYTE *)(v37 + 413) = 0;
  *(_WORD *)(v37 + 414) = -5120;
  *(_QWORD *)(v37 + 416) = v40;
  *(_QWORD *)(v37 + 424) = 0x8000000100258B50;
  *(_QWORD *)(v37 + 432) = 0x746375646F7250;
  *(_QWORD *)(v37 + 440) = 0xE700000000000000;
  *(_QWORD *)(v37 + 448) = 0x49746375646F7250;
  *(_QWORD *)(v37 + 456) = 0xE900000000000044;
  *(_QWORD *)(v37 + 464) = v40;
  *(_QWORD *)(v37 + 472) = 0x800000010025AC40;
  strcpy((char *)(v37 + 480), "ReportInterval");
  *(_BYTE *)(v37 + 495) = -18;
  *(_QWORD *)(v37 + 496) = v41;
  *(_QWORD *)(v37 + 504) = 0x800000010025AC60;
  *(_QWORD *)(v37 + 512) = v42;
  *(_QWORD *)(v37 + 520) = 0x800000010025AC80;
  sub_10020EF0C();
  v43[66] = v44;
  v43[67] = v45;
  v43[68] = v46;
  v43[69] = 0x800000010025ACA0;
  v43[70] = v46 - 1;
  sub_10020EF0C();
  *(_QWORD *)(v47 + 568) = v48;
  *(_QWORD *)(v47 + 576) = v49;
  sub_10020EF0C();
  v50[73] = v51;
  v50[75] = 0x800000010025AD60;
  v50[76] = v52 + 4;
  v50[74] = v52 - 3;
  v50[77] = 0x800000010025AD00;
  v50[78] = v52 - 3;
  v50[79] = 0x800000010025AD80;
  v50[80] = 0x726F70736E617254;
  v50[81] = v53 | 0x30;
  v50[82] = v52 | 3;
  sub_10020EF0C();
  *(_QWORD *)(v54 + 664) = v55;
  *(_QWORD *)(v54 + 672) = v56;
  sub_10020EF0C();
  v57[85] = v58;
  v57[86] = v59;
  v57[87] = 0x800000010025A9D0;
  v57[88] = v60;
  v57[89] = 0x800000010025A9B0;
  if (qword_1002B64D0 != -1)
    swift_once(&qword_1002B64D0, sub_10020EC58);
  v61 = unk_1002B6AF0;
  *(_QWORD *)(v1 + 720) = qword_1002B6AE8;
  *(_QWORD *)(v1 + 728) = v61;
  *(_QWORD *)(v1 + 736) = 0x4449726F646E6556;
  *(_QWORD *)(v1 + 744) = 0xE800000000000000;
  swift_bridgeObjectRetain(v61);
  return v1;
}

uint64_t HIDServicePropertyKey.rawValue.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease(v2[1]);
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t static HIDServicePropertyKey._serviceID.getter()
{
  return 0x656369767265535FLL;
}

void static HIDServicePropertyKey.accelParametricCurves.getter()
{
  sub_10020EF30();
}

unint64_t static HIDServicePropertyKey.appleVendorSupported.getter()
{
  return sub_10020EEF8(20);
}

uint64_t static HIDServicePropertyKey.authenticatedDevice.getter()
{
  return 0x69746E6568747541;
}

uint64_t static HIDServicePropertyKey.builtIn.getter()
{
  return 0x6E492D746C697542;
}

uint64_t static HIDServicePropertyKey.capsLockDelay.getter()
{
  return 0x6B636F4C73706143;
}

unint64_t static HIDServicePropertyKey.capsLockLanguageSwitch.getter()
{
  return sub_10020EEF8(22);
}

void static HIDServicePropertyKey.deviceTypeHint.getter()
{
  sub_10020EF30();
}

unint64_t static HIDServicePropertyKey.deviceUsagePairs.getter()
{
  return sub_10020EEF8(16);
}

unint64_t static HIDServicePropertyKey.eventServiceProperties.getter()
{
  return sub_10020EEF8(25);
}

unint64_t static HIDServicePropertyKey.fnKeyboardUsageMap.getter()
{
  return sub_10020EEF8(18);
}

uint64_t static HIDServicePropertyKey.keyboardCountryCode.getter()
{
  return 0x437972746E756F43;
}

unint64_t static HIDServicePropertyKey.keyboardLanguage.getter()
{
  return sub_10020EEF8(16);
}

void static HIDServicePropertyKey.keyboardStandardType.getter()
{
  sub_10020EF28();
}

void static HIDServicePropertyKey.manufacturer.getter()
{
  sub_10020EF28();
}

unint64_t static HIDServicePropertyKey.mouseAcceleration.getter()
{
  return sub_10020EEF8(20);
}

unint64_t static HIDServicePropertyKey.mouseScrollAcceleration.getter()
{
  return sub_10020EEF8(26);
}

unint64_t static HIDServicePropertyKey.pointerAccelerationMultiplier.getter()
{
  return sub_10020EEF8(32);
}

unint64_t static HIDServicePropertyKey.pointerAccelerationSupport.getter()
{
  return sub_10020EEF8(30);
}

unint64_t static HIDServicePropertyKey.pointerAccelerationTable.getter()
{
  return sub_10020EEF8(27);
}

unint64_t static HIDServicePropertyKey.pointerAccelerationType.getter()
{
  return sub_10020EEF8(26);
}

unint64_t static HIDServicePropertyKey.pointerButtonCount.getter()
{
  return sub_10020EEF8(21);
}

unint64_t static HIDServicePropertyKey.pointerButtonMode.getter()
{
  return sub_10020EEF8(20);
}

unint64_t static HIDServicePropertyKey.pointerReportRate.getter()
{
  return sub_10020EEF8(20);
}

unint64_t static HIDServicePropertyKey.pointerResolution.getter()
{
  return sub_10020EEF8(20);
}

void static HIDServicePropertyKey.primaryUsage.getter()
{
  sub_10020EF28();
}

unint64_t static HIDServicePropertyKey.primaryUsagePage.getter()
{
  return sub_10020EEF8(16);
}

uint64_t static HIDServicePropertyKey.product.getter()
{
  return 0x746375646F7250;
}

uint64_t static HIDServicePropertyKey.productID.getter()
{
  return 0x49746375646F7250;
}

unint64_t static HIDServicePropertyKey.reportDescriptor.getter()
{
  return sub_10020EEF8(16);
}

void static HIDServicePropertyKey.reportInterval.getter()
{
  sub_10020EF30();
}

unint64_t static HIDServicePropertyKey.scrollAccelerationSupport.getter()
{
  return sub_10020EEF8(29);
}

unint64_t static HIDServicePropertyKey.scrollAccelerationTable.getter()
{
  return sub_10020EEF8(26);
}

unint64_t static HIDServicePropertyKey.scrollAccelerationType.getter()
{
  return sub_10020EEF8(25);
}

unint64_t static HIDServicePropertyKey.scrollAccelParametricCurves.getter()
{
  return sub_10020EEF8(20);
}

unint64_t static HIDServicePropertyKey.scrollReportRate.getter()
{
  return sub_10020EEF8(19);
}

unint64_t static HIDServicePropertyKey.scrollResolution.getter()
{
  return sub_10020EEF8(19);
}

unint64_t static HIDServicePropertyKey.subinterfaceID.getter()
{
  return sub_10020EEF8(17);
}

unint64_t static HIDServicePropertyKey.supportsGestureScrolling.getter()
{
  return sub_10020EEF8(24);
}

unint64_t static HIDServicePropertyKey.surfaceDimensions.getter()
{
  return sub_10020EEF8(17);
}

unint64_t static HIDServicePropertyKey.trackpadAcceleration.getter()
{
  return sub_10020EEF8(23);
}

unint64_t static HIDServicePropertyKey.trackpadScrollAcceleration.getter()
{
  return sub_10020EEF8(29);
}

uint64_t static HIDServicePropertyKey.transport.getter()
{
  return 0x726F70736E617254;
}

unint64_t static HIDServicePropertyKey.universalControlBuiltIn.getter()
{
  return sub_10020EEF8(23);
}

unint64_t static HIDServicePropertyKey.universalControlVirtualService.getter()
{
  return sub_10020EEF8(30);
}

uint64_t sub_10020EC58()
{
  uint64_t result;
  uint64_t v1;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(kHIDUserDevicePropertyCreateInactiveKey);
  qword_1002B6AE8 = result;
  unk_1002B6AF0 = v1;
  return result;
}

void static HIDServicePropertyKey.userDeviceCreateInactive.getter()
{
  if (qword_1002B64D0 != -1)
    swift_once(&qword_1002B64D0, sub_10020EC58);
  swift_bridgeObjectRetain();
  sub_1000050D4();
}

uint64_t static HIDServicePropertyKey.vendorID.getter()
{
  return 0x4449726F646E6556;
}

uint64_t sub_10020ECF4@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = CGSize.init(_:)(*a1);
  *a2 = result;
  a2[1] = v4;
  return result;
}

unint64_t sub_10020ED24()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1002B6B00;
  if (!qword_1002B6B00)
  {
    v1 = sub_10000DCA0(&qword_1002B6B08);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1002B6B00);
  }
  return result;
}

uint64_t sub_10020ED68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static HIDServicePropertyKey.allCases.getter();
  *a1 = result;
  return result;
}

unint64_t sub_10020ED90()
{
  unint64_t result;

  result = qword_1002B6B10;
  if (!qword_1002B6B10)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDServicePropertyKey, &type metadata for HIDServicePropertyKey);
    atomic_store(result, (unint64_t *)&qword_1002B6B10);
  }
  return result;
}

unint64_t sub_10020EDD0()
{
  unint64_t result;

  result = qword_1002B6B18;
  if (!qword_1002B6B18)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDServicePropertyKey, &type metadata for HIDServicePropertyKey);
    atomic_store(result, (unint64_t *)&qword_1002B6B18);
  }
  return result;
}

void sub_10020EE0C()
{
  uint64_t *v0;

  HIDServicePropertyKey.rawValue.getter(*v0, v0[1]);
}

uint64_t sub_10020EE14@<X0>(uint64_t a1@<X0>, HIDUtils::HIDServicePropertyKey_optional *a2@<X8>)
{
  uint64_t result;
  HIDUtils::HIDServicePropertyKey_optional v5;

  v5 = HIDServicePropertyKey.init(stringValue:)(*(Swift::String *)&a1);
  result = v5.value.rawValue._countAndFlagsBits;
  *a2 = v5;
  return result;
}

void sub_10020EE38(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

unint64_t sub_10020EE44()
{
  unint64_t result;

  result = qword_1002B6B20;
  if (!qword_1002B6B20)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDServicePropertyKey, &type metadata for HIDServicePropertyKey);
    atomic_store(result, (unint64_t *)&qword_1002B6B20);
  }
  return result;
}

uint64_t sub_10020EE80()
{
  _QWORD *v0;

  return sub_1001FF924(*v0, v0[1]);
}

uint64_t sub_10020EE88(uint64_t a1)
{
  _QWORD *v1;

  return sub_1001FF9A0(a1, *v1, v1[1]);
}

uint64_t sub_10020EE90(uint64_t a1)
{
  _QWORD *v1;

  return sub_1001FFA3C(a1, *v1, v1[1]);
}

uint64_t sub_10020EE98(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1002040D4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10020EEC0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1002040D4();
  return CodingKey.debugDescription.getter(a1, v2);
}

ValueMetadata *type metadata accessor for HIDServicePropertyKey()
{
  return &type metadata for HIDServicePropertyKey;
}

unint64_t sub_10020EEF8(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
}

uint64_t sub_10020EF18(uint64_t a1, uint64_t a2)
{
  return swift_bridgeObjectRetain(a2);
}

void HIDVirtualEventService.logDescription.getter()
{
  void *v0;
  id v1;
  __CFString *v2;

  v1 = v0;
  v2 = (__CFString *)CFCopyDescription(v1);

  if (v2)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v2);

  }
  else
  {
    __break(1u);
  }
}

id sub_10020EFA8()
{
  void *v0;

  return objc_msgSend(v0, "delegate");
}

uint64_t sub_10020EFD0(uint64_t a1)
{
  void *v1;

  objc_msgSend(v1, "setDelegate:", a1);
  return swift_unknownObjectRelease(a1);
}

uint64_t (*sub_10020F004(_QWORD *a1))(uint64_t *a1)
{
  void *v1;

  a1[1] = v1;
  *a1 = objc_msgSend(v1, "delegate");
  return sub_10020F04C;
}

uint64_t sub_10020F04C(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  objc_msgSend((id)a1[1], "setDelegate:", *a1);
  return swift_unknownObjectRelease(v1);
}

id sub_10020F084()
{
  void *v0;

  return objc_msgSend(v0, "serviceID");
}

uint64_t sub_10020F098(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  _QWORD v5[6];

  v5[4] = a1;
  v5[5] = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  v5[2] = sub_10000E610;
  v5[3] = &unk_100297D08;
  v3 = _Block_copy(v5);
  objc_msgSend(v2, "setCancelHandler:", v3, swift_retain().n128_f64[0]);
  _Block_release(v3);
  return swift_release();
}

id sub_10020F130(uint64_t a1)
{
  void *v1;

  return objc_msgSend(v1, "setDispatchQueue:", a1);
}

id sub_10020F148()
{
  void *v0;

  return objc_msgSend(v0, "activate");
}

id sub_10020F15C()
{
  void *v0;

  return objc_msgSend(v0, "cancel");
}

uint64_t dispatch thunk of HIDVirtualEventServiceProtocol.setCancelHandler(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of HIDVirtualEventServiceProtocol.setDispatchQueue(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of HIDVirtualEventServiceProtocol.activate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of HIDVirtualEventServiceProtocol.cancel()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of HIDVirtualEventServiceProtocol.dispatchEvent(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

id sub_10020F198(uint64_t a1)
{
  void *v1;

  return objc_msgSend(v1, "dispatchEvent:", a1);
}

uint64_t sub_10020F1BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10020F1CC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_10020F1E0()
{
  unsigned int *v0;

  sub_1001FF960(*v0);
}

void sub_10020F1E8(int a1)
{
  Swift::UInt32 *v1;

  sub_1001FF9DC(a1, *v1);
}

void sub_10020F1F0(uint64_t a1)
{
  unsigned int *v1;

  sub_1001FFA14(a1, *v1);
}

_UNKNOWN **static DigitizerType.allCases.getter()
{
  return &off_1002954C0;
}

void sub_10020F204(_QWORD *a1@<X8>)
{
  *a1 = &off_1002954C0;
}

uint64_t DigitizerType.description.getter(int a1)
{
  uint64_t result;

  result = 0x73756C797473;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = 1801680240;
      break;
    case 2:
      result = 0x7265676E6966;
      break;
    case 3:
      result = 1684955496;
      break;
    default:
      result = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for UInt32, &protocol witness table for UInt32);
      break;
  }
  return result;
}

uint64_t sub_10020F2B8()
{
  int *v0;

  return DigitizerType.description.getter(*v0);
}

unint64_t _s8HIDUtils18DigitizerEventMaskV8rawValueACSi_tcfC_0(unint64_t result)
{
  uint64_t v1;
  const char *v2;
  uint64_t v3;

  if ((result & 0x8000000000000000) != 0)
  {
    sub_10006D098();
    v2 = "Negative value is not representable";
    v3 = 35;
LABEL_6:
    result = sub_1000E7388((uint64_t)"Fatal error", 11, 2, (uint64_t)v2, v3, v1, (uint64_t)"Swift/Integers.swift");
    __break(1u);
    return result;
  }
  if (HIDWORD(result))
  {
    sub_10006D098();
    v2 = "Not enough bits to represent the passed value";
    v3 = 45;
    goto LABEL_6;
  }
  return result;
}

uint64_t static DigitizerEventMask.fromEdgeFlat.getter()
{
  return 1024;
}

uint64_t static DigitizerEventMask.fromCorner.getter()
{
  return 4096;
}

uint64_t static DigitizerEventMask.swipePending.getter()
{
  return 0x2000;
}

uint64_t static DigitizerEventMask.fromEdgeForcePending.getter()
{
  return 0x4000;
}

uint64_t static DigitizerEventMask.swipeLocked.getter()
{
  return 0x40000;
}

uint64_t static DigitizerEventMask.estimatedAltitude.getter()
{
  return 0x10000000;
}

uint64_t static DigitizerEventMask.estimatedAzimuth.getter()
{
  return 0x20000000;
}

uint64_t static DigitizerEventMask.estimatedPressure.getter()
{
  return 0x40000000;
}

BOOL sub_10020F388(_DWORD *a1, int *a2)
{
  return sub_1001F7E8C(a1, *a2);
}

uint64_t sub_10020F390(unsigned int *a1)
{
  return sub_1001F7F1C(*a1);
}

uint64_t sub_10020F398(unsigned int *a1)
{
  return sub_1001F3EA0(*a1);
}

uint64_t sub_10020F3A0(unsigned int *a1)
{
  return sub_1001F7EA0(*a1);
}

uint64_t sub_10020F3A8@<X0>(unsigned int *a1@<X0>, _DWORD *a2@<X8>)
{
  unsigned int *v2;
  uint64_t result;

  result = sub_1001D5E9C(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_10020F3D4(int *a1)
{
  int *v1;

  return sub_1001F7EC4(*a1, *v1);
}

BOOL sub_10020F3E0(int *a1)
{
  int *v1;

  return sub_1002150C8(*a1, *v1);
}

uint64_t sub_10020F3EC(unsigned int *a1)
{
  return sub_1001F7F24(*a1);
}

_UNKNOWN **static DigitizerEventMask.allCases.getter()
{
  return &off_1002954F0;
}

void sub_10020F400(_QWORD *a1@<X8>)
{
  *a1 = &off_1002954F0;
}

uint64_t DigitizerEventMask.description.getter(char a1)
{
  unint64_t v2;
  char v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if ((a1 & 0x20) != 0)
  {
    sub_1001F3940(0, 1, 1);
    sub_1002107BC();
    if (v3)
      sub_10021073C(v2);
    sub_1002107AC();
  }
  if ((a1 & 4) != 0)
  {
    if ((sub_1001888A8() & 1) == 0)
      sub_100210724();
    sub_1002107BC();
    if (v3)
      sub_10021073C(v4);
    sub_1002107AC();
  }
  if ((a1 & 1) != 0)
  {
    if ((sub_1001888A8() & 1) == 0)
      sub_100210724();
    sub_1002107BC();
    if (v3)
      sub_10021073C(v5);
    sub_1002107AC();
  }
  if ((a1 & 2) != 0)
  {
    if ((sub_1001888A8() & 1) == 0)
      sub_100210724();
    v7 = _swiftEmptyArrayStorage[2];
    v6 = _swiftEmptyArrayStorage[3];
    v8 = v7 + 1;
    if (v7 >= v6 >> 1)
      sub_1001F3940(v6 > 1, v7 + 1, 1);
    _swiftEmptyArrayStorage[2] = v8;
    *((_DWORD *)&_swiftEmptyArrayStorage[4] + v7) = 2;
  }
  else
  {
    v8 = _swiftEmptyArrayStorage[2];
    if (!v8)
      goto LABEL_37;
  }
  sub_100058678();
  v9 = 0;
  do
  {
    v10 = *((_DWORD *)&_swiftEmptyArrayStorage[4] + v9);
    if ((v10 & 0x20) != 0)
    {
      v13 = 0xE800000000000000;
      v11 = 0x797469746E656469;
    }
    else if ((v10 & 4) != 0)
    {
      v13 = 0xE800000000000000;
      v11 = 0x6E6F697469736F70;
    }
    else if ((v10 & 1) != 0)
    {
      v13 = 0xE500000000000000;
      v11 = 0x65676E6172;
    }
    else if ((v10 & 2) != 0)
    {
      v13 = 0xE500000000000000;
      v11 = 0x6863756F74;
    }
    else
    {
      v11 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for UInt32, &protocol witness table for UInt32);
      v13 = v12;
    }
    v14 = _swiftEmptyArrayStorage[2];
    if (v14 >= _swiftEmptyArrayStorage[3] >> 1)
      sub_100058678();
    ++v9;
    _swiftEmptyArrayStorage[2] = v14 + 1;
    v15 = &_swiftEmptyArrayStorage[2 * v14];
    v15[4] = v11;
    v15[5] = v13;
  }
  while (v8 != v9);
LABEL_37:
  swift_release();
  v16 = sub_1000055B0((uint64_t *)&unk_1002AC160);
  sub_10021049C((unint64_t *)&qword_1002AB150, (uint64_t *)&unk_1002AC160, (uint64_t)&protocol conformance descriptor for [A]);
  v18 = BidirectionalCollection<>.joined(separator:)(44, 0xE100000000000000, v16, v17);
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t sub_10020F710()
{
  _DWORD *v0;

  return DigitizerEventMask.description.getter(*v0);
}

uint64_t DigitizerEvent.init(time:digitizerType:digitizerEventMask:generationCount:index:identity:point:range:touch:flags:)(uint64_t a1, int a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t a6, char a7, char a8, __n128 a9, __n128 a10, __n128 a11, unsigned int a12)
{
  void *DigitizerEvent;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t result;
  uint64_t v19;
  const char *v20;
  uint64_t v21;

  if (a2 != 2)
  {
    if ((a5 & 0x8000000000000000) == 0)
    {
      if (HIDWORD(a5))
        goto LABEL_16;
      if ((a6 & 0x8000000000000000) == 0)
      {
        if (!HIDWORD(a6))
        {
          DigitizerEvent = (void *)IOHIDEventCreateDigitizerEvent(0, a1, a9, a10, a11, 0.0, 0.0);
          goto LABEL_12;
        }
        goto LABEL_16;
      }
    }
    goto LABEL_15;
  }
  if ((a5 & 0x8000000000000000) != 0)
    goto LABEL_15;
  if (HIDWORD(a5))
  {
LABEL_16:
    sub_10006D098();
    v20 = "Not enough bits to represent the passed value";
    v21 = 45;
    goto LABEL_17;
  }
  if ((a6 & 0x8000000000000000) != 0)
  {
LABEL_15:
    sub_10006D098();
    v20 = "Negative value is not representable";
    v21 = 35;
LABEL_17:
    result = sub_1000E7388((uint64_t)"Fatal error", 11, 2, (uint64_t)v20, v21, v19, (uint64_t)"Swift/Integers.swift");
    __break(1u);
    return result;
  }
  if (HIDWORD(a6))
    goto LABEL_16;
  DigitizerEvent = (void *)IOHIDEventCreateDigitizerFingerEvent(0, a1, a5, a6, a3, a7 & 1, a8 & 1, a12, a9, a10, a11, 0.0, 0.0);
LABEL_12:
  v14 = DigitizerEvent;
  v15 = DigitizerEvent;
  v16 = v15;
  if (a4)
  {
    v17 = v15;
    sub_100210764((uint64_t)v17, 0x1Bu);

    v14 = v17;
  }

  return (uint64_t)v16;
}

void DigitizerEvent.generationCount.setter(int a1, void *a2)
{
  id v2;

  v2 = sub_100210704(a1, a2);
  sub_100210764((uint64_t)v2, 0x1Bu);
  sub_1002106FC(v2);
}

void DigitizerEvent.x.getter(void *a1)
{
  sub_1002107CC((uint64_t)a1);
  sub_1001F42E8();
  sub_1001A4570();
}

void DigitizerEvent.x.setter(void *a1)
{
  id v1;

  v1 = sub_1001F42F0(a1);
  sub_1001F42C0((uint64_t)v1, 720896);
  sub_1002106FC(v1);
}

void DigitizerEvent.x.modify(_QWORD *a1, void *a2)
{
  uint64_t v2;
  id v4;

  a1[1] = a2;
  v4 = sub_100210704((int)a1, a2);
  sub_1002107CC((uint64_t)v4);
  sub_1001F42E0();
  *a1 = v2;
  sub_1001A4570();
}

void sub_10020F964(uint64_t a1, uint64_t a2)
{
  sub_10020FABC(a1, a2, 720896);
}

void DigitizerEvent.y.getter(void *a1)
{
  sub_100210770((uint64_t)a1);
  sub_1001F42E8();
  sub_1001A4570();
}

void DigitizerEvent.y.setter(void *a1)
{
  id v1;

  v1 = sub_1001F42F0(a1);
  sub_1001F42C0((uint64_t)v1, 720897);
  sub_1002106FC(v1);
}

void DigitizerEvent.y.modify(_QWORD *a1, void *a2)
{
  uint64_t v2;
  id v4;

  a1[1] = a2;
  v4 = sub_100210704((int)a1, a2);
  sub_100210770((uint64_t)v4);
  sub_1001F42E0();
  *a1 = v2;
  sub_1001A4570();
}

void sub_10020FA0C(uint64_t a1, uint64_t a2)
{
  sub_1002107A4(a1, a2, 1u);
}

void DigitizerEvent.z.getter(void *a1)
{
  sub_1002107EC((uint64_t)a1);
  sub_1001F42E8();
  sub_1001A4570();
}

void DigitizerEvent.z.setter(void *a1)
{
  id v1;

  v1 = sub_1001F42F0(a1);
  sub_1001F42C0((uint64_t)v1, 720898);
  sub_1002106FC(v1);
}

void DigitizerEvent.z.modify(_QWORD *a1, void *a2)
{
  uint64_t v2;
  id v4;

  a1[1] = a2;
  v4 = sub_100210704((int)a1, a2);
  sub_1002107EC((uint64_t)v4);
  sub_1001F42E0();
  *a1 = v2;
  sub_1001A4570();
}

void sub_10020FAB4(uint64_t a1, uint64_t a2)
{
  sub_1002107A4(a1, a2, 2u);
}

void sub_10020FABC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  v4 = sub_1001F8114(*(void **)(a1 + 8));
  sub_1001F42C0((uint64_t)v4, a3);
  sub_100210714(v4);
}

uint64_t DigitizerEvent.digitizerEventMask.getter(void *a1)
{
  return sub_10021078C(a1, 7u, (uint64_t (*)(uint64_t))DigitizerEventMask.init(rawValue:));
}

void DigitizerEvent.digitizerEventMask.setter(unsigned int a1, void *a2)
{
  id v3;

  v3 = sub_100210704(a1, a2);
  sub_100210794((uint64_t)v3, 7u, a1);
  sub_1002106FC(v3);
}

void DigitizerEvent.digitizerEventMask.modify(uint64_t a1, void *a2)
{
  Swift::Int v2;
  id v4;

  *(_QWORD *)a1 = a2;
  v4 = sub_100210704(a1, a2);
  sub_10021070C((uint64_t)v4, 7u);
  sub_1001F7F68();
  *(HIDUtils::DigitizerEventMask *)(a1 + 8) = DigitizerEventMask.init(rawValue:)(v2);
  sub_10000B350();
}

void sub_10020FB8C(void **a1)
{
  sub_10021079C(a1);
}

void DigitizerEvent.identity.getter(void *a1)
{
  sub_10021070C((uint64_t)a1, 6u);
  sub_10000E538();
  sub_1000050D4();
}

void DigitizerEvent.identity.setter(int a1, void *a2)
{
  id v2;

  v2 = sub_100210704(a1, a2);
  sub_100210764((uint64_t)v2, 6u);
  sub_1002106FC(v2);
}

void DigitizerEvent.identity.modify(_QWORD *a1, void *a2)
{
  uint64_t v2;
  id v4;

  a1[1] = a2;
  v4 = sub_100210704((int)a1, a2);
  sub_10021070C((uint64_t)v4, 6u);
  sub_1001F7F68();
  *a1 = v2;
  sub_10000B350();
}

void sub_10020FC38(uint64_t a1)
{
  sub_100210754(a1);
}

void DigitizerEvent.index.getter(void *a1)
{
  sub_10021070C((uint64_t)a1, 5u);
  sub_10000E538();
  sub_1000050D4();
}

void DigitizerEvent.index.setter(int a1, void *a2)
{
  id v2;

  v2 = sub_100210704(a1, a2);
  sub_100210764((uint64_t)v2, 5u);
  sub_1002106FC(v2);
}

void DigitizerEvent.index.modify(_QWORD *a1, void *a2)
{
  uint64_t v2;
  id v4;

  a1[1] = a2;
  v4 = sub_100210704((int)a1, a2);
  sub_10021070C((uint64_t)v4, 5u);
  sub_1001F7F68();
  *a1 = v2;
  sub_10000B350();
}

void sub_10020FCE4(uint64_t a1)
{
  sub_100210754(a1);
}

void DigitizerEvent.collection.getter(void *a1)
{
  sub_10021070C((uint64_t)a1, 0x16u);
  sub_10000E538();
  sub_1000050D4();
}

void DigitizerEvent.collection.setter(int a1, void *a2)
{
  char v2;
  id v3;

  v2 = a1;
  v3 = sub_100210704(a1, a2);
  sub_100210794((uint64_t)v3, 0x16u, v2 & 1);
  sub_1002106FC(v3);
}

void DigitizerEvent.collection.modify(_QWORD *a1, void *a2)
{
  id v2;

  *a1 = a2;
  v2 = sub_100210704((int)a1, a2);
  sub_10021070C((uint64_t)v2, 0x16u);
  sub_1001F7F68();
  sub_1002107D4();
  sub_10000B350();
}

void sub_10020FD98(void **a1)
{
  sub_10021075C(a1);
}

uint64_t DigitizerEvent.digitizerType.getter(void *a1)
{
  return sub_10021078C(a1, 4u, (uint64_t (*)(uint64_t))DigitizerEventMask.init(rawValue:));
}

uint64_t sub_10020FDB0(void *a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  id v3;
  uint64_t IntegerValue;

  v3 = a1;
  IntegerValue = IOHIDEventGetIntegerValue();

  return a3(IntegerValue);
}

void DigitizerEvent.digitizerType.setter(unsigned int a1, void *a2)
{
  id v3;

  v3 = sub_100210704(a1, a2);
  sub_100210794((uint64_t)v3, 4u, a1);
  sub_1002106FC(v3);
}

void DigitizerEvent.digitizerType.modify(uint64_t a1, void *a2)
{
  Swift::Int v2;
  id v4;

  *(_QWORD *)a1 = a2;
  v4 = sub_100210704(a1, a2);
  sub_10021070C((uint64_t)v4, 4u);
  sub_1001F7F68();
  *(HIDUtils::DigitizerEventMask *)(a1 + 8) = DigitizerEventMask.init(rawValue:)(v2);
  sub_10000B350();
}

void sub_10020FE7C(void **a1)
{
  sub_10021079C(a1);
}

void sub_10020FE84(void **a1)
{
  id v1;
  void *v2;

  v1 = sub_1001F8114(*a1);
  sub_10021077C((uint64_t)v1);
  sub_1002106FC(v2);
}

void DigitizerEvent.generationCount.getter(void *a1)
{
  sub_10021070C((uint64_t)a1, 0x1Bu);
  sub_10000E538();
  sub_1000050D4();
}

void DigitizerEvent.generationCount.modify(_QWORD *a1, void *a2)
{
  uint64_t v2;
  id v4;

  a1[1] = a2;
  v4 = sub_100210704((int)a1, a2);
  sub_10021070C((uint64_t)v4, 0x1Bu);
  sub_1001F7F68();
  *a1 = v2;
  sub_10000B350();
}

void sub_10020FF28(uint64_t a1)
{
  sub_100210754(a1);
}

void sub_10020FF30(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = sub_1001F8114(*(void **)(a1 + 8));
  sub_10021077C((uint64_t)v1);
  sub_1002106FC(v2);
}

void DigitizerEvent.range.getter(void *a1)
{
  sub_10021070C((uint64_t)a1, 8u);
  sub_10000E538();
  sub_1000050D4();
}

void DigitizerEvent.range.setter(int a1, void *a2)
{
  char v2;
  id v3;

  v2 = a1;
  v3 = sub_100210704(a1, a2);
  sub_100210794((uint64_t)v3, 8u, v2 & 1);
  sub_1002106FC(v3);
}

void DigitizerEvent.range.modify(_QWORD *a1, void *a2)
{
  id v2;

  *a1 = a2;
  v2 = sub_100210704((int)a1, a2);
  sub_10021070C((uint64_t)v2, 8u);
  sub_1001F7F68();
  sub_1002107D4();
  sub_10000B350();
}

void sub_10021000C(void **a1)
{
  sub_10021075C(a1);
}

void DigitizerEvent.touch.getter(void *a1)
{
  sub_10021070C((uint64_t)a1, 9u);
  sub_10000E538();
  sub_1000050D4();
}

void DigitizerEvent.touch.setter(int a1, void *a2)
{
  char v2;
  id v3;

  v2 = a1;
  v3 = sub_100210704(a1, a2);
  sub_100210794((uint64_t)v3, 9u, v2 & 1);
  sub_1002106FC(v3);
}

void DigitizerEvent.touch.modify(_QWORD *a1, void *a2)
{
  id v2;

  *a1 = a2;
  v2 = sub_100210704((int)a1, a2);
  sub_10021070C((uint64_t)v2, 9u);
  sub_1001F7F68();
  sub_1002107D4();
  sub_10000B350();
}

void sub_1002100C0(void **a1)
{
  sub_10021075C(a1);
}

void sub_1002100C8(void **a1)
{
  id v1;
  void *v2;

  v1 = sub_1001F8114(*a1);
  sub_10021077C((uint64_t)v1);
  sub_1002106FC(v2);
}

void sub_1002100FC()
{
  void **v0;

  DigitizerEvent.collection.getter(*v0);
}

void sub_100210104(int a1)
{
  void **v1;

  DigitizerEvent.collection.setter(a1, *v1);
}

void (*sub_10021010C(uint64_t a1))(uint64_t a1)
{
  void **v1;
  void *v3;
  char v4;

  v3 = *v1;
  *(_QWORD *)a1 = *v1;
  DigitizerEvent.collection.getter(v3);
  *(_BYTE *)(a1 + 8) = v4 & 1;
  return sub_100210148;
}

void sub_100210148(uint64_t a1)
{
  DigitizerEvent.collection.setter(*(unsigned __int8 *)(a1 + 8), *(void **)a1);
}

double DigitizerEvent.point.getter(void *a1)
{
  double v1;
  id v2;

  sub_1002107CC((uint64_t)a1);
  sub_1001F42E8();
  v2 = sub_1002107E4();
  sub_100210770((uint64_t)v2);

  return v1;
}

void sub_1002101A4(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  *(double *)a2 = DigitizerEvent.point.getter(*a1);
  *(_QWORD *)(a2 + 8) = v3;
  *(_QWORD *)(a2 + 16) = 0;
}

void sub_1002101D0(double *a1)
{
  DigitizerEvent.point.setter(*a1);
}

void DigitizerEvent.point.setter(double a1)
{
  id *v1;
  id v3;
  id v4;

  v3 = *v1;
  IOHIDEventSetFloatValue(v3, 720896, a1);

  v4 = sub_1002107E4();
  sub_1001F42C0((uint64_t)v4, 720897);
  sub_100210714(v4);
}

void DigitizerEvent.point.modify(_QWORD *a1)
{
  id *v1;
  uint64_t v2;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  a1[3] = v1;
  v4 = *v1;
  sub_1002107CC((uint64_t)v4);
  sub_1001F42E0();
  v5 = v4;
  sub_100210770((uint64_t)v5);
  v7 = v6;

  *a1 = v2;
  a1[1] = v7;
  a1[2] = 0;
  sub_1001A4570();
}

void sub_1002102AC(uint64_t a1)
{
  double v1;
  id v2;
  id v3;

  v1 = *(double *)(a1 + 8);
  v2 = **(id **)(a1 + 24);
  sub_1001F42C0((uint64_t)v2, 720896);

  v3 = sub_1002107E4();
  IOHIDEventSetFloatValue(v3, 720897, v1);
  sub_100210714(v3);
}

unint64_t sub_100210308()
{
  unint64_t result;

  result = qword_1002B6B28;
  if (!qword_1002B6B28)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for DigitizerType, &type metadata for DigitizerType);
    atomic_store(result, (unint64_t *)&qword_1002B6B28);
  }
  return result;
}

void sub_100210344()
{
  sub_10021049C(&qword_1002B6B30, &qword_1002B6B38, (uint64_t)&protocol conformance descriptor for [A]);
}

unint64_t sub_100210374()
{
  unint64_t result;

  result = qword_1002B6B40;
  if (!qword_1002B6B40)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for DigitizerEventMask, &type metadata for DigitizerEventMask);
    atomic_store(result, (unint64_t *)&qword_1002B6B40);
  }
  return result;
}

unint64_t sub_1002103B4()
{
  unint64_t result;

  result = qword_1002B6B48;
  if (!qword_1002B6B48)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for DigitizerEventMask, &type metadata for DigitizerEventMask);
    atomic_store(result, (unint64_t *)&qword_1002B6B48);
  }
  return result;
}

unint64_t sub_1002103F4()
{
  unint64_t result;

  result = qword_1002B6B50;
  if (!qword_1002B6B50)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for DigitizerEventMask, &type metadata for DigitizerEventMask);
    atomic_store(result, (unint64_t *)&qword_1002B6B50);
  }
  return result;
}

unint64_t sub_100210434()
{
  unint64_t result;

  result = qword_1002B6B58;
  if (!qword_1002B6B58)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for DigitizerEventMask, &type metadata for DigitizerEventMask);
    atomic_store(result, (unint64_t *)&qword_1002B6B58);
  }
  return result;
}

void sub_100210470()
{
  sub_10021049C(&qword_1002B6B60, &qword_1002B6B68, (uint64_t)&protocol conformance descriptor for [A]);
}

void sub_10021049C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = sub_10000DCA0(a2);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }
  sub_1000050D4();
}

void sub_1002104D8(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v2 = (void *)sub_1001F42F8(a1);
  DigitizerEvent.x.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_1002104F8(uint64_t a1, void **a2)
{
  DigitizerEvent.x.setter(*a2);
}

void sub_100210504(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v2 = (void *)sub_1001F42F8(a1);
  DigitizerEvent.y.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_100210524(uint64_t a1, void **a2)
{
  DigitizerEvent.y.setter(*a2);
}

void sub_100210530(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v2 = (void *)sub_1001F42F8(a1);
  DigitizerEvent.z.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_100210550(uint64_t a1, void **a2)
{
  DigitizerEvent.z.setter(*a2);
}

void sub_10021055C(uint64_t a1)
{
  _DWORD *v1;
  void *v2;

  v2 = (void *)sub_1001F42F8(a1);
  *v1 = DigitizerEvent.digitizerEventMask.getter(v2);
  sub_1000050D4();
}

void sub_10021057C(unsigned int *a1, void **a2)
{
  DigitizerEvent.digitizerEventMask.setter(*a1, *a2);
}

void sub_100210588(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v2 = (void *)sub_1001F42F8(a1);
  DigitizerEvent.identity.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_1002105A8(_QWORD *a1, void **a2)
{
  DigitizerEvent.identity.setter(*a1, *a2);
}

void sub_1002105B4(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v2 = (void *)sub_1001F42F8(a1);
  DigitizerEvent.index.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_1002105D4(_QWORD *a1, void **a2)
{
  DigitizerEvent.index.setter(*a1, *a2);
}

void sub_1002105E0(uint64_t a1)
{
  _BYTE *v1;
  void *v2;
  char v3;

  v2 = (void *)sub_1001F42F8(a1);
  DigitizerEvent.collection.getter(v2);
  *v1 = v3 & 1;
  sub_1000050D4();
}

void sub_100210604(unsigned __int8 *a1, void **a2)
{
  DigitizerEvent.collection.setter(*a1, *a2);
}

void sub_100210610(uint64_t a1)
{
  _DWORD *v1;
  void *v2;

  v2 = (void *)sub_1001F42F8(a1);
  *v1 = DigitizerEvent.digitizerType.getter(v2);
  sub_1000050D4();
}

void sub_100210630(unsigned int *a1, void **a2)
{
  DigitizerEvent.digitizerType.setter(*a1, *a2);
}

void sub_10021063C(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v2 = (void *)sub_1001F42F8(a1);
  DigitizerEvent.generationCount.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_10021065C(_QWORD *a1, void **a2)
{
  DigitizerEvent.generationCount.setter(*a1, *a2);
}

void sub_100210668(uint64_t a1)
{
  _BYTE *v1;
  void *v2;
  char v3;

  v2 = (void *)sub_1001F42F8(a1);
  DigitizerEvent.range.getter(v2);
  *v1 = v3 & 1;
  sub_1000050D4();
}

void sub_10021068C(unsigned __int8 *a1, void **a2)
{
  DigitizerEvent.range.setter(*a1, *a2);
}

void sub_100210698(uint64_t a1)
{
  _BYTE *v1;
  void *v2;
  char v3;

  v2 = (void *)sub_1001F42F8(a1);
  DigitizerEvent.touch.getter(v2);
  *v1 = v3 & 1;
  sub_1000050D4();
}

void sub_1002106BC(unsigned __int8 *a1, void **a2)
{
  DigitizerEvent.touch.setter(*a1, *a2);
}

void type metadata accessor for DigitizerType()
{
  sub_10003B1DC();
}

void type metadata accessor for DigitizerEventMask()
{
  sub_10003B1DC();
}

void type metadata accessor for DigitizerEvent()
{
  sub_10003B1DC();
}

void sub_1002106FC(id a1)
{

}

id sub_100210704(int a1, id a2)
{
  return a2;
}

uint64_t sub_10021070C(uint64_t a1, unsigned __int16 a2)
{
  return IOHIDEventGetIntegerValue(a1, a2 | 0xB0000u);
}

void sub_100210714(id a1)
{

}

void sub_100210724()
{
  uint64_t v0;

  sub_1001F3940(0, *(_QWORD *)(v0 + 16) + 1, 1);
}

void sub_10021073C(unint64_t a1@<X8>)
{
  uint64_t v1;

  sub_1001F3940(a1 > 1, v1, 1);
}

void sub_100210754(uint64_t a1)
{
  sub_10020FF30(a1);
}

void sub_10021075C(void **a1)
{
  sub_1002100C8(a1);
}

uint64_t sub_100210764(uint64_t a1, unsigned __int16 a2)
{
  uint64_t v2;

  return IOHIDEventSetIntegerValue(a1, a2 | 0xB0000u, v2);
}

uint64_t sub_100210770(uint64_t a1)
{
  return IOHIDEventGetFloatValue(a1, 720897);
}

uint64_t sub_10021077C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return IOHIDEventSetIntegerValue(a1, v1, v2);
}

uint64_t sub_10021078C(void *a1, unsigned __int16 a2, uint64_t (*a3)(uint64_t))
{
  return sub_10020FDB0(a1, a2 | 0xB0000u, a3);
}

uint64_t sub_100210794(uint64_t a1, unsigned __int16 a2, uint64_t a3)
{
  return IOHIDEventSetIntegerValue(a1, a2 | 0xB0000u, a3);
}

void sub_10021079C(void **a1)
{
  sub_10020FE84(a1);
}

void sub_1002107A4(uint64_t a1, uint64_t a2, unsigned __int16 a3)
{
  sub_10020FABC(a1, a2, a3 | 0xB0000u);
}

void sub_1002107AC()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  *(_QWORD *)(v0 + 16) = v1;
  *(_DWORD *)(v0 + 4 * v3 + 32) = v2;
}

uint64_t sub_1002107CC(uint64_t a1)
{
  return IOHIDEventGetFloatValue(a1, 720896);
}

void sub_1002107D4()
{
  uint64_t v0;
  uint64_t v1;

  *(_BYTE *)(v0 + 8) = v1 != 0;
}

id sub_1002107E4()
{
  void *v0;

  return v0;
}

uint64_t sub_1002107EC(uint64_t a1)
{
  return IOHIDEventGetFloatValue(a1, 720898);
}

id ScrollEvent.init(time:delta:flags:)(uint64_t a1, uint64_t a2)
{
  void *ScrollEvent;
  id v3;

  ScrollEvent = (void *)IOHIDEventCreateScrollEvent(0, a1, a2);
  v3 = ScrollEvent;

  return v3;
}

uint64_t ScrollEvent.init(event:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a1[3];
  v3 = a1[4];
  sub_10000DBE4(a1, v2);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3) == 6)
  {
    v4 = a1[3];
    v5 = a1[4];
    sub_10000DBE4(a1, v4);
    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 352))(v4, v5);
  }
  else
  {
    v6 = 0;
  }
  sub_100005988(a1);
  return v6;
}

void ScrollEvent.x.getter(void *a1)
{
  sub_100210E60((uint64_t)a1);
  sub_1001F42E8();
  sub_1001A4570();
}

void ScrollEvent.x.setter(void *a1)
{
  id v1;

  v1 = sub_1001F42F0(a1);
  sub_1001F42C0((uint64_t)v1, 393216);
  sub_1002106FC(v1);
}

void ScrollEvent.x.modify(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v4 = sub_1001F4290(a1, a2);
  sub_100210E60((uint64_t)v4);
  sub_1001F42E0();
  *v2 = v3;
  sub_1001A4570();
}

void sub_100210958(uint64_t a1, uint64_t a2)
{
  sub_1001F4A20(a1, a2, 393216);
}

void ScrollEvent.y.getter(void *a1)
{
  sub_100210E4C((uint64_t)a1, 1u);
  sub_1001F42E8();
  sub_1001A4570();
}

void ScrollEvent.y.setter(void *a1)
{
  id v1;

  v1 = sub_1001F42F0(a1);
  sub_1001F42C0((uint64_t)v1, 393217);
  sub_1002106FC(v1);
}

void ScrollEvent.y.modify(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v4 = sub_1001F4290(a1, a2);
  sub_100210E4C((uint64_t)v4, 1u);
  sub_1001F42E0();
  *v2 = v3;
  sub_1001A4570();
}

void sub_100210A00(uint64_t a1, uint64_t a2)
{
  sub_100210E44(a1, a2, 1u);
}

void ScrollEvent.z.getter(void *a1)
{
  sub_100210E4C((uint64_t)a1, 2u);
  sub_1001F42E8();
  sub_1001A4570();
}

void ScrollEvent.z.setter(void *a1)
{
  id v1;

  v1 = sub_1001F42F0(a1);
  sub_1001F42C0((uint64_t)v1, 393218);
  sub_1002106FC(v1);
}

void ScrollEvent.z.modify(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v4 = sub_1001F4290(a1, a2);
  sub_100210E4C((uint64_t)v4, 2u);
  sub_1001F42E0();
  *v2 = v3;
  sub_1001A4570();
}

void sub_100210AA8(uint64_t a1, uint64_t a2)
{
  sub_100210E44(a1, a2, 2u);
}

BOOL ScrollEvent.isPixels.getter(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  v2 = sub_100210E54((uint64_t)v1);

  return v2 != 0;
}

void ScrollEvent.isPixels.setter(char a1, id a2)
{
  id v3;

  v3 = a2;
  IOHIDEventSetIntegerValue(v3, 393219, a1 & 1);
  sub_1002106FC(v3);
}

void (*ScrollEvent.isPixels.modify(uint64_t a1, id a2))(uint64_t a1)
{
  id v3;
  uint64_t v4;

  *(_QWORD *)a1 = a2;
  v3 = a2;
  v4 = sub_100210E54((uint64_t)v3);

  *(_BYTE *)(a1 + 8) = v4 != 0;
  return sub_100210B7C;
}

void sub_100210B7C(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(a1 + 8);
  v2 = *(id *)a1;
  IOHIDEventSetIntegerValue(v2, 393219, v1);
  sub_1002106FC(v2);
}

uint64_t sub_100210BC0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = ScrollEvent.init(event:)(a1);
  *a2 = result;
  return result;
}

double ScrollEvent.delta.getter(void *a1)
{
  double v1;
  id v2;
  id v3;

  sub_100210E60((uint64_t)a1);
  sub_1001F42E8();
  v2 = sub_1002107E4();
  sub_100210E4C((uint64_t)v2, 1u);

  v3 = sub_1002107E4();
  IOHIDEventGetFloatValue(v3, 393218);

  return v1;
}

void sub_100210C60(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  *(double *)a2 = ScrollEvent.delta.getter(*a1);
  *(_QWORD *)(a2 + 8) = v3;
  *(_QWORD *)(a2 + 16) = v4;
}

void sub_100210C8C(double *a1, void **a2)
{
  ScrollEvent.delta.setter(*a2, *a1, a1[1]);
}

void ScrollEvent.delta.setter(void *a1, double a2, double a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a1;
  IOHIDEventSetFloatValue(v5, 393216, a2);

  v6 = sub_1002107E4();
  IOHIDEventSetFloatValue(v6, 393217, a3);

  v7 = sub_1002107E4();
  sub_1001F42C0((uint64_t)v7, 393218);

}

void (*ScrollEvent.delta.modify(uint64_t a1, void *a2))(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(a1 + 24) = a2;
  *(double *)a1 = ScrollEvent.delta.getter(a2);
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  return sub_100210D64;
}

void sub_100210D64(uint64_t a1)
{
  ScrollEvent.delta.setter(*(void **)(a1 + 24), *(double *)a1, *(double *)(a1 + 8));
}

void sub_100210D78(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v2 = (void *)sub_1001F42F8(a1);
  ScrollEvent.x.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_100210D98(uint64_t a1, void **a2)
{
  ScrollEvent.x.setter(*a2);
}

void sub_100210DA4(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v2 = (void *)sub_1001F42F8(a1);
  ScrollEvent.y.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_100210DC4(uint64_t a1, void **a2)
{
  ScrollEvent.y.setter(*a2);
}

void sub_100210DD0(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v2 = (void *)sub_1001F42F8(a1);
  ScrollEvent.z.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_100210DF0(uint64_t a1, void **a2)
{
  ScrollEvent.z.setter(*a2);
}

void sub_100210DFC(uint64_t a1)
{
  BOOL *v1;
  void *v2;

  v2 = (void *)sub_1001F42F8(a1);
  *v1 = ScrollEvent.isPixels.getter(v2);
  sub_1000050D4();
}

void sub_100210E20(char *a1, id *a2)
{
  ScrollEvent.isPixels.setter(*a1, *a2);
}

ValueMetadata *type metadata accessor for ScrollEvent()
{
  return &type metadata for ScrollEvent;
}

void sub_100210E44(uint64_t a1, uint64_t a2, unsigned __int16 a3)
{
  sub_1001F4A20(a1, a2, a3 | 0x60000u);
}

uint64_t sub_100210E4C(uint64_t a1, unsigned __int16 a2)
{
  return IOHIDEventGetFloatValue(a1, a2 | 0x60000u);
}

uint64_t sub_100210E54(uint64_t a1)
{
  return IOHIDEventGetIntegerValue(a1, 393219);
}

uint64_t sub_100210E60(uint64_t a1)
{
  return IOHIDEventGetFloatValue(a1, 393216);
}

uint64_t HIDServiceProperties.deviceType.getter(Swift::UInt64 a1, void *a2)
{
  HIDUtils::HIDServiceProperties v3;

  v3.storage.super.super.isa = (Class)a2;
  v3.serviceID = a1;
  return HIDDeviceType.init(properties:)(v3);
}

HIDUtils::HIDDeviceType_optional __swiftcall HIDDeviceType.init(deviceTypeHint:)(Swift::String deviceTypeHint)
{
  void *object;
  uint64_t countAndFlagsBits;
  unint64_t v4;
  char v7;

  if (deviceTypeHint._countAndFlagsBits == 0x6573756F4DLL && deviceTypeHint._object == (void *)0xE500000000000000)
  {
    v4 = 0xE500000000000000;
    goto LABEL_8;
  }
  object = deviceTypeHint._object;
  countAndFlagsBits = deviceTypeHint._countAndFlagsBits;
  if ((sub_10000E3A4(0x6573756F4DLL, 0xE500000000000000) & 1) != 0)
  {
    v4 = (unint64_t)object;
LABEL_8:
    swift_bridgeObjectRelease(v4);
    return (HIDUtils::HIDDeviceType_optional)1;
  }
  if (countAndFlagsBits == 0x6461706B63617254 && object == (void *)0xE800000000000000)
  {
    swift_bridgeObjectRelease(0xE800000000000000);
    return (HIDUtils::HIDDeviceType_optional)2;
  }
  else
  {
    v7 = sub_10000E3A4(0x6461706B63617254, 0xE800000000000000);
    swift_bridgeObjectRelease(object);
    if ((v7 & 1) != 0)
      return (HIDUtils::HIDDeviceType_optional)2;
    else
      return (HIDUtils::HIDDeviceType_optional)3;
  }
}

uint64_t sub_100210F5C(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v8;
  char v10;

  if (a1 == 0x6472616F6279656BLL && a2 == 0xE800000000000000)
  {
    v5 = 0xE800000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6472616F6279656BLL, 0xE800000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x6573756F6DLL && a2 == 0xE500000000000000)
  {
    v8 = 0xE500000000000000;
    goto LABEL_16;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6573756F6DLL, 0xE500000000000000, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
LABEL_16:
    swift_bridgeObjectRelease(v8);
    return 1;
  }
  if (a1 == 0x6461706B63617274 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease(0xE800000000000000);
    return 2;
  }
  else
  {
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6461706B63617274, 0xE800000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v10 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_1002110A4(char a1)
{
  if (!a1)
    return 0x6472616F6279656BLL;
  if (a1 == 1)
    return 0x6573756F6DLL;
  return 0x6461706B63617274;
}

uint64_t sub_1002110F8()
{
  char *v0;

  return sub_1002110A4(*v0);
}

uint64_t sub_100211100@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100210F5C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100211124(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100211A18();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10021114C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100211A18();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100211174(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100211ACC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10021119C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100211ACC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1002111C4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100211A90();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1002111EC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100211A90();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100211214(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100211A54();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10021123C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100211A54();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t HIDDeviceType.description.getter(char a1)
{
  if (!a1)
    return 0x6472616F6279654BLL;
  if (a1 == 1)
    return 0x6573756F4DLL;
  return 0x6461706B63617254;
}

uint64_t sub_1002112B8()
{
  char *v0;

  return HIDDeviceType.description.getter(*v0);
}

uint64_t HIDDeviceType.encode(to:)(_QWORD *a1, char a2)
{
  uint64_t v2;
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
  unint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v30;
  char v31;
  char v32;

  v4 = sub_1000055B0(&qword_1002B6B70);
  v26 = *(_QWORD *)(v4 - 8);
  v27 = v4;
  sub_1000262EC();
  __chkstk_darwin(v5);
  sub_10000E5DC();
  v25 = v6;
  v7 = sub_1000055B0(&qword_1002B6B78);
  v23 = *(_QWORD *)(v7 - 8);
  v24 = v7;
  sub_1000262EC();
  __chkstk_darwin(v8);
  sub_10002641C();
  v11 = v10 - v9;
  v12 = sub_1000055B0(&qword_1002B6B80);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_10002641C();
  v16 = v15 - v14;
  v17 = sub_1000055B0(&qword_1002B6B88);
  v28 = *(_QWORD *)(v17 - 8);
  sub_1000262EC();
  __chkstk_darwin(v18);
  sub_10000E478();
  v20 = a1[3];
  v19 = a1[4];
  sub_10000DBE4(a1, v20);
  v21 = sub_100211A18();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for HIDDeviceType.CodingKeys, &type metadata for HIDDeviceType.CodingKeys, v21, v20, v19);
  if (a2)
  {
    if (a2 == 1)
    {
      v31 = 1;
      sub_100211A90();
      sub_1000EFEF8((uint64_t)&type metadata for HIDDeviceType.MouseCodingKeys, (uint64_t)&v31);
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v11, v24);
    }
    else
    {
      sub_100211F08();
      sub_1000EFEF8((uint64_t)&type metadata for HIDDeviceType.TrackpadCodingKeys, (uint64_t)&v32);
      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
    }
  }
  else
  {
    v30 = 0;
    sub_100211ACC();
    sub_1000EFEF8((uint64_t)&type metadata for HIDDeviceType.KeyboardCodingKeys, (uint64_t)&v30);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v16, v12);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v28 + 8))(v2, v17);
}

uint64_t HIDDeviceType.init(from:)(_QWORD *a1)
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
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
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
  _QWORD *v45;
  char v46;
  char v47;
  char v48;

  v40 = sub_1000055B0(&qword_1002B6BB0);
  v43 = *(_QWORD *)(v40 - 8);
  sub_1000262EC();
  __chkstk_darwin(v3);
  sub_10000E5DC();
  v42 = v4;
  v5 = sub_1000055B0(&qword_1002B6BB8);
  v38 = *(_QWORD *)(v5 - 8);
  v39 = v5;
  sub_1000262EC();
  __chkstk_darwin(v6);
  sub_10000E5DC();
  v41 = v7;
  v37 = sub_1000055B0(&qword_1002B6BC0);
  v8 = *(_QWORD *)(v37 - 8);
  __chkstk_darwin(v37);
  sub_10000E478();
  v9 = sub_1000055B0(&qword_1002B6BC8);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_10002641C();
  v13 = v12 - v11;
  v15 = a1[3];
  v14 = a1[4];
  sub_10000DBE4(a1, v15);
  v16 = sub_100211A18();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for HIDDeviceType.CodingKeys, &type metadata for HIDDeviceType.CodingKeys, v16, v15, v14);
  if (v44)
    goto LABEL_11;
  v35 = v13;
  v36 = v10;
  v45 = a1;
  v17 = KeyedDecodingContainer.allKeys.getter(v9);
  v18 = v17;
  v19 = *(_QWORD *)(v17 + 16);
  if (!v19)
  {
LABEL_8:
    v26 = type metadata accessor for DecodingError(0);
    swift_allocError(v26, &protocol witness table for DecodingError, 0, 0);
    v28 = v27;
    sub_1000055B0(&qword_1002ABBD0);
    *v28 = &type metadata for HIDDeviceType;
    v29 = KeyedDecodingContainer.codingPath.getter(v9);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)(v29, 0xD00000000000002BLL, 0x8000000100253AD0, 0);
    v30 = (*(uint64_t (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v28, enum case for DecodingError.typeMismatch(_:), v26);
    swift_willThrow(v30);
    swift_unknownObjectRelease(v18);
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v9);
    a1 = v45;
LABEL_11:
    sub_100005988(a1);
    return v9;
  }
  v20 = v9;
  v9 = *(unsigned __int8 *)(v17 + 32);
  v21 = sub_1000EDBD0(1, v19, v17, v17 + 32, 0, (2 * v19) | 1);
  v23 = v22;
  v25 = v24;
  swift_bridgeObjectRelease();
  v18 = v21;
  if (v23 != v25 >> 1)
  {
    v9 = v20;
    goto LABEL_8;
  }
  if ((_DWORD)v9)
  {
    if ((_DWORD)v9 == 1)
    {
      v47 = 1;
      sub_100211A90();
      sub_100211EE0((uint64_t)&type metadata for HIDDeviceType.MouseCodingKeys, (uint64_t)&v47);
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v41, v39);
    }
    else
    {
      sub_100211F08();
      sub_100211EE0((uint64_t)&type metadata for HIDDeviceType.TrackpadCodingKeys, (uint64_t)&v48);
      (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v42, v40);
    }
    v32 = v21;
  }
  else
  {
    v46 = 0;
    sub_100211ACC();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for HIDDeviceType.KeyboardCodingKeys, &v46, v20, &type metadata for HIDDeviceType.KeyboardCodingKeys);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1, v37);
    v32 = v21;
  }
  swift_unknownObjectRelease(v32);
  v33 = sub_100211EF4();
  v34(v33);
  sub_100005988(v45);
  return v9;
}

uint64_t sub_100211864@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = HIDDeviceType.init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_10021188C(_QWORD *a1)
{
  char *v1;

  return HIDDeviceType.encode(to:)(a1, *v1);
}

uint64_t sub_1002118A4()
{
  unsigned __int8 *v0;

  return HIDDeviceType.hashValue.getter(*v0);
}

HIDUtils::HIDDeviceType __swiftcall HIDDeviceType.init(properties:)(HIDUtils::HIDServiceProperties properties)
{
  Class isa;
  Swift::UInt64 serviceID;
  uint64_t v3;
  id v4;
  HIDUtils::HIDDeviceType_optional v5;
  HIDUtils::HIDDeviceType value;
  int v7;
  BOOL v8;
  Swift::String v10;
  _OWORD v11[2];
  _BYTE v12[24];
  uint64_t v13;

  isa = properties.storage.super.super.isa;
  serviceID = properties.serviceID;
  strcpy((char *)v11, "DeviceTypeHint");
  HIBYTE(v11[0]) = -18;
  v3 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(v11, &type metadata for String);
  v4 = -[objc_class __swift_objectForKeyedSubscript:](isa, "__swift_objectForKeyedSubscript:", v3);
  swift_unknownObjectRelease(v3);
  if (v4)
  {
    _bridgeAnyObjectToAny(_:)(v11, v4);
    swift_unknownObjectRelease(v4);
  }
  else
  {
    memset(v11, 0, sizeof(v11));
  }
  sub_100211B08((uint64_t)v11, (uint64_t)v12);
  if (v13)
  {
    if ((swift_dynamicCast(&v10, v12, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
    {
      v5.value = HIDDeviceType.init(deviceTypeHint:)(v10).value;
      if (v5.value != HIDUtils_HIDDeviceType_unknownDefault)
      {
        value = v5.value;

        return value;
      }
    }
  }
  else
  {
    sub_100005570((uint64_t)v12);
  }
  v7 = HIDServiceProperties.primaryUsagePair.getter(serviceID, isa);
  if (static HIDUsage.== infix(_:_:)(786445, v7))
  {

    return 2;
  }
  else
  {
    v8 = static HIDUsage.== infix(_:_:)(393217, v7);

    return !v8;
  }
}

unint64_t sub_100211A18()
{
  unint64_t result;

  result = qword_1002B6B90;
  if (!qword_1002B6B90)
  {
    result = swift_getWitnessTable(&unk_10023263C, &type metadata for HIDDeviceType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6B90);
  }
  return result;
}

unint64_t sub_100211A54()
{
  unint64_t result;

  result = qword_1002B6B98;
  if (!qword_1002B6B98)
  {
    result = swift_getWitnessTable(&unk_1002325EC, &type metadata for HIDDeviceType.TrackpadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6B98);
  }
  return result;
}

unint64_t sub_100211A90()
{
  unint64_t result;

  result = qword_1002B6BA0;
  if (!qword_1002B6BA0)
  {
    result = swift_getWitnessTable(&unk_10023259C, &type metadata for HIDDeviceType.MouseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6BA0);
  }
  return result;
}

unint64_t sub_100211ACC()
{
  unint64_t result;

  result = qword_1002B6BA8;
  if (!qword_1002B6BA8)
  {
    result = swift_getWitnessTable(&unk_10023254C, &type metadata for HIDDeviceType.KeyboardCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6BA8);
  }
  return result;
}

uint64_t sub_100211B08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000055B0(&qword_1002B34C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100211B54()
{
  unint64_t result;

  result = qword_1002B6BD0;
  if (!qword_1002B6BD0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDDeviceType, &type metadata for HIDDeviceType);
    atomic_store(result, (unint64_t *)&qword_1002B6BD0);
  }
  return result;
}

ValueMetadata *type metadata accessor for HIDDeviceType()
{
  return &type metadata for HIDDeviceType;
}

uint64_t _s8HIDUtils13HIDDeviceTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100211BF0 + 4 * byte_100232245[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_100211C24 + 4 * asc_100232240[v4]))();
}

uint64_t sub_100211C24(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100211C2C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100211C34);
  return result;
}

uint64_t sub_100211C40(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100211C48);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_100211C4C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100211C54(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDDeviceType.CodingKeys()
{
  return &type metadata for HIDDeviceType.CodingKeys;
}

ValueMetadata *type metadata accessor for HIDDeviceType.KeyboardCodingKeys()
{
  return &type metadata for HIDDeviceType.KeyboardCodingKeys;
}

ValueMetadata *type metadata accessor for HIDDeviceType.MouseCodingKeys()
{
  return &type metadata for HIDDeviceType.MouseCodingKeys;
}

ValueMetadata *type metadata accessor for HIDDeviceType.TrackpadCodingKeys()
{
  return &type metadata for HIDDeviceType.TrackpadCodingKeys;
}

unint64_t sub_100211CA4()
{
  unint64_t result;

  result = qword_1002B6BD8;
  if (!qword_1002B6BD8)
  {
    result = swift_getWitnessTable(&unk_100232524, &type metadata for HIDDeviceType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6BD8);
  }
  return result;
}

unint64_t sub_100211CE4()
{
  unint64_t result;

  result = qword_1002B6BE0;
  if (!qword_1002B6BE0)
  {
    result = swift_getWitnessTable(&unk_100232444, &type metadata for HIDDeviceType.KeyboardCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6BE0);
  }
  return result;
}

unint64_t sub_100211D24()
{
  unint64_t result;

  result = qword_1002B6BE8;
  if (!qword_1002B6BE8)
  {
    result = swift_getWitnessTable(&unk_10023246C, &type metadata for HIDDeviceType.KeyboardCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6BE8);
  }
  return result;
}

unint64_t sub_100211D64()
{
  unint64_t result;

  result = qword_1002B6BF0;
  if (!qword_1002B6BF0)
  {
    result = swift_getWitnessTable(&unk_1002323F4, &type metadata for HIDDeviceType.MouseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6BF0);
  }
  return result;
}

unint64_t sub_100211DA4()
{
  unint64_t result;

  result = qword_1002B6BF8;
  if (!qword_1002B6BF8)
  {
    result = swift_getWitnessTable(&unk_10023241C, &type metadata for HIDDeviceType.MouseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6BF8);
  }
  return result;
}

unint64_t sub_100211DE4()
{
  unint64_t result;

  result = qword_1002B6C00;
  if (!qword_1002B6C00)
  {
    result = swift_getWitnessTable(&unk_1002323A4, &type metadata for HIDDeviceType.TrackpadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6C00);
  }
  return result;
}

unint64_t sub_100211E24()
{
  unint64_t result;

  result = qword_1002B6C08;
  if (!qword_1002B6C08)
  {
    result = swift_getWitnessTable(&unk_1002323CC, &type metadata for HIDDeviceType.TrackpadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6C08);
  }
  return result;
}

unint64_t sub_100211E64()
{
  unint64_t result;

  result = qword_1002B6C10;
  if (!qword_1002B6C10)
  {
    result = swift_getWitnessTable(&unk_100232494, &type metadata for HIDDeviceType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6C10);
  }
  return result;
}

unint64_t sub_100211EA4()
{
  unint64_t result;

  result = qword_1002B6C18;
  if (!qword_1002B6C18)
  {
    result = swift_getWitnessTable(&unk_1002324BC, &type metadata for HIDDeviceType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1002B6C18);
  }
  return result;
}

uint64_t sub_100211EE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)(a1, a2, v2, a1);
}

uint64_t sub_100211EF4()
{
  uint64_t v0;

  return v0;
}

unint64_t sub_100211F08()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 2;
  return sub_100211A54();
}

id sub_100211F18(uint64_t a1)
{
  return sub_100212518(a1);
}

id sub_100211F30(uint64_t a1, uint64_t a2)
{
  void *v2;

  return objc_msgSend(v2, "conformsToUsagePage:usage:", a1, a2);
}

unint64_t sub_100211F58(uint64_t a1)
{
  return (unint64_t)sub_100212588(a1) & 1;
}

double sub_100211F70@<D0>(uint64_t a1@<X8>)
{
  return sub_1002126B4(a1);
}

uint64_t sub_100211F84()
{
  NSString v0;
  uint64_t v1;
  id v2;
  uint64_t v4;
  _OWORD v5[2];
  _BYTE v6[24];
  uint64_t v7;

  swift_bridgeObjectRetain();
  v0 = sub_100212744();
  swift_bridgeObjectRelease();
  v2 = sub_100206368(v1, "propertyForKey:");

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)(v5, v2);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_100211B08((uint64_t)v5, (uint64_t)v6);
  if (v7)
  {
    if (swift_dynamicCast(&v4, v6, (char *)&type metadata for Any + 8, &type metadata for Int, 6))
      return v4;
    else
      return 0;
  }
  else
  {
    sub_100005570((uint64_t)v6);
    return 0;
  }
}

void sub_100212070(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  NSNumber v6;
  id v7;

  if ((a2 & 1) != 0)
    v6.super.super.isa = 0;
  else
    v6.super.super.isa = Int._bridgeToObjectiveC()().super.super.isa;
  v7 = sub_100212744();
  swift_bridgeObjectRelease(a4);
  objc_msgSend(v4, "setProperty:forKey:", v6.super.super.isa, v7);
  swift_unknownObjectRelease(v6.super.super.isa);

}

uint64_t HIDServiceClient.mouseAcceleration.getter()
{
  return sub_10021273C();
}

uint64_t sub_100212118@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = HIDServiceClient.mouseAcceleration.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

void sub_100212148(uint64_t a1)
{
  HIDServiceClient.mouseAcceleration.setter(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

void HIDServiceClient.mouseAcceleration.setter(uint64_t a1, char a2)
{
  sub_100212734(a1, a2 & 1, 20, 0x800000010025AAB0);
}

void HIDServiceClient.mouseAcceleration.modify(uint64_t a1)
{
  uint64_t v1;
  char v2;

  sub_10021274C(a1);
  v1 = sub_10021273C();
  sub_1002060D8(v1, v2);
  sub_1000050D4();
}

void sub_1002121D4(uint64_t a1, uint64_t a2)
{
  sub_10021272C(a1, a2, 20, 0x800000010025AAB0);
}

uint64_t HIDServiceClient.mouseScrollAcceleration.getter()
{
  return sub_10021273C();
}

uint64_t sub_100212218@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = HIDServiceClient.mouseScrollAcceleration.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

void sub_100212248(uint64_t a1)
{
  HIDServiceClient.mouseScrollAcceleration.setter(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

void HIDServiceClient.mouseScrollAcceleration.setter(uint64_t a1, char a2)
{
  sub_100212734(a1, a2 & 1, 26, 0x800000010025AAD0);
}

void HIDServiceClient.mouseScrollAcceleration.modify(uint64_t a1)
{
  uint64_t v1;
  char v2;

  sub_10021274C(a1);
  v1 = sub_10021273C();
  sub_1002060D8(v1, v2);
  sub_1000050D4();
}

void sub_1002122D4(uint64_t a1, uint64_t a2)
{
  sub_10021272C(a1, a2, 26, 0x800000010025AAD0);
}

uint64_t HIDServiceClient.trackpadAcceleration.getter()
{
  return sub_10021273C();
}

uint64_t sub_100212318@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = HIDServiceClient.trackpadAcceleration.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

void sub_100212348(uint64_t a1)
{
  HIDServiceClient.trackpadAcceleration.setter(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

void HIDServiceClient.trackpadAcceleration.setter(uint64_t a1, char a2)
{
  sub_100212734(a1, a2 & 1, 23, 0x800000010025AD20);
}

void HIDServiceClient.trackpadAcceleration.modify(uint64_t a1)
{
  uint64_t v1;
  char v2;

  sub_10021274C(a1);
  v1 = sub_10021273C();
  sub_1002060D8(v1, v2);
  sub_1000050D4();
}

void sub_1002123D4(uint64_t a1, uint64_t a2)
{
  sub_10021272C(a1, a2, 23, 0x800000010025AD20);
}

uint64_t HIDServiceClient.trackpadScrollAcceleration.getter()
{
  return sub_10021273C();
}

uint64_t sub_100212418@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = HIDServiceClient.trackpadScrollAcceleration.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

void sub_100212448(uint64_t a1)
{
  HIDServiceClient.trackpadScrollAcceleration.setter(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

void HIDServiceClient.trackpadScrollAcceleration.setter(uint64_t a1, char a2)
{
  sub_100212734(a1, a2 & 1, 29, 0x800000010025AD40);
}

void HIDServiceClient.trackpadScrollAcceleration.modify(uint64_t a1)
{
  uint64_t v1;
  char v2;

  sub_10021274C(a1);
  v1 = sub_10021273C();
  sub_1002060D8(v1, v2);
  sub_1000050D4();
}

void sub_1002124D4(uint64_t a1, uint64_t a2)
{
  sub_10021272C(a1, a2, 29, 0x800000010025AD40);
}

void sub_1002124EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_100212070(*(_QWORD *)a1, *(_BYTE *)(a1 + 8), a3, a4);
}

id sub_100212518(uint64_t a1)
{
  void *v1;
  NSDictionary v2;
  id v3;

  if (a1)
    v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  else
    v2.super.isa = 0;
  v3 = objc_msgSend(v1, "eventMatching:", v2.super.isa);

  return v3;
}

id sub_100212588(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  __n128 v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSString v9;
  id v10;
  _QWORD v12[3];
  uint64_t v13;

  sub_1001E72DC(a1, (uint64_t)v12);
  v2 = v13;
  if (v13)
  {
    v3 = sub_10000DBE4(v12, v13);
    v4 = *(_QWORD *)(v2 - 8);
    v5 = __chkstk_darwin(v3);
    v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v4 + 16))(v7, v5);
    v8 = _bridgeAnythingToObjectiveC<A>(_:)(v7, v2);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v2);
    sub_100005988(v12);
  }
  else
  {
    v8 = 0;
  }
  v9 = sub_100212744();
  v10 = objc_msgSend(v1, "setProperty:forKey:", v8, v9);
  swift_unknownObjectRelease(v8);

  return v10;
}

double sub_1002126B4@<D0>(uint64_t a1@<X8>)
{
  NSString v2;
  id v3;
  double result;

  v2 = String._bridgeToObjectiveC()();
  v3 = sub_100206368((uint64_t)v2, "propertyForKey:");

  if (v3)
  {
    _bridgeAnyObjectToAny(_:)((_QWORD *)a1, v3);
    swift_unknownObjectRelease(v3);
  }
  else
  {
    result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

void sub_10021272C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1002124EC(a1, a2, a3 & 0xFFFFFFFFFFFFLL | 0xD000000000000000, a4);
}

void sub_100212734(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  sub_100212070(a1, a2, a3 & 0xFFFFFFFFFFFFLL | 0xD000000000000000, a4);
}

uint64_t sub_10021273C()
{
  return sub_100211F84();
}

NSString sub_100212744()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10021274C(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(result + 16) = v1;
  return result;
}

uint64_t PointerEvent.init(time:point:buttonMask:oldButtonMask:flags:)(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, double a5, double a6, double a7)
{
  uint64_t v7;
  id v8;
  uint64_t result;

  if (HIDWORD(a2) || HIDWORD(a3))
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Not enough bits to represent the passed value", 45, 2, "Swift/Integers.swift", 20);
    __break(1u);
  }
  else
  {
    v8 = (id)IOHIDEventCreateRelativePointerEvent(0, a1, a2, a3, a4, a5, a6, a7);
    sub_10000E538();
    return v7;
  }
  return result;
}

void PointerEvent.x.getter(void *a1)
{
  IOHIDEventGetFloatValue(a1, 1114112);
  sub_1001F42E8();
  sub_1001A4570();
}

void PointerEvent.x.setter(void *a1)
{
  id v1;

  v1 = sub_1001F42F0(a1);
  sub_1001F42C0((uint64_t)v1, 1114112);
  sub_1002106FC(v1);
}

void PointerEvent.x.modify(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v4 = sub_1001F4290(a1, a2);
  IOHIDEventGetFloatValue(v4, 1114112);
  sub_1001F42E0();
  *v2 = v3;
  sub_1001A4570();
}

void sub_10021289C(uint64_t a1, uint64_t a2)
{
  sub_100212CDC(a1, a2, 1114112);
}

void PointerEvent.y.getter(void *a1)
{
  sub_100212E84((uint64_t)a1, 1u);
  sub_1001F42E8();
  sub_1001A4570();
}

void PointerEvent.y.setter(void *a1)
{
  id v1;

  v1 = sub_1001F42F0(a1);
  sub_1001F42C0((uint64_t)v1, 1114113);
  sub_1002106FC(v1);
}

void PointerEvent.y.modify(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v4 = sub_1001F4290(a1, a2);
  sub_100212E84((uint64_t)v4, 1u);
  sub_1001F42E0();
  *v2 = v3;
  sub_1001A4570();
}

void sub_100212944(uint64_t a1, uint64_t a2)
{
  sub_100212E7C(a1, a2, 1u);
}

void PointerEvent.z.getter(void *a1)
{
  sub_100212E84((uint64_t)a1, 2u);
  sub_1001F42E8();
  sub_1001A4570();
}

void PointerEvent.z.setter(void *a1)
{
  id v1;

  v1 = sub_1001F42F0(a1);
  sub_1001F42C0((uint64_t)v1, 1114114);
  sub_1002106FC(v1);
}

void PointerEvent.z.modify(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v4 = sub_1001F4290(a1, a2);
  sub_100212E84((uint64_t)v4, 2u);
  sub_1001F42E0();
  *v2 = v3;
  sub_1001A4570();
}

void sub_1002129EC(uint64_t a1, uint64_t a2)
{
  sub_100212E7C(a1, a2, 2u);
}

void PointerEvent.buttonMask.getter(void *a1)
{
  sub_100212EA4((uint64_t)a1);
  sub_10000E538();
  sub_1000050D4();
}

void PointerEvent.buttonMask.setter(int a1, void *a2)
{
  id v2;
  void *v3;

  v2 = sub_100210704(a1, a2);
  sub_100212E68((uint64_t)v2);
  sub_1002106FC(v3);
}

void PointerEvent.buttonMask.modify(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v4 = sub_1001F4290(a1, a2);
  sub_100212EA4((uint64_t)v4);
  sub_1001F7F68();
  *v2 = v3;
  sub_10000B350();
}

void sub_100212A80(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = sub_1001F8114(*(void **)(a1 + 8));
  sub_100212E68((uint64_t)v1);
  sub_1002106FC(v2);
}

void PointerEvent.buttonClickCount.getter(void *a1)
{
  IOHIDEventGetIntegerValue(a1, 131074);
  sub_10000E538();
  sub_1000050D4();
}

void PointerEvent.buttonClickCount.setter(uint64_t a1, void *a2)
{
  id v3;

  v3 = sub_100210704(a1, a2);
  IOHIDEventSetIntegerValue(v3, 131074, a1);
  sub_1002106FC(v3);
}

void PointerEvent.buttonClickCount.modify(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v4 = sub_1001F4290(a1, a2);
  IOHIDEventGetIntegerValue(v4, 131074);
  sub_1001F7F68();
  *v2 = v3;
  sub_10000B350();
}

void sub_100212B4C(uint64_t *a1, uint64_t a2)
{
  sub_100212BFC(a1, a2, 131074);
}

void PointerEvent.buttonNumber.getter(void *a1)
{
  sub_100212E8C((uint64_t)a1);
  sub_10000E538();
  sub_1000050D4();
}

void PointerEvent.buttonNumber.setter(uint64_t a1, void *a2)
{
  id v3;

  v3 = sub_100210704(a1, a2);
  IOHIDEventSetIntegerValue(v3, 131073, a1);
  sub_1002106FC(v3);
}

void PointerEvent.buttonNumber.modify(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v4 = sub_1001F4290(a1, a2);
  sub_100212E8C((uint64_t)v4);
  sub_1001F7F68();
  *v2 = v3;
  sub_10000B350();
}

void sub_100212BF0(uint64_t *a1, uint64_t a2)
{
  sub_100212BFC(a1, a2, 131073);
}

void sub_100212BFC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  id v5;

  v4 = *a1;
  v5 = sub_1001F8114((void *)a1[1]);
  IOHIDEventSetIntegerValue(v5, a3, v4);
  sub_1002106FC(v5);
}

void PointerEvent.buttonPressure.getter(void *a1)
{
  sub_100212E98((uint64_t)a1);
  sub_1001F42E8();
  sub_1001A4570();
}

void PointerEvent.buttonPressure.setter(void *a1)
{
  id v1;

  v1 = sub_1001F42F0(a1);
  sub_1001F42C0((uint64_t)v1, 131075);
  sub_1002106FC(v1);
}

void PointerEvent.buttonPressure.modify(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v4 = sub_1001F4290(a1, a2);
  sub_100212E98((uint64_t)v4);
  sub_1001F42E0();
  *v2 = v3;
  sub_1001A4570();
}

void sub_100212CD0(uint64_t a1, uint64_t a2)
{
  sub_100212CDC(a1, a2, 131075);
}

void sub_100212CDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  v4 = sub_1001F8114(*(void **)(a1 + 8));
  sub_1001F42C0((uint64_t)v4, a3);

}

void sub_100212D24(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v2 = (void *)sub_1001F42F8(a1);
  PointerEvent.x.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_100212D44(uint64_t a1, void **a2)
{
  PointerEvent.x.setter(*a2);
}

void sub_100212D50(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v2 = (void *)sub_1001F42F8(a1);
  PointerEvent.y.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_100212D70(uint64_t a1, void **a2)
{
  PointerEvent.y.setter(*a2);
}

void sub_100212D7C(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v2 = (void *)sub_1001F42F8(a1);
  PointerEvent.z.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_100212D9C(uint64_t a1, void **a2)
{
  PointerEvent.z.setter(*a2);
}

void sub_100212DA8(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v2 = (void *)sub_1001F42F8(a1);
  PointerEvent.buttonMask.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_100212DC8(_QWORD *a1, void **a2)
{
  PointerEvent.buttonMask.setter(*a1, *a2);
}

void sub_100212DD4(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v2 = (void *)sub_1001F42F8(a1);
  PointerEvent.buttonClickCount.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_100212DF4(uint64_t *a1, void **a2)
{
  PointerEvent.buttonClickCount.setter(*a1, *a2);
}

void sub_100212E00(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v2 = (void *)sub_1001F42F8(a1);
  PointerEvent.buttonNumber.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_100212E20(uint64_t *a1, void **a2)
{
  PointerEvent.buttonNumber.setter(*a1, *a2);
}

void sub_100212E2C(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v2 = (void *)sub_1001F42F8(a1);
  PointerEvent.buttonPressure.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_100212E4C(uint64_t a1, void **a2)
{
  PointerEvent.buttonPressure.setter(*a2);
}

ValueMetadata *type metadata accessor for PointerEvent()
{
  return &type metadata for PointerEvent;
}

uint64_t sub_100212E68(uint64_t a1)
{
  uint64_t v1;

  return IOHIDEventSetIntegerValue(a1, 1114115, v1);
}

void sub_100212E7C(uint64_t a1, uint64_t a2, unsigned __int16 a3)
{
  sub_100212CDC(a1, a2, a3 | 0x110000u);
}

uint64_t sub_100212E84(uint64_t a1, unsigned __int16 a2)
{
  return IOHIDEventGetFloatValue(a1, a2 | 0x110000u);
}

uint64_t sub_100212E8C(uint64_t a1)
{
  return IOHIDEventGetIntegerValue(a1, 131073);
}

uint64_t sub_100212E98(uint64_t a1)
{
  return IOHIDEventGetFloatValue(a1, 131075);
}

uint64_t sub_100212EA4(uint64_t a1)
{
  return IOHIDEventGetIntegerValue(a1, 1114115);
}

Swift::Void __swiftcall HIDEventSystemClient.canceled()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v8 = sub_10000F730(v0, v1, v2, v3, v4, v5, v6, v7, (uint64_t)_NSConcreteStackBlock);
  sub_100213018((uint64_t)v8, "setCancelHandler:");
  sub_100213034();
  sub_100213024();
  v17 = sub_10000F730(v9, v10, v11, v12, v13, v14, v15, v16, v36);
  sub_100213018((uint64_t)v17, "setServiceNotificationHandler:");
  sub_100213034();
  sub_100213024();
  v26 = sub_10000F730(v18, v19, v20, v21, v22, v23, v24, v25, v37);
  sub_100213018((uint64_t)v26, "setEventHandler:");
  sub_100213034();
  sub_100213024();
  v35 = sub_10000F730(v27, v28, v29, v30, v31, v32, v33, v34, v38);
  sub_100213018((uint64_t)v35, "setServiceNotificationHandler:");
  sub_100213034();
}

uint64_t sub_100212FD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100212FE4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t IOHIDEventSystemConnectionType.stringValue.getter()
{
  uint64_t TypeString;

  TypeString = IOHIDEventSystemConnectionGetTypeString();
  return String.init(cString:)(TypeString);
}

id sub_100213018(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

void sub_100213034()
{
  const void *v0;

  _Block_release(v0);
}

void FluidTouchGestureEvent.init(time:swipeMask:gestureMotion:flavor:delta:progress:flags:)(uint64_t a1, unsigned int a2, unsigned __int16 a3, unsigned __int16 a4, double a5, double a6, double a7, double a8)
{
  void *FluidTouchGestureEvent;
  id v10;
  id v11;

  FluidTouchGestureEvent = (void *)IOHIDEventCreateFluidTouchGestureEvent(0, a1, a3, a4, a8, a5, a6);
  v10 = FluidTouchGestureEvent;

  IOHIDEventSetIntegerValue(v10, 1769472, a2);
  v11 = FluidTouchGestureEvent;
  sub_100010BBC();
  sub_10000B350();
}

void FluidTouchGestureEvent.init(event:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = a1[3];
  v3 = a1[4];
  sub_10000DBE4(a1, v2);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3) == 27)
  {
    v4 = a1[3];
    v5 = a1[4];
    sub_10000DBE4(a1, v4);
    (*(void (**)(uint64_t, uint64_t))(v5 + 352))(v4, v5);
  }
  sub_100005988(a1);
  sub_10000B350();
}

void FluidTouchGestureEvent.x.getter(void *a1)
{
  sub_100213954((uint64_t)a1, 3u);
  sub_1001F42E8();
  sub_1001A4570();
}

void FluidTouchGestureEvent.x.setter(void *a1)
{
  id v1;

  v1 = sub_1001F42F0(a1);
  sub_100213974((uint64_t)v1, 3u);
  sub_1002106FC(v1);
}

void FluidTouchGestureEvent.x.modify(_QWORD *a1, void *a2)
{
  uint64_t v2;
  id v4;

  a1[1] = a2;
  v4 = sub_100210704((int)a1, a2);
  sub_100213954((uint64_t)v4, 3u);
  sub_1001F42E0();
  *a1 = v2;
  sub_1001A4570();
}

void sub_1002131E8(uint64_t a1, uint64_t a2)
{
  sub_10021394C(a1, a2, 3u);
}

void FluidTouchGestureEvent.y.getter(void *a1)
{
  sub_100213954((uint64_t)a1, 4u);
  sub_1001F42E8();
  sub_1001A4570();
}

void FluidTouchGestureEvent.y.setter(void *a1)
{
  id v1;

  v1 = sub_1001F42F0(a1);
  sub_100213974((uint64_t)v1, 4u);
  sub_1002106FC(v1);
}

void FluidTouchGestureEvent.y.modify(_QWORD *a1, void *a2)
{
  uint64_t v2;
  id v4;

  a1[1] = a2;
  v4 = sub_100210704((int)a1, a2);
  sub_100213954((uint64_t)v4, 4u);
  sub_1001F42E0();
  *a1 = v2;
  sub_1001A4570();
}

void sub_100213294(uint64_t a1, uint64_t a2)
{
  sub_10021394C(a1, a2, 4u);
}

void FluidTouchGestureEvent.progress.getter(void *a1)
{
  sub_100213954((uint64_t)a1, 2u);
  sub_1001F42E8();
  sub_1001A4570();
}

void FluidTouchGestureEvent.progress.setter(void *a1)
{
  id v1;

  v1 = sub_1001F42F0(a1);
  sub_100213974((uint64_t)v1, 2u);
  sub_1002106FC(v1);
}

void FluidTouchGestureEvent.progress.modify(_QWORD *a1, void *a2)
{
  uint64_t v2;
  id v4;

  a1[1] = a2;
  v4 = sub_100210704((int)a1, a2);
  sub_100213954((uint64_t)v4, 2u);
  sub_1001F42E0();
  *a1 = v2;
  sub_1001A4570();
}

void sub_100213340(uint64_t a1, uint64_t a2)
{
  sub_10021394C(a1, a2, 2u);
}

void FluidTouchGestureEvent.swipeMask.getter(void *a1)
{
  unint64_t v1;
  uint64_t v2;
  const char *v3;
  uint64_t v4;

  IOHIDEventGetIntegerValue(a1, 1769472);
  sub_100010BBC();
  if ((v1 & 0x8000000000000000) != 0)
  {
    sub_10006D098();
    v3 = "Negative value is not representable";
    v4 = 35;
  }
  else
  {
    if (!HIDWORD(v1))
    {
      sub_100015540();
      return;
    }
    sub_10006D098();
    v3 = "Not enough bits to represent the passed value";
    v4 = 45;
  }
  sub_1000E7388((uint64_t)"Fatal error", 11, 2, (uint64_t)v3, v4, v2, (uint64_t)"Swift/Integers.swift");
  __break(1u);
}

void FluidTouchGestureEvent.swipeMask.setter(unsigned int a1, void *a2)
{
  id v3;

  v3 = sub_100210704(a1, a2);
  IOHIDEventSetIntegerValue(v3, 1769472, a1);
  sub_1002106FC(v3);
}

void FluidTouchGestureEvent.swipeMask.modify(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  int v4;

  v3 = (void *)sub_100213990(a1, a2);
  FluidTouchGestureEvent.swipeMask.getter(v3);
  *(_DWORD *)(v2 + 8) = v4;
  sub_1000050D4();
}

void sub_10021344C(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned int *)(a1 + 8);
  v2 = sub_1001F8114(*(void **)a1);
  IOHIDEventSetIntegerValue(v2, 1769472, v1);
  sub_1002106FC(v2);
}

void FluidTouchGestureEvent.gestureMotion.getter(void *a1)
{
  sub_100213980(a1, 1u);
}

void FluidTouchGestureEvent.gestureMotion.setter(int a1, void *a2)
{
  unsigned __int16 v2;
  id v3;

  v2 = a1;
  v3 = sub_100210704(a1, a2);
  IOHIDEventSetIntegerValue(v3, 1769473, v2);
  sub_1002106FC(v3);
}

void FluidTouchGestureEvent.gestureMotion.modify(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  __int16 v4;

  v3 = (void *)sub_100213990(a1, a2);
  FluidTouchGestureEvent.gestureMotion.getter(v3);
  *(_WORD *)(v2 + 8) = v4;
  sub_1000050D4();
}

void sub_1002134F8(uint64_t a1, uint64_t a2)
{
  sub_100213988(a1, a2, 1u);
}

void FluidTouchGestureEvent.flavor.getter(void *a1)
{
  sub_100213980(a1, 5u);
}

void sub_100213508(void *a1, unint64_t a2)
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;

  IOHIDEventGetIntegerValue(a1, a2);
  sub_100010BBC();
  if ((a2 & 0x8000000000000000) != 0)
  {
    sub_10006D098();
    v4 = "Negative value is not representable";
    v5 = 35;
  }
  else
  {
    if (a2 < 0x10000)
    {
      sub_100015540();
      return;
    }
    sub_10006D098();
    v4 = "Not enough bits to represent the passed value";
    v5 = 45;
  }
  sub_1000E7388((uint64_t)"Fatal error", 11, 2, (uint64_t)v4, v5, v3, (uint64_t)"Swift/Integers.swift");
  __break(1u);
}

void FluidTouchGestureEvent.flavor.setter(int a1, void *a2)
{
  unsigned __int16 v2;
  id v3;

  v2 = a1;
  v3 = sub_100210704(a1, a2);
  IOHIDEventSetIntegerValue(v3, 1769477, v2);
  sub_1002106FC(v3);
}

void FluidTouchGestureEvent.flavor.modify(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  __int16 v4;

  v3 = (void *)sub_100213990(a1, a2);
  FluidTouchGestureEvent.flavor.getter(v3);
  *(_WORD *)(v2 + 8) = v4;
  sub_1000050D4();
}

void sub_100213614(uint64_t a1, uint64_t a2)
{
  sub_100213988(a1, a2, 5u);
}

void sub_10021361C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  id v5;

  v4 = *(unsigned __int16 *)(a1 + 8);
  v5 = sub_1001F8114(*(void **)a1);
  IOHIDEventSetIntegerValue(v5, a3, v4);
  sub_1002106FC(v5);
}

void sub_10021365C(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  FluidTouchGestureEvent.init(event:)(a1);
  *a2 = v3;
}

double FluidTouchGestureEvent.delta.getter(void *a1)
{
  double v1;
  id v2;

  sub_100213954((uint64_t)a1, 3u);
  sub_1001F42E8();
  v2 = sub_1002107E4();
  IOHIDEventGetFloatValue(v2, 1769476);

  return v1;
}

void sub_1002136E0(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  *(double *)a2 = FluidTouchGestureEvent.delta.getter(*a1);
  *(_QWORD *)(a2 + 8) = v3;
  *(_QWORD *)(a2 + 16) = 0;
}

void sub_10021370C(double *a1, void **a2)
{
  FluidTouchGestureEvent.delta.setter(*a2, *a1);
}

void FluidTouchGestureEvent.delta.setter(void *a1, double a2)
{
  void *v2;
  int v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = a1;
  sub_10021395C();
  IOHIDEventSetFloatValue(v6, v7, a2);

  v8 = sub_1002107E4();
  sub_1001F42C0((uint64_t)v8, (v3 + 1));
  sub_100210714(v8);
}

void (*FluidTouchGestureEvent.delta.modify(double *a1, void *a2))(uint64_t a1)
{
  uint64_t v2;
  id v4;
  id v5;
  double FloatValue;

  *((_QWORD *)a1 + 3) = a2;
  v4 = sub_100210704((int)a1, a2);
  sub_100213954((uint64_t)v4, 3u);
  sub_1001F42E0();
  v5 = v4;
  FloatValue = IOHIDEventGetFloatValue(v5, 1769476);

  *(_QWORD *)a1 = v2;
  a1[1] = FloatValue;
  a1[2] = 0.0;
  return sub_1002137E0;
}

void sub_1002137E0(uint64_t a1)
{
  void *v1;
  int v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(double *)(a1 + 8);
  sub_1001F8114(*(void **)(a1 + 24));
  sub_10021395C();
  sub_1001F42C0(v4, v5);

  v6 = sub_1002107E4();
  IOHIDEventSetFloatValue(v6, (v2 + 1), v3);
  sub_100210714(v6);
}

void sub_10021382C(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v2 = (void *)sub_1001F42F8(a1);
  FluidTouchGestureEvent.x.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_10021384C(uint64_t a1, void **a2)
{
  FluidTouchGestureEvent.x.setter(*a2);
}

void sub_100213858(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v2 = (void *)sub_1001F42F8(a1);
  FluidTouchGestureEvent.y.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_100213878(uint64_t a1, void **a2)
{
  FluidTouchGestureEvent.y.setter(*a2);
}

void sub_100213884(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v2 = (void *)sub_1001F42F8(a1);
  FluidTouchGestureEvent.progress.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_1002138A4(uint64_t a1, void **a2)
{
  FluidTouchGestureEvent.progress.setter(*a2);
}

void sub_1002138B0(uint64_t a1)
{
  _DWORD *v1;
  void *v2;
  int v3;

  v2 = (void *)sub_1001F42F8(a1);
  FluidTouchGestureEvent.swipeMask.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_1002138D0(unsigned int *a1, void **a2)
{
  FluidTouchGestureEvent.swipeMask.setter(*a1, *a2);
}

void sub_1002138DC(uint64_t a1)
{
  _WORD *v1;
  void *v2;
  __int16 v3;

  v2 = (void *)sub_1001F42F8(a1);
  FluidTouchGestureEvent.gestureMotion.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_1002138FC(unsigned __int16 *a1, void **a2)
{
  FluidTouchGestureEvent.gestureMotion.setter(*a1, *a2);
}

void sub_100213908(uint64_t a1)
{
  _WORD *v1;
  void *v2;
  __int16 v3;

  v2 = (void *)sub_1001F42F8(a1);
  FluidTouchGestureEvent.flavor.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_100213928(unsigned __int16 *a1, void **a2)
{
  FluidTouchGestureEvent.flavor.setter(*a1, *a2);
}

ValueMetadata *type metadata accessor for FluidTouchGestureEvent()
{
  return &type metadata for FluidTouchGestureEvent;
}

void sub_10021394C(uint64_t a1, uint64_t a2, unsigned __int16 a3)
{
  sub_10020FABC(a1, a2, a3 | 0x1B0000u);
}

uint64_t sub_100213954(uint64_t a1, unsigned __int16 a2)
{
  return IOHIDEventGetFloatValue(a1, a2 | 0x1B0000u);
}

uint64_t sub_100213974(uint64_t a1, unsigned __int16 a2)
{
  double v2;

  return IOHIDEventSetFloatValue(a1, a2 | 0x1B0000u, v2);
}

void sub_100213980(void *a1, unsigned __int16 a2)
{
  sub_100213508(a1, a2 | 0x1B0000u);
}

void sub_100213988(uint64_t a1, uint64_t a2, unsigned __int16 a3)
{
  sub_10021361C(a1, a2, a3 | 0x1B0000u);
}

uint64_t sub_100213990(_QWORD *a1, uint64_t a2)
{
  *a1 = a2;
  return a2;
}

BOOL static HIDPoint.== infix(_:_:)(__n128 a1, double a2, double a3, __n128 a4, double a5, double a6)
{
  uint64_t v6;
  uint64_t v7;
  double v8;
  _BOOL8 result;
  _OWORD v10[2];
  _OWORD v11[2];

  v6 = 0;
  a1.n128_f64[1] = a2;
  a4.n128_f64[1] = a5;
LABEL_2:
  v11[0] = a1;
  v11[1] = *(unint64_t *)&a3;
  v7 = 8 * (v6 & 3);
  v8 = *(double *)((char *)v11 + v7);
  v10[0] = a4;
  v10[1] = *(unint64_t *)&a6;
  result = v8 == *(double *)((char *)v10 + v7);
  while (v6 != 2)
  {
    ++v6;
    if (result)
      goto LABEL_2;
    result = 0;
  }
  return result;
}

BOOL sub_100213A30(uint64_t a1, uint64_t a2, __n128 a3, double a4, double a5, __n128 a6)
{
  a3.n128_u64[0] = *(_QWORD *)a1;
  a6.n128_u64[0] = *(_QWORD *)a2;
  return static HIDPoint.== infix(_:_:)(a3, *(double *)(a1 + 8), *(double *)(a1 + 16), a6, *(double *)(a2 + 8), *(double *)(a2 + 16));
}

void HIDPoint.hash(into:)(__n128 a1, double a2, double a3)
{
  a1.n128_f64[1] = a2;
  sub_100213A54(a1, a3);
}

void sub_100213A54(__n128 a1, double a2)
{
  Swift::UInt64 v2;
  Swift::UInt64 v3;
  Swift::UInt64 v4;
  unint64_t v5;

  v5 = a1.n128_u64[1];
  if ((a1.n128_u64[0] & 0x7FFFFFFFFFFFFFFFLL) != 0)
    v2 = a1.n128_u64[0];
  else
    v2 = 0;
  Hasher._combine(_:)(v2);
  if ((v5 & 0x7FFFFFFFFFFFFFFFLL) != 0)
    v3 = v5;
  else
    v3 = 0;
  Hasher._combine(_:)(v3);
  if ((*(_QWORD *)&a2 & 0x7FFFFFFFFFFFFFFFLL) != 0)
    v4 = *(_QWORD *)&a2;
  else
    v4 = 0;
  Hasher._combine(_:)(v4);
}

Swift::Int HIDPoint.hashValue.getter(double a1, double a2, double a3)
{
  __n128 v3;
  _QWORD v8[9];

  Hasher.init(_seed:)(v8, 0);
  v3.n128_f64[0] = a1;
  v3.n128_f64[1] = a2;
  sub_100213A54(v3, a3);
  return Hasher._finalize()();
}

Swift::Int sub_100213B0C()
{
  double *v0;

  return HIDPoint.hashValue.getter(*v0, v0[1], v0[2]);
}

void sub_100213B18(__n128 a1)
{
  uint64_t v1;

  a1.n128_u64[0] = *(_QWORD *)v1;
  HIDPoint.hash(into:)(a1, *(double *)(v1 + 8), *(double *)(v1 + 16));
}

Swift::Int sub_100213B24(uint64_t a1)
{
  __n128 *v1;
  double v3;
  __n128 v4;
  _QWORD v5[9];

  v3 = v1[1].n128_f64[0];
  v4 = *v1;
  Hasher.init(_seed:)(v5, a1);
  sub_100213A54(v4, v3);
  return Hasher._finalize()();
}

uint64_t static HIDPoint.+= infix(_:_:)(double *a1, double a2, double a3, double a4)
{
  double v4;
  double v5;
  double v6;

  v4 = *a1 + a2;
  v5 = a1[1] + a3;
  v6 = a1[2] + a4;
  *a1 = v4;
  a1[1] = v5;
  return sub_100213D64((uint64_t)a1, v4, v5, v6);
}

uint64_t static HIDPoint.-= infix(_:_:)(double *a1, double a2, double a3, double a4)
{
  double v4;
  double v5;
  double v6;

  v4 = *a1 - a2;
  v5 = a1[1] - a3;
  v6 = a1[2] - a4;
  *a1 = v4;
  a1[1] = v5;
  return sub_100213D64((uint64_t)a1, v4, v5, v6);
}

uint64_t static HIDPoint.*= infix(_:_:)(float64x2_t *a1, float64x2_t a2, double a3, double a4)
{
  double v4;
  float64x2_t v5;

  v4 = a1[1].f64[0] * a4;
  a2.f64[1] = a3;
  v5 = vmulq_f64(*a1, a2);
  *a1 = v5;
  return sub_100213D64((uint64_t)a1, v5.f64[0], a3, v4);
}

uint64_t static HIDPoint./= infix(_:_:)(float64x2_t *a1, float64x2_t a2, double a3, double a4)
{
  double v4;
  float64x2_t v5;

  v4 = a1[1].f64[0] / a4;
  a2.f64[1] = a3;
  v5 = vdivq_f64(*a1, a2);
  *a1 = v5;
  return sub_100213D64((uint64_t)a1, v5.f64[0], a3, v4);
}

float64x2_t static HIDPoint./= infix(_:_:)(float64x2_t *a1, double a2)
{
  float64_t v2;
  float64x2_t result;

  v2 = a1[1].f64[0] / a2;
  result = vdivq_f64(*a1, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a2, 0));
  *a1 = result;
  a1[1].f64[0] = v2;
  return result;
}

float64_t static HIDPoint./= infix(_:_:)(float64x2_t *a1, uint64_t a2)
{
  float64_t result;

  result = a1[1].f64[0] / (double)a2;
  *a1 = vdivq_f64(*a1, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)a2), 0));
  a1[1].f64[0] = result;
  return result;
}

double static HIDPoint.+ infix(_:_:)(double a1, double a2, double a3, double a4)
{
  return a1 + a4;
}

double static HIDPoint.- infix(_:_:)(double a1, double a2, double a3, double a4)
{
  return a1 - a4;
}

double static HIDPoint.* infix(_:_:)(double a1, double a2, double a3, double a4)
{
  return a1 * a4;
}

{
  return a1 * a4;
}

double static HIDPoint./ infix(_:_:)(double a1, double a2, double a3, double a4)
{
  return a1 / a4;
}

uint64_t HIDPoint.description.getter()
{
  uint64_t v0;
  unint64_t v1;

  v0 = sub_1000055B0(&qword_1002B6C20);
  v1 = sub_100213CC4();
  return SIMD.description.getter(v0, v1);
}

unint64_t sub_100213CC4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1002B6C28;
  if (!qword_1002B6C28)
  {
    v1 = sub_10000DCA0(&qword_1002B6C20);
    result = swift_getWitnessTable(&protocol conformance descriptor for SIMD3<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1002B6C28);
  }
  return result;
}

unint64_t sub_100213D0C()
{
  unint64_t result;

  result = qword_1002B6C30;
  if (!qword_1002B6C30)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDPoint, &type metadata for HIDPoint);
    atomic_store(result, (unint64_t *)&qword_1002B6C30);
  }
  return result;
}

uint64_t sub_100213D48()
{
  return HIDPoint.description.getter();
}

ValueMetadata *type metadata accessor for HIDPoint()
{
  return &type metadata for HIDPoint;
}

uint64_t sub_100213D64(uint64_t result, double a2, double a3, double a4)
{
  *(double *)(result + 16) = a4;
  return result;
}

void VendorDefinedEvent.init<A>(timestamp:usage:version:data:flags:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __asm { BR              X10 }
}

_QWORD *sub_100213DC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v7;

  v4 = sub_100214290(v3, v2 & 0xFFFFFFFFFFFFLL, (_QWORD *(*)(uint64_t *__return_ptr, uint64_t *, char *))sub_100214048, (uint64_t)&v7, BYTE6(v2));
  v5 = v4;
  sub_100214384();

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 8))(v1, v0);
  return v5;
}

uint64_t sub_100213EF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X4>, unsigned int a5@<W5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t *a8@<X8>)
{
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t result;
  const char *v19;
  uint64_t v20;

  v15 = dispatch thunk of HIDUsageProtocol.page.getter(a6, a7);
  if ((v15 & 0x8000000000000000) == 0)
  {
    v16 = v15;
    if (HIDWORD(v15))
      goto LABEL_11;
    v17 = dispatch thunk of HIDUsageProtocol.usage.getter(a6, a7);
    if ((v17 & 0x8000000000000000) == 0)
    {
      if (HIDWORD(v17))
        goto LABEL_11;
      if ((a4 & 0x8000000000000000) == 0)
      {
        if (!HIDWORD(a4))
        {
          if (a1)
          {
            result = IOHIDEventCreateVendorDefinedEvent(0, a3, v16, v17, a4, a1, a2 - a1, a5);
            *a8 = result;
            return result;
          }
          __break(1u);
          goto LABEL_10;
        }
LABEL_11:
        v19 = "Not enough bits to represent the passed value";
        v20 = 45;
        goto LABEL_12;
      }
    }
  }
LABEL_10:
  v19 = "Negative value is not representable";
  v20 = 35;
LABEL_12:
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v19, v20, 2, "Swift/Integers.swift", 20);
  __break(1u);
  return result;
}

uint64_t sub_100214048@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;

  return sub_100213EF0(a1, a2, *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 48), *(_DWORD *)(v3 + 56), *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), a3);
}

uint64_t VendorDefinedEvent.data.getter(void *a1)
{
  id v1;
  uint64_t IntegerValue;
  uint64_t DataValue;
  uint64_t v4;

  v1 = a1;
  IntegerValue = IOHIDEventGetIntegerValue(v1, 65539);
  DataValue = IOHIDEventGetDataValue(v1, 65540);
  v4 = sub_10004091C(DataValue, DataValue + IntegerValue);

  return v4;
}

void VendorDefinedEvent.withUnsafeBytes<A>(_:)(void (*a1)(uint64_t, uint64_t), int a2, id a3)
{
  id v4;
  uint64_t IntegerValue;
  uint64_t DataValue;

  v4 = a3;
  IntegerValue = IOHIDEventGetIntegerValue(v4, 65539);
  DataValue = IOHIDEventGetDataValue(v4, 65540);
  a1(DataValue, DataValue + IntegerValue);

}

uint64_t VendorDefinedEvent.usage.getter(void *a1)
{
  id v1;
  unsigned __int16 IntegerValue;
  unsigned __int16 v3;

  v1 = a1;
  IntegerValue = IOHIDEventGetIntegerValue(v1, 0x10000);
  v3 = IOHIDEventGetIntegerValue(v1, 65537);

  return IntegerValue | (v3 << 16);
}

uint64_t VendorDefinedEvent.version.getter(void *a1)
{
  id v1;
  uint64_t IntegerValue;

  v1 = a1;
  IntegerValue = IOHIDEventGetIntegerValue(v1, 65538);

  return IntegerValue;
}

_QWORD *sub_1002141E8(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, _QWORD *, char *))
{
  uint64_t v3;
  _QWORD *result;
  _QWORD *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  result = (_QWORD *)__DataStorage._bytes.getter();
  v8 = result;
  if (result)
  {
    result = (_QWORD *)__DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v8 = (_QWORD *)((char *)v8 + a1 - (_QWORD)result);
  }
  v9 = __OFSUB__(a2, a1);
  v10 = a2 - a1;
  if (v9)
  {
    __break(1u);
    goto LABEL_15;
  }
  v11 = __DataStorage._length.getter();
  if (v11 >= v10)
    v12 = v10;
  else
    v12 = v11;
  v13 = (char *)v8 + v12;
  if (v8)
    v14 = v13;
  else
    v14 = 0;
  result = a3(&v15, v8, v14);
  if (!v3)
    return (_QWORD *)v15;
  return result;
}

_QWORD *sub_100214290(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, uint64_t *, char *), uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *result;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v8 = a1;
  v9 = a2;
  v10 = BYTE2(a2);
  v11 = BYTE3(a2);
  v12 = BYTE4(a2);
  v13 = BYTE5(a2);
  result = a3(&v7, &v8, (char *)&v8 + a5);
  if (!v5)
    return (_QWORD *)v7;
  return result;
}

ValueMetadata *type metadata accessor for VendorDefinedEvent()
{
  return &type metadata for VendorDefinedEvent;
}

_QWORD *sub_100214378(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, _QWORD *, char *))
{
  return sub_1002141E8(a1, a2, a3);
}

uint64_t sub_100214384()
{
  unint64_t v0;
  uint64_t v1;

  return sub_100022AEC(v1, v0);
}

void ButtonEvent.init(time:buttons:pressure:flags:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  id v4;

  v4 = (id)IOHIDEventCreateButtonEventWithPressure(0, a1, a2, a3, a4);
  sub_10000E538();
  sub_1000050D4();
}

uint64_t ButtonEvent.init(event:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a1[3];
  v3 = a1[4];
  sub_10000DBE4(a1, v2);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3) == 2)
  {
    v4 = a1[3];
    v5 = a1[4];
    sub_10000DBE4(a1, v4);
    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 352))(v4, v5);
  }
  else
  {
    v6 = 0;
  }
  sub_100005988(a1);
  return v6;
}

void ButtonEvent.buttonClickCount.setter(int a1, void *a2)
{
  id v2;

  v2 = sub_100210704(a1, a2);
  sub_1002148E0((uint64_t)v2, 131074);
  sub_1002106FC(v2);
}

void ButtonEvent.buttonMask.getter(void *a1)
{
  IOHIDEventGetIntegerValue(a1, 0x20000);
  sub_10000E538();
  sub_1000050D4();
}

void ButtonEvent.buttonMask.setter(int a1, void *a2)
{
  id v2;

  v2 = sub_100210704(a1, a2);
  sub_1002148E0((uint64_t)v2, 0x20000);
  sub_1002106FC(v2);
}

void ButtonEvent.buttonMask.modify(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v4 = sub_1001F4290(a1, a2);
  IOHIDEventGetIntegerValue(v4, 0x20000);
  sub_1001F7F68();
  *v2 = v3;
  sub_10000B350();
}

void sub_100214528(uint64_t a1)
{
  id v1;

  v1 = sub_1001F8114(*(void **)(a1 + 8));
  sub_1002148E0((uint64_t)v1, 0x20000);
  sub_1002106FC(v1);
}

void ButtonEvent.buttonNumber.getter(void *a1)
{
  sub_1002148FC((uint64_t)a1, 1u);
  sub_10000E538();
  sub_1000050D4();
}

void ButtonEvent.buttonNumber.setter(int a1, void *a2)
{
  id v2;

  v2 = sub_100210704(a1, a2);
  sub_1002148E0((uint64_t)v2, 131073);
  sub_1002106FC(v2);
}

void ButtonEvent.buttonNumber.modify(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v4 = sub_1001F4290(a1, a2);
  sub_1002148FC((uint64_t)v4, 1u);
  sub_1001F7F68();
  *v2 = v3;
  sub_10000B350();
}

double ButtonEvent.buttonPressure.getter(void *a1)
{
  id v1;
  double v2;
  double v3;

  v1 = a1;
  sub_100212E98((uint64_t)v1);
  v3 = v2;

  return v3;
}

void ButtonEvent.buttonPressure.setter(void *a1)
{
  void *v1;

  sub_1002148E8((uint64_t)a1);
  sub_1002106FC(v1);
}

void (*ButtonEvent.buttonPressure.modify(uint64_t a1, void *a2))(uint64_t a1)
{
  _QWORD *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_1001F4290(a1, a2);
  sub_100212E98((uint64_t)v3);
  v5 = v4;

  *v2 = v5;
  return sub_1002146A4;
}

void sub_1002146A4(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = sub_1001F8114(*(void **)(a1 + 8));
  sub_1002148E8((uint64_t)v1);
  sub_1002106FC(v2);
}

BOOL ButtonEvent.buttonState.getter(void *a1)
{
  uint64_t v1;

  sub_1002148FC((uint64_t)a1, 4u);
  sub_10000E538();
  return v1 != 0;
}

void ButtonEvent.buttonState.setter(int a1, void *a2)
{
  char v2;
  id v3;

  v2 = a1;
  v3 = sub_100210704(a1, a2);
  IOHIDEventSetIntegerValue(v3, 131076, v2 & 1);
  sub_1002106FC(v3);
}

void ButtonEvent.buttonState.modify(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;

  *(_QWORD *)a1 = a2;
  v4 = sub_100210704(a1, a2);
  sub_1002148FC((uint64_t)v4, 4u);
  sub_1001F7F68();
  *(_BYTE *)(a1 + 8) = v2 != 0;
  sub_10000B350();
}

void sub_100214790(void **a1)
{
  id v1;

  v1 = sub_1001F8114(*a1);
  sub_1002148E0((uint64_t)v1, 131076);
  sub_1002106FC(v1);
}

uint64_t sub_1002147CC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = ButtonEvent.init(event:)(a1);
  *a2 = result;
  return result;
}

void sub_1002147F0(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v2 = (void *)sub_1001F42F8(a1);
  PointerEvent.buttonClickCount.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_100214810(_QWORD *a1, void **a2)
{
  ButtonEvent.buttonClickCount.setter(*a1, *a2);
}

void sub_10021481C(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v2 = (void *)sub_1001F42F8(a1);
  ButtonEvent.buttonMask.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_10021483C(_QWORD *a1, void **a2)
{
  ButtonEvent.buttonMask.setter(*a1, *a2);
}

void sub_100214848(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  v2 = (void *)sub_1001F42F8(a1);
  ButtonEvent.buttonNumber.getter(v2);
  *v1 = v3;
  sub_1000050D4();
}

void sub_100214868(_QWORD *a1, void **a2)
{
  ButtonEvent.buttonNumber.setter(*a1, *a2);
}

void sub_100214874(uint64_t a1)
{
  double *v1;
  void *v2;

  v2 = (void *)sub_1001F42F8(a1);
  *v1 = ButtonEvent.buttonPressure.getter(v2);
  sub_1000050D4();
}

void sub_100214894(uint64_t a1, void **a2)
{
  ButtonEvent.buttonPressure.setter(*a2);
}

void sub_1002148A0(uint64_t a1)
{
  BOOL *v1;
  void *v2;

  v2 = (void *)sub_1001F42F8(a1);
  *v1 = ButtonEvent.buttonState.getter(v2);
  sub_1000050D4();
}

void sub_1002148C4(unsigned __int8 *a1, void **a2)
{
  ButtonEvent.buttonState.setter(*a1, *a2);
}

ValueMetadata *type metadata accessor for ButtonEvent()
{
  return &type metadata for ButtonEvent;
}

uint64_t sub_1002148E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return IOHIDEventSetIntegerValue(a1, a2, v2);
}

uint64_t sub_1002148E8(uint64_t a1)
{
  double v1;

  return IOHIDEventSetFloatValue(a1, 131075, v1);
}

uint64_t sub_1002148FC(uint64_t a1, unsigned __int16 a2)
{
  return IOHIDEventGetIntegerValue(a1, a2 | 0x20000u);
}

void sub_100214908(uint64_t a1)
{
  char v1;

  if (*(_QWORD *)(a1 + 16))
  {
    do
      sub_1001D6060();
    while (!v1);
  }
  swift_bridgeObjectRelease();
  sub_1000050D4();
}

void sub_10021494C(uint64_t a1)
{
  char v1;

  if (*(_QWORD *)(a1 + 16))
  {
    do
      sub_1001D6060();
    while (!v1);
  }
  swift_bridgeObjectRelease();
  sub_1000050D4();
}

uint64_t sub_10021498C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t result;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = 0;
    v3 = (unsigned int *)(a1 + 32);
    while (1)
    {
      v5 = *v3++;
      v4 = v5;
      if (v5 >= 0x40)
        break;
      if (v4 == 63)
      {
        result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Negative value is not representable", 35, 2, "Swift/Integers.swift", 20);
        __break(1u);
        return result;
      }
      v6 = 1 << v4;
      if ((v6 & v2) == 0)
        goto LABEL_7;
LABEL_8:
      if (!--v1)
        goto LABEL_11;
    }
    v6 = 0;
LABEL_7:
    v2 |= v6;
    goto LABEL_8;
  }
  v2 = 0;
LABEL_11:
  swift_bridgeObjectRelease(a1);
  return v2;
}

Swift::Bool __swiftcall HIDEventMask.contains(_:)(HIDUtils::HIDEventType a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Bool result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a1.rawValue > 0x3F)
  {
    v2 = 0;
    return (v2 & v1) != 0;
  }
  if (a1.rawValue != 63)
  {
    v2 = 1 << SLOBYTE(a1.rawValue);
    return (v2 & v1) != 0;
  }
  sub_1002150E4();
  result = sub_1002150CC((uint64_t)"Fatal error", v4, v5, (uint64_t)"Negative value is not representable", v6, v7, (uint64_t)"Swift/Integers.swift");
  __break(1u);
  return result;
}

uint64_t HIDEventType.maskValue.getter(unsigned int a1)
{
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a1 >= 0x40)
    return 0;
  if (a1 != 63)
    return 1 << a1;
  sub_1002150E4();
  result = sub_1002150CC((uint64_t)"Fatal error", v2, v3, (uint64_t)"Negative value is not representable", v4, v5, (uint64_t)"Swift/Integers.swift");
  __break(1u);
  return result;
}

void __swiftcall HIDEventMask.insert(_:)(Swift::tuple_inserted_Bool_memberAfterInsert_HIDUtils_HIDEventType *__return_ptr retstr, HIDUtils::HIDEventType a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *v2;
  if (a2.rawValue > 0x40)
  {
    v4 = 0;
    goto LABEL_6;
  }
  if (a2.rawValue == 64)
    goto LABEL_7;
  if ((a2.rawValue & 0x3F) != 0x3FLL)
  {
    v4 = 1 << SLOBYTE(a2.rawValue);
LABEL_6:
    if ((v4 & v3) != 0)
    {
LABEL_8:
      sub_10000B338();
      return;
    }
LABEL_7:
    *v2 = HIDEventType.maskValue.getter(a2.rawValue) | v3;
    goto LABEL_8;
  }
  sub_1002150E4();
  sub_1002150CC((uint64_t)"Fatal error", v5, v6, (uint64_t)"Negative value is not representable", v7, v8, (uint64_t)"Swift/Integers.swift");
  __break(1u);
}

HIDUtils::HIDEventType_optional __swiftcall HIDEventMask.remove(_:)(HIDUtils::HIDEventType a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *v1;
  if (a1.rawValue > 0x40)
  {
    v3 = 0;
LABEL_6:
    if ((v3 & v2) != 0)
      *v1 = v2 & ~HIDEventType.maskValue.getter(a1.rawValue);
    goto LABEL_8;
  }
  if (a1.rawValue != 64)
  {
    if (a1.rawValue == 63)
    {
      sub_1002150E4();
      v4 = sub_1002150CC((uint64_t)"Fatal error", v5, v6, (uint64_t)"Negative value is not representable", v7, v8, (uint64_t)"Swift/Integers.swift");
      __break(1u);
      return (HIDUtils::HIDEventType_optional)v4;
    }
    v3 = 1 << SLOBYTE(a1.rawValue);
    goto LABEL_6;
  }
LABEL_8:
  sub_10000B338();
  return (HIDUtils::HIDEventType_optional)v4;
}

HIDUtils::HIDEventType_optional __swiftcall HIDEventMask.update(with:)(HIDUtils::HIDEventType with)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *v1;
  if (with.rawValue <= 0x40)
  {
    if (with.rawValue == 64)
    {
LABEL_7:
      *v1 = HIDEventType.maskValue.getter(with.rawValue) | v2;
      goto LABEL_8;
    }
    if (with.rawValue == 63)
    {
      sub_1002150E4();
      v4 = sub_1002150CC((uint64_t)"Fatal error", v5, v6, (uint64_t)"Negative value is not representable", v7, v8, (uint64_t)"Swift/Integers.swift");
      __break(1u);
      return (HIDUtils::HIDEventType_optional)v4;
    }
    v3 = 1 << SLOBYTE(with.rawValue);
  }
  else
  {
    v3 = 0;
  }
  if ((v3 & v2) == 0)
    goto LABEL_7;
LABEL_8:
  sub_10000B338();
  return (HIDUtils::HIDEventType_optional)v4;
}

BOOL sub_100214CDC(HIDUtils::HIDEventType *a1)
{
  return HIDEventMask.contains(_:)((HIDUtils::HIDEventType)a1->rawValue);
}

void sub_100214CE8(_DWORD *a1@<X0>, HIDUtils::HIDEventType *a2@<X1>, Swift::tuple_inserted_Bool_memberAfterInsert_HIDUtils_HIDEventType *a3@<X8>)
{
  int v4;

  HIDEventMask.insert(_:)(a3, (HIDUtils::HIDEventType)a2->rawValue);
  *a1 = v4;
  sub_1000050D4();
}

uint64_t sub_100214D14@<X0>(HIDUtils::HIDEventType *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;

  *(HIDUtils::HIDEventType_optional *)&result = HIDEventMask.remove(_:)((HIDUtils::HIDEventType)a1->rawValue);
  *(_DWORD *)a2 = result;
  *(_BYTE *)(a2 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t sub_100214D44@<X0>(HIDUtils::HIDEventType *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;

  *(HIDUtils::HIDEventType_optional *)&result = HIDEventMask.update(with:)((HIDUtils::HIDEventType)a1->rawValue);
  *(_DWORD *)a2 = result;
  *(_BYTE *)(a2 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t sub_100214D74@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = sub_10021498C(a1);
  *a2 = result;
  return result;
}

uint64_t HIDEventMask.description.getter(unint64_t a1)
{
  _UNKNOWN **v2;
  char *v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v2 = static HIDEventType.allCases.getter();
  v3 = (char *)v2[2];
  if (v3)
  {
    v4 = (unsigned int *)(v2 + 4);
    do
    {
      v6 = *v4++;
      v5 = v6;
      if (v6 < 0x40)
      {
        if (v5 == 63)
        {
          sub_1002150E4();
          result = sub_1002150CC((uint64_t)"Fatal error", v20, v21, (uint64_t)"Negative value is not representable", v22, v23, (uint64_t)"Swift/Integers.swift");
          __break(1u);
          return result;
        }
        if (((a1 >> v5) & 1) != 0)
        {
          if ((swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage) & 1) == 0)
            sub_1001F3774(0, _swiftEmptyArrayStorage[2] + 1, 1);
          v8 = _swiftEmptyArrayStorage[2];
          v7 = _swiftEmptyArrayStorage[3];
          if (v8 >= v7 >> 1)
            sub_1001F3774(v7 > 1, v8 + 1, 1);
          _swiftEmptyArrayStorage[2] = v8 + 1;
          *((_DWORD *)&_swiftEmptyArrayStorage[4] + v8) = v5;
        }
      }
      --v3;
    }
    while (v3);
  }
  swift_bridgeObjectRelease();
  v9 = _swiftEmptyArrayStorage[2];
  if (v9)
  {
    sub_100058678();
    v10 = 0;
    do
    {
      v11 = HIDEventType.description.getter(*((_DWORD *)&_swiftEmptyArrayStorage[4] + v10));
      v13 = v12;
      v14 = _swiftEmptyArrayStorage[2];
      if (v14 >= _swiftEmptyArrayStorage[3] >> 1)
        sub_100058678();
      ++v10;
      _swiftEmptyArrayStorage[2] = v14 + 1;
      v15 = &_swiftEmptyArrayStorage[2 * v14];
      v15[4] = v11;
      v15[5] = v13;
    }
    while (v9 != v10);
  }
  swift_release();
  v16 = sub_1000055B0((uint64_t *)&unk_1002AC160);
  v17 = sub_100065AF0();
  v18 = BidirectionalCollection<>.joined(separator:)(44, 0xE100000000000000, v16, v17);
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t sub_100214FB0()
{
  unint64_t *v0;

  return HIDEventMask.description.getter(*v0);
}

unint64_t sub_100214FBC()
{
  unint64_t result;

  result = qword_1002B6C38;
  if (!qword_1002B6C38)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDEventMask, &type metadata for HIDEventMask);
    atomic_store(result, (unint64_t *)&qword_1002B6C38);
  }
  return result;
}

unint64_t sub_100214FFC()
{
  unint64_t result;

  result = qword_1002B6C40;
  if (!qword_1002B6C40)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDEventMask, &type metadata for HIDEventMask);
    atomic_store(result, (unint64_t *)&qword_1002B6C40);
  }
  return result;
}

unint64_t sub_10021503C()
{
  unint64_t result;

  result = qword_1002B6C48;
  if (!qword_1002B6C48)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDEventMask, &type metadata for HIDEventMask);
    atomic_store(result, (unint64_t *)&qword_1002B6C48);
  }
  return result;
}

unint64_t sub_10021507C()
{
  unint64_t result;

  result = qword_1002B6C50;
  if (!qword_1002B6C50)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDEventMask, &type metadata for HIDEventMask);
    atomic_store(result, (unint64_t *)&qword_1002B6C50);
  }
  return result;
}

ValueMetadata *type metadata accessor for HIDEventMask()
{
  return &type metadata for HIDEventMask;
}

uint64_t sub_1002150CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return _assertionFailure(_:_:file:line:flags:)(a1, 11, 2, a4, 35, 2, a7, 20);
}

_UNKNOWN **static HIDEventType.allCases.getter()
{
  return &off_100295550;
}

uint64_t HIDEventType.description.getter(int a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = 1819047278;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      return 0x6544726F646E6576;
    case 2:
      return 0x6E6F74747562;
    case 3:
      return 0x6472616F6279656BLL;
    case 4:
      v3 = 0x6C736E617274;
      return v3 & 0xFFFFFFFFFFFFLL | 0x7461000000000000;
    case 5:
      return 0x6E6F697461746F72;
    case 6:
      return 0x6C6C6F726373;
    case 7:
      v4 = 1818321779;
      goto LABEL_37;
    case 8:
      return 1836019578;
    case 9:
      v5 = 0x69636F6C6576;
      goto LABEL_42;
    case 10:
      v3 = 0x746E6569726FLL;
      return v3 & 0xFFFFFFFFFFFFLL | 0x7461000000000000;
    case 11:
      return 0x657A697469676964;
    case 12:
      return 0xD000000000000012;
    case 13:
      return 0x6F72656C65636361;
    case 14:
      return 0x74696D69786F7270;
    case 15:
      return 0x74617265706D6574;
    case 16:
      v6 = 0x61676976616ELL;
      goto LABEL_44;
    case 17:
      return 0x7265746E696F70;
    case 18:
      return 0x73736572676F7270;
    case 19:
      return 0xD000000000000010;
    case 20:
      return 1869773159;
    case 21:
      return 0x737361706D6F63;
    case 22:
      return 0x67676F546D6F6F7ALL;
    case 23:
      return 0x706977536B636F64;
    case 24:
      return 0x63696C6F626D7973;
    case 25:
      return 0x7265776F70;
    case 26:
      return 6579564;
    case 27:
      return 0xD000000000000011;
    case 28:
      return 0x797261646E756F62;
    case 29:
      return 0x697274656D6F6962;
    case 30:
      return 0x65646F63696E75;
    case 31:
      return 0xD000000000000013;
    case 32:
      v4 = 1668444006;
LABEL_37:
      result = v4 & 0xFFFF0000FFFFFFFFLL | 0x6500000000;
      break;
    case 33:
      result = 0x63416E6F69746F6DLL;
      break;
    case 34:
      result = 0x65476E6F69746F6DLL;
      break;
    case 35:
      result = 0x746E6F43656D6167;
      break;
    case 36:
      v5 = 0x6964696D7568;
LABEL_42:
      result = v5 & 0xFFFFFFFFFFFFLL | 0x7974000000000000;
      break;
    case 37:
      v6 = 0x63656C6C6F63;
LABEL_44:
      result = v6 & 0xFFFFFFFFFFFFLL | 0x6974000000000000;
      break;
    case 38:
      result = 0x656E746867697262;
      break;
    case 39:
      result = 0x47636972656E6567;
      break;
    default:
      result = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for UInt32, &protocol witness table for UInt32);
      break;
  }
  return result;
}

uint64_t static HIDEventType.progress.getter()
{
  return 18;
}

uint64_t static HIDEventType.multiAxisPointer.getter()
{
  return 19;
}

uint64_t static HIDEventType.compass.getter()
{
  return 21;
}

uint64_t static HIDEventType.dockSwipe.getter()
{
  return 23;
}

uint64_t static HIDEventType.power.getter()
{
  return 25;
}

uint64_t static HIDEventType.led.getter()
{
  return 26;
}

uint64_t static HIDEventType.biometric.getter()
{
  return 29;
}

uint64_t static HIDEventType.unicode.getter()
{
  return 30;
}

uint64_t static HIDEventType.atmosphericPressure.getter()
{
  return 31;
}

uint64_t static HIDEventType.motionGesture.getter()
{
  return 34;
}

uint64_t static HIDEventType.gameController.getter()
{
  return 35;
}

uint64_t static HIDEventType.humidity.getter()
{
  return 36;
}

uint64_t static HIDEventType.collection.getter()
{
  return 37;
}

uint64_t static HIDEventType.brightness.getter()
{
  return 38;
}

uint64_t static HIDEventType.genericGesture.getter()
{
  return 39;
}

void HIDEventType.hash(into:)(int a1, Swift::UInt32 a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int HIDEventType.hashValue.getter(Swift::UInt32 a1)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

void sub_100215670(_QWORD *a1@<X8>)
{
  *a1 = &off_100295550;
}

Swift::Int sub_100215680()
{
  Swift::UInt32 *v0;

  return HIDEventType.hashValue.getter(*v0);
}

void sub_100215688(int a1)
{
  Swift::UInt32 *v1;

  HIDEventType.hash(into:)(a1, *v1);
}

Swift::Int sub_100215690(uint64_t a1)
{
  Swift::UInt32 *v1;
  Swift::UInt32 v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

unint64_t sub_1002156D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1002B6C58;
  if (!qword_1002B6C58)
  {
    v1 = sub_10000DCA0(&qword_1002B6C60);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1002B6C58);
  }
  return result;
}

unint64_t sub_10021571C()
{
  unint64_t result;

  result = qword_1002B6C68;
  if (!qword_1002B6C68)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for HIDEventType, &type metadata for HIDEventType);
    atomic_store(result, (unint64_t *)&qword_1002B6C68);
  }
  return result;
}

uint64_t sub_100215758()
{
  int *v0;

  return HIDEventType.description.getter(*v0);
}

ValueMetadata *type metadata accessor for HIDEventType()
{
  return &type metadata for HIDEventType;
}

uint64_t KeyboardEvent.init(timestamp:usage:down:flags:)(uint64_t a1, unsigned int a2, char a3, uint64_t a4)
{
  uint64_t v4;
  id v5;

  v5 = (id)IOHIDEventCreateKeyboardEvent(0, a1, (unsigned __int16)a2, HIWORD(a2), a3 & 1, a4);
  sub_10000E538();
  return v4;
}

BOOL KeyboardEvent.down.getter(void *a1)
{
  uint64_t v1;

  sub_100215B98((uint64_t)a1, 2u);
  sub_10000E538();
  return v1 != 0;
}

void KeyboardEvent.down.setter(int a1, void *a2)
{
  char v2;
  id v3;

  v2 = a1;
  v3 = sub_100210704(a1, a2);
  IOHIDEventSetIntegerValue(v3, 196610, v2 & 1);
  sub_1000AAEF4(v3);
}

void KeyboardEvent.down.modify(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;

  *(_QWORD *)a1 = a2;
  v4 = sub_100210704(a1, a2);
  sub_100215B98((uint64_t)v4, 2u);
  sub_1001F7F68();
  *(_BYTE *)(a1 + 8) = v2 != 0;
  sub_10000B350();
}

void sub_100215878(uint64_t a1, uint64_t a2)
{
  sub_100215A08(a1, a2, 196610);
}

uint64_t KeyboardEvent.pressCount.getter(void *a1)
{
  uint64_t v1;

  sub_100215B98((uint64_t)a1, 4u);
  sub_10000E538();
  return v1;
}

void KeyboardEvent.pressCount.setter(int a1, void *a2)
{
  id v2;
  void *v3;

  v2 = sub_100210704(a1, a2);
  sub_100215BA0((uint64_t)v2);
  sub_1000AAEF4(v3);
}

void KeyboardEvent.pressCount.modify(_QWORD *a1, void *a2)
{
  uint64_t v2;
  id v4;

  a1[1] = a2;
  v4 = sub_100210704((int)a1, a2);
  sub_100215B98((uint64_t)v4, 4u);
  sub_1001F7F68();
  *a1 = v2;
  sub_10000B350();
}

void sub_100215920(uint64_t a1)
{
  void *v1;

  sub_100215BA0((uint64_t)*(id *)(a1 + 8));
  sub_1000AAEF4(v1);
}

BOOL KeyboardEvent.repeat.getter(void *a1)
{
  uint64_t v1;

  IOHIDEventGetIntegerValue(a1, 196611);
  sub_10000E538();
  return v1 != 0;
}

void KeyboardEvent.repeat.setter(int a1, void *a2)
{
  char v2;
  id v3;

  v2 = a1;
  v3 = sub_100210704(a1, a2);
  IOHIDEventSetIntegerValue(v3, 196611, v2 & 1);
  sub_1000AAEF4(v3);
}

void KeyboardEvent.repeat.modify(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;

  *(_QWORD *)a1 = a2;
  v4 = sub_100210704(a1, a2);
  IOHIDEventGetIntegerValue(v4, 196611);
  sub_1001F7F68();
  *(_BYTE *)(a1 + 8) = v2 != 0;
  sub_10000B350();
}

void sub_100215A00(uint64_t a1, uint64_t a2)
{
  sub_100215A08(a1, a2, 196611);
}

void sub_100215A08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  id v5;

  v4 = *(unsigned __int8 *)(a1 + 8);
  v5 = *(id *)a1;
  IOHIDEventSetIntegerValue(v5, a3, v4);
  sub_1000AAEF4(v5);
}

uint64_t KeyboardEvent.usage.getter(void *a1)
{
  id v1;
  unsigned __int16 IntegerValue;
  unsigned __int16 v3;

  v1 = a1;
  IntegerValue = IOHIDEventGetIntegerValue(v1, 196608);
  v3 = sub_100215B98((uint64_t)v1, 1u);

  return IntegerValue | (v3 << 16);
}

BOOL sub_100215A98()
{
  void **v0;

  return KeyboardEvent.repeat.getter(*v0);
}

void sub_100215AA0(int a1)
{
  void **v1;

  KeyboardEvent.repeat.setter(a1, *v1);
}

void (*sub_100215AA8(uint64_t a1))(uint64_t a1)
{
  void **v1;
  void *v3;

  v3 = *v1;
  *(_QWORD *)a1 = *v1;
  *(_BYTE *)(a1 + 8) = KeyboardEvent.repeat.getter(v3);
  return sub_100215AE4;
}

void sub_100215AE4(uint64_t a1)
{
  KeyboardEvent.repeat.setter(*(unsigned __int8 *)(a1 + 8), *(void **)a1);
}

void sub_100215AF0(void **a1@<X0>, BOOL *a2@<X8>)
{
  *a2 = KeyboardEvent.down.getter(*a1);
  sub_1000050D4();
}

void sub_100215B18(unsigned __int8 *a1, void **a2)
{
  KeyboardEvent.down.setter(*a1, *a2);
}

void sub_100215B24(void **a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = KeyboardEvent.pressCount.getter(*a1);
  sub_1000050D4();
}

void sub_100215B48(_QWORD *a1, void **a2)
{
  KeyboardEvent.pressCount.setter(*a1, *a2);
}

void sub_100215B54(void **a1@<X0>, BOOL *a2@<X8>)
{
  *a2 = KeyboardEvent.repeat.getter(*a1);
  sub_1000050D4();
}

void sub_100215B7C(unsigned __int8 *a1, void **a2)
{
  KeyboardEvent.repeat.setter(*a1, *a2);
}

ValueMetadata *type metadata accessor for KeyboardEvent()
{
  return &type metadata for KeyboardEvent;
}

uint64_t sub_100215B98(uint64_t a1, unsigned __int16 a2)
{
  return IOHIDEventGetIntegerValue(a1, a2 | 0x30000u);
}

uint64_t sub_100215BA0(uint64_t a1)
{
  uint64_t v1;

  return IOHIDEventSetIntegerValue(a1, 196612, v1);
}

unint64_t sub_100215BB4()
{
  unint64_t result;
  pid_t v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  uint64_t v5;

  result = atomic_load(&qword_1002DB850);
  if (!result)
  {
    v5 = 0;
    v3 = 0u;
    v4 = 0u;
    v2 = 0u;
    v1 = getpid();
    if (proc_pidinfo(v1, 17, 1uLL, &v2, 56) != 56)
      __assert_rtn("PlatformGetProcessUniqueID", "Internal_Platform.m", 98, "false");
    result = v3;
    atomic_store(v3, &qword_1002DB850);
  }
  return result;
}

BOOL sub_100215C6C(void *a1)
{
  id v1;
  void *v2;
  unsigned __int8 v3;
  _BOOL8 v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  unsigned int v8;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", "iMac16,1", 30));
  v3 = objc_msgSend(v1, "isEqualToString:", v2);

  if ((v3 & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = 1;
    v6 = 14;
    while (v5 != 15)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", off_1002994E8[v5], 30));
      v8 = objc_msgSend(v1, "isEqualToString:", v7);

      ++v5;
      if (v8)
      {
        v6 = v5 - 2;
        break;
      }
    }
    v4 = v6 > 0xD;
  }

  return v4;
}

id CUTrafficFlagsCopyDescription(unsigned int a1)
{
  return sub_100215D54(a1, byte_100232C30);
}

id sub_100215D54(unint64_t a1, _BYTE *a2)
{
  id v4;
  char v5;
  const char *v6;
  const char *v7;
  const char *v8;
  int v9;

  v4 = objc_alloc_init((Class)NSMutableString);
  v5 = *a2;
  do
  {
    v6 = a2 + 1;
    if (((1 << v5) & a1) != 0)
    {
      if (objc_msgSend(v4, "length"))
        v7 = " ";
      else
        v7 = "";
      objc_msgSend(v4, "appendFormat:", CFSTR("%s%s"), v7, v6);
    }
    v8 = &v6[strlen(v6)];
    v9 = *((unsigned __int8 *)v8 + 1);
    a2 = v8 + 1;
    v5 = v9;
  }
  while (v9);
  return v4;
}

id RPDeviceChangeFlagsCopyDescription(unsigned int a1)
{
  return sub_100215D54(a1, byte_100232CA3);
}

id RPActivityLevelCopyDescription(uint64_t a1)
{
  const char *v2;
  void *v3;
  void *v4;

  if (a1 > 0xE)
    v2 = "?";
  else
    v2 = off_100299560[a1];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v2, 4));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("(%d)"), a1));

  return v4;
}

NSString *RPStreamQoSCopyDescription(int a1)
{
  const char *v1;

  v1 = "Default";
  switch(a1)
  {
    case 0:
      return +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v1, 4);
    case 1:
      v1 = "Background";
      break;
    case 2:
      v1 = "Video";
      break;
    case 3:
      v1 = "Voice";
      break;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
      goto LABEL_5;
    case 10:
      v1 = "AirPlayAudio";
      break;
    case 11:
      v1 = "AirPlayScreenAudio";
      break;
    case 12:
      v1 = "AirPlayScreenVideo";
      break;
    default:
      if (a1 == 20)
        v1 = "NTP";
      else
LABEL_5:
        v1 = "?";
      break;
  }
  return +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v1, 4);
}

id RPStatusFlagsCopyDescription(unint64_t a1)
{
  return sub_100215D54(a1, byte_100232CE6);
}

id RPStreamFlagsCopyDescription(unsigned int a1)
{
  return sub_100215D54(a1, byte_100232EA5);
}

NSString *RPStreamTypeCopyDescription(unsigned int a1)
{
  const char *v1;

  if (a1 > 3)
    v1 = "?";
  else
    v1 = off_1002995D8[a1];
  return +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v1, 4);
}

void RPStreamSessionSetDisconnectHandler(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v5 = a1;
  v3 = a2;
  if ((objc_opt_respondsToSelector(v5, "setDisconnectHandler:") & 1) != 0)
  {
    v4 = objc_retainBlock(v3);
    objc_msgSend(v5, "performSelector:withObject:", "setDisconnectHandler:", v4);

  }
}

id sub_1002162FC(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "handler:", a2);
}

void sub_100216308(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSISO8601DateFormatter *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v18 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v3, 0, 0, &v18));
  v5 = v18;
  if (v4)
  {
    v6 = sub_100216510(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v17 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v7, 7, &v17));
    v9 = v17;

    v5 = v9;
    if (v8)
      goto LABEL_7;
  }
  else
  {
    v8 = 0;
  }
  if (v5)
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v5, 7, 0));
LABEL_7:
  v10 = objc_opt_new(NSISO8601DateFormatter);
  -[NSISO8601DateFormatter setFormatOptions:](v10, "setFormatOptions:", 2163);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
  -[NSISO8601DateFormatter setTimeZone:](v10, "setTimeZone:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter stringFromDate:](v10, "stringFromDate:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s-%@.json"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[_DiagnosticsHandler tmpDir](_DiagnosticsHandler, "tmpDir"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", v14, 0, v15));

  objc_msgSend(v8, "writeToURL:atomically:", v16, 0);
}

id sub_100216510(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  NSISO8601DateFormatter *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[5];

  v1 = a1;
  v2 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v1, v2) & 1) != 0)
  {
    v3 = v1;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v3, "count")));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10021672C;
    v14[3] = &unk_100299650;
    v14[4] = v4;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v14);
  }
  else
  {
    v5 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v1, v5) & 1) == 0)
    {
      v6 = objc_opt_class(NSData);
      if ((objc_opt_isKindOfClass(v1, v6) & 1) != 0)
      {
        v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "base64EncodedStringWithOptions:", 0));
      }
      else
      {
        v8 = objc_opt_class(NSDate);
        if ((objc_opt_isKindOfClass(v1, v8) & 1) != 0)
        {
          v9 = v1;
          v10 = objc_opt_new(NSISO8601DateFormatter);
          -[NSISO8601DateFormatter setFormatOptions:](v10, "setFormatOptions:", 2163);
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
          -[NSISO8601DateFormatter setTimeZone:](v10, "setTimeZone:", v11);

          v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter stringFromDate:](v10, "stringFromDate:", v9));
          goto LABEL_14;
        }
        if (+[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", v1))
          v7 = v1;
        else
          v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "description"));
      }
      v4 = v7;
      goto LABEL_14;
    }
    v3 = v1;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1002167A4;
    v13[3] = &unk_100299678;
    v13[4] = v4;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v13);
  }

LABEL_14:
  return v4;
}

void sub_10021672C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = sub_100216510(a3);
  v10 = (id)objc_claimAutoreleasedReturnValue(v6);
  v7 = *(void **)(a1 + 32);
  v8 = sub_100216510(v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v9);
}

void sub_1002167A4(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = sub_100216510(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v2, "addObject:", v4);

}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bytes");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:isDirectory:relativeToURL:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isValidJSONObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidJSONObject:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_setFormatOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFormatOptions:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemTimeZone");
}

id objc_msgSend_tmpDir(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tmpDir");
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:atomically:");
}

