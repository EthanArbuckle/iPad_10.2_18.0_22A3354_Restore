Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> NodeDefStore.applyStandardLibraryFixes()()
{
  unint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  char v6;
  __int128 *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _OWORD v59[2];
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v3 = v2;
  v4 = v1;
  v5 = *v1;
  if (*(_QWORD *)(v5 + 16))
  {
    v0 = specialized __RawDictionaryStorage.find<A>(_:)(0x56556473555F444ELL, 0xEF65727574786554);
    if ((v6 & 1) != 0)
    {
      v43 = v4;
      v7 = (__int128 *)(*(_QWORD *)(v5 + 56) + 144 * v0);
      v8 = v7[3];
      v9 = v7[4];
      v10 = v7[2];
      v51 = v7[1];
      v52 = v10;
      v11 = *v7;
      v53 = v8;
      v54 = v9;
      v50 = v11;
      v12 = v7[5];
      v13 = v7[6];
      v14 = v7[8];
      v57 = v7[7];
      v58 = v14;
      v55 = v12;
      v56 = v13;
      v15 = v14;
      v16 = *(_QWORD *)(v14 + 16);
      if (v16)
      {
        outlined retain of NodeDef((uint64_t)&v50);
        v73 = MEMORY[0x24BEE4AF8];
        swift_bridgeObjectRetain();
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v16, 0);
        v17 = 0;
        v18 = v73;
        v44 = v15;
        while (1)
        {
          v19 = v15 + v17;
          v20 = *(_QWORD *)(v15 + v17 + 32);
          v21 = *(_QWORD *)(v19 + 40);
          v22 = *(_QWORD *)(v19 + 48);
          v45 = *(_QWORD *)(v19 + 56);
          v46 = v20;
          v48 = *(_OWORD *)(v19 + 64);
          v47 = *(_QWORD *)(v19 + 80);
          v23 = v20 == 0x5370617277 && v21 == 0xE500000000000000;
          if (v23 || (v24 = *(_BYTE *)(v19 + 88), (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
          {
            v25 = v18;
            v26 = one-time initialization token for uAddressMode;
            swift_bridgeObjectRetain_n();
            swift_retain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            if (v26 != -1)
              swift_once();
            v27 = static MaterialXDataType.uAddressMode;
            swift_retain();
            swift_bridgeObjectRetain();
          }
          else
          {
            v28 = v20 == 0x5470617277 && v21 == 0xE500000000000000;
            if (!v28 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
            {
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_retain();
              swift_bridgeObjectRetain();
              goto LABEL_22;
            }
            v25 = v18;
            v29 = one-time initialization token for vAddressMode;
            swift_bridgeObjectRetain_n();
            swift_retain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            if (v29 != -1)
              swift_once();
            v27 = static MaterialXDataType.vAddressMode;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_retain();
            swift_bridgeObjectRelease();
          }
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
          v24 = 1;
          v22 = v27;
          v18 = v25;
LABEL_22:
          v73 = v18;
          v31 = *(_QWORD *)(v18 + 16);
          v30 = *(_QWORD *)(v18 + 24);
          if (v31 >= v30 >> 1)
          {
            specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v30 > 1, v31 + 1, 1);
            v18 = v73;
          }
          *(_QWORD *)(v18 + 16) = v31 + 1;
          v32 = v18 + (v31 << 6);
          *(_QWORD *)(v32 + 32) = v46;
          *(_QWORD *)(v32 + 40) = v21;
          v15 = v44;
          *(_QWORD *)(v32 + 48) = v22;
          *(_QWORD *)(v32 + 56) = v45;
          *(_OWORD *)(v32 + 64) = v48;
          *(_QWORD *)(v32 + 80) = v47;
          v17 += 64;
          *(_BYTE *)(v32 + 88) = v24;
          if (!--v16)
          {
            swift_bridgeObjectRelease();
            v49 = v18;
            goto LABEL_28;
          }
        }
      }
      outlined retain of NodeDef((uint64_t)&v50);
      v49 = MEMORY[0x24BEE4AF8];
LABEL_28:
      v33 = *((_QWORD *)&v50 + 1);
      v34 = v50;
      v35 = v51;
      v36 = v53;
      v37 = *((_QWORD *)&v55 + 1);
      v38 = *((_QWORD *)&v58 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      outlined release of NodeDef((uint64_t)&v50);
      v59[0] = __PAIR128__(v33, v34);
      v59[1] = v35;
      v60 = 0;
      v61 = 0;
      v62 = v36;
      v63 = 0;
      v64 = 0;
      v65 = 2;
      v66 = v37;
      v67 = 0;
      v68 = 0;
      v69 = 0;
      v70 = 1;
      v71 = v49;
      v72 = v38;
      v4 = v43;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v73 = *v43;
      *v43 = 0x8000000000000000;
      specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v59, 0x56556473555F444ELL, 0xEF65727574786554, isUniquelyReferenced_nonNull_native);
      *v43 = v73;
      v0 = swift_bridgeObjectRelease();
      v3 = v2;
    }
  }
  MEMORY[0x24BDAC7A8](v0);
  v40 = swift_bridgeObjectRetain();
  specialized Sequence.forEach(_:)(v40, (void (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #2 in NodeDefStore.applyStandardLibraryFixes());
  swift_bridgeObjectRelease();
  if (!v3)
  {
    v41 = swift_bridgeObjectRetain();
    v42 = specialized _NativeDictionary.mapValues<A>(_:)(v41);
    swift_bridgeObjectRelease();
    *v4 = v42;
    swift_bridgeObjectRelease();
  }
}

void closure #5 in NodeDefStore.loadLibrary()(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  void *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  Class isa;
  id v31;
  char *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t ObjectType;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67[3];
  uint64_t v68;

  v7 = type metadata accessor for URL();
  v64 = *(_QWORD *)(v7 - 8);
  v65 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v59 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v59 - v12;
  v14 = Data.init(contentsOf:options:)();
  if (v3)
  {

    if (one-time initialization token for logger != -1)
      swift_once();
    v16 = type metadata accessor for Logger();
    __swift_project_value_buffer(v16, (uint64_t)logger);
    v17 = v64;
    (*(void (**)(char *, uint64_t, uint64_t))(v64 + 16))(v13, a1, v65);
    v18 = Logger.logObject.getter();
    v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v63 = a3;
      v22 = v21;
      v67[0] = v21;
      *(_DWORD *)v20 = 136315138;
      v23 = v65;
      lazy protocol witness table accessor for type SGDataType and conformance SGDataType(&lazy protocol witness table cache variable for type URL and conformance URL, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
      v24 = dispatch thunk of CustomStringConvertible.description.getter();
      v68 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, v67);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v64 + 8))(v13, v23);
      _os_log_impl(&dword_245E46000, v18, v19, "Failed to load contents of %s", v20, 0xCu);
      swift_arrayDestroy();
      v26 = v22;
      a3 = v63;
      MEMORY[0x24954C33C](v26, -1, -1);
      MEMORY[0x24954C33C](v20, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v17 + 8))(v13, v65);
    }

    *a3 = 0;
    a3[1] = 0;
  }
  else
  {
    v27 = v15;
    v60 = a2;
    v63 = a3;
    v28 = v14;
    v29 = objc_allocWithZone(MEMORY[0x24BDD1978]);
    outlined copy of Data._Representation(v28, v27);
    v61 = v28;
    isa = Data._bridgeToObjectiveC()().super.isa;
    v31 = objc_msgSend(v29, sel_initWithData_, isa);

    v32 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for XMLParserDelegate()), sel_init);
    objc_msgSend(v31, sel_setDelegate_, v32);
    objc_msgSend(v31, sel_parse);
    v33 = (uint64_t *)&v32[OBJC_IVAR____TtC11ShaderGraph17XMLParserDelegate_rootElement];
    swift_beginAccess();
    v34 = *v33;
    v62 = v27;
    if (v34)
    {
      v35 = v33[1];
      v36 = v34;
      ObjectType = swift_getObjectType();
      v38 = swift_conformsToProtocol2();
      if (v38)
      {
        v39 = v38;
        v40 = *(void (**)(uint64_t, uint64_t))(v38 + 24);
        swift_unknownObjectRetain_n();
        v40(ObjectType, v39);
        swift_unknownObjectRelease();

        v41 = v60;
        collectNodeDefs(_:into:)(v36, v35, v60);
        collectGeomPropDefs(_:into:)(v36, v35, (uint64_t)v41);
        v57 = v61;
        v56 = v62;
        outlined consume of Data._Representation(v61, v62);
        outlined consume of Data._Representation(v57, v56);
        v58 = v63;
        *v63 = v36;
        v58[1] = v35;
      }
      else
      {
        __break(1u);
      }
    }
    else
    {

      if (one-time initialization token for logger != -1)
        swift_once();
      v42 = type metadata accessor for Logger();
      __swift_project_value_buffer(v42, (uint64_t)logger);
      v43 = v64;
      (*(void (**)(char *, uint64_t, uint64_t))(v64 + 16))(v11, a1, v65);
      v44 = Logger.logObject.getter();
      v45 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v44, v45))
      {
        v46 = swift_slowAlloc();
        v47 = swift_slowAlloc();
        v68 = v47;
        *(_DWORD *)v46 = 136315138;
        v60 = (_QWORD *)(v46 + 4);
        lazy protocol witness table accessor for type SGDataType and conformance SGDataType(&lazy protocol witness table cache variable for type URL and conformance URL, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
        v48 = v65;
        v49 = dispatch thunk of CustomStringConvertible.description.getter();
        v66 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v49, v50, &v68);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v64 + 8))(v11, v48);
        _os_log_impl(&dword_245E46000, v44, v45, "Failed to find root element for XML at %s", (uint8_t *)v46, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24954C33C](v47, -1, -1);
        MEMORY[0x24954C33C](v46, -1, -1);
        v52 = v61;
        v51 = v62;
        outlined consume of Data._Representation(v61, v62);

        outlined consume of Data._Representation(v52, v51);
      }
      else
      {
        v54 = v61;
        v53 = v62;
        outlined consume of Data._Representation(v61, v62);
        (*(void (**)(char *, uint64_t))(v43 + 8))(v11, v65);
        outlined consume of Data._Representation(v54, v53);

      }
      v55 = v63;
      *v63 = 0;
      v55[1] = 0;
    }
  }
}

uint64_t closure #2 in NodeDefStore.applyStandardLibraryFixes()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  Swift::String v14;
  uint64_t result;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v5 = v4;
  v10 = type metadata accessor for NodeDef.Implementation(0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14._object = (void *)0x8000000245FCE4D0;
  v14._countAndFlagsBits = 0xD000000000000014;
  result = String.hasPrefix(_:)(v14);
  if ((result & 1) != 0)
  {
    v16 = *(_QWORD *)(a3 + 16);
    v17 = MEMORY[0x24BEE4AF8];
    v26 = a1;
    if (v16)
    {
      v24 = a4;
      v25 = a2;
      v27 = MEMORY[0x24BEE4AF8];
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v16, 0);
      v17 = v27;
      v18 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
      v19 = a3 + v18;
      v20 = *(_QWORD *)(v11 + 72);
      while (1)
      {
        closure #1 in closure #2 in NodeDefStore.applyStandardLibraryFixes()(v19, (uint64_t)v13);
        if (v5)
          return swift_release();
        v5 = 0;
        v27 = v17;
        v22 = *(_QWORD *)(v17 + 16);
        v21 = *(_QWORD *)(v17 + 24);
        if (v22 >= v21 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v21 > 1, v22 + 1, 1);
          v17 = v27;
        }
        *(_QWORD *)(v17 + 16) = v22 + 1;
        outlined init with take of NodeDef.Implementation.Kind((uint64_t)v13, v17 + v18 + v22 * v20, type metadata accessor for NodeDef.Implementation);
        v19 += v20;
        if (!--v16)
        {
          a4 = v24;
          a2 = v25;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v27 = *(_QWORD *)(a4 + 16);
      *(_QWORD *)(a4 + 16) = 0x8000000000000000;
      specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v17, v26, a2, isUniquelyReferenced_nonNull_native);
      *(_QWORD *)(a4 + 16) = v27;
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t closure #1 in closure #2 in NodeDefStore.applyStandardLibraryFixes()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  __int128 *v10;
  uint64_t (*v11)(_QWORD);
  uint64_t result;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t *v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  Swift::String v39;
  Swift::Bool v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  unint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __int128 *v67;
  __int128 v68;
  unint64_t v69;
  __int128 v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  __int128 v76;
  _OWORD v77[2];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _OWORD v84[3];
  _OWORD v85[9];
  _OWORD v86[3];
  uint64_t v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _OWORD v95[2];
  __int128 v96;
  _OWORD v97[2];
  _QWORD v98[5];
  char v99;
  uint64_t v100;
  _QWORD v101[5];
  char v102;
  uint64_t v103;
  uint64_t v104;

  v5 = type metadata accessor for NodeDef.Implementation.Kind(0);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (__int128 *)((char *)&v66 - v9);
  outlined init with copy of NodeDef.Implementation.Kind(a1, (uint64_t)&v66 - v9, v11);
  if (swift_getEnumCaseMultiPayload())
  {
    outlined destroy of NodeDef.Implementation((uint64_t)v10, type metadata accessor for NodeDef.Implementation.Kind);
    return outlined init with copy of NodeDef.Implementation.Kind(a1, a2, type metadata accessor for NodeDef.Implementation);
  }
  v71 = a1;
  v72 = a2;
  v66 = v5;
  v67 = (__int128 *)v8;
  v73 = v2;
  v13 = v10[2];
  v14 = v10[3];
  v15 = *v10;
  v90 = v10[1];
  v91 = v13;
  v16 = v10[4];
  v17 = v10[6];
  v18 = v10[7];
  v94 = v10[5];
  v95[0] = v17;
  v92 = v14;
  v93 = v16;
  *(_OWORD *)((char *)v97 + 9) = *(__int128 *)((char *)v10 + 153);
  v19 = v10[9];
  v96 = v10[8];
  v97[0] = v19;
  v95[1] = v18;
  v89 = v15;
  v70 = v94;
  v68 = *(_OWORD *)((char *)v95 + 8);
  LODWORD(v69) = BYTE8(v18);
  v74 = v17;
  v20 = *(_QWORD *)(v17 + 16);
  if (!v20)
  {
LABEL_11:
    v29 = v70;
    v76 = v70;
    *(_QWORD *)&v77[0] = v74;
    *(_OWORD *)((char *)v77 + 8) = v68;
    BYTE8(v77[1]) = v69;
    *(_QWORD *)&v78 = 0x6B6361626C6C6166;
    *((_QWORD *)&v78 + 1) = 0xE800000000000000;
    _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi9_((uint64_t)&v76);
    outlined init with take of UserGraphError.ErrorType(&v76, (uint64_t)v85);
    v87 = 0;
    v88 = 0;
    swift_bridgeObjectRetain();
    outlined copy of NodePersonality(v29);
    swift_bridgeObjectRetain();
    outlined release of UserGraphError((unint64_t *)v85);
LABEL_24:
    outlined release of Graph((uint64_t)&v89);
    return outlined init with copy of NodeDef.Implementation.Kind(v71, v72, type metadata accessor for NodeDef.Implementation);
  }
  v21 = (_QWORD *)(v74 + 80);
  while (1)
  {
    v22 = *(v21 - 6);
    v104 = *(v21 - 5);
    v24 = *(v21 - 4);
    v23 = *(v21 - 3);
    v25 = *(v21 - 2);
    v26 = *((_BYTE *)v21 - 8);
    v27 = *v21;
    if (v24 == 0x6B6361626C6C6166 && v23 == 0xE800000000000000)
      break;
    if ((_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      goto LABEL_13;
    v21 += 7;
    if (!--v20)
      goto LABEL_11;
  }
  v23 = 0xE800000000000000;
LABEL_13:
  v98[0] = v22;
  v98[1] = v104;
  v98[2] = v24;
  v98[3] = v23;
  v98[4] = v25;
  v99 = v26;
  v100 = v27;
  v30 = v93;
  v31 = *(_QWORD *)(v93 + 16);
  swift_retain();
  swift_bridgeObjectRetain();
  if (!v31)
  {
    swift_bridgeObjectRelease();
    swift_release();
    goto LABEL_24;
  }
  v32 = v30 + 32;
  *(_QWORD *)&v70 = v30;
  swift_bridgeObjectRetain_n();
  v33 = 0;
  *((_QWORD *)&v70 + 1) = 0x8000000245FCB6F0;
  v74 = v23;
  while (1)
  {
    v34 = (unint64_t *)(v32 + 48 * v33);
    if (v34[3] == -7)
      goto LABEL_19;
    v35 = *v34;
    if (*v34 >> 61 != 5)
      goto LABEL_19;
    v36 = v32;
    v38 = v34[1];
    v37 = v34[2];
    outlined copy of NodePersonality(*v34);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v39._countAndFlagsBits = 0xD000000000000011;
    v39._object = (void *)*((_QWORD *)&v70 + 1);
    v40 = String.hasPrefix(_:)(v39);
    swift_bridgeObjectRelease();
    if (v40)
      break;
    outlined consume of NodePersonality(v35);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v32 = v36;
LABEL_19:
    if ((uint64_t)++v33 >= (uint64_t)v31)
      goto LABEL_22;
    if (v33 >= v31)
    {
      __break(1u);
LABEL_22:
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease_n();
      goto LABEL_24;
    }
  }
  *(_QWORD *)&v68 = v35;
  v69 = v37;
  swift_bridgeObjectRelease_n();
  *(_QWORD *)&v70 = v38;
  v41 = *(_QWORD *)(v38 + 16);
  if (v41)
  {
    v42 = (_QWORD *)(v70 + 80);
    while (1)
    {
      v43 = *(v42 - 5);
      *((_QWORD *)&v70 + 1) = *(v42 - 6);
      v44 = *(v42 - 4);
      v45 = *(v42 - 2);
      v46 = *((_BYTE *)v42 - 8);
      v47 = *v42;
      if (v44 == 0x746C7561666564 && *(v42 - 3) == 0xE700000000000000)
        break;
      v49 = *(v42 - 3);
      if ((_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        goto LABEL_35;
      v42 += 7;
      if (!--v41)
        goto LABEL_33;
    }
    v49 = 0xE700000000000000;
LABEL_35:
    v101[0] = *((_QWORD *)&v70 + 1);
    v101[1] = v43;
    v101[2] = v44;
    v101[3] = v49;
    v101[4] = v45;
    v102 = v46;
    v103 = v47;
    swift_retain();
    swift_bridgeObjectRetain();
    v83 = v96;
    v84[0] = v97[0];
    *(_OWORD *)((char *)v84 + 9) = *(_OWORD *)((char *)v97 + 9);
    v79 = v93;
    v80 = v94;
    v81 = v95[0];
    v82 = v95[1];
    v76 = v89;
    v77[0] = v90;
    v77[1] = v91;
    v78 = v92;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    outlined retain of Graph((uint64_t)&v89);
    Graph.connect(_:to:)((uint64_t)v98, (unint64_t)v101);
    *((_QWORD *)&v70 + 1) = v49;
    swift_bridgeObjectRelease();
    v71 = v43;
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    v85[7] = v82;
    v85[8] = v83;
    v86[0] = v84[0];
    *(_OWORD *)((char *)v86 + 9) = *(_OWORD *)((char *)v84 + 9);
    v50 = v79;
    v51 = v80;
    v85[4] = v79;
    v85[5] = v80;
    v52 = v82;
    v53 = v81;
    v85[6] = v81;
    v54 = v76;
    v55 = v77[0];
    v85[0] = v76;
    v85[1] = v77[0];
    v57 = v77[1];
    v56 = v78;
    v85[2] = v77[1];
    v85[3] = v78;
    v58 = v84[0];
    v59 = v67;
    v67[8] = v83;
    v59[9] = v58;
    *(__int128 *)((char *)v59 + 153) = *(_OWORD *)((char *)v84 + 9);
    v59[4] = v50;
    v59[5] = v51;
    v59[6] = v53;
    v59[7] = v52;
    *v59 = v54;
    v59[1] = v55;
    v59[2] = v57;
    v59[3] = v56;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v60 = swift_allocObject();
    *(_OWORD *)(v60 + 16) = xmmword_245FBF370;
    outlined retain of Graph((uint64_t)v85);
    type metadata accessor for MaterialXTarget();
    *(_QWORD *)(v60 + 32) = swift_initStaticObject();
    v75 = v60;
    specialized Array._endMutation()();
    v61 = v75;
    if (v75 >> 62)
    {
      swift_bridgeObjectRetain();
      v62 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      v62 = *(_QWORD *)((v75 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    if (v62)
      v63 = specialized Set.init(_nonEmptyArrayLiteral:)(v61);
    else
      v63 = MEMORY[0x24BEE4B08];
    swift_bridgeObjectRelease();
    outlined consume of NodePersonality(v68);
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    outlined release of Graph((uint64_t)&v89);
    outlined release of Graph((uint64_t)v85);
    v64 = (uint64_t)v59;
    v65 = v72;
    outlined init with take of NodeDef.Implementation.Kind(v64, v72, type metadata accessor for NodeDef.Implementation.Kind);
    result = type metadata accessor for NodeDef.Implementation(0);
    *(_QWORD *)(v65 + *(int *)(result + 20)) = v63;
  }
  else
  {
LABEL_33:
    outlined init with copy of NodeDef.Implementation.Kind(v71, v72, type metadata accessor for NodeDef.Implementation);
    outlined consume of NodePersonality(v68);
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return outlined release of Graph((uint64_t)&v89);
  }
  return result;
}

uint64_t closure #3 in NodeDefStore.applyStandardLibraryFixes()@<X0>(__int128 *a1@<X0>, __int128 *a2@<X8>)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  unsigned __int8 *v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[48];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;

  v3 = a1[3];
  *(_OWORD *)v50 = a1[2];
  *(_OWORD *)&v50[16] = v3;
  v4 = a1[8];
  v5 = a1[6];
  v53 = a1[7];
  v54 = v4;
  v6 = a1[5];
  *(_OWORD *)&v50[32] = a1[4];
  v51 = v6;
  v52 = v5;
  v7 = a1[1];
  v48 = *a1;
  v49 = v7;
  v8 = *(_QWORD *)(v4 + 16);
  if (v8)
  {
    v42 = a2;
    v43 = swift_bridgeObjectRetain();
    v9 = (unsigned __int8 *)(v43 + 88);
    while (1)
    {
      v10 = *v9;
      v11 = one-time initialization token for filename;
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v11 != -1)
        swift_once();
      v12 = MaterialXDataType.isEqual(to:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      if ((v12 & v10 & 1) != 0)
        break;
      v9 += 64;
      if (!--v8)
      {
        swift_bridgeObjectRelease();
        a2 = v42;
        goto LABEL_14;
      }
    }
    v13 = v43;
    swift_bridgeObjectRelease();
    v14 = *(_QWORD *)(v43 + 16);
    v15 = MEMORY[0x24BEE4AF8];
    if (v14)
    {
      v55 = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain();
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v14, 0);
      v16 = 0;
      v15 = v55;
      do
      {
        v17 = v13 + v16;
        v18 = *(_QWORD *)(v13 + v16 + 40);
        v19 = *(_QWORD *)(v13 + v16 + 48);
        v46 = *(_QWORD *)(v13 + v16 + 56);
        v47 = *(_QWORD *)(v13 + v16 + 32);
        v20 = *(_QWORD *)(v13 + v16 + 64);
        v45 = *(_QWORD *)(v13 + v16 + 72);
        v21 = *(_QWORD *)(v13 + v16 + 80);
        v44 = *(_BYTE *)(v17 + 88);
        v22 = MaterialXDataType.isEqual(to:)();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
        swift_bridgeObjectRetain();
        v55 = v15;
        v24 = *(_QWORD *)(v15 + 16);
        v23 = *(_QWORD *)(v15 + 24);
        if (v24 >= v23 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v23 > 1, v24 + 1, 1);
          v15 = v55;
        }
        *(_QWORD *)(v15 + 16) = v24 + 1;
        v25 = v15 + (v24 << 6);
        *(_QWORD *)(v25 + 32) = v47;
        *(_QWORD *)(v25 + 40) = v18;
        *(_QWORD *)(v25 + 48) = v19;
        *(_QWORD *)(v25 + 56) = v46;
        *(_QWORD *)(v25 + 64) = v20;
        *(_QWORD *)(v25 + 72) = v45;
        *(_QWORD *)(v25 + 80) = v21;
        v16 += 64;
        *(_BYTE *)(v25 + 88) = (v22 ^ 1) & v44 & 1;
        --v14;
        v13 = v43;
      }
      while (v14);
      swift_bridgeObjectRelease();
    }
    v31 = *((_QWORD *)&v48 + 1);
    v32 = v49;
    v33 = *(_QWORD *)v50;
    v34 = *(_QWORD *)&v50[40];
    v35 = v51;
    v36 = *((_QWORD *)&v51 + 1);
    v37 = *((_QWORD *)&v52 + 1);
    v38 = v52;
    v39 = v53;
    v40 = *((_QWORD *)&v54 + 1);
    v41 = *((_QWORD *)&v53 + 1);
    *(_QWORD *)v42 = v48;
    *((_QWORD *)v42 + 1) = v31;
    v42[1] = v32;
    *((_QWORD *)v42 + 4) = v33;
    *(__int128 *)((char *)v42 + 40) = *(_OWORD *)&v50[8];
    *(__int128 *)((char *)v42 + 56) = *(_OWORD *)&v50[24];
    *((_QWORD *)v42 + 9) = v34;
    *((_BYTE *)v42 + 80) = v35;
    *((_QWORD *)v42 + 11) = v36;
    v42[6] = __PAIR128__(v37, v38);
    *((_QWORD *)v42 + 14) = v39;
    *((_QWORD *)v42 + 15) = v41;
    *((_QWORD *)v42 + 16) = v15;
    *((_QWORD *)v42 + 17) = v40;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return outlined copy of MaterialXAvailability(v39, v41);
  }
  else
  {
LABEL_14:
    v26 = a1[7];
    a2[6] = a1[6];
    a2[7] = v26;
    a2[8] = a1[8];
    v27 = a1[3];
    a2[2] = a1[2];
    a2[3] = v27;
    v28 = a1[5];
    a2[4] = a1[4];
    a2[5] = v28;
    v29 = a1[1];
    *a2 = *a1;
    a2[1] = v29;
    return outlined retain of NodeDef((uint64_t)&v48);
  }
}

double NodeDefStore.createNode(in:from:label:)@<D0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, _OWORD *a3@<X8>)
{
  __int128 v4;
  double result;
  __int128 v6;
  _OWORD v7[2];

  specialized NodeDefStore.createNode(in:from:label:)(a1, a2, &v6);
  v4 = v7[0];
  *a3 = v6;
  a3[1] = v4;
  result = *(double *)((char *)v7 + 9);
  *(_OWORD *)((char *)a3 + 25) = *(_OWORD *)((char *)v7 + 9);
  return result;
}

uint64_t closure #1 in closure #6 in NodeDefStore.createNode(for:in:)(uint64_t *a1, uint64_t *a2, uint64_t a3, unint64_t a4)
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char v19;
  uint64_t v20;
  uint64_t v23;

  v6 = *a1;
  v5 = a1[1];
  v7 = a2[16];
  v8 = *(_QWORD *)(v7 + 16);
  if (v8)
  {
    v9 = (_QWORD *)(v7 + 40);
    while (1)
    {
      v10 = v9[1];
      v11 = *(v9 - 1) == v6 && *v9 == v5;
      if (v11 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        break;
      v9 += 8;
      if (!--v8)
        goto LABEL_9;
    }
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((MaterialXDataType.isEqual(to:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      return 1;
    }
    if (*(_QWORD *)(v10 + 24))
    {
      if (one-time initialization token for string != -1)
        swift_once();
      v19 = MaterialXDataType.isEqual(to:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      if ((v19 & 1) != 0)
        return 1;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
LABEL_9:
    if (one-time initialization token for logger != -1)
      swift_once();
    v12 = type metadata accessor for Logger();
    __swift_project_value_buffer(v12, (uint64_t)logger);
    outlined retain of NodeDef((uint64_t)a2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    outlined retain of NodeDef((uint64_t)a2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    v13 = Logger.logObject.getter();
    v14 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = swift_slowAlloc();
      v20 = swift_slowAlloc();
      v23 = v20;
      *(_DWORD *)v15 = 136315650;
      v17 = *a2;
      v16 = a2[1];
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v16, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      outlined release of NodeDef((uint64_t)a2);
      outlined release of NodeDef((uint64_t)a2);
      *(_WORD *)(v15 + 12) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a3, a4, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v15 + 22) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v5, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_245E46000, v13, v14, "Nodedef '%s' cannot instantiate element '%s because it does not have input '%s'", (uint8_t *)v15, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24954C33C](v20, -1, -1);
      MEMORY[0x24954C33C](v15, -1, -1);

    }
    else
    {
      outlined release of NodeDef((uint64_t)a2);
      outlined release of NodeDef((uint64_t)a2);

      swift_release_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
  }
  return 0;
}

uint64_t closure #2 in implicit closure #1 in closure #6 in NodeDefStore.createNode(for:in:)(uint64_t *a1, uint64_t *a2, uint64_t a3, unint64_t a4)
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char v19;
  uint64_t v20;
  uint64_t v23;

  v6 = *a1;
  v5 = a1[1];
  v7 = a2[17];
  v8 = *(_QWORD *)(v7 + 16);
  if (v8)
  {
    v9 = (_QWORD *)(v7 + 40);
    while (1)
    {
      v10 = v9[1];
      v11 = *(v9 - 1) == v6 && *v9 == v5;
      if (v11 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        break;
      v9 += 8;
      if (!--v8)
        goto LABEL_9;
    }
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((MaterialXDataType.isEqual(to:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      return 1;
    }
    if (*(_QWORD *)(v10 + 24))
    {
      if (one-time initialization token for string != -1)
        swift_once();
      v19 = MaterialXDataType.isEqual(to:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      if ((v19 & 1) != 0)
        return 1;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
LABEL_9:
    if (one-time initialization token for logger != -1)
      swift_once();
    v12 = type metadata accessor for Logger();
    __swift_project_value_buffer(v12, (uint64_t)logger);
    outlined retain of NodeDef((uint64_t)a2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    outlined retain of NodeDef((uint64_t)a2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    v13 = Logger.logObject.getter();
    v14 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = swift_slowAlloc();
      v20 = swift_slowAlloc();
      v23 = v20;
      *(_DWORD *)v15 = 136315650;
      v17 = *a2;
      v16 = a2[1];
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v16, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      outlined release of NodeDef((uint64_t)a2);
      outlined release of NodeDef((uint64_t)a2);
      *(_WORD *)(v15 + 12) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a3, a4, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v15 + 22) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v5, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_245E46000, v13, v14, "Nodedef '%s' cannot instantiate element '%s because it does not have output '%s'", (uint8_t *)v15, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24954C33C](v20, -1, -1);
      MEMORY[0x24954C33C](v15, -1, -1);

    }
    else
    {
      outlined release of NodeDef((uint64_t)a2);
      outlined release of NodeDef((uint64_t)a2);

      swift_release_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
  }
  return 0;
}

unint64_t specialized _NativeDictionary._delete(at:)(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  Swift::UInt v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  __int128 *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = _HashTable.previousHole(before:)();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v11 = *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * v6);
        Hasher.init(_seed:)();
        Hasher._combine(_:)(v11);
        result = Hasher._finalize()();
        v12 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8)
            goto LABEL_5;
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          v13 = *(_QWORD *)(a2 + 48);
          v14 = (_QWORD *)(v13 + 8 * v3);
          v15 = (_QWORD *)(v13 + 8 * v6);
          if (v3 != v6 || v14 >= v15 + 1)
            *v14 = *v15;
          v16 = *(_QWORD *)(a2 + 56);
          v17 = v16 + 40 * v3;
          v18 = (__int128 *)(v16 + 40 * v6);
          if (v3 != v6 || (v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            v9 = *v18;
            v10 = v18[1];
            *(_QWORD *)(v17 + 32) = *((_QWORD *)v18 + 4);
            *(_OWORD *)v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  Swift::Int v12;
  unint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t v17;
  __int128 *v18;
  __int128 *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = _HashTable.previousHole(before:)();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        v12 = Hasher._finalize()();
        result = swift_bridgeObjectRelease();
        v13 = v12 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v13 < v8)
            goto LABEL_5;
        }
        else if (v13 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v13)
        {
LABEL_11:
          v14 = *(_QWORD *)(a2 + 48);
          v15 = (_OWORD *)(v14 + 16 * v3);
          v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || v15 >= v16 + 1)
            *v15 = *v16;
          v17 = *(_QWORD *)(a2 + 56);
          v18 = (__int128 *)(v17 + (v3 << 6));
          v19 = (__int128 *)(v17 + (v6 << 6));
          if (v3 << 6 != v6 << 6 || (v3 = v6, v18 >= v19 + 4))
          {
            v9 = *v19;
            v10 = v19[1];
            v11 = v19[3];
            v18[2] = v19[2];
            v18[3] = v11;
            *v18 = v9;
            v18[1] = v10;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    v22 = *v20;
    v21 = (-1 << result) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  Swift::Int v9;
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
    result = _HashTable.previousHole(before:)();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        v9 = Hasher._finalize()();
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

uint64_t specialized Sequence.filter(_:)(uint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t i;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  __int128 *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  unint64_t v25;
  unint64_t v26;
  _OWORD *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  int64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;

  v5 = result;
  v6 = 0;
  v7 = result + 64;
  v8 = 1 << *(_BYTE *)(result + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(result + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = MEMORY[0x24BEE4AF8];
  v34 = v11;
  if (v10)
    goto LABEL_7;
LABEL_8:
  v15 = v6 + 1;
  if (!__OFADD__(v6, 1))
  {
    if (v15 < v11)
    {
      v16 = *(_QWORD *)(v7 + 8 * v15);
      ++v6;
      if (v16)
        goto LABEL_23;
      v6 = v15 + 1;
      if (v15 + 1 >= v11)
        goto LABEL_31;
      v16 = *(_QWORD *)(v7 + 8 * v6);
      if (v16)
        goto LABEL_23;
      v6 = v15 + 2;
      if (v15 + 2 >= v11)
        goto LABEL_31;
      v16 = *(_QWORD *)(v7 + 8 * v6);
      if (v16)
        goto LABEL_23;
      v6 = v15 + 3;
      if (v15 + 3 >= v11)
        goto LABEL_31;
      v16 = *(_QWORD *)(v7 + 8 * v6);
      if (v16)
      {
LABEL_23:
        v10 = (v16 - 1) & v16;
        for (i = __clz(__rbit64(v16)) + (v6 << 6); ; i = v13 | (v6 << 6))
        {
          v18 = (__int128 *)(*(_QWORD *)(v5 + 56) + 144 * i);
          v35 = *v18;
          v19 = v18[4];
          v21 = v18[1];
          v20 = v18[2];
          v38 = v18[3];
          v39 = v19;
          v36 = v21;
          v37 = v20;
          v22 = v18[8];
          v24 = v18[5];
          v23 = v18[6];
          v42 = v18[7];
          v43 = v22;
          v40 = v24;
          v41 = v23;
          if (v36 == __PAIR128__(a3, a2) || (result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
          {
            outlined retain of NodeDef((uint64_t)&v35);
            result = swift_isUniquelyReferenced_nonNull_native();
            v44 = v12;
            if ((result & 1) == 0)
            {
              result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v12 + 16) + 1, 1);
              v12 = v44;
            }
            v26 = *(_QWORD *)(v12 + 16);
            v25 = *(_QWORD *)(v12 + 24);
            if (v26 >= v25 >> 1)
            {
              result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v25 > 1, v26 + 1, 1);
              v12 = v44;
            }
            *(_QWORD *)(v12 + 16) = v26 + 1;
            v27 = (_OWORD *)(v12 + 144 * v26);
            v27[2] = v35;
            v28 = v36;
            v29 = v37;
            v30 = v39;
            v27[5] = v38;
            v27[6] = v30;
            v27[3] = v28;
            v27[4] = v29;
            v31 = v40;
            v32 = v41;
            v33 = v43;
            v27[9] = v42;
            v27[10] = v33;
            v27[7] = v31;
            v27[8] = v32;
            v11 = v34;
            if (!v10)
              goto LABEL_8;
          }
          else if (!v10)
          {
            goto LABEL_8;
          }
LABEL_7:
          v13 = __clz(__rbit64(v10));
          v10 &= v10 - 1;
        }
      }
      v17 = v15 + 4;
      if (v17 < v11)
      {
        v16 = *(_QWORD *)(v7 + 8 * v17);
        if (v16)
        {
          v6 = v17;
          goto LABEL_23;
        }
        while (1)
        {
          v6 = v17 + 1;
          if (__OFADD__(v17, 1))
            goto LABEL_33;
          if (v6 >= v11)
            break;
          v16 = *(_QWORD *)(v7 + 8 * v6);
          ++v17;
          if (v16)
            goto LABEL_23;
        }
      }
    }
LABEL_31:
    swift_release();
    return v12;
  }
  __break(1u);
LABEL_33:
  __break(1u);
  return result;
}

uint64_t specialized _ArrayProtocol.filter(_:)(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t *a5)
{
  unint64_t v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  __int128 *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  _OWORD *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t *v37;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;

  v5 = *(_QWORD *)(result + 16);
  if (v5)
  {
    v8 = a2;
    v9 = 0;
    v43 = result + 32;
    v37 = (uint64_t *)(a2 + 48);
    v40 = MEMORY[0x24BEE4AF8];
    v42 = *(_QWORD *)(result + 16);
    while (1)
    {
      if (v9 <= v5)
        v10 = v5;
      else
        v10 = v9;
      v41 = v10;
      while (1)
      {
        if (v9 == v10)
        {
          __break(1u);
          return result;
        }
        v11 = (__int128 *)(v43 + 144 * v9);
        v12 = v11[7];
        v54 = v11[6];
        v55 = v12;
        v56 = v11[8];
        v13 = v11[3];
        v50 = v11[2];
        v51 = v13;
        v14 = v11[5];
        v52 = v11[4];
        v53 = v14;
        v15 = v11[1];
        v48 = *v11;
        v49 = v15;
        v16 = *(_QWORD *)(v8 + 16);
        outlined retain of NodeDef((uint64_t)&v48);
        v44 = v9 + 1;
        if (v16)
        {
          swift_bridgeObjectRetain();
          v17 = v37;
          while (1)
          {
            v19 = *(v17 - 1);
            v18 = *v17;
            v45 = *(v17 - 2);
            v46 = v19;
            v47 = v18;
            swift_bridgeObjectRetain();
            swift_retain();
            v20 = closure #1 in closure #6 in NodeDefStore.createNode(for:in:)(&v45, (uint64_t *)&v48, a3, a4);
            swift_release();
            swift_bridgeObjectRelease();
            if ((v20 & 1) == 0)
              break;
            v17 += 3;
            if (!--v16)
            {
              swift_bridgeObjectRelease();
              goto LABEL_13;
            }
          }
          swift_bridgeObjectRelease();
          result = outlined release of NodeDef((uint64_t)&v48);
          goto LABEL_20;
        }
LABEL_13:
        v21 = *a5;
        v22 = *(_QWORD *)(*a5 + 16);
        if (!v22)
          break;
        swift_bridgeObjectRetain();
        v23 = (uint64_t *)(v21 + 48);
        while (1)
        {
          v25 = *(v23 - 1);
          v24 = *v23;
          v45 = *(v23 - 2);
          v46 = v25;
          v47 = v24;
          swift_bridgeObjectRetain();
          swift_retain();
          v26 = closure #2 in implicit closure #1 in closure #6 in NodeDefStore.createNode(for:in:)(&v45, (uint64_t *)&v48, a3, a4);
          swift_release();
          swift_bridgeObjectRelease();
          if ((v26 & 1) == 0)
            break;
          v23 += 3;
          if (!--v22)
          {
            swift_bridgeObjectRelease();
            goto LABEL_22;
          }
        }
        swift_bridgeObjectRelease();
        result = outlined release of NodeDef((uint64_t)&v48);
        v8 = a2;
LABEL_20:
        v10 = v41;
        v9 = v44;
        if (v44 == v42)
          return v40;
      }
LABEL_22:
      v27 = v40;
      result = swift_isUniquelyReferenced_nonNull_native();
      v57 = v40;
      if ((result & 1) == 0)
      {
        result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v40 + 16) + 1, 1);
        v27 = v57;
      }
      v8 = a2;
      v29 = *(_QWORD *)(v27 + 16);
      v28 = *(_QWORD *)(v27 + 24);
      if (v29 >= v28 >> 1)
      {
        result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v28 > 1, v29 + 1, 1);
        v27 = v57;
      }
      *(_QWORD *)(v27 + 16) = v29 + 1;
      v40 = v27;
      v30 = (_OWORD *)(v27 + 144 * v29);
      v30[2] = v48;
      v31 = v49;
      v32 = v50;
      v33 = v52;
      v30[5] = v51;
      v30[6] = v33;
      v30[3] = v31;
      v30[4] = v32;
      v34 = v53;
      v35 = v54;
      v36 = v56;
      v30[9] = v55;
      v30[10] = v36;
      v30[7] = v34;
      v30[8] = v35;
      v5 = v42;
      v9 = v44;
      if (v44 == v42)
        return v40;
    }
  }
  return MEMORY[0x24BEE4AF8];
}

double specialized NodeDefStore.createNode(in:from:label:)@<D0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  double result;
  __int128 v32;
  _OWORD v33[2];
  uint64_t v34;
  uint64_t v35;

  v3 = a2[16];
  v35 = v3;
  v4 = *(_QWORD *)(v3 + 16);
  v5 = MEMORY[0x24BEE4AF8];
  if (v4)
  {
    *(_QWORD *)&v32 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4, 0);
    v5 = v32;
    v6 = (uint64_t *)(v3 + 48);
    do
    {
      v7 = *(v6 - 2);
      v8 = *(v6 - 1);
      v9 = *v6;
      *(_QWORD *)&v32 = v5;
      v11 = *(_QWORD *)(v5 + 16);
      v10 = *(_QWORD *)(v5 + 24);
      swift_bridgeObjectRetain();
      swift_retain();
      if (v11 >= v10 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v10 > 1, v11 + 1, 1);
        v5 = v32;
      }
      v6 += 8;
      *(_QWORD *)(v5 + 16) = v11 + 1;
      v12 = (_QWORD *)(v5 + 24 * v11);
      v12[4] = v7;
      v12[5] = v8;
      v12[6] = v9;
      --v4;
    }
    while (v4);
    outlined release of [Input]((uint64_t)&v35);
    v13 = a2;
  }
  else
  {
    v13 = a2;
  }
  v14 = v13[17];
  v34 = v14;
  v15 = *(_QWORD *)(v14 + 16);
  v16 = MEMORY[0x24BEE4AF8];
  if (v15)
  {
    *(_QWORD *)&v32 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v15, 0);
    v16 = v32;
    v17 = (uint64_t *)(v14 + 48);
    do
    {
      v18 = *(v17 - 2);
      v19 = *(v17 - 1);
      v20 = *v17;
      *(_QWORD *)&v32 = v16;
      v22 = *(_QWORD *)(v16 + 16);
      v21 = *(_QWORD *)(v16 + 24);
      swift_bridgeObjectRetain();
      swift_retain();
      if (v22 >= v21 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v21 > 1, v22 + 1, 1);
        v16 = v32;
      }
      v17 += 8;
      *(_QWORD *)(v16 + 16) = v22 + 1;
      v23 = (_QWORD *)(v16 + 24 * v22);
      v23[4] = v18;
      v23[5] = v19;
      v23[6] = v20;
      --v15;
    }
    while (v15);
    outlined release of [Input]((uint64_t)&v34);
    v13 = a2;
  }
  v24 = swift_allocObject();
  v25 = v13[1];
  *(_QWORD *)(v24 + 16) = *v13;
  *(_QWORD *)(v24 + 24) = v25;
  v26 = *(_QWORD *)(a1 + 40);
  swift_bridgeObjectRetain();
  specialized static Graph._insertNode(graphID:inputs:outputs:shaderGraphData:nodes:adjacency:)(v26, v5, v16, v24 | 0xA000000000000000, a1 + 64, a1, (unint64_t *)&v32);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v27 = v33[0];
  *a3 = v32;
  a3[1] = v27;
  result = *(double *)((char *)v33 + 9);
  *(_OWORD *)((char *)a3 + 25) = *(_OWORD *)((char *)v33 + 9);
  return result;
}

uint64_t specialized NodeDefStore.createNode(for:in:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _OWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t ObjectType;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t (*v11)(uint64_t, unint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  Swift::String v14;
  Swift::String v15;
  __int128 v16;
  _OWORD *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  _QWORD *v39;
  unint64_t v40;
  int64_t v41;
  uint64_t v42;
  _QWORD *v43;
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
  _QWORD *v56;
  unint64_t v57;
  unint64_t v58;
  _QWORD *v59;
  _OWORD *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  unint64_t v80;
  _QWORD *v81;
  unint64_t v82;
  int64_t v83;
  _QWORD *v84;
  _QWORD *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  _QWORD *v92;
  unint64_t v93;
  unint64_t v94;
  _QWORD *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  _QWORD *v100;
  unint64_t v101;
  unint64_t v102;
  _QWORD *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  Swift::String v113;
  uint64_t v114;
  Swift::String v115;
  Swift::String v116;
  Swift::String v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  void *v121;
  Swift::String v122;
  Swift::String v123;
  Swift::String v124;
  Swift::String v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  void *v129;
  Swift::String v130;
  Swift::String v131;
  _OWORD *v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  void *v143;
  void *v144;
  uint64_t (*v145)(uint64_t, unint64_t, uint64_t, uint64_t);
  uint64_t v146;
  uint64_t v147;
  _OWORD *v148;
  unint64_t v149;
  int64_t v151;
  uint64_t v152;
  uint64_t v153;
  __int128 v154;
  __int128 v155[10];
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  _OWORD v170[2];
  _OWORD v171[10];
  _QWORD *v172;

  ObjectType = swift_getObjectType();
  v7 = *(_QWORD *)(a1 + 8);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(ObjectType, v7);
  if (v9)
  {
    v10 = v9;
    v149 = v8;
    v11 = *(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v7 + 48);
    v12 = v11(0x7475706E692F2ELL, 0xE700000000000000, ObjectType, v7);
    if (v3)
    {
      return swift_bridgeObjectRelease();
    }
    else
    {
      v27 = v12;
      v145 = v11;
      v146 = v7;
      v147 = ObjectType;
      v28 = *(_QWORD *)(v12 + 16);
      v29 = MEMORY[0x24BEE4AF8];
      v148 = a3;
      if (v28)
      {
        swift_bridgeObjectRetain();
        v30 = (_QWORD *)MEMORY[0x24BEE4AF8];
        v31 = 32;
        do
        {
          v33 = *(_QWORD *)(v27 + v31);
          swift_getObjectType();
          v34 = swift_conformsToProtocol2();
          if (v34)
            v35 = v33;
          else
            v35 = 0;
          if (v34)
            v36 = v34;
          else
            v36 = 0;
          if (v35)
          {
            swift_unknownObjectRetain();
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v30 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v30[2] + 1, 1, v30);
            v37 = v30;
            v38 = v30[2];
            v39 = v37;
            v40 = v37[3];
            if (v38 >= v40 >> 1)
              v39 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v40 > 1), v38 + 1, 1, v39);
            v39[2] = v38 + 1;
            v32 = &v39[2 * v38];
            v30 = v39;
            v32[4] = v35;
            v32[5] = v36;
          }
          v31 += 16;
          --v28;
        }
        while (v28);
        swift_bridgeObjectRelease();
        a3 = v148;
        v29 = MEMORY[0x24BEE4AF8];
      }
      else
      {
        v30 = (_QWORD *)MEMORY[0x24BEE4AF8];
      }
      swift_bridgeObjectRelease();
      v41 = v30[2];
      if (v41)
      {
        v143 = v10;
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v41, 0);
        v42 = v29;
        v43 = v30 + 5;
        while (1)
        {
          swift_getObjectType();
          swift_unknownObjectRetain();
          v152 = XMLNode.subscript.getter(1701667182, 0xE400000000000000);
          if (!v44)
            break;
          v45 = v44;
          v151 = v41;
          v46 = v42;
          v47 = XMLNode.subscript.getter(1701869940, 0xE400000000000000);
          if (!v48)
          {
            swift_bridgeObjectRelease();
            break;
          }
          v49 = v47;
          v50 = v48;
          v51 = XMLNode.subscript.getter(1836412517, 0xE400000000000000);
          if (v52)
          {
            v53 = v51;
            v54 = v52;
            swift_bridgeObjectRelease();
            *(_QWORD *)&v156 = v53;
            *((_QWORD *)&v156 + 1) = v54;
            *(_QWORD *)&v155[0] = 44;
            *((_QWORD *)&v155[0] + 1) = 0xE100000000000000;
            lazy protocol witness table accessor for type String and conformance String();
            v55 = StringProtocol.components<A>(separatedBy:)();
            swift_bridgeObjectRelease();
            type metadata accessor for MaterialXDataType();
            v56 = (_QWORD *)swift_allocObject();
            v56[4] = v152;
            v56[5] = v45;
            v56[3] = v55;
            v56[2] = MEMORY[0x24BEE4AF8];
            swift_bridgeObjectRetain();
          }
          else
          {
            type metadata accessor for MaterialXDataType();
            v56 = (_QWORD *)swift_allocObject();
            v56[4] = v49;
            v56[5] = v50;
            v56[3] = 0;
            v56[2] = MEMORY[0x24BEE4AF8];
          }
          swift_unknownObjectRelease();
          v42 = v46;
          v58 = *(_QWORD *)(v46 + 16);
          v57 = *(_QWORD *)(v46 + 24);
          if (v58 >= v57 >> 1)
          {
            specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v57 > 1, v58 + 1, 1);
            v42 = v46;
          }
          *(_QWORD *)(v42 + 16) = v58 + 1;
          v59 = (_QWORD *)(v42 + 24 * v58);
          v59[4] = v152;
          v59[5] = v45;
          v59[6] = v56;
          v43 += 2;
          v41 = v151 - 1;
          if (v151 == 1)
          {
            swift_bridgeObjectRelease();
            v10 = v143;
            a3 = v148;
            goto LABEL_36;
          }
        }
        _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi47_((uint64_t)v155);
        outlined init with take of UserGraphError.ErrorType(v155, (uint64_t)&v156);
        *(_QWORD *)&v168 = 0xD000000000000020;
        *((_QWORD *)&v168 + 1) = 0x8000000245FCE790;
        lazy protocol witness table accessor for type UserGraphError and conformance UserGraphError();
        swift_allocError();
        *v60 = v156;
        v61 = v160;
        v63 = v157;
        v62 = v158;
        v60[3] = v159;
        v60[4] = v61;
        v60[1] = v63;
        v60[2] = v62;
        v64 = v164;
        v66 = v161;
        v65 = v162;
        v60[7] = v163;
        v60[8] = v64;
        v60[5] = v66;
        v60[6] = v65;
        v67 = v168;
        v69 = v165;
        v68 = v166;
        v60[11] = v167;
        v60[12] = v67;
        v60[9] = v69;
        v60[10] = v68;
        swift_willThrow();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        return swift_unknownObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        v42 = MEMORY[0x24BEE4AF8];
LABEL_36:
        v70 = v145(0x74757074756F2F2ELL, 0xE800000000000000, v147, v146);
        v153 = v42;
        v71 = *(_QWORD *)(v70 + 16);
        v72 = (_QWORD *)MEMORY[0x24BEE4AF8];
        if (v71)
        {
          swift_bridgeObjectRetain();
          v73 = 32;
          do
          {
            v75 = *(_QWORD *)(v70 + v73);
            swift_getObjectType();
            v76 = swift_conformsToProtocol2();
            if (v76)
              v77 = v75;
            else
              v77 = 0;
            if (v76)
              v78 = v76;
            else
              v78 = 0;
            if (v77)
            {
              swift_unknownObjectRetain();
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v72 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v72[2] + 1, 1, v72);
              v79 = v72;
              v80 = v72[2];
              v81 = v79;
              v82 = v79[3];
              if (v80 >= v82 >> 1)
                v81 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v82 > 1), v80 + 1, 1, v81);
              v81[2] = v80 + 1;
              v74 = &v81[2 * v80];
              v72 = v81;
              v74[4] = v77;
              v74[5] = v78;
            }
            v73 += 16;
            --v71;
          }
          while (v71);
          swift_bridgeObjectRelease();
          a3 = v148;
        }
        swift_bridgeObjectRelease();
        v83 = v72[2];
        if (v83)
        {
          v144 = v10;
          *(_QWORD *)&v156 = MEMORY[0x24BEE4AF8];
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v83, 0);
          v84 = (_QWORD *)v156;
          v85 = v72 + 5;
          while (1)
          {
            swift_getObjectType();
            swift_unknownObjectRetain();
            result = XMLNode.subscript.getter(1701667182, 0xE400000000000000);
            if (!v86)
              break;
            v87 = result;
            v88 = v86;
            result = XMLNode.subscript.getter(1701869940, 0xE400000000000000);
            if (!v89)
              goto LABEL_84;
            v90 = result;
            v91 = v89;
            type metadata accessor for MaterialXDataType();
            v92 = (_QWORD *)swift_allocObject();
            v92[4] = v90;
            v92[5] = v91;
            v92[3] = 0;
            v92[2] = MEMORY[0x24BEE4AF8];
            swift_unknownObjectRelease();
            *(_QWORD *)&v156 = v84;
            v94 = v84[2];
            v93 = v84[3];
            if (v94 >= v93 >> 1)
            {
              specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v93 > 1, v94 + 1, 1);
              v84 = (_QWORD *)v156;
            }
            v84[2] = v94 + 1;
            v95 = &v84[3 * v94];
            v95[4] = v87;
            v95[5] = v88;
            v95[6] = v92;
            v85 += 2;
            if (!--v83)
            {
              swift_bridgeObjectRelease();
              v10 = v144;
              a3 = v148;
              goto LABEL_61;
            }
          }
          __break(1u);
LABEL_84:
          __break(1u);
        }
        else
        {
          swift_bridgeObjectRelease();
          v84 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_61:
          v172 = v84;
          if (!v84[2])
          {
            v96 = XMLNode.subscript.getter(1701869940, 0xE400000000000000);
            if (v97)
            {
              v98 = v96;
              v99 = v97;
              if (v96 == 0x74756F69746C756DLL && v97 == 0xEB00000000747570
                || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
              {
                swift_bridgeObjectRelease();
              }
              else
              {
                type metadata accessor for MaterialXDataType();
                v100 = (_QWORD *)swift_allocObject();
                v100[4] = v98;
                v100[5] = v99;
                v100[3] = 0;
                v100[2] = MEMORY[0x24BEE4AF8];
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                  v84 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v84[2] + 1, 1, v84);
                v102 = v84[2];
                v101 = v84[3];
                if (v102 >= v101 >> 1)
                  v84 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v101 > 1), v102 + 1, 1, v84);
                v84[2] = v102 + 1;
                v103 = &v84[3 * v102];
                v103[4] = 7632239;
                v103[5] = 0xE300000000000000;
                v103[6] = v100;
                v172 = v84;
              }
            }
          }
          swift_bridgeObjectRetain();
          v104 = swift_bridgeObjectRetain();
          v105 = specialized Sequence.filter(_:)(v104, v149, (unint64_t)v10);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          v106 = swift_bridgeObjectRetain();
          v107 = specialized _ArrayProtocol.filter(_:)(v106, v153, v149, (unint64_t)v10, (uint64_t *)&v172);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (*(_QWORD *)(v107 + 16))
          {
            v108 = *(_OWORD *)(v107 + 128);
            v171[5] = *(_OWORD *)(v107 + 112);
            v171[6] = v108;
            v109 = *(_OWORD *)(v107 + 160);
            v171[7] = *(_OWORD *)(v107 + 144);
            v171[8] = v109;
            v110 = *(_OWORD *)(v107 + 48);
            v111 = *(_OWORD *)(v107 + 80);
            v112 = *(_OWORD *)(v107 + 96);
            v171[2] = *(_OWORD *)(v107 + 64);
            v171[3] = v111;
            v171[4] = v112;
            v171[0] = *(_OWORD *)(v107 + 32);
            v171[1] = v110;
            outlined retain of NodeDef((uint64_t)v171);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v113._countAndFlagsBits = 1701667182;
            v113._object = (void *)0xE400000000000000;
            XMLElement.getRequiredAttribute(_:)(v113);
            if (v114)
            {
              outlined release of NodeDef((uint64_t)v171);
              return swift_bridgeObjectRelease();
            }
            else
            {
              specialized NodeDefStore.createNode(in:from:label:)(a2, v171, &v169);
              swift_bridgeObjectRelease();
              outlined release of NodeDef((uint64_t)v171);
              result = swift_bridgeObjectRelease();
              v142 = v170[0];
              *a3 = v169;
              a3[1] = v142;
              *(_OWORD *)((char *)a3 + 25) = *(_OWORD *)((char *)v170 + 9);
            }
          }
          else
          {
            swift_bridgeObjectRelease();
            *(_QWORD *)&v156 = 0;
            *((_QWORD *)&v156 + 1) = 0xE000000000000000;
            _StringGuts.grow(_:)(88);
            v154 = v156;
            v115._countAndFlagsBits = 0xD00000000000002DLL;
            v115._object = (void *)0x8000000245FCE7C0;
            String.append(_:)(v115);
            v116._countAndFlagsBits = v149;
            v116._object = v10;
            String.append(_:)(v116);
            swift_bridgeObjectRelease();
            v117._countAndFlagsBits = 0x223D656D616E20;
            v117._object = (void *)0xE700000000000000;
            String.append(_:)(v117);
            v118 = XMLNode.subscript.getter(1701667182, 0xE400000000000000);
            if (v119)
              v120 = v118;
            else
              v120 = 0x3E6C696E3CLL;
            if (v119)
              v121 = v119;
            else
              v121 = (void *)0xE500000000000000;
            _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi47_((uint64_t)v155);
            v122._countAndFlagsBits = v120;
            v122._object = v121;
            String.append(_:)(v122);
            swift_bridgeObjectRelease();
            v123._countAndFlagsBits = 0x756F203E2E2E2E22;
            v123._object = (void *)0xED000020666F2074;
            String.append(_:)(v123);
            *(_QWORD *)&v156 = *(_QWORD *)(v105 + 16);
            v124._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
            String.append(_:)(v124);
            swift_bridgeObjectRelease();
            v125._countAndFlagsBits = 0x616469646E616320;
            v125._object = (void *)0xEE005B202E736574;
            String.append(_:)(v125);
            v126 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay11ShaderGraph7NodeDefVG_SSs5NeverOTg504_s11d7Graph12fG120StoreV06createC03for2inAA0abC0VAA10XMLElement_p_AA0B0VztKFSSAA0cD0Vcfu0_32dc54af7003c11ac2eedf40a685444c7bAMSSTf3nnnpk_nTf1cn_n(v105);
            swift_bridgeObjectRelease();
            *(_QWORD *)&v156 = v126;
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [String]);
            lazy protocol witness table accessor for type [String] and conformance [A]();
            v127 = BidirectionalCollection<>.joined(separator:)();
            v129 = v128;
            swift_bridgeObjectRelease();
            v130._countAndFlagsBits = v127;
            v130._object = v129;
            String.append(_:)(v130);
            swift_bridgeObjectRelease();
            v131._countAndFlagsBits = 93;
            v131._object = (void *)0xE100000000000000;
            String.append(_:)(v131);
            outlined init with take of UserGraphError.ErrorType(v155, (uint64_t)&v156);
            v168 = v154;
            lazy protocol witness table accessor for type UserGraphError and conformance UserGraphError();
            swift_allocError();
            *v132 = v156;
            v133 = v160;
            v135 = v157;
            v134 = v158;
            v132[3] = v159;
            v132[4] = v133;
            v132[1] = v135;
            v132[2] = v134;
            v136 = v164;
            v138 = v161;
            v137 = v162;
            v132[7] = v163;
            v132[8] = v136;
            v132[5] = v138;
            v132[6] = v137;
            v139 = v168;
            v141 = v165;
            v140 = v166;
            v132[11] = v167;
            v132[12] = v139;
            v132[9] = v141;
            v132[10] = v140;
            swift_willThrow();
            return swift_bridgeObjectRelease();
          }
        }
      }
    }
  }
  else
  {
    _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi47_((uint64_t)v155);
    *(_QWORD *)&v156 = 0;
    *((_QWORD *)&v156 + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(58);
    v14._countAndFlagsBits = 0xD000000000000037;
    v14._object = (void *)0x8000000245FCE750;
    String.append(_:)(v14);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XMLElement);
    _print_unlocked<A, B>(_:_:)();
    v15._countAndFlagsBits = 62;
    v15._object = (void *)0xE100000000000000;
    String.append(_:)(v15);
    v16 = v156;
    outlined init with take of UserGraphError.ErrorType(v155, (uint64_t)&v156);
    v168 = v16;
    lazy protocol witness table accessor for type UserGraphError and conformance UserGraphError();
    swift_allocError();
    *v17 = v156;
    v18 = v160;
    v20 = v157;
    v19 = v158;
    v17[3] = v159;
    v17[4] = v18;
    v17[1] = v20;
    v17[2] = v19;
    v21 = v164;
    v23 = v161;
    v22 = v162;
    v17[7] = v163;
    v17[8] = v21;
    v17[5] = v23;
    v17[6] = v22;
    v24 = v168;
    v26 = v165;
    v25 = v166;
    v17[11] = v167;
    v17[12] = v24;
    v17[9] = v26;
    v17[10] = v25;
    return swift_willThrow();
  }
  return result;
}

uint64_t specialized Sequence.forEach(_:)(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  unint64_t i;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  int64_t v22;

  v3 = v2;
  v6 = a1 + 64;
  v7 = 1 << *(_BYTE *)(a1 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a1 + 64);
  v22 = (unint64_t)(v7 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v11 = 0;
  if (!v9)
    goto LABEL_5;
LABEL_4:
  v12 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    v17 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * i);
    v18 = *v17;
    v19 = v17[1];
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * i);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    a2(v18, v19, v20);
    if (v3)
    {
      swift_release();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if (v9)
      goto LABEL_4;
LABEL_5:
    if (__OFADD__(v11++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v11 >= v22)
      return swift_release();
    v15 = *(_QWORD *)(v6 + 8 * v11);
    if (!v15)
    {
      v16 = v11 + 1;
      if (v11 + 1 >= v22)
        return swift_release();
      v15 = *(_QWORD *)(v6 + 8 * v16);
      if (v15)
        goto LABEL_14;
      v16 = v11 + 2;
      if (v11 + 2 >= v22)
        return swift_release();
      v15 = *(_QWORD *)(v6 + 8 * v16);
      if (v15)
        goto LABEL_14;
      v16 = v11 + 3;
      if (v11 + 3 >= v22)
        return swift_release();
      v15 = *(_QWORD *)(v6 + 8 * v16);
      if (v15)
      {
LABEL_14:
        v11 = v16;
        goto LABEL_15;
      }
      v21 = v11 + 4;
      if (v11 + 4 >= v22)
        return swift_release();
      v15 = *(_QWORD *)(v6 + 8 * v21);
      v11 += 4;
      if (!v15)
        break;
    }
LABEL_15:
    v9 = (v15 - 1) & v15;
  }
  while (1)
  {
    v11 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v11 >= v22)
      return swift_release();
    v15 = *(_QWORD *)(v6 + 8 * v11);
    ++v21;
    if (v15)
      goto LABEL_15;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t specialized static NodeDefStore.createDefault()()
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
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v24;
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
  char v46;
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
  unint64_t v61;
  char v62;
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
  unint64_t v78;
  char v79;
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
  unint64_t v93;
  char v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  char v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  char v133;
  unint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  char v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  char v149;
  unint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  unint64_t v156;
  char v157;
  unint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  char v165;
  unint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
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
  unint64_t v181;
  unint64_t v182;
  uint64_t v183;
  char v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  char v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  unint64_t v195;
  uint64_t v196;
  uint64_t v197;
  unint64_t v198;
  char v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  char v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  unint64_t v210;
  unint64_t v211;
  uint64_t v212;
  char v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  char v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  unint64_t v224;
  unint64_t v225;
  uint64_t v226;
  char v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  char v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  unint64_t v237;
  unint64_t v238;
  uint64_t v239;
  char v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  char v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  unint64_t v251;
  unint64_t v252;
  uint64_t v253;
  char v254;
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
  unint64_t v265;
  unint64_t v266;
  uint64_t v267;
  char v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  char v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  unint64_t v279;
  unint64_t v280;
  uint64_t v281;
  char v282;
  uint64_t v283;
  uint64_t v284;
  unint64_t v286;
  char v287;
  char v288;
  char v289;
  uint64_t v290;
  unint64_t v291;
  char v292;
  char v293;
  char v294;
  uint64_t v295;
  unint64_t v296;
  char v297;
  char v298;
  char v299;
  uint64_t v300;
  uint64_t v301;
  _QWORD *v302;
  _QWORD *v303;
  _QWORD *v304;
  _QWORD *v305;
  _QWORD *v306;
  _QWORD *v307;
  _QWORD *v308;
  _QWORD *v309;
  __int128 v310;
  uint64_t v311;
  __int128 v312;
  __int128 v313;
  uint64_t v314;
  __int128 v315;
  unint64_t v316;
  __int128 v317;
  uint64_t v318;
  uint64_t v319;
  unint64_t v320;
  __int128 v321;
  unint64_t v322;
  unint64_t v323;
  unint64_t v324;
  unint64_t v325;
  __int128 v326;
  unint64_t v327;
  unint64_t v328;
  uint64_t v329;
  uint64_t v330;
  unint64_t v331;
  unint64_t v332;
  uint64_t v333;
  uint64_t v334;
  char v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  __int128 v343;
  unint64_t v344;
  unint64_t v345;
  uint64_t v346;
  uint64_t v347;
  unint64_t v348;
  unint64_t v349;
  uint64_t v350;
  uint64_t v351;
  char v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  __int128 v360;
  unint64_t v361;
  unint64_t v362;
  uint64_t v363;
  uint64_t v364;
  unint64_t v365;
  unint64_t v366;
  uint64_t v367;
  uint64_t v368;
  char v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  __int128 v377;
  unint64_t v378;
  unint64_t v379;
  uint64_t v380;
  uint64_t v381;
  unint64_t v382;
  unint64_t v383;
  uint64_t v384;
  uint64_t v385;
  char v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  __int128 v394;
  unint64_t v395;
  unint64_t v396;
  uint64_t v397;
  uint64_t v398;
  unint64_t v399;
  unint64_t v400;
  uint64_t v401;
  uint64_t v402;
  char v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  __int128 v411;
  char v412[16];
  uint64_t v413;
  uint64_t v414;
  unint64_t v415;
  unint64_t v416;
  uint64_t v417;
  uint64_t v418;
  char v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  __int128 v427;
  _WORD v428[8];
  uint64_t v429;
  uint64_t v430;
  unint64_t v431;
  unint64_t v432;
  uint64_t v433;
  uint64_t v434;
  char v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  __int128 v443;
  unint64_t v444;
  unint64_t v445;
  uint64_t v446;
  uint64_t v447;
  unint64_t v448;
  unint64_t v449;
  uint64_t v450;
  uint64_t v451;
  char v452;
  _BYTE v453[7];
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  __int128 v461;
  unint64_t v462;
  unint64_t v463;
  uint64_t v464;
  uint64_t v465;
  unint64_t v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  char v470;
  _BYTE v471[7];
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  __int128 v479;
  unint64_t v480;
  unint64_t v481;
  uint64_t v482;
  uint64_t v483;
  unint64_t v484;
  uint64_t v485;
  uint64_t v486;
  uint64_t v487;
  char v488;
  _BYTE v489[7];
  uint64_t v490;
  uint64_t v491;
  uint64_t v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t v496;
  __int128 v497;
  unint64_t v498;
  unint64_t v499;
  uint64_t v500;
  uint64_t v501;
  unint64_t v502;
  uint64_t v503;
  uint64_t v504;
  uint64_t v505;
  char v506;
  _BYTE v507[7];
  uint64_t v508;
  uint64_t v509;
  uint64_t v510;
  uint64_t v511;
  uint64_t v512;
  uint64_t v513;
  uint64_t v514;
  __int128 v515;
  unint64_t v516;
  unint64_t v517;
  uint64_t v518;
  uint64_t v519;
  unint64_t v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  char v524;
  _BYTE v525[7];
  uint64_t v526;
  uint64_t v527;
  uint64_t v528;
  uint64_t v529;
  uint64_t v530;
  uint64_t v531;
  uint64_t v532;
  __int128 v533;
  unint64_t v534;
  unint64_t v535;
  uint64_t v536;
  uint64_t v537;
  unint64_t v538;
  uint64_t v539;
  uint64_t v540;
  uint64_t v541;
  char v542;
  _BYTE v543[7];
  uint64_t v544;
  uint64_t v545;
  uint64_t v546;
  uint64_t v547;
  uint64_t v548;
  uint64_t v549;
  uint64_t v550;
  __int128 v551;
  unint64_t v552;
  unint64_t v553;
  uint64_t v554;
  uint64_t v555;
  unint64_t v556;
  uint64_t v557;
  uint64_t v558;
  uint64_t v559;
  char v560;
  _BYTE v561[7];
  uint64_t v562;
  uint64_t v563;
  uint64_t v564;
  uint64_t v565;
  uint64_t v566;
  uint64_t v567;
  uint64_t v568;
  __int128 v569;
  unint64_t v570;
  unint64_t v571;
  uint64_t v572;
  uint64_t v573;
  unint64_t v574;
  uint64_t v575;
  uint64_t v576;
  uint64_t v577;
  char v578;
  _BYTE v579[7];
  uint64_t v580;
  uint64_t v581;
  uint64_t v582;
  uint64_t v583;
  uint64_t v584;
  uint64_t v585;
  uint64_t v586;
  __int128 v587;
  unint64_t v588;
  unint64_t v589;
  uint64_t v590;
  uint64_t v591;
  unint64_t v592;
  uint64_t v593;
  uint64_t v594;
  uint64_t v595;
  char v596;
  _BYTE v597[7];
  uint64_t v598;
  uint64_t v599;
  uint64_t v600;
  uint64_t v601;
  uint64_t v602;
  uint64_t v603;
  uint64_t v604;
  __int128 v605;
  unint64_t v606;
  unint64_t v607;
  uint64_t v608;
  uint64_t v609;
  unint64_t v610;
  uint64_t v611;
  uint64_t v612;
  uint64_t v613;
  char v614;
  _BYTE v615[7];
  uint64_t v616;
  uint64_t v617;
  uint64_t v618;
  uint64_t v619;
  uint64_t v620;
  uint64_t v621;
  uint64_t v622;
  __int128 v623;
  char v624[16];
  uint64_t v625;
  uint64_t v626;
  unint64_t v627;
  unint64_t v628;
  uint64_t v629;
  uint64_t v630;
  char v631;
  _BYTE v632[7];
  uint64_t v633;
  uint64_t v634;
  uint64_t v635;
  uint64_t v636;
  uint64_t v637;
  uint64_t v638;
  uint64_t v639;
  __int128 v640;
  unint64_t v641;
  unint64_t v642;
  uint64_t v643;
  uint64_t v644;
  unint64_t v645;
  uint64_t v646;
  uint64_t v647;
  uint64_t v648;
  char v649;
  _BYTE v650[7];
  uint64_t v651;
  uint64_t v652;
  uint64_t v653;
  uint64_t v654;
  uint64_t v655;
  uint64_t v656;
  uint64_t v657;
  __int128 v658;
  char v659[16];
  uint64_t v660;
  uint64_t v661;
  unint64_t v662;
  unint64_t v663;
  uint64_t v664;
  uint64_t v665;
  char v666;
  _BYTE v667[7];
  uint64_t v668;
  uint64_t v669;
  uint64_t v670;
  uint64_t v671;
  uint64_t v672;
  uint64_t v673;
  uint64_t v674;
  __int128 v675;
  unint64_t v676;
  unint64_t v677;
  uint64_t v678;
  uint64_t v679;
  unint64_t v680;
  unint64_t v681;
  uint64_t v682;
  uint64_t v683;
  char v684;
  _BYTE v685[7];
  uint64_t v686;
  uint64_t v687;
  uint64_t v688;
  uint64_t v689;
  uint64_t v690;
  uint64_t v691;
  uint64_t v692;
  __int128 v693;
  unint64_t v694;
  unint64_t v695;
  uint64_t v696;
  uint64_t v697;
  unint64_t v698;
  unint64_t v699;
  uint64_t v700;
  uint64_t v701;
  char v702;
  _BYTE v703[7];
  uint64_t v704;
  uint64_t v705;
  uint64_t v706;
  uint64_t v707;
  uint64_t v708;
  uint64_t v709;
  uint64_t v710;
  _BYTE v711[7];
  _BYTE v712[7];
  _BYTE v713[7];
  _BYTE v714[7];
  _BYTE v715[7];
  _BYTE v716[7];
  _BYTE v717[7];
  _BYTE v718[7];
  _BYTE v719[7];
  _BYTE v720[7];
  _BYTE v721[7];
  _BYTE v722[7];
  _BYTE v723[7];
  _BYTE v724[7];
  _DWORD v725[3];
  uint64_t v726;

  v319 = type metadata accessor for NodeDef.Implementation.Kind(0);
  v0 = MEMORY[0x24BDAC7A8](v319);
  v309 = (uint64_t *)((char *)&v301 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  v2 = MEMORY[0x24BDAC7A8](v0);
  v308 = (uint64_t *)((char *)&v301 - v3);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v307 = (uint64_t *)((char *)&v301 - v5);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v306 = (uint64_t *)((char *)&v301 - v7);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v305 = (uint64_t *)((char *)&v301 - v9);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v304 = (uint64_t *)((char *)&v301 - v11);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v303 = (uint64_t *)((char *)&v301 - v13);
  MEMORY[0x24BDAC7A8](v12);
  v302 = (uint64_t *)((char *)&v301 - v14);
  v15 = MEMORY[0x24BEE4AF8];
  v16 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x24BEE4AF8]);
  v17 = specialized Dictionary.init(dictionaryLiteral:)(v15);
  v18 = specialized Dictionary.init(dictionaryLiteral:)(v15);
  v324 = v17;
  v325 = v18;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<NodeDef.IOSpec>);
  v20 = swift_allocObject();
  v310 = xmmword_245FBECE0;
  *(_OWORD *)(v20 + 16) = xmmword_245FBECE0;
  if (one-time initialization token for float != -1)
    swift_once();
  v21 = static MaterialXDataType.float;
  *(_QWORD *)(v20 + 32) = 0x7974696361706FLL;
  *(_QWORD *)(v20 + 40) = 0xE700000000000000;
  *(_QWORD *)(v20 + 48) = v21;
  *(_OWORD *)(v20 + 56) = xmmword_245FC5F00;
  *(_QWORD *)(v20 + 72) = 0;
  *(_QWORD *)(v20 + 80) = 0;
  *(_BYTE *)(v20 + 88) = 0;
  *(_QWORD *)(v20 + 96) = 0xD000000000000010;
  *(_QWORD *)(v20 + 104) = 0x8000000245FC8C90;
  *(_QWORD *)(v20 + 112) = v21;
  *(_OWORD *)(v20 + 120) = xmmword_245FC5F10;
  *(_QWORD *)(v20 + 136) = 0;
  *(_QWORD *)(v20 + 144) = 0;
  *(_BYTE *)(v20 + 152) = 0;
  v22 = swift_allocObject();
  v321 = xmmword_245FBECD0;
  *(_OWORD *)(v22 + 16) = xmmword_245FBECD0;
  *(_QWORD *)(v22 + 32) = 7632239;
  *(_QWORD *)(v22 + 40) = 0xE300000000000000;
  *(_QWORD *)(v22 + 48) = v21;
  *(_OWORD *)(v22 + 56) = 0u;
  *(_OWORD *)(v22 + 72) = 0u;
  *(_BYTE *)(v22 + 88) = 0;
  v726 = v19;
  *(_QWORD *)&v693 = 0xD000000000000023;
  *((_QWORD *)&v693 + 1) = 0x8000000245FC8AC0;
  v694 = 0xD00000000000001ALL;
  v695 = 0x8000000245FCE4F0;
  v697 = 0;
  v696 = 0;
  v320 = (unint64_t)"function definition: ";
  v698 = 0xD000000000000013;
  v699 = 0x8000000245FCDF70;
  v701 = 0;
  v700 = 0;
  v702 = 2;
  *(_DWORD *)v703 = *(_DWORD *)v711;
  *(_DWORD *)&v703[3] = *(_DWORD *)&v711[3];
  v704 = v15;
  v705 = 0;
  v707 = 0;
  v706 = 0;
  v708 = 1;
  v709 = v20;
  v710 = v22;
  swift_retain_n();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v322 = v16;
  v323 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v693, 0xD000000000000023, 0x8000000245FC8AC0, isUniquelyReferenced_nonNull_native);
  v24 = v322;
  v323 = v322;
  swift_bridgeObjectRelease();
  v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_245FC2000;
  if (one-time initialization token for coord != -1)
    swift_once();
  v26 = static MaterialXDataType.realitykit.coord;
  *(_QWORD *)(v25 + 32) = 0x64726F6F63;
  *(_QWORD *)(v25 + 40) = 0xE500000000000000;
  *(_QWORD *)(v25 + 48) = v26;
  *(_OWORD *)(v25 + 56) = 0u;
  *(_OWORD *)(v25 + 72) = 0u;
  *(_BYTE *)(v25 + 88) = 1;
  v27 = one-time initialization token for u_wrap_mode;
  swift_retain();
  if (v27 != -1)
    swift_once();
  v28 = static MaterialXDataType.realitykit.u_wrap_mode;
  *(_QWORD *)(v25 + 96) = 0x6D5F706172775F75;
  *(_QWORD *)(v25 + 104) = 0xEB0000000065646FLL;
  *(_QWORD *)(v25 + 112) = v28;
  *(_OWORD *)(v25 + 120) = 0u;
  *(_OWORD *)(v25 + 136) = 0u;
  *(_BYTE *)(v25 + 152) = 1;
  v29 = one-time initialization token for v_wrap_mode;
  swift_retain();
  if (v29 != -1)
    swift_once();
  v30 = static MaterialXDataType.realitykit.v_wrap_mode;
  *(_QWORD *)(v25 + 160) = 0x6D5F706172775F76;
  *(_QWORD *)(v25 + 168) = 0xEB0000000065646FLL;
  *(_QWORD *)(v25 + 176) = v30;
  *(_OWORD *)(v25 + 184) = 0u;
  *(_OWORD *)(v25 + 200) = 0u;
  *(_BYTE *)(v25 + 216) = 1;
  v31 = one-time initialization token for borderColor;
  swift_retain();
  if (v31 != -1)
    swift_once();
  v32 = static MaterialXDataType.realitykit.borderColor;
  *(_OWORD *)(v25 + 248) = 0u;
  strcpy((char *)(v25 + 224), "border_color");
  *(_BYTE *)(v25 + 237) = 0;
  *(_WORD *)(v25 + 238) = -5120;
  *(_QWORD *)(v25 + 240) = v32;
  *(_OWORD *)(v25 + 264) = 0u;
  *(_BYTE *)(v25 + 280) = 1;
  v33 = one-time initialization token for magFilter;
  swift_retain();
  if (v33 != -1)
    swift_once();
  v34 = static MaterialXDataType.realitykit.magFilter;
  *(_QWORD *)(v25 + 288) = 0x746C69665F67616DLL;
  *(_QWORD *)(v25 + 296) = 0xEA00000000007265;
  *(_QWORD *)(v25 + 304) = v34;
  *(_OWORD *)(v25 + 312) = 0u;
  *(_OWORD *)(v25 + 328) = 0u;
  *(_BYTE *)(v25 + 344) = 1;
  v35 = one-time initialization token for minFilter;
  swift_retain();
  if (v35 != -1)
    swift_once();
  v36 = static MaterialXDataType.realitykit.minFilter;
  *(_QWORD *)(v25 + 352) = 0x746C69665F6E696DLL;
  *(_QWORD *)(v25 + 360) = 0xEA00000000007265;
  *(_QWORD *)(v25 + 368) = v36;
  *(_OWORD *)(v25 + 376) = 0u;
  *(_OWORD *)(v25 + 392) = 0u;
  *(_BYTE *)(v25 + 408) = 1;
  v37 = one-time initialization token for mipFilter;
  swift_retain();
  if (v37 != -1)
    swift_once();
  v38 = static MaterialXDataType.realitykit.mipFilter;
  *(_QWORD *)(v25 + 416) = 0x746C69665F70696DLL;
  *(_QWORD *)(v25 + 424) = 0xEA00000000007265;
  *(_QWORD *)(v25 + 432) = v38;
  *(_OWORD *)(v25 + 440) = 0u;
  *(_OWORD *)(v25 + 456) = 0u;
  *(_BYTE *)(v25 + 472) = 1;
  v39 = one-time initialization token for max_anisotropy;
  swift_retain();
  if (v39 != -1)
    swift_once();
  v40 = static MaterialXDataType.max_anisotropy;
  strcpy((char *)(v25 + 480), "max_anisotropy");
  *(_BYTE *)(v25 + 495) = -18;
  *(_QWORD *)(v25 + 496) = v40;
  *(_OWORD *)(v25 + 504) = 0u;
  *(_OWORD *)(v25 + 520) = 0u;
  *(_BYTE *)(v25 + 536) = 1;
  v41 = one-time initialization token for lod_clamp;
  swift_retain();
  if (v41 != -1)
    swift_once();
  v42 = static MaterialXDataType.lod_clamp;
  *(_QWORD *)(v25 + 544) = 0x6D616C635F646F6CLL;
  *(_QWORD *)(v25 + 552) = 0xE900000000000070;
  *(_QWORD *)(v25 + 560) = v42;
  *(_OWORD *)(v25 + 568) = 0u;
  *(_OWORD *)(v25 + 584) = 0u;
  *(_BYTE *)(v25 + 600) = 1;
  v43 = swift_allocObject();
  *(_OWORD *)(v43 + 16) = v321;
  v318 = type metadata accessor for MaterialXDataType();
  v44 = swift_allocObject();
  v317 = xmmword_245FC1790;
  *(_OWORD *)(v44 + 24) = xmmword_245FC1790;
  *(_QWORD *)(v44 + 40) = 0xE700000000000000;
  v45 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v44 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v43 + 32) = 7632239;
  *(_QWORD *)(v43 + 40) = 0xE300000000000000;
  *(_QWORD *)(v43 + 48) = v44;
  *(_OWORD *)(v43 + 56) = 0u;
  *(_OWORD *)(v43 + 72) = 0u;
  *(_BYTE *)(v43 + 88) = 0;
  *(_QWORD *)&v675 = 0xD000000000000013;
  *((_QWORD *)&v675 + 1) = 0x8000000245FCE510;
  v676 = 0xD000000000000013;
  v677 = 0x8000000245FCE510;
  v679 = 0;
  v678 = 0;
  v680 = 0xD000000000000013;
  v681 = v320 | 0x8000000000000000;
  v683 = 0;
  v682 = 0;
  v684 = 2;
  *(_DWORD *)v685 = *(_DWORD *)v712;
  *(_DWORD *)&v685[3] = *(_DWORD *)&v712[3];
  v686 = v45;
  v687 = 0;
  v689 = 0;
  v688 = 0;
  v690 = 2;
  v691 = v25;
  v692 = v43;
  swift_retain();
  v46 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v24;
  v323 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v675, 0xD000000000000013, 0x8000000245FCE510, v46);
  v323 = v322;
  swift_bridgeObjectRelease();
  v47 = swift_allocObject();
  *(_OWORD *)(v47 + 16) = xmmword_245FC5F20;
  v48 = static MaterialXDataType.realitykit.coord;
  *(_QWORD *)(v47 + 32) = 0x64726F6F63;
  *(_QWORD *)(v47 + 40) = 0xE500000000000000;
  *(_QWORD *)(v47 + 48) = v48;
  *(_OWORD *)(v47 + 56) = 0u;
  *(_OWORD *)(v47 + 72) = 0u;
  *(_BYTE *)(v47 + 88) = 1;
  v49 = one-time initialization token for u_pixel_wrap_mode;
  swift_retain();
  if (v49 != -1)
    swift_once();
  v50 = static MaterialXDataType.realitykit.u_pixel_wrap_mode;
  *(_QWORD *)(v47 + 96) = 0x6D5F706172775F75;
  *(_QWORD *)(v47 + 104) = 0xEB0000000065646FLL;
  *(_QWORD *)(v47 + 112) = v50;
  *(_OWORD *)(v47 + 120) = 0u;
  *(_OWORD *)(v47 + 136) = 0u;
  *(_BYTE *)(v47 + 152) = 1;
  v51 = one-time initialization token for v_pixel_wrap_mode;
  swift_retain();
  if (v51 != -1)
    swift_once();
  v52 = static MaterialXDataType.realitykit.v_pixel_wrap_mode;
  *(_OWORD *)(v47 + 248) = 0u;
  *(_QWORD *)(v47 + 160) = 0x6D5F706172775F76;
  *(_QWORD *)(v47 + 168) = 0xEB0000000065646FLL;
  *(_QWORD *)(v47 + 176) = v52;
  *(_OWORD *)(v47 + 184) = 0u;
  *(_OWORD *)(v47 + 200) = 0u;
  *(_BYTE *)(v47 + 216) = 1;
  v53 = static MaterialXDataType.realitykit.borderColor;
  strcpy((char *)(v47 + 224), "border_color");
  *(_BYTE *)(v47 + 237) = 0;
  *(_WORD *)(v47 + 238) = -5120;
  *(_QWORD *)(v47 + 240) = v53;
  *(_OWORD *)(v47 + 264) = 0u;
  *(_BYTE *)(v47 + 280) = 1;
  v54 = one-time initialization token for filter;
  swift_retain();
  swift_retain();
  if (v54 != -1)
    swift_once();
  v55 = static MaterialXDataType.realitykit.filter;
  *(_QWORD *)(v47 + 288) = 0x7265746C6966;
  *(_QWORD *)(v47 + 296) = 0xE600000000000000;
  *(_QWORD *)(v47 + 304) = v55;
  *(_OWORD *)(v47 + 312) = 0u;
  *(_OWORD *)(v47 + 328) = 0u;
  *(_BYTE *)(v47 + 344) = 1;
  v56 = static MaterialXDataType.max_anisotropy;
  strcpy((char *)(v47 + 352), "max_anisotropy");
  *(_BYTE *)(v47 + 367) = -18;
  *(_QWORD *)(v47 + 368) = v56;
  *(_OWORD *)(v47 + 376) = 0u;
  *(_OWORD *)(v47 + 392) = 0u;
  *(_BYTE *)(v47 + 408) = 1;
  v57 = static MaterialXDataType.lod_clamp;
  *(_QWORD *)(v47 + 416) = 0x6D616C635F646F6CLL;
  *(_QWORD *)(v47 + 424) = 0xE900000000000070;
  *(_QWORD *)(v47 + 432) = v57;
  *(_OWORD *)(v47 + 440) = 0u;
  *(_OWORD *)(v47 + 456) = 0u;
  *(_BYTE *)(v47 + 472) = 1;
  v58 = swift_allocObject();
  *(_OWORD *)(v58 + 16) = v321;
  v59 = swift_allocObject();
  *(_OWORD *)(v59 + 24) = v317;
  *(_QWORD *)(v59 + 40) = 0xE700000000000000;
  v60 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v59 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v58 + 32) = 7632239;
  *(_QWORD *)(v58 + 40) = 0xE300000000000000;
  *(_QWORD *)(v58 + 48) = v59;
  *(_OWORD *)(v58 + 56) = 0u;
  *(_OWORD *)(v58 + 72) = 0u;
  *(_BYTE *)(v58 + 88) = 0;
  strcpy((char *)&v658, "SamplerPixel2D");
  HIBYTE(v658) = -18;
  strcpy(v659, "SamplerPixel2D");
  v659[15] = -18;
  v660 = 0;
  v661 = 0;
  v662 = 0xD000000000000013;
  *(_QWORD *)&v315 = v320 | 0x8000000000000000;
  v663 = v320 | 0x8000000000000000;
  v665 = 0;
  v664 = 0;
  v666 = 2;
  *(_DWORD *)v667 = *(_DWORD *)v713;
  *(_DWORD *)&v667[3] = *(_DWORD *)&v713[3];
  v668 = v60;
  v669 = 0;
  v671 = 0;
  v670 = 0;
  v672 = 2;
  v673 = v47;
  v674 = v58;
  swift_retain();
  swift_retain();
  swift_retain();
  v61 = v323;
  v62 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v61;
  v323 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v658, 0x5072656C706D6153, 0xEE0044326C657869, v62);
  v323 = v322;
  swift_bridgeObjectRelease();
  v63 = swift_allocObject();
  *(_OWORD *)(v63 + 16) = xmmword_245FC37C0;
  v64 = static MaterialXDataType.realitykit.coord;
  *(_QWORD *)(v63 + 32) = 0x64726F6F63;
  *(_QWORD *)(v63 + 40) = 0xE500000000000000;
  *(_QWORD *)(v63 + 48) = v64;
  *(_OWORD *)(v63 + 56) = 0u;
  *(_OWORD *)(v63 + 72) = 0u;
  *(_BYTE *)(v63 + 88) = 1;
  v65 = static MaterialXDataType.realitykit.u_wrap_mode;
  *(_QWORD *)(v63 + 96) = 0x6D5F706172775F75;
  *(_QWORD *)(v63 + 104) = 0xEB0000000065646FLL;
  *(_QWORD *)(v63 + 112) = v65;
  *(_OWORD *)(v63 + 120) = 0u;
  *(_OWORD *)(v63 + 136) = 0u;
  *(_BYTE *)(v63 + 152) = 1;
  v66 = static MaterialXDataType.realitykit.v_wrap_mode;
  *(_QWORD *)(v63 + 160) = 0x6D5F706172775F76;
  *(_QWORD *)(v63 + 168) = 0xEB0000000065646FLL;
  *(_QWORD *)(v63 + 176) = v66;
  *(_OWORD *)(v63 + 200) = 0u;
  *(_OWORD *)(v63 + 184) = 0u;
  *(_BYTE *)(v63 + 216) = 1;
  v67 = one-time initialization token for w_wrap_mode;
  swift_retain();
  swift_retain();
  swift_retain();
  if (v67 != -1)
    swift_once();
  v68 = static MaterialXDataType.realitykit.w_wrap_mode;
  v314 = static MaterialXDataType.realitykit.w_wrap_mode;
  v316 = 0x6D5F706172775F77;
  *(_QWORD *)(v63 + 224) = 0x6D5F706172775F77;
  *(_QWORD *)(v63 + 232) = 0xEB0000000065646FLL;
  *(_QWORD *)(v63 + 240) = v68;
  *(_OWORD *)(v63 + 248) = 0u;
  *(_OWORD *)(v63 + 264) = 0u;
  *(_BYTE *)(v63 + 280) = 1;
  v69 = static MaterialXDataType.realitykit.borderColor;
  *(_QWORD *)&v313 = static MaterialXDataType.realitykit.borderColor;
  strcpy((char *)(v63 + 288), "border_color");
  *(_BYTE *)(v63 + 301) = 0;
  *(_WORD *)(v63 + 302) = -5120;
  *(_QWORD *)(v63 + 304) = v69;
  *(_OWORD *)(v63 + 312) = 0u;
  *(_OWORD *)(v63 + 328) = 0u;
  *(_BYTE *)(v63 + 344) = 1;
  v70 = static MaterialXDataType.realitykit.magFilter;
  *(_QWORD *)(v63 + 352) = 0x746C69665F67616DLL;
  *(_QWORD *)(v63 + 360) = 0xEA00000000007265;
  *(_QWORD *)(v63 + 368) = v70;
  *(_OWORD *)(v63 + 376) = 0u;
  *(_OWORD *)(v63 + 392) = 0u;
  *(_BYTE *)(v63 + 408) = 1;
  v71 = static MaterialXDataType.realitykit.minFilter;
  *(_QWORD *)(v63 + 416) = 0x746C69665F6E696DLL;
  *(_QWORD *)(v63 + 424) = 0xEA00000000007265;
  *(_QWORD *)(v63 + 432) = v71;
  *(_OWORD *)(v63 + 440) = 0u;
  *(_OWORD *)(v63 + 456) = 0u;
  *(_BYTE *)(v63 + 472) = 1;
  v72 = static MaterialXDataType.realitykit.mipFilter;
  *(_QWORD *)(v63 + 480) = 0x746C69665F70696DLL;
  *(_QWORD *)(v63 + 488) = 0xEA00000000007265;
  *(_QWORD *)(v63 + 496) = v72;
  *(_OWORD *)(v63 + 504) = 0u;
  *(_OWORD *)(v63 + 520) = 0u;
  *(_BYTE *)(v63 + 536) = 1;
  v73 = static MaterialXDataType.max_anisotropy;
  strcpy((char *)(v63 + 544), "max_anisotropy");
  *(_BYTE *)(v63 + 559) = -18;
  *(_QWORD *)(v63 + 560) = v73;
  *(_OWORD *)(v63 + 568) = 0u;
  *(_OWORD *)(v63 + 584) = 0u;
  *(_BYTE *)(v63 + 600) = 1;
  v74 = static MaterialXDataType.lod_clamp;
  *(_QWORD *)(v63 + 608) = 0x6D616C635F646F6CLL;
  *(_QWORD *)(v63 + 616) = 0xE900000000000070;
  *(_QWORD *)(v63 + 624) = v74;
  *(_OWORD *)(v63 + 632) = 0u;
  *(_OWORD *)(v63 + 648) = 0u;
  *(_BYTE *)(v63 + 664) = 1;
  v75 = swift_allocObject();
  *(_OWORD *)(v75 + 16) = v321;
  v76 = swift_allocObject();
  *(_OWORD *)(v76 + 24) = v317;
  *(_QWORD *)(v76 + 40) = 0xE700000000000000;
  v77 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v76 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v75 + 32) = 7632239;
  *(_QWORD *)(v75 + 40) = 0xE300000000000000;
  *(_QWORD *)(v75 + 48) = v76;
  *(_OWORD *)(v75 + 56) = 0u;
  *(_OWORD *)(v75 + 72) = 0u;
  *(_BYTE *)(v75 + 88) = 0;
  *(_QWORD *)&v640 = 0xD000000000000013;
  *((_QWORD *)&v640 + 1) = 0x8000000245FCE530;
  v641 = 0xD000000000000013;
  v642 = 0x8000000245FCE530;
  v644 = 0;
  v643 = 0;
  v645 = 0xD000000000000013;
  v646 = v315;
  v648 = 0;
  v647 = 0;
  v649 = 2;
  *(_DWORD *)v650 = *(_DWORD *)v714;
  *(_DWORD *)&v650[3] = *(_DWORD *)&v714[3];
  v651 = v77;
  v652 = 0;
  v654 = 0;
  v653 = 0;
  v655 = 2;
  v656 = v63;
  v657 = v75;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v78 = v323;
  v79 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v78;
  v323 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v640, 0xD000000000000013, 0x8000000245FCE530, v79);
  v323 = v322;
  swift_bridgeObjectRelease();
  v80 = swift_allocObject();
  *(_OWORD *)(v80 + 16) = xmmword_245FC37E0;
  v81 = static MaterialXDataType.realitykit.coord;
  *(_QWORD *)(v80 + 32) = 0x64726F6F63;
  *(_QWORD *)(v80 + 40) = 0xE500000000000000;
  *(_QWORD *)(v80 + 48) = v81;
  *(_OWORD *)(v80 + 56) = 0u;
  *(_OWORD *)(v80 + 72) = 0u;
  *(_BYTE *)(v80 + 88) = 1;
  v82 = static MaterialXDataType.realitykit.u_pixel_wrap_mode;
  *(_QWORD *)(v80 + 96) = 0x6D5F706172775F75;
  *(_QWORD *)(v80 + 104) = 0xEB0000000065646FLL;
  *(_QWORD *)(v80 + 112) = v82;
  *(_OWORD *)(v80 + 120) = 0u;
  *(_OWORD *)(v80 + 136) = 0u;
  *(_BYTE *)(v80 + 152) = 1;
  v83 = static MaterialXDataType.realitykit.v_pixel_wrap_mode;
  *(_QWORD *)(v80 + 160) = 0x6D5F706172775F76;
  *(_QWORD *)(v80 + 168) = 0xEB0000000065646FLL;
  *(_QWORD *)(v80 + 176) = v83;
  *(_OWORD *)(v80 + 200) = 0u;
  *(_OWORD *)(v80 + 184) = 0u;
  *(_BYTE *)(v80 + 216) = 1;
  v84 = one-time initialization token for w_pixel_wrap_mode;
  swift_retain();
  swift_retain();
  swift_retain();
  if (v84 != -1)
    swift_once();
  v85 = static MaterialXDataType.realitykit.w_pixel_wrap_mode;
  *(_QWORD *)(v80 + 224) = v316;
  *(_QWORD *)(v80 + 232) = 0xEB0000000065646FLL;
  *(_QWORD *)(v80 + 240) = v85;
  *(_OWORD *)(v80 + 248) = 0u;
  *(_OWORD *)(v80 + 264) = 0u;
  *(_BYTE *)(v80 + 280) = 1;
  v86 = static MaterialXDataType.realitykit.borderColor;
  strcpy((char *)(v80 + 288), "border_color");
  *(_BYTE *)(v80 + 301) = 0;
  *(_WORD *)(v80 + 302) = -5120;
  *(_QWORD *)(v80 + 304) = v86;
  *(_OWORD *)(v80 + 312) = 0u;
  *(_OWORD *)(v80 + 328) = 0u;
  *(_BYTE *)(v80 + 344) = 1;
  v87 = static MaterialXDataType.realitykit.filter;
  *(_QWORD *)(v80 + 352) = 0x7265746C6966;
  *(_QWORD *)(v80 + 360) = 0xE600000000000000;
  *(_QWORD *)(v80 + 368) = v87;
  *(_OWORD *)(v80 + 376) = 0u;
  *(_OWORD *)(v80 + 392) = 0u;
  *(_BYTE *)(v80 + 408) = 1;
  v88 = static MaterialXDataType.max_anisotropy;
  strcpy((char *)(v80 + 416), "max_anisotropy");
  *(_BYTE *)(v80 + 431) = -18;
  *(_QWORD *)(v80 + 432) = v88;
  *(_OWORD *)(v80 + 440) = 0u;
  *(_OWORD *)(v80 + 456) = 0u;
  *(_BYTE *)(v80 + 472) = 1;
  v89 = static MaterialXDataType.lod_clamp;
  *(_QWORD *)(v80 + 480) = 0x6D616C635F646F6CLL;
  *(_QWORD *)(v80 + 488) = 0xE900000000000070;
  *(_QWORD *)(v80 + 496) = v89;
  *(_OWORD *)(v80 + 504) = 0u;
  *(_OWORD *)(v80 + 520) = 0u;
  *(_BYTE *)(v80 + 536) = 1;
  v90 = swift_allocObject();
  *(_OWORD *)(v90 + 16) = v321;
  v91 = swift_allocObject();
  *(_OWORD *)(v91 + 24) = v317;
  *(_QWORD *)(v91 + 40) = 0xE700000000000000;
  v92 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v91 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v90 + 32) = 7632239;
  *(_QWORD *)(v90 + 40) = 0xE300000000000000;
  *(_QWORD *)(v90 + 48) = v91;
  *(_OWORD *)(v90 + 56) = 0u;
  *(_OWORD *)(v90 + 72) = 0u;
  *(_BYTE *)(v90 + 88) = 0;
  strcpy((char *)&v623, "SamplerPixel3D");
  HIBYTE(v623) = -18;
  strcpy(v624, "SamplerPixel3D");
  v624[15] = -18;
  v626 = 0;
  v625 = 0;
  v627 = 0xD000000000000013;
  *(_QWORD *)&v317 = v320 | 0x8000000000000000;
  v628 = v320 | 0x8000000000000000;
  v630 = 0;
  v629 = 0;
  v631 = 2;
  *(_DWORD *)v632 = *(_DWORD *)v715;
  *(_DWORD *)&v632[3] = *(_DWORD *)&v715[3];
  v633 = v92;
  v634 = 0;
  v636 = 0;
  v635 = 0;
  v637 = 2;
  v638 = v80;
  v639 = v90;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v93 = v323;
  v94 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v93;
  v323 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v623, 0x5072656C706D6153, 0xEE0044336C657869, v94);
  v95 = v322;
  swift_bridgeObjectRelease();
  v96 = swift_allocObject();
  *(_OWORD *)(v96 + 16) = v321;
  v97 = MEMORY[0x24BEE4AF8];
  if (one-time initialization token for filename != -1)
    swift_once();
  v98 = static MaterialXDataType.filename;
  *(_QWORD *)(v96 + 32) = 1701603686;
  *(_QWORD *)(v96 + 40) = 0xE400000000000000;
  *(_QWORD *)(v96 + 48) = v98;
  *(_OWORD *)(v96 + 56) = 0u;
  *(_OWORD *)(v96 + 72) = 0u;
  *(_BYTE *)(v96 + 88) = 0;
  v99 = swift_allocObject();
  *(_OWORD *)(v99 + 16) = v321;
  v100 = swift_allocObject();
  v315 = xmmword_245FC1740;
  *(_OWORD *)(v100 + 24) = xmmword_245FC1740;
  *(_QWORD *)(v100 + 40) = 0xED0000666C616864;
  *(_QWORD *)(v100 + 16) = v97;
  *(_QWORD *)(v99 + 32) = 7632239;
  *(_QWORD *)(v99 + 40) = 0xE300000000000000;
  *(_QWORD *)(v99 + 48) = v100;
  *(_OWORD *)(v99 + 56) = 0u;
  *(_OWORD *)(v99 + 72) = 0u;
  *(_BYTE *)(v99 + 88) = 0;
  *(_QWORD *)&v605 = 0xD00000000000001ALL;
  *((_QWORD *)&v605 + 1) = 0x8000000245FCE550;
  v606 = 0xD000000000000013;
  v607 = 0x8000000245FC8330;
  v316 = 0x8000000245FC8330;
  v609 = 0;
  v608 = 0;
  v610 = 0xD000000000000013;
  v611 = v317;
  v613 = 0;
  v612 = 0;
  v614 = 2;
  *(_DWORD *)v615 = *(_DWORD *)v716;
  *(_DWORD *)&v615[3] = *(_DWORD *)&v716[3];
  v616 = v97;
  v617 = 0;
  v619 = 0;
  v618 = 0;
  v620 = 2;
  v621 = v96;
  v622 = v99;
  swift_retain();
  v101 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v95;
  v323 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v605, 0xD00000000000001ALL, 0x8000000245FCE550, v101);
  v102 = v322;
  swift_bridgeObjectRelease();
  v103 = swift_allocObject();
  *(_OWORD *)(v103 + 16) = v321;
  v104 = static MaterialXDataType.filename;
  *(_QWORD *)(v103 + 32) = 1701603686;
  *(_QWORD *)(v103 + 40) = 0xE400000000000000;
  *(_QWORD *)(v103 + 48) = v104;
  *(_OWORD *)(v103 + 56) = 0u;
  *(_OWORD *)(v103 + 72) = 0u;
  *(_BYTE *)(v103 + 88) = 0;
  v105 = swift_allocObject();
  *(_OWORD *)(v105 + 16) = v321;
  v106 = swift_allocObject();
  *(_OWORD *)(v106 + 24) = xmmword_245FC16B0;
  *(_QWORD *)(v106 + 40) = 0x8000000245FCAA40;
  v107 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v106 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v105 + 32) = 7632239;
  *(_QWORD *)(v105 + 40) = 0xE300000000000000;
  *(_QWORD *)(v105 + 48) = v106;
  *(_OWORD *)(v105 + 56) = 0u;
  *(_OWORD *)(v105 + 72) = 0u;
  *(_BYTE *)(v105 + 88) = 0;
  *(_QWORD *)&v587 = 0xD000000000000021;
  *((_QWORD *)&v587 + 1) = 0x8000000245FCE570;
  v588 = 0xD000000000000013;
  v589 = 0x8000000245FC8330;
  v591 = 0;
  v590 = 0;
  v592 = 0xD000000000000013;
  v108 = v317;
  v593 = v317;
  v595 = 0;
  v594 = 0;
  v596 = 2;
  *(_DWORD *)v597 = *(_DWORD *)v717;
  *(_DWORD *)&v597[3] = *(_DWORD *)&v717[3];
  v598 = v107;
  v599 = 0;
  v601 = 0;
  v600 = 0;
  v602 = 2;
  v603 = v103;
  v604 = v105;
  swift_retain();
  v109 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v102;
  v323 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v587, 0xD000000000000021, 0x8000000245FCE570, v109);
  v110 = v322;
  swift_bridgeObjectRelease();
  v111 = swift_allocObject();
  *(_OWORD *)(v111 + 16) = v321;
  v112 = static MaterialXDataType.filename;
  *(_QWORD *)(v111 + 32) = 1701603686;
  *(_QWORD *)(v111 + 40) = 0xE400000000000000;
  *(_QWORD *)(v111 + 48) = v112;
  *(_OWORD *)(v111 + 56) = 0u;
  *(_OWORD *)(v111 + 72) = 0u;
  *(_BYTE *)(v111 + 88) = 0;
  v113 = swift_allocObject();
  *(_OWORD *)(v113 + 16) = v321;
  v114 = swift_allocObject();
  *(_OWORD *)(v114 + 24) = v315;
  *(_QWORD *)(v114 + 40) = 0xEE0074616F6C6664;
  v115 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v114 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v113 + 32) = 7632239;
  *(_QWORD *)(v113 + 40) = 0xE300000000000000;
  *(_QWORD *)(v113 + 48) = v114;
  *(_OWORD *)(v113 + 56) = 0u;
  *(_OWORD *)(v113 + 72) = 0u;
  *(_BYTE *)(v113 + 88) = 0;
  *(_QWORD *)&v569 = 0xD00000000000001BLL;
  *((_QWORD *)&v569 + 1) = 0x8000000245FCE5A0;
  v570 = 0xD000000000000013;
  v116 = v316;
  v571 = v316;
  v573 = 0;
  v572 = 0;
  v574 = 0xD000000000000013;
  v575 = v108;
  v577 = 0;
  v576 = 0;
  v578 = 2;
  *(_DWORD *)v579 = *(_DWORD *)v718;
  *(_DWORD *)&v579[3] = *(_DWORD *)&v718[3];
  v580 = v115;
  v581 = 0;
  v583 = 0;
  v582 = 0;
  v584 = 2;
  v585 = v111;
  v586 = v113;
  swift_retain();
  v117 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v110;
  v323 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v569, 0xD00000000000001BLL, 0x8000000245FCE5A0, v117);
  v118 = v322;
  swift_bridgeObjectRelease();
  v119 = swift_allocObject();
  *(_OWORD *)(v119 + 16) = v321;
  v120 = static MaterialXDataType.filename;
  *(_QWORD *)(v119 + 32) = 1701603686;
  *(_QWORD *)(v119 + 40) = 0xE400000000000000;
  *(_QWORD *)(v119 + 48) = v120;
  *(_OWORD *)(v119 + 56) = 0u;
  *(_OWORD *)(v119 + 72) = 0u;
  *(_BYTE *)(v119 + 88) = 0;
  v121 = swift_allocObject();
  *(_OWORD *)(v121 + 16) = v321;
  v122 = swift_allocObject();
  *(_OWORD *)(v122 + 24) = xmmword_245FC1750;
  *(_QWORD *)(v122 + 40) = 0x8000000245FCAA20;
  v123 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v122 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v121 + 32) = 7632239;
  *(_QWORD *)(v121 + 40) = 0xE300000000000000;
  *(_QWORD *)(v121 + 48) = v122;
  *(_OWORD *)(v121 + 56) = 0u;
  *(_OWORD *)(v121 + 72) = 0u;
  *(_BYTE *)(v121 + 88) = 0;
  *(_QWORD *)&v551 = 0xD000000000000022;
  *((_QWORD *)&v551 + 1) = 0x8000000245FCE5C0;
  v552 = 0xD000000000000013;
  v553 = v116;
  v555 = 0;
  v554 = 0;
  v556 = 0xD000000000000013;
  v557 = v108;
  v559 = 0;
  v558 = 0;
  v560 = 2;
  *(_DWORD *)v561 = *(_DWORD *)v719;
  *(_DWORD *)&v561[3] = *(_DWORD *)&v719[3];
  v562 = v123;
  v124 = v123;
  v563 = 0;
  v565 = 0;
  v564 = 0;
  v566 = 2;
  v567 = v119;
  v568 = v121;
  swift_retain();
  v125 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v118;
  v323 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v551, 0xD000000000000022, 0x8000000245FCE5C0, v125);
  v126 = v322;
  swift_bridgeObjectRelease();
  v127 = swift_allocObject();
  *(_OWORD *)(v127 + 16) = v321;
  v128 = static MaterialXDataType.filename;
  *(_QWORD *)(v127 + 32) = 1701603686;
  *(_QWORD *)(v127 + 40) = 0xE400000000000000;
  *(_QWORD *)(v127 + 48) = v128;
  *(_OWORD *)(v127 + 56) = 0u;
  *(_OWORD *)(v127 + 72) = 0u;
  *(_BYTE *)(v127 + 88) = 0;
  v129 = swift_allocObject();
  *(_OWORD *)(v129 + 16) = v321;
  v130 = swift_allocObject();
  v313 = xmmword_245FC1770;
  *(_OWORD *)(v130 + 24) = xmmword_245FC1770;
  *(_QWORD *)(v130 + 40) = 0xED0000666C616864;
  v131 = v124;
  *(_QWORD *)(v130 + 16) = v124;
  *(_QWORD *)(v129 + 32) = 7632239;
  *(_QWORD *)(v129 + 40) = 0xE300000000000000;
  *(_QWORD *)(v129 + 48) = v130;
  *(_OWORD *)(v129 + 56) = 0u;
  *(_OWORD *)(v129 + 72) = 0u;
  *(_BYTE *)(v129 + 88) = 0;
  *(_QWORD *)&v533 = 0xD00000000000001CLL;
  v314 = 0xD00000000000001CLL;
  *((_QWORD *)&v533 + 1) = 0x8000000245FCE5F0;
  v534 = 0xD000000000000013;
  v132 = v316;
  v535 = v316;
  v537 = 0;
  v536 = 0;
  v538 = 0xD000000000000013;
  v539 = v317;
  v541 = 0;
  v540 = 0;
  v542 = 2;
  *(_DWORD *)v543 = *(_DWORD *)v720;
  *(_DWORD *)&v543[3] = *(_DWORD *)&v720[3];
  v544 = v131;
  v545 = 0;
  v547 = 0;
  v546 = 0;
  v548 = 2;
  v549 = v127;
  v550 = v129;
  swift_retain();
  v133 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v126;
  v323 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v533, 0xD00000000000001CLL, 0x8000000245FCE5F0, v133);
  v134 = v322;
  swift_bridgeObjectRelease();
  v135 = swift_allocObject();
  *(_OWORD *)(v135 + 16) = v321;
  v136 = static MaterialXDataType.filename;
  *(_QWORD *)(v135 + 32) = 1701603686;
  *(_QWORD *)(v135 + 40) = 0xE400000000000000;
  *(_QWORD *)(v135 + 48) = v136;
  *(_OWORD *)(v135 + 56) = 0u;
  *(_OWORD *)(v135 + 72) = 0u;
  *(_BYTE *)(v135 + 88) = 0;
  v137 = swift_allocObject();
  *(_OWORD *)(v137 + 16) = v321;
  v138 = swift_allocObject();
  *(_OWORD *)(v138 + 24) = v313;
  *(_QWORD *)(v138 + 40) = 0xEE0074616F6C6664;
  v139 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v138 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v137 + 32) = 7632239;
  *(_QWORD *)(v137 + 40) = 0xE300000000000000;
  *(_QWORD *)(v137 + 48) = v138;
  *(_OWORD *)(v137 + 56) = 0u;
  *(_OWORD *)(v137 + 72) = 0u;
  *(_BYTE *)(v137 + 88) = 0;
  *(_QWORD *)&v515 = 0xD00000000000001DLL;
  *((_QWORD *)&v515 + 1) = 0x8000000245FCE610;
  v516 = 0xD000000000000013;
  v517 = v132;
  v519 = 0;
  v518 = 0;
  v520 = 0xD000000000000013;
  v140 = v317;
  v521 = v317;
  v523 = 0;
  v522 = 0;
  v524 = 2;
  *(_DWORD *)v525 = *(_DWORD *)v721;
  *(_DWORD *)&v525[3] = *(_DWORD *)&v721[3];
  v526 = v139;
  v527 = 0;
  v529 = 0;
  v528 = 0;
  v530 = 2;
  v531 = v135;
  v532 = v137;
  swift_retain();
  v141 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v134;
  v323 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v515, 0xD00000000000001DLL, 0x8000000245FCE610, v141);
  v142 = v322;
  swift_bridgeObjectRelease();
  v143 = swift_allocObject();
  *(_OWORD *)(v143 + 16) = v321;
  v144 = static MaterialXDataType.filename;
  *(_QWORD *)(v143 + 32) = 1701603686;
  *(_QWORD *)(v143 + 40) = 0xE400000000000000;
  *(_QWORD *)(v143 + 48) = v144;
  *(_OWORD *)(v143 + 56) = 0u;
  *(_OWORD *)(v143 + 72) = 0u;
  *(_BYTE *)(v143 + 88) = 0;
  v145 = swift_allocObject();
  *(_OWORD *)(v145 + 16) = v321;
  v146 = swift_allocObject();
  *(_OWORD *)(v146 + 24) = xmmword_245FC1780;
  *(_QWORD *)(v146 + 40) = 0xEF666C6168656275;
  v147 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v146 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v145 + 32) = 7632239;
  *(_QWORD *)(v145 + 40) = 0xE300000000000000;
  *(_QWORD *)(v145 + 48) = v146;
  *(_OWORD *)(v145 + 56) = 0u;
  *(_OWORD *)(v145 + 72) = 0u;
  *(_BYTE *)(v145 + 88) = 0;
  *(_QWORD *)&v497 = 0xD00000000000001ELL;
  *((_QWORD *)&v497 + 1) = 0x8000000245FCE630;
  v498 = 0xD000000000000013;
  v499 = v316;
  v501 = 0;
  v500 = 0;
  v502 = 0xD000000000000013;
  v503 = v140;
  v505 = 0;
  v504 = 0;
  v506 = 2;
  *(_DWORD *)v507 = *(_DWORD *)v722;
  *(_DWORD *)&v507[3] = *(_DWORD *)&v722[3];
  v508 = v147;
  v148 = v147;
  v509 = 0;
  v511 = 0;
  v510 = 0;
  v512 = 2;
  v513 = v143;
  v514 = v145;
  swift_retain();
  v149 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v142;
  v323 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v497, 0xD00000000000001ELL, 0x8000000245FCE630, v149);
  v150 = v322;
  swift_bridgeObjectRelease();
  v151 = swift_allocObject();
  *(_OWORD *)(v151 + 16) = v321;
  v152 = static MaterialXDataType.filename;
  *(_QWORD *)(v151 + 32) = 1701603686;
  *(_QWORD *)(v151 + 40) = 0xE400000000000000;
  *(_QWORD *)(v151 + 48) = v152;
  *(_OWORD *)(v151 + 56) = 0u;
  *(_OWORD *)(v151 + 72) = 0u;
  *(_BYTE *)(v151 + 88) = 0;
  v153 = swift_allocObject();
  *(_OWORD *)(v153 + 16) = v321;
  v154 = swift_allocObject();
  *(_OWORD *)(v154 + 24) = xmmword_245FC16F0;
  *(_QWORD *)(v154 + 40) = 0x8000000245FCA9E0;
  v155 = v148;
  *(_QWORD *)(v154 + 16) = v148;
  *(_QWORD *)(v153 + 32) = 7632239;
  *(_QWORD *)(v153 + 40) = 0xE300000000000000;
  *(_QWORD *)(v153 + 48) = v154;
  *(_OWORD *)(v153 + 56) = 0u;
  *(_OWORD *)(v153 + 72) = 0u;
  *(_BYTE *)(v153 + 88) = 0;
  *(_QWORD *)&v479 = 0xD00000000000001FLL;
  *((_QWORD *)&v479 + 1) = 0x8000000245FCE650;
  v480 = 0xD000000000000013;
  v156 = v316;
  v481 = v316;
  v482 = 0;
  v483 = 0;
  v484 = 0xD000000000000013;
  v485 = v317;
  v487 = 0;
  v486 = 0;
  v488 = 2;
  *(_DWORD *)v489 = *(_DWORD *)v723;
  *(_DWORD *)&v489[3] = *(_DWORD *)&v723[3];
  v490 = v155;
  v491 = 0;
  v493 = 0;
  v492 = 0;
  v494 = 2;
  v495 = v151;
  v496 = v153;
  swift_retain();
  v157 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v150;
  v323 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v479, 0xD00000000000001FLL, 0x8000000245FCE650, v157);
  v158 = v322;
  swift_bridgeObjectRelease();
  v159 = swift_allocObject();
  *(_OWORD *)(v159 + 16) = v321;
  v160 = static MaterialXDataType.filename;
  *(_QWORD *)(v159 + 32) = 1701603686;
  *(_QWORD *)(v159 + 40) = 0xE400000000000000;
  *(_QWORD *)(v159 + 48) = v160;
  *(_OWORD *)(v159 + 56) = 0u;
  *(_OWORD *)(v159 + 72) = 0u;
  *(_BYTE *)(v159 + 88) = 0;
  v161 = swift_allocObject();
  *(_OWORD *)(v161 + 16) = v321;
  v162 = swift_allocObject();
  *(_OWORD *)(v162 + 24) = v315;
  *(_QWORD *)(v162 + 40) = 0xEC000000746E6964;
  v163 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v162 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v161 + 32) = 7632239;
  *(_QWORD *)(v161 + 40) = 0xE300000000000000;
  *(_QWORD *)(v161 + 48) = v162;
  *(_OWORD *)(v161 + 56) = 0u;
  *(_OWORD *)(v161 + 72) = 0u;
  *(_BYTE *)(v161 + 88) = 0;
  v164 = v314;
  *(_QWORD *)&v461 = v314;
  *((_QWORD *)&v461 + 1) = 0x8000000245FCE670;
  v462 = 0xD000000000000013;
  v463 = v156;
  v464 = 0;
  v465 = 0;
  v466 = 0xD000000000000013;
  v467 = v317;
  v469 = 0;
  v468 = 0;
  v470 = 2;
  *(_DWORD *)v471 = *(_DWORD *)v724;
  *(_DWORD *)&v471[3] = *(_DWORD *)&v724[3];
  v472 = v163;
  v473 = 0;
  v475 = 0;
  v474 = 0;
  v476 = 2;
  v477 = v159;
  v478 = v161;
  swift_retain();
  v165 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v158;
  v323 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v461, v164, 0x8000000245FCE670, v165);
  v166 = v322;
  swift_bridgeObjectRelease();
  v167 = swift_allocObject();
  *(_OWORD *)(v167 + 16) = v321;
  if (one-time initialization token for integer != -1)
    swift_once();
  v168 = static MaterialXDataType.integer;
  *(_QWORD *)(v167 + 32) = 28265;
  *(_QWORD *)(v167 + 40) = 0xE200000000000000;
  *(_QWORD *)(v167 + 48) = v168;
  *(_OWORD *)(v167 + 56) = 0u;
  *(_OWORD *)(v167 + 72) = 0u;
  *(_BYTE *)(v167 + 88) = 1;
  v169 = swift_allocObject();
  *(_OWORD *)(v169 + 16) = v321;
  v170 = static MaterialXDataType.max_anisotropy;
  *(_QWORD *)(v169 + 32) = 7632239;
  *(_QWORD *)(v169 + 40) = 0xE300000000000000;
  *(_QWORD *)(v169 + 48) = v170;
  *(_OWORD *)(v169 + 56) = 0u;
  *(_OWORD *)(v169 + 72) = 0u;
  *(_BYTE *)(v169 + 88) = 0;
  *(_QWORD *)&v443 = 0xD000000000000017;
  *((_QWORD *)&v443 + 1) = 0x8000000245FCE690;
  v444 = 0xD000000000000017;
  v445 = 0x8000000245FCE690;
  v447 = 0;
  v446 = 0;
  v448 = 0xD000000000000013;
  v449 = v320 | 0x8000000000000000;
  v451 = 0;
  v450 = 0;
  v452 = 2;
  *(_DWORD *)v453 = v725[0];
  *(_DWORD *)&v453[3] = *(_DWORD *)((char *)v725 + 3);
  v454 = MEMORY[0x24BEE4AF8];
  v455 = 0;
  v457 = 0;
  v456 = 0;
  v458 = 2;
  v459 = v167;
  v460 = v169;
  swift_retain();
  swift_retain();
  v171 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v166;
  v323 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v443, 0xD000000000000017, 0x8000000245FCE690, v171);
  v323 = v322;
  swift_bridgeObjectRelease();
  v172 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<NodeDef.Implementation>);
  v318 = type metadata accessor for NodeDef.Implementation(0);
  v173 = *(_QWORD *)(v318 - 8);
  v174 = *(_QWORD *)(v173 + 72);
  v175 = *(unsigned __int8 *)(v173 + 80);
  v176 = (v175 + 32) & ~v175;
  *(_QWORD *)&v317 = v172;
  v314 = v175 | 7;
  *(_QWORD *)&v315 = v176 + v174;
  v177 = swift_allocObject();
  *(_OWORD *)(v177 + 16) = v321;
  v316 = v176;
  v178 = v177 + v176;
  v179 = (uint64_t)v302;
  *v302 = 0x73696E615F78616DLL;
  *(_QWORD *)(v179 + 8) = 0xEE0079706F72746FLL;
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)&v313 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  v180 = swift_allocObject();
  v312 = xmmword_245FBF370;
  *(_OWORD *)(v180 + 16) = xmmword_245FBF370;
  v311 = type metadata accessor for MaterialXTarget();
  *(_QWORD *)(v180 + 32) = swift_initStaticObject();
  v322 = v180;
  specialized Array._endMutation()();
  v181 = v322;
  if (v322 >> 62)
  {
    swift_bridgeObjectRetain();
    v183 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v183)
      goto LABEL_37;
  }
  else if (*(_QWORD *)((v322 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_37:
    v182 = specialized Set.init(_nonEmptyArrayLiteral:)(v181);
    goto LABEL_40;
  }
  v182 = MEMORY[0x24BEE4B08];
LABEL_40:
  swift_bridgeObjectRelease();
  outlined init with take of NodeDef.Implementation.Kind(v179, v178, type metadata accessor for NodeDef.Implementation.Kind);
  *(_QWORD *)(v178 + *(int *)(v318 + 20)) = v182;
  v184 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v325;
  v325 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v177, 0xD000000000000017, 0x8000000245FCE690, v184);
  v325 = v322;
  swift_bridgeObjectRelease();
  v185 = swift_allocObject();
  *(_OWORD *)(v185 + 16) = v321;
  v186 = static MaterialXDataType.float;
  *(_QWORD *)(v185 + 32) = 28265;
  *(_QWORD *)(v185 + 40) = 0xE200000000000000;
  *(_QWORD *)(v185 + 48) = v186;
  *(_OWORD *)(v185 + 56) = 0u;
  *(_OWORD *)(v185 + 72) = 0u;
  *(_BYTE *)(v185 + 88) = 0;
  v187 = swift_allocObject();
  *(_OWORD *)(v187 + 16) = v321;
  v188 = one-time initialization token for bias;
  swift_retain();
  if (v188 != -1)
    swift_once();
  v189 = static MaterialXDataType.bias;
  *(_QWORD *)(v187 + 32) = 7632239;
  *(_QWORD *)(v187 + 40) = 0xE300000000000000;
  *(_QWORD *)(v187 + 48) = v189;
  *(_OWORD *)(v187 + 56) = 0u;
  *(_OWORD *)(v187 + 72) = 0u;
  *(_BYTE *)(v187 + 88) = 0;
  strcpy((char *)&v427, "INTERNAL_bias");
  HIWORD(v427) = -4864;
  strcpy((char *)v428, "INTERNAL_bias");
  v428[7] = -4864;
  v429 = 0;
  v430 = 0;
  v431 = 0xD000000000000013;
  v432 = v320 | 0x8000000000000000;
  v434 = 0;
  v433 = 0;
  v435 = 2;
  v436 = MEMORY[0x24BEE4AF8];
  v437 = 0;
  v438 = 0;
  v439 = 0;
  v440 = 2;
  v441 = v185;
  v442 = v187;
  swift_retain();
  v190 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v323;
  v323 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v427, 0x4C414E5245544E49, 0xED0000736169625FLL, v190);
  v323 = v322;
  swift_bridgeObjectRelease();
  v191 = swift_allocObject();
  *(_OWORD *)(v191 + 16) = v321;
  v192 = v191 + v316;
  v193 = (uint64_t)v303;
  *v303 = 0xD000000000000012;
  *(_QWORD *)(v193 + 8) = 0x8000000245FCAFF0;
  swift_storeEnumTagMultiPayload();
  v194 = swift_allocObject();
  *(_OWORD *)(v194 + 16) = v312;
  *(_QWORD *)(v194 + 32) = swift_initStaticObject();
  v322 = v194;
  specialized Array._endMutation()();
  v195 = v322;
  if (v322 >> 62)
  {
    swift_bridgeObjectRetain();
    v196 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    v196 = *(_QWORD *)((v322 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v197 = MEMORY[0x24BEE4AF8];
  if (v196)
    v198 = specialized Set.init(_nonEmptyArrayLiteral:)(v195);
  else
    v198 = MEMORY[0x24BEE4B08];
  swift_bridgeObjectRelease();
  outlined init with take of NodeDef.Implementation.Kind(v193, v192, type metadata accessor for NodeDef.Implementation.Kind);
  *(_QWORD *)(v192 + *(int *)(v318 + 20)) = v198;
  v199 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v325;
  v325 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v191, 0x4C414E5245544E49, 0xED0000736169625FLL, v199);
  v325 = v322;
  swift_bridgeObjectRelease();
  v200 = swift_allocObject();
  *(_OWORD *)(v200 + 16) = v321;
  v201 = static MaterialXDataType.float;
  *(_QWORD *)(v200 + 32) = 28265;
  *(_QWORD *)(v200 + 40) = 0xE200000000000000;
  *(_QWORD *)(v200 + 48) = v201;
  *(_OWORD *)(v200 + 56) = 0u;
  *(_OWORD *)(v200 + 72) = 0u;
  *(_BYTE *)(v200 + 88) = 0;
  v202 = swift_allocObject();
  *(_OWORD *)(v202 + 16) = v321;
  v203 = one-time initialization token for level;
  swift_retain();
  if (v203 != -1)
    swift_once();
  v204 = static MaterialXDataType.level;
  *(_QWORD *)(v202 + 32) = 7632239;
  *(_QWORD *)(v202 + 40) = 0xE300000000000000;
  *(_QWORD *)(v202 + 48) = v204;
  *(_OWORD *)(v202 + 56) = 0u;
  *(_OWORD *)(v202 + 72) = 0u;
  *(_BYTE *)(v202 + 88) = 0;
  strcpy((char *)&v411, "INTERNAL_level");
  HIBYTE(v411) = -18;
  strcpy(v412, "INTERNAL_level");
  v412[15] = -18;
  v414 = 0;
  v413 = 0;
  v415 = 0xD000000000000013;
  v416 = v320 | 0x8000000000000000;
  v418 = 0;
  v417 = 0;
  v419 = 2;
  v420 = v197;
  v421 = 0;
  v422 = 0;
  v423 = 0;
  v424 = 2;
  v425 = v200;
  v426 = v202;
  swift_retain();
  v205 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v323;
  v323 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v411, 0x4C414E5245544E49, 0xEE006C6576656C5FLL, v205);
  v323 = v322;
  swift_bridgeObjectRelease();
  v206 = swift_allocObject();
  *(_OWORD *)(v206 + 16) = v321;
  v207 = v206 + v316;
  v208 = (uint64_t)v304;
  *v304 = 0xD000000000000013;
  *(_QWORD *)(v208 + 8) = 0x8000000245FCAFB0;
  swift_storeEnumTagMultiPayload();
  v209 = swift_allocObject();
  *(_OWORD *)(v209 + 16) = v312;
  *(_QWORD *)(v209 + 32) = swift_initStaticObject();
  v322 = v209;
  specialized Array._endMutation()();
  v210 = v322;
  if (v322 >> 62)
  {
    swift_bridgeObjectRetain();
    v212 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v212)
      goto LABEL_51;
  }
  else if (*(_QWORD *)((v322 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_51:
    v211 = specialized Set.init(_nonEmptyArrayLiteral:)(v210);
    goto LABEL_55;
  }
  v211 = MEMORY[0x24BEE4B08];
LABEL_55:
  swift_bridgeObjectRelease();
  outlined init with take of NodeDef.Implementation.Kind(v208, v207, type metadata accessor for NodeDef.Implementation.Kind);
  *(_QWORD *)(v207 + *(int *)(v318 + 20)) = v211;
  v213 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v325;
  v325 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v206, 0x4C414E5245544E49, 0xEE006C6576656C5FLL, v213);
  v325 = v322;
  swift_bridgeObjectRelease();
  v214 = swift_allocObject();
  *(_OWORD *)(v214 + 16) = v321;
  v215 = static MaterialXDataType.float;
  *(_QWORD *)(v214 + 32) = 28265;
  *(_QWORD *)(v214 + 40) = 0xE200000000000000;
  *(_QWORD *)(v214 + 48) = v215;
  *(_OWORD *)(v214 + 56) = 0u;
  *(_OWORD *)(v214 + 72) = 0u;
  *(_BYTE *)(v214 + 88) = 0;
  v216 = swift_allocObject();
  *(_OWORD *)(v216 + 16) = v321;
  v217 = one-time initialization token for min_lod_clamp;
  swift_retain();
  if (v217 != -1)
    swift_once();
  v218 = static MaterialXDataType.min_lod_clamp;
  *(_QWORD *)(v216 + 32) = 7632239;
  *(_QWORD *)(v216 + 40) = 0xE300000000000000;
  *(_QWORD *)(v216 + 48) = v218;
  *(_OWORD *)(v216 + 56) = 0u;
  *(_OWORD *)(v216 + 72) = 0u;
  *(_BYTE *)(v216 + 88) = 0;
  *(_QWORD *)&v394 = 0xD000000000000016;
  *((_QWORD *)&v394 + 1) = 0x8000000245FCE6B0;
  v395 = 0xD000000000000016;
  v396 = 0x8000000245FCE6B0;
  v398 = 0;
  v397 = 0;
  v399 = 0xD000000000000013;
  v400 = v320 | 0x8000000000000000;
  v402 = 0;
  v401 = 0;
  v403 = 2;
  v404 = MEMORY[0x24BEE4AF8];
  v405 = 0;
  v406 = 0;
  v407 = 0;
  v408 = 2;
  v409 = v214;
  v410 = v216;
  swift_retain();
  v219 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v323;
  v323 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v394, 0xD000000000000016, 0x8000000245FCE6B0, v219);
  v323 = v322;
  swift_bridgeObjectRelease();
  v220 = swift_allocObject();
  *(_OWORD *)(v220 + 16) = v321;
  v221 = v220 + v316;
  v222 = (uint64_t)v305;
  *v305 = 0xD00000000000001BLL;
  *(_QWORD *)(v222 + 8) = 0x8000000245FCAFD0;
  swift_storeEnumTagMultiPayload();
  v223 = swift_allocObject();
  *(_OWORD *)(v223 + 16) = v312;
  *(_QWORD *)(v223 + 32) = swift_initStaticObject();
  v322 = v223;
  specialized Array._endMutation()();
  v224 = v322;
  if (v322 >> 62)
  {
    swift_bridgeObjectRetain();
    v226 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v226)
      goto LABEL_59;
  }
  else if (*(_QWORD *)((v322 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_59:
    v225 = specialized Set.init(_nonEmptyArrayLiteral:)(v224);
    goto LABEL_62;
  }
  v225 = MEMORY[0x24BEE4B08];
LABEL_62:
  swift_bridgeObjectRelease();
  outlined init with take of NodeDef.Implementation.Kind(v222, v221, type metadata accessor for NodeDef.Implementation.Kind);
  *(_QWORD *)(v221 + *(int *)(v318 + 20)) = v225;
  v227 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v325;
  v325 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v220, 0xD000000000000016, 0x8000000245FCE6B0, v227);
  v325 = v322;
  swift_bridgeObjectRelease();
  v228 = swift_allocObject();
  *(_OWORD *)(v228 + 16) = v310;
  v229 = static MaterialXDataType.float;
  *(_QWORD *)(v228 + 32) = 7235949;
  *(_QWORD *)(v228 + 40) = 0xE300000000000000;
  *(_QWORD *)(v228 + 48) = v229;
  *(_OWORD *)(v228 + 56) = 0u;
  *(_OWORD *)(v228 + 72) = 0u;
  *(_BYTE *)(v228 + 88) = 1;
  *(_QWORD *)(v228 + 96) = 7889261;
  *(_QWORD *)(v228 + 104) = 0xE300000000000000;
  *(_QWORD *)(v228 + 112) = v229;
  *(_OWORD *)(v228 + 120) = 0u;
  *(_OWORD *)(v228 + 136) = 0u;
  *(_BYTE *)(v228 + 152) = 1;
  v230 = swift_allocObject();
  *(_OWORD *)(v230 + 16) = v321;
  v231 = static MaterialXDataType.lod_clamp;
  *(_QWORD *)(v230 + 32) = 7632239;
  *(_QWORD *)(v230 + 40) = 0xE300000000000000;
  *(_QWORD *)(v230 + 48) = v231;
  *(_OWORD *)(v230 + 56) = 0u;
  *(_OWORD *)(v230 + 72) = 0u;
  *(_BYTE *)(v230 + 88) = 0;
  *(_QWORD *)&v377 = 0xD000000000000012;
  *((_QWORD *)&v377 + 1) = 0x8000000245FCE6D0;
  v378 = 0xD000000000000012;
  v379 = 0x8000000245FCE6D0;
  v381 = 0;
  v380 = 0;
  v382 = 0xD000000000000013;
  v383 = v320 | 0x8000000000000000;
  v385 = 0;
  v384 = 0;
  v386 = 2;
  v387 = MEMORY[0x24BEE4AF8];
  v388 = 0;
  v390 = 0;
  v389 = 0;
  v391 = 2;
  v392 = v228;
  v393 = v230;
  swift_retain_n();
  swift_retain();
  v232 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v323;
  v323 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v377, 0xD000000000000012, 0x8000000245FCE6D0, v232);
  v323 = v322;
  swift_bridgeObjectRelease();
  v233 = swift_allocObject();
  *(_OWORD *)(v233 + 16) = v321;
  v234 = v233 + v316;
  v235 = (uint64_t)v306;
  *v306 = 0x6D616C635F646F6CLL;
  *(_QWORD *)(v235 + 8) = 0xE900000000000070;
  swift_storeEnumTagMultiPayload();
  v236 = swift_allocObject();
  *(_OWORD *)(v236 + 16) = v312;
  *(_QWORD *)(v236 + 32) = swift_initStaticObject();
  v322 = v236;
  specialized Array._endMutation()();
  v237 = v322;
  if (v322 >> 62)
  {
    swift_bridgeObjectRetain();
    v239 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v239)
      goto LABEL_64;
  }
  else if (*(_QWORD *)((v322 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_64:
    v238 = specialized Set.init(_nonEmptyArrayLiteral:)(v237);
    goto LABEL_67;
  }
  v238 = MEMORY[0x24BEE4B08];
LABEL_67:
  swift_bridgeObjectRelease();
  outlined init with take of NodeDef.Implementation.Kind(v235, v234, type metadata accessor for NodeDef.Implementation.Kind);
  *(_QWORD *)(v234 + *(int *)(v318 + 20)) = v238;
  v240 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v325;
  v325 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v233, 0xD000000000000012, 0x8000000245FCE6D0, v240);
  v325 = v322;
  swift_bridgeObjectRelease();
  v241 = swift_allocObject();
  *(_OWORD *)(v241 + 16) = v310;
  if (one-time initialization token for vector2 != -1)
    swift_once();
  v242 = static MaterialXDataType.vector2;
  *(_QWORD *)(v241 + 32) = 2019840100;
  *(_QWORD *)(v241 + 40) = 0xE400000000000000;
  *(_QWORD *)(v241 + 48) = v242;
  *(_OWORD *)(v241 + 56) = 0u;
  *(_OWORD *)(v241 + 72) = 0u;
  *(_BYTE *)(v241 + 88) = 0;
  *(_QWORD *)(v241 + 96) = 2036617316;
  *(_QWORD *)(v241 + 104) = 0xE400000000000000;
  *(_QWORD *)(v241 + 112) = v242;
  *(_OWORD *)(v241 + 120) = 0u;
  *(_OWORD *)(v241 + 136) = 0u;
  *(_BYTE *)(v241 + 152) = 0;
  v243 = swift_allocObject();
  *(_OWORD *)(v243 + 16) = v321;
  v244 = one-time initialization token for gradient2d;
  swift_retain_n();
  if (v244 != -1)
    swift_once();
  v245 = static MaterialXDataType.gradient2d;
  *(_QWORD *)(v243 + 32) = 7632239;
  *(_QWORD *)(v243 + 40) = 0xE300000000000000;
  *(_QWORD *)(v243 + 48) = v245;
  *(_OWORD *)(v243 + 56) = 0u;
  *(_OWORD *)(v243 + 72) = 0u;
  *(_BYTE *)(v243 + 88) = 0;
  *(_QWORD *)&v360 = 0xD000000000000013;
  *((_QWORD *)&v360 + 1) = 0x8000000245FCE6F0;
  v361 = 0xD000000000000013;
  v362 = 0x8000000245FCE6F0;
  v364 = 0;
  v363 = 0;
  v365 = 0xD000000000000013;
  v366 = v320 | 0x8000000000000000;
  v368 = 0;
  v367 = 0;
  v369 = 2;
  v370 = MEMORY[0x24BEE4AF8];
  v371 = 0;
  v372 = 0;
  v373 = 0;
  v374 = 2;
  v375 = v241;
  v376 = v243;
  swift_retain();
  v246 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v323;
  v323 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v360, 0xD000000000000013, 0x8000000245FCE6F0, v246);
  v323 = v322;
  swift_bridgeObjectRelease();
  v247 = swift_allocObject();
  *(_OWORD *)(v247 + 16) = v321;
  v248 = v247 + v316;
  v249 = (uint64_t)v307;
  *v307 = 0xD000000000000018;
  *(_QWORD *)(v249 + 8) = 0x8000000245FCAF90;
  swift_storeEnumTagMultiPayload();
  v250 = swift_allocObject();
  *(_OWORD *)(v250 + 16) = v312;
  *(_QWORD *)(v250 + 32) = swift_initStaticObject();
  v322 = v250;
  specialized Array._endMutation()();
  v251 = v322;
  if (v322 >> 62)
  {
    swift_bridgeObjectRetain();
    v253 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v253)
      goto LABEL_73;
  }
  else if (*(_QWORD *)((v322 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_73:
    v252 = specialized Set.init(_nonEmptyArrayLiteral:)(v251);
    goto LABEL_76;
  }
  v252 = MEMORY[0x24BEE4B08];
LABEL_76:
  swift_bridgeObjectRelease();
  outlined init with take of NodeDef.Implementation.Kind(v249, v248, type metadata accessor for NodeDef.Implementation.Kind);
  *(_QWORD *)(v248 + *(int *)(v318 + 20)) = v252;
  v254 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v325;
  v325 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v247, 0xD000000000000013, 0x8000000245FCE6F0, v254);
  v325 = v322;
  swift_bridgeObjectRelease();
  v255 = swift_allocObject();
  *(_OWORD *)(v255 + 16) = v310;
  if (one-time initialization token for vector3 != -1)
    swift_once();
  v256 = static MaterialXDataType.vector3;
  *(_QWORD *)(v255 + 32) = 2019840100;
  *(_QWORD *)(v255 + 40) = 0xE400000000000000;
  *(_QWORD *)(v255 + 48) = v256;
  *(_OWORD *)(v255 + 56) = 0u;
  *(_OWORD *)(v255 + 72) = 0u;
  *(_BYTE *)(v255 + 88) = 0;
  *(_QWORD *)(v255 + 96) = 2036617316;
  *(_QWORD *)(v255 + 104) = 0xE400000000000000;
  *(_QWORD *)(v255 + 112) = v256;
  *(_OWORD *)(v255 + 120) = 0u;
  *(_OWORD *)(v255 + 136) = 0u;
  *(_BYTE *)(v255 + 152) = 0;
  v257 = swift_allocObject();
  *(_OWORD *)(v257 + 16) = v321;
  v258 = one-time initialization token for gradient3d;
  swift_retain_n();
  if (v258 != -1)
    swift_once();
  v259 = static MaterialXDataType.gradient3d;
  *(_QWORD *)(v257 + 32) = 7632239;
  *(_QWORD *)(v257 + 40) = 0xE300000000000000;
  *(_QWORD *)(v257 + 48) = v259;
  *(_OWORD *)(v257 + 56) = 0u;
  *(_OWORD *)(v257 + 72) = 0u;
  *(_BYTE *)(v257 + 88) = 0;
  *(_QWORD *)&v343 = 0xD000000000000013;
  *((_QWORD *)&v343 + 1) = 0x8000000245FCE710;
  v344 = 0xD000000000000013;
  v345 = 0x8000000245FCE710;
  v346 = 0;
  v347 = 0;
  v348 = 0xD000000000000013;
  v349 = v320 | 0x8000000000000000;
  v350 = 0;
  v351 = 0;
  v352 = 2;
  v353 = MEMORY[0x24BEE4AF8];
  v354 = 0;
  v355 = 0;
  v356 = 0;
  v357 = 2;
  v358 = v255;
  v359 = v257;
  swift_retain();
  v260 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v323;
  v323 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v343, 0xD000000000000013, 0x8000000245FCE710, v260);
  v323 = v322;
  swift_bridgeObjectRelease();
  v261 = swift_allocObject();
  *(_OWORD *)(v261 + 16) = v321;
  v262 = v261 + v316;
  v263 = (uint64_t)v308;
  *v308 = 0xD000000000000018;
  *(_QWORD *)(v263 + 8) = 0x8000000245FCAF70;
  swift_storeEnumTagMultiPayload();
  v264 = swift_allocObject();
  *(_OWORD *)(v264 + 16) = v312;
  *(_QWORD *)(v264 + 32) = swift_initStaticObject();
  v322 = v264;
  specialized Array._endMutation()();
  v265 = v322;
  if (v322 >> 62)
  {
    swift_bridgeObjectRetain();
    v267 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v267)
      goto LABEL_82;
  }
  else if (*(_QWORD *)((v322 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_82:
    v266 = specialized Set.init(_nonEmptyArrayLiteral:)(v265);
    goto LABEL_85;
  }
  v266 = MEMORY[0x24BEE4B08];
LABEL_85:
  swift_bridgeObjectRelease();
  outlined init with take of NodeDef.Implementation.Kind(v263, v262, type metadata accessor for NodeDef.Implementation.Kind);
  *(_QWORD *)(v262 + *(int *)(v318 + 20)) = v266;
  v268 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v325;
  v325 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v261, 0xD000000000000013, 0x8000000245FCE710, v268);
  v325 = v322;
  swift_bridgeObjectRelease();
  v269 = swift_allocObject();
  *(_OWORD *)(v269 + 16) = v310;
  v270 = static MaterialXDataType.vector3;
  *(_QWORD *)(v269 + 32) = 2019840100;
  *(_QWORD *)(v269 + 40) = 0xE400000000000000;
  *(_QWORD *)(v269 + 48) = v270;
  *(_OWORD *)(v269 + 56) = 0u;
  *(_OWORD *)(v269 + 72) = 0u;
  *(_BYTE *)(v269 + 88) = 0;
  *(_QWORD *)(v269 + 96) = 2036617316;
  *(_QWORD *)(v269 + 104) = 0xE400000000000000;
  *(_QWORD *)(v269 + 112) = v270;
  *(_OWORD *)(v269 + 120) = 0u;
  *(_OWORD *)(v269 + 136) = 0u;
  *(_BYTE *)(v269 + 152) = 0;
  v271 = swift_allocObject();
  *(_OWORD *)(v271 + 16) = v321;
  v272 = one-time initialization token for gradientcube;
  swift_retain_n();
  if (v272 != -1)
    swift_once();
  v273 = static MaterialXDataType.gradientcube;
  *(_QWORD *)(v271 + 32) = 7632239;
  *(_QWORD *)(v271 + 40) = 0xE300000000000000;
  *(_QWORD *)(v271 + 48) = v273;
  *(_OWORD *)(v271 + 56) = 0u;
  *(_OWORD *)(v271 + 72) = 0u;
  *(_BYTE *)(v271 + 88) = 0;
  *(_QWORD *)&v326 = 0xD000000000000015;
  *((_QWORD *)&v326 + 1) = 0x8000000245FCE730;
  v327 = 0xD000000000000015;
  v328 = 0x8000000245FCE730;
  v329 = 0;
  v330 = 0;
  v331 = 0xD000000000000013;
  v332 = v320 | 0x8000000000000000;
  v333 = 0;
  v334 = 0;
  v335 = 2;
  v336 = MEMORY[0x24BEE4AF8];
  v337 = 0;
  v338 = 0;
  v339 = 0;
  v340 = 2;
  v341 = v269;
  v342 = v271;
  swift_retain();
  v274 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v323;
  v323 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v326, 0xD000000000000015, 0x8000000245FCE730, v274);
  v323 = v322;
  swift_bridgeObjectRelease();
  v275 = swift_allocObject();
  *(_OWORD *)(v275 + 16) = v321;
  v276 = v275 + v316;
  v277 = (uint64_t)v309;
  *v309 = 0xD00000000000001ALL;
  *(_QWORD *)(v277 + 8) = 0x8000000245FCAF50;
  swift_storeEnumTagMultiPayload();
  v278 = swift_allocObject();
  *(_OWORD *)(v278 + 16) = v312;
  *(_QWORD *)(v278 + 32) = swift_initStaticObject();
  v322 = v278;
  specialized Array._endMutation()();
  v279 = v322;
  if (v322 >> 62)
  {
    swift_bridgeObjectRetain();
    v281 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v281)
      goto LABEL_89;
LABEL_91:
    v280 = MEMORY[0x24BEE4B08];
    goto LABEL_92;
  }
  if (!*(_QWORD *)((v322 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_91;
LABEL_89:
  v280 = specialized Set.init(_nonEmptyArrayLiteral:)(v279);
LABEL_92:
  swift_bridgeObjectRelease();
  outlined init with take of NodeDef.Implementation.Kind(v277, v276, type metadata accessor for NodeDef.Implementation.Kind);
  *(_QWORD *)(v276 + *(int *)(v318 + 20)) = v280;
  v282 = swift_isUniquelyReferenced_nonNull_native();
  v322 = v325;
  v325 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v275, 0xD000000000000015, 0x8000000245FCE730, v282);
  v325 = v322;
  swift_bridgeObjectRelease();
  NodeDefStore.loadLibrary()();
  if (v283 || (NodeDefStore.applyStandardLibraryFixes()(), v284))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v286 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000022, 0x8000000245FC6480);
    v288 = v287;
    swift_bridgeObjectRelease();
    if ((v288 & 1) != 0)
    {
      v289 = swift_isUniquelyReferenced_nonNull_native();
      v290 = v325;
      v322 = v325;
      v325 = 0x8000000000000000;
      if ((v289 & 1) == 0)
      {
        specialized _NativeDictionary.copy()();
        v290 = v322;
      }
      swift_bridgeObjectRelease();
      specialized _NativeDictionary._delete(at:)(v286, v290);
      v325 = v290;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v291 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000021, 0x8000000245FC64B0);
    v293 = v292;
    swift_bridgeObjectRelease();
    if ((v293 & 1) != 0)
    {
      v294 = swift_isUniquelyReferenced_nonNull_native();
      v295 = v325;
      v322 = v325;
      v325 = 0x8000000000000000;
      if ((v294 & 1) == 0)
      {
        specialized _NativeDictionary.copy()();
        v295 = v322;
      }
      swift_bridgeObjectRelease();
      specialized _NativeDictionary._delete(at:)(v291, v295);
      v325 = v295;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v296 = specialized __RawDictionaryStorage.find<A>(_:)(0xD00000000000001FLL, 0x8000000245FC64E0);
    v298 = v297;
    swift_bridgeObjectRelease();
    if ((v298 & 1) != 0)
    {
      v299 = swift_isUniquelyReferenced_nonNull_native();
      v300 = v325;
      v322 = v325;
      v325 = 0x8000000000000000;
      if ((v299 & 1) == 0)
      {
        specialized _NativeDictionary.copy()();
        v300 = v322;
      }
      swift_bridgeObjectRelease();
      specialized _NativeDictionary._delete(at:)(v296, v300);
      v325 = v300;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_arrayDestroy();
    return v323;
  }
}

uint64_t specialized Sequence.contains(where:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;

  v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    lazy protocol witness table accessor for type SGDataType and conformance SGDataType((unint64_t *)&lazy protocol witness table cache variable for type MaterialXTarget and conformance MaterialXTarget, (uint64_t (*)(uint64_t))type metadata accessor for MaterialXTarget, (uint64_t)&protocol conformance descriptor for MaterialXTarget);
    result = Set.Iterator.init(_cocoa:)();
    v1 = v20;
    v19 = v21;
    v3 = v22;
    v4 = v23;
    v5 = v24;
  }
  else
  {
    v6 = -1 << *(_BYTE *)(a1 + 32);
    v19 = a1 + 56;
    v3 = ~v6;
    v7 = -v6;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v5 = v8 & *(_QWORD *)(a1 + 56);
    result = swift_bridgeObjectRetain();
    v4 = 0;
  }
  v9 = (unint64_t)(v3 + 64) >> 6;
  while (1)
  {
    v14 = v4;
    if (v1 < 0)
    {
      if (!__CocoaSet.Iterator.next()())
        goto LABEL_33;
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v12 = v25;
      swift_unknownObjectRelease();
      if (!v25)
        goto LABEL_33;
      goto LABEL_10;
    }
    if (!v5)
      break;
    v10 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
    v11 = v10 | (v4 << 6);
LABEL_9:
    v12 = *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8 * v11);
    swift_retain();
    if (!v12)
      goto LABEL_33;
LABEL_10:
    v13 = MaterialXTarget.conformsTo(_:)(v12);
    result = swift_release();
    if ((v13 & 1) != 0)
    {
      v18 = 1;
      goto LABEL_34;
    }
  }
  v15 = v4 + 1;
  if (!__OFADD__(v4, 1))
  {
    if (v15 >= v9)
      goto LABEL_33;
    v16 = *(_QWORD *)(v19 + 8 * v15);
    ++v4;
    if (!v16)
    {
      v4 = v14 + 2;
      if (v14 + 2 >= v9)
        goto LABEL_33;
      v16 = *(_QWORD *)(v19 + 8 * v4);
      if (!v16)
      {
        v4 = v14 + 3;
        if (v14 + 3 >= v9)
          goto LABEL_33;
        v16 = *(_QWORD *)(v19 + 8 * v4);
        if (!v16)
        {
          v4 = v14 + 4;
          if (v14 + 4 >= v9)
            goto LABEL_33;
          v16 = *(_QWORD *)(v19 + 8 * v4);
          if (!v16)
          {
            v4 = v14 + 5;
            if (v14 + 5 >= v9)
              goto LABEL_33;
            v16 = *(_QWORD *)(v19 + 8 * v4);
            if (!v16)
            {
              v17 = v14 + 6;
              while (v9 != v17)
              {
                v16 = *(_QWORD *)(v19 + 8 * v17++);
                if (v16)
                {
                  v4 = v17 - 1;
                  goto LABEL_28;
                }
              }
LABEL_33:
              v18 = 0;
LABEL_34:
              outlined consume of [String : InputSpec].Iterator._Variant();
              return v18;
            }
          }
        }
      }
    }
LABEL_28:
    v5 = (v16 - 1) & v16;
    v11 = __clz(__rbit64(v16)) + (v4 << 6);
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t specialized static NodeDefStore.inferLibraryFunctionName(forNodeDefName:)(uint64_t a1, void *a2)
{
  Swift::String v4;
  Swift::String_optional v5;
  uint64_t countAndFlagsBits;
  void *object;
  Swift::String_optional v8;
  uint64_t v9;
  Swift::String v10;

  v4._countAndFlagsBits = 6243406;
  v4._object = (void *)0xE300000000000000;
  if (!String.hasPrefix(_:)(v4))
    goto LABEL_11;
  swift_bridgeObjectRetain();
  v5 = String.Iterator.next()();
  if (v5.value._object)
  {
    countAndFlagsBits = v5.value._countAndFlagsBits;
    object = v5.value._object;
    do
    {
      if (countAndFlagsBits == 95 && object == (void *)0xE100000000000000
        || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        MEMORY[0x24954B040](countAndFlagsBits, object);
      }
      swift_bridgeObjectRelease();
      v8 = String.Iterator.next()();
      countAndFlagsBits = v8.value._countAndFlagsBits;
      object = v8.value._object;
    }
    while (v8.value._object);
  }
  swift_bridgeObjectRelease();
  v9 = String.count.getter();
  swift_bridgeObjectRelease();
  if (v9 >= 2)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
LABEL_11:
    v10._countAndFlagsBits = a1;
    v10._object = a2;
    String.append(_:)(v10);
    return 0x3A3A786C746DLL;
  }
  return a1;
}

unint64_t lazy protocol witness table accessor for type NodeDefStore.Errors and conformance NodeDefStore.Errors()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type NodeDefStore.Errors and conformance NodeDefStore.Errors;
  if (!lazy protocol witness table cache variable for type NodeDefStore.Errors and conformance NodeDefStore.Errors)
  {
    result = MEMORY[0x24954C264](&protocol conformance descriptor for NodeDefStore.Errors, &type metadata for NodeDefStore.Errors);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type NodeDefStore.Errors and conformance NodeDefStore.Errors);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type NodeDefStore.Errors and conformance NodeDefStore.Errors;
  if (!lazy protocol witness table cache variable for type NodeDefStore.Errors and conformance NodeDefStore.Errors)
  {
    result = MEMORY[0x24954C264](&protocol conformance descriptor for NodeDefStore.Errors, &type metadata for NodeDefStore.Errors);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type NodeDefStore.Errors and conformance NodeDefStore.Errors);
  }
  return result;
}

uint64_t partial apply for closure #2 in NodeDefStore.applyStandardLibraryFixes()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #2 in NodeDefStore.applyStandardLibraryFixes()(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t destroy for NodeDefStore()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeBufferWithCopyOfBuffer for NodeDefStore(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for NodeDefStore(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for NodeDefStore(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for NodeDefStore()
{
  return &type metadata for NodeDefStore;
}

uint64_t storeEnumTagSinglePayload for NodeDefStore.Errors(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_245FB27B8 + 4 * byte_245FC5F43[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_245FB27EC + 4 * byte_245FC5F3E[v4]))();
}

uint64_t sub_245FB27EC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245FB27F4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245FB27FCLL);
  return result;
}

uint64_t sub_245FB2808(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245FB2810);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_245FB2814(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245FB281C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NodeDefStore.Errors()
{
  return &type metadata for NodeDefStore.Errors;
}

uint64_t sub_245FB2838()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

Swift::Void __swiftcall OrderedSet._ensureUnique()()
{
  uint64_t *v0;
  uint64_t v1;

  if (*v0 && (swift_isUniquelyReferenced_native() & 1) == 0)
  {
    if (*v0)
    {
      v1 = _HashTable.copy()((_QWORD *)*v0);
      swift_release();
      *v0 = v1;
    }
    else
    {
      __break(1u);
    }
  }
}

Swift::Void __swiftcall OrderedSet._regenerateExistingHashTable()()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (*v1)
  {
    v2 = v0;
    OrderedSet._ensureUnique()();
    v3 = *v1;
    if (*v1)
    {
      v5 = *(_QWORD *)(v2 + 16);
      v4 = *(_QWORD *)(v2 + 24);
      swift_retain();
      closure #1 in OrderedSet._regenerateExistingHashTable()((_QWORD *)(v3 + 16), v3 + 32, (uint64_t)v1, v5, v4);
      swift_release();
    }
    else
    {
      __break(1u);
    }
  }
}

Swift::Void __swiftcall OrderedSet._regenerateHashTable()()
{
  uint64_t *v0;
  uint64_t v1;
  Swift::Int v2;
  int64_t v4;
  Swift::Int v5;

  v1 = *v0;
  if (*v0)
  {
    swift_beginAccess();
    v2 = *(_QWORD *)(v1 + 24) & 0x3FLL;
  }
  else
  {
    v2 = 0;
  }
  if (ContiguousArray.count.getter() <= 15 && v2 == 0)
  {
    swift_release();
    *v0 = 0;
  }
  else
  {
    v4 = ContiguousArray.count.getter();
    v5 = specialized static _HashTable.scale(forCapacity:)(v4);
    OrderedSet._regenerateHashTable(scale:reservedScale:)(v5, v2);
  }
}

uint64_t OrderedSet._table.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_release();
  *v1 = a1;
  return result;
}

uint64_t OrderedSet.init(_uniqueElements:_:)(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OrderedSet.elements.getter()
{
  uint64_t v0;

  v0 = type metadata accessor for ContiguousArray();
  swift_retain();
  MEMORY[0x24954C264](MEMORY[0x24BEE2A48], v0);
  return Array.init<A>(_:)();
}

uint64_t OrderedSet._find(_:)()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (index: Int?, bucket: _HashTable.Bucket));
  ContiguousArray.withUnsafeBufferPointer<A>(_:)();
  return v1;
}

uint64_t OrderedSet._bucket(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v9;

  if (!a2)
    return 0;
  v6 = (_QWORD *)(a2 + 16);
  v7 = a2 + 32;
  swift_retain();
  closure #1 in OrderedSet._bucket(for:)(v6, v7, a1, a4, &v9);
  swift_release();
  return v9;
}

void OrderedSet._removeExistingMember(at:in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = v3;
  v8 = *(_QWORD *)(a3 + 16);
  swift_retain();
  v9 = ContiguousArray.count.getter();
  swift_release();
  v10 = v9 - 1;
  if (__OFSUB__(v9, 1))
  {
    __break(1u);
  }
  else
  {
    v11 = *v3;
    v12 = *(_QWORD *)(a3 + 24);
    if (v10 < OrderedSet._minimumCapacity.getter(*v4))
    {
      type metadata accessor for ContiguousArray();
      ContiguousArray.remove(at:)();
      OrderedSet._regenerateHashTable()();
      return;
    }
    if (!v11)
      goto LABEL_7;
    OrderedSet._ensureUnique()();
    v13 = *v4;
    if (*v4)
    {
      swift_retain();
      closure #1 in OrderedSet._removeExistingMember(at:in:)((uint64_t *)(v13 + 16), v13 + 32, a2, (uint64_t)v4, a1, v8, v12);
      swift_release();
LABEL_7:
      type metadata accessor for ContiguousArray();
      ContiguousArray.remove(at:)();
      return;
    }
  }
  __break(1u);
}

uint64_t OrderedSet._minimumCapacity.getter(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;
  unsigned int v3;
  unint64_t v4;
  double v5;

  if (result)
  {
    v1 = result;
    v2 = (_QWORD *)(result + 16);
    swift_beginAccess();
    v3 = *(_DWORD *)(v1 + 16);
    swift_beginAccess();
    if (((*(_DWORD *)(v1 + 24) ^ v3) & 0x3FLL) != 0)
    {
      swift_beginAccess();
      result = 0;
      v4 = *v2 & 0x3FLL;
      if (v4 >= 5)
      {
        v5 = (double)(1 << v4) * 0.25;
        if ((~*(_QWORD *)&v5 & 0x7FF0000000000000) != 0)
        {
          if (v5 > -9.22337204e18)
          {
            if (v5 < 9.22337204e18)
              return (uint64_t)v5;
            goto LABEL_12;
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
LABEL_12:
        __break(1u);
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t OrderedSet._find_inlined(_:)()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (index: Int?, bucket: _HashTable.Bucket));
  ContiguousArray.withUnsafeBufferPointer<A>(_:)();
  return v1;
}

uint64_t OrderedSet._scale.getter(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    swift_beginAccess();
    return *(_QWORD *)(v1 + 16) & 0x3FLL;
  }
  return result;
}

uint64_t OrderedSet._reservedScale.getter(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    swift_beginAccess();
    return *(_QWORD *)(v1 + 24) & 0x3FLL;
  }
  return result;
}

Swift::Void __swiftcall OrderedSet._regenerateHashTable(scale:reservedScale:)(Swift::Int scale, Swift::Int reservedScale)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  Swift::Int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = v2;
  v10 = v3[1];
  if (reservedScale <= scale)
    v6 = scale;
  else
    v6 = reservedScale;
  v7 = type metadata accessor for ContiguousArray();
  v8 = MEMORY[0x24954C264](MEMORY[0x24BEE2A58], v7);
  v9 = static _HashTable.create<A>(uncheckedUniqueElements:scale:reservedScale:)((uint64_t)&v10, v6, 0, reservedScale, v7, v8, *(_QWORD *)(v4 + 24));
  swift_release();
  *v3 = v9;
}

uint64_t OrderedSet.lastIndex(of:)()
{
  return OrderedSet._find(_:)();
}

Swift::Int OrderedSet._extractSubset(using:extraCapacity:)(uint64_t *a1, uint64_t a2, uint64_t a3, Swift::Int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  Swift::Int result;
  uint64_t v23;
  Swift::Int v24;
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

  v16 = *(_QWORD *)(a7 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v19)
  {
    v25 = OrderedSet.init(minimumCapacity:persistent:)(a4, 0, a7, a8);
    swift_release();
    swift_release();
    return v25;
  }
  v34 = a5;
  if (ContiguousArray.count.getter() == a3)
  {
    v20 = v34;
    v21 = OrderedSet._capacity.getter(v34);
    result = ContiguousArray.count.getter();
    if (__OFSUB__(v21, result))
      goto LABEL_29;
    if (v21 - result < a4)
    {
      v35 = v20;
      v36 = a6;
      swift_retain();
      swift_retain();
      result = ContiguousArray.count.getter();
      v24 = result + a4;
      if (__OFADD__(result, a4))
        goto LABEL_31;
      type metadata accessor for OrderedSet(0, a7, a8, v23);
      OrderedSet.reserveCapacity(_:)(v24);
      swift_release();
LABEL_25:
      swift_release();
      return v35;
    }
    return v20;
  }
  result = a3 + a4;
  if (__OFADD__(a3, a4))
    goto LABEL_30;
  result = OrderedSet.init(minimumCapacity:persistent:)(result, 0, a7, a8);
  v35 = result;
  v36 = v26;
  if (a2 < 1)
    v27 = 0;
  else
    v27 = *a1;
  v28 = 0;
  while (1)
  {
    if (v27)
    {
      v27 &= v27 - 1;
      goto LABEL_14;
    }
    v31 = v28 + 1;
    if (__OFADD__(v28, 1))
      goto LABEL_28;
    if (v31 >= a2)
    {
LABEL_24:
      swift_release();
      goto LABEL_25;
    }
    v32 = a1[v31];
    if (!v32)
      break;
    ++v28;
LABEL_23:
    v27 = (v32 - 1) & v32;
LABEL_14:
    ContiguousArray.subscript.getter();
    v30 = type metadata accessor for OrderedSet(0, a7, a8, v29);
    OrderedSet._appendNew(_:)((uint64_t)v18, v30);
    result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, a7);
  }
  while (1)
  {
    v28 = v31 + 1;
    if (__OFADD__(v31, 1))
      break;
    if (v28 >= a2)
      goto LABEL_24;
    v32 = a1[v28];
    ++v31;
    if (v32)
      goto LABEL_23;
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t OrderedSet.__storage.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_release();
  *v1 = a1;
  return result;
}

uint64_t (*OrderedSet.__storage.modify())()
{
  return destructiveProjectEnumData for NodePersonality.ShaderType;
}

uint64_t OrderedSet._elements.getter()
{
  return swift_retain();
}

uint64_t OrderedSet._elements.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_release();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t (*OrderedSet._elements.modify())()
{
  return destructiveProjectEnumData for NodePersonality.ShaderType;
}

uint64_t (*OrderedSet._table.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  swift_retain();
  return OrderedSet._table.modify;
}

uint64_t OrderedSet._table.modify(uint64_t *a1, char a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)a1[1];
  if ((a2 & 1) != 0)
  {
    swift_retain();
    swift_release();
    *v3 = v2;
    return swift_release();
  }
  else
  {
    result = swift_release();
    *v3 = v2;
  }
  return result;
}

uint64_t key path setter for OrderedSet.elements : <A>OrderedSet<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  v4 = type metadata accessor for OrderedSet(0, *(_QWORD *)(a4 + a3 - 16), *(_QWORD *)(a4 + a3 - 8), a4);
  v5 = swift_bridgeObjectRetain();
  return OrderedSet.elements.setter(v5, v4);
}

uint64_t OrderedSet.elements.setter(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v10;
  uint64_t v11;

  swift_release();
  swift_release();
  v11 = a1;
  v5 = *(_QWORD *)(a2 + 16);
  v6 = type metadata accessor for Array();
  v7 = *(_QWORD *)(a2 + 24);
  v8 = (uint64_t (*)(char *, uint64_t, uint64_t))MEMORY[0x24954C264](MEMORY[0x24BEE12D8], v6);
  result = OrderedSet.init<A>(_:)((uint64_t)&v11, v5, v6, v7, v8);
  *v2 = result;
  v2[1] = v10;
  return result;
}

void (*OrderedSet.elements.modify(_QWORD *a1, uint64_t a2))(uint64_t **a1)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = malloc(0x28uLL);
  *a1 = v5;
  v5[2] = a2;
  v5[3] = v2;
  v5[1] = *(_QWORD *)(v2 + 8);
  v5[4] = *(_QWORD *)(a2 + 16);
  v6 = type metadata accessor for ContiguousArray();
  swift_retain();
  MEMORY[0x24954C264](MEMORY[0x24BEE2A48], v6);
  *v5 = Array.init<A>(_:)();
  static Array._allocateUninitialized(_:)();
  v7 = ContiguousArray.init(arrayLiteral:)();
  swift_release();
  *(_QWORD *)(v2 + 8) = v7;
  return OrderedSet.elements.modify;
}

void OrderedSet.elements.modify(uint64_t **a1)
{
  uint64_t *v1;

  v1 = *a1;
  $defer #1 <A>() in OrderedSet.elements.modify((uint64_t *)(*a1)[3], v1, v1[4], *(_QWORD *)(v1[2] + 24));
  swift_bridgeObjectRelease();
  free(v1);
}

uint64_t $defer #1 <A>() in OrderedSet.elements.modify(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v11;

  v11 = *a2;
  v7 = type metadata accessor for Array();
  swift_bridgeObjectRetain();
  v8 = (uint64_t (*)(char *, uint64_t, uint64_t))MEMORY[0x24954C264](MEMORY[0x24BEE12D8], v7);
  *a1 = OrderedSet.init<A>(_:)((uint64_t)&v11, a3, v7, a4, v8);
  a1[1] = v9;
  swift_release();
  return swift_release();
}

uint64_t OrderedSet._capacity.getter(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  double v4;

  if (!a1)
    return 15;
  result = swift_beginAccess();
  v3 = *(_QWORD *)(a1 + 16) & 0x3FLL;
  if (v3 < 5)
    return 15;
  v4 = (double)(1 << v3) * 0.75;
  if ((~*(_QWORD *)&v4 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 <= -9.22337204e18)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v4 < 9.22337204e18)
    return (uint64_t)v4;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t OrderedSet._bias.getter(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    swift_beginAccess();
    return *(uint64_t *)(v1 + 24) >> 6;
  }
  return result;
}

uint64_t closure #1 in OrderedSet._regenerateExistingHashTable()(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  _HashTable.UnsafeHandle.clear()();
  v12 = *(_QWORD *)(a3 + 8);
  v9 = type metadata accessor for ContiguousArray();
  v10 = MEMORY[0x24954C264](MEMORY[0x24BEE2A58], v9);
  return _HashTable.UnsafeHandle.fill<A>(uncheckedUniqueElements:)((uint64_t)&v12, a1, a2, v9, v10, a5);
}

Swift::Bool __swiftcall OrderedSet._isUnique()()
{
  return swift_isUniquelyReferenced_native();
}

uint64_t closure #1 in OrderedSet._find_inlined(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  _QWORD v17[2];

  if (a3)
  {
    v9 = (_QWORD *)(a3 + 16);
    v10 = a3 + 32;
    v17[0] = a1;
    v17[1] = a2;
    v11 = type metadata accessor for UnsafeBufferPointer();
    swift_retain();
    v12 = MEMORY[0x24954C264](MEMORY[0x24BEE09E0], v11);
    *(_QWORD *)a6 = _HashTable.UnsafeHandle._find<A>(_:in:)(a4, (uint64_t)v17, v9, v10, v11, v12, a5);
    *(_BYTE *)(a6 + 8) = v13 & 1;
    *(_QWORD *)(a6 + 16) = v14;
    return swift_release();
  }
  else
  {
    v16 = type metadata accessor for UnsafeBufferPointer();
    MEMORY[0x24954C264](MEMORY[0x24BEE09E8], v16);
    result = Collection<>.firstIndex(of:)();
    *(_QWORD *)(a6 + 16) = 0;
  }
  return result;
}

void closure #1 in OrderedSet._bucket(for:)(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t *a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t *v32;

  v10 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  ContiguousArray.subscript.getter();
  v13 = dispatch thunk of Hashable._rawHashValue(seed:)();
  v14 = 1 << *a1;
  v15 = __OFSUB__(v14, 1);
  v16 = v14 - 1;
  if (v15)
  {
    __break(1u);
  }
  else
  {
    v32 = a5;
    v17 = v16 & v13;
    v18 = _HashTable.UnsafeHandle._startIterator(bucket:)(v16 & v13, a1, a2);
    v25 = a1;
    v26 = a2;
    v27 = v17;
    v28 = v18;
    v29 = v19;
    v30 = v20;
    v31 = 0;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, a4);
    if (v18)
    {
      while (1)
      {
        v21 = -1 << *v25;
        v22 = (v21 ^ ~v18) + ((uint64_t)v25[1] >> 6);
        v23 = v22 >= ~v21 ? ~v21 : 0;
        if (v22 - v23 == a3)
          break;
        _HashTable.BucketIterator.advance()();
        v18 = v28;
        if (!v28)
          goto LABEL_8;
      }
    }
    else
    {
LABEL_8:
      __break(1u);
    }
    *v32 = v27;
  }
}

void closure #1 in OrderedSet._removeExistingMember(at:in:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[6];
  _QWORD v15[2];
  uint64_t v16;

  v14[2] = a6;
  v14[3] = a7;
  v14[4] = a4;
  _HashTable.UnsafeHandle.delete(bucket:hashValueGenerator:)(a3, (uint64_t (*)(unint64_t, uint64_t))partial apply for closure #1 in closure #1 in OrderedSet._removeExistingMember(at:in:), (uint64_t)v14, a1, a2);
  v16 = *(_QWORD *)(a4 + 8);
  if (__OFADD__(a5, 1))
  {
    __break(1u);
  }
  else if (a5 + 1 >= a5)
  {
    v15[0] = a5;
    v15[1] = a5 + 1;
    v12 = type metadata accessor for ContiguousArray();
    v13 = MEMORY[0x24954C264](MEMORY[0x24BEE2A58], v12);
    _HashTable.UnsafeHandle.adjustContents<A>(preparingForRemovalOf:in:)((uint64_t)v15, (uint64_t)&v16, a1, a2, v12, v13, a7);
    return;
  }
  __break(1u);
}

uint64_t _s11ShaderGraph10OrderedSetV13_find_inlinedySiSg5index_AA10_HashTableV6BucketV6buckettxFAeF_AjKtSRyxGXEfU_TA_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return partial apply for closure #1 in OrderedSet._find_inlined(_:)(a1, a2, a3);
}

uint64_t type metadata accessor for OrderedSet(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for OrderedSet);
}

uint64_t sub_245FB3AAC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_245FB3AB8(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_retain();
  result = swift_release();
  *a2 = v3;
  return result;
}

uint64_t sub_245FB3AF8()
{
  return 16;
}

__n128 sub_245FB3B04(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_245FB3B10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = OrderedSet.elements.getter();
  *a1 = result;
  return result;
}

uint64_t sub_245FB3B44()
{
  return 16;
}

__n128 sub_245FB3B50(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t partial apply for closure #1 in closure #1 in OrderedSet._removeExistingMember(at:in:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return closure #1 in closure #1 in OrderedSet.removeSubrange(_:)(a1, a2, *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 16));
}

uint64_t OrderedSet.append<A>(contentsOf:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  uint64_t AssociatedTypeWitness;
  uint64_t v16;
  char *v17;
  unsigned int (*v18)(char *, uint64_t, uint64_t);
  void (*v19)(char *, char *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v23 = a2;
  v21 = a1;
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Optional();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v21 - v10;
  v12 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v22 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v17 = (char *)&v21 - v16;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v21, a3);
  dispatch thunk of Sequence.makeIterator()();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of IteratorProtocol.next()();
  v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  if (v18(v11, 1, v4) != 1)
  {
    v19 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    do
    {
      v19(v7, v11, v4);
      OrderedSet._append(_:)((uint64_t)v7);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      dispatch thunk of IteratorProtocol.next()();
    }
    while (v18(v11, 1, v4) != 1);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v17, AssociatedTypeWitness);
}

void OrderedSet._appendNew(_:in:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = v2;
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *))(v6 + 16))((char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  type metadata accessor for ContiguousArray();
  ContiguousArray.append(_:)();
  swift_retain();
  v7 = ContiguousArray.count.getter();
  swift_release();
  v8 = *v2;
  if (OrderedSet._capacity.getter(v8) >= v7)
  {
    if (v8)
    {
      OrderedSet._ensureUnique()();
      v9 = *v3;
      if (*v3)
      {
        swift_retain();
        closure #1 in OrderedSet._appendNew(_:in:)((_QWORD *)(v9 + 16), v9 + 32, a2);
        swift_release();
      }
      else
      {
        __break(1u);
      }
    }
  }
  else
  {
    OrderedSet._regenerateHashTable()();
  }
}

uint64_t OrderedSet.insert(_:at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  char v8;

  OrderedSet._find(_:)();
  v8 = v7;
  if ((v7 & 1) != 0)
    OrderedSet._insertNew(_:at:in:)(a1, a2, v6, a3);
  return v8 & 1;
}

void OrderedSet._insertNew(_:at:in:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t *v5;
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
  uint64_t v17;
  uint64_t v18;

  v5 = v4;
  v16 = a3;
  v17 = a1;
  v18 = a2;
  v7 = *(_QWORD *)(a4 + 16);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  v11 = ContiguousArray.count.getter();
  swift_release();
  v12 = *v4;
  v13 = *(_QWORD *)(a4 + 24);
  if (v11 >= OrderedSet._capacity.getter(v12))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v17, v7);
    type metadata accessor for ContiguousArray();
    ContiguousArray.insert(_:at:)();
    OrderedSet._regenerateHashTable()();
  }
  else
  {
    v14 = v18;
    if (!v12)
    {
LABEL_5:
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v17, v7);
      type metadata accessor for ContiguousArray();
      ContiguousArray.insert(_:at:)();
      return;
    }
    OrderedSet._ensureUnique()();
    v15 = *v5;
    if (*v5)
    {
      swift_retain();
      closure #1 in OrderedSet._insertNew(_:at:in:)((_QWORD *)(v15 + 16), v15 + 32, v16, v14, (uint64_t)v5, v7, v13);
      swift_release();
      goto LABEL_5;
    }
    __break(1u);
  }
}

void OrderedSet._appendNew(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = v2;
  v5 = *(_QWORD *)(a2 + 16);
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  type metadata accessor for ContiguousArray();
  ContiguousArray.append(_:)();
  swift_retain();
  v8 = ContiguousArray.count.getter();
  swift_release();
  v9 = *v2;
  if (OrderedSet._capacity.getter(v9) >= v8)
  {
    if (v9)
    {
      OrderedSet._ensureUnique()();
      v10 = *v3;
      if (*v3)
      {
        swift_retain();
        closure #1 in OrderedSet._appendNew(_:)((_QWORD *)(v10 + 16), v10 + 32);
        swift_release();
      }
      else
      {
        __break(1u);
      }
    }
  }
  else
  {
    OrderedSet._regenerateHashTable()();
  }
}

uint64_t OrderedSet._append(_:)(uint64_t a1)
{
  uint64_t v2;
  char v3;
  char v4;

  OrderedSet._find(_:)();
  v4 = v3;
  if ((v3 & 1) != 0)
    OrderedSet._appendNew(_:in:)(a1, v2);
  return v4 & 1;
}

uint64_t closure #1 in OrderedSet._appendNew(_:)(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;

  result = dispatch thunk of Hashable._rawHashValue(seed:)();
  v5 = 1 << *a1;
  v6 = __OFSUB__(v5, 1);
  v7 = v5 - 1;
  if (v6)
  {
    __break(1u);
  }
  else
  {
    if (_HashTable.UnsafeHandle._startIterator(bucket:)(v7 & result, a1, a2))
    {
      while (1)
        _HashTable.BucketIterator.advance()();
    }
    swift_retain();
    v8 = ContiguousArray.count.getter();
    swift_release();
    result = v8 - 1;
    if (!__OFSUB__(v8, 1))
      return _HashTable.BucketIterator.currentValue.setter(result, 0);
  }
  __break(1u);
  return result;
}

unint64_t closure #1 in OrderedSet._appendNew(_:in:)(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t result;
  uint64_t v8;

  swift_retain();
  v6 = ContiguousArray.count.getter();
  result = swift_release();
  if (__OFSUB__(v6, 1))
  {
    __break(1u);
  }
  else
  {
    v8 = v6 - 1 - ((uint64_t)a1[1] >> 6);
    return _HashTable.UnsafeHandle.subscript.setter((-1 << *a1) ^ ~(((v8 >> 63) & ~(-1 << *a1)) + v8), a3, a1, a2);
  }
  return result;
}

unint64_t closure #1 in OrderedSet._insertNew(_:at:in:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v15 = *(_QWORD *)(a5 + 8);
  v12 = type metadata accessor for ContiguousArray();
  v13 = MEMORY[0x24954C264](MEMORY[0x24BEE2A58], v12);
  _HashTable.UnsafeHandle.adjustContents<A>(preparingForInsertionOfElementAtOffset:in:)(a4, (uint64_t)&v15, a1, a2, v12, v13, a7);
  return _HashTable.UnsafeHandle.subscript.setter((-1 << *a1) ^ ~((((a4 - ((uint64_t)a1[1] >> 6)) >> 63) & ~(-1 << *a1)) + a4 - ((uint64_t)a1[1] >> 6)), a3, a1, a2);
}

uint64_t OrderedSet.update(_:at:)(uint64_t a1, Swift::Int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t *v10;
  char v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (uint64_t *)(v3 + 8);
  ContiguousArray.subscript.getter();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  v11 = dispatch thunk of static Equatable.== infix(_:_:)();
  result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if ((v11 & 1) != 0)
  {
    v13 = type metadata accessor for ContiguousArray();
    ContiguousArray._makeMutableAndUnique()();
    v14 = *v10;
    ContiguousArray._checkSubscript_mutating(_:)(a2);
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v7 + 24))(v14+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * a2, a1, v6);
    return destructiveProjectEnumData for NodePersonality.ShaderType(v13);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t OrderedSet.updateOrAppend(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  Swift::Int v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  Swift::Int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if ((OrderedSet._append(_:)(a1) & 1) != 0)
  {
    v8 = *(_QWORD *)(a2 + 16);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56);
    v10 = a3;
    v11 = 1;
  }
  else
  {
    v12 = v7;
    v13 = *(_QWORD *)(a2 + 16);
    ContiguousArray.subscript.getter();
    v14 = type metadata accessor for ContiguousArray();
    ContiguousArray._makeMutableAndUnique()();
    v15 = *(_QWORD *)(v3 + 8);
    ContiguousArray._checkSubscript_mutating(_:)(v12);
    v16 = *(_QWORD *)(v13 - 8);
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v16 + 24))(v15+ ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80))+ *(_QWORD *)(v16 + 72) * v12, a1, v13);
    destructiveProjectEnumData for NodePersonality.ShaderType(v14);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56);
    v10 = a3;
    v11 = 0;
    v8 = v13;
  }
  return v9(v10, v11, 1, v8);
}

uint64_t OrderedSet.updateOrInsert(_:at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t *v8;
  uint64_t v9;
  Swift::Int v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v8 = (uint64_t *)(v4 + 8);
  v9 = *(_QWORD *)(a4 + 16);
  swift_retain();
  swift_retain();
  v19 = a2;
  v10 = OrderedSet._find(_:)();
  LOBYTE(a2) = v11;
  v13 = v12;
  swift_release();
  swift_release();
  if ((a2 & 1) != 0)
  {
    OrderedSet._insertNew(_:at:in:)(v19, a3, v13, a4);
    v16 = *(_QWORD *)(v9 - 8);
    v17 = 1;
  }
  else
  {
    ContiguousArray.subscript.getter();
    v14 = type metadata accessor for ContiguousArray();
    ContiguousArray._makeMutableAndUnique()();
    v15 = *v8;
    ContiguousArray._checkSubscript_mutating(_:)(v10);
    v16 = *(_QWORD *)(v9 - 8);
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v16 + 24))(v15+ ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80))+ *(_QWORD *)(v16 + 72) * v10, v19, v9);
    destructiveProjectEnumData for NodePersonality.ShaderType(v14);
    v17 = 0;
    a3 = v10;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56))(a1, v17, 1, v9);
  return a3;
}

uint64_t _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, char *);
  uint64_t v28;

  v25 = a5;
  v26 = a2;
  v28 = a4;
  v27 = a1;
  v24 = a3;
  v9 = *(_QWORD *)(a3 - 8);
  v10 = MEMORY[0x24BDAC7A8](a1);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(v13 + 16);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v10);
  v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v21 + 16))(v20, v6);
  v22 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v20, 1, v14) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v20, v14);
    v27(v18, v12);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    if (v7)
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v25, v12, v24);
    v22 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(a6, v22, 1);
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD v7[4];
  uint64_t v8;
  unint64_t v9;

  v7[2] = a2;
  type metadata accessor for Optional();
  _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in DefaultStringInterpolation.appendInterpolation<A>(_:), (uint64_t)v7, MEMORY[0x24BEE4078], MEMORY[0x24BEE0D00], v2, (uint64_t)&v8);
  if (v9)
    v3 = v8;
  else
    v3 = 0x3E6C696E3CLL;
  if (v9)
    v4 = v9;
  else
    v4 = 0xE500000000000000;
  v5 = v4;
  String.append(_:)(*(Swift::String *)&v3);
  return swift_bridgeObjectRelease();
}

uint64_t closure #1 in DefaultStringInterpolation.appendInterpolation<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *))(v4 + 16))((char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  result = String.init<A>(describing:)();
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t partial apply for closure #1 in DefaultStringInterpolation.appendInterpolation<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return closure #1 in DefaultStringInterpolation.appendInterpolation<A>(_:)(a1, a2);
}

uint64_t String.camelCaseToCapitalized.getter(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[8];
  uint64_t v21;
  uint64_t v22;

  v4 = type metadata accessor for CharacterSet();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = a1;
  v22 = a2;
  v20[6] = 0x295D5A2D415B28;
  v20[7] = 0xE700000000000000;
  v20[4] = 3220512;
  v20[5] = 0xE300000000000000;
  v20[2] = a1;
  v20[3] = a2;
  v20[0] = a1;
  v20[1] = a2;
  v11 = type metadata accessor for Locale();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  lazy protocol witness table accessor for type String and conformance String();
  StringProtocol.range<A>(of:options:range:locale:)();
  outlined destroy of Locale?((uint64_t)v10);
  v12 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  v14 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v21 = v12;
  v22 = v14;
  static CharacterSet.whitespacesAndNewlines.getter();
  v15 = StringProtocol.trimmingCharacters(in:)();
  v17 = v16;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_bridgeObjectRelease();
  v21 = v15;
  v22 = v17;
  v18 = StringProtocol.capitalized.getter();
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t outlined destroy of Locale?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t UserGraphCompiler.CompileContext.setSource(_:for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  __int128 v8;

  v8 = *(_OWORD *)(a1 + 16);
  swift_retain();
  outlined retain of String((uint64_t)&v8);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *(_QWORD *)(v2 + 192);
  *(_QWORD *)(v2 + 192) = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a2, a1, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v2 + 192) = v7;
  swift_release();
  swift_bridgeObjectRelease();
  return outlined release of String((uint64_t)&v8);
}

{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  __int128 v8;

  v8 = *(_OWORD *)(a1 + 16);
  swift_retain();
  outlined retain of String((uint64_t)&v8);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *(_QWORD *)(v2 + 184);
  *(_QWORD *)(v2 + 184) = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a2, a1, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v2 + 184) = v7;
  swift_release();
  swift_bridgeObjectRelease();
  return outlined release of String((uint64_t)&v8);
}

uint64_t UserGraphCompiler.CompileContext.setOutput(_:for:)(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  char isUniquelyReferenced_nonNull_native;
  Swift::String v22;
  Swift::String v23;
  Swift::String v24;
  __int128 v25;
  _OWORD *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  char v39;
  _OWORD v40[12];
  __int128 v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  _QWORD v45[5];
  char v46;
  uint64_t v47;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = *(_OWORD *)(a2 + 3);
  v7 = *((_BYTE *)a2 + 40);
  v44 = v5;
  if (*(_QWORD *)(v5 + 16) == 1)
  {
    v8 = *(_QWORD *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 40);
    v10 = *(_QWORD *)(v5 + 48);
    v11 = *(_QWORD *)(v5 + 56);
    v12 = *(_QWORD *)(v5 + 64);
    v13 = *(_BYTE *)(v5 + 72);
    v14 = *(_QWORD *)(v5 + 80);
    v45[0] = v8;
    v45[1] = v9;
    v45[2] = v10;
    v45[3] = v11;
    v45[4] = v12;
    v46 = v13;
    v47 = v14;
    v15 = a1[3];
    v16 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v15);
    v17 = *(uint64_t (**)(uint64_t, uint64_t))(v16 + 24);
    swift_retain();
    swift_bridgeObjectRetain();
    v18 = v17(v15, v16);
    swift_retain();
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)&v40[0] = *(_QWORD *)(v2 + 192);
    *(_QWORD *)(v2 + 192) = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v18, (uint64_t)v45, isUniquelyReferenced_nonNull_native);
    *(_QWORD *)(v2 + 192) = *(_QWORD *)&v40[0];
    swift_bridgeObjectRelease_n();
    swift_release_n();
    return swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)&v36 = v3;
    *((_QWORD *)&v36 + 1) = v4;
    v37 = v5;
    v38 = v6;
    v39 = v7 & 1;
    _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi30_((uint64_t)&v36);
    *(_QWORD *)&v40[0] = 0;
    *((_QWORD *)&v40[0] + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(42);
    swift_bridgeObjectRelease();
    *(_QWORD *)&v40[0] = 0xD000000000000027;
    *((_QWORD *)&v40[0] + 1) = 0x8000000245FCE7F0;
    v22._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v22);
    swift_bridgeObjectRelease();
    v23._countAndFlagsBits = 1701080942;
    v23._object = (void *)0xE400000000000000;
    String.append(_:)(v23);
    swift_bridgeObjectRelease();
    v24._countAndFlagsBits = 41;
    v24._object = (void *)0xE100000000000000;
    String.append(_:)(v24);
    v25 = v40[0];
    outlined init with take of UserGraphError.ErrorType(&v36, (uint64_t)v40);
    v41 = v25;
    lazy protocol witness table accessor for type UserGraphError and conformance UserGraphError();
    swift_allocError();
    *v26 = v40[0];
    v27 = v40[4];
    v29 = v40[1];
    v28 = v40[2];
    v26[3] = v40[3];
    v26[4] = v27;
    v26[1] = v29;
    v26[2] = v28;
    v30 = v40[8];
    v32 = v40[5];
    v31 = v40[6];
    v26[7] = v40[7];
    v26[8] = v30;
    v26[5] = v32;
    v26[6] = v31;
    v33 = v41;
    v35 = v40[9];
    v34 = v40[10];
    v26[11] = v40[11];
    v26[12] = v33;
    v26[9] = v35;
    v26[10] = v34;
    outlined init with take of NodePersonality(a2, &v43);
    v42 = a2[1];
    outlined retain of NodePersonality(&v43);
    outlined retain of [Input]((uint64_t)&v42);
    outlined retain of [Input]((uint64_t)&v44);
    return swift_willThrow();
  }
}

Swift::Void __swiftcall UserGraphCompiler.CompileContext.setSource(_:for:)(ShaderGraph::ShaderGraphNode::ID _, ShaderGraph::FunctionNodeID a2)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v6 = *(_QWORD *)(v2 + 176);
  *(_QWORD *)(v2 + 176) = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a2.value, _.value, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v2 + 176) = v6;
  swift_bridgeObjectRelease();
}

double UserGraphCompiler.CompileContext.compiledNode(for:in:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  unint64_t v8;
  char v9;
  uint64_t v10;
  double result;
  __int128 v12;

  v5 = *(_QWORD *)(v3 + 184);
  if (*(_QWORD *)(v5 + 16))
  {
    v12 = *(_OWORD *)(a1 + 16);
    swift_retain();
    outlined retain of String((uint64_t)&v12);
    v8 = specialized __RawDictionaryStorage.find<A>(_:)(a1);
    if ((v9 & 1) != 0)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v8);
      swift_release();
      outlined release of String((uint64_t)&v12);
      (*(void (**)(uint64_t))(*(_QWORD *)a2 + 272))(v10);
      return result;
    }
    swift_release();
    outlined release of String((uint64_t)&v12);
  }
  *(_QWORD *)(a3 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  return result;
}

{
  uint64_t v3;
  uint64_t v5;
  unint64_t v8;
  char v9;
  uint64_t v10;
  double result;
  __int128 v12;

  v5 = *(_QWORD *)(v3 + 192);
  if (*(_QWORD *)(v5 + 16))
  {
    v12 = *(_OWORD *)(a1 + 16);
    swift_retain();
    outlined retain of String((uint64_t)&v12);
    v8 = specialized __RawDictionaryStorage.find<A>(_:)(a1);
    if ((v9 & 1) != 0)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v8);
      swift_release();
      outlined release of String((uint64_t)&v12);
      (*(void (**)(uint64_t))(*(_QWORD *)a2 + 272))(v10);
      return result;
    }
    swift_release();
    outlined release of String((uint64_t)&v12);
  }
  *(_QWORD *)(a3 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  return result;
}

uint64_t UserGraphCompiler.__allocating_init()()
{
  uint64_t v0;
  _BYTE v2[200];

  v0 = swift_allocObject();
  _s11ShaderGraph04UserB8CompilerC14CompileContextVSgWOi0_((uint64_t)v2);
  outlined init with take of MetalFunctionNode?((uint64_t)v2, v0 + 16, (uint64_t *)&demangling cache variable for type metadata for UserGraphCompiler.CompileContext?);
  return v0;
}

uint64_t UserGraphCompiler.CompileContext.compiledNodeID(for:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v4;
  char v5;
  uint64_t v6;
  __int128 v8;

  v2 = *(_QWORD *)(v1 + 192);
  if (!*(_QWORD *)(v2 + 16))
    return 0;
  v8 = *(_OWORD *)(a1 + 16);
  swift_retain();
  outlined retain of String((uint64_t)&v8);
  v4 = specialized __RawDictionaryStorage.find<A>(_:)(a1);
  if ((v5 & 1) != 0)
    v6 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v4);
  else
    v6 = 0;
  swift_release();
  outlined release of String((uint64_t)&v8);
  return v6;
}

{
  uint64_t v1;
  uint64_t v2;
  unint64_t v4;
  char v5;
  uint64_t v6;
  __int128 v8;

  v2 = *(_QWORD *)(v1 + 184);
  if (!*(_QWORD *)(v2 + 16))
    return 0;
  v8 = *(_OWORD *)(a1 + 16);
  swift_retain();
  outlined retain of String((uint64_t)&v8);
  v4 = specialized __RawDictionaryStorage.find<A>(_:)(a1);
  if ((v5 & 1) != 0)
    v6 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v4);
  else
    v6 = 0;
  swift_release();
  outlined release of String((uint64_t)&v8);
  return v6;
}

{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  char v4;

  v2 = *(_QWORD *)(v1 + 176);
  if (*(_QWORD *)(v2 + 16)
    && (v3 = specialized __RawDictionaryStorage.find<A>(_:)(*(_QWORD *)(a1 + 24)), (v4 & 1) != 0))
  {
    return *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v3);
  }
  else
  {
    return 0;
  }
}

uint64_t UserGraphCompiler.context.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  _QWORD v4[25];

  swift_beginAccess();
  outlined init with take of MetalFunctionNode?(v1 + 16, (uint64_t)v4, (uint64_t *)&demangling cache variable for type metadata for UserGraphCompiler.CompileContext?);
  outlined retain of UserGraphCompiler.CompileContext?(v4, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of UserGraphCompiler.CompileContext?);
  return outlined init with take of MetalFunctionNode?((uint64_t)v4, a1, (uint64_t *)&demangling cache variable for type metadata for UserGraphCompiler.CompileContext?);
}

_QWORD *UserGraphCompiler.context.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD v5[25];

  v3 = v1 + 16;
  swift_beginAccess();
  outlined init with take of MetalFunctionNode?(v3, (uint64_t)v5, (uint64_t *)&demangling cache variable for type metadata for UserGraphCompiler.CompileContext?);
  outlined init with take of MetalFunctionNode?(a1, v3, (uint64_t *)&demangling cache variable for type metadata for UserGraphCompiler.CompileContext?);
  return outlined retain of UserGraphCompiler.CompileContext?(v5, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of UserGraphCompiler.CompileContext?);
}

uint64_t (*UserGraphCompiler.context.modify())()
{
  swift_beginAccess();
  return XMLParserDelegate.StringNode.children.modify;
}

uint64_t UserGraphCompiler.init()()
{
  uint64_t v0;
  _BYTE v2[200];

  _s11ShaderGraph04UserB8CompilerC14CompileContextVSgWOi0_((uint64_t)v2);
  outlined init with take of MetalFunctionNode?((uint64_t)v2, v0 + 16, (uint64_t *)&demangling cache variable for type metadata for UserGraphCompiler.CompileContext?);
  return v0;
}

uint64_t UserGraphCompiler.compile(sourceProgram:into:)(__int128 *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  void (*v24)(_BYTE *);
  _OWORD v25[12];
  unint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  unint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _OWORD v49[2];
  __int128 v50;
  unint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _OWORD v61[2];
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  uint64_t v70;
  _BYTE v71[72];
  _BYTE v72[200];
  _OWORD v73[9];
  _OWORD v74[2];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _OWORD v84[3];

  v4 = v2;
  v6 = a1[9];
  v60 = a1[8];
  v61[0] = v6;
  *(_OWORD *)((char *)v61 + 9) = *(__int128 *)((char *)a1 + 153);
  v7 = a1[5];
  v56 = a1[4];
  v57 = v7;
  v8 = a1[7];
  v58 = a1[6];
  v59 = v8;
  v9 = a1[1];
  v52 = *a1;
  v53 = v9;
  v10 = a1[3];
  v54 = a1[2];
  v55 = v10;
  outlined retain of Graph((uint64_t)a1);
  Graph.flatten()();
  v83 = v60;
  v84[0] = v61[0];
  *(_OWORD *)((char *)v84 + 9) = *(_OWORD *)((char *)v61 + 9);
  v79 = v56;
  v80 = v57;
  v82 = v59;
  v81 = v58;
  v75 = v52;
  v76 = v53;
  v78 = v55;
  v77 = v54;
  v11 = MEMORY[0x24BEE4AF8];
  v12 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x24BEE4AF8]);
  outlined retain of Graph((uint64_t)&v75);
  v13 = specialized Dictionary.init(dictionaryLiteral:)(v11);
  v14 = specialized Dictionary.init(dictionaryLiteral:)(v11);
  v48 = v83;
  v49[0] = v84[0];
  *(_OWORD *)((char *)v49 + 9) = *(_OWORD *)((char *)v84 + 9);
  v44 = v79;
  v45 = v80;
  v46 = v81;
  v47 = v82;
  v40 = v75;
  v41 = v76;
  v42 = v77;
  v43 = v78;
  *(_QWORD *)&v50 = v12;
  *((_QWORD *)&v50 + 1) = v13;
  v51 = v14;
  v15 = specialized UserGraphCompiler.emitFunctionNodes(context:into:)((uint64_t)&v40, a2);
  if (v3)
  {
    v37 = v49[1];
    v38 = v50;
    v39 = v51;
    v33 = v46;
    v34 = v47;
    v35 = v48;
    v36 = v49[0];
    v29 = v42;
    v30 = v43;
    v31 = v44;
    v32 = v45;
    v27 = v40;
    v28 = v41;
    outlined release of UserGraphCompiler.CompileContext((uint64_t)&v27);
    outlined release of Graph((uint64_t)&v75);
  }
  else
  {
    v16 = v15;
    v73[8] = v48;
    v74[0] = v49[0];
    *(_OWORD *)((char *)v74 + 9) = *(_OWORD *)((char *)v49 + 9);
    v73[4] = v44;
    v73[5] = v45;
    v73[7] = v47;
    v73[6] = v46;
    v73[0] = v40;
    v73[1] = v41;
    v73[3] = v43;
    v73[2] = v42;
    v18 = *((_QWORD *)&v40 + 1);
    v17 = v40;
    v19 = v41;
    MEMORY[0x24BDAC7A8](v15);
    swift_retain();
    outlined retain of Graph((uint64_t)v73);
    swift_retain();
    swift_retain();
    swift_retain();
    v20 = specialized Sequence.compactMap<A>(_:)(v17, v18, v19, (void (*)(_QWORD *__return_ptr, uint64_t, __int128 *))partial apply for closure #1 in Graph.sinkNodes());
    swift_release();
    swift_release();
    swift_release();
    specialized Graph.DepthFirstEdgeIterator.init(_:initial:)((uint64_t *)v73, v20, &v62);
    outlined release of Graph((uint64_t)v73);
    swift_retain();
    specialized Sequence.forEach(_:)((uint64_t *)&v62, &v40, v16);
    swift_release();
    v69 = v62;
    v21 = v63;
    outlined init with take of MetalFunctionNode?((uint64_t)&v69, (uint64_t)v71, &demangling cache variable for type metadata for _HashTable.Storage?);
    outlined release of _HashTable.Storage?((uint64_t)v71);
    v70 = *((_QWORD *)&v69 + 1);
    outlined release of _HashTable.Storage?((uint64_t)&v70);
    v68 = v21;
    outlined release of _HashTable.Storage?((uint64_t)&v68);
    v67 = v64;
    outlined release of [Input]((uint64_t)&v67);
    v66 = v65;
    outlined release of [Input]((uint64_t)&v66);
    swift_release();
    swift_retain();
    v23 = specialized UserGraphCompiler.applyConstExpr(context:into:)((uint64_t)&v40, v16);
    swift_release_n();
    swift_retain();
    a2 = specialized UserGraphCompiler.removePassthroughNodes(context:into:)((uint64_t)&v40, v23);
    swift_release_n();
    v25[10] = v49[1];
    v25[11] = v50;
    v25[6] = v46;
    v25[7] = v47;
    v25[8] = v48;
    v25[9] = v49[0];
    v25[2] = v42;
    v25[3] = v43;
    v25[4] = v44;
    v25[5] = v45;
    v25[0] = v40;
    v25[1] = v41;
    v37 = v49[1];
    v38 = v50;
    v33 = v46;
    v34 = v47;
    v35 = v48;
    v36 = v49[0];
    v29 = v42;
    v30 = v43;
    v31 = v44;
    v32 = v45;
    v26 = v51;
    v39 = v51;
    v27 = v40;
    v28 = v41;
    destructiveProjectEnumData for NodePersonality.ShaderType(&v27);
    outlined init with take of MetalFunctionNode?((uint64_t)&v27, (uint64_t)v72, (uint64_t *)&demangling cache variable for type metadata for UserGraphCompiler.CompileContext?);
    v24 = *(void (**)(_BYTE *))(*(_QWORD *)v4 + 96);
    outlined retain of UserGraphCompiler.CompileContext((uint64_t)v25);
    v24(v72);
    outlined release of UserGraphCompiler.CompileContext((uint64_t)v25);
    outlined release of Graph((uint64_t)&v75);
  }
  return a2;
}

__n128 UserGraphCompiler.CompileContext.init(sourceProgram:)@<Q0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __n128 result;
  __n128 v8;
  __int128 v9;
  __int128 v10;
  __n128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[32];

  v16 = a1[8];
  *(_OWORD *)v17 = a1[9];
  *(_OWORD *)&v17[9] = *(_OWORD *)((char *)a1 + 153);
  v12 = a1[4];
  v13 = a1[5];
  v14 = a1[6];
  v15 = a1[7];
  v8 = *(__n128 *)a1;
  v9 = a1[1];
  v10 = a1[2];
  v11 = *((__n128 *)a1 + 3);
  v3 = MEMORY[0x24BEE4AF8];
  v4 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x24BEE4AF8]);
  v5 = specialized Dictionary.init(dictionaryLiteral:)(v3);
  v6 = specialized Dictionary.init(dictionaryLiteral:)(v3);
  *(_OWORD *)(a2 + 128) = v16;
  *(_OWORD *)(a2 + 144) = *(_OWORD *)v17;
  *(_OWORD *)(a2 + 160) = *(_OWORD *)&v17[16];
  *(_OWORD *)(a2 + 64) = v12;
  *(_OWORD *)(a2 + 80) = v13;
  *(_OWORD *)(a2 + 96) = v14;
  *(_OWORD *)(a2 + 112) = v15;
  *(__n128 *)a2 = v8;
  *(_OWORD *)(a2 + 16) = v9;
  result = v11;
  *(_OWORD *)(a2 + 32) = v10;
  *(__n128 *)(a2 + 48) = v11;
  *(_QWORD *)(a2 + 176) = v4;
  *(_QWORD *)(a2 + 184) = v5;
  *(_QWORD *)(a2 + 192) = v6;
  return result;
}

unint64_t closure #1 in UserGraphCompiler.emitFunctionNodes(context:into:)(__int128 *a1, uint64_t *a2, uint64_t a3)
{
  void *v3;
  __int128 v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  Swift::String v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  _OWORD v25[2];
  uint64_t v26;
  uint64_t v27;

  v6 = a1[1];
  v24 = *a1;
  v25[0] = v6;
  *(_OWORD *)((char *)v25 + 9) = *(__int128 *)((char *)a1 + 25);
  v7 = v24;
  v8 = *a2;
  outlined copy of NodePersonality(v24);
  swift_retain();
  v9 = NodePersonality.emitFunctionNodes(node:context:into:)((uint64_t)&v24, a3, v8, v24);
  if (v3)
  {
    swift_release();
    if (one-time initialization token for logger != -1)
      swift_once();
    v10 = type metadata accessor for Logger();
    __swift_project_value_buffer(v10, (uint64_t)logger);
    v26 = *((_QWORD *)&v24 + 1);
    v27 = *(_QWORD *)&v25[0];
    outlined copy of NodePersonality(v7);
    v11 = v3;
    outlined retain of [Input]((uint64_t)&v26);
    outlined retain of [Input]((uint64_t)&v27);
    outlined copy of NodePersonality(v7);
    v12 = v3;
    outlined retain of [Input]((uint64_t)&v26);
    outlined retain of [Input]((uint64_t)&v27);
    v13 = Logger.logObject.getter();
    v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = swift_slowAlloc();
      v22 = swift_slowAlloc();
      v23 = v22;
      *(_DWORD *)v15 = 136315650;
      v16 = v3;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Error);
      v17 = String.init<A>(describing:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v18, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      *(_WORD *)(v15 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000020, 0x8000000245FCE8B0, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v15 + 22) = 2080;
      v19._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v19);
      swift_bridgeObjectRelease();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(1701080942, 0xE400000000000000, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      outlined consume of NodePersonality(v7);
      outlined release of [Input]((uint64_t)&v26);
      outlined release of [Input]((uint64_t)&v27);
      outlined consume of NodePersonality(v7);
      outlined release of [Input]((uint64_t)&v26);
      outlined release of [Input]((uint64_t)&v27);
      _os_log_impl(&dword_245E46000, v13, v14, "Got error:\n    %s\nIn '%s'\n    Node: '%s'", (uint8_t *)v15, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24954C33C](v22, -1, -1);
      MEMORY[0x24954C33C](v15, -1, -1);
    }
    else
    {

      outlined consume of NodePersonality(v7);
      outlined release of [Input]((uint64_t)&v26);
      outlined release of [Input]((uint64_t)&v27);
      outlined consume of NodePersonality(v7);
      outlined release of [Input]((uint64_t)&v26);
      outlined release of [Input]((uint64_t)&v27);
    }

    swift_willThrow();
  }
  else
  {
    v20 = v9;
    swift_release();
    *a2 = v20;
    swift_release();
  }
  return outlined consume of NodePersonality(v7);
}

uint64_t closure #1 in UserGraphCompiler.emitEdges(context:into:)(__int128 *a1, __int128 *a2, uint64_t a3)
{
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _OWORD *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _OWORD *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  uint64_t v64;
  __int128 v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  uint64_t v86;
  _BYTE v87[40];
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;
  _OWORD v92[12];
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint64_t v97;
  _OWORD v98[12];
  uint64_t v99;
  __int128 v100;
  __int128 v101;

  v5 = a1[1];
  v94 = *a1;
  v95 = v5;
  v96 = a1[2];
  v6 = *((_QWORD *)a1 + 6);
  v97 = v6;
  v7 = *(_QWORD *)a1;
  v8 = *((_QWORD *)a1 + 1);
  v9 = *((_QWORD *)a1 + 2);
  v61 = *((_QWORD *)a1 + 4);
  v62 = *((_QWORD *)a1 + 3);
  v10 = *((unsigned __int8 *)a1 + 40);
  v11 = *(__int128 *)((char *)a1 + 56);
  v12 = *(__int128 *)((char *)a1 + 72);
  v13 = *(__int128 *)((char *)a1 + 88);
  v91 = *((_QWORD *)a1 + 13);
  v89 = v12;
  v90 = v13;
  v88 = v11;
  v58 = *((_QWORD *)a1 + 8);
  v59 = *((_QWORD *)a1 + 7);
  v56 = *((_QWORD *)a1 + 10);
  v57 = *((_QWORD *)a1 + 9);
  v60 = *((unsigned __int8 *)a1 + 96);
  v54 = *((_QWORD *)a1 + 13);
  v55 = *((_QWORD *)a1 + 11);
  v14 = *a2;
  v15 = a2[1];
  v16 = a2[3];
  v98[2] = a2[2];
  v98[3] = v16;
  v98[0] = v14;
  v98[1] = v15;
  v17 = a2[4];
  v18 = a2[5];
  v19 = a2[7];
  v98[6] = a2[6];
  v98[7] = v19;
  v98[4] = v17;
  v98[5] = v18;
  v20 = a2[8];
  v21 = a2[9];
  v22 = a2[10];
  v23 = a2[11];
  v99 = *((_QWORD *)a2 + 24);
  v98[10] = v22;
  v98[11] = v23;
  v98[8] = v20;
  v98[9] = v21;
  outlined retain of UserGraphCompiler.CompileContext((uint64_t)v98);
  UserGraphCompiler.CompileContext.compiledNode(for:in:)((uint64_t)&v94, a3, (uint64_t)&v84);
  outlined release of UserGraphCompiler.CompileContext((uint64_t)v98);
  if (v85)
  {
    outlined init with take of MetalFunctionNode(&v84, (uint64_t)v87);
    v24 = a2[11];
    v92[10] = a2[10];
    v92[11] = v24;
    v93 = *((_QWORD *)a2 + 24);
    v25 = a2[7];
    v92[6] = a2[6];
    v92[7] = v25;
    v26 = a2[9];
    v92[8] = a2[8];
    v92[9] = v26;
    v27 = a2[3];
    v92[2] = a2[2];
    v92[3] = v27;
    v28 = a2[5];
    v92[4] = a2[4];
    v92[5] = v28;
    v29 = a2[1];
    v92[0] = *a2;
    v92[1] = v29;
    outlined retain of UserGraphCompiler.CompileContext((uint64_t)v92);
    UserGraphCompiler.CompileContext.compiledNode(for:in:)((uint64_t)&v88, a3, (uint64_t)&v63);
    outlined release of UserGraphCompiler.CompileContext((uint64_t)v92);
    if (v64)
    {
      outlined init with take of MetalFunctionNode(&v63, (uint64_t)&v84);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<MetalFunctionNode>);
      v30 = swift_allocObject();
      *(_OWORD *)(v30 + 16) = xmmword_245FBECD0;
      outlined init with copy of MetalFunctionNode((uint64_t)v87, v30 + 32);
      v31 = v85;
      v32 = v86;
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v84, v85);
      MetalFunctionNode.setInputs(_:)(v30, v31, v32);
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalFunctionNode);
      swift_arrayDestroy();
      swift_deallocClassInstance();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v87);
      return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v84);
    }
    else
    {
      outlined destroy of (input: Input, fNode: MetalFunctionNode?)((uint64_t)&v63, (uint64_t *)&demangling cache variable for type metadata for MetalFunctionNode?);
      v101 = v89;
      *(_QWORD *)&v65 = v59;
      *((_QWORD *)&v65 + 1) = v58;
      v66 = v57;
      v67 = v56;
      v68 = v55;
      v69 = v60;
      v70 = v54;
      _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi23_((uint64_t)&v65);
      outlined init with take of UserGraphError.ErrorType(&v65, (uint64_t)&v71);
      lazy protocol witness table accessor for type UserGraphError and conformance UserGraphError();
      v83 = 0uLL;
      swift_allocError();
      *v44 = v71;
      v45 = v75;
      v47 = v72;
      v46 = v73;
      v44[3] = v74;
      v44[4] = v45;
      v44[1] = v47;
      v44[2] = v46;
      v48 = v79;
      v50 = v76;
      v49 = v77;
      v44[7] = v78;
      v44[8] = v48;
      v44[5] = v50;
      v44[6] = v49;
      v51 = v83;
      v53 = v80;
      v52 = v81;
      v44[11] = v82;
      v44[12] = v51;
      v44[9] = v53;
      v44[10] = v52;
      swift_retain();
      outlined retain of String((uint64_t)&v101);
      swift_willThrow();
      return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v87);
    }
  }
  else
  {
    outlined destroy of (input: Input, fNode: MetalFunctionNode?)((uint64_t)&v84, (uint64_t *)&demangling cache variable for type metadata for MetalFunctionNode?);
    v100 = v95;
    *(_QWORD *)&v65 = v7;
    *((_QWORD *)&v65 + 1) = v8;
    v66 = v9;
    v67 = v62;
    v68 = v61;
    v69 = v10;
    v70 = v6;
    _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi24_((uint64_t)&v65);
    outlined init with take of UserGraphError.ErrorType(&v65, (uint64_t)&v71);
    lazy protocol witness table accessor for type UserGraphError and conformance UserGraphError();
    v83 = 0uLL;
    swift_allocError();
    *v34 = v71;
    v35 = v75;
    v37 = v72;
    v36 = v73;
    v34[3] = v74;
    v34[4] = v35;
    v34[1] = v37;
    v34[2] = v36;
    v38 = v79;
    v40 = v76;
    v39 = v77;
    v34[7] = v78;
    v34[8] = v38;
    v34[5] = v40;
    v34[6] = v39;
    v41 = v83;
    v43 = v80;
    v42 = v81;
    v34[11] = v82;
    v34[12] = v41;
    v34[9] = v43;
    v34[10] = v42;
    swift_retain();
    outlined retain of String((uint64_t)&v100);
    return swift_willThrow();
  }
}

uint64_t applyConstExpr #1 (_:) in UserGraphCompiler.applyConstExpr(context:into:)(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  char v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  Swift::UInt v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37[12];
  _OWORD v38[12];
  __int128 v39;
  __int128 v40[2];
  uint64_t v41;
  _BYTE v42[40];
  _BYTE v43[40];
  _QWORD v44[3];
  uint64_t v45;
  uint64_t v46;

  v4 = v3;
  swift_beginAccess();
  v8 = *(_QWORD *)(a2 + 16);
  v9 = a1[3];
  v10 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v9);
  v11 = *(_QWORD *)(v10 + 8);
  v12 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 24);
  swift_bridgeObjectRetain();
  v13 = v12(v9, v11);
  v14 = specialized Set.contains(_:)(v13, v8);
  result = swift_bridgeObjectRelease();
  if ((v14 & 1) == 0)
  {
    outlined init with copy of MetalFunctionNode((uint64_t)a1, (uint64_t)v44);
    v17 = v45;
    v16 = v46;
    __swift_project_boxed_opaque_existential_1(v44, v45);
    v18 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v16 + 8) + 24))(v17);
    swift_beginAccess();
    specialized Set._Variant.insert(_:)((Swift::UInt *)v37, v18);
    swift_endAccess();
    v19 = v45;
    v20 = v46;
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v44, v45);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 24))(1, v19, v20);
    v22 = v45;
    v21 = v46;
    __swift_project_boxed_opaque_existential_1(v44, v45);
    v23 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v21 + 8) + 48))(v22);
    swift_retain();
    v24 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay11ShaderGraph14FunctionNodeIDVG_AF05MetalfG0_psAE_pTg504_s11d41Graph13createDotText12representing12inputg20IDs06outputhI0SSAA05i18A7ProgramC_SayAA08F28H2IDVGAJtKFAA0kmH0_pAIKXEfU_AF0idR0CTf1cn_nTf4ng_nTm(v23, a3);
    swift_bridgeObjectRelease();
    swift_release();
    if (!v4)
    {
      v25 = *(_QWORD *)(v24 + 16);
      if (v25)
      {
        v26 = v24 + 32;
        swift_bridgeObjectRetain();
        while (1)
        {
          outlined init with copy of MetalFunctionNode(v26, (uint64_t)v42);
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalFunctionNode);
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalConstExprFunctionNode);
          if (!swift_dynamicCast())
            break;
          outlined init with take of MetalFunctionNode(v40, (uint64_t)v43);
          applyConstExpr #1 (_:) in UserGraphCompiler.applyConstExpr(context:into:)(v43, a2, a3);
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v43);
          v26 += 40;
          if (!--v25)
            goto LABEL_10;
        }
        memset(v40, 0, sizeof(v40));
        v41 = 0;
        outlined destroy of (input: Input, fNode: MetalFunctionNode?)((uint64_t)v40, &demangling cache variable for type metadata for MetalConstExprFunctionNode?);
        _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi47_((uint64_t)v37);
        outlined init with take of UserGraphError.ErrorType(v37, (uint64_t)v38);
        *(_QWORD *)&v39 = 0xD00000000000005CLL;
        *((_QWORD *)&v39 + 1) = 0x8000000245FCE850;
        lazy protocol witness table accessor for type UserGraphError and conformance UserGraphError();
        swift_allocError();
        *v27 = v38[0];
        v28 = v38[4];
        v30 = v38[1];
        v29 = v38[2];
        v27[3] = v38[3];
        v27[4] = v28;
        v27[1] = v30;
        v27[2] = v29;
        v31 = v38[8];
        v33 = v38[5];
        v32 = v38[6];
        v27[7] = v38[7];
        v27[8] = v31;
        v27[5] = v33;
        v27[6] = v32;
        v34 = v39;
        v36 = v38[9];
        v35 = v38[10];
        v27[11] = v38[11];
        v27[12] = v34;
        v27[9] = v36;
        v27[10] = v35;
        swift_willThrow();
LABEL_10:
        swift_bridgeObjectRelease_n();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v44);
  }
  return result;
}

uint64_t closure #2 in applyConstExpr #1 (_:) in UserGraphCompiler.applyConstExpr(context:into:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16[12];
  _OWORD v17[12];
  __int128 v18;
  __int128 v19[2];
  uint64_t v20;
  _BYTE v21[40];
  _QWORD v22[5];

  outlined init with copy of MetalFunctionNode(a1, (uint64_t)v21);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalFunctionNode);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalConstExprFunctionNode);
  if ((swift_dynamicCast() & 1) != 0)
  {
    outlined init with take of MetalFunctionNode(v19, (uint64_t)v22);
    applyConstExpr #1 (_:) in UserGraphCompiler.applyConstExpr(context:into:)(v22, a2, a3);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v22);
  }
  else
  {
    memset(v19, 0, sizeof(v19));
    v20 = 0;
    outlined destroy of (input: Input, fNode: MetalFunctionNode?)((uint64_t)v19, &demangling cache variable for type metadata for MetalConstExprFunctionNode?);
    _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi47_((uint64_t)v16);
    outlined init with take of UserGraphError.ErrorType(v16, (uint64_t)v17);
    *(_QWORD *)&v18 = 0xD00000000000005CLL;
    *((_QWORD *)&v18 + 1) = 0x8000000245FCE850;
    lazy protocol witness table accessor for type UserGraphError and conformance UserGraphError();
    swift_allocError();
    *v6 = v17[0];
    v7 = v17[4];
    v9 = v17[1];
    v8 = v17[2];
    v6[3] = v17[3];
    v6[4] = v7;
    v6[1] = v9;
    v6[2] = v8;
    v10 = v17[8];
    v12 = v17[5];
    v11 = v17[6];
    v6[7] = v17[7];
    v6[8] = v10;
    v6[5] = v12;
    v6[6] = v11;
    v13 = v18;
    v15 = v17[9];
    v14 = v17[10];
    v6[11] = v17[11];
    v6[12] = v13;
    v6[9] = v15;
    v6[10] = v14;
    return swift_willThrow();
  }
}

_QWORD *closure #4 in UserGraphCompiler.removePassthroughNodes(context:into:)(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  _QWORD *result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Swift::UInt v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
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
  void (*v27)(__int128 *, _QWORD);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(__int128 *, _QWORD);
  __int128 v35[2];
  _QWORD v36[3];
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[3];
  uint64_t v40;
  uint64_t v41;

  v7 = a1[3];
  v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 48))(v7, v8);
  if (!result[2])
  {
    __break(1u);
    goto LABEL_13;
  }
  v10 = result[4];
  swift_bridgeObjectRelease();
  result = (*(_QWORD *(**)(_QWORD *__return_ptr, uint64_t))(*(_QWORD *)a2 + 272))(v39, v10);
  if (v3)
    return result;
  v11 = a1[3];
  v12 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v11);
  v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 24))(v11, v12);
  if (*(_QWORD *)(a3 + 16))
  {
    v14 = specialized __RawDictionaryStorage.find<A>(_:)(v13);
    if ((v15 & 1) != 0)
    {
      outlined init with copy of MetalFunctionNode(*(_QWORD *)(a3 + 56) + 40 * v14, (uint64_t)v35);
      outlined init with take of MetalFunctionNode(v35, (uint64_t)v36);
      v16 = v37;
      v17 = v38;
      __swift_project_boxed_opaque_existential_1(v36, v37);
      v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 48))(v16, v17);
      v19 = a1[3];
      v20 = a1[4];
      __swift_project_boxed_opaque_existential_1(a1, v19);
      v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 24))(v19, v20);
      v22 = specialized Collection<>.firstIndex(of:)(v21, v18);
      v24 = v23;
      swift_bridgeObjectRelease();
      if ((v24 & 1) != 0)
      {
LABEL_9:
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v36);
        return (_QWORD *)__swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v39);
      }
      v25 = v37;
      v26 = v38;
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v36, v37);
      v27 = (void (*)(__int128 *, _QWORD))(*(uint64_t (**)(__int128 *, uint64_t, uint64_t))(v26 + 64))(v35, v25, v26);
      specialized Array.remove(at:)(v22);
      v27(v35, 0);
      v28 = v40;
      v29 = v41;
      __swift_project_boxed_opaque_existential_1(v39, v40);
      v30 = (*(uint64_t (**)(uint64_t, uint64_t))(v29 + 24))(v28, v29);
      v31 = v37;
      v32 = v38;
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v36, v37);
      result = (_QWORD *)(*(uint64_t (**)(__int128 *, uint64_t, uint64_t))(v32 + 64))(v35, v31, v32);
      if (*(_QWORD *)(*(_QWORD *)v33 + 16) >= v22)
      {
        if ((v22 & 0x8000000000000000) == 0)
        {
          v34 = (void (*)(__int128 *, _QWORD))result;
          specialized Array.replaceSubrange<A>(_:with:)(v22, v22, v30);
          v34(v35, 0);
          goto LABEL_9;
        }
LABEL_14:
        __break(1u);
        return result;
      }
LABEL_13:
      __break(1u);
      goto LABEL_14;
    }
  }
  return (_QWORD *)__swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v39);
}

uint64_t closure #5 in UserGraphCompiler.removePassthroughNodes(context:into:)(uint64_t a1)
{
  int v1;
  _BYTE v3[40];

  outlined init with copy of MetalFunctionNode(a1, (uint64_t)v3);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalFunctionNode);
  type metadata accessor for MetalPassthroughNode();
  v1 = swift_dynamicCast();
  if (v1)
    swift_release();
  return v1 ^ 1u;
}

uint64_t UserGraphCompiler.deinit()
{
  uint64_t v0;
  _QWORD v2[25];

  outlined init with take of MetalFunctionNode?(v0 + 16, (uint64_t)v2, (uint64_t *)&demangling cache variable for type metadata for UserGraphCompiler.CompileContext?);
  outlined retain of UserGraphCompiler.CompileContext?(v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of UserGraphCompiler.CompileContext?);
  return v0;
}

uint64_t UserGraphCompiler.__deallocating_deinit()
{
  uint64_t v0;
  _QWORD v2[25];

  outlined init with take of MetalFunctionNode?(v0 + 16, (uint64_t)v2, (uint64_t *)&demangling cache variable for type metadata for UserGraphCompiler.CompileContext?);
  outlined retain of UserGraphCompiler.CompileContext?(v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of UserGraphCompiler.CompileContext?);
  return swift_deallocClassInstance();
}

uint64_t UserGraphCompiler.CompileContext.sourceProgram.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of Graph(v1, a1);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;

  Hasher.init(_seed:)();
  String.hash(into:)();
  v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(Swift::UInt a1)
{
  Swift::Int v2;

  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  v2 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  void (*v2)(_BYTE *);
  Swift::UInt v3;
  Swift::Int v4;
  _BYTE v6[72];

  Hasher.init(_seed:)();
  Hasher._combine(_:)(*(_QWORD *)a1);
  v2 = *(void (**)(_BYTE *))(**(_QWORD **)(a1 + 8) + 120);
  swift_retain();
  v2(v6);
  swift_release();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  if (*(_BYTE *)(a1 + 40) == 1)
  {
    Hasher._combine(_:)(0);
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 32);
    Hasher._combine(_:)(1u);
    Hasher._combine(_:)(v3);
  }
  Hasher._combine(_:)(*(_QWORD *)(a1 + 48));
  v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)((uint64_t *)a1, v4);
}

{
  uint64_t v2;

  v2 = static Hasher._hash(seed:_:)();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

{
  void (*v2)(_BYTE *);
  Swift::Int v3;
  _BYTE v5[72];
  _BYTE v6[80];

  Hasher.init(_seed:)();
  outlined init with take of SGDataTypeStorage(a1, (uint64_t)v6);
  SGDataTypeStorage.hash(into:)();
  v2 = *(void (**)(_BYTE *))(**(_QWORD **)(a1 + 72) + 120);
  swift_retain();
  v2(v5);
  swift_release();
  v3 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v3);
}

{
  Swift::Int v2;
  _BYTE v4[72];

  Hasher.init(_seed:)();
  (*(void (**)(_BYTE *))(*(_QWORD *)a1 + 120))(v4);
  v2 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2, char a3)
{
  char v6;
  Swift::Int v7;

  v6 = a3 & 1;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a3 & 1);
  String.hash(into:)();
  v7 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v6, v7);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
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
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
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

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v14;
  _BYTE v15[80];

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = v2;
    v8 = ~v4;
    outlined init with take of SGDataTypeStorage(a1, (uint64_t)&v14);
    do
    {
      v9 = *(_QWORD *)(v6 + 48) + 80 * v5;
      outlined init with take of SGDataTypeStorage(v9, (uint64_t)v15);
      v10 = *(_QWORD *)(v9 + 72);
      outlined retain of SGDataTypeStorage((uint64_t)v15, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined copy of SGDataTypeStorage);
      swift_retain();
      specialized static SGDataTypeStorage.== infix(_:_:)((uint64_t)v15);
      if ((v11 & 1) != 0)
      {
        v12 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v10 + 128))(*(_QWORD *)(a1 + 72));
        outlined retain of SGDataTypeStorage((uint64_t)v15, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined consume of SGDataTypeStorage);
        swift_release();
        if ((v12 & 1) != 0)
          return v5;
      }
      else
      {
        outlined retain of SGDataTypeStorage((uint64_t)v15, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined consume of SGDataTypeStorage);
        swift_release();
      }
      v5 = (v5 + 1) & v8;
    }
    while (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  uint64_t v6;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  char v11;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v6 = v2;
    v8 = *(uint64_t (**)(uint64_t))(**(_QWORD **)(*(_QWORD *)(v2 + 48) + 8 * i) + 128);
    swift_retain();
    LOBYTE(v8) = v8(a1);
    swift_release();
    if ((v8 & 1) == 0)
    {
      v9 = ~v4;
      for (i = (i + 1) & v9; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v9)
      {
        v10 = *(uint64_t (**)(uint64_t))(**(_QWORD **)(*(_QWORD *)(v6 + 48) + 8 * i) + 128);
        swift_retain();
        v11 = v10(a1);
        swift_release();
        if ((v11 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  char v20;
  char v21;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v7 = ~v4;
    v8 = *a1;
    v24 = v2 + 64;
    v25 = ~v4;
    do
    {
      v9 = *(_QWORD *)(v2 + 48) + 56 * v5;
      if (*(_QWORD *)v9 == v8)
      {
        v10 = *(_QWORD *)(v9 + 16);
        v11 = *(_QWORD *)(v9 + 24);
        v12 = *(_QWORD *)(v9 + 32);
        v13 = *(_BYTE *)(v9 + 40);
        v14 = *(_QWORD *)(v9 + 48);
        v15 = a1[1];
        v16 = *(uint64_t (**)(uint64_t))(**(_QWORD **)(v9 + 8) + 128);
        swift_retain();
        swift_bridgeObjectRetain();
        if ((v16(v15) & 1) != 0)
        {
          v23 = v13;
          v17 = v12;
          v18 = v14;
          if (v10 == a1[2] && v11 == a1[3])
          {
            swift_bridgeObjectRelease();
            swift_release();
            v3 = v24;
            v7 = v25;
            v2 = v26;
            v8 = v27;
          }
          else
          {
            v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            swift_release();
            v3 = v24;
            v7 = v25;
            v2 = v26;
            v8 = v27;
            if ((v20 & 1) == 0)
              goto LABEL_4;
          }
          v21 = *((_BYTE *)a1 + 40);
          if ((v23 & 1) != 0)
          {
            if (!*((_BYTE *)a1 + 40))
              goto LABEL_4;
          }
          else
          {
            if (v17 != a1[4])
              v21 = 1;
            if ((v21 & 1) != 0)
              goto LABEL_4;
          }
          if (v18 == a1[6])
            return v5;
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_release();
          v3 = v24;
          v7 = v25;
          v2 = v26;
          v8 = v27;
        }
      }
LABEL_4:
      v5 = (v5 + 1) & v7;
    }
    while (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;

  v5 = v4 + 64;
  v6 = -1 << *(_BYTE *)(v4 + 32);
  v7 = a4 & ~v6;
  if (((*(_QWORD *)(v4 + 64 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
  {
    v11 = ~v6;
    v12 = *(_QWORD *)(v4 + 48);
    do
    {
      v13 = v12 + 24 * v7;
      if ((*(_BYTE *)(v13 + 16) & 1) != 0)
      {
        if ((a3 & 1) == 0)
          goto LABEL_3;
      }
      else if ((a3 & 1) != 0)
      {
        goto LABEL_3;
      }
      v14 = *(_QWORD *)v13 == a1 && *(_QWORD *)(v13 + 8) == a2;
      if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        return v7;
LABEL_3:
      v7 = (v7 + 1) & v11;
    }
    while (((*(_QWORD *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
  }
  return v7;
}

unint64_t specialized Sequence.forEach(_:)(uint64_t *a1, __int128 *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(__int128 *);
  __int128 v20;
  Swift::UInt v21;
  Swift::Int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t);
  char v35;
  char v36;
  uint64_t v38;
  unint64_t result;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  char v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  _QWORD *v68;
  _QWORD *v69;
  uint64_t v70;
  Swift::UInt v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  _QWORD *v80;
  Swift::UInt v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  __int128 v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD *v103;
  _QWORD v104[6];
  __int128 v105;
  uint64_t v106;
  __int128 v107;
  uint64_t v108;
  uint64_t v109;
  __int128 v110;
  uint64_t v111;
  char v112[8];
  __int128 v113;
  uint64_t v114;
  __int128 v115;
  uint64_t v116;
  char v117[8];
  uint64_t v118;
  _QWORD *v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  Swift::UInt v123;
  _OWORD v124[2];
  uint64_t v125;

  v4 = *a1;
  v3 = (_QWORD *)a1[1];
  v5 = a1[2];
  v6 = (_QWORD *)a1[3];
  v118 = a1[4];
  v119 = v6;
  v102 = v118;
  v103 = v6;
  swift_retain();
  swift_retain();
  swift_retain();
  outlined retain of [Input]((uint64_t)&v119);
  outlined retain of [Input]((uint64_t)&v118);
  v67 = v5;
  if (!v6[2])
  {
LABEL_73:
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  v68 = v3;
  v69 = v3 + 4;
  v65 = v4 + 32;
  v66 = (_QWORD *)(v4 + 16);
  v64 = v5 + 32;
  v60 = v3 + 7;
  v70 = v4;
  while (1)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    {
      v7 = v6[2];
      if (!v7)
        goto LABEL_72;
    }
    else
    {
      v6 = specialized _ArrayBuffer._consumeAndCreateNew()(v6);
      v7 = v6[2];
      if (!v7)
      {
LABEL_72:
        __break(1u);
        goto LABEL_73;
      }
    }
    v8 = v7 - 1;
    v9 = &v6[7 * v8];
    v10 = *((_OWORD *)v9 + 2);
    v11 = *((_OWORD *)v9 + 3);
    v12 = *((_OWORD *)v9 + 4);
    v123 = v9[10];
    v121 = v11;
    v122 = v12;
    v120 = v10;
    v13 = v9[4];
    v14 = v9[6];
    v77 = v9[7];
    v78 = v9[5];
    v15 = v9[8];
    v16 = *((_BYTE *)v9 + 72);
    v17 = v9[10];
    v6[2] = v8;
    v103 = v6;
    v75 = v14;
    v76 = v13;
    v74 = v15;
    v73 = v16;
    v72 = v17;
    if (*(_QWORD *)(v102 + 16))
    {
      v87 = v102;
      Hasher.init(_seed:)();
      v125 = v120;
      Hasher._combine(_:)(v120);
      v18 = *((_QWORD *)&v120 + 1);
      v19 = *(void (**)(__int128 *))(**((_QWORD **)&v120 + 1) + 120);
      swift_retain();
      v19(&v89);
      swift_release();
      v20 = v121;
      swift_bridgeObjectRetain();
      String.hash(into:)();
      swift_bridgeObjectRelease();
      v21 = v122;
      v82 = BYTE8(v122);
      if (BYTE8(v122) == 1)
      {
        Hasher._combine(_:)(0);
      }
      else
      {
        Hasher._combine(_:)(1u);
        Hasher._combine(_:)(v21);
      }
      v81 = v123;
      Hasher._combine(_:)(v123);
      v22 = Hasher._finalize()();
      v23 = v87;
      v24 = -1 << *(_BYTE *)(v87 + 32);
      v25 = v22 & ~v24;
      if (((*(_QWORD *)(v87 + 56 + ((v25 >> 3) & 0xFFFFFFFFFFFFF8)) >> v25) & 1) != 0)
      {
        v71 = v21;
        v85 = v18;
        v79 = v6;
        v26 = ~v24;
        while (1)
        {
          v27 = *(_QWORD *)(v23 + 48) + 56 * v25;
          if (*(_QWORD *)v27 == v125)
          {
            v28 = *(_QWORD *)(v27 + 16);
            v30 = *(_QWORD *)(v27 + 24);
            v29 = *(_QWORD *)(v27 + 32);
            v31 = *(_BYTE *)(v27 + 40);
            v32 = *(_QWORD *)(v27 + 48);
            v33 = *(uint64_t (**)(uint64_t))(**(_QWORD **)(v27 + 8) + 128);
            swift_retain();
            swift_bridgeObjectRetain();
            if ((v33(v85) & 1) != 0)
            {
              if (v28 == (_QWORD)v20 && v30 == *((_QWORD *)&v20 + 1))
              {
                swift_bridgeObjectRelease();
                swift_release();
                v23 = v87;
                if ((v31 & 1) != 0)
                {
LABEL_24:
                  v36 = v82;
                  if (v32 != v81)
                    v36 = 0;
                  if ((v36 & 1) != 0)
                  {
LABEL_35:
                    swift_bridgeObjectRelease();
                    swift_release();
                    v4 = v70;
                    v3 = v68;
                    v6 = v79;
                    goto LABEL_4;
                  }
                  goto LABEL_15;
                }
                goto LABEL_29;
              }
              v35 = _stringCompareWithSmolCheck(_:_:expecting:)();
              swift_bridgeObjectRelease();
              swift_release();
              v23 = v87;
              if ((v35 & 1) != 0)
              {
                if ((v31 & 1) != 0)
                  goto LABEL_24;
LABEL_29:
                if ((v82 & 1) == 0 && v29 == v71 && v32 == v81)
                  goto LABEL_35;
              }
            }
            else
            {
              swift_bridgeObjectRelease();
              swift_release();
              v23 = v87;
            }
          }
LABEL_15:
          v25 = (v25 + 1) & v26;
          if (((*(_QWORD *)(v87 + 56 + ((v25 >> 3) & 0xFFFFFFFFFFFFF8)) >> v25) & 1) == 0)
          {
            v4 = v70;
            v3 = v68;
            v6 = v79;
            goto LABEL_38;
          }
        }
      }
      v3 = v68;
    }
LABEL_38:
    v124[0] = v121;
    swift_retain();
    outlined retain of String((uint64_t)v124);
    specialized Set._Variant.insert(_:)((uint64_t)&v89, (Swift::Int)&v120);
    swift_release();
    swift_bridgeObjectRelease();
    v38 = v3[2];
    if (v4)
      break;
    if (!v38)
      goto LABEL_3;
    if (*v69 == (_QWORD)v120)
    {
      result = 0;
      v41 = v67;
    }
    else
    {
      if (v38 == 1)
        goto LABEL_3;
      if (v3[5] == (_QWORD)v120)
      {
        result = 1;
        v41 = v67;
      }
      else
      {
        if (v38 == 2)
          goto LABEL_3;
        if (v3[6] != (_QWORD)v120)
        {
          v42 = 0;
          while (v38 - 3 != v42)
          {
            v43 = v60[v42++];
            if (v43 == (_QWORD)v120)
            {
              result = v42 + 2;
              v41 = v67;
              if ((result & 0x8000000000000000) != 0)
                goto LABEL_76;
              goto LABEL_55;
            }
          }
LABEL_3:
          swift_release();
          outlined release of String((uint64_t)v124);
          goto LABEL_4;
        }
        result = 2;
        v41 = v67;
      }
    }
LABEL_55:
    if (result >= *(_QWORD *)(v41 + 16))
      goto LABEL_77;
    v80 = v6;
    v44 = (_QWORD *)(v64 + 48 * result);
    v45 = v44[3];
    v46 = v44[4];
    v47 = v44[5];
    v48 = *(_QWORD *)(v46 + 16);
    if (v45)
    {
      swift_retain();
      outlined retain of String((uint64_t)v124);
      swift_retain();
      swift_retain();
      swift_retain();
      result = specialized _HashTable.UnsafeHandle._find<A>(_:in:)((uint64_t)&v120, v46 + 32, v48, (_QWORD *)(v45 + 16), v45 + 32);
      if ((v49 & 1) != 0)
        goto LABEL_65;
    }
    else
    {
      swift_retain();
      outlined retain of String((uint64_t)v124);
      swift_retain();
      swift_retain();
      result = specialized Collection<>.firstIndex(of:)(&v120, v46 + 32, v48);
      if ((v50 & 1) != 0)
      {
LABEL_65:
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        outlined release of String((uint64_t)v124);
        swift_release();
        outlined release of String((uint64_t)v124);
LABEL_67:
        v6 = v80;
        v4 = v70;
        goto LABEL_4;
      }
    }
    if ((result & 0x8000000000000000) != 0)
      goto LABEL_78;
    if (result >= *(_QWORD *)(v47 + 16))
      goto LABEL_79;
    v51 = (_QWORD *)(v47 + 56 * result);
    v53 = v51[4];
    v52 = v51[5];
    v54 = v51[6];
    v55 = v51[8];
    v56 = v51[9];
    v57 = v51[10];
    v125 = v51[7];
    v86 = v55;
    v88 = v56;
    outlined copy of Output?(v53, v52);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    outlined release of String((uint64_t)v124);
    if (!v52)
    {
      swift_release();
      outlined release of String((uint64_t)v124);
      goto LABEL_67;
    }
    v84 = v57;
    v4 = v70;
    specialized OrderedDictionary.subscript.getter(v53, v70, v3, v67, v104);
    outlined init with take of MetalFunctionNode?((uint64_t)v104, (uint64_t)&v105, &demangling cache variable for type metadata for Graph.Adjacent?);
    if (*((_QWORD *)&v105 + 1))
    {
      v113 = v105;
      v110 = v107;
      v83 = v106;
      v58 = v108;
      outlined init with take of MetalFunctionNode?((uint64_t)&v110, (uint64_t)v112, &demangling cache variable for type metadata for _HashTable.Storage?);
      v59 = *((_QWORD *)&v110 + 1);
      v111 = *((_QWORD *)&v110 + 1);
      v109 = v58;
      v115 = v113;
      outlined init with take of MetalFunctionNode?((uint64_t)&v115, (uint64_t)v117, &demangling cache variable for type metadata for _HashTable.Storage?);
      swift_retain();
      outlined retain of String((uint64_t)v124);
      outlined retain of _HashTable.Storage?((uint64_t)v112);
      outlined retain of _HashTable.Storage?((uint64_t)&v111);
      outlined retain of _HashTable.Storage?((uint64_t)&v109);
      outlined release of _HashTable.Storage?((uint64_t)v117);
      v116 = *((_QWORD *)&v115 + 1);
      outlined release of _HashTable.Storage?((uint64_t)&v116);
      v114 = v83;
      outlined release of _HashTable.Storage?((uint64_t)&v114);
      outlined release of _HashTable.Storage?((uint64_t)v112);
      outlined release of _HashTable.Storage?((uint64_t)&v111);
      outlined release of _HashTable.Storage?((uint64_t)&v109);
      outlined release of _HashTable.Storage?((uint64_t)&v109);
      outlined release of _HashTable.Storage?((uint64_t)v112);
    }
    else
    {
      swift_retain();
      outlined retain of String((uint64_t)v124);
      v59 = MEMORY[0x24BEE4AF8];
    }
    specialized Array.append<A>(contentsOf:)(v59);
    swift_release();
    outlined release of String((uint64_t)v124);
    *(_QWORD *)&v89 = v53;
    *((_QWORD *)&v89 + 1) = v52;
    v90 = v54;
    v91 = v125;
    v92 = v86;
    v93 = v88 & 1;
    v94 = v84;
    v95 = v76;
    v96 = v78;
    v97 = v75;
    v98 = v77;
    v99 = v74;
    v100 = v73;
    v101 = v72;
    closure #1 in UserGraphCompiler.emitEdges(context:into:)(&v89, a2, a3);
    if (v63)
    {
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    v63 = 0;
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    v6 = v103;
    v3 = v68;
LABEL_4:
    if (!v6[2])
      goto LABEL_73;
  }
  result = specialized _HashTable.UnsafeHandle._find<A>(_:in:)(v120, (uint64_t)v69, v38, v66, v65);
  if ((v40 & 1) != 0)
    goto LABEL_3;
  v41 = v67;
  if ((result & 0x8000000000000000) == 0)
    goto LABEL_55;
LABEL_76:
  __break(1u);
LABEL_77:
  __break(1u);
LABEL_78:
  __break(1u);
LABEL_79:
  __break(1u);
  return result;
}

uint64_t specialized UserGraphCompiler.emitFunctionNodes(context:into:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;

  v21 = a2;
  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(_QWORD *)(v4 + 16);
  if (!v5)
  {
    swift_retain();
    return v21;
  }
  v6 = v4 + 32;
  swift_bridgeObjectRetain_n();
  swift_retain();
  v7 = 0;
  while (1)
  {
    v8 = v6 + 48 * v7;
    v9 = *(_QWORD *)(v8 + 24);
    if (v9 != -7)
      break;
    if ((uint64_t)++v7 >= v5)
      goto LABEL_10;
LABEL_8:
    if (v7 >= v5)
    {
      __break(1u);
LABEL_10:
      swift_bridgeObjectRelease_n();
      return v21;
    }
  }
  v11 = *(_QWORD *)v8;
  v10 = *(_QWORD *)(v8 + 8);
  v12 = *(_QWORD *)(v8 + 16);
  v13 = *(_BYTE *)(v8 + 40);
  v14 = *(_QWORD *)(v8 + 32);
  *(_QWORD *)&v16 = v11;
  *((_QWORD *)&v16 + 1) = v10;
  v17 = v12;
  v18 = v9;
  v19 = v14;
  v20 = v13;
  outlined copy of NodePersonality(v11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  closure #1 in UserGraphCompiler.emitFunctionNodes(context:into:)(&v16, &v21, a1);
  if (!v2)
  {
    ++v7;
    outlined consume of NodePersonality(v11);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((uint64_t)v7 >= v5)
      goto LABEL_10;
    goto LABEL_8;
  }
  outlined consume of NodePersonality(v11);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t specialized UserGraphCompiler.applyConstExpr(context:into:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t result;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  uint64_t v30;
  Swift::UInt v31;
  Swift::Int v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  Swift::UInt v41;
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
  uint64_t (*v56)(uint64_t, uint64_t);
  uint64_t v57;
  Swift::UInt v58;
  Swift::Int v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  Swift::UInt v66;
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
  uint64_t (*v79)(uint64_t, uint64_t);
  uint64_t v80;
  Swift::UInt v81;
  Swift::Int v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  Swift::UInt v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  int64_t v95;
  uint64_t v96;
  uint64_t v97;
  void (*v98)(__int128 *__return_ptr, _QWORD);
  unint64_t v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t (*v106)(uint64_t, uint64_t);
  uint64_t v107;
  char v108;
  uint64_t v109;
  uint64_t v110;
  Swift::UInt v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  _OWORD *v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _OWORD *v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _OWORD *v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
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
  uint64_t v160;
  uint64_t v161;
  __int128 v162[2];
  uint64_t v163;
  Swift::UInt v164[5];
  __int128 v165;
  __int128 v166;
  uint64_t v167;
  _QWORD v168[3];
  uint64_t v169;
  uint64_t v170;
  __int128 v171[12];
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  uint64_t v187;
  _QWORD v188[3];
  uint64_t v189;
  uint64_t v190;
  _QWORD v191[3];
  uint64_t v192;
  uint64_t v193;
  __int128 v194;
  __int128 v195;
  uint64_t v196;
  uint64_t v197;

  v3 = v2;
  v197 = a2;
  v161 = swift_allocObject();
  *(_QWORD *)(v161 + 16) = MEMORY[0x24BEE4B08];
  v5 = (*(uint64_t (**)(void))(*(_QWORD *)a2 + 120))();
  v6 = *(_QWORD *)(v5 + 16);
  if (v6)
  {
    v7 = v5 + 32;
    v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      outlined init with copy of MetalFunctionNode(v7, (uint64_t)&v172);
      outlined init with copy of MetalFunctionNode((uint64_t)&v172, (uint64_t)v171);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalFunctionNode);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalConstExprFunctionNode);
      if ((swift_dynamicCast() & 1) == 0)
      {
        v196 = 0;
        v194 = 0u;
        v195 = 0u;
      }
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v172);
      if (*((_QWORD *)&v195 + 1))
      {
        outlined init with take of MetalFunctionNode(&v194, (uint64_t)v171);
        outlined init with take of MetalFunctionNode(v171, (uint64_t)&v194);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v8 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v8[2] + 1, 1, v8);
        v10 = v8[2];
        v9 = v8[3];
        if (v10 >= v9 >> 1)
          v8 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v9 > 1), v10 + 1, 1, v8);
        v8[2] = v10 + 1;
        outlined init with take of MetalFunctionNode(&v194, (uint64_t)&v8[5 * v10 + 4]);
      }
      else
      {
        outlined destroy of (input: Input, fNode: MetalFunctionNode?)((uint64_t)&v194, &demangling cache variable for type metadata for MetalConstExprFunctionNode?);
      }
      v7 += 40;
      --v6;
    }
    while (v6);
    result = swift_bridgeObjectRelease();
  }
  else
  {
    result = swift_bridgeObjectRelease();
    v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  *(_QWORD *)&v194 = MEMORY[0x24BEE4AF8];
  v12 = v8[2];
  if (v12)
  {
    v13 = 0;
    v14 = (uint64_t)(v8 + 4);
    do
    {
      if (v13 >= v8[2])
      {
        __break(1u);
        return result;
      }
      outlined init with copy of MetalFunctionNode(v14, (uint64_t)&v172);
      v15 = *((_QWORD *)&v173 + 1);
      v16 = v174;
      __swift_project_boxed_opaque_existential_1(&v172, *((uint64_t *)&v173 + 1));
      if (((*(uint64_t (**)(uint64_t, uint64_t))(v16 + 16))(v15, v16) & 1) != 0)
      {
        outlined init with take of MetalFunctionNode(&v172, (uint64_t)v171);
        v17 = v194;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v17 + 16) + 1, 1);
          v17 = v194;
        }
        v19 = *(_QWORD *)(v17 + 16);
        v18 = *(_QWORD *)(v17 + 24);
        if (v19 >= v18 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v18 > 1, v19 + 1, 1);
          v17 = v194;
        }
        *(_QWORD *)(v17 + 16) = v19 + 1;
        result = outlined init with take of MetalFunctionNode(v171, v17 + 40 * v19 + 32);
      }
      else
      {
        result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v172);
      }
      ++v13;
      v14 += 40;
    }
    while (v12 != v13);
  }
  swift_bridgeObjectRelease();
  v20 = *(_QWORD *)(v194 + 16);
  if (!v20)
  {
    swift_release();
    goto LABEL_88;
  }
  v21 = v194 + 32;
  swift_retain();
  v22 = (uint64_t *)(v161 + 16);
  swift_beginAccess();
  v23 = 0;
  v151 = v20;
  v155 = v21;
  while (1)
  {
    v160 = v23;
    v24 = (_QWORD *)(v21 + 40 * v23);
    v25 = *v22;
    v27 = v24[3];
    v26 = v24[4];
    __swift_project_boxed_opaque_existential_1(v24, v27);
    v28 = *(_QWORD *)(v26 + 8);
    v29 = *(uint64_t (**)(uint64_t, uint64_t))(v28 + 24);
    swift_bridgeObjectRetain();
    v30 = v29(v27, v28);
    if (!*(_QWORD *)(v25 + 16))
      break;
    v31 = v30;
    Hasher.init(_seed:)();
    Hasher._combine(_:)(v31);
    v32 = Hasher._finalize()();
    v33 = -1 << *(_BYTE *)(v25 + 32);
    v34 = v32 & ~v33;
    v35 = v25 + 56;
    if (((*(_QWORD *)(v25 + 56 + ((v34 >> 3) & 0xFFFFFFFFFFFFF8)) >> v34) & 1) == 0)
      break;
    v36 = *(_QWORD *)(v25 + 48);
    if (*(_QWORD *)(v36 + 8 * v34) != v31)
    {
      v37 = ~v33;
      v38 = (v34 + 1) & v37;
      if (((*(_QWORD *)(v35 + ((v38 >> 3) & 0xFFFFFFFFFFFFF8)) >> v38) & 1) == 0)
        break;
      while (*(_QWORD *)(v36 + 8 * v38) != v31)
      {
        v38 = (v38 + 1) & v37;
        if (((*(_QWORD *)(v35 + ((v38 >> 3) & 0xFFFFFFFFFFFFF8)) >> v38) & 1) == 0)
          goto LABEL_35;
      }
    }
    swift_bridgeObjectRelease();
LABEL_85:
    v21 = v155;
    v23 = v160 + 1;
    if (v160 + 1 == v20)
    {
      swift_release_n();
LABEL_88:
      v47 = v197;
      swift_retain();
      swift_release();
      return v47;
    }
  }
LABEL_35:
  swift_bridgeObjectRelease();
  outlined init with copy of MetalFunctionNode((uint64_t)v24, (uint64_t)&v194);
  v40 = *((_QWORD *)&v195 + 1);
  v39 = v196;
  __swift_project_boxed_opaque_existential_1(&v194, *((uint64_t *)&v195 + 1));
  v41 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v39 + 8) + 24))(v40);
  swift_beginAccess();
  specialized Set._Variant.insert(_:)((Swift::UInt *)v171, v41);
  swift_endAccess();
  v42 = *((_QWORD *)&v195 + 1);
  v43 = v196;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v194, *((uint64_t *)&v195 + 1));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 24))(1, v42, v43);
  v45 = *((_QWORD *)&v195 + 1);
  v44 = v196;
  __swift_project_boxed_opaque_existential_1(&v194, *((uint64_t *)&v195 + 1));
  v46 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v44 + 8) + 48))(v45);
  v47 = v197;
  swift_retain();
  v48 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay11ShaderGraph14FunctionNodeIDVG_AF05MetalfG0_psAE_pTg504_s11d41Graph13createDotText12representing12inputg20IDs06outputhI0SSAA05i18A7ProgramC_SayAA08F28H2IDVGAJtKFAA0kmH0_pAIKXEfU_AF0idR0CTf1cn_nTf4ng_nTm(v46, v47);
  if (v3)
  {
    swift_bridgeObjectRelease();
    swift_release();
    goto LABEL_90;
  }
  v49 = v48;
  swift_bridgeObjectRelease();
  swift_release();
  v158 = *(_QWORD *)(v49 + 16);
  if (!v158)
  {
    swift_bridgeObjectRelease();
LABEL_84:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v194);
    v20 = v151;
    goto LABEL_85;
  }
  v50 = v49 + 32;
  swift_bridgeObjectRetain();
  v51 = 0;
  v152 = v49 + 32;
  while (1)
  {
    v159 = v51;
    outlined init with copy of MetalFunctionNode(v50 + 40 * v51, (uint64_t)v188);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalFunctionNode);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalConstExprFunctionNode);
    if (!swift_dynamicCast())
    {
      v185 = 0u;
      v186 = 0u;
      v187 = 0;
      outlined destroy of (input: Input, fNode: MetalFunctionNode?)((uint64_t)&v185, &demangling cache variable for type metadata for MetalConstExprFunctionNode?);
      _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi47_((uint64_t)v171);
      outlined init with take of UserGraphError.ErrorType(v171, (uint64_t)&v172);
      *(_QWORD *)&v184 = 0xD00000000000005CLL;
      *((_QWORD *)&v184 + 1) = 0x8000000245FCE850;
      lazy protocol witness table accessor for type UserGraphError and conformance UserGraphError();
      swift_allocError();
      *v130 = v172;
      v131 = v176;
      v133 = v173;
      v132 = v174;
      v130[3] = v175;
      v130[4] = v131;
      v130[1] = v133;
      v130[2] = v132;
      v134 = v180;
      v136 = v177;
      v135 = v178;
      v130[7] = v179;
      v130[8] = v134;
      v130[5] = v136;
      v130[6] = v135;
      v137 = v184;
      v139 = v181;
      v138 = v182;
      v130[11] = v183;
      v130[12] = v137;
      v130[9] = v139;
      v130[10] = v138;
      swift_willThrow();
      swift_bridgeObjectRelease_n();
      goto LABEL_90;
    }
    outlined init with take of MetalFunctionNode(&v185, (uint64_t)v191);
    v52 = *v22;
    v54 = v192;
    v53 = v193;
    __swift_project_boxed_opaque_existential_1(v191, v192);
    v55 = *(_QWORD *)(v53 + 8);
    v56 = *(uint64_t (**)(uint64_t, uint64_t))(v55 + 24);
    swift_bridgeObjectRetain();
    v57 = v56(v54, v55);
    if (!*(_QWORD *)(v52 + 16))
      break;
    v58 = v57;
    Hasher.init(_seed:)();
    Hasher._combine(_:)(v58);
    v59 = Hasher._finalize()();
    v60 = -1 << *(_BYTE *)(v52 + 32);
    v61 = v59 & ~v60;
    if (((*(_QWORD *)(v52 + 56 + ((v61 >> 3) & 0xFFFFFFFFFFFFF8)) >> v61) & 1) == 0)
      break;
    v62 = *(_QWORD *)(v52 + 48);
    if (*(_QWORD *)(v62 + 8 * v61) != v58)
    {
      v63 = ~v60;
      do
      {
        v61 = (v61 + 1) & v63;
        if (((*(_QWORD *)(v52 + 56 + ((v61 >> 3) & 0xFFFFFFFFFFFFF8)) >> v61) & 1) == 0)
          goto LABEL_46;
      }
      while (*(_QWORD *)(v62 + 8 * v61) != v58);
    }
    swift_bridgeObjectRelease();
LABEL_81:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v191);
    v51 = v159 + 1;
    v50 = v152;
    if (v159 + 1 == v158)
    {
      swift_bridgeObjectRelease_n();
      goto LABEL_84;
    }
  }
LABEL_46:
  swift_bridgeObjectRelease();
  outlined init with copy of MetalFunctionNode((uint64_t)v191, (uint64_t)v188);
  v65 = v189;
  v64 = v190;
  __swift_project_boxed_opaque_existential_1(v188, v189);
  v66 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v64 + 8) + 24))(v65);
  swift_beginAccess();
  specialized Set._Variant.insert(_:)((Swift::UInt *)v171, v66);
  swift_endAccess();
  v67 = v189;
  v68 = v190;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v188, v189);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v68 + 24))(1, v67, v68);
  v70 = v189;
  v69 = v190;
  __swift_project_boxed_opaque_existential_1(v188, v189);
  v71 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v69 + 8) + 48))(v70);
  swift_retain();
  v72 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay11ShaderGraph14FunctionNodeIDVG_AF05MetalfG0_psAE_pTg504_s11d41Graph13createDotText12representing12inputg20IDs06outputhI0SSAA05i18A7ProgramC_SayAA08F28H2IDVGAJtKFAA0kmH0_pAIKXEfU_AF0idR0CTf1cn_nTf4ng_nTm(v71, v47);
  swift_bridgeObjectRelease();
  swift_release();
  v154 = *(_QWORD *)(v72 + 16);
  if (!v154)
  {
    swift_bridgeObjectRelease();
LABEL_80:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v188);
    goto LABEL_81;
  }
  v73 = v72 + 32;
  swift_bridgeObjectRetain();
  v74 = 0;
  v153 = v49;
  v150 = v72 + 32;
  while (1)
  {
    outlined init with copy of MetalFunctionNode(v73 + 40 * v74, (uint64_t)v168);
    if (!swift_dynamicCast())
    {
      v165 = 0u;
      v166 = 0u;
      v167 = 0;
      outlined destroy of (input: Input, fNode: MetalFunctionNode?)((uint64_t)&v165, &demangling cache variable for type metadata for MetalConstExprFunctionNode?);
      _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi47_((uint64_t)v171);
      outlined init with take of UserGraphError.ErrorType(v171, (uint64_t)&v172);
      *(_QWORD *)&v184 = 0xD00000000000005CLL;
      *((_QWORD *)&v184 + 1) = 0x8000000245FCE850;
      lazy protocol witness table accessor for type UserGraphError and conformance UserGraphError();
      swift_allocError();
      *v140 = v172;
      v141 = v176;
      v143 = v173;
      v142 = v174;
      v140[3] = v175;
      v140[4] = v141;
      v140[1] = v143;
      v140[2] = v142;
      v144 = v180;
      v146 = v177;
      v145 = v178;
      v140[7] = v179;
      v140[8] = v144;
      v140[5] = v146;
      v140[6] = v145;
      v147 = v184;
      v149 = v181;
      v148 = v182;
      v140[11] = v183;
      v140[12] = v147;
      v140[9] = v149;
      v140[10] = v148;
      swift_willThrow();
      swift_bridgeObjectRelease_n();
      goto LABEL_89;
    }
    v156 = v74;
    outlined init with take of MetalFunctionNode(&v165, (uint64_t)&v185);
    v75 = *v22;
    v76 = *((_QWORD *)&v186 + 1);
    v77 = v187;
    __swift_project_boxed_opaque_existential_1(&v185, *((uint64_t *)&v186 + 1));
    v78 = *(_QWORD *)(v77 + 8);
    v79 = *(uint64_t (**)(uint64_t, uint64_t))(v78 + 24);
    swift_bridgeObjectRetain();
    v80 = v79(v76, v78);
    if (!*(_QWORD *)(v75 + 16))
      break;
    v81 = v80;
    Hasher.init(_seed:)();
    Hasher._combine(_:)(v81);
    v82 = Hasher._finalize()();
    v83 = -1 << *(_BYTE *)(v75 + 32);
    v84 = v82 & ~v83;
    if (((*(_QWORD *)(v75 + 56 + ((v84 >> 3) & 0xFFFFFFFFFFFFF8)) >> v84) & 1) == 0)
      break;
    v85 = *(_QWORD *)(v75 + 48);
    if (*(_QWORD *)(v85 + 8 * v84) != v81)
    {
      v86 = ~v83;
      do
      {
        v84 = (v84 + 1) & v86;
        if (((*(_QWORD *)(v75 + 56 + ((v84 >> 3) & 0xFFFFFFFFFFFFF8)) >> v84) & 1) == 0)
          goto LABEL_56;
      }
      while (*(_QWORD *)(v85 + 8 * v84) != v81);
    }
    swift_bridgeObjectRelease();
LABEL_76:
    v73 = v150;
    v74 = v156 + 1;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v185);
    if (v156 + 1 == v154)
    {
      swift_bridgeObjectRelease_n();
      goto LABEL_80;
    }
  }
LABEL_56:
  swift_bridgeObjectRelease();
  outlined init with copy of MetalFunctionNode((uint64_t)&v185, (uint64_t)v168);
  v88 = v169;
  v87 = v170;
  __swift_project_boxed_opaque_existential_1(v168, v169);
  v89 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v87 + 8) + 24))(v88);
  swift_beginAccess();
  specialized Set._Variant.insert(_:)((Swift::UInt *)v171, v89);
  swift_endAccess();
  v90 = v169;
  v91 = v170;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v168, v169);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v91 + 24))(1, v90, v91);
  v93 = v169;
  v92 = v170;
  __swift_project_boxed_opaque_existential_1(v168, v169);
  v94 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v92 + 8) + 48))(v93);
  v95 = *(_QWORD *)(v94 + 16);
  if (v95)
  {
    *(_QWORD *)&v171[0] = MEMORY[0x24BEE4AF8];
    swift_retain();
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v95, 0);
    v96 = 0;
    v97 = *(_QWORD *)&v171[0];
    v98 = *(void (**)(__int128 *__return_ptr, _QWORD))(*(_QWORD *)v47 + 272);
    do
    {
      v98(&v172, *(_QWORD *)(v94 + 8 * v96 + 32));
      *(_QWORD *)&v171[0] = v97;
      v100 = *(_QWORD *)(v97 + 16);
      v99 = *(_QWORD *)(v97 + 24);
      if (v100 >= v99 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v99 > 1, v100 + 1, 1);
        v97 = *(_QWORD *)&v171[0];
      }
      ++v96;
      *(_QWORD *)(v97 + 16) = v100 + 1;
      outlined init with take of MetalFunctionNode(&v172, v97 + 40 * v100 + 32);
      v47 = v197;
    }
    while (v95 != v96);
    swift_bridgeObjectRelease();
    swift_release();
    v49 = v153;
  }
  else
  {
    swift_bridgeObjectRelease();
    v97 = MEMORY[0x24BEE4AF8];
  }
  v157 = *(_QWORD *)(v97 + 16);
  if (!v157)
  {
    swift_bridgeObjectRelease();
LABEL_75:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v168);
    v22 = (uint64_t *)(v161 + 16);
    goto LABEL_76;
  }
  swift_bridgeObjectRetain();
  v101 = 0;
  while (1)
  {
    outlined init with copy of MetalFunctionNode(v97 + 32 + 40 * v101, (uint64_t)v164);
    if (!swift_dynamicCast())
      break;
    outlined init with take of MetalFunctionNode(v162, (uint64_t)&v165);
    v102 = *(_QWORD *)(v161 + 16);
    v104 = *((_QWORD *)&v166 + 1);
    v103 = v167;
    __swift_project_boxed_opaque_existential_1(&v165, *((uint64_t *)&v166 + 1));
    v105 = *(_QWORD *)(v103 + 8);
    v106 = *(uint64_t (**)(uint64_t, uint64_t))(v105 + 24);
    swift_bridgeObjectRetain();
    v107 = v106(v104, v105);
    v108 = specialized Set.contains(_:)(v107, v102);
    swift_bridgeObjectRelease();
    if ((v108 & 1) == 0)
    {
      outlined init with copy of MetalFunctionNode((uint64_t)&v165, (uint64_t)&v172);
      v109 = *((_QWORD *)&v173 + 1);
      v110 = v174;
      __swift_project_boxed_opaque_existential_1(&v172, *((uint64_t *)&v173 + 1));
      v111 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v110 + 8) + 24))(v109);
      swift_beginAccess();
      specialized Set._Variant.insert(_:)(v164, v111);
      swift_endAccess();
      v112 = *((_QWORD *)&v173 + 1);
      v113 = v174;
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v172, *((uint64_t *)&v173 + 1));
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v113 + 24))(1, v112, v113);
      v114 = *((_QWORD *)&v173 + 1);
      v115 = v174;
      __swift_project_boxed_opaque_existential_1(&v172, *((uint64_t *)&v173 + 1));
      v116 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v115 + 8) + 48))(v114);
      swift_retain();
      v117 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay11ShaderGraph14FunctionNodeIDVG_AF05MetalfG0_psAE_pTg504_s11d41Graph13createDotText12representing12inputg20IDs06outputhI0SSAA05i18A7ProgramC_SayAA08F28H2IDVGAJtKFAA0kmH0_pAIKXEfU_AF0idR0CTf1cn_nTf4ng_nTm(v116, v47);
      swift_bridgeObjectRelease();
      swift_release();
      v118 = *(_QWORD *)(v117 + 16);
      if (v118)
      {
        v119 = v117 + 32;
        swift_bridgeObjectRetain();
        do
        {
          closure #2 in applyConstExpr #1 (_:) in UserGraphCompiler.applyConstExpr(context:into:)(v119, v161, v47);
          v119 += 40;
          --v118;
        }
        while (v118);
        swift_bridgeObjectRelease_n();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v172);
    }
    ++v101;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v165);
    if (v101 == v157)
    {
      swift_bridgeObjectRelease_n();
      v49 = v153;
      goto LABEL_75;
    }
  }
  memset(v162, 0, sizeof(v162));
  v163 = 0;
  outlined destroy of (input: Input, fNode: MetalFunctionNode?)((uint64_t)v162, &demangling cache variable for type metadata for MetalConstExprFunctionNode?);
  _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi47_((uint64_t)v171);
  outlined init with take of UserGraphError.ErrorType(v171, (uint64_t)&v172);
  *(_QWORD *)&v184 = 0xD00000000000005CLL;
  *((_QWORD *)&v184 + 1) = 0x8000000245FCE850;
  lazy protocol witness table accessor for type UserGraphError and conformance UserGraphError();
  swift_allocError();
  *v120 = v172;
  v121 = v176;
  v123 = v173;
  v122 = v174;
  v120[3] = v175;
  v120[4] = v121;
  v120[1] = v123;
  v120[2] = v122;
  v124 = v180;
  v126 = v177;
  v125 = v178;
  v120[7] = v179;
  v120[8] = v124;
  v120[5] = v126;
  v120[6] = v125;
  v127 = v184;
  v129 = v181;
  v128 = v182;
  v120[11] = v183;
  v120[12] = v127;
  v120[9] = v129;
  v120[10] = v128;
  swift_willThrow();
  swift_bridgeObjectRelease_n();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v168);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v185);
  swift_bridgeObjectRelease_n();
LABEL_89:
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v188);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v191);
  swift_bridgeObjectRelease_n();
LABEL_90:
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v194);
  swift_release();
  swift_release_n();
  return v47;
}

uint64_t specialized UserGraphCompiler.removePassthroughNodes(context:into:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _OWORD *v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
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
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t result;
  uint64_t v43;
  uint64_t (*v44)(void);
  int64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49[3];
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v44 = *(uint64_t (**)(void))(*(_QWORD *)a2 + 120);
  v2 = v44();
  v3 = v2;
  v4 = MEMORY[0x24BEE4AF8];
  v54 = MEMORY[0x24BEE4AF8];
  v5 = *(_QWORD *)(v2 + 16);
  if (v5)
  {
    v6 = 0;
    v7 = v2 + 32;
    while (v6 < *(_QWORD *)(v3 + 16))
    {
      outlined init with copy of MetalFunctionNode(v7, (uint64_t)v49);
      outlined init with copy of MetalFunctionNode((uint64_t)v49, (uint64_t)&v51);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalFunctionNode);
      type metadata accessor for MetalPassthroughNode();
      if (swift_dynamicCast())
      {
        swift_release();
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v49);
      }
      else
      {
        outlined init with take of MetalFunctionNode(v49, (uint64_t)&v51);
        v8 = v54;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v8 + 16) + 1, 1);
          v8 = v54;
        }
        v10 = *(_QWORD *)(v8 + 16);
        v9 = *(_QWORD *)(v8 + 24);
        if (v10 >= v9 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v9 > 1, v10 + 1, 1);
          v8 = v54;
        }
        *(_QWORD *)(v8 + 16) = v10 + 1;
        outlined init with take of MetalFunctionNode(&v51, v8 + 40 * v10 + 32);
      }
      ++v6;
      v7 += 40;
      if (v5 == v6)
      {
        v11 = v54;
        v4 = MEMORY[0x24BEE4AF8];
        goto LABEL_14;
      }
    }
    __break(1u);
    goto LABEL_48;
  }
  v11 = MEMORY[0x24BEE4AF8];
LABEL_14:
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(v11 + 16);
  if (v12)
  {
    v54 = v4;
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v12, 0);
    v13 = 0;
    v46 = v12;
    v47 = v11 + 32;
    do
    {
      v48 = v13;
      outlined init with copy of MetalFunctionNode(v47 + 40 * v13, (uint64_t)&v51);
      v14 = v52;
      v15 = v53;
      __swift_project_boxed_opaque_existential_1(&v51, v52);
      v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 48))(v14, v15);
      v17 = *(_QWORD *)(v16 + 16);
      if (v17)
      {
        v50 = v4;
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v17, 0);
        v18 = 0;
        v19 = v50;
        do
        {
          *(_QWORD *)&v49[0] = *(_QWORD *)(v16 + 8 * v18 + 32);
          outlined init with copy of MetalFunctionNode((uint64_t)&v51, (uint64_t)v49 + 8);
          v50 = v19;
          v21 = *(_QWORD *)(v19 + 16);
          v20 = *(_QWORD *)(v19 + 24);
          if (v21 >= v20 >> 1)
          {
            specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v20 > 1, v21 + 1, 1);
            v19 = v50;
          }
          ++v18;
          *(_QWORD *)(v19 + 16) = v21 + 1;
          v22 = (_OWORD *)(v19 + 48 * v21);
          v23 = v49[0];
          v24 = v49[2];
          v22[3] = v49[1];
          v22[4] = v24;
          v22[2] = v23;
        }
        while (v17 != v18);
        swift_bridgeObjectRelease();
        v4 = MEMORY[0x24BEE4AF8];
        v12 = v46;
      }
      else
      {
        swift_bridgeObjectRelease();
        v19 = v4;
      }
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v51);
      v25 = v54;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v25 + 16) + 1, 1);
        v25 = v54;
      }
      v27 = *(_QWORD *)(v25 + 16);
      v26 = *(_QWORD *)(v25 + 24);
      if (v27 >= v26 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v26 > 1, v27 + 1, 1);
        v25 = v54;
      }
      v13 = v48 + 1;
      *(_QWORD *)(v25 + 16) = v27 + 1;
      *(_QWORD *)(v25 + 8 * v27 + 32) = v19;
    }
    while (v48 + 1 != v12);
  }
  swift_release();
  *(_QWORD *)&v49[0] = MEMORY[0x24BEE4B00];
  v28 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v28, 1, v49);
  v29 = a2;
  if (v43)
    goto LABEL_49;
  v30 = swift_bridgeObjectRelease();
  v31 = *(_QWORD *)&v49[0];
  v32 = ((uint64_t (*)(uint64_t))v44)(v30);
  v33 = v32;
  v54 = v4;
  v34 = *(_QWORD *)(v32 + 16);
  if (v34)
  {
    v35 = 0;
    v36 = v32 + 32;
    while (v35 < *(_QWORD *)(v33 + 16))
    {
      outlined init with copy of MetalFunctionNode(v36, (uint64_t)v49);
      outlined init with copy of MetalFunctionNode((uint64_t)v49, (uint64_t)&v51);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalFunctionNode);
      type metadata accessor for MetalPassthroughNode();
      if ((swift_dynamicCast() & 1) != 0)
      {
        swift_release();
        outlined init with take of MetalFunctionNode(v49, (uint64_t)&v51);
        v37 = v54;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v37 + 16) + 1, 1);
          v37 = v54;
        }
        v39 = *(_QWORD *)(v37 + 16);
        v38 = *(_QWORD *)(v37 + 24);
        if (v39 >= v38 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v38 > 1, v39 + 1, 1);
          v37 = v54;
        }
        *(_QWORD *)(v37 + 16) = v39 + 1;
        outlined init with take of MetalFunctionNode(&v51, v37 + 40 * v39 + 32);
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v49);
      }
      ++v35;
      v36 += 40;
      if (v34 == v35)
      {
        v4 = v54;
        v29 = a2;
        goto LABEL_41;
      }
    }
LABEL_48:
    __break(1u);
LABEL_49:
    result = swift_unexpectedError();
    __break(1u);
    return result;
  }
LABEL_41:
  swift_bridgeObjectRelease();
  v40 = *(_QWORD *)(v4 + 16);
  if (v40)
  {
    v41 = (_QWORD *)(v4 + 32);
    swift_bridgeObjectRetain();
    do
    {
      closure #4 in UserGraphCompiler.removePassthroughNodes(context:into:)(v41, v29, v31);
      v41 += 5;
      --v40;
    }
    while (v40);
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
  }
  swift_release();
  (*(void (**)(uint64_t (*)(uint64_t), _QWORD))(*(_QWORD *)v29 + 288))(closure #5 in UserGraphCompiler.removePassthroughNodes(context:into:), 0);
  swift_retain();
  return v29;
}

uint64_t sub_245FB9A94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD v4[25];

  (*(void (**)(_QWORD *__return_ptr))(**(_QWORD **)a1 + 88))(v4);
  return outlined init with take of MetalFunctionNode?((uint64_t)v4, a2, (uint64_t *)&demangling cache variable for type metadata for UserGraphCompiler.CompileContext?);
}

uint64_t sub_245FB9AE0(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(_QWORD *);
  _QWORD v5[25];

  outlined init with take of MetalFunctionNode?(a1, (uint64_t)v5, (uint64_t *)&demangling cache variable for type metadata for UserGraphCompiler.CompileContext?);
  v3 = *(uint64_t (**)(_QWORD *))(**(_QWORD **)a2 + 96);
  outlined retain of UserGraphCompiler.CompileContext?(v5, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of UserGraphCompiler.CompileContext?);
  return v3(v5);
}

uint64_t dispatch thunk of FunctionGraphInsertable.emitFunctionNodes(node:context:into:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v5;
  uint64_t (*v6)(uint64_t *);
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  char v11;

  v5 = *((_BYTE *)a1 + 40);
  v6 = *(uint64_t (**)(uint64_t *))(a5 + 8);
  v8 = *a1;
  v9 = *(_OWORD *)(a1 + 1);
  v10 = *(_OWORD *)(a1 + 3);
  v11 = v5;
  return v6(&v8);
}

uint64_t type metadata accessor for UserGraphCompiler()
{
  return objc_opt_self();
}

uint64_t method lookup function for UserGraphCompiler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of UserGraphCompiler.context.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t dispatch thunk of UserGraphCompiler.context.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(_OWORD *);
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v11[12];
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 192);
  v3 = *(uint64_t (**)(_OWORD *))(*(_QWORD *)v1 + 96);
  v4 = *(_OWORD *)(a1 + 16);
  v11[0] = *(_OWORD *)a1;
  v11[1] = v4;
  v5 = *(_OWORD *)(a1 + 48);
  v11[2] = *(_OWORD *)(a1 + 32);
  v11[3] = v5;
  v6 = *(_OWORD *)(a1 + 80);
  v11[4] = *(_OWORD *)(a1 + 64);
  v11[5] = v6;
  v7 = *(_OWORD *)(a1 + 112);
  v11[6] = *(_OWORD *)(a1 + 96);
  v11[7] = v7;
  v8 = *(_OWORD *)(a1 + 144);
  v11[8] = *(_OWORD *)(a1 + 128);
  v11[9] = v8;
  v9 = *(_OWORD *)(a1 + 176);
  v11[10] = *(_OWORD *)(a1 + 160);
  v11[11] = v9;
  v12 = v2;
  return v3(v11);
}

uint64_t dispatch thunk of UserGraphCompiler.context.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of UserGraphCompiler.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of UserGraphCompiler.compile(sourceProgram:into:)(uint64_t *a1)
{
  uint64_t v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t (*v8)(uint64_t *);
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  char v23;

  v2 = *(_OWORD *)(a1 + 3);
  v3 = a1[5];
  v4 = a1[8];
  v5 = *((_BYTE *)a1 + 120);
  v6 = a1[16];
  v7 = *((_BYTE *)a1 + 168);
  v8 = *(uint64_t (**)(uint64_t *))(*(_QWORD *)v1 + 120);
  v10 = *a1;
  v11 = *(_OWORD *)(a1 + 1);
  v12 = v2;
  v13 = v3;
  v14 = *((_OWORD *)a1 + 3);
  v15 = v4;
  v16 = *(_OWORD *)(a1 + 9);
  v17 = *(_OWORD *)(a1 + 11);
  v18 = *(_OWORD *)(a1 + 13);
  v19 = v5;
  v20 = v6;
  v21 = *(_OWORD *)(a1 + 17);
  v22 = *(_OWORD *)(a1 + 19);
  v23 = v7;
  return v8(&v10);
}

uint64_t destroy for UserGraphCompiler.CompileContext(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of NodePersonality(*(_QWORD *)(a1 + 80));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of NodePersonality(*(_QWORD *)(a1 + 128));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UserGraphCompiler.CompileContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  v8 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v8;
  v9 = *(_QWORD *)(a2 + 80);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  outlined copy of NodePersonality(v9);
  v10 = *(_QWORD *)(a2 + 88);
  v11 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 80) = v9;
  *(_QWORD *)(a1 + 88) = v10;
  v12 = *(_QWORD *)(a2 + 104);
  v13 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 96) = v11;
  *(_QWORD *)(a1 + 104) = v12;
  *(_QWORD *)(a1 + 112) = v13;
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  v14 = *(_QWORD *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  outlined copy of NodePersonality(v14);
  v15 = *(_QWORD *)(a2 + 136);
  v16 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 128) = v14;
  *(_QWORD *)(a1 + 136) = v15;
  v17 = *(_QWORD *)(a2 + 152);
  v18 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 144) = v16;
  *(_QWORD *)(a1 + 152) = v17;
  *(_QWORD *)(a1 + 160) = v18;
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  v19 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v19;
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UserGraphCompiler.CompileContext(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  v4 = *(_QWORD *)(a2 + 80);
  outlined copy of NodePersonality(v4);
  v5 = *(_QWORD *)(a1 + 80);
  *(_QWORD *)(a1 + 80) = v4;
  outlined consume of NodePersonality(v5);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  v6 = *(_QWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = v6;
  v7 = *(_QWORD *)(a2 + 128);
  outlined copy of NodePersonality(v7);
  v8 = *(_QWORD *)(a1 + 128);
  *(_QWORD *)(a1 + 128) = v7;
  outlined consume of NodePersonality(v8);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  v9 = *(_QWORD *)(a2 + 160);
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = v9;
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy200_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;
  __int128 v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  v5 = *(_OWORD *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = v6;
  result = *(__n128 *)(a2 + 144);
  v9 = *(_OWORD *)(a2 + 160);
  v10 = *(_OWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 176) = v10;
  *(__n128 *)(a1 + 144) = result;
  return result;
}

uint64_t assignWithTake for UserGraphCompiler.CompileContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a1 + 80);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  outlined consume of NodePersonality(v5);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v6;
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  v7 = *(_QWORD *)(a1 + 128);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  outlined consume of NodePersonality(v7);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = v8;
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UserGraphCompiler.CompileContext(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 200))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UserGraphCompiler.CompileContext(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 200) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for UserGraphCompiler.CompileContext()
{
  return &type metadata for UserGraphCompiler.CompileContext;
}

uint64_t outlined init with copy of (FunctionNodeID, MetalFunctionNode)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (FunctionNodeID, MetalFunctionNode));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_245FBA2F8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi24_(uint64_t result)
{
  *(_QWORD *)(result + 168) = *(_QWORD *)(result + 168) & 1 | 0x6400000000000000;
  return result;
}

uint64_t _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi23_(uint64_t result)
{
  *(_QWORD *)(result + 168) = *(_QWORD *)(result + 168) & 1 | 0x6000000000000000;
  return result;
}

Swift::String __swiftcall NodeData.operationalDescription(replacements:)(Swift::OpaquePointer replacements)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  char v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  char v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  char v20;
  uint64_t *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  Swift::String v25;
  Swift::String v26;
  Swift::String v27;
  Swift::String v28;
  Swift::String v29;
  Swift::String v30;
  uint64_t v31;
  void *v32;
  Swift::String result;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  char v39[16];
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49[2];
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  unsigned __int8 v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  char v61;

  v2 = v1;
  outlined init with take of NodeData(v1, (uint64_t)v39);
  v4 = v40;
  v5 = v41;
  v6 = v42;
  v7 = v43;
  v9 = v44;
  v8 = v45;
  v10 = v46;
  v38 = v47;
  v11 = v48;
  outlined init with take of NodeData(v2, (uint64_t)v49);
  v12 = v55 >> 6;
  if (v12)
  {
    if (v12 == 1)
    {
      v13 = 0xE800000000000000;
      v14 = 0x6870617267627573;
    }
    else
    {
      v15 = v55 & 0x3F;
      v55 = v15;
      v57 = v51;
      v58 = v52;
      v59 = v53;
      v56 = v50;
      v60 = v54;
      v61 = v15;
      if (v15 == 6)
      {
        v36 = v49[0];
        v37 = v50;
        v35 = v51;
        v34 = *((_QWORD *)replacements._rawValue + 2);
        v16 = v11 & 0x3F;
        outlined retain of NodeData(v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined copy of NodeData);
        if (v34)
        {
          outlined retain of NodeData(v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined copy of NodeData);
          outlined copy of SGDataTypeStorage(v4, v5, v6, v7, v9, v8, v10, v38, v16);
          v17 = v37;
          v18 = (void *)v35;
          v19 = specialized __RawDictionaryStorage.find<A>(_:)(v37, v35);
          if ((v20 & 1) != 0)
          {
            v21 = (uint64_t *)(*((_QWORD *)replacements._rawValue + 7) + 16 * v19);
            v17 = *v21;
            v18 = (void *)v21[1];
            swift_bridgeObjectRetain();
            outlined retain of NodeData(v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined consume of NodeData);
          }
          outlined retain of NodeData(v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined consume of NodeData);
        }
        else
        {
          outlined copy of SGDataTypeStorage(v4, v5, v6, v7, v9, v8, v10, v38, v16);
          v17 = v37;
          v18 = (void *)v35;
        }
        v28._countAndFlagsBits = SGDataType.stringValue.getter(v36);
        String.append(_:)(v28);
        swift_bridgeObjectRelease();
        v29._countAndFlagsBits = 95;
        v29._object = (void *)0xE100000000000000;
        String.append(_:)(v29);
        v30._countAndFlagsBits = v17;
        v30._object = v18;
        String.append(_:)(v30);
      }
      else
      {
        v22 = SGDataType.stringValue.getter(v49[0]);
        v24 = v23;
        outlined retain of NodeData(v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined copy of NodeData);
        v25._countAndFlagsBits = v22;
        v25._object = v24;
        String.append(_:)(v25);
        swift_bridgeObjectRelease();
        v26._countAndFlagsBits = 95;
        v26._object = (void *)0xE100000000000000;
        String.append(_:)(v26);
        SGDataTypeStorage.valueString.getter();
        String.append(_:)(v27);
      }
      swift_bridgeObjectRelease();
      outlined retain of NodeData(v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined consume of NodeData);
      v14 = 24419;
      v13 = 0xE200000000000000;
    }
  }
  else
  {
    v14 = v49[0];
    v13 = v49[1];
    swift_bridgeObjectRetain();
  }
  v31 = v14;
  v32 = (void *)v13;
  result._object = v32;
  result._countAndFlagsBits = v31;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NodeData(uint64_t a1, uint64_t a2)
{
  _BYTE v4[96];
  _BYTE v5[96];

  outlined init with take of NodeData(a1, (uint64_t)v4);
  outlined init with take of NodeData(a2, (uint64_t)v5);
  return specialized static NodeData.== infix(_:_:)((uint64_t)v4, (uint64_t)v5) & 1;
}

ShaderGraph::NodeData::CodingKeys_optional __swiftcall NodeData.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = stringValue._object;
  v2._countAndFlagsBits = stringValue._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of NodeData.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3)
    return (ShaderGraph::NodeData::CodingKeys_optional)3;
  else
    return (ShaderGraph::NodeData::CodingKeys_optional)v3;
}

ShaderGraph::NodeData::CodingKeys_optional __swiftcall NodeData.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  return (ShaderGraph::NodeData::CodingKeys_optional)3;
}

uint64_t NodeData.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t NodeData.CodingKeys.rawValue.getter(char a1)
{
  if (!a1)
    return 0x656D614E65736163;
  if (a1 == 1)
    return 0x65756C6176;
  return 1701869940;
}

uint64_t NodeData.CodingKeys.stringValue.getter(char a1)
{
  if (!a1)
    return 0x656D614E65736163;
  if (a1 == 1)
    return 0x65756C6176;
  return 1701869940;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NodeData.CodingKeys(_BYTE *a1, _BYTE *a2)
{
  int v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;

  v2 = *a1;
  v3 = 0xE500000000000000;
  v4 = 0x65756C6176;
  if (v2 != 1)
  {
    v4 = 1701869940;
    v3 = 0xE400000000000000;
  }
  if (*a1)
    v5 = v4;
  else
    v5 = 0x656D614E65736163;
  if (v2)
    v6 = v3;
  else
    v6 = 0xE800000000000000;
  v7 = 0xE500000000000000;
  v8 = 0x65756C6176;
  if (*a2 != 1)
  {
    v8 = 1701869940;
    v7 = 0xE400000000000000;
  }
  if (*a2)
    v9 = v8;
  else
    v9 = 0x656D614E65736163;
  if (*a2)
    v10 = v7;
  else
    v10 = 0xE800000000000000;
  if (v5 == v9 && v6 == v10)
    v11 = 1;
  else
    v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance NodeData.CodingKeys()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance NodeData.CodingKeys()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance NodeData.CodingKeys()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance NodeData.CodingKeys@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = specialized NodeData.CodingKeys.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance NodeData.CodingKeys(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE800000000000000;
  v4 = 0xE500000000000000;
  v5 = 0x65756C6176;
  if (v2 != 1)
  {
    v5 = 1701869940;
    v4 = 0xE400000000000000;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x656D614E65736163;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance NodeData.CodingKeys()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x65756C6176;
  if (*v0 != 1)
    v1 = 1701869940;
  if (*v0)
    return v1;
  else
    return 0x656D614E65736163;
}

unint64_t protocol witness for CodingKey.init(stringValue:) in conformance NodeData.CodingKeys@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = specialized NodeData.CodingKeys.init(rawValue:)(a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance NodeData.CodingKeys()
{
  lazy protocol witness table accessor for type NodeData.CodingKeys and conformance NodeData.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance NodeData.CodingKeys()
{
  lazy protocol witness table accessor for type NodeData.CodingKeys and conformance NodeData.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t NodeData.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  _QWORD v5[12];

  result = specialized NodeData.init(from:)(a1, v5);
  if (!v2)
    return outlined init with take of NodeData((uint64_t)v5, a2);
  return result;
}

void NodeData.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
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
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  char v48;
  _QWORD v49[10];
  char v50;
  _QWORD v51[10];
  unsigned __int8 v52;
  char v53;

  v2 = v1;
  outlined init with take of NodeData(v2, (uint64_t)v49);
  v4 = (void *)v49[0];
  v35 = (id)v49[3];
  v36 = (id)v49[2];
  v33 = v49[5];
  v34 = v49[4];
  v31 = v49[7];
  v32 = v49[6];
  v29 = v49[9];
  v30 = v49[8];
  v5 = v50;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<NodeData.CodingKeys>);
  v38 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type NodeData.CodingKeys and conformance NodeData.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v37 = v2;
  outlined init with take of NodeData(v2, (uint64_t)v51);
  v9 = v52 >> 6;
  if (!v9)
  {
    v52 &= 0x3Fu;
    LOBYTE(v40) = 0;
    v14 = v39;
    KeyedEncodingContainer.encode(_:forKey:)();
    v13 = v14;
    if (!v14)
    {
      LOBYTE(v40) = 1;
      KeyedEncodingContainer.encode(_:forKey:)();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v8, v6);
      return;
    }
    (*(void (**)(char *, uint64_t))(v38 + 8))(v8, v6);
LABEL_10:
    type metadata accessor for SGError();
    v21 = v13;
    SGError.__allocating_init(_:)(v13);
    swift_willThrow();

    return;
  }
  if (v9 != 1)
  {
    v15 = v52 & 0x3F;
    v52 &= 0x3Fu;
    v27 = v51[3];
    v28 = v51[0];
    v25 = v51[4];
    v26 = v51[2];
    v23 = v51[6];
    v24 = v51[5];
    v16 = (void *)v51[8];
    v22 = v51[7];
    v17 = (void *)v51[9];
    LOBYTE(v40) = 0;
    outlined copy of SGDataTypeStorage(v36, v35, v34, v33, v32, v31, v30, v29, v5 & 0x3F);
    v18 = v39;
    KeyedEncodingContainer.encode(_:forKey:)();
    v13 = v18;
    if (!v18)
    {
      v35 = v17;
      v36 = v16;
      LODWORD(v39) = v15;
      v20 = v26;
      v19 = v27;
      v40 = v28;
      v53 = 2;
      type metadata accessor for SGDataType(0);
      lazy protocol witness table accessor for type SGDataType and conformance SGDataType(&lazy protocol witness table cache variable for type SGDataType and conformance SGDataType, (uint64_t (*)(uint64_t))type metadata accessor for SGDataType, (uint64_t)&protocol conformance descriptor for SGDataType);
      KeyedEncodingContainer.encode<A>(_:forKey:)();
      v40 = v20;
      v41 = v19;
      v42 = v25;
      v43 = v24;
      v44 = v23;
      v45 = v22;
      v46 = v36;
      v47 = v35;
      v48 = (char)v39;
      v53 = 1;
      lazy protocol witness table accessor for type SGDataTypeStorage and conformance SGDataTypeStorage();
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v52 &= 0x3Fu;
  v10 = v51[0];
  LOBYTE(v40) = 0;
  v11 = v4;
  v12 = v39;
  KeyedEncodingContainer.encode(_:forKey:)();
  v13 = v12;
  if (v12)
  {
LABEL_9:
    (*(void (**)(char *, uint64_t))(v38 + 8))(v8, v6);
    outlined retain of NodeData(v37, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined consume of NodeData);
    goto LABEL_10;
  }
  v40 = v10;
  v53 = 1;
  type metadata accessor for SGGraph();
  lazy protocol witness table accessor for type SGDataType and conformance SGDataType(&lazy protocol witness table cache variable for type SGGraph and conformance SGGraph, (uint64_t (*)(uint64_t))type metadata accessor for SGGraph, (uint64_t)&protocol conformance descriptor for SGGraph);
LABEL_12:
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v8, v6);
  outlined retain of NodeData(v37, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined consume of NodeData);
}

uint64_t protocol witness for Decodable.init(from:) in conformance NodeData@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  _QWORD v5[12];

  result = specialized NodeData.init(from:)(a1, v5);
  if (!v2)
    return outlined init with take of NodeData((uint64_t)v5, a2);
  return result;
}

void protocol witness for Encodable.encode(to:) in conformance NodeData(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;

  outlined init with take of NodeData(v1, (uint64_t)&v3);
  NodeData.encode(to:)(a1);
}

uint64_t specialized static NodeData.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v4;
  char v5;
  __int128 v6;
  __int128 v7;
  char v8;
  uint64_t v9;
  unint64_t v10;
  __n128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v18;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __n128 v23;
  __n128 v24;
  unsigned __int8 v25;
  __int128 v26;
  __int128 v27;
  __n128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned __int8 v33;
  __n128 v34;
  __n128 v35[2];
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  __int128 v41;
  __int128 v42;
  __n128 v43[2];
  char v44;

  outlined init with take of NodeData(a1, (uint64_t)&v26);
  v4 = v33 >> 6;
  if (!v4)
  {
    v33 &= 0x3Fu;
    v41 = v26;
    v42 = v27;
    v43[0] = v28;
    outlined init with take of NodeData(a2, (uint64_t)&v20);
    if (v25 > 0x3Fu)
      goto LABEL_21;
    v6 = v21;
    v7 = v22;
    if (v41 != v20 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
      goto LABEL_21;
    if ((specialized static Array<A>.== infix(_:_:)(v42, v6) & 1) == 0
      || (specialized static Array<A>.== infix(_:_:)(*((_QWORD **)&v42 + 1), *((_QWORD **)&v6 + 1)) & 1) == 0)
    {
      goto LABEL_21;
    }
    outlined init with take of MaterialXAvailability(v43, &v34);
    outlined init with take of MaterialXAvailability(&v34, v35);
    if (v35[0].n128_u64[1] == 2)
    {
      if (*((_QWORD *)&v7 + 1) != 2)
        goto LABEL_21;
    }
    else if (v35[0].n128_u64[1] == 1)
    {
      if (*((_QWORD *)&v7 + 1) != 1)
        goto LABEL_21;
    }
    else
    {
      if ((unint64_t)(*((_QWORD *)&v7 + 1) - 1) < 2)
        goto LABEL_21;
      if (v35[0].n128_u64[1])
      {
        if (!*((_QWORD *)&v7 + 1) || *(_OWORD *)v35 != v7 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
          goto LABEL_21;
      }
      else if (*((_QWORD *)&v7 + 1))
      {
        outlined release of MaterialXAvailability((uint64_t *)&v34);
        goto LABEL_21;
      }
    }
    v16 = 1;
    return v16 & 1;
  }
  if (v4 != 1)
  {
    v8 = v33 & 0x3F;
    v33 &= 0x3Fu;
    v9 = v26;
    v10 = *((_QWORD *)&v27 + 1);
    v11 = v28;
    v12 = v29;
    v13 = v30;
    v14 = v31;
    v18 = v32;
    v19 = v27;
    outlined init with take of NodeData(a2, (uint64_t)&v20);
    if ((v25 & 0xC0) == 0x80)
    {
      v15 = v25 & 0x3F;
      v25 &= 0x3Fu;
      if (v9 == (_QWORD)v20)
      {
        v35[0].n128_u64[0] = v19;
        v35[0].n128_u64[1] = v10;
        v35[1] = v11;
        v36 = v12;
        v37 = v13;
        v38 = v14;
        v39 = v18;
        v40 = v8;
        v41 = v21;
        v42 = v22;
        v43[0] = v23;
        v43[1] = v24;
        v44 = v15;
        outlined retain of NodeData(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined copy of NodeData);
        outlined retain of NodeData(a2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined copy of NodeData);
        specialized static SGDataTypeStorage.== infix(_:_:)((uint64_t)v35);
        goto LABEL_17;
      }
    }
LABEL_21:
    v16 = 0;
    return v16 & 1;
  }
  v33 &= 0x3Fu;
  outlined init with take of NodeData(a2, (uint64_t)&v20);
  if ((v25 & 0xC0) != 0x40)
    goto LABEL_21;
  v25 &= 0x3Fu;
  type metadata accessor for NSObject();
  outlined retain of NodeData(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined copy of NodeData);
  outlined retain of NodeData(a2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined copy of NodeData);
  v5 = static NSObject.== infix(_:_:)();
LABEL_17:
  v16 = v5;
  outlined retain of NodeData(a2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined consume of NodeData);
  outlined retain of NodeData(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined consume of NodeData);
  return v16 & 1;
}

unint64_t specialized NodeData.CodingKeys.init(rawValue:)(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of NodeData.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3)
    return 3;
  else
    return v3;
}

uint64_t specialized NodeData.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
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
  BOOL v31;
  _QWORD *v32;
  char *v33;
  __int128 v34;
  _OWORD *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  char v46;
  __int128 v47;
  _OWORD *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  _OWORD v68[13];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[6];
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;

  v3 = v2;
  v90 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<NodeData.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type NodeData.CodingKeys and conformance NodeData.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {
    v13 = (uint64_t)a1;
LABEL_4:
    type metadata accessor for SGError();
    v14 = v3;
    SGError.__allocating_init(_:)(v3);
    swift_willThrow();

    return __swift_destroy_boxed_opaque_existential_1Tm(v13);
  }
  v67 = v6;
  LOBYTE(v69) = 0;
  v10 = KeyedDecodingContainer.decode(_:forKey:)();
  v12 = v5;
  v16 = v10;
  v17 = v11;
  v18 = v10 == 0x6E49746C697562 && v11 == 0xE700000000000000;
  v13 = (uint64_t)v9;
  if (!v18 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    v31 = v16 == 0x6870617267 && v17 == 0xE500000000000000;
    if (v31 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      type metadata accessor for SGGraph();
      LOBYTE(v68[0]) = 1;
      lazy protocol witness table accessor for type SGDataType and conformance SGDataType(&lazy protocol witness table cache variable for type SGGraph and conformance SGGraph, (uint64_t (*)(uint64_t))type metadata accessor for SGGraph, (uint64_t)&protocol conformance descriptor for SGGraph);
      KeyedDecodingContainer.decode<A>(_:forKey:)();
      (*(void (**)(char *, uint64_t))(v67 + 8))(v8, v12);
      v25 = 0;
      v64 = 0;
      v65 = 0;
      v28 = 0;
      v27 = 0;
      v29 = 0;
      v30 = 0;
      v66 = 0;
      v67 = 0;
      v63 = v69;
      v62 = 64;
      goto LABEL_20;
    }
    if (v16 == 0x746E6174736E6F63 && v17 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v46 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v46 & 1) == 0)
      {
        _s11ShaderGraph15SGInternalErrorV0D4TypeOWOi5_((uint64_t)v68);
        outlined init with take of SGInternalError.ErrorType(v68, &v69);
        lazy protocol witness table accessor for type SGInternalError and conformance SGInternalError();
        v82 = 0uLL;
        v3 = (void *)swift_allocError();
        v47 = v70;
        *v48 = v69;
        v48[1] = v47;
        v49 = v74;
        v51 = v71;
        v50 = v72;
        v48[4] = v73;
        v48[5] = v49;
        v48[2] = v51;
        v48[3] = v50;
        v52 = v78;
        v54 = v75;
        v53 = v76;
        v48[8] = v77;
        v48[9] = v52;
        v48[6] = v54;
        v48[7] = v53;
        v55 = v82;
        v57 = v79;
        v56 = v80;
        v48[12] = v81;
        v48[13] = v55;
        v48[10] = v57;
        v48[11] = v56;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v67 + 8))(v8, v12);
        goto LABEL_4;
      }
    }
    LOBYTE(v68[0]) = 1;
    lazy protocol witness table accessor for type SGDataTypeStorage and conformance SGDataTypeStorage();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    v64 = v70;
    v65 = v69;
    v58 = v71;
    v60 = *((_QWORD *)&v70 + 1);
    v61 = *((_QWORD *)&v69 + 1);
    v30 = *((_QWORD *)&v71 + 1);
    v66 = (char *)*((_QWORD *)&v72 + 1);
    v59 = v72;
    v62 = v73;
    type metadata accessor for SGDataType(0);
    LOBYTE(v68[0]) = 2;
    lazy protocol witness table accessor for type SGDataType and conformance SGDataType(&lazy protocol witness table cache variable for type SGDataType and conformance SGDataType, (uint64_t (*)(uint64_t))type metadata accessor for SGDataType, (uint64_t)&protocol conformance descriptor for SGDataType);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v67 + 8))(v8, v12);
    v67 = v59;
    v25 = 0;
    v63 = v69;
    v62 |= 0xFFFFFF80;
    v27 = v60;
    v28 = v61;
    v29 = v58;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  LOBYTE(v69) = 1;
  v19 = KeyedDecodingContainer.decode(_:forKey:)();
  v21 = v20;
  v66 = v8;
  if (one-time initialization token for shared != -1)
    swift_once();
  v22 = *(_QWORD *)(static BuiltInDefinitionStore.shared + 40);
  v23 = *(_QWORD **)(static BuiltInDefinitionStore.shared + 48);
  v24 = *(_QWORD *)(static BuiltInDefinitionStore.shared + 56);
  swift_bridgeObjectRetain();
  specialized OrderedDictionary.subscript.getter(v19, v21, v22, v23, v24, v83);
  swift_bridgeObjectRelease();
  outlined init with take of BuiltInDefinition?((uint64_t)v83, (uint64_t)&v84);
  v25 = v85;
  if (!v85)
  {
    _s11ShaderGraph15SGInternalErrorV0D4TypeOWOi4_((uint64_t)v68);
    outlined init with take of SGInternalError.ErrorType(v68, &v69);
    *(_QWORD *)&v82 = v19;
    *((_QWORD *)&v82 + 1) = v21;
    lazy protocol witness table accessor for type SGInternalError and conformance SGInternalError();
    v3 = (void *)swift_allocError();
    v34 = v70;
    *v35 = v69;
    v35[1] = v34;
    v36 = v74;
    v38 = v71;
    v37 = v72;
    v35[4] = v73;
    v35[5] = v36;
    v35[2] = v38;
    v35[3] = v37;
    v39 = v78;
    v41 = v75;
    v40 = v76;
    v35[8] = v77;
    v35[9] = v39;
    v35[6] = v41;
    v35[7] = v40;
    v42 = v82;
    v44 = v79;
    v43 = v80;
    v35[12] = v81;
    v35[13] = v42;
    v35[10] = v44;
    v35[11] = v43;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v67 + 8))(v66, v12);
    goto LABEL_4;
  }
  v26 = v87;
  v65 = v86;
  v27 = v89;
  v63 = v84;
  v64 = v88;
  (*(void (**)(char *, uint64_t))(v67 + 8))(v66, v12);
  v28 = v26;
  swift_bridgeObjectRelease();
  v29 = 0;
  v30 = 0;
  v66 = 0;
  v67 = 0;
  v62 = 0;
LABEL_20:
  result = __swift_destroy_boxed_opaque_existential_1Tm(v13);
  v32 = v90;
  *v90 = v63;
  v32[1] = v25;
  v32[2] = v65;
  v32[3] = v28;
  v32[4] = v64;
  v32[5] = v27;
  v32[6] = v29;
  v32[7] = v30;
  v33 = v66;
  v32[8] = v67;
  v32[9] = v33;
  *((_BYTE *)v32 + 80) = v62;
  return result;
}

unint64_t lazy protocol witness table accessor for type NodeData.CodingKeys and conformance NodeData.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type NodeData.CodingKeys and conformance NodeData.CodingKeys;
  if (!lazy protocol witness table cache variable for type NodeData.CodingKeys and conformance NodeData.CodingKeys)
  {
    result = MEMORY[0x24954C264](&protocol conformance descriptor for NodeData.CodingKeys, &type metadata for NodeData.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type NodeData.CodingKeys and conformance NodeData.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type NodeData.CodingKeys and conformance NodeData.CodingKeys;
  if (!lazy protocol witness table cache variable for type NodeData.CodingKeys and conformance NodeData.CodingKeys)
  {
    result = MEMORY[0x24954C264](&protocol conformance descriptor for NodeData.CodingKeys, &type metadata for NodeData.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type NodeData.CodingKeys and conformance NodeData.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type NodeData.CodingKeys and conformance NodeData.CodingKeys;
  if (!lazy protocol witness table cache variable for type NodeData.CodingKeys and conformance NodeData.CodingKeys)
  {
    result = MEMORY[0x24954C264](&protocol conformance descriptor for NodeData.CodingKeys, &type metadata for NodeData.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type NodeData.CodingKeys and conformance NodeData.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type NodeData.CodingKeys and conformance NodeData.CodingKeys;
  if (!lazy protocol witness table cache variable for type NodeData.CodingKeys and conformance NodeData.CodingKeys)
  {
    result = MEMORY[0x24954C264](&protocol conformance descriptor for NodeData.CodingKeys, &type metadata for NodeData.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type NodeData.CodingKeys and conformance NodeData.CodingKeys);
  }
  return result;
}

void destroy for NodeData(uint64_t a1)
{
  outlined consume of NodeData(*(void **)a1, *(_QWORD *)(a1 + 8), *(void **)(a1 + 16), *(id *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_BYTE *)(a1 + 80));
}

uint64_t initializeWithCopy for NodeData(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  unsigned __int8 v14;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(void **)(a2 + 16);
  v6 = *(void **)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v13 = *(_QWORD *)(a2 + 72);
  v14 = *(_BYTE *)(a2 + 80);
  outlined copy of NodeData(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v13;
  *(_BYTE *)(a1 + 80) = v14;
  return a1;
}

uint64_t assignWithCopy for NodeData(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 v22;
  uint64_t v24;
  unsigned __int8 v25;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(void **)(a2 + 16);
  v6 = *(void **)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v24 = *(_QWORD *)(a2 + 72);
  v25 = *(_BYTE *)(a2 + 80);
  outlined copy of NodeData(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v24, v25);
  v12 = *(void **)a1;
  v13 = *(_QWORD *)(a1 + 8);
  v14 = *(void **)(a1 + 16);
  v15 = *(void **)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 56);
  v20 = *(_QWORD *)(a1 + 64);
  v21 = *(_QWORD *)(a1 + 72);
  v22 = *(_BYTE *)(a1 + 80);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v24;
  *(_BYTE *)(a1 + 80) = v25;
  outlined consume of NodeData(v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
  return a1;
}

__n128 __swift_memcpy81_16(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for NodeData(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;
  __int128 v15;
  __int128 v16;

  v3 = *(_BYTE *)(a2 + 80);
  v4 = *(void **)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(void **)(a1 + 16);
  v7 = *(void **)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 72);
  v14 = *(_BYTE *)(a1 + 80);
  v15 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v15;
  v16 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v16;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = v3;
  outlined consume of NodeData(v4, v6, v5, v7, v8, v9, v10, v11, v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for NodeData(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 6 && *(_BYTE *)(a1 + 81))
    return (*(_DWORD *)a1 + 6);
  v3 = ((*(unsigned __int8 *)(a1 + 80) >> 3) & 4 | (*(unsigned __int8 *)(a1 + 80) >> 6)) ^ 7;
  if (v3 >= 5)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for NodeData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 5)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 80) = 0;
    *(_QWORD *)result = a2 - 6;
    if (a3 >= 6)
      *(_BYTE *)(result + 81) = 1;
  }
  else
  {
    if (a3 >= 6)
      *(_BYTE *)(result + 81) = 0;
    if (a2)
    {
      *(_OWORD *)(result + 48) = 0u;
      *(_OWORD *)(result + 64) = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(_OWORD *)(result + 32) = 0u;
      *(_OWORD *)result = 0u;
      *(_BYTE *)(result + 80) = 32 * (((-a2 & 4) != 0) - 2 * a2);
    }
  }
  return result;
}

uint64_t getEnumTag for NodeData(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 80) >> 6;
}

uint64_t destructiveProjectEnumData for NodeData(uint64_t result)
{
  *(_BYTE *)(result + 80) &= 0x3Fu;
  return result;
}

uint64_t destructiveInjectEnumTag for NodeData(uint64_t result, char a2)
{
  *(_BYTE *)(result + 80) = *(_BYTE *)(result + 80) & 0x1F | (a2 << 6);
  return result;
}

ValueMetadata *type metadata accessor for NodeData()
{
  return &type metadata for NodeData;
}

uint64_t storeEnumTagSinglePayload for NodeData.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_245FBBF3C + 4 * byte_245FC611D[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_245FBBF70 + 4 * asc_245FC6118[v4]))();
}

uint64_t sub_245FBBF70(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245FBBF78(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245FBBF80);
  return result;
}

uint64_t sub_245FBBF8C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245FBBF94);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_245FBBF98(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245FBBFA0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NodeData.CodingKeys()
{
  return &type metadata for NodeData.CodingKeys;
}

double _s11ShaderGraph15SGInternalErrorV0D4TypeOWOi5_(uint64_t a1)
{
  double result;

  *(_QWORD *)a1 = 2;
  result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_QWORD *)(a1 + 168) = 0x200000000000000;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  return result;
}

double _s11ShaderGraph15SGInternalErrorV0D4TypeOWOi4_(uint64_t a1)
{
  double result;

  *(_QWORD *)a1 = 1;
  result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_QWORD *)(a1 + 168) = 0x200000000000000;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  return result;
}

unint64_t type metadata accessor for NSObject()
{
  unint64_t result;

  result = lazy cache variable for type metadata for NSObject;
  if (!lazy cache variable for type metadata for NSObject)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSObject);
  }
  return result;
}

uint64_t OrderedSet<>.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v9;
  _BYTE v10[24];
  uint64_t v11;
  uint64_t v12;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  v12 = a3;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v10, v11);
  v7 = type metadata accessor for ContiguousArray();
  v9 = a5;
  MEMORY[0x24954C264](MEMORY[0x24BEE2A30], v7, &v9);
  dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v10);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance <> OrderedSet<A>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return OrderedSet<>.encode(to:)(a1, a2, *(_QWORD *)(v3 + 8), *(_QWORD *)(a2 + 16), *(_QWORD *)(a3 - 8));
}

uint64_t OrderedSet<>.init(from:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  Swift::String v19;
  Swift::String v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];
  uint64_t v34;
  _QWORD v35[3];
  uint64_t v36;
  uint64_t v37;

  v31 = a3;
  v32 = a2;
  v7 = type metadata accessor for DecodingError.Context();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (uint64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Decoder.singleValueContainer()();
  if (v4)
    goto LABEL_8;
  v28 = v10;
  v29 = v8;
  v30 = v7;
  __swift_project_boxed_opaque_existential_1(v35, v36);
  v12 = type metadata accessor for ContiguousArray();
  v37 = v31;
  MEMORY[0x24954C264](MEMORY[0x24BEE2A50], v12, &v37);
  dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)();
  v13 = v33[0];
  v34 = v33[0];
  v14 = specialized default argument 1 of OrderedSet._extractSubset(using:extraCapacity:)();
  v15 = (uint64_t (*)(char *, uint64_t, uint64_t))MEMORY[0x24954C264](MEMORY[0x24BEE2A58], v12);
  v16 = static _HashTable.create<A>(untilFirstDuplicateIn:scale:reservedScale:)((uint64_t)v33, (uint64_t)&v34, 0, 1, v14, v12, v15, a4);
  v17 = v33[0];
  if (v33[0] != *(_QWORD *)(v13 + 16))
  {
    swift_release();
    __swift_project_boxed_opaque_existential_1(v35, v36);
    dispatch thunk of UnkeyedDecodingContainer.codingPath.getter();
    v33[0] = 0;
    v33[1] = 0xE000000000000000;
    _StringGuts.grow(_:)(61);
    v19._object = (void *)0x8000000245FCE8E0;
    v19._countAndFlagsBits = 0xD00000000000003ALL;
    String.append(_:)(v19);
    v34 = v17;
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    v20._countAndFlagsBits = 41;
    v20._object = (void *)0xE100000000000000;
    String.append(_:)(v20);
    v21 = v28;
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    v11 = type metadata accessor for DecodingError();
    swift_allocError();
    v23 = v22;
    v24 = v29;
    v25 = v30;
    (*(void (**)(uint64_t, char *, uint64_t))(v29 + 16))(v22, v21, v30);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(v23, *MEMORY[0x24BEE26D8], v11);
    swift_willThrow();
    swift_release();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v21, v25);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v35);
LABEL_8:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    return v11;
  }
  if (ContiguousArray.count.getter() < 16)
  {
    v18 = 0;
  }
  else
  {
    swift_retain();
    v18 = v16;
  }
  v11 = OrderedSet.init(_uniqueElements:_:)(v13, v18);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v35);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  return v11;
}

uint64_t protocol witness for Decodable.init(from:) in conformance <> OrderedSet<A>@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v7;

  result = OrderedSet<>.init(from:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a3 - 8), *(_QWORD *)(a2 + 24));
  if (!v4)
  {
    *a4 = result;
    a4[1] = v7;
  }
  return result;
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t JSONDecoder.init()()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t CharacterSet.init(charactersIn:)()
{
  return MEMORY[0x24BDCB630]();
}

uint64_t static CharacterSet.whitespacesAndNewlines.getter()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t type metadata accessor for CharacterSet()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t __DataStorage._length.getter()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t __DataStorage._offset.getter()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t dispatch thunk of PropertyListDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t PropertyListDecoder.init()()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t type metadata accessor for PropertyListDecoder()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t dispatch thunk of PropertyListEncoder.encode<A>(_:)()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t PropertyListEncoder.init()()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t type metadata accessor for PropertyListEncoder()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t type metadata accessor for NSFastEnumerationIterator()
{
  return MEMORY[0x24BDCD520]();
}

uint64_t URL.pathExtension.getter()
{
  return MEMORY[0x24BDCD810]();
}

uint64_t URL.init(fileURLWithPath:relativeTo:)()
{
  return MEMORY[0x24BDCD858]();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return MEMORY[0x24BDCD870]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
  MEMORY[0x24BDCD8D0](retstr);
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return MEMORY[0x24BDCD918]();
}

uint64_t URL.appendingPathComponent(_:)()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t URL.appendingPathExtension(_:)()
{
  return MEMORY[0x24BDCD938]();
}

uint64_t static URL.== infix(_:_:)()
{
  return MEMORY[0x24BDCD988]();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t URL.path.getter()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t Data.init(contentsOf:options:)()
{
  return MEMORY[0x24BDCDB78]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x24BDCDCA0]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t Data.write(to:options:)()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t Date.timeIntervalSinceReferenceDate.getter()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t Date.init()()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t type metadata accessor for Locale()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t static _CFObject.== infix(_:_:)()
{
  return MEMORY[0x24BEE5118]();
}

uint64_t _CFObject.hash(into:)()
{
  return MEMORY[0x24BEE5120]();
}

uint64_t _CFObject.hashValue.getter()
{
  return MEMORY[0x24BEE5130]();
}

uint64_t OSSignpostID.init(log:)()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return MEMORY[0x24BEE7738]();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t OSSignposter.logHandle.getter()
{
  return MEMORY[0x24BEE77C0]();
}

uint64_t OSSignposter.init(subsystem:category:)()
{
  return MEMORY[0x24BEE77C8]();
}

uint64_t type metadata accessor for OSSignposter()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t type metadata accessor for OSSignpostError()
{
  return MEMORY[0x24BEE7818]();
}

uint64_t OSSignpostIntervalState.signpostID.getter()
{
  return MEMORY[0x24BEE7848]();
}

uint64_t OSSignpostIntervalState.init(id:isOpen:)()
{
  return MEMORY[0x24BEE7868]();
}

uint64_t type metadata accessor for OSSignpostIntervalState()
{
  return MEMORY[0x24BEE7870]();
}

uint64_t checkForErrorAndConsumeState(state:)()
{
  return MEMORY[0x24BEE78A0]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t dispatch thunk of HashFunction.update(bufferPointer:)()
{
  return MEMORY[0x24BDC62A8]();
}

uint64_t dispatch thunk of HashFunction.finalize()()
{
  return MEMORY[0x24BDC62B0]();
}

uint64_t dispatch thunk of HashFunction.init()()
{
  return MEMORY[0x24BDC62C8]();
}

uint64_t SHA512Digest.hash(into:)()
{
  return MEMORY[0x24BDC6340]();
}

uint64_t type metadata accessor for SHA512Digest()
{
  return MEMORY[0x24BDC6348]();
}

uint64_t type metadata accessor for SHA512()
{
  return MEMORY[0x24BDC6B38]();
}

uint64_t Dictionary.init()()
{
  return MEMORY[0x24BEE01A8]();
}

uint64_t Array.init()()
{
  return MEMORY[0x24BEE01B8]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x24BDCF808]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCF830]();
}

Swift::Void __swiftcall Dictionary.reserveCapacity(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE0298](a1);
}

uint64_t type metadata accessor for Dictionary.Keys()
{
  return MEMORY[0x24BEE0300]();
}

uint64_t type metadata accessor for Dictionary()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t Dictionary.subscript.setter()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t Character.write<A>(to:)()
{
  return MEMORY[0x24BEE06E8]();
}

uint64_t dispatch thunk of BidirectionalCollection.formIndex(before:)()
{
  return MEMORY[0x24BEE0760]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t dispatch thunk of MutableCollection.swapAt(_:_:)()
{
  return MEMORY[0x24BEE0818]();
}

uint64_t MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:)()
{
  return MEMORY[0x24BEE0838]();
}

uint64_t MutableCollection.swapAt(_:_:)()
{
  return MEMORY[0x24BEE0840]();
}

uint64_t MutableCollection<>.reverse()()
{
  return MEMORY[0x24BEE0860]();
}

uint64_t MutableCollection<>.partition(by:)()
{
  return MEMORY[0x24BEE0868]();
}

uint64_t MutableCollection<>.sort()()
{
  return MEMORY[0x24BEE0870]();
}

uint64_t MutableCollection<>.sort(by:)()
{
  return MEMORY[0x24BEE0878]();
}

uint64_t MutableCollection<>.shuffle<A>(using:)()
{
  return MEMORY[0x24BEE0880]();
}

uint64_t type metadata accessor for ClosedRange()
{
  return MEMORY[0x24BEE08B8]();
}

uint64_t ObjectIdentifier.debugDescription.getter()
{
  return MEMORY[0x24BEE0920]();
}

uint64_t ObjectIdentifier.hashValue.getter()
{
  return MEMORY[0x24BEE0930]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t UnsafeBufferPointer.baseAddress.getter()
{
  return MEMORY[0x24BEE0990]();
}

uint64_t type metadata accessor for UnsafeBufferPointer()
{
  return MEMORY[0x24BEE09B0]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t String.init<A>(reflecting:)()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t String.index(after:)()
{
  return MEMORY[0x24BEE0B70]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BB8](a1._countAndFlagsBits, a1._object);
}

{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

Swift::String_optional __swiftcall String.Iterator.next()()
{
  uint64_t v0;
  void *v1;
  Swift::String_optional result;

  v0 = MEMORY[0x24BEE0C00]();
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t String.UTF8View._foreignDistance(from:to:)()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x24BEE0CA0]();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return MEMORY[0x24BEE0CC8](a1._countAndFlagsBits, a1._object);
}

Swift::Bool __swiftcall String.hasSuffix(_:)(Swift::String a1)
{
  return MEMORY[0x24BEE0CD0](a1._countAndFlagsBits, a1._object);
}

Swift::String __swiftcall String.init(repeating:count:)(Swift::String repeating, Swift::Int count)
{
  uint64_t v2;
  void *v3;
  Swift::String result;

  v2 = MEMORY[0x24BEE0CE8](repeating._countAndFlagsBits, repeating._object, count);
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

{
  uint64_t v2;
  void *v3;
  Swift::String result;

  v2 = MEMORY[0x24BEE0CF0](repeating._countAndFlagsBits, repeating._object, count);
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

uint64_t String.init<A>(_:radix:uppercase:)()
{
  return MEMORY[0x24BEE0D58]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x24BEE0D98]();
}

{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t dispatch thunk of Sequence.underestimatedCount.getter()
{
  return MEMORY[0x24BEE0DF8]();
}

uint64_t Sequence<>.makeIterator()()
{
  return MEMORY[0x24BEE0E30]();
}

uint64_t Sequence._copyContents(initializing:)()
{
  return MEMORY[0x24BEE0E50]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t Sequence.lazy.getter()
{
  return MEMORY[0x24BEE0E90]();
}

uint64_t Sequence.filter(_:)()
{
  return MEMORY[0x24BEE0EA0]();
}

uint64_t Sequence.sorted(by:)()
{
  return MEMORY[0x24BEE0EC0]();
}

uint64_t Sequence.forEach(_:)()
{
  return MEMORY[0x24BEE0EE0]();
}

uint64_t Sequence<>.elementsEqual<A>(_:)()
{
  return MEMORY[0x24BEE0F20]();
}

uint64_t Sequence<>.contains(_:)()
{
  return MEMORY[0x24BEE0F30]();
}

uint64_t Sequence<>.joined(separator:)()
{
  return MEMORY[0x24BEE0F40]();
}

uint64_t dispatch thunk of RangeExpression.relative<A>(to:)()
{
  return MEMORY[0x24BEE0FB8]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x24BDCFBA8]();
}

uint64_t static Array._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCFBC0]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t Array._checkSubscript(_:wasNativeTypeChecked:)()
{
  return MEMORY[0x24BEE1140]();
}

Swift::Void __swiftcall Array.reserveCapacity(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE1150](a1);
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t Array.withUnsafeBufferPointer<A>(_:)()
{
  return MEMORY[0x24BEE1188]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x24BEE1190]();
}

Swift::Bool __swiftcall Array._hoistableIsNativeTypeChecked()()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t Array.endIndex.getter()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t Array.init<A>(_:)()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t Array.subscript.getter()
{
  return MEMORY[0x24BEE1308]();
}

uint64_t Double.description.getter()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t Double.write<A>(to:)()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t Float.description.getter()
{
  return MEMORY[0x24BEE1488]();
}

uint64_t Float.write<A>(to:)()
{
  return MEMORY[0x24BEE14C8]();
}

uint64_t Set.init(minimumCapacity:)()
{
  return MEMORY[0x24BEE15D8]();
}

Swift::Void __swiftcall Set.reserveCapacity(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE15E0](a1);
}

uint64_t Set.count.getter()
{
  return MEMORY[0x24BEE1628]();
}

uint64_t Set.isEmpty.getter()
{
  return MEMORY[0x24BEE1668]();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t Set.contains(_:)()
{
  return MEMORY[0x24BEE1690]();
}

uint64_t Set.isSubset<A>(of:)()
{
  return MEMORY[0x24BEE16A8]();
}

uint64_t type metadata accessor for Set()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t dispatch thunk of RandomAccessCollection.index(_:offsetBy:)()
{
  return MEMORY[0x24BEE1850]();
}

uint64_t dispatch thunk of RandomAccessCollection.distance(from:to:)()
{
  return MEMORY[0x24BEE1860]();
}

uint64_t RandomAccessCollection<>.indices.getter()
{
  return MEMORY[0x24BEE1890]();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t dispatch thunk of Collection._failEarlyRangeCheck(_:bounds:)()
{
  return MEMORY[0x24BEE18B8]();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t dispatch thunk of Collection.index(after:)()
{
  return MEMORY[0x24BEE18D8]();
}

uint64_t dispatch thunk of Collection.indices.getter()
{
  return MEMORY[0x24BEE18F8]();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t Collection.underestimatedCount.getter()
{
  return MEMORY[0x24BEE1950]();
}

uint64_t Collection.count.getter()
{
  return MEMORY[0x24BEE1978]();
}

uint64_t Collection.isEmpty.getter()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t Collection.subscript.getter()
{
  return MEMORY[0x24BEE19E8]();
}

uint64_t Collection<>.firstIndex(of:)()
{
  return MEMORY[0x24BEE1A00]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t dispatch thunk of RangeReplaceableCollection.append(_:)()
{
  return MEMORY[0x24BEE1A50]();
}

Swift::Void __swiftcall RangeReplaceableCollection.removeFirst(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE1A80](a1);
}

uint64_t RangeReplaceableCollection.removeSubrange(_:)()
{
  return MEMORY[0x24BEE1A88]();
}

uint64_t RangeReplaceableCollection.applying(_:)()
{
  return MEMORY[0x24BEE1AF0]();
}

uint64_t RangeReplaceableCollection<>.removeLast()()
{
  return MEMORY[0x24BEE1B10]();
}

uint64_t RangeReplaceableCollection<>.removeLast(_:)()
{
  return MEMORY[0x24BEE1B18]();
}

uint64_t RangeReplaceableCollection<>.removeAll(where:)()
{
  return MEMORY[0x24BEE1B28]();
}

uint64_t dispatch thunk of RangeReplaceableCollection.init()()
{
  return MEMORY[0x24BEE1B30]();
}

uint64_t type metadata accessor for Range()
{
  return MEMORY[0x24BEE1B68]();
}

uint64_t CGColorRef.components.getter()
{
  return MEMORY[0x24BDBD758]();
}

uint64_t NSEnumerator.makeIterator()()
{
  return MEMORY[0x24BDCFE18]();
}

uint64_t NSFileManager.enumerator(at:includingPropertiesForKeys:options:errorHandler:)()
{
  return MEMORY[0x24BDCFF40]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t static os_signpost_type_t.event.getter()
{
  return MEMORY[0x24BEE7958]();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x24BEE5BB8](seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t NSObject.hash(into:)()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return MEMORY[0x24BEE7968]();
}

uint64_t UnsafeMutablePointer.initialize(from:count:)()
{
  return MEMORY[0x24BEE1BE8]();
}

uint64_t UnsafeMutablePointer.move()()
{
  return MEMORY[0x24BEE1C10]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t Optional<A>.hash(into:)()
{
  return MEMORY[0x24BEE1C80]();
}

uint64_t UnsafeMutableBufferPointer.baseAddress.getter()
{
  return MEMORY[0x24BEE1CB0]();
}

Swift::Void __swiftcall UnsafeMutableBufferPointer.swapAt(_:_:)(Swift::Int a1, Swift::Int a2)
{
  MEMORY[0x24BEE1CD8](a1, a2);
}

uint64_t UnsafeMutableBufferPointer.endIndex.getter()
{
  return MEMORY[0x24BEE1CF0]();
}

uint64_t type metadata accessor for UnsafeMutableBufferPointer()
{
  return MEMORY[0x24BEE1D08]();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t StringProtocol.capitalized.getter()
{
  return MEMORY[0x24BDD04F0]();
}

uint64_t StringProtocol.trimmingCharacters(in:)()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t StringProtocol.range<A>(of:options:range:locale:)()
{
  return MEMORY[0x24BDD0600]();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t ArraySlice._copyToContiguousArray()()
{
  return MEMORY[0x24BEE2108]();
}

uint64_t ArraySlice.startIndex.getter()
{
  return MEMORY[0x24BEE2110]();
}

uint64_t ArraySlice.withUnsafeBufferPointer<A>(_:)()
{
  return MEMORY[0x24BEE2128]();
}

Swift::Bool __swiftcall ArraySlice._hoistableIsNativeTypeChecked()()
{
  return MEMORY[0x24BEE2130]();
}

uint64_t ArraySlice.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x24BEE2138]();
}

uint64_t ArraySlice.endIndex.getter()
{
  return MEMORY[0x24BEE2148]();
}

uint64_t type metadata accessor for ArraySlice()
{
  return MEMORY[0x24BEE2150]();
}

uint64_t ArraySlice.subscript.getter()
{
  return MEMORY[0x24BEE21A0]();
}

uint64_t dispatch thunk of SetAlgebra.intersection(_:)()
{
  return MEMORY[0x24BEE2210]();
}

uint64_t SetAlgebra.isEmpty.getter()
{
  return MEMORY[0x24BEE2298]();
}

uint64_t SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t __CocoaSet.makeIterator()()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t __CocoaSet.count.getter()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t __CocoaSet.member(for:)()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t __CocoaSet.isEqual(to:)()
{
  return MEMORY[0x24BEE2350]();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t __CocoaSet.contains(_:)()
{
  return MEMORY[0x24BEE2360]();
}

uint64_t debugPrint<A>(_:separator:terminator:to:)()
{
  return MEMORY[0x24BEE2390]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return MEMORY[0x24BEE24F0]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t type metadata accessor for LazySequence()
{
  return MEMORY[0x24BEE2588]();
}

Swift::Void __swiftcall _ArrayBuffer._typeCheckSlowPath(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2648](a1);
}

uint64_t _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t type metadata accessor for DecodingError.Context()
{
  return MEMORY[0x24BEE2700]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t _ArrayProtocol.filter(_:)()
{
  return MEMORY[0x24BEE28C0]();
}

uint64_t ContiguousArray.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x24BEE2910]();
}

uint64_t ContiguousArray.withContiguousMutableStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x24BEE2918]();
}

uint64_t ContiguousArray._copyToContiguousArray()()
{
  return MEMORY[0x24BEE2920]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t ContiguousArray.init(arrayLiteral:)()
{
  return MEMORY[0x24BEE2940]();
}

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2950](a1);
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x24BEE2960]();
}

Swift::Void __swiftcall ContiguousArray._makeMutableAndUnique()()
{
  MEMORY[0x24BEE2968]();
}

uint64_t ContiguousArray.withUnsafeBufferPointer<A>(_:)()
{
  return MEMORY[0x24BEE2970]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t ContiguousArray.count.getter()
{
  return MEMORY[0x24BEE2990]();
}

uint64_t ContiguousArray.append(_:)()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t ContiguousArray.insert(_:at:)()
{
  return MEMORY[0x24BEE29C8]();
}

uint64_t ContiguousArray.remove(at:)()
{
  return MEMORY[0x24BEE29D0]();
}

Swift::Void __swiftcall ContiguousArray.removeAll(keepingCapacity:)(Swift::Bool keepingCapacity)
{
  MEMORY[0x24BEE29F0](keepingCapacity);
}

uint64_t ContiguousArray.init()()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t type metadata accessor for ContiguousArray()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t static ContiguousArray<A>.== infix(_:_:)()
{
  return MEMORY[0x24BEE2A18]();
}

uint64_t ContiguousArray.init<A>(_:)()
{
  return MEMORY[0x24BEE2A20]();
}

uint64_t ContiguousArray.subscript.getter()
{
  return MEMORY[0x24BEE2A28]();
}

{
  return MEMORY[0x24BEE2A80]();
}

uint64_t ContiguousArray.subscript.modify()
{
  return MEMORY[0x24BEE2A78]();
}

uint64_t type metadata accessor for LazyMapSequence()
{
  return MEMORY[0x24BEE2B20]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t type metadata accessor for PartialRangeFrom()
{
  return MEMORY[0x24BEE2C38]();
}

uint64_t type metadata accessor for PartialRangeUpTo()
{
  return MEMORY[0x24BEE2C58]();
}

uint64_t static FixedWidthInteger.random<A>(in:using:)()
{
  return MEMORY[0x24BEE2DC0]();
}

Swift::Void __swiftcall _NativeDictionary.removeAll(isUnique:)(Swift::Bool isUnique)
{
  MEMORY[0x24BEE2E88](isUnique);
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

{
  return MEMORY[0x24BEE2F48]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t _CocoaArrayWrapper.subscript.getter()
{
  return MEMORY[0x24BEE3070]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t dispatch thunk of _AnyIteratorBoxBase.next()()
{
  return MEMORY[0x24BEE30D0]();
}

uint64_t type metadata accessor for CollectionDifference.Change()
{
  return MEMORY[0x24BEE3110]();
}

uint64_t type metadata accessor for CollectionDifference()
{
  return MEMORY[0x24BEE3128]();
}

uint64_t CollectionDifference.init<A>(_:)()
{
  return MEMORY[0x24BEE3140]();
}

uint64_t LazySequenceProtocol.map<A>(_:)()
{
  return MEMORY[0x24BEE3168]();
}

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return MEMORY[0x24BEE31D0]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x24BEE3290](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x24BEE3350]();
}

{
  return MEMORY[0x24BEE3358]();
}

{
  return MEMORY[0x24BEE3368]();
}

{
  return MEMORY[0x24BEE3370]();
}

{
  return MEMORY[0x24BEE3398]();
}

{
  return MEMORY[0x24BEE33A8]();
}

{
  return MEMORY[0x24BEE33B0]();
}

{
  return MEMORY[0x24BEE33B8]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x24BEE34A0]();
}

{
  return MEMORY[0x24BEE34A8]();
}

{
  return MEMORY[0x24BEE34B8]();
}

{
  return MEMORY[0x24BEE34C0]();
}

{
  return MEMORY[0x24BEE34E8]();
}

{
  return MEMORY[0x24BEE34F8]();
}

{
  return MEMORY[0x24BEE3500]();
}

{
  return MEMORY[0x24BEE3508]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x24BEE3540]();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return MEMORY[0x24BEE3548](a1);
}

uint64_t _writeBackMutableSlice<A, B>(_:bounds:slice:)()
{
  return MEMORY[0x24BEE3558]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t dispatch thunk of UnkeyedDecodingContainer.codingPath.getter()
{
  return MEMORY[0x24BEE35D8]();
}

uint64_t dispatch thunk of UnkeyedDecodingContainer.currentIndex.getter()
{
  return MEMORY[0x24BEE35E0]();
}

uint64_t dispatch thunk of UnkeyedDecodingContainer.decode<A>(_:)()
{
  return MEMORY[0x24BEE3638]();
}

uint64_t dispatch thunk of UnkeyedDecodingContainer.isAtEnd.getter()
{
  return MEMORY[0x24BEE3668]();
}

uint64_t dispatch thunk of UnkeyedEncodingContainer.encode<A>(_:)()
{
  return MEMORY[0x24BEE3788]();
}

uint64_t dispatch thunk of LosslessStringConvertible.init(_:)()
{
  return MEMORY[0x24BEE3910]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x24BEE3930]();
}

{
  return MEMORY[0x24BEE3938]();
}

uint64_t _forceBridgeFromObjectiveC<A>(_:_:)()
{
  return MEMORY[0x24BEE39B0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.codingPath.getter()
{
  return MEMORY[0x24BEE3A50]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode(_:)()
{
  return MEMORY[0x24BEE3A58]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)()
{
  return MEMORY[0x24BEE3A88]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode(_:)()
{
  return MEMORY[0x24BEE3AF0]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)()
{
  return MEMORY[0x24BEE3B20]();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t _copySequenceToContiguousArray<A>(_:)()
{
  return MEMORY[0x24BEE3D38]();
}

uint64_t _copyCollectionToContiguousArray<A>(_:)()
{
  return MEMORY[0x24BEE3D90]();
}

uint64_t SIMD.description.getter()
{
  return MEMORY[0x24BEE3E90]();
}

uint64_t SIMD.init<A>(_:)()
{
  return MEMORY[0x24BEE3EB8]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t Error._code.getter()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t Error._domain.getter()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t type metadata accessor for Slice()
{
  return MEMORY[0x24BEE41D8]();
}

uint64_t print<A>(_:separator:terminator:to:)()
{
  return MEMORY[0x24BEE42B8]();
}

uint64_t print(_:separator:terminator:)()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x24BEE42F8](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
  MEMORY[0x24BEE4300](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt16 a1)
{
  MEMORY[0x24BEE4308](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
  MEMORY[0x24BEE4310](*(_QWORD *)&a1);
}

Swift::Int __swiftcall Hasher.finalize()()
{
  return MEMORY[0x24BEE4320]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t Hasher.init()()
{
  return MEMORY[0x24BEE4330]();
}

uint64_t type metadata accessor for Mirror.DisplayStyle()
{
  return MEMORY[0x24BEE4398]();
}

uint64_t type metadata accessor for Mirror.AncestorRepresentation()
{
  return MEMORY[0x24BEE43C8]();
}

uint64_t Mirror.init<A, B>(_:unlabeledChildren:displayStyle:ancestorRepresentation:)()
{
  return MEMORY[0x24BEE43E8]();
}

uint64_t dispatch thunk of Decoder.unkeyedContainer()()
{
  return MEMORY[0x24BEE45F0]();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t dispatch thunk of Encoder.unkeyedContainer()()
{
  return MEMORY[0x24BEE4620]();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x24BEE4628]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t Float16.description.getter()
{
  return MEMORY[0x24BEE4640]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x24BEE4A98]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x24BDBDA78](space, components);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x24BDBDA88](a1, *(_QWORD *)&intent, color, options);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDAF0](color);
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x24BDBDB60](space);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
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

uint64_t _swift_stdlib_strtof_clocale()
{
  return MEMORY[0x24BEE4B50]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x24BEE4BF0]();
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

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x24BEE4C20]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x24BEE4C48]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C70]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x24BEE4E00]();
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

uint64_t swift_initStaticObject()
{
  return MEMORY[0x24BEE4E50]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x24BEE4E80]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
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

