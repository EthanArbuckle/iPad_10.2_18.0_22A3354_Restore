void NLConstants.asNamespace.getter(char a1)
{
  sub_21C27A6DC();
  swift_bridgeObjectRelease();
  __asm { BR              X10 }
}

uint64_t sub_21C2625D4()
{
  uint64_t v1;

  sub_21C27A634();
  swift_bridgeObjectRelease();
  sub_21C27A658();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t NLConstants.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_21C2626B8 + 4 * byte_21C27AB16[a1]))(0xD000000000000012, 0x800000021C27C120);
}

uint64_t sub_21C2626B8()
{
  return 0x636E656772656D65;
}

uint64_t sub_21C2626E8(uint64_t a1)
{
  return a1 + 3;
}

void sub_21C262720(char *a1)
{
  sub_21C26E3BC(*a1);
}

void sub_21C26272C()
{
  char *v0;

  sub_21C271954(*v0);
}

void sub_21C262734(uint64_t a1)
{
  char *v1;

  sub_21C272118(a1, *v1);
}

void sub_21C26273C(uint64_t a1)
{
  char *v1;

  sub_21C27254C(a1, *v1);
}

uint64_t sub_21C262744@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s20SiriEmergencyIntents11NLConstantsO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_21C262770@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = NLConstants.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_21C26279C()
{
  char *v0;

  NLConstants.asNamespace.getter(*v0);
}

uint64_t NLv4IdentifierNamespace.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_21C2627E4 + 4 * byte_21C27AB1C[a1]))(0xD000000000000015, 0x800000021C27C160);
}

unint64_t sub_21C2627E4()
{
  return 0xD000000000000012;
}

uint64_t sub_21C262840()
{
  return 0x54746361746E6F63;
}

uint64_t sub_21C262860()
{
  return 0x707954656E6F6870;
}

uint64_t sub_21C26287C()
{
  return 0x614E746E65746E69;
}

void sub_21C262898(char *a1)
{
  sub_21C26DB48(*a1);
}

uint64_t sub_21C2628A4()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_21C27A7A8();
  sub_21C271E50((uint64_t)v3, v1);
  return sub_21C27A7C0();
}

void sub_21C2628E8(uint64_t a1)
{
  char *v1;

  sub_21C271E50(a1, *v1);
}

uint64_t sub_21C2628F0()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_21C27A7A8();
  sub_21C271E50((uint64_t)v3, v1);
  return sub_21C27A7C0();
}

uint64_t sub_21C262930@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s20SiriEmergencyIntents23NLv4IdentifierNamespaceO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_21C26295C@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = NLv4IdentifierNamespace.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t NLv4EntityAttributeName.rawValue.getter(char a1)
{
  return *(_QWORD *)&aLabel_1[8 * a1];
}

uint64_t sub_21C2629A8(char *a1, char *a2)
{
  return sub_21C26DD84(*a1, *a2);
}

uint64_t sub_21C2629B4()
{
  return sub_21C271A40();
}

uint64_t sub_21C2629BC()
{
  return sub_21C271F60();
}

uint64_t sub_21C2629C4()
{
  return sub_21C272820();
}

uint64_t sub_21C2629CC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s20SiriEmergencyIntents23NLv4EntityAttributeNameO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_21C2629F8@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = NLv4EntityAttributeName.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t variable initialization expression of EmergencyOrganizationInfoProvider.resourceDecoder()
{
  return 0;
}

uint64_t _s20SiriEmergencyIntents11NLConstantsO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_21C27A730();
  swift_bridgeObjectRelease();
  if (v0 >= 6)
    return 6;
  else
    return v0;
}

uint64_t _s20SiriEmergencyIntents23NLv4IdentifierNamespaceO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_21C27A730();
  swift_bridgeObjectRelease();
  if (v0 >= 9)
    return 9;
  else
    return v0;
}

uint64_t _s20SiriEmergencyIntents23NLv4EntityAttributeNameO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_21C27A730();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

unint64_t sub_21C262B08()
{
  unint64_t result;

  result = qword_255252510;
  if (!qword_255252510)
  {
    result = MEMORY[0x2207778C0](&protocol conformance descriptor for NLConstants, &type metadata for NLConstants);
    atomic_store(result, (unint64_t *)&qword_255252510);
  }
  return result;
}

unint64_t sub_21C262B50()
{
  unint64_t result;

  result = qword_255252518;
  if (!qword_255252518)
  {
    result = MEMORY[0x2207778C0](&protocol conformance descriptor for NLv4IdentifierNamespace, &type metadata for NLv4IdentifierNamespace);
    atomic_store(result, (unint64_t *)&qword_255252518);
  }
  return result;
}

unint64_t sub_21C262B98()
{
  unint64_t result;

  result = qword_255252520;
  if (!qword_255252520)
  {
    result = MEMORY[0x2207778C0](&protocol conformance descriptor for NLv4EntityAttributeName, &type metadata for NLv4EntityAttributeName);
    atomic_store(result, (unint64_t *)&qword_255252520);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NLConstants(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for NLConstants(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_21C262CC8 + 4 * byte_21C27AB2A[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_21C262CFC + 4 * byte_21C27AB25[v4]))();
}

uint64_t sub_21C262CFC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C262D04(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C262D0CLL);
  return result;
}

uint64_t sub_21C262D18(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C262D20);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_21C262D24(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C262D2C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C262D38(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21C262D44(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for NLConstants()
{
  return &type metadata for NLConstants;
}

uint64_t getEnumTagSinglePayload for NLv4IdentifierNamespace(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF8)
    goto LABEL_17;
  if (a2 + 8 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 8) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 8;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 8;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 8;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v8 = v6 - 9;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for NLv4IdentifierNamespace(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21C262E38 + 4 * byte_21C27AB34[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_21C262E6C + 4 * byte_21C27AB2F[v4]))();
}

uint64_t sub_21C262E6C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C262E74(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C262E7CLL);
  return result;
}

uint64_t sub_21C262E88(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C262E90);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_21C262E94(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C262E9C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NLv4IdentifierNamespace()
{
  return &type metadata for NLv4IdentifierNamespace;
}

uint64_t getEnumTagSinglePayload for NLv4EntityAttributeName(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for NLv4EntityAttributeName(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21C262F94 + 4 * byte_21C27AB3E[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21C262FC8 + 4 * byte_21C27AB39[v4]))();
}

uint64_t sub_21C262FC8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C262FD0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C262FD8);
  return result;
}

uint64_t sub_21C262FE4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C262FECLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21C262FF0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C262FF8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NLv4EntityAttributeName()
{
  return &type metadata for NLv4EntityAttributeName;
}

uint64_t EmergencyCallIntent.emergencySituation.getter(unsigned int a1)
{
  return a1 >> 8;
}

uint64_t EmergencyCallIntent.isDirectCall.getter(unsigned int a1)
{
  return HIWORD(a1) & 1;
}

SiriEmergencyIntents::EmergencyCallIntent __swiftcall EmergencyCallIntent.init(emergencyOrganization:emergencySituation:isDirectCall:)(SiriEmergencyIntents::EmergencyOrganization_optional emergencyOrganization, SiriEmergencyIntents::EmergencySituation_optional emergencySituation, Swift::Bool isDirectCall)
{
  int v3;

  if (isDirectCall)
    v3 = 0x10000;
  else
    v3 = 0;
  return (SiriEmergencyIntents::EmergencyCallIntent)(v3 & 0xFFFF0000 | (emergencySituation.value << 8) | emergencyOrganization.value);
}

uint64_t __swift_memcpy3_1(uint64_t result, __int16 *a2)
{
  __int16 v2;

  v2 = *a2;
  *(_BYTE *)(result + 2) = *((_BYTE *)a2 + 2);
  *(_WORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for EmergencyCallIntent(unsigned __int16 *a1, unsigned int a2)
{
  int v2;
  unsigned int v4;
  BOOL v5;
  int v6;

  if (!a2)
    return 0;
  if (a2 >= 0xFF)
  {
    if ((a2 + 33554177) >> 24)
    {
      v2 = *((unsigned __int8 *)a1 + 3);
      if (*((_BYTE *)a1 + 3))
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776961;
    }
    else
    {
      v2 = *(unsigned __int16 *)((char *)a1 + 3);
      if (*(unsigned __int16 *)((char *)a1 + 3))
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776961;
    }
  }
  v4 = *((unsigned __int8 *)a1 + 2);
  v5 = v4 >= 2;
  v6 = (v4 + 2147483646) & 0x7FFFFFFF;
  if (!v5)
    v6 = -1;
  return (v6 + 1);
}

uint64_t storeEnumTagSinglePayload for EmergencyCallIntent(uint64_t result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;

  if ((a3 + 33554177) >> 24)
    v3 = 1;
  else
    v3 = 2;
  if (a3 <= 0xFE)
    v3 = 0;
  if (a2 > 0xFE)
  {
    *(_WORD *)result = a2 - 255;
    *(_BYTE *)(result + 2) = (a2 - 255) >> 16;
    if (v3)
    {
      v4 = ((a2 - 255) >> 24) + 1;
      if (v3 == 2)
        *(_WORD *)(result + 3) = v4;
      else
        *(_BYTE *)(result + 3) = v4;
    }
  }
  else
  {
    if (!v3)
      goto LABEL_10;
    if (v3 == 2)
    {
      *(_WORD *)(result + 3) = 0;
LABEL_10:
      if (!a2)
        return result;
LABEL_16:
      *(_BYTE *)(result + 2) = a2 + 1;
      return result;
    }
    *(_BYTE *)(result + 3) = 0;
    if (a2)
      goto LABEL_16;
  }
  return result;
}

ValueMetadata *type metadata accessor for EmergencyCallIntent()
{
  return &type metadata for EmergencyCallIntent;
}

Swift::String __swiftcall EmergencyConfirmation.toPromptResponseOption()()
{
  uint64_t v0;
  void *v1;
  Swift::String result;

  sub_21C27A6DC();
  swift_bridgeObjectRelease();
  sub_21C27A634();
  sub_21C27A658();
  swift_bridgeObjectRelease();
  sub_21C27A658();
  sub_21C27A658();
  swift_bridgeObjectRelease();
  v0 = 0xD000000000000012;
  v1 = (void *)0x800000021C27CCE0;
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t EmergencyConfirmation.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 28526;
  else
    return 7562617;
}

SiriEmergencyIntents::EmergencyConfirmation_optional __swiftcall EmergencyConfirmation.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1;
  SiriEmergencyIntents::EmergencyConfirmation_optional v2;

  v1 = sub_21C27A730();
  swift_bridgeObjectRelease();
  if (v1 == 1)
    v2.value = SiriEmergencyIntents_EmergencyConfirmation_no;
  else
    v2.value = SiriEmergencyIntents_EmergencyConfirmation_unknownDefault;
  if (v1)
    return v2;
  else
    return 0;
}

uint64_t sub_21C2632DC(char *a1, char *a2)
{
  return sub_21C26E330(*a1, *a2);
}

unint64_t sub_21C2632EC()
{
  unint64_t result;

  result = qword_255252528;
  if (!qword_255252528)
  {
    result = MEMORY[0x2207778C0](&protocol conformance descriptor for EmergencyConfirmation, &type metadata for EmergencyConfirmation);
    atomic_store(result, (unint64_t *)&qword_255252528);
  }
  return result;
}

uint64_t sub_21C263330()
{
  return sub_21C271AA8();
}

uint64_t sub_21C263338()
{
  return sub_21C272300();
}

uint64_t sub_21C263340()
{
  return sub_21C272344();
}

uint64_t sub_21C263348@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_21C27A730();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_21C2633A4@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = EmergencyConfirmation.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t getEnumTagSinglePayload for EmergencyConfirmation(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for EmergencyConfirmation(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21C2634A8 + 4 * byte_21C27AE45[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21C2634DC + 4 * asc_21C27AE40[v4]))();
}

uint64_t sub_21C2634DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C2634E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C2634ECLL);
  return result;
}

uint64_t sub_21C2634F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C263500);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21C263504(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C26350C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_21C263518(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for EmergencyConfirmation()
{
  return &type metadata for EmergencyConfirmation;
}

Swift::String __swiftcall InstrumentationTask.taskType()()
{
  char v0;
  BOOL v1;
  uint64_t v2;
  void *v3;
  Swift::String result;

  v1 = (v0 & 1) == 0;
  if ((v0 & 1) != 0)
    v2 = 0x65726953706F7453;
  else
    v2 = 0x7269537472617453;
  if (v1)
    v3 = (void *)0xEA00000000006E65;
  else
    v3 = (void *)0xE90000000000006ELL;
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

uint64_t InstrumentationTask.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0x65726953706F7453;
  else
    return 0x7269537472617453;
}

SiriEmergencyIntents::InstrumentationTask_optional __swiftcall InstrumentationTask.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1;
  SiriEmergencyIntents::InstrumentationTask_optional v2;

  v1 = sub_21C27A730();
  swift_bridgeObjectRelease();
  if (v1 == 1)
    v2.value = SiriEmergencyIntents_InstrumentationTask_StopSiren;
  else
    v2.value = SiriEmergencyIntents_InstrumentationTask_unknownDefault;
  if (v1)
    return v2;
  else
    return 0;
}

uint64_t sub_21C263604(char *a1, char *a2)
{
  return sub_21C26DE08(*a1, *a2);
}

unint64_t sub_21C263614()
{
  unint64_t result;

  result = qword_255252530;
  if (!qword_255252530)
  {
    result = MEMORY[0x2207778C0](&protocol conformance descriptor for InstrumentationTask, &type metadata for InstrumentationTask);
    atomic_store(result, (unint64_t *)&qword_255252530);
  }
  return result;
}

uint64_t sub_21C263658()
{
  return sub_21C271B14();
}

uint64_t sub_21C263660()
{
  return sub_21C271FA0();
}

uint64_t sub_21C263668()
{
  return sub_21C27279C();
}

uint64_t sub_21C263670@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_21C27A730();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_21C2636CC@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = InstrumentationTask.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t storeEnumTagSinglePayload for InstrumentationTask(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21C263740 + 4 * byte_21C27AF35[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21C263774 + 4 * asc_21C27AF30[v4]))();
}

uint64_t sub_21C263774(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C26377C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C263784);
  return result;
}

uint64_t sub_21C263790(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C263798);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21C26379C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C2637A4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for InstrumentationTask()
{
  return &type metadata for InstrumentationTask;
}

uint64_t DirectInvocationURI.payloadKey.getter(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD v14[2];
  uint64_t v15;

  v2 = sub_21C27A5E0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 == 1)
    return 0x614E746E65746E69;
  v6 = 0xD00000000000001FLL;
  if (a1 != 3)
  {
    if (a1 == 2)
    {
      return 0x72506E6F74747562;
    }
    else
    {
      v7 = sub_21C27A5C8();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v7, v2);
      v8 = sub_21C27A5D4();
      v9 = sub_21C27A694();
      if (os_log_type_enabled(v8, v9))
      {
        v10 = (uint8_t *)swift_slowAlloc();
        v14[0] = swift_slowAlloc();
        v15 = v14[0];
        *(_DWORD *)v10 = 136315138;
        if (a1)
          v11 = 0x800000021C27C370;
        else
          v11 = 0x800000021C27C270;
        v14[1] = sub_21C263BE4(0xD000000000000034, v11, &v15);
        sub_21C27A6AC();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21C260000, v8, v9, "Undefined payloadKey for this DirectInvocationURI: %s", v10, 0xCu);
        v12 = v14[0];
        swift_arrayDestroy();
        MEMORY[0x220777920](v12, -1, -1);
        MEMORY[0x220777920](v10, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      return 0;
    }
  }
  return v6;
}

uint64_t DirectInvocationURI.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_21C263A50 + 4 * byte_21C27B020[a1]))(0xD000000000000034, 0x800000021C27C270);
}

uint64_t sub_21C263A50(uint64_t a1)
{
  return a1 - 2;
}

void sub_21C263A98(char *a1)
{
  sub_21C26DEB0(*a1);
}

void sub_21C263AA4()
{
  char *v0;

  sub_21C271B9C(*v0);
}

void sub_21C263AAC(uint64_t a1)
{
  char *v1;

  sub_21C272000(a1, *v1);
}

void sub_21C263AB4(uint64_t a1)
{
  char *v1;

  sub_21C2726D4(a1, *v1);
}

uint64_t sub_21C263ABC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s20SiriEmergencyIntents19DirectInvocationURIO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_21C263AE8@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = DirectInvocationURI.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_21C263B10(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_21C263B20(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_21C263B54(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_21C263B74(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_21C263BE4(v6, v7, a3);
  v8 = *a1 + 8;
  sub_21C27A6AC();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_21C263BE4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_21C263CB4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21C264440((uint64_t)v12, *a3);
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
      sub_21C264440((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_21C263CB4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_21C27A6B8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_21C263E6C(a5, a6);
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
  v8 = sub_21C27A700();
  if (!v8)
  {
    sub_21C27A70C();
    __break(1u);
LABEL_17:
    result = sub_21C27A724();
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

uint64_t sub_21C263E6C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21C263F00(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_21C2640D8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_21C2640D8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21C263F00(uint64_t a1, unint64_t a2)
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
      v3 = sub_21C264074(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_21C27A6E8();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_21C27A70C();
      __break(1u);
LABEL_10:
      v2 = sub_21C27A664();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_21C27A724();
    __break(1u);
LABEL_14:
    result = sub_21C27A70C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_21C264074(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255252540);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21C2640D8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255252540);
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
  result = sub_21C27A724();
  __break(1u);
  return result;
}

_BYTE **sub_21C264224(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t _s20SiriEmergencyIntents19DirectInvocationURIO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_21C27A730();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

unint64_t sub_21C264280()
{
  unint64_t result;

  result = qword_255252538;
  if (!qword_255252538)
  {
    result = MEMORY[0x2207778C0](&protocol conformance descriptor for DirectInvocationURI, &type metadata for DirectInvocationURI);
    atomic_store(result, (unint64_t *)&qword_255252538);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DirectInvocationURI(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DirectInvocationURI(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21C2643A0 + 4 * byte_21C27B02A[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_21C2643D4 + 4 * byte_21C27B025[v4]))();
}

uint64_t sub_21C2643D4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C2643DC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C2643E4);
  return result;
}

uint64_t sub_21C2643F0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C2643F8);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_21C2643FC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C264404(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DirectInvocationURI()
{
  return &type metadata for DirectInvocationURI;
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

uint64_t sub_21C264440(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2207778A8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t EmergencyVerb.rawValue.getter(char a1)
{
  return *(_QWORD *)&aCall_1[8 * a1];
}

uint64_t sub_21C2644E4(char *a1, char *a2)
{
  return sub_21C26E18C(*a1, *a2);
}

uint64_t sub_21C2644F0()
{
  return sub_21C272464();
}

uint64_t sub_21C2644FC()
{
  return sub_21C272234();
}

uint64_t sub_21C264504()
{
  return sub_21C272464();
}

uint64_t sub_21C26450C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s20SiriEmergencyIntents0B4VerbO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_21C264538@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = EmergencyVerb.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t _s20SiriEmergencyIntents0B4VerbO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_21C27A730();
  swift_bridgeObjectRelease();
  if (v0 >= 8)
    return 8;
  else
    return v0;
}

uint64_t _s20SiriEmergencyIntents0B4VerbO4from07usoTaskD0ACSgSSSg_tFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  char v5;

  if (!a2)
    return 8;
  if (a1 == 1819042147 && a2 == 0xE400000000000000)
    return 0;
  v5 = sub_21C27A760();
  result = 0;
  if ((v5 & 1) == 0)
  {
    if (a1 == 0x74736575716572 && a2 == 0xE700000000000000 || (sub_21C27A760() & 1) != 0)
      return 1;
    if (a1 == 0x6E6F69746361 && a2 == 0xE600000000000000 || (sub_21C27A760() & 1) != 0)
      return 2;
    if (a1 == 0x627265566F6ELL && a2 == 0xE600000000000000 || (sub_21C27A760() & 1) != 0)
      return 3;
    if (a1 == 0x656C62616E65 && a2 == 0xE600000000000000 || (sub_21C27A760() & 1) != 0)
      return 4;
    if (a1 == 0x656C6261736964 && a2 == 0xE700000000000000 || (sub_21C27A760() & 1) != 0)
      return 5;
    if (a1 == 0x736972616D6D7573 && a2 == 0xE900000000000065 || (sub_21C27A760() & 1) != 0)
      return 6;
    if (a1 == 0x6978456B63656863 && a2 == 0xEE0065636E657473 || (sub_21C27A760() & 1) != 0)
      return 7;
    return 8;
  }
  return result;
}

unint64_t sub_21C264878()
{
  unint64_t result;

  result = qword_255252548;
  if (!qword_255252548)
  {
    result = MEMORY[0x2207778C0](&protocol conformance descriptor for EmergencyVerb, &type metadata for EmergencyVerb);
    atomic_store(result, (unint64_t *)&qword_255252548);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for EmergencyVerb(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF9)
    goto LABEL_17;
  if (a2 + 7 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 7) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 7;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 7;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 7;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for EmergencyVerb(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_21C264998 + 4 * byte_21C27B125[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_21C2649CC + 4 * asc_21C27B120[v4]))();
}

uint64_t sub_21C2649CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C2649D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C2649DCLL);
  return result;
}

uint64_t sub_21C2649E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C2649F0);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_21C2649F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C2649FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EmergencyVerb()
{
  return &type metadata for EmergencyVerb;
}

uint64_t EmergencyDialogAct.userParse.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_21C27A364();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t EmergencyDialogAct.verb.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for EmergencyDialogAct() + 20));
}

uint64_t type metadata accessor for EmergencyDialogAct()
{
  uint64_t result;

  result = qword_255252608;
  if (!qword_255252608)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t EmergencyDialogAct.situation.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for EmergencyDialogAct() + 24));
}

uint64_t EmergencyDialogAct.organization.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for EmergencyDialogAct() + 28));
}

uint64_t EmergencyDialogAct.attribute.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for EmergencyDialogAct() + 32));
}

uint64_t EmergencyDialogAct.confirmation.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for EmergencyDialogAct() + 36));
}

uint64_t EmergencyDialogAct.severity.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for EmergencyDialogAct() + 40));
}

uint64_t EmergencyDialogAct.init(userParse:nlv4MigrationFeatureFlagIsEnabled:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6;
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
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  void (*v25)(uint64_t *__return_ptr, uint64_t);
  char v26;
  int *v27;
  uint64_t v28;
  void (*v29)(_QWORD *__return_ptr, uint64_t);
  uint64_t v30;
  uint64_t v31;
  void (*v32)(_QWORD *__return_ptr, uint64_t);
  char *v33;
  uint64_t v34;
  void (*v35)(_QWORD *__return_ptr, uint64_t);
  char *v36;
  uint64_t v37;
  void (*v38)(_QWORD *__return_ptr, uint64_t);
  char *v39;
  uint64_t v40;
  void (*v41)(_QWORD *__return_ptr, uint64_t);
  uint64_t result;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  _QWORD v59[2];
  uint64_t v60;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255252550);
  v55 = *(_QWORD *)(v6 - 8);
  v56 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v54 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255252558);
  v51 = *(_QWORD *)(v8 - 8);
  v52 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v50 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255252560);
  v47 = *(_QWORD *)(v10 - 8);
  v48 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v46 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255252568);
  v44 = *(_QWORD *)(v12 - 8);
  v45 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255252570);
  v43 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_255252578);
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_21C27A364();
  v53 = *(_QWORD *)(v22 - 8);
  v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 16);
  v57 = a3;
  v23(a3, a1, v22);
  v24 = swift_allocObject();
  v58 = a2 & 1;
  *(_BYTE *)(v24 + 16) = a2;
  sub_21C27A58C();
  v25 = (void (*)(uint64_t *__return_ptr, uint64_t))sub_21C27A598();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  v49 = a1;
  v25(&v60, a1);
  swift_release();
  v26 = v60;
  v27 = (int *)type metadata accessor for EmergencyDialogAct();
  v28 = v57;
  *(_BYTE *)(v57 + v27[6]) = v26;
  *(_BYTE *)(swift_allocObject() + 16) = v58;
  sub_21C27A58C();
  v29 = (void (*)(_QWORD *__return_ptr, uint64_t))sub_21C27A598();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v17, v15);
  v30 = v49;
  v29((_QWORD *)((char *)v59 + 4), v49);
  swift_release();
  *(_BYTE *)(v28 + v27[7]) = BYTE4(v59[0]);
  *(_BYTE *)(swift_allocObject() + 16) = v58;
  sub_21C27A58C();
  v31 = v45;
  v32 = (void (*)(_QWORD *__return_ptr, uint64_t))sub_21C27A598();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v14, v31);
  v32((_QWORD *)((char *)v59 + 3), v30);
  swift_release();
  *(_BYTE *)(v28 + v27[8]) = BYTE3(v59[0]);
  v33 = v46;
  sub_21C27A58C();
  v34 = v48;
  v35 = (void (*)(_QWORD *__return_ptr, uint64_t))sub_21C27A598();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v33, v34);
  v35((_QWORD *)((char *)v59 + 2), v30);
  swift_release();
  *(_BYTE *)(v28 + v27[9]) = BYTE2(v59[0]);
  v36 = v50;
  sub_21C27A58C();
  v37 = v52;
  v38 = (void (*)(_QWORD *__return_ptr, uint64_t))sub_21C27A598();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v36, v37);
  v38((_QWORD *)((char *)v59 + 1), v30);
  swift_release();
  *(_BYTE *)(v28 + v27[5]) = BYTE1(v59[0]);
  *(_BYTE *)(swift_allocObject() + 16) = v58;
  v39 = v54;
  sub_21C27A58C();
  v40 = v56;
  v41 = (void (*)(_QWORD *__return_ptr, uint64_t))sub_21C27A598();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v39, v40);
  v41(v59, v30);
  swift_release();
  LOBYTE(v41) = v59[0];
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v53 + 8))(v30, v22);
  *(_BYTE *)(v28 + v27[10]) = (_BYTE)v41;
  return result;
}

uint64_t sub_21C265124@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_21C27A364();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_21C26515C(uint64_t a1)
{
  uint64_t v1;

  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 20));
}

uint64_t sub_21C265168(uint64_t a1)
{
  uint64_t v1;

  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 24));
}

uint64_t sub_21C265174(uint64_t a1)
{
  uint64_t v1;

  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 28));
}

uint64_t sub_21C265180(uint64_t a1)
{
  uint64_t v1;

  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 32));
}

uint64_t sub_21C26518C(uint64_t a1)
{
  uint64_t v1;

  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 36));
}

uint64_t sub_21C265198(uint64_t a1)
{
  uint64_t v1;

  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 40));
}

uint64_t EmergencyDialogAct.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v3;

  BYTE8(v3) = 0;
  sub_21C27A6DC();
  sub_21C27A658();
  v1 = type metadata accessor for EmergencyDialogAct();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255252580);
  sub_21C27A6A0();
  sub_21C27A658();
  swift_bridgeObjectRelease();
  sub_21C27A658();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255252588);
  sub_21C27A6A0();
  sub_21C27A658();
  swift_bridgeObjectRelease();
  sub_21C27A658();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255252590);
  sub_21C27A6A0();
  sub_21C27A658();
  swift_bridgeObjectRelease();
  sub_21C27A658();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255252598);
  sub_21C27A6A0();
  sub_21C27A658();
  swift_bridgeObjectRelease();
  sub_21C27A658();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552525A0);
  sub_21C27A6A0();
  sub_21C27A658();
  swift_bridgeObjectRelease();
  sub_21C27A658();
  *(_QWORD *)&v3 = *(unsigned __int8 *)(v0 + *(int *)(v1 + 40));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552525A8);
  sub_21C27A6A0();
  sub_21C27A658();
  swift_bridgeObjectRelease();
  sub_21C27A658();
  return *(_QWORD *)((char *)&v3 + 1);
}

uint64_t sub_21C26541C()
{
  return swift_deallocObject();
}

uint64_t sub_21C26542C@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;

  return sub_21C2694BC(a1, *(_BYTE *)(v2 + 16), a2);
}

uint64_t sub_21C265444()
{
  return swift_deallocObject();
}

uint64_t sub_21C265454@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;

  return sub_21C2673D4(a1, *(_BYTE *)(v2 + 16), a2);
}

uint64_t sub_21C26546C()
{
  return swift_deallocObject();
}

uint64_t sub_21C26547C@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;

  return sub_21C265998(a1, *(_BYTE *)(v2 + 16), a2);
}

uint64_t sub_21C265494()
{
  return swift_deallocObject();
}

uint64_t sub_21C2654A4@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_21C26B8D8(*(_BYTE *)(v1 + 16), a1);
}

_QWORD *initializeBufferWithCopyOfBuffer for EmergencyDialogAct(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_21C27A364();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    *((_BYTE *)a1 + v8) = *((_BYTE *)a2 + v8);
    v9 = a3[8];
    *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    *((_BYTE *)a1 + v9) = *((_BYTE *)a2 + v9);
    v10 = a3[10];
    *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
    *((_BYTE *)a1 + v10) = *((_BYTE *)a2 + v10);
  }
  return a1;
}

uint64_t destroy for EmergencyDialogAct(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21C27A364();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for EmergencyDialogAct(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_21C27A364();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  v8 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  v9 = a3[10];
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  *(_BYTE *)(a1 + v9) = *(_BYTE *)(a2 + v9);
  return a1;
}

uint64_t assignWithCopy for EmergencyDialogAct(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;

  v6 = sub_21C27A364();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  return a1;
}

uint64_t initializeWithTake for EmergencyDialogAct(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_21C27A364();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  v8 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  v9 = a3[10];
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  *(_BYTE *)(a1 + v9) = *(_BYTE *)(a2 + v9);
  return a1;
}

uint64_t assignWithTake for EmergencyDialogAct(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_21C27A364();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  v8 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  v9 = a3[10];
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  *(_BYTE *)(a1 + v9) = *(_BYTE *)(a2 + v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for EmergencyDialogAct()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21C2657F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v9;
  unsigned int v10;

  v6 = sub_21C27A364();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  if (*(unsigned __int8 *)(a1 + *(int *)(a3 + 32)) <= 2u)
    v9 = 2;
  else
    v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 32));
  v10 = v9 - 2;
  if (*(unsigned __int8 *)(a1 + *(int *)(a3 + 32)) >= 2u)
    return v10;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for EmergencyDialogAct()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21C265880(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_21C27A364();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 32)) = a2 + 2;
  return result;
}

uint64_t sub_21C2658F8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21C27A364();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_21C265998@<X0>(uint64_t a1@<X0>, char a2@<W1>, _BYTE *a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t inited;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  void (*v35)(uint64_t *__return_ptr, uint64_t);
  uint64_t v36;
  uint64_t result;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[6];
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  const char *v48;
  const char *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(char *, unint64_t, uint64_t);
  char *v62;
  char *v63;
  _BYTE *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  v64 = a3;
  v6 = sub_21C27A5E0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255252558);
  v68 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v67 = (char *)v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = sub_21C27A43C();
  v65 = *(_QWORD *)(v66 - 8);
  v12 = MEMORY[0x24BDAC7A8](v66);
  v62 = (char *)v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v63 = (char *)v44 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)v44 - v19;
  MEMORY[0x24BDAC7A8](v18);
  if ((a2 & 1) != 0)
  {
    v59 = v22;
    v58 = v21;
    Siri_Nlu_External_UserParse.usoTask.getter();
    sub_21C27A46C();
    swift_release();
    if (v70)
    {
      sub_21C27A4D8();
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_21C27A400();
        swift_release();
        if (v69)
        {
          v23 = sub_21C27A454();
          swift_release();
          if (v23)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_255252678);
            inited = swift_initStackObject();
            *(_OWORD *)(inited + 16) = xmmword_21C27B3D0;
            v61 = (void (*)(char *, unint64_t, uint64_t))inited;
            *(_WORD *)(inited + 32) = 1798;
            v25 = sub_21C27A448();
            if (v25)
            {
              v47 = (const char *)v23;
              v48 = *(const char **)(v25 + 16);
              if (v48)
              {
                v52 = v7;
                v53 = v6;
                v51 = (const char *)(v25
                                   + ((*(unsigned __int8 *)(v65 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v65 + 80)));
                v50 = *(const char **)(v65 + 72);
                v49 = *(const char **)(v65 + 16);
                v45 = v25;
                swift_bridgeObjectRetain();
                v57 = "emergencyConfirmation";
                v44[5] = "emergency";
                v44[4] = "emergencyAttribute";
                v44[3] = "emergencySirenNoun";
                v44[2] = "crisisSituationHigh";
                v44[1] = "crisisSituationMedium";
                v55 = v9;
                v60 = a1;
                v54 = v10;
                v56 = 1;
                ((void (*)(char *, const char *, uint64_t))v49)(v20, v51, v66);
                v69 = MEMORY[0x24BEE4AF8];
                __asm { BR              X9 }
              }
              swift_release();
              swift_bridgeObjectRelease();
            }
            else
            {
              swift_release();
            }
            swift_bridgeObjectRelease();
          }
        }
      }
    }
    else
    {
      sub_21C26CA50((uint64_t)&v69, &qword_255252668);
    }
    Siri_Nlu_External_UserParse.usoTask.getter();
    sub_21C27A46C();
    swift_release();
    if (v70)
    {
      sub_21C27A4F0();
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_21C27A400();
        swift_release();
        if (v69)
        {
          v26 = sub_21C27A454();
          swift_release();
          if (v26)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_255252678);
            v27 = swift_initStackObject();
            *(_OWORD *)(v27 + 16) = xmmword_21C27B3D0;
            *(_WORD *)(v27 + 32) = 1798;
            v28 = sub_21C27A448();
            if (v28)
            {
              v61 = (void (*)(char *, unint64_t, uint64_t))v27;
              if (*(_QWORD *)(v28 + 16))
              {
                v46 = v26;
                v54 = v10;
                v55 = v9;
                v52 = v7;
                v53 = v6;
                v29 = v28
                    + ((*(unsigned __int8 *)(v65 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v65 + 80));
                v56 = *(_QWORD *)(v65 + 72);
                v57 = *(const char **)(v65 + 16);
                v45 = v28;
                swift_bridgeObjectRetain();
                v51 = "emergency";
                v50 = "emergencyAttribute";
                v49 = "emergencySirenNoun";
                v48 = "crisisSituationHigh";
                v47 = "crisisSituationMedium";
                ((void (*)(char *, unint64_t, uint64_t))v57)(v63, v29, v66);
                v69 = MEMORY[0x24BEE4AF8];
                __asm { BR              X9 }
              }
              swift_release();
              swift_bridgeObjectRelease();
            }
            else
            {
              swift_release();
            }
            swift_bridgeObjectRelease();
          }
        }
      }
    }
    else
    {
      sub_21C26CA50((uint64_t)&v69, &qword_255252668);
    }
    Siri_Nlu_External_UserParse.usoTask.getter();
    sub_21C27A46C();
    swift_release();
    if (v70)
    {
      sub_21C27A4B4();
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_21C27A400();
        swift_release();
        if (v69)
        {
          v30 = sub_21C27A454();
          swift_release();
          if (v30)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_255252678);
            v31 = swift_initStackObject();
            *(_OWORD *)(v31 + 16) = xmmword_21C27B3D0;
            *(_WORD *)(v31 + 32) = 1798;
            v32 = sub_21C27A448();
            if (v32)
            {
              v63 = (char *)v31;
              if (*(_QWORD *)(v32 + 16))
              {
                v48 = (const char *)v30;
                v54 = v10;
                v55 = v9;
                v52 = v7;
                v53 = v6;
                v33 = v32
                    + ((*(unsigned __int8 *)(v65 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v65 + 80));
                v59 = *(_QWORD *)(v65 + 72);
                v61 = *(void (**)(char *, unint64_t, uint64_t))(v65 + 16);
                v47 = (const char *)v32;
                swift_bridgeObjectRetain();
                v57 = "emergency";
                v56 = (uint64_t)"emergencyAttribute";
                v51 = "emergencySirenNoun";
                v50 = "crisisSituationHigh";
                v49 = "crisisSituationMedium";
                v60 = a1;
                v61(v62, v33, v66);
                v69 = sub_21C279C50(0);
                __asm { BR              X9 }
              }
              swift_release();
              swift_bridgeObjectRelease();
            }
            else
            {
              swift_release();
            }
            swift_bridgeObjectRelease();
          }
        }
      }
    }
    else
    {
      sub_21C26CA50((uint64_t)&v69, &qword_255252668);
    }
  }
  sub_21C27A364();
  v34 = v67;
  sub_21C27A58C();
  v35 = (void (*)(uint64_t *__return_ptr, uint64_t))sub_21C27A598();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v34, v10);
  v35(&v69, a1);
  if (!v3)
  {
    swift_release();
    __asm { BR              X10 }
  }
  MEMORY[0x220777860](v3);
  swift_release();
  Siri_Nlu_External_UserParse.catiIntentName.getter();
  if (v36
    && (result = _s20SiriEmergencyIntents14CATIIntentNameO8rawValueACSgSS_tcfC_0(), (result - 10) <= 7u))
  {
    *v64 = (0xF0u >> (result - 10)) & 1;
  }
  else
  {
    v38 = sub_21C27A5C8();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v38, v6);
    v39 = sub_21C27A5D4();
    v40 = sub_21C27A688();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v41 = 0;
      _os_log_impl(&dword_21C260000, v39, v40, "No EmergencyAttribute found in user parse", v41, 2u);
      MEMORY[0x220777920](v41, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v42 = sub_21C27A5A4();
    sub_21C26CA08();
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v42 - 8) + 104))(v43, *MEMORY[0x24BEA8DB8], v42);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_21C26720C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t result;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = sub_21C27A5E0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (Siri_Nlu_External_UserParse.usoTask.getter()
    && (v6 = sub_21C27A580(),
        v8 = v7,
        swift_release(),
        v9 = _s20SiriEmergencyIntents0B4VerbO4from07usoTaskD0ACSgSSSg_tFZ_0(v6, v8),
        result = swift_bridgeObjectRelease(),
        v9 != 8))
  {
    *a1 = v9;
  }
  else
  {
    v11 = sub_21C27A5C8();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v11, v2);
    v12 = sub_21C27A5D4();
    v13 = sub_21C27A688();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_21C260000, v12, v13, "No EmergencyVerb found in user parse", v14, 2u);
      MEMORY[0x220777920](v14, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v15 = sub_21C27A5A4();
    sub_21C26CA08();
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v16, *MEMORY[0x24BEA8DB8], v15);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_21C2673D4@<X0>(uint64_t a1@<X0>, char a2@<W1>, _BYTE *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
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
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t inited;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(const char *, uint64_t, uint64_t);
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  void (*v80)(const char *, uint64_t, uint64_t);
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void (*v99)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  char v105;
  uint64_t result;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  void (*v111)(const char *, uint64_t, uint64_t);
  const char *v112;
  uint64_t v113;
  const char *v114;
  void (*v115)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  NSObject *v127;
  os_log_type_t v128;
  uint8_t *v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void (*v138)(const char *, uint64_t, uint64_t);
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  char *v143;
  char *v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  const char *v148;
  const char *v149;
  const char *v150;
  const char *v151;
  const char *v152;
  uint64_t v153;
  char *v154;
  uint64_t v155;
  uint64_t v156;
  _BYTE *v157;
  char *v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  const char *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  char *v167;
  uint64_t v168;
  uint64_t v169;
  char *v170;
  uint64_t v171;
  uint64_t v172;

  v4 = v3;
  v157 = a3;
  v156 = sub_21C27A5E0();
  v155 = *(_QWORD *)(v156 - 8);
  MEMORY[0x24BDAC7A8](v156);
  v8 = (char *)&v133 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v169 = sub_21C27A5BC();
  v168 = *(_QWORD *)(v169 - 8);
  MEMORY[0x24BDAC7A8](v169);
  v167 = (char *)&v133 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21C27A3DC();
  v160 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v170 = (char *)&v133 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255252680);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v133 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v165 = sub_21C27A43C();
  v15 = *(_QWORD *)(v165 - 8);
  v16 = MEMORY[0x24BDAC7A8](v165);
  v147 = (char *)&v133 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v162 = (char *)&v133 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v163 = (char *)&v133 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v161 = (char *)&v133 - v22;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_255252658);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v143 = (char *)&v133 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v144 = (char *)&v133 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v145 = (uint64_t)&v133 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v31 = "InstrumentationTask";
  v166 = v10;
  v158 = v14;
  if ((a2 & 1) == 0)
    goto LABEL_97;
  v142 = (uint64_t)&v133 - v30;
  Siri_Nlu_External_UserParse.usoTask.getter();
  sub_21C27A46C();
  swift_release();
  if (!v172)
  {
    sub_21C26CA50((uint64_t)&v171, &qword_255252668);
    goto LABEL_19;
  }
  sub_21C27A4D8();
  if ((swift_dynamicCast() & 1) != 0)
  {
    sub_21C27A400();
    swift_release();
    v32 = v171;
    v33 = v142;
    if (v171)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255252678);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_21C27B3E0;
      v135 = inited;
      *(_BYTE *)(inited + 32) = 0;
      v136 = inited + 32;
      v35 = sub_21C27A448();
      if (!v35)
      {
        swift_release();
        swift_bridgeObjectRelease();
        goto LABEL_19;
      }
      v133 = v32;
      v141 = *(_QWORD *)(v35 + 16);
      if (!v141)
      {
        v134 = v35;
        swift_bridgeObjectRetain();
        v47 = 1;
        goto LABEL_79;
      }
      v159 = a1;
      v153 = v3;
      v154 = v8;
      v140 = v35 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
      v36 = v35;
      v37 = sub_21C279CE8(v135);
      v139 = *(_QWORD *)(v15 + 72);
      v138 = *(void (**)(const char *, uint64_t, uint64_t))(v15 + 16);
      v134 = v36;
      swift_bridgeObjectRetain_n();
      v38 = 0;
      v152 = "emergency";
      v151 = "emergencyAttribute";
      v150 = "emergencySirenNoun";
      v149 = "crisisSituationHigh";
      v148 = "crisisSituationMedium";
      v39 = v165;
      v40 = v161;
      v137 = v37;
      v164 = v15;
      while (1)
      {
        v146 = v38;
        v138(v40, v140 + v139 * v38, v39);
        v41 = sub_21C279C50(0);
        v171 = v41;
        if (v37)
          break;
        v42 = (_QWORD *)v41;
        v43 = sub_21C27A430();
        if (v44)
        {
          v45 = v44;
        }
        else
        {
          v43 = 0;
          v45 = 0xE000000000000000;
        }
        v46 = sub_21C279928(v43, v45, v42);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v46 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          v33 = v142;
          (*(void (**)(uint64_t))(v15 + 32))(v142);
          v47 = 0;
          v8 = v154;
          v4 = v153;
          a1 = v159;
          v10 = v166;
          v31 = "InstrumentationTask";
          goto LABEL_79;
        }
        v38 = v146 + 1;
        (*(void (**)(const char *, uint64_t))(v15 + 8))(v40, v39);
        v37 = v137;
        if (v38 == v141)
        {
          swift_bridgeObjectRelease();
          v47 = 1;
          v8 = v154;
          v4 = v153;
          a1 = v159;
          v10 = v166;
          v31 = "InstrumentationTask";
          v33 = v142;
LABEL_79:
          v99 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56);
          v100 = v33;
          v101 = v33;
          v102 = v15;
          v103 = v165;
          v99(v100, v47, 1, v165);
          swift_bridgeObjectRelease();
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v102 + 48))(v101, 1, v103) == 1)
          {
            sub_21C26CA50(v101, &qword_255252658);
            swift_release();
            swift_bridgeObjectRelease();
            v15 = v102;
            swift_bridgeObjectRelease();
          }
          else
          {
            v161 = (const char *)sub_21C27A424();
            v154 = v104;
            (*(void (**)(uint64_t, uint64_t))(v102 + 8))(v101, v103);
            swift_bridgeObjectRelease();
            swift_setDeallocating();
            swift_deallocClassInstance();
            v105 = _s20SiriEmergencyIntents0B12OrganizationO8rawValueACSgSS_tcfC_0();
            result = swift_release();
            v15 = v102;
            if (v105 != 4)
              goto LABEL_105;
          }
          goto LABEL_19;
        }
      }
      if (v37 >= 1)
        __asm { BR              X9 }
      __break(1u);
      goto LABEL_111;
    }
  }
LABEL_19:
  Siri_Nlu_External_UserParse.usoTask.getter();
  sub_21C27A46C();
  swift_release();
  if (!v172)
  {
    sub_21C26CA50((uint64_t)&v171, &qword_255252668);
    goto LABEL_35;
  }
  sub_21C27A4F0();
  if ((swift_dynamicCast() & 1) != 0)
  {
    sub_21C27A400();
    swift_release();
    v48 = v171;
    if (v171)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255252678);
      v49 = swift_initStackObject();
      *(_OWORD *)(v49 + 16) = *((_OWORD *)v31 + 62);
      v137 = v49;
      *(_BYTE *)(v49 + 32) = 0;
      v138 = (void (*)(const char *, uint64_t, uint64_t))(v49 + 32);
      v50 = sub_21C27A448();
      if (!v50)
      {
        swift_release();
        swift_bridgeObjectRelease();
        goto LABEL_35;
      }
      v135 = v48;
      v146 = *(_QWORD *)(v50 + 16);
      v164 = v15;
      if (!v146)
      {
        v63 = v50;
        swift_bridgeObjectRetain();
        v64 = 1;
        goto LABEL_73;
      }
      v153 = v4;
      v154 = v8;
      v142 = v50 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
      v51 = v50;
      v141 = sub_21C279CE8(v137);
      v140 = *(_QWORD *)(v15 + 72);
      v139 = *(_QWORD *)(v15 + 16);
      v136 = v51;
      swift_bridgeObjectRetain_n();
      v52 = 0;
      v161 = "emergency";
      v152 = "emergencyAttribute";
      v151 = "emergencySirenNoun";
      v150 = "crisisSituationHigh";
      v149 = "crisisSituationMedium";
      v53 = v165;
      v54 = v163;
      v159 = a1;
      while (1)
      {
        v148 = v52;
        ((void (*)(const char *, uint64_t, uint64_t))v139)(v54, v142 + v140 * (_QWORD)v52, v53);
        v55 = sub_21C279C50(0);
        v171 = v55;
        if (v141)
          break;
        v56 = (_QWORD *)v55;
        v57 = a1;
        v58 = v163;
        v59 = sub_21C27A430();
        if (v60)
        {
          v61 = v60;
        }
        else
        {
          v59 = 0;
          v61 = 0xE000000000000000;
        }
        v62 = sub_21C279928(v59, v61, v56);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v62 & 1) != 0)
        {
          v107 = v136;
          swift_bridgeObjectRelease();
          v15 = v164;
          v96 = v145;
          v108 = v58;
          v63 = v107;
          (*(void (**)(uint64_t, const char *, uint64_t))(v164 + 32))(v145, v108, v53);
          v64 = 0;
          v8 = v154;
          v4 = v153;
          a1 = v57;
          v10 = v166;
          goto LABEL_84;
        }
        v52 = v148 + 1;
        (*(void (**)(const char *, uint64_t))(v164 + 8))(v58, v53);
        v54 = v58;
        a1 = v57;
        v10 = v166;
        if (v52 == (const char *)v146)
        {
          v63 = v136;
          swift_bridgeObjectRelease();
          v64 = 1;
          v8 = v154;
          v4 = v153;
          v15 = v164;
LABEL_73:
          v96 = v145;
LABEL_84:
          v109 = v165;
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(v96, v64, 1, v165);
          swift_bridgeObjectRelease();
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v96, 1, v109) == 1)
          {
            sub_21C26CA50(v96, &qword_255252658);
            swift_release();
            swift_bridgeObjectRelease();
            v15 = v164;
            v31 = "InstrumentationTask";
            swift_bridgeObjectRelease();
          }
          else
          {
            v136 = v63;
            sub_21C27A424();
            v163 = v110;
            (*(void (**)(uint64_t, uint64_t))(v164 + 8))(v96, v109);
            swift_bridgeObjectRelease();
            swift_setDeallocating();
            swift_deallocClassInstance();
            v105 = _s20SiriEmergencyIntents0B12OrganizationO8rawValueACSgSS_tcfC_0();
            result = swift_release();
            v15 = v164;
            v31 = "InstrumentationTask";
            if (v105 != 4)
              goto LABEL_105;
          }
          goto LABEL_35;
        }
      }
      if (v141 >= 1)
        __asm { BR              X9 }
LABEL_111:
      __break(1u);
LABEL_112:
      __break(1u);
      goto LABEL_113;
    }
  }
LABEL_35:
  Siri_Nlu_External_UserParse.usoTask.getter();
  sub_21C27A46C();
  swift_release();
  if (!v172)
  {
    sub_21C26CA50((uint64_t)&v171, &qword_255252668);
    goto LABEL_51;
  }
  sub_21C27A550();
  if ((swift_dynamicCast() & 1) != 0)
  {
    sub_21C27A400();
    swift_release();
    v65 = v171;
    if (v171)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255252678);
      v66 = swift_initStackObject();
      *(_OWORD *)(v66 + 16) = *((_OWORD *)v31 + 62);
      v139 = v66;
      *(_BYTE *)(v66 + 32) = 0;
      v140 = v66 + 32;
      v67 = sub_21C27A448();
      if (!v67)
      {
        swift_release();
        swift_bridgeObjectRelease();
        goto LABEL_51;
      }
      v137 = v65;
      v148 = *(const char **)(v67 + 16);
      v164 = v15;
      if (!v148)
      {
        v80 = (void (*)(const char *, uint64_t, uint64_t))v67;
        swift_bridgeObjectRetain();
        v81 = 1;
        goto LABEL_75;
      }
      v153 = v4;
      v154 = v8;
      v146 = v67 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
      v68 = (void (*)(const char *, uint64_t, uint64_t))v67;
      v145 = sub_21C279CE8(v139);
      v142 = *(_QWORD *)(v15 + 72);
      v141 = *(_QWORD *)(v15 + 16);
      v138 = v68;
      swift_bridgeObjectRetain_n();
      v69 = 0;
      v163 = "emergency";
      v161 = "emergencyAttribute";
      v152 = "emergencySirenNoun";
      v151 = "crisisSituationHigh";
      v150 = "crisisSituationMedium";
      v70 = v165;
      v71 = v162;
      v159 = a1;
      while (1)
      {
        v149 = v69;
        ((void (*)(const char *, uint64_t, uint64_t))v141)(v71, v146 + v142 * (_QWORD)v69, v70);
        v72 = sub_21C279C50(0);
        v171 = v72;
        if (v145)
          break;
        v73 = (_QWORD *)v72;
        v74 = a1;
        v75 = v162;
        v76 = sub_21C27A430();
        if (v77)
        {
          v78 = v77;
        }
        else
        {
          v76 = 0;
          v78 = 0xE000000000000000;
        }
        v79 = sub_21C279928(v76, v78, v73);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v79 & 1) != 0)
        {
          v111 = v138;
          swift_bridgeObjectRelease();
          v15 = v164;
          v97 = (uint64_t)v144;
          v112 = v75;
          v80 = v111;
          (*(void (**)(char *, const char *, uint64_t))(v164 + 32))(v144, v112, v70);
          v81 = 0;
          v8 = v154;
          v4 = v153;
          a1 = v74;
          v10 = v166;
          goto LABEL_89;
        }
        v69 = v149 + 1;
        (*(void (**)(const char *, uint64_t))(v164 + 8))(v75, v70);
        v71 = v75;
        a1 = v74;
        v10 = v166;
        if (v69 == v148)
        {
          v80 = v138;
          swift_bridgeObjectRelease();
          v81 = 1;
          v8 = v154;
          v4 = v153;
          v15 = v164;
LABEL_75:
          v97 = (uint64_t)v144;
LABEL_89:
          v113 = v165;
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(v97, v81, 1, v165);
          swift_bridgeObjectRelease();
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v97, 1, v113) == 1)
          {
            sub_21C26CA50(v97, &qword_255252658);
            swift_release();
            swift_bridgeObjectRelease();
            v15 = v164;
            v31 = "InstrumentationTask";
            swift_bridgeObjectRelease();
          }
          else
          {
            v138 = v80;
            sub_21C27A424();
            v163 = v114;
            (*(void (**)(uint64_t, uint64_t))(v164 + 8))(v97, v113);
            swift_bridgeObjectRelease();
            swift_setDeallocating();
            swift_deallocClassInstance();
            v105 = _s20SiriEmergencyIntents0B12OrganizationO8rawValueACSgSS_tcfC_0();
            result = swift_release();
            v15 = v164;
            v31 = "InstrumentationTask";
            if (v105 != 4)
              goto LABEL_105;
          }
          goto LABEL_51;
        }
      }
      if (v145 >= 1)
        __asm { BR              X9 }
      goto LABEL_112;
    }
  }
LABEL_51:
  Siri_Nlu_External_UserParse.usoTask.getter();
  sub_21C27A46C();
  swift_release();
  if (!v172)
  {
    sub_21C26CA50((uint64_t)&v171, &qword_255252668);
    goto LABEL_97;
  }
  sub_21C27A4B4();
  if ((swift_dynamicCast() & 1) == 0 || (sub_21C27A400(), swift_release(), (v82 = v171) == 0))
  {
LABEL_97:
    __swift_instantiateConcreteTypeFromMangledName(&qword_255252678);
    v118 = swift_initStackObject();
    *(_OWORD *)(v118 + 16) = *((_OWORD *)v31 + 62);
    *(_BYTE *)(v118 + 32) = 0;
    v119 = Siri_Nlu_External_UserParse.identifiers.getter();
    v161 = *(const char **)(v119 + 16);
    if (v161)
    {
      v159 = a1;
      v153 = v4;
      v154 = v8;
      v165 = v119 + ((*(unsigned __int8 *)(v160 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v160 + 80));
      v164 = *(_QWORD *)(v160 + 72);
      v163 = *(const char **)(v160 + 16);
      v152 = (const char *)v119;
      swift_bridgeObjectRetain();
      v162 = "emergencyConfirmation";
      v151 = "emergency";
      v150 = "emergencyAttribute";
      v149 = "emergencySirenNoun";
      v148 = "crisisSituationHigh";
      v147 = "crisisSituationMedium";
      ((void (*)(char *, uint64_t, uint64_t))v163)(v170, v165, v10);
      v120 = *(unsigned __int8 *)(v118 + 32);
      swift_bridgeObjectRetain();
      __asm { BR              X8 }
    }
    v121 = v160;
    v122 = (uint64_t)v158;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v160 + 56))(v158, 1, 1, v10);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v121 + 48))(v122, 1, v10) == 1)
    {
      sub_21C26CA50(v122, &qword_255252680);
      swift_setDeallocating();
      swift_deallocClassInstance();
    }
    else
    {
      sub_21C27A3C4();
      (*(void (**)(uint64_t, uint64_t))(v121 + 8))(v122, v10);
      swift_setDeallocating();
      swift_deallocClassInstance();
      result = _s20SiriEmergencyIntents0B12OrganizationO8rawValueACSgSS_tcfC_0();
      v105 = result;
      if (result != 4)
        goto LABEL_105;
    }
    Siri_Nlu_External_UserParse.catiIntentName.getter();
    if (v123)
    {
      result = _s20SiriEmergencyIntents14CATIIntentNameO8rawValueACSgSS_tcfC_0();
      if ((result - 10) < 0xCu)
      {
        v105 = byte_21C27B400[(char)(result - 10)];
        goto LABEL_105;
      }
    }
    v124 = sub_21C27A5C8();
    swift_beginAccess();
    v125 = v155;
    v126 = v156;
    (*(void (**)(char *, uint64_t, uint64_t))(v155 + 16))(v8, v124, v156);
    v127 = sub_21C27A5D4();
    v128 = sub_21C27A688();
    if (os_log_type_enabled(v127, v128))
    {
      v129 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v129 = 0;
      _os_log_impl(&dword_21C260000, v127, v128, "No EmergencyOrganization found in user parse", v129, 2u);
      MEMORY[0x220777920](v129, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v125 + 8))(v8, v126);
    v130 = sub_21C27A5A4();
    sub_21C26CA08();
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v130 - 8) + 104))(v131, *MEMORY[0x24BEA8DB8], v130);
    return swift_willThrow();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255252678);
  v83 = swift_initStackObject();
  *(_OWORD *)(v83 + 16) = *((_OWORD *)v31 + 62);
  v141 = v83;
  *(_BYTE *)(v83 + 32) = 0;
  v142 = v83 + 32;
  v84 = sub_21C27A448();
  if (!v84)
  {
    swift_release();
    goto LABEL_96;
  }
  v139 = v82;
  v149 = *(const char **)(v84 + 16);
  if (!v149)
  {
    v140 = v84;
    swift_bridgeObjectRetain();
    v95 = 1;
    goto LABEL_77;
  }
  v159 = a1;
  v153 = v4;
  v154 = v8;
  v148 = (const char *)(v84
                      + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80)));
  v85 = v84;
  v146 = sub_21C279CE8(v141);
  v145 = *(_QWORD *)(v15 + 72);
  v164 = v15;
  v144 = *(char **)(v15 + 16);
  v140 = v85;
  swift_bridgeObjectRetain_n();
  v86 = 0;
  v163 = "emergency";
  v162 = "emergencyAttribute";
  v161 = "emergencySirenNoun";
  v152 = "crisisSituationHigh";
  v151 = "crisisSituationMedium";
  v87 = v165;
  v88 = v147;
  while (1)
  {
    v150 = v86;
    ((void (*)(const char *, const char *, uint64_t))v144)(v88, &v148[v145 * (_QWORD)v86], v87);
    v89 = sub_21C279C50(0);
    v171 = v89;
    if (v146)
    {
      if (v146 >= 1)
        __asm { BR              X9 }
LABEL_113:
      __break(1u);
      JUMPOUT(0x21C269408);
    }
    v90 = (_QWORD *)v89;
    v91 = sub_21C27A430();
    if (v92)
    {
      v93 = v92;
    }
    else
    {
      v91 = 0;
      v93 = 0xE000000000000000;
    }
    v94 = sub_21C279928(v91, v93, v90);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v94 & 1) != 0)
      break;
    v86 = v150 + 1;
    (*(void (**)(const char *, uint64_t))(v164 + 8))(v88, v87);
    if (v86 == v149)
    {
      swift_bridgeObjectRelease();
      v95 = 1;
      v8 = v154;
      v4 = v153;
      a1 = v159;
      v31 = "InstrumentationTask";
      v15 = v164;
LABEL_77:
      v98 = (uint64_t)v143;
      goto LABEL_94;
    }
  }
  swift_bridgeObjectRelease();
  v15 = v164;
  v98 = (uint64_t)v143;
  (*(void (**)(char *, const char *, uint64_t))(v164 + 32))(v143, v88, v87);
  v95 = 0;
  v8 = v154;
  v4 = v153;
  a1 = v159;
  v31 = "InstrumentationTask";
LABEL_94:
  v115 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v116 = v15;
  v117 = v165;
  v115(v98, v95, 1, v165);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v116 + 48))(v98, 1, v117) == 1)
  {
    sub_21C26CA50(v98, &qword_255252658);
    swift_release();
    swift_bridgeObjectRelease();
LABEL_96:
    swift_bridgeObjectRelease();
    goto LABEL_97;
  }
  v163 = (const char *)sub_21C27A424();
  v162 = v132;
  (*(void (**)(uint64_t, uint64_t))(v116 + 8))(v98, v117);
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  swift_deallocClassInstance();
  v105 = _s20SiriEmergencyIntents0B12OrganizationO8rawValueACSgSS_tcfC_0();
  result = swift_release();
  if (v105 == 4)
    goto LABEL_97;
LABEL_105:
  *v157 = v105;
  return result;
}

uint64_t sub_21C2694BC@<X0>(uint64_t a1@<X0>, char a2@<W1>, _BYTE *a3@<X8>)
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
  uint64_t v16;
  const char *v17;
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
  uint64_t inited;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(_QWORD, _QWORD, _QWORD);
  unint64_t v42;
  const char *v43;
  uint64_t v44;
  _QWORD *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(const char *, unint64_t, uint64_t);
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  _QWORD *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  uint64_t result;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(const char *, unint64_t, uint64_t);
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void (*v81)(_QWORD, _QWORD, _QWORD);
  uint64_t v82;
  unint64_t v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  _QWORD *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void (*v99)(_QWORD, _QWORD, _QWORD);
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  const char *v106;
  char *v107;
  uint64_t v108;
  _QWORD *v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void (*v128)(uint64_t, unint64_t, uint64_t);
  uint64_t v129;
  char v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  NSObject *v146;
  os_log_type_t v147;
  uint8_t *v148;
  uint64_t v149;
  uint64_t v150;
  void (*v151)(char *, const char *, const char *);
  char *v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  char *v163;
  void (*v164)(const char *, unint64_t, uint64_t);
  uint64_t v165;
  uint64_t v166;
  unint64_t v167;
  char *v168;
  unint64_t v169;
  const char *v170;
  _BYTE *v171;
  const char *v172;
  const char *v173;
  const char *v174;
  const char *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  char *v180;
  uint64_t v181;
  uint64_t v182;
  char *v183;
  const char *v184;
  const char *v185;
  const char *v186;
  char *v187;
  uint64_t v188;
  uint64_t v189;
  char *v190;
  char *v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  _QWORD v195[3];
  uint64_t v196;

  v171 = a3;
  v5 = sub_21C27A5E0();
  v6 = *(_QWORD *)(v5 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v180 = (char *)&v158 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21C27A5BC();
  v188 = *(_QWORD *)(v8 - 8);
  v189 = v8;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v187 = (char *)&v158 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21C27A3DC();
  v11 = *(_QWORD *)(v10 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v191 = (char *)&v158 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255252680);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v190 = (char *)&v158 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_21C27A43C();
  v194 = *(_QWORD *)(v14 - 8);
  v15 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v17 = (char *)&v158 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v168 = (char *)&v158 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v183 = (char *)&v158 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v184 = (char *)&v158 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v185 = (char *)&v158 - v25;
  MEMORY[0x24BDAC7A8](v24);
  v186 = (char *)&v158 - v26;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_255252658);
  v28 = MEMORY[0x24BDAC7A8](v27);
  v29 = MEMORY[0x24BDAC7A8](v28);
  v30 = MEMORY[0x24BDAC7A8](v29);
  MEMORY[0x24BDAC7A8](v30);
  v181 = a1;
  v192 = v11;
  v179 = v6;
  if ((a2 & 1) == 0)
    goto LABEL_117;
  v162 = v34;
  v163 = (char *)&v158 - v31;
  v160 = v32;
  v161 = v33;
  Siri_Nlu_External_UserParse.usoTask.getter();
  sub_21C27A46C();
  swift_release();
  v193 = (const char *)v14;
  v170 = v17;
  if (!v196)
  {
    sub_21C26CA50((uint64_t)v195, &qword_255252668);
    goto LABEL_25;
  }
  sub_21C27A514();
  if ((swift_dynamicCast() & 1) != 0)
  {
    sub_21C27A400();
    swift_release();
    v35 = v195[0];
    if (v195[0])
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255252678);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_21C27B3F0;
      *(_WORD *)(inited + 32) = 1027;
      *(_BYTE *)(inited + 34) = 5;
      v37 = sub_21C27A448();
      if (!v37)
      {
        swift_release();
        goto LABEL_24;
      }
      v158 = v35;
      v167 = *(_QWORD *)(v37 + 16);
      v178 = v10;
      if (!v167)
      {
        v159 = v37;
        swift_bridgeObjectRetain();
        v51 = 1;
        goto LABEL_22;
      }
      v177 = v5;
      v38 = v194;
      v166 = v37 + ((*(unsigned __int8 *)(v194 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v194 + 80));
      v39 = v37;
      v40 = sub_21C279CE8(inited);
      v41 = *(void (**)(_QWORD, _QWORD, _QWORD))(v38 + 72);
      v164 = *(void (**)(const char *, unint64_t, uint64_t))(v38 + 16);
      v165 = (uint64_t)v41;
      v159 = v39;
      swift_bridgeObjectRetain_n();
      v42 = 0;
      v175 = "emergencyAttribute";
      v176 = "emergency";
      v173 = "crisisSituationHigh";
      v174 = "emergencySirenNoun";
      v172 = "crisisSituationMedium";
      v43 = v186;
      while (1)
      {
        v169 = v42;
        v164(v43, v166 + v165 * v42, v14);
        v44 = sub_21C279C50(0);
        v195[0] = v44;
        if (v40)
          break;
        v45 = (_QWORD *)v44;
        v46 = v186;
        v47 = sub_21C27A430();
        if (v48)
        {
          v49 = v48;
        }
        else
        {
          v47 = 0;
          v49 = 0xE000000000000000;
        }
        v50 = sub_21C279928(v47, v49, v45);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v50 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          v14 = (uint64_t)v193;
          (*(void (**)(char *, const char *, const char *))(v194 + 32))(v163, v46, v193);
          v51 = 0;
LABEL_21:
          v5 = v177;
          v10 = v178;
          v6 = v179;
LABEL_22:
          v52 = v194;
          v53 = (uint64_t)v163;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v194 + 56))(v163, v51, 1, v14);
          swift_bridgeObjectRelease();
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v52 + 48))(v53, 1, v14) == 1)
          {
            sub_21C26CA50(v53, &qword_255252658);
            swift_release();
            swift_bridgeObjectRelease();
            v17 = v170;
LABEL_24:
            swift_bridgeObjectRelease();
            v11 = v192;
          }
          else
          {
            v186 = (const char *)sub_21C27A424();
            v72 = v71;
            (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v53, v14);
            swift_bridgeObjectRelease();
            swift_setDeallocating();
            swift_deallocClassInstance();
            v73 = _s20SiriEmergencyIntents0B9SituationO4from15identifierValueACSgSS_tFZ_0((uint64_t)v186, v72);
            swift_release();
            v10 = v178;
            result = swift_bridgeObjectRelease();
            v11 = v192;
            v14 = (uint64_t)v193;
            v17 = v170;
            if (v73 != 34)
              goto LABEL_129;
          }
          goto LABEL_25;
        }
        v42 = v169 + 1;
        v14 = (uint64_t)v193;
        (*(void (**)(const char *, const char *))(v194 + 8))(v46, v193);
        v43 = v46;
        if (v42 == v167)
        {
          swift_bridgeObjectRelease();
          v51 = 1;
          goto LABEL_21;
        }
      }
      if (v40 >= 1)
      {
        swift_bridgeObjectRetain();
        __asm { BR              X9 }
      }
      __break(1u);
      goto LABEL_131;
    }
  }
LABEL_25:
  Siri_Nlu_External_UserParse.usoTask.getter();
  sub_21C27A46C();
  swift_release();
  if (!v196)
  {
    sub_21C26CA50((uint64_t)v195, &qword_255252668);
    goto LABEL_50;
  }
  sub_21C27A514();
  if ((swift_dynamicCast() & 1) != 0)
  {
    sub_21C27A400();
    swift_release();
    v54 = (char *)v195[0];
    if (v195[0])
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255252678);
      v55 = swift_initStackObject();
      *(_OWORD *)(v55 + 16) = xmmword_21C27B3E0;
      *(_BYTE *)(v55 + 32) = 1;
      v56 = sub_21C27A448();
      if (!v56)
      {
        swift_release();
        goto LABEL_49;
      }
      v163 = v54;
      v169 = *(_QWORD *)(v56 + 16);
      v178 = v10;
      if (!v169)
      {
        v164 = (void (*)(const char *, unint64_t, uint64_t))v56;
        swift_bridgeObjectRetain();
        v70 = 1;
        goto LABEL_47;
      }
      v177 = v5;
      v57 = v194;
      v167 = v56 + ((*(unsigned __int8 *)(v194 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v194 + 80));
      v58 = (void (*)(const char *, unint64_t, uint64_t))v56;
      v59 = sub_21C279CE8(v55);
      v60 = *(_QWORD *)(v57 + 72);
      v165 = *(_QWORD *)(v57 + 16);
      v166 = v60;
      v164 = v58;
      swift_bridgeObjectRetain_n();
      v61 = 0;
      v186 = "emergency";
      v175 = "emergencySirenNoun";
      v176 = "emergencyAttribute";
      v173 = "crisisSituationMedium";
      v174 = "crisisSituationHigh";
      v62 = v185;
      while (1)
      {
        v172 = v61;
        ((void (*)(const char *, unint64_t, uint64_t))v165)(v62, v167 + v166 * (_QWORD)v61, v14);
        v63 = sub_21C279C50(0);
        v195[0] = v63;
        if (v59)
          break;
        v64 = (_QWORD *)v63;
        v65 = v185;
        v66 = sub_21C27A430();
        if (v67)
        {
          v68 = v67;
        }
        else
        {
          v66 = 0;
          v68 = 0xE000000000000000;
        }
        v69 = sub_21C279928(v66, v68, v64);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v69 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          v14 = (uint64_t)v193;
          (*(void (**)(uint64_t, const char *, const char *))(v194 + 32))(v162, v65, v193);
          v70 = 0;
LABEL_46:
          v5 = v177;
          v10 = v178;
LABEL_47:
          v75 = v194;
          v76 = v162;
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v194 + 56))(v162, v70, 1, v14);
          swift_bridgeObjectRelease();
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v75 + 48))(v76, 1, v14) == 1)
          {
            sub_21C26CA50(v76, &qword_255252658);
            swift_release();
            swift_bridgeObjectRelease();
            v17 = v170;
LABEL_49:
            swift_bridgeObjectRelease();
            v6 = v179;
          }
          else
          {
            v94 = sub_21C27A424();
            v96 = v95;
            (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v76, v14);
            swift_bridgeObjectRelease();
            swift_setDeallocating();
            swift_deallocClassInstance();
            v73 = _s20SiriEmergencyIntents0B9SituationO4from15identifierValueACSgSS_tFZ_0(v94, v96);
            swift_release();
            v10 = v178;
            v11 = v192;
            result = swift_bridgeObjectRelease();
            v14 = (uint64_t)v193;
            v6 = v179;
            v17 = v170;
            if (v73 != 34)
              goto LABEL_129;
          }
          goto LABEL_50;
        }
        v61 = v172 + 1;
        v14 = (uint64_t)v193;
        (*(void (**)(const char *, const char *))(v194 + 8))(v65, v193);
        v62 = v65;
        if (v61 == (const char *)v169)
        {
          swift_bridgeObjectRelease();
          v70 = 1;
          goto LABEL_46;
        }
      }
      if (v59 >= 1)
      {
        swift_bridgeObjectRetain();
        __asm { BR              X9 }
      }
LABEL_131:
      __break(1u);
LABEL_132:
      __break(1u);
      goto LABEL_133;
    }
  }
LABEL_50:
  Siri_Nlu_External_UserParse.usoTask.getter();
  sub_21C27A46C();
  swift_release();
  if (!v196)
  {
    sub_21C26CA50((uint64_t)v195, &qword_255252668);
    goto LABEL_75;
  }
  sub_21C27A4C0();
  if ((swift_dynamicCast() & 1) != 0)
  {
    sub_21C27A508();
    swift_release();
    v77 = (void (*)(const char *, unint64_t, uint64_t))v195[0];
    if (v195[0])
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255252678);
      v78 = swift_initStackObject();
      *(_OWORD *)(v78 + 16) = xmmword_21C27B3E0;
      *(_BYTE *)(v78 + 32) = 2;
      v79 = sub_21C27A448();
      if (!v79)
      {
        swift_release();
        goto LABEL_74;
      }
      v164 = v77;
      v172 = *(const char **)(v79 + 16);
      v178 = v10;
      if (!v172)
      {
        v165 = v79;
        swift_bridgeObjectRetain();
        v93 = 1;
        goto LABEL_72;
      }
      v177 = v5;
      v80 = v194;
      v169 = v79 + ((*(unsigned __int8 *)(v194 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v194 + 80));
      v81 = (void (*)(_QWORD, _QWORD, _QWORD))v79;
      v82 = sub_21C279CE8(v78);
      v83 = *(_QWORD *)(v80 + 72);
      v166 = *(_QWORD *)(v80 + 16);
      v167 = v83;
      v165 = (uint64_t)v81;
      swift_bridgeObjectRetain_n();
      v84 = 0;
      v185 = "emergencyAttribute";
      v186 = "emergency";
      v175 = "crisisSituationHigh";
      v176 = "emergencySirenNoun";
      v174 = "crisisSituationMedium";
      v85 = v184;
      while (1)
      {
        v173 = v84;
        ((void (*)(const char *, unint64_t, uint64_t))v166)(v85, v169 + v167 * (_QWORD)v84, v14);
        v86 = sub_21C279C50(0);
        v195[0] = v86;
        if (v82)
          break;
        v87 = (_QWORD *)v86;
        v88 = v184;
        v89 = sub_21C27A430();
        if (v90)
        {
          v91 = v90;
        }
        else
        {
          v89 = 0;
          v91 = 0xE000000000000000;
        }
        v92 = sub_21C279928(v89, v91, v87);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v92 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          v14 = (uint64_t)v193;
          (*(void (**)(uint64_t, const char *, const char *))(v194 + 32))(v161, v88, v193);
          v93 = 0;
LABEL_71:
          v5 = v177;
          v10 = v178;
LABEL_72:
          v97 = v194;
          v98 = v161;
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v194 + 56))(v161, v93, 1, v14);
          swift_bridgeObjectRelease();
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v97 + 48))(v98, 1, v14) == 1)
          {
            sub_21C26CA50(v98, &qword_255252658);
            swift_release();
            swift_bridgeObjectRelease();
            v17 = v170;
LABEL_74:
            swift_bridgeObjectRelease();
            v6 = v179;
          }
          else
          {
            v116 = sub_21C27A424();
            v118 = v117;
            (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v98, v14);
            swift_bridgeObjectRelease();
            swift_setDeallocating();
            swift_deallocClassInstance();
            v73 = _s20SiriEmergencyIntents0B9SituationO4from15identifierValueACSgSS_tFZ_0(v116, v118);
            swift_release();
            v10 = v178;
            v11 = v192;
            result = swift_bridgeObjectRelease();
            v14 = (uint64_t)v193;
            v6 = v179;
            v17 = v170;
            if (v73 != 34)
              goto LABEL_129;
          }
          goto LABEL_75;
        }
        v84 = v173 + 1;
        v14 = (uint64_t)v193;
        (*(void (**)(const char *, const char *))(v194 + 8))(v88, v193);
        v85 = v88;
        if (v84 == v172)
        {
          swift_bridgeObjectRelease();
          v93 = 1;
          goto LABEL_71;
        }
      }
      if (v82 >= 1)
      {
        swift_bridgeObjectRetain();
        __asm { BR              X9 }
      }
      goto LABEL_132;
    }
  }
LABEL_75:
  Siri_Nlu_External_UserParse.usoTask.getter();
  sub_21C27A46C();
  swift_release();
  if (!v196)
  {
    sub_21C26CA50((uint64_t)v195, &qword_255252668);
    goto LABEL_100;
  }
  sub_21C27A4E4();
  if ((swift_dynamicCast() & 1) != 0)
  {
    sub_21C27A508();
    swift_release();
    v99 = (void (*)(_QWORD, _QWORD, _QWORD))v195[0];
    if (v195[0])
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255252678);
      v100 = swift_initStackObject();
      *(_OWORD *)(v100 + 16) = xmmword_21C27B3E0;
      *(_BYTE *)(v100 + 32) = 2;
      v101 = sub_21C27A448();
      if (!v101)
      {
        swift_release();
        goto LABEL_99;
      }
      v165 = (uint64_t)v99;
      v173 = *(const char **)(v101 + 16);
      v178 = v10;
      if (!v173)
      {
        v166 = v101;
        swift_bridgeObjectRetain();
        v115 = 1;
        goto LABEL_97;
      }
      v177 = v5;
      v102 = v194;
      v172 = (const char *)(v101
                          + ((*(unsigned __int8 *)(v194 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v194 + 80)));
      v103 = v101;
      v104 = sub_21C279CE8(v100);
      v169 = *(_QWORD *)(v102 + 72);
      v105 = *(_QWORD *)(v102 + 16);
      v166 = v103;
      v167 = v105;
      swift_bridgeObjectRetain_n();
      v106 = 0;
      v185 = "emergencyAttribute";
      v186 = "emergency";
      v184 = "emergencySirenNoun";
      v175 = "crisisSituationMedium";
      v176 = "crisisSituationHigh";
      v107 = v183;
      while (1)
      {
        v174 = v106;
        ((void (*)(char *, const char *, uint64_t))v167)(v107, &v172[v169 * (_QWORD)v106], v14);
        v108 = sub_21C279C50(0);
        v195[0] = v108;
        if (v104)
          break;
        v109 = (_QWORD *)v108;
        v110 = v183;
        v111 = sub_21C27A430();
        if (v112)
        {
          v113 = v112;
        }
        else
        {
          v111 = 0;
          v113 = 0xE000000000000000;
        }
        v114 = sub_21C279928(v111, v113, v109);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v114 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          v14 = (uint64_t)v193;
          (*(void (**)(uint64_t, char *, const char *))(v194 + 32))(v160, v110, v193);
          v115 = 0;
LABEL_96:
          v5 = v177;
          v10 = v178;
          v6 = v179;
LABEL_97:
          v119 = v194;
          v120 = v160;
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v194 + 56))(v160, v115, 1, v14);
          swift_bridgeObjectRelease();
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v119 + 48))(v120, 1, v14) == 1)
          {
            sub_21C26CA50(v120, &qword_255252658);
            swift_release();
            swift_bridgeObjectRelease();
            v17 = v170;
LABEL_99:
            swift_bridgeObjectRelease();
            goto LABEL_100;
          }
          v132 = sub_21C27A424();
          v134 = v133;
          (*(void (**)(uint64_t, uint64_t))(v119 + 8))(v120, v14);
          swift_bridgeObjectRelease();
          swift_setDeallocating();
          swift_deallocClassInstance();
          v73 = _s20SiriEmergencyIntents0B9SituationO4from15identifierValueACSgSS_tFZ_0(v132, v134);
          swift_release();
          v10 = v178;
          v11 = v192;
          result = swift_bridgeObjectRelease();
          v14 = (uint64_t)v193;
          v17 = v170;
          if (v73 == 34)
            goto LABEL_100;
          goto LABEL_129;
        }
        v106 = v174 + 1;
        v14 = (uint64_t)v193;
        (*(void (**)(char *, const char *))(v194 + 8))(v110, v193);
        v107 = v110;
        if (v106 == v173)
        {
          swift_bridgeObjectRelease();
          v115 = 1;
          goto LABEL_96;
        }
      }
      if (v104 >= 1)
      {
        swift_bridgeObjectRetain();
        __asm { BR              X9 }
      }
LABEL_133:
      __break(1u);
LABEL_134:
      (*(void (**)(const char *, const char *))(v194 + 8))(v170, v193);
      swift_bridgeObjectRelease();
      __break(1u);
      JUMPOUT(0x21C26B394);
    }
  }
LABEL_100:
  Siri_Nlu_External_UserParse.usoTask.getter();
  sub_21C27A46C();
  swift_release();
  if (!v196)
  {
    sub_21C26CA50((uint64_t)v195, &qword_255252668);
    goto LABEL_117;
  }
  sub_21C27A4CC();
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_117;
  sub_21C27A400();
  swift_release();
  v121 = (const char *)v195[0];
  if (!v195[0])
  {
LABEL_116:
    v6 = v179;
    goto LABEL_117;
  }
  v177 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255252678);
  v122 = swift_initStackObject();
  *(_OWORD *)(v122 + 16) = xmmword_21C27B3E0;
  *(_BYTE *)(v122 + 32) = 2;
  v123 = sub_21C27A448();
  if (!v123)
  {
    swift_release();
LABEL_115:
    swift_bridgeObjectRelease();
    v5 = v177;
    goto LABEL_116;
  }
  v178 = v10;
  v124 = *(_QWORD *)(v123 + 16);
  if (!v124)
  {
    swift_release();
    swift_bridgeObjectRelease();
    v10 = v178;
    goto LABEL_115;
  }
  v186 = v121;
  v125 = v123 + ((*(unsigned __int8 *)(v194 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v194 + 80));
  v126 = (uint64_t)v17;
  v127 = *(_QWORD *)(v194 + 72);
  v128 = *(void (**)(uint64_t, unint64_t, uint64_t))(v194 + 16);
  swift_bridgeObjectRetain();
  while (1)
  {
    v128(v126, v125, v14);
    v129 = v182;
    v130 = sub_21C2799EC(v126, v122);
    v182 = v129;
    if (v129)
      goto LABEL_134;
    v131 = v194;
    if ((v130 & 1) != 0)
      break;
    v126 = (uint64_t)v170;
    v14 = (uint64_t)v193;
    (*(void (**)(const char *, const char *))(v194 + 8))(v170, v193);
    v125 += v127;
    if (!--v124)
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v10 = v178;
      v11 = v192;
      goto LABEL_115;
    }
  }
  swift_bridgeObjectRelease();
  v151 = *(void (**)(char *, const char *, const char *))(v131 + 32);
  v152 = v168;
  v153 = v131;
  v154 = v193;
  v151(v168, v170, v193);
  v155 = sub_21C27A424();
  v157 = v156;
  (*(void (**)(char *, const char *))(v153 + 8))(v152, v154);
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  swift_deallocClassInstance();
  v73 = _s20SiriEmergencyIntents0B9SituationO4from15identifierValueACSgSS_tFZ_0(v155, v157);
  swift_release();
  result = swift_bridgeObjectRelease();
  v5 = v177;
  v10 = v178;
  v6 = v179;
  v11 = v192;
  if (v73 != 34)
    goto LABEL_129;
LABEL_117:
  __swift_instantiateConcreteTypeFromMangledName(&qword_255252678);
  v135 = swift_initStackObject();
  *(_OWORD *)(v135 + 16) = xmmword_21C27B3D0;
  v194 = v135;
  *(_WORD *)(v135 + 32) = 513;
  v136 = Siri_Nlu_External_UserParse.identifiers.getter();
  v183 = *(char **)(v136 + 16);
  if (v183)
  {
    v176 = (const char *)v136;
    v177 = v5;
    v186 = (const char *)(v136
                        + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80)));
    v137 = *(const char **)(v11 + 72);
    v184 = *(const char **)(v11 + 16);
    v185 = v137;
    swift_bridgeObjectRetain();
    v193 = "emergencyConfirmation";
    v174 = "emergencyAttribute";
    v175 = "emergency";
    v172 = "crisisSituationHigh";
    v173 = "emergencySirenNoun";
    v170 = "crisisSituationMedium";
    v178 = v10;
    ((void (*)(char *, const char *, uint64_t))v184)(v191, v186, v10);
    v195[0] = MEMORY[0x24BEE4AF8];
    __asm { BR              X9 }
  }
  v138 = (uint64_t)v190;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v190, 1, 1, v10);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v138, 1, v10) == 1)
  {
    sub_21C26CA50(v138, &qword_255252680);
    swift_setDeallocating();
    swift_deallocClassInstance();
  }
  else
  {
    v139 = v138;
    v140 = sub_21C27A3C4();
    v142 = v141;
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v139, v10);
    swift_setDeallocating();
    swift_deallocClassInstance();
    v73 = _s20SiriEmergencyIntents0B9SituationO4from15identifierValueACSgSS_tFZ_0(v140, v142);
    result = swift_bridgeObjectRelease();
    if (v73 != 34)
      goto LABEL_129;
  }
  Siri_Nlu_External_UserParse.catiIntentName.getter();
  if (!v143
    || (v144 = _s20SiriEmergencyIntents14CATIIntentNameO8rawValueACSgSS_tcfC_0(), v144 == 23)
    || (result = _s20SiriEmergencyIntents0B9SituationO14catiIntentNameACSgAA010CATIIntentG0O_tcfC_0(v144),
        v73 = result,
        result == 34))
  {
    v145 = sub_21C27A5C8();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v180, v145, v5);
    v146 = sub_21C27A5D4();
    v147 = sub_21C27A688();
    if (os_log_type_enabled(v146, v147))
    {
      v148 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v148 = 0;
      _os_log_impl(&dword_21C260000, v146, v147, "No EmergencySituation found in parse", v148, 2u);
      MEMORY[0x220777920](v148, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v180, v5);
    v149 = sub_21C27A5A4();
    sub_21C26CA08();
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v149 - 8) + 104))(v150, *MEMORY[0x24BEA8DB8], v149);
    return swift_willThrow();
  }
  else
  {
LABEL_129:
    *v171 = v73;
  }
  return result;
}

uint64_t sub_21C26B46C@<X0>(char *a1@<X8>)
{
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  char v26;
  char v27;
  void (*v28)(char *, uint64_t);
  char v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;

  v40 = a1;
  v41 = sub_21C27A5E0();
  v1 = *(_QWORD *)(v41 - 8);
  v2 = MEMORY[0x24BDAC7A8](v41);
  v39 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v38 - v4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255252670);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21C27A3A0();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v38 - v14;
  v16 = sub_21C27A340();
  if (*(_QWORD *)(v16 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(v8, v16 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80)), v9);
    v17 = 0;
  }
  else
  {
    v17 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, v17, 1, v9);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_21C26CA50((uint64_t)v8, &qword_255252670);
    v18 = sub_21C27A5C8();
    swift_beginAccess();
    v19 = v41;
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v5, v18, v41);
    v20 = sub_21C27A5D4();
    v21 = sub_21C27A688();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_21C260000, v20, v21, "No EmergencyConfirmation found in parse (no userDialogAct)", v22, 2u);
      MEMORY[0x220777920](v22, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v5, v19);
    v23 = sub_21C27A5A4();
    sub_21C26CA08();
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v24, *MEMORY[0x24BEA8DB8], v23);
    return swift_willThrow();
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v8, v9);
  if ((sub_21C27A370() & 1) != 0)
  {
    v26 = 0;
    result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
LABEL_14:
    *v40 = v26;
    return result;
  }
  v27 = sub_21C27A37C();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  if ((v27 & 1) != 0)
  {
    v28 = *(void (**)(char *, uint64_t))(v10 + 8);
    v28(v13, v9);
LABEL_13:
    v26 = 1;
    result = ((uint64_t (*)(char *, uint64_t))v28)(v15, v9);
    goto LABEL_14;
  }
  v29 = sub_21C27A388();
  v28 = *(void (**)(char *, uint64_t))(v10 + 8);
  v28(v13, v9);
  if ((v29 & 1) != 0)
    goto LABEL_13;
  v30 = sub_21C27A5C8();
  swift_beginAccess();
  v31 = v39;
  v32 = v41;
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v39, v30, v41);
  v33 = sub_21C27A5D4();
  v34 = sub_21C27A688();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v35 = 0;
    _os_log_impl(&dword_21C260000, v33, v34, "No EmergencyConfirmation found in parse", v35, 2u);
    MEMORY[0x220777920](v35, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v31, v32);
  v36 = sub_21C27A5A4();
  sub_21C26CA08();
  swift_allocError();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v36 - 8) + 104))(v37, *MEMORY[0x24BEA8DB8], v36);
  swift_willThrow();
  return ((uint64_t (*)(char *, uint64_t))v28)(v15, v9);
}

uint64_t sub_21C26B8D8@<X0>(char a1@<W1>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  const char *v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[2];
  const char *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  const char *v55;
  const char *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD v72[5];

  v68 = a2;
  v4 = sub_21C27A5E0();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v48 - v9;
  v11 = sub_21C27A43C();
  v12 = *(_QWORD *)(v11 - 8);
  v70 = v11;
  v71 = v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v67 = (char *)v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v69 = (char *)v48 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)v48 - v17;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_255252658);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v21 = MEMORY[0x24BDAC7A8](v20);
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)v48 - v24;
  if ((a1 & 1) == 0)
  {
    v30 = sub_21C27A5C8();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v30, v4);
    v31 = sub_21C27A5D4();
    v32 = sub_21C27A688();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_21C260000, v31, v32, "nlv4MigrationFeatureFlagIsEnabled == false. No crisisSeverity found in parse.", v33, 2u);
      MEMORY[0x220777920](v33, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    goto LABEL_15;
  }
  v65 = v22;
  v66 = v23;
  Siri_Nlu_External_UserParse.usoTask.getter();
  sub_21C27A46C();
  swift_release();
  if (!v72[3])
  {
    sub_21C26CA50((uint64_t)v72, &qword_255252668);
    goto LABEL_12;
  }
  sub_21C27A514();
  if ((swift_dynamicCast() & 1) == 0 || (sub_21C27A400(), swift_release(), !v72[0]))
  {
LABEL_12:
    v34 = sub_21C27A5C8();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v34, v4);
    v35 = sub_21C27A5D4();
    v36 = sub_21C27A688();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_21C260000, v35, v36, "No crisisSeverity found in parse", v37, 2u);
      MEMORY[0x220777920](v37, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
LABEL_15:
    v38 = sub_21C27A5A4();
    sub_21C26CA08();
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v38 - 8) + 104))(v39, *MEMORY[0x24BEA8DB8], v38);
    return swift_willThrow();
  }
  v53 = (const char *)0xE90000000000006ELL;
  v62 = v72[0];
  v26 = sub_21C27A448();
  v64 = v5;
  v59 = v2;
  v61 = v10;
  v28 = v70;
  v27 = v71;
  if (v26)
  {
    v54 = *(const char **)(v26 + 16);
    if (v54)
    {
      v58 = (const char *)(v26
                         + ((*(unsigned __int8 *)(v71 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v71 + 80)));
      v29 = *(const char **)(v71 + 72);
      v56 = *(const char **)(v71 + 16);
      v57 = v29;
      v52 = v26;
      swift_bridgeObjectRetain_n();
      v55 = "emergencyConfirmation";
      v51 = "emergency";
      v50 = "emergencyAttribute";
      v49 = "emergencySirenNoun";
      v48[1] = "crisisSituationHigh";
      v48[0] = "crisisSituationMedium";
      v63 = v4;
      v60 = 1;
      v40 = ((uint64_t (*)(char *, const char *, uint64_t))v56)(v18, v58, v28);
      return ((uint64_t (*)(uint64_t))loc_21C26BE3C)(v40);
    }
    swift_bridgeObjectRetain();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56))(v25, 1, 1, v28);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v28) != 1)
    {
      sub_21C27A424();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v25, v28);
      swift_release();
      swift_bridgeObjectRelease();
      v44 = 2;
      goto LABEL_32;
    }
    sub_21C26CA50((uint64_t)v25, &qword_255252658);
    swift_bridgeObjectRelease();
  }
  v42 = sub_21C27A448();
  if (v42)
  {
    v55 = *(const char **)(v42 + 16);
    if (v55)
    {
      v60 = v42 + ((*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80));
      v43 = *(const char **)(v27 + 72);
      v57 = *(const char **)(v27 + 16);
      v58 = v43;
      v52 = v42;
      swift_bridgeObjectRetain_n();
      v56 = "emergencyConfirmation";
      v54 = "emergency";
      v53 = "emergencyAttribute";
      v51 = "emergencySirenNoun";
      v50 = "crisisSituationHigh";
      v49 = "crisisSituationMedium";
      v63 = v4;
      ((void (*)(char *, uint64_t, uint64_t))v57)(v69, v60, v28);
      JUMPOUT(0x21C26C1E4);
    }
    swift_bridgeObjectRetain();
    v45 = v66;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 56))(v66, 1, 1, v28);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v45, 1, v28) != 1)
    {
      sub_21C27A424();
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v45, v28);
      swift_release();
      swift_bridgeObjectRelease();
      v44 = 1;
      goto LABEL_32;
    }
    sub_21C26CA50(v45, &qword_255252658);
    swift_bridgeObjectRelease();
  }
  v46 = sub_21C27A448();
  if (!v46)
  {
    swift_release();
    goto LABEL_12;
  }
  if (*(_QWORD *)(v46 + 16))
  {
    v69 = (char *)(v46 + ((*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80)));
    v66 = *(_QWORD *)(v27 + 72);
    v60 = *(_QWORD *)(v27 + 16);
    v52 = v46;
    swift_bridgeObjectRetain_n();
    v57 = "emergency";
    v58 = "emergencyConfirmation";
    v55 = "emergencySirenNoun";
    v56 = "emergencyAttribute";
    v54 = "crisisSituationHigh";
    v53 = "crisisSituationMedium";
    v63 = v4;
    ((void (*)(char *, char *, uint64_t))v60)(v67, v69, v28);
    v72[0] = MEMORY[0x24BEE4AF8];
    JUMPOUT(0x21C26C6A0);
  }
  swift_bridgeObjectRetain();
  v47 = v65;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 56))(v65, 1, 1, v28);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v47, 1, v28) == 1)
  {
    sub_21C26CA50(v47, &qword_255252658);
    swift_release();
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  sub_21C27A424();
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v47, v28);
  swift_bridgeObjectRelease();
  swift_release();
  v44 = 0;
LABEL_32:
  result = swift_bridgeObjectRelease();
  *v68 = v44;
  return result;
}

unint64_t sub_21C26CA08()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255252660;
  if (!qword_255252660)
  {
    v1 = sub_21C27A5A4();
    result = MEMORY[0x2207778C0](MEMORY[0x24BEA8DD0], v1);
    atomic_store(result, (unint64_t *)&qword_255252660);
  }
  return result;
}

uint64_t sub_21C26CA50(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t CATIIntentName.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_21C26CACC + 4 * byte_21C27B450[a1]))(0xD00000000000002FLL, 0x800000021C27C3F0);
}

unint64_t sub_21C26CACC()
{
  return 0xD00000000000002BLL;
}

uint64_t sub_21C26CB40()
{
  uint64_t v0;

  return v0 - 3;
}

uint64_t sub_21C26CB50()
{
  uint64_t v0;

  return v0 + 3;
}

uint64_t sub_21C26CB60()
{
  uint64_t v0;

  return v0 + 65;
}

uint64_t sub_21C26CB70()
{
  uint64_t v0;

  return v0 + 68;
}

uint64_t sub_21C26CB80()
{
  uint64_t v0;

  return v0 + 61;
}

uint64_t sub_21C26CB90()
{
  uint64_t v0;

  return v0 + 65;
}

uint64_t sub_21C26CBA0()
{
  uint64_t v0;

  return v0 + 31;
}

uint64_t sub_21C26CBB0()
{
  uint64_t v0;

  return v0 + 27;
}

uint64_t sub_21C26CBC0()
{
  uint64_t v0;

  return v0 + 27;
}

uint64_t sub_21C26CBD0()
{
  uint64_t v0;

  return v0 + 30;
}

uint64_t sub_21C26CBE0()
{
  uint64_t v0;

  return v0 + 14;
}

uint64_t sub_21C26CBF0()
{
  uint64_t v0;

  return v0 + 10;
}

uint64_t sub_21C26CC00()
{
  uint64_t v0;

  return v0 + 14;
}

uint64_t sub_21C26CC10()
{
  uint64_t v0;

  return v0 - 2;
}

void sub_21C26CC20()
{
  JUMPOUT(0x21C26CC2CLL);
}

uint64_t sub_21C26CC38(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = CATIIntentName.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == CATIIntentName.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_21C27A760();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_21C26CCC0()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_21C27A7A8();
  CATIIntentName.rawValue.getter(v1);
  sub_21C27A64C();
  swift_bridgeObjectRelease();
  return sub_21C27A7C0();
}

uint64_t sub_21C26CD20()
{
  unsigned __int8 *v0;

  CATIIntentName.rawValue.getter(*v0);
  sub_21C27A64C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C26CD60()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_21C27A7A8();
  CATIIntentName.rawValue.getter(v1);
  sub_21C27A64C();
  swift_bridgeObjectRelease();
  return sub_21C27A7C0();
}

uint64_t sub_21C26CDBC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s20SiriEmergencyIntents14CATIIntentNameO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_21C26CDE8@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = CATIIntentName.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t _s20SiriEmergencyIntents14CATIIntentNameO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_21C27A76C();
  swift_bridgeObjectRelease();
  if (v0 >= 0x17)
    return 23;
  else
    return v0;
}

unint64_t sub_21C26CE64()
{
  unint64_t result;

  result = qword_255252688;
  if (!qword_255252688)
  {
    result = MEMORY[0x2207778C0](&protocol conformance descriptor for CATIIntentName, &type metadata for CATIIntentName);
    atomic_store(result, (unint64_t *)&qword_255252688);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CATIIntentName(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xEA)
    goto LABEL_17;
  if (a2 + 22 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 22) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 22;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 22;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 22;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x17;
  v8 = v6 - 23;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CATIIntentName(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 22 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 22) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xEA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE9)
    return ((uint64_t (*)(void))((char *)&loc_21C26CF84 + 4 * byte_21C27B46C[v4]))();
  *a1 = a2 + 22;
  return ((uint64_t (*)(void))((char *)sub_21C26CFB8 + 4 * byte_21C27B467[v4]))();
}

uint64_t sub_21C26CFB8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C26CFC0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C26CFC8);
  return result;
}

uint64_t sub_21C26CFD4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C26CFDCLL);
  *(_BYTE *)result = a2 + 22;
  return result;
}

uint64_t sub_21C26CFE0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C26CFE8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CATIIntentName()
{
  return &type metadata for CATIIntentName;
}

unint64_t CrisisSeverity.rawValue.getter(char a1)
{
  unint64_t result;

  result = 0xD000000000000012;
  if (a1)
  {
    if (a1 == 1)
      return 0xD000000000000015;
    else
      return 0xD000000000000013;
  }
  return result;
}

uint64_t sub_21C26D064(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_21C26DFF0(*a1, *a2);
}

uint64_t sub_21C26D070()
{
  return sub_21C271C68();
}

uint64_t sub_21C26D078()
{
  return sub_21C27209C();
}

uint64_t sub_21C26D080()
{
  return sub_21C272634();
}

uint64_t sub_21C26D088@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s20SiriEmergencyIntents14CrisisSeverityO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_21C26D0B4@<X0>(unint64_t *a1@<X8>)
{
  char *v1;
  unint64_t result;
  unint64_t v4;

  result = CrisisSeverity.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t _s20SiriEmergencyIntents14CrisisSeverityO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_21C27A730();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

unint64_t sub_21C26D128()
{
  unint64_t result;

  result = qword_255252690;
  if (!qword_255252690)
  {
    result = MEMORY[0x2207778C0](&protocol conformance descriptor for CrisisSeverity, &type metadata for CrisisSeverity);
    atomic_store(result, (unint64_t *)&qword_255252690);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for CrisisSeverity(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21C26D1B8 + 4 * byte_21C27B555[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21C26D1EC + 4 * asc_21C27B550[v4]))();
}

uint64_t sub_21C26D1EC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C26D1F4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C26D1FCLL);
  return result;
}

uint64_t sub_21C26D208(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C26D210);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21C26D214(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C26D21C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CrisisSeverity()
{
  return &type metadata for CrisisSeverity;
}

uint64_t GeneralEmergencyIntent.isLowRisk.getter(unsigned __int8 a1)
{
  uint64_t v1;
  char v3;

  if (EmergencySituation.rawValue.getter(a1) == 0xD00000000000001ALL && v1 == 0x800000021C27CB20)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v3 = sub_21C27A760();
    swift_bridgeObjectRelease();
    return v3 & 1;
  }
}

uint64_t GeneralEmergencyIntent.isHighRisk.getter(unsigned __int8 a1)
{
  uint64_t v1;
  char v3;

  if (EmergencySituation.rawValue.getter(a1) == 0xD00000000000001BLL && v1 == 0x800000021C27CB00)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v3 = sub_21C27A760();
    swift_bridgeObjectRelease();
    return v3 & 1;
  }
}

SiriEmergencyIntents::GeneralEmergencyIntent_optional __swiftcall GeneralEmergencyIntent.init(emergencySituation:)(SiriEmergencyIntents::EmergencySituation_optional emergencySituation)
{
  SiriEmergencyIntents::EmergencySituation value;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;

  value = emergencySituation.value;
  v2 = emergencySituation.value;
  v3 = sub_21C27A5E0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v2 != 34)
  {
    if (EmergencySituation.rawValue.getter(value) == 0xD00000000000001ALL && v14 == 0x800000021C27CB20)
      goto LABEL_7;
    v15 = sub_21C27A760();
    swift_bridgeObjectRelease();
    if ((v15 & 1) != 0)
      return (SiriEmergencyIntents::GeneralEmergencyIntent_optional)value;
    if (EmergencySituation.rawValue.getter(value) == 0xD00000000000001BLL && v16 == 0x800000021C27CB00)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      return (SiriEmergencyIntents::GeneralEmergencyIntent_optional)value;
    }
    v17 = sub_21C27A760();
    swift_bridgeObjectRelease();
    if ((v17 & 1) != 0)
      return (SiriEmergencyIntents::GeneralEmergencyIntent_optional)value;
  }
  v7 = sub_21C27A5C8();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = sub_21C27A5D4();
  v9 = sub_21C27A694();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v21 = v11;
    *(_DWORD *)v10 = 136315138;
    v19 = v10 + 4;
    LOBYTE(v20) = value;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255252580);
    v12 = sub_21C27A6A0();
    v20 = sub_21C263BE4(v12, v13, &v21);
    sub_21C27A6AC();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21C260000, v8, v9, "Failed to initialize GeneralEmergencyIntent. Unsupported emergencySituation: [%s]", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x220777920](v11, -1, -1);
    MEMORY[0x220777920](v10, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (SiriEmergencyIntents::GeneralEmergencyIntent_optional)34;
}

uint64_t getEnumTagSinglePayload for EmergencySituation(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xDF)
    goto LABEL_17;
  if (a2 + 33 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 33) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 33;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 33;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 33;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x22;
  v8 = v6 - 34;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for GeneralEmergencyIntent(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 33 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 33) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xDF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xDE)
    return ((uint64_t (*)(void))((char *)&loc_21C26D6BC + 4 * byte_21C27B635[v4]))();
  *a1 = a2 + 33;
  return ((uint64_t (*)(void))((char *)sub_21C26D6F0 + 4 * asc_21C27B630[v4]))();
}

uint64_t sub_21C26D6F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C26D6F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C26D700);
  return result;
}

uint64_t sub_21C26D70C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C26D714);
  *(_BYTE *)result = a2 + 33;
  return result;
}

uint64_t sub_21C26D718(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C26D720(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for GeneralEmergencyIntent()
{
  return &type metadata for GeneralEmergencyIntent;
}

SiriEmergencyIntents::EmergencyAttribute_optional __swiftcall EmergencyAttribute.init(catiIntentName:)(SiriEmergencyIntents::CATIIntentName catiIntentName)
{
  if (((catiIntentName - 10) & 0xF8) != 0)
    return (SiriEmergencyIntents::EmergencyAttribute_optional)2;
  else
    return (SiriEmergencyIntents::EmergencyAttribute_optional)(0x101010100000000uLL >> (8 * (catiIntentName - 10)));
}

SiriEmergencyIntents::EmergencyAttribute_optional __swiftcall EmergencyAttribute.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1;
  SiriEmergencyIntents::EmergencyAttribute_optional v2;

  v1 = sub_21C27A730();
  swift_bridgeObjectRelease();
  if (v1 == 1)
    v2.value = SiriEmergencyIntents_EmergencyAttribute_website;
  else
    v2.value = SiriEmergencyIntents_EmergencyAttribute_unknownDefault;
  if (v1)
    return v2;
  else
    return 0;
}

uint64_t EmergencyAttribute.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0x65746973626577;
  else
    return 0x756E20656E6F6870;
}

uint64_t sub_21C26D7F8(char *a1, char *a2)
{
  return sub_21C26E0E4(*a1, *a2);
}

uint64_t sub_21C26D804()
{
  return sub_21C271D0C();
}

uint64_t sub_21C26D80C()
{
  return sub_21C2721D4();
}

uint64_t sub_21C26D814()
{
  return sub_21C2724C8();
}

uint64_t sub_21C26D81C@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_21C27A730();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_21C26D878@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = EmergencyAttribute.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t _s20SiriEmergencyIntents0B9AttributeO4from15identifierValueACSgSS_tFZ_0(uint64_t a1, uint64_t a2)
{
  char v5;
  uint64_t result;
  char v7;
  char v8;
  BOOL v10;

  if (a1 == 0x756E20656E6F6870 && a2 == 0xEC0000007265626DLL)
    return 0;
  v5 = sub_21C27A760();
  result = 0;
  if ((v5 & 1) == 0)
  {
    if (a1 == 0x656E6F6870 && a2 == 0xE500000000000000)
    {
      return 0;
    }
    else
    {
      v7 = sub_21C27A760();
      result = 0;
      if ((v7 & 1) == 0)
      {
        if (a1 == 0x65746973626577 && a2 == 0xE700000000000000)
        {
          return 1;
        }
        else
        {
          v8 = sub_21C27A760();
          v10 = a1 == 0x65676170626577 && a2 == 0xE700000000000000;
          result = 1;
          if ((v8 & 1) == 0 && !v10)
          {
            if ((sub_21C27A760() & 1) != 0)
              return 1;
            else
              return 2;
          }
        }
      }
    }
  }
  return result;
}

unint64_t sub_21C26DA38()
{
  unint64_t result;

  result = qword_255252698;
  if (!qword_255252698)
  {
    result = MEMORY[0x2207778C0](&protocol conformance descriptor for EmergencyAttribute, &type metadata for EmergencyAttribute);
    atomic_store(result, (unint64_t *)&qword_255252698);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for EmergencyAttribute(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21C26DAC8 + 4 * byte_21C27B685[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21C26DAFC + 4 * asc_21C27B680[v4]))();
}

uint64_t sub_21C26DAFC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C26DB04(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C26DB0CLL);
  return result;
}

uint64_t sub_21C26DB18(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C26DB20);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21C26DB24(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C26DB2C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EmergencyAttribute()
{
  return &type metadata for EmergencyAttribute;
}

void sub_21C26DB48(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_21C26DB94(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21C26DC68 + 4 * byte_21C27B779[a2]))(0xD000000000000012);
}

uint64_t sub_21C26DC68(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0xD000000000000012 && v1 == 0x800000021C27C120)
    v2 = 1;
  else
    v2 = sub_21C27A760();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_21C26DD84(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aLabel_2[8 * a1] == *(_QWORD *)&aLabel_2[8 * a2]
    && *(_QWORD *)&aSituatio_0[8 * a1 + 8] == *(_QWORD *)&aSituatio_0[8 * a2 + 8])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_21C27A760();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_21C26DE08(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x65726953706F7453;
  else
    v3 = 0x7269537472617453;
  if (v2)
    v4 = 0xEA00000000006E65;
  else
    v4 = 0xE90000000000006ELL;
  if ((a2 & 1) != 0)
    v5 = 0x65726953706F7453;
  else
    v5 = 0x7269537472617453;
  if ((a2 & 1) != 0)
    v6 = 0xE90000000000006ELL;
  else
    v6 = 0xEA00000000006E65;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_21C27A760();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void sub_21C26DEB0(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_21C26DEFC(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21C26DF5C + 4 * byte_21C27B787[a2]))(a3 - 2);
}

uint64_t sub_21C26DF5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v4;

  if (a1 == a3 - 2 && v3 == 0x800000021C27C2B0)
    v4 = 1;
  else
    v4 = sub_21C27A760();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

uint64_t sub_21C26DFF0(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  char v8;

  v2 = 0xD000000000000012;
  v3 = 0x800000021C27C200;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 0xD000000000000015;
    else
      v5 = 0xD000000000000013;
    if (v4 == 1)
      v6 = 0x800000021C27C1E0;
    else
      v6 = 0x800000021C27C1C0;
    v7 = a2;
    if (!a2)
      goto LABEL_15;
    goto LABEL_9;
  }
  v5 = 0xD000000000000012;
  v6 = 0x800000021C27C200;
  v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1)
      v2 = 0xD000000000000015;
    else
      v2 = 0xD000000000000013;
    if (v7 == 1)
      v3 = 0x800000021C27C1E0;
    else
      v3 = 0x800000021C27C1C0;
  }
LABEL_15:
  if (v5 == v2 && v6 == v3)
    v8 = 1;
  else
    v8 = sub_21C27A760();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_21C26E0E4(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x65746973626577;
  else
    v3 = 0x756E20656E6F6870;
  if (v2)
    v4 = 0xEC0000007265626DLL;
  else
    v4 = 0xE700000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x65746973626577;
  else
    v5 = 0x756E20656E6F6870;
  if ((a2 & 1) != 0)
    v6 = 0xE700000000000000;
  else
    v6 = 0xEC0000007265626DLL;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_21C27A760();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_21C26E18C(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aCall_2[8 * a1] == *(_QWORD *)&aCall_2[8 * a2]
    && *(_QWORD *)&aSummarischecke_0[8 * a1 + 16] == *(_QWORD *)&aSummarischecke_0[8 * a2 + 16])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_21C27A760();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

void sub_21C26E210(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_21C26E25C(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21C26E2AC + 4 * byte_21C27B790[a2]))(a3 + 3);
}

uint64_t sub_21C26E2AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v4;

  if (a1 == a3 + 3 && v3 == 0x800000021C27CA40)
    v4 = 1;
  else
    v4 = sub_21C27A760();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

uint64_t sub_21C26E330(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 28526;
  else
    v3 = 7562617;
  if (v2)
    v4 = 0xE300000000000000;
  else
    v4 = 0xE200000000000000;
  if ((a2 & 1) != 0)
    v5 = 28526;
  else
    v5 = 7562617;
  if ((a2 & 1) != 0)
    v6 = 0xE200000000000000;
  else
    v6 = 0xE300000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_21C27A760();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void sub_21C26E3BC(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_21C26E408(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21C26E498 + 4 * byte_21C27B79A[a2]))(0x636E656772656D65);
}

uint64_t sub_21C26E498(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x636E656772656D65 && v1 == 0xE900000000000079)
    v2 = 1;
  else
    v2 = sub_21C27A760();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t EmergencyCSAMIntent.emergencyVerb.getter(__int16 a1)
{
  return HIBYTE(a1);
}

uint64_t EmergencyCSAMIntent.originalInput.getter(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  return a2;
}

SiriEmergencyIntents::EmergencyCSAMIntent_optional __swiftcall EmergencyCSAMIntent.init(emergencySituation:emergencyVerb:originalInput:)(SiriEmergencyIntents::EmergencySituation_optional emergencySituation, SiriEmergencyIntents::EmergencyVerb_optional emergencyVerb, Swift::String_optional originalInput)
{
  uint64_t object;
  uint64_t countAndFlagsBits;
  int value;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  __int16 v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  __int16 v19;
  uint64_t v20;
  void *v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  SiriEmergencyIntents::EmergencyCSAMIntent_optional result;

  object = (uint64_t)originalInput.value._object;
  countAndFlagsBits = originalInput.value._countAndFlagsBits;
  value = emergencySituation.value;
  v7 = sub_21C27A5E0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((value - 6) > 3)
  {
    swift_bridgeObjectRelease();
    v12 = sub_21C27A5C8();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v12, v7);
    v13 = sub_21C27A5D4();
    v14 = sub_21C27A694();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      v24 = v16;
      *(_DWORD *)v15 = 136315138;
      v22 = v15 + 4;
      LOBYTE(v23) = value;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255252580);
      v17 = sub_21C27A6A0();
      v23 = sub_21C263BE4(v17, v18, &v24);
      sub_21C27A6AC();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21C260000, v13, v14, "Failed to initialize EmergencyCSAMIntent. Unsupported emergencySituation: [%s]", v15, 0xCu);
      object = 1;
      swift_arrayDestroy();
      MEMORY[0x220777920](v16, -1, -1);
      MEMORY[0x220777920](v15, -1, -1);

      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      v11 = 0;
      countAndFlagsBits = 0;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      v11 = 0;
      countAndFlagsBits = 0;
      object = 1;
    }
  }
  else
  {
    v11 = value | (emergencyVerb.value << 8);
  }
  v19 = v11;
  v20 = countAndFlagsBits;
  v21 = (void *)object;
  result.value.originalInput.value._object = v21;
  result.value.originalInput.value._countAndFlagsBits = v20;
  *(_WORD *)&result.value.emergencySituation = v19;
  return result;
}

uint64_t EmergencyCSAMIntent.isCSAMContentReporting.getter(__int16 a1)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;
  char v6;

  if (EmergencySituation.rawValue.getter(a1) == 0xD000000000000011 && v2 == 0x800000021C27CB90)
  {
    swift_bridgeObjectRelease();
    v6 = 1;
  }
  else
  {
    v3 = sub_21C27A760();
    swift_bridgeObjectRelease();
    if ((v3 & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      if (EmergencySituation.rawValue.getter(a1) == 0x7078655F6D617363 && v4 == 0xED0000746963696CLL)
      {
        swift_bridgeObjectRelease();
        __asm { BR              X10 }
      }
      v5 = sub_21C27A760();
      swift_bridgeObjectRelease();
      v6 = 0;
      if ((v5 & 1) != 0 && HIBYTE(a1) != 8)
        __asm { BR              X9 }
    }
  }
  return v6 & 1;
}

uint64_t EmergencyCSAMIntent.isCSAMHelpBadActor.getter(unsigned __int8 a1)
{
  uint64_t v1;
  char v3;

  if (EmergencySituation.rawValue.getter(a1) == 0xD000000000000013 && v1 == 0x800000021C27CB50)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v3 = sub_21C27A760();
    swift_bridgeObjectRelease();
    return v3 & 1;
  }
}

uint64_t EmergencyCSAMIntent.isCSAMHelpVictim.getter(unsigned __int8 a1)
{
  uint64_t v1;
  char v3;

  if (EmergencySituation.rawValue.getter(a1) == 0xD000000000000010 && v1 == 0x800000021C27CB70)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v3 = sub_21C27A760();
    swift_bridgeObjectRelease();
    return v3 & 1;
  }
}

uint64_t EmergencyCSAMIntent.isCSAMExplicit.getter(unsigned __int8 a1)
{
  uint64_t v1;
  char v3;

  if (EmergencySituation.rawValue.getter(a1) == 0x7078655F6D617363 && v1 == 0xED0000746963696CLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v3 = sub_21C27A760();
    swift_bridgeObjectRelease();
    return v3 & 1;
  }
}

uint64_t destroy for EmergencyCSAMIntent()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s20SiriEmergencyIntents19EmergencyCSAMIntentVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_WORD *)a1 = *(_WORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EmergencyCSAMIntent(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for EmergencyCSAMIntent(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_WORD *)a1 = *(_WORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EmergencyCSAMIntent(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for EmergencyCSAMIntent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for EmergencyCSAMIntent()
{
  return &type metadata for EmergencyCSAMIntent;
}

uint64_t EmergencyBasicIntent.emergencySituation.getter(__int16 a1)
{
  return HIBYTE(a1);
}

SiriEmergencyIntents::EmergencyBasicIntent __swiftcall EmergencyBasicIntent.init(emergencyOrganization:emergencySituation:)(SiriEmergencyIntents::EmergencyOrganization_optional emergencyOrganization, SiriEmergencyIntents::EmergencySituation_optional emergencySituation)
{
  return (SiriEmergencyIntents::EmergencyBasicIntent)(emergencyOrganization.value | (*(_WORD *)&emergencySituation << 8));
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for EmergencyBasicIntent(unsigned __int16 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v6;
  int v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 65284 <= 0xFFFEFFFF)
    v2 = 2;
  else
    v2 = 4;
  if (a2 + 65284 < 0xFF0000)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 16)) - 65284;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
      return (*a1 | (v4 << 16)) - 65284;
    }
    v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2))
      return (*a1 | (v4 << 16)) - 65284;
  }
LABEL_17:
  if (*(unsigned __int8 *)a1 <= 4u)
    v6 = 4;
  else
    v6 = *(unsigned __int8 *)a1;
  v7 = v6 - 5;
  if (*(unsigned __int8 *)a1 < 4u)
    v8 = -1;
  else
    v8 = v7;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for EmergencyBasicIntent(_WORD *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 65284 <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (a3 + 65284 < 0xFF0000)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_21C26EE50 + 4 * byte_21C27B8B5[v4]))();
  *a1 = a2 - 252;
  return ((uint64_t (*)(void))((char *)sub_21C26EE84 + 4 * byte_21C27B8B0[v4]))();
}

uint64_t sub_21C26EE84(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_21C26EE8C(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x21C26EE94);
  return result;
}

uint64_t sub_21C26EEA0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x21C26EEA8);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_21C26EEAC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_21C26EEB4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EmergencyBasicIntent()
{
  return &type metadata for EmergencyBasicIntent;
}

uint64_t EmergencyOrganizationInfo.countryCode.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EmergencyOrganizationInfo.languageCode.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EmergencyOrganizationInfo.city.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EmergencyOrganizationInfo.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EmergencyOrganizationInfo.phoneNumber.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EmergencyOrganizationInfo.website.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EmergencyOrganizationInfo.websearchQuery.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 96);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EmergencyOrganizationInfo.emergencyOrganization.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

void __swiftcall EmergencyOrganizationInfo.init(countryCode:languageCode:city:name:phoneNumber:website:websearchQuery:emergencyOrganization:)(SiriEmergencyIntents::EmergencyOrganizationInfo *__return_ptr retstr, Swift::String countryCode, Swift::String languageCode, Swift::String city, Swift::String name, Swift::String phoneNumber, Swift::String website, Swift::String websearchQuery, Swift::String emergencyOrganization)
{
  retstr->countryCode = countryCode;
  retstr->languageCode = languageCode;
  retstr->city = city;
  retstr->name = name;
  retstr->phoneNumber = phoneNumber;
  retstr->website = website;
  retstr->websearchQuery = websearchQuery;
  retstr->emergencyOrganization = emergencyOrganization;
}

double EmergencyOrganizationInfo.init(from:)@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  sub_21C26FDEC(a1, v9);
  if (!v2)
  {
    v5 = v13;
    a2[4] = v12;
    a2[5] = v5;
    v6 = v15;
    a2[6] = v14;
    a2[7] = v6;
    v7 = v9[1];
    *a2 = v9[0];
    a2[1] = v7;
    result = *(double *)&v10;
    v8 = v11;
    a2[2] = v10;
    a2[3] = v8;
  }
  return result;
}

uint64_t sub_21C26F0AC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_21C26F0E4 + 4 * byte_21C27B900[a1]))(0xD000000000000015, 0x800000021C27C160);
}

uint64_t sub_21C26F0E4()
{
  return 0x437972746E756F63;
}

uint64_t sub_21C26F104()
{
  return 0x65676175676E616CLL;
}

uint64_t sub_21C26F124()
{
  return 2037672291;
}

uint64_t sub_21C26F134()
{
  return 1701667182;
}

uint64_t sub_21C26F144()
{
  return 0x6D754E656E6F6870;
}

uint64_t sub_21C26F164()
{
  return 0x65746973626577;
}

uint64_t sub_21C26F17C()
{
  return 0x6372616573626577;
}

BOOL sub_21C26F1A0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21C26F1B4()
{
  sub_21C27A7A8();
  sub_21C27A7B4();
  return sub_21C27A7C0();
}

uint64_t sub_21C26F1F8()
{
  return sub_21C27A7B4();
}

uint64_t sub_21C26F220()
{
  sub_21C27A7A8();
  sub_21C27A7B4();
  return sub_21C27A7C0();
}

uint64_t sub_21C26F260()
{
  unsigned __int8 *v0;

  return sub_21C26F0AC(*v0);
}

uint64_t sub_21C26F268@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21C270AF4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21C26F28C()
{
  return 0;
}

void sub_21C26F298(_BYTE *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_21C26F2A4()
{
  sub_21C2704E4();
  return sub_21C27A7E4();
}

uint64_t sub_21C26F2CC()
{
  sub_21C2704E4();
  return sub_21C27A7F0();
}

uint64_t static EmergencyOrganizationInfo.siren()@<X0>(_QWORD *a1@<X8>)
{
  return sub_21C26F334(0x636E656772656D45, 0xEF6E657269532079, a1);
}

uint64_t static EmergencyOrganizationInfo.emergencyServices()@<X0>(_QWORD *a1@<X8>)
{
  return sub_21C26F334(0xD000000000000012, 0x800000021C27CFD0, a1);
}

uint64_t sub_21C26F334@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0xE000000000000000;
  a3[2] = 0;
  a3[3] = 0xE000000000000000;
  a3[4] = 0;
  a3[5] = 0xE000000000000000;
  a3[6] = result;
  a3[7] = a2;
  a3[8] = 0;
  a3[9] = 0xE000000000000000;
  a3[10] = 0;
  a3[11] = 0xE000000000000000;
  a3[12] = 0;
  a3[13] = 0xE000000000000000;
  a3[14] = 0;
  a3[15] = 0xE000000000000000;
  return result;
}

uint64_t EmergencyOrganizationInfo.websiteURL.getter()
{
  return sub_21C27A2E0();
}

uint64_t EmergencyOrganizationInfo.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552526A0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C2704E4();
  sub_21C27A7D8();
  v8[15] = 0;
  sub_21C27A748();
  if (!v1)
  {
    v8[14] = 1;
    sub_21C27A748();
    v8[13] = 2;
    sub_21C27A748();
    v8[12] = 3;
    sub_21C27A748();
    v8[11] = 4;
    sub_21C27A748();
    v8[10] = 5;
    sub_21C27A748();
    v8[9] = 6;
    sub_21C27A748();
    v8[8] = 7;
    sub_21C27A748();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

double sub_21C26F568@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  sub_21C26FDEC(a1, v9);
  if (!v2)
  {
    v5 = v13;
    a2[4] = v12;
    a2[5] = v5;
    v6 = v15;
    a2[6] = v14;
    a2[7] = v6;
    v7 = v9[1];
    *a2 = v9[0];
    a2[1] = v7;
    result = *(double *)&v10;
    v8 = v11;
    a2[2] = v10;
    a2[3] = v8;
  }
  return result;
}

uint64_t sub_21C26F5B8(_QWORD *a1)
{
  return EmergencyOrganizationInfo.encode(to:)(a1);
}

BOOL EmergencyOrganizationInfo.hasNameAndNumber.getter()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v1 = v0[7];
  if ((v1 & 0x2000000000000000) != 0)
  {
    if ((v1 & 0xF00000000000000) != 0)
      goto LABEL_3;
    return 0;
  }
  if ((v0[6] & 0xFFFFFFFFFFFFLL) == 0)
    return 0;
LABEL_3:
  v2 = v0[9];
  if ((v2 & 0x2000000000000000) != 0)
    v3 = HIBYTE(v2) & 0xF;
  else
    v3 = v0[8] & 0xFFFFFFFFFFFFLL;
  return v3 != 0;
}

BOOL EmergencyOrganizationInfo.hasNameAndWebsite.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v8;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552526B0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *(_QWORD *)(v0 + 56);
  if ((v4 & 0x2000000000000000) != 0)
  {
    if ((v4 & 0xF00000000000000) != 0)
      goto LABEL_3;
    return 0;
  }
  if ((*(_QWORD *)(v0 + 48) & 0xFFFFFFFFFFFFLL) == 0)
    return 0;
LABEL_3:
  sub_21C27A2E0();
  v5 = sub_21C27A2EC();
  v6 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v3, 1, v5) != 1;
  sub_21C270528((uint64_t)v3);
  return v6;
}

BOOL EmergencyOrganizationInfo.hasWebsearchQuery.getter()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 104);
  if ((v1 & 0x2000000000000000) != 0)
    v2 = HIBYTE(v1) & 0xF;
  else
    v2 = *(_QWORD *)(v0 + 96) & 0xFFFFFFFFFFFFLL;
  return v2 != 0;
}

void __swiftcall EmergencyOrganizationInfo.asWebsearchQueryOnly()(SiriEmergencyIntents::EmergencyOrganizationInfo *__return_ptr retstr)
{
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = *v1;
  v2 = (void *)v1[1];
  v4 = v1[2];
  v5 = (void *)v1[3];
  v6 = v1[12];
  v7 = (void *)v1[13];
  v8 = v1[14];
  v9 = (void *)v1[15];
  retstr->countryCode._countAndFlagsBits = v3;
  retstr->countryCode._object = v2;
  retstr->languageCode._countAndFlagsBits = v4;
  retstr->languageCode._object = v5;
  retstr->city._countAndFlagsBits = 0;
  retstr->city._object = (void *)0xE000000000000000;
  retstr->name._countAndFlagsBits = 0;
  retstr->name._object = (void *)0xE000000000000000;
  retstr->phoneNumber._countAndFlagsBits = 0;
  retstr->phoneNumber._object = (void *)0xE000000000000000;
  retstr->website._countAndFlagsBits = 0;
  retstr->website._object = (void *)0xE000000000000000;
  retstr->websearchQuery._countAndFlagsBits = v6;
  retstr->websearchQuery._object = v7;
  retstr->emergencyOrganization._countAndFlagsBits = v8;
  retstr->emergencyOrganization._object = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
}

unint64_t EmergencyOrganizationInfo.asRREntities()()
{
  _QWORD *v0;
  _QWORD *v1;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  unint64_t v45;
  unint64_t v46;
  char *v48;
  uint64_t v49;
  char *v50;
  char *v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552526B0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552526B8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21C27A604();
  v54 = *(_QWORD *)(v8 - 8);
  v55 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v48 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v48 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v48 - v18;
  v20 = sub_21C27A43C();
  v56 = *(_QWORD *)(v20 - 8);
  v57 = v20;
  v21 = MEMORY[0x24BDAC7A8](v20);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v48 - v23;
  v25 = v1[7];
  v26 = HIBYTE(v25) & 0xF;
  if ((v25 & 0x2000000000000000) == 0)
    v26 = v1[6] & 0xFFFFFFFFFFFFLL;
  if (!v26)
    return MEMORY[0x24BEE4AF8];
  v52 = v7;
  v53 = v17;
  v49 = v22;
  v50 = v11;
  v51 = v14;
  v27 = v1[9];
  v28 = HIBYTE(v27) & 0xF;
  if ((v27 & 0x2000000000000000) == 0)
    v28 = v1[8] & 0xFFFFFFFFFFFFLL;
  if (v28)
  {
    v48 = v19;
    sub_21C27A544();
    swift_allocObject();
    v29 = sub_21C27A538();
    sub_21C27A52C();
    sub_21C27A574();
    swift_allocObject();
    sub_21C27A568();
    sub_21C27A490();
    swift_retain();
    sub_21C27A520();
    swift_release();
    sub_21C27A640();
    if (!v30)
      swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_21C27A418();
    sub_21C27A40C();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v24, v57);
    if (MEMORY[0x220777338](v29))
    {
      v32 = sub_21C27A5EC();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v52, 1, 1, v32);
      swift_retain();
      v33 = v48;
      sub_21C27A5F8();
      v34 = v54;
      v35 = v55;
      (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v53, v33, v55);
      v31 = sub_21C279D90(0, 1, 1, MEMORY[0x24BEE4AF8]);
      v37 = *(_QWORD *)(v31 + 16);
      v36 = *(_QWORD *)(v31 + 24);
      if (v37 >= v36 >> 1)
        v31 = sub_21C279D90(v36 > 1, v37 + 1, 1, v31);
      *(_QWORD *)(v31 + 16) = v37 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v34 + 32))(v31+ ((*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80))+ *(_QWORD *)(v34 + 72) * v37, v53, v35);
      swift_release();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v48, v35);
      goto LABEL_17;
    }
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
  }
  v31 = MEMORY[0x24BEE4AF8];
  v34 = v54;
  v35 = v55;
LABEL_17:
  sub_21C27A2E0();
  v38 = sub_21C27A2EC();
  v39 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 48))(v4, 1, v38);
  sub_21C270528((uint64_t)v4);
  if (v39 != 1)
  {
    sub_21C27A4A8();
    swift_allocObject();
    v40 = sub_21C27A49C();
    sub_21C27A490();
    sub_21C27A640();
    if (!v41)
      swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v42 = v49;
    sub_21C27A418();
    sub_21C27A40C();
    (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v42, v57);
    if (MEMORY[0x220777338](v40))
    {
      v43 = sub_21C27A5EC();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v52, 1, 1, v43);
      swift_retain();
      v44 = v51;
      sub_21C27A5F8();
      (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v50, v44, v35);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v31 = sub_21C279D90(0, *(_QWORD *)(v31 + 16) + 1, 1, v31);
      v46 = *(_QWORD *)(v31 + 16);
      v45 = *(_QWORD *)(v31 + 24);
      if (v46 >= v45 >> 1)
        v31 = sub_21C279D90(v45 > 1, v46 + 1, 1, v31);
      *(_QWORD *)(v31 + 16) = v46 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v34 + 32))(v31+ ((*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80))+ *(_QWORD *)(v34 + 72) * v46, v50, v35);
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v51, v35);
    }
    else
    {
      swift_release();
      swift_bridgeObjectRelease();
    }
  }
  return v31;
}

uint64_t sub_21C26FDEC@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t result;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  __int128 v50;
  _OWORD *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  unint64_t v67;
  _OWORD *v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[17];
  uint64_t v79;

  v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552526D8);
  v5 = *(_QWORD *)(v79 - 8);
  MEMORY[0x24BDAC7A8](v79);
  v7 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C2704E4();
  sub_21C27A7CC();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v68 = a2;
  v69 = v5;
  LOBYTE(v78[0]) = 0;
  v8 = sub_21C27A73C();
  if (v9)
    v11 = v8;
  else
    v11 = 0;
  v12 = 0xE000000000000000;
  if (v9)
    v13 = v9;
  else
    v13 = 0xE000000000000000;
  LOBYTE(v78[0]) = 1;
  swift_bridgeObjectRetain();
  v14 = sub_21C27A73C();
  v16 = (uint64_t)a1;
  v17 = v11;
  v67 = v13;
  if (v15)
    v18 = v14;
  else
    v18 = 0;
  if (v15)
    v12 = v15;
  LOBYTE(v78[0]) = 2;
  swift_bridgeObjectRetain();
  v19 = sub_21C27A73C();
  *(_QWORD *)&v66 = v18;
  *((_QWORD *)&v66 + 1) = v12;
  if (v20)
    v21 = v19;
  else
    v21 = 0;
  if (v20)
    v22 = v20;
  else
    v22 = 0xE000000000000000;
  LOBYTE(v78[0]) = 3;
  swift_bridgeObjectRetain();
  v23 = sub_21C27A73C();
  *(_QWORD *)&v65 = v21;
  *((_QWORD *)&v65 + 1) = v22;
  if (v24)
    v25 = v23;
  else
    v25 = 0;
  v64 = v25;
  if (v24)
    v26 = v24;
  else
    v26 = 0xE000000000000000;
  LOBYTE(v78[0]) = 4;
  swift_bridgeObjectRetain();
  v27 = sub_21C27A73C();
  v62 = v26;
  if (v28)
    v29 = v27;
  else
    v29 = 0;
  v30 = 0xE000000000000000;
  if (v28)
    v31 = v28;
  else
    v31 = 0xE000000000000000;
  LOBYTE(v78[0]) = 5;
  swift_bridgeObjectRetain();
  v61 = 0;
  v32 = sub_21C27A73C();
  v63 = v31;
  v59 = v29;
  if (v33)
    v34 = v32;
  else
    v34 = 0;
  if (v33)
    v30 = v33;
  LOBYTE(v78[0]) = 6;
  swift_bridgeObjectRetain();
  v35 = sub_21C27A73C();
  v60 = v30;
  v58 = v35;
  v37 = v36;
  if (v36)
    v38 = v36;
  else
    v38 = 0xE000000000000000;
  LOBYTE(v78[0]) = 7;
  swift_bridgeObjectRetain();
  v39 = sub_21C27A73C();
  if (v37)
    v41 = v58;
  else
    v41 = 0;
  v58 = v41;
  if (v40)
    v42 = v39;
  else
    v42 = 0;
  v61 = v42;
  if (v40)
    v43 = v40;
  else
    v43 = 0xE000000000000000;
  v55 = v43;
  (*(void (**)(char *, uint64_t))(v69 + 8))(v7, v79);
  v56 = v17;
  v57 = v34;
  *(_QWORD *)&v70 = v17;
  *((_QWORD *)&v70 + 1) = v67;
  v44 = v34;
  v45 = *((_QWORD *)&v66 + 1);
  v71 = v66;
  v46 = *((_QWORD *)&v65 + 1);
  v72 = v65;
  *(_QWORD *)&v73 = v64;
  *((_QWORD *)&v73 + 1) = v62;
  *(_QWORD *)&v74 = v59;
  *((_QWORD *)&v74 + 1) = v63;
  *(_QWORD *)&v75 = v44;
  *((_QWORD *)&v75 + 1) = v60;
  *(_QWORD *)&v76 = v41;
  *((_QWORD *)&v76 + 1) = v38;
  *(_QWORD *)&v77 = v61;
  *((_QWORD *)&v77 + 1) = v43;
  sub_21C270E28((uint64_t)&v70);
  v47 = v67;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v48 = v63;
  swift_bridgeObjectRelease();
  v49 = v60;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v16);
  v78[0] = v56;
  v78[1] = v47;
  v78[2] = v66;
  v78[3] = v45;
  v78[4] = v65;
  v78[5] = v46;
  v78[6] = v64;
  v78[7] = v62;
  v78[8] = v59;
  v78[9] = v48;
  v78[10] = v57;
  v78[11] = v49;
  v78[12] = v58;
  v78[13] = v38;
  v78[14] = v61;
  v78[15] = v55;
  result = sub_21C270EBC((uint64_t)v78);
  v50 = v75;
  v51 = v68;
  v68[4] = v74;
  v51[5] = v50;
  v52 = v77;
  v51[6] = v76;
  v51[7] = v52;
  v53 = v71;
  *v51 = v70;
  v51[1] = v53;
  v54 = v73;
  v51[2] = v72;
  v51[3] = v54;
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_21C2704E4()
{
  unint64_t result;

  result = qword_2552526A8;
  if (!qword_2552526A8)
  {
    result = MEMORY[0x2207778C0](&unk_21C27BA70, &type metadata for EmergencyOrganizationInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2552526A8);
  }
  return result;
}

uint64_t sub_21C270528(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552526B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for EmergencyOrganizationInfo(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for EmergencyOrganizationInfo()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for EmergencyOrganizationInfo(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  v8 = a2[11];
  a1[10] = a2[10];
  a1[11] = v8;
  v9 = a2[13];
  a1[12] = a2[12];
  a1[13] = v9;
  v10 = a2[15];
  a1[14] = a2[14];
  a1[15] = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for EmergencyOrganizationInfo(_QWORD *a1, _QWORD *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  a1[13] = a2[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[14] = a2[14];
  a1[15] = a2[15];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy128_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

_QWORD *assignWithTake for EmergencyOrganizationInfo(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_bridgeObjectRelease();
  v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  swift_bridgeObjectRelease();
  v10 = a2[13];
  a1[12] = a2[12];
  a1[13] = v10;
  swift_bridgeObjectRelease();
  v11 = a2[15];
  a1[14] = a2[14];
  a1[15] = v11;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EmergencyOrganizationInfo(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 128))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EmergencyOrganizationInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 128) = 1;
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
    *(_BYTE *)(result + 128) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for EmergencyOrganizationInfo()
{
  return &type metadata for EmergencyOrganizationInfo;
}

uint64_t storeEnumTagSinglePayload for EmergencyOrganizationInfo.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_21C27099C + 4 * byte_21C27B90D[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_21C2709D0 + 4 * byte_21C27B908[v4]))();
}

uint64_t sub_21C2709D0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C2709D8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C2709E0);
  return result;
}

uint64_t sub_21C2709EC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C2709F4);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_21C2709F8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C270A00(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EmergencyOrganizationInfo.CodingKeys()
{
  return &type metadata for EmergencyOrganizationInfo.CodingKeys;
}

unint64_t sub_21C270A20()
{
  unint64_t result;

  result = qword_2552526C0;
  if (!qword_2552526C0)
  {
    result = MEMORY[0x2207778C0](&unk_21C27BA48, &type metadata for EmergencyOrganizationInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2552526C0);
  }
  return result;
}

unint64_t sub_21C270A68()
{
  unint64_t result;

  result = qword_2552526C8;
  if (!qword_2552526C8)
  {
    result = MEMORY[0x2207778C0](&unk_21C27B9B8, &type metadata for EmergencyOrganizationInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2552526C8);
  }
  return result;
}

unint64_t sub_21C270AB0()
{
  unint64_t result;

  result = qword_2552526D0;
  if (!qword_2552526D0)
  {
    result = MEMORY[0x2207778C0](&unk_21C27B9E0, &type metadata for EmergencyOrganizationInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2552526D0);
  }
  return result;
}

uint64_t sub_21C270AF4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x437972746E756F63 && a2 == 0xEB0000000065646FLL;
  if (v3 || (sub_21C27A760() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65676175676E616CLL && a2 == 0xEC00000065646F43 || (sub_21C27A760() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 2037672291 && a2 == 0xE400000000000000 || (sub_21C27A760() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_21C27A760() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6D754E656E6F6870 && a2 == 0xEB00000000726562 || (sub_21C27A760() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x65746973626577 && a2 == 0xE700000000000000 || (sub_21C27A760() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6372616573626577 && a2 == 0xEE00797265755168 || (sub_21C27A760() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000021C27C160)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    v6 = sub_21C27A760();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 7;
    else
      return 8;
  }
}

uint64_t sub_21C270E28(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_21C270EBC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t EmergencyInformationIntent.emergencyAttribute.getter(char a1)
{
  return a1 & 1;
}

uint64_t EmergencyInformationIntent.emergencyOrganization.getter(unsigned int a1)
{
  return a1 >> 8;
}

uint64_t EmergencyInformationIntent.emergencySituation.getter(unsigned int a1)
{
  return HIWORD(a1);
}

SiriEmergencyIntents::EmergencyInformationIntent __swiftcall EmergencyInformationIntent.init(emergencyAttribute:emergencyOrganization:emergencySituation:)(SiriEmergencyIntents::EmergencyAttribute emergencyAttribute, SiriEmergencyIntents::EmergencyOrganization_optional emergencyOrganization, SiriEmergencyIntents::EmergencySituation_optional emergencySituation)
{
  return (SiriEmergencyIntents::EmergencyInformationIntent)((unsigned __int16)(emergencyOrganization.value << 8) | (emergencySituation.value << 16) | emergencyAttribute & 1);
}

BOOL static EmergencyInformationIntentResponseCode.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t EmergencyInformationIntentResponseCode.hash(into:)()
{
  return sub_21C27A7B4();
}

uint64_t EmergencyInformationIntentResponseCode.hashValue.getter()
{
  sub_21C27A7A8();
  sub_21C27A7B4();
  return sub_21C27A7C0();
}

uint64_t EmergencyInformationIntentResponse.code.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t EmergencyInformationIntentResponse.emergencyOrganizationInfo.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21C27100C(v1 + 8, a1);
}

uint64_t sub_21C27100C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552526E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void __swiftcall EmergencyInformationIntentResponse.init(code:emergencyOrganizationInfo:)(SiriEmergencyIntents::EmergencyInformationIntentResponse *__return_ptr retstr, SiriEmergencyIntents::EmergencyInformationIntentResponseCode code, SiriEmergencyIntents::EmergencyOrganizationInfo_optional *emergencyOrganizationInfo)
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _BYTE v9[128];
  _BYTE v10[128];
  _OWORD v11[8];
  void *v12;

  sub_21C2710EC((uint64_t)emergencyOrganizationInfo, (uint64_t)v9);
  sub_21C2710EC((uint64_t)v9, (uint64_t)v10);
  LOBYTE(v11[0]) = code;
  sub_21C2710EC((uint64_t)v10, (uint64_t)v11 + 8);
  v5 = v11[7];
  *(_OWORD *)&retstr->emergencyOrganizationInfo.value.website._object = v11[6];
  *(_OWORD *)&retstr->emergencyOrganizationInfo.value.websearchQuery._object = v5;
  retstr->emergencyOrganizationInfo.value.emergencyOrganization._object = v12;
  v6 = v11[3];
  *(_OWORD *)&retstr->emergencyOrganizationInfo.value.languageCode._object = v11[2];
  *(_OWORD *)&retstr->emergencyOrganizationInfo.value.city._object = v6;
  v7 = v11[5];
  *(_OWORD *)&retstr->emergencyOrganizationInfo.value.name._object = v11[4];
  *(_OWORD *)&retstr->emergencyOrganizationInfo.value.phoneNumber._object = v7;
  v8 = v11[1];
  *(_OWORD *)&retstr->code = v11[0];
  *(_OWORD *)&retstr->emergencyOrganizationInfo.value.countryCode._object = v8;
}

uint64_t sub_21C2710EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552526E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_21C271138()
{
  unint64_t result;

  result = qword_2552526E8;
  if (!qword_2552526E8)
  {
    result = MEMORY[0x2207778C0](&protocol conformance descriptor for EmergencyInformationIntentResponseCode, &type metadata for EmergencyInformationIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_2552526E8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for EmergencyInformationIntent(unsigned __int16 *a1, unsigned int a2)
{
  int v2;
  unsigned int v4;
  BOOL v5;
  int v6;

  if (!a2)
    return 0;
  if (a2 >= 0xFF)
  {
    if ((a2 + 33554177) >> 24)
    {
      v2 = *((unsigned __int8 *)a1 + 3);
      if (*((_BYTE *)a1 + 3))
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776961;
    }
    else
    {
      v2 = *(unsigned __int16 *)((char *)a1 + 3);
      if (*(unsigned __int16 *)((char *)a1 + 3))
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776961;
    }
  }
  v4 = *(unsigned __int8 *)a1;
  v5 = v4 >= 2;
  v6 = v4 - 2;
  if (!v5)
    v6 = -1;
  return (v6 + 1);
}

uint64_t storeEnumTagSinglePayload for EmergencyInformationIntent(uint64_t result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;

  if ((a3 + 33554177) >> 24)
    v3 = 1;
  else
    v3 = 2;
  if (a3 <= 0xFE)
    v3 = 0;
  if (a2 > 0xFE)
  {
    *(_WORD *)result = a2 - 255;
    *(_BYTE *)(result + 2) = (a2 - 255) >> 16;
    if (v3)
    {
      v4 = ((a2 - 255) >> 24) + 1;
      if (v3 == 2)
        *(_WORD *)(result + 3) = v4;
      else
        *(_BYTE *)(result + 3) = v4;
    }
  }
  else
  {
    if (!v3)
      goto LABEL_10;
    if (v3 == 2)
    {
      *(_WORD *)(result + 3) = 0;
LABEL_10:
      if (!a2)
        return result;
LABEL_16:
      *(_BYTE *)result = a2 + 1;
      return result;
    }
    *(_BYTE *)(result + 3) = 0;
    if (a2)
      goto LABEL_16;
  }
  return result;
}

ValueMetadata *type metadata accessor for EmergencyInformationIntent()
{
  return &type metadata for EmergencyInformationIntent;
}

uint64_t storeEnumTagSinglePayload for EmergencyInformationIntentResponseCode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21C2712D4 + 4 * byte_21C27BAC5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21C271308 + 4 * byte_21C27BAC0[v4]))();
}

uint64_t sub_21C271308(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C271310(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C271318);
  return result;
}

uint64_t sub_21C271324(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C27132CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21C271330(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C271338(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EmergencyInformationIntentResponseCode()
{
  return &type metadata for EmergencyInformationIntentResponseCode;
}

uint64_t destroy for EmergencyInformationIntentResponse(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 16);
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for EmergencyInformationIntentResponse(uint64_t a1, uint64_t a2)
{
  _OWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = (_OWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  if (v4)
  {
    *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a1 + 16) = v4;
    v5 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 32) = v5;
    v6 = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 48) = v6;
    v7 = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 64) = v7;
    v8 = *(_QWORD *)(a2 + 80);
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 80) = v8;
    v9 = *(_QWORD *)(a2 + 96);
    *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
    *(_QWORD *)(a1 + 96) = v9;
    v10 = *(_QWORD *)(a2 + 112);
    *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
    *(_QWORD *)(a1 + 112) = v10;
    v11 = *(_QWORD *)(a2 + 128);
    *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
    *(_QWORD *)(a1 + 128) = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v12 = *(_OWORD *)(a2 + 88);
    v3[4] = *(_OWORD *)(a2 + 72);
    v3[5] = v12;
    v13 = *(_OWORD *)(a2 + 120);
    v3[6] = *(_OWORD *)(a2 + 104);
    v3[7] = v13;
    v14 = *(_OWORD *)(a2 + 24);
    *v3 = *(_OWORD *)(a2 + 8);
    v3[1] = v14;
    v15 = *(_OWORD *)(a2 + 56);
    v3[2] = *(_OWORD *)(a2 + 40);
    v3[3] = v15;
  }
  return a1;
}

uint64_t assignWithCopy for EmergencyInformationIntentResponse(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  __int128 *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = (_OWORD *)(a1 + 8);
  v5 = (__int128 *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)(a1 + 16))
  {
    if (v6)
    {
      *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
      *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
      *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
      *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
      *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_21C271718(a1 + 8);
      v7 = v5[3];
      v9 = *v5;
      v8 = v5[1];
      v4[2] = v5[2];
      v4[3] = v7;
      *v4 = v9;
      v4[1] = v8;
      v10 = v5[7];
      v12 = v5[4];
      v11 = v5[5];
      v4[6] = v5[6];
      v4[7] = v10;
      v4[4] = v12;
      v4[5] = v11;
    }
  }
  else if (v6)
  {
    *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
    *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
    *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
    *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
    *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
    *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v13 = *v5;
    v14 = *(_OWORD *)(a2 + 24);
    v15 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = v15;
    *v4 = v13;
    *(_OWORD *)(a1 + 24) = v14;
    v16 = *(_OWORD *)(a2 + 72);
    v17 = *(_OWORD *)(a2 + 88);
    v18 = *(_OWORD *)(a2 + 120);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 120) = v18;
    *(_OWORD *)(a1 + 72) = v16;
    *(_OWORD *)(a1 + 88) = v17;
  }
  return a1;
}

uint64_t sub_21C271718(uint64_t a1)
{
  destroy for EmergencyOrganizationInfo();
  return a1;
}

__n128 __swift_memcpy136_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for EmergencyInformationIntentResponse(uint64_t a1, uint64_t a2)
{
  _OWORD *v3;
  _OWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = (_OWORD *)(a1 + 8);
  v4 = (_OWORD *)(a2 + 8);
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_5;
  v6 = *(_QWORD *)(a2 + 16);
  if (!v6)
  {
    sub_21C271718((uint64_t)v3);
LABEL_5:
    v14 = v4[5];
    v3[4] = v4[4];
    v3[5] = v14;
    v15 = v4[7];
    v3[6] = v4[6];
    v3[7] = v15;
    v16 = v4[1];
    *v3 = *v4;
    v3[1] = v16;
    v17 = v4[3];
    v3[2] = v4[2];
    v3[3] = v17;
    return a1;
  }
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v12;
  swift_bridgeObjectRelease();
  v13 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v13;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EmergencyInformationIntentResponse(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 136))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for EmergencyInformationIntentResponse(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 136) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 136) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for EmergencyInformationIntentResponse()
{
  return &type metadata for EmergencyInformationIntentResponse;
}

void sub_21C271954(char a1)
{
  sub_21C27A7A8();
  __asm { BR              X10 }
}

uint64_t sub_21C2719AC()
{
  sub_21C27A64C();
  swift_bridgeObjectRelease();
  return sub_21C27A7C0();
}

uint64_t sub_21C271A40()
{
  sub_21C27A7A8();
  sub_21C27A64C();
  swift_bridgeObjectRelease();
  return sub_21C27A7C0();
}

uint64_t sub_21C271AA8()
{
  sub_21C27A7A8();
  sub_21C27A64C();
  swift_bridgeObjectRelease();
  return sub_21C27A7C0();
}

uint64_t sub_21C271B14()
{
  sub_21C27A7A8();
  sub_21C27A64C();
  swift_bridgeObjectRelease();
  return sub_21C27A7C0();
}

void sub_21C271B9C(char a1)
{
  sub_21C27A7A8();
  __asm { BR              X10 }
}

uint64_t sub_21C271BF4()
{
  sub_21C27A64C();
  swift_bridgeObjectRelease();
  return sub_21C27A7C0();
}

uint64_t sub_21C271C68()
{
  sub_21C27A7A8();
  sub_21C27A64C();
  swift_bridgeObjectRelease();
  return sub_21C27A7C0();
}

uint64_t sub_21C271D0C()
{
  sub_21C27A7A8();
  sub_21C27A64C();
  swift_bridgeObjectRelease();
  return sub_21C27A7C0();
}

void sub_21C271D94(char a1)
{
  sub_21C27A7A8();
  __asm { BR              X10 }
}

uint64_t sub_21C271DEC()
{
  sub_21C27A64C();
  swift_bridgeObjectRelease();
  return sub_21C27A7C0();
}

void sub_21C271E50(uint64_t a1, char a2)
{
  __asm { BR              X11 }
}

uint64_t sub_21C271E98()
{
  sub_21C27A64C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C271F60()
{
  sub_21C27A64C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C271FA0()
{
  sub_21C27A64C();
  return swift_bridgeObjectRelease();
}

void sub_21C272000(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_21C272044()
{
  sub_21C27A64C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C27209C()
{
  sub_21C27A64C();
  return swift_bridgeObjectRelease();
}

void sub_21C272118(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_21C27215C()
{
  sub_21C27A64C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C2721D4()
{
  sub_21C27A64C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C272234()
{
  sub_21C27A64C();
  return swift_bridgeObjectRelease();
}

void sub_21C272274(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_21C2722B8()
{
  sub_21C27A64C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C272300()
{
  sub_21C27A64C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C272344()
{
  sub_21C27A7A8();
  sub_21C27A64C();
  swift_bridgeObjectRelease();
  return sub_21C27A7C0();
}

void sub_21C2723AC(uint64_t a1, char a2)
{
  sub_21C27A7A8();
  __asm { BR              X10 }
}

uint64_t sub_21C272400()
{
  sub_21C27A64C();
  swift_bridgeObjectRelease();
  return sub_21C27A7C0();
}

uint64_t sub_21C272464()
{
  sub_21C27A7A8();
  sub_21C27A64C();
  swift_bridgeObjectRelease();
  return sub_21C27A7C0();
}

uint64_t sub_21C2724C8()
{
  sub_21C27A7A8();
  sub_21C27A64C();
  swift_bridgeObjectRelease();
  return sub_21C27A7C0();
}

void sub_21C27254C(uint64_t a1, char a2)
{
  sub_21C27A7A8();
  __asm { BR              X10 }
}

uint64_t sub_21C2725A0()
{
  sub_21C27A64C();
  swift_bridgeObjectRelease();
  return sub_21C27A7C0();
}

uint64_t sub_21C272634()
{
  sub_21C27A7A8();
  sub_21C27A64C();
  swift_bridgeObjectRelease();
  return sub_21C27A7C0();
}

void sub_21C2726D4(uint64_t a1, char a2)
{
  sub_21C27A7A8();
  __asm { BR              X10 }
}

uint64_t sub_21C272728()
{
  sub_21C27A64C();
  swift_bridgeObjectRelease();
  return sub_21C27A7C0();
}

uint64_t sub_21C27279C()
{
  sub_21C27A7A8();
  sub_21C27A64C();
  swift_bridgeObjectRelease();
  return sub_21C27A7C0();
}

uint64_t sub_21C272820()
{
  sub_21C27A7A8();
  sub_21C27A64C();
  swift_bridgeObjectRelease();
  return sub_21C27A7C0();
}

SiriEmergencyIntents::EmergencyOrganization_optional __swiftcall EmergencyOrganization.init(catiIntentName:)(SiriEmergencyIntents::CATIIntentName catiIntentName)
{
  if ((catiIntentName - 10) > 0xBu)
    return (SiriEmergencyIntents::EmergencyOrganization_optional)4;
  else
    return (SiriEmergencyIntents::EmergencyOrganization_optional)byte_21C27BDE8[(char)(catiIntentName - 10)];
}

uint64_t EmergencyOrganization.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_21C2728EC + 4 * byte_21C27BC46[a1]))(0xD000000000000019, 0x800000021C27CA20);
}

uint64_t sub_21C2728EC(uint64_t a1)
{
  return a1 + 3;
}

void sub_21C272920(char *a1)
{
  sub_21C26E210(*a1);
}

void sub_21C27292C()
{
  char *v0;

  sub_21C271D94(*v0);
}

void sub_21C272934(uint64_t a1)
{
  char *v1;

  sub_21C272274(a1, *v1);
}

void sub_21C27293C(uint64_t a1)
{
  char *v1;

  sub_21C2723AC(a1, *v1);
}

uint64_t sub_21C272944@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s20SiriEmergencyIntents0B12OrganizationO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_21C272970@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = EmergencyOrganization.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t _s20SiriEmergencyIntents0B12OrganizationO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_21C27A730();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

unint64_t sub_21C2729E4()
{
  unint64_t result;

  result = qword_2552526F0;
  if (!qword_2552526F0)
  {
    result = MEMORY[0x2207778C0](&protocol conformance descriptor for EmergencyOrganization, &type metadata for EmergencyOrganization);
    atomic_store(result, (unint64_t *)&qword_2552526F0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for EmergencyOrganization(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for EmergencyOrganization(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21C272B04 + 4 * byte_21C27BC4F[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_21C272B38 + 4 * byte_21C27BC4A[v4]))();
}

uint64_t sub_21C272B38(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C272B40(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C272B48);
  return result;
}

uint64_t sub_21C272B54(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C272B5CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_21C272B60(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C272B68(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EmergencyOrganization()
{
  return &type metadata for EmergencyOrganization;
}

uint64_t sub_21C272B84()
{
  return swift_deallocClassInstance();
}

uint64_t EmergencyOrganizationInfoProvider.siriLocale.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_21C27A31C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t EmergencyOrganizationInfoProvider.locationProvider.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for EmergencyOrganizationInfoProvider() + 20);
  return sub_21C272C38(v3, a1);
}

uint64_t type metadata accessor for EmergencyOrganizationInfoProvider()
{
  uint64_t result;

  result = qword_255252818;
  if (!qword_255252818)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21C272C38(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t EmergencyOrganizationInfoProvider.resourceDecoder.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for EmergencyOrganizationInfoProvider() + 24));
  sub_21C272CBC(v1);
  return v1;
}

uint64_t sub_21C272CBC(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t EmergencyOrganizationInfoProvider.resourceDecoder.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t result;

  v5 = (uint64_t *)(v2 + *(int *)(type metadata accessor for EmergencyOrganizationInfoProvider() + 24));
  result = sub_21C272D10(*v5);
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t sub_21C272D10(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t (*EmergencyOrganizationInfoProvider.resourceDecoder.modify())()
{
  type metadata accessor for EmergencyOrganizationInfoProvider();
  return nullsub_1;
}

uint64_t EmergencyOrganizationInfoProvider.init(siriLocale:locationProvider:resourceDecoder:)@<X0>(uint64_t a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t result;

  v10 = type metadata accessor for EmergencyOrganizationInfoProvider();
  v11 = (_QWORD *)(a5 + *(int *)(v10 + 24));
  v12 = sub_21C27A31C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(a5, a1, v12);
  result = sub_21C272DD4(a2, a5 + *(int *)(v10 + 20));
  *v11 = a3;
  v11[1] = a4;
  return result;
}

uint64_t sub_21C272DD4(__int128 *a1, uint64_t a2)
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

uint64_t sub_21C272DEC(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  void (**v5)(char *, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t ObjCClassFromMetadata;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void (**v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  unint64_t v28;
  id v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  _BYTE *v35;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  id v56;
  _QWORD *v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61[4];

  v4 = sub_21C27A5E0();
  v5 = *(void (***)(char *, uint64_t, uint64_t))(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v50 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v53 = (char *)&v50 - v10;
  v59 = sub_21C27A2EC();
  v57 = *(_QWORD **)(v59 - 8);
  v11 = MEMORY[0x24BDAC7A8](v59);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v50 - v12;
  type metadata accessor for BundleHelper();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v15 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v55 = a1;
  v58 = a2;
  v16 = (void *)sub_21C27A610();
  v17 = (void *)sub_21C27A610();
  v18 = objc_msgSend(v15, sel_pathForResource_ofType_inDirectory_, v16, v17, 0);

  if (v18)
  {
    v56 = v15;
    v19 = v5;
    sub_21C27A61C();

    sub_21C27A2D4();
    swift_bridgeObjectRelease();
    v20 = sub_21C27A2F8();
    v54 = v13;
    v32 = v20;
    v34 = v33;
    sub_21C27A2C8();
    swift_allocObject();
    sub_21C27A2BC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255252878);
    sub_21C277460();
    sub_21C27A2B0();
    v51 = v32;
    swift_release();
    v37 = v61[1];
    v38 = sub_21C27A5C8();
    swift_beginAccess();
    v39 = v53;
    v19[2](v53, v38, v4);
    swift_bridgeObjectRetain_n();
    v40 = sub_21C27A5D4();
    v41 = sub_21C27A688();
    if (os_log_type_enabled(v40, v41))
    {
      v52 = v4;
      v43 = (uint8_t *)swift_slowAlloc();
      v44 = swift_slowAlloc();
      v45 = v58;
      v46 = v34;
      v47 = v44;
      v61[0] = v44;
      *(_DWORD *)v43 = 136315138;
      v50 = v43 + 4;
      swift_bridgeObjectRetain();
      v60 = sub_21C263BE4(v55, v45, v61);
      sub_21C27A6AC();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21C260000, v40, v41, "Successfully decoded plist for resourceName: %s", v43, 0xCu);
      swift_arrayDestroy();
      v48 = v47;
      v34 = v46;
      MEMORY[0x220777920](v48, -1, -1);
      MEMORY[0x220777920](v43, -1, -1);

      v13 = v54;
      ((void (*)(char *, uint64_t))v19[1])(v39, v52);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      ((void (*)(char *, uint64_t))v19[1])(v39, v4);
    }
    v49 = v57;
    swift_bridgeObjectRetain();

    sub_21C27754C(v51, v34);
    ((void (*)(char *, uint64_t))v49[1])(v13, v59);
    swift_bridgeObjectRelease();
  }
  else
  {
    v21 = sub_21C27A5C8();
    swift_beginAccess();
    v5[2](v9, v21, v4);
    swift_bridgeObjectRetain_n();
    v22 = v15;
    v23 = sub_21C27A5D4();
    v24 = sub_21C27A694();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = swift_slowAlloc();
      v52 = v4;
      v26 = v25;
      v57 = (_QWORD *)swift_slowAlloc();
      v59 = swift_slowAlloc();
      v60 = (uint64_t)v22;
      v61[0] = v59;
      *(_DWORD *)v26 = 138412546;
      v53 = (char *)v5;
      v27 = v22;
      v28 = v58;
      v29 = v27;
      sub_21C27A6AC();
      v30 = v57;
      *v57 = v22;

      *(_WORD *)(v26 + 12) = 2080;
      swift_bridgeObjectRetain();
      v60 = sub_21C263BE4(v55, v28, v61);
      sub_21C27A6AC();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21C260000, v23, v24, "Error getting path from bundle [%@] for resource file: %s.plist", (uint8_t *)v26, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255252860);
      swift_arrayDestroy();
      MEMORY[0x220777920](v30, -1, -1);
      v31 = v59;
      swift_arrayDestroy();
      MEMORY[0x220777920](v31, -1, -1);
      MEMORY[0x220777920](v26, -1, -1);

      (*((void (**)(char *, uint64_t))v53 + 1))(v9, v52);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      ((void (*)(char *, uint64_t))v5[1])(v9, v4);
    }
    sub_21C2763F0();
    v37 = swift_allocError();
    *v35 = 0;

  }
  return v37;
}

uint64_t EmergencyOrganizationInfoProvider.getOrganizationInfo(situation:organization:)(uint64_t a1, char a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v4 + 1664) = v3;
  *(_BYTE *)(v4 + 146) = a3;
  *(_BYTE *)(v4 + 145) = a2;
  *(_QWORD *)(v4 + 1656) = a1;
  v5 = type metadata accessor for EmergencyOrganizationInfoProvider();
  *(_QWORD *)(v4 + 1672) = v5;
  v6 = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v4 + 1680) = v6;
  *(_QWORD *)(v4 + 1688) = *(_QWORD *)(v6 + 64);
  *(_QWORD *)(v4 + 1696) = swift_task_alloc();
  *(_QWORD *)(v4 + 1704) = swift_task_alloc();
  v7 = sub_21C27A5E0();
  *(_QWORD *)(v4 + 1712) = v7;
  *(_QWORD *)(v4 + 1720) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v4 + 1728) = swift_task_alloc();
  *(_QWORD *)(v4 + 1736) = swift_task_alloc();
  *(_QWORD *)(v4 + 1744) = swift_task_alloc();
  *(_QWORD *)(v4 + 1752) = swift_task_alloc();
  *(_QWORD *)(v4 + 1760) = swift_task_alloc();
  *(_QWORD *)(v4 + 1768) = swift_task_alloc();
  *(_QWORD *)(v4 + 1776) = swift_task_alloc();
  *(_QWORD *)(v4 + 1784) = swift_task_alloc();
  *(_QWORD *)(v4 + 1792) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21C2737E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  unint64_t v16;
  uint64_t v17;
  SiriEmergencyIntents::EmergencySituation_optional v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  SiriEmergencyIntents::EmergencySituation value;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  char v62;

  v1 = *(_QWORD *)(v0 + 1792);
  v2 = *(_QWORD *)(v0 + 1720);
  v3 = *(_QWORD *)(v0 + 1712);
  v4 = sub_21C27A5C8();
  *(_QWORD *)(v0 + 1800) = v4;
  swift_beginAccess();
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  *(_QWORD *)(v0 + 1808) = v5;
  v5(v1, v4, v3);
  v6 = sub_21C27A5D4();
  v7 = sub_21C27A688();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = *(unsigned __int8 *)(v0 + 145);
    v9 = swift_slowAlloc();
    v59 = swift_slowAlloc();
    *(_DWORD *)v9 = 136315394;
    if (v8 == 34)
    {
      v10 = 0xE300000000000000;
      v11 = 7104878;
    }
    else
    {
      v11 = EmergencySituation.rawValue.getter(*(_BYTE *)(v0 + 145));
      v10 = v16;
    }
    v17 = *(unsigned __int8 *)(v0 + 146);
    *(_QWORD *)(v0 + 1640) = sub_21C263BE4(v11, v10, (uint64_t *)&v59);
    sub_21C27A6AC();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    __asm { BR              X9 }
  }
  v12 = *(_QWORD *)(v0 + 1792);
  v13 = *(_QWORD *)(v0 + 1720);
  v14 = *(_QWORD *)(v0 + 1712);

  v15 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
  v15(v12, v14);
  *(_QWORD *)(v0 + 1816) = v15;
  v18.value = inferUsableSituation(situation:organization:)(*(SiriEmergencyIntents::EmergencySituation_optional *)(v0 + 145), *(SiriEmergencyIntents::EmergencyOrganization_optional *)(v0 + 146)).value;
  if (v18.value == SiriEmergencyIntents_EmergencySituation_unknownDefault)
  {
    v19 = v0 + 424;
    v20 = *(_QWORD *)(v0 + 1728);
    v21 = *(_QWORD *)(v0 + 1712);
    swift_beginAccess();
    v5(v20, v4, v21);
    v22 = sub_21C27A5D4();
    v23 = sub_21C27A694();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_21C260000, v22, v23, "Both EmergencySituation and EmergencyOrganization were nil while fetching Resource", v24, 2u);
      MEMORY[0x220777920](v24, -1, -1);
    }
    v25 = *(_QWORD *)(v0 + 1728);
    v26 = *(_QWORD *)(v0 + 1712);

    v15(v25, v26);
    sub_21C2763F0();
    v27 = swift_allocError();
    *v28 = 1;
    *(_QWORD *)(v0 + 424) = v27;
    goto LABEL_19;
  }
  value = v18.value;
  v30 = *(_QWORD *)(v0 + 1664);
  v31 = (uint64_t *)(v30 + *(int *)(*(_QWORD *)(v0 + 1672) + 24));
  v33 = *v31;
  v32 = v31[1];
  v34 = *(_QWORD *)(v0 + 1704);
  if (*v31)
  {
    v35 = swift_allocObject();
    *(_QWORD *)(v35 + 16) = v33;
    *(_QWORD *)(v35 + 24) = v32;
    sub_21C276440(v30, v34);
    sub_21C272CBC(v33);
    sub_21C2765B4(v34);
  }
  else
  {
    v36 = *(_QWORD *)(v0 + 1696);
    v37 = *(_QWORD *)(v0 + 1680);
    sub_21C276440(*(_QWORD *)(v0 + 1664), *(_QWORD *)(v0 + 1704));
    sub_21C276440(v34, v36);
    v38 = (*(unsigned __int8 *)(v37 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
    v39 = swift_allocObject();
    sub_21C27651C(v36, v39 + v38);
    sub_21C272CBC(0);
    sub_21C2765B4(v34);
    v40 = swift_allocObject();
    *(_QWORD *)(v40 + 16) = sub_21C276560;
    *(_QWORD *)(v40 + 24) = v39;
  }
  if ((value & 0xFE) == 4)
  {
    v41 = 0xD00000000000001DLL;
    v42 = 0x800000021C27D030;
  }
  else
  {
    *(_QWORD *)(v0 + 1496) = EmergencySituation.rawValue.getter(value);
    *(_QWORD *)(v0 + 1504) = v43;
    sub_21C276618();
    v44 = sub_21C27A6C4();
    v46 = v45;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 1512) = v44;
    *(_QWORD *)(v0 + 1520) = v46;
    *(_QWORD *)(v0 + 1528) = 32;
    *(_QWORD *)(v0 + 1536) = 0xE100000000000000;
    *(_QWORD *)(v0 + 1544) = 0;
    *(_QWORD *)(v0 + 1552) = 0xE000000000000000;
    v47 = sub_21C27A6D0();
    v42 = v48;
    swift_bridgeObjectRelease();
    v60 = v42;
    swift_bridgeObjectRetain();
    sub_21C27A658();
    swift_bridgeObjectRelease();
    v41 = v47;
  }
  v59 = v41;
  v60 = v42;
  sub_21C276614(&v59, (uint64_t)&v61);
  swift_release();
  swift_bridgeObjectRelease();
  v49 = v61;
  *(_QWORD *)(v0 + 1824) = v61;
  if ((v62 & 1) != 0)
  {
    v19 = v0 + 560;
    *(_QWORD *)(v0 + 560) = v49;
LABEL_19:
    sub_21C276434(v19);
    sub_21C2767F8(v19, v0 + 152, &qword_255252708);
    sub_21C2767F8(v0 + 152, *(_QWORD *)(v0 + 1656), &qword_255252708);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v51 = *(_QWORD *)(v0 + 1672);
  v52 = *(_QWORD *)(v0 + 1664);
  swift_bridgeObjectRetain();
  *(_QWORD *)(v0 + 1832) = sub_21C27A310();
  *(_QWORD *)(v0 + 1840) = v53;
  v54 = *(int *)(v51 + 20);
  *(_DWORD *)(v0 + 148) = v54;
  v55 = *(_QWORD *)(v52 + v54 + 24);
  v56 = *(_QWORD *)(v52 + v54 + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v52 + v54), v55);
  v58 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v56 + 16) + *(_QWORD *)(v56 + 16));
  v57 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 1848) = v57;
  *v57 = v0;
  v57[1] = sub_21C273F0C;
  return v58(v55, v56);
}

uint64_t sub_21C273F0C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 1856) = a1;
  *(_QWORD *)(v3 + 1864) = a2;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21C273F6C()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  _BOOL4 v31;
  void (*v32)(uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  void (*v47)(uint64_t, uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  _BOOL4 v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  void (*v62)(uint64_t, uint64_t);
  uint64_t v63;
  uint64_t v64;
  void (*v65)(uint64_t, uint64_t, uint64_t);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  NSObject *v71;
  os_log_type_t v72;
  _BOOL4 v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  void (*v82)(uint64_t, uint64_t);
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  int64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  _QWORD *v96;
  void (*v97)(uint64_t, uint64_t, uint64_t);
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  _OWORD *v101;
  uint64_t v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  NSObject *v109;
  os_log_type_t v110;
  _BOOL4 v111;
  void (*v112)(uint64_t, uint64_t);
  uint64_t v113;
  uint64_t v114;
  uint8_t *v115;
  uint64_t v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  NSObject *v124;
  os_log_type_t v125;
  _BOOL4 v126;
  uint64_t v127;
  uint8_t *v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  uint64_t v133;
  uint64_t v134;
  os_log_type_t type;
  os_log_type_t typea;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void (*v148)(uint64_t, uint64_t);
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void (*v154)(uint64_t, uint64_t);
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void (*v158)(uint64_t, uint64_t);
  uint64_t v159;
  uint64_t v160;
  void (*v161)(uint64_t, uint64_t);
  uint64_t v162;
  uint64_t (*v163)(uint64_t, uint64_t);
  uint64_t v164;
  uint64_t v165[2];

  v1 = *(_QWORD *)(v0 + 1864);
  v2 = *(_QWORD *)(v0 + 1840);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1808);
  v4 = *(_QWORD *)(v0 + 1800);
  v5 = *(_QWORD *)(v0 + 1784);
  v6 = *(_QWORD *)(v0 + 1712);
  swift_beginAccess();
  v3(v5, v4, v6);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v7 = sub_21C27A5D4();
  v8 = sub_21C27A688();
  if (os_log_type_enabled(v7, v8))
  {
    v143 = *(_QWORD *)(v0 + 1864);
    v139 = *(_QWORD *)(v0 + 1856);
    v9 = *(_QWORD *)(v0 + 1840);
    v10 = *(_QWORD *)(v0 + 1832);
    v157 = *(_QWORD *)(v0 + 1784);
    v161 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
    v152 = *(_QWORD *)(v0 + 1712);
    v11 = swift_slowAlloc();
    v147 = swift_slowAlloc();
    v165[0] = v147;
    *(_DWORD *)v11 = 136315394;
    if (v9)
    {
      v12 = v2;
    }
    else
    {
      v10 = 0x3E7974706D653CLL;
      v12 = 0xE700000000000000;
    }
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 1624) = sub_21C263BE4(v10, v12, v165);
    sub_21C27A6AC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v11 + 12) = 2080;
    if (v143)
      v13 = v139;
    else
      v13 = 0x3E7974706D653CLL;
    if (v143)
      v14 = v1;
    else
      v14 = 0xE700000000000000;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 1632) = sub_21C263BE4(v13, v14, v165);
    sub_21C27A6AC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21C260000, v7, v8, "Looking for an organization matching siriLanguageCode: %s, physicalLocationCountryCode: %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x220777920](v147, -1, -1);
    MEMORY[0x220777920](v11, -1, -1);

    v161(v157, v152);
  }
  else
  {
    v15 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
    v16 = *(_QWORD *)(v0 + 1784);
    v17 = *(_QWORD *)(v0 + 1712);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    v15(v16, v17);
  }
  v18 = *(_QWORD *)(v0 + 1864);
  v19 = *(_QWORD *)(v0 + 1856);
  v20 = *(_QWORD *)(v0 + 1840);
  v21 = *(_QWORD *)(v0 + 1832);
  v22 = *(void **)(v0 + 1824);
  sub_21C2767E0(v22, 0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v23 = sub_21C2769F4((uint64_t)v22, v21, v20, v19, v18);
  *(_QWORD *)(v0 + 1872) = 0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21C2767EC((uint64_t)v22, 0);
  *(_QWORD *)(v0 + 1608) = v23;
  v24 = *(_QWORD *)(v23 + 16);
  if (v24 < 2)
  {
    v41 = v0 + 152;
    if (v24)
    {
      sub_21C2767EC(*(_QWORD *)(v0 + 1824), 0);
      swift_bridgeObjectRelease();
    }
    else
    {
      v47 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1808);
      v48 = *(_QWORD *)(v0 + 1800);
      v49 = *(_QWORD *)(v0 + 1760);
      v50 = *(_QWORD *)(v0 + 1712);
      swift_beginAccess();
      v47(v49, v48, v50);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v51 = sub_21C27A5D4();
      v52 = sub_21C27A688();
      v53 = os_log_type_enabled(v51, v52);
      v54 = *(_QWORD *)(v0 + 1864);
      if (v53)
      {
        v134 = *(_QWORD *)(v0 + 1856);
        v55 = *(_QWORD *)(v0 + 1840);
        type = v52;
        v56 = *(_QWORD *)(v0 + 1832);
        v144 = *(_QWORD *)(v0 + 1760);
        v148 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
        v140 = *(_QWORD *)(v0 + 1712);
        v57 = swift_slowAlloc();
        v137 = swift_slowAlloc();
        v165[0] = v137;
        *(_DWORD *)v57 = 136315394;
        if (v55)
          v58 = v56;
        else
          v58 = 0x3E7974706D653CLL;
        if (v55)
          v59 = v55;
        else
          v59 = 0xE700000000000000;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 1560) = sub_21C263BE4(v58, v59, v165);
        sub_21C27A6AC();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v57 + 12) = 2080;
        if (v54)
          v60 = v134;
        else
          v60 = 0x3E7974706D653CLL;
        if (v54)
          v61 = v54;
        else
          v61 = 0xE700000000000000;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 1568) = sub_21C263BE4(v60, v61, v165);
        sub_21C27A6AC();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_21C260000, v51, type, "No orgs found matching siriLanguageCode: %s, physicalLocationCountryCode: %s.", (uint8_t *)v57, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x220777920](v137, -1, -1);
        MEMORY[0x220777920](v57, -1, -1);

        v148(v144, v140);
      }
      else
      {
        v62 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
        v63 = *(_QWORD *)(v0 + 1760);
        v64 = *(_QWORD *)(v0 + 1712);

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        v62(v63, v64);
      }
      v65 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1808);
      v66 = *(_QWORD *)(v0 + 1800);
      v67 = *(_QWORD *)(v0 + 1752);
      v68 = *(_QWORD *)(v0 + 1712);
      v149 = sub_21C27A304();
      v70 = v69;
      swift_beginAccess();
      v65(v67, v66, v68);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v71 = sub_21C27A5D4();
      v72 = sub_21C27A688();
      v73 = os_log_type_enabled(v71, v72);
      v74 = *(_QWORD *)(v0 + 1840);
      if (v73)
      {
        typea = v72;
        v75 = *(_QWORD *)(v0 + 1832);
        v154 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
        v141 = *(_QWORD *)(v0 + 1712);
        v145 = *(_QWORD *)(v0 + 1752);
        v76 = swift_slowAlloc();
        v138 = swift_slowAlloc();
        v165[0] = v138;
        *(_DWORD *)v76 = 136315394;
        if (v74)
          v77 = v75;
        else
          v77 = 0x3E7974706D653CLL;
        if (v74)
          v78 = v74;
        else
          v78 = 0xE700000000000000;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 1584) = sub_21C263BE4(v77, v78, v165);
        sub_21C27A6AC();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v76 + 12) = 2080;
        if (v70)
          v79 = v149;
        else
          v79 = 0x3E7974706D653CLL;
        if (v70)
          v80 = v70;
        else
          v80 = 0xE700000000000000;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 1576) = sub_21C263BE4(v79, v80, v165);
        sub_21C27A6AC();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_21C260000, v71, typea, "Falling back to locale search. Looking for an organization matching siriLanguageCode: %s, siriRegionCode: %s.", (uint8_t *)v76, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x220777920](v138, -1, -1);
        MEMORY[0x220777920](v76, -1, -1);

        v154(v145, v141);
        v81 = v149;
      }
      else
      {
        v82 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
        v83 = *(_QWORD *)(v0 + 1752);
        v84 = *(_QWORD *)(v0 + 1712);
        swift_bridgeObjectRelease_n();

        swift_bridgeObjectRelease_n();
        v82(v83, v84);
        v81 = v149;
      }
      v85 = *(_QWORD *)(v0 + 1824);
      v86 = sub_21C2769F4(v85, *(_QWORD *)(v0 + 1832), *(_QWORD *)(v0 + 1840), v81, v70);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_21C2767EC(v85, 0);
      v87 = (uint64_t *)(v0 + 1608);
      swift_beginAccess();
      *(_QWORD *)(v0 + 1608) = v86;
      swift_bridgeObjectRelease();
      v88 = *(_QWORD *)(v86 + 16);
      v23 = MEMORY[0x24BEE4AF8];
      if (v88)
      {
        v165[0] = MEMORY[0x24BEE4AF8];
        swift_bridgeObjectRetain();
        sub_21C27665C(0, v88, 0);
        v89 = 0;
        v23 = v165[0];
        v90 = *(_QWORD *)(v165[0] + 16);
        v142 = v90 << 7;
        v146 = v86;
        do
        {
          v91 = *(_QWORD *)(v86 + v89 + 40);
          v92 = *(_QWORD *)(v86 + v89 + 56);
          v150 = *(_QWORD *)(v86 + v89 + 48);
          v155 = *(_QWORD *)(v86 + v89 + 32);
          v93 = *(_QWORD *)(v86 + v89 + 136);
          v94 = *(_QWORD *)(v86 + v89 + 152);
          v159 = *(_QWORD *)(v86 + v89 + 128);
          v164 = *(_QWORD *)(v86 + v89 + 144);
          v165[0] = v23;
          v95 = *(_QWORD *)(v23 + 24);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (v90 >= v95 >> 1)
          {
            sub_21C27665C(v95 > 1, v90 + 1, 1);
            v23 = v165[0];
          }
          *(_QWORD *)(v23 + 16) = v90 + 1;
          v96 = (_QWORD *)(v23 + v142 + v89);
          v96[4] = v155;
          v96[5] = v91;
          v96[6] = v150;
          v96[7] = v92;
          v96[8] = 0;
          v96[9] = 0xE000000000000000;
          v96[10] = 0;
          v96[11] = 0xE000000000000000;
          v96[12] = 0;
          v96[13] = 0xE000000000000000;
          v96[14] = 0;
          v96[15] = 0xE000000000000000;
          v96[16] = v159;
          v96[17] = v93;
          v89 += 128;
          ++v90;
          v96[18] = v164;
          v96[19] = v94;
          --v88;
          v86 = v146;
        }
        while (v88);
        swift_bridgeObjectRelease();
        v87 = (uint64_t *)(v0 + 1608);
      }
      *v87 = v23;
      v41 = v0 + 152;
    }
    swift_bridgeObjectRelease();
    v97 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1808);
    v98 = *(_QWORD *)(v0 + 1800);
    v99 = *(_QWORD *)(v0 + 1712);
    if (*(_QWORD *)(v23 + 16))
    {
      v100 = v0 + 288;
      v101 = (_OWORD *)(v0 + 952);
      v102 = *(_QWORD *)(v0 + 1744);
      v103 = *(_OWORD *)(v23 + 80);
      v105 = *(_OWORD *)(v23 + 32);
      v104 = *(_OWORD *)(v23 + 48);
      *(_OWORD *)(v0 + 984) = *(_OWORD *)(v23 + 64);
      *(_OWORD *)(v0 + 1000) = v103;
      *(_OWORD *)(v0 + 952) = v105;
      *(_OWORD *)(v0 + 968) = v104;
      v106 = *(_OWORD *)(v23 + 144);
      v108 = *(_OWORD *)(v23 + 96);
      v107 = *(_OWORD *)(v23 + 112);
      *(_OWORD *)(v0 + 1048) = *(_OWORD *)(v23 + 128);
      *(_OWORD *)(v0 + 1064) = v106;
      *(_OWORD *)(v0 + 1016) = v108;
      *(_OWORD *)(v0 + 1032) = v107;
      swift_beginAccess();
      v97(v102, v98, v99);
      sub_21C270E28(v0 + 952);
      sub_21C270E28(v0 + 952);
      sub_21C270E28(v0 + 952);
      v109 = sub_21C27A5D4();
      v110 = sub_21C27A688();
      v111 = os_log_type_enabled(v109, v110);
      v112 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
      v113 = *(_QWORD *)(v0 + 1744);
      v114 = *(_QWORD *)(v0 + 1712);
      if (v111)
      {
        v156 = *(_QWORD *)(v0 + 1824);
        v160 = *(_QWORD *)(v0 + 1744);
        v115 = (uint8_t *)swift_slowAlloc();
        v151 = v114;
        v116 = swift_slowAlloc();
        *(_DWORD *)v115 = 136315138;
        v165[0] = v116;
        v117 = *(_OWORD *)(v0 + 1032);
        *(_OWORD *)(v0 + 1144) = *(_OWORD *)(v0 + 1016);
        *(_OWORD *)(v0 + 1160) = v117;
        v118 = *(_OWORD *)(v0 + 1064);
        *(_OWORD *)(v0 + 1176) = *(_OWORD *)(v0 + 1048);
        *(_OWORD *)(v0 + 1192) = v118;
        v119 = *(_OWORD *)(v0 + 968);
        *(_OWORD *)(v0 + 1080) = *v101;
        *(_OWORD *)(v0 + 1096) = v119;
        v120 = *(_OWORD *)(v0 + 1000);
        *(_OWORD *)(v0 + 1112) = *(_OWORD *)(v0 + 984);
        *(_OWORD *)(v0 + 1128) = v120;
        sub_21C270E28(v0 + 952);
        v121 = sub_21C27A628();
        *(_QWORD *)(v0 + 1592) = sub_21C263BE4(v121, v122, v165);
        v100 = v0 + 288;
        sub_21C27A6AC();
        swift_bridgeObjectRelease();
        sub_21C270EBC(v0 + 952);
        sub_21C270EBC(v0 + 952);
        _os_log_impl(&dword_21C260000, v109, v110, "Found matching organization: %s", v115, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x220777920](v116, -1, -1);
        MEMORY[0x220777920](v115, -1, -1);

        sub_21C2767EC(v156, 0);
        v112(v160, v151);
      }
      else
      {
        sub_21C2767EC(*(_QWORD *)(v0 + 1824), 0);
        sub_21C270EBC(v0 + 952);
        sub_21C270EBC(v0 + 952);

        v112(v113, v114);
      }
      swift_bridgeObjectRelease();
      v129 = *(_OWORD *)(v0 + 1032);
      *(_OWORD *)(v0 + 760) = *(_OWORD *)(v0 + 1016);
      *(_OWORD *)(v0 + 776) = v129;
      v130 = *(_OWORD *)(v0 + 1064);
      *(_OWORD *)(v0 + 792) = *(_OWORD *)(v0 + 1048);
      *(_OWORD *)(v0 + 808) = v130;
      v131 = *(_OWORD *)(v0 + 968);
      *(_OWORD *)(v0 + 696) = *v101;
      *(_OWORD *)(v0 + 712) = v131;
      v132 = *(_OWORD *)(v0 + 1000);
      *(_OWORD *)(v0 + 728) = *(_OWORD *)(v0 + 984);
      *(_OWORD *)(v0 + 744) = v132;
      nullsub_1(v0 + 696);
      v133 = v0 + 696;
    }
    else
    {
      v100 = v0 + 16;
      v123 = *(_QWORD *)(v0 + 1736);
      swift_beginAccess();
      v97(v123, v98, v99);
      v124 = sub_21C27A5D4();
      v125 = sub_21C27A688();
      v126 = os_log_type_enabled(v124, v125);
      v127 = *(_QWORD *)(v0 + 1824);
      if (v126)
      {
        v128 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v128 = 0;
        _os_log_impl(&dword_21C260000, v124, v125, "No matching organization found", v128, 2u);
        MEMORY[0x220777920](v128, -1, -1);

        sub_21C2767EC(v127, 0);
      }
      else
      {
        sub_21C2767EC(*(_QWORD *)(v0 + 1824), 0);

      }
      (*(void (**)(_QWORD, _QWORD))(v0 + 1816))(*(_QWORD *)(v0 + 1736), *(_QWORD *)(v0 + 1712));
      swift_bridgeObjectRelease();
      sub_21C276844((_OWORD *)(v0 + 824));
      v133 = v0 + 824;
    }
    sub_21C2767F8(v133, v100, &qword_2552526E0);
    sub_21C27683C(v100);
    sub_21C2767F8(v100, v41, &qword_255252708);
    sub_21C2767F8(v41, *(_QWORD *)(v0 + 1656), &qword_255252708);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1808);
    v26 = *(_QWORD *)(v0 + 1800);
    v27 = *(_QWORD *)(v0 + 1776);
    v28 = *(_QWORD *)(v0 + 1712);
    swift_beginAccess();
    v25(v27, v26, v28);
    v29 = sub_21C27A5D4();
    v30 = sub_21C27A688();
    v31 = os_log_type_enabled(v29, v30);
    v32 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
    v33 = *(_QWORD *)(v0 + 1776);
    v34 = *(_QWORD *)(v0 + 1712);
    if (v31)
    {
      v158 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
      v162 = *(_QWORD *)(v0 + 1776);
      v153 = *(_QWORD *)(v0 + 1712);
      v35 = (uint8_t *)swift_slowAlloc();
      v36 = swift_slowAlloc();
      v165[0] = v36;
      *(_DWORD *)v35 = 136315138;
      swift_beginAccess();
      v37 = swift_bridgeObjectRetain();
      v38 = MEMORY[0x220777530](v37, &type metadata for EmergencyOrganizationInfo);
      v40 = v39;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 1616) = sub_21C263BE4(v38, v40, v165);
      sub_21C27A6AC();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21C260000, v29, v30, "Multiple orgs found: [%s]. Refining search by current city.", v35, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x220777920](v36, -1, -1);
      MEMORY[0x220777920](v35, -1, -1);

      v158(v162, v153);
    }
    else
    {

      v32(v33, v34);
    }
    v42 = (_QWORD *)(*(_QWORD *)(v0 + 1664) + *(int *)(v0 + 148));
    v43 = v42[3];
    v44 = v42[4];
    __swift_project_boxed_opaque_existential_1(v42, v43);
    v163 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v44 + 24) + *(_QWORD *)(v44 + 24));
    v45 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 1880) = v45;
    *v45 = v0;
    v45[1] = sub_21C274F80;
    return v163(v43, v44);
  }
}

uint64_t sub_21C274F80(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 1888) = a1;
  *(_QWORD *)(v3 + 1896) = a2;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21C274FE0()
{
  uint64_t v0;
  unint64_t v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  _BOOL4 v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  _BOOL4 v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  void (*v60)(uint64_t, uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  int64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  _QWORD *v74;
  void (*v75)(uint64_t, uint64_t, uint64_t);
  uint64_t v76;
  uint64_t v77;
  _OWORD *v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  NSObject *v86;
  os_log_type_t v87;
  _BOOL4 v88;
  void (*v89)(uint64_t, uint64_t);
  uint64_t v90;
  uint64_t v91;
  uint8_t *v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint64_t v98;
  unint64_t v99;
  uint8_t *v100;
  uint64_t v101;
  NSObject *v102;
  os_log_type_t v103;
  _BOOL4 v104;
  uint64_t v105;
  uint8_t *v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint64_t v111;
  uint64_t v113;
  os_log_type_t type;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  void (*v123)(uint64_t, uint64_t);
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void (*v127)(uint64_t, uint64_t);
  uint64_t v128;
  void (*v129)(uint64_t, uint64_t);
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void (*v134)(uint64_t, uint64_t);
  uint64_t v135;
  uint64_t v136;
  uint64_t v137[2];

  v1 = *(_QWORD *)(v0 + 1896);
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1808);
  v3 = *(_QWORD *)(v0 + 1800);
  v4 = *(_QWORD *)(v0 + 1768);
  v5 = *(_QWORD *)(v0 + 1712);
  swift_beginAccess();
  v2(v4, v3, v5);
  swift_bridgeObjectRetain_n();
  v6 = sub_21C27A5D4();
  v7 = sub_21C27A688();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = *(_QWORD *)(v0 + 1896);
    v9 = *(_QWORD *)(v0 + 1888);
    v134 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
    v128 = *(_QWORD *)(v0 + 1712);
    v132 = *(_QWORD *)(v0 + 1768);
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v137[0] = v11;
    *(_DWORD *)v10 = 136315138;
    v12 = v8 == 0;
    if (v8)
      v13 = v9;
    else
      v13 = 0x3E7974706D653CLL;
    if (v12)
      v14 = 0xE700000000000000;
    else
      v14 = v1;
    swift_bridgeObjectRetain();
    v15 = sub_21C263BE4(v13, v14, v137);
    v16 = (uint64_t *)(v0 + 1608);
    *(_QWORD *)(v0 + 1600) = v15;
    sub_21C27A6AC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21C260000, v6, v7, "Fetched current city: %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x220777920](v11, -1, -1);
    MEMORY[0x220777920](v10, -1, -1);

    v134(v132, v128);
  }
  else
  {
    v17 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
    v18 = *(_QWORD *)(v0 + 1768);
    v19 = *(_QWORD *)(v0 + 1712);
    swift_bridgeObjectRelease_n();

    v17(v18, v19);
    v16 = (uint64_t *)(v0 + 1608);
  }
  v20 = v0 + 152;
  v21 = *(_QWORD *)(v0 + 1896);
  v22 = *(_QWORD *)(v0 + 1888);
  swift_beginAccess();
  v23 = swift_bridgeObjectRetain();
  v24 = sub_21C27685C(v23, v22, v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 1608) = v24;
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v24 + 16))
  {
    sub_21C2767EC(*(_QWORD *)(v0 + 1824), 0);
    swift_bridgeObjectRelease();
  }
  else
  {
    v119 = v16;
    v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1808);
    v26 = *(_QWORD *)(v0 + 1800);
    v27 = *(_QWORD *)(v0 + 1760);
    v28 = *(_QWORD *)(v0 + 1712);
    swift_beginAccess();
    v25(v27, v26, v28);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    v29 = sub_21C27A5D4();
    v30 = sub_21C27A688();
    v31 = os_log_type_enabled(v29, v30);
    v32 = *(_QWORD *)(v0 + 1864);
    if (v31)
    {
      v113 = *(_QWORD *)(v0 + 1856);
      type = v30;
      v33 = *(_QWORD *)(v0 + 1840);
      v34 = *(_QWORD *)(v0 + 1832);
      v120 = *(_QWORD *)(v0 + 1760);
      v123 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
      v117 = *(_QWORD *)(v0 + 1712);
      v35 = swift_slowAlloc();
      v115 = swift_slowAlloc();
      v137[0] = v115;
      *(_DWORD *)v35 = 136315394;
      if (v33)
        v36 = v34;
      else
        v36 = 0x3E7974706D653CLL;
      if (v33)
        v37 = v33;
      else
        v37 = 0xE700000000000000;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 1560) = sub_21C263BE4(v36, v37, v137);
      sub_21C27A6AC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v35 + 12) = 2080;
      if (v32)
        v38 = v113;
      else
        v38 = 0x3E7974706D653CLL;
      if (v32)
        v39 = v32;
      else
        v39 = 0xE700000000000000;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 1568) = sub_21C263BE4(v38, v39, v137);
      sub_21C27A6AC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21C260000, v29, type, "No orgs found matching siriLanguageCode: %s, physicalLocationCountryCode: %s.", (uint8_t *)v35, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x220777920](v115, -1, -1);
      MEMORY[0x220777920](v35, -1, -1);

      v123(v120, v117);
    }
    else
    {
      v40 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
      v41 = *(_QWORD *)(v0 + 1760);
      v42 = *(_QWORD *)(v0 + 1712);

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      v40(v41, v42);
    }
    v43 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1808);
    v44 = *(_QWORD *)(v0 + 1800);
    v45 = *(_QWORD *)(v0 + 1752);
    v46 = *(_QWORD *)(v0 + 1712);
    v47 = sub_21C27A304();
    v49 = v48;
    swift_beginAccess();
    v43(v45, v44, v46);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v50 = sub_21C27A5D4();
    v51 = sub_21C27A688();
    v52 = os_log_type_enabled(v50, v51);
    v53 = *(_QWORD *)(v0 + 1840);
    if (v52)
    {
      v54 = *(_QWORD *)(v0 + 1832);
      v129 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
      v121 = *(_QWORD *)(v0 + 1712);
      v124 = *(_QWORD *)(v0 + 1752);
      v55 = swift_slowAlloc();
      v118 = swift_slowAlloc();
      v137[0] = v118;
      *(_DWORD *)v55 = 136315394;
      if (v53)
        v56 = v54;
      else
        v56 = 0x3E7974706D653CLL;
      if (v53)
        v57 = v53;
      else
        v57 = 0xE700000000000000;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 1584) = sub_21C263BE4(v56, v57, v137);
      sub_21C27A6AC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v55 + 12) = 2080;
      if (v49)
        v58 = v47;
      else
        v58 = 0x3E7974706D653CLL;
      if (v49)
        v59 = v49;
      else
        v59 = 0xE700000000000000;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 1576) = sub_21C263BE4(v58, v59, v137);
      sub_21C27A6AC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21C260000, v50, v51, "Falling back to locale search. Looking for an organization matching siriLanguageCode: %s, siriRegionCode: %s.", (uint8_t *)v55, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x220777920](v118, -1, -1);
      MEMORY[0x220777920](v55, -1, -1);

      v129(v124, v121);
    }
    else
    {
      v60 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
      v61 = *(_QWORD *)(v0 + 1752);
      v62 = *(_QWORD *)(v0 + 1712);
      swift_bridgeObjectRelease_n();

      swift_bridgeObjectRelease_n();
      v60(v61, v62);
    }
    v63 = v119;
    v64 = *(_QWORD *)(v0 + 1824);
    v65 = sub_21C2769F4(v64, *(_QWORD *)(v0 + 1832), *(_QWORD *)(v0 + 1840), v47, v49);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_21C2767EC(v64, 0);
    swift_beginAccess();
    *(_QWORD *)(v0 + 1608) = v65;
    swift_bridgeObjectRelease();
    v66 = *(_QWORD *)(v65 + 16);
    v24 = MEMORY[0x24BEE4AF8];
    if (v66)
    {
      v137[0] = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain();
      sub_21C27665C(0, v66, 0);
      v67 = 0;
      v24 = v137[0];
      v68 = *(_QWORD *)(v137[0] + 16);
      v122 = v68 << 7;
      v125 = v65;
      do
      {
        v69 = *(_QWORD *)(v65 + v67 + 40);
        v70 = *(_QWORD *)(v65 + v67 + 56);
        v126 = *(_QWORD *)(v65 + v67 + 48);
        v130 = *(_QWORD *)(v65 + v67 + 32);
        v71 = *(_QWORD *)(v65 + v67 + 136);
        v133 = *(_QWORD *)(v65 + v67 + 128);
        v72 = *(_QWORD *)(v65 + v67 + 152);
        v135 = *(_QWORD *)(v65 + v67 + 144);
        v137[0] = v24;
        v73 = *(_QWORD *)(v24 + 24);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v68 >= v73 >> 1)
        {
          sub_21C27665C(v73 > 1, v68 + 1, 1);
          v24 = v137[0];
        }
        *(_QWORD *)(v24 + 16) = v68 + 1;
        v74 = (_QWORD *)(v24 + v122 + v67);
        v74[4] = v130;
        v74[5] = v69;
        v74[6] = v126;
        v74[7] = v70;
        v74[8] = 0;
        v74[9] = 0xE000000000000000;
        v74[10] = 0;
        v74[11] = 0xE000000000000000;
        v74[12] = 0;
        v74[13] = 0xE000000000000000;
        v74[14] = 0;
        v74[15] = 0xE000000000000000;
        v74[16] = v133;
        v74[17] = v71;
        v67 += 128;
        ++v68;
        v74[18] = v135;
        v74[19] = v72;
        --v66;
        v65 = v125;
      }
      while (v66);
      swift_bridgeObjectRelease();
      v63 = v119;
    }
    *v63 = v24;
    v20 = v0 + 152;
  }
  swift_bridgeObjectRelease();
  v75 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1808);
  v76 = *(_QWORD *)(v0 + 1800);
  v77 = *(_QWORD *)(v0 + 1712);
  if (*(_QWORD *)(v24 + 16))
  {
    v136 = v0 + 288;
    v78 = (_OWORD *)(v0 + 952);
    v79 = *(_QWORD *)(v0 + 1744);
    v80 = *(_OWORD *)(v24 + 80);
    v82 = *(_OWORD *)(v24 + 32);
    v81 = *(_OWORD *)(v24 + 48);
    *(_OWORD *)(v0 + 984) = *(_OWORD *)(v24 + 64);
    *(_OWORD *)(v0 + 1000) = v80;
    *(_OWORD *)(v0 + 952) = v82;
    *(_OWORD *)(v0 + 968) = v81;
    v83 = *(_OWORD *)(v24 + 144);
    v85 = *(_OWORD *)(v24 + 96);
    v84 = *(_OWORD *)(v24 + 112);
    *(_OWORD *)(v0 + 1048) = *(_OWORD *)(v24 + 128);
    *(_OWORD *)(v0 + 1064) = v83;
    *(_OWORD *)(v0 + 1016) = v85;
    *(_OWORD *)(v0 + 1032) = v84;
    swift_beginAccess();
    v75(v79, v76, v77);
    sub_21C270E28(v0 + 952);
    sub_21C270E28(v0 + 952);
    sub_21C270E28(v0 + 952);
    v86 = sub_21C27A5D4();
    v87 = sub_21C27A688();
    v88 = os_log_type_enabled(v86, v87);
    v89 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
    v90 = *(_QWORD *)(v0 + 1744);
    v91 = *(_QWORD *)(v0 + 1712);
    if (v88)
    {
      v131 = *(_QWORD *)(v0 + 1824);
      v116 = v20;
      v92 = (uint8_t *)swift_slowAlloc();
      v127 = v89;
      v93 = swift_slowAlloc();
      *(_DWORD *)v92 = 136315138;
      v137[0] = v93;
      v94 = *(_OWORD *)(v0 + 1032);
      *(_OWORD *)(v0 + 1144) = *(_OWORD *)(v0 + 1016);
      *(_OWORD *)(v0 + 1160) = v94;
      v95 = *(_OWORD *)(v0 + 1064);
      *(_OWORD *)(v0 + 1176) = *(_OWORD *)(v0 + 1048);
      *(_OWORD *)(v0 + 1192) = v95;
      v96 = *(_OWORD *)(v0 + 968);
      *(_OWORD *)(v0 + 1080) = *v78;
      *(_OWORD *)(v0 + 1096) = v96;
      v97 = *(_OWORD *)(v0 + 1000);
      *(_OWORD *)(v0 + 1112) = *(_OWORD *)(v0 + 984);
      *(_OWORD *)(v0 + 1128) = v97;
      sub_21C270E28(v0 + 952);
      v98 = sub_21C27A628();
      *(_QWORD *)(v0 + 1592) = sub_21C263BE4(v98, v99, v137);
      sub_21C27A6AC();
      swift_bridgeObjectRelease();
      sub_21C270EBC(v0 + 952);
      sub_21C270EBC(v0 + 952);
      _os_log_impl(&dword_21C260000, v86, v87, "Found matching organization: %s", v92, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x220777920](v93, -1, -1);
      v100 = v92;
      v20 = v116;
      MEMORY[0x220777920](v100, -1, -1);

      sub_21C2767EC(v131, 0);
      v127(v90, v91);
    }
    else
    {
      sub_21C2767EC(*(_QWORD *)(v0 + 1824), 0);
      sub_21C270EBC(v0 + 952);
      sub_21C270EBC(v0 + 952);

      v89(v90, v91);
    }
    swift_bridgeObjectRelease();
    v107 = *(_OWORD *)(v0 + 1032);
    *(_OWORD *)(v0 + 760) = *(_OWORD *)(v0 + 1016);
    *(_OWORD *)(v0 + 776) = v107;
    v108 = *(_OWORD *)(v0 + 1064);
    *(_OWORD *)(v0 + 792) = *(_OWORD *)(v0 + 1048);
    *(_OWORD *)(v0 + 808) = v108;
    v109 = *(_OWORD *)(v0 + 968);
    *(_OWORD *)(v0 + 696) = *v78;
    *(_OWORD *)(v0 + 712) = v109;
    v110 = *(_OWORD *)(v0 + 1000);
    *(_OWORD *)(v0 + 728) = *(_OWORD *)(v0 + 984);
    *(_OWORD *)(v0 + 744) = v110;
    nullsub_1(v0 + 696);
    sub_21C2767F8(v0 + 696, v136, &qword_2552526E0);
    sub_21C27683C(v136);
    v111 = v0 + 288;
  }
  else
  {
    v101 = *(_QWORD *)(v0 + 1736);
    swift_beginAccess();
    v75(v101, v76, v77);
    v102 = sub_21C27A5D4();
    v103 = sub_21C27A688();
    v104 = os_log_type_enabled(v102, v103);
    v105 = *(_QWORD *)(v0 + 1824);
    if (v104)
    {
      v106 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v106 = 0;
      _os_log_impl(&dword_21C260000, v102, v103, "No matching organization found", v106, 2u);
      MEMORY[0x220777920](v106, -1, -1);

      sub_21C2767EC(v105, 0);
    }
    else
    {
      sub_21C2767EC(*(_QWORD *)(v0 + 1824), 0);

    }
    (*(void (**)(_QWORD, _QWORD))(v0 + 1816))(*(_QWORD *)(v0 + 1736), *(_QWORD *)(v0 + 1712));
    swift_bridgeObjectRelease();
    sub_21C276844((_OWORD *)(v0 + 824));
    sub_21C2767F8(v0 + 824, v0 + 16, &qword_2552526E0);
    sub_21C27683C(v0 + 16);
    v111 = v0 + 16;
  }
  sub_21C2767F8(v111, v20, &qword_255252708);
  sub_21C2767F8(v20, *(_QWORD *)(v0 + 1656), &qword_255252708);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

SiriEmergencyIntents::EmergencySituation_optional __swiftcall inferUsableSituation(situation:organization:)(SiriEmergencyIntents::EmergencySituation_optional situation, SiriEmergencyIntents::EmergencyOrganization_optional organization)
{
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
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v4 = sub_21C27A5E0();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v37 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v37 - v12;
  switch(situation.value)
  {
    case SiriEmergencyIntents_EmergencySituation_abuse:
      v30 = sub_21C27A5C8();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v13, v30, v4);
      v31 = sub_21C27A5D4();
      v32 = sub_21C27A688();
      if (os_log_type_enabled(v31, v32))
      {
        v33 = (uint8_t *)swift_slowAlloc();
        v34 = swift_slowAlloc();
        v39 = v34;
        v37 = v4;
        *(_DWORD *)v33 = 136315138;
        LOBYTE(v38) = 11;
        __swift_instantiateConcreteTypeFromMangledName(&qword_255252580);
        v35 = sub_21C27A6A0();
        v38 = sub_21C263BE4(v35, v36, &v39);
        sub_21C27A6AC();
        swift_bridgeObjectRelease();
        swift_arrayDestroy();
        MEMORY[0x220777920](v34, -1, -1);
        MEMORY[0x220777920](v33, -1, -1);

        (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v37);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v4);
      }
      situation.value = SiriEmergencyIntents_EmergencySituation_domesticViolence;
      break;
    case SiriEmergencyIntents_EmergencySituation_assault:
      v23 = sub_21C27A5C8();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v11, v23, v4);
      v24 = sub_21C27A5D4();
      v25 = sub_21C27A688();
      if (os_log_type_enabled(v24, v25))
      {
        v26 = (uint8_t *)swift_slowAlloc();
        v27 = swift_slowAlloc();
        v39 = v27;
        v37 = v4;
        *(_DWORD *)v26 = 136315138;
        LOBYTE(v38) = 13;
        __swift_instantiateConcreteTypeFromMangledName(&qword_255252580);
        v28 = sub_21C27A6A0();
        v38 = sub_21C263BE4(v28, v29, &v39);
        sub_21C27A6AC();
        swift_bridgeObjectRelease();
        situation.value = SiriEmergencyIntents_EmergencySituation_sexualAssault;
        swift_arrayDestroy();
        MEMORY[0x220777920](v27, -1, -1);
        MEMORY[0x220777920](v26, -1, -1);

        (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v37);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
        situation.value = SiriEmergencyIntents_EmergencySituation_sexualAssault;
      }
      break;
    case SiriEmergencyIntents_EmergencySituation_overdose:
    case SiriEmergencyIntents_EmergencySituation_selfHarm:
    case SiriEmergencyIntents_EmergencySituation_substanceAbuse:
    case SiriEmergencyIntents_EmergencySituation_suicide:
      v14 = sub_21C27A5C8();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v14, v4);
      v15 = sub_21C27A5D4();
      v16 = sub_21C27A688();
      if (os_log_type_enabled(v15, v16))
      {
        v17 = (uint8_t *)swift_slowAlloc();
        v18 = swift_slowAlloc();
        v37 = v4;
        v19 = v18;
        v39 = v18;
        *(_DWORD *)v17 = 136315138;
        LOBYTE(v38) = situation;
        __swift_instantiateConcreteTypeFromMangledName(&qword_255252580);
        v20 = sub_21C27A6A0();
        v38 = sub_21C263BE4(v20, v21, &v39);
        sub_21C27A6AC();
        swift_bridgeObjectRelease();
        swift_arrayDestroy();
        MEMORY[0x220777920](v19, -1, -1);
        MEMORY[0x220777920](v17, -1, -1);

        (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v37);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      }
      situation.value = SiriEmergencyIntents_EmergencySituation_suicidePrevention;
      break;
    case SiriEmergencyIntents_EmergencySituation_unknownDefault:
      if (organization.value == SiriEmergencyIntents_EmergencyOrganization_unknownDefault)
        situation.value = SiriEmergencyIntents_EmergencySituation_unknownDefault;
      else
        situation.value = organization.value;
      break;
    default:
      return situation;
  }
  return situation;
}

BOOL static EmergencyOrganizationInfoProvider.EmergencyPropertyListReaderError.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t EmergencyOrganizationInfoProvider.EmergencyPropertyListReaderError.hash(into:)()
{
  return sub_21C27A7B4();
}

uint64_t EmergencyOrganizationInfoProvider.EmergencyPropertyListReaderError.hashValue.getter()
{
  sub_21C27A7A8();
  sub_21C27A7B4();
  return sub_21C27A7C0();
}

BOOL sub_21C2762FC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_21C276324(uint64_t a1, char a2, char a3)
{
  uint64_t v3;
  _QWORD *v6;

  *(_QWORD *)(v3 + 152) = a1;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 160) = v6;
  *v6 = v3;
  v6[1] = sub_21C276390;
  return EmergencyOrganizationInfoProvider.getOrganizationInfo(situation:organization:)(v3 + 16, a2, a3);
}

uint64_t sub_21C276390()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v1 = *v0 + 16;
  v2 = *(_QWORD *)(*v0 + 152);
  v4 = *v0;
  swift_task_dealloc();
  sub_21C2767F8(v1, v2, &qword_255252708);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

unint64_t sub_21C2763F0()
{
  unint64_t result;

  result = qword_255252700;
  if (!qword_255252700)
  {
    result = MEMORY[0x2207778C0](&protocol conformance descriptor for EmergencyOrganizationInfoProvider.EmergencyPropertyListReaderError, &type metadata for EmergencyOrganizationInfoProvider.EmergencyPropertyListReaderError);
    atomic_store(result, (unint64_t *)&qword_255252700);
  }
  return result;
}

uint64_t sub_21C276434(uint64_t result)
{
  *(_BYTE *)(result + 128) = 1;
  return result;
}

uint64_t sub_21C276440(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for EmergencyOrganizationInfoProvider();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21C276484()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = type metadata accessor for EmergencyOrganizationInfoProvider();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  v4 = sub_21C27A31C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_0(v3 + *(int *)(v1 + 20));
  if (*(_QWORD *)(v3 + *(int *)(v1 + 24)))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_21C27651C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for EmergencyOrganizationInfoProvider();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21C276560(uint64_t a1, unint64_t a2)
{
  type metadata accessor for EmergencyOrganizationInfoProvider();
  return sub_21C272DEC(a1, a2);
}

uint64_t sub_21C2765B4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for EmergencyOrganizationInfoProvider();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21C2765F0()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_21C276618()
{
  unint64_t result;

  result = qword_255252710;
  if (!qword_255252710)
  {
    result = MEMORY[0x2207778C0](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255252710);
  }
  return result;
}

uint64_t sub_21C27665C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_21C276678(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_21C276678(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255252858);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 + 95;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 7);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[128 * v8])
      memmove(v13, v14, v8 << 7);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[128 * v8] || v13 >= &v14[128 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_21C27A724();
  __break(1u);
  return result;
}

id sub_21C2767E0(id a1, char a2)
{
  if ((a2 & 1) != 0)
    return a1;
  else
    return (id)swift_bridgeObjectRetain();
}

uint64_t sub_21C2767EC(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    JUMPOUT(0x220777860);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C2767F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_21C27683C(uint64_t result)
{
  *(_BYTE *)(result + 128) = 0;
  return result;
}

double sub_21C276844(_OWORD *a1)
{
  double result;

  result = 0.0;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_21C27685C(uint64_t result, unint64_t a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __int128 *v10;
  unint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  unint64_t v16;
  unint64_t v17;
  _OWORD *v18;
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
  uint64_t v33;

  v3 = *(_QWORD *)(result + 16);
  if (!v3)
    return MEMORY[0x24BEE4AF8];
  v6 = 0;
  v7 = result + 32;
  v8 = MEMORY[0x24BEE4AF8];
  do
  {
    if (v6 <= v3)
      v9 = v3;
    else
      v9 = v6;
    v10 = (__int128 *)(v7 + (v6 << 7));
    v11 = v6;
    while (1)
    {
      if (v9 == v11)
      {
        __break(1u);
        return result;
      }
      v12 = v10[5];
      v29 = v10[4];
      v30 = v12;
      v13 = v10[7];
      v31 = v10[6];
      v32 = v13;
      v14 = v10[1];
      v25 = *v10;
      v26 = v14;
      v15 = v10[3];
      v27 = v10[2];
      v28 = v15;
      if (a3)
      {
        if (v27 == __PAIR128__(a3, a2))
          break;
        result = sub_21C27A760();
        if ((result & 1) != 0)
          break;
      }
      ++v11;
      v10 += 8;
      if (v3 == v11)
        return v8;
    }
    sub_21C270E28((uint64_t)&v25);
    result = swift_isUniquelyReferenced_nonNull_native();
    v33 = v8;
    if ((result & 1) == 0)
    {
      result = sub_21C27665C(0, *(_QWORD *)(v8 + 16) + 1, 1);
      v8 = v33;
    }
    v17 = *(_QWORD *)(v8 + 16);
    v16 = *(_QWORD *)(v8 + 24);
    if (v17 >= v16 >> 1)
    {
      result = sub_21C27665C(v16 > 1, v17 + 1, 1);
      v8 = v33;
    }
    v6 = v11 + 1;
    *(_QWORD *)(v8 + 16) = v17 + 1;
    v18 = (_OWORD *)(v8 + (v17 << 7));
    v19 = v25;
    v20 = v26;
    v21 = v28;
    v18[4] = v27;
    v18[5] = v21;
    v18[2] = v19;
    v18[3] = v20;
    v22 = v29;
    v23 = v30;
    v24 = v32;
    v18[8] = v31;
    v18[9] = v24;
    v18[6] = v22;
    v18[7] = v23;
  }
  while (v3 - 1 != v11);
  return v8;
}

uint64_t sub_21C2769F4(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5)
{
  unint64_t v5;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  __int128 *v14;
  unint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  unint64_t v20;
  unint64_t v21;
  _OWORD *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  v5 = *(_QWORD *)(result + 16);
  if (!v5)
    return MEMORY[0x24BEE4AF8];
  v10 = 0;
  v11 = result + 32;
  v12 = MEMORY[0x24BEE4AF8];
  v29 = result + 32;
  do
  {
    if (v10 <= v5)
      v13 = v5;
    else
      v13 = v10;
    v14 = (__int128 *)(v11 + (v10 << 7));
    v15 = v10;
    while (1)
    {
      if (v13 == v15)
      {
        __break(1u);
        return result;
      }
      v16 = v14[5];
      v34 = v14[4];
      v35 = v16;
      v17 = v14[7];
      v36 = v14[6];
      v37 = v17;
      v18 = v14[1];
      v30 = *v14;
      v31 = v18;
      v19 = v14[3];
      v32 = v14[2];
      v33 = v19;
      if (a3)
      {
        result = v31;
        if (v31 == __PAIR128__(a3, a2) || (result = sub_21C27A760(), (result & 1) != 0))
        {
          if (a5)
          {
            if (v30 == __PAIR128__(a5, a4))
              break;
            result = sub_21C27A760();
            if ((result & 1) != 0)
              break;
          }
        }
      }
      ++v15;
      v14 += 8;
      if (v5 == v15)
        return v12;
    }
    sub_21C270E28((uint64_t)&v30);
    result = swift_isUniquelyReferenced_nonNull_native();
    v38 = v12;
    if ((result & 1) == 0)
    {
      result = sub_21C27665C(0, *(_QWORD *)(v12 + 16) + 1, 1);
      v12 = v38;
    }
    v21 = *(_QWORD *)(v12 + 16);
    v20 = *(_QWORD *)(v12 + 24);
    if (v21 >= v20 >> 1)
    {
      result = sub_21C27665C(v20 > 1, v21 + 1, 1);
      v12 = v38;
    }
    v10 = v15 + 1;
    *(_QWORD *)(v12 + 16) = v21 + 1;
    v22 = (_OWORD *)(v12 + (v21 << 7));
    v23 = v30;
    v24 = v31;
    v25 = v33;
    v22[4] = v32;
    v22[5] = v25;
    v22[2] = v23;
    v22[3] = v24;
    v26 = v34;
    v27 = v35;
    v28 = v37;
    v22[8] = v36;
    v22[9] = v28;
    v22[6] = v26;
    v22[7] = v27;
    v11 = v29;
  }
  while (v5 - 1 != v15);
  return v12;
}

uint64_t sub_21C276BC8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v5;

  result = (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 16))(*a1, a1[1]);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v5 & 1;
  return result;
}

unint64_t sub_21C276C04()
{
  unint64_t result;

  result = qword_255252718;
  if (!qword_255252718)
  {
    result = MEMORY[0x2207778C0](&protocol conformance descriptor for EmergencyOrganizationInfoProvider.EmergencyPropertyListReaderError, &type metadata for EmergencyOrganizationInfoProvider.EmergencyPropertyListReaderError);
    atomic_store(result, (unint64_t *)&qword_255252718);
  }
  return result;
}

uint64_t type metadata accessor for BundleHelper()
{
  return objc_opt_self();
}

uint64_t *initializeBufferWithCopyOfBuffer for EmergencyOrganizationInfoProvider(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
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
    v7 = sub_21C27A31C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(_OWORD *)((char *)a2 + v8 + 24);
    *(_OWORD *)((char *)a1 + v8 + 24) = v9;
    (**(void (***)(void))(v9 - 8))();
    v10 = *(int *)(a3 + 24);
    v11 = (uint64_t *)((char *)a1 + v10);
    v12 = (uint64_t *)((char *)a2 + v10);
    if (*v12)
    {
      v13 = v12[1];
      *v11 = *v12;
      v11[1] = v13;
      swift_retain();
    }
    else
    {
      *(_OWORD *)v11 = *(_OWORD *)v12;
    }
  }
  return a1;
}

uint64_t destroy for EmergencyOrganizationInfoProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;

  v4 = sub_21C27A31C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  result = __swift_destroy_boxed_opaque_existential_0(a1 + *(int *)(a2 + 20));
  if (*(_QWORD *)(a1 + *(int *)(a2 + 24)))
    return swift_release();
  return result;
}

uint64_t initializeWithCopy for EmergencyOrganizationInfoProvider(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;

  v6 = sub_21C27A31C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(_OWORD *)(a2 + v7 + 24);
  *(_OWORD *)(a1 + v7 + 24) = v8;
  (**(void (***)(void))(v8 - 8))();
  v9 = *(int *)(a3 + 24);
  v10 = (_QWORD *)(a1 + v9);
  v11 = (_QWORD *)(a2 + v9);
  if (*v11)
  {
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    swift_retain();
  }
  else
  {
    *(_OWORD *)v10 = *(_OWORD *)v11;
  }
  return a1;
}

uint64_t assignWithCopy for EmergencyOrganizationInfoProvider(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_21C27A31C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + *(int *)(a3 + 20)), (uint64_t *)(a2 + *(int *)(a3 + 20)));
  v7 = *(int *)(a3 + 24);
  v8 = (_QWORD *)(a1 + v7);
  v9 = a2 + v7;
  v10 = *(_QWORD *)(a1 + v7);
  v11 = *(_QWORD *)(a2 + v7);
  if (!v10)
  {
    if (v11)
    {
      v13 = *(_QWORD *)(v9 + 8);
      *v8 = v11;
      v8[1] = v13;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)v8 = *(_OWORD *)v9;
    return a1;
  }
  if (!v11)
  {
    swift_release();
    goto LABEL_7;
  }
  v12 = *(_QWORD *)(v9 + 8);
  *v8 = v11;
  v8[1] = v12;
  swift_retain();
  swift_release();
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

uint64_t initializeWithTake for EmergencyOrganizationInfoProvider(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = sub_21C27A31C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = a1 + v7;
  v10 = a2 + v7;
  v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(_QWORD *)(v9 + 32) = *(_QWORD *)(v10 + 32);
  v12 = (_QWORD *)(a1 + v8);
  v13 = (uint64_t *)(a2 + v8);
  v14 = *v13;
  if (*v13)
  {
    v15 = v13[1];
    *v12 = v14;
    v12[1] = v15;
  }
  else
  {
    *(_OWORD *)v12 = *(_OWORD *)v13;
  }
  return a1;
}

uint64_t assignWithTake for EmergencyOrganizationInfoProvider(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = sub_21C27A31C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  __swift_destroy_boxed_opaque_existential_0(a1 + v7);
  *(_QWORD *)(v8 + 32) = *(_QWORD *)(v9 + 32);
  v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  v11 = *(int *)(a3 + 24);
  v12 = (_QWORD *)(a1 + v11);
  v13 = (uint64_t *)(a2 + v11);
  v14 = *(_QWORD *)(a1 + v11);
  v15 = *v13;
  if (!v14)
  {
    if (v15)
    {
      v17 = v13[1];
      *v12 = v15;
      v12[1] = v17;
      return a1;
    }
LABEL_7:
    *(_OWORD *)v12 = *(_OWORD *)v13;
    return a1;
  }
  if (!v15)
  {
    swift_release();
    goto LABEL_7;
  }
  v16 = v13[1];
  *v12 = v15;
  v12[1] = v16;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for EmergencyOrganizationInfoProvider()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21C2771C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_21C27A31C();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 24);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for EmergencyOrganizationInfoProvider()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21C277254(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_21C27A31C();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 24) = (a2 - 1);
  return result;
}

uint64_t sub_21C2772D0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21C27A31C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for EmergencyOrganizationInfoProvider.EmergencyPropertyListReaderError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21C277398 + 4 * byte_21C27BE4B[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21C2773CC + 4 * byte_21C27BE46[v4]))();
}

uint64_t sub_21C2773CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C2773D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C2773DCLL);
  return result;
}

uint64_t sub_21C2773E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C2773F0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21C2773F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C2773FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EmergencyOrganizationInfoProvider.EmergencyPropertyListReaderError()
{
  return &type metadata for EmergencyOrganizationInfoProvider.EmergencyPropertyListReaderError;
}

unint64_t sub_21C277418()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255252868;
  if (!qword_255252868)
  {
    v1 = sub_21C27A2EC();
    result = MEMORY[0x2207778C0](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, (unint64_t *)&qword_255252868);
  }
  return result;
}

unint64_t sub_21C277460()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_255252880;
  if (!qword_255252880)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255252878);
    v2 = sub_21C277508();
    result = MEMORY[0x2207778C0](MEMORY[0x24BEE12D0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255252880);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2207778B4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_21C277508()
{
  unint64_t result;

  result = qword_255252888;
  if (!qword_255252888)
  {
    result = MEMORY[0x2207778C0](&protocol conformance descriptor for EmergencyOrganizationInfo, &type metadata for EmergencyOrganizationInfo);
    atomic_store(result, (unint64_t *)&qword_255252888);
  }
  return result;
}

uint64_t sub_21C27754C(uint64_t a1, unint64_t a2)
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

uint64_t EmergencySituation.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_21C2775D0 + 4 * byte_21C27BFD0[a1]))(0xD000000000000012, 0x800000021C27CAA0);
}

uint64_t sub_21C2775D0()
{
  return 0x61206C6175786573;
}

uint64_t sub_21C2775F4()
{
  return 0x63206E6F73696F70;
}

uint64_t sub_21C277618()
{
  uint64_t v0;

  return v0 + 1;
}

uint64_t sub_21C277840()
{
  return 0x65736F647265766FLL;
}

uint64_t sub_21C277858()
{
  return 0x6D726148666C6573;
}

uint64_t sub_21C277870()
{
  return 0x676E696B6C617473;
}

uint64_t sub_21C277888()
{
  return 0x636E617473627573;
}

uint64_t sub_21C2778AC()
{
  return 0x65646963697573;
}

uint64_t sub_21C2778C4()
{
  return 0x7369726F72726574;
}

uint64_t sub_21C2778E0()
{
  return 0x65636E656C6F6976;
}

BOOL EmergencySituation.isCSAM.getter(unsigned __int8 a1)
{
  return a1 - 6 < 4;
}

uint64_t sub_21C277918(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = EmergencySituation.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == EmergencySituation.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_21C27A760();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_21C2779A0()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_21C27A7A8();
  EmergencySituation.rawValue.getter(v1);
  sub_21C27A64C();
  swift_bridgeObjectRelease();
  return sub_21C27A7C0();
}

uint64_t sub_21C277A00()
{
  unsigned __int8 *v0;

  EmergencySituation.rawValue.getter(*v0);
  sub_21C27A64C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C277A40()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_21C27A7A8();
  EmergencySituation.rawValue.getter(v1);
  sub_21C27A64C();
  swift_bridgeObjectRelease();
  return sub_21C27A7C0();
}

uint64_t sub_21C277A9C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s20SiriEmergencyIntents0B9SituationO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_21C277AC8@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = EmergencySituation.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t _s20SiriEmergencyIntents0B9SituationO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_21C27A76C();
  swift_bridgeObjectRelease();
  if (v0 >= 0x22)
    return 34;
  else
    return v0;
}

uint64_t _s20SiriEmergencyIntents0B9SituationO4from15identifierValueACSgSS_tFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  char v5;
  char v6;
  char v7;
  BOOL v8;
  BOOL v9;
  char v10;
  BOOL v11;
  BOOL v12;
  char v13;
  BOOL v14;
  BOOL v15;
  char v16;
  BOOL v17;
  BOOL v18;

  if (a1 == 0xD000000000000012 && a2 == 0x800000021C27CAA0)
    return 0;
  v5 = sub_21C27A760();
  result = 0;
  if ((v5 & 1) == 0)
  {
    if (a1 == 0xD000000000000011 && a2 == 0x800000021C27D080)
      return 0;
    v6 = sub_21C27A760();
    result = 0;
    if ((v6 & 1) == 0)
    {
      if (a1 == 0x61206C6175786573 && a2 == 0xEE00746C75617373
        || (sub_21C27A760() & 1) != 0
        || a1 == 0x73416C6175786573 && a2 == 0xED0000746C756173
        || (sub_21C27A760() & 1) != 0)
      {
        return 1;
      }
      if (a1 == 0x63206E6F73696F70 && a2 == 0xEE006C6F72746E6FLL
        || (sub_21C27A760() & 1) != 0
        || a1 == 0x6F436E6F73696F70 && a2 == 0xED00006C6F72746ELL
        || (sub_21C27A760() & 1) != 0)
      {
        return 2;
      }
      if (a1 == 0xD000000000000011 && a2 == 0x800000021C27CAE0
        || (sub_21C27A760() & 1) != 0
        || a1 == 0xD000000000000010 && a2 == 0x800000021C27D0A0
        || (sub_21C27A760() & 1) != 0)
      {
        return 3;
      }
      if (a1 == 0xD00000000000001BLL && a2 == 0x800000021C27CB00
        || (sub_21C27A760() & 1) != 0
        || a1 == 0xD000000000000018 && a2 == 0x800000021C27D0C0
        || (sub_21C27A760() & 1) != 0)
      {
        return 4;
      }
      if (a1 == 0xD00000000000001ALL && a2 == 0x800000021C27CB20
        || (sub_21C27A760() & 1) != 0
        || a1 == 0xD000000000000017 && a2 == 0x800000021C27D0E0
        || (sub_21C27A760() & 1) != 0)
      {
        return 5;
      }
      if (a1 == 0x7078655F6D617363 && a2 == 0xED0000746963696CLL
        || (sub_21C27A760() & 1) != 0
        || a1 == 0x6C7078456D617363 && a2 == 0xEC00000074696369
        || (sub_21C27A760() & 1) != 0)
      {
        return 6;
      }
      if (a1 == 0xD000000000000013 && a2 == 0x800000021C27CB50)
        return 7;
      v7 = sub_21C27A760();
      v8 = a1 == 0xD000000000000010 && a2 == 0x800000021C27D100;
      v9 = v8;
      result = 7;
      if ((v7 & 1) == 0 && !v9)
      {
        if ((sub_21C27A760() & 1) != 0)
          return 7;
        if (a1 == 0xD000000000000010 && a2 == 0x800000021C27CB70
          || (sub_21C27A760() & 1) != 0
          || a1 == 0x706C65486D617363 && a2 == 0xEE006D6974636956
          || (sub_21C27A760() & 1) != 0)
        {
          return 8;
        }
        if (a1 == 0xD000000000000011 && a2 == 0x800000021C27CB90)
          return 9;
        v10 = sub_21C27A760();
        v11 = a1 == 0xD000000000000012 && a2 == 0x800000021C27D120;
        v12 = v11;
        result = 9;
        if ((v10 & 1) == 0 && !v12)
        {
          if ((sub_21C27A760() & 1) != 0)
            return 9;
          if (a1 == 0x6E65726973 && a2 == 0xE500000000000000)
            return 10;
          v13 = sub_21C27A760();
          v14 = a1 == 0xD000000000000012 && a2 == 0x800000021C27D140;
          v15 = v14;
          result = 10;
          if ((v13 & 1) == 0 && !v15)
          {
            v16 = sub_21C27A760();
            v17 = a1 == 0xD000000000000013 && a2 == 0x800000021C27D160;
            v18 = v17;
            result = 10;
            if ((v16 & 1) == 0 && !v18)
            {
              if ((sub_21C27A760() & 1) != 0)
                return 10;
              swift_bridgeObjectRetain();
              return _s20SiriEmergencyIntents0B9SituationO8rawValueACSgSS_tcfC_0();
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t _s20SiriEmergencyIntents0B9SituationO14catiIntentNameACSgAA010CATIIntentG0O_tcfC_0(uint64_t result)
{
  if (result >= 0xAu)
    return 34;
  else
    return result;
}

unint64_t sub_21C2782FC()
{
  unint64_t result;

  result = qword_255252890;
  if (!qword_255252890)
  {
    result = MEMORY[0x2207778C0](&protocol conformance descriptor for EmergencySituation, &type metadata for EmergencySituation);
    atomic_store(result, (unint64_t *)&qword_255252890);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for EmergencySituation(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 33 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 33) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xDF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xDE)
    return ((uint64_t (*)(void))((char *)&loc_21C27838C + 4 * byte_21C27BFF7[v4]))();
  *a1 = a2 + 33;
  return ((uint64_t (*)(void))((char *)sub_21C2783C0 + 4 * byte_21C27BFF2[v4]))();
}

uint64_t sub_21C2783C0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C2783C8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C2783D0);
  return result;
}

uint64_t sub_21C2783DC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C2783E4);
  *(_BYTE *)result = a2 + 33;
  return result;
}

uint64_t sub_21C2783E8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C2783F0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EmergencySituation()
{
  return &type metadata for EmergencySituation;
}

uint64_t Siri_Nlu_External_UserParse.toConvertedUsoTask()()
{
  Siri_Nlu_External_UserParse.usoTask.getter();
  sub_21C27A46C();
  return swift_release();
}

uint64_t Siri_Nlu_External_UserParse.identifierValue(entity:attributeName:namespaces:)(uint64_t a1, uint64_t a2, uint64_t a3)
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
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  BOOL v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v29[2];
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, unint64_t, uint64_t);
  uint64_t v35;
  unint64_t v36;
  char *v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  const char *v43;

  v4 = sub_21C27A43C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255252658);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21C27A448();
  swift_bridgeObjectRelease();
  if (v11)
  {
    v32 = *(_QWORD *)(v11 + 16);
    if (v32)
    {
      v29[1] = v11;
      v30 = v10;
      v36 = v11 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
      v12 = *(_QWORD *)(a3 + 16);
      v13 = *(_QWORD *)(v5 + 72);
      v34 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      v35 = v13;
      swift_bridgeObjectRetain_n();
      v14 = 0;
      v42 = "emergencyAttribute";
      v43 = "emergency";
      v40 = "crisisSituationHigh";
      v41 = "emergencySirenNoun";
      v39 = "crisisSituationMedium";
      v33 = v5;
      v37 = v7;
      v31 = v4;
      do
      {
        v34(v7, v36 + v35 * v14, v4);
        v38 = v14;
        if (v12)
        {
          swift_bridgeObjectRetain();
          __asm { BR              X9 }
        }
        v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
        v16 = sub_21C27A430();
        if (v17)
          v18 = v16;
        else
          v18 = 0;
        if (v17)
          v19 = v17;
        else
          v19 = 0xE000000000000000;
        v20 = v15[2];
        if (v20)
        {
          v21 = v15[4] == v18 && v15[5] == v19;
          if (v21 || (sub_21C27A760() & 1) != 0)
            goto LABEL_31;
          if (v20 != 1)
          {
            v22 = v15 + 7;
            v23 = 1;
            while (1)
            {
              v24 = v23 + 1;
              if (__OFADD__(v23, 1))
              {
                __break(1u);
                JUMPOUT(0x21C27894CLL);
              }
              v25 = *(v22 - 1) == v18 && *v22 == v19;
              if (v25 || (sub_21C27A760() & 1) != 0)
                break;
              v22 += 2;
              ++v23;
              if (v24 == v20)
                goto LABEL_4;
            }
LABEL_31:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v5 = v33;
            v10 = v30;
            v4 = v31;
            (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v30, v37, v31);
            v26 = 0;
            goto LABEL_33;
          }
LABEL_4:
          swift_bridgeObjectRelease();
          v4 = v31;
          v5 = v33;
          v7 = v37;
        }
        else
        {
          swift_bridgeObjectRelease();
          v5 = v33;
        }
        v14 = v38 + 1;
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      }
      while (v14 != v32);
      swift_bridgeObjectRelease();
      v26 = 1;
      v10 = v30;
    }
    else
    {
      swift_bridgeObjectRetain();
      v26 = 1;
    }
LABEL_33:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, v26, 1, v4);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) != 1)
    {
      v27 = sub_21C27A424();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
      swift_bridgeObjectRelease();
      return v27;
    }
    sub_21C26CA50((uint64_t)v10, &qword_255252658);
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t Siri_Nlu_External_UserParse.catiIntentName.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[7];
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void (*v15)(char *, unint64_t, uint64_t);
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;

  sub_21C27A5BC();
  MEMORY[0x24BDAC7A8]();
  v0 = sub_21C27A3DC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255252680);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = Siri_Nlu_External_UserParse.identifiers.getter();
  if (*(_QWORD *)(v6 + 16))
  {
    v10[5] = v6;
    v10[6] = v5;
    v17 = v6 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
    v7 = *(_QWORD *)(v1 + 72);
    v15 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
    v16 = v7;
    swift_bridgeObjectRetain();
    v14 = "emergencyConfirmation";
    v10[3] = "emergencyAttribute";
    v10[4] = "emergency";
    v10[1] = "crisisSituationHigh";
    v10[2] = "emergencySirenNoun";
    v10[0] = "crisisSituationMedium";
    v12 = v1;
    v13 = v0;
    v19 = v3;
    v18 = 1;
    v15(v3, v17, v0);
    JUMPOUT(0x21C278C10);
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v5, 1, 1, v0);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v5, 1, v0) == 1)
  {
    sub_21C26CA50((uint64_t)v5, &qword_255252680);
    return 0;
  }
  else
  {
    v8 = sub_21C27A3C4();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v5, v0);
  }
  return v8;
}

unint64_t Siri_Nlu_External_UserParse.usoTask.getter()
{
  uint64_t v0;
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  unint64_t v10;
  _BYTE v11[16];

  __swift_instantiateConcreteTypeFromMangledName(&qword_255252670);
  MEMORY[0x24BDAC7A8]();
  v1 = &v11[-((v0 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v2 = sub_21C27A3A0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_21C27A340();
  if (*(_QWORD *)(v6 + 16))
  {
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v3 + 16))(v1, v6 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), v2);
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, v7, 1, v2);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    sub_21C26CA50((uint64_t)v1, &qword_255252670);
    return 0;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v3 + 32))(v5, v1, v2);
  result = sub_21C27A3F4();
  v10 = result;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = sub_21C27A718();
    result = swift_bridgeObjectRelease();
    if (!v8)
      goto LABEL_11;
  }
  else
  {
    v8 = *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v8)
    {
LABEL_11:
      swift_bridgeObjectRelease();
      (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
      return v8;
    }
  }
  if ((v10 & 0xC000000000000001) != 0)
  {
    v8 = MEMORY[0x2207775B4](0, v10);
    goto LABEL_11;
  }
  if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v8 = *(_QWORD *)(v10 + 32);
    swift_retain();
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

Swift::String_optional __swiftcall Siri_Nlu_External_UserParse.identifierValue(for:)(Swift::OpaquePointer a1)
{
  uint64_t v2;
  uint64_t v3;
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
  _QWORD *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  Swift::String_optional result;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, unint64_t, uint64_t);
  uint64_t v39;
  unint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  const char *v50;

  v2 = sub_21C27A5BC();
  v42 = *(_QWORD *)(v2 - 8);
  v43 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v41 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21C27A3DC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255252680);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = Siri_Nlu_External_UserParse.identifiers.getter();
  v36 = *(_QWORD *)(v11 + 16);
  if (v36)
  {
    v33 = v11;
    v34 = v10;
    v40 = v11 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    v12 = *((_QWORD *)a1._rawValue + 2);
    v13 = *(_QWORD *)(v5 + 72);
    v38 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    v39 = v13;
    swift_bridgeObjectRetain();
    v14 = 0;
    v49 = "emergencyAttribute";
    v50 = "emergency";
    v47 = "crisisSituationHigh";
    v48 = "emergencySirenNoun";
    v46 = "crisisSituationMedium";
    v37 = v5;
    v44 = v7;
    v35 = v4;
    do
    {
      v38(v7, v40 + v39 * v14, v4);
      v45 = v14;
      if (v12)
      {
        swift_bridgeObjectRetain();
        __asm { BR              X9 }
      }
      v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v16 = v41;
      sub_21C27A3D0();
      v17 = sub_21C27A5B0();
      v19 = v18;
      (*(void (**)(char *, uint64_t))(v42 + 8))(v16, v43);
      v20 = v15[2];
      if (v20)
      {
        v21 = v15[4] == v17 && v15[5] == v19;
        if (v21 || (sub_21C27A760() & 1) != 0)
          goto LABEL_24;
        if (v20 != 1)
        {
          v22 = v15 + 7;
          v23 = 1;
          while (1)
          {
            v24 = v23 + 1;
            if (__OFADD__(v23, 1))
            {
              __break(1u);
              JUMPOUT(0x21C279598);
            }
            v25 = *(v22 - 1) == v17 && *v22 == v19;
            if (v25 || (sub_21C27A760() & 1) != 0)
              break;
            v22 += 2;
            ++v23;
            if (v24 == v20)
              goto LABEL_3;
          }
LABEL_24:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v5 = v37;
          v10 = v34;
          v4 = v35;
          (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v34, v44, v35);
          v26 = 0;
          goto LABEL_26;
        }
LABEL_3:
        swift_bridgeObjectRelease();
        v4 = v35;
        v5 = v37;
        v7 = v44;
      }
      else
      {
        swift_bridgeObjectRelease();
        v5 = v37;
      }
      v14 = v45 + 1;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    while (v14 != v36);
    swift_bridgeObjectRelease();
    v26 = 1;
    v10 = v34;
  }
  else
  {
    v26 = 1;
  }
LABEL_26:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, v26, 1, v4);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
  {
    sub_21C26CA50((uint64_t)v10, &qword_255252680);
    v27 = 0;
    v28 = 0;
  }
  else
  {
    v27 = sub_21C27A3C4();
    v28 = v29;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
  v30 = v27;
  v31 = v28;
  result.value._object = v31;
  result.value._countAndFlagsBits = v30;
  return result;
}

uint64_t Siri_Nlu_External_UserParse.userDialogAct.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = sub_21C27A340();
  v3 = *(_QWORD *)(v2 + 16);
  v4 = sub_21C27A3A0();
  v5 = *(_QWORD *)(v4 - 8);
  if (v3)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v5 + 16))(a1, v2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)), v4);
    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a1, v6, 1, v4);
  return swift_bridgeObjectRelease();
}

uint64_t Siri_Nlu_External_UserParse.init(userDialogAct:)()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255252898);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C27A358();
  sub_21C27A3E8();
  v3 = sub_21C27A364();
  v4 = *(_QWORD *)(v3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_21C26CA50((uint64_t)v2, &qword_255252898);
  }
  else
  {
    sub_21C27A340();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
  }
  sub_21C27A34C();
  return swift_unknownObjectRelease();
}

uint64_t Siri_Nlu_External_UserParse.identifiers.getter()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
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
  uint64_t v16;
  uint64_t v17;

  v17 = sub_21C27A334();
  v0 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_21C27A3B8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255252670);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21C27A340();
  v10 = *(_QWORD *)(v9 + 16);
  v11 = sub_21C27A3A0();
  v12 = *(_QWORD *)(v11 - 8);
  if (v10)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v12 + 16))(v8, v9 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80)), v11);
    v13 = 0;
  }
  else
  {
    v13 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v8, v13, 1, v11);
  swift_bridgeObjectRelease();
  sub_21C27A3A0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v8, 1, v11) == 1)
  {
    sub_21C26CA50((uint64_t)v8, &qword_255252670);
    return MEMORY[0x24BEE4AF8];
  }
  else
  {
    sub_21C27A394();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v11);
    sub_21C27A3AC();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v14 = sub_21C27A328();
    (*(void (**)(char *, uint64_t))(v0 + 8))(v2, v17);
  }
  return v14;
}

uint64_t sub_21C279928(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = sub_21C27A760();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_21C27A760() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_21C2799EC(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  if (*(_QWORD *)(a2 + 16))
  {
    swift_bridgeObjectRetain();
    __asm { BR              X9 }
  }
  v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v4 = sub_21C27A430();
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0xE000000000000000;
  }
  v7 = sub_21C279928(v4, v6, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_21C279C50(uint64_t a1)
{
  uint64_t result;

  if (a1 < 0)
  {
    result = sub_21C27A70C();
    __break(1u);
  }
  else if (a1)
  {
    result = sub_21C27A67C();
    *(_QWORD *)(result + 16) = a1;
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t sub_21C279CE8(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

_QWORD *sub_21C279CF0()
{
  _QWORD **v0;
  _QWORD *v1;
  _QWORD *result;

  v1 = *v0;
  result = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  *v0 = v1;
  if (!(_DWORD)result)
  {
    result = sub_21C279F98(result, v1[2] + 1, 1, v1);
    *v0 = result;
  }
  return result;
}

_QWORD *sub_21C279D38(_QWORD *result)
{
  _QWORD **v1;
  unint64_t v2;

  v2 = (*v1)[3];
  if ((uint64_t)result + 1 > (uint64_t)(v2 >> 1))
  {
    result = sub_21C279F98((_QWORD *)(v2 > 1), (int64_t)result + 1, 1, *v1);
    *v1 = result;
  }
  return result;
}

uint64_t sub_21C279D78(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v4 = *v3;
  *(_QWORD *)(v4 + 16) = result + 1;
  v5 = v4 + 16 * result;
  *(_QWORD *)(v5 + 32) = a2;
  *(_QWORD *)(v5 + 40) = a3;
  return result;
}

uint64_t sub_21C279D90(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552528A0);
  v10 = *(_QWORD *)(sub_21C27A604() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_21C27A70C();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_21C27A604() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_21C27A194(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

_QWORD *sub_21C279F98(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2552528A8);
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
    sub_21C27A0A4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21C27A0A4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_21C27A724();
  __break(1u);
  return result;
}

uint64_t sub_21C27A194(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(sub_21C27A604() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_21C27A724();
  __break(1u);
  return result;
}

uint64_t sub_21C27A2B0()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_21C27A2BC()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_21C27A2C8()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_21C27A2D4()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_21C27A2E0()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_21C27A2EC()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_21C27A2F8()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_21C27A304()
{
  return MEMORY[0x24BDCEB40]();
}

uint64_t sub_21C27A310()
{
  return MEMORY[0x24BDCEBA0]();
}

uint64_t sub_21C27A31C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_21C27A328()
{
  return MEMORY[0x24BE9C290]();
}

uint64_t sub_21C27A334()
{
  return MEMORY[0x24BE9C2B8]();
}

uint64_t sub_21C27A340()
{
  return MEMORY[0x24BE9C3E8]();
}

uint64_t sub_21C27A34C()
{
  return MEMORY[0x24BE9C3F0]();
}

uint64_t sub_21C27A358()
{
  return MEMORY[0x24BE9C448]();
}

uint64_t sub_21C27A364()
{
  return MEMORY[0x24BE9C450]();
}

uint64_t sub_21C27A370()
{
  return MEMORY[0x24BE9C720]();
}

uint64_t sub_21C27A37C()
{
  return MEMORY[0x24BE9C728]();
}

uint64_t sub_21C27A388()
{
  return MEMORY[0x24BE9C740]();
}

uint64_t sub_21C27A394()
{
  return MEMORY[0x24BE9C768]();
}

uint64_t sub_21C27A3A0()
{
  return MEMORY[0x24BE9C828]();
}

uint64_t sub_21C27A3AC()
{
  return MEMORY[0x24BE9CB10]();
}

uint64_t sub_21C27A3B8()
{
  return MEMORY[0x24BE9CB28]();
}

uint64_t sub_21C27A3C4()
{
  return MEMORY[0x24BE9D100]();
}

uint64_t sub_21C27A3D0()
{
  return MEMORY[0x24BE9D108]();
}

uint64_t sub_21C27A3DC()
{
  return MEMORY[0x24BE9D110]();
}

uint64_t sub_21C27A3E8()
{
  return MEMORY[0x24BE9DFF8]();
}

uint64_t sub_21C27A3F4()
{
  return MEMORY[0x24BE9E008]();
}

uint64_t sub_21C27A400()
{
  return MEMORY[0x24BE9EB40]();
}

uint64_t sub_21C27A40C()
{
  return MEMORY[0x24BE9F730]();
}

uint64_t sub_21C27A418()
{
  return MEMORY[0x24BE9F988]();
}

uint64_t sub_21C27A424()
{
  return MEMORY[0x24BE9F990]();
}

uint64_t sub_21C27A430()
{
  return MEMORY[0x24BE9F998]();
}

uint64_t sub_21C27A43C()
{
  return MEMORY[0x24BE9F9A0]();
}

uint64_t sub_21C27A448()
{
  return MEMORY[0x24BE9FF60]();
}

uint64_t sub_21C27A454()
{
  return MEMORY[0x24BEA04C0]();
}

uint64_t sub_21C27A460()
{
  return MEMORY[0x24BEA0510]();
}

uint64_t sub_21C27A46C()
{
  return MEMORY[0x24BEA0690]();
}

uint64_t sub_21C27A478()
{
  return MEMORY[0x24BEA06B0]();
}

uint64_t sub_21C27A484()
{
  return MEMORY[0x24BEA0B28]();
}

uint64_t sub_21C27A490()
{
  return MEMORY[0x24BEA0B60]();
}

uint64_t sub_21C27A49C()
{
  return MEMORY[0x24BEA0B68]();
}

uint64_t sub_21C27A4A8()
{
  return MEMORY[0x24BEA0B70]();
}

uint64_t sub_21C27A4B4()
{
  return MEMORY[0x24BEA0F38]();
}

uint64_t sub_21C27A4C0()
{
  return MEMORY[0x24BEA1370]();
}

uint64_t sub_21C27A4CC()
{
  return MEMORY[0x24BEA13A8]();
}

uint64_t sub_21C27A4D8()
{
  return MEMORY[0x24BEA13E8]();
}

uint64_t sub_21C27A4E4()
{
  return MEMORY[0x24BEA18B0]();
}

uint64_t sub_21C27A4F0()
{
  return MEMORY[0x24BEA1CA8]();
}

uint64_t sub_21C27A4FC()
{
  return MEMORY[0x24BEA2050]();
}

uint64_t sub_21C27A508()
{
  return MEMORY[0x24BEA2340]();
}

uint64_t sub_21C27A514()
{
  return MEMORY[0x24BEA26E0]();
}

uint64_t sub_21C27A520()
{
  return MEMORY[0x24BEA2870]();
}

uint64_t sub_21C27A52C()
{
  return MEMORY[0x24BEA2878]();
}

uint64_t sub_21C27A538()
{
  return MEMORY[0x24BEA2880]();
}

uint64_t sub_21C27A544()
{
  return MEMORY[0x24BEA2888]();
}

uint64_t sub_21C27A550()
{
  return MEMORY[0x24BEA29E8]();
}

uint64_t sub_21C27A55C()
{
  return MEMORY[0x24BEA2D38]();
}

uint64_t sub_21C27A568()
{
  return MEMORY[0x24BEA2D50]();
}

uint64_t sub_21C27A574()
{
  return MEMORY[0x24BEA2D58]();
}

uint64_t sub_21C27A580()
{
  return MEMORY[0x24BEA3638]();
}

uint64_t sub_21C27A58C()
{
  return MEMORY[0x24BEA8A80]();
}

uint64_t sub_21C27A598()
{
  return MEMORY[0x24BEA8A88]();
}

uint64_t sub_21C27A5A4()
{
  return MEMORY[0x24BEA8DC8]();
}

uint64_t sub_21C27A5B0()
{
  return MEMORY[0x24BE5BA20]();
}

uint64_t sub_21C27A5BC()
{
  return MEMORY[0x24BE5BA38]();
}

uint64_t sub_21C27A5C8()
{
  return MEMORY[0x24BE40EE0]();
}

uint64_t sub_21C27A5D4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21C27A5E0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21C27A5EC()
{
  return MEMORY[0x24BEA5680]();
}

uint64_t sub_21C27A5F8()
{
  return MEMORY[0x24BEA5A38]();
}

uint64_t sub_21C27A604()
{
  return MEMORY[0x24BEA5A70]();
}

uint64_t sub_21C27A610()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21C27A61C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21C27A628()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_21C27A634()
{
  return MEMORY[0x24BE40EE8]();
}

uint64_t sub_21C27A640()
{
  return MEMORY[0x24BEA5500]();
}

uint64_t sub_21C27A64C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21C27A658()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21C27A664()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21C27A670()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_21C27A67C()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_21C27A688()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_21C27A694()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21C27A6A0()
{
  return MEMORY[0x24BE8DCC8]();
}

uint64_t sub_21C27A6AC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21C27A6B8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21C27A6C4()
{
  return MEMORY[0x24BDD04F0]();
}

uint64_t sub_21C27A6D0()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_21C27A6DC()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_21C27A6E8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21C27A6F4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21C27A700()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21C27A70C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21C27A718()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21C27A724()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21C27A730()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_21C27A73C()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_21C27A748()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_21C27A754()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21C27A760()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21C27A76C()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_21C27A778()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21C27A784()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21C27A790()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21C27A79C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21C27A7A8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21C27A7B4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21C27A7C0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_21C27A7CC()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_21C27A7D8()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_21C27A7E4()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_21C27A7F0()
{
  return MEMORY[0x24BEE4A10]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
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

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

