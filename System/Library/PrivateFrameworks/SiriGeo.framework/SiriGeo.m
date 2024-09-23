id INPerson.hasHandleLabel.getter()
{
  void *v0;
  id result;
  void *v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  result = objc_msgSend(v0, sel_personHandle);
  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(result, sel_label);

    if (v3)
    {
      v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v6 = v5;

      swift_bridgeObjectRelease();
      v7 = HIBYTE(v6) & 0xF;
      if ((v6 & 0x2000000000000000) == 0)
        v7 = v4 & 0xFFFFFFFFFFFFLL;
      return (id)(v7 != 0);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

id INPerson.hasHandleValue.getter()
{
  void *v0;
  id result;
  void *v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  result = objc_msgSend(v0, sel_personHandle);
  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(result, sel_value);

    if (v3)
    {
      v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v6 = v5;

      swift_bridgeObjectRelease();
      v7 = HIBYTE(v6) & 0xF;
      if ((v6 & 0x2000000000000000) == 0)
        v7 = v4 & 0xFFFFFFFFFFFFLL;
      return (id)(v7 != 0);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t INPerson.hasUsefulHandleValue.getter()
{
  void *v0;
  void *v1;
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
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  unsigned int *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int *v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;
  unsigned int (*v33)(uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  char *v36;
  char v37;
  void (*v38)(char *, uint64_t);
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;

  v1 = v0;
  v2 = type metadata accessor for ContactHandle.HandleType();
  v3 = *(_QWORD *)(v2 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (ContactHandle.HandleType?, ContactHandle.HandleType?));
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContactHandle.HandleType?);
  v9 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v42 = (uint64_t)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v39 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v39 - v14;
  v16 = objc_msgSend(v1, sel_personHandle);
  if (!v16)
    goto LABEL_18;
  v17 = v16;
  v40 = v5;
  v41 = v8;
  v18 = objc_msgSend(v16, sel_value);

  if (!v18)
    goto LABEL_18;
  v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v21 = v20;

  swift_bridgeObjectRelease();
  v22 = HIBYTE(v21) & 0xF;
  if ((v21 & 0x2000000000000000) == 0)
    v22 = v19 & 0xFFFFFFFFFFFFLL;
  if (v22)
  {
    v23 = objc_msgSend(v1, sel_personHandle);
    v24 = (unsigned int *)MEMORY[0x24BE93588];
    if (!v23)
    {
      v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
      v29(v15, 1, 1, v2);
      v27 = (uint64_t)v41;
      (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v13, *v24, v2);
      goto LABEL_15;
    }
    v25 = v23;
    v26 = objc_msgSend(v23, sel_type);

    v27 = (uint64_t)v41;
    if (v26 == (id)2)
    {
      v30 = (unsigned int *)MEMORY[0x24BE93580];
    }
    else
    {
      if (v26 != (id)1)
      {
        v28 = *v24;
LABEL_14:
        v31 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
        v31(v15, v28, v2);
        v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
        v29(v15, 0, 1, v2);
        v31(v13, *v24, v2);
LABEL_15:
        v29(v13, 0, 1, v2);
        v32 = v27 + *(int *)(v6 + 48);
        outlined init with copy of ContactHandle.HandleType?((uint64_t)v15, v27);
        outlined init with copy of ContactHandle.HandleType?((uint64_t)v13, v32);
        v33 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
        if (v33(v27, 1, v2) == 1)
        {
          outlined destroy of ContactHandle.HandleType?((uint64_t)v13, &demangling cache variable for type metadata for ContactHandle.HandleType?);
          outlined destroy of ContactHandle.HandleType?((uint64_t)v15, &demangling cache variable for type metadata for ContactHandle.HandleType?);
          if (v33(v32, 1, v2) == 1)
          {
            outlined destroy of ContactHandle.HandleType?(v27, &demangling cache variable for type metadata for ContactHandle.HandleType?);
LABEL_18:
            LOBYTE(v22) = 0;
            return v22 & 1;
          }
        }
        else
        {
          v35 = v42;
          outlined init with copy of ContactHandle.HandleType?(v27, v42);
          if (v33(v32, 1, v2) != 1)
          {
            v36 = v40;
            (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v40, v32, v2);
            lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type ContactHandle.HandleType and conformance ContactHandle.HandleType, (uint64_t (*)(uint64_t))MEMORY[0x24BE93590], MEMORY[0x24BE935A8]);
            v37 = dispatch thunk of static Equatable.== infix(_:_:)();
            v38 = *(void (**)(char *, uint64_t))(v3 + 8);
            v38(v36, v2);
            outlined destroy of ContactHandle.HandleType?((uint64_t)v13, &demangling cache variable for type metadata for ContactHandle.HandleType?);
            outlined destroy of ContactHandle.HandleType?((uint64_t)v15, &demangling cache variable for type metadata for ContactHandle.HandleType?);
            v38((char *)v35, v2);
            outlined destroy of ContactHandle.HandleType?(v27, &demangling cache variable for type metadata for ContactHandle.HandleType?);
            LOBYTE(v22) = v37 ^ 1;
            return v22 & 1;
          }
          outlined destroy of ContactHandle.HandleType?((uint64_t)v13, &demangling cache variable for type metadata for ContactHandle.HandleType?);
          outlined destroy of ContactHandle.HandleType?((uint64_t)v15, &demangling cache variable for type metadata for ContactHandle.HandleType?);
          (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v35, v2);
        }
        outlined destroy of ContactHandle.HandleType?(v27, &demangling cache variable for type metadata for (ContactHandle.HandleType?, ContactHandle.HandleType?));
        LOBYTE(v22) = 1;
        return v22 & 1;
      }
      v30 = (unsigned int *)MEMORY[0x24BE93578];
    }
    v28 = *v30;
    goto LABEL_14;
  }
  return v22 & 1;
}

uint64_t INPersonHandleType.toContactHandleType()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int *v3;
  uint64_t v4;
  uint64_t v5;

  if (a1 == 2)
  {
    v3 = (unsigned int *)MEMORY[0x24BE93580];
    goto LABEL_7;
  }
  if (a1 == 1)
  {
    v3 = (unsigned int *)MEMORY[0x24BE93578];
    goto LABEL_7;
  }
  v3 = (unsigned int *)MEMORY[0x24BE93588];
  if (a1)
  {
LABEL_7:
    v4 = *v3;
    goto LABEL_8;
  }
  v4 = *MEMORY[0x24BE93588];
LABEL_8:
  v5 = type metadata accessor for ContactHandle.HandleType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(a2, v4, v5);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348BB5F4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t outlined init with copy of ContactHandle.HandleType?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContactHandle.HandleType?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void INPerson.encodeBase64.getter()
{
  id v0;
  void *v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  Swift::String v6;

  _StringGuts.grow(_:)(18);
  swift_bridgeObjectRelease();
  v0 = (id)INIntentSlotValueTransformToContactValue();
  if (v0)
  {
    v1 = v0;
    v2 = objc_msgSend(v0, sel_data);

    if (v2)
    {
      v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      v5 = v4;

      v6 = Data.base64EncodedString(options:)(0);
      outlined consume of Data._Representation(v3, v5);
      String.append(_:)(v6);
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
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

void INPerson.toContactQueryGeo()()
{
  void *v0;
  void *v1;
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void (*v20)(char *, char *, uint64_t);
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContactQuery?);
  MEMORY[0x24BDAC7A8](v2);
  v27 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for ContactRelationshipQuery?);
  MEMORY[0x24BDAC7A8](v4);
  v28 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for PersonNameComponents?);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for PersonNameComponents();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v27 - v14;
  ContactQuery.init()();
  v16 = objc_msgSend(v0, sel_contactIdentifier);
  if (v16)
  {
    v17 = v16;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

  }
  ContactQuery.id.setter();
  v18 = objc_msgSend(v0, sel_nameComponents);
  if (v18)
  {
    v19 = v18;
    static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)();

    v20 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v20(v8, v13, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
    {
      v20(v15, v8, v9);
      PersonNameComponents.namePrefix.getter();
      ContactQuery.namePrefix.setter();
      PersonNameComponents.givenName.getter();
      ContactQuery.givenName.setter();
      PersonNameComponents.middleName.getter();
      ContactQuery.middleName.setter();
      PersonNameComponents.familyName.getter();
      ContactQuery.familyName.setter();
      PersonNameComponents.nameSuffix.getter();
      ContactQuery.nameSuffix.setter();
      PersonNameComponents.nickname.getter();
      ContactQuery.nickname.setter();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
      goto LABEL_8;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  }
  outlined destroy of ContactHandle.HandleType?((uint64_t)v8, (uint64_t *)&demangling cache variable for type metadata for PersonNameComponents?);
  v21 = objc_msgSend(v1, sel_displayName);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  ContactQuery.fullName.setter();
LABEL_8:
  v22 = objc_msgSend(v1, sel_relationship);
  if (v22)
  {
    v23 = v22;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v24 = type metadata accessor for ContactQuery();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v27, 1, 1, v24);
    v25 = v28;
    ContactRelationshipQuery.init(label:fromContact:)();
    v26 = type metadata accessor for ContactRelationshipQuery();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v25, 0, 1, v26);
    ContactQuery.relationship.setter();

  }
}

uint64_t INPersonHandle.toContactHandle()()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  unsigned int *v7;
  unsigned int *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  char v13;
  id v14;
  void *v15;
  uint64_t v17;

  v1 = v0;
  v2 = type metadata accessor for ContactHandle.HandleType();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(v1, sel_type);
  v7 = (unsigned int *)MEMORY[0x24BE93580];
  v8 = (unsigned int *)MEMORY[0x24BE93578];
  if (v6 != (id)1)
    v8 = (unsigned int *)MEMORY[0x24BE93588];
  if (v6 != (id)2)
    v7 = v8;
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *v7, v2);
  v9 = objc_msgSend(v1, sel_label);
  if (v9)
  {
    v10 = one-time initialization token for labelMap;
    v11 = v9;
    if (v10 != -1)
      swift_once();
    if (*((_QWORD *)static INPersonHandle.labelMap + 2))
    {
      v12 = v11;
      specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v12);
      if ((v13 & 1) != 0)
      {
        swift_bridgeObjectRetain();

        goto LABEL_14;
      }

    }
    static String._unconditionallyBridgeFromObjectiveC(_:)();

  }
LABEL_14:
  v14 = objc_msgSend(v1, sel_value);
  if (v14)
  {
    v15 = v14;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

  }
  return ContactHandle.init(id:type:label:value:isSuggested:)();
}

void *one-time initialization function for labelMap()
{
  uint64_t inited;
  void **v1;
  uint64_t v2;
  void **v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void **v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void **v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void **v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void **v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void **v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void **v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void **v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void **v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *result;
  void *v50;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(INPersonHandleLabel, String)>);
  inited = swift_initStackObject();
  v1 = (void **)MEMORY[0x24BDD99B0];
  *(_OWORD *)(inited + 16) = xmmword_2308A36C0;
  v50 = *v1;
  *(_QWORD *)(inited + 32) = *v1;
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = (void **)MEMORY[0x24BDD99E8];
  *(_QWORD *)(inited + 40) = v2;
  *(_QWORD *)(inited + 48) = v4;
  v5 = *v3;
  *(_QWORD *)(inited + 56) = *v3;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = (void **)MEMORY[0x24BDD99D0];
  *(_QWORD *)(inited + 64) = v6;
  *(_QWORD *)(inited + 72) = v8;
  v9 = *v7;
  *(_QWORD *)(inited + 80) = *v7;
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = (void **)MEMORY[0x24BDD99F8];
  *(_QWORD *)(inited + 88) = v10;
  *(_QWORD *)(inited + 96) = v12;
  v13 = *v11;
  *(_QWORD *)(inited + 104) = *v11;
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v15 = (void **)MEMORY[0x24BDD99C8];
  *(_QWORD *)(inited + 112) = v14;
  *(_QWORD *)(inited + 120) = v16;
  v17 = *v15;
  *(_QWORD *)(inited + 128) = *v15;
  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v19 = (void **)MEMORY[0x24BDD99C0];
  *(_QWORD *)(inited + 136) = v18;
  *(_QWORD *)(inited + 144) = v20;
  v21 = *v19;
  *(_QWORD *)(inited + 152) = *v19;
  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v23 = (void **)MEMORY[0x24BDD99B8];
  *(_QWORD *)(inited + 160) = v22;
  *(_QWORD *)(inited + 168) = v24;
  v25 = *v23;
  *(_QWORD *)(inited + 176) = *v23;
  v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v27 = (void **)MEMORY[0x24BDD99F0];
  *(_QWORD *)(inited + 184) = v26;
  *(_QWORD *)(inited + 192) = v28;
  v29 = *v27;
  *(_QWORD *)(inited + 200) = *v27;
  v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v31 = (void **)MEMORY[0x24BDD99D8];
  *(_QWORD *)(inited + 208) = v30;
  *(_QWORD *)(inited + 216) = v32;
  v33 = *v31;
  *(_QWORD *)(inited + 224) = *v31;
  v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v35 = (void **)MEMORY[0x24BDD99E0];
  *(_QWORD *)(inited + 232) = v34;
  *(_QWORD *)(inited + 240) = v36;
  v37 = *v35;
  *(_QWORD *)(inited + 248) = *v35;
  *(_QWORD *)(inited + 256) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(inited + 264) = v38;
  v39 = v50;
  v40 = v5;
  v41 = v9;
  v42 = v13;
  v43 = v17;
  v44 = v21;
  v45 = v25;
  v46 = v29;
  v47 = v33;
  v48 = v37;
  result = (void *)specialized Dictionary.init(dictionaryLiteral:)(inited);
  static INPersonHandle.labelMap = result;
  return result;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  unint64_t result;
  char v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<INPersonHandleLabel, String>);
  v2 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)();
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
    v5 = *(v4 - 1);
    v6 = *v4;
    v7 = (id)*(v4 - 2);
    swift_bridgeObjectRetain();
    result = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v7);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v2[6] + 8 * result) = v7;
    v10 = (_QWORD *)(v2[7] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 3;
    v2[2] = v13;
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

uint64_t variable initialization expression of INDeleteParkingLocationIntentHandler.logObject()
{
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  return OS_os_log.init(subsystem:category:)();
}

uint64_t variable initialization expression of ContactService.logObject()
{
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  return OS_os_log.init(subsystem:category:)();
}

id variable initialization expression of ContactService.store()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBACF8]), sel_init);
}

uint64_t variable initialization expression of ContactService.mapsService()
{
  return variable initialization expression of ContactService.mapsService((void (*)(_QWORD))type metadata accessor for MapsService, MapsService.init());
}

uint64_t default argument 1 of EnhancedMSPSharedTripContact.init(_:_:)()
{
  return 0;
}

uint64_t variable initialization expression of MapsService.logObject()
{
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  return OS_os_log.init(subsystem:category:)();
}

uint64_t variable initialization expression of MapsService.timeout()
{
  return 5;
}

uint64_t variable initialization expression of MapsService.observer()
{
  return 0;
}

uint64_t variable initialization expression of MapsService.CapabilityFetcherObserver.logObject()
{
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  return OS_os_log.init(subsystem:category:)();
}

uint64_t variable initialization expression of MapsService.CapabilityFetcherObserver.timeout()
{
  return 5;
}

uint64_t variable initialization expression of MapsService.CapabilityFetcherObserver.completion()
{
  return 0;
}

uint64_t variable initialization expression of MapsService.CapabilityFetcherObserver.capabilities()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t variable initialization expression of INShareETAIntentHandler.logObject()
{
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  return OS_os_log.init(subsystem:category:)();
}

double variable initialization expression of INShareETAIntentHandler.sharedTripContact@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t variable initialization expression of INShareETAIntentHandler.contactService()
{
  return variable initialization expression of ContactService.mapsService((void (*)(_QWORD))type metadata accessor for ContactService, (uint64_t (*)(void))ContactService.init());
}

uint64_t variable initialization expression of INStopShareETAIntentHandler.logObject()
{
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  return OS_os_log.init(subsystem:category:)();
}

uint64_t variable initialization expression of INStopShareETAIntentHandler.contactService()
{
  return variable initialization expression of ContactService.mapsService((void (*)(_QWORD))type metadata accessor for ContactService, (uint64_t (*)(void))ContactService.init());
}

uint64_t variable initialization expression of ContactService.mapsService(void (*a1)(_QWORD), uint64_t (*a2)(void))
{
  a1(0);
  swift_allocObject();
  return a2();
}

uint64_t variable initialization expression of INStopShareETAIntentHandler.sharedTripContact()
{
  return 0;
}

uint64_t variable initialization expression of INRetrieveParkingLocationIntentHandler.logObject()
{
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  return OS_os_log.init(subsystem:category:)();
}

uint64_t variable initialization expression of INSaveParkingLocationIntentHandler.logObject()
{
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  return OS_os_log.init(subsystem:category:)();
}

uint64_t variable initialization expression of INSaveParkingLocationIntentHandler.completion()
{
  return 0;
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance INPersonHandleLabel(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance INPersonHandleLabel(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance INPersonHandleLabel(uint64_t a1, id *a2)
{
  uint64_t result;

  result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance INPersonHandleLabel(uint64_t a1, id *a2)
{
  char v3;

  v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance INPersonHandleLabel@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = MEMORY[0x2348BAFAC](v2);
  result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance INPersonHandleLabel(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance INPersonHandleLabel(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance INPersonHandleLabel(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance INPersonHandleLabel()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance INPersonHandleLabel()
{
  Swift::Int v0;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

_QWORD *protocol witness for OptionSet.init(rawValue:) in conformance INShareETAMediumOptions@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CLAccuracyAuthorization(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

id protocol witness for _BridgedStoredNSError._nsError.getter in conformance related decl 'e' for AFLocationServiceErrorCode()
{
  id *v0;

  return *v0;
}

uint64_t protocol witness for _BridgedStoredNSError.init(_nsError:) in conformance related decl 'e' for AFLocationServiceErrorCode@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance INPersonHandleLabel()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3)
    v5 = 1;
  else
    v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

_QWORD *protocol witness for SetAlgebra.intersection(_:) in conformance INShareETAMediumOptions@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.formUnion(_:) in conformance INShareETAMediumOptions(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.formIntersection(_:) in conformance INShareETAMediumOptions(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance CLAccuracyAuthorization(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t protocol witness for static CustomNSError.errorDomain.getter in conformance related decl 'e' for AFLocationServiceErrorCode()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t protocol witness for CustomNSError.errorCode.getter in conformance related decl 'e' for AFLocationServiceErrorCode()
{
  lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AFLocationServiceErrorCode, (uint64_t)&protocol conformance descriptor for related decl 'e' for AFLocationServiceErrorCode);
  return _BridgedStoredNSError.errorCode.getter();
}

uint64_t protocol witness for CustomNSError.errorUserInfo.getter in conformance related decl 'e' for AFLocationServiceErrorCode()
{
  lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AFLocationServiceErrorCode, (uint64_t)&protocol conformance descriptor for related decl 'e' for AFLocationServiceErrorCode);
  return _BridgedStoredNSError.errorUserInfo.getter();
}

uint64_t protocol witness for _ObjectiveCBridgeableError.init(_bridgedNSError:) in conformance related decl 'e' for AFLocationServiceErrorCode(void *a1)
{
  id v2;

  lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AFLocationServiceErrorCode, (uint64_t)&protocol conformance descriptor for related decl 'e' for AFLocationServiceErrorCode);
  v2 = a1;
  return _BridgedStoredNSError.init(_bridgedNSError:)();
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance related decl 'e' for AFLocationServiceErrorCode()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = *v0;
  v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance related decl 'e' for AFLocationServiceErrorCode()
{
  lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AFLocationServiceErrorCode, (uint64_t)&protocol conformance descriptor for related decl 'e' for AFLocationServiceErrorCode);
  return _BridgedStoredNSError.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance related decl 'e' for AFLocationServiceErrorCode()
{
  Hasher.init(_seed:)();
  dispatch thunk of Hashable.hash(into:)();
  return Hasher._finalize()();
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance AFLocationServiceErrorCode@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance INPersonHandleLabel@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = MEMORY[0x2348BAFAC](*a1, a1[1]);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance INPersonHandleLabel@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance INPersonHandleLabel()
{
  lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type INPersonHandleLabel and conformance INPersonHandleLabel, (uint64_t (*)(uint64_t))type metadata accessor for INPersonHandleLabel, (uint64_t)&protocol conformance descriptor for INPersonHandleLabel);
  lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType((unint64_t *)&lazy protocol witness table cache variable for type INPersonHandleLabel and conformance INPersonHandleLabel, (uint64_t (*)(uint64_t))type metadata accessor for INPersonHandleLabel, (uint64_t)&protocol conformance descriptor for INPersonHandleLabel);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t protocol witness for Error._domain.getter in conformance related decl 'e' for AFLocationServiceErrorCode()
{
  lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AFLocationServiceErrorCode, (uint64_t)&protocol conformance descriptor for related decl 'e' for AFLocationServiceErrorCode);
  return Error<>._domain.getter();
}

uint64_t protocol witness for Error._code.getter in conformance related decl 'e' for AFLocationServiceErrorCode()
{
  lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AFLocationServiceErrorCode, (uint64_t)&protocol conformance descriptor for related decl 'e' for AFLocationServiceErrorCode);
  return Error<>._code.getter();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance related decl 'e' for AFLocationServiceErrorCode()
{
  lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AFLocationServiceErrorCode, (uint64_t)&protocol conformance descriptor for related decl 'e' for AFLocationServiceErrorCode);
  return _BridgedStoredNSError._getEmbeddedNSError()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance related decl 'e' for AFLocationServiceErrorCode()
{
  lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AFLocationServiceErrorCode, (uint64_t)&protocol conformance descriptor for related decl 'e' for AFLocationServiceErrorCode);
  return static _BridgedStoredNSError.== infix(_:_:)();
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  Swift::Int v2;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;

  Hasher.init(_seed:)();
  String.hash(into:)();
  v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
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
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;
    if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
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
          v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v15 = v14;
          if (v13 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v15 == v16)
            break;
          v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
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

uint64_t specialized static INPerson.contactsWithContactIdentifiers(_:)(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = a1;
  v25 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_36;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (v2)
  {
    v3 = 0;
    v4 = v1 & 0xC000000000000001;
    v23 = v1 + 32;
    v24 = v1 & 0xFFFFFFFFFFFFFF8;
    v20 = v2;
    v21 = v1;
    v22 = v1 & 0xC000000000000001;
    while (1)
    {
      if (v4)
      {
        v5 = (id)MEMORY[0x2348BB150](v3, v1);
      }
      else
      {
        if (v3 >= *(_QWORD *)(v24 + 16))
          goto LABEL_34;
        v5 = *(id *)(v23 + 8 * v3);
      }
      v6 = v5;
      if (__OFADD__(v3++, 1))
        break;
      v8 = objc_msgSend(v5, sel_contactIdentifier);
      if (v8)
      {

        v9 = v6;
        MEMORY[0x2348BB018]();
        if (*(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();

        goto LABEL_5;
      }
      v10 = objc_msgSend(v6, sel_siriMatches);
      if (v10)
      {
        v11 = v10;
        type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for INPerson);
        v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

        if (v12 >> 62)
        {
          swift_bridgeObjectRetain();
          v13 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
          if (!v13)
            goto LABEL_30;
LABEL_18:
          if (v13 < 1)
            goto LABEL_35;
          for (i = 0; i != v13; ++i)
          {
            if ((v12 & 0xC000000000000001) != 0)
              v15 = (id)MEMORY[0x2348BB150](i, v12);
            else
              v15 = *(id *)(v12 + 8 * i + 32);
            v16 = v15;
            v17 = objc_msgSend(v15, sel_contactIdentifier, v20, v21);
            if (v17)
            {

              v18 = v16;
              MEMORY[0x2348BB018]();
              if (*(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
              specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
              specialized Array._endMutation()();
            }

          }
          swift_bridgeObjectRelease();
          v2 = v20;
          v1 = v21;
        }
        else
        {
          v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (v13)
            goto LABEL_18;
LABEL_30:

          swift_bridgeObjectRelease();
        }
        v4 = v22;
        goto LABEL_5;
      }

LABEL_5:
      if (v3 == v2)
      {
        swift_bridgeObjectRelease();
        return v25;
      }
    }
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    v2 = _CocoaArrayWrapper.endIndex.getter();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

uint64_t outlined destroy of ContactHandle.HandleType?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void type metadata accessor for MSPSharedTripCapabilityType(uint64_t a1)
{
  type metadata accessor for MSPSharedTripCapabilityType(a1, &lazy cache variable for type metadata for MSPSharedTripCapabilityType);
}

void type metadata accessor for related decl 'e' for AFLocationServiceErrorCode(uint64_t a1)
{
  type metadata accessor for MSPSharedTripCapabilityType(a1, &lazy cache variable for type metadata for related decl 'e' for AFLocationServiceErrorCode);
}

uint64_t base witness table accessor for Equatable in related decl 'e' for AFLocationServiceErrorCode()
{
  return lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AFLocationServiceErrorCode, (uint64_t)&protocol conformance descriptor for related decl 'e' for AFLocationServiceErrorCode);
}

uint64_t lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2348BB60C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t base witness table accessor for Error in related decl 'e' for AFLocationServiceErrorCode()
{
  return lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AFLocationServiceErrorCode, (uint64_t)&protocol conformance descriptor for related decl 'e' for AFLocationServiceErrorCode);
}

uint64_t base witness table accessor for CustomNSError in related decl 'e' for AFLocationServiceErrorCode()
{
  return lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AFLocationServiceErrorCode, (uint64_t)&protocol conformance descriptor for related decl 'e' for AFLocationServiceErrorCode);
}

uint64_t base witness table accessor for _ObjectiveCBridgeableError in related decl 'e' for AFLocationServiceErrorCode()
{
  return lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AFLocationServiceErrorCode, (uint64_t)&protocol conformance descriptor for related decl 'e' for AFLocationServiceErrorCode);
}

uint64_t base witness table accessor for Hashable in related decl 'e' for AFLocationServiceErrorCode()
{
  return lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AFLocationServiceErrorCode, (uint64_t)&protocol conformance descriptor for related decl 'e' for AFLocationServiceErrorCode);
}

uint64_t associated type witness table accessor for _BridgedStoredNSError.Code : _ErrorCodeProtocol in related decl 'e' for AFLocationServiceErrorCode()
{
  return lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type AFLocationServiceErrorCode and conformance AFLocationServiceErrorCode, (uint64_t (*)(uint64_t))type metadata accessor for AFLocationServiceErrorCode, (uint64_t)&protocol conformance descriptor for AFLocationServiceErrorCode);
}

void type metadata accessor for AFLocationServiceErrorCode(uint64_t a1)
{
  type metadata accessor for MSPSharedTripCapabilityType(a1, &lazy cache variable for type metadata for AFLocationServiceErrorCode);
}

uint64_t associated type witness table accessor for _BridgedStoredNSError.Code : RawRepresentable in related decl 'e' for AFLocationServiceErrorCode()
{
  return lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type AFLocationServiceErrorCode and conformance AFLocationServiceErrorCode, (uint64_t (*)(uint64_t))type metadata accessor for AFLocationServiceErrorCode, (uint64_t)&protocol conformance descriptor for AFLocationServiceErrorCode);
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    result = MEMORY[0x2348BB60C](MEMORY[0x24BEE17C8], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
}

uint64_t base witness table accessor for Equatable in AFLocationServiceErrorCode()
{
  return lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type AFLocationServiceErrorCode and conformance AFLocationServiceErrorCode, (uint64_t (*)(uint64_t))type metadata accessor for AFLocationServiceErrorCode, (uint64_t)&protocol conformance descriptor for AFLocationServiceErrorCode);
}

uint64_t associated type witness table accessor for _ErrorCodeProtocol._ErrorType : _BridgedStoredNSError in AFLocationServiceErrorCode()
{
  return lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type related decl 'e' for AFLocationServiceErrorCode and conformance related decl 'e' for AFLocationServiceErrorCode, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for AFLocationServiceErrorCode, (uint64_t)&protocol conformance descriptor for related decl 'e' for AFLocationServiceErrorCode);
}

uint64_t type metadata accessor for OS_os_log(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for INPersonHandleLabel(uint64_t a1)
{
  type metadata accessor for MSPSharedTripCapabilityType(a1, &lazy cache variable for type metadata for INPersonHandleLabel);
}

void type metadata accessor for MSPSharedTripCapabilityType(uint64_t a1, unint64_t *a2)
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

uint64_t base witness table accessor for RawRepresentable in INPersonHandleLabel()
{
  return lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type INPersonHandleLabel and conformance INPersonHandleLabel, (uint64_t (*)(uint64_t))type metadata accessor for INPersonHandleLabel, (uint64_t)&protocol conformance descriptor for INPersonHandleLabel);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in INPersonHandleLabel()
{
  return lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type INPersonHandleLabel and conformance INPersonHandleLabel, (uint64_t (*)(uint64_t))type metadata accessor for INPersonHandleLabel, (uint64_t)&protocol conformance descriptor for INPersonHandleLabel);
}

uint64_t base witness table accessor for Equatable in INPersonHandleLabel()
{
  return lazy protocol witness table accessor for type ContactHandle.HandleType and conformance ContactHandle.HandleType(&lazy protocol witness table cache variable for type INPersonHandleLabel and conformance INPersonHandleLabel, (uint64_t (*)(uint64_t))type metadata accessor for INPersonHandleLabel, (uint64_t)&protocol conformance descriptor for INPersonHandleLabel);
}

void INStopShareETAIntentHandler.convertSharedTripToRecipients(_:)()
{
  swift_deletedMethodError();
  __break(1u);
}

id one-time initialization function for routineManager()
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  static ParkingLocationService.routineManager = (uint64_t)result;
  return result;
}

uint64_t *ParkingLocationService.routineManager.unsafeMutableAddressor()
{
  if (one-time initialization token for routineManager != -1)
    swift_once();
  return &static ParkingLocationService.routineManager;
}

id static ParkingLocationService.routineManager.getter()
{
  if (one-time initialization token for routineManager != -1)
    swift_once();
  return (id)static ParkingLocationService.routineManager;
}

ValueMetadata *type metadata accessor for ParkingLocationService()
{
  return &type metadata for ParkingLocationService;
}

id INDeleteParkingLocationIntentHandler.logObject.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC7SiriGeo36INDeleteParkingLocationIntentHandler_logObject);
}

void INDeleteParkingLocationIntentHandler.handle(intent:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  specialized INDeleteParkingLocationIntentHandler.handle(intent:completion:)(a2, a3);
}

void closure #1 in INDeleteParkingLocationIntentHandler.handle(intent:completion:)(uint64_t a1, void *a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  os_log_type_t v13;
  NSObject *v14;
  os_log_type_t v15;
  id v16;
  id v17;
  uint8_t *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  NSObject *v24;
  void (*v25)(char *, uint64_t);
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  os_log_type_t v30;
  uint8_t *v31;
  id v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;

  v8 = type metadata accessor for OSSignpostID();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v12 = a2;
    v13 = static os_log_type_t.error.getter();
    v14 = *(NSObject **)(a3 + OBJC_IVAR____TtC7SiriGeo36INDeleteParkingLocationIntentHandler_logObject);
    v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      v16 = a2;
      v17 = a2;
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v35 = (uint64_t)a2;
      v36 = v19;
      *(_DWORD *)v18 = 136315138;
      v20 = a2;
      __swift_instantiateConcreteTypeFromMangledName(demangling cache variable for type metadata for Error);
      v21 = String.init<A>(describing:)();
      v35 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, &v36);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_230887000, v14, v15, "error fetching vehicle events before deletion: %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348BB678](v19, -1, -1);
      MEMORY[0x2348BB678](v18, -1, -1);
    }
    v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9CD8]), sel_initWithCode_userActivity_, 4, 0);
    a4();

  }
  else
  {
    static os_signpost_type_t.end.getter();
    v24 = *(NSObject **)(a3 + OBJC_IVAR____TtC7SiriGeo36INDeleteParkingLocationIntentHandler_logObject);
    static OSSignpostID.exclusive.getter();
    os_signpost(_:dso:log:name:signpostID:_:_:)();
    v25 = *(void (**)(char *, uint64_t))(v9 + 8);
    v25(v11, v8);
    v26 = objc_allocWithZone(MEMORY[0x24BDD9CD8]);
    if (a1)
    {
      v27 = objc_msgSend(v26, sel_initWithCode_userActivity_, 3, 0);
      static os_log_type_t.info.getter();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      v28 = swift_allocObject();
      *(_OWORD *)(v28 + 16) = xmmword_2308A3BB0;
      *(_QWORD *)(v28 + 56) = type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for INDeleteParkingLocationIntentResponse);
      *(_QWORD *)(v28 + 64) = lazy protocol witness table accessor for type INDeleteParkingLocationIntentResponse and conformance NSObject();
      *(_QWORD *)(v28 + 32) = v27;
      v29 = v27;
      os_log(_:dso:log:_:_:)();
      swift_bridgeObjectRelease();
      static os_signpost_type_t.begin.getter();
      static OSSignpostID.exclusive.getter();
      os_signpost(_:dso:log:name:signpostID:_:_:)();
      v25(v11, v8);
      if (one-time initialization token for routineManager != -1)
        swift_once();
      objc_msgSend((id)static ParkingLocationService.routineManager, sel_clearAllVehicleEvents);
      static os_signpost_type_t.end.getter();
      static OSSignpostID.exclusive.getter();
      os_signpost(_:dso:log:name:signpostID:_:_:)();
      v25(v11, v8);
      v30 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v24, v30))
      {
        v31 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_230887000, v24, v30, "Deleted all saved parking locations", v31, 2u);
        MEMORY[0x2348BB678](v31, -1, -1);
      }
      ((void (*)(id))a4)(v29);

    }
    else
    {
      v32 = objc_msgSend(v26, sel_initWithCode_userActivity_, 4, 0);
      v33 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v24, v33))
      {
        v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_230887000, v24, v33, "No parking locations to delete.", v34, 2u);
        MEMORY[0x2348BB678](v34, -1, -1);
      }
      objc_msgSend(v32, sel_setParkingLocation_, 0);
      ((void (*)(id))a4)(v32);

    }
  }
}

id INDeleteParkingLocationIntentHandler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id INDeleteParkingLocationIntentHandler.init()()
{
  char *v0;
  uint64_t v1;
  char *v2;
  objc_super v4;

  v1 = OBJC_IVAR____TtC7SiriGeo36INDeleteParkingLocationIntentHandler_logObject;
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  v2 = v0;
  *(_QWORD *)&v0[v1] = OS_os_log.init(subsystem:category:)();

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for INDeleteParkingLocationIntentHandler();
  return objc_msgSendSuper2(&v4, sel_init);
}

id INDeleteParkingLocationIntentHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for INDeleteParkingLocationIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void specialized INDeleteParkingLocationIntentHandler.handle(intent:completion:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  id v12;
  _QWORD aBlock[6];

  v5 = type metadata accessor for OSSignpostID();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static os_signpost_type_t.begin.getter();
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:_:_:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (one-time initialization token for routineManager != -1)
    swift_once();
  v9 = (void *)static ParkingLocationService.routineManager;
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = v2;
  v10[3] = a1;
  v10[4] = a2;
  aBlock[4] = partial apply for closure #1 in INDeleteParkingLocationIntentHandler.handle(intent:completion:);
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed [RTVehicleEvent]?, @guaranteed Error?) -> ();
  aBlock[3] = &block_descriptor;
  v11 = _Block_copy(aBlock);
  v12 = v2;
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_fetchLastVehicleEventsWithHandler_, v11);
  _Block_release(v11);
}

uint64_t type metadata accessor for INDeleteParkingLocationIntentHandler()
{
  return objc_opt_self();
}

uint64_t sub_23088CB0C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned INDeleteParkingLocationIntentResponse) -> ()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_23088CB40()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void partial apply for closure #1 in INDeleteParkingLocationIntentHandler.handle(intent:completion:)(uint64_t a1, void *a2)
{
  uint64_t v2;

  closure #1 in INDeleteParkingLocationIntentHandler.handle(intent:completion:)(a1, a2, *(_QWORD *)(v2 + 16), *(void (**)(void))(v2 + 24));
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

unint64_t lazy protocol witness table accessor for type INDeleteParkingLocationIntentResponse and conformance NSObject()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type INDeleteParkingLocationIntentResponse and conformance NSObject;
  if (!lazy protocol witness table cache variable for type INDeleteParkingLocationIntentResponse and conformance NSObject)
  {
    v1 = type metadata accessor for OS_os_log(255, &lazy cache variable for type metadata for INDeleteParkingLocationIntentResponse);
    result = MEMORY[0x2348BB60C](MEMORY[0x24BEE5BE8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type INDeleteParkingLocationIntentResponse and conformance NSObject);
  }
  return result;
}

BOOL static ContactServiceError.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void ContactServiceError.hash(into:)(uint64_t a1, char a2)
{
  Hasher._combine(_:)(a2 & 1);
}

Swift::Int ContactServiceError.hashValue.getter(char a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1 & 1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ContactServiceError(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ContactServiceError()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance ContactServiceError()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ContactServiceError()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t ContactService.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  ContactService.init()();
  return v0;
}

_QWORD *ContactService.init()()
{
  _QWORD *v0;
  uint64_t v1;

  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  v0[2] = OS_os_log.init(subsystem:category:)();
  v0[3] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBACF8]), sel_init);
  type metadata accessor for MapsService();
  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = OS_os_log.init(subsystem:category:)();
  *(_OWORD *)(v1 + 24) = xmmword_2308A3C00;
  v0[4] = v1;
  return v0;
}

id ContactService.logObject.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

Swift::OpaquePointer_optional __swiftcall ContactService.fetchContactIDs(forIdentifiers:)(Swift::OpaquePointer forIdentifiers)
{
  uint64_t v1;
  void *v2;
  Class isa;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  Class v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  Swift::Bool v16;
  id v17;
  void *v18;
  void *v19;
  id v20[2];
  Swift::OpaquePointer_optional result;

  v20[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_self();
  isa = Array._bridgeToObjectiveC()().super.isa;
  v4 = objc_msgSend(v2, sel_predicateForContactsWithIdentifiers_, isa);

  v5 = *(void **)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_2308A3C10;
  v7 = (void *)*MEMORY[0x24BDBA348];
  v8 = (void *)*MEMORY[0x24BDBA288];
  *(_QWORD *)(v6 + 32) = *MEMORY[0x24BDBA348];
  *(_QWORD *)(v6 + 40) = v8;
  specialized Array._endMutation()();
  v9 = v7;
  v10 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CNKeyDescriptor);
  v11 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v20[0] = 0;
  v12 = objc_msgSend(v5, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v4, v11, v20);

  v13 = v20[0];
  if (v12)
  {
    type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for CNContact);
    v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    v15 = v13;

  }
  else
  {
    v17 = v20[0];
    v18 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    v14 = 0;
  }
  v19 = (void *)v14;
  result.value._rawValue = v19;
  result.is_nil = v16;
  return result;
}

Swift::tuple_OpaquePointer_optional_SiriGeo_ContactServiceError_optional __swiftcall ContactService.fetchPersonHandles(forIdentifiers:)(Swift::OpaquePointer forIdentifiers)
{
  uint64_t v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  void **isa;
  uint64_t v6;
  unint64_t v7;
  SEL *v8;
  id v9;
  void *v10;
  uint64_t v12;
  id v13;
  unsigned int v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  unsigned int v31;
  id v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  __int16 v44;
  unint64_t v45;
  void **v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  unint64_t v53;
  Swift::tuple_OpaquePointer_optional_SiriGeo_ContactServiceError_optional result;

  v2 = (void *)(*(uint64_t (**)(void *))(*(_QWORD *)v1 + 112))(forIdentifiers._rawValue);
  if (v2)
  {
    v3 = (unint64_t)v2;
    static os_log_type_t.info.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_2308A3BB0;
    v47 = v3;
    *(_QWORD *)(v4 + 56) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CNContact]);
    *(_QWORD *)(v4 + 64) = lazy protocol witness table accessor for type [CNContact] and conformance [A](&lazy protocol witness table cache variable for type [CNContact] and conformance [A], &demangling cache variable for type metadata for [CNContact]);
    *(_QWORD *)(v4 + 32) = v3;
    swift_bridgeObjectRetain();
    os_log(_:dso:log:_:_:)();
    swift_bridgeObjectRelease();
    v53 = MEMORY[0x24BEE4AF8];
    isa = (void **)(v3 & 0xFFFFFFFFFFFFFF8);
    if (v3 >> 62)
      goto LABEL_46;
    v6 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    while (v6)
    {
      v7 = 0;
      v45 = v47 + 32;
      v46 = isa;
      v51 = (void *)*MEMORY[0x24BDBA348];
      v50 = (void *)*MEMORY[0x24BDBA288];
      v8 = (SEL *)&unk_24FEBA000;
      v48 = v6;
      while (1)
      {
        if ((v47 & 0xC000000000000001) != 0)
        {
          v9 = (id)MEMORY[0x2348BB150](v7, v47);
        }
        else
        {
          if (v7 >= (unint64_t)v46[2])
            goto LABEL_43;
          v9 = *(id *)(v45 + 8 * v7);
        }
        v10 = v9;
        if (__OFADD__(v7++, 1))
          break;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
        v12 = swift_allocObject();
        *(_OWORD *)(v12 + 16) = xmmword_2308A3C20;
        *(_QWORD *)(v12 + 32) = v51;
        specialized Array._endMutation()();
        v13 = v51;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CNKeyDescriptor);
        isa = (void **)Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        v14 = objc_msgSend(v10, v8[69], isa);

        v52 = v10;
        if (v14)
        {
          v15 = objc_msgSend(v10, sel_phoneNumbers);
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CNLabeledValue);
          v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

          v17 = v7;
          if (v16 >> 62)
          {
            swift_bridgeObjectRetain();
            v18 = _CocoaArrayWrapper.endIndex.getter();
            swift_bridgeObjectRelease();
            if (v18)
            {
LABEL_14:
              if (v18 < 1)
                goto LABEL_44;
              v19 = 0;
              do
              {
                if ((v16 & 0xC000000000000001) != 0)
                  v20 = (id)MEMORY[0x2348BB150](v19, v16);
                else
                  v20 = *(id *)(v16 + 8 * v19 + 32);
                v21 = v20;
                v22 = objc_msgSend(v20, sel_value, v45);
                v23 = objc_msgSend(v22, sel_stringValue);

                v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                v26 = v25;

                v27 = objc_allocWithZone(MEMORY[0x24BDD9F38]);
                v28 = (void *)MEMORY[0x2348BAFAC](v24, v26);
                swift_bridgeObjectRelease();
                objc_msgSend(v27, sel_initWithValue_type_, v28, 2);

                MEMORY[0x2348BB018]();
                if (*(_QWORD *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                  specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
                ++v19;
                specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
                specialized Array._endMutation()();

              }
              while (v18 != v19);
            }
          }
          else
          {
            v18 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
            if (v18)
              goto LABEL_14;
          }
          swift_bridgeObjectRelease();
          v6 = v48;
          v7 = v17;
          v8 = (SEL *)&unk_24FEBA000;
          v10 = v52;
        }
        v29 = swift_allocObject();
        *(_OWORD *)(v29 + 16) = xmmword_2308A3C20;
        *(_QWORD *)(v29 + 32) = v50;
        specialized Array._endMutation()();
        v30 = v50;
        isa = (void **)Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        v31 = objc_msgSend(v10, v8[69], isa);

        if (v31)
        {
          v32 = objc_msgSend(v10, sel_emailAddresses);
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CNLabeledValue);
          v33 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

          if (v33 >> 62)
          {
            swift_bridgeObjectRetain();
            v34 = _CocoaArrayWrapper.endIndex.getter();
            swift_bridgeObjectRelease();
            if (!v34)
            {
LABEL_38:

              swift_bridgeObjectRelease();
              goto LABEL_39;
            }
          }
          else
          {
            v34 = *(_QWORD *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10);
            if (!v34)
              goto LABEL_38;
          }
          if (v34 < 1)
            goto LABEL_45;
          v49 = v7;
          v35 = 0;
          do
          {
            if ((v33 & 0xC000000000000001) != 0)
              v36 = (id)MEMORY[0x2348BB150](v35, v33);
            else
              v36 = *(id *)(v33 + 8 * v35 + 32);
            v37 = v36;
            v38 = objc_msgSend(v36, sel_value, v45);
            v39 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            v41 = v40;

            v42 = objc_allocWithZone(MEMORY[0x24BDD9F38]);
            v43 = (void *)MEMORY[0x2348BAFAC](v39, v41);
            swift_bridgeObjectRelease();
            objc_msgSend(v42, sel_initWithValue_type_, v43, 1);

            isa = (void **)&v53;
            MEMORY[0x2348BB018]();
            if (*(_QWORD *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
            ++v35;
            specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
            specialized Array._endMutation()();

          }
          while (v34 != v35);

          swift_bridgeObjectRelease();
          v6 = v48;
          v7 = v49;
LABEL_39:
          v8 = (SEL *)&unk_24FEBA000;
          if (v7 == v6)
          {
LABEL_40:
            swift_bridgeObjectRelease();
            v2 = (void *)v53;
            goto LABEL_48;
          }
        }
        else
        {

          if (v7 == v6)
            goto LABEL_40;
        }
      }
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
LABEL_46:
      swift_bridgeObjectRetain();
      v6 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    v2 = (void *)MEMORY[0x24BEE4AF8];
LABEL_48:
    v44 = 2;
  }
  else
  {
    v44 = 0;
  }
  result._0.value._rawValue = v2;
  *(_WORD *)&result._0.is_nil = v44;
  return result;
}

unint64_t ContactService.fetchSingleTripContact(recipient:)(void *a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  unsigned __int8 v9;
  unsigned __int8 v10;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  id v25;
  void *v26;
  Class isa;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;

  v3 = (unint64_t)objc_msgSend(a1, sel_contactIdentifier);
  if (!v3)
  {
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    v25 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 2);
    goto LABEL_32;
  }
  v43 = a1;
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_2308A3BB0;
  *(_QWORD *)(v7 + 32) = v4;
  *(_QWORD *)(v7 + 40) = v6;
  v8 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 120);
  swift_bridgeObjectRetain();
  v3 = v8(v7);
  v10 = v9;
  LODWORD(v8) = v9;
  swift_bridgeObjectRelease();
  if ((_DWORD)v8 != 2 && (v10 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    v25 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 3);
    v3 = 0;
    goto LABEL_32;
  }
  v42 = v1;
  if (!v3)
  {
LABEL_31:
    static os_log_type_t.info.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    v37 = swift_allocObject();
    *(_OWORD *)(v37 + 16) = xmmword_2308A3BB0;
    v38 = swift_allocObject();
    *(_OWORD *)(v38 + 16) = xmmword_2308A3BB0;
    *(_QWORD *)(v38 + 32) = v4;
    *(_QWORD *)(v38 + 40) = v6;
    *(_QWORD *)(v37 + 56) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    *(_QWORD *)(v37 + 64) = lazy protocol witness table accessor for type [CNContact] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance [A], &demangling cache variable for type metadata for [String]);
    *(_QWORD *)(v37 + 32) = v38;
    os_log(_:dso:log:_:_:)();
    swift_bridgeObjectRelease();
    v25 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 4);
    v3 = 0;
    goto LABEL_32;
  }
  if (!(v3 >> 62))
  {
    v12 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v12)
      goto LABEL_9;
    goto LABEL_30;
  }
  swift_bridgeObjectRetain();
  v12 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v12)
  {
LABEL_30:
    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
LABEL_9:
  swift_bridgeObjectRelease();
  if (v12 < 1)
  {
    __break(1u);
    goto LABEL_34;
  }
  v13 = 0;
  v14 = (_QWORD *)MEMORY[0x24BEE4AF8];
  do
  {
    if ((v3 & 0xC000000000000001) != 0)
      v16 = (id)MEMORY[0x2348BB150](v13, v3);
    else
      v16 = *(id *)(v3 + 8 * v13 + 32);
    v17 = v16;
    v18 = objc_msgSend(v16, sel_value, v42);
    if (v18)
    {
      v19 = v18;
      v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v22 = v21;

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v14[2] + 1, 1, v14);
      v24 = v14[2];
      v23 = v14[3];
      if (v24 >= v23 >> 1)
        v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v23 > 1), v24 + 1, 1, v14);
      v14[2] = v24 + 1;
      v15 = &v14[2 * v24];
      v15[4] = v20;
      v15[5] = v22;
    }
    ++v13;

  }
  while (v12 != v13);
  swift_bridgeObjectRelease();
  v26 = (void *)objc_opt_self();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v28 = objc_msgSend(v26, sel_contactsFromHandles_, isa);

  v12 = type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for MSPSharedTripContact);
  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v3 >> 62)
  {
LABEL_34:
    swift_bridgeObjectRetain();
    v41 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v41 > 0)
      goto LABEL_25;
LABEL_35:
    swift_bridgeObjectRelease();
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    v25 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 5);
    v3 = 0;
    goto LABEL_32;
  }
  if (*(uint64_t *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10) <= 0)
    goto LABEL_35;
LABEL_25:
  v29 = *(NSObject **)(v42 + 16);
  swift_bridgeObjectRetain_n();
  v30 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    v32 = swift_slowAlloc();
    v44 = v32;
    *(_DWORD *)v31 = 136315138;
    v33 = swift_bridgeObjectRetain();
    v34 = MEMORY[0x2348BB03C](v33, v12);
    v36 = v35;
    swift_bridgeObjectRelease();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v34, v36, &v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_230887000, v29, v30, "fetchSingleTripContact - successful %s", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348BB678](v32, -1, -1);
    MEMORY[0x2348BB678](v31, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  v25 = objc_msgSend((id)objc_opt_self(), sel_resolutionResultSuccessWithResolvedValue_, v43);
LABEL_32:
  v39 = v25;
  return v3;
}

uint64_t ContactService.rankAndSortHandlesByPopularity(forHandleValues:)(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  uint64_t v4;
  int64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  Class isa;
  id v15;
  uint64_t v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;

  v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE719A0]), sel_init);
  static os_log_type_t.info.getter();
  v35 = v1;
  v3 = *(NSObject **)(v1 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2308A3BB0;
  v34 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [EnhancedMSPSharedTripContact]);
  *(_QWORD *)(v4 + 56) = v34;
  v33 = lazy protocol witness table accessor for type [CNContact] and conformance [A](&lazy protocol witness table cache variable for type [EnhancedMSPSharedTripContact] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [EnhancedMSPSharedTripContact]);
  *(_QWORD *)(v4 + 64) = v33;
  *(_QWORD *)(v4 + 32) = a1;
  swift_bridgeObjectRetain();
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a1 + 16);
  if (v5)
  {
    v6 = v3;
    v37 = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v5, 0);
    v7 = v37;
    v8 = (uint64_t *)(a1 + 40);
    do
    {
      v9 = *(v8 - 1);
      v10 = *v8;
      v37 = v7;
      v12 = *(_QWORD *)(v7 + 16);
      v11 = *(_QWORD *)(v7 + 24);
      swift_bridgeObjectRetain();
      if (v12 >= v11 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v11 > 1, v12 + 1, 1);
        v7 = v37;
      }
      v8 += 5;
      *(_QWORD *)(v7 + 16) = v12 + 1;
      v13 = v7 + 16 * v12;
      *(_QWORD *)(v13 + 32) = v9;
      *(_QWORD *)(v13 + 40) = v10;
      --v5;
    }
    while (v5);
    v3 = v6;
  }
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v36, sel_rankedHandlesFromCandidateHandles_, isa);

  if (v15)
  {
    type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for NSNumber);
    v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  }
  else
  {
    v16 = 0;
  }
  swift_bridgeObjectRetain_n();
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    v19 = swift_slowAlloc();
    v37 = v19;
    *(_DWORD *)v18 = 136315138;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : NSNumber]?);
    v20 = String.init<A>(describing:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v21, &v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_230887000, v3, v17, "ranked handles  %s", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348BB678](v19, -1, -1);
    MEMORY[0x2348BB678](v18, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  swift_retain();
  v22 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay7SiriGeo28EnhancedMSPSharedTripContactVG_AHs5NeverOTg503_s7d5Geo14i65ServiceC30rankAndSortHandlesByPopularity15forHandleValuesSayAA021fgH18C0VGAH_tFA2GXEfU0_AF0iM0CSDySSSo8NSNumberCGSgTf1cn_nTf4ngg_n(a1, v35, v16);
  swift_release();
  swift_bridgeObjectRelease_n();
  static os_log_type_t.info.getter();
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_2308A3BB0;
  *(_QWORD *)(v23 + 56) = v34;
  *(_QWORD *)(v23 + 64) = v33;
  *(_QWORD *)(v23 + 32) = v22;
  swift_bridgeObjectRetain();
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();
  v37 = v22;
  swift_bridgeObjectRetain();
  specialized MutableCollection<>.sort(by:)(&v37, specialized _ContiguousArrayBuffer._consumeAndCreateNew(), specialized UnsafeMutableBufferPointer._stableSortImpl(by:));
  swift_bridgeObjectRelease();
  v24 = v37;
  swift_retain_n();
  v25 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc();
    v27 = swift_slowAlloc();
    v37 = v27;
    *(_DWORD *)v26 = 136315138;
    v28 = swift_retain();
    v29 = MEMORY[0x2348BB03C](v28, &type metadata for EnhancedMSPSharedTripContact);
    v31 = v30;
    swift_release();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v29, v31, &v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_230887000, v3, v25, "ranked handles after sort %s", v26, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348BB678](v27, -1, -1);
    MEMORY[0x2348BB678](v26, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  return v24;
}

double closure #2 in ContactService.rankAndSortHandlesByPopularity(forHandleValues:)@<D0>(__int128 *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double result;
  uint64_t v27;
  __int128 v28;
  __int128 v30;

  v4 = *a1;
  v5 = a1[1];
  *((_QWORD *)&v28 + 1) = *((_QWORD *)a1 + 3);
  v6 = *((_QWORD *)a1 + 4);
  swift_bridgeObjectRetain();
  *(_QWORD *)&v28 = (id)v5;
  static os_log_type_t.info.getter();
  v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_2308A3C30;
  v8 = EnhancedMSPSharedTripContact.debugDescription.getter();
  v10 = v9;
  v11 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE0D00];
  v12 = lazy protocol witness table accessor for type String and conformance String();
  *(_QWORD *)(v7 + 32) = v8;
  *(_QWORD *)(v7 + 40) = v10;
  v13 = *(double *)&v4;
  *(_QWORD *)(v7 + 96) = v11;
  *(_QWORD *)(v7 + 104) = v12;
  v14 = v12;
  *(_QWORD *)(v7 + 64) = v12;
  *(_OWORD *)(v7 + 72) = v4;
  swift_bridgeObjectRetain();
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();
  if (a2 && *(_QWORD *)(a2 + 16))
  {
    swift_bridgeObjectRetain();
    v15 = specialized __RawDictionaryStorage.find<A>(_:)(v4, *((uint64_t *)&v4 + 1));
    if ((v16 & 1) != 0)
    {
      v17 = *(id *)(*(_QWORD *)(a2 + 56) + 8 * v15);
      swift_bridgeObjectRelease();
      static os_log_type_t.info.getter();
      v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_2308A3BB0;
      objc_msgSend(v17, sel_doubleValue);
      v19 = MEMORY[0x24BEE1448];
      *(_QWORD *)(v18 + 56) = MEMORY[0x24BEE13C8];
      *(_QWORD *)(v18 + 64) = v19;
      *(_QWORD *)(v18 + 32) = v20;
      os_log(_:dso:log:_:_:)();
      swift_bridgeObjectRelease();
      objc_msgSend(v17, sel_doubleValue);
      if ((~v21 & 0x7FF0000000000000) != 0 || (v21 & 0xFFFFFFFFFFFFFLL) == 0)
      {
        objc_msgSend(v17, sel_doubleValue, v27);
        v6 = v22;
      }

    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v13 = *(double *)&v4;
  }
  static os_log_type_t.info.getter();
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_2308A3BB0;
  *(double *)&v30 = v13;
  *((_QWORD *)&v30 + 1) = *((_QWORD *)&v4 + 1);
  v24 = EnhancedMSPSharedTripContact.debugDescription.getter();
  *(_QWORD *)(v23 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v23 + 64) = v14;
  *(_QWORD *)(v23 + 32) = v24;
  *(_QWORD *)(v23 + 40) = v25;
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();
  result = v13;
  *(_OWORD *)a3 = v30;
  *(_OWORD *)(a3 + 16) = v28;
  *(_QWORD *)(a3 + 32) = v6;
  return result;
}

uint64_t ContactService.rankAndSortHandlesByPopularityAndType(forHandleValues:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  _QWORD *v9;
  void (*v10)(uint64_t, void (*)(uint64_t, void *), _QWORD *);

  v4 = v3;
  static os_log_type_t.info.getter();
  os_log(_:dso:log:_:_:)();
  v8 = *(_QWORD *)(v3 + 32);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v4;
  v9[3] = a2;
  v9[4] = a3;
  v10 = *(void (**)(uint64_t, void (*)(uint64_t, void *), _QWORD *))(*(_QWORD *)v8 + 128);
  swift_retain();
  swift_retain();
  v10(a1, partial apply for closure #1 in ContactService.rankAndSortHandlesByPopularityAndType(forHandleValues:_:), v9);
  return swift_release();
}

void closure #1 in ContactService.rankAndSortHandlesByPopularityAndType(forHandleValues:_:)(uint64_t a1, id a2, uint64_t a3, void (*a4)(uint64_t))
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a2)
  {
    v7 = a2;
    static os_log_type_t.error.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_2308A3BB0;
    swift_getErrorValue();
    v9 = Error.localizedDescription.getter();
    v11 = v10;
    *(_QWORD *)(v8 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v8 + 64) = lazy protocol witness table accessor for type String and conformance String();
    *(_QWORD *)(v8 + 32) = v9;
    *(_QWORD *)(v8 + 40) = v11;
    os_log(_:dso:log:_:_:)();
    swift_bridgeObjectRelease();
    a4(MEMORY[0x24BEE4AF8]);

  }
  else if (a1)
  {
    v14 = a1;
    swift_bridgeObjectRetain();
    specialized MutableCollection<>.sort(by:)(&v14, (uint64_t (*)(uint64_t))specialized _ArrayBuffer._consumeAndCreateNew(), specialized UnsafeMutableBufferPointer._stableSortImpl(by:));
    v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a3 + 136))(v14);
    swift_bridgeObjectRelease();
    a4(v12);
    swift_bridgeObjectRelease();
  }
  else
  {
    static os_log_type_t.error.getter();
    v13 = MEMORY[0x24BEE4AF8];
    os_log(_:dso:log:_:_:)();
    a4(v13);
  }
}

uint64_t specialized MutableCollection<>.sort(by:)(uint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(_QWORD *))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _QWORD v9[2];

  v6 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v6 = a2(v6);
  v7 = *(_QWORD *)(v6 + 16);
  v9[0] = v6 + 32;
  v9[1] = v7;
  result = a3(v9);
  *a1 = v6;
  return result;
}

uint64_t ContactService.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t ContactService.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();
  return swift_deallocClassInstance();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348BB600](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t serialize(_:at:)(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_QWORD *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<EnhancedMSPSharedTripContact>);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4])
          memmove(v12, a4 + 4, 40 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t closure #1 in OSLogArguments.append(_:)(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v7, a3);
  v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
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
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = _StringGuts._allocateForDeconstruct()(a5, a6);
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
  v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
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
      v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = _StringGuts.copyUTF8(into:)();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      v2 = String.UTF8View._foreignCount()();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
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
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

_BYTE **closure #1 in OSLogArguments.append(_:)(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t lazy protocol witness table accessor for type [CNContact] and conformance [A](unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2348BB60C](MEMORY[0x24BDCFBF8], v4);
    atomic_store(result, a1);
  }
  return result;
}

Swift::Int specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(uint64_t *a1)
{
  uint64_t v1;
  Swift::Int v3;
  Swift::Int result;
  uint64_t v5;
  Swift::Int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::Int v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  Swift::Int v14;
  uint64_t v15;
  unint64_t v16;
  double v17;
  uint64_t v18;
  unint64_t v19;
  double v20;
  int v21;
  double *v22;
  double v23;
  unint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  Swift::Int v28;
  Swift::Int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  Swift::Int v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  double v42;
  Swift::Int v43;
  uint64_t v44;
  _BOOL4 v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  unint64_t v49;
  unint64_t v50;
  char *v51;
  char *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  BOOL v64;
  unint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  BOOL v74;
  uint64_t v75;
  char v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  BOOL v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  char *v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  unint64_t v97;
  char *v98;
  char *v99;
  uint64_t v100;
  unint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t v110;
  Swift::Int v111;
  Swift::Int v112;
  uint64_t v113;
  char *__dst;

  v3 = a1[1];
  result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_138;
    if (v3)
      return specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_146;
  v6 = result;
  v108 = a1;
  if (v3 < 2)
  {
    v9 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v13 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v12 = (char *)MEMORY[0x24BEE4AF8];
LABEL_104:
      v99 = v12;
      v110 = v9;
      if (v13 >= 2)
      {
        v100 = *v108;
        do
        {
          v101 = v13 - 2;
          if (v13 < 2)
            goto LABEL_133;
          if (!v100)
            goto LABEL_145;
          v102 = v99;
          v103 = *(_QWORD *)&v99[16 * v101 + 32];
          v104 = *(_QWORD *)&v99[16 * v13 + 24];
          specialized _merge<A>(low:mid:high:buffer:by:)((char *)(v100 + 40 * v103), (char *)(v100 + 40 * *(_QWORD *)&v99[16 * v13 + 16]), v100 + 40 * v104, __dst);
          if (v1)
            break;
          if (v104 < v103)
            goto LABEL_134;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v102 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v102);
          if (v101 >= *((_QWORD *)v102 + 2))
            goto LABEL_135;
          v105 = &v102[16 * v101 + 32];
          *(_QWORD *)v105 = v103;
          *((_QWORD *)v105 + 1) = v104;
          v106 = *((_QWORD *)v102 + 2);
          if (v13 > v106)
            goto LABEL_136;
          memmove(&v102[16 * v13 + 16], &v102[16 * v13 + 32], 16 * (v106 - v13));
          v99 = v102;
          *((_QWORD *)v102 + 2) = v106 - 1;
          v13 = v106 - 1;
        }
        while (v106 > 2);
      }
LABEL_101:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v110 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v110 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v7 = v5 >> 1;
    v8 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(_QWORD *)(v8 + 16) = v7;
    v110 = v8;
    __dst = (char *)(v8 + 32);
  }
  v10 = 0;
  v11 = *a1;
  v109 = *a1 + 112;
  v107 = *a1 - 16;
  v12 = (char *)MEMORY[0x24BEE4AF8];
  v111 = v6;
  v112 = v3;
  v113 = v11;
  while (1)
  {
    v14 = v10++;
    if (v10 < v3)
    {
      v15 = v11 + 40 * v10;
      v16 = *(_QWORD *)(v15 + 24);
      v17 = *(double *)(v15 + 32);
      v18 = v11 + 40 * v14;
      v19 = *(_QWORD *)(v18 + 24);
      v20 = *(double *)(v18 + 32);
      v21 = v19 < v16;
      if (v16 == v19)
        v21 = v20 < v17;
      v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        v22 = (double *)(v109 + 40 * v14);
        while (1)
        {
          v23 = v17;
          v24 = *((_QWORD *)v22 - 1);
          v17 = *v22;
          v25 = v24 == v16 ? v23 < *v22 : v16 < v24;
          if (v21 != v25)
            break;
          ++v10;
          v22 += 5;
          v16 = v24;
          if (v3 == v10)
          {
            v10 = v3;
            break;
          }
        }
      }
      if (v21)
      {
        if (v10 < v14)
          goto LABEL_139;
        if (v14 < v10)
        {
          v26 = 40 * v10;
          v27 = 40 * v14;
          v28 = v10;
          v29 = v14;
          do
          {
            if (v29 != --v28)
            {
              if (!v11)
                goto LABEL_144;
              v30 = v11 + v27;
              v31 = *(_QWORD *)(v11 + v27);
              v32 = v11 + v26;
              v33 = *(_QWORD *)(v11 + v27 + 24);
              v34 = *(_QWORD *)(v11 + v27 + 32);
              v35 = *(_OWORD *)(v11 + v27 + 8);
              v36 = *(_QWORD *)(v11 + v26 - 8);
              v37 = *(_OWORD *)(v11 + v26 - 24);
              *(_OWORD *)v30 = *(_OWORD *)(v11 + v26 - 40);
              *(_OWORD *)(v30 + 16) = v37;
              *(_QWORD *)(v30 + 32) = v36;
              *(_QWORD *)(v32 - 40) = v31;
              *(_OWORD *)(v32 - 32) = v35;
              *(_QWORD *)(v32 - 16) = v33;
              *(_QWORD *)(v32 - 8) = v34;
            }
            ++v29;
            v26 -= 40;
            v27 += 40;
          }
          while (v29 < v28);
        }
      }
    }
    if (v10 >= v3)
      goto LABEL_54;
    if (__OFSUB__(v10, v14))
      goto LABEL_137;
    if (v10 - v14 >= v6)
      goto LABEL_54;
    v38 = v14 + v6;
    if (__OFADD__(v14, v6))
      goto LABEL_140;
    if (v38 >= v3)
      v38 = v3;
    if (v38 < v14)
      break;
    if (v10 != v38)
    {
      v39 = v107 + 40 * v10;
      do
      {
        v40 = v11 + 40 * v10;
        v41 = *(_QWORD *)(v40 + 24);
        v42 = *(double *)(v40 + 32);
        v43 = v14;
        v44 = v39;
        do
        {
          if (v41 == *(_QWORD *)v44)
            v45 = *(double *)(v44 + 8) < v42;
          else
            v45 = *(_QWORD *)v44 < v41;
          if (!v45)
            break;
          if (!v11)
            goto LABEL_142;
          v46 = *(_QWORD *)(v44 + 16);
          v47 = *(_OWORD *)(v44 + 24);
          v48 = *(_OWORD *)(v44 - 8);
          *(_OWORD *)(v44 + 16) = *(_OWORD *)(v44 - 24);
          *(_OWORD *)(v44 + 32) = v48;
          *(_QWORD *)(v44 + 48) = *(_QWORD *)(v44 + 8);
          *(_QWORD *)(v44 - 24) = v46;
          *(_OWORD *)(v44 - 16) = v47;
          *(_QWORD *)v44 = v41;
          *(double *)(v44 + 8) = v42;
          v44 -= 40;
          ++v43;
        }
        while (v10 != v43);
        ++v10;
        v39 += 40;
      }
      while (v10 != v38);
      v10 = v38;
    }
LABEL_54:
    if (v10 < v14)
      goto LABEL_132;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v50 = *((_QWORD *)v12 + 2);
    v49 = *((_QWORD *)v12 + 3);
    v13 = v50 + 1;
    v11 = v113;
    if (v50 >= v49 >> 1)
    {
      v98 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v49 > 1), v50 + 1, 1, v12);
      v11 = v113;
      v12 = v98;
    }
    *((_QWORD *)v12 + 2) = v13;
    v51 = v12 + 32;
    v52 = &v12[16 * v50 + 32];
    *(_QWORD *)v52 = v14;
    *((_QWORD *)v52 + 1) = v10;
    if (v50)
    {
      while (1)
      {
        v53 = v13 - 1;
        if (v13 >= 4)
        {
          v58 = &v51[16 * v13];
          v59 = *((_QWORD *)v58 - 8);
          v60 = *((_QWORD *)v58 - 7);
          v64 = __OFSUB__(v60, v59);
          v61 = v60 - v59;
          if (v64)
            goto LABEL_121;
          v63 = *((_QWORD *)v58 - 6);
          v62 = *((_QWORD *)v58 - 5);
          v64 = __OFSUB__(v62, v63);
          v56 = v62 - v63;
          v57 = v64;
          if (v64)
            goto LABEL_122;
          v65 = v13 - 2;
          v66 = &v51[16 * v13 - 32];
          v68 = *(_QWORD *)v66;
          v67 = *((_QWORD *)v66 + 1);
          v64 = __OFSUB__(v67, v68);
          v69 = v67 - v68;
          if (v64)
            goto LABEL_124;
          v64 = __OFADD__(v56, v69);
          v70 = v56 + v69;
          if (v64)
            goto LABEL_127;
          if (v70 >= v61)
          {
            v88 = &v51[16 * v53];
            v90 = *(_QWORD *)v88;
            v89 = *((_QWORD *)v88 + 1);
            v64 = __OFSUB__(v89, v90);
            v91 = v89 - v90;
            if (v64)
              goto LABEL_131;
            v81 = v56 < v91;
            goto LABEL_91;
          }
        }
        else
        {
          if (v13 != 3)
          {
            v82 = *((_QWORD *)v12 + 4);
            v83 = *((_QWORD *)v12 + 5);
            v64 = __OFSUB__(v83, v82);
            v75 = v83 - v82;
            v76 = v64;
            goto LABEL_85;
          }
          v55 = *((_QWORD *)v12 + 4);
          v54 = *((_QWORD *)v12 + 5);
          v64 = __OFSUB__(v54, v55);
          v56 = v54 - v55;
          v57 = v64;
        }
        if ((v57 & 1) != 0)
          goto LABEL_123;
        v65 = v13 - 2;
        v71 = &v51[16 * v13 - 32];
        v73 = *(_QWORD *)v71;
        v72 = *((_QWORD *)v71 + 1);
        v74 = __OFSUB__(v72, v73);
        v75 = v72 - v73;
        v76 = v74;
        if (v74)
          goto LABEL_126;
        v77 = &v51[16 * v53];
        v79 = *(_QWORD *)v77;
        v78 = *((_QWORD *)v77 + 1);
        v64 = __OFSUB__(v78, v79);
        v80 = v78 - v79;
        if (v64)
          goto LABEL_129;
        if (__OFADD__(v75, v80))
          goto LABEL_130;
        if (v75 + v80 >= v56)
        {
          v81 = v56 < v80;
LABEL_91:
          if (v81)
            v53 = v65;
          goto LABEL_93;
        }
LABEL_85:
        if ((v76 & 1) != 0)
          goto LABEL_125;
        v84 = &v51[16 * v53];
        v86 = *(_QWORD *)v84;
        v85 = *((_QWORD *)v84 + 1);
        v64 = __OFSUB__(v85, v86);
        v87 = v85 - v86;
        if (v64)
          goto LABEL_128;
        if (v87 < v75)
          goto LABEL_15;
LABEL_93:
        v92 = v53 - 1;
        if (v53 - 1 >= v13)
        {
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
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
          goto LABEL_141;
        }
        if (!v11)
          goto LABEL_143;
        v93 = &v51[16 * v92];
        v94 = *(_QWORD *)v93;
        v95 = &v51[16 * v53];
        v96 = *((_QWORD *)v95 + 1);
        specialized _merge<A>(low:mid:high:buffer:by:)((char *)(v11 + 40 * *(_QWORD *)v93), (char *)(v11 + 40 * *(_QWORD *)v95), v11 + 40 * v96, __dst);
        if (v1)
          goto LABEL_101;
        if (v96 < v94)
          goto LABEL_118;
        if (v53 > *((_QWORD *)v12 + 2))
          goto LABEL_119;
        *(_QWORD *)v93 = v94;
        *(_QWORD *)&v51[16 * v92 + 8] = v96;
        v97 = *((_QWORD *)v12 + 2);
        if (v53 >= v97)
          goto LABEL_120;
        v13 = v97 - 1;
        memmove(&v51[16 * v53], v95 + 16, 16 * (v97 - 1 - v53));
        *((_QWORD *)v12 + 2) = v97 - 1;
        v11 = v113;
        if (v97 <= 2)
          goto LABEL_15;
      }
    }
    v13 = 1;
LABEL_15:
    v6 = v111;
    v3 = v112;
    if (v10 >= v112)
    {
      v9 = v110;
      goto LABEL_104;
    }
  }
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
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t v1;
  Swift::Int v3;
  Swift::Int result;
  uint64_t v5;
  Swift::Int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::Int v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  Swift::Int v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  Swift::Int v23;
  Swift::Int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  Swift::Int v33;
  uint64_t v34;
  unint64_t v35;
  Swift::Int v36;
  uint64_t v37;
  uint64_t v38;
  _OWORD *v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  unint64_t v44;
  unint64_t v45;
  char *v46;
  char *v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  BOOL v59;
  unint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  BOOL v69;
  uint64_t v70;
  char v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  BOOL v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  char *v88;
  char *v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  unint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t i;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  __int128 v103;
  __int128 v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  unint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  unint64_t v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t v118;
  Swift::Int v119;
  Swift::Int v120;
  uint64_t v121;
  char *__dst;

  v3 = a1[1];
  result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_136;
    if ((unint64_t)v3 >= 2)
    {
      v95 = 0;
      v96 = *a1;
      for (i = 1; i != v3; ++i)
      {
        v98 = *(_QWORD *)(v96 + 40 * i + 24);
        v99 = v95;
        do
        {
          v100 = v96 + v99;
          if (*(_QWORD *)(v96 + v99 + 24) >= v98)
            break;
          if (!v96)
            goto LABEL_140;
          v101 = v96 + v99;
          v102 = *(_QWORD *)(v96 + v99 + 72);
          v103 = *(_OWORD *)(v96 + v99 + 48);
          v104 = *(_OWORD *)(v100 + 16);
          v106 = *(_QWORD *)(v100 + 32);
          v105 = *(_QWORD *)(v100 + 40);
          *(_OWORD *)(v100 + 40) = *(_OWORD *)v100;
          *(_OWORD *)(v100 + 56) = v104;
          *(_QWORD *)(v100 + 72) = v106;
          *(_QWORD *)v101 = v105;
          *(_OWORD *)(v101 + 8) = v103;
          *(_QWORD *)(v100 + 24) = v98;
          v99 -= 40;
          *(_QWORD *)(v101 + 32) = v102;
        }
        while (v99 != -40);
        v95 += 40;
      }
    }
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_145;
  v6 = result;
  v116 = a1;
  if (v3 < 2)
  {
    v9 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v13 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v12 = (char *)MEMORY[0x24BEE4AF8];
LABEL_102:
      v107 = v12;
      v118 = v9;
      if (v13 >= 2)
      {
        v108 = *v116;
        do
        {
          v109 = v13 - 2;
          if (v13 < 2)
            goto LABEL_131;
          if (!v108)
            goto LABEL_144;
          v110 = v107;
          v111 = *(_QWORD *)&v107[16 * v109 + 32];
          v112 = *(_QWORD *)&v107[16 * v13 + 24];
          specialized _merge<A>(low:mid:high:buffer:by:)((char *)(v108 + 40 * v111), (char *)(v108 + 40 * *(_QWORD *)&v107[16 * v13 + 16]), v108 + 40 * v112, __dst);
          if (v1)
            break;
          if (v112 < v111)
            goto LABEL_132;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v110 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v110);
          if (v109 >= *((_QWORD *)v110 + 2))
            goto LABEL_133;
          v113 = &v110[16 * v109 + 32];
          *(_QWORD *)v113 = v111;
          *((_QWORD *)v113 + 1) = v112;
          v114 = *((_QWORD *)v110 + 2);
          if (v13 > v114)
            goto LABEL_134;
          memmove(&v110[16 * v13 + 16], &v110[16 * v13 + 32], 16 * (v114 - v13));
          v107 = v110;
          *((_QWORD *)v110 + 2) = v114 - 1;
          v13 = v114 - 1;
        }
        while (v114 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v118 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v118 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v7 = v5 >> 1;
    v8 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(_QWORD *)(v8 + 16) = v7;
    v118 = v8;
    __dst = (char *)(v8 + 32);
  }
  v10 = 0;
  v11 = *a1;
  v117 = *a1 + 104;
  v115 = *a1 + 32;
  v12 = (char *)MEMORY[0x24BEE4AF8];
  v119 = v6;
  v120 = v3;
  v121 = v11;
  while (1)
  {
    v14 = v10++;
    if (v10 < v3)
    {
      v15 = *(_QWORD *)(v11 + 40 * v10 + 24);
      v16 = *(_QWORD *)(v11 + 40 * v14 + 24);
      v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        v17 = (unint64_t *)(v117 + 40 * v14);
        v18 = v15;
        while (1)
        {
          v20 = *v17;
          v17 += 5;
          v19 = v20;
          if (v16 < v15 == v18 >= v20)
            break;
          ++v10;
          v18 = v19;
          if (v3 == v10)
          {
            v10 = v3;
            break;
          }
        }
      }
      if (v16 < v15)
      {
        if (v10 < v14)
          goto LABEL_137;
        if (v14 < v10)
        {
          v21 = 40 * v10;
          v22 = 40 * v14;
          v23 = v10;
          v24 = v14;
          do
          {
            if (v24 != --v23)
            {
              if (!v11)
                goto LABEL_143;
              v25 = v11 + v22;
              v26 = *(_QWORD *)(v11 + v22);
              v27 = v11 + v21;
              v28 = *(_QWORD *)(v11 + v22 + 24);
              v29 = *(_QWORD *)(v11 + v22 + 32);
              v30 = *(_OWORD *)(v11 + v22 + 8);
              v31 = *(_QWORD *)(v11 + v21 - 8);
              v32 = *(_OWORD *)(v11 + v21 - 24);
              *(_OWORD *)v25 = *(_OWORD *)(v11 + v21 - 40);
              *(_OWORD *)(v25 + 16) = v32;
              *(_QWORD *)(v25 + 32) = v31;
              *(_QWORD *)(v27 - 40) = v26;
              *(_OWORD *)(v27 - 32) = v30;
              *(_QWORD *)(v27 - 16) = v28;
              *(_QWORD *)(v27 - 8) = v29;
            }
            ++v24;
            v21 -= 40;
            v22 += 40;
          }
          while (v24 < v23);
        }
      }
    }
    if (v10 >= v3)
      goto LABEL_46;
    if (__OFSUB__(v10, v14))
      goto LABEL_135;
    if (v10 - v14 >= v6)
      goto LABEL_46;
    v33 = v14 + v6;
    if (__OFADD__(v14, v6))
      goto LABEL_138;
    if (v33 >= v3)
      v33 = v3;
    if (v33 < v14)
      break;
    if (v10 != v33)
    {
      v34 = v115 + 40 * v10;
      do
      {
        v35 = *(_QWORD *)(v11 + 40 * v10 + 24);
        v36 = v14;
        v37 = v34;
        do
        {
          if (*(_QWORD *)(v37 - 48) >= v35)
            break;
          if (!v11)
            goto LABEL_141;
          v38 = v37 - 32;
          v39 = (_OWORD *)(v37 - 72);
          v40 = *(_QWORD *)(v37 - 40);
          *(_QWORD *)(v37 - 40) = *(_QWORD *)v37;
          v37 -= 40;
          v41 = *(_QWORD *)(v37 + 8);
          v42 = *(_OWORD *)(v37 + 16);
          v43 = v39[1];
          *(_OWORD *)v38 = *v39;
          *(_OWORD *)(v38 + 16) = v43;
          *(_QWORD *)(v38 + 32) = v40;
          *(_QWORD *)(v37 - 32) = v41;
          *(_OWORD *)(v37 - 24) = v42;
          *(_QWORD *)(v37 - 8) = v35;
          ++v36;
        }
        while (v10 != v36);
        ++v10;
        v34 += 40;
      }
      while (v10 != v33);
      v10 = v33;
    }
LABEL_46:
    if (v10 < v14)
      goto LABEL_130;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v45 = *((_QWORD *)v12 + 2);
    v44 = *((_QWORD *)v12 + 3);
    v13 = v45 + 1;
    v11 = v121;
    if (v45 >= v44 >> 1)
    {
      v94 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v44 > 1), v45 + 1, 1, v12);
      v11 = v121;
      v12 = v94;
    }
    *((_QWORD *)v12 + 2) = v13;
    v46 = v12 + 32;
    v47 = &v12[16 * v45 + 32];
    *(_QWORD *)v47 = v14;
    *((_QWORD *)v47 + 1) = v10;
    if (v45)
    {
      while (1)
      {
        v48 = v13 - 1;
        if (v13 >= 4)
        {
          v53 = &v46[16 * v13];
          v54 = *((_QWORD *)v53 - 8);
          v55 = *((_QWORD *)v53 - 7);
          v59 = __OFSUB__(v55, v54);
          v56 = v55 - v54;
          if (v59)
            goto LABEL_119;
          v58 = *((_QWORD *)v53 - 6);
          v57 = *((_QWORD *)v53 - 5);
          v59 = __OFSUB__(v57, v58);
          v51 = v57 - v58;
          v52 = v59;
          if (v59)
            goto LABEL_120;
          v60 = v13 - 2;
          v61 = &v46[16 * v13 - 32];
          v63 = *(_QWORD *)v61;
          v62 = *((_QWORD *)v61 + 1);
          v59 = __OFSUB__(v62, v63);
          v64 = v62 - v63;
          if (v59)
            goto LABEL_122;
          v59 = __OFADD__(v51, v64);
          v65 = v51 + v64;
          if (v59)
            goto LABEL_125;
          if (v65 >= v56)
          {
            v83 = &v46[16 * v48];
            v85 = *(_QWORD *)v83;
            v84 = *((_QWORD *)v83 + 1);
            v59 = __OFSUB__(v84, v85);
            v86 = v84 - v85;
            if (v59)
              goto LABEL_129;
            v76 = v51 < v86;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            v77 = *((_QWORD *)v12 + 4);
            v78 = *((_QWORD *)v12 + 5);
            v59 = __OFSUB__(v78, v77);
            v70 = v78 - v77;
            v71 = v59;
            goto LABEL_77;
          }
          v50 = *((_QWORD *)v12 + 4);
          v49 = *((_QWORD *)v12 + 5);
          v59 = __OFSUB__(v49, v50);
          v51 = v49 - v50;
          v52 = v59;
        }
        if ((v52 & 1) != 0)
          goto LABEL_121;
        v60 = v13 - 2;
        v66 = &v46[16 * v13 - 32];
        v68 = *(_QWORD *)v66;
        v67 = *((_QWORD *)v66 + 1);
        v69 = __OFSUB__(v67, v68);
        v70 = v67 - v68;
        v71 = v69;
        if (v69)
          goto LABEL_124;
        v72 = &v46[16 * v48];
        v74 = *(_QWORD *)v72;
        v73 = *((_QWORD *)v72 + 1);
        v59 = __OFSUB__(v73, v74);
        v75 = v73 - v74;
        if (v59)
          goto LABEL_127;
        if (__OFADD__(v70, v75))
          goto LABEL_128;
        if (v70 + v75 >= v51)
        {
          v76 = v51 < v75;
LABEL_83:
          if (v76)
            v48 = v60;
          goto LABEL_85;
        }
LABEL_77:
        if ((v71 & 1) != 0)
          goto LABEL_123;
        v79 = &v46[16 * v48];
        v81 = *(_QWORD *)v79;
        v80 = *((_QWORD *)v79 + 1);
        v59 = __OFSUB__(v80, v81);
        v82 = v80 - v81;
        if (v59)
          goto LABEL_126;
        if (v82 < v70)
          goto LABEL_15;
LABEL_85:
        v87 = v48 - 1;
        if (v48 - 1 >= v13)
        {
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
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
          goto LABEL_139;
        }
        if (!v11)
          goto LABEL_142;
        v88 = v12;
        v89 = &v46[16 * v87];
        v90 = *(_QWORD *)v89;
        v91 = &v46[16 * v48];
        v92 = *((_QWORD *)v91 + 1);
        specialized _merge<A>(low:mid:high:buffer:by:)((char *)(v11 + 40 * *(_QWORD *)v89), (char *)(v11 + 40 * *(_QWORD *)v91), v11 + 40 * v92, __dst);
        if (v1)
          goto LABEL_93;
        if (v92 < v90)
          goto LABEL_116;
        if (v48 > *((_QWORD *)v88 + 2))
          goto LABEL_117;
        *(_QWORD *)v89 = v90;
        *(_QWORD *)&v46[16 * v87 + 8] = v92;
        v93 = *((_QWORD *)v88 + 2);
        if (v48 >= v93)
          goto LABEL_118;
        v12 = v88;
        v13 = v93 - 1;
        memmove(&v46[16 * v48], v91 + 16, 16 * (v93 - 1 - v48));
        *((_QWORD *)v88 + 2) = v93 - 1;
        v11 = v121;
        if (v93 <= 2)
          goto LABEL_15;
      }
    }
    v13 = 1;
LABEL_15:
    v6 = v119;
    v3 = v120;
    if (v10 >= v120)
    {
      v9 = v118;
      goto LABEL_102;
    }
  }
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
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;

  if (a3 != a2)
  {
    v4 = *a4;
    v5 = *a4 + 40 * a3 - 16;
LABEL_5:
    v6 = v4 + 40 * a3;
    v7 = *(_QWORD *)(v6 + 24);
    v8 = *(double *)(v6 + 32);
    v9 = result;
    v10 = v5;
    while (1)
    {
      if (v7 == *(_QWORD *)v10)
        v11 = *(double *)(v10 + 8) < v8;
      else
        v11 = *(_QWORD *)v10 < v7;
      if (!v11)
      {
LABEL_4:
        ++a3;
        v5 += 40;
        if (a3 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v4)
        break;
      v12 = *(_QWORD *)(v10 + 16);
      v13 = *(_OWORD *)(v10 + 24);
      v14 = *(_OWORD *)(v10 - 8);
      *(_OWORD *)(v10 + 16) = *(_OWORD *)(v10 - 24);
      *(_OWORD *)(v10 + 32) = v14;
      *(_QWORD *)(v10 + 48) = *(_QWORD *)(v10 + 8);
      *(_QWORD *)(v10 - 24) = v12;
      *(_OWORD *)(v10 - 16) = v13;
      *(_QWORD *)v10 = v7;
      *(double *)(v10 + 8) = v8;
      v10 -= 40;
      if (a3 == ++v9)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t specialized _merge<A>(low:mid:high:buffer:by:)(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  _BOOL4 v16;
  char *v17;
  char *v18;
  __int128 v19;
  __int128 v20;
  char *v21;
  unint64_t v22;
  char *v23;
  unint64_t v24;
  unint64_t v25;
  _BOOL4 v26;
  char *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t result;
  char *v33;
  const void *v34;
  char *v35;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = (a2 - __src) / 40;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 40;
  v35 = __src;
  v34 = __dst;
  if (v9 >= v11)
  {
    if (v10 >= -39)
    {
      if (__dst != a2 || &a2[40 * v11] <= __dst)
        memmove(__dst, a2, 40 * v11);
      v21 = &v4[40 * v11];
      v33 = v21;
      v35 = v6;
      if (v7 < v6 && v10 >= 40)
      {
        v22 = a3 - 40;
        do
        {
          v23 = (char *)(v22 + 40);
          v24 = *((_QWORD *)v21 - 2);
          v25 = *((_QWORD *)v6 - 2);
          if (v24 == v25)
            v26 = *((double *)v6 - 1) < *((double *)v21 - 1);
          else
            v26 = v25 < v24;
          if (v26)
          {
            v27 = v6 - 40;
            if (v23 != v6 || v22 >= (unint64_t)v6)
            {
              v28 = *(_OWORD *)v27;
              v29 = *(_OWORD *)(v6 - 24);
              *(_QWORD *)(v22 + 32) = *((_QWORD *)v6 - 1);
              *(_OWORD *)v22 = v28;
              *(_OWORD *)(v22 + 16) = v29;
            }
            v35 = v6 - 40;
            if (v27 <= v7)
              break;
          }
          else
          {
            v33 = v21 - 40;
            if (v23 < v21 || v22 >= (unint64_t)v21 || v23 != v21)
            {
              v30 = *(_OWORD *)(v21 - 40);
              v31 = *(_OWORD *)(v21 - 24);
              *(_QWORD *)(v22 + 32) = *((_QWORD *)v21 - 1);
              *(_OWORD *)v22 = v30;
              *(_OWORD *)(v22 + 16) = v31;
            }
            v27 = v6;
            v21 -= 40;
            if (v6 <= v7)
              break;
          }
          v22 -= 40;
          v6 = v27;
        }
        while (v21 > v4);
      }
LABEL_46:
      specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)((void **)&v35, &v34, &v33);
      return 1;
    }
  }
  else if (v8 >= -39)
  {
    if (__dst != __src || &__src[40 * v9] <= __dst)
      memmove(__dst, __src, 40 * v9);
    v12 = &v4[40 * v9];
    v33 = v12;
    if ((unint64_t)v6 < a3 && v8 >= 40)
    {
      v13 = v4;
      while (1)
      {
        v14 = *((_QWORD *)v6 + 3);
        v15 = *((_QWORD *)v13 + 3);
        if (v14 == v15)
          v16 = *((double *)v13 + 4) < *((double *)v6 + 4);
        else
          v16 = v15 < v14;
        if (v16)
        {
          v17 = v6 + 40;
          v18 = v6;
          if (v7 == v6 && v7 < v17)
            goto LABEL_21;
        }
        else
        {
          v4 = v13 + 40;
          v18 = v13;
          v17 = v6;
          if (v7 == v13)
          {
            v13 += 40;
            if (v7 < v4)
              goto LABEL_21;
          }
          else
          {
            v13 += 40;
          }
        }
        v19 = *(_OWORD *)v18;
        v20 = *((_OWORD *)v18 + 1);
        *((_QWORD *)v7 + 4) = *((_QWORD *)v18 + 4);
        *(_OWORD *)v7 = v19;
        *((_OWORD *)v7 + 1) = v20;
LABEL_21:
        v7 += 40;
        if (v13 < v12)
        {
          v6 = v17;
          if ((unint64_t)v17 < a3)
            continue;
        }
        v34 = v4;
        v35 = v7;
        goto LABEL_46;
      }
    }
    goto LABEL_46;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  __int128 v16;
  __int128 v17;
  char *v18;
  unint64_t v19;
  char *v20;
  char *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t result;
  char *v27;
  const void *v28;
  char *v29;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = (a2 - __src) / 40;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 40;
  v29 = __src;
  v28 = __dst;
  if (v9 >= v11)
  {
    if (v10 >= -39)
    {
      if (__dst != a2 || &a2[40 * v11] <= __dst)
        memmove(__dst, a2, 40 * v11);
      v18 = &v4[40 * v11];
      v27 = v18;
      v29 = v6;
      if (v7 < v6 && v10 >= 40)
      {
        v19 = a3 - 40;
        do
        {
          v20 = (char *)(v19 + 40);
          if (*((_QWORD *)v6 - 2) >= *((_QWORD *)v18 - 2))
          {
            v27 = v18 - 40;
            if (v20 < v18 || v19 >= (unint64_t)v18 || v20 != v18)
            {
              v24 = *(_OWORD *)(v18 - 40);
              v25 = *(_OWORD *)(v18 - 24);
              *(_QWORD *)(v19 + 32) = *((_QWORD *)v18 - 1);
              *(_OWORD *)v19 = v24;
              *(_OWORD *)(v19 + 16) = v25;
            }
            v21 = v6;
            v18 -= 40;
            if (v6 <= v7)
              break;
          }
          else
          {
            v21 = v6 - 40;
            if (v20 != v6 || v19 >= (unint64_t)v6)
            {
              v22 = *(_OWORD *)v21;
              v23 = *(_OWORD *)(v6 - 24);
              *(_QWORD *)(v19 + 32) = *((_QWORD *)v6 - 1);
              *(_OWORD *)v19 = v22;
              *(_OWORD *)(v19 + 16) = v23;
            }
            v29 = v6 - 40;
            if (v21 <= v7)
              break;
          }
          v19 -= 40;
          v6 = v21;
        }
        while (v18 > v4);
      }
LABEL_40:
      specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)((void **)&v29, &v28, &v27);
      return 1;
    }
  }
  else if (v8 >= -39)
  {
    if (__dst != __src || &__src[40 * v9] <= __dst)
      memmove(__dst, __src, 40 * v9);
    v12 = &v4[40 * v9];
    v27 = v12;
    if ((unint64_t)v6 < a3 && v8 >= 40)
    {
      v13 = v4;
      while (1)
      {
        if (*((_QWORD *)v13 + 3) >= *((_QWORD *)v6 + 3))
        {
          v4 = v13 + 40;
          v15 = v13;
          v14 = v6;
          if (v7 == v13)
          {
            v13 += 40;
            if (v7 < v4)
              goto LABEL_18;
          }
          else
          {
            v13 += 40;
          }
        }
        else
        {
          v14 = v6 + 40;
          v15 = v6;
          if (v7 == v6 && v7 < v14)
            goto LABEL_18;
        }
        v16 = *(_OWORD *)v15;
        v17 = *((_OWORD *)v15 + 1);
        *((_QWORD *)v7 + 4) = *((_QWORD *)v15 + 4);
        *(_OWORD *)v7 = v16;
        *((_OWORD *)v7 + 1) = v17;
LABEL_18:
        v7 += 40;
        if (v13 < v12)
        {
          v6 = v14;
          if ((unint64_t)v14 < a3)
            continue;
        }
        v28 = v4;
        v29 = v7;
        goto LABEL_40;
      }
    }
    goto LABEL_40;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Range<Int>>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  char *result;
  uint64_t v6;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  if (v4 <= -40)
  {
    result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v6 = v4 / 40;
    if (result != v3 || result >= &v3[40 * v6])
      return (char *)memmove(result, v3, 40 * v6);
  }
  return result;
}

char *specialized _ArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

{
  char **v3;
  uint64_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<EnhancedMSPSharedTripContact>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[40 * v8])
      memmove(v12, v13, 40 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[40 * v8] || v12 >= &v13[40 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

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
    v5 = a4 + 40 * a1 + 32;
    v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay7SiriGeo28EnhancedMSPSharedTripContactVG_AHs5NeverOTg503_s7d5Geo14i65ServiceC30rankAndSortHandlesByPopularity15forHandleValuesSayAA021fgH18C0VGAH_tFA2GXEfU0_AF0iM0CSDySSSo8NSNumberCGSgTf1cn_nTf4ngg_n(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t *i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v4 = v3;
  v5 = *(_QWORD *)(a1 + 16);
  v6 = MEMORY[0x24BEE4AF8];
  if (v5)
  {
    v32 = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v5, 0);
    v6 = v32;
    for (i = (uint64_t *)(a1 + 64); ; i += 5)
    {
      v9 = *(i - 3);
      v11 = (void *)*(i - 2);
      v10 = *(i - 1);
      v12 = *i;
      *(_QWORD *)&v24 = *(i - 4);
      *((_QWORD *)&v24 + 1) = v9;
      v25 = v11;
      v26 = v10;
      v27 = v12;
      swift_bridgeObjectRetain();
      v13 = v11;
      closure #2 in ContactService.rankAndSortHandlesByPopularity(forHandleValues:)(&v24, a3, (uint64_t)&v28);
      if (v4)
        break;
      v4 = 0;

      swift_bridgeObjectRelease();
      v14 = v28;
      v15 = v29;
      v16 = v30;
      v17 = v31;
      v32 = v6;
      v19 = *(_QWORD *)(v6 + 16);
      v18 = *(_QWORD *)(v6 + 24);
      if (v19 >= v18 >> 1)
      {
        v22 = v29;
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v18 > 1, v19 + 1, 1);
        v15 = v22;
        v6 = v32;
      }
      *(_QWORD *)(v6 + 16) = v19 + 1;
      v20 = v6 + 40 * v19;
      *(_QWORD *)(v20 + 32) = v14;
      *(_OWORD *)(v20 + 40) = v15;
      *(_QWORD *)(v20 + 56) = v16;
      *(_QWORD *)(v20 + 64) = v17;
      if (!--v5)
        return v6;
    }
    swift_release();

    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_230890E98()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void partial apply for closure #1 in ContactService.rankAndSortHandlesByPopularityAndType(forHandleValues:_:)(uint64_t a1, void *a2)
{
  uint64_t v2;

  closure #1 in ContactService.rankAndSortHandlesByPopularityAndType(forHandleValues:_:)(a1, a2, *(_QWORD *)(v2 + 16), *(void (**)(uint64_t))(v2 + 24));
}

unint64_t lazy protocol witness table accessor for type ContactServiceError and conformance ContactServiceError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactServiceError and conformance ContactServiceError;
  if (!lazy protocol witness table cache variable for type ContactServiceError and conformance ContactServiceError)
  {
    result = MEMORY[0x2348BB60C](&protocol conformance descriptor for ContactServiceError, &type metadata for ContactServiceError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactServiceError and conformance ContactServiceError);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ContactServiceError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ContactServiceError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_230891004 + 4 * byte_2308A3C45[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_230891038 + 4 * byte_2308A3C40[v4]))();
}

uint64_t sub_230891038(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_230891040(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x230891048);
  return result;
}

uint64_t sub_230891054(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23089105CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_230891060(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_230891068(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for ContactServiceError(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for ContactServiceError(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ContactServiceError()
{
  return &type metadata for ContactServiceError;
}

uint64_t type metadata accessor for ContactService()
{
  return objc_opt_self();
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x2348BB60C](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
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

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t MapsService.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  *(_QWORD *)(v0 + 16) = OS_os_log.init(subsystem:category:)();
  *(_OWORD *)(v0 + 24) = xmmword_2308A3C00;
  return v0;
}

uint64_t EnhancedMSPSharedTripContact.handle.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EnhancedMSPSharedTripContact.handle.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*EnhancedMSPSharedTripContact.handle.modify())()
{
  return destructiveProjectEnumData for ContactServiceError;
}

id EnhancedMSPSharedTripContact.sharedTripContact.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

void EnhancedMSPSharedTripContact.sharedTripContact.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
}

uint64_t (*EnhancedMSPSharedTripContact.sharedTripContact.modify())()
{
  return destructiveProjectEnumData for ContactServiceError;
}

uint64_t EnhancedMSPSharedTripContact.capabilityType.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t EnhancedMSPSharedTripContact.capabilityType.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = result;
  return result;
}

uint64_t (*EnhancedMSPSharedTripContact.capabilityType.modify())()
{
  return destructiveProjectEnumData for ContactServiceError;
}

double EnhancedMSPSharedTripContact.popularity.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 32);
}

void EnhancedMSPSharedTripContact.popularity.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 32) = a1;
}

uint64_t (*EnhancedMSPSharedTripContact.popularity.modify())()
{
  return destructiveProjectEnumData for ContactServiceError;
}

uint64_t EnhancedMSPSharedTripContact.fullName.getter()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(v0 + 16), sel_contact);
  if (!v1)
    goto LABEL_5;
  v2 = v1;
  v3 = objc_msgSend((id)objc_opt_self(), sel_stringFromContact_style_, v1, 0);
  if (!v3)
  {

LABEL_5:
    v5 = *(_QWORD *)v0;
    swift_bridgeObjectRetain();
    return v5;
  }
  v4 = v3;
  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v5;
}

uint64_t EnhancedMSPSharedTripContact.contactId.getter()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;

  v1 = objc_msgSend(*(id *)(v0 + 16), sel_contact);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_identifier);
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v4;
}

uint64_t EnhancedMSPSharedTripContact.debugDescription.getter()
{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;
  void *v3;
  Swift::String v4;
  Swift::String v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  Swift::String v11;
  Swift::String v12;
  Swift::String v13;
  Swift::String v14;

  _StringGuts.grow(_:)(91);
  v1._countAndFlagsBits = 0xD000000000000024;
  v1._object = (void *)0x80000002308A4A80;
  String.append(_:)(v1);
  v2 = *(_QWORD *)v0;
  v3 = *(void **)(v0 + 8);
  swift_bridgeObjectRetain();
  v4._countAndFlagsBits = v2;
  v4._object = v3;
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 0xD000000000000013;
  v5._object = (void *)0x80000002308A4AB0;
  String.append(_:)(v5);
  v6 = *(id *)(v0 + 16);
  v7 = objc_msgSend(v6, sel_description);
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v9;

  v11._countAndFlagsBits = v8;
  v11._object = v10;
  String.append(_:)(v11);

  swift_bridgeObjectRelease();
  v12._object = (void *)0x80000002308A4AD0;
  v12._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v12);
  v13._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 0x72616C75706F7020;
  v14._object = (void *)0xEC0000003A797469;
  String.append(_:)(v14);
  Double.write<A>(to:)();
  return 0;
}

void EnhancedMSPSharedTripContact.init(_:_:)(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = objc_msgSend(a1, sel_displayName);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = v8;

  *a3 = v7;
  a3[1] = v9;
  a3[2] = (uint64_t)a1;
  a3[3] = a2;
  a3[4] = 0;
}

Swift::UInt __swiftcall EnhancedMSPSharedTripContact.getCapabilityType()()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

Swift::Bool __swiftcall EnhancedMSPSharedTripContact.isPhoneNumber()()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_isPhoneNumber);
}

INPersonHandle __swiftcall EnhancedMSPSharedTripContact.getPersonHandle()()
{
  uint64_t v0;

  return (INPersonHandle)specialized EnhancedMSPSharedTripContact.getPersonHandle()(*(void **)(v0 + 16));
}

BOOL static MapsService.ShareETAConfigurationError.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void MapsService.ShareETAConfigurationError.hash(into:)(uint64_t a1, char a2)
{
  Hasher._combine(_:)(a2 & 1);
}

Swift::Int MapsService.ShareETAConfigurationError.hashValue.getter(char a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1 & 1);
  return Hasher._finalize()();
}

id MapsService.logObject.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

uint64_t MapsService.timeout.getter()
{
  return 5;
}

void *MapsService.observer.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  swift_beginAccess();
  v1 = *(void **)(v0 + 32);
  v2 = v1;
  return v1;
}

void MapsService.observer.setter(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  swift_beginAccess();
  v3 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = a1;

}

uint64_t (*MapsService.observer.modify())()
{
  swift_beginAccess();
  return MapsService.observer.modify;
}

id MapsService.CapabilityFetcherObserver.logObject.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_logObject);
}

uint64_t MapsService.CapabilityFetcherObserver.timeout.getter()
{
  return 5;
}

id MapsService.CapabilityFetcherObserver.levelFetcher.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_levelFetcher);
}

uint64_t key path getter for MapsService.CapabilityFetcherObserver.completion : MapsService.CapabilityFetcherObserver@<X0>(_QWORD **a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD *);

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x78))();
  if (result)
  {
    v5 = result;
    v6 = v4;
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v5;
    *(_QWORD *)(result + 24) = v6;
    v7 = partial apply for thunk for @escaping @callee_guaranteed (@guaranteed [EnhancedMSPSharedTripContact]) -> ();
  }
  else
  {
    v7 = 0;
  }
  *a2 = v7;
  a2[1] = result;
  return result;
}

uint64_t key path setter for MapsService.CapabilityFetcherObserver.completion : MapsService.CapabilityFetcherObserver(uint64_t *a1, _QWORD **a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t (*v7)(uint64_t (*)(uint64_t), uint64_t);

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed [EnhancedMSPSharedTripContact]) -> (@out ());
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *(uint64_t (**)(uint64_t (*)(uint64_t), uint64_t))((*MEMORY[0x24BEE4EA0] & **a2) + 0x80);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed [EnhancedMSPSharedTripContact]) -> ())?(v3);
  return v7(v6, v5);
}

uint64_t MapsService.CapabilityFetcherObserver.completion.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_completion);
  swift_beginAccess();
  v2 = *v1;
  outlined copy of (@escaping @callee_guaranteed (@guaranteed [EnhancedMSPSharedTripContact]) -> ())?(*v1);
  return v2;
}

uint64_t MapsService.CapabilityFetcherObserver.completion.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;

  v5 = (uint64_t *)(v2 + OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_completion);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  return outlined consume of (@escaping @callee_guaranteed (@guaranteed [EnhancedMSPSharedTripContact]) -> ())?(v6);
}

uint64_t (*MapsService.CapabilityFetcherObserver.completion.modify())()
{
  swift_beginAccess();
  return MapsService.CapabilityFetcherObserver.completion.modify;
}

uint64_t MapsService.CapabilityFetcherObserver.capabilities.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t MapsService.CapabilityFetcherObserver.capabilities.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_capabilities);
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*MapsService.CapabilityFetcherObserver.capabilities.modify())()
{
  swift_beginAccess();
  return MapsService.observer.modify;
}

id MapsService.CapabilityFetcherObserver.__allocating_init(_:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = specialized MapsService.CapabilityFetcherObserver.init(_:)(a1);

  return v4;
}

id MapsService.CapabilityFetcherObserver.init(_:)(void *a1)
{
  id v2;

  v2 = specialized MapsService.CapabilityFetcherObserver.init(_:)(a1);

  return v2;
}

void MapsService.CapabilityFetcherObserver.fetchCapabilities(_:_:)(unint64_t a1, void (*a2)(void), uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v8;
  unint64_t v9;
  void (*v10)(void (*)(void), uint64_t);
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void (*v25)(uint64_t *, _QWORD);
  _QWORD **v26;
  _QWORD *v27;
  _QWORD *v28;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v30;
  unint64_t v31;
  _QWORD *v32;
  id v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  Class isa;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(void);
  unint64_t v50;
  uint64_t (*v51)(uint64_t *);
  id v52;
  uint64_t v53;
  unint64_t v54;
  _QWORD *v55;
  uint64_t v56[4];
  unint64_t v57;

  static os_log_type_t.info.getter();
  v8 = *(_QWORD *)((char *)v3 + OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_logObject);
  v9 = MEMORY[0x24BEE4AF8];
  os_log(_:dso:log:_:_:)();
  v10 = *(void (**)(void (*)(void), uint64_t))((*MEMORY[0x24BEE4EA0] & *v3) + 0x80);
  swift_retain();
  v49 = a2;
  v55 = v3;
  v10(a2, a3);
  v57 = v9;
  static os_log_type_t.info.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_2308A3C30;
  *(_QWORD *)(v11 + 56) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [MSPSharedTripContact]);
  *(_QWORD *)(v11 + 64) = lazy protocol witness table accessor for type [CNContact] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [MSPSharedTripContact] and conformance [A], &demangling cache variable for type metadata for [MSPSharedTripContact]);
  *(_QWORD *)(v11 + 32) = v9;
  v12 = 0xE400000000000000;
  v13 = 1702195828;
  if ((v9 & 0xC000000000000000) != 0)
  {
    v35 = _CocoaArrayWrapper.endIndex.getter();
    v13 = v35 ? 0x65736C6166 : 1702195828;
    if (v35)
      v12 = 0xE500000000000000;
  }
  *(_QWORD *)(v11 + 96) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v11 + 104) = lazy protocol witness table accessor for type String and conformance String();
  *(_QWORD *)(v11 + 72) = v13;
  *(_QWORD *)(v11 + 80) = v12;
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v14 = _CocoaArrayWrapper.endIndex.getter();
    v15 = (_QWORD *)&unk_255E80000;
    if (v14)
      goto LABEL_4;
LABEL_26:
    swift_bridgeObjectRelease();
    v34 = MEMORY[0x24BEE4AF8];
    goto LABEL_27;
  }
  v14 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v15 = &unk_255E80000;
  if (!v14)
    goto LABEL_26;
LABEL_4:
  if (v14 < 1)
  {
    __break(1u);
LABEL_44:
    swift_bridgeObjectRetain();
    v41 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    goto LABEL_30;
  }
  v48 = v8;
  v16 = 0;
  v51 = *(uint64_t (**)(uint64_t *))((*MEMORY[0x24BEE4EA0] & *v3) + 0xA0);
  v52 = *(id *)((char *)v3 + v15[15]);
  v50 = a1 & 0xC000000000000001;
  v53 = v14;
  v54 = a1;
  do
  {
    if (v50)
      v17 = (id)MEMORY[0x2348BB150](v16, a1);
    else
      v17 = *(id *)(a1 + 8 * v16 + 32);
    v18 = v17;
    v19 = objc_msgSend(v52, sel_capabilityLevelForContact_, v18);
    v20 = objc_msgSend(v18, sel_displayName);
    v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v23 = v22;

    v24 = v18;
    swift_bridgeObjectRetain();
    v25 = (void (*)(uint64_t *, _QWORD))v51(v56);
    v27 = v26;
    v28 = *v26;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v27 = v28;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v28 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v28[2] + 1, 1, v28);
      *v27 = v28;
    }
    v31 = v28[2];
    v30 = v28[3];
    if (v31 >= v30 >> 1)
    {
      v28 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v30 > 1), v31 + 1, 1, v28);
      *v27 = v28;
    }
    v28[2] = v31 + 1;
    v32 = &v28[5 * v31];
    v32[4] = v21;
    v32[5] = v23;
    v32[6] = v24;
    v32[7] = v19;
    v32[8] = 0;
    v25(v56, 0);
    a1 = v54;
    if (!v19)
    {
      v33 = v24;
      MEMORY[0x2348BB018]();
      if (*(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
    }
    ++v16;
    swift_bridgeObjectRelease();

  }
  while (v53 != v16);
  swift_bridgeObjectRelease();
  v34 = v57;
  v8 = v48;
LABEL_27:
  swift_bridgeObjectRetain_n();
  LOBYTE(a1) = static os_log_type_t.default.getter();
  if (!os_log_type_enabled((os_log_t)v8, (os_log_type_t)a1))
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_38;
  }
  v13 = v8;
  v8 = swift_slowAlloc();
  v4 = swift_slowAlloc();
  v56[0] = v4;
  *(_DWORD *)v8 = 136315394;
  v36 = type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for MSPSharedTripContact);
  v37 = swift_bridgeObjectRetain();
  v38 = MEMORY[0x2348BB03C](v37, v36);
  v40 = v39;
  swift_bridgeObjectRelease();
  getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v38, v40, v56);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  *(_WORD *)(v8 + 12) = 2080;
  if (v34 >> 62)
    goto LABEL_44;
  v41 = *(_QWORD *)((v34 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_30:
  if (v41)
    v42 = 0x65736C6166;
  else
    v42 = 1702195828;
  if (v41)
    v43 = 0xE500000000000000;
  else
    v43 = 0xE400000000000000;
  getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v42, v43, v56);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_230887000, (os_log_t)v13, (os_log_type_t)a1, "fetchCapabilities for: %s %s", (uint8_t *)v8, 0x16u);
  swift_arrayDestroy();
  MEMORY[0x2348BB678](v4, -1, -1);
  MEMORY[0x2348BB678](v8, -1, -1);
LABEL_38:
  swift_beginAccess();
  if (v57 >> 62)
  {
    swift_bridgeObjectRetain();
    v46 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v46)
      goto LABEL_40;
  }
  else if (*(_QWORD *)((v57 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_40:
    v44 = *(void **)((char *)v55 + OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_levelFetcher);
    objc_msgSend(v44, sel_registerObserver_);
    type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for MSPSharedTripContact);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    objc_msgSend(v44, sel_requestCapabilityLevelsForContacts_, isa);

    return;
  }
  v47 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v55) + 0x90))(v47);
  v49();
  swift_bridgeObjectRelease();
}

Swift::Void __swiftcall MapsService.CapabilityFetcherObserver.capabilityLevelsDidUpdate()()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(_BYTE *, _QWORD);
  _QWORD **v45;
  _QWORD *v46;
  _QWORD *v47;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v49;
  void (*v50)(void);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  id v60;
  uint64_t (*v61)(uint64_t);
  _QWORD *v62;
  _BYTE v63[32];
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  uint64_t v73;

  v1 = v0;
  static os_log_type_t.info.getter();
  v2 = os_log(_:dso:log:_:_:)();
  v3 = *(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90);
  v4 = *(_QWORD *)(v3(v2) + 16);
  v5 = swift_bridgeObjectRelease();
  v6 = v4;
  if (v4)
  {
    v7 = 0;
    v58 = OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_levelFetcher;
    v8 = -(uint64_t)v4;
    v9 = 1;
    v55 = v4;
    v61 = v3;
    v62 = v0;
    v57 = -(uint64_t)v4;
LABEL_3:
    v54 = v9;
    if (v7 > v6)
      v6 = v7;
    v10 = -(uint64_t)v6;
    v11 = 40 * v7++ + 64;
    v56 = -(uint64_t)v6;
    do
    {
      if (v10 + v7 == 1)
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
        return;
      }
      v12 = v7 - 1;
      v13 = v3(v5);
      if (v7 - 1 >= *(_QWORD *)(v13 + 16))
        goto LABEL_26;
      v14 = *(_QWORD *)(v13 + v11 - 8);
      v5 = swift_bridgeObjectRelease();
      if (!v14)
      {
        static os_log_type_t.info.getter();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
        v15 = swift_allocObject();
        *(_OWORD *)(v15 + 16) = xmmword_2308A3BB0;
        v16 = ((uint64_t (*)(void))v3)();
        if (v12 >= *(_QWORD *)(v16 + 16))
          goto LABEL_27;
        v18 = *(_QWORD *)(v16 + v11 - 32);
        v17 = *(_QWORD *)(v16 + v11 - 24);
        v20 = *(void **)(v16 + v11 - 16);
        v19 = *(_QWORD *)(v16 + v11 - 8);
        v21 = *(_QWORD *)(v16 + v11);
        swift_bridgeObjectRetain();
        v22 = v20;
        v23 = swift_bridgeObjectRelease();
        v69 = v18;
        v70 = v17;
        v71 = v22;
        v72 = v19;
        v1 = v62;
        v73 = v21;
        v24 = EnhancedMSPSharedTripContact.description.getter(v23);
        v26 = v25;

        v3 = v61;
        swift_bridgeObjectRelease();
        *(_QWORD *)(v15 + 56) = MEMORY[0x24BEE0D00];
        v59 = lazy protocol witness table accessor for type String and conformance String();
        *(_QWORD *)(v15 + 64) = v59;
        *(_QWORD *)(v15 + 32) = v24;
        *(_QWORD *)(v15 + 40) = v26;
        os_log(_:dso:log:_:_:)();
        v27 = swift_bridgeObjectRelease();
        v28 = *(void **)((char *)v62 + v58);
        v29 = v61(v27);
        if (v12 >= *(_QWORD *)(v29 + 16))
          goto LABEL_28;
        v30 = *(id *)(v29 + v11 - 16);
        swift_bridgeObjectRelease();
        v31 = objc_msgSend(v28, sel_capabilityLevelForContact_, v30);

        if (!v31)
        {
          v9 = 0;
          v8 = v57;
          v6 = v55;
          if (v57 + v7)
            goto LABEL_3;
          return;
        }
        static os_log_type_t.info.getter();
        v32 = swift_allocObject();
        *(_OWORD *)(v32 + 16) = xmmword_2308A3C30;
        v33 = ((uint64_t (*)(void))v61)();
        if (v12 >= *(_QWORD *)(v33 + 16))
          goto LABEL_29;
        v60 = v31;
        v34 = *(_QWORD *)(v33 + v11 - 32);
        v35 = *(_QWORD *)(v33 + v11 - 24);
        v36 = *(void **)(v33 + v11 - 16);
        v37 = *(_QWORD *)(v33 + v11 - 8);
        v38 = *(_QWORD *)(v33 + v11);
        swift_bridgeObjectRetain();
        v39 = v36;
        v40 = swift_bridgeObjectRelease();
        v64 = v34;
        v65 = v35;
        v66 = v39;
        v67 = v37;
        v68 = v38;
        v41 = EnhancedMSPSharedTripContact.description.getter(v40);
        v43 = v42;

        v1 = v62;
        swift_bridgeObjectRelease();
        *(_QWORD *)(v32 + 56) = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v32 + 64) = v59;
        *(_QWORD *)(v32 + 32) = v41;
        *(_QWORD *)(v32 + 40) = v43;
        *(_QWORD *)(v32 + 96) = MEMORY[0x24BEE1E88];
        *(_QWORD *)(v32 + 104) = MEMORY[0x24BEE1ED8];
        *(_QWORD *)(v32 + 72) = v60;
        os_log(_:dso:log:_:_:)();
        swift_bridgeObjectRelease();
        v44 = (uint64_t (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))((*MEMORY[0x24BEE4EA0] & *v62)
                                                                                          + 0xA0))(v63);
        v46 = v45;
        v47 = *v45;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *v46 = v47;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v47 = specialized _ArrayBuffer._consumeAndCreateNew()(v47);
          *v46 = v47;
        }
        v10 = v56;
        v3 = v61;
        if (v12 >= v47[2])
          goto LABEL_30;
        *(_QWORD *)((char *)v47 + v11 - 8) = v60;
        v5 = v44(v63, 0);
        v8 = v57;
      }
      ++v7;
      v11 += 40;
    }
    while (v8 + v7 != 1);
    if ((v54 & 1) == 0)
      return;
  }
  v49 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v1) + 0x78))(v5);
  if (v49)
  {
    v50 = (void (*)(void))v49;
    static os_log_type_t.info.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    v51 = swift_allocObject();
    *(_OWORD *)(v51 + 16) = xmmword_2308A3BB0;
    v52 = ((uint64_t (*)(void))v3)();
    *(_QWORD *)(v51 + 56) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [EnhancedMSPSharedTripContact]);
    *(_QWORD *)(v51 + 64) = lazy protocol witness table accessor for type [CNContact] and conformance [A](&lazy protocol witness table cache variable for type [EnhancedMSPSharedTripContact] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [EnhancedMSPSharedTripContact]);
    *(_QWORD *)(v51 + 32) = v52;
    os_log(_:dso:log:_:_:)();
    v53 = swift_bridgeObjectRelease();
    v3(v53);
    v50();
    swift_bridgeObjectRelease();
    objc_msgSend(*(id *)((char *)v1 + OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_levelFetcher), sel_unregisterObserver_, v1);
    outlined consume of (@escaping @callee_guaranteed (@guaranteed [EnhancedMSPSharedTripContact]) -> ())?((uint64_t)v50);
  }
  else
  {
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
  }
}

id MapsService.CapabilityFetcherObserver.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void MapsService.CapabilityFetcherObserver.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MapsService.CapabilityFetcherObserver.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsService.CapabilityFetcherObserver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void MapsService.fetchCapabilities(for:_:)(uint64_t a1, void (*a2)(_QWORD, void *), uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  Class isa;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  void (*v30)(uint64_t, uint64_t (*)(uint64_t), _QWORD *);
  void *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;

  v4 = v3;
  v7 = *(NSObject **)(v3 + 16);
  swift_bridgeObjectRetain_n();
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v33 = a3;
    v10 = swift_slowAlloc();
    v34 = v10;
    *(_DWORD *)v9 = 136315138;
    v11 = swift_bridgeObjectRetain();
    v12 = MEMORY[0x2348BB03C](v11, MEMORY[0x24BEE0D00]);
    v14 = v13;
    swift_bridgeObjectRelease();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v12, v14, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_230887000, v7, v8, "fetchCapabilities %s", v9, 0xCu);
    swift_arrayDestroy();
    v15 = v10;
    a3 = v33;
    MEMORY[0x2348BB678](v15, -1, -1);
    MEMORY[0x2348BB678](v9, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  v16 = (void *)objc_opt_self();
  isa = Array._bridgeToObjectiveC()().super.isa;
  v18 = objc_msgSend(v16, sel_contactsFromHandles_, isa);

  type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for MSPSharedTripContact);
  v19 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  static os_log_type_t.info.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_2308A3BB0;
  *(_QWORD *)(v20 + 56) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [MSPSharedTripContact]);
  *(_QWORD *)(v20 + 64) = lazy protocol witness table accessor for type [CNContact] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [MSPSharedTripContact] and conformance [A], &demangling cache variable for type metadata for [MSPSharedTripContact]);
  *(_QWORD *)(v20 + 32) = v19;
  swift_bridgeObjectRetain();
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();
  v21 = objc_msgSend((id)objc_opt_self(), sel_sharedFetcher);
  if (v21)
  {
    v22 = v21;
    v23 = objc_allocWithZone((Class)type metadata accessor for MapsService.CapabilityFetcherObserver());
    v24 = v22;
    v25 = specialized MapsService.CapabilityFetcherObserver.init(_:)(v24);

    v26 = (*(uint64_t (**)(id))(*(_QWORD *)v4 + 112))(v25);
    v27 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 104))(v26);
    if (v27)
    {
      v28 = (_QWORD *)v27;
      v29 = (_QWORD *)swift_allocObject();
      v29[2] = v4;
      v29[3] = a2;
      v29[4] = a3;
      v30 = *(void (**)(uint64_t, uint64_t (*)(uint64_t), _QWORD *))((*MEMORY[0x24BEE4EA0] & *v28)
                                                                                      + 0xB0);
      swift_retain();
      swift_retain();
      v30(v19, partial apply for closure #1 in MapsService.fetchCapabilities(for:_:), v29);

      swift_release();
    }
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    lazy protocol witness table accessor for type MapsServiceError and conformance MapsServiceError();
    v31 = (void *)swift_allocError();
    *v32 = 0xD00000000000001BLL;
    v32[1] = 0x80000002308A4C50;
    a2(0, v31);

  }
}

uint64_t closure #1 in MapsService.fetchCapabilities(for:_:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, _QWORD))
{
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t (*v14)(uint64_t, _QWORD);
  uint64_t v15;

  v5 = *(NSObject **)(a2 + 16);
  swift_bridgeObjectRetain_n();
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v14 = a3;
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v15 = v8;
    *(_DWORD *)v7 = 136315138;
    v9 = swift_bridgeObjectRetain();
    v10 = MEMORY[0x2348BB03C](v9, &type metadata for EnhancedMSPSharedTripContact);
    v12 = v11;
    swift_bridgeObjectRelease();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v12, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_230887000, v5, v6, "fetchCapabilities completion handler %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348BB678](v8, -1, -1);
    MEMORY[0x2348BB678](v7, -1, -1);
    return v14(a1, 0);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    return a3(a1, 0);
  }
}

uint64_t static MapsService.shareETAConfigurationCheck(_:)(NSObject *a1)
{
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  os_log_type_t v7;

  v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(a1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_230887000, a1, v2, "shareETAConfigurationCheck", v3, 2u);
    MEMORY[0x2348BB678](v3, -1, -1);
  }
  if ((MSPSharedTripUserEnabled() & 1) == 0)
  {
    v5 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(a1, v5))
      return 0;
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_230887000, a1, v5, "MSPSharedTripUserEnabled failed", v6, 2u);
    v4 = 0;
    goto LABEL_10;
  }
  if ((MSPSharedTripNetworkEnabled() & 1) == 0)
  {
    v7 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(a1, v7))
      return 1;
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_230887000, a1, v7, "MSPSharedTripNetworkEnabled failed", v6, 2u);
    v4 = 1;
LABEL_10:
    MEMORY[0x2348BB678](v6, -1, -1);
    return v4;
  }
  return 2;
}

uint64_t MapsService.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t MapsService.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t MapsService.init()()
{
  uint64_t v0;

  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  *(_QWORD *)(v0 + 16) = OS_os_log.init(subsystem:category:)();
  *(_OWORD *)(v0 + 24) = xmmword_2308A3C00;
  return v0;
}

_QWORD *specialized _ArrayBuffer._consumeAndCreateNew()(_QWORD *a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1);
}

id specialized MapsService.CapabilityFetcherObserver.init(_:)(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  char *v5;
  id v6;
  objc_super v8;

  v3 = OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_logObject;
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  v4 = v1;
  *(_QWORD *)&v1[v3] = OS_os_log.init(subsystem:category:)();
  *(_QWORD *)&v4[OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_timeout] = 5;
  v5 = &v4[OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_completion];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_capabilities] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v4[OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_levelFetcher] = a1;
  v6 = a1;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for MapsService.CapabilityFetcherObserver();
  return objc_msgSendSuper2(&v8, sel_init);
}

id specialized EnhancedMSPSharedTripContact.getPersonHandle()(void *a1)
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v2 = objc_msgSend(a1, sel_in_labeledValue);
  v3 = objc_msgSend(a1, sel_stringValue);
  if (v3)
  {
    v4 = v3;
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  if (objc_msgSend(a1, sel_isPhoneNumber))
    v8 = 2;
  else
    v8 = 1;
  if (v2)
  {
    v9 = v2;
    v10 = objc_msgSend(v9, sel_label);
    if (v10)
    {
      v11 = v10;
      v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v14 = v13;

    }
    else
    {
      v12 = 0;
      v14 = 0xE000000000000000;
    }
    v15 = (void *)MEMORY[0x2348BAFAC](v12, v14);
    swift_bridgeObjectRelease();
    if (v7)
    {
      v16 = (void *)MEMORY[0x2348BAFAC](v5, v7);
      swift_bridgeObjectRelease();
    }
    else
    {
      v16 = 0;
    }
    v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9F38]), sel_initWithValue_type_label_, v16, v8, v15);

  }
  else
  {
    if (v7)
    {
      v15 = (void *)MEMORY[0x2348BAFAC](v5, v7);
      swift_bridgeObjectRelease();
    }
    else
    {
      v15 = 0;
    }
    v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9F38]), sel_initWithValue_type_, v15, v8);
  }

  return v17;
}

uint64_t outlined copy of (@escaping @callee_guaranteed (@guaranteed [EnhancedMSPSharedTripContact]) -> ())?(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t outlined consume of (@escaping @callee_guaranteed (@guaranteed [EnhancedMSPSharedTripContact]) -> ())?(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t type metadata accessor for MapsService.CapabilityFetcherObserver()
{
  return objc_opt_self();
}

unint64_t lazy protocol witness table accessor for type MapsServiceError and conformance MapsServiceError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MapsServiceError and conformance MapsServiceError;
  if (!lazy protocol witness table cache variable for type MapsServiceError and conformance MapsServiceError)
  {
    result = MEMORY[0x2348BB60C](&protocol conformance descriptor for MapsServiceError, &type metadata for MapsServiceError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MapsServiceError and conformance MapsServiceError);
  }
  return result;
}

uint64_t sub_2308934E8()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in MapsService.fetchCapabilities(for:_:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in MapsService.fetchCapabilities(for:_:)(a1, *(_QWORD *)(v1 + 16), *(uint64_t (**)(uint64_t, _QWORD))(v1 + 24));
}

unint64_t lazy protocol witness table accessor for type MapsService.ShareETAConfigurationError and conformance MapsService.ShareETAConfigurationError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MapsService.ShareETAConfigurationError and conformance MapsService.ShareETAConfigurationError;
  if (!lazy protocol witness table cache variable for type MapsService.ShareETAConfigurationError and conformance MapsService.ShareETAConfigurationError)
  {
    result = MEMORY[0x2348BB60C](&protocol conformance descriptor for MapsService.ShareETAConfigurationError, &type metadata for MapsService.ShareETAConfigurationError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MapsService.ShareETAConfigurationError and conformance MapsService.ShareETAConfigurationError);
  }
  return result;
}

uint64_t sub_230893568@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 104))();
  *a2 = result;
  return result;
}

uint64_t sub_230893598(id *a1, uint64_t a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))(**(_QWORD **)a2 + 112);
  v4 = *a1;
  return v3(v2);
}

uint64_t sub_2308935DC@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x90))();
  *a2 = result;
  return result;
}

uint64_t sub_23089361C(uint64_t a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & **a2) + 0x98);
  v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t initializeBufferWithCopyOfBuffer for EnhancedMSPSharedTripContact(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for EnhancedMSPSharedTripContact(uint64_t a1)
{
  swift_bridgeObjectRelease();

}

uint64_t initializeWithCopy for EnhancedMSPSharedTripContact(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  v5 = v4;
  return a1;
}

_QWORD *assignWithCopy for EnhancedMSPSharedTripContact(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a2[2];
  v5 = (void *)a1[2];
  a1[2] = v4;
  v6 = v4;

  a1[3] = a2[3];
  a1[4] = a2[4];
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

uint64_t assignWithTake for EnhancedMSPSharedTripContact(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for EnhancedMSPSharedTripContact(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EnhancedMSPSharedTripContact(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for EnhancedMSPSharedTripContact()
{
  return &type metadata for EnhancedMSPSharedTripContact;
}

_QWORD *initializeBufferWithCopyOfBuffer for MapsServiceError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for MapsServiceError()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for MapsServiceError(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for MapsServiceError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MapsServiceError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MapsServiceError(uint64_t result, int a2, int a3)
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

uint64_t getEnumTag for MapsServiceError()
{
  return 0;
}

ValueMetadata *type metadata accessor for MapsServiceError()
{
  return &type metadata for MapsServiceError;
}

uint64_t type metadata accessor for MapsService()
{
  return objc_opt_self();
}

uint64_t storeEnumTagSinglePayload for MapsService.ShareETAConfigurationError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_230893A24 + 4 * byte_2308A3D65[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_230893A58 + 4 * byte_2308A3D60[v4]))();
}

uint64_t sub_230893A58(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_230893A60(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x230893A68);
  return result;
}

uint64_t sub_230893A74(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x230893A7CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_230893A80(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_230893A88(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MapsService.ShareETAConfigurationError()
{
  return &type metadata for MapsService.ShareETAConfigurationError;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed [EnhancedMSPSharedTripContact]) -> (@out ())(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t sub_230893AD4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed [EnhancedMSPSharedTripContact]) -> ()(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t static UsoRequest.makeSDAForPromptForContactValue()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v0 = type metadata accessor for Siri_Nlu_External_SystemPrompted();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v9 - v5;
  type metadata accessor for UsoTaskBuilder_noVerb_common_Person();
  swift_allocObject();
  v7 = UsoTaskBuilder_noVerb_common_Person.init()();
  type metadata accessor for UsoEntityBuilder_common_Person();
  swift_allocObject();
  UsoEntityBuilder_common_Person.init()();
  dispatch thunk of Uso_VerbTemplateBuilder_NoVerb.setEntity(value:)();
  static Siri_Nlu_External_SystemPrompted.from(_:)(v7, (uint64_t)v6);
  Siri_Nlu_External_SystemDialogAct.init()();
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  Siri_Nlu_External_SystemDialogAct.prompted.setter();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  swift_release();
  return swift_release();
}

uint64_t static Siri_Nlu_External_SystemPrompted.from(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return static Siri_Nlu_External_SystemPrompted.from(_:)(a1, MEMORY[0x24BE9CAE8], MEMORY[0x24BE9CAD8], a2);
}

uint64_t Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)(uint64_t a1)
{
  return Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BE9CAF0], (void (*)(uint64_t))MEMORY[0x24BE9CD68], (void (*)(char *))MEMORY[0x24BE9CD58]);
}

uint64_t outlined init with copy of Siri_Nlu_External_UsoGraph?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static UsoRequest.makeSDAForYesNoCancel()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  void (*v20)(char *, char *, uint64_t);
  void (*v21)(char *, uint64_t);
  _QWORD v23[2];

  v23[1] = a1;
  v1 = type metadata accessor for Siri_Nlu_External_SystemOffered();
  v23[0] = *(_QWORD *)(v1 - 8);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v7 = (char *)v23 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v23 - v8;
  v10 = type metadata accessor for Siri_Nlu_External_UserCancelled();
  MEMORY[0x24BDAC7A8](v10);
  v11 = type metadata accessor for Siri_Nlu_External_UserAccepted();
  MEMORY[0x24BDAC7A8](v11);
  v12 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v23 - v17;
  Siri_Nlu_External_UserDialogAct.init()();
  Siri_Nlu_External_UserAccepted.init()();
  Siri_Nlu_External_UserDialogAct.accepted.setter();
  Siri_Nlu_External_UserCancelled.init()();
  Siri_Nlu_External_UserDialogAct.cancelled.setter();
  Siri_Nlu_External_SystemOffered.init()();
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
  Siri_Nlu_External_SystemOffered.offeredAct.setter();
  v19 = v23[0];
  v20 = *(void (**)(char *, char *, uint64_t))(v23[0] + 16);
  v20(v7, v9, v1);
  Siri_Nlu_External_SystemDialogAct.init()();
  v20(v4, v7, v1);
  Siri_Nlu_External_SystemDialogAct.offered.setter();
  v21 = *(void (**)(char *, uint64_t))(v19 + 8);
  v21(v7, v1);
  v21(v9, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v18, v12);
}

uint64_t Siri_Nlu_External_SystemDialogAct.init(systemOffered:)(uint64_t a1)
{
  return Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BE9C6E0], (void (*)(uint64_t))MEMORY[0x24BE9CD68], (void (*)(char *))MEMORY[0x24BE9CD40]);
}

uint64_t Siri_Nlu_External_SystemGaveOptions.init(choices:)(uint64_t a1)
{
  Siri_Nlu_External_SystemGaveOptions.init()();
  return MEMORY[0x2348BADA8](a1);
}

uint64_t Siri_Nlu_External_SystemDialogAct.init(gaveOptions:)(uint64_t a1)
{
  return Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)(a1, MEMORY[0x24BE9CF10], (void (*)(uint64_t))MEMORY[0x24BE9CD68], MEMORY[0x24BE9CCD0]);
}

uint64_t Siri_Nlu_External_UserDialogAct.init(_:)(uint64_t a1)
{
  return Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BE9CB28], (void (*)(uint64_t))MEMORY[0x24BE9C820], (void (*)(char *))MEMORY[0x24BE9C770]);
}

{
  return Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BE9D0F0], (void (*)(uint64_t))MEMORY[0x24BE9C820], (void (*)(char *))MEMORY[0x24BE9C7A0]);
}

uint64_t Siri_Nlu_External_SystemDialogAct.init(systemPrompted:)(uint64_t a1, uint64_t (*a2)(_QWORD), void (*a3)(uint64_t), void (*a4)(char *))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  v7 = a2(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v13 - v10;
  a3(v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a1, v7);
  a4(v11);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
}

uint64_t static Siri_Nlu_External_UserDialogAct.from(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v2 = type metadata accessor for Siri_Nlu_External_UserStatedTask();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v10 - v7;
  static Siri_Nlu_External_UserStatedTask.from(_:)(a1, (uint64_t)&v10 - v7);
  Siri_Nlu_External_UserDialogAct.init()();
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  Siri_Nlu_External_UserDialogAct.userStatedTask.setter();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t static Siri_Nlu_External_UserStatedTask.from(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;

  v28 = a2;
  v3 = type metadata accessor for Siri_Nlu_External_UsoGraph();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v26 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v27 = (char *)&v25 - v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v25 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v25 - v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UsoBuilderOptions?);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_2308A3C20;
  *(_QWORD *)(v20 + 32) = a1;
  v29 = v20;
  specialized Array._endMutation()();
  v21 = v29;
  v22 = type metadata accessor for UsoBuilderOptions();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v19, 1, 1, v22);
  swift_retain();
  MEMORY[0x2348BAE20](v21, v19);
  swift_bridgeObjectRelease();
  outlined destroy of ContactHandle.HandleType?((uint64_t)v19, &demangling cache variable for type metadata for UsoBuilderOptions?);
  static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v16, 0, 1, v3);
  outlined init with copy of Siri_Nlu_External_UsoGraph?((uint64_t)v16, (uint64_t)v14);
  Siri_Nlu_External_UserStatedTask.init()();
  outlined init with copy of Siri_Nlu_External_UsoGraph?((uint64_t)v14, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v11, 1, v3) == 1)
  {
    outlined destroy of ContactHandle.HandleType?((uint64_t)v14, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    outlined destroy of ContactHandle.HandleType?((uint64_t)v11, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  }
  else
  {
    v23 = v27;
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v27, v11, v3);
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v26, v23, v3);
    Siri_Nlu_External_UserStatedTask.task.setter();
    outlined destroy of ContactHandle.HandleType?((uint64_t)v14, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v23, v3);
  }
  swift_release();
  return outlined destroy of ContactHandle.HandleType?((uint64_t)v16, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
}

uint64_t static Siri_Nlu_External_UserDialogAct.from(_:)@<X0>(uint64_t a1@<X8>)
{
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
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  void (*v27)(char *, uint64_t);
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;

  v33 = a1;
  v1 = type metadata accessor for Siri_Nlu_External_UsoGraph();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v30 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v31 = (char *)&v29 - v5;
  v6 = type metadata accessor for Siri_Nlu_External_UserStatedTask();
  v32 = *(_QWORD *)(v6 - 8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v29 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v29 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v29 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v29 - v22;
  static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v2 + 56))(v23, 0, 1, v1);
  outlined init with copy of Siri_Nlu_External_UsoGraph?((uint64_t)v23, (uint64_t)v21);
  Siri_Nlu_External_UserStatedTask.init()();
  outlined init with copy of Siri_Nlu_External_UsoGraph?((uint64_t)v21, (uint64_t)v18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v18, 1, v1) == 1)
  {
    outlined destroy of ContactHandle.HandleType?((uint64_t)v21, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    outlined destroy of ContactHandle.HandleType?((uint64_t)v18, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  }
  else
  {
    v24 = v31;
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v31, v18, v1);
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v30, v24, v1);
    Siri_Nlu_External_UserStatedTask.task.setter();
    outlined destroy of ContactHandle.HandleType?((uint64_t)v21, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v24, v1);
  }
  v25 = v32;
  v26 = *(void (**)(char *, char *, uint64_t))(v32 + 16);
  v26(v12, v14, v6);
  Siri_Nlu_External_UserDialogAct.init()();
  v26(v9, v12, v6);
  Siri_Nlu_External_UserDialogAct.userStatedTask.setter();
  v27 = *(void (**)(char *, uint64_t))(v25 + 8);
  v27(v12, v6);
  v27(v14, v6);
  return outlined destroy of ContactHandle.HandleType?((uint64_t)v23, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
}

uint64_t Siri_Nlu_External_UserStatedTask.init(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Siri_Nlu_External_UsoGraph();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v13 - v10;
  Siri_Nlu_External_UserStatedTask.init()();
  outlined init with copy of Siri_Nlu_External_UsoGraph?(a1, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    outlined destroy of ContactHandle.HandleType?(a1, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    return outlined destroy of ContactHandle.HandleType?((uint64_t)v4, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v4, v5);
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    Siri_Nlu_External_UserStatedTask.task.setter();
    outlined destroy of ContactHandle.HandleType?(a1, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  }
}

unint64_t Siri_Nlu_External_UserDialogAct.usoTask.getter()
{
  unint64_t result;
  unint64_t v1;
  uint64_t v2;

  result = static ConversionUtils.convertUserDialogActToTasks(userDialogAct:)();
  v1 = result;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = _CocoaArrayWrapper.endIndex.getter();
    result = swift_bridgeObjectRelease();
    if (!v2)
      goto LABEL_6;
  }
  else
  {
    v2 = *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v2)
    {
LABEL_6:
      swift_bridgeObjectRelease();
      return v2;
    }
  }
  if ((v1 & 0xC000000000000001) != 0)
  {
    v2 = MEMORY[0x2348BB150](0, v1);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v2 = *(_QWORD *)(v1 + 32);
    swift_retain();
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t Siri_Nlu_External_UserDialogAct.contactId.getter()
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void (*v21)(char *, unint64_t, uint64_t);
  char v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  char v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v0 = type metadata accessor for Google_Protobuf_StringValue();
  v37 = *(_QWORD *)(v0 - 8);
  v38 = v0;
  MEMORY[0x24BDAC7A8](v0);
  v36 = (char *)&v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for Siri_Nlu_External_UsoEntityIdentifier();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v34 - v7;
  v39 = type metadata accessor for Siri_Nlu_External_UsoGraph();
  v9 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Siri_Nlu_External_UserStatedTask();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoEntityIdentifier?);
  MEMORY[0x24BDAC7A8](v16);
  v35 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  Siri_Nlu_External_UserDialogAct.userStatedTask.getter();
  Siri_Nlu_External_UserStatedTask.task.getter();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  v18 = Siri_Nlu_External_UsoGraph.identifiers.getter();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v39);
  v19 = *(_QWORD *)(v18 + 16);
  if (!v19)
  {
LABEL_14:
    v30 = 1;
    v31 = (uint64_t)v35;
    goto LABEL_16;
  }
  v20 = v18 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  v39 = *(_QWORD *)(v3 + 72);
  v21 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
  v34 = v18;
  swift_bridgeObjectRetain();
  while (1)
  {
    v21(v8, v20, v2);
    if (Siri_Nlu_External_UsoEntityIdentifier.backingAppBundleID.getter() == 0x73746361746E6F43
      && v24 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
      v21(v6, (unint64_t)v8, v2);
    }
    else
    {
      v25 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      v21(v6, (unint64_t)v8, v2);
      if ((v25 & 1) == 0)
      {
        v23 = *(void (**)(char *, uint64_t))(v3 + 8);
        v23(v6, v2);
        goto LABEL_4;
      }
    }
    v26 = v36;
    Siri_Nlu_External_UsoEntityIdentifier.namespace.getter();
    v27 = Google_Protobuf_StringValue.value.getter();
    v29 = v28;
    (*(void (**)(char *, uint64_t))(v37 + 8))(v26, v38);
    if (v27 == 0x64695F6D657469 && v29 == 0xE700000000000000)
      break;
    v22 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    v23 = *(void (**)(char *, uint64_t))(v3 + 8);
    v23(v6, v2);
    if ((v22 & 1) != 0)
      goto LABEL_15;
LABEL_4:
    v23(v8, v2);
    v20 += v39;
    if (!--v19)
    {
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
LABEL_15:
  swift_bridgeObjectRelease();
  v31 = (uint64_t)v35;
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v35, v8, v2);
  v30 = 0;
LABEL_16:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v31, v30, 1, v2);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v31, 1, v2) == 1)
  {
    outlined destroy of ContactHandle.HandleType?(v31, &demangling cache variable for type metadata for Siri_Nlu_External_UsoEntityIdentifier?);
    return 0;
  }
  else
  {
    v32 = Siri_Nlu_External_UsoEntityIdentifier.value.getter();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v31, v2);
  }
  return v32;
}

uint64_t UsoIdentifierAppBundle.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000015;
  else
    return 0x73746361746E6F43;
}

uint64_t UsoIdentifierNamespace.rawValue.getter(char a1)
{
  if (!a1)
    return 0x64695F6D657469;
  if (a1 == 1)
    return 0xD000000000000012;
  return 0x6369746E616D6573;
}

uint64_t static Siri_Nlu_External_UserWantedToProceed.from(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return static Siri_Nlu_External_SystemPrompted.from(_:)(a1, MEMORY[0x24BE9D0E8], MEMORY[0x24BE9D0E0], a2);
}

uint64_t static Siri_Nlu_External_SystemPrompted.from(_:)@<X0>(uint64_t a1@<X0>, void (*a2)(uint64_t)@<X1>, void (*a3)(char *)@<X2>, uint64_t a4@<X8>)
{
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v29;
  void (*v30)(char *);
  void (*v31)(uint64_t);
  uint64_t v32;
  uint64_t v33;

  v30 = a3;
  v31 = a2;
  v32 = a4;
  v5 = type metadata accessor for Siri_Nlu_External_UsoGraph();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v29 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v29 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UsoBuilderOptions?);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v29 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v29 - v21;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_2308A3C20;
  *(_QWORD *)(v23 + 32) = a1;
  v33 = v23;
  specialized Array._endMutation()();
  v24 = v33;
  v25 = type metadata accessor for UsoBuilderOptions();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v13, 1, 1, v25);
  swift_retain();
  MEMORY[0x2348BAE20](v24, v13);
  swift_bridgeObjectRelease();
  outlined destroy of ContactHandle.HandleType?((uint64_t)v13, &demangling cache variable for type metadata for UsoBuilderOptions?);
  static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)();
  swift_release();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v22, 0, 1, v5);
  v26 = outlined init with copy of Siri_Nlu_External_UsoGraph?((uint64_t)v22, (uint64_t)v20);
  v31(v26);
  outlined init with copy of Siri_Nlu_External_UsoGraph?((uint64_t)v20, (uint64_t)v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v17, 1, v5) == 1)
  {
    outlined destroy of ContactHandle.HandleType?((uint64_t)v20, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    outlined destroy of ContactHandle.HandleType?((uint64_t)v17, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v10, v17, v5);
    v27 = v29;
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v29, v10, v5);
    v30(v27);
    outlined destroy of ContactHandle.HandleType?((uint64_t)v20, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
  }
  return outlined destroy of ContactHandle.HandleType?((uint64_t)v22, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
}

uint64_t static Siri_Nlu_External_SystemOffered.from(_:)(uint64_t a1)
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
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;

  v18 = a1;
  v1 = type metadata accessor for Siri_Nlu_External_UserWantedToProceed();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v17 - v6;
  v8 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v17 - v13;
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  v15(v7, v18, v1);
  Siri_Nlu_External_UserDialogAct.init()();
  v15(v5, (uint64_t)v7, v1);
  Siri_Nlu_External_UserDialogAct.wantedToProceed.setter();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  Siri_Nlu_External_SystemOffered.init()();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  Siri_Nlu_External_SystemOffered.offeredAct.setter();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v8);
}

SiriGeo::UsoIdentifierAppBundle_optional __swiftcall UsoIdentifierAppBundle.init(rawValue:)(Swift::String rawValue)
{
  void *object;
  Swift::String v2;
  Swift::Int v3;
  SiriGeo::UsoIdentifierAppBundle_optional v4;

  object = rawValue._object;
  v2._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of UsoIdentifierAppBundle.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 == 1)
    v4.value = SiriGeo_UsoIdentifierAppBundle_siriNL;
  else
    v4.value = SiriGeo_UsoIdentifierAppBundle_unknownDefault;
  if (v3)
    return v4;
  else
    return 0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance UsoIdentifierAppBundle(char *a1, char *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = UsoIdentifierAppBundle.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == UsoIdentifierAppBundle.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance UsoIdentifierAppBundle()
{
  char *v0;
  char v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  UsoIdentifierAppBundle.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance UsoIdentifierAppBundle()
{
  return specialized RawRepresentable<>.hash(into:)();
}

uint64_t specialized RawRepresentable<>.hash(into:)()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance UsoIdentifierAppBundle()
{
  char *v0;
  char v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  UsoIdentifierAppBundle.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance UsoIdentifierAppBundle@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3;
  uint64_t result;
  char v5;

  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of UsoIdentifierAppBundle.init(rawValue:), *a1);
  result = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *a2 = v5;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance UsoIdentifierAppBundle@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = UsoIdentifierAppBundle.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance UsoIdentifierNamespace(char *a1, char *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = UsoIdentifierNamespace.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == UsoIdentifierNamespace.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance UsoIdentifierNamespace()
{
  char *v0;
  char v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  UsoIdentifierNamespace.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance UsoIdentifierNamespace()
{
  char *v0;

  UsoIdentifierNamespace.rawValue.getter(*v0);
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance UsoIdentifierNamespace()
{
  char *v0;
  char v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  UsoIdentifierNamespace.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance UsoIdentifierNamespace@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = specialized UsoIdentifierNamespace.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance UsoIdentifierNamespace@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = UsoIdentifierNamespace.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t specialized UsoIdentifierNamespace.init(rawValue:)(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of UsoIdentifierNamespace.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3)
    return 3;
  else
    return v3;
}

unint64_t lazy protocol witness table accessor for type UsoIdentifierAppBundle and conformance UsoIdentifierAppBundle()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UsoIdentifierAppBundle and conformance UsoIdentifierAppBundle;
  if (!lazy protocol witness table cache variable for type UsoIdentifierAppBundle and conformance UsoIdentifierAppBundle)
  {
    result = MEMORY[0x2348BB60C](&protocol conformance descriptor for UsoIdentifierAppBundle, &type metadata for UsoIdentifierAppBundle);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UsoIdentifierAppBundle and conformance UsoIdentifierAppBundle);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type UsoIdentifierNamespace and conformance UsoIdentifierNamespace()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UsoIdentifierNamespace and conformance UsoIdentifierNamespace;
  if (!lazy protocol witness table cache variable for type UsoIdentifierNamespace and conformance UsoIdentifierNamespace)
  {
    result = MEMORY[0x2348BB60C](&protocol conformance descriptor for UsoIdentifierNamespace, &type metadata for UsoIdentifierNamespace);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UsoIdentifierNamespace and conformance UsoIdentifierNamespace);
  }
  return result;
}

ValueMetadata *type metadata accessor for UsoRequest()
{
  return &type metadata for UsoRequest;
}

uint64_t storeEnumTagSinglePayload for UsoIdentifierAppBundle(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2308957EC + 4 * byte_2308A3EF5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_230895820 + 4 * asc_2308A3EF0[v4]))();
}

uint64_t sub_230895820(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_230895828(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x230895830);
  return result;
}

uint64_t sub_23089583C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x230895844);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_230895848(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_230895850(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UsoIdentifierAppBundle()
{
  return &type metadata for UsoIdentifierAppBundle;
}

uint64_t getEnumTagSinglePayload for UsoIdentifierNamespace(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for UsoIdentifierNamespace(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_230895948 + 4 * byte_2308A3EFF[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23089597C + 4 * byte_2308A3EFA[v4]))();
}

uint64_t sub_23089597C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_230895984(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23089598CLL);
  return result;
}

uint64_t sub_230895998(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2308959A0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2308959A4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2308959AC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *destructiveInjectEnumTag for UsoIdentifierNamespace(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for UsoIdentifierNamespace()
{
  return &type metadata for UsoIdentifierNamespace;
}

id INShareETAIntentHandler.logObject.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_logObject);
}

void INShareETAIntentHandler.resolveRecipients(for:with:)(void *a1, void (*a2)(uint64_t), uint64_t a3)
{
  char *v3;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  void *v11;
  os_log_type_t v12;
  uint8_t *v13;
  _QWORD *v14;
  void *v15;
  char *v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD v20[6];

  v7 = *(NSObject **)&v3[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_logObject];
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_230887000, v7, v8, "resolveRecipient called", v9, 2u);
    MEMORY[0x2348BB678](v9, -1, -1);
  }
  v10 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (v10)
  {
    v11 = v10;
    v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_230887000, v7, v12, "share ETA confirm ready", v13, 2u);
      MEMORY[0x2348BB678](v13, -1, -1);
    }
    v14 = (_QWORD *)swift_allocObject();
    v14[2] = v3;
    v14[3] = v11;
    v14[4] = a1;
    v14[5] = a2;
    v14[6] = a3;
    v20[4] = partial apply for closure #1 in INShareETAIntentHandler.resolveRecipients(for:with:);
    v20[5] = v14;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 1107296256;
    v20[2] = thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ();
    v20[3] = &block_descriptor_0;
    v15 = _Block_copy(v20);
    v16 = v3;
    v17 = v11;
    v18 = a1;
    swift_retain();
    swift_release();
    objc_msgSend(v17, sel_performBlockAfterInitialSync_, v15);
    _Block_release(v15);

  }
  else
  {
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_2308A3C20;
    *(_QWORD *)(v19 + 32) = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 5);
    specialized Array._endMutation()();
    a2(v19);
    swift_bridgeObjectRelease();
  }
}

void closure #1 in INShareETAIntentHandler.resolveRecipients(for:with:)(uint64_t a1, uint64_t a2, void *a3, void *a4, void (*a5)(uint64_t), uint64_t a6)
{
  uint64_t v10;
  id v11;

  static os_log_type_t.info.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_2308A3BB0;
  *(_QWORD *)(v10 + 56) = type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for MSPSharedTripService);
  *(_QWORD *)(v10 + 64) = lazy protocol witness table accessor for type MSPSharedTripService and conformance NSObject();
  *(_QWORD *)(v10 + 32) = a3;
  v11 = a3;
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();
  INShareETAIntentHandler.resolveRecipientsInsideBlock(for:with:)(a4, a5, a6);
}

uint64_t partial apply for closure #1 in INShareETAIntentHandler.resolveRecipients(for:with:)(uint64_t a1)
{
  return partial apply for closure #1 in INShareETAIntentHandler.resolveRecipients(for:with:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in INShareETAIntentHandler.resolveRecipients(for:with:));
}

void thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ()(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

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

void thunk for @escaping @callee_unowned @convention(block) (@unowned NSArray) -> ()(uint64_t a1, uint64_t a2)
{
  Class isa;

  type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for INShareETARecipientResolutionResult);
  isa = Array._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, Class))(a2 + 16))(a2, isa);

}

{
  Class isa;

  type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for INStopShareETARecipientResolutionResult);
  isa = Array._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, Class))(a2 + 16))(a2, isa);

}

void INShareETAIntentHandler.resolveRecipientsInsideBlock(for:with:)(void *a1, void (*a2)(uint64_t), uint64_t a3)
{
  uint64_t j;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id i;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  SEL *v34;
  _QWORD *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  unint64_t v41;
  uint64_t v42;
  SEL *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  char v49;
  id v50;
  void *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  os_log_type_t v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  Class isa;
  id v74;
  void *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  id v85;
  void *v86;
  id v87;
  id v88;
  os_log_type_t v89;
  uint8_t *v90;
  uint64_t v91;
  id v92;
  id v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  uint64_t v97;
  _QWORD *v98;
  void (*v99)(_QWORD *, uint64_t (*)(uint64_t), _QWORD *);
  id v100;
  uint64_t v101;
  void *v102;
  NSObject *oslog;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v110;

  v5 = *(NSObject **)(j + OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_logObject);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_230887000, v5, v6, "resolveRecipients", v7, 2u);
    MEMORY[0x2348BB678](v7, -1, -1);
  }
  v8 = objc_msgSend(a1, sel_recipients);
  if (!v8)
  {
LABEL_98:
    v88 = a1;
    v89 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v89))
    {
      v90 = (uint8_t *)swift_slowAlloc();
      v91 = swift_slowAlloc();
      v110 = v91;
      *(_DWORD *)v90 = 136315138;
      v92 = v88;
      v93 = objc_msgSend(v92, sel_description);
      v94 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v96 = v95;

      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v94, v96, &v110);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_230887000, v5, v89, "resolveRecipients nil/empty recipients intent - %s", v90, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348BB678](v91, -1, -1);
      MEMORY[0x2348BB678](v90, -1, -1);
    }
    else
    {

    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v64 = swift_allocObject();
    *(_OWORD *)(v64 + 16) = xmmword_2308A3C20;
    type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for INShareETARecipientResolutionResult);
    *(_QWORD *)(v64 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_needsValue);
LABEL_102:
    v110 = v64;
    specialized Array._endMutation()();
    a2(v110);
    swift_bridgeObjectRelease();
    return;
  }
  v9 = v8;
  v105 = type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for INPerson);
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if ((unint64_t)v10 >> 62)
  {
LABEL_95:
    swift_bridgeObjectRetain();
    v11 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v11)
    {
      swift_bridgeObjectRetain();
      v12 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    goto LABEL_97;
  }
  v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
  v12 = v11;
  if (!v11)
  {
LABEL_97:
    swift_bridgeObjectRelease();

    goto LABEL_98;
  }
LABEL_6:
  oslog = v5;
  v104 = j;
  if (v12 == 1)
  {
    v5 = (v10 & 0xC000000000000001);
    if ((v10 & 0xC000000000000001) != 0)
      goto LABEL_104;
    if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      for (i = *(id *)(v10 + 32); ; i = (id)MEMORY[0x2348BB150](0, v10))
      {
        v14 = i;
        v15 = objc_msgSend(i, sel_personHandle);

        if (v15)
        {
          if (v5)
            v16 = (id)MEMORY[0x2348BB150](0, v10);
          else
            v16 = *(id *)(v10 + 32);
          v21 = v16;
          v22 = objc_msgSend(v16, sel_personHandle);

          if (!v22)
            goto LABEL_121;
          v23 = objc_msgSend(v22, sel_value);

          if (v23)
            break;
        }
        j = v104;
LABEL_25:

        if (v5)
          goto LABEL_93;
LABEL_26:
        if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          v26 = *(id *)(v10 + 32);
          goto LABEL_28;
        }
        __break(1u);
LABEL_104:
        ;
      }

      static os_log_type_t.default.getter();
      os_log(_:dso:log:_:_:)();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
      v24 = swift_allocObject();
      *(_OWORD *)(v24 + 16) = xmmword_2308A3BB0;
      if (v5)
        v25 = (id)MEMORY[0x2348BB150](0, v10);
      else
        v25 = *(id *)(v10 + 32);
      v66 = v25;
      v67 = objc_msgSend(v25, sel_personHandle);

      if (v67)
      {
        v68 = objc_msgSend(v67, sel_value);

        j = v104;
        if (v68)
        {
          v69 = (void *)objc_opt_self();
          v70 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v72 = v71;

          *(_QWORD *)(v24 + 32) = v70;
          *(_QWORD *)(v24 + 40) = v72;
          isa = Array._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease();
          v9 = objc_msgSend(v69, sel_contactsFromHandles_, isa);

          type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for MSPSharedTripContact);
          v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

          if ((unint64_t)v12 >> 62)
            goto LABEL_116;
          if (*(uint64_t *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10) <= 0)
            goto LABEL_117;
          goto LABEL_80;
        }
        goto LABEL_123;
      }
LABEL_122:
      __break(1u);
LABEL_123:
      __break(1u);
      return;
    }
    __break(1u);
LABEL_106:
    if (v10 < 0)
      v12 = v10;
    else
      v12 = v10 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v30 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v30)
      goto LABEL_34;
LABEL_110:
    v33 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_111:
    swift_bridgeObjectRelease();
    j = v104;
LABEL_112:
    v97 = *(_QWORD *)(j + OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_contactService);
    v98 = (_QWORD *)swift_allocObject();
    v98[2] = j;
    v98[3] = a2;
    v98[4] = a3;
    v99 = *(void (**)(_QWORD *, uint64_t (*)(uint64_t), _QWORD *))(*(_QWORD *)v97 + 144);
    v100 = (id)j;
    swift_retain();
    v99(v33, partial apply for closure #2 in INShareETAIntentHandler.resolveRecipientsInsideBlock(for:with:), v98);
    swift_bridgeObjectRelease();
    swift_release();
    return;
  }
  v5 = (v10 & 0xC000000000000001);
  if (v12 < 2)
    goto LABEL_25;
  if (v5)
  {
    v17 = (id)MEMORY[0x2348BB150](0, v10);
  }
  else
  {
    if (!*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_115;
    }
    v17 = *(id *)(v10 + 32);
  }
  v18 = v17;
  v19 = objc_msgSend(v17, sel_contactIdentifier);

  v102 = v9;
  if (v19)
  {
    v106 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a1 = v20;

  }
  else
  {
    v106 = 0;
    a1 = 0;
  }
  swift_bridgeObjectRetain();
  v49 = 1;
  for (j = 4; ; ++j)
  {
    while (1)
    {
      if (v5)
        v50 = (id)MEMORY[0x2348BB150](j - 4, v10);
      else
        v50 = *(id *)(v10 + 8 * j);
      v51 = v50;
      v52 = j - 3;
      if (__OFADD__(j - 4, 1))
      {
        __break(1u);
        goto LABEL_95;
      }
      if ((v49 & 1) == 0)
      {

        goto LABEL_64;
      }
      v53 = objc_msgSend(v50, sel_contactIdentifier);
      if (!v53)
        break;
      v9 = v53;
      v54 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v56 = v55;

      if (a1)
      {
        if (v54 != v106 || a1 != v56)
        {
          v49 = _stringCompareWithSmolCheck(_:_:expecting:)();

          swift_bridgeObjectRelease();
          if (v52 != v11)
            goto LABEL_51;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v49 & 1) != 0)
          {

            goto LABEL_92;
          }
LABEL_71:
          swift_bridgeObjectRetain();
          v57 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(oslog, v57))
          {
            v58 = (uint8_t *)swift_slowAlloc();
            v59 = swift_slowAlloc();
            v110 = v59;
            *(_DWORD *)v58 = 136315138;
            v60 = swift_bridgeObjectRetain();
            v61 = MEMORY[0x2348BB03C](v60, v105);
            v63 = v62;
            swift_bridgeObjectRelease();
            getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v61, v63, &v110);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_230887000, oslog, v57, "resolveRecipients more than 1 disambiguation required %s", v58, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2348BB678](v59, -1, -1);
            MEMORY[0x2348BB678](v58, -1, -1);
          }
          else
          {
            swift_bridgeObjectRelease_n();
          }
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
          v64 = swift_allocObject();
          *(_OWORD *)(v64 + 16) = xmmword_2308A3C20;
          type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for INShareETARecipientResolutionResult);
          v65 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_disambiguationWithPeopleToDisambiguate_, v102);

          *(_QWORD *)(v64 + 32) = v65;
          goto LABEL_102;
        }

        swift_bridgeObjectRelease();
        if (v52 == v11)
        {

          swift_bridgeObjectRelease();
          goto LABEL_91;
        }
        v49 = 1;
        ++j;
      }
      else
      {

        swift_bridgeObjectRelease();
LABEL_64:
        if (v52 == v11)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_71;
        }
        v49 = 0;
LABEL_51:
        ++j;
      }
    }

    if (a1)
      goto LABEL_64;
    if (v52 == v11)
      break;
    v49 = 1;
  }

LABEL_91:
  swift_bridgeObjectRelease();
LABEL_92:
  j = v104;
  if (!v5)
    goto LABEL_26;
LABEL_93:
  v26 = (id)MEMORY[0x2348BB150](0, v10);
LABEL_28:
  v27 = v26;

  if (v5)
    v28 = (id)MEMORY[0x2348BB150](0, v10);
  else
    v28 = *(id *)(v10 + 32);
  v12 = (uint64_t)v28;
  swift_bridgeObjectRelease();
  v29 = objc_msgSend((id)v12, sel_siriMatches);

  if (!v29)
  {
    v33 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_112;
  }
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if ((unint64_t)v10 >> 62)
    goto LABEL_106;
  v30 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v30)
    goto LABEL_110;
LABEL_34:
  if (v30 >= 1)
  {
    v31 = 0;
    v32 = v10 & 0xC000000000000001;
    v33 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v34 = (SEL *)&unk_24FEBA000;
    v107 = v30;
    do
    {
      if (v32)
        v36 = (id)MEMORY[0x2348BB150](v31, v10);
      else
        v36 = *(id *)(v10 + 8 * v31 + 32);
      v37 = v36;
      v38 = objc_msgSend(v36, v34[50]);
      if (v38)
      {
        v39 = v38;
        v40 = objc_msgSend(v38, sel_value);

        if (v40)
        {
          v41 = v32;
          v42 = v10;
          v43 = v34;
          v44 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v46 = v45;

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v33 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v33[2] + 1, 1, v33);
          v48 = v33[2];
          v47 = v33[3];
          if (v48 >= v47 >> 1)
            v33 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v47 > 1), v48 + 1, 1, v33);
          v33[2] = v48 + 1;
          v35 = &v33[2 * v48];
          v35[4] = v44;
          v35[5] = v46;
          v34 = v43;
          v10 = v42;
          v32 = v41;
          v30 = v107;
        }
      }
      ++v31;

    }
    while (v30 != v31);
    goto LABEL_111;
  }
LABEL_115:
  __break(1u);
LABEL_116:
  swift_bridgeObjectRetain();
  v101 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v101 <= 0)
  {
LABEL_117:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v84 = swift_allocObject();
    *(_OWORD *)(v84 + 16) = xmmword_2308A3C20;
    *(_QWORD *)(v84 + 32) = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 5);
    goto LABEL_118;
  }
LABEL_80:
  if ((v12 & 0xC000000000000001) != 0)
  {
    v74 = (id)MEMORY[0x2348BB150](0, v12);
    goto LABEL_83;
  }
  if (!*(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
LABEL_121:

    __break(1u);
    goto LABEL_122;
  }
  v74 = *(id *)(v12 + 32);
LABEL_83:
  v75 = v74;
  swift_bridgeObjectRelease();
  v76 = objc_msgSend(v75, sel_displayName);
  v77 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v79 = v78;

  v80 = (uint64_t *)(j + OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact);
  v81 = *(_QWORD *)(j + OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact);
  v82 = *(_QWORD *)(j + OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact + 8);
  v83 = *(void **)(j + OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact + 16);
  *v80 = v77;
  v80[1] = v79;
  v80[2] = (uint64_t)v75;
  v80[3] = 0;
  v80[4] = 0;
  outlined consume of EnhancedMSPSharedTripContact?(v81, v82, v83);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  v84 = swift_allocObject();
  *(_OWORD *)(v84 + 16) = xmmword_2308A3C20;
  if (v5)
    v85 = (id)MEMORY[0x2348BB150](0, v10);
  else
    v85 = *(id *)(v10 + 32);
  v86 = v85;
  swift_bridgeObjectRelease();
  v87 = objc_msgSend((id)objc_opt_self(), sel_resolutionResultSuccessWithResolvedValue_, v86);

  *(_QWORD *)(v84 + 32) = v87;
LABEL_118:
  specialized Array._endMutation()();
  a2(v84);
  swift_bridgeObjectRelease();
}

uint64_t closure #2 in INShareETAIntentHandler.resolveRecipientsInsideBlock(for:with:)(uint64_t a1, char *a2, void (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  void **v21;
  SEL *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  Class isa;
  void *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  char *v55;
  os_log_type_t v56;
  uint8_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  os_log_type_t v67;
  os_log_t v68;
  uint8_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  void *ObjCClassFromMetadata;
  Class v79;
  id v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  void *v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  void (*v89)(uint64_t);
  void *v90;
  id v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  id v96;
  void *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  id v102;
  id v103;
  _QWORD *v104;
  uint64_t v105;
  void (*v106)(uint64_t);
  os_log_t v107;
  char *v108;
  uint64_t v109;
  id v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115[5];

  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for PersonNameComponents?);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v111 = (char *)&v104 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v108 = (char *)&v104 - v11;
  static os_log_type_t.info.getter();
  v12 = *(NSObject **)&a2[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_logObject];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_2308A3BB0;
  v14 = MEMORY[0x2348BB060](a1, &type metadata for EnhancedMSPSharedTripContact);
  v16 = v15;
  *(_QWORD *)(v13 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v13 + 64) = lazy protocol witness table accessor for type String and conformance String();
  *(_QWORD *)(v13 + 32) = v14;
  *(_QWORD *)(v13 + 40) = v16;
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(a1 + 16))
  {
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v45 = swift_allocObject();
    *(_OWORD *)(v45 + 16) = xmmword_2308A3C20;
    *(_QWORD *)(v45 + 32) = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 5);
    v115[0] = v45;
    specialized Array._endMutation()();
    a3(v115[0]);
    return swift_bridgeObjectRelease();
  }
  v107 = v12;
  result = specialized INShareETAIntentHandler.phoneDisambiguationCandidates(_:)((double *)a1);
  v19 = v18;
  v20 = v18[2];
  if ((result & 1) != 0)
  {
    if (v20)
    {
      v105 = a4;
      v106 = a3;
      v115[0] = MEMORY[0x24BEE4AF8];
      specialized ContiguousArray.reserveCapacity(_:)();
      v104 = v19;
      v21 = (void **)(v19 + 6);
      v22 = (SEL *)&unk_24FEBA000;
      while (1)
      {
        v26 = (uint64_t)*(v21 - 1);
        v111 = (char *)*(v21 - 2);
        v27 = *v21;
        swift_bridgeObjectRetain();
        v28 = v27;
        v110 = specialized EnhancedMSPSharedTripContact.getPersonHandle()(v28);
        v29 = type metadata accessor for PersonNameComponents();
        v30 = *(_QWORD *)(v29 - 8);
        v31 = v108;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v30 + 56))(v108, 1, 1, v29);
        v32 = objc_msgSend(v28, v22[80], v104);
        v109 = v26;
        if (!v32)
          goto LABEL_11;
        v33 = v32;
        v34 = objc_msgSend((id)objc_opt_self(), sel_stringFromContact_style_, v32, 0);
        if (!v34)
          break;
        v35 = v34;
        v111 = (char *)static String._unconditionallyBridgeFromObjectiveC(_:)();
        v26 = v36;

LABEL_12:
        v37 = objc_msgSend(v28, v22[80]);
        if (v37)
        {
          v38 = v37;
          v39 = objc_msgSend(v37, sel_identifier);
          v40 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v42 = v41;

          v31 = v108;
        }
        else
        {
          v40 = 0;
          v42 = 0;
        }
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v31, 1, v29) == 1)
        {
          isa = 0;
        }
        else
        {
          isa = PersonNameComponents._bridgeToObjectiveC()().super.isa;
          (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v29);
        }
        v44 = (void *)MEMORY[0x2348BAFAC](v111, v26);
        swift_bridgeObjectRelease();
        if (v42)
        {
          v23 = (void *)MEMORY[0x2348BAFAC](v40, v42);
          swift_bridgeObjectRelease();
        }
        else
        {
          v23 = 0;
        }
        v22 = (SEL *)&unk_24FEBA000;
        v24 = objc_allocWithZone(MEMORY[0x24BDD9F30]);
        v25 = v110;
        objc_msgSend(v24, sel_initWithPersonHandle_nameComponents_displayName_image_contactIdentifier_customIdentifier_, v110, isa, v44, 0, v23, 0);

        swift_bridgeObjectRelease();
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
        v21 += 5;
        if (!--v20)
        {
          swift_bridgeObjectRelease();
          a3 = v106;
          goto LABEL_28;
        }
      }

LABEL_11:
      swift_bridgeObjectRetain();
      goto LABEL_12;
    }
    swift_bridgeObjectRelease();
LABEL_28:
    swift_bridgeObjectRetain_n();
    v67 = static os_log_type_t.default.getter();
    v68 = v107;
    if (os_log_type_enabled(v107, v67))
    {
      v69 = (uint8_t *)swift_slowAlloc();
      v70 = swift_slowAlloc();
      v115[0] = v70;
      *(_DWORD *)v69 = 136315138;
      v111 = (char *)(v69 + 4);
      v71 = type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for INPerson);
      v72 = swift_bridgeObjectRetain();
      v73 = MEMORY[0x2348BB03C](v72, v71);
      v74 = v68;
      v76 = v75;
      swift_bridgeObjectRelease();
      v112 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v73, v76, v115);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_230887000, v74, v67, "disambiguation list %s", v69, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348BB678](v70, -1, -1);
      MEMORY[0x2348BB678](v69, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v77 = swift_allocObject();
    *(_OWORD *)(v77 + 16) = xmmword_2308A3C20;
    type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for INShareETARecipientResolutionResult);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for INPerson);
    v79 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v80 = objc_msgSend(ObjCClassFromMetadata, sel_disambiguationWithPeopleToDisambiguate_, v79);

    *(_QWORD *)(v77 + 32) = v80;
    v115[0] = v77;
    specialized Array._endMutation()();
    a3(v115[0]);
    return swift_bridgeObjectRelease();
  }
  if (v20)
  {
    v105 = a4;
    v106 = a3;
    v47 = v18[4];
    v46 = (char *)v18[5];
    v48 = (void *)v18[6];
    v110 = (id)v18[7];
    v108 = (char *)v18[8];
    swift_bridgeObjectRetain();
    v49 = v48;
    swift_bridgeObjectRelease();
    v50 = (uint64_t *)&a2[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact];
    v51 = *(_QWORD *)&a2[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact];
    v52 = *(_QWORD *)&a2[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact + 8];
    v53 = *(void **)&a2[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact + 16];
    *v50 = v47;
    v50[1] = (uint64_t)v46;
    v54 = (uint64_t)v110;
    v50[2] = (uint64_t)v49;
    v50[3] = v54;
    v50[4] = (uint64_t)v108;
    v108 = v46;
    v109 = v47;
    swift_bridgeObjectRetain();
    v110 = v49;
    outlined consume of EnhancedMSPSharedTripContact?(v51, v52, v53);
    v55 = a2;
    v56 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v107, v56))
    {
      v57 = (uint8_t *)swift_slowAlloc();
      v58 = swift_slowAlloc();
      v114 = v58;
      *(_DWORD *)v57 = 136315138;
      v59 = v50[1];
      if (v59)
      {
        v60 = v50[4];
        v62 = (void *)v50[2];
        v61 = v50[3];
        v115[0] = *v50;
        v115[1] = v59;
        v115[2] = (uint64_t)v62;
        v115[3] = v61;
        v115[4] = v60;
        swift_bridgeObjectRetain();
        v63 = v62;
        v64 = EnhancedMSPSharedTripContact.description.getter(v63);
        v66 = v65;

        swift_bridgeObjectRelease();
      }
      else
      {
        v64 = 0;
        v66 = 0;
      }
      v112 = v64;
      v113 = v66;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for String?);
      v81 = String.init<A>(describing:)();
      v112 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v81, v82, &v114);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_230887000, v107, v56, "resolveRecipients successful %s", v57, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348BB678](v58, -1, -1);
      MEMORY[0x2348BB678](v57, -1, -1);
    }
    else
    {

    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v83 = swift_allocObject();
    *(_OWORD *)(v83 + 16) = xmmword_2308A3C20;
    v84 = v110;
    v85 = specialized EnhancedMSPSharedTripContact.getPersonHandle()(v110);
    v86 = type metadata accessor for PersonNameComponents();
    v87 = (uint64_t)v111;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v86 - 8) + 56))(v111, 1, 1, v86);
    v88 = objc_msgSend(v84, sel_contact);
    v89 = v106;
    if (v88)
    {
      v90 = v88;
      v91 = objc_msgSend((id)objc_opt_self(), sel_stringFromContact_style_, v88, 0);
      if (v91)
      {
        v92 = v91;
        v109 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v94 = v93;

LABEL_39:
        v96 = objc_msgSend(v110, sel_contact);
        v97 = v96;
        if (v96)
        {
          v98 = objc_msgSend(v96, sel_identifier);

          v97 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
          v100 = v99;

        }
        else
        {
          v100 = 0;
        }
        v101 = objc_allocWithZone(MEMORY[0x24BDD9F30]);
        v102 = @nonobjc INPerson.init(personHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:)(v85, v87, v109, v94, 0, (uint64_t)v97, v100, 0, 0);
        v103 = objc_msgSend((id)objc_opt_self(), sel_resolutionResultSuccessWithResolvedValue_, v102);

        *(_QWORD *)(v83 + 32) = v103;
        v112 = v83;
        specialized Array._endMutation()();
        v89(v112);

        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }

    }
    v95 = v108;
    swift_bridgeObjectRetain();
    v94 = (uint64_t)v95;
    goto LABEL_39;
  }
  __break(1u);
  return result;
}

void INShareETAIntentHandler.confirm(intent:completion:)(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  void *v3;
  id v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD aBlock[6];

  v6 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (v6)
  {
    v7 = v6;
    v8 = (_QWORD *)swift_allocObject();
    v8[2] = v3;
    v8[3] = v7;
    v8[4] = a2;
    v8[5] = a3;
    aBlock[4] = partial apply for closure #1 in INShareETAIntentHandler.confirm(intent:completion:);
    aBlock[5] = v8;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ();
    aBlock[3] = &block_descriptor_6;
    v9 = _Block_copy(aBlock);
    v10 = v3;
    v11 = v7;
    swift_retain();
    swift_release();
    objc_msgSend(v11, sel_performBlockAfterInitialSync_, v9);
    _Block_release(v9);

  }
  else
  {
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA158]), sel_initWithCode_userActivity_, 4, 0);
    a2();

  }
}

void closure #1 in INShareETAIntentHandler.confirm(intent:completion:)(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  id v11;
  _QWORD *v12;
  void *v13;
  id v14;
  _QWORD v15[6];

  static os_log_type_t.info.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_2308A3BB0;
  *(_QWORD *)(v10 + 56) = type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for MSPSharedTripService);
  *(_QWORD *)(v10 + 64) = lazy protocol witness table accessor for type MSPSharedTripService and conformance NSObject();
  *(_QWORD *)(v10 + 32) = a3;
  v11 = a3;
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a2;
  v12[3] = a4;
  v12[4] = a5;
  v15[4] = partial apply for closure #1 in closure #1 in INShareETAIntentHandler.confirm(intent:completion:);
  v15[5] = v12;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 1107296256;
  v15[2] = thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed String?, @guaranteed Error?) -> ();
  v15[3] = &block_descriptor_67;
  v13 = _Block_copy(v15);
  v14 = a2;
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_fetchRequiresUserConfirmationOfSharingIdentityWithCompletion_, v13);
  _Block_release(v13);
}

void closure #1 in closure #1 in INShareETAIntentHandler.confirm(intent:completion:)(char a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void (*a6)(void))
{
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;

  v9 = *(NSObject **)(a5 + OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_logObject);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_230887000, v9, v10, "share ETA confirm ready", v11, 2u);
    MEMORY[0x2348BB678](v11, -1, -1);
  }
  if (a4)
  {
    v12 = a4;
    static os_log_type_t.error.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_2308A3BB0;
    swift_getErrorValue();
    v14 = Error.localizedDescription.getter();
    v16 = v15;
    *(_QWORD *)(v13 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v13 + 64) = lazy protocol witness table accessor for type String and conformance String();
    *(_QWORD *)(v13 + 32) = v14;
    *(_QWORD *)(v13 + 40) = v16;
    os_log(_:dso:log:_:_:)();
    swift_bridgeObjectRelease();
    v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA158]), sel_initWithCode_userActivity_, 1, 0);
    a6();

  }
  else
  {
    v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      v20 = swift_slowAlloc();
      *(_DWORD *)v19 = 136315138;
      v26 = v20;
      if ((a1 & 1) != 0)
        v21 = 1702195828;
      else
        v21 = 0x65736C6166;
      if ((a1 & 1) != 0)
        v22 = 0xE400000000000000;
      else
        v22 = 0xE500000000000000;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, &v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_230887000, v9, v18, "fetchRequiresUserConfirmationOfSharingIdentity requiresConfirmation value: %s", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348BB678](v20, -1, -1);
      MEMORY[0x2348BB678](v19, -1, -1);
    }
    v23 = objc_allocWithZone(MEMORY[0x24BDDA158]);
    if ((a1 & 1) != 0)
      v24 = 2;
    else
      v24 = 1;
    v25 = objc_msgSend(v23, sel_initWithCode_userActivity_, v24, 0);
    a6();

  }
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed String?, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void (*v6)(uint64_t, uint64_t, uint64_t, void *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v6 = *(void (**)(uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  if (a3)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  swift_retain();
  v10 = a4;
  v6(a2, v7, v9, a4);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t INShareETAIntentHandler.handle(intent:completion:)(void *a1, void (*a2)(id), uint64_t a3)
{
  void *v3;
  char *v7;

  v7 = v3;
  swift_retain();
  specialized INShareETAIntentHandler.handleShareETA(intent:completion:)(a1, v7, v7, a2, a3);

  return swift_release();
}

void closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:)(void *a1, char *a2, void *a3, void (*a4)(void), uint64_t a5, void *a6)
{
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  os_log_type_t v24;
  id v25;
  uint8_t *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  void *v34;
  char *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  void (*v41)(void);
  uint64_t aBlock;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;

  static os_log_type_t.info.getter();
  v11 = *(NSObject **)&a2[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_logObject];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_2308A3BB0;
  *(_QWORD *)(v12 + 56) = type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for MSPSharedTripService);
  *(_QWORD *)(v12 + 64) = lazy protocol witness table accessor for type MSPSharedTripService and conformance NSObject();
  *(_QWORD *)(v12 + 32) = a3;
  v13 = a3;
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a1;
  *(_QWORD *)(v14 + 24) = a2;
  v47 = partial apply for closure #1 in closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:);
  v48 = (_QWORD *)v14;
  aBlock = MEMORY[0x24BDAC760];
  v44 = 1107296256;
  v45 = thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed String?, @guaranteed Error?) -> ();
  v46 = &block_descriptor_49;
  v15 = _Block_copy(&aBlock);
  v16 = a1;
  v17 = a2;
  swift_release();
  objc_msgSend(v16, sel_fetchRequiresUserConfirmationOfSharingIdentityWithCompletion_, v15);
  _Block_release(v15);
  v18 = &v17[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact];
  v19 = *(_QWORD *)&v17[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact + 8];
  if (v19)
  {
    v41 = a4;
    v20 = *((_QWORD *)v18 + 4);
    v22 = (void *)*((_QWORD *)v18 + 2);
    v21 = *((_QWORD *)v18 + 3);
    v49 = *(_QWORD *)v18;
    v50 = v19;
    v51 = v22;
    v52 = v21;
    v53 = v20;
    swift_bridgeObjectRetain();
    v23 = v22;
    v24 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v11, v24))
    {
      swift_bridgeObjectRetain_n();
      v25 = v23;
      v39 = v16;
      v26 = (uint8_t *)swift_slowAlloc();
      v38 = v23;
      v27 = swift_slowAlloc();
      aBlock = v27;
      *(_DWORD *)v26 = 136315138;
      swift_bridgeObjectRetain();
      v28 = v25;
      v29 = EnhancedMSPSharedTripContact.description.getter(v28);
      v40 = a5;
      v31 = v30;

      swift_bridgeObjectRelease();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v29, v31, &aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      v16 = v39;
      swift_bridgeObjectRelease_n();
      a5 = v40;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_230887000, v11, v24, "shared trip contact retrieved %s", v26, 0xCu);
      swift_arrayDestroy();
      v32 = v27;
      v23 = v38;
      MEMORY[0x2348BB678](v32, -1, -1);
      MEMORY[0x2348BB678](v26, -1, -1);
    }
    v33 = (_QWORD *)swift_allocObject();
    v33[2] = v17;
    v33[3] = v41;
    v33[4] = a5;
    v33[5] = a6;
    v47 = partial apply for closure #2 in closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:);
    v48 = v33;
    aBlock = MEMORY[0x24BDAC760];
    v44 = 1107296256;
    v45 = thunk for @escaping @callee_guaranteed (@unowned MSPSharedTripCapabilityType, @guaranteed Error?) -> ();
    v46 = &block_descriptor_55;
    v34 = _Block_copy(&aBlock);
    v35 = v17;
    swift_retain();
    v36 = a6;
    swift_release();
    objc_msgSend(v16, sel_startSharingWithContact_completion_, v23, v34);
    _Block_release(v34);

    swift_bridgeObjectRelease();
  }
  else
  {
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    v37 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA158]), sel_initWithCode_userActivity_, 4, 0);
    a4();

  }
}

void closure #1 in closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:)(char a1, uint64_t a2, unint64_t a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[6];

  if ((a1 & 1) != 0)
  {
    if (a3)
      v8 = a2;
    else
      v8 = 0;
    if (a3)
      v9 = a3;
    else
      v9 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    v10 = (void *)MEMORY[0x2348BAFAC](v8, v9);
    swift_bridgeObjectRelease();
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = a6;
    v14[4] = partial apply for closure #1 in closure #1 in closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:);
    v14[5] = v11;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 1107296256;
    v14[2] = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
    v14[3] = &block_descriptor_61;
    v12 = _Block_copy(v14);
    v13 = a6;
    swift_release();
    objc_msgSend(a5, sel_reportUserConfirmationOfSharingIdentity_completion_, v10, v12);
    _Block_release(v12);

  }
}

void closure #1 in closure #1 in closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:)(void *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a1)
  {
    v2 = a1;
    static os_log_type_t.error.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_2308A3BB0;
    swift_getErrorValue();
    v4 = Error.localizedDescription.getter();
    v6 = v5;
    *(_QWORD *)(v3 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v3 + 64) = lazy protocol witness table accessor for type String and conformance String();
    *(_QWORD *)(v3 + 32) = v4;
    *(_QWORD *)(v3 + 40) = v6;
    os_log(_:dso:log:_:_:)();
    swift_bridgeObjectRelease();

  }
}

void closure #2 in closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), uint64_t a5, void *a6)
{
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  os_log_type_t v19;
  uint8_t *v20;
  id v21;
  void *v22;
  uint64_t v23;
  Class isa;
  id v25;
  id v26;
  os_log_type_t v27;
  uint8_t *v28;
  id v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  uint64_t v38;

  if (a2)
    v9 = (void *)_convertErrorToNSError(_:)();
  else
    v9 = 0;
  static os_log_type_t.info.getter();
  v10 = *(NSObject **)(a3 + OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_logObject);
  os_log(_:dso:log:_:_:)();
  if (v9)
  {
    v11 = v9;
    v12 = objc_msgSend(v11, sel_code);
    static os_log_type_t.error.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_2308A3BB0;
    v14 = objc_msgSend(v11, sel_localizedDescription);
    v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v17 = v16;

    *(_QWORD *)(v13 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v13 + 64) = lazy protocol witness table accessor for type String and conformance String();
    *(_QWORD *)(v13 + 32) = v15;
    *(_QWORD *)(v13 + 40) = v17;
    os_log(_:dso:log:_:_:)();
    swift_bridgeObjectRelease();
    switch((unint64_t)v12)
    {
      case 5uLL:
        v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA158]), sel_initWithCode_userActivity_, 13, 0);
        break;
      case 8uLL:
        v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA158]), sel_initWithCode_userActivity_, 12, 0);
        break;
      case 0xCuLL:
        v19 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v10, v19))
        {
          v20 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v20 = 0;
          _os_log_impl(&dword_230887000, v10, v19, "Already sharing with Contact", v20, 2u);
          MEMORY[0x2348BB678](v20, -1, -1);
        }

        goto LABEL_13;
      default:
        v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA158]), sel_initWithCode_userActivity_, 4, 0);
        break;
    }
    v35 = v18;
    a4();

  }
  else
  {
LABEL_13:
    v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA158]), sel_initWithCode_userActivity_, 3, 0);
    v22 = v21;
    if ((unint64_t)(a1 - 2) > 2)
      v23 = 1;
    else
      v23 = qword_2308A40C8[a1 - 2];
    objc_msgSend(v21, sel_setMediums_, v23);
    type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for INPerson);
    isa = Array._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v22, sel_setRecipients_, isa);

    v25 = objc_msgSend(a6, sel_recipients);
    objc_msgSend(v22, sel_setRecipients_, v25);

    v26 = v22;
    v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      v34 = swift_slowAlloc();
      v38 = v34;
      *(_DWORD *)v28 = 136315138;
      v36 = v9;
      v29 = v26;
      v30 = objc_msgSend(v29, sel_description);
      v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v33 = v32;

      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v31, v33, &v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      v9 = v36;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_230887000, v10, v27, "Sending response : %s", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348BB678](v34, -1, -1);
      MEMORY[0x2348BB678](v28, -1, -1);
    }
    else
    {

    }
    ((void (*)(id))a4)(v26);

  }
}

void thunk for @escaping @callee_guaranteed (@unowned MSPSharedTripCapabilityType, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

id INShareETAIntentHandler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id INShareETAIntentHandler.init()()
{
  char *v0;
  uint64_t v1;
  char *v2;
  char *v3;
  uint64_t v4;
  objc_super v6;

  v1 = OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_logObject;
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  v2 = v0;
  *(_QWORD *)&v0[v1] = OS_os_log.init(subsystem:category:)();
  v3 = &v2[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact];
  *((_QWORD *)v3 + 4) = 0;
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  v4 = OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_contactService;
  type metadata accessor for ContactService();
  swift_allocObject();
  *(_QWORD *)&v2[v4] = ContactService.init()();

  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for INShareETAIntentHandler();
  return objc_msgSendSuper2(&v6, sel_init);
}

id INShareETAIntentHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for INShareETAIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id @nonobjc INPerson.init(personHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v16;
  uint64_t v17;
  Class isa;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v26;

  v16 = type metadata accessor for PersonNameComponents();
  v17 = *(_QWORD *)(v16 - 8);
  isa = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(a2, 1, v16) != 1)
  {
    isa = PersonNameComponents._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(a2, v16);
  }
  if (a4)
  {
    v19 = (void *)MEMORY[0x2348BAFAC](a3, a4);
    swift_bridgeObjectRelease();
    v20 = a9;
    if (a7)
      goto LABEL_5;
LABEL_8:
    v21 = 0;
    if (v20)
      goto LABEL_6;
LABEL_9:
    v22 = 0;
    goto LABEL_10;
  }
  v19 = 0;
  v20 = a9;
  if (!a7)
    goto LABEL_8;
LABEL_5:
  v21 = (void *)MEMORY[0x2348BAFAC](a6, a7);
  swift_bridgeObjectRelease();
  if (!v20)
    goto LABEL_9;
LABEL_6:
  v22 = (void *)MEMORY[0x2348BAFAC](a8, v20);
  swift_bridgeObjectRelease();
LABEL_10:
  v23 = objc_msgSend(v26, sel_initWithPersonHandle_nameComponents_displayName_image_contactIdentifier_customIdentifier_, a1, isa, v19, a5, v21, v22, a8);

  return v23;
}

void partial apply for closure #1 in INShareETAIntentHandler.confirm(intent:completion:)(void *a1)
{
  uint64_t v1;

  closure #1 in INShareETAIntentHandler.confirm(intent:completion:)(a1, *(void **)(v1 + 16), *(void **)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

void specialized INShareETAIntentHandler.resolveRecipients(for:with:)(void *a1, char *a2, void (**a3)(_QWORD, _QWORD))
{
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  void *v11;
  os_log_type_t v12;
  uint8_t *v13;
  _QWORD *v14;
  void *v15;
  char *v16;
  id v17;
  id v18;
  uint64_t v19;
  Class isa;
  _QWORD aBlock[6];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a3;
  v7 = *(NSObject **)&a2[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_logObject];
  _Block_copy(a3);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_230887000, v7, v8, "resolveRecipient called", v9, 2u);
    MEMORY[0x2348BB678](v9, -1, -1);
  }
  v10 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (v10)
  {
    v11 = v10;
    v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_230887000, v7, v12, "share ETA confirm ready", v13, 2u);
      MEMORY[0x2348BB678](v13, -1, -1);
    }
    v14 = (_QWORD *)swift_allocObject();
    v14[2] = a2;
    v14[3] = v11;
    v14[4] = a1;
    v14[5] = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSArray) -> ();
    v14[6] = v6;
    aBlock[4] = partial apply for closure #1 in INShareETAIntentHandler.resolveRecipients(for:with:);
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ();
    aBlock[3] = &block_descriptor_34;
    v15 = _Block_copy(aBlock);
    v16 = a2;
    v17 = v11;
    v18 = a1;
    swift_retain();
    swift_release();
    objc_msgSend(v17, sel_performBlockAfterInitialSync_, v15);
    _Block_release(v15);
    swift_release();

  }
  else
  {
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_2308A3C20;
    *(_QWORD *)(v19 + 32) = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 5);
    aBlock[0] = v19;
    specialized Array._endMutation()();
    type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for INShareETARecipientResolutionResult);
    isa = Array._bridgeToObjectiveC()().super.isa;
    ((void (**)(_QWORD, Class))a3)[2](a3, isa);
    swift_release();
    swift_bridgeObjectRelease();

  }
}

BOOL specialized INShareETAIntentHandler.phoneDisambiguationCandidates(_:)(double *a1)
{
  unint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  double *v17;
  _QWORD *v18;
  double v19;
  id v20;
  unint64_t v21;
  unint64_t v22;
  double *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;

  v2 = *((_QWORD *)a1 + 2);
  if (v2 > 1)
  {
    v11 = (void *)*((_QWORD *)a1 + 6);
    if ((objc_msgSend(v11, sel_isPhoneNumber) & 1) == 0)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<EnhancedMSPSharedTripContact>);
      v25 = swift_allocObject();
      *(_OWORD *)(v25 + 16) = xmmword_2308A3BB0;
      v26 = *((_QWORD *)a1 + 5);
      v27 = *((_QWORD *)a1 + 7);
      v28 = *((_QWORD *)a1 + 8);
      *(double *)(v25 + 32) = a1[4];
      *(_QWORD *)(v25 + 40) = v26;
      *(_QWORD *)(v25 + 48) = v11;
      *(_QWORD *)(v25 + 56) = v27;
      *(_QWORD *)(v25 + 64) = v28;
      swift_bridgeObjectRetain();
      v29 = v11;
      return 0;
    }
    v12 = a1[8];
    v13 = *((_QWORD *)a1 + 7);
    v15 = *((_QWORD *)a1 + 4);
    v14 = *((_QWORD *)a1 + 5);
    v16 = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (objc_msgSend(v16, sel_isPhoneNumber))
    {
      v17 = a1 + 13;
      v18 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v19 = v12;
      while (1)
      {
        swift_bridgeObjectRetain();
        v20 = v16;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v18 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v18[2] + 1, 1, v18);
        v22 = v18[2];
        v21 = v18[3];
        if (v22 >= v21 >> 1)
          v18 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v21 > 1), v22 + 1, 1, v18);
        v18[2] = v22 + 1;
        v23 = (double *)&v18[5 * v22];
        *((_QWORD *)v23 + 4) = v15;
        *((_QWORD *)v23 + 5) = v14;
        *((_QWORD *)v23 + 6) = v20;
        *((_QWORD *)v23 + 7) = v13;
        v23[8] = v19;

        swift_bridgeObjectRelease();
        if (!--v2)
          break;
        if (v13 != *((_QWORD *)v17 - 1))
          break;
        v19 = *v17;
        if (v12 != *v17)
          break;
        v15 = *((_QWORD *)v17 - 4);
        v14 = *((_QWORD *)v17 - 3);
        v24 = (void *)*((_QWORD *)v17 - 2);
        swift_bridgeObjectRetain();
        v16 = v24;
        v17 += 5;
        if ((objc_msgSend(v16, sel_isPhoneNumber) & 1) == 0)
          goto LABEL_18;
      }
    }
    else
    {
      v18 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_18:
      swift_bridgeObjectRelease();

    }
    swift_bridgeObjectRelease();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<EnhancedMSPSharedTripContact>);
    v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_2308A3BB0;
    if (v2 == 1)
    {
      v4 = (_QWORD *)v3;
      v5 = *((_QWORD *)a1 + 5);
      v7 = (void *)*((_QWORD *)a1 + 6);
      v6 = *((_QWORD *)a1 + 7);
      v8 = *((_QWORD *)a1 + 8);
      v4[4] = *((_QWORD *)a1 + 4);
      v4[5] = v5;
      v4[6] = v7;
      v4[7] = v6;
      v4[8] = v8;
      swift_bridgeObjectRetain();
      v9 = v7;
      return 0;
    }
    __break(1u);
    v18 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v18[2] > 1uLL;
}

void specialized INShareETAIntentHandler.confirm(intent:completion:)(void *a1, void (**a2)(_QWORD, _QWORD))
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD aBlock[6];

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a2;
  v5 = (void *)objc_opt_self();
  _Block_copy(a2);
  v6 = objc_msgSend(v5, sel_sharedInstance);
  if (v6)
  {
    v7 = v6;
    v8 = (_QWORD *)swift_allocObject();
    v8[2] = a1;
    v8[3] = v7;
    v8[4] = thunk for @escaping @callee_unowned @convention(block) (@unowned INShareETAIntentResponse) -> ()partial apply;
    v8[5] = v4;
    aBlock[4] = closure #1 in INShareETAIntentHandler.confirm(intent:completion:)partial apply;
    aBlock[5] = v8;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ();
    aBlock[3] = &block_descriptor_24;
    v9 = _Block_copy(aBlock);
    v10 = a1;
    v11 = v7;
    swift_retain();
    swift_release();
    objc_msgSend(v11, sel_performBlockAfterInitialSync_, v9);
    _Block_release(v9);
    swift_release();

  }
  else
  {
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA158]), sel_initWithCode_userActivity_, 4, 0);
    ((void (**)(_QWORD, id))a2)[2](a2, v12);
    swift_release();

  }
}

void specialized INShareETAIntentHandler.handleShareETA(intent:completion:)(void *a1, char *a2, void *a3, void (*a4)(id), uint64_t a5)
{
  _QWORD *v10;
  NSObject *v11;
  id v12;
  char *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  id v24;
  void *v25;
  _QWORD *v26;
  void *v27;
  id v28;
  char *v29;
  id v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  char *v35;
  char *v36;
  uint64_t aBlock[6];

  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a3;
  v10[3] = a4;
  v10[4] = a5;
  v11 = *(NSObject **)&a2[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_logObject];
  v12 = a1;
  v13 = a3;
  swift_retain();
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v14))
  {
    v36 = v13;
    v35 = a2;
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    aBlock[0] = v16;
    *(_DWORD *)v15 = 136315138;
    v17 = objc_msgSend(v12, sel_recipients);
    if (!v17)
    {

      swift_release();
      __break(1u);
      return;
    }
    v18 = v17;
    v19 = type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for INPerson);
    v20 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    v21 = MEMORY[0x2348BB03C](v20, v19);
    v23 = v22;
    swift_bridgeObjectRelease();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v23, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_230887000, v11, v14, "handle Contact: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348BB678](v16, -1, -1);
    MEMORY[0x2348BB678](v15, -1, -1);
    v13 = v36;
    a2 = v35;
  }
  else
  {

  }
  v24 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (v24)
  {
    v25 = v24;
    v26 = (_QWORD *)swift_allocObject();
    v26[2] = a2;
    v26[3] = v25;
    v26[4] = partial apply for closure #1 in INShareETAIntentHandler.handle(intent:completion:);
    v26[5] = v10;
    v26[6] = v12;
    aBlock[4] = (uint64_t)partial apply for closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:);
    aBlock[5] = (uint64_t)v26;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ();
    aBlock[3] = (uint64_t)&block_descriptor_43;
    v27 = _Block_copy(aBlock);
    v28 = v12;
    v29 = a2;
    v30 = v25;
    swift_retain();
    swift_release();
    objc_msgSend(v30, sel_performBlockAfterInitialSync_, v27);
    _Block_release(v27);
  }
  else
  {
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA158]), sel_initWithCode_userActivity_, 6, 0);
    v31 = &v13[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact];
    v32 = *(_QWORD *)&v13[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact];
    v33 = *(_QWORD *)&v13[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact + 8];
    v34 = *(void **)&v13[OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact + 16];
    *(_OWORD *)v31 = 0u;
    *((_OWORD *)v31 + 1) = 0u;
    *((_QWORD *)v31 + 4) = 0;
    outlined consume of EnhancedMSPSharedTripContact?(v32, v33, v34);
    a4(v30);
  }
  swift_release();

}

uint64_t type metadata accessor for INShareETAIntentHandler()
{
  return objc_opt_self();
}

uint64_t partial apply for closure #2 in INShareETAIntentHandler.resolveRecipientsInsideBlock(for:with:)(uint64_t a1)
{
  uint64_t v1;

  return closure #2 in INShareETAIntentHandler.resolveRecipientsInsideBlock(for:with:)(a1, *(char **)(v1 + 16), *(void (**)(uint64_t))(v1 + 24), *(_QWORD *)(v1 + 32));
}

void outlined consume of EnhancedMSPSharedTripContact?(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    swift_bridgeObjectRelease();

  }
}

uint64_t sub_23089994C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSArray) -> ()(uint64_t a1)
{
  uint64_t v1;

  thunk for @escaping @callee_unowned @convention(block) (@unowned NSArray) -> ()(a1, *(_QWORD *)(v1 + 16));
}

{
  uint64_t v1;

  thunk for @escaping @callee_unowned @convention(block) (@unowned NSArray) -> ()(a1, *(_QWORD *)(v1 + 16));
}

uint64_t objectdestroyTm()
{
  id *v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in INShareETAIntentHandler.handle(intent:completion:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v3)(uint64_t);
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = *(uint64_t (**)(uint64_t))(v1 + 24);
  v4 = (uint64_t *)(*(_QWORD *)(v1 + 16) + OBJC_IVAR____TtC7SiriGeo23INShareETAIntentHandler_sharedTripContact);
  v5 = *v4;
  v6 = v4[1];
  v7 = (void *)v4[2];
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[4] = 0;
  outlined consume of EnhancedMSPSharedTripContact?(v5, v6, v7);
  return v3(a1);
}

uint64_t sub_230899A50()
{
  id *v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:)(uint64_t a1)
{
  return partial apply for closure #1 in INShareETAIntentHandler.resolveRecipients(for:with:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:));
}

uint64_t partial apply for closure #1 in INShareETAIntentHandler.resolveRecipients(for:with:)(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v2;

  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6]);
}

unint64_t lazy protocol witness table accessor for type MSPSharedTripService and conformance NSObject()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type MSPSharedTripService and conformance NSObject;
  if (!lazy protocol witness table cache variable for type MSPSharedTripService and conformance NSObject)
  {
    v1 = type metadata accessor for OS_os_log(255, &lazy cache variable for type metadata for MSPSharedTripService);
    result = MEMORY[0x2348BB60C](MEMORY[0x24BEE5BE8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MSPSharedTripService and conformance NSObject);
  }
  return result;
}

uint64_t sub_230899B04()
{
  uint64_t v0;

  return swift_deallocObject();
}

void partial apply for closure #1 in closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:)(char a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;

  closure #1 in closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:)(a1, a2, a3, a4, *(void **)(v4 + 16), *(void **)(v4 + 24));
}

uint64_t sub_230899B38()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void partial apply for closure #2 in closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  closure #2 in closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:)(a1, a2, *(_QWORD *)(v2 + 16), *(void (**)(void))(v2 + 24), *(_QWORD *)(v2 + 32), *(void **)(v2 + 40));
}

uint64_t sub_230899B78()
{
  uint64_t v0;

  return swift_deallocObject();
}

void partial apply for closure #1 in closure #1 in closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:)(void *a1)
{
  closure #1 in closure #1 in closure #1 in INShareETAIntentHandler.handleShareETA(intent:completion:)(a1);
}

uint64_t objectdestroy_9Tm()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void partial apply for closure #1 in closure #1 in INShareETAIntentHandler.confirm(intent:completion:)(char a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;

  closure #1 in closure #1 in INShareETAIntentHandler.confirm(intent:completion:)(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(void (**)(void))(v4 + 24));
}

void thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ()(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

id INStopShareETAIntentHandler.logObject.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_logObject);
}

void INStopShareETAIntentHandler.resolveRecipients(for:with:)(void *a1, void (*a2)(uint64_t), uint64_t a3)
{
  char *v3;
  id v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  char *v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  _QWORD v17[6];

  v7 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (v7)
  {
    v8 = v7;
    v9 = (_QWORD *)swift_allocObject();
    v9[2] = v3;
    v9[3] = a1;
    v9[4] = a2;
    v9[5] = a3;
    v17[4] = partial apply for closure #1 in INStopShareETAIntentHandler.resolveRecipients(for:with:);
    v17[5] = v9;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 1107296256;
    v17[2] = thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ();
    v17[3] = &block_descriptor_1;
    v10 = _Block_copy(v17);
    v11 = v3;
    v12 = a1;
    swift_retain();
    swift_release();
    objc_msgSend(v8, sel_performBlockAfterInitialSync_, v10);
    _Block_release(v10);

  }
  else
  {
    v13 = *(NSObject **)&v3[OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_logObject];
    v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_230887000, v13, v14, "could not get msp shared instance to check if the there is a match with receivers", v15, 2u);
      MEMORY[0x2348BB678](v15, -1, -1);
    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_2308A3C20;
    *(_QWORD *)(v16 + 32) = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 5);
    specialized Array._endMutation()();
    a2(v16);
    swift_bridgeObjectRelease();
  }
}

void INStopShareETAIntentHandler.resolveRecipientsInsideBlock(for:sharedTrip:with:)(void *a1, void *a2, void (*a3)(uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  id v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  NSObject *v14;
  id v15;
  BOOL v16;
  unint64_t v17;
  id v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  id v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t (*v30)(id);
  uint64_t v31;
  void *v32;
  void *v33;
  unint64_t v34;
  id v35;
  void *v36;
  unsigned int v37;
  uint64_t v38;
  os_log_type_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  id v44;
  void (*v45)(uint64_t);
  void *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void (*v65)(uint64_t);
  NSObject *oslog;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;

  v4 = v3;
  v7 = objc_msgSend(a1, sel_recipients);
  if (!v7)
  {
    v40 = *(NSObject **)(v3 + OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_logObject);
    v41 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v42 = 0;
      _os_log_impl(&dword_230887000, v40, v41, "resolveRecipients nil recipients - stop sharing ETA with all recipients", v42, 2u);
      MEMORY[0x2348BB678](v42, -1, -1);
    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v43 = swift_allocObject();
    *(_OWORD *)(v43 + 16) = xmmword_2308A3C20;
    type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for INStopShareETARecipientResolutionResult);
    *(_QWORD *)(v43 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
    specialized Array._endMutation()();
    a3(v43);
    goto LABEL_55;
  }
  v8 = v7;
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for INPerson);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v10 = specialized static INPerson.contactsWithContactIdentifiers(_:)(v9);
  swift_bridgeObjectRelease();
  v65 = a3;
  if (v10 >> 62)
  {
LABEL_53:
    swift_bridgeObjectRetain();
    v11 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    v12 = v10;
    if (v11)
      goto LABEL_4;
    goto LABEL_54;
  }
  v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
  v12 = v10;
  if (!v11)
  {
LABEL_54:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v60 = swift_allocObject();
    *(_OWORD *)(v60 + 16) = xmmword_2308A3C20;
    *(_QWORD *)(v60 + 32) = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 1);
    v71 = v60;
    specialized Array._endMutation()();
    v65(v71);
LABEL_55:
    swift_bridgeObjectRelease();
    return;
  }
LABEL_4:
  v13 = 0;
  v14 = *(NSObject **)(v4 + OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_logObject);
  v67 = OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_contactService;
  v68 = v12 & 0xC000000000000001;
  v61 = v12 + 32;
  v62 = v12 & 0xFFFFFFFFFFFFFF8;
  v63 = v11;
  oslog = v14;
  v69 = v4;
  while (1)
  {
    if (v68)
    {
      v15 = (id)MEMORY[0x2348BB150](v13, v12);
      v16 = __OFADD__(v13, 1);
      v17 = v13 + 1;
      if (v16)
        goto LABEL_51;
    }
    else
    {
      if (v13 >= *(_QWORD *)(v62 + 16))
        goto LABEL_52;
      v15 = *(id *)(v61 + 8 * v13);
      v16 = __OFADD__(v13, 1);
      v17 = v13 + 1;
      if (v16)
      {
LABEL_51:
        __break(1u);
LABEL_52:
        __break(1u);
        goto LABEL_53;
      }
    }
    v18 = v15;
    v19 = static os_log_type_t.default.getter();
    v70 = v17;
    if (os_log_type_enabled(v14, v19))
    {
      v20 = swift_slowAlloc();
      v21 = swift_slowAlloc();
      v71 = v21;
      *(_DWORD *)v20 = 136315138;
      v22 = v18;
      v23 = objc_msgSend(v22, sel_description);
      v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v25 = a2;
      v26 = v12;
      v27 = v18;
      v29 = v28;

      v4 = v69;
      *(_QWORD *)(v20 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v29, &v71);

      v18 = v27;
      v12 = v26;
      a2 = v25;
      v11 = v63;
      v14 = oslog;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_230887000, oslog, v19, "match %s", (uint8_t *)v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348BB678](v21, -1, -1);
      MEMORY[0x2348BB678](v20, -1, -1);
    }
    else
    {

    }
    v10 = *(_QWORD *)(v4 + v67);
    v30 = *(uint64_t (**)(id))(*(_QWORD *)v10 + 128);
    swift_retain();
    v31 = v30(v18);
    v33 = v32;
    swift_release();
    if (v31)
      break;

LABEL_6:
    v13 = v70;
    if (v70 == v11)
      goto LABEL_54;
  }
  if (!((unint64_t)v31 >> 62))
  {
    v4 = *(_QWORD *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v4)
      goto LABEL_19;
LABEL_34:
    swift_bridgeObjectRelease();
    v39 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v39))
    {
      v10 = swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_230887000, v14, v39, "failed to fetch contact from recipient", (uint8_t *)v10, 2u);
      MEMORY[0x2348BB678](v10, -1, -1);
    }

    v4 = v69;
    goto LABEL_6;
  }
  if (v31 >= 0)
    v10 = v31 & 0xFFFFFFFFFFFFFF8;
  else
    v10 = v31;
  swift_bridgeObjectRetain();
  v38 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v38)
    goto LABEL_34;
  swift_bridgeObjectRetain();
  v4 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v4 < 0)
  {
    __break(1u);
    return;
  }
  if (!v4)
  {

    swift_bridgeObjectRelease();
    v4 = v69;
    goto LABEL_6;
  }
LABEL_19:
  v64 = v18;
  v10 = 0;
  v34 = v31 & 0xC000000000000001;
  while (1)
  {
    if (v4 == v10)
    {
      __break(1u);
      goto LABEL_51;
    }
    v35 = v34 ? (id)MEMORY[0x2348BB150](v10, v31) : *(id *)(v31 + 8 * v10 + 32);
    v36 = v35;
    v37 = objc_msgSend(a2, sel_isSharingWithContact_, v35);

    if (v37)
      break;
    if (v4 == ++v10)
    {

      swift_bridgeObjectRelease();
      v14 = oslog;
      v4 = v69;
      goto LABEL_6;
    }
  }
  swift_bridgeObjectRelease();
  if (v34)
    v44 = (id)MEMORY[0x2348BB150](v10, v31);
  else
    v44 = *(id *)(v31 + 8 * v10 + 32);
  v45 = v65;
  v46 = *(void **)(v69 + OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_sharedTripContact);
  *(_QWORD *)(v69 + OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_sharedTripContact) = v44;

  swift_bridgeObjectRetain();
  v47 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v47))
  {
    v48 = (uint8_t *)swift_slowAlloc();
    v49 = swift_slowAlloc();
    v71 = v49;
    *(_DWORD *)v48 = 136315138;
    if (v34)
      v50 = (id)MEMORY[0x2348BB150](v10, v31);
    else
      v50 = *(id *)(v31 + 8 * v10 + 32);
    v52 = v50;
    v51 = v64;
    v53 = objc_msgSend(v50, sel_description);
    v54 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v56 = v55;

    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v54, v56, &v71);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_230887000, oslog, v47, "resolveRecipients successful %s", v48, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348BB678](v49, -1, -1);
    MEMORY[0x2348BB678](v48, -1, -1);
    v45 = v65;
  }
  else
  {
    swift_bridgeObjectRelease_n();
    v51 = v64;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  v57 = swift_allocObject();
  *(_OWORD *)(v57 + 16) = xmmword_2308A3C20;
  *(_QWORD *)(v57 + 32) = v33;
  v71 = v57;
  specialized Array._endMutation()();
  v58 = v71;
  v59 = v33;
  v45(v58);
  swift_bridgeObjectRelease();

}

void INStopShareETAIntentHandler.confirm(intent:completion:)(uint64_t a1, void (*a2)(id), uint64_t a3)
{
  char *v3;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  id v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  char *v13;
  id v14;
  os_log_type_t v15;
  uint8_t *v16;
  id v17;
  _QWORD aBlock[6];

  v6 = *(NSObject **)&v3[OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_logObject];
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_230887000, v6, v7, "stop sharing ETA - confirm", v8, 2u);
    MEMORY[0x2348BB678](v8, -1, -1);
  }
  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA200]), sel_initWithCode_userActivity_, 1, 0);
  v9 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (v9)
  {
    v10 = v9;
    v11 = (_QWORD *)swift_allocObject();
    v11[2] = v3;
    v11[3] = v17;
    v11[4] = a2;
    v11[5] = a3;
    aBlock[4] = partial apply for closure #1 in INStopShareETAIntentHandler.confirm(intent:completion:);
    aBlock[5] = v11;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ();
    aBlock[3] = &block_descriptor_6_0;
    v12 = _Block_copy(aBlock);
    v13 = v3;
    v14 = v17;
    swift_retain();
    swift_release();
    objc_msgSend(v10, sel_performBlockAfterInitialSync_, v12);
    _Block_release(v12);

  }
  else
  {
    v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v6, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_230887000, v6, v15, "failed to retrieve shared instance", v16, 2u);
      MEMORY[0x2348BB678](v16, -1, -1);
    }
    a2(v17);

  }
}

uint64_t closure #1 in INStopShareETAIntentHandler.confirm(intent:completion:)(void *a1, uint64_t a2, void *a3, uint64_t (*a4)(id))
{
  NSObject *v5;
  id v6;
  os_log_type_t v7;
  SEL *v8;
  uint8_t *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  unint64_t v20;
  Class isa;
  id v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  NSObject *log;
  uint64_t v34;

  v5 = *(NSObject **)(a2 + OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_logObject);
  v6 = a1;
  v7 = static os_log_type_t.default.getter();
  v8 = (SEL *)&unk_24FEBA000;
  if (os_log_type_enabled(v5, v7))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v34 = v10;
    *(_DWORD *)v9 = 136315138;
    v11 = objc_msgSend(v6, sel_receivers);
    v12 = type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for MSPSharedTripContact);
    v13 = a3;
    v14 = v5;
    v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    v16 = MEMORY[0x2348BB03C](v15, v12);
    v18 = v17;
    v5 = v14;
    a3 = v13;
    v8 = (SEL *)&unk_24FEBA000;
    swift_bridgeObjectRelease();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v18, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_230887000, v5, v7, "receivers of shared trip %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348BB678](v10, -1, -1);
    MEMORY[0x2348BB678](v9, -1, -1);
  }
  else
  {

  }
  v19 = objc_msgSend(v6, v8[107]);
  type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for MSPSharedTripContact);
  v20 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  specialized INStopShareETAIntentHandler.convertSharedTripToRecipients(_:)(v20);
  swift_bridgeObjectRelease();
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for INPerson);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setRecipients_, isa);

  v22 = a3;
  v23 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    v25 = swift_slowAlloc();
    v34 = v25;
    *(_DWORD *)v24 = 136315138;
    log = v5;
    v26 = v22;
    v27 = objc_msgSend(v26, sel_description);
    v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v30 = v29;

    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v28, v30, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_230887000, log, v23, "confirm response %s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348BB678](v25, -1, -1);
    MEMORY[0x2348BB678](v24, -1, -1);
  }
  else
  {

  }
  return a4(v22);
}

uint64_t INStopShareETAIntentHandler.handle(intent:completion:)(void *a1, void (*a2)(id), uint64_t a3)
{
  void *v3;
  _QWORD *v7;
  void *v8;
  id v9;
  char *v10;
  id v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  char *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[6];

  v7 = (_QWORD *)swift_allocObject();
  v7[2] = v3;
  v7[3] = a2;
  v7[4] = a3;
  v8 = (void *)objc_opt_self();
  v9 = v3;
  swift_retain_n();
  v10 = (char *)v9;
  v11 = objc_msgSend(v8, sel_sharedInstance);
  if (v11)
  {
    v12 = v11;
    v13 = (_QWORD *)swift_allocObject();
    v13[2] = v10;
    v13[3] = partial apply for closure #1 in INStopShareETAIntentHandler.handle(intent:completion:);
    v13[4] = v7;
    v13[5] = a1;
    v20[4] = partial apply for closure #1 in INStopShareETAIntentHandler.handleStopShareETA(intent:completion:);
    v20[5] = v13;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 1107296256;
    v20[2] = thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ();
    v20[3] = &block_descriptor_15;
    v14 = _Block_copy(v20);
    v15 = v10;
    swift_retain();
    v16 = a1;
    swift_release();
    objc_msgSend(v12, sel_performBlockAfterInitialSync_, v14);
    _Block_release(v14);

    swift_release();
  }
  else
  {
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA200]), sel_initWithCode_userActivity_, 4, 0);
    v18 = *(void **)&v10[OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_sharedTripContact];
    *(_QWORD *)&v10[OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_sharedTripContact] = 0;

    a2(v17);
    swift_release();

  }
  return swift_release();
}

void @objc INStopShareETAIntentHandler.resolveRecipients(for:with:)(void *a1, int a2, void *a3, void *aBlock, void (*a5)(id, id, void *))
{
  void *v8;
  id v9;
  id v10;

  v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  v9 = a3;
  v10 = a1;
  a5(v9, v10, v8);
  _Block_release(v8);
  _Block_release(v8);

}

void closure #1 in INStopShareETAIntentHandler.handleStopShareETA(intent:completion:)(void *a1, char *a2, uint64_t a3, uint64_t a4, void *a5)
{
  char *v8;
  NSObject *v9;
  id v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  os_log_type_t v27;
  uint8_t *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  os_log_type_t v39;
  uint8_t *v40;
  NSObject *v41;
  uint8_t *v42;
  _QWORD *v43;
  void *v44;
  char *v45;
  id v46;
  _QWORD *v47;
  void *v48;
  char *v49;
  id v50;
  uint8_t *buf;
  uint64_t v52;
  uint64_t v53;
  id v54;
  NSObject *log;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t aBlock;
  uint64_t v61;
  void (*v62)(uint64_t, void *);
  void *v63;
  void (*v64)(uint64_t);
  _QWORD *v65;

  v8 = a2;
  v9 = *(NSObject **)&a2[OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_logObject];
  v10 = a1;
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v11))
  {
    log = v9;
    v12 = (uint8_t *)swift_slowAlloc();
    v58 = v8;
    v13 = swift_slowAlloc();
    aBlock = v13;
    *(_DWORD *)v12 = 136315138;
    v56 = a3;
    v14 = v10;
    v15 = a5;
    v16 = v10;
    v17 = objc_msgSend(v14, sel_description);
    v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v53 = a4;
    v20 = v19;

    v10 = v16;
    a5 = v15;
    v21 = v18;
    v9 = log;
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v20, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    a3 = v56;
    a4 = v53;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_230887000, log, v11, "stop sharing ETA - shared trip retrieved %s", v12, 0xCu);
    swift_arrayDestroy();
    v22 = v13;
    v8 = v58;
    MEMORY[0x2348BB678](v22, -1, -1);
    MEMORY[0x2348BB678](v12, -1, -1);
  }
  else
  {

  }
  v23 = *(void **)&v8[OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_sharedTripContact];
  if (v23 && (objc_opt_self(), (v24 = swift_dynamicCastObjCClass()) != 0))
  {
    v25 = (void *)v24;
    v26 = v23;
    v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v27))
    {
      v57 = a3;
      v59 = v8;
      v28 = (uint8_t *)swift_slowAlloc();
      v52 = swift_slowAlloc();
      aBlock = v52;
      *(_DWORD *)v28 = 136315138;
      buf = v28;
      v54 = v10;
      v29 = v26;
      v30 = objc_msgSend(v25, sel_description);
      v31 = v25;
      v32 = v26;
      v33 = a4;
      v34 = v30;
      v35 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v37 = v36;

      a4 = v33;
      v26 = v32;
      v25 = v31;
      v38 = v35;
      a3 = v57;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v38, v37, &aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      v10 = v54;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_230887000, v9, v27, "handle stop sharing ETA to recipient: %s", buf, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348BB678](v52, -1, -1);
      v8 = v59;
      MEMORY[0x2348BB678](buf, -1, -1);
    }
    else
    {

    }
    v47 = (_QWORD *)swift_allocObject();
    v47[2] = v8;
    v47[3] = a3;
    v47[4] = a4;
    v47[5] = a5;
    v64 = (void (*)(uint64_t))partial apply for closure #1 in closure #1 in INStopShareETAIntentHandler.handleStopShareETA(intent:completion:);
    v65 = v47;
    aBlock = MEMORY[0x24BDAC760];
    v61 = 1107296256;
    v62 = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
    v63 = &block_descriptor_63;
    v48 = _Block_copy(&aBlock);
    v49 = v8;
    swift_retain();
    v50 = a5;
    swift_release();
    objc_msgSend(v10, sel_stopSharingWithContact_completion_, v25, v48);
    _Block_release(v48);

  }
  else
  {
    v39 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      v41 = v9;
      v42 = v40;
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_230887000, v41, v39, "handle stop sharing ETA to all recipients", v40, 2u);
      MEMORY[0x2348BB678](v42, -1, -1);
    }
    v43 = (_QWORD *)swift_allocObject();
    v43[2] = v8;
    v43[3] = a3;
    v43[4] = a4;
    v43[5] = a5;
    v64 = partial apply for closure #2 in closure #1 in INStopShareETAIntentHandler.handleStopShareETA(intent:completion:);
    v65 = v43;
    aBlock = MEMORY[0x24BDAC760];
    v61 = 1107296256;
    v62 = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
    v63 = &block_descriptor_57;
    v44 = _Block_copy(&aBlock);
    v45 = v8;
    swift_retain();
    v46 = a5;
    swift_release();
    objc_msgSend(v10, sel_stopAllSharingWithCompletion_, v44);
    _Block_release(v44);
  }
}

void closure #1 in closure #1 in INStopShareETAIntentHandler.handleStopShareETA(intent:completion:)(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4, void *a5)
{
  id v8;
  Class isa;
  id v10;
  NSObject *v11;
  id v12;
  os_log_type_t v13;
  uint8_t *v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  os_log_t log;
  NSObject *loga;
  uint64_t v23;

  if (a1)
  {
    log = (os_log_t)_convertErrorToNSError(_:)();
    INStopShareETAIntentHandler.stopShareETAErrorHandling(_:completion:)(log, a3);

  }
  else
  {
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA200]), sel_initWithCode_userActivity_, 3, 0);
    type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for INPerson);
    isa = Array._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v8, sel_setRecipients_, isa);

    v10 = objc_msgSend(a5, sel_recipients);
    objc_msgSend(v8, sel_setRecipients_, v10);

    v11 = *(NSObject **)(a2 + OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_logObject);
    v12 = v8;
    v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v13))
    {
      loga = v11;
      v14 = (uint8_t *)swift_slowAlloc();
      v20 = swift_slowAlloc();
      v23 = v20;
      *(_DWORD *)v14 = 136315138;
      v15 = v12;
      v16 = objc_msgSend(v15, sel_description);
      v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v19 = v18;

      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v19, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_230887000, loga, v13, "INStopShareETAIntentHandler Sending response : %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348BB678](v20, -1, -1);
      MEMORY[0x2348BB678](v14, -1, -1);
    }
    else
    {

    }
    ((void (*)(id))a3)(v12);

  }
}

void INStopShareETAIntentHandler.stopShareETAErrorHandling(_:completion:)(void *a1, void (*a2)(void))
{
  char *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v4 = (char *)objc_msgSend(a1, sel_code);
  static os_log_type_t.error.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2308A3BB0;
  v6 = objc_msgSend(a1, sel_localizedDescription);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = v8;

  *(_QWORD *)(v5 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v5 + 64) = lazy protocol witness table accessor for type String and conformance String();
  *(_QWORD *)(v5 + 32) = v7;
  *(_QWORD *)(v5 + 40) = v9;
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();
  if ((unint64_t)(v4 - 5) > 9)
    v10 = 4;
  else
    v10 = qword_2308A4110[(_QWORD)(v4 - 5)];
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA200]), sel_initWithCode_userActivity_, v10, 0);
  a2();

}

id INStopShareETAIntentHandler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id INStopShareETAIntentHandler.init()()
{
  char *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  objc_super v5;

  v1 = OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_logObject;
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  v2 = v0;
  *(_QWORD *)&v0[v1] = OS_os_log.init(subsystem:category:)();
  v3 = OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_contactService;
  type metadata accessor for ContactService();
  swift_allocObject();
  *(_QWORD *)&v2[v3] = ContactService.init()();
  *(_QWORD *)&v2[OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_sharedTripContact] = 0;

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for INStopShareETAIntentHandler();
  return objc_msgSendSuper2(&v5, sel_init);
}

id INStopShareETAIntentHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for INStopShareETAIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
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

uint64_t partial apply for closure #1 in INStopShareETAIntentHandler.confirm(intent:completion:)(void *a1)
{
  uint64_t v1;

  return closure #1 in INStopShareETAIntentHandler.confirm(intent:completion:)(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24), *(uint64_t (**)(id))(v1 + 32));
}

void partial apply for closure #1 in INStopShareETAIntentHandler.handleStopShareETA(intent:completion:)(void *a1)
{
  uint64_t v1;

  closure #1 in INStopShareETAIntentHandler.handleStopShareETA(intent:completion:)(a1, *(char **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t type metadata accessor for INStopShareETAIntentHandler()
{
  return objc_opt_self();
}

void specialized INStopShareETAIntentHandler.resolveRecipients(for:with:)(void *a1, char *a2, void (**a3)(_QWORD, _QWORD))
{
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  char *v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  Class isa;
  _QWORD aBlock[6];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a3;
  v7 = (void *)objc_opt_self();
  _Block_copy(a3);
  v8 = objc_msgSend(v7, sel_sharedInstance);
  if (v8)
  {
    v9 = v8;
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = a2;
    v10[3] = a1;
    v10[4] = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSArray) -> ();
    v10[5] = v6;
    aBlock[4] = partial apply for closure #1 in INStopShareETAIntentHandler.resolveRecipients(for:with:);
    aBlock[5] = v10;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ();
    aBlock[3] = &block_descriptor_51;
    v11 = _Block_copy(aBlock);
    v12 = a2;
    v13 = a1;
    swift_retain();
    swift_release();
    objc_msgSend(v9, sel_performBlockAfterInitialSync_, v11);
    _Block_release(v11);
    swift_release();

  }
  else
  {
    v14 = *(NSObject **)&a2[OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_logObject];
    v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_230887000, v14, v15, "could not get msp shared instance to check if the there is a match with receivers", v16, 2u);
      MEMORY[0x2348BB678](v16, -1, -1);
    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_2308A3C20;
    *(_QWORD *)(v17 + 32) = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 5);
    aBlock[0] = v17;
    specialized Array._endMutation()();
    type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for INStopShareETARecipientResolutionResult);
    isa = Array._bridgeToObjectiveC()().super.isa;
    ((void (**)(_QWORD, Class))a3)[2](a3, isa);
    swift_release();
    swift_bridgeObjectRelease();

  }
}

void specialized INStopShareETAIntentHandler.confirm(intent:completion:)(char *a1, void (**a2)(_QWORD, _QWORD))
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  id v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  char *v12;
  id v13;
  os_log_type_t v14;
  uint8_t *v15;
  id v16;
  _QWORD aBlock[6];

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a2;
  v5 = *(NSObject **)&a1[OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_logObject];
  _Block_copy(a2);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_230887000, v5, v6, "stop sharing ETA - confirm", v7, 2u);
    MEMORY[0x2348BB678](v7, -1, -1);
  }
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA200]), sel_initWithCode_userActivity_, 1, 0);
  v8 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (v8)
  {
    v9 = v8;
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = a1;
    v10[3] = v16;
    v10[4] = thunk for @escaping @callee_unowned @convention(block) (@unowned INShareETAIntentResponse) -> ()partial apply;
    v10[5] = v4;
    aBlock[4] = closure #1 in INStopShareETAIntentHandler.confirm(intent:completion:)partial apply;
    aBlock[5] = v10;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ();
    aBlock[3] = &block_descriptor_41;
    v11 = _Block_copy(aBlock);
    v12 = a1;
    v13 = v16;
    swift_retain();
    swift_release();
    objc_msgSend(v9, sel_performBlockAfterInitialSync_, v11);
    _Block_release(v11);
    swift_release();

  }
  else
  {
    v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_230887000, v5, v14, "failed to retrieve shared instance", v15, 2u);
      MEMORY[0x2348BB678](v15, -1, -1);
    }
    ((void (**)(_QWORD, id))a2)[2](a2, v16);
    swift_release();

  }
}

uint64_t specialized INStopShareETAIntentHandler.convertSharedTripToRecipients(_:)(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;

  v15 = MEMORY[0x24BEE4AF8];
  if (!(a1 >> 62))
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_16:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  result = _CocoaArrayWrapper.endIndex.getter();
  v2 = result;
  if (!result)
    goto LABEL_16;
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    v4 = 0;
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x2348BB150](v4, a1);
      else
        v5 = *(id *)(a1 + 8 * v4 + 32);
      v6 = v5;
      v7 = objc_msgSend(v5, sel_displayName);
      v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v10 = v9;

      if (objc_msgSend(v6, sel_isPhoneNumber))
        v11 = 2;
      else
        v11 = 1;
      v12 = objc_allocWithZone(MEMORY[0x24BDD9F38]);
      v13 = (void *)MEMORY[0x2348BAFAC](v8, v10);
      swift_bridgeObjectRelease();
      v14 = objc_msgSend(v12, sel_initWithValue_type_, v13, v11);

      objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9F30]), sel_initWithPersonHandle_nameComponents_displayName_image_contactIdentifier_customIdentifier_, v14, 0, 0, 0, 0, 0);
      MEMORY[0x2348BB018]();
      if (*(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      ++v4;
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();

    }
    while (v2 != v4);
    swift_bridgeObjectRelease();
    return v15;
  }
  return result;
}

uint64_t specialized INStopShareETAIntentHandler.handle(intent:completion:)(void *a1, void *a2, void (**a3)(_QWORD, _QWORD))
{
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  id v9;
  char *v10;
  id v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  char *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[6];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a3;
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a2;
  v7[3] = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned INDeleteParkingLocationIntentResponse) -> ();
  v7[4] = v6;
  v8 = (void *)objc_opt_self();
  v9 = a2;
  swift_retain_n();
  v10 = (char *)v9;
  _Block_copy(a3);
  v11 = objc_msgSend(v8, sel_sharedInstance);
  if (v11)
  {
    v12 = v11;
    v13 = (_QWORD *)swift_allocObject();
    v13[2] = v10;
    v13[3] = partial apply for closure #1 in INStopShareETAIntentHandler.handle(intent:completion:);
    v13[4] = v7;
    v13[5] = a1;
    v20[4] = closure #1 in INStopShareETAIntentHandler.handleStopShareETA(intent:completion:)partial apply;
    v20[5] = v13;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 1107296256;
    v20[2] = thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ();
    v20[3] = &block_descriptor_30;
    v14 = _Block_copy(v20);
    v15 = v10;
    swift_retain();
    v16 = a1;
    swift_release();
    objc_msgSend(v12, sel_performBlockAfterInitialSync_, v14);
    _Block_release(v14);

    swift_release();
  }
  else
  {
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA200]), sel_initWithCode_userActivity_, 4, 0);
    v18 = *(void **)&v10[OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_sharedTripContact];
    *(_QWORD *)&v10[OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_sharedTripContact] = 0;

    ((void (**)(_QWORD, id))a3)[2](a3, v17);
    swift_release();

  }
  return swift_release_n();
}

uint64_t sub_23089C4A0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in INStopShareETAIntentHandler.handle(intent:completion:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  void *v5;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(uint64_t (**)(uint64_t))(v1 + 24);
  v5 = *(void **)(v3 + OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_sharedTripContact);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_sharedTripContact) = 0;

  return v4(a1);
}

void partial apply for closure #1 in INStopShareETAIntentHandler.resolveRecipients(for:with:)(void *a1)
{
  uint64_t v1;

  INStopShareETAIntentHandler.resolveRecipientsInsideBlock(for:sharedTrip:with:)(*(void **)(v1 + 24), a1, *(void (**)(uint64_t))(v1 + 32));
}

void partial apply for closure #2 in closure #1 in INStopShareETAIntentHandler.handleStopShareETA(intent:completion:)(uint64_t a1)
{
  uint64_t v1;

  closure #1 in closure #1 in INStopShareETAIntentHandler.handleStopShareETA(intent:completion:)(a1, *(_QWORD *)(v1 + 16), *(void (**)(void))(v1 + 24), *(_QWORD *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t objectdestroy_11Tm()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

id INRetrieveParkingLocationIntentHandler.logObject.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC7SiriGeo38INRetrieveParkingLocationIntentHandler_logObject);
}

void INRetrieveParkingLocationIntentHandler.handle(intent:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  specialized INRetrieveParkingLocationIntentHandler.handle(intent:completion:)(a2, a3);
}

void closure #1 in INRetrieveParkingLocationIntentHandler.handle(intent:completion:)(unint64_t a1, void *a2, char *a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  os_log_type_t v15;
  NSObject *v16;
  os_log_type_t v17;
  id v18;
  id v19;
  uint8_t *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  NSObject *v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  double v32;
  double v33;
  double v34;
  id v35;
  os_log_type_t v36;
  int v37;
  _BOOL4 v38;
  void (*v39)(void);
  uint8_t *v40;
  uint8_t *v41;
  id v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  uint8_t *v46;
  uint64_t v47;
  id v48;
  os_log_type_t v49;
  uint8_t *v50;
  id v51;
  id v52;
  _QWORD *v53;
  void *v54;
  void *v55;
  id v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint8_t *v65;
  uint8_t *v66;
  uint8_t *v67;
  uint64_t v68;
  int v69;
  id v70;
  id v71;
  uint64_t v72;
  uint64_t aBlock[6];

  v10 = type metadata accessor for OSSignpostID();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v14 = a2;
    v15 = static os_log_type_t.error.getter();
    v16 = *(NSObject **)&a3[OBJC_IVAR____TtC7SiriGeo38INRetrieveParkingLocationIntentHandler_logObject];
    v17 = v15;
    if (os_log_type_enabled(v16, v15))
    {
      v18 = a2;
      v19 = a2;
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v72 = (uint64_t)a2;
      aBlock[0] = v21;
      *(_DWORD *)v20 = 136315138;
      v22 = a2;
      __swift_instantiateConcreteTypeFromMangledName(demangling cache variable for type metadata for Error);
      v23 = String.init<A>(describing:)();
      v72 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v23, v24, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_230887000, v16, v17, "error fetching vehicle events: %s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348BB678](v21, -1, -1);
      MEMORY[0x2348BB678](v20, -1, -1);
    }
    v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA008]), sel_initWithCode_userActivity_, 4, 0);
    a4();

    return;
  }
  static os_signpost_type_t.end.getter();
  v26 = *(NSObject **)&a3[OBJC_IVAR____TtC7SiriGeo38INRetrieveParkingLocationIntentHandler_logObject];
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:_:_:)();
  v27 = *(void (**)(char *, uint64_t))(v11 + 8);
  v27(v13, v10);
  if (!a1)
  {
    v48 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA008]), sel_initWithCode_userActivity_, 4, 0);
    v49 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v26, v49))
    {
      v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v50 = 0;
      _os_log_impl(&dword_230887000, v26, v49, "uh oh, no cars", v50, 2u);
      MEMORY[0x2348BB678](v50, -1, -1);
    }
    objc_msgSend(v48, sel_setParkingLocation_, 0);
    v51 = v48;
    goto LABEL_21;
  }
  if (!(a1 >> 62))
  {
    v28 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v28)
      goto LABEL_8;
LABEL_20:
    static os_log_type_t.info.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    v58 = swift_allocObject();
    *(_OWORD *)(v58 + 16) = xmmword_2308A3BB0;
    v59 = type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for RTVehicleEvent);
    v60 = MEMORY[0x2348BB060](a1, v59);
    v62 = v61;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v58 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v58 + 64) = lazy protocol witness table accessor for type String and conformance String();
    *(_QWORD *)(v58 + 32) = v60;
    *(_QWORD *)(v58 + 40) = v62;
    os_log(_:dso:log:_:_:)();
    swift_bridgeObjectRelease();
    v51 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA008]), sel_initWithCode_userActivity_, 4, 0);
    v48 = v51;
LABEL_21:
    ((void (*)(id))a4)(v51);

    return;
  }
  swift_bridgeObjectRetain();
  if (!_CocoaArrayWrapper.endIndex.getter())
    goto LABEL_20;
LABEL_8:
  if ((a1 & 0xC000000000000001) != 0)
  {
    v29 = (id)MEMORY[0x2348BB150](0, a1);
  }
  else
  {
    if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    v29 = *(id *)(a1 + 32);
  }
  v30 = v29;
  v31 = objc_msgSend(v29, sel_location);

  if (!v31)
    goto LABEL_20;
  objc_msgSend(v31, sel_latitude);
  v33 = v32;
  v71 = v31;
  objc_msgSend(v31, sel_longitude);
  v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFA80]), sel_initWithLatitude_longitude_, v33, v34);
  v36 = static os_log_type_t.default.getter();
  v37 = v36;
  v38 = os_log_type_enabled(v26, v36);
  v70 = v35;
  if (v38)
  {
    v69 = v37;
    v39 = a4;
    v40 = (uint8_t *)swift_slowAlloc();
    v68 = swift_slowAlloc();
    aBlock[0] = v68;
    v41 = v40;
    *(_DWORD *)v40 = 136315138;
    v66 = v40 + 12;
    v67 = v40;
    a4 = v39;
    v65 = v41 + 4;
    v42 = v35;
    v43 = objc_msgSend(v42, sel_description);
    v44 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v63 = v45;
    v64 = v44;

    v72 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v64, v63, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    v46 = v67;
    _os_log_impl(&dword_230887000, v26, (os_log_type_t)v69, "with vehicle location: %s", v67, 0xCu);
    v47 = v68;
    swift_arrayDestroy();
    MEMORY[0x2348BB678](v47, -1, -1);
    MEMORY[0x2348BB678](v46, -1, -1);
  }
  else
  {

  }
  static os_signpost_type_t.begin.getter();
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:_:_:)();
  v27(v13, v10);
  v52 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFA68]), sel_init);
  v53 = (_QWORD *)swift_allocObject();
  v54 = v70;
  v53[2] = a3;
  v53[3] = v54;
  v53[4] = a1;
  v53[5] = a4;
  v53[6] = a5;
  aBlock[4] = (uint64_t)partial apply for closure #1 in closure #1 in INRetrieveParkingLocationIntentHandler.handle(intent:completion:);
  aBlock[5] = (uint64_t)v53;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)thunk for @escaping @callee_guaranteed (@guaranteed [CLPlacemark]?, @guaranteed Error?) -> ();
  aBlock[3] = (uint64_t)&block_descriptor_10;
  v55 = _Block_copy(aBlock);
  v56 = v54;
  v57 = a3;
  swift_retain();
  swift_release();
  objc_msgSend(v52, sel_reverseGeocodeLocation_completionHandler_, v56, v55);
  _Block_release(v55);

}

void closure #1 in closure #1 in INRetrieveParkingLocationIntentHandler.handle(intent:completion:)(unint64_t a1, uint64_t a2, uint64_t a3, void *a4, unint64_t a5, void (*a6)(id), uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  uint64_t v16;
  id i;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(id);

  v28 = a7;
  v29 = a6;
  v10 = type metadata accessor for OSSignpostID();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_allocWithZone(MEMORY[0x24BDDA008]);
  v15 = objc_msgSend(v14, sel_initWithCode_userActivity_, 3, 0, v28);
  if (!a1)
    goto LABEL_10;
  if (!(a1 >> 62))
  {
    v16 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v16)
      goto LABEL_4;
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  if (!_CocoaArrayWrapper.endIndex.getter())
  {
LABEL_9:
    swift_bridgeObjectRelease();
LABEL_10:
    a1 = static os_log_type_t.info.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_2308A3BB0;
    *(_QWORD *)(v19 + 56) = type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for CLLocation);
    *(_QWORD *)(v19 + 64) = lazy protocol witness table accessor for type CLLocation and conformance NSObject();
    *(_QWORD *)(v19 + 32) = a4;
    v20 = a4;
    os_log(_:dso:log:_:_:)();
    swift_bridgeObjectRelease();
    v18 = objc_msgSend((id)objc_opt_self(), sel_placemarkWithLocation_name_postalAddress_, v20, 0, 0);
    goto LABEL_11;
  }
LABEL_4:
  if ((a1 & 0xC000000000000001) != 0)
    goto LABEL_25;
  if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    for (i = *(id *)(a1 + 32); ; i = (id)MEMORY[0x2348BB150](0, a1))
    {
      v18 = i;
      swift_bridgeObjectRelease();
LABEL_11:
      objc_msgSend(v15, sel_setParkingLocation_, v18);

      if (a5 >> 62)
      {
        swift_bridgeObjectRetain();
        v21 = (void *)_CocoaArrayWrapper.endIndex.getter();
        if (!v21)
          goto LABEL_18;
      }
      else
      {
        v21 = *(void **)((a5 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v21)
          goto LABEL_18;
      }
      if ((a5 & 0xC000000000000001) != 0)
        break;
      if (*(_QWORD *)((a5 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        v22 = *(id *)(a5 + 32);
        goto LABEL_16;
      }
      __break(1u);
LABEL_25:
      ;
    }
    v22 = (id)MEMORY[0x2348BB150](0, a5);
LABEL_16:
    v23 = v22;
    swift_bridgeObjectRelease();
    v24 = objc_msgSend(v23, sel_notes);

    if (v24)
    {
      v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v27 = v26;

      v21 = (void *)MEMORY[0x2348BAFAC](v25, v27);
LABEL_18:
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    v21 = 0;
LABEL_20:
    objc_msgSend(v15, sel_setParkingNote_, v21);

    static os_signpost_type_t.end.getter();
    static OSSignpostID.exclusive.getter();
    os_signpost(_:dso:log:name:signpostID:_:_:)();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    v29(v15);

  }
  else
  {
    __break(1u);
  }
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed [CLPlacemark]?, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  id v6;

  v4 = a2;
  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for CLPlacemark);
    v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

id INRetrieveParkingLocationIntentHandler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id INRetrieveParkingLocationIntentHandler.init()()
{
  char *v0;
  uint64_t v1;
  char *v2;
  objc_super v4;

  v1 = OBJC_IVAR____TtC7SiriGeo38INRetrieveParkingLocationIntentHandler_logObject;
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  v2 = v0;
  *(_QWORD *)&v0[v1] = OS_os_log.init(subsystem:category:)();

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for INRetrieveParkingLocationIntentHandler();
  return objc_msgSendSuper2(&v4, sel_init);
}

id INRetrieveParkingLocationIntentHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for INRetrieveParkingLocationIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void specialized INRetrieveParkingLocationIntentHandler.handle(intent:completion:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  id v12;
  _QWORD aBlock[6];

  v5 = type metadata accessor for OSSignpostID();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static os_signpost_type_t.begin.getter();
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:_:_:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (one-time initialization token for routineManager != -1)
    swift_once();
  v9 = (void *)static ParkingLocationService.routineManager;
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = v2;
  v10[3] = a1;
  v10[4] = a2;
  aBlock[4] = partial apply for closure #1 in INRetrieveParkingLocationIntentHandler.handle(intent:completion:);
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed [RTVehicleEvent]?, @guaranteed Error?) -> ();
  aBlock[3] = &block_descriptor_2;
  v11 = _Block_copy(aBlock);
  v12 = v2;
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_fetchLastVehicleEventsWithHandler_, v11);
  _Block_release(v11);
}

uint64_t type metadata accessor for INRetrieveParkingLocationIntentHandler()
{
  return objc_opt_self();
}

uint64_t sub_23089D5D4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_23089D5F8()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void partial apply for closure #1 in INRetrieveParkingLocationIntentHandler.handle(intent:completion:)(unint64_t a1, void *a2)
{
  uint64_t v2;

  closure #1 in INRetrieveParkingLocationIntentHandler.handle(intent:completion:)(a1, a2, *(char **)(v2 + 16), *(void (**)(void))(v2 + 24), *(_QWORD *)(v2 + 32));
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

uint64_t sub_23089D648()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void partial apply for closure #1 in closure #1 in INRetrieveParkingLocationIntentHandler.handle(intent:completion:)(unint64_t a1, uint64_t a2)
{
  uint64_t v2;

  closure #1 in closure #1 in INRetrieveParkingLocationIntentHandler.handle(intent:completion:)(a1, a2, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24), *(_QWORD *)(v2 + 32), *(void (**)(id))(v2 + 40), *(_QWORD *)(v2 + 48));
}

unint64_t lazy protocol witness table accessor for type CLLocation and conformance NSObject()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type CLLocation and conformance NSObject;
  if (!lazy protocol witness table cache variable for type CLLocation and conformance NSObject)
  {
    v1 = type metadata accessor for OS_os_log(255, &lazy cache variable for type metadata for CLLocation);
    result = MEMORY[0x2348BB60C](MEMORY[0x24BEE5BE8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLLocation and conformance NSObject);
  }
  return result;
}

unint64_t Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int v7;
  uint64_t v9;

  v1 = v0;
  v2 = 0xD000000000000010;
  v3 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v1, v3);
  v7 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v6, v3);
  if (v7 == *MEMORY[0x24BE6FBB8])
  {
    v2 = 0xD000000000000016;
  }
  else if (v7 == *MEMORY[0x24BE6FBA0])
  {
    v2 = 0x5070614D776F6853;
  }
  else if (v7 != *MEMORY[0x24BE6FBA8] && v7 != *MEMORY[0x24BE6FBB0])
  {
    v2 = 0x6568744F656D6F73;
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v2;
}

uint64_t Apple_Parsec_Siri_V2alpha_PerResultLayoutDetails.OneOf_Snippet.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  uint64_t v7;
  uint64_t v9;

  v1 = v0;
  v2 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PerResultLayoutDetails.OneOf_Snippet();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x24BE71000])
  {
    v7 = 0x6E536F6E69736163;
  }
  else if (v6 == *MEMORY[0x24BE70FF8])
  {
    v7 = 0x696E736863746177;
  }
  else if (v6 == *MEMORY[0x24BE71010])
  {
    v7 = 0x736D65746970616DLL;
  }
  else if (v6 == *MEMORY[0x24BE71008])
  {
    v7 = 0x6E5379636167656CLL;
  }
  else
  {
    v7 = 0x206E776F6E6B6E75;
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v7;
}

uint64_t one-time initialization function for logger()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, logger);
  __swift_project_value_buffer(v0, (uint64_t)logger);
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  OS_os_log.init(subsystem:category:)();
  return Logger.init(_:)();
}

uint64_t logger.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for logger != -1)
    swift_once();
  v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)logger);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

BOOL static SiriGeoCommandConverter.isCommandTypeSupported(commandType:)(uint64_t a1)
{
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  NSObject *v19;
  _BOOL4 v20;
  uint8_t *v21;
  char *v22;
  char *v23;
  int v24;
  int v25;
  unint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  BOOL v29;
  unint64_t v30;
  uint8_t *v31;
  os_log_t v32;
  uint64_t v33;
  int v34;
  _BOOL8 v38;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint8_t *v43;
  os_log_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  int v48;
  char *v49;
  char *v50;
  void (*v51)(char *, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;

  v2 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v50 = (char *)&v40 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v49 = (char *)&v40 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v40 - v11;
  v13 = type metadata accessor for Logger();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for logger != -1)
    swift_once();
  v17 = __swift_project_value_buffer(v13, (uint64_t)logger);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v17, v13);
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v18(v12, a1, v2);
  v19 = Logger.logObject.getter();
  v48 = static os_log_type_t.debug.getter();
  v20 = os_log_type_enabled(v19, (os_log_type_t)v48);
  v51 = v18;
  if (v20)
  {
    v44 = v19;
    v45 = v14;
    v21 = (uint8_t *)swift_slowAlloc();
    v42 = swift_slowAlloc();
    v53 = v42;
    v43 = v21;
    *(_DWORD *)v21 = 136315138;
    v22 = v49;
    v18(v49, (uint64_t)v12, v2);
    v23 = v50;
    v18(v50, (uint64_t)v22, v2);
    v24 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v23, v2);
    v25 = *MEMORY[0x24BE6FBB8];
    v46 = a1;
    v47 = v6;
    if (v24 == v25)
    {
      v41 = 0xD000000000000016;
      v26 = 0x80000002308A51B0;
    }
    else if (v24 == *MEMORY[0x24BE6FBA0])
    {
      v26 = 0xED000073746E696FLL;
      v41 = 0x5070614D776F6853;
    }
    else if (v24 == *MEMORY[0x24BE6FBA8])
    {
      v26 = 0x80000002308A51F0;
      v41 = 0xD000000000000010;
    }
    else
    {
      v29 = v24 == *MEMORY[0x24BE6FBB0];
      v30 = 0xD000000000000010;
      if (v24 != *MEMORY[0x24BE6FBB0])
        v30 = 0x6568744F656D6F73;
      v41 = v30;
      if (v29)
        v26 = 0x80000002308A51D0;
      else
        v26 = 0xE900000000000072;
    }
    v31 = v43;
    v27 = v3;
    v28 = *(void (**)(char *, uint64_t))(v3 + 8);
    v28(v50, v2);
    v28(v49, v2);
    v52 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v41, v26, &v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v28(v12, v2);
    v32 = v44;
    _os_log_impl(&dword_230887000, v44, (os_log_type_t)v48, "commandtype %s", v31, 0xCu);
    v33 = v42;
    swift_arrayDestroy();
    MEMORY[0x2348BB678](v33, -1, -1);
    MEMORY[0x2348BB678](v31, -1, -1);

    (*(void (**)(char *, uint64_t))(v45 + 8))(v16, v13);
    a1 = v46;
    v6 = v47;
  }
  else
  {
    v27 = v3;
    v28 = *(void (**)(char *, uint64_t))(v3 + 8);
    v28(v12, v2);

    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    v25 = *MEMORY[0x24BE6FBB8];
  }
  v51(v6, a1, v2);
  v34 = (*(uint64_t (**)(char *, uint64_t))(v27 + 88))(v6, v2);
  v38 = v34 == v25 || v34 == *MEMORY[0x24BE6FBA0] || v34 == *MEMORY[0x24BE6FBA8] || v34 == *MEMORY[0x24BE6FBB0];
  v28(v6, v2);
  return v38;
}

BOOL static SiriGeoCommandConverter.isSnippetTypeSupported(snippetType:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  NSObject *v19;
  _BOOL4 v20;
  uint8_t *v21;
  char *v22;
  int v23;
  int v24;
  uint64_t v25;
  _DWORD *v26;
  unint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  BOOL v30;
  uint64_t v31;
  os_log_t v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v36;
  uint64_t v37;
  os_log_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  int v42;
  char *v43;
  void (*v44)(char *, uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v45 = a1;
  v1 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PerResultLayoutDetails.OneOf_Snippet();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v3);
  v43 = (char *)&v36 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v36 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v36 - v11;
  v13 = type metadata accessor for Logger();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for logger != -1)
    swift_once();
  v17 = __swift_project_value_buffer(v13, (uint64_t)logger);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v17, v13);
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  v18(v12, v45, v1);
  v19 = Logger.logObject.getter();
  v42 = static os_log_type_t.debug.getter();
  v20 = os_log_type_enabled(v19, (os_log_type_t)v42);
  v44 = v18;
  if (v20)
  {
    v38 = v19;
    v39 = v13;
    v41 = v5;
    v21 = (uint8_t *)swift_slowAlloc();
    v37 = swift_slowAlloc();
    v47 = v37;
    *(_DWORD *)v21 = 136315138;
    v18(v10, (uint64_t)v12, v1);
    v22 = v43;
    v18(v43, (uint64_t)v10, v1);
    v23 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v22, v1);
    v24 = *MEMORY[0x24BE71000];
    v25 = v2;
    v40 = v14;
    if (v23 == v24)
    {
      v36 = 0x6E536F6E69736163;
      v26 = (_DWORD *)MEMORY[0x24BE71010];
      v27 = 0xED00007465707069;
    }
    else
    {
      v26 = (_DWORD *)MEMORY[0x24BE71010];
      if (v23 == *MEMORY[0x24BE70FF8])
      {
        v27 = 0xEC00000074657070;
        v36 = 0x696E736863746177;
      }
      else if (v23 == *MEMORY[0x24BE71010])
      {
        v27 = 0xEE0074657070696ELL;
        v36 = 0x736D65746970616DLL;
      }
      else
      {
        v30 = v23 == *MEMORY[0x24BE71008];
        v31 = 0x206E776F6E6B6E75;
        if (v23 == *MEMORY[0x24BE71008])
          v31 = 0x6E5379636167656CLL;
        v36 = v31;
        v27 = 0xED00007465707069;
        if (!v30)
          v27 = 0xEC00000065707974;
      }
    }
    v29 = *(void (**)(char *, uint64_t))(v25 + 8);
    v29(v43, v1);
    v29(v10, v1);
    v46 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v36, v27, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v29(v12, v1);
    v32 = v38;
    _os_log_impl(&dword_230887000, v38, (os_log_type_t)v42, "snippettype %s", v21, 0xCu);
    v33 = v37;
    swift_arrayDestroy();
    MEMORY[0x2348BB678](v33, -1, -1);
    MEMORY[0x2348BB678](v21, -1, -1);

    (*(void (**)(char *, uint64_t))(v40 + 8))(v16, v39);
    v5 = v41;
  }
  else
  {
    v28 = v14;
    v29 = *(void (**)(char *, uint64_t))(v2 + 8);
    v29(v12, v1);

    (*(void (**)(char *, uint64_t))(v28 + 8))(v16, v13);
    v25 = v2;
    v26 = (_DWORD *)MEMORY[0x24BE71010];
  }
  v44(v5, v45, v1);
  v34 = (*(unsigned int (**)(char *, uint64_t))(v25 + 88))(v5, v1) == *v26;
  v29(v5, v1);
  return v34;
}

uint64_t static SiriGeoCommandConverter.convertToSiriCommand(command:)()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;

  v50 = type metadata accessor for Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams();
  v0 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v2 = (char *)&v47 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ShowPlaceDetailsBuilderParams();
  v48 = *(_QWORD *)(v3 - 8);
  v49 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v47 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams?);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v47 - v13;
  Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.siriCommandBuilderParams.getter();
  v15 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams();
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
    goto LABEL_2;
  outlined init with copy of Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams?((uint64_t)v14, (uint64_t)v12);
  v18 = (*(uint64_t (**)(char *, uint64_t))(v16 + 88))(v12, v15);
  if (v18 == *MEMORY[0x24BE6FBB8])
  {
    (*(void (**)(char *, uint64_t))(v16 + 96))(v12, v15);
    v19 = v50;
    (*(void (**)(char *, char *, uint64_t))(v0 + 32))(v2, v12, v50);
    v17 = specialized static SiriGeoCommandConverter.convertRecordLocationActivity(_:)();
    (*(void (**)(char *, uint64_t))(v0 + 8))(v2, v19);
  }
  else if (v18 == *MEMORY[0x24BE6FBA0])
  {
    (*(void (**)(char *, uint64_t))(v16 + 96))(v12, v15);
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v12, v5);
    v17 = specialized static SiriGeoCommandConverter.convertShowMapPoints(_:)((uint64_t)v8);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else if (v18 == *MEMORY[0x24BE6FBA8])
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v15);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_2308A3C20;
    *(_QWORD *)(v31 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE818E8]), sel_init);
    v52 = v31;
    specialized Array._endMutation()();
    v17 = v52;
  }
  else
  {
    if (v18 != *MEMORY[0x24BE6FBB0])
    {
      (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v15);
LABEL_2:
      v17 = MEMORY[0x24BEE4AF8];
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v16 + 96))(v12, v15);
    v33 = v47;
    v32 = v48;
    v34 = v49;
    (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v47, v12, v49);
    v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81438]), sel_init);
    objc_msgSend(v35, sel_setItemIndex_, Apple_Parsec_Siri_V2alpha_ShowPlaceDetailsBuilderParams.itemIndex.getter());
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = xmmword_2308A3C20;
    *(_QWORD *)(v36 + 32) = v35;
    v52 = v36;
    specialized Array._endMutation()();
    v17 = v52;
    (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v34);
  }
LABEL_7:
  outlined destroy of Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams?((uint64_t)v14);
  v20 = Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.uniqueID.getter();
  v22 = v21;
  swift_bridgeObjectRelease();
  v23 = HIBYTE(v22) & 0xF;
  if ((v22 & 0x2000000000000000) == 0)
    v23 = v20 & 0xFFFFFFFFFFFFLL;
  if (!v23)
    goto LABEL_25;
  if (v17 >> 62)
  {
    swift_bridgeObjectRetain();
    result = _CocoaArrayWrapper.endIndex.getter();
    v24 = result;
    if (result)
      goto LABEL_12;
  }
  else
  {
    v24 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v24)
    {
LABEL_12:
      if (v24 < 1)
      {
        __break(1u);
        return result;
      }
      v26 = 0;
      do
      {
        if ((v17 & 0xC000000000000001) != 0)
          v27 = (id)MEMORY[0x2348BB150](v26, v17);
        else
          v27 = *(id *)(v17 + 8 * v26 + 32);
        v28 = v27;
        ++v26;
        v29 = Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.uniqueID.getter();
        v30 = (void *)MEMORY[0x2348BAFAC](v29);
        swift_bridgeObjectRelease();
        objc_msgSend(v28, sel_setAceId_, v30);

      }
      while (v24 != v26);
    }
  }
  swift_bridgeObjectRelease();
LABEL_25:
  if (one-time initialization token for logger != -1)
    swift_once();
  v37 = type metadata accessor for Logger();
  __swift_project_value_buffer(v37, (uint64_t)logger);
  swift_bridgeObjectRetain_n();
  v38 = Logger.logObject.getter();
  v39 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v38, v39))
  {
    v40 = (uint8_t *)swift_slowAlloc();
    v41 = swift_slowAlloc();
    v52 = v41;
    *(_DWORD *)v40 = 136315138;
    v42 = type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for SABaseClientBoundCommand);
    v43 = swift_bridgeObjectRetain();
    v44 = MEMORY[0x2348BB03C](v43, v42);
    v46 = v45;
    swift_bridgeObjectRelease();
    v51 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v44, v46, (uint64_t *)&v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_230887000, v38, v39, "Converted Commands %s", v40, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348BB678](v41, -1, -1);
    MEMORY[0x2348BB678](v40, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return v17;
}

id static SiriGeoCommandConverter.convertToSiriSnippet(snippet:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  char *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  Class isa;
  id v33;
  Class v34;
  id v35;
  Class v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  _QWORD *v42;
  id v43;
  _QWORD v45[2];
  id v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  void (*v50)(char *, unint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;

  v2 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MapItemBuilderParams();
  v52 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Apple_Parsec_Siri_V2alpha_LocationBuilderParams();
  v53 = *(_QWORD *)(v5 - 8);
  v54 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PerResultLayoutDetails.OneOf_Snippet();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MapItemSnippet();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  if ((*(unsigned int (**)(char *, uint64_t))(v9 + 88))(v11, v8) == *MEMORY[0x24BE71010])
  {
    (*(void (**)(char *, uint64_t))(v9 + 96))(v11, v8);
    v47 = v13;
    v48 = v12;
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
    v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81418]), sel_init);
    v49 = v15;
    v17 = Apple_Parsec_Siri_V2alpha_MapItemSnippet.objects.getter();
    v18 = *(_QWORD *)(v17 + 16);
    if (v18)
    {
      v46 = v16;
      v55 = (id)MEMORY[0x24BEE4AF8];
      specialized ContiguousArray.reserveCapacity(_:)();
      v19 = (*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80);
      v45[1] = v17;
      v20 = v17 + v19;
      v21 = *(_QWORD *)(v52 + 72);
      v50 = *(void (**)(char *, unint64_t, uint64_t))(v52 + 16);
      v51 = v21;
      v22 = v54;
      do
      {
        v50(v4, v20, v2);
        v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81408]), sel_init);
        v24 = Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.label.getter();
        v25 = (void *)MEMORY[0x2348BAFAC](v24);
        swift_bridgeObjectRelease();
        objc_msgSend(v23, sel_setLabel_, v25);

        v26 = Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.spokenName.getter();
        v27 = (void *)MEMORY[0x2348BAFAC](v26);
        swift_bridgeObjectRelease();
        objc_msgSend(v23, sel_setSpokenName_, v27);

        Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.location.getter();
        v28 = specialized static SiriGeoCommandConverter.makeLocation(_:)();
        (*(void (**)(char *, uint64_t))(v53 + 8))(v7, v22);
        objc_msgSend(v23, sel_setLocation_, v28);

        v29 = Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.placeData.getter();
        v31 = v30;
        isa = Data._bridgeToObjectiveC()().super.isa;
        outlined consume of Data._Representation(v29, v31);
        objc_msgSend(v23, sel_setPlaceData2_, isa);

        (*(void (**)(char *, uint64_t))(v52 + 8))(v4, v2);
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        v22 = v54;
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
        v20 += v51;
        --v18;
      }
      while (v18);
      swift_bridgeObjectRelease();
      v16 = v46;
    }
    else
    {
      swift_bridgeObjectRelease();
      v22 = v54;
    }
    type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for SALocalSearchMapItem);
    v34 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    objc_msgSend(v16, sel_setItems_, v34);

    Apple_Parsec_Siri_V2alpha_MapItemSnippet.searchRegionCenter.getter();
    v35 = specialized static SiriGeoCommandConverter.makeLocation(_:)();
    (*(void (**)(char *, uint64_t))(v53 + 8))(v7, v22);
    objc_msgSend(v16, sel_setSearchRegionCenter_, v35);

    type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for NSNumber);
    v36 = NSNumber.init(BOOLeanLiteral:)(0).super.super.isa;
    objc_msgSend(v16, sel_setUserCurrentLocation_, v36);

    objc_msgSend(v16, sel_setSearchAlongRoute_, 0);
    v37 = v48;
    if (one-time initialization token for logger != -1)
      swift_once();
    v38 = type metadata accessor for Logger();
    __swift_project_value_buffer(v38, (uint64_t)logger);
    v33 = v16;
    v39 = Logger.logObject.getter();
    v40 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      v42 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v41 = 138412290;
      v55 = v33;
      v43 = v33;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *v42 = v33;

      _os_log_impl(&dword_230887000, v39, v40, "Converted Snippet %@", v41, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x2348BB678](v42, -1, -1);
      MEMORY[0x2348BB678](v41, -1, -1);
    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v47 + 8))(v49, v37);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return 0;
  }
  return v33;
}

uint64_t outlined destroy of Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined init with copy of Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void closure #1 in OSLogArguments.append(_:)(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
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

uint64_t specialized static SiriGeoCommandConverter.makeMapItemType(detailType:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v10;

  v2 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.DetailType();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  v7 = v6 == *MEMORY[0x24BE70D68] || v6 == *MEMORY[0x24BE70D80];
  if (v7
    || v6 == *MEMORY[0x24BE70D70]
    || v6 == *MEMORY[0x24BE70D60]
    || v6 == *MEMORY[0x24BE70D50]
    || v6 == *MEMORY[0x24BE70D58]
    || v6 == *MEMORY[0x24BE70D48]
    || v6 == *MEMORY[0x24BE70D78])
  {
    return static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v8;
}

id specialized static SiriGeoCommandConverter.makeLocation(_:)()
{
  id v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  int v18;
  id v19;
  double v20;
  id v21;
  int v22;
  int v23;
  id v24;
  double v25;
  id v26;
  uint64_t v27;
  void *v28;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81450]), sel_init);
  v1 = Apple_Parsec_Siri_V2alpha_LocationBuilderParams.label.getter();
  v2 = (void *)MEMORY[0x2348BAFAC](v1);
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setLabel_, v2);

  v3 = Apple_Parsec_Siri_V2alpha_LocationBuilderParams.street.getter();
  v4 = (void *)MEMORY[0x2348BAFAC](v3);
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setStreet_, v4);

  v5 = Apple_Parsec_Siri_V2alpha_LocationBuilderParams.thoroughfare.getter();
  v6 = (void *)MEMORY[0x2348BAFAC](v5);
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setThoroughfare_, v6);

  v7 = Apple_Parsec_Siri_V2alpha_LocationBuilderParams.subThoroughfare.getter();
  v8 = (void *)MEMORY[0x2348BAFAC](v7);
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setSubThoroughfare_, v8);

  v9 = Apple_Parsec_Siri_V2alpha_LocationBuilderParams.city.getter();
  v10 = (void *)MEMORY[0x2348BAFAC](v9);
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setCity_, v10);

  v11 = Apple_Parsec_Siri_V2alpha_LocationBuilderParams.stateCode.getter();
  v12 = (void *)MEMORY[0x2348BAFAC](v11);
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setStateCode_, v12);

  v13 = Apple_Parsec_Siri_V2alpha_LocationBuilderParams.countryCode.getter();
  v14 = (void *)MEMORY[0x2348BAFAC](v13);
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setCountryCode_, v14);

  v15 = Apple_Parsec_Siri_V2alpha_LocationBuilderParams.postalCode.getter();
  v16 = (void *)MEMORY[0x2348BAFAC](v15);
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setPostalCode_, v16);

  Apple_Parsec_Siri_V2alpha_LocationBuilderParams.latitude.getter();
  v18 = v17;
  v19 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
  LODWORD(v20) = v18;
  v21 = objc_msgSend(v19, sel_initWithFloat_, v20);
  objc_msgSend(v0, sel_setLatitude_, v21);

  Apple_Parsec_Siri_V2alpha_LocationBuilderParams.longitude.getter();
  v23 = v22;
  v24 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
  LODWORD(v25) = v23;
  v26 = objc_msgSend(v24, sel_initWithFloat_, v25);
  objc_msgSend(v0, sel_setLongitude_, v26);

  objc_msgSend(v0, sel_setRegionType_, *MEMORY[0x24BE82418]);
  v27 = Apple_Parsec_Siri_V2alpha_LocationBuilderParams.timezoneID.getter();
  v28 = (void *)MEMORY[0x2348BAFAC](v27);
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setTimezoneId_, v28);

  return v0;
}

uint64_t specialized static SiriGeoCommandConverter.makeDirectionRole(role:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  int v8;
  uint64_t v9;
  int v11;
  uint64_t v12;

  v2 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.Role();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x24BE70DA8] || v6 == *MEMORY[0x24BE70DC0])
    return static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v6;
  if (v6 == *MEMORY[0x24BE70DB8])
    return static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = *MEMORY[0x24BE70DB0];
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (v8 != v11)
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v9;
}

id specialized static SiriGeoCommandConverter.makeActionableMapItem(_:)()
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
  char *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void (*v17)(char *, uint64_t);
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  Class isa;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;

  v0 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.Role();
  v42 = *(_QWORD *)(v0 - 8);
  v43 = v0;
  MEMORY[0x24BDAC7A8](v0);
  v41 = (char *)&v40 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for Apple_Parsec_Siri_V2alpha_LocationBuilderParams();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.DetailType();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE813D8]), sel_init);
  Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.detailType.getter();
  v11 = specialized static SiriGeoCommandConverter.makeMapItemType(detailType:)((uint64_t)v9);
  v13 = v12;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v14 = (void *)MEMORY[0x2348BAFAC](v11, v13);
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setDetailType_, v14);

  v15 = v10;
  Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.location.getter();
  v16 = specialized static SiriGeoCommandConverter.makeLocation(_:)();
  v17 = *(void (**)(char *, uint64_t))(v3 + 8);
  v17(v5, v2);
  objc_msgSend(v15, sel_setLocation_, v16);

  v18 = v15;
  Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.location.getter();
  v19 = Apple_Parsec_Siri_V2alpha_LocationBuilderParams.label.getter();
  v21 = v20;
  v17(v5, v2);
  v22 = (void *)MEMORY[0x2348BAFAC](v19, v21);
  swift_bridgeObjectRelease();
  objc_msgSend(v18, sel_setLabel_, v22);

  v23 = v18;
  Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.location.getter();
  v24 = Apple_Parsec_Siri_V2alpha_LocationBuilderParams.label.getter();
  v26 = v25;
  v17(v5, v2);
  v27 = (void *)MEMORY[0x2348BAFAC](v24, v26);
  swift_bridgeObjectRelease();
  objc_msgSend(v23, sel_setSpokenName_, v27);

  v28 = v23;
  v29 = Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.placeData.getter();
  v31 = v30;
  isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v29, v31);
  objc_msgSend(v28, sel_setPlaceData2_, isa);

  v33 = v28;
  v34 = (uint64_t)v41;
  Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.directionRole.getter();
  v35 = specialized static SiriGeoCommandConverter.makeDirectionRole(role:)(v34);
  v37 = v36;
  (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v34, v43);
  v38 = (void *)MEMORY[0x2348BAFAC](v35, v37);
  swift_bridgeObjectRelease();
  objc_msgSend(v33, sel_setDirectionRole_, v38);

  return v33;
}

uint64_t specialized static SiriGeoCommandConverter.convertShowMapPoints(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  void *v12;
  char v13;
  char v14;
  id v15;
  void (*v16)(char *, uint64_t);
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;

  v2 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MapItemBuilderParams();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81430]), sel_init);
  v11 = Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.language.getter();
  v12 = (void *)MEMORY[0x2348BAFAC](v11);
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setLanguage_, v12);

  objc_msgSend(v10, sel_setShowDirections_, Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.showDirections.getter() & 1);
  objc_msgSend(v10, sel_setShowTraffic_, Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.showTraffic.getter() & 1);
  v13 = Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.hasItemSource.getter();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  if ((v13 & 1) != 0)
  {
    v14 = Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.hasItemDestination.getter();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    if ((v14 & 1) != 0)
    {
      Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.itemSource.getter();
      v15 = specialized static SiriGeoCommandConverter.makeActionableMapItem(_:)();
      v16 = *(void (**)(char *, uint64_t))(v3 + 8);
      v16(v5, v2);
      objc_msgSend(v10, sel_setItemSource_, v15);

      Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.itemDestination.getter();
      v17 = specialized static SiriGeoCommandConverter.makeActionableMapItem(_:)();
      v16(v5, v2);
      objc_msgSend(v10, sel_setItemDestination_, v17);

      v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE813F0]), sel_init);
      objc_msgSend(v18, sel_setAvoidTolls_, 0);
      objc_msgSend(v18, sel_setAvoidHighways_, 0);
      objc_msgSend(v10, sel_setCarRouteOptions_, v18);

    }
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_2308A3C20;
  *(_QWORD *)(v19 + 32) = v10;
  v22 = v19;
  specialized Array._endMutation()();
  return v22;
}

uint64_t specialized static SiriGeoCommandConverter.convertRecordLocationActivity(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t);
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v0 = type metadata accessor for Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.SourceType();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v20 - v5;
  v7 = type metadata accessor for Apple_Parsec_Siri_V2alpha_LocationBuilderParams();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81518]), sel_init);
  Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.location.getter();
  v12 = specialized static SiriGeoCommandConverter.makeLocation(_:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  objc_msgSend(v11, sel_setLocation_, v12);

  Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.sourceType.getter();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x24BE712B0], v0);
  lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.SourceType and conformance Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.SourceType();
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of RawRepresentable.rawValue.getter();
  v14 = v20;
  v13 = v21;
  v15 = *(void (**)(char *, uint64_t))(v1 + 8);
  v15(v4, v0);
  v15(v6, v0);
  if (v13 == v14)
    v16 = 0x746C7561666544;
  else
    v16 = 0x646F50656D6F48;
  v17 = (void *)MEMORY[0x2348BAFAC](v16, 0xE700000000000000);
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_setSourceType_, v17);

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_2308A3C20;
  *(_QWORD *)(v18 + 32) = v11;
  v21 = v18;
  specialized Array._endMutation()();
  return v21;
}

ValueMetadata *type metadata accessor for SiriGeoCommandConverter()
{
  return &type metadata for SiriGeoCommandConverter;
}

unint64_t lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.SourceType and conformance Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.SourceType()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.SourceType and conformance Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.SourceType;
  if (!lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.SourceType and conformance Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.SourceType)
  {
    v1 = type metadata accessor for Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.SourceType();
    result = MEMORY[0x2348BB60C](MEMORY[0x24BE712C0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.SourceType and conformance Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.SourceType);
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

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed [RTVehicleEvent]?, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  id v6;

  v4 = a2;
  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for RTVehicleEvent);
    v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

id INSaveParkingLocationIntentHandler.logObject.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC7SiriGeo34INSaveParkingLocationIntentHandler_logObject);
}

uint64_t key path getter for INSaveParkingLocationIntentHandler.completion : INSaveParkingLocationIntentHandler@<X0>(_QWORD **a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD *);

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x60))();
  if (result)
  {
    v5 = result;
    v6 = v4;
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v5;
    *(_QWORD *)(result + 24) = v6;
    v7 = partial apply for thunk for @escaping @callee_guaranteed (@guaranteed [EnhancedMSPSharedTripContact]) -> ();
  }
  else
  {
    v7 = 0;
  }
  *a2 = v7;
  a2[1] = result;
  return result;
}

uint64_t key path setter for INSaveParkingLocationIntentHandler.completion : INSaveParkingLocationIntentHandler(uint64_t *a1, _QWORD **a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t (*v7)(uint64_t (*)(uint64_t), uint64_t);

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed [EnhancedMSPSharedTripContact]) -> (@out ());
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *(uint64_t (**)(uint64_t (*)(uint64_t), uint64_t))((*MEMORY[0x24BEE4EA0] & **a2) + 0x68);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed [EnhancedMSPSharedTripContact]) -> ())?(v3);
  return v7(v6, v5);
}

uint64_t INSaveParkingLocationIntentHandler.completion.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC7SiriGeo34INSaveParkingLocationIntentHandler_completion);
  swift_beginAccess();
  v2 = *v1;
  outlined copy of (@escaping @callee_guaranteed (@guaranteed [EnhancedMSPSharedTripContact]) -> ())?(*v1);
  return v2;
}

uint64_t INSaveParkingLocationIntentHandler.completion.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;

  v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC7SiriGeo34INSaveParkingLocationIntentHandler_completion);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  return outlined consume of (@escaping @callee_guaranteed (@guaranteed [EnhancedMSPSharedTripContact]) -> ())?(v6);
}

uint64_t (*INSaveParkingLocationIntentHandler.completion.modify())()
{
  swift_beginAccess();
  return MapsService.CapabilityFetcherObserver.completion.modify;
}

uint64_t INSaveParkingLocationIntentHandler.resolveParkingLocation(for:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 296) = a1;
  *(_QWORD *)(v2 + 304) = v1;
  return swift_task_switch();
}

uint64_t INSaveParkingLocationIntentHandler.resolveParkingLocation(for:)()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  os_log_type_t v8;
  _BOOL4 v9;
  void *v10;
  uint8_t *v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  double v20;
  id v22;
  uint64_t v23;
  uint64_t v24;

  v1 = *(NSObject **)(*(_QWORD *)(v0 + 304) + OBJC_IVAR____TtC7SiriGeo34INSaveParkingLocationIntentHandler_logObject);
  *(_QWORD *)(v0 + 312) = v1;
  v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_230887000, v1, v2, "IntentHandler resolve parking location", v3, 2u);
    MEMORY[0x2348BB678](v3, -1, -1);
  }
  v4 = objc_msgSend(*(id *)(v0 + 296), sel_parkingLocation);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, sel_location);

    if (v6)
    {
      v7 = *(id *)(v0 + 296);
      v8 = static os_log_type_t.default.getter();
      v9 = os_log_type_enabled(v1, v8);
      v10 = *(void **)(v0 + 296);
      if (v9)
      {
        v11 = (uint8_t *)swift_slowAlloc();
        v23 = swift_slowAlloc();
        v24 = v23;
        *(_DWORD *)v11 = 136315138;
        v12 = v10;
        v13 = objc_msgSend(v12, sel_description);
        v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v16 = v15;

        *(_QWORD *)(v0 + 208) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v16, &v24);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_230887000, v1, v8, "Intent with parking location from server: %s", v11, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348BB678](v23, -1, -1);
        MEMORY[0x2348BB678](v11, -1, -1);
      }
      else
      {

      }
      v22 = objc_msgSend((id)objc_opt_self(), sel_successWithResolvedPlacemark_, v5);

      return (*(uint64_t (**)(id))(v0 + 8))(v22);
    }

  }
  v17 = v0 + 272;
  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE09208]), sel_init);
  *(_QWORD *)(v0 + 320) = v18;
  if ((objc_msgSend((id)objc_opt_self(), sel_isSiriLocationServicesPromptingEnabled) & 1) != 0)
  {
    v19 = *(void **)(v0 + 320);
    v20 = *MEMORY[0x24BDBFB40];
    *(_QWORD *)(v0 + 184) = v17;
    *(_QWORD *)(v0 + 144) = v0;
    *(_QWORD *)(v0 + 152) = INSaveParkingLocationIntentHandler.resolveParkingLocation(for:);
    *(_QWORD *)(v0 + 240) = swift_continuation_init();
    *(_QWORD *)(v0 + 208) = MEMORY[0x24BDAC760];
    *(_QWORD *)(v0 + 216) = 0x40000000;
    *(_QWORD *)(v0 + 224) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned CLLocation?, @unowned NSError?) -> () with result type CLLocation;
    *(_QWORD *)(v0 + 232) = &block_descriptor_1;
    objc_msgSend(v19, sel_currentLocationWithAccuracy_timeout_completion_, v0 + 208, v20, 5.0);
  }
  else
  {
    *(_QWORD *)(v0 + 120) = v17;
    *(_QWORD *)(v0 + 80) = v0;
    *(_QWORD *)(v0 + 88) = INSaveParkingLocationIntentHandler.resolveParkingLocation(for:);
    *(_QWORD *)(v0 + 240) = swift_continuation_init();
    *(_QWORD *)(v0 + 208) = MEMORY[0x24BDAC760];
    *(_QWORD *)(v0 + 216) = 0x40000000;
    *(_QWORD *)(v0 + 224) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned AFLocationAuthorizationStyle, @unowned CLAccuracyAuthorization, @unowned NSError?) -> () with result type (AFLocationAuthorizationStyle, CLAccuracyAuthorization);
    *(_QWORD *)(v0 + 232) = &block_descriptor_3;
    objc_msgSend(v18, sel_currentAuthorizationStyle_, v0 + 208);
  }
  return swift_continuation_await();
}

{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 328) = *(_QWORD *)(*(_QWORD *)v0 + 112);
  return swift_task_switch();
}

{
  uint64_t v0;
  void *v1;
  id v2;
  void *v4;
  double v5;
  uint64_t v6;
  _QWORD *v7;

  if ((unint64_t)(*(_QWORD *)(v0 + 272) - 3) >= 2)
  {
    v1 = *(void **)(v0 + 320);
    goto LABEL_5;
  }
  if (*(_QWORD *)(v0 + 280))
  {
    v1 = *(void **)(v0 + 320);
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
LABEL_5:
    v2 = objc_msgSend((id)objc_opt_self(), sel_resolutionResultUnsupportedWithReason_, 1);

    return (*(uint64_t (**)(id))(v0 + 8))(v2);
  }
  v4 = *(void **)(v0 + 320);
  v5 = *MEMORY[0x24BDBFB40];
  *(_QWORD *)(v0 + 184) = v0 + 272;
  *(_QWORD *)(v0 + 144) = v0;
  *(_QWORD *)(v0 + 152) = INSaveParkingLocationIntentHandler.resolveParkingLocation(for:);
  v6 = swift_continuation_init();
  *(_QWORD *)(v0 + 208) = MEMORY[0x24BDAC760];
  v7 = (_QWORD *)(v0 + 208);
  v7[1] = 0x40000000;
  v7[2] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned CLLocation?, @unowned NSError?) -> () with result type CLLocation;
  v7[3] = &block_descriptor_1;
  v7[4] = v6;
  objc_msgSend(v4, sel_currentLocationWithAccuracy_timeout_completion_, v7, v5, 5.0);
  return swift_continuation_await();
}

{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 336) = *(_QWORD *)(*(_QWORD *)v0 + 176);
  return swift_task_switch();
}

{
  uint64_t v0;
  void *v1;
  double v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  _QWORD *v11;
  NSObject *v12;
  os_log_type_t v13;
  NSObject *v14;
  uint8_t *v15;
  void *v16;
  id v17;
  id v19;
  NSObject *log;

  v1 = *(void **)(v0 + 272);
  *(_QWORD *)(v0 + 344) = v1;
  if (!v1)
  {
    v12 = *(NSObject **)(v0 + 312);
    v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = *(NSObject **)(v0 + 312);
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_230887000, v14, v13, "failed to resolve location", v15, 2u);
      MEMORY[0x2348BB678](v15, -1, -1);
    }
    v16 = *(void **)(v0 + 320);
    v17 = objc_msgSend((id)objc_opt_self(), sel_resolutionResultUnsupportedWithReason_, 1);
    goto LABEL_9;
  }
  objc_msgSend(v1, sel_horizontalAccuracy);
  if (v2 >= *MEMORY[0x24BDBFB60])
  {
    v16 = *(void **)(v0 + 320);
    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    v17 = objc_msgSend((id)objc_opt_self(), sel_resolutionResultUnsupportedWithReason_, 1);

LABEL_9:
    return (*(uint64_t (**)(id))(v0 + 8))(v17);
  }
  v3 = v0 + 208;
  v4 = v0 + 272;
  v5 = *(NSObject **)(v0 + 312);
  v6 = v1;
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v7))
  {
    log = *(NSObject **)(v0 + 312);
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    *(_QWORD *)(v0 + 208) = v6;
    v10 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v9 = v1;

    v3 = v0 + 208;
    _os_log_impl(&dword_230887000, log, v7, "resolved location %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    v11 = v9;
    v4 = v0 + 272;
    MEMORY[0x2348BB678](v11, -1, -1);
    MEMORY[0x2348BB678](v8, -1, -1);
  }
  else
  {

  }
  v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFA68]), sel_init);
  *(_QWORD *)(v0 + 352) = v19;
  *(_QWORD *)(v0 + 56) = v4;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = INSaveParkingLocationIntentHandler.resolveParkingLocation(for:);
  *(_QWORD *)(v0 + 240) = swift_continuation_init();
  *(_QWORD *)(v0 + 208) = MEMORY[0x24BDAC760];
  *(_QWORD *)(v0 + 216) = 0x40000000;
  *(_QWORD *)(v0 + 224) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSArray?, @unowned NSError?) -> () with result type [CLPlacemark];
  *(_QWORD *)(v0 + 232) = &block_descriptor_2;
  objc_msgSend(v19, sel_reverseGeocodeLocation_completionHandler_, v6, v3);
  return swift_continuation_await();
}

{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 360) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  id v9;
  id v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *log;
  uint64_t v19;

  v1 = *(void **)(v0 + 328);
  swift_willThrow();
  *(_QWORD *)(v0 + 272) = v1;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(demangling cache variable for type metadata for Error);
  type metadata accessor for related decl 'e' for AFLocationServiceErrorCode(0);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v3 = *(void **)(v0 + 320);

    static os_log_type_t.error.getter();
    os_log(_:dso:log:_:_:)();
    v4 = objc_msgSend((id)objc_opt_self(), sel_resolutionResultUnsupportedWithReason_, 1);

    return (*(uint64_t (**)(id))(v0 + 8))(v4);
  }
  else
  {
    v6 = *(NSObject **)(v0 + 312);

    v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = *(void **)(v0 + 328);
      log = *(NSObject **)(v0 + 312);
      v9 = v8;
      v10 = v8;
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v19 = v12;
      *(_DWORD *)v11 = 136315138;
      swift_getErrorValue();
      v13 = Error.localizedDescription.getter();
      *(_QWORD *)(v0 + 208) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v14, &v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_230887000, log, v7, "Unexpected error %s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348BB678](v12, -1, -1);
      MEMORY[0x2348BB678](v11, -1, -1);
    }
    v16 = *(void **)(v0 + 320);
    v15 = *(void **)(v0 + 328);
    v17 = objc_msgSend((id)objc_opt_self(), sel_resolutionResultUnsupportedWithReason_, 1);

    return (*(uint64_t (**)(id))(v0 + 8))(v17);
  }
}

{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  os_log_type_t v3;
  NSObject *v4;
  uint8_t *v5;
  void *v6;
  id v7;

  v1 = *(void **)(v0 + 336);
  swift_willThrow();

  v2 = *(NSObject **)(v0 + 312);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(NSObject **)(v0 + 312);
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_230887000, v4, v3, "failed to resolve location", v5, 2u);
    MEMORY[0x2348BB678](v5, -1, -1);
  }
  v6 = *(void **)(v0 + 320);
  v7 = objc_msgSend((id)objc_opt_self(), sel_resolutionResultUnsupportedWithReason_, 1);

  return (*(uint64_t (**)(id))(v0 + 8))(v7);
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v1 = *(void **)(v0 + 360);
  swift_willThrow();

  v2 = *(void **)(v0 + 344);
  v3 = *(void **)(v0 + 352);
  v4 = *(void **)(v0 + 320);
  v5 = (void *)objc_opt_self();
  v6 = objc_msgSend((id)objc_opt_self(), sel_placemarkWithLocation_name_postalAddress_, v2, 0, 0);
  v7 = objc_msgSend(v5, sel_successWithResolvedPlacemark_, v6);

  return (*(uint64_t (**)(id))(v0 + 8))(v7);
}

void INSaveParkingLocationIntentHandler.resolveParkingLocation(for:)()
{
  uint64_t v0;
  unint64_t v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v1 = *(_QWORD *)(v0 + 272);
  if (!(v1 >> 62))
  {
    if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_8:
    swift_bridgeObjectRelease();
    v4 = *(void **)(v0 + 344);
    v5 = *(void **)(v0 + 352);
    v6 = *(void **)(v0 + 320);
    v9 = (void *)objc_opt_self();
    v3 = objc_msgSend((id)objc_opt_self(), sel_placemarkWithLocation_name_postalAddress_, v4, 0, 0);
    v7 = objc_msgSend(v9, sel_successWithResolvedPlacemark_, v3);
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  v8 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v8)
    goto LABEL_8;
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    v2 = (id)MEMORY[0x2348BB150](0, v1);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v2 = *(id *)(v1 + 32);
LABEL_6:
    v3 = v2;
    v4 = *(void **)(v0 + 344);
    v5 = *(void **)(v0 + 352);
    v6 = *(void **)(v0 + 320);
    swift_bridgeObjectRelease();
    v7 = objc_msgSend((id)objc_opt_self(), sel_successWithResolvedPlacemark_, v3);
LABEL_9:
    v10 = v7;

    (*(void (**)(id))(v0 + 8))(v10);
    return;
  }
  __break(1u);
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned AFLocationAuthorizationStyle, @unowned CLAccuracyAuthorization, @unowned NSError?) -> () with result type (AFLocationAuthorizationStyle, CLAccuracyAuthorization)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  _QWORD *v5;
  id v6;
  _QWORD *v8;

  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(demangling cache variable for type metadata for Error);
    swift_allocError();
    *v5 = a4;
    v6 = a4;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    v8 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40);
    *v8 = a2;
    v8[1] = a3;
    return swift_continuation_throwingResume();
  }
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned CLLocation?, @unowned NSError?) -> () with result type CLLocation(uint64_t result, void *a2, void *a3)
{
  _QWORD *v4;
  id v5;
  id v6;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(demangling cache variable for type metadata for Error);
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

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSArray?, @unowned NSError?) -> () with result type [CLPlacemark](uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(demangling cache variable for type metadata for Error);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for CLPlacemark);
    **(_QWORD **)(*(_QWORD *)(v3 + 64) + 40) = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    return swift_continuation_throwingResume();
  }
}

uint64_t @objc closure #1 in INSaveParkingLocationIntentHandler.resolveParkingLocation(for:)(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;
  _QWORD *v8;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = @objc closure #1 in INSaveParkingLocationIntentHandler.resolveParkingLocation(for:);
  v8[37] = v6;
  v8[38] = v7;
  return swift_task_switch();
}

uint64_t @objc closure #1 in INSaveParkingLocationIntentHandler.resolveParkingLocation(for:)(void *a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  uint64_t v7;

  v3 = *(void (***)(_QWORD, _QWORD))(*v1 + 32);
  v5 = *(void **)(*v1 + 16);
  v4 = *(void **)(*v1 + 24);
  v7 = *v1;
  swift_task_dealloc();

  ((void (**)(_QWORD, void *))v3)[2](v3, a1);
  _Block_release(v3);

  return (*(uint64_t (**)(void))(v7 + 8))();
}

void INSaveParkingLocationIntentHandler.handle(intent:completion:)(void *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD aBlock[6];

  v7 = type metadata accessor for OSSignpostID();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static os_signpost_type_t.begin.getter();
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:_:_:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if (one-time initialization token for routineManager != -1)
    swift_once();
  v11 = (void *)static ParkingLocationService.routineManager;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = v3;
  v12[3] = a2;
  v12[4] = a3;
  v12[5] = a1;
  aBlock[4] = partial apply for closure #1 in INSaveParkingLocationIntentHandler.handle(intent:completion:);
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed [RTVehicleEvent]?, @guaranteed Error?) -> ();
  aBlock[3] = &block_descriptor_3;
  v13 = _Block_copy(aBlock);
  v14 = v3;
  swift_retain();
  v15 = a1;
  swift_release();
  objc_msgSend(v11, sel_fetchLastVehicleEventsWithHandler_, v13);
  _Block_release(v13);
}

void closure #1 in INSaveParkingLocationIntentHandler.handle(intent:completion:)(uint64_t a1, void *a2, uint64_t a3, void (*a4)(void), uint64_t a5, void *a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  os_log_type_t v16;
  NSObject *v17;
  os_log_type_t v18;
  id v19;
  id v20;
  uint8_t *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  NSObject *v27;
  void (*v28)(char *, uint64_t);
  id v29;
  void *v30;
  id v31;
  os_log_type_t v32;
  uint8_t *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  os_log_type_t v38;
  _BOOL4 v39;
  uint8_t *v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  os_log_type_t v47;
  uint8_t *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  id v57;
  id v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  void *v62;
  _QWORD v63[2];
  id v64;
  id v65;
  uint64_t v66;
  void (*v67)(void);
  uint64_t v68;
  uint64_t v69;

  v11 = type metadata accessor for OSSignpostID();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v15 = a2;
    v16 = static os_log_type_t.error.getter();
    v17 = *(NSObject **)(a3 + OBJC_IVAR____TtC7SiriGeo34INSaveParkingLocationIntentHandler_logObject);
    v18 = v16;
    if (os_log_type_enabled(v17, v16))
    {
      v19 = a2;
      v20 = a2;
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = swift_slowAlloc();
      v68 = (uint64_t)a2;
      v69 = v22;
      *(_DWORD *)v21 = 136315138;
      v23 = a2;
      __swift_instantiateConcreteTypeFromMangledName(demangling cache variable for type metadata for Error);
      v24 = String.init<A>(describing:)();
      v68 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, &v69);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_230887000, v17, v18, "error fetching vehicle event before saving new location: %s", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348BB678](v22, -1, -1);
      MEMORY[0x2348BB678](v21, -1, -1);
    }
    v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA038]), sel_initWithCode_userActivity_, 4, 0);
    a4();

  }
  else
  {
    static os_signpost_type_t.end.getter();
    v27 = *(NSObject **)(a3 + OBJC_IVAR____TtC7SiriGeo34INSaveParkingLocationIntentHandler_logObject);
    static OSSignpostID.exclusive.getter();
    os_signpost(_:dso:log:name:signpostID:_:_:)();
    v28 = *(void (**)(char *, uint64_t))(v12 + 8);
    v28(v14, v11);
    v29 = objc_msgSend(a6, sel_parkingLocation);
    if (v29
      && (v30 = v29, v31 = objc_msgSend(v29, sel_location), v30, v31))
    {
      v66 = a5;
      v67 = a4;
      v65 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA038]), sel_initWithCode_userActivity_, 3, 0);
      if (one-time initialization token for routineManager != -1)
        swift_once();
      objc_msgSend((id)static ParkingLocationService.routineManager, sel_clearAllVehicleEvents);
      v32 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v27, v32))
      {
        v33 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_230887000, v27, v32, "Deleted all saved parking locations", v33, 2u);
        MEMORY[0x2348BB678](v33, -1, -1);
      }
      static os_signpost_type_t.begin.getter();
      static OSSignpostID.exclusive.getter();
      os_signpost(_:dso:log:name:signpostID:_:_:)();
      v28(v14, v11);
      v34 = (void *)static ParkingLocationService.routineManager;
      v35 = v31;
      v36 = objc_msgSend(a6, sel_parkingNote);
      objc_msgSend(v34, sel_vehicleEventAtLocation_notes_, v35, v36);

      static os_signpost_type_t.end.getter();
      static OSSignpostID.exclusive.getter();
      os_signpost(_:dso:log:name:signpostID:_:_:)();
      v28(v14, v11);
      v37 = v35;
      v38 = static os_log_type_t.default.getter();
      v39 = os_log_type_enabled(v27, v38);
      v64 = v37;
      if (v39)
      {
        v40 = (uint8_t *)swift_slowAlloc();
        v41 = swift_slowAlloc();
        v69 = v41;
        *(_DWORD *)v40 = 136315138;
        v63[1] = v40 + 4;
        v42 = v37;
        v43 = objc_msgSend(v42, sel_description);
        v44 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v46 = v45;

        v68 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v44, v46, &v69);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_230887000, v27, v38, "Setting parking location to: %s", v40, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348BB678](v41, -1, -1);
        MEMORY[0x2348BB678](v40, -1, -1);
      }
      else
      {

      }
      v50 = objc_msgSend(a6, sel_parkingLocation);
      v51 = v65;
      objc_msgSend(v65, sel_setParkingLocation_, v50);

      v52 = objc_msgSend(a6, sel_parkingNote);
      objc_msgSend(v51, sel_setParkingNote_, v52);

      v53 = v51;
      v54 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v27, v54))
      {
        v55 = (uint8_t *)swift_slowAlloc();
        v56 = swift_slowAlloc();
        v69 = v56;
        *(_DWORD *)v55 = 136315138;
        v65 = v55 + 4;
        v57 = v53;
        v58 = objc_msgSend(v57, sel_description);
        v59 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v61 = v60;

        v68 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v59, v61, &v69);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_230887000, v27, v54, "Sending response : %s", v55, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348BB678](v56, -1, -1);
        MEMORY[0x2348BB678](v55, -1, -1);
      }
      else
      {

      }
      v62 = v64;
      ((void (*)(id))v67)(v53);

    }
    else
    {
      v47 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v27, v47))
      {
        v48 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v48 = 0;
        _os_log_impl(&dword_230887000, v27, v47, "No location resolved", v48, 2u);
        MEMORY[0x2348BB678](v48, -1, -1);
      }
      v49 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA038]), sel_initWithCode_userActivity_, 4, 0);
      a4();

    }
  }
}

id INSaveParkingLocationIntentHandler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id INSaveParkingLocationIntentHandler.init()()
{
  char *v0;
  uint64_t v1;
  char *v2;
  char *v3;
  objc_super v5;

  v1 = OBJC_IVAR____TtC7SiriGeo34INSaveParkingLocationIntentHandler_logObject;
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  v2 = v0;
  *(_QWORD *)&v0[v1] = OS_os_log.init(subsystem:category:)();
  v3 = &v2[OBJC_IVAR____TtC7SiriGeo34INSaveParkingLocationIntentHandler_completion];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for INSaveParkingLocationIntentHandler();
  return objc_msgSendSuper2(&v5, sel_init);
}

id INSaveParkingLocationIntentHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for INSaveParkingLocationIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _sIeghH_IeAgH_TR(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = _sIeghH_IeAgH_TRTQ0_;
  return v6();
}

uint64_t _sIeAgH_ytIeAgHr_TR(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = _sIeghH_IeAgH_TRTQ0_;
  return v7();
}

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = type metadata accessor for TaskPriority();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  outlined destroy of TaskPriority?(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TQ0_;
  return v6(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TQ0_()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2308A244C()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void partial apply for closure #1 in INSaveParkingLocationIntentHandler.handle(intent:completion:)(uint64_t a1, void *a2)
{
  uint64_t v2;

  closure #1 in INSaveParkingLocationIntentHandler.handle(intent:completion:)(a1, a2, *(_QWORD *)(v2 + 16), *(void (**)(void))(v2 + 24), *(_QWORD *)(v2 + 32), *(void **)(v2 + 40));
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

uint64_t type metadata accessor for INSaveParkingLocationIntentHandler()
{
  return objc_opt_self();
}

uint64_t sub_2308A24CC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_2308A24F0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t partial apply for @objc closure #1 in INSaveParkingLocationIntentHandler.resolveParkingLocation(for:)()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = partial apply for @objc closure #1 in INSaveParkingLocationIntentHandler.resolveParkingLocation(for:);
  return ((uint64_t (*)(void *, void *, void *))((char *)&async function pointer to @objc closure #1 in INSaveParkingLocationIntentHandler.resolveParkingLocation(for:)
                                                         + async function pointer to @objc closure #1 in INSaveParkingLocationIntentHandler.resolveParkingLocation(for:)))(v2, v3, v4);
}

{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t _sIeghH_IeAgH_TRTA()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = _sIeghH_IeAgH_TRTQ0_;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&_sIeghH_IeAgH_TRTu + _sIeghH_IeAgH_TRTu))(v2, v3, v4);
}

uint64_t objectdestroy_13Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t _sIeAgH_ytIeAgHr_TRTA(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = _sIeghH_IeAgH_TRTQ0_;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&_sIeAgH_ytIeAgHr_TRTu
                                                                   + _sIeAgH_ytIeAgHr_TRTu))(a1, v4, v5, v6);
}

uint64_t outlined destroy of TaskPriority?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2308A2748()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TA(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = partial apply for @objc closure #1 in INSaveParkingLocationIntentHandler.resolveParkingLocation(for:);
  return ((uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5Tu
                                                 + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5Tu))(a1, v4);
}

uint64_t PersonNameComponents.givenName.getter()
{
  return MEMORY[0x24BDCCB20]();
}

uint64_t PersonNameComponents.familyName.getter()
{
  return MEMORY[0x24BDCCB30]();
}

uint64_t PersonNameComponents.middleName.getter()
{
  return MEMORY[0x24BDCCB40]();
}

uint64_t PersonNameComponents.namePrefix.getter()
{
  return MEMORY[0x24BDCCB60]();
}

uint64_t PersonNameComponents.nameSuffix.getter()
{
  return MEMORY[0x24BDCCB70]();
}

NSPersonNameComponents __swiftcall PersonNameComponents._bridgeToObjectiveC()()
{
  objc_class *v0;
  void *v1;
  NSPersonNameComponents result;

  v0 = (objc_class *)MEMORY[0x24BDCCBB0]();
  result._private = v1;
  result.super.isa = v0;
  return result;
}

uint64_t static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCCBD0]();
}

uint64_t PersonNameComponents.nickname.getter()
{
  return MEMORY[0x24BDCCBD8]();
}

uint64_t type metadata accessor for PersonNameComponents()
{
  return MEMORY[0x24BDCCC10]();
}

uint64_t _BridgedStoredNSError._getEmbeddedNSError()()
{
  return MEMORY[0x24BDCD280]();
}

uint64_t _BridgedStoredNSError.init(_bridgedNSError:)()
{
  return MEMORY[0x24BDCD288]();
}

uint64_t _BridgedStoredNSError.errorUserInfo.getter()
{
  return MEMORY[0x24BDCD290]();
}

uint64_t static _BridgedStoredNSError.== infix(_:_:)()
{
  return MEMORY[0x24BDCD298]();
}

uint64_t _BridgedStoredNSError.hash(into:)()
{
  return MEMORY[0x24BDCD2A8]();
}

uint64_t _BridgedStoredNSError.errorCode.getter()
{
  return MEMORY[0x24BDCD2B8]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x24BDCDCA0]();
}

Swift::String __swiftcall Data.base64EncodedString(options:)(NSDataBase64EncodingOptions options)
{
  uint64_t v1;
  void *v2;
  Swift::String result;

  v1 = MEMORY[0x24BDCDCA8](options);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.siriCommandBuilderParams.getter()
{
  return MEMORY[0x24BE6FB98]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams()
{
  return MEMORY[0x24BE6FBC8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.uniqueID.getter()
{
  return MEMORY[0x24BE6FBE0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_MapItemSnippet.searchRegionCenter.getter()
{
  return MEMORY[0x24BE708F8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_MapItemSnippet.objects.getter()
{
  return MEMORY[0x24BE70900]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_MapItemSnippet()
{
  return MEMORY[0x24BE70908]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.DetailType()
{
  return MEMORY[0x24BE70D88]();
}

uint64_t Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.detailType.getter()
{
  return MEMORY[0x24BE70D90]();
}

uint64_t Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.spokenName.getter()
{
  return MEMORY[0x24BE70D98]();
}

uint64_t Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.directionRole.getter()
{
  return MEMORY[0x24BE70DA0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.Role()
{
  return MEMORY[0x24BE70DC8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.label.getter()
{
  return MEMORY[0x24BE70DD0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.location.getter()
{
  return MEMORY[0x24BE70DD8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_MapItemBuilderParams.placeData.getter()
{
  return MEMORY[0x24BE70DE0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_MapItemBuilderParams()
{
  return MEMORY[0x24BE70DE8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationBuilderParams.postalCode.getter()
{
  return MEMORY[0x24BE70F38]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationBuilderParams.timezoneID.getter()
{
  return MEMORY[0x24BE70F40]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationBuilderParams.countryCode.getter()
{
  return MEMORY[0x24BE70F48]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationBuilderParams.thoroughfare.getter()
{
  return MEMORY[0x24BE70F50]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationBuilderParams.subThoroughfare.getter()
{
  return MEMORY[0x24BE70F58]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationBuilderParams.city.getter()
{
  return MEMORY[0x24BE70F60]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationBuilderParams.label.getter()
{
  return MEMORY[0x24BE70F68]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationBuilderParams.street.getter()
{
  return MEMORY[0x24BE70F70]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationBuilderParams.latitude.getter()
{
  return MEMORY[0x24BE70F78]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationBuilderParams.longitude.getter()
{
  return MEMORY[0x24BE70F80]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationBuilderParams.stateCode.getter()
{
  return MEMORY[0x24BE70F88]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_LocationBuilderParams()
{
  return MEMORY[0x24BE70F90]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_PerResultLayoutDetails.OneOf_Snippet()
{
  return MEMORY[0x24BE71018]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.itemSource.getter()
{
  return MEMORY[0x24BE71200]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.showTraffic.getter()
{
  return MEMORY[0x24BE71208]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.hasItemSource.getter()
{
  return MEMORY[0x24BE71210]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.showDirections.getter()
{
  return MEMORY[0x24BE71218]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.itemDestination.getter()
{
  return MEMORY[0x24BE71220]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.hasItemDestination.getter()
{
  return MEMORY[0x24BE71228]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams.language.getter()
{
  return MEMORY[0x24BE71230]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ShowMapPointsBuilderParams()
{
  return MEMORY[0x24BE71238]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ShowPlaceDetailsBuilderParams.itemIndex.getter()
{
  return MEMORY[0x24BE712A0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ShowPlaceDetailsBuilderParams()
{
  return MEMORY[0x24BE712A8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.SourceType()
{
  return MEMORY[0x24BE712B8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.sourceType.getter()
{
  return MEMORY[0x24BE712C8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams.location.getter()
{
  return MEMORY[0x24BE712D0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_RecordLocationActivityBuilderParams()
{
  return MEMORY[0x24BE712D8]();
}

uint64_t Siri_Nlu_External_UsoGraph.identifiers.getter()
{
  return MEMORY[0x24BE9C290]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UsoGraph()
{
  return MEMORY[0x24BE9C2B8]();
}

uint64_t Siri_Nlu_External_UserAccepted.init()()
{
  return MEMORY[0x24BE9C570]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserAccepted()
{
  return MEMORY[0x24BE9C578]();
}

uint64_t Siri_Nlu_External_SystemOffered.offeredAct.setter()
{
  return MEMORY[0x24BE9C6D0]();
}

uint64_t Siri_Nlu_External_SystemOffered.init()()
{
  return MEMORY[0x24BE9C6D8]();
}

uint64_t type metadata accessor for Siri_Nlu_External_SystemOffered()
{
  return MEMORY[0x24BE9C6E0]();
}

uint64_t Siri_Nlu_External_UserCancelled.init()()
{
  return MEMORY[0x24BE9C700]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserCancelled()
{
  return MEMORY[0x24BE9C708]();
}

uint64_t Siri_Nlu_External_UserDialogAct.userStatedTask.getter()
{
  return MEMORY[0x24BE9C768]();
}

uint64_t Siri_Nlu_External_UserDialogAct.userStatedTask.setter()
{
  return MEMORY[0x24BE9C770]();
}

uint64_t Siri_Nlu_External_UserDialogAct.wantedToProceed.setter()
{
  return MEMORY[0x24BE9C7A0]();
}

uint64_t Siri_Nlu_External_UserDialogAct.accepted.setter()
{
  return MEMORY[0x24BE9C7D8]();
}

uint64_t Siri_Nlu_External_UserDialogAct.cancelled.setter()
{
  return MEMORY[0x24BE9C808]();
}

uint64_t Siri_Nlu_External_UserDialogAct.init()()
{
  return MEMORY[0x24BE9C820]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserDialogAct()
{
  return MEMORY[0x24BE9C828]();
}

uint64_t type metadata accessor for Siri_Nlu_External_SystemPrompted()
{
  return MEMORY[0x24BE9CAF0]();
}

uint64_t Siri_Nlu_External_UserStatedTask.task.getter()
{
  return MEMORY[0x24BE9CB10]();
}

uint64_t Siri_Nlu_External_UserStatedTask.task.setter()
{
  return MEMORY[0x24BE9CB18]();
}

uint64_t Siri_Nlu_External_UserStatedTask.init()()
{
  return MEMORY[0x24BE9CB20]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserStatedTask()
{
  return MEMORY[0x24BE9CB28]();
}

uint64_t Siri_Nlu_External_SystemDialogAct.offered.setter()
{
  return MEMORY[0x24BE9CD40]();
}

uint64_t Siri_Nlu_External_SystemDialogAct.prompted.setter()
{
  return MEMORY[0x24BE9CD58]();
}

uint64_t Siri_Nlu_External_SystemDialogAct.init()()
{
  return MEMORY[0x24BE9CD68]();
}

uint64_t Siri_Nlu_External_SystemGaveOptions.choices.setter()
{
  return MEMORY[0x24BE9CF00]();
}

uint64_t Siri_Nlu_External_SystemGaveOptions.init()()
{
  return MEMORY[0x24BE9CF08]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserWantedToProceed()
{
  return MEMORY[0x24BE9D0F0]();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.backingAppBundleID.getter()
{
  return MEMORY[0x24BE9D0F8]();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.value.getter()
{
  return MEMORY[0x24BE9D100]();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.namespace.getter()
{
  return MEMORY[0x24BE9D108]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UsoEntityIdentifier()
{
  return MEMORY[0x24BE9D110]();
}

uint64_t static ConversionUtils.convertUserDialogActToTasks(userDialogAct:)()
{
  return MEMORY[0x24BE9E008]();
}

uint64_t static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)()
{
  return MEMORY[0x24BE9E028]();
}

uint64_t dispatch thunk of Uso_VerbTemplateBuilder_NoVerb.setEntity(value:)()
{
  return MEMORY[0x24BE9ED38]();
}

uint64_t static UsoGraphBuilder.buildGraphWithOptions(taskBuilders:options:)()
{
  return MEMORY[0x24BE9FE58]();
}

uint64_t type metadata accessor for UsoBuilderOptions()
{
  return MEMORY[0x24BE9FF78]();
}

uint64_t UsoEntityBuilder_common_Person.init()()
{
  return MEMORY[0x24BEA1508]();
}

uint64_t type metadata accessor for UsoEntityBuilder_common_Person()
{
  return MEMORY[0x24BEA1510]();
}

uint64_t UsoTaskBuilder_noVerb_common_Person.init()()
{
  return MEMORY[0x24BEA2690]();
}

uint64_t type metadata accessor for UsoTaskBuilder_noVerb_common_Person()
{
  return MEMORY[0x24BEA2698]();
}

uint64_t ContactQuery.familyName.setter()
{
  return MEMORY[0x24BE93400]();
}

uint64_t ContactQuery.middleName.setter()
{
  return MEMORY[0x24BE93410]();
}

uint64_t ContactQuery.namePrefix.setter()
{
  return MEMORY[0x24BE93420]();
}

uint64_t ContactQuery.nameSuffix.setter()
{
  return MEMORY[0x24BE93430]();
}

uint64_t ContactQuery.relationship.setter()
{
  return MEMORY[0x24BE93440]();
}

uint64_t ContactQuery.id.setter()
{
  return MEMORY[0x24BE93468]();
}

uint64_t ContactQuery.fullName.setter()
{
  return MEMORY[0x24BE93490]();
}

uint64_t ContactQuery.nickname.setter()
{
  return MEMORY[0x24BE934A0]();
}

uint64_t ContactQuery.givenName.setter()
{
  return MEMORY[0x24BE934B0]();
}

uint64_t ContactQuery.init()()
{
  return MEMORY[0x24BE934B8]();
}

uint64_t type metadata accessor for ContactQuery()
{
  return MEMORY[0x24BE934C0]();
}

uint64_t type metadata accessor for ContactHandle.HandleType()
{
  return MEMORY[0x24BE93590]();
}

uint64_t ContactHandle.init(id:type:label:value:isSuggested:)()
{
  return MEMORY[0x24BE935B8]();
}

uint64_t ContactRelationshipQuery.init(label:fromContact:)()
{
  return MEMORY[0x24BE939E8]();
}

uint64_t type metadata accessor for ContactRelationshipQuery()
{
  return MEMORY[0x24BE939F0]();
}

uint64_t Google_Protobuf_StringValue.value.getter()
{
  return MEMORY[0x24BE5BA20]();
}

uint64_t type metadata accessor for Google_Protobuf_StringValue()
{
  return MEMORY[0x24BE5BA38]();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t os_signpost(_:dso:log:name:signpostID:_:_:)()
{
  return MEMORY[0x24BEE76F8]();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t Logger.init(_:)()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x24BEE0980]();
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

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x24BEE1110]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x24BDCFBA8]();
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

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t Array.debugDescription.getter()
{
  return MEMORY[0x24BEE1168]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t Double.write<A>(to:)()
{
  return MEMORY[0x24BEE13A8]();
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

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x24BEE7948]();
}

NSNumber __swiftcall NSNumber.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (NSNumber)MEMORY[0x24BDD01F0](BOOLeanLiteral);
}

uint64_t NSObject.hashValue.getter()
{
  return MEMORY[0x24BEE5BD0]();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x24BEE1F48]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return MEMORY[0x24BEE31D0]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x24BEE3290](cases._rawValue, string._countAndFlagsBits, string._object);
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return MEMORY[0x24BEE3548](a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t Error<>._code.getter()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t Error<>._domain.getter()
{
  return MEMORY[0x24BDD06F0]();
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

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x24BEE42F8](a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t INIntentSlotValueTransformToContactValue()
{
  return MEMORY[0x24BDD9940]();
}

uint64_t MSPSharedTripNetworkEnabled()
{
  return MEMORY[0x24BE63FA0]();
}

uint64_t MSPSharedTripUserEnabled()
{
  return MEMORY[0x24BE63FA8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

