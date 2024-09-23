uint64_t dispatch thunk of MessageAttachment.url.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of MessageAttachment.isDraft.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

SiriMessagesCommon::DirectButton_optional __swiftcall DirectButton.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  unint64_t v2;
  char *v3;
  char v4;
  SiriMessagesCommon::DirectButton_optional result;

  v3 = v1;
  sub_246A78304();
  OUTLINED_FUNCTION_0();
  v4 = 14;
  if (v2 < 0xE)
    v4 = v2;
  *v3 = v4;
  OUTLINED_FUNCTION_1();
  return result;
}

uint64_t DirectButton.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&aAudiorepcall[8 * *v0];
}

uint64_t sub_246A44F00(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_246A58548(*a1, *a2);
}

uint64_t sub_246A44F0C()
{
  unsigned __int8 *v0;

  return sub_246A585E8(*v0);
}

uint64_t sub_246A44F14(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_246A586B0(a1, *v1);
}

uint64_t sub_246A44F1C(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_246A58708(a1, *v1);
}

SiriMessagesCommon::DirectButton_optional sub_246A44F24(Swift::String *a1)
{
  return DirectButton.init(rawValue:)(*a1);
}

uint64_t sub_246A44F30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = DirectButton.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

SiriMessagesCommon::DirectInvocationURI_optional __swiftcall DirectInvocationURI.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  unint64_t v2;
  char *v3;
  char v4;
  SiriMessagesCommon::DirectInvocationURI_optional result;

  v3 = v1;
  sub_246A7843C();
  OUTLINED_FUNCTION_0();
  v4 = 18;
  if (v2 < 0x12)
    v4 = v2;
  *v3 = v4;
  OUTLINED_FUNCTION_1();
  return result;
}

uint64_t DirectInvocationURI.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_246A44FDC
                                                                     + 4 * aF[*v0]))(0xD000000000000038, 0x8000000246A7E6D0);
}

uint64_t sub_246A44FDC@<X0>(uint64_t a1@<X8>)
{
  return a1 - 9;
}

unint64_t sub_246A450FC()
{
  unint64_t result;

  result = qword_257617208;
  if (!qword_257617208)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for DirectButton, &type metadata for DirectButton);
    atomic_store(result, (unint64_t *)&qword_257617208);
  }
  return result;
}

uint64_t sub_246A45138(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_246A5853C(*a1, *a2);
}

unint64_t sub_246A45148()
{
  unint64_t result;

  result = qword_257617210;
  if (!qword_257617210)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for DirectInvocationURI, &type metadata for DirectInvocationURI);
    atomic_store(result, (unint64_t *)&qword_257617210);
  }
  return result;
}

uint64_t sub_246A45184()
{
  unsigned __int8 *v0;

  return sub_246A5860C(*v0);
}

uint64_t sub_246A4518C(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_246A586A4(a1, *v1);
}

uint64_t sub_246A45194(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_246A58714(a1, *v1);
}

SiriMessagesCommon::DirectInvocationURI_optional sub_246A4519C(Swift::String *a1)
{
  return DirectInvocationURI.init(rawValue:)(*a1);
}

uint64_t sub_246A451A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = DirectInvocationURI.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DirectButton(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xF3)
  {
    if (a2 + 13 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 13) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 14;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xE;
  v5 = v6 - 14;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DirectButton(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 13 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 13) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF3)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF2)
    return ((uint64_t (*)(void))((char *)&loc_246A452B0 + 4 * byte_246A78A67[v4]))();
  *a1 = a2 + 13;
  return ((uint64_t (*)(void))((char *)sub_246A452E4 + 4 * byte_246A78A62[v4]))();
}

uint64_t sub_246A452E4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A452EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A452F4);
  return result;
}

uint64_t sub_246A45300(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A45308);
  *(_BYTE *)result = a2 + 13;
  return result;
}

uint64_t sub_246A4530C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A45314(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A45320(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_246A4532C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DirectButton()
{
  return &type metadata for DirectButton;
}

uint64_t getEnumTagSinglePayload for DirectInvocationURI(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xEF)
  {
    if (a2 + 17 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 17) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 18;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x12;
  v5 = v6 - 18;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DirectInvocationURI(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 17 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 17) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xEF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xEE)
    return ((uint64_t (*)(void))((char *)&loc_246A45418 + 4 * byte_246A78A71[v4]))();
  *a1 = a2 + 17;
  return ((uint64_t (*)(void))((char *)sub_246A4544C + 4 * byte_246A78A6C[v4]))();
}

uint64_t sub_246A4544C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A45454(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A4545CLL);
  return result;
}

uint64_t sub_246A45468(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A45470);
  *(_BYTE *)result = a2 + 17;
  return result;
}

uint64_t sub_246A45474(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A4547C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DirectInvocationURI()
{
  return &type metadata for DirectInvocationURI;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t AutoSendableCompactCarPlayButton.init(shouldAutoSend:autoSendTimeout:delayedActionCancelCommand:handleIntent:speechSynthesisId:isFirstPartyApp:responseMode:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X8>, double a9@<D0>)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (qword_2576171F0 != -1)
    swift_once();
  swift_beginAccess();
  v18 = qword_257617E30;
  *(_QWORD *)(a8 + 48) = qword_257617E28;
  *(_QWORD *)(a8 + 56) = v18;
  v19 = a8 + *(int *)(OUTLINED_FUNCTION_13() + 44);
  v20 = sub_246A78094();
  __swift_storeEnumTagSinglePayload(v19, 1, 1, v20);
  *(_BYTE *)a8 = a1 & 1;
  *(double *)(a8 + 8) = a9;
  *(_QWORD *)(a8 + 16) = a2;
  *(_QWORD *)(a8 + 24) = a3;
  *(_QWORD *)(a8 + 32) = a4;
  *(_QWORD *)(a8 + 40) = a5;
  *(_BYTE *)(a8 + 64) = a6 & 1;
  swift_bridgeObjectRetain();
  return sub_246A465F4(a7, v19);
}

void AutoSendableCompactCarPlayButton.delayedActionCancelCommand.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  OUTLINED_FUNCTION_9();
}

void AutoSendableCompactCarPlayButton.handleIntent.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  OUTLINED_FUNCTION_9();
}

uint64_t AutoSendableCompactCarPlayButton.shouldAutoSend.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t AutoSendableCompactCarPlayButton.shouldAutoSend.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*AutoSendableCompactCarPlayButton.shouldAutoSend.modify())()
{
  return nullsub_1;
}

double AutoSendableCompactCarPlayButton.autoSendTimeout.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

void AutoSendableCompactCarPlayButton.autoSendTimeout.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 8) = a1;
}

uint64_t (*AutoSendableCompactCarPlayButton.autoSendTimeout.modify())()
{
  return nullsub_1;
}

void AutoSendableCompactCarPlayButton.delayedActionCancelCommand.getter()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 16);
  OUTLINED_FUNCTION_9();
}

void sub_246A45670(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  AutoSendableCompactCarPlayButton.delayedActionCancelCommand.setter((uint64_t)v1);
}

void AutoSendableCompactCarPlayButton.delayedActionCancelCommand.modify(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + 16);
  *a1 = v2;
  a1[1] = v1;
  v3 = v2;
  OUTLINED_FUNCTION_9();
}

void sub_246A456D0(uint64_t a1, char a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)a1;
  v2 = *(_QWORD *)(a1 + 8);
  v4 = *(void **)(v2 + 16);
  if ((a2 & 1) != 0)
  {
    v5 = v3;

    *(_QWORD *)(v2 + 16) = v3;
    OUTLINED_FUNCTION_3(v5);
  }
  else
  {

    *(_QWORD *)(v2 + 16) = v3;
    OUTLINED_FUNCTION_8();
  }
}

void AutoSendableCompactCarPlayButton.handleIntent.getter()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 24);
  OUTLINED_FUNCTION_9();
}

void sub_246A4573C(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  AutoSendableCompactCarPlayButton.handleIntent.setter((uint64_t)v1);
}

void AutoSendableCompactCarPlayButton.handleIntent.modify(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + 24);
  *a1 = v2;
  a1[1] = v1;
  v3 = v2;
  OUTLINED_FUNCTION_9();
}

void sub_246A4579C(uint64_t a1, char a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)a1;
  v2 = *(_QWORD *)(a1 + 8);
  v4 = *(void **)(v2 + 24);
  if ((a2 & 1) != 0)
  {
    v5 = v3;

    *(_QWORD *)(v2 + 24) = v3;
    OUTLINED_FUNCTION_3(v5);
  }
  else
  {

    *(_QWORD *)(v2 + 24) = v3;
    OUTLINED_FUNCTION_8();
  }
}

void AutoSendableCompactCarPlayButton.speechSynthesisId.getter()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_9();
}

void AutoSendableCompactCarPlayButton.speechSynthesisId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t (*AutoSendableCompactCarPlayButton.speechSynthesisId.modify())()
{
  return nullsub_1;
}

void AutoSendableCompactCarPlayButton.sendLabelText.getter()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_9();
}

void AutoSendableCompactCarPlayButton.sendLabelText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t (*AutoSendableCompactCarPlayButton.sendLabelText.modify())()
{
  return nullsub_1;
}

uint64_t AutoSendableCompactCarPlayButton.isFirstPartyApp.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 64);
}

uint64_t AutoSendableCompactCarPlayButton.isFirstPartyApp.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 64) = result;
  return result;
}

uint64_t (*AutoSendableCompactCarPlayButton.isFirstPartyApp.modify())()
{
  return nullsub_1;
}

uint64_t AutoSendableCompactCarPlayButton.responseMode.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_13() + 44);
  return sub_246A4667C(v3, a1);
}

uint64_t AutoSendableCompactCarPlayButton.responseMode.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_13() + 44);
  return sub_246A465F4(a1, v3);
}

uint64_t (*AutoSendableCompactCarPlayButton.responseMode.modify())()
{
  OUTLINED_FUNCTION_13();
  return nullsub_1;
}

BOOL sub_246A4594C(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_246A4595C()
{
  return sub_246A78490();
}

uint64_t sub_246A45980(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  char v11;

  v3 = a1 == 0x7541646C756F6873 && a2 == 0xEE00646E65536F74;
  if (v3 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x646E65536F747561 && a2 == 0xEF74756F656D6954;
    if (v6 || (sub_246A78400() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD00000000000001ALL && a2 == 0x8000000246A7EBC0 || (sub_246A78400() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v7 = a1 == 0x6E49656C646E6168 && a2 == 0xEC000000746E6574;
      if (v7 || (sub_246A78400() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0xD000000000000011 && a2 == 0x8000000246A7EBE0 || (sub_246A78400() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        v8 = a1 == 0x6562614C646E6573 && a2 == 0xED0000747865546CLL;
        if (v8 || (sub_246A78400() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          v9 = a1 == 0x5074737269467369 && a2 == 0xEF70704179747261;
          if (v9 || (sub_246A78400() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else if (a1 == 0x65736E6F70736572 && a2 == 0xEC00000065646F4DLL)
          {
            swift_bridgeObjectRelease();
            return 7;
          }
          else
          {
            v11 = sub_246A78400();
            swift_bridgeObjectRelease();
            if ((v11 & 1) != 0)
              return 7;
            else
              return 8;
          }
        }
      }
    }
  }
}

uint64_t sub_246A45D00()
{
  return 8;
}

uint64_t sub_246A45D08()
{
  sub_246A78484();
  sub_246A78490();
  return sub_246A7849C();
}

uint64_t sub_246A45D4C()
{
  return 0;
}

uint64_t sub_246A45D58(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_246A45D94 + 4 * byte_246A78D50[a1]))(0xD00000000000001ALL, 0x8000000246A7EBC0);
}

uint64_t sub_246A45D94()
{
  return 0x7541646C756F6873;
}

uint64_t sub_246A45DB8()
{
  return 0x646E65536F747561;
}

uint64_t sub_246A45DDC()
{
  return 0x6E49656C646E6168;
}

unint64_t sub_246A45DFC()
{
  return 0xD000000000000011;
}

uint64_t sub_246A45E18()
{
  return 0x6562614C646E6573;
}

uint64_t sub_246A45E3C()
{
  return 0x5074737269467369;
}

uint64_t sub_246A45E60()
{
  return 0x65736E6F70736572;
}

BOOL sub_246A45E80(char *a1, char *a2)
{
  return sub_246A4594C(*a1, *a2);
}

uint64_t sub_246A45E8C()
{
  return sub_246A45D08();
}

uint64_t sub_246A45E94()
{
  return sub_246A4595C();
}

uint64_t sub_246A45E9C()
{
  sub_246A78484();
  sub_246A78490();
  return sub_246A7849C();
}

uint64_t sub_246A45EDC()
{
  unsigned __int8 *v0;

  return sub_246A45D58(*v0);
}

uint64_t sub_246A45EE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A45980(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A45F08()
{
  return sub_246A45D4C();
}

uint64_t sub_246A45F24@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_246A45D00();
  *a1 = result;
  return result;
}

uint64_t sub_246A45F48()
{
  sub_246A466E8();
  return sub_246A784D8();
}

uint64_t sub_246A45F70()
{
  sub_246A466E8();
  return sub_246A784E4();
}

uint64_t AutoSendableCompactCarPlayButton.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617220);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_12();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A466E8();
  sub_246A784CC();
  OUTLINED_FUNCTION_6();
  if (!v1)
  {
    sub_246A783C4();
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_7(&qword_257617238);
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_7(&qword_257617248);
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_15(4);
    sub_246A78394();
    OUTLINED_FUNCTION_15(5);
    sub_246A783AC();
    OUTLINED_FUNCTION_6();
    type metadata accessor for AutoSendableCompactCarPlayButton();
    sub_246A78094();
    sub_246A46910(&qword_257617250, (void (*)(uint64_t))MEMORY[0x24BEA8AE8]);
    sub_246A783A0();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
}

uint64_t AutoSendableCompactCarPlayButton.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  char v27;
  uint64_t v28;

  v21 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617218);
  MEMORY[0x24BDAC7A8]();
  v22 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617258);
  v23 = *(_QWORD *)(v6 - 8);
  v24 = v6;
  MEMORY[0x24BDAC7A8]();
  v7 = type metadata accessor for AutoSendableCompactCarPlayButton();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_12();
  *(_OWORD *)(v3 + 16) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  if (qword_2576171F0 != -1)
    swift_once();
  swift_beginAccess();
  v8 = qword_257617E30;
  *(_QWORD *)(v3 + 48) = qword_257617E28;
  *(_QWORD *)(v3 + 56) = v8;
  v9 = v3 + *(int *)(v7 + 44);
  v10 = sub_246A78094();
  v25 = v9;
  __swift_storeEnumTagSinglePayload(v9, 1, 1, v10);
  v11 = a1;
  v12 = a1[3];
  v26 = v11;
  __swift_project_boxed_opaque_existential_1(v11, v12);
  sub_246A466E8();
  swift_bridgeObjectRetain();
  sub_246A784B4();
  if (v2)
  {
    v18 = v25;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_246A46788(v18);
  }
  else
  {
    LOBYTE(v28) = 0;
    *(_BYTE *)v3 = sub_246A7834C() & 1;
    OUTLINED_FUNCTION_0_0(1);
    sub_246A78358();
    *(_QWORD *)(v3 + 8) = v13;
    OUTLINED_FUNCTION_14();
    v27 = 2;
    OUTLINED_FUNCTION_7(&qword_257617260);
    OUTLINED_FUNCTION_1_0();
    *(_QWORD *)(v3 + 16) = v28;
    OUTLINED_FUNCTION_14();
    v27 = 3;
    OUTLINED_FUNCTION_7(&qword_257617268);
    OUTLINED_FUNCTION_1_0();
    *(_QWORD *)(v3 + 24) = v28;
    OUTLINED_FUNCTION_0_0(4);
    *(_QWORD *)(v3 + 32) = sub_246A78328();
    *(_QWORD *)(v3 + 40) = v14;
    OUTLINED_FUNCTION_0_0(5);
    v15 = sub_246A78340();
    v17 = v16;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v3 + 48) = v15;
    *(_QWORD *)(v3 + 56) = v17;
    OUTLINED_FUNCTION_0_0(6);
    *(_BYTE *)(v3 + 64) = sub_246A7834C() & 1;
    LOBYTE(v28) = 7;
    sub_246A46910(&qword_257617270, (void (*)(uint64_t))MEMORY[0x24BEA8AE8]);
    v19 = (uint64_t)v22;
    sub_246A78334();
    OUTLINED_FUNCTION_5();
    sub_246A465F4(v19, v25);
    sub_246A467FC(v3, v21);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    return sub_246A46840(v3);
  }
}

uint64_t sub_246A46588@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return AutoSendableCompactCarPlayButton.init(from:)(a1, a2);
}

uint64_t sub_246A4659C(_QWORD *a1)
{
  return AutoSendableCompactCarPlayButton.encode(to:)(a1);
}

uint64_t type metadata accessor for AutoSendableCompactCarPlayButton()
{
  uint64_t result;

  result = qword_2576172E8;
  if (!qword_2576172E8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_246A465F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617218);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249563B48]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_246A4667C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617218);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_246A466E8()
{
  unint64_t result;

  result = qword_257617228;
  if (!qword_257617228)
  {
    result = MEMORY[0x249563B60](&unk_246A78F8C, &type metadata for AutoSendableCompactCarPlayButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617228);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249563B54](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
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

uint64_t sub_246A46788(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617218);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_246A467C8(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_16();
  }
  OUTLINED_FUNCTION_9();
}

uint64_t sub_246A467FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AutoSendableCompactCarPlayButton();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246A46840(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AutoSendableCompactCarPlayButton();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_246A4687C(uint64_t a1)
{
  uint64_t v2;

  sub_246A46910(&qword_257617278, (void (*)(uint64_t))type metadata accessor for AutoSendableCompactCarPlayButton);
  *(_QWORD *)(a1 + 16) = v2;
}

void sub_246A468B8()
{
  sub_246A46910(&qword_257617280, (void (*)(uint64_t))type metadata accessor for AutoSendableCompactCarPlayButton);
}

void sub_246A468E4()
{
  sub_246A46910(&qword_257617288, (void (*)(uint64_t))type metadata accessor for AutoSendableCompactCarPlayButton);
}

void sub_246A46910(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    OUTLINED_FUNCTION_16();
  }
  OUTLINED_FUNCTION_9();
}

void sub_246A46944(_QWORD *a1@<X8>)
{
  uint64_t v2;

  AutoSendableCompactCarPlayButton.delayedActionCancelCommand.getter();
  *a1 = v2;
  OUTLINED_FUNCTION_9();
}

void sub_246A4696C(_QWORD *a1@<X8>)
{
  uint64_t v2;

  AutoSendableCompactCarPlayButton.handleIntent.getter();
  *a1 = v2;
  OUTLINED_FUNCTION_9();
}

_QWORD *initializeBufferWithCopyOfBuffer for AutoSendableCompactCarPlayButton(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v16 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v16 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v5 = (void *)a2[2];
    *(_QWORD *)(a1 + 8) = a2[1];
    *(_QWORD *)(a1 + 16) = v5;
    v7 = (void *)a2[3];
    v6 = a2[4];
    *(_QWORD *)(a1 + 24) = v7;
    *(_QWORD *)(a1 + 32) = v6;
    v8 = a2[6];
    *(_QWORD *)(a1 + 40) = a2[5];
    *(_QWORD *)(a1 + 48) = v8;
    *(_QWORD *)(a1 + 56) = a2[7];
    v9 = *(int *)(a3 + 44);
    v10 = (char *)a2 + v9;
    v11 = (void *)(a1 + v9);
    *(_BYTE *)(a1 + 64) = *((_BYTE *)a2 + 64);
    v12 = sub_246A78094();
    v13 = v5;
    v14 = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v12))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617218);
      memcpy(v11, v10, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v11, v10, v12);
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v12);
    }
  }
  return v3;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t destroy for AutoSendableCompactCarPlayButton(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 44);
  v5 = sub_246A78094();
  result = __swift_getEnumTagSinglePayload(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return result;
}

uint64_t initializeWithCopy for AutoSendableCompactCarPlayButton(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  v6 = *(void **)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v5;
  v7 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v7;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  v8 = *(int *)(a3 + 44);
  v9 = (const void *)(a2 + v8);
  v10 = (void *)(a1 + v8);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  v11 = sub_246A78094();
  v12 = v4;
  v13 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v11))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617218);
    memcpy(v10, v9, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v10, v9, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v11);
  }
  return a1;
}

uint64_t assignWithCopy for AutoSendableCompactCarPlayButton(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  const void *v14;
  uint64_t v15;
  int EnumTagSinglePayload;
  int v17;
  uint64_t v18;
  uint64_t v19;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v6 = *(void **)(a1 + 16);
  v7 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v7;
  v8 = v7;

  v9 = *(void **)(a1 + 24);
  v10 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v10;
  v11 = v10;

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  v12 = *(int *)(a3 + 44);
  v13 = (void *)(a1 + v12);
  v14 = (const void *)(a2 + v12);
  v15 = sub_246A78094();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v15);
  v17 = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15);
  if (!EnumTagSinglePayload)
  {
    v18 = *(_QWORD *)(v15 - 8);
    if (!v17)
    {
      (*(void (**)(void *, const void *, uint64_t))(v18 + 24))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v18 + 8))(v13, v15);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617218);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  return a1;
}

uint64_t initializeWithTake for AutoSendableCompactCarPlayButton(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  const void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  v5 = *(int *)(a3 + 44);
  v6 = (const void *)(a2 + v5);
  v7 = (void *)(a1 + v5);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  v8 = sub_246A78094();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v8))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617218);
    memcpy(v7, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7, v6, v8);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v8);
  }
  return a1;
}

uint64_t assignWithTake for AutoSendableCompactCarPlayButton(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const void *v12;
  uint64_t v13;
  int EnumTagSinglePayload;
  int v15;
  uint64_t v16;
  uint64_t v17;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v6 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  v7 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v9;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  v10 = *(int *)(a3 + 44);
  v11 = (void *)(a1 + v10);
  v12 = (const void *)(a2 + v10);
  v13 = sub_246A78094();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v13);
  v15 = __swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13);
  if (!EnumTagSinglePayload)
  {
    v16 = *(_QWORD *)(v13 - 8);
    if (!v15)
    {
      (*(void (**)(void *, const void *, uint64_t))(v16 + 40))(v11, v12, v13);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v16 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617218);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for AutoSendableCompactCarPlayButton()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246A46FF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 56);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617218);
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 44), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for AutoSendableCompactCarPlayButton()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_246A47074(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(a1 + 56) = (a2 - 1);
    OUTLINED_FUNCTION_1();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617218);
    __swift_storeEnumTagSinglePayload(a1 + *(int *)(a4 + 44), a2, a2, v7);
  }
}

void sub_246A470DC()
{
  unint64_t v0;

  sub_246A47180();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_246A47180()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2576172F8[0])
  {
    sub_246A78094();
    v0 = sub_246A78220();
    if (!v1)
      atomic_store(v0, qword_2576172F8);
  }
}

uint64_t getEnumTagSinglePayload for AutoSendableCompactCarPlayButton.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xF9)
  {
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
    v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v5 = v6 - 8;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AutoSendableCompactCarPlayButton.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A472A8 + 4 * byte_246A78D5D[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_246A472DC + 4 * byte_246A78D58[v4]))();
}

uint64_t sub_246A472DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A472E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A472ECLL);
  return result;
}

uint64_t sub_246A472F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A47300);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_246A47304(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A4730C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AutoSendableCompactCarPlayButton.CodingKeys()
{
  return &type metadata for AutoSendableCompactCarPlayButton.CodingKeys;
}

unint64_t sub_246A4732C()
{
  unint64_t result;

  result = qword_257617340;
  if (!qword_257617340)
  {
    result = MEMORY[0x249563B60](&unk_246A78F64, &type metadata for AutoSendableCompactCarPlayButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617340);
  }
  return result;
}

unint64_t sub_246A4736C()
{
  unint64_t result;

  result = qword_257617348;
  if (!qword_257617348)
  {
    result = MEMORY[0x249563B60](&unk_246A78ED4, &type metadata for AutoSendableCompactCarPlayButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617348);
  }
  return result;
}

unint64_t sub_246A473AC()
{
  unint64_t result;

  result = qword_257617350;
  if (!qword_257617350)
  {
    result = MEMORY[0x249563B60](&unk_246A78EFC, &type metadata for AutoSendableCompactCarPlayButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617350);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 72) = a1;
  return v1 - 72;
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return sub_246A78364();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return sub_246A783D0();
}

void OUTLINED_FUNCTION_3(id a1)
{

}

uint64_t OUTLINED_FUNCTION_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 144) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return sub_246A783B8();
}

void OUTLINED_FUNCTION_7(_QWORD *a1)
{
  uint64_t *v1;

  sub_246A467C8(a1, v1);
}

uint64_t OUTLINED_FUNCTION_13()
{
  return type metadata accessor for AutoSendableCompactCarPlayButton();
}

uint64_t OUTLINED_FUNCTION_14()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

void OUTLINED_FUNCTION_15(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 72) = a1;
}

void OUTLINED_FUNCTION_16()
{
  JUMPOUT(0x249563B60);
}

void SentMessageSnippetModel.intent.getter()
{
  id *v0;
  id v1;

  v1 = *v0;
  OUTLINED_FUNCTION_9();
}

void sub_246A47508(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  SentMessageSnippetModel.intent.setter(v1);
}

void SentMessageSnippetModel.intent.setter(void *a1)
{
  id *v1;

  *v1 = a1;
  OUTLINED_FUNCTION_9();
}

void SentMessageSnippetModel.intent.modify(void **a1)
{
  void **v1;
  void *v2;
  id v3;

  v2 = *v1;
  *a1 = *v1;
  a1[1] = v1;
  v3 = v2;
  OUTLINED_FUNCTION_9();
}

void sub_246A4758C(uint64_t a1, char a2)
{
  void **v2;
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)a1;
  v2 = *(void ***)(a1 + 8);
  v4 = *v2;
  if ((a2 & 1) != 0)
  {
    v5 = v3;

    *v2 = v3;
    OUTLINED_FUNCTION_3(v5);
  }
  else
  {

    *v2 = v3;
    OUTLINED_FUNCTION_8();
  }
}

void SentMessageSnippetModel.intentResponse.getter()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 8);
  OUTLINED_FUNCTION_9();
}

void sub_246A475F8(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  SentMessageSnippetModel.intentResponse.setter((uint64_t)v1);
}

void SentMessageSnippetModel.intentResponse.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = a1;
  OUTLINED_FUNCTION_9();
}

void SentMessageSnippetModel.intentResponse.modify(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + 8);
  *a1 = v2;
  a1[1] = v1;
  v3 = v2;
  OUTLINED_FUNCTION_9();
}

void sub_246A4767C(uint64_t a1, char a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)a1;
  v2 = *(_QWORD *)(a1 + 8);
  v4 = *(void **)(v2 + 8);
  if ((a2 & 1) != 0)
  {
    v5 = v3;

    *(_QWORD *)(v2 + 8) = v3;
    OUTLINED_FUNCTION_3(v5);
  }
  else
  {

    *(_QWORD *)(v2 + 8) = v3;
    OUTLINED_FUNCTION_8();
  }
}

uint64_t SentMessageSnippetModel.contactName.getter()
{
  uint64_t v1;

  OUTLINED_FUNCTION_0_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
  OUTLINED_FUNCTION_22();
  return v1;
}

uint64_t type metadata accessor for SentMessageSnippetModel()
{
  uint64_t result;

  result = qword_257617460;
  if (!qword_257617460)
    return swift_getSingletonMetadata();
  return result;
}

void sub_246A47740()
{
  swift_bridgeObjectRetain();
  SentMessageSnippetModel.contactName.setter();
}

void SentMessageSnippetModel.contactName.setter()
{
  OUTLINED_FUNCTION_0_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_20();
}

void SentMessageSnippetModel.contactName.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_8_0();
  *v0 = v1;
  OUTLINED_FUNCTION_0_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
  v1[4] = OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1();
}

uint64_t SentMessageSnippetModel.shouldConfirmUnsend.getter()
{
  unsigned __int8 v1;

  OUTLINED_FUNCTION_0_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617360);
  sub_246A7804C();
  return v1;
}

void SentMessageSnippetModel.shouldConfirmUnsend.setter()
{
  OUTLINED_FUNCTION_0_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617360);
  sub_246A78058();
  OUTLINED_FUNCTION_20();
}

void SentMessageSnippetModel.shouldConfirmUnsend.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_8_0();
  *v0 = v1;
  OUTLINED_FUNCTION_0_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617360);
  v1[4] = OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1();
}

void SentMessageSnippetModel.labels.getter()
{
  OUTLINED_FUNCTION_0_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
  sub_246A7804C();
  OUTLINED_FUNCTION_9();
}

void sub_246A4790C(void *__src)
{
  _BYTE v2[176];

  memcpy(v2, __src, sizeof(v2));
  sub_246A48720((uint64_t)v2);
  SentMessageSnippetModel.labels.setter(__src);
}

void SentMessageSnippetModel.labels.setter(const void *a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_14_0(&v1, a1);
  OUTLINED_FUNCTION_0_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_25();
}

void SentMessageSnippetModel.labels.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_8_0();
  *v0 = v1;
  OUTLINED_FUNCTION_0_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
  v1[4] = OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1();
}

void sub_246A479E0(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

void SentMessageSnippetModel.init(intent:intentResponse:contactName:shouldConfirmUnsend:)(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, _QWORD *a6@<X8>)
{
  id v12;
  id v13;
  _QWORD v14[22];
  _BYTE v15[184];

  OUTLINED_FUNCTION_0_1();
  v15[0] = 0;
  sub_246A78034();
  if (qword_2576171F0 != -1)
    swift_once();
  swift_beginAccess();
  OUTLINED_FUNCTION_14_0(v15, &qword_257617E28);
  OUTLINED_FUNCTION_14_0(v14, &qword_257617E28);
  sub_246A48720((uint64_t)v15);
  sub_246A78034();
  *a6 = a1;
  a6[1] = a2;
  v14[0] = a3;
  v14[1] = a4;
  v12 = a1;
  v13 = a2;
  sub_246A78034();
  LOBYTE(v14[0]) = a5 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617360);
  OUTLINED_FUNCTION_10();

}

uint64_t SentMessageSnippetModel.description.getter()
{
  sub_246A78298();
  sub_246A78178();
  OUTLINED_FUNCTION_0_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
  OUTLINED_FUNCTION_22();
  sub_246A78178();
  swift_bridgeObjectRelease();
  sub_246A78178();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617360);
  OUTLINED_FUNCTION_22();
  sub_246A78178();
  swift_bridgeObjectRelease();
  sub_246A78178();
  return 0;
}

uint64_t sub_246A47C94(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  char v9;

  v3 = a1 == 0x746E65746E69 && a2 == 0xE600000000000000;
  if (v3 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6552746E65746E69 && a2 == 0xEE0065736E6F7073;
    if (v6 || (sub_246A78400() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x4E746361746E6F63 && a2 == 0xEB00000000656D61;
      if (v7 || (sub_246A78400() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000013 && a2 == 0x8000000246A7EC50 || (sub_246A78400() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0x736C6562616CLL && a2 == 0xE600000000000000)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        v9 = sub_246A78400();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return 4;
        else
          return 5;
      }
    }
  }
}

uint64_t sub_246A47E9C()
{
  return 5;
}

uint64_t sub_246A47EA4(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_246A47EDC + 4 * byte_246A78FE0[a1]))(0xD000000000000013, 0x8000000246A7EC50);
}

uint64_t sub_246A47EDC()
{
  return 0x746E65746E69;
}

uint64_t sub_246A47EF0()
{
  return 0x6552746E65746E69;
}

uint64_t sub_246A47F14()
{
  return 0x4E746361746E6F63;
}

uint64_t sub_246A47F34()
{
  return 0x736C6562616CLL;
}

uint64_t sub_246A47F48()
{
  unsigned __int8 *v0;

  return sub_246A47EA4(*v0);
}

uint64_t sub_246A47F50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A47C94(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A47F74@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_246A47E9C();
  *a1 = result;
  return result;
}

uint64_t sub_246A47F98()
{
  sub_246A487EC();
  return sub_246A784D8();
}

uint64_t sub_246A47FC0()
{
  sub_246A487EC();
  return sub_246A784E4();
}

uint64_t SentMessageSnippetModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617370);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_15_0();
  v7 = v6 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A487EC();
  sub_246A784CC();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11((uint64_t)&unk_257617388);
  OUTLINED_FUNCTION_1_1();
  if (!v1)
  {
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_11((uint64_t)&unk_257617398);
    OUTLINED_FUNCTION_1_1();
    type metadata accessor for SentMessageSnippetModel();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
    sub_246A4891C((uint64_t)&unk_2576173A0);
    OUTLINED_FUNCTION_1_1();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257617360);
    sub_246A48828((uint64_t)&unk_2576173A8);
    OUTLINED_FUNCTION_1_1();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
    sub_246A48968((uint64_t)&unk_2576173B0);
    OUTLINED_FUNCTION_1_1();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t SentMessageSnippetModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  id *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
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
  void *v28;
  _BYTE v29[184];
  char v30;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
  v23 = *(_QWORD *)(v4 - 8);
  v24 = v4;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_6_0();
  v18 = v5;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617360);
  v27 = *(_QWORD *)(v25 - 8);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_6_0();
  v19 = v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
  v21 = *(_QWORD *)(v7 - 8);
  v22 = v7;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_6_0();
  v20 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576173C8);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_15_0();
  v9 = type metadata accessor for SentMessageSnippetModel();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_15_0();
  v12 = (id *)(v11 - v10);
  *v12 = 0;
  v12[1] = 0;
  v14 = v11 - v10 + *(int *)(v13 + 28);
  LOBYTE(v28) = 0;
  v26 = v14;
  sub_246A78034();
  v15 = (char *)v12 + *(int *)(v9 + 32);
  if (qword_2576171F0 != -1)
    swift_once();
  swift_beginAccess();
  OUTLINED_FUNCTION_24(v29);
  OUTLINED_FUNCTION_24(&v28);
  sub_246A48720((uint64_t)v29);
  sub_246A78034();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A487EC();
  sub_246A784B4();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);

    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v25);
    return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v15, v24);
  }
  else
  {
    OUTLINED_FUNCTION_14();
    v30 = 0;
    OUTLINED_FUNCTION_11((uint64_t)&unk_2576173D0);
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_2_0();
    *v12 = v28;
    OUTLINED_FUNCTION_14();
    v30 = 1;
    OUTLINED_FUNCTION_11((uint64_t)&unk_2576173D8);
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_2_0();
    v12[1] = v28;
    LOBYTE(v28) = 2;
    sub_246A4891C((uint64_t)&unk_2576173E0);
    OUTLINED_FUNCTION_2_0();
    (*(void (**)(char *, uint64_t, uint64_t))(v21 + 32))((char *)v12 + *(int *)(v9 + 24), v20, v22);
    LOBYTE(v28) = 3;
    sub_246A48828((uint64_t)&unk_2576173E8);
    OUTLINED_FUNCTION_2_0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 40))(v26, v19, v25);
    LOBYTE(v28) = 4;
    sub_246A48968((uint64_t)&unk_2576173F0);
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_5_0();
    (*(void (**)(char *, uint64_t, uint64_t))(v23 + 40))(v15, v18, v24);
    sub_246A489D0((uint64_t)v12, a2);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_246A48A14((uint64_t)v12);
  }
}

uint64_t sub_246A486F8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SentMessageSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_246A4870C(_QWORD *a1)
{
  return SentMessageSnippetModel.encode(to:)(a1);
}

uint64_t sub_246A48720(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
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

unint64_t sub_246A487EC()
{
  unint64_t result;

  result = qword_257617378;
  if (!qword_257617378)
  {
    result = MEMORY[0x249563B60](&unk_246A79194, &type metadata for SentMessageSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617378);
  }
  return result;
}

void sub_246A48828(uint64_t a1)
{
  if (!OUTLINED_FUNCTION_18(a1))
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257617360);
    OUTLINED_FUNCTION_16_0();
  }
  OUTLINED_FUNCTION_20();
}

unint64_t sub_246A48874()
{
  unint64_t result;

  result = qword_2576173B8;
  if (!qword_2576173B8)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for SnippetLabels, &type metadata for SnippetLabels);
    atomic_store(result, (unint64_t *)&qword_2576173B8);
  }
  return result;
}

unint64_t sub_246A488B0()
{
  unint64_t result;

  result = qword_2576173C0;
  if (!qword_2576173C0)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for SnippetLabels, &type metadata for SnippetLabels);
    atomic_store(result, (unint64_t *)&qword_2576173C0);
  }
  return result;
}

void sub_246A488EC(uint64_t a1)
{
  uint64_t *v1;

  if (!OUTLINED_FUNCTION_18(a1))
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v1);
    OUTLINED_FUNCTION_16();
  }
  OUTLINED_FUNCTION_9();
}

void sub_246A4891C(uint64_t a1)
{
  if (!OUTLINED_FUNCTION_18(a1))
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257617358);
    OUTLINED_FUNCTION_16_0();
  }
  OUTLINED_FUNCTION_20();
}

unint64_t sub_246A48968(uint64_t a1)
{
  unint64_t *v1;
  unint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[2];

  result = OUTLINED_FUNCTION_18(a1);
  if (!result)
  {
    v4 = v3;
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257617368);
    v6[0] = sub_246A48874();
    v6[1] = sub_246A488B0();
    result = MEMORY[0x249563B60](v4, v5, v6);
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_246A489D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SentMessageSnippetModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246A48A14(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SentMessageSnippetModel();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_246A48A50()
{
  sub_246A48A98((uint64_t)&unk_2576173F8);
}

void sub_246A48A74()
{
  sub_246A48A98((uint64_t)&unk_257617400);
}

void sub_246A48A98(uint64_t a1)
{
  if (!OUTLINED_FUNCTION_18(a1))
  {
    type metadata accessor for SentMessageSnippetModel();
    OUTLINED_FUNCTION_16();
  }
  OUTLINED_FUNCTION_9();
}

void sub_246A48AC8()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_26();
  SentMessageSnippetModel.intent.getter();
  *v0 = v1;
  OUTLINED_FUNCTION_9();
}

void sub_246A48AEC()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_26();
  SentMessageSnippetModel.intentResponse.getter();
  *v0 = v1;
  OUTLINED_FUNCTION_9();
}

void sub_246A48B10()
{
  uint64_t *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_26();
  *v0 = SentMessageSnippetModel.contactName.getter();
  v0[1] = v1;
  OUTLINED_FUNCTION_9();
}

void sub_246A48B34()
{
  _BYTE *v0;

  OUTLINED_FUNCTION_26();
  *v0 = SentMessageSnippetModel.shouldConfirmUnsend.getter() & 1;
  OUTLINED_FUNCTION_9();
}

void sub_246A48B58()
{
  SentMessageSnippetModel.shouldConfirmUnsend.setter();
  OUTLINED_FUNCTION_9();
}

void sub_246A48B78(void *a1@<X8>)
{
  uint64_t v2;

  SentMessageSnippetModel.labels.getter();
  OUTLINED_FUNCTION_14_0(a1, &v2);
  OUTLINED_FUNCTION_25();
}

char *initializeBufferWithCopyOfBuffer for SentMessageSnippetModel(char *a1, char **a2, int *a3)
{
  int v4;
  char *v5;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;

  v4 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    v8 = a2[1];
    *((_QWORD *)a1 + 1) = v8;
    v9 = a3[6];
    v10 = &a1[v9];
    v11 = (uint64_t)a2 + v9;
    v12 = v5;
    v13 = v8;
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v10, v11, v14);
    v15 = a3[7];
    v16 = &a1[v15];
    v17 = (uint64_t)a2 + v15;
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617360);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
    v19 = a3[8];
    v20 = &a1[v19];
    v21 = (uint64_t)a2 + v19;
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v20, v21, v22);
  }
  return a1;
}

uint64_t destroy for SentMessageSnippetModel(id *a1, int *a2)
{
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v4 = (char *)a1 + a2[6];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = (char *)a1 + a2[7];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617360);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = (char *)a1 + a2[8];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
}

_QWORD *initializeWithCopy for SentMessageSnippetModel(_QWORD *a1, uint64_t a2, int *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = *(void **)a2;
  v7 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v7;
  v8 = a3[6];
  v9 = (char *)a1 + v8;
  v10 = a2 + v8;
  v11 = v6;
  v12 = v7;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v9, v10, v13);
  v14 = a3[7];
  v15 = (char *)a1 + v14;
  v16 = a2 + v14;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617360);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
  v18 = a3[8];
  v19 = (char *)a1 + v18;
  v20 = a2 + v18;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
  return a1;
}

uint64_t assignWithCopy for SentMessageSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
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

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  v9 = *(void **)(a1 + 8);
  v10 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v10;
  v11 = v10;

  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  v16 = a3[7];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617360);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 24))(v17, v18, v19);
  v20 = a3[8];
  v21 = a1 + v20;
  v22 = a2 + v20;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 24))(v21, v22, v23);
  return a1;
}

_OWORD *initializeWithTake for SentMessageSnippetModel(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;

  *a1 = *a2;
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617360);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  v14 = a3[8];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
  return a1;
}

uint64_t assignWithTake for SentMessageSnippetModel(uint64_t a1, _QWORD *a2, int *a3)
{
  void *v6;
  void *v7;
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

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v7 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = a2[1];

  v8 = a3[6];
  v9 = a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  v12 = a3[7];
  v13 = a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617360);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = a3[8];
  v17 = a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for SentMessageSnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246A490EC(uint64_t *a1, uint64_t a2, int *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
    if (*(_DWORD *)(*(_QWORD *)(v9 - 8) + 84) == (_DWORD)a2)
    {
      v10 = v9;
      v11 = a3[6];
    }
    else
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617360);
      if (*(_DWORD *)(*(_QWORD *)(v12 - 8) + 84) == (_DWORD)a2)
      {
        v10 = v12;
        v11 = a3[7];
      }
      else
      {
        v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
        v11 = a3[8];
      }
    }
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for SentMessageSnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_QWORD *sub_246A491CC(_QWORD *result, uint64_t a2, int a3, int *a4)
{
  _QWORD *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 2147483646)
  {
    *result = a2;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
    {
      v9 = v8;
      v10 = a4[6];
    }
    else
    {
      v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617360);
      if (*(_DWORD *)(*(_QWORD *)(v11 - 8) + 84) == a3)
      {
        v9 = v11;
        v10 = a4[7];
      }
      else
      {
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
        v10 = a4[8];
      }
    }
    return (_QWORD *)__swift_storeEnumTagSinglePayload((uint64_t)v5 + v10, a2, a2, v9);
  }
  return result;
}

void sub_246A49290()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_246A4936C(319, &qword_257617470);
  if (v0 <= 0x3F)
  {
    sub_246A4936C(319, &qword_257617478);
    if (v1 <= 0x3F)
    {
      sub_246A4936C(319, qword_257617480);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_246A4936C(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_246A78064();
    if (!v4)
      atomic_store(v3, a2);
  }
  OUTLINED_FUNCTION_9();
}

uint64_t getEnumTagSinglePayload for SentMessageSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFC)
  {
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
    v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v5 = v6 - 5;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SentMessageSnippetModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A49480 + 4 * byte_246A78FEA[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_246A494B4 + 4 * byte_246A78FE5[v4]))();
}

uint64_t sub_246A494B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A494BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A494C4);
  return result;
}

uint64_t sub_246A494D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A494D8);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_246A494DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A494E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SentMessageSnippetModel.CodingKeys()
{
  return &type metadata for SentMessageSnippetModel.CodingKeys;
}

unint64_t sub_246A49504()
{
  unint64_t result;

  result = qword_2576174C0;
  if (!qword_2576174C0)
  {
    result = MEMORY[0x249563B60](&unk_246A7916C, &type metadata for SentMessageSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576174C0);
  }
  return result;
}

unint64_t sub_246A49544()
{
  unint64_t result;

  result = qword_2576174C8;
  if (!qword_2576174C8)
  {
    result = MEMORY[0x249563B60](&unk_246A790DC, &type metadata for SentMessageSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576174C8);
  }
  return result;
}

unint64_t sub_246A49584()
{
  unint64_t result;

  result = qword_2576174D0;
  if (!qword_2576174D0)
  {
    result = MEMORY[0x249563B60](&unk_246A79104, &type metadata for SentMessageSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576174D0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return type metadata accessor for SentMessageSnippetModel();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return sub_246A783D0();
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return sub_246A78364();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 32) + 8))(v1, *(_QWORD *)(v0 + 40));
}

void *OUTLINED_FUNCTION_8_0()
{
  return malloc(0x28uLL);
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return sub_246A78040();
}

uint64_t OUTLINED_FUNCTION_10()
{
  return sub_246A78058();
}

void OUTLINED_FUNCTION_11(uint64_t a1)
{
  sub_246A488EC(a1);
}

void *OUTLINED_FUNCTION_14_0(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xB0uLL);
}

void OUTLINED_FUNCTION_16_0()
{
  JUMPOUT(0x249563B60);
}

uint64_t OUTLINED_FUNCTION_18(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t OUTLINED_FUNCTION_22()
{
  return sub_246A7804C();
}

uint64_t OUTLINED_FUNCTION_23()
{
  uint64_t v0;

  return v0;
}

void *OUTLINED_FUNCTION_24(void *a1)
{
  const void *v1;

  return memcpy(a1, v1, 0xB0uLL);
}

void AttachmentModel.messageAttachment.getter()
{
  uint64_t v0;
  char *v1;

  type metadata accessor for AttachmentModel();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_18_0();
  sub_246A4982C(v0, v0);
  v1 = (char *)sub_246A4972C + 4 * byte_246A791F0[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_246A4972C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *boxed_opaque_existential_1;

  v0[3] = type metadata accessor for LinkAttachment();
  sub_246A4B7F0(&qword_2576174F0, (uint64_t (*)(uint64_t))type metadata accessor for LinkAttachment, (uint64_t)&protocol conformance descriptor for LinkAttachment);
  v0[4] = v2;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v0);
  sub_246A4B53C(v1, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))type metadata accessor for LinkAttachment);
}

uint64_t type metadata accessor for AttachmentModel()
{
  uint64_t result;

  result = qword_257617640;
  if (!qword_257617640)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_246A4982C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AttachmentModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_246A49870()
{
  unint64_t result;

  result = qword_2576174D8;
  if (!qword_2576174D8)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for VideoAttachment, &type metadata for VideoAttachment);
    atomic_store(result, (unint64_t *)&qword_2576174D8);
  }
  return result;
}

unint64_t sub_246A498AC()
{
  unint64_t result;

  result = qword_2576174E0;
  if (!qword_2576174E0)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for PhotoAttachment, &type metadata for PhotoAttachment);
    atomic_store(result, (unint64_t *)&qword_2576174E0);
  }
  return result;
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

uint64_t AttachmentModel.init(messageAttachment:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  _BYTE v18[40];

  type metadata accessor for MapAttachment();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_17();
  type metadata accessor for LinkAttachment();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_13_0();
  v7 = type metadata accessor for AttachmentModel();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_18_0();
  sub_246A49C68(a1, (uint64_t)v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576174F8);
  if (swift_dynamicCast())
  {
    OUTLINED_FUNCTION_19();
    sub_246A4B53C(v4, v2, (uint64_t (*)(_QWORD))type metadata accessor for LinkAttachment);
LABEL_8:
    swift_storeEnumTagMultiPayload();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    sub_246A4B53C(v2, a2, (uint64_t (*)(_QWORD))type metadata accessor for AttachmentModel);
    v8 = 0;
    return __swift_storeEnumTagSinglePayload(a2, v8, 1, v7);
  }
  if (swift_dynamicCast())
  {
    OUTLINED_FUNCTION_19();
    sub_246A4B53C(v3, v2, (uint64_t (*)(_QWORD))type metadata accessor for MapAttachment);
    goto LABEL_8;
  }
  if (OUTLINED_FUNCTION_11_0() || OUTLINED_FUNCTION_11_0())
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    OUTLINED_FUNCTION_10_0();
    goto LABEL_8;
  }
  if (qword_2576171E8 != -1)
    swift_once();
  v10 = sub_246A780F4();
  __swift_project_value_buffer(v10, (uint64_t)qword_257623F88);
  sub_246A49C68(a1, (uint64_t)v17);
  v11 = sub_246A780DC();
  v12 = sub_246A781FC();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    *(_DWORD *)v13 = 136315138;
    __swift_project_boxed_opaque_existential_1(v17, v17[3]);
    swift_getDynamicType();
    v14 = sub_246A784F0();
    sub_246A4ADD4(v14, v15, &v16);
    sub_246A7822C();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
    _os_log_impl(&dword_246A43000, v11, v12, "#AttachmentModel unknown message attachment type: %s", v13, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_22_0();
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  OUTLINED_FUNCTION_19();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  v8 = 1;
  return __swift_storeEnumTagSinglePayload(a2, v8, 1, v7);
}

uint64_t sub_246A49C68(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_246A49CAC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  char v9;

  v3 = a1 == 0x617474416B6E696CLL && a2 == 0xEE00746E656D6863;
  if (v3 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x636174744170616DLL && a2 == 0xED0000746E656D68;
    if (v6 || (sub_246A78400() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x7474416F746F6870 && a2 == 0xEF746E656D686361;
      if (v7 || (sub_246A78400() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x7474416F65646976 && a2 == 0xEF746E656D686361)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v9 = sub_246A78400();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return 3;
        else
          return 4;
      }
    }
  }
}

uint64_t sub_246A49E98()
{
  return 4;
}

uint64_t sub_246A49EA0(char a1)
{
  return *(_QWORD *)&aLinkattamapatt[8 * a1];
}

uint64_t sub_246A49EC0()
{
  return 1;
}

uint64_t sub_246A49EC8()
{
  return sub_246A78490();
}

uint64_t sub_246A49EEC()
{
  return 12383;
}

uint64_t sub_246A49EF8(uint64_t a1, uint64_t a2)
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
    v3 = sub_246A78400();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void sub_246A49F64()
{
  sub_246A78484();
  OUTLINED_FUNCTION_21();
  sub_246A7849C();
  OUTLINED_FUNCTION_20_0();
}

uint64_t sub_246A49F94()
{
  char *v0;

  return sub_246A49EA0(*v0);
}

uint64_t sub_246A49F9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A49CAC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A49FC0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_246A49E98();
  *a1 = result;
  return result;
}

uint64_t sub_246A49FE4()
{
  sub_246A4B57C();
  return sub_246A784D8();
}

uint64_t sub_246A4A00C()
{
  sub_246A4B57C();
  return sub_246A784E4();
}

void sub_246A4A038()
{
  sub_246A49F64();
}

uint64_t sub_246A4A058()
{
  sub_246A4B6E4();
  return sub_246A784D8();
}

uint64_t sub_246A4A080()
{
  sub_246A4B6E4();
  return sub_246A784E4();
}

uint64_t sub_246A4A0A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A49EF8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_246A4A0D0()
{
  return sub_246A45D4C();
}

uint64_t sub_246A4A0E8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_246A49EC0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_246A4A110()
{
  sub_246A4B6A8();
  return sub_246A784D8();
}

uint64_t sub_246A4A138()
{
  sub_246A4B6A8();
  return sub_246A784E4();
}

uint64_t sub_246A4A160()
{
  sub_246A4B630();
  return sub_246A784D8();
}

uint64_t sub_246A4A188()
{
  sub_246A4B630();
  return sub_246A784E4();
}

void sub_246A4A1B0()
{
  sub_246A78484();
  OUTLINED_FUNCTION_21();
  sub_246A7849C();
  OUTLINED_FUNCTION_20_0();
}

uint64_t sub_246A4A1DC()
{
  sub_246A4B5B8();
  return sub_246A784D8();
}

uint64_t sub_246A4A204()
{
  sub_246A4B5B8();
  return sub_246A784E4();
}

void AttachmentModel.encode(to:)(_QWORD *a1)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257617500);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_6_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617508);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_14_1(v4, v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617510);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_6_0();
  type metadata accessor for MapAttachment();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_6_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617518);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_15_0();
  type metadata accessor for LinkAttachment();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_13_0();
  type metadata accessor for AttachmentModel();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_15_0();
  v12 = v11 - v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617520);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_17();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A4B57C();
  sub_246A784CC();
  sub_246A4982C(v16, v12);
  v14 = (char *)sub_246A4A41C + 4 * byte_246A791F4[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_246A4A41C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_24_0(v0);
  *(_BYTE *)(v4 - 96) = 0;
  sub_246A4B6E4();
  OUTLINED_FUNCTION_7_0();
  sub_246A4B7F0(&qword_257617568, (uint64_t (*)(uint64_t))type metadata accessor for LinkAttachment, (uint64_t)&protocol conformance descriptor for LinkAttachment);
  sub_246A783D0();
  OUTLINED_FUNCTION_6_1(v3, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 224) + 8));
  sub_246A4BC60(v2, (uint64_t (*)(_QWORD))type metadata accessor for LinkAttachment);
  OUTLINED_FUNCTION_4(v1, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 120) + 8));
  OUTLINED_FUNCTION_8_1();
}

void AttachmentModel.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
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
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43[18];
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;

  v43[12] = a2;
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617570);
  v43[17] = *(_QWORD *)(v46 - 8);
  OUTLINED_FUNCTION_12_0();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  OUTLINED_FUNCTION_6_0();
  v43[16] = v3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617578);
  v43[10] = *(_QWORD *)(v4 - 8);
  v43[11] = v4;
  OUTLINED_FUNCTION_12_0();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  OUTLINED_FUNCTION_14_1(v5, v43[0]);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617580);
  v43[8] = *(_QWORD *)(v6 - 8);
  v43[9] = v6;
  OUTLINED_FUNCTION_12_0();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  OUTLINED_FUNCTION_6_0();
  v43[14] = v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617588);
  v43[6] = *(_QWORD *)(v8 - 8);
  v43[7] = v8;
  OUTLINED_FUNCTION_12_0();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  OUTLINED_FUNCTION_6_0();
  v43[13] = v9;
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617590);
  v44 = *(_QWORD *)(v47 - 8);
  OUTLINED_FUNCTION_12_0();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  OUTLINED_FUNCTION_15_0();
  v12 = v11 - v10;
  v45 = type metadata accessor for AttachmentModel();
  OUTLINED_FUNCTION_12_0();
  v13 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v15 = (char *)v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)v43 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)v43 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)v43 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)v43 - v25;
  v27 = a1[3];
  v48 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v27);
  sub_246A4B57C();
  v28 = v49;
  sub_246A784B4();
  if (!v28)
  {
    v43[2] = (uint64_t)v24;
    v43[3] = (uint64_t)v21;
    v43[0] = (uint64_t)v18;
    v43[1] = (uint64_t)v15;
    v29 = v45;
    v43[4] = (uint64_t)v26;
    v49 = v12;
    v30 = sub_246A78370();
    v31 = *(_QWORD *)(v30 + 16);
    if (v31)
    {
      v43[5] = 0;
      v32 = *(unsigned __int8 *)(v30 + 32);
      sub_246A4C570(1, v31, v30, v30 + 32, 0, (2 * v31) | 1);
      v34 = v33;
      v36 = v35;
      swift_bridgeObjectRelease();
      v37 = v29;
      if (v34 == v36 >> 1)
        __asm { BR              X9 }
    }
    else
    {
      v37 = v29;
    }
    v38 = sub_246A782C8();
    swift_allocError();
    v40 = v39;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257617598);
    *v40 = v37;
    v41 = v47;
    v42 = v49;
    sub_246A7831C();
    sub_246A782BC();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v38 - 8) + 104))(v40, *MEMORY[0x24BEE26D0], v38);
    swift_willThrow();
    OUTLINED_FUNCTION_5_1();
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v42, v41);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
  OUTLINED_FUNCTION_8_1();
}

void sub_246A4AAA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v2 - 104) = 1;
  sub_246A4B6A8();
  OUTLINED_FUNCTION_3_0();
  if (!v1)
  {
    type metadata accessor for MapAttachment();
    sub_246A4B7F0(&qword_2576175B0, (uint64_t (*)(uint64_t))type metadata accessor for MapAttachment, (uint64_t)&protocol conformance descriptor for MapAttachment);
    OUTLINED_FUNCTION_12_1();
    *(_QWORD *)(v2 - 248) = 0;
    OUTLINED_FUNCTION_2_1(*(_QWORD *)(v2 - 224));
    OUTLINED_FUNCTION_5_1();
    OUTLINED_FUNCTION_4(*(_QWORD *)(v2 - 72), *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 144) + 8));
    swift_storeEnumTagMultiPayload();
    JUMPOUT(0x246A4AD64);
  }
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4(v0, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 144) + 8));
  JUMPOUT(0x246A4AA8CLL);
}

void sub_246A4AB40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v2 - 104) = 2;
  sub_246A4B630();
  OUTLINED_FUNCTION_3_0();
  if (v1)
    JUMPOUT(0x246A4AB70);
  sub_246A4B75C();
  OUTLINED_FUNCTION_12_1();
  v3 = *(_QWORD *)(v2 - 144);
  *(_QWORD *)(v2 - 248) = 0;
  OUTLINED_FUNCTION_2_1(*(_QWORD *)(v2 - 208));
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4(v0, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  OUTLINED_FUNCTION_15_1(*(_QWORD *)(v2 - 104));
  swift_storeEnumTagMultiPayload();
  JUMPOUT(0x246A4AD64);
}

void sub_246A4AB90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v5 - 104) = 3;
  sub_246A4B5B8();
  OUTLINED_FUNCTION_3_0();
  if (v1)
  {
    OUTLINED_FUNCTION_5_1();
    OUTLINED_FUNCTION_4(v0, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 144) + 8));
    JUMPOUT(0x246A4AA8CLL);
  }
  sub_246A4B720();
  sub_246A78364();
  v6 = *(_QWORD *)(v5 - 144);
  *(_QWORD *)(v5 - 248) = 0;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v2);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4(v0, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  OUTLINED_FUNCTION_15_1(*(_QWORD *)(v5 - 104));
  JUMPOUT(0x246A4AD54);
}

void sub_246A4AD94(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  AttachmentModel.init(from:)(a1, a2);
}

void sub_246A4ADA8(_QWORD *a1)
{
  AttachmentModel.encode(to:)(a1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_246A4ADD4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_246A4AEA4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_246A4C5E8((uint64_t)v12, *a3);
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
      sub_246A4C5E8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_246A4AEA4(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_246A4AFF8((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_246A78238();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_246A4B0BC(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_246A782D4();
    if (!v8)
    {
      result = sub_246A782E0();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *sub_246A4AFF8(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_246A782F8();
  __break(1u);
  return result;
}

uint64_t sub_246A4B0BC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_246A4B150(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_246A4B324(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_246A4B324((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_246A4B150(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_246A78184();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  v3 = sub_246A4B2C0(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_246A782A4();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_246A782F8();
  __break(1u);
LABEL_14:
  result = sub_246A782E0();
  __break(1u);
  return result;
}

_QWORD *sub_246A4B2C0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576176F0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_246A4B324(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576176F0);
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_246A4B4BC(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_246A4B3F8(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_246A4B3F8(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_246A782F8();
  __break(1u);
  return result;
}

char *sub_246A4B4BC(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_246A782F8();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

void sub_246A4B53C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  OUTLINED_FUNCTION_9();
}

unint64_t sub_246A4B57C()
{
  unint64_t result;

  result = qword_257617528;
  if (!qword_257617528)
  {
    result = MEMORY[0x249563B60](&unk_246A79854, &type metadata for AttachmentModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617528);
  }
  return result;
}

unint64_t sub_246A4B5B8()
{
  unint64_t result;

  result = qword_257617530;
  if (!qword_257617530)
  {
    result = MEMORY[0x249563B60](&unk_246A79804, &type metadata for AttachmentModel.VideoAttachmentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617530);
  }
  return result;
}

unint64_t sub_246A4B5F4()
{
  unint64_t result;

  result = qword_257617538;
  if (!qword_257617538)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for VideoAttachment, &type metadata for VideoAttachment);
    atomic_store(result, (unint64_t *)&qword_257617538);
  }
  return result;
}

unint64_t sub_246A4B630()
{
  unint64_t result;

  result = qword_257617540;
  if (!qword_257617540)
  {
    result = MEMORY[0x249563B60](&unk_246A797B4, &type metadata for AttachmentModel.PhotoAttachmentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617540);
  }
  return result;
}

unint64_t sub_246A4B66C()
{
  unint64_t result;

  result = qword_257617548;
  if (!qword_257617548)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for PhotoAttachment, &type metadata for PhotoAttachment);
    atomic_store(result, (unint64_t *)&qword_257617548);
  }
  return result;
}

unint64_t sub_246A4B6A8()
{
  unint64_t result;

  result = qword_257617550;
  if (!qword_257617550)
  {
    result = MEMORY[0x249563B60](&unk_246A79764, &type metadata for AttachmentModel.MapAttachmentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617550);
  }
  return result;
}

unint64_t sub_246A4B6E4()
{
  unint64_t result;

  result = qword_257617560;
  if (!qword_257617560)
  {
    result = MEMORY[0x249563B60](&unk_246A79714, &type metadata for AttachmentModel.LinkAttachmentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617560);
  }
  return result;
}

unint64_t sub_246A4B720()
{
  unint64_t result;

  result = qword_2576175A0;
  if (!qword_2576175A0)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for VideoAttachment, &type metadata for VideoAttachment);
    atomic_store(result, (unint64_t *)&qword_2576175A0);
  }
  return result;
}

unint64_t sub_246A4B75C()
{
  unint64_t result;

  result = qword_2576175A8;
  if (!qword_2576175A8)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for PhotoAttachment, &type metadata for PhotoAttachment);
    atomic_store(result, (unint64_t *)&qword_2576175A8);
  }
  return result;
}

void sub_246A4B798()
{
  sub_246A4B7F0(&qword_2576175C0, (uint64_t (*)(uint64_t))type metadata accessor for AttachmentModel, (uint64_t)&protocol conformance descriptor for AttachmentModel);
}

void sub_246A4B7C4()
{
  sub_246A4B7F0(&qword_2576175C8, (uint64_t (*)(uint64_t))type metadata accessor for AttachmentModel, (uint64_t)&protocol conformance descriptor for AttachmentModel);
}

void sub_246A4B7F0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x249563B60](a3, v5), a1);
  }
  OUTLINED_FUNCTION_9();
}

uint64_t initializeBufferWithCopyOfBuffer for AttachmentModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    v5 = (char *)&loc_246A4B87C + 4 * byte_246A791FC[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t destroy for AttachmentModel(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 1:
      v3 = sub_246A77F5C();
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
      break;
    case 2:
    case 3:
      result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

void initializeWithCopy for AttachmentModel()
{
  char *v0;

  v0 = (char *)sub_246A4BA3C + 4 * byte_246A79204[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_246A4BA3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = sub_246A77F5C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v0, v1, v2);
  v3 = type metadata accessor for LinkAttachment();
  *(_BYTE *)(v0 + *(int *)(v3 + 20)) = *(_BYTE *)(v1 + *(int *)(v3 + 20));
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t assignWithCopy for AttachmentModel(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_246A4BC60(result, (uint64_t (*)(_QWORD))type metadata accessor for AttachmentModel);
    v2 = (char *)&loc_246A4BB7C + 4 * byte_246A79208[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

void sub_246A4BC60(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_9();
}

_BYTE *initializeWithTake for AttachmentModel(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v9 = sub_246A77F5C();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
    v10 = type metadata accessor for MapAttachment();
    a1[*(int *)(v10 + 20)] = a2[*(int *)(v10 + 20)];
  }
  else
  {
    if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      return a1;
    }
    v7 = sub_246A77F5C();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    v8 = type metadata accessor for LinkAttachment();
    a1[*(int *)(v8 + 20)] = a2[*(int *)(v8 + 20)];
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_BYTE *assignWithTake for AttachmentModel(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a1 != a2)
  {
    sub_246A4BC60((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for AttachmentModel);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v9 = sub_246A77F5C();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
      v10 = type metadata accessor for MapAttachment();
      a1[*(int *)(v10 + 20)] = a2[*(int *)(v10 + 20)];
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        return a1;
      }
      v7 = sub_246A77F5C();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      v8 = type metadata accessor for LinkAttachment();
      a1[*(int *)(v8 + 20)] = a2[*(int *)(v8 + 20)];
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_246A4BE8C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_246A4BE9C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for LinkAttachment();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for MapAttachment();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AttachmentModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFD)
  {
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
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AttachmentModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A4BFFC + 4 * byte_246A79211[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_246A4C030 + 4 * byte_246A7920C[v4]))();
}

uint64_t sub_246A4C030(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A4C038(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A4C040);
  return result;
}

uint64_t sub_246A4C04C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A4C054);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_246A4C058(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A4C060(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AttachmentModel.CodingKeys()
{
  return &type metadata for AttachmentModel.CodingKeys;
}

uint64_t sub_246A4C088()
{
  return 0;
}

ValueMetadata *type metadata accessor for AttachmentModel.LinkAttachmentCodingKeys()
{
  return &type metadata for AttachmentModel.LinkAttachmentCodingKeys;
}

ValueMetadata *type metadata accessor for AttachmentModel.MapAttachmentCodingKeys()
{
  return &type metadata for AttachmentModel.MapAttachmentCodingKeys;
}

ValueMetadata *type metadata accessor for AttachmentModel.PhotoAttachmentCodingKeys()
{
  return &type metadata for AttachmentModel.PhotoAttachmentCodingKeys;
}

uint64_t getEnumTagSinglePayload for SecurityScopedURL.CodingKeys(unsigned int *a1, int a2)
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

uint64_t _s18SiriMessagesCommon15AttachmentModelO24LinkAttachmentCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_246A4C150 + 4 * byte_246A79216[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_246A4C170 + 4 * byte_246A7921B[v4]))();
}

_BYTE *sub_246A4C150(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_246A4C170(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_246A4C178(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_246A4C180(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_246A4C188(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_246A4C190(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AttachmentModel.VideoAttachmentCodingKeys()
{
  return &type metadata for AttachmentModel.VideoAttachmentCodingKeys;
}

unint64_t sub_246A4C1B0()
{
  unint64_t result;

  result = qword_257617678;
  if (!qword_257617678)
  {
    result = MEMORY[0x249563B60](&unk_246A7940C, &type metadata for AttachmentModel.VideoAttachmentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617678);
  }
  return result;
}

unint64_t sub_246A4C1F0()
{
  unint64_t result;

  result = qword_257617680;
  if (!qword_257617680)
  {
    result = MEMORY[0x249563B60](&unk_246A794C4, &type metadata for AttachmentModel.PhotoAttachmentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617680);
  }
  return result;
}

unint64_t sub_246A4C230()
{
  unint64_t result;

  result = qword_257617688;
  if (!qword_257617688)
  {
    result = MEMORY[0x249563B60](&unk_246A7957C, &type metadata for AttachmentModel.MapAttachmentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617688);
  }
  return result;
}

unint64_t sub_246A4C270()
{
  unint64_t result;

  result = qword_257617690;
  if (!qword_257617690)
  {
    result = MEMORY[0x249563B60](&unk_246A79634, &type metadata for AttachmentModel.LinkAttachmentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617690);
  }
  return result;
}

unint64_t sub_246A4C2B0()
{
  unint64_t result;

  result = qword_257617698;
  if (!qword_257617698)
  {
    result = MEMORY[0x249563B60](&unk_246A796EC, &type metadata for AttachmentModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617698);
  }
  return result;
}

unint64_t sub_246A4C2F0()
{
  unint64_t result;

  result = qword_2576176A0;
  if (!qword_2576176A0)
  {
    result = MEMORY[0x249563B60](&unk_246A795A4, &type metadata for AttachmentModel.LinkAttachmentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576176A0);
  }
  return result;
}

unint64_t sub_246A4C330()
{
  unint64_t result;

  result = qword_2576176A8;
  if (!qword_2576176A8)
  {
    result = MEMORY[0x249563B60](&unk_246A795CC, &type metadata for AttachmentModel.LinkAttachmentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576176A8);
  }
  return result;
}

unint64_t sub_246A4C370()
{
  unint64_t result;

  result = qword_2576176B0;
  if (!qword_2576176B0)
  {
    result = MEMORY[0x249563B60](&unk_246A794EC, &type metadata for AttachmentModel.MapAttachmentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576176B0);
  }
  return result;
}

unint64_t sub_246A4C3B0()
{
  unint64_t result;

  result = qword_2576176B8;
  if (!qword_2576176B8)
  {
    result = MEMORY[0x249563B60](&unk_246A79514, &type metadata for AttachmentModel.MapAttachmentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576176B8);
  }
  return result;
}

unint64_t sub_246A4C3F0()
{
  unint64_t result;

  result = qword_2576176C0;
  if (!qword_2576176C0)
  {
    result = MEMORY[0x249563B60](&unk_246A79434, &type metadata for AttachmentModel.PhotoAttachmentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576176C0);
  }
  return result;
}

unint64_t sub_246A4C430()
{
  unint64_t result;

  result = qword_2576176C8;
  if (!qword_2576176C8)
  {
    result = MEMORY[0x249563B60](&unk_246A7945C, &type metadata for AttachmentModel.PhotoAttachmentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576176C8);
  }
  return result;
}

unint64_t sub_246A4C470()
{
  unint64_t result;

  result = qword_2576176D0;
  if (!qword_2576176D0)
  {
    result = MEMORY[0x249563B60](&unk_246A7937C, &type metadata for AttachmentModel.VideoAttachmentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576176D0);
  }
  return result;
}

unint64_t sub_246A4C4B0()
{
  unint64_t result;

  result = qword_2576176D8;
  if (!qword_2576176D8)
  {
    result = MEMORY[0x249563B60](&unk_246A793A4, &type metadata for AttachmentModel.VideoAttachmentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576176D8);
  }
  return result;
}

unint64_t sub_246A4C4F0()
{
  unint64_t result;

  result = qword_2576176E0;
  if (!qword_2576176E0)
  {
    result = MEMORY[0x249563B60](&unk_246A7965C, &type metadata for AttachmentModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576176E0);
  }
  return result;
}

unint64_t sub_246A4C530()
{
  unint64_t result;

  result = qword_2576176E8;
  if (!qword_2576176E8)
  {
    result = MEMORY[0x249563B60](&unk_246A79684, &type metadata for AttachmentModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576176E8);
  }
  return result;
}

uint64_t sub_246A4C570(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2)
    goto LABEL_10;
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0)
    return swift_unknownObjectRetain();
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_246A4C5E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_2_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return sub_246A78310();
}

uint64_t OUTLINED_FUNCTION_4@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_6_1@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return sub_246A78388();
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return sub_246A783D0();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 - 152);
  *(_QWORD *)v0 = *(_QWORD *)(v1 - 160);
  *(_BYTE *)(v0 + 8) = v2;
  return v0;
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  return sub_246A78364();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return 0;
}

void OUTLINED_FUNCTION_14_1(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 168) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_15_1@<X0>(uint64_t a1@<X8>)
{
  char v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 - 256);
  *(_QWORD *)v3 = a1;
  *(_BYTE *)(v3 + 8) = v1;
  return v3;
}

uint64_t OUTLINED_FUNCTION_19()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0);
}

uint64_t OUTLINED_FUNCTION_21()
{
  return sub_246A78490();
}

void OUTLINED_FUNCTION_22_0()
{
  JUMPOUT(0x249563BFCLL);
}

void OUTLINED_FUNCTION_24_0(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);
  uint64_t v2;

  sub_246A4B53C(a1, v2, v1);
}

void sub_246A4C794(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = sub_246A77F5C();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  sub_246A4C8F0((uint64_t)v4);
}

uint64_t sub_246A4C814()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_15_0();
  v5 = v4 - v3;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_10_1(v5, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16));
  sub_246A77F2C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v5, v0);
}

void sub_246A4C89C(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC18SiriMessagesCommon17SecurityScopedURL_wrappedValue;
  OUTLINED_FUNCTION_1_2();
  v4 = OUTLINED_FUNCTION_2_2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
  OUTLINED_FUNCTION_6_2();
}

void sub_246A4C8F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  sub_246A4C814();
  v3 = v1 + OBJC_IVAR____TtC18SiriMessagesCommon17SecurityScopedURL_wrappedValue;
  OUTLINED_FUNCTION_1_2();
  v4 = OUTLINED_FUNCTION_2_2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  swift_endAccess();
  OUTLINED_FUNCTION_6_2();
}

void (*sub_246A4C950(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v3 = malloc(0x80uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = OUTLINED_FUNCTION_2_2();
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC18SiriMessagesCommon17SecurityScopedURL_wrappedValue;
  v3[13] = v7;
  v3[14] = v8;
  OUTLINED_FUNCTION_1_2();
  v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v3[15] = v9;
  OUTLINED_FUNCTION_10_1((uint64_t)v7, v9);
  return sub_246A4C9FC;
}

void sub_246A4C9FC(uint64_t *a1, char a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v4 = *(void **)(v2 + 96);
    v3 = *(void **)(v2 + 104);
    v5 = *(_QWORD *)(v2 + 80);
    v6 = *(_QWORD *)(v2 + 88);
    v7 = *(_QWORD *)(v2 + 72) + *(_QWORD *)(v2 + 112);
    OUTLINED_FUNCTION_7_1((uint64_t)v4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 120));
    sub_246A4C814();
    OUTLINED_FUNCTION_1_2();
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 40))(v7, v4, v5);
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v6 + 8))(v3, v5);
  }
  else
  {
    v3 = *(void **)(v2 + 104);
    v8 = *(_QWORD *)(v2 + 88);
    v4 = *(void **)(v2 + 96);
    v9 = *(_QWORD *)(v2 + 72) + *(_QWORD *)(v2 + 112);
    sub_246A4C814();
    OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_7_1(v9, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 40));
    swift_endAccess();
  }
  free(v3);
  free(v4);
  free((void *)v2);
}

void SecurityScopedURL.__allocating_init(wrappedValue:)()
{
  uint64_t v0;

  swift_allocObject();
  v0 = OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_1(v0);
  OUTLINED_FUNCTION_1();
}

void SecurityScopedURL.init(wrappedValue:)()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_1(v0);
  OUTLINED_FUNCTION_1();
}

uint64_t sub_246A4CB6C(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6B72616D6B6F6F62 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_246A78400();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_246A4CBF0()
{
  sub_246A78484();
  sub_246A78490();
  return sub_246A7849C();
}

uint64_t sub_246A4CC30()
{
  return 0x6B72616D6B6F6F62;
}

uint64_t sub_246A4CC4C()
{
  sub_246A78484();
  sub_246A78490();
  return sub_246A7849C();
}

uint64_t sub_246A4CC8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A4CB6C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_246A4CCB4()
{
  sub_246A4CF7C();
  return sub_246A784D8();
}

uint64_t sub_246A4CCDC()
{
  sub_246A4CF7C();
  return sub_246A784E4();
}

uint64_t SecurityScopedURL.__allocating_init(from:)(_QWORD *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  SecurityScopedURL.init(from:)(a1);
  return v2;
}

uint64_t SecurityScopedURL.init(from:)(_QWORD *a1)
{
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
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576176F8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_15_0();
  v15 = v6 - v5;
  sub_246A77F5C();
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_15_0();
  v10 = v9 - v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617700);
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_15_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A4CF7C();
  sub_246A784B4();
  if (v19)
  {
    v14 = v16;
    type metadata accessor for SecurityScopedURL();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v12 = v1;
    sub_246A4CFF0();
    sub_246A78364();
    __swift_storeEnumTagSinglePayload(v15, 1, 1, v1);
    sub_246A77F20();
    sub_246A4D02C(v17, v18);
    sub_246A4D070(v15);
    OUTLINED_FUNCTION_4_0();
    v14 = v16;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v16 + OBJC_IVAR____TtC18SiriMessagesCommon17SecurityScopedURL_wrappedValue, v10, v12);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v14;
}

unint64_t sub_246A4CF7C()
{
  unint64_t result;

  result = qword_257617708;
  if (!qword_257617708)
  {
    result = MEMORY[0x249563B60](&unk_246A79A3C, &type metadata for SecurityScopedURL.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617708);
  }
  return result;
}

uint64_t type metadata accessor for SecurityScopedURL()
{
  uint64_t result;

  result = qword_257617750;
  if (!qword_257617750)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_246A4CFF0()
{
  unint64_t result;

  result = qword_257617710;
  if (!qword_257617710)
  {
    result = MEMORY[0x249563B60](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_257617710);
  }
  return result;
}

uint64_t sub_246A4D02C(uint64_t a1, unint64_t a2)
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

uint64_t sub_246A4D070(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576176F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_246A4D0B0(_QWORD *a1)
{
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576176F8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_15_0();
  v7 = v6 - v5;
  v8 = sub_246A77F5C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_15_0();
  v12 = v11 - v10;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617718);
  v23 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_15_0();
  v15 = v14 - v13;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A4CF7C();
  sub_246A784CC();
  v16 = v2 + OBJC_IVAR____TtC18SiriMessagesCommon17SecurityScopedURL_wrappedValue;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v12, v16, v8);
  __swift_storeEnumTagSinglePayload(v7, 1, 1, v8);
  v17 = sub_246A77EFC();
  if (v22)
  {
    sub_246A4D070(v7);
    OUTLINED_FUNCTION_5_2();
  }
  else
  {
    v20 = v17;
    v21 = v18;
    sub_246A4D070(v7);
    OUTLINED_FUNCTION_5_2();
    sub_246A4D2BC();
    sub_246A783D0();
    sub_246A4D02C(v20, v21);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8))(v15, v24);
}

unint64_t sub_246A4D2BC()
{
  unint64_t result;

  result = qword_257617720;
  if (!qword_257617720)
  {
    result = MEMORY[0x249563B60](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_257617720);
  }
  return result;
}

uint64_t SecurityScopedURL.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);

  v1 = v0;
  v2 = OUTLINED_FUNCTION_2_2();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_15_0();
  v6 = v5 - v4;
  v7 = v1 + OBJC_IVAR____TtC18SiriMessagesCommon17SecurityScopedURL_wrappedValue;
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v6, v7, v2);
  sub_246A77F2C();
  v8 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v8(v6, v2);
  v8(v7, v2);
  return v1;
}

uint64_t SecurityScopedURL.__deallocating_deinit()
{
  SecurityScopedURL.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_246A4D3D0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = SecurityScopedURL.__allocating_init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_246A4D3F8(_QWORD *a1)
{
  return sub_246A4D0B0(a1);
}

void sub_246A4D418(uint64_t a1@<X8>)
{
  sub_246A4C89C(a1);
}

uint64_t sub_246A4D43C()
{
  return type metadata accessor for SecurityScopedURL();
}

uint64_t sub_246A4D444()
{
  uint64_t result;
  unint64_t v1;

  result = sub_246A77F5C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SecurityScopedURL()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SecurityScopedURL.wrappedValue.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t dispatch thunk of SecurityScopedURL.wrappedValue.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of SecurityScopedURL.wrappedValue.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of SecurityScopedURL.__allocating_init(wrappedValue:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of SecurityScopedURL.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of SecurityScopedURL.encode(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t storeEnumTagSinglePayload for SecurityScopedURL.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_246A4D55C + 4 * byte_246A798F0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_246A4D57C + 4 * byte_246A798F5[v4]))();
}

_BYTE *sub_246A4D55C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_246A4D57C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_246A4D584(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_246A4D58C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_246A4D594(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_246A4D59C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SecurityScopedURL.CodingKeys()
{
  return &type metadata for SecurityScopedURL.CodingKeys;
}

unint64_t sub_246A4D5BC()
{
  unint64_t result;

  result = qword_257617800;
  if (!qword_257617800)
  {
    result = MEMORY[0x249563B60](&unk_246A79A14, &type metadata for SecurityScopedURL.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617800);
  }
  return result;
}

unint64_t sub_246A4D5FC()
{
  unint64_t result;

  result = qword_257617808;
  if (!qword_257617808)
  {
    result = MEMORY[0x249563B60](&unk_246A79984, &type metadata for SecurityScopedURL.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617808);
  }
  return result;
}

unint64_t sub_246A4D63C()
{
  unint64_t result;

  result = qword_257617810;
  if (!qword_257617810)
  {
    result = MEMORY[0x249563B60](&unk_246A799AC, &type metadata for SecurityScopedURL.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617810);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return sub_246A77F5C();
}

uint64_t OUTLINED_FUNCTION_3_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 32))(v2, v1, a1);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 72) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_7_1@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_10_1@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v3, v2);
}

uint64_t static SAAppInfo.isFirstPartyApp(appId:)()
{
  OUTLINED_FUNCTION_7_2();
  return sub_246A78190();
}

id SAAppInfo.isFirstParty.getter()
{
  void *v0;
  id result;
  uint64_t v2;
  char v3;

  result = objc_msgSend(v0, sel_appIdentifyingInfo);
  if (result)
  {
    result = (id)sub_246A4DC90(result);
    if (v2)
    {
      OUTLINED_FUNCTION_7_2();
      v3 = sub_246A78190();
      OUTLINED_FUNCTION_1_3();
      return (id)(v3 & 1);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

_QWORD *SAAppInfo.getNameForDisplay(locale:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
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
  _QWORD v18[2];

  v0 = sub_246A77FBC();
  v2 = v1;
  v18[0] = v0;
  v18[1] = v1;
  sub_246A4DCFC();
  v3 = v18;
  v4 = sub_246A78244();
  v6 = v5;
  v7 = swift_bridgeObjectRelease();
  v8 = OUTLINED_FUNCTION_6_3(v7, (SEL *)&selRef_displayAppName);
  if (v9)
  {
    v3 = (_QWORD *)v8;
  }
  else
  {
    v10 = OUTLINED_FUNCTION_5_3(v8, (SEL *)&selRef_displayAppNameMap);
    if (v10)
    {
      OUTLINED_FUNCTION_4_1();
      OUTLINED_FUNCTION_2_3();
      OUTLINED_FUNCTION_3_2();
      v10 = OUTLINED_FUNCTION_1_3();
      if (v2)
        goto LABEL_8;
    }
    v11 = OUTLINED_FUNCTION_6_3(v10, (SEL *)&selRef_appName);
    if (v12)
    {
      v3 = (_QWORD *)v11;
    }
    else
    {
      v14 = OUTLINED_FUNCTION_5_3(v11, (SEL *)&selRef_appNameMap);
      if (!v14
        || (OUTLINED_FUNCTION_4_1(), OUTLINED_FUNCTION_2_3(),
                                     OUTLINED_FUNCTION_3_2(),
                                     v14 = OUTLINED_FUNCTION_1_3(),
                                     !v2))
      {
        v15 = OUTLINED_FUNCTION_6_3(v14, (SEL *)&selRef_spotlightName);
        if (v16)
        {
          OUTLINED_FUNCTION_0_2();
          goto LABEL_8;
        }
        v17 = OUTLINED_FUNCTION_5_3(v15, (SEL *)&selRef_spotlightNameMap);
        if (!v17)
        {
          swift_bridgeObjectRelease_n();
          OUTLINED_FUNCTION_1_3();
          return 0;
        }
        sub_246A4D908(v4, v6, v17);
        OUTLINED_FUNCTION_0_2();
      }
    }
    swift_bridgeObjectRelease();
  }
LABEL_8:
  OUTLINED_FUNCTION_1_3();
  return v3;
}

uint64_t sub_246A4D908(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  char v5;
  uint64_t v6;

  if (!*(_QWORD *)(a3 + 16))
    return 0;
  v4 = sub_246A4DA58(a1, a2);
  if ((v5 & 1) == 0)
    return 0;
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 56) + 16 * v4);
  swift_bridgeObjectRetain();
  return v6;
}

double sub_246A4D95C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v5;
  char v6;
  double result;

  if (*(_QWORD *)(a2 + 16) && (v5 = sub_246A4DABC(a1), (v6 & 1) != 0))
  {
    sub_246A4C5E8(*(_QWORD *)(a2 + 56) + 32 * v5, (uint64_t)a3);
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

id SAAppInfo.init(appIdentifier:)(uint64_t a1, uint64_t a2)
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  if (a2)
  {
    v5 = objc_allocWithZone(MEMORY[0x24BE817D8]);
    v6 = v4;
    v7 = objc_msgSend(v5, sel_init);
    sub_246A4DDF0(a1, a2, v7);
    objc_msgSend(v6, sel_setAppIdentifyingInfo_, v7);

  }
  return v4;
}

unint64_t sub_246A4DA58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_246A78484();
  sub_246A7816C();
  v4 = sub_246A7849C();
  return sub_246A4DAEC(a1, a2, v4);
}

unint64_t sub_246A4DABC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_246A7825C();
  return sub_246A4DBCC(a1, v2);
}

unint64_t sub_246A4DAEC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_246A78400() & 1) == 0)
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
      while (!v14 && (sub_246A78400() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_246A4DBCC(uint64_t a1, uint64_t a2)
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
      sub_246A4DE40(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x249563500](v9, a1);
      sub_246A4DE7C((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_246A4DC90(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_bundleId);

  if (!v2)
    return 0;
  v3 = sub_246A7813C();

  return v3;
}

unint64_t sub_246A4DCFC()
{
  unint64_t result;

  result = qword_257617818;
  if (!qword_257617818)
  {
    result = MEMORY[0x249563B60](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_257617818);
  }
  return result;
}

uint64_t sub_246A4DD38(void *a1, SEL *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, *a2);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = sub_246A7813C();

  return v4;
}

uint64_t sub_246A4DD94(void *a1, SEL *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, *a2);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = sub_246A7810C();

  return v4;
}

void sub_246A4DDF0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_246A78130();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setBundleId_, v4);

}

uint64_t sub_246A4DE40(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_246A4DE7C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return sub_246A4D908(v1, v0, v2);
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_5_3(uint64_t a1, SEL *a2)
{
  void *v2;

  return sub_246A4DD94(v2, a2);
}

uint64_t OUTLINED_FUNCTION_6_3(uint64_t a1, SEL *a2)
{
  void *v2;

  return sub_246A4DD38(v2, a2);
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return 0x6C7070612E6D6F63;
}

uint64_t sub_246A4DF24()
{
  return swift_deallocClassInstance();
}

id static AnnounceMessageUtils.bloopSoundCommand()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t ObjCClassFromMetadata;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v0 = sub_246A77FA4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AnnounceMessageUtils.Dummy();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v5 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81960]), sel_init);
  sub_246A77F98();
  v7 = sub_246A77F8C();
  v9 = v8;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_246A4E0DC(v7, v9, v6);

  v10 = sub_246A4E12C(0x3367734D746E6553, 0xE900000000000070, 7758199, 0xE300000000000000, v5);
  if (v11)
  {
    v12 = (void *)sub_246A78130();
    v10 = swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  OUTLINED_FUNCTION_0_3(v10, sel_setItemURL_);

  sub_246A4E1E4();
  v13 = (void *)sub_246A78214();
  OUTLINED_FUNCTION_0_3((uint64_t)v13, sel_setVolume_);

  return v6;
}

uint64_t type metadata accessor for AnnounceMessageUtils.Dummy()
{
  return objc_opt_self();
}

void sub_246A4E0DC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_246A78130();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setAceId_, v4);

}

uint64_t sub_246A4E12C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;

  v6 = (void *)sub_246A78130();
  swift_bridgeObjectRelease();
  v7 = (void *)sub_246A78130();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(a5, sel_pathForResource_ofType_, v6, v7);

  if (!v8)
    return 0;
  v9 = sub_246A7813C();

  return v9;
}

unint64_t sub_246A4E1E4()
{
  unint64_t result;

  result = qword_257617820;
  if (!qword_257617820)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257617820);
  }
  return result;
}

ValueMetadata *type metadata accessor for AnnounceMessageUtils()
{
  return &type metadata for AnnounceMessageUtils;
}

id OUTLINED_FUNCTION_0_3(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

uint64_t AutoSendableCarPlayButton.init(shouldAutoSend:autoSendTimeout:delayedActionCancelCommand:handleIntent:speechSynthesisId:isFirstPartyApp:responseMode:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X8>, double a9@<D0>)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (qword_2576171F0 != -1)
    swift_once();
  swift_beginAccess();
  v18 = unk_257617E60;
  *(_QWORD *)(a8 + 48) = qword_257617E58;
  *(_QWORD *)(a8 + 56) = v18;
  v19 = a8 + *(int *)(OUTLINED_FUNCTION_13_1() + 44);
  v20 = sub_246A78094();
  __swift_storeEnumTagSinglePayload(v19, 1, 1, v20);
  *(_BYTE *)a8 = a1 & 1;
  *(double *)(a8 + 8) = a9;
  *(_QWORD *)(a8 + 16) = a2;
  *(_QWORD *)(a8 + 24) = a3;
  *(_QWORD *)(a8 + 32) = a4;
  *(_QWORD *)(a8 + 40) = a5;
  *(_BYTE *)(a8 + 64) = a6 & 1;
  swift_bridgeObjectRetain();
  return sub_246A465F4(a7, v19);
}

void AutoSendableCarPlayButton.delayedActionCancelCommand.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  OUTLINED_FUNCTION_9();
}

void AutoSendableCarPlayButton.handleIntent.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  OUTLINED_FUNCTION_9();
}

uint64_t AutoSendableCarPlayButton.shouldAutoSend.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t AutoSendableCarPlayButton.shouldAutoSend.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*AutoSendableCarPlayButton.shouldAutoSend.modify())()
{
  return nullsub_1;
}

double AutoSendableCarPlayButton.autoSendTimeout.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

void AutoSendableCarPlayButton.autoSendTimeout.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 8) = a1;
}

uint64_t (*AutoSendableCarPlayButton.autoSendTimeout.modify())()
{
  return nullsub_1;
}

void AutoSendableCarPlayButton.delayedActionCancelCommand.getter()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 16);
  OUTLINED_FUNCTION_9();
}

void sub_246A4E3F4(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  AutoSendableCarPlayButton.delayedActionCancelCommand.setter((uint64_t)v1);
}

void AutoSendableCarPlayButton.delayedActionCancelCommand.modify(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + 16);
  *a1 = v2;
  a1[1] = v1;
  v3 = v2;
  OUTLINED_FUNCTION_9();
}

void AutoSendableCarPlayButton.handleIntent.getter()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 24);
  OUTLINED_FUNCTION_9();
}

void sub_246A4E474(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  AutoSendableCarPlayButton.handleIntent.setter((uint64_t)v1);
}

void AutoSendableCarPlayButton.handleIntent.modify(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + 24);
  *a1 = v2;
  a1[1] = v1;
  v3 = v2;
  OUTLINED_FUNCTION_9();
}

void AutoSendableCarPlayButton.speechSynthesisId.getter()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_9();
}

void AutoSendableCarPlayButton.speechSynthesisId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t (*AutoSendableCarPlayButton.speechSynthesisId.modify())()
{
  return nullsub_1;
}

void AutoSendableCarPlayButton.changeLabelText.getter()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_9();
}

void AutoSendableCarPlayButton.changeLabelText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t (*AutoSendableCarPlayButton.changeLabelText.modify())()
{
  return nullsub_1;
}

uint64_t AutoSendableCarPlayButton.isFirstPartyApp.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 64);
}

uint64_t AutoSendableCarPlayButton.isFirstPartyApp.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 64) = result;
  return result;
}

uint64_t (*AutoSendableCarPlayButton.isFirstPartyApp.modify())()
{
  return nullsub_1;
}

uint64_t AutoSendableCarPlayButton.responseMode.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_13_1() + 44);
  return sub_246A4667C(v3, a1);
}

uint64_t AutoSendableCarPlayButton.responseMode.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_13_1() + 44);
  return sub_246A465F4(a1, v3);
}

uint64_t (*AutoSendableCarPlayButton.responseMode.modify())()
{
  OUTLINED_FUNCTION_13_1();
  return nullsub_1;
}

uint64_t sub_246A4E638(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  char v11;

  v3 = a1 == 0x7541646C756F6873 && a2 == 0xEE00646E65536F74;
  if (v3 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x646E65536F747561 && a2 == 0xEF74756F656D6954;
    if (v6 || (sub_246A78400() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD00000000000001ALL && a2 == 0x8000000246A7EBC0 || (sub_246A78400() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v7 = a1 == 0x6E49656C646E6168 && a2 == 0xEC000000746E6574;
      if (v7 || (sub_246A78400() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0xD000000000000011 && a2 == 0x8000000246A7EBE0 || (sub_246A78400() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        v8 = a1 == 0x614C65676E616863 && a2 == 0xEF747865546C6562;
        if (v8 || (sub_246A78400() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          v9 = a1 == 0x5074737269467369 && a2 == 0xEF70704179747261;
          if (v9 || (sub_246A78400() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else if (a1 == 0x65736E6F70736572 && a2 == 0xEC00000065646F4DLL)
          {
            swift_bridgeObjectRelease();
            return 7;
          }
          else
          {
            v11 = sub_246A78400();
            swift_bridgeObjectRelease();
            if ((v11 & 1) != 0)
              return 7;
            else
              return 8;
          }
        }
      }
    }
  }
}

uint64_t sub_246A4E9B8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_246A4E9F4 + 4 * byte_246A79AB0[a1]))(0xD00000000000001ALL, 0x8000000246A7EBC0);
}

uint64_t sub_246A4E9F4()
{
  return 0x7541646C756F6873;
}

uint64_t sub_246A4EA18()
{
  return 0x646E65536F747561;
}

uint64_t sub_246A4EA3C()
{
  return 0x6E49656C646E6168;
}

unint64_t sub_246A4EA5C()
{
  return 0xD000000000000011;
}

uint64_t sub_246A4EA78()
{
  return 0x614C65676E616863;
}

uint64_t sub_246A4EA9C()
{
  return 0x5074737269467369;
}

uint64_t sub_246A4EAC0()
{
  return 0x65736E6F70736572;
}

uint64_t sub_246A4EAE0()
{
  unsigned __int8 *v0;

  return sub_246A4E9B8(*v0);
}

uint64_t sub_246A4EAE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A4E638(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A4EB0C()
{
  sub_246A4F1AC();
  return sub_246A784D8();
}

uint64_t sub_246A4EB34()
{
  sub_246A4F1AC();
  return sub_246A784E4();
}

uint64_t AutoSendableCarPlayButton.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576178C0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_12();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A4F1AC();
  sub_246A784CC();
  OUTLINED_FUNCTION_6();
  if (!v1)
  {
    sub_246A783C4();
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_7(&qword_257617238);
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_7(&qword_257617248);
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_15(4);
    sub_246A78394();
    OUTLINED_FUNCTION_15(5);
    sub_246A783AC();
    OUTLINED_FUNCTION_6();
    type metadata accessor for AutoSendableCarPlayButton();
    sub_246A78094();
    sub_246A46910(&qword_257617250, (void (*)(uint64_t))MEMORY[0x24BEA8AE8]);
    sub_246A783A0();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
}

uint64_t AutoSendableCarPlayButton.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  char v28;
  uint64_t v29;

  v22 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617218);
  MEMORY[0x24BDAC7A8](v5);
  v23 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576178D0);
  v24 = *(_QWORD *)(v7 - 8);
  v25 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v8 = type metadata accessor for AutoSendableCarPlayButton();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_12();
  *(_OWORD *)(v3 + 16) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  if (qword_2576171F0 != -1)
    swift_once();
  swift_beginAccess();
  v9 = unk_257617E60;
  *(_QWORD *)(v3 + 48) = qword_257617E58;
  *(_QWORD *)(v3 + 56) = v9;
  v10 = v3 + *(int *)(v8 + 44);
  v11 = sub_246A78094();
  v26 = v10;
  __swift_storeEnumTagSinglePayload(v10, 1, 1, v11);
  v12 = a1;
  v13 = a1[3];
  v27 = v12;
  __swift_project_boxed_opaque_existential_1(v12, v13);
  sub_246A4F1AC();
  swift_bridgeObjectRetain();
  sub_246A784B4();
  if (v2)
  {
    v19 = v26;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_246A46788(v19);
  }
  else
  {
    LOBYTE(v29) = 0;
    *(_BYTE *)v3 = sub_246A7834C() & 1;
    OUTLINED_FUNCTION_0_0(1);
    sub_246A78358();
    *(_QWORD *)(v3 + 8) = v14;
    OUTLINED_FUNCTION_14();
    v28 = 2;
    OUTLINED_FUNCTION_7(&qword_257617260);
    OUTLINED_FUNCTION_1_0();
    *(_QWORD *)(v3 + 16) = v29;
    OUTLINED_FUNCTION_14();
    v28 = 3;
    OUTLINED_FUNCTION_7(&qword_257617268);
    OUTLINED_FUNCTION_1_0();
    *(_QWORD *)(v3 + 24) = v29;
    OUTLINED_FUNCTION_0_0(4);
    *(_QWORD *)(v3 + 32) = sub_246A78328();
    *(_QWORD *)(v3 + 40) = v15;
    OUTLINED_FUNCTION_0_0(5);
    v16 = sub_246A78340();
    v18 = v17;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v3 + 48) = v16;
    *(_QWORD *)(v3 + 56) = v18;
    OUTLINED_FUNCTION_0_0(6);
    *(_BYTE *)(v3 + 64) = sub_246A7834C() & 1;
    LOBYTE(v29) = 7;
    sub_246A46910(&qword_257617270, (void (*)(uint64_t))MEMORY[0x24BEA8AE8]);
    v20 = (uint64_t)v23;
    sub_246A78334();
    OUTLINED_FUNCTION_5();
    sub_246A465F4(v20, v26);
    sub_246A4F1E8(v3, v22);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
    return sub_246A4F22C(v3);
  }
}

uint64_t sub_246A4F14C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return AutoSendableCarPlayButton.init(from:)(a1, a2);
}

uint64_t sub_246A4F160(_QWORD *a1)
{
  return AutoSendableCarPlayButton.encode(to:)(a1);
}

uint64_t type metadata accessor for AutoSendableCarPlayButton()
{
  uint64_t result;

  result = qword_257617948;
  if (!qword_257617948)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_246A4F1AC()
{
  unint64_t result;

  result = qword_2576178C8;
  if (!qword_2576178C8)
  {
    result = MEMORY[0x249563B60](&unk_246A79CE4, &type metadata for AutoSendableCarPlayButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576178C8);
  }
  return result;
}

uint64_t sub_246A4F1E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AutoSendableCarPlayButton();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246A4F22C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AutoSendableCarPlayButton();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_246A4F268(uint64_t a1)
{
  uint64_t v2;

  sub_246A46910(&qword_2576178D8, (void (*)(uint64_t))type metadata accessor for AutoSendableCarPlayButton);
  *(_QWORD *)(a1 + 16) = v2;
}

void sub_246A4F2A4()
{
  sub_246A46910(&qword_2576178E0, (void (*)(uint64_t))type metadata accessor for AutoSendableCarPlayButton);
}

void sub_246A4F2D0()
{
  sub_246A46910(&qword_2576178E8, (void (*)(uint64_t))type metadata accessor for AutoSendableCarPlayButton);
}

void sub_246A4F2FC(_QWORD *a1@<X8>)
{
  uint64_t v2;

  AutoSendableCarPlayButton.delayedActionCancelCommand.getter();
  *a1 = v2;
  OUTLINED_FUNCTION_9();
}

void sub_246A4F324(_QWORD *a1@<X8>)
{
  uint64_t v2;

  AutoSendableCarPlayButton.handleIntent.getter();
  *a1 = v2;
  OUTLINED_FUNCTION_9();
}

uint64_t getEnumTagSinglePayload for AutoSendableCarPlayButton()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246A4F358(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 56);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617218);
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 44), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for AutoSendableCarPlayButton()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_246A4F3DC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(a1 + 56) = (a2 - 1);
    OUTLINED_FUNCTION_1();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617218);
    __swift_storeEnumTagSinglePayload(a1 + *(int *)(a4 + 44), a2, a2, v7);
  }
}

void sub_246A4F444()
{
  unint64_t v0;

  sub_246A47180();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t storeEnumTagSinglePayload for AutoSendableCarPlayButton.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A4F534 + 4 * byte_246A79ABD[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_246A4F568 + 4 * byte_246A79AB8[v4]))();
}

uint64_t sub_246A4F568(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A4F570(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A4F578);
  return result;
}

uint64_t sub_246A4F584(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A4F58CLL);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_246A4F590(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A4F598(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AutoSendableCarPlayButton.CodingKeys()
{
  return &type metadata for AutoSendableCarPlayButton.CodingKeys;
}

unint64_t sub_246A4F5B8()
{
  unint64_t result;

  result = qword_257617998;
  if (!qword_257617998)
  {
    result = MEMORY[0x249563B60](&unk_246A79CBC, &type metadata for AutoSendableCarPlayButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617998);
  }
  return result;
}

unint64_t sub_246A4F5F8()
{
  unint64_t result;

  result = qword_2576179A0;
  if (!qword_2576179A0)
  {
    result = MEMORY[0x249563B60](&unk_246A79C2C, &type metadata for AutoSendableCarPlayButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576179A0);
  }
  return result;
}

unint64_t sub_246A4F638()
{
  unint64_t result;

  result = qword_2576179A8;
  if (!qword_2576179A8)
  {
    result = MEMORY[0x249563B60](&unk_246A79C54, &type metadata for AutoSendableCarPlayButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576179A8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return type metadata accessor for AutoSendableCarPlayButton();
}

void MapAttachment.init(url:isDraft:)(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6;

  v6 = OUTLINED_FUNCTION_2_2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a3, a1, v6);
  *(_BYTE *)(a3 + *(int *)(OUTLINED_FUNCTION_4_2() + 20)) = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t type metadata accessor for MapAttachment()
{
  uint64_t result;

  result = qword_257617A30;
  if (!qword_257617A30)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t MapAttachment.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_2_2();
  return OUTLINED_FUNCTION_3_3(a1, v1, v3, *(uint64_t (**)(void))(*(_QWORD *)(v3 - 8) + 16));
}

uint64_t MapAttachment.url.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_2_2();
  return OUTLINED_FUNCTION_3_3(v1, a1, v3, *(uint64_t (**)(void))(*(_QWORD *)(v3 - 8) + 40));
}

uint64_t (*MapAttachment.url.modify())()
{
  return nullsub_1;
}

uint64_t MapAttachment.isDraft.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(OUTLINED_FUNCTION_4_2() + 20));
}

uint64_t MapAttachment.isDraft.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = OUTLINED_FUNCTION_4_2();
  *(_BYTE *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*MapAttachment.isDraft.modify())()
{
  OUTLINED_FUNCTION_4_2();
  return nullsub_1;
}

BOOL sub_246A4F7D8(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_246A4F7E8()
{
  return sub_246A78490();
}

uint64_t sub_246A4F80C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v7;

  v3 = a1 == 7107189 && a2 == 0xE300000000000000;
  if (v3 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74666172447369 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_246A78400();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_246A4F8E0()
{
  return 2;
}

uint64_t sub_246A4F8E8()
{
  sub_246A78484();
  sub_246A78490();
  return sub_246A7849C();
}

uint64_t sub_246A4F92C(char a1)
{
  if ((a1 & 1) != 0)
    return 0x74666172447369;
  else
    return 7107189;
}

BOOL sub_246A4F95C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_246A4F7D8(*a1, *a2);
}

uint64_t sub_246A4F968()
{
  return sub_246A4F8E8();
}

uint64_t sub_246A4F970()
{
  return sub_246A4F7E8();
}

uint64_t sub_246A4F978()
{
  char *v0;

  return sub_246A4F92C(*v0);
}

uint64_t sub_246A4F980@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A4F80C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A4F9A4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_246A4F8E0();
  *a1 = result;
  return result;
}

uint64_t sub_246A4F9C8()
{
  sub_246A4FB60();
  return sub_246A784D8();
}

uint64_t sub_246A4F9F0()
{
  sub_246A4FB60();
  return sub_246A784E4();
}

uint64_t MapAttachment.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576179B0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_15_0();
  v7 = v6 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A4FB60();
  sub_246A784CC();
  sub_246A77F5C();
  sub_246A4FEA4(&qword_2576179C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAE0]);
  sub_246A783D0();
  if (!v1)
  {
    type metadata accessor for MapAttachment();
    sub_246A783B8();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_246A4FB60()
{
  unint64_t result;

  result = qword_2576179B8;
  if (!qword_2576179B8)
  {
    result = MEMORY[0x249563B60](&unk_246A79EE4, &type metadata for MapAttachment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576179B8);
  }
  return result;
}

uint64_t MapAttachment.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v15 = sub_246A77F5C();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_15_0();
  v13 = v5 - v4;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576179C8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_15_0();
  v6 = type metadata accessor for MapAttachment();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_15_0();
  v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A4FB60();
  sub_246A784B4();
  if (v2)
    return OUTLINED_FUNCTION_6_4();
  sub_246A4FEA4(&qword_2576179D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB10]);
  sub_246A78364();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v9, v13, v15);
  v10 = sub_246A7834C();
  OUTLINED_FUNCTION_0_4();
  *(_BYTE *)(v9 + *(int *)(v6 + 20)) = v10 & 1;
  sub_246A4FDC0(v9, a2);
  OUTLINED_FUNCTION_6_4();
  return sub_246A4FE04(v9);
}

uint64_t sub_246A4FDC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MapAttachment();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246A4FE04(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MapAttachment();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_246A4FE48(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 16) = sub_246A4FEA4(&qword_2576175B0, (uint64_t (*)(uint64_t))type metadata accessor for MapAttachment, (uint64_t)&protocol conformance descriptor for MapAttachment);
  result = sub_246A4FEA4(&qword_257617558, (uint64_t (*)(uint64_t))type metadata accessor for MapAttachment, (uint64_t)&protocol conformance descriptor for MapAttachment);
  *(_QWORD *)(a1 + 24) = result;
  return result;
}

uint64_t sub_246A4FEA4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x249563B60](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_246A4FEE4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return MapAttachment.init(from:)(a1, a2);
}

uint64_t sub_246A4FEF8(_QWORD *a1)
{
  return MapAttachment.encode(to:)(a1);
}

_QWORD *initializeBufferWithCopyOfBuffer for LinkAttachment(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_246A77F5C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for LinkAttachment(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_246A77F5C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for LinkAttachment(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_246A77F5C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for LinkAttachment(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_246A77F5C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for LinkAttachment(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_246A77F5C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for LinkAttachment(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_246A77F5C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for MapAttachment()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246A50144(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unsigned int v8;

  v6 = OUTLINED_FUNCTION_2_2();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v8 >= 2)
    return ((v8 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for MapAttachment()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_246A501D4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;

  v8 = OUTLINED_FUNCTION_2_2();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
    OUTLINED_FUNCTION_1();
  }
}

uint64_t sub_246A5023C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_246A77F5C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MapAttachment.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFF)
  {
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
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = v6 - 2;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for MapAttachment.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A50380 + 4 * byte_246A79D45[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_246A503B4 + 4 * byte_246A79D40[v4]))();
}

uint64_t sub_246A503B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A503BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A503C4);
  return result;
}

uint64_t sub_246A503D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A503D8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_246A503DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A503E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_246A503F0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MapAttachment.CodingKeys()
{
  return &type metadata for MapAttachment.CodingKeys;
}

unint64_t sub_246A50410()
{
  unint64_t result;

  result = qword_257617A68;
  if (!qword_257617A68)
  {
    result = MEMORY[0x249563B60](&unk_246A79EBC, &type metadata for MapAttachment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617A68);
  }
  return result;
}

unint64_t sub_246A50450()
{
  unint64_t result;

  result = qword_257617A70;
  if (!qword_257617A70)
  {
    result = MEMORY[0x249563B60](&unk_246A79E2C, &type metadata for MapAttachment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617A70);
  }
  return result;
}

unint64_t sub_246A50490()
{
  unint64_t result;

  result = qword_257617A78;
  if (!qword_257617A78)
  {
    result = MEMORY[0x249563B60](&unk_246A79E54, &type metadata for MapAttachment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617A78);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t OUTLINED_FUNCTION_3_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return type metadata accessor for MapAttachment();
}

uint64_t OUTLINED_FUNCTION_6_4()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0);
}

SiriMessagesCommon::UnreadMessagesCarPlayButton __swiftcall UnreadMessagesCarPlayButton.init(text:)(Swift::String text)
{
  uint64_t *v1;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  SiriMessagesCommon::UnreadMessagesCarPlayButton result;

  object = text._object;
  countAndFlagsBits = text._countAndFlagsBits;
  v4 = v1;
  if (qword_2576171F0 != -1)
    swift_once();
  swift_beginAccess();
  v6 = qword_257617E98;
  v5 = qword_257617EA0;
  *v4 = countAndFlagsBits;
  v4[1] = (uint64_t)object;
  v4[2] = v6;
  v4[3] = v5;
  v7 = swift_bridgeObjectRetain();
  result.unreadMessagesLabelText._object = v10;
  result.unreadMessagesLabelText._countAndFlagsBits = v9;
  result.text._object = v8;
  result.text._countAndFlagsBits = v7;
  return result;
}

uint64_t UnreadMessagesCarPlayButton.text.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  OUTLINED_FUNCTION_5_4();
  return v1;
}

void UnreadMessagesCarPlayButton.text.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t (*UnreadMessagesCarPlayButton.text.modify())()
{
  return nullsub_1;
}

uint64_t UnreadMessagesCarPlayButton.unreadMessagesLabelText.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  OUTLINED_FUNCTION_5_4();
  return v1;
}

void UnreadMessagesCarPlayButton.unreadMessagesLabelText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t (*UnreadMessagesCarPlayButton.unreadMessagesLabelText.modify())()
{
  return nullsub_1;
}

uint64_t sub_246A50644(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 1954047348 && a2 == 0xE400000000000000;
  if (v3 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x8000000246A7F050)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_246A78400();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_246A50718(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000017;
  else
    return 1954047348;
}

uint64_t sub_246A5074C()
{
  char *v0;

  return sub_246A50718(*v0);
}

uint64_t sub_246A50754@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A50644(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A50778()
{
  sub_246A50AAC();
  return sub_246A784D8();
}

uint64_t sub_246A507A0()
{
  sub_246A50AAC();
  return sub_246A784E4();
}

void UnreadMessagesCarPlayButton.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  char v10;
  char v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617A80);
  v9 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v8[1] = *(_QWORD *)(v1 + 24);
  v8[2] = v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A50AAC();
  sub_246A784CC();
  v11 = 0;
  OUTLINED_FUNCTION_3_4();
  if (!v2)
  {
    v10 = 1;
    OUTLINED_FUNCTION_3_4();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v4);
  OUTLINED_FUNCTION_8_1();
}

void UnreadMessagesCarPlayButton.init(from:)(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617A90);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  if (qword_2576171F0 != -1)
    swift_once();
  swift_beginAccess();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A50AAC();
  swift_bridgeObjectRetain();
  sub_246A784B4();
  if (v2)
  {
    OUTLINED_FUNCTION_4_3();
  }
  else
  {
    v6 = OUTLINED_FUNCTION_2_4();
    v8 = v7;
    swift_bridgeObjectRetain();
    v9 = OUTLINED_FUNCTION_2_4();
    v11 = v10;
    v12 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    v13 = v9;
    OUTLINED_FUNCTION_1_4(v12);
    OUTLINED_FUNCTION_5_4();
    swift_bridgeObjectRelease();
    *a2 = v6;
    a2[1] = v8;
    a2[2] = v13;
    a2[3] = v11;
    OUTLINED_FUNCTION_4_3();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_8_1();
}

void sub_246A50A84(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  UnreadMessagesCarPlayButton.init(from:)(a1, a2);
}

void sub_246A50A98(_QWORD *a1)
{
  UnreadMessagesCarPlayButton.encode(to:)(a1);
}

unint64_t sub_246A50AAC()
{
  unint64_t result;

  result = qword_257617A88;
  if (!qword_257617A88)
  {
    result = MEMORY[0x249563B60](&unk_246A7A0B0, &type metadata for UnreadMessagesCarPlayButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617A88);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for UnreadMessagesCarPlayButton(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for UnreadMessagesCarPlayButton()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for UnreadMessagesCarPlayButton(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for UnreadMessagesCarPlayButton(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for UnreadMessagesCarPlayButton(_QWORD *a1, _QWORD *a2)
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

uint64_t getEnumTagSinglePayload for UnreadMessagesCarPlayButton(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for UnreadMessagesCarPlayButton(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for UnreadMessagesCarPlayButton()
{
  return &type metadata for UnreadMessagesCarPlayButton;
}

uint64_t storeEnumTagSinglePayload for UnreadMessagesCarPlayButton.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A50D14 + 4 * byte_246A79F45[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_246A50D48 + 4 * byte_246A79F40[v4]))();
}

uint64_t sub_246A50D48(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A50D50(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A50D58);
  return result;
}

uint64_t sub_246A50D64(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A50D6CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_246A50D70(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A50D78(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UnreadMessagesCarPlayButton.CodingKeys()
{
  return &type metadata for UnreadMessagesCarPlayButton.CodingKeys;
}

unint64_t sub_246A50D98()
{
  unint64_t result;

  result = qword_257617A98;
  if (!qword_257617A98)
  {
    result = MEMORY[0x249563B60](&unk_246A7A088, &type metadata for UnreadMessagesCarPlayButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617A98);
  }
  return result;
}

unint64_t sub_246A50DD8()
{
  unint64_t result;

  result = qword_257617AA0;
  if (!qword_257617AA0)
  {
    result = MEMORY[0x249563B60](&unk_246A79FF8, &type metadata for UnreadMessagesCarPlayButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617AA0);
  }
  return result;
}

unint64_t sub_246A50E18()
{
  unint64_t result;

  result = qword_257617AA8;
  if (!qword_257617AA8)
  {
    result = MEMORY[0x249563B60](&unk_246A7A020, &type metadata for UnreadMessagesCarPlayButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617AA8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_4@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return sub_246A78340();
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return sub_246A783AC();
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0);
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  return swift_bridgeObjectRetain();
}

void PhotoAttachment.init(url:isDraft:)(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  type metadata accessor for SecurityScopedURL();
  v6 = swift_allocObject();
  v7 = v6 + OBJC_IVAR____TtC18SiriMessagesCommon17SecurityScopedURL_wrappedValue;
  v8 = OUTLINED_FUNCTION_2_2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7, a1, v8);
  *(_QWORD *)a3 = v6;
  *(_BYTE *)(a3 + 8) = a2;
  OUTLINED_FUNCTION_3_5();
}

uint64_t PhotoAttachment.url.getter@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC18SiriMessagesCommon17SecurityScopedURL_wrappedValue;
  swift_beginAccess();
  v4 = OUTLINED_FUNCTION_2_2();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_246A50F70@<X0>(uint64_t a1@<X8>)
{
  return PhotoAttachment.url.getter(a1);
}

void sub_246A50FA8(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;

  v4 = sub_246A77F5C();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  v8 = *((_BYTE *)a2 + 8);
  v9 = *a2;
  v10 = v8;
  PhotoAttachment.url.setter((uint64_t)v6);
}

void PhotoAttachment.url.setter(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = OUTLINED_FUNCTION_2_2();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_12();
  v6 = *v1;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v2, a1, v4);
  sub_246A4C814();
  v7 = v6 + OBJC_IVAR____TtC18SiriMessagesCommon17SecurityScopedURL_wrappedValue;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(v7, v2, v4);
  swift_endAccess();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  OUTLINED_FUNCTION_3_5();
}

void (*PhotoAttachment.url.modify(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_246A4C950(v2);
  return sub_246A479E0;
}

uint64_t PhotoAttachment.isDraft.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t PhotoAttachment.isDraft.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 8) = result;
  return result;
}

uint64_t (*PhotoAttachment.isDraft.modify())()
{
  return nullsub_1;
}

uint64_t sub_246A51160()
{
  sub_246A512DC();
  return sub_246A784D8();
}

uint64_t sub_246A51188()
{
  sub_246A512DC();
  return sub_246A784E4();
}

void PhotoAttachment.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617AB0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_12();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A512DC();
  sub_246A784CC();
  type metadata accessor for SecurityScopedURL();
  sub_246A51494(&qword_257617AC0, (uint64_t)&protocol conformance descriptor for SecurityScopedURL);
  sub_246A783D0();
  if (!v1)
    sub_246A783B8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  OUTLINED_FUNCTION_8_1();
}

unint64_t sub_246A512DC()
{
  unint64_t result;

  result = qword_257617AB8;
  if (!qword_257617AB8)
  {
    result = MEMORY[0x249563B60](&unk_246A7A288, &type metadata for PhotoAttachment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617AB8);
  }
  return result;
}

void PhotoAttachment.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617AC8);
  MEMORY[0x24BDAC7A8](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A512DC();
  sub_246A784B4();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    type metadata accessor for SecurityScopedURL();
    sub_246A51494(&qword_257617AD0, (uint64_t)&protocol conformance descriptor for SecurityScopedURL);
    sub_246A78364();
    swift_retain();
    v6 = sub_246A7834C();
    OUTLINED_FUNCTION_2_5();
    *(_QWORD *)a2 = v7;
    *(_BYTE *)(a2 + 8) = v6 & 1;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_release();
  }
  OUTLINED_FUNCTION_8_1();
}

uint64_t sub_246A51494(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for SecurityScopedURL();
    result = MEMORY[0x249563B60](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_246A514DC(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 16) = sub_246A4B75C();
  result = sub_246A4B66C();
  *(_QWORD *)(a1 + 24) = result;
  return result;
}

void sub_246A51508(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  PhotoAttachment.init(from:)(a1, a2);
}

void sub_246A5151C(_QWORD *a1)
{
  PhotoAttachment.encode(to:)(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for PhotoAttachment(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  swift_retain();
  return a1;
}

uint64_t destroy for PhotoAttachment()
{
  return swift_release();
}

uint64_t assignWithCopy for PhotoAttachment(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for PhotoAttachment(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotoAttachment(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 9))
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

uint64_t storeEnumTagSinglePayload for PhotoAttachment(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 9) = 1;
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
    *(_BYTE *)(result + 9) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotoAttachment()
{
  return &type metadata for PhotoAttachment;
}

uint64_t storeEnumTagSinglePayload for PhotoAttachment.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A516EC + 4 * byte_246A7A115[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_246A51720 + 4 * byte_246A7A110[v4]))();
}

uint64_t sub_246A51720(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A51728(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A51730);
  return result;
}

uint64_t sub_246A5173C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A51744);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_246A51748(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A51750(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PhotoAttachment.CodingKeys()
{
  return &type metadata for PhotoAttachment.CodingKeys;
}

unint64_t sub_246A51770()
{
  unint64_t result;

  result = qword_257617AD8;
  if (!qword_257617AD8)
  {
    result = MEMORY[0x249563B60](&unk_246A7A260, &type metadata for PhotoAttachment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617AD8);
  }
  return result;
}

unint64_t sub_246A517B0()
{
  unint64_t result;

  result = qword_257617AE0;
  if (!qword_257617AE0)
  {
    result = MEMORY[0x249563B60](&unk_246A7A1D0, &type metadata for PhotoAttachment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617AE0);
  }
  return result;
}

unint64_t sub_246A517F0()
{
  unint64_t result;

  result = qword_257617AE8[0];
  if (!qword_257617AE8[0])
  {
    result = MEMORY[0x249563B60](&unk_246A7A1F8, &type metadata for PhotoAttachment.CodingKeys);
    atomic_store(result, qword_257617AE8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t Redacted.wrappedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t sub_246A51868@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v4;

  v4 = type metadata accessor for Redacted(0, *(_QWORD *)(a2 + a1 - 24), *(_QWORD *)(a2 + a1 - 16), *(_QWORD *)(a2 + a1 - 8));
  return Redacted.wrappedValue.getter(v4, a3);
}

uint64_t sub_246A518A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v4 = *(_QWORD *)(a4 + a3 - 24);
  v5 = *(_QWORD *)(a4 + a3 - 16);
  v6 = *(_QWORD *)(a4 + a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v12 - v7;
  (*(void (**)(char *))(v9 + 16))((char *)&v12 - v7);
  v10 = type metadata accessor for Redacted(0, v4, v5, v6);
  return Redacted.wrappedValue.setter((uint64_t)v8, v10);
}

uint64_t Redacted.wrappedValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 40))(v2, a1);
}

void (*Redacted.wrappedValue.modify(_QWORD *a1, uint64_t a2))(void **a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  void *v9;
  void (*v10)(void);

  v5 = malloc(0x30uLL);
  *a1 = v5;
  v6 = *(_QWORD *)(a2 + 16);
  *v5 = v2;
  v5[1] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[2] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v5[3] = malloc(v8);
  v9 = malloc(v8);
  v10 = *(void (**)(void))(v7 + 16);
  v5[4] = v9;
  v5[5] = v10;
  v10();
  return sub_246A519E4;
}

void sub_246A519E4(void **a1, char a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v3 = (void *)v2[4];
    v5 = v2[2];
    v4 = (void *)v2[3];
    v7 = *v2;
    v6 = v2[1];
    ((void (*)(void *, void *, uint64_t))v2[5])(v4, v3, v6);
    (*(void (**)(uint64_t, void *, uint64_t))(v5 + 40))(v7, v4, v6);
    (*(void (**)(void *, uint64_t))(v5 + 8))(v3, v6);
  }
  else
  {
    v4 = (void *)v2[3];
    v3 = (void *)v2[4];
    (*(void (**)(_QWORD, void *, _QWORD))(v2[2] + 40))(*v2, v3, v2[1]);
  }
  free(v3);
  free(v4);
  free(v2);
}

uint64_t Redacted.init(wrappedValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1);
}

uint64_t Redacted.description.getter()
{
  return 0x657463616465723CLL;
}

uint64_t sub_246A51AB8(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_246A78400();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_246A51B34()
{
  return 0x65756C6176;
}

uint64_t sub_246A51B48()
{
  return sub_246A49EC0();
}

uint64_t sub_246A51B54()
{
  return sub_246A4CBF0();
}

uint64_t sub_246A51B64()
{
  return sub_246A49EC8();
}

uint64_t sub_246A51B74()
{
  sub_246A78484();
  sub_246A49EC8();
  return sub_246A7849C();
}

uint64_t sub_246A51BB8()
{
  return sub_246A51B34();
}

uint64_t sub_246A51BC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A51AB8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_246A51BFC()
{
  return sub_246A45D4C();
}

uint64_t sub_246A51C20@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_246A49EC0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_246A51C54(uint64_t a1)
{
  MEMORY[0x249563B60](&unk_246A7A478, a1);
  return sub_246A784D8();
}

uint64_t sub_246A51C88(uint64_t a1)
{
  MEMORY[0x249563B60](&unk_246A7A478, a1);
  return sub_246A784E4();
}

void Redacted.encode(to:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v3 = a2[3];
  v9 = a2[2];
  v4 = type metadata accessor for Redacted.CodingKeys(255, v9, v3, a2[4]);
  MEMORY[0x249563B60](&unk_246A7A478, v4);
  OUTLINED_FUNCTION_2_6();
  v5 = sub_246A783DC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v9 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A784CC();
  sub_246A783D0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  OUTLINED_FUNCTION_8_1();
}

uint64_t type metadata accessor for Redacted.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Redacted.CodingKeys);
}

void Redacted.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;

  v25 = a5;
  v30 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v31 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Redacted.CodingKeys(255, v10, v11, v12);
  MEMORY[0x249563B60](&unk_246A7A478, v13);
  OUTLINED_FUNCTION_2_6();
  v32 = sub_246A7837C();
  v26 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v15 = (char *)&v23 - v14;
  v28 = a2;
  v29 = a3;
  v24 = type metadata accessor for Redacted(0, a2, a3, a4);
  v16 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v18 = (char *)&v23 - v17;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v27 = v15;
  v19 = v33;
  sub_246A784B4();
  if (!v19)
  {
    v33 = v16;
    v20 = v30;
    v21 = v31;
    v22 = v28;
    sub_246A78364();
    OUTLINED_FUNCTION_1_5();
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v18, v21, v22);
    (*(void (**)(uint64_t, char *, uint64_t))(v33 + 32))(v25, v18, v24);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  OUTLINED_FUNCTION_8_1();
}

uint64_t type metadata accessor for Redacted(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Redacted);
}

void sub_246A51F90(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  Redacted.init(from:)(a1, a2[2], a2[3], a2[4], a3);
}

void sub_246A51FB0(_QWORD *a1, _QWORD *a2)
{
  Redacted.encode(to:)(a1, a2);
}

uint64_t sub_246A51FC4()
{
  return Redacted.description.getter();
}

uint64_t sub_246A51FE0()
{
  return 24;
}

__n128 sub_246A51FEC(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  *a2 = result;
  return result;
}

uint64_t sub_246A52000()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_246A52008()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_246A52074(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7 && *(_QWORD *)(v4 + 64) <= 0x18uLL && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_246A520E4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_246A520F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 16))();
  return a1;
}

uint64_t sub_246A52124(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 24))();
  return a1;
}

uint64_t sub_246A52154(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 32))();
  return a1;
}

uint64_t sub_246A52184(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))();
  return a1;
}

uint64_t sub_246A521B4(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  char v9;
  int v10;
  unsigned int v11;
  int v12;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  v7 = a2 - v6;
  if (a2 <= v6)
    goto LABEL_18;
  v8 = *(_QWORD *)(v5 + 64);
  v9 = 8 * v8;
  if (v8 <= 3)
  {
    v11 = ((v7 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      v10 = *(_DWORD *)(a1 + v8);
      if (!v10)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v11 > 0xFF)
    {
      v10 = *(unsigned __int16 *)(a1 + v8);
      if (!*(_WORD *)(a1 + v8))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v11 < 2)
    {
LABEL_18:
      if ((_DWORD)v6)
        return __swift_getEnumTagSinglePayload(a1, v6, v4);
      return 0;
    }
  }
  v10 = *(unsigned __int8 *)(a1 + v8);
  if (!*(_BYTE *)(a1 + v8))
    goto LABEL_18;
LABEL_11:
  v12 = (v10 - 1) << v9;
  if (v8 > 3)
    v12 = 0;
  if (!(_DWORD)v8)
    return (v6 + v12 + 1);
  if (v8 > 3)
    LODWORD(v8) = 4;
  return ((uint64_t (*)(void))((char *)&loc_246A52264 + 4 * byte_246A7A2E0[(v8 - 1)]))();
}

void sub_246A522B0(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  char v9;
  BOOL v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = 8 * v8;
  v10 = a3 >= v7;
  v11 = a3 - v7;
  if (v11 != 0 && v10)
  {
    if (v8 <= 3)
    {
      v14 = ((v11 + ~(-1 << v9)) >> v9) + 1;
      if (HIWORD(v14))
      {
        v12 = 4u;
      }
      else if (v14 >= 0x100)
      {
        v12 = 2;
      }
      else
      {
        v12 = v14 > 1;
      }
    }
    else
    {
      v12 = 1u;
    }
  }
  else
  {
    v12 = 0;
  }
  if (v7 < a2)
  {
    v13 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v15 = v13 & ~(-1 << v9);
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v15;
          *((_BYTE *)a1 + 2) = BYTE2(v15);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v15;
        }
        else
        {
          *(_BYTE *)a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v13;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X10 }
}

uint64_t sub_246A52458()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_246A52460(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_246A524A0 + 4 * byte_246A7A2EE[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_246A524C0 + 4 * byte_246A7A2F3[v4]))();
}

_BYTE *sub_246A524A0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_246A524C0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_246A524C8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_246A524D0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_246A524D8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_246A524E0(_DWORD *result)
{
  *result = 0;
  return result;
}

void sub_246A524EC()
{
  JUMPOUT(0x249563B60);
}

void sub_246A524FC()
{
  JUMPOUT(0x249563B60);
}

void sub_246A5250C()
{
  JUMPOUT(0x249563B60);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x249563AF4](a1, v6, a5);
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v1, *(_QWORD *)(v2 - 88));
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  return 0;
}

uint64_t UpdateSnippetAction.init(launchAppWithIntent:snippetMessage:sendButtonDisabled:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  *(_QWORD *)a5 = result;
  *(_QWORD *)(a5 + 8) = a2;
  *(_QWORD *)(a5 + 16) = a3;
  *(_BYTE *)(a5 + 24) = a4;
  return result;
}

void UpdateSnippetAction.launchAppWithIntent.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

id UpdateSnippetAction.launchAppWithIntent.getter()
{
  id *v0;
  id v1;
  id v2;

  v1 = *v0;
  v2 = *v0;
  return v1;
}

id sub_246A525C8@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = UpdateSnippetAction.launchAppWithIntent.getter();
  *a1 = result;
  return result;
}

void sub_246A52610(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  UpdateSnippetAction.launchAppWithIntent.setter(v1);
}

void (*UpdateSnippetAction.launchAppWithIntent.modify(void **a1))(uint64_t a1, char a2)
{
  void **v1;
  void *v2;
  id v3;

  v2 = *v1;
  *a1 = *v1;
  a1[1] = v1;
  v3 = v2;
  return sub_246A52674;
}

void sub_246A52674(uint64_t a1, char a2)
{
  void **v2;
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)a1;
  v2 = *(void ***)(a1 + 8);
  v4 = *v2;
  if ((a2 & 1) != 0)
  {
    v5 = v3;

    *v2 = v3;
  }
  else
  {

    *v2 = v3;
  }
}

uint64_t UpdateSnippetAction.snippetMessage.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UpdateSnippetAction.snippetMessage.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t (*UpdateSnippetAction.snippetMessage.modify())()
{
  return nullsub_1;
}

uint64_t UpdateSnippetAction.sendButtonDisabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t UpdateSnippetAction.sendButtonDisabled.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 24) = result;
  return result;
}

uint64_t (*UpdateSnippetAction.sendButtonDisabled.modify())()
{
  return nullsub_1;
}

uint64_t sub_246A52768(uint64_t a1, uint64_t a2)
{
  BOOL v5;
  char v6;

  if (a1 == 0xD000000000000013 && a2 == 0x8000000246A7F070 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v5 = a1 == 0x4D74657070696E73 && a2 == 0xEE00656761737365;
    if (v5 || (sub_246A78400() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000012 && a2 == 0x8000000246A7F090)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v6 = sub_246A78400();
      swift_bridgeObjectRelease();
      if ((v6 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t sub_246A528C0()
{
  return 3;
}

uint64_t sub_246A528C8(char a1)
{
  if (!a1)
    return 0xD000000000000013;
  if (a1 == 1)
    return 0x4D74657070696E73;
  return 0xD000000000000012;
}

uint64_t sub_246A52930()
{
  char *v0;

  return sub_246A528C8(*v0);
}

uint64_t sub_246A52938@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A52768(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A5295C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_246A528C0();
  *a1 = result;
  return result;
}

uint64_t sub_246A52980()
{
  sub_246A52B44();
  return sub_246A784D8();
}

uint64_t sub_246A529A8()
{
  sub_246A52B44();
  return sub_246A784E4();
}

void UpdateSnippetAction.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _DWORD v10[2];
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  char v15;
  uint64_t v16;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617BF0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v1;
  v8 = v1[1];
  v11 = v1[2];
  v12 = v8;
  v10[1] = *((unsigned __int8 *)v1 + 24);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A52B44();
  sub_246A784CC();
  v16 = v9;
  v15 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617C00);
  sub_246A52D64(&qword_257617C08, (uint64_t)&protocol conformance descriptor for ModelCodable<A>);
  sub_246A783D0();
  if (!v2)
  {
    v14 = 1;
    sub_246A783AC();
    v13 = 2;
    sub_246A783B8();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  OUTLINED_FUNCTION_8_1();
}

unint64_t sub_246A52B44()
{
  unint64_t result;

  result = qword_257617BF8;
  if (!qword_257617BF8)
  {
    result = MEMORY[0x249563B60](&unk_246A7A628, &type metadata for UpdateSnippetAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617BF8);
  }
  return result;
}

void UpdateSnippetAction.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617C10);
  MEMORY[0x24BDAC7A8](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A52B44();
  sub_246A784B4();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);

  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257617C00);
    sub_246A52D64(&qword_257617C18, (uint64_t)&protocol conformance descriptor for ModelCodable<A>);
    sub_246A78364();
    v11;
    v6 = sub_246A78340();
    v8 = v7;
    v10 = v6;
    swift_bridgeObjectRetain();
    v9 = sub_246A7834C();
    OUTLINED_FUNCTION_0_5();
    *(_QWORD *)a2 = v11;
    *(_QWORD *)(a2 + 8) = v10;
    *(_QWORD *)(a2 + 16) = v8;
    *(_BYTE *)(a2 + 24) = v9 & 1;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    OUTLINED_FUNCTION_3_6();
    OUTLINED_FUNCTION_2_7();
  }
  OUTLINED_FUNCTION_8_1();
}

uint64_t sub_246A52D64(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257617C00);
    result = MEMORY[0x249563B60](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

void sub_246A52DA8(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  UpdateSnippetAction.init(from:)(a1, a2);
}

void sub_246A52DBC(_QWORD *a1)
{
  UpdateSnippetAction.encode(to:)(a1);
}

uint64_t destroy for UpdateSnippetAction(id *a1)
{

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UpdateSnippetAction(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UpdateSnippetAction(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
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

uint64_t assignWithTake for UpdateSnippetAction(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for UpdateSnippetAction(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 25))
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

uint64_t storeEnumTagSinglePayload for UpdateSnippetAction(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 25) = 1;
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
    *(_BYTE *)(result + 25) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for UpdateSnippetAction()
{
  return &type metadata for UpdateSnippetAction;
}

uint64_t getEnumTagSinglePayload for UpdateSnippetAction.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFE)
  {
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
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for UpdateSnippetAction.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A53074 + 4 * byte_246A7A4D5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_246A530A8 + 4 * byte_246A7A4D0[v4]))();
}

uint64_t sub_246A530A8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A530B0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A530B8);
  return result;
}

uint64_t sub_246A530C4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A530CCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_246A530D0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A530D8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UpdateSnippetAction.CodingKeys()
{
  return &type metadata for UpdateSnippetAction.CodingKeys;
}

unint64_t sub_246A530F8()
{
  unint64_t result;

  result = qword_257617C20;
  if (!qword_257617C20)
  {
    result = MEMORY[0x249563B60](&unk_246A7A600, &type metadata for UpdateSnippetAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617C20);
  }
  return result;
}

unint64_t sub_246A53138()
{
  unint64_t result;

  result = qword_257617C28;
  if (!qword_257617C28)
  {
    result = MEMORY[0x249563B60](&unk_246A7A570, &type metadata for UpdateSnippetAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617C28);
  }
  return result;
}

unint64_t sub_246A53178()
{
  unint64_t result;

  result = qword_257617C30;
  if (!qword_257617C30)
  {
    result = MEMORY[0x249563B60](&unk_246A7A598, &type metadata for UpdateSnippetAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617C30);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

void OUTLINED_FUNCTION_2_7()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_3_6()
{
  return swift_bridgeObjectRelease();
}

uint64_t CATSerializable.serializedBase64SpeakableString()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  result = (*(uint64_t (**)(void))(a2 + 8))();
  if (!v2)
  {
    v5 = result;
    v6 = v4;
    sub_246A77F74();
    sub_246A4D02C(v5, v6);
    sub_246A78160();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void INInteraction.serializedData()()
{
  uint64_t v0;
  id v1;
  id v2;
  void *v3;
  id v4[2];

  v4[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4[0] = 0;
  v1 = objc_msgSend((id)objc_opt_self(), sel_archivedDataWithRootObject_requiringSecureCoding_error_, v0, 1, v4);
  v2 = v4[0];
  if (v1)
  {
    sub_246A77F80();

  }
  else
  {
    v3 = v2;
    sub_246A77EF0();

    swift_willThrow();
  }
  OUTLINED_FUNCTION_0_6();
}

void sub_246A53320()
{
  INInteraction.serializedData()();
}

void SABaseCommand.serializedData()()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = objc_msgSend(v0, sel_dictionary);
  if (!v1)
    __break(1u);
  v2 = v1;
  v6[0] = 0;
  v3 = objc_msgSend((id)objc_opt_self(), sel_dataWithPropertyList_format_options_error_, v1, 200, 0, v6);

  v4 = v6[0];
  if (v3)
  {
    sub_246A77F80();

  }
  else
  {
    v5 = v4;
    sub_246A77EF0();

    swift_willThrow();
  }
  OUTLINED_FUNCTION_0_6();
}

void sub_246A53434()
{
  SABaseCommand.serializedData()();
}

id sub_246A53464()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for AutoSendUtilities.Dummy();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_257617C38 = (uint64_t)result;
  return result;
}

id static AutoSendUtilities.configUITone(isFirstPartyApp:mode:)(int a1, uint64_t a2)
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
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  _QWORD v26[4];
  int v27;
  void (*v28)(char *, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;

  v4 = sub_246A78094();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)v26 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v26 - v12;
  if (qword_2576171E8 != -1)
    swift_once();
  v14 = sub_246A780F4();
  __swift_project_value_buffer(v14, (uint64_t)qword_257623F88);
  v28 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v28(v13, a2, v4);
  v15 = sub_246A780DC();
  v16 = sub_246A781F0();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc();
    v27 = a1;
    v18 = (uint8_t *)v17;
    v19 = swift_slowAlloc();
    v26[2] = a2;
    v30 = v19;
    v26[3] = v8;
    *(_DWORD *)v18 = 136315138;
    v26[1] = v18 + 4;
    sub_246A53998();
    v20 = sub_246A783E8();
    v29 = sub_246A4ADD4(v20, v21, &v30);
    sub_246A7822C();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_0_7((uint64_t)v13);
    _os_log_impl(&dword_246A43000, v15, v16, "#AutoSendUtilities playUITone responseMode: %s", v18, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_22_0();
  }
  OUTLINED_FUNCTION_0_7((uint64_t)v13);

  sub_246A78070();
  v22 = a2;
  v23 = sub_246A7807C();
  OUTLINED_FUNCTION_0_7((uint64_t)v11);
  v28(v8, v22, v4);
  if ((v23 & 1) != 0)
  {
    v24 = 1;
  }
  else
  {
    sub_246A78088();
    v24 = sub_246A7807C();
    OUTLINED_FUNCTION_0_7((uint64_t)v11);
  }
  OUTLINED_FUNCTION_0_7((uint64_t)v8);
  return static AutoSendUtilities.configUITone(isFirstPartyApp:isVoiceMode:)(a1 & 1, v24 & 1);
}

id static AutoSendUtilities.configUITone(isFirstPartyApp:isVoiceMode:)(char a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v16;

  v4 = sub_246A77F5C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v9 = 0x67734D746E6553;
  else
    v9 = 0x3367734D746E6553;
  if (v8)
    v10 = 0xE900000000000070;
  else
    v10 = 0xE700000000000000;
  if (qword_2576171E0 != -1)
    swift_once();
  sub_246A4E12C(v9, v10, 7758199, 0xE300000000000000, (void *)qword_257617C38);
  if (!v11)
    return 0;
  sub_246A77F08();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEB8CA8]), sel_initWithType_, 2);
  v13 = (void *)sub_246A77F14();
  objc_msgSend(v12, sel_setExternalToneFileURL_, v13);

  objc_msgSend(v12, sel_setShouldIgnoreRingerSwitch_, a2 & 1);
  v14 = objc_msgSend((id)objc_opt_self(), sel_alertWithConfiguration_, v12);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t static AutoSendUtilities.soundFileURLString(isFirstPartyApp:)(char a1)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2576171E0 != -1)
    swift_once();
  if ((a1 & 1) != 0)
    v2 = 0x67734D746E6553;
  else
    v2 = 0x3367734D746E6553;
  if ((a1 & 1) != 0)
    v3 = 0xE700000000000000;
  else
    v3 = 0xE900000000000070;
  return sub_246A4E12C(v2, v3, 7758199, 0xE300000000000000, (void *)qword_257617C38);
}

unint64_t sub_246A53998()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257617C40;
  if (!qword_257617C40)
  {
    v1 = sub_246A78094();
    result = MEMORY[0x249563B60](MEMORY[0x24BE99108], v1);
    atomic_store(result, (unint64_t *)&qword_257617C40);
  }
  return result;
}

ValueMetadata *type metadata accessor for AutoSendUtilities()
{
  return &type metadata for AutoSendUtilities;
}

uint64_t type metadata accessor for AutoSendUtilities.Dummy()
{
  return objc_opt_self();
}

uint64_t OUTLINED_FUNCTION_0_7(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t static SFSpeechAssetManagerProtocol.installedASRAssetFor(language:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  os_log_type_t v10;
  _WORD *v11;
  uint64_t v12;
  uint64_t v13;

  if (a2)
  {
    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a3, a4);
    v7 = sub_246A53B18(a1, a2, v6);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_2576171E8 != -1)
      swift_once();
    v8 = OUTLINED_FUNCTION_8_3();
    v9 = (void *)OUTLINED_FUNCTION_6_5(v8, (uint64_t)qword_257623F88);
    v10 = sub_246A781FC();
    if (OUTLINED_FUNCTION_2_8(v10))
    {
      v11 = (_WORD *)OUTLINED_FUNCTION_3_7();
      OUTLINED_FUNCTION_10_2(v11);
      OUTLINED_FUNCTION_1_6(&dword_246A43000, v12, v13, "#SFSpeechAssetManagerProtocol installedASRAssetFor language nil");
      OUTLINED_FUNCTION_22_0();
    }

    return 0;
  }
  return v7;
}

uint64_t sub_246A53B18(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t result;
  int64_t v21;
  __int128 v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t i;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v62;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  int64_t v67;
  __int128 v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  int64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83[2];

  v6 = sub_246A780F4();
  v81 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_246A77FEC();
  v74 = *(_QWORD *)(v9 - 8);
  v75 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v73 = (char *)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_246A78004();
  v71 = *(_QWORD *)(v11 - 8);
  v72 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v70 = (char *)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617CE0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(_QWORD *)(a3 + 56);
  v66 = a3 + 56;
  v17 = 1 << *(_BYTE *)(a3 + 32);
  v18 = -1;
  if (v17 < 64)
    v18 = ~(-1 << v17);
  v19 = v18 & v16;
  v67 = (unint64_t)(v17 + 63) >> 6;
  v77 = a3;
  result = swift_bridgeObjectRetain();
  v21 = 0;
  *(_QWORD *)&v22 = 136315138;
  v68 = v22;
  v64 = MEMORY[0x24BEE4AD8] + 8;
  v65 = a2;
  v76 = v8;
  v69 = v15;
  if (!v19)
    goto LABEL_5;
LABEL_4:
  v23 = __clz(__rbit64(v19));
  v24 = (v19 - 1) & v19;
  v78 = v21;
  for (i = v23 | (v21 << 6); ; i = __clz(__rbit64(v27)) + (v28 << 6))
  {
    v79 = v24;
    v30 = (uint64_t *)(*(_QWORD *)(v77 + 48) + 16 * i);
    v32 = *v30;
    v31 = v30[1];
    v33 = qword_2576171E8;
    swift_bridgeObjectRetain();
    if (v33 != -1)
      swift_once();
    v34 = __swift_project_value_buffer(v6, (uint64_t)qword_257623F88);
    swift_bridgeObjectRetain_n();
    v35 = sub_246A780DC();
    v36 = sub_246A78208();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = swift_slowAlloc();
      v38 = v31;
      v39 = v32;
      v40 = swift_slowAlloc();
      v83[0] = v40;
      *(_DWORD *)v37 = v68;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v37 + 4) = sub_246A4ADD4(a1, a2, v83);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_246A43000, v35, v36, "#SFSpeechAssetManagerProtocol hasLanguage %s", (uint8_t *)v37, 0xCu);
      swift_arrayDestroy();
      v41 = v40;
      v32 = v39;
      v31 = v38;
      MEMORY[0x249563BFC](v41, -1, -1);
      v42 = v37;
      v8 = v76;
      MEMORY[0x249563BFC](v42, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_bridgeObjectRetain();
    v43 = v70;
    v80 = v32;
    sub_246A77FB0();
    v44 = v73;
    sub_246A77FF8();
    (*(void (**)(char *, uint64_t))(v71 + 8))(v43, v72);
    v45 = (uint64_t)v69;
    sub_246A77FE0();
    v46 = v45;
    (*(void (**)(char *, uint64_t))(v74 + 8))(v44, v75);
    v47 = sub_246A77FD4();
    if (__swift_getEnumTagSinglePayload(v46, 1, v47) == 1)
    {
      sub_246A5521C(v46);
      v82 = 0;
      v48 = 0;
    }
    else
    {
      v82 = sub_246A77FC8();
      v48 = v49;
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 8))(v46, v47);
    }
    (*(void (**)(char *, uint64_t, uint64_t))(v81 + 16))(v8, v34, v6);
    swift_bridgeObjectRetain_n();
    v50 = sub_246A780DC();
    v51 = sub_246A78208();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = swift_slowAlloc();
      v53 = swift_slowAlloc();
      v83[0] = v53;
      *(_DWORD *)v52 = v68;
      v54 = v6;
      v55 = a1;
      if (v48)
        v56 = v82;
      else
        v56 = 7104878;
      v57 = v31;
      if (v48)
        v58 = v48;
      else
        v58 = 0xE300000000000000;
      swift_bridgeObjectRetain();
      v59 = v56;
      a1 = v55;
      v6 = v54;
      v8 = v76;
      *(_QWORD *)(v52 + 4) = sub_246A4ADD4(v59, v58, v83);
      swift_bridgeObjectRelease_n();
      v31 = v57;
      a2 = v65;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_246A43000, v50, v51, "#SFSpeechAssetManagerProtocol baseLanguage %s", (uint8_t *)v52, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249563BFC](v53, -1, -1);
      MEMORY[0x249563BFC](v52, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v81 + 8))(v8, v6);
    v60 = v80;
    if (v48)
    {
      if (v82 == a1 && v48 == a2)
      {
        swift_release();
        swift_bridgeObjectRelease();
        return v60;
      }
      v62 = sub_246A78400();
      swift_bridgeObjectRelease();
      if ((v62 & 1) != 0)
        goto LABEL_49;
    }
    if (v60 == a1 && v31 == a2)
    {
      swift_release();
      return a1;
    }
    if ((sub_246A78400() & 1) != 0)
    {
LABEL_49:
      swift_release();
      return v60;
    }
    result = swift_bridgeObjectRelease();
    v21 = v78;
    v19 = v79;
    if (v79)
      goto LABEL_4;
LABEL_5:
    v26 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v26 >= v67)
      goto LABEL_51;
    v27 = *(_QWORD *)(v66 + 8 * v26);
    v28 = v21 + 1;
    if (v27)
      goto LABEL_18;
    v28 = v21 + 2;
    if (v21 + 2 >= v67)
      goto LABEL_51;
    v27 = *(_QWORD *)(v66 + 8 * v28);
    if (v27)
      goto LABEL_18;
    v28 = v21 + 3;
    if (v21 + 3 >= v67)
      goto LABEL_51;
    v27 = *(_QWORD *)(v66 + 8 * v28);
    if (v27)
      goto LABEL_18;
    v29 = v21 + 4;
    if (v21 + 4 >= v67)
    {
LABEL_51:
      swift_release();
      return 0;
    }
    v27 = *(_QWORD *)(v66 + 8 * v29);
    if (!v27)
    {
      while (1)
      {
        v28 = v29 + 1;
        if (__OFADD__(v29, 1))
          goto LABEL_55;
        if (v28 >= v67)
          goto LABEL_51;
        v27 = *(_QWORD *)(v66 + 8 * v28);
        ++v29;
        if (v27)
          goto LABEL_18;
      }
    }
    v28 = v21 + 4;
LABEL_18:
    v24 = (v27 - 1) & v27;
    v78 = v28;
  }
  __break(1u);
LABEL_55:
  __break(1u);
  return result;
}

uint64_t static SFSpeechAssetManagerProtocol.supportedLanguages()()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  os_log_type_t v8;
  _WORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = (id)AFPreferencesSupportedLanguages();
  if (v1)
  {
    v2 = v1;
    v3 = sub_246A781B4();

    v15 = MEMORY[0x24BEE4B08];
    v4 = *(_QWORD *)(v3 + 16);
    if (v4)
    {
      v5 = v3 + 32;
      do
      {
        sub_246A4C5E8(v5, (uint64_t)&v14);
        if ((swift_dynamicCast() & 1) != 0)
        {
          sub_246A55070(&v14, v12, v13);
          swift_bridgeObjectRelease();
        }
        v5 += 32;
        --v4;
      }
      while (v4);
      swift_bridgeObjectRelease();
      return v15;
    }
    else
    {
      swift_bridgeObjectRelease();
      return MEMORY[0x24BEE4B08];
    }
  }
  else
  {
    if (qword_2576171E8 != -1)
      swift_once();
    v7 = OUTLINED_FUNCTION_8_3();
    OUTLINED_FUNCTION_6_5(v7, (uint64_t)qword_257623F88);
    v8 = OUTLINED_FUNCTION_9_2();
    if (OUTLINED_FUNCTION_2_8(v8))
    {
      v9 = (_WORD *)OUTLINED_FUNCTION_3_7();
      OUTLINED_FUNCTION_10_2(v9);
      OUTLINED_FUNCTION_1_6(&dword_246A43000, v10, v11, "#SFSpeechAssetManagerProtocol AFPreferencesSupportedLanguages returned nil");
      OUTLINED_FUNCTION_22_0();
    }

    return 0;
  }
}

uint64_t static SFSpeechAssetManagerProtocol.availableAssetFor(language:possibleLanguages:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v5;
  os_log_type_t v6;
  _WORD *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  os_log_type_t v12;
  _WORD *v13;

  if (a3)
  {
    if (a2)
      return sub_246A53B18(a1, a2, a3);
    if (qword_2576171E8 != -1)
      swift_once();
    v11 = OUTLINED_FUNCTION_8_3();
    OUTLINED_FUNCTION_6_5(v11, (uint64_t)qword_257623F88);
    v12 = OUTLINED_FUNCTION_9_2();
    if (OUTLINED_FUNCTION_2_8(v12))
    {
      v13 = (_WORD *)OUTLINED_FUNCTION_3_7();
      OUTLINED_FUNCTION_10_2(v13);
      v10 = "#SFSpeechAssetManagerProtocol availableAssetFor langauage nil";
LABEL_12:
      OUTLINED_FUNCTION_1_6(&dword_246A43000, v8, v9, v10);
      OUTLINED_FUNCTION_22_0();
    }
  }
  else
  {
    if (qword_2576171E8 != -1)
      swift_once();
    v5 = OUTLINED_FUNCTION_8_3();
    OUTLINED_FUNCTION_6_5(v5, (uint64_t)qword_257623F88);
    v6 = OUTLINED_FUNCTION_9_2();
    if (OUTLINED_FUNCTION_2_8(v6))
    {
      v7 = (_WORD *)OUTLINED_FUNCTION_3_7();
      OUTLINED_FUNCTION_10_2(v7);
      v10 = "#SFSpeechAssetManagerProtocol AFPreferencesSupportedLanguages returned nil";
      goto LABEL_12;
    }
  }

  return 0;
}

uint64_t static SFSpeechAssetManagerProtocol.numberOfAssetsAvailableForLanguage(language:possibleLanguages:)(char *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  NSObject *v16;
  uint64_t v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  os_log_type_t v25;
  _WORD *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  int64_t v38;
  unint64_t v39;
  int64_t v40;
  uint64_t v41;
  char **v42;
  char *v43;
  NSObject *v44;
  os_log_type_t v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char *v56;
  NSObject *v57;
  uint64_t v58;
  os_log_type_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  char v64;
  char v66;
  _QWORD v68[2];
  char *v69;
  unint64_t v70;
  uint64_t v71;
  int64_t v72;
  __int128 v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  int64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89[2];

  v87 = OUTLINED_FUNCTION_8_3();
  v6 = *(_QWORD *)(v87 - 8);
  MEMORY[0x24BDAC7A8](v87);
  v8 = (char *)v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_246A77FEC();
  v79 = *(_QWORD *)(v9 - 8);
  v80 = v9;
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_6_0();
  v78 = v10;
  v11 = sub_246A78004();
  v76 = *(_QWORD *)(v11 - 8);
  v77 = v11;
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_6_0();
  v75 = v12;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617CE0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v68 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = a3;
  if (!a3)
  {
    if (qword_2576171E8 != -1)
      swift_once();
    OUTLINED_FUNCTION_6_5(v87, (uint64_t)qword_257623F88);
    v25 = OUTLINED_FUNCTION_9_2();
    if (OUTLINED_FUNCTION_2_8(v25))
    {
      v26 = (_WORD *)OUTLINED_FUNCTION_3_7();
      OUTLINED_FUNCTION_10_2(v26);
      OUTLINED_FUNCTION_1_6(&dword_246A43000, v27, v28, "#SFSpeechAssetManagerProtocol AFPreferencesSupportedLanguages returned nil");
      OUTLINED_FUNCTION_22_0();
    }

    return 0;
  }
  v69 = a1;
  v70 = (unint64_t)a2;
  v16 = qword_2576171E8;
  swift_bridgeObjectRetain();
  if (v16 != -1)
LABEL_60:
    swift_once();
  v17 = __swift_project_value_buffer(v87, (uint64_t)qword_257623F88);
  OUTLINED_FUNCTION_13_2();
  v86 = v17;
  sub_246A780DC();
  v18 = OUTLINED_FUNCTION_9_2();
  v19 = os_log_type_enabled(v16, v18);
  v20 = MEMORY[0x24BEE4AD8];
  v82 = v8;
  v74 = v15;
  if (v19)
  {
    v21 = (uint8_t *)OUTLINED_FUNCTION_3_7();
    v89[0] = OUTLINED_FUNCTION_3_7();
    *(_DWORD *)v21 = 136315138;
    swift_bridgeObjectRetain();
    v22 = sub_246A781D8();
    v24 = v23;
    swift_bridgeObjectRelease();
    v88 = sub_246A4ADD4(v22, v24, v89);
    sub_246A7822C();
    OUTLINED_FUNCTION_7_3();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_12_2(&dword_246A43000, v16, v18, "#SFSpeechAssetManagerProtocol possibleLanguages %s", v21);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_22_0();
  }

  OUTLINED_FUNCTION_7_3();
  v68[0] = 0;
  v31 = 0;
  v32 = *(_QWORD *)(v81 + 56);
  v71 = v81 + 56;
  v33 = 1 << *(_BYTE *)(v81 + 32);
  v34 = -1;
  if (v33 < 64)
    v34 = ~(-1 << v33);
  v35 = v34 & v32;
  v72 = (unint64_t)(v33 + 63) >> 6;
  *(_QWORD *)&v30 = 136315138;
  v73 = v30;
  v68[1] = v20 + 8;
  v36 = v70;
  v8 = v69;
  do
  {
    do
    {
      if (v35)
      {
        v83 = (v35 - 1) & v35;
        v84 = v31;
        v37 = __clz(__rbit64(v35)) | (v31 << 6);
      }
      else
      {
        v38 = v31 + 1;
        if (__OFADD__(v31, 1))
        {
          __break(1u);
LABEL_59:
          __break(1u);
          goto LABEL_60;
        }
        if (v38 >= v72)
          goto LABEL_57;
        v39 = *(_QWORD *)(v71 + 8 * v38);
        v40 = v31 + 1;
        if (!v39)
        {
          v40 = v31 + 2;
          if (v31 + 2 >= v72)
            goto LABEL_57;
          v39 = *(_QWORD *)(v71 + 8 * v40);
          if (!v39)
          {
            v40 = v31 + 3;
            if (v31 + 3 >= v72)
              goto LABEL_57;
            v39 = *(_QWORD *)(v71 + 8 * v40);
            if (!v39)
            {
              v41 = v31 + 4;
              if (v31 + 4 >= v72)
                goto LABEL_57;
              v39 = *(_QWORD *)(v71 + 8 * v41);
              if (!v39)
              {
                while (1)
                {
                  v40 = v41 + 1;
                  if (__OFADD__(v41, 1))
                    goto LABEL_59;
                  if (v40 >= v72)
                    goto LABEL_57;
                  v39 = *(_QWORD *)(v71 + 8 * v40);
                  ++v41;
                  if (v39)
                    goto LABEL_28;
                }
              }
              v40 = v31 + 4;
            }
          }
        }
LABEL_28:
        v83 = (v39 - 1) & v39;
        v84 = v40;
        v37 = __clz(__rbit64(v39)) + (v40 << 6);
      }
      v42 = (char **)(*(_QWORD *)(v81 + 48) + 16 * v37);
      v43 = *v42;
      v16 = v42[1];
      OUTLINED_FUNCTION_13_2();
      swift_bridgeObjectRetain();
      v44 = sub_246A780DC();
      v45 = sub_246A78208();
      if (os_log_type_enabled(v44, v45))
      {
        v46 = OUTLINED_FUNCTION_3_7();
        v89[0] = OUTLINED_FUNCTION_3_7();
        *(_DWORD *)v46 = v73;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v46 + 4) = sub_246A4ADD4((uint64_t)v8, v36, v89);
        swift_bridgeObjectRelease_n();
        OUTLINED_FUNCTION_12_2(&dword_246A43000, v44, v45, "#SFSpeechAssetManagerProtocol hasLanguage %s", (uint8_t *)v46);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_22_0();
      }

      v47 = v36;
      OUTLINED_FUNCTION_7_3();
      v48 = (uint64_t)v74;
      swift_bridgeObjectRetain();
      v49 = v75;
      v85 = v43;
      sub_246A77FB0();
      v50 = v78;
      sub_246A77FF8();
      (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v49, v77);
      sub_246A77FE0();
      (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v50, v80);
      v51 = sub_246A77FD4();
      if (__swift_getEnumTagSinglePayload(v48, 1, v51) == 1)
      {
        sub_246A5521C(v48);
        v52 = 0;
        v53 = 0;
      }
      else
      {
        v52 = sub_246A77FC8();
        v54 = v48;
        v53 = v55;
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 8))(v54, v51);
      }
      v56 = v82;
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v82, v86, v87);
      OUTLINED_FUNCTION_13_2();
      v57 = sub_246A780DC();
      v58 = v6;
      v59 = sub_246A78208();
      if (os_log_type_enabled(v57, v59))
      {
        v60 = OUTLINED_FUNCTION_3_7();
        v89[0] = OUTLINED_FUNCTION_3_7();
        *(_DWORD *)v60 = v73;
        if (v53)
        {
          v61 = v53;
        }
        else
        {
          v52 = 7104878;
          v61 = 0xE300000000000000;
        }
        swift_bridgeObjectRetain();
        *(_QWORD *)(v60 + 4) = sub_246A4ADD4(v52, v61, v89);
        OUTLINED_FUNCTION_7_3();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_12_2(&dword_246A43000, v57, v59, "#SFSpeechAssetManagerProtocol possible language %s", (uint8_t *)v60);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_22_0();
      }
      v62 = (char *)v52;

      OUTLINED_FUNCTION_7_3();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v56, v87);
      v6 = v58;
      v36 = (unint64_t)v47;
      v15 = v85;
      if (v53)
      {
        if (v62 == v8 && v53 == (_QWORD)v47)
        {
          swift_bridgeObjectRelease();
LABEL_53:
          swift_bridgeObjectRelease();
          v35 = v83;
          v31 = v84;
          break;
        }
        v64 = OUTLINED_FUNCTION_11_1();
        swift_bridgeObjectRelease();
        if ((v64 & 1) != 0)
          goto LABEL_53;
      }
      if (v15 == v8 && v16 == v47)
        goto LABEL_53;
      v66 = OUTLINED_FUNCTION_11_1();
      swift_bridgeObjectRelease();
      v35 = v83;
      v31 = v84;
    }
    while ((v66 & 1) == 0);
  }
  while (!__OFADD__(v68[0]++, 1));
  __break(1u);
LABEL_57:
  swift_release();
  return v68[0];
}

uint64_t sub_246A54C84()
{
  id v0;
  uint64_t v1;

  v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_installedLanguages);
  v1 = sub_246A781CC();

  return v1;
}

uint64_t sub_246A54CDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_257617CF8 + dword_257617CF8);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_246A54D70;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t sub_246A54D70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v4 = OUTLINED_FUNCTION_4_4();
  if (!v1)
  {
    v4 = v2;
    v5 = v0;
  }
  return OUTLINED_FUNCTION_5_5(v4, v5, *(uint64_t (**)(void))(v3 + 8));
}

uint64_t sub_246A54DA4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v9;
  uint64_t v10;
  void *ObjCClassFromMetadata;
  uint64_t v12;

  v9 = sub_246A78130();
  v5[18] = v9;
  v10 = MEMORY[0x24BDAC760];
  if (a4)
  {
    v5[14] = a4;
    v5[15] = a5;
    v5[10] = v10;
    v5[11] = 1107296256;
    v5[12] = sub_246A54F80;
    v5[13] = &block_descriptor_5;
    a4 = _Block_copy(v5 + 10);
    swift_retain();
    swift_release();
  }
  v5[19] = a4;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v5[7] = v5 + 16;
  v5[2] = v5;
  v5[3] = sub_246A54EDC;
  v12 = swift_continuation_init();
  v5[10] = v10;
  v5[11] = 0x40000000;
  v5[12] = sub_246A54FBC;
  v5[13] = &block_descriptor;
  v5[14] = v12;
  objc_msgSend(ObjCClassFromMetadata, sel_fetchAssetWithConfig_clientIdentifier_progress_completion_, a1, v9, a4, v5 + 10);
  return swift_continuation_await();
}

uint64_t sub_246A54EDC()
{
  uint64_t *v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;

  v1 = *v0;
  v3 = *(void **)(v1 + 144);
  v2 = *(const void **)(v1 + 152);
  if (*(_QWORD *)(v1 + 48))
  {
    swift_willThrow();
    _Block_release(v2);

    return (*(uint64_t (**)(void))(v1 + 8))();
  }
  else
  {
    v5 = *(_QWORD *)(v1 + 128);
    v6 = *(_QWORD *)(v1 + 136);
    _Block_release(*(const void **)(v1 + 152));

    return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v5, v6);
  }
}

uint64_t sub_246A54F80(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_246A54FBC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
    return sub_246A55010(v3, (uint64_t)a3);
  v5 = sub_246A7813C();
  return sub_246A55060(v3, v5, v6);
}

uint64_t sub_246A55010(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257617D00);
  swift_allocError();
  *v3 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_246A55060(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 64) + 40);
  *v3 = a2;
  v3[1] = a3;
  return swift_continuation_throwingResume();
}

uint64_t sub_246A55070(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_246A78484();
  swift_bridgeObjectRetain();
  sub_246A7816C();
  v8 = sub_246A7849C();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_246A78400() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_246A78400() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_246A55634(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_246A5521C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617CE0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t dispatch thunk of static SFSpeechAssetManagerProtocol.installedLanguages()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static SFSpeechAssetManagerProtocol.availableAssetFor(language:possibleLanguages:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of static SFSpeechAssetManagerProtocol.fetchAsset(with:clientIdentifier:progress:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v15;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a7 + 24)
                                                                                              + *(_QWORD *)(a7 + 24));
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v15;
  *v15 = v7;
  v15[1] = sub_246A55314;
  return v17(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_246A55314()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_4_4();
  return OUTLINED_FUNCTION_5_5(v1, v0, *(uint64_t (**)(void))(v2 + 8));
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

uint64_t sub_246A5535C()
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617D08);
  v3 = sub_246A7828C();
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
      v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
      v18 = *v17;
      v19 = v17[1];
      sub_246A78484();
      sub_246A7816C();
      result = sub_246A7849C();
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
      v28 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v23);
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
                sub_246A557CC(0, (unint64_t)(v29 + 63) >> 6, v30);
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

uint64_t sub_246A55634(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_246A5535C();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_246A557E8();
      goto LABEL_22;
    }
    sub_246A55998();
  }
  v11 = *v4;
  sub_246A78484();
  sub_246A7816C();
  result = sub_246A7849C();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_246A78400(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_246A78448();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_246A78400();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

uint64_t sub_246A557CC(uint64_t result, uint64_t a2, _QWORD *a3)
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

void *sub_246A557E8()
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
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617D08);
  v2 = *v0;
  v3 = sub_246A78280();
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
  v11 = *(_QWORD *)(v2 + 56);
  v12 = -1;
  if (v10 < 64)
    v12 = ~(-1 << v10);
  v13 = v12 & v11;
  v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0)
    goto LABEL_12;
LABEL_11:
  v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v15 | (v9 << 6); ; i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    v20 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v21 = v20[1];
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * i);
    *v22 = *v20;
    v22[1] = v21;
    result = (void *)swift_bridgeObjectRetain();
    if (v13)
      goto LABEL_11;
LABEL_12:
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v14)
        goto LABEL_28;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
      {
        v9 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_28;
        v18 = *(_QWORD *)(v6 + 8 * v9);
        if (!v18)
          break;
      }
    }
LABEL_25:
    v13 = (v18 - 1) & v18;
  }
  v19 = v17 + 3;
  if (v19 >= v14)
    goto LABEL_28;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_246A55998()
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617D08);
  v3 = sub_246A7828C();
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
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v18 = *v17;
    v19 = v17[1];
    sub_246A78484();
    swift_bridgeObjectRetain();
    sub_246A7816C();
    result = sub_246A7849C();
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
    v28 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v23);
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

void OUTLINED_FUNCTION_1_6(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

BOOL OUTLINED_FUNCTION_2_8(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_3_7()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_5_5(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t OUTLINED_FUNCTION_6_5(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_246A780DC();
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return sub_246A780F4();
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return sub_246A78208();
}

_WORD *OUTLINED_FUNCTION_10_2(_WORD *result)
{
  *result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return sub_246A78400();
}

void OUTLINED_FUNCTION_12_2(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t ModelCodable.init(wrappedValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v15;

  v8 = OUTLINED_FUNCTION_8_4();
  v9 = *(_QWORD *)(v8 - 8);
  OUTLINED_FUNCTION_13_3();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v15 - v11;
  __swift_storeEnumTagSinglePayload(a4, 1, 1, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a1, v8);
  type metadata accessor for ModelCodable(0, a2, a3, v13);
  ModelCodable.wrappedValue.setter((uint64_t)v12);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
}

uint64_t ModelCodable.wrappedValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_8_4();
  v0 = OUTLINED_FUNCTION_16_1();
  return OUTLINED_FUNCTION_3_3(v0, v1, v2, v3);
}

uint64_t ModelCodable.wrappedValue.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_8_4();
  return OUTLINED_FUNCTION_3_3(v1, a1, v3, *(uint64_t (**)(void))(*(_QWORD *)(v3 - 8) + 40));
}

uint64_t type metadata accessor for ModelCodable(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ModelCodable);
}

uint64_t static AceObject.decode(from:)()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t result;
  uint64_t v8;
  id v9[5];

  OUTLINED_FUNCTION_7_4();
  v9[4] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_opt_self();
  v1 = (void *)OUTLINED_FUNCTION_3_8();
  v9[0] = 0;
  v2 = objc_msgSend(v0, sel_propertyListWithData_options_format_error_, v1, 0, 0, v9);

  if (v2)
  {
    v3 = v9[0];
    sub_246A78250();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257617D10);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v4 = (void *)sub_246A78100();
      swift_bridgeObjectRelease();
    }
    else
    {
      v4 = 0;
    }
    v6 = objc_msgSend((id)objc_opt_self(), sel_aceObjectWithDictionary_, v4);

    if (v6)
    {
      result = OUTLINED_FUNCTION_14_2();
      if (result)
        return result;

    }
    sub_246A56EF0();
    OUTLINED_FUNCTION_1_7();
    *(_QWORD *)v8 = 0xD00000000000002ELL;
    *(_QWORD *)(v8 + 8) = 0x8000000246A7F140;
    *(_BYTE *)(v8 + 16) = 1;
  }
  else
  {
    v5 = v9[0];
    sub_246A77EF0();

  }
  return swift_willThrow();
}

void *AceObject.encode()()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v8[2];

  v8[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(v0, sel_dictionary);
  if (v2)
  {
    v3 = v2;
    v8[0] = 0;
    v4 = objc_msgSend((id)objc_opt_self(), sel_dataWithPropertyList_format_options_error_, v2, 200, 0, v8);
    v5 = v8[0];
    if (v4)
    {
      v1 = (void *)sub_246A77F80();

    }
    else
    {
      v1 = v5;
      sub_246A77EF0();

      swift_willThrow();
    }

  }
  else
  {
    sub_246A56EF0();
    OUTLINED_FUNCTION_1_7();
    *(_QWORD *)v6 = 0xD000000000000037;
    *(_QWORD *)(v6 + 8) = 0x8000000246A7F170;
    *(_BYTE *)(v6 + 16) = 0;
    swift_willThrow();
  }
  return v1;
}

uint64_t sub_246A56168@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = static AceObject.decode(from:)();
  if (!v1)
    *a1 = result;
  return result;
}

void *sub_246A56190()
{
  return AceObject.encode()();
}

void static INIntent.decode(from:)()
{
  void *ObjCClassFromMetadata;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7_4();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_246A56FFC(ObjCClassFromMetadata, (SEL *)&selRef_typeName);
  if (v1)
  {
    v2 = (void *)sub_246A78130();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  v3 = (void *)OUTLINED_FUNCTION_3_8();
  v4 = (id)INIntentCreate();

  if (!v4)
    goto LABEL_7;
  if (!OUTLINED_FUNCTION_14_2())
  {

LABEL_7:
    sub_246A56EF0();
    OUTLINED_FUNCTION_1_7();
    OUTLINED_FUNCTION_0_8(v5, 0xD000000000000024);
  }
  OUTLINED_FUNCTION_10_3();
}

void INIntent.encode()()
{
  void *v0;
  unint64_t v1;

  sub_246A56F2C(objc_msgSend(v0, sel_backingStore));
  if (v1 >> 60 == 15)
    __break(1u);
}

void sub_246A562BC(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  static INIntent.decode(from:)();
  if (!v1)
    *a1 = v3;
}

void sub_246A562E4()
{
  INIntent.encode()();
}

void static INIntentResponse.decode(from:)()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;

  OUTLINED_FUNCTION_7_4();
  sub_246A563A8();
  v0 = (void *)sub_246A78130();
  swift_bridgeObjectRelease();
  v1 = (void *)OUTLINED_FUNCTION_3_8();
  v2 = (id)INIntentResponseCreate();

  if (!v2)
    goto LABEL_4;
  if (!OUTLINED_FUNCTION_14_2())
  {

LABEL_4:
    sub_246A56EF0();
    OUTLINED_FUNCTION_1_7();
    OUTLINED_FUNCTION_0_8(v3, 0xD00000000000002DLL);
  }
  OUTLINED_FUNCTION_10_3();
}

unint64_t sub_246A563A8()
{
  id v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  swift_getObjCClassFromMetadata();
  v0 = (id)INIntentSchemaGetIntentResponseDescriptionWithFacadeClass();
  v1 = v0;
  if (v0 && (v2 = v0, v3 = sub_246A56F84(v2), v4))
  {
    v5 = v3;

  }
  else
  {
    swift_bridgeObjectRelease();

    return 0xD000000000000015;
  }
  return v5;
}

void INIntentResponse.encode()()
{
  void *v0;
  id v1;
  unint64_t v2;

  v1 = objc_msgSend(v0, sel_backingStore);
  if (!v1)
  {
    __break(1u);
    goto LABEL_5;
  }
  sub_246A56F2C(v1);
  if (v2 >> 60 == 15)
LABEL_5:
    __break(1u);
}

void sub_246A56484(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  static INIntentResponse.decode(from:)();
  if (!v1)
    *a1 = v3;
}

void sub_246A564AC()
{
  INIntentResponse.encode()();
}

id INSendMessageIntent.redacted.getter()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[2];

  swift_getObjectType();
  v1 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  objc_msgSend(v0, sel_outgoingMessageType);
  v2 = (void *)sub_246A781E4();
  v3 = (void *)sub_246A78130();
  objc_msgSend(v1, sel_setValue_forKey_, v2, v3);

  sub_246A56FFC(v0, (SEL *)&selRef_content);
  v5 = v4;
  if (v4)
  {
    v6 = sub_246A78148();
    v8 = v7;
    swift_bridgeObjectRelease();
    v11[0] = v6;
    v11[1] = v8;
    v5 = sub_246A783F4();
    sub_246A57044((uint64_t)v11);
  }
  v9 = (void *)sub_246A78130();
  objc_msgSend(v1, sel_setValue_forKey_, v5, v9);
  swift_unknownObjectRelease();

  return v1;
}

id sub_246A56604@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = INSendMessageIntent.redacted.getter();
  *a1 = result;
  return result;
}

uint64_t sub_246A5662C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for ModelCodable(0, *(_QWORD *)(a3 + a2 - 16), *(_QWORD *)(a3 + a2 - 8), a4);
  return ModelCodable.wrappedValue.getter();
}

uint64_t sub_246A56664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v5 = *(_QWORD *)(a4 + a3 - 16);
  v6 = *(_QWORD *)(a4 + a3 - 8);
  v7 = sub_246A78220();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v13 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v13 - v8, a1);
  type metadata accessor for ModelCodable(0, v5, v6, v11);
  return ModelCodable.wrappedValue.setter((uint64_t)v9);
}

void ModelCodable.wrappedValue.modify(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;

  v5 = malloc(0x30uLL);
  *a1 = v5;
  *v5 = a2;
  v5[1] = v2;
  v6 = OUTLINED_FUNCTION_8_4();
  v5[2] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v5[4] = malloc(v8);
  v5[5] = malloc(v8);
  ModelCodable.wrappedValue.getter();
  OUTLINED_FUNCTION_1();
}

void sub_246A56784(uint64_t a1, char a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD **)a1;
  v3 = *(void **)(*(_QWORD *)a1 + 32);
  v4 = *(void **)(*(_QWORD *)a1 + 40);
  if ((a2 & 1) != 0)
  {
    v5 = v2[2];
    v6 = v2[3];
    (*(void (**)(_QWORD, void *, uint64_t))(v6 + 16))(*(_QWORD *)(*(_QWORD *)a1 + 32), v4, v5);
    ModelCodable.wrappedValue.setter((uint64_t)v3);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    ModelCodable.wrappedValue.setter(*(_QWORD *)(*(_QWORD *)a1 + 40));
  }
  free(v4);
  free(v3);
  free(v2);
}

void ModelCodable.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  _QWORD v38[3];
  uint64_t v39;
  uint64_t v40;

  v32 = a4;
  v8 = sub_246A78220();
  v9 = *(_QWORD *)(v8 - 8);
  OUTLINED_FUNCTION_13_3();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v29 - v11;
  v40 = type metadata accessor for ModelCodable(0, a2, a3, v13);
  v35 = *(_QWORD *)(v40 - 8);
  OUTLINED_FUNCTION_13_3();
  MEMORY[0x24BDAC7A8](v14);
  v33 = (char *)&v29 - v15;
  OUTLINED_FUNCTION_6_6((uint64_t)&v29 - v15, 1);
  v16 = a1[3];
  v34 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  sub_246A784A8();
  if (v4)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
    v26 = OUTLINED_FUNCTION_16_1();
    v28(v26, v27);
  }
  else
  {
    v29 = v12;
    v30 = v9;
    v31 = v8;
    v17 = v32;
    __swift_project_boxed_opaque_existential_1(v38, v39);
    if ((sub_246A78418() & 1) != 0)
    {
      v18 = (uint64_t)v33;
      (*(void (**)(char *, uint64_t))(v30 + 8))(v33, v31);
      OUTLINED_FUNCTION_6_6(v18, 1);
    }
    else
    {
      __swift_project_boxed_opaque_existential_1(v38, v39);
      sub_246A4CFF0();
      sub_246A7840C();
      v23 = v36;
      v24 = v37;
      v25 = (uint64_t)v29;
      (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(a3 + 8))(v36, v37, a2, a3);
      sub_246A4D02C(v23, v24);
      OUTLINED_FUNCTION_6_6(v25, 0);
      v18 = (uint64_t)v33;
      (*(void (**)(char *, uint64_t, uint64_t))(v30 + 40))(v33, v25, v31);
    }
    v19 = v17;
    v20 = v40;
    v21 = (uint64_t)v34;
    v22 = v35;
    OUTLINED_FUNCTION_17_0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v19, v18, v20);
    __swift_destroy_boxed_opaque_existential_1(v21);
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v18, v20);
  }
  OUTLINED_FUNCTION_8_1();
}

void ModelCodable.encode(to:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  _BYTE v25[24];
  uint64_t v26;
  uint64_t v27;

  v3 = v2;
  v21 = a2;
  v5 = *(_QWORD *)(a2 + 16);
  v6 = sub_246A78220();
  v7 = *(_QWORD *)(v6 - 8);
  OUTLINED_FUNCTION_13_3();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v20 - v10;
  v22 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A784C0();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v11, v3, v6);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v5) == 1)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, v26);
    sub_246A78430();
  }
  else
  {
    v14 = v22;
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v13, v11, v5);
    v15 = v27;
    v16 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v21 + 24) + 16))(v5);
    if (!v15)
    {
      v18 = v16;
      v19 = v17;
      v23 = v16;
      v24 = v17;
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, v26);
      sub_246A4D2BC();
      sub_246A78424();
      sub_246A4D02C(v18, v19);
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v13, v5);
  }
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_8_1();
}

uint64_t ModelCodable.redacted.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  _QWORD v29[3];
  uint64_t v30;
  uint64_t v31;

  v3 = v2;
  v6 = *(_QWORD *)(a1 + 16);
  v25 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_246A78220();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)v23 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v23 - v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)v23 - v17, v3, v9);
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v6) == 1)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v18, v9);
LABEL_7:
    v28 = 0;
    v26 = 0u;
    v27 = 0u;
    goto LABEL_8;
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_257617D28);
  if (!swift_dynamicCast())
    goto LABEL_7;
  if (!*((_QWORD *)&v27 + 1))
  {
LABEL_8:
    sub_246A570A0((uint64_t)&v26);
    goto LABEL_9;
  }
  v24 = a2;
  sub_246A570E0(&v26, (uint64_t)v29);
  v20 = v30;
  v19 = v31;
  v23[0] = v31;
  v23[1] = __swift_project_boxed_opaque_existential_1(v29, v30);
  *((_QWORD *)&v27 + 1) = v20;
  v28 = v19;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v26);
  sub_246A78010();
  if ((swift_dynamicCast() & 1) != 0)
  {
    OUTLINED_FUNCTION_9_4((uint64_t)v16);
    v21 = v25;
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v8, v16, v6);
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v13, v8, v6);
    OUTLINED_FUNCTION_9_4((uint64_t)v13);
    OUTLINED_FUNCTION_12_3(*(_QWORD *)(a1 + 24), v24);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  }
  OUTLINED_FUNCTION_11_2((uint64_t)v16);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  a2 = v24;
LABEL_9:
  OUTLINED_FUNCTION_11_2((uint64_t)v13);
  return OUTLINED_FUNCTION_12_3(*(_QWORD *)(a1 + 24), a2);
}

void sub_246A56EBC(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  ModelCodable.init(from:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a3);
}

void sub_246A56ED8(_QWORD *a1, uint64_t a2)
{
  ModelCodable.encode(to:)(a1, a2);
}

unint64_t sub_246A56EF0()
{
  unint64_t result;

  result = qword_257617D18;
  if (!qword_257617D18)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for CodableError, &type metadata for CodableError);
    atomic_store(result, (unint64_t *)&qword_257617D18);
  }
  return result;
}

void sub_246A56F2C(void *a1)
{
  id v2;

  v2 = objc_msgSend(a1, sel_data);

  if (v2)
  {
    sub_246A77F80();
    OUTLINED_FUNCTION_15_2();
  }
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_1();
}

uint64_t sub_246A56F84(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_type);

  if (!v2)
    return 0;
  v3 = sub_246A7813C();

  return v3;
}

void sub_246A56FF0(void *a1)
{
  sub_246A56FFC(a1, (SEL *)&selRef_content);
}

void sub_246A56FFC(void *a1, SEL *a2)
{
  if (objc_msgSend(a1, *a2))
  {
    sub_246A7813C();
    OUTLINED_FUNCTION_15_2();
  }
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_1();
}

uint64_t sub_246A57044(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE0D00] - 8) + 8))();
  return a1;
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

uint64_t sub_246A570A0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617D20);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_246A570E0(__int128 *a1, uint64_t a2)
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

uint64_t sub_246A57100()
{
  return 16;
}

__n128 sub_246A5710C(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t dispatch thunk of static CodableType.decode(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of CodableType.encode()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for CodableError()
{
  return sub_246A57164();
}

uint64_t sub_246A57164()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s18SiriMessagesCommon12CodableErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  OUTLINED_FUNCTION_9_3();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for CodableError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  OUTLINED_FUNCTION_9_3();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_246A57164();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CodableError(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_246A57164();
  return a1;
}

uint64_t getEnumTagSinglePayload for CodableError(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 1)
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

uint64_t storeEnumTagSinglePayload for CodableError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_246A572E4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_246A572EC(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CodableError()
{
  return &type metadata for CodableError;
}

uint64_t sub_246A57308()
{
  uint64_t result;
  unint64_t v1;

  result = sub_246A78220();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_246A57374(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  size_t v8;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  if (*(_DWORD *)(v6 + 84))
    v8 = *(_QWORD *)(v6 + 64);
  else
    v8 = *(_QWORD *)(v6 + 64) + 1;
  if (*(_DWORD *)(v6 + 80) > 7u || (v7 & 0x100000) != 0 || v8 > 0x18)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v7 + 16) & ~(unint64_t)v7));
    swift_retain();
  }
  else if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, *(_QWORD *)(a3 + 16)))
  {
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

uint64_t sub_246A57444(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = *(_QWORD *)(a2 + 16);
  result = __swift_getEnumTagSinglePayload(a1, 1, v3);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return result;
}

void *sub_246A57490(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  int EnumTagSinglePayload;
  uint64_t v7;
  int v8;
  size_t v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v5);
  v7 = *(_QWORD *)(v5 - 8);
  if (EnumTagSinglePayload)
  {
    v8 = *(_DWORD *)(v7 + 84);
    v9 = *(_QWORD *)(v7 + 64);
    if (v8)
      v10 = v9;
    else
      v10 = v9 + 1;
    memcpy(a1, a2, v10);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v5);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

void *sub_246A57520(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  int EnumTagSinglePayload;
  int v7;
  uint64_t v8;
  size_t v9;

  v5 = *(_QWORD *)(a3 + 16);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v5);
  v7 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v5);
  v8 = *(_QWORD *)(v5 - 8);
  if (EnumTagSinglePayload)
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(a1, a2, v5);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v5);
      return a1;
    }
  }
  else
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 24))(a1, a2, v5);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v8 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v8 + 84))
    v9 = *(_QWORD *)(v8 + 64);
  else
    v9 = *(_QWORD *)(v8 + 64) + 1;
  memcpy(a1, a2, v9);
  return a1;
}

void *sub_246A575F8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  int EnumTagSinglePayload;
  uint64_t v7;
  int v8;
  size_t v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v5);
  v7 = *(_QWORD *)(v5 - 8);
  if (EnumTagSinglePayload)
  {
    v8 = *(_DWORD *)(v7 + 84);
    v9 = *(_QWORD *)(v7 + 64);
    if (v8)
      v10 = v9;
    else
      v10 = v9 + 1;
    memcpy(a1, a2, v10);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v5);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

void *sub_246A57688(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  int EnumTagSinglePayload;
  int v7;
  uint64_t v8;
  size_t v9;

  v5 = *(_QWORD *)(a3 + 16);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v5);
  v7 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v5);
  v8 = *(_QWORD *)(v5 - 8);
  if (EnumTagSinglePayload)
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(a1, a2, v5);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v5);
      return a1;
    }
  }
  else
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 40))(a1, a2, v5);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v8 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v8 + 84))
    v9 = *(_QWORD *)(v8 + 64);
  else
    v9 = *(_QWORD *)(v8 + 64) + 1;
  memcpy(a1, a2, v9);
  return a1;
}

uint64_t sub_246A57760(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  char v10;
  int v11;
  unsigned int v12;
  int v13;
  unsigned int EnumTagSinglePayload;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  v7 = v6 - 1;
  if (!(_DWORD)v6)
    v7 = 0;
  v8 = *(_QWORD *)(v5 + 64);
  if (!(_DWORD)v6)
    ++v8;
  if (!a2)
    return 0;
  v9 = a2 - v7;
  if (a2 > v7)
  {
    v10 = 8 * v8;
    if (v8 > 3)
      goto LABEL_8;
    v12 = ((v9 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v12))
    {
      v11 = *(_DWORD *)(a1 + v8);
      if (v11)
        goto LABEL_15;
    }
    else
    {
      if (v12 <= 0xFF)
      {
        if (v12 < 2)
          goto LABEL_22;
LABEL_8:
        v11 = *(unsigned __int8 *)(a1 + v8);
        if (!*(_BYTE *)(a1 + v8))
          goto LABEL_22;
LABEL_15:
        v13 = (v11 - 1) << v10;
        if (v8 > 3)
          v13 = 0;
        if ((_DWORD)v8)
        {
          if (v8 > 3)
            LODWORD(v8) = 4;
          __asm { BR              X12 }
        }
        return v7 + v13 + 1;
      }
      v11 = *(unsigned __int16 *)(a1 + v8);
      if (*(_WORD *)(a1 + v8))
        goto LABEL_15;
    }
  }
LABEL_22:
  if (v6 < 2)
    return 0;
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a1, v6, v4);
  if (EnumTagSinglePayload >= 2)
    return EnumTagSinglePayload - 1;
  else
    return 0;
}

void sub_246A5788C(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  size_t v10;
  size_t v11;
  char v12;
  BOOL v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;

  v6 = 0;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = v8 - 1;
  if (!v8)
    v9 = 0;
  v10 = *(_QWORD *)(v7 + 64);
  if (v8)
    v11 = v10;
  else
    v11 = v10 + 1;
  v12 = 8 * v11;
  v13 = a3 >= v9;
  v14 = a3 - v9;
  if (v14 != 0 && v13)
  {
    if (v11 <= 3)
    {
      v15 = ((v14 + ~(-1 << v12)) >> v12) + 1;
      if (HIWORD(v15))
      {
        v6 = 4u;
      }
      else if (v15 >= 0x100)
      {
        v6 = 2;
      }
      else
      {
        v6 = v15 > 1;
      }
    }
    else
    {
      v6 = 1u;
    }
  }
  if (v9 < a2)
  {
    v16 = ~v9 + a2;
    if (v11 < 4)
    {
      if ((_DWORD)v11)
      {
        v17 = v16 & ~(-1 << v12);
        bzero(a1, v11);
        if ((_DWORD)v11 == 3)
        {
          *a1 = v17;
          *((_BYTE *)a1 + 2) = BYTE2(v17);
        }
        else if ((_DWORD)v11 == 2)
        {
          *a1 = v17;
        }
        else
        {
          *(_BYTE *)a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, v11);
      *(_DWORD *)a1 = v16;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X10 }
}

void sub_246A57A20()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_246A57A28()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

uint64_t OUTLINED_FUNCTION_0_8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = (v2 - 32) | 0x8000000000000000;
  *(_BYTE *)(a1 + 16) = 1;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_1_7()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_3_8()
{
  return sub_246A77F68();
}

uint64_t OUTLINED_FUNCTION_6_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  return sub_246A78220();
}

uint64_t OUTLINED_FUNCTION_9_4(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_11_2(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_12_3@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return ModelCodable.init(wrappedValue:)(v3, v2, a1, a2);
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return swift_dynamicCastUnknownClass();
}

void OUTLINED_FUNCTION_15_2()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_16_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0 - 120);
}

uint64_t sub_246A57B14()
{
  uint64_t v0;

  v0 = sub_246A780F4();
  __swift_allocate_value_buffer(v0, qword_257623F88);
  __swift_project_value_buffer(v0, (uint64_t)qword_257623F88);
  return sub_246A780E8();
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

BOOL INSendMessageIntent.hasAttachment.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BOOL8 result;

  result = 0;
  if (sub_246A58254(v0, (SEL *)&selRef_attachments, &qword_257617DD0))
  {
    OUTLINED_FUNCTION_4_5();
    v3 = v2 ? OUTLINED_FUNCTION_3_9() : *(_QWORD *)(v1 + 16);
    OUTLINED_FUNCTION_1_3();
    if (v3)
      return 1;
  }
  return result;
}

BOOL INSendMessageIntent.hasContent.getter()
{
  void *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  sub_246A56FF0(v0);
  if (!v2)
    return 0;
  v3 = v1;
  v4 = v2;
  swift_bridgeObjectRelease();
  v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0)
    v5 = v3 & 0xFFFFFFFFFFFFLL;
  return v5 != 0;
}

void INSendMessageIntent.isGroupMessage.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v1 = OUTLINED_FUNCTION_8_5(a1, (SEL *)&selRef_recipients, &qword_257617DC8);
  if (!v1
    || ((OUTLINED_FUNCTION_4_5(), v3) ? (v4 = OUTLINED_FUNCTION_3_9()) : (v4 = *(_QWORD *)(v2 + 16)),
        v1 = OUTLINED_FUNCTION_1_3(),
        v4 <= 1))
  {
    v5 = OUTLINED_FUNCTION_7_5(v1, sel_speakableGroupName);
    if (v5)

  }
  OUTLINED_FUNCTION_1();
}

BOOL INSendMessageIntent.isAudioMessage.getter()
{
  void *v0;

  return objc_msgSend(v0, sel_outgoingMessageType) == (id)2;
}

BOOL INSendMessageIntent.isTextMessage.getter()
{
  void *v0;

  return objc_msgSend(v0, sel_outgoingMessageType) == (id)1;
}

void INSendMessageIntent.supportsCorrection.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (OUTLINED_FUNCTION_8_5(a1, (SEL *)&selRef_recipients, &qword_257617DC8))
  {
    OUTLINED_FUNCTION_4_5();
    if (v2)
      v3 = OUTLINED_FUNCTION_3_9();
    else
      v3 = *(_QWORD *)(v1 + 16);
    v4 = OUTLINED_FUNCTION_1_3();
    if (v3 == 1)
    {
      v5 = OUTLINED_FUNCTION_7_5(v4, sel_speakableGroupName);

      if (!v5)
        INSendMessageIntent.hasAttachment.getter();
    }
  }
  OUTLINED_FUNCTION_1();
}

SiriMessagesCommon::TextBalloon::ServiceType __swiftcall INSendMessageIntentResponse.serviceType(appBundleIdentifier:)(Swift::String_optional appBundleIdentifier)
{
  char *v1;
  char *v2;
  unint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  uint64_t v22;
  uint64_t v23;
  char v25;
  uint64_t v26;
  uint64_t v27;
  char v29;

  v2 = v1;
  if (!appBundleIdentifier.value._object)
    goto LABEL_58;
  if (appBundleIdentifier.value._countAndFlagsBits != 0xD000000000000013
    || appBundleIdentifier.value._object != (void *)0x8000000246A7F290)
  {
    appBundleIdentifier.value._countAndFlagsBits = sub_246A78400();
    if ((appBundleIdentifier.value._countAndFlagsBits & 1) == 0)
      goto LABEL_58;
  }
  v3 = OUTLINED_FUNCTION_8_5(appBundleIdentifier.value._countAndFlagsBits, (SEL *)&selRef_sentMessages, &qword_257617DC0);
  v4 = v3;
  if (!v3)
  {
    v7 = 0;
    goto LABEL_15;
  }
  if (v3 >> 62)
  {
    appBundleIdentifier.value._countAndFlagsBits = sub_246A782EC();
    if (appBundleIdentifier.value._countAndFlagsBits)
      goto LABEL_8;
LABEL_14:
    OUTLINED_FUNCTION_2_9();
    v7 = 0;
    v4 = 0;
    goto LABEL_15;
  }
  appBundleIdentifier.value._countAndFlagsBits = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!appBundleIdentifier.value._countAndFlagsBits)
    goto LABEL_14;
LABEL_8:
  if ((v4 & 0xC000000000000001) != 0)
  {
    v5 = (id)MEMORY[0x249563548](0, v4);
  }
  else
  {
    if (!*(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return appBundleIdentifier.value._countAndFlagsBits;
    }
    v5 = *(id *)(v4 + 32);
  }
  v6 = v5;
  OUTLINED_FUNCTION_2_9();
  v7 = sub_246A582C4(v6);
  v4 = v8;
LABEL_15:
  v9 = sub_246A7813C();
  if (v4)
  {
    if (v9 == v7 && v4 == v10)
      goto LABEL_30;
    v12 = OUTLINED_FUNCTION_0_9();
    OUTLINED_FUNCTION_1_8();
    if ((v12 & 1) != 0)
      goto LABEL_31;
  }
  else
  {
    OUTLINED_FUNCTION_1_8();
  }
  v13 = sub_246A7813C();
  if (!v4)
  {
    OUTLINED_FUNCTION_1_8();
    goto LABEL_33;
  }
  if (v13 != v7 || v4 != v14)
  {
    v16 = OUTLINED_FUNCTION_0_9();
    OUTLINED_FUNCTION_1_8();
    if ((v16 & 1) != 0)
      goto LABEL_31;
LABEL_33:
    v18 = sub_246A7813C();
    if (v4)
    {
      if (v18 == v7 && v4 == v19)
        goto LABEL_48;
      v21 = OUTLINED_FUNCTION_0_9();
      OUTLINED_FUNCTION_1_8();
      if ((v21 & 1) != 0)
        goto LABEL_61;
    }
    else
    {
      OUTLINED_FUNCTION_1_8();
    }
    v22 = sub_246A7813C();
    if (!v4)
    {
      OUTLINED_FUNCTION_1_8();
LABEL_50:
      v26 = sub_246A7813C();
      if (!v4)
      {
        LOBYTE(appBundleIdentifier.value._countAndFlagsBits) = OUTLINED_FUNCTION_1_8();
        goto LABEL_58;
      }
      if (v26 != v7 || v4 != v27)
      {
        v29 = OUTLINED_FUNCTION_0_9();
        OUTLINED_FUNCTION_1_8();
        LOBYTE(appBundleIdentifier.value._countAndFlagsBits) = OUTLINED_FUNCTION_2_9();
        if ((v29 & 1) != 0)
          goto LABEL_62;
LABEL_58:
        v17 = 2;
        goto LABEL_59;
      }
      OUTLINED_FUNCTION_1_8();
LABEL_61:
      LOBYTE(appBundleIdentifier.value._countAndFlagsBits) = swift_bridgeObjectRelease();
LABEL_62:
      v17 = 1;
      goto LABEL_59;
    }
    if (v22 != v7 || v4 != v23)
    {
      v25 = OUTLINED_FUNCTION_0_9();
      OUTLINED_FUNCTION_1_8();
      if ((v25 & 1) != 0)
        goto LABEL_61;
      goto LABEL_50;
    }
LABEL_48:
    OUTLINED_FUNCTION_2_9();
    goto LABEL_61;
  }
LABEL_30:
  OUTLINED_FUNCTION_2_9();
LABEL_31:
  LOBYTE(appBundleIdentifier.value._countAndFlagsBits) = swift_bridgeObjectRelease();
  v17 = 0;
LABEL_59:
  *v2 = v17;
  return appBundleIdentifier.value._countAndFlagsBits;
}

uint64_t INIntent.launchBundleIdentifier.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[4];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576176F8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_246A58330(v0);
  v6 = v4;
  if (v5)
  {
    v9[2] = v4;
    v9[3] = v5;
    v9[0] = 0xD000000000000010;
    v9[1] = 0x8000000246A7F2B0;
    sub_246A58390();
    sub_246A583CC();
    if ((sub_246A78124() & 1) != 0)
    {
      sub_246A77F50();
      OUTLINED_FUNCTION_1_8();
      v7 = sub_246A77F5C();
      if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v7) == 1)
      {
        sub_246A4D070((uint64_t)v3);
        return 0;
      }
      else
      {
        v6 = sub_246A77F44();
        (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v3, v7);
      }
    }
  }
  return v6;
}

uint64_t INIntent.clone()()
{
  uint64_t ObjectType;
  uint64_t v2;

  ObjectType = swift_getObjectType();
  OUTLINED_FUNCTION_7_5(ObjectType, sel_copy);
  sub_246A78250();
  swift_unknownObjectRelease();
  swift_dynamicCast();
  return v2;
}

unint64_t sub_246A58230(unint64_t result, char a2, uint64_t a3)
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

uint64_t sub_246A58254(void *a1, SEL *a2, unint64_t *a3)
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = objc_msgSend(a1, *a2);
  if (!v4)
    return 0;
  v5 = v4;
  sub_246A58408(0, a3);
  v6 = sub_246A781B4();

  return v6;
}

uint64_t sub_246A582C4(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_serviceName);

  if (!v2)
    return 0;
  v3 = sub_246A7813C();

  return v3;
}

uint64_t sub_246A58330(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_launchId);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_246A7813C();

  return v3;
}

unint64_t sub_246A58390()
{
  unint64_t result;

  result = qword_257617DB0;
  if (!qword_257617DB0)
  {
    result = MEMORY[0x249563B60](MEMORY[0x24BEE0D18], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_257617DB0);
  }
  return result;
}

unint64_t sub_246A583CC()
{
  unint64_t result;

  result = qword_257617DB8;
  if (!qword_257617DB8)
  {
    result = MEMORY[0x249563B60](MEMORY[0x24BEE5E60], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_257617DB8);
  }
  return result;
}

uint64_t sub_246A58408(uint64_t a1, unint64_t *a2)
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

uint64_t OUTLINED_FUNCTION_0_9()
{
  return sub_246A78400();
}

uint64_t OUTLINED_FUNCTION_1_8()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_2_9()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_3_9()
{
  return sub_246A782EC();
}

id OUTLINED_FUNCTION_7_5(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_8_5(uint64_t a1, SEL *a2, unint64_t *a3)
{
  void *v3;

  return sub_246A58254(v3, a2, a3);
}

uint64_t sub_246A58490(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v8;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD00000000000001BLL;
  else
    v3 = 0x75416C65636E6163;
  if (v2)
    v4 = 0xEE00646E65536F74;
  else
    v4 = 0x8000000246A7EBA0;
  if ((a2 & 1) != 0)
    v5 = 0xD00000000000001BLL;
  else
    v5 = 0x75416C65636E6163;
  if ((a2 & 1) != 0)
    v6 = 0x8000000246A7EBA0;
  else
    v6 = 0xEE00646E65536F74;
  if (v3 == v5 && v4 == v6)
    v8 = 1;
  else
    v8 = sub_246A78400();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_246A5853C(uint64_t a1, uint64_t a2)
{
  return sub_246A58554(a1, a2, DirectInvocationURI.rawValue.getter);
}

uint64_t sub_246A58548(uint64_t a1, uint64_t a2)
{
  return sub_246A58554(a1, a2, DirectButton.rawValue.getter);
}

uint64_t sub_246A58554(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  v4 = a3();
  v6 = v5;
  if (v4 == a3() && v6 == v7)
    v9 = 1;
  else
    v9 = sub_246A78400();
  OUTLINED_FUNCTION_1_3();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_246A585E8(uint64_t a1)
{
  return sub_246A58720(0, a1, (void (*)(uint64_t))DirectButton.rawValue.getter);
}

uint64_t sub_246A5860C(uint64_t a1)
{
  return sub_246A58720(0, a1, (void (*)(uint64_t))DirectInvocationURI.rawValue.getter);
}

uint64_t sub_246A58630()
{
  return sub_246A58780();
}

uint64_t sub_246A5863C()
{
  sub_246A7816C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_246A586A4(uint64_t a1, uint64_t a2)
{
  return sub_246A586BC(a1, a2, (void (*)(void))DirectInvocationURI.rawValue.getter);
}

uint64_t sub_246A586B0(uint64_t a1, uint64_t a2)
{
  return sub_246A586BC(a1, a2, (void (*)(void))DirectButton.rawValue.getter);
}

uint64_t sub_246A586BC(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  sub_246A7816C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_246A58708(uint64_t a1, uint64_t a2)
{
  return sub_246A58720(a1, a2, (void (*)(uint64_t))DirectButton.rawValue.getter);
}

uint64_t sub_246A58714(uint64_t a1, uint64_t a2)
{
  return sub_246A58720(a1, a2, (void (*)(uint64_t))DirectInvocationURI.rawValue.getter);
}

uint64_t sub_246A58720(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4;

  v4 = sub_246A78484();
  a3(v4);
  sub_246A7816C();
  OUTLINED_FUNCTION_1_3();
  return sub_246A7849C();
}

uint64_t sub_246A58780()
{
  sub_246A78484();
  sub_246A7816C();
  swift_bridgeObjectRelease();
  return sub_246A7849C();
}

SiriMessagesCommon::AutoSendableButtonAction_optional __swiftcall AutoSendableButtonAction.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  SiriMessagesCommon::AutoSendableButtonAction_optional result;
  char v5;

  v2 = v1;
  v3 = sub_246A78304();
  result.value = OUTLINED_FUNCTION_1_3();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *v2 = v5;
  return result;
}

uint64_t AutoSendableButtonAction.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0xD00000000000001BLL;
  else
    return 0x75416C65636E6163;
}

uint64_t sub_246A588B4(char *a1, char *a2)
{
  return sub_246A58490(*a1, *a2);
}

unint64_t sub_246A588C4()
{
  unint64_t result;

  result = qword_257617DD8;
  if (!qword_257617DD8)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for AutoSendableButtonAction, &type metadata for AutoSendableButtonAction);
    atomic_store(result, (unint64_t *)&qword_257617DD8);
  }
  return result;
}

uint64_t sub_246A58900()
{
  return sub_246A58630();
}

uint64_t sub_246A58908()
{
  return sub_246A5863C();
}

uint64_t sub_246A58910()
{
  return sub_246A58780();
}

SiriMessagesCommon::AutoSendableButtonAction_optional sub_246A58918(Swift::String *a1)
{
  return AutoSendableButtonAction.init(rawValue:)(*a1);
}

uint64_t sub_246A58924@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = AutoSendableButtonAction.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_246A58948()
{
  sub_246A58AF4();
  return sub_246A781A8();
}

uint64_t sub_246A589A4()
{
  sub_246A58AF4();
  return sub_246A7819C();
}

uint64_t dispatch thunk of AutoSendableButton.shouldAutoSend.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of AutoSendableButton.autoSendTimeout.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of AutoSendableButton.delayedActionCancelCommand.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of AutoSendableButton.handleIntent.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of AutoSendableButton.speechSynthesisId.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of AutoSendableButton.isFirstPartyApp.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of AutoSendableButton.responseMode.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t storeEnumTagSinglePayload for AutoSendableButtonAction(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A58A74 + 4 * byte_246A7A925[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_246A58AA8 + 4 * byte_246A7A920[v4]))();
}

uint64_t sub_246A58AA8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A58AB0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A58AB8);
  return result;
}

uint64_t sub_246A58AC4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A58ACCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_246A58AD0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A58AD8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AutoSendableButtonAction()
{
  return &type metadata for AutoSendableButtonAction;
}

unint64_t sub_246A58AF4()
{
  unint64_t result;

  result = qword_257617DE0;
  if (!qword_257617DE0)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for AutoSendableButtonAction, &type metadata for AutoSendableButtonAction);
    atomic_store(result, (unint64_t *)&qword_257617DE0);
  }
  return result;
}

SiriMessagesCommon::CancelAutoSend __swiftcall CancelAutoSend.init()()
{
  _BYTE *v0;
  SiriMessagesCommon::CancelAutoSend result;

  *v0 = 1;
  return result;
}

uint64_t sub_246A58B3C(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x75416C65636E6163 && a2 == 0xEE00646E65536F74)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_246A78400();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_246A58BD8()
{
  return 0x75416C65636E6163;
}

uint64_t sub_246A58C00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A58B3C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_246A58C28()
{
  sub_246A58D24();
  return sub_246A784D8();
}

uint64_t sub_246A58C50()
{
  sub_246A58D24();
  return sub_246A784E4();
}

void CancelAutoSend.encode(to:)(_QWORD *a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257617DE8);
  OUTLINED_FUNCTION_3_10();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_2_10();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A58D24();
  sub_246A784CC();
  sub_246A783B8();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_8_1();
}

unint64_t sub_246A58D24()
{
  unint64_t result;

  result = qword_257617DF0;
  if (!qword_257617DF0)
  {
    result = MEMORY[0x249563B60](&unk_246A7ABF8, &type metadata for CancelAutoSend.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617DF0);
  }
  return result;
}

void CancelAutoSend.init(from:)(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  char v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257617DF8);
  OUTLINED_FUNCTION_3_10();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_2_10();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A58D24();
  sub_246A784B4();
  if (!v2)
  {
    v6 = sub_246A7834C();
    OUTLINED_FUNCTION_1_9();
    *a2 = v6 & 1;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  OUTLINED_FUNCTION_8_1();
}

uint64_t sub_246A58E2C()
{
  sub_246A591CC();
  sub_246A59208();
  return sub_246A78028();
}

uint64_t sub_246A58E94()
{
  sub_246A591CC();
  sub_246A59208();
  return sub_246A7801C();
}

void sub_246A58EE4(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  CancelAutoSend.init(from:)(a1, a2);
}

void sub_246A58EF8(_QWORD *a1)
{
  CancelAutoSend.encode(to:)(a1);
}

uint64_t getEnumTagSinglePayload for CancelAutoSend(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFF)
  {
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
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for CancelAutoSend(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A58FF0 + 4 * byte_246A7AA85[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_246A59024 + 4 * byte_246A7AA80[v4]))();
}

uint64_t sub_246A59024(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A5902C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A59034);
  return result;
}

uint64_t sub_246A59040(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A59048);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_246A5904C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A59054(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CancelAutoSend()
{
  return &type metadata for CancelAutoSend;
}

uint64_t storeEnumTagSinglePayload for CancelAutoSend.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_246A590B0 + 4 * byte_246A7AA8A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_246A590D0 + 4 * byte_246A7AA8F[v4]))();
}

_BYTE *sub_246A590B0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_246A590D0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_246A590D8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_246A590E0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_246A590E8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_246A590F0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for CancelAutoSend.CodingKeys()
{
  return &type metadata for CancelAutoSend.CodingKeys;
}

unint64_t sub_246A59110()
{
  unint64_t result;

  result = qword_257617E00;
  if (!qword_257617E00)
  {
    result = MEMORY[0x249563B60](&unk_246A7ABD0, &type metadata for CancelAutoSend.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617E00);
  }
  return result;
}

unint64_t sub_246A59150()
{
  unint64_t result;

  result = qword_257617E08;
  if (!qword_257617E08)
  {
    result = MEMORY[0x249563B60](&unk_246A7AB40, &type metadata for CancelAutoSend.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617E08);
  }
  return result;
}

unint64_t sub_246A59190()
{
  unint64_t result;

  result = qword_257617E10;
  if (!qword_257617E10)
  {
    result = MEMORY[0x249563B60](&unk_246A7AB68, &type metadata for CancelAutoSend.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617E10);
  }
  return result;
}

unint64_t sub_246A591CC()
{
  unint64_t result;

  result = qword_257617E18;
  if (!qword_257617E18)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for CancelAutoSend, &type metadata for CancelAutoSend);
    atomic_store(result, (unint64_t *)&qword_257617E18);
  }
  return result;
}

unint64_t sub_246A59208()
{
  unint64_t result;

  result = qword_257617E20;
  if (!qword_257617E20)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for CancelAutoSend, &type metadata for CancelAutoSend);
    atomic_store(result, (unint64_t *)&qword_257617E20);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

void SnippetLabels.send.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_9();
}

void SnippetLabels.undoSend.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_9();
}

void SnippetLabels.cancel.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_9();
}

void SnippetLabels.change.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_9();
}

void SnippetLabels.done.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_9();
}

void SnippetLabels.audioMessage.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_9();
}

void SnippetLabels.readingInProgress.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_9();
}

void SnippetLabels.unreadMessages.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_9();
}

void SnippetLabels.to.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_9();
}

void SnippetLabels.changeContact.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_9();
}

void SnippetLabels.placeholderAttachment.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_9();
}

void __swiftcall SnippetLabels.init(send:undoSend:cancel:change:done:audioMessage:readingInProgress:unreadMessages:to:changeContact:placeholderAttachment:)(SiriMessagesCommon::SnippetLabels *__return_ptr retstr, Swift::String send, Swift::String undoSend, Swift::String cancel, Swift::String change, Swift::String done, Swift::String audioMessage, Swift::String readingInProgress, Swift::String unreadMessages, Swift::String to, Swift::String changeContact, Swift::String placeholderAttachment)
{
  retstr->send = send;
  retstr->undoSend = undoSend;
  retstr->cancel = cancel;
  retstr->change = change;
  retstr->done = done;
  retstr->audioMessage = audioMessage;
  retstr->readingInProgress = readingInProgress;
  retstr->unreadMessages = unreadMessages;
  retstr->to = to;
  retstr->changeContact = changeContact;
  retstr->placeholderAttachment = placeholderAttachment;
}

uint64_t sub_246A59414(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  char v14;

  v3 = a1 == 1684956531 && a2 == 0xE400000000000000;
  if (v3 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x646E65536F646E75 && a2 == 0xE800000000000000;
    if (v6 || (sub_246A78400() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6C65636E6163 && a2 == 0xE600000000000000;
      if (v7 || (sub_246A78400() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x65676E616863 && a2 == 0xE600000000000000;
        if (v8 || (sub_246A78400() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 1701736292 && a2 == 0xE400000000000000;
          if (v9 || (sub_246A78400() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            v10 = a1 == 0x73654D6F69647561 && a2 == 0xEC00000065676173;
            if (v10 || (sub_246A78400() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else if (a1 == 0xD000000000000011 && a2 == 0x8000000246A7F2D0 || (sub_246A78400() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else
            {
              v11 = a1 == 0x654D646165726E75 && a2 == 0xEE00736567617373;
              if (v11 || (sub_246A78400() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 7;
              }
              else
              {
                v12 = a1 == 28532 && a2 == 0xE200000000000000;
                if (v12 || (sub_246A78400() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 8;
                }
                else
                {
                  v13 = a1 == 0x6F4365676E616863 && a2 == 0xED0000746361746ELL;
                  if (v13 || (sub_246A78400() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 9;
                  }
                  else if (a1 == 0xD000000000000015 && a2 == 0x8000000246A7F2F0)
                  {
                    swift_bridgeObjectRelease();
                    return 10;
                  }
                  else
                  {
                    v14 = sub_246A78400();
                    swift_bridgeObjectRelease();
                    if ((v14 & 1) != 0)
                      return 10;
                    else
                      return 11;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_246A5980C()
{
  return 11;
}

uint64_t sub_246A59814(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_246A5984C + 4 * byte_246A7AC50[a1]))(0xD000000000000011, 0x8000000246A7F2D0);
}

uint64_t sub_246A5984C()
{
  return 1684956531;
}

uint64_t sub_246A5985C()
{
  return 0x646E65536F646E75;
}

uint64_t sub_246A59874()
{
  return 0x6C65636E6163;
}

uint64_t sub_246A59888()
{
  return 0x65676E616863;
}

uint64_t sub_246A5989C()
{
  return 1701736292;
}

uint64_t sub_246A598AC()
{
  return 0x73654D6F69647561;
}

uint64_t sub_246A598CC()
{
  return 0x654D646165726E75;
}

uint64_t sub_246A598F0()
{
  return 0x6F4365676E616863;
}

uint64_t sub_246A59914(uint64_t a1)
{
  return a1 + 4;
}

uint64_t sub_246A5992C()
{
  return 28532;
}

uint64_t sub_246A59938()
{
  unsigned __int8 *v0;

  return sub_246A59814(*v0);
}

uint64_t sub_246A59940@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A59414(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A59964@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_246A5980C();
  *a1 = result;
  return result;
}

uint64_t sub_246A59988()
{
  sub_246A59C78();
  return sub_246A784D8();
}

uint64_t sub_246A599B0()
{
  sub_246A59C78();
  return sub_246A784E4();
}

void SnippetLabels.encode(to:)(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  _QWORD v17[22];
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;
  char v27;
  char v28;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617ED8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = v1[2];
  v17[19] = v1[3];
  v17[20] = v7;
  v8 = v1[4];
  v17[17] = v1[5];
  v17[18] = v8;
  v9 = v1[6];
  v17[15] = v1[7];
  v17[16] = v9;
  v10 = v1[8];
  v17[13] = v1[9];
  v17[14] = v10;
  v11 = v1[10];
  v17[11] = v1[11];
  v17[12] = v11;
  v12 = v1[13];
  v17[9] = v1[12];
  v17[10] = v12;
  v13 = v1[14];
  v17[7] = v1[15];
  v17[8] = v13;
  v14 = v1[16];
  v17[5] = v1[17];
  v17[6] = v14;
  v15 = v1[18];
  v17[3] = v1[19];
  v17[4] = v15;
  v17[2] = v1[20];
  v17[1] = v1[21];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A59C78();
  sub_246A784CC();
  v28 = 0;
  v16 = v17[21];
  sub_246A783AC();
  if (!v16)
  {
    v27 = 1;
    OUTLINED_FUNCTION_2_11();
    v26 = 2;
    OUTLINED_FUNCTION_2_11();
    v25 = 3;
    OUTLINED_FUNCTION_2_11();
    v24 = 4;
    OUTLINED_FUNCTION_2_11();
    v23 = 5;
    OUTLINED_FUNCTION_2_11();
    v22 = 6;
    OUTLINED_FUNCTION_2_11();
    v21 = 7;
    OUTLINED_FUNCTION_2_11();
    v20 = 8;
    OUTLINED_FUNCTION_2_11();
    v19 = 9;
    OUTLINED_FUNCTION_2_11();
    v18 = 10;
    OUTLINED_FUNCTION_2_11();
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  OUTLINED_FUNCTION_8_1();
}

unint64_t sub_246A59C78()
{
  unint64_t result;

  result = qword_257617EE0;
  if (!qword_257617EE0)
  {
    result = MEMORY[0x249563B60](&unk_246A7ADD4, &type metadata for SnippetLabels.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617EE0);
  }
  return result;
}

void SnippetLabels.init(from:)(_QWORD *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2;
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
  void *v52;
  _QWORD v53[22];
  _QWORD v54[23];
  int v55;
  char v56;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617EE8);
  MEMORY[0x24BDAC7A8](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A59C78();
  sub_246A784B4();
  if (v2)
  {
    OUTLINED_FUNCTION_22_1();
    v55 = 0;
  }
  else
  {
    v52 = a2;
    v6 = OUTLINED_FUNCTION_0_10();
    v8 = v7;
    OUTLINED_FUNCTION_9_3();
    v51 = v8;
    v9 = OUTLINED_FUNCTION_0_10();
    v11 = v10;
    v41 = v9;
    OUTLINED_FUNCTION_9_3();
    v50 = v11;
    v12 = OUTLINED_FUNCTION_0_10();
    v14 = v13;
    v40 = v12;
    OUTLINED_FUNCTION_9_3();
    v49 = v14;
    v15 = OUTLINED_FUNCTION_0_10();
    v17 = v16;
    v39 = v15;
    OUTLINED_FUNCTION_9_3();
    v48 = v17;
    v18 = OUTLINED_FUNCTION_0_10();
    v20 = v19;
    v38 = v18;
    OUTLINED_FUNCTION_9_3();
    v47 = v20;
    v37 = OUTLINED_FUNCTION_0_10();
    v22 = v21;
    OUTLINED_FUNCTION_9_3();
    v46 = v22;
    v36 = OUTLINED_FUNCTION_0_10();
    v24 = v23;
    OUTLINED_FUNCTION_9_3();
    v25 = OUTLINED_FUNCTION_0_10();
    v55 = 1;
    v44 = v26;
    v45 = v24;
    v35 = v25;
    OUTLINED_FUNCTION_9_3();
    v34 = OUTLINED_FUNCTION_0_10();
    LOBYTE(v54[0]) = 9;
    v43 = v27;
    OUTLINED_FUNCTION_9_3();
    v28 = OUTLINED_FUNCTION_0_10();
    v42 = v29;
    v30 = v28;
    v56 = 10;
    swift_bridgeObjectRetain();
    v31 = sub_246A78340();
    v33 = v32;
    OUTLINED_FUNCTION_1_10();
    v53[0] = v6;
    v53[1] = v51;
    v53[2] = v41;
    v53[3] = v50;
    v53[4] = v40;
    v53[5] = v49;
    v53[6] = v39;
    v53[7] = v48;
    v53[8] = v38;
    v53[9] = v47;
    v53[10] = v37;
    v53[11] = v46;
    v53[12] = v36;
    v53[13] = v45;
    v53[14] = v35;
    v53[15] = v44;
    v53[16] = v34;
    v53[17] = v43;
    v53[18] = v30;
    v53[19] = v42;
    v53[20] = v31;
    v53[21] = v33;
    sub_246A48720((uint64_t)v53);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_8_6();
    OUTLINED_FUNCTION_13_4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_10_4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    memcpy(v52, v53, 0xB0uLL);
    OUTLINED_FUNCTION_22_1();
    v54[0] = v6;
    v54[1] = v51;
    v54[2] = v41;
    v54[3] = v50;
    v54[4] = v40;
    v54[5] = v49;
    v54[6] = v39;
    v54[7] = v48;
    v54[8] = v38;
    v54[9] = v47;
    v54[10] = v37;
    v54[11] = v46;
    v54[12] = v36;
    v54[13] = v45;
    v54[14] = v35;
    v54[15] = v44;
    v54[16] = v34;
    v54[17] = v43;
    v54[18] = v30;
    v54[19] = v42;
    v54[20] = v31;
    v54[21] = v33;
    sub_246A5A2DC((uint64_t)v54);
  }
  OUTLINED_FUNCTION_8_1();
}

uint64_t sub_246A5A2DC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
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

void sub_246A5A3A8(_QWORD *a1@<X0>, void *a2@<X8>)
{
  SnippetLabels.init(from:)(a1, a2);
}

void sub_246A5A3BC(_QWORD *a1)
{
  SnippetLabels.encode(to:)(a1);
}

void sub_246A5A3D0()
{
  qword_257617E28 = 1684956499;
  qword_257617E30 = 0xE400000000000000;
  qword_257617E38 = 0x6E6553206F646E55;
  unk_257617E40 = 0xE900000000000064;
  qword_257617E48 = 0x6C65636E6143;
  qword_257617E50 = 0xE600000000000000;
  qword_257617E58 = 0x65676E616843;
  unk_257617E60 = 0xE600000000000000;
  qword_257617E68 = 1701736260;
  qword_257617E70 = 0xE400000000000000;
  strcpy((char *)&qword_257617E78, "Audio Message");
  unk_257617E86 = -4864;
  qword_257617E88 = 0xE2676E6964616552;
  qword_257617E90 = 0xAA0000000000A680;
  qword_257617E98 = 0x4D20646165726E55;
  qword_257617EA0 = 0xEF73656761737365;
  qword_257617EA8 = 28500;
  qword_257617EB0 = 0xE200000000000000;
  strcpy((char *)&qword_257617EB8, "Change Contact");
  HIBYTE(qword_257617EC0) = -18;
  qword_257617EC8 = 0xD000000000000014;
  unk_257617ED0 = 0x8000000246A7F310;
}

void static LabelsProvider.current.getter()
{
  void *v0;
  const void *v1;
  _BYTE v2[176];

  if (qword_2576171F0 != -1)
    swift_once();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_24(v2);
  v0 = (void *)OUTLINED_FUNCTION_16_1();
  memcpy(v0, v1, 0xB0uLL);
  sub_246A48720((uint64_t)v2);
  OUTLINED_FUNCTION_20_1();
}

void static LabelsProvider.current.setter(const void *a1)
{
  _BYTE v2[176];

  if (qword_2576171F0 != -1)
    swift_once();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_24(v2);
  memcpy(&qword_257617E28, a1, 0xB0uLL);
  sub_246A5A2DC((uint64_t)v2);
  OUTLINED_FUNCTION_20_1();
}

void static LabelsProvider.current.modify()
{
  if (qword_2576171F0 != -1)
    swift_once();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_9();
}

uint64_t destroy for SnippetLabels()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for SnippetLabels(_QWORD *a1, _QWORD *a2)
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
  v11 = a2[17];
  a1[16] = a2[16];
  a1[17] = v11;
  v12 = a2[19];
  a1[18] = a2[18];
  a1[19] = v12;
  v13 = a2[21];
  a1[20] = a2[20];
  a1[21] = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
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

_QWORD *assignWithCopy for SnippetLabels(_QWORD *a1, _QWORD *a2)
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
  a1[16] = a2[16];
  a1[17] = a2[17];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[18] = a2[18];
  a1[19] = a2[19];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[20] = a2[20];
  a1[21] = a2[21];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy176_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xB0uLL);
}

_QWORD *assignWithTake for SnippetLabels(_QWORD *a1, _QWORD *a2)
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
  v12 = a2[17];
  a1[16] = a2[16];
  a1[17] = v12;
  swift_bridgeObjectRelease();
  v13 = a2[19];
  a1[18] = a2[18];
  a1[19] = v13;
  swift_bridgeObjectRelease();
  v14 = a2[21];
  a1[20] = a2[20];
  a1[21] = v14;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SnippetLabels(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 176))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for SnippetLabels(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 168) = 0;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
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
      *(_BYTE *)(result + 176) = 1;
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
    *(_BYTE *)(result + 176) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SnippetLabels()
{
  return &type metadata for SnippetLabels;
}

ValueMetadata *type metadata accessor for LabelsProvider()
{
  return &type metadata for LabelsProvider;
}

uint64_t getEnumTagSinglePayload for SnippetLabels.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xF6)
  {
    if (a2 + 10 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 10) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 11;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xB;
  v5 = v6 - 11;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SnippetLabels.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 10 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 10) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF5)
    return ((uint64_t (*)(void))((char *)&loc_246A5ABB4 + 4 * byte_246A7AC60[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_246A5ABE8 + 4 * byte_246A7AC5B[v4]))();
}

uint64_t sub_246A5ABE8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A5ABF0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A5ABF8);
  return result;
}

uint64_t sub_246A5AC04(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A5AC0CLL);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_246A5AC10(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A5AC18(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SnippetLabels.CodingKeys()
{
  return &type metadata for SnippetLabels.CodingKeys;
}

unint64_t sub_246A5AC38()
{
  unint64_t result;

  result = qword_257617EF0;
  if (!qword_257617EF0)
  {
    result = MEMORY[0x249563B60](&unk_246A7ADAC, &type metadata for SnippetLabels.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617EF0);
  }
  return result;
}

unint64_t sub_246A5AC78()
{
  unint64_t result;

  result = qword_257617EF8;
  if (!qword_257617EF8)
  {
    result = MEMORY[0x249563B60](&unk_246A7AD1C, &type metadata for SnippetLabels.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617EF8);
  }
  return result;
}

unint64_t sub_246A5ACB8()
{
  unint64_t result;

  result = qword_257617F00;
  if (!qword_257617F00)
  {
    result = MEMORY[0x249563B60](&unk_246A7AD44, &type metadata for SnippetLabels.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617F00);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_10()
{
  return sub_246A78340();
}

uint64_t OUTLINED_FUNCTION_1_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_2_11()
{
  return sub_246A783AC();
}

uint64_t OUTLINED_FUNCTION_6_7()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_7_6()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_8_6()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_10_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_13_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_15_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_16_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_22_1()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v0 + 176));
}

void __swiftcall CarPlayHeader.init(contactName:contactIdentifiers:shouldShowAnnounceButton:isAnnounceEnabled:appBundleIdentifier:)(SiriMessagesCommon::CarPlayHeader *__return_ptr retstr, Swift::String contactName, Swift::OpaquePointer contactIdentifiers, Swift::Bool shouldShowAnnounceButton, Swift::Bool isAnnounceEnabled, Swift::String appBundleIdentifier)
{
  retstr->contactName = contactName;
  retstr->contactIdentifiers = contactIdentifiers;
  retstr->shouldShowAnnounceButton = shouldShowAnnounceButton;
  retstr->isAnnounceEnabled = isAnnounceEnabled;
  retstr->appBundleIdentifier = appBundleIdentifier;
}

uint64_t CarPlayHeader.contactName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  OUTLINED_FUNCTION_5_4();
  return v1;
}

void CarPlayHeader.contactName.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t (*CarPlayHeader.contactName.modify())()
{
  return nullsub_1;
}

uint64_t CarPlayHeader.contactIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CarPlayHeader.contactIdentifiers.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*CarPlayHeader.contactIdentifiers.modify())()
{
  return nullsub_1;
}

uint64_t CarPlayHeader.shouldShowAnnounceButton.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t CarPlayHeader.shouldShowAnnounceButton.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 24) = result;
  return result;
}

uint64_t (*CarPlayHeader.shouldShowAnnounceButton.modify())()
{
  return nullsub_1;
}

uint64_t CarPlayHeader.isAnnounceEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 25);
}

uint64_t CarPlayHeader.isAnnounceEnabled.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 25) = result;
  return result;
}

uint64_t (*CarPlayHeader.isAnnounceEnabled.modify())()
{
  return nullsub_1;
}

uint64_t CarPlayHeader.appBundleIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  OUTLINED_FUNCTION_5_4();
  return v1;
}

void CarPlayHeader.appBundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t (*CarPlayHeader.appBundleIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t sub_246A5AEF0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x4E746361746E6F63 && a2 == 0xEB00000000656D61;
  if (v3 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000246A7F330 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x8000000246A7F350 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000246A7F370 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000246A7F390)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_246A78400();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_246A5B0F0(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_246A5B12C + 4 * byte_246A7AE30[a1]))(0xD000000000000012, 0x8000000246A7F330);
}

uint64_t sub_246A5B12C()
{
  return 0x4E746361746E6F63;
}

uint64_t sub_246A5B14C()
{
  uint64_t v0;

  return v0 + 7;
}

uint64_t sub_246A5B190()
{
  unsigned __int8 *v0;

  return sub_246A5B0F0(*v0);
}

uint64_t sub_246A5B198@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A5AEF0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A5B1BC()
{
  sub_246A5B3C8();
  return sub_246A784D8();
}

uint64_t sub_246A5B1E4()
{
  sub_246A5B3C8();
  return sub_246A784E4();
}

void CarPlayHeader.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617F08);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(_QWORD *)(v1 + 16);
  v7 = *(unsigned __int8 *)(v1 + 24);
  v11 = *(unsigned __int8 *)(v1 + 25);
  v12 = v7;
  v8 = *(_QWORD *)(v1 + 32);
  v10[0] = *(_QWORD *)(v1 + 40);
  v10[1] = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A5B3C8();
  sub_246A784CC();
  v20 = 0;
  v9 = v14;
  sub_246A783AC();
  if (!v9)
  {
    v15 = v13;
    v19 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257617F18);
    sub_246A5B404();
    sub_246A783D0();
    v18 = 2;
    OUTLINED_FUNCTION_4_6();
    v17 = 3;
    OUTLINED_FUNCTION_4_6();
    v16 = 4;
    sub_246A783AC();
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  OUTLINED_FUNCTION_8_1();
}

unint64_t sub_246A5B3C8()
{
  unint64_t result;

  result = qword_257617F10;
  if (!qword_257617F10)
  {
    result = MEMORY[0x249563B60](&unk_246A7AFA4, &type metadata for CarPlayHeader.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617F10);
  }
  return result;
}

unint64_t sub_246A5B404()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_257617F20;
  if (!qword_257617F20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257617F18);
    v2 = sub_246A5B758(&qword_257617F28, MEMORY[0x24BEE0D08], MEMORY[0x24BEE4AA8]);
    result = MEMORY[0x249563B60](MEMORY[0x24BEE12A0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_257617F20);
  }
  return result;
}

void CarPlayHeader.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617F38);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A5B3C8();
  sub_246A784B4();
  if (v2)
  {
    OUTLINED_FUNCTION_4_3();
  }
  else
  {
    v7 = OUTLINED_FUNCTION_2_12();
    v9 = v8;
    v17 = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257617F18);
    sub_246A5B6DC();
    swift_bridgeObjectRetain();
    sub_246A78364();
    swift_bridgeObjectRetain();
    v16 = sub_246A7834C();
    v15 = sub_246A7834C();
    v10 = OUTLINED_FUNCTION_2_12();
    v12 = v11;
    v13 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    v14 = v10;
    OUTLINED_FUNCTION_0_11(v13);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_3_11();
    *(_QWORD *)a2 = v17;
    *(_QWORD *)(a2 + 8) = v9;
    *(_QWORD *)(a2 + 16) = v18;
    *(_BYTE *)(a2 + 24) = v16 & 1;
    *(_BYTE *)(a2 + 25) = v15 & 1;
    *(_QWORD *)(a2 + 32) = v14;
    *(_QWORD *)(a2 + 40) = v12;
    OUTLINED_FUNCTION_4_3();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_8_1();
}

unint64_t sub_246A5B6DC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_257617F40;
  if (!qword_257617F40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257617F18);
    v2 = sub_246A5B758(&qword_257617F48, MEMORY[0x24BEE0D38], MEMORY[0x24BEE4AC0]);
    result = MEMORY[0x249563B60](MEMORY[0x24BEE12D0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_257617F40);
  }
  return result;
}

uint64_t sub_246A5B758(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257617F30);
    v8 = a2;
    result = MEMORY[0x249563B60](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

void sub_246A5B7B8(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  CarPlayHeader.init(from:)(a1, a2);
}

void sub_246A5B7CC(_QWORD *a1)
{
  CarPlayHeader.encode(to:)(a1);
}

uint64_t destroy for CarPlayHeader()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CarPlayHeader(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CarPlayHeader(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for CarPlayHeader(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CarPlayHeader(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for CarPlayHeader(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CarPlayHeader()
{
  return &type metadata for CarPlayHeader;
}

uint64_t storeEnumTagSinglePayload for CarPlayHeader.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A5BA60 + 4 * byte_246A7AE3A[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_246A5BA94 + 4 * byte_246A7AE35[v4]))();
}

uint64_t sub_246A5BA94(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A5BA9C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A5BAA4);
  return result;
}

uint64_t sub_246A5BAB0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A5BAB8);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_246A5BABC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A5BAC4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CarPlayHeader.CodingKeys()
{
  return &type metadata for CarPlayHeader.CodingKeys;
}

unint64_t sub_246A5BAE4()
{
  unint64_t result;

  result = qword_257617F50;
  if (!qword_257617F50)
  {
    result = MEMORY[0x249563B60](&unk_246A7AF7C, &type metadata for CarPlayHeader.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617F50);
  }
  return result;
}

unint64_t sub_246A5BB24()
{
  unint64_t result;

  result = qword_257617F58;
  if (!qword_257617F58)
  {
    result = MEMORY[0x249563B60](&unk_246A7AEEC, &type metadata for CarPlayHeader.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617F58);
  }
  return result;
}

unint64_t sub_246A5BB64()
{
  unint64_t result;

  result = qword_257617F60;
  if (!qword_257617F60)
  {
    result = MEMORY[0x249563B60](&unk_246A7AF14, &type metadata for CarPlayHeader.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617F60);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_11@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_2_12()
{
  return sub_246A78340();
}

uint64_t OUTLINED_FUNCTION_3_11()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  return sub_246A783B8();
}

SiriMessagesCommon::UnreadMessagesCompactCarPlayButton __swiftcall UnreadMessagesCompactCarPlayButton.init(text:)(Swift::String text)
{
  uint64_t *v1;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  SiriMessagesCommon::UnreadMessagesCompactCarPlayButton result;

  object = text._object;
  countAndFlagsBits = text._countAndFlagsBits;
  v4 = v1;
  if (qword_2576171F0 != -1)
    swift_once();
  swift_beginAccess();
  v6 = qword_257617E98;
  v5 = qword_257617EA0;
  *v4 = countAndFlagsBits;
  v4[1] = (uint64_t)object;
  v4[2] = v6;
  v4[3] = v5;
  v7 = swift_bridgeObjectRetain();
  result.unreadMessagesLabelText._object = v10;
  result.unreadMessagesLabelText._countAndFlagsBits = v9;
  result.text._object = v8;
  result.text._countAndFlagsBits = v7;
  return result;
}

uint64_t UnreadMessagesCompactCarPlayButton.text.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  OUTLINED_FUNCTION_5_4();
  return v1;
}

void UnreadMessagesCompactCarPlayButton.text.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t (*UnreadMessagesCompactCarPlayButton.text.modify())()
{
  return nullsub_1;
}

uint64_t UnreadMessagesCompactCarPlayButton.unreadMessagesLabelText.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  OUTLINED_FUNCTION_5_4();
  return v1;
}

void UnreadMessagesCompactCarPlayButton.unreadMessagesLabelText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t (*UnreadMessagesCompactCarPlayButton.unreadMessagesLabelText.modify())()
{
  return nullsub_1;
}

uint64_t sub_246A5BD24()
{
  sub_246A5BE7C();
  return sub_246A784D8();
}

uint64_t sub_246A5BD4C()
{
  sub_246A5BE7C();
  return sub_246A784E4();
}

void UnreadMessagesCompactCarPlayButton.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  char v10;
  char v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617F68);
  v9 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v8[1] = *(_QWORD *)(v1 + 24);
  v8[2] = v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A5BE7C();
  sub_246A784CC();
  v11 = 0;
  OUTLINED_FUNCTION_3_4();
  if (!v2)
  {
    v10 = 1;
    OUTLINED_FUNCTION_3_4();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v4);
  OUTLINED_FUNCTION_8_1();
}

unint64_t sub_246A5BE7C()
{
  unint64_t result;

  result = qword_257617F70;
  if (!qword_257617F70)
  {
    result = MEMORY[0x249563B60](&unk_246A7B178, &type metadata for UnreadMessagesCompactCarPlayButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617F70);
  }
  return result;
}

void UnreadMessagesCompactCarPlayButton.init(from:)(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617F78);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  if (qword_2576171F0 != -1)
    swift_once();
  swift_beginAccess();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A5BE7C();
  swift_bridgeObjectRetain();
  sub_246A784B4();
  if (v2)
  {
    OUTLINED_FUNCTION_4_3();
  }
  else
  {
    v6 = OUTLINED_FUNCTION_2_4();
    v8 = v7;
    swift_bridgeObjectRetain();
    v9 = OUTLINED_FUNCTION_2_4();
    v11 = v10;
    v12 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    v13 = v9;
    OUTLINED_FUNCTION_1_4(v12);
    OUTLINED_FUNCTION_5_4();
    swift_bridgeObjectRelease();
    *a2 = v6;
    a2[1] = v8;
    a2[2] = v13;
    a2[3] = v11;
    OUTLINED_FUNCTION_4_3();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_8_1();
}

void sub_246A5C06C(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  UnreadMessagesCompactCarPlayButton.init(from:)(a1, a2);
}

void sub_246A5C080(_QWORD *a1)
{
  UnreadMessagesCompactCarPlayButton.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for UnreadMessagesCompactCarPlayButton()
{
  return &type metadata for UnreadMessagesCompactCarPlayButton;
}

uint64_t storeEnumTagSinglePayload for UnreadMessagesCompactCarPlayButton.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A5C0F0 + 4 * byte_246A7B005[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_246A5C124 + 4 * byte_246A7B000[v4]))();
}

uint64_t sub_246A5C124(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A5C12C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A5C134);
  return result;
}

uint64_t sub_246A5C140(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A5C148);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_246A5C14C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A5C154(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UnreadMessagesCompactCarPlayButton.CodingKeys()
{
  return &type metadata for UnreadMessagesCompactCarPlayButton.CodingKeys;
}

unint64_t sub_246A5C174()
{
  unint64_t result;

  result = qword_257617F80;
  if (!qword_257617F80)
  {
    result = MEMORY[0x249563B60](&unk_246A7B150, &type metadata for UnreadMessagesCompactCarPlayButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617F80);
  }
  return result;
}

unint64_t sub_246A5C1B4()
{
  unint64_t result;

  result = qword_257617F88;
  if (!qword_257617F88)
  {
    result = MEMORY[0x249563B60](&unk_246A7B0C0, &type metadata for UnreadMessagesCompactCarPlayButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617F88);
  }
  return result;
}

unint64_t sub_246A5C1F4()
{
  unint64_t result;

  result = qword_257617F90;
  if (!qword_257617F90)
  {
    result = MEMORY[0x249563B60](&unk_246A7B0E8, &type metadata for UnreadMessagesCompactCarPlayButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617F90);
  }
  return result;
}

uint64_t MessageDraftSnippetModel.id.getter()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  sub_246A77FA4();
  v0 = OUTLINED_FUNCTION_16_1();
  return v1(v0);
}

void MessageDraftSnippetModel.intent.getter()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + *(int *)(OUTLINED_FUNCTION_0_12() + 20));
  OUTLINED_FUNCTION_9();
}

uint64_t type metadata accessor for MessageDraftSnippetModel()
{
  uint64_t result;

  result = qword_2576180A8;
  if (!qword_2576180A8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_246A5C2C4(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  MessageDraftSnippetModel.intent.setter((uint64_t)v1);
}

void MessageDraftSnippetModel.intent.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(int *)(OUTLINED_FUNCTION_0_12() + 20);

  *(_QWORD *)(v1 + v3) = a1;
  OUTLINED_FUNCTION_1();
}

void MessageDraftSnippetModel.intent.modify(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  id v5;

  *(_QWORD *)(a1 + 8) = v1;
  v3 = *(int *)(OUTLINED_FUNCTION_0_12() + 20);
  *(_DWORD *)(a1 + 16) = v3;
  v4 = *(void **)(v1 + v3);
  *(_QWORD *)a1 = v4;
  v5 = v4;
  OUTLINED_FUNCTION_9();
}

void sub_246A5C364(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(int *)(a1 + 16);
  v4 = *(void **)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v5 = *(void **)(v3 + v2);
  if ((a2 & 1) != 0)
  {
    v6 = v4;

    *(_QWORD *)(v3 + v2) = v4;
  }
  else
  {

    *(_QWORD *)(v3 + v2) = v4;
  }
}

uint64_t MessageDraftSnippetModel.contactName.getter()
{
  uint64_t v1;

  OUTLINED_FUNCTION_0_12();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
  sub_246A7804C();
  return v1;
}

uint64_t sub_246A5C410()
{
  swift_bridgeObjectRetain();
  return MessageDraftSnippetModel.contactName.setter();
}

uint64_t MessageDraftSnippetModel.contactName.setter()
{
  OUTLINED_FUNCTION_0_12();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
  return OUTLINED_FUNCTION_10();
}

void MessageDraftSnippetModel.contactName.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_8_0();
  *v0 = v1;
  OUTLINED_FUNCTION_0_12();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
  v1[4] = OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1();
}

void MessageDraftSnippetModel.payload.getter()
{
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_9();
}

void sub_246A5C504(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  swift_bridgeObjectRetain();
  MessageDraftSnippetModel.payload.setter(v1, v2);
}

void MessageDraftSnippetModel.payload.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + *(int *)(OUTLINED_FUNCTION_0_12() + 28));
  swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  OUTLINED_FUNCTION_1();
}

void MessageDraftSnippetModel.payload.modify(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = *(int *)(OUTLINED_FUNCTION_0_12() + 28);
  *(_DWORD *)(a1 + 24) = v3;
  v4 = (_QWORD *)(v1 + v3);
  v5 = v4[1];
  *(_QWORD *)a1 = *v4;
  *(_QWORD *)(a1 + 8) = v5;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_9();
}

void sub_246A5C5C0(uint64_t *a1, char a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v2 = a1[1];
  v3 = (_QWORD *)(a1[2] + *((int *)a1 + 6));
  v4 = *a1;
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *v3 = v4;
    v3[1] = v2;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    *v3 = v4;
    v3[1] = v2;
    OUTLINED_FUNCTION_1();
  }
}

uint64_t MessageDraftSnippetModel.shouldUpdateWithASRText.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(OUTLINED_FUNCTION_0_12() + 32));
}

void MessageDraftSnippetModel.shouldUpdateWithASRText.setter(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + *(int *)(OUTLINED_FUNCTION_0_12() + 32)) = a1;
  OUTLINED_FUNCTION_9();
}

uint64_t (*MessageDraftSnippetModel.shouldUpdateWithASRText.modify())()
{
  OUTLINED_FUNCTION_0_12();
  return nullsub_1;
}

uint64_t MessageDraftSnippetModel.autoSendInfo.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (uint64_t *)(v1 + *(int *)(OUTLINED_FUNCTION_0_12() + 36));
  v4 = *v3;
  v5 = v3[1];
  v6 = v3[2];
  v7 = v3[3];
  v8 = v3[4];
  *a1 = *v3;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  return sub_246A5C6C8(v4, v5, v6);
}

uint64_t sub_246A5C6C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3 != 1)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

__n128 MessageDraftSnippetModel.autoSendInfo.setter(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  __n128 result;
  __n128 v5;
  __int128 v6;

  v5 = (__n128)a1[1];
  v6 = *a1;
  v2 = *((_QWORD *)a1 + 4);
  v3 = (uint64_t *)(v1 + *(int *)(OUTLINED_FUNCTION_0_12() + 36));
  sub_246A5C758(*v3, v3[1], v3[2]);
  result = v5;
  *(_OWORD *)v3 = v6;
  *((__n128 *)v3 + 1) = v5;
  v3[4] = v2;
  return result;
}

uint64_t sub_246A5C758(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3 != 1)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t (*MessageDraftSnippetModel.autoSendInfo.modify())()
{
  OUTLINED_FUNCTION_0_12();
  return nullsub_1;
}

uint64_t MessageDraftSnippetModel.correctionInfo.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)(v1 + *(int *)(OUTLINED_FUNCTION_0_12() + 40));
  v4 = *v3;
  LOBYTE(v3) = *((_BYTE *)v3 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = (_BYTE)v3;
  return swift_bridgeObjectRetain();
}

void MessageDraftSnippetModel.correctionInfo.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;

  v2 = *a1;
  v3 = *((_BYTE *)a1 + 8);
  v4 = v1 + *(int *)(OUTLINED_FUNCTION_0_12() + 40);
  swift_bridgeObjectRelease();
  *(_QWORD *)v4 = v2;
  *(_BYTE *)(v4 + 8) = v3;
  OUTLINED_FUNCTION_1();
}

uint64_t (*MessageDraftSnippetModel.correctionInfo.modify())()
{
  OUTLINED_FUNCTION_0_12();
  return nullsub_1;
}

void MessageDraftSnippetModel.labels.getter()
{
  OUTLINED_FUNCTION_0_12();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
  sub_246A7804C();
  OUTLINED_FUNCTION_9();
}

void sub_246A5C880(void *__src)
{
  _BYTE v2[176];

  memcpy(v2, __src, sizeof(v2));
  sub_246A48720((uint64_t)v2);
  MessageDraftSnippetModel.labels.setter(__src);
}

void MessageDraftSnippetModel.labels.setter(const void *a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_14_0(&v1, a1);
  OUTLINED_FUNCTION_0_12();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_25();
}

void MessageDraftSnippetModel.labels.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_8_0();
  *v0 = v1;
  OUTLINED_FUNCTION_0_12();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
  v1[4] = OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1();
}

uint64_t MessageDraftSnippetModel.init(intent:contactName:payload:shouldUpdateWithASRText:autoSendInfo:correctionInfo:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t *a7@<X6>, uint64_t *a8@<X7>, uint64_t a9@<X8>)
{
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t result;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v32[22];
  _BYTE v33[184];

  v27 = a7[1];
  v28 = *a7;
  v25 = a7[3];
  v26 = a7[2];
  v23 = *a8;
  v24 = a7[4];
  v22 = *((_BYTE *)a8 + 8);
  v12 = (int *)OUTLINED_FUNCTION_0_12();
  v13 = v12[5];
  v14 = v12[7];
  v16 = v12[9];
  v15 = v12[10];
  if (qword_2576171F0 != -1)
    swift_once();
  v17 = a9 + v15;
  v18 = (_QWORD *)(a9 + v16);
  v19 = (_QWORD *)(a9 + v14);
  swift_beginAccess();
  OUTLINED_FUNCTION_14_0(v33, &qword_257617E28);
  OUTLINED_FUNCTION_14_0(v32, &qword_257617E28);
  sub_246A48720((uint64_t)v33);
  sub_246A78034();
  sub_246A77F98();
  *(_QWORD *)(a9 + v13) = a1;
  v32[0] = a2;
  v32[1] = a3;
  result = sub_246A78034();
  *v19 = a4;
  v19[1] = a5;
  *(_BYTE *)(a9 + v12[8]) = a6 & 1;
  *v18 = v28;
  v18[1] = v27;
  v18[2] = v26;
  v18[3] = v25;
  v18[4] = v24;
  *(_QWORD *)v17 = v23;
  *(_BYTE *)(v17 + 8) = v22;
  return result;
}

uint64_t MessageDraftSnippetModel.description.getter()
{
  uint64_t v0;
  uint64_t v1;

  sub_246A78298();
  sub_246A78178();
  v1 = OUTLINED_FUNCTION_0_12();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
  sub_246A7804C();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_3_11();
  sub_246A78178();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_3_11();
  OUTLINED_FUNCTION_13_5();
  sub_246A78298();
  swift_bridgeObjectRelease();
  sub_246A78178();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_45();
  if (*(_QWORD *)(v0 + *(int *)(v1 + 36) + 16) != 1)
    AutoSendInfo.description.getter();
  sub_246A78178();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13_5();
  swift_bridgeObjectRetain();
  sub_246A78178();
  OUTLINED_FUNCTION_3_11();
  swift_bridgeObjectRelease();
  sub_246A78298();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + *(int *)(v1 + 40)))
    CorrectionInfo.description.getter();
  OUTLINED_FUNCTION_24_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13_5();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_3_11();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t AutoSendInfo.description.getter()
{
  sub_246A78298();
  sub_246A78178();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_3_11();
  OUTLINED_FUNCTION_45();
  swift_bridgeObjectRetain();
  sub_246A78178();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13_5();
  return 0;
}

uint64_t CorrectionInfo.description.getter()
{
  sub_246A78298();
  sub_246A78178();
  sub_246A783E8();
  sub_246A78178();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_45();
  sub_246A78178();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13_5();
  return 0;
}

uint64_t sub_246A5D000(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  char v12;

  v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x746E65746E69 && a2 == 0xE600000000000000;
    if (v6 || (sub_246A78400() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x4E746361746E6F63 && a2 == 0xEB00000000656D61;
      if (v7 || (sub_246A78400() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x64616F6C796170 && a2 == 0xE700000000000000;
        if (v8 || (sub_246A78400() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0xD000000000000017 && a2 == 0x8000000246A7F4E0 || (sub_246A78400() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          v9 = a1 == 0x646E65536F747561 && a2 == 0xEC0000006F666E49;
          if (v9 || (sub_246A78400() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            v10 = a1 == 0x6974636572726F63 && a2 == 0xEE006F666E496E6FLL;
            if (v10 || (sub_246A78400() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else if (a1 == 0x736C6562616CLL && a2 == 0xE600000000000000)
            {
              swift_bridgeObjectRelease();
              return 7;
            }
            else
            {
              v12 = sub_246A78400();
              swift_bridgeObjectRelease();
              if ((v12 & 1) != 0)
                return 7;
              else
                return 8;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_246A5D308(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_246A5D340 + 4 * byte_246A7B1D0[a1]))(0xD000000000000017, 0x8000000246A7F4E0);
}

uint64_t sub_246A5D340()
{
  return 25705;
}

uint64_t sub_246A5D34C()
{
  return 0x746E65746E69;
}

uint64_t sub_246A5D360()
{
  return 0x4E746361746E6F63;
}

uint64_t sub_246A5D380()
{
  return 0x64616F6C796170;
}

uint64_t sub_246A5D398()
{
  return 0x646E65536F747561;
}

uint64_t sub_246A5D3B8()
{
  return 0x6974636572726F63;
}

uint64_t sub_246A5D3DC()
{
  return 0x736C6562616CLL;
}

uint64_t sub_246A5D3F4()
{
  unsigned __int8 *v0;

  return sub_246A5D308(*v0);
}

uint64_t sub_246A5D3FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A5D000(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A5D420()
{
  sub_246A5D750();
  return sub_246A784D8();
}

uint64_t sub_246A5D448()
{
  sub_246A5D750();
  return sub_246A784E4();
}

uint64_t MessageDraftSnippetModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617F98);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_12();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A5D750();
  sub_246A784CC();
  sub_246A77FA4();
  sub_246A5EC58((uint64_t)&unk_257617FA8);
  OUTLINED_FUNCTION_2_13();
  if (!v1)
  {
    type metadata accessor for MessageDraftSnippetModel();
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_43((uint64_t)&unk_257617388);
    OUTLINED_FUNCTION_2_13();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
    sub_246A5DE3C((uint64_t)&unk_2576173A0);
    OUTLINED_FUNCTION_47();
    OUTLINED_FUNCTION_2_13();
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_43((uint64_t)&unk_257617FB8);
    OUTLINED_FUNCTION_2_13();
    OUTLINED_FUNCTION_4_6();
    sub_246A5D78C();
    OUTLINED_FUNCTION_9_5();
    sub_246A5D7C8();
    OUTLINED_FUNCTION_9_5();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
    sub_246A5DF44((uint64_t)&unk_2576173B0);
    OUTLINED_FUNCTION_47();
    OUTLINED_FUNCTION_2_13();
  }
  return OUTLINED_FUNCTION_16_3(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
}

unint64_t sub_246A5D750()
{
  unint64_t result;

  result = qword_257617FA0;
  if (!qword_257617FA0)
  {
    result = MEMORY[0x249563B60](&unk_246A7B758, &type metadata for MessageDraftSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257617FA0);
  }
  return result;
}

unint64_t sub_246A5D78C()
{
  unint64_t result;

  result = qword_257617FC0;
  if (!qword_257617FC0)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for AutoSendInfo, &type metadata for AutoSendInfo);
    atomic_store(result, (unint64_t *)&qword_257617FC0);
  }
  return result;
}

unint64_t sub_246A5D7C8()
{
  unint64_t result;

  result = qword_257617FC8;
  if (!qword_257617FC8)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for CorrectionInfo, &type metadata for CorrectionInfo);
    atomic_store(result, (unint64_t *)&qword_257617FC8);
  }
  return result;
}

void MessageDraftSnippetModel.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  int *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  char v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  _OWORD v49[2];
  uint64_t v50;
  _BYTE v51[184];
  char v52;

  v32 = a2;
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
  v45 = *(_QWORD *)(v42 - 8);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_6_0();
  v33 = v4;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
  v35 = *(_QWORD *)(v38 - 8);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_6_0();
  v34 = v6;
  v7 = sub_246A77FA4();
  v39 = *(_QWORD *)(v7 - 8);
  v40 = v7;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_6_0();
  v10 = v9;
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617FD0);
  v11 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  type metadata accessor for MessageDraftSnippetModel();
  OUTLINED_FUNCTION_12_0();
  v13 = (int *)MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = v13[5];
  *(_QWORD *)&v15[v48] = 0;
  v16 = &v15[v13[7]];
  *(_QWORD *)v16 = 0;
  *((_QWORD *)v16 + 1) = 0;
  v47 = v16;
  v17 = (uint64_t *)&v15[v13[9]];
  *v17 = 0;
  v17[1] = 0;
  v17[3] = 0;
  v17[4] = 0;
  v17[2] = 1;
  v18 = &v15[v13[10]];
  *(_QWORD *)v18 = 0;
  v46 = v18;
  v18[8] = 0;
  v36 = v13;
  v19 = &v15[v13[11]];
  if (qword_2576171F0 != -1)
    swift_once();
  swift_beginAccess();
  OUTLINED_FUNCTION_24(v51);
  OUTLINED_FUNCTION_24(v49);
  sub_246A48720((uint64_t)v51);
  v44 = v19;
  sub_246A78034();
  v20 = a1[3];
  v41 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v20);
  sub_246A5D750();
  v21 = v43;
  sub_246A784B4();
  if (v21)
  {
    v22 = v42;
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_31();
    swift_bridgeObjectRelease();
    sub_246A5C758(*v17, v17[1], v17[2]);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v44, v22);
  }
  else
  {
    v43 = v11;
    LOBYTE(v49[0]) = 0;
    sub_246A5EC58((uint64_t)&unk_257617FD8);
    v23 = v40;
    sub_246A78364();
    (*(void (**)(char *, uint64_t, uint64_t))(v39 + 32))(v15, v10, v23);
    OUTLINED_FUNCTION_14();
    v52 = 1;
    OUTLINED_FUNCTION_43((uint64_t)&unk_2576173D0);
    sub_246A78364();
    v24 = v42;
    *(_QWORD *)&v15[v48] = *(_QWORD *)&v49[0];
    LOBYTE(v49[0]) = 2;
    sub_246A5DE3C((uint64_t)&unk_2576173E0);
    v25 = v34;
    v26 = v38;
    sub_246A78364();
    (*(void (**)(char *, uint64_t, uint64_t))(v35 + 32))(&v15[v36[6]], v25, v26);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257617FB0);
    v52 = 3;
    sub_246A5DE98((uint64_t)&unk_257617FE0);
    sub_246A78364();
    *(_OWORD *)v47 = v49[0];
    LOBYTE(v49[0]) = 4;
    v15[v36[8]] = sub_246A7834C() & 1;
    v52 = 5;
    sub_246A5DECC();
    OUTLINED_FUNCTION_6_8();
    v27 = v50;
    v28 = v49[1];
    *(_OWORD *)v17 = v49[0];
    *((_OWORD *)v17 + 1) = v28;
    v17[4] = v27;
    v52 = 6;
    sub_246A5DF08();
    OUTLINED_FUNCTION_6_8();
    v29 = BYTE8(v49[0]);
    v30 = v46;
    *(_QWORD *)v46 = *(_QWORD *)&v49[0];
    v30[8] = v29;
    LOBYTE(v49[0]) = 7;
    sub_246A5DF44((uint64_t)&unk_2576173F0);
    sub_246A78364();
    OUTLINED_FUNCTION_15_4();
    (*(void (**)(char *, uint64_t, uint64_t))(v45 + 40))(v44, v33, v24);
    sub_246A5DFA0((uint64_t)v15, v32);
    OUTLINED_FUNCTION_36();
    sub_246A5DFE4((uint64_t)v15);
  }
  OUTLINED_FUNCTION_8_1();
}

uint64_t sub_246A5DE3C(uint64_t a1)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_18(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257617358);
    OUTLINED_FUNCTION_19_1();
  }
  return result;
}

void sub_246A5DE98(uint64_t a1)
{
  uint64_t *v1;

  if (!OUTLINED_FUNCTION_18(a1))
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v1);
    OUTLINED_FUNCTION_19_1();
  }
  OUTLINED_FUNCTION_9();
}

unint64_t sub_246A5DECC()
{
  unint64_t result;

  result = qword_257617FE8;
  if (!qword_257617FE8)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for AutoSendInfo, &type metadata for AutoSendInfo);
    atomic_store(result, (unint64_t *)&qword_257617FE8);
  }
  return result;
}

unint64_t sub_246A5DF08()
{
  unint64_t result;

  result = qword_257617FF0;
  if (!qword_257617FF0)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for CorrectionInfo, &type metadata for CorrectionInfo);
    atomic_store(result, (unint64_t *)&qword_257617FF0);
  }
  return result;
}

void sub_246A5DF44(uint64_t a1)
{
  unint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  if (!OUTLINED_FUNCTION_18(a1))
  {
    v3 = v2;
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257617368);
    v5[0] = sub_246A48874();
    v5[1] = sub_246A488B0();
    atomic_store(MEMORY[0x249563B60](v3, v4, v5), v1);
  }
  OUTLINED_FUNCTION_8();
}

uint64_t sub_246A5DFA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MessageDraftSnippetModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246A5DFE4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MessageDraftSnippetModel();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_246A5E024(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  MessageDraftSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_246A5E038(_QWORD *a1)
{
  return MessageDraftSnippetModel.encode(to:)(a1);
}

double AutoSendInfo.autoSendTimeout.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

void AutoSendInfo.autoSendTimeout.setter(double a1)
{
  double *v1;

  *v1 = a1;
}

uint64_t (*AutoSendInfo.autoSendTimeout.modify())()
{
  return nullsub_1;
}

void AutoSendInfo.delayedActionAceId.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_9();
}

void AutoSendInfo.delayedActionAceId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t (*AutoSendInfo.delayedActionAceId.modify())()
{
  return nullsub_1;
}

void AutoSendInfo.speechSynthesisId.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_9();
}

void AutoSendInfo.speechSynthesisId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t (*AutoSendInfo.speechSynthesisId.modify())()
{
  return nullsub_1;
}

void __swiftcall AutoSendInfo.init(autoSendTimeout:delayedActionAceId:speechSynthesisId:)(SiriMessagesCommon::AutoSendInfo *__return_ptr retstr, Swift::Double autoSendTimeout, Swift::String_optional delayedActionAceId, Swift::String_optional speechSynthesisId)
{
  retstr->autoSendTimeout = autoSendTimeout;
  retstr->delayedActionAceId = delayedActionAceId;
  retstr->speechSynthesisId = speechSynthesisId;
}

uint64_t sub_246A5E134(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x646E65536F747561 && a2 == 0xEF74756F656D6954;
  if (v3 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000246A7F500 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000246A7EBE0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_246A78400();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

void sub_246A5E290()
{
  sub_246A78484();
  sub_246A78490();
  sub_246A7849C();
  OUTLINED_FUNCTION_20_0();
}

uint64_t sub_246A5E2CC(char a1)
{
  if (!a1)
    return 0x646E65536F747561;
  if (a1 == 1)
    return 0xD000000000000012;
  return 0xD000000000000011;
}

void sub_246A5E330()
{
  sub_246A5E290();
}

void sub_246A5E348()
{
  sub_246A78484();
  sub_246A78490();
  sub_246A7849C();
  OUTLINED_FUNCTION_20_0();
}

uint64_t sub_246A5E380()
{
  char *v0;

  return sub_246A5E2CC(*v0);
}

uint64_t sub_246A5E388@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A5E134(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A5E3AC()
{
  sub_246A5E518();
  return sub_246A784D8();
}

uint64_t sub_246A5E3D4()
{
  sub_246A5E518();
  return sub_246A784E4();
}

void AutoSendInfo.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617FF8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_12();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A5E518();
  sub_246A784CC();
  sub_246A783C4();
  if (!v1)
  {
    OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_18_2();
    OUTLINED_FUNCTION_18_2();
  }
  OUTLINED_FUNCTION_16_3(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  OUTLINED_FUNCTION_7_7();
}

unint64_t sub_246A5E518()
{
  unint64_t result;

  result = qword_257618000;
  if (!qword_257618000)
  {
    result = MEMORY[0x249563B60](&unk_246A7B708, &type metadata for AutoSendInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618000);
  }
  return result;
}

void AutoSendInfo.init(from:)(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_BYTE *, uint64_t);
  uint64_t v19;
  _BYTE v20[16];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618008);
  OUTLINED_FUNCTION_29();
  MEMORY[0x24BDAC7A8](v7);
  v9 = &v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A5E518();
  OUTLINED_FUNCTION_12_4();
  if (!v2)
  {
    v20[15] = 0;
    sub_246A78358();
    v11 = v10;
    OUTLINED_FUNCTION_38();
    v12 = OUTLINED_FUNCTION_23_0();
    v14 = v13;
    v20[13] = 2;
    swift_bridgeObjectRetain();
    v15 = OUTLINED_FUNCTION_23_0();
    v17 = v16;
    v18 = *(void (**)(_BYTE *, uint64_t))(v3 + 8);
    v19 = v15;
    v18(v9, v6);
    OUTLINED_FUNCTION_5_4();
    swift_bridgeObjectRelease();
    *a2 = v11;
    a2[1] = v12;
    a2[2] = v14;
    a2[3] = v19;
    a2[4] = v17;
  }
  OUTLINED_FUNCTION_4_3();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_7_7();
}

void sub_246A5E6B8(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  AutoSendInfo.init(from:)(a1, a2);
}

void sub_246A5E6CC(_QWORD *a1)
{
  AutoSendInfo.encode(to:)(a1);
}

uint64_t CorrectionInfo.appBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

void CorrectionInfo.appBundleIdentifiers.setter(uint64_t a1)
{
  _QWORD *v1;

  swift_bridgeObjectRelease();
  *v1 = a1;
  OUTLINED_FUNCTION_9();
}

uint64_t (*CorrectionInfo.appBundleIdentifiers.modify())()
{
  return nullsub_1;
}

uint64_t CorrectionInfo.isAuthenticated.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t CorrectionInfo.isAuthenticated.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 8) = result;
  return result;
}

uint64_t (*CorrectionInfo.isAuthenticated.modify())()
{
  return nullsub_1;
}

SiriMessagesCommon::CorrectionInfo __swiftcall CorrectionInfo.init(appBundleIdentifiers:isAuthenticated:)(Swift::OpaquePointer appBundleIdentifiers, Swift::Bool isAuthenticated)
{
  uint64_t v2;
  SiriMessagesCommon::CorrectionInfo result;

  *(Swift::OpaquePointer *)v2 = appBundleIdentifiers;
  *(_BYTE *)(v2 + 8) = isAuthenticated;
  result.appBundleIdentifiers = appBundleIdentifiers;
  result.isAuthenticated = isAuthenticated;
  return result;
}

uint64_t sub_246A5E74C(uint64_t a1, uint64_t a2)
{
  char v6;

  if (a1 == 0xD000000000000014 && a2 == 0x8000000246A7F520 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E65687475417369 && a2 == 0xEF64657461636974)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_246A78400();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_246A5E84C(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6E65687475417369;
  else
    return 0xD000000000000014;
}

uint64_t sub_246A5E894()
{
  char *v0;

  return sub_246A5E84C(*v0);
}

uint64_t sub_246A5E89C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A5E74C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A5E8C0()
{
  sub_246A5EA20();
  return sub_246A784D8();
}

uint64_t sub_246A5E8E8()
{
  sub_246A5EA20();
  return sub_246A784E4();
}

void CorrectionInfo.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257618010);
  OUTLINED_FUNCTION_29();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_12();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A5EA20();
  sub_246A784CC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257618020);
  sub_246A5EBB4((uint64_t)&unk_257618028);
  OUTLINED_FUNCTION_2_13();
  if (!v1)
  {
    OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_4_6();
  }
  OUTLINED_FUNCTION_16_3(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_8_1();
}

unint64_t sub_246A5EA20()
{
  unint64_t result;

  result = qword_257618018;
  if (!qword_257618018)
  {
    result = MEMORY[0x249563B60](&unk_246A7B6B8, &type metadata for CorrectionInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618018);
  }
  return result;
}

void CorrectionInfo.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  char v6;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257618030);
  OUTLINED_FUNCTION_29();
  MEMORY[0x24BDAC7A8](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A5EA20();
  OUTLINED_FUNCTION_12_4();
  if (v2)
  {
    OUTLINED_FUNCTION_4_3();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257618020);
    sub_246A5EBB4((uint64_t)&unk_257618038);
    sub_246A78364();
    OUTLINED_FUNCTION_38();
    swift_bridgeObjectRetain();
    v6 = sub_246A7834C();
    OUTLINED_FUNCTION_2_5();
    *(_QWORD *)a2 = v7;
    *(_BYTE *)(a2 + 8) = v6 & 1;
    OUTLINED_FUNCTION_4_3();
    OUTLINED_FUNCTION_3_6();
  }
  OUTLINED_FUNCTION_8_1();
}

void sub_246A5EBB4(uint64_t a1)
{
  if (!OUTLINED_FUNCTION_18(a1))
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257618020);
    OUTLINED_FUNCTION_19_1();
  }
  OUTLINED_FUNCTION_8();
}

void sub_246A5EC00()
{
  sub_246A5EC58((uint64_t)&unk_257618040);
}

void sub_246A5EC2C()
{
  sub_246A5EC58((uint64_t)&unk_257618048);
}

void sub_246A5EC58(uint64_t a1)
{
  void (*v1)(uint64_t);

  if (!OUTLINED_FUNCTION_18(a1))
  {
    v1(255);
    OUTLINED_FUNCTION_19_1();
  }
  OUTLINED_FUNCTION_9();
}

void sub_246A5EC8C(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  CorrectionInfo.init(from:)(a1, a2);
}

void sub_246A5ECA0(_QWORD *a1)
{
  CorrectionInfo.encode(to:)(a1);
}

void sub_246A5ECB8(_QWORD *a1@<X8>)
{
  uint64_t v2;

  MessageDraftSnippetModel.intent.getter();
  *a1 = v2;
  OUTLINED_FUNCTION_9();
}

void sub_246A5ECE0(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = MessageDraftSnippetModel.contactName.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_9();
}

void sub_246A5ED08(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  MessageDraftSnippetModel.payload.getter();
  *a1 = v2;
  a1[1] = v3;
  OUTLINED_FUNCTION_9();
}

void sub_246A5ED30(void *a1@<X8>)
{
  uint64_t v2;

  MessageDraftSnippetModel.labels.getter();
  OUTLINED_FUNCTION_14_0(a1, &v2);
  OUTLINED_FUNCTION_25();
}

_QWORD *initializeBufferWithCopyOfBuffer for MessageDraftSnippetModel(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char *v11;
  char *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  uint64_t v34;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v25 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v25 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_246A77FA4();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = *(void **)((char *)a2 + v8);
    *(_QWORD *)((char *)a1 + v8) = v10;
    v11 = (char *)a1 + v9;
    v12 = (char *)a2 + v9;
    v13 = v10;
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v11, v12, v14);
    v15 = a3[7];
    v16 = a3[8];
    v17 = (_QWORD *)((char *)a1 + v15);
    v18 = (_QWORD *)((char *)a2 + v15);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    *((_BYTE *)a1 + v16) = *((_BYTE *)a2 + v16);
    v20 = a3[9];
    v21 = (char *)a1 + v20;
    v22 = (char *)a2 + v20;
    v23 = *(_QWORD *)((char *)a2 + v20 + 16);
    swift_bridgeObjectRetain();
    if (v23 == 1)
    {
      v24 = *((_OWORD *)v22 + 1);
      *(_OWORD *)v21 = *(_OWORD *)v22;
      *((_OWORD *)v21 + 1) = v24;
      *((_QWORD *)v21 + 4) = *((_QWORD *)v22 + 4);
    }
    else
    {
      *(_OWORD *)v21 = *(_OWORD *)v22;
      v26 = *((_QWORD *)v22 + 3);
      v27 = *((_QWORD *)v22 + 4);
      *((_QWORD *)v21 + 2) = v23;
      *((_QWORD *)v21 + 3) = v26;
      *((_QWORD *)v21 + 4) = v27;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    v28 = a3[10];
    v29 = a3[11];
    v30 = (char *)a1 + v28;
    v31 = (char *)a2 + v28;
    *(_QWORD *)v30 = *(_QWORD *)v31;
    v30[8] = v31[8];
    v32 = (char *)a1 + v29;
    v33 = (char *)a2 + v29;
    swift_bridgeObjectRetain();
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v32, v33, v34);
  }
  return a1;
}

uint64_t destroy for MessageDraftSnippetModel(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_246A77FA4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);

  v5 = a1 + a2[6];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + a2[9] + 16) != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  v7 = a1 + a2[11];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

uint64_t initializeWithCopy for MessageDraftSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v6 = sub_246A77FA4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v9;
  v10 = a1 + v8;
  v11 = a2 + v8;
  v12 = v9;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v10, v11, v13);
  v14 = a3[7];
  v15 = a3[8];
  v16 = (_QWORD *)(a1 + v14);
  v17 = (_QWORD *)(a2 + v14);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  *(_BYTE *)(a1 + v15) = *(_BYTE *)(a2 + v15);
  v19 = a3[9];
  v20 = a1 + v19;
  v21 = a2 + v19;
  v22 = *(_QWORD *)(a2 + v19 + 16);
  swift_bridgeObjectRetain();
  if (v22 == 1)
  {
    v23 = *(_OWORD *)(v21 + 16);
    *(_OWORD *)v20 = *(_OWORD *)v21;
    *(_OWORD *)(v20 + 16) = v23;
    *(_QWORD *)(v20 + 32) = *(_QWORD *)(v21 + 32);
  }
  else
  {
    *(_OWORD *)v20 = *(_OWORD *)v21;
    v24 = *(_QWORD *)(v21 + 24);
    v25 = *(_QWORD *)(v21 + 32);
    *(_QWORD *)(v20 + 16) = v22;
    *(_QWORD *)(v20 + 24) = v24;
    *(_QWORD *)(v20 + 32) = v25;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  v26 = a3[10];
  v27 = a3[11];
  v28 = a1 + v26;
  v29 = a2 + v26;
  *(_QWORD *)v28 = *(_QWORD *)v29;
  *(_BYTE *)(v28 + 8) = *(_BYTE *)(v29 + 8);
  v30 = a1 + v27;
  v31 = a2 + v27;
  swift_bridgeObjectRetain();
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 16))(v30, v31, v32);
  return a1;
}

uint64_t assignWithCopy for MessageDraftSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v6 = sub_246A77FA4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = *(void **)(a1 + v7);
  v9 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v9;
  v10 = v9;

  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  v15 = a3[7];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  v18 = a3[9];
  v19 = a1 + v18;
  v20 = (__int128 *)(a2 + v18);
  v21 = *(_QWORD *)(a1 + v18 + 16);
  v22 = *(_QWORD *)(a2 + v18 + 16);
  if (v21 == 1)
  {
    if (v22 == 1)
    {
      v23 = *v20;
      v24 = v20[1];
      *(_QWORD *)(v19 + 32) = *((_QWORD *)v20 + 4);
      *(_OWORD *)v19 = v23;
      *(_OWORD *)(v19 + 16) = v24;
    }
    else
    {
      *(_QWORD *)v19 = *(_QWORD *)v20;
      *(_QWORD *)(v19 + 8) = *((_QWORD *)v20 + 1);
      *(_QWORD *)(v19 + 16) = *((_QWORD *)v20 + 2);
      *(_QWORD *)(v19 + 24) = *((_QWORD *)v20 + 3);
      *(_QWORD *)(v19 + 32) = *((_QWORD *)v20 + 4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v22 == 1)
  {
    sub_246A5F318(v19);
    v25 = *((_QWORD *)v20 + 4);
    v26 = v20[1];
    *(_OWORD *)v19 = *v20;
    *(_OWORD *)(v19 + 16) = v26;
    *(_QWORD *)(v19 + 32) = v25;
  }
  else
  {
    *(_QWORD *)v19 = *(_QWORD *)v20;
    *(_QWORD *)(v19 + 8) = *((_QWORD *)v20 + 1);
    *(_QWORD *)(v19 + 16) = *((_QWORD *)v20 + 2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v19 + 24) = *((_QWORD *)v20 + 3);
    *(_QWORD *)(v19 + 32) = *((_QWORD *)v20 + 4);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  v27 = a3[10];
  v28 = a1 + v27;
  v29 = a2 + v27;
  *(_QWORD *)(a1 + v27) = *(_QWORD *)(a2 + v27);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(v28 + 8) = *(_BYTE *)(v29 + 8);
  v30 = a3[11];
  v31 = a1 + v30;
  v32 = a2 + v30;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 24))(v31, v32, v33);
  return a1;
}

uint64_t sub_246A5F318(uint64_t a1)
{
  destroy for AutoSendInfo();
  return a1;
}

uint64_t initializeWithTake for MessageDraftSnippetModel(uint64_t a1, uint64_t a2, int *a3)
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
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = sub_246A77FA4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v11) = *(_BYTE *)(a2 + v11);
  v12 = a3[9];
  v13 = a3[10];
  v14 = a1 + v12;
  v15 = a2 + v12;
  *(_QWORD *)(v14 + 32) = *(_QWORD *)(v15 + 32);
  v16 = *(_OWORD *)(v15 + 16);
  *(_OWORD *)v14 = *(_OWORD *)v15;
  *(_OWORD *)(v14 + 16) = v16;
  v17 = a1 + v13;
  v18 = a2 + v13;
  *(_BYTE *)(v17 + 8) = *(_BYTE *)(v18 + 8);
  *(_QWORD *)v17 = *(_QWORD *)v18;
  v19 = a3[11];
  v20 = a1 + v19;
  v21 = a2 + v19;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v20, v21, v22);
  return a1;
}

uint64_t assignWithTake for MessageDraftSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v6 = sub_246A77FA4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);

  v9 = a3[6];
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  v13 = a3[7];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (uint64_t *)(a2 + v13);
  v17 = *v15;
  v16 = v15[1];
  *v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  v18 = a3[9];
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  v19 = (_QWORD *)(a1 + v18);
  v20 = (_QWORD *)(a2 + v18);
  if (*(_QWORD *)(a1 + v18 + 16) != 1)
  {
    v21 = v20[2];
    if (v21 != 1)
    {
      *v19 = *v20;
      v19[1] = v20[1];
      v19[2] = v21;
      swift_bridgeObjectRelease();
      v23 = v20[4];
      v19[3] = v20[3];
      v19[4] = v23;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_246A5F318(a1 + v18);
  }
  v22 = *((_OWORD *)v20 + 1);
  *(_OWORD *)v19 = *(_OWORD *)v20;
  *((_OWORD *)v19 + 1) = v22;
  v19[4] = v20[4];
LABEL_6:
  v24 = a3[10];
  v25 = a1 + v24;
  v26 = a2 + v24;
  *(_QWORD *)(a1 + v24) = *(_QWORD *)(a2 + v24);
  swift_bridgeObjectRelease();
  *(_BYTE *)(v25 + 8) = *(_BYTE *)(v26 + 8);
  v27 = a3[11];
  v28 = a1 + v27;
  v29 = a2 + v27;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 40))(v28, v29, v30);
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageDraftSnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246A5F5D0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int v10;
  uint64_t v12;
  uint64_t v13;

  v6 = OUTLINED_FUNCTION_17_2();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v6;
    v8 = v4;
    return __swift_getEnumTagSinglePayload(v8, v3, v7);
  }
  if ((_DWORD)v3 != 2147483646)
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
    if (*(_DWORD *)(*(_QWORD *)(v12 - 8) + 84) == (_DWORD)v3)
    {
      v7 = v12;
      v13 = a3[6];
    }
    else
    {
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
      v13 = a3[11];
    }
    v8 = v4 + v13;
    return __swift_getEnumTagSinglePayload(v8, v3, v7);
  }
  v9 = *(_QWORD *)(v4 + a3[5]);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for MessageDraftSnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_246A5F6A4(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v8 = OUTLINED_FUNCTION_17_2();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = v5;
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(_QWORD *)(v5 + a4[5]) = v4;
      OUTLINED_FUNCTION_1();
      return;
    }
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
    if (*(_DWORD *)(*(_QWORD *)(v11 - 8) + 84) == a3)
    {
      v9 = v11;
      v12 = a4[6];
    }
    else
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
      v12 = a4[11];
    }
    v10 = v5 + v12;
  }
  __swift_storeEnumTagSinglePayload(v10, v4, v4, v9);
}

void sub_246A5F754()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_246A77FA4();
  if (v0 <= 0x3F)
  {
    sub_246A4936C(319, &qword_257617470);
    if (v1 <= 0x3F)
    {
      sub_246A4936C(319, qword_257617480);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

uint64_t destroy for AutoSendInfo()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AutoSendInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for AutoSendInfo(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_QWORD *assignWithTake for AutoSendInfo(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  *a1 = *a2;
  v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[4];
  a1[3] = a2[3];
  a1[4] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AutoSendInfo(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 40))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 16);
      if (v3 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AutoSendInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AutoSendInfo()
{
  return &type metadata for AutoSendInfo;
}

uint64_t initializeBufferWithCopyOfBuffer for CorrectionInfo(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for CorrectionInfo()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for CorrectionInfo(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for CorrectionInfo(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

ValueMetadata *type metadata accessor for CorrectionInfo()
{
  return &type metadata for CorrectionInfo;
}

uint64_t storeEnumTagSinglePayload for CorrectionInfo.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A5FB64 + 4 * byte_246A7B1DD[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_246A5FB98 + 4 * byte_246A7B1D8[v4]))();
}

uint64_t sub_246A5FB98(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A5FBA0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A5FBA8);
  return result;
}

uint64_t sub_246A5FBB4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A5FBBCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_246A5FBC0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A5FBC8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CorrectionInfo.CodingKeys()
{
  return &type metadata for CorrectionInfo.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for AutoSendInfo.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A5FC30 + 4 * byte_246A7B1E7[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_246A5FC64 + 4 * byte_246A7B1E2[v4]))();
}

uint64_t sub_246A5FC64(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A5FC6C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A5FC74);
  return result;
}

uint64_t sub_246A5FC80(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A5FC88);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_246A5FC8C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A5FC94(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AutoSendInfo.CodingKeys()
{
  return &type metadata for AutoSendInfo.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for MessageDraftSnippetModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A5FCFC + 4 * byte_246A7B1F1[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_246A5FD30 + 4 * byte_246A7B1EC[v4]))();
}

uint64_t sub_246A5FD30(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A5FD38(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A5FD40);
  return result;
}

uint64_t sub_246A5FD4C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A5FD54);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_246A5FD58(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A5FD60(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MessageDraftSnippetModel.CodingKeys()
{
  return &type metadata for MessageDraftSnippetModel.CodingKeys;
}

unint64_t sub_246A5FD80()
{
  unint64_t result;

  result = qword_2576180F8;
  if (!qword_2576180F8)
  {
    result = MEMORY[0x249563B60](&unk_246A7B520, &type metadata for MessageDraftSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576180F8);
  }
  return result;
}

unint64_t sub_246A5FDC0()
{
  unint64_t result;

  result = qword_257618100;
  if (!qword_257618100)
  {
    result = MEMORY[0x249563B60](&unk_246A7B5D8, &type metadata for AutoSendInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618100);
  }
  return result;
}

unint64_t sub_246A5FE00()
{
  unint64_t result;

  result = qword_257618108;
  if (!qword_257618108)
  {
    result = MEMORY[0x249563B60](&unk_246A7B690, &type metadata for CorrectionInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618108);
  }
  return result;
}

unint64_t sub_246A5FE40()
{
  unint64_t result;

  result = qword_257618110;
  if (!qword_257618110)
  {
    result = MEMORY[0x249563B60](&unk_246A7B600, &type metadata for CorrectionInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618110);
  }
  return result;
}

unint64_t sub_246A5FE80()
{
  unint64_t result;

  result = qword_257618118;
  if (!qword_257618118)
  {
    result = MEMORY[0x249563B60](&unk_246A7B628, &type metadata for CorrectionInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618118);
  }
  return result;
}

unint64_t sub_246A5FEC0()
{
  unint64_t result;

  result = qword_257618120;
  if (!qword_257618120)
  {
    result = MEMORY[0x249563B60](&unk_246A7B548, &type metadata for AutoSendInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618120);
  }
  return result;
}

unint64_t sub_246A5FF00()
{
  unint64_t result;

  result = qword_257618128;
  if (!qword_257618128)
  {
    result = MEMORY[0x249563B60](&unk_246A7B570, &type metadata for AutoSendInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618128);
  }
  return result;
}

unint64_t sub_246A5FF40()
{
  unint64_t result;

  result = qword_257618130;
  if (!qword_257618130)
  {
    result = MEMORY[0x249563B60](&unk_246A7B490, &type metadata for MessageDraftSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618130);
  }
  return result;
}

unint64_t sub_246A5FF80()
{
  unint64_t result;

  result = qword_257618138;
  if (!qword_257618138)
  {
    result = MEMORY[0x249563B60](&unk_246A7B4B8, &type metadata for MessageDraftSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618138);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_12()
{
  return type metadata accessor for MessageDraftSnippetModel();
}

uint64_t OUTLINED_FUNCTION_2_13()
{
  return sub_246A783D0();
}

uint64_t OUTLINED_FUNCTION_6_8()
{
  return sub_246A78334();
}

uint64_t OUTLINED_FUNCTION_9_5()
{
  return sub_246A783A0();
}

uint64_t OUTLINED_FUNCTION_12_4()
{
  return sub_246A784B4();
}

uint64_t OUTLINED_FUNCTION_13_5()
{
  return sub_246A78178();
}

uint64_t OUTLINED_FUNCTION_15_4()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 96) + 8))(v1, *(_QWORD *)(v0 + 48));
}

uint64_t OUTLINED_FUNCTION_16_3@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_17_2()
{
  return sub_246A77FA4();
}

uint64_t OUTLINED_FUNCTION_18_2()
{
  return sub_246A78394();
}

void OUTLINED_FUNCTION_19_1()
{
  JUMPOUT(0x249563B60);
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return sub_246A78328();
}

uint64_t OUTLINED_FUNCTION_24_1()
{
  return sub_246A78178();
}

void OUTLINED_FUNCTION_31()
{
  uint64_t v0;
  uint64_t v1;

}

uint64_t OUTLINED_FUNCTION_33()
{
  return sub_246A78178();
}

uint64_t OUTLINED_FUNCTION_36()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v0 + 80));
}

void OUTLINED_FUNCTION_38()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 82) = 1;
}

void OUTLINED_FUNCTION_43(uint64_t a1)
{
  sub_246A5DE98(a1);
}

uint64_t OUTLINED_FUNCTION_45()
{
  return sub_246A78178();
}

uint64_t OUTLINED_FUNCTION_47()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_246A60118()
{
  return sub_246A60144();
}

uint64_t sub_246A60144()
{
  sub_246A77EC0();
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_17_3();
  OUTLINED_FUNCTION_12_5();
  sub_246A77EA8();
  OUTLINED_FUNCTION_5_6();
  return swift_release();
}

double sub_246A601E8@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  double result;
  uint64_t v8;
  __int128 v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  sub_246A77EC0();
  swift_allocObject();
  sub_246A77EB4();
  sub_246A61834();
  sub_246A77EA8();
  sub_246A4D02C(a1, a2);
  swift_release();
  if (!v3)
  {
    *(_QWORD *)a3 = v8;
    result = *(double *)&v9;
    *(_OWORD *)(a3 + 8) = v9;
    *(_BYTE *)(a3 + 24) = v10;
    *(_BYTE *)(a3 + 25) = v11;
    *(_QWORD *)(a3 + 32) = v12;
    *(_QWORD *)(a3 + 40) = v13;
  }
  return result;
}

void sub_246A602BC()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_14();
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_16_4();
  OUTLINED_FUNCTION_3_12();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_15_5();
  if (!v1)
  {
    *(_OWORD *)v0 = v2;
    *(_QWORD *)(v0 + 16) = v3;
    *(_QWORD *)(v0 + 24) = v4;
  }
  OUTLINED_FUNCTION_6_9();
}

double sub_246A60320@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  double result;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;

  sub_246A77EC0();
  swift_allocObject();
  sub_246A77EB4();
  sub_246A61744();
  sub_246A77EA8();
  sub_246A4D02C(a1, a2);
  swift_release();
  if (!v3)
  {
    result = *(double *)&v8;
    *(_OWORD *)a3 = v8;
    *(_QWORD *)(a3 + 16) = v9;
    *(_QWORD *)(a3 + 24) = v10;
    *(_BYTE *)(a3 + 32) = v11;
    *(_BYTE *)(a3 + 33) = v12;
    *(_QWORD *)(a3 + 40) = v13;
    *(_QWORD *)(a3 + 48) = v14;
  }
  return result;
}

double sub_246A603F4@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  double result;
  __int128 v8;
  uint64_t v9;

  sub_246A77EC0();
  swift_allocObject();
  sub_246A77EB4();
  sub_246A616CC();
  sub_246A77EA8();
  sub_246A4D02C(a1, a2);
  swift_release();
  if (!v3)
  {
    result = *(double *)&v8;
    *(_OWORD *)a3 = v8;
    *(_QWORD *)(a3 + 16) = v9;
  }
  return result;
}

uint64_t sub_246A604B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  char v4;

  OUTLINED_FUNCTION_2_14();
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_16_4();
  OUTLINED_FUNCTION_3_12();
  OUTLINED_FUNCTION_5_6();
  result = OUTLINED_FUNCTION_15_5();
  if (!v1)
  {
    *(_QWORD *)v0 = v3;
    *(_BYTE *)(v0 + 8) = v4;
  }
  return result;
}

uint64_t sub_246A60528@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  char v10;

  sub_246A77EC0();
  swift_allocObject();
  sub_246A77EB4();
  sub_246A615DC();
  sub_246A77EA8();
  sub_246A4D02C(a1, a2);
  result = swift_release();
  if (!v3)
  {
    *(_QWORD *)a3 = v8;
    *(_QWORD *)(a3 + 8) = v9;
    *(_BYTE *)(a3 + 16) = v10;
  }
  return result;
}

void sub_246A605E4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_14();
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_10_5();
  OUTLINED_FUNCTION_16_4();
  OUTLINED_FUNCTION_3_12();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_15_5();
  if (!v1)
  {
    *v0 = v2;
    v0[1] = v3;
    v0[2] = v4;
  }
  OUTLINED_FUNCTION_6_9();
}

__n128 sub_246A60648@<Q0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  __n128 result;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __n128 v14;
  __int128 v15;
  uint64_t v16;

  sub_246A77EC0();
  swift_allocObject();
  sub_246A77EB4();
  sub_246A614EC();
  sub_246A77EA8();
  sub_246A4D02C(a1, a2);
  swift_release();
  if (!v3)
  {
    result = v14;
    *(_QWORD *)a3 = v8;
    *(_OWORD *)(a3 + 8) = v9;
    *(_OWORD *)(a3 + 24) = v10;
    *(_QWORD *)(a3 + 40) = v11;
    *(_OWORD *)(a3 + 48) = v12;
    *(_OWORD *)(a3 + 64) = v13;
    *(__n128 *)(a3 + 80) = v14;
    *(_OWORD *)(a3 + 96) = v15;
    *(_QWORD *)(a3 + 112) = v16;
  }
  return result;
}

uint64_t CustomCanvasModel<>.init(serializedData:)(uint64_t a1, unint64_t a2)
{
  sub_246A77EC0();
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_10_5();
  sub_246A77EA8();
  sub_246A4D02C(a1, a2);
  return swift_release();
}

uint64_t sub_246A607CC()
{
  return sub_246A60818((void (*)(_QWORD))type metadata accessor for AutoSendableCompactCarPlayButton, &qword_257618270);
}

uint64_t sub_246A607F0(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  return OUTLINED_FUNCTION_8_7();
}

uint64_t sub_246A60818(void (*a1)(_QWORD), uint64_t *a2)
{
  a1(0);
  __swift_instantiateConcreteTypeFromMangledName(a2);
  return OUTLINED_FUNCTION_8_7();
}

uint64_t static CustomCanvasModel<>.name.getter()
{
  swift_getMetatypeMetadata();
  return OUTLINED_FUNCTION_8_7();
}

uint64_t sub_246A6087C()
{
  return sub_246A608A8();
}

uint64_t sub_246A608A8()
{
  OUTLINED_FUNCTION_11_4();
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_9_6();
  OUTLINED_FUNCTION_17_3();
  OUTLINED_FUNCTION_12_5();
  sub_246A77ECC();
  OUTLINED_FUNCTION_1_11();
  return OUTLINED_FUNCTION_4_7();
}

void sub_246A60920()
{
  OUTLINED_FUNCTION_11_4();
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_9_6();
  OUTLINED_FUNCTION_18_3();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_1_11();
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_13_6();
}

uint64_t sub_246A60974()
{
  uint64_t v0;

  sub_246A77EE4();
  swift_allocObject();
  sub_246A77ED8();
  sub_246A615A0();
  v0 = sub_246A77ECC();
  swift_release();
  return v0;
}

uint64_t sub_246A60A04()
{
  uint64_t v0;

  sub_246A77EE4();
  swift_allocObject();
  sub_246A77ED8();
  sub_246A617F8();
  v0 = sub_246A77ECC();
  swift_release();
  return v0;
}

uint64_t sub_246A60A9C()
{
  const void *v0;
  uint64_t v1;
  _BYTE __dst[120];

  memcpy(__dst, v0, sizeof(__dst));
  sub_246A77EE4();
  swift_allocObject();
  sub_246A77ED8();
  sub_246A614B0();
  v1 = sub_246A77ECC();
  swift_release();
  return v1;
}

uint64_t sub_246A60B34()
{
  OUTLINED_FUNCTION_11_4();
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_9_6();
  OUTLINED_FUNCTION_18_3();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_1_11();
  return OUTLINED_FUNCTION_4_7();
}

uint64_t sub_246A60B94()
{
  uint64_t v0;

  sub_246A77EE4();
  swift_allocObject();
  sub_246A77ED8();
  sub_246A61708();
  v0 = sub_246A77ECC();
  swift_release();
  return v0;
}

void sub_246A60C34()
{
  OUTLINED_FUNCTION_11_4();
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_9_6();
  OUTLINED_FUNCTION_18_3();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_1_11();
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_13_6();
}

uint64_t sub_246A60C88()
{
  uint64_t v0;

  sub_246A77EE4();
  swift_allocObject();
  sub_246A77ED8();
  sub_246A61690();
  v0 = sub_246A77ECC();
  swift_release();
  return v0;
}

uint64_t CustomCanvasModel<>.serializedData()()
{
  OUTLINED_FUNCTION_11_4();
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_9_6();
  sub_246A77ECC();
  OUTLINED_FUNCTION_1_11();
  return OUTLINED_FUNCTION_4_7();
}

uint64_t dispatch thunk of CustomCanvasModel.init(serializedData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of static CustomCanvasModel.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_246A60D9C()
{
  return sub_246A60144();
}

uint64_t sub_246A60DC8()
{
  return sub_246A60818((void (*)(_QWORD))type metadata accessor for AutoSendableCarPlayButton, &qword_257618268);
}

uint64_t sub_246A60DEC()
{
  return sub_246A608A8();
}

uint64_t sub_246A60E18()
{
  return sub_246A60144();
}

uint64_t sub_246A60E44()
{
  return sub_246A60818((void (*)(_QWORD))type metadata accessor for MapAttachment, &qword_257618260);
}

uint64_t sub_246A60E68()
{
  return sub_246A608A8();
}

void sub_246A60E94()
{
  sub_246A602BC();
}

uint64_t sub_246A60EB8()
{
  return sub_246A607F0((uint64_t)&type metadata for UnreadMessagesCarPlayButton, &qword_257618250);
}

void sub_246A60EDC()
{
  sub_246A60920();
}

uint64_t sub_246A60F08()
{
  return sub_246A604B0();
}

uint64_t sub_246A60F2C()
{
  return sub_246A607F0((uint64_t)&type metadata for PhotoAttachment, &qword_257618240);
}

uint64_t sub_246A60F50()
{
  return sub_246A60B34();
}

double sub_246A60F7C@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_246A601E8(a1, a2, a3);
}

uint64_t sub_246A60F90()
{
  return sub_246A607F0((uint64_t)&type metadata for CarPlayHeader, &qword_257618230);
}

uint64_t sub_246A60FB4()
{
  OUTLINED_FUNCTION_14_3();
  return sub_246A60A04();
}

void sub_246A60FE0()
{
  sub_246A602BC();
}

uint64_t sub_246A61004()
{
  return sub_246A607F0((uint64_t)&type metadata for UnreadMessagesCompactCarPlayButton, &qword_257618218);
}

void sub_246A61028()
{
  sub_246A60920();
}

double sub_246A61054@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_246A60320(a1, a2, a3);
}

uint64_t sub_246A61068()
{
  return sub_246A607F0((uint64_t)&type metadata for PayloadTextInput, &qword_257618200);
}

uint64_t sub_246A6108C()
{
  OUTLINED_FUNCTION_14_3();
  return sub_246A60B94();
}

uint64_t sub_246A610C0()
{
  return sub_246A60144();
}

uint64_t sub_246A610EC()
{
  return sub_246A60818((void (*)(_QWORD))type metadata accessor for AudioMessagePlayer, &qword_2576181E8);
}

uint64_t sub_246A61110()
{
  return sub_246A608A8();
}

double sub_246A6113C@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_246A603F4(a1, a2, a3);
}

uint64_t sub_246A61150()
{
  return sub_246A607F0((uint64_t)&type metadata for AppSash, &qword_2576181D0);
}

uint64_t sub_246A61174()
{
  return sub_246A60C88();
}

void sub_246A61190()
{
  sub_246A605E4();
}

uint64_t sub_246A611B4()
{
  return sub_246A607F0((uint64_t)&type metadata for ReadingCarPlayButton, &qword_2576181B8);
}

void sub_246A611D8()
{
  sub_246A60C34();
}

uint64_t sub_246A61204()
{
  return sub_246A604B0();
}

uint64_t sub_246A61228()
{
  return sub_246A607F0((uint64_t)&type metadata for VideoAttachment, &qword_2576181A8);
}

uint64_t sub_246A6124C()
{
  return sub_246A60B34();
}

uint64_t sub_246A61278@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_246A60528(a1, a2, a3);
}

uint64_t sub_246A6128C()
{
  return sub_246A607F0((uint64_t)&type metadata for TextBalloon, &qword_257618198);
}

uint64_t sub_246A612B0()
{
  return sub_246A60974();
}

void sub_246A612CC()
{
  sub_246A605E4();
}

uint64_t sub_246A612F0()
{
  return sub_246A607F0((uint64_t)&type metadata for ReadingCompactCarPlayButton, &qword_257618180);
}

void sub_246A61314()
{
  sub_246A60C34();
}

uint64_t sub_246A61340()
{
  return sub_246A60144();
}

uint64_t sub_246A6136C()
{
  return sub_246A60818((void (*)(_QWORD))type metadata accessor for LinkAttachment, &qword_257618170);
}

uint64_t sub_246A61390()
{
  return sub_246A608A8();
}

double sub_246A613BC@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_246A60648(a1, a2, a3).n128_u64[0];
  return result;
}

uint64_t sub_246A613D0()
{
  return sub_246A607F0((uint64_t)&type metadata for RecipientLabel, &qword_257618160);
}

uint64_t sub_246A613F4()
{
  const void *v0;
  _BYTE __dst[120];

  memcpy(__dst, v0, sizeof(__dst));
  return sub_246A60A9C();
}

uint64_t sub_246A61434()
{
  return sub_246A60144();
}

uint64_t sub_246A61460()
{
  return sub_246A60818((void (*)(_QWORD))type metadata accessor for AutoSendableBinaryButton, &qword_257618148);
}

uint64_t sub_246A61484()
{
  return sub_246A608A8();
}

unint64_t sub_246A614B0()
{
  unint64_t result;

  result = qword_257618158;
  if (!qword_257618158)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for RecipientLabel, &type metadata for RecipientLabel);
    atomic_store(result, (unint64_t *)&qword_257618158);
  }
  return result;
}

unint64_t sub_246A614EC()
{
  unint64_t result;

  result = qword_257618168;
  if (!qword_257618168)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for RecipientLabel, &type metadata for RecipientLabel);
    atomic_store(result, (unint64_t *)&qword_257618168);
  }
  return result;
}

unint64_t sub_246A61528()
{
  unint64_t result;

  result = qword_257618178;
  if (!qword_257618178)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for ReadingCompactCarPlayButton, &type metadata for ReadingCompactCarPlayButton);
    atomic_store(result, (unint64_t *)&qword_257618178);
  }
  return result;
}

unint64_t sub_246A61564()
{
  unint64_t result;

  result = qword_257618188;
  if (!qword_257618188)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for ReadingCompactCarPlayButton, &type metadata for ReadingCompactCarPlayButton);
    atomic_store(result, (unint64_t *)&qword_257618188);
  }
  return result;
}

unint64_t sub_246A615A0()
{
  unint64_t result;

  result = qword_257618190;
  if (!qword_257618190)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for TextBalloon, &type metadata for TextBalloon);
    atomic_store(result, (unint64_t *)&qword_257618190);
  }
  return result;
}

unint64_t sub_246A615DC()
{
  unint64_t result;

  result = qword_2576181A0;
  if (!qword_2576181A0)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for TextBalloon, &type metadata for TextBalloon);
    atomic_store(result, (unint64_t *)&qword_2576181A0);
  }
  return result;
}

unint64_t sub_246A61618()
{
  unint64_t result;

  result = qword_2576181B0;
  if (!qword_2576181B0)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for ReadingCarPlayButton, &type metadata for ReadingCarPlayButton);
    atomic_store(result, (unint64_t *)&qword_2576181B0);
  }
  return result;
}

unint64_t sub_246A61654()
{
  unint64_t result;

  result = qword_2576181C0;
  if (!qword_2576181C0)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for ReadingCarPlayButton, &type metadata for ReadingCarPlayButton);
    atomic_store(result, (unint64_t *)&qword_2576181C0);
  }
  return result;
}

unint64_t sub_246A61690()
{
  unint64_t result;

  result = qword_2576181C8;
  if (!qword_2576181C8)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for AppSash, &type metadata for AppSash);
    atomic_store(result, (unint64_t *)&qword_2576181C8);
  }
  return result;
}

unint64_t sub_246A616CC()
{
  unint64_t result;

  result = qword_2576181D8;
  if (!qword_2576181D8)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for AppSash, &type metadata for AppSash);
    atomic_store(result, (unint64_t *)&qword_2576181D8);
  }
  return result;
}

unint64_t sub_246A61708()
{
  unint64_t result;

  result = qword_2576181F8;
  if (!qword_2576181F8)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for PayloadTextInput, &type metadata for PayloadTextInput);
    atomic_store(result, (unint64_t *)&qword_2576181F8);
  }
  return result;
}

unint64_t sub_246A61744()
{
  unint64_t result;

  result = qword_257618208;
  if (!qword_257618208)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for PayloadTextInput, &type metadata for PayloadTextInput);
    atomic_store(result, (unint64_t *)&qword_257618208);
  }
  return result;
}

unint64_t sub_246A61780()
{
  unint64_t result;

  result = qword_257618210;
  if (!qword_257618210)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for UnreadMessagesCompactCarPlayButton, &type metadata for UnreadMessagesCompactCarPlayButton);
    atomic_store(result, (unint64_t *)&qword_257618210);
  }
  return result;
}

unint64_t sub_246A617BC()
{
  unint64_t result;

  result = qword_257618220;
  if (!qword_257618220)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for UnreadMessagesCompactCarPlayButton, &type metadata for UnreadMessagesCompactCarPlayButton);
    atomic_store(result, (unint64_t *)&qword_257618220);
  }
  return result;
}

unint64_t sub_246A617F8()
{
  unint64_t result;

  result = qword_257618228;
  if (!qword_257618228)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for CarPlayHeader, &type metadata for CarPlayHeader);
    atomic_store(result, (unint64_t *)&qword_257618228);
  }
  return result;
}

unint64_t sub_246A61834()
{
  unint64_t result;

  result = qword_257618238;
  if (!qword_257618238)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for CarPlayHeader, &type metadata for CarPlayHeader);
    atomic_store(result, (unint64_t *)&qword_257618238);
  }
  return result;
}

unint64_t sub_246A61870()
{
  unint64_t result;

  result = qword_257618248;
  if (!qword_257618248)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for UnreadMessagesCarPlayButton, &type metadata for UnreadMessagesCarPlayButton);
    atomic_store(result, (unint64_t *)&qword_257618248);
  }
  return result;
}

unint64_t sub_246A618AC()
{
  unint64_t result;

  result = qword_257618258;
  if (!qword_257618258)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for UnreadMessagesCarPlayButton, &type metadata for UnreadMessagesCarPlayButton);
    atomic_store(result, (unint64_t *)&qword_257618258);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_13()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_1_11()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_2_14()
{
  return sub_246A77EC0();
}

uint64_t OUTLINED_FUNCTION_3_12()
{
  return sub_246A77EA8();
}

uint64_t OUTLINED_FUNCTION_4_7()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_5_6()
{
  unint64_t v0;
  uint64_t v1;

  return sub_246A4D02C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_7_8()
{
  return sub_246A77ECC();
}

uint64_t OUTLINED_FUNCTION_8_7()
{
  return sub_246A78154();
}

uint64_t OUTLINED_FUNCTION_9_6()
{
  return sub_246A77ED8();
}

uint64_t OUTLINED_FUNCTION_10_5()
{
  return sub_246A77EB4();
}

uint64_t OUTLINED_FUNCTION_11_4()
{
  return sub_246A77EE4();
}

uint64_t OUTLINED_FUNCTION_12_5()
{
  uint64_t v0;
  unint64_t *v1;
  uint64_t (*v2)(uint64_t);

  return sub_246A4FEA4(v1, v2, v0);
}

__n128 OUTLINED_FUNCTION_14_3()
{
  __n128 *v0;

  return v0[2];
}

uint64_t OUTLINED_FUNCTION_15_5()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_16_4()
{
  uint64_t (*v0)(void);

  return v0();
}

uint64_t OUTLINED_FUNCTION_17_3()
{
  uint64_t (*v0)(_QWORD);

  return v0(0);
}

uint64_t OUTLINED_FUNCTION_18_3()
{
  uint64_t (*v0)(void);

  return v0();
}

void __swiftcall PayloadTextInput.init(payload:placeholderText:shouldUpdateWithASRText:shouldValidate:)(SiriMessagesCommon::PayloadTextInput *__return_ptr retstr, Swift::String payload, Swift::String placeholderText, Swift::Bool shouldUpdateWithASRText, Swift::Bool shouldValidate)
{
  void *object;
  uint64_t countAndFlagsBits;
  void *v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;

  object = placeholderText._object;
  countAndFlagsBits = placeholderText._countAndFlagsBits;
  v9 = payload._object;
  v10 = payload._countAndFlagsBits;
  if (qword_2576171F0 != -1)
    swift_once();
  swift_beginAccess();
  v13 = qword_257617E28;
  v12 = (void *)qword_257617E30;
  retstr->payload._countAndFlagsBits = v10;
  retstr->payload._object = v9;
  retstr->placeholderText._countAndFlagsBits = countAndFlagsBits;
  retstr->placeholderText._object = object;
  retstr->shouldUpdateWithASRText = shouldUpdateWithASRText;
  retstr->shouldValidate = shouldValidate;
  retstr->sendLabelText._countAndFlagsBits = v13;
  retstr->sendLabelText._object = v12;
  swift_bridgeObjectRetain();
}

void PayloadTextInput.payload.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_9();
}

void PayloadTextInput.payload.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t (*PayloadTextInput.payload.modify())()
{
  return nullsub_1;
}

void PayloadTextInput.placeholderText.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_9();
}

void PayloadTextInput.placeholderText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t (*PayloadTextInput.placeholderText.modify())()
{
  return nullsub_1;
}

uint64_t PayloadTextInput.shouldUpdateWithASRText.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t PayloadTextInput.shouldUpdateWithASRText.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 32) = result;
  return result;
}

uint64_t (*PayloadTextInput.shouldUpdateWithASRText.modify())()
{
  return nullsub_1;
}

uint64_t PayloadTextInput.shouldValidate.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 33);
}

uint64_t PayloadTextInput.shouldValidate.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 33) = result;
  return result;
}

uint64_t (*PayloadTextInput.shouldValidate.modify())()
{
  return nullsub_1;
}

void PayloadTextInput.sendLabelText.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_9();
}

void PayloadTextInput.sendLabelText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t (*PayloadTextInput.sendLabelText.modify())()
{
  return nullsub_1;
}

uint64_t sub_246A61C1C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  char v9;

  v3 = a1 == 0x64616F6C796170 && a2 == 0xE700000000000000;
  if (v3 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6C6F686563616C70 && a2 == 0xEF74786554726564;
    if (v6 || (sub_246A78400() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000017 && a2 == 0x8000000246A7F4E0 || (sub_246A78400() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v7 = a1 == 0x6156646C756F6873 && a2 == 0xEE0065746164696CLL;
      if (v7 || (sub_246A78400() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0x6562614C646E6573 && a2 == 0xED0000747865546CLL)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        v9 = sub_246A78400();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return 4;
        else
          return 5;
      }
    }
  }
}

uint64_t sub_246A61E54(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_246A61E8C + 4 * byte_246A7B7D0[a1]))(0xD000000000000017, 0x8000000246A7F4E0);
}

uint64_t sub_246A61E8C()
{
  return 0x64616F6C796170;
}

uint64_t sub_246A61EA4()
{
  return 0x6C6F686563616C70;
}

uint64_t sub_246A61EC8()
{
  return 0x6156646C756F6873;
}

uint64_t sub_246A61EEC()
{
  return 0x6562614C646E6573;
}

uint64_t sub_246A61F10()
{
  unsigned __int8 *v0;

  return sub_246A61E54(*v0);
}

uint64_t sub_246A61F18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A61C1C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A61F3C()
{
  sub_246A62104();
  return sub_246A784D8();
}

uint64_t sub_246A61F64()
{
  sub_246A62104();
  return sub_246A784E4();
}

void PayloadTextInput.encode(to:)()
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
  uint64_t v11;
  _QWORD v12[2];
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  OUTLINED_FUNCTION_7_9();
  v17 = v2;
  v4 = v3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618278);
  OUTLINED_FUNCTION_10_6();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v1 + 16);
  v15 = *(_QWORD *)(v1 + 24);
  v16 = v9;
  LODWORD(v9) = *(unsigned __int8 *)(v1 + 32);
  v13 = *(unsigned __int8 *)(v1 + 33);
  v14 = v9;
  v10 = *(_QWORD *)(v1 + 40);
  v12[0] = *(_QWORD *)(v1 + 48);
  v12[1] = v10;
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_246A62104();
  sub_246A784CC();
  v11 = v17;
  sub_246A783AC();
  if (!v11)
  {
    OUTLINED_FUNCTION_6_10();
    OUTLINED_FUNCTION_11_5();
    OUTLINED_FUNCTION_11_5();
    OUTLINED_FUNCTION_6_10();
  }
  (*(void (**)(char *, uint64_t))(v0 + 8))(v8, v5);
  OUTLINED_FUNCTION_8_1();
}

unint64_t sub_246A62104()
{
  unint64_t result;

  result = qword_257618280;
  if (!qword_257618280)
  {
    result = MEMORY[0x249563B60](&unk_246A7BC08, &type metadata for PayloadTextInput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618280);
  }
  return result;
}

void PayloadTextInput.init(from:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
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
  uint64_t (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  OUTLINED_FUNCTION_7_9();
  v2 = v1;
  v21 = v3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618288);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_9_7();
  if (qword_2576171F0 != -1)
    swift_once();
  swift_beginAccess();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_246A62104();
  swift_bridgeObjectRetain();
  sub_246A784B4();
  if (v0)
  {
    OUTLINED_FUNCTION_4_3();
  }
  else
  {
    v6 = OUTLINED_FUNCTION_1_12();
    v8 = v7;
    v20 = v6;
    swift_bridgeObjectRetain();
    v9 = OUTLINED_FUNCTION_1_12();
    v11 = v10;
    v18 = v9;
    OUTLINED_FUNCTION_5_4();
    v19 = v11;
    v22 = sub_246A7834C();
    v17 = sub_246A7834C();
    v12 = OUTLINED_FUNCTION_1_12();
    v14 = v13;
    v15 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    v16 = v12;
    OUTLINED_FUNCTION_2_15(v15);
    OUTLINED_FUNCTION_5_4();
    swift_bridgeObjectRelease();
    *(_QWORD *)v21 = v20;
    *(_QWORD *)(v21 + 8) = v8;
    *(_QWORD *)(v21 + 16) = v18;
    *(_QWORD *)(v21 + 24) = v19;
    *(_BYTE *)(v21 + 32) = v22 & 1;
    *(_BYTE *)(v21 + 33) = v17 & 1;
    *(_QWORD *)(v21 + 40) = v16;
    *(_QWORD *)(v21 + 48) = v14;
    OUTLINED_FUNCTION_4_3();
    OUTLINED_FUNCTION_2_9();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_8_1();
}

void sub_246A62398()
{
  PayloadTextInput.init(from:)();
}

void sub_246A623AC()
{
  PayloadTextInput.encode(to:)();
}

uint64_t static PayloadTextInputAction.== infix(_:_:)()
{
  return 1;
}

uint64_t PayloadTextInputAction.hash(into:)()
{
  return OUTLINED_FUNCTION_16_5();
}

uint64_t sub_246A623E8(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x7961506873756C66 && a2 == 0xEC00000064616F6CLL)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_246A78400();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_246A6247C()
{
  return 0x7961506873756C66;
}

uint64_t sub_246A6249C()
{
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_246A624B8()
{
  return 0;
}

uint64_t sub_246A624CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A623E8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_246A624F4()
{
  sub_246A626C0();
  return sub_246A784D8();
}

uint64_t sub_246A6251C()
{
  sub_246A626C0();
  return sub_246A784E4();
}

uint64_t sub_246A62548@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_246A6249C();
  *a1 = result & 1;
  return result;
}

uint64_t sub_246A62570()
{
  sub_246A626FC();
  return sub_246A784D8();
}

uint64_t sub_246A62598()
{
  sub_246A626FC();
  return sub_246A784E4();
}

void PayloadTextInputAction.encode(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;

  OUTLINED_FUNCTION_7_9();
  a19 = v22;
  a20 = v23;
  a10 = v21;
  v25 = v24;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618290);
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_17();
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618298);
  OUTLINED_FUNCTION_10_6();
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)&a9 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(v25, v25[3]);
  sub_246A626C0();
  sub_246A784CC();
  sub_246A626FC();
  sub_246A78388();
  OUTLINED_FUNCTION_4_8(*(uint64_t (**)(uint64_t, uint64_t))(v27 + 8));
  (*(void (**)(char *, uint64_t))(v20 + 8))(v31, v28);
  OUTLINED_FUNCTION_8_1();
}

unint64_t sub_246A626C0()
{
  unint64_t result;

  result = qword_2576182A0;
  if (!qword_2576182A0)
  {
    result = MEMORY[0x249563B60](&unk_246A7BBB8, &type metadata for PayloadTextInputAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576182A0);
  }
  return result;
}

unint64_t sub_246A626FC()
{
  unint64_t result;

  result = qword_2576182A8;
  if (!qword_2576182A8)
  {
    result = MEMORY[0x249563B60](&unk_246A7BB68, &type metadata for PayloadTextInputAction.FlushPayloadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576182A8);
  }
  return result;
}

void PayloadTextInputAction.hashValue.getter()
{
  sub_246A78484();
  OUTLINED_FUNCTION_16_5();
  sub_246A7849C();
  OUTLINED_FUNCTION_20_0();
}

void PayloadTextInputAction.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  OUTLINED_FUNCTION_7_9();
  v4 = v3;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576182B0);
  OUTLINED_FUNCTION_10_6();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_9_7();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576182B8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_17();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_246A626C0();
  v8 = v4;
  sub_246A784B4();
  if (v1)
    goto LABEL_6;
  v9 = sub_246A78370();
  v10 = *(_QWORD *)(v9 + 16);
  if (!v10
    || (sub_246A4C56C(1, v10, v9, v9 + 32, 0, (2 * v10) | 1),
        v12 = v11,
        v14 = v13,
        swift_bridgeObjectRelease(),
        v12 != v14 >> 1))
  {
    v15 = sub_246A782C8();
    swift_allocError();
    v17 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257617598);
    *v17 = &type metadata for PayloadTextInputAction;
    sub_246A7831C();
    sub_246A782BC();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v17, *MEMORY[0x24BEE26D0], v15);
    swift_willThrow();
    v8 = v4;
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_4_8(*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
LABEL_6:
    v18 = (uint64_t)v8;
    goto LABEL_7;
  }
  sub_246A626FC();
  sub_246A78310();
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v2, v19);
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_4_8(*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
  v18 = (uint64_t)v4;
LABEL_7:
  __swift_destroy_boxed_opaque_existential_1(v18);
  OUTLINED_FUNCTION_8_1();
}

void sub_246A629C0()
{
  PayloadTextInputAction.hashValue.getter();
}

uint64_t sub_246A629D4()
{
  return PayloadTextInputAction.hash(into:)();
}

void sub_246A629E8()
{
  sub_246A78484();
  OUTLINED_FUNCTION_16_5();
  sub_246A7849C();
  OUTLINED_FUNCTION_20_0();
}

void sub_246A62A18()
{
  PayloadTextInputAction.init(from:)();
}

#error "246A62A34: call analysis failed (funcsize=5)"

unint64_t sub_246A62A44()
{
  unint64_t result;

  result = qword_2576182C0;
  if (!qword_2576182C0)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for PayloadTextInputAction, &type metadata for PayloadTextInputAction);
    atomic_store(result, (unint64_t *)&qword_2576182C0);
  }
  return result;
}

uint64_t destroy for PayloadTextInput()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PayloadTextInput(uint64_t a1, uint64_t a2)
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
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PayloadTextInput(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for PayloadTextInput(uint64_t a1, uint64_t a2)
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
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PayloadTextInput(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for PayloadTextInput(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
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
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PayloadTextInput()
{
  return &type metadata for PayloadTextInput;
}

ValueMetadata *type metadata accessor for PayloadTextInputAction()
{
  return &type metadata for PayloadTextInputAction;
}

uint64_t _s18SiriMessagesCommon22PayloadTextInputActionOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_246A62D18 + 4 * byte_246A7B7D5[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_246A62D38 + 4 * byte_246A7B7DA[v4]))();
}

_BYTE *sub_246A62D18(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_246A62D38(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_246A62D40(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_246A62D48(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_246A62D50(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_246A62D58(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for PayloadTextInputAction.CodingKeys()
{
  return &type metadata for PayloadTextInputAction.CodingKeys;
}

ValueMetadata *type metadata accessor for PayloadTextInputAction.FlushPayloadCodingKeys()
{
  return &type metadata for PayloadTextInputAction.FlushPayloadCodingKeys;
}

uint64_t storeEnumTagSinglePayload for PayloadTextInput.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A62DD0 + 4 * byte_246A7B7E4[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_246A62E04 + 4 * byte_246A7B7DF[v4]))();
}

uint64_t sub_246A62E04(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A62E0C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A62E14);
  return result;
}

uint64_t sub_246A62E20(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A62E28);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_246A62E2C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A62E34(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PayloadTextInput.CodingKeys()
{
  return &type metadata for PayloadTextInput.CodingKeys;
}

unint64_t sub_246A62E54()
{
  unint64_t result;

  result = qword_2576182C8;
  if (!qword_2576182C8)
  {
    result = MEMORY[0x249563B60](&unk_246A7BA38, &type metadata for PayloadTextInput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576182C8);
  }
  return result;
}

unint64_t sub_246A62E94()
{
  unint64_t result;

  result = qword_2576182D0;
  if (!qword_2576182D0)
  {
    result = MEMORY[0x249563B60](&unk_246A7BB40, &type metadata for PayloadTextInputAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576182D0);
  }
  return result;
}

unint64_t sub_246A62ED4()
{
  unint64_t result;

  result = qword_2576182D8;
  if (!qword_2576182D8)
  {
    result = MEMORY[0x249563B60](&unk_246A7BA60, &type metadata for PayloadTextInputAction.FlushPayloadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576182D8);
  }
  return result;
}

unint64_t sub_246A62F14()
{
  unint64_t result;

  result = qword_2576182E0;
  if (!qword_2576182E0)
  {
    result = MEMORY[0x249563B60](&unk_246A7BA88, &type metadata for PayloadTextInputAction.FlushPayloadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576182E0);
  }
  return result;
}

unint64_t sub_246A62F54()
{
  unint64_t result;

  result = qword_2576182E8;
  if (!qword_2576182E8)
  {
    result = MEMORY[0x249563B60](&unk_246A7BAB0, &type metadata for PayloadTextInputAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576182E8);
  }
  return result;
}

unint64_t sub_246A62F94()
{
  unint64_t result;

  result = qword_2576182F0;
  if (!qword_2576182F0)
  {
    result = MEMORY[0x249563B60](&unk_246A7BAD8, &type metadata for PayloadTextInputAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576182F0);
  }
  return result;
}

unint64_t sub_246A62FD4()
{
  unint64_t result;

  result = qword_2576182F8;
  if (!qword_2576182F8)
  {
    result = MEMORY[0x249563B60](&unk_246A7B9A8, &type metadata for PayloadTextInput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576182F8);
  }
  return result;
}

unint64_t sub_246A63014()
{
  unint64_t result;

  result = qword_257618300;
  if (!qword_257618300)
  {
    result = MEMORY[0x249563B60](&unk_246A7B9D0, &type metadata for PayloadTextInput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618300);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_12()
{
  return sub_246A78340();
}

uint64_t OUTLINED_FUNCTION_2_15@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_4_8@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_6_10()
{
  return sub_246A783AC();
}

uint64_t OUTLINED_FUNCTION_11_5()
{
  return sub_246A783B8();
}

uint64_t OUTLINED_FUNCTION_16_5()
{
  return sub_246A78490();
}

uint64_t ConfirmationSnippetModel.MessageType.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int EnumCaseMultiPayload;
  uint64_t (*v4)(_QWORD);
  uint64_t v5;

  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_15_6();
  sub_246A64C84(v1, v0, type metadata accessor for ConfirmationSnippetModel.MessageType);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    v4 = type metadata accessor for ConfirmationSnippetModel.MessageType;
    if (EnumCaseMultiPayload == 1)
      v5 = 0x6F69647561;
    else
      v5 = 1954047348;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257618308);
    swift_bridgeObjectRelease();
    v5 = 0x656D686361747461;
    v4 = (uint64_t (*)(_QWORD))type metadata accessor for AttachmentModel;
  }
  sub_246A4BC60(v0, v4);
  return v5;
}

uint64_t type metadata accessor for ConfirmationSnippetModel.MessageType(uint64_t a1)
{
  return sub_246A64BD4(a1, qword_2576184B0);
}

uint64_t sub_246A631EC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v7;

  v3 = a1 == 12383 && a2 == 0xE200000000000000;
  if (v3 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 12639 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_246A78400();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_246A632A8(char a1)
{
  if ((a1 & 1) != 0)
    return 12639;
  else
    return 12383;
}

uint64_t sub_246A632C0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  char v8;

  v3 = a1 == 0x656D686361747461 && a2 == 0xEA0000000000746ELL;
  if (v3 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6F69647561 && a2 == 0xE500000000000000;
    if (v6 || (sub_246A78400() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 1954047348 && a2 == 0xE400000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v8 = sub_246A78400();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t sub_246A633EC(char a1)
{
  return *(_QWORD *)&aAttachmeaudio[8 * a1];
}

uint64_t sub_246A6340C(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    OUTLINED_FUNCTION_1_3();
    v4 = 0;
  }
  else
  {
    v3 = sub_246A78400();
    OUTLINED_FUNCTION_1_3();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void sub_246A63470()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_20_0();
}

uint64_t sub_246A63494()
{
  char *v0;

  return sub_246A632A8(*v0);
}

uint64_t sub_246A6349C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A631EC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A634C0()
{
  sub_246A63B8C();
  return sub_246A784D8();
}

uint64_t sub_246A634E8()
{
  sub_246A63B8C();
  return sub_246A784E4();
}

void sub_246A63510()
{
  sub_246A63470();
}

uint64_t sub_246A63528()
{
  sub_246A63B24();
  return sub_246A784D8();
}

uint64_t sub_246A63550()
{
  sub_246A63B24();
  return sub_246A784E4();
}

uint64_t sub_246A6357C()
{
  char *v0;

  return sub_246A633EC(*v0);
}

uint64_t sub_246A63584@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A632C0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A635A8()
{
  sub_246A63AAC();
  return sub_246A784D8();
}

uint64_t sub_246A635D0()
{
  sub_246A63AAC();
  return sub_246A784E4();
}

void sub_246A635F8()
{
  sub_246A78484();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_20_0();
}

uint64_t sub_246A63620@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A6340C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_246A63648()
{
  sub_246A63AE8();
  return sub_246A784D8();
}

uint64_t sub_246A63670()
{
  sub_246A63AE8();
  return sub_246A784E4();
}

void ConfirmationSnippetModel.MessageType.encode(to:)(_QWORD *a1)
{
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  int EnumCaseMultiPayload;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)();
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28[3];
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
  char v40;
  uint64_t v41;

  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618310);
  v28[0] = *(_QWORD *)(v34 - 8);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_6_0();
  v33 = v5;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618318);
  v30 = *(_QWORD *)(v31 - 8);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_6_0();
  v29 = v7;
  v28[2] = type metadata accessor for AudioMessagePlayer();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_15_6();
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618320);
  v9 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_14_1(v10, v28[0]);
  v28[1] = type metadata accessor for AttachmentModel();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_6_0();
  v35 = v12;
  type metadata accessor for ConfirmationSnippetModel.MessageType(0);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618328);
  v36 = *(_QWORD *)(v16 - 8);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_17();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A63AAC();
  sub_246A784CC();
  sub_246A64C84(v41, (uint64_t)v15, type metadata accessor for ConfirmationSnippetModel.MessageType);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    v19 = v16;
    if (EnumCaseMultiPayload != 1)
    {
      v26 = *(_QWORD *)v15;
      v25 = *((_QWORD *)v15 + 1);
      v27 = v15[16];
      LOBYTE(v38) = 2;
      sub_246A63AE8();
      OUTLINED_FUNCTION_7_0();
      v38 = v26;
      v39 = v25;
      v40 = v27;
      sub_246A615A0();
      OUTLINED_FUNCTION_21_0();
      OUTLINED_FUNCTION_22_2(*(uint64_t (**)(uint64_t, uint64_t))(v28[0] + 8));
      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v2, v19);
      swift_bridgeObjectRelease();
      goto LABEL_9;
    }
    sub_246A63B60((uint64_t)v15, v1, (uint64_t (*)(_QWORD))type metadata accessor for AudioMessagePlayer);
    LOBYTE(v38) = 1;
    sub_246A63B24();
    v20 = v29;
    OUTLINED_FUNCTION_7_0();
    sub_246A4B7F0(&qword_2576181E0, (uint64_t (*)(uint64_t))type metadata accessor for AudioMessagePlayer, (uint64_t)&protocol conformance descriptor for AudioMessagePlayer);
    v21 = v31;
    OUTLINED_FUNCTION_21_0();
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v20, v21);
    v22 = v1;
    v23 = type metadata accessor for AudioMessagePlayer;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257618308);
    sub_246A63B60((uint64_t)v15, v35, (uint64_t (*)(_QWORD))type metadata accessor for AttachmentModel);
    LOBYTE(v38) = 0;
    sub_246A63B8C();
    OUTLINED_FUNCTION_7_0();
    LOBYTE(v38) = 0;
    sub_246A4B7F0(&qword_2576175C8, (uint64_t (*)(uint64_t))type metadata accessor for AttachmentModel, (uint64_t)&protocol conformance descriptor for AttachmentModel);
    v24 = v37;
    sub_246A783D0();
    if (!v24)
    {
      LOBYTE(v38) = 1;
      sub_246A78394();
    }
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_22_2(*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
    v23 = type metadata accessor for AttachmentModel;
    v22 = v35;
  }
  sub_246A4BC60(v22, (uint64_t (*)(_QWORD))v23);
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v2, v16);
LABEL_9:
  OUTLINED_FUNCTION_8_1();
}

unint64_t sub_246A63AAC()
{
  unint64_t result;

  result = qword_257618330;
  if (!qword_257618330)
  {
    result = MEMORY[0x249563B60](&unk_246A7C37C, &type metadata for ConfirmationSnippetModel.MessageType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618330);
  }
  return result;
}

unint64_t sub_246A63AE8()
{
  unint64_t result;

  result = qword_257618338;
  if (!qword_257618338)
  {
    result = MEMORY[0x249563B60](&unk_246A7C32C, &type metadata for ConfirmationSnippetModel.MessageType.TextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618338);
  }
  return result;
}

unint64_t sub_246A63B24()
{
  unint64_t result;

  result = qword_257618340;
  if (!qword_257618340)
  {
    result = MEMORY[0x249563B60](&unk_246A7C2DC, &type metadata for ConfirmationSnippetModel.MessageType.AudioCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618340);
  }
  return result;
}

void sub_246A63B60(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_19_2(a1, a2, a3);
  OUTLINED_FUNCTION_24_2(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_9();
}

unint64_t sub_246A63B8C()
{
  unint64_t result;

  result = qword_257618348;
  if (!qword_257618348)
  {
    result = MEMORY[0x249563B60](&unk_246A7C28C, &type metadata for ConfirmationSnippetModel.MessageType.AttachmentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618348);
  }
  return result;
}

void ConfirmationSnippetModel.MessageType.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  char *v59;
  char *v60;
  char *v61;
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
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  uint64_t v78;

  v71 = a2;
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618350);
  v64 = *(_QWORD *)(v66 - 8);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_6_0();
  v69 = v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618358);
  v62 = *(_QWORD *)(v6 - 8);
  v63 = v6;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_14_1(v8, v57);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618360);
  v65 = *(_QWORD *)(v67 - 8);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_6_0();
  v70 = v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618368);
  v72 = *(_QWORD *)(v11 - 8);
  v73 = v11;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_17();
  v13 = type metadata accessor for ConfirmationSnippetModel.MessageType(0);
  OUTLINED_FUNCTION_12_0();
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v57 - v19;
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = (char *)&v57 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v57 - v24;
  v26 = a1[3];
  v74 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v26);
  sub_246A63AAC();
  v27 = v78;
  sub_246A784B4();
  if (v27)
    goto LABEL_9;
  v60 = v20;
  v61 = v23;
  v58 = v17;
  v59 = v25;
  v78 = v13;
  v28 = v73;
  v29 = v2;
  v30 = sub_246A78370();
  v31 = *(_QWORD *)(v30 + 16);
  if (!v31)
  {
LABEL_8:
    v39 = sub_246A782C8();
    swift_allocError();
    v41 = v40;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257617598);
    *v41 = v78;
    sub_246A7831C();
    sub_246A782BC();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v39 - 8) + 104))(v41, *MEMORY[0x24BEE26D0], v39);
    swift_willThrow();
    OUTLINED_FUNCTION_8_8();
    (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v29, v28);
    goto LABEL_9;
  }
  v32 = v28;
  v57 = 0;
  v33 = *(unsigned __int8 *)(v30 + 32);
  sub_246A4C56C(1, v31, v30, v30 + 32, 0, (2 * v31) | 1);
  v35 = v34;
  v37 = v36;
  swift_bridgeObjectRelease();
  if (v35 != v37 >> 1)
  {
    v28 = v32;
    v29 = v2;
    goto LABEL_8;
  }
  if (v33)
  {
    if (v33 == 1)
    {
      LOBYTE(v75) = 1;
      sub_246A63B24();
      v38 = v68;
      OUTLINED_FUNCTION_6_11();
      type metadata accessor for AudioMessagePlayer();
      sub_246A4B7F0(&qword_2576181F0, (uint64_t (*)(uint64_t))type metadata accessor for AudioMessagePlayer, (uint64_t)&protocol conformance descriptor for AudioMessagePlayer);
      OUTLINED_FUNCTION_31_0();
      OUTLINED_FUNCTION_4_9(v38, *(uint64_t (**)(uint64_t, uint64_t))(v62 + 8));
      OUTLINED_FUNCTION_8_8();
      (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v2, v32);
      v46 = (uint64_t)v60;
    }
    else
    {
      LOBYTE(v75) = 2;
      sub_246A63AE8();
      v45 = v69;
      OUTLINED_FUNCTION_6_11();
      sub_246A615DC();
      OUTLINED_FUNCTION_31_0();
      OUTLINED_FUNCTION_4_9(v45, *(uint64_t (**)(uint64_t, uint64_t))(v64 + 8));
      OUTLINED_FUNCTION_8_8();
      OUTLINED_FUNCTION_16_3(*(uint64_t (**)(uint64_t, uint64_t))(v72 + 8));
      v48 = v76;
      v49 = v77;
      v46 = (uint64_t)v58;
      *v58 = v75;
      *(_QWORD *)(v46 + 8) = v48;
      *(_BYTE *)(v46 + 16) = v49;
    }
    swift_storeEnumTagMultiPayload();
    OUTLINED_FUNCTION_29_0(v46, v50, type metadata accessor for ConfirmationSnippetModel.MessageType);
    v43 = v71;
  }
  else
  {
    LOBYTE(v75) = 0;
    sub_246A63B8C();
    v42 = v70;
    v46 = v2;
    OUTLINED_FUNCTION_6_11();
    v43 = v71;
    type metadata accessor for AttachmentModel();
    LOBYTE(v75) = 0;
    sub_246A4B7F0(&qword_2576175C0, (uint64_t (*)(uint64_t))type metadata accessor for AttachmentModel, (uint64_t)&protocol conformance descriptor for AttachmentModel);
    v44 = v67;
    OUTLINED_FUNCTION_31_0();
    LOBYTE(v75) = 1;
    v68 = sub_246A78328();
    v69 = v47;
    v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618308);
    v52 = v44;
    v53 = (uint64_t)v61;
    v54 = (uint64_t *)&v61[*(int *)(v51 + 48)];
    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v42, v52);
    OUTLINED_FUNCTION_30();
    OUTLINED_FUNCTION_12_6();
    v55 = v69;
    *v54 = v68;
    v54[1] = v55;
    swift_storeEnumTagMultiPayload();
    OUTLINED_FUNCTION_29_0(v53, v56, type metadata accessor for ConfirmationSnippetModel.MessageType);
  }
  sub_246A63B60(v46, v43, type metadata accessor for ConfirmationSnippetModel.MessageType);
LABEL_9:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v74);
  OUTLINED_FUNCTION_8_1();
}

void sub_246A64244(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  ConfirmationSnippetModel.MessageType.init(from:)(a1, a2);
}

void sub_246A64258(_QWORD *a1)
{
  ConfirmationSnippetModel.MessageType.encode(to:)(a1);
}

uint64_t ConfirmationSnippetModel.init(recipientName:messageType:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;

  if (qword_2576171F0 != -1)
    swift_once();
  swift_beginAccess();
  v8 = qword_257617EB0;
  *a4 = qword_257617EA8;
  a4[1] = v8;
  a4[2] = a1;
  a4[3] = a2;
  OUTLINED_FUNCTION_18_4();
  sub_246A63B60(a3, v9, type metadata accessor for ConfirmationSnippetModel.MessageType);
  return swift_bridgeObjectRetain();
}

uint64_t ConfirmationSnippetModel.toLabelText.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void ConfirmationSnippetModel.toLabelText.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t (*ConfirmationSnippetModel.toLabelText.modify())()
{
  return nullsub_1;
}

uint64_t ConfirmationSnippetModel.recipientName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

void ConfirmationSnippetModel.recipientName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t (*ConfirmationSnippetModel.recipientName.modify())()
{
  return nullsub_1;
}

void ConfirmationSnippetModel.messageType.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for ConfirmationSnippetModel(0);
  sub_246A64C84(v1 + *(int *)(v3 + 24), a1, type metadata accessor for ConfirmationSnippetModel.MessageType);
}

uint64_t ConfirmationSnippetModel.messageType.setter(uint64_t a1)
{
  uint64_t v2;

  OUTLINED_FUNCTION_18_4();
  return sub_246A64C04(a1, v2);
}

uint64_t (*ConfirmationSnippetModel.messageType.modify())()
{
  OUTLINED_FUNCTION_18_4();
  return nullsub_1;
}

uint64_t ConfirmationSnippetModel.description.getter()
{
  sub_246A78298();
  sub_246A78178();
  swift_bridgeObjectRetain();
  sub_246A78178();
  swift_bridgeObjectRelease();
  sub_246A78178();
  type metadata accessor for ConfirmationSnippetModel(0);
  ConfirmationSnippetModel.MessageType.description.getter();
  sub_246A78178();
  OUTLINED_FUNCTION_1_3();
  sub_246A78178();
  return 0;
}

uint64_t sub_246A64550(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  char v8;

  v3 = a1 == 0x546C6562614C6F74 && a2 == 0xEB00000000747865;
  if (v3 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6E65697069636572 && a2 == 0xED0000656D614E74;
    if (v6 || (sub_246A78400() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x546567617373656DLL && a2 == 0xEB00000000657079)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v8 = sub_246A78400();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

void sub_246A646C4()
{
  OUTLINED_FUNCTION_27();
  sub_246A78490();
  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_20_0();
}

uint64_t sub_246A646F4(char a1)
{
  return *(_QWORD *)&aTolabeltrecipi[8 * a1];
}

void sub_246A64714()
{
  sub_246A646C4();
}

void sub_246A6472C()
{
  sub_246A78484();
  sub_246A78490();
  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_20_0();
}

uint64_t sub_246A64760()
{
  char *v0;

  return sub_246A646F4(*v0);
}

uint64_t sub_246A64768@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A64550(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A6478C()
{
  sub_246A64C48();
  return sub_246A784D8();
}

uint64_t sub_246A647B4()
{
  sub_246A64C48();
  return sub_246A784E4();
}

uint64_t ConfirmationSnippetModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618370);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_12();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A64C48();
  sub_246A784CC();
  OUTLINED_FUNCTION_3_4();
  if (!v1)
  {
    OUTLINED_FUNCTION_3_4();
    type metadata accessor for ConfirmationSnippetModel(0);
    type metadata accessor for ConfirmationSnippetModel.MessageType(0);
    sub_246A4B7F0(&qword_257618380, type metadata accessor for ConfirmationSnippetModel.MessageType, (uint64_t)&protocol conformance descriptor for ConfirmationSnippetModel.MessageType);
    sub_246A783D0();
  }
  return OUTLINED_FUNCTION_16_3(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
}

void ConfirmationSnippetModel.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  type metadata accessor for ConfirmationSnippetModel.MessageType(0);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_6_0();
  v15 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257618388);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v7);
  v13 = type metadata accessor for ConfirmationSnippetModel(0);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_12();
  if (qword_2576171F0 != -1)
    swift_once();
  swift_beginAccess();
  v3[1] = qword_257617EB0;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A64C48();
  swift_bridgeObjectRetain();
  sub_246A784B4();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = OUTLINED_FUNCTION_11_6();
    v11 = v10;
    swift_bridgeObjectRelease();
    *v3 = v9;
    v3[1] = v11;
    v3[2] = OUTLINED_FUNCTION_11_6();
    v3[3] = v12;
    sub_246A4B7F0(&qword_257618390, type metadata accessor for ConfirmationSnippetModel.MessageType, (uint64_t)&protocol conformance descriptor for ConfirmationSnippetModel.MessageType);
    sub_246A78364();
    OUTLINED_FUNCTION_9_8();
    sub_246A63B60(v15, (uint64_t)v3 + *(int *)(v13 + 24), type metadata accessor for ConfirmationSnippetModel.MessageType);
    sub_246A64C84((uint64_t)v3, a2, type metadata accessor for ConfirmationSnippetModel);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    sub_246A4BC60((uint64_t)v3, type metadata accessor for ConfirmationSnippetModel);
  }
  OUTLINED_FUNCTION_8_1();
}

void sub_246A64B98(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  ConfirmationSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_246A64BAC(_QWORD *a1)
{
  return ConfirmationSnippetModel.encode(to:)(a1);
}

uint64_t type metadata accessor for ConfirmationSnippetModel(uint64_t a1)
{
  return sub_246A64BD4(a1, qword_257618400);
}

uint64_t sub_246A64BD4(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_246A64C04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ConfirmationSnippetModel.MessageType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_246A64C48()
{
  unint64_t result;

  result = qword_257618378;
  if (!qword_257618378)
  {
    result = MEMORY[0x249563B60](&unk_246A7C23C, &type metadata for ConfirmationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618378);
  }
  return result;
}

void sub_246A64C84(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_19_2(a1, a2, a3);
  OUTLINED_FUNCTION_24_2(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_9();
}

void sub_246A64CB0()
{
  sub_246A4B7F0(&qword_257618398, type metadata accessor for ConfirmationSnippetModel, (uint64_t)&protocol conformance descriptor for ConfirmationSnippetModel);
}

void sub_246A64CDC()
{
  sub_246A4B7F0(&qword_2576183A0, type metadata accessor for ConfirmationSnippetModel, (uint64_t)&protocol conformance descriptor for ConfirmationSnippetModel);
}

uint64_t *initializeBufferWithCopyOfBuffer for ConfirmationSnippetModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  int EnumCaseMultiPayload;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v22 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v22 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    v7 = *(int *)(a3 + 24);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    type metadata accessor for ConfirmationSnippetModel.MessageType(0);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v23 = *((_QWORD *)v9 + 1);
      *(_QWORD *)v8 = *(_QWORD *)v9;
      *((_QWORD *)v8 + 1) = v23;
      v8[16] = v9[16];
      swift_bridgeObjectRetain();
    }
    else
    {
      if (EnumCaseMultiPayload != 1)
      {
        type metadata accessor for AttachmentModel();
        v24 = (char *)&loc_246A64E78 + 4 * byte_246A7BC60[swift_getEnumCaseMultiPayload()];
        __asm { BR              X10 }
      }
      v11 = sub_246A77F5C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v8, v9, v11);
      v12 = (int *)type metadata accessor for AudioMessagePlayer();
      v8[v12[5]] = v9[v12[5]];
      v13 = v12[6];
      v14 = &v8[v13];
      v15 = &v9[v13];
      v17 = *(_QWORD *)v15;
      v16 = *((_QWORD *)v15 + 1);
      *(_QWORD *)v14 = v17;
      *((_QWORD *)v14 + 1) = v16;
      v18 = v12[7];
      v19 = &v8[v18];
      v20 = &v9[v18];
      v21 = *((_QWORD *)v20 + 1);
      *(_QWORD *)v19 = *(_QWORD *)v20;
      *((_QWORD *)v19 + 1) = v21;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v3;
}

uint64_t destroy for ConfirmationSnippetModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  type metadata accessor for ConfirmationSnippetModel.MessageType(0);
  result = swift_getEnumCaseMultiPayload();
  switch((_DWORD)result)
  {
    case 2:
      return swift_bridgeObjectRelease();
    case 1:
      v7 = sub_246A77F5C();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v4, v7);
      type metadata accessor for AudioMessagePlayer();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    case 0:
      type metadata accessor for AttachmentModel();
      switch(swift_getEnumCaseMultiPayload())
      {
        case 0u:
        case 1u:
          v6 = sub_246A77F5C();
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
          break;
        case 2u:
        case 3u:
          swift_release();
          break;
        default:
          break;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_257618308);
      return swift_bridgeObjectRelease();
  }
  return result;
}

_QWORD *initializeWithCopy for ConfirmationSnippetModel(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  int EnumCaseMultiPayload;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  type metadata accessor for ConfirmationSnippetModel.MessageType(0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v21 = *((_QWORD *)v8 + 1);
    *(_QWORD *)v7 = *(_QWORD *)v8;
    *((_QWORD *)v7 + 1) = v21;
    v7[16] = v8[16];
  }
  else
  {
    if (EnumCaseMultiPayload != 1)
    {
      type metadata accessor for AttachmentModel();
      v22 = (char *)&loc_246A6519C + 4 * byte_246A7BC68[swift_getEnumCaseMultiPayload()];
      __asm { BR              X10 }
    }
    v10 = sub_246A77F5C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v7, v8, v10);
    v11 = (int *)type metadata accessor for AudioMessagePlayer();
    v7[v11[5]] = v8[v11[5]];
    v12 = v11[6];
    v13 = &v7[v12];
    v14 = &v8[v12];
    v16 = *(_QWORD *)v14;
    v15 = *((_QWORD *)v14 + 1);
    *(_QWORD *)v13 = v16;
    *((_QWORD *)v13 + 1) = v15;
    v17 = v11[7];
    v18 = &v7[v17];
    v19 = &v8[v17];
    v20 = *((_QWORD *)v19 + 1);
    *(_QWORD *)v18 = *(_QWORD *)v19;
    *((_QWORD *)v18 + 1) = v20;
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *assignWithCopy for ConfirmationSnippetModel(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  int EnumCaseMultiPayload;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    v6 = *(int *)(a3 + 24);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    sub_246A4BC60((uint64_t)a1 + v6, type metadata accessor for ConfirmationSnippetModel.MessageType);
    type metadata accessor for ConfirmationSnippetModel.MessageType(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *(_QWORD *)v7 = *(_QWORD *)v8;
      *((_QWORD *)v7 + 1) = *((_QWORD *)v8 + 1);
      v7[16] = v8[16];
    }
    else
    {
      if (EnumCaseMultiPayload != 1)
      {
        type metadata accessor for AttachmentModel();
        v18 = (char *)&loc_246A653F8 + 4 * byte_246A7BC6C[swift_getEnumCaseMultiPayload()];
        __asm { BR              X10 }
      }
      v10 = sub_246A77F5C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v7, v8, v10);
      v11 = (int *)type metadata accessor for AudioMessagePlayer();
      v7[v11[5]] = v8[v11[5]];
      v12 = v11[6];
      v13 = &v7[v12];
      v14 = &v8[v12];
      *(_QWORD *)v13 = *(_QWORD *)v14;
      *((_QWORD *)v13 + 1) = *((_QWORD *)v14 + 1);
      v15 = v11[7];
      v16 = &v7[v15];
      v17 = &v8[v15];
      *(_QWORD *)v16 = *(_QWORD *)v17;
      *((_QWORD *)v16 + 1) = *((_QWORD *)v17 + 1);
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *initializeWithTake for ConfirmationSnippetModel(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  int EnumCaseMultiPayload;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 24);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = type metadata accessor for ConfirmationSnippetModel.MessageType(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v14 = sub_246A77F5C();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v6, v7, v14);
    v15 = (int *)type metadata accessor for AudioMessagePlayer();
    v6[v15[5]] = v7[v15[5]];
    *(_OWORD *)&v6[v15[6]] = *(_OWORD *)&v7[v15[6]];
    *(_OWORD *)&v6[v15[7]] = *(_OWORD *)&v7[v15[7]];
LABEL_12:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  if (!EnumCaseMultiPayload)
  {
    v10 = type metadata accessor for AttachmentModel();
    v11 = swift_getEnumCaseMultiPayload();
    if (v11 == 1)
    {
      v16 = sub_246A77F5C();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v6, v7, v16);
      v17 = type metadata accessor for MapAttachment();
      v6[*(int *)(v17 + 20)] = v7[*(int *)(v17 + 20)];
    }
    else
    {
      if (v11)
      {
        memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
        goto LABEL_11;
      }
      v12 = sub_246A77F5C();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v6, v7, v12);
      v13 = type metadata accessor for LinkAttachment();
      v6[*(int *)(v13 + 20)] = v7[*(int *)(v13 + 20)];
    }
    swift_storeEnumTagMultiPayload();
LABEL_11:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618308);
    *(_OWORD *)&v6[*(int *)(v18 + 48)] = *(_OWORD *)&v7[*(int *)(v18 + 48)];
    goto LABEL_12;
  }
  memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  return a1;
}

_QWORD *assignWithTake for ConfirmationSnippetModel(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  uint64_t v11;
  int EnumCaseMultiPayload;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    v8 = *(int *)(a3 + 24);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    sub_246A4BC60((uint64_t)a1 + v8, type metadata accessor for ConfirmationSnippetModel.MessageType);
    v11 = type metadata accessor for ConfirmationSnippetModel.MessageType(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v17 = sub_246A77F5C();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v9, v10, v17);
      v18 = (int *)type metadata accessor for AudioMessagePlayer();
      v9[v18[5]] = v10[v18[5]];
      *(_OWORD *)&v9[v18[6]] = *(_OWORD *)&v10[v18[6]];
      *(_OWORD *)&v9[v18[7]] = *(_OWORD *)&v10[v18[7]];
LABEL_13:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      v13 = type metadata accessor for AttachmentModel();
      v14 = swift_getEnumCaseMultiPayload();
      if (v14 == 1)
      {
        v19 = sub_246A77F5C();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v9, v10, v19);
        v20 = type metadata accessor for MapAttachment();
        v9[*(int *)(v20 + 20)] = v10[*(int *)(v20 + 20)];
      }
      else
      {
        if (v14)
        {
          memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
          goto LABEL_12;
        }
        v15 = sub_246A77F5C();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v9, v10, v15);
        v16 = type metadata accessor for LinkAttachment();
        v9[*(int *)(v16 + 20)] = v10[*(int *)(v16 + 20)];
      }
      swift_storeEnumTagMultiPayload();
LABEL_12:
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618308);
      *(_OWORD *)&v9[*(int *)(v21 + 48)] = *(_OWORD *)&v10[*(int *)(v21 + 48)];
      goto LABEL_13;
    }
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for ConfirmationSnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246A658B0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = OUTLINED_FUNCTION_28();
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for ConfirmationSnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_246A6592C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(a1 + 8) = (a2 - 1);
    OUTLINED_FUNCTION_1();
  }
  else
  {
    v7 = OUTLINED_FUNCTION_28();
    __swift_storeEnumTagSinglePayload(a1 + *(int *)(a4 + 24), a2, a2, v7);
  }
}

uint64_t sub_246A6598C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for ConfirmationSnippetModel.MessageType(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ConfirmationSnippetModel.MessageType(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  int EnumCaseMultiPayload;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v18 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v19 = a2[1];
      *(_QWORD *)a1 = *a2;
      *(_QWORD *)(a1 + 8) = v19;
      *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
      swift_bridgeObjectRetain();
    }
    else
    {
      if (EnumCaseMultiPayload != 1)
      {
        type metadata accessor for AttachmentModel();
        v20 = (char *)&loc_246A65B38 + 4 * byte_246A7BC70[swift_getEnumCaseMultiPayload()];
        __asm { BR              X10 }
      }
      v7 = sub_246A77F5C();
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = (int *)type metadata accessor for AudioMessagePlayer();
      *(_BYTE *)(a1 + v8[5]) = *((_BYTE *)a2 + v8[5]);
      v9 = v8[6];
      v10 = (_QWORD *)(a1 + v9);
      v11 = (uint64_t *)((char *)a2 + v9);
      v13 = *v11;
      v12 = v11[1];
      *v10 = v13;
      v10[1] = v12;
      v14 = v8[7];
      v15 = (_QWORD *)(a1 + v14);
      v16 = (uint64_t *)((char *)a2 + v14);
      v17 = v16[1];
      *v15 = *v16;
      v15[1] = v17;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for ConfirmationSnippetModel.MessageType(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = swift_getEnumCaseMultiPayload();
  switch((_DWORD)result)
  {
    case 2:
      return swift_bridgeObjectRelease();
    case 1:
      v4 = sub_246A77F5C();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
      type metadata accessor for AudioMessagePlayer();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    case 0:
      type metadata accessor for AttachmentModel();
      switch(swift_getEnumCaseMultiPayload())
      {
        case 0u:
        case 1u:
          v3 = sub_246A77F5C();
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
          break;
        case 2u:
        case 3u:
          swift_release();
          break;
        default:
          break;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_257618308);
      return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for ConfirmationSnippetModel.MessageType(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v16 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v16;
    *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
    swift_bridgeObjectRetain();
  }
  else
  {
    if (EnumCaseMultiPayload != 1)
    {
      type metadata accessor for AttachmentModel();
      v17 = (char *)&loc_246A65E58 + 4 * byte_246A7BC78[swift_getEnumCaseMultiPayload()];
      __asm { BR              X10 }
    }
    v5 = sub_246A77F5C();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
    v6 = (int *)type metadata accessor for AudioMessagePlayer();
    *(_BYTE *)(a1 + v6[5]) = *(_BYTE *)(a2 + v6[5]);
    v7 = v6[6];
    v8 = (_QWORD *)(a1 + v7);
    v9 = (uint64_t *)(a2 + v7);
    v11 = *v9;
    v10 = v9[1];
    *v8 = v11;
    v8[1] = v10;
    v12 = v6[7];
    v13 = (_QWORD *)(a1 + v12);
    v14 = (_QWORD *)(a2 + v12);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for ConfirmationSnippetModel.MessageType(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  char *v13;

  if (a1 != a2)
  {
    sub_246A4BC60(a1, type metadata accessor for ConfirmationSnippetModel.MessageType);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
      *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
      swift_bridgeObjectRetain();
    }
    else
    {
      if (EnumCaseMultiPayload != 1)
      {
        type metadata accessor for AttachmentModel();
        v13 = (char *)&loc_246A660AC + 4 * byte_246A7BC7C[swift_getEnumCaseMultiPayload()];
        __asm { BR              X10 }
      }
      v5 = sub_246A77F5C();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
      v6 = (int *)type metadata accessor for AudioMessagePlayer();
      *(_BYTE *)(a1 + v6[5]) = *(_BYTE *)(a2 + v6[5]);
      v7 = v6[6];
      v8 = (_QWORD *)(a1 + v7);
      v9 = (_QWORD *)(a2 + v7);
      *v8 = *v9;
      v8[1] = v9[1];
      v10 = v6[7];
      v11 = (_QWORD *)(a1 + v10);
      v12 = (_QWORD *)(a2 + v10);
      *v11 = *v12;
      v11[1] = v12[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_BYTE *initializeWithTake for ConfirmationSnippetModel.MessageType(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v11 = sub_246A77F5C();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, a2, v11);
    v12 = (int *)type metadata accessor for AudioMessagePlayer();
    a1[v12[5]] = a2[v12[5]];
    *(_OWORD *)&a1[v12[6]] = *(_OWORD *)&a2[v12[6]];
    *(_OWORD *)&a1[v12[7]] = *(_OWORD *)&a2[v12[7]];
LABEL_12:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  if (!EnumCaseMultiPayload)
  {
    v7 = type metadata accessor for AttachmentModel();
    v8 = swift_getEnumCaseMultiPayload();
    if (v8 == 1)
    {
      v13 = sub_246A77F5C();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(a1, a2, v13);
      v14 = type metadata accessor for MapAttachment();
      a1[*(int *)(v14 + 20)] = a2[*(int *)(v14 + 20)];
    }
    else
    {
      if (v8)
      {
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
        goto LABEL_11;
      }
      v9 = sub_246A77F5C();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
      v10 = type metadata accessor for LinkAttachment();
      a1[*(int *)(v10 + 20)] = a2[*(int *)(v10 + 20)];
    }
    swift_storeEnumTagMultiPayload();
LABEL_11:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618308);
    *(_OWORD *)&a1[*(int *)(v15 + 48)] = *(_OWORD *)&a2[*(int *)(v15 + 48)];
    goto LABEL_12;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

_BYTE *assignWithTake for ConfirmationSnippetModel.MessageType(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a1 != a2)
  {
    sub_246A4BC60((uint64_t)a1, type metadata accessor for ConfirmationSnippetModel.MessageType);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v11 = sub_246A77F5C();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, a2, v11);
      v12 = (int *)type metadata accessor for AudioMessagePlayer();
      a1[v12[5]] = a2[v12[5]];
      *(_OWORD *)&a1[v12[6]] = *(_OWORD *)&a2[v12[6]];
      *(_OWORD *)&a1[v12[7]] = *(_OWORD *)&a2[v12[7]];
LABEL_13:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      v7 = type metadata accessor for AttachmentModel();
      v8 = swift_getEnumCaseMultiPayload();
      if (v8 == 1)
      {
        v13 = sub_246A77F5C();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(a1, a2, v13);
        v14 = type metadata accessor for MapAttachment();
        a1[*(int *)(v14 + 20)] = a2[*(int *)(v14 + 20)];
      }
      else
      {
        if (v8)
        {
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
          goto LABEL_12;
        }
        v9 = sub_246A77F5C();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
        v10 = type metadata accessor for LinkAttachment();
        a1[*(int *)(v10 + 20)] = a2[*(int *)(v10 + 20)];
      }
      swift_storeEnumTagMultiPayload();
LABEL_12:
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618308);
      *(_OWORD *)&a1[*(int *)(v15 + 48)] = *(_OWORD *)&a2[*(int *)(v15 + 48)];
      goto LABEL_13;
    }
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_246A66534()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  char v3;
  char *v4;
  uint64_t v5;
  void *v6;

  result = type metadata accessor for AttachmentModel();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v4 = &v3;
    result = type metadata accessor for AudioMessagePlayer();
    if (v2 <= 0x3F)
    {
      v5 = *(_QWORD *)(result - 8) + 64;
      v6 = &unk_246A7BE40;
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ConfirmationSnippetModel.CodingKeys()
{
  return &type metadata for ConfirmationSnippetModel.CodingKeys;
}

uint64_t _s18SiriMessagesCommon24ConfirmationSnippetModelV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A66634 + 4 * byte_246A7BC85[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_246A66668 + 4 * byte_246A7BC80[v4]))();
}

uint64_t sub_246A66668(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A66670(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A66678);
  return result;
}

uint64_t sub_246A66684(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A6668CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_246A66690(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A66698(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ConfirmationSnippetModel.MessageType.CodingKeys()
{
  return &type metadata for ConfirmationSnippetModel.MessageType.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for ConfirmationSnippetModel.MessageType.AttachmentCodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A66700 + 4 * byte_246A7BC8F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_246A66734 + 4 * byte_246A7BC8A[v4]))();
}

uint64_t sub_246A66734(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A6673C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A66744);
  return result;
}

uint64_t sub_246A66750(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A66758);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_246A6675C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A66764(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ConfirmationSnippetModel.MessageType.AttachmentCodingKeys()
{
  return &type metadata for ConfirmationSnippetModel.MessageType.AttachmentCodingKeys;
}

ValueMetadata *type metadata accessor for ConfirmationSnippetModel.MessageType.AudioCodingKeys()
{
  return &type metadata for ConfirmationSnippetModel.MessageType.AudioCodingKeys;
}

uint64_t _s18SiriMessagesCommon24ConfirmationSnippetModelV11MessageTypeO15AudioCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_246A667D4 + 4 * byte_246A7BC94[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_246A667F4 + 4 * byte_246A7BC99[v4]))();
}

_BYTE *sub_246A667D4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_246A667F4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_246A667FC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_246A66804(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_246A6680C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_246A66814(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ConfirmationSnippetModel.MessageType.TextCodingKeys()
{
  return &type metadata for ConfirmationSnippetModel.MessageType.TextCodingKeys;
}

unint64_t sub_246A66834()
{
  unint64_t result;

  result = qword_2576184E8;
  if (!qword_2576184E8)
  {
    result = MEMORY[0x249563B60](&unk_246A7BF34, &type metadata for ConfirmationSnippetModel.MessageType.TextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576184E8);
  }
  return result;
}

unint64_t sub_246A66874()
{
  unint64_t result;

  result = qword_2576184F0;
  if (!qword_2576184F0)
  {
    result = MEMORY[0x249563B60](&unk_246A7BFEC, &type metadata for ConfirmationSnippetModel.MessageType.AudioCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576184F0);
  }
  return result;
}

unint64_t sub_246A668B4()
{
  unint64_t result;

  result = qword_2576184F8;
  if (!qword_2576184F8)
  {
    result = MEMORY[0x249563B60](&unk_246A7C0A4, &type metadata for ConfirmationSnippetModel.MessageType.AttachmentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576184F8);
  }
  return result;
}

unint64_t sub_246A668F4()
{
  unint64_t result;

  result = qword_257618500;
  if (!qword_257618500)
  {
    result = MEMORY[0x249563B60](&unk_246A7C15C, &type metadata for ConfirmationSnippetModel.MessageType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618500);
  }
  return result;
}

unint64_t sub_246A66934()
{
  unint64_t result;

  result = qword_257618508;
  if (!qword_257618508)
  {
    result = MEMORY[0x249563B60](&unk_246A7C214, &type metadata for ConfirmationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618508);
  }
  return result;
}

unint64_t sub_246A66974()
{
  unint64_t result;

  result = qword_257618510;
  if (!qword_257618510)
  {
    result = MEMORY[0x249563B60](&unk_246A7C184, &type metadata for ConfirmationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618510);
  }
  return result;
}

unint64_t sub_246A669B4()
{
  unint64_t result;

  result = qword_257618518;
  if (!qword_257618518)
  {
    result = MEMORY[0x249563B60](&unk_246A7C1AC, &type metadata for ConfirmationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618518);
  }
  return result;
}

unint64_t sub_246A669F4()
{
  unint64_t result;

  result = qword_257618520;
  if (!qword_257618520)
  {
    result = MEMORY[0x249563B60](&unk_246A7C014, &type metadata for ConfirmationSnippetModel.MessageType.AttachmentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618520);
  }
  return result;
}

unint64_t sub_246A66A34()
{
  unint64_t result;

  result = qword_257618528;
  if (!qword_257618528)
  {
    result = MEMORY[0x249563B60](&unk_246A7C03C, &type metadata for ConfirmationSnippetModel.MessageType.AttachmentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618528);
  }
  return result;
}

unint64_t sub_246A66A74()
{
  unint64_t result;

  result = qword_257618530;
  if (!qword_257618530)
  {
    result = MEMORY[0x249563B60](&unk_246A7BF5C, &type metadata for ConfirmationSnippetModel.MessageType.AudioCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618530);
  }
  return result;
}

unint64_t sub_246A66AB4()
{
  unint64_t result;

  result = qword_257618538;
  if (!qword_257618538)
  {
    result = MEMORY[0x249563B60](&unk_246A7BF84, &type metadata for ConfirmationSnippetModel.MessageType.AudioCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618538);
  }
  return result;
}

unint64_t sub_246A66AF4()
{
  unint64_t result;

  result = qword_257618540;
  if (!qword_257618540)
  {
    result = MEMORY[0x249563B60](&unk_246A7BEA4, &type metadata for ConfirmationSnippetModel.MessageType.TextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618540);
  }
  return result;
}

unint64_t sub_246A66B34()
{
  unint64_t result;

  result = qword_257618548;
  if (!qword_257618548)
  {
    result = MEMORY[0x249563B60](&unk_246A7BECC, &type metadata for ConfirmationSnippetModel.MessageType.TextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618548);
  }
  return result;
}

unint64_t sub_246A66B74()
{
  unint64_t result;

  result = qword_257618550;
  if (!qword_257618550)
  {
    result = MEMORY[0x249563B60](&unk_246A7C0CC, &type metadata for ConfirmationSnippetModel.MessageType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618550);
  }
  return result;
}

unint64_t sub_246A66BB4()
{
  unint64_t result;

  result = qword_257618558;
  if (!qword_257618558)
  {
    result = MEMORY[0x249563B60](&unk_246A7C0F4, &type metadata for ConfirmationSnippetModel.MessageType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618558);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4_9@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_6_11()
{
  return sub_246A78310();
}

uint64_t OUTLINED_FUNCTION_8_8()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_9_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 112) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_11_6()
{
  return sub_246A78340();
}

uint64_t OUTLINED_FUNCTION_12_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_13_7()
{
  return sub_246A7849C();
}

uint64_t OUTLINED_FUNCTION_18_4()
{
  return type metadata accessor for ConfirmationSnippetModel(0);
}

uint64_t OUTLINED_FUNCTION_19_2(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return sub_246A783D0();
}

uint64_t OUTLINED_FUNCTION_22_2@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_24_2@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_27()
{
  return sub_246A78484();
}

uint64_t OUTLINED_FUNCTION_28()
{
  return type metadata accessor for ConfirmationSnippetModel.MessageType(0);
}

void OUTLINED_FUNCTION_29_0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_246A63B60(a1, *(_QWORD *)(v3 - 240), a3);
}

uint64_t OUTLINED_FUNCTION_30()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return sub_246A78364();
}

uint64_t AudioMessagePlayer.init(audioMessageURL:isDraft:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  int *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = (int *)OUTLINED_FUNCTION_0_14();
  v7 = v6[6];
  if (qword_2576171F0 != -1)
    swift_once();
  v8 = (_QWORD *)(a3 + v7);
  swift_beginAccess();
  v9 = qword_257617E30;
  *v8 = qword_257617E28;
  v8[1] = v9;
  v10 = (_QWORD *)(a3 + v6[7]);
  v11 = unk_257617E80;
  *v10 = qword_257617E78;
  v10[1] = v11;
  v12 = OUTLINED_FUNCTION_2_2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(a3, a1, v12);
  *(_BYTE *)(a3 + v6[5]) = a2 & 1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for AudioMessagePlayer()
{
  uint64_t result;

  result = qword_2576185D0;
  if (!qword_2576185D0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t AudioMessagePlayer.audioMessageURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_2_2();
  return OUTLINED_FUNCTION_3_3(a1, v1, v3, *(uint64_t (**)(void))(*(_QWORD *)(v3 - 8) + 16));
}

uint64_t AudioMessagePlayer.audioMessageURL.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_2_2();
  return OUTLINED_FUNCTION_3_3(v1, a1, v3, *(uint64_t (**)(void))(*(_QWORD *)(v3 - 8) + 40));
}

uint64_t (*AudioMessagePlayer.audioMessageURL.modify())()
{
  return nullsub_1;
}

uint64_t AudioMessagePlayer.isDraft.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(OUTLINED_FUNCTION_0_14() + 20));
}

uint64_t AudioMessagePlayer.isDraft.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = OUTLINED_FUNCTION_0_14();
  *(_BYTE *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*AudioMessagePlayer.isDraft.modify())()
{
  OUTLINED_FUNCTION_0_14();
  return nullsub_1;
}

uint64_t AudioMessagePlayer.sendLabelText.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_7_10();
  return v0;
}

void AudioMessagePlayer.sendLabelText.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_10_7();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t (*AudioMessagePlayer.sendLabelText.modify())()
{
  OUTLINED_FUNCTION_0_14();
  return nullsub_1;
}

uint64_t AudioMessagePlayer.audioMessageLabelText.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_7_10();
  return v0;
}

void AudioMessagePlayer.audioMessageLabelText.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_10_7();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t (*AudioMessagePlayer.audioMessageLabelText.modify())()
{
  OUTLINED_FUNCTION_0_14();
  return nullsub_1;
}

uint64_t sub_246A66FE8(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  char v8;

  v3 = a1 == 0x73654D6F69647561 && a2 == 0xEF4C525565676173;
  if (v3 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x74666172447369 && a2 == 0xE700000000000000;
    if (v6 || (sub_246A78400() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6562614C646E6573 && a2 == 0xED0000747865546CLL;
      if (v7 || (sub_246A78400() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000015 && a2 == 0x8000000246A7F590)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v8 = sub_246A78400();
        swift_bridgeObjectRelease();
        if ((v8 & 1) != 0)
          return 3;
        else
          return 4;
      }
    }
  }
}

uint64_t sub_246A671AC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_246A671E4 + 4 * byte_246A7C430[a1]))(0xD000000000000015, 0x8000000246A7F590);
}

uint64_t sub_246A671E4()
{
  return 0x73654D6F69647561;
}

uint64_t sub_246A67208()
{
  return 0x6562614C646E6573;
}

uint64_t sub_246A6722C()
{
  return 0x74666172447369;
}

uint64_t sub_246A67244()
{
  unsigned __int8 *v0;

  return sub_246A671AC(*v0);
}

uint64_t sub_246A6724C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A66FE8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A67270()
{
  sub_246A6744C();
  return sub_246A784D8();
}

uint64_t sub_246A67298()
{
  sub_246A6744C();
  return sub_246A784E4();
}

uint64_t AudioMessagePlayer.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618560);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_15_0();
  v7 = v6 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A6744C();
  sub_246A784CC();
  sub_246A77F5C();
  sub_246A677C4(&qword_2576179C0, MEMORY[0x24BDCDAE0]);
  sub_246A783D0();
  if (!v1)
  {
    type metadata accessor for AudioMessagePlayer();
    sub_246A783B8();
    OUTLINED_FUNCTION_9_9();
    OUTLINED_FUNCTION_9_9();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_246A6744C()
{
  unint64_t result;

  result = qword_257618568;
  if (!qword_257618568)
  {
    result = MEMORY[0x249563B60](&unk_246A7C5DC, &type metadata for AudioMessagePlayer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618568);
  }
  return result;
}

uint64_t AudioMessagePlayer.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;

  v25 = sub_246A77F5C();
  v22 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_15_0();
  v23 = v4 - v3;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618570);
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_15_0();
  v5 = type metadata accessor for AudioMessagePlayer();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_15_0();
  v8 = v7 - v6;
  v10 = (uint64_t *)(v7 - v6 + *(int *)(v9 + 24));
  if (qword_2576171F0 != -1)
    swift_once();
  swift_beginAccess();
  v11 = qword_257617E30;
  *v10 = qword_257617E28;
  v10[1] = v11;
  v12 = (uint64_t *)(v8 + *(int *)(v5 + 28));
  v13 = unk_257617E80;
  *v12 = qword_257617E78;
  v12[1] = v13;
  v26 = v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A6744C();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_246A784B4();
  if (v27)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_246A677C4(&qword_2576179D0, MEMORY[0x24BDCDB10]);
    sub_246A78364();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32))(v8, v23, v25);
    OUTLINED_FUNCTION_8_9(1);
    *(_BYTE *)(v8 + *(int *)(v5 + 20)) = sub_246A7834C() & 1;
    OUTLINED_FUNCTION_8_9(2);
    v14 = sub_246A78340();
    v16 = v15;
    swift_bridgeObjectRelease();
    *v10 = v14;
    v10[1] = v16;
    v17 = sub_246A78340();
    v19 = v18;
    OUTLINED_FUNCTION_4_10();
    swift_bridgeObjectRelease();
    *v26 = v17;
    v26[1] = v19;
    sub_246A67804(v8, a2);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_246A67848(v8);
  }
}

uint64_t sub_246A677C4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_246A77F5C();
    result = MEMORY[0x249563B60](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_246A67804(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AudioMessagePlayer();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246A67848(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AudioMessagePlayer();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_246A67884@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return AudioMessagePlayer.init(from:)(a1, a2);
}

uint64_t sub_246A67898(_QWORD *a1)
{
  return AudioMessagePlayer.encode(to:)(a1);
}

_QWORD *initializeBufferWithCopyOfBuffer for AudioMessagePlayer(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
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
    a1 = (_QWORD *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_246A77F5C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    v9 = (_QWORD *)((char *)a1 + v8);
    v10 = (_QWORD *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    v12 = a3[7];
    v13 = (_QWORD *)((char *)a1 + v12);
    v14 = (_QWORD *)((char *)a2 + v12);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for AudioMessagePlayer(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_246A77F5C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AudioMessagePlayer(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  v6 = sub_246A77F5C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  v11 = a3[7];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AudioMessagePlayer(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  v6 = sub_246A77F5C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v7 = a3[6];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[7];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for AudioMessagePlayer(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_246A77F5C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for AudioMessagePlayer(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = sub_246A77F5C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = a3[7];
  v13 = (_QWORD *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v16 = *v14;
  v15 = v14[1];
  *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AudioMessagePlayer()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246A67C08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;

  v6 = OUTLINED_FUNCTION_2_2();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AudioMessagePlayer()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_246A67C8C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;

  v8 = OUTLINED_FUNCTION_2_2();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
    OUTLINED_FUNCTION_1();
  }
}

uint64_t sub_246A67CF8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_246A77F5C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for AudioMessagePlayer.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A67DC0 + 4 * byte_246A7C439[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_246A67DF4 + 4 * byte_246A7C434[v4]))();
}

uint64_t sub_246A67DF4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A67DFC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A67E04);
  return result;
}

uint64_t sub_246A67E10(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A67E18);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_246A67E1C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A67E24(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AudioMessagePlayer.CodingKeys()
{
  return &type metadata for AudioMessagePlayer.CodingKeys;
}

unint64_t sub_246A67E44()
{
  unint64_t result;

  result = qword_257618610;
  if (!qword_257618610)
  {
    result = MEMORY[0x249563B60](&unk_246A7C5B4, &type metadata for AudioMessagePlayer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618610);
  }
  return result;
}

unint64_t sub_246A67E84()
{
  unint64_t result;

  result = qword_257618618;
  if (!qword_257618618)
  {
    result = MEMORY[0x249563B60](&unk_246A7C524, &type metadata for AudioMessagePlayer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618618);
  }
  return result;
}

unint64_t sub_246A67EC4()
{
  unint64_t result;

  result = qword_257618620;
  if (!qword_257618620)
  {
    result = MEMORY[0x249563B60](&unk_246A7C54C, &type metadata for AudioMessagePlayer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618620);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_14()
{
  return type metadata accessor for AudioMessagePlayer();
}

uint64_t OUTLINED_FUNCTION_1_13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 160) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_4_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 160) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_7_10()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_8_9@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 65) = a1;
  return v1 - 65;
}

uint64_t OUTLINED_FUNCTION_9_9()
{
  return sub_246A783AC();
}

uint64_t OUTLINED_FUNCTION_10_7()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_246A67F74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_246A67F88(a1, a2);
}

uint64_t sub_246A67F88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  uint64_t result;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  char v18;
  __int128 v19;
  uint64_t v20;

  *(_QWORD *)&v19 = 0x692D6E6F69746361;
  *((_QWORD *)&v19 + 1) = 0xE900000000000064;
  sub_246A78274();
  sub_246A4D95C((uint64_t)&v16, a1, &v19);
  sub_246A4DE7C((uint64_t)&v16);
  if (v20)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v6 = v14;
      v5 = v15;
      goto LABEL_6;
    }
  }
  else
  {
    sub_246A68C24((uint64_t)&v19, &qword_257618628);
  }
  v6 = 0;
  v5 = 0;
LABEL_6:
  *(_QWORD *)&v16 = &type metadata for UpdateSnippetAction;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257618660);
  v7 = sub_246A78154();
  if (!v5)
  {
    swift_bridgeObjectRelease();
LABEL_14:
    result = swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  if (v6 == v7 && v5 == v8)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = sub_246A78400();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
      goto LABEL_14;
  }
  sub_246A78274();
  sub_246A4D95C((uint64_t)&v16, a1, &v19);
  swift_bridgeObjectRelease();
  sub_246A4DE7C((uint64_t)&v16);
  if (!v20)
  {
    result = sub_246A68C24((uint64_t)&v19, &qword_257618628);
    goto LABEL_21;
  }
  result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
LABEL_21:
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_BYTE *)(a2 + 24) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    return result;
  }
  sub_246A77EC0();
  swift_allocObject();
  sub_246A77EB4();
  sub_246A68E68();
  sub_246A77EA8();
  sub_246A4D02C(0x642D6E6F69746361, 0xEB00000000617461);
  result = swift_release();
  if (!v2)
  {
    v12 = v17;
    v13 = v18;
    *(_OWORD *)a2 = v16;
    *(_QWORD *)(a2 + 16) = v12;
    *(_BYTE *)(a2 + 24) = v13;
  }
  return result;
}

uint64_t sub_246A68228@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  uint64_t result;
  char v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  __int128 v16;
  uint64_t v17;

  *(_QWORD *)&v16 = 0x692D6E6F69746361;
  *((_QWORD *)&v16 + 1) = 0xE900000000000064;
  sub_246A78274();
  sub_246A4D95C((uint64_t)v15, a1, &v16);
  sub_246A4DE7C((uint64_t)v15);
  if (v17)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v6 = v13;
      v5 = v14;
      goto LABEL_6;
    }
  }
  else
  {
    sub_246A68C24((uint64_t)&v16, &qword_257618628);
  }
  v6 = 0;
  v5 = 0;
LABEL_6:
  v15[0] = &type metadata for AutoSendableButtonAction;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257618650);
  v7 = sub_246A78154();
  if (!v5)
  {
    swift_bridgeObjectRelease();
LABEL_14:
    result = swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  if (v6 == v7 && v5 == v8)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = sub_246A78400();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
      goto LABEL_14;
  }
  sub_246A78274();
  sub_246A4D95C((uint64_t)v15, a1, &v16);
  swift_bridgeObjectRelease();
  sub_246A4DE7C((uint64_t)v15);
  if (!v17)
  {
    result = sub_246A68C24((uint64_t)&v16, &qword_257618628);
    goto LABEL_21;
  }
  result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
LABEL_21:
    v12 = 2;
    goto LABEL_22;
  }
  sub_246A77EC0();
  swift_allocObject();
  sub_246A77EB4();
  sub_246A68E2C();
  sub_246A77EA8();
  sub_246A4D02C(0x642D6E6F69746361, 0xEB00000000617461);
  result = swift_release();
  if (v2)
    return result;
  v12 = v15[0];
LABEL_22:
  *a2 = v12;
  return result;
}

uint64_t sub_246A684B0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  uint64_t result;
  char v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  __int128 v16;
  uint64_t v17;

  *(_QWORD *)&v16 = 0x692D6E6F69746361;
  *((_QWORD *)&v16 + 1) = 0xE900000000000064;
  sub_246A78274();
  sub_246A4D95C((uint64_t)v15, a1, &v16);
  sub_246A4DE7C((uint64_t)v15);
  if (v17)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v6 = v13;
      v5 = v14;
      goto LABEL_6;
    }
  }
  else
  {
    sub_246A68C24((uint64_t)&v16, &qword_257618628);
  }
  v6 = 0;
  v5 = 0;
LABEL_6:
  v15[0] = &type metadata for PayloadTextInputAction;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257618640);
  v7 = sub_246A78154();
  if (!v5)
  {
    swift_bridgeObjectRelease();
LABEL_14:
    result = swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  if (v6 == v7 && v5 == v8)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = sub_246A78400();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
      goto LABEL_14;
  }
  sub_246A78274();
  sub_246A4D95C((uint64_t)v15, a1, &v16);
  swift_bridgeObjectRelease();
  sub_246A4DE7C((uint64_t)v15);
  if (!v17)
  {
    result = sub_246A68C24((uint64_t)&v16, &qword_257618628);
    goto LABEL_21;
  }
  result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
LABEL_21:
    v12 = 1;
    goto LABEL_22;
  }
  sub_246A77EC0();
  swift_allocObject();
  sub_246A77EB4();
  sub_246A68DF0();
  sub_246A77EA8();
  sub_246A4D02C(0x642D6E6F69746361, 0xEB00000000617461);
  result = swift_release();
  if (v2)
    return result;
  v12 = 0;
LABEL_22:
  *a2 = v12;
  return result;
}

uint64_t CustomCanvasAction<>.init(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  _BYTE v34[40];
  _QWORD v35[3];
  uint64_t v36;
  uint64_t v37;

  v10 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_2_16();
  v35[0] = v13;
  v35[1] = v14;
  sub_246A78274();
  OUTLINED_FUNCTION_3_13();
  sub_246A4DE7C((uint64_t)v34);
  v30 = v10;
  v31 = v12;
  v37 = a4;
  if (v36)
  {
    v15 = a5;
    if (OUTLINED_FUNCTION_1_14())
    {
      v16 = v32;
      v17 = v33;
      goto LABEL_6;
    }
  }
  else
  {
    v15 = a5;
    sub_246A68C24((uint64_t)v35, &qword_257618628);
  }
  v16 = 0;
  v17 = 0;
LABEL_6:
  v18 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  if (!v17)
  {
    swift_bridgeObjectRelease();
LABEL_14:
    swift_bridgeObjectRelease();
    v22 = 1;
    return __swift_storeEnumTagSinglePayload(v15, v22, 1, a2);
  }
  if (v16 == v18 && v17 == v19)
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_2_9();
  }
  else
  {
    v21 = sub_246A78400();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_2_9();
    if ((v21 & 1) == 0)
      goto LABEL_14;
  }
  OUTLINED_FUNCTION_0_15();
  v32 = v23;
  v33 = v24;
  sub_246A78274();
  OUTLINED_FUNCTION_3_13();
  swift_bridgeObjectRelease();
  sub_246A4DE7C((uint64_t)v34);
  if (!v36)
  {
    sub_246A68C24((uint64_t)v35, &qword_257618628);
    goto LABEL_21;
  }
  if ((OUTLINED_FUNCTION_1_14() & 1) == 0)
  {
LABEL_21:
    v22 = 1;
    return __swift_storeEnumTagSinglePayload(v15, v22, 1, a2);
  }
  v25 = v32;
  v26 = v33;
  sub_246A77EC0();
  OUTLINED_FUNCTION_0_13();
  sub_246A77EB4();
  v27 = v31;
  sub_246A77EA8();
  sub_246A4D02C(v25, v26);
  result = OUTLINED_FUNCTION_4_11();
  if (v5)
    return result;
  (*(void (**)(uint64_t, char *, uint64_t))(v30 + 32))(v15, v27, a2);
  v22 = 0;
  return __swift_storeEnumTagSinglePayload(v15, v22, 1, a2);
}

uint64_t sub_246A689B0()
{
  return sub_246A607F0((uint64_t)&type metadata for UpdateSnippetAction, &qword_257618660);
}

uint64_t static CustomCanvasAction<>.name.getter()
{
  swift_getMetatypeMetadata();
  return OUTLINED_FUNCTION_8_7();
}

uint64_t sub_246A689F8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_246A68228(a1, a2);
}

uint64_t sub_246A68A0C()
{
  return sub_246A607F0((uint64_t)&type metadata for AutoSendableButtonAction, &qword_257618650);
}

uint64_t sub_246A68A30@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_246A684B0(a1, a2);
}

uint64_t sub_246A68A44()
{
  return sub_246A607F0((uint64_t)&type metadata for PayloadTextInputAction, &qword_257618640);
}

uint64_t static CustomCanvasAction<>.idKey.getter()
{
  return 0x692D6E6F69746361;
}

uint64_t static CustomCanvasAction<>.dataKey.getter()
{
  return 0x642D6E6F69746361;
}

uint64_t CustomCanvasAction<>.toSharedState()(uint64_t a1, uint64_t a2)
{
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257618630);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246A7C630;
  OUTLINED_FUNCTION_2_16();
  v5 = MEMORY[0x24BEE0D00];
  OUTLINED_FUNCTION_8_10();
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  *(_QWORD *)(inited + 96) = v5;
  *(_QWORD *)(inited + 72) = v6;
  *(_QWORD *)(inited + 80) = v7;
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_8_10();
  sub_246A77EE4();
  OUTLINED_FUNCTION_0_13();
  sub_246A77ED8();
  v8 = sub_246A77ECC();
  if (v13)
  {
    OUTLINED_FUNCTION_4_11();
    sub_246A4DE7C(inited + 104);
    sub_246A68C24(inited + 32, &qword_257618638);
    *(_QWORD *)(inited + 16) = 0;
    swift_setDeallocating();
    return sub_246A68D80();
  }
  else
  {
    v11 = v8;
    v12 = v9;
    OUTLINED_FUNCTION_4_11();
    *(_QWORD *)(inited + 168) = MEMORY[0x24BDCDDE8];
    *(_QWORD *)(inited + 144) = v11;
    *(_QWORD *)(inited + 152) = v12;
    return sub_246A78118();
  }
}

uint64_t sub_246A68C24(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *CustomCanvasAction<>.serializedData()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v9[2];

  v9[1] = *(id *)MEMORY[0x24BDAC8D0];
  CustomCanvasAction<>.toSharedState()(a1, a2);
  if (!v2)
  {
    v4 = (void *)objc_opt_self();
    v5 = (void *)sub_246A78100();
    OUTLINED_FUNCTION_2_9();
    v9[0] = 0;
    v6 = objc_msgSend(v4, sel_dataWithPropertyList_format_options_error_, v5, 200, 0, v9);

    v7 = v9[0];
    if (v6)
    {
      v3 = (void *)sub_246A77F80();

    }
    else
    {
      v3 = v7;
      sub_246A77EF0();

      swift_willThrow();
    }
  }
  return v3;
}

uint64_t sub_246A68D80()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_257618638);
  swift_arrayDestroy();
  return swift_deallocClassInstance();
}

uint64_t dispatch thunk of CustomCanvasAction.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of static CustomCanvasAction.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

unint64_t sub_246A68DF0()
{
  unint64_t result;

  result = qword_257618648;
  if (!qword_257618648)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for PayloadTextInputAction, &type metadata for PayloadTextInputAction);
    atomic_store(result, (unint64_t *)&qword_257618648);
  }
  return result;
}

unint64_t sub_246A68E2C()
{
  unint64_t result;

  result = qword_257618658;
  if (!qword_257618658)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for AutoSendableButtonAction, &type metadata for AutoSendableButtonAction);
    atomic_store(result, (unint64_t *)&qword_257618658);
  }
  return result;
}

unint64_t sub_246A68E68()
{
  unint64_t result;

  result = qword_257618668;
  if (!qword_257618668)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for UpdateSnippetAction, &type metadata for UpdateSnippetAction);
    atomic_store(result, (unint64_t *)&qword_257618668);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_14()
{
  return swift_dynamicCast();
}

double OUTLINED_FUNCTION_3_13()
{
  uint64_t v0;
  uint64_t v1;

  return sub_246A4D95C(v1 - 152, v0, (_OWORD *)(v1 - 112));
}

uint64_t OUTLINED_FUNCTION_4_11()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_8_10()
{
  return sub_246A78274();
}

uint64_t AppSash.init(appBundleIdentifier:launchAppWithIntent:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

void AppSash.launchAppWithIntent.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
}

uint64_t AppSash.appBundleIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppSash.appBundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*AppSash.appBundleIdentifier.modify())()
{
  return nullsub_1;
}

void AppSash.launchAppWithIntent.getter()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 16);
  OUTLINED_FUNCTION_9();
}

void sub_246A68FDC(_QWORD *a1@<X8>)
{
  uint64_t v2;

  AppSash.launchAppWithIntent.getter();
  *a1 = v2;
}

void sub_246A6901C(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  AppSash.launchAppWithIntent.setter((uint64_t)v1);
}

void (*AppSash.launchAppWithIntent.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + 16);
  *a1 = v2;
  a1[1] = v1;
  v3 = v2;
  return sub_246A69080;
}

void sub_246A69080(uint64_t a1, char a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)a1;
  v2 = *(_QWORD *)(a1 + 8);
  v4 = *(void **)(v2 + 16);
  if ((a2 & 1) != 0)
  {
    v5 = v3;

    *(_QWORD *)(v2 + 16) = v3;
  }
  else
  {

    *(_QWORD *)(v2 + 16) = v3;
  }
}

uint64_t sub_246A690E4(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000013 && a2 == 0x8000000246A7F390 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000246A7F070)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_246A78400();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

unint64_t sub_246A691CC()
{
  return 0xD000000000000013;
}

unint64_t sub_246A69200()
{
  return sub_246A691CC();
}

uint64_t sub_246A69208@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A690E4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A6922C()
{
  sub_246A693CC();
  return sub_246A784D8();
}

uint64_t sub_246A69254()
{
  sub_246A693CC();
  return sub_246A784E4();
}

void AppSash.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618670);
  v9 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A693CC();
  sub_246A784CC();
  v12 = 0;
  sub_246A783AC();
  if (!v2)
  {
    v10 = v8;
    v11 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257617C00);
    sub_246A69598(&qword_257617C08, (uint64_t)&protocol conformance descriptor for ModelCodable<A>);
    sub_246A783D0();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v4);
  OUTLINED_FUNCTION_8_1();
}

unint64_t sub_246A693CC()
{
  unint64_t result;

  result = qword_257618678;
  if (!qword_257618678)
  {
    result = MEMORY[0x249563B60](&unk_246A7C7B0, &type metadata for AppSash.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618678);
  }
  return result;
}

void AppSash.init(from:)(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618680);
  MEMORY[0x24BDAC7A8](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A693CC();
  sub_246A784B4();
  if (v2)
  {
    OUTLINED_FUNCTION_4_3();
  }
  else
  {
    v6 = sub_246A78340();
    v8 = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257617C00);
    sub_246A69598(&qword_257617C18, (uint64_t)&protocol conformance descriptor for ModelCodable<A>);
    swift_bridgeObjectRetain();
    sub_246A78364();
    OUTLINED_FUNCTION_2_5();
    v9 = v10;
    *a2 = v6;
    a2[1] = v8;
    a2[2] = (uint64_t)v10;
    OUTLINED_FUNCTION_4_3();

    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_8_1();
}

void sub_246A69598(unint64_t *a1, uint64_t a2)
{
  uint64_t v4;

  if (!*a1)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257617C00);
    atomic_store(MEMORY[0x249563B60](a2, v4), a1);
  }
  OUTLINED_FUNCTION_9();
}

void sub_246A695D8(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  AppSash.init(from:)(a1, a2);
}

void sub_246A695EC(_QWORD *a1)
{
  AppSash.encode(to:)(a1);
}

void destroy for AppSash(uint64_t a1)
{
  swift_bridgeObjectRelease();

}

void _s18SiriMessagesCommon7AppSashVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  v5 = v4;
  OUTLINED_FUNCTION_9();
}

_QWORD *assignWithCopy for AppSash(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a1[2];
  v5 = (void *)a2[2];
  a1[2] = v5;
  v6 = v5;

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

uint64_t assignWithTake for AppSash(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for AppSash(uint64_t a1, int a2)
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
      v2 = *(_QWORD *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for AppSash(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppSash()
{
  return &type metadata for AppSash;
}

uint64_t storeEnumTagSinglePayload for AppSash.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A697FC + 4 * byte_246A7C665[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_246A69830 + 4 * asc_246A7C660[v4]))();
}

uint64_t sub_246A69830(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A69838(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A69840);
  return result;
}

uint64_t sub_246A6984C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A69854);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_246A69858(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A69860(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AppSash.CodingKeys()
{
  return &type metadata for AppSash.CodingKeys;
}

unint64_t sub_246A69880()
{
  unint64_t result;

  result = qword_257618688;
  if (!qword_257618688)
  {
    result = MEMORY[0x249563B60](&unk_246A7C788, &type metadata for AppSash.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618688);
  }
  return result;
}

unint64_t sub_246A698C0()
{
  unint64_t result;

  result = qword_257618690;
  if (!qword_257618690)
  {
    result = MEMORY[0x249563B60](&unk_246A7C6F8, &type metadata for AppSash.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618690);
  }
  return result;
}

unint64_t sub_246A69900()
{
  unint64_t result;

  result = qword_257618698;
  if (!qword_257618698)
  {
    result = MEMORY[0x249563B60](&unk_246A7C720, &type metadata for AppSash.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618698);
  }
  return result;
}

SiriMessagesCommon::ReadingCarPlayButton __swiftcall ReadingCarPlayButton.init(speechDuration:readingInProgressLabelText:)(Swift::Double speechDuration, Swift::String readingInProgressLabelText)
{
  uint64_t v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v6;
  SiriMessagesCommon::ReadingCarPlayButton result;

  object = readingInProgressLabelText._object;
  countAndFlagsBits = readingInProgressLabelText._countAndFlagsBits;
  v6 = v2;
  if (qword_2576171F0 != -1)
    readingInProgressLabelText._countAndFlagsBits = swift_once();
  *(Swift::Double *)v6 = speechDuration;
  *(_QWORD *)(v6 + 8) = countAndFlagsBits;
  *(_QWORD *)(v6 + 16) = object;
  result.readingInProgressLabelText = readingInProgressLabelText;
  result.speechDuration = speechDuration;
  return result;
}

double ReadingCarPlayButton.speechDuration.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

void ReadingCarPlayButton.speechDuration.setter(double a1)
{
  double *v1;

  *v1 = a1;
}

uint64_t (*ReadingCarPlayButton.speechDuration.modify())()
{
  return nullsub_1;
}

uint64_t ReadingCarPlayButton.readingInProgressLabelText.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ReadingCarPlayButton.readingInProgressLabelText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t (*ReadingCarPlayButton.readingInProgressLabelText.modify())()
{
  return nullsub_1;
}

uint64_t sub_246A69A34(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x7544686365657073 && a2 == 0xEE006E6F69746172;
  if (v3 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x8000000246A7F5B0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_246A78400();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_246A69B30(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD00000000000001ALL;
  else
    return 0x7544686365657073;
}

uint64_t sub_246A69B78()
{
  char *v0;

  return sub_246A69B30(*v0);
}

uint64_t sub_246A69B80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A69A34(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A69BA4()
{
  sub_246A69D0C();
  return sub_246A784D8();
}

uint64_t sub_246A69BCC()
{
  sub_246A69D0C();
  return sub_246A784E4();
}

void ReadingCarPlayButton.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char v9;
  char v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576186A0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A69D0C();
  sub_246A784CC();
  v10 = 0;
  sub_246A783C4();
  if (!v2)
  {
    v9 = 1;
    sub_246A783AC();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  OUTLINED_FUNCTION_7_7();
}

unint64_t sub_246A69D0C()
{
  unint64_t result;

  result = qword_2576186A8;
  if (!qword_2576186A8)
  {
    result = MEMORY[0x249563B60](&unk_246A7C968, &type metadata for ReadingCarPlayButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576186A8);
  }
  return result;
}

void ReadingCarPlayButton.init(from:)(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576186B0);
  MEMORY[0x24BDAC7A8](v4);
  if (qword_2576171F0 != -1)
    swift_once();
  swift_beginAccess();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A69D0C();
  swift_bridgeObjectRetain();
  sub_246A784B4();
  if (!v2)
  {
    OUTLINED_FUNCTION_2_17();
    sub_246A78358();
    v6 = v5;
    OUTLINED_FUNCTION_2_17();
    v7 = sub_246A78340();
    v9 = v8;
    OUTLINED_FUNCTION_1_15();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *a2 = v6;
    a2[1] = v7;
    a2[2] = v9;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7_7();
}

void sub_246A69ED8(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  ReadingCarPlayButton.init(from:)(a1, a2);
}

void sub_246A69EEC(_QWORD *a1)
{
  ReadingCarPlayButton.encode(to:)(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for ReadingCarPlayButton(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ReadingCarPlayButton()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for ReadingCarPlayButton(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for ReadingCarPlayButton(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  *a1 = *a2;
  v3 = a2[2];
  a1[1] = a2[1];
  a1[2] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ReadingCarPlayButton(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ReadingCarPlayButton(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ReadingCarPlayButton()
{
  return &type metadata for ReadingCarPlayButton;
}

uint64_t storeEnumTagSinglePayload for ReadingCarPlayButton.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A6A098 + 4 * byte_246A7C805[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_246A6A0CC + 4 * byte_246A7C800[v4]))();
}

uint64_t sub_246A6A0CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A6A0D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A6A0DCLL);
  return result;
}

uint64_t sub_246A6A0E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A6A0F0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_246A6A0F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A6A0FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ReadingCarPlayButton.CodingKeys()
{
  return &type metadata for ReadingCarPlayButton.CodingKeys;
}

unint64_t sub_246A6A11C()
{
  unint64_t result;

  result = qword_2576186B8;
  if (!qword_2576186B8)
  {
    result = MEMORY[0x249563B60](&unk_246A7C940, &type metadata for ReadingCarPlayButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576186B8);
  }
  return result;
}

unint64_t sub_246A6A15C()
{
  unint64_t result;

  result = qword_2576186C0;
  if (!qword_2576186C0)
  {
    result = MEMORY[0x249563B60](&unk_246A7C8B0, &type metadata for ReadingCarPlayButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576186C0);
  }
  return result;
}

unint64_t sub_246A6A19C()
{
  unint64_t result;

  result = qword_2576186C8;
  if (!qword_2576186C8)
  {
    result = MEMORY[0x249563B60](&unk_246A7C8D8, &type metadata for ReadingCarPlayButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576186C8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_2_17()
{
  uint64_t v0;

  return v0 - 105;
}

void VideoAttachment.init(url:isDraft:)(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  type metadata accessor for SecurityScopedURL();
  v6 = swift_allocObject();
  v7 = v6 + OBJC_IVAR____TtC18SiriMessagesCommon17SecurityScopedURL_wrappedValue;
  v8 = OUTLINED_FUNCTION_2_2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7, a1, v8);
  *(_QWORD *)a3 = v6;
  *(_BYTE *)(a3 + 8) = a2;
  OUTLINED_FUNCTION_3_5();
}

uint64_t VideoAttachment.url.getter@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC18SiriMessagesCommon17SecurityScopedURL_wrappedValue;
  swift_beginAccess();
  v4 = OUTLINED_FUNCTION_2_2();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_246A6A2DC@<X0>(uint64_t a1@<X8>)
{
  return VideoAttachment.url.getter(a1);
}

void sub_246A6A314(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;

  v4 = sub_246A77F5C();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  v8 = *((_BYTE *)a2 + 8);
  v9 = *a2;
  v10 = v8;
  VideoAttachment.url.setter((uint64_t)v6);
}

void VideoAttachment.url.setter(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = OUTLINED_FUNCTION_2_2();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_12();
  v6 = *v1;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v2, a1, v4);
  sub_246A4C814();
  v7 = v6 + OBJC_IVAR____TtC18SiriMessagesCommon17SecurityScopedURL_wrappedValue;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(v7, v2, v4);
  swift_endAccess();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  OUTLINED_FUNCTION_3_5();
}

void (*VideoAttachment.url.modify(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_246A4C950(v2);
  return sub_246A479E0;
}

uint64_t VideoAttachment.isDraft.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t VideoAttachment.isDraft.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 8) = result;
  return result;
}

uint64_t (*VideoAttachment.isDraft.modify())()
{
  return nullsub_1;
}

uint64_t sub_246A6A4CC()
{
  sub_246A6A648();
  return sub_246A784D8();
}

uint64_t sub_246A6A4F4()
{
  sub_246A6A648();
  return sub_246A784E4();
}

void VideoAttachment.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576186D0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_12();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A6A648();
  sub_246A784CC();
  type metadata accessor for SecurityScopedURL();
  sub_246A51494(&qword_257617AC0, (uint64_t)&protocol conformance descriptor for SecurityScopedURL);
  sub_246A783D0();
  if (!v1)
    sub_246A783B8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  OUTLINED_FUNCTION_8_1();
}

unint64_t sub_246A6A648()
{
  unint64_t result;

  result = qword_2576186D8;
  if (!qword_2576186D8)
  {
    result = MEMORY[0x249563B60](&unk_246A7CB38, &type metadata for VideoAttachment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576186D8);
  }
  return result;
}

void VideoAttachment.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576186E0);
  MEMORY[0x24BDAC7A8](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A6A648();
  sub_246A784B4();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    type metadata accessor for SecurityScopedURL();
    sub_246A51494(&qword_257617AD0, (uint64_t)&protocol conformance descriptor for SecurityScopedURL);
    sub_246A78364();
    swift_retain();
    v6 = sub_246A7834C();
    OUTLINED_FUNCTION_2_5();
    *(_QWORD *)a2 = v7;
    *(_BYTE *)(a2 + 8) = v6 & 1;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_release();
  }
  OUTLINED_FUNCTION_8_1();
}

unint64_t sub_246A6A808(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 16) = sub_246A4B720();
  result = sub_246A4B5F4();
  *(_QWORD *)(a1 + 24) = result;
  return result;
}

void sub_246A6A834(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  VideoAttachment.init(from:)(a1, a2);
}

void sub_246A6A848(_QWORD *a1)
{
  VideoAttachment.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for VideoAttachment()
{
  return &type metadata for VideoAttachment;
}

uint64_t storeEnumTagSinglePayload for VideoAttachment.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A6A8C0 + 4 * byte_246A7C9C5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_246A6A8F4 + 4 * byte_246A7C9C0[v4]))();
}

uint64_t sub_246A6A8F4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A6A8FC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A6A904);
  return result;
}

uint64_t sub_246A6A910(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A6A918);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_246A6A91C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A6A924(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for VideoAttachment.CodingKeys()
{
  return &type metadata for VideoAttachment.CodingKeys;
}

unint64_t sub_246A6A944()
{
  unint64_t result;

  result = qword_2576186E8;
  if (!qword_2576186E8)
  {
    result = MEMORY[0x249563B60](&unk_246A7CB10, &type metadata for VideoAttachment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576186E8);
  }
  return result;
}

unint64_t sub_246A6A984()
{
  unint64_t result;

  result = qword_2576186F0;
  if (!qword_2576186F0)
  {
    result = MEMORY[0x249563B60](&unk_246A7CA80, &type metadata for VideoAttachment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576186F0);
  }
  return result;
}

unint64_t sub_246A6A9C4()
{
  unint64_t result;

  result = qword_2576186F8;
  if (!qword_2576186F8)
  {
    result = MEMORY[0x249563B60](&unk_246A7CAA8, &type metadata for VideoAttachment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576186F8);
  }
  return result;
}

id SAIntentGroupHandleIntent.init(intent:appIdentifier:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v19;

  v5 = sub_246A77FA4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend(objc_allocWithZone((Class)OUTLINED_FUNCTION_4_12()), sel_init);
  sub_246A77F98();
  v10 = sub_246A77F8C();
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_246A4E0DC(v10, v12, v9);

  v13 = v9;
  if (a3)
  {
    v14 = (void *)sub_246A78130();
    OUTLINED_FUNCTION_1_8();
  }
  else
  {
    v14 = 0;
  }
  OUTLINED_FUNCTION_3_14(v9, sel_setAppId_);

  sub_246A6AD9C();
  v15 = a1;
  SAIntentGroupProtobufMessage.init(intent:)(v15);
  v17 = v16;
  OUTLINED_FUNCTION_3_14(v9, sel_setIntent_);

  return v9;
}

void SAIntentGroupProtobufMessage.init(intent:)(void *a1)
{
  void *v1;
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = objc_msgSend(objc_allocWithZone((Class)OUTLINED_FUNCTION_4_12()), sel_init);
  v4 = OUTLINED_FUNCTION_5_7((uint64_t)v3, sel_backingStore);
  sub_246A56F2C(v4);
  if (v6 >> 60 == 15)
  {
    v1 = 0;
  }
  else
  {
    OUTLINED_FUNCTION_6_12();
    v5 = OUTLINED_FUNCTION_1_16();
  }
  OUTLINED_FUNCTION_0_16(v5, sel_setData_);

  v8 = OUTLINED_FUNCTION_5_7(v7, sel_typeName);
  v9 = sub_246A7813C();
  v11 = v10;

  sub_246A6ADD8(v9, v11, v3);
  OUTLINED_FUNCTION_3_5();
}

void SAIntentGroupProtobufMessage.init(response:)(void *a1)
{
  void *v1;
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = objc_msgSend(objc_allocWithZone((Class)OUTLINED_FUNCTION_4_12()), sel_init);
  v4 = OUTLINED_FUNCTION_5_7((uint64_t)v3, sel_backingStore);
  if (v4)
  {
    sub_246A56F2C(v4);
    if (v6 >> 60 == 15)
    {
      v1 = 0;
    }
    else
    {
      OUTLINED_FUNCTION_6_12();
      v5 = OUTLINED_FUNCTION_1_16();
    }
    OUTLINED_FUNCTION_0_16(v5, sel_setData_);

    v7 = sub_246A6AE3C(a1);
    if (v8)
    {
      v9 = (void *)sub_246A78130();
      v7 = OUTLINED_FUNCTION_1_8();
    }
    else
    {
      v9 = 0;
    }
    OUTLINED_FUNCTION_0_16(v7, sel_setTypeName_);

    OUTLINED_FUNCTION_3_5();
  }
  else
  {
    __break(1u);
  }
}

id SAIntentGroupLaunchAppWithIntent.init(intent:)(void *a1)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = objc_msgSend(objc_allocWithZone((Class)OUTLINED_FUNCTION_4_12()), sel_init);
  sub_246A6AD9C();
  v3 = v2;
  v4 = a1;
  SAIntentGroupProtobufMessage.init(intent:)(v4);
  v6 = v5;
  OUTLINED_FUNCTION_3_14(v3, sel_setHandledIntent_);

  INIntent.launchBundleIdentifier.getter();
  if (v7)
  {
    v8 = (void *)sub_246A78130();
    OUTLINED_FUNCTION_1_8();
  }
  else
  {
    v8 = 0;
  }
  OUTLINED_FUNCTION_3_14(v3, sel_setAppId_);

  return v3;
}

unint64_t sub_246A6AD9C()
{
  unint64_t result;

  result = qword_257618700;
  if (!qword_257618700)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257618700);
  }
  return result;
}

void sub_246A6ADD8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_246A78130();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setTypeName_, v4);

}

uint64_t sub_246A6AE28(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_246A4D02C(a1, a2);
  return a1;
}

uint64_t sub_246A6AE3C(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel__payloadResponseTypeName);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_246A7813C();

  return v3;
}

id OUTLINED_FUNCTION_0_16(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_1_16()
{
  uint64_t v0;
  unint64_t v1;

  return sub_246A6AE28(v0, v1);
}

id OUTLINED_FUNCTION_3_14(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_4_12()
{
  return swift_getObjCClassFromMetadata();
}

id OUTLINED_FUNCTION_5_7(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_6_12()
{
  return sub_246A77F68();
}

BOOL static TextBalloon.ServiceType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t TextBalloon.ServiceType.hash(into:)()
{
  return sub_246A78490();
}

uint64_t sub_246A6AF18(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  char v8;

  v3 = a1 == 0x6567617373654D69 && a2 == 0xE800000000000000;
  if (v3 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 7564659 && a2 == 0xE300000000000000;
    if (v6 || (sub_246A78400() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x726568746FLL && a2 == 0xE500000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v8 = sub_246A78400();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t sub_246A6B03C(char a1)
{
  return *(_QWORD *)&aImessagesms[8 * a1];
}

uint64_t sub_246A6B060()
{
  char *v0;

  return sub_246A6B03C(*v0);
}

uint64_t sub_246A6B068@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A6AF18(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A6B08C()
{
  sub_246A6B3A8();
  return sub_246A784D8();
}

uint64_t sub_246A6B0B4()
{
  sub_246A6B3A8();
  return sub_246A784E4();
}

uint64_t sub_246A6B0DC()
{
  sub_246A6B45C();
  return sub_246A784D8();
}

uint64_t sub_246A6B104()
{
  sub_246A6B45C();
  return sub_246A784E4();
}

uint64_t sub_246A6B12C()
{
  sub_246A6B3E4();
  return sub_246A784D8();
}

uint64_t sub_246A6B154()
{
  sub_246A6B3E4();
  return sub_246A784E4();
}

uint64_t sub_246A6B17C()
{
  sub_246A6B420();
  return sub_246A784D8();
}

uint64_t sub_246A6B1A4()
{
  sub_246A6B420();
  return sub_246A784E4();
}

void TextBalloon.ServiceType.encode(to:)()
{
  unsigned __int8 *v0;
  uint64_t v1;
  unsigned __int8 *v2;
  _QWORD *v3;
  _QWORD *v4;
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
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  OUTLINED_FUNCTION_7_9();
  v2 = v0;
  v4 = v3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618708);
  v24 = *(_QWORD *)(v5 - 8);
  v25 = v5;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_6_0();
  v23 = v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618710);
  v21 = *(_QWORD *)(v8 - 8);
  v22 = v8;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_9_7();
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618718);
  v10 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_15_0();
  v13 = v12 - v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618720);
  v26 = *(_QWORD *)(v14 - 8);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_15_0();
  v18 = v17 - v16;
  v19 = *v2;
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_246A6B3A8();
  sub_246A784CC();
  if (v19)
  {
    if (v19 == 1)
    {
      OUTLINED_FUNCTION_11_7();
      OUTLINED_FUNCTION_2_18();
      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v1, v22);
    }
    else
    {
      OUTLINED_FUNCTION_14_4();
      OUTLINED_FUNCTION_2_18();
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
    }
  }
  else
  {
    sub_246A6B45C();
    OUTLINED_FUNCTION_2_18();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v13, v20);
  }
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v18, v14);
  OUTLINED_FUNCTION_8_1();
}

unint64_t sub_246A6B3A8()
{
  unint64_t result;

  result = qword_257618728;
  if (!qword_257618728)
  {
    result = MEMORY[0x249563B60](&unk_246A7D0F4, &type metadata for TextBalloon.ServiceType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618728);
  }
  return result;
}

unint64_t sub_246A6B3E4()
{
  unint64_t result;

  result = qword_257618730;
  if (!qword_257618730)
  {
    result = MEMORY[0x249563B60](&unk_246A7D0A4, &type metadata for TextBalloon.ServiceType.OtherCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618730);
  }
  return result;
}

unint64_t sub_246A6B420()
{
  unint64_t result;

  result = qword_257618738;
  if (!qword_257618738)
  {
    result = MEMORY[0x249563B60](&unk_246A7D054, &type metadata for TextBalloon.ServiceType.SmsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618738);
  }
  return result;
}

unint64_t sub_246A6B45C()
{
  unint64_t result;

  result = qword_257618740;
  if (!qword_257618740)
  {
    result = MEMORY[0x249563B60](&unk_246A7D004, &type metadata for TextBalloon.ServiceType.IMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618740);
  }
  return result;
}

void TextBalloon.ServiceType.hashValue.getter()
{
  sub_246A78484();
  OUTLINED_FUNCTION_15_7();
  sub_246A7849C();
  OUTLINED_FUNCTION_20_0();
}

void TextBalloon.ServiceType.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  _BYTE *v5;
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
  int v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;

  OUTLINED_FUNCTION_7_9();
  v4 = v3;
  v31 = v5;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618748);
  v27 = *(_QWORD *)(v30 - 8);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_6_0();
  v33 = v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618750);
  v28 = *(_QWORD *)(v8 - 8);
  v29 = v8;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_6_0();
  v32 = v10;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618758);
  v11 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_9_7();
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618760);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_12();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_246A6B3A8();
  sub_246A784B4();
  if (v0)
    goto LABEL_10;
  v34 = (uint64_t)v4;
  v14 = v1;
  v15 = sub_246A78370();
  v16 = *(_QWORD *)(v15 + 16);
  if (!v16
    || (v17 = *(unsigned __int8 *)(v15 + 32),
        sub_246A4C56C(1, v16, v15, v15 + 32, 0, (2 * v16) | 1),
        v19 = v18,
        v21 = v20,
        swift_bridgeObjectRelease(),
        v19 != v21 >> 1))
  {
    v23 = sub_246A782C8();
    swift_allocError();
    v25 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257617598);
    *v25 = &type metadata for TextBalloon.ServiceType;
    sub_246A7831C();
    sub_246A782BC();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x24BEE26D0], v23);
    swift_willThrow();
    OUTLINED_FUNCTION_12_7();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v12);
    v4 = (_QWORD *)v34;
LABEL_10:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
    goto LABEL_11;
  }
  if (v17)
  {
    v35 = v17;
    if (v17 == 1)
    {
      OUTLINED_FUNCTION_11_7();
      OUTLINED_FUNCTION_3_15();
      v22 = v31;
      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v32, v29);
    }
    else
    {
      OUTLINED_FUNCTION_14_4();
      OUTLINED_FUNCTION_3_15();
      v22 = v31;
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v33, v30);
    }
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_6_13(*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8));
  }
  else
  {
    sub_246A6B45C();
    OUTLINED_FUNCTION_3_15();
    v35 = 0;
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v2, v26);
    OUTLINED_FUNCTION_12_7();
    OUTLINED_FUNCTION_6_13(*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8));
    v22 = v31;
  }
  *v22 = v35;
  __swift_destroy_boxed_opaque_existential_1(v34);
LABEL_11:
  OUTLINED_FUNCTION_8_1();
}

void sub_246A6B87C()
{
  sub_246A78484();
  OUTLINED_FUNCTION_15_7();
  sub_246A7849C();
  OUTLINED_FUNCTION_20_0();
}

void sub_246A6B8AC()
{
  TextBalloon.ServiceType.init(from:)();
}

void sub_246A6B8C0()
{
  TextBalloon.ServiceType.encode(to:)();
}

SiriMessagesCommon::TextBalloon __swiftcall TextBalloon.init(payload:serviceType:)(Swift::String payload, SiriMessagesCommon::TextBalloon::ServiceType serviceType)
{
  uint64_t v2;
  char v3;
  SiriMessagesCommon::TextBalloon result;

  v3 = *(_BYTE *)serviceType;
  *(Swift::String *)v2 = payload;
  *(_BYTE *)(v2 + 16) = v3;
  result.payload = payload;
  result.serviceType = serviceType;
  return result;
}

uint64_t TextBalloon.payload.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TextBalloon.payload.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*TextBalloon.payload.modify())()
{
  return nullsub_1;
}

void TextBalloon.serviceType.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

_BYTE *TextBalloon.serviceType.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = *result;
  return result;
}

uint64_t (*TextBalloon.serviceType.modify())()
{
  return nullsub_1;
}

uint64_t sub_246A6B97C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v7;

  v3 = a1 == 0x64616F6C796170 && a2 == 0xE700000000000000;
  if (v3 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x5465636976726573 && a2 == 0xEB00000000657079)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_246A78400();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_246A6BA70(char a1)
{
  if ((a1 & 1) != 0)
    return 0x5465636976726573;
  else
    return 0x64616F6C796170;
}

uint64_t sub_246A6BAB0()
{
  char *v0;

  return sub_246A6BA70(*v0);
}

uint64_t sub_246A6BAB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A6B97C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A6BADC()
{
  sub_246A6BDC4();
  return sub_246A784D8();
}

uint64_t sub_246A6BB04()
{
  sub_246A6BDC4();
  return sub_246A784E4();
}

void TextBalloon.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_7_9();
  v3 = v2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618768);
  v6 = *(_QWORD *)(v4 - 8);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_12();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_246A6BDC4();
  sub_246A784CC();
  sub_246A783AC();
  if (!v0)
  {
    sub_246A6BE00();
    sub_246A783D0();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  OUTLINED_FUNCTION_8_1();
}

void TextBalloon.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12)
{
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  OUTLINED_FUNCTION_7_9();
  v14 = v13;
  v16 = v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618780);
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_15_0();
  __swift_project_boxed_opaque_existential_1(v14, v14[3]);
  sub_246A6BDC4();
  sub_246A784B4();
  if (v12)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  }
  else
  {
    v18 = sub_246A78340();
    v20 = v19;
    sub_246A6BE3C();
    swift_bridgeObjectRetain();
    sub_246A78364();
    OUTLINED_FUNCTION_2_5();
    *(_QWORD *)v16 = v18;
    *(_QWORD *)(v16 + 8) = v20;
    *(_BYTE *)(v16 + 16) = a12;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_8_1();
}

void sub_246A6BD9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t vars0;
  _BYTE vars8[7];

  TextBalloon.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, *(int *)vars8, *(__int16 *)&vars8[4], vars8[6]);
}

void sub_246A6BDB0()
{
  TextBalloon.encode(to:)();
}

unint64_t sub_246A6BDC4()
{
  unint64_t result;

  result = qword_257618770;
  if (!qword_257618770)
  {
    result = MEMORY[0x249563B60](&unk_246A7CFB4, &type metadata for TextBalloon.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618770);
  }
  return result;
}

unint64_t sub_246A6BE00()
{
  unint64_t result;

  result = qword_257618778;
  if (!qword_257618778)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for TextBalloon.ServiceType, &type metadata for TextBalloon.ServiceType);
    atomic_store(result, (unint64_t *)&qword_257618778);
  }
  return result;
}

unint64_t sub_246A6BE3C()
{
  unint64_t result;

  result = qword_257618788;
  if (!qword_257618788)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for TextBalloon.ServiceType, &type metadata for TextBalloon.ServiceType);
    atomic_store(result, (unint64_t *)&qword_257618788);
  }
  return result;
}

unint64_t sub_246A6BE7C()
{
  unint64_t result;

  result = qword_257618790;
  if (!qword_257618790)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for TextBalloon.ServiceType, &type metadata for TextBalloon.ServiceType);
    atomic_store(result, (unint64_t *)&qword_257618790);
  }
  return result;
}

uint64_t destroy for TextBalloon()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s18SiriMessagesCommon11TextBalloonVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TextBalloon(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for TextBalloon(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for TextBalloon(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 17))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for TextBalloon(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 17) = 1;
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
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TextBalloon()
{
  return &type metadata for TextBalloon;
}

ValueMetadata *type metadata accessor for TextBalloon.ServiceType()
{
  return &type metadata for TextBalloon.ServiceType;
}

uint64_t storeEnumTagSinglePayload for TextBalloon.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A6C078 + 4 * byte_246A7CB95[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_246A6C0AC + 4 * byte_246A7CB90[v4]))();
}

uint64_t sub_246A6C0AC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A6C0B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A6C0BCLL);
  return result;
}

uint64_t sub_246A6C0C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A6C0D0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_246A6C0D4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A6C0DC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TextBalloon.CodingKeys()
{
  return &type metadata for TextBalloon.CodingKeys;
}

uint64_t _s18SiriMessagesCommon11TextBalloonV11ServiceTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A6C144 + 4 * byte_246A7CB9F[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_246A6C178 + 4 * byte_246A7CB9A[v4]))();
}

uint64_t sub_246A6C178(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A6C180(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A6C188);
  return result;
}

uint64_t sub_246A6C194(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A6C19CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_246A6C1A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A6C1A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TextBalloon.ServiceType.CodingKeys()
{
  return &type metadata for TextBalloon.ServiceType.CodingKeys;
}

ValueMetadata *type metadata accessor for TextBalloon.ServiceType.IMessageCodingKeys()
{
  return &type metadata for TextBalloon.ServiceType.IMessageCodingKeys;
}

ValueMetadata *type metadata accessor for TextBalloon.ServiceType.SmsCodingKeys()
{
  return &type metadata for TextBalloon.ServiceType.SmsCodingKeys;
}

ValueMetadata *type metadata accessor for TextBalloon.ServiceType.OtherCodingKeys()
{
  return &type metadata for TextBalloon.ServiceType.OtherCodingKeys;
}

unint64_t sub_246A6C1F8()
{
  unint64_t result;

  result = qword_257618798;
  if (!qword_257618798)
  {
    result = MEMORY[0x249563B60](&unk_246A7CED4, &type metadata for TextBalloon.ServiceType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618798);
  }
  return result;
}

unint64_t sub_246A6C238()
{
  unint64_t result;

  result = qword_2576187A0;
  if (!qword_2576187A0)
  {
    result = MEMORY[0x249563B60](&unk_246A7CF8C, &type metadata for TextBalloon.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576187A0);
  }
  return result;
}

unint64_t sub_246A6C278()
{
  unint64_t result;

  result = qword_2576187A8;
  if (!qword_2576187A8)
  {
    result = MEMORY[0x249563B60](&unk_246A7CEFC, &type metadata for TextBalloon.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576187A8);
  }
  return result;
}

unint64_t sub_246A6C2B8()
{
  unint64_t result;

  result = qword_2576187B0;
  if (!qword_2576187B0)
  {
    result = MEMORY[0x249563B60](&unk_246A7CF24, &type metadata for TextBalloon.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576187B0);
  }
  return result;
}

unint64_t sub_246A6C2F8()
{
  unint64_t result;

  result = qword_2576187B8;
  if (!qword_2576187B8)
  {
    result = MEMORY[0x249563B60](&unk_246A7CDF4, &type metadata for TextBalloon.ServiceType.IMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576187B8);
  }
  return result;
}

unint64_t sub_246A6C338()
{
  unint64_t result;

  result = qword_2576187C0;
  if (!qword_2576187C0)
  {
    result = MEMORY[0x249563B60](&unk_246A7CE1C, &type metadata for TextBalloon.ServiceType.IMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576187C0);
  }
  return result;
}

unint64_t sub_246A6C378()
{
  unint64_t result;

  result = qword_2576187C8;
  if (!qword_2576187C8)
  {
    result = MEMORY[0x249563B60](&unk_246A7CDA4, &type metadata for TextBalloon.ServiceType.SmsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576187C8);
  }
  return result;
}

unint64_t sub_246A6C3B8()
{
  unint64_t result;

  result = qword_2576187D0;
  if (!qword_2576187D0)
  {
    result = MEMORY[0x249563B60](&unk_246A7CDCC, &type metadata for TextBalloon.ServiceType.SmsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576187D0);
  }
  return result;
}

unint64_t sub_246A6C3F8()
{
  unint64_t result;

  result = qword_2576187D8;
  if (!qword_2576187D8)
  {
    result = MEMORY[0x249563B60](&unk_246A7CD54, &type metadata for TextBalloon.ServiceType.OtherCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576187D8);
  }
  return result;
}

unint64_t sub_246A6C438()
{
  unint64_t result;

  result = qword_2576187E0;
  if (!qword_2576187E0)
  {
    result = MEMORY[0x249563B60](&unk_246A7CD7C, &type metadata for TextBalloon.ServiceType.OtherCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576187E0);
  }
  return result;
}

unint64_t sub_246A6C478()
{
  unint64_t result;

  result = qword_2576187E8;
  if (!qword_2576187E8)
  {
    result = MEMORY[0x249563B60](&unk_246A7CE44, &type metadata for TextBalloon.ServiceType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576187E8);
  }
  return result;
}

unint64_t sub_246A6C4B8()
{
  unint64_t result;

  result = qword_2576187F0;
  if (!qword_2576187F0)
  {
    result = MEMORY[0x249563B60](&unk_246A7CE6C, &type metadata for TextBalloon.ServiceType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576187F0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_18()
{
  return sub_246A78388();
}

uint64_t OUTLINED_FUNCTION_3_15()
{
  return sub_246A78310();
}

uint64_t OUTLINED_FUNCTION_6_13@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

unint64_t OUTLINED_FUNCTION_11_7()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
  return sub_246A6B420();
}

uint64_t OUTLINED_FUNCTION_12_7()
{
  return swift_unknownObjectRelease();
}

unint64_t OUTLINED_FUNCTION_14_4()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 2;
  return sub_246A6B3E4();
}

uint64_t OUTLINED_FUNCTION_15_7()
{
  return sub_246A78490();
}

uint64_t AppDisambiguationSnippetModel.title.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  OUTLINED_FUNCTION_5_4();
  return v1;
}

uint64_t AppDisambiguationSnippetModel.appBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

SiriMessagesCommon::AppDisambiguationSnippetModel __swiftcall AppDisambiguationSnippetModel.init(title:appBundleIdentifiers:)(Swift::String title, Swift::OpaquePointer appBundleIdentifiers)
{
  uint64_t v2;
  SiriMessagesCommon::AppDisambiguationSnippetModel result;

  *(Swift::String *)v2 = title;
  *(Swift::OpaquePointer *)(v2 + 16) = appBundleIdentifiers;
  result.title = title;
  result.appBundleIdentifiers = appBundleIdentifiers;
  return result;
}

uint64_t AppDisambiguationSnippetModel.description.getter()
{
  sub_246A78298();
  sub_246A78178();
  sub_246A783E8();
  sub_246A78178();
  swift_bridgeObjectRelease();
  sub_246A78178();
  return 0;
}

uint64_t sub_246A6C634(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
  if (v3 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000246A7F520)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_246A78400();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_246A6C710(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000014;
  else
    return 0x656C746974;
}

uint64_t sub_246A6C748()
{
  char *v0;

  return sub_246A6C710(*v0);
}

uint64_t sub_246A6C750@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A6C634(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A6C774()
{
  sub_246A6C91C();
  return sub_246A784D8();
}

uint64_t sub_246A6C79C()
{
  sub_246A6C91C();
  return sub_246A784E4();
}

void AppDisambiguationSnippetModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576187F8);
  v9 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A6C91C();
  sub_246A784CC();
  v12 = 0;
  sub_246A783AC();
  if (!v2)
  {
    v10 = v8;
    v11 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257618020);
    sub_246A6CAF0(&qword_257618028, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    sub_246A783D0();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v4);
  OUTLINED_FUNCTION_8_1();
}

unint64_t sub_246A6C91C()
{
  unint64_t result;

  result = qword_257618800;
  if (!qword_257618800)
  {
    result = MEMORY[0x249563B60](&unk_246A7D324, &type metadata for AppDisambiguationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618800);
  }
  return result;
}

void AppDisambiguationSnippetModel.init(from:)(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618808);
  MEMORY[0x24BDAC7A8](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A6C91C();
  sub_246A784B4();
  if (v2)
  {
    OUTLINED_FUNCTION_4_3();
  }
  else
  {
    v6 = sub_246A78340();
    v8 = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257618020);
    sub_246A6CAF0(&qword_257618038, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    swift_bridgeObjectRetain();
    sub_246A78364();
    OUTLINED_FUNCTION_2_5();
    *a2 = v6;
    a2[1] = v8;
    a2[2] = v9;
    OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_4_3();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_8_1();
}

uint64_t sub_246A6CAF0(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257618020);
    v8 = a2;
    result = MEMORY[0x249563B60](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_246A6CB54()
{
  unint64_t result;

  result = qword_257618810;
  if (!qword_257618810)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for AppDisambiguationSnippetModel, &type metadata for AppDisambiguationSnippetModel);
    atomic_store(result, (unint64_t *)&qword_257618810);
  }
  return result;
}

unint64_t sub_246A6CB94()
{
  unint64_t result;

  result = qword_257618818;
  if (!qword_257618818)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for AppDisambiguationSnippetModel, &type metadata for AppDisambiguationSnippetModel);
    atomic_store(result, (unint64_t *)&qword_257618818);
  }
  return result;
}

void sub_246A6CBD4(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  AppDisambiguationSnippetModel.init(from:)(a1, a2);
}

void sub_246A6CBE8(_QWORD *a1)
{
  AppDisambiguationSnippetModel.encode(to:)(a1);
}

uint64_t destroy for AppDisambiguationSnippetModel()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s18SiriMessagesCommon29AppDisambiguationSnippetModelVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_5_4();
  return a1;
}

_QWORD *assignWithCopy for AppDisambiguationSnippetModel(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for AppDisambiguationSnippetModel(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for AppDisambiguationSnippetModel()
{
  return &type metadata for AppDisambiguationSnippetModel;
}

uint64_t storeEnumTagSinglePayload for AppDisambiguationSnippetModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A6CD64 + 4 * byte_246A7D185[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_246A6CD98 + 4 * byte_246A7D180[v4]))();
}

uint64_t sub_246A6CD98(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A6CDA0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A6CDA8);
  return result;
}

uint64_t sub_246A6CDB4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A6CDBCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_246A6CDC0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A6CDC8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AppDisambiguationSnippetModel.CodingKeys()
{
  return &type metadata for AppDisambiguationSnippetModel.CodingKeys;
}

unint64_t sub_246A6CDE8()
{
  unint64_t result;

  result = qword_257618820;
  if (!qword_257618820)
  {
    result = MEMORY[0x249563B60](&unk_246A7D2FC, &type metadata for AppDisambiguationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618820);
  }
  return result;
}

unint64_t sub_246A6CE28()
{
  unint64_t result;

  result = qword_257618828;
  if (!qword_257618828)
  {
    result = MEMORY[0x249563B60](&unk_246A7D26C, &type metadata for AppDisambiguationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618828);
  }
  return result;
}

unint64_t sub_246A6CE68()
{
  unint64_t result;

  result = qword_257618830;
  if (!qword_257618830)
  {
    result = MEMORY[0x249563B60](&unk_246A7D294, &type metadata for AppDisambiguationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618830);
  }
  return result;
}

SiriMessagesCommon::ReadingCompactCarPlayButton __swiftcall ReadingCompactCarPlayButton.init(speechDuration:)(Swift::Double speechDuration)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  SiriMessagesCommon::ReadingCompactCarPlayButton result;

  v3 = v1;
  if (qword_2576171F0 != -1)
    swift_once();
  swift_beginAccess();
  v5 = qword_257617E88;
  v4 = qword_257617E90;
  *(Swift::Double *)v3 = speechDuration;
  *(_QWORD *)(v3 + 8) = v5;
  *(_QWORD *)(v3 + 16) = v4;
  v6 = swift_bridgeObjectRetain();
  result.speechDuration = v8;
  result.readingInProgressLabelText._object = v7;
  result.readingInProgressLabelText._countAndFlagsBits = v6;
  return result;
}

double ReadingCompactCarPlayButton.speechDuration.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

void ReadingCompactCarPlayButton.speechDuration.setter(double a1)
{
  double *v1;

  *v1 = a1;
}

uint64_t (*ReadingCompactCarPlayButton.speechDuration.modify())()
{
  return nullsub_1;
}

uint64_t ReadingCompactCarPlayButton.readingInProgressLabelText.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ReadingCompactCarPlayButton.readingInProgressLabelText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t (*ReadingCompactCarPlayButton.readingInProgressLabelText.modify())()
{
  return nullsub_1;
}

uint64_t sub_246A6CFB8()
{
  sub_246A6D120();
  return sub_246A784D8();
}

uint64_t sub_246A6CFE0()
{
  sub_246A6D120();
  return sub_246A784E4();
}

void ReadingCompactCarPlayButton.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char v9;
  char v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618838);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A6D120();
  sub_246A784CC();
  v10 = 0;
  sub_246A783C4();
  if (!v2)
  {
    v9 = 1;
    sub_246A783AC();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  OUTLINED_FUNCTION_7_7();
}

unint64_t sub_246A6D120()
{
  unint64_t result;

  result = qword_257618840;
  if (!qword_257618840)
  {
    result = MEMORY[0x249563B60](&unk_246A7D4F0, &type metadata for ReadingCompactCarPlayButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618840);
  }
  return result;
}

void ReadingCompactCarPlayButton.init(from:)(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618848);
  MEMORY[0x24BDAC7A8](v4);
  if (qword_2576171F0 != -1)
    swift_once();
  swift_beginAccess();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A6D120();
  swift_bridgeObjectRetain();
  sub_246A784B4();
  if (!v2)
  {
    OUTLINED_FUNCTION_2_17();
    sub_246A78358();
    v6 = v5;
    OUTLINED_FUNCTION_2_17();
    v7 = sub_246A78340();
    v9 = v8;
    OUTLINED_FUNCTION_1_15();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *a2 = v6;
    a2[1] = v7;
    a2[2] = v9;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7_7();
}

void sub_246A6D2EC(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  ReadingCompactCarPlayButton.init(from:)(a1, a2);
}

void sub_246A6D300(_QWORD *a1)
{
  ReadingCompactCarPlayButton.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for ReadingCompactCarPlayButton()
{
  return &type metadata for ReadingCompactCarPlayButton;
}

uint64_t storeEnumTagSinglePayload for ReadingCompactCarPlayButton.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A6D370 + 4 * byte_246A7D385[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_246A6D3A4 + 4 * byte_246A7D380[v4]))();
}

uint64_t sub_246A6D3A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A6D3AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A6D3B4);
  return result;
}

uint64_t sub_246A6D3C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A6D3C8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_246A6D3CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A6D3D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ReadingCompactCarPlayButton.CodingKeys()
{
  return &type metadata for ReadingCompactCarPlayButton.CodingKeys;
}

unint64_t sub_246A6D3F4()
{
  unint64_t result;

  result = qword_257618850;
  if (!qword_257618850)
  {
    result = MEMORY[0x249563B60](&unk_246A7D4C8, &type metadata for ReadingCompactCarPlayButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618850);
  }
  return result;
}

unint64_t sub_246A6D434()
{
  unint64_t result;

  result = qword_257618858;
  if (!qword_257618858)
  {
    result = MEMORY[0x249563B60](&unk_246A7D438, &type metadata for ReadingCompactCarPlayButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618858);
  }
  return result;
}

unint64_t sub_246A6D474()
{
  unint64_t result;

  result = qword_257618860;
  if (!qword_257618860)
  {
    result = MEMORY[0x249563B60](&unk_246A7D460, &type metadata for ReadingCompactCarPlayButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618860);
  }
  return result;
}

id UpdateMessageDraftSnippet.intent.getter()
{
  id *v0;
  id v1;
  id v2;

  v1 = *v0;
  v2 = *v0;
  return v1;
}

id sub_246A6D4D4@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = UpdateMessageDraftSnippet.intent.getter();
  *a1 = result;
  return result;
}

void sub_246A6D53C(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  UpdateMessageDraftSnippet.intent.setter(v1);
}

void UpdateMessageDraftSnippet.intent.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

void UpdateMessageDraftSnippet.intent.modify(void **a1)
{
  void **v1;
  void *v2;
  id v3;

  v2 = *v1;
  *a1 = *v1;
  a1[1] = v1;
  v3 = v2;
  OUTLINED_FUNCTION_9();
}

void UpdateMessageDraftSnippet.contactName.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_9();
}

void UpdateMessageDraftSnippet.contactName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t (*UpdateMessageDraftSnippet.contactName.modify())()
{
  return nullsub_1;
}

void UpdateMessageDraftSnippet.payload.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_9();
}

void UpdateMessageDraftSnippet.payload.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t (*UpdateMessageDraftSnippet.payload.modify())()
{
  return nullsub_1;
}

uint64_t UpdateMessageDraftSnippet.autoSendInfo.getter@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = v1[5];
  v3 = v1[6];
  v4 = v1[7];
  v5 = v1[8];
  v6 = v1[9];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  return sub_246A5C6C8(v2, v3, v4);
}

__n128 UpdateMessageDraftSnippet.autoSendInfo.setter(__int128 *a1)
{
  uint64_t *v1;
  uint64_t v2;
  __n128 result;
  __n128 v4;
  __int128 v5;

  v4 = (__n128)a1[1];
  v5 = *a1;
  v2 = *((_QWORD *)a1 + 4);
  sub_246A5C758(v1[5], v1[6], v1[7]);
  *(_OWORD *)(v1 + 5) = v5;
  result = v4;
  *(__n128 *)(v1 + 7) = v4;
  v1[9] = v2;
  return result;
}

uint64_t (*UpdateMessageDraftSnippet.autoSendInfo.modify())()
{
  return nullsub_1;
}

uint64_t UpdateMessageDraftSnippet.correctionInfo.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 88);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 80);
  *(_BYTE *)(a1 + 8) = v2;
  return swift_bridgeObjectRetain();
}

void UpdateMessageDraftSnippet.correctionInfo.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  v2 = *a1;
  v3 = *((_BYTE *)a1 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 80) = v2;
  *(_BYTE *)(v1 + 88) = v3;
  OUTLINED_FUNCTION_1();
}

uint64_t (*UpdateMessageDraftSnippet.correctionInfo.modify())()
{
  return nullsub_1;
}

uint64_t UpdateMessageDraftSnippet.shouldUpdateWithASRText.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 89);
}

uint64_t UpdateMessageDraftSnippet.shouldUpdateWithASRText.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 89) = result;
  return result;
}

uint64_t (*UpdateMessageDraftSnippet.shouldUpdateWithASRText.modify())()
{
  return nullsub_1;
}

void UpdateMessageDraftSnippet.errorMessage.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_9();
}

void UpdateMessageDraftSnippet.errorMessage.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 96) = a1;
  *(_QWORD *)(v2 + 104) = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t (*UpdateMessageDraftSnippet.errorMessage.modify())()
{
  return nullsub_1;
}

__n128 UpdateMessageDraftSnippet.init(intent:contactName:payload:autoSendInfo:correctionInfo:shouldUpdateWithASRText:errorMessage:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  __n128 result;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  result = *(__n128 *)a6;
  v12 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)(a9 + 40) = *(_OWORD *)a6;
  v13 = *(_QWORD *)(a6 + 32);
  v14 = *a7;
  v15 = *((_BYTE *)a7 + 8);
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_OWORD *)(a9 + 56) = v12;
  *(_QWORD *)(a9 + 72) = v13;
  *(_QWORD *)(a9 + 80) = v14;
  *(_BYTE *)(a9 + 88) = v15;
  *(_BYTE *)(a9 + 89) = a8;
  *(_QWORD *)(a9 + 96) = a10;
  *(_QWORD *)(a9 + 104) = a11;
  return result;
}

unint64_t UpdateMessageDraftSnippet.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 80);
  sub_246A78298();
  sub_246A78178();
  swift_bridgeObjectRetain();
  sub_246A78178();
  swift_bridgeObjectRelease();
  sub_246A78178();
  sub_246A78178();
  OUTLINED_FUNCTION_20_2();
  OUTLINED_FUNCTION_17_4();
  sub_246A78298();
  swift_bridgeObjectRelease();
  if (v1 != 1)
    AutoSendInfo.description.getter();
  OUTLINED_FUNCTION_14_5();
  OUTLINED_FUNCTION_1_8();
  sub_246A78178();
  if (v2)
    CorrectionInfo.description.getter();
  OUTLINED_FUNCTION_14_5();
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_17_4();
  OUTLINED_FUNCTION_19_3();
  OUTLINED_FUNCTION_12_8();
  OUTLINED_FUNCTION_20_2();
  swift_bridgeObjectRelease();
  sub_246A78298();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_14_5();
  OUTLINED_FUNCTION_1_8();
  sub_246A78178();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_12_8();
  swift_bridgeObjectRelease();
  sub_246A78178();
  OUTLINED_FUNCTION_19_3();
  OUTLINED_FUNCTION_14_5();
  OUTLINED_FUNCTION_20_2();
  OUTLINED_FUNCTION_1_8();
  return 0xD000000000000019;
}

uint64_t sub_246A6DB60(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  char v11;

  v3 = a1 == 0x746E65746E69 && a2 == 0xE600000000000000;
  if (v3 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x4E746361746E6F63 && a2 == 0xEB00000000656D61;
    if (v6 || (sub_246A78400() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x64616F6C796170 && a2 == 0xE700000000000000;
      if (v7 || (sub_246A78400() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x646E65536F747561 && a2 == 0xEC0000006F666E49;
        if (v8 || (sub_246A78400() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 0x6974636572726F63 && a2 == 0xEE006F666E496E6FLL;
          if (v9 || (sub_246A78400() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0xD000000000000017 && a2 == 0x8000000246A7F4E0 || (sub_246A78400() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else if (a1 == 0x73654D726F727265 && a2 == 0xEC00000065676173)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else
          {
            v11 = sub_246A78400();
            swift_bridgeObjectRelease();
            if ((v11 & 1) != 0)
              return 6;
            else
              return 7;
          }
        }
      }
    }
  }
}

uint64_t sub_246A6DE40()
{
  return 7;
}

uint64_t sub_246A6DE48(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_246A6DE80 + 4 * byte_246A7D540[a1]))(0xD000000000000017, 0x8000000246A7F4E0);
}

uint64_t sub_246A6DE80()
{
  return 0x746E65746E69;
}

uint64_t sub_246A6DE94()
{
  return 0x4E746361746E6F63;
}

uint64_t sub_246A6DEB4()
{
  return 0x64616F6C796170;
}

uint64_t sub_246A6DECC()
{
  return 0x646E65536F747561;
}

uint64_t sub_246A6DEEC()
{
  return 0x6974636572726F63;
}

uint64_t sub_246A6DF10()
{
  return 0x73654D726F727265;
}

uint64_t sub_246A6DF30()
{
  unsigned __int8 *v0;

  return sub_246A6DE48(*v0);
}

uint64_t sub_246A6DF38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A6DB60(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A6DF5C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_246A6DE40();
  *a1 = result;
  return result;
}

uint64_t sub_246A6DF80()
{
  sub_246A6E234();
  return sub_246A784D8();
}

uint64_t sub_246A6DFA8()
{
  sub_246A6E234();
  return sub_246A784E4();
}

void UpdateMessageDraftSnippet.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];
  int v17;
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
  int v33;
  char v34;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618868);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v1;
  v8 = v1[1];
  v26 = v1[2];
  v27 = v8;
  v10 = v1[3];
  v24 = v1[4];
  v25 = v10;
  v11 = v1[5];
  v22 = v1[6];
  v23 = v11;
  v12 = v1[8];
  v19 = v1[7];
  v20 = v12;
  v21 = v1[9];
  v18 = v1[10];
  v33 = *((unsigned __int8 *)v1 + 88);
  v17 = *((unsigned __int8 *)v1 + 89);
  v13 = v1[13];
  v16[0] = v1[12];
  v16[1] = v13;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A6E234();
  sub_246A784CC();
  v28 = v9;
  v34 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257617380);
  sub_246A6E6E4(&qword_257617388, (uint64_t)&protocol conformance descriptor for ModelCodable<A>);
  sub_246A783D0();
  if (!v2)
  {
    v15 = v22;
    v14 = v23;
    LOBYTE(v28) = 1;
    OUTLINED_FUNCTION_2_19();
    LOBYTE(v28) = 2;
    OUTLINED_FUNCTION_2_19();
    v28 = v14;
    v29 = v15;
    v30 = v19;
    v31 = v20;
    v32 = v21;
    v34 = 3;
    sub_246A5D78C();
    OUTLINED_FUNCTION_8_11();
    v28 = v18;
    LOBYTE(v29) = v33;
    v34 = 4;
    sub_246A5D7C8();
    OUTLINED_FUNCTION_8_11();
    LOBYTE(v28) = 5;
    sub_246A783B8();
    LOBYTE(v28) = 6;
    OUTLINED_FUNCTION_2_19();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  OUTLINED_FUNCTION_8_1();
}

unint64_t sub_246A6E234()
{
  unint64_t result;

  result = qword_257618870;
  if (!qword_257618870)
  {
    result = MEMORY[0x249563B60](&unk_246A7D700, &type metadata for UpdateMessageDraftSnippet.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618870);
  }
  return result;
}

void UpdateMessageDraftSnippet.init(from:)(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  id v11;
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
  void *v25;
  void *v26;
  void (*v27)(char *, uint64_t);
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  _QWORD *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  char v62;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618878);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v54 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_246A6E234();
  sub_246A784B4();
  if (v2)
  {
    v55 = v2;
    OUTLINED_FUNCTION_3_16();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_3_6();
    OUTLINED_FUNCTION_7_11();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257617380);
    v62 = 0;
    sub_246A6E6E4(&qword_2576173D0, (uint64_t)&protocol conformance descriptor for ModelCodable<A>);
    sub_246A78364();
    v10 = v56;
    LOBYTE(v56) = 1;
    v53 = v10;
    v11 = v10;
    v12 = sub_246A78328();
    v14 = v13;
    LOBYTE(v56) = 2;
    swift_bridgeObjectRetain();
    v15 = OUTLINED_FUNCTION_15_8();
    v17 = v16;
    v50 = v15;
    v52 = v14;
    v62 = 3;
    sub_246A5DECC();
    v51 = v17;
    OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_18_5();
    sub_246A78334();
    v46 = v12;
    v47 = a2;
    v18 = v57;
    v19 = v58;
    v20 = v59;
    v62 = 4;
    v48 = v60;
    v49 = (uint64_t)v56;
    sub_246A5C6C8((uint64_t)v56, v57, v58);
    sub_246A5DF08();
    OUTLINED_FUNCTION_18_5();
    sub_246A78334();
    v44 = v19;
    v45 = v11;
    v21 = v49;
    v22 = (uint64_t)v56;
    v23 = v57;
    LOBYTE(v56) = 5;
    swift_bridgeObjectRetain();
    v43 = sub_246A7834C();
    v61 = v23;
    LOBYTE(v56) = 6;
    v24 = OUTLINED_FUNCTION_15_8();
    v55 = 0;
    v26 = v25;
    v43 &= 1u;
    v27 = *(void (**)(char *, uint64_t))(v6 + 8);
    v42 = v24;
    v27(v8, v5);
    OUTLINED_FUNCTION_5_4();
    swift_bridgeObjectRelease();
    v28 = v45;
    v45 = v26;
    v29 = v28;
    v41 = v28;
    v30 = v52;
    swift_bridgeObjectRetain();
    v31 = v51;
    swift_bridgeObjectRetain();
    v32 = OUTLINED_FUNCTION_11_8();
    v33 = v48;
    sub_246A5C6C8(v32, v34, v35);
    OUTLINED_FUNCTION_6_14();

    OUTLINED_FUNCTION_3_6();
    swift_bridgeObjectRelease();
    v36 = v47;
    v37 = v46;
    *v47 = v53;
    v36[1] = v37;
    v38 = v50;
    v36[2] = v30;
    v36[3] = v38;
    v36[4] = v31;
    v36[5] = v23;
    v36[6] = v18;
    v36[7] = v21;
    v36[8] = v20;
    v36[9] = v33;
    v36[10] = v22;
    *((_BYTE *)v36 + 88) = v61;
    *((_BYTE *)v36 + 89) = v43;
    v39 = v45;
    v36[12] = v42;
    v36[13] = v39;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_3_6();

    OUTLINED_FUNCTION_6_14();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_8_1();
}

uint64_t sub_246A6E6E4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257617380);
    result = MEMORY[0x249563B60](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_246A6E728()
{
  sub_246A6EEBC();
  sub_246A6EEF8();
  return sub_246A78028();
}

uint64_t sub_246A6E790()
{
  sub_246A6EEBC();
  sub_246A6EEF8();
  return sub_246A7801C();
}

void sub_246A6E7E0(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  UpdateMessageDraftSnippet.init(from:)(a1, a2);
}

void sub_246A6E7F4(_QWORD *a1)
{
  UpdateMessageDraftSnippet.encode(to:)(a1);
}

uint64_t destroy for UpdateMessageDraftSnippet(uint64_t a1)
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 56) != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UpdateMessageDraftSnippet(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = *(void **)a2;
  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v7 = *(_QWORD *)(a2 + 56);
  v8 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7 == 1)
  {
    v9 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = v9;
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  }
  else
  {
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    v10 = *(_QWORD *)(a2 + 64);
    v11 = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 56) = v7;
    *(_QWORD *)(a1 + 64) = v10;
    *(_QWORD *)(a1 + 72) = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_WORD *)(a1 + 88) = *(_WORD *)(a2 + 88);
  v12 = *(_QWORD *)(a2 + 96);
  v13 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = v12;
  *(_QWORD *)(a1 + 104) = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UpdateMessageDraftSnippet(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  __int128 *v7;
  __int128 *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = (__int128 *)(a1 + 40);
  v8 = (__int128 *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 56);
  if (*(_QWORD *)(a1 + 56) == 1)
  {
    if (v9 == 1)
    {
      v10 = *v8;
      v11 = *(_OWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
      *v7 = v10;
      *(_OWORD *)(a1 + 56) = v11;
    }
    else
    {
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v9 == 1)
  {
    sub_246A5F318(a1 + 40);
    v12 = *(_QWORD *)(a2 + 72);
    v13 = *(_OWORD *)(a2 + 56);
    *v7 = *v8;
    *(_OWORD *)(a1 + 56) = v13;
    *(_QWORD *)(a1 + 72) = v12;
  }
  else
  {
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_BYTE *)(a1 + 89) = *(_BYTE *)(a2 + 89);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy112_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

uint64_t assignWithTake for UpdateMessageDraftSnippet(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v6;
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 56) != 1)
  {
    v7 = *(_QWORD *)(a2 + 56);
    if (v7 != 1)
    {
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
      *(_QWORD *)(a1 + 56) = v7;
      swift_bridgeObjectRelease();
      v9 = *(_QWORD *)(a2 + 72);
      *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 72) = v9;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_246A5F318(a1 + 40);
  }
  v8 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v8;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
LABEL_6:
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_BYTE *)(a1 + 89) = *(_BYTE *)(a2 + 89);
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UpdateMessageDraftSnippet(uint64_t *a1, unsigned int a2)
{
  int v2;
  uint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 112))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UpdateMessageDraftSnippet(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 112) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 112) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for UpdateMessageDraftSnippet()
{
  return &type metadata for UpdateMessageDraftSnippet;
}

uint64_t getEnumTagSinglePayload for UpdateMessageDraftSnippet.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFA)
  {
    if (a2 + 6 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 6) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 7;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v5 = v6 - 7;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for UpdateMessageDraftSnippet.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_246A6ED7C + 4 * byte_246A7D54C[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_246A6EDB0 + 4 * byte_246A7D547[v4]))();
}

uint64_t sub_246A6EDB0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A6EDB8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A6EDC0);
  return result;
}

uint64_t sub_246A6EDCC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A6EDD4);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_246A6EDD8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A6EDE0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UpdateMessageDraftSnippet.CodingKeys()
{
  return &type metadata for UpdateMessageDraftSnippet.CodingKeys;
}

unint64_t sub_246A6EE00()
{
  unint64_t result;

  result = qword_257618880;
  if (!qword_257618880)
  {
    result = MEMORY[0x249563B60](&unk_246A7D6D8, &type metadata for UpdateMessageDraftSnippet.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618880);
  }
  return result;
}

unint64_t sub_246A6EE40()
{
  unint64_t result;

  result = qword_257618888;
  if (!qword_257618888)
  {
    result = MEMORY[0x249563B60](&unk_246A7D648, &type metadata for UpdateMessageDraftSnippet.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618888);
  }
  return result;
}

unint64_t sub_246A6EE80()
{
  unint64_t result;

  result = qword_257618890;
  if (!qword_257618890)
  {
    result = MEMORY[0x249563B60](&unk_246A7D670, &type metadata for UpdateMessageDraftSnippet.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618890);
  }
  return result;
}

unint64_t sub_246A6EEBC()
{
  unint64_t result;

  result = qword_257618898;
  if (!qword_257618898)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for UpdateMessageDraftSnippet, &type metadata for UpdateMessageDraftSnippet);
    atomic_store(result, (unint64_t *)&qword_257618898);
  }
  return result;
}

unint64_t sub_246A6EEF8()
{
  unint64_t result;

  result = qword_2576188A0;
  if (!qword_2576188A0)
  {
    result = MEMORY[0x249563B60](&protocol conformance descriptor for UpdateMessageDraftSnippet, &type metadata for UpdateMessageDraftSnippet);
    atomic_store(result, (unint64_t *)&qword_2576188A0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_17()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_2_19()
{
  return sub_246A78394();
}

uint64_t OUTLINED_FUNCTION_6_14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return sub_246A5C758(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_7_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return sub_246A5C758(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_8_11()
{
  return sub_246A783A0();
}

uint64_t OUTLINED_FUNCTION_10_8()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_11_8()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_12_8()
{
  return sub_246A78178();
}

uint64_t OUTLINED_FUNCTION_14_5()
{
  return sub_246A78178();
}

uint64_t OUTLINED_FUNCTION_15_8()
{
  return sub_246A78328();
}

uint64_t OUTLINED_FUNCTION_17_4()
{
  return sub_246A78178();
}

uint64_t OUTLINED_FUNCTION_19_3()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_20_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_246A6F040@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = sub_246A77F5C();
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
  return __swift_storeEnumTagSinglePayload(a2, v7, 1, v6);
}

void static MessageAttachmentUtils.makeAttachmentModel(for:isDraft:location:)(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t (**v5)();
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
  uint64_t v20;
  uint64_t v21;
  void (*v22)(unint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  unsigned __int8 v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  void *v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  os_log_type_t v55;
  _BOOL4 v56;
  uint64_t *v57;
  char v58;
  _WORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  id v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  id v76;
  uint64_t v77;
  os_log_type_t v78;
  _WORD *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t (*v83)();
  unint64_t *v84;
  void *v85;
  uint64_t v86;
  os_log_type_t v87;
  _WORD *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  os_log_type_t v96;
  _WORD *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  os_log_type_t v103;
  _WORD *v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  os_log_type_t v109;
  _WORD *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  os_log_type_t v116;
  _WORD *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  int v130;
  uint64_t *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;

  LODWORD(v5) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576188A8);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v8);
  v127 = (char *)&v121 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v128 = sub_246A780C4();
  v124 = *(_QWORD *)(v128 - 8);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_9_10();
  v125 = v11;
  OUTLINED_FUNCTION_14_6();
  MEMORY[0x24BDAC7A8](v12);
  v126 = (char *)&v121 - v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576176F8);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_9_10();
  v132 = v15;
  OUTLINED_FUNCTION_14_6();
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v121 - v18;
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (void (*)(unint64_t, uint64_t))((char *)&v121 - v21);
  MEMORY[0x24BDAC7A8](v20);
  v134 = (uint64_t)&v121 - v23;
  v24 = sub_246A77F5C();
  v137 = *(_QWORD *)(v24 - 8);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_9_10();
  v129 = v26;
  OUTLINED_FUNCTION_14_6();
  v28 = MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)&v121 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v136 = (uint64_t)&v121 - v31;
  OUTLINED_FUNCTION_14_6();
  MEMORY[0x24BDAC7A8](v32);
  v135 = (uint64_t)&v121 - v33;
  OUTLINED_FUNCTION_14_6();
  MEMORY[0x24BDAC7A8](v34);
  v133 = (uint64_t)&v121 - v35;
  if ((unint64_t)a1 >> 62)
  {
    OUTLINED_FUNCTION_15_9();
    v36 = sub_246A782EC();
  }
  else
  {
    v36 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    OUTLINED_FUNCTION_15_9();
  }
  v138 = v24;
  if (v36)
  {
    v122 = a3;
    v123 = v30;
    v130 = (int)v5;
    v131 = a4;
    v37 = a1 & 0xC000000000000001;
    v38 = 4;
    v5 = &off_251808000;
    do
    {
      v39 = v38 - 4;
      if (v37)
        OUTLINED_FUNCTION_18_6();
      v40 = (uint64_t *)*(id *)(a1 + 8 * v38);
      a4 = v40;
      v41 = v38 - 3;
      if (__OFADD__(v39, 1))
      {
        __break(1u);
        goto LABEL_75;
      }
      v42 = objc_msgSend(v40, sel_currentLocation);

      if ((v42 & 1) != 0)
      {
        OUTLINED_FUNCTION_3_11();
        if (qword_2576171E8 != -1)
          swift_once();
        v54 = OUTLINED_FUNCTION_8_3();
        OUTLINED_FUNCTION_6_5(v54, (uint64_t)qword_257623F88);
        v55 = OUTLINED_FUNCTION_7_12();
        v56 = OUTLINED_FUNCTION_2_8(v55);
        v57 = v131;
        v58 = v130;
        if (v56)
        {
          v59 = (_WORD *)OUTLINED_FUNCTION_3_17();
          OUTLINED_FUNCTION_10_2(v59);
          OUTLINED_FUNCTION_1_6(&dword_246A43000, v60, v61, "#MessageAttachmentUtils creating view model for current location");
          OUTLINED_FUNCTION_1_17();
        }

        v62 = type metadata accessor for MapAttachment();
        v57[3] = v62;
        v57[4] = sub_246A4FEA4(&qword_2576174E8, (uint64_t (*)(uint64_t))type metadata accessor for MapAttachment, (uint64_t)&protocol conformance descriptor for MapAttachment);
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v57);
        static MessageAttachmentUtils.makeMapsURL(location:)(v122, (uint64_t)boxed_opaque_existential_1);
        v64 = *(int *)(v62 + 20);
        v65 = v58 & 1;
        goto LABEL_54;
      }
      ++v38;
    }
    while (v41 != v36);
    OUTLINED_FUNCTION_3_11();
    if (v36 < 1)
    {
      __break(1u);
      goto LABEL_83;
    }
    OUTLINED_FUNCTION_15_9();
    v43 = 0;
    v44 = MEMORY[0x24BEE4AF8];
    do
    {
      v45 = *(id *)(a1 + 8 * v43 + 32);
      v46 = objc_msgSend(v45, sel_sharedLink);
      if (v46)
      {
        v47 = v46;
        sub_246A77F38();

        v48 = 0;
      }
      else
      {
        v48 = 1;
      }
      OUTLINED_FUNCTION_17_5((uint64_t)v19, v48);
      sub_246A6FB80((uint64_t)v19, (uint64_t)v22);

      OUTLINED_FUNCTION_13_8((uint64_t)v22);
      if (v49)
      {
        sub_246A68C24((uint64_t)v22, &qword_2576176F8);
      }
      else
      {
        v50 = v135;
        OUTLINED_FUNCTION_6_15(v135, (uint64_t)v22);
        OUTLINED_FUNCTION_6_15(v136, v50);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          v44 = OUTLINED_FUNCTION_16_6(0, *(_QWORD *)(v44 + 16) + 1);
        v53 = *(_QWORD *)(v44 + 16);
        v52 = *(_QWORD *)(v44 + 24);
        if (v53 >= v52 >> 1)
          v44 = OUTLINED_FUNCTION_16_6(v52 > 1, v53 + 1);
        *(_QWORD *)(v44 + 16) = v53 + 1;
        OUTLINED_FUNCTION_6_15(v44+ ((*(unsigned __int8 *)(v137 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v137 + 80))+ *(_QWORD *)(v137 + 72) * v53, v136);
      }
      ++v43;
    }
    while (v36 != v43);
    OUTLINED_FUNCTION_3_11();
    a4 = v131;
    LOBYTE(v5) = v130;
    v30 = v123;
  }
  else
  {
    OUTLINED_FUNCTION_3_11();
    v44 = MEMORY[0x24BEE4AF8];
  }
  v66 = v134;
  sub_246A6F040(v44, v134);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13_8(v66);
  if (!v49)
  {
    v38 = *(_QWORD *)(v137 + 32);
    v73 = v133;
    OUTLINED_FUNCTION_6_15(v133, v66);
    v74 = (void *)objc_opt_self();
    v75 = (void *)sub_246A77F14();
    v76 = objc_msgSend(v74, sel_isValidMapURL_, v75);

    if ((_DWORD)v76)
    {
      if (qword_2576171E8 != -1)
        swift_once();
      v77 = OUTLINED_FUNCTION_8_3();
      OUTLINED_FUNCTION_6_5(v77, (uint64_t)qword_257623F88);
      v78 = OUTLINED_FUNCTION_7_12();
      if (OUTLINED_FUNCTION_2_8(v78))
      {
        v79 = (_WORD *)OUTLINED_FUNCTION_3_17();
        OUTLINED_FUNCTION_10_2(v79);
        OUTLINED_FUNCTION_1_6(&dword_246A43000, v80, v81, "#MessageAttachmentUtils creating view model for map link");
        OUTLINED_FUNCTION_1_17();
      }

      v82 = type metadata accessor for MapAttachment();
      v83 = type metadata accessor for MapAttachment;
      a4[3] = v82;
      v84 = &qword_2576174E8;
      v85 = &protocol conformance descriptor for MapAttachment;
    }
    else
    {
      if (qword_2576171E8 != -1)
        swift_once();
      v86 = OUTLINED_FUNCTION_8_3();
      OUTLINED_FUNCTION_6_5(v86, (uint64_t)qword_257623F88);
      v87 = OUTLINED_FUNCTION_7_12();
      if (OUTLINED_FUNCTION_2_8(v87))
      {
        v88 = (_WORD *)OUTLINED_FUNCTION_3_17();
        OUTLINED_FUNCTION_10_2(v88);
        OUTLINED_FUNCTION_1_6(&dword_246A43000, v89, v90, "#MessageAttachmentUtils creating view model for shared link");
        OUTLINED_FUNCTION_1_17();
      }

      v82 = type metadata accessor for LinkAttachment();
      v83 = type metadata accessor for LinkAttachment;
      a4[3] = v82;
      v84 = &qword_2576174F0;
      v85 = &protocol conformance descriptor for LinkAttachment;
    }
    v91 = sub_246A4FEA4(v84, (uint64_t (*)(uint64_t))v83, (uint64_t)v85);
    v92 = OUTLINED_FUNCTION_20_3(v91);
    boxed_opaque_existential_1 = v92;
    v93 = v73;
    goto LABEL_53;
  }
  sub_246A68C24(v66, &qword_2576176F8);
  v67 = v132;
  if (!v36)
    goto LABEL_57;
  sub_246A58230(0, (a1 & 0xC000000000000001) == 0, a1);
  if ((a1 & 0xC000000000000001) != 0)
  {
    OUTLINED_FUNCTION_15_9();
    OUTLINED_FUNCTION_18_6();
  }
  v68 = *(id *)(a1 + 32);
  a1 = (uint64_t)objc_msgSend(v68, sel_file);

  if (!a1)
  {
LABEL_57:
    if (qword_2576171E8 != -1)
LABEL_83:
      swift_once();
    v94 = OUTLINED_FUNCTION_8_3();
    v95 = (void *)OUTLINED_FUNCTION_6_5(v94, (uint64_t)qword_257623F88);
    v96 = sub_246A781FC();
    if (OUTLINED_FUNCTION_2_8(v96))
    {
      v97 = (_WORD *)OUTLINED_FUNCTION_3_17();
      OUTLINED_FUNCTION_10_2(v97);
      OUTLINED_FUNCTION_1_6(&dword_246A43000, v98, v99, "#MessageAttachmentUtils unsupported attachments");
      OUTLINED_FUNCTION_1_17();
    }

    a4[4] = 0;
    *(_OWORD *)a4 = 0u;
    *((_OWORD *)a4 + 1) = 0u;
    return;
  }
  v69 = objc_msgSend((id)a1, sel_fileURL);
  if (!v69)
  {
    __swift_storeEnumTagSinglePayload(v67, 1, 1, v138);
    goto LABEL_56;
  }
  v70 = v69;
  v71 = v129;
  sub_246A77F38();

  v41 = v138;
  v38 = *(_QWORD *)(v137 + 32);
  OUTLINED_FUNCTION_6_15(v67, v71);
  OUTLINED_FUNCTION_17_5(v67, 0);
  OUTLINED_FUNCTION_13_8(v67);
  if (v49)
  {
LABEL_56:

    sub_246A68C24(v67, &qword_2576176F8);
    goto LABEL_57;
  }
  OUTLINED_FUNCTION_6_15((uint64_t)v30, v67);
  sub_246A7012C((void *)a1);
  if (v72)
  {
    v41 = (uint64_t)v127;
    sub_246A780D0();
    v39 = v128;
    if (__swift_getEnumTagSinglePayload(v41, 1, v128) != 1)
    {
      v123 = v30;
      v100 = v124;
      v37 = (unint64_t)v126;
      (*(void (**)(char *, uint64_t, uint64_t))(v124 + 32))(v126, v41, v39);
      sub_246A780A0();
      v101 = sub_246A780B8();
      v22 = *(void (**)(unint64_t, uint64_t))(v100 + 8);
      OUTLINED_FUNCTION_19_4();
      if ((v101 & 1) != 0)
      {
        if (qword_2576171E8 != -1)
          swift_once();
        v102 = OUTLINED_FUNCTION_8_3();
        OUTLINED_FUNCTION_6_5(v102, (uint64_t)qword_257623F88);
        v103 = OUTLINED_FUNCTION_7_12();
        if (OUTLINED_FUNCTION_2_8(v103))
        {
          v104 = (_WORD *)OUTLINED_FUNCTION_3_17();
          OUTLINED_FUNCTION_10_2(v104);
          OUTLINED_FUNCTION_1_6(&dword_246A43000, v105, v106, "#MessageAttachmentUtils creating view model for photo");
          OUTLINED_FUNCTION_1_17();
        }

        OUTLINED_FUNCTION_21_1();
        OUTLINED_FUNCTION_10_9();
        a4[3] = (uint64_t)&type metadata for PhotoAttachment;
        v107 = sub_246A498AC();
      }
      else
      {
        sub_246A780AC();
        v41 = sub_246A780B8();
        OUTLINED_FUNCTION_19_4();
        if ((v41 & 1) == 0)
        {
LABEL_75:
          v22(v37, v39);
          v30 = v123;
          goto LABEL_76;
        }
        if (qword_2576171E8 != -1)
          swift_once();
        v108 = OUTLINED_FUNCTION_8_3();
        OUTLINED_FUNCTION_6_5(v108, (uint64_t)qword_257623F88);
        v109 = OUTLINED_FUNCTION_7_12();
        if (OUTLINED_FUNCTION_2_8(v109))
        {
          v110 = (_WORD *)OUTLINED_FUNCTION_3_17();
          OUTLINED_FUNCTION_10_2(v110);
          OUTLINED_FUNCTION_1_6(&dword_246A43000, v111, v112, "#MessageAttachmentUtils creating view model for video");
          OUTLINED_FUNCTION_1_17();
        }

        OUTLINED_FUNCTION_21_1();
        OUTLINED_FUNCTION_10_9();
        a4[3] = (uint64_t)&type metadata for VideoAttachment;
        v107 = sub_246A49870();
      }
      a4[4] = v107;
      type metadata accessor for SecurityScopedURL();
      v113 = swift_allocObject();
      ((void (*)(uint64_t, uint64_t, unint64_t))v38)(v113 + OBJC_IVAR____TtC18SiriMessagesCommon17SecurityScopedURL_wrappedValue, v71, v37);
      *a4 = v113;
      *((_BYTE *)a4 + 8) = v5 & 1;
      return;
    }
    sub_246A68C24(v41, &qword_2576188A8);
  }
LABEL_76:
  v114 = v30;
  if (qword_2576171E8 != -1)
    swift_once();
  v115 = OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_6_5(v115, (uint64_t)qword_257623F88);
  v116 = OUTLINED_FUNCTION_7_12();
  if (OUTLINED_FUNCTION_2_8(v116))
  {
    v117 = (_WORD *)OUTLINED_FUNCTION_3_17();
    OUTLINED_FUNCTION_10_2(v117);
    OUTLINED_FUNCTION_1_6(&dword_246A43000, v118, v119, "#MessageAttachmentUtils creating view model for file link");
    OUTLINED_FUNCTION_1_17();
  }

  v82 = type metadata accessor for LinkAttachment();
  a4[3] = v82;
  v120 = sub_246A4FEA4(&qword_2576174F0, (uint64_t (*)(uint64_t))type metadata accessor for LinkAttachment, (uint64_t)&protocol conformance descriptor for LinkAttachment);
  v92 = OUTLINED_FUNCTION_20_3(v120);
  boxed_opaque_existential_1 = v92;
  v93 = (uint64_t)v114;
LABEL_53:
  ((void (*)(uint64_t *, uint64_t, uint64_t))v38)(v92, v93, v138);
  v64 = *(int *)(v82 + 20);
  v65 = v5 & 1;
LABEL_54:
  *((_BYTE *)boxed_opaque_existential_1 + v64) = v65;
}

uint64_t sub_246A6FB80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576176F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t static MessageAttachmentUtils.makeMapsURL(location:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t result;
  _QWORD v9[2];

  __swift_instantiateConcreteTypeFromMangledName(&qword_2576176F8);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[0] = 0;
  v9[1] = 0xE000000000000000;
  sub_246A78298();
  sub_246A78178();
  if (a1)
  {
    OUTLINED_FUNCTION_23_1();
    sub_246A781C0();
    OUTLINED_FUNCTION_22_3();
    OUTLINED_FUNCTION_23_1();
  }
  else
  {
    sub_246A781C0();
    OUTLINED_FUNCTION_22_3();
  }
  sub_246A781C0();
  sub_246A77F50();
  swift_bridgeObjectRelease();
  v7 = sub_246A77F5C();
  result = __swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a2, v6, v7);
  __break(1u);
  return result;
}

uint64_t sub_246A6FD40(char a1, int64_t a2, char a3, uint64_t a4)
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
  uint64_t v17;
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
        goto LABEL_24;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576188B0);
  v10 = *(_QWORD *)(sub_246A77F5C() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_24:
    result = sub_246A782E0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(unsigned __int8 *)(*(_QWORD *)(sub_246A77F5C() - 8) + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    sub_246A70030(a4 + v17, v8, v18);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_246A6FF10(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

uint64_t sub_246A6FF10(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(sub_246A77F5C() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v13;
    }
  }
  result = sub_246A782F8();
  __break(1u);
  return result;
}

uint64_t sub_246A70030(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    result = sub_246A782F8();
    __break(1u);
  }
  else if (a3 < a1 || (result = sub_246A77F5C(), a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    sub_246A77F5C();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

uint64_t sub_246A7012C(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_typeIdentifier);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_246A7813C();

  return v3;
}

ValueMetadata *type metadata accessor for MessageAttachmentUtils()
{
  return &type metadata for MessageAttachmentUtils;
}

void OUTLINED_FUNCTION_1_17()
{
  JUMPOUT(0x249563BFCLL);
}

uint64_t OUTLINED_FUNCTION_3_17()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_6_15(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_7_12()
{
  return sub_246A781F0();
}

uint64_t OUTLINED_FUNCTION_10_9()
{
  uint64_t (*v0)(uint64_t, _QWORD, _QWORD);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, *(_QWORD *)(v2 - 208), *(_QWORD *)(v2 - 88));
}

uint64_t OUTLINED_FUNCTION_13_8(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_15_9()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_16_6(char a1, int64_t a2)
{
  uint64_t v2;

  return sub_246A6FD40(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_17_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

void OUTLINED_FUNCTION_18_6()
{
  JUMPOUT(0x249563548);
}

uint64_t OUTLINED_FUNCTION_19_4()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v2, v0);
}

uint64_t *OUTLINED_FUNCTION_20_3(uint64_t a1)
{
  uint64_t *v1;

  v1[4] = a1;
  return __swift_allocate_boxed_opaque_existential_1(v1);
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  uint64_t (*v0)(_QWORD, _QWORD);
  uint64_t v1;

  return v0(*(_QWORD *)(v1 - 184), *(_QWORD *)(v1 - 168));
}

uint64_t OUTLINED_FUNCTION_22_3()
{
  return sub_246A78178();
}

id OUTLINED_FUNCTION_23_1()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 712));
}

unint64_t static MessagesUIPluginModel.bundleName.getter()
{
  return 0xD000000000000010;
}

uint64_t MessagesUIPluginModel.snippetHidden(for:idiom:)()
{
  return 0;
}

uint64_t sub_246A702A0(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000018 && a2 == 0x8000000246A7F740 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000020 && a2 == 0x8000000246A7F760 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x8000000246A7F790 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x8000000246A7F7B0 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x8000000246A7F7D0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v5 = sub_246A78400();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_246A7048C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_246A704C4 + 4 * byte_246A7D770[a1]))(0xD000000000000018, 0x8000000246A7F740);
}

uint64_t sub_246A704C4(uint64_t a1)
{
  return a1 + 8;
}

uint64_t sub_246A70508()
{
  sub_246A70D9C();
  return sub_246A784D8();
}

uint64_t sub_246A70530()
{
  sub_246A70D9C();
  return sub_246A784E4();
}

uint64_t sub_246A70558()
{
  unsigned __int8 *v0;

  return sub_246A7048C(*v0);
}

uint64_t sub_246A70560@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A702A0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A70584()
{
  sub_246A70D1C();
  return sub_246A784D8();
}

uint64_t sub_246A705AC()
{
  sub_246A70D1C();
  return sub_246A784E4();
}

uint64_t sub_246A705D4()
{
  sub_246A70E8C();
  return sub_246A784D8();
}

uint64_t sub_246A705FC()
{
  sub_246A70E8C();
  return sub_246A784E4();
}

uint64_t sub_246A70624()
{
  sub_246A70E14();
  return sub_246A784D8();
}

uint64_t sub_246A7064C()
{
  sub_246A70E14();
  return sub_246A784E4();
}

uint64_t sub_246A70674()
{
  sub_246A70DD8();
  return sub_246A784D8();
}

uint64_t sub_246A7069C()
{
  sub_246A70DD8();
  return sub_246A784E4();
}

uint64_t sub_246A706C4()
{
  sub_246A70E50();
  return sub_246A784D8();
}

uint64_t sub_246A706EC()
{
  sub_246A70E50();
  return sub_246A784E4();
}

void MessagesUIPluginModel.encode(to:)(_QWORD *a1)
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
  char *v17;
  uint64_t v18;
  uint64_t v19;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2576188B8);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_14_1(v3, v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576188C0);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_6_0();
  type metadata accessor for SentMessageSnippetModel();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_6_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576188C8);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_6_0();
  type metadata accessor for MessageDraftSnippetModel();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_6_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576188D0);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_6_0();
  type metadata accessor for AutoSendableBinaryButton();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_6_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576188D8);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_15_0();
  type metadata accessor for ConfirmationSnippetModel(0);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_15_0();
  type metadata accessor for MessagesUIPluginModel();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_15_0();
  v15 = v14 - v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576188E0);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_15_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A70D1C();
  sub_246A784CC();
  sub_246A70D58(v19, v15);
  v17 = (char *)sub_246A709C8 + 4 * byte_246A7D775[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_246A709C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_246A4B53C(v0, v2, type metadata accessor for ConfirmationSnippetModel);
  *(_BYTE *)(v3 - 112) = 0;
  sub_246A70E8C();
  v5 = *(_QWORD *)(v3 - 136);
  v4 = *(_QWORD *)(v3 - 128);
  sub_246A78388();
  sub_246A4B7F0(&qword_2576183A0, type metadata accessor for ConfirmationSnippetModel, (uint64_t)&protocol conformance descriptor for ConfirmationSnippetModel);
  v6 = *(_QWORD *)(v3 - 296);
  OUTLINED_FUNCTION_12_9();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 304) + 8))(v1, v6);
  sub_246A4BC60(v2, type metadata accessor for ConfirmationSnippetModel);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 144) + 8))(v5, v4);
  OUTLINED_FUNCTION_8_1();
}

uint64_t type metadata accessor for MessagesUIPluginModel()
{
  uint64_t result;

  result = qword_2576189C8;
  if (!qword_2576189C8)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_246A70D1C()
{
  unint64_t result;

  result = qword_2576188E8;
  if (!qword_2576188E8)
  {
    result = MEMORY[0x249563B60](&unk_246A7DF68, &type metadata for MessagesUIPluginModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576188E8);
  }
  return result;
}

uint64_t sub_246A70D58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MessagesUIPluginModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_246A70D9C()
{
  unint64_t result;

  result = qword_2576188F0;
  if (!qword_2576188F0)
  {
    result = MEMORY[0x249563B60](&unk_246A7DF18, &type metadata for MessagesUIPluginModel.AppDisambiguationSnippetModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576188F0);
  }
  return result;
}

unint64_t sub_246A70DD8()
{
  unint64_t result;

  result = qword_2576188F8;
  if (!qword_2576188F8)
  {
    result = MEMORY[0x249563B60](&unk_246A7DEC8, &type metadata for MessagesUIPluginModel.SentMessageSnippetModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576188F8);
  }
  return result;
}

unint64_t sub_246A70E14()
{
  unint64_t result;

  result = qword_257618900;
  if (!qword_257618900)
  {
    result = MEMORY[0x249563B60](&unk_246A7DE78, &type metadata for MessagesUIPluginModel.MessageDraftSnippetModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618900);
  }
  return result;
}

unint64_t sub_246A70E50()
{
  unint64_t result;

  result = qword_257618908;
  if (!qword_257618908)
  {
    result = MEMORY[0x249563B60](&unk_246A7DE28, &type metadata for MessagesUIPluginModel.WatchAutosendButtonsSnippetModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618908);
  }
  return result;
}

unint64_t sub_246A70E8C()
{
  unint64_t result;

  result = qword_257618910;
  if (!qword_257618910)
  {
    result = MEMORY[0x249563B60](&unk_246A7DDD8, &type metadata for MessagesUIPluginModel.ConfirmationSnippetModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618910);
  }
  return result;
}

void MessagesUIPluginModel.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t v52[8];
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
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  char *v70;

  v61 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618918);
  v59 = *(_QWORD *)(v3 - 8);
  v60 = v3;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_6_0();
  v65 = v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618920);
  v57 = *(_QWORD *)(v6 - 8);
  v58 = v6;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_6_0();
  v64 = v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618928);
  v55 = *(_QWORD *)(v9 - 8);
  v56 = v9;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_14_1(v11, v52[0]);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618930);
  v52[6] = *(_QWORD *)(v54 - 8);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_6_0();
  v63 = v13;
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618938);
  v52[7] = *(_QWORD *)(v53 - 8);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_6_0();
  v62 = v15;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618940);
  v66 = *(_QWORD *)(v16 - 8);
  v67 = v16;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_15_0();
  v20 = v19 - v18;
  v68 = type metadata accessor for MessagesUIPluginModel();
  OUTLINED_FUNCTION_12_0();
  v22 = MEMORY[0x24BDAC7A8](v21);
  v52[5] = (uint64_t)v52 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)v52 - v25;
  v27 = MEMORY[0x24BDAC7A8](v24);
  v29 = (char *)v52 - v28;
  v30 = MEMORY[0x24BDAC7A8](v27);
  v32 = (char *)v52 - v31;
  v33 = MEMORY[0x24BDAC7A8](v30);
  v35 = (char *)v52 - v34;
  MEMORY[0x24BDAC7A8](v33);
  v37 = (char *)v52 - v36;
  v38 = a1[3];
  v69 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v38);
  sub_246A70D1C();
  v39 = v70;
  sub_246A784B4();
  if (!v39)
  {
    v52[1] = (uint64_t)v35;
    v52[2] = (uint64_t)v32;
    v52[3] = (uint64_t)v29;
    v52[4] = (uint64_t)v26;
    v70 = v37;
    v40 = v67;
    v41 = sub_246A78370();
    v42 = *(_QWORD *)(v41 + 16);
    if (v42)
    {
      v52[0] = 0;
      v43 = *(unsigned __int8 *)(v41 + 32);
      sub_246A4C56C(1, v42, v41, v41 + 32, 0, (2 * v42) | 1);
      v45 = v44;
      v47 = v46;
      swift_bridgeObjectRelease();
      if (v45 == v47 >> 1)
        __asm { BR              X9 }
    }
    v48 = v68;
    v49 = sub_246A782C8();
    swift_allocError();
    v51 = v50;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257617598);
    *v51 = v48;
    sub_246A7831C();
    sub_246A782BC();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v49 - 8) + 104))(v51, *MEMORY[0x24BEE26D0], v49);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v20, v40);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v69);
  OUTLINED_FUNCTION_8_1();
}

void sub_246A712E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_19_5();
  OUTLINED_FUNCTION_18_7();
  OUTLINED_FUNCTION_3_18();
  if (!v0)
  {
    type metadata accessor for AutoSendableBinaryButton();
    sub_246A4B7F0(&qword_257618150, (uint64_t (*)(uint64_t))type metadata accessor for AutoSendableBinaryButton, (uint64_t)&protocol conformance descriptor for AutoSendableBinaryButton);
    v2 = *(_QWORD *)(v1 - 304);
    OUTLINED_FUNCTION_6_16();
    OUTLINED_FUNCTION_11_9(v1 - 16);
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_8_12();
    swift_storeEnumTagMultiPayload();
    v3 = *(_QWORD *)(v1 - 72);
    sub_246A4B53C(v2, v3, (uint64_t (*)(_QWORD))type metadata accessor for MessagesUIPluginModel);
    sub_246A4B53C(v3, *(_QWORD *)(v1 - 192), (uint64_t (*)(_QWORD))type metadata accessor for MessagesUIPluginModel);
    JUMPOUT(0x246A712D4);
  }
  swift_unknownObjectRelease();
  JUMPOUT(0x246A712CCLL);
}

void sub_246A713FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_17_6();
  OUTLINED_FUNCTION_3_18();
  if (v0)
  {
    OUTLINED_FUNCTION_13_9();
    JUMPOUT(0x246A712CCLL);
  }
  sub_246A6CB54();
  OUTLINED_FUNCTION_6_16();
  v4 = *(_QWORD *)(v3 - 144);
  OUTLINED_FUNCTION_2_20(*(_QWORD *)(v3 - 208));
  OUTLINED_FUNCTION_13_9();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v1);
  v5 = *(_QWORD *)(v3 - 280);
  *(_QWORD *)v5 = *(_QWORD *)(v3 - 112);
  *(_OWORD *)(v5 + 8) = *(_OWORD *)(v3 - 104);
  swift_storeEnumTagMultiPayload();
  JUMPOUT(0x246A716BCLL);
}

unint64_t sub_246A716E8()
{
  static MessagesUIPluginModel.bundleName.getter();
  return 0xD000000000000010;
}

void sub_246A71704(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  MessagesUIPluginModel.init(from:)(a1, a2);
}

void sub_246A71718(_QWORD *a1)
{
  MessagesUIPluginModel.encode(to:)(a1);
}

void sub_246A7172C()
{
  sub_246A4B7F0(&qword_257618948, (uint64_t (*)(uint64_t))type metadata accessor for MessagesUIPluginModel, (uint64_t)&protocol conformance descriptor for MessagesUIPluginModel);
}

void sub_246A71758()
{
  sub_246A4B7F0(&qword_257618950, (uint64_t (*)(uint64_t))type metadata accessor for MessagesUIPluginModel, (uint64_t)&protocol conformance descriptor for MessagesUIPluginModel);
}

uint64_t initializeBufferWithCopyOfBuffer for MessagesUIPluginModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    v5 = (char *)&loc_246A717E0 + 4 * byte_246A7D77F[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t destroy for MessagesUIPluginModel(id *a1)
{
  uint64_t result;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v3 = (char *)a1 + *(int *)(type metadata accessor for ConfirmationSnippetModel(0) + 24);
      type metadata accessor for ConfirmationSnippetModel.MessageType(0);
      result = swift_getEnumCaseMultiPayload();
      switch((_DWORD)result)
      {
        case 2:
          goto LABEL_21;
        case 1:
          v21 = sub_246A77F5C();
          (*(void (**)(char *, uint64_t))(*(_QWORD *)(v21 - 8) + 8))(v3, v21);
          type metadata accessor for AudioMessagePlayer();
          swift_bridgeObjectRelease();
          goto LABEL_21;
        case 0:
          type metadata accessor for AttachmentModel();
          switch(swift_getEnumCaseMultiPayload())
          {
            case 0u:
            case 1u:
              v4 = sub_246A77F5C();
              (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
              break;
            case 2u:
            case 3u:
              swift_release();
              break;
            default:
              break;
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_257618308);
          goto LABEL_21;
      }
      break;
    case 1:

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v10 = (uint64_t)a1 + *(int *)(type metadata accessor for AutoSendableBinaryButton() + 48);
      v11 = sub_246A78094();
      result = __swift_getEnumTagSinglePayload(v10, 1, v11);
      if (!(_DWORD)result)
      {
        v19 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8);
        v20 = v10;
        v18 = v11;
        goto LABEL_15;
      }
      break;
    case 2:
      v5 = sub_246A77FA4();
      (*(void (**)(id *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
      v6 = (int *)type metadata accessor for MessageDraftSnippetModel();

      v7 = (char *)a1 + v6[6];
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
      swift_bridgeObjectRelease();
      if (*(id *)((char *)a1 + v6[9] + 16) != (id)1)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      v9 = v6[11];
      goto LABEL_14;
    case 3:

      v12 = (int *)type metadata accessor for SentMessageSnippetModel();
      v13 = (char *)a1 + v12[6];
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
      v15 = (char *)a1 + v12[7];
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617360);
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
      v9 = v12[8];
LABEL_14:
      v17 = (char *)a1 + v9;
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
      v19 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8);
      v20 = (uint64_t)v17;
LABEL_15:
      result = v19(v20, v18);
      break;
    case 4:
      swift_bridgeObjectRelease();
LABEL_21:
      result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

void initializeWithCopy for MessagesUIPluginModel()
{
  char *v0;

  v0 = (char *)sub_246A72090 + 4 * byte_246A7D791[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

_QWORD *sub_246A72090()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;

  v2 = v1[1];
  *v0 = *v1;
  v0[1] = v2;
  v3 = v1[3];
  v0[2] = v1[2];
  v0[3] = v3;
  v4 = *(int *)(type metadata accessor for ConfirmationSnippetModel(0) + 24);
  v5 = (char *)v0 + v4;
  v6 = (char *)v1 + v4;
  type metadata accessor for ConfirmationSnippetModel.MessageType(0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v19 = *((_QWORD *)v6 + 1);
    *(_QWORD *)v5 = *(_QWORD *)v6;
    *((_QWORD *)v5 + 1) = v19;
    v5[16] = v6[16];
  }
  else
  {
    if (EnumCaseMultiPayload != 1)
    {
      type metadata accessor for AttachmentModel();
      v20 = (char *)&loc_246A7246C + 4 * byte_246A7D796[swift_getEnumCaseMultiPayload()];
      __asm { BR              X10 }
    }
    v8 = sub_246A77F5C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v5, v6, v8);
    v9 = (int *)type metadata accessor for AudioMessagePlayer();
    v5[v9[5]] = v6[v9[5]];
    v10 = v9[6];
    v11 = &v5[v10];
    v12 = &v6[v10];
    v14 = *(_QWORD *)v12;
    v13 = *((_QWORD *)v12 + 1);
    *(_QWORD *)v11 = v14;
    *((_QWORD *)v11 + 1) = v13;
    v15 = v9[7];
    v16 = &v5[v15];
    v17 = &v6[v15];
    v18 = *((_QWORD *)v17 + 1);
    *(_QWORD *)v16 = *(_QWORD *)v17;
    *((_QWORD *)v16 + 1) = v18;
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  swift_storeEnumTagMultiPayload();
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t assignWithCopy for MessagesUIPluginModel(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_246A4BC60(result, (uint64_t (*)(_QWORD))type metadata accessor for MessagesUIPluginModel);
    v2 = (char *)&loc_246A725C8 + 4 * byte_246A7D79A[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

_OWORD *initializeWithTake for MessagesUIPluginModel(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  uint64_t v10;
  int EnumCaseMultiPayload;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  __int128 v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  int *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  int *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      v7 = *(int *)(type metadata accessor for ConfirmationSnippetModel(0) + 24);
      v8 = (char *)a1 + v7;
      v9 = (char *)a2 + v7;
      v10 = type metadata accessor for ConfirmationSnippetModel.MessageType(0);
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 1)
      {
        v52 = sub_246A77F5C();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v52 - 8) + 32))(v8, v9, v52);
        v53 = (int *)type metadata accessor for AudioMessagePlayer();
        v8[v53[5]] = v9[v53[5]];
        *(_OWORD *)&v8[v53[6]] = *(_OWORD *)&v9[v53[6]];
        *(_OWORD *)&v8[v53[7]] = *(_OWORD *)&v9[v53[7]];
LABEL_20:
        swift_storeEnumTagMultiPayload();
        goto LABEL_21;
      }
      if (EnumCaseMultiPayload)
      {
        memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
        goto LABEL_21;
      }
      v12 = type metadata accessor for AttachmentModel();
      v13 = swift_getEnumCaseMultiPayload();
      if (v13 == 1)
      {
        v54 = sub_246A77F5C();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v54 - 8) + 32))(v8, v9, v54);
        v55 = type metadata accessor for MapAttachment();
        v8[*(int *)(v55 + 20)] = v9[*(int *)(v55 + 20)];
      }
      else
      {
        if (v13)
        {
          memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
          goto LABEL_19;
        }
        v14 = sub_246A77F5C();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v8, v9, v14);
        v15 = type metadata accessor for LinkAttachment();
        v8[*(int *)(v15 + 20)] = v9[*(int *)(v15 + 20)];
      }
      swift_storeEnumTagMultiPayload();
LABEL_19:
      v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618308);
      *(_OWORD *)&v8[*(int *)(v56 + 48)] = *(_OWORD *)&v9[*(int *)(v56 + 48)];
      goto LABEL_20;
    case 1u:
      *(_BYTE *)a1 = *(_BYTE *)a2;
      *(_OWORD *)((char *)a1 + 8) = *(_OWORD *)((char *)a2 + 8);
      *((_QWORD *)a1 + 3) = *((_QWORD *)a2 + 3);
      v16 = a2[3];
      a1[2] = a2[2];
      a1[3] = v16;
      a1[4] = a2[4];
      *((_BYTE *)a1 + 80) = *((_BYTE *)a2 + 80);
      v17 = *(int *)(type metadata accessor for AutoSendableBinaryButton() + 48);
      v18 = (char *)a1 + v17;
      v19 = (char *)a2 + v17;
      v20 = sub_246A78094();
      if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20))
      {
        v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617218);
        memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v18, v19, v20);
        __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
      }
      goto LABEL_21;
    case 2u:
      v22 = sub_246A77FA4();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(a1, a2, v22);
      v23 = (int *)type metadata accessor for MessageDraftSnippetModel();
      *(_QWORD *)((char *)a1 + v23[5]) = *(_QWORD *)((char *)a2 + v23[5]);
      v24 = v23[6];
      v25 = (char *)a1 + v24;
      v26 = (char *)a2 + v24;
      v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(v25, v26, v27);
      *(_OWORD *)((char *)a1 + v23[7]) = *(_OWORD *)((char *)a2 + v23[7]);
      *((_BYTE *)a1 + v23[8]) = *((_BYTE *)a2 + v23[8]);
      v28 = v23[9];
      v29 = (char *)a1 + v28;
      v30 = (char *)a2 + v28;
      *((_QWORD *)v29 + 4) = *((_QWORD *)v30 + 4);
      v31 = *((_OWORD *)v30 + 1);
      *(_OWORD *)v29 = *(_OWORD *)v30;
      *((_OWORD *)v29 + 1) = v31;
      v32 = v23[10];
      v33 = (char *)a1 + v32;
      v34 = (char *)a2 + v32;
      v33[8] = v34[8];
      *(_QWORD *)v33 = *(_QWORD *)v34;
      v35 = v23[11];
      v36 = (char *)a1 + v35;
      v37 = (char *)a2 + v35;
      v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 32))(v36, v37, v38);
      goto LABEL_21;
    case 3u:
      *a1 = *a2;
      v39 = (int *)type metadata accessor for SentMessageSnippetModel();
      v40 = v39[6];
      v41 = (char *)a1 + v40;
      v42 = (char *)a2 + v40;
      v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v43 - 8) + 32))(v41, v42, v43);
      v44 = v39[7];
      v45 = (char *)a1 + v44;
      v46 = (char *)a2 + v44;
      v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617360);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v47 - 8) + 32))(v45, v46, v47);
      v48 = v39[8];
      v49 = (char *)a1 + v48;
      v50 = (char *)a2 + v48;
      v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v51 - 8) + 32))(v49, v50, v51);
LABEL_21:
      swift_storeEnumTagMultiPayload();
      return a1;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      return a1;
  }
}

_OWORD *assignWithTake for MessagesUIPluginModel(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  uint64_t v10;
  int EnumCaseMultiPayload;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  __int128 v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  int *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  int *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  if (a1 != a2)
  {
    sub_246A4BC60((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for MessagesUIPluginModel);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v6 = a2[1];
        *a1 = *a2;
        a1[1] = v6;
        v7 = *(int *)(type metadata accessor for ConfirmationSnippetModel(0) + 24);
        v8 = (char *)a1 + v7;
        v9 = (char *)a2 + v7;
        v10 = type metadata accessor for ConfirmationSnippetModel.MessageType(0);
        EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        if (EnumCaseMultiPayload == 1)
        {
          v52 = sub_246A77F5C();
          (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v52 - 8) + 32))(v8, v9, v52);
          v53 = (int *)type metadata accessor for AudioMessagePlayer();
          v8[v53[5]] = v9[v53[5]];
          *(_OWORD *)&v8[v53[6]] = *(_OWORD *)&v9[v53[6]];
          *(_OWORD *)&v8[v53[7]] = *(_OWORD *)&v9[v53[7]];
LABEL_21:
          swift_storeEnumTagMultiPayload();
          goto LABEL_22;
        }
        if (EnumCaseMultiPayload)
        {
          memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
          goto LABEL_22;
        }
        v12 = type metadata accessor for AttachmentModel();
        v13 = swift_getEnumCaseMultiPayload();
        if (v13 == 1)
        {
          v54 = sub_246A77F5C();
          (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v54 - 8) + 32))(v8, v9, v54);
          v55 = type metadata accessor for MapAttachment();
          v8[*(int *)(v55 + 20)] = v9[*(int *)(v55 + 20)];
        }
        else
        {
          if (v13)
          {
            memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
            goto LABEL_20;
          }
          v14 = sub_246A77F5C();
          (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v8, v9, v14);
          v15 = type metadata accessor for LinkAttachment();
          v8[*(int *)(v15 + 20)] = v9[*(int *)(v15 + 20)];
        }
        swift_storeEnumTagMultiPayload();
LABEL_20:
        v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618308);
        *(_OWORD *)&v8[*(int *)(v56 + 48)] = *(_OWORD *)&v9[*(int *)(v56 + 48)];
        goto LABEL_21;
      case 1u:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        *(_OWORD *)((char *)a1 + 8) = *(_OWORD *)((char *)a2 + 8);
        *((_QWORD *)a1 + 3) = *((_QWORD *)a2 + 3);
        v16 = a2[3];
        a1[2] = a2[2];
        a1[3] = v16;
        a1[4] = a2[4];
        *((_BYTE *)a1 + 80) = *((_BYTE *)a2 + 80);
        v17 = *(int *)(type metadata accessor for AutoSendableBinaryButton() + 48);
        v18 = (char *)a1 + v17;
        v19 = (char *)a2 + v17;
        v20 = sub_246A78094();
        if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20))
        {
          v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617218);
          memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v18, v19, v20);
          __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
        }
        goto LABEL_22;
      case 2u:
        v22 = sub_246A77FA4();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(a1, a2, v22);
        v23 = (int *)type metadata accessor for MessageDraftSnippetModel();
        *(_QWORD *)((char *)a1 + v23[5]) = *(_QWORD *)((char *)a2 + v23[5]);
        v24 = v23[6];
        v25 = (char *)a1 + v24;
        v26 = (char *)a2 + v24;
        v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(v25, v26, v27);
        *(_OWORD *)((char *)a1 + v23[7]) = *(_OWORD *)((char *)a2 + v23[7]);
        *((_BYTE *)a1 + v23[8]) = *((_BYTE *)a2 + v23[8]);
        v28 = v23[9];
        v29 = (char *)a1 + v28;
        v30 = (char *)a2 + v28;
        *((_QWORD *)v29 + 4) = *((_QWORD *)v30 + 4);
        v31 = *((_OWORD *)v30 + 1);
        *(_OWORD *)v29 = *(_OWORD *)v30;
        *((_OWORD *)v29 + 1) = v31;
        v32 = v23[10];
        v33 = (char *)a1 + v32;
        v34 = (char *)a2 + v32;
        v33[8] = v34[8];
        *(_QWORD *)v33 = *(_QWORD *)v34;
        v35 = v23[11];
        v36 = (char *)a1 + v35;
        v37 = (char *)a2 + v35;
        v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 32))(v36, v37, v38);
        goto LABEL_22;
      case 3u:
        *a1 = *a2;
        v39 = (int *)type metadata accessor for SentMessageSnippetModel();
        v40 = v39[6];
        v41 = (char *)a1 + v40;
        v42 = (char *)a2 + v40;
        v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617358);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v43 - 8) + 32))(v41, v42, v43);
        v44 = v39[7];
        v45 = (char *)a1 + v44;
        v46 = (char *)a2 + v44;
        v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617360);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v47 - 8) + 32))(v45, v46, v47);
        v48 = v39[8];
        v49 = (char *)a1 + v48;
        v50 = (char *)a2 + v48;
        v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617368);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v51 - 8) + 32))(v49, v50, v51);
LABEL_22:
        swift_storeEnumTagMultiPayload();
        return a1;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        return a1;
    }
  }
  return a1;
}

uint64_t sub_246A734B0()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  result = type metadata accessor for ConfirmationSnippetModel(319);
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for AutoSendableBinaryButton();
    if (v2 <= 0x3F)
    {
      result = type metadata accessor for MessageDraftSnippetModel();
      if (v3 <= 0x3F)
      {
        result = type metadata accessor for SentMessageSnippetModel();
        if (v4 <= 0x3F)
        {
          swift_initEnumMetadataMultiPayload();
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for MessagesUIPluginModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A735BC + 4 * byte_246A7D7B0[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_246A735F0 + 4 * byte_246A7D7AB[v4]))();
}

uint64_t sub_246A735F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A735F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A73600);
  return result;
}

uint64_t sub_246A7360C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A73614);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_246A73618(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A73620(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MessagesUIPluginModel.CodingKeys()
{
  return &type metadata for MessagesUIPluginModel.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagesUIPluginModel.ConfirmationSnippetModelCodingKeys()
{
  return &type metadata for MessagesUIPluginModel.ConfirmationSnippetModelCodingKeys;
}

ValueMetadata *type metadata accessor for MessagesUIPluginModel.WatchAutosendButtonsSnippetModelCodingKeys()
{
  return &type metadata for MessagesUIPluginModel.WatchAutosendButtonsSnippetModelCodingKeys;
}

ValueMetadata *type metadata accessor for MessagesUIPluginModel.MessageDraftSnippetModelCodingKeys()
{
  return &type metadata for MessagesUIPluginModel.MessageDraftSnippetModelCodingKeys;
}

ValueMetadata *type metadata accessor for MessagesUIPluginModel.SentMessageSnippetModelCodingKeys()
{
  return &type metadata for MessagesUIPluginModel.SentMessageSnippetModelCodingKeys;
}

uint64_t _s18SiriMessagesCommon21MessagesUIPluginModelO34ConfirmationSnippetModelCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_246A736C0 + 4 * byte_246A7D7B5[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_246A736E0 + 4 * byte_246A7D7BA[v4]))();
}

_BYTE *sub_246A736C0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_246A736E0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_246A736E8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_246A736F0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_246A736F8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_246A73700(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for MessagesUIPluginModel.AppDisambiguationSnippetModelCodingKeys()
{
  return &type metadata for MessagesUIPluginModel.AppDisambiguationSnippetModelCodingKeys;
}

unint64_t sub_246A73720()
{
  unint64_t result;

  result = qword_257618A00;
  if (!qword_257618A00)
  {
    result = MEMORY[0x249563B60](&unk_246A7DA18, &type metadata for MessagesUIPluginModel.AppDisambiguationSnippetModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618A00);
  }
  return result;
}

unint64_t sub_246A73760()
{
  unint64_t result;

  result = qword_257618A08;
  if (!qword_257618A08)
  {
    result = MEMORY[0x249563B60](&unk_246A7DAD0, &type metadata for MessagesUIPluginModel.SentMessageSnippetModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618A08);
  }
  return result;
}

unint64_t sub_246A737A0()
{
  unint64_t result;

  result = qword_257618A10;
  if (!qword_257618A10)
  {
    result = MEMORY[0x249563B60](&unk_246A7DB88, &type metadata for MessagesUIPluginModel.MessageDraftSnippetModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618A10);
  }
  return result;
}

unint64_t sub_246A737E0()
{
  unint64_t result;

  result = qword_257618A18;
  if (!qword_257618A18)
  {
    result = MEMORY[0x249563B60](&unk_246A7DC40, &type metadata for MessagesUIPluginModel.WatchAutosendButtonsSnippetModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618A18);
  }
  return result;
}

unint64_t sub_246A73820()
{
  unint64_t result;

  result = qword_257618A20;
  if (!qword_257618A20)
  {
    result = MEMORY[0x249563B60](&unk_246A7DCF8, &type metadata for MessagesUIPluginModel.ConfirmationSnippetModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618A20);
  }
  return result;
}

unint64_t sub_246A73860()
{
  unint64_t result;

  result = qword_257618A28;
  if (!qword_257618A28)
  {
    result = MEMORY[0x249563B60](&unk_246A7DDB0, &type metadata for MessagesUIPluginModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618A28);
  }
  return result;
}

unint64_t sub_246A738A0()
{
  unint64_t result;

  result = qword_257618A30;
  if (!qword_257618A30)
  {
    result = MEMORY[0x249563B60](&unk_246A7DC68, &type metadata for MessagesUIPluginModel.ConfirmationSnippetModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618A30);
  }
  return result;
}

unint64_t sub_246A738E0()
{
  unint64_t result;

  result = qword_257618A38;
  if (!qword_257618A38)
  {
    result = MEMORY[0x249563B60](&unk_246A7DC90, &type metadata for MessagesUIPluginModel.ConfirmationSnippetModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618A38);
  }
  return result;
}

unint64_t sub_246A73920()
{
  unint64_t result;

  result = qword_257618A40;
  if (!qword_257618A40)
  {
    result = MEMORY[0x249563B60](&unk_246A7DBB0, &type metadata for MessagesUIPluginModel.WatchAutosendButtonsSnippetModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618A40);
  }
  return result;
}

unint64_t sub_246A73960()
{
  unint64_t result;

  result = qword_257618A48;
  if (!qword_257618A48)
  {
    result = MEMORY[0x249563B60](&unk_246A7DBD8, &type metadata for MessagesUIPluginModel.WatchAutosendButtonsSnippetModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618A48);
  }
  return result;
}

unint64_t sub_246A739A0()
{
  unint64_t result;

  result = qword_257618A50;
  if (!qword_257618A50)
  {
    result = MEMORY[0x249563B60](&unk_246A7DAF8, &type metadata for MessagesUIPluginModel.MessageDraftSnippetModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618A50);
  }
  return result;
}

unint64_t sub_246A739E0()
{
  unint64_t result;

  result = qword_257618A58;
  if (!qword_257618A58)
  {
    result = MEMORY[0x249563B60](&unk_246A7DB20, &type metadata for MessagesUIPluginModel.MessageDraftSnippetModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618A58);
  }
  return result;
}

unint64_t sub_246A73A20()
{
  unint64_t result;

  result = qword_257618A60;
  if (!qword_257618A60)
  {
    result = MEMORY[0x249563B60](&unk_246A7DA40, &type metadata for MessagesUIPluginModel.SentMessageSnippetModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618A60);
  }
  return result;
}

unint64_t sub_246A73A60()
{
  unint64_t result;

  result = qword_257618A68;
  if (!qword_257618A68)
  {
    result = MEMORY[0x249563B60](&unk_246A7DA68, &type metadata for MessagesUIPluginModel.SentMessageSnippetModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618A68);
  }
  return result;
}

unint64_t sub_246A73AA0()
{
  unint64_t result;

  result = qword_257618A70;
  if (!qword_257618A70)
  {
    result = MEMORY[0x249563B60](&unk_246A7D988, &type metadata for MessagesUIPluginModel.AppDisambiguationSnippetModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618A70);
  }
  return result;
}

unint64_t sub_246A73AE0()
{
  unint64_t result;

  result = qword_257618A78;
  if (!qword_257618A78)
  {
    result = MEMORY[0x249563B60](&unk_246A7D9B0, &type metadata for MessagesUIPluginModel.AppDisambiguationSnippetModelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618A78);
  }
  return result;
}

unint64_t sub_246A73B20()
{
  unint64_t result;

  result = qword_257618A80;
  if (!qword_257618A80)
  {
    result = MEMORY[0x249563B60](&unk_246A7DD20, &type metadata for MessagesUIPluginModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618A80);
  }
  return result;
}

unint64_t sub_246A73B60()
{
  unint64_t result;

  result = qword_257618A88;
  if (!qword_257618A88)
  {
    result = MEMORY[0x249563B60](&unk_246A7DD48, &type metadata for MessagesUIPluginModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618A88);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_20@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_3_18()
{
  return sub_246A78310();
}

uint64_t OUTLINED_FUNCTION_4_13()
{
  return sub_246A78388();
}

uint64_t OUTLINED_FUNCTION_6_16()
{
  return sub_246A78364();
}

uint64_t OUTLINED_FUNCTION_8_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 144) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_9_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 224) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_11_9@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 256) + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_12_9()
{
  return sub_246A783D0();
}

uint64_t OUTLINED_FUNCTION_13_9()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_14_7()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_15_10()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_16_7(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  sub_246A4B7F0(a1, v3, a3);
}

unint64_t OUTLINED_FUNCTION_17_6()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 112) = 4;
  return sub_246A70D9C();
}

unint64_t OUTLINED_FUNCTION_19_5()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 112) = 1;
  return sub_246A70E50();
}

void OUTLINED_FUNCTION_20_4(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_246A4B53C(a1, a2, v2);
}

unint64_t OUTLINED_FUNCTION_21_2()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 112) = 3;
  return sub_246A70DD8();
}

uint64_t OUTLINED_FUNCTION_22_4()
{
  uint64_t v0;

  return v0;
}

unint64_t OUTLINED_FUNCTION_25_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 112) = 2;
  return sub_246A70E14();
}

void LinkAttachment.init(url:isDraft:)(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6;

  v6 = OUTLINED_FUNCTION_2_2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a3, a1, v6);
  *(_BYTE *)(a3 + *(int *)(OUTLINED_FUNCTION_4_14() + 20)) = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t type metadata accessor for LinkAttachment()
{
  uint64_t result;

  result = qword_257618B00;
  if (!qword_257618B00)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t LinkAttachment.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_2_2();
  return OUTLINED_FUNCTION_3_3(a1, v1, v3, *(uint64_t (**)(void))(*(_QWORD *)(v3 - 8) + 16));
}

uint64_t LinkAttachment.url.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_2_2();
  return OUTLINED_FUNCTION_3_3(v1, a1, v3, *(uint64_t (**)(void))(*(_QWORD *)(v3 - 8) + 40));
}

uint64_t (*LinkAttachment.url.modify())()
{
  return nullsub_1;
}

uint64_t LinkAttachment.isDraft.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(OUTLINED_FUNCTION_4_14() + 20));
}

uint64_t LinkAttachment.isDraft.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = OUTLINED_FUNCTION_4_14();
  *(_BYTE *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*LinkAttachment.isDraft.modify())()
{
  OUTLINED_FUNCTION_4_14();
  return nullsub_1;
}

uint64_t sub_246A73E0C()
{
  sub_246A73FA4();
  return sub_246A784D8();
}

uint64_t sub_246A73E34()
{
  sub_246A73FA4();
  return sub_246A784E4();
}

uint64_t LinkAttachment.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618A90);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_15_0();
  v7 = v6 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A73FA4();
  sub_246A784CC();
  sub_246A77F5C();
  sub_246A4FEA4(&qword_2576179C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAE0]);
  sub_246A783D0();
  if (!v1)
  {
    type metadata accessor for LinkAttachment();
    sub_246A783B8();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_246A73FA4()
{
  unint64_t result;

  result = qword_257618A98;
  if (!qword_257618A98)
  {
    result = MEMORY[0x249563B60](&unk_246A7E164, &type metadata for LinkAttachment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618A98);
  }
  return result;
}

uint64_t LinkAttachment.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v15 = sub_246A77F5C();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_15_0();
  v13 = v5 - v4;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618AA0);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_15_0();
  v6 = type metadata accessor for LinkAttachment();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_15_0();
  v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A73FA4();
  sub_246A784B4();
  if (v2)
    return OUTLINED_FUNCTION_6_4();
  sub_246A4FEA4(&qword_2576179D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB10]);
  sub_246A78364();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v9, v13, v15);
  v10 = sub_246A7834C();
  OUTLINED_FUNCTION_0_4();
  *(_BYTE *)(v9 + *(int *)(v6 + 20)) = v10 & 1;
  sub_246A74204(v9, a2);
  OUTLINED_FUNCTION_6_4();
  return sub_246A74248(v9);
}

uint64_t sub_246A74204(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LinkAttachment();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246A74248(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for LinkAttachment();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_246A7428C(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 16) = sub_246A4FEA4(&qword_2576175B8, (uint64_t (*)(uint64_t))type metadata accessor for LinkAttachment, (uint64_t)&protocol conformance descriptor for LinkAttachment);
  result = sub_246A4FEA4(&qword_257617568, (uint64_t (*)(uint64_t))type metadata accessor for LinkAttachment, (uint64_t)&protocol conformance descriptor for LinkAttachment);
  *(_QWORD *)(a1 + 24) = result;
  return result;
}

uint64_t sub_246A742E8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return LinkAttachment.init(from:)(a1, a2);
}

uint64_t sub_246A742FC(_QWORD *a1)
{
  return LinkAttachment.encode(to:)(a1);
}

uint64_t getEnumTagSinglePayload for LinkAttachment()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246A7431C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unsigned int v8;

  v6 = OUTLINED_FUNCTION_2_2();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v8 >= 2)
    return ((v8 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for LinkAttachment()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_246A743AC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;

  v8 = OUTLINED_FUNCTION_2_2();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
    OUTLINED_FUNCTION_1();
  }
}

uint64_t sub_246A74414()
{
  uint64_t result;
  unint64_t v1;

  result = sub_246A77F5C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for LinkAttachment.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A744D0 + 4 * byte_246A7DFC5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_246A74504 + 4 * byte_246A7DFC0[v4]))();
}

uint64_t sub_246A74504(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A7450C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A74514);
  return result;
}

uint64_t sub_246A74520(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A74528);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_246A7452C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A74534(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LinkAttachment.CodingKeys()
{
  return &type metadata for LinkAttachment.CodingKeys;
}

unint64_t sub_246A74554()
{
  unint64_t result;

  result = qword_257618B38;
  if (!qword_257618B38)
  {
    result = MEMORY[0x249563B60](&unk_246A7E13C, &type metadata for LinkAttachment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618B38);
  }
  return result;
}

unint64_t sub_246A74594()
{
  unint64_t result;

  result = qword_257618B40;
  if (!qword_257618B40)
  {
    result = MEMORY[0x249563B60](&unk_246A7E0AC, &type metadata for LinkAttachment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618B40);
  }
  return result;
}

unint64_t sub_246A745D4()
{
  unint64_t result;

  result = qword_257618B48;
  if (!qword_257618B48)
  {
    result = MEMORY[0x249563B60](&unk_246A7E0D4, &type metadata for LinkAttachment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618B48);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4_14()
{
  return type metadata accessor for LinkAttachment();
}

uint64_t dispatch thunk of CATSerializable.serializedData()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t RecipientLabel.init(contactName:appBundleIdentifiers:launchAppWithIntent:selectedAppIdentifier:unlockDevice:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _QWORD *a8@<X8>)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (qword_2576171F0 != -1)
    swift_once();
  swift_beginAccess();
  v16 = qword_257617EA8;
  v15 = qword_257617EB0;
  v17 = qword_257617EB8;
  v18 = qword_257617EC0;
  v19 = qword_257617E48;
  v20 = qword_257617E50;
  v21 = qword_257617E68;
  v22 = qword_257617E70;
  *a8 = a1;
  a8[1] = a2;
  a8[2] = a3;
  a8[3] = a4;
  a8[4] = a5;
  a8[5] = a6;
  a8[6] = a7;
  a8[7] = v16;
  a8[8] = v15;
  a8[9] = v17;
  a8[10] = v18;
  a8[11] = v19;
  a8[12] = v20;
  a8[13] = v21;
  a8[14] = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_5_4();
  return swift_bridgeObjectRetain();
}

void RecipientLabel.launchAppWithIntent.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  OUTLINED_FUNCTION_9();
}

void RecipientLabel.unlockDevice.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 48) = a1;
  OUTLINED_FUNCTION_9();
}

void RecipientLabel.contactName.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_9();
}

void RecipientLabel.contactName.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  OUTLINED_FUNCTION_14_8();
  swift_bridgeObjectRelease();
  *v1 = v2;
  v1[1] = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*RecipientLabel.contactName.modify())()
{
  return nullsub_1;
}

uint64_t RecipientLabel.appBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

void RecipientLabel.appBundleIdentifiers.setter(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  OUTLINED_FUNCTION_9();
}

uint64_t (*RecipientLabel.appBundleIdentifiers.modify())()
{
  return nullsub_1;
}

void RecipientLabel.launchAppWithIntent.getter()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 24);
  OUTLINED_FUNCTION_9();
}

void sub_246A7481C(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  RecipientLabel.launchAppWithIntent.setter((uint64_t)v1);
}

void RecipientLabel.launchAppWithIntent.modify(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + 24);
  *a1 = v2;
  a1[1] = v1;
  v3 = v2;
  OUTLINED_FUNCTION_9();
}

void RecipientLabel.selectedAppIdentifier.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_9();
}

void RecipientLabel.selectedAppIdentifier.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_14_8();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*RecipientLabel.selectedAppIdentifier.modify())()
{
  return nullsub_1;
}

void RecipientLabel.unlockDevice.getter()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 48);
  OUTLINED_FUNCTION_9();
}

uint64_t sub_246A748F4@<X0>(uint64_t (*a1)(void)@<X3>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

void sub_246A74960(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  RecipientLabel.unlockDevice.setter((uint64_t)v1);
}

void RecipientLabel.unlockDevice.modify(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + 48);
  *a1 = v2;
  a1[1] = v1;
  v3 = v2;
  OUTLINED_FUNCTION_9();
}

void sub_246A749C0(uint64_t a1, char a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)a1;
  v2 = *(_QWORD *)(a1 + 8);
  v4 = *(void **)(v2 + 48);
  if ((a2 & 1) != 0)
  {
    v5 = v3;

    *(_QWORD *)(v2 + 48) = v3;
    OUTLINED_FUNCTION_3(v5);
  }
  else
  {

    *(_QWORD *)(v2 + 48) = v3;
    OUTLINED_FUNCTION_8();
  }
}

void RecipientLabel.toLabelText.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_9();
}

void RecipientLabel.toLabelText.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_14_8();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 56) = v2;
  *(_QWORD *)(v1 + 64) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*RecipientLabel.toLabelText.modify())()
{
  return nullsub_1;
}

void RecipientLabel.changeContactLabelText.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_9();
}

void RecipientLabel.changeContactLabelText.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_14_8();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 72) = v2;
  *(_QWORD *)(v1 + 80) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*RecipientLabel.changeContactLabelText.modify())()
{
  return nullsub_1;
}

void RecipientLabel.cancelButtonText.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_9();
}

void RecipientLabel.cancelButtonText.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_14_8();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 88) = v2;
  *(_QWORD *)(v1 + 96) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*RecipientLabel.cancelButtonText.modify())()
{
  return nullsub_1;
}

void RecipientLabel.doneButtonText.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_9();
}

void RecipientLabel.doneButtonText.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_14_8();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 104) = v2;
  *(_QWORD *)(v1 + 112) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*RecipientLabel.doneButtonText.modify())()
{
  return nullsub_1;
}

uint64_t sub_246A74B6C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  char v9;

  v3 = a1 == 0x4E746361746E6F63 && a2 == 0xEB00000000656D61;
  if (v3 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000246A7F520 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000246A7F070 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x8000000246A7F7F0 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = a1 == 0x65446B636F6C6E75 && a2 == 0xEC00000065636976;
    if (v6 || (sub_246A78400() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 4;
    }
    else
    {
      v7 = a1 == 0x546C6562614C6F74 && a2 == 0xEB00000000747865;
      if (v7 || (sub_246A78400() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 5;
      }
      else if (a1 == 0xD000000000000016 && a2 == 0x8000000246A7F810 || (sub_246A78400() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 6;
      }
      else if (a1 == 0xD000000000000010 && a2 == 0x8000000246A7F830 || (sub_246A78400() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 7;
      }
      else if (a1 == 0x74747542656E6F64 && a2 == 0xEE00747865546E6FLL)
      {
        swift_bridgeObjectRelease();
        return 8;
      }
      else
      {
        v9 = sub_246A78400();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return 8;
        else
          return 9;
      }
    }
  }
}

uint64_t sub_246A74F08()
{
  return 9;
}

uint64_t sub_246A74F10(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_246A74F4C + 4 * byte_246A7E1E0[a1]))(0xD000000000000014, 0x8000000246A7F520);
}

uint64_t sub_246A74F4C()
{
  return 0x4E746361746E6F63;
}

uint64_t sub_246A74F6C()
{
  uint64_t v0;

  return v0 + 3;
}

unint64_t sub_246A74FE4()
{
  return 0xD000000000000010;
}

uint64_t sub_246A75000()
{
  return 0x74747542656E6F64;
}

uint64_t sub_246A75024()
{
  unsigned __int8 *v0;

  return sub_246A74F10(*v0);
}

uint64_t sub_246A7502C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A74B6C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A75050@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_246A74F08();
  *a1 = result;
  return result;
}

uint64_t sub_246A75074()
{
  sub_246A75364();
  return sub_246A784D8();
}

uint64_t sub_246A7509C()
{
  sub_246A75364();
  return sub_246A784E4();
}

void RecipientLabel.encode(to:)(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[9];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618B50);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = v1[2];
  v20 = v1[3];
  v21 = v7;
  v8 = v1[4];
  v18 = v1[5];
  v19 = v8;
  v9 = v1[6];
  v10 = v1[7];
  v16[8] = v1[8];
  v17 = v9;
  v11 = v1[9];
  v16[6] = v1[10];
  v16[7] = v10;
  v12 = v1[11];
  v16[4] = v1[12];
  v16[5] = v11;
  v16[2] = v1[13];
  v16[3] = v12;
  v16[1] = v1[14];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A75364();
  sub_246A784CC();
  LOBYTE(v24) = 0;
  v13 = v22;
  sub_246A783AC();
  if (!v13)
  {
    v14 = v20;
    v15 = v17;
    v24 = v21;
    v23 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257618020);
    sub_246A6CAF0(&qword_257618028, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    sub_246A783D0();
    v24 = v14;
    v23 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257617C00);
    sub_246A75970(&qword_257617C08, &qword_257617C00, (uint64_t)&protocol conformance descriptor for ModelCodable<A>);
    OUTLINED_FUNCTION_10_10();
    OUTLINED_FUNCTION_19_6(3);
    OUTLINED_FUNCTION_6_17();
    v24 = v15;
    v23 = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257618B60);
    sub_246A75970(&qword_257618B68, &qword_257618B60, (uint64_t)&protocol conformance descriptor for ModelCodable<A>);
    OUTLINED_FUNCTION_10_10();
    OUTLINED_FUNCTION_19_6(5);
    OUTLINED_FUNCTION_6_17();
    OUTLINED_FUNCTION_19_6(6);
    OUTLINED_FUNCTION_6_17();
    OUTLINED_FUNCTION_19_6(7);
    OUTLINED_FUNCTION_6_17();
    OUTLINED_FUNCTION_19_6(8);
    OUTLINED_FUNCTION_6_17();
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  OUTLINED_FUNCTION_8_1();
}

unint64_t sub_246A75364()
{
  unint64_t result;

  result = qword_257618B58;
  if (!qword_257618B58)
  {
    result = MEMORY[0x249563B60](&unk_246A7E358, &type metadata for RecipientLabel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618B58);
  }
  return result;
}

void RecipientLabel.init(from:)(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
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
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  char v57;
  void *v58;

  v49 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618B70);
  v50 = *(_QWORD *)(v4 - 8);
  v51 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2576171F0 != -1)
    swift_once();
  swift_beginAccess();
  v7 = qword_257617EB0;
  v8 = qword_257617EC0;
  v9 = qword_257617E50;
  v10 = qword_257617E70;
  v11 = a1[3];
  v56 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v11);
  sub_246A75364();
  v55 = v7;
  swift_bridgeObjectRetain();
  v52 = v8;
  swift_bridgeObjectRetain();
  v53 = v9;
  swift_bridgeObjectRetain();
  v54 = v10;
  swift_bridgeObjectRetain();
  sub_246A784B4();
  if (v2)
  {
    v12 = 500;
    v13 = (uint64_t)v56;
  }
  else
  {
    LOBYTE(v58) = 0;
    v14 = OUTLINED_FUNCTION_22_5();
    v13 = (uint64_t)v56;
    v15 = v14;
    v17 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257618020);
    v57 = 1;
    v18 = sub_246A6CAF0(&qword_257618038, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_8_13();
    v48 = v17;
    if (v18)
    {
      OUTLINED_FUNCTION_5_8((uint64_t)v6, *(uint64_t (**)(uint64_t, uint64_t))(v50 + 8));
      OUTLINED_FUNCTION_10_4();
      v12 = 501;
    }
    else
    {
      v19 = (uint64_t)v58;
      __swift_instantiateConcreteTypeFromMangledName(&qword_257617C00);
      v57 = 2;
      sub_246A75970(&qword_257617C18, &qword_257617C00, (uint64_t)&protocol conformance descriptor for ModelCodable<A>);
      v21 = v20;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_8_13();
      if (!v21)
      {
        v45 = v15;
        v46 = v19;
        v22 = v58;
        LOBYTE(v58) = 3;
        v23 = v22;
        v24 = OUTLINED_FUNCTION_22_5();
        v47 = v25;
        v43 = v24;
        v44 = v23;
        __swift_instantiateConcreteTypeFromMangledName(&qword_257618B60);
        v57 = 4;
        sub_246A75970(&qword_257618B78, &qword_257618B60, (uint64_t)&protocol conformance descriptor for ModelCodable<A>);
        swift_bridgeObjectRetain();
        sub_246A78364();
        v26 = v58;
        LOBYTE(v58) = 5;
        v27 = v26;
        v42 = OUTLINED_FUNCTION_1_18();
        OUTLINED_FUNCTION_25_1();
        swift_bridgeObjectRelease();
        LOBYTE(v58) = 6;
        v41 = OUTLINED_FUNCTION_1_18();
        v55 = v17;
        OUTLINED_FUNCTION_25_1();
        swift_bridgeObjectRelease();
        LOBYTE(v58) = 7;
        v40 = OUTLINED_FUNCTION_1_18();
        v52 = v28;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        LOBYTE(v58) = 8;
        v53 = OUTLINED_FUNCTION_1_18();
        v30 = v29;
        OUTLINED_FUNCTION_0_18();
        OUTLINED_FUNCTION_5_4();
        swift_bridgeObjectRelease();
        v32 = v48;
        v31 = v49;
        v33 = v46;
        *v49 = v45;
        v31[1] = v32;
        v31[2] = v33;
        v31[3] = (uint64_t)v22;
        v34 = v47;
        v31[4] = v43;
        v31[5] = v34;
        v35 = v42;
        v31[6] = (uint64_t)v26;
        v31[7] = v35;
        v36 = (uint64_t)v56;
        v37 = v41;
        v31[8] = v55;
        v31[9] = v37;
        v38 = v40;
        v31[10] = v17;
        v31[11] = v38;
        v39 = v53;
        v31[12] = v52;
        v31[13] = v39;
        v31[14] = v30;
        __swift_destroy_boxed_opaque_existential_1(v36);
        OUTLINED_FUNCTION_2_9();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_10_4();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_13_10();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_16;
      }
      OUTLINED_FUNCTION_5_8((uint64_t)v6, *(uint64_t (**)(uint64_t, uint64_t))(v50 + 8));
      OUTLINED_FUNCTION_10_4();
      OUTLINED_FUNCTION_21_3();
      v12 = 503;
    }
  }
  __swift_destroy_boxed_opaque_existential_1(v13);
  if ((v12 & 1) != 0)
  {
    OUTLINED_FUNCTION_20_5();
    if (((v12 >> 1) & 1) == 0)
    {

      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if ((v12 & 2) != 0)
  {
LABEL_13:
    swift_bridgeObjectRelease();

  }
LABEL_15:
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_21_3();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10_4();

LABEL_16:
  OUTLINED_FUNCTION_8_1();
}

void sub_246A75970(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x249563B60](a3, v5), a1);
  }
  OUTLINED_FUNCTION_9();
}

void sub_246A759AC(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  RecipientLabel.init(from:)(a1, a2);
}

void sub_246A759C0(_QWORD *a1)
{
  RecipientLabel.encode(to:)(a1);
}

uint64_t sub_246A759D4@<X0>(uint64_t *a1@<X8>)
{
  return sub_246A748F4((uint64_t (*)(void))RecipientLabel.launchAppWithIntent.getter, a1);
}

uint64_t sub_246A759F4@<X0>(uint64_t *a1@<X8>)
{
  return sub_246A748F4((uint64_t (*)(void))RecipientLabel.unlockDevice.getter, a1);
}

uint64_t destroy for RecipientLabel(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for RecipientLabel(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = (void *)a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v7 = (void *)a2[6];
  v6 = a2[7];
  a1[6] = v7;
  a1[7] = v6;
  v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  v10 = a2[13];
  a1[12] = a2[12];
  a1[13] = v10;
  a1[14] = a2[14];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = v4;
  swift_bridgeObjectRetain();
  v12 = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for RecipientLabel(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a1[3];
  v5 = (void *)a2[3];
  a1[3] = v5;
  v6 = v5;

  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = (void *)a1[6];
  v8 = (void *)a2[6];
  a1[6] = v8;
  v9 = v8;

  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[11] = a2[11];
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[13] = a2[13];
  a1[14] = a2[14];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy120_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x78uLL);
}

uint64_t assignWithTake for RecipientLabel(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);

  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v9;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RecipientLabel(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 120))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for RecipientLabel(uint64_t result, int a2, int a3)
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
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 120) = 1;
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
    *(_BYTE *)(result + 120) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for RecipientLabel()
{
  return &type metadata for RecipientLabel;
}

uint64_t getEnumTagSinglePayload for RecipientLabel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xF8)
  {
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
    v5 = (*a1 | (v4 << 8)) - 9;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v5 = v6 - 9;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for RecipientLabel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A75E98 + 4 * byte_246A7E1EE[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_246A75ECC + 4 * byte_246A7E1E9[v4]))();
}

uint64_t sub_246A75ECC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A75ED4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A75EDCLL);
  return result;
}

uint64_t sub_246A75EE8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A75EF0);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_246A75EF4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A75EFC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RecipientLabel.CodingKeys()
{
  return &type metadata for RecipientLabel.CodingKeys;
}

unint64_t sub_246A75F1C()
{
  unint64_t result;

  result = qword_257618B80;
  if (!qword_257618B80)
  {
    result = MEMORY[0x249563B60](&unk_246A7E330, &type metadata for RecipientLabel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618B80);
  }
  return result;
}

unint64_t sub_246A75F5C()
{
  unint64_t result;

  result = qword_257618B88;
  if (!qword_257618B88)
  {
    result = MEMORY[0x249563B60](&unk_246A7E2A0, &type metadata for RecipientLabel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618B88);
  }
  return result;
}

unint64_t sub_246A75F9C()
{
  unint64_t result;

  result = qword_257618B90;
  if (!qword_257618B90)
  {
    result = MEMORY[0x249563B60](&unk_246A7E2C8, &type metadata for RecipientLabel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618B90);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 176) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_1_18()
{
  return sub_246A78340();
}

uint64_t OUTLINED_FUNCTION_3_19()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_5_8@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_6_17()
{
  return sub_246A783AC();
}

uint64_t OUTLINED_FUNCTION_8_13()
{
  return sub_246A78364();
}

uint64_t OUTLINED_FUNCTION_10_10()
{
  return sub_246A783D0();
}

void OUTLINED_FUNCTION_13_10()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_16_8()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_19_6(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 72) = a1;
}

uint64_t OUTLINED_FUNCTION_20_5()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_21_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_22_5()
{
  return sub_246A78340();
}

uint64_t OUTLINED_FUNCTION_25_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t AutoSendableBinaryButton.init(shouldAutoSend:autoSendTimeout:delayedActionCancelCommand:handleIntent:speechSynthesisId:isFirstPartyApp:responseMode:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X8>, double a9@<D0>)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (qword_2576171F0 != -1)
    swift_once();
  swift_beginAccess();
  v17 = qword_257617E30;
  *(_QWORD *)(a8 + 48) = qword_257617E28;
  *(_QWORD *)(a8 + 56) = v17;
  v18 = qword_257617E50;
  *(_QWORD *)(a8 + 64) = qword_257617E48;
  *(_QWORD *)(a8 + 72) = v18;
  v19 = a8 + *(int *)(OUTLINED_FUNCTION_10_11() + 48);
  v20 = sub_246A78094();
  __swift_storeEnumTagSinglePayload(v19, 1, 1, v20);
  *(_BYTE *)a8 = a1 & 1;
  *(double *)(a8 + 8) = a9;
  *(_QWORD *)(a8 + 16) = a2;
  *(_QWORD *)(a8 + 24) = a3;
  *(_QWORD *)(a8 + 32) = a4;
  *(_QWORD *)(a8 + 40) = a5;
  *(_BYTE *)(a8 + 80) = a6 & 1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_246A465F4(a7, v19);
}

uint64_t type metadata accessor for AutoSendableBinaryButton()
{
  uint64_t result;

  result = qword_257618C10;
  if (!qword_257618C10)
    return swift_getSingletonMetadata();
  return result;
}

void AutoSendableBinaryButton.delayedActionCancelCommand.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  OUTLINED_FUNCTION_9();
}

void AutoSendableBinaryButton.handleIntent.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  OUTLINED_FUNCTION_9();
}

uint64_t AutoSendableBinaryButton.shouldAutoSend.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t AutoSendableBinaryButton.shouldAutoSend.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*AutoSendableBinaryButton.shouldAutoSend.modify())()
{
  return nullsub_1;
}

double AutoSendableBinaryButton.autoSendTimeout.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

void AutoSendableBinaryButton.autoSendTimeout.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 8) = a1;
}

uint64_t (*AutoSendableBinaryButton.autoSendTimeout.modify())()
{
  return nullsub_1;
}

void AutoSendableBinaryButton.delayedActionCancelCommand.getter()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 16);
  OUTLINED_FUNCTION_9();
}

void sub_246A762AC(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  AutoSendableBinaryButton.delayedActionCancelCommand.setter((uint64_t)v1);
}

void AutoSendableBinaryButton.delayedActionCancelCommand.modify(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + 16);
  *a1 = v2;
  a1[1] = v1;
  v3 = v2;
  OUTLINED_FUNCTION_9();
}

void AutoSendableBinaryButton.handleIntent.getter()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 24);
  OUTLINED_FUNCTION_9();
}

void sub_246A7632C(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  AutoSendableBinaryButton.handleIntent.setter((uint64_t)v1);
}

void AutoSendableBinaryButton.handleIntent.modify(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + 24);
  *a1 = v2;
  a1[1] = v1;
  v3 = v2;
  OUTLINED_FUNCTION_9();
}

void AutoSendableBinaryButton.speechSynthesisId.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_9();
}

void AutoSendableBinaryButton.speechSynthesisId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t (*AutoSendableBinaryButton.speechSynthesisId.modify())()
{
  return nullsub_1;
}

void AutoSendableBinaryButton.sendLabelText.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_9();
}

void AutoSendableBinaryButton.sendLabelText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t (*AutoSendableBinaryButton.sendLabelText.modify())()
{
  return nullsub_1;
}

void AutoSendableBinaryButton.cancelLabelText.getter()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_9();
}

void AutoSendableBinaryButton.cancelLabelText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 64) = a1;
  *(_QWORD *)(v2 + 72) = a2;
  OUTLINED_FUNCTION_1();
}

uint64_t (*AutoSendableBinaryButton.cancelLabelText.modify())()
{
  return nullsub_1;
}

uint64_t AutoSendableBinaryButton.isFirstPartyApp.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 80);
}

uint64_t AutoSendableBinaryButton.isFirstPartyApp.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 80) = result;
  return result;
}

uint64_t (*AutoSendableBinaryButton.isFirstPartyApp.modify())()
{
  return nullsub_1;
}

uint64_t AutoSendableBinaryButton.responseMode.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_10_11() + 48);
  return sub_246A4667C(v3, a1);
}

uint64_t AutoSendableBinaryButton.responseMode.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_10_11() + 48);
  return sub_246A465F4(a1, v3);
}

uint64_t (*AutoSendableBinaryButton.responseMode.modify())()
{
  OUTLINED_FUNCTION_10_11();
  return nullsub_1;
}

uint64_t AutoSendableBinaryButton.description.getter()
{
  sub_246A78298();
  sub_246A78178();
  sub_246A78178();
  swift_bridgeObjectRelease();
  sub_246A78178();
  swift_bridgeObjectRetain();
  sub_246A78178();
  swift_bridgeObjectRelease();
  sub_246A78178();
  return 0;
}

uint64_t sub_246A76658(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  char v12;

  v3 = a1 == 0x7541646C756F6873 && a2 == 0xEE00646E65536F74;
  if (v3 || (sub_246A78400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x646E65536F747561 && a2 == 0xEF74756F656D6954;
    if (v6 || (sub_246A78400() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD00000000000001ALL && a2 == 0x8000000246A7EBC0 || (sub_246A78400() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v7 = a1 == 0x6E49656C646E6168 && a2 == 0xEC000000746E6574;
      if (v7 || (sub_246A78400() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0xD000000000000011 && a2 == 0x8000000246A7EBE0 || (sub_246A78400() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        v8 = a1 == 0x6562614C646E6573 && a2 == 0xED0000747865546CLL;
        if (v8 || (sub_246A78400() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          v9 = a1 == 0x614C6C65636E6163 && a2 == 0xEF747865546C6562;
          if (v9 || (sub_246A78400() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else
          {
            v10 = a1 == 0x5074737269467369 && a2 == 0xEF70704179747261;
            if (v10 || (sub_246A78400() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 7;
            }
            else if (a1 == 0x65736E6F70736572 && a2 == 0xEC00000065646F4DLL)
            {
              swift_bridgeObjectRelease();
              return 8;
            }
            else
            {
              v12 = sub_246A78400();
              swift_bridgeObjectRelease();
              if ((v12 & 1) != 0)
                return 8;
              else
                return 9;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_246A76A48(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_246A76A84 + 4 * byte_246A7E3B0[a1]))(0xD00000000000001ALL, 0x8000000246A7EBC0);
}

uint64_t sub_246A76A84()
{
  return 0x7541646C756F6873;
}

uint64_t sub_246A76AA8()
{
  return 0x646E65536F747561;
}

uint64_t sub_246A76ACC()
{
  return 0x6E49656C646E6168;
}

unint64_t sub_246A76AEC()
{
  return 0xD000000000000011;
}

uint64_t sub_246A76B08()
{
  return 0x6562614C646E6573;
}

uint64_t sub_246A76B2C()
{
  return 0x614C6C65636E6163;
}

uint64_t sub_246A76B50()
{
  return 0x5074737269467369;
}

uint64_t sub_246A76B74()
{
  return 0x65736E6F70736572;
}

uint64_t sub_246A76B94()
{
  unsigned __int8 *v0;

  return sub_246A76A48(*v0);
}

uint64_t sub_246A76B9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246A76658(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246A76BC0()
{
  sub_246A76E54();
  return sub_246A784D8();
}

uint64_t sub_246A76BE8()
{
  sub_246A76E54();
  return sub_246A784E4();
}

uint64_t AutoSendableBinaryButton.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618B98);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_12();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246A76E54();
  sub_246A784CC();
  OUTLINED_FUNCTION_6();
  if (!v1)
  {
    sub_246A783C4();
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_7(&qword_257617238);
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_7(&qword_257617248);
    OUTLINED_FUNCTION_2();
    sub_246A78394();
    OUTLINED_FUNCTION_4_15(5);
    OUTLINED_FUNCTION_4_15(6);
    OUTLINED_FUNCTION_6();
    type metadata accessor for AutoSendableBinaryButton();
    sub_246A78094();
    sub_246A46910(&qword_257617250, (void (*)(uint64_t))MEMORY[0x24BEA8AE8]);
    sub_246A783A0();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
}

unint64_t sub_246A76E54()
{
  unint64_t result;

  result = qword_257618BA0;
  if (!qword_257618BA0)
  {
    result = MEMORY[0x249563B60](&unk_246A7E614, &type metadata for AutoSendableBinaryButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618BA0);
  }
  return result;
}

uint64_t AutoSendableBinaryButton.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  char v35;
  uint64_t v36;

  v28 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617218);
  MEMORY[0x24BDAC7A8](v4);
  v29 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257618BA8);
  v30 = *(_QWORD *)(v6 - 8);
  v31 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v7 = type metadata accessor for AutoSendableBinaryButton();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_12();
  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  if (qword_2576171F0 != -1)
    swift_once();
  swift_beginAccess();
  v8 = qword_257617E30;
  *(_QWORD *)(v2 + 48) = qword_257617E28;
  *(_QWORD *)(v2 + 56) = v8;
  v9 = qword_257617E50;
  *(_QWORD *)(v2 + 64) = qword_257617E48;
  *(_QWORD *)(v2 + 72) = v9;
  v10 = v2 + *(int *)(v7 + 48);
  v11 = sub_246A78094();
  v32 = v10;
  __swift_storeEnumTagSinglePayload(v10, 1, 1, v11);
  v12 = a1[3];
  v34 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_246A76E54();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13 = v33;
  sub_246A784B4();
  if (v13)
  {
    v15 = v32;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_246A46788(v15);
  }
  else
  {
    v33 = v8;
    v27 = v9;
    LOBYTE(v36) = 0;
    v14 = v31;
    *(_BYTE *)v2 = sub_246A7834C() & 1;
    LOBYTE(v36) = 1;
    sub_246A78358();
    *(_QWORD *)(v2 + 8) = v16;
    OUTLINED_FUNCTION_14();
    v35 = 2;
    OUTLINED_FUNCTION_7(&qword_257617260);
    OUTLINED_FUNCTION_0_19();
    *(_QWORD *)(v2 + 16) = v36;
    OUTLINED_FUNCTION_14();
    v35 = 3;
    OUTLINED_FUNCTION_7(&qword_257617268);
    OUTLINED_FUNCTION_0_19();
    *(_QWORD *)(v2 + 24) = v36;
    OUTLINED_FUNCTION_16_9(4);
    *(_QWORD *)(v2 + 32) = sub_246A78328();
    *(_QWORD *)(v2 + 40) = v17;
    v18 = OUTLINED_FUNCTION_5_9(5);
    v20 = v19;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v2 + 48) = v18;
    *(_QWORD *)(v2 + 56) = v20;
    v21 = OUTLINED_FUNCTION_5_9(6);
    v23 = v22;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v2 + 64) = v21;
    *(_QWORD *)(v2 + 72) = v23;
    OUTLINED_FUNCTION_16_9(7);
    *(_BYTE *)(v2 + 80) = sub_246A7834C() & 1;
    LOBYTE(v36) = 8;
    sub_246A46910(&qword_257617270, (void (*)(uint64_t))MEMORY[0x24BEA8AE8]);
    sub_246A78334();
    (*(void (**)(void *, uint64_t))(v30 + 8))(&unk_257617240, v14);
    v24 = OUTLINED_FUNCTION_16_1();
    sub_246A465F4(v24, v25);
    sub_246A772B4(v2, v28);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
    return sub_246A772F8(v2);
  }
}

uint64_t sub_246A772B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AutoSendableBinaryButton();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246A772F8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AutoSendableBinaryButton();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_246A77350(uint64_t a1)
{
  uint64_t v2;

  sub_246A46910(&qword_257618BB0, (void (*)(uint64_t))type metadata accessor for AutoSendableBinaryButton);
  *(_QWORD *)(a1 + 16) = v2;
}

void sub_246A77390()
{
  sub_246A46910(&qword_257618150, (void (*)(uint64_t))type metadata accessor for AutoSendableBinaryButton);
}

void sub_246A773BC()
{
  sub_246A46910(&qword_257618140, (void (*)(uint64_t))type metadata accessor for AutoSendableBinaryButton);
}

uint64_t sub_246A773E8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return AutoSendableBinaryButton.init(from:)(a1, a2);
}

uint64_t sub_246A773FC(_QWORD *a1)
{
  return AutoSendableBinaryButton.encode(to:)(a1);
}

void sub_246A77410(_QWORD *a1@<X8>)
{
  uint64_t v2;

  AutoSendableBinaryButton.delayedActionCancelCommand.getter();
  *a1 = v2;
  OUTLINED_FUNCTION_9();
}

void sub_246A77438(_QWORD *a1@<X8>)
{
  uint64_t v2;

  AutoSendableBinaryButton.handleIntent.getter();
  *a1 = v2;
  OUTLINED_FUNCTION_9();
}

_QWORD *initializeBufferWithCopyOfBuffer for AutoSendableBinaryButton(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v17 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v17 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v5 = (void *)a2[2];
    *(_QWORD *)(a1 + 8) = a2[1];
    *(_QWORD *)(a1 + 16) = v5;
    v7 = (void *)a2[3];
    v6 = a2[4];
    *(_QWORD *)(a1 + 24) = v7;
    *(_QWORD *)(a1 + 32) = v6;
    v8 = a2[6];
    *(_QWORD *)(a1 + 40) = a2[5];
    *(_QWORD *)(a1 + 48) = v8;
    v9 = a2[8];
    *(_QWORD *)(a1 + 56) = a2[7];
    *(_QWORD *)(a1 + 64) = v9;
    *(_QWORD *)(a1 + 72) = a2[9];
    v10 = *(int *)(a3 + 48);
    v11 = (char *)a2 + v10;
    v12 = (void *)(a1 + v10);
    *(_BYTE *)(a1 + 80) = *((_BYTE *)a2 + 80);
    v13 = sub_246A78094();
    v14 = v5;
    v15 = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v13))
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617218);
      memcpy(v12, v11, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v12, v11, v13);
      __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v13);
    }
  }
  return v3;
}

uint64_t destroy for AutoSendableBinaryButton(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 48);
  v5 = sub_246A78094();
  result = __swift_getEnumTagSinglePayload(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return result;
}

uint64_t initializeWithCopy for AutoSendableBinaryButton(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  v6 = *(void **)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v5;
  v7 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v7;
  v8 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v8;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  v9 = *(int *)(a3 + 48);
  v10 = (const void *)(a2 + v9);
  v11 = (void *)(a1 + v9);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v12 = sub_246A78094();
  v13 = v4;
  v14 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v12))
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617218);
    memcpy(v11, v10, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v11, v10, v12);
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v12);
  }
  return a1;
}

uint64_t assignWithCopy for AutoSendableBinaryButton(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  const void *v14;
  uint64_t v15;
  int EnumTagSinglePayload;
  int v17;
  uint64_t v18;
  uint64_t v19;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v6 = *(void **)(a1 + 16);
  v7 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v7;
  v8 = v7;

  v9 = *(void **)(a1 + 24);
  v10 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v10;
  v11 = v10;

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v12 = *(int *)(a3 + 48);
  v13 = (void *)(a1 + v12);
  v14 = (const void *)(a2 + v12);
  v15 = sub_246A78094();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v15);
  v17 = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15);
  if (!EnumTagSinglePayload)
  {
    v18 = *(_QWORD *)(v15 - 8);
    if (!v17)
    {
      (*(void (**)(void *, const void *, uint64_t))(v18 + 24))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v18 + 8))(v13, v15);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617218);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  return a1;
}

uint64_t initializeWithTake for AutoSendableBinaryButton(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  const void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  v5 = *(int *)(a3 + 48);
  v6 = (const void *)(a2 + v5);
  v7 = (void *)(a1 + v5);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v8 = sub_246A78094();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v8))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617218);
    memcpy(v7, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7, v6, v8);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v8);
  }
  return a1;
}

uint64_t assignWithTake for AutoSendableBinaryButton(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const void *v13;
  uint64_t v14;
  int EnumTagSinglePayload;
  int v16;
  uint64_t v17;
  uint64_t v18;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v6 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  v7 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v10;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v11 = *(int *)(a3 + 48);
  v12 = (void *)(a1 + v11);
  v13 = (const void *)(a2 + v11);
  v14 = sub_246A78094();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v12, 1, v14);
  v16 = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14);
  if (!EnumTagSinglePayload)
  {
    v17 = *(_QWORD *)(v14 - 8);
    if (!v16)
    {
      (*(void (**)(void *, const void *, uint64_t))(v17 + 40))(v12, v13, v14);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v17 + 8))(v12, v14);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617218);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for AutoSendableBinaryButton()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246A77B20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 56);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617218);
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 48), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for AutoSendableBinaryButton()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_246A77BA4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(a1 + 56) = (a2 - 1);
    OUTLINED_FUNCTION_1();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257617218);
    __swift_storeEnumTagSinglePayload(a1 + *(int *)(a4 + 48), a2, a2, v7);
  }
}

void sub_246A77C0C()
{
  unint64_t v0;

  sub_246A47180();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t storeEnumTagSinglePayload for AutoSendableBinaryButton.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246A77CFC + 4 * byte_246A7E3BE[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_246A77D30 + 4 * byte_246A7E3B9[v4]))();
}

uint64_t sub_246A77D30(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A77D38(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246A77D40);
  return result;
}

uint64_t sub_246A77D4C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246A77D54);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_246A77D58(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246A77D60(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AutoSendableBinaryButton.CodingKeys()
{
  return &type metadata for AutoSendableBinaryButton.CodingKeys;
}

unint64_t sub_246A77D80()
{
  unint64_t result;

  result = qword_257618C68;
  if (!qword_257618C68)
  {
    result = MEMORY[0x249563B60](&unk_246A7E5EC, &type metadata for AutoSendableBinaryButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618C68);
  }
  return result;
}

unint64_t sub_246A77DC0()
{
  unint64_t result;

  result = qword_257618C70;
  if (!qword_257618C70)
  {
    result = MEMORY[0x249563B60](&unk_246A7E55C, &type metadata for AutoSendableBinaryButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618C70);
  }
  return result;
}

unint64_t sub_246A77E00()
{
  unint64_t result;

  result = qword_257618C78;
  if (!qword_257618C78)
  {
    result = MEMORY[0x249563B60](&unk_246A7E584, &type metadata for AutoSendableBinaryButton.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257618C78);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_19()
{
  return sub_246A78364();
}

uint64_t OUTLINED_FUNCTION_4_15@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 72) = a1;
  return sub_246A783AC();
}

uint64_t OUTLINED_FUNCTION_5_9@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 72) = a1;
  return sub_246A78340();
}

uint64_t OUTLINED_FUNCTION_10_11()
{
  return type metadata accessor for AutoSendableBinaryButton();
}

uint64_t OUTLINED_FUNCTION_16_9@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 72) = a1;
  return v1 - 72;
}

uint64_t sub_246A77EA8()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_246A77EB4()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_246A77EC0()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_246A77ECC()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_246A77ED8()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_246A77EE4()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_246A77EF0()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_246A77EFC()
{
  return MEMORY[0x24BDCD768]();
}

uint64_t sub_246A77F08()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_246A77F14()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_246A77F20()
{
  return MEMORY[0x24BDCD910]();
}

uint64_t sub_246A77F2C()
{
  return MEMORY[0x24BDCD9B0]();
}

uint64_t sub_246A77F38()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_246A77F44()
{
  return MEMORY[0x24BDCD9D0]();
}

uint64_t sub_246A77F50()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_246A77F5C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_246A77F68()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_246A77F74()
{
  return MEMORY[0x24BDCDCA8]();
}

uint64_t sub_246A77F80()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_246A77F8C()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_246A77F98()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_246A77FA4()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_246A77FB0()
{
  return MEMORY[0x24BDCEB18]();
}

uint64_t sub_246A77FBC()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_246A77FC8()
{
  return MEMORY[0x24BDCEB50]();
}

uint64_t sub_246A77FD4()
{
  return MEMORY[0x24BDCEB60]();
}

uint64_t sub_246A77FE0()
{
  return MEMORY[0x24BDCEDE0]();
}

uint64_t sub_246A77FEC()
{
  return MEMORY[0x24BDCEE28]();
}

uint64_t sub_246A77FF8()
{
  return MEMORY[0x24BDCEE60]();
}

uint64_t sub_246A78004()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_246A78010()
{
  return MEMORY[0x24BEAA670]();
}

uint64_t sub_246A7801C()
{
  return MEMORY[0x24BEAC738]();
}

uint64_t sub_246A78028()
{
  return MEMORY[0x24BEAC740]();
}

uint64_t sub_246A78034()
{
  return MEMORY[0x24BEAD338]();
}

uint64_t sub_246A78040()
{
  return MEMORY[0x24BEAD340]();
}

uint64_t sub_246A7804C()
{
  return MEMORY[0x24BEAD348]();
}

uint64_t sub_246A78058()
{
  return MEMORY[0x24BEAD350]();
}

uint64_t sub_246A78064()
{
  return MEMORY[0x24BEAD360]();
}

uint64_t sub_246A78070()
{
  return MEMORY[0x24BEA8AC0]();
}

uint64_t sub_246A7807C()
{
  return MEMORY[0x24BEA8AD0]();
}

uint64_t sub_246A78088()
{
  return MEMORY[0x24BEA8AE0]();
}

uint64_t sub_246A78094()
{
  return MEMORY[0x24BEA8AE8]();
}

uint64_t sub_246A780A0()
{
  return MEMORY[0x24BEE6310]();
}

uint64_t sub_246A780AC()
{
  return MEMORY[0x24BEE6318]();
}

uint64_t sub_246A780B8()
{
  return MEMORY[0x24BEE6368]();
}

uint64_t sub_246A780C4()
{
  return MEMORY[0x24BEE63B8]();
}

uint64_t sub_246A780D0()
{
  return MEMORY[0x24BEE6410]();
}

uint64_t sub_246A780DC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_246A780E8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_246A780F4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_246A78100()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_246A7810C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_246A78118()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_246A78124()
{
  return MEMORY[0x24BEE75F0]();
}

uint64_t sub_246A78130()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_246A7813C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_246A78148()
{
  return MEMORY[0x24BEAD540]();
}

uint64_t sub_246A78154()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_246A78160()
{
  return MEMORY[0x24BE92C48]();
}

uint64_t sub_246A7816C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_246A78178()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_246A78184()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_246A78190()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_246A7819C()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_246A781A8()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_246A781B4()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_246A781C0()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_246A781CC()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_246A781D8()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_246A781E4()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_246A781F0()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_246A781FC()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_246A78208()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_246A78214()
{
  return MEMORY[0x24BDD01E0]();
}

uint64_t sub_246A78220()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_246A7822C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_246A78238()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_246A78244()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_246A78250()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_246A7825C()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_246A78268()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_246A78274()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_246A78280()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_246A7828C()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_246A78298()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_246A782A4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_246A782B0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_246A782BC()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_246A782C8()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_246A782D4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_246A782E0()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_246A782EC()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_246A782F8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_246A78304()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_246A78310()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_246A7831C()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_246A78328()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_246A78334()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_246A78340()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_246A7834C()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_246A78358()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_246A78364()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_246A78370()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_246A7837C()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_246A78388()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_246A78394()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_246A783A0()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_246A783AC()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_246A783B8()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_246A783C4()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_246A783D0()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_246A783DC()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_246A783E8()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_246A783F4()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_246A78400()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_246A7840C()
{
  return MEMORY[0x24BEE3A88]();
}

uint64_t sub_246A78418()
{
  return MEMORY[0x24BEE3AC8]();
}

uint64_t sub_246A78424()
{
  return MEMORY[0x24BEE3B20]();
}

uint64_t sub_246A78430()
{
  return MEMORY[0x24BEE3B68]();
}

uint64_t sub_246A7843C()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_246A78448()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_246A78454()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_246A78460()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_246A7846C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_246A78478()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_246A78484()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_246A78490()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_246A7849C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_246A784A8()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t sub_246A784B4()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_246A784C0()
{
  return MEMORY[0x24BEE4628]();
}

uint64_t sub_246A784CC()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_246A784D8()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_246A784E4()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_246A784F0()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AFPreferencesSupportedLanguages()
{
  return MEMORY[0x24BE08ED8]();
}

uint64_t INIntentCreate()
{
  return MEMORY[0x24BDD9900]();
}

uint64_t INIntentResponseCreate()
{
  return MEMORY[0x24BDD9918]();
}

uint64_t INIntentSchemaGetIntentResponseDescriptionWithFacadeClass()
{
  return MEMORY[0x24BDD9930]();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x24BEE4C88]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
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

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

