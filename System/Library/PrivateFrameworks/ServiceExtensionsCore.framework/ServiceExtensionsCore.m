ValueMetadata *type metadata accessor for AuditToken()
{
  return &type metadata for AuditToken;
}

__int128 *sub_245DCC5C0()
{
  __int128 *result;
  __int128 v1;

  result = (__int128 *)objc_msgSend((id)objc_opt_self(), sel_auditTokenForCurrentProcess);
  if (result)
  {
    v1 = result[1];
    xmmword_25751D378 = *result;
    *(_OWORD *)&qword_25751D388 = v1;
  }
  else
  {
    result = (__int128 *)sub_245DCD6EC();
    __break(1u);
  }
  return result;
}

double static AuditToken.current.getter@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  if (qword_25751D360 != -1)
    swift_once();
  result = *(double *)&xmmword_25751D378;
  v3 = *(_OWORD *)&qword_25751D388;
  *a1 = xmmword_25751D378;
  a1[1] = v3;
  return result;
}

uint64_t AuditToken.pid.getter()
{
  _OWORD *v0;
  __int128 v1;
  audit_token_t v3;

  v1 = v0[1];
  *(_OWORD *)v3.val = *v0;
  *(_OWORD *)&v3.val[4] = v1;
  return audit_token_to_pid(&v3);
}

uint64_t se_memory_inline_jit_restrict_rwx_to_rx_with_witness_impl()
{
  uint64_t v0;
  unint64_t StatusReg;

  __dmb(0xAu);
  if (MEMORY[0xFFFFFC10C] == 1)
  {
    _WriteStatusReg(ARM64_SYSREG(3, 4, 15, 2, 7), MEMORY[0xFFFFFC118]);
    v0 = MEMORY[0xFFFFFC118];
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 4, 15, 2, 7));
  }
  else
  {
    _WriteStatusReg(ARM64_SYSREG(3, 6, 15, 1, 5), MEMORY[0xFFFFFC118]);
    v0 = MEMORY[0xFFFFFC118];
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 6, 15, 1, 5));
  }
  if (v0 != StatusReg)
  {
    __break(0xC471u);
    JUMPOUT(0x245DCC7BCLL);
  }
  __isb(0xFu);
  return 0;
}

uint64_t se_memory_inline_jit_restrict_rwx_to_rw_with_witness_impl(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  __dmb(0xAu);
  if (MEMORY[0xFFFFFC10C] == 1)
    _WriteStatusReg(ARM64_SYSREG(3, 4, 15, 2, 7), MEMORY[0xFFFFFC110]);
  else
    _WriteStatusReg(ARM64_SYSREG(3, 6, 15, 1, 5), MEMORY[0xFFFFFC110]);
  __dmb(0xAu);
  __isb(0xFu);
  result = 4868436;
  if (a2 == 4868436 && v2 == a1)
    return 0;
  __break(0xC471u);
  return result;
}

BOOL se_memory_inline_jit_restrict_with_witness_supported()
{
  return MEMORY[0xFFFFFC10C] && MEMORY[0xFFFFFC10C] - 1 < 3;
}

BOOL _SECheckEntitlmentForAuditToken(uint64_t a1, _OWORD *a2)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = a2[1];
  v4[0] = *a2;
  v4[1] = v2;
  return +[_SESwiftCBridge checkEntitlement:forAuditToken:](_SESwiftCBridge, "checkEntitlement:forAuditToken:", a1, v4);
}

BOOL _SECheckEntitlmentForCurrentProcess(uint64_t a1)
{
  return +[_SESwiftCBridge checkEntitlementForCurrentProcess:](_SESwiftCBridge, "checkEntitlementForCurrentProcess:", a1);
}

ServiceExtensionsCore::_BrowserEngineEntitlement_optional __swiftcall _BrowserEngineEntitlement.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  void *object;
  uint64_t countAndFlagsBits;
  char *v4;
  ServiceExtensionsCore::_BrowserEngineEntitlement_optional result;
  char v6;
  char v7;

  object = rawValue._object;
  countAndFlagsBits = rawValue._countAndFlagsBits;
  v4 = v1;
  if (rawValue._countAndFlagsBits == 0xD00000000000002BLL && rawValue._object == (void *)0x8000000245DCDAA0
    || (sub_245DCD6F8() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    v6 = 0;
  }
  else if (countAndFlagsBits == 0xD000000000000031 && object == (void *)0x8000000245DCDAD0
         || (sub_245DCD6F8() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    v6 = 1;
  }
  else if (countAndFlagsBits == 0xD000000000000031 && object == (void *)0x8000000245DCDB10
         || (sub_245DCD6F8() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    v6 = 2;
  }
  else if (countAndFlagsBits == 0xD000000000000030 && object == (void *)0x8000000245DCDB50)
  {
    result.value = swift_bridgeObjectRelease();
    v6 = 3;
  }
  else
  {
    v7 = sub_245DCD6F8();
    result.value = swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      v6 = 3;
    else
      v6 = 4;
  }
  *v4 = v6;
  return result;
}

uint64_t _BrowserEngineEntitlement.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_245DCCAA0 + 4 * byte_245DCD8A0[*v0]))(0xD00000000000002BLL, 0x8000000245DCDAA0);
}

unint64_t sub_245DCCAA0()
{
  return 0xD000000000000031;
}

uint64_t sub_245DCCAC8@<X0>(uint64_t a1@<X8>)
{
  return a1 - 1;
}

uint64_t _BrowserEngineEntitlement.description.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_245DCCB18 + 4 * byte_245DCD8A4[*v0]))(0xD00000000000002BLL, 0x8000000245DCDAA0);
}

unint64_t sub_245DCCB18()
{
  return 0xD000000000000031;
}

uint64_t sub_245DCCB40@<X0>(uint64_t a1@<X8>)
{
  return a1 - 1;
}

void sub_245DCCB58(char *a1)
{
  sub_245DCCBAC(*a1);
}

unint64_t sub_245DCCB68()
{
  unint64_t result;

  result = qword_25751D368;
  if (!qword_25751D368)
  {
    result = MEMORY[0x249548018](&protocol conformance descriptor for _BrowserEngineEntitlement, &type metadata for _BrowserEngineEntitlement);
    atomic_store(result, (unint64_t *)&qword_25751D368);
  }
  return result;
}

void sub_245DCCBAC(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_245DCCBFC(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_245DCCC58 + 4 * byte_245DCD8AC[a2]))(0xD000000000000031);
}

uint64_t sub_245DCCC58(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0xD000000000000031 && v1 == 0x8000000245DCDAD0)
    v2 = 1;
  else
    v2 = sub_245DCD6F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_245DCCCF0()
{
  char *v0;

  sub_245DCCCF8(*v0);
}

void sub_245DCCCF8(char a1)
{
  sub_245DCD704();
  __asm { BR              X10 }
}

uint64_t sub_245DCCD54()
{
  sub_245DCD6E0();
  swift_bridgeObjectRelease();
  return sub_245DCD710();
}

void sub_245DCCDC0(uint64_t a1)
{
  char *v1;

  sub_245DCCDC8(a1, *v1);
}

void sub_245DCCDC8(uint64_t a1, char a2)
{
  __asm { BR              X11 }
}

uint64_t sub_245DCCE10()
{
  sub_245DCD6E0();
  return swift_bridgeObjectRelease();
}

void sub_245DCCE64(uint64_t a1)
{
  char *v1;

  sub_245DCCE6C(a1, *v1);
}

void sub_245DCCE6C(uint64_t a1, char a2)
{
  sub_245DCD704();
  __asm { BR              X10 }
}

uint64_t sub_245DCCEC4()
{
  sub_245DCD6E0();
  swift_bridgeObjectRelease();
  return sub_245DCD710();
}

ServiceExtensionsCore::_BrowserEngineEntitlement_optional sub_245DCCF30(Swift::String *a1)
{
  return _BrowserEngineEntitlement.init(rawValue:)(*a1);
}

uint64_t sub_245DCCF3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = _BrowserEngineEntitlement.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for _BrowserEngineEntitlement(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for _BrowserEngineEntitlement(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_245DCD04C + 4 * byte_245DCD8C1[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_245DCD080 + 4 * byte_245DCD8BC[v4]))();
}

uint64_t sub_245DCD080(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245DCD088(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245DCD090);
  return result;
}

uint64_t sub_245DCD09C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245DCD0A4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_245DCD0A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245DCD0B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245DCD0BC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_245DCD0C8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for _BrowserEngineEntitlement()
{
  return &type metadata for _BrowserEngineEntitlement;
}

uint64_t initializeBufferWithCopyOfBuffer for AuditToken(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_4(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for AuditToken(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AuditToken(uint64_t result, int a2, int a3)
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

void type metadata accessor for audit_token_t()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_25751D370)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_25751D370);
  }
}

void __swiftcall AuditToken.init(_:)(ServiceExtensionsCore::AuditToken *__return_ptr retstr, audit_token_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)retstr->inner.val = a2;
  *(_QWORD *)&retstr->inner.val[2] = v2;
  *(_QWORD *)&retstr->inner.val[4] = v3;
  *(_QWORD *)&retstr->inner.val[6] = v4;
}

uint64_t AuditToken.inner.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t sub_245DCD1EC()
{
  uint64_t v0;
  uint64_t result;
  unsigned __int8 v2;

  sub_245DCD6D4();
  v0 = xpc_copy_entitlement_for_token();
  swift_release();
  if (!v0)
    return 2;
  result = _CFXPCCreateCFObjectFromXPCObject();
  if (result)
  {
    swift_unknownObjectRelease();
    if (swift_dynamicCast())
      return v2;
    else
      return 2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::Bool __swiftcall AuditToken.has(browserEngineEntitlement:)(ServiceExtensionsCore::_BrowserEngineEntitlement browserEngineEntitlement)
{
  Swift::Bool result;

  __asm { BR              X11 }
  return result;
}

uint64_t sub_245DCD324()
{
  char v0;

  v0 = sub_245DCD1EC();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

id sub_245DCD458()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SwiftCBridge();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SwiftCBridge()
{
  return objc_opt_self();
}

void sub_245DCD4A8(uint64_t a1, void *a2)
{
  Swift::String v4;

  swift_bridgeObjectRetain();
  v4._countAndFlagsBits = a1;
  v4._object = a2;
  _BrowserEngineEntitlement.init(rawValue:)(v4);
  __asm { BR              X11 }
}

uint64_t sub_245DCD530()
{
  char v0;

  v0 = sub_245DCD1EC();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

uint64_t sub_245DCD5B4(uint64_t a1, void *a2)
{
  Swift::String v4;
  char v6;

  swift_bridgeObjectRetain();
  v4._countAndFlagsBits = a1;
  v4._object = a2;
  _BrowserEngineEntitlement.init(rawValue:)(v4);
  if (v6 != 4)
  {
    if (qword_25751D360 != -1)
      swift_once();
    __asm { BR              X10 }
  }
  return 0;
}

uint64_t sub_245DCD6C8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_245DCD6D4()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_245DCD6E0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_245DCD6EC()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_245DCD6F8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_245DCD704()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_245DCD710()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x24BDBD138]();
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA8F8](atoken);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x24BDB0180](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x24BDB0830]();
}

