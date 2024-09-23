uint64_t variable initialization expression of SRSmartRepliesActionCardView._colorScheme@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  return swift_storeEnumTagMultiPayload();
}

uint64_t key path getter for EnvironmentValues.colorScheme : EnvironmentValues()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t key path setter for EnvironmentValues.colorScheme : EnvironmentValues(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  type metadata accessor for ColorScheme();
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t))(v3 + 16))((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.colorScheme.setter();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24957F9F0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void SRSmartRepliesActionCardView.init(metadata:)(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  *a2 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  swift_storeEnumTagMultiPayload();
  v4 = type metadata accessor for SRSmartRepliesActionCardView(0);
  *(uint64_t *)((char *)a2 + *(int *)(v4 + 20)) = (uint64_t)a1;
  v5 = a1;
  SRSmartRepliesActionMetadata.locationLatitude.getter();
  v7 = v6;
  SRSmartRepliesActionMetadata.locationLongitude.getter();
  v9 = v8;

  v10 = (uint64_t *)((char *)a2 + *(int *)(v4 + 24));
  *v10 = v7;
  v10[1] = v9;
}

uint64_t type metadata accessor for SRSmartRepliesActionCardView(uint64_t a1)
{
  return type metadata accessor for SRSmartRepliesActionCardView(a1, (uint64_t *)&type metadata singleton initialization cache for SRSmartRepliesActionCardView);
}

double SRSmartRepliesActionCardView.body.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  double result;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  unsigned __int8 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int16 v32;
  char v33;
  char v34;

  type metadata accessor for SRSmartRepliesActionCardView(0);
  if ((SRSmartRepliesActionMetadata.hasRichActionType.getter() & 1) != 0)
  {
    SRSmartRepliesActionMetadata.type.getter();
    v2 = SRSmartRepliesActionType.rawValue.getter();
    if (v2 != SRSmartRepliesActionType.rawValue.getter())
    {
      SRSmartRepliesActionMetadata.type.getter();
      v7 = SRSmartRepliesActionType.rawValue.getter();
      if (v7 != SRSmartRepliesActionType.rawValue.getter())
      {
        SRSmartRepliesActionMetadata.type.getter();
        v9 = SRSmartRepliesActionType.rawValue.getter();
        if (v9 == SRSmartRepliesActionType.rawValue.getter())
        {
          v10 = SRSmartRepliesActionMetadata.stringRepresentation.getter();
          if (v11)
            v12 = v10;
          else
            v12 = 0;
          v13 = 0xE000000000000000;
          if (v11)
            v13 = v11;
        }
        else
        {
          SRSmartRepliesActionMetadata.type.getter();
          v14 = SRSmartRepliesActionType.rawValue.getter();
          v15 = SRSmartRepliesActionType.rawValue.getter();
          v16 = SRSmartRepliesActionMetadata.stringRepresentation.getter();
          if (v17)
            v12 = v16;
          else
            v12 = 0;
          v13 = 0xE000000000000000;
          if (v17)
            v13 = v17;
          if (v14 != v15)
          {
            *(_QWORD *)&v28 = v12;
            *((_QWORD *)&v28 + 1) = v13;
            lazy protocol witness table accessor for type String and conformance String();
            Text.init<A>(_:)();
            __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>>);
            goto LABEL_13;
          }
        }
        *(_QWORD *)&v28 = v12;
        *((_QWORD *)&v28 + 1) = v13;
        lazy protocol witness table accessor for type String and conformance String();
        v18 = Text.init<A>(_:)();
        v20 = v19;
        v22 = v21 & 1;
        outlined copy of Text.Storage(v18, v19, v21 & 1);
        swift_bridgeObjectRetain();
        _ConditionalContent<>.init(storage:)();
        v30 = v30;
        v31 = 0uLL;
        v32 = 256;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<Text, Text>);
        lazy protocol witness table accessor for type _ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView> and conformance <> _ConditionalContent<A, B>();
        lazy protocol witness table accessor for type _ConditionalContent<Text, Text> and conformance <> _ConditionalContent<A, B>();
        _ConditionalContent<>.init(storage:)();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>>);
        lazy protocol witness table accessor for type _ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>> and conformance <> _ConditionalContent<A, B>(&lazy protocol witness table cache variable for type _ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>> and conformance <> _ConditionalContent<A, B>, &demangling cache variable for type metadata for _ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>>, lazy protocol witness table accessor for type _ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView> and conformance <> _ConditionalContent<A, B>, (uint64_t (*)(void))lazy protocol witness table accessor for type _ConditionalContent<Text, Text> and conformance <> _ConditionalContent<A, B>);
        _ConditionalContent<>.init(storage:)();
        outlined consume of Text.Storage(v18, v20, v22);
        swift_bridgeObjectRelease();
        goto LABEL_14;
      }
      SRSmartRepliesActionMetadata.title.getter();
      SRSmartRepliesActionMetadata.imageName.getter();
    }
    lazy protocol witness table accessor for type SRSmartRepliesActionCardView.LocationView and conformance SRSmartRepliesActionCardView.LocationView();
    lazy protocol witness table accessor for type SRSmartRepliesActionCardView.ETAView and conformance SRSmartRepliesActionCardView.ETAView();
    _ConditionalContent<>.init(storage:)();
    v28 = v23;
    v29 = v24;
    v30 = v25;
    v31 = v26;
    v32 = v27;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<Text, Text>);
    lazy protocol witness table accessor for type _ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView> and conformance <> _ConditionalContent<A, B>();
    lazy protocol witness table accessor for type _ConditionalContent<Text, Text> and conformance <> _ConditionalContent<A, B>();
    _ConditionalContent<>.init(storage:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>>);
LABEL_13:
    lazy protocol witness table accessor for type _ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>> and conformance <> _ConditionalContent<A, B>(&lazy protocol witness table cache variable for type _ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>> and conformance <> _ConditionalContent<A, B>, &demangling cache variable for type metadata for _ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>>, lazy protocol witness table accessor for type _ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView> and conformance <> _ConditionalContent<A, B>, (uint64_t (*)(void))lazy protocol witness table accessor for type _ConditionalContent<Text, Text> and conformance <> _ConditionalContent<A, B>);
    _ConditionalContent<>.init(storage:)();
    goto LABEL_14;
  }
  v3 = SRSmartRepliesActionMetadata.stringRepresentation.getter();
  if (v4)
    v5 = v3;
  else
    v5 = 0;
  v6 = 0xE000000000000000;
  if (v4)
    v6 = v4;
  *(_QWORD *)&v28 = v5;
  *((_QWORD *)&v28 + 1) = v6;
  lazy protocol witness table accessor for type String and conformance String();
  Text.init<A>(_:)();
LABEL_14:
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<_ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>>, Text>);
  lazy protocol witness table accessor for type _ConditionalContent<_ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>>, Text> and conformance <> _ConditionalContent<A, B>();
  _ConditionalContent<>.init(storage:)();
  result = *(double *)&v28;
  *(_OWORD *)a1 = v28;
  *(_OWORD *)(a1 + 16) = v29;
  *(_OWORD *)(a1 + 32) = v30;
  *(_OWORD *)(a1 + 48) = v31;
  *(_WORD *)(a1 + 64) = v32;
  *(_BYTE *)(a1 + 66) = v33;
  *(_BYTE *)(a1 + 67) = v34;
  return result;
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x24957FA08](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type _ConditionalContent<_ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>>, Text> and conformance <> _ConditionalContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type _ConditionalContent<_ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>>, Text> and conformance <> _ConditionalContent<A, B>;
  if (!lazy protocol witness table cache variable for type _ConditionalContent<_ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>>, Text> and conformance <> _ConditionalContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for _ConditionalContent<_ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>>, Text>);
    v2[0] = lazy protocol witness table accessor for type _ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>> and conformance <> _ConditionalContent<A, B>(&lazy protocol witness table cache variable for type _ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>> and conformance <> _ConditionalContent<A, B>, &demangling cache variable for type metadata for _ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>>, lazy protocol witness table accessor for type _ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView> and conformance <> _ConditionalContent<A, B>, (uint64_t (*)(void))lazy protocol witness table accessor for type _ConditionalContent<Text, Text> and conformance <> _ConditionalContent<A, B>);
    v2[1] = MEMORY[0x24BDF1F80];
    result = MEMORY[0x24957FA08](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _ConditionalContent<_ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>>, Text> and conformance <> _ConditionalContent<A, B>);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24957F9FC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type _ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView> and conformance <> _ConditionalContent<A, B>()
{
  return lazy protocol witness table accessor for type _ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>> and conformance <> _ConditionalContent<A, B>(&lazy protocol witness table cache variable for type _ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView> and conformance <> _ConditionalContent<A, B>, &demangling cache variable for type metadata for _ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, (uint64_t (*)(void))lazy protocol witness table accessor for type SRSmartRepliesActionCardView.LocationView and conformance SRSmartRepliesActionCardView.LocationView, (uint64_t (*)(void))lazy protocol witness table accessor for type SRSmartRepliesActionCardView.ETAView and conformance SRSmartRepliesActionCardView.ETAView);
}

uint64_t lazy protocol witness table accessor for type _ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>> and conformance <> _ConditionalContent<A, B>(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4();
    result = MEMORY[0x24957FA08](MEMORY[0x24BDEF3E0], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SRSmartRepliesActionCardView.LocationView and conformance SRSmartRepliesActionCardView.LocationView()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SRSmartRepliesActionCardView.LocationView and conformance SRSmartRepliesActionCardView.LocationView;
  if (!lazy protocol witness table cache variable for type SRSmartRepliesActionCardView.LocationView and conformance SRSmartRepliesActionCardView.LocationView)
  {
    result = MEMORY[0x24957FA08](&protocol conformance descriptor for SRSmartRepliesActionCardView.LocationView, &unk_2518CEB50);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SRSmartRepliesActionCardView.LocationView and conformance SRSmartRepliesActionCardView.LocationView);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SRSmartRepliesActionCardView.ETAView and conformance SRSmartRepliesActionCardView.ETAView()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SRSmartRepliesActionCardView.ETAView and conformance SRSmartRepliesActionCardView.ETAView;
  if (!lazy protocol witness table cache variable for type SRSmartRepliesActionCardView.ETAView and conformance SRSmartRepliesActionCardView.ETAView)
  {
    result = MEMORY[0x24957FA08](&protocol conformance descriptor for SRSmartRepliesActionCardView.ETAView, &unk_2518CEAC8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SRSmartRepliesActionCardView.ETAView and conformance SRSmartRepliesActionCardView.ETAView);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type _ConditionalContent<Text, Text> and conformance <> _ConditionalContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type _ConditionalContent<Text, Text> and conformance <> _ConditionalContent<A, B>;
  if (!lazy protocol witness table cache variable for type _ConditionalContent<Text, Text> and conformance <> _ConditionalContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for _ConditionalContent<Text, Text>);
    v2[0] = MEMORY[0x24BDF1F80];
    v2[1] = MEMORY[0x24BDF1F80];
    result = MEMORY[0x24957FA08](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _ConditionalContent<Text, Text> and conformance <> _ConditionalContent<A, B>);
  }
  return result;
}

uint64_t outlined copy of Text.Storage(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t outlined consume of Text.Storage(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t protocol witness for Identifiable.id.getter in conformance SRSmartRepliesActionCardView.MapLocation@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for UUID();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t SRSmartRepliesActionCardView.LocationView.body.getter(double a1, double a2)
{
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Swift::String v13;
  Swift::String v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  double *v19;
  Swift::String v21[4];
  Swift::String v22;
  int64x2_t v23;
  Swift::String v24;
  Swift::String v25;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Binding<MapUserTrackingMode>?);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MapInteractionModes();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFBD48];
  MEMORY[0x24BDAC7A8]();
  *(double *)&v22._countAndFlagsBits = a1;
  *(double *)&v22._object = a2;
  v23 = vdupq_n_s64(0x3FA999999999999AuLL);
  type metadata accessor for MKCoordinateRegion(0);
  static Binding.constant(_:)();
  v22 = v21[1];
  v23 = (int64x2_t)v21[2];
  v24 = v21[3];
  v21[0]._countAndFlagsBits = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type MapInteractionModes and conformance MapInteractionModes(&lazy protocol witness table cache variable for type MapInteractionModes and conformance MapInteractionModes, v6, MEMORY[0x24BDFBD58]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [MapInteractionModes]);
  lazy protocol witness table accessor for type [MapInteractionModes] and conformance [A](&lazy protocol witness table cache variable for type [MapInteractionModes] and conformance [A], &demangling cache variable for type metadata for [MapInteractionModes], MEMORY[0x24BEE12C8]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Binding<MapUserTrackingMode>);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5, 1, 1, v7);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SRSmartRepliesActionCardView.MapLocation>);
  v8 = (int *)type metadata accessor for SRSmartRepliesActionCardView.MapLocation(0);
  v9 = *(unsigned __int8 *)(*((_QWORD *)v8 - 1) + 80);
  v10 = (v9 + 32) & ~v9;
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_247689F70;
  if (one-time initialization token for current != -1)
    swift_once();
  v12 = v11 + v10;
  v25._object = (void *)0xE000000000000000;
  v13._countAndFlagsBits = 0x434F4C5F444E4553;
  v13._object = (void *)0xED00004E4F495441;
  v14._countAndFlagsBits = 0;
  v14._object = (void *)0xE000000000000000;
  v25._countAndFlagsBits = 0;
  v21[0] = NSLocalizedString(_:tableName:bundle:value:comment:)(v13, (Swift::String_optional)0, (NSBundle)static NSBundle.current, v14, v25);
  lazy protocol witness table accessor for type String and conformance String();
  v15 = StringProtocol.localizedLowercase.getter();
  v17 = v16;
  swift_bridgeObjectRelease();
  UUID.init()();
  v18 = (uint64_t *)(v12 + v8[5]);
  *v18 = v15;
  v18[1] = v17;
  *(_OWORD *)(v12 + v8[6]) = xmmword_247689F80;
  v19 = (double *)(v12 + v8[7]);
  *v19 = a1;
  v19[1] = a2;
  v21[0]._countAndFlagsBits = v11;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [SRSmartRepliesActionCardView.MapLocation]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MapAnnotation<VStack<TupleView<(SRSmartRepliesActionCardView.LocationDotView, SRSmartRepliesActionCardView.PillView)>>>);
  lazy protocol witness table accessor for type [MapInteractionModes] and conformance [A](&lazy protocol witness table cache variable for type [SRSmartRepliesActionCardView.MapLocation] and conformance [A], &demangling cache variable for type metadata for [SRSmartRepliesActionCardView.MapLocation], MEMORY[0x24BEE12D8]);
  lazy protocol witness table accessor for type [MapInteractionModes] and conformance [A](&lazy protocol witness table cache variable for type MapAnnotation<VStack<TupleView<(SRSmartRepliesActionCardView.LocationDotView, SRSmartRepliesActionCardView.PillView)>>> and conformance MapAnnotation<A>, &demangling cache variable for type metadata for MapAnnotation<VStack<TupleView<(SRSmartRepliesActionCardView.LocationDotView, SRSmartRepliesActionCardView.PillView)>>>, MEMORY[0x24BDFBC90]);
  lazy protocol witness table accessor for type MapInteractionModes and conformance MapInteractionModes(&lazy protocol witness table cache variable for type SRSmartRepliesActionCardView.MapLocation and conformance SRSmartRepliesActionCardView.MapLocation, type metadata accessor for SRSmartRepliesActionCardView.MapLocation, (uint64_t)&protocol conformance descriptor for SRSmartRepliesActionCardView.MapLocation);
  return Map.init<A, B>(coordinateRegion:interactionModes:showsUserLocation:userTrackingMode:annotationItems:annotationContent:)();
}

uint64_t default argument 1 of LocalizedString(_:comment:tableName:)()
{
  return 0;
}

uint64_t associated type witness table accessor for View.Body : View in SRSmartRepliesActionCardView()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t closure #1 in SRSmartRepliesActionCardView.LocationView.body.getter()
{
  return closure #1 in SRSmartRepliesActionCardView.LocationView.body.getter();
}

{
  type metadata accessor for SRSmartRepliesActionCardView.MapLocation(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for VStack<TupleView<(SRSmartRepliesActionCardView.LocationDotView, SRSmartRepliesActionCardView.PillView)>>);
  lazy protocol witness table accessor for type [MapInteractionModes] and conformance [A](&lazy protocol witness table cache variable for type VStack<TupleView<(SRSmartRepliesActionCardView.LocationDotView, SRSmartRepliesActionCardView.PillView)>> and conformance VStack<A>, &demangling cache variable for type metadata for VStack<TupleView<(SRSmartRepliesActionCardView.LocationDotView, SRSmartRepliesActionCardView.PillView)>>, MEMORY[0x24BDF4700]);
  return MapAnnotation.init(coordinate:anchorPoint:content:)();
}

uint64_t protocol witness for View.body.getter in conformance SRSmartRepliesActionCardView.LocationView()
{
  double *v0;

  return SRSmartRepliesActionCardView.LocationView.body.getter(*v0, v0[1]);
}

uint64_t SRSmartRepliesActionCardView.ETAView.body.getter()
{
  __int128 *v0;
  __int128 *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  _QWORD *v16;
  _QWORD v18[2];
  __int128 v19;
  int64x2_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  int64x2_t v24;
  __int128 v25;

  v1 = v0;
  type metadata accessor for MapInteractionModes();
  MEMORY[0x24BDAC7A8]();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Binding<MapUserTrackingMode>?);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *((_QWORD *)v0 + 5);
  *(_QWORD *)&v23 = *((_QWORD *)v0 + 4);
  v4 = v23;
  *((_QWORD *)&v23 + 1) = v5;
  v24 = vdupq_n_s64(0x3FA999999999999AuLL);
  type metadata accessor for MKCoordinateRegion(0);
  static Binding.constant(_:)();
  v23 = v19;
  v24 = v20;
  v25 = v21;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Binding<MapUserTrackingMode>);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v3, 1, 1, v6);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SRSmartRepliesActionCardView.MapLocation>);
  v7 = (int *)type metadata accessor for SRSmartRepliesActionCardView.MapLocation(0);
  v8 = *(unsigned __int8 *)(*((_QWORD *)v7 - 1) + 80);
  v9 = (v8 + 32) & ~v8;
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_247689F70;
  v11 = v10 + v9;
  v22 = *v0;
  lazy protocol witness table accessor for type String and conformance String();
  v12 = StringProtocol.localizedLowercase.getter();
  v14 = v13;
  outlined init with take of String?((uint64_t)(v1 + 1), (uint64_t)&v22, &demangling cache variable for type metadata for String?);
  outlined retain of String?((uint64_t)&v22);
  UUID.init()();
  v15 = (uint64_t *)(v11 + v7[5]);
  *v15 = v12;
  v15[1] = v14;
  outlined init with take of String?((uint64_t)&v22, v11 + v7[6], &demangling cache variable for type metadata for String?);
  v16 = (_QWORD *)(v11 + v7[7]);
  *v16 = v4;
  v16[1] = v5;
  v18[1] = v10;
  static MapInteractionModes.all.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [SRSmartRepliesActionCardView.MapLocation]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MapAnnotation<VStack<TupleView<(SRSmartRepliesActionCardView.LocationDotView, SRSmartRepliesActionCardView.PillView)>>>);
  lazy protocol witness table accessor for type [MapInteractionModes] and conformance [A](&lazy protocol witness table cache variable for type [SRSmartRepliesActionCardView.MapLocation] and conformance [A], &demangling cache variable for type metadata for [SRSmartRepliesActionCardView.MapLocation], MEMORY[0x24BEE12D8]);
  lazy protocol witness table accessor for type [MapInteractionModes] and conformance [A](&lazy protocol witness table cache variable for type MapAnnotation<VStack<TupleView<(SRSmartRepliesActionCardView.LocationDotView, SRSmartRepliesActionCardView.PillView)>>> and conformance MapAnnotation<A>, &demangling cache variable for type metadata for MapAnnotation<VStack<TupleView<(SRSmartRepliesActionCardView.LocationDotView, SRSmartRepliesActionCardView.PillView)>>>, MEMORY[0x24BDFBC90]);
  lazy protocol witness table accessor for type MapInteractionModes and conformance MapInteractionModes(&lazy protocol witness table cache variable for type SRSmartRepliesActionCardView.MapLocation and conformance SRSmartRepliesActionCardView.MapLocation, type metadata accessor for SRSmartRepliesActionCardView.MapLocation, (uint64_t)&protocol conformance descriptor for SRSmartRepliesActionCardView.MapLocation);
  return Map.init<A, B>(coordinateRegion:interactionModes:showsUserLocation:userTrackingMode:annotationItems:annotationContent:)();
}

uint64_t closure #1 in SRSmartRepliesActionCardView.ETAView.body.getter()
{
  return closure #1 in SRSmartRepliesActionCardView.LocationView.body.getter();
}

uint64_t closure #1 in closure #1 in SRSmartRepliesActionCardView.LocationView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v4 = static HorizontalAlignment.center.getter();
  v5 = type metadata accessor for SRSmartRepliesActionCardView.MapLocation(0);
  v6 = *(int *)(v5 + 24);
  v7 = (uint64_t *)(a1 + *(int *)(v5 + 20));
  v9 = *v7;
  v8 = v7[1];
  v11 = *(_QWORD *)(a1 + v6);
  v10 = *(_QWORD *)(a1 + v6 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = v9;
  *(_QWORD *)(a2 + 48) = v8;
  *(_QWORD *)(a2 + 56) = v11;
  *(_QWORD *)(a2 + 64) = v10;
  return result;
}

uint64_t protocol witness for View.body.getter in conformance SRSmartRepliesActionCardView.ETAView()
{
  return SRSmartRepliesActionCardView.ETAView.body.getter();
}

double SRSmartRepliesActionCardView.LocationDotView.body.getter@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  double result;
  __int128 v15;
  _BYTE v16[241];
  _QWORD v17[2];
  _BYTE v18[248];
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
  __int128 v30;
  __int128 v31;
  __int128 v32;
  char v33;

  if (!a2)
    goto LABEL_5;
  v4 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v4)
  {
    _s7SwiftUI19_ConditionalContentV7StorageOyAA9EmptyViewVAA6ZStackVyAA05TupleG0VyAA08ModifiedD0VyAMyAA14RadialGradientVAA12_FrameLayoutVGAA11_ClipEffectVyAA6CircleVGG_AMyAA06_ShapeG0VyAvA5ColorVGAQGA2_tGG_GWOi_((uint64_t)v17);
  }
  else
  {
LABEL_5:
    v5 = static Alignment.center.getter();
    v7 = v6;
    closure #1 in SRSmartRepliesActionCardView.LocationDotView.body.getter((uint64_t)v18);
    v17[0] = v5;
    v17[1] = v7;
    _s7SwiftUI19_ConditionalContentV7StorageOyAA9EmptyViewVAA6ZStackVyAA05TupleG0VyAA08ModifiedD0VyAMyAA14RadialGradientVAA12_FrameLayoutVGAA11_ClipEffectVyAA6CircleVGG_AMyAA06_ShapeG0VyAvA5ColorVGAQGA2_tGG_GWOi0_((uint64_t)v17);
  }
  outlined init with take of String?((uint64_t)v17, (uint64_t)v16, &demangling cache variable for type metadata for _ConditionalContent<EmptyView, ZStack<TupleView<(ModifiedContent<ModifiedContent<RadialGradient, _FrameLayout>, _ClipEffect<Circle>>, ModifiedContent<_ShapeView<Circle, Color>, _FrameLayout>, ModifiedContent<_ShapeView<Circle, Color>, _FrameLayout>)>>>.Storage);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ZStack<TupleView<(ModifiedContent<ModifiedContent<RadialGradient, _FrameLayout>, _ClipEffect<Circle>>, ModifiedContent<_ShapeView<Circle, Color>, _FrameLayout>, ModifiedContent<_ShapeView<Circle, Color>, _FrameLayout>)>>);
  lazy protocol witness table accessor for type [MapInteractionModes] and conformance [A](&lazy protocol witness table cache variable for type ZStack<TupleView<(ModifiedContent<ModifiedContent<RadialGradient, _FrameLayout>, _ClipEffect<Circle>>, ModifiedContent<_ShapeView<Circle, Color>, _FrameLayout>, ModifiedContent<_ShapeView<Circle, Color>, _FrameLayout>)>> and conformance ZStack<A>, &demangling cache variable for type metadata for ZStack<TupleView<(ModifiedContent<ModifiedContent<RadialGradient, _FrameLayout>, _ClipEffect<Circle>>, ModifiedContent<_ShapeView<Circle, Color>, _FrameLayout>, ModifiedContent<_ShapeView<Circle, Color>, _FrameLayout>)>>, MEMORY[0x24BDF4750]);
  _ConditionalContent<>.init(storage:)();
  v8 = v31;
  *(_OWORD *)(a3 + 192) = v30;
  *(_OWORD *)(a3 + 208) = v8;
  *(_OWORD *)(a3 + 224) = v32;
  *(_BYTE *)(a3 + 240) = v33;
  v9 = v27;
  *(_OWORD *)(a3 + 128) = v26;
  *(_OWORD *)(a3 + 144) = v9;
  v10 = v29;
  *(_OWORD *)(a3 + 160) = v28;
  *(_OWORD *)(a3 + 176) = v10;
  v11 = v23;
  *(_OWORD *)(a3 + 64) = v22;
  *(_OWORD *)(a3 + 80) = v11;
  v12 = v25;
  *(_OWORD *)(a3 + 96) = v24;
  *(_OWORD *)(a3 + 112) = v12;
  v13 = v19;
  *(_OWORD *)a3 = *(_OWORD *)&v18[232];
  *(_OWORD *)(a3 + 16) = v13;
  result = *(double *)&v20;
  v15 = v21;
  *(_OWORD *)(a3 + 32) = v20;
  *(_OWORD *)(a3 + 48) = v15;
  return result;
}

double closure #1 in SRSmartRepliesActionCardView.LocationDotView.body.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  double result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[6];
  char v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  char v46;
  __int128 v47;
  _BYTE v48[7];
  _BYTE v49[11];
  __int16 v50;
  _BYTE v51[7];
  _BYTE v52[11];
  __int16 v53;
  int v54;
  __int16 v55;
  _BYTE v56[7];
  _DWORD v57[3];

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Color>);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_247689F90;
  *(_QWORD *)(v2 + 32) = static Color.clear.getter();
  *(_QWORD *)(v2 + 40) = static Color.blue.getter();
  v43 = v2;
  specialized Array._endMutation()();
  static UnitPoint.center.getter();
  v4 = v3;
  v6 = v5;
  MEMORY[0x24957F894](v2);
  MEMORY[0x24957F774](v31, v4, v6, 1.0, 70.0);
  v30 = v31[0];
  v7 = v31[1];
  v8 = v31[2];
  v9 = v31[3];
  v10 = v31[4];
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  v11 = v31[5];
  v12 = v32;
  v24 = v33;
  v13 = v34;
  v27 = v36;
  v28 = v35;
  v29 = static Color.white.getter();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  v14 = v37;
  v15 = v38;
  v16 = v39;
  v17 = v40;
  v25 = v42;
  v26 = v41;
  if (one-time initialization token for lightBlue != -1)
    swift_once();
  v18 = static Color.lightBlue;
  swift_retain();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  v19 = v43;
  v20 = v44;
  v21 = v45;
  v22 = v46;
  *(_QWORD *)a1 = v30;
  *(_QWORD *)(a1 + 8) = v7;
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = v9;
  *(_QWORD *)(a1 + 32) = v10;
  *(_QWORD *)(a1 + 40) = v11;
  *(_BYTE *)(a1 + 48) = v12;
  *(_DWORD *)(a1 + 49) = v57[0];
  *(_DWORD *)(a1 + 52) = *(_DWORD *)((char *)v57 + 3);
  *(_QWORD *)(a1 + 56) = v24;
  *(_BYTE *)(a1 + 64) = v13;
  *(_DWORD *)(a1 + 65) = *(_DWORD *)v56;
  *(_DWORD *)(a1 + 68) = *(_DWORD *)&v56[3];
  *(_QWORD *)(a1 + 72) = v28;
  *(_QWORD *)(a1 + 80) = v27;
  *(_WORD *)(a1 + 88) = 256;
  *(_WORD *)(a1 + 94) = v55;
  *(_DWORD *)(a1 + 90) = v54;
  *(_QWORD *)(a1 + 96) = v29;
  *(_WORD *)(a1 + 104) = 256;
  *(_WORD *)(a1 + 110) = v53;
  *(_DWORD *)(a1 + 106) = *(_DWORD *)&v52[7];
  *(_QWORD *)(a1 + 112) = v14;
  *(_BYTE *)(a1 + 120) = v15;
  *(_DWORD *)(a1 + 124) = *(_DWORD *)&v52[3];
  *(_DWORD *)(a1 + 121) = *(_DWORD *)v52;
  *(_QWORD *)(a1 + 128) = v16;
  *(_BYTE *)(a1 + 136) = v17;
  *(_DWORD *)(a1 + 140) = *(_DWORD *)&v51[3];
  *(_DWORD *)(a1 + 137) = *(_DWORD *)v51;
  *(_QWORD *)(a1 + 144) = v26;
  *(_QWORD *)(a1 + 152) = v25;
  *(_QWORD *)(a1 + 160) = v18;
  *(_WORD *)(a1 + 168) = 256;
  *(_WORD *)(a1 + 174) = v50;
  *(_DWORD *)(a1 + 170) = *(_DWORD *)&v49[7];
  *(_QWORD *)(a1 + 176) = v19;
  *(_BYTE *)(a1 + 184) = v20;
  *(_DWORD *)(a1 + 185) = *(_DWORD *)v49;
  *(_DWORD *)(a1 + 188) = *(_DWORD *)&v49[3];
  *(_QWORD *)(a1 + 192) = v21;
  *(_BYTE *)(a1 + 200) = v22;
  *(_DWORD *)(a1 + 201) = *(_DWORD *)v48;
  *(_DWORD *)(a1 + 204) = *(_DWORD *)&v48[3];
  result = *(double *)&v47;
  *(_OWORD *)(a1 + 208) = v47;
  return result;
}

uint64_t protocol witness for static View._viewListCount(inputs:) in conformance SRSmartRepliesActionCardView.LocationDotView()
{
  return static View._viewListCount(inputs:)();
}

double protocol witness for View.body.getter in conformance SRSmartRepliesActionCardView.LocationDotView@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return SRSmartRepliesActionCardView.LocationDotView.body.getter(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), a1);
}

uint64_t SRSmartRepliesActionCardView.PillView.body.getter@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  char v6;
  uint64_t KeyPath;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  char v41;
  char v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[48];
  __int128 v49;
  __int128 v50;
  _BYTE v51[25];

  v38 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ClipEffect<Capsule>);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Capsule();
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = static VerticalAlignment.center.getter();
  closure #1 in SRSmartRepliesActionCardView.PillView.body.getter((uint64_t)&v43);
  v35 = *((_QWORD *)&v43 + 1);
  v36 = v43;
  v34 = v44;
  v6 = BYTE8(v44);
  v33 = v45;
  v32 = static Color.white.getter();
  KeyPath = swift_getKeyPath();
  v8 = static Edge.Set.horizontal.getter();
  v41 = 1;
  v40 = v6;
  v39 = 1;
  v9 = static Edge.Set.vertical.getter();
  EdgeInsets.init(_all:)();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = v41;
  v19 = v40;
  v20 = v39;
  v42 = 0;
  if (one-time initialization token for lightBlue != -1)
    swift_once();
  v21 = static Color.lightBlue;
  swift_retain();
  v22 = static Edge.Set.all.getter();
  v43 = (unint64_t)v37;
  LOBYTE(v44) = v18;
  *((_QWORD *)&v44 + 1) = v36;
  *(_QWORD *)&v45 = v35;
  *((_QWORD *)&v45 + 1) = v34;
  LOBYTE(v46) = v19;
  *((_QWORD *)&v46 + 1) = v33;
  *(_QWORD *)&v47 = KeyPath;
  *((_QWORD *)&v47 + 1) = v32;
  v48[0] = v8;
  memset(&v48[8], 0, 32);
  v48[40] = v20;
  LOBYTE(v49) = v9;
  *((_QWORD *)&v49 + 1) = v11;
  *(_QWORD *)&v50 = v13;
  *((_QWORD *)&v50 + 1) = v15;
  *(_QWORD *)v51 = v17;
  v51[8] = v42;
  *(_QWORD *)&v51[16] = v21;
  v51[24] = v22;
  v23 = *MEMORY[0x24BDEEB68];
  v24 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 104))(v5, v23, v24);
  outlined init with copy of Capsule((uint64_t)v5, (uint64_t)v3);
  *(_WORD *)&v3[*(int *)(v38 + 36)] = 256;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>>, _PaddingLayout>, _PaddingLayout>, _BackgroundStyleModifier<Color>>, _ClipEffect<Capsule>>);
  outlined init with copy of _ClipEffect<Capsule>((uint64_t)v3, (uint64_t)a1 + *(int *)(v25 + 36));
  v26 = v50;
  a1[8] = v49;
  a1[9] = v26;
  a1[10] = *(_OWORD *)v51;
  *(_OWORD *)((char *)a1 + 169) = *(_OWORD *)&v51[9];
  v27 = *(_OWORD *)v48;
  a1[4] = v47;
  a1[5] = v27;
  v28 = *(_OWORD *)&v48[32];
  a1[6] = *(_OWORD *)&v48[16];
  a1[7] = v28;
  v29 = v44;
  *a1 = v43;
  a1[1] = v29;
  v30 = v46;
  a1[2] = v45;
  a1[3] = v30;
  outlined retain of ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>>, _PaddingLayout>, _PaddingLayout>, _BackgroundStyleModifier<Color>>((uint64_t)&v43);
  outlined destroy of Environment<ColorScheme>.Content((uint64_t)v3, &demangling cache variable for type metadata for _ClipEffect<Capsule>);
  outlined destroy of Capsule((uint64_t)v5);
  return outlined release of ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>>, _PaddingLayout>, _PaddingLayout>, _BackgroundStyleModifier<Color>>((uint64_t)&v43);
}

uint64_t closure #1 in SRSmartRepliesActionCardView.PillView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;

  swift_bridgeObjectRetain();
  v2 = Image.init(_internalSystemName:)();
  lazy protocol witness table accessor for type String and conformance String();
  swift_bridgeObjectRetain();
  v3 = Text.init<A>(_:)();
  v5 = v4;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  v7 = v6 & 1;
  *(_QWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 24) = v6 & 1;
  *(_QWORD *)(a1 + 32) = v8;
  swift_retain();
  outlined copy of Text.Storage(v3, v5, v7);
  swift_bridgeObjectRetain();
  outlined consume of Text.Storage(v3, v5, v7);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for View.body.getter in conformance SRSmartRepliesActionCardView.PillView@<X0>(_OWORD *a1@<X8>)
{
  return SRSmartRepliesActionCardView.PillView.body.getter(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for SRSmartRepliesActionCardView(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = type metadata accessor for ColorScheme();
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

void destroy for SRSmartRepliesActionCardView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }

}

_QWORD *initializeWithCopy for SRSmartRepliesActionCardView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = type metadata accessor for ColorScheme();
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

_QWORD *assignWithCopy for SRSmartRepliesActionCardView(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
    outlined destroy of Environment<ColorScheme>.Content((uint64_t)a1, &demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = type metadata accessor for ColorScheme();
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

char *initializeWithTake for SRSmartRepliesActionCardView(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = type metadata accessor for ColorScheme();
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

char *assignWithTake for SRSmartRepliesActionCardView(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (a1 != a2)
  {
    outlined destroy of Environment<ColorScheme>.Content((uint64_t)a1, &demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = type metadata accessor for ColorScheme();
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

uint64_t getEnumTagSinglePayload for SRSmartRepliesActionCardView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2476883D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for SRSmartRepliesActionCardView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247688464(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

void type metadata completion function for SRSmartRepliesActionCardView()
{
  unint64_t v0;

  type metadata accessor for Environment<ColorScheme>.Content();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void type metadata accessor for Environment<ColorScheme>.Content()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for Environment<ColorScheme>.Content)
  {
    type metadata accessor for ColorScheme();
    v0 = type metadata accessor for Environment.Content();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Environment<ColorScheme>.Content);
  }
}

unint64_t lazy protocol witness table accessor for type _ConditionalContent<_ConditionalContent<_ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>>, Text>, Text> and conformance <> _ConditionalContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type _ConditionalContent<_ConditionalContent<_ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>>, Text>, Text> and conformance <> _ConditionalContent<A, B>;
  if (!lazy protocol witness table cache variable for type _ConditionalContent<_ConditionalContent<_ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>>, Text>, Text> and conformance <> _ConditionalContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for _ConditionalContent<_ConditionalContent<_ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>>, Text>, Text>);
    v2[0] = lazy protocol witness table accessor for type _ConditionalContent<_ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>>, Text> and conformance <> _ConditionalContent<A, B>();
    v2[1] = MEMORY[0x24BDF1F80];
    result = MEMORY[0x24957FA08](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _ConditionalContent<_ConditionalContent<_ConditionalContent<_ConditionalContent<SRSmartRepliesActionCardView.LocationView, SRSmartRepliesActionCardView.ETAView>, _ConditionalContent<Text, Text>>, Text>, Text> and conformance <> _ConditionalContent<A, B>);
  }
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CLLocationCoordinate2D(uint64_t a1)
{
  type metadata accessor for CLLocationCoordinate2D(a1, &lazy cache variable for type metadata for CLLocationCoordinate2D);
}

uint64_t destroy for SRSmartRepliesActionCardView.ETAView()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SRSmartRepliesActionCardView.ETAView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for SRSmartRepliesActionCardView.ETAView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
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

uint64_t assignWithTake for SRSmartRepliesActionCardView.ETAView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SRSmartRepliesActionCardView.ETAView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SRSmartRepliesActionCardView.ETAView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void *type metadata accessor for SRSmartRepliesActionCardView.ETAView()
{
  return &unk_2518CEAC8;
}

uint64_t getEnumTagSinglePayload for SRSmartRepliesActionCardView.LocationView(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SRSmartRepliesActionCardView.LocationView(uint64_t result, int a2, int a3)
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

void *type metadata accessor for SRSmartRepliesActionCardView.LocationView()
{
  return &unk_2518CEB50;
}

uint64_t associated type witness table accessor for View.Body : View in SRSmartRepliesActionCardView.ETAView()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t associated type witness table accessor for View.Body : View in SRSmartRepliesActionCardView.LocationView()
{
  return swift_getOpaqueTypeConformance2();
}

void type metadata accessor for MKCoordinateRegion(uint64_t a1)
{
  type metadata accessor for CLLocationCoordinate2D(a1, &lazy cache variable for type metadata for MKCoordinateRegion);
}

uint64_t type metadata accessor for SRSmartRepliesActionCardView.MapLocation(uint64_t a1)
{
  return type metadata accessor for SRSmartRepliesActionCardView(a1, (uint64_t *)&type metadata singleton initialization cache for SRSmartRepliesActionCardView.MapLocation);
}

uint64_t type metadata accessor for SRSmartRepliesActionCardView(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t one-time initialization function for lightBlue()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  type metadata accessor for Color.RGBColorSpace();
  MEMORY[0x24BDAC7A8]();
  v1 = (char *)&v4 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD))(v2 + 104))(v1, *MEMORY[0x24BDF3C28]);
  result = MEMORY[0x24957F864](v1, 0.278431373, 0.57254902, 242.0, 1.0);
  static Color.lightBlue = result;
  return result;
}

uint64_t lazy protocol witness table accessor for type MapInteractionModes and conformance MapInteractionModes(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24957FA08](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t partial apply for closure #1 in closure #1 in SRSmartRepliesActionCardView.LocationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return closure #1 in closure #1 in SRSmartRepliesActionCardView.LocationView.body.getter(*(_QWORD *)(v1 + 16), a1);
}

uint64_t outlined retain of String?(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for SRSmartRepliesActionCardView.PillView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SRSmartRepliesActionCardView.PillView()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for SRSmartRepliesActionCardView.PillView(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for SRSmartRepliesActionCardView.PillView(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for SRSmartRepliesActionCardView.PillView(_QWORD *a1, _QWORD *a2)
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

uint64_t getEnumTagSinglePayload for SRSmartRepliesActionCardView.PillView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SRSmartRepliesActionCardView.PillView(uint64_t result, int a2, int a3)
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

void *type metadata accessor for SRSmartRepliesActionCardView.PillView()
{
  return &unk_2518CEBD0;
}

_QWORD *initializeBufferWithCopyOfBuffer for SRSmartRepliesActionCardView.LocationDotView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SRSmartRepliesActionCardView.LocationDotView()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for SRSmartRepliesActionCardView.LocationDotView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for SRSmartRepliesActionCardView.LocationDotView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SRSmartRepliesActionCardView.LocationDotView(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SRSmartRepliesActionCardView.LocationDotView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
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

void *type metadata accessor for SRSmartRepliesActionCardView.LocationDotView()
{
  return &unk_2518CEC50;
}

uint64_t getEnumTagSinglePayload for MKCoordinateRegion(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for MKCoordinateRegion(uint64_t result, int a2, int a3)
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

uint64_t *initializeBufferWithCopyOfBuffer for SRSmartRepliesActionCardView.MapLocation(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for UUID();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = (uint64_t *)((char *)a1 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (uint64_t *)((char *)a1 + v9);
    v14 = (uint64_t *)((char *)a2 + v9);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for SRSmartRepliesActionCardView.MapLocation(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SRSmartRepliesActionCardView.MapLocation(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = (_QWORD *)(a1 + v8);
  v13 = (_QWORD *)(a2 + v8);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SRSmartRepliesActionCardView.MapLocation(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[6];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13 = a3[7];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (_QWORD *)(a2 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  return a1;
}

uint64_t initializeWithTake for SRSmartRepliesActionCardView.MapLocation(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for SRSmartRepliesActionCardView.MapLocation(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = a3[6];
  v13 = (_QWORD *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v16 = *v14;
  v15 = v14[1];
  *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t getEnumTagSinglePayload for SRSmartRepliesActionCardView.MapLocation()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24768917C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for UUID();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for SRSmartRepliesActionCardView.MapLocation()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247689208(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for UUID();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t type metadata completion function for SRSmartRepliesActionCardView.MapLocation()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_247689308()
{
  return lazy protocol witness table accessor for type [MapInteractionModes] and conformance [A](&lazy protocol witness table cache variable for type Map<_DefaultAnnotatedMapContent<[SRSmartRepliesActionCardView.MapLocation]>> and conformance Map<A>, &demangling cache variable for type metadata for Map<_DefaultAnnotatedMapContent<[SRSmartRepliesActionCardView.MapLocation]>>, MEMORY[0x24BDFBC78]);
}

uint64_t associated type witness table accessor for View.Body : View in SRSmartRepliesActionCardView.LocationDotView()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t associated type witness table accessor for View.Body : View in SRSmartRepliesActionCardView.PillView()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t associated type witness table accessor for Identifiable.ID : Hashable in SRSmartRepliesActionCardView.MapLocation()
{
  return lazy protocol witness table accessor for type MapInteractionModes and conformance MapInteractionModes(&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
}

uint64_t key path getter for EnvironmentValues.foregroundColor : EnvironmentValues, serialized@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for EnvironmentValues.foregroundColor : EnvironmentValues, serialized()
{
  swift_retain();
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t outlined init with copy of Capsule(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Capsule();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of _ClipEffect<Capsule>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ClipEffect<Capsule>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined retain of ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>>, _PaddingLayout>, _PaddingLayout>, _BackgroundStyleModifier<Color>>(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_BYTE *)(a1 + 48);
  swift_retain();
  outlined copy of Text.Storage(v2, v3, v4);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t outlined destroy of Environment<ColorScheme>.Content(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined destroy of Capsule(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for Capsule();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined release of ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>>, _PaddingLayout>, _PaddingLayout>, _BackgroundStyleModifier<Color>>(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_BYTE *)(a1 + 48);
  swift_release();
  outlined consume of Text.Storage(v2, v3, v4);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

uint64_t _s7SwiftUI19_ConditionalContentV7StorageOyAA9EmptyViewVAA6ZStackVyAA05TupleG0VyAA08ModifiedD0VyAMyAA14RadialGradientVAA12_FrameLayoutVGAA11_ClipEffectVyAA6CircleVGG_AMyAA06_ShapeG0VyAvA5ColorVGAQGA2_tGG_GWOi0_(uint64_t result)
{
  *(_BYTE *)(result + 240) = 1;
  return result;
}

uint64_t outlined init with take of String?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t _s7SwiftUI19_ConditionalContentV7StorageOyAA9EmptyViewVAA6ZStackVyAA05TupleG0VyAA08ModifiedD0VyAMyAA14RadialGradientVAA12_FrameLayoutVGAA11_ClipEffectVyAA6CircleVGG_AMyAA06_ShapeG0VyAvA5ColorVGAQGA2_tGG_GWOi_(uint64_t result)
{
  *(_BYTE *)(result + 240) = 0;
  return result;
}

void type metadata accessor for MKCoordinateSpan(uint64_t a1)
{
  type metadata accessor for CLLocationCoordinate2D(a1, &lazy cache variable for type metadata for MKCoordinateSpan);
}

void type metadata accessor for CLLocationCoordinate2D(uint64_t a1, unint64_t *a2)
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

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>>, _PaddingLayout>, _PaddingLayout>, _BackgroundStyleModifier<Color>>, _ClipEffect<Capsule>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>>, _PaddingLayout>, _PaddingLayout>, _BackgroundStyleModifier<Color>>, _ClipEffect<Capsule>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>>, _PaddingLayout>, _PaddingLayout>, _BackgroundStyleModifier<Color>>, _ClipEffect<Capsule>> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>>, _PaddingLayout>, _PaddingLayout>, _BackgroundStyleModifier<Color>>, _ClipEffect<Capsule>>);
    v2[0] = lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>>, _PaddingLayout>, _PaddingLayout>, _BackgroundStyleModifier<Color>> and conformance <> ModifiedContent<A, B>();
    v2[1] = lazy protocol witness table accessor for type [MapInteractionModes] and conformance [A](&lazy protocol witness table cache variable for type _ClipEffect<Capsule> and conformance _ClipEffect<A>, &demangling cache variable for type metadata for _ClipEffect<Capsule>, MEMORY[0x24BDEB950]);
    result = MEMORY[0x24957FA08](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>>, _PaddingLayout>, _PaddingLayout>, _BackgroundStyleModifier<Color>>, _ClipEffect<Capsule>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>>, _PaddingLayout>, _PaddingLayout>, _BackgroundStyleModifier<Color>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>>, _PaddingLayout>, _PaddingLayout>, _BackgroundStyleModifier<Color>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>>, _PaddingLayout>, _PaddingLayout>, _BackgroundStyleModifier<Color>> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>>, _PaddingLayout>, _PaddingLayout>, _BackgroundStyleModifier<Color>>);
    v2[0] = lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>>, _PaddingLayout>, _PaddingLayout> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>>, _PaddingLayout>, _PaddingLayout>, lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
    v2[1] = lazy protocol witness table accessor for type [MapInteractionModes] and conformance [A](&lazy protocol witness table cache variable for type _BackgroundStyleModifier<Color> and conformance _BackgroundStyleModifier<A>, &demangling cache variable for type metadata for _BackgroundStyleModifier<Color>, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x24957FA08](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>>, _PaddingLayout>, _PaddingLayout>, _BackgroundStyleModifier<Color>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3();
    v7[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x24957FA08](MEMORY[0x24BDED308], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>()
{
  return lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>>, _PaddingLayout>, (uint64_t (*)(void))lazy protocol witness table accessor for type ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>> and conformance <> ModifiedContent<A, B>);
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>>);
    v2[0] = lazy protocol witness table accessor for type [MapInteractionModes] and conformance [A](&lazy protocol witness table cache variable for type HStack<TupleView<(Image, Text)>> and conformance HStack<A>, &demangling cache variable for type metadata for HStack<TupleView<(Image, Text)>>, MEMORY[0x24BDF4498]);
    v2[1] = lazy protocol witness table accessor for type [MapInteractionModes] and conformance [A](&lazy protocol witness table cache variable for type _EnvironmentKeyWritingModifier<Color?> and conformance _EnvironmentKeyWritingModifier<A>, &demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<Color?>, MEMORY[0x24BDF1028]);
    result = MEMORY[0x24957FA08](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<HStack<TupleView<(Image, Text)>>, _EnvironmentKeyWritingModifier<Color?>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type [MapInteractionModes] and conformance [A](unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24957FA08](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type _ConditionalContent<EmptyView, ZStack<TupleView<(ModifiedContent<ModifiedContent<RadialGradient, _FrameLayout>, _ClipEffect<Circle>>, ModifiedContent<_ShapeView<Circle, Color>, _FrameLayout>, ModifiedContent<_ShapeView<Circle, Color>, _FrameLayout>)>>> and conformance <> _ConditionalContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = lazy protocol witness table cache variable for type _ConditionalContent<EmptyView, ZStack<TupleView<(ModifiedContent<ModifiedContent<RadialGradient, _FrameLayout>, _ClipEffect<Circle>>, ModifiedContent<_ShapeView<Circle, Color>, _FrameLayout>, ModifiedContent<_ShapeView<Circle, Color>, _FrameLayout>)>>> and conformance <> _ConditionalContent<A, B>;
  if (!lazy protocol witness table cache variable for type _ConditionalContent<EmptyView, ZStack<TupleView<(ModifiedContent<ModifiedContent<RadialGradient, _FrameLayout>, _ClipEffect<Circle>>, ModifiedContent<_ShapeView<Circle, Color>, _FrameLayout>, ModifiedContent<_ShapeView<Circle, Color>, _FrameLayout>)>>> and conformance <> _ConditionalContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for _ConditionalContent<EmptyView, ZStack<TupleView<(ModifiedContent<ModifiedContent<RadialGradient, _FrameLayout>, _ClipEffect<Circle>>, ModifiedContent<_ShapeView<Circle, Color>, _FrameLayout>, ModifiedContent<_ShapeView<Circle, Color>, _FrameLayout>)>>>);
    v2 = lazy protocol witness table accessor for type [MapInteractionModes] and conformance [A](&lazy protocol witness table cache variable for type ZStack<TupleView<(ModifiedContent<ModifiedContent<RadialGradient, _FrameLayout>, _ClipEffect<Circle>>, ModifiedContent<_ShapeView<Circle, Color>, _FrameLayout>, ModifiedContent<_ShapeView<Circle, Color>, _FrameLayout>)>> and conformance ZStack<A>, &demangling cache variable for type metadata for ZStack<TupleView<(ModifiedContent<ModifiedContent<RadialGradient, _FrameLayout>, _ClipEffect<Circle>>, ModifiedContent<_ShapeView<Circle, Color>, _FrameLayout>, ModifiedContent<_ShapeView<Circle, Color>, _FrameLayout>)>>, MEMORY[0x24BDF4750]);
    v3[0] = MEMORY[0x24BDF5138];
    v3[1] = v2;
    result = MEMORY[0x24957FA08](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _ConditionalContent<EmptyView, ZStack<TupleView<(ModifiedContent<ModifiedContent<RadialGradient, _FrameLayout>, _ClipEffect<Circle>>, ModifiedContent<_ShapeView<Circle, Color>, _FrameLayout>, ModifiedContent<_ShapeView<Circle, Color>, _FrameLayout>)>>> and conformance <> _ConditionalContent<A, B>);
  }
  return result;
}

Swift::String __swiftcall LocalizedString(_:comment:tableName:)(Swift::String _, Swift::String comment, Swift::String_optional tableName)
{
  void *object;
  uint64_t countAndFlagsBits;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  Swift::String v9;
  Swift::String_optional v10;
  Swift::String v11;
  uint64_t v12;
  void *v13;
  Swift::String v14;
  Swift::String result;
  Swift::String v16;

  object = tableName.value._object;
  countAndFlagsBits = tableName.value._countAndFlagsBits;
  v5 = comment._object;
  v6 = comment._countAndFlagsBits;
  v7 = _._object;
  v8 = _._countAndFlagsBits;
  if (one-time initialization token for current != -1)
    swift_once();
  v16._object = v5;
  v9._countAndFlagsBits = v8;
  v9._object = v7;
  v10.value._countAndFlagsBits = countAndFlagsBits;
  v10.value._object = object;
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  v16._countAndFlagsBits = v6;
  v14 = NSLocalizedString(_:tableName:bundle:value:comment:)(v9, v10, (NSBundle)static NSBundle.current, v11, v16);
  v13 = v14._object;
  v12 = v14._countAndFlagsBits;
  result._object = v13;
  result._countAndFlagsBits = v12;
  return result;
}

uint64_t NSBundle.Sentinel.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

id one-time initialization function for current()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for NSBundle.Sentinel();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  static NSBundle.current = (uint64_t)result;
  return result;
}

uint64_t *NSBundle.current.unsafeMutableAddressor()
{
  if (one-time initialization token for current != -1)
    swift_once();
  return &static NSBundle.current;
}

id static NSBundle.current.getter()
{
  if (one-time initialization token for current != -1)
    swift_once();
  return (id)static NSBundle.current;
}

uint64_t type metadata accessor for NSBundle.Sentinel()
{
  return objc_opt_self();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5;
  void *v6;
  Swift::String result;

  v5 = MEMORY[0x24BDCC6D8](_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t UUID.init()()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t SRSmartRepliesActionType.rawValue.getter()
{
  return MEMORY[0x24BEAA4B8]();
}

uint64_t SRSmartRepliesActionMetadata.hasRichActionType.getter()
{
  return MEMORY[0x24BEAA4C0]();
}

uint64_t SRSmartRepliesActionMetadata.locationLatitude.getter()
{
  return MEMORY[0x24BEAA4C8]();
}

uint64_t SRSmartRepliesActionMetadata.locationLongitude.getter()
{
  return MEMORY[0x24BEAA4D0]();
}

uint64_t SRSmartRepliesActionMetadata.stringRepresentation.getter()
{
  return MEMORY[0x24BEAA4D8]();
}

uint64_t SRSmartRepliesActionMetadata.type.getter()
{
  return MEMORY[0x24BEAA4E0]();
}

uint64_t SRSmartRepliesActionMetadata.title.getter()
{
  return MEMORY[0x24BEAA4E8]();
}

uint64_t SRSmartRepliesActionMetadata.imageName.getter()
{
  return MEMORY[0x24BEAA4F0]();
}

uint64_t Map.init<A, B>(coordinateRegion:interactionModes:showsUserLocation:userTrackingMode:annotationItems:annotationContent:)()
{
  return MEMORY[0x24BDFBC48]();
}

uint64_t MapAnnotation.init(coordinate:anchorPoint:content:)()
{
  return MEMORY[0x24BDFBC80]();
}

uint64_t static MapInteractionModes.all.getter()
{
  return MEMORY[0x24BDFBD30]();
}

uint64_t type metadata accessor for MapInteractionModes()
{
  return MEMORY[0x24BDFBD48]();
}

uint64_t EdgeInsets.init(_all:)()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t type metadata accessor for ColorScheme()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t type metadata accessor for Environment.Content()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t RadialGradient.init(gradient:center:startRadius:endRadius:)()
{
  return MEMORY[0x24BDECA60]();
}

uint64_t EnvironmentValues.colorScheme.getter()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t EnvironmentValues.colorScheme.setter()
{
  return MEMORY[0x24BDEDEF8]();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t static VerticalAlignment.center.getter()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t static Edge.Set.horizontal.getter()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t static Edge.Set.all.getter()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t static Edge.Set.vertical.getter()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t Text.init<A>(_:)()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t static View._makeView(view:inputs:)()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t static View._viewListCount(inputs:)()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t type metadata accessor for Color.RGBColorSpace()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t static Color.blue.getter()
{
  return MEMORY[0x24BDF3C90]();
}

uint64_t static Color.clear.getter()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t static Color.white.getter()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t Color.init(_:red:green:blue:opacity:)()
{
  return MEMORY[0x24BDF3E70]();
}

uint64_t Image.init(_internalSystemName:)()
{
  return MEMORY[0x24BDF4048]();
}

uint64_t static Binding.constant(_:)()
{
  return MEMORY[0x24BDF4808]();
}

uint64_t type metadata accessor for Capsule()
{
  return MEMORY[0x24BDF48E8]();
}

uint64_t Gradient.init(colors:)()
{
  return MEMORY[0x24BDF4D08]();
}

uint64_t static Alignment.center.getter()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t static UnitPoint.center.getter()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t StringProtocol.localizedLowercase.getter()
{
  return MEMORY[0x24BDD0530]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x24BEE22C0]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

