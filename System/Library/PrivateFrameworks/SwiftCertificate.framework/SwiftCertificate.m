id sub_247BF523C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(void **)(v3 + 16);
  *a2 = v4;
  return v4;
}

void sub_247BF5280(void **a1, uint64_t *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;
  v5 = v2;

}

id sub_247BF52D4()
{
  uint64_t v0;

  swift_beginAccess();
  return *(id *)(v0 + 16);
}

uint64_t sub_247BF5304@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 24);
  v5 = *(_QWORD *)(v3 + 32);
  *a2 = v4;
  a2[1] = v5;
  return sub_247BF5404(v4, v5);
}

uint64_t sub_247BF534C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  v5 = *(_QWORD *)(v4 + 24);
  v6 = *(_QWORD *)(v4 + 32);
  *(_QWORD *)(v4 + 24) = v2;
  *(_QWORD *)(v4 + 32) = v3;
  sub_247BF5404(v2, v3);
  return sub_247BF5614(v5, v6);
}

uint64_t sub_247BF53B8()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 24);
  sub_247BF5404(v1, *(_QWORD *)(v0 + 32));
  return v1;
}

uint64_t sub_247BF5404(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

_QWORD *Certificate.__allocating_init(derRepresentation:)(uint64_t a1, unint64_t a2)
{
  _QWORD *v4;
  const __CFData *v5;
  SecCertificateRef v6;
  _QWORD *v7;

  v4 = (_QWORD *)swift_allocObject();
  v5 = (const __CFData *)sub_247BF64C8();
  v6 = SecCertificateCreateWithData(0, v5);

  if (v6)
  {
    v4[2] = v6;
    v4[3] = a1;
    v4[4] = a2;
  }
  else
  {
    sub_247BF55D0();
    swift_allocError();
    *v7 = 0;
    swift_willThrow();
    sub_247BF5614(a1, a2);
    swift_deallocPartialClassInstance();
  }
  return v4;
}

_QWORD *Certificate.init(derRepresentation:)(uint64_t a1, unint64_t a2)
{
  _QWORD *v2;
  const __CFData *v5;
  SecCertificateRef v6;
  _QWORD *v7;

  v5 = (const __CFData *)sub_247BF64C8();
  v6 = SecCertificateCreateWithData(0, v5);

  if (v6)
  {
    v2[2] = v6;
    v2[3] = a1;
    v2[4] = a2;
  }
  else
  {
    sub_247BF55D0();
    swift_allocError();
    *v7 = 0;
    swift_willThrow();
    sub_247BF5614(a1, a2);
    type metadata accessor for Certificate();
    swift_deallocPartialClassInstance();
  }
  return v2;
}

unint64_t sub_247BF55D0()
{
  unint64_t result;

  result = qword_2576ED070;
  if (!qword_2576ED070)
  {
    result = MEMORY[0x24958E33C](&protocol conformance descriptor for SwiftCertificateError, &type metadata for SwiftCertificateError);
    atomic_store(result, (unint64_t *)&qword_2576ED070);
  }
  return result;
}

uint64_t sub_247BF5614(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for Certificate()
{
  return objc_opt_self();
}

uint64_t sub_247BF5678()
{
  uint64_t v0;
  CFDataRef v1;
  uint64_t v2;

  swift_beginAccess();
  v1 = SecCertificateCopyData(*(SecCertificateRef *)(v0 + 16));
  v2 = sub_247BF64D4();

  return v2;
}

uint64_t sub_247BF56D8()
{
  uint64_t v0;
  CFStringRef v1;
  __CFString *v2;
  uint64_t v3;

  swift_beginAccess();
  v1 = SecCertificateCopySubjectSummary(*(SecCertificateRef *)(v0 + 16));
  if (!v1)
    return 0;
  v2 = (__CFString *)v1;
  v3 = sub_247BF64E0();

  return v3;
}

uint64_t sub_247BF5748()
{
  uint64_t v0;
  _QWORD *v1;
  __CFString *v2;
  CFStringRef commonName[2];

  commonName[1] = *(CFStringRef *)MEMORY[0x24BDAC8D0];
  commonName[0] = 0;
  swift_beginAccess();
  if (SecCertificateCopyCommonName(*(SecCertificateRef *)(v0 + 16), commonName))
  {
    sub_247BF55D0();
    swift_allocError();
    *v1 = 3;
    swift_willThrow();

  }
  else
  {
    v2 = (__CFString *)commonName[0];
    if (commonName[0])
    {
      v0 = sub_247BF64E0();

    }
    else
    {
      return 0;
    }
  }
  return v0;
}

uint64_t sub_247BF5838()
{
  uint64_t v0;
  uint64_t result;
  _QWORD *v2;
  CFArrayRef emailAddresses[2];

  emailAddresses[1] = *(CFArrayRef *)MEMORY[0x24BDAC8D0];
  emailAddresses[0] = 0;
  swift_beginAccess();
  result = SecCertificateCopyEmailAddresses(*(SecCertificateRef *)(v0 + 16), emailAddresses);
  if ((_DWORD)result)
  {
    sub_247BF55D0();
    swift_allocError();
    *v2 = 4;
    swift_willThrow();

    return v0;
  }
  else
  {
    if (emailAddresses[0])
    {
      emailAddresses[0];
      result = sub_247BF64EC();
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_247BF5938()
{
  return sub_247BF5970(MEMORY[0x24BDE8898]);
}

uint64_t sub_247BF5954()
{
  return sub_247BF5970(MEMORY[0x24BDE88A0]);
}

uint64_t sub_247BF5970(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  _QWORD *v5;

  swift_beginAccess();
  v3 = a1(*(_QWORD *)(v1 + 16));
  if (v3)
  {
    v4 = (void *)v3;
    v1 = sub_247BF64D4();

  }
  else
  {
    sub_247BF55D0();
    swift_allocError();
    *v5 = 2;
    swift_willThrow();
  }
  return v1;
}

uint64_t sub_247BF5A14()
{
  uint64_t v0;
  uint64_t v1;
  __SecKey *v2;
  __SecKey *v3;
  CFDataRef v4;
  CFDataRef v5;
  unint64_t v6;
  unint64_t v7;
  CFErrorRef v8;
  _QWORD *v9;
  CFErrorRef *v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v14;
  CFErrorRef error[2];

  error[1] = *(CFErrorRef *)MEMORY[0x24BDAC8D0];
  error[0] = 0;
  swift_beginAccess();
  v2 = SecCertificateCopyKey(*(SecCertificateRef *)(v0 + 16));
  if (!v2)
  {
    sub_247BF55D0();
    swift_allocError();
    *v9 = 2;
    swift_willThrow();
    return v1;
  }
  v3 = v2;
  v4 = SecKeyCopyExternalRepresentation(v2, error);
  if (!v4)
  {
    v8 = error[0];
    if (!error[0])
    {
      sub_247BF55D0();
      swift_allocError();
      *v14 = 2;
      swift_willThrow();
      v11 = 0;
      v12 = 0xF000000000000000;
      goto LABEL_9;
    }
    v1 = 0;
    v7 = 0xF000000000000000;
LABEL_8:
    sub_247BF55D0();
    swift_allocError();
    *v10 = v8;
    swift_willThrow();
    v11 = v1;
    v12 = v7;
LABEL_9:
    sub_247BF5B94(v11, v12);

    return v1;
  }
  v5 = v4;
  v1 = sub_247BF64D4();
  v7 = v6;

  v8 = error[0];
  if (error[0])
    goto LABEL_8;

  return v1;
}

uint64_t sub_247BF5B94(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_247BF5614(a1, a2);
  return a1;
}

uint64_t sub_247BF5BA8()
{
  uint64_t v0;
  CFDataRef v1;
  CFDataRef v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t *v8;
  CFErrorRef error[2];

  error[1] = *(CFErrorRef *)MEMORY[0x24BDAC8D0];
  error[0] = 0;
  swift_beginAccess();
  v1 = SecCertificateCopySerialNumberData(*(SecCertificateRef *)(v0 + 16), error);
  if (v1)
  {
    v2 = v1;
    v3 = sub_247BF64D4();
    v5 = v4;

    v6 = (uint64_t)error[0];
    if (!error[0])
      return v3;
  }
  else
  {
    v6 = (uint64_t)error[0];
    if (!error[0])
    {
      v5 = 0xF000000000000000;
      v6 = 2;
      sub_247BF55D0();
      v3 = 0;
      goto LABEL_7;
    }
    v3 = 0;
    v5 = 0xF000000000000000;
  }
  sub_247BF55D0();
  v7 = (id)v6;
LABEL_7:
  swift_allocError();
  *v8 = v6;
  swift_willThrow();
  sub_247BF5B94(v3, v5);
  return v3;
}

uint64_t Certificate.deinit()
{
  uint64_t v0;

  sub_247BF5614(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  return v0;
}

uint64_t Certificate.__deallocating_deinit()
{
  uint64_t v0;

  sub_247BF5614(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  return swift_deallocClassInstance();
}

id sub_247BF5D0C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(void **)(v3 + 40);
  *a2 = v4;
  return v4;
}

void sub_247BF5D50(void **a1, uint64_t *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;
  v5 = v2;

}

id sub_247BF5DA4()
{
  uint64_t v0;

  swift_beginAccess();
  return *(id *)(v0 + 40);
}

_QWORD *DigitalIdentity.__allocating_init(certificate:privateKey:)(uint64_t a1, void *a2)
{
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  const __CFData *v8;
  SecCertificateRef v9;
  _QWORD *v10;

  v4 = (_QWORD *)swift_allocObject();
  v4[5] = a2;
  swift_beginAccess();
  v5 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  sub_247BF5404(v5, v6);
  v8 = (const __CFData *)sub_247BF64C8();
  v9 = SecCertificateCreateWithData(0, v8);

  if (v9)
  {
    v4[2] = v9;
    v4[3] = v5;
    v4[4] = v6;
  }
  else
  {
    sub_247BF55D0();
    swift_allocError();
    *v10 = 0;
    swift_willThrow();
    sub_247BF5614(v5, v6);
    type metadata accessor for Certificate();
    swift_deallocPartialClassInstance();
  }
  swift_release();

  return v4;
}

_QWORD *DigitalIdentity.init(certificate:privateKey:)(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v5;
  unint64_t v6;
  id v7;
  const __CFData *v8;
  SecCertificateRef v9;
  _QWORD *v10;

  v2[5] = a2;
  swift_beginAccess();
  v5 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  sub_247BF5404(v5, v6);
  v8 = (const __CFData *)sub_247BF64C8();
  v9 = SecCertificateCreateWithData(0, v8);

  if (v9)
  {
    v2[2] = v9;
    v2[3] = v5;
    v2[4] = v6;
  }
  else
  {
    sub_247BF55D0();
    swift_allocError();
    *v10 = 0;
    swift_willThrow();
    sub_247BF5614(v5, v6);
    type metadata accessor for Certificate();
    swift_deallocPartialClassInstance();
  }
  swift_release();

  return v2;
}

void DigitalIdentity.__allocating_init(derRepresentation:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void DigitalIdentity.init(derRepresentation:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_247BF605C()
{
  uint64_t v0;

}

uint64_t DigitalIdentity.deinit()
{
  uint64_t v0;

  sub_247BF5614(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  return v0;
}

uint64_t DigitalIdentity.__deallocating_deinit()
{
  uint64_t v0;

  sub_247BF5614(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  return swift_deallocClassInstance();
}

uint64_t method lookup function for Certificate()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Certificate.secCertificate.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of Certificate.der.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of Certificate.__allocating_init(derRepresentation:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of Certificate.derRepresentation.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of Certificate.subjectSummary.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of Certificate.commonName.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of Certificate.emailAddresses.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of Certificate.normalizedIssuerSequence.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of Certificate.normalizedSubjectSequence.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of Certificate.publicKey.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of Certificate.serialNumberData.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t type metadata accessor for DigitalIdentity()
{
  return objc_opt_self();
}

uint64_t method lookup function for DigitalIdentity()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DigitalIdentity.privateKey.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of DigitalIdentity.__allocating_init(certificate:privateKey:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 248))();
}

void type metadata accessor for CFError(uint64_t a1)
{
  sub_247BF624C(a1, &qword_2576ED2D0);
}

void type metadata accessor for SecKey(uint64_t a1)
{
  sub_247BF624C(a1, &qword_2576ED2D8);
}

void type metadata accessor for SecCertificate(uint64_t a1)
{
  sub_247BF624C(a1, (unint64_t *)&unk_2576ED2E0);
}

void sub_247BF624C(uint64_t a1, unint64_t *a2)
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

_QWORD *initializeBufferWithCopyOfBuffer for SwiftCertificateError(_QWORD *a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF)
    v4 = v3;
  *a1 = v3;
  return a1;
}

void destroy for SwiftCertificateError(void **a1)
{
  void *v1;

  v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF)

}

void **assignWithCopy for SwiftCertificateError(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *a1;
  v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF)
    {
      *a1 = v4;
      v6 = v4;
      return a1;
    }
LABEL_7:
    *a1 = v4;
    return a1;
  }
  if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    v4 = *a2;
    goto LABEL_7;
  }
  *a1 = v4;
  v5 = v4;

  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for SwiftCertificateError(void **a1, unint64_t *a2)
{
  void *v3;
  unint64_t v4;

  v3 = *a1;
  v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF)
    goto LABEL_5;
  if (v4 < 0xFFFFFFFF)
  {

LABEL_5:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for SwiftCertificateError(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 > 0x7FFFFFFA && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 2147483643);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 4;
  if (v4 >= 6)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SwiftCertificateError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFB)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 2147483643;
    if (a3 >= 0x7FFFFFFB)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFB)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 4;
  }
  return result;
}

uint64_t sub_247BF6478(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_247BF6494(_QWORD *result, int a2)
{
  unsigned int v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2)
      return result;
    v2 = a2 - 1;
  }
  *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for SwiftCertificateError()
{
  return &type metadata for SwiftCertificateError;
}

uint64_t sub_247BF64C8()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_247BF64D4()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_247BF64E0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_247BF64EC()
{
  return MEMORY[0x24BDCFBB0]();
}

uint64_t sub_247BF64F8()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_247BF6504()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_247BF6510()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_247BF651C()
{
  return MEMORY[0x24BEE3F10]();
}

OSStatus SecCertificateCopyCommonName(SecCertificateRef certificate, CFStringRef *commonName)
{
  return MEMORY[0x24BDE8828](certificate, commonName);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x24BDE8850](certificate);
}

OSStatus SecCertificateCopyEmailAddresses(SecCertificateRef certificate, CFArrayRef *emailAddresses)
{
  return MEMORY[0x24BDE8858](certificate, emailAddresses);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x24BDE8888](certificate);
}

CFDataRef SecCertificateCopySerialNumberData(SecCertificateRef certificate, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE88E0](certificate, error);
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x24BDE88F8](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8AA8](key, error);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
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

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

