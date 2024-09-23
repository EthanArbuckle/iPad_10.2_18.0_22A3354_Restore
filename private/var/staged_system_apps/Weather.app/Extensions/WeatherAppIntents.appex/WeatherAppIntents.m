uint64_t sub_100005250()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v0 = sub_1000052BC(&qword_10000C168);
  v1 = swift_allocObject(v0, 48, 7);
  *(_OWORD *)(v1 + 16) = xmmword_100007880;
  v2 = type metadata accessor for WeatherCoreAppIntentsPackage(0);
  v3 = sub_1000052FC();
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v3;
  return v1;
}

ValueMetadata *type metadata accessor for WeatherAppIntentsPackage()
{
  return &type metadata for WeatherAppIntentsPackage;
}

uint64_t sub_1000052BC(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000052FC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C170;
  if (!qword_10000C170)
  {
    v1 = type metadata accessor for WeatherCoreAppIntentsPackage(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for WeatherCoreAppIntentsPackage, v1);
    atomic_store(result, (unint64_t *)&qword_10000C170);
  }
  return result;
}

uint64_t AppIntentsAssembly.load(in:)()
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  type metadata accessor for Scope(0);
  __chkstk_darwin();
  sub_100006404();
  v0 = sub_1000052BC(&qword_10000C178);
  sub_1000063E8(v0, v1, v2, (uint64_t)sub_100005580);
  sub_1000063FC();
  sub_10000640C();
  v3 = sub_100006428();
  swift_release(v3);
  sub_100006434();
  sub_10000641C();
  sub_100006404();
  v4 = sub_1000052BC(&qword_10000C180);
  sub_1000063E8(v4, v5, v6, (uint64_t)sub_1000056AC);
  sub_1000063FC();
  v7 = type metadata accessor for GeocodeService(0);
  v8 = Definition.thenConfigure<A>(as:configuration:)(v7, sub_1000057E0, 0, v7);
  swift_release(v8);
  sub_100006434();
  sub_100006404();
  v9 = sub_1000052BC(&qword_10000C188);
  sub_1000063E8(v9, v10, v11, (uint64_t)sub_100005860);
  sub_1000063FC();
  sub_10000640C();
  v12 = sub_100006428();
  swift_release(v12);
  sub_100006434();
  sub_10000641C();
  sub_100006404();
  v13 = sub_1000052BC(&qword_10000C190);
  v16 = sub_1000063E8(v13, v14, v15, (uint64_t)sub_1000058B4);
  swift_release(v16);
  sub_1000063FC();
  sub_100006404();
  v17 = sub_1000052BC(&qword_10000C198);
  v20 = sub_1000063E8(v17, v18, v19, (uint64_t)sub_1000058D8);
  swift_release(v20);
  sub_1000063FC();
  sub_100006404();
  v21 = sub_1000052BC(&qword_10000C1A0);
  v24 = sub_1000063E8(v21, v22, v23, (uint64_t)sub_100005AE8);
  swift_release(v24);
  sub_1000063FC();
  sub_100006404();
  v25 = type metadata accessor for WDSEndpoint(0);
  sub_1000063E8(v25, v26, v27, (uint64_t)sub_100005BA4);
  sub_1000063FC();
  sub_10000640C();
  v28 = sub_100006428();
  swift_release(v28);
  sub_100006434();
  sub_10000641C();
  sub_100006404();
  v29 = sub_1000052BC(&qword_10000C1A8);
  v32 = sub_1000063E8(v29, v30, v31, (uint64_t)sub_100005D88);
  swift_release(v32);
  v33 = sub_1000063FC();
  ProxyContainer.private.getter(v33);
  RegistrationContainer.lazy(block:)(sub_100006064, 0);
  return sub_1000063FC();
}

_QWORD *sub_100005580@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD v17[5];

  v4 = a1[3];
  v5 = a1[4];
  sub_100006304(a1, v4);
  v6 = sub_1000052BC(&qword_10000C290);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v17, v6, v6, v4, v5);
  if (!v17[3])
  {
    __break(1u);
    goto LABEL_6;
  }
  v8 = a1[3];
  v9 = a1[4];
  sub_100006304(a1, v8);
  v10 = sub_1000052BC(&qword_10000C298);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v16, v10, v10, v8, v9);
  if (!v16[3])
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v11 = a1[3];
  v12 = a1[4];
  sub_100006304(a1, v11);
  v13 = sub_1000063AC();
  result = (_QWORD *)dispatch thunk of ResolverType.resolve<A>(_:)(v13, v13, v11, v12);
  if (result)
  {
    v14 = result;
    v15 = type metadata accessor for LocationEntityManager(0);
    swift_allocObject(v15, *(unsigned int *)(v15 + 48), *(unsigned __int16 *)(v15 + 52));
    result = (_QWORD *)LocationEntityManager.init(savedLocationsReader:savedLocationsManager:defaultCityManager:)(v17, v16, v14);
    a2[3] = v15;
    a2[4] = &protocol witness table for LocationEntityManager;
    *a2 = result;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

_QWORD *sub_1000056AC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  _BYTE v17[40];
  _QWORD v18[5];
  _QWORD v19[5];

  v4 = a1[3];
  v5 = a1[4];
  sub_100006304(a1, v4);
  v6 = sub_1000052BC(&qword_10000C278);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v19, v6, v6, v4, v5);
  if (!v19[3])
  {
    __break(1u);
    goto LABEL_6;
  }
  v8 = a1[3];
  v9 = a1[4];
  sub_100006304(a1, v8);
  v10 = sub_1000052BC(&qword_10000C258);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v18, v10, v10, v8, v9);
  if (!v18[3])
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v11 = a1[3];
  v12 = a1[4];
  sub_100006304(a1, v11);
  v13 = sub_1000052BC(&qword_10000C288);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(&v15, v13, v13, v11, v12);
  if (v16)
  {
    sub_100006334(&v15, (uint64_t)v17);
    v14 = type metadata accessor for GeocodeService(0);
    swift_allocObject(v14, *(unsigned int *)(v14 + 48), *(unsigned __int16 *)(v14 + 52));
    result = (_QWORD *)GeocodeService.init(appConfigurationManager:privacySampler:locationMetadataUpdater:)(v19, v18, v17);
    *a2 = result;
    a2[1] = &protocol witness table for GeocodeService;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

_QWORD *sub_1000057E0(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *result;
  _QWORD v6[5];

  v2 = a2[3];
  v3 = a2[4];
  sub_100006304(a2, v2);
  v4 = sub_1000052BC(&qword_10000C248);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v6, v4, v4, v2, v3);
  if (v6[3])
  {
    GeocodeService.setupWeatherKitGeocoding(using:)(v6);
    return (_QWORD *)sub_10000634C(v6);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100005860@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = type metadata accessor for NetworkMonitor(0);
  swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
  result = NetworkMonitor.init()();
  a1[3] = v2;
  a1[4] = (uint64_t)&protocol witness table for NetworkMonitor;
  *a1 = result;
  return result;
}

_QWORD *sub_1000058B4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_100006204(a1, &qword_10000C1A0, (uint64_t (*)(_QWORD))&type metadata accessor for WDSAuthenticatorFactory, (uint64_t (*)(_QWORD *))&WDSAuthenticatorFactory.init(clientConfigurationProvider:), (uint64_t)&protocol witness table for WDSAuthenticatorFactory, a2);
}

_QWORD *sub_1000058D8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  _QWORD v25[3];
  uint64_t v26;
  uint64_t v27;

  v21 = a2;
  v22 = type metadata accessor for WDSVersion(0);
  v3 = *(_QWORD *)(v22 - 8);
  __chkstk_darwin();
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000052BC(&qword_10000C270);
  __chkstk_darwin();
  v7 = (uint64_t *)((char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = type metadata accessor for WDSEndpoint(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin();
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v13 = a1[4];
  sub_100006304(a1, v12);
  v14 = sub_1000052BC(&qword_10000C190);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(&v23, v14, v14, v12, v13);
  if (v24)
  {
    sub_100006334(&v23, (uint64_t)v25);
    v16 = a1[3];
    v17 = a1[4];
    sub_100006304(a1, v16);
    dispatch thunk of ResolverType.resolve<A>(_:)(v7, v8, v8, v16, v17);
    result = (_QWORD *)sub_100006328((uint64_t)v7, 1, v8);
    if ((_DWORD)result != 1)
    {
      (*(void (**)(char *, _QWORD *, uint64_t))(v9 + 32))(v11, v7, v8);
      v18 = v26;
      v19 = v27;
      sub_100006304(v25, v26);
      v20 = v22;
      (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for WDSVersion.tokenServiceVersion(_:), v22);
      dispatch thunk of WDSAuthenticatorFactoryType.makeAuthenticator(for:version:isJWTEnabled:)(v11, v5, 1, v18, v19);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v20);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      return (_QWORD *)sub_10000634C(v25);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

_QWORD *sub_100005AE8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];

  v3 = a1[3];
  v4 = a1[4];
  sub_100006304(a1, v3);
  v5 = sub_1000052BC(&qword_10000C278);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v9, v5, v5, v3, v4);
  if (v9[3])
  {
    v7 = type metadata accessor for AppConfigurationSettingsProvider(0);
    swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
    v8 = AppConfigurationSettingsProvider.init(appConfigurationManager:)(v9);
    a2[3] = v7;
    result = (_QWORD *)sub_10000636C(&qword_10000C280, (uint64_t (*)(uint64_t))&type metadata accessor for AppConfigurationSettingsProvider, (uint64_t)&protocol conformance descriptor for AppConfigurationSettingsProvider);
    a2[4] = (uint64_t)result;
    *a2 = v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

_QWORD *sub_100005BA4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  _QWORD v28[3];
  uint64_t v29;
  uint64_t v30;

  v25 = a2;
  type metadata accessor for URL(0);
  __chkstk_darwin();
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for EndpointConfiguration(0);
  v23 = *(_QWORD *)(v5 - 8);
  v24 = v5;
  __chkstk_darwin();
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for AppConfiguration(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin();
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SettingReader(0);
  v12 = static SettingReader.shared.getter();
  v13 = static Settings.WeatherEnvironment.contentEnvironment.getter();
  SettingReader.read<A>(_:)(v28);
  swift_release(v12);
  swift_release(v13);
  v14 = LOBYTE(v28[0]);
  v16 = a1[3];
  v15 = a1[4];
  sub_100006304(a1, v16);
  v17 = sub_1000052BC(&qword_10000C278);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(&v26, v17, v17, v16, v15);
  if (v27)
  {
    sub_100006334(&v26, (uint64_t)v28);
    v19 = v29;
    v20 = v30;
    sub_100006304(v28, v29);
    dispatch thunk of AppConfigurationManagerType.appConfiguration.getter(v19, v20);
    v21 = AppConfiguration.endpointConfig(for:)(v14);
    EndpointConfiguration.weatherDataURL.getter(v21);
    WDSEndpoint.init(url:)(v4);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v24);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return (_QWORD *)sub_10000634C(v28);
  }
  else
  {
    __break(1u);
  }
  return result;
}

_QWORD *sub_100005D88@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
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
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *result;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_class *v28;
  id v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[6];

  v31 = a2;
  v3 = type metadata accessor for WeatherStatisticsCaching(0);
  v34 = *(_QWORD *)(v3 - 8);
  v35 = v3;
  __chkstk_darwin();
  v36 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for WeatherAvailabilityCaching(0);
  v32 = *(_QWORD *)(v5 - 8);
  v33 = v5;
  __chkstk_darwin();
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for WeatherDataCaching(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin();
  v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000052BC(&qword_10000C270);
  __chkstk_darwin();
  v13 = (_QWORD **)((char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = a1[3];
  v15 = a1[4];
  sub_100006304(a1, v14);
  v16 = type metadata accessor for WDSEndpoint(0);
  dispatch thunk of ResolverType.resolve<A>(_:)(v13, v16, v16, v14, v15);
  result = (_QWORD *)sub_100006328((uint64_t)v13, 1, v16);
  if ((_DWORD)result == 1)
  {
    __break(1u);
    goto LABEL_7;
  }
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, enum case for WeatherDataCaching.disabled(_:), v8);
  (*(void (**)(char *, _QWORD, uint64_t))(v32 + 104))(v7, enum case for WeatherAvailabilityCaching.disabled(_:), v33);
  v18 = v36;
  (*(void (**)(char *, _QWORD, uint64_t))(v34 + 104))(v36, enum case for WeatherStatisticsCaching.disabled(_:), v35);
  v19 = a1[3];
  v20 = a1[4];
  sub_100006304(a1, v19);
  v21 = sub_1000052BC(&qword_10000C188);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v39, v21, v21, v19, v20);
  if (!v39[3])
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v22 = a1[3];
  v23 = a1[4];
  sub_100006304(a1, v22);
  v24 = sub_1000052BC(&qword_10000C198);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v38, v24, v24, v22, v23);
  if (!v38[3])
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v25 = a1[3];
  v26 = a1[4];
  sub_100006304(a1, v25);
  v27 = sub_1000052BC(&qword_10000C1A0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v37, v27, v27, v25, v26);
  if (v37[3])
  {
    v28 = (objc_class *)type metadata accessor for WeatherDataServiceProxy(0);
    v29 = objc_allocWithZone(v28);
    result = (_QWORD *)WeatherDataServiceProxy.init(endpoint:caching:availableDataSetCaching:statisticsCaching:networkMonitor:authenticator:appConfigurationSettingsProvider:)(v13, v11, v7, v18, v39, v38, v37);
    v30 = v31;
    v31[3] = v28;
    v30[4] = &protocol witness table for WeatherDataServiceProxy;
    *v30 = result;
    return result;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_100006064()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = sub_1000052BC(&qword_10000C248);
  v1 = RegistrationContainer.register<A>(_:name:factory:)(v0, 0, 0, sub_100006100, 0, v0);
  swift_release(v1);
  v2 = sub_1000052BC(&qword_10000C250);
  v3 = RegistrationContainer.register<A>(_:name:factory:)(v2, 0, 0, sub_1000061BC, 0, v2);
  swift_release(v3);
  v4 = sub_1000052BC(&qword_10000C258);
  v5 = RegistrationContainer.register<A>(_:name:factory:)(v4, 0, 0, sub_1000061E0, 0, v4);
  return swift_release(v5);
}

_QWORD *sub_100006100@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v3 = a1[3];
  v4 = a1[4];
  sub_100006304(a1, v3);
  v5 = sub_1000052BC(&qword_10000C1A8);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(&v9, v5, v5, v3, v4);
  if (v10)
  {
    v7 = type metadata accessor for GeocodeWeatherService();
    v8 = swift_allocObject(v7, 56, 7);
    sub_100006334(&v9, v8 + 16);
    a2[3] = v7;
    result = (_QWORD *)sub_10000636C(&qword_10000C268, (uint64_t (*)(uint64_t))type metadata accessor for GeocodeWeatherService, (uint64_t)&unk_100007A18);
    a2[4] = (uint64_t)result;
    *a2 = v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

_QWORD *sub_1000061BC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_100006204(a1, &qword_10000C260, (uint64_t (*)(_QWORD))&type metadata accessor for PrivacySaltProvider, (uint64_t (*)(_QWORD *))&PrivacySaltProvider.init(identityService:), (uint64_t)&protocol witness table for PrivacySaltProvider, a2);
}

_QWORD *sub_1000061E0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_100006204(a1, &qword_10000C250, (uint64_t (*)(_QWORD))&type metadata accessor for PrivacySampler, (uint64_t (*)(_QWORD *))&PrivacySampler.init(saltProvider:), (uint64_t)&protocol witness table for PrivacySampler, a2);
}

_QWORD *sub_100006204@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t (*a3)(_QWORD)@<X2>, uint64_t (*a4)(_QWORD *)@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *result;
  uint64_t v15;
  _QWORD v16[5];

  v11 = a1[3];
  v12 = a1[4];
  sub_100006304(a1, v11);
  v13 = sub_1000052BC(a2);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v16, v13, v13, v11, v12);
  if (v16[3])
  {
    v15 = a3(0);
    swift_allocObject(v15, *(unsigned int *)(v15 + 48), *(unsigned __int16 *)(v15 + 52));
    result = (_QWORD *)a4(v16);
    a6[3] = v15;
    a6[4] = a5;
    *a6 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t AppIntentsAssembly.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t AppIntentsAssembly.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_1000062D0()
{
  return AppIntentsAssembly.load(in:)();
}

uint64_t type metadata accessor for AppIntentsAssembly()
{
  return objc_opt_self(_TtC17WeatherAppIntents18AppIntentsAssembly);
}

_QWORD *sub_100006304(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100006328(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_100006334(__int128 *a1, uint64_t a2)
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

uint64_t sub_10000634C(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000636C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000063AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C2A0;
  if (!qword_10000C2A0)
  {
    v1 = objc_opt_self(WCDefaultCityManager);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10000C2A0);
  }
  return result;
}

uint64_t sub_1000063E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return RegistrationContainer.register<A>(_:name:factory:)(a1, 0, 0, a4, 0, a1);
}

uint64_t sub_1000063FC()
{
  uint64_t v0;

  return swift_release(v0);
}

uint64_t sub_100006404()
{
  return ProxyContainer.public.getter();
}

uint64_t sub_10000640C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v1, v2, v0);
}

uint64_t sub_10000641C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t sub_100006428()
{
  uint64_t v0;

  return Definition.inScope(_:)(v0);
}

uint64_t sub_100006434()
{
  uint64_t v0;

  return swift_release(v0);
}

id sub_10000643C()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)NSRecursiveLock), "init");
  qword_10000C2A8 = (uint64_t)result;
  return result;
}

uint64_t sub_10000646C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
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
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t result;
  __int128 v21;
  uint64_t v22;

  v22 = type metadata accessor for Container.Environment(0);
  v0 = *(_QWORD *)(v22 - 8);
  __chkstk_darwin();
  v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for ContainerLock(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = (_QWORD *)((char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = sub_1000052BC(&qword_10000C2C8);
  v8 = swift_allocObject(v7, 72, 7);
  v21 = xmmword_100007880;
  *(_OWORD *)(v8 + 16) = xmmword_100007880;
  v9 = type metadata accessor for Assembly(0);
  swift_allocObject(v9, *(unsigned int *)(v9 + 48), *(unsigned __int16 *)(v9 + 52));
  v10 = Assembly.init()();
  *(_QWORD *)(v8 + 56) = v9;
  *(_QWORD *)(v8 + 64) = sub_10000636C(&qword_10000C2D0, (uint64_t (*)(uint64_t))&type metadata accessor for Assembly, (uint64_t)&protocol conformance descriptor for Assembly);
  *(_QWORD *)(v8 + 32) = v10;
  v11 = sub_1000052BC(&qword_10000C2D8);
  v12 = swift_allocObject(v11, 72, 7);
  *(_OWORD *)(v12 + 16) = v21;
  v13 = type metadata accessor for AppIntentsAssembly();
  v14 = swift_allocObject(v13, 16, 7);
  *(_QWORD *)(v12 + 56) = v13;
  *(_QWORD *)(v12 + 64) = sub_10000636C(&qword_10000C2E0, (uint64_t (*)(uint64_t))type metadata accessor for AppIntentsAssembly, (uint64_t)&protocol conformance descriptor for AppIntentsAssembly);
  *(_QWORD *)(v12 + 32) = v14;
  v15 = type metadata accessor for SingletonPool(0);
  swift_allocObject(v15, *(unsigned int *)(v15 + 48), *(unsigned __int16 *)(v15 + 52));
  v16 = SingletonPool.init()();
  if (qword_10000C158 != -1)
    swift_once(&qword_10000C158, sub_10000643C);
  v17 = (void *)qword_10000C2A8;
  *v6 = qword_10000C2A8;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for ContainerLock.lock(_:), v3);
  (*(void (**)(char *, _QWORD, uint64_t))(v0 + 104))(v2, enum case for Container.Environment.normal(_:), v22);
  v18 = type metadata accessor for Container(0);
  swift_allocObject(v18, *(unsigned int *)(v18 + 48), *(unsigned __int16 *)(v18 + 52));
  v19 = v17;
  result = Container.init(bundleAssemblies:assemblies:singletonPool:environment:containerLock:)(v8, v12, v16, v2, v6);
  qword_10000C2B0 = result;
  return result;
}

uint64_t sub_1000066D0()
{
  uint64_t v0;
  _QWORD v2[5];

  type metadata accessor for AppDependencyManager(0);
  v0 = static AppDependencyManager.shared.getter();
  if (qword_10000C160 != -1)
    swift_once(&qword_10000C160, sub_10000646C);
  Container.resolver.getter(v2);
  AppDependencyManager.addWeatherDependencies(from:)(v2);
  swift_release(v0);
  return sub_10000634C(v2);
}

uint64_t sub_100006758(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000686C();
  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_1000067EC();
  static AppExtension.main()();
  return 0;
}

unint64_t sub_1000067EC()
{
  unint64_t result;

  result = qword_10000C2B8;
  if (!qword_10000C2B8)
  {
    result = swift_getWitnessTable(&unk_100007978, &type metadata for WeatherAppIntentsExtension);
    atomic_store(result, (unint64_t *)&qword_10000C2B8);
  }
  return result;
}

uint64_t sub_10000682C(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_10000686C();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of AppIntentsExtension.configuration>>, 1);
}

unint64_t sub_10000686C()
{
  unint64_t result;

  result = qword_10000C2C0;
  if (!qword_10000C2C0)
  {
    result = swift_getWitnessTable(&unk_100007950, &type metadata for WeatherAppIntentsExtension);
    atomic_store(result, (unint64_t *)&qword_10000C2C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for WeatherAppIntentsExtension()
{
  return &type metadata for WeatherAppIntentsExtension;
}

void sub_1000068B8()
{
  Hasher._combine(_:)(0);
}

Swift::Int sub_1000068DC()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t sub_10000691C()
{
  return 1;
}

Swift::Int sub_10000692C(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t sub_100006978()
{
  uint64_t v0;

  sub_10000634C((_QWORD *)(v0 + 16));
  return swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for GeocodeWeatherService()
{
  return objc_opt_self(_TtC17WeatherAppIntents21GeocodeWeatherService);
}

uint64_t sub_1000069BC(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = v2[5];
  v6 = v2[6];
  sub_100006304(v2 + 2, v5);
  objc_msgSend(a2, "coordinate");
  v7 = dispatch thunk of WeatherDataServiceType.perform(requests:for:with:)(&off_100008460, a1, v5, v6);
  v8 = (void *)zalgo.getter();
  v9 = type metadata accessor for LocationInfo(0);
  v10 = Promise.then<A>(on:closure:)(v8, sub_100006A68, 0, v9);
  swift_release(v7);

  return v10;
}

uint64_t sub_100006A68(uint64_t *a1)
{
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  void (*v30)(char *, char *, uint64_t);
  _QWORD *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  void (*v37)(char *, char *, uint64_t);
  char *v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;

  v2 = type metadata accessor for WeatherDataResponse(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v52 - v7;
  v9 = type metadata accessor for LocationInfo(0);
  v65 = *(_QWORD *)(v9 - 8);
  v10 = __chkstk_darwin(v9);
  v55 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v10);
  v64 = (char *)&v52 - v13;
  v14 = __chkstk_darwin(v12);
  v61 = (char *)&v52 - v15;
  v16 = __chkstk_darwin(v14);
  v60 = (char *)&v52 - v17;
  __chkstk_darwin(v16);
  v54 = (char *)&v52 - v18;
  v19 = sub_1000052BC(&qword_10000C388);
  v20 = __chkstk_darwin(v19);
  v22 = (char *)&v52 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __chkstk_darwin(v20);
  v56 = (uint64_t)&v52 - v24;
  __chkstk_darwin(v23);
  v57 = (uint64_t)&v52 - v25;
  v26 = *a1;
  v27 = *(_QWORD *)(*a1 + 16);
  if (v27)
  {
    v28 = v26 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v63 = *(_QWORD *)(v3 + 72);
    v53 = v26;
    swift_bridgeObjectRetain();
    v29 = &_swiftEmptyArrayStorage;
    v58 = v6;
    v59 = v2;
    do
    {
      sub_100006FC4(v28, (uint64_t)v8);
      sub_100006FC4((uint64_t)v8, (uint64_t)v6);
      if (swift_getEnumCaseMultiPayload(v6, v2) == 6)
      {
        v30 = *(void (**)(char *, char *, uint64_t))(v65 + 32);
        v62 = v27;
        v31 = v29;
        v32 = v8;
        v33 = v2;
        v34 = v61;
        v30(v61, v6, v9);
        v35 = v34;
        v2 = v33;
        v8 = v32;
        v29 = v31;
        v27 = v62;
        v30(v22, v35, v9);
        v36 = 0;
      }
      else
      {
        sub_100007008((uint64_t)v6);
        v36 = 1;
      }
      sub_100007044((uint64_t)v22, v36, 1, v9);
      sub_100007008((uint64_t)v8);
      if (sub_100006328((uint64_t)v22, 1, v9) == 1)
      {
        sub_100007050((uint64_t)v22);
      }
      else
      {
        v37 = *(void (**)(char *, char *, uint64_t))(v65 + 32);
        v38 = v60;
        v37(v60, v22, v9);
        v37(v64, v38, v9);
        if ((swift_isUniquelyReferenced_nonNull_native(v29) & 1) == 0)
          v29 = (_QWORD *)sub_100007114(0, v29[2] + 1, 1, (uint64_t)v29);
        v40 = v29[2];
        v39 = v29[3];
        if (v40 >= v39 >> 1)
          v29 = (_QWORD *)sub_100007114(v39 > 1, v40 + 1, 1, (uint64_t)v29);
        v29[2] = v40 + 1;
        v37((char *)v29+ ((*(unsigned __int8 *)(v65 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v65 + 80))+ *(_QWORD *)(v65 + 72) * v40, v64, v9);
        v6 = v58;
        v2 = v59;
      }
      v28 += v63;
      --v27;
    }
    while (v27);
    swift_bridgeObjectRelease(v53);
  }
  else
  {
    v29 = &_swiftEmptyArrayStorage;
  }
  v41 = v57;
  sub_100006F2C((uint64_t)v29, v57);
  swift_bridgeObjectRelease(v29);
  v42 = v56;
  sub_100007090(v41, v56);
  if (sub_100006328(v42, 1, v9) == 1)
  {
    sub_100007050(v42);
    v43 = sub_1000070D8();
    v44 = swift_allocError(&type metadata for GeocodeWeatherService.Error, v43, 0, 0);
    v45 = sub_1000052BC(&qword_10000C398);
    swift_allocObject(v45, *(unsigned int *)(v45 + 48), *(unsigned __int16 *)(v45 + 52));
    v46 = Promise.init(error:)(v44);
  }
  else
  {
    v47 = v65;
    v48 = v54;
    (*(void (**)(char *, uint64_t, uint64_t))(v65 + 32))(v54, v42, v9);
    v49 = v55;
    (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v55, v48, v9);
    v50 = sub_1000052BC(&qword_10000C398);
    swift_allocObject(v50, *(unsigned int *)(v50 + 48), *(unsigned __int16 *)(v50 + 52));
    v46 = Promise.init(value:)(v49);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v48, v9);
  }
  sub_100007050(v41);
  return v46;
}

uint64_t sub_100006F2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = type metadata accessor for LocationInfo(0);
  v6 = v5;
  if (v4)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1+ ((*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80)), v5);
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }
  return sub_100007044(a2, v7, 1, v6);
}

uint64_t sub_100006FA4(uint64_t a1, void *a2)
{
  return sub_1000069BC(a1, a2);
}

uint64_t sub_100006FC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for WeatherDataResponse(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007008(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for WeatherDataResponse(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100007044(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_100007050(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000052BC(&qword_10000C388);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100007090(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000052BC(&qword_10000C388);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000070D8()
{
  unint64_t result;

  result = qword_10000C390;
  if (!qword_10000C390)
  {
    result = swift_getWitnessTable(&unk_100007AB0, &type metadata for GeocodeWeatherService.Error);
    atomic_store(result, (unint64_t *)&qword_10000C390);
  }
  return result;
}

size_t sub_100007114(size_t result, int64_t a2, char a3, uint64_t a4)
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
  uint64_t v19;

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
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_1000052BC(&qword_10000C3A0);
  v11 = *(_QWORD *)(type metadata accessor for LocationInfo(0) - 8);
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
  v17 = type metadata accessor for LocationInfo(0);
  v18 = *(unsigned __int8 *)(*(_QWORD *)(v17 - 8) + 80);
  v19 = (v18 + 32) & ~v18;
  if ((v5 & 1) != 0)
  {
    sub_100007264(a4 + v19, v8, (unint64_t)v15 + v19);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy((char *)v15 + v19, a4 + v19, v8, v17);
  }
  swift_bridgeObjectRelease(a4);
  return (size_t)v15;
}

uint64_t sub_100007264(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;
  uint64_t v7;

  if (a3 < a1
    || (result = type metadata accessor for LocationInfo(0),
        a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    v7 = type metadata accessor for LocationInfo(0);
    return swift_arrayInitWithTakeFrontToBack(a3, a1, a2, v7);
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront(a3, a1, a2, result);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for GeocodeWeatherService.Error(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for GeocodeWeatherService.Error(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1000073A0 + 4 * asc_1000079E0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1000073C0 + 4 * byte_1000079E5[v4]))();
}

_BYTE *sub_1000073A0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1000073C0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1000073C8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1000073D0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1000073D8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1000073E0(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1000073EC()
{
  return 0;
}

ValueMetadata *type metadata accessor for GeocodeWeatherService.Error()
{
  return &type metadata for GeocodeWeatherService.Error;
}

unint64_t sub_10000740C()
{
  unint64_t result;

  result = qword_10000C3A8;
  if (!qword_10000C3A8)
  {
    result = swift_getWitnessTable(&unk_100007A88, &type metadata for GeocodeWeatherService.Error);
    atomic_store(result, (unint64_t *)&qword_10000C3A8);
  }
  return result;
}
