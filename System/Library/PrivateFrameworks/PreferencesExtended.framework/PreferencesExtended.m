ValueMetadata *type metadata accessor for UINavigationItemProxyNavigationItemAdaptor()
{
  return &type metadata for UINavigationItemProxyNavigationItemAdaptor;
}

uint64_t sub_2446DF79C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9B58);
  sub_2446F5A48();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_2446F6470;
  sub_2446F5A3C();
  sub_2446F5A30();
  sub_2446E04F0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AB8);
  sub_2446E0538();
  return sub_2446F5D24();
}

void sub_2446DF880()
{
  uint64_t v0;
  os_log_type_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *oslog;
  uint64_t v5;

  if (qword_2543F9A20 != -1)
    swift_once();
  v0 = sub_2446F585C();
  __swift_project_value_buffer(v0, (uint64_t)qword_2543FAF48);
  oslog = sub_2446F5844();
  v1 = sub_2446F5CB8();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = swift_slowAlloc();
    v3 = swift_slowAlloc();
    v5 = v3;
    *(_DWORD *)v2 = 136315394;
    sub_2446E9108(0xD00000000000002ALL, 0x80000002446F64A0, &v5);
    sub_2446F5D00();
    *(_WORD *)(v2 + 12) = 2080;
    sub_2446E9108(0xD000000000000022, 0x80000002446F97F0, &v5);
    sub_2446F5D00();
    _os_log_impl(&dword_2446DD000, oslog, v1, "…Complete (%s.%s)", (uint8_t *)v2, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v3, -1, -1);
    MEMORY[0x2495161CC](v2, -1, -1);

  }
  else
  {

  }
}

void sub_2446DFA4C(void *a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  _QWORD *v11;
  NSObject *v12;
  uint64_t v13;

  if (qword_2543F9A20 != -1)
    swift_once();
  v2 = sub_2446F585C();
  __swift_project_value_buffer(v2, (uint64_t)qword_2543FAF48);
  v3 = sub_2446F5844();
  v4 = sub_2446F5CB8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = swift_slowAlloc();
    v6 = swift_slowAlloc();
    v13 = v6;
    *(_DWORD *)v5 = 136315394;
    sub_2446E9108(0xD00000000000002ALL, 0x80000002446F64A0, &v13);
    sub_2446F5D00();
    *(_WORD *)(v5 + 12) = 2080;
    sub_2446E9108(0xD000000000000022, 0x80000002446F97F0, &v13);
    sub_2446F5D00();
    _os_log_impl(&dword_2446DD000, v3, v4, "Start (%s.%s)…", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v6, -1, -1);
    MEMORY[0x2495161CC](v5, -1, -1);
  }

  v7 = a1;
  v8 = sub_2446F5844();
  v9 = sub_2446F5CB8();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 141558275;
    v13 = 1752392040;
    sub_2446F5D00();
    *(_WORD *)(v10 + 12) = 2113;
    v13 = (uint64_t)v7;
    v12 = v7;
    sub_2446F5D00();
    *v11 = v7;

    _os_log_impl(&dword_2446DD000, v8, v9, "Update Navigation Item for %{private,mask.hash}@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9B40);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v11, -1, -1);
    MEMORY[0x2495161CC](v10, -1, -1);
  }
  else
  {

    v8 = v7;
  }

  sub_2446DF880();
}

void sub_2446DFD40(void *a1, void *a2)
{
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;

  if (qword_2543F9A20 != -1)
    swift_once();
  v4 = sub_2446F585C();
  __swift_project_value_buffer(v4, (uint64_t)qword_2543FAF48);
  v5 = a1;
  v6 = a2;
  v15 = v5;
  v7 = v6;
  v8 = sub_2446F5844();
  v9 = sub_2446F5CB8();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v16 = v14;
    *(_DWORD *)v10 = 136316419;
    sub_2446E9108(0xD00000000000002ALL, 0x80000002446F64A0, &v16);
    sub_2446F5D00();
    *(_WORD *)(v10 + 12) = 2080;
    sub_2446E9108(0xD000000000000022, 0x80000002446F97C0, &v16);
    sub_2446F5D00();
    *(_WORD *)(v10 + 22) = 2160;
    sub_2446F5D00();
    *(_WORD *)(v10 + 32) = 2113;
    v12 = v15;
    sub_2446F5D00();
    *v11 = v15;

    *(_WORD *)(v10 + 42) = 2160;
    sub_2446F5D00();
    *(_WORD *)(v10 + 52) = 2113;
    v13 = v7;
    sub_2446F5D00();
    v11[1] = v7;

    _os_log_impl(&dword_2446DD000, v8, v9, "…Complete (%s.%s) viewController: %{private,mask.hash}@, child: %{private,mask.hash}@", (uint8_t *)v10, 0x3Eu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9B40);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v11, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v14, -1, -1);
    MEMORY[0x2495161CC](v10, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_2446E0070(void *a1, void *a2)
{
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  if (qword_2543F9A20 != -1)
    swift_once();
  v4 = sub_2446F585C();
  __swift_project_value_buffer(v4, (uint64_t)qword_2543FAF48);
  v5 = a1;
  v6 = a2;
  v7 = v5;
  v8 = v6;
  v9 = sub_2446F5844();
  v10 = sub_2446F5CB8();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v12 = (_QWORD *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    v21 = v20;
    *(_DWORD *)v11 = 136316419;
    sub_2446E9108(0xD00000000000002ALL, 0x80000002446F64A0, &v21);
    sub_2446F5D00();
    *(_WORD *)(v11 + 12) = 2080;
    sub_2446E9108(0xD000000000000022, 0x80000002446F97C0, &v21);
    sub_2446F5D00();
    *(_WORD *)(v11 + 22) = 2160;
    sub_2446F5D00();
    *(_WORD *)(v11 + 32) = 2113;
    v13 = v7;
    sub_2446F5D00();
    *v12 = v7;

    *(_WORD *)(v11 + 42) = 2160;
    sub_2446F5D00();
    *(_WORD *)(v11 + 52) = 2113;
    v14 = v8;
    sub_2446F5D00();
    v12[1] = v8;

    _os_log_impl(&dword_2446DD000, v9, v10, "Start (%s.%s) viewController: %{private,mask.hash}@, child: %{private,mask.hash}@…", (uint8_t *)v11, 0x3Eu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9B40);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v12, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v20, -1, -1);
    MEMORY[0x2495161CC](v11, -1, -1);

  }
  else
  {

  }
  v15 = objc_msgSend(v7, sel_childViewControllers);
  sub_2446E0474();
  v16 = sub_2446F5C34();

  if (v16 >> 62)
  {
    swift_bridgeObjectRetain();
    v17 = sub_2446F5DA8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v17)
  {
    if (v7 == v8)
    {
      v18 = 1;
      v8 = v7;
      goto LABEL_15;
    }
    if (qword_2543F9808 != -1)
      swift_once();
    sub_2446F2B60(v8, v7);
  }
  v18 = 0;
LABEL_15:
  sub_2446DFD40(v7, v8);
  return v18;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_2446E0474()
{
  unint64_t result;

  result = qword_2543F9AE0;
  if (!qword_2543F9AE0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2543F9AE0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249516118]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2446E04F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2543F9A40;
  if (!qword_2543F9A40)
  {
    v1 = sub_2446F5A48();
    result = MEMORY[0x249516130](MEMORY[0x24BDF0FE8], v1);
    atomic_store(result, (unint64_t *)&qword_2543F9A40);
  }
  return result;
}

unint64_t sub_2446E0538()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2543F9AC0;
  if (!qword_2543F9AC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543F9AB8);
    result = MEMORY[0x249516130](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2543F9AC0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249516124](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

PreferencesExtended::SettingsAppPrimaryNavigationMode_optional __swiftcall SettingsAppPrimaryNavigationMode.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  if (rawValue == 1)
    v2 = 1;
  else
    v2 = 2;
  if (!rawValue)
    v2 = 0;
  *v1 = v2;
  return (PreferencesExtended::SettingsAppPrimaryNavigationMode_optional)rawValue;
}

uint64_t SettingsAppPrimaryNavigationMode.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_2446E05EC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2446E0604()
{
  sub_2446F5E44();
  sub_2446F5E50();
  return sub_2446F5E5C();
}

uint64_t sub_2446E0648()
{
  return sub_2446F5E50();
}

uint64_t sub_2446E0670()
{
  sub_2446F5E44();
  sub_2446F5E50();
  return sub_2446F5E5C();
}

_QWORD *sub_2446E06B0@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void sub_2446E06D0(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t static SettingsAppPrimaryNavigationModeKey.defaultValue.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_beginAccess();
  *a1 = byte_25737B710;
  return result;
}

uint64_t static SettingsAppPrimaryNavigationModeKey.defaultValue.setter(char *a1)
{
  char v1;
  uint64_t result;

  v1 = *a1;
  result = swift_beginAccess();
  byte_25737B710 = v1;
  return result;
}

uint64_t (*static SettingsAppPrimaryNavigationModeKey.defaultValue.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2446E07AC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_beginAccess();
  *a1 = byte_25737B710;
  return result;
}

uint64_t sub_2446E07F4()
{
  sub_2446E0E44();
  return sub_2446F58EC();
}

uint64_t EnvironmentValues.settingsAppPrimaryNavigationMode.getter()
{
  sub_2446E0878();
  return sub_2446F5988();
}

unint64_t sub_2446E0878()
{
  unint64_t result;

  result = qword_2543F9860;
  if (!qword_2543F9860)
  {
    result = MEMORY[0x249516130](&protocol conformance descriptor for SettingsAppPrimaryNavigationModeKey, &type metadata for SettingsAppPrimaryNavigationModeKey);
    atomic_store(result, (unint64_t *)&qword_2543F9860);
  }
  return result;
}

uint64_t sub_2446E08BC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  sub_2446E0878();
  result = sub_2446F5988();
  *a1 = v3;
  return result;
}

uint64_t sub_2446E0908()
{
  sub_2446E0878();
  return sub_2446F5994();
}

uint64_t View.settingsAppPrimaryNavigationMode(_:)()
{
  swift_getKeyPath();
  sub_2446F5ACC();
  return swift_release();
}

uint64_t sub_2446E09C0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  sub_2446E0878();
  result = sub_2446F5988();
  *a1 = v3;
  return result;
}

uint64_t sub_2446E0A0C()
{
  sub_2446E0878();
  return sub_2446F5994();
}

uint64_t sub_2446E0A54()
{
  uint64_t result;

  result = swift_beginAccess();
  byte_25737B711 = byte_25737B710;
  return result;
}

uint64_t static SettingsAppPrimaryNavigationModeTrait.defaultValue.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  if (qword_2543F98F0 != -1)
    result = swift_once();
  *a1 = byte_25737B711;
  return result;
}

uint64_t sub_2446E0AEC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  if (qword_2543F98F0 != -1)
    result = swift_once();
  *a1 = byte_25737B711;
  return result;
}

uint64_t UITraitCollection.settingsAppPrimaryNavigationMode.getter()
{
  sub_2446E0B98();
  sub_2446E0BDC();
  return sub_2446F5CC4();
}

unint64_t sub_2446E0B98()
{
  unint64_t result;

  result = qword_2543F98F8;
  if (!qword_2543F98F8)
  {
    result = MEMORY[0x249516130](&protocol conformance descriptor for SettingsAppPrimaryNavigationModeTrait, &type metadata for SettingsAppPrimaryNavigationModeTrait);
    atomic_store(result, (unint64_t *)&qword_2543F98F8);
  }
  return result;
}

unint64_t sub_2446E0BDC()
{
  unint64_t result;

  result = qword_2543F9818;
  if (!qword_2543F9818)
  {
    result = MEMORY[0x249516130](&protocol conformance descriptor for SettingsAppPrimaryNavigationMode, &type metadata for SettingsAppPrimaryNavigationMode);
    atomic_store(result, (unint64_t *)&qword_2543F9818);
  }
  return result;
}

uint64_t UIMutableTraits.settingsAppPrimaryNavigationMode.getter()
{
  sub_2446E0B98();
  sub_2446E0BDC();
  return sub_2446F5868();
}

uint64_t UIMutableTraits.settingsAppPrimaryNavigationMode.setter()
{
  sub_2446E0B98();
  sub_2446E0BDC();
  return sub_2446F5874();
}

uint64_t (*UIMutableTraits.settingsAppPrimaryNavigationMode.modify(_QWORD *a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v3;

  a1[1] = a3;
  a1[2] = v3;
  *a1 = a2;
  UIMutableTraits.settingsAppPrimaryNavigationMode.getter();
  return sub_2446E0D28;
}

uint64_t sub_2446E0D28()
{
  return UIMutableTraits.settingsAppPrimaryNavigationMode.setter();
}

uint64_t static SettingsAppPrimaryNavigationModeKey.read(from:)()
{
  sub_2446E0B98();
  sub_2446E0BDC();
  return sub_2446F5CC4();
}

uint64_t static SettingsAppPrimaryNavigationModeKey.write(to:value:)(uint64_t a1)
{
  __swift_mutable_project_boxed_opaque_existential_1(a1, *(_QWORD *)(a1 + 24));
  return UIMutableTraits.settingsAppPrimaryNavigationMode.setter();
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

unint64_t sub_2446E0E44()
{
  unint64_t result;

  result = qword_2543F9810;
  if (!qword_2543F9810)
  {
    result = MEMORY[0x249516130](&protocol conformance descriptor for SettingsAppPrimaryNavigationMode, &type metadata for SettingsAppPrimaryNavigationMode);
    atomic_store(result, (unint64_t *)&qword_2543F9810);
  }
  return result;
}

unint64_t sub_2446E0E8C()
{
  unint64_t result;

  result = qword_2543F9858;
  if (!qword_2543F9858)
  {
    result = MEMORY[0x249516130](&protocol conformance descriptor for SettingsAppPrimaryNavigationModeKey, &type metadata for SettingsAppPrimaryNavigationModeKey);
    atomic_store(result, (unint64_t *)&qword_2543F9858);
  }
  return result;
}

uint64_t sub_2446E0ED0()
{
  sub_2446E0B98();
  sub_2446E0BDC();
  return sub_2446F5CC4();
}

uint64_t sub_2446E0F20(uint64_t a1)
{
  __swift_mutable_project_boxed_opaque_existential_1(a1, *(_QWORD *)(a1 + 24));
  return UIMutableTraits.settingsAppPrimaryNavigationMode.setter();
}

uint64_t sub_2446E0F74@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  result = UIMutableTraits.settingsAppPrimaryNavigationMode.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_2446E0FB4()
{
  return UIMutableTraits.settingsAppPrimaryNavigationMode.setter();
}

uint64_t sub_2446E0FF0()
{
  return 16;
}

__n128 sub_2446E0FFC(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SettingsAppPrimaryNavigationMode(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SettingsAppPrimaryNavigationMode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2446E10F4 + 4 * byte_2446F6535[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2446E1128 + 4 * byte_2446F6530[v4]))();
}

uint64_t sub_2446E1128(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2446E1130(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2446E1138);
  return result;
}

uint64_t sub_2446E1144(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2446E114CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2446E1150(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2446E1158(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2446E1164(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2446E1170(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SettingsAppPrimaryNavigationMode()
{
  return &type metadata for SettingsAppPrimaryNavigationMode;
}

ValueMetadata *type metadata accessor for SettingsAppPrimaryNavigationModeKey()
{
  return &type metadata for SettingsAppPrimaryNavigationModeKey;
}

ValueMetadata *type metadata accessor for SettingsAppPrimaryNavigationModeTrait()
{
  return &type metadata for SettingsAppPrimaryNavigationModeTrait;
}

uint64_t sub_2446E11AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543F9A50);
  v2 = sub_2446F5934();
  v4[0] = v1;
  v4[1] = sub_2446E120C();
  return MEMORY[0x249516130](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_2446E120C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2543F9A48;
  if (!qword_2543F9A48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543F9A50);
    result = MEMORY[0x249516130](MEMORY[0x24BDF1028], v1);
    atomic_store(result, (unint64_t *)&qword_2543F9A48);
  }
  return result;
}

uint64_t sub_2446E125C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2446E12A8()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for OnceClosure(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for OnceClosure);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2495160AC](a1, v6, a5);
}

uint64_t PreferencesPluginError.description.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2446E133C + 4 * byte_2446F67E0[*v0]))(0xD00000000000002ELL, 0x80000002446F98D0);
}

unint64_t sub_2446E133C()
{
  return 0xD00000000000001ELL;
}

uint64_t sub_2446E1358@<X0>(uint64_t a1@<X8>)
{
  return a1 + 6;
}

BOOL static PreferencesPluginError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PreferencesPluginError.hash(into:)()
{
  return sub_2446F5E50();
}

uint64_t PreferencesPluginError.hashValue.getter()
{
  sub_2446F5E44();
  sub_2446F5E50();
  return sub_2446F5E5C();
}

BOOL sub_2446E1400(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_2446E1418()
{
  unint64_t result;

  result = qword_25737B798;
  if (!qword_25737B798)
  {
    result = MEMORY[0x249516130](&protocol conformance descriptor for PreferencesPluginError, &type metadata for PreferencesPluginError);
    atomic_store(result, (unint64_t *)&qword_25737B798);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PreferencesPluginError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PreferencesPluginError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2446E154C + 4 * byte_2446F67E9[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2446E1580 + 4 * byte_2446F67E4[v4]))();
}

uint64_t sub_2446E1580(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2446E1588(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2446E1590);
  return result;
}

uint64_t sub_2446E159C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2446E15A4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2446E15A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2446E15B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2446E15BC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PreferencesPluginError()
{
  return &type metadata for PreferencesPluginError;
}

uint64_t SettingsAnyViewRecipe.view.getter()
{
  type metadata accessor for SettingsAnyViewRecipe();
  return swift_retain();
}

uint64_t type metadata accessor for SettingsAnyViewRecipe()
{
  uint64_t result;

  result = qword_2543F9340;
  if (!qword_2543F9340)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t SettingsAnyViewRecipe.init<A>(content:)@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  MEMORY[0x24BDAC7A8]();
  v4 = sub_2446F57F0();
  a1(v4);
  v5 = sub_2446F5B38();
  result = type metadata accessor for SettingsAnyViewRecipe();
  *(_QWORD *)(a2 + *(int *)(result + 20)) = v5;
  return result;
}

uint64_t SettingsAnyViewRecipe.hash(into:)()
{
  sub_2446F57FC();
  sub_2446E18F0(&qword_25737B7A0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  return sub_2446F5BE0();
}

uint64_t SettingsAnyViewRecipe.hashValue.getter()
{
  sub_2446F5E44();
  sub_2446F57FC();
  sub_2446E18F0(&qword_25737B7A0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_2446F5BE0();
  return sub_2446F5E5C();
}

uint64_t sub_2446E1798()
{
  sub_2446F5E44();
  sub_2446F57FC();
  sub_2446E18F0(&qword_25737B7A0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_2446F5BE0();
  return sub_2446F5E5C();
}

uint64_t sub_2446E1804()
{
  sub_2446F57FC();
  sub_2446E18F0(&qword_25737B7A0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  return sub_2446F5BE0();
}

uint64_t sub_2446E185C()
{
  sub_2446F5E44();
  sub_2446F57FC();
  sub_2446E18F0(&qword_25737B7A0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_2446F5BE0();
  return sub_2446F5E5C();
}

uint64_t sub_2446E18C4()
{
  return sub_2446E18F0(&qword_2543F97F8, (uint64_t (*)(uint64_t))type metadata accessor for SettingsAnyViewRecipe, (uint64_t)&protocol conformance descriptor for SettingsAnyViewRecipe);
}

uint64_t sub_2446E18F0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x249516130](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for SettingsAnyViewRecipe(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    v7 = sub_2446F57FC();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t destroy for SettingsAnyViewRecipe(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2446F57FC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t initializeWithCopy for SettingsAnyViewRecipe(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_2446F57FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SettingsAnyViewRecipe(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_2446F57FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for SettingsAnyViewRecipe(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_2446F57FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for SettingsAnyViewRecipe(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_2446F57FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SettingsAnyViewRecipe()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2446E1B98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_2446F57FC();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for SettingsAnyViewRecipe()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2446E1C20(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_2446F57FC();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_2446E1C98()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2446F57FC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2446E1D0C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  if (qword_2543F9A20 != -1)
    swift_once();
  v2 = sub_2446F585C();
  __swift_project_value_buffer(v2, (uint64_t)qword_2543FAF48);
  swift_retain();
  v3 = sub_2446F5844();
  v4 = sub_2446F5CB8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = swift_slowAlloc();
    v6 = swift_slowAlloc();
    v9 = v6;
    *(_DWORD *)v5 = 136315394;
    sub_2446E9108(0xD00000000000002ELL, 0x80000002446F69A0, &v9);
    sub_2446F5D00();
    swift_release();
    *(_WORD *)(v5 + 12) = 2080;
    sub_2446E9108(0xD000000000000011, 0x80000002446F9990, &v9);
    sub_2446F5D00();
    _os_log_impl(&dword_2446DD000, v3, v4, "Start (%s.%s)…", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v6, -1, -1);
    MEMORY[0x2495161CC](v5, -1, -1);

  }
  else
  {

    swift_release();
  }
  type metadata accessor for SettingsAnyPlatformViewControllerRepresentable.Coordinator();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a1;
  swift_retain();
  sub_2446E1F0C();
  return v7;
}

void sub_2446E1F0C()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (qword_2543F9A20 != -1)
    swift_once();
  v0 = sub_2446F585C();
  __swift_project_value_buffer(v0, (uint64_t)qword_2543FAF48);
  swift_retain();
  v1 = sub_2446F5844();
  v2 = sub_2446F5CB8();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = swift_slowAlloc();
    v4 = swift_slowAlloc();
    v5 = v4;
    *(_DWORD *)v3 = 136315394;
    sub_2446E9108(0xD00000000000002ELL, 0x80000002446F69A0, &v5);
    sub_2446F5D00();
    swift_release();
    *(_WORD *)(v3 + 12) = 2080;
    sub_2446E9108(0xD000000000000011, 0x80000002446F9990, &v5);
    sub_2446F5D00();
    _os_log_impl(&dword_2446DD000, v1, v2, "…Complete (%s.%s)", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v4, -1, -1);
    MEMORY[0x2495161CC](v3, -1, -1);

  }
  else
  {

    swift_release();
  }
}

void *sub_2446E20F8()
{
  void *v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25737B7B8);
  sub_2446F5A54();
  swift_retain();
  swift_release();
  v0 = sub_2446E5CD8();
  swift_release();
  return v0;
}

uint64_t sub_2446E215C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_2446F597C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25737B7B8);
  sub_2446F5A54();
  swift_retain();
  swift_release();
  sub_2446F5A60();
  sub_2446F5A6C();
  sub_2446E6704();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_2446E224C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t result;

  result = sub_2446E1D0C(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_2446E2274()
{
  return sub_2446F59E8();
}

uint64_t sub_2446E22AC()
{
  sub_2446E2430();
  return sub_2446F5A24();
}

uint64_t sub_2446E22FC()
{
  sub_2446E2430();
  return sub_2446F59F4();
}

uint64_t sub_2446E234C()
{
  return sub_2446F5AD8();
}

void sub_2446E2364()
{
  sub_2446E2430();
  sub_2446F5A18();
  __break(1u);
}

uint64_t sub_2446E2388()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SettingsAnyPlatformViewControllerRepresentable.Coordinator()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for SettingsAnyPlatformViewControllerRepresentable()
{
  return &type metadata for SettingsAnyPlatformViewControllerRepresentable;
}

unint64_t sub_2446E23E0()
{
  unint64_t result;

  result = qword_25737B7A8;
  if (!qword_25737B7A8)
  {
    result = MEMORY[0x249516130](&unk_2446F6A68, &type metadata for SettingsAnyPlatformViewControllerRepresentable);
    atomic_store(result, (unint64_t *)&qword_25737B7A8);
  }
  return result;
}

uint64_t sub_2446E2424()
{
  return MEMORY[0x24BDF5560];
}

unint64_t sub_2446E2430()
{
  unint64_t result;

  result = qword_25737B7B0;
  if (!qword_25737B7B0)
  {
    result = MEMORY[0x249516130](&unk_2446F69F0, &type metadata for SettingsAnyPlatformViewControllerRepresentable);
    atomic_store(result, (unint64_t *)&qword_25737B7B0);
  }
  return result;
}

uint64_t sub_2446E2474(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _BYTE v18[32];
  _QWORD v19[4];
  uint64_t v20;

  v2 = v1;
  v17 = sub_2446F5754();
  v4 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
    goto LABEL_15;
  v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v8 = MEMORY[0x24BEE4AF8];
    if (!v7)
      return v8;
    v20 = MEMORY[0x24BEE4AF8];
    result = sub_2446E2A18(0, v7 & ~(v7 >> 63), 0);
    if (v7 < 0)
      break;
    v16 = v2;
    v10 = 0;
    v8 = v20;
    v2 = a1 & 0xC000000000000001;
    while (v7 != v10)
    {
      if (v2)
        v11 = (id)MEMORY[0x249515C2C](v10, a1);
      else
        v11 = *(id *)(a1 + 8 * v10 + 32);
      v12 = v11;
      v19[3] = sub_2446E29DC();
      v19[0] = v12;
      sub_2446E2A34((uint64_t)v19, (uint64_t)v18);
      v13 = v12;
      sub_2446F5748();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);

      v20 = v8;
      v15 = *(_QWORD *)(v8 + 16);
      v14 = *(_QWORD *)(v8 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_2446E2A18(v14 > 1, v15 + 1, 1);
        v8 = v20;
      }
      ++v10;
      *(_QWORD *)(v8 + 16) = v15 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v8+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(_QWORD *)(v4 + 72) * v15, v6, v17);
      if (v7 == v10)
        return v8;
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    v7 = sub_2446F5DA8();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t PSViewController.emitNavigationEventForSystemSetting(icon:title:localizedNavigationComponents:deepLink:)()
{
  sub_2446F5BBC();
  sub_2446F5BB0();
  sub_2446F5B98();
  return swift_release();
}

uint64_t sub_2446E26B8(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  id v15;
  uint64_t v17;

  v6 = sub_2446F57D8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2446F5BF8();
  v12 = v11;
  sub_2446E29DC();
  v13 = sub_2446F5C34();
  sub_2446F57B4();
  v14 = a4;
  v15 = a1;
  sub_2446E2C74(v10, v12, v14, v13, (uint64_t)v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t PSViewController.emitNavigationEventForApplicationSetting(applicationBundleIdentifier:title:localizedNavigationComponents:deepLink:)()
{
  sub_2446F5BBC();
  sub_2446F5BB0();
  sub_2446F5BA4();
  return swift_release();
}

uint64_t sub_2446E2830(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;

  v18 = sub_2446F5754();
  v6 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2446F57D8();
  v19 = *(_QWORD *)(v9 - 8);
  v20 = v9;
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2446F5BF8();
  v12 = sub_2446E29DC();
  v13 = sub_2446F5C34();
  sub_2446F57B4();
  v22 = v12;
  v21 = a4;
  v14 = a4;
  v15 = a1;
  sub_2446F5748();
  sub_2446E2474(v13);
  sub_2446F5BBC();
  sub_2446F5BB0();
  sub_2446F5BA4();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v18);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v11, v20);
}

unint64_t sub_2446E29DC()
{
  unint64_t result;

  result = qword_2543F9320;
  if (!qword_2543F9320)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2543F9320);
  }
  return result;
}

uint64_t sub_2446E2A18(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_2446E2A90(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_2446E2A34(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_2446E2A90(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543F9328);
  v10 = *(_QWORD *)(sub_2446F5754() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_2446F5754() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = sub_2446F5DD8();
  __break(1u);
  return result;
}

uint64_t sub_2446E2C74(uint64_t a1, uint64_t a2, void *a3, unint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  _QWORD v19[8];

  v19[1] = a5;
  v9 = sub_2446F5754();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2446F5B74();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8]();
  v16 = (_QWORD *)((char *)v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v16 = a1;
  v16[1] = a2;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v14 + 104))(v16, *MEMORY[0x24BE85558], v13);
  v19[7] = sub_2446E29DC();
  v19[4] = a3;
  swift_bridgeObjectRetain();
  v17 = a3;
  sub_2446F5748();
  sub_2446E2474(a4);
  sub_2446F5BBC();
  sub_2446F5BB0();
  sub_2446F5B98();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return (*(uint64_t (**)(_QWORD *, uint64_t))(v14 + 8))(v16, v13);
}

id SettingsAnyPlatformViewControllerRecipe.viewController.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 8);
}

uint64_t SettingsAnyPlatformViewControllerRecipe.init(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  a2[1] = result;
  return result;
}

BOOL static SettingsAnyPlatformViewControllerRecipe.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

BOOL sub_2446E2E10(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t SettingsAnyPlatformViewControllerRecipe.hash(into:)()
{
  return sub_2446F5E50();
}

uint64_t SettingsAnyPlatformViewControllerRecipe.hashValue.getter()
{
  sub_2446F5E44();
  sub_2446F5E50();
  return sub_2446F5E5C();
}

uint64_t sub_2446E2E90()
{
  sub_2446F5E44();
  sub_2446F5E50();
  return sub_2446F5E5C();
}

uint64_t sub_2446E2ED4()
{
  return sub_2446F5E50();
}

uint64_t sub_2446E2EFC()
{
  sub_2446F5E44();
  sub_2446F5E50();
  return sub_2446F5E5C();
}

unint64_t sub_2446E2F40()
{
  unint64_t result;

  result = qword_2543F9988[0];
  if (!qword_2543F9988[0])
  {
    result = MEMORY[0x249516130](&protocol conformance descriptor for SettingsAnyPlatformViewControllerRecipe, &type metadata for SettingsAnyPlatformViewControllerRecipe);
    atomic_store(result, qword_2543F9988);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for SettingsAnyPlatformViewControllerRecipe(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  id v4;

  v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = v3;
  return a1;
}

void destroy for SettingsAnyPlatformViewControllerRecipe(uint64_t a1)
{

}

_QWORD *assignWithCopy for SettingsAnyPlatformViewControllerRecipe(_QWORD *a1, _QWORD *a2)
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

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for SettingsAnyPlatformViewControllerRecipe(uint64_t a1, _OWORD *a2)
{
  void *v3;

  v3 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for SettingsAnyPlatformViewControllerRecipe(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SettingsAnyPlatformViewControllerRecipe(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SettingsAnyPlatformViewControllerRecipe()
{
  return &type metadata for SettingsAnyPlatformViewControllerRecipe;
}

uint64_t sub_2446E30C8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t, uint64_t, uint64_t);
  char *v8;
  uint64_t v10;

  v0 = type metadata accessor for ClearSettingsNavigationPathAction();
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AA0);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v0, qword_2543F9868);
  v5 = __swift_project_value_buffer(v0, (uint64_t)qword_2543F9868);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9A98);
  v7 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
  v7(v4, 1, 1, v6);
  v7(v2, 1, 1, v6);
  v8 = &v2[*(int *)(v0 + 20)];
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  sub_2446E32B4((uint64_t)v4, (uint64_t)v2);
  return sub_2446E4890((uint64_t)v2, v5);
}

uint64_t ClearSettingsNavigationPathAction.init(namespace:navigationPath:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9A98);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(a4, 1, 1, v8);
  v9 = a4 + *(int *)(type metadata accessor for ClearSettingsNavigationPathAction() + 20);
  *(_QWORD *)v9 = a1;
  *(_BYTE *)(v9 + 8) = a2 & 1;
  return sub_2446E32B4(a3, a4);
}

uint64_t type metadata accessor for ClearSettingsNavigationPathAction()
{
  uint64_t result;

  result = qword_2543F9828;
  if (!qword_2543F9828)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2446E32B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2446E32FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2543F9888 != -1)
    swift_once();
  v2 = type metadata accessor for ClearSettingsNavigationPathAction();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2543F9868);
  return sub_2446E34A8(v3, a1);
}

uint64_t sub_2446E3358()
{
  sub_2446E4808();
  return sub_2446F58EC();
}

uint64_t sub_2446E33A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for ClearSettingsNavigationPathAction();
  __swift_allocate_value_buffer(v0, qword_2543F9900);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2543F9900);
  if (qword_2543F9888 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_2543F9868);
  return sub_2446E34A8(v2, v1);
}

uint64_t static ClearSettingsNavigationPathActionTrait.defaultValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2543F9920 != -1)
    swift_once();
  v2 = type metadata accessor for ClearSettingsNavigationPathAction();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2543F9900);
  swift_beginAccess();
  return sub_2446E34A8(v3, a1);
}

uint64_t sub_2446E34A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ClearSettingsNavigationPathAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static ClearSettingsNavigationPathActionTrait.defaultValue.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2543F9920 != -1)
    swift_once();
  v2 = type metadata accessor for ClearSettingsNavigationPathAction();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2543F9900);
  swift_beginAccess();
  sub_2446E357C(a1, v3);
  swift_endAccess();
  return sub_2446E35C0(a1);
}

uint64_t sub_2446E357C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ClearSettingsNavigationPathAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_2446E35C0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ClearSettingsNavigationPathAction();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t (*static ClearSettingsNavigationPathActionTrait.defaultValue.modify())()
{
  uint64_t v0;

  if (qword_2543F9920 != -1)
    swift_once();
  v0 = type metadata accessor for ClearSettingsNavigationPathAction();
  __swift_project_value_buffer(v0, (uint64_t)qword_2543F9900);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2446E3674@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2543F9920 != -1)
    swift_once();
  v2 = type metadata accessor for ClearSettingsNavigationPathAction();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2543F9900);
  swift_beginAccess();
  return sub_2446E34A8(v3, a1);
}

uint64_t EnvironmentValues.clearSettingsNavigationPath.getter()
{
  sub_2446E3728();
  return sub_2446F5988();
}

unint64_t sub_2446E3728()
{
  unint64_t result;

  result = qword_2543F9898;
  if (!qword_2543F9898)
  {
    result = MEMORY[0x249516130](&unk_2446F6CE0, &type metadata for ClearSettingsNavigationPathActionKey);
    atomic_store(result, (unint64_t *)&qword_2543F9898);
  }
  return result;
}

uint64_t sub_2446E376C()
{
  sub_2446E3728();
  return sub_2446F5988();
}

uint64_t sub_2446E37A8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  type metadata accessor for ClearSettingsNavigationPathAction();
  v2 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v8 - v5;
  sub_2446E34A8(a1, (uint64_t)&v8 - v5);
  sub_2446E34A8((uint64_t)v6, (uint64_t)v4);
  sub_2446E3728();
  sub_2446F5994();
  return sub_2446E35C0((uint64_t)v6);
}

uint64_t View.clearSettingsNavigationPathAction(_:)()
{
  swift_getKeyPath();
  sub_2446F5ACC();
  return swift_release();
}

uint64_t sub_2446E38C0()
{
  sub_2446E3728();
  return sub_2446F5988();
}

uint64_t UITraitCollection.clearSettingsNavigationPath.getter()
{
  sub_2446E3934();
  return sub_2446F5CD0();
}

unint64_t sub_2446E3934()
{
  unint64_t result;

  result = qword_2543F9928;
  if (!qword_2543F9928)
  {
    result = MEMORY[0x249516130](&protocol conformance descriptor for ClearSettingsNavigationPathActionTrait, &type metadata for ClearSettingsNavigationPathActionTrait);
    atomic_store(result, (unint64_t *)&qword_2543F9928);
  }
  return result;
}

uint64_t sub_2446E3978(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = type metadata accessor for ClearSettingsNavigationPathAction();
  MEMORY[0x24BDAC7A8](v2);
  sub_2446E34A8(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2446E3934();
  sub_2446F5880();
  return sub_2446E35C0(a1);
}

uint64_t sub_2446E3A1C()
{
  sub_2446E3934();
  return sub_2446F5CD0();
}

uint64_t sub_2446E3A58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v4 = type metadata accessor for ClearSettingsNavigationPathAction();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2446E34A8(a2, (uint64_t)v6);
  __swift_mutable_project_boxed_opaque_existential_1(a1, *(_QWORD *)(a1 + 24));
  return sub_2446E3978((uint64_t)v6);
}

Swift::Void __swiftcall ClearSettingsNavigationPathAction.callAsFunction()()
{
  uint64_t v0;
  uint64_t v1;
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
  char *v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;

  v1 = v0;
  v2 = sub_2446F5928();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AA0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9A98);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2446E3D28(v1, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    v13 = &qword_2543F9AA0;
    v14 = (uint64_t)v8;
  }
  else
  {
    sub_2446E3DFC((uint64_t)v8, (uint64_t)v12);
    MEMORY[0x2495159F8](v9);
    v15 = sub_2446F5910();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    if ((v15 & 1) == 0)
    {
      sub_2446F591C();
      sub_2446F5B50();
      sub_2446E3E44((uint64_t)v12, &qword_2543F9A98);
      return;
    }
    v13 = &qword_2543F9A98;
    v14 = (uint64_t)v12;
  }
  sub_2446E3E44(v14, v13);
  if (qword_25737B628 != -1)
    swift_once();
  v16 = sub_2446F585C();
  __swift_project_value_buffer(v16, (uint64_t)qword_25737C4C8);
  v17 = sub_2446F5844();
  v18 = sub_2446F5CAC();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v19 = 0;
    MEMORY[0x2495161CC](v19, -1, -1);
  }

}

uint64_t sub_2446E3D28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static ClearSettingsNavigationPathAction.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  unsigned int v6;

  v4 = *(int *)(type metadata accessor for ClearSettingsNavigationPathAction() + 20);
  v5 = *(unsigned __int8 *)(a1 + v4 + 8);
  v6 = *(unsigned __int8 *)(a2 + v4 + 8);
  if ((v5 & 1) != 0 || (v6 & 1) != 0)
    return v5 & v6;
  else
    return sub_2446F5B68();
}

uint64_t sub_2446E3DCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  unsigned int v5;

  v3 = *(int *)(a3 + 20);
  v4 = *(unsigned __int8 *)(a1 + v3 + 8);
  v5 = *(unsigned __int8 *)(a2 + v3 + 8);
  if ((v4 & 1) != 0 || (v5 & 1) != 0)
    return v4 & v5;
  else
    return sub_2446F5B68();
}

uint64_t sub_2446E3DFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9A98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2446E3E44(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

ValueMetadata *type metadata accessor for ClearSettingsNavigationPathActionTrait()
{
  return &type metadata for ClearSettingsNavigationPathActionTrait;
}

uint64_t *initializeBufferWithCopyOfBuffer for ClearSettingsNavigationPathAction(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v16;
  char *v17;
  char *v18;
  char *v20;

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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9A98);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AA0);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      v11 = a2[1];
      *a1 = *a2;
      a1[1] = v11;
      v12 = *(int *)(v7 + 32);
      v20 = (char *)a1 + v12;
      v13 = (char *)a2 + v12;
      v14 = sub_2446F5928();
      v15 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
      swift_retain();
      swift_retain();
      v15(v20, v13, v14);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    v16 = *(int *)(a3 + 20);
    v17 = (char *)a1 + v16;
    v18 = (char *)a2 + v16;
    *(_QWORD *)v17 = *(_QWORD *)v18;
    v17[8] = v18[8];
  }
  return a1;
}

uint64_t destroy for ClearSettingsNavigationPathAction(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9A98);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
  if (!(_DWORD)result)
  {
    swift_release();
    swift_release();
    v4 = a1 + *(int *)(v2 + 32);
    v5 = sub_2446F5928();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  return result;
}

_QWORD *initializeWithCopy for ClearSettingsNavigationPathAction(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  char *v15;
  char *v16;
  char *v18;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9A98);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AA0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    v9 = a2[1];
    *a1 = *a2;
    a1[1] = v9;
    v10 = *(int *)(v6 + 32);
    v18 = (char *)a1 + v10;
    v11 = (char *)a2 + v10;
    v12 = sub_2446F5928();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_retain();
    swift_retain();
    v13(v18, v11, v12);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v14 = *(int *)(a3 + 20);
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  *(_QWORD *)v15 = *(_QWORD *)v16;
  v15[8] = v16[8];
  return a1;
}

_QWORD *assignWithCopy for ClearSettingsNavigationPathAction(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9A98);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      *a1 = *a2;
      swift_retain();
      swift_release();
      a1[1] = a2[1];
      swift_retain();
      swift_release();
      v21 = *(int *)(v6 + 32);
      v22 = (char *)a1 + v21;
      v23 = (char *)a2 + v21;
      v24 = sub_2446F5928();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 24))(v22, v23, v24);
      goto LABEL_7;
    }
    sub_2446E3E44((uint64_t)a1, &qword_2543F9A98);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AA0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  v11 = *(int *)(v6 + 32);
  v25 = (char *)a1 + v11;
  v12 = (char *)a2 + v11;
  v13 = sub_2446F5928();
  v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  swift_retain();
  swift_retain();
  v14(v25, v12, v13);
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  v16 = *(int *)(a3 + 20);
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = *(_QWORD *)v18;
  v17[8] = v18[8];
  *(_QWORD *)v17 = v19;
  return a1;
}

_QWORD *initializeWithTake for ClearSettingsNavigationPathAction(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9A98);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AA0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    v9 = a2[1];
    *a1 = *a2;
    a1[1] = v9;
    v10 = *(int *)(v6 + 32);
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    v13 = sub_2446F5928();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v14 = *(int *)(a3 + 20);
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  *(_QWORD *)v15 = *(_QWORD *)v16;
  v15[8] = v16[8];
  return a1;
}

_QWORD *assignWithTake for ClearSettingsNavigationPathAction(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9A98);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      *a1 = *a2;
      swift_release();
      a1[1] = a2[1];
      swift_release();
      v21 = *(int *)(v6 + 32);
      v22 = (char *)a1 + v21;
      v23 = (char *)a2 + v21;
      v24 = sub_2446F5928();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 40))(v22, v23, v24);
      goto LABEL_7;
    }
    sub_2446E3E44((uint64_t)a1, &qword_2543F9A98);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AA0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  v11 = a2[1];
  *a1 = *a2;
  a1[1] = v11;
  v12 = *(int *)(v6 + 32);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = sub_2446F5928();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  v17 = *(int *)(a3 + 20);
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  *(_QWORD *)v18 = *(_QWORD *)v19;
  v18[8] = v19[8];
  return a1;
}

uint64_t getEnumTagSinglePayload for ClearSettingsNavigationPathAction()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2446E45AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AA0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for ClearSettingsNavigationPathAction()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2446E45F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AA0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

void sub_2446E463C()
{
  unint64_t v0;

  sub_2446E46AC();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_2446E46AC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2543F9AA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543F9A98);
    v0 = sub_2446F5CF4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2543F9AA8);
  }
}

uint64_t sub_2446E4704(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543F9A60);
  v2 = sub_2446F5934();
  v4[0] = v1;
  v4[1] = sub_2446E4764();
  return MEMORY[0x249516130](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_2446E4764()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2543F9A58;
  if (!qword_2543F9A58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543F9A60);
    result = MEMORY[0x249516130](MEMORY[0x24BDF1028], v1);
    atomic_store(result, (unint64_t *)&qword_2543F9A58);
  }
  return result;
}

ValueMetadata *type metadata accessor for ClearSettingsNavigationPathActionKey()
{
  return &type metadata for ClearSettingsNavigationPathActionKey;
}

unint64_t sub_2446E47C4()
{
  unint64_t result;

  result = qword_2543F9890;
  if (!qword_2543F9890)
  {
    result = MEMORY[0x249516130](&unk_2446F6CA8, &type metadata for ClearSettingsNavigationPathActionKey);
    atomic_store(result, (unint64_t *)&qword_2543F9890);
  }
  return result;
}

unint64_t sub_2446E4808()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2543F9820;
  if (!qword_2543F9820)
  {
    v1 = type metadata accessor for ClearSettingsNavigationPathAction();
    result = MEMORY[0x249516130](&protocol conformance descriptor for ClearSettingsNavigationPathAction, v1);
    atomic_store(result, (unint64_t *)&qword_2543F9820);
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

uint64_t sub_2446E4890(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ClearSettingsNavigationPathAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for PreferencesControllerErrorHostingController()
{
  uint64_t result;

  result = qword_25737B7C0;
  if (!qword_25737B7C0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2446E4910()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2446E494C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t KeyPath;
  char v8;
  _OWORD v10[10];
  char v11;
  _BYTE v12[168];
  char v13;
  char v14;
  __int128 v15;
  char v16;
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
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  __int128 v31;
  __int128 v32;
  char v33;
  _BYTE v34[256];

  v4 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v5 = objc_msgSend(v4, sel_sf_isInternalInstall);

  if (v5)
  {
    v6 = sub_2446F59A0();
    sub_2446E4AE4(a1, (uint64_t)v10);
    *(_OWORD *)&v12[119] = v10[7];
    *(_OWORD *)&v12[135] = v10[8];
    *(_OWORD *)&v12[151] = v10[9];
    *(_OWORD *)&v12[55] = v10[3];
    *(_OWORD *)&v12[71] = v10[4];
    *(_OWORD *)&v12[87] = v10[5];
    *(_OWORD *)&v12[103] = v10[6];
    *(_OWORD *)&v12[7] = v10[0];
    *(_OWORD *)&v12[23] = v10[1];
    v13 = 1;
    v12[167] = v11;
    *(_OWORD *)&v12[39] = v10[2];
    KeyPath = swift_getKeyPath();
    v8 = sub_2446F5A78();
    v24 = *(_OWORD *)&v12[112];
    v25 = *(_OWORD *)&v12[128];
    v26 = *(_OWORD *)&v12[144];
    v20 = *(_OWORD *)&v12[48];
    v21 = *(_OWORD *)&v12[64];
    v22 = *(_OWORD *)&v12[80];
    v23 = *(_OWORD *)&v12[96];
    v17 = *(_OWORD *)v12;
    v18 = *(_OWORD *)&v12[16];
    v14 = 1;
    v15 = (unint64_t)v6;
    v16 = 1;
    v27 = *(_QWORD *)&v12[160];
    v19 = *(_OWORD *)&v12[32];
    v28 = KeyPath;
    v29 = 1;
    v30 = v8;
    v31 = 0u;
    v32 = 0u;
    v33 = 1;
    nullsub_1(&v15);
  }
  else
  {
    sub_2446E54A0(&v15);
  }
  sub_2446E54CC((uint64_t)&v15, (uint64_t)v34);
  return sub_2446E54CC((uint64_t)v34, a2);
}

uint64_t sub_2446E4AE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  char v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t KeyPath;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  _BYTE v51[7];
  char v52;
  _BYTE v53[7];
  char v54;
  _BYTE v55[7];
  char v56;
  char v57;
  char v58;

  v4 = sub_2446F5B08();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2446F5AFC();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDF3FD0], v4);
  v39 = sub_2446F5B14();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_2446F5B5C();
  sub_2446F58E0();
  v8 = v45;
  v37 = v46;
  v38 = v44;
  v9 = v47;
  v36 = v48;
  v35 = v49;
  v34 = sub_2446F5AF0();
  KeyPath = swift_getKeyPath();
  sub_2446F5A9C();
  v31 = sub_2446F5AA8();
  v30 = v10;
  v12 = v11;
  v32 = v13;
  swift_release();
  v14 = v12 & 1;
  v42 = 0;
  v43 = 0xE000000000000000;
  v41 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25737B838);
  sub_2446F5D90();
  sub_2446F5A90();
  v15 = sub_2446F5AA8();
  v17 = v16;
  LOBYTE(v5) = v18;
  v20 = v19;
  swift_bridgeObjectRelease();
  swift_release();
  HIDWORD(v29) = v14;
  v40 = v14;
  v58 = 1;
  v57 = v8;
  v56 = v9;
  v54 = v14;
  v52 = v5 & 1;
  v50 = 1;
  *(_DWORD *)(a2 + 9) = v42;
  *(_DWORD *)(a2 + 12) = *(_DWORD *)((char *)&v42 + 3);
  *(_DWORD *)(a2 + 33) = v41;
  *(_DWORD *)(a2 + 36) = *(_DWORD *)((char *)&v41 + 3);
  v21 = *(_DWORD *)v55;
  *(_DWORD *)(a2 + 52) = *(_DWORD *)&v55[3];
  *(_DWORD *)(a2 + 49) = v21;
  v22 = *(_DWORD *)v53;
  *(_DWORD *)(a2 + 108) = *(_DWORD *)&v53[3];
  *(_DWORD *)(a2 + 105) = v22;
  v23 = *(_DWORD *)v51;
  *(_DWORD *)(a2 + 140) = *(_DWORD *)&v51[3];
  *(_DWORD *)(a2 + 137) = v23;
  LOBYTE(v23) = v50;
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  v24 = v38;
  *(_QWORD *)(a2 + 16) = v39;
  *(_QWORD *)(a2 + 24) = v24;
  *(_BYTE *)(a2 + 32) = v8;
  *(_QWORD *)(a2 + 40) = v37;
  *(_BYTE *)(a2 + 48) = v9;
  *(_QWORD *)(a2 + 56) = v36;
  *(_QWORD *)(a2 + 64) = v35;
  v25 = v34;
  *(_QWORD *)(a2 + 72) = KeyPath;
  *(_QWORD *)(a2 + 80) = v25;
  v26 = v31;
  v27 = v30;
  *(_QWORD *)(a2 + 88) = v31;
  *(_QWORD *)(a2 + 96) = v27;
  *(_BYTE *)(a2 + 104) = v14;
  *(_QWORD *)(a2 + 112) = v32;
  *(_QWORD *)(a2 + 120) = v15;
  *(_QWORD *)(a2 + 128) = v17;
  *(_BYTE *)(a2 + 136) = v5 & 1;
  *(_QWORD *)(a2 + 144) = v20;
  *(_QWORD *)(a2 + 152) = 0;
  *(_BYTE *)(a2 + 160) = v23;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2446E5854(v26, v27, SBYTE4(v29));
  swift_bridgeObjectRetain();
  sub_2446E5854(v15, v17, v5 & 1);
  swift_bridgeObjectRetain();
  sub_2446E5864(v15, v17, v5 & 1);
  swift_bridgeObjectRelease();
  sub_2446E5864(v26, v27, v40);
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2446E4EBC@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_2446E494C(*v1, a1);
}

id sub_2446E4EC8()
{
  return 0;
}

id sub_2446E4ED4()
{
  return 0;
}

id sub_2446E4EE0()
{
  return 0;
}

uint64_t sub_2446E4EF0(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  _OWORD v8[2];

  if (a3)
  {
    v5 = a4;
    v6 = a1;
    swift_unknownObjectRetain();
    sub_2446F5D18();

    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  return sub_2446E3E44((uint64_t)v8, &qword_25737B888);
}

id sub_2446E4F70()
{
  return 0;
}

uint64_t sub_2446E4F78(void *a1, uint64_t a2, void *a3, const void *a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  id v15;
  id v16;
  uint64_t v18;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25737B840);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  v12 = sub_2446F5C70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25737B850;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25737B860;
  v14[5] = v13;
  v15 = a3;
  v16 = a1;
  sub_2446E55BC((uint64_t)v9, (uint64_t)&unk_25737B870, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_2446E50A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v3[5] = sub_2446F5C58();
  v3[6] = sub_2446F5C4C();
  sub_2446F5C40();
  return swift_task_switch();
}

uint64_t sub_2446E511C()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  uint64_t v3;
  id v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(const void **)(v0 + 24);
  swift_release();
  *(_QWORD *)(v0 + 56) = _Block_copy(v2);
  if (v1)
    v3 = sub_2446F5BD4();
  else
    v3 = 0;
  *(_QWORD *)(v0 + 64) = v3;
  v4 = *(id *)(v0 + 32);
  *(_QWORD *)(v0 + 72) = sub_2446F5C4C();
  sub_2446F5C40();
  return swift_task_switch();
}

uint64_t sub_2446E51CC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void (**v3)(_QWORD);

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(void **)(v0 + 32);
  swift_release();
  swift_bridgeObjectRelease();

  if (v1)
  {
    v3 = *(void (***)(_QWORD))(v0 + 56);
    v3[2](v3);
    _Block_release(v3);
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2446E5234()
{
  return 1;
}

id sub_2446E523C(void *a1, uint64_t a2, uint64_t a3)
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)type metadata accessor for PreferencesControllerErrorHostingController();
  return objc_msgSendSuper2(&v5, sel_initWithCoder_, a3);
}

id sub_2446E5284()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PreferencesControllerErrorHostingController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2446E52B8()
{
  id v0;

  v0 = objc_allocWithZone((Class)type metadata accessor for PreferencesControllerErrorHostingController());
  return sub_2446F59B8();
}

uint64_t sub_2446E52F8()
{
  id v0;

  v0 = objc_allocWithZone((Class)type metadata accessor for PreferencesControllerErrorHostingController());
  return sub_2446F59AC();
}

uint64_t sub_2446E5348()
{
  return type metadata accessor for PreferencesControllerErrorHostingController();
}

_QWORD *initializeBufferWithCopyOfBuffer for PreferencesControllerErrorView(_QWORD *a1, id *a2)
{
  id v3;
  id v4;

  v3 = *a2;
  v4 = *a2;
  *a1 = v3;
  return a1;
}

void destroy for PreferencesControllerErrorView(id *a1)
{

}

void **assignWithCopy for PreferencesControllerErrorView(void **a1, id *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = *a2;
  v4 = *a2;
  v5 = *a1;
  *a1 = v3;

  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for PreferencesControllerErrorView(void **a1, void **a2)
{
  void *v3;

  v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for PreferencesControllerErrorView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 8))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PreferencesControllerErrorView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PreferencesControllerErrorView()
{
  return &type metadata for PreferencesControllerErrorView;
}

uint64_t sub_2446E5490()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_2446E54A0(_OWORD *a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)((char *)a1 + 233) = 0u;
  a1[13] = 0u;
  a1[14] = 0u;
  a1[11] = 0u;
  a1[12] = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t sub_2446E54CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25737B830);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2446E5514(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_2446E5CD0;
  return v6();
}

uint64_t sub_2446E5568(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_2446E5CD0;
  return v7();
}

uint64_t sub_2446E55BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2446F5C70();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2446F5C64();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2446E3E44(a1, &qword_25737B840);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2446F5C40();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2446E5708(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2446E576C;
  return v6(a1);
}

uint64_t sub_2446E576C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2446E57B8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2446F5964();
  *a1 = result;
  return result;
}

uint64_t sub_2446E57E0()
{
  return sub_2446F5970();
}

uint64_t sub_2446E5804@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2446F594C();
  *a1 = result;
  return result;
}

uint64_t sub_2446E582C()
{
  swift_retain();
  return sub_2446F5958();
}

uint64_t sub_2446E5854(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_2446E5864(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_2446E5874()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_2446E58A8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_2446E5914;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_25737B848 + dword_25737B848))(v2, v3, v4);
}

uint64_t sub_2446E5914()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2446E5960()
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
  v5[1] = sub_2446E5CD0;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_25737B858 + dword_25737B858))(v2, v3, v4);
}

uint64_t objectdestroy_8Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2446E5A08(uint64_t a1)
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
  v7[1] = sub_2446E5CD0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_25737B868 + dword_25737B868))(a1, v4, v5, v6);
}

uint64_t sub_2446E5A8C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2446E5AB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2446E5914;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25737B878 + dword_25737B878))(a1, v4);
}

unint64_t sub_2446E5B24()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_25737B890;
  if (!qword_25737B890)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25737B830);
    v2 = sub_2446E5B88();
    result = MEMORY[0x249516130](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25737B890);
  }
  return result;
}

unint64_t sub_2446E5B88()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25737B898;
  if (!qword_25737B898)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25737B8A0);
    v2[0] = sub_2446E5BF4();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x249516130](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25737B898);
  }
  return result;
}

unint64_t sub_2446E5BF4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25737B8A8;
  if (!qword_25737B8A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25737B8B0);
    v2[0] = sub_2446E5C90(&qword_25737B8B8, &qword_25737B8C0, MEMORY[0x24BDF4700]);
    v2[1] = sub_2446E5C90(&qword_25737B8C8, (uint64_t *)&unk_25737B8D0, MEMORY[0x24BDF1028]);
    result = MEMORY[0x249516130](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25737B8A8);
  }
  return result;
}

uint64_t sub_2446E5C90(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x249516130](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void *sub_2446E5CD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD *v20;
  _QWORD *v21;
  id v22;
  id v23;
  uint64_t v24;
  os_log_type_t v25;
  void *v26;
  NSObject *v27;
  _QWORD *v28;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9B20);
  v3 = *(_QWORD **)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2543F9A20 != -1)
    swift_once();
  v6 = sub_2446F585C();
  v7 = __swift_project_value_buffer(v6, (uint64_t)qword_2543FAF48);
  swift_retain_n();
  v8 = sub_2446F5844();
  v9 = sub_2446F5CB8();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v33 = v11;
    *(_DWORD *)v10 = 136315394;
    v30 = v7;
    v31 = v3;
    v12 = sub_2446F5E68();
    v32 = sub_2446E9108(v12, v13, &v33);
    sub_2446F5D00();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    v32 = sub_2446E9108(0xD00000000000001CLL, 0x80000002446F9BF0, &v33);
    v3 = v31;
    sub_2446F5D00();
    _os_log_impl(&dword_2446DD000, v8, v9, "Start (%s.%s)…", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v11, -1, -1);
    MEMORY[0x2495161CC](v10, -1, -1);

    v14 = *(void **)(v1 + 24);
    if (*(_QWORD *)(v1 + 32))
      goto LABEL_5;
LABEL_8:
    swift_getKeyPath();
    v22 = v14;
    sub_2446F5760();
    swift_release();
    *(_QWORD *)(swift_allocObject() + 16) = v22;
    sub_2446E6A84();
    v23 = v22;
    v24 = sub_2446F58D4();
    swift_release();
    ((void (*)(char *, uint64_t))v3[1])(v5, v2);
    *(_QWORD *)(v1 + 32) = v24;
    swift_release();
    v15 = v23;
    v16 = sub_2446F5844();
    v25 = sub_2446F5CB8();
    if (os_log_type_enabled(v16, v25))
    {
      v18 = swift_slowAlloc();
      v31 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v18 = 141558275;
      v33 = 1752392040;
      sub_2446F5D00();
      *(_WORD *)(v18 + 12) = 2113;
      v33 = (uint64_t)v15;
      v26 = v14;
      v27 = v15;
      sub_2446F5D00();
      v28 = v31;
      *v31 = v15;

      v14 = v26;
      _os_log_impl(&dword_2446DD000, v16, v25, "Returning now configured platform view controller: %{private,mask.hash}@.", (uint8_t *)v18, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9B40);
      swift_arrayDestroy();
      v21 = v28;
      goto LABEL_10;
    }
LABEL_11:

    v16 = v15;
    goto LABEL_12;
  }

  swift_release_n();
  v14 = *(void **)(v1 + 24);
  if (!*(_QWORD *)(v1 + 32))
    goto LABEL_8;
LABEL_5:
  v15 = v14;
  v16 = sub_2446F5844();
  v17 = sub_2446F5CB8();
  if (!os_log_type_enabled(v16, v17))
    goto LABEL_11;
  v18 = swift_slowAlloc();
  v31 = (_QWORD *)swift_slowAlloc();
  *(_DWORD *)v18 = 141558275;
  v33 = 1752392040;
  sub_2446F5D00();
  *(_WORD *)(v18 + 12) = 2113;
  v33 = (uint64_t)v15;
  v19 = v15;
  sub_2446F5D00();
  v20 = v31;
  *v31 = v15;

  _os_log_impl(&dword_2446DD000, v16, v17, "Returning existing platform view controller: %{private,mask.hash}@.", (uint8_t *)v18, 0x16u);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9B40);
  swift_arrayDestroy();
  v21 = v20;
LABEL_10:
  MEMORY[0x2495161CC](v21, -1, -1);
  MEMORY[0x2495161CC](v18, -1, -1);
LABEL_12:

  sub_2446E6288();
  return v14;
}

__n128 SettingsAnyPlatformViewControllerModel.__allocating_init(recipe:)(__n128 *a1)
{
  uint64_t v2;
  __n128 result;

  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = 0;
  result = *a1;
  *(__n128 *)(v2 + 16) = *a1;
  return result;
}

uint64_t SettingsAnyPlatformViewControllerModel.init(recipe:)(_OWORD *a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = 0;
  *(_OWORD *)(v1 + 16) = *a1;
  return v1;
}

void sub_2446E6288()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (qword_2543F9A20 != -1)
    swift_once();
  v0 = sub_2446F585C();
  __swift_project_value_buffer(v0, (uint64_t)qword_2543FAF48);
  swift_retain_n();
  v1 = sub_2446F5844();
  v2 = sub_2446F5CB8();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = swift_slowAlloc();
    v4 = swift_slowAlloc();
    v7 = v4;
    *(_DWORD *)v3 = 136315394;
    v5 = sub_2446F5E68();
    sub_2446E9108(v5, v6, &v7);
    sub_2446F5D00();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2080;
    sub_2446E9108(0xD00000000000001CLL, 0x80000002446F9BF0, &v7);
    sub_2446F5D00();
    _os_log_impl(&dword_2446DD000, v1, v2, "…Complete (%s.%s)", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v4, -1, -1);
    MEMORY[0x2495161CC](v3, -1, -1);

  }
  else
  {

    swift_release_n();
  }
}

void sub_2446E6468(id *a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  if (*a1)
  {
    v3 = qword_2543F9808;
    v4 = *a1;
    v5 = v4;
    if (v3 != -1)
    {
      swift_once();
      v4 = v5;
    }
    sub_2446F2B60(a2, v4);

  }
}

uint64_t SettingsAnyPlatformViewControllerModel.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t SettingsAnyPlatformViewControllerModel.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();
  return swift_deallocClassInstance();
}

BOOL static SettingsAnyPlatformViewControllerModel.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16);
}

BOOL sub_2446E6554(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(*(_QWORD *)a1 + 16) == *(_QWORD *)(*(_QWORD *)a2 + 16);
}

uint64_t SettingsAnyPlatformViewControllerModel.hash(into:)()
{
  return sub_2446F5E50();
}

uint64_t SettingsAnyPlatformViewControllerModel.hashValue.getter()
{
  sub_2446F5E44();
  sub_2446F5E50();
  return sub_2446F5E5C();
}

uint64_t sub_2446E65D8()
{
  sub_2446F5E44();
  sub_2446F5E50();
  return sub_2446F5E5C();
}

uint64_t sub_2446E661C()
{
  return sub_2446F5E50();
}

uint64_t sub_2446E6648()
{
  sub_2446F5E44();
  sub_2446F5E50();
  return sub_2446F5E5C();
}

unint64_t sub_2446E668C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25737B8E0;
  if (!qword_25737B8E0)
  {
    v1 = type metadata accessor for SettingsAnyPlatformViewControllerModel();
    result = MEMORY[0x249516130](&protocol conformance descriptor for SettingsAnyPlatformViewControllerModel, v1);
    atomic_store(result, (unint64_t *)&qword_25737B8E0);
  }
  return result;
}

uint64_t type metadata accessor for SettingsAnyPlatformViewControllerModel()
{
  return objc_opt_self();
}

uint64_t method lookup function for SettingsAnyPlatformViewControllerModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SettingsAnyPlatformViewControllerModel.__allocating_init(recipe:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

void sub_2446E6704()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  if (qword_2543F9A20 != -1)
    swift_once();
  v0 = sub_2446F585C();
  __swift_project_value_buffer(v0, (uint64_t)qword_2543FAF48);
  swift_retain_n();
  v1 = sub_2446F5844();
  v2 = sub_2446F5CB8();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = swift_slowAlloc();
    v4 = swift_slowAlloc();
    v13 = v4;
    *(_DWORD *)v3 = 136315394;
    v5 = sub_2446F5E68();
    sub_2446E9108(v5, v6, &v13);
    sub_2446F5D00();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2080;
    sub_2446E9108(0xD000000000000037, 0x80000002446F9BB0, &v13);
    sub_2446F5D00();
    _os_log_impl(&dword_2446DD000, v1, v2, "Start (%s.%s)…", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v4, -1, -1);
    MEMORY[0x2495161CC](v3, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  swift_retain_n();
  v7 = sub_2446F5844();
  v8 = sub_2446F5CB8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v10 = swift_slowAlloc();
    v13 = v10;
    *(_DWORD *)v9 = 136315394;
    v11 = sub_2446F5E68();
    sub_2446E9108(v11, v12, &v13);
    sub_2446F5D00();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    sub_2446E9108(0xD000000000000037, 0x80000002446F9BB0, &v13);
    sub_2446F5D00();
    _os_log_impl(&dword_2446DD000, v7, v8, "…Complete (%s.%s)", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v10, -1, -1);
    MEMORY[0x2495161CC](v9, -1, -1);

  }
  else
  {

    swift_release_n();
  }
}

char *keypath_get_selector_parentViewController()
{
  return sel_parentViewController;
}

uint64_t sub_2446E6A58()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_2446E6A7C(id *a1)
{
  uint64_t v1;

  sub_2446E6468(a1, *(void **)(v1 + 16));
}

unint64_t sub_2446E6A84()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2543F9B18;
  if (!qword_2543F9B18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543F9B20);
    result = MEMORY[0x249516130](MEMORY[0x24BDD0230], v1);
    atomic_store(result, (unint64_t *)&qword_2543F9B18);
  }
  return result;
}

void PSViewController.register(_:url:undoAction:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
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
  char *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[24];
  ValueMetadata *v31;
  unint64_t v32;

  v28 = a3;
  v29 = a4;
  v27 = a2;
  v25 = a1;
  v5 = sub_2446F57D8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2446F5754();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_2446F5B80();
  v13 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = &type metadata for SettingsAppFeatureFlags;
  v32 = sub_2446E6D5C();
  v30[0] = 0;
  v16 = sub_2446F5838();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v30);
  if ((v16 & 1) != 0)
  {
    v17 = objc_msgSend(v4, sel_undoManager);
    if (v17)
    {
      v18 = v17;
      swift_getObjectType();
      if (swift_conformsToProtocol2())
        v19 = v18;
      else
        v19 = 0;
      if (v19)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v25, v9);
        (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v27, v5);
        v20 = v18;
        swift_retain();
        sub_2446F5B8C();
        sub_2446F5C7C();

        (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v26);
        return;
      }

    }
    if (qword_25737B620 != -1)
      swift_once();
    v21 = sub_2446F585C();
    __swift_project_value_buffer(v21, (uint64_t)qword_25737C4B0);
    v22 = sub_2446F5844();
    v23 = sub_2446F5C88();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_2446DD000, v22, v23, "UndoManager that for Settings unavailable.", v24, 2u);
      MEMORY[0x2495161CC](v24, -1, -1);
    }

  }
}

unint64_t sub_2446E6D5C()
{
  unint64_t result;

  result = qword_25737B8E8;
  if (!qword_25737B8E8)
  {
    result = MEMORY[0x249516130](&unk_2446F7910, &type metadata for SettingsAppFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_25737B8E8);
  }
  return result;
}

uint64_t sub_2446E6DA0(void *a1, uint64_t a2, void *a3, uint64_t a4, const void *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD v21[4];

  v8 = sub_2446F5754();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2446F57D8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a5);
  sub_2446F57B4();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v16;
  v21[3] = sub_2446E29DC();
  v21[0] = a3;
  v18 = a3;
  v19 = a1;
  sub_2446F5748();
  PSViewController.register(_:url:undoAction:)((uint64_t)v11, (uint64_t)v15, (uint64_t)sub_2446E6F30, v17);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t sub_2446E6F0C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_2446E6F30()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t ResetSettingsNavigationStateAction.init(namespace:onReset:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(_QWORD *)a5 = a3;
  *(_QWORD *)(a5 + 8) = a4;
  *(_QWORD *)(a5 + 16) = result;
  *(_BYTE *)(a5 + 24) = a2 & 1;
  return result;
}

uint64_t sub_2446E6F50@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v1 = qword_25737B8F0;
  v2 = byte_25737B908;
  *(_QWORD *)a1 = qword_25737B8F0;
  *(_OWORD *)(a1 + 8) = unk_25737B8F8;
  *(_BYTE *)(a1 + 24) = v2;
  return sub_2446E7080(v1);
}

uint64_t sub_2446E6F78()
{
  sub_2446E7A64();
  return sub_2446F58EC();
}

uint64_t sub_2446E6FC8()
{
  qword_2543F9958 = qword_25737B8F0;
  unk_2543F9960 = *(_OWORD *)&qword_25737B8F8;
  byte_2543F9970 = byte_25737B908;
  return sub_2446E7080(qword_25737B8F0);
}

uint64_t static ResetSettingsNavigationStateActionTrait.defaultValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;

  if (qword_2543F9978 != -1)
    swift_once();
  swift_beginAccess();
  v2 = qword_2543F9958;
  v3 = byte_2543F9970;
  *(_QWORD *)a1 = qword_2543F9958;
  *(_OWORD *)(a1 + 8) = unk_2543F9960;
  *(_BYTE *)(a1 + 24) = v3;
  return sub_2446E7080(v2);
}

uint64_t sub_2446E7080(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t static ResetSettingsNavigationStateActionTrait.defaultValue.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;

  v1 = *(_QWORD *)a1;
  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_BYTE *)(a1 + 24);
  if (qword_2543F9978 != -1)
    swift_once();
  swift_beginAccess();
  v5 = qword_2543F9958;
  qword_2543F9958 = v1;
  unk_2543F9960 = v2;
  qword_2543F9968 = v3;
  byte_2543F9970 = v4;
  return sub_2446E7124(v5);
}

uint64_t sub_2446E7124(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t (*static ResetSettingsNavigationStateActionTrait.defaultValue.modify())()
{
  if (qword_2543F9978 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2446E71A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;

  if (qword_2543F9978 != -1)
    swift_once();
  swift_beginAccess();
  v2 = qword_2543F9958;
  v3 = byte_2543F9970;
  *(_QWORD *)a1 = qword_2543F9958;
  *(_OWORD *)(a1 + 8) = unk_2543F9960;
  *(_BYTE *)(a1 + 24) = v3;
  return sub_2446E7080(v2);
}

uint64_t EnvironmentValues.resetSettingsNavigationState.getter()
{
  sub_2446E725C();
  return sub_2446F5988();
}

unint64_t sub_2446E725C()
{
  unint64_t result;

  result = qword_2543F98E0;
  if (!qword_2543F98E0)
  {
    result = MEMORY[0x249516130](&unk_2446F70B0, &type metadata for ResetSettingsNavigationStateActionKey);
    atomic_store(result, (unint64_t *)&qword_2543F98E0);
  }
  return result;
}

double sub_2446E72A0@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  uint64_t v4;
  char v5;

  sub_2446E725C();
  sub_2446F5988();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_2446E72FC(uint64_t *a1)
{
  sub_2446E7080(*a1);
  sub_2446E725C();
  return sub_2446F5994();
}

uint64_t View.resetSettingsNavigationStateAction(_:)()
{
  swift_getKeyPath();
  sub_2446F5ACC();
  return swift_release();
}

uint64_t sub_2446E73F8()
{
  sub_2446E7498();
  return sub_2446F5880();
}

uint64_t UITraitCollection.resetSettingsNavigationState.getter()
{
  sub_2446E7498();
  return sub_2446F5CD0();
}

unint64_t sub_2446E7498()
{
  unint64_t result;

  result = qword_2543F9980;
  if (!qword_2543F9980)
  {
    result = MEMORY[0x249516130](&protocol conformance descriptor for ResetSettingsNavigationStateActionTrait, &type metadata for ResetSettingsNavigationStateActionTrait);
    atomic_store(result, (unint64_t *)&qword_2543F9980);
  }
  return result;
}

uint64_t sub_2446E74DC()
{
  sub_2446E7498();
  return sub_2446F5CD0();
}

uint64_t sub_2446E7518(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  __swift_mutable_project_boxed_opaque_existential_1(a1, *(_QWORD *)(a1 + 24));
  sub_2446E7080(v2);
  return sub_2446E73F8();
}

Swift::Void __swiftcall ResetSettingsNavigationStateAction.callAsFunction()()
{
  void (**v0)(uint64_t);
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  NSObject *oslog;

  v1 = *v0;
  if (*v0)
  {
    v2 = swift_retain();
    v1(v2);
    sub_2446E7124((uint64_t)v1);
  }
  else
  {
    if (qword_25737B628 != -1)
      swift_once();
    v3 = sub_2446F585C();
    __swift_project_value_buffer(v3, (uint64_t)qword_25737C4C8);
    oslog = sub_2446F5844();
    v4 = sub_2446F5CAC();
    if (os_log_type_enabled(oslog, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2446DD000, oslog, v4, "Attempting to reset settings navigation state when there is no reset action set.", v5, 2u);
      MEMORY[0x2495161CC](v5, -1, -1);
    }

  }
}

uint64_t static ResetSettingsNavigationStateAction.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v2;
  unsigned int v3;

  v2 = *(unsigned __int8 *)(a1 + 24);
  v3 = *(unsigned __int8 *)(a2 + 24);
  if ((v2 & 1) != 0 || (v3 & 1) != 0)
    return v2 & v3;
  else
    return sub_2446F5B68();
}

uint64_t sub_2446E76B8(uint64_t a1, uint64_t a2)
{
  int v2;
  unsigned int v3;

  v2 = *(unsigned __int8 *)(a1 + 24);
  v3 = *(unsigned __int8 *)(a2 + 24);
  if ((v2 & 1) != 0 || (v3 & 1) != 0)
    return v2 & v3;
  else
    return sub_2446F5B68();
}

ValueMetadata *type metadata accessor for ResetSettingsNavigationStateActionTrait()
{
  return &type metadata for ResetSettingsNavigationStateActionTrait;
}

uint64_t initializeBufferWithCopyOfBuffer for ResetSettingsNavigationStateAction(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

_QWORD *destroy for ResetSettingsNavigationStateAction(_QWORD *result)
{
  if (*result)
    return (_QWORD *)swift_release();
  return result;
}

uint64_t initializeWithCopy for ResetSettingsNavigationStateAction(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (*(_QWORD *)a2)
  {
    v4 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t assignWithCopy for ResetSettingsNavigationStateAction(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *a2;
  if (!*(_QWORD *)a1)
  {
    if (v4)
    {
      v6 = a2[1];
      *(_QWORD *)a1 = v4;
      *(_QWORD *)(a1 + 8) = v6;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = a2[1];
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  swift_retain();
  swift_release();
LABEL_8:
  v7 = a2[2];
  *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
  *(_QWORD *)(a1 + 16) = v7;
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ResetSettingsNavigationStateAction(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *a2;
  if (!*(_QWORD *)a1)
  {
    if (v4)
    {
      v6 = a2[1];
      *(_QWORD *)a1 = v4;
      *(_QWORD *)(a1 + 8) = v6;
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = a2[1];
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  swift_release();
LABEL_8:
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for ResetSettingsNavigationStateAction(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 25))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ResetSettingsNavigationStateAction(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ResetSettingsNavigationStateAction()
{
  return &type metadata for ResetSettingsNavigationStateAction;
}

uint64_t sub_2446E7960(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543F9A80);
  v2 = sub_2446F5934();
  v4[0] = v1;
  v4[1] = sub_2446E79C0();
  return MEMORY[0x249516130](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_2446E79C0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2543F9A78;
  if (!qword_2543F9A78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543F9A80);
    result = MEMORY[0x249516130](MEMORY[0x24BDF1028], v1);
    atomic_store(result, (unint64_t *)&qword_2543F9A78);
  }
  return result;
}

ValueMetadata *type metadata accessor for ResetSettingsNavigationStateActionKey()
{
  return &type metadata for ResetSettingsNavigationStateActionKey;
}

unint64_t sub_2446E7A20()
{
  unint64_t result;

  result = qword_2543F98D8;
  if (!qword_2543F98D8)
  {
    result = MEMORY[0x249516130](&unk_2446F7078, &type metadata for ResetSettingsNavigationStateActionKey);
    atomic_store(result, (unint64_t *)&qword_2543F98D8);
  }
  return result;
}

unint64_t sub_2446E7A64()
{
  unint64_t result;

  result = qword_2543F9850;
  if (!qword_2543F9850)
  {
    result = MEMORY[0x249516130](&protocol conformance descriptor for ResetSettingsNavigationStateAction, &type metadata for ResetSettingsNavigationStateAction);
    atomic_store(result, (unint64_t *)&qword_2543F9850);
  }
  return result;
}

uint64_t PreferencesControllerView.init(preferencesControllerRepresentableModel:)@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  type metadata accessor for PreferencesControllerRepresentableModel();
  result = sub_2446F5B20();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t PreferencesControllerView.init(preferencesControllerRecipe:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  uint64_t v8;
  _QWORD v9[4];

  v4 = type metadata accessor for PreferencesControllerRecipe(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2446E7BAC(a1, (uint64_t)v6);
  type metadata accessor for PreferencesControllerRepresentableModel();
  swift_allocObject();
  v9[1] = PreferencesControllerRepresentableModel.init(recipe:)((uint64_t)v6);
  sub_2446F5B20();
  result = sub_2446E7D50(a1);
  v8 = v9[3];
  *a2 = v9[2];
  a2[1] = v8;
  return result;
}

uint64_t sub_2446E7BAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PreferencesControllerRecipe(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t PreferencesControllerView.body.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9A90);
  sub_2446F5B2C();
  sub_2446F5940();
  sub_2446F5A84();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543F9A30);
  sub_2446E7D8C();
  sub_2446E7E3C();
  sub_2446F5AE4();
  return swift_release();
}

uint64_t sub_2446E7CA0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9A90);
  sub_2446F5B2C();
  sub_2446F5940();
  sub_2446F5A84();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543F9A30);
  sub_2446E7D8C();
  sub_2446E7E3C();
  sub_2446F5AE4();
  return swift_release();
}

uint64_t sub_2446E7D50(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PreferencesControllerRecipe(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2446E7D8C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2543F9A28;
  if (!qword_2543F9A28)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2543F9A30);
    v2[0] = sub_2446E7DF8();
    v2[1] = MEMORY[0x24BDF1050];
    result = MEMORY[0x249516130](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2543F9A28);
  }
  return result;
}

unint64_t sub_2446E7DF8()
{
  unint64_t result;

  result = qword_2543F97A0;
  if (!qword_2543F97A0)
  {
    result = MEMORY[0x249516130](&unk_2446F7828, &type metadata for PreferencesControllerRepresentable);
    atomic_store(result, (unint64_t *)&qword_2543F97A0);
  }
  return result;
}

unint64_t sub_2446E7E3C()
{
  unint64_t result;

  result = qword_2543F9750;
  if (!qword_2543F9750)
  {
    result = MEMORY[0x249516130](&unk_2446F64EC, &type metadata for UINavigationItemProxyNavigationItemAdaptor);
    atomic_store(result, (unint64_t *)&qword_2543F9750);
  }
  return result;
}

uint64_t sub_2446E7E80()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for PreferencesControllerView()
{
  swift_release();
  return swift_release();
}

_QWORD *_s19PreferencesExtended25PreferencesControllerViewVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for PreferencesControllerView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for PreferencesControllerView(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PreferencesControllerView(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PreferencesControllerView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PreferencesControllerView()
{
  return &type metadata for PreferencesControllerView;
}

uint64_t sub_2446E801C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2543F9A30);
  sub_2446E7D8C();
  sub_2446E7E3C();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2446E807C()
{
  uint64_t appended;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t, uint64_t, uint64_t);
  char *v9;
  uint64_t v11;

  appended = type metadata accessor for AppendSettingsNavigationPathAction();
  MEMORY[0x24BDAC7A8](appended);
  v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AA0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(appended, qword_2543F98A0);
  v6 = __swift_project_value_buffer(appended, (uint64_t)qword_2543F98A0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9A98);
  v8 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
  v8(v5, 1, 1, v7);
  v8(v2, 1, 1, v7);
  v9 = &v2[*(int *)(appended + 20)];
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  sub_2446E32B4((uint64_t)v5, (uint64_t)v2);
  return sub_2446E99B0((uint64_t)v2, v6);
}

uint64_t AppendSettingsNavigationPathAction.init(namespace:navigationPath:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9A98);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(a4, 1, 1, v8);
  v9 = a4 + *(int *)(type metadata accessor for AppendSettingsNavigationPathAction() + 20);
  *(_QWORD *)v9 = a1;
  *(_BYTE *)(v9 + 8) = a2 & 1;
  return sub_2446E32B4(a3, a4);
}

uint64_t type metadata accessor for AppendSettingsNavigationPathAction()
{
  uint64_t result;

  result = qword_2543F9840;
  if (!qword_2543F9840)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2446E8268@<X0>(uint64_t a1@<X8>)
{
  uint64_t appended;
  uint64_t v3;

  if (qword_2543F98C0 != -1)
    swift_once();
  appended = type metadata accessor for AppendSettingsNavigationPathAction();
  v3 = __swift_project_value_buffer(appended, (uint64_t)qword_2543F98A0);
  return sub_2446E8414(v3, a1);
}

uint64_t sub_2446E82C4()
{
  sub_2446E9968();
  return sub_2446F58EC();
}

uint64_t sub_2446E8314()
{
  uint64_t appended;
  uint64_t v1;
  uint64_t v2;

  appended = type metadata accessor for AppendSettingsNavigationPathAction();
  __swift_allocate_value_buffer(appended, qword_2543F9930);
  v1 = __swift_project_value_buffer(appended, (uint64_t)qword_2543F9930);
  if (qword_2543F98C0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(appended, (uint64_t)qword_2543F98A0);
  return sub_2446E8414(v2, v1);
}

uint64_t static AppendSettingsNavigationPathActionTrait.defaultValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t appended;
  uint64_t v3;

  if (qword_2543F9948 != -1)
    swift_once();
  appended = type metadata accessor for AppendSettingsNavigationPathAction();
  v3 = __swift_project_value_buffer(appended, (uint64_t)qword_2543F9930);
  swift_beginAccess();
  return sub_2446E8414(v3, a1);
}

uint64_t sub_2446E8414(uint64_t a1, uint64_t a2)
{
  uint64_t appended;

  appended = type metadata accessor for AppendSettingsNavigationPathAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(appended - 8) + 16))(a2, a1, appended);
  return a2;
}

uint64_t static AppendSettingsNavigationPathActionTrait.defaultValue.setter(uint64_t a1)
{
  uint64_t appended;
  uint64_t v3;

  if (qword_2543F9948 != -1)
    swift_once();
  appended = type metadata accessor for AppendSettingsNavigationPathAction();
  v3 = __swift_project_value_buffer(appended, (uint64_t)qword_2543F9930);
  swift_beginAccess();
  sub_2446E84E8(a1, v3);
  swift_endAccess();
  return sub_2446E852C(a1);
}

uint64_t sub_2446E84E8(uint64_t a1, uint64_t a2)
{
  uint64_t appended;

  appended = type metadata accessor for AppendSettingsNavigationPathAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(appended - 8) + 24))(a2, a1, appended);
  return a2;
}

uint64_t sub_2446E852C(uint64_t a1)
{
  uint64_t appended;

  appended = type metadata accessor for AppendSettingsNavigationPathAction();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(appended - 8) + 8))(a1, appended);
  return a1;
}

uint64_t (*static AppendSettingsNavigationPathActionTrait.defaultValue.modify())()
{
  uint64_t appended;

  if (qword_2543F9948 != -1)
    swift_once();
  appended = type metadata accessor for AppendSettingsNavigationPathAction();
  __swift_project_value_buffer(appended, (uint64_t)qword_2543F9930);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2446E85E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t appended;
  uint64_t v3;

  if (qword_2543F9948 != -1)
    swift_once();
  appended = type metadata accessor for AppendSettingsNavigationPathAction();
  v3 = __swift_project_value_buffer(appended, (uint64_t)qword_2543F9930);
  swift_beginAccess();
  return sub_2446E8414(v3, a1);
}

uint64_t EnvironmentValues.appendSettingsNavigationPath.getter()
{
  sub_2446E8694();
  return sub_2446F5988();
}

unint64_t sub_2446E8694()
{
  unint64_t result;

  result = qword_2543F98D0;
  if (!qword_2543F98D0)
  {
    result = MEMORY[0x249516130](&unk_2446F7300, &type metadata for AppendSettingsNavigationPathActionKey);
    atomic_store(result, (unint64_t *)&qword_2543F98D0);
  }
  return result;
}

uint64_t sub_2446E86D8()
{
  sub_2446E8694();
  return sub_2446F5988();
}

uint64_t sub_2446E8714(uint64_t a1)
{
  uint64_t appended;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  appended = type metadata accessor for AppendSettingsNavigationPathAction();
  v3 = MEMORY[0x24BDAC7A8](appended);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v9 - v6;
  sub_2446E8414(a1, (uint64_t)&v9 - v6);
  sub_2446E8414((uint64_t)v7, (uint64_t)v5);
  sub_2446E8694();
  sub_2446F5994();
  return sub_2446E852C((uint64_t)v7);
}

uint64_t View.appendSettingsNavigationPathAction(_:)()
{
  swift_getKeyPath();
  sub_2446F5ACC();
  return swift_release();
}

uint64_t sub_2446E882C()
{
  sub_2446E8694();
  return sub_2446F5988();
}

uint64_t UITraitCollection.appendSettingsNavigationPath.getter()
{
  sub_2446E88A0();
  return sub_2446F5CD0();
}

unint64_t sub_2446E88A0()
{
  unint64_t result;

  result = qword_2543F9950;
  if (!qword_2543F9950)
  {
    result = MEMORY[0x249516130](&protocol conformance descriptor for AppendSettingsNavigationPathActionTrait, &type metadata for AppendSettingsNavigationPathActionTrait);
    atomic_store(result, (unint64_t *)&qword_2543F9950);
  }
  return result;
}

uint64_t sub_2446E88E4(uint64_t a1)
{
  uint64_t appended;
  uint64_t v3;
  uint64_t v5;

  appended = type metadata accessor for AppendSettingsNavigationPathAction();
  MEMORY[0x24BDAC7A8](appended);
  sub_2446E8414(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2446E88A0();
  sub_2446F5880();
  return sub_2446E852C(a1);
}

uint64_t sub_2446E8988()
{
  sub_2446E88A0();
  return sub_2446F5CD0();
}

uint64_t sub_2446E89C4(uint64_t a1, uint64_t a2)
{
  uint64_t appended;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  appended = type metadata accessor for AppendSettingsNavigationPathAction();
  MEMORY[0x24BDAC7A8](appended);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2446E8414(a2, (uint64_t)v6);
  __swift_mutable_project_boxed_opaque_existential_1(a1, *(_QWORD *)(a1 + 24));
  return sub_2446E88E4((uint64_t)v6);
}

void AppendSettingsNavigationPathAction.callAsFunction<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
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
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _QWORD v24[3];
  uint64_t v25;

  v24[1] = a3;
  v6 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2446F5928();
  MEMORY[0x24BDAC7A8](v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AA0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9A98);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2446E3D28(v3, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_2446E3E44((uint64_t)v12, &qword_2543F9AA0);
    if (qword_25737B628 != -1)
      swift_once();
    v17 = sub_2446F585C();
    __swift_project_value_buffer(v17, (uint64_t)qword_25737C4C8);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
    v18 = sub_2446F5844();
    v19 = sub_2446F5CAC();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v25 = v21;
      *(_DWORD *)v20 = 136315138;
      swift_getDynamicType();
      v22 = sub_2446F5E68();
      v24[2] = sub_2446E9108(v22, v23, &v25);
      sub_2446F5D00();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, a2);
      swift_arrayDestroy();
      MEMORY[0x2495161CC](v21, -1, -1);
      MEMORY[0x2495161CC](v20, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, a2);
    }

  }
  else
  {
    sub_2446E3DFC((uint64_t)v12, (uint64_t)v16);
    MEMORY[0x2495159F8](v13);
    sub_2446F58F8();
    sub_2446F5B50();
    sub_2446E3E44((uint64_t)v16, &qword_2543F9A98);
  }
}

void AppendSettingsNavigationPathAction.callAsFunction<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  _QWORD v26[5];
  uint64_t v27;

  v26[2] = a4;
  v26[3] = a5;
  v26[1] = a3;
  v8 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2446F5928();
  MEMORY[0x24BDAC7A8](v11);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AA0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9A98);
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2446E3D28(v5, (uint64_t)v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_2446E3E44((uint64_t)v14, &qword_2543F9AA0);
    if (qword_25737B628 != -1)
      swift_once();
    v19 = sub_2446F585C();
    __swift_project_value_buffer(v19, (uint64_t)qword_25737C4C8);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, a2);
    v20 = sub_2446F5844();
    v21 = sub_2446F5CAC();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = swift_slowAlloc();
      v27 = v23;
      *(_DWORD *)v22 = 136315138;
      swift_getDynamicType();
      v24 = sub_2446F5E68();
      v26[4] = sub_2446E9108(v24, v25, &v27);
      sub_2446F5D00();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, a2);
      swift_arrayDestroy();
      MEMORY[0x2495161CC](v23, -1, -1);
      MEMORY[0x2495161CC](v22, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, a2);
    }

  }
  else
  {
    sub_2446E3DFC((uint64_t)v14, (uint64_t)v18);
    MEMORY[0x2495159F8](v15);
    sub_2446F5904();
    sub_2446F5B50();
    sub_2446E3E44((uint64_t)v18, &qword_2543F9A98);
  }
}

uint64_t static AppendSettingsNavigationPathAction.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  unsigned int v6;

  v4 = *(int *)(type metadata accessor for AppendSettingsNavigationPathAction() + 20);
  v5 = *(unsigned __int8 *)(a1 + v4 + 8);
  v6 = *(unsigned __int8 *)(a2 + v4 + 8);
  if ((v5 & 1) != 0 || (v6 & 1) != 0)
    return v5 & v6;
  else
    return sub_2446F5B68();
}

uint64_t sub_2446E9108(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2446E91D8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2446E2A34((uint64_t)v12, *a3);
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
      sub_2446E2A34((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2446E91D8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2446F5D0C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2446E9390(a5, a6);
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
  v8 = sub_2446F5D84();
  if (!v8)
  {
    sub_2446F5D9C();
    __break(1u);
LABEL_17:
    result = sub_2446F5DD8();
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

uint64_t sub_2446E9390(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2446E9424(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2446E95FC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2446E95FC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2446E9424(uint64_t a1, unint64_t a2)
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
      v3 = sub_2446E9598(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2446F5D6C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2446F5D9C();
      __break(1u);
LABEL_10:
      v2 = sub_2446F5C1C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2446F5DD8();
    __break(1u);
LABEL_14:
    result = sub_2446F5D9C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2446E9598(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9B60);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2446E95FC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9B60);
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
  result = sub_2446F5DD8();
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for AppendSettingsNavigationPathActionTrait()
{
  return &type metadata for AppendSettingsNavigationPathActionTrait;
}

uint64_t getEnumTagSinglePayload for AppendSettingsNavigationPathAction()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2446E9764(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AA0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for AppendSettingsNavigationPathAction()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2446E97B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AA0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

void sub_2446E97F4()
{
  unint64_t v0;

  sub_2446E46AC();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_2446E9864(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543F9A70);
  v2 = sub_2446F5934();
  v4[0] = v1;
  v4[1] = sub_2446E98C4();
  return MEMORY[0x249516130](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_2446E98C4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2543F9A68;
  if (!qword_2543F9A68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543F9A70);
    result = MEMORY[0x249516130](MEMORY[0x24BDF1028], v1);
    atomic_store(result, (unint64_t *)&qword_2543F9A68);
  }
  return result;
}

ValueMetadata *type metadata accessor for AppendSettingsNavigationPathActionKey()
{
  return &type metadata for AppendSettingsNavigationPathActionKey;
}

unint64_t sub_2446E9924()
{
  unint64_t result;

  result = qword_2543F98C8;
  if (!qword_2543F98C8)
  {
    result = MEMORY[0x249516130](&unk_2446F72C8, &type metadata for AppendSettingsNavigationPathActionKey);
    atomic_store(result, (unint64_t *)&qword_2543F98C8);
  }
  return result;
}

unint64_t sub_2446E9968()
{
  unint64_t result;
  uint64_t appended;

  result = qword_2543F9838;
  if (!qword_2543F9838)
  {
    appended = type metadata accessor for AppendSettingsNavigationPathAction();
    result = MEMORY[0x249516130](&protocol conformance descriptor for AppendSettingsNavigationPathAction, appended);
    atomic_store(result, (unint64_t *)&qword_2543F9838);
  }
  return result;
}

uint64_t sub_2446E99B0(uint64_t a1, uint64_t a2)
{
  uint64_t appended;

  appended = type metadata accessor for AppendSettingsNavigationPathAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(appended - 8) + 32))(a2, a1, appended);
  return a2;
}

uint64_t SettingsAnyPlatformViewControllerView.init(platformViewControllerModel:)@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  type metadata accessor for SettingsAnyPlatformViewControllerModel();
  result = sub_2446F5B20();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t SettingsAnyPlatformViewControllerView.init(platformViewControllerRecipe:)@<X0>(_OWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  type metadata accessor for SettingsAnyPlatformViewControllerModel();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 32) = 0;
  *(_OWORD *)(v4 + 16) = *a1;
  result = sub_2446F5B20();
  *a2 = v6;
  a2[1] = v7;
  return result;
}

uint64_t SettingsAnyPlatformViewControllerView.body.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25737B910);
  sub_2446F5B2C();
  sub_2446F5940();
  sub_2446F5A84();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25737B918);
  sub_2446E9B5C();
  sub_2446E7E3C();
  sub_2446F5AE4();
  return swift_release();
}

unint64_t sub_2446E9B5C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25737B920;
  if (!qword_25737B920)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25737B918);
    v2[0] = sub_2446E23E0();
    v2[1] = MEMORY[0x24BDF1050];
    result = MEMORY[0x249516130](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25737B920);
  }
  return result;
}

uint64_t sub_2446E9BC8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2446E9BD8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25737B910);
  sub_2446F5B2C();
  sub_2446F5940();
  sub_2446F5A84();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25737B918);
  sub_2446E9B5C();
  sub_2446E7E3C();
  sub_2446F5AE4();
  return swift_release();
}

ValueMetadata *type metadata accessor for SettingsAnyPlatformViewControllerView()
{
  return &type metadata for SettingsAnyPlatformViewControllerView;
}

uint64_t sub_2446E9C98()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25737B918);
  sub_2446E9B5C();
  sub_2446E7E3C();
  return swift_getOpaqueTypeConformance2();
}

id sub_2446E9CF8@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_parentViewController);
  *a2 = result;
  return result;
}

uint64_t PreferencesControllerRepresentableModel.__allocating_init(recipe:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  PreferencesControllerRepresentableModel.init(recipe:)(a1);
  return v2;
}

uint64_t PreferencesControllerRepresentableModel.recipe.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  swift_getKeyPath();
  sub_2446EDC08(&qword_2543F97E0, (uint64_t)&protocol conformance descriptor for PreferencesControllerRepresentableModel);
  sub_2446F5814();
  swift_release();
  v3 = v1 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel__recipe;
  swift_beginAccess();
  return sub_2446EE2FC(v3, a1, type metadata accessor for PreferencesControllerRecipe);
}

uint64_t sub_2446E9E1C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_2446EDC08(&qword_2543F97E0, (uint64_t)&protocol conformance descriptor for PreferencesControllerRepresentableModel);
  sub_2446F5814();
  swift_release();
  v4 = v3 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel__recipe;
  swift_beginAccess();
  return sub_2446EE2FC(v4, a2, type metadata accessor for PreferencesControllerRecipe);
}

uint64_t sub_2446E9ECC(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE v9[16];
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;

  v4 = type metadata accessor for PreferencesControllerRecipe(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2446EE2FC(a1, (uint64_t)v6, type metadata accessor for PreferencesControllerRecipe);
  v7 = *a2;
  swift_getKeyPath();
  v10 = v7;
  v11 = v6;
  v12 = v7;
  sub_2446EDC08(&qword_2543F97E0, (uint64_t)&protocol conformance descriptor for PreferencesControllerRepresentableModel);
  sub_2446F5808();
  swift_release();
  return sub_2446EE340((uint64_t)v6, type metadata accessor for PreferencesControllerRecipe);
}

uint64_t sub_2446E9FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a1 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel__recipe;
  swift_beginAccess();
  sub_2446EE454(a2, v3);
  return swift_endAccess();
}

uint64_t PreferencesControllerRepresentableModel.init(recipe:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _BYTE v21[12];
  int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;

  v2 = v1;
  v4 = type metadata accessor for PreferencesControllerRecipe(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = &v21[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v9 = &v21[-v8];
  *(_QWORD *)(v1 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel_preferencesController) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel_cancellable) = 0;
  sub_2446F5820();
  if (qword_2543F9A20 != -1)
    swift_once();
  v10 = sub_2446F585C();
  __swift_project_value_buffer(v10, (uint64_t)qword_2543FAF48);
  sub_2446EE2FC(a1, (uint64_t)v9, type metadata accessor for PreferencesControllerRecipe);
  swift_retain_n();
  v11 = sub_2446F5844();
  v12 = sub_2446F5C94();
  v13 = v12;
  if (os_log_type_enabled(v11, v12))
  {
    v14 = swift_slowAlloc();
    v23 = swift_slowAlloc();
    v26 = v23;
    *(_DWORD *)v14 = 136315907;
    v22 = v13;
    v15 = sub_2446F5E68();
    v24 = sub_2446E9108(v15, v16, &v26);
    sub_2446F5D00();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    v24 = sub_2446E9108(0x6365722874696E69, 0xED0000293A657069, &v26);
    sub_2446F5D00();
    *(_WORD *)(v14 + 22) = 2160;
    v24 = 1752392040;
    sub_2446F5D00();
    *(_WORD *)(v14 + 32) = 2081;
    sub_2446EE2FC((uint64_t)v9, (uint64_t)v7, type metadata accessor for PreferencesControllerRecipe);
    v24 = 0xD00000000000001DLL;
    v25 = 0x80000002446F9E40;
    sub_2446EE588();
    sub_2446F5C10();
    swift_bridgeObjectRelease();
    v17 = v24;
    v18 = v25;
    sub_2446EE340((uint64_t)v7, type metadata accessor for PreferencesControllerRecipe);
    v24 = sub_2446E9108(v17, v18, &v26);
    sub_2446F5D00();
    swift_bridgeObjectRelease();
    sub_2446EE340((uint64_t)v9, type metadata accessor for PreferencesControllerRecipe);
    _os_log_impl(&dword_2446DD000, v11, (os_log_type_t)v22, "Start (%s.%s) recipe: %{private,mask.hash}s…", (uint8_t *)v14, 0x2Au);
    v19 = v23;
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v19, -1, -1);
    MEMORY[0x2495161CC](v14, -1, -1);
  }
  else
  {
    swift_release_n();
    sub_2446EE340((uint64_t)v9, type metadata accessor for PreferencesControllerRecipe);
  }

  sub_2446EE2FC(a1, v2 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel__recipe, type metadata accessor for PreferencesControllerRecipe);
  sub_2446EA41C(v2, a1);
  sub_2446EE340(a1, type metadata accessor for PreferencesControllerRecipe);
  return v2;
}

uint64_t type metadata accessor for PreferencesControllerRepresentableModel()
{
  uint64_t result;

  result = qword_2543F97E8;
  if (!qword_2543F97E8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2446EA41C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;

  v3 = type metadata accessor for PreferencesControllerRecipe(0);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v18 - v7;
  if (qword_2543F9A20 != -1)
    swift_once();
  v9 = sub_2446F585C();
  __swift_project_value_buffer(v9, (uint64_t)qword_2543FAF48);
  sub_2446EE2FC(a2, (uint64_t)v8, type metadata accessor for PreferencesControllerRecipe);
  swift_retain_n();
  v10 = sub_2446F5844();
  v11 = sub_2446F5C94();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    v13 = swift_slowAlloc();
    v21 = v13;
    *(_DWORD *)v12 = 136315907;
    v14 = sub_2446F5E68();
    v19 = sub_2446E9108(v14, v15, &v21);
    sub_2446F5D00();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    v19 = sub_2446E9108(0x6365722874696E69, 0xED0000293A657069, &v21);
    sub_2446F5D00();
    *(_WORD *)(v12 + 22) = 2160;
    v19 = 1752392040;
    sub_2446F5D00();
    *(_WORD *)(v12 + 32) = 2081;
    sub_2446EE2FC((uint64_t)v8, (uint64_t)v6, type metadata accessor for PreferencesControllerRecipe);
    v19 = 0xD00000000000001DLL;
    v20 = 0x80000002446F9E40;
    sub_2446EE588();
    sub_2446F5C10();
    swift_bridgeObjectRelease();
    v16 = v19;
    v17 = v20;
    sub_2446EE340((uint64_t)v6, type metadata accessor for PreferencesControllerRecipe);
    v19 = sub_2446E9108(v16, v17, &v21);
    sub_2446F5D00();
    swift_bridgeObjectRelease();
    sub_2446EE340((uint64_t)v8, type metadata accessor for PreferencesControllerRecipe);
    _os_log_impl(&dword_2446DD000, v10, v11, "…Complete (%s.%s) recipe: %{private,mask.hash}s", (uint8_t *)v12, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v13, -1, -1);
    MEMORY[0x2495161CC](v12, -1, -1);
  }
  else
  {
    swift_release_n();
    sub_2446EE340((uint64_t)v8, type metadata accessor for PreferencesControllerRecipe);
  }

}

void sub_2446EA758()
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
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  _QWORD v24[8];
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v1 = v0;
  v27 = *MEMORY[0x24BDAC8D0];
  v2 = type metadata accessor for NSBundle.PreferencesPluginLocation();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v24[5] = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v24[7] = (char *)v24 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v7 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2543F9A20 != -1)
    swift_once();
  v10 = sub_2446F585C();
  v11 = __swift_project_value_buffer(v10, (uint64_t)qword_2543FAF48);
  swift_retain_n();
  v12 = sub_2446F5844();
  v13 = sub_2446F5CB8();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v24[4] = v7;
    v15 = v1;
    v16 = v14;
    v17 = swift_slowAlloc();
    v24[6] = v11;
    v18 = v17;
    *(_QWORD *)&v26 = v17;
    *(_DWORD *)v16 = 136315394;
    v19 = sub_2446F5E68();
    *(_QWORD *)&v25 = sub_2446E9108(v19, v20, (uint64_t *)&v26);
    sub_2446F5D00();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2080;
    *(_QWORD *)&v25 = sub_2446E9108(0xD000000000000014, 0x80000002446F9F20, (uint64_t *)&v26);
    sub_2446F5D00();
    _os_log_impl(&dword_2446DD000, v12, v13, "Start (%s.%s)…", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v18, -1, -1);
    v21 = v16;
    v1 = v15;
    MEMORY[0x2495161CC](v21, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  swift_getKeyPath();
  *(_QWORD *)&v26 = v1;
  sub_2446EDC08(&qword_2543F97E0, (uint64_t)&protocol conformance descriptor for PreferencesControllerRepresentableModel);
  sub_2446F5814();
  swift_release();
  v22 = v1 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel__recipe;
  swift_beginAccess();
  sub_2446EE2FC(v22, (uint64_t)v9, type metadata accessor for PreferencesControllerRecipe.Kind);
  v23 = (char *)&loc_2446EAAA0 + dword_2446EBCF4[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_2446EBD04(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;

  if (qword_2543F9A20 != -1)
    swift_once();
  v3 = sub_2446F585C();
  __swift_project_value_buffer(v3, (uint64_t)qword_2543FAF48);
  swift_retain_n();
  v4 = a2;
  v5 = sub_2446F5844();
  v6 = sub_2446F5CB8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v13 = v9;
    *(_DWORD *)v7 = 136315907;
    v10 = sub_2446F5E68();
    sub_2446E9108(v10, v11, &v13);
    sub_2446F5D00();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    sub_2446E9108(0xD000000000000037, 0x80000002446F9BB0, &v13);
    sub_2446F5D00();
    *(_WORD *)(v7 + 22) = 2160;
    sub_2446F5D00();
    *(_WORD *)(v7 + 32) = 2113;
    v12 = v4;
    sub_2446F5D00();
    *v8 = v4;

    _os_log_impl(&dword_2446DD000, v5, v6, "…Complete (%s.%s), preferencesController: %{private,mask.hash}@", (uint8_t *)v7, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9B40);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v8, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v9, -1, -1);
    MEMORY[0x2495161CC](v7, -1, -1);

  }
  else
  {

    swift_release_n();
  }
}

void sub_2446EBFA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t aBlock[6];

  v4 = v3;
  if (qword_2543F9A20 != -1)
    swift_once();
  v8 = sub_2446F585C();
  __swift_project_value_buffer(v8, (uint64_t)qword_2543FAF48);
  swift_retain_n();
  v9 = sub_2446F5844();
  v10 = sub_2446F5CB8();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v21 = a3;
    v12 = swift_slowAlloc();
    aBlock[0] = v12;
    *(_DWORD *)v11 = 136315394;
    v13 = sub_2446F5E68();
    sub_2446E9108(v13, v14, aBlock);
    sub_2446F5D00();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    sub_2446E9108(0xD00000000000002ALL, 0x80000002446F9EF0, aBlock);
    sub_2446F5D00();
    _os_log_impl(&dword_2446DD000, v9, v10, "Start (%s.%s)…", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    v15 = v12;
    a3 = v21;
    MEMORY[0x2495161CC](v15, -1, -1);
    MEMORY[0x2495161CC](v11, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v16 = PreferencesControllerRepresentableModel.makeViewControllerIfNeeded()();
  v17 = (void *)sub_2446F5BC8();
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = v16;
  v18[3] = a1;
  v18[4] = a2;
  v18[5] = a3;
  v18[6] = v4;
  aBlock[4] = (uint64_t)sub_2446EE218;
  aBlock[5] = (uint64_t)v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2446ED2D0;
  aBlock[3] = (uint64_t)&block_descriptor;
  v19 = _Block_copy(aBlock);
  swift_retain();
  v20 = v16;
  swift_bridgeObjectRetain();
  sub_2446E7080(a2);
  swift_release();
  -[NSObject handleURL:withCompletion:](v20, sel_handleURL_withCompletion_, v17, v19);
  _Block_release(v19);

}

uint64_t sub_2446EC290()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  swift_getKeyPath();
  sub_2446EDC08(&qword_2543F97E0, (uint64_t)&protocol conformance descriptor for PreferencesControllerRepresentableModel);
  sub_2446F5814();
  swift_release();
  swift_beginAccess();
  type metadata accessor for PreferencesControllerRecipe(0);
  swift_unknownObjectWeakAssign();
  v1 = *(void **)(v0
                + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel_preferencesController);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel_preferencesController) = 0;

  v2 = OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel_cancellable;
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel_cancellable))
  {
    swift_retain();
    sub_2446F58C8();
    swift_release();
  }
  *(_QWORD *)(v0 + v2) = 0;
  return swift_release();
}

NSObject *PreferencesControllerRepresentableModel.makeViewControllerIfNeeded()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  char *v25;
  id v26;
  _QWORD *v27;
  uint64_t v28;
  void *v29;
  id v30;
  os_log_type_t v31;
  NSObject *v32;
  _QWORD *v33;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40[3];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9B20);
  v37 = *(_QWORD *)(v2 - 8);
  v38 = (_QWORD *)v2;
  MEMORY[0x24BDAC7A8](v2);
  v36 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2543F9A20 != -1)
    swift_once();
  v4 = sub_2446F585C();
  __swift_project_value_buffer(v4, (uint64_t)qword_2543FAF48);
  swift_retain_n();
  v5 = sub_2446F5844();
  v6 = sub_2446F5CB8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc();
    v8 = swift_slowAlloc();
    v40[0] = v8;
    *(_DWORD *)v7 = 136315394;
    v9 = sub_2446F5E68();
    v39 = sub_2446E9108(v9, v10, v40);
    sub_2446F5D00();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    v39 = sub_2446E9108(0xD00000000000001CLL, 0x80000002446F9BF0, v40);
    sub_2446F5D00();
    _os_log_impl(&dword_2446DD000, v5, v6, "Start (%s.%s)…", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v8, -1, -1);
    MEMORY[0x2495161CC](v7, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v11 = OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel_preferencesController;
  v12 = *(void **)(v0
                 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel_preferencesController);
  if (!v12)
  {
    sub_2446EA758();
    v20 = v19;
    swift_getKeyPath();
    v40[0] = v0;
    sub_2446EDC08(&qword_2543F97E0, (uint64_t)&protocol conformance descriptor for PreferencesControllerRepresentableModel);
    sub_2446F5814();
    swift_release();
    v21 = v0 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel__recipe;
    swift_beginAccess();
    v22 = type metadata accessor for PreferencesControllerRecipe(0);
    swift_unknownObjectWeakAssign();
    objc_opt_self();
    v23 = (void *)swift_dynamicCastObjCClass();
    if (v23)
      objc_msgSend(v23, sel_setUrlHandlingDeferredForViewControllerContainment_, 1);
    swift_getKeyPath();
    v39 = v0;
    sub_2446F5814();
    swift_release();
    if (*(_QWORD *)(v21 + *(int *)(v22 + 32)))
      objc_msgSend(v20, sel_setSpecifier_);
    swift_getKeyPath();
    v24 = v20;
    v25 = v36;
    sub_2446F5760();

    swift_release();
    *(_QWORD *)(swift_allocObject() + 16) = v24;
    sub_2446E6A84();
    v26 = v24;
    v27 = v38;
    v28 = sub_2446F58D4();
    swift_release();
    (*(void (**)(char *, _QWORD *))(v37 + 8))(v25, v27);
    *(_QWORD *)(v1 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel_cancellable) = v28;
    swift_release();
    v29 = *(void **)(v1 + v11);
    *(_QWORD *)(v1 + v11) = v20;
    v30 = v26;

    v13 = v30;
    v14 = sub_2446F5844();
    v31 = sub_2446F5CB8();
    if (os_log_type_enabled(v14, v31))
    {
      v16 = swift_slowAlloc();
      v38 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v16 = 141558275;
      v39 = 1752392040;
      sub_2446F5D00();
      *(_WORD *)(v16 + 12) = 2113;
      v39 = (uint64_t)v13;
      v32 = v13;
      sub_2446F5D00();
      v33 = v38;
      *v38 = v20;

      _os_log_impl(&dword_2446DD000, v14, v31, "Returning lazily created preferences controller: %{private,mask.hash}@.", (uint8_t *)v16, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9B40);
      swift_arrayDestroy();
      v18 = v33;
      goto LABEL_15;
    }
LABEL_16:

    v14 = v13;
    goto LABEL_17;
  }
  v13 = v12;
  v14 = sub_2446F5844();
  v15 = sub_2446F5CB8();
  if (!os_log_type_enabled(v14, v15))
    goto LABEL_16;
  v16 = swift_slowAlloc();
  v17 = (_QWORD *)swift_slowAlloc();
  *(_DWORD *)v16 = 141558275;
  v40[0] = 1752392040;
  sub_2446F5D00();
  *(_WORD *)(v16 + 12) = 2113;
  v40[0] = (uint64_t)v13;
  v13 = v13;
  sub_2446F5D00();
  *v17 = v12;

  _os_log_impl(&dword_2446DD000, v14, v15, "Returning existing preferences controller: %{private,mask.hash}@.", (uint8_t *)v16, 0x16u);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9B40);
  swift_arrayDestroy();
  v18 = v17;
LABEL_15:
  MEMORY[0x2495161CC](v18, -1, -1);
  MEMORY[0x2495161CC](v16, -1, -1);
LABEL_17:

  sub_2446ECA24(v1, 0xD00000000000001CLL, 0x80000002446F9BF0);
  return v13;
}

void sub_2446ECA24(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  if (qword_2543F9A20 != -1)
    swift_once();
  v5 = sub_2446F585C();
  __swift_project_value_buffer(v5, (uint64_t)qword_2543FAF48);
  swift_retain_n();
  v6 = sub_2446F5844();
  v7 = sub_2446F5CB8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = swift_slowAlloc();
    v9 = swift_slowAlloc();
    v12 = v9;
    *(_DWORD *)v8 = 136315394;
    v10 = sub_2446F5E68();
    sub_2446E9108(v10, v11, &v12);
    sub_2446F5D00();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    sub_2446E9108(a2, a3, &v12);
    sub_2446F5D00();
    _os_log_impl(&dword_2446DD000, v6, v7, "…Complete (%s.%s)", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v9, -1, -1);
    MEMORY[0x2495161CC](v8, -1, -1);

  }
  else
  {

    swift_release_n();
  }
}

void sub_2446ECC04(void *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t v9;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  unint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38[5];
  __int128 v39;
  __int128 v40;

  objc_opt_self();
  v6 = swift_dynamicCastObjCClass();
  if (!v6)
  {
LABEL_24:
    v21 = 0x2543F9000;
    if (a3)
      goto LABEL_25;
    goto LABEL_27;
  }
  v7 = (void *)v6;
  v8 = a1;
  sub_2446F5D54();
  if (*(_QWORD *)(a2 + 16) && (v9 = sub_2446F3D58((uint64_t)v38), (v10 & 1) != 0))
  {
    sub_2446E2A34(*(_QWORD *)(a2 + 56) + 32 * v9, (uint64_t)&v39);
  }
  else
  {
    v39 = 0u;
    v40 = 0u;
  }
  sub_2446EE240((uint64_t)v38);
  if (*((_QWORD *)&v40 + 1))
  {
    sub_2446EE3C0(0, (unint64_t *)&unk_25737B958);
    if ((swift_dynamicCast() & 1) == 0)
    {

      v21 = 0x2543F9000;
      if (a3)
        goto LABEL_25;
      goto LABEL_27;
    }
    v11 = objc_msgSend((id)0x68746170, sel_pathComponents);
    v12 = sub_2446F5C34();

    v13 = *(_QWORD *)(v12 + 16);
    swift_bridgeObjectRelease();
    if (v13 != 1)
    {
LABEL_23:

      goto LABEL_24;
    }
    v14 = objc_msgSend((id)0x68746170, sel_pathComponents);
    v15 = sub_2446F5C34();

    if (!*(_QWORD *)(v15 + 16))
    {

      v6 = swift_bridgeObjectRelease();
      v21 = 0x2543F9000uLL;
      if (a3)
        goto LABEL_25;
      goto LABEL_27;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v16 = (void *)sub_2446F5BEC();
    swift_bridgeObjectRelease();
    v17 = (id)SFObjectAndOffsetForURLPair();

    v18 = sub_2446F5BD4();
    sub_2446F5D54();
    if (*(_QWORD *)(v18 + 16) && (v19 = sub_2446F3D58((uint64_t)v38), (v20 & 1) != 0))
    {
      sub_2446E2A34(*(_QWORD *)(v18 + 56) + 32 * v19, (uint64_t)&v39);
    }
    else
    {
      v39 = 0u;
      v40 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_2446EE240((uint64_t)v38);
    if (*((_QWORD *)&v40 + 1))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v22 = (void *)sub_2446F5BEC();
        objc_msgSend(v7, sel__scrollToSpecifierWithID_animated_, v22, 1);

        v23 = (void *)sub_2446F5BEC();
        swift_bridgeObjectRelease();
        objc_msgSend(v7, sel_highlightSpecifierWithID_, v23);

        v21 = 0x2543F9000;
        if (!a3)
          goto LABEL_27;
LABEL_25:
        a3(v6);
        goto LABEL_32;
      }
      goto LABEL_23;
    }

  }
  else
  {

  }
  v6 = sub_2446E3E44((uint64_t)&v39, &qword_25737B888);
  v21 = 0x2543F9000;
  if (a3)
    goto LABEL_25;
LABEL_27:
  if (*(_QWORD *)(v21 + 2592) != -1)
    swift_once();
  v24 = sub_2446F585C();
  __swift_project_value_buffer(v24, (uint64_t)qword_2543FAF48);
  swift_retain_n();
  v25 = sub_2446F5844();
  v26 = sub_2446F5CAC();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = swift_slowAlloc();
    v28 = swift_slowAlloc();
    v38[0] = v28;
    *(_DWORD *)v27 = 136315394;
    v29 = sub_2446F5E68();
    *(_QWORD *)&v39 = sub_2446E9108(v29, v30, v38);
    sub_2446F5D00();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 12) = 2080;
    *(_QWORD *)&v39 = sub_2446E9108(0xD00000000000002ALL, 0x80000002446F9EF0, v38);
    sub_2446F5D00();
    _os_log_impl(&dword_2446DD000, v25, v26, "%s.%s: completion block not present", (uint8_t *)v27, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v28, -1, -1);
    MEMORY[0x2495161CC](v27, -1, -1);

  }
  else
  {

    swift_release_n();
  }
LABEL_32:
  if (*(_QWORD *)(v21 + 2592) != -1)
    swift_once();
  v31 = sub_2446F585C();
  __swift_project_value_buffer(v31, (uint64_t)qword_2543FAF48);
  swift_retain_n();
  v32 = sub_2446F5844();
  v33 = sub_2446F5CB8();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = swift_slowAlloc();
    v35 = swift_slowAlloc();
    v38[0] = v35;
    *(_DWORD *)v34 = 136315394;
    v36 = sub_2446F5E68();
    *(_QWORD *)&v39 = sub_2446E9108(v36, v37, v38);
    sub_2446F5D00();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v34 + 12) = 2080;
    *(_QWORD *)&v39 = sub_2446E9108(0xD00000000000002ALL, 0x80000002446F9EF0, v38);
    sub_2446F5D00();
    _os_log_impl(&dword_2446DD000, v32, v33, "…Complete (%s.%s)", (uint8_t *)v34, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v35, -1, -1);
    MEMORY[0x2495161CC](v34, -1, -1);

  }
  else
  {

    swift_release_n();
  }
}

uint64_t sub_2446ED2D0(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t PreferencesControllerRepresentableModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_2446EE340(v0 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel__recipe, type metadata accessor for PreferencesControllerRecipe);
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel_preferencesController));
  swift_release();
  v1 = v0 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel___observationRegistrar;
  v2 = sub_2446F582C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t PreferencesControllerRepresentableModel.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_2446EE340(v0 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel__recipe, type metadata accessor for PreferencesControllerRecipe);
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel_preferencesController));
  swift_release();
  v1 = v0 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel___observationRegistrar;
  v2 = sub_2446F582C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

BOOL static PreferencesControllerRepresentableModel.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void PreferencesControllerRepresentableModel.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v1 = v0;
  v2 = type metadata accessor for PreferencesControllerRecipe(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v11 = v0;
  sub_2446EDC08(&qword_2543F97E0, (uint64_t)&protocol conformance descriptor for PreferencesControllerRepresentableModel);
  sub_2446F5814();
  swift_release();
  v5 = v0 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel__recipe;
  swift_beginAccess();
  sub_2446EE2FC(v5, (uint64_t)v4, type metadata accessor for PreferencesControllerRecipe);
  sub_2446EFE78();
  v6 = *(void **)&v4[*(int *)(v2 + 32)];
  if (v6)
  {
    v7 = v6;
    sub_2446F5CE8();

  }
  sub_2446EE340((uint64_t)v4, type metadata accessor for PreferencesControllerRecipe);
  v8 = *(void **)(v1
                + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel_preferencesController);
  if (v8)
  {
    v9 = v8;
    sub_2446F5CE8();

  }
}

uint64_t PreferencesControllerRepresentableModel.hashValue.getter()
{
  sub_2446F5E44();
  PreferencesControllerRepresentableModel.hash(into:)();
  return sub_2446F5E5C();
}

uint64_t sub_2446ED5A4()
{
  sub_2446F5E44();
  PreferencesControllerRepresentableModel.hash(into:)();
  return sub_2446F5E5C();
}

void sub_2446ED5E4()
{
  PreferencesControllerRepresentableModel.hash(into:)();
}

uint64_t sub_2446ED604()
{
  sub_2446F5E44();
  PreferencesControllerRepresentableModel.hash(into:)();
  return sub_2446F5E5C();
}

uint64_t PreferencesControllerRepresentableModel.description.getter()
{
  sub_2446F5E68();
  sub_2446F5C10();
  swift_bridgeObjectRelease();
  sub_2446F5C10();
  sub_2446F5D90();
  return 0;
}

uint64_t sub_2446ED6D0()
{
  sub_2446F5E68();
  sub_2446F5C10();
  swift_bridgeObjectRelease();
  sub_2446F5C10();
  sub_2446F5D90();
  return 0;
}

uint64_t UIViewController.associatedPreferencesControllerRecipe.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  id v3;
  uint64_t v4;
  int v5;
  uint64_t v7;
  _OWORD v8[2];
  _BYTE v9[24];
  uint64_t v10;

  swift_beginAccess();
  v3 = objc_getAssociatedObject(v1, &unk_25737B930);
  swift_endAccess();
  if (v3)
  {
    sub_2446F5D18();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_2446EDB9C((uint64_t)v8, (uint64_t)v9);
  if (v10)
  {
    v4 = type metadata accessor for PreferencesControllerRecipe(0);
    v5 = swift_dynamicCast();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, v5 ^ 1u, 1, v4);
  }
  else
  {
    sub_2446E3E44((uint64_t)v9, &qword_25737B888);
    v7 = type metadata accessor for PreferencesControllerRecipe(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(a1, 1, 1, v7);
  }
}

uint64_t sub_2446ED87C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25737B940);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2446EE3F8(a1, (uint64_t)v4, &qword_25737B940);
  return UIViewController.associatedPreferencesControllerRecipe.setter((uint64_t)v4);
}

uint64_t UIViewController.associatedPreferencesControllerRecipe.setter(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v12;

  v3 = type metadata accessor for PreferencesControllerRecipe(0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25737B940);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2446EE3F8(a1, (uint64_t)v9, &qword_25737B940);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3) != 1)
  {
    sub_2446EE2FC((uint64_t)v9, (uint64_t)v6, type metadata accessor for PreferencesControllerRecipe);
    v10 = (void *)sub_2446F5DF0();
    sub_2446EE340((uint64_t)v9, type metadata accessor for PreferencesControllerRecipe);
  }
  swift_beginAccess();
  objc_setAssociatedObject(v1, &unk_25737B930, v10, (void *)1);
  swift_endAccess();
  swift_unknownObjectRelease();
  return sub_2446E3E44(a1, &qword_25737B940);
}

void (*UIViewController.associatedPreferencesControllerRecipe.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  size_t v3;
  void *v4;

  *a1 = v1;
  v3 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25737B940) - 8) + 64);
  a1[1] = malloc(v3);
  v4 = malloc(v3);
  a1[2] = v4;
  UIViewController.associatedPreferencesControllerRecipe.getter((uint64_t)v4);
  return sub_2446EDAD0;
}

void sub_2446EDAD0(uint64_t a1, char a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 8);
  v3 = *(void **)(a1 + 16);
  if ((a2 & 1) != 0)
  {
    sub_2446EE3F8(*(_QWORD *)(a1 + 16), (uint64_t)v2, &qword_25737B940);
    UIViewController.associatedPreferencesControllerRecipe.setter((uint64_t)v2);
    sub_2446E3E44((uint64_t)v3, &qword_25737B940);
  }
  else
  {
    UIViewController.associatedPreferencesControllerRecipe.setter(*(_QWORD *)(a1 + 16));
  }
  free(v3);
  free(v2);
}

id sub_2446EDB40@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_parentViewController);
  *a2 = result;
  return result;
}

uint64_t sub_2446EDB78()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2446EDB9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25737B888);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2446EDBE4()
{
  return sub_2446EDC08((unint64_t *)&unk_25737B948, (uint64_t)&protocol conformance descriptor for PreferencesControllerRepresentableModel);
}

uint64_t sub_2446EDC08(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for PreferencesControllerRepresentableModel();
    result = MEMORY[0x249516130](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2446EDC48@<X0>(uint64_t a1@<X8>)
{
  return UIViewController.associatedPreferencesControllerRecipe.getter(a1);
}

uint64_t sub_2446EDC6C()
{
  return type metadata accessor for PreferencesControllerRepresentableModel();
}

uint64_t sub_2446EDC74()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for PreferencesControllerRecipe(319);
  if (v1 <= 0x3F)
  {
    result = sub_2446F582C();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t method lookup function for PreferencesControllerRepresentableModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PreferencesControllerRepresentableModel.__allocating_init(recipe:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

void sub_2446EDD1C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t *__return_ptr, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*(*v21)())();
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)();
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31[3];

  v2 = v1;
  if (qword_2543F9A20 != -1)
    swift_once();
  v4 = sub_2446F585C();
  __swift_project_value_buffer(v4, (uint64_t)qword_2543FAF48);
  swift_retain_n();
  v5 = a1;
  v6 = sub_2446F5844();
  v7 = sub_2446F5CB8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    v29 = swift_slowAlloc();
    v31[0] = v29;
    *(_DWORD *)v8 = 136315907;
    v10 = sub_2446F5E68();
    sub_2446E9108(v10, v11, v31);
    sub_2446F5D00();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    sub_2446E9108(0xD000000000000037, 0x80000002446F9BB0, v31);
    sub_2446F5D00();
    *(_WORD *)(v8 + 22) = 2160;
    sub_2446F5D00();
    *(_WORD *)(v8 + 32) = 2113;
    v30 = (uint64_t)v5;
    v12 = v5;
    sub_2446F5D00();
    *v9 = v5;

    _os_log_impl(&dword_2446DD000, v6, v7, "Start (%s.%s), preferencesController: %{private,mask.hash}@…", (uint8_t *)v8, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9B40);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v9, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v29, -1, -1);
    MEMORY[0x2495161CC](v8, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  swift_getKeyPath();
  v31[0] = v2;
  sub_2446EDC08(&qword_2543F97E0, (uint64_t)&protocol conformance descriptor for PreferencesControllerRepresentableModel);
  sub_2446F5814();
  swift_release();
  v13 = v2 + OBJC_IVAR____TtC19PreferencesExtended39PreferencesControllerRepresentableModel__recipe;
  swift_beginAccess();
  v14 = type metadata accessor for PreferencesControllerRecipe(0);
  v15 = *(_QWORD *)(v13 + *(int *)(v14 + 24));
  if (v15 && (*(_BYTE *)(v15 + 16) & 1) == 0)
  {
    v16 = v14;
    v17 = *(void (**)(uint64_t *__return_ptr, uint64_t))(v15 + 24);
    v18 = 1;
    *(_BYTE *)(v15 + 16) = 1;
    swift_getKeyPath();
    v30 = v2;
    swift_retain();
    sub_2446F5814();
    v19 = swift_release();
    v20 = *(_QWORD *)(v13 + *(int *)(v16 + 28));
    if (v20 && (*(_BYTE *)(v20 + 16) & 1) == 0)
    {
      v23 = *(_QWORD *)(v20 + 24);
      v22 = *(_QWORD *)(v20 + 32);
      *(_BYTE *)(v20 + 16) = 1;
      v24 = swift_allocObject();
      *(_QWORD *)(v24 + 16) = v23;
      *(_QWORD *)(v24 + 24) = v22;
      v19 = swift_retain();
      v18 = 0;
      v21 = sub_2446EE180;
    }
    else
    {
      v21 = 0;
    }
    v17(&v30, v19);
    swift_release();
    v25 = v30;
    if ((v18 & 1) != 0)
    {
      v26 = 0;
      v27 = 0;
    }
    else
    {
      swift_retain();
      v26 = v21();
      v27 = v28;
      sub_2446E7124((uint64_t)v21);
    }
    sub_2446EBFA4(v25, (uint64_t)v26, v27);
    sub_2446E7124((uint64_t)v26);
    swift_bridgeObjectRelease();
    sub_2446E7124((uint64_t)v21);
  }
  sub_2446EBD04(v2, v5);
}

uint64_t (*sub_2446EE180())()
{
  uint64_t v0;
  __int128 v2;

  (*(void (**)(__int128 *__return_ptr))(v0 + 16))(&v2);
  *(_OWORD *)(swift_allocObject() + 16) = v2;
  return sub_2446EE298;
}

uint64_t sub_2446EE1D4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 32))
    swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_2446EE218()
{
  uint64_t v0;

  sub_2446ECC04(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(void (**)(uint64_t))(v0 + 32));
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

uint64_t sub_2446EE240(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_2446EE274()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2446EE298()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_2446EE2B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NSBundle.PreferencesPluginLocation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2446EE2FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2446EE340(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_2446EE37C()
{
  unint64_t result;

  result = qword_25737B968;
  if (!qword_25737B968)
  {
    result = MEMORY[0x249516130](&protocol conformance descriptor for PreferencesPluginError, &type metadata for PreferencesPluginError);
    atomic_store(result, (unint64_t *)&qword_25737B968);
  }
  return result;
}

uint64_t sub_2446EE3C0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2446EE3F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2446EE43C()
{
  uint64_t v0;

  return sub_2446E9FCC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_2446EE454(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PreferencesControllerRecipe(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_2446EE49C(uint64_t a1)
{
  return sub_2446EE504(a1, qword_25737C4B0);
}

uint64_t sub_2446EE4BC(uint64_t a1)
{
  return sub_2446EE504(a1, qword_25737C4C8);
}

uint64_t sub_2446EE4E0(uint64_t a1)
{
  return sub_2446EE504(a1, qword_2543FAF48);
}

uint64_t sub_2446EE504(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_2446F585C();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  swift_bridgeObjectRetain();
  return sub_2446F5850();
}

void sub_2446EE588()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);
  char *v5;
  uint64_t v6;

  v1 = type metadata accessor for NSBundle.PreferencesPluginLocation();
  MEMORY[0x24BDAC7A8](v1);
  v2 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x24BDAC7A8](v2);
  sub_2446EE2FC(v0, (uint64_t)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  v5 = (char *)&loc_2446EE640 + dword_2446EE91C[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_2446EE650()
{
  void **v0;
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *v0;
  *(_QWORD *)(v1 - 80) = 0;
  *(_QWORD *)(v1 - 72) = 0xE000000000000000;
  sub_2446F5D60();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 - 80) = 0xD000000000000019;
  *(_QWORD *)(v1 - 72) = 0x80000002446FA040;
  v3 = objc_msgSend(v2, sel_description);
  sub_2446F5BF8();

  sub_2446F5C10();
  swift_bridgeObjectRelease();
  sub_2446F5C10();

  return *(_QWORD *)(v1 - 80);
}

void PreferencesControllerRecipe.viewControllerIfLoaded.getter()
{
  type metadata accessor for PreferencesControllerRecipe(0);
  JUMPOUT(0x24951625CLL);
}

uint64_t type metadata accessor for PreferencesControllerRecipe(uint64_t a1)
{
  return sub_2446EE984(a1, qword_2543F9780);
}

uint64_t PreferencesControllerRecipe.init(specifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2446EF658(a1, a2);
}

uint64_t type metadata accessor for PreferencesControllerRecipe.Kind(uint64_t a1)
{
  return sub_2446EE984(a1, qword_2543F9758);
}

uint64_t sub_2446EE984(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void PreferencesControllerRecipe.init(specifier:pendingURLPayload:)(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;

  v6 = (int *)type metadata accessor for PreferencesControllerRecipe(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (uint64_t *)((char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v11 = a1;
  swift_storeEnumTagMultiPayload();
  v12 = v6[5];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543F9A10);
  v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(_QWORD *)&v8[v12] = v13;
  v14 = v6[6];
  *(_QWORD *)&v8[v14] = 0;
  *(_QWORD *)&v8[v6[7]] = 0;
  sub_2446EEB88((uint64_t)v11, (uint64_t)v8, type metadata accessor for PreferencesControllerRecipe.Kind);
  *(_QWORD *)&v8[v6[8]] = 0;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25737B998);
  v16 = swift_allocObject();
  *(_BYTE *)(v16 + 16) = 0;
  *(_QWORD *)(v16 + 24) = sub_2446F1A3C;
  *(_QWORD *)(v16 + 32) = v15;
  v17 = a1;
  swift_release();
  *(_QWORD *)&v8[v14] = v16;
  sub_2446EEB88((uint64_t)v8, a3, type metadata accessor for PreferencesControllerRecipe);

}

uint64_t sub_2446EEB64()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2446EEB88(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t PreferencesControllerRecipe.init(viewController:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2446EF658(a1, a2);
}

uint64_t PreferencesControllerRecipe.init(viewController:specifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_2446EF750(a1, a2, a3);
}

void PreferencesControllerRecipe.init(viewController:pendingURLPayload:)(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;

  v6 = (int *)type metadata accessor for PreferencesControllerRecipe(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (uint64_t *)((char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v11 = a1;
  swift_storeEnumTagMultiPayload();
  v12 = v6[5];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543F9A10);
  v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(_QWORD *)&v8[v12] = v13;
  v14 = v6[6];
  *(_QWORD *)&v8[v14] = 0;
  *(_QWORD *)&v8[v6[7]] = 0;
  sub_2446EEB88((uint64_t)v11, (uint64_t)v8, type metadata accessor for PreferencesControllerRecipe.Kind);
  *(_QWORD *)&v8[v6[8]] = 0;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25737B998);
  v16 = swift_allocObject();
  *(_BYTE *)(v16 + 16) = 0;
  *(_QWORD *)(v16 + 24) = sub_2446F1A3C;
  *(_QWORD *)(v16 + 32) = v15;
  v17 = a1;
  swift_release();
  *(_QWORD *)&v8[v14] = v16;
  sub_2446EEB88((uint64_t)v8, a3, type metadata accessor for PreferencesControllerRecipe);

}

void PreferencesControllerRecipe.init(viewController:specifier:pendingURLPayload:)(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  int *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;

  v8 = (int *)type metadata accessor for PreferencesControllerRecipe(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (uint64_t *)((char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v13 = a1;
  swift_storeEnumTagMultiPayload();
  v14 = v8[5];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543F9A10);
  v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(_QWORD *)&v10[v14] = v15;
  v16 = v8[6];
  *(_QWORD *)&v10[v16] = 0;
  *(_QWORD *)&v10[v8[7]] = 0;
  sub_2446EEB88((uint64_t)v13, (uint64_t)v10, type metadata accessor for PreferencesControllerRecipe.Kind);
  *(_QWORD *)&v10[v8[8]] = a2;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25737B998);
  v18 = swift_allocObject();
  *(_BYTE *)(v18 + 16) = 0;
  *(_QWORD *)(v18 + 24) = sub_2446F1A3C;
  *(_QWORD *)(v18 + 32) = v17;
  v19 = a1;
  v20 = a2;
  swift_release();
  *(_QWORD *)&v10[v16] = v18;
  sub_2446EEB88((uint64_t)v10, a4, type metadata accessor for PreferencesControllerRecipe);

}

uint64_t PreferencesControllerRecipe.init(bundleName:location:viewControllerClassName:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  int *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;

  v25 = a6;
  v11 = (int *)type metadata accessor for PreferencesControllerRecipe(0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (uint64_t *)((char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AB0);
  v18 = (uint64_t)v16 + *(int *)(v17 + 48);
  v19 = (_QWORD *)((char *)v16 + *(int *)(v17 + 64));
  *v16 = a1;
  v16[1] = a2;
  sub_2446EE2FC(a3, v18, (uint64_t (*)(_QWORD))type metadata accessor for NSBundle.PreferencesPluginLocation);
  *v19 = a4;
  v19[1] = a5;
  swift_storeEnumTagMultiPayload();
  v20 = v11[5];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543F9A10);
  v21 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(_QWORD *)&v13[v20] = v21;
  v22 = v11[6];
  *(_QWORD *)&v13[v11[7]] = 0;
  sub_2446EEB88((uint64_t)v16, (uint64_t)v13, type metadata accessor for PreferencesControllerRecipe.Kind);
  *(_QWORD *)&v13[v11[8]] = 0;
  *(_QWORD *)&v13[v22] = 0;
  sub_2446EEB88((uint64_t)v13, v25, type metadata accessor for PreferencesControllerRecipe);
  return sub_2446EE340(a3, (uint64_t (*)(_QWORD))type metadata accessor for NSBundle.PreferencesPluginLocation);
}

uint64_t PreferencesControllerRecipe.init(specifier:bundleName:location:viewControllerClassName:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  int *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;

  v26 = a1;
  v27 = a7;
  v12 = (int *)type metadata accessor for PreferencesControllerRecipe(0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (uint64_t *)((char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AB0);
  v19 = (uint64_t)v17 + *(int *)(v18 + 48);
  v20 = (_QWORD *)((char *)v17 + *(int *)(v18 + 64));
  *v17 = a2;
  v17[1] = a3;
  sub_2446EE2FC(a4, v19, (uint64_t (*)(_QWORD))type metadata accessor for NSBundle.PreferencesPluginLocation);
  *v20 = a5;
  v20[1] = a6;
  swift_storeEnumTagMultiPayload();
  v21 = v12[5];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543F9A10);
  v22 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(_QWORD *)&v14[v21] = v22;
  v23 = v12[6];
  *(_QWORD *)&v14[v12[7]] = 0;
  sub_2446EEB88((uint64_t)v17, (uint64_t)v14, type metadata accessor for PreferencesControllerRecipe.Kind);
  v24 = v27;
  *(_QWORD *)&v14[v12[8]] = v26;
  *(_QWORD *)&v14[v23] = 0;
  sub_2446EEB88((uint64_t)v14, v24, type metadata accessor for PreferencesControllerRecipe);
  return sub_2446EE340(a4, (uint64_t (*)(_QWORD))type metadata accessor for NSBundle.PreferencesPluginLocation);
}

uint64_t PreferencesControllerRecipe.init(bundleName:location:viewControllerClassName:pendingURLPayload:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  int *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;

  v27 = a6;
  v28 = a7;
  v12 = (int *)type metadata accessor for PreferencesControllerRecipe(0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (uint64_t *)((char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AB0);
  v19 = (uint64_t)v17 + *(int *)(v18 + 48);
  v20 = (_QWORD *)((char *)v17 + *(int *)(v18 + 64));
  *v17 = a1;
  v17[1] = a2;
  sub_2446EE2FC(a3, v19, (uint64_t (*)(_QWORD))type metadata accessor for NSBundle.PreferencesPluginLocation);
  *v20 = a4;
  v20[1] = a5;
  swift_storeEnumTagMultiPayload();
  v21 = v12[5];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543F9A10);
  v22 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(_QWORD *)&v14[v21] = v22;
  v23 = v12[6];
  *(_QWORD *)&v14[v23] = 0;
  *(_QWORD *)&v14[v12[7]] = 0;
  sub_2446EEB88((uint64_t)v17, (uint64_t)v14, type metadata accessor for PreferencesControllerRecipe.Kind);
  *(_QWORD *)&v14[v12[8]] = 0;
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = v27;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25737B998);
  v25 = swift_allocObject();
  *(_BYTE *)(v25 + 16) = 0;
  *(_QWORD *)(v25 + 24) = sub_2446F1A3C;
  *(_QWORD *)(v25 + 32) = v24;
  swift_release();
  *(_QWORD *)&v14[v23] = v25;
  sub_2446EEB88((uint64_t)v14, v28, type metadata accessor for PreferencesControllerRecipe);
  return sub_2446EE340(a3, (uint64_t (*)(_QWORD))type metadata accessor for NSBundle.PreferencesPluginLocation);
}

uint64_t PreferencesControllerRecipe.init(specifier:bundleName:location:viewControllerClassName:pendingURLPayload:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  int *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;

  v31 = a1;
  v32 = a7;
  v33 = a8;
  v13 = (int *)type metadata accessor for PreferencesControllerRecipe(0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (uint64_t *)((char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AB0);
  v20 = (uint64_t)v18 + *(int *)(v19 + 48);
  v21 = (_QWORD *)((char *)v18 + *(int *)(v19 + 64));
  *v18 = a2;
  v18[1] = a3;
  sub_2446EE2FC(a4, v20, (uint64_t (*)(_QWORD))type metadata accessor for NSBundle.PreferencesPluginLocation);
  *v21 = a5;
  v21[1] = a6;
  swift_storeEnumTagMultiPayload();
  v22 = v13[5];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543F9A10);
  v23 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(_QWORD *)&v15[v22] = v23;
  v24 = v13[6];
  *(_QWORD *)&v15[v24] = 0;
  *(_QWORD *)&v15[v13[7]] = 0;
  sub_2446EEB88((uint64_t)v18, (uint64_t)v15, type metadata accessor for PreferencesControllerRecipe.Kind);
  v25 = v31;
  *(_QWORD *)&v15[v13[8]] = v31;
  v26 = swift_allocObject();
  *(_QWORD *)(v26 + 16) = v32;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25737B998);
  v27 = swift_allocObject();
  *(_BYTE *)(v27 + 16) = 0;
  *(_QWORD *)(v27 + 24) = sub_2446F1A3C;
  *(_QWORD *)(v27 + 32) = v26;
  v28 = v25;
  swift_release();
  *(_QWORD *)&v15[v24] = v27;
  sub_2446EEB88((uint64_t)v15, v33, type metadata accessor for PreferencesControllerRecipe);

  return sub_2446EE340(a4, (uint64_t (*)(_QWORD))type metadata accessor for NSBundle.PreferencesPluginLocation);
}

uint64_t PreferencesControllerRecipe.init(viewControllerClass:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2446EF658(a1, a2);
}

uint64_t sub_2446EF658@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;

  v4 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (uint64_t *)((char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v6 = a1;
  swift_storeEnumTagMultiPayload();
  v7 = (int *)type metadata accessor for PreferencesControllerRecipe(0);
  v8 = v7[5];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543F9A10);
  v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(_QWORD *)(a2 + v8) = v9;
  v10 = v7[6];
  *(_QWORD *)(a2 + v7[7]) = 0;
  result = sub_2446EEB88((uint64_t)v6, a2, type metadata accessor for PreferencesControllerRecipe.Kind);
  *(_QWORD *)(a2 + v7[8]) = 0;
  *(_QWORD *)(a2 + v10) = 0;
  return result;
}

uint64_t PreferencesControllerRecipe.init(viewControllerClass:specifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_2446EF750(a1, a2, a3);
}

uint64_t sub_2446EF750@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v6 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (uint64_t *)((char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v8 = a1;
  swift_storeEnumTagMultiPayload();
  v9 = (int *)type metadata accessor for PreferencesControllerRecipe(0);
  v10 = v9[5];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543F9A10);
  v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(_QWORD *)(a3 + v10) = v11;
  v12 = v9[6];
  *(_QWORD *)(a3 + v9[7]) = 0;
  result = sub_2446EEB88((uint64_t)v8, a3, type metadata accessor for PreferencesControllerRecipe.Kind);
  *(_QWORD *)(a3 + v9[8]) = a2;
  *(_QWORD *)(a3 + v12) = 0;
  return result;
}

uint64_t PreferencesControllerRecipe.init(viewControllerClass:pendingURLPayload:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;

  v6 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (uint64_t *)((char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v8 = a1;
  swift_storeEnumTagMultiPayload();
  v9 = (int *)type metadata accessor for PreferencesControllerRecipe(0);
  v10 = v9[5];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543F9A10);
  v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(_QWORD *)(a3 + v10) = v11;
  v12 = v9[6];
  *(_QWORD *)(a3 + v12) = 0;
  *(_QWORD *)(a3 + v9[7]) = 0;
  sub_2446EEB88((uint64_t)v8, a3, type metadata accessor for PreferencesControllerRecipe.Kind);
  *(_QWORD *)(a3 + v9[8]) = 0;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25737B998);
  v14 = swift_allocObject();
  *(_BYTE *)(v14 + 16) = 0;
  *(_QWORD *)(v14 + 24) = sub_2446F1A3C;
  *(_QWORD *)(v14 + 32) = v13;
  result = swift_release();
  *(_QWORD *)(a3 + v12) = v14;
  return result;
}

void PreferencesControllerRecipe.init(viewControllerClass:specifier:pendingURLPayload:)(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  int *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;

  v8 = (int *)type metadata accessor for PreferencesControllerRecipe(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (uint64_t *)((char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v13 = a1;
  swift_storeEnumTagMultiPayload();
  v14 = v8[5];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543F9A10);
  v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(_QWORD *)&v10[v14] = v15;
  v16 = v8[6];
  *(_QWORD *)&v10[v16] = 0;
  *(_QWORD *)&v10[v8[7]] = 0;
  sub_2446EEB88((uint64_t)v13, (uint64_t)v10, type metadata accessor for PreferencesControllerRecipe.Kind);
  *(_QWORD *)&v10[v8[8]] = a2;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25737B998);
  v18 = swift_allocObject();
  *(_BYTE *)(v18 + 16) = 0;
  *(_QWORD *)(v18 + 24) = sub_2446F1A3C;
  *(_QWORD *)(v18 + 32) = v17;
  v19 = a2;
  swift_release();
  *(_QWORD *)&v10[v16] = v18;
  sub_2446EEB88((uint64_t)v10, a4, type metadata accessor for PreferencesControllerRecipe);

}

uint64_t PreferencesControllerRecipe.controllerRecipeWithPendingURLPayload(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  sub_2446EE2FC(v2, a2, type metadata accessor for PreferencesControllerRecipe);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25737B998);
  v6 = swift_allocObject();
  *(_BYTE *)(v6 + 16) = 0;
  *(_QWORD *)(v6 + 24) = sub_2446EFD2C;
  *(_QWORD *)(v6 + 32) = v5;
  v7 = *(int *)(type metadata accessor for PreferencesControllerRecipe(0) + 24);
  swift_bridgeObjectRetain();
  result = swift_release();
  *(_QWORD *)(a2 + v7) = v6;
  return result;
}

uint64_t PreferencesControllerRecipe.controllerRecipeWithPendingURLPayload(_:pendingURLCompletion:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = v4;
  sub_2446EE2FC(v5, a4, type metadata accessor for PreferencesControllerRecipe);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25737B998);
  v11 = swift_allocObject();
  *(_BYTE *)(v11 + 16) = 0;
  *(_QWORD *)(v11 + 24) = sub_2446F1A3C;
  *(_QWORD *)(v11 + 32) = v10;
  v12 = type metadata accessor for PreferencesControllerRecipe(0);
  v13 = *(int *)(v12 + 24);
  swift_bridgeObjectRetain();
  result = swift_release();
  *(_QWORD *)(a4 + v13) = v11;
  if (a2)
  {
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = a2;
    *(_QWORD *)(v15 + 24) = a3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25737B9A8);
    v16 = swift_allocObject();
    *(_BYTE *)(v16 + 16) = 0;
    *(_QWORD *)(v16 + 24) = sub_2446EFDC0;
    *(_QWORD *)(v16 + 32) = v15;
    v17 = *(int *)(v12 + 28);
    swift_retain();
    result = swift_release();
    *(_QWORD *)(a4 + v17) = v16;
  }
  return result;
}

uint64_t sub_2446EFD2C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2446EFD38@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t (**a3)()@<X8>)
{
  uint64_t v4;
  uint64_t v6;

  if (result)
  {
    v4 = result;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = a2;
    *a3 = sub_2446EE298;
    a3[1] = (uint64_t (*)())v6;
    return swift_retain();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2446EFD94()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_2446EFDC0@<X0>(uint64_t (**a1)()@<X8>)
{
  uint64_t v1;

  return sub_2446EFD38(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t PreferencesControllerRecipe.description.getter()
{
  sub_2446EE588();
  sub_2446F5C10();
  swift_bridgeObjectRelease();
  return 0xD00000000000001DLL;
}

unint64_t sub_2446EFE20()
{
  sub_2446EE588();
  sub_2446F5C10();
  swift_bridgeObjectRelease();
  return 0xD00000000000001DLL;
}

void sub_2446EFE78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);
  char *v5;
  uint64_t v6;

  v1 = type metadata accessor for NSBundle.PreferencesPluginLocation();
  MEMORY[0x24BDAC7A8](v1);
  v2 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  MEMORY[0x24BDAC7A8](v2);
  sub_2446EE2FC(v0, (uint64_t)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  v5 = (char *)&loc_2446EFF2C + dword_2446F0074[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_2446EFF3C()
{
  void **v0;
  void *v1;

  v1 = *v0;
  sub_2446F5CE8();

}

uint64_t sub_2446F0084()
{
  sub_2446F5E44();
  sub_2446EFE78();
  return sub_2446F5E5C();
}

uint64_t sub_2446F00C4()
{
  sub_2446F5E44();
  sub_2446EFE78();
  return sub_2446F5E5C();
}

id static PreferencesControllerRecipe.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  id result;

  sub_2446F03AC(a1, a2);
  if ((v4 & 1) == 0)
    return 0;
  v5 = *(int *)(type metadata accessor for PreferencesControllerRecipe(0) + 32);
  result = *(id *)(a1 + v5);
  if (!result)
    return result;
  if (*(_QWORD *)(a2 + v5))
    return objc_msgSend(result, sel_isEqualToSpecifier_);
  else
    return 0;
}

void PreferencesControllerRecipe.hash(into:)()
{
  uint64_t v0;
  void *v1;
  id v2;

  sub_2446EFE78();
  v1 = *(void **)(v0 + *(int *)(type metadata accessor for PreferencesControllerRecipe(0) + 32));
  if (v1)
  {
    v2 = v1;
    sub_2446F5CE8();

  }
}

uint64_t PreferencesControllerRecipe.hashValue.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  sub_2446F5E44();
  sub_2446EFE78();
  v1 = *(void **)(v0 + *(int *)(type metadata accessor for PreferencesControllerRecipe(0) + 32));
  if (v1)
  {
    v2 = v1;
    sub_2446F5CE8();

  }
  return sub_2446F5E5C();
}

uint64_t sub_2446F0224(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;

  sub_2446F5E44();
  sub_2446EFE78();
  v3 = *(void **)(v1 + *(int *)(a1 + 32));
  if (v3)
  {
    v4 = v3;
    sub_2446F5CE8();

  }
  return sub_2446F5E5C();
}

void sub_2446F0284(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v4;
  id v5;

  sub_2446EFE78();
  v4 = *(void **)(v2 + *(int *)(a2 + 32));
  if (v4)
  {
    v5 = v4;
    sub_2446F5CE8();

  }
}

uint64_t sub_2446F02F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v4;
  id v5;

  sub_2446F5E44();
  sub_2446EFE78();
  v4 = *(void **)(v2 + *(int *)(a2 + 32));
  if (v4)
  {
    v5 = v4;
    sub_2446F5CE8();

  }
  return sub_2446F5E5C();
}

id sub_2446F0350(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;
  uint64_t v7;
  id result;

  sub_2446F03AC(a1, a2);
  if ((v6 & 1) == 0)
    return 0;
  v7 = *(int *)(a3 + 32);
  result = *(id *)(a1 + v7);
  if (!result)
    return result;
  if (*(_QWORD *)(a2 + v7))
    return objc_msgSend(result, sel_isEqualToSpecifier_);
  else
    return 0;
}

void sub_2446F03AC(uint64_t a1, uint64_t a2)
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
  char *v19;
  char *v20;
  _QWORD v21[8];

  v4 = type metadata accessor for NSBundle.PreferencesPluginLocation();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v21[4] = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v21[5] = (char *)v21 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v21[6] = (char *)v21 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v21[7] = (char *)v21 - v11;
  v12 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v15 = MEMORY[0x24BDAC7A8](v14);
  MEMORY[0x24BDAC7A8](v15);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9338);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)v21 + *(int *)(v17 + 48) - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2446EE2FC(a1, (uint64_t)v21 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for PreferencesControllerRecipe.Kind);
  sub_2446EE2FC(a2, (uint64_t)v19, type metadata accessor for PreferencesControllerRecipe.Kind);
  v20 = (char *)sub_2446F0588 + 4 * byte_2446F7570[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_2446F0588()
{
  uint64_t v0;
  void **v1;
  _QWORD *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  sub_2446EE2FC(v0, (uint64_t)v1, type metadata accessor for PreferencesControllerRecipe.Kind);
  v3 = *v1;
  if (swift_getEnumCaseMultiPayload())
  {

    sub_2446F19D8(v0);
    v5 = 0;
  }
  else
  {
    v4 = (void *)*v2;
    v5 = objc_msgSend(v3, sel_isEqualToSpecifier_, *v2);

    sub_2446EE340(v0, type metadata accessor for PreferencesControllerRecipe.Kind);
  }
  return v5 & 1;
}

uint64_t sub_2446F0938()
{
  return sub_2446E18F0((unint64_t *)&unk_2543F9770, type metadata accessor for PreferencesControllerRecipe, (uint64_t)&protocol conformance descriptor for PreferencesControllerRecipe);
}

_QWORD *initializeBufferWithCopyOfBuffer for PreferencesControllerRecipe(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  int EnumCaseMultiPayload;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) == 0)
  {
    v7 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload != 3)
    {
      if (EnumCaseMultiPayload == 1)
      {
        v12 = a2[1];
        *a1 = *a2;
        a1[1] = v12;
        swift_bridgeObjectRetain();
        v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AB0);
        v14 = *(int *)(v13 + 48);
        v15 = (char *)a1 + v14;
        v16 = (char *)a2 + v14;
        v17 = sub_2446F57D8();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
        v18 = *(int *)(v13 + 64);
        v19 = (_QWORD *)((char *)a1 + v18);
        v20 = (_QWORD *)((char *)a2 + v18);
        v21 = v20[1];
        *v19 = *v20;
        v19[1] = v21;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        goto LABEL_10;
      }
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
        goto LABEL_10;
      }
    }
    v9 = (void *)*a2;
    *a1 = *a2;
    v10 = v9;
    swift_storeEnumTagMultiPayload();
LABEL_10:
    v22 = a3[6];
    *(_QWORD *)((char *)a1 + a3[5]) = *(_QWORD *)((char *)a2 + a3[5]);
    *(_QWORD *)((char *)a1 + v22) = *(_QWORD *)((char *)a2 + v22);
    v23 = a3[8];
    *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
    v24 = *(void **)((char *)a2 + v23);
    *(_QWORD *)((char *)a1 + v23) = v24;
    swift_retain();
    swift_retain();
    swift_retain();
    v25 = v24;
    return a1;
  }
  v11 = *a2;
  *a1 = *a2;
  a1 = (_QWORD *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
  swift_retain();
  return a1;
}

void destroy for PreferencesControllerRecipe(id *a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  char *v5;
  uint64_t v6;

  type metadata accessor for PreferencesControllerRecipe.Kind(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      goto LABEL_4;
    case 1:
      swift_bridgeObjectRelease();
      v5 = (char *)a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AB0) + 48);
      v6 = sub_2446F57D8();
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
      swift_bridgeObjectRelease();
      break;
    case 0:
LABEL_4:

      break;
  }
  swift_release();
  swift_release();
  swift_release();

}

_QWORD *initializeWithCopy for PreferencesControllerRecipe(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  int EnumCaseMultiPayload;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;

  v6 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload != 3)
  {
    if (EnumCaseMultiPayload == 1)
    {
      v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      swift_bridgeObjectRetain();
      v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AB0);
      v12 = *(int *)(v11 + 48);
      v13 = (char *)a1 + v12;
      v14 = (char *)a2 + v12;
      v15 = sub_2446F57D8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
      v16 = *(int *)(v11 + 64);
      v17 = (_QWORD *)((char *)a1 + v16);
      v18 = (_QWORD *)((char *)a2 + v16);
      v19 = v18[1];
      *v17 = *v18;
      v17[1] = v19;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
      goto LABEL_8;
    }
    if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
      goto LABEL_8;
    }
  }
  v8 = (void *)*a2;
  *a1 = *a2;
  v9 = v8;
  swift_storeEnumTagMultiPayload();
LABEL_8:
  v20 = a3[6];
  *(_QWORD *)((char *)a1 + a3[5]) = *(_QWORD *)((char *)a2 + a3[5]);
  *(_QWORD *)((char *)a1 + v20) = *(_QWORD *)((char *)a2 + v20);
  v21 = a3[8];
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  v22 = *(void **)((char *)a2 + v21);
  *(_QWORD *)((char *)a1 + v21) = v22;
  swift_retain();
  swift_retain();
  swift_retain();
  v23 = v22;
  return a1;
}

_QWORD *assignWithCopy for PreferencesControllerRecipe(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  int EnumCaseMultiPayload;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  if (a1 != a2)
  {
    sub_2446EE340((uint64_t)a1, type metadata accessor for PreferencesControllerRecipe.Kind);
    v6 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload != 3)
    {
      if (EnumCaseMultiPayload == 1)
      {
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AB0);
        v11 = *(int *)(v10 + 48);
        v12 = (char *)a1 + v11;
        v13 = (char *)a2 + v11;
        v14 = sub_2446F57D8();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
        v15 = *(int *)(v10 + 64);
        v16 = (_QWORD *)((char *)a1 + v15);
        v17 = (_QWORD *)((char *)a2 + v15);
        *v16 = *v17;
        v16[1] = v17[1];
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        goto LABEL_9;
      }
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
        goto LABEL_9;
      }
    }
    v8 = (void *)*a2;
    *a1 = *a2;
    v9 = v8;
    swift_storeEnumTagMultiPayload();
  }
LABEL_9:
  *(_QWORD *)((char *)a1 + a3[5]) = *(_QWORD *)((char *)a2 + a3[5]);
  swift_retain();
  swift_release();
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  swift_retain();
  swift_release();
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  swift_retain();
  swift_release();
  v18 = a3[8];
  v19 = *(void **)((char *)a1 + v18);
  v20 = *(void **)((char *)a2 + v18);
  *(_QWORD *)((char *)a1 + v18) = v20;
  v21 = v20;

  return a1;
}

_OWORD *initializeWithTake for PreferencesControllerRecipe(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *a1 = *a2;
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AB0);
    v8 = *(int *)(v7 + 48);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_2446F57D8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
    *(_OWORD *)((char *)a1 + *(int *)(v7 + 64)) = *(_OWORD *)((char *)a2 + *(int *)(v7 + 64));
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v12 = a3[6];
  *(_QWORD *)((char *)a1 + a3[5]) = *(_QWORD *)((char *)a2 + a3[5]);
  *(_QWORD *)((char *)a1 + v12) = *(_QWORD *)((char *)a2 + v12);
  v13 = a3[8];
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + v13) = *(_QWORD *)((char *)a2 + v13);
  return a1;
}

_OWORD *assignWithTake for PreferencesControllerRecipe(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  if (a1 != a2)
  {
    sub_2446EE340((uint64_t)a1, type metadata accessor for PreferencesControllerRecipe.Kind);
    v6 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AB0);
      v8 = *(int *)(v7 + 48);
      v9 = (char *)a1 + v8;
      v10 = (char *)a2 + v8;
      v11 = sub_2446F57D8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
      *(_OWORD *)((char *)a1 + *(int *)(v7 + 64)) = *(_OWORD *)((char *)a2 + *(int *)(v7 + 64));
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  *(_QWORD *)((char *)a1 + a3[5]) = *(_QWORD *)((char *)a2 + a3[5]);
  swift_release();
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  swift_release();
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  swift_release();
  v12 = a3[8];
  v13 = *(void **)((char *)a1 + v12);
  *(_QWORD *)((char *)a1 + v12) = *(_QWORD *)((char *)a2 + v12);

  return a1;
}

uint64_t getEnumTagSinglePayload for PreferencesControllerRecipe()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2446F1160(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for PreferencesControllerRecipe()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2446F11E8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for PreferencesControllerRecipe.Kind(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_2446F1260()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for PreferencesControllerRecipe.Kind(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *sub_2446F12E4(char *a1, char **a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  _QWORD *v19;
  uint64_t v20;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v10 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = &v10[(v6 + 16) & ~(unint64_t)v6];
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload != 3)
    {
      if (EnumCaseMultiPayload == 1)
      {
        v11 = a2[1];
        *(_QWORD *)a1 = *a2;
        *((_QWORD *)a1 + 1) = v11;
        swift_bridgeObjectRetain();
        v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AB0);
        v13 = *(int *)(v12 + 48);
        v14 = &a1[v13];
        v15 = (char *)a2 + v13;
        v16 = sub_2446F57D8();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
        v17 = *(int *)(v12 + 64);
        v18 = &a1[v17];
        v19 = (char **)((char *)a2 + v17);
        v20 = v19[1];
        *(_QWORD *)v18 = *v19;
        *((_QWORD *)v18 + 1) = v20;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        return a1;
      }
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        return a1;
      }
    }
    v8 = *a2;
    *(_QWORD *)a1 = *a2;
    v9 = v8;
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void sub_2446F142C(id *a1)
{
  int EnumCaseMultiPayload;
  char *v3;
  uint64_t v4;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
LABEL_4:

    return;
  }
  if (EnumCaseMultiPayload != 1)
  {
    if (EnumCaseMultiPayload)
      return;
    goto LABEL_4;
  }
  swift_bridgeObjectRelease();
  v3 = (char *)a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AB0) + 48);
  v4 = sub_2446F57D8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

_QWORD *sub_2446F14D4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload != 3)
  {
    if (EnumCaseMultiPayload == 1)
    {
      v9 = a2[1];
      *a1 = *a2;
      a1[1] = v9;
      swift_bridgeObjectRetain();
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AB0);
      v11 = *(int *)(v10 + 48);
      v12 = (char *)a1 + v11;
      v13 = (char *)a2 + v11;
      v14 = sub_2446F57D8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
      v15 = *(int *)(v10 + 64);
      v16 = (_QWORD *)((char *)a1 + v15);
      v17 = (_QWORD *)((char *)a2 + v15);
      v18 = v17[1];
      *v16 = *v17;
      v16[1] = v18;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      return a1;
    }
  }
  v7 = (void *)*a2;
  *a1 = *a2;
  v8 = v7;
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *sub_2446F15F4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;

  if (a1 != a2)
  {
    sub_2446EE340((uint64_t)a1, type metadata accessor for PreferencesControllerRecipe.Kind);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload != 3)
    {
      if (EnumCaseMultiPayload == 1)
      {
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AB0);
        v10 = *(int *)(v9 + 48);
        v11 = (char *)a1 + v10;
        v12 = (char *)a2 + v10;
        v13 = sub_2446F57D8();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
        v14 = *(int *)(v9 + 64);
        v15 = (_QWORD *)((char *)a1 + v14);
        v16 = (_QWORD *)((char *)a2 + v14);
        *v15 = *v16;
        v15[1] = v16[1];
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        return a1;
      }
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        return a1;
      }
    }
    v7 = (void *)*a2;
    *a1 = *a2;
    v8 = v7;
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_2446F173C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *a1 = *a2;
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AB0);
    v7 = *(int *)(v6 + 48);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_2446F57D8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
    *(_OWORD *)((char *)a1 + *(int *)(v6 + 64)) = *(_OWORD *)((char *)a2 + *(int *)(v6 + 64));
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

_OWORD *sub_2446F1800(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  if (a1 != a2)
  {
    sub_2446EE340((uint64_t)a1, type metadata accessor for PreferencesControllerRecipe.Kind);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9AB0);
      v7 = *(int *)(v6 + 48);
      v8 = (char *)a1 + v7;
      v9 = (char *)a2 + v7;
      v10 = sub_2446F57D8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
      *(_OWORD *)((char *)a1 + *(int *)(v6 + 64)) = *(_OWORD *)((char *)a2 + *(int *)(v6 + 64));
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_2446F18DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_2446F18E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_2446F18F8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2446F1908()
{
  uint64_t result;
  unint64_t v1;
  _QWORD v2[8];

  v2[4] = MEMORY[0x24BEE0150] + 64;
  result = sub_2446F57D8();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout3();
    v2[5] = v2;
    v2[6] = &unk_2446F7690;
    v2[7] = &unk_2446F76A8;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_2446F19AC()
{
  return sub_2446E18F0((unint64_t *)&unk_25737B9B0, type metadata accessor for PreferencesControllerRecipe.Kind, (uint64_t)&unk_2446F76E8);
}

uint64_t sub_2446F19D8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9338);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2446F1A18()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2446F1A60(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  if (qword_2543F9A20 != -1)
    swift_once();
  v2 = sub_2446F585C();
  __swift_project_value_buffer(v2, (uint64_t)qword_2543FAF48);
  swift_retain();
  v3 = sub_2446F5844();
  v4 = sub_2446F5CB8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = swift_slowAlloc();
    v6 = swift_slowAlloc();
    v10 = v6;
    *(_DWORD *)v5 = 136315394;
    sub_2446E9108(0xD000000000000022, 0x80000002446F7760, &v10);
    sub_2446F5D00();
    swift_release();
    *(_WORD *)(v5 + 12) = 2080;
    sub_2446E9108(0xD000000000000011, 0x80000002446F9990, &v10);
    sub_2446F5D00();
    _os_log_impl(&dword_2446DD000, v3, v4, "Start (%s.%s)…", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v6, -1, -1);
    MEMORY[0x2495161CC](v5, -1, -1);

  }
  else
  {

    swift_release();
  }
  type metadata accessor for PreferencesControllerRepresentable.Coordinator();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a1;
  v8 = swift_retain();
  sub_2446F2188(v8, 0xD000000000000011, 0x80000002446F9990);
  return v7;
}

NSObject *sub_2446F1C70(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v10;

  if (qword_2543F9A20 != -1)
    swift_once();
  v3 = sub_2446F585C();
  __swift_project_value_buffer(v3, (uint64_t)qword_2543FAF48);
  swift_retain();
  v4 = sub_2446F5844();
  v5 = sub_2446F5CB8();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = swift_slowAlloc();
    v7 = swift_slowAlloc();
    v10 = v7;
    *(_DWORD *)v6 = 136315394;
    sub_2446E9108(0xD000000000000022, 0x80000002446F7760, &v10);
    sub_2446F5D00();
    swift_release();
    *(_WORD *)(v6 + 12) = 2080;
    sub_2446E9108(0xD00000000000001ELL, 0x80000002446FA170, &v10);
    sub_2446F5D00();
    _os_log_impl(&dword_2446DD000, v4, v5, "Start (%s.%s)…", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v7, -1, -1);
    MEMORY[0x2495161CC](v6, -1, -1);

  }
  else
  {

    swift_release();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9A88);
  sub_2446F5A54();
  swift_retain();
  swift_release();
  v8 = PreferencesControllerRepresentableModel.makeViewControllerIfNeeded()();
  swift_release();
  sub_2446F2188(a2, 0xD00000000000001ELL, 0x80000002446FA170);
  return v8;
}

void sub_2446F1EB4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v5 = sub_2446F597C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2543F9A20 != -1)
    swift_once();
  v9 = sub_2446F585C();
  __swift_project_value_buffer(v9, (uint64_t)qword_2543FAF48);
  swift_retain();
  v10 = sub_2446F5844();
  v11 = sub_2446F5CB8();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    v13 = swift_slowAlloc();
    v17 = v5;
    v14 = v13;
    v19 = v13;
    *(_DWORD *)v12 = 136315394;
    v16 = v6;
    v18 = sub_2446E9108(0xD000000000000022, 0x80000002446F7760, &v19);
    sub_2446F5D00();
    swift_release();
    *(_WORD *)(v12 + 12) = 2080;
    v18 = sub_2446E9108(0xD000000000000022, 0x80000002446FA140, &v19);
    v6 = v16;
    sub_2446F5D00();
    _os_log_impl(&dword_2446DD000, v10, v11, "Start (%s.%s)…", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    v15 = v14;
    v5 = v17;
    MEMORY[0x2495161CC](v15, -1, -1);
    MEMORY[0x2495161CC](v12, -1, -1);

  }
  else
  {

    swift_release();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9A88);
  sub_2446F5A54();
  swift_retain();
  swift_release();
  sub_2446F5A60();
  sub_2446F5A6C();
  sub_2446EDD1C(a1);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_2446F2188(a3, 0xD000000000000022, 0x80000002446FA140);
}

void sub_2446F2188(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (qword_2543F9A20 != -1)
    swift_once();
  v5 = sub_2446F585C();
  __swift_project_value_buffer(v5, (uint64_t)qword_2543FAF48);
  swift_retain();
  v6 = sub_2446F5844();
  v7 = sub_2446F5CB8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = swift_slowAlloc();
    v9 = swift_slowAlloc();
    v10 = v9;
    *(_DWORD *)v8 = 136315394;
    sub_2446E9108(0xD000000000000022, 0x80000002446F7760, &v10);
    sub_2446F5D00();
    swift_release();
    *(_WORD *)(v8 + 12) = 2080;
    sub_2446E9108(a2, a3, &v10);
    sub_2446F5D00();
    _os_log_impl(&dword_2446DD000, v6, v7, "…Complete (%s.%s)", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v9, -1, -1);
    MEMORY[0x2495161CC](v8, -1, -1);

  }
  else
  {

    swift_release();
  }
}

NSObject *sub_2446F2374(uint64_t a1)
{
  uint64_t *v1;

  return sub_2446F1C70(a1, *v1);
}

void sub_2446F237C(void *a1, uint64_t a2)
{
  uint64_t *v2;

  sub_2446F1EB4(a1, a2, *v2);
}

void sub_2446F2384(void *a1)
{
  sub_2446F26BC(a1);
}

uint64_t sub_2446F238C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t result;

  result = sub_2446F1A60(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_2446F23B4()
{
  sub_2446F24AC();
  return sub_2446F5A24();
}

uint64_t sub_2446F2404()
{
  sub_2446F24AC();
  return sub_2446F59F4();
}

void sub_2446F2454()
{
  sub_2446F24AC();
  sub_2446F5A18();
  __break(1u);
}

uint64_t type metadata accessor for PreferencesControllerRepresentable.Coordinator()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for PreferencesControllerRepresentable()
{
  return &type metadata for PreferencesControllerRepresentable;
}

unint64_t sub_2446F24AC()
{
  unint64_t result;

  result = qword_2543F9798;
  if (!qword_2543F9798)
  {
    result = MEMORY[0x249516130](&unk_2446F77B0, &type metadata for PreferencesControllerRepresentable);
    atomic_store(result, (unint64_t *)&qword_2543F9798);
  }
  return result;
}

void sub_2446F24F0()
{
  uint64_t v0;
  os_log_type_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *oslog;
  uint64_t v5;

  if (qword_2543F9A20 != -1)
    swift_once();
  v0 = sub_2446F585C();
  __swift_project_value_buffer(v0, (uint64_t)qword_2543FAF48);
  oslog = sub_2446F5844();
  v1 = sub_2446F5CB8();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = swift_slowAlloc();
    v3 = swift_slowAlloc();
    v5 = v3;
    *(_DWORD *)v2 = 136315394;
    sub_2446E9108(0xD000000000000027, 0x80000002446FA0E0, &v5);
    sub_2446F5D00();
    *(_WORD *)(v2 + 12) = 2080;
    sub_2446E9108(0xD000000000000029, 0x80000002446FA110, &v5);
    sub_2446F5D00();
    _os_log_impl(&dword_2446DD000, oslog, v1, "…Complete (%s.%s)", (uint8_t *)v2, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v3, -1, -1);
    MEMORY[0x2495161CC](v2, -1, -1);

  }
  else
  {

  }
}

void sub_2446F26BC(void *a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  NSObject *v12;
  NSObject *v13;

  if (qword_2543F9A20 != -1)
    swift_once();
  v2 = sub_2446F585C();
  __swift_project_value_buffer(v2, (uint64_t)qword_2543FAF48);
  v3 = sub_2446F5844();
  v4 = sub_2446F5CB8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = swift_slowAlloc();
    v6 = swift_slowAlloc();
    v13 = v6;
    *(_DWORD *)v5 = 136315394;
    sub_2446E9108(0xD000000000000027, 0x80000002446FA0E0, (uint64_t *)&v13);
    sub_2446F5D00();
    *(_WORD *)(v5 + 12) = 2080;
    sub_2446E9108(0xD000000000000029, 0x80000002446FA110, (uint64_t *)&v13);
    sub_2446F5D00();
    _os_log_impl(&dword_2446DD000, v3, v4, "Start (%s.%s)…", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v6, -1, -1);
    MEMORY[0x2495161CC](v5, -1, -1);
  }

  v7 = a1;
  v8 = sub_2446F5844();
  v9 = sub_2446F5CB8();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412290;
    v13 = v7;
    v12 = v7;
    sub_2446F5D00();
    *v11 = v7;

    _os_log_impl(&dword_2446DD000, v8, v9, "Dismantle for %@.", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9B40);
    swift_arrayDestroy();
    MEMORY[0x2495161CC](v11, -1, -1);
    MEMORY[0x2495161CC](v10, -1, -1);
  }
  else
  {

    v8 = v7;
  }

  sub_2446EC290();
  sub_2446F24F0();
}

uint64_t storeEnumTagSinglePayload for SettingsAppFeatureFlags(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2446F29E4 + 4 * byte_2446F7885[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2446F2A18 + 4 * byte_2446F7880[v4]))();
}

uint64_t sub_2446F2A18(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2446F2A20(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2446F2A28);
  return result;
}

uint64_t sub_2446F2A34(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2446F2A3CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2446F2A40(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2446F2A48(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SettingsAppFeatureFlags()
{
  return &type metadata for SettingsAppFeatureFlags;
}

unint64_t sub_2446F2A68()
{
  unint64_t result;

  result = qword_25737B9D0;
  if (!qword_25737B9D0)
  {
    result = MEMORY[0x249516130](&unk_2446F78E8, &type metadata for SettingsAppFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_25737B9D0);
  }
  return result;
}

const char *sub_2446F2AAC()
{
  return "SettingsApp";
}

const char *sub_2446F2AC0()
{
  _BYTE *v0;

  if (*v0)
    return "ZeroKeywordSearch";
  else
    return "SettingsUndo";
}

uint64_t sub_2446F2AF0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2446F2B30()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for WeakBox(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for WeakBox);
}

void sub_2446F2B60(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  char v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  char isUniquelyReferenced_nonNull_native;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543F9B30);
  v35 = *(_QWORD *)(v6 - 8);
  v36 = v6;
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9B20);
  v34 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = objc_msgSend(a1, sel_navigationItem);
  v13 = objc_msgSend(a2, sel_navigationItem);
  v14 = sub_2446F3058((uint64_t)v12, (uint64_t)v13);

  if ((v14 & 1) == 0)
  {
    v15 = objc_msgSend(a1, sel_navigationItem);
    v33 = (uint64_t)v15;
    v16 = objc_msgSend(a2, sel_navigationItem);
    v32 = (uint64_t)v16;

    v17 = objc_msgSend(a2, sel_navigationItem);
    v18 = objc_msgSend(a1, sel_navigationItem);
    v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDCB0]), sel_initWithDestinationNavigationItem_sourceNavigationItem_, v17, v18);

    swift_getKeyPath();
    sub_2446F5760();
    swift_release();
    v19 = swift_allocObject();
    swift_weakInit();
    v20 = (_QWORD *)swift_allocObject();
    v20[2] = a2;
    v20[3] = v19;
    v20[4] = a1;
    sub_2446F3900((unint64_t *)&qword_2543F9B18, &qword_2543F9B20);
    v21 = a2;
    v22 = a1;
    v23 = sub_2446F58D4();
    swift_release();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v11, v9);
    swift_getKeyPath();
    sub_2446F5760();
    swift_release();
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = v22;
    *(_QWORD *)(v24 + 24) = v21;
    sub_2446F3900(&qword_2543F9B28, (uint64_t *)&unk_2543F9B30);
    v25 = v21;
    v26 = v22;
    v27 = v36;
    v28 = sub_2446F58D4();
    swift_release();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v8, v27);
    swift_beginAccess();
    v29 = v31;
    swift_retain();
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v37 = *(_QWORD *)(v3 + 16);
    *(_QWORD *)(v3 + 16) = 0x8000000000000000;
    sub_2446F4280((uint64_t)v29, v23, v28, v33, v32, isUniquelyReferenced_nonNull_native);
    *(_QWORD *)(v3 + 16) = v37;
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_release();
    swift_release();

  }
}

uint64_t sub_2446F2F18()
{
  sub_2446F5E44();
  sub_2446F5E50();
  sub_2446F5E50();
  return sub_2446F5E5C();
}

uint64_t sub_2446F2F70()
{
  sub_2446F5E50();
  return sub_2446F5E50();
}

uint64_t sub_2446F2FA8()
{
  sub_2446F5E44();
  sub_2446F5E50();
  sub_2446F5E50();
  return sub_2446F5E5C();
}

BOOL sub_2446F2FFC(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

unint64_t sub_2446F3014()
{
  uint64_t v0;
  unint64_t result;

  type metadata accessor for UINavigationItemProxyManager();
  v0 = swift_allocObject();
  result = sub_2446F4780(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v0 + 16) = result;
  qword_2543FAF40 = v0;
  return result;
}

uint64_t sub_2446F3058(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  char v7;
  void *v8;
  id v9;
  uint64_t v10;

  swift_beginAccess();
  v5 = *(_QWORD *)(v2 + 16);
  if (*(_QWORD *)(v5 + 16) && (v6 = sub_2446F3CEC(a1, a2), (v7 & 1) != 0))
  {
    v8 = *(void **)(*(_QWORD *)(v5 + 56) + 24 * v6);
    v9 = v8;
    swift_retain();
    swift_retain();
    v10 = 1;
  }
  else
  {
    v10 = 0;
    v8 = 0;
  }
  swift_endAccess();
  sub_2446F4748(v8);
  return v10;
}

_QWORD *sub_2446F3114(_QWORD *result, void *a2, uint64_t a3, void *a4)
{
  BOOL v4;

  if (*result)
    v4 = *result == (_QWORD)a2;
  else
    v4 = 0;
  if (!v4)
  {
    swift_beginAccess();
    result = (_QWORD *)swift_weakLoadStrong();
    if (result)
    {
      sub_2446F3194(a4, a2);
      return (_QWORD *)swift_release();
    }
  }
  return result;
}

void sub_2446F3194(void *a1, void *a2)
{
  id v4;
  id v5;
  char v6;
  id v7;
  id v8;
  void *v9;

  v4 = objc_msgSend(a1, sel_navigationItem);
  v5 = objc_msgSend(a2, sel_navigationItem);
  v6 = sub_2446F3058((uint64_t)v4, (uint64_t)v5);

  if ((v6 & 1) != 0)
  {
    v7 = objc_msgSend(a1, sel_navigationItem);
    v8 = objc_msgSend(a2, sel_navigationItem);

    swift_beginAccess();
    v9 = (void *)sub_2446F3C34((uint64_t)v7, (uint64_t)v8);
    swift_endAccess();
    if (v9)
    {
      sub_2446F58C8();
      sub_2446F58C8();
      swift_release();
      swift_release();

    }
  }
}

void sub_2446F32B8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = objc_msgSend(*a1, sel_toolbarItems);
  if (v3)
  {
    v4 = v3;
    sub_2446EE3C0(0, (unint64_t *)&unk_2543F9AD0);
    v5 = sub_2446F5C34();

  }
  else
  {
    v5 = 0;
  }
  *a2 = v5;
}

void sub_2446F3334(_QWORD *a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*a1)
  {
    sub_2446EE3C0(0, (unint64_t *)&unk_2543F9AD0);
    v3 = sub_2446F5C28();
  }
  else
  {
    v3 = 0;
  }
  v4 = (id)v3;
  objc_msgSend(v2, sel_setToolbarItems_);

}

void sub_2446F33A8(unint64_t *a1, id a2, void *a3)
{
  unint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  char v9;
  id v10;
  void *v11;
  unint64_t v12;
  unsigned __int8 v13;
  uint64_t v14;
  id v15;

  v4 = *a1;
  v5 = objc_msgSend(a2, sel_parentViewController);
  if (v5)
  {
    v6 = v5;
    sub_2446EE3C0(0, (unint64_t *)&qword_2543F9AE0);
    v7 = a3;
    v8 = v6;
    v9 = sub_2446F5CDC();

    if ((v9 & 1) != 0)
    {
      v10 = objc_msgSend(v7, sel_toolbarItems);
      if (v10)
      {
        v11 = v10;
        sub_2446EE3C0(0, (unint64_t *)&unk_2543F9AD0);
        v12 = sub_2446F5C34();

        if (!v4)
        {
          if (!v12)
            return;
          swift_bridgeObjectRelease();
          v14 = 0;
          goto LABEL_12;
        }
        if (v12)
        {
          swift_bridgeObjectRetain_n();
          v13 = sub_2446F3940(v4, v12);
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          if ((v13 & 1) != 0)
            return;
        }
      }
      else if (!v4)
      {
        return;
      }
      sub_2446EE3C0(0, (unint64_t *)&unk_2543F9AD0);
      v14 = sub_2446F5C28();
LABEL_12:
      v15 = (id)v14;
      objc_msgSend(v7, sel_setToolbarItems_);

    }
  }
}

uint64_t sub_2446F354C()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for UINavigationItemProxyManager()
{
  return objc_opt_self();
}

uint64_t destroy for UINavigationItemProxyManager.ProxyValue(id *a1)
{

  swift_release();
  return swift_release();
}

_QWORD *_s19PreferencesExtended28UINavigationItemProxyManagerC10ProxyValueVwCP_0(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  a1[2] = *(_QWORD *)(a2 + 16);
  v5 = v3;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for UINavigationItemProxyManager.ProxyValue(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for UINavigationItemProxyManager.ProxyValue(uint64_t a1, uint64_t a2)
{

  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for UINavigationItemProxyManager.ProxyValue(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for UINavigationItemProxyManager.ProxyValue(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for UINavigationItemProxyManager.ProxyValue()
{
  return &type metadata for UINavigationItemProxyManager.ProxyValue;
}

uint64_t getEnumTagSinglePayload for UINavigationItemProxyManager.ProxyKey(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)a1)
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for UINavigationItemProxyManager.ProxyKey(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 2)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)result = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for UINavigationItemProxyManager.ProxyKey()
{
  return &type metadata for UINavigationItemProxyManager.ProxyKey;
}

unint64_t sub_2446F380C()
{
  unint64_t result;

  result = qword_2543F9800;
  if (!qword_2543F9800)
  {
    result = MEMORY[0x249516130](&unk_2446F79E4, &type metadata for UINavigationItemProxyManager.ProxyKey);
    atomic_store(result, (unint64_t *)&qword_2543F9800);
  }
  return result;
}

uint64_t sub_2446F3854()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2446F3878()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

_QWORD *sub_2446F38AC(_QWORD *a1)
{
  uint64_t v1;

  return sub_2446F3114(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32));
}

char *keypath_get_selector_toolbarItems()
{
  return sel_toolbarItems;
}

uint64_t sub_2446F38CC()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_2446F38F8(unint64_t *a1)
{
  uint64_t v1;

  sub_2446F33A8(a1, *(id *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_2446F3900(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x249516130](MEMORY[0x24BDD0230], v4);
    atomic_store(result, a1);
  }
  return result;
}

id sub_2446F3940(unint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id result;
  void *v12;
  id v13;
  void *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  unint64_t v24;
  unint64_t v25;
  void **v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;

  v2 = a2;
  v3 = a1;
  v4 = a1 >> 62;
  if (!(a1 >> 62))
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    v6 = a2 >> 62;
    if (!(a2 >> 62))
      goto LABEL_3;
LABEL_47:
    swift_bridgeObjectRetain();
    v30 = sub_2446F5DA8();
    swift_bridgeObjectRelease();
    if (v5 == v30)
      goto LABEL_4;
LABEL_48:
    LOBYTE(v5) = 0;
    return (id)(v5 & 1);
  }
  swift_bridgeObjectRetain();
  v5 = sub_2446F5DA8();
  swift_bridgeObjectRelease();
  v6 = (unint64_t)v2 >> 62;
  if ((unint64_t)v2 >> 62)
    goto LABEL_47;
LABEL_3:
  if (v5 != *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_48;
LABEL_4:
  if (!v5)
    goto LABEL_37;
  v7 = v3 & 0xFFFFFFFFFFFFFF8;
  if (v3 < 0)
    v7 = v3;
  if (!v4)
    v7 = (v3 & 0xFFFFFFFFFFFFFF8) + 32;
  v8 = v2 & 0xFFFFFFFFFFFFFF8;
  v9 = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (v2 < 0)
    v10 = v2;
  else
    v10 = v2 & 0xFFFFFFFFFFFFFF8;
  if (v6)
    v9 = v10;
  if (v7 == v9)
  {
LABEL_37:
    LOBYTE(v5) = 1;
    return (id)(v5 & 1);
  }
  if ((v5 & 0x8000000000000000) != 0)
    goto LABEL_54;
  v31 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0)
    goto LABEL_55;
  for (result = *(id *)(v3 + 32); ; result = (id)MEMORY[0x249515C2C](0, v3))
  {
    v12 = result;
    if ((v2 & 0xC000000000000001) == 0)
      break;
    v13 = (id)MEMORY[0x249515C2C](0, v2);
LABEL_21:
    v14 = v13;
    sub_2446EE3C0(0, (unint64_t *)&unk_2543F9AD0);
    v15 = sub_2446F5CDC();

    if ((v15 & 1) == 0)
      goto LABEL_48;
    v16 = v5 - 1;
    if (v5 == 1)
      return (id)(v5 & 1);
    if (((v2 | v3) & 0xC000000000000001) != 0)
    {
      v17 = 0;
      v18 = v5 - 2;
      while (v16 != v17)
      {
        v5 = v17 + 1;
        if (v31)
          v19 = (id)MEMORY[0x249515C2C](v17 + 1, v3);
        else
          v19 = *(id *)(v3 + 40 + 8 * v17);
        v20 = v19;
        if ((v2 & 0xC000000000000001) != 0)
        {
          v21 = (id)MEMORY[0x249515C2C](v17 + 1, v2);
        }
        else
        {
          if (v5 >= *(_QWORD *)(v8 + 16))
            goto LABEL_53;
          v21 = *(id *)(v2 + 40 + 8 * v17);
        }
        v22 = v21;
        v5 = sub_2446F5CDC();

        if ((v5 & 1) != 0 && v18 != v17++)
          continue;
        return (id)(v5 & 1);
      }
      __break(1u);
    }
    else
    {
      v24 = *(_QWORD *)(v8 + 16);
      if (v24 <= 1)
        v24 = 1;
      v25 = v24 - 1;
      v26 = (void **)(v3 + 40);
      v8 = v2 + 40;
      while (v16)
      {
        if (!v25)
          goto LABEL_52;
        v28 = *v26++;
        v27 = v28;
        v29 = *(void **)v8;
        v8 += 8;
        v2 = v27;
        v3 = v29;
        v5 = sub_2446F5CDC();

        if ((v5 & 1) != 0)
        {
          --v25;
          if (--v16)
            continue;
        }
        return (id)(v5 & 1);
      }
    }
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    ;
  }
  if (*(_QWORD *)(v8 + 16))
  {
    v13 = *(id *)(v2 + 32);
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

uint64_t sub_2446F3C34(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v4;
  char v5;
  unint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v3 = v2;
  v4 = sub_2446F3CEC(a1, a2);
  if ((v5 & 1) == 0)
    return 0;
  v6 = v4;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = *v2;
  v11 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_2446F456C();
    v8 = v11;
  }
  v9 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 24 * v6);
  sub_2446F40A4(v6, v8);
  *v3 = v8;
  swift_bridgeObjectRelease();
  return v9;
}

unint64_t sub_2446F3CEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2446F5E44();
  sub_2446F5E50();
  sub_2446F5E50();
  v4 = sub_2446F5E5C();
  return sub_2446F442C(a1, a2, v4);
}

unint64_t sub_2446F3D58(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2446F5D3C();
  return sub_2446F44A8(a1, v2);
}

uint64_t sub_2446F3D88(uint64_t a1, char a2)
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
  __int128 v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  __int128 v35;
  __int128 v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543F9B48);
  result = sub_2446F5DC0();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v34 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v19 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v20 = v19 | (v8 << 6);
      }
      else
      {
        v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v21 >= v33)
          goto LABEL_33;
        v22 = v34[v21];
        ++v8;
        if (!v22)
        {
          v8 = v21 + 1;
          if (v21 + 1 >= v33)
            goto LABEL_33;
          v22 = v34[v8];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v32 = 1 << *(_BYTE *)(v5 + 32);
              if (v32 >= 64)
                bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v34 = -1 << v32;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v22 = v34[v23];
            if (!v22)
            {
              while (1)
              {
                v8 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_42;
                if (v8 >= v33)
                  goto LABEL_33;
                v22 = v34[v8];
                ++v23;
                if (v22)
                  goto LABEL_30;
              }
            }
            v8 = v23;
          }
        }
LABEL_30:
        v11 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      v28 = *(_OWORD *)(*(_QWORD *)(v5 + 48) + 16 * v20);
      v29 = *(_QWORD *)(v5 + 56) + 24 * v20;
      v35 = *(_OWORD *)v29;
      v36 = v28;
      v30 = *(_QWORD *)(v29 + 16);
      if ((a2 & 1) == 0)
      {
        v31 = (id)v35;
        swift_retain();
        swift_retain();
      }
      sub_2446F5E44();
      sub_2446F5E50();
      sub_2446F5E50();
      result = sub_2446F5E5C();
      v13 = -1 << *(_BYTE *)(v7 + 32);
      v14 = result & ~v13;
      v15 = v14 >> 6;
      if (((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
        v17 = v36;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v13) >> 6;
        v17 = v36;
        do
        {
          if (++v15 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v26 = v15 == v25;
          if (v15 == v25)
            v15 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v12 + 8 * v15);
        }
        while (v27 == -1);
        v16 = __clz(__rbit64(~v27)) + (v15 << 6);
      }
      *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(_OWORD *)(*(_QWORD *)(v7 + 48) + 16 * v16) = v17;
      v18 = *(_QWORD *)(v7 + 56) + 24 * v16;
      *(_OWORD *)v18 = v35;
      *(_QWORD *)(v18 + 16) = v30;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

unint64_t sub_2446F40A4(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  unint64_t v15;
  __int128 *v16;
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
    result = sub_2446F5D30();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_2446F5E44();
        sub_2446F5E50();
        sub_2446F5E50();
        result = sub_2446F5E5C();
        v10 = result & v7;
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
          v15 = v14 + 24 * v3;
          v16 = (__int128 *)(v14 + 24 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= (unint64_t)v16 + 24))
          {
            v9 = *v16;
            *(_QWORD *)(v15 + 16) = *((_QWORD *)v16 + 2);
            *(_OWORD *)v15 = v9;
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

void sub_2446F4280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  _QWORD *v6;
  _QWORD **v7;
  _QWORD *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  char v26;

  v7 = (_QWORD **)v6;
  v14 = (_QWORD *)*v6;
  v16 = sub_2446F3CEC(a4, a5);
  v17 = v14[2];
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
  }
  else
  {
    v20 = v15;
    v21 = v14[3];
    if (v21 >= v19 && (a6 & 1) != 0)
    {
LABEL_7:
      v22 = *v7;
      if ((v20 & 1) != 0)
      {
LABEL_8:
        v23 = v22[7] + 24 * v16;
        v24 = *(void **)v23;
        swift_release();
        swift_release();

        *(_QWORD *)v23 = a1;
        *(_QWORD *)(v23 + 8) = a2;
        *(_QWORD *)(v23 + 16) = a3;
        return;
      }
      goto LABEL_11;
    }
    if (v21 >= v19 && (a6 & 1) == 0)
    {
      sub_2446F456C();
      goto LABEL_7;
    }
    sub_2446F3D88(v19, a6 & 1);
    v25 = sub_2446F3CEC(a4, a5);
    if ((v20 & 1) == (v26 & 1))
    {
      v16 = v25;
      v22 = *v7;
      if ((v20 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_2446F43D8(v16, a4, a5, a1, a2, a3, v22);
      return;
    }
  }
  sub_2446F5DFC();
  __break(1u);
}

unint64_t sub_2446F43D8(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  a7[(result >> 6) + 8] |= 1 << result;
  v7 = (_QWORD *)(a7[6] + 16 * result);
  *v7 = a2;
  v7[1] = a3;
  v8 = (_QWORD *)(a7[7] + 24 * result);
  *v8 = a4;
  v8[1] = a5;
  v8[2] = a6;
  v9 = a7[2];
  v10 = __OFADD__(v9, 1);
  v11 = v9 + 1;
  if (v10)
    __break(1u);
  else
    a7[2] = v11;
  return result;
}

unint64_t sub_2446F442C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = -1 << *(_BYTE *)(v3 + 32);
  result = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = ~v5;
    do
    {
      v8 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * result);
      v10 = *v8;
      v9 = v8[1];
      if (v10 == a1 && v9 == a2)
        break;
      result = (result + 1) & v7;
    }
    while (((*(_QWORD *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

unint64_t sub_2446F44A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_2446F48E4(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x249515BFC](v9, a1);
      sub_2446EE240((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void *sub_2446F456C()
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
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  id v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543F9B48);
  v2 = *v0;
  v3 = sub_2446F5DB4();
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
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = 24 * v15;
    v18 = *(_QWORD *)(v2 + 56) + v17;
    v19 = *(_QWORD *)(v18 + 16);
    v20 = *(_OWORD *)v18;
    *(_OWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_OWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v21 = *(_QWORD *)(v4 + 56) + v17;
    *(_OWORD *)v21 = v20;
    *(_QWORD *)(v21 + 16) = v19;
    v22 = (id)v20;
    swift_retain();
    result = (void *)swift_retain();
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2446F4748(void *result)
{
  if (result)
  {

    swift_release();
    return (void *)swift_release();
  }
  return result;
}

unint64_t sub_2446F4780(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  __int128 v8;
  char v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  id v18;
  char v19;
  id v20;
  __int128 v21;
  __int128 v22;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543F9B48);
  v3 = (_QWORD *)sub_2446F5DCC();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v21 = *(_OWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 64);
  result = sub_2446F3CEC(v4, v5);
  v8 = v21;
  if ((v9 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    v20 = (id)v8;
    swift_retain();
    swift_retain();
    return (unint64_t)v3;
  }
  v10 = (_QWORD *)(a1 + 104);
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v4;
    v11[1] = v5;
    v12 = v3[7] + 24 * result;
    *(_OWORD *)v12 = v8;
    *(_QWORD *)(v12 + 16) = v6;
    v13 = v3[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      break;
    v3[2] = v15;
    if (!--v1)
      goto LABEL_8;
    v16 = v10 + 5;
    v4 = *(v10 - 4);
    v5 = *(v10 - 3);
    v22 = *((_OWORD *)v10 - 1);
    v17 = *v10;
    v18 = (id)v8;
    swift_retain();
    swift_retain();
    result = sub_2446F3CEC(v4, v5);
    v10 = v16;
    v6 = v17;
    v8 = v22;
    if ((v19 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_2446F48E4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

id static NSBundle.preferencesPlugin(name:location:)()
{
  return sub_2446F5294();
}

uint64_t static NSBundle.PreferencesPluginLocation.default.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2446F4E18(&qword_2543F9B00, (uint64_t)qword_2543F9AE8, a1);
}

uint64_t sub_2446F4954()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9748);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2446F576C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for NSBundle.PreferencesPluginLocation();
  __swift_allocate_value_buffer(v7, qword_2543F9AE8);
  __swift_project_value_buffer(v7, (uint64_t)qword_2543F9AE8);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDCD790], v3);
  v8 = sub_2446F57D8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v2, 1, 1, v8);
  return sub_2446F57CC();
}

uint64_t NSBundle.PreferencesPluginLocation.init(path:)()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9748);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v8 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2446F576C();
  MEMORY[0x24BDAC7A8](v3);
  (*(void (**)(char *, _QWORD))(v5 + 104))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x24BDCD790]);
  v6 = sub_2446F57D8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v2, 1, 1, v6);
  return sub_2446F57CC();
}

uint64_t sub_2446F4B80()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9748);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2446F576C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for NSBundle.PreferencesPluginLocation();
  __swift_allocate_value_buffer(v7, qword_25737B9D8);
  __swift_project_value_buffer(v7, (uint64_t)qword_25737B9D8);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDCD790], v3);
  v8 = sub_2446F57D8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v2, 1, 1, v8);
  return sub_2446F57CC();
}

uint64_t static NSBundle.PreferencesPluginLocation.appleInternal.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2446F4E18(&qword_25737B638, (uint64_t)qword_25737B9D8, a1);
}

uint64_t sub_2446F4CCC()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F9748);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2446F576C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for NSBundle.PreferencesPluginLocation();
  __swift_allocate_value_buffer(v7, qword_25737B9F0);
  __swift_project_value_buffer(v7, (uint64_t)qword_25737B9F0);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDCD790], v3);
  v8 = sub_2446F57D8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v2, 1, 1, v8);
  return sub_2446F57CC();
}

uint64_t static NSBundle.PreferencesPluginLocation.privacy.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2446F4E18(qword_25737B640, (uint64_t)qword_25737B9F0, a1);
}

uint64_t sub_2446F4E18@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = type metadata accessor for NSBundle.PreferencesPluginLocation();
  v6 = __swift_project_value_buffer(v5, a2);
  return sub_2446F5450(v6, a3);
}

uint64_t NSBundle.PreferencesPluginLocation.description.getter()
{
  uint64_t v0;

  sub_2446F5D60();
  type metadata accessor for NSBundle.PreferencesPluginLocation();
  v0 = sub_2446F5E68();
  swift_bridgeObjectRelease();
  sub_2446F5C10();
  sub_2446F5778();
  sub_2446F5C10();
  swift_bridgeObjectRelease();
  sub_2446F5C10();
  return v0;
}

uint64_t NSBundle.PreferencesPluginLocation.hash(into:)()
{
  sub_2446F57D8();
  sub_2446E18F0((unint64_t *)&unk_25737B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  return sub_2446F5BE0();
}

uint64_t NSBundle.PreferencesPluginLocation.hashValue.getter()
{
  sub_2446F5E44();
  sub_2446F57D8();
  sub_2446E18F0((unint64_t *)&unk_25737B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  sub_2446F5BE0();
  return sub_2446F5E5C();
}

uint64_t sub_2446F4FE0()
{
  sub_2446F5E44();
  sub_2446F57D8();
  sub_2446E18F0((unint64_t *)&unk_25737B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  sub_2446F5BE0();
  return sub_2446F5E5C();
}

uint64_t sub_2446F504C()
{
  sub_2446F57D8();
  sub_2446E18F0((unint64_t *)&unk_25737B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  return sub_2446F5BE0();
}

uint64_t sub_2446F50A4()
{
  sub_2446F5E44();
  sub_2446F57D8();
  sub_2446E18F0((unint64_t *)&unk_25737B9C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  sub_2446F5BE0();
  return sub_2446F5E5C();
}

uint64_t sub_2446F5118()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  _BYTE *v6;
  void (*v7)(_BYTE *, uint64_t);
  id v8;
  void *v9;
  unsigned __int8 v10;
  _BYTE v12[7];
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v0 = sub_2446F57D8();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = &v12[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v2);
  v6 = &v12[-v5];
  sub_2446F5790();
  sub_2446F579C();
  v7 = *(void (**)(_BYTE *, uint64_t))(v1 + 8);
  v7(v4, v0);
  v13 = 0;
  v8 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_2446F57C0();
  v9 = (void *)sub_2446F5BEC();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v8, sel_fileExistsAtPath_isDirectory_, v9, &v13);

  v7(v6, v0);
  return (v10 & v13);
}

id sub_2446F5294()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  id v7;
  void (*v8)(char *, uint64_t);
  id v9;
  void *v10;
  _BYTE *v11;
  _QWORD v13[2];

  v0 = sub_2446F57D8();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v13 - v5;
  sub_2446F5790();
  v7 = v4;
  sub_2446F579C();
  v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  if ((sub_2446F5118() & 1) != 0
    && (v9 = objc_allocWithZone(MEMORY[0x24BDD1488]),
        v10 = (void *)sub_2446F5784(),
        v7 = objc_msgSend(v9, sel_initWithURL_, v10),
        v10,
        v7))
  {
    v8(v6, v0);
  }
  else
  {
    sub_2446EE37C();
    swift_allocError();
    *v11 = 0;
    swift_willThrow();
    v8(v6, v0);
  }
  return v7;
}

uint64_t type metadata accessor for NSBundle.PreferencesPluginLocation()
{
  uint64_t result;

  result = qword_2543F9B08;
  if (!qword_2543F9B08)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2446F5450(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NSBundle.PreferencesPluginLocation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2446F5494()
{
  return sub_2446E18F0(&qword_25737BA08, (uint64_t (*)(uint64_t))type metadata accessor for NSBundle.PreferencesPluginLocation, (uint64_t)&protocol conformance descriptor for NSBundle.PreferencesPluginLocation);
}

uint64_t _s25PreferencesPluginLocationVwCP(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2446F57D8();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t _s25PreferencesPluginLocationVwxx(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2446F57D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t _s25PreferencesPluginLocationVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2446F57D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t _s25PreferencesPluginLocationVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2446F57D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t _s25PreferencesPluginLocationVwtk(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2446F57D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t _s25PreferencesPluginLocationVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2446F57D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t _s25PreferencesPluginLocationVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2446F564C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2446F57D8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t _s25PreferencesPluginLocationVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2446F5694(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2446F57D8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_2446F56D4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2446F57D8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2446F573C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2446F5748()
{
  return MEMORY[0x24BDCD308]();
}

uint64_t sub_2446F5754()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_2446F5760()
{
  return MEMORY[0x24BDCD728]();
}

uint64_t sub_2446F576C()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_2446F5778()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_2446F5784()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2446F5790()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_2446F579C()
{
  return MEMORY[0x24BDCD938]();
}

uint64_t sub_2446F57A8()
{
  return MEMORY[0x24BDCD988]();
}

uint64_t sub_2446F57B4()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_2446F57C0()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_2446F57CC()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t sub_2446F57D8()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t _s19PreferencesExtended21SettingsAnyViewRecipeV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_2446F57F0()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_2446F57FC()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2446F5808()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_2446F5814()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_2446F5820()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_2446F582C()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_2446F5838()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_2446F5844()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2446F5850()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2446F585C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2446F5868()
{
  return MEMORY[0x24BEBC138]();
}

uint64_t sub_2446F5874()
{
  return MEMORY[0x24BEBC140]();
}

uint64_t sub_2446F5880()
{
  return MEMORY[0x24BEBC150]();
}

uint64_t sub_2446F588C()
{
  return MEMORY[0x24BEBC228]();
}

uint64_t sub_2446F5898()
{
  return MEMORY[0x24BEBC230]();
}

uint64_t sub_2446F58A4()
{
  return MEMORY[0x24BEBC238]();
}

uint64_t sub_2446F58B0()
{
  return MEMORY[0x24BEBC240]();
}

uint64_t sub_2446F58BC()
{
  return MEMORY[0x24BEBC248]();
}

uint64_t sub_2446F58C8()
{
  return MEMORY[0x24BDB9B50]();
}

uint64_t sub_2446F58D4()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_2446F58E0()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_2446F58EC()
{
  return MEMORY[0x24BDEC648]();
}

uint64_t sub_2446F58F8()
{
  return MEMORY[0x24BDEC938]();
}

uint64_t sub_2446F5904()
{
  return MEMORY[0x24BDEC940]();
}

uint64_t sub_2446F5910()
{
  return MEMORY[0x24BDEC948]();
}

uint64_t sub_2446F591C()
{
  return MEMORY[0x24BDEC950]();
}

uint64_t sub_2446F5928()
{
  return MEMORY[0x24BDEC958]();
}

uint64_t sub_2446F5934()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_2446F5940()
{
  return MEMORY[0x24BDED3B0]();
}

uint64_t sub_2446F594C()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_2446F5958()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_2446F5964()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_2446F5970()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_2446F597C()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_2446F5988()
{
  return MEMORY[0x24BDEE510]();
}

uint64_t sub_2446F5994()
{
  return MEMORY[0x24BDEE518]();
}

uint64_t sub_2446F59A0()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_2446F59AC()
{
  return MEMORY[0x24BDEF1A0]();
}

uint64_t sub_2446F59B8()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_2446F59C4()
{
  return MEMORY[0x24BDF0350]();
}

uint64_t sub_2446F59D0()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_2446F59DC()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_2446F59E8()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_2446F59F4()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_2446F5A00()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_2446F5A0C()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_2446F5A18()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_2446F5A24()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_2446F5A30()
{
  return MEMORY[0x24BDF0FC8]();
}

uint64_t sub_2446F5A3C()
{
  return MEMORY[0x24BDF0FD0]();
}

uint64_t sub_2446F5A48()
{
  return MEMORY[0x24BDF0FD8]();
}

uint64_t sub_2446F5A54()
{
  return MEMORY[0x24BDF13A0]();
}

uint64_t sub_2446F5A60()
{
  return MEMORY[0x24BDF13A8]();
}

uint64_t sub_2446F5A6C()
{
  return MEMORY[0x24BDF13B0]();
}

uint64_t sub_2446F5A78()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_2446F5A84()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_2446F5A90()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_2446F5A9C()
{
  return MEMORY[0x24BDF1840]();
}

uint64_t sub_2446F5AA8()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_2446F5AB4()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_2446F5AC0()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_2446F5ACC()
{
  return MEMORY[0x24BDF2370]();
}

uint64_t sub_2446F5AD8()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_2446F5AE4()
{
  return MEMORY[0x24BDF3088]();
}

uint64_t sub_2446F5AF0()
{
  return MEMORY[0x24BDF3C78]();
}

uint64_t sub_2446F5AFC()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_2446F5B08()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_2446F5B14()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_2446F5B20()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_2446F5B2C()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_2446F5B38()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_2446F5B44()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_2446F5B50()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_2446F5B5C()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_2446F5B68()
{
  return MEMORY[0x24BDF5260]();
}

uint64_t sub_2446F5B74()
{
  return MEMORY[0x24BE85560]();
}

uint64_t sub_2446F5B80()
{
  return MEMORY[0x24BE85568]();
}

uint64_t sub_2446F5B8C()
{
  return MEMORY[0x24BE85570]();
}

uint64_t sub_2446F5B98()
{
  return MEMORY[0x24BE85578]();
}

uint64_t sub_2446F5BA4()
{
  return MEMORY[0x24BE85580]();
}

uint64_t sub_2446F5BB0()
{
  return MEMORY[0x24BE85588]();
}

uint64_t sub_2446F5BBC()
{
  return MEMORY[0x24BE85590]();
}

uint64_t sub_2446F5BC8()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2446F5BD4()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2446F5BE0()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_2446F5BEC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2446F5BF8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2446F5C04()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2446F5C10()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2446F5C1C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2446F5C28()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2446F5C34()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2446F5C40()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2446F5C4C()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_2446F5C58()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_2446F5C64()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2446F5C70()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2446F5C7C()
{
  return MEMORY[0x24BE85658]();
}

uint64_t sub_2446F5C88()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2446F5C94()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2446F5CA0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2446F5CAC()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_2446F5CB8()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2446F5CC4()
{
  return MEMORY[0x24BEBCCF8]();
}

uint64_t sub_2446F5CD0()
{
  return MEMORY[0x24BEBCD00]();
}

uint64_t sub_2446F5CDC()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2446F5CE8()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_2446F5CF4()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2446F5D00()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2446F5D0C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2446F5D18()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2446F5D24()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2446F5D30()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_2446F5D3C()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_2446F5D48()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_2446F5D54()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_2446F5D60()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2446F5D6C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2446F5D78()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2446F5D84()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2446F5D90()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2446F5D9C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2446F5DA8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2446F5DB4()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2446F5DC0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2446F5DCC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2446F5DD8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2446F5DE4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2446F5DF0()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_2446F5DFC()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2446F5E08()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2446F5E14()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2446F5E20()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2446F5E2C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2446F5E38()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2446F5E44()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2446F5E50()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2446F5E5C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2446F5E68()
{
  return MEMORY[0x24BEE4A98]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t SFObjectAndOffsetForURLPair()
{
  return MEMORY[0x24BE85778]();
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x24BEE4C50]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastTypeToObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C80]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x24BEE4DE8]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
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

