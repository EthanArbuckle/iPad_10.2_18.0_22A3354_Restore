uint64_t sub_100090C38()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 32, 7);
}

void sub_100090C5C(uint64_t a1)
{
  uint64_t v1;

  sub_100090B4C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_100090C64(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  _QWORD *v7;
  void *v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[5];
  _QWORD *v12;

  v5 = (void *)*a1;
  v6 = objc_msgSend(objc_allocWithZone((Class)HKProfileStore), "initWithHealthStore:", *a1);
  v7 = (_QWORD *)swift_allocObject(&unk_1000E21D8, 40, 7);
  v7[2] = a2;
  v7[3] = v5;
  v7[4] = a3;
  v11[4] = sub_100092010;
  v12 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_100091A30;
  v11[3] = &unk_1000E21F0;
  v8 = _Block_copy(v11);
  v9 = v12;
  swift_retain(a2);
  v10 = v5;
  swift_release(v9);
  objc_msgSend(v6, "fetchDisplayName:", v8);
  _Block_release(v8);

}

uint64_t sub_100090D60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(_QWORD, _QWORD), _QWORD *a8)
{
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
  char *v26;
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
  char *v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t MetatypeMetadata;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  void *v49;
  Class isa;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  Swift::String v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  id v65;
  void (*v66)(uint64_t *, _QWORD);
  _BYTE *v67;
  char *v68;
  char *v69;
  Swift::String v70;
  _QWORD *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  _QWORD *v78;
  id v79;
  void (*v80)(uint64_t *, _QWORD);
  __n128 v81;
  char *v82;
  void *v83;
  uint64_t v84;
  void (*v85)(char *, char *, uint64_t);
  char *v86;
  char *v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void (*v96)(uint64_t, char *, uint64_t);
  void *v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  char *v105;
  uint64_t v106;
  void (*v107)(char *, uint64_t);
  uint64_t v108;
  uint64_t v109;
  unsigned int v110;
  void (*v111)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v112;
  unsigned int v113;
  id v114;
  id v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void (*v122)(_QWORD, _QWORD);
  uint64_t v123;
  uint64_t v124;
  _BYTE *v125;
  char *v126;
  char *v127;
  char *v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  char *v140;
  char *v141;
  uint64_t v142;
  _QWORD *aBlock;
  _QWORD v144[2];
  void *v145;
  _QWORD *(*v146)();
  uint64_t v147;
  uint64_t v148;

  v122 = a7;
  v142 = a6;
  v120 = a3;
  v119 = a1;
  v12 = type metadata accessor for Logger(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v108 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for DispatchWorkItemFlags(0);
  v136 = *(_QWORD *)(v16 - 8);
  v137 = v16;
  __chkstk_darwin(v16);
  v135 = (char *)&v108 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for DispatchQoS(0);
  v133 = *(_QWORD *)(v18 - 8);
  v134 = v18;
  __chkstk_darwin(v18);
  v132 = (char *)&v108 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v139 = type metadata accessor for SectionedDataSourceContainerViewType(0);
  v123 = *(_QWORD *)(v139 - 8);
  __chkstk_darwin(v139);
  v128 = (char *)&v108 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000076D8(0, &qword_1000ECA60, (uint64_t (*)(uint64_t))&type metadata accessor for UIBackgroundConfiguration, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v21);
  v126 = (char *)&v108 - v22;
  v138 = type metadata accessor for CellDeselectionBehavior(0);
  v121 = *(_QWORD *)(v138 - 8);
  __chkstk_darwin(v138);
  v125 = (char *)&v108 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v124 = type metadata accessor for UUID(0);
  v24 = *(_QWORD *)(v124 - 8);
  __chkstk_darwin(v124);
  v26 = (char *)&v108 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v131 = type metadata accessor for ContentConfigurationItem(0);
  v130 = *(_QWORD *)(v131 - 8);
  v27 = *(_QWORD *)(v130 + 64);
  v28 = __chkstk_darwin(v131);
  v129 = (char *)&v108 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __chkstk_darwin(v28);
  v127 = (char *)&v108 - v30;
  v31 = __chkstk_darwin(v29);
  v141 = (char *)&v108 - v32;
  __chkstk_darwin(v31);
  v140 = (char *)&v108 - v33;
  v34 = type metadata accessor for PersonNameComponents(0);
  v35 = __chkstk_darwin(v34);
  v38 = (char *)&v108 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    v39 = static Logger.profile.getter(v35);
    v40 = Logger.logObject.getter(v39);
    v41 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc(12, -1);
      v43 = swift_slowAlloc(32, -1);
      v148 = v43;
      *(_DWORD *)v42 = 136315138;
      aBlock = a8;
      MetatypeMetadata = swift_getMetatypeMetadata(a8);
      v45 = String.init<A>(describing:)(&aBlock, MetatypeMetadata);
      v47 = v46;
      aBlock = (_QWORD *)sub_100012B20(v45, v46, &v148);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v144, v42 + 4, v42 + 12);
      swift_bridgeObjectRelease(v47);
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "[%s] There was an error while getting the tinker user's name", v42, 0xCu);
      swift_arrayDestroy(v43, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v43, -1, -1);
      swift_slowDealloc(v42, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  else
  {
    v116 = v38;
    v118 = v35;
    v117 = v36;
    PersonNameComponents.init()();
    swift_bridgeObjectRetain(a2);
    PersonNameComponents.givenName.setter(v119, a2);
    swift_bridgeObjectRetain(a4);
    PersonNameComponents.familyName.setter(v120, a4);
    v49 = (void *)objc_opt_self(NSPersonNameComponentsFormatter);
    isa = PersonNameComponents._bridgeToObjectiveC()().super.isa;
    v51 = objc_msgSend(v49, "localizedStringFromPersonNameComponents:style:options:", isa, 2, 0);

    v52 = static String._unconditionallyBridgeFromObjectiveC(_:)(v51);
    v120 = v52;
    v54 = v53;

    aBlock = (_QWORD *)v52;
    v144[0] = v54;
    swift_bridgeObjectRetain(v54);
    v55._countAndFlagsBits = 0x656C69666F725020;
    v55._object = (void *)0xE800000000000000;
    String.append(_:)(v55);
    v56 = aBlock;
    v57 = v144[0];
    v58 = swift_allocObject(&unk_1000E2228, 32, 7);
    v59 = v142;
    v60 = v122;
    *(_QWORD *)(v58 + 16) = v142;
    *(_QWORD *)(v58 + 24) = v60;
    swift_retain(v59);
    v115 = v60;
    v61 = UUID.init()(v115);
    v109 = UUID.uuidString.getter(v61);
    v108 = v62;
    v122 = *(void (**)(_QWORD, _QWORD))(v24 + 8);
    v63 = v124;
    v122(v26, v124);
    v119 = type metadata accessor for UIListContentConfiguration(0);
    v145 = (void *)v119;
    v146 = (_QWORD *(*)())&protocol witness table for UIListContentConfiguration;
    v64 = sub_100007E0C(&aBlock);
    static UIListContentConfiguration.cell()(v64);
    swift_bridgeObjectRetain(v57);
    UIListContentConfiguration.text.setter(v56, v57);
    v114 = (id)objc_opt_self(UIColor);
    v65 = objc_msgSend(v114, "tintColor");
    v66 = (void (*)(uint64_t *, _QWORD))UIListContentConfiguration.textProperties.modify(&v148);
    UIListContentConfiguration.TextProperties.color.setter(v65);
    v66(&v148, 0);
    v67 = v125;
    *v125 = 1;
    v113 = enum case for CellDeselectionBehavior.deselectOnDidSelect(_:);
    v121 = *(_QWORD *)(v121 + 104);
    ((void (*)(_BYTE *))v121)(v67);
    swift_retain(v58);
    swift_bridgeObjectRelease(v57);
    v112 = type metadata accessor for UIBackgroundConfiguration(0);
    v111 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v112 - 8) + 56);
    v68 = v126;
    v111(v126, 1, 1, v112);
    v110 = enum case for SectionedDataSourceContainerViewType.collectionView(_:);
    v123 = *(_QWORD *)(v123 + 104);
    v69 = v128;
    ((void (*)(char *))v123)(v128);
    ContentConfigurationItem.init(uniqueIdentifier:contentConfiguration:cellAccessories:cellSelectionHandler:deselectionBehavior:backgroundConfiguration:updateContentConfigurationHandler:container:automationIdentifier:)(v109, v108, &aBlock, _swiftEmptyArrayStorage, sub_100092024, v58, v67, v68, 0, 0, v69, 0, 0);
    swift_release(v58);
    aBlock = (_QWORD *)v120;
    v144[0] = v54;
    swift_bridgeObjectRetain(v54);
    v70._countAndFlagsBits = 0x6C61636964654D20;
    v70._object = (void *)0xEB00000000444920;
    String.append(_:)(v70);
    swift_bridgeObjectRelease(v54);
    v71 = aBlock;
    v72 = v144[0];
    v73 = swift_allocObject(&unk_1000E2250, 32, 7);
    v74 = v142;
    v75 = v115;
    *(_QWORD *)(v73 + 16) = v142;
    *(_QWORD *)(v73 + 24) = v75;
    swift_retain(v74);
    v76 = UUID.init()(v75);
    v120 = UUID.uuidString.getter(v76);
    v115 = v77;
    v122(v26, v63);
    v145 = (void *)v119;
    v146 = (_QWORD *(*)())&protocol witness table for UIListContentConfiguration;
    v78 = sub_100007E0C(&aBlock);
    static UIListContentConfiguration.cell()(v78);
    swift_bridgeObjectRetain(v72);
    UIListContentConfiguration.text.setter(v71, v72);
    v79 = objc_msgSend(v114, "tintColor");
    v80 = (void (*)(uint64_t *, _QWORD))UIListContentConfiguration.textProperties.modify(&v148);
    UIListContentConfiguration.TextProperties.color.setter(v79);
    v80(&v148, 0);
    *v67 = 1;
    ((void (*)(_BYTE *, _QWORD, uint64_t))v121)(v67, v113, v138);
    swift_retain(v73);
    v81 = swift_bridgeObjectRelease(v72);
    ((void (*)(char *, uint64_t, uint64_t, uint64_t, __n128))v111)(v68, 1, 1, v112, v81);
    ((void (*)(char *, _QWORD, uint64_t))v123)(v69, v110, v139);
    v82 = v141;
    ContentConfigurationItem.init(uniqueIdentifier:contentConfiguration:cellAccessories:cellSelectionHandler:deselectionBehavior:backgroundConfiguration:updateContentConfigurationHandler:container:automationIdentifier:)(v120, v115, &aBlock, _swiftEmptyArrayStorage, sub_100092038, v73, v67, v68, 0, 0, v69, 0, 0);
    swift_release(v73);
    sub_100006D10(0, (unint64_t *)&qword_1000ED910, OS_dispatch_queue_ptr);
    v83 = (void *)static OS_dispatch_queue.main.getter();
    v84 = v130;
    v85 = *(void (**)(char *, char *, uint64_t))(v130 + 16);
    v86 = v127;
    v87 = v140;
    v88 = v131;
    v85(v127, v140, v131);
    v89 = v129;
    v85(v129, v82, v88);
    v90 = *(unsigned __int8 *)(v84 + 80);
    v91 = (v90 + 24) & ~v90;
    v92 = (v27 + v90 + v91) & ~v90;
    v93 = swift_allocObject(&unk_1000E2278, v92 + v27, v90 | 7);
    v94 = v142;
    *(_QWORD *)(v93 + 16) = v142;
    v95 = v93 + v91;
    v96 = *(void (**)(uint64_t, char *, uint64_t))(v84 + 32);
    v96(v95, v86, v88);
    v96(v93 + v92, v89, v88);
    v146 = sub_1000920D8;
    v147 = v93;
    aBlock = _NSConcreteStackBlock;
    v144[0] = 1107296256;
    v144[1] = sub_100006988;
    v145 = &unk_1000E2290;
    v97 = _Block_copy(&aBlock);
    v98 = v147;
    swift_retain(v94);
    v99 = swift_release(v98);
    v100 = v132;
    static DispatchQoS.unspecified.getter(v99);
    aBlock = _swiftEmptyArrayStorage;
    v101 = sub_100013198((unint64_t *)&qword_1000EDBE0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    sub_1000076D8(0, (unint64_t *)&qword_1000ED920, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    v103 = v102;
    v104 = sub_100013C8C();
    v105 = v135;
    v106 = v137;
    dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v103, v104, v137, v101);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v100, v105, v97);
    _Block_release(v97);

    (*(void (**)(char *, uint64_t))(v136 + 8))(v105, v106);
    (*(void (**)(char *, uint64_t))(v133 + 8))(v100, v134);
    v107 = *(void (**)(char *, uint64_t))(v84 + 8);
    v107(v141, v88);
    v107(v87, v88);
    return (*(uint64_t (**)(char *, uint64_t))(v117 + 8))(v116, v118);
  }
}

_QWORD *sub_1000918CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void (*v8)(_QWORD *, uint64_t, uint64_t);
  uint64_t v9;
  _QWORD *result;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  __n128 v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  __n128 v19;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;

  v5 = type metadata accessor for ContentConfigurationItem(0);
  v21 = v5;
  v6 = sub_100013198(&qword_1000ECA80, (uint64_t (*)(uint64_t))&type metadata accessor for ContentConfigurationItem, (uint64_t)&protocol conformance descriptor for ContentConfigurationItem);
  v22 = v6;
  v7 = sub_100007E0C(v20);
  v8 = *(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16);
  v8(v7, a2, v5);
  v9 = type metadata accessor for AuxiliaryProfilesDataSource(0);
  result = (_QWORD *)SnapshotDataSource.sectionIdentifiers.getter(v9, &protocol witness table for MutableArrayDataSource);
  if (result[2])
  {
    v11 = result;
    v12 = result[4];
    v13 = result[5];
    swift_bridgeObjectRetain(v13);
    v14 = swift_bridgeObjectRelease(v11);
    dispatch thunk of MutableArrayDataSource.append(item:toSectionWithID:)(v20, v12, v13, v14);
    swift_bridgeObjectRelease(v13);
    _s6Health23OpenSleepScheduleIntentVwxx_0(v20);
    v21 = v5;
    v22 = v6;
    v15 = sub_100007E0C(v20);
    v8(v15, a3, v5);
    result = (_QWORD *)SnapshotDataSource.sectionIdentifiers.getter(v9, &protocol witness table for MutableArrayDataSource);
    if (result[2])
    {
      v16 = result;
      v17 = result[4];
      v18 = result[5];
      swift_bridgeObjectRetain(v18);
      v19 = swift_bridgeObjectRelease(v16);
      dispatch thunk of MutableArrayDataSource.append(item:toSectionWithID:)(v20, v17, v18, v19);
      swift_bridgeObjectRelease(v18);
      return (_QWORD *)_s6Health23OpenSleepScheduleIntentVwxx_0(v20);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100091A30(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t, uint64_t, void *);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v5 = a3;
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  if (!a2)
  {
    v8 = 0;
    v10 = 0;
    if (a3)
      goto LABEL_3;
LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  v10 = v9;
  if (!v5)
    goto LABEL_5;
LABEL_3:
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  v5 = v12;
LABEL_6:
  swift_retain(v6);
  v13 = a4;
  v7(v8, v10, v11, v5, a4);
  swift_release(v6);

  swift_bridgeObjectRelease(v5);
  return swift_bridgeObjectRelease(v10);
}

void sub_100091AE8(uint64_t a1, uint64_t a2, void (*a3)(_QWORD *), uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint8_t *v41;
  uint64_t v42;
  void (*v43)(_QWORD *);
  uint64_t v44;
  uint64_t v45;

  v8 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2 && a1)
  {
    v45 = (uint64_t)_swiftEmptyArrayStorage;
    if ((unint64_t)a1 >> 62)
    {
      if (a1 >= 0)
        v29 = a1 & 0xFFFFFFFFFFFFFF8;
      else
        v29 = a1;
      swift_bridgeObjectRetain(a1);
      v13 = _CocoaArrayWrapper.endIndex.getter(v29);
      if (v13)
      {
LABEL_5:
        if (v13 < 1)
        {
          __break(1u);
LABEL_38:
          __break(1u);
          return;
        }
        for (i = 0; i != v13; ++i)
        {
          if ((a1 & 0xC000000000000001) != 0)
            v17 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1);
          else
            v17 = *(id *)(a1 + 8 * i + 32);
          v18 = v17;
          if (objc_msgSend(v17, "type") == (id)3)
          {
            specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(3);
            v15 = *(_QWORD *)(v45 + 16);
            specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v15);
            v16 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v15, v18);
            specialized ContiguousArray._endMutation()(v16);
          }
          else
          {

          }
        }
        swift_bridgeObjectRelease(a1);
        v28 = v45;
        if (v45 < 0)
          goto LABEL_34;
LABEL_25:
        if ((v28 & 0x4000000000000000) == 0)
        {
          v30 = *(_QWORD *)(v28 + 16);
          if (!v30)
          {
LABEL_35:
            swift_release(v28);
            v38 = _swiftEmptyArrayStorage;
            a3(_swiftEmptyArrayStorage);
LABEL_36:
            swift_bridgeObjectRelease(v38);
            return;
          }
          goto LABEL_27;
        }
LABEL_34:
        v39 = swift_bridgeObjectRetain(v28);
        v30 = _CocoaArrayWrapper.endIndex.getter(v39);
        swift_release(v28);
        if (!v30)
          goto LABEL_35;
LABEL_27:
        v45 = (uint64_t)_swiftEmptyArrayStorage;
        specialized ContiguousArray.reserveCapacity(_:)(v30);
        if ((v30 & 0x8000000000000000) == 0)
        {
          v42 = a4;
          v43 = a3;
          v31 = 0;
          do
          {
            if ((v28 & 0xC000000000000001) != 0)
              v32 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v31, v28);
            else
              v32 = *(id *)(v28 + 8 * v31 + 32);
            v33 = v32;
            ++v31;
            v34 = objc_msgSend(objc_allocWithZone((Class)HKHealthStore), "init");
            objc_msgSend(v34, "setProfileIdentifier:", v33);
            objc_msgSend(v34, "resume");

            specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v35);
            v36 = *(_QWORD *)(v45 + 16);
            specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v36);
            v37 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v36, v34);
            specialized ContiguousArray._endMutation()(v37);
          }
          while (v30 != v31);
          v38 = (_QWORD *)v45;
          swift_release(v28);
          v43(v38);
          goto LABEL_36;
        }
        goto LABEL_38;
      }
    }
    else
    {
      v13 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(a1);
      if (v13)
        goto LABEL_5;
    }
    swift_bridgeObjectRelease(a1);
    v28 = (uint64_t)_swiftEmptyArrayStorage;
    if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0)
      goto LABEL_34;
    goto LABEL_25;
  }
  static Logger.profile.getter(v10);
  swift_errorRetain(a2);
  v19 = swift_errorRetain(a2);
  v20 = Logger.logObject.getter(v19);
  v21 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v42 = a4;
    v22 = (uint8_t *)swift_slowAlloc(12, -1);
    v23 = swift_slowAlloc(32, -1);
    v44 = a2;
    v45 = v23;
    v43 = a3;
    *(_DWORD *)v22 = 136315138;
    v41 = v22 + 4;
    swift_errorRetain(a2);
    sub_1000076D8(0, (unint64_t *)&qword_1000EC718, (uint64_t (*)(uint64_t))sub_100013960, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
    v25 = String.init<A>(describing:)(&v44, v24);
    v27 = v26;
    v44 = sub_100012B20(v25, v26, &v45);
    a3 = v43;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, &v45, v41, v22 + 12);
    swift_bridgeObjectRelease(v27);
    swift_errorRelease(a2);
    swift_errorRelease(a2);
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "There was an error fetching tinker profiles: %s", v22, 0xCu);
    swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1, -1);
    swift_slowDealloc(v22, -1, -1);
  }
  else
  {
    swift_errorRelease(a2);
    swift_errorRelease(a2);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  a3(_swiftEmptyArrayStorage);
}

uint64_t sub_100091F50()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_100091F74(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_100091AE8(a1, a2, *(void (**)(_QWORD *))(v2 + 16), *(_QWORD *)(v2 + 24));
}

double sub_100091F7C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  uint64_t v7;
  id v8;
  double result;

  v4 = a2;
  v6 = *(void (**)(uint64_t, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    v7 = sub_100006D10(0, &qword_1000F0130, HKProfileIdentifier_ptr);
    v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v7);
  }
  swift_retain(v5);
  v8 = a3;
  v6(v4, a3);
  swift_release(v5);

  *(_QWORD *)&result = swift_bridgeObjectRelease(v4).n128_u64[0];
  return result;
}

uint64_t sub_100092008()
{
  return sub_100046994(40);
}

uint64_t sub_100092010(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  return sub_100090D60(a1, a2, a3, a4, a5, *(_QWORD *)(v5 + 16), *(void (**)(_QWORD, _QWORD))(v5 + 24), *(_QWORD **)(v5 + 32));
}

uint64_t sub_10009201C()
{
  return sub_100046994(32);
}

uint64_t sub_100092024(void *a1)
{
  uint64_t v1;

  return sub_1000337A4(*(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_100092030()
{
  return sub_100046994(32);
}

void sub_100092038(void *a1)
{
  uint64_t v1;

  sub_100033A58(*(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_100092044()
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
  void (*v9)(uint64_t, uint64_t);

  v1 = type metadata accessor for ContentConfigurationItem(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  v7 = (v5 + v3 + v4) & ~v3;
  v8 = v7 + v5;
  swift_release(*(_QWORD *)(v0 + 16));
  v9 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v9(v0 + v4, v1);
  v9(v0 + v7, v1);
  return swift_deallocObject(v0, v8, v6);
}

_QWORD *sub_1000920D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(type metadata accessor for ContentConfigurationItem(0) - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  return sub_1000918CC(*(_QWORD *)(v0 + 16), v0 + ((v2 + 24) & ~v2), v0 + ((*(_QWORD *)(v1 + 64) + v2 + ((v2 + 24) & ~v2)) & ~v2));
}

void sub_100092184()
{
  char *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  double v5;
  id v6;

  objc_msgSend(v0, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v1 = objc_msgSend((id)objc_opt_self(UIColor), "secondarySystemBackgroundColor");
  objc_msgSend(v0, "setBackgroundColor:", v1);

  v2 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithImage:", *(_QWORD *)&v0[OBJC_IVAR____TtC6Health25ImageWithCircleBackground_image]);
  objc_msgSend(v2, "setContentMode:", 1);
  objc_msgSend(v0, "addSubview:", v2);
  objc_msgSend(v2, "hk_alignConstraintsWithView:insets:", v0, 12.0, 12.0, 12.0, 12.0);
  v3 = objc_msgSend(v0, "heightAnchor");
  v4 = objc_msgSend(v0, "widthAnchor");
  v6 = objc_msgSend(v3, "constraintEqualToAnchor:", v4);

  LODWORD(v5) = 1148846080;
  objc_msgSend(v6, "setPriority:", v5);
  objc_msgSend(v6, "setActive:", 1);

}

id sub_1000923C8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ImageWithCircleBackground();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ImageWithCircleBackground()
{
  return objc_opt_self(_TtC6Health25ImageWithCircleBackground);
}

uint64_t sub_100092428@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t result;
  int *v30;
  _QWORD *v31;
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;

  v50 = a1;
  sub_1000927EC(0);
  v49 = v3;
  v4 = __chkstk_darwin(v3);
  v48 = (uint64_t)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v47 = (char *)&v46 - v6;
  v7 = type metadata accessor for Calendar(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000076D8(0, (unint64_t *)&qword_1000ECF98, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v11);
  v13 = (char *)&v46 - v12;
  v14 = type metadata accessor for Date(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = __chkstk_darwin(v14);
  v18 = (char *)&v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __chkstk_darwin(v16);
  v21 = (char *)&v46 - v20;
  __chkstk_darwin(v19);
  v23 = (char *)&v46 - v22;
  a2[1] = 0;
  a2[2] = 0;
  v51 = &_swiftEmptySetSingleton;
  sub_100092808(0);
  v25 = State.init(wrappedValue:)(&v52, &v51, v24);
  v26 = v53;
  a2[3] = v52;
  a2[4] = v26;
  v27 = static Date.now.getter(v25);
  static Calendar.current.getter(v27);
  Date.startOfWeek(for:)(v10);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v28 = *(void (**)(char *, uint64_t))(v15 + 8);
  v28(v21, v14);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v30 = (int *)type metadata accessor for ExportDatasetView(0);
    v31 = (_QWORD *)((char *)a2 + v30[7]);
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v23, v13, v14);
    v32 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
    v32(v21, v23, v14);
    State.init(wrappedValue:)(v31, v21, v14);
    v33 = ((uint64_t (*)(char *, uint64_t))v28)(v23, v14);
    v34 = (_QWORD *)((char *)a2 + v30[8]);
    static Date.now.getter(v33);
    v32(v18, v21, v14);
    State.init(wrappedValue:)(v34, v18, v14);
    v28(v21, v14);
    v35 = (_QWORD *)((char *)a2 + v30[9]);
    v51 = (void *)sub_10009B448();
    sub_10009BA08(0, &qword_1000F0170, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    State.init(wrappedValue:)(&v52, &v51, v36);
    v37 = v53;
    *v35 = v52;
    v35[1] = v37;
    v38 = (char *)a2 + v30[10];
    LOBYTE(v51) = 0;
    State.init(wrappedValue:)(&v52, &v51, &type metadata for Bool);
    v39 = v53;
    *v38 = v52;
    *((_QWORD *)v38 + 1) = v39;
    v40 = (char *)a2 + v30[11];
    LOBYTE(v51) = 0;
    State.init(wrappedValue:)(&v52, &v51, &type metadata for Bool);
    v41 = v53;
    *v40 = v52;
    *((_QWORD *)v40 + 1) = v41;
    v42 = (_QWORD *)((char *)a2 + v30[12]);
    v43 = type metadata accessor for URL(0);
    v44 = (uint64_t)v47;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v47, 1, 1, v43);
    v45 = v48;
    sub_10001375C(v44, v48, (uint64_t (*)(_QWORD))sub_1000927EC);
    State.init(wrappedValue:)(v42, v45, v49);
    result = sub_1000137A0(v44, (uint64_t (*)(_QWORD))sub_1000927EC);
    *a2 = v50;
  }
  return result;
}

void sub_1000927EC(uint64_t a1)
{
  sub_1000076D8(a1, (unint64_t *)&unk_1000ECA90, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
}

void sub_100092808(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000F0168)
  {
    v2 = sub_10007C010();
    v3 = type metadata accessor for Set(a1, &type metadata for HKDataType, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000F0168);
  }
}

uint64_t type metadata accessor for ExportDatasetView(uint64_t a1)
{
  return sub_100006A08(a1, qword_1000F0280, (uint64_t)&nominal type descriptor for ExportDatasetView);
}

uint64_t sub_100092874(void (*a1)(id *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t result;
  uint64_t v12;
  id v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void (*v20)(id *);
  uint64_t v21;
  char *v22;
  id v23;
  _QWORD *v24;

  v4 = v3;
  v20 = a1;
  v21 = a2;
  sub_10009EAF0(0, (unint64_t *)&qword_1000EF870, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for HKSampleQueryDescriptor);
  v19 = v6;
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v22 = (char *)&v18 - v8;
  if ((unint64_t)a3 >> 62)
    goto LABEL_18;
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v10 = _swiftEmptyArrayStorage;
    if (!v9)
      return (uint64_t)v10;
    v24 = _swiftEmptyArrayStorage;
    result = sub_10007FF18(0, v9 & ~(v9 >> 63), 0);
    if (v9 < 0)
      break;
    v12 = 0;
    v10 = v24;
    v18 = a3 & 0xC000000000000001;
    while (v9 != v12)
    {
      if (v18)
        v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v12, a3);
      else
        v13 = *(id *)(a3 + 8 * v12 + 32);
      v14 = v13;
      v23 = v13;
      v20(&v23);
      if (v4)
      {
        swift_release(v10);

        return (uint64_t)v10;
      }
      v4 = 0;

      v24 = v10;
      v16 = v10[2];
      v15 = v10[3];
      if (v16 >= v15 >> 1)
      {
        sub_10007FF18(v15 > 1, v16 + 1, 1);
        v10 = v24;
      }
      ++v12;
      v10[2] = v16 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))((unint64_t)v10+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v16, v22, v19);
      if (v9 == v12)
        return (uint64_t)v10;
    }
    __break(1u);
LABEL_18:
    if (a3 < 0)
      v17 = a3;
    else
      v17 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v9 = _CocoaArrayWrapper.endIndex.getter(v17);
    swift_bridgeObjectRelease(a3);
  }
  __break(1u);
  return result;
}

uint64_t sub_100092A60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v14;

  v10 = type metadata accessor for _ConditionalContent.Storage(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v14 - v11;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))((char *)&v14 - v11, a1, a2);
  swift_storeEnumTagMultiPayload(v12, v10, 0);
  return _ConditionalContent<>.init(storage:)(v12, a2, a3, a4, a5);
}

uint64_t sub_100092B24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v14;

  v10 = type metadata accessor for _ConditionalContent.Storage(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v14 - v11;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v14 - v11, a1, a3);
  swift_storeEnumTagMultiPayload(v12, v10, 1);
  return _ConditionalContent<>.init(storage:)(v12, a2, a3, a4, a5);
}

uint64_t sub_100092BE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
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
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __n128 v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t OpaqueTypeConformance2;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
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
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
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
  char *v79;
  char v80[16];
  uint64_t v81;
  char v82[16];
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  char v88;
  uint64_t v89;

  v64 = a1;
  v77 = a2;
  v71 = type metadata accessor for ExportDatasetView(0);
  v3 = *(_QWORD *)(*(_QWORD *)(v71 - 8) + 64);
  v74 = *(_QWORD *)(v71 - 8);
  v75 = v3;
  __chkstk_darwin(v71);
  v72 = (uint64_t)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = type metadata accessor for NavigationBarItem.TitleDisplayMode(0);
  v68 = *(_QWORD *)(v69 - 8);
  __chkstk_darwin(v69);
  v67 = (char *)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10009D5E4(0);
  v7 = v6;
  v65 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10009DE34(0, &qword_1000F0300, v10, sub_10009DCD0, (uint64_t)&opaque type descriptor for <<opaque return type of View.navigationTitle(_:)>>);
  v12 = v11;
  v66 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v64 - v13;
  sub_10009D524(0);
  v78 = v15;
  v70 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v17 = (char *)&v64 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10009D408(0);
  v73 = v18;
  v76 = *(_QWORD *)(v18 - 8);
  __chkstk_darwin(v18);
  v79 = (char *)&v64 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = a1;
  sub_1000076D8(0, &qword_1000F0310, (uint64_t (*)(uint64_t))sub_10009D65C, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for TupleView);
  v21 = v20;
  v22 = sub_10009DC70();
  Form.init(content:)(sub_10009E280, v82, v21, v22);
  v23 = LocalizedStringKey.init(stringLiteral:)(0x442074726F707845, 0xEE00746573617461);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v30 = sub_10009DCD0();
  View.navigationTitle(_:)(v23, v25, v27 & 1, v29, v7, v30);
  swift_bridgeObjectRelease(v29);
  v31 = swift_bridgeObjectRelease(v25);
  (*(void (**)(char *, uint64_t, __n128))(v65 + 8))(v9, v7, v31);
  v32 = v68;
  v33 = v67;
  v34 = v69;
  (*(void (**)(char *, _QWORD, uint64_t))(v68 + 104))(v67, enum case for NavigationBarItem.TitleDisplayMode.inline(_:), v69);
  v84 = v7;
  v85 = v30;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v84, &opaque type descriptor for <<opaque return type of View.navigationTitle(_:)>>, 1);
  View.navigationBarTitleDisplayMode(_:)(v33, v12, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v34);
  (*(void (**)(char *, uint64_t))(v66 + 8))(v14, v12);
  v36 = v64;
  v81 = v64;
  sub_1000076D8(0, &qword_1000F03E0, (uint64_t (*)(uint64_t))sub_10009DCEC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for TupleToolbarContent);
  v38 = v37;
  v84 = v12;
  v85 = OpaqueTypeConformance2;
  v39 = swift_getOpaqueTypeConformance2(&v84, &opaque type descriptor for <<opaque return type of View.navigationBarTitleDisplayMode(_:)>>, 1);
  v40 = sub_10009E0B4();
  v41 = v78;
  View.toolbar<A>(content:)(sub_10009E288, v80, v78, v38, v39, v40);
  (*(void (**)(char *, uint64_t))(v70 + 8))(v17, v41);
  v42 = v36 + *(int *)(v71 + 40);
  v43 = *(_BYTE *)v42;
  v44 = *(_QWORD *)(v42 + 8);
  v88 = v43;
  v89 = v44;
  sub_1000138C8(0, &qword_1000EEE10, (uint64_t)&type metadata for Bool, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for State);
  State.projectedValue.getter(&v84);
  v45 = v84;
  v46 = v85;
  v47 = v86;
  v48 = v72;
  sub_10001375C(v36, v72, type metadata accessor for ExportDatasetView);
  v49 = *(unsigned __int8 *)(v74 + 80);
  v50 = (v49 + 16) & ~v49;
  v51 = swift_allocObject(&unk_1000E23B0, v50 + v75, v49 | 7);
  sub_1000697F4(v48, v51 + v50, type metadata accessor for ExportDatasetView);
  sub_10009E114(0);
  v53 = v52;
  v84 = v78;
  v85 = v38;
  v86 = v39;
  v87 = v40;
  v54 = swift_getOpaqueTypeConformance2(&v84, &opaque type descriptor for <<opaque return type of View.toolbar<A>(content:)>>, 1);
  sub_10009E198(255, &qword_1000F0450, (uint64_t (*)(uint64_t, _QWORD *))type metadata accessor for SearchableListView);
  v56 = v55;
  v57 = sub_10009E228();
  v84 = v56;
  v85 = v57;
  v58 = swift_getOpaqueTypeConformance2(&v84, &opaque type descriptor for <<opaque return type of View.interactiveDismissDisabled(_:)>>, 1);
  v63 = v54;
  v59 = v47;
  v60 = v73;
  v61 = v79;
  View.sheet<A>(isPresented:onDismiss:content:)(v45, v46, v59, 0, 0, sub_10009E294, v51, v73, v53, v63, v58);
  swift_release(v46);
  swift_release(v51);
  swift_release(v45);
  return (*(uint64_t (**)(char *, uint64_t))(v76 + 8))(v61, v60);
}

uint64_t sub_100093164@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  void (*v37)(char *, char *, uint64_t);
  char *v38;
  uint64_t v39;
  void (*v40)(char *, char *, uint64_t);
  char *v41;
  char *v42;
  uint64_t v43;
  void (*v44)(char *, char *, uint64_t);
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t);
  void (*v51)(char *, uint64_t);
  void (*v52)(char *, uint64_t);
  uint64_t v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  char *v65;
  char *v66;
  uint64_t v67;
  _BYTE v68[16];
  uint64_t v69;
  _BYTE v70[16];
  uint64_t v71;
  _BYTE v72[16];
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  uint64_t v77;

  v64 = a2;
  sub_10009DB94(0);
  v63 = v3;
  v67 = *(_QWORD *)(v3 - 8);
  v4 = __chkstk_darwin(v3);
  v62 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v66 = (char *)&v54 - v6;
  sub_10009DAB4(0, &qword_1000F03A0, &qword_1000F03A8, (uint64_t (*)(uint64_t))sub_10009DB24);
  v61 = v7;
  v56 = *(_QWORD *)(v7 - 8);
  v8 = v56;
  v9 = __chkstk_darwin(v7);
  v65 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v12 = (char *)&v54 - v11;
  v55 = (char *)&v54 - v11;
  sub_10009DAB4(0, &qword_1000F0320, &qword_1000F0328, (uint64_t (*)(uint64_t))sub_10009D710);
  v60 = v13;
  v58 = *(_QWORD *)(v13 - 8);
  v14 = v58;
  v15 = __chkstk_darwin(v13);
  v59 = (char *)&v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v18 = (char *)&v54 - v17;
  v19 = LocalizedStringKey.init(stringLiteral:)(0x7079542061746144, 0xEA00000000007365);
  v74 = Text.init(_:tableName:bundle:comment:)(v19);
  v75 = v20;
  v76 = v21 & 1;
  v77 = v22;
  v73 = a1;
  sub_1000076D8(0, &qword_1000F0328, (uint64_t (*)(uint64_t))sub_10009D710, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for TupleView);
  v24 = v23;
  v25 = sub_10009E62C();
  v57 = v18;
  Section<>.init(header:content:)(&v74, sub_10009E624, v72, &type metadata for Text, v24, &protocol witness table for Text, v25);
  v26 = LocalizedStringKey.init(stringLiteral:)(0x6E61522065746144, 0xEA00000000006567);
  v74 = Text.init(_:tableName:bundle:comment:)(v26);
  v75 = v27;
  v76 = v28 & 1;
  v77 = v29;
  v71 = a1;
  sub_1000076D8(0, &qword_1000F03A8, (uint64_t (*)(uint64_t))sub_10009DB24, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for TupleView);
  v31 = v30;
  v32 = sub_10009E694();
  Section<>.init(header:content:)(&v74, sub_10009E68C, v70, &type metadata for Text, v31, &protocol witness table for Text, v32);
  v69 = a1;
  sub_10009DBF4(0);
  v34 = v33;
  v35 = sub_10009E6FC(&qword_1000F0490, (uint64_t (*)(uint64_t))sub_10009DBF4, (void (*)(void))sub_100069550);
  v36 = v66;
  Section<>.init(content:)(sub_10009E6F4, v68, v34, v35);
  v37 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v38 = v59;
  v39 = v60;
  v37(v59, v18, v60);
  v40 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v41 = v65;
  v42 = v12;
  v43 = v61;
  v40(v65, v42, v61);
  v44 = *(void (**)(char *, char *, uint64_t))(v67 + 16);
  v45 = v62;
  v46 = v63;
  v44(v62, v36, v63);
  v47 = v64;
  v37(v64, v38, v39);
  sub_10009D65C(0);
  v49 = v48;
  v40(&v47[*(int *)(v48 + 48)], v41, v43);
  v44(&v47[*(int *)(v49 + 64)], v45, v46);
  v50 = *(void (**)(char *, uint64_t))(v67 + 8);
  v50(v66, v46);
  v51 = *(void (**)(char *, uint64_t))(v56 + 8);
  v51(v55, v43);
  v52 = *(void (**)(char *, uint64_t))(v58 + 8);
  v52(v57, v39);
  v50(v45, v46);
  v51(v65, v43);
  return ((uint64_t (*)(char *, uint64_t))v52)(v38, v39);
}

uint64_t sub_100093618@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
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
  uint64_t v13;
  uint64_t v14;
  void *v15;
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
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t OpaqueTypeConformance2;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  void (*v42)(char *, char *, uint64_t);
  uint64_t v43;
  char *v44;
  uint64_t v45;
  void (*v46)(char *, char *, uint64_t);
  uint64_t v47;
  char *v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t);
  void (*v51)(char *, uint64_t);
  uint64_t KeyPath;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  _QWORD *v68;

  v62 = a2;
  sub_10009D8E0(0);
  v60 = *(_QWORD *)(v3 - 8);
  v61 = v3;
  v4 = __chkstk_darwin(v3);
  v59 = (char *)&KeyPath - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v58 = (char *)&KeyPath - v6;
  v7 = type metadata accessor for ExportDatasetView(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  __chkstk_darwin(v7);
  v10 = (char *)&KeyPath - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10009D72C(0);
  v56 = *(_QWORD *)(v11 - 8);
  v57 = v11;
  v12 = __chkstk_darwin(v11);
  v55 = (char *)&KeyPath - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v63 = (char *)&KeyPath - v14;
  v15 = *(void **)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v54 = a1;
  v64 = v15;
  v65 = v16;
  sub_1000076D8(0, &qword_1000F0468, (uint64_t (*)(uint64_t))sub_100092808, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  State.wrappedValue.getter(&v68);
  v17 = (uint64_t)v68;
  v18 = sub_100078B0C((uint64_t)v68);
  swift_bridgeObjectRelease(v17);
  v68 = v18;
  KeyPath = swift_getKeyPath(&unk_1000B6548);
  sub_10001375C(a1, (uint64_t)v10, type metadata accessor for ExportDatasetView);
  v19 = *(unsigned __int8 *)(v8 + 80);
  v20 = (v19 + 16) & ~v19;
  v21 = v20 + v9;
  v22 = v19 | 7;
  v23 = swift_allocObject(&unk_1000E2478, v21, v19 | 7);
  sub_1000697F4((uint64_t)v10, v23 + v20, type metadata accessor for ExportDatasetView);
  sub_1000138C8(0, &qword_1000F0340, (uint64_t)&type metadata for HKDataType, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for Array);
  v25 = v24;
  sub_10009D7DC(0);
  v27 = v26;
  v28 = sub_10009DA54();
  v29 = sub_10007C010();
  sub_10009D87C(255);
  v31 = v30;
  v32 = sub_10009E6FC(&qword_1000F0380, (uint64_t (*)(uint64_t))sub_10009D87C, (void (*)(void))sub_10009DA38);
  v64 = &type metadata for Text;
  v65 = v31;
  v66 = &protocol witness table for Text;
  v67 = v32;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v64, &opaque type descriptor for <<opaque return type of View.swipeActions<A>(edge:allowsFullSwipe:content:)>>, 1);
  v34 = v63;
  ForEach<>.init(_:id:content:)(&v68, KeyPath, sub_10009EC3C, v23, v25, v27, v28, v29, OpaqueTypeConformance2);
  sub_10001375C(v54, (uint64_t)v10, type metadata accessor for ExportDatasetView);
  v35 = swift_allocObject(&unk_1000E24A0, v21, v22);
  sub_1000697F4((uint64_t)v10, v35 + v20, type metadata accessor for ExportDatasetView);
  sub_10009D958();
  v37 = v36;
  v38 = sub_100013198(&qword_1000F0368, (uint64_t (*)(uint64_t))sub_10009D958, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  v39 = v58;
  Button.init(action:label:)(sub_10009EC8C, v35, sub_100093FEC, 0, v37, v38);
  v40 = v55;
  v41 = v56;
  v42 = *(void (**)(char *, char *, uint64_t))(v56 + 16);
  v43 = v57;
  v42(v55, v34, v57);
  v44 = v59;
  v45 = v60;
  v46 = *(void (**)(char *, char *, uint64_t))(v60 + 16);
  v47 = v61;
  v46(v59, v39, v61);
  v48 = v62;
  v42(v62, v40, v43);
  sub_10009D710(0);
  v46(&v48[*(int *)(v49 + 48)], v44, v47);
  v50 = *(void (**)(char *, uint64_t))(v45 + 8);
  v50(v39, v47);
  v51 = *(void (**)(char *, uint64_t))(v41 + 8);
  v51(v63, v43);
  v50(v44, v47);
  return ((uint64_t (*)(char *, uint64_t))v51)(v40, v43);
}

double sub_100093A04(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double result;
  _QWORD v14[4];
  char v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;

  v3 = *(_QWORD *)a1;
  v4 = *(_BYTE *)(a1 + 8);
  v16 = sub_100093AF0(*(_QWORD *)a1);
  v17 = v5;
  v6 = sub_10002D0D0();
  v16 = Text.init<A>(_:)(&v16, &type metadata for String, v6);
  v17 = v7;
  v18 = v8 & 1;
  v19 = v9;
  v14[2] = a2;
  v14[3] = v3;
  v15 = v4;
  sub_10009D87C(0);
  v11 = v10;
  v12 = sub_10009E6FC(&qword_1000F0380, (uint64_t (*)(uint64_t))sub_10009D87C, (void (*)(void))sub_10009DA38);
  View.swipeActions<A>(edge:allowsFullSwipe:content:)(1, 1, sub_10009ECB8, v14, &type metadata for Text, v11, &protocol witness table for Text, v12);
  sub_1000308FC(v16, v17, v18);
  *(_QWORD *)&result = swift_bridgeObjectRelease(v19).n128_u64[0];
  return result;
}

uint64_t sub_100093AF0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  Swift::String v5;
  void *object;
  Swift::Bool v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  Swift::String v24;
  void *v25;
  Swift::Bool v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v4 = v3;
  v5._countAndFlagsBits = static HKSampleDataCodingConstants.categoryTypeIdentifierPrefix.getter(v2);
  object = v5._object;
  v7 = String.hasPrefix(_:)(v5);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(object);
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v9 = v8;
  v11 = v10;
  if (v7)
  {
    v12 = static HKSampleDataCodingConstants.categoryTypeIdentifierPrefix.getter(v8);
    v14 = v13;
    v15 = String.count.getter(v12, v13);
    swift_bridgeObjectRelease(v14);
    v16 = sub_10009EF3C(v15, v9, v11);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    swift_bridgeObjectRelease(v11);
    v23 = v16;
LABEL_5:
    v28 = static String._fromSubstring(_:)(v23, v18, v20, v22);
    swift_bridgeObjectRelease(v22);
    return v28;
  }
  v24._countAndFlagsBits = static HKSampleDataCodingConstants.quantityTypeIdentifierPrefix.getter(v8);
  v25 = v24._object;
  v26 = String.hasPrefix(_:)(v24);
  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v25);
  v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v28 = v27;
  v30 = v29;
  if (v26)
  {
    v31 = static HKSampleDataCodingConstants.quantityTypeIdentifierPrefix.getter(v27);
    v33 = v32;
    v34 = String.count.getter(v31, v32);
    swift_bridgeObjectRelease(v33);
    v35 = sub_10009EF3C(v34, v28, v30);
    v18 = v36;
    v20 = v37;
    v22 = v38;
    swift_bridgeObjectRelease(v30);
    v23 = v35;
    goto LABEL_5;
  }
  return v28;
}

uint64_t sub_100093C54@<X0>(uint64_t a1@<X0>, void *a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t KeyPath;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v33;
  uint64_t v34;

  v33 = a4;
  v7 = type metadata accessor for ExportDatasetView(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  __chkstk_darwin(v7);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10009D8E0(0);
  v12 = v11;
  v13 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001375C(a1, (uint64_t)v10, type metadata accessor for ExportDatasetView);
  v16 = *(unsigned __int8 *)(v8 + 80);
  v17 = (v16 + 16) & ~v16;
  v18 = (v9 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  v19 = swift_allocObject(&unk_1000E24C8, v18 + 9, v16 | 7);
  sub_1000697F4((uint64_t)v10, v19 + v17, type metadata accessor for ExportDatasetView);
  v20 = v19 + v18;
  *(_QWORD *)v20 = a2;
  *(_BYTE *)(v20 + 8) = a3 & 1;
  sub_10009D958();
  v22 = v21;
  v23 = sub_100013198(&qword_1000F0368, (uint64_t (*)(uint64_t))sub_10009D958, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  v24 = a2;
  v25 = Button.init(action:label:)(sub_10009EE90, v19, sub_100093F18, 0, v22, v23);
  v26 = static Color.red.getter(v25);
  KeyPath = swift_getKeyPath(&unk_1000B6560);
  v34 = v26;
  swift_retain(v26);
  v28 = AnyShapeStyle.init<A>(_:)(&v34, &type metadata for Color, &protocol witness table for Color);
  v29 = v33;
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 16))(v33, v15, v12);
  swift_release(v26);
  sub_10009D87C(0);
  v31 = (uint64_t *)(v29 + *(int *)(v30 + 36));
  *v31 = KeyPath;
  v31[1] = v28;
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

double sub_100093E54(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  double result;
  _QWORD v12[3];
  uint64_t v13;

  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3 & 1;
  sub_1000076D8(0, &qword_1000F0468, (uint64_t (*)(uint64_t))sub_100092808, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  v8 = v7;
  swift_bridgeObjectRetain(v4);
  swift_retain(v5);
  State.wrappedValue.getter(&v13);
  v9 = (void *)sub_10009AED4(a2, v6);
  sub_10009EF28(v9, v10);
  v12[1] = v4;
  v12[2] = v5;
  v12[0] = v13;
  State.wrappedValue.setter(v12, v8);
  swift_release(v5);
  *(_QWORD *)&result = swift_bridgeObjectRelease(v4).n128_u64[0];
  return result;
}

uint64_t sub_100093F18()
{
  uint64_t v0;

  v0 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000010, 0x80000001000BF030);
  return Label<>.init(_:systemImage:)(v0);
}

uint64_t sub_100093F70(uint64_t a1)
{
  char *v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[9];
  uint64_t v7;

  v1 = (char *)(a1 + *(int *)(type metadata accessor for ExportDatasetView(0) + 40));
  v2 = *v1;
  v3 = *((_QWORD *)v1 + 1);
  v6[1] = v2;
  v7 = v3;
  v6[0] = 1;
  sub_1000138C8(0, &qword_1000EEE10, (uint64_t)&type metadata for Bool, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for State);
  return State.wrappedValue.setter(v6, v4);
}

uint64_t sub_100093FEC()
{
  return sub_100095480(0x6174614420646441, 0xEE00736570795420);
}

uint64_t sub_100094028@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
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
  int v20;
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
  unint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  void (*v43)(char *, char *, uint64_t);
  char *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t);
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  char *v67;
  char *v68;
  char *v69;
  _QWORD v70[2];

  v63 = a1;
  v68 = a2;
  v2 = type metadata accessor for DatePickerComponents(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000076D8(0, &qword_1000F04C0, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Binding);
  __chkstk_darwin(v6);
  v8 = (uint64_t *)((char *)&v50 - v7);
  sub_100069050(0, &qword_1000F03B8, (uint64_t (*)(_QWORD, void *, void *))&type metadata accessor for DatePicker);
  v10 = v9;
  v66 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v67 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v11);
  v65 = (char *)&v50 - v14;
  v15 = __chkstk_darwin(v13);
  v64 = (char *)&v50 - v16;
  __chkstk_darwin(v15);
  v69 = (char *)&v50 - v17;
  v18 = LocalizedStringKey.init(stringLiteral:)(0x7472617453, 0xE500000000000000);
  v59 = v19;
  v60 = v18;
  v57 = v20;
  v58 = v21;
  v62 = type metadata accessor for ExportDatasetView(0);
  sub_1000076D8(0, &qword_1000F0218, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  v61 = v22;
  State.projectedValue.getter(v8);
  sub_1000076D8(0, &qword_1000F04C8, (uint64_t (*)(uint64_t))&type metadata accessor for DatePickerComponents, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v23 = *(_QWORD *)(v3 + 72);
  v24 = *(unsigned __int8 *)(v3 + 80);
  v55 = ((v24 + 32) & ~v24) + 2 * v23;
  v56 = v25;
  v53 = v23;
  v54 = v24 | 7;
  v26 = swift_allocObject(v25, v55, v24 | 7);
  v52 = xmmword_1000B1580;
  *(_OWORD *)(v26 + 16) = xmmword_1000B1580;
  v27 = static DatePickerComponents.hourAndMinute.getter();
  static DatePickerComponents.date.getter(v27);
  v70[0] = v26;
  v28 = sub_100013198(&qword_1000F04D0, (uint64_t (*)(uint64_t))&type metadata accessor for DatePickerComponents, (uint64_t)&protocol conformance descriptor for DatePickerComponents);
  v51 = v28;
  sub_1000076D8(0, &qword_1000F04D8, (uint64_t (*)(uint64_t))&type metadata accessor for DatePickerComponents, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  v30 = v29;
  v31 = sub_10009EBD8();
  dispatch thunk of SetAlgebra.init<A>(_:)(v70, v30, v31, v2, v28);
  v32 = v5;
  DatePicker<>.init(_:selection:displayedComponents:)(v60, v59, v57 & 1, v58, v8, v5);
  v33 = LocalizedStringKey.init(stringLiteral:)(6581829, 0xE300000000000000);
  v59 = v34;
  v60 = v33;
  LOBYTE(v3) = v35;
  v37 = v36;
  State.projectedValue.getter(v8);
  v38 = swift_allocObject(v56, v55, v54);
  *(_OWORD *)(v38 + 16) = v52;
  v39 = static DatePickerComponents.hourAndMinute.getter();
  static DatePickerComponents.date.getter(v39);
  v70[0] = v38;
  dispatch thunk of SetAlgebra.init<A>(_:)(v70, v30, v31, v2, v51);
  v40 = v64;
  DatePicker<>.init(_:selection:displayedComponents:)(v60, v59, v3 & 1, v37, v8, v32);
  v41 = v65;
  v42 = v66;
  v43 = *(void (**)(char *, char *, uint64_t))(v66 + 16);
  v44 = v69;
  v43(v65, v69, v10);
  v45 = v67;
  v43(v67, v40, v10);
  v46 = v68;
  v43(v68, v41, v10);
  sub_10009DB24(0);
  v43(&v46[*(int *)(v47 + 48)], v45, v10);
  v48 = *(void (**)(char *, uint64_t))(v42 + 8);
  v48(v40, v10);
  v48(v44, v10);
  v48(v45, v10);
  return ((uint64_t (*)(char *, uint64_t))v48)(v41, v10);
}

uint64_t sub_100094450@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char v26;
  uint64_t v27;
  char v28;
  uint64_t KeyPath;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v35 = a2;
  v33 = type metadata accessor for ExportDatasetView(0);
  v3 = *(_QWORD *)(v33 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  v5 = __chkstk_darwin(v33);
  v6 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v8 = (char *)&v33 - v7;
  sub_10009D8E0(0);
  v10 = v9;
  v11 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10009DBF4(0);
  v34 = v14;
  __chkstk_darwin(v14);
  v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001375C(a1, (uint64_t)v8, type metadata accessor for ExportDatasetView);
  v17 = *(unsigned __int8 *)(v3 + 80);
  v18 = (v17 + 16) & ~v17;
  v19 = swift_allocObject(&unk_1000E2400, v18 + v4, v17 | 7);
  sub_1000697F4((uint64_t)v8, v19 + v18, type metadata accessor for ExportDatasetView);
  sub_10009D958();
  v21 = v20;
  v22 = sub_100013198(&qword_1000F0368, (uint64_t (*)(uint64_t))sub_10009D958, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  Button.init(action:label:)(sub_10009E784, v19, sub_100094D0C, 0, v21, v22);
  v23 = *(_QWORD *)(a1 + 32);
  v36 = *(_QWORD *)(a1 + 24);
  v37 = v23;
  sub_1000076D8(0, &qword_1000F0468, (uint64_t (*)(uint64_t))sub_100092808, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  State.wrappedValue.getter(&v38);
  v24 = *(_QWORD *)(v38 + 16);
  swift_bridgeObjectRelease(v38);
  sub_10001375C(a1, (uint64_t)v6, type metadata accessor for ExportDatasetView);
  if (v24)
  {
    v25 = &v6[*(int *)(v33 + 44)];
    v26 = *v25;
    v27 = *((_QWORD *)v25 + 1);
    LOBYTE(v36) = v26;
    v37 = v27;
    sub_1000138C8(0, &qword_1000EEE10, (uint64_t)&type metadata for Bool, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for State);
    State.wrappedValue.getter(&v38);
    sub_1000137A0((uint64_t)v6, type metadata accessor for ExportDatasetView);
    v28 = v38;
  }
  else
  {
    sub_1000137A0((uint64_t)v6, type metadata accessor for ExportDatasetView);
    v28 = 1;
  }
  KeyPath = swift_getKeyPath(&unk_1000B6510);
  v30 = swift_allocObject(&unk_1000E2428, 17, 7);
  *(_BYTE *)(v30 + 16) = v28;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v16, v13, v10);
  v31 = (uint64_t *)&v16[*(int *)(v34 + 36)];
  *v31 = KeyPath;
  v31[1] = (uint64_t)sub_10009E7D4;
  v31[2] = v30;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return sub_1000697F4((uint64_t)v16, v35, (uint64_t (*)(_QWORD))sub_10009DBF4);
}

void sub_10009473C()
{
  void **v0;
  void **v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  uint64_t v18;
  char *v19;
  char v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  HKQuantityType v30;
  Class isa;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  void *v38;
  _QWORD *v39;
  uint64_t v40;
  void **v41;
  _QWORD *v42;
  _QWORD *v43;
  char *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
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
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  void **v66;
  uint64_t v67;
  _QWORD *v68;
  _QWORD *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  void *v79;
  _QWORD v80[2];

  v1 = v0;
  v2 = type metadata accessor for ExportDatasetView(0);
  v73 = *(_QWORD *)(v2 - 8);
  v3 = *(_QWORD *)(v73 + 64);
  __chkstk_darwin(v2);
  v75 = (char *)&v62 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000076D8(0, &qword_1000ECA88, (uint64_t (*)(uint64_t))&type metadata accessor for TaskPriority, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v4);
  v74 = (char *)&v62 - v5;
  v70 = type metadata accessor for SampleExporter(0);
  v72 = *(_QWORD *)(v70 - 8);
  v6 = *(_QWORD *)(v72 + 64);
  v7 = __chkstk_darwin(v70);
  __chkstk_darwin(v7);
  v9 = (uint64_t *)((char *)&v62 - v8);
  v10 = type metadata accessor for Date(0);
  v11 = __chkstk_darwin(v10);
  v69 = (uint64_t *)((char *)&v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v11);
  v68 = (uint64_t *)((char *)&v62 - v13);
  v14 = type metadata accessor for DateInterval(0);
  v76 = *(_QWORD *)(v14 - 8);
  v77 = v14;
  __chkstk_darwin(v14);
  v71 = (char *)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = v0[3];
  v17 = v0[4];
  v78 = v16;
  v79 = v17;
  sub_1000076D8(0, &qword_1000F0468, (uint64_t (*)(uint64_t))sub_100092808, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  State.wrappedValue.getter(v80);
  v18 = *(_QWORD *)(v80[0] + 16);
  swift_bridgeObjectRelease(v80[0]);
  if (v18)
  {
    v65 = v6;
    v66 = v1;
    v67 = (uint64_t)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    v19 = (char *)v1 + *(int *)(v2 + 44);
    v20 = *v19;
    v21 = (void *)*((_QWORD *)v19 + 1);
    LOBYTE(v78) = v20;
    v79 = v21;
    LOBYTE(v80[0]) = 1;
    sub_1000138C8(0, &qword_1000EEE10, (uint64_t)&type metadata for Bool, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for State);
    State.wrappedValue.setter(v80, v22);
    v78 = v16;
    v79 = v17;
    State.wrappedValue.getter(v80);
    v23 = v80[0];
    v24 = *(_QWORD *)(v80[0] + 16);
    if (v24)
    {
      v62 = v2;
      v63 = v9;
      v64 = v3;
      v78 = _swiftEmptyArrayStorage;
      specialized ContiguousArray.reserveCapacity(_:)(v24);
      v25 = sub_10009B2E0(v23);
      v27 = v26;
      v29 = v28 & 1;
      while ((v25 & 0x8000000000000000) == 0 && v25 < 1 << *(_BYTE *)(v23 + 32))
      {
        if (((*(_QWORD *)(v23 + 56 + (((unint64_t)v25 >> 3) & 0xFFFFFFFFFFFFF8)) >> v25) & 1) == 0)
          goto LABEL_17;
        if (*(_DWORD *)(v23 + 36) != (_DWORD)v27)
          goto LABEL_18;
        v37 = *(_QWORD *)(v23 + 48) + 16 * v25;
        v38 = *(void **)v37;
        if ((*(_BYTE *)(v37 + 8) & 1) != 0)
        {
          sub_100006D10(0, &qword_1000EF648, HKQuantityType_ptr);
          v30.super.super.super.isa = HKQuantityType.init(_:)((__C::HKQuantityTypeIdentifier)v38).super.super.super.isa;
        }
        else
        {
          sub_100006D10(0, &qword_1000EF630, HKCategoryType_ptr);
          v30.super.super.super.isa = HKCategoryType.init(_:)((__C::HKCategoryTypeIdentifier)v38).super.super.super.isa;
        }
        isa = v30.super.super.super.isa;
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v30.super.super.super.isa);
        v32 = v78[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v32);
        v33 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v32, isa);
        specialized ContiguousArray._endMutation()(v33);
        v34 = sub_1000438B8(v25, v27, v29 & 1, v23);
        v25 = v34;
        v27 = v35;
        v29 = v36 & 1;
        if (!--v24)
        {
          sub_100044190(v34, v35, v36 & 1);
          v39 = v78;
          swift_bridgeObjectRelease(v23);
          v40 = (uint64_t)v75;
          v9 = v63;
          v3 = v64;
          v41 = v66;
          goto LABEL_14;
        }
      }
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      __break(1u);
    }
    else
    {
      swift_bridgeObjectRelease(v80[0]);
      v39 = _swiftEmptyArrayStorage;
      v41 = v66;
      v40 = (uint64_t)v75;
LABEL_14:
      sub_1000076D8(0, &qword_1000F0218, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
      v42 = v68;
      State.wrappedValue.getter(v68);
      v43 = v69;
      State.wrappedValue.getter(v69);
      v44 = v71;
      DateInterval.init(start:end:)(v42, v43);
      v45 = v70;
      (*(void (**)(char *, char *, uint64_t))(v76 + 16))((char *)v9 + *(int *)(v70 + 20), v44, v77);
      v46 = *v41;
      v47 = (void *)objc_opt_self(NSFileManager);
      v48 = v46;
      v49 = objc_msgSend(v47, "defaultManager");
      *v9 = v39;
      *(_QWORD *)((char *)v9 + *(int *)(v45 + 24)) = v48;
      *(_QWORD *)((char *)v9 + *(int *)(v45 + 28)) = v49;
      v50 = type metadata accessor for TaskPriority(0);
      v51 = (uint64_t)v74;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56))(v74, 1, 1, v50);
      sub_10001375C((uint64_t)v41, v40, type metadata accessor for ExportDatasetView);
      v52 = v40;
      v53 = v67;
      sub_10001375C((uint64_t)v9, v67, type metadata accessor for SampleExporter);
      v54 = type metadata accessor for MainActor(0);
      v55 = static MainActor.shared.getter(v54);
      v56 = *(unsigned __int8 *)(v73 + 80);
      v57 = (v56 + 32) & ~v56;
      v58 = *(unsigned __int8 *)(v72 + 80);
      v59 = (v3 + v58 + v57) & ~v58;
      v60 = swift_allocObject(&unk_1000E2450, v59 + v65, v56 | v58 | 7);
      *(_QWORD *)(v60 + 16) = v55;
      *(_QWORD *)(v60 + 24) = &protocol witness table for MainActor;
      sub_1000697F4(v52, v60 + v57, type metadata accessor for ExportDatasetView);
      sub_1000697F4(v53, v60 + v59, type metadata accessor for SampleExporter);
      v61 = sub_10001DAB0(v51, (uint64_t)&unk_1000F04A0, v60);
      swift_release(v61);
      sub_1000137A0((uint64_t)v9, type metadata accessor for SampleExporter);
      (*(void (**)(char *, uint64_t))(v76 + 8))(v44, v77);
    }
  }
}

uint64_t sub_100094D0C()
{
  return sub_100095480(0x7551206E69676542, 0xEB00000000797265);
}

uint64_t sub_100094D44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t OpaqueTypeConformance2;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(char *, _QWORD *, uint64_t);
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v64;
  char *v65;
  char *v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  char v76[16];
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  v75 = a2;
  sub_10009DCEC(0);
  v74 = v3;
  __chkstk_darwin(v3);
  v73 = (char *)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10009DEB4(0);
  v72 = v5;
  v67 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v66 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000927EC(0);
  __chkstk_darwin(v7);
  v9 = (char **)((char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = type metadata accessor for URL(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v65 = (char *)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10009DDF4(0);
  v14 = __chkstk_darwin(v13);
  v68 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v71 = (char *)&v64 - v16;
  v17 = type metadata accessor for ToolbarItemPlacement(0);
  v18 = __chkstk_darwin(v17);
  v64 = (char *)&v64 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v21 = (char *)&v64 - v20;
  sub_10009DD78(0);
  v23 = v22;
  v24 = *(_QWORD *)(v22 - 8);
  v25 = __chkstk_darwin(v22);
  v27 = (char *)&v64 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __chkstk_darwin(v25);
  v30 = (char *)&v64 - v29;
  static ToolbarItemPlacement.cancellationAction.getter(v28);
  v77 = a1;
  sub_100069050(0, &qword_1000EEDB8, (uint64_t (*)(_QWORD, void *, void *))&type metadata accessor for Button);
  v32 = v31;
  v33 = sub_1000694F8();
  ToolbarItem<>.init(placement:content:)(v21, sub_10009E414, v76, v32, v33);
  v69 = v24;
  v70 = v23;
  v34 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
  v35 = v30;
  v34(v30, v27, v23);
  type metadata accessor for ExportDatasetView(0);
  sub_1000076D8(0, &qword_1000F0220, (uint64_t (*)(uint64_t))sub_1000927EC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  State.wrappedValue.getter(v9);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_1000137A0((uint64_t)v9, (uint64_t (*)(_QWORD))sub_1000927EC);
    sub_10009DE10(0);
    v37 = v36;
    v38 = (uint64_t)v68;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v68, 1, 1, v36);
    v39 = sub_10009E098();
    v78 = v72;
    v79 = v39;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v78, &opaque type descriptor for <<opaque return type of static ToolbarContentBuilder.buildBlock<A>(_:)>>, 1);
    v41 = (uint64_t)v71;
    static ToolbarContentBuilder.buildIf<A>(_:)(v38, v37, OpaqueTypeConformance2);
    sub_1000137A0(v38, (uint64_t (*)(_QWORD))sub_10009DDF4);
  }
  else
  {
    v42 = v11;
    v43 = *(uint64_t (**)(char *, _QWORD *, uint64_t))(v11 + 32);
    v44 = v65;
    v45 = v43(v65, v9, v10);
    v46 = v64;
    v47 = static ToolbarItemPlacement.primaryAction.getter(v45);
    __chkstk_darwin(v47);
    *(&v64 - 2) = v44;
    sub_10009DF38(0);
    v49 = v48;
    v50 = sub_100013198(&qword_1000F0430, (uint64_t (*)(uint64_t))sub_10009DF38, (uint64_t)&protocol conformance descriptor for ShareLink<A, B, C, D>);
    v51 = v66;
    ToolbarItem<>.init(placement:content:)(v46, sub_10009E41C, &v64 - 4, v49, v50);
    v52 = sub_10009E098();
    v53 = (uint64_t)v68;
    v54 = v72;
    static ToolbarContentBuilder.buildBlock<A>(_:)(v51, v72, v52);
    sub_10009DE10(0);
    v56 = v55;
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 56))(v53, 0, 1, v55);
    v78 = v54;
    v79 = v52;
    v57 = swift_getOpaqueTypeConformance2(&v78, &opaque type descriptor for <<opaque return type of static ToolbarContentBuilder.buildBlock<A>(_:)>>, 1);
    v41 = (uint64_t)v71;
    static ToolbarContentBuilder.buildIf<A>(_:)(v53, v56, v57);
    sub_1000137A0(v53, (uint64_t (*)(_QWORD))sub_10009DDF4);
    (*(void (**)(char *, uint64_t))(v67 + 8))(v51, v54);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v44, v10);
  }
  v59 = v73;
  v58 = v74;
  v60 = (uint64_t)&v73[*(int *)(v74 + 48)];
  v61 = v69;
  v62 = v70;
  (*(void (**)(char *, char *, uint64_t))(v69 + 16))(v73, v35, v70);
  sub_10001375C(v41, v60, (uint64_t (*)(_QWORD))sub_10009DDF4);
  TupleToolbarContent.init(_:)(v59, v58);
  sub_1000137A0(v41, (uint64_t (*)(_QWORD))sub_10009DDF4);
  return (*(uint64_t (**)(char *, uint64_t))(v61 + 8))(v35, v62);
}

uint64_t sub_10009527C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = type metadata accessor for ExportDatasetView(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  __chkstk_darwin(v2);
  sub_10001375C(a1, (uint64_t)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ExportDatasetView);
  v5 = *(unsigned __int8 *)(v3 + 80);
  v6 = (v5 + 16) & ~v5;
  v7 = swift_allocObject(&unk_1000E23D8, v6 + v4, v5 | 7);
  sub_1000697F4((uint64_t)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, type metadata accessor for ExportDatasetView);
  return Button.init(action:label:)(sub_10009E5E0, v7, sub_100095360, 0, &type metadata for Text, &protocol witness table for Text);
}

uint64_t sub_100095360@<X0>(uint64_t a1@<X8>)
{
  return sub_100099ED4(0x6C65636E6143, 0xE600000000000000, a1);
}

uint64_t sub_100095374(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = type metadata accessor for URL(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  sub_10009D958();
  v7 = v6;
  v8 = sub_100013198(&qword_1000F0368, (uint64_t (*)(uint64_t))sub_10009D958, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  return ShareLink<>.init<>(item:subject:message:label:)(v4, 0, 0, 0, 0, 0, 0, 0, 0, sub_100095454, 0, v7, v8);
}

uint64_t sub_100095454()
{
  return sub_100095480(0x74726F707845, 0xE600000000000000);
}

uint64_t sub_100095480(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = LocalizedStringKey.init(stringLiteral:)(a1, a2);
  return Label<>.init(_:systemImage:)(v2);
}

_QWORD *sub_1000954C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  type metadata accessor for ExportDatasetView(0);
  sub_10009E3AC(0, &qword_1000F0460, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  State.projectedValue.getter(&v10);
  v0 = v11;
  v9 = v10;
  v1 = v12;
  sub_1000076D8(0, &qword_1000F0468, (uint64_t (*)(uint64_t))sub_100092808, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  State.projectedValue.getter(&v10);
  v2 = v10;
  v3 = v11;
  v4 = v12;
  sub_1000138C8(0, &qword_1000EEE10, (uint64_t)&type metadata for Bool, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for State);
  State.projectedValue.getter(&v10);
  sub_100095684(0xD000000000000011, 0x80000001000BEF60, v9, v0, v1, v2, v3, v4, (uint64_t)&v10, v10, v11, v12);
  sub_10009E198(0, &qword_1000F0450, (uint64_t (*)(uint64_t, _QWORD *))type metadata accessor for SearchableListView);
  v6 = v5;
  v7 = sub_10009E228();
  View.interactiveDismissDisabled(_:)(1, v6, v7);
  return sub_10009E2D0(&v10);
}

uint64_t sub_100095684@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, char a12)
{
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  int64_t v31;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t result;
  char v48;
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
  _QWORD v66[2];
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;

  v57 = a1;
  v58 = a2;
  v64 = a11;
  v65 = a10;
  sub_10009E198(0, &qword_1000F0178, (uint64_t (*)(uint64_t, _QWORD *))type metadata accessor for SearchableListSection);
  v52 = *(_QWORD *)(v19 - 8);
  __chkstk_darwin(v19);
  v21 = (char *)&v51 - v20;
  v66[0] = 0;
  v66[1] = 0xE000000000000000;
  State.init(wrappedValue:)(&v67, v66, &type metadata for String);
  v55 = v68;
  v56 = v67;
  v54 = v69;
  v70 = a12;
  v67 = a6;
  v68 = a7;
  v69 = a8;
  sub_1000076D8(0, &qword_1000F0470, (uint64_t (*)(uint64_t))sub_100092808, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Binding);
  v62 = a6;
  swift_retain(a6);
  swift_retain(a7);
  v63 = a8;
  swift_bridgeObjectRetain(a8);
  swift_retain(a3);
  swift_retain(a4);
  swift_bridgeObjectRetain(a5);
  swift_retain(v65);
  v22 = v64;
  swift_retain(v64);
  Binding.wrappedValue.getter(v66);
  v53 = v66[0];
  v59 = a3;
  v60 = a4;
  v67 = a3;
  v68 = a4;
  v61 = a5;
  v69 = a5;
  sub_10009E3AC(0, &qword_1000F0478, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Binding);
  Binding.wrappedValue.getter(v66);
  v23 = v66[0];
  v24 = *(_QWORD *)(v66[0] + 16);
  if (!v24)
  {
    swift_release(v22);
    v41 = v65;
    swift_release(v65);
    v27 = _swiftEmptyArrayStorage;
    v40 = v22;
    v42 = v63;
LABEL_25:
    swift_bridgeObjectRelease(v23);
    v43 = v61;
    swift_bridgeObjectRelease(v61);
    v44 = v60;
    swift_release(v60);
    v45 = v59;
    swift_release(v59);
    swift_bridgeObjectRelease(v42);
    swift_release(a7);
    v46 = v62;
    result = swift_release(v62);
    v48 = v70;
    v49 = v58;
    *(_QWORD *)a9 = v57;
    *(_QWORD *)(a9 + 8) = v49;
    *(_QWORD *)(a9 + 16) = v45;
    *(_QWORD *)(a9 + 24) = v44;
    *(_QWORD *)(a9 + 32) = v43;
    *(_QWORD *)(a9 + 40) = v46;
    *(_QWORD *)(a9 + 48) = a7;
    *(_QWORD *)(a9 + 56) = v42;
    *(_QWORD *)(a9 + 64) = v41;
    *(_QWORD *)(a9 + 72) = v40;
    *(_BYTE *)(a9 + 80) = v48;
    *(_QWORD *)(a9 + 88) = v53;
    *(_QWORD *)(a9 + 96) = 0;
    v50 = v55;
    *(_QWORD *)(a9 + 104) = v56;
    *(_QWORD *)(a9 + 112) = v50;
    *(_QWORD *)(a9 + 120) = v54;
    *(_QWORD *)(a9 + 128) = v27;
    return result;
  }
  v51 = a7;
  v25 = v66[0] + ((*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80));
  v26 = *(_QWORD *)(v52 + 72);
  v52 = v66[0];
  swift_bridgeObjectRetain(v66[0]);
  v27 = _swiftEmptyArrayStorage;
  while (1)
  {
    sub_10009BA70(v25, (uint64_t)v21);
    v28 = *((_QWORD *)v21 + 2);
    v29 = *(_QWORD *)(v28 + 16);
    v30 = v27[2];
    v31 = v30 + v29;
    if (__OFADD__(v30, v29))
      break;
    swift_bridgeObjectRetain(*((_QWORD *)v21 + 2));
    isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native(v27);
    if ((_DWORD)isUniquelyReferenced_nonNull_native && v31 <= v27[3] >> 1)
    {
      if (*(_QWORD *)(v28 + 16))
        goto LABEL_14;
    }
    else
    {
      if (v30 <= v31)
        v33 = v30 + v29;
      else
        v33 = v30;
      v27 = sub_100029F7C(isUniquelyReferenced_nonNull_native, v33, 1, v27);
      if (*(_QWORD *)(v28 + 16))
      {
LABEL_14:
        v34 = v27[2];
        if ((v27[3] >> 1) - v34 < v29)
          goto LABEL_28;
        v35 = (unint64_t)&v27[2 * v34 + 4];
        if (v28 + 32 < v35 + 16 * v29 && v35 < v28 + 32 + 16 * v29)
          goto LABEL_30;
        swift_arrayInitWithCopy(v35);
        if (v29)
        {
          v37 = v27[2];
          v38 = __OFADD__(v37, v29);
          v39 = v37 + v29;
          if (v38)
            goto LABEL_29;
          v27[2] = v39;
        }
        goto LABEL_4;
      }
    }
    if (v29)
      goto LABEL_27;
LABEL_4:
    swift_bridgeObjectRelease(v28);
    sub_10009BB18((uint64_t)v21);
    v25 += v26;
    if (!--v24)
    {
      v40 = v64;
      swift_release(v64);
      v41 = v65;
      swift_release(v65);
      v23 = v52;
      swift_bridgeObjectRelease(v52);
      v42 = v63;
      a7 = v51;
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100095A94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4[7] = a4;
  sub_1000927EC(0);
  v6 = (*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4[8] = swift_task_alloc(v6);
  v7 = swift_task_alloc(v6);
  v4[9] = v7;
  v8 = type metadata accessor for MainActor(0);
  v4[10] = v8;
  v4[11] = static MainActor.shared.getter(v8);
  v9 = (_QWORD *)swift_task_alloc(dword_1000F04AC);
  v4[12] = v9;
  *v9 = v4;
  v9[1] = sub_100095B40;
  return sub_100095EA0(v7);
}

uint64_t sub_100095B40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 96);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc(v2);
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  if (v0)
    v6 = sub_100095CFC;
  else
    v6 = sub_100095BC8;
  return swift_task_switch(v6, v5, v4);
}

uint64_t sub_100095BC8()
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
  char v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(v0 + 64);
  v1 = *(_QWORD *)(v0 + 72);
  swift_release(*(_QWORD *)(v0 + 88));
  v3 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v1, 0, 1, v3);
  v4 = type metadata accessor for ExportDatasetView(0);
  sub_10001375C(v1, v2, (uint64_t (*)(_QWORD))sub_1000927EC);
  sub_1000076D8(0, &qword_1000F0220, (uint64_t (*)(uint64_t))sub_1000927EC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  State.wrappedValue.setter(v2, v5);
  sub_1000137A0(v1, (uint64_t (*)(_QWORD))sub_1000927EC);
  v7 = *(_QWORD *)(v0 + 64);
  v6 = *(_QWORD *)(v0 + 72);
  v8 = (char *)(*(_QWORD *)(v0 + 56) + *(int *)(v4 + 44));
  v9 = *v8;
  v10 = *((_QWORD *)v8 + 1);
  *(_BYTE *)(v0 + 32) = v9;
  *(_QWORD *)(v0 + 40) = v10;
  *(_BYTE *)(v0 + 112) = 0;
  sub_1000138C8(0, &qword_1000EEE10, (uint64_t)&type metadata for Bool, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for State);
  State.wrappedValue.setter(v0 + 112, v11);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100095CFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  Swift::String v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;

  v1 = *(_QWORD *)(v0 + 104);
  swift_release(*(_QWORD *)(v0 + 88));
  sub_1000138C8(0, (unint64_t *)&qword_1000EF9C8, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v3 = swift_allocObject(v2, 64, 7);
  *(_OWORD *)(v3 + 16) = xmmword_1000B11F0;
  _StringGuts.grow(_:)(21);
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 0xE000000000000000;
  v4._object = (void *)0x80000001000BEFD0;
  v4._countAndFlagsBits = 0xD000000000000013;
  String.append(_:)(v4);
  *(_QWORD *)(v0 + 48) = v1;
  v5 = sub_100013960();
  _print_unlocked<A, B>(_:_:)(v0 + 48, v0 + 16, v5, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v6 = *(_QWORD *)(v0 + 16);
  v7 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v3 + 56) = &type metadata for String;
  *(_QWORD *)(v3 + 32) = v6;
  *(_QWORD *)(v3 + 40) = v7;
  print(_:separator:terminator:)(v3, 32, 0xE100000000000000, 10, 0xE100000000000000);
  swift_bridgeObjectRelease(v3);
  swift_errorRelease(v1);
  v9 = *(_QWORD *)(v0 + 64);
  v8 = *(_QWORD *)(v0 + 72);
  v10 = *(_QWORD *)(v0 + 56);
  v11 = (char *)(v10 + *(int *)(type metadata accessor for ExportDatasetView(0) + 44));
  v12 = *v11;
  v13 = *((_QWORD *)v11 + 1);
  *(_BYTE *)(v0 + 32) = v12;
  *(_QWORD *)(v0 + 40) = v13;
  *(_BYTE *)(v0 + 112) = 0;
  sub_1000138C8(0, &qword_1000EEE10, (uint64_t)&type metadata for Bool, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for State);
  State.wrappedValue.setter(v0 + 112, v14);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100095EA0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2[5] = a1;
  v2[6] = v1;
  v3 = type metadata accessor for URL(0);
  v2[7] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[8] = v4;
  v5 = (*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[9] = swift_task_alloc(v5);
  v2[10] = swift_task_alloc(v5);
  v6 = type metadata accessor for UUID(0);
  v2[11] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v2[12] = v7;
  v2[13] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Logger(0);
  v2[14] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v8 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for SampleDataEncoder(0);
  v2[15] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v2[16] = v10;
  v2[17] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10009EAF0(0, (unint64_t *)&qword_1000EF870, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for HKSampleQueryDescriptor);
  v2[18] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v2[19] = v12;
  v2[20] = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100095FE4, 0, 0);
}

uint64_t sub_100095FE4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void (*v10)(_QWORD, unint64_t, _QWORD);
  uint64_t v11;
  _QWORD *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __n128 v29;
  void (*v30)(uint64_t, uint64_t, __n128);
  void *v31;
  NSURL *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
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
  unint64_t v63;
  void (*v64)(uint64_t, uint64_t);
  uint64_t v65;

  v1 = *(uint64_t **)(v0 + 48);
  v2 = *v1;
  v3 = swift_task_alloc(32);
  *(_QWORD *)(v3 + 16) = v1;
  swift_bridgeObjectRetain(v2);
  v4 = sub_100092874((void (*)(id *))sub_10009EB58, v3, v2);
  *(_QWORD *)(v0 + 168) = v4;
  swift_bridgeObjectRelease(v2);
  swift_task_dealloc(v3);
  *(_QWORD *)(v0 + 24) = _swiftEmptyArrayStorage;
  v5 = *(_QWORD *)(v4 + 16);
  *(_QWORD *)(v0 + 176) = v5;
  if (v5)
  {
    v6 = *(_QWORD *)(v0 + 152);
    v7 = *(_QWORD *)(v0 + 48);
    v8 = *(int *)(type metadata accessor for SampleExporter(0) + 24);
    *(_DWORD *)(v0 + 232) = v8;
    v9 = *(_DWORD *)(v6 + 80);
    *(_DWORD *)(v0 + 236) = v9;
    *(_QWORD *)(v0 + 184) = *(_QWORD *)(v6 + 72);
    v10 = *(void (**)(_QWORD, unint64_t, _QWORD))(v6 + 16);
    *(_QWORD *)(v0 + 192) = v10;
    *(_QWORD *)(v0 + 200) = 0;
    v10(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 168) + ((v9 + 32) & ~(unint64_t)v9), *(_QWORD *)(v0 + 144));
    v11 = *(_QWORD *)(v7 + v8);
    v12 = (_QWORD *)swift_task_alloc(async function pointer to HKSampleQueryDescriptor.result(for:)[1]);
    *(_QWORD *)(v0 + 208) = v12;
    *v12 = v0;
    v12[1] = sub_10009649C;
    return HKSampleQueryDescriptor.result(for:)(v11, *(_QWORD *)(v0 + 144));
  }
  else
  {
    swift_bridgeObjectRelease(v4);
    v14 = *(_QWORD *)(v0 + 112);
    static Logger.general.getter(v15);
    v16 = SampleDataEncoder.init(samples:logger:)(_swiftEmptyArrayStorage, v14);
    v17 = SampleDataEncoder.encodeSamples()(v16);
    v63 = v18;
    v19 = *(_QWORD *)(v0 + 72);
    v21 = *(_QWORD *)(v0 + 56);
    v20 = *(_QWORD *)(v0 + 64);
    v22 = *(_QWORD *)(v0 + 48);
    UUID.init()(v17);
    v23 = *(int *)(type metadata accessor for SampleExporter(0) + 28);
    v24 = objc_msgSend(*(id *)(v22 + v23), "temporaryDirectory");
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v24);

    v26 = UUID.uuidString.getter(v25);
    v28 = v27;
    URL.appendingPathComponent(_:)(v26);
    v29 = swift_bridgeObjectRelease(v28);
    v30 = *(void (**)(uint64_t, uint64_t, __n128))(v20 + 8);
    v30(v19, v21, v29);
    v31 = *(void **)(v22 + v23);
    URL._bridgeToObjectiveC()(v32);
    v34 = v33;
    *(_QWORD *)(v0 + 32) = 0;
    LODWORD(v20) = objc_msgSend(v31, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v33, 1, 0, v0 + 32);

    v35 = *(void **)(v0 + 32);
    if ((_DWORD)v20)
    {
      v64 = (void (*)(uint64_t, uint64_t))v30;
      v36 = *(_QWORD *)(v0 + 40);
      v37 = v35;
      URL.appendingPathComponent(_:)(0xD000000000000011);
      Data.write(to:options:)(v36, 0, v17, v63);
      v51 = *(_QWORD *)(v0 + 128);
      v52 = *(_QWORD *)(v0 + 136);
      v58 = *(_QWORD *)(v0 + 120);
      v59 = *(_QWORD *)(v0 + 160);
      v53 = *(_QWORD *)(v0 + 104);
      v54 = *(_QWORD *)(v0 + 88);
      v55 = *(_QWORD *)(v0 + 96);
      v56 = *(_QWORD *)(v0 + 80);
      v60 = *(_QWORD *)(v0 + 112);
      v62 = *(_QWORD *)(v0 + 72);
      v57 = *(_QWORD *)(v0 + 56);
      sub_10001ECDC(v17, v63);
      v64(v56, v57);
      (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v53, v54);
      (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v52, v58);
      swift_task_dealloc(v59);
      swift_task_dealloc(v52);
      swift_task_dealloc(v60);
      swift_task_dealloc(v53);
      swift_task_dealloc(v56);
      swift_task_dealloc(v62);
    }
    else
    {
      v38 = *(_QWORD *)(v0 + 128);
      v39 = *(_QWORD *)(v0 + 96);
      v65 = *(_QWORD *)(v0 + 104);
      v61 = *(_QWORD *)(v0 + 88);
      v40 = (void (*)(uint64_t, uint64_t))v30;
      v41 = *(_QWORD *)(v0 + 80);
      v42 = *(_QWORD *)(v0 + 56);
      v43 = v35;
      _convertNSErrorToError(_:)(v35);

      swift_willThrow(v44);
      sub_10001ECDC(v17, v63);
      v40(v41, v42);
      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v65, v61);
      v45 = *(_QWORD *)(v0 + 136);
      v46 = *(_QWORD *)(v0 + 112);
      v47 = *(_QWORD *)(v0 + 160);
      v48 = *(_QWORD *)(v0 + 104);
      v50 = *(_QWORD *)(v0 + 72);
      v49 = *(_QWORD *)(v0 + 80);
      (*(void (**)(uint64_t, _QWORD))(v38 + 8))(v45, *(_QWORD *)(v0 + 120));
      swift_task_dealloc(v47);
      swift_task_dealloc(v45);
      swift_task_dealloc(v46);
      swift_task_dealloc(v48);
      swift_task_dealloc(v49);
      swift_task_dealloc(v50);
    }
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_10009649C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t (*v6)();

  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 208);
  *(_QWORD *)(*(_QWORD *)v2 + 216) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    swift_bridgeObjectRelease(v4[21]);
    swift_bridgeObjectRelease(v4[3]);
    v6 = sub_1000969D4;
  }
  else
  {
    v4[28] = a1;
    v6 = sub_100096564;
  }
  return swift_task_switch(v6, 0, 0);
}

uint64_t sub_100096564()
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
  unint64_t v12;
  uint64_t v13;
  void (*v14)(_QWORD, unint64_t, _QWORD);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
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
  __n128 v32;
  void (*v33)(uint64_t, uint64_t, __n128);
  void *v34;
  NSURL *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  id v45;
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
  uint64_t (*v60)(void);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  void (*v67)(uint64_t, uint64_t);
  uint64_t v68;

  v1 = *(_QWORD *)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 160);
  v4 = *(_QWORD *)(v0 + 144);
  v5 = *(_QWORD *)(v0 + 200) + 1;
  sub_100064C1C(*(_QWORD *)(v0 + 224));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v5 != v1)
  {
    v14 = *(void (**)(_QWORD, unint64_t, _QWORD))(v0 + 192);
    v15 = *(_QWORD *)(v0 + 200) + 1;
    *(_QWORD *)(v0 + 200) = v15;
    v16 = *(int *)(v0 + 232);
    v17 = *(_QWORD *)(v0 + 48);
    v14(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 168)+ ((*(unsigned __int8 *)(v0 + 236) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 236))+ *(_QWORD *)(v0 + 184) * v15, *(_QWORD *)(v0 + 144));
    v18 = *(_QWORD *)(v17 + v16);
    v19 = (_QWORD *)swift_task_alloc(async function pointer to HKSampleQueryDescriptor.result(for:)[1]);
    *(_QWORD *)(v0 + 208) = v19;
    *v19 = v0;
    v19[1] = sub_10009649C;
    return HKSampleQueryDescriptor.result(for:)(v18, *(_QWORD *)(v0 + 144));
  }
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 168));
  v6 = *(_QWORD *)(v0 + 24);
  v7 = *(_QWORD *)(v0 + 216);
  v8 = *(_QWORD *)(v0 + 112);
  static Logger.general.getter(v9);
  v10 = SampleDataEncoder.init(samples:logger:)(v6, v8);
  v11 = SampleDataEncoder.encodeSamples()(v10);
  if (v7)
  {
    v13 = *(_QWORD *)(v0 + 128);
LABEL_8:
    v47 = *(_QWORD *)(v0 + 136);
    v48 = *(_QWORD *)(v0 + 112);
    v49 = *(_QWORD *)(v0 + 160);
    v50 = *(_QWORD *)(v0 + 104);
    v52 = *(_QWORD *)(v0 + 72);
    v51 = *(_QWORD *)(v0 + 80);
    (*(void (**)(uint64_t, _QWORD))(v13 + 8))(v47, *(_QWORD *)(v0 + 120));
    swift_task_dealloc(v49);
    swift_task_dealloc(v47);
    swift_task_dealloc(v48);
    swift_task_dealloc(v50);
    swift_task_dealloc(v51);
    swift_task_dealloc(v52);
    v60 = *(uint64_t (**)(void))(v0 + 8);
    return v60();
  }
  v21 = v11;
  v66 = v12;
  v22 = *(_QWORD *)(v0 + 72);
  v24 = *(_QWORD *)(v0 + 56);
  v23 = *(_QWORD *)(v0 + 64);
  v25 = *(_QWORD *)(v0 + 48);
  UUID.init()(v11);
  v26 = *(int *)(type metadata accessor for SampleExporter(0) + 28);
  v27 = objc_msgSend(*(id *)(v25 + v26), "temporaryDirectory");
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v27);

  v29 = UUID.uuidString.getter(v28);
  v31 = v30;
  URL.appendingPathComponent(_:)(v29);
  v32 = swift_bridgeObjectRelease(v31);
  v33 = *(void (**)(uint64_t, uint64_t, __n128))(v23 + 8);
  v33(v22, v24, v32);
  v34 = *(void **)(v25 + v26);
  URL._bridgeToObjectiveC()(v35);
  v37 = v36;
  *(_QWORD *)(v0 + 32) = 0;
  LODWORD(v23) = objc_msgSend(v34, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v36, 1, 0, v0 + 32);

  v38 = *(void **)(v0 + 32);
  if (!(_DWORD)v23)
  {
    v13 = *(_QWORD *)(v0 + 128);
    v41 = *(_QWORD *)(v0 + 96);
    v68 = *(_QWORD *)(v0 + 104);
    v64 = *(_QWORD *)(v0 + 88);
    v42 = (void (*)(uint64_t, uint64_t))v33;
    v43 = *(_QWORD *)(v0 + 80);
    v44 = *(_QWORD *)(v0 + 56);
    v45 = v38;
    _convertNSErrorToError(_:)(v38);

    swift_willThrow(v46);
    sub_10001ECDC(v21, v66);
    v42(v43, v44);
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v68, v64);
    goto LABEL_8;
  }
  v67 = (void (*)(uint64_t, uint64_t))v33;
  v39 = *(_QWORD *)(v0 + 40);
  v40 = v38;
  URL.appendingPathComponent(_:)(0xD000000000000011);
  Data.write(to:options:)(v39, 0, v21, v66);
  v53 = *(_QWORD *)(v0 + 128);
  v54 = *(_QWORD *)(v0 + 136);
  v61 = *(_QWORD *)(v0 + 120);
  v62 = *(_QWORD *)(v0 + 160);
  v55 = *(_QWORD *)(v0 + 104);
  v56 = *(_QWORD *)(v0 + 88);
  v57 = *(_QWORD *)(v0 + 96);
  v58 = *(_QWORD *)(v0 + 80);
  v63 = *(_QWORD *)(v0 + 112);
  v65 = *(_QWORD *)(v0 + 72);
  v59 = *(_QWORD *)(v0 + 56);
  sub_10001ECDC(v21, v66);
  v67(v58, v59);
  (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v55, v56);
  (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v54, v61);
  swift_task_dealloc(v62);
  swift_task_dealloc(v54);
  swift_task_dealloc(v63);
  swift_task_dealloc(v55);
  swift_task_dealloc(v58);
  swift_task_dealloc(v65);
  v60 = *(uint64_t (**)(void))(v0 + 8);
  return v60();
}

uint64_t sub_1000969D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v0 + 136);
  v4 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 112);
  v6 = *(_QWORD *)(v0 + 72);
  v5 = *(_QWORD *)(v0 + 80);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(v1, *(_QWORD *)(v0 + 144));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100096A90()
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
  uint64_t OpaqueTypeConformance2;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;

  sub_10009D274(0);
  v1 = v0;
  sub_10009D408(255);
  v3 = v2;
  sub_10009E114(255);
  v5 = v4;
  sub_10009D524(255);
  v7 = v6;
  sub_1000076D8(255, &qword_1000F03E0, (uint64_t (*)(uint64_t))sub_10009DCEC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for TupleToolbarContent);
  v9 = v8;
  sub_10009DE34(255, &qword_1000F0300, (uint64_t (*)(uint64_t))sub_10009D5E4, sub_10009DCD0, (uint64_t)&opaque type descriptor for <<opaque return type of View.navigationTitle(_:)>>);
  v11 = v10;
  sub_10009D5E4(255);
  v24 = v12;
  v25 = sub_10009DCD0();
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v24, &opaque type descriptor for <<opaque return type of View.navigationTitle(_:)>>, 1);
  v24 = v11;
  v25 = OpaqueTypeConformance2;
  v14 = swift_getOpaqueTypeConformance2(&v24, &opaque type descriptor for <<opaque return type of View.navigationBarTitleDisplayMode(_:)>>, 1);
  v15 = sub_10009E0B4();
  v24 = v7;
  v25 = v9;
  v26 = v14;
  v27 = v15;
  v16 = swift_getOpaqueTypeConformance2(&v24, &opaque type descriptor for <<opaque return type of View.toolbar<A>(content:)>>, 1);
  sub_10009E198(255, &qword_1000F0450, (uint64_t (*)(uint64_t, _QWORD *))type metadata accessor for SearchableListView);
  v18 = v17;
  v19 = sub_10009E228();
  v24 = v18;
  v25 = v19;
  v20 = swift_getOpaqueTypeConformance2(&v24, &opaque type descriptor for <<opaque return type of View.interactiveDismissDisabled(_:)>>, 1);
  v24 = v3;
  v25 = v5;
  v26 = v16;
  v27 = v20;
  v21 = swift_getOpaqueTypeConformance2(&v24, &opaque type descriptor for <<opaque return type of View.sheet<A>(isPresented:onDismiss:content:)>>, 1);
  return NavigationView.init(content:)(sub_10009D26C, &v23, v1, v21);
}

uint64_t sub_100096C30(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  Class isa;
  id v8;
  uint64_t v9;

  v1 = *a1;
  sub_10009EB74(0);
  v3 = v2;
  sub_10009EAF0(0, &qword_1000F04B8, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for HKSamplePredicate);
  v5 = swift_allocObject(v3, ((*(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v4 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80) | 7);
  *(_OWORD *)(v5 + 16) = xmmword_1000B11F0;
  v6 = (void *)objc_opt_self(HKQuery);
  type metadata accessor for SampleExporter(0);
  isa = DateInterval._bridgeToObjectiveC()().super.isa;
  v8 = objc_msgSend(v6, "predicateForSamplesWithinDateInterval:options:", isa, 0);

  v9 = sub_100006D10(0, (unint64_t *)&unk_1000EED00, HKSample_ptr);
  static HKSamplePredicate.sample(type:predicate:)(v1, v8, v9);

  return HKSampleQueryDescriptor.init(predicates:sortDescriptors:limit:)(v5, _swiftEmptyArrayStorage, 0, 1, v9);
}

Swift::Int sub_100096D74()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  v1 = *v0;
  Hasher.init(_seed:)(v6, 0);
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
  v4 = v3;
  String.hash(into:)(v6, v2, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

Swift::Int sub_100096DD4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  v2 = *v1;
  Hasher.init(_seed:)(v7, a1);
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  v5 = v4;
  String.hash(into:)(v7, v3, v4);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

uint64_t sub_100096E30()
{
  uint64_t *v0;

  return sub_100093AF0(*v0);
}

uint64_t sub_100096E3C(uint64_t a1, uint64_t a2)
{
  return sub_10009B380(*(_QWORD *)a1, *(_BYTE *)(a1 + 8), *(_QWORD *)a2, *(_BYTE *)(a2 + 8));
}

uint64_t sub_100096E58(uint64_t a1)
{
  uint64_t v1;
  __int128 v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  _OWORD v7[3];
  uint64_t v8;

  v2 = *(_OWORD *)(v1 + 16);
  v8 = *(_QWORD *)(v1 + 32);
  v3 = *(_OWORD *)(a1 + 32);
  v7[0] = *(_OWORD *)(a1 + 16);
  v7[1] = v3;
  v7[2] = v2;
  v4 = type metadata accessor for SearchableListSection(255, (uint64_t)v7);
  v5 = type metadata accessor for Array(255, v4);
  type metadata accessor for Binding(0, v5);
  Binding.wrappedValue.getter(v7);
  return *(_QWORD *)&v7[0];
}

uint64_t sub_100096EC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v7 = *(_OWORD *)(v2 + 40);
  v8 = *(_QWORD *)(v2 + 56);
  v6 = a1;
  v3 = type metadata accessor for Set(255, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 32));
  v4 = type metadata accessor for Binding(0, v3);
  return Binding.wrappedValue.setter(&v6, v4);
}

uint64_t sub_100096F28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 56);
  v5 = type metadata accessor for UUID(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

BOOL sub_100096F68()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;

  sub_1000138C8(0, &qword_1000EEE60, (uint64_t)&type metadata for String, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for State);
  State.wrappedValue.getter(&v4);
  v1 = v4;
  v0 = v5;
  swift_bridgeObjectRelease(v5);
  v2 = HIBYTE(v0) & 0xF;
  if ((v0 & 0x2000000000000000) == 0)
    v2 = v1 & 0xFFFFFFFFFFFFLL;
  return v2 != 0;
}

uint64_t sub_100096FE8(uint64_t a1)
{
  uint64_t v1;
  __int128 v2;
  uint64_t v3;
  uint64_t WitnessTable;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *(_QWORD *)(v1 + 128);
  v2 = *(_OWORD *)(a1 + 32);
  v7 = *(_OWORD *)(a1 + 16);
  v8 = v2;
  v3 = type metadata accessor for Array(0, v7);
  swift_bridgeObjectRetain(v9);
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v3);
  return _ArrayProtocol.filter(_:)(sub_1000A0038, &v6, v3, WitnessTable);
}

uint64_t sub_10009706C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  v5 = dispatch thunk of CustomStringConvertible.description.getter(a3, a4);
  v7 = v6;
  v15 = v5;
  v16 = v6;
  v12 = *(_OWORD *)(a2 + 104);
  v13 = *(_QWORD *)(a2 + 120);
  sub_1000138C8(0, &qword_1000EEE60, (uint64_t)&type metadata for String, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for State);
  State.wrappedValue.getter(&v14);
  v8 = *((_QWORD *)&v14 + 1);
  v12 = v14;
  v9 = sub_10002D0D0();
  v10 = StringProtocol.localizedCaseInsensitiveContains<A>(_:)(&v12, &type metadata for String, &type metadata for String, v9, v9);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v8);
  return v10 & 1;
}

uint64_t sub_100097140@<X0>(_QWORD *a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t WitnessTable;
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
  unint64_t v32;
  uint64_t OpaqueTypeMetadata2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  void (*v52)(char *, char *, uint64_t);
  void (*v53)(char *, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char v63[16];
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t AssociatedConformanceWitness;
  uint64_t v90;

  v62 = a2;
  v3 = a1[2];
  v4 = type metadata accessor for Array(255, v3);
  v5 = a1[5];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(255, v5, v3, &protocol requirements base descriptor for Identifiable, &associated type descriptor for Identifiable.ID);
  v7 = a1[4];
  v8 = type metadata accessor for TagValueTraitKey(255, v3, v7);
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for TagValueTraitKey<A>, v8);
  v10 = type metadata accessor for _TraitWritingModifier(255, v8, WitnessTable);
  v56 = type metadata accessor for ModifiedContent(255, &type metadata for Text);
  v11 = type metadata accessor for Optional(255, v3);
  v90 = v7;
  v57 = v7;
  v12 = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v11);
  v13 = type metadata accessor for TagValueTraitKey(255, v11, v12);
  v14 = swift_getWitnessTable(&protocol conformance descriptor for TagValueTraitKey<A>, v13);
  v15 = type metadata accessor for _TraitWritingModifier(255, v13, v14);
  v55 = type metadata accessor for ModifiedContent(255, v56);
  v60 = v5;
  v58 = v3;
  v85 = v4;
  v86 = (void *)AssociatedTypeWitness;
  v87 = v55;
  v88 = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness(v5, v3, AssociatedTypeWitness, &protocol requirements base descriptor for Identifiable, &associated conformance descriptor for Identifiable.Identifiable.ID: Hashable);
  v16 = type metadata accessor for ForEach(255, &v85);
  v17 = type metadata accessor for Section(255, &type metadata for EmptyView, v16, &type metadata for EmptyView);
  v59 = (void *)a1[3];
  v85 = v3;
  v86 = v59;
  v87 = v7;
  v88 = v5;
  v18 = type metadata accessor for SearchableListSection(255, (uint64_t)&v85);
  v19 = type metadata accessor for Array(255, v18);
  v20 = type metadata accessor for UUID(255);
  v21 = type metadata accessor for Section(255, &type metadata for Text, v16, &type metadata for EmptyView);
  v22 = swift_getWitnessTable(&protocol conformance descriptor for [A], v19);
  v23 = sub_100013198(&qword_1000F02D8, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  v85 = v19;
  v86 = (void *)v20;
  v87 = v21;
  v88 = v22;
  AssociatedConformanceWitness = v23;
  v24 = type metadata accessor for ForEach(255, &v85);
  v25 = type metadata accessor for _ConditionalContent(255, v17, v24);
  v83 = &protocol witness table for Text;
  v84 = swift_getWitnessTable(&protocol conformance descriptor for _TraitWritingModifier<A>, v10);
  v81 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v56);
  v82 = swift_getWitnessTable(&protocol conformance descriptor for _TraitWritingModifier<A>, v15);
  v80 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v55);
  v77 = &protocol witness table for EmptyView;
  v78 = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v16);
  v79 = &protocol witness table for EmptyView;
  v26 = swift_getWitnessTable(&protocol conformance descriptor for <> Section<A, B, C>, v17);
  v74 = &protocol witness table for Text;
  v75 = v78;
  v76 = &protocol witness table for EmptyView;
  v73 = swift_getWitnessTable(&protocol conformance descriptor for <> Section<A, B, C>, v21);
  v71 = v26;
  v72 = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v24);
  v27 = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v25);
  v28 = v3;
  v85 = v3;
  v86 = (void *)v25;
  v29 = v7;
  v87 = v7;
  v88 = v27;
  v30 = type metadata accessor for List(255, &v85);
  v31 = swift_getWitnessTable(&protocol conformance descriptor for List<A, B>, v30);
  v32 = sub_10002D0D0();
  v85 = v30;
  v86 = &type metadata for String;
  v87 = v31;
  v88 = v32;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2(255, &v85, &opaque type descriptor for <<opaque return type of View.navigationTitle<A>(_:)>>, 0);
  v85 = v30;
  v86 = &type metadata for String;
  v87 = v31;
  v88 = v32;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v85, &opaque type descriptor for <<opaque return type of View.navigationTitle<A>(_:)>>, 1);
  v85 = OpaqueTypeMetadata2;
  v86 = (void *)OpaqueTypeConformance2;
  v35 = swift_getOpaqueTypeMetadata2(255, &v85, &opaque type descriptor for <<opaque return type of View.navigationBarTitleDisplayMode(_:)>>, 0);
  sub_1000076D8(255, &qword_1000F0610, (uint64_t (*)(uint64_t))sub_10009FC00, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _EnvironmentKeyWritingModifier);
  v36 = type metadata accessor for ModifiedContent(255, v35);
  sub_1000076D8(255, &qword_1000F0628, (uint64_t (*)(uint64_t))sub_10009FC38, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for TupleToolbarContent);
  v38 = v37;
  v85 = OpaqueTypeMetadata2;
  v86 = (void *)OpaqueTypeConformance2;
  v69 = swift_getOpaqueTypeConformance2(&v85, &opaque type descriptor for <<opaque return type of View.navigationBarTitleDisplayMode(_:)>>, 1);
  v70 = sub_10009FC98();
  v39 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v36);
  v40 = sub_10009FCF8();
  v85 = v36;
  v86 = v38;
  v87 = v39;
  v88 = v40;
  v41 = swift_getOpaqueTypeMetadata2(255, &v85, &opaque type descriptor for <<opaque return type of View.toolbar<A>(content:)>>, 0);
  v85 = v36;
  v86 = v38;
  v87 = v39;
  v88 = v40;
  v42 = swift_getOpaqueTypeConformance2(&v85, &opaque type descriptor for <<opaque return type of View.toolbar<A>(content:)>>, 1);
  v85 = v41;
  v86 = (void *)v42;
  v43 = swift_getOpaqueTypeMetadata2(255, &v85, &opaque type descriptor for <<opaque return type of View.searchable(text:placement:prompt:)>>, 0);
  v85 = v41;
  v86 = (void *)v42;
  v44 = swift_getOpaqueTypeConformance2(&v85, &opaque type descriptor for <<opaque return type of View.searchable(text:placement:prompt:)>>, 1);
  v45 = type metadata accessor for NavigationView(0, v43, v44);
  v46 = *(_QWORD *)(v45 - 8);
  v47 = __chkstk_darwin(v45);
  v49 = (char *)&v55 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v47);
  v51 = (char *)&v55 - v50;
  v64 = v28;
  v65 = v59;
  v66 = v29;
  v67 = v60;
  v68 = v61;
  NavigationView.init(content:)(sub_10009FD58, v63, v43, v44);
  swift_getWitnessTable(&protocol conformance descriptor for NavigationView<A>, v45);
  v52 = *(void (**)(char *, char *, uint64_t))(v46 + 16);
  v52(v51, v49, v45);
  v53 = *(void (**)(char *, uint64_t))(v46 + 8);
  v53(v49, v45);
  v52(v62, v51, v45);
  return ((uint64_t (*)(char *, uint64_t))v53)(v51, v45);
}

uint64_t sub_1000977BC@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, char *a6@<X8>)
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
  uint64_t AssociatedTypeWitness;
  uint64_t v19;
  uint64_t WitnessTable;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t AssociatedConformanceWitness;
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
  unint64_t v52;
  unint64_t v53;
  uint64_t OpaqueTypeMetadata2;
  uint64_t v55;
  uint64_t OpaqueTypeConformance2;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __int128 *v76;
  uint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t KeyPath;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  __int128 *v93;
  uint64_t v94;
  char *v95;
  _QWORD *v96;
  __int128 v97;
  uint64_t v98;
  unint64_t v99;
  char *v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  void (*v104)(char *, char *, uint64_t);
  char *v105;
  void (*v106)(char *, uint64_t);
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  unint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  char *v118;
  char *v119;
  char *v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  char *v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  char *v140;
  uint64_t v141;
  uint64_t v142;
  char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  unint64_t v147;
  __int128 *v148;
  uint64_t v149;
  _QWORD v150[8];
  _QWORD v151[8];
  __int128 v152;
  uint64_t v153;
  uint64_t v154;
  unint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  void *v161;
  void *v162;
  uint64_t v163;
  void *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  uint64_t v169;
  __int128 v170;
  uint64_t v171;
  unint64_t v172;
  uint64_t v173;
  uint64_t v174;

  v148 = a1;
  v149 = a3;
  v143 = a6;
  v9 = type metadata accessor for SearchFieldPlacement(0);
  v141 = *(_QWORD *)(v9 - 8);
  v142 = v9;
  __chkstk_darwin(v9);
  v140 = (char *)&v108 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for EditMode(0);
  v138 = *(_QWORD *)(v11 - 8);
  v139 = v11;
  __chkstk_darwin(v11);
  v137 = (char *)&v108 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10009FC00(0);
  __chkstk_darwin(v13);
  v136 = (char *)&v108 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for NavigationBarItem.TitleDisplayMode(0);
  v134 = *(_QWORD *)(v15 - 8);
  v135 = v15;
  __chkstk_darwin(v15);
  v133 = (char *)&v108 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for Array(255, a2);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(255, a5, a2, &protocol requirements base descriptor for Identifiable, &associated type descriptor for Identifiable.ID);
  v19 = type metadata accessor for TagValueTraitKey(255, a2, a4);
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for TagValueTraitKey<A>, v19);
  v132 = type metadata accessor for _TraitWritingModifier(255, v19, WitnessTable);
  v21 = type metadata accessor for ModifiedContent(255, &type metadata for Text);
  v131 = v21;
  v22 = type metadata accessor for Optional(255, a2);
  v174 = a4;
  v144 = a4;
  v23 = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v22);
  v24 = type metadata accessor for TagValueTraitKey(255, v22, v23);
  v25 = swift_getWitnessTable(&protocol conformance descriptor for TagValueTraitKey<A>, v24);
  v26 = type metadata accessor for _TraitWritingModifier(255, v24, v25);
  v27 = type metadata accessor for ModifiedContent(255, v21);
  v130 = v27;
  v28 = swift_getWitnessTable(&protocol conformance descriptor for [A], v17);
  v147 = a5;
  v29 = a2;
  v145 = a2;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness(a5, a2, AssociatedTypeWitness, &protocol requirements base descriptor for Identifiable, &associated conformance descriptor for Identifiable.Identifiable.ID: Hashable);
  *(_QWORD *)&v170 = v17;
  *((_QWORD *)&v170 + 1) = AssociatedTypeWitness;
  v171 = v27;
  v172 = v28;
  v173 = AssociatedConformanceWitness;
  v31 = type metadata accessor for ForEach(255, &v170);
  v32 = type metadata accessor for Section(255, &type metadata for EmptyView, v31, &type metadata for EmptyView);
  *(_QWORD *)&v170 = v29;
  *((_QWORD *)&v170 + 1) = v149;
  v171 = a4;
  v172 = a5;
  v33 = type metadata accessor for SearchableListSection(255, (uint64_t)&v170);
  v34 = type metadata accessor for Array(255, v33);
  v35 = type metadata accessor for UUID(255);
  v36 = type metadata accessor for Section(255, &type metadata for Text, v31, &type metadata for EmptyView);
  v37 = swift_getWitnessTable(&protocol conformance descriptor for [A], v34);
  v38 = sub_100013198(&qword_1000F02D8, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  *(_QWORD *)&v170 = v34;
  *((_QWORD *)&v170 + 1) = v35;
  v171 = v36;
  v172 = v37;
  v173 = v38;
  v39 = type metadata accessor for ForEach(255, &v170);
  v146 = type metadata accessor for _ConditionalContent(255, v32, v39);
  v40 = swift_getWitnessTable(&protocol conformance descriptor for _TraitWritingModifier<A>, v132);
  v168 = &protocol witness table for Text;
  v169 = v40;
  v41 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v131);
  v42 = swift_getWitnessTable(&protocol conformance descriptor for _TraitWritingModifier<A>, v26);
  v166 = v41;
  v167 = v42;
  v165 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v130);
  v43 = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v31);
  v162 = &protocol witness table for EmptyView;
  v163 = v43;
  v164 = &protocol witness table for EmptyView;
  v44 = swift_getWitnessTable(&protocol conformance descriptor for <> Section<A, B, C>, v32);
  v159 = &protocol witness table for Text;
  v160 = v43;
  v161 = &protocol witness table for EmptyView;
  v158 = swift_getWitnessTable(&protocol conformance descriptor for <> Section<A, B, C>, v36);
  v45 = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v39);
  v156 = v44;
  v157 = v45;
  v46 = v146;
  v124 = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v146);
  v47 = v144;
  v48 = v145;
  *(_QWORD *)&v170 = v145;
  *((_QWORD *)&v170 + 1) = v46;
  v171 = v144;
  v172 = v124;
  v49 = type metadata accessor for List(0, &v170);
  v129 = *(_QWORD *)(v49 - 8);
  __chkstk_darwin(v49);
  v122 = (char *)&v108 - v50;
  v51 = swift_getWitnessTable(&protocol conformance descriptor for List<A, B>, v49);
  v52 = sub_10002D0D0();
  *(_QWORD *)&v170 = v49;
  *((_QWORD *)&v170 + 1) = &type metadata for String;
  v171 = v51;
  v172 = v52;
  v116 = v52;
  v117 = v51;
  v53 = v52;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2(0, &v170, &opaque type descriptor for <<opaque return type of View.navigationTitle<A>(_:)>>, 0);
  v127 = *(_QWORD *)(OpaqueTypeMetadata2 - 8);
  __chkstk_darwin(OpaqueTypeMetadata2);
  v118 = (char *)&v108 - v55;
  *(_QWORD *)&v170 = v49;
  *((_QWORD *)&v170 + 1) = &type metadata for String;
  v171 = v51;
  v172 = v53;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v170, &opaque type descriptor for <<opaque return type of View.navigationTitle<A>(_:)>>, 1);
  *(_QWORD *)&v170 = OpaqueTypeMetadata2;
  *((_QWORD *)&v170 + 1) = OpaqueTypeConformance2;
  v108 = OpaqueTypeMetadata2;
  v109 = OpaqueTypeConformance2;
  v57 = OpaqueTypeConformance2;
  v58 = swift_getOpaqueTypeMetadata2(0, &v170, &opaque type descriptor for <<opaque return type of View.navigationBarTitleDisplayMode(_:)>>, 0);
  v130 = *(_QWORD *)(v58 - 8);
  v125 = v58;
  __chkstk_darwin(v58);
  v111 = (char *)&v108 - v59;
  sub_1000076D8(255, &qword_1000F0610, (uint64_t (*)(uint64_t))sub_10009FC00, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _EnvironmentKeyWritingModifier);
  v60 = type metadata accessor for ModifiedContent(0, v58);
  v131 = *(_QWORD *)(v60 - 8);
  __chkstk_darwin(v60);
  v120 = (char *)&v108 - v61;
  sub_1000076D8(255, &qword_1000F0628, (uint64_t (*)(uint64_t))sub_10009FC38, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for TupleToolbarContent);
  v63 = v62;
  *(_QWORD *)&v170 = OpaqueTypeMetadata2;
  *((_QWORD *)&v170 + 1) = v57;
  v64 = swift_getOpaqueTypeConformance2(&v170, &opaque type descriptor for <<opaque return type of View.navigationBarTitleDisplayMode(_:)>>, 1);
  v115 = v64;
  v65 = sub_10009FC98();
  v154 = v64;
  v155 = v65;
  v66 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v60);
  v67 = sub_10009FCF8();
  *(_QWORD *)&v170 = v60;
  *((_QWORD *)&v170 + 1) = v63;
  v110 = v63;
  v171 = v66;
  v172 = v67;
  v68 = v66;
  v112 = v67;
  v113 = v66;
  v69 = swift_getOpaqueTypeMetadata2(0, &v170, &opaque type descriptor for <<opaque return type of View.toolbar<A>(content:)>>, 0);
  v132 = *(_QWORD *)(v69 - 8);
  v70 = v69;
  v123 = v69;
  __chkstk_darwin(v69);
  v114 = (char *)&v108 - v71;
  *(_QWORD *)&v170 = v60;
  *((_QWORD *)&v170 + 1) = v63;
  v171 = v68;
  v172 = v67;
  v121 = swift_getOpaqueTypeConformance2(&v170, &opaque type descriptor for <<opaque return type of View.toolbar<A>(content:)>>, 1);
  *(_QWORD *)&v170 = v70;
  *((_QWORD *)&v170 + 1) = v121;
  v72 = swift_getOpaqueTypeMetadata2(0, &v170, &opaque type descriptor for <<opaque return type of View.searchable(text:placement:prompt:)>>, 0);
  v128 = *(_QWORD *)(v72 - 8);
  v73 = __chkstk_darwin(v72);
  v119 = (char *)&v108 - ((v74 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v73);
  v126 = (char *)&v108 - v75;
  v76 = v148;
  v152 = *(__int128 *)((char *)v148 + 88);
  v77 = type metadata accessor for Set(255, v48, v47);
  type metadata accessor for State(0, v77);
  State.projectedValue.getter(&v170);
  v151[2] = v48;
  v151[3] = v149;
  v151[4] = v47;
  v151[5] = v147;
  v151[6] = v76;
  v78 = v122;
  List.init(selection:content:)(v170, *((_QWORD *)&v170 + 1), v171, sub_10009FD64, v151, v48, v146, v47, v124);
  v170 = *v76;
  v79 = v118;
  View.navigationTitle<A>(_:)(&v170, v49, &type metadata for String, v117, v116);
  (*(void (**)(char *, uint64_t))(v129 + 8))(v78, v49);
  v81 = v133;
  v80 = v134;
  v82 = v135;
  (*(void (**)(char *, _QWORD, uint64_t))(v134 + 104))(v133, enum case for NavigationBarItem.TitleDisplayMode.inline(_:), v135);
  v83 = v111;
  v84 = v108;
  View.navigationBarTitleDisplayMode(_:)(v81, v108, v109);
  (*(void (**)(char *, uint64_t))(v80 + 8))(v81, v82);
  (*(void (**)(char *, uint64_t))(v127 + 8))(v79, v84);
  KeyPath = swift_getKeyPath(&unk_1000B6640);
  v87 = v137;
  v86 = v138;
  v88 = v139;
  (*(void (**)(char *, _QWORD, uint64_t))(v138 + 104))(v137, enum case for EditMode.active(_:), v139);
  v89 = (uint64_t)v136;
  static Binding.constant(_:)(v87, v88);
  (*(void (**)(char *, uint64_t))(v86 + 8))(v87, v88);
  sub_10009FC1C(0);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v90 - 8) + 56))(v89, 0, 1, v90);
  v91 = v120;
  v92 = v125;
  View.environment<A>(_:_:)(KeyPath, v89, v125, v115);
  swift_release(KeyPath);
  sub_1000137A0(v89, (uint64_t (*)(_QWORD))sub_10009FC00);
  (*(void (**)(char *, uint64_t))(v130 + 8))(v83, v92);
  v93 = v148;
  v150[2] = v145;
  v150[3] = v149;
  v150[4] = v144;
  v150[5] = v147;
  v150[6] = v148;
  v94 = swift_checkMetadataState(0, v110);
  v95 = v114;
  View.toolbar<A>(content:)(sub_10009FD94, v150, v60, v94, v113, v112);
  (*(void (**)(char *, uint64_t))(v131 + 8))(v91, v60);
  v152 = *(__int128 *)((char *)v93 + 104);
  v153 = *((_QWORD *)v93 + 15);
  sub_1000138C8(0, &qword_1000EEE60, (uint64_t)&type metadata for String, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for State);
  v96 = State.projectedValue.getter(&v170);
  v97 = v170;
  v98 = v171;
  v99 = v172;
  v100 = v140;
  static SearchFieldPlacement.automatic.getter(v96);
  v101 = v123;
  v102 = v119;
  View.searchable(text:placement:prompt:)(v97, *((_QWORD *)&v97 + 1), v98, v99, v100, 0, 0, 0, 0, v123, v121);
  swift_bridgeObjectRelease(v99);
  swift_release(*((_QWORD *)&v97 + 1));
  swift_release(v97);
  (*(void (**)(char *, uint64_t))(v141 + 8))(v100, v142);
  (*(void (**)(char *, uint64_t))(v132 + 8))(v95, v101);
  v103 = v128;
  v104 = *(void (**)(char *, char *, uint64_t))(v128 + 16);
  v105 = v126;
  v104(v126, v102, v72);
  v106 = *(void (**)(char *, uint64_t))(v103 + 8);
  v106(v102, v72);
  v104(v143, v105, v72);
  return ((uint64_t (*)(char *, uint64_t))v106)(v105, v72);
}

uint64_t sub_1000982A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t WitnessTable;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t AssociatedConformanceWitness;
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
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BOOL8 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  void (*v51)(char *, char *, uint64_t);
  void (*v52)(char *, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(char *, char *, uint64_t);
  char *v66;
  void (*v67)(char *, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
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
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;

  v87 = a3;
  v88 = a1;
  v94 = a6;
  v141 = a2;
  v142 = a3;
  v143 = a4;
  v144 = a5;
  v86 = type metadata accessor for SearchableListSection(255, (uint64_t)&v141);
  v96 = type metadata accessor for Array(255, v86);
  v95 = type metadata accessor for UUID(255);
  v9 = type metadata accessor for Array(255, a2);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(255, a5, a2, &protocol requirements base descriptor for Identifiable, &associated type descriptor for Identifiable.ID);
  v11 = type metadata accessor for TagValueTraitKey(255, a2, a4);
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for TagValueTraitKey<A>, v11);
  v101 = type metadata accessor for _TraitWritingModifier(255, v11, WitnessTable);
  v13 = type metadata accessor for ModifiedContent(255, &type metadata for Text);
  v14 = type metadata accessor for Optional(255, a2);
  v146 = a4;
  v15 = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v14);
  v16 = type metadata accessor for TagValueTraitKey(255, v14, v15);
  v17 = swift_getWitnessTable(&protocol conformance descriptor for TagValueTraitKey<A>, v16);
  v102 = v13;
  v99 = type metadata accessor for _TraitWritingModifier(255, v16, v17);
  v18 = type metadata accessor for ModifiedContent(255, v13);
  v19 = swift_getWitnessTable(&protocol conformance descriptor for [A], v9);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness(a5, a2, AssociatedTypeWitness, &protocol requirements base descriptor for Identifiable, &associated conformance descriptor for Identifiable.Identifiable.ID: Hashable);
  v141 = v9;
  v142 = AssociatedTypeWitness;
  v100 = v18;
  v143 = v18;
  v144 = v19;
  v145 = AssociatedConformanceWitness;
  v21 = type metadata accessor for ForEach(255, &v141);
  v22 = type metadata accessor for Section(255, &type metadata for Text, v21, &type metadata for EmptyView);
  v23 = swift_getWitnessTable(&protocol conformance descriptor for [A], v96);
  v24 = sub_100013198(&qword_1000F02D8, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  v141 = v96;
  v142 = v95;
  v93 = v22;
  v143 = v22;
  v144 = v23;
  v84 = v23;
  v145 = v24;
  v25 = type metadata accessor for ForEach(0, &v141);
  v83 = *(_QWORD *)(v25 - 8);
  v26 = __chkstk_darwin(v25);
  v28 = (char *)&v80 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v26);
  v85 = (char *)&v80 - v29;
  v98 = v21;
  v30 = type metadata accessor for Section(0, &type metadata for EmptyView, v21, &type metadata for EmptyView);
  v81 = *(_QWORD *)(v30 - 8);
  v31 = __chkstk_darwin(v30);
  v33 = (char *)&v80 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v31);
  v82 = (char *)&v80 - v34;
  v89 = v35;
  v90 = v25;
  v36 = type metadata accessor for _ConditionalContent(0, v35, v25);
  v91 = *(_QWORD *)(v36 - 8);
  v92 = v36;
  __chkstk_darwin(v36);
  v97 = (char *)&v80 - v37;
  v38 = v87;
  v141 = a2;
  v142 = v87;
  v143 = a4;
  v144 = a5;
  v39 = type metadata accessor for SearchableListView(0, (uint64_t)&v141);
  v40 = v88;
  v41 = sub_100096F68();
  if (v41)
  {
    __chkstk_darwin(v41);
    *(&v80 - 6) = a2;
    *(&v80 - 5) = v38;
    *(&v80 - 4) = a4;
    *(&v80 - 3) = a5;
    v79 = v40;
    v42 = swift_getWitnessTable(&protocol conformance descriptor for _TraitWritingModifier<A>, v101);
    v113 = &protocol witness table for Text;
    v114 = v42;
    v43 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v102);
    v44 = swift_getWitnessTable(&protocol conformance descriptor for _TraitWritingModifier<A>, v99);
    v111 = v43;
    v112 = v44;
    v110 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v100);
    v45 = v98;
    v46 = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v98);
    Section<>.init(content:)(sub_10009FFEC, &v80 - 8, v45, v46);
    v107 = &protocol witness table for EmptyView;
    v108 = v46;
    v109 = &protocol witness table for EmptyView;
    v47 = v89;
    v48 = swift_getWitnessTable(&protocol conformance descriptor for <> Section<A, B, C>, v89);
    v50 = v81;
    v49 = v82;
    v51 = *(void (**)(char *, char *, uint64_t))(v81 + 16);
    v51(v82, v33, v47);
    v52 = *(void (**)(char *, uint64_t))(v50 + 8);
    v52(v33, v47);
    v51(v33, v49, v47);
    v104 = &protocol witness table for Text;
    v105 = v46;
    v106 = &protocol witness table for EmptyView;
    v53 = v93;
    v103 = swift_getWitnessTable(&protocol conformance descriptor for <> Section<A, B, C>, v93);
    v54 = v90;
    v55 = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v90);
    sub_100092A60((uint64_t)v33, v47, v54, v48, v55);
    v52(v33, v47);
    v52(v49, v47);
  }
  else
  {
    v141 = sub_100096E58(v39);
    v56 = (_QWORD *)swift_allocObject(&unk_1000E2598, 48, 7);
    v56[2] = a2;
    v56[3] = v38;
    v56[4] = a4;
    v56[5] = a5;
    v57 = swift_getWitnessTable(&protocol conformance descriptor for _TraitWritingModifier<A>, v101);
    v139 = &protocol witness table for Text;
    v140 = v57;
    v58 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v102);
    v59 = swift_getWitnessTable(&protocol conformance descriptor for _TraitWritingModifier<A>, v99);
    v137 = v58;
    v138 = v59;
    v136 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v100);
    v60 = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v98);
    v133 = &protocol witness table for Text;
    v134 = v60;
    v135 = &protocol witness table for EmptyView;
    v53 = v93;
    v61 = swift_getWitnessTable(&protocol conformance descriptor for <> Section<A, B, C>, v93);
    v62 = swift_getWitnessTable(&unk_1000B63E8, v86);
    ForEach<>.init(_:content:)(&v141, sub_10009FFE0, v56, v96, v95, v53, v84, v61, v62);
    v132 = v61;
    v54 = v90;
    v63 = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v90);
    v64 = v83;
    v65 = *(void (**)(char *, char *, uint64_t))(v83 + 16);
    v66 = v85;
    v65(v85, v28, v54);
    v67 = *(void (**)(char *, uint64_t))(v64 + 8);
    v67(v28, v54);
    v65(v28, v66, v54);
    v129 = &protocol witness table for EmptyView;
    v130 = v60;
    v131 = &protocol witness table for EmptyView;
    v47 = v89;
    v68 = swift_getWitnessTable(&protocol conformance descriptor for <> Section<A, B, C>, v89);
    sub_100092B24((uint64_t)v28, v47, v54, v68, v63);
    v67(v28, v54);
    v67(v66, v54);
  }
  v69 = swift_getWitnessTable(&protocol conformance descriptor for _TraitWritingModifier<A>, v101);
  v127 = &protocol witness table for Text;
  v128 = v69;
  v70 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v102);
  v71 = swift_getWitnessTable(&protocol conformance descriptor for _TraitWritingModifier<A>, v99);
  v125 = v70;
  v126 = v71;
  v124 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v100);
  v72 = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v98);
  v121 = &protocol witness table for EmptyView;
  v122 = v72;
  v123 = &protocol witness table for EmptyView;
  v73 = swift_getWitnessTable(&protocol conformance descriptor for <> Section<A, B, C>, v47);
  v118 = &protocol witness table for Text;
  v119 = v72;
  v120 = &protocol witness table for EmptyView;
  v117 = swift_getWitnessTable(&protocol conformance descriptor for <> Section<A, B, C>, v53);
  v74 = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v54);
  v115 = v73;
  v116 = v74;
  v75 = v92;
  swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v92);
  v76 = v91;
  v77 = v97;
  (*(void (**)(uint64_t, char *, uint64_t))(v91 + 16))(v94, v97, v75);
  return (*(uint64_t (**)(char *, uint64_t))(v76 + 8))(v77, v75);
}

uint64_t sub_100098AB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X8>)
{
  uint64_t v10;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t WitnessTable;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  void (*v34)(char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t AssociatedConformanceWitness;
  uint64_t v54;

  v42 = a1;
  v43 = a6;
  v10 = type metadata accessor for Array(255, a2);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(255, a5, a2, &protocol requirements base descriptor for Identifiable, &associated type descriptor for Identifiable.ID);
  v12 = type metadata accessor for TagValueTraitKey(255, a2, a4);
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for TagValueTraitKey<A>, v12);
  v41 = type metadata accessor for _TraitWritingModifier(255, v12, WitnessTable);
  v36 = type metadata accessor for ModifiedContent(255, &type metadata for Text);
  v14 = type metadata accessor for Optional(255, a2);
  v54 = a4;
  v15 = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v14);
  v16 = type metadata accessor for TagValueTraitKey(255, v14, v15);
  v17 = swift_getWitnessTable(&protocol conformance descriptor for TagValueTraitKey<A>, v16);
  v37 = type metadata accessor for _TraitWritingModifier(255, v16, v17);
  v18 = type metadata accessor for ModifiedContent(255, v36);
  v40 = v10;
  v38 = swift_getWitnessTable(&protocol conformance descriptor for [A], v10);
  v39 = AssociatedTypeWitness;
  v49 = v10;
  v50 = AssociatedTypeWitness;
  v51 = v18;
  v52 = v38;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness(a5, a2, AssociatedTypeWitness, &protocol requirements base descriptor for Identifiable, &associated conformance descriptor for Identifiable.Identifiable.ID: Hashable);
  v19 = type metadata accessor for ForEach(0, &v49);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = __chkstk_darwin(v19);
  v23 = (char *)&v36 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v25 = (char *)&v36 - v24;
  v49 = a2;
  v50 = a3;
  v26 = a3;
  v51 = a4;
  v52 = a5;
  v27 = type metadata accessor for SearchableListView(0, (uint64_t)&v49);
  v49 = sub_100096FE8(v27);
  v28 = (_QWORD *)swift_allocObject(&unk_1000E25C0, 48, 7);
  v28[2] = a2;
  v28[3] = v26;
  v28[4] = a4;
  v28[5] = a5;
  v29 = swift_getWitnessTable(&protocol conformance descriptor for _TraitWritingModifier<A>, v41);
  v47 = &protocol witness table for Text;
  v48 = v29;
  v30 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v36);
  v31 = swift_getWitnessTable(&protocol conformance descriptor for _TraitWritingModifier<A>, v37);
  v45 = v30;
  v46 = v31;
  v32 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v18);
  ForEach<>.init(_:content:)(&v49, sub_1000A001C, v28, v40, v39, v18, v38, v32, a5);
  v44 = v32;
  swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v19);
  v33 = *(void (**)(char *, char *, uint64_t))(v20 + 16);
  v33(v25, v23, v19);
  v34 = *(void (**)(char *, uint64_t))(v20 + 8);
  v34(v23, v19);
  v33(v43, v25, v19);
  return ((uint64_t (*)(char *, uint64_t))v34)(v25, v19);
}

uint64_t sub_100098DD4@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
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
  char *v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t);
  void (*v24)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t WitnessTable;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v39 = a5;
  v40 = a2;
  v47 = a7;
  v48 = a1;
  v10 = type metadata accessor for Optional(255, a4);
  v51 = a6;
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v10);
  v43 = v10;
  v11 = type metadata accessor for TagValueTraitKey.Value(0, v10);
  v45 = *(_QWORD *)(v11 - 8);
  v46 = v11;
  __chkstk_darwin(v11);
  v44 = (char *)&v37 - v12;
  v37 = type metadata accessor for TagValueTraitKey.Value(0, a4);
  v13 = *(_QWORD *)(v37 - 8);
  __chkstk_darwin(v37);
  v15 = (char *)&v37 - v14;
  v16 = type metadata accessor for TagValueTraitKey(255, a4, a6);
  v17 = swift_getWitnessTable(&protocol conformance descriptor for TagValueTraitKey<A>, v16);
  v18 = a3;
  v38 = type metadata accessor for _TraitWritingModifier(255, v16, v17);
  v19 = type metadata accessor for ModifiedContent(0, a3);
  v41 = *(_QWORD *)(v19 - 8);
  __chkstk_darwin(v19);
  v21 = (char *)&v37 - v20;
  v22 = *(_QWORD *)(a4 - 8);
  v23 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 16);
  v23(v15, v48, a4);
  v24 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56);
  v24(v15, 0, 1, a4);
  v25 = v16;
  v26 = v16;
  v27 = v39;
  View._trait<A>(_:_:)(v25, v15, v18, v26, v39, v17);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v37);
  if ((v40 & 1) != 0)
  {
    v28 = v44;
    v23(v44, v48, a4);
    v24(v28, 0, 1, a4);
    v29 = v43;
    v30 = swift_checkMetadataState(0, v43);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v28, 0, 1, v30);
  }
  else
  {
    v29 = v43;
    v31 = swift_checkMetadataState(0, v43);
    v28 = v44;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v44, 1, 1, v31);
  }
  v32 = type metadata accessor for TagValueTraitKey(0, v29, WitnessTable);
  v33 = swift_getWitnessTable(&protocol conformance descriptor for _TraitWritingModifier<A>, v38);
  v49 = v27;
  v50 = v33;
  v34 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v19);
  v35 = swift_getWitnessTable(&protocol conformance descriptor for TagValueTraitKey<A>, v32);
  View._trait<A>(_:_:)(v32, v28, v19, v32, v34, v35);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v28, v46);
  return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v21, v19);
}

uint64_t sub_1000990DC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X8>)
{
  uint64_t v10;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t WitnessTable;
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
  char *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  void (*v37)(char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char v47[16];
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t AssociatedConformanceWitness;
  uint64_t v66;

  v45 = a3;
  v46 = a6;
  v10 = type metadata accessor for Array(255, a2);
  v40 = a5;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(255, a5, a2, &protocol requirements base descriptor for Identifiable, &associated type descriptor for Identifiable.ID);
  v43 = a4;
  v12 = type metadata accessor for TagValueTraitKey(255, a2, a4);
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for TagValueTraitKey<A>, v12);
  v44 = type metadata accessor for _TraitWritingModifier(255, v12, WitnessTable);
  v42 = type metadata accessor for ModifiedContent(255, &type metadata for Text);
  v14 = type metadata accessor for Optional(255, a2);
  v66 = a4;
  v15 = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v14);
  v16 = type metadata accessor for TagValueTraitKey(255, v14, v15);
  v17 = swift_getWitnessTable(&protocol conformance descriptor for TagValueTraitKey<A>, v16);
  v18 = type metadata accessor for _TraitWritingModifier(255, v16, v17);
  v41 = type metadata accessor for ModifiedContent(255, v42);
  v61 = v10;
  v62 = AssociatedTypeWitness;
  v63 = v41;
  v64 = swift_getWitnessTable(&protocol conformance descriptor for [A], v10);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness(a5, a2, AssociatedTypeWitness, &protocol requirements base descriptor for Identifiable, &associated conformance descriptor for Identifiable.Identifiable.ID: Hashable);
  v19 = type metadata accessor for ForEach(255, &v61);
  v20 = type metadata accessor for Section(0, &type metadata for Text, v19, &type metadata for EmptyView);
  v21 = *(_QWORD *)(v20 - 8);
  v22 = __chkstk_darwin(v20);
  v24 = (char *)&v39 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  v26 = (char *)&v39 - v25;
  v27 = a1[1];
  v61 = *a1;
  v62 = v27;
  v28 = sub_10002D0D0();
  swift_bridgeObjectRetain(v27);
  v61 = Text.init<A>(_:)(&v61, &type metadata for String, v28);
  v62 = v29;
  LOBYTE(v63) = v30 & 1;
  v64 = v31;
  v48 = a2;
  v49 = v45;
  v50 = v43;
  v51 = v40;
  v52 = a1;
  v32 = swift_getWitnessTable(&protocol conformance descriptor for _TraitWritingModifier<A>, v44);
  v59 = &protocol witness table for Text;
  v60 = v32;
  v33 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v42);
  v34 = swift_getWitnessTable(&protocol conformance descriptor for _TraitWritingModifier<A>, v18);
  v57 = v33;
  v58 = v34;
  v56 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v41);
  v35 = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v19);
  Section<>.init(header:content:)(&v61, sub_1000A005C, v47, &type metadata for Text, v19, &protocol witness table for Text, v35);
  v53 = &protocol witness table for Text;
  v54 = v35;
  v55 = &protocol witness table for EmptyView;
  swift_getWitnessTable(&protocol conformance descriptor for <> Section<A, B, C>, v20);
  v36 = *(void (**)(char *, char *, uint64_t))(v21 + 16);
  v36(v26, v24, v20);
  v37 = *(void (**)(char *, uint64_t))(v21 + 8);
  v37(v24, v20);
  v36(v46, v26, v20);
  return ((uint64_t (*)(char *, uint64_t))v37)(v26, v20);
}

uint64_t sub_100099488@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X8>)
{
  uint64_t v10;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t v13;
  uint64_t WitnessTable;
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
  char *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  void (*v36)(char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  _QWORD v53[7];

  v46 = a3;
  v47 = a6;
  v10 = type metadata accessor for Array(255, a2);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(255, a5, a2, &protocol requirements base descriptor for Identifiable, &associated type descriptor for Identifiable.ID);
  v12 = a4;
  v44 = a4;
  v13 = type metadata accessor for TagValueTraitKey(255, a2, a4);
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for TagValueTraitKey<A>, v13);
  v45 = type metadata accessor for _TraitWritingModifier(255, v13, WitnessTable);
  v39 = type metadata accessor for ModifiedContent(255, &type metadata for Text);
  v15 = type metadata accessor for Optional(255, a2);
  v53[5] = v12;
  v16 = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v15);
  v17 = type metadata accessor for TagValueTraitKey(255, v15, v16);
  v18 = swift_getWitnessTable(&protocol conformance descriptor for TagValueTraitKey<A>, v17);
  v40 = type metadata accessor for _TraitWritingModifier(255, v17, v18);
  v19 = type metadata accessor for ModifiedContent(255, v39);
  v43 = v10;
  v41 = swift_getWitnessTable(&protocol conformance descriptor for [A], v10);
  v20 = a5;
  v42 = AssociatedTypeWitness;
  v53[0] = v10;
  v53[1] = AssociatedTypeWitness;
  v53[2] = v19;
  v53[3] = v41;
  v53[4] = swift_getAssociatedConformanceWitness(a5, a2, AssociatedTypeWitness, &protocol requirements base descriptor for Identifiable, &associated conformance descriptor for Identifiable.Identifiable.ID: Hashable);
  v21 = type metadata accessor for ForEach(0, v53);
  v22 = *(_QWORD *)(v21 - 8);
  v23 = __chkstk_darwin(v21);
  v25 = (char *)&v38 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  v27 = (char *)&v38 - v26;
  v28 = *(_QWORD *)(a1 + 16);
  v53[0] = v28;
  v29 = (_QWORD *)swift_allocObject(&unk_1000E25E8, 48, 7);
  v30 = v46;
  v29[2] = a2;
  v29[3] = v30;
  v29[4] = v44;
  v29[5] = v20;
  swift_bridgeObjectRetain(v28);
  v31 = swift_getWitnessTable(&protocol conformance descriptor for _TraitWritingModifier<A>, v45);
  v51 = &protocol witness table for Text;
  v52 = v31;
  v32 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v39);
  v33 = swift_getWitnessTable(&protocol conformance descriptor for _TraitWritingModifier<A>, v40);
  v49 = v32;
  v50 = v33;
  v34 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v19);
  ForEach<>.init(_:content:)(v53, sub_1000A05CC, v29, v43, v42, v19, v41, v34, v20);
  v48 = v34;
  swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v21);
  v35 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
  v35(v27, v25, v21);
  v36 = *(void (**)(char *, uint64_t))(v22 + 8);
  v36(v25, v21);
  v35(v47, v27, v21);
  return ((uint64_t (*)(char *, uint64_t))v36)(v27, v21);
}

uint64_t sub_1000997A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v9;
  uint64_t WitnessTable;
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
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  void (*v35)(char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;

  v43 = a5;
  v40 = a4;
  v9 = type metadata accessor for TagValueTraitKey(255, a2, a4);
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for TagValueTraitKey<A>, v9);
  v42 = type metadata accessor for _TraitWritingModifier(255, v9, WitnessTable);
  v38 = type metadata accessor for ModifiedContent(255, &type metadata for Text);
  v11 = type metadata accessor for Optional(255, a2);
  v52 = a4;
  v12 = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v11);
  v13 = type metadata accessor for TagValueTraitKey(255, v11, v12);
  v14 = swift_getWitnessTable(&protocol conformance descriptor for TagValueTraitKey<A>, v13);
  v39 = type metadata accessor for _TraitWritingModifier(255, v13, v14);
  v15 = type metadata accessor for ModifiedContent(0, v38);
  v41 = *(_QWORD *)(v15 - 8);
  v16 = __chkstk_darwin(v15);
  v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v20 = (char *)&v37 - v19;
  v48 = dispatch thunk of CustomStringConvertible.description.getter(a2, a3);
  v49 = v21;
  v22 = sub_10002D0D0();
  v23 = Text.init<A>(_:)(&v48, &type metadata for String, v22);
  v25 = v24;
  v27 = v26;
  v48 = v23;
  v49 = v24;
  v29 = v28 & 1;
  v50 = v28 & 1;
  v51 = v26;
  sub_100098DD4(a1, 1, (uint64_t)&type metadata for Text, a2, (uint64_t)&protocol witness table for Text, v40, (uint64_t)v18);
  sub_1000308FC(v23, v25, v29);
  swift_bridgeObjectRelease(v27);
  v30 = swift_getWitnessTable(&protocol conformance descriptor for _TraitWritingModifier<A>, v42);
  v46 = &protocol witness table for Text;
  v47 = v30;
  v31 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v38);
  v32 = swift_getWitnessTable(&protocol conformance descriptor for _TraitWritingModifier<A>, v39);
  v44 = v31;
  v45 = v32;
  swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v15);
  v33 = v41;
  v34 = *(void (**)(char *, char *, uint64_t))(v41 + 16);
  v34(v20, v18, v15);
  v35 = *(void (**)(char *, uint64_t))(v33 + 8);
  v35(v18, v15);
  v34(v43, v20, v15);
  return ((uint64_t (*)(char *, uint64_t))v35)(v20, v15);
}

uint64_t sub_100099A34(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t (*v5)(_QWORD);
  uint64_t v7;

  sub_10009FC00(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001375C(a1, (uint64_t)v4, v5);
  return EnvironmentValues.editMode.setter(v4);
}

uint64_t sub_100099AB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
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
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  void (*v33)(char *, char *, uint64_t);
  void (*v34)(char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[16];
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _BYTE v48[16];
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v36 = a2;
  v37 = a3;
  v38 = a1;
  v41 = a6;
  sub_10009FC38(0);
  v40 = v10;
  __chkstk_darwin(v10);
  v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for ToolbarItemPlacement(0);
  __chkstk_darwin(v13);
  v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10009DD78(0);
  v17 = v16;
  v39 = *(_QWORD *)(v16 - 8);
  v18 = __chkstk_darwin(v16);
  v20 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __chkstk_darwin(v18);
  v23 = (char *)&v36 - v22;
  static ToolbarItemPlacement.cancellationAction.getter(v21);
  v49 = a2;
  v50 = a3;
  v51 = a4;
  v52 = a5;
  v24 = a4;
  v25 = v38;
  v53 = v38;
  sub_100069050(0, &qword_1000EEDB8, (uint64_t (*)(_QWORD, void *, void *))&type metadata accessor for Button);
  v27 = v26;
  v28 = sub_1000694F8();
  v29 = ToolbarItem<>.init(placement:content:)(v15, sub_10009FDA0, v48, v27, v28);
  static ToolbarItemPlacement.confirmationAction.getter(v29);
  v43 = v36;
  v44 = v37;
  v45 = v24;
  v46 = a5;
  v47 = v25;
  ToolbarItem<>.init(placement:content:)(v15, sub_10009FDBC, v42, v27, v28);
  v31 = v39;
  v30 = v40;
  v32 = &v12[*(int *)(v40 + 48)];
  v33 = *(void (**)(char *, char *, uint64_t))(v39 + 16);
  v33(v12, v23, v17);
  v33(v32, v20, v17);
  TupleToolbarContent.init(_:)(v12, v30);
  v34 = *(void (**)(char *, uint64_t))(v31 + 8);
  v34(v20, v17);
  return ((uint64_t (*)(char *, uint64_t))v34)(v23, v17);
}

uint64_t sub_100099CC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  *(_QWORD *)&v8 = a2;
  *((_QWORD *)&v8 + 1) = a3;
  v9 = a4;
  v10 = a5;
  type metadata accessor for SearchableListView(0, (uint64_t)&v8);
  v8 = *(_OWORD *)(a1 + 64);
  LOBYTE(v9) = *(_BYTE *)(a1 + 80);
  v11 = 0;
  sub_1000138C8(0, &qword_1000F0648, (uint64_t)&type metadata for Bool, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for Binding);
  return Binding.wrappedValue.setter(&v11, v6);
}

uint64_t sub_100099D44(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  __int128 v8;
  char v9;

  if ((a1 & 1) != 0)
  {
    v8 = *(_OWORD *)(v2 + 88);
    v4 = type metadata accessor for Set(255, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 32));
    type metadata accessor for State(0, v4);
    State.wrappedValue.getter(&v7);
    sub_100096EC4(v7, a2);
  }
  v8 = *(_OWORD *)(v2 + 64);
  v9 = *(_BYTE *)(v2 + 80);
  LOBYTE(v7) = 0;
  sub_1000138C8(0, &qword_1000F0648, (uint64_t)&type metadata for Bool, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for Binding);
  return Binding.wrappedValue.setter(&v7, v5);
}

uint64_t sub_100099DFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v15 = swift_allocObject(a6, 184, 7);
  *(_QWORD *)(v15 + 16) = a2;
  *(_QWORD *)(v15 + 24) = a3;
  *(_QWORD *)(v15 + 32) = a4;
  *(_QWORD *)(v15 + 40) = a5;
  v16 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v15 + 144) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v15 + 160) = v16;
  *(_QWORD *)(v15 + 176) = *(_QWORD *)(a1 + 128);
  v17 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v15 + 80) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v15 + 96) = v17;
  v18 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v15 + 112) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v15 + 128) = v18;
  v19 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v15 + 48) = *(_OWORD *)a1;
  *(_OWORD *)(v15 + 64) = v19;
  sub_10009FE50((_QWORD *)a1);
  return Button.init(action:label:)(a7, v15, a8, 0, &type metadata for Text, &protocol witness table for Text);
}

uint64_t sub_100099EC4@<X0>(uint64_t a1@<X8>)
{
  return sub_100099ED4(1701736260, 0xE400000000000000, a1);
}

uint64_t sub_100099ED4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char v7;
  uint64_t v8;

  v4 = LocalizedStringKey.init(stringLiteral:)(a1, a2);
  result = Text.init(_:tableName:bundle:comment:)(v4);
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = v6;
  *(_BYTE *)(a3 + 16) = v7 & 1;
  *(_QWORD *)(a3 + 24) = v8;
  return result;
}

uint64_t sub_100099F30@<X0>(_QWORD *a1@<X0>, char *a2@<X8>)
{
  return sub_100097140(a1, a2);
}

uint64_t sub_100099F80(uint64_t *a1, uint64_t (*a2)(uint64_t), unint64_t *a3, _QWORD *a4, void (*a5)(id **, void ***, char **))
{
  uint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  Swift::Int v13;
  uint64_t v15[2];

  v10 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*a1);
  *a1 = v10;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v10 = a2(v10);
    *a1 = v10;
  }
  v12 = *(_QWORD *)(v10 + 16);
  v15[0] = v10 + 32;
  v15[1] = v12;
  v13 = sub_10009A024(v15, a3, a4, a5);
  return specialized ContiguousArray._endMutation()(v13);
}

Swift::Int sub_10009A024(uint64_t *a1, unint64_t *a2, _QWORD *a3, void (*a4)(id **, void ***, char **))
{
  uint64_t v4;
  Swift::Int v8;
  Swift::Int result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  Swift::Int v15;
  uint64_t v16;
  unint64_t v17;
  Swift::Int v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id *v31;
  int v32;
  Swift::Int v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v46;
  Swift::Int v47;
  Swift::Int v48;
  uint64_t *v49;
  uint64_t v50;
  Swift::Int v51;
  uint64_t v52;
  Swift::Int v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v67;
  void *v68;
  unint64_t v69;
  unint64_t v70;
  char *v71;
  char *v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  BOOL v84;
  unint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  BOOL v94;
  uint64_t v95;
  char v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  BOOL v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  char *v113;
  char *v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  unint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t *v130;
  Swift::Int v131;
  char *v132;
  char *v133;
  Swift::Int v134;
  Swift::Int v135;
  Swift::Int v136;
  uint64_t v137;
  void **v138;
  uint64_t v140;
  int v141;
  Swift::Int v142;
  Swift::Int v143;
  uint64_t v144;
  uint64_t v145;

  v8 = a1[1];
  result = _minimumMergeRunLength(_:)(v8);
  if (result >= v8)
  {
    if ((v8 & 0x8000000000000000) == 0)
    {
      if (v8)
        return sub_10009A93C(0, v8, 1, a1);
      return result;
    }
    goto LABEL_153;
  }
  if (v8 >= 0)
    v10 = v8;
  else
    v10 = v8 + 1;
  if (v8 < -1)
    goto LABEL_161;
  v130 = a1;
  v131 = result;
  v140 = v4;
  if (v8 < 2)
  {
    v14 = (char *)_swiftEmptyArrayStorage;
    v145 = (uint64_t)_swiftEmptyArrayStorage;
    v138 = (void **)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v8 != 1)
    {
      v17 = _swiftEmptyArrayStorage[2];
LABEL_118:
      if (v17 < 2)
      {
LABEL_129:
        v127 = swift_bridgeObjectRelease(v14);
        *(_QWORD *)((v145 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
        specialized Array._endMutation()(v127);
        return swift_bridgeObjectRelease(v145);
      }
      v121 = *v130;
      while (1)
      {
        v122 = v17 - 2;
        if (v17 < 2)
          break;
        if (!v121)
          goto LABEL_160;
        v123 = *(_QWORD *)&v14[16 * v122 + 32];
        v124 = *(_QWORD *)&v14[16 * v17 + 24];
        sub_10009AABC((id *)(v121 + 8 * v123), (id *)(v121 + 8 * *(_QWORD *)&v14[16 * v17 + 16]), (id *)(v121 + 8 * v124), v138, a4);
        if (v140)
          goto LABEL_116;
        if (v124 < v123)
          goto LABEL_149;
        if ((swift_isUniquelyReferenced_nonNull_native(v14) & 1) == 0)
          v14 = sub_100079EC0((uint64_t)v14);
        if (v122 >= *((_QWORD *)v14 + 2))
          goto LABEL_150;
        v125 = &v14[16 * v122 + 32];
        *(_QWORD *)v125 = v123;
        *((_QWORD *)v125 + 1) = v124;
        v126 = *((_QWORD *)v14 + 2);
        if (v17 > v126)
          goto LABEL_151;
        memmove(&v14[16 * v17 + 16], &v14[16 * v17 + 32], 16 * (v126 - v17));
        *((_QWORD *)v14 + 2) = v126 - 1;
        v17 = v126 - 1;
        if (v126 <= 2)
          goto LABEL_129;
      }
LABEL_148:
      __break(1u);
LABEL_149:
      __break(1u);
LABEL_150:
      __break(1u);
LABEL_151:
      __break(1u);
      goto LABEL_152;
    }
  }
  else
  {
    v11 = v10 >> 1;
    v12 = sub_100006D10(0, a2, a3);
    v13 = static Array._allocateBufferUninitialized(minimumCapacity:)(v11, v12);
    *(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10) = v11;
    v138 = (void **)((v13 & 0xFFFFFFFFFFFFFF8) + 32);
    v145 = v13;
  }
  v15 = 0;
  v16 = *a1;
  v128 = *a1 + 16;
  v129 = *a1 - 8;
  v14 = (char *)_swiftEmptyArrayStorage;
  v136 = v8;
  v144 = *a1;
  while (1)
  {
    v18 = v15 + 1;
    v135 = v15;
    if (v15 + 1 >= v8)
      goto LABEL_45;
    v132 = v14;
    v19 = *(void **)(v16 + 8 * v15);
    v20 = *(id *)(v16 + 8 * v18);
    v21 = v19;
    v22 = objc_msgSend(v20, "identifier");
    v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
    v25 = v24;

    v26 = objc_msgSend(v21, "identifier");
    v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
    v29 = v28;

    if (v23 == v27 && v25 == v29)
    {
      v141 = 0;
      v29 = v25;
    }
    else
    {
      v141 = _stringCompareWithSmolCheck(_:_:expecting:)(v23, v25, v27, v29, 1);
    }
    swift_bridgeObjectRelease(v25);
    swift_bridgeObjectRelease(v29);

    v18 = v15 + 2;
    v8 = v136;
    if (v15 + 2 >= v136)
      goto LABEL_36;
    v31 = (id *)(v128 + 8 * v15);
    while (1)
    {
      v33 = v18;
      v34 = *(v31 - 1);
      v35 = *v31;
      v36 = v34;
      v37 = objc_msgSend(v35, "identifier");
      v38 = static String._unconditionallyBridgeFromObjectiveC(_:)(v37);
      v40 = v39;

      v41 = objc_msgSend(v36, "identifier");
      v42 = static String._unconditionallyBridgeFromObjectiveC(_:)(v41);
      v44 = v43;

      if (v38 == v42 && v40 == v44)
      {

        swift_bridgeObjectRelease_n(v40, 2);
        if ((v141 & 1) != 0)
        {
          v14 = v132;
          v16 = v144;
          v18 = v33;
          v15 = v135;
          v8 = v136;
          goto LABEL_37;
        }
        goto LABEL_25;
      }
      v32 = _stringCompareWithSmolCheck(_:_:expecting:)(v38, v40, v42, v44, 1);

      swift_bridgeObjectRelease(v40);
      swift_bridgeObjectRelease(v44);
      if (((v141 ^ v32) & 1) != 0)
        break;
LABEL_25:
      v18 = v33 + 1;
      ++v31;
      v8 = v136;
      if (v136 == v33 + 1)
      {
        v18 = v136;
        goto LABEL_35;
      }
    }
    v8 = v136;
    v18 = v33;
LABEL_35:
    v15 = v135;
LABEL_36:
    v14 = v132;
    v16 = v144;
    if ((v141 & 1) != 0)
    {
LABEL_37:
      if (v18 >= v15)
      {
        if (v15 < v18)
        {
          v46 = (uint64_t *)(v129 + 8 * v18);
          v47 = v18;
          v48 = v15;
          v49 = (uint64_t *)(v16 + 8 * v15);
          while (1)
          {
            if (v48 != --v47)
            {
              if (!v16)
                goto LABEL_159;
              v50 = *v49;
              *v49 = *v46;
              *v46 = v50;
            }
            ++v48;
            --v46;
            ++v49;
            if (v48 >= v47)
              goto LABEL_45;
          }
        }
        goto LABEL_45;
      }
LABEL_154:
      __break(1u);
LABEL_155:
      __break(1u);
      goto LABEL_156;
    }
LABEL_45:
    if (v18 < v8)
    {
      if (!__OFSUB__(v18, v15))
      {
        if (v18 - v15 >= v131)
          goto LABEL_68;
        if (__OFADD__(v15, v131))
          goto LABEL_155;
        if (v15 + v131 >= v8)
          v51 = v8;
        else
          v51 = v15 + v131;
        if (v51 >= v15)
        {
          if (v18 != v51)
          {
            v133 = v14;
            v134 = v51;
            v52 = v129 + 8 * v18;
            do
            {
              v54 = *(void **)(v16 + 8 * v18);
              v137 = v52;
              v142 = v18;
              while (1)
              {
                v55 = *(void **)v52;
                v56 = v54;
                v57 = v55;
                v58 = objc_msgSend(v56, "identifier");
                v59 = static String._unconditionallyBridgeFromObjectiveC(_:)(v58);
                v61 = v60;

                v62 = objc_msgSend(v57, "identifier");
                v63 = static String._unconditionallyBridgeFromObjectiveC(_:)(v62);
                v65 = v64;

                if (v59 == v63 && v61 == v65)
                  break;
                v67 = _stringCompareWithSmolCheck(_:_:expecting:)(v59, v61, v63, v65, 1);

                swift_bridgeObjectRelease(v61);
                swift_bridgeObjectRelease(v65);
                if ((v67 & 1) == 0)
                  goto LABEL_56;
                v53 = v142;
                v16 = v144;
                if (!v144)
                  goto LABEL_157;
                v68 = *(void **)v52;
                v54 = *(void **)(v52 + 8);
                *(_QWORD *)v52 = v54;
                *(_QWORD *)(v52 + 8) = v68;
                v52 -= 8;
                if (v142 == ++v15)
                  goto LABEL_57;
              }

              swift_bridgeObjectRelease_n(v61, 2);
LABEL_56:
              v53 = v142;
              v16 = v144;
LABEL_57:
              v18 = v53 + 1;
              v52 = v137 + 8;
              v15 = v135;
            }
            while (v18 != v134);
            v18 = v134;
            v14 = v133;
          }
          goto LABEL_68;
        }
LABEL_156:
        __break(1u);
LABEL_157:
        __break(1u);
LABEL_158:
        __break(1u);
LABEL_159:
        __break(1u);
LABEL_160:
        __break(1u);
LABEL_161:
        result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
        __break(1u);
        return result;
      }
LABEL_152:
      __break(1u);
LABEL_153:
      __break(1u);
      goto LABEL_154;
    }
LABEL_68:
    if (v18 < v15)
    {
LABEL_147:
      __break(1u);
      goto LABEL_148;
    }
    if ((swift_isUniquelyReferenced_nonNull_native(v14) & 1) == 0)
      v14 = sub_100079C78(0, *((_QWORD *)v14 + 2) + 1, 1, v14);
    v70 = *((_QWORD *)v14 + 2);
    v69 = *((_QWORD *)v14 + 3);
    v17 = v70 + 1;
    v16 = v144;
    if (v70 >= v69 >> 1)
    {
      v119 = sub_100079C78((char *)(v69 > 1), v70 + 1, 1, v14);
      v16 = v144;
      v14 = v119;
    }
    *((_QWORD *)v14 + 2) = v17;
    v71 = v14 + 32;
    v72 = &v14[16 * v70 + 32];
    *(_QWORD *)v72 = v15;
    *((_QWORD *)v72 + 1) = v18;
    v143 = v18;
    if (v70)
      break;
    v17 = 1;
LABEL_14:
    v8 = v136;
    v15 = v143;
    if (v143 >= v136)
      goto LABEL_118;
  }
  while (1)
  {
    v73 = v17 - 1;
    if (v17 >= 4)
    {
      v78 = &v71[16 * v17];
      v79 = *((_QWORD *)v78 - 8);
      v80 = *((_QWORD *)v78 - 7);
      v84 = __OFSUB__(v80, v79);
      v81 = v80 - v79;
      if (v84)
        goto LABEL_136;
      v83 = *((_QWORD *)v78 - 6);
      v82 = *((_QWORD *)v78 - 5);
      v84 = __OFSUB__(v82, v83);
      v76 = v82 - v83;
      v77 = v84;
      if (v84)
        goto LABEL_137;
      v85 = v17 - 2;
      v86 = &v71[16 * v17 - 32];
      v88 = *(_QWORD *)v86;
      v87 = *((_QWORD *)v86 + 1);
      v84 = __OFSUB__(v87, v88);
      v89 = v87 - v88;
      if (v84)
        goto LABEL_139;
      v84 = __OFADD__(v76, v89);
      v90 = v76 + v89;
      if (v84)
        goto LABEL_142;
      if (v90 >= v81)
      {
        v108 = &v71[16 * v73];
        v110 = *(_QWORD *)v108;
        v109 = *((_QWORD *)v108 + 1);
        v84 = __OFSUB__(v109, v110);
        v111 = v109 - v110;
        if (v84)
          goto LABEL_146;
        v101 = v76 < v111;
        goto LABEL_105;
      }
    }
    else
    {
      if (v17 != 3)
      {
        v102 = *((_QWORD *)v14 + 4);
        v103 = *((_QWORD *)v14 + 5);
        v84 = __OFSUB__(v103, v102);
        v95 = v103 - v102;
        v96 = v84;
        goto LABEL_99;
      }
      v75 = *((_QWORD *)v14 + 4);
      v74 = *((_QWORD *)v14 + 5);
      v84 = __OFSUB__(v74, v75);
      v76 = v74 - v75;
      v77 = v84;
    }
    if ((v77 & 1) != 0)
      goto LABEL_138;
    v85 = v17 - 2;
    v91 = &v71[16 * v17 - 32];
    v93 = *(_QWORD *)v91;
    v92 = *((_QWORD *)v91 + 1);
    v94 = __OFSUB__(v92, v93);
    v95 = v92 - v93;
    v96 = v94;
    if (v94)
      goto LABEL_141;
    v97 = &v71[16 * v73];
    v99 = *(_QWORD *)v97;
    v98 = *((_QWORD *)v97 + 1);
    v84 = __OFSUB__(v98, v99);
    v100 = v98 - v99;
    if (v84)
      goto LABEL_144;
    if (__OFADD__(v95, v100))
      goto LABEL_145;
    if (v95 + v100 >= v76)
    {
      v101 = v76 < v100;
LABEL_105:
      if (v101)
        v73 = v85;
      goto LABEL_107;
    }
LABEL_99:
    if ((v96 & 1) != 0)
      goto LABEL_140;
    v104 = &v71[16 * v73];
    v106 = *(_QWORD *)v104;
    v105 = *((_QWORD *)v104 + 1);
    v84 = __OFSUB__(v105, v106);
    v107 = v105 - v106;
    if (v84)
      goto LABEL_143;
    if (v107 < v95)
      goto LABEL_14;
LABEL_107:
    v112 = v73 - 1;
    if (v73 - 1 >= v17)
    {
      __break(1u);
LABEL_133:
      __break(1u);
LABEL_134:
      __break(1u);
LABEL_135:
      __break(1u);
LABEL_136:
      __break(1u);
LABEL_137:
      __break(1u);
LABEL_138:
      __break(1u);
LABEL_139:
      __break(1u);
LABEL_140:
      __break(1u);
LABEL_141:
      __break(1u);
LABEL_142:
      __break(1u);
LABEL_143:
      __break(1u);
LABEL_144:
      __break(1u);
LABEL_145:
      __break(1u);
LABEL_146:
      __break(1u);
      goto LABEL_147;
    }
    if (!v16)
      goto LABEL_158;
    v113 = v14;
    v114 = &v71[16 * v112];
    v115 = *(_QWORD *)v114;
    v116 = &v71[16 * v73];
    v117 = *((_QWORD *)v116 + 1);
    sub_10009AABC((id *)(v16 + 8 * *(_QWORD *)v114), (id *)(v16 + 8 * *(_QWORD *)v116), (id *)(v16 + 8 * v117), v138, a4);
    if (v140)
      break;
    if (v117 < v115)
      goto LABEL_133;
    if (v73 > *((_QWORD *)v113 + 2))
      goto LABEL_134;
    *(_QWORD *)v114 = v115;
    *(_QWORD *)&v71[16 * v112 + 8] = v117;
    v118 = *((_QWORD *)v113 + 2);
    if (v73 >= v118)
      goto LABEL_135;
    v14 = v113;
    v140 = 0;
    v17 = v118 - 1;
    memmove(&v71[16 * v73], v116 + 16, 16 * (v118 - 1 - v73));
    *((_QWORD *)v113 + 2) = v118 - 1;
    v16 = v144;
    if (v118 <= 2)
      goto LABEL_14;
  }
  v14 = v113;
LABEL_116:
  v120 = swift_bridgeObjectRelease(v14);
  *(_QWORD *)((v145 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
  specialized Array._endMutation()(v120);
  return swift_bridgeObjectRelease(v145);
}

uint64_t sub_10009A93C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v23 = result;
  if (a3 != a2)
  {
    v25 = *a4;
    v4 = *a4 + 8 * a3 - 8;
LABEL_6:
    v6 = *(void **)(v25 + 8 * a3);
    v7 = v23;
    v24 = v4;
    v26 = a3;
    while (1)
    {
      v8 = *(void **)v4;
      v9 = v6;
      v10 = v8;
      v11 = objc_msgSend(v9, "identifier");
      v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
      v14 = v13;

      v15 = objc_msgSend(v10, "identifier");
      v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
      v18 = v17;

      if (v12 == v16 && v14 == v18)
      {

        result = swift_bridgeObjectRelease_n(v14, 2);
        v5 = v26;
LABEL_5:
        a3 = v5 + 1;
        v4 = v24 + 8;
        if (a3 == a2)
          return result;
        goto LABEL_6;
      }
      v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v12, v14, v16, v18, 1);

      swift_bridgeObjectRelease(v14);
      result = swift_bridgeObjectRelease(v18);
      v5 = v26;
      if ((v20 & 1) == 0)
        goto LABEL_5;
      if (!v25)
        break;
      v21 = *(void **)v4;
      v6 = *(void **)(v4 + 8);
      *(_QWORD *)v4 = v6;
      *(_QWORD *)(v4 + 8) = v21;
      v4 -= 8;
      if (v26 == ++v7)
        goto LABEL_5;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_10009AABC(id *__src, id *a2, id *a3, void **__dst, void (*a5)(id **, void ***, char **))
{
  id *v6;
  id *v7;
  id *v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void **v15;
  id *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v29;
  id *v30;
  void **v31;
  id *v32;
  char *v33;
  id *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v49;
  id *v50;
  unint64_t v51;
  uint64_t result;
  char *v54;
  char *v55;
  void **v56;
  id *v57;
  void **v58;
  id *v59;
  id *v60;
  id *v61;
  char *v62;
  void **v63;
  id *v64;

  v6 = a3;
  v7 = a2;
  v8 = __src;
  v9 = (char *)a2 - (char *)__src;
  v10 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0)
    v10 = (char *)a2 - (char *)__src;
  v11 = v10 >> 3;
  v12 = (char *)a3 - (char *)a2;
  v13 = (char *)a3 - (char *)a2 + 7;
  if ((char *)a3 - (char *)a2 >= 0)
    v13 = (char *)a3 - (char *)a2;
  v14 = v13 >> 3;
  v64 = __src;
  v63 = __dst;
  if (v11 >= v13 >> 3)
  {
    if (v12 < -7)
      goto LABEL_53;
    if (__dst != a2 || &a2[v14] <= __dst)
      memmove(__dst, a2, 8 * v14);
    v54 = (char *)__dst;
    v33 = (char *)&__dst[v14];
    v62 = v33;
    v64 = v7;
    if (v8 >= v7 || v12 < 8)
    {
LABEL_52:
      a5(&v64, &v63, &v62);
      return 1;
    }
    v34 = v7;
    v59 = v8;
    while (1)
    {
      v55 = v33;
      v57 = v7;
      v61 = v6;
      v36 = (void *)*((_QWORD *)v33 - 1);
      v33 -= 8;
      v35 = v36;
      v37 = *--v34;
      v38 = v35;
      v39 = v37;
      v40 = objc_msgSend(v38, "identifier");
      v41 = static String._unconditionallyBridgeFromObjectiveC(_:)(v40);
      v43 = v42;

      v44 = objc_msgSend(v39, "identifier");
      v45 = static String._unconditionallyBridgeFromObjectiveC(_:)(v44);
      v47 = v46;

      if (v41 == v45 && v43 == v47)
        break;
      v49 = _stringCompareWithSmolCheck(_:_:expecting:)(v41, v43, v45, v47, 1);

      swift_bridgeObjectRelease(v43);
      swift_bridgeObjectRelease(v47);
      v50 = v61;
      v6 = v61 - 1;
      if ((v49 & 1) == 0)
        goto LABEL_46;
      v51 = (unint64_t)v59;
      v33 = v55;
      if (v61 != v57 || v6 >= v57)
        *v6 = *v34;
      v64 = v34;
LABEL_50:
      if ((unint64_t)v34 > v51)
      {
        v7 = v34;
        if (v33 > v54)
          continue;
      }
      goto LABEL_52;
    }

    swift_bridgeObjectRelease_n(v43, 2);
    v50 = v61;
    v6 = v61 - 1;
LABEL_46:
    v34 = v57;
    v51 = (unint64_t)v59;
    v62 = v33;
    if (v50 < (id *)v55 || v6 >= (id *)v55 || v50 != (id *)v55)
      *v6 = *(id *)v33;
    goto LABEL_50;
  }
  if (v9 >= -7)
  {
    if (__dst != __src || &__src[v11] <= __dst)
      memmove(__dst, __src, 8 * v11);
    v56 = &__dst[v11];
    v62 = (char *)v56;
    if (v7 < v6 && v9 >= 8)
    {
      v15 = __dst;
      v60 = v6;
      while (1)
      {
        v58 = v8;
        v16 = v7;
        v17 = *v15;
        v18 = *v7;
        v19 = v17;
        v20 = objc_msgSend(v18, "identifier");
        v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
        v23 = v22;

        v24 = objc_msgSend(v19, "identifier");
        v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
        v27 = v26;

        if (v21 == v25 && v23 == v27)
          break;
        v29 = _stringCompareWithSmolCheck(_:_:expecting:)(v21, v23, v25, v27, 1);

        swift_bridgeObjectRelease(v23);
        swift_bridgeObjectRelease(v27);
        if ((v29 & 1) == 0)
          goto LABEL_23;
        v30 = v16 + 1;
        v31 = v58;
        v32 = v60;
        if (v58 < v16 || v58 >= v30 || v58 != v16)
          *v58 = *v16;
LABEL_26:
        v8 = v31 + 1;
        if (v15 < v56)
        {
          v7 = v30;
          if (v30 < v32)
            continue;
        }
        v64 = v8;
        goto LABEL_52;
      }

      swift_bridgeObjectRelease_n(v23, 2);
LABEL_23:
      v31 = v58;
      v32 = v60;
      if (v58 != v15)
        *v58 = *v15;
      v63 = ++v15;
      v30 = v16;
      goto LABEL_26;
    }
    goto LABEL_52;
  }
LABEL_53:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

uint64_t sub_10009AED4(uint64_t a1, char a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::Int v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v28;
  _QWORD v29[9];

  v3 = v2;
  v6 = *v2;
  Hasher.init(_seed:)(v29, *(_QWORD *)(*v2 + 40));
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v9 = v8;
  swift_bridgeObjectRetain(v6);
  String.hash(into:)(v29, v7, v9);
  swift_bridgeObjectRelease(v9);
  v10 = Hasher._finalize()();
  v11 = -1 << *(_BYTE *)(v6 + 32);
  v12 = v10 & ~v11;
  if (((*(_QWORD *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
  {
LABEL_14:
    swift_bridgeObjectRelease(v6);
    return 0;
  }
  v28 = v3;
  v13 = ~v11;
  while (1)
  {
    v14 = *(_QWORD *)(v6 + 48) + 16 * v12;
    if ((*(_BYTE *)(v14 + 8) & 1) != 0)
    {
      if ((a2 & 1) == 0)
        goto LABEL_3;
    }
    else if ((a2 & 1) != 0)
    {
      goto LABEL_3;
    }
    v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)v14);
    v17 = v16;
    v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
    if (v15 == v18 && v17 == v19)
      break;
    v21 = v19;
    v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v17, v18, v19, 0);
    swift_bridgeObjectRelease(v17);
    swift_bridgeObjectRelease(v21);
    if ((v22 & 1) != 0)
      goto LABEL_16;
LABEL_3:
    v12 = (v12 + 1) & v13;
    if (((*(_QWORD *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
      goto LABEL_14;
  }
  swift_bridgeObjectRelease_n(v17, 2);
LABEL_16:
  swift_bridgeObjectRelease(v6);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v28);
  v25 = *v28;
  v29[0] = *v28;
  *v28 = 0x8000000000000000;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_10007A420();
    v25 = v29[0];
  }
  v23 = *(_QWORD *)(*(_QWORD *)(v25 + 48) + 16 * v12);
  sub_10009B0C0(v12);
  v26 = *v28;
  *v28 = v29[0];
  swift_bridgeObjectRelease(v26);
  return v23;
}

unint64_t sub_10009B0C0(unint64_t result)
{
  _QWORD *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  id v19;
  Swift::Int v20;
  Swift::Int v21;
  uint64_t v22;
  _OWORD *v23;
  _OWORD *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[9];

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain(*v1);
    v8 = _HashTable.previousHole(before:)(v2, v4, v7);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      v28 = v4;
      do
      {
        v10 = 16 * v6;
        v11 = *(_QWORD *)(v3 + 40);
        v12 = v3;
        v13 = *(void **)(*(_QWORD *)(v3 + 48) + 16 * v6);
        v14 = v9;
        Hasher.init(_seed:)(v29, v11);
        v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
        v17 = v16;
        v18 = v2;
        v19 = v13;
        String.hash(into:)(v29, v15, v17);
        swift_bridgeObjectRelease(v17);
        v20 = Hasher._finalize()();

        v2 = v18;
        v9 = v14;
        v21 = v20 & v7;
        if (v18 >= (uint64_t)v14)
        {
          if (v21 < v14)
          {
            v4 = v28;
            v3 = v12;
          }
          else
          {
            v4 = v28;
            v3 = v12;
            if (v2 >= v21)
              goto LABEL_12;
          }
        }
        else
        {
          v4 = v28;
          v3 = v12;
          if (v21 >= v9 || v2 >= v21)
          {
LABEL_12:
            v22 = *(_QWORD *)(v3 + 48);
            v23 = (_OWORD *)(v22 + 16 * v2);
            v24 = (_OWORD *)(v22 + v10);
            if (16 * v2 != v10 || (v2 = v6, v23 >= v24 + 1))
            {
              *v23 = *v24;
              v2 = v6;
            }
          }
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release(v3);
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v25 = *(_QWORD *)(v3 + 16);
  v26 = __OFSUB__(v25, 1);
  v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v27;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_10009B2E0(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 56);
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
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3)
    v7 = 3;
  v8 = v7 - 3;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 128;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_10009B380(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  if ((a2 & 1) != 0)
  {
    if ((a4 & 1) != 0)
    {
      v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
      v7 = v12;
      v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
      v10 = v13;
      if (v5 != v9 || v7 != v13)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((a4 & 1) == 0)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
    v7 = v6;
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v10 = v8;
    if (v5 != v9 || v7 != v8)
    {
LABEL_11:
      v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v5, v7, v9, v10, 0);
      goto LABEL_12;
    }
LABEL_10:
    v11 = 1;
LABEL_12:
    swift_bridgeObjectRelease(v7);
    swift_bridgeObjectRelease(v10);
    return v11 & 1;
  }
  v11 = 0;
  return v11 & 1;
}

uint64_t sub_10009B448()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSString v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  NSString v44;
  unint64_t v45;
  unint64_t v46;
  _QWORD *v47;
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
  uint64_t *v60;
  uint64_t result;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;

  sub_10009E198(0, &qword_1000F0178, (uint64_t (*)(uint64_t, _QWORD *))type metadata accessor for SearchableListSection);
  v64 = v0;
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = (uint64_t *)((char *)&v62 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = __chkstk_darwin(v2);
  v65 = (uint64_t *)((char *)&v62 - v6);
  v7 = (id)_HKAllCategoryTypes(v5);
  v8 = sub_100006D10(0, &qword_1000EF630, HKCategoryType_ptr);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, v8);

  if (v9 < 0 || (v9 & 0x4000000000000000) != 0)
  {
    v25 = swift_bridgeObjectRetain(v9);
    v10 = (uint64_t)sub_100078748(v25);
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    v10 = v9 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v9);
  }
  v66 = v10;
  sub_100099F80(&v66, sub_10007C094, &qword_1000EF630, HKCategoryType_ptr, (void (*)(id **, void ***, char **))sub_100079D6C);
  swift_bridgeObjectRelease(v9);
  v11 = v66;
  v62 = v1;
  v63 = v4;
  if (v66 < 0 || (v66 & 0x4000000000000000) != 0)
  {
    v26 = swift_bridgeObjectRetain(v66);
    v12 = _CocoaArrayWrapper.endIndex.getter(v26);
    swift_release(v11);
    if (v12)
      goto LABEL_7;
LABEL_18:
    v24 = swift_release(v11);
    v14 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v12 = *(_QWORD *)(v66 + 16);
  if (!v12)
    goto LABEL_18;
LABEL_7:
  v66 = (uint64_t)_swiftEmptyArrayStorage;
  sub_10007FE7C(0, v12 & ~(v12 >> 63), 0);
  if (v12 < 0)
  {
    __break(1u);
    goto LABEL_39;
  }
  v13 = 0;
  v14 = (_QWORD *)v66;
  do
  {
    if ((v11 & 0xC000000000000001) != 0)
      v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v13, v11);
    else
      v15 = *(id *)(v11 + 8 * v13 + 32);
    v16 = v15;
    v17 = objc_msgSend(v15, "identifier", v62);
    static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
    v19 = v18;

    v20 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v19);
    v66 = (uint64_t)v14;
    v22 = v14[2];
    v21 = v14[3];
    if (v22 >= v21 >> 1)
    {
      sub_10007FE7C(v21 > 1, v22 + 1, 1);
      v14 = (_QWORD *)v66;
    }
    ++v13;
    v14[2] = v22 + 1;
    v23 = &v14[2 * v22];
    v23[4] = v20;
    *((_BYTE *)v23 + 40) = 0;
  }
  while (v12 != v13);
  v24 = swift_release(v11);
LABEL_19:
  v27 = static HKSampleDataCodingConstants.categoryTypeIdentifierPrefix.getter(v24);
  v28 = v65;
  *v65 = v27;
  v28[1] = v29;
  v28[2] = (uint64_t)v14;
  v30 = UUID.init()();
  v31 = (id)_HKAllQuantityTypes(v30);
  v32 = sub_100006D10(0, &qword_1000EF648, HKQuantityType_ptr);
  v33 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v31, v32);

  if (v33 < 0 || (v33 & 0x4000000000000000) != 0)
  {
    v49 = swift_bridgeObjectRetain(v33);
    v34 = (uint64_t)sub_10007873C(v49);
    swift_bridgeObjectRelease(v33);
  }
  else
  {
    v34 = v33 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v33);
  }
  v66 = v34;
  sub_100099F80(&v66, sub_10007C094, &qword_1000EF648, HKQuantityType_ptr, (void (*)(id **, void ***, char **))sub_100079D6C);
  swift_bridgeObjectRelease(v33);
  v35 = v66;
  if ((v66 & 0x8000000000000000) == 0 && (v66 & 0x4000000000000000) == 0)
  {
    v36 = *(_QWORD *)(v66 + 16);
    if (v36)
      goto LABEL_25;
LABEL_36:
    v48 = swift_release(v35);
    v38 = _swiftEmptyArrayStorage;
LABEL_37:
    v51 = static HKSampleDataCodingConstants.quantityTypeIdentifierPrefix.getter(v48);
    v52 = (uint64_t)v63;
    *v63 = v51;
    *(_QWORD *)(v52 + 8) = v53;
    *(_QWORD *)(v52 + 16) = v38;
    UUID.init()();
    sub_10009BA08(0, qword_1000F0190, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    v54 = *(_QWORD *)(v62 + 72);
    v55 = *(unsigned __int8 *)(v62 + 80);
    v56 = (v55 + 32) & ~v55;
    v58 = swift_allocObject(v57, v56 + 2 * v54, v55 | 7);
    *(_OWORD *)(v58 + 16) = xmmword_1000B1580;
    v59 = v58 + v56;
    v60 = v65;
    sub_10009BA70((uint64_t)v65, v59);
    sub_10009BAC4(v52, v59 + v54);
    sub_10009BB18((uint64_t)v60);
    return v58;
  }
  v50 = swift_bridgeObjectRetain(v66);
  v36 = _CocoaArrayWrapper.endIndex.getter(v50);
  swift_release(v35);
  if (!v36)
    goto LABEL_36;
LABEL_25:
  v66 = (uint64_t)_swiftEmptyArrayStorage;
  sub_10007FE7C(0, v36 & ~(v36 >> 63), 0);
  if ((v36 & 0x8000000000000000) == 0)
  {
    v37 = 0;
    v38 = (_QWORD *)v66;
    do
    {
      if ((v35 & 0xC000000000000001) != 0)
        v39 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v37, v35);
      else
        v39 = *(id *)(v35 + 8 * v37 + 32);
      v40 = v39;
      v41 = objc_msgSend(v39, "identifier", v62);
      static String._unconditionallyBridgeFromObjectiveC(_:)(v41);
      v43 = v42;

      v44 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v43);
      v66 = (uint64_t)v38;
      v46 = v38[2];
      v45 = v38[3];
      if (v46 >= v45 >> 1)
      {
        sub_10007FE7C(v45 > 1, v46 + 1, 1);
        v38 = (_QWORD *)v66;
      }
      ++v37;
      v38[2] = v46 + 1;
      v47 = &v38[2 * v46];
      v47[4] = v44;
      *((_BYTE *)v47 + 40) = 1;
    }
    while (v36 != v37);
    v48 = swift_release(v35);
    goto LABEL_37;
  }
LABEL_39:
  __break(1u);
  result = swift_release(v66);
  __break(1u);
  return result;
}

unint64_t sub_10009B974()
{
  unint64_t result;

  result = qword_1000F0180;
  if (!qword_1000F0180)
  {
    result = swift_getWitnessTable(&unk_1000B6458, &type metadata for HKDataType);
    atomic_store(result, (unint64_t *)&qword_1000F0180);
  }
  return result;
}

unint64_t sub_10009B9B8()
{
  unint64_t result;

  result = qword_1000F0188;
  if (!qword_1000F0188)
  {
    result = swift_getWitnessTable(&unk_1000B6420, &type metadata for HKDataType);
    atomic_store(result, (unint64_t *)&qword_1000F0188);
  }
  return result;
}

uint64_t type metadata accessor for SearchableListSection(uint64_t a1, uint64_t a2)
{
  return swift_getGenericMetadata(a1, a2, &nominal type descriptor for SearchableListSection);
}

void sub_10009BA08(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    sub_10009E198(255, &qword_1000F0178, (uint64_t (*)(uint64_t, _QWORD *))type metadata accessor for SearchableListSection);
    v7 = a3(a1, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_10009BA70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_10009E198(0, &qword_1000F0178, (uint64_t (*)(uint64_t, _QWORD *))type metadata accessor for SearchableListSection);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10009BAC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_10009E198(0, &qword_1000F0178, (uint64_t (*)(uint64_t, _QWORD *))type metadata accessor for SearchableListSection);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10009BB18(uint64_t a1)
{
  uint64_t v2;

  sub_10009E198(0, &qword_1000F0178, (uint64_t (*)(uint64_t, _QWORD *))type metadata accessor for SearchableListSection);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10009BB64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 48);
}

uint64_t sub_10009BB6C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = &unk_1000B6358;
  v4[1] = (char *)&value witness table for Builtin.BridgeObject + 64;
  result = type metadata accessor for UUID(319);
  if (v3 <= 0x3F)
  {
    v4[2] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 0, 3, v4, a1 + 48);
    return 0;
  }
  return result;
}

uint64_t *sub_10009BBEC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain(v12);
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = a2[2];
    a1[2] = v6;
    v7 = *(int *)(a3 + 56);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = type metadata accessor for UUID(0);
    v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    swift_bridgeObjectRetain(v5);
    swift_bridgeObjectRetain(v6);
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t sub_10009BCA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 16));
  v4 = a1 + *(int *)(a2 + 56);
  v5 = type metadata accessor for UUID(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_10009BCF0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[2];
  a1[2] = v5;
  v6 = *(int *)(a3 + 56);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for UUID(0);
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  v10(v7, v8, v9);
  return a1;
}

_QWORD *sub_10009BD78(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  *a1 = *a2;
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  v8 = a2[2];
  v9 = a1[2];
  a1[2] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  v10 = *(int *)(a3 + 56);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = type metadata accessor for UUID(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t sub_10009BE0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(int *)(a3 + 56);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *sub_10009BE70(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = a2[1];
  v7 = a1[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease(v7);
  v8 = a1[2];
  a1[2] = a2[2];
  swift_bridgeObjectRelease(v8);
  v9 = *(int *)(a3 + 56);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = type metadata accessor for UUID(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t sub_10009BEEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10009BEF8);
}

uint64_t sub_10009BEF8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for UUID(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 56), a2, v8);
  }
}

uint64_t sub_10009BF74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10009BF80);
}

uint64_t sub_10009BF80(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for UUID(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 56), a2, a2, v7);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for HKDataType(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v5 = v3;
  return a1;
}

uint64_t assignWithCopy for HKDataType(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v6 = v3;

  return a1;
}

uint64_t initializeWithTake for HKDataType(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for HKDataType(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for HKDataType(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HKDataType(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_10009C13C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_10009C144(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for HKDataType()
{
  return &type metadata for HKDataType;
}

char *sub_10009C160(char *a1, char **a2, int *a3)
{
  int v4;
  char *v5;
  char *v8;
  _OWORD *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
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
  char *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int (*v45)(char *, uint64_t, uint64_t);
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *__dst;

  v4 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
  }
  else
  {
    v9 = a2 + 1;
    v8 = a2[1];
    v10 = v5;
    if (v8)
    {
      v11 = a2[2];
      *((_QWORD *)a1 + 1) = v8;
      *((_QWORD *)a1 + 2) = v11;
      swift_retain(v11);
    }
    else
    {
      *(_OWORD *)(a1 + 8) = *v9;
    }
    v12 = a2[3];
    v13 = a2[4];
    *((_QWORD *)a1 + 3) = v12;
    *((_QWORD *)a1 + 4) = v13;
    v14 = a3[7];
    v15 = &a1[v14];
    v16 = (uint64_t)a2 + v14;
    v17 = type metadata accessor for Date(0);
    v18 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16);
    swift_bridgeObjectRetain(v12);
    swift_retain(v13);
    v18(v15, v16, v17);
    sub_1000076D8(0, &qword_1000F0218, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
    v20 = v19;
    v21 = *(int *)(v19 + 28);
    v22 = *(_QWORD *)(v16 + v21);
    *(_QWORD *)&v15[v21] = v22;
    v23 = a3[8];
    v24 = &a1[v23];
    v25 = (uint64_t)a2 + v23;
    swift_retain(v22);
    v18(v24, v25, v17);
    v26 = *(int *)(v20 + 28);
    v27 = *(_QWORD *)(v25 + v26);
    *(_QWORD *)&v24[v26] = v27;
    v28 = a3[9];
    v29 = a3[10];
    v30 = &a1[v28];
    v31 = (uint64_t *)((char *)a2 + v28);
    v32 = *v31;
    v33 = v31[1];
    *(_QWORD *)v30 = *v31;
    *((_QWORD *)v30 + 1) = v33;
    v34 = &a1[v29];
    v35 = (char *)a2 + v29;
    *v34 = *v35;
    v36 = *((_QWORD *)v35 + 1);
    *((_QWORD *)v34 + 1) = v36;
    v37 = a3[11];
    v38 = a3[12];
    v39 = &a1[v37];
    v40 = (char *)a2 + v37;
    *v39 = *v40;
    v41 = *((_QWORD *)v40 + 1);
    *((_QWORD *)v39 + 1) = v41;
    __dst = &a1[v38];
    v42 = (char *)a2 + v38;
    v43 = type metadata accessor for URL(0);
    v44 = *(_QWORD *)(v43 - 8);
    v45 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48);
    swift_retain(v27);
    swift_bridgeObjectRetain(v32);
    swift_retain(v33);
    swift_retain(v36);
    swift_retain(v41);
    if (v45(v42, 1, v43))
    {
      sub_1000927EC(0);
      v47 = __dst;
      memcpy(__dst, v42, *(_QWORD *)(*(_QWORD *)(v46 - 8) + 64));
    }
    else
    {
      v47 = __dst;
      (*(void (**)(char *, char *, uint64_t))(v44 + 16))(__dst, v42, v43);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v44 + 56))(__dst, 0, 1, v43);
    }
    sub_1000076D8(0, &qword_1000F0220, (uint64_t (*)(uint64_t))sub_1000927EC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
    v49 = *(int *)(v48 + 28);
    v5 = *(char **)&v42[v49];
    *(_QWORD *)&v47[v49] = v5;
  }
  swift_retain(v5);
  return a1;
}

uint64_t sub_10009C3D4(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (*(_QWORD *)(a1 + 8))
    swift_release(*(_QWORD *)(a1 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
  swift_release(*(_QWORD *)(a1 + 32));
  v4 = a1 + a2[7];
  v5 = type metadata accessor for Date(0);
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  sub_1000076D8(0, &qword_1000F0218, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  v8 = v7;
  swift_release(*(_QWORD *)(v4 + *(int *)(v7 + 28)));
  v9 = a1 + a2[8];
  v6(v9, v5);
  swift_release(*(_QWORD *)(v9 + *(int *)(v8 + 28)));
  v10 = (_QWORD *)(a1 + a2[9]);
  swift_bridgeObjectRelease(*v10);
  swift_release(v10[1]);
  swift_release(*(_QWORD *)(a1 + a2[10] + 8));
  swift_release(*(_QWORD *)(a1 + a2[11] + 8));
  v11 = a1 + a2[12];
  v12 = type metadata accessor for URL(0);
  v13 = *(_QWORD *)(v12 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  sub_1000076D8(0, &qword_1000F0220, (uint64_t (*)(uint64_t))sub_1000927EC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  return swift_release(*(_QWORD *)(v11 + *(int *)(v14 + 28)));
}

_QWORD *sub_10009C548(_QWORD *a1, uint64_t a2, int *a3)
{
  void *v6;
  _OWORD *v7;
  uint64_t v8;
  _OWORD *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
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
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int (*v45)(char *, uint64_t, uint64_t);
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *__dst;

  v6 = *(void **)a2;
  *a1 = *(_QWORD *)a2;
  v7 = a1 + 1;
  v9 = (_OWORD *)(a2 + 8);
  v8 = *(_QWORD *)(a2 + 8);
  v10 = v6;
  if (v8)
  {
    v11 = *(_QWORD *)(a2 + 16);
    a1[1] = v8;
    a1[2] = v11;
    swift_retain(v11);
  }
  else
  {
    *v7 = *v9;
  }
  v12 = *(_QWORD *)(a2 + 24);
  v13 = *(_QWORD *)(a2 + 32);
  a1[3] = v12;
  a1[4] = v13;
  v14 = a3[7];
  v15 = (char *)a1 + v14;
  v16 = a2 + v14;
  v17 = type metadata accessor for Date(0);
  v18 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16);
  swift_bridgeObjectRetain(v12);
  swift_retain(v13);
  v18(v15, v16, v17);
  sub_1000076D8(0, &qword_1000F0218, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  v20 = v19;
  v21 = *(int *)(v19 + 28);
  v22 = *(_QWORD *)(v16 + v21);
  *(_QWORD *)&v15[v21] = v22;
  v23 = a3[8];
  v24 = (char *)a1 + v23;
  v25 = a2 + v23;
  swift_retain(v22);
  v18(v24, v25, v17);
  v26 = *(int *)(v20 + 28);
  v27 = *(_QWORD *)(v25 + v26);
  *(_QWORD *)&v24[v26] = v27;
  v28 = a3[9];
  v29 = a3[10];
  v30 = (_QWORD *)((char *)a1 + v28);
  v31 = (uint64_t *)(a2 + v28);
  v32 = *v31;
  v33 = v31[1];
  *v30 = *v31;
  v30[1] = v33;
  v34 = (char *)a1 + v29;
  v35 = (char *)(a2 + v29);
  *v34 = *v35;
  v36 = *((_QWORD *)v35 + 1);
  *((_QWORD *)v34 + 1) = v36;
  v37 = a3[11];
  v38 = a3[12];
  v39 = (char *)a1 + v37;
  v40 = (char *)(a2 + v37);
  *v39 = *v40;
  v41 = *((_QWORD *)v40 + 1);
  *((_QWORD *)v39 + 1) = v41;
  __dst = (char *)a1 + v38;
  v42 = (char *)(a2 + v38);
  v43 = type metadata accessor for URL(0);
  v44 = *(_QWORD *)(v43 - 8);
  v45 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48);
  swift_retain(v27);
  swift_bridgeObjectRetain(v32);
  swift_retain(v33);
  swift_retain(v36);
  swift_retain(v41);
  if (v45(v42, 1, v43))
  {
    sub_1000927EC(0);
    v47 = __dst;
    memcpy(__dst, v42, *(_QWORD *)(*(_QWORD *)(v46 - 8) + 64));
  }
  else
  {
    v47 = __dst;
    (*(void (**)(char *, char *, uint64_t))(v44 + 16))(__dst, v42, v43);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v44 + 56))(__dst, 0, 1, v43);
  }
  sub_1000076D8(0, &qword_1000F0220, (uint64_t (*)(uint64_t))sub_1000927EC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  v49 = *(int *)(v48 + 28);
  v50 = *(_QWORD *)&v42[v49];
  *(_QWORD *)&v47[v49] = v50;
  swift_retain(v50);
  return a1;
}

uint64_t sub_10009C79C(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
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
  void (*v21)(uint64_t, uint64_t, uint64_t);
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
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t (*v55)(char *, uint64_t, uint64_t);
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v6 = *(void **)a2;
  v7 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v6;

  v9 = *(_QWORD *)(a2 + 8);
  if (*(_QWORD *)(a1 + 8))
  {
    if (v9)
    {
      v10 = *(_QWORD *)(a2 + 16);
      v11 = *(_QWORD *)(a1 + 16);
      *(_QWORD *)(a1 + 8) = v9;
      *(_QWORD *)(a1 + 16) = v10;
      swift_retain(v10);
      swift_release(v11);
      goto LABEL_8;
    }
    swift_release(*(_QWORD *)(a1 + 16));
  }
  else if (v9)
  {
    v12 = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 8) = v9;
    *(_QWORD *)(a1 + 16) = v12;
    swift_retain(v12);
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
LABEL_8:
  v13 = *(_QWORD *)(a2 + 24);
  v14 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v13;
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRelease(v14);
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v16;
  swift_retain(v16);
  swift_release(v15);
  v17 = a3[7];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = type metadata accessor for Date(0);
  v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 24);
  v21(v18, v19, v20);
  sub_1000076D8(0, &qword_1000F0218, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  v23 = v22;
  v24 = *(int *)(v22 + 28);
  v25 = *(_QWORD *)(v18 + v24);
  v26 = *(_QWORD *)(v19 + v24);
  *(_QWORD *)(v18 + v24) = v26;
  swift_retain(v26);
  swift_release(v25);
  v27 = a3[8];
  v28 = a1 + v27;
  v29 = a2 + v27;
  v21(a1 + v27, a2 + v27, v20);
  v30 = *(int *)(v23 + 28);
  v31 = *(_QWORD *)(v28 + v30);
  v32 = *(_QWORD *)(v29 + v30);
  *(_QWORD *)(v28 + v30) = v32;
  swift_retain(v32);
  swift_release(v31);
  v33 = a3[9];
  v34 = a1 + v33;
  v35 = a2 + v33;
  v36 = *(_QWORD *)(a2 + v33);
  v37 = *(_QWORD *)(a1 + v33);
  *(_QWORD *)(a1 + v33) = v36;
  swift_bridgeObjectRetain(v36);
  swift_bridgeObjectRelease(v37);
  v38 = *(_QWORD *)(v34 + 8);
  v39 = *(_QWORD *)(v35 + 8);
  *(_QWORD *)(v34 + 8) = v39;
  swift_retain(v39);
  swift_release(v38);
  v40 = a3[10];
  v41 = a1 + v40;
  v42 = a2 + v40;
  *(_BYTE *)v41 = *(_BYTE *)v42;
  v43 = *(_QWORD *)(v41 + 8);
  v44 = *(_QWORD *)(v42 + 8);
  *(_QWORD *)(v41 + 8) = v44;
  swift_retain(v44);
  swift_release(v43);
  v45 = a3[11];
  v46 = a1 + v45;
  v47 = a2 + v45;
  *(_BYTE *)v46 = *(_BYTE *)v47;
  v48 = *(_QWORD *)(v46 + 8);
  v49 = *(_QWORD *)(v47 + 8);
  *(_QWORD *)(v46 + 8) = v49;
  swift_retain(v49);
  swift_release(v48);
  v50 = a3[12];
  v51 = (char *)(a1 + v50);
  v52 = (char *)(a2 + v50);
  v53 = type metadata accessor for URL(0);
  v54 = *(_QWORD *)(v53 - 8);
  v55 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v54 + 48);
  LODWORD(v34) = v55(v51, 1, v53);
  v56 = v55(v52, 1, v53);
  if (!(_DWORD)v34)
  {
    if (!v56)
    {
      (*(void (**)(char *, char *, uint64_t))(v54 + 24))(v51, v52, v53);
      goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v54 + 8))(v51, v53);
    goto LABEL_13;
  }
  if (v56)
  {
LABEL_13:
    sub_1000927EC(0);
    memcpy(v51, v52, *(_QWORD *)(*(_QWORD *)(v57 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v51, v52, v53);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v54 + 56))(v51, 0, 1, v53);
LABEL_14:
  sub_1000076D8(0, &qword_1000F0220, (uint64_t (*)(uint64_t))sub_1000927EC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  v59 = *(int *)(v58 + 28);
  v60 = *(_QWORD *)&v51[v59];
  v61 = *(_QWORD *)&v52[v59];
  *(_QWORD *)&v51[v59] = v61;
  swift_retain(v61);
  swift_release(v60);
  return a1;
}

uint64_t sub_10009CAC0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  if (v6)
  {
    v7 = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 8) = v6;
    *(_QWORD *)(a1 + 16) = v7;
  }
  else
  {
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v8 = a3[7];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = type metadata accessor for Date(0);
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32);
  v12(v9, v10, v11);
  sub_1000076D8(0, &qword_1000F0218, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  v14 = v13;
  *(_QWORD *)(v9 + *(int *)(v13 + 28)) = *(_QWORD *)(v10 + *(int *)(v13 + 28));
  v15 = a3[8];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v12(a1 + v15, a2 + v15, v11);
  *(_QWORD *)(v16 + *(int *)(v14 + 28)) = *(_QWORD *)(v17 + *(int *)(v14 + 28));
  v18 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v18) = *(_OWORD *)(a2 + v18);
  v19 = a3[12];
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  v20 = (char *)(a1 + v19);
  v21 = (char *)(a2 + v19);
  v22 = type metadata accessor for URL(0);
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
  {
    sub_1000927EC(0);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v20, v21, v22);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  sub_1000076D8(0, &qword_1000F0220, (uint64_t (*)(uint64_t))sub_1000927EC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  *(_QWORD *)&v20[*(int *)(v25 + 28)] = *(_QWORD *)&v21[*(int *)(v25 + 28)];
  return a1;
}

uint64_t sub_10009CC88(uint64_t a1, _QWORD *a2, int *a3)
{
  void *v6;
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
  void (*v17)(uint64_t, char *, uint64_t);
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
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(char *, uint64_t, uint64_t);
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v7 = a2[1];
  if (*(_QWORD *)(a1 + 8))
  {
    if (v7)
    {
      v8 = a2[2];
      v9 = *(_QWORD *)(a1 + 16);
      *(_QWORD *)(a1 + 8) = v7;
      *(_QWORD *)(a1 + 16) = v8;
      swift_release(v9);
      goto LABEL_8;
    }
    swift_release(*(_QWORD *)(a1 + 16));
  }
  else if (v7)
  {
    v10 = a2[2];
    *(_QWORD *)(a1 + 8) = v7;
    *(_QWORD *)(a1 + 16) = v10;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
LABEL_8:
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = a2[3];
  swift_bridgeObjectRelease(v11);
  v12 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = a2[4];
  swift_release(v12);
  v13 = a3[7];
  v14 = a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = type metadata accessor for Date(0);
  v17 = *(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 40);
  v17(v14, v15, v16);
  sub_1000076D8(0, &qword_1000F0218, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  v19 = v18;
  v20 = *(int *)(v18 + 28);
  v21 = *(_QWORD *)(v14 + v20);
  *(_QWORD *)(v14 + v20) = *(_QWORD *)&v15[v20];
  swift_release(v21);
  v22 = a3[8];
  v23 = a1 + v22;
  v24 = (char *)a2 + v22;
  v17(a1 + v22, (char *)a2 + v22, v16);
  v25 = *(int *)(v19 + 28);
  v26 = *(_QWORD *)(v23 + v25);
  *(_QWORD *)(v23 + v25) = *(_QWORD *)&v24[v25];
  swift_release(v26);
  v27 = a3[9];
  v28 = a1 + v27;
  v29 = (char *)a2 + v27;
  v30 = *(_QWORD *)(a1 + v27);
  *(_QWORD *)(a1 + v27) = *(_QWORD *)((char *)a2 + v27);
  swift_bridgeObjectRelease(v30);
  v31 = *(_QWORD *)(v28 + 8);
  *(_QWORD *)(v28 + 8) = *((_QWORD *)v29 + 1);
  swift_release(v31);
  v32 = a3[10];
  v33 = a1 + v32;
  v34 = (char *)a2 + v32;
  *(_BYTE *)v33 = *v34;
  v35 = *(_QWORD *)(v33 + 8);
  *(_QWORD *)(v33 + 8) = *((_QWORD *)v34 + 1);
  swift_release(v35);
  v36 = a3[11];
  v37 = a1 + v36;
  v38 = (char *)a2 + v36;
  *(_BYTE *)v37 = *v38;
  v39 = *(_QWORD *)(v37 + 8);
  *(_QWORD *)(v37 + 8) = *((_QWORD *)v38 + 1);
  swift_release(v39);
  v40 = a3[12];
  v41 = (char *)(a1 + v40);
  v42 = (char *)a2 + v40;
  v43 = type metadata accessor for URL(0);
  v44 = *(_QWORD *)(v43 - 8);
  v45 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v44 + 48);
  LODWORD(v29) = v45(v41, 1, v43);
  v46 = v45(v42, 1, v43);
  if (!(_DWORD)v29)
  {
    if (!v46)
    {
      (*(void (**)(char *, char *, uint64_t))(v44 + 40))(v41, v42, v43);
      goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v44 + 8))(v41, v43);
    goto LABEL_13;
  }
  if (v46)
  {
LABEL_13:
    sub_1000927EC(0);
    memcpy(v41, v42, *(_QWORD *)(*(_QWORD *)(v47 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v41, v42, v43);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v44 + 56))(v41, 0, 1, v43);
LABEL_14:
  sub_1000076D8(0, &qword_1000F0220, (uint64_t (*)(uint64_t))sub_1000927EC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  v49 = *(int *)(v48 + 28);
  v50 = *(_QWORD *)&v41[v49];
  *(_QWORD *)&v41[v49] = *(_QWORD *)&v42[v49];
  swift_release(v50);
  return a1;
}

uint64_t sub_10009CF4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10009CF58);
}

uint64_t sub_10009CF58(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    sub_1000076D8(0, &qword_1000F0218, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 28);
    }
    else
    {
      sub_1000076D8(0, &qword_1000F0220, (uint64_t (*)(uint64_t))sub_1000927EC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
      v10 = v12;
      v9 = *(_QWORD *)(v12 - 8);
      v11 = *(int *)(a3 + 48);
    }
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(&a1[v11], a2, v10);
  }
}

uint64_t sub_10009D028(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10009D034);
}

char *sub_10009D034(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    sub_1000076D8(0, &qword_1000F0218, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 28);
    }
    else
    {
      sub_1000076D8(0, &qword_1000F0220, (uint64_t (*)(uint64_t))sub_1000927EC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
      v10 = v12;
      v9 = *(_QWORD *)(v12 - 8);
      v11 = *(int *)(a4 + 48);
    }
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(&v5[v11], a2, a2, v10);
  }
  return result;
}

void sub_10009D100(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v6[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v6[1] = &unk_1000B63A8;
  v6[2] = &unk_1000B6358;
  sub_1000076D8(319, &qword_1000F0218, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  if (v3 <= 0x3F)
  {
    v7 = *(_QWORD *)(v2 - 8) + 64;
    v8 = v7;
    v9 = &unk_1000B6358;
    v10 = &unk_1000B63A8;
    v11 = &unk_1000B63A8;
    sub_1000076D8(319, &qword_1000F0220, (uint64_t (*)(uint64_t))sub_1000927EC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
    if (v5 <= 0x3F)
    {
      v12 = *(_QWORD *)(v4 - 8) + 64;
      swift_initStructMetadata(a1, 256, 9, v6, a1 + 16);
    }
  }
}

uint64_t sub_10009D1E8()
{
  return sub_100013198(&qword_1000F02D8, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
}

unint64_t sub_10009D218()
{
  unint64_t result;

  result = qword_1000F02E0;
  if (!qword_1000F02E0)
  {
    result = swift_getWitnessTable(&unk_1000B63C0, &type metadata for HKDataType);
    atomic_store(result, (unint64_t *)&qword_1000F02E0);
  }
  return result;
}

uint64_t sub_10009D25C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000C28A4, 1);
}

uint64_t sub_10009D26C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100092BE8(*(_QWORD *)(v1 + 16), a1);
}

void sub_10009D274(uint64_t a1)
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
  uint64_t OpaqueTypeConformance2;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t OpaqueTypeMetadata2;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;

  if (!qword_1000F02E8)
  {
    sub_10009D408(255);
    v3 = v2;
    sub_10009E114(255);
    v5 = v4;
    sub_10009D524(255);
    v7 = v6;
    sub_1000076D8(255, &qword_1000F03E0, (uint64_t (*)(uint64_t))sub_10009DCEC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for TupleToolbarContent);
    v9 = v8;
    sub_10009DE34(255, &qword_1000F0300, (uint64_t (*)(uint64_t))sub_10009D5E4, sub_10009DCD0, (uint64_t)&opaque type descriptor for <<opaque return type of View.navigationTitle(_:)>>);
    v11 = v10;
    sub_10009D5E4(255);
    v23 = v12;
    v24 = sub_10009DCD0();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v23, &opaque type descriptor for <<opaque return type of View.navigationTitle(_:)>>, 1);
    v23 = v11;
    v24 = OpaqueTypeConformance2;
    v14 = swift_getOpaqueTypeConformance2(&v23, &opaque type descriptor for <<opaque return type of View.navigationBarTitleDisplayMode(_:)>>, 1);
    v15 = sub_10009E0B4();
    v23 = v7;
    v24 = v9;
    v25 = v14;
    v26 = v15;
    v16 = swift_getOpaqueTypeConformance2(&v23, &opaque type descriptor for <<opaque return type of View.toolbar<A>(content:)>>, 1);
    sub_10009E198(255, &qword_1000F0450, (uint64_t (*)(uint64_t, _QWORD *))type metadata accessor for SearchableListView);
    v18 = v17;
    v19 = sub_10009E228();
    v23 = v18;
    v24 = v19;
    v20 = swift_getOpaqueTypeConformance2(&v23, &opaque type descriptor for <<opaque return type of View.interactiveDismissDisabled(_:)>>, 1);
    v23 = v3;
    v24 = v5;
    v25 = v16;
    v26 = v20;
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2(a1, &v23, &opaque type descriptor for <<opaque return type of View.sheet<A>(isPresented:onDismiss:content:)>>, 0);
    if (!v22)
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_1000F02E8);
  }
}

void sub_10009D408(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t OpaqueTypeConformance2;
  uint64_t v10;
  unint64_t v11;
  unint64_t OpaqueTypeMetadata2;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  if (!qword_1000F02F0)
  {
    sub_10009D524(255);
    v3 = v2;
    sub_1000076D8(255, &qword_1000F03E0, (uint64_t (*)(uint64_t))sub_10009DCEC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for TupleToolbarContent);
    v5 = v4;
    sub_10009DE34(255, &qword_1000F0300, (uint64_t (*)(uint64_t))sub_10009D5E4, sub_10009DCD0, (uint64_t)&opaque type descriptor for <<opaque return type of View.navigationTitle(_:)>>);
    v7 = v6;
    sub_10009D5E4(255);
    v14 = v8;
    v15 = sub_10009DCD0();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v14, &opaque type descriptor for <<opaque return type of View.navigationTitle(_:)>>, 1);
    v14 = v7;
    v15 = OpaqueTypeConformance2;
    v10 = swift_getOpaqueTypeConformance2(&v14, &opaque type descriptor for <<opaque return type of View.navigationBarTitleDisplayMode(_:)>>, 1);
    v11 = sub_10009E0B4();
    v14 = v3;
    v15 = v5;
    v16 = v10;
    v17 = v11;
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2(a1, &v14, &opaque type descriptor for <<opaque return type of View.toolbar<A>(content:)>>, 0);
    if (!v13)
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_1000F02F0);
  }
}

void sub_10009D524(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t OpaqueTypeConformance2;
  unint64_t OpaqueTypeMetadata2;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (!qword_1000F02F8)
  {
    sub_10009DE34(255, &qword_1000F0300, (uint64_t (*)(uint64_t))sub_10009D5E4, sub_10009DCD0, (uint64_t)&opaque type descriptor for <<opaque return type of View.navigationTitle(_:)>>);
    v3 = v2;
    sub_10009D5E4(255);
    v8 = v4;
    v9 = sub_10009DCD0();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v8, &opaque type descriptor for <<opaque return type of View.navigationTitle(_:)>>, 1);
    v8 = v3;
    v9 = OpaqueTypeConformance2;
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2(a1, &v8, &opaque type descriptor for <<opaque return type of View.navigationBarTitleDisplayMode(_:)>>, 0);
    if (!v7)
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_1000F02F8);
  }
}

void sub_10009D5E4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if (!qword_1000F0308)
  {
    sub_1000076D8(255, &qword_1000F0310, (uint64_t (*)(uint64_t))sub_10009D65C, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for TupleView);
    v3 = v2;
    v4 = sub_10009DC70();
    v5 = type metadata accessor for Form(a1, v3, v4);
    if (!v6)
      atomic_store(v5, (unint64_t *)&qword_1000F0308);
  }
}

void sub_10009D65C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t TupleTypeMetadata3;
  uint64_t v8;

  if (!qword_1000F0318)
  {
    sub_10009DAB4(255, &qword_1000F0320, &qword_1000F0328, (uint64_t (*)(uint64_t))sub_10009D710);
    v3 = v2;
    sub_10009DAB4(255, &qword_1000F03A0, &qword_1000F03A8, (uint64_t (*)(uint64_t))sub_10009DB24);
    v5 = v4;
    sub_10009DB94(255);
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3(a1, v3, v5, v6, 0, 0);
    if (!v8)
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_1000F0318);
  }
}

void sub_10009D710(uint64_t a1)
{
  sub_10009DD08(a1, &qword_1000F0330, (uint64_t (*)(uint64_t))sub_10009D72C, (uint64_t (*)(uint64_t))sub_10009D8E0);
}

void sub_10009D72C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD v7[5];

  if (!qword_1000F0338)
  {
    sub_1000138C8(255, &qword_1000F0340, (uint64_t)&type metadata for HKDataType, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for Array);
    v3 = v2;
    sub_10009D7DC(255);
    v7[0] = v3;
    v7[1] = &type metadata for HKDataType;
    v7[2] = v4;
    v7[3] = sub_10009DA54();
    v7[4] = sub_10007C010();
    v5 = type metadata accessor for ForEach(a1, v7);
    if (!v6)
      atomic_store(v5, (unint64_t *)&qword_1000F0338);
  }
}

void sub_10009D7DC(uint64_t a1)
{
  uint64_t v2;
  unint64_t OpaqueTypeMetadata2;
  uint64_t v4;
  _QWORD v5[4];

  if (!qword_1000F0348)
  {
    sub_10009D87C(255);
    v5[0] = &type metadata for Text;
    v5[1] = v2;
    v5[2] = &protocol witness table for Text;
    v5[3] = sub_10009E6FC(&qword_1000F0380, (uint64_t (*)(uint64_t))sub_10009D87C, (void (*)(void))sub_10009DA38);
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2(a1, v5, &opaque type descriptor for <<opaque return type of View.swipeActions<A>(edge:allowsFullSwipe:content:)>>, 0);
    if (!v4)
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_1000F0348);
  }
}

void sub_10009D87C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_1000F0350)
  {
    sub_10009D8E0(255);
    v3 = v2;
    sub_10009D9CC(255);
    v4 = type metadata accessor for ModifiedContent(a1, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_1000F0350);
  }
}

void sub_10009D8E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if (!qword_1000F0358)
  {
    sub_10009D958();
    v3 = v2;
    v4 = sub_100013198(&qword_1000F0368, (uint64_t (*)(uint64_t))sub_10009D958, (uint64_t)&protocol conformance descriptor for Label<A, B>);
    v5 = type metadata accessor for Button(a1, v3, v4);
    if (!v6)
      atomic_store(v5, (unint64_t *)&qword_1000F0358);
  }
}

void sub_10009D958()
{
  unint64_t v0;
  uint64_t v1;
  _QWORD v2[4];

  if (!qword_1000F0360)
  {
    v2[0] = &type metadata for Text;
    v2[1] = &type metadata for Image;
    v2[2] = &protocol witness table for Text;
    v2[3] = &protocol witness table for Image;
    v0 = type metadata accessor for Label(0, v2);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1000F0360);
  }
}

void sub_10009D9CC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000F0370)
  {
    sub_1000138C8(255, &qword_1000F0378, (uint64_t)&type metadata for AnyShapeStyle, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for Optional);
    v3 = type metadata accessor for _EnvironmentKeyWritingModifier(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000F0370);
  }
}

uint64_t sub_10009DA38()
{
  return sub_100013198(&qword_1000F0390, (uint64_t (*)(uint64_t))sub_10009D9CC, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
}

unint64_t sub_10009DA54()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000F0398;
  if (!qword_1000F0398)
  {
    sub_1000138C8(255, &qword_1000F0340, (uint64_t)&type metadata for HKDataType, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for Array);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000F0398);
  }
  return result;
}

void sub_10009DAB4(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    sub_1000076D8(255, a3, a4, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for TupleView);
    v7 = type metadata accessor for Section(a1, &type metadata for Text, v6, &type metadata for EmptyView);
    if (!v8)
      atomic_store(v7, a2);
  }
}

void sub_10009DB24(uint64_t a1)
{
  uint64_t v2;
  unint64_t TupleTypeMetadata2;
  uint64_t v4;

  if (!qword_1000F03B0)
  {
    sub_100069050(255, &qword_1000F03B8, (uint64_t (*)(_QWORD, void *, void *))&type metadata accessor for DatePicker);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2(a1, v2, v2, 0, 0);
    if (!v4)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1000F03B0);
  }
}

void sub_10009DB94(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000F03C0)
  {
    sub_10009DBF4(255);
    v3 = type metadata accessor for Section(a1, &type metadata for EmptyView, v2, &type metadata for EmptyView);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000F03C0);
  }
}

void sub_10009DBF4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_1000F03C8)
  {
    sub_10009D8E0(255);
    v3 = v2;
    sub_1000138C8(255, &qword_1000EEDC0, (uint64_t)&type metadata for Bool, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for _EnvironmentKeyTransformModifier);
    v4 = type metadata accessor for ModifiedContent(a1, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_1000F03C8);
  }
}

unint64_t sub_10009DC70()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000F03D0;
  if (!qword_1000F03D0)
  {
    sub_1000076D8(255, &qword_1000F0310, (uint64_t (*)(uint64_t))sub_10009D65C, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for TupleView);
    result = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000F03D0);
  }
  return result;
}

uint64_t sub_10009DCD0()
{
  return sub_100013198(&qword_1000F03D8, (uint64_t (*)(uint64_t))sub_10009D5E4, (uint64_t)&protocol conformance descriptor for Form<A>);
}

void sub_10009DCEC(uint64_t a1)
{
  sub_10009DD08(a1, &qword_1000F03E8, (uint64_t (*)(uint64_t))sub_10009DD78, (uint64_t (*)(uint64_t))sub_10009DDF4);
}

void sub_10009DD08(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  unint64_t TupleTypeMetadata2;
  uint64_t v10;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2(a1, v7, v8, 0, 0);
    if (!v10)
      atomic_store(TupleTypeMetadata2, a2);
  }
}

void sub_10009DD78(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if (!qword_1000F03F0)
  {
    sub_100069050(255, &qword_1000EEDB8, (uint64_t (*)(_QWORD, void *, void *))&type metadata accessor for Button);
    v3 = v2;
    v4 = sub_1000694F8();
    v5 = type metadata accessor for ToolbarItem(a1, (char *)&type metadata for () + 8, v3, v4);
    if (!v6)
      atomic_store(v5, (unint64_t *)&qword_1000F03F0);
  }
}

void sub_10009DDF4(uint64_t a1)
{
  sub_1000076D8(a1, &qword_1000F03F8, (uint64_t (*)(uint64_t))sub_10009DE10, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
}

void sub_10009DE10(uint64_t a1)
{
  sub_10009DE34(a1, &qword_1000F0400, (uint64_t (*)(uint64_t))sub_10009DEB4, sub_10009E098, (uint64_t)&opaque type descriptor for <<opaque return type of static ToolbarContentBuilder.buildBlock<A>(_:)>>);
}

void sub_10009DE34(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(void), uint64_t a5)
{
  unint64_t OpaqueTypeMetadata2;
  uint64_t v10;
  _QWORD v11[2];

  if (!*a2)
  {
    v11[0] = a3(255);
    v11[1] = a4();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2(a1, v11, a5, 0);
    if (!v10)
      atomic_store(OpaqueTypeMetadata2, a2);
  }
}

void sub_10009DEB4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if (!qword_1000F0408)
  {
    sub_10009DF38(255);
    v3 = v2;
    v4 = sub_100013198(&qword_1000F0430, (uint64_t (*)(uint64_t))sub_10009DF38, (uint64_t)&protocol conformance descriptor for ShareLink<A, B, C, D>);
    v5 = type metadata accessor for ToolbarItem(a1, (char *)&type metadata for () + 8, v3, v4);
    if (!v6)
      atomic_store(v5, (unint64_t *)&qword_1000F0408);
  }
}

void sub_10009DF38(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD v7[9];

  if (!qword_1000F0410)
  {
    sub_1000076D8(255, &qword_1000F0418, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for CollectionOfOne);
    v3 = v2;
    sub_10009D958();
    v7[0] = v3;
    v7[1] = &type metadata for Never;
    v7[2] = &type metadata for Never;
    v7[3] = v4;
    v7[4] = sub_10009E038();
    v7[5] = &protocol witness table for Never;
    v7[6] = &protocol witness table for Never;
    v7[7] = sub_100013198(&qword_1000F0368, (uint64_t (*)(uint64_t))sub_10009D958, (uint64_t)&protocol conformance descriptor for Label<A, B>);
    v7[8] = sub_100013198(&qword_1000F0428, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
    v5 = type metadata accessor for ShareLink(a1, v7);
    if (!v6)
      atomic_store(v5, (unint64_t *)&qword_1000F0410);
  }
}

unint64_t sub_10009E038()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000F0420;
  if (!qword_1000F0420)
  {
    sub_1000076D8(255, &qword_1000F0418, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for CollectionOfOne);
    result = swift_getWitnessTable(&protocol conformance descriptor for CollectionOfOne<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000F0420);
  }
  return result;
}

uint64_t sub_10009E098()
{
  return sub_100013198(&qword_1000F0438, (uint64_t (*)(uint64_t))sub_10009DEB4, (uint64_t)&protocol conformance descriptor for ToolbarItem<A, B>);
}

unint64_t sub_10009E0B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000F0440;
  if (!qword_1000F0440)
  {
    sub_1000076D8(255, &qword_1000F03E0, (uint64_t (*)(uint64_t))sub_10009DCEC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for TupleToolbarContent);
    result = swift_getWitnessTable(&protocol conformance descriptor for TupleToolbarContent<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000F0440);
  }
  return result;
}

void sub_10009E114(uint64_t a1)
{
  uint64_t v2;
  unint64_t OpaqueTypeMetadata2;
  uint64_t v4;
  _QWORD v5[2];

  if (!qword_1000F0448)
  {
    sub_10009E198(255, &qword_1000F0450, (uint64_t (*)(uint64_t, _QWORD *))type metadata accessor for SearchableListView);
    v5[0] = v2;
    v5[1] = sub_10009E228();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2(a1, v5, &opaque type descriptor for <<opaque return type of View.interactiveDismissDisabled(_:)>>, 0);
    if (!v4)
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_1000F0448);
  }
}

void sub_10009E198(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, _QWORD *))
{
  unint64_t v6;
  uint64_t v7;
  _QWORD v8[4];

  if (!*a2)
  {
    v8[0] = &type metadata for HKDataType;
    v8[1] = sub_10009B974();
    v8[2] = sub_10007C010();
    v8[3] = sub_10009B9B8();
    v6 = a3(a1, v8);
    if (!v7)
      atomic_store(v6, a2);
  }
}

uint64_t type metadata accessor for SearchableListView(uint64_t a1, uint64_t a2)
{
  return swift_getGenericMetadata(a1, a2, &nominal type descriptor for SearchableListView);
}

unint64_t sub_10009E228()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000F0458;
  if (!qword_1000F0458)
  {
    sub_10009E198(255, &qword_1000F0450, (uint64_t (*)(uint64_t, _QWORD *))type metadata accessor for SearchableListView);
    result = swift_getWitnessTable(&unk_1000B65F0, v1);
    atomic_store(result, (unint64_t *)&qword_1000F0458);
  }
  return result;
}

uint64_t sub_10009E280@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_100093164(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_10009E288@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100094D44(*(_QWORD *)(v1 + 16), a1);
}

_QWORD *sub_10009E294()
{
  type metadata accessor for ExportDatasetView(0);
  return sub_1000954C0();
}

_QWORD *sub_10009E2D0(_QWORD *a1)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = a1[1];
  v3 = a1[2];
  v4 = a1[3];
  v5 = a1[4];
  v6 = a1[6];
  v7 = a1[7];
  v12 = a1[5];
  v13 = a1[8];
  v8 = a1[9];
  v9 = a1[11];
  v10 = a1[14];
  v14 = a1[12];
  v15 = a1[15];
  swift_bridgeObjectRelease(a1[16]);
  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v9);
  swift_release(v8);
  swift_bridgeObjectRelease(v7);
  swift_release(v6);
  swift_bridgeObjectRelease(v5);
  swift_release(v4);
  swift_bridgeObjectRelease(v2);
  swift_release(v3);
  swift_release(v12);
  swift_release(v13);
  swift_release(v14);
  swift_release(v15);
  return a1;
}

void sub_10009E3AC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    sub_10009BA08(255, &qword_1000F0170, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    v7 = a3(a1, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_10009E414()
{
  uint64_t v0;

  return sub_10009527C(*(_QWORD *)(v0 + 16));
}

uint64_t sub_10009E41C()
{
  uint64_t v0;

  return sub_100095374(*(_QWORD *)(v0 + 16));
}

uint64_t sub_10009E428()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t);
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = (int *)type metadata accessor for ExportDatasetView(0);
  v2 = *((_QWORD *)v1 - 1);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = (_QWORD *)(v0 + v4);

  if (*(_QWORD *)(v0 + v4 + 8))
    swift_release(v6[2]);
  swift_bridgeObjectRelease(v6[3]);
  swift_release(v6[4]);
  v7 = (char *)v6 + v1[7];
  v8 = type metadata accessor for Date(0);
  v9 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
  v9(v7, v8);
  sub_1000076D8(0, &qword_1000F0218, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  v11 = v10;
  swift_release(*(_QWORD *)&v7[*(int *)(v10 + 28)]);
  v12 = (char *)v6 + v1[8];
  v9(v12, v8);
  swift_release(*(_QWORD *)&v12[*(int *)(v11 + 28)]);
  v13 = (_QWORD *)((char *)v6 + v1[9]);
  swift_bridgeObjectRelease(*v13);
  swift_release(v13[1]);
  swift_release(*(_QWORD *)((char *)v6 + v1[10] + 8));
  swift_release(*(_QWORD *)((char *)v6 + v1[11] + 8));
  v14 = (char *)v6 + v1[12];
  v15 = type metadata accessor for URL(0);
  v16 = *(_QWORD *)(v15 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
    (*(void (**)(char *, uint64_t))(v16 + 8))(v14, v15);
  sub_1000076D8(0, &qword_1000F0220, (uint64_t (*)(uint64_t))sub_1000927EC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  swift_release(*(_QWORD *)&v14[*(int *)(v17 + 28)]);
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_10009E5E0()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t (*v3)(void);

  result = type metadata accessor for ExportDatasetView(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(result - 8) + 80);
  v3 = *(uint64_t (**)(void))(v0 + ((v2 + 16) & ~v2) + 8);
  if (v3)
    return v3();
  return result;
}

uint64_t sub_10009E624@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_100093618(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_10009E62C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000F0480;
  if (!qword_1000F0480)
  {
    sub_1000076D8(255, &qword_1000F0328, (uint64_t (*)(uint64_t))sub_10009D710, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for TupleView);
    result = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000F0480);
  }
  return result;
}

uint64_t sub_10009E68C@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_100094028(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_10009E694()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000F0488;
  if (!qword_1000F0488)
  {
    sub_1000076D8(255, &qword_1000F03A8, (uint64_t (*)(uint64_t))sub_10009DB24, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for TupleView);
    result = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000F0488);
  }
  return result;
}

uint64_t sub_10009E6F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100094450(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_10009E6FC(unint64_t *a1, uint64_t (*a2)(uint64_t), void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    sub_100013198(&qword_1000F0388, (uint64_t (*)(uint64_t))sub_10009D8E0, (uint64_t)&protocol conformance descriptor for Button<A>);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_10009E784()
{
  type metadata accessor for ExportDatasetView(0);
  sub_10009473C();
}

uint64_t sub_10009E7C4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

_BYTE *sub_10009E7D4(_BYTE *a1)
{
  uint64_t v1;

  return sub_10006880C(a1, *(_BYTE *)(v1 + 16));
}

uint64_t type metadata accessor for SampleExporter(uint64_t a1)
{
  return sub_100006A08(a1, qword_1000F0540, (uint64_t)&nominal type descriptor for SampleExporter);
}

uint64_t sub_10009E7F0()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  char *v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;

  v1 = (int *)type metadata accessor for ExportDatasetView(0);
  v2 = *((_QWORD *)v1 - 1);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v26 = *(_QWORD *)(v2 + 64);
  v4 = (int *)type metadata accessor for SampleExporter(0);
  v5 = *((_QWORD *)v4 - 1);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v25 = *(_QWORD *)(v5 + 64);
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  v7 = v0 + ((v3 + 32) & ~v3);

  if (*(_QWORD *)(v7 + 8))
    swift_release(*(_QWORD *)(v7 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v7 + 24));
  swift_release(*(_QWORD *)(v7 + 32));
  v8 = v7 + v1[7];
  v9 = type metadata accessor for Date(0);
  v10 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8);
  v10(v8, v9);
  sub_1000076D8(0, &qword_1000F0218, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  v12 = v11;
  swift_release(*(_QWORD *)(v8 + *(int *)(v11 + 28)));
  v13 = v7 + v1[8];
  v10(v13, v9);
  swift_release(*(_QWORD *)(v13 + *(int *)(v12 + 28)));
  v14 = (_QWORD *)(v7 + v1[9]);
  swift_bridgeObjectRelease(*v14);
  swift_release(v14[1]);
  swift_release(*(_QWORD *)(v7 + v1[10] + 8));
  swift_release(*(_QWORD *)(v7 + v1[11] + 8));
  v15 = v7 + v1[12];
  v16 = type metadata accessor for URL(0);
  v17 = *(_QWORD *)(v16 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v16);
  v18 = (((v3 + 32) & ~v3) + v26 + v6) & ~v6;
  v19 = v18 + v25;
  sub_1000076D8(0, &qword_1000F0220, (uint64_t (*)(uint64_t))sub_1000927EC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  swift_release(*(_QWORD *)(v15 + *(int *)(v20 + 28)));
  v21 = (_QWORD *)(v0 + v18);
  swift_bridgeObjectRelease(*v21);
  v22 = (char *)v21 + v4[5];
  v23 = type metadata accessor for DateInterval(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v23 - 8) + 8))(v22, v23);

  return swift_deallocObject(v0, v19, v3 | v6 | 7);
}

uint64_t sub_10009EA3C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(_QWORD *)(type metadata accessor for ExportDatasetView(0) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  type metadata accessor for SampleExporter(0);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = (_QWORD *)swift_task_alloc(dword_1000F049C);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_10001C2DC;
  return sub_100095A94(a1, v6, v7, v1 + v5);
}

void sub_10009EAF0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_100006D10(255, (unint64_t *)&unk_1000EED00, HKSample_ptr);
    v7 = a3(a1, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_10009EB58(uint64_t *a1)
{
  return sub_100096C30(a1);
}

void sub_10009EB74(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000F04B0)
  {
    sub_10009EAF0(255, &qword_1000F04B8, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for HKSamplePredicate);
    v3 = type metadata accessor for _ContiguousArrayStorage(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000F04B0);
  }
}

unint64_t sub_10009EBD8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000F04E0;
  if (!qword_1000F04E0)
  {
    sub_1000076D8(255, &qword_1000F04D8, (uint64_t (*)(uint64_t))&type metadata accessor for DatePickerComponents, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000F04E0);
  }
  return result;
}

double sub_10009EC3C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ExportDatasetView(0) - 8) + 80);
  return sub_100093A04(a1, v1 + ((v3 + 16) & ~v3));
}

uint64_t sub_10009EC8C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ExportDatasetView(0) - 8) + 80);
  return sub_100093F70(v0 + ((v1 + 16) & ~v1));
}

uint64_t sub_10009ECB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100093C54(*(_QWORD *)(v1 + 16), *(void **)(v1 + 24), *(_BYTE *)(v1 + 32), a1);
}

uint64_t sub_10009ECC4()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t);
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;

  v1 = (int *)type metadata accessor for ExportDatasetView(0);
  v2 = *((_QWORD *)v1 - 1);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = (_QWORD *)(v0 + v4);

  if (*(_QWORD *)(v0 + v4 + 8))
    swift_release(v6[2]);
  swift_bridgeObjectRelease(v6[3]);
  swift_release(v6[4]);
  v7 = (char *)v6 + v1[7];
  v8 = type metadata accessor for Date(0);
  v9 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
  v9(v7, v8);
  sub_1000076D8(0, &qword_1000F0218, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  v11 = v10;
  swift_release(*(_QWORD *)&v7[*(int *)(v10 + 28)]);
  v12 = (char *)v6 + v1[8];
  v9(v12, v8);
  swift_release(*(_QWORD *)&v12[*(int *)(v11 + 28)]);
  v13 = (_QWORD *)((char *)v6 + v1[9]);
  swift_bridgeObjectRelease(*v13);
  swift_release(v13[1]);
  swift_release(*(_QWORD *)((char *)v6 + v1[10] + 8));
  swift_release(*(_QWORD *)((char *)v6 + v1[11] + 8));
  v14 = (char *)v6 + v1[12];
  v15 = type metadata accessor for URL(0);
  v16 = *(_QWORD *)(v15 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
    (*(void (**)(char *, uint64_t))(v16 + 8))(v14, v15);
  v17 = (v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_1000076D8(0, &qword_1000F0220, (uint64_t (*)(uint64_t))sub_1000927EC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  swift_release(*(_QWORD *)&v14[*(int *)(v18 + 28)]);

  return swift_deallocObject(v0, v17 + 9, v3 | 7);
}

double sub_10009EE90()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(type metadata accessor for ExportDatasetView(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  return sub_100093E54(v0 + v2, *(_QWORD *)v3, *(_BYTE *)(v3 + 8));
}

uint64_t sub_10009EED8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.tint.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10009EF00(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.tint.setter(v1);
}

void sub_10009EF28(id a1, char a2)
{
  if (a2 != -1)

}

unint64_t sub_10009EF3C(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v3 = HIBYTE(a3) & 0xF;
    else
      v3 = a2 & 0xFFFFFFFFFFFFLL;
    v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v4 = 11;
    v5 = v4 | (v3 << 16);
    result = String.index(_:offsetBy:limitedBy:)(15, result, v5, a2, a3);
    if ((v6 & 1) != 0)
      result = v5;
    if (4 * v3 >= result >> 14)
      return String.subscript.getter();
  }
  __break(1u);
  return result;
}

uint64_t *sub_10009EFD8(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain(v4);
  }
  else
  {
    v7 = a1;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for DateInterval(0);
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain(v4);
    v12(v9, v10, v11);
    v13 = a3[6];
    v14 = a3[7];
    v15 = *(void **)((char *)a2 + v13);
    *(uint64_t *)((char *)v7 + v13) = (uint64_t)v15;
    v16 = *(void **)((char *)a2 + v14);
    *(uint64_t *)((char *)v7 + v14) = (uint64_t)v16;
    v17 = v15;
    v18 = v16;
  }
  return v7;
}

void sub_10009F09C(_QWORD *a1, int *a2)
{
  char *v4;
  uint64_t v5;

  swift_bridgeObjectRelease(*a1);
  v4 = (char *)a1 + a2[5];
  v5 = type metadata accessor for DateInterval(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);

}

uint64_t *sub_10009F104(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v6 = *a2;
  *a1 = *a2;
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for DateInterval(0);
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain(v6);
  v11(v8, v9, v10);
  v12 = a3[6];
  v13 = a3[7];
  v14 = *(void **)((char *)a2 + v12);
  *(uint64_t *)((char *)a1 + v12) = (uint64_t)v14;
  v15 = *(void **)((char *)a2 + v13);
  *(uint64_t *)((char *)a1 + v13) = (uint64_t)v15;
  v16 = v14;
  v17 = v15;
  return a1;
}

uint64_t *sub_10009F1A0(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  v8 = a3[5];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for DateInterval(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  v12 = a3[6];
  v13 = *(void **)((char *)a2 + v12);
  v14 = *(void **)((char *)a1 + v12);
  *(uint64_t *)((char *)a1 + v12) = (uint64_t)v13;
  v15 = v13;

  v16 = a3[7];
  v17 = *(void **)((char *)a2 + v16);
  v18 = *(void **)((char *)a1 + v16);
  *(uint64_t *)((char *)a1 + v16) = (uint64_t)v17;
  v19 = v17;

  return a1;
}

_QWORD *sub_10009F24C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for DateInterval(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  *(_QWORD *)((char *)a1 + v10) = *(_QWORD *)((char *)a2 + v10);
  return a1;
}

uint64_t *sub_10009F2CC(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v6 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v6);
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for DateInterval(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = *(void **)((char *)a1 + v11);
  *(uint64_t *)((char *)a1 + v11) = *(uint64_t *)((char *)a2 + v11);

  v13 = a3[7];
  v14 = *(void **)((char *)a1 + v13);
  *(uint64_t *)((char *)a1 + v13) = *(uint64_t *)((char *)a2 + v13);

  return a1;
}

uint64_t sub_10009F368(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10009F374);
}

uint64_t sub_10009F374(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for DateInterval(0);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_10009F3F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10009F3FC);
}

char *sub_10009F3FC(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for DateInterval(0);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_10009F470(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[4];

  v4[0] = (char *)&value witness table for Builtin.BridgeObject + 64;
  result = type metadata accessor for DateInterval(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[3] = (char *)&value witness table for Builtin.UnknownObject + 64;
    swift_initStructMetadata(a1, 256, 4, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_10009F4F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 64);
}

uint64_t sub_10009F500(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[1]);
  swift_release(a1[2]);
  swift_release(a1[3]);
  swift_bridgeObjectRelease(a1[4]);
  swift_release(a1[5]);
  swift_release(a1[6]);
  swift_bridgeObjectRelease(a1[7]);
  swift_release(a1[8]);
  swift_release(a1[9]);
  swift_bridgeObjectRelease(a1[11]);
  swift_release(a1[12]);
  swift_bridgeObjectRelease(a1[14]);
  swift_release(a1[15]);
  return swift_bridgeObjectRelease(a1[16]);
}

uint64_t sub_10009F588(uint64_t a1, uint64_t a2)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_QWORD *)(a2 + 32);
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v7;
  v8 = *(_QWORD *)(a2 + 48);
  v9 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 56) = v9;
  v10 = *(_QWORD *)(a2 + 64);
  v11 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = v10;
  *(_QWORD *)(a1 + 72) = v11;
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v12 = *(_QWORD *)(a2 + 88);
  v15 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = v12;
  *(_QWORD *)(a1 + 96) = v15;
  v14 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v14;
  v16 = *(_QWORD *)(a2 + 120);
  v17 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = v16;
  *(_QWORD *)(a1 + 128) = v17;
  swift_bridgeObjectRetain(v3);
  swift_retain(v4);
  swift_retain(v5);
  swift_bridgeObjectRetain(v6);
  swift_retain(v7);
  swift_retain(v8);
  swift_bridgeObjectRetain(v9);
  swift_retain(v10);
  swift_retain(v11);
  swift_bridgeObjectRetain(v12);
  swift_retain(v15);
  swift_bridgeObjectRetain(v14);
  swift_retain(v16);
  swift_bridgeObjectRetain(v17);
  return a1;
}

uint64_t sub_10009F690(uint64_t a1, uint64_t a2)
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

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v7;
  swift_retain(v7);
  swift_release(v6);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v8;
  swift_retain(v8);
  swift_release(v9);
  v10 = *(_QWORD *)(a2 + 32);
  v11 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v13;
  swift_retain(v13);
  swift_release(v12);
  v14 = *(_QWORD *)(a2 + 48);
  v15 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v14;
  swift_retain(v14);
  swift_release(v15);
  v16 = *(_QWORD *)(a2 + 56);
  v17 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v16;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRelease(v17);
  v18 = *(_QWORD *)(a1 + 64);
  v19 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v19;
  swift_retain(v19);
  swift_release(v18);
  v20 = *(_QWORD *)(a2 + 72);
  v21 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v20;
  swift_retain(v20);
  swift_release(v21);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v22 = *(_QWORD *)(a2 + 88);
  v23 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 88) = v22;
  swift_bridgeObjectRetain(v22);
  swift_bridgeObjectRelease(v23);
  v24 = *(_QWORD *)(a1 + 96);
  v25 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 96) = v25;
  swift_retain(v25);
  swift_release(v24);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  v26 = *(_QWORD *)(a2 + 112);
  v27 = *(_QWORD *)(a1 + 112);
  *(_QWORD *)(a1 + 112) = v26;
  swift_bridgeObjectRetain(v26);
  swift_bridgeObjectRelease(v27);
  v28 = *(_QWORD *)(a1 + 120);
  v29 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 120) = v29;
  swift_retain(v29);
  swift_release(v28);
  v30 = *(_QWORD *)(a2 + 128);
  v31 = *(_QWORD *)(a1 + 128);
  *(_QWORD *)(a1 + 128) = v30;
  swift_bridgeObjectRetain(v30);
  swift_bridgeObjectRelease(v31);
  return a1;
}

__n128 sub_10009F824(uint64_t a1, uint64_t a2)
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
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t sub_10009F858(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  v4 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release(v4);
  swift_release(*(_QWORD *)(a1 + 24));
  v5 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease(v5);
  swift_release(*(_QWORD *)(a1 + 40));
  v6 = *(_QWORD *)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release(v6);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 56));
  v7 = *(_QWORD *)(a1 + 64);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release(v7);
  v8 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_release(v8);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 88));
  v9 = *(_QWORD *)(a1 + 96);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_release(v9);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 112));
  v10 = *(_QWORD *)(a1 + 120);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  swift_release(v10);
  v11 = *(_QWORD *)(a1 + 128);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_bridgeObjectRelease(v11);
  return a1;
}

uint64_t sub_10009F944(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 136))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_10009F98C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 136) = 1;
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
    *(_BYTE *)(result + 136) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_10009F9EC()
{
  return sub_100013198(&qword_1000F0600, (uint64_t (*)(uint64_t))sub_10009FA18, (uint64_t)&protocol conformance descriptor for NavigationView<A>);
}

void sub_10009FA18(uint64_t a1)
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
  uint64_t OpaqueTypeConformance2;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;

  if (!qword_1000F0608)
  {
    sub_10009D274(255);
    v3 = v2;
    sub_10009D408(255);
    v5 = v4;
    sub_10009E114(255);
    v7 = v6;
    sub_10009D524(255);
    v9 = v8;
    sub_1000076D8(255, &qword_1000F03E0, (uint64_t (*)(uint64_t))sub_10009DCEC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for TupleToolbarContent);
    v11 = v10;
    sub_10009DE34(255, &qword_1000F0300, (uint64_t (*)(uint64_t))sub_10009D5E4, sub_10009DCD0, (uint64_t)&opaque type descriptor for <<opaque return type of View.navigationTitle(_:)>>);
    v13 = v12;
    sub_10009D5E4(255);
    v26 = v14;
    v27 = sub_10009DCD0();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v26, &opaque type descriptor for <<opaque return type of View.navigationTitle(_:)>>, 1);
    v26 = v13;
    v27 = OpaqueTypeConformance2;
    v16 = swift_getOpaqueTypeConformance2(&v26, &opaque type descriptor for <<opaque return type of View.navigationBarTitleDisplayMode(_:)>>, 1);
    v17 = sub_10009E0B4();
    v26 = v9;
    v27 = v11;
    v28 = v16;
    v29 = v17;
    v18 = swift_getOpaqueTypeConformance2(&v26, &opaque type descriptor for <<opaque return type of View.toolbar<A>(content:)>>, 1);
    sub_10009E198(255, &qword_1000F0450, (uint64_t (*)(uint64_t, _QWORD *))type metadata accessor for SearchableListView);
    v20 = v19;
    v21 = sub_10009E228();
    v26 = v20;
    v27 = v21;
    v22 = swift_getOpaqueTypeConformance2(&v26, &opaque type descriptor for <<opaque return type of View.interactiveDismissDisabled(_:)>>, 1);
    v26 = v5;
    v27 = v7;
    v28 = v18;
    v29 = v22;
    v23 = swift_getOpaqueTypeConformance2(&v26, &opaque type descriptor for <<opaque return type of View.sheet<A>(isPresented:onDismiss:content:)>>, 1);
    v24 = type metadata accessor for NavigationView(a1, v3, v23);
    if (!v25)
      atomic_store(v24, (unint64_t *)&qword_1000F0608);
  }
}

uint64_t sub_10009FBCC(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *(_OWORD *)(a2 + 32);
  v4[0] = *(_OWORD *)(a2 + 16);
  v4[1] = v2;
  return swift_getOpaqueTypeConformance2(v4, &unk_1000C28CC, 1);
}

void sub_10009FC00(uint64_t a1)
{
  sub_1000076D8(a1, &qword_1000F0618, (uint64_t (*)(uint64_t))sub_10009FC1C, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
}

void sub_10009FC1C(uint64_t a1)
{
  sub_1000076D8(a1, &qword_1000F0620, (uint64_t (*)(uint64_t))&type metadata accessor for EditMode, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Binding);
}

void sub_10009FC38(uint64_t a1)
{
  uint64_t v2;
  unint64_t TupleTypeMetadata2;
  uint64_t v4;

  if (!qword_1000F0630)
  {
    sub_10009DD78(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2(a1, v2, v2, 0, 0);
    if (!v4)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1000F0630);
  }
}

unint64_t sub_10009FC98()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000F0638;
  if (!qword_1000F0638)
  {
    sub_1000076D8(255, &qword_1000F0610, (uint64_t (*)(uint64_t))sub_10009FC00, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _EnvironmentKeyWritingModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000F0638);
  }
  return result;
}

unint64_t sub_10009FCF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000F0640;
  if (!qword_1000F0640)
  {
    sub_1000076D8(255, &qword_1000F0628, (uint64_t (*)(uint64_t))sub_10009FC38, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for TupleToolbarContent);
    result = swift_getWitnessTable(&protocol conformance descriptor for TupleToolbarContent<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000F0640);
  }
  return result;
}

uint64_t sub_10009FD58()
{
  return sub_10009FFF8((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1000977BC);
}

uint64_t sub_10009FD64()
{
  return sub_10009FFF8((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1000982A8);
}

uint64_t sub_10009FD70()
{
  return EnvironmentValues.editMode.getter();
}

uint64_t sub_10009FD94()
{
  return sub_10009FFF8((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100099AB0);
}

uint64_t sub_10009FDA0()
{
  return sub_10009FDD8((uint64_t)&unk_1000E2570, (uint64_t)sub_10009FFC0, (uint64_t)sub_100095360);
}

uint64_t sub_10009FDBC()
{
  return sub_10009FDD8((uint64_t)&unk_1000E2548, (uint64_t)sub_10009FE08, (uint64_t)sub_100099EC4);
}

uint64_t sub_10009FDD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;

  return sub_100099DFC(v3[6], v3[2], v3[3], v3[4], v3[5], a1, a2, a3);
}

uint64_t sub_10009FE08()
{
  uint64_t v0;
  __int128 v1;
  uint64_t v2;
  _OWORD v4[2];

  v1 = *(_OWORD *)(v0 + 32);
  v4[0] = *(_OWORD *)(v0 + 16);
  v4[1] = v1;
  v2 = type metadata accessor for SearchableListView(0, (uint64_t)v4);
  return sub_100099D44(1, v2);
}

_QWORD *sub_10009FE50(_QWORD *a1)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = a1[1];
  v3 = a1[2];
  v4 = a1[3];
  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  v8 = a1[7];
  v9 = a1[8];
  v12 = a1[9];
  v13 = a1[11];
  v14 = a1[12];
  v15 = a1[14];
  v10 = a1[16];
  swift_retain(a1[15]);
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_bridgeObjectRetain(v5);
  swift_retain(v6);
  swift_retain(v7);
  swift_bridgeObjectRetain(v8);
  swift_retain(v9);
  swift_retain(v12);
  swift_bridgeObjectRetain(v13);
  swift_retain(v14);
  swift_bridgeObjectRetain(v15);
  return a1;
}

uint64_t sub_10009FF34()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[7]);
  swift_release(v0[8]);
  swift_release(v0[9]);
  swift_bridgeObjectRelease(v0[10]);
  swift_release(v0[11]);
  swift_release(v0[12]);
  swift_bridgeObjectRelease(v0[13]);
  swift_release(v0[14]);
  swift_release(v0[15]);
  swift_bridgeObjectRelease(v0[17]);
  swift_release(v0[18]);
  swift_bridgeObjectRelease(v0[20]);
  swift_release(v0[21]);
  swift_bridgeObjectRelease(v0[22]);
  return swift_deallocObject(v0, 184, 7);
}

uint64_t sub_10009FFC0()
{
  uint64_t *v0;

  return sub_100099CC8((uint64_t)(v0 + 6), v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_10009FFD0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10009FFE0@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  uint64_t *v2;

  return sub_1000990DC(a1, v2[2], v2[3], v2[4], v2[5], a2);
}

uint64_t sub_10009FFEC()
{
  return sub_10009FFF8((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100098AB8);
}

uint64_t sub_10009FFF8(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  return a1(v1[6], v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_1000A000C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000A001C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t *v2;

  return sub_1000997A4(a1, v2[2], v2[3], v2[4], a2);
}

uint64_t sub_1000A0038(uint64_t a1)
{
  uint64_t *v1;

  return sub_10009706C(a1, v1[6], v1[2], v1[3]) & 1;
}

uint64_t sub_1000A005C@<X0>(char *a1@<X8>)
{
  uint64_t *v1;

  return sub_100099488(v1[6], v1[2], v1[3], v1[4], v1[5], a1);
}

uint64_t sub_1000A006C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000A007C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t WitnessTable;
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
  unint64_t v27;
  uint64_t OpaqueTypeMetadata2;
  uint64_t OpaqueTypeConformance2;
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
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t AssociatedConformanceWitness;
  uint64_t v50;

  v1 = a1[2];
  v2 = a1[3];
  v45 = *(_OWORD *)a1;
  v3 = *a1;
  v4 = type metadata accessor for Array(255, *a1);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(255, v2, v3, &protocol requirements base descriptor for Identifiable, &associated type descriptor for Identifiable.ID);
  v6 = type metadata accessor for TagValueTraitKey(255, v3, v1);
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for TagValueTraitKey<A>, v6);
  v8 = type metadata accessor for _TraitWritingModifier(255, v6, WitnessTable);
  v43 = type metadata accessor for ModifiedContent(255, &type metadata for Text);
  v9 = type metadata accessor for Optional(255, v3);
  v50 = v1;
  v44 = v1;
  v10 = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v9);
  v11 = type metadata accessor for TagValueTraitKey(255, v9, v10);
  v12 = swift_getWitnessTable(&protocol conformance descriptor for TagValueTraitKey<A>, v11);
  v13 = type metadata accessor for _TraitWritingModifier(255, v11, v12);
  v42 = type metadata accessor for ModifiedContent(255, v43);
  *(_QWORD *)&v46 = v4;
  *((_QWORD *)&v46 + 1) = AssociatedTypeWitness;
  v47 = v42;
  v48 = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness(v2, v3, AssociatedTypeWitness, &protocol requirements base descriptor for Identifiable, &associated conformance descriptor for Identifiable.Identifiable.ID: Hashable);
  v14 = type metadata accessor for ForEach(255, &v46);
  v15 = type metadata accessor for Section(255, &type metadata for EmptyView, v14, &type metadata for EmptyView);
  v46 = v45;
  v47 = v1;
  v48 = v2;
  v16 = type metadata accessor for SearchableListSection(255, (uint64_t)&v46);
  v17 = type metadata accessor for Array(255, v16);
  v18 = type metadata accessor for UUID(255);
  v19 = type metadata accessor for Section(255, &type metadata for Text, v14, &type metadata for EmptyView);
  v20 = swift_getWitnessTable(&protocol conformance descriptor for [A], v17);
  v21 = sub_100013198(&qword_1000F02D8, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  *(_QWORD *)&v46 = v17;
  *((_QWORD *)&v46 + 1) = v18;
  v47 = v19;
  v48 = v20;
  AssociatedConformanceWitness = v21;
  v22 = type metadata accessor for ForEach(255, &v46);
  v23 = type metadata accessor for _ConditionalContent(255, v15, v22);
  swift_getWitnessTable(&protocol conformance descriptor for _TraitWritingModifier<A>, v8);
  swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v43);
  swift_getWitnessTable(&protocol conformance descriptor for _TraitWritingModifier<A>, v13);
  swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v42);
  swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v14);
  swift_getWitnessTable(&protocol conformance descriptor for <> Section<A, B, C>, v15);
  swift_getWitnessTable(&protocol conformance descriptor for <> Section<A, B, C>, v19);
  swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v22);
  v24 = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v23);
  *(_QWORD *)&v46 = v45;
  *((_QWORD *)&v46 + 1) = v23;
  v47 = v44;
  v48 = v24;
  v25 = type metadata accessor for List(255, &v46);
  v26 = swift_getWitnessTable(&protocol conformance descriptor for List<A, B>, v25);
  v27 = sub_10002D0D0();
  *(_QWORD *)&v46 = v25;
  *((_QWORD *)&v46 + 1) = &type metadata for String;
  v47 = v26;
  v48 = v27;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2(255, &v46, &opaque type descriptor for <<opaque return type of View.navigationTitle<A>(_:)>>, 0);
  *(_QWORD *)&v46 = v25;
  *((_QWORD *)&v46 + 1) = &type metadata for String;
  v47 = v26;
  v48 = v27;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v46, &opaque type descriptor for <<opaque return type of View.navigationTitle<A>(_:)>>, 1);
  *(_QWORD *)&v46 = OpaqueTypeMetadata2;
  *((_QWORD *)&v46 + 1) = OpaqueTypeConformance2;
  v30 = swift_getOpaqueTypeMetadata2(255, &v46, &opaque type descriptor for <<opaque return type of View.navigationBarTitleDisplayMode(_:)>>, 0);
  sub_1000076D8(255, &qword_1000F0610, (uint64_t (*)(uint64_t))sub_10009FC00, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _EnvironmentKeyWritingModifier);
  v31 = type metadata accessor for ModifiedContent(255, v30);
  sub_1000076D8(255, &qword_1000F0628, (uint64_t (*)(uint64_t))sub_10009FC38, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for TupleToolbarContent);
  v33 = v32;
  *(_QWORD *)&v46 = OpaqueTypeMetadata2;
  *((_QWORD *)&v46 + 1) = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2(&v46, &opaque type descriptor for <<opaque return type of View.navigationBarTitleDisplayMode(_:)>>, 1);
  sub_10009FC98();
  v34 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v31);
  v35 = sub_10009FCF8();
  *(_QWORD *)&v46 = v31;
  *((_QWORD *)&v46 + 1) = v33;
  v47 = v34;
  v48 = v35;
  v36 = swift_getOpaqueTypeMetadata2(255, &v46, &opaque type descriptor for <<opaque return type of View.toolbar<A>(content:)>>, 0);
  *(_QWORD *)&v46 = v31;
  *((_QWORD *)&v46 + 1) = v33;
  v47 = v34;
  v48 = v35;
  v37 = swift_getOpaqueTypeConformance2(&v46, &opaque type descriptor for <<opaque return type of View.toolbar<A>(content:)>>, 1);
  *(_QWORD *)&v46 = v36;
  *((_QWORD *)&v46 + 1) = v37;
  v38 = swift_getOpaqueTypeMetadata2(255, &v46, &opaque type descriptor for <<opaque return type of View.searchable(text:placement:prompt:)>>, 0);
  *(_QWORD *)&v46 = v36;
  *((_QWORD *)&v46 + 1) = v37;
  v39 = swift_getOpaqueTypeConformance2(&v46, &opaque type descriptor for <<opaque return type of View.searchable(text:placement:prompt:)>>, 1);
  v40 = type metadata accessor for NavigationView(255, v38, v39);
  return swift_getWitnessTable(&protocol conformance descriptor for NavigationView<A>, v40);
}

unint64_t sub_1000A05D4()
{
  unint64_t result;

  result = qword_1000F0650;
  if (!qword_1000F0650)
  {
    result = swift_getWitnessTable(&unk_1000B6718, &type metadata for OpenRecordsIntent);
    atomic_store(result, (unint64_t *)&qword_1000F0650);
  }
  return result;
}

unint64_t sub_1000A061C()
{
  unint64_t result;

  result = qword_1000F0658;
  if (!qword_1000F0658)
  {
    result = swift_getWitnessTable(&unk_1000B69F8, &type metadata for RecordTypeEntity);
    atomic_store(result, (unint64_t *)&qword_1000F0658);
  }
  return result;
}

uint64_t sub_1000A0660()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  Swift::String v8;
  uint64_t KeyPath;
  uint64_t v10;
  Swift::String v11;
  uint64_t v13;

  sub_10001B790(0, &qword_1000F07D8, (uint64_t (*)(void))sub_10001AFD8, (uint64_t)&type metadata for OpenRecordsIntent, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for ParameterSummaryString);
  __chkstk_darwin(v0);
  v2 = (char *)&v13 - v1;
  sub_10001B790(0, &qword_1000F07E0, (uint64_t (*)(void))sub_10001AFD8, (uint64_t)&type metadata for OpenRecordsIntent, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for ParameterSummaryString.StringInterpolation);
  v4 = v3;
  __chkstk_darwin(v3);
  v6 = (char *)&v13 - v5;
  v7 = sub_10001AFD8();
  ParameterSummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)(5, 1, &type metadata for OpenRecordsIntent, v7);
  v8._countAndFlagsBits = 0x206E65704FLL;
  v8._object = (void *)0xE500000000000000;
  ParameterSummaryString.StringInterpolation.appendLiteral(_:)(v8);
  KeyPath = swift_getKeyPath(&unk_1000B6D18);
  sub_1000A4ABC(0);
  ParameterSummaryString.StringInterpolation.appendInterpolation<A, B>(_:)(KeyPath, v4, v10);
  swift_release(KeyPath);
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  ParameterSummaryString.StringInterpolation.appendLiteral(_:)(v11);
  ParameterSummaryString.init(stringInterpolation:)(v6, &type metadata for OpenRecordsIntent, v7);
  return IntentParameterSummary.init(_:table:)(v2, 0, 0, &type metadata for OpenRecordsIntent, v7);
}

uint64_t sub_1000A07E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[16];

  v0 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v13[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for Locale(0);
  __chkstk_darwin(v4);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v7);
  v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for LocalizedStringResource(0);
  sub_10001C884(v10, qword_1000F12B0);
  sub_10001C86C(v10, (uint64_t)qword_1000F12B0);
  v11 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000013, 0x80000001000BF1B0);
  static Locale.current.getter(v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)(v9, 0x6E65746E49707041, 0xEA00000000007374, v6, v3, 0, 0, 256);
}

uint64_t sub_1000A0964()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[2];

  sub_1000076D8(0, &qword_1000EC948, (uint64_t (*)(uint64_t))&type metadata accessor for LocalizedStringResource, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v0);
  v2 = (char *)v22 - v1;
  v22[0] = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v22[0] - 8);
  __chkstk_darwin(v22[0]);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Locale(0);
  __chkstk_darwin(v6);
  v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v9);
  v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000076D8(0, &qword_1000EC940, (uint64_t (*)(uint64_t))&type metadata accessor for IntentDescription, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  v17 = v16;
  sub_10001C884(v16, qword_1000F12C8);
  v18 = sub_10001C86C(v17, (uint64_t)qword_1000F12C8);
  v19 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000054, 0x80000001000BF150);
  static Locale.current.getter(v19);
  (*(void (**)(char *, _QWORD, _QWORD))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v22[0]);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v11, 0x6E65746E49707041, 0xEA00000000007374, v8, v5, 0, 0, 256);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v2, 1, 1, v12);
  IntentDescription.init(_:categoryName:searchKeywords:)(v15, v2, _swiftEmptyArrayStorage);
  v20 = type metadata accessor for IntentDescription(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v18, 0, 1, v20);
}

uint64_t sub_1000A0BDC(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;

  v4 = sub_1000A4A0C();
  v5 = sub_1000A47B0();
  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_1000A0C34()
{
  unint64_t result;

  result = qword_1000F0660;
  if (!qword_1000F0660)
  {
    result = swift_getWitnessTable(&unk_1000B67D0, &type metadata for OpenRecordsIntent);
    atomic_store(result, (unint64_t *)&qword_1000F0660);
  }
  return result;
}

unint64_t sub_1000A0C7C()
{
  unint64_t result;

  result = qword_1000F0668;
  if (!qword_1000F0668)
  {
    result = swift_getWitnessTable(&unk_1000B67F8, &type metadata for OpenRecordsIntent);
    atomic_store(result, (unint64_t *)&qword_1000F0668);
  }
  return result;
}

uint64_t sub_1000A0CC0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000C2988, 1);
}

uint64_t sub_1000A0CD0@<X0>(uint64_t a1@<X8>)
{
  return sub_100052180(&qword_1000EC168, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_1000F12B0, (uint64_t)sub_1000A07E4, a1);
}

uint64_t sub_1000A0CF4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000A4A0C();
  return static OpenIntent.openAppWhenRun.getter(a1, v2);
}

uint64_t sub_1000A0D20@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1000EC170 != -1)
    swift_once(&qword_1000EC170, sub_1000A0964);
  sub_1000076D8(0, &qword_1000EC940, (uint64_t (*)(uint64_t))&type metadata accessor for IntentDescription, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  v3 = sub_10001C86C(v2, (uint64_t)qword_1000F12C8);
  return sub_10005566C(v3, a1);
}

uint64_t sub_1000A0D94(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v4 = (_QWORD *)swift_task_alloc(async function pointer to URLRepresentableIntent<>.perform()[1]);
  *(_QWORD *)(v2 + 16) = v4;
  v5 = sub_1000A4A0C();
  v6 = sub_1000A4A50();
  v7 = sub_1000A47B0();
  *v4 = v2;
  v4[1] = sub_10005AECC;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_1000A0E18@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1000A38EC();
  *a1 = result;
  return result;
}

uint64_t sub_1000A0E3C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001AFD8();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_1000A0E68()
{
  unint64_t result;

  result = qword_1000F0678;
  if (!qword_1000F0678)
  {
    result = swift_getWitnessTable(&unk_1000B6844, &type metadata for RecordTypeEntity.AvailableHealthSettingsQuery);
    atomic_store(result, (unint64_t *)&qword_1000F0678);
  }
  return result;
}

uint64_t sub_1000A0EAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[2];

  v0 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v0);
  v20[0] = (char *)v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000076D8(0, &qword_1000EC948, (uint64_t (*)(uint64_t))&type metadata accessor for LocalizedStringResource, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v2);
  v4 = (char *)v20 - v3;
  v5 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Locale(0);
  __chkstk_darwin(v9);
  v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_10001C884(v16, qword_1000F12E0);
  sub_10001C86C(v16, (uint64_t)qword_1000F12E0);
  v17 = v20[0];
  v18 = String.LocalizationValue.init(stringLiteral:)(0x522068746C616548, 0xEE007364726F6365);
  static Locale.current.getter(v18);
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v17, 0x6E65746E49707041, 0xEA00000000007374, v11, v8, 0, 0, 256);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v4, 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v4);
}

void sub_1000A10EC(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[28];
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;

  v67 = a1;
  v71 = a2;
  v2 = type metadata accessor for String.LocalizationValue(0);
  v3 = __chkstk_darwin(v2);
  v66[25] = (char *)v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __chkstk_darwin(v3);
  v66[24] = (char *)v66 - v6;
  v7 = __chkstk_darwin(v5);
  v66[23] = (char *)v66 - v8;
  v9 = __chkstk_darwin(v7);
  v66[22] = (char *)v66 - v10;
  v11 = __chkstk_darwin(v9);
  v66[21] = (char *)v66 - v12;
  v13 = __chkstk_darwin(v11);
  v66[20] = (char *)v66 - v14;
  v15 = __chkstk_darwin(v13);
  v66[19] = (char *)v66 - v16;
  v17 = __chkstk_darwin(v15);
  v66[18] = (char *)v66 - v18;
  v19 = __chkstk_darwin(v17);
  v66[16] = (char *)v66 - v20;
  __chkstk_darwin(v19);
  v66[14] = (char *)v66 - v21;
  v22 = type metadata accessor for LocalizedStringResource(0);
  v69 = *(_QWORD *)(v22 - 8);
  v70 = v22;
  v23 = __chkstk_darwin(v22);
  v66[17] = (char *)v66 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __chkstk_darwin(v23);
  v66[15] = (char *)v66 - v26;
  v27 = __chkstk_darwin(v25);
  v66[13] = (char *)v66 - v28;
  v29 = __chkstk_darwin(v27);
  v66[12] = (char *)v66 - v30;
  v31 = __chkstk_darwin(v29);
  v66[11] = (char *)v66 - v32;
  v33 = __chkstk_darwin(v31);
  v66[10] = (char *)v66 - v34;
  v35 = __chkstk_darwin(v33);
  v66[9] = (char *)v66 - v36;
  v37 = __chkstk_darwin(v35);
  v66[8] = (char *)v66 - v38;
  v39 = __chkstk_darwin(v37);
  v66[7] = (char *)v66 - v40;
  __chkstk_darwin(v39);
  v66[6] = (char *)v66 - v41;
  sub_1000076D8(0, &qword_1000EE4F0, (uint64_t (*)(uint64_t))&type metadata accessor for DisplayRepresentation.Image, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  v43 = __chkstk_darwin(v42);
  v66[5] = (char *)v66 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __chkstk_darwin(v43);
  v66[4] = (char *)v66 - v46;
  v47 = __chkstk_darwin(v45);
  v66[3] = (char *)v66 - v48;
  v49 = __chkstk_darwin(v47);
  v66[2] = (char *)v66 - v50;
  v51 = __chkstk_darwin(v49);
  v66[27] = (char *)v66 - v52;
  v53 = __chkstk_darwin(v51);
  v66[1] = (char *)v66 - v54;
  __chkstk_darwin(v53);
  sub_1000076D8(0, &qword_1000EC948, (uint64_t (*)(uint64_t))&type metadata accessor for LocalizedStringResource, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  v56 = __chkstk_darwin(v55);
  v57 = __chkstk_darwin(v56);
  v58 = __chkstk_darwin(v57);
  v59 = __chkstk_darwin(v58);
  v60 = __chkstk_darwin(v59);
  v66[26] = (char *)v66 - v61;
  v62 = __chkstk_darwin(v60);
  __chkstk_darwin(v62);
  v63 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  __chkstk_darwin(v63);
  v68 = (char *)v66 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = type metadata accessor for Locale(0);
  __chkstk_darwin(v65);
  __asm { BR              X10 }
}

uint64_t sub_1000A1694()
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

  v4 = *(_QWORD *)(v3 - 168);
  v5 = String.LocalizationValue.init(stringLiteral:)(0x6F636552206C6C41, 0xEB00000000736472);
  static Locale.current.getter(v5);
  v6 = *(_QWORD *)(v3 - 136);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  v7 = *(_QWORD *)(v3 - 232);
  ((void (*)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t))LocalizedStringResource.init(_:table:locale:bundle:comment:))(v4, 0x6E65746E49707041, 0xEA00000000007374, v1, v6, 0, 0, 256);
  v8 = *(_QWORD *)(v3 - 160);
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v3 - 128) + 56))(v8, 1, 1, *(_QWORD *)(v3 - 120));
  v9 = *(_QWORD *)(v3 - 152);
  ((void (*)(unint64_t, unint64_t, _QWORD, _QWORD))DisplayRepresentation.Image.init(systemName:tintColor:symbolConfiguration:))(0xD000000000000012, 0x80000001000BF050, 0, 0);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD *))DisplayRepresentation.init(title:subtitle:image:synonyms:))(v7, v8, v9, _swiftEmptyArrayStorage);
}

uint64_t sub_1000A1FB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  Swift::String v12;
  Swift::String v13;
  uint64_t v15;

  sub_10001B790(0, &qword_1000F0770, (uint64_t (*)(void))sub_1000A2B04, (uint64_t)&type metadata for RecordTypeEntity, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for EntityURLRepresentation.StringInterpolation.Token);
  v1 = v0;
  v2 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v4 = (char *)&v15 - v3;
  sub_10001B790(0, &qword_1000F0778, (uint64_t (*)(void))sub_1000A2B04, (uint64_t)&type metadata for RecordTypeEntity, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for EntityURLRepresentation.StringInterpolation);
  v6 = v5;
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - v7;
  sub_10001B790(0, &qword_1000F0768, (uint64_t (*)(void))sub_1000A2B04, (uint64_t)&type metadata for RecordTypeEntity, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for EntityURLRepresentation);
  v10 = v9;
  sub_10001C884(v9, qword_1000F12F8);
  sub_10001C86C(v10, (uint64_t)qword_1000F12F8);
  v11 = sub_1000A2B04();
  EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)(17, 1, &type metadata for RecordTypeEntity, v11);
  v12._object = (void *)0x80000001000BF0D0;
  v12._countAndFlagsBits = 0xD000000000000011;
  EntityURLRepresentation.StringInterpolation.appendLiteral(_:)(v12);
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, enum case for EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v1);
  EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)(v4, v6);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  EntityURLRepresentation.StringInterpolation.appendLiteral(_:)(v13);
  return EntityURLRepresentation.init(stringInterpolation:)(v8, &type metadata for RecordTypeEntity, v11);
}

uint64_t sub_1000A216C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
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
  uint64_t v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];

  v26 = a3;
  v5 = type metadata accessor for Locale(0);
  __chkstk_darwin(v5);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DisplayRepresentation(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = __chkstk_darwin(v12);
  v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v18 = (char *)&v25 - v17;
  sub_1000A10EC(a1, (uint64_t)v11);
  DisplayRepresentation.title.getter();
  v19 = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  static Locale.current.getter(v19);
  LocalizedStringResource.locale.setter(v7);
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
  v20 = String.init(localized:)(v16);
  v22 = v21;
  v27[2] = v20;
  v27[3] = v21;
  v27[0] = a2;
  v27[1] = v26;
  v23 = sub_10002D0D0();
  LOBYTE(v9) = StringProtocol.localizedStandardContains<A>(_:)(v27, &type metadata for String, &type metadata for String, v23, v23);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
  swift_bridgeObjectRelease(v22);
  return v9 & 1;
}

uint64_t sub_1000A2324(uint64_t a1, char a2, char a3)
{
  _BYTE *v3;

  v3 = *(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40);
  *v3 = a2;
  v3[1] = a3;
  return swift_continuation_resume();
}

uint64_t sub_1000A233C(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v2 + 136) = a2;
  *(_QWORD *)(v2 + 32) = a1;
  v3 = type metadata accessor for BrowseCategory(0);
  *(_QWORD *)(v2 + 40) = v3;
  v4 = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 48) = v4;
  *(_QWORD *)(v2 + 56) = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_1000A23CC, 0, 0);
}

uint64_t sub_1000A23CC()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  void (*v13)(uint64_t);
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  id v18;
  void *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  _BOOL8 v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if (*(_BYTE *)(v0 + 136) == 9)
  {
    v1 = *(_QWORD *)(v0 + 48);
    v2 = objc_msgSend(*(id *)(v0 + 32), "healthStore");
    v3 = type metadata accessor for CategoryCountDataProvider(0);
    swift_allocObject(v3, *(unsigned int *)(v3 + 48), *(unsigned __int16 *)(v3 + 52));
    v4 = CategoryCountDataProvider.init(healthStore:)(v2);
    *(_QWORD *)(v0 + 64) = v4;
    sub_1000076D8(0, &qword_1000F0798, (uint64_t (*)(uint64_t))&type metadata accessor for BrowseCategory, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    v5 = *(unsigned __int8 *)(v1 + 80);
    v6 = (v5 + 32) & ~v5;
    v8 = swift_allocObject(v7, v6 + *(_QWORD *)(v1 + 72), v5 | 7);
    *(_QWORD *)(v0 + 72) = v8;
    *(_OWORD *)(v8 + 16) = xmmword_1000B11F0;
    v9 = v8 + v6;
    v10 = enum case for DisplayCategory.Kind.unknown(_:);
    *(_DWORD *)(v0 + 128) = enum case for DisplayCategory.Kind.unknown(_:);
    v11 = type metadata accessor for DisplayCategory.Kind(0);
    *(_QWORD *)(v0 + 80) = v11;
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 104);
    *(_QWORD *)(v0 + 88) = v12;
    v12(v9, v10, v11);
    *(_DWORD *)(v0 + 132) = enum case for BrowseCategory.subcategory(_:);
    v13 = *(void (**)(uint64_t))(v1 + 104);
    *(_QWORD *)(v0 + 96) = v13;
    v13(v9);
    v14 = (_QWORD *)swift_task_alloc(48);
    *(_QWORD *)(v0 + 104) = v14;
    v14[2] = v4;
    v14[3] = v8;
    v14[4] = 0;
    v15 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedThrowingContinuation<A>(isolation:function:_:)[1]);
    *(_QWORD *)(v0 + 112) = v15;
    sub_1000A483C(0);
    *v15 = v0;
    v15[1] = sub_1000A26C8;
    return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 24, 0, 0, 0xD000000000000025, 0x80000001000BF0F0, sub_1000A4830, v14, v16);
  }
  else
  {
    *(_QWORD *)(v0 + 16) = 0;
    v18 = objc_msgSend(*(id *)(v0 + 32), "allAccountsWithError:", v0 + 16);
    v19 = *(void **)(v0 + 16);
    if (v18)
    {
      v20 = v18;
      v21 = sub_1000A47F4();
      v22 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v20, v21);
      v23 = v19;

      if ((unint64_t)v22 >> 62)
      {
        if (v22 < 0)
          v29 = v22;
        else
          v29 = v22 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v22);
        v24 = _CocoaArrayWrapper.endIndex.getter(v29);
        swift_bridgeObjectRelease(v22);
      }
      else
      {
        v24 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease(v22);
      v25 = v24 != 0;
    }
    else
    {
      v26 = v19;
      v27 = _convertNSErrorToError(_:)(v19);

      swift_willThrow(v28);
      swift_errorRelease(v27);
      v25 = 0;
    }
    swift_task_dealloc(*(_QWORD *)(v0 + 56));
    return (*(uint64_t (**)(_BOOL8))(v0 + 8))(v25);
  }
}

uint64_t sub_1000A26C8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 112);
  *(_QWORD *)(*v1 + 120) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = sub_1000A28D8;
  }
  else
  {
    swift_task_dealloc(*(_QWORD *)(v2 + 104));
    v4 = sub_1000A2780;
  }
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_1000A2780()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  void (*v2)(uint64_t, uint64_t, uint64_t, __n128);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v2 = *(void (**)(uint64_t, uint64_t, uint64_t, __n128))(v0 + 88);
  v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 96);
  v4 = *(unsigned int *)(v0 + 128);
  v3 = *(unsigned int *)(v0 + 132);
  v5 = *(_QWORD *)(v0 + 80);
  v6 = *(_QWORD *)(v0 + 56);
  v7 = *(_QWORD *)(v0 + 40);
  v8 = swift_bridgeObjectRelease(*(_QWORD *)(v0 + 72));
  v9 = *(_QWORD *)(v0 + 24);
  v2(v6, v4, v5, v8);
  v1(v6, v3, v7);
  if (!*(_QWORD *)(v9 + 16))
  {
    v19 = *(_QWORD *)(v0 + 56);
    v18 = *(_QWORD *)(v0 + 64);
    v20 = *(_QWORD *)(v0 + 40);
    v21 = *(_QWORD *)(v0 + 48);
    swift_bridgeObjectRelease(v9);
    swift_release(v18);
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v19, v20);
LABEL_6:
    v17 = 0;
    goto LABEL_7;
  }
  v10 = sub_10007E16C(*(_QWORD *)(v0 + 56));
  v11 = *(_QWORD *)(v0 + 56);
  v12 = *(_QWORD *)(v0 + 64);
  v13 = *(_QWORD *)(v0 + 40);
  v14 = *(_QWORD *)(v0 + 48);
  if ((v15 & 1) == 0)
  {
    swift_bridgeObjectRelease(v9);
    swift_release(v12);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  v16 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v10);
  swift_bridgeObjectRelease(v9);
  swift_release(v12);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v11, v13);
  v17 = v16 > 0;
LABEL_7:
  swift_task_dealloc(*(_QWORD *)(v0 + 56));
  return (*(uint64_t (**)(_BOOL8))(v0 + 8))(v17);
}

uint64_t sub_1000A28D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 72));
  swift_errorRelease(v1);
  swift_task_dealloc(v2);
  swift_release(v3);
  swift_task_dealloc(*(_QWORD *)(v0 + 56));
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_1000A2968(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch(sub_1000A2984, 0, 0);
}

uint64_t sub_1000A2984()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[3];
  v1 = v0[4];
  v3 = swift_task_alloc(32);
  v0[5] = v3;
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  v4 = (_QWORD *)swift_task_alloc(dword_1000F07BC);
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_1000A2A08;
  v4[15] = sub_1000A4A04;
  v4[16] = v3;
  return swift_task_switch(sub_1000A406C, 0, 0);
}

uint64_t sub_1000A2A08(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;

  v3 = *(_QWORD *)(*v1 + 40);
  v4 = *(_QWORD **)(*v1 + 16);
  v6 = *v1;
  swift_task_dealloc(*(_QWORD *)(*v1 + 48));
  swift_task_dealloc(v3);
  *v4 = a1;
  return (*(uint64_t (**)(void))(v6 + 8))();
}

unint64_t sub_1000A2A74()
{
  unint64_t result;

  result = qword_1000F0688;
  if (!qword_1000F0688)
  {
    result = swift_getWitnessTable(&unk_1000B689C, &type metadata for RecordTypeEntity.AvailableHealthSettingsQuery);
    atomic_store(result, (unint64_t *)&qword_1000F0688);
  }
  return result;
}

unint64_t sub_1000A2ABC()
{
  unint64_t result;

  result = qword_1000F0690;
  if (!qword_1000F0690)
  {
    result = swift_getWitnessTable(&unk_1000B68FC, &type metadata for RecordTypeEntity.AvailableHealthSettingsQuery);
    atomic_store(result, (unint64_t *)&qword_1000F0690);
  }
  return result;
}

unint64_t sub_1000A2B04()
{
  unint64_t result;

  result = qword_1000F0698[0];
  if (!qword_1000F0698[0])
  {
    result = swift_getWitnessTable(&unk_1000B6978, &type metadata for RecordTypeEntity);
    atomic_store(result, qword_1000F0698);
  }
  return result;
}

uint64_t sub_1000A2B48()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  v3 = (uint64_t (__cdecl *)())((char *)&dword_1000F07B0 + dword_1000F07B0);
  v1 = (_QWORD *)swift_task_alloc(unk_1000F07B4);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_100056C3C;
  return v3();
}

uint64_t sub_1000A2BA0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_1000F0780 + dword_1000F0780);
  v2 = (_QWORD *)swift_task_alloc(unk_1000F0784);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_100056AA8;
  return v4();
}

unint64_t sub_1000A2C00()
{
  unint64_t result;

  result = qword_1000F06B0;
  if (!qword_1000F06B0)
  {
    result = swift_getWitnessTable(&unk_1000B6924, &type metadata for RecordTypeEntity.AvailableHealthSettingsQuery);
    atomic_store(result, (unint64_t *)&qword_1000F06B0);
  }
  return result;
}

unint64_t sub_1000A2C4C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_1000F06B8;
  if (!qword_1000F06B8)
  {
    sub_1000A34DC(255, qword_1000F06C0, (uint64_t)&type metadata for RecordTypeEntity);
    v2 = v1;
    sub_10001B0A4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v2);
    atomic_store(result, (unint64_t *)&qword_1000F06B8);
  }
  return result;
}

uint64_t sub_1000A2CBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_1000A0E68();
  *v5 = v2;
  v5[1] = sub_10001C2DC;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_1000A2D2C()
{
  unint64_t result;

  result = qword_1000F06D8;
  if (!qword_1000F06D8)
  {
    result = swift_getWitnessTable(&unk_1000B69D0, &type metadata for RecordTypeEntity);
    atomic_store(result, (unint64_t *)&qword_1000F06D8);
  }
  return result;
}

uint64_t sub_1000A2D70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_1000EC180 != -1)
    swift_once(&qword_1000EC180, sub_1000A1FB0);
  sub_10001B790(0, &qword_1000F0768, (uint64_t (*)(void))sub_1000A2B04, (uint64_t)&type metadata for RecordTypeEntity, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for EntityURLRepresentation);
  v3 = v2;
  v4 = sub_10001C86C(v2, (uint64_t)qword_1000F12F8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v4, v3);
}

unint64_t sub_1000A2E04()
{
  unint64_t result;

  result = qword_1000F06E0;
  if (!qword_1000F06E0)
  {
    result = swift_getWitnessTable(&unk_1000B6A30, &type metadata for RecordTypeEntity);
    atomic_store(result, (unint64_t *)&qword_1000F06E0);
  }
  return result;
}

unint64_t sub_1000A2E4C()
{
  unint64_t result;

  result = qword_1000F06E8;
  if (!qword_1000F06E8)
  {
    result = swift_getWitnessTable(&unk_1000B6A60, &type metadata for RecordTypeEntity);
    atomic_store(result, (unint64_t *)&qword_1000F06E8);
  }
  return result;
}

unint64_t sub_1000A2E94()
{
  unint64_t result;

  result = qword_1000F06F0;
  if (!qword_1000F06F0)
  {
    result = swift_getWitnessTable(&unk_1000B6C70, &type metadata for RecordType);
    atomic_store(result, (unint64_t *)&qword_1000F06F0);
  }
  return result;
}

uint64_t sub_1000A2ED8(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_1000A47B0();
  v4 = URLRepresentableEntity.urlRepresentationParameter.getter(a1, v3);
  return sub_10005B478(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8), v1, v4, v5);
}

unint64_t sub_1000A2F24()
{
  unint64_t result;

  result = qword_1000F0700;
  if (!qword_1000F0700)
  {
    result = swift_getWitnessTable(&unk_1000B6A98, &type metadata for RecordTypeEntity);
    atomic_store(result, (unint64_t *)&qword_1000F0700);
  }
  return result;
}

unint64_t sub_1000A2F6C()
{
  unint64_t result;

  result = qword_1000F0708;
  if (!qword_1000F0708)
  {
    result = swift_getWitnessTable(&unk_1000B6AC0, &type metadata for RecordTypeEntity);
    atomic_store(result, (unint64_t *)&qword_1000F0708);
  }
  return result;
}

unint64_t sub_1000A2FB4()
{
  unint64_t result;

  result = qword_1000F0710;
  if (!qword_1000F0710)
  {
    result = swift_getWitnessTable(&unk_1000B6B40, &type metadata for RecordTypeEntity);
    atomic_store(result, (unint64_t *)&qword_1000F0710);
  }
  return result;
}

unint64_t sub_1000A2FFC()
{
  unint64_t result;

  result = qword_1000F0718;
  if (!qword_1000F0718)
  {
    result = swift_getWitnessTable(&unk_1000B6BC0, &type metadata for RecordType);
    atomic_store(result, (unint64_t *)&qword_1000F0718);
  }
  return result;
}

void sub_1000A3040(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t sub_1000A304C@<X0>(uint64_t a1@<X8>)
{
  return sub_100052180(&qword_1000EC178, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_1000F12E0, (uint64_t)sub_1000A0EAC, a1);
}

unint64_t sub_1000A3074()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000F0720;
  if (!qword_1000F0720)
  {
    sub_10001B790(255, &qword_1000F0728, (uint64_t (*)(void))sub_10001B0A4, (uint64_t)&type metadata for RecordTypeEntity, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for EmptyResolverSpecification);
    result = swift_getWitnessTable(&protocol conformance descriptor for EmptyResolverSpecification<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000F0720);
  }
  return result;
}

uint64_t sub_1000A30DC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000A2B04();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000A3118()
{
  unint64_t result;

  result = qword_1000F0730;
  if (!qword_1000F0730)
  {
    result = swift_getWitnessTable(&unk_1000B6B70, &type metadata for RecordTypeEntity);
    atomic_store(result, (unint64_t *)&qword_1000F0730);
  }
  return result;
}

void sub_1000A315C(uint64_t a1@<X8>)
{
  unsigned __int8 *v1;

  sub_1000A10EC(*v1, a1);
}

uint64_t sub_1000A3164(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000A2FB4();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_1000A319C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1000A31D8 + 4 * byte_1000B6684[a1]))(0xD000000000000011, 0x80000001000B7E50);
}

unint64_t sub_1000A31D8()
{
  return 0xD00000000000001FLL;
}

uint64_t sub_1000A3260(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = sub_1000A319C(*a1);
  v5 = v4;
  v6 = sub_1000A319C(v2);
  if (v3 == v6 && v5 == v7)
  {
    v10 = 1;
    v9 = v5;
  }
  else
  {
    v9 = v7;
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
  }
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

unint64_t sub_1000A32EC()
{
  unint64_t result;

  result = qword_1000F0738;
  if (!qword_1000F0738)
  {
    result = swift_getWitnessTable(&unk_1000B6B98, &type metadata for RecordType);
    atomic_store(result, (unint64_t *)&qword_1000F0738);
  }
  return result;
}

Swift::Int sub_1000A3330()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  v1 = *v0;
  Hasher.init(_seed:)(v6, 0);
  v2 = sub_1000A319C(v1);
  v4 = v3;
  String.hash(into:)(v6, v2, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

double sub_1000A3390(uint64_t a1)
{
  unsigned __int8 *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double result;

  v3 = sub_1000A319C(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  *(_QWORD *)&result = swift_bridgeObjectRelease(v5).n128_u64[0];
  return result;
}

Swift::Int sub_1000A33D0(uint64_t a1)
{
  unsigned __int8 *v1;
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  v2 = *v1;
  Hasher.init(_seed:)(v7, a1);
  v3 = sub_1000A319C(v2);
  v5 = v4;
  String.hash(into:)(v7, v3, v4);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

unint64_t sub_1000A342C@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_1000A4768(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1000A3458@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_1000A319C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_1000A3484()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000F0740;
  if (!qword_1000F0740)
  {
    sub_1000A34DC(255, &qword_1000F0748, (uint64_t)&type metadata for RecordType);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000F0740);
  }
  return result;
}

void sub_1000A34DC(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    v4 = type metadata accessor for Array(0, a3);
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_1000A3520(_QWORD *a1@<X8>)
{
  *a1 = &off_1000DC748;
}

uint64_t sub_1000A3530()
{
  unsigned __int8 *v0;

  return sub_1000A319C(*v0);
}

unint64_t sub_1000A3538@<X0>(uint64_t a1@<X0>, void *a2@<X1>, _BYTE *a3@<X8>)
{
  unint64_t result;
  Swift::String v7;

  swift_bridgeObjectRetain(a2);
  v7._countAndFlagsBits = a1;
  v7._object = a2;
  result = sub_1000A4768(v7);
  *a3 = result;
  return result;
}

ValueMetadata *type metadata accessor for RecordType()
{
  return &type metadata for RecordType;
}

ValueMetadata *type metadata accessor for RecordTypeEntity.AvailableHealthSettingsQuery()
{
  return &type metadata for RecordTypeEntity.AvailableHealthSettingsQuery;
}

uint64_t _s6Health10RecordTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF7)
    goto LABEL_17;
  if (a2 + 9 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 9) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 9;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 9;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 9;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xA;
  v8 = v6 - 10;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s6Health10RecordTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 9 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 9) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF6)
    return ((uint64_t (*)(void))((char *)&loc_1000A3680 + 4 * byte_1000B6693[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_1000A36B4 + 4 * byte_1000B668E[v4]))();
}

uint64_t sub_1000A36B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000A36BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1000A36C4);
  return result;
}

uint64_t sub_1000A36D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1000A36D8);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_1000A36DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000A36E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RecordTypeEntity()
{
  return &type metadata for RecordTypeEntity;
}

ValueMetadata *type metadata accessor for OpenRecordsIntent()
{
  return &type metadata for OpenRecordsIntent;
}

unint64_t sub_1000A3714()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000F0750;
  if (!qword_1000F0750)
  {
    sub_10001B790(255, &qword_1000F0758, (uint64_t (*)(void))sub_10001AFD8, (uint64_t)&type metadata for OpenRecordsIntent, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for IntentParameterSummary);
    result = swift_getWitnessTable(&protocol conformance descriptor for IntentParameterSummary<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000F0750);
  }
  return result;
}

uint64_t sub_1000A377C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  sub_1000A48EC(0);
  v8 = v7;
  v9 = *(_QWORD *)(v7 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  __chkstk_darwin(v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  v11 = *(unsigned __int8 *)(v9 + 80);
  v12 = (v11 + 16) & ~v11;
  v13 = swift_allocObject(&unk_1000E2838, v12 + v10, v11 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v13 + v12, (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  dispatch thunk of CategoryCountDataProvider.categoriesCounts(categories:predicate:completion:)(a3, a4, sub_1000A49B8, v13);
  return swift_release(v13);
}

uint64_t sub_1000A3870(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  __n128 v5;
  uint64_t v7;
  uint64_t v8;

  v8 = a1;
  if ((a2 & 1) != 0)
  {
    swift_errorRetain(a1);
    sub_1000A48EC(0);
    return CheckedContinuation.resume(throwing:)(&v8, v7);
  }
  else
  {
    sub_1000A48EC(0);
    v4 = v3;
    v5 = swift_bridgeObjectRetain(a1);
    return CheckedContinuation.resume(returning:)(&v8, v4, v5);
  }
}

uint64_t sub_1000A38EC()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  char *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t, uint64_t);
  char *v32;
  char *v33;
  char *v34;
  unint64_t v35;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char v44[3];

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v42 = *(_QWORD *)(v0 - 8);
  v43 = v0;
  __chkstk_darwin(v0);
  v41 = (char *)&v37 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000076D8(0, &qword_1000EE508, (uint64_t (*)(uint64_t))&type metadata accessor for IntentDialog, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  v3 = __chkstk_darwin(v2);
  v40 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v39 = (char *)&v37 - v5;
  v6 = type metadata accessor for String.LocalizationValue(0);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v38 = (char *)&v37 - v10;
  sub_1000076D8(0, &qword_1000EC948, (uint64_t (*)(uint64_t))&type metadata accessor for LocalizedStringResource, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v11);
  v13 = (char *)&v37 - v12;
  v14 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for Locale(0);
  __chkstk_darwin(v18);
  v20 = (char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for LocalizedStringResource(0);
  v22 = *(_QWORD *)(v21 - 8);
  __chkstk_darwin(v21);
  v24 = (char *)&v37 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = String.LocalizationValue.init(stringLiteral:)(0x522068746C616548, 0xEE007364726F6365);
  static Locale.current.getter(v25);
  v26 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v27 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 104);
  v27(v17, enum case for LocalizedStringResource.BundleDescription.main(_:), v14);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v9, 0x6E65746E49707041, 0xEA00000000007374, v20, v17, 0, 0, 256);
  v28 = v38;
  String.LocalizationValue.init(stringLiteral:)(0xD00000000000002BLL, 0x80000001000BF120);
  sub_10001B790(0, &qword_1000F07C0, (uint64_t (*)(void))sub_10001B0A4, (uint64_t)&type metadata for RecordTypeEntity, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for IntentParameter);
  v37 = v29;
  static Locale.current.getter(v29);
  v27(v17, v26, v14);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v28, 0x6E65746E49707041, 0xEA00000000007374, v20, v17, 0, 0, 256);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v13, 0, 1, v21);
  v44[0] = 10;
  v30 = type metadata accessor for IntentDialog(0);
  v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56);
  v32 = v39;
  v31(v39, 1, 1, v30);
  v33 = v40;
  v31(v40, 1, 1, v30);
  v34 = v41;
  (*(void (**)(char *, _QWORD, uint64_t))(v42 + 104))(v41, enum case for InputConnectionBehavior.default(_:), v43);
  v35 = sub_1000A2B04();
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v24, v13, v44, v32, v33, v34, v35);
}

uint64_t sub_1000A3CEC()
{
  return swift_task_switch(sub_1000A3D00, 0, 0);
}

uint64_t sub_1000A3D00()
{
  _QWORD *v0;
  _QWORD *v1;
  id v2;
  id v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0 + 2;
  v2 = objc_msgSend(objc_allocWithZone((Class)HKHealthStore), "init");
  v3 = objc_msgSend(objc_allocWithZone((Class)HKClinicalAccountStore), "initWithHealthStore:", v2);
  v0[15] = v3;

  v0[7] = v0 + 20;
  v0[2] = v0;
  v0[3] = sub_1000A3DDC;
  v4 = swift_continuation_init(v0 + 2, 0);
  v0[10] = _NSConcreteStackBlock;
  v5 = v0 + 10;
  v5[1] = 0x40000000;
  v5[2] = sub_1000A2324;
  v5[3] = &unk_1000E2810;
  v5[4] = v4;
  objc_msgSend(v3, "shouldShowHealthRecordsSectionWithCompletion:", v5);
  return swift_continuation_await(v1);
}

uint64_t sub_1000A3DDC()
{
  return swift_task_switch(sub_1000A3E28, 0, 0);
}

uint64_t sub_1000A3E28()
{
  uint64_t v0;
  _QWORD *v1;

  if (*(_BYTE *)(v0 + 160) == 1)
  {
    *(_QWORD *)(v0 + 128) = 10;
    *(_QWORD *)(v0 + 136) = 0;
    *(_QWORD *)(v0 + 144) = _swiftEmptyArrayStorage;
    *(_BYTE *)(v0 + 162) = 0;
    v1 = (_QWORD *)swift_task_alloc(dword_1000F078C);
    *(_QWORD *)(v0 + 152) = v1;
    *v1 = v0;
    v1[1] = sub_1000A3ED4;
    return sub_1000A233C(*(_QWORD *)(v0 + 120), 0);
  }
  else
  {

    return (*(uint64_t (**)(_QWORD *))(v0 + 8))(_swiftEmptyArrayStorage);
  }
}

uint64_t sub_1000A3ED4(char a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 152);
  *(_BYTE *)(*(_QWORD *)v1 + 163) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_1000A3F30, 0, 0);
}

uint64_t sub_1000A3F30()
{
  uint64_t v0;
  _QWORD *v1;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  char v8;
  _QWORD *v9;

  v1 = *(_QWORD **)(v0 + 144);
  if ((*(_BYTE *)(v0 + 163) & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*(_QWORD *)(v0 + 144));
    v1 = *(_QWORD **)(v0 + 144);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v1 = sub_10002A094(0, v1[2] + 1, 1, *(_QWORD **)(v0 + 144));
    v4 = v1[2];
    v3 = v1[3];
    if (v4 >= v3 >> 1)
      v1 = sub_10002A094((_QWORD *)(v3 > 1), v4 + 1, 1, v1);
    v5 = *(_BYTE *)(v0 + 162);
    v1[2] = v4 + 1;
    *((_BYTE *)v1 + v4 + 32) = v5;
  }
  v6 = *(_QWORD *)(v0 + 136) + 1;
  if (v6 == *(_QWORD *)(v0 + 128))
  {

    return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v1);
  }
  else
  {
    *(_QWORD *)(v0 + 136) = v6;
    *(_QWORD *)(v0 + 144) = v1;
    v8 = *((_BYTE *)&off_1000DC748 + v6 + 32);
    *(_BYTE *)(v0 + 162) = v8;
    v9 = (_QWORD *)swift_task_alloc(dword_1000F078C);
    *(_QWORD *)(v0 + 152) = v9;
    *v9 = v0;
    v9[1] = sub_1000A3ED4;
    return sub_1000A233C(*(_QWORD *)(v0 + 120), v8);
  }
}

uint64_t sub_1000A4054(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 120) = a1;
  *(_QWORD *)(v2 + 128) = a2;
  return swift_task_switch(sub_1000A406C, 0, 0);
}

uint64_t sub_1000A406C()
{
  _QWORD *v0;
  _QWORD *v1;
  id v2;
  id v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0 + 2;
  v2 = objc_msgSend(objc_allocWithZone((Class)HKHealthStore), "init");
  v3 = objc_msgSend(objc_allocWithZone((Class)HKClinicalAccountStore), "initWithHealthStore:", v2);
  v0[17] = v3;

  v0[7] = v0 + 22;
  v0[2] = v0;
  v0[3] = sub_1000A4148;
  v4 = swift_continuation_init(v0 + 2, 0);
  v0[10] = _NSConcreteStackBlock;
  v5 = v0 + 10;
  v5[1] = 0x40000000;
  v5[2] = sub_1000A2324;
  v5[3] = &unk_1000E2868;
  v5[4] = v4;
  objc_msgSend(v3, "shouldShowHealthRecordsSectionWithCompletion:", v5);
  return swift_continuation_await(v1);
}

uint64_t sub_1000A4148()
{
  return swift_task_switch(sub_1000A4194, 0, 0);
}

uint64_t sub_1000A4194()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  _QWORD *v5;

  if (*(_BYTE *)(v0 + 176) == 1)
  {
    *(_QWORD *)(v0 + 144) = 10;
    v1 = 0;
    while (1)
    {
      *(_QWORD *)(v0 + 152) = v1;
      *(_QWORD *)(v0 + 160) = _swiftEmptyArrayStorage;
      v2 = *(uint64_t (**)(uint64_t))(v0 + 120);
      v3 = *((unsigned __int8 *)&off_1000DC748 + v1 + 32);
      *(_BYTE *)(v0 + 178) = v3;
      if ((v2(v3) & 1) != 0)
        break;
      v1 = *(_QWORD *)(v0 + 152) + 1;
      if (v1 == *(_QWORD *)(v0 + 144))
        goto LABEL_5;
    }
    v5 = (_QWORD *)swift_task_alloc(dword_1000F078C);
    *(_QWORD *)(v0 + 168) = v5;
    *v5 = v0;
    v5[1] = sub_1000A4274;
    return sub_1000A233C(*(_QWORD *)(v0 + 136), v3);
  }
  else
  {
LABEL_5:

    return (*(uint64_t (**)(_QWORD *))(v0 + 8))(_swiftEmptyArrayStorage);
  }
}

uint64_t sub_1000A4274(char a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 168);
  *(_BYTE *)(*(_QWORD *)v1 + 179) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_1000A42D0, 0, 0);
}

uint64_t sub_1000A42D0()
{
  uint64_t v0;
  _QWORD *v1;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  _QWORD *v9;

  v1 = *(_QWORD **)(v0 + 160);
  if ((*(_BYTE *)(v0 + 179) & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*(_QWORD *)(v0 + 160));
    v1 = *(_QWORD **)(v0 + 160);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v1 = sub_10002A094(0, v1[2] + 1, 1, *(_QWORD **)(v0 + 160));
    v4 = v1[2];
    v3 = v1[3];
    if (v4 >= v3 >> 1)
      v1 = sub_10002A094((_QWORD *)(v3 > 1), v4 + 1, 1, v1);
    v5 = *(_BYTE *)(v0 + 178);
    v1[2] = v4 + 1;
    *((_BYTE *)v1 + v4 + 32) = v5;
  }
  while (1)
  {
    v6 = *(_QWORD *)(v0 + 152) + 1;
    if (v6 == *(_QWORD *)(v0 + 144))
      break;
    *(_QWORD *)(v0 + 152) = v6;
    *(_QWORD *)(v0 + 160) = v1;
    v7 = *(uint64_t (**)(uint64_t))(v0 + 120);
    v8 = *((unsigned __int8 *)&off_1000DC748 + v6 + 32);
    *(_BYTE *)(v0 + 178) = v8;
    if ((v7(v8) & 1) != 0)
    {
      v9 = (_QWORD *)swift_task_alloc(dword_1000F078C);
      *(_QWORD *)(v0 + 168) = v9;
      *v9 = v0;
      v9[1] = sub_1000A4274;
      return sub_1000A233C(*(_QWORD *)(v0 + 136), v8);
    }
  }

  return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v1);
}

uint64_t sub_1000A4400()
{
  return swift_task_switch(sub_1000A4414, 0, 0);
}

uint64_t sub_1000A4414()
{
  _QWORD *v0;
  _QWORD *v1;
  id v2;
  id v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0 + 2;
  v2 = objc_msgSend(objc_allocWithZone((Class)HKHealthStore), "init");
  v3 = objc_msgSend(objc_allocWithZone((Class)HKClinicalAccountStore), "initWithHealthStore:", v2);
  v0[15] = v3;

  v0[7] = v0 + 20;
  v0[2] = v0;
  v0[3] = sub_1000A44F0;
  v4 = swift_continuation_init(v0 + 2, 0);
  v0[10] = _NSConcreteStackBlock;
  v5 = v0 + 10;
  v5[1] = 0x40000000;
  v5[2] = sub_1000A2324;
  v5[3] = &unk_1000E2850;
  v5[4] = v4;
  objc_msgSend(v3, "shouldShowHealthRecordsSectionWithCompletion:", v5);
  return swift_continuation_await(v1);
}

uint64_t sub_1000A44F0()
{
  return swift_task_switch(sub_1000A453C, 0, 0);
}

uint64_t sub_1000A453C()
{
  uint64_t v0;
  _QWORD *v1;

  if (*(_BYTE *)(v0 + 160) == 1)
  {
    *(_QWORD *)(v0 + 128) = 10;
    *(_QWORD *)(v0 + 136) = 0;
    *(_QWORD *)(v0 + 144) = _swiftEmptyArrayStorage;
    *(_BYTE *)(v0 + 162) = 0;
    v1 = (_QWORD *)swift_task_alloc(dword_1000F078C);
    *(_QWORD *)(v0 + 152) = v1;
    *v1 = v0;
    v1[1] = sub_1000A45E8;
    return sub_1000A233C(*(_QWORD *)(v0 + 120), 0);
  }
  else
  {

    return (*(uint64_t (**)(_QWORD *))(v0 + 8))(_swiftEmptyArrayStorage);
  }
}

uint64_t sub_1000A45E8(char a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 152);
  *(_BYTE *)(*(_QWORD *)v1 + 163) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_1000A4644, 0, 0);
}

uint64_t sub_1000A4644()
{
  uint64_t v0;
  _QWORD *v1;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  char v8;
  _QWORD *v9;

  v1 = *(_QWORD **)(v0 + 144);
  if ((*(_BYTE *)(v0 + 163) & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*(_QWORD *)(v0 + 144));
    v1 = *(_QWORD **)(v0 + 144);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v1 = sub_10002A094(0, v1[2] + 1, 1, *(_QWORD **)(v0 + 144));
    v4 = v1[2];
    v3 = v1[3];
    if (v4 >= v3 >> 1)
      v1 = sub_10002A094((_QWORD *)(v3 > 1), v4 + 1, 1, v1);
    v5 = *(_BYTE *)(v0 + 162);
    v1[2] = v4 + 1;
    *((_BYTE *)v1 + v4 + 32) = v5;
  }
  v6 = *(_QWORD *)(v0 + 136) + 1;
  if (v6 == *(_QWORD *)(v0 + 128))
  {

    return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v1);
  }
  else
  {
    *(_QWORD *)(v0 + 136) = v6;
    *(_QWORD *)(v0 + 144) = v1;
    v8 = *((_BYTE *)&off_1000DC748 + v6 + 32);
    *(_BYTE *)(v0 + 162) = v8;
    v9 = (_QWORD *)swift_task_alloc(dword_1000F078C);
    *(_QWORD *)(v0 + 152) = v9;
    *v9 = v0;
    v9[1] = sub_1000A45E8;
    return sub_1000A233C(*(_QWORD *)(v0 + 120), v8);
  }
}

unint64_t sub_1000A4768(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000DC778, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 0xA)
    return 10;
  else
    return v3;
}

unint64_t sub_1000A47B0()
{
  unint64_t result;

  result = qword_1000F0760;
  if (!qword_1000F0760)
  {
    result = swift_getWitnessTable(&unk_1000B6940, &type metadata for RecordTypeEntity);
    atomic_store(result, (unint64_t *)&qword_1000F0760);
  }
  return result;
}

unint64_t sub_1000A47F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000F0790;
  if (!qword_1000F0790)
  {
    v1 = objc_opt_self(HKClinicalAccount);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000F0790);
  }
  return result;
}

uint64_t sub_1000A4830(uint64_t a1)
{
  uint64_t *v1;

  return sub_1000A377C(a1, v1[2], v1[3], v1[4]);
}

void sub_1000A483C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_1000F07A0)
  {
    v2 = type metadata accessor for BrowseCategory(255);
    v3 = sub_1000A48A4();
    v4 = type metadata accessor for Dictionary(a1, v2, &type metadata for Int, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_1000F07A0);
  }
}

unint64_t sub_1000A48A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000EF708;
  if (!qword_1000EF708)
  {
    v1 = type metadata accessor for BrowseCategory(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for BrowseCategory, v1);
    atomic_store(result, (unint64_t *)&qword_1000EF708);
  }
  return result;
}

void sub_1000A48EC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if (!qword_1000F07A8)
  {
    sub_1000A483C(255);
    v3 = v2;
    v4 = sub_100013960();
    v5 = type metadata accessor for CheckedContinuation(a1, v3, v4, &protocol self-conformance witness table for Error);
    if (!v6)
      atomic_store(v5, (unint64_t *)&qword_1000F07A8);
  }
}

uint64_t sub_1000A4958()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_1000A48EC(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000A49B8(uint64_t a1, char a2)
{
  char v3;

  v3 = a2 & 1;
  sub_1000A48EC(0);
  return sub_1000A3870(a1, v3);
}

uint64_t sub_1000A4A04(uint64_t a1)
{
  uint64_t v1;

  return sub_1000A216C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

unint64_t sub_1000A4A0C()
{
  unint64_t result;

  result = qword_1000F07C8;
  if (!qword_1000F07C8)
  {
    result = swift_getWitnessTable(&unk_1000B6698, &type metadata for OpenRecordsIntent);
    atomic_store(result, (unint64_t *)&qword_1000F07C8);
  }
  return result;
}

unint64_t sub_1000A4A50()
{
  unint64_t result;

  result = qword_1000F07D0;
  if (!qword_1000F07D0)
  {
    result = swift_getWitnessTable(&unk_1000B66E8, &type metadata for OpenRecordsIntent);
    atomic_store(result, (unint64_t *)&qword_1000F07D0);
  }
  return result;
}

uint64_t sub_1000A4A94@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = IntentParameter.projectedValue.getter();
  *a1 = result;
  return result;
}

void sub_1000A4ABC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000F07E8)
  {
    sub_10001B790(255, &qword_1000F07C0, (uint64_t (*)(void))sub_10001B0A4, (uint64_t)&type metadata for RecordTypeEntity, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for IntentParameter);
    v3 = type metadata accessor for KeyPath(a1, &type metadata for OpenRecordsIntent, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000F07E8);
  }
}

id sub_1000A4CA0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityIndicatorTitleView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ActivityIndicatorTitleView()
{
  return objc_opt_self(_TtC6Health26ActivityIndicatorTitleView);
}

ValueMetadata *type metadata accessor for NotificationAuthorizationSupport()
{
  return &type metadata for NotificationAuthorizationSupport;
}

uint64_t sub_1000A4D40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  NSString v15;
  id v16;
  void (*v17)(char *, char *, uint64_t);
  id v18;
  Class isa;
  id v20;
  uint64_t v22;

  sub_100014C2C(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v22 - v12;
  v14 = objc_msgSend(objc_allocWithZone((Class)NSISO8601DateFormatter), "init");
  v15 = String._bridgeToObjectiveC()();
  v16 = objc_msgSend(v14, "dateFromString:", v15);

  if (!v16)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_5;
  }
  static Date._unconditionallyBridgeFromObjectiveC(_:)(v16);

  v17 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v17(v6, v11, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_5:

    sub_100014BD8((uint64_t)v6);
    swift_bridgeObjectRetain(a2);
    return a1;
  }
  v17(v13, v6, v7);
  v18 = objc_msgSend(objc_allocWithZone((Class)NSDateFormatter), "init");
  objc_msgSend(v18, "setDateStyle:", 1);
  objc_msgSend(v18, "setTimeStyle:", 1);
  isa = Date._bridgeToObjectiveC()().super.isa;
  v20 = objc_msgSend(v18, "stringFromDate:", isa);

  a1 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  return a1;
}

uint64_t sub_1000A4F9C()
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
  uint64_t *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  id v28;
  void (*v29)(_BYTE *, _QWORD);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  Swift::String v66;
  Swift::String v67;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  unint64_t v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  _BYTE v100[16];
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  void *v104;
  _QWORD *v105;

  v1 = type metadata accessor for SectionedDataSourceContainerViewType(0);
  v91 = *(_QWORD *)(v1 - 8);
  v92 = v1;
  __chkstk_darwin(v1);
  v90 = (char *)&v69 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000076D8(0, &qword_1000ECA60, (uint64_t (*)(uint64_t))&type metadata accessor for UIBackgroundConfiguration, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v3);
  v89 = (char *)&v69 - v4;
  v88 = type metadata accessor for CellDeselectionBehavior(0);
  v87 = *(_QWORD *)(v88 - 8);
  __chkstk_darwin(v88);
  v86 = (char *)&v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000076D8(0, &qword_1000ECCD8, (uint64_t (*)(uint64_t))&type metadata accessor for UICellAccessory.LayoutDimension, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v6);
  v85 = (char *)&v69 - v7;
  v84 = type metadata accessor for UICellAccessory.DisclosureIndicatorOptions(0);
  v83 = *(_QWORD *)(v84 - 8);
  __chkstk_darwin(v84);
  v82 = (char *)&v69 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = type metadata accessor for UICellAccessory.DisplayedState(0);
  v80 = *(_QWORD *)(v81 - 8);
  __chkstk_darwin(v81);
  v79 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v95 = type metadata accessor for UUID(0);
  v93 = *(_QWORD *)(v95 - 8);
  __chkstk_darwin(v95);
  v94 = (char *)&v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = type metadata accessor for ContentConfigurationItem(0);
  v77 = *(_QWORD *)(v78 - 8);
  __chkstk_darwin(v78);
  v12 = (char *)&v69 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = 24;
  v70 = v0;
  v105 = _swiftEmptyArrayStorage;
  sub_10007FE98(0, 24, 0);
  v76 = (id)objc_opt_self(UIColor);
  v75 = enum case for UICellAccessory.DisplayedState.always(_:);
  v74 = enum case for CellDeselectionBehavior.default(_:);
  v73 = enum case for SectionedDataSourceContainerViewType.collectionView(_:);
  v14 = &qword_1000DBA40;
  v72 = 0x80000001000BF300;
  v71 = xmmword_1000B11F0;
  v15 = v80;
  v16 = v79;
  do
  {
    v17 = *v14;
    v98 = v14 + 1;
    v99 = v13;
    v18 = sub_1000A57C0(v17);
    if (v19)
      v20 = v18;
    else
      v20 = 0xD000000000000012;
    if (v19)
      v21 = v19;
    else
      v21 = v72;
    v22 = swift_allocObject(&unk_1000E2C50, 24, 7);
    *(_QWORD *)(v22 + 16) = v17;
    v23 = v94;
    v24 = UUID.init()(v22);
    v25 = UUID.uuidString.getter(v24);
    v96 = v26;
    v97 = v25;
    (*(void (**)(char *, uint64_t))(v93 + 8))(v23, v95);
    v103 = type metadata accessor for UIListContentConfiguration(0);
    v104 = &protocol witness table for UIListContentConfiguration;
    v27 = sub_100007E0C(&v101);
    static UIListContentConfiguration.cell()(v27);
    swift_bridgeObjectRetain(v21);
    UIListContentConfiguration.text.setter(v20, v21);
    v28 = objc_msgSend(v76, "blackColor");
    v29 = (void (*)(_BYTE *, _QWORD))UIListContentConfiguration.textProperties.modify(v100);
    UIListContentConfiguration.TextProperties.color.setter(v28);
    v29(v100, 0);
    sub_1000076D8(0, &qword_1000ECCE0, (uint64_t (*)(uint64_t))&type metadata accessor for UICellAccessory, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    v31 = v30;
    v32 = type metadata accessor for UICellAccessory(0);
    v33 = swift_allocObject(v31, ((*(unsigned __int8 *)(*(_QWORD *)(v32 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v32 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v32 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v32 - 8) + 80) | 7);
    *(_OWORD *)(v33 + 16) = v71;
    v34 = v12;
    v35 = v81;
    (*(void (**)(char *, _QWORD, uint64_t))(v15 + 104))(v16, v75, v81);
    v36 = type metadata accessor for UICellAccessory.LayoutDimension(0);
    v37 = v85;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v85, 1, 1, v36);
    v38 = v82;
    UICellAccessory.DisclosureIndicatorOptions.init(isHidden:reservedLayoutWidth:tintColor:)(2, v37, 0);
    static UICellAccessory.disclosureIndicator(displayed:options:)(v16, v38);
    (*(void (**)(char *, uint64_t))(v83 + 8))(v38, v84);
    v39 = v35;
    v12 = v34;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v16, v39);
    v40 = v86;
    (*(void (**)(char *, _QWORD, uint64_t))(v87 + 104))(v86, v74, v88);
    swift_retain(v22);
    swift_bridgeObjectRelease(v21);
    v41 = type metadata accessor for UIBackgroundConfiguration(0);
    v42 = v89;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v89, 1, 1, v41);
    v43 = v90;
    (*(void (**)(char *, _QWORD, uint64_t))(v91 + 104))(v90, v73, v92);
    ContentConfigurationItem.init(uniqueIdentifier:contentConfiguration:cellAccessories:cellSelectionHandler:deselectionBehavior:backgroundConfiguration:updateContentConfigurationHandler:container:automationIdentifier:)(v97, v96, &v101, v33, sub_1000A5E9C, v22, v40, v42, 0, 0, v43, 0, 0);
    swift_release(v22);
    v44 = (uint64_t)v105;
    if ((swift_isUniquelyReferenced_nonNull_native(v105) & 1) == 0)
    {
      sub_10007FE98(0, *(_QWORD *)(v44 + 16) + 1, 1);
      v44 = (uint64_t)v105;
    }
    v46 = *(_QWORD *)(v44 + 16);
    v45 = *(_QWORD *)(v44 + 24);
    v47 = v99;
    if (v46 >= v45 >> 1)
    {
      sub_10007FE98(v45 > 1, v46 + 1, 1);
      v44 = (uint64_t)v105;
    }
    *(_QWORD *)(v44 + 16) = v46 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v77 + 32))(v44+ ((*(unsigned __int8 *)(v77 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v77 + 80))+ *(_QWORD *)(v77 + 72) * v46, v12, v78);
    v105 = (_QWORD *)v44;
    v13 = v47 - 1;
    v14 = v98;
  }
  while (v13);
  sub_1000076D8(0, &qword_1000ECA68, (uint64_t (*)(uint64_t))&type metadata accessor for ArrayDataSourceSection, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v49 = v48;
  v50 = type metadata accessor for ArrayDataSourceSection(0);
  v51 = swift_allocObject(v49, ((*(unsigned __int8 *)(*(_QWORD *)(v50 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v50 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v50 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v50 - 8) + 80) | 7);
  *(_OWORD *)(v51 + 16) = xmmword_1000B11F0;
  v52 = sub_1000A6048(v44);
  swift_bridgeObjectRelease(v44);
  v53 = v94;
  v55 = UUID.init()(v54);
  v56 = UUID.uuidString.getter(v55);
  v58 = v57;
  v59 = *(void (**)(char *, uint64_t))(v93 + 8);
  v60 = v95;
  v59(v53, v95);
  v61 = ArrayDataSourceSection.init(title:arrangedItems:identifier:)(0x79726F6765746143, 0xEE00736D6F6F5220, v52, v56, v58);
  v101 = 0x3C53447961727241;
  v102 = 0xE800000000000000;
  v62 = UUID.init()(v61);
  v63 = UUID.uuidString.getter(v62);
  v65 = v64;
  v59(v53, v60);
  v66._countAndFlagsBits = v63;
  v66._object = v65;
  String.append(_:)(v66);
  swift_bridgeObjectRelease(v65);
  v67._countAndFlagsBits = 62;
  v67._object = (void *)0xE100000000000000;
  String.append(_:)(v67);
  return ArrayDataSource.init(arrangedSections:identifier:)(v51, v101, v102);
}

_UNKNOWN **static HKDisplayCategoryIdentifier.allCases.getter()
{
  return &off_1000DBA20;
}

unint64_t sub_1000A57C0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  Swift::String v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  unint64_t result;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (id)HKDisplayCategoryIdentifierToString(a1);
  if (!v6)
  {
    v23 = static Logger.dataSource.getter();
    v24 = Logger.logObject.getter(v23);
    v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc(12, -1);
      v27 = swift_slowAlloc(32, -1);
      v32 = a1;
      v33 = v27;
      *(_DWORD *)v26 = 136315138;
      type metadata accessor for HKDisplayCategoryIdentifier(0);
      v29 = String.init<A>(describing:)(&v32, v28);
      v31 = v30;
      v32 = sub_100012B20(v29, v30, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v26 + 4, v26 + 12);
      swift_bridgeObjectRelease(v31);
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "[Internal Settings] Could not get category name for %s", v26, 0xCu);
      swift_arrayDestroy(v27, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v27, -1, -1);
      swift_slowDealloc(v26, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return 0;
  }
  v7 = v6;
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  v10 = v9;

  v11._countAndFlagsBits = 0xD00000000000001BLL;
  v11._object = (void *)0x80000001000BF320;
  if (!String.hasPrefix(_:)(v11))
    return v8;
  swift_bridgeObjectRetain(v10);
  v12 = String.count.getter(v8, v10);
  swift_bridgeObjectRelease(v10);
  v13 = String.count.getter(0xD00000000000001BLL, 0x80000001000BF320);
  v14 = __OFSUB__(v12, v13);
  result = v12 - v13;
  if (!v14)
  {
    v16 = sub_1000A5EA4(result, v8, v10);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    swift_bridgeObjectRelease(v10);
    v8 = static String._fromSubstring(_:)(v16, v18, v20, v22);
    swift_bridgeObjectRelease(v22);
    return v8;
  }
  __break(1u);
  return result;
}

id sub_1000A5A40(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id result;
  void *v12;
  id v13;
  _QWORD *v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];

  v4 = type metadata accessor for HKTypeGroup(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)v17 - v9;
  result = objc_msgSend(a1, "resolvedHealthStore");
  if (result)
  {
    v12 = result;
    static HKTypeGroup.typeGroup(for:)(a2);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
    v13 = v12;
    v14 = UIViewController.resolvedHealthExperienceStore.getter(v18);
    UIViewController.resolvedPinnedContentManager.getter(v17, v14);
    v15 = objc_allocWithZone((Class)type metadata accessor for CategoryViewController(0));
    v16 = (void *)CategoryViewController.init(typeGroup:healthStore:healthExperienceStore:pinnedContentManager:)(v8, v13, v18, v17);
    objc_msgSend(a1, "showViewController:sender:", v16, 0);

    return (id)(*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
  return result;
}

void sub_1000A5B88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000A5BB8(a1, a2, a3, (uint64_t)"init(_:identifier:)", 19);
}

void sub_1000A5BA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000A5BB8(a1, a2, a3, (uint64_t)"init(arrangedSections:identifier:)", 34);
}

void sub_1000A5BB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _swift_stdlib_reportUnimplementedInitializer("Health.CategoryDataSource", 25, a4, a5, 0);
  __break(1u);
}

unint64_t sub_1000A5BE0@<X0>(uint64_t a1@<X3>, uint64_t *a2@<X8>)
{
  swift_getWitnessTable(&unk_1000B6E88, a1);
  return sub_1000213F0(a2);
}

uint64_t sub_1000A5C4C(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_1000B6E88, a2);
  return sub_100020F3C(a1, a2, WitnessTable);
}

unint64_t HKDisplayCategoryIdentifier.uniqueIdentifier.getter()
{
  Swift::String v0;
  void *object;

  v0._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  object = v0._object;
  String.append(_:)(v0);
  swift_bridgeObjectRelease(object);
  return 0xD00000000000001CLL;
}

unint64_t sub_1000A5D10()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000F0828;
  if (!qword_1000F0828)
  {
    sub_1000076D8(255, &qword_1000F0830, (uint64_t (*)(uint64_t))type metadata accessor for HKDisplayCategoryIdentifier, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000F0828);
  }
  return result;
}

void sub_1000A5D70(_QWORD *a1@<X8>)
{
  *a1 = &off_1000DBA20;
}

uint64_t type metadata accessor for CategoryDataSource(uint64_t a1)
{
  uint64_t result;

  result = qword_1000F0838;
  if (!qword_1000F0838)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for CategoryDataSource);
  return result;
}

uint64_t sub_1000A5DBC(uint64_t a1)
{
  _BYTE v2[8];

  return swift_initClassMetadata2(a1, 0, 0, v2, a1 + qword_1000F1310);
}

uint64_t sub_1000A5DF8()
{
  return type metadata accessor for CategoryDataSource(0);
}

uint64_t sub_1000A5E00(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_1000A5E4C(&qword_1000F0888, (uint64_t)&unk_1000B6E30);
  result = sub_1000A5E4C(&qword_1000F0890, (uint64_t)&unk_1000B6E60);
  *(_QWORD *)(a1 + 24) = result;
  return result;
}

uint64_t sub_1000A5E4C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for CategoryDataSource(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000A5E8C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

id sub_1000A5E9C(void *a1)
{
  uint64_t v1;

  return sub_1000A5A40(a1, *(_QWORD *)(v1 + 16));
}

unint64_t sub_1000A5EA4(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v3 = HIBYTE(a3) & 0xF;
    else
      v3 = a2 & 0xFFFFFFFFFFFFLL;
    v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v4 = 11;
    result = String.index(_:offsetBy:limitedBy:)(v4 | (v3 << 16), -(uint64_t)result, 15, a2, a3);
    if ((v5 & 1) != 0)
      result = 15;
    if (4 * v3 >= result >> 14)
      return String.subscript.getter();
  }
  __break(1u);
  return result;
}

void sub_1000A5F4C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjectType;
  id v6;
  void *v7;
  id v8;

  ObjectType = swift_getObjectType(a2);
  v8 = (id)dispatch thunk of PluginInternalSettingsProviding.makeInternalSettingsViewController()(ObjectType, a3);
  v6 = objc_msgSend(a1, "navigationController");
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "pushViewController:animated:", v8, 1);

  }
}

uint64_t type metadata accessor for ContentKindDataSource(uint64_t a1)
{
  uint64_t result;

  result = qword_1000F0898;
  if (!qword_1000F0898)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ContentKindDataSource);
  return result;
}

uint64_t sub_1000A600C(uint64_t a1)
{
  _BYTE v2[8];

  return swift_initClassMetadata2(a1, 0, 0, v2, a1 + qword_1000F1320);
}

_QWORD *sub_1000A6048(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  unint64_t v11;
  unint64_t v12;
  char *v13;
  _QWORD *v14;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;

  v2 = type metadata accessor for ContentConfigurationItem(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = _swiftEmptyArrayStorage;
  if (v6)
  {
    v19 = _swiftEmptyArrayStorage;
    sub_10007FEC4(0, v6, 0);
    v7 = v19;
    v8 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v9 = *(_QWORD *)(v3 + 72);
    v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    do
    {
      v10(v5, v8, v2);
      v19 = v7;
      v12 = v7[2];
      v11 = v7[3];
      if (v12 >= v11 >> 1)
        sub_10007FEC4(v11 > 1, v12 + 1, 1);
      v17 = v2;
      v18 = sub_100013198(&qword_1000ECA80, (uint64_t (*)(uint64_t))&type metadata accessor for ContentConfigurationItem, (uint64_t)&protocol conformance descriptor for ContentConfigurationItem);
      v13 = (char *)sub_100007E0C(&v16);
      v10(v13, (uint64_t)v5, v2);
      v14 = v19;
      v19[2] = v12 + 1;
      sub_10001AF7C(&v16, (uint64_t)&v14[5 * v12 + 4]);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      v7 = v19;
      v8 += v9;
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t sub_1000A61C4(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v13 = a1;
    else
      v13 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v13);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = _swiftEmptyArrayStorage;
  if (!v2)
    return (uint64_t)v3;
  v17 = _swiftEmptyArrayStorage;
  result = sub_10007FEC4(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v3 = v17;
    if ((a1 & 0xC000000000000001) != 0)
    {
      v5 = 0;
      do
      {
        v6 = specialized _ArrayBuffer._getElementSlowPath(_:)(v5, a1);
        v17 = v3;
        v8 = v3[2];
        v7 = v3[3];
        if (v8 >= v7 >> 1)
        {
          sub_10007FEC4(v7 > 1, v8 + 1, 1);
          v3 = v17;
        }
        ++v5;
        v15 = type metadata accessor for SidebarDataSourceItem(0);
        v16 = sub_100013198(&qword_1000F08F8, (uint64_t (*)(uint64_t))&type metadata accessor for SidebarDataSourceItem, (uint64_t)&protocol conformance descriptor for SidebarDataSourceItem);
        *(_QWORD *)&v14 = v6;
        v3[2] = v8 + 1;
        sub_10001AF7C(&v14, (uint64_t)&v3[5 * v8 + 4]);
      }
      while (v2 != v5);
    }
    else
    {
      v9 = (uint64_t *)(a1 + 32);
      do
      {
        v10 = *v9;
        v17 = v3;
        v12 = v3[2];
        v11 = v3[3];
        swift_retain(v10);
        if (v12 >= v11 >> 1)
        {
          sub_10007FEC4(v11 > 1, v12 + 1, 1);
          v3 = v17;
        }
        v15 = type metadata accessor for SidebarDataSourceItem(0);
        v16 = sub_100013198(&qword_1000F08F8, (uint64_t (*)(uint64_t))&type metadata accessor for SidebarDataSourceItem, (uint64_t)&protocol conformance descriptor for SidebarDataSourceItem);
        *(_QWORD *)&v14 = v10;
        v3[2] = v12 + 1;
        sub_10001AF7C(&v14, (uint64_t)&v3[5 * v12 + 4]);
        ++v9;
        --v2;
      }
      while (v2);
    }
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

_QWORD *sub_1000A63CC(uint64_t a1)
{
  int64_t v1;
  _QWORD *v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  _QWORD *v13;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = _swiftEmptyArrayStorage;
  if (v1)
  {
    v13 = _swiftEmptyArrayStorage;
    sub_10007FEFC(0, v1, 0);
    v4 = (uint64_t *)(a1 + 32);
    v5 = sub_1000A7188(0, (unint64_t *)&qword_1000EE418, (uint64_t (*)(uint64_t))&type metadata accessor for UITraitHorizontalSizeClass, (uint64_t (*)(uint64_t))&_swift_getMetatypeMetadata);
    v6 = sub_1000A7188(0, (unint64_t *)&qword_1000ED410, (uint64_t (*)(uint64_t))sub_10002AA4C, (uint64_t (*)(uint64_t))&_swift_getExistentialMetatypeMetadata);
    do
    {
      v11 = *v4;
      swift_dynamicCast(&v12, &v11, v5, v6, 7);
      v10 = v12;
      v2 = v13;
      if ((swift_isUniquelyReferenced_nonNull_native(v13) & 1) == 0)
      {
        sub_10007FEFC(0, v2[2] + 1, 1);
        v2 = v13;
      }
      v8 = v2[2];
      v7 = v2[3];
      if (v8 >= v7 >> 1)
      {
        sub_10007FEFC(v7 > 1, v8 + 1, 1);
        v2 = v13;
      }
      v2[2] = v8 + 1;
      *(_OWORD *)&v2[2 * v8 + 4] = v10;
      ++v4;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_1000A6524()
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
  int64_t v18;
  _OWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  id v38;
  void (*v39)(char *, _QWORD);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  void (*v49)(char *, uint64_t);
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  _QWORD *v55;
  unint64_t v56;
  unint64_t v57;
  int64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(char *, uint64_t);
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  Swift::String v77;
  Swift::String v78;
  _QWORD v80[2];
  __int128 v81;
  unsigned int v82;
  unsigned int v83;
  unsigned int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void (*v88)(char *, char *, uint64_t);
  uint64_t v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  int64_t v117;
  char *v118;
  char v119[8];
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  void *v123;
  _QWORD *v124;

  v108 = type metadata accessor for SectionedDataSourceContainerViewType(0);
  v107 = *(_QWORD *)(v108 - 8);
  __chkstk_darwin(v108);
  v106 = (char *)v80 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000076D8(0, &qword_1000ECA60, (uint64_t (*)(uint64_t))&type metadata accessor for UIBackgroundConfiguration, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v2);
  v105 = (char *)v80 - v3;
  v104 = type metadata accessor for CellDeselectionBehavior(0);
  v103 = *(_QWORD *)(v104 - 8);
  __chkstk_darwin(v104);
  v102 = (char *)v80 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000076D8(0, &qword_1000ECCD8, (uint64_t (*)(uint64_t))&type metadata accessor for UICellAccessory.LayoutDimension, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v5);
  v101 = (char *)v80 - v6;
  v100 = type metadata accessor for UICellAccessory.DisclosureIndicatorOptions(0);
  v99 = *(_QWORD *)(v100 - 8);
  __chkstk_darwin(v100);
  v98 = (char *)v80 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v97 = type metadata accessor for UICellAccessory.DisplayedState(0);
  v96 = *(_QWORD *)(v97 - 8);
  __chkstk_darwin(v97);
  v95 = (char *)v80 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = type metadata accessor for UUID(0);
  v109 = *(_QWORD *)(v111 - 8);
  __chkstk_darwin(v111);
  v110 = (char *)v80 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = type metadata accessor for ContentKind(0);
  v10 = *(_QWORD *)(v94 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = __chkstk_darwin(v94);
  v93 = (char *)v80 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v118 = (char *)v80 - v13;
  v92 = type metadata accessor for ContentConfigurationItem(0);
  v91 = *(_QWORD *)(v92 - 8);
  v14 = __chkstk_darwin(v92);
  v16 = (char *)v80 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = static ContentKind.allCases.getter(v14);
  v18 = *(_QWORD *)(v17 + 16);
  v19 = &unk_1000B1000;
  if (v18)
  {
    v80[1] = v0;
    v124 = _swiftEmptyArrayStorage;
    v20 = v17;
    sub_10007FE98(0, v18, 0);
    v90 = (id)objc_opt_self(UIColor);
    v21 = *(unsigned __int8 *)(v10 + 80);
    v80[0] = v20;
    v22 = v20 + ((v21 + 32) & ~v21);
    v89 = *(_QWORD *)(v10 + 72);
    v88 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
    v87 = (v21 + 16) & ~v21;
    v86 = v87 + v11;
    v85 = v21 | 7;
    v84 = enum case for UICellAccessory.DisplayedState.always(_:);
    v83 = enum case for CellDeselectionBehavior.default(_:);
    v82 = enum case for SectionedDataSourceContainerViewType.collectionView(_:);
    v81 = xmmword_1000B11F0;
    v23 = v95;
    v24 = v98;
    do
    {
      v116 = v22;
      v117 = v18;
      v25 = v118;
      v26 = v94;
      v27 = v88;
      ((void (*)(char *))v88)(v118);
      v28 = v93;
      v27(v93, v25, v26);
      v29 = String.init<A>(describing:)(v28, v26);
      v31 = v30;
      v27(v28, v25, v26);
      v113 = swift_allocObject(&unk_1000E2D00, v86, v85);
      v32 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(v113 + v87, v28, v26);
      v33 = v110;
      v34 = UUID.init()(v32);
      v35 = UUID.uuidString.getter(v34);
      v114 = v36;
      v115 = v35;
      (*(void (**)(char *, uint64_t))(v109 + 8))(v33, v111);
      v122 = type metadata accessor for UIListContentConfiguration(0);
      v123 = &protocol witness table for UIListContentConfiguration;
      v37 = sub_100007E0C(&v120);
      static UIListContentConfiguration.cell()(v37);
      v112 = v31;
      swift_bridgeObjectRetain(v31);
      UIListContentConfiguration.text.setter(v29, v31);
      v38 = objc_msgSend(v90, "blackColor");
      v39 = (void (*)(char *, _QWORD))UIListContentConfiguration.textProperties.modify(v119);
      UIListContentConfiguration.TextProperties.color.setter(v38);
      v39(v119, 0);
      sub_1000076D8(0, &qword_1000ECCE0, (uint64_t (*)(uint64_t))&type metadata accessor for UICellAccessory, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
      v41 = v40;
      v42 = type metadata accessor for UICellAccessory(0);
      v43 = swift_allocObject(v41, ((*(unsigned __int8 *)(*(_QWORD *)(v42 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v42 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v42 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v42 - 8) + 80) | 7);
      *(_OWORD *)(v43 + 16) = v81;
      v44 = v10;
      v45 = v96;
      v46 = v97;
      (*(void (**)(char *, _QWORD, uint64_t))(v96 + 104))(v23, v84, v97);
      v47 = type metadata accessor for UICellAccessory.LayoutDimension(0);
      v48 = v101;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v101, 1, 1, v47);
      UICellAccessory.DisclosureIndicatorOptions.init(isHidden:reservedLayoutWidth:tintColor:)(2, v48, 0);
      static UICellAccessory.disclosureIndicator(displayed:options:)(v23, v24);
      (*(void (**)(char *, uint64_t))(v99 + 8))(v24, v100);
      v49 = *(void (**)(char *, uint64_t))(v45 + 8);
      v10 = v44;
      v49(v23, v46);
      v50 = v102;
      (*(void (**)(char *, _QWORD, uint64_t))(v103 + 104))(v102, v83, v104);
      v51 = v113;
      swift_retain(v113);
      swift_bridgeObjectRelease(v112);
      v52 = type metadata accessor for UIBackgroundConfiguration(0);
      v53 = v105;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 56))(v105, 1, 1, v52);
      v54 = v106;
      (*(void (**)(char *, _QWORD, uint64_t))(v107 + 104))(v106, v82, v108);
      ContentConfigurationItem.init(uniqueIdentifier:contentConfiguration:cellAccessories:cellSelectionHandler:deselectionBehavior:backgroundConfiguration:updateContentConfigurationHandler:container:automationIdentifier:)(v115, v114, &v120, v43, sub_1000A714C, v51, v50, v53, 0, 0, v54, 0, 0);
      swift_release(v51);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v118, v26);
      v55 = v124;
      if ((swift_isUniquelyReferenced_nonNull_native(v124) & 1) == 0)
      {
        sub_10007FE98(0, v55[2] + 1, 1);
        v55 = v124;
      }
      v57 = v55[2];
      v56 = v55[3];
      v58 = v117;
      if (v57 >= v56 >> 1)
      {
        sub_10007FE98(v56 > 1, v57 + 1, 1);
        v55 = v124;
      }
      v55[2] = v57 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v91 + 32))((unint64_t)v55+ ((*(unsigned __int8 *)(v91 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v91 + 80))+ *(_QWORD *)(v91 + 72) * v57, v16, v92);
      v124 = v55;
      v22 = v116 + v89;
      v18 = v58 - 1;
    }
    while (v18);
    swift_bridgeObjectRelease(v80[0]);
    v19 = (_OWORD *)&unk_1000B1000;
  }
  else
  {
    swift_bridgeObjectRelease(v17);
    v55 = _swiftEmptyArrayStorage;
  }
  sub_1000076D8(0, &qword_1000ECA68, (uint64_t (*)(uint64_t))&type metadata accessor for ArrayDataSourceSection, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v60 = v59;
  v61 = type metadata accessor for ArrayDataSourceSection(0);
  v62 = swift_allocObject(v60, ((*(unsigned __int8 *)(*(_QWORD *)(v61 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v61 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v61 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v61 - 8) + 80) | 7);
  *(_OWORD *)(v62 + 16) = v19[31];
  v63 = sub_1000A6048((uint64_t)v55);
  swift_bridgeObjectRelease(v55);
  v64 = v110;
  v66 = UUID.init()(v65);
  v67 = UUID.uuidString.getter(v66);
  v69 = v68;
  v70 = *(void (**)(char *, uint64_t))(v109 + 8);
  v71 = v111;
  v70(v64, v111);
  v72 = ArrayDataSourceSection.init(title:arrangedItems:identifier:)(0x207962207473694CLL, 0xEC000000646E694BLL, v63, v67, v69);
  v120 = 0x3C53447961727241;
  v121 = 0xE800000000000000;
  v73 = UUID.init()(v72);
  v74 = UUID.uuidString.getter(v73);
  v76 = v75;
  v70(v64, v71);
  v77._countAndFlagsBits = v74;
  v77._object = v76;
  String.append(_:)(v77);
  swift_bridgeObjectRelease(v76);
  v78._countAndFlagsBits = 62;
  v78._object = (void *)0xE100000000000000;
  String.append(_:)(v78);
  return ArrayDataSource.init(arrangedSections:identifier:)(v62, v120, v121);
}

void sub_1000A6E8C(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;

  sub_1000076D8(0, &qword_1000ED1D0, (uint64_t (*)(uint64_t))&type metadata accessor for ContentKind, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v5 = v4;
  v6 = type metadata accessor for ContentKind(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = (v8 + 32) & ~v8;
  v10 = swift_allocObject(v5, v9 + *(_QWORD *)(v7 + 72), v8 | 7);
  *(_OWORD *)(v10 + 16) = xmmword_1000B11F0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v10 + v9, a2, v6);
  v11 = objc_allocWithZone((Class)type metadata accessor for InternalFeedItemListViewController(0));
  v12 = (id)InternalFeedItemListViewController.init(contentKinds:)(v10);
  objc_msgSend(a1, "showViewController:sender:", v12, 0);

}

void sub_1000A6F74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000A6FA4(a1, a2, a3, (uint64_t)"init(_:identifier:)", 19);
}

void sub_1000A6F8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000A6FA4(a1, a2, a3, (uint64_t)"init(arrangedSections:identifier:)", 34);
}

void sub_1000A6FA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _swift_stdlib_reportUnimplementedInitializer("Health.ContentKindDataSource", 28, a4, a5, 0);
  __break(1u);
}

uint64_t sub_1000A6FCC()
{
  return type metadata accessor for ContentKindDataSource(0);
}

unint64_t sub_1000A6FD4@<X0>(uint64_t a1@<X3>, uint64_t *a2@<X8>)
{
  swift_getWitnessTable(&unk_1000B6F38, a1);
  return sub_1000213F0(a2);
}

uint64_t sub_1000A7040(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_1000B6F38, a2);
  return sub_100020F3C(a1, a2, WitnessTable);
}

uint64_t sub_1000A7090(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_100013198(&qword_1000F08E8, type metadata accessor for ContentKindDataSource, (uint64_t)&unk_1000B6EE0);
  result = sub_100013198(&qword_1000F08F0, type metadata accessor for ContentKindDataSource, (uint64_t)&unk_1000B6F10);
  *(_QWORD *)(a1 + 24) = result;
  return result;
}

uint64_t sub_1000A70EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for ContentKind(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_1000A714C(void *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ContentKind(0) - 8) + 80);
  sub_1000A6E8C(a1, v1 + ((v3 + 16) & ~v3));
}

uint64_t sub_1000A7188(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t result;
  uint64_t v7;

  result = *a2;
  if (!*a2)
  {
    v7 = a3(255);
    result = a4(v7);
    atomic_store(result, a2);
  }
  return result;
}

uint64_t type metadata accessor for AllFeedItemsDataSource(uint64_t a1)
{
  uint64_t result;

  result = qword_1000F0900;
  if (!qword_1000F0900)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for AllFeedItemsDataSource);
  return result;
}

uint64_t sub_1000A7200(uint64_t a1)
{
  _BYTE v2[8];

  return swift_initClassMetadata2(a1, 0, 0, v2, a1 + qword_1000F1330);
}

uint64_t sub_1000A723C()
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
  uint64_t v10;
  uint64_t v11;
  char *v12;
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
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  _QWORD *v29;
  id v30;
  void (*v31)(_BYTE *, _QWORD);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  Swift::String v53;
  Swift::String v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  __int128 v73;
  _BYTE v74[32];
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  void *v78;

  v0 = type metadata accessor for SectionedDataSourceContainerViewType(0);
  v71 = *(_QWORD *)(v0 - 8);
  v72 = v0;
  __chkstk_darwin(v0);
  v70 = (char *)&v56 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000076D8(0, &qword_1000ECA60, (uint64_t (*)(uint64_t))&type metadata accessor for UIBackgroundConfiguration, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v2);
  v69 = (char *)&v56 - v3;
  v68 = type metadata accessor for CellDeselectionBehavior(0);
  v66 = *(_QWORD *)(v68 - 8);
  __chkstk_darwin(v68);
  v65 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000076D8(0, &qword_1000ECCD8, (uint64_t (*)(uint64_t))&type metadata accessor for UICellAccessory.LayoutDimension, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v5);
  v61 = (char *)&v56 - v6;
  v63 = type metadata accessor for UICellAccessory.DisclosureIndicatorOptions(0);
  v62 = *(_QWORD *)(v63 - 8);
  __chkstk_darwin(v63);
  v8 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for UICellAccessory.DisplayedState(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for UUID(0);
  v14 = *(_QWORD *)(v13 - 8);
  v60 = v13;
  __chkstk_darwin(v13);
  v16 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000076D8(0, &qword_1000ECA68, (uint64_t (*)(uint64_t))&type metadata accessor for ArrayDataSourceSection, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v18 = v17;
  v19 = *(_QWORD *)(type metadata accessor for ArrayDataSourceSection(0) - 8);
  v20 = *(_QWORD *)(v19 + 72);
  v21 = *(unsigned __int8 *)(v19 + 80);
  v22 = (v21 + 32) & ~v21;
  v23 = swift_allocObject(v18, v22 + v20, v21 | 7);
  v73 = xmmword_1000B11F0;
  v67 = v23;
  *(_OWORD *)(v23 + 16) = xmmword_1000B11F0;
  v64 = v23 + v22;
  sub_1000076D8(0, (unint64_t *)&qword_1000ECA70, (uint64_t (*)(uint64_t))sub_100013434, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v25 = swift_allocObject(v24, 72, 7);
  *(_OWORD *)(v25 + 16) = v73;
  *(_QWORD *)(v25 + 56) = type metadata accessor for ContentConfigurationItem(0);
  *(_QWORD *)(v25 + 64) = sub_100013198(&qword_1000ECA80, (uint64_t (*)(uint64_t))&type metadata accessor for ContentConfigurationItem, (uint64_t)&protocol conformance descriptor for ContentConfigurationItem);
  v59 = sub_100007E0C((_QWORD *)(v25 + 32));
  v26 = UUID.init()(v59);
  v58 = UUID.uuidString.getter(v26);
  v57 = v27;
  v28 = *(void (**)(char *, uint64_t))(v14 + 8);
  v28(v16, v13);
  v77 = type metadata accessor for UIListContentConfiguration(0);
  v78 = &protocol witness table for UIListContentConfiguration;
  v29 = sub_100007E0C(&v75);
  static UIListContentConfiguration.cell()(v29);
  UIListContentConfiguration.text.setter(0x64656546206C6C41, 0xEE00736D65744920);
  v30 = objc_msgSend((id)objc_opt_self(UIColor), "blackColor");
  v31 = (void (*)(_BYTE *, _QWORD))UIListContentConfiguration.textProperties.modify(v74);
  UIListContentConfiguration.TextProperties.color.setter(v30);
  v31(v74, 0);
  sub_1000076D8(0, &qword_1000ECCE0, (uint64_t (*)(uint64_t))&type metadata accessor for UICellAccessory, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v33 = v32;
  v34 = type metadata accessor for UICellAccessory(0);
  v35 = swift_allocObject(v33, ((*(unsigned __int8 *)(*(_QWORD *)(v34 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v34 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v34 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v34 - 8) + 80) | 7);
  *(_OWORD *)(v35 + 16) = v73;
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, enum case for UICellAccessory.DisplayedState.always(_:), v9);
  v36 = type metadata accessor for UICellAccessory.LayoutDimension(0);
  v37 = v61;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v61, 1, 1, v36);
  UICellAccessory.DisclosureIndicatorOptions.init(isHidden:reservedLayoutWidth:tintColor:)(2, v37, 0);
  static UICellAccessory.disclosureIndicator(displayed:options:)(v12, v8);
  (*(void (**)(char *, uint64_t))(v62 + 8))(v8, v63);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v38 = v65;
  (*(void (**)(char *, _QWORD, uint64_t))(v66 + 104))(v65, enum case for CellDeselectionBehavior.default(_:), v68);
  v39 = type metadata accessor for UIBackgroundConfiguration(0);
  v40 = v69;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v69, 1, 1, v39);
  v41 = v70;
  (*(void (**)(char *, _QWORD, uint64_t))(v71 + 104))(v70, enum case for SectionedDataSourceContainerViewType.collectionView(_:), v72);
  v42 = ContentConfigurationItem.init(uniqueIdentifier:contentConfiguration:cellAccessories:cellSelectionHandler:deselectionBehavior:backgroundConfiguration:updateContentConfigurationHandler:container:automationIdentifier:)(v58, v57, &v75, v35, sub_1000A7874, 0, v38, v40, 0, 0, v41, 0, 0);
  v43 = UUID.init()(v42);
  v44 = UUID.uuidString.getter(v43);
  v46 = v45;
  v47 = v60;
  v28(v16, v60);
  v48 = ArrayDataSourceSection.init(title:arrangedItems:identifier:)(0x6574492064656546, 0xE90000000000006DLL, v25, v44, v46);
  v75 = 0x3C53447961727241;
  v76 = 0xE800000000000000;
  v49 = UUID.init()(v48);
  v50 = UUID.uuidString.getter(v49);
  v52 = v51;
  v28(v16, v47);
  v53._countAndFlagsBits = v50;
  v53._object = v52;
  String.append(_:)(v53);
  swift_bridgeObjectRelease(v52);
  v54._countAndFlagsBits = 62;
  v54._object = (void *)0xE100000000000000;
  String.append(_:)(v54);
  return ArrayDataSource.init(arrangedSections:identifier:)(v67, v75, v76);
}

void sub_1000A7874(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];

  v10[3] = type metadata accessor for DiskHealthExperienceStore(0);
  v10[4] = &protocol witness table for DiskHealthExperienceStore;
  v10[0] = static DiskHealthExperienceStore.shared.getter();
  v2 = type metadata accessor for AllFeedItemsListDataSourceProvider(0);
  swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
  v3 = AllFeedItemsListDataSourceProvider.init(for:)(v10);
  v4 = dispatch thunk of AllFeedItemsListDataSourceProvider.selectedDataSources(for:)(a1);
  v5 = type metadata accessor for CompoundSectionedDataSource(0);
  swift_allocObject(v5, *(unsigned int *)(v5 + 48), *(unsigned __int16 *)(v5 + 52));
  v6 = CompoundSectionedDataSource.init(_:)(v4);
  v7 = objc_allocWithZone((Class)type metadata accessor for CompoundDataSourceCollectionViewController(0));
  v8 = swift_retain(v6);
  v9 = (id)CompoundDataSourceCollectionViewController.init(dataSource:)(v8);
  objc_msgSend(a1, "showViewController:sender:", v9, 0);
  swift_release(v3);
  swift_release(v6);

}

void sub_1000A7968(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000A7998(a1, a2, a3, (uint64_t)"init(_:identifier:)", 19);
}

void sub_1000A7980(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000A7998(a1, a2, a3, (uint64_t)"init(arrangedSections:identifier:)", 34);
}

void sub_1000A7998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _swift_stdlib_reportUnimplementedInitializer("Health.AllFeedItemsDataSource", 29, a4, a5, 0);
  __break(1u);
}

uint64_t sub_1000A79C0()
{
  return type metadata accessor for AllFeedItemsDataSource(0);
}

unint64_t sub_1000A79C8@<X0>(uint64_t a1@<X3>, uint64_t *a2@<X8>)
{
  swift_getWitnessTable(&unk_1000B6FE8, a1);
  return sub_1000213F0(a2);
}

uint64_t sub_1000A7A34(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_1000B6FE8, a2);
  return sub_100020F3C(a1, a2, WitnessTable);
}

uint64_t sub_1000A7A84(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_100013198(&qword_1000F0950, type metadata accessor for AllFeedItemsDataSource, (uint64_t)&unk_1000B6F90);
  result = sub_100013198(&qword_1000F0958, type metadata accessor for AllFeedItemsDataSource, (uint64_t)&unk_1000B6FC0);
  *(_QWORD *)(a1 + 24) = result;
  return result;
}

uint64_t type metadata accessor for UserDefaultsDataSource(uint64_t a1)
{
  uint64_t result;

  result = qword_1000F0960;
  if (!qword_1000F0960)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for UserDefaultsDataSource);
  return result;
}

uint64_t sub_1000A7B1C(uint64_t a1)
{
  _BYTE v2[8];

  return swift_initClassMetadata2(a1, 0, 0, v2, a1 + qword_1000F1340);
}

uint64_t sub_1000A7B58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
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
  void (*v27)(char *, uint64_t);
  _QWORD *v28;
  id v29;
  void (*v30)(_BYTE *, _QWORD);
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  Swift::String v43;
  Swift::String v44;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE v56[32];
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  void *v60;

  v0 = type metadata accessor for SectionedDataSourceContainerViewType(0);
  v54 = *(_QWORD *)(v0 - 8);
  v55 = v0;
  __chkstk_darwin(v0);
  v52 = (char *)&v46 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000076D8(0, &qword_1000ECA60, (uint64_t (*)(uint64_t))&type metadata accessor for UIBackgroundConfiguration, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v2);
  v4 = (char *)&v46 - v3;
  v5 = type metadata accessor for CellDeselectionBehavior(0);
  v49 = *(_QWORD *)(v5 - 8);
  v50 = v5;
  __chkstk_darwin(v5);
  v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000076D8(0, &qword_1000ECA68, (uint64_t (*)(uint64_t))&type metadata accessor for ArrayDataSourceSection, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v13 = v12;
  v14 = *(_QWORD *)(type metadata accessor for ArrayDataSourceSection(0) - 8);
  v15 = *(_QWORD *)(v14 + 72);
  v16 = *(unsigned __int8 *)(v14 + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = swift_allocObject(v13, v17 + v15, v16 | 7);
  v48 = xmmword_1000B11F0;
  v53 = v18;
  *(_OWORD *)(v18 + 16) = xmmword_1000B11F0;
  v51 = v18 + v17;
  sub_1000076D8(0, (unint64_t *)&qword_1000ECA70, (uint64_t (*)(uint64_t))sub_100013434, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v20 = swift_allocObject(v19, 72, 7);
  *(_OWORD *)(v20 + 16) = v48;
  type metadata accessor for HealthAppPluginSource(0);
  v21 = static HealthAppPluginSource.disabledHealthPluginsDefaultsKey.getter();
  v23 = v22;
  *(_QWORD *)(v20 + 56) = type metadata accessor for ContentConfigurationItem(0);
  *(_QWORD *)(v20 + 64) = sub_100013198(&qword_1000ECA80, (uint64_t (*)(uint64_t))&type metadata accessor for ContentConfigurationItem, (uint64_t)&protocol conformance descriptor for ContentConfigurationItem);
  *(_QWORD *)&v48 = sub_100007E0C((_QWORD *)(v20 + 32));
  v24 = UUID.init()(v48);
  v25 = UUID.uuidString.getter(v24);
  v46 = v26;
  v47 = v25;
  v27 = *(void (**)(char *, uint64_t))(v9 + 8);
  v27(v11, v8);
  v59 = type metadata accessor for UIListContentConfiguration(0);
  v60 = &protocol witness table for UIListContentConfiguration;
  v28 = sub_100007E0C(&v57);
  static UIListContentConfiguration.cell()(v28);
  swift_bridgeObjectRetain(v23);
  UIListContentConfiguration.text.setter(v21, v23);
  v29 = objc_msgSend((id)objc_opt_self(UIColor), "tintColor");
  v30 = (void (*)(_BYTE *, _QWORD))UIListContentConfiguration.textProperties.modify(v56);
  UIListContentConfiguration.TextProperties.color.setter(v29);
  v30(v56, 0);
  *v7 = 1;
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v49 + 104))(v7, enum case for CellDeselectionBehavior.deselectOnDidSelect(_:), v50);
  swift_bridgeObjectRelease(v23);
  v31 = type metadata accessor for UIBackgroundConfiguration(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v4, 1, 1, v31);
  v32 = v52;
  (*(void (**)(char *, _QWORD, uint64_t))(v54 + 104))(v52, enum case for SectionedDataSourceContainerViewType.collectionView(_:), v55);
  v33 = ContentConfigurationItem.init(uniqueIdentifier:contentConfiguration:cellAccessories:cellSelectionHandler:deselectionBehavior:backgroundConfiguration:updateContentConfigurationHandler:container:automationIdentifier:)(v47, v46, &v57, _swiftEmptyArrayStorage, sub_1000A7FAC, 0, v7, v4, 0, 0, v32, 0, 0);
  v34 = UUID.init()(v33);
  v35 = UUID.uuidString.getter(v34);
  v37 = v36;
  v27(v11, v8);
  v38 = ArrayDataSourceSection.init(title:arrangedItems:identifier:)(0x6665442072657355, 0xED000073746C7561, v20, v35, v37);
  v57 = 0x3C53447961727241;
  v58 = 0xE800000000000000;
  v39 = UUID.init()(v38);
  v40 = UUID.uuidString.getter(v39);
  v42 = v41;
  v27(v11, v8);
  v43._countAndFlagsBits = v40;
  v43._object = v42;
  String.append(_:)(v43);
  swift_bridgeObjectRelease(v42);
  v44._countAndFlagsBits = 62;
  v44._object = (void *)0xE100000000000000;
  String.append(_:)(v44);
  return ArrayDataSource.init(arrangedSections:identifier:)(v53, v57, v58);
}

void sub_1000A7FAC(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  NSString v9;
  id v10;
  NSString v11;
  id v12;

  type metadata accessor for HealthAppPluginSource(0);
  static HealthAppPluginSource.disabledHealthPluginsDefaultsKey.getter();
  v3 = v2;
  type metadata accessor for FoundationPluginBundleProvider(0);
  v4 = static FoundationPluginBundleProvider.sharedInstance.getter();
  v5 = dispatch thunk of PluginBundleProvider.disabledPlugins.getter();
  swift_release(v4);
  Array.description.getter(v5, &type metadata for String);
  v7 = v6;
  swift_bridgeObjectRelease(v5);
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  v10 = objc_msgSend((id)objc_opt_self(UIAlertController), "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1);

  v11 = String._bridgeToObjectiveC()();
  v12 = objc_msgSend((id)objc_opt_self(UIAlertAction), "actionWithTitle:style:handler:", v11, 0, 0);

  objc_msgSend(v10, "addAction:", v12);
  objc_msgSend(a1, "presentViewController:animated:completion:", v10, 1, 0);

}

void sub_1000A8120(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000A8150(a1, a2, a3, (uint64_t)"init(_:identifier:)", 19);
}

void sub_1000A8138(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000A8150(a1, a2, a3, (uint64_t)"init(arrangedSections:identifier:)", 34);
}

void sub_1000A8150(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _swift_stdlib_reportUnimplementedInitializer("Health.UserDefaultsDataSource", 29, a4, a5, 0);
  __break(1u);
}

uint64_t sub_1000A8178()
{
  return type metadata accessor for UserDefaultsDataSource(0);
}

unint64_t sub_1000A8180@<X0>(uint64_t a1@<X3>, uint64_t *a2@<X8>)
{
  swift_getWitnessTable(&unk_1000B7098, a1);
  return sub_1000213F0(a2);
}

uint64_t sub_1000A81EC(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_1000B7098, a2);
  return sub_100020F3C(a1, a2, WitnessTable);
}

uint64_t sub_1000A823C(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_100013198(&qword_1000F09B0, type metadata accessor for UserDefaultsDataSource, (uint64_t)&unk_1000B7040);
  result = sub_100013198(&qword_1000F09B8, type metadata accessor for UserDefaultsDataSource, (uint64_t)&unk_1000B7070);
  *(_QWORD *)(a1 + 24) = result;
  return result;
}

uint64_t type metadata accessor for MainSidebarViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_1000F09E0;
  if (!qword_1000F09E0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MainSidebarViewController);
  return result;
}

void sub_1000A82D4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD v7[7];

  v2 = qword_1000F1368;
  v3 = type metadata accessor for Presentation(319);
  if (v4 <= 0x3F)
  {
    v7[0] = *(_QWORD *)(v3 - 8) + 64;
    v7[1] = &unk_1000B7110;
    v7[2] = &unk_1000B7128;
    v7[3] = &unk_1000B7140;
    v7[4] = &unk_1000B7158;
    sub_1000227D0();
    if (v6 <= 0x3F)
    {
      v7[5] = *(_QWORD *)(v5 - 8) + 64;
      v7[6] = &unk_1000B7158;
      swift_initClassMetadata2(a1, 0, 7, v7, a1 + v2);
    }
  }
}

void sub_1000A8394(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  double v11;
  uint64_t v12;
  char *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v24;
  id v25;
  void *v26;
  id v27;
  _QWORD *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  void (*v33)(char *, uint64_t, uint64_t, uint64_t);
  id v34;
  void *v35;
  Class isa;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  id v41;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000076D8(0, (unint64_t *)&unk_1000F0B20, v9, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v10);
  v13 = (char *)&v38 - v12;
  v41 = v2;
  v14 = (uint64_t *)&v2[qword_1000F1360];
  v16 = *(_QWORD *)&v2[qword_1000F1360];
  v15 = *(_QWORD *)&v2[qword_1000F1360 + 8];
  if (a2)
  {
    if (!v15)
      goto LABEL_20;
    v17 = v16 == a1 && v15 == a2;
    if (v17
      || (_stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, *(_QWORD *)&v2[qword_1000F1360], *(_QWORD *)&v2[qword_1000F1360 + 8], 0) & 1) != 0)
    {
      return;
    }
  }
  else if (!v15)
  {
    return;
  }
  v18 = swift_bridgeObjectRetain(v15);
  v19 = dispatch thunk of CompoundDataSourceCollectionViewController.dataSource.getter(v18);
  v20 = dispatch thunk of CompoundSectionedDataSource.firstFullIdentifier(itemIdentifier:)(v16, v15);
  v22 = v21;
  swift_release(v19);
  if (v22)
  {
    if (v16 != v20 || v22 != v15)
    {
      v24 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v15, v20, v22, 0);
      swift_bridgeObjectRelease(v15);
      if ((v24 & 1) != 0)
      {
LABEL_18:
        sub_1000A9C58(v20, v22, 1, 2);
        swift_bridgeObjectRelease(v22);
        return;
      }
      v15 = v14[1];
      *v14 = v20;
      v14[1] = v22;
      swift_bridgeObjectRetain(v22);
    }
    swift_bridgeObjectRelease(v15);
    goto LABEL_18;
  }
  *(_QWORD *)&v11 = swift_bridgeObjectRelease(v15).n128_u64[0];
LABEL_20:
  v25 = objc_msgSend(v41, "collectionView", v11);
  if (!v25)
  {
LABEL_35:
    __break(1u);
    return;
  }
  v26 = v25;
  v27 = objc_msgSend(v25, "indexPathsForSelectedItems");

  if (v27)
  {
    v28 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v27, v5);

    v29 = v28[2];
    if (v29)
      goto LABEL_23;
  }
  else
  {
    v28 = _swiftEmptyArrayStorage;
    v29 = _swiftEmptyArrayStorage[2];
    if (v29)
    {
LABEL_23:
      v30 = (char *)v28 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
      v31 = *(_QWORD *)(v6 + 72);
      v39 = v28;
      v40 = v31;
      v32 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
      while (1)
      {
        v32(v13, v30, v5);
        v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
        v33(v13, 0, 1, v5);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v13, 1, v5) == 1)
        {
          v37 = v39;
          goto LABEL_32;
        }
        (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v13, v5);
        v34 = objc_msgSend(v41, "collectionView");
        if (!v34)
          break;
        v35 = v34;
        isa = IndexPath._bridgeToObjectiveC()().super.isa;
        objc_msgSend(v35, "deselectItemAtIndexPath:animated:", isa, 1);

        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        v30 += v40;
        if (!--v29)
        {
          v28 = v39;
          goto LABEL_30;
        }
      }
      __break(1u);
      goto LABEL_35;
    }
  }
  v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
LABEL_30:
  v33(v13, 1, 1, v5);
  v37 = v28;
LABEL_32:
  swift_bridgeObjectRelease(v37);
}

uint64_t sub_1000A86F4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v13;

  sub_1000227D0();
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static NSDiffableDataSourceSnapshot._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, &type metadata for String, &protocol witness table for String, &protocol witness table for String);
  v11 = a1;
  sub_1000AA6D4((uint64_t)v10);

  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void sub_1000A87A8(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  sub_1000AA978();
}

id sub_1000A87CC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = qword_1000F09D8;
  v2 = *(void **)(v0 + qword_1000F09D8);
  if (v2)
  {
    v3 = *(id *)(v0 + qword_1000F09D8);
  }
  else
  {
    v4 = sub_1000A882C(v0);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_1000A882C(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  Swift::String v8;
  Swift::String v9;
  void *object;
  NSString v11;
  id v12;
  Swift::String v14;

  v2 = objc_msgSend(objc_allocWithZone((Class)UISearchController), "initWithSearchResultsController:", 0);
  objc_msgSend(v2, "setDelegate:", a1);
  v3 = objc_msgSend(v2, "searchBar");
  v4 = type metadata accessor for HackyUnfocusableUISearchTextField();
  objc_msgSend(v3, "_setClassForSearchTextField:", swift_getObjCClassFromMetadata(v4));

  v5 = objc_msgSend(v2, "searchBar");
  objc_msgSend(v5, "setDelegate:", a1);

  v6 = objc_msgSend(v2, "searchBar");
  v7 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v14._object = (void *)0x80000001000BF630;
  v8._countAndFlagsBits = 0x686372616553;
  v8._object = (void *)0xE600000000000000;
  v9._countAndFlagsBits = 0;
  v9._object = (void *)0xE000000000000000;
  v14._countAndFlagsBits = 0xD000000000000016;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v8, (Swift::String_optional)0, (NSBundle)v7, v9, v14)._object;

  v11 = String._bridgeToObjectiveC()();
  objc_msgSend(v6, "setPlaceholder:", v11, swift_bridgeObjectRelease(object).n128_f64[0]);

  v12 = objc_msgSend(v2, "navigationItem");
  objc_msgSend(v12, "setPreferredSearchBarPlacement:", 2);

  objc_msgSend(v2, "setHidesNavigationBarDuringPresentation:", 0);
  objc_msgSend(v2, "setAutomaticallyShowsCancelButton:", 0);
  return v2;
}

void sub_1000A8A14()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  objc_super v5;

  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for MainSidebarViewController(0);
  objc_msgSendSuper2(&v5, "viewDidLoad");
  dispatch thunk of CompoundDataSourceCollectionViewController.usesAdaptiveMargins.setter(0);
  objc_msgSend(v0, "setClearsSelectionOnViewWillAppear:", 0);
  v1 = objc_msgSend(v0, "collectionView");
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, "setPreservesSuperviewLayoutMargins:", 1);

    v3 = objc_msgSend(v0, "navigationItem");
    v4 = sub_1000A87CC();
    objc_msgSend(v3, "setSearchController:", v4);

  }
  else
  {
    __break(1u);
  }
}

void sub_1000A8AE4(void *a1)
{
  id v1;

  v1 = a1;
  sub_1000A8A14();

}

void sub_1000A8B18(char a1)
{
  char *v1;
  char *v2;
  id v4;
  void *v5;
  id v6;
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
  char v19;
  uint64_t v20;
  objc_super v21;

  v2 = v1;
  v21.receiver = v2;
  v21.super_class = (Class)type metadata accessor for MainSidebarViewController(0);
  objc_msgSendSuper2(&v21, "viewIsAppearing:", a1 & 1);
  v4 = objc_msgSend(v2, "collectionView");
  if (!v4)
  {
    __break(1u);
    return;
  }
  v5 = v4;
  v6 = objc_msgSend(v4, "indexPathsForSelectedItems");

  if (!v6
    || (v7 = type metadata accessor for IndexPath(0),
        v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, v7),
        v6,
        v9 = *(_QWORD *)(v8 + 16),
        swift_bridgeObjectRelease(v8),
        !v9))
  {
    v10 = (uint64_t *)&v2[qword_1000F1360];
    v11 = *(_QWORD *)&v2[qword_1000F1360 + 8];
    if (v11)
    {
      v12 = *v10;
      swift_bridgeObjectRetain(*(_QWORD *)&v2[qword_1000F1360 + 8]);
      v14 = dispatch thunk of CompoundDataSourceCollectionViewController.dataSource.getter(v13);
      v15 = dispatch thunk of CompoundSectionedDataSource.firstFullIdentifier(itemIdentifier:)(v12, v11);
      v17 = v16;
      swift_release(v14);
      if (!v17)
      {
        v17 = v11;
        goto LABEL_15;
      }
      if (v12 != v15 || v11 != v17)
      {
        v19 = _stringCompareWithSmolCheck(_:_:expecting:)(v12, v11, v15, v17, 0);
        swift_bridgeObjectRelease(v11);
        if ((v19 & 1) != 0)
        {
LABEL_13:
          sub_1000A9C58(v15, v17, 0, 0);
LABEL_15:
          swift_bridgeObjectRelease(v17);
          return;
        }
        v20 = *v10;
        v11 = v10[1];
        *v10 = v15;
        v10[1] = v17;
        swift_bridgeObjectRetain(v17);
        sub_1000A8394(v20, v11);
      }
      swift_bridgeObjectRelease(v11);
      goto LABEL_13;
    }
  }
}

void sub_1000A8CB8(void *a1, uint64_t a2, char a3)
{
  id v4;

  v4 = a1;
  sub_1000A8B18(a3);

}

void sub_1000A8CF8(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)type metadata accessor for MainSidebarViewController(0);
  v4 = v6.receiver;
  objc_msgSendSuper2(&v6, "viewWillAppear:", a3);
  v5 = objc_msgSend(v4, "navigationItem", v6.receiver, v6.super_class);
  objc_msgSend(v5, "setHidesSearchBarWhenScrolling:", 0);

}

void sub_1000A8D88(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)type metadata accessor for MainSidebarViewController(0);
  v4 = v6.receiver;
  objc_msgSendSuper2(&v6, "viewDidAppear:", a3);
  v5 = objc_msgSend(v4, "navigationItem", v6.receiver, v6.super_class);
  objc_msgSend(v5, "setHidesSearchBarWhenScrolling:", 1);

}

void sub_1000A8E18(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)type metadata accessor for MainSidebarViewController(0);
  v4 = a3;
  v5 = v8.receiver;
  objc_msgSendSuper2(&v8, "traitCollectionDidChange:", v4);
  v6 = objc_msgSend(v5, "navigationItem", v8.receiver, v8.super_class);
  v7 = sub_1000A87CC();
  objc_msgSend(v6, "setSearchController:", v7);

}

void sub_1000A8EC4()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void (*v3)(void);
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v1 = v0;
  v2 = type metadata accessor for CollapsibleListCollectionViewController(0);
  v3 = (void (*)(void))method lookup function for CompoundDataSourceCollectionViewController(v2, &method descriptor for CompoundDataSourceCollectionViewController.registerReusableCollectionViewTypes());
  v3();
  v4 = objc_msgSend(v0, "collectionView");
  if (v4)
  {
    v5 = v4;
    v6 = type metadata accessor for SidebarListCell(0);
    UICollectionView.registerCell<A>(_:)(v6, v6, &protocol witness table for SidebarListCell);

    v8 = objc_msgSend(v1, "collectionView");
    if (v8)
    {
      v7 = type metadata accessor for CollectionViewHeaderCell(0);
      UICollectionView.registerCell<A>(_:)(v7, v7, &protocol witness table for CollectionViewHeaderCell);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1000A8F88(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v17;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a1;
  v13 = sub_1000A87CC();
  v14 = objc_msgSend(v13, "searchBar");

  v15 = objc_msgSend(v14, "searchTextField");
  LODWORD(v14) = objc_msgSend(v15, "isEditing");

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14 ^ 1;
}

unint64_t sub_1000A9098(void *a1, uint64_t a2)
{
  char *v2;
  char *v3;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(char *, uint64_t);
  uint64_t v28;
  unint64_t result;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __n128 v33;
  uint64_t v34;
  __n128 v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  unint64_t v42;
  Class isa;
  objc_class *v44;
  id v45;
  uint64_t v46;
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
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  id v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  void (*v71)(char *, uint64_t);
  Class v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  void (*v77)(char *, uint64_t);
  char *v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  _QWORD v82[3];
  uint64_t v83;
  uint64_t v84;
  _QWORD v85[5];
  objc_super v86;

  v3 = v2;
  v81 = a1;
  sub_1000076D8(0, (unint64_t *)&unk_1000F0B20, (uint64_t (*)(uint64_t))&type metadata accessor for IndexPath, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v5);
  v78 = (char *)&v75 - v6;
  v7 = type metadata accessor for IndexPath(0);
  v79 = *(_QWORD *)(v7 - 8);
  v80 = v7;
  v8 = __chkstk_darwin(v7);
  v75 = (char *)&v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v76 = (char *)&v75 - v10;
  sub_1000076D8(0, &qword_1000F0B30, (uint64_t (*)(uint64_t))&type metadata accessor for CellDeselectionBehavior, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v11);
  v13 = (char *)&v75 - v12;
  sub_1000227D0();
  v15 = v14;
  v16 = *(_QWORD *)(v14 - 8);
  v17 = __chkstk_darwin(v14);
  v19 = (char *)&v75 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __chkstk_darwin(v17);
  v22 = (char *)&v75 - v21;
  v23 = dispatch thunk of CompoundDataSourceCollectionViewController.dataSource.getter(v20);
  dispatch thunk of CompoundSectionedDataSource.snapshot.getter();
  v24 = swift_release(v23);
  v25 = dispatch thunk of CompoundDataSourceCollectionViewController.dataSource.getter(v24);
  dispatch thunk of CompoundSectionedDataSource.snapshot.getter();
  swift_release(v25);
  v26 = NSDiffableDataSourceSnapshot.sectionIdentifiers.getter(v15);
  v27 = *(uint64_t (**)(char *, uint64_t))(v16 + 8);
  v28 = v27(v19, v15);
  result = IndexPath.section.getter(v28);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_31;
  }
  if (result >= *(_QWORD *)(v26 + 16))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v30 = v26 + 16 * result;
  v31 = *(_QWORD *)(v30 + 32);
  v32 = *(_QWORD *)(v30 + 40);
  swift_bridgeObjectRetain(v32);
  v33 = swift_bridgeObjectRelease(v26);
  v85[0] = v31;
  v85[1] = v32;
  v34 = NSDiffableDataSourceSnapshot.itemIdentifiers(inSection:)(v85, v15, v33);
  v35 = swift_bridgeObjectRelease(v32);
  v36 = ((uint64_t (*)(char *, uint64_t, __n128))v27)(v22, v15, v35);
  result = IndexPath.item.getter(v36);
  if ((result & 0x8000000000000000) != 0)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  if (result >= *(_QWORD *)(v34 + 16))
  {
LABEL_33:
    __break(1u);
    return result;
  }
  v77 = (void (*)(char *, uint64_t))v27;
  v37 = v34 + 16 * result;
  v39 = *(_QWORD *)(v37 + 32);
  v38 = *(_QWORD *)(v37 + 40);
  swift_bridgeObjectRetain(v38);
  swift_bridgeObjectRelease(v34);
  v40 = (uint64_t *)&v3[qword_1000F1360];
  v41 = *(_QWORD *)&v3[qword_1000F1360 + 8];
  if (!v41
    || (*v40 != v39 || v41 != v38) && (_stringCompareWithSmolCheck(_:_:expecting:)(*v40, v41, v39, v38, 0) & 1) == 0)
  {
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    v44 = (objc_class *)type metadata accessor for MainSidebarViewController(0);
    v86.receiver = v3;
    v86.super_class = v44;
    v45 = v81;
    objc_msgSendSuper2(&v86, "collectionView:didSelectItemAtIndexPath:", v81, isa);

    CompoundDataSourceCollectionViewController.selectableHandler(in:at:)(v85, v45, a2);
    sub_1000AAE7C((uint64_t)v85, (uint64_t)v82);
    v46 = v83;
    if (v83)
    {
      v47 = v84;
      sub_100012E04(v82, v83);
      dispatch thunk of CellSelectionHandling.deselectionBehavior(in:)(v3, v46, v47);
      v48 = type metadata accessor for CellDeselectionBehavior(0);
      v49 = *(_QWORD *)(v48 - 8);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v49 + 56))(v13, 0, 1, v48);
      _s6Health23OpenSleepScheduleIntentVwxx_0(v82);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48))(v13, 1, v48) != 1)
      {
        if ((*(unsigned int (**)(char *, uint64_t))(v49 + 88))(v13, v48) == enum case for CellDeselectionBehavior.deselectOnDidSelect(_:))
        {
          swift_bridgeObjectRelease(v38);
          v50 = v40[1];
          if (v50)
          {
            v51 = *v40;
            swift_bridgeObjectRetain(v40[1]);
            v53 = dispatch thunk of CompoundDataSourceCollectionViewController.dataSource.getter(v52);
            dispatch thunk of CompoundSectionedDataSource.snapshot.getter();
            swift_release(v53);
            v82[0] = v51;
            v82[1] = v50;
            v54 = (uint64_t)v78;
            NSDiffableDataSourceSnapshot.indexPath(for:)(v82, v15);
            v77(v22, v15);
            v55 = swift_bridgeObjectRelease(v50);
            v56 = v79;
            v57 = v80;
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, __n128))(v79 + 48))(v54, 1, v80, v55) == 1)
            {
              sub_10001EDAC(v54, (unint64_t *)&unk_1000F0B20, (uint64_t (*)(uint64_t))&type metadata accessor for IndexPath);
            }
            else
            {
              v62 = v76;
              v63 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v56 + 32))(v76, v54, v57);
              v64 = IndexPath.section.getter(v63);
              v65 = v81;
              v66 = objc_msgSend(v81, "numberOfSections");
              v67 = v75;
              v68 = (*(uint64_t (**)(char *, char *, uint64_t))(v56 + 16))(v75, v62, v57);
              if (v64 >= (uint64_t)v66)
              {
                v71 = *(void (**)(char *, uint64_t))(v56 + 8);
                v71(v67, v57);
              }
              else
              {
                v69 = IndexPath.item.getter(v68);
                v70 = objc_msgSend(v65, "numberOfItemsInSection:", IndexPath.section.getter(v69));
                v71 = *(void (**)(char *, uint64_t))(v56 + 8);
                v71(v67, v57);
                if (v69 < (uint64_t)v70)
                {
                  v72 = IndexPath._bridgeToObjectiveC()().super.isa;
                  objc_msgSend(v65, "selectItemAtIndexPath:animated:scrollPosition:", v72, 1, 0);

                  v71(v62, v57);
                  return sub_1000AAED8((uint64_t)v85, &qword_1000EEC68, &qword_1000EEC60, (uint64_t)&protocol descriptor for CellSelectionHandling);
                }
              }
              v71(v62, v57);
            }
          }
          v73 = *v40;
          v74 = v40[1];
          *v40 = 0;
          v40[1] = 0;
          sub_1000A8394(v73, v74);
          v61 = v74;
LABEL_20:
          swift_bridgeObjectRelease(v61);
          return sub_1000AAED8((uint64_t)v85, &qword_1000EEC68, &qword_1000EEC60, (uint64_t)&protocol descriptor for CellSelectionHandling);
        }
        (*(void (**)(char *, uint64_t))(v49 + 8))(v13, v48);
LABEL_19:
        v59 = *v40;
        v60 = v40[1];
        *v40 = v39;
        v40[1] = v38;
        sub_1000A8394(v59, v60);
        v61 = v60;
        goto LABEL_20;
      }
    }
    else
    {
      sub_1000AAED8((uint64_t)v82, &qword_1000EEC68, &qword_1000EEC60, (uint64_t)&protocol descriptor for CellSelectionHandling);
      v58 = type metadata accessor for CellDeselectionBehavior(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 56))(v13, 1, 1, v58);
    }
    sub_10001EDAC((uint64_t)v13, &qword_1000F0B30, (uint64_t (*)(uint64_t))&type metadata accessor for CellDeselectionBehavior);
    goto LABEL_19;
  }
  swift_bridgeObjectRelease(v38);
  result = swift_unknownObjectWeakLoadStrong(&v3[qword_1000F1358]);
  if (result)
  {
    v42 = result;
    sub_10004D9A0();
    return swift_unknownObjectRelease(v42);
  }
  return result;
}

uint64_t sub_1000A96E8(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a1;
  sub_1000A9098(v11, (uint64_t)v10);

  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_1000A9798(char *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;
  char *v8;
  uint64_t v9;
  id v10;
  char *v11;
  uint64_t Strong;
  uint64_t v13;
  _OWORD v15[2];

  if (a4)
  {
    v7 = a3;
    v8 = a1;
    v9 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v15, v9);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v15, 0, sizeof(v15));
    v10 = a3;
    v11 = a1;
  }
  Strong = swift_unknownObjectWeakLoadStrong(&a1[qword_1000F1358]);
  if (Strong)
  {
    v13 = Strong;
    sub_10005001C(a3);

    swift_unknownObjectRelease(v13);
  }
  else
  {

  }
  return sub_1000AADE8((uint64_t)v15);
}

double sub_1000A9848(void *a1)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  double result;
  _QWORD *v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  __objc2_prot *v57;
  _QWORD v58[2];
  uint64_t v59;

  v2 = v1;
  sub_1000227D0();
  v5 = v4;
  v56 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v55 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000076D8(0, (unint64_t *)&unk_1000F0B20, (uint64_t (*)(uint64_t))&type metadata accessor for IndexPath, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v7);
  v9 = (char *)&v51 - v8;
  sub_1000076D8(0, (unint64_t *)&unk_1000F0B40, (uint64_t (*)(uint64_t))sub_1000AAFB8, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v11 = swift_allocObject(v10, 40, 7);
  *(_OWORD *)(v11 + 16) = xmmword_1000B11F0;
  *(_QWORD *)(v11 + 32) = a1;
  v58[0] = v11;
  specialized Array._endMutation()(v11);
  v12 = v58[0];
  v59 = v58[0];
  if (a1)
  {
    v13 = objc_opt_self(UINavigationController);
    v14 = swift_dynamicCastObjCClass(a1, v13);
    v15 = a1;
    if (v14)
    {
      v16 = (unint64_t)UINavigationController.rootViewController()();
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v16);
      v18 = *(_QWORD *)(v59 + 16);
      v17 = *(_QWORD *)(v59 + 24);
      if (v18 >= v17 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v17 > 1, v18 + 1, 1);
      v19 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v18, v16);
      specialized Array._endMutation()(v19);
      v12 = v59;
    }
  }
  v20 = *(_QWORD *)(v12 + 16);
  if (v20)
  {
    v52 = v5;
    v53 = v9;
    v54 = v2;
    swift_bridgeObjectRetain_n(v12, 2);
    v21 = 0;
    v22 = _swiftEmptyArrayStorage;
    do
    {
      v23 = *(void **)(v12 + 8 * v21 + 32);
      if (v23)
      {
        v57 = &OBJC_PROTOCOL___HKSidebarSelectionIdentifierProviding;
        v24 = swift_dynamicCastObjCProtocolConditional(v23, 1, &v57);
        if (v24)
        {
          v25 = (void *)v24;
          v26 = v23;
          v27 = objc_msgSend(v25, "sidebarSelectionIdentifier");
          if (v27)
          {
            v28 = v27;
            v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
            v31 = v30;

            if ((swift_isUniquelyReferenced_nonNull_native(v22) & 1) == 0)
              v22 = sub_100029E64(0, v22[2] + 1, 1, v22);
            v33 = v22[2];
            v32 = v22[3];
            if (v33 >= v32 >> 1)
              v22 = sub_100029E64((_QWORD *)(v32 > 1), v33 + 1, 1, v22);
            v22[2] = v33 + 1;
            v34 = &v22[2 * v33];
            v34[4] = v29;
            v34[5] = v31;
          }
          else
          {

          }
        }
      }
      ++v21;
    }
    while (v20 != v21);
    swift_bridgeObjectRelease_n(v12, 2);
    v12 = v59;
    v9 = v53;
    v2 = v54;
    v5 = v52;
  }
  else
  {
    v22 = _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease(v12);
  if (v22[2])
  {
    v36 = v22[4];
    v35 = (_QWORD *)v22[5];
    swift_bridgeObjectRetain(v35);
    swift_bridgeObjectRelease(v22);
    v38 = dispatch thunk of CompoundDataSourceCollectionViewController.dataSource.getter(v37);
    v39 = dispatch thunk of CompoundSectionedDataSource.firstFullIdentifier(itemIdentifier:)(v36, v35);
    v41 = v40;
    v42 = swift_release(v38);
    if (v41)
    {
      v43 = dispatch thunk of CompoundDataSourceCollectionViewController.dataSource.getter(v42);
      v44 = v55;
      dispatch thunk of CompoundSectionedDataSource.snapshot.getter();
      swift_release(v43);
      v58[0] = v39;
      v58[1] = v41;
      NSDiffableDataSourceSnapshot.indexPath(for:)(v58, v5);
      (*(void (**)(char *, uint64_t))(v56 + 8))(v44, v5);
      swift_bridgeObjectRelease(v41);
      v45 = type metadata accessor for IndexPath(0);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 48))(v9, 1, v45) == 1)
      {
        swift_bridgeObjectRelease(v35);
        sub_10001EDAC((uint64_t)v9, (unint64_t *)&unk_1000F0B20, (uint64_t (*)(uint64_t))&type metadata accessor for IndexPath);
        return result;
      }
      sub_10001EDAC((uint64_t)v9, (unint64_t *)&unk_1000F0B20, (uint64_t (*)(uint64_t))&type metadata accessor for IndexPath);
      v48 = (_QWORD *)(v2 + qword_1000F1360);
      v49 = *(_QWORD *)(v2 + qword_1000F1360);
      v50 = *(_QWORD *)(v2 + qword_1000F1360 + 8);
      *v48 = v36;
      v48[1] = v35;
      sub_1000A8394(v49, v50);
      v47 = (_QWORD *)v50;
    }
    else
    {
      v47 = v35;
    }
  }
  else
  {
    v47 = v22;
  }
  *(_QWORD *)&result = swift_bridgeObjectRelease(v47).n128_u64[0];
  return result;
}

id sub_1000A9C58(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  id result;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void (*v31)(_BYTE *, uint64_t);
  void *v32;
  id v33;
  uint64_t v34;
  _QWORD *v35;
  BOOL v36;
  double v37;
  void *v38;
  Class isa;
  _BYTE v40[12];
  int v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  _QWORD v45[2];

  v42 = a4;
  v41 = a3;
  v44 = a2;
  sub_1000227D0();
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v10 = &v40[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000076D8(0, (unint64_t *)&unk_1000F0B20, (uint64_t (*)(uint64_t))&type metadata accessor for IndexPath, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v11);
  v13 = &v40[-v12];
  v14 = type metadata accessor for IndexPath(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = __chkstk_darwin(v14);
  v18 = &v40[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v19 = __chkstk_darwin(v16);
  v21 = &v40[-v20];
  v43 = v4;
  v22 = dispatch thunk of CompoundDataSourceCollectionViewController.dataSource.getter(v19);
  dispatch thunk of CompoundSectionedDataSource.snapshot.getter();
  swift_release(v22);
  v45[0] = a1;
  v45[1] = v44;
  NSDiffableDataSourceSnapshot.indexPath(for:)(v45, v7);
  (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
    return (id)sub_10001EDAC((uint64_t)v13, (unint64_t *)&unk_1000F0B20, (uint64_t (*)(uint64_t))&type metadata accessor for IndexPath);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v15 + 32))(v21, v13, v14);
  v24 = v43;
  result = objc_msgSend(v43, "collectionView");
  if (!result)
  {
    __break(1u);
    goto LABEL_17;
  }
  v25 = result;
  v26 = IndexPath.section.getter();
  v27 = objc_msgSend(v25, "numberOfSections");
  v28 = (*(uint64_t (**)(_BYTE *, _BYTE *, uint64_t))(v15 + 16))(v18, v21, v14);
  if (v26 >= (uint64_t)v27)
  {
    v31 = *(void (**)(_BYTE *, uint64_t))(v15 + 8);
    v31(v18, v14);

  }
  else
  {
    v29 = IndexPath.item.getter(v28);
    v30 = objc_msgSend(v25, "numberOfItemsInSection:", IndexPath.section.getter());
    v31 = *(void (**)(_BYTE *, uint64_t))(v15 + 8);
    v31(v18, v14);

    if (v29 < (uint64_t)v30)
    {
      result = objc_msgSend(v24, "collectionView");
      if (result)
      {
        v32 = result;
        v33 = objc_msgSend(result, "indexPathsForSelectedItems");

        if (v33)
        {
          v35 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v33, v14);

        }
        else
        {
          v35 = _swiftEmptyArrayStorage;
        }
        __chkstk_darwin(v34);
        *(_QWORD *)&v40[-16] = v21;
        v36 = sub_1000AA49C((uint64_t (*)(char *))sub_1000AAF14, (_BOOL8)&v40[-32], (uint64_t)v35);
        *(_QWORD *)&v37 = swift_bridgeObjectRelease(v35).n128_u64[0];
        if (v36)
          return (id)((uint64_t (*)(_BYTE *, uint64_t))v31)(v21, v14);
        result = objc_msgSend(v24, "collectionView", v37);
        if (result)
        {
          v38 = result;
          isa = IndexPath._bridgeToObjectiveC()().super.isa;
          objc_msgSend(v38, "selectItemAtIndexPath:animated:scrollPosition:", isa, v41 & 1, v42);

          return (id)((uint64_t (*)(_BYTE *, uint64_t))v31)(v21, v14);
        }
LABEL_18:
        __break(1u);
        return result;
      }
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }
  }
  return (id)((uint64_t (*)(_QWORD, _QWORD))v31)(v21, v14);
}

void sub_1000A9FDC(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_1000AAA90();

}

void sub_1000AA028(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_1000AAB48(v4);

}

void sub_1000AA06C(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_1000AAD30();

}

double sub_1000AA0B8(char *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t Strong;
  uint64_t v10;
  id v11;
  char *v12;
  double result;
  id v14;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  Strong = swift_unknownObjectWeakLoadStrong(&a1[qword_1000F1358]);
  if (Strong)
  {
    v10 = Strong;
    v11 = a3;
    v12 = a1;
    sub_10004D6F8();
    v14 = sub_10004B1C4();
    dispatch thunk of BrowseViewController.searchTextDidChange(_:)(v6, v8);

    swift_bridgeObjectRelease(v8);
    swift_unknownObjectRelease(v10);

  }
  else
  {
    *(_QWORD *)&result = swift_bridgeObjectRelease(v8).n128_u64[0];
  }
  return result;
}

void sub_1000AA184()
{
  _swift_stdlib_reportUnimplementedInitializer("Health.MainSidebarViewController", 32, "init(dataSource:)", 17, 0);
  __break(1u);
}

void sub_1000AA1B0(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  _swift_stdlib_reportUnimplementedInitializer("Health.MainSidebarViewController", 32, "init(collectionViewLayout:)", 27, 0);
  __break(1u);
}

void sub_1000AA1E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + qword_1000F1350;
  v2 = type metadata accessor for Presentation(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_100061088(v0 + qword_1000F1358);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + qword_1000F1360 + 8));
  _s6Health23OpenSleepScheduleIntentVwxx_0((_QWORD *)(v0 + qword_1000F09C0));
  swift_release(*(_QWORD *)(v0 + qword_1000F09C8));
  v3 = v0 + qword_1000F09D0;
  sub_1000227D0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

id sub_1000AA298()
{
  return sub_1000336F0(type metadata accessor for MainSidebarViewController);
}

void sub_1000AA2A4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = a1 + qword_1000F1350;
  v3 = type metadata accessor for Presentation(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  sub_100061088(a1 + qword_1000F1358);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + qword_1000F1360 + 8));
  _s6Health23OpenSleepScheduleIntentVwxx_0((_QWORD *)(a1 + qword_1000F09C0));
  swift_release(*(_QWORD *)(a1 + qword_1000F09C8));
  v4 = a1 + qword_1000F09D0;
  sub_1000227D0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);

}

uint64_t sub_1000AA360()
{
  return type metadata accessor for MainSidebarViewController(0);
}

uint64_t sub_1000AA368@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + qword_1000F1350;
  v4 = type metadata accessor for Presentation(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

id sub_1000AA470()
{
  return sub_1000336F0((uint64_t (*)(_QWORD))type metadata accessor for HackyUnfocusableUISearchTextField);
}

uint64_t type metadata accessor for HackyUnfocusableUISearchTextField()
{
  return objc_opt_self(_TtC6HealthP33_8C220FBA31735F6781A5A7EF138717A933HackyUnfocusableUISearchTextField);
}

BOOL sub_1000AA49C(uint64_t (*a1)(char *), _BOOL8 a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t, uint64_t);
  int v17;
  BOOL v18;
  void (*v19)(char *, char *, uint64_t);
  uint64_t v20;
  char *v21;
  char v22;
  char v23;
  void (*v24)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  char *v30;
  void (*v31)(char *, uint64_t, uint64_t);
  _BOOL8 v32;
  uint64_t (*v33)(char *);
  uint64_t v34;

  v4 = v3;
  v32 = a2;
  v33 = a1;
  v34 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v34 - 8);
  __chkstk_darwin(v34);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000076D8(0, (unint64_t *)&unk_1000F0B20, v9, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v10);
  v12 = (char *)&v26 - v11;
  v13 = *(_QWORD *)(a3 + 16);
  if (v13)
  {
    v14 = a3 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    v29 = *(_QWORD *)(v6 + 72);
    v30 = v8;
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    v27 = a3;
    swift_bridgeObjectRetain(a3);
    while (1)
    {
      v15 = v34;
      v31(v12, v14, v34);
      v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
      v16(v12, 0, 1, v15);
      v17 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v12, 1, v15);
      v18 = v17 != 1;
      if (v17 == 1)
      {
        a3 = v27;
        goto LABEL_13;
      }
      v28 = 1;
      v19 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      v20 = v6;
      v21 = v30;
      v19(v30, v12, v15);
      v18 = v32;
      v22 = v33(v21);
      if (v4)
      {
        (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v15);
        swift_bridgeObjectRelease(v27);
        return v18;
      }
      v23 = v22;
      v24 = v16;
      (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v15);
      if ((v23 & 1) != 0)
        break;
      v14 += v29;
      --v13;
      v4 = 0;
      v6 = v20;
      if (!v13)
      {
        a3 = v27;
        goto LABEL_9;
      }
    }
    a3 = v27;
    v18 = v28;
  }
  else
  {
    v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
    swift_bridgeObjectRetain(a3);
LABEL_9:
    v24(v12, 1, 1, v34);
    v18 = 0;
  }
LABEL_13:
  swift_bridgeObjectRelease(a3);
  return v18;
}

uint64_t sub_1000AA6D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
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
  char v28;
  uint64_t Strong;
  void *v30;
  id v31;
  uint64_t v32;
  _BYTE v34[24];
  _QWORD v35[5];

  v2 = v1;
  sub_1000227D0();
  v5 = v4;
  v6 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v8 = &v34[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = (uint64_t *)(v1 + qword_1000F1360);
  v10 = *(_QWORD *)(v1 + qword_1000F1360 + 8);
  v11 = &qword_1000F0000;
  if (v10)
  {
    v12 = *v9;
    swift_bridgeObjectRetain(*(_QWORD *)(v1 + qword_1000F1360 + 8));
    v14 = dispatch thunk of CompoundDataSourceCollectionViewController.dataSource.getter(v13);
    dispatch thunk of CompoundSectionedDataSource.item(for:)(v35, v12, v10);
    swift_release(v14);
    if (v35[3])
    {
      swift_bridgeObjectRelease(v10);
      sub_1000AAED8((uint64_t)v35, &qword_1000EE738, (unint64_t *)&qword_1000EEC70, (uint64_t)&protocol descriptor for SectionedDataSourceItem);
    }
    else
    {
      v15 = sub_1000AAED8((uint64_t)v35, &qword_1000EE738, (unint64_t *)&qword_1000EEC70, (uint64_t)&protocol descriptor for SectionedDataSourceItem);
      v16 = dispatch thunk of CompoundDataSourceCollectionViewController.dataSource.getter(v15);
      v17 = dispatch thunk of CompoundSectionedDataSource.firstFullIdentifier(itemIdentifier:)(v12, v10);
      v19 = v18;
      swift_release(v16);
      swift_bridgeObjectRelease(v10);
      if (v19)
      {
        v20 = *v9;
        v21 = v9[1];
        *v9 = v17;
        v9[1] = v19;
        sub_1000A8394(v20, v21);
        swift_bridgeObjectRelease(v21);
        v11 = &qword_1000F0000;
      }
      else
      {
        v22 = NSDiffableDataSourceSnapshot.numberOfItems.getter(v5);
        v11 = &qword_1000F0000;
        v23 = v2 + qword_1000F09D0;
        swift_beginAccess(v2 + qword_1000F09D0, v34, 0, 0);
        (*(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 16))(v8, v23, v5);
        v24 = NSDiffableDataSourceSnapshot.numberOfItems.getter(v5);
        v25 = (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
        if (v22 < v24)
        {
          v26 = dispatch thunk of CompoundDataSourceCollectionViewController.dataSource.getter(v25);
          v27 = type metadata accessor for CompoundSectionedDataSource(0);
          v28 = SnapshotDataSource.isEmpty.getter(v27, &protocol witness table for CompoundSectionedDataSource);
          swift_release(v26);
          if ((v28 & 1) == 0)
          {
            Strong = swift_unknownObjectWeakLoadStrong(v2 + qword_1000F1358);
            if (Strong)
            {
              v30 = (void *)Strong;
              v31 = sub_10004B180();
              objc_msgSend(v30, "setViewController:forColumn:", v31, 2);
              swift_unknownObjectRelease(v30);

            }
          }
        }
      }
    }
  }
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  v32 = v2 + v11[314];
  swift_beginAccess(v32, v35, 33, 0);
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v6 + 40))(v32, v8, v5);
  return swift_endAccess(v35);
}

void sub_1000AA978()
{
  char *v0;
  char *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v1 = v0;
  v2 = &v0[qword_1000F1350];
  v3 = enum case for Presentation.sidebar(_:);
  v4 = type metadata accessor for Presentation(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 104))(v2, v3, v4);
  *(_QWORD *)&v1[qword_1000F1358 + 8] = 0;
  swift_unknownObjectWeakInit();
  v5 = &v1[qword_1000F1360];
  type metadata accessor for SidebarDataSourceItem(0);
  *(_QWORD *)v5 = static SidebarDataSourceItem.summarySidebarItemIdentifier.getter();
  *((_QWORD *)v5 + 1) = v6;
  *(_QWORD *)&v1[qword_1000F09C8] = 0;
  NSDiffableDataSourceSnapshot.init()(&type metadata for String, &type metadata for String, &protocol witness table for String, &protocol witness table for String);
  *(_QWORD *)&v1[qword_1000F09D8] = 0;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000B8850, "Health/MainSidebarViewController.swift", 38, 2, 84, 0);
  __break(1u);
}

void sub_1000AAA90()
{
  uint64_t v0;
  uint64_t Strong;
  void *v2;
  id v3;
  id v4;
  id v5;

  Strong = swift_unknownObjectWeakLoadStrong(v0 + qword_1000F1358);
  if (Strong)
  {
    v2 = (void *)Strong;
    v3 = sub_10004B2A8();

    v4 = sub_10004B1C4();
    dispatch thunk of BrowseViewController.deactivateSearch()();

    v5 = sub_10004B180();
    objc_msgSend(v2, "setViewController:forColumn:", v5, 2);
    swift_unknownObjectRelease(v2);

  }
}

void sub_1000AAB48(void *a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::String v7;
  NSString v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  Swift::String v14;
  NSString v15;

  v2 = objc_msgSend(a1, "searchBar");
  v3 = objc_msgSend(v2, "searchTextField");

  _StringGuts.grow(_:)(29);
  v4 = HKUIAutomationIdentifierPrefix;
  static String._unconditionallyBridgeFromObjectiveC(_:)(HKUIAutomationIdentifierPrefix);
  v6 = v5;
  swift_bridgeObjectRelease(0xE000000000000000);
  v7._object = (void *)0x80000001000BF5C0;
  v7._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v7);
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  objc_msgSend(v3, "setAccessibilityIdentifier:", v8);

  v9 = objc_msgSend(a1, "searchBar");
  v10 = objc_msgSend(v9, "searchTextField");

  v11 = objc_msgSend(v10, "_clearButton");
  if (v11)
  {
    _StringGuts.grow(_:)(31);
    static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v13 = v12;
    swift_bridgeObjectRelease(0xE000000000000000);
    v14._countAndFlagsBits = 0xD00000000000001DLL;
    v14._object = (void *)0x80000001000BF5E0;
    String.append(_:)(v14);
    v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v13);
    objc_msgSend(v11, "setAccessibilityIdentifier:", v15);

  }
  else
  {
    __break(1u);
  }
}

void sub_1000AAD30()
{
  uint64_t v0;
  uint64_t Strong;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  Strong = swift_unknownObjectWeakLoadStrong(v0 + qword_1000F1358);
  if (Strong)
  {
    v2 = Strong;
    sub_10004D6F8();
    v3 = (_QWORD *)(v0 + qword_1000F1360);
    v4 = *(_QWORD *)(v0 + qword_1000F1360);
    v5 = *(_QWORD *)(v0 + qword_1000F1360 + 8);
    *v3 = 0;
    v3[1] = 0;
    sub_1000A8394(v4, v5);
    swift_bridgeObjectRelease(v5);
    v6 = sub_10004B1C4();
    v7 = sub_1000A87CC();
    dispatch thunk of BrowseViewController.setActiveSearchController(_:)(v7);
    swift_unknownObjectRelease(v2);

  }
}

uint64_t sub_1000AADE8(uint64_t a1)
{
  uint64_t v2;

  sub_1000AAE24();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1000AAE24()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1000EDBD0)
  {
    v0 = type metadata accessor for Optional(0, (char *)&type metadata for Any + 8);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1000EDBD0);
  }
}

uint64_t sub_1000AAE7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_100013488(0, &qword_1000EEC68, &qword_1000EEC60, (uint64_t)&protocol descriptor for CellSelectionHandling);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000AAED8(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  uint64_t v5;

  sub_100013488(0, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

uint64_t sub_1000AAF14(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = type metadata accessor for IndexPath(0);
  v5 = sub_1000AAF70();
  return dispatch thunk of static Equatable.== infix(_:_:)(a1, v3, v4, v5) & 1;
}

unint64_t sub_1000AAF70()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000F0B38;
  if (!qword_1000F0B38)
  {
    v1 = type metadata accessor for IndexPath(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for IndexPath, v1);
    atomic_store(result, (unint64_t *)&qword_1000F0B38);
  }
  return result;
}

void sub_1000AAFB8(uint64_t a1)
{
  sub_1000076D8(a1, (unint64_t *)&unk_1000EDBB0, (uint64_t (*)(uint64_t))sub_1000AAFD4, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
}

unint64_t sub_1000AAFD4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000F0B50;
  if (!qword_1000F0B50)
  {
    v1 = objc_opt_self(UIViewController);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000F0B50);
  }
  return result;
}

id ConfigurationIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id ConfigurationIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConfigurationIntent();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for ConfigurationIntent()
{
  return objc_opt_self(ConfigurationIntent);
}

id ConfigurationIntent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithCoder:", a1);

  return v3;
}

id ConfigurationIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ConfigurationIntent();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id ConfigurationIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  NSString v7;
  id v8;

  v4 = v3;
  if (a2)
  {
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(objc_allocWithZone(v4), "initWithIdentifier:backingStore:", v7, a3);

  return v8;
}

id ConfigurationIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  NSString v6;
  id v7;
  objc_super v9;

  if (a2)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for ConfigurationIntent();
  v7 = objc_msgSendSuper2(&v9, "initWithIdentifier:backingStore:", v6, a3);

  return v7;
}

id ConfigurationIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  NSString v9;
  NSString v10;
  NSDictionary v11;
  id v12;

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a5)
  {
    v11.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a5);
  }
  else
  {
    v11.super.isa = 0;
  }
  v12 = objc_msgSend(objc_allocWithZone(v5), "initWithDomain:verb:parametersByName:", v9, v10, v11.super.isa);

  return v12;
}

id ConfigurationIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  NSString v9;
  NSString v10;
  NSDictionary v11;
  id v12;
  objc_super v14;

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a5)
  {
    v11.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a5);
  }
  else
  {
    v11.super.isa = 0;
  }
  v14.receiver = v5;
  v14.super_class = (Class)type metadata accessor for ConfigurationIntent();
  v12 = objc_msgSendSuper2(&v14, "initWithDomain:verb:parametersByName:", v9, v10, v11.super.isa);

  return v12;
}

id ConfigurationIntent.__deallocating_deinit()
{
  return sub_1000ABC34(type metadata accessor for ConfigurationIntent);
}

unint64_t ConfigurationIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_1000ABC64(a1);
}

unint64_t sub_1000AB614@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_1000ABC64(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t ConfigurationIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR___ConfigurationIntentResponse_code;
  swift_beginAccess(v0 + OBJC_IVAR___ConfigurationIntentResponse_code, v3, 0, 0);
  return *(_QWORD *)v1;
}

char *ConfigurationIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;
  char v9[24];

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), "init");
  v6 = &v5[OBJC_IVAR___ConfigurationIntentResponse_code];
  swift_beginAccess(&v5[OBJC_IVAR___ConfigurationIntentResponse_code], v9, 1, 0);
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, "setUserActivity:", a2);

  return v7;
}

char *ConfigurationIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;
  char v9[24];

  v5 = (char *)objc_msgSend(v2, "init");
  v6 = &v5[OBJC_IVAR___ConfigurationIntentResponse_code];
  swift_beginAccess(&v5[OBJC_IVAR___ConfigurationIntentResponse_code], v9, 1, 0);
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, "setUserActivity:", a2);

  return v7;
}

id ConfigurationIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___ConfigurationIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConfigurationIntentResponse();
  return objc_msgSendSuper2(&v2, "init");
}

id ConfigurationIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___ConfigurationIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ConfigurationIntentResponse();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id ConfigurationIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithBackingStore:", a1);

  return v3;
}

id ConfigurationIntentResponse.init(backingStore:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___ConfigurationIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ConfigurationIntentResponse();
  v3 = objc_msgSendSuper2(&v5, "initWithBackingStore:", a1);

  return v3;
}

id sub_1000ABA58(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  objc_super v7;

  *(_QWORD *)&a1[OBJC_IVAR___ConfigurationIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for ConfigurationIntentResponse();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id ConfigurationIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  objc_class *v1;
  NSDictionary v3;
  id v4;

  if (a1)
  {
    v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3.super.isa = 0;
  }
  v4 = objc_msgSend(objc_allocWithZone(v1), "initWithPropertiesByName:", v3.super.isa);

  return v4;
}

id ConfigurationIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  char *v1;
  NSDictionary v3;
  id v4;
  objc_super v6;

  *(_QWORD *)&v1[OBJC_IVAR___ConfigurationIntentResponse_code] = 0;
  if (a1)
  {
    v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3.super.isa = 0;
  }
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for ConfigurationIntentResponse();
  v4 = objc_msgSendSuper2(&v6, "initWithPropertiesByName:", v3.super.isa);

  if (v4)
  return v4;
}

id ConfigurationIntentResponse.__deallocating_deinit()
{
  return sub_1000ABC34(type metadata accessor for ConfigurationIntentResponse);
}

id sub_1000ABC34(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

unint64_t sub_1000ABC64(unint64_t result)
{
  if (result > 6)
    return 0;
  return result;
}

uint64_t type metadata accessor for ConfigurationIntentResponse()
{
  return objc_opt_self(ConfigurationIntentResponse);
}

unint64_t sub_1000ABC98()
{
  unint64_t result;

  result = qword_1000F0BC8;
  if (!qword_1000F0BC8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ConfigurationIntentResponseCode, &type metadata for ConfigurationIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_1000F0BC8);
  }
  return result;
}

uint64_t sub_1000ABCDC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___ConfigurationIntentResponse_code);
  result = swift_beginAccess(v3, v5, 0, 0);
  *a2 = *v3;
  return result;
}

uint64_t sub_1000ABD2C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___ConfigurationIntentResponse_code);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for ConfigurationIntentResponseCode()
{
  return &type metadata for ConfigurationIntentResponseCode;
}

id HealthDataType.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  NSString v10;
  NSString v11;
  NSString v12;
  id v13;

  if (a2)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v10 = 0;
  }
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a6)
  {
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a6);
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(objc_allocWithZone(v6), "initWithIdentifier:displayString:pronunciationHint:", v10, v11, v12);

  return v13;
}

id HealthDataType.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  NSString v10;
  NSString v11;
  NSString v12;
  id v13;
  objc_super v15;

  if (a2)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v10 = 0;
  }
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a6)
  {
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a6);
  }
  else
  {
    v12 = 0;
  }
  v15.receiver = v6;
  v15.super_class = (Class)type metadata accessor for HealthDataType();
  v13 = objc_msgSendSuper2(&v15, "initWithIdentifier:displayString:pronunciationHint:", v10, v11, v12);

  return v13;
}

uint64_t type metadata accessor for HealthDataType()
{
  return objc_opt_self(HealthDataType);
}

id HealthDataType.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for HealthDataType();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id HealthDataType.__deallocating_deinit()
{
  return sub_1000ABC34(type metadata accessor for HealthDataType);
}

id static HealthDataTypeResolutionResult.success(with:)(uint64_t a1)
{
  uint64_t v1;
  objc_super v4;

  v4.receiver = (id)swift_getObjCClassFromMetadata(v1);
  v4.super_class = (Class)&OBJC_METACLASS___HealthDataTypeResolutionResult;
  return objc_msgSendSuper2(&v4, "successWithResolvedObject:", a1);
}

id static HealthDataTypeResolutionResult.disambiguation(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *ObjCClassFromMetadata;
  Class isa;
  double v7;
  id v8;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  objc_super v13;

  v2 = v1;
  v3 = a1;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v10 = a1;
    else
      v10 = a1 & 0xFFFFFFFFFFFFFF8;
    v11 = sub_1000AC218();
    swift_bridgeObjectRetain(v3);
    v12 = _bridgeCocoaArray<A>(_:)(v10, v11);
    swift_bridgeObjectRelease(v3);
    v3 = v12;
  }
  else
  {
    swift_bridgeObjectRetain(a1);
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v4);
    sub_1000AC218();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(v2);
  sub_1000AC218();
  isa = Array._bridgeToObjectiveC()().super.isa;
  *(_QWORD *)&v7 = swift_bridgeObjectRelease(v3).n128_u64[0];
  v13.receiver = ObjCClassFromMetadata;
  v13.super_class = (Class)&OBJC_METACLASS___HealthDataTypeResolutionResult;
  v8 = objc_msgSendSuper2(&v13, "disambiguationWithObjectsToDisambiguate:", isa, v7);

  return v8;
}

unint64_t sub_1000AC218()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000F0C48;
  if (!qword_1000F0C48)
  {
    v1 = objc_opt_self(INObject);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000F0C48);
  }
  return result;
}

id static HealthDataTypeResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  uint64_t v1;
  objc_super v4;

  v4.receiver = (id)swift_getObjCClassFromMetadata(v1);
  v4.super_class = (Class)&OBJC_METACLASS___HealthDataTypeResolutionResult;
  return objc_msgSendSuper2(&v4, "confirmationRequiredWithObjectToConfirm:", a1);
}

void static HealthDataTypeResolutionResult.success(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "Health/HealthDataType.swift", 27, 2, 47, 0);
  __break(1u);
}

void static HealthDataTypeResolutionResult.disambiguation(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "Health/HealthDataType.swift", 27, 2, 52, 0);
  __break(1u);
}

void static HealthDataTypeResolutionResult.confirmationRequired(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "Health/HealthDataType.swift", 27, 2, 57, 0);
  __break(1u);
}

id HealthDataTypeResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v5;
  Class isa;
  id v7;

  v5 = objc_allocWithZone(v2);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v7 = objc_msgSend(v5, "initWithJSONDictionary:forIntent:", isa, a2);

  return v7;
}

id HealthDataTypeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  void *v2;
  Class isa;
  id v6;
  id v7;
  objc_super v9;

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for HealthDataTypeResolutionResult();
  v6 = objc_msgSendSuper2(&v9, "initWithJSONDictionary:forIntent:", isa, a2);

  v7 = v6;
  if (v7)

  return v7;
}

uint64_t type metadata accessor for HealthDataTypeResolutionResult()
{
  return objc_opt_self(HealthDataTypeResolutionResult);
}

id HealthDataTypeResolutionResult.__deallocating_deinit()
{
  return sub_1000ABC34(type metadata accessor for HealthDataTypeResolutionResult);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC6HealthP33_BCE4B44FB7894C81A6E2C64C9D08DB4419ResourceBundleClass);
}
