uint64_t CLBeaconIdentityConstraint.major.getter()
{
  return CLBeaconIdentityConstraint.major.getter((SEL *)&selRef_major);
}

uint64_t CLBeaconIdentityConstraint.minor.getter()
{
  return CLBeaconIdentityConstraint.major.getter((SEL *)&selRef_minor);
}

uint64_t CLBeaconIdentityConstraint.major.getter(SEL *a1)
{
  void *v1;
  id v2;
  void *v3;
  unsigned int v4;

  v2 = objc_msgSend(v1, *a1);
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, sel_unsignedShortValue);

  }
  else
  {
    v4 = 0;
  }
  return v4 | ((v3 == 0) << 16);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CLLocationCoordinate2D(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CLLocationCoordinate2D(uint64_t result, int a2, int a3)
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

void type metadata accessor for CLLocationCoordinate2D(uint64_t a1)
{
  type metadata accessor for CLLocationCoordinate2D(a1, &lazy cache variable for type metadata for CLLocationCoordinate2D);
}

void type metadata accessor for related decl 'e' for CLError(uint64_t a1)
{
  type metadata accessor for CLLocationCoordinate2D(a1, &lazy cache variable for type metadata for related decl 'e' for CLError);
}

_QWORD *protocol witness for OptionSet.init(rawValue:) in conformance CLClientDiagnosticMask@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

id protocol witness for _BridgedStoredNSError._nsError.getter in conformance related decl 'e' for CLError()
{
  id *v0;

  return *v0;
}

uint64_t protocol witness for _BridgedStoredNSError.init(_nsError:) in conformance related decl 'e' for CLError@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t protocol witness for static CustomNSError.errorDomain.getter in conformance related decl 'e' for CLError()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t protocol witness for CustomNSError.errorCode.getter in conformance related decl 'e' for CLError()
{
  lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for CLError, (uint64_t)&protocol conformance descriptor for related decl 'e' for CLError);
  return _BridgedStoredNSError.errorCode.getter();
}

uint64_t protocol witness for CustomNSError.errorUserInfo.getter in conformance related decl 'e' for CLError()
{
  lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for CLError, (uint64_t)&protocol conformance descriptor for related decl 'e' for CLError);
  return _BridgedStoredNSError.errorUserInfo.getter();
}

uint64_t protocol witness for _ObjectiveCBridgeableError.init(_bridgedNSError:) in conformance related decl 'e' for CLError(void *a1)
{
  id v2;

  lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for CLError, (uint64_t)&protocol conformance descriptor for related decl 'e' for CLError);
  v2 = a1;
  return _BridgedStoredNSError.init(_bridgedNSError:)();
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance related decl 'e' for CLError()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = *v0;
  v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance related decl 'e' for CLError()
{
  lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for CLError, (uint64_t)&protocol conformance descriptor for related decl 'e' for CLError);
  return _BridgedStoredNSError.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance related decl 'e' for CLError()
{
  Hasher.init(_seed:)();
  dispatch thunk of Hashable.hash(into:)();
  return Hasher._finalize()();
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance CLError@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance CLError(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t protocol witness for Error._domain.getter in conformance related decl 'e' for CLError()
{
  lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for CLError, (uint64_t)&protocol conformance descriptor for related decl 'e' for CLError);
  return Error<>._domain.getter();
}

uint64_t protocol witness for Error._code.getter in conformance related decl 'e' for CLError()
{
  lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for CLError, (uint64_t)&protocol conformance descriptor for related decl 'e' for CLError);
  return Error<>._code.getter();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance related decl 'e' for CLError()
{
  lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for CLError, (uint64_t)&protocol conformance descriptor for related decl 'e' for CLError);
  return _BridgedStoredNSError._getEmbeddedNSError()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance related decl 'e' for CLError()
{
  lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for CLError, (uint64_t)&protocol conformance descriptor for related decl 'e' for CLError);
  return static _BridgedStoredNSError.== infix(_:_:)();
}

uint64_t base witness table accessor for Equatable in related decl 'e' for CLError()
{
  return lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for CLError, (uint64_t)&protocol conformance descriptor for related decl 'e' for CLError);
}

uint64_t base witness table accessor for Error in related decl 'e' for CLError()
{
  return lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for CLError, (uint64_t)&protocol conformance descriptor for related decl 'e' for CLError);
}

uint64_t lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x20BD03A18](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t base witness table accessor for CustomNSError in related decl 'e' for CLError()
{
  return lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for CLError, (uint64_t)&protocol conformance descriptor for related decl 'e' for CLError);
}

uint64_t base witness table accessor for _ObjectiveCBridgeableError in related decl 'e' for CLError()
{
  return lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for CLError, (uint64_t)&protocol conformance descriptor for related decl 'e' for CLError);
}

uint64_t base witness table accessor for Hashable in related decl 'e' for CLError()
{
  return lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for CLError, (uint64_t)&protocol conformance descriptor for related decl 'e' for CLError);
}

uint64_t associated type witness table accessor for _BridgedStoredNSError.Code : _ErrorCodeProtocol in related decl 'e' for CLError()
{
  return lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type CLError and conformance CLError, (uint64_t (*)(uint64_t))type metadata accessor for CLError, (uint64_t)&protocol conformance descriptor for CLError);
}

void type metadata accessor for CLError(uint64_t a1)
{
  type metadata accessor for CLLocationCoordinate2D(a1, &lazy cache variable for type metadata for CLError);
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

uint64_t associated type witness table accessor for _BridgedStoredNSError.Code : RawRepresentable in related decl 'e' for CLError()
{
  return lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type CLError and conformance CLError, (uint64_t (*)(uint64_t))type metadata accessor for CLError, (uint64_t)&protocol conformance descriptor for CLError);
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    result = MEMORY[0x20BD03A18](MEMORY[0x24BEE17C8], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
}

uint64_t base witness table accessor for Equatable in CLError()
{
  return lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type CLError and conformance CLError, (uint64_t (*)(uint64_t))type metadata accessor for CLError, (uint64_t)&protocol conformance descriptor for CLError);
}

uint64_t associated type witness table accessor for _ErrorCodeProtocol._ErrorType : _BridgedStoredNSError in CLError()
{
  return lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError((unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError, (uint64_t (*)(uint64_t))type metadata accessor for related decl 'e' for CLError, (uint64_t)&protocol conformance descriptor for related decl 'e' for CLError);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CLError(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t one-time initialization function for logger()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, logger);
  __swift_project_value_buffer(v0, (uint64_t)logger);
  return Logger.init(subsystem:category:)();
}

{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, logger);
  __swift_project_value_buffer(v0, (uint64_t)logger);
  return Logger.init(subsystem:category:)();
}

{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, logger);
  __swift_project_value_buffer(v0, (uint64_t)logger);
  return Logger.init(subsystem:category:)();
}

{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, logger);
  __swift_project_value_buffer(v0, (uint64_t)logger);
  return Logger.init(subsystem:category:)();
}

uint64_t objcConditionToSwifty(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  unsigned __int16 v20;
  BOOL v21;
  BOOL v22;
  uint64_t v23;
  uint64_t *boxed_opaque_existential_1;
  char *v25;
  char *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36[3];
  ValueMetadata *v37;
  unint64_t v38;

  v4 = type metadata accessor for UUID();
  v5 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v36[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(a2 + 32) = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  if (a1)
  {
    objc_opt_self();
    v9 = (void *)swift_dynamicCastObjCClass();
    if (v9)
    {
      objc_msgSend(v9, sel_altitude);
      v11 = v10;
      outlined destroy of CLMonitor.Event?(a2, &demangling cache variable for type metadata for CLCondition?);
      v37 = &type metadata for CLMonitor.MinimumAltitudeCondition;
      v38 = lazy protocol witness table accessor for type CLMonitor.MinimumAltitudeCondition and conformance CLMonitor.MinimumAltitudeCondition();
      v36[0] = v11;
      outlined init with take of CLCondition?((uint64_t)v36, a2);
    }
    objc_opt_self();
    v12 = swift_dynamicCastObjCClass();
    if (v12)
    {
      v13 = (void *)v12;
      v14 = a1;
      v15 = objc_msgSend(v13, sel_UUID);
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      v16 = objc_msgSend(v13, sel_major);
      v17 = v16;
      if (v16)
      {
        HIDWORD(v35) = objc_msgSend(v16, sel_unsignedShortValue);

      }
      else
      {
        HIDWORD(v35) = 0;
      }
      v18 = objc_msgSend(v13, sel_minor);
      v19 = v18;
      if (v18)
      {
        v20 = (unsigned __int16)objc_msgSend(v18, sel_unsignedShortValue);

        outlined destroy of CLMonitor.Event?(a2, &demangling cache variable for type metadata for CLCondition?);
      }
      else
      {
        outlined destroy of CLMonitor.Event?(a2, &demangling cache variable for type metadata for CLCondition?);

        v20 = 0;
      }
      v21 = v19 == 0;
      v22 = v17 == 0;
      v23 = type metadata accessor for CLMonitor.BeaconIdentityCondition(0);
      v37 = (ValueMetadata *)v23;
      v38 = lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition and conformance CLMonitor.BeaconIdentityCondition, type metadata accessor for CLMonitor.BeaconIdentityCondition, (uint64_t)&protocol conformance descriptor for CLMonitor.BeaconIdentityCondition);
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v36);
      (*(void (**)(uint64_t *, char *, uint64_t))(v5 + 32))(boxed_opaque_existential_1, v8, v4);
      v25 = (char *)boxed_opaque_existential_1 + *(int *)(v23 + 20);
      *(_WORD *)v25 = WORD2(v35);
      v25[2] = v22;
      v26 = (char *)boxed_opaque_existential_1 + *(int *)(v23 + 24);
      *(_WORD *)v26 = v20;
      v26[2] = v21;
      outlined init with take of CLCondition?((uint64_t)v36, a2);
    }
    objc_opt_self();
    result = swift_dynamicCastObjCClass();
    if (result)
    {
      v27 = (void *)result;
      v28 = a1;
      objc_msgSend(v27, sel_center);
      v30 = v29;
      v32 = v31;
      objc_msgSend(v27, sel_radius);
      v34 = v33;

      outlined destroy of CLMonitor.Event?(a2, &demangling cache variable for type metadata for CLCondition?);
      v37 = &type metadata for CLMonitor.CircularGeographicCondition;
      v38 = lazy protocol witness table accessor for type CLMonitor.CircularGeographicCondition and conformance CLMonitor.CircularGeographicCondition();
      v36[0] = v30;
      v36[1] = v32;
      v36[2] = v34;
      return outlined init with take of CLCondition?((uint64_t)v36, a2);
    }
  }
  return result;
}

CoreLocation::CLMonitor::MinimumAltitudeCondition __swiftcall CLMonitor.MinimumAltitudeCondition.init(altitude:)(CoreLocation::CLMonitor::MinimumAltitudeCondition altitude)
{
  CoreLocation::CLMonitor::MinimumAltitudeCondition *v1;

  v1->altitude = altitude.altitude;
  return altitude;
}

CoreLocation::CLMonitor::CircularGeographicCondition __swiftcall CLMonitor.CircularGeographicCondition.init(center:radius:)(__C::CLLocationCoordinate2D center, Swift::Double radius)
{
  Swift::Double *v2;
  CoreLocation::CLMonitor::CircularGeographicCondition result;

  *v2 = center.latitude;
  v2[1] = center.longitude;
  v2[2] = radius;
  result.center.longitude = center.longitude;
  result.center.latitude = center.latitude;
  result.radius = radius;
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance CLMonitor.Options()
{
  lazy protocol witness table accessor for type CLMonitor.Options and conformance CLMonitor.Options();
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance CLMonitor.Options()
{
  lazy protocol witness table accessor for type CLMonitor.Options and conformance CLMonitor.Options();
  return RawRepresentable<>.encode(to:)();
}

void protocol witness for SetAlgebra.init() in conformance CLMonitor.Options(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *protocol witness for SetAlgebra.union(_:) in conformance CLMonitor.Options@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.intersection(_:) in conformance CLMonitor.Options@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.symmetricDifference(_:) in conformance CLMonitor.Options@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance CLMonitor.Options(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *protocol witness for SetAlgebra.remove(_:) in conformance CLMonitor.Options@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *protocol witness for SetAlgebra.update(with:) in conformance CLMonitor.Options@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *protocol witness for SetAlgebra.formUnion(_:) in conformance CLMonitor.Options(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.formIntersection(_:) in conformance CLMonitor.Options(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance CLMonitor.Options(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.subtracting(_:) in conformance CLMonitor.Options@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance CLMonitor.Options(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL protocol witness for SetAlgebra.isDisjoint(with:) in conformance CLMonitor.Options(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance CLMonitor.Options(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL protocol witness for SetAlgebra.isEmpty.getter in conformance CLMonitor.Options()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance CLMonitor.Options()
{
  return SetAlgebra.init<A>(_:)();
}

_QWORD *protocol witness for SetAlgebra.subtract(_:) in conformance CLMonitor.Options(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

uint64_t specialized == infix<A>(_:_:)(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 0x64757469676E6F6CLL;
    else
      v3 = 0x737569646172;
    if (v2 == 1)
      v4 = 0xE900000000000065;
    else
      v4 = 0xE600000000000000;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 0x64757469676E6F6CLL;
      else
        v6 = 0x737569646172;
      if (v5 == 1)
        v7 = 0xE900000000000065;
      else
        v7 = 0xE600000000000000;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE800000000000000;
    v3 = 0x656475746974616CLL;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE800000000000000;
  if (v3 != 0x656475746974616CLL)
  {
LABEL_21:
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t specialized == infix<A>(_:_:)(char a1, unsigned __int8 a2)
{
  uint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  if (a1)
  {
    if (a1 == 1)
      v2 = 0x726F6A616DLL;
    else
      v2 = 0x726F6E696DLL;
    v3 = 0xE500000000000000;
    v4 = a2;
    if (a2)
    {
LABEL_6:
      if (v4 == 1)
        v5 = 0x726F6A616DLL;
      else
        v5 = 0x726F6E696DLL;
      v6 = 0xE500000000000000;
      if (v2 != v5)
        goto LABEL_15;
      goto LABEL_13;
    }
  }
  else
  {
    v3 = 0xE400000000000000;
    v2 = 1684632949;
    v4 = a2;
    if (a2)
      goto LABEL_6;
  }
  v6 = 0xE400000000000000;
  if (v2 != 1684632949)
  {
LABEL_15:
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
    goto LABEL_16;
  }
LABEL_13:
  if (v3 != v6)
    goto LABEL_15;
  v7 = 1;
LABEL_16:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance CLMonitor.Options@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = specialized SetAlgebra<>.init(arrayLiteral:)(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t *v9;
  _OWORD *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, CLMonitor.Record>);
  v2 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
    goto LABEL_9;
  v4 = a1 + 32;
  swift_retain();
  while (1)
  {
    outlined init with copy of CLCondition?(v4, (uint64_t)&v18, &demangling cache variable for type metadata for (String, CLMonitor.Record));
    v5 = v18;
    v6 = v19;
    result = specialized __RawDictionaryStorage.find<A>(_:)(v18, v19);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = (uint64_t *)(v2[6] + 16 * result);
    *v9 = v5;
    v9[1] = v6;
    v10 = (_OWORD *)(v2[7] + 96 * result);
    v11 = v21;
    *v10 = v20;
    v10[1] = v11;
    v12 = v22;
    v13 = v23;
    v14 = v25;
    v10[4] = v24;
    v10[5] = v14;
    v10[2] = v12;
    v10[3] = v13;
    v15 = v2[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_12;
    v2[2] = v17;
    v4 += 112;
    if (!--v3)
    {
      swift_bridgeObjectRelease();
      swift_release();
      return (unint64_t)v2;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t CLMonitor.identifiers.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(*(id *)(v0 + 120), sel__getMonitoredIdentifiers);
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

uint64_t CLMonitor.events.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of CLMonitor.Events(v1 + OBJC_IVAR____TtC12CoreLocation9CLMonitor_events, a1);
}

uint64_t outlined init with copy of CLMonitor.Events(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CLMonitor.Events(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for CLMonitor.Events(uint64_t a1)
{
  return type metadata accessor for CLMonitor.Events(a1, (uint64_t *)&type metadata singleton initialization cache for CLMonitor.Events);
}

_QWORD *CLMonitor.Record.lastEvent.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of CLMonitor.Event(v1 + 8, a1);
}

_QWORD *outlined init with copy of CLMonitor.Event(uint64_t a1, _QWORD *a2)
{
  initializeWithCopy for CLMonitor.Event(a2, a1);
  return a2;
}

uint64_t CLMonitor.Record.condition.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of CLCondition(v1 + 56, a1);
}

uint64_t outlined init with copy of CLCondition(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t CLMonitor.Record.init(condition:identifier:options:state:date:monitoringEvent:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, id a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v16;
  char *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  Class isa;
  id v26;
  uint64_t result;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32[2];
  uint64_t v33;
  _BYTE v34[40];
  __int128 v35;
  __int128 v36;
  __int128 v37;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8]();
  v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of CLCondition(a1, a8 + 56);
  *(_QWORD *)a8 = a4;
  if (a7)
  {
    a7 = a7;
    swift_bridgeObjectRelease();
    outlined init with copy of CLCondition(a1, (uint64_t)v34);
    v18 = a7;
LABEL_8:

    v28 = type metadata accessor for Date();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 8))(a6, v28);
    __swift_destroy_boxed_opaque_existential_1(a1);
    *(_QWORD *)&v35 = v18;
    result = outlined init with take of CLCondition?((uint64_t)v34, (uint64_t)&v35 + 8);
    v29 = v36;
    *(_OWORD *)(a8 + 8) = v35;
    *(_OWORD *)(a8 + 24) = v29;
    *(_OWORD *)(a8 + 40) = v37;
    return result;
  }
  v30 = a5;
  v31 = a6;
  outlined init with copy of CLCondition(a1, (uint64_t)v34);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CLCondition);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ConditionAdapter);
  if ((swift_dynamicCast() & 1) != 0)
  {
    outlined init with take of ConditionAdapter(v32, (uint64_t)&v35);
    v19 = *((_QWORD *)&v36 + 1);
    v20 = v37;
    __swift_project_boxed_opaque_existential_1(&v35, *((uint64_t *)&v36 + 1));
    v21 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v20 + 32))(v19, v20);
    v22 = type metadata accessor for Date();
    v23 = *(_QWORD *)(v22 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v17, v31, v22);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v17, 0, 1, v22);
    v24 = (void *)MEMORY[0x20BD03430](a2, a3);
    swift_bridgeObjectRelease();
    isa = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v17, 1, v22) != 1)
    {
      isa = Date._bridgeToObjectiveC()().super.isa;
      (*(void (**)(char *, uint64_t))(v23 + 8))(v17, v22);
    }
    v26 = objc_allocWithZone(MEMORY[0x24BDBFAB8]);
    v18 = objc_msgSend(v26, sel_initWithIdentifier_refinement_state_date_diagnostics_, v24, v21, v30, isa, 0);

    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v35);
    result = outlined init with copy of CLCondition(a1, (uint64_t)v34);
    if (v18)
    {
      a6 = v31;
      goto LABEL_8;
    }
  }
  else
  {
    v33 = 0;
    memset(v32, 0, sizeof(v32));
    swift_bridgeObjectRelease();
    outlined destroy of CLMonitor.Event?((uint64_t)v32, &demangling cache variable for type metadata for ConditionAdapter?);
    result = outlined init with copy of CLCondition(a1, (uint64_t)v34);
  }
  __break(1u);
  return result;
}

uint64_t CLMonitor.Event.refinement.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of CLCondition?(v1 + 8, a1, &demangling cache variable for type metadata for CLCondition?);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD03A00]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t CLMonitor.Event.identifier.getter()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(*v0, sel_identifier);
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

id CLMonitor.Event.state.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_state);
}

void CLMonitor.Event.date.getter()
{
  id *v0;
  id v1;

  v1 = objc_msgSend(*v0, sel_date);
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

}

id CLMonitor.Event.authorizationDenied.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_authorizationDenied);
}

id CLMonitor.Event.authorizationDeniedGlobally.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_authorizationDeniedGlobally);
}

id CLMonitor.Event.authorizationRestricted.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_authorizationRestricted);
}

id CLMonitor.Event.insufficientlyInUse.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_insufficientlyInUse);
}

id CLMonitor.Event.accuracyLimited.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_accuracyLimited);
}

id CLMonitor.Event.conditionUnsupported.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_conditionUnsupported);
}

id CLMonitor.Event.conditionLimitExceeded.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_conditionLimitExceeded);
}

id CLMonitor.Event.persistenceUnavailable.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_persistenceUnavailable);
}

id CLMonitor.Event.serviceSessionRequired.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_serviceSessionRequired);
}

id CLMonitor.Event.authorizationRequestInProgress.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_authorizationRequestInProgress);
}

uint64_t CLMonitor.Events.Iterator.next()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 112) = a1;
  *(_QWORD *)(v2 + 120) = v1;
  return swift_task_switch();
}

uint64_t CLMonitor.Events.Iterator.next()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  _QWORD *v6;
  _QWORD *v8;
  uint64_t (*v9)(uint64_t);

  v1 = *(_QWORD *)(v0 + 120);
  v2 = type metadata accessor for CLMonitor.Events.Iterator(0);
  v3 = *(int *)(v2 + 20);
  *(_DWORD *)(v0 + 144) = v3;
  outlined init with copy of CLCondition?(v1 + v3, v0 + 64, &demangling cache variable for type metadata for CLMonitor.Event?);
  if (*(_QWORD *)(v0 + 64))
  {
    v4 = *(_QWORD *)(v0 + 120);
    v5 = *(_OWORD *)(v0 + 80);
    *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 64);
    *(_OWORD *)(v0 + 32) = v5;
    *(_OWORD *)(v0 + 48) = *(_OWORD *)(v0 + 96);
    v9 = (uint64_t (*)(uint64_t))(**(int **)(v4 + *(int *)(v2 + 24)) + *(_QWORD *)(v4 + *(int *)(v2 + 24)));
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v6;
    *v6 = v0;
    v6[1] = CLMonitor.Events.Iterator.next();
    return v9(v0 + 16);
  }
  else
  {
    outlined destroy of CLMonitor.Event?(v0 + 64, &demangling cache variable for type metadata for CLMonitor.Event?);
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v8;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Iterator);
    *v8 = v0;
    v8[1] = CLMonitor.Events.Iterator.next();
    return AsyncStream.Iterator.next()();
  }
}

{
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  _QWORD *v1;

  outlined destroy of CLMonitor.Event(v0 + 16);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Iterator);
  *v1 = v0;
  v1[1] = CLMonitor.Events.Iterator.next();
  return AsyncStream.Iterator.next()();
}

{
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  outlined assign with copy of CLMonitor.Event?(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 120) + *(int *)(v0 + 144));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for CLMonitor.Events.Iterator(uint64_t a1)
{
  return type metadata accessor for CLMonitor.Events(a1, (uint64_t *)&type metadata singleton initialization cache for CLMonitor.Events.Iterator);
}

uint64_t outlined assign with copy of CLMonitor.Event?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CLMonitor.Event?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of CLMonitor.Event(uint64_t a1)
{
  destroy for CLMonitor.Event(a1);
  return a1;
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance CLMonitor.Events.Iterator(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = protocol witness for AsyncIteratorProtocol.next() in conformance CLMonitor.Events.Iterator;
  v4[14] = a1;
  v4[15] = v1;
  return swift_task_switch();
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance CLMonitor.Events.Iterator()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t _s12CoreLocation9CLMonitorC6EventsV8IteratorVScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTW(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v7;

  v5[4] = a3;
  v5[5] = a4;
  v5[3] = a2;
  v7 = (_QWORD *)swift_task_alloc();
  v5[6] = v7;
  *v7 = v5;
  v7[1] = _s12CoreLocation9CLMonitorC6EventsV8IteratorVScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_;
  v7[14] = a1;
  v7[15] = v4;
  return swift_task_switch();
}

uint64_t _s12CoreLocation9CLMonitorC6EventsV8IteratorVScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (!v0)
    return (*(uint64_t (**)(void))(v2 + 8))();
  if (*(_QWORD *)(v2 + 24))
  {
    swift_getObjectType();
    dispatch thunk of Actor.unownedExecutor.getter();
  }
  return swift_task_switch();
}

uint64_t _s12CoreLocation9CLMonitorC6EventsV8IteratorVScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTY1_()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD **)(v0 + 40);
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  swift_willThrowTypedImpl();
  *v2 = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t CLMonitor.Events.makeAsyncIterator()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  _QWORD *v8;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>);
  AsyncStream.makeAsyncIterator()();
  v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for CLMonitor.Events(0) + 28));
  v5 = *v3;
  v4 = v3[1];
  v6 = type metadata accessor for CLMonitor.Events.Iterator(0);
  v7 = (_OWORD *)(a1 + *(int *)(v6 + 20));
  v7[1] = 0u;
  v7[2] = 0u;
  *v7 = 0u;
  v8 = (_QWORD *)(a1 + *(int *)(v6 + 24));
  *v8 = v5;
  v8[1] = v4;
  return swift_retain();
}

uint64_t CLMonitor.Events.init(_:_:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  uint64_t v16;
  uint64_t result;
  int *v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD aBlock[6];

  v24 = a2;
  v25 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation?);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation.BufferingPolicy);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = swift_allocBox();
  v14 = v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation);
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
  v26 = v14;
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BEE6A10], v8);
  AsyncStream.init(_:bufferingPolicy:_:)();
  outlined init with copy of CLCondition?(v14, (uint64_t)v7, &demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation?);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48))(v7, 1, v15);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v18 = (int *)type metadata accessor for CLMonitor.Events(0);
    (*(void (**)(uint64_t, char *, uint64_t))(v16 + 32))(a4 + v18[5], v7, v15);
    v19 = v24;
    v20 = v25;
    *(_QWORD *)(a4 + v18[6]) = v25;
    v21 = (_QWORD *)(a4 + v18[7]);
    *v21 = v19;
    v21[1] = a3;
    aBlock[4] = partial apply for closure #2 in CLMonitor.Events.init(_:_:);
    aBlock[5] = v12;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed CLMonitor, @guaranteed CLMonitoringEvent) -> ();
    aBlock[3] = &block_descriptor_14;
    v22 = _Block_copy(aBlock);
    v23 = v20;
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v23, sel_setEventHandler_, v22);
    swift_release();

    _Block_release(v22);
    return swift_release();
  }
  return result;
}

uint64_t closure #1 in CLMonitor.Events.init(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  outlined destroy of CLMonitor.Event?(a2, &demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation?);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation);
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a2, a1, v4);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
}

uint64_t closure #2 in CLMonitor.Events.init(_:_:)(uint64_t a1, void *a2)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  int v17;
  uint8_t *v18;
  id v19;
  id v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t result;
  _QWORD v33[2];
  uint8_t *v34;
  uint64_t v35;
  int v36;
  char *v37;
  uint64_t v38[9];
  void *v39;
  uint64_t v40;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation?);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation.YieldResult);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = swift_projectBox();
  v10 = objc_msgSend(a2, sel_refinement);
  objcConditionToSwifty(_:)(v10, (uint64_t)&v40);

  v39 = a2;
  v11 = one-time initialization token for logger;
  v12 = a2;
  if (v11 != -1)
    swift_once();
  v13 = type metadata accessor for Logger();
  __swift_project_value_buffer(v13, (uint64_t)logger);
  v14 = v12;
  v15 = Logger.logObject.getter();
  v16 = static os_log_type_t.default.getter();
  v17 = v16;
  if (os_log_type_enabled(v15, v16))
  {
    v36 = v17;
    v18 = (uint8_t *)swift_slowAlloc();
    v35 = swift_slowAlloc();
    v37 = v8;
    v38[0] = v35;
    *(_DWORD *)v18 = 136315138;
    v33[1] = v18 + 4;
    v34 = v18;
    v19 = v14;
    v20 = objc_msgSend(v19, sel_description);
    v21 = v4;
    v22 = v6;
    v23 = v5;
    v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v26 = v25;

    v27 = v24;
    v5 = v23;
    v6 = v22;
    v4 = v21;
    v38[6] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v27, v26, v38);
    v8 = v37;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    v28 = v34;
    _os_log_impl(&dword_2082EC000, v15, (os_log_type_t)v36, "#MonitorActor received event: %s", v34, 0xCu);
    v29 = v35;
    swift_arrayDestroy();
    MEMORY[0x20BD03A90](v29, -1, -1);
    MEMORY[0x20BD03A90](v28, -1, -1);
  }
  else
  {

  }
  swift_beginAccess();
  outlined init with copy of CLCondition?(v9, (uint64_t)v4, &demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation?);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation);
  v31 = *(_QWORD *)(v30 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v31 + 48))(v4, 1, v30);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    outlined init with copy of CLMonitor.Event((uint64_t)&v39, v38);
    AsyncStream.Continuation.yield(_:)();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    outlined destroy of CLMonitor.Event((uint64_t)&v39);
    return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v4, v30);
  }
  return result;
}

void thunk for @escaping @callee_guaranteed (@guaranteed CLMonitor, @guaranteed CLMonitoringEvent) -> ()(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(id, id);
  id v6;
  id v7;

  v5 = *(void (**)(id, id))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(v7, v6);
  swift_release();

}

uint64_t protocol witness for AsyncSequence.makeAsyncIterator() in conformance CLMonitor.Events@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  _QWORD *v10;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>);
  AsyncStream.makeAsyncIterator()();
  v5 = (uint64_t *)(v2 + *(int *)(a1 + 28));
  v7 = *v5;
  v6 = v5[1];
  v8 = type metadata accessor for CLMonitor.Events.Iterator(0);
  v9 = (_OWORD *)(a2 + *(int *)(v8 + 20));
  v9[1] = 0u;
  v9[2] = 0u;
  *v9 = 0u;
  v10 = (_QWORD *)(a2 + *(int *)(v8 + 24));
  *v10 = v7;
  v10[1] = v6;
  swift_retain();
  return outlined destroy of CLMonitor.Events(v2);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance CLMonitor.CircularGeographicCondition.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CLMonitor.CircularGeographicCondition.CodingKeys()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance CLMonitor.CircularGeographicCondition.CodingKeys()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CLMonitor.CircularGeographicCondition.CodingKeys()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance CLMonitor.CircularGeographicCondition.CodingKeys@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  Swift::OpaquePointer v3;
  unint64_t result;

  v3._rawValue = &outlined read-only object #0 of CLMonitor.CircularGeographicCondition.CodingKeys.init(rawValue:);
  result = specialized CLMonitor.CircularGeographicCondition.CodingKeys.init(rawValue:)(*a1, v3);
  *a2 = result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance CLMonitor.CircularGeographicCondition.CodingKeys(uint64_t *a1@<X8>)
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
  v4 = 0xE900000000000065;
  v5 = 0x64757469676E6F6CLL;
  if (v2 != 1)
  {
    v5 = 0x737569646172;
    v4 = 0xE600000000000000;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x656475746974616CLL;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance CLMonitor.CircularGeographicCondition.CodingKeys()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x64757469676E6F6CLL;
  if (*v0 != 1)
    v1 = 0x737569646172;
  if (*v0)
    return v1;
  else
    return 0x656475746974616CLL;
}

unint64_t protocol witness for CodingKey.init(stringValue:) in conformance CLMonitor.CircularGeographicCondition.CodingKeys@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  Swift::OpaquePointer v3;
  unint64_t result;

  v3._rawValue = &outlined read-only object #0 of CLMonitor.CircularGeographicCondition.CodingKeys.init(rawValue:);
  result = specialized CLMonitor.CircularGeographicCondition.CodingKeys.init(rawValue:)(a1, v3);
  *a2 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance CLMonitor.CircularGeographicCondition.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance CLMonitor.CircularGeographicCondition.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CLMonitor.CircularGeographicCondition.CodingKeys()
{
  lazy protocol witness table accessor for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CLMonitor.CircularGeographicCondition.CodingKeys()
{
  lazy protocol witness table accessor for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys();
  return CodingKey.debugDescription.getter();
}

double CLMonitor.CircularGeographicCondition.center.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

double CLMonitor.CircularGeographicCondition.radius.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

uint64_t CLMonitor.CircularGeographicCondition.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  double v9;
  CLLocationDegrees v10;
  double v11;
  CLLocationDegrees v12;
  uint64_t v14;
  uint64_t v15;
  CLLocationCoordinate2D v16;
  _BYTE v17[16];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<CLMonitor.CircularGeographicCondition.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = &v17[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    v17[15] = 0;
    KeyedDecodingContainer.decode(_:forKey:)();
    v10 = v9;
    v17[14] = 1;
    KeyedDecodingContainer.decode(_:forKey:)();
    v12 = v11;
    v17[13] = 2;
    KeyedDecodingContainer.decode(_:forKey:)();
    v15 = v14;
    v16 = CLLocationCoordinate2DMake(v10, v12);
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
    *(CLLocationCoordinate2D *)a2 = v16;
    *(_QWORD *)(a2 + 16) = v15;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t lazy protocol witness table accessor for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys;
  if (!lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys)
  {
    result = MEMORY[0x20BD03A18](&protocol conformance descriptor for CLMonitor.CircularGeographicCondition.CodingKeys, &unk_24C090048);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys;
  if (!lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys)
  {
    result = MEMORY[0x20BD03A18](&protocol conformance descriptor for CLMonitor.CircularGeographicCondition.CodingKeys, &unk_24C090048);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys;
  if (!lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys)
  {
    result = MEMORY[0x20BD03A18](&protocol conformance descriptor for CLMonitor.CircularGeographicCondition.CodingKeys, &unk_24C090048);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys;
  if (!lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys)
  {
    result = MEMORY[0x20BD03A18](&protocol conformance descriptor for CLMonitor.CircularGeographicCondition.CodingKeys, &unk_24C090048);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys);
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

uint64_t CLMonitor.CircularGeographicCondition.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;
  char v9;
  char v10;
  char v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<CLMonitor.CircularGeographicCondition.CodingKeys>);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type CLMonitor.CircularGeographicCondition.CodingKeys and conformance CLMonitor.CircularGeographicCondition.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v11 = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v1)
  {
    v10 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v9 = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

id protocol witness for ConditionAdapter.to() in conformance CLMonitor.CircularGeographicCondition()
{
  double *v0;

  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFA48]), sel_initWithCenter_radius_, *v0, v0[1], v0[2]);
}

uint64_t protocol witness for Decodable.init(from:) in conformance CLMonitor.CircularGeographicCondition@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return CLMonitor.CircularGeographicCondition.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance CLMonitor.CircularGeographicCondition(_QWORD *a1)
{
  return CLMonitor.CircularGeographicCondition.encode(to:)(a1);
}

uint64_t CLMonitor.add(_:identifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CLMonitor.add(_:identifier:assuming:)(a1, a2, a3, 0);
}

uint64_t CLMonitor.add(_:identifier:assuming:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t *v15;
  __int128 *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  id v21;
  void *v22;
  void *v23;
  __int128 v25[2];
  uint64_t v26;
  _BYTE v27[40];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  v5 = v4;
  type metadata accessor for Date();
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v12 = *(_QWORD *)(v4 + 112);
  if (*(_QWORD *)(v12 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
    if ((v14 & 1) != 0)
    {
      outlined init with copy of CLMonitor.Record(*(_QWORD *)(v12 + 56) + 96 * v13, (uint64_t)&v28);
    }
    else
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*((_QWORD *)&v28 + 1))
    {
      v15 = &demangling cache variable for type metadata for CLMonitor.Record?;
      v16 = &v28;
      return outlined destroy of CLMonitor.Event?((uint64_t)v16, v15);
    }
  }
  else
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
  }
  outlined destroy of CLMonitor.Event?((uint64_t)&v28, &demangling cache variable for type metadata for CLMonitor.Record?);
  outlined init with copy of CLCondition(a1, (uint64_t)v27);
  swift_bridgeObjectRetain_n();
  Date.init()();
  CLMonitor.Record.init(condition:identifier:options:state:date:monitoringEvent:)((uint64_t)v27, a2, a3, 0, a4, (uint64_t)v11, 0, (uint64_t)&v28);
  swift_beginAccess();
  specialized Dictionary.subscript.setter((uint64_t)&v28, a2, a3);
  swift_endAccess();
  outlined init with copy of CLCondition(a1, (uint64_t)v27);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CLCondition);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ConditionAdapter);
  if ((swift_dynamicCast() & 1) != 0)
  {
    outlined init with take of ConditionAdapter(v25, (uint64_t)&v28);
    v17 = *(void **)(v5 + 120);
    v18 = *((_QWORD *)&v29 + 1);
    v19 = v30;
    __swift_project_boxed_opaque_existential_1(&v28, *((uint64_t *)&v29 + 1));
    v20 = *(uint64_t (**)(uint64_t, uint64_t))(v19 + 32);
    v21 = v17;
    v22 = (void *)v20(v18, v19);
    v23 = (void *)MEMORY[0x20BD03430](a2, a3);
    objc_msgSend(v21, sel__addConditionForMonitoring_identifier_options_assumedState_, v22, v23, 0, a4);

    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v28);
  }
  v26 = 0;
  memset(v25, 0, sizeof(v25));
  v15 = &demangling cache variable for type metadata for ConditionAdapter?;
  v16 = v25;
  return outlined destroy of CLMonitor.Event?((uint64_t)v16, v15);
}

uint64_t specialized Dictionary.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  _OWORD v12[6];

  if (*(_QWORD *)(a1 + 8))
  {
    v6 = *(_OWORD *)(a1 + 48);
    v12[2] = *(_OWORD *)(a1 + 32);
    v12[3] = v6;
    v7 = *(_OWORD *)(a1 + 80);
    v12[4] = *(_OWORD *)(a1 + 64);
    v12[5] = v7;
    v8 = *(_OWORD *)(a1 + 16);
    v12[0] = *(_OWORD *)a1;
    v12[1] = v8;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v3;
    *v3 = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v12, a2, a3, isUniquelyReferenced_nonNull_native);
    *v3 = v11;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    outlined destroy of CLMonitor.Event?(a1, &demangling cache variable for type metadata for CLMonitor.Record?);
    specialized Dictionary._Variant.removeValue(forKey:)(a2, a3, v12);
    swift_bridgeObjectRelease();
    return outlined destroy of CLMonitor.Event?((uint64_t)v12, &demangling cache variable for type metadata for CLMonitor.Record?);
  }
}

Swift::Void __swiftcall CLMonitor.remove(_:)(Swift::String a1)
{
  uint64_t v1;
  void *object;
  uint64_t countAndFlagsBits;
  id v4;
  void *v5;
  _OWORD v6[6];

  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  swift_beginAccess();
  specialized Dictionary._Variant.removeValue(forKey:)(countAndFlagsBits, (uint64_t)object, v6);
  outlined destroy of CLMonitor.Event?((uint64_t)v6, &demangling cache variable for type metadata for CLMonitor.Record?);
  swift_endAccess();
  v4 = *(id *)(v1 + 120);
  v5 = (void *)MEMORY[0x20BD03430](countAndFlagsBits, object);
  objc_msgSend(v4, sel__removeConditionFromMonitoringWithIdentifier_, v5);

}

uint64_t CLMonitor.record(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  char v10;

  result = swift_beginAccess();
  v8 = *(_QWORD *)(v3 + 112);
  if (*(_QWORD *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9 = specialized __RawDictionaryStorage.find<A>(_:)(a1, a2);
    if ((v10 & 1) != 0)
    {
      outlined init with copy of CLMonitor.Record(*(_QWORD *)(v8 + 56) + 96 * v9, (uint64_t)a3);
    }
    else
    {
      a3[4] = 0u;
      a3[5] = 0u;
      a3[2] = 0u;
      a3[3] = 0u;
      *a3 = 0u;
      a3[1] = 0u;
    }
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    a3[4] = 0u;
    a3[5] = 0u;
    a3[2] = 0u;
    a3[3] = 0u;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

void CLMonitor.update(_:_:)(uint64_t a1, unint64_t a2, void **a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  _OWORD v24[2];
  _OWORD v25[3];
  _BYTE v26[40];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _OWORD v33[3];
  _OWORD v34[4];

  v7 = type metadata accessor for Date();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v11 = *(_QWORD *)(v3 + 112);
  if (*(_QWORD *)(v11 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12 = specialized __RawDictionaryStorage.find<A>(_:)(a1, a2);
    if ((v13 & 1) != 0)
    {
      outlined init with copy of CLMonitor.Record(*(_QWORD *)(v11 + 56) + 96 * v12, (uint64_t)&v27);
    }
    else
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*((_QWORD *)&v27 + 1))
    {
      v33[2] = v29;
      v34[0] = v30;
      v34[1] = v31;
      v34[2] = v32;
      v33[0] = v27;
      v33[1] = v28;
      outlined init with copy of CLCondition((uint64_t)v34 + 8, (uint64_t)v26);
      v14 = *a3;
      swift_bridgeObjectRetain_n();
      objc_msgSend(v14, sel_state);
      v15 = objc_msgSend(v14, sel_date);
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      outlined init with copy of CLCondition((uint64_t)v26, (uint64_t)v25 + 8);
      *(_QWORD *)&v23 = 0;
      v16 = v14;
      swift_bridgeObjectRelease();
      outlined init with copy of CLCondition((uint64_t)v26, (uint64_t)&v27);

      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
      *((_QWORD *)&v23 + 1) = v16;
      outlined init with take of CLCondition?((uint64_t)&v27, (uint64_t)v24);
      v29 = v24[1];
      v30 = v25[0];
      v31 = v25[1];
      v32 = v25[2];
      v27 = v23;
      v28 = v24[0];
      swift_beginAccess();
      specialized Dictionary.subscript.setter((uint64_t)&v27, a1, a2);
      swift_endAccess();
      outlined destroy of CLMonitor.Record((uint64_t)v33);
      return;
    }
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
  }
  outlined destroy of CLMonitor.Event?((uint64_t)&v27, &demangling cache variable for type metadata for CLMonitor.Record?);
  if (one-time initialization token for logger != -1)
    swift_once();
  v17 = type metadata accessor for Logger();
  __swift_project_value_buffer(v17, (uint64_t)logger);
  swift_bridgeObjectRetain_n();
  v18 = Logger.logObject.getter();
  v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    v21 = swift_slowAlloc();
    *(_QWORD *)&v33[0] = v21;
    *(_DWORD *)v20 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v27 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, (uint64_t *)v33);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2082EC000, v18, v19, "#MonitorActor update on record that doesn't exist for %s", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x20BD03A90](v21, -1, -1);
    MEMORY[0x20BD03A90](v20, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

}

uint64_t CLMonitor.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  swift_allocObject();
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = CLMonitor.__allocating_init(_:);
  return CLMonitor.init(_:)(a1, a2);
}

uint64_t CLMonitor.__allocating_init(_:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t CLMonitor.init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;

  v3[22] = v2;
  type metadata accessor for Date();
  v3[23] = swift_task_alloc();
  type metadata accessor for CLMonitor.Events(0);
  v6 = swift_task_alloc();
  v3[24] = v6;
  swift_defaultActor_initialize();
  *(_QWORD *)(v2 + 112) = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x24BEE4AF8]);
  v7 = (void *)objc_opt_self();
  v8 = (void *)MEMORY[0x20BD03430](a1, a2);
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v7, sel__configWithMonitorName_, v8);
  v3[25] = v9;

  v10 = swift_allocObject();
  v3[26] = v10;
  swift_weakInit();
  swift_retain_n();
  v11 = v9;
  CLMonitor.Events.init(_:_:)(v11, (uint64_t)&async function pointer to partial apply for closure #1 in CLMonitor.init(_:), v10, v6);
  outlined init with take of CLMonitor.Events(v6, v2 + OBJC_IVAR____TtC12CoreLocation9CLMonitor_events);
  v12 = (void *)objc_opt_self();
  v3[7] = v3 + 21;
  v3[2] = v3;
  v3[3] = CLMonitor.init(_:);
  v13 = swift_continuation_init();
  v3[10] = MEMORY[0x24BDAC760];
  v14 = v3 + 10;
  v14[1] = 0x40000000;
  v14[2] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned CLMonitor) -> () with result type CLMonitor;
  v14[3] = &block_descriptor;
  v14[4] = v13;
  objc_msgSend(v12, sel_requestMonitorWithConfiguration_completion_, v11, v14);
  return swift_continuation_await();
}

uint64_t CLMonitor.init(_:)()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 176) + 120) = *(_QWORD *)(*(_QWORD *)v0 + 168);
  return swift_task_switch();
}

void CLMonitor.init(_:)()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t i;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  _QWORD v31[5];
  _OWORD v32[6];

  v1 = objc_msgSend(*(id *)(*(_QWORD *)(v0 + 176) + 120), sel__getMonitoringRecords);
  type metadata accessor for CLMonitoringRecord();
  v2 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  v3 = 0;
  v25 = v2 + 64;
  v28 = v2;
  v4 = -1;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  if (-v5 < 64)
    v4 = ~(-1 << -(char)v5);
  v6 = v4 & *(_QWORD *)(v2 + 64);
  v26 = (unint64_t)(63 - v5) >> 6;
  if (!v6)
    goto LABEL_5;
LABEL_4:
  v29 = (v6 - 1) & v6;
  v30 = v3;
  for (i = __clz(__rbit64(v6)) | (v3 << 6); ; i = __clz(__rbit64(v9)) + (v10 << 6))
  {
    v12 = (uint64_t *)(*(_QWORD *)(v28 + 48) + 16 * i);
    v14 = *v12;
    v13 = v12[1];
    v15 = *(void **)(*(_QWORD *)(v28 + 56) + 8 * i);
    swift_bridgeObjectRetain();
    v16 = v15;
    v17 = objc_msgSend(v16, sel_condition);
    objcConditionToSwifty(_:)(v17, (uint64_t)v31);

    if (!v31[3])
      break;
    v18 = *(_QWORD *)(v27 + 176);
    v19 = *(_QWORD *)(v27 + 184);
    swift_bridgeObjectRetain();
    v20 = objc_msgSend(v16, sel_lastEvent);
    v21 = objc_msgSend(v20, sel_state);

    v22 = objc_msgSend(v16, sel_lastEvent);
    v23 = objc_msgSend(v22, sel_date);

    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    CLMonitor.Record.init(condition:identifier:options:state:date:monitoringEvent:)((uint64_t)v31, v14, v13, 0, (uint64_t)v21, v19, objc_msgSend(v16, sel_lastEvent), (uint64_t)v32);
    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v31[0] = *(_QWORD *)(v18 + 112);
    *(_QWORD *)(v18 + 112) = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v32, v14, v13, isUniquelyReferenced_nonNull_native);
    *(_QWORD *)(v18 + 112) = v31[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();

    v6 = v29;
    v3 = v30;
    if (v29)
      goto LABEL_4;
LABEL_5:
    v8 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
LABEL_24:
      __break(1u);
      break;
    }
    if (v8 >= v26)
      goto LABEL_22;
    v9 = *(_QWORD *)(v25 + 8 * v8);
    v10 = v3 + 1;
    if (!v9)
    {
      v10 = v3 + 2;
      if (v3 + 2 >= v26)
        goto LABEL_22;
      v9 = *(_QWORD *)(v25 + 8 * v10);
      if (!v9)
      {
        v10 = v3 + 3;
        if (v3 + 3 >= v26)
          goto LABEL_22;
        v9 = *(_QWORD *)(v25 + 8 * v10);
        if (!v9)
        {
          v11 = v3 + 4;
          if (v3 + 4 >= v26)
          {
LABEL_22:

            swift_release();
            swift_release();
            swift_beginAccess();
            swift_weakAssign();
            swift_release();
            swift_task_dealloc();
            swift_task_dealloc();
            (*(void (**)(_QWORD))(v27 + 8))(*(_QWORD *)(v27 + 176));
            return;
          }
          v9 = *(_QWORD *)(v25 + 8 * v11);
          if (!v9)
          {
            while (1)
            {
              v10 = v11 + 1;
              if (__OFADD__(v11, 1))
                goto LABEL_24;
              if (v10 >= v26)
                goto LABEL_22;
              v9 = *(_QWORD *)(v25 + 8 * v10);
              ++v11;
              if (v9)
                goto LABEL_18;
            }
          }
          v10 = v3 + 4;
        }
      }
    }
LABEL_18:
    v29 = (v9 - 1) & v9;
    v30 = v10;
  }
  __break(1u);
}

uint64_t closure #1 in CLMonitor.init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  return swift_task_switch();
}

uint64_t closure #1 in CLMonitor.init(_:)()
{
  uint64_t v0;
  uint64_t Strong;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 56) = Strong;
  if (Strong)
  {
    v2 = objc_msgSend(**(id **)(v0 + 40), sel_identifier);
    v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = v4;

    *(_QWORD *)(v0 + 64) = v3;
    *(_QWORD *)(v0 + 72) = v5;
    return swift_task_switch();
  }
  else
  {
    if (one-time initialization token for logger != -1)
      swift_once();
    v7 = type metadata accessor for Logger();
    __swift_project_value_buffer(v7, (uint64_t)logger);
    v8 = Logger.logObject.getter();
    v9 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_2082EC000, v8, v9, "#MonitorActor can't update event when self has been dealloc'd", v10, 2u);
      MEMORY[0x20BD03A90](v10, -1, -1);
    }

    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

{
  uint64_t v0;

  CLMonitor.update(_:_:)(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(void ***)(v0 + 40));
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned CLMonitor) -> () with result type CLMonitor(uint64_t a1, void *a2)
{
  id v2;

  **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
  v2 = a2;
  return swift_continuation_resume();
}

uint64_t CLMonitor.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  outlined destroy of CLMonitor.Events(v0 + OBJC_IVAR____TtC12CoreLocation9CLMonitor_events);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t CLMonitor.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  outlined destroy of CLMonitor.Events(v0 + OBJC_IVAR____TtC12CoreLocation9CLMonitor_events);
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t CLMonitor.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t protocol witness for Actor.unownedExecutor.getter in conformance CLMonitor()
{
  uint64_t v0;

  return v0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance CLMonitor.MinimumAltitudeCondition.CodingKeys()
{
  return 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CLMonitor.MinimumAltitudeCondition.CodingKeys()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance CLMonitor.MinimumAltitudeCondition.CodingKeys()
{
  return String.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CLMonitor.MinimumAltitudeCondition.CodingKeys()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance CLMonitor.MinimumAltitudeCondition.CodingKeys@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::Int v3;
  uint64_t result;

  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of protocol witness for RawRepresentable.init(rawValue:) in conformance CLMonitor.MinimumAltitudeCondition.CodingKeys, *a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3 != 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance CLMonitor.MinimumAltitudeCondition.CodingKeys(_QWORD *a1@<X8>)
{
  *a1 = 0x6564757469746C61;
  a1[1] = 0xE800000000000000;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance CLMonitor.MinimumAltitudeCondition.CodingKeys()
{
  return 0x6564757469746C61;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance CLMonitor.MinimumAltitudeCondition.CodingKeys@<X0>(Swift::String string@<0:X0, 8:X1>, BOOL *a2@<X8>)
{
  void *object;
  Swift::String v3;
  Swift::Int v5;
  uint64_t result;

  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of protocol witness for CodingKey.init(stringValue:) in conformance CLMonitor.MinimumAltitudeCondition.CodingKeys, v3);
  result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance CLMonitor.MinimumAltitudeCondition.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CLMonitor.MinimumAltitudeCondition.CodingKeys()
{
  lazy protocol witness table accessor for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CLMonitor.MinimumAltitudeCondition.CodingKeys()
{
  lazy protocol witness table accessor for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys();
  return CodingKey.debugDescription.getter();
}

double CLMonitor.MinimumAltitudeCondition.altitude.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

uint64_t CLMonitor.MinimumAltitudeCondition.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<CLMonitor.MinimumAltitudeCondition.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    KeyedDecodingContainer.decode(_:forKey:)();
    v10 = v9;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

id protocol witness for ConditionAdapter.to() in conformance CLMonitor.MinimumAltitudeCondition()
{
  double *v0;

  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFAA0]), sel_initWithAltitude_, *v0);
}

uint64_t protocol witness for Decodable.init(from:) in conformance CLMonitor.MinimumAltitudeCondition@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return CLMonitor.MinimumAltitudeCondition.init(from:)(a1, a2);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance CLMonitor.BeaconIdentityCondition.CodingKeys(char *a1, unsigned __int8 *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CLMonitor.BeaconIdentityCondition.CodingKeys()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance CLMonitor.BeaconIdentityCondition.CodingKeys()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CLMonitor.BeaconIdentityCondition.CodingKeys()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance CLMonitor.BeaconIdentityCondition.CodingKeys@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  Swift::OpaquePointer v3;
  unint64_t result;

  v3._rawValue = &outlined read-only object #0 of CLMonitor.BeaconIdentityCondition.CodingKeys.init(rawValue:);
  result = specialized CLMonitor.CircularGeographicCondition.CodingKeys.init(rawValue:)(*a1, v3);
  *a2 = result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance CLMonitor.BeaconIdentityCondition.CodingKeys(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  v2 = *v1;
  v3 = 0xE400000000000000;
  v4 = 0x726F6A616DLL;
  if (v2 != 1)
    v4 = 0x726F6E696DLL;
  v5 = v2 == 0;
  if (*v1)
    v6 = v4;
  else
    v6 = 1684632949;
  if (!v5)
    v3 = 0xE500000000000000;
  *a1 = v6;
  a1[1] = v3;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance CLMonitor.BeaconIdentityCondition.CodingKeys()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x726F6A616DLL;
  if (*v0 != 1)
    v1 = 0x726F6E696DLL;
  if (*v0)
    return v1;
  else
    return 1684632949;
}

unint64_t protocol witness for CodingKey.init(stringValue:) in conformance CLMonitor.BeaconIdentityCondition.CodingKeys@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  Swift::OpaquePointer v3;
  unint64_t result;

  v3._rawValue = &outlined read-only object #0 of CLMonitor.BeaconIdentityCondition.CodingKeys.init(rawValue:);
  result = specialized CLMonitor.CircularGeographicCondition.CodingKeys.init(rawValue:)(a1, v3);
  *a2 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CLMonitor.BeaconIdentityCondition.CodingKeys()
{
  lazy protocol witness table accessor for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CLMonitor.BeaconIdentityCondition.CodingKeys()
{
  lazy protocol witness table accessor for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t CLMonitor.BeaconIdentityCondition.uuid.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for UUID();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t CLMonitor.BeaconIdentityCondition.major.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = type metadata accessor for CLMonitor.BeaconIdentityCondition(0);
  return *(unsigned __int16 *)(v0 + *(int *)(v1 + 20)) | (*(unsigned __int8 *)(v0 + *(int *)(v1 + 20) + 2) << 16);
}

uint64_t CLMonitor.BeaconIdentityCondition.minor.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = type metadata accessor for CLMonitor.BeaconIdentityCondition(0);
  return *(unsigned __int16 *)(v0 + *(int *)(v1 + 24)) | (*(unsigned __int8 *)(v0 + *(int *)(v1 + 24) + 2) << 16);
}

uint64_t CLMonitor.BeaconIdentityCondition.init(uuid:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  v4 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  result = type metadata accessor for CLMonitor.BeaconIdentityCondition(0);
  v6 = a2 + *(int *)(result + 20);
  *(_WORD *)v6 = 0;
  *(_BYTE *)(v6 + 2) = 1;
  v7 = a2 + *(int *)(result + 24);
  *(_WORD *)v7 = 0;
  *(_BYTE *)(v7 + 2) = 1;
  return result;
}

uint64_t CLMonitor.BeaconIdentityCondition.init(uuid:major:)@<X0>(uint64_t a1@<X0>, __int16 a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a3, a1, v6);
  result = type metadata accessor for CLMonitor.BeaconIdentityCondition(0);
  v8 = a3 + *(int *)(result + 20);
  *(_WORD *)v8 = a2;
  *(_BYTE *)(v8 + 2) = 0;
  v9 = a3 + *(int *)(result + 24);
  *(_WORD *)v9 = 0;
  *(_BYTE *)(v9 + 2) = 1;
  return result;
}

uint64_t CLMonitor.BeaconIdentityCondition.init(uuid:major:minor:)@<X0>(uint64_t a1@<X0>, __int16 a2@<W1>, __int16 a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;

  v8 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a4, a1, v8);
  result = type metadata accessor for CLMonitor.BeaconIdentityCondition(0);
  v10 = a4 + *(int *)(result + 20);
  *(_WORD *)v10 = a2;
  *(_BYTE *)(v10 + 2) = 0;
  v11 = a4 + *(int *)(result + 24);
  *(_WORD *)v11 = a3;
  *(_BYTE *)(v11 + 2) = 0;
  return result;
}

uint64_t CLMonitor.BeaconIdentityCondition.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  __int16 v15;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  _QWORD *v26;
  char v27;
  char v28;
  char v29;

  v23 = a2;
  v3 = type metadata accessor for UUID();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<CLMonitor.BeaconIdentityCondition.CodingKeys>);
  v7 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys();
  v24 = v9;
  v10 = v26;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v10)
  {
    v22 = (uint64_t)a1;
  }
  else
  {
    v26 = a1;
    v11 = v7;
    v12 = v4;
    v29 = 0;
    lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
    v13 = v24;
    v14 = v25;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    v28 = 1;
    v15 = KeyedDecodingContainer.decode(_:forKey:)();
    v27 = 2;
    v17 = KeyedDecodingContainer.decode(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v14);
    v18 = v23;
    (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v23, v6, v3);
    v19 = type metadata accessor for CLMonitor.BeaconIdentityCondition(0);
    v20 = v18 + *(int *)(v19 + 20);
    *(_WORD *)v20 = v15;
    *(_BYTE *)(v20 + 2) = 0;
    v21 = v18 + *(int *)(v19 + 24);
    *(_WORD *)v21 = v17;
    *(_BYTE *)(v21 + 2) = 0;
    v22 = (uint64_t)v26;
  }
  return __swift_destroy_boxed_opaque_existential_1(v22);
}

uint64_t CLMonitor.BeaconIdentityCondition.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  __int16 *v10;
  __int16 v11;
  __int16 *v12;
  __int16 v13;
  _BYTE v15[16];
  __int16 v16;
  char v17;
  char v18;
  __int16 v19;
  char v20;
  char v21;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<CLMonitor.BeaconIdentityCondition.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = &v15[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v21 = 0;
  type metadata accessor for UUID();
  lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    v9 = type metadata accessor for CLMonitor.BeaconIdentityCondition(0);
    v10 = (__int16 *)(v3 + *(int *)(v9 + 20));
    v11 = *v10;
    LOBYTE(v10) = *((_BYTE *)v10 + 2);
    v19 = v11;
    v20 = (char)v10;
    v18 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UInt16?);
    lazy protocol witness table accessor for type UInt16? and conformance <A> A?();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    v12 = (__int16 *)(v3 + *(int *)(v9 + 24));
    v13 = *v12;
    LOBYTE(v12) = *((_BYTE *)v12 + 2);
    v16 = v13;
    v17 = (char)v12;
    v15[15] = 2;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

CLBeaconIdentityCondition __swiftcall CLMonitor.BeaconIdentityCondition.to()()
{
  uint64_t v0;
  uint64_t v1;
  unsigned __int16 *v2;
  id v3;
  NSUUID v4;
  objc_class *v5;
  uint64_t v6;
  unsigned __int16 *v7;
  id v8;
  uint64_t v9;
  id v10;
  CLBeaconIdentityCondition v11;

  v1 = type metadata accessor for CLMonitor.BeaconIdentityCondition(0);
  v2 = (unsigned __int16 *)(v0 + *(int *)(v1 + 20));
  if ((v2[1] & 1) != 0)
  {
    v3 = objc_allocWithZone(MEMORY[0x24BDBFA38]);
    v4.super.isa = UUID._bridgeToObjectiveC()().super.isa;
    v5 = (objc_class *)objc_msgSend(v3, sel_initWithUUID_, v4.super.isa);
  }
  else
  {
    v6 = *v2;
    v7 = (unsigned __int16 *)(v0 + *(int *)(v1 + 24));
    if ((v7[1] & 1) != 0)
    {
      v8 = objc_allocWithZone(MEMORY[0x24BDBFA38]);
      v4.super.isa = UUID._bridgeToObjectiveC()().super.isa;
      v5 = (objc_class *)objc_msgSend(v8, sel_initWithUUID_major_, v4.super.isa, v6);
    }
    else
    {
      v9 = *v7;
      v10 = objc_allocWithZone(MEMORY[0x24BDBFA38]);
      v4.super.isa = UUID._bridgeToObjectiveC()().super.isa;
      v5 = (objc_class *)objc_msgSend(v10, sel_initWithUUID_major_minor_, v4.super.isa, v6, v9);
    }
  }
  v11.super.super.isa = v5;

  return v11;
}

uint64_t protocol witness for Decodable.init(from:) in conformance CLMonitor.BeaconIdentityCondition@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return CLMonitor.BeaconIdentityCondition.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance CLMonitor.BeaconIdentityCondition(_QWORD *a1)
{
  return CLMonitor.BeaconIdentityCondition.encode(to:)(a1);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;

  Hasher.init(_seed:)();
  String.hash(into:)();
  v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

uint64_t outlined init with take of ConditionAdapter(__int128 *a1, uint64_t a2)
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

uint64_t outlined init with copy of CLMonitor.Record(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for CLMonitor.Record(a2, a1);
  return a2;
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

double specialized Dictionary._Variant.removeValue(forKey:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  _OWORD *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  double result;
  uint64_t v17;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = specialized __RawDictionaryStorage.find<A>(_:)(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v17 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      specialized _NativeDictionary.copy()();
      v11 = v17;
    }
    swift_bridgeObjectRelease();
    v12 = (_OWORD *)(*(_QWORD *)(v11 + 56) + 96 * v8);
    v13 = v12[3];
    a3[2] = v12[2];
    a3[3] = v13;
    v14 = v12[5];
    a3[4] = v12[4];
    a3[5] = v14;
    v15 = v12[1];
    *a3 = *v12;
    a3[1] = v15;
    specialized _NativeDictionary._delete(at:)(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    a3[4] = 0u;
    a3[5] = 0u;
    a3[2] = 0u;
    a3[3] = 0u;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_2082F2468()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in CLMonitor.init(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = protocol witness for AsyncIteratorProtocol.next() in conformance CLMonitor.Events.Iterator;
  v4[5] = a1;
  v4[6] = v1;
  return swift_task_switch();
}

uint64_t outlined init with take of CLMonitor.Events(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CLMonitor.Events(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t type metadata accessor for CLMonitoringRecord()
{
  unint64_t result;

  result = lazy cache variable for type metadata for CLMonitoringRecord;
  if (!lazy cache variable for type metadata for CLMonitoringRecord)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for CLMonitoringRecord);
  }
  return result;
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
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
  unint64_t v14;
  _QWORD *v15;
  _OWORD *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  int64_t v42;
  _QWORD *v43;
  char v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, CLMonitor.Record>);
  v44 = a2;
  v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v43 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v42 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v21 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v22 = v21 | (v13 << 6);
      }
      else
      {
        v23 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v23 >= v42)
          goto LABEL_34;
        v24 = v43[v23];
        ++v13;
        if (!v24)
        {
          v13 = v23 + 1;
          if (v23 + 1 >= v42)
            goto LABEL_34;
          v24 = v43[v13];
          if (!v24)
          {
            v25 = v23 + 2;
            if (v25 >= v42)
            {
LABEL_34:
              swift_release();
              v3 = v2;
              if ((v44 & 1) != 0)
              {
                v41 = 1 << *(_BYTE *)(v5 + 32);
                if (v41 >= 64)
                  bzero(v43, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v43 = -1 << v41;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v24 = v43[v25];
            if (!v24)
            {
              while (1)
              {
                v13 = v25 + 1;
                if (__OFADD__(v25, 1))
                  goto LABEL_41;
                if (v13 >= v42)
                  goto LABEL_34;
                v24 = v43[v13];
                ++v25;
                if (v24)
                  goto LABEL_21;
              }
            }
            v13 = v25;
          }
        }
LABEL_21:
        v10 = (v24 - 1) & v24;
        v22 = __clz(__rbit64(v24)) + (v13 << 6);
      }
      v26 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v22);
      v28 = *v26;
      v27 = v26[1];
      v29 = (__int128 *)(*(_QWORD *)(v5 + 56) + 96 * v22);
      if ((v44 & 1) != 0)
      {
        v30 = v29[1];
        v45 = *v29;
        v46 = v30;
        v31 = v29[2];
        v32 = v29[3];
        v33 = v29[5];
        v49 = v29[4];
        v50 = v33;
        v47 = v31;
        v48 = v32;
      }
      else
      {
        outlined init with copy of CLMonitor.Record((uint64_t)v29, (uint64_t)&v45);
        swift_bridgeObjectRetain();
      }
      Hasher.init(_seed:)();
      String.hash(into:)();
      result = Hasher._finalize()();
      v34 = -1 << *(_BYTE *)(v7 + 32);
      v35 = result & ~v34;
      v36 = v35 >> 6;
      if (((-1 << v35) & ~*(_QWORD *)(v11 + 8 * (v35 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v35) & ~*(_QWORD *)(v11 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v37 = 0;
        v38 = (unint64_t)(63 - v34) >> 6;
        do
        {
          if (++v36 == v38 && (v37 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v39 = v36 == v38;
          if (v36 == v38)
            v36 = 0;
          v37 |= v39;
          v40 = *(_QWORD *)(v11 + 8 * v36);
        }
        while (v40 == -1);
        v14 = __clz(__rbit64(~v40)) + (v36 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
      *v15 = v28;
      v15[1] = v27;
      v16 = (_OWORD *)(*(_QWORD *)(v7 + 56) + 96 * v14);
      v17 = v46;
      *v16 = v45;
      v16[1] = v17;
      v18 = v47;
      v19 = v48;
      v20 = v50;
      v16[4] = v49;
      v16[5] = v20;
      v16[2] = v18;
      v16[3] = v19;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t specialized _NativeDictionary._delete(at:)(unint64_t result, uint64_t a2)
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
  const void *v15;
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
          result = v14 + 96 * v3;
          v15 = (const void *)(v14 + 96 * v6);
          if (v3 != v6 || (v3 = v6, result >= (unint64_t)v15 + 96))
          {
            result = (unint64_t)memmove((void *)result, v15, 0x60uLL);
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

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t result;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  _OWORD *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;

  v5 = v4;
  v10 = *v4;
  v12 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    specialized _NativeDictionary.copy()();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      return outlined assign with take of CLMonitor.Record((uint64_t)a1, v18[7] + 96 * v12);
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    v23 = (_OWORD *)(v18[7] + 96 * v12);
    v24 = a1[1];
    *v23 = *a1;
    v23[1] = v24;
    v25 = a1[2];
    v26 = a1[3];
    v27 = a1[5];
    v23[4] = a1[4];
    v23[5] = v27;
    v23[2] = v25;
    v23[3] = v26;
    v28 = v18[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (!v29)
    {
      v18[2] = v30;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v15, a4 & 1);
  v20 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      return outlined assign with take of CLMonitor.Record((uint64_t)a1, v18[7] + 96 * v12);
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t outlined destroy of CLMonitor.Events(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CLMonitor.Events(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t lazy protocol witness table accessor for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys;
  if (!lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys)
  {
    result = MEMORY[0x20BD03A18](&protocol conformance descriptor for CLMonitor.MinimumAltitudeCondition.CodingKeys, &unk_24C08FF78);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys;
  if (!lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys)
  {
    result = MEMORY[0x20BD03A18](&protocol conformance descriptor for CLMonitor.MinimumAltitudeCondition.CodingKeys, &unk_24C08FF78);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys;
  if (!lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys)
  {
    result = MEMORY[0x20BD03A18](&protocol conformance descriptor for CLMonitor.MinimumAltitudeCondition.CodingKeys, &unk_24C08FF78);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys;
  if (!lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys)
  {
    result = MEMORY[0x20BD03A18](&protocol conformance descriptor for CLMonitor.MinimumAltitudeCondition.CodingKeys, &unk_24C08FF78);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition.CodingKeys and conformance CLMonitor.MinimumAltitudeCondition.CodingKeys);
  }
  return result;
}

uint64_t type metadata accessor for CLMonitor.BeaconIdentityCondition(uint64_t a1)
{
  return type metadata accessor for CLMonitor.Events(a1, (uint64_t *)&type metadata singleton initialization cache for CLMonitor.BeaconIdentityCondition);
}

unint64_t lazy protocol witness table accessor for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys;
  if (!lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys)
  {
    result = MEMORY[0x20BD03A18](&protocol conformance descriptor for CLMonitor.BeaconIdentityCondition.CodingKeys, &unk_24C08FED0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys;
  if (!lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys)
  {
    result = MEMORY[0x20BD03A18](&protocol conformance descriptor for CLMonitor.BeaconIdentityCondition.CodingKeys, &unk_24C08FED0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys;
  if (!lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys)
  {
    result = MEMORY[0x20BD03A18](&protocol conformance descriptor for CLMonitor.BeaconIdentityCondition.CodingKeys, &unk_24C08FED0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys;
  if (!lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys)
  {
    result = MEMORY[0x20BD03A18](&protocol conformance descriptor for CLMonitor.BeaconIdentityCondition.CodingKeys, &unk_24C08FED0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition.CodingKeys and conformance CLMonitor.BeaconIdentityCondition.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type UInt16? and conformance <A> A?()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = lazy protocol witness table cache variable for type UInt16? and conformance <A> A?;
  if (!lazy protocol witness table cache variable for type UInt16? and conformance <A> A?)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for UInt16?);
    v2 = MEMORY[0x24BEE4480];
    result = MEMORY[0x20BD03A18](MEMORY[0x24BEE4AA8], v1, &v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt16? and conformance <A> A?);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD03A0C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t associated type witness table accessor for AsyncIteratorProtocol.Failure : Error in CLMonitor.Events.Iterator()
{
  return MEMORY[0x24BEE3F20];
}

uint64_t associated type witness table accessor for AsyncSequence.AsyncIterator : AsyncIteratorProtocol in CLMonitor.Events()
{
  return lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type CLMonitor.Events.Iterator and conformance CLMonitor.Events.Iterator, type metadata accessor for CLMonitor.Events.Iterator, (uint64_t)&protocol conformance descriptor for CLMonitor.Events.Iterator);
}

uint64_t instantiation function for generic protocol witness table for CLMonitor.CircularGeographicCondition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CLMonitor.CircularGeographicCondition(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CLMonitor.CircularGeographicCondition and conformance CLMonitor.CircularGeographicCondition, (uint64_t (*)(void))lazy protocol witness table accessor for type CLMonitor.CircularGeographicCondition and conformance CLMonitor.CircularGeographicCondition);
}

unint64_t lazy protocol witness table accessor for type CLMonitor.CircularGeographicCondition and conformance CLMonitor.CircularGeographicCondition()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition and conformance CLMonitor.CircularGeographicCondition;
  if (!lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition and conformance CLMonitor.CircularGeographicCondition)
  {
    result = MEMORY[0x20BD03A18](&protocol conformance descriptor for CLMonitor.CircularGeographicCondition, &type metadata for CLMonitor.CircularGeographicCondition);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition and conformance CLMonitor.CircularGeographicCondition);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition and conformance CLMonitor.CircularGeographicCondition;
  if (!lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition and conformance CLMonitor.CircularGeographicCondition)
  {
    result = MEMORY[0x20BD03A18](&protocol conformance descriptor for CLMonitor.CircularGeographicCondition, &type metadata for CLMonitor.CircularGeographicCondition);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition and conformance CLMonitor.CircularGeographicCondition);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition and conformance CLMonitor.CircularGeographicCondition;
  if (!lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition and conformance CLMonitor.CircularGeographicCondition)
  {
    result = MEMORY[0x20BD03A18](&protocol conformance descriptor for CLMonitor.CircularGeographicCondition, &type metadata for CLMonitor.CircularGeographicCondition);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.CircularGeographicCondition and conformance CLMonitor.CircularGeographicCondition);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CLMonitor.MinimumAltitudeCondition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CLMonitor.CircularGeographicCondition(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CLMonitor.MinimumAltitudeCondition and conformance CLMonitor.MinimumAltitudeCondition, (uint64_t (*)(void))lazy protocol witness table accessor for type CLMonitor.MinimumAltitudeCondition and conformance CLMonitor.MinimumAltitudeCondition);
}

uint64_t instantiation function for generic protocol witness table for CLMonitor.CircularGeographicCondition(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = a4();
  result = a5();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type CLMonitor.MinimumAltitudeCondition and conformance CLMonitor.MinimumAltitudeCondition()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition and conformance CLMonitor.MinimumAltitudeCondition;
  if (!lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition and conformance CLMonitor.MinimumAltitudeCondition)
  {
    result = MEMORY[0x20BD03A18](&protocol conformance descriptor for CLMonitor.MinimumAltitudeCondition, &type metadata for CLMonitor.MinimumAltitudeCondition);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition and conformance CLMonitor.MinimumAltitudeCondition);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition and conformance CLMonitor.MinimumAltitudeCondition;
  if (!lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition and conformance CLMonitor.MinimumAltitudeCondition)
  {
    result = MEMORY[0x20BD03A18](&protocol conformance descriptor for CLMonitor.MinimumAltitudeCondition, &type metadata for CLMonitor.MinimumAltitudeCondition);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition and conformance CLMonitor.MinimumAltitudeCondition);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition and conformance CLMonitor.MinimumAltitudeCondition;
  if (!lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition and conformance CLMonitor.MinimumAltitudeCondition)
  {
    result = MEMORY[0x20BD03A18](&protocol conformance descriptor for CLMonitor.MinimumAltitudeCondition, &type metadata for CLMonitor.MinimumAltitudeCondition);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.MinimumAltitudeCondition and conformance CLMonitor.MinimumAltitudeCondition);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CLMonitor.BeaconIdentityCondition(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition and conformance CLMonitor.BeaconIdentityCondition, type metadata accessor for CLMonitor.BeaconIdentityCondition, (uint64_t)&protocol conformance descriptor for CLMonitor.BeaconIdentityCondition);
  result = lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition and conformance CLMonitor.BeaconIdentityCondition, type metadata accessor for CLMonitor.BeaconIdentityCondition, (uint64_t)&protocol conformance descriptor for CLMonitor.BeaconIdentityCondition);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t associated type witness table accessor for ConditionAdapter.Condition : CLCondition in CLMonitor.BeaconIdentityCondition()
{
  return lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type CLMonitor.BeaconIdentityCondition and conformance CLMonitor.BeaconIdentityCondition, type metadata accessor for CLMonitor.BeaconIdentityCondition, (uint64_t)&protocol conformance descriptor for CLMonitor.BeaconIdentityCondition);
}

uint64_t ObjC metadata update function for CLMonitor()
{
  return type metadata accessor for CLMonitor(0);
}

uint64_t type metadata accessor for CLMonitor(uint64_t a1)
{
  return type metadata accessor for CLMonitor.Events(a1, (uint64_t *)&type metadata singleton initialization cache for CLMonitor);
}

uint64_t type metadata accessor for CLMonitor.Events(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata completion function for CLMonitor()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for CLMonitor.Events(319);
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for CLMonitor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CLMonitor.identifiers.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of CLMonitor.add(_:identifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of CLMonitor.add(_:identifier:assuming:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of CLMonitor.remove(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of CLMonitor.record(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of CLMonitor.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v2 + 208) + *(_QWORD *)(v2 + 208));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = dispatch thunk of CLMonitor.__allocating_init(_:);
  return v8(a1, a2);
}

uint64_t destroy for CLMonitor.Record(uint64_t a1)
{

  if (*(_QWORD *)(a1 + 40))
    __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 56);
}

uint64_t initializeWithCopy for CLMonitor.Record(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;

  v4 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = a1 + 16;
  v6 = a2 + 16;
  v7 = *(_QWORD *)(a2 + 40);
  v8 = v4;
  if (v7)
  {
    v9 = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 40) = v7;
    *(_QWORD *)(a1 + 48) = v9;
    (**(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8))(v5, v6, v7);
  }
  else
  {
    v10 = *(_OWORD *)(v6 + 16);
    *(_OWORD *)v5 = *(_OWORD *)v6;
    *(_OWORD *)(v5 + 16) = v10;
    *(_QWORD *)(v5 + 32) = *(_QWORD *)(v6 + 32);
  }
  v11 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v11;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 56, a2 + 56);
  return a1;
}

uint64_t assignWithCopy for CLMonitor.Record(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  v6 = v4;

  v7 = *(_QWORD *)(a2 + 40);
  if (!*(_QWORD *)(a1 + 40))
  {
    if (v7)
    {
      *(_QWORD *)(a1 + 40) = v7;
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
      (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 16, a2 + 16);
      goto LABEL_8;
    }
LABEL_7:
    v8 = *(_OWORD *)(a2 + 16);
    v9 = *(_OWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 16) = v8;
    *(_OWORD *)(a1 + 32) = v9;
    goto LABEL_8;
  }
  if (!v7)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 16);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
LABEL_8:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 56), (uint64_t *)(a2 + 56));
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
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
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for CLMonitor.Record(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  __int128 v6;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;

  if (*(_QWORD *)(a1 + 40))
    __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  return a1;
}

uint64_t getEnumTagSinglePayload for CLMonitor.Record(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 96))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CLMonitor.Record(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 96) = 1;
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
    *(_BYTE *)(result + 96) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CLMonitor.Record()
{
  return &type metadata for CLMonitor.Record;
}

uint64_t initializeBufferWithCopyOfBuffer for CLMonitor.Event(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for CLMonitor.Event(uint64_t a1)
{

  if (*(_QWORD *)(a1 + 32))
    __swift_destroy_boxed_opaque_existential_1(a1 + 8);
}

_QWORD *initializeWithCopy for CLMonitor.Event(_QWORD *a1, uint64_t a2)
{
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  __int128 v10;

  v4 = *(void **)a2;
  *a1 = *(_QWORD *)a2;
  v5 = a1 + 1;
  v6 = a2 + 8;
  v7 = *(_QWORD *)(a2 + 32);
  v8 = v4;
  if (v7)
  {
    v9 = *(_QWORD *)(a2 + 40);
    a1[4] = v7;
    a1[5] = v9;
    (**(void (***)(_QWORD *, uint64_t, uint64_t))(v7 - 8))(v5, v6, v7);
  }
  else
  {
    v10 = *(_OWORD *)(v6 + 16);
    *(_OWORD *)v5 = *(_OWORD *)v6;
    *((_OWORD *)v5 + 1) = v10;
    v5[4] = *(_QWORD *)(v6 + 32);
  }
  return a1;
}

uint64_t assignWithCopy for CLMonitor.Event(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(_QWORD *)(a2 + 32);
  if (!*(_QWORD *)(a1 + 32))
  {
    if (v7)
    {
      *(_QWORD *)(a1 + 32) = v7;
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
      (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 8, a2 + 8);
      return a1;
    }
LABEL_7:
    v8 = *(_OWORD *)(a2 + 8);
    v9 = *(_OWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 8) = v8;
    *(_OWORD *)(a1 + 24) = v9;
    return a1;
  }
  if (!v7)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 8);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 8), (uint64_t *)(a2 + 8));
  return a1;
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

uint64_t assignWithTake for CLMonitor.Event(uint64_t a1, uint64_t a2)
{
  void *v4;
  __int128 v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  if (*(_QWORD *)(a1 + 32))
    __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  v5 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for CLMonitor.Event(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CLMonitor.Event(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
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
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CLMonitor.Event()
{
  return &type metadata for CLMonitor.Event;
}

uint64_t *initializeBufferWithCopyOfBuffer for CLMonitor.Events(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v4, a2, v7);
    v8 = a3[5];
    v9 = (char *)v4 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = a3[6];
    v13 = a3[7];
    v14 = *(void **)((char *)a2 + v12);
    *(uint64_t *)((char *)v4 + v12) = (uint64_t)v14;
    v15 = (uint64_t *)((char *)v4 + v13);
    v16 = (uint64_t *)((char *)a2 + v13);
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    v18 = v14;
  }
  swift_retain();
  return v4;
}

uint64_t destroy for CLMonitor.Events(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);

  return swift_release();
}

uint64_t initializeWithCopy for CLMonitor.Events(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  id v17;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = a3[6];
  v12 = a3[7];
  v13 = *(void **)(a2 + v11);
  *(_QWORD *)(a1 + v11) = v13;
  v14 = (_QWORD *)(a1 + v12);
  v15 = (_QWORD *)(a2 + v12);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v17 = v13;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CLMonitor.Events(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = a3[6];
  v12 = *(void **)(a2 + v11);
  v13 = *(void **)(a1 + v11);
  *(_QWORD *)(a1 + v11) = v12;
  v14 = v12;

  v15 = a3[7];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for CLMonitor.Events(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[7];
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  return a1;
}

uint64_t assignWithTake for CLMonitor.Events(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = *(void **)(a1 + v11);
  *(_QWORD *)(a1 + v11) = *(_QWORD *)(a2 + v11);

  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CLMonitor.Events()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2082F3D04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t storeEnumTagSinglePayload for CLMonitor.Events()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2082F3DC0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

void type metadata completion function for CLMonitor.Events()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for AsyncStream<CLMonitor.Event>(319, &lazy cache variable for type metadata for AsyncStream<CLMonitor.Event>, MEMORY[0x24BEE6A98]);
  if (v0 <= 0x3F)
  {
    type metadata accessor for AsyncStream<CLMonitor.Event>(319, &lazy cache variable for type metadata for AsyncStream<CLMonitor.Event>.Continuation, MEMORY[0x24BEE6A40]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for CLMonitor.Events.Iterator(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Iterator);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = *(void **)((char *)a2 + v8);
    if (v11)
    {
      *(_QWORD *)v9 = v11;
      v12 = *((_QWORD *)v10 + 4);
      v13 = v11;
      if (v12)
      {
        v14 = *((_QWORD *)v10 + 5);
        *((_QWORD *)v9 + 4) = v12;
        *((_QWORD *)v9 + 5) = v14;
        (**(void (***)(uint64_t, uint64_t, uint64_t))(v12 - 8))((uint64_t)(v9 + 8), (uint64_t)(v10 + 8), v12);
      }
      else
      {
        v17 = *(_OWORD *)(v10 + 24);
        *(_OWORD *)(v9 + 8) = *(_OWORD *)(v10 + 8);
        *(_OWORD *)(v9 + 24) = v17;
        *((_QWORD *)v9 + 5) = *((_QWORD *)v10 + 5);
      }
    }
    else
    {
      v16 = *((_OWORD *)v10 + 1);
      *(_OWORD *)v9 = *(_OWORD *)v10;
      *((_OWORD *)v9 + 1) = v16;
      *((_OWORD *)v9 + 2) = *((_OWORD *)v10 + 2);
    }
    v18 = *(int *)(a3 + 24);
    v19 = (uint64_t *)((char *)a1 + v18);
    v20 = (uint64_t *)((char *)a2 + v18);
    v21 = v20[1];
    *v19 = *v20;
    v19[1] = v21;
  }
  swift_retain();
  return a1;
}

uint64_t destroy for CLMonitor.Events.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Iterator);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  if (*(_QWORD *)v5)
  {

    if (*(_QWORD *)(v5 + 32))
      __swift_destroy_boxed_opaque_existential_1(v5 + 8);
  }
  return swift_release();
}

uint64_t initializeWithCopy for CLMonitor.Events.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(void **)(a2 + v7);
  if (v10)
  {
    *(_QWORD *)v8 = v10;
    v11 = *(_QWORD *)(v9 + 32);
    v12 = v10;
    if (v11)
    {
      v13 = *(_QWORD *)(v9 + 40);
      *(_QWORD *)(v8 + 32) = v11;
      *(_QWORD *)(v8 + 40) = v13;
      (**(void (***)(uint64_t, uint64_t, uint64_t))(v11 - 8))(v8 + 8, v9 + 8, v11);
    }
    else
    {
      v15 = *(_OWORD *)(v9 + 24);
      *(_OWORD *)(v8 + 8) = *(_OWORD *)(v9 + 8);
      *(_OWORD *)(v8 + 24) = v15;
      *(_QWORD *)(v8 + 40) = *(_QWORD *)(v9 + 40);
    }
  }
  else
  {
    v14 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v14;
    *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
  }
  v16 = *(int *)(a3 + 24);
  v17 = (_QWORD *)(a1 + v16);
  v18 = (_QWORD *)(a2 + v16);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CLMonitor.Events.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  __int128 *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = (__int128 *)(a2 + v7);
  v10 = *(void **)(a1 + v7);
  v11 = *(void **)(a2 + v7);
  if (!v10)
  {
    if (!v11)
    {
      v20 = *v9;
      v21 = v9[2];
      *(_OWORD *)(v8 + 16) = v9[1];
      *(_OWORD *)(v8 + 32) = v21;
      *(_OWORD *)v8 = v20;
      goto LABEL_15;
    }
    *(_QWORD *)v8 = v11;
    v13 = v8 + 8;
    v14 = (__int128 *)((char *)v9 + 8);
    v16 = *((_QWORD *)v9 + 4);
    v17 = v11;
    if (v16)
    {
      *(_QWORD *)(v8 + 32) = v16;
      *(_QWORD *)(v8 + 40) = *((_QWORD *)v9 + 5);
      (**(void (***)(uint64_t, uint64_t, uint64_t))(v16 - 8))(v8 + 8, (uint64_t)v9 + 8, v16);
      goto LABEL_15;
    }
LABEL_14:
    v22 = *v14;
    v23 = v14[1];
    *(_QWORD *)(v13 + 32) = *((_QWORD *)v14 + 4);
    *(_OWORD *)v13 = v22;
    *(_OWORD *)(v13 + 16) = v23;
    goto LABEL_15;
  }
  if (!v11)
  {
    outlined destroy of CLMonitor.Event(v8);
    v19 = v9[1];
    v18 = v9[2];
    *(_OWORD *)v8 = *v9;
    *(_OWORD *)(v8 + 16) = v19;
    *(_OWORD *)(v8 + 32) = v18;
    goto LABEL_15;
  }
  *(_QWORD *)v8 = v11;
  v12 = v11;

  v13 = v8 + 8;
  v14 = (__int128 *)((char *)v9 + 8);
  v15 = *((_QWORD *)v9 + 4);
  if (!*(_QWORD *)(v8 + 32))
  {
    if (v15)
    {
      *(_QWORD *)(v8 + 32) = v15;
      *(_QWORD *)(v8 + 40) = *((_QWORD *)v9 + 5);
      (**(void (***)(uint64_t, uint64_t))(v15 - 8))(v8 + 8, (uint64_t)v9 + 8);
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (!v15)
  {
    __swift_destroy_boxed_opaque_existential_1(v8 + 8);
    goto LABEL_14;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(v8 + 8), (uint64_t *)v9 + 1);
LABEL_15:
  v24 = *(int *)(a3 + 24);
  v25 = (_QWORD *)(a1 + v24);
  v26 = (_QWORD *)(a2 + v24);
  v27 = v26[1];
  *v25 = *v26;
  v25[1] = v27;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for CLMonitor.Events.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  __int128 v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = (_OWORD *)(a1 + v7);
  v10 = (_OWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v9[2] = v10[2];
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  return a1;
}

uint64_t assignWithTake for CLMonitor.Events.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  void *v10;
  char *v11;
  __int128 v12;
  __int128 v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = (_OWORD *)(a2 + v7);
  v10 = *(void **)(a1 + v7);
  if (!v10)
    goto LABEL_7;
  if (!*(_QWORD *)v9)
  {
    outlined destroy of CLMonitor.Event(v8);
LABEL_7:
    v13 = v9[1];
    *(_OWORD *)v8 = *v9;
    *(_OWORD *)(v8 + 16) = v13;
    *(_OWORD *)(v8 + 32) = v9[2];
    goto LABEL_8;
  }
  *(_QWORD *)v8 = *(_QWORD *)v9;

  v11 = (char *)v9 + 8;
  if (*(_QWORD *)(v8 + 32))
    __swift_destroy_boxed_opaque_existential_1(v8 + 8);
  v12 = *((_OWORD *)v11 + 1);
  *(_OWORD *)(v8 + 8) = *(_OWORD *)v11;
  *(_OWORD *)(v8 + 24) = v12;
  *(_QWORD *)(v8 + 40) = *((_QWORD *)v11 + 4);
LABEL_8:
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CLMonitor.Events.Iterator()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2082F4498(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Iterator);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for CLMonitor.Events.Iterator()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2082F4524(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLMonitor.Event>.Iterator);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

void type metadata completion function for CLMonitor.Events.Iterator()
{
  unint64_t v0;

  type metadata accessor for AsyncStream<CLMonitor.Event>(319, &lazy cache variable for type metadata for AsyncStream<CLMonitor.Event>.Iterator, MEMORY[0x24BEE6A78]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void type metadata accessor for AsyncStream<CLMonitor.Event>(uint64_t a1, unint64_t *a2, uint64_t (*a3)(_QWORD, ValueMetadata *))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    v4 = a3(0, &type metadata for CLMonitor.Event);
    if (!v5)
      atomic_store(v4, a2);
  }
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for CLMonitor.CircularGeographicCondition(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CLMonitor.CircularGeographicCondition(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CLMonitor.CircularGeographicCondition()
{
  return &type metadata for CLMonitor.CircularGeographicCondition;
}

ValueMetadata *type metadata accessor for CLMonitor.MinimumAltitudeCondition()
{
  return &type metadata for CLMonitor.MinimumAltitudeCondition;
}

uint64_t *initializeBufferWithCopyOfBuffer for CLMonitor.BeaconIdentityCondition(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for UUID();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(int *)(a3 + 24);
    v10 = (char *)a1 + v8;
    v11 = (char *)a2 + v8;
    *(_WORD *)v10 = *(_WORD *)v11;
    v10[2] = v11[2];
    v12 = (char *)a1 + v9;
    v13 = (char *)a2 + v9;
    *(_WORD *)v12 = *(_WORD *)v13;
    v12[2] = v13[2];
  }
  return a1;
}

uint64_t destroy for CLMonitor.BeaconIdentityCondition(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for UUID();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for CLMonitor.BeaconIdentityCondition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = a1 + v7;
  v10 = a2 + v7;
  *(_WORD *)v9 = *(_WORD *)v10;
  *(_BYTE *)(v9 + 2) = *(_BYTE *)(v10 + 2);
  v11 = a1 + v8;
  v12 = a2 + v8;
  *(_WORD *)v11 = *(_WORD *)v12;
  *(_BYTE *)(v11 + 2) = *(_BYTE *)(v12 + 2);
  return a1;
}

uint64_t assignWithCopy for CLMonitor.BeaconIdentityCondition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_BYTE *)(v9 + 2);
  *(_WORD *)v8 = *(_WORD *)v9;
  *(_BYTE *)(v8 + 2) = v10;
  v11 = *(int *)(a3 + 24);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = *(_BYTE *)(v13 + 2);
  *(_WORD *)v12 = *(_WORD *)v13;
  *(_BYTE *)(v12 + 2) = v14;
  return a1;
}

uint64_t initializeWithTake for CLMonitor.BeaconIdentityCondition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = a1 + v7;
  v10 = a2 + v7;
  *(_WORD *)v9 = *(_WORD *)v10;
  *(_BYTE *)(v9 + 2) = *(_BYTE *)(v10 + 2);
  v11 = a1 + v8;
  v12 = a2 + v8;
  *(_WORD *)v11 = *(_WORD *)v12;
  *(_BYTE *)(v11 + 2) = *(_BYTE *)(v12 + 2);
  return a1;
}

uint64_t assignWithTake for CLMonitor.BeaconIdentityCondition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = a1 + v7;
  v10 = a2 + v7;
  *(_WORD *)v9 = *(_WORD *)v10;
  *(_BYTE *)(v9 + 2) = *(_BYTE *)(v10 + 2);
  v11 = a1 + v8;
  v12 = a2 + v8;
  *(_WORD *)v11 = *(_WORD *)v12;
  *(_BYTE *)(v11 + 2) = *(_BYTE *)(v12 + 2);
  return a1;
}

uint64_t getEnumTagSinglePayload for CLMonitor.BeaconIdentityCondition()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2082F49FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UUID();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for CLMonitor.BeaconIdentityCondition()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2082F4A44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UUID();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata completion function for CLMonitor.BeaconIdentityCondition()
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

void *type metadata accessor for CLMonitor.Options()
{
  return &unk_24C090220;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTag for CLMonitor.BeaconIdentityCondition.CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for CLMonitor.BeaconIdentityCondition.CodingKeys(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void *type metadata accessor for CLMonitor.BeaconIdentityCondition.CodingKeys()
{
  return &unk_24C08FED0;
}

uint64_t getEnumTagSinglePayload for CLMonitor.MinimumAltitudeCondition.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CLMonitor.MinimumAltitudeCondition.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2082F4BD0 + 4 * byte_2082FCAA0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2082F4BF0 + 4 * byte_2082FCAA5[v4]))();
}

_BYTE *sub_2082F4BD0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2082F4BF0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2082F4BF8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2082F4C00(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2082F4C08(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2082F4C10(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t getEnumTag for CLMonitor.MinimumAltitudeCondition.CodingKeys()
{
  return 0;
}

void *type metadata accessor for CLMonitor.MinimumAltitudeCondition.CodingKeys()
{
  return &unk_24C08FF78;
}

uint64_t getEnumTagSinglePayload for CLMonitor.BeaconIdentityCondition.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CLMonitor.BeaconIdentityCondition.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2082F4D10 + 4 * byte_2082FCAAF[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2082F4D44 + 4 * byte_2082FCAAA[v4]))();
}

uint64_t sub_2082F4D44(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2082F4D4C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2082F4D54);
  return result;
}

uint64_t sub_2082F4D60(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2082F4D68);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2082F4D6C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2082F4D74(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for CLMonitor.CircularGeographicCondition.CodingKeys()
{
  return &unk_24C090048;
}

unint64_t lazy protocol witness table accessor for type CLMonitor.Options and conformance CLMonitor.Options()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CLMonitor.Options and conformance CLMonitor.Options;
  if (!lazy protocol witness table cache variable for type CLMonitor.Options and conformance CLMonitor.Options)
  {
    result = MEMORY[0x20BD03A18](&protocol conformance descriptor for CLMonitor.Options, &unk_24C090220);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.Options and conformance CLMonitor.Options);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CLMonitor.Options and conformance CLMonitor.Options;
  if (!lazy protocol witness table cache variable for type CLMonitor.Options and conformance CLMonitor.Options)
  {
    result = MEMORY[0x20BD03A18](&protocol conformance descriptor for CLMonitor.Options, &unk_24C090220);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.Options and conformance CLMonitor.Options);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CLMonitor.Options and conformance CLMonitor.Options;
  if (!lazy protocol witness table cache variable for type CLMonitor.Options and conformance CLMonitor.Options)
  {
    result = MEMORY[0x20BD03A18](&protocol conformance descriptor for CLMonitor.Options, &unk_24C090220);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.Options and conformance CLMonitor.Options);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CLMonitor.Options and conformance CLMonitor.Options;
  if (!lazy protocol witness table cache variable for type CLMonitor.Options and conformance CLMonitor.Options)
  {
    result = MEMORY[0x20BD03A18](&protocol conformance descriptor for CLMonitor.Options, &unk_24C090220);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLMonitor.Options and conformance CLMonitor.Options);
  }
  return result;
}

void *specialized _NativeDictionary.copy()()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
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
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _OWORD *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  uint64_t *v31;
  _OWORD v32[6];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, CLMonitor.Record>);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)();
  v4 = v3;
  v5 = *(_QWORD *)(v2 + 16);
  if (!v5)
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v31 = v1;
  result = (void *)(v3 + 64);
  v7 = v2 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v8)
  {
    result = memmove(result, (const void *)(v2 + 64), 8 * v8);
    v5 = *(_QWORD *)(v2 + 16);
  }
  v10 = 0;
  *(_QWORD *)(v4 + 16) = v5;
  v11 = 1 << *(_BYTE *)(v2 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v2 + 64);
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
    v28 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v28 >= v14)
      goto LABEL_26;
    v29 = *(_QWORD *)(v7 + 8 * v28);
    ++v10;
    if (!v29)
    {
      v10 = v28 + 1;
      if (v28 + 1 >= v14)
        goto LABEL_26;
      v29 = *(_QWORD *)(v7 + 8 * v10);
      if (!v29)
        break;
    }
LABEL_25:
    v13 = (v29 - 1) & v29;
    v16 = __clz(__rbit64(v29)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v16);
    v20 = *v18;
    v19 = v18[1];
    v21 = 96 * v16;
    outlined init with copy of CLMonitor.Record(*(_QWORD *)(v2 + 56) + 96 * v16, (uint64_t)v32);
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v17);
    *v22 = v20;
    v22[1] = v19;
    v23 = (_OWORD *)(*(_QWORD *)(v4 + 56) + v21);
    v24 = v32[1];
    *v23 = v32[0];
    v25 = v32[2];
    v26 = v32[3];
    v27 = v32[5];
    v23[4] = v32[4];
    v23[5] = v27;
    v23[2] = v25;
    v23[3] = v26;
    v23[1] = v24;
    result = (void *)swift_bridgeObjectRetain();
  }
  v30 = v28 + 2;
  if (v30 >= v14)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v31;
    goto LABEL_28;
  }
  v29 = *(_QWORD *)(v7 + 8 * v30);
  if (v29)
  {
    v10 = v30;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v29 = *(_QWORD *)(v7 + 8 * v10);
    ++v30;
    if (v29)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t specialized SetAlgebra<>.init(arrayLiteral:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

unint64_t specialized CLMonitor.CircularGeographicCondition.CodingKeys.init(rawValue:)(Swift::String string, Swift::OpaquePointer cases)
{
  void *object;
  Swift::String v3;
  unint64_t v5;

  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  v5 = _findStringSwitchCase(cases:string:)(cases, v3);
  swift_bridgeObjectRelease();
  if (v5 >= 3)
    return 3;
  else
    return v5;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t outlined init with take of CLCondition?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CLCondition?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of CLMonitor.Record(uint64_t a1)
{
  destroy for CLMonitor.Record(a1);
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

uint64_t outlined assign with take of CLMonitor.Record(uint64_t a1, uint64_t a2)
{
  assignWithTake for CLMonitor.Record(a2, a1);
  return a2;
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

uint64_t partial apply for closure #1 in CLMonitor.Events.init(_:_:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in CLMonitor.Events.init(_:_:)(a1, *(_QWORD *)(v1 + 16));
}

uint64_t partial apply for closure #2 in CLMonitor.Events.init(_:_:)(uint64_t a1, void *a2)
{
  return closure #2 in CLMonitor.Events.init(_:_:)(a1, a2);
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

uint64_t outlined destroy of CLMonitor.Event?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined init with copy of CLCondition?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t related decl 'e' for CLError.alternateRegion.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  *(_QWORD *)&v8 = a1;
  type metadata accessor for related decl 'e' for CLError(0);
  lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError();
  v1 = _BridgedStoredNSError.userInfo.getter();
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(_QWORD *)(v1 + 16) && (v4 = specialized __RawDictionaryStorage.find<A>(_:)(v2, v3), (v5 & 1) != 0))
  {
    outlined init with copy of Any(*(_QWORD *)(v1 + 56) + 32 * v4, (uint64_t)&v8);
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v9 + 1))
  {
    type metadata accessor for CLRegion();
    if (swift_dynamicCast())
      return v7;
    else
      return 0;
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v8);
    return 0;
  }
}

unint64_t lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError;
  if (!lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError)
  {
    type metadata accessor for related decl 'e' for CLError(255);
    result = MEMORY[0x20BD03A18](&protocol conformance descriptor for related decl 'e' for CLError, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type related decl 'e' for CLError and conformance related decl 'e' for CLError);
  }
  return result;
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t type metadata accessor for CLRegion()
{
  unint64_t result;

  result = lazy cache variable for type metadata for CLRegion;
  if (!lazy cache variable for type metadata for CLRegion)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for CLRegion);
  }
  return result;
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t CLServiceSession.__allocating_init(authorization:)(unsigned __int8 *a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;

  v2 = swift_allocObject();
  v3 = *a1;
  *(_QWORD *)(v2 + 24) = 0;
  v4 = objc_msgSend((id)objc_opt_self(), sel_disconnectedSessionRequiringAuthorization_, v3);
  *(_QWORD *)(v2 + 16) = v4;
  type metadata accessor for CLServiceSession.Diagnostics(0);
  swift_allocObject();
  v5 = v4;
  v6 = specialized CLServiceSession.Diagnostics.init(_:)(v5);

  *(_QWORD *)(v2 + 24) = v6;
  return v2;
}

uint64_t CLServiceSession.init(authorization:)(unsigned __int8 *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;

  v2 = v1;
  v3 = *a1;
  *(_QWORD *)(v2 + 24) = 0;
  v4 = objc_msgSend((id)objc_opt_self(), sel_disconnectedSessionRequiringAuthorization_, v3);
  *(_QWORD *)(v2 + 16) = v4;
  type metadata accessor for CLServiceSession.Diagnostics(0);
  swift_allocObject();
  v5 = v4;
  v6 = specialized CLServiceSession.Diagnostics.init(_:)(v5);

  *(_QWORD *)(v2 + 24) = v6;
  swift_release();
  return v2;
}

uint64_t type metadata accessor for CLServiceSession.Diagnostics(uint64_t a1)
{
  return type metadata accessor for CLMonitor.Events(a1, (uint64_t *)&type metadata singleton initialization cache for CLServiceSession.Diagnostics);
}

uint64_t CLServiceSession.__allocating_init(authorization:fullAccuracyPurposeKey:)(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;

  v6 = swift_allocObject();
  v7 = *a1;
  *(_QWORD *)(v6 + 24) = 0;
  v8 = (void *)objc_opt_self();
  v9 = (void *)MEMORY[0x20BD03430](a2, a3);
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v8, sel_disconnectedSessionRequiringAuthorization_fullAccuracyPurposeKey_, v7, v9);

  *(_QWORD *)(v6 + 16) = v10;
  type metadata accessor for CLServiceSession.Diagnostics(0);
  swift_allocObject();
  v11 = v10;
  v12 = specialized CLServiceSession.Diagnostics.init(_:)(v11);

  *(_QWORD *)(v6 + 24) = v12;
  return v6;
}

uint64_t CLServiceSession.init(authorization:fullAccuracyPurposeKey:)(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;

  v4 = v3;
  v7 = *a1;
  *(_QWORD *)(v4 + 24) = 0;
  v8 = (void *)objc_opt_self();
  v9 = (void *)MEMORY[0x20BD03430](a2, a3);
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v8, sel_disconnectedSessionRequiringAuthorization_fullAccuracyPurposeKey_, v7, v9);

  *(_QWORD *)(v4 + 16) = v10;
  type metadata accessor for CLServiceSession.Diagnostics(0);
  swift_allocObject();
  v11 = v10;
  v12 = specialized CLServiceSession.Diagnostics.init(_:)(v11);

  *(_QWORD *)(v4 + 24) = v12;
  swift_release();
  return v4;
}

void thunk for @escaping @callee_guaranteed (@guaranteed CLServiceSessionDiagnostic) -> ()(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

Swift::Void __swiftcall CLServiceSession.invalidate()()
{
  uint64_t v0;

  objc_msgSend(*(id *)(v0 + 16), sel_invalidate);
}

uint64_t CLServiceSession.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t CLServiceSession.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();
  return swift_deallocClassInstance();
}

uint64_t CLLocationManager.serviceSession()()
{
  return CLLocationManager.serviceSession()(1);
}

uint64_t CLLocationManager.privilegedServiceSession()()
{
  return CLLocationManager.serviceSession()(2);
}

uint64_t CLLocationManager.serviceSession()(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v16[2];

  v16[0] = a1;
  v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for OS_dispatch_queue.Attributes();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v6);
  v8 = type metadata accessor for DispatchQoS();
  MEMORY[0x24BDAC7A8](v8);
  type metadata accessor for OS_dispatch_queue();
  v9 = v1;
  static DispatchQoS.unspecified.getter();
  v16[1] = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, v7, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE5750], v2);
  v10 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  type metadata accessor for CLServiceSession();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 24) = 0;
  v12 = objc_msgSend((id)objc_opt_self(), sel_sessionWithLocationManager_authorizationRequirement_fullAccuracyPurposeKey_queue_handler_, v9, v16[0], 0, v10, 0);
  *(_QWORD *)(v11 + 16) = v12;
  type metadata accessor for CLServiceSession.Diagnostics(0);
  swift_allocObject();
  v13 = v12;
  v14 = specialized CLServiceSession.Diagnostics.init(_:)(v13);

  *(_QWORD *)(v11 + 24) = v14;
  return v11;
}

id CLServiceSession.Diagnostic.authorizationDenied.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_authorizationDenied);
}

id CLServiceSession.Diagnostic.authorizationDeniedGlobally.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_authorizationDeniedGlobally);
}

id CLServiceSession.Diagnostic.authorizationRestricted.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_authorizationRestricted);
}

id CLServiceSession.Diagnostic.insufficientlyInUse.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_insufficientlyInUse);
}

id CLServiceSession.Diagnostic.fullAccuracyDenied.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_fullAccuracyDenied);
}

id CLServiceSession.Diagnostic.alwaysAuthorizationDenied.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_alwaysAuthorizationDenied);
}

id CLServiceSession.Diagnostic.serviceSessionRequired.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_serviceSessionRequired);
}

id CLServiceSession.Diagnostic.authorizationRequestInProgress.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_authorizationRequestInProgress);
}

uint64_t CLServiceSession.Diagnostics.Iterator.next()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Iterator);
  *v1 = v0;
  v1[1] = CLServiceSession.Diagnostics.Iterator.next();
  return AsyncStream.Iterator.next()();
}

{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance CLServiceSession.Diagnostics.Iterator()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Iterator);
  *v1 = v0;
  v1[1] = protocol witness for AsyncIteratorProtocol.next() in conformance CLServiceSession.Diagnostics.Iterator;
  return AsyncStream.Iterator.next()();
}

uint64_t CLServiceSession.Diagnostics.makeAsyncIterator()()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  if (one-time initialization token for logger != -1)
    swift_once();
  v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)logger);
  v1 = Logger.logObject.getter();
  v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2082EC000, v1, v2, "#serviceSession makeAsyncIterator", v3, 2u);
    MEMORY[0x20BD03A90](v3, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>);
  return AsyncStream.makeAsyncIterator()();
}

void closure #1 in CLServiceSession.Diagnostics.init(_:)(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD v11[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Continuation.YieldResult);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[1] = a1;
  v6 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Continuation);
  AsyncStream.Continuation.yield(_:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (one-time initialization token for logger != -1)
    swift_once();
  v7 = type metadata accessor for Logger();
  __swift_project_value_buffer(v7, (uint64_t)logger);
  v8 = Logger.logObject.getter();
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2082EC000, v8, v9, "#serviceSession yielding a Diagnostic", v10, 2u);
    MEMORY[0x20BD03A90](v10, -1, -1);
  }

}

id closure #2 in CLServiceSession.Diagnostics.init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  if (one-time initialization token for logger != -1)
    swift_once();
  v3 = type metadata accessor for Logger();
  __swift_project_value_buffer(v3, (uint64_t)logger);
  v4 = Logger.logObject.getter();
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2082EC000, v4, v5, "#serviceSession terminating", v6, 2u);
    MEMORY[0x20BD03A90](v6, -1, -1);
  }

  return objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtCC12CoreLocation16CLServiceSession11Diagnostics_serviceSession), sel_invalidate);
}

uint64_t CLServiceSession.Diagnostics.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtCC12CoreLocation16CLServiceSession11Diagnostics_stream;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  return v0;
}

uint64_t CLServiceSession.Diagnostics.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtCC12CoreLocation16CLServiceSession11Diagnostics_stream;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t protocol witness for AsyncSequence.makeAsyncIterator() in conformance CLServiceSession.Diagnostics()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  if (one-time initialization token for logger != -1)
    swift_once();
  v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)logger);
  v1 = Logger.logObject.getter();
  v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2082EC000, v1, v2, "#serviceSession makeAsyncIterator", v3, 2u);
    MEMORY[0x20BD03A90](v3, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>);
  AsyncStream.makeAsyncIterator()();
  return swift_release();
}

uint64_t CLServiceSession.diagnostics.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t result;

  v1 = v0;
  if (one-time initialization token for logger != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)logger);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2082EC000, v3, v4, "#serviceSession creating a Diagnostics AsyncSequence", v5, 2u);
    MEMORY[0x20BD03A90](v5, -1, -1);
  }

  result = *(_QWORD *)(v1 + 24);
  if (result)
    return swift_retain();
  __break(1u);
  return result;
}

BOOL static CLServiceSession.AuthorizationRequirement.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void CLServiceSession.AuthorizationRequirement.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int CLServiceSession.AuthorizationRequirement.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CLServiceSession.AuthorizationRequirement(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CLServiceSession.AuthorizationRequirement()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance CLServiceSession.AuthorizationRequirement()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CLServiceSession.AuthorizationRequirement()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t serialize(_:at:)(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t specialized CLServiceSession.Diagnostics.init(_:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, char *, uint64_t);
  void *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  _QWORD v32[2];
  void *v33;
  uint64_t v34;
  _QWORD aBlock[6];

  v33 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Continuation.BufferingPolicy);
  v2 = *(_QWORD *)(v1 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = (char *)v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Continuation);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v32[0] = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v32 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE6A10], v1);
  static AsyncStream.makeStream(of:bufferingPolicy:)();
  v15 = v4;
  v16 = v12;
  v17 = v5;
  v18 = v1;
  v19 = v32[1];
  (*(void (**)(char *, uint64_t))(v2 + 8))(v15, v18);
  v20 = *(void (**)(uint64_t, char *, uint64_t))(v16 + 16);
  v34 = v11;
  v20(v19 + OBJC_IVAR____TtCC12CoreLocation16CLServiceSession11Diagnostics_stream, v14, v11);
  v21 = v33;
  *(_QWORD *)(v19 + OBJC_IVAR____TtCC12CoreLocation16CLServiceSession11Diagnostics_serviceSession) = v33;
  v22 = v32[0];
  (*(void (**)(_QWORD, char *, uint64_t))(v6 + 16))(v32[0], v10, v17);
  v23 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v24 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v6 + 32))(v24 + v23, v22, v17);
  aBlock[4] = partial apply for closure #1 in CLServiceSession.Diagnostics.init(_:);
  aBlock[5] = v24;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed CLServiceSessionDiagnostic) -> ();
  aBlock[3] = &block_descriptor_0;
  v25 = _Block_copy(aBlock);
  v26 = v21;
  swift_release();
  objc_msgSend(v26, sel_setHandler_, v25);
  _Block_release(v25);

  if (one-time initialization token for logger != -1)
    swift_once();
  v27 = type metadata accessor for Logger();
  __swift_project_value_buffer(v27, (uint64_t)logger);
  v28 = Logger.logObject.getter();
  v29 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v30 = 0;
    _os_log_impl(&dword_2082EC000, v28, v29, "#serviceSession successfully created", v30, 2u);
    MEMORY[0x20BD03A90](v30, -1, -1);
  }

  swift_retain();
  AsyncStream.Continuation.onTermination.setter();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v17);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v14, v34);
  return v19;
}

unint64_t type metadata accessor for OS_dispatch_queue()
{
  unint64_t result;

  result = lazy cache variable for type metadata for OS_dispatch_queue;
  if (!lazy cache variable for type metadata for OS_dispatch_queue)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A];
  if (!lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
    result = MEMORY[0x20BD03A18](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A]);
  }
  return result;
}

uint64_t type metadata accessor for CLServiceSession()
{
  return objc_opt_self();
}

uint64_t associated type witness table accessor for AsyncSequence.AsyncIterator : AsyncIteratorProtocol in CLServiceSession.Diagnostics()
{
  return lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type CLServiceSession.Diagnostics.Iterator and conformance CLServiceSession.Diagnostics.Iterator, type metadata accessor for CLServiceSession.Diagnostics.Iterator, (uint64_t)&protocol conformance descriptor for CLServiceSession.Diagnostics.Iterator);
}

uint64_t type metadata accessor for CLServiceSession.Diagnostics.Iterator(uint64_t a1)
{
  return type metadata accessor for CLMonitor.Events(a1, (uint64_t *)&type metadata singleton initialization cache for CLServiceSession.Diagnostics.Iterator);
}

unint64_t lazy protocol witness table accessor for type CLServiceSession.AuthorizationRequirement and conformance CLServiceSession.AuthorizationRequirement()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CLServiceSession.AuthorizationRequirement and conformance CLServiceSession.AuthorizationRequirement;
  if (!lazy protocol witness table cache variable for type CLServiceSession.AuthorizationRequirement and conformance CLServiceSession.AuthorizationRequirement)
  {
    result = MEMORY[0x20BD03A18](&protocol conformance descriptor for CLServiceSession.AuthorizationRequirement, &type metadata for CLServiceSession.AuthorizationRequirement);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLServiceSession.AuthorizationRequirement and conformance CLServiceSession.AuthorizationRequirement);
  }
  return result;
}

uint64_t method lookup function for CLServiceSession()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CLServiceSession.__allocating_init(authorization:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of CLServiceSession.__allocating_init(authorization:fullAccuracyPurposeKey:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

ValueMetadata *type metadata accessor for CLServiceSession.Diagnostic()
{
  return &type metadata for CLServiceSession.Diagnostic;
}

uint64_t ObjC metadata update function for CLServiceSession.Diagnostics()
{
  return type metadata accessor for CLServiceSession.Diagnostics(0);
}

void type metadata completion function for CLServiceSession.Diagnostics()
{
  unint64_t v0;

  type metadata accessor for AsyncStream<CLServiceSession.Diagnostic>(319, &lazy cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>, MEMORY[0x24BEE6A98]);
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for CLServiceSession.Diagnostics()
{
  return swift_lookUpClassMethod();
}

uint64_t initializeBufferWithCopyOfBuffer for CLServiceSession.Diagnostics.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Iterator);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for CLServiceSession.Diagnostics.Iterator(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Iterator);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for CLServiceSession.Diagnostics.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for CLServiceSession.Diagnostics.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for CLServiceSession.Diagnostics.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for CLServiceSession.Diagnostics.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for CLServiceSession.Diagnostics.Iterator()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2082F6E38(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Iterator);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for CLServiceSession.Diagnostics.Iterator()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2082F6E84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Iterator);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

void type metadata completion function for CLServiceSession.Diagnostics.Iterator()
{
  unint64_t v0;

  type metadata accessor for AsyncStream<CLServiceSession.Diagnostic>(319, &lazy cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Iterator, MEMORY[0x24BEE6A78]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void type metadata accessor for AsyncStream<CLServiceSession.Diagnostic>(uint64_t a1, unint64_t *a2, uint64_t (*a3)(_QWORD, ValueMetadata *))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    v4 = a3(0, &type metadata for CLServiceSession.Diagnostic);
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t storeEnumTagSinglePayload for CLServiceSession.AuthorizationRequirement(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2082F6FD4 + 4 * byte_2082FD455[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2082F7008 + 4 * byte_2082FD450[v4]))();
}

uint64_t sub_2082F7008(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2082F7010(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2082F7018);
  return result;
}

uint64_t sub_2082F7024(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2082F702CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2082F7030(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2082F7038(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CLServiceSession.AuthorizationRequirement()
{
  return &type metadata for CLServiceSession.AuthorizationRequirement;
}

uint64_t sub_2082F7054()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Continuation);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

void partial apply for closure #1 in CLServiceSession.Diagnostics.init(_:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLServiceSession.Diagnostic>.Continuation);
  closure #1 in CLServiceSession.Diagnostics.init(_:)(a1);
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

id partial apply for closure #2 in CLServiceSession.Diagnostics.init(_:)(uint64_t a1)
{
  uint64_t v1;

  return closure #2 in CLServiceSession.Diagnostics.init(_:)(a1, v1);
}

const char *one-time initialization function for CLLocationCoordinate2DInNSValueObjCType()
{
  const char *result;

  result = closure #1 in variable initialization expression of CLLocationCoordinate2DInNSValueObjCType();
  CLLocationCoordinate2DInNSValueObjCType = (uint64_t)result;
  return result;
}

const char *closure #1 in variable initialization expression of CLLocationCoordinate2DInNSValueObjCType()
{
  uint64_t v0;
  void *ObjCClassFromMetadata;
  uint64_t (*v2)(void *, uint64_t, double, double);
  id v3;
  id v4;
  id v5;

  v0 = Selector.init(_:)();
  type metadata accessor for NSValue();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v2 = (uint64_t (*)(void *, uint64_t, double, double))objc_msgSend(ObjCClassFromMetadata, sel_methodForSelector_, v0);
  if (v2)
  {
    v3 = (id)v2(ObjCClassFromMetadata, v0, 0.0, 0.0);
    v4 = objc_msgSend(v3, sel_objCType);
    v5 = v3;
    return (const char *)v4;
  }
  else
  {
    type metadata accessor for CLLocationCoordinate2D(0);
    return "{CLLocationCoordinate2D=dd}";
  }
}

NSValue __swiftcall CLLocationCoordinate2D._bridgeToObjectiveC()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = v0;
  v4 = v1;
  if (one-time initialization token for CLLocationCoordinate2DInNSValueObjCType != -1)
    swift_once();
  return (NSValue)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1968]), sel_initWithBytes_objCType_, &v3, CLLocationCoordinate2DInNSValueObjCType);
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance CLLocationCoordinate2D()
{
  __int128 *v0;
  __int128 v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2 = *v0;
  if (one-time initialization token for CLLocationCoordinate2DInNSValueObjCType != -1)
    swift_once();
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1968]), sel_initWithBytes_objCType_, &v2, CLLocationCoordinate2DInNSValueObjCType);
}

void protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance CLLocationCoordinate2D(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  *(double *)a2 = specialized static CLLocationCoordinate2D._unconditionallyBridgeFromObjectiveC(_:)(a1);
  *(_QWORD *)(a2 + 8) = v3;
}

double specialized static CLLocationCoordinate2D._forceBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  double result;
  double v6[3];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  if (one-time initialization token for CLLocationCoordinate2DInNSValueObjCType != -1)
    swift_once();
  if (strcmp(v4, (const char *)CLLocationCoordinate2DInNSValueObjCType))
    __break(1u);
  *(_OWORD *)v6 = 0uLL;
  objc_msgSend(v3, sel_getValue_, v6);
  result = v6[0];
  *(_OWORD *)a2 = *(_OWORD *)v6;
  *(_BYTE *)(a2 + 16) = 0;
  return result;
}

BOOL specialized static CLLocationCoordinate2D._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  int v5;
  __int128 v6;
  _BOOL8 result;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  if (one-time initialization token for CLLocationCoordinate2DInNSValueObjCType != -1)
    swift_once();
  v5 = strcmp(v4, (const char *)CLLocationCoordinate2DInNSValueObjCType);
  v6 = 0uLL;
  if (!v5)
  {
    v8 = 0uLL;
    objc_msgSend(v3, sel_getValue_, &v8, 0.0);
    v6 = v8;
  }
  result = v5 == 0;
  *(_OWORD *)a2 = v6;
  *(_BYTE *)(a2 + 16) = v5 != 0;
  return result;
}

double specialized static CLLocationCoordinate2D._unconditionallyBridgeFromObjectiveC(_:)(void *a1)
{
  id v1;
  const char *v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  if (!a1)
LABEL_7:
    __break(1u);
  v1 = objc_retainAutorelease(a1);
  v2 = (const char *)objc_msgSend(v1, sel_objCType);
  if (one-time initialization token for CLLocationCoordinate2DInNSValueObjCType != -1)
    swift_once();
  if (strcmp(v2, (const char *)CLLocationCoordinate2DInNSValueObjCType))
  {
    __break(1u);
    goto LABEL_7;
  }
  v4[0] = 0;
  v4[1] = 0;
  objc_msgSend(v1, sel_getValue_, v4);
  return *(double *)v4;
}

unint64_t type metadata accessor for NSValue()
{
  unint64_t result;

  result = lazy cache variable for type metadata for NSValue;
  if (!lazy cache variable for type metadata for NSValue)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSValue);
  }
  return result;
}

uint64_t _CLUpdaterAdapter.__deallocating_deinit()
{
  uint64_t v0;

  objc_msgSend(*(id *)(v0 + 16), sel_pause);

  return swift_deallocClassInstance();
}

void thunk for @escaping @callee_guaranteed (@guaranteed CLUpdate?) -> ()(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

id CLLocationUpdate.location.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_location);
}

id CLLocationUpdate.isStationary.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_isStationary);
}

id CLLocationUpdate.stationary.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_stationary);
}

id CLLocationUpdate.authorizationDenied.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_authorizationDenied);
}

id CLLocationUpdate.authorizationDeniedGlobally.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_authorizationDeniedGlobally);
}

id CLLocationUpdate.authorizationRestricted.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_authorizationRestricted);
}

id CLLocationUpdate.insufficientlyInUse.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_insufficientlyInUse);
}

id CLLocationUpdate.locationUnavailable.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_locationUnavailable);
}

id CLLocationUpdate.accuracyLimited.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_accuracyLimited);
}

id CLLocationUpdate.serviceSessionRequired.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_serviceSessionRequired);
}

id CLLocationUpdate.authorizationRequestInProgress.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_authorizationRequestInProgress);
}

BOOL static CLLocationUpdate.LiveConfiguration.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void CLLocationUpdate.LiveConfiguration.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int CLLocationUpdate.LiveConfiguration.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void static CLLocationUpdate.liveUpdates(_:)(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  unsigned __int8 v2;

  v2 = *a1;
  CLLocationUpdate.Updates.init(_:configuration:)(0, &v2, a2);
}

void CLLocationUpdate.Updates.init(_:configuration:)(void *a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v24 = a3;
  v26 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v5 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for OS_dispatch_queue.Attributes();
  MEMORY[0x24BDAC7A8](v8);
  v9 = type metadata accessor for DispatchQoS();
  MEMORY[0x24BDAC7A8](v9);
  v10 = *a2;
  v25 = a1;
  if (a1)
  {
    type metadata accessor for OS_dispatch_queue();
    v11 = a1;
    static DispatchQoS.unspecified.getter();
    v28 = MEMORY[0x24BEE4AF8];
    lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
    lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEE5750], v26);
    v12 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
    v13 = objc_msgSend(v11, sel_liveUpdaterWithConfiguration_queue_handler_, v10, v12, 0);

  }
  else
  {
    v14 = (void *)objc_opt_self();
    type metadata accessor for OS_dispatch_queue();
    static DispatchQoS.unspecified.getter();
    v28 = MEMORY[0x24BEE4AF8];
    lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
    lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEE5750], v26);
    v12 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
    v13 = objc_msgSend(v14, sel__liveUpdaterWithConfiguration_queue_handler_, v10, v12, 0);
  }

  if (one-time initialization token for logger != -1)
    swift_once();
  v15 = type metadata accessor for Logger();
  __swift_project_value_buffer(v15, (uint64_t)logger);
  v16 = Logger.logObject.getter();
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    v19 = swift_slowAlloc();
    v28 = v19;
    *(_DWORD *)v18 = 136315138;
    LOBYTE(v27) = v10;
    v20 = String.init<A>(describing:)();
    v27 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v21, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2082EC000, v16, v17, "#LocationUpdates Creating liveUpdates %s", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x20BD03A90](v19, -1, -1);
    MEMORY[0x20BD03A90](v18, -1, -1);
  }

  if (v13)
  {
    v22 = v13;
    CLLocationUpdate.Updates.init(updater:isHistorical:)(v22, 0, v24);

  }
  else
  {
    __break(1u);
  }
}

void static CLLocationUpdate.historicalUpdates(interestInterval:maxSampleCount:)(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v7 = a3 & 1;
  v8 = type metadata accessor for DateInterval();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v11 + 16))(v10, a1);
  CLLocationUpdate.Updates.init(_:interestInterval:maxSampleCount:)(0, v10, a2, v7, a4);
}

void CLLocationUpdate.Updates.init(_:interestInterval:maxSampleCount:)(void *a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
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
  void *v18;
  Class v19;
  objc_class *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  objc_class *v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  void *v49;
  Class isa;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;

  v54 = a2;
  v9 = type metadata accessor for DateInterval();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v51 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v45 = *(_QWORD *)(v12 - 8);
  v46 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v47 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for OS_dispatch_queue.Attributes();
  MEMORY[0x24BDAC7A8](v14);
  v15 = type metadata accessor for DispatchQoS();
  MEMORY[0x24BDAC7A8](v15);
  v48 = a5;
  v49 = a1;
  v52 = v10;
  v53 = v9;
  v44 = a4;
  v43 = a3;
  if (a1)
  {
    v16 = a1;
    isa = DateInterval._bridgeToObjectiveC()().super.isa;
    if ((a4 & 1) != 0)
      v17 = 0x7FFFFFFFLL;
    else
      v17 = a3;
    if (v17 < (uint64_t)0xFFFFFFFF80000000)
    {
      __break(1u);
    }
    else if (v17 <= 0x7FFFFFFF)
    {
      type metadata accessor for OS_dispatch_queue();
      static DispatchQoS.unspecified.getter();
      v55 = MEMORY[0x24BEE4AF8];
      lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
      lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]();
      dispatch thunk of SetAlgebra.init<A>(_:)();
      (*(void (**)(char *, _QWORD, uint64_t))(v45 + 104))(v47, *MEMORY[0x24BEE5750], v46);
      v18 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
      v19 = isa;
      v20 = (objc_class *)objc_msgSend(v16, sel_historicalUpdaterWithDateInterval_sampleCount_queue_handler_, isa, v17, v18, 0);

      goto LABEL_14;
    }
    __break(1u);
    goto LABEL_23;
  }
  isa = DateInterval._bridgeToObjectiveC()().super.isa;
  if ((a4 & 1) != 0)
    v21 = 0x7FFFFFFFLL;
  else
    v21 = a3;
  v22 = objc_opt_self();
  if (v21 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v21 > 0x7FFFFFFF)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v23 = (void *)v22;
  type metadata accessor for OS_dispatch_queue();
  static DispatchQoS.unspecified.getter();
  v55 = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, _QWORD, uint64_t))(v45 + 104))(v47, *MEMORY[0x24BEE5750], v46);
  v16 = (id)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  v19 = isa;
  v20 = (objc_class *)objc_msgSend(v23, sel__historicalUpdaterWithDateInterval_sampleCount_queue_handler_, isa, v21, v16, 0);
LABEL_14:

  v24 = v53;
  if (one-time initialization token for logger != -1)
    swift_once();
  v25 = type metadata accessor for Logger();
  __swift_project_value_buffer(v25, (uint64_t)logger);
  v27 = v51;
  v26 = v52;
  (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v51, v54, v24);
  v28 = Logger.logObject.getter();
  v29 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = swift_slowAlloc();
    isa = v20;
    v31 = v30;
    v32 = swift_slowAlloc();
    v57 = v32;
    *(_DWORD *)v31 = 136315394;
    lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type DateInterval and conformance DateInterval, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], MEMORY[0x24BDCB8B8]);
    v33 = dispatch thunk of CustomStringConvertible.description.getter();
    v55 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v33, v34, &v57);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v35 = *(void (**)(char *, uint64_t))(v26 + 8);
    v35(v27, v24);
    *(_WORD *)(v31 + 12) = 2080;
    v55 = v43;
    v56 = v44 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Int?);
    v36 = String.init<A>(describing:)();
    v55 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v36, v37, &v57);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2082EC000, v28, v29, "#LocationUpdates Creating historicalUpdates with interestInterval: %s, maxSampleCount: %s", (uint8_t *)v31, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x20BD03A90](v32, -1, -1);
    v38 = v31;
    v20 = isa;
    MEMORY[0x20BD03A90](v38, -1, -1);
  }
  else
  {
    v35 = *(void (**)(char *, uint64_t))(v26 + 8);
    v35(v27, v24);
  }

  v40 = v48;
  v39 = v49;
  if (v20)
  {
    v41 = v20;
    CLLocationUpdate.Updates.init(updater:isHistorical:)(v41, 1, v40);

    v35(v54, v24);
    return;
  }
LABEL_25:
  __break(1u);
}

void static CLLocationUpdate.historicalUpdates(center:radius:interestInterval:maxSampleCount:)(uint64_t a1@<X0>, double a2@<X1>, char a3@<W2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>)
{
  int v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;

  v13 = a3 & 1;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v17 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of DateInterval?(a1, (uint64_t)v16);
  CLLocationUpdate.Updates.init(_:center:radius:interestInterval:maxSampleCount:)(0, (uint64_t)v16, a2, v13, a4, a5, a6, a7);
}

uint64_t outlined init with copy of DateInterval?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void CLLocationUpdate.Updates.init(_:center:radius:interestInterval:maxSampleCount:)(void *a1@<X0>, uint64_t a2@<X1>, double a3@<X2>, int a4@<W3>, uint64_t a5@<X8>, double a6@<D0>, double a7@<D1>, double a8@<D2>)
{
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
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  id v30;
  Class isa;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  int v62;
  double v63;
  double v64;
  uint64_t v65;

  v62 = a4;
  v61 = a3;
  v55 = a5;
  v13 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v57 = *(_QWORD *)(v13 - 8);
  v58 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for OS_dispatch_queue.Attributes();
  MEMORY[0x24BDAC7A8](v16);
  v17 = type metadata accessor for DispatchQoS();
  MEMORY[0x24BDAC7A8](v17);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  v18 = MEMORY[0x24BDAC7A8](v54);
  v53 = (uint64_t)&v52 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v59 = (uint64_t)&v52 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v52 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v52 - v25;
  v60 = a2;
  v56 = a1;
  if (a1)
  {
    outlined init with copy of DateInterval?(a2, (uint64_t)&v52 - v25);
    v27 = type metadata accessor for DateInterval();
    v28 = *(_QWORD *)(v27 - 8);
    v29 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27);
    v30 = a1;
    isa = 0;
    if (v29 != 1)
    {
      isa = DateInterval._bridgeToObjectiveC()().super.isa;
      (*(void (**)(char *, uint64_t))(v28 + 8))(v26, v27);
    }
    if ((v62 & 1) != 0)
      v32 = 0x7FFFFFFFLL;
    else
      v32 = *(_QWORD *)&v61;
    if (v32 < (uint64_t)0xFFFFFFFF80000000)
    {
      __break(1u);
    }
    else if (v32 <= 0x7FFFFFFF)
    {
      type metadata accessor for OS_dispatch_queue();
      static DispatchQoS.unspecified.getter();
      v63 = MEMORY[0x24BEE4AF8];
      lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
      lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]();
      dispatch thunk of SetAlgebra.init<A>(_:)();
      (*(void (**)(char *, _QWORD, uint64_t))(v57 + 104))(v15, *MEMORY[0x24BEE5750], v58);
      v33 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
      v34 = objc_msgSend(v30, sel_historicalUpdaterWithDateInterval_sampleCount_queue_handler_, isa, v32, v33, 0);

      a2 = v60;
      goto LABEL_18;
    }
    __break(1u);
    goto LABEL_27;
  }
  outlined init with copy of DateInterval?(a2, (uint64_t)v24);
  v35 = type metadata accessor for DateInterval();
  v36 = *(_QWORD *)(v35 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v24, 1, v35) != 1)
  {
    isa = DateInterval._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v36 + 8))(v24, v35);
  }
  if ((v62 & 1) != 0)
    v37 = 0x7FFFFFFFLL;
  else
    v37 = *(_QWORD *)&v61;
  v38 = (void *)objc_opt_self();
  if (v37 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (v37 > 0x7FFFFFFF)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v52 = v38;
  type metadata accessor for OS_dispatch_queue();
  static DispatchQoS.unspecified.getter();
  v63 = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, _QWORD, uint64_t))(v57 + 104))(v15, *MEMORY[0x24BEE5750], v58);
  v30 = (id)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  v34 = objc_msgSend(v52, sel__historicalUpdaterWithCenter_radius_dateInterval_sampleCount_queue_handler_, isa, v37, v30, 0, a6, a7, a8);
LABEL_18:

  if (one-time initialization token for logger != -1)
    swift_once();
  v39 = type metadata accessor for Logger();
  __swift_project_value_buffer(v39, (uint64_t)logger);
  v40 = v59;
  outlined init with copy of DateInterval?(a2, v59);
  v41 = Logger.logObject.getter();
  v42 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v41, v42))
  {
    v43 = swift_slowAlloc();
    v44 = swift_slowAlloc();
    v65 = v44;
    *(_DWORD *)v43 = 136315906;
    v63 = a6;
    v64 = a7;
    type metadata accessor for CLLocationCoordinate2D(0);
    v45 = String.init<A>(describing:)();
    v63 = COERCE_DOUBLE(getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v45, v46, &v65));
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v43 + 12) = 2048;
    v63 = a8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v43 + 22) = 2080;
    outlined init with copy of DateInterval?(v40, v53);
    v47 = String.init<A>(describing:)();
    v63 = COERCE_DOUBLE(getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v47, v48, &v65));
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    outlined destroy of DateInterval?(v40);
    *(_WORD *)(v43 + 32) = 2080;
    v63 = v61;
    LOBYTE(v64) = v62 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Int?);
    v49 = String.init<A>(describing:)();
    v63 = COERCE_DOUBLE(getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v49, v50, &v65));
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    a2 = v60;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2082EC000, v41, v42, "#LocationUpdates Creating historicalUpdates with center: %s,  with radius: %f, interestInterval: %s, sampleCount: %s", (uint8_t *)v43, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x20BD03A90](v44, -1, -1);
    MEMORY[0x20BD03A90](v43, -1, -1);
  }
  else
  {
    outlined destroy of DateInterval?(v40);
  }

  if (v34)
  {
    v51 = v34;
    CLLocationUpdate.Updates.init(updater:isHistorical:)(v51, 1, v55);

    outlined destroy of DateInterval?(a2);
    return;
  }
LABEL_29:
  __break(1u);
}

uint64_t CLLocationUpdate.Updates.Iterator.next()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = v1;
  return swift_task_switch();
}

uint64_t CLLocationUpdate.Updates.Iterator.next()()
{
  uint64_t v0;
  _QWORD *v1;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v0 + 48)+ *(int *)(type metadata accessor for CLLocationUpdate.Updates.Iterator(0) + 20))+ 16), sel_resume);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Iterator);
  *v1 = v0;
  v1[1] = CLLocationUpdate.Updates.Iterator.next();
  return AsyncStream.Iterator.next()();
}

{
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;

  v1 = *(void **)(v0 + 16);
  if (one-time initialization token for logger != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)logger);
  v3 = v1;
  v4 = Logger.logObject.getter();
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v12 = v7;
    *(_DWORD *)v6 = 136380675;
    *(_QWORD *)(v0 + 24) = v1;
    v8 = v3;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CLLocationUpdate?);
    v9 = String.init<A>(describing:)();
    *(_QWORD *)(v0 + 32) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2082EC000, v4, v5, "#LocationUpdates Iterator.next value: %{private}s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x20BD03A90](v7, -1, -1);
    MEMORY[0x20BD03A90](v6, -1, -1);
  }
  else
  {

  }
  **(_QWORD **)(v0 + 40) = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for CLLocationUpdate.Updates.Iterator(uint64_t a1)
{
  return type metadata accessor for CLMonitor.Events(a1, (uint64_t *)&type metadata singleton initialization cache for CLLocationUpdate.Updates.Iterator);
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance CLLocationUpdate.Updates.Iterator(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = protocol witness for AsyncIteratorProtocol.next() in conformance CLMonitor.Events.Iterator;
  v4[5] = a1;
  v4[6] = v1;
  return swift_task_switch();
}

uint64_t _s12CoreLocation16CLLocationUpdateV7UpdatesV8IteratorVScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTW(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v7;

  v5[4] = a3;
  v5[5] = a4;
  v5[3] = a2;
  v7 = (_QWORD *)swift_task_alloc();
  v5[6] = v7;
  *v7 = v5;
  v7[1] = _s12CoreLocation9CLMonitorC6EventsV8IteratorVScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_;
  v7[5] = a1;
  v7[6] = v4;
  return swift_task_switch();
}

id CLLocationUpdate.Updates.makeAsyncIterator()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  id v10;

  v2 = v1;
  if (one-time initialization token for logger != -1)
    swift_once();
  v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)logger);
  v5 = Logger.logObject.getter();
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2082EC000, v5, v6, "#LocationUpdates makeAsyncIterator", v7, 2u);
    MEMORY[0x20BD03A90](v7, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>);
  AsyncStream.makeAsyncIterator()();
  v10 = *(id *)(v2 + *(int *)(type metadata accessor for CLLocationUpdate.Updates(0) + 20));
  type metadata accessor for _CLUpdaterAdapter();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v10;
  *(_QWORD *)(a1 + *(int *)(type metadata accessor for CLLocationUpdate.Updates.Iterator(0) + 20)) = v8;
  return v10;
}

uint64_t CLLocationUpdate.Updates.init(updater:isHistorical:)@<X0>(void *a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
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
  uint64_t v18;
  void (*v19)(uint64_t, char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char *v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  char *v34;
  uint64_t v35;
  void *v36;
  int v37;
  uint64_t v38;
  char *v39;
  _QWORD aBlock[6];

  v37 = a2;
  v35 = a3;
  v36 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Continuation.BufferingPolicy);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Continuation);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v34 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v34 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BEE6A10], v3);
  static AsyncStream.makeStream(of:bufferingPolicy:)();
  v17 = v3;
  v18 = v7;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v17);
  v19 = *(void (**)(uint64_t, char *, uint64_t))(v14 + 16);
  v20 = v35;
  v38 = v13;
  v39 = v16;
  v19(v35, v16, v13);
  v21 = type metadata accessor for CLLocationUpdate.Updates(0);
  v22 = v36;
  *(_QWORD *)(v20 + *(int *)(v21 + 20)) = v36;
  v23 = v34;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v34, v12, v18);
  v24 = (*(unsigned __int8 *)(v8 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v25 = swift_allocObject();
  *(_BYTE *)(v25 + 16) = v37;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v25 + v24, v23, v18);
  aBlock[4] = partial apply for closure #1 in CLLocationUpdate.Updates.init(updater:isHistorical:);
  aBlock[5] = v25;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed CLUpdate?) -> ();
  aBlock[3] = &block_descriptor_1;
  v26 = _Block_copy(aBlock);
  v27 = v22;
  swift_retain();
  swift_release();
  objc_msgSend(v27, sel_setHandler_, v26);
  _Block_release(v26);
  swift_release();
  *(_QWORD *)(swift_allocObject() + 16) = v27;
  v28 = v27;
  AsyncStream.Continuation.onTermination.setter();
  if (one-time initialization token for logger != -1)
    swift_once();
  v29 = type metadata accessor for Logger();
  __swift_project_value_buffer(v29, (uint64_t)logger);
  v30 = Logger.logObject.getter();
  v31 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v32 = 0;
    _os_log_impl(&dword_2082EC000, v30, v31, "#LocationUpdates successfully created", v32, 2u);
    MEMORY[0x20BD03A90](v32, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v39, v38);
}

void closure #1 in CLLocationUpdate.Updates.init(updater:isHistorical:)(void *a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  uint64_t v23;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Continuation.YieldResult);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    if (!a1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Continuation);
      AsyncStream.Continuation.finish()();
      if (one-time initialization token for logger != -1)
        swift_once();
      v8 = type metadata accessor for Logger();
      __swift_project_value_buffer(v8, (uint64_t)logger);
      v21 = Logger.logObject.getter();
      v9 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v21, v9))
      {
        v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_2082EC000, v21, v9, "#LocationUpdates Historical updates has finished iterating. Ending iteration.", v10, 2u);
        MEMORY[0x20BD03A90](v10, -1, -1);
      }

      return;
    }
  }
  else if (!a1)
  {
    __break(1u);
    return;
  }
  v23 = (uint64_t)a1;
  v11 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Continuation);
  AsyncStream.Continuation.yield(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (one-time initialization token for logger != -1)
    swift_once();
  v12 = type metadata accessor for Logger();
  __swift_project_value_buffer(v12, (uint64_t)logger);
  v13 = v11;
  v14 = Logger.logObject.getter();
  v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v23 = v17;
    *(_DWORD *)v16 = 136380675;
    v22 = objc_msgSend(v13, sel_location);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CLLocation?);
    v18 = String.init<A>(describing:)();
    v22 = (id)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v18, v19, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2082EC000, v14, v15, "#LocationUpdates yielding an Update: %{private}s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x20BD03A90](v17, -1, -1);
    MEMORY[0x20BD03A90](v16, -1, -1);

  }
  else
  {

  }
}

id closure #2 in CLLocationUpdate.Updates.init(updater:isHistorical:)(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  if (one-time initialization token for logger != -1)
    swift_once();
  v3 = type metadata accessor for Logger();
  __swift_project_value_buffer(v3, (uint64_t)logger);
  v4 = Logger.logObject.getter();
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2082EC000, v4, v5, "#LocationUpdates terminating", v6, 2u);
    MEMORY[0x20BD03A90](v6, -1, -1);
  }

  return objc_msgSend(a2, sel_pause);
}

uint64_t protocol witness for AsyncSequence.makeAsyncIterator() in conformance CLLocationUpdate.Updates@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  CLLocationUpdate.Updates.makeAsyncIterator()(a1);
  return outlined destroy of CLLocationUpdate.Updates(v1);
}

void CLLocationManager.liveUpdates(_:)(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  void *v2;
  id v4;
  unsigned __int8 v5;

  v5 = *a1;
  v4 = v2;
  CLLocationUpdate.Updates.init(_:configuration:)(v2, &v5, a2);
}

void CLLocationManager.historicalUpdates(interestInterval:maxSampleCount:)(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  void *v4;
  int v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  v8 = a3 & 1;
  v9 = type metadata accessor for DateInterval();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v12 + 16))(v11, a1);
  v13 = v4;
  CLLocationUpdate.Updates.init(_:interestInterval:maxSampleCount:)(v4, v11, a2, v8, a4);
}

void CLLocationManager.historicalUpdates(center:radius:interestInterval:maxSampleCount:)(uint64_t a1@<X0>, double a2@<X1>, char a3@<W2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>)
{
  void *v7;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  uint64_t v19;

  v14 = a3 & 1;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of DateInterval?(a1, (uint64_t)v17);
  v18 = v7;
  CLLocationUpdate.Updates.init(_:center:radius:interestInterval:maxSampleCount:)(v7, (uint64_t)v17, a2, v14, a4, a5, a6, a7);
}

uint64_t closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
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
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
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

uint64_t type metadata accessor for CLLocationUpdate.Updates(uint64_t a1)
{
  return type metadata accessor for CLMonitor.Events(a1, (uint64_t *)&type metadata singleton initialization cache for CLLocationUpdate.Updates);
}

uint64_t type metadata accessor for _CLUpdaterAdapter()
{
  return objc_opt_self();
}

unint64_t lazy protocol witness table accessor for type CLLocationUpdate.LiveConfiguration and conformance CLLocationUpdate.LiveConfiguration()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CLLocationUpdate.LiveConfiguration and conformance CLLocationUpdate.LiveConfiguration;
  if (!lazy protocol witness table cache variable for type CLLocationUpdate.LiveConfiguration and conformance CLLocationUpdate.LiveConfiguration)
  {
    result = MEMORY[0x20BD03A18](&protocol conformance descriptor for CLLocationUpdate.LiveConfiguration, &type metadata for CLLocationUpdate.LiveConfiguration);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CLLocationUpdate.LiveConfiguration and conformance CLLocationUpdate.LiveConfiguration);
  }
  return result;
}

uint64_t associated type witness table accessor for AsyncSequence.AsyncIterator : AsyncIteratorProtocol in CLLocationUpdate.Updates()
{
  return lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type CLLocationUpdate.Updates.Iterator and conformance CLLocationUpdate.Updates.Iterator, type metadata accessor for CLLocationUpdate.Updates.Iterator, (uint64_t)&protocol conformance descriptor for CLLocationUpdate.Updates.Iterator);
}

ValueMetadata *type metadata accessor for CLLocationUpdate()
{
  return &type metadata for CLLocationUpdate;
}

uint64_t getEnumTagSinglePayload for CLLocationUpdate.LiveConfiguration(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CLLocationUpdate.LiveConfiguration(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2082FA35C + 4 * byte_2082FD675[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2082FA390 + 4 * byte_2082FD670[v4]))();
}

uint64_t sub_2082FA390(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2082FA398(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2082FA3A0);
  return result;
}

uint64_t sub_2082FA3AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2082FA3B4);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2082FA3B8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2082FA3C0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CLLocationUpdate.LiveConfiguration()
{
  return &type metadata for CLLocationUpdate.LiveConfiguration;
}

uint64_t *initializeBufferWithCopyOfBuffer for CLLocationUpdate.Updates(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    v10 = v9;
  }
  return a1;
}

void destroy for CLLocationUpdate.Updates(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);

}

uint64_t initializeWithCopy for CLLocationUpdate.Updates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  v9 = v8;
  return a1;
}

uint64_t assignWithCopy for CLLocationUpdate.Updates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)(a2 + v7);
  v9 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  v10 = v8;

  return a1;
}

uint64_t initializeWithTake for CLLocationUpdate.Updates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return initializeWithTake for CLLocationUpdate.Updates(a1, a2, a3, &demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>);
}

uint64_t assignWithTake for CLLocationUpdate.Updates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);

  return a1;
}

uint64_t getEnumTagSinglePayload for CLLocationUpdate.Updates()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2082FA604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, &demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>);
}

uint64_t storeEnumTagSinglePayload for CLLocationUpdate.Updates()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2082FA61C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, &demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>);
}

void type metadata completion function for CLLocationUpdate.Updates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata completion function for CLLocationUpdate.Updates(a1, a2, a3, &lazy cache variable for type metadata for AsyncStream<CLLocationUpdate>, MEMORY[0x24BEE6A98]);
}

uint64_t *initializeBufferWithCopyOfBuffer for CLLocationUpdate.Updates.Iterator(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Iterator);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t destroy for CLLocationUpdate.Updates.Iterator(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Iterator);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t initializeWithCopy for CLLocationUpdate.Updates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CLLocationUpdate.Updates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for CLLocationUpdate.Updates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return initializeWithTake for CLLocationUpdate.Updates(a1, a2, a3, &demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Iterator);
}

uint64_t initializeWithTake for CLLocationUpdate.Updates(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;

  v7 = __swift_instantiateConcreteTypeFromMangledName(a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for CLLocationUpdate.Updates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CLLocationUpdate.Updates.Iterator()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2082FA8CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, &demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Iterator);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v10;

  v7 = __swift_instantiateConcreteTypeFromMangledName(a4);
  v8 = *(_QWORD *)(v7 - 8);
  if (*(_DWORD *)(v8 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(a1, a2, v7);
  v10 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v10 >= 0xFFFFFFFF)
    LODWORD(v10) = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for CLLocationUpdate.Updates.Iterator()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2082FA960(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, &demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Iterator);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t *a5)
{
  uint64_t result;
  uint64_t v10;

  result = __swift_instantiateConcreteTypeFromMangledName(a5);
  v10 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v10 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

void type metadata completion function for CLLocationUpdate.Updates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata completion function for CLLocationUpdate.Updates(a1, a2, a3, &lazy cache variable for type metadata for AsyncStream<CLLocationUpdate>.Iterator, MEMORY[0x24BEE6A78]);
}

void type metadata completion function for CLLocationUpdate.Updates(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t (*a5)(_QWORD, ValueMetadata *))
{
  unint64_t v5;

  type metadata accessor for AsyncStream<CLLocationUpdate>(319, a4, a5);
  if (v5 <= 0x3F)
    swift_initStructMetadata();
}

void type metadata accessor for AsyncStream<CLLocationUpdate>(uint64_t a1, unint64_t *a2, uint64_t (*a3)(_QWORD, ValueMetadata *))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    v4 = a3(0, &type metadata for CLLocationUpdate);
    if (!v5)
      atomic_store(v4, a2);
  }
}

ValueMetadata *type metadata accessor for CLLocationUpdate._LocationUpdater()
{
  return &type metadata for CLLocationUpdate._LocationUpdater;
}

uint64_t outlined destroy of CLLocationUpdate.Updates(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CLLocationUpdate.Updates(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined destroy of DateInterval?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2082FAB50()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Continuation);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

void partial apply for closure #1 in CLLocationUpdate.Updates.init(updater:isHistorical:)(void *a1)
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLLocationUpdate>.Continuation);
  closure #1 in CLLocationUpdate.Updates.init(updater:isHistorical:)(a1, *(_BYTE *)(v1 + 16));
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

uint64_t sub_2082FAC10()
{
  uint64_t v0;

  return swift_deallocObject();
}

id partial apply for closure #2 in CLLocationUpdate.Updates.init(updater:isHistorical:)(uint64_t a1)
{
  uint64_t v1;

  return closure #2 in CLLocationUpdate.Updates.init(updater:isHistorical:)(a1, *(void **)(v1 + 16));
}

uint64_t CLBackgroundActivitySession.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 24) = 0;
  *(_QWORD *)(v0 + 16) = objc_msgSend((id)objc_opt_self(), sel_backgroundActivitySession);
  return v0;
}

uint64_t CLBackgroundActivitySession.init()()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = 0;
  *(_QWORD *)(v0 + 16) = objc_msgSend((id)objc_opt_self(), sel_backgroundActivitySession);
  return v0;
}

Swift::Void __swiftcall CLBackgroundActivitySession.invalidate()()
{
  uint64_t v0;

  objc_msgSend(*(id *)(v0 + 16), sel_invalidate);
}

uint64_t CLBackgroundActivitySession.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t CLBackgroundActivitySession.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();
  return swift_deallocClassInstance();
}

uint64_t CLLocationManager.backgroundActivitySession()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[2];

  v1 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for OS_dispatch_queue.Attributes();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v5);
  v7 = type metadata accessor for DispatchQoS();
  MEMORY[0x24BDAC7A8](v7);
  type metadata accessor for OS_dispatch_queue();
  v8 = v0;
  static DispatchQoS.unspecified.getter();
  v13[1] = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, v6, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE5750], v1);
  v9 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  type metadata accessor for CLBackgroundActivitySession();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 24) = 0;
  v11 = objc_msgSend((id)objc_opt_self(), sel_sessionWithLocationManager_queue_handler_, v8, v9, 0);

  *(_QWORD *)(v10 + 16) = v11;
  return v10;
}

uint64_t type metadata accessor for CLBackgroundActivitySession()
{
  return objc_opt_self();
}

id CLBackgroundActivitySession.Diagnostic.authorizationDenied.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_authorizationDenied);
}

id CLBackgroundActivitySession.Diagnostic.authorizationDeniedGlobally.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_authorizationDeniedGlobally);
}

id CLBackgroundActivitySession.Diagnostic.authorizationRestricted.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_authorizationRestricted);
}

id CLBackgroundActivitySession.Diagnostic.insufficientlyInUse.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_insufficientlyInUse);
}

id CLBackgroundActivitySession.Diagnostic.serviceSessionRequired.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_serviceSessionRequired);
}

id CLBackgroundActivitySession.Diagnostic.authorizationRequestInProgress.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_authorizationRequestInProgress);
}

uint64_t CLBackgroundActivitySession.Diagnostics.Iterator.next()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Iterator);
  *v1 = v0;
  v1[1] = CLServiceSession.Diagnostics.Iterator.next();
  return AsyncStream.Iterator.next()();
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance CLBackgroundActivitySession.Diagnostics.Iterator()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Iterator);
  *v1 = v0;
  v1[1] = protocol witness for AsyncIteratorProtocol.next() in conformance CLServiceSession.Diagnostics.Iterator;
  return AsyncStream.Iterator.next()();
}

uint64_t CLBackgroundActivitySession.Diagnostics.makeAsyncIterator()()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  if (one-time initialization token for logger != -1)
    swift_once();
  v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)logger);
  v1 = Logger.logObject.getter();
  v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2082EC000, v1, v2, "#backgroundActivitySession makeAsyncIterator", v3, 2u);
    MEMORY[0x20BD03A90](v3, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>);
  return AsyncStream.makeAsyncIterator()();
}

void closure #1 in CLBackgroundActivitySession.Diagnostics.init(_:)(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD v11[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Continuation.YieldResult);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[1] = a1;
  v6 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Continuation);
  AsyncStream.Continuation.yield(_:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (one-time initialization token for logger != -1)
    swift_once();
  v7 = type metadata accessor for Logger();
  __swift_project_value_buffer(v7, (uint64_t)logger);
  v8 = Logger.logObject.getter();
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2082EC000, v8, v9, "#backgroundActivitySession yielding a Diagnostic", v10, 2u);
    MEMORY[0x20BD03A90](v10, -1, -1);
  }

}

id closure #2 in CLBackgroundActivitySession.Diagnostics.init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  if (one-time initialization token for logger != -1)
    swift_once();
  v3 = type metadata accessor for Logger();
  __swift_project_value_buffer(v3, (uint64_t)logger);
  v4 = Logger.logObject.getter();
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2082EC000, v4, v5, "#backgroundActivitySession terminating", v6, 2u);
    MEMORY[0x20BD03A90](v6, -1, -1);
  }

  return objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtCC12CoreLocation27CLBackgroundActivitySession11Diagnostics_bas), sel_invalidate);
}

uint64_t CLBackgroundActivitySession.Diagnostics.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtCC12CoreLocation27CLBackgroundActivitySession11Diagnostics_stream;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  return v0;
}

uint64_t CLBackgroundActivitySession.Diagnostics.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtCC12CoreLocation27CLBackgroundActivitySession11Diagnostics_stream;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t protocol witness for AsyncSequence.makeAsyncIterator() in conformance CLBackgroundActivitySession.Diagnostics()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  if (one-time initialization token for logger != -1)
    swift_once();
  v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)logger);
  v1 = Logger.logObject.getter();
  v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2082EC000, v1, v2, "#backgroundActivitySession makeAsyncIterator", v3, 2u);
    MEMORY[0x20BD03A90](v3, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>);
  AsyncStream.makeAsyncIterator()();
  return swift_release();
}

uint64_t CLBackgroundActivitySession.diagnostics.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t result;

  v1 = v0;
  if (one-time initialization token for logger != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)logger);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2082EC000, v3, v4, "#backgroundActivitySession creating a Diagnostics AsyncSequence", v5, 2u);
    MEMORY[0x20BD03A90](v5, -1, -1);
  }

  if (*(_QWORD *)(v1 + 24))
  {
    v6 = *(_QWORD *)(v1 + 24);
LABEL_9:
    swift_retain();
    return v6;
  }
  v7 = *(void **)(v1 + 16);
  type metadata accessor for CLBackgroundActivitySession.Diagnostics(0);
  swift_allocObject();
  v8 = v7;
  v9 = specialized CLBackgroundActivitySession.Diagnostics.init(_:)(v8);

  *(_QWORD *)(v1 + 24) = v9;
  result = swift_release();
  v6 = *(_QWORD *)(v1 + 24);
  if (v6)
  {
    swift_retain();
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for CLBackgroundActivitySession.Diagnostics(uint64_t a1)
{
  return type metadata accessor for CLMonitor.Events(a1, (uint64_t *)&type metadata singleton initialization cache for CLBackgroundActivitySession.Diagnostics);
}

uint64_t specialized CLBackgroundActivitySession.Diagnostics.init(_:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, char *, uint64_t);
  void *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  _QWORD v32[2];
  void *v33;
  uint64_t v34;
  _QWORD aBlock[6];

  v33 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Continuation.BufferingPolicy);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Continuation);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v32[0] = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v32 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE6A10], v1);
  static AsyncStream.makeStream(of:bufferingPolicy:)();
  v15 = v4;
  v16 = v12;
  v17 = v5;
  v18 = v1;
  v19 = v32[1];
  (*(void (**)(char *, uint64_t))(v2 + 8))(v15, v18);
  v20 = *(void (**)(uint64_t, char *, uint64_t))(v16 + 16);
  v34 = v11;
  v20(v19 + OBJC_IVAR____TtCC12CoreLocation27CLBackgroundActivitySession11Diagnostics_stream, v14, v11);
  v21 = v33;
  *(_QWORD *)(v19 + OBJC_IVAR____TtCC12CoreLocation27CLBackgroundActivitySession11Diagnostics_bas) = v33;
  v22 = v32[0];
  (*(void (**)(_QWORD, char *, uint64_t))(v6 + 16))(v32[0], v10, v17);
  v23 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v24 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v6 + 32))(v24 + v23, v22, v17);
  aBlock[4] = partial apply for closure #1 in CLBackgroundActivitySession.Diagnostics.init(_:);
  aBlock[5] = v24;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed CLServiceSessionDiagnostic) -> ();
  aBlock[3] = &block_descriptor_2;
  v25 = _Block_copy(aBlock);
  v26 = v21;
  swift_release();
  objc_msgSend(v26, sel_setHandler_, v25);
  _Block_release(v25);

  if (one-time initialization token for logger != -1)
    swift_once();
  v27 = type metadata accessor for Logger();
  __swift_project_value_buffer(v27, (uint64_t)logger);
  v28 = Logger.logObject.getter();
  v29 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v30 = 0;
    _os_log_impl(&dword_2082EC000, v28, v29, "#backgroundActivitySession successfully created", v30, 2u);
    MEMORY[0x20BD03A90](v30, -1, -1);
  }

  swift_retain();
  AsyncStream.Continuation.onTermination.setter();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v17);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v14, v34);
  return v19;
}

uint64_t associated type witness table accessor for AsyncSequence.AsyncIterator : AsyncIteratorProtocol in CLBackgroundActivitySession.Diagnostics()
{
  return lazy protocol witness table accessor for type related decl 'e' for CLError and conformance related decl 'e' for CLError(&lazy protocol witness table cache variable for type CLBackgroundActivitySession.Diagnostics.Iterator and conformance CLBackgroundActivitySession.Diagnostics.Iterator, type metadata accessor for CLBackgroundActivitySession.Diagnostics.Iterator, (uint64_t)&protocol conformance descriptor for CLBackgroundActivitySession.Diagnostics.Iterator);
}

uint64_t type metadata accessor for CLBackgroundActivitySession.Diagnostics.Iterator(uint64_t a1)
{
  return type metadata accessor for CLMonitor.Events(a1, (uint64_t *)&type metadata singleton initialization cache for CLBackgroundActivitySession.Diagnostics.Iterator);
}

uint64_t method lookup function for CLBackgroundActivitySession()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CLBackgroundActivitySession.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

ValueMetadata *type metadata accessor for CLBackgroundActivitySession.Diagnostic()
{
  return &type metadata for CLBackgroundActivitySession.Diagnostic;
}

uint64_t ObjC metadata update function for CLBackgroundActivitySession.Diagnostics()
{
  return type metadata accessor for CLBackgroundActivitySession.Diagnostics(0);
}

void type metadata completion function for CLBackgroundActivitySession.Diagnostics()
{
  unint64_t v0;

  type metadata accessor for AsyncStream<CLBackgroundActivitySession.Diagnostic>(319, &lazy cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>, MEMORY[0x24BEE6A98]);
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for CLBackgroundActivitySession.Diagnostics()
{
  return swift_lookUpClassMethod();
}

uint64_t initializeBufferWithCopyOfBuffer for CLBackgroundActivitySession.Diagnostics.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Iterator);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for CLBackgroundActivitySession.Diagnostics.Iterator(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Iterator);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for CLBackgroundActivitySession.Diagnostics.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for CLBackgroundActivitySession.Diagnostics.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for CLBackgroundActivitySession.Diagnostics.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for CLBackgroundActivitySession.Diagnostics.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Iterator);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for CLBackgroundActivitySession.Diagnostics.Iterator()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2082FBD9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Iterator);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for CLBackgroundActivitySession.Diagnostics.Iterator()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2082FBDE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Iterator);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

void type metadata completion function for CLBackgroundActivitySession.Diagnostics.Iterator()
{
  unint64_t v0;

  type metadata accessor for AsyncStream<CLBackgroundActivitySession.Diagnostic>(319, &lazy cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Iterator, MEMORY[0x24BEE6A78]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void type metadata accessor for AsyncStream<CLBackgroundActivitySession.Diagnostic>(uint64_t a1, unint64_t *a2, uint64_t (*a3)(_QWORD, ValueMetadata *))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    v4 = a3(0, &type metadata for CLBackgroundActivitySession.Diagnostic);
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_2082FBEEC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Continuation);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

void partial apply for closure #1 in CLBackgroundActivitySession.Diagnostics.init(_:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<CLBackgroundActivitySession.Diagnostic>.Continuation);
  closure #1 in CLBackgroundActivitySession.Diagnostics.init(_:)(a1);
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

id partial apply for closure #2 in CLBackgroundActivitySession.Diagnostics.init(_:)(uint64_t a1)
{
  uint64_t v1;

  return closure #2 in CLBackgroundActivitySession.Diagnostics.init(_:)(a1, v1);
}

NSDateInterval __swiftcall DateInterval._bridgeToObjectiveC()()
{
  return (NSDateInterval)MEMORY[0x24BDCB810]();
}

uint64_t type metadata accessor for DateInterval()
{
  return MEMORY[0x24BDCB878]();
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

uint64_t _BridgedStoredNSError.userInfo.getter()
{
  return MEMORY[0x24BDCD2B0]();
}

uint64_t _BridgedStoredNSError.errorCode.getter()
{
  return MEMORY[0x24BDCD2B8]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x24BDCE5D8]();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t Date.init()()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x24BDCE900]();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)MEMORY[0x24BDCE9D0]();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t Selector.init(_:)()
{
  return MEMORY[0x24BEE5BB0]();
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

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x24BEE0618]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
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

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t static AsyncStream.makeStream(of:bufferingPolicy:)()
{
  return MEMORY[0x24BEE69A8]();
}

uint64_t AsyncStream.Continuation.onTermination.setter()
{
  return MEMORY[0x24BEE69F8]();
}

uint64_t AsyncStream.Continuation.yield(_:)()
{
  return MEMORY[0x24BEE6A30]();
}

Swift::Void __swiftcall AsyncStream.Continuation.finish()()
{
  MEMORY[0x24BEE6A38]();
}

uint64_t AsyncStream.makeAsyncIterator()()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t AsyncStream.Iterator.next()()
{
  return MEMORY[0x24BEE6A68]();
}

uint64_t AsyncStream.init(_:bufferingPolicy:_:)()
{
  return MEMORY[0x24BEE6AA0]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t NSObject.hashValue.getter()
{
  return MEMORY[0x24BEE5BD0]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x24BEE1F48]();
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

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
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

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x24BEE3290](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x24BEE3360]();
}

{
  return MEMORY[0x24BEE33B0]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t Error<>._code.getter()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t Error<>._domain.getter()
{
  return MEMORY[0x24BDD06F0]();
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

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x24BEE4A10]();
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  MEMORY[0x24BDBFA10](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
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

