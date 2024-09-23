uint64_t _errno_overlay_getErrno()
{
  return *__error();
}

int *_errno_overlay_setErrno(int a1)
{
  int *result;

  result = __error();
  *result = a1;
  return result;
}

int *(*errno.modify(_DWORD *a1))(int *a1)
{
  *a1 = _errno_overlay_getErrno();
  return errno.modify;
}

int *errno.modify(int *a1)
{
  return _errno_overlay_setErrno(*a1);
}

uint64_t static POSIXErrorCode.EWOULDBLOCK.getter()
{
  return 35;
}

uint64_t static POSIXErrorCode.ELAST.getter()
{
  return 106;
}

uint64_t POSIXErrorCode.init(rawValue:)(unsigned int a1)
{
  unint64_t v1;

  v1 = specialized POSIXErrorCode.init(rawValue:)(a1);
  return v1 | ((HIDWORD(v1) & 1) << 32);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance POSIXErrorCode(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance POSIXErrorCode()
{
  Swift::UInt32 *v0;
  Swift::UInt32 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance POSIXErrorCode()
{
  Swift::UInt32 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance POSIXErrorCode()
{
  Swift::UInt32 *v0;
  Swift::UInt32 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance POSIXErrorCode@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;

  result = specialized POSIXErrorCode.init(rawValue:)(*a1);
  *(_DWORD *)a2 = result;
  *(_BYTE *)(a2 + 4) = BYTE4(result) & 1;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance POSIXErrorCode(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

unint64_t specialized POSIXErrorCode.init(rawValue:)(unsigned int a1)
{
  unsigned __int8 v1;
  uint64_t v2;

  v1 = 0;
  v2 = a1;
  switch(a1)
  {
    case 1u:
      goto LABEL_10;
    case 2u:
      v2 = 2;
      goto LABEL_10;
    case 3u:
      v2 = 3;
      goto LABEL_10;
    case 4u:
      v2 = 4;
      goto LABEL_10;
    case 5u:
      v2 = 5;
      goto LABEL_10;
    case 6u:
      v2 = 6;
      goto LABEL_10;
    case 7u:
      v2 = 7;
      goto LABEL_10;
    case 8u:
      v2 = 8;
      goto LABEL_10;
    case 9u:
      v2 = 9;
LABEL_10:
      v1 = 0;
      break;
    case 0xAu:
      return v2 | ((unint64_t)v1 << 32);
    case 0xBu:
      v1 = 0;
      v2 = 11;
      break;
    case 0xCu:
      v1 = 0;
      v2 = 12;
      break;
    case 0xDu:
      v1 = 0;
      v2 = 13;
      break;
    case 0xEu:
      v1 = 0;
      v2 = 14;
      break;
    case 0xFu:
      v1 = 0;
      v2 = 15;
      break;
    case 0x10u:
      v1 = 0;
      v2 = 16;
      break;
    case 0x11u:
      v1 = 0;
      v2 = 17;
      break;
    case 0x12u:
      v1 = 0;
      v2 = 18;
      break;
    case 0x13u:
      v1 = 0;
      v2 = 19;
      break;
    case 0x14u:
      v1 = 0;
      v2 = 20;
      break;
    case 0x15u:
      v1 = 0;
      v2 = 21;
      break;
    case 0x16u:
      v1 = 0;
      v2 = 22;
      break;
    case 0x17u:
      v1 = 0;
      v2 = 23;
      break;
    case 0x18u:
      v1 = 0;
      v2 = 24;
      break;
    case 0x19u:
      v1 = 0;
      v2 = 25;
      break;
    case 0x1Au:
      v1 = 0;
      v2 = 26;
      break;
    case 0x1Bu:
      v1 = 0;
      v2 = 27;
      break;
    case 0x1Cu:
      v1 = 0;
      v2 = 28;
      break;
    case 0x1Du:
      v1 = 0;
      v2 = 29;
      break;
    case 0x1Eu:
      v1 = 0;
      v2 = 30;
      break;
    case 0x1Fu:
      v1 = 0;
      v2 = 31;
      break;
    case 0x20u:
      v1 = 0;
      v2 = 32;
      break;
    case 0x21u:
      v1 = 0;
      v2 = 33;
      break;
    case 0x22u:
      v1 = 0;
      v2 = 34;
      break;
    case 0x23u:
      v1 = 0;
      v2 = 35;
      break;
    case 0x24u:
      v1 = 0;
      v2 = 36;
      break;
    case 0x25u:
      v1 = 0;
      v2 = 37;
      break;
    case 0x26u:
      v1 = 0;
      v2 = 38;
      break;
    case 0x27u:
      v1 = 0;
      v2 = 39;
      break;
    case 0x28u:
      v1 = 0;
      v2 = 40;
      break;
    case 0x29u:
      v1 = 0;
      v2 = 41;
      break;
    case 0x2Au:
      v1 = 0;
      v2 = 42;
      break;
    case 0x2Bu:
      v1 = 0;
      v2 = 43;
      break;
    case 0x2Cu:
      v1 = 0;
      v2 = 44;
      break;
    case 0x2Du:
      v1 = 0;
      v2 = 45;
      break;
    case 0x2Eu:
      v1 = 0;
      v2 = 46;
      break;
    case 0x2Fu:
      v1 = 0;
      v2 = 47;
      break;
    case 0x30u:
      v1 = 0;
      v2 = 48;
      break;
    case 0x31u:
      v1 = 0;
      v2 = 49;
      break;
    case 0x32u:
      v1 = 0;
      v2 = 50;
      break;
    case 0x33u:
      v1 = 0;
      v2 = 51;
      break;
    case 0x34u:
      v1 = 0;
      v2 = 52;
      break;
    case 0x35u:
      v1 = 0;
      v2 = 53;
      break;
    case 0x36u:
      v1 = 0;
      v2 = 54;
      break;
    case 0x37u:
      v1 = 0;
      v2 = 55;
      break;
    case 0x38u:
      v1 = 0;
      v2 = 56;
      break;
    case 0x39u:
      v1 = 0;
      v2 = 57;
      break;
    case 0x3Au:
      v1 = 0;
      v2 = 58;
      break;
    case 0x3Bu:
      v1 = 0;
      v2 = 59;
      break;
    case 0x3Cu:
      v1 = 0;
      v2 = 60;
      break;
    case 0x3Du:
      v1 = 0;
      v2 = 61;
      break;
    case 0x3Eu:
      v1 = 0;
      v2 = 62;
      break;
    case 0x3Fu:
      v1 = 0;
      v2 = 63;
      break;
    case 0x40u:
      v1 = 0;
      v2 = 64;
      break;
    case 0x41u:
      v1 = 0;
      v2 = 65;
      break;
    case 0x42u:
      v1 = 0;
      v2 = 66;
      break;
    case 0x43u:
      v1 = 0;
      v2 = 67;
      break;
    case 0x44u:
      v1 = 0;
      v2 = 68;
      break;
    case 0x45u:
      v1 = 0;
      v2 = 69;
      break;
    case 0x46u:
      v1 = 0;
      v2 = 70;
      break;
    case 0x47u:
      v1 = 0;
      v2 = 71;
      break;
    case 0x48u:
      v1 = 0;
      v2 = 72;
      break;
    case 0x49u:
      v1 = 0;
      v2 = 73;
      break;
    case 0x4Au:
      v1 = 0;
      v2 = 74;
      break;
    case 0x4Bu:
      v1 = 0;
      v2 = 75;
      break;
    case 0x4Cu:
      v1 = 0;
      v2 = 76;
      break;
    case 0x4Du:
      v1 = 0;
      v2 = 77;
      break;
    case 0x4Eu:
      v1 = 0;
      v2 = 78;
      break;
    case 0x4Fu:
      v1 = 0;
      v2 = 79;
      break;
    case 0x50u:
      v1 = 0;
      v2 = 80;
      break;
    case 0x51u:
      v1 = 0;
      v2 = 81;
      break;
    case 0x52u:
      v1 = 0;
      v2 = 82;
      break;
    case 0x53u:
      v1 = 0;
      v2 = 83;
      break;
    case 0x54u:
      v1 = 0;
      v2 = 84;
      break;
    case 0x55u:
      v1 = 0;
      v2 = 85;
      break;
    case 0x56u:
      v1 = 0;
      v2 = 86;
      break;
    case 0x57u:
      v1 = 0;
      v2 = 87;
      break;
    case 0x58u:
      v1 = 0;
      v2 = 88;
      break;
    case 0x59u:
      v1 = 0;
      v2 = 89;
      break;
    case 0x5Au:
      v1 = 0;
      v2 = 90;
      break;
    case 0x5Bu:
      v1 = 0;
      v2 = 91;
      break;
    case 0x5Cu:
      v1 = 0;
      v2 = 92;
      break;
    case 0x5Du:
      v1 = 0;
      v2 = 93;
      break;
    case 0x5Eu:
      v1 = 0;
      v2 = 94;
      break;
    case 0x5Fu:
      v1 = 0;
      v2 = 95;
      break;
    case 0x60u:
      v1 = 0;
      v2 = 96;
      break;
    case 0x61u:
      v1 = 0;
      v2 = 97;
      break;
    case 0x62u:
      v1 = 0;
      v2 = 98;
      break;
    case 0x63u:
      v1 = 0;
      v2 = 99;
      break;
    case 0x64u:
      v1 = 0;
      v2 = 100;
      break;
    case 0x65u:
      v1 = 0;
      v2 = 101;
      break;
    case 0x67u:
      v1 = 0;
      v2 = 103;
      break;
    case 0x68u:
      v1 = 0;
      v2 = 104;
      break;
    case 0x69u:
      v1 = 0;
      v2 = 105;
      break;
    case 0x6Au:
      v1 = 0;
      v2 = 106;
      break;
    default:
      v2 = 0;
      v1 = 1;
      break;
  }
  return v2 | ((unint64_t)v1 << 32);
}

unint64_t lazy protocol witness table accessor for type POSIXErrorCode and conformance POSIXErrorCode()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type POSIXErrorCode and conformance POSIXErrorCode;
  if (!lazy protocol witness table cache variable for type POSIXErrorCode and conformance POSIXErrorCode)
  {
    result = MEMORY[0x24BD2E9B0](&protocol conformance descriptor for POSIXErrorCode, &type metadata for POSIXErrorCode);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type POSIXErrorCode and conformance POSIXErrorCode);
  }
  return result;
}

ValueMetadata *type metadata accessor for POSIXErrorCode()
{
  return &type metadata for POSIXErrorCode;
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
  MEMORY[0x24BEE4310](*(_QWORD *)&a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

