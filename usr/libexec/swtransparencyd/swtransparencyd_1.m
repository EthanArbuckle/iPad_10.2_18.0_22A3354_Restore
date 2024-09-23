uint64_t sub_1000C5368(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_1000C95CC(a2, *(_QWORD **)(a1 + 32), a3);
}

id sub_1000C5378(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)sub_1000C8FE0(a2, *(_QWORD *)(a1 + 32)), "count");
}

const __CFString *sub_1000C54BC(_QWORD *a1, _QWORD *a2, uint64_t *a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  uint64_t *v8;
  id v10;
  id v11;
  _BOOL8 v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v31;

  v5 = a1[1];
  v8 = a3 + 1;
  switch(*(_BYTE *)(v5 + 44))
  {
    case 0:
      v11 = objc_alloc((Class)NSNumber);
      v12 = sub_10009CE38(v8);
      return (const __CFString *)_objc_msgSend(v11, "initWithBool:", v12);
    case 1:
      v13 = objc_alloc((Class)NSNumber);
      v14 = sub_10009CDC0(v8);
      return (const __CFString *)_objc_msgSend(v13, "initWithUnsignedInt:", v14);
    case 2:
      v15 = objc_alloc((Class)NSNumber);
      v16 = sub_10009CDC0(v8);
      goto LABEL_11;
    case 3:
      v17 = objc_alloc((Class)NSNumber);
      sub_10009CCB4(v8);
      return (const __CFString *)_objc_msgSend(v17, "initWithFloat:", v31);
    case 4:
      v18 = objc_alloc((Class)NSNumber);
      v19 = sub_10009CD88(v8);
      return (const __CFString *)_objc_msgSend(v18, "initWithUnsignedLongLong:", v19);
    case 5:
      v25 = objc_alloc((Class)NSNumber);
      v26 = sub_10009CD88(v8);
      return (const __CFString *)_objc_msgSend(v25, "initWithLongLong:", v26);
    case 6:
      v27 = objc_alloc((Class)NSNumber);
      sub_10009CC7C(v8);
      return (const __CFString *)_objc_msgSend(v27, "initWithDouble:", v29);
    case 7:
      v15 = objc_alloc((Class)NSNumber);
      v16 = sub_10009CD74(v8);
      goto LABEL_11;
    case 8:
      v25 = objc_alloc((Class)NSNumber);
      v26 = sub_10009CCEC(v8);
      return (const __CFString *)_objc_msgSend(v25, "initWithLongLong:", v26);
    case 9:
      v15 = objc_alloc((Class)NSNumber);
      v16 = sub_10009CDF8(v8);
LABEL_11:
      v20 = v16;
      v21 = v15;
      return (const __CFString *)_objc_msgSend(v21, "initWithInt:", v20);
    case 0xA:
      v25 = objc_alloc((Class)NSNumber);
      v26 = sub_10009CE18(v8);
      return (const __CFString *)_objc_msgSend(v25, "initWithLongLong:", v26);
    case 0xB:
      v13 = objc_alloc((Class)NSNumber);
      v14 = sub_10009CD74(v8);
      return (const __CFString *)_objc_msgSend(v13, "initWithUnsignedInt:", v14);
    case 0xC:
      v18 = objc_alloc((Class)NSNumber);
      v19 = sub_10009CCEC(v8);
      return (const __CFString *)_objc_msgSend(v18, "initWithUnsignedLongLong:", v19);
    case 0xD:
      return (const __CFString *)sub_10009D0E8(a3 + 1);
    case 0xE:
      return sub_10009CFFC(a3 + 1);
    case 0xF:
    case 0x10:
      if (a5)
        v10 = a5;
      else
        v10 = objc_alloc_init((Class)objc_msgSend(objc_msgSend(objc_msgSend(a1, "msgClass"), "descriptor"), "messageClass"));
      v28 = v10;
      if (*(_BYTE *)(v5 + 44) == 16)
      {
        objc_msgSend(a3, "readGroup:message:extensionRegistry:", *(unsigned int *)(v5 + 40), v10, a4);
      }
      else if ((*(_BYTE *)(v5 + 45) & 4) != 0)
      {
        objc_msgSend(v10, "mergeFromCodedInputStream:extensionRegistry:", a3, a4);
      }
      else
      {
        objc_msgSend(a3, "readMessage:extensionRegistry:", v10, a4);
      }
      return (const __CFString *)v28;
    case 0x11:
      v23 = sub_10009CD74(a3 + 1);
      v24 = objc_msgSend(a1, "enumDescriptor");
      if (objc_msgSend(v24, "isClosed")
        && !((unsigned int (*)(uint64_t))objc_msgSend(v24, "enumVerifier"))(v23))
      {
        objc_msgSend((id)sub_1000C1FFC(a2), "mergeVarintField:value:", *(unsigned int *)(a1[1] + 40), v23);
        return 0;
      }
      else
      {
        v21 = objc_alloc((Class)NSNumber);
        v20 = v23;
        return (const __CFString *)_objc_msgSend(v21, "initWithInt:", v20);
      }
    default:
      return 0;
  }
}

TransparencyGPBAutocreatedDictionary *sub_1000C5888(_QWORD *a1, objc_class *a2)
{
  unsigned int v4;
  TransparencyGPBAutocreatedDictionary *result;
  int v6;
  __objc2_class *v7;
  __objc2_class *v8;
  int *v9;

  v4 = objc_msgSend(a1, "mapKeyDataType");
  result = 0;
  v6 = *(unsigned __int8 *)(a1[1] + 30);
  switch(v4)
  {
    case 0u:
      result = 0;
      switch(*(_BYTE *)(a1[1] + 30))
      {
        case 0:
          v7 = TransparencyGPBBoolBoolDictionary;
          goto LABEL_63;
        case 1:
        case 0xB:
          v7 = TransparencyGPBBoolUInt32Dictionary;
          goto LABEL_63;
        case 2:
        case 7:
        case 9:
          v7 = TransparencyGPBBoolInt32Dictionary;
          goto LABEL_63;
        case 3:
          v7 = TransparencyGPBBoolFloatDictionary;
          goto LABEL_63;
        case 4:
        case 0xC:
          v7 = TransparencyGPBBoolUInt64Dictionary;
          goto LABEL_63;
        case 5:
        case 8:
        case 0xA:
          v7 = TransparencyGPBBoolInt64Dictionary;
          goto LABEL_63;
        case 6:
          v7 = TransparencyGPBBoolDoubleDictionary;
          goto LABEL_63;
        case 0xD:
        case 0xE:
        case 0xF:
          v7 = TransparencyGPBBoolObjectDictionary;
          goto LABEL_63;
        case 0x10:
          return result;
        case 0x11:
          v8 = TransparencyGPBBoolEnumDictionary;
          goto LABEL_72;
        default:
          goto LABEL_64;
      }
    case 1u:
    case 0xBu:
      result = 0;
      switch(*(_BYTE *)(a1[1] + 30))
      {
        case 0:
          v7 = TransparencyGPBUInt32BoolDictionary;
          goto LABEL_63;
        case 1:
        case 0xB:
          v7 = TransparencyGPBUInt32UInt32Dictionary;
          goto LABEL_63;
        case 2:
        case 7:
        case 9:
          v7 = TransparencyGPBUInt32Int32Dictionary;
          goto LABEL_63;
        case 3:
          v7 = TransparencyGPBUInt32FloatDictionary;
          goto LABEL_63;
        case 4:
        case 0xC:
          v7 = TransparencyGPBUInt32UInt64Dictionary;
          goto LABEL_63;
        case 5:
        case 8:
        case 0xA:
          v7 = TransparencyGPBUInt32Int64Dictionary;
          goto LABEL_63;
        case 6:
          v7 = TransparencyGPBUInt32DoubleDictionary;
          goto LABEL_63;
        case 0xD:
        case 0xE:
        case 0xF:
          v7 = TransparencyGPBUInt32ObjectDictionary;
          goto LABEL_63;
        case 0x10:
          return result;
        case 0x11:
          v8 = TransparencyGPBUInt32EnumDictionary;
          goto LABEL_72;
        default:
          goto LABEL_64;
      }
    case 2u:
    case 7u:
    case 9u:
      result = 0;
      switch(*(_BYTE *)(a1[1] + 30))
      {
        case 0:
          v7 = TransparencyGPBInt32BoolDictionary;
          goto LABEL_63;
        case 1:
        case 0xB:
          v7 = TransparencyGPBInt32UInt32Dictionary;
          goto LABEL_63;
        case 2:
        case 7:
        case 9:
          v7 = TransparencyGPBInt32Int32Dictionary;
          goto LABEL_63;
        case 3:
          v7 = TransparencyGPBInt32FloatDictionary;
          goto LABEL_63;
        case 4:
        case 0xC:
          v7 = TransparencyGPBInt32UInt64Dictionary;
          goto LABEL_63;
        case 5:
        case 8:
        case 0xA:
          v7 = TransparencyGPBInt32Int64Dictionary;
          goto LABEL_63;
        case 6:
          v7 = TransparencyGPBInt32DoubleDictionary;
          goto LABEL_63;
        case 0xD:
        case 0xE:
        case 0xF:
          v7 = TransparencyGPBInt32ObjectDictionary;
          goto LABEL_63;
        case 0x10:
          return result;
        case 0x11:
          v8 = TransparencyGPBInt32EnumDictionary;
          goto LABEL_72;
        default:
          goto LABEL_64;
      }
    case 3u:
    case 6u:
    case 0xDu:
    case 0xFu:
    case 0x10u:
    case 0x11u:
      return result;
    case 4u:
    case 0xCu:
      result = 0;
      switch(*(_BYTE *)(a1[1] + 30))
      {
        case 0:
          v7 = TransparencyGPBUInt64BoolDictionary;
          goto LABEL_63;
        case 1:
        case 0xB:
          v7 = TransparencyGPBUInt64UInt32Dictionary;
          goto LABEL_63;
        case 2:
        case 7:
        case 9:
          v7 = TransparencyGPBUInt64Int32Dictionary;
          goto LABEL_63;
        case 3:
          v7 = TransparencyGPBUInt64FloatDictionary;
          goto LABEL_63;
        case 4:
        case 0xC:
          v7 = TransparencyGPBUInt64UInt64Dictionary;
          goto LABEL_63;
        case 5:
        case 8:
        case 0xA:
          v7 = TransparencyGPBUInt64Int64Dictionary;
          goto LABEL_63;
        case 6:
          v7 = TransparencyGPBUInt64DoubleDictionary;
          goto LABEL_63;
        case 0xD:
        case 0xE:
        case 0xF:
          v7 = TransparencyGPBUInt64ObjectDictionary;
          goto LABEL_63;
        case 0x10:
          return result;
        case 0x11:
          v8 = TransparencyGPBUInt64EnumDictionary;
          goto LABEL_72;
        default:
          goto LABEL_64;
      }
    case 5u:
    case 8u:
    case 0xAu:
      result = 0;
      switch(*(_BYTE *)(a1[1] + 30))
      {
        case 0:
          v7 = TransparencyGPBInt64BoolDictionary;
          goto LABEL_63;
        case 1:
        case 0xB:
          v7 = TransparencyGPBInt64UInt32Dictionary;
          goto LABEL_63;
        case 2:
        case 7:
        case 9:
          v7 = TransparencyGPBInt64Int32Dictionary;
          goto LABEL_63;
        case 3:
          v7 = TransparencyGPBInt64FloatDictionary;
          goto LABEL_63;
        case 4:
        case 0xC:
          v7 = TransparencyGPBInt64UInt64Dictionary;
          goto LABEL_63;
        case 5:
        case 8:
        case 0xA:
          v7 = TransparencyGPBInt64Int64Dictionary;
          goto LABEL_63;
        case 6:
          v7 = TransparencyGPBInt64DoubleDictionary;
          goto LABEL_63;
        case 0xD:
        case 0xE:
        case 0xF:
          v7 = TransparencyGPBInt64ObjectDictionary;
          goto LABEL_63;
        case 0x10:
          return result;
        case 0x11:
          v8 = TransparencyGPBInt64EnumDictionary;
          goto LABEL_72;
        default:
          goto LABEL_64;
      }
    case 0xEu:
      result = 0;
      switch(*(_BYTE *)(a1[1] + 30))
      {
        case 0:
          v7 = TransparencyGPBStringBoolDictionary;
          goto LABEL_63;
        case 1:
        case 0xB:
          v7 = TransparencyGPBStringUInt32Dictionary;
          goto LABEL_63;
        case 2:
        case 7:
        case 9:
          v7 = TransparencyGPBStringInt32Dictionary;
          goto LABEL_63;
        case 3:
          v7 = TransparencyGPBStringFloatDictionary;
          goto LABEL_63;
        case 4:
        case 0xC:
          v7 = TransparencyGPBStringUInt64Dictionary;
          goto LABEL_63;
        case 5:
        case 8:
        case 0xA:
          v7 = TransparencyGPBStringInt64Dictionary;
          goto LABEL_63;
        case 6:
          v7 = TransparencyGPBStringDoubleDictionary;
LABEL_63:
          result = (TransparencyGPBAutocreatedDictionary *)objc_alloc_init(v7);
          goto LABEL_64;
        case 0xD:
        case 0xE:
        case 0xF:
          if (a2)
          {
            result = objc_alloc_init(TransparencyGPBAutocreatedDictionary);
            goto LABEL_67;
          }
          result = (TransparencyGPBAutocreatedDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          break;
        case 0x10:
          return result;
        case 0x11:
          v8 = TransparencyGPBStringEnumDictionary;
LABEL_72:
          result = (TransparencyGPBAutocreatedDictionary *)objc_msgSend([v8 alloc], "initWithValidationFunction:", objc_msgSend(objc_msgSend(a1, "enumDescriptor"), "enumVerifier"));
          if (a2)
            goto LABEL_65;
          return result;
        default:
          goto LABEL_64;
      }
      break;
    default:
LABEL_64:
      if (a2)
      {
LABEL_65:
        if (v4 == 14 && (v6 - 13) <= 3)
LABEL_67:
          v9 = &OBJC_IVAR___TransparencyGPBAutocreatedDictionary__autocreator;
        else
          v9 = &OBJC_IVAR___TransparencyGPBInt32Int32Dictionary__autocreator;
        *(Class *)((char *)&result->super.super.super.isa + *v9) = a2;
      }
      break;
  }
  return result;
}

TransparencyGPBAutocreatedArray *sub_1000C5CD8(_QWORD *a1, objc_class *a2)
{
  int v3;
  TransparencyGPBAutocreatedArray *result;
  __objc2_class *v5;
  int *v6;

  v3 = *(unsigned __int8 *)(a1[1] + 30);
  switch(*(_BYTE *)(a1[1] + 30))
  {
    case 0:
      v5 = TransparencyGPBBoolArray;
      goto LABEL_14;
    case 1:
    case 0xB:
      v5 = TransparencyGPBUInt32Array;
      goto LABEL_14;
    case 2:
    case 7:
    case 9:
      v5 = TransparencyGPBInt32Array;
      goto LABEL_14;
    case 3:
      v5 = TransparencyGPBFloatArray;
      goto LABEL_14;
    case 4:
    case 0xC:
      v5 = TransparencyGPBUInt64Array;
      goto LABEL_14;
    case 5:
    case 8:
    case 0xA:
      v5 = TransparencyGPBInt64Array;
      goto LABEL_14;
    case 6:
      v5 = TransparencyGPBDoubleArray;
LABEL_14:
      result = (TransparencyGPBAutocreatedArray *)objc_alloc_init(v5);
      if (a2)
        goto LABEL_15;
      return result;
    case 0xD:
    case 0xE:
    case 0xF:
    case 0x10:
      if (!a2)
        return (TransparencyGPBAutocreatedArray *)objc_alloc_init((Class)NSMutableArray);
      result = objc_alloc_init(TransparencyGPBAutocreatedArray);
LABEL_16:
      v6 = &OBJC_IVAR___TransparencyGPBAutocreatedArray__autocreator;
LABEL_18:
      *(Class *)((char *)&result->super.super.super.isa + *v6) = a2;
      return result;
    case 0x11:
      result = -[TransparencyGPBEnumArray initWithValidationFunction:]([TransparencyGPBEnumArray alloc], "initWithValidationFunction:", objc_msgSend(objc_msgSend(a1, "enumDescriptor"), "enumVerifier"));
      if (!a2)
        return result;
      goto LABEL_15;
    default:
      result = 0;
      if (!a2)
        return result;
LABEL_15:
      if ((v3 - 13) <= 3)
        goto LABEL_16;
      v6 = &OBJC_IVAR___TransparencyGPBInt32Array__autocreator;
      goto LABEL_18;
  }
}

BOOL sub_1000C5E1C(uint64_t a1, uint64_t a2)
{
  return sub_1000C9A78(a2, *(_QWORD **)(a1 + 32));
}

id sub_1000C5E2C(uint64_t a1, uint64_t a2)
{
  return sub_1000C986C(a2, *(_QWORD **)(a1 + 32));
}

id sub_1000C5E3C(uint64_t a1, uint64_t a2)
{
  return sub_1000C986C(a2, *(_QWORD **)(a1 + 32));
}

float sub_1000C5E4C(uint64_t a1, uint64_t a2)
{
  return sub_1000C9DC4(a2, *(_QWORD **)(a1 + 32));
}

id sub_1000C5E5C(uint64_t a1, uint64_t a2)
{
  return sub_1000C9C5C(a2, *(_QWORD **)(a1 + 32));
}

id sub_1000C5E6C(uint64_t a1, uint64_t a2)
{
  return sub_1000C9C5C(a2, *(_QWORD **)(a1 + 32));
}

double sub_1000C5E7C(uint64_t a1, uint64_t a2)
{
  return sub_1000C9F44(a2, *(_QWORD **)(a1 + 32));
}

id sub_1000C5E8C(uint64_t a1, uint64_t a2)
{
  return sub_1000C986C(a2, *(_QWORD **)(a1 + 32));
}

id sub_1000C5E9C(uint64_t a1, uint64_t a2)
{
  return sub_1000C9C5C(a2, *(_QWORD **)(a1 + 32));
}

id sub_1000C5EAC(uint64_t a1, uint64_t a2)
{
  return sub_1000C986C(a2, *(_QWORD **)(a1 + 32));
}

id sub_1000C5EBC(uint64_t a1, uint64_t a2)
{
  return sub_1000C9C5C(a2, *(_QWORD **)(a1 + 32));
}

id sub_1000C5ECC(uint64_t a1, uint64_t a2)
{
  return sub_1000C986C(a2, *(_QWORD **)(a1 + 32));
}

id sub_1000C5EDC(uint64_t a1, uint64_t a2)
{
  return sub_1000C9C5C(a2, *(_QWORD **)(a1 + 32));
}

_QWORD *sub_1000C5EEC(uint64_t a1, uint64_t a2)
{
  return sub_1000C01A0(a2, *(_QWORD **)(a1 + 32));
}

_QWORD *sub_1000C5EFC(uint64_t a1, uint64_t a2)
{
  return sub_1000C01A0(a2, *(_QWORD **)(a1 + 32));
}

_QWORD *sub_1000C5F0C(uint64_t a1, uint64_t a2)
{
  return sub_1000C01A0(a2, *(_QWORD **)(a1 + 32));
}

_QWORD *sub_1000C5F1C(uint64_t a1, uint64_t a2)
{
  return sub_1000C01A0(a2, *(_QWORD **)(a1 + 32));
}

uint64_t sub_1000C5F2C(uint64_t a1, uint64_t a2)
{
  return sub_1000C9810(a2, *(_QWORD **)(a1 + 32));
}

id sub_1000C5F3C(uint64_t a1, _QWORD *a2, int a3)
{
  return sub_1000C9B2C(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_1000C5F4C(uint64_t a1, _QWORD *a2, int a3)
{
  return sub_1000C998C(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_1000C5F5C(uint64_t a1, _QWORD *a2, int a3)
{
  return sub_1000C998C(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_1000C5F6C(uint64_t a1, _QWORD *a2, float a3)
{
  return sub_1000C9E5C(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_1000C5F7C(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return sub_1000C9CE0(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_1000C5F8C(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return sub_1000C9CE0(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_1000C5F9C(uint64_t a1, _QWORD *a2, double a3)
{
  return sub_1000C9FDC(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_1000C5FAC(uint64_t a1, _QWORD *a2, int a3)
{
  return sub_1000C998C(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_1000C5FBC(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return sub_1000C9CE0(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_1000C5FCC(uint64_t a1, _QWORD *a2, int a3)
{
  return sub_1000C998C(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_1000C5FDC(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return sub_1000C9CE0(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_1000C5FEC(uint64_t a1, _QWORD *a2, int a3)
{
  return sub_1000C998C(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_1000C5FFC(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return sub_1000C9CE0(a2, *(_QWORD *)(a1 + 32), a3);
}

uint64_t sub_1000C600C(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_1000C95FC(a2, *(_QWORD **)(a1 + 32), objc_msgSend(a3, "copy"));
}

uint64_t sub_1000C6040(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_1000C95FC(a2, *(_QWORD **)(a1 + 32), objc_msgSend(a3, "copy"));
}

uint64_t sub_1000C6074(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_1000C95CC(a2, *(_QWORD **)(a1 + 32), a3);
}

uint64_t sub_1000C6084(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_1000C95CC(a2, *(_QWORD **)(a1 + 32), a3);
}

id sub_1000C6094(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return sub_1000C98F4(a2, *(void **)(a1 + 32), a3);
}

uint64_t sub_1000C614C(uint64_t a1, uint64_t a2)
{
  return a2;
}

CFStringRef sub_1000C6158(char *cStr)
{
  return CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
}

BOOL sub_1000C6174(const char *a1, const char *a2)
{
  return strcmp(a1, a2) == 0;
}

uint64_t sub_1000C6190(_BYTE *a1)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;

  LOBYTE(v1) = *a1;
  if (*a1)
  {
    v2 = 0;
    v3 = 1;
    do
    {
      v2 = (1025 * (v2 + (char)v1)) ^ ((1025 * (v2 + (char)v1)) >> 6);
      v1 = a1[v3++];
    }
    while (v1);
    v4 = 9 * v2;
  }
  else
  {
    v4 = 0;
  }
  return 32769 * (v4 ^ (v4 >> 11));
}

uint64_t sub_1000C6234(objc_class *a1, const char *a2)
{
  uint64_t result;
  uint64_t v5;
  char *v6;
  const char *Name;
  objc_class *MetaClass;
  void (*v9)(void);
  _QWORD block[5];

  result = (uint64_t)sub_1000C62F8(a1, a2);
  if (result)
  {
    v5 = result;
    v6 = sub_1000CA158("getClassValue", 0);
    Name = class_getName(a1);
    MetaClass = objc_getMetaClass(Name);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C6444;
    block[3] = &unk_10010BFE0;
    block[4] = v5;
    v9 = imp_implementationWithBlock(block);
    return class_addMethod(MetaClass, a2, v9, v6) || sub_1000CB344(MetaClass, a2);
  }
  return result;
}

const void *sub_1000C62F8(objc_class *a1, SEL sel)
{
  const char *Name;
  int v4;
  const void *Value;
  const char *v6;
  uint64_t v7;
  const char *v8;
  size_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  uint64_t v14;

  Name = sel_getName(sel);
  v4 = *(unsigned __int8 *)Name;
  if (v4 != 95)
  {
    v6 = Name;
    v7 = 1;
    if (!*Name)
    {
LABEL_6:
      v8 = class_getName(a1);
      v9 = strlen(v8);
      __chkstk_darwin(v9);
      v11 = (char *)&v14 - v10;
      bzero((char *)&v14 - v10, v12);
      memcpy(v11, v8, v9);
      v11[v9] = 95;
      memcpy(&v11[v9 + 1], v6, v7 - 1);
      v11[v9 + v7] = 0;
      os_unfair_lock_lock((os_unfair_lock_t)&unk_100131328);
      Value = CFDictionaryGetValue((CFDictionaryRef)qword_100131318, v11);
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_100131328);
      return Value;
    }
    while (v4 != 58)
    {
      v4 = Name[v7++];
      if (!v4)
        goto LABEL_6;
    }
  }
  return 0;
}

uint64_t sub_1000C6444(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

unint64_t sub_1000C6514()
{
  id v1;

  if (!atomic_load(&qword_100131338))
  {
    v1 = +[TransparencyGPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:flags:](TransparencyGPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:flags:", CFSTR("TransparencyGPBNullValue"), "NullValue", &unk_1000DF86C, 1, sub_1000C6590, 0);
    while (!__ldaxr(&qword_100131338))
    {
      if (!__stlxr((unint64_t)v1, &qword_100131338))
        return atomic_load(&qword_100131338);
    }
    __clrex();

  }
  return atomic_load(&qword_100131338);
}

BOOL sub_1000C6590(int a1)
{
  return a1 == 0;
}

uint64_t sub_1000C6690(uint64_t a1)
{
  return sub_1000C9A70(a1, objc_msgSend(+[TransparencyGPBValue descriptor](TransparencyGPBValue, "descriptor"), "fieldWithNumber:", 1));
}

uint64_t sub_1000C66C8(uint64_t a1, uint64_t a2)
{
  return sub_1000C9A74(a1, objc_msgSend(+[TransparencyGPBValue descriptor](TransparencyGPBValue, "descriptor"), "fieldWithNumber:", 1), a2);
}

void sub_1000C6708(uint64_t a1)
{
  sub_1000C9398(a1, (id *)objc_msgSend(objc_msgSend(+[TransparencyGPBValue descriptor](TransparencyGPBValue, "descriptor"), "oneofs"), "objectAtIndex:", 0));
}

unint64_t sub_1000C681C()
{
  id v1;

  if (!atomic_load(&qword_100131360))
  {
    v1 = +[TransparencyGPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:flags:](TransparencyGPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:flags:", CFSTR("TransparencyGPBSyntax"), "SyntaxProto2", &unk_1000DF88C, 2, sub_1000C6898, 0);
    while (!__ldaxr(&qword_100131360))
    {
      if (!__stlxr((unint64_t)v1, &qword_100131360))
        return atomic_load(&qword_100131360);
    }
    __clrex();

  }
  return atomic_load(&qword_100131360);
}

BOOL sub_1000C6898(unsigned int a1)
{
  return a1 < 2;
}

unint64_t sub_1000C68A4()
{
  id v1;

  if (!atomic_load(&qword_100131368))
  {
    v1 = +[TransparencyGPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:flags:](TransparencyGPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:flags:", CFSTR("TransparencyGPBField_Kind"), "TypeUnknown", &unk_1000DF968, 19, sub_1000C6920, 0);
    while (!__ldaxr(&qword_100131368))
    {
      if (!__stlxr((unint64_t)v1, &qword_100131368))
        return atomic_load(&qword_100131368);
    }
    __clrex();

  }
  return atomic_load(&qword_100131368);
}

BOOL sub_1000C6920(unsigned int a1)
{
  return a1 < 0x13;
}

unint64_t sub_1000C692C()
{
  id v1;

  if (!atomic_load(&qword_100131370))
  {
    v1 = +[TransparencyGPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:flags:](TransparencyGPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:flags:", CFSTR("TransparencyGPBField_Cardinality"), "CardinalityUnknown", &unk_1000DFA04, 4, sub_1000C69A8, 0);
    while (!__ldaxr(&qword_100131370))
    {
      if (!__stlxr((unint64_t)v1, &qword_100131370))
        return atomic_load(&qword_100131370);
    }
    __clrex();

  }
  return atomic_load(&qword_100131370);
}

BOOL sub_1000C69A8(unsigned int a1)
{
  return a1 < 4;
}

uint64_t sub_1000C6A20(uint64_t a1)
{
  return sub_1000C9A70(a1, objc_msgSend(+[TransparencyGPBType descriptor](TransparencyGPBType, "descriptor"), "fieldWithNumber:", 6));
}

uint64_t sub_1000C6A58(uint64_t a1, uint64_t a2)
{
  return sub_1000C9A74(a1, objc_msgSend(+[TransparencyGPBType descriptor](TransparencyGPBType, "descriptor"), "fieldWithNumber:", 6), a2);
}

uint64_t sub_1000C6B18(uint64_t a1)
{
  return sub_1000C9A70(a1, objc_msgSend(+[TransparencyGPBField descriptor](TransparencyGPBField, "descriptor"), "fieldWithNumber:", 1));
}

uint64_t sub_1000C6B50(uint64_t a1, uint64_t a2)
{
  return sub_1000C9A74(a1, objc_msgSend(+[TransparencyGPBField descriptor](TransparencyGPBField, "descriptor"), "fieldWithNumber:", 1), a2);
}

uint64_t sub_1000C6B90(uint64_t a1)
{
  return sub_1000C9A70(a1, objc_msgSend(+[TransparencyGPBField descriptor](TransparencyGPBField, "descriptor"), "fieldWithNumber:", 2));
}

uint64_t sub_1000C6BC8(uint64_t a1, uint64_t a2)
{
  return sub_1000C9A74(a1, objc_msgSend(+[TransparencyGPBField descriptor](TransparencyGPBField, "descriptor"), "fieldWithNumber:", 2), a2);
}

uint64_t sub_1000C6C74(uint64_t a1)
{
  return sub_1000C9A70(a1, objc_msgSend(+[TransparencyGPBEnum descriptor](TransparencyGPBEnum, "descriptor"), "fieldWithNumber:", 5));
}

uint64_t sub_1000C6CAC(uint64_t a1, uint64_t a2)
{
  return sub_1000C9A74(a1, objc_msgSend(+[TransparencyGPBEnum descriptor](TransparencyGPBEnum, "descriptor"), "fieldWithNumber:", 5), a2);
}

void sub_1000C74E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  _Block_object_dispose(&a44, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000C7510(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  result = sub_1000A0AE4(*(_DWORD *)(a1 + 40), a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1000C7548(uint64_t a1)
{
  uint64_t result;

  result = sub_1000A0A98(*(_DWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1000C7580(uint64_t a1)
{
  uint64_t result;

  result = sub_1000A0A00(*(_DWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

id sub_1000C7A20(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t%llu\n"), a2);
}

id sub_1000C7A4C(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t%u\n"), a2);
}

id sub_1000C7A78(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t%llu\n"), a2);
}

void sub_1000C7F00(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = objc_msgSend(a2, "copy");
  objc_msgSend(a3, "addField:", v4);

}

int sub_1000C8204(id a1, const void *a2, const void *a3)
{
  int v3;

  if (*(_QWORD *)a2 == *(_QWORD *)a3)
    v3 = 0;
  else
    v3 = -1;
  if (*(_QWORD *)a2 > *(_QWORD *)a3)
    return 1;
  else
    return v3;
}

int sub_1000C8374(id a1, const void *a2, const void *a3)
{
  int v3;

  if (*(_QWORD *)a2 == *(_QWORD *)a3)
    v3 = 0;
  else
    v3 = -1;
  if (*(_QWORD *)a2 > *(_QWORD *)a3)
    return 1;
  else
    return v3;
}

id sub_1000C843C(uint64_t a1, void *a2, _QWORD *a3)
{
  id result;

  result = objc_msgSend(a2, "serializedSize");
  *a3 += result;
  return result;
}

id sub_1000C8484(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "writeAsMessageSetExtensionToOutput:");
}

id sub_1000C84C4(uint64_t a1, void *a2, _QWORD *a3)
{
  id result;

  result = objc_msgSend(a2, "serializedSizeAsMessageSetExtension");
  *a3 += result;
  return result;
}

void sub_1000C86B0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = objc_msgSend(a2, "number");
  if (!(_DWORD)v5)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Zero is not a valid field number."));
  v6 = objc_msgSend(a3, "mutableFieldForNumber:create:", v5, 0);
  if (v6)
  {
    _objc_msgSend(v6, "mergeFromField:", a2);
  }
  else
  {
    v7 = objc_msgSend(a2, "copy");
    objc_msgSend(a3, "addField:", v7);

  }
}

uint64_t sub_1000C8AFC()
{
  if (qword_1001313A0 != -1)
    dispatch_once(&qword_1001313A0, &stru_10010C0B0);
  return qword_1001313A8;
}

void sub_1000C8B3C(id a1)
{
  qword_1001313A8 = (uint64_t)objc_alloc_init((Class)NSData);
}

id sub_1000C8B60(id result)
{
  NSMutableArray *v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  _QWORD *v10;
  unsigned int v11;
  _DWORD *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  void *v25;
  unsigned int v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];

  if (!result)
    return result;
  v1 = +[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", result);
  result = -[NSMutableArray count](v1, "count");
  if (!result)
    return result;
  do
  {
    v2 = -[NSMutableArray lastObject](v1, "lastObject");
    -[NSMutableArray removeLastObject](v1, "removeLastObject");
    objc_msgSend(v2, "setUnknownFields:", 0);
    v4 = objc_msgSend((id)objc_opt_class(v2, v3), "descriptor");
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v5 = (void *)v4[1];
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (!v6)
      goto LABEL_35;
    v7 = v6;
    v8 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        if (*(unsigned __int8 *)(v10[1] + 30) - 15 <= 1)
        {
          v11 = objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i), "fieldType");
          if (v11 == 2)
          {
            v17 = v2[8];
            if (v17)
              v18 = *(void **)(v17 + *(unsigned int *)(v10[1] + 24));
            else
              v18 = 0;
            switch(objc_msgSend(v10, "mapKeyDataType"))
            {
              case 0u:
                v37[0] = _NSConcreteStackBlock;
                v37[1] = 3221225472;
                v37[2] = sub_1000C9018;
                v37[3] = &unk_10010C0D8;
                v37[4] = v1;
                v19 = v37;
                goto LABEL_32;
              case 1u:
              case 0xBu:
                v36[0] = _NSConcreteStackBlock;
                v36[1] = 3221225472;
                v36[2] = sub_1000C9020;
                v36[3] = &unk_10010C100;
                v36[4] = v1;
                v19 = v36;
                goto LABEL_32;
              case 2u:
              case 7u:
              case 9u:
                v35[0] = _NSConcreteStackBlock;
                v35[1] = 3221225472;
                v35[2] = sub_1000C9028;
                v35[3] = &unk_10010C128;
                v35[4] = v1;
                v19 = v35;
                goto LABEL_32;
              case 4u:
              case 0xCu:
                v34[0] = _NSConcreteStackBlock;
                v34[1] = 3221225472;
                v34[2] = sub_1000C9030;
                v34[3] = &unk_10010C150;
                v34[4] = v1;
                v19 = v34;
                goto LABEL_32;
              case 5u:
              case 8u:
              case 0xAu:
                v33[0] = _NSConcreteStackBlock;
                v33[1] = 3221225472;
                v33[2] = sub_1000C9038;
                v33[3] = &unk_10010C178;
                v33[4] = v1;
                v19 = v33;
                goto LABEL_32;
              case 0xEu:
                v32[0] = _NSConcreteStackBlock;
                v32[1] = 3221225472;
                v32[2] = sub_1000C9040;
                v32[3] = &unk_10010C1A0;
                v32[4] = v1;
                v19 = v32;
LABEL_32:
                objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v19);
                break;
              default:
                continue;
            }
          }
          else if (v11 == 1)
          {
            v15 = v2[8];
            if (v15)
              v16 = *(void **)(v15 + *(unsigned int *)(v10[1] + 24));
            else
              v16 = 0;
            if (objc_msgSend(v16, "count"))
              -[NSMutableArray addObjectsFromArray:](v1, "addObjectsFromArray:", v16);
          }
          else
          {
            if (v11)
              continue;
            v12 = (_DWORD *)v10[1];
            v13 = v12[5];
            if ((v13 & 0x80000000) != 0)
            {
              v14 = v2[8];
              if (*(_DWORD *)(v14 + 4 * -(int)v13) != v12[4])
                continue;
LABEL_23:
              -[NSMutableArray addObject:](v1, "addObject:", *(_QWORD *)(v14 + v12[6]));
              continue;
            }
            v14 = v2[8];
            if (((*(_DWORD *)(v14 + ((v13 >> 3) & 0x1FFFFFFC)) >> v13) & 1) != 0)
              goto LABEL_23;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v7);
LABEL_35:
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v20 = objc_msgSend(v2, "extensionsCurrentlySet", 0);
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(_QWORD *)v29 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j);
          if (objc_msgSend(v25, "dataType") - 15 <= 1)
          {
            v26 = objc_msgSend(v25, "isRepeated");
            v27 = objc_msgSend(v2, "getExtension:", v25);
            if (v26)
              -[NSMutableArray addObjectsFromArray:](v1, "addObjectsFromArray:", v27);
            else
              -[NSMutableArray addObject:](v1, "addObject:", v27);
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
      }
      while (v22);
    }
    result = -[NSMutableArray count](v1, "count");
  }
  while (result);
  return result;
}

uint64_t sub_1000C8FE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
    return *(_QWORD *)(v2 + *(unsigned int *)(*(_QWORD *)(a2 + 8) + 24));
  else
    return 0;
}

id sub_1000C9018(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

id sub_1000C9020(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

id sub_1000C9028(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

id sub_1000C9030(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

id sub_1000C9038(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

id sub_1000C9040(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

id sub_1000C9048(id result)
{
  if ((int)result >= 30008)
    return +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Linked to ProtocolBuffer runtime version %d, but code compiled needing at least %d!"), 30007, result);
  if ((int)result <= 30000)
    return +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Proto generation source compiled against runtime version %d, but this version of the runtime only supports back to %d!"), result, 30001);
  return result;
}

id sub_1000C90CC()
{
  return +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Proto generation source appears to have been from a version newer that this runtime (%d)."), 30007);
}

id sub_1000C910C(id result)
{
  uint64_t v1;
  uint64_t v2;

  if ((_DWORD)result != 30001)
    return +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Linked to ProtocolBuffer runtime version %d, but code compiled with version %d!"), 30001, result, v1, v2);
  return result;
}

BOOL sub_1000C915C(void *a1, uint64_t a2)
{
  return sub_1000C9190((uint64_t)a1, (uint64_t)objc_msgSend(objc_msgSend(a1, "descriptor"), "fieldWithNumber:", a2));
}

BOOL sub_1000C9190(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  v2 = 0;
  if (a1 && a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    if ((*(_WORD *)(v3 + 28) & 0xF02) != 0)
    {
      v4 = *(_QWORD *)(a1 + 64);
      if (v4)
        v5 = *(void **)(v4 + *(unsigned int *)(v3 + 24));
      else
        v5 = 0;
      return objc_msgSend(v5, "count") != 0;
    }
    else
    {
      v6 = *(unsigned int *)(v3 + 20);
      if ((v6 & 0x80000000) != 0)
        return *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * -(int)v6) == *(_DWORD *)(v3 + 16);
      else
        return (*(_DWORD *)(*(_QWORD *)(a1 + 64) + ((v6 >> 3) & 0x1FFFFFFC)) >> v6) & 1;
    }
  }
  return v2;
}

void sub_1000C9258(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(unsigned int *)(v3 + 20);
  if ((v4 & 0x80000000) != 0)
  {
    v5 = *(_QWORD *)(a1 + 64);
    if (*(_DWORD *)(v5 + 4 * -(int)v4) != *(_DWORD *)(v3 + 16))
      return;
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 64);
    if (((*(_DWORD *)(v5 + ((v4 >> 3) & 0x1FFFFFFC)) >> v4) & 1) == 0)
      return;
  }
  if ((*(_WORD *)(v3 + 28) & 0xF02) != 0 || *(unsigned __int8 *)(v3 + 30) - 13 <= 3)
  {
    v6 = *(unsigned int *)(v3 + 24);

    *(_QWORD *)(v5 + v6) = 0;
    LODWORD(v4) = *(_DWORD *)(v3 + 20);
  }
  v7 = *(_QWORD *)(a1 + 64);
  if ((v4 & 0x80000000) != 0)
    *(_DWORD *)(v7 + 4 * -(int)v4) = 0;
  else
    *(_DWORD *)(v7 + 4 * (v4 >> 5)) &= ~(1 << v4);
}

uint64_t sub_1000C9344(uint64_t result, unsigned int a2, int a3, int a4)
{
  uint64_t v4;
  unsigned int v5;
  int v6;
  int v7;

  v4 = *(_QWORD *)(result + 64);
  if ((a2 & 0x80000000) != 0)
  {
    if (!a4)
      a3 = 0;
    *(_DWORD *)(v4 + 4 * -a2) = a3;
  }
  else
  {
    v5 = a2 >> 5;
    v6 = 1 << a2;
    if (a4)
      v7 = *(_DWORD *)(v4 + 4 * v5) | v6;
    else
      v7 = *(_DWORD *)(v4 + 4 * v5) & ~v6;
    *(_DWORD *)(v4 + 4 * v5) = v7;
  }
  return result;
}

void sub_1000C9398(uint64_t a1, id *a2)
{
  sub_1000C93F0(a1, a2, *(_DWORD *)(*((_QWORD *)objc_msgSend(a2[2], "objectAtIndexedSubscript:", 0) + 1) + 20), 0);
}

void sub_1000C93F0(uint64_t a1, void *a2, unsigned int a3, int a4)
{
  int v5;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a1 + 64) - 4 * (int)a3);
  if (v5 != a4 && v5 != 0)
  {
    v8 = objc_msgSend(a2, "fieldWithNumber:");
    if (v8)
    {
      v9 = v8[1];
      if ((*(_WORD *)(v9 + 28) & 0xF02) != 0 || *(unsigned __int8 *)(v9 + 30) - 13 <= 3)
      {
        v10 = *(_QWORD *)(a1 + 64);
        v11 = *(unsigned int *)(v9 + 24);

        *(_QWORD *)(v10 + v11) = 0;
      }
    }
    v12 = *(_QWORD *)(a1 + 64);
    if ((a3 & 0x80000000) != 0)
      *(_DWORD *)(v12 + 4 * -a3) = 0;
    else
      *(_DWORD *)(v12 + 4 * (a3 >> 5)) &= ~(1 << a3);
  }
}

BOOL sub_1000C94C8(uint64_t a1, unsigned int a2, int a3)
{
  if ((a2 & 0x80000000) != 0)
    return *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * -a2) == a3;
  else
    return (*(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * (a2 >> 5)) >> a2) & 1;
}

uint64_t sub_1000C9514(uint64_t a1, int a2)
{
  return *(unsigned int *)(*(_QWORD *)(a1 + 64) - 4 * a2);
}

void sub_1000C9530(uint64_t a1, uint64_t a2)
{
  _DWORD *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v2 = *(_DWORD **)(a2 + 8);
  v3 = v2[5];
  if ((v3 & 0x80000000) == 0)
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (((*(_DWORD *)(v4 + ((v3 >> 3) & 0x1FFFFFFC)) >> v3) & 1) != 0)
      return;
LABEL_5:
    v5 = v2[6];
    v6 = *(_QWORD *)(v4 + v5);
    v7 = (id)v6;
    *(_QWORD *)(v4 + v5) = 0;
    sub_1000BF288(v6);

    return;
  }
  v4 = *(_QWORD *)(a1 + 64);
  if (*(_DWORD *)(v4 + 4 * -(int)v3) != v2[4])
    goto LABEL_5;
}

uint64_t sub_1000C95CC(uint64_t a1, _QWORD *a2, void *a3)
{
  return sub_1000C95FC(a1, a2, a3);
}

uint64_t sub_1000C95FC(uint64_t a1, _QWORD *a2, void *a3)
{
  void *v3;
  uint64_t v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  void *v15;
  _BOOL4 v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v3 = a3;
  v6 = a2[1];
  v7 = *(unsigned __int8 *)(v6 + 30);
  v8 = *(_WORD *)(v6 + 28);
  if ((v8 & 0xF02) != 0)
  {
    v9 = *(_QWORD *)(a1 + 64);
    v10 = *(unsigned int *)(v6 + 24);
    v11 = *(char **)(v9 + v10);
    *(_QWORD *)(v9 + v10) = a3;
    if (v11)
    {
      if (objc_msgSend(a2, "fieldType") == 1)
      {
        if ((v7 - 13) <= 3)
        {
          v13 = objc_opt_class(TransparencyGPBAutocreatedArray, v12);
          if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
          {
            v14 = &OBJC_IVAR___TransparencyGPBAutocreatedArray__autocreator;
            goto LABEL_29;
          }
LABEL_31:

          return sub_1000BEF7C(a1);
        }
        v14 = &OBJC_IVAR___TransparencyGPBInt32Array__autocreator;
      }
      else if (objc_msgSend(a2, "mapKeyDataType") == 14 && (v7 - 13) <= 3)
      {
        v22 = objc_opt_class(TransparencyGPBAutocreatedDictionary, v21);
        if ((objc_opt_isKindOfClass(v11, v22) & 1) == 0)
          goto LABEL_31;
        v14 = &OBJC_IVAR___TransparencyGPBAutocreatedDictionary__autocreator;
      }
      else
      {
        v14 = &OBJC_IVAR___TransparencyGPBInt32Int32Dictionary__autocreator;
      }
LABEL_29:
      v26 = *v14;
      if (*(_QWORD *)&v11[v26] == a1)
        *(_QWORD *)&v11[v26] = 0;
      goto LABEL_31;
    }
  }
  else
  {
    v15 = (void *)a2[2];
    if (v15)
    {
      sub_1000C93F0(a1, v15, *(_DWORD *)(v6 + 20), *(_DWORD *)(v6 + 16));
      v8 = *(_WORD *)(v6 + 28);
    }
    v16 = v3 != 0;
    if ((v8 & 0x20) != 0 && !objc_msgSend(v3, "length"))
    {

      v16 = 0;
      v3 = 0;
    }
    v17 = *(unsigned int *)(v6 + 20);
    v18 = *(_QWORD *)(a1 + 64);
    if ((v17 & 0x80000000) != 0)
    {
      v23 = *(_DWORD *)(v6 + 16);
      if (!v16)
        v23 = 0;
      *(_DWORD *)(v18 + 4 * -(int)v17) = v23;
    }
    else
    {
      v19 = v17 >> 5;
      v20 = 1 << v17;
      if (v16)
        *(_DWORD *)(v18 + 4 * v19) |= v20;
      else
        *(_DWORD *)(v18 + 4 * v19) &= ~v20;
    }
    v24 = *(_QWORD *)(a1 + 64);
    v25 = *(unsigned int *)(v6 + 24);
    v11 = *(char **)(v24 + v25);
    *(_QWORD *)(v24 + v25) = v3;
    if (v11)
    {
      if ((v7 - 15) <= 1 && sub_1000BEF6C((uint64_t)v11, a1))
        sub_1000BF288((uint64_t)v11);
      goto LABEL_31;
    }
  }
  return sub_1000BEF7C(a1);
}

uint64_t sub_1000C9810(uint64_t a1, _QWORD *a2)
{
  id v3;

  v3 = sub_1000C986C(a1, a2);
  if ((*(_WORD *)(a2[1] + 28) & 0x1000) == 0)
  {
    if (objc_msgSend(a2, "isValidEnumValue:", v3))
      return v3;
    else
      return 4222467823;
  }
  return (uint64_t)v3;
}

id sub_1000C986C(uint64_t a1, _QWORD *a2)
{
  _DWORD *v2;
  unint64_t v3;
  uint64_t v4;

  v2 = (_DWORD *)a2[1];
  v3 = v2[5];
  if ((v3 & 0x80000000) != 0)
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (*(_DWORD *)(v4 + 4 * -(int)v3) == v2[4])
      return (id)*(unsigned int *)(v4 + v2[6]);
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (((*(_DWORD *)(v4 + ((v3 >> 3) & 0x1FFFFFFC)) >> v3) & 1) != 0)
      return (id)*(unsigned int *)(v4 + v2[6]);
  }
  return objc_msgSend(a2, "defaultValue");
}

id sub_1000C98F4(_QWORD *a1, void *a2, uint64_t a3)
{
  uint64_t v6;

  if ((objc_msgSend(a2, "isValidEnumValue:") & 1) == 0)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("%@.%@: Attempt to set an unknown enum value (%d)"), objc_opt_class(a1, v6), objc_msgSend(a2, "name"), a3);
  return sub_1000C998C(a1, (uint64_t)a2, a3);
}

id sub_1000C998C(_QWORD *a1, uint64_t a2, int a3)
{
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  int v13;

  v6 = *(void **)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 8);
  if (v6)
    sub_1000C93F0((uint64_t)a1, v6, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16));
  *(_DWORD *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  if (a3)
    v8 = 1;
  else
    v8 = (*(_WORD *)(v7 + 28) & 0x20) == 0;
  v9 = *(unsigned int *)(v7 + 20);
  v10 = a1[8];
  if ((v9 & 0x80000000) != 0)
  {
    if (v8)
      v13 = *(_DWORD *)(v7 + 16);
    else
      v13 = 0;
    *(_DWORD *)(v10 + 4 * -(int)v9) = v13;
  }
  else
  {
    v11 = v9 >> 5;
    v12 = 1 << v9;
    if (v8)
      *(_DWORD *)(v10 + 4 * v11) |= v12;
    else
      *(_DWORD *)(v10 + 4 * v11) &= ~v12;
  }
  return sub_1000BEF7C(a1);
}

BOOL sub_1000C9A78(uint64_t a1, _QWORD *a2)
{
  _DWORD *v2;
  int v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v2 = (_DWORD *)a2[1];
  v3 = v2[4];
  v4 = v2[5];
  if ((v4 & 0x80000000) == 0)
  {
    v5 = *(_QWORD *)(a1 + 64);
    if (((*(_DWORD *)(v5 + ((v4 >> 3) & 0x1FFFFFFC)) >> v4) & 1) != 0)
      goto LABEL_3;
    return (unint64_t)objc_msgSend(a2, "defaultValue") & 1;
  }
  v5 = *(_QWORD *)(a1 + 64);
  if (*(_DWORD *)(v5 + 4 * -(int)v4) != v3)
    return (unint64_t)objc_msgSend(a2, "defaultValue") & 1;
LABEL_3:
  v6 = v2[6];
  if ((v6 & 0x80000000) != 0)
    return *(_DWORD *)(v5 + 4 * -(int)v6) == v3;
  else
    return (*(_DWORD *)(v5 + ((v6 >> 3) & 0x1FFFFFFC)) >> v6) & 1;
}

_QWORD *sub_1000C9B1C(_QWORD *a1, uint64_t a2, int a3)
{
  if (a1)
  {
    if (a2)
      return sub_1000C9B2C(a1, a2, a3);
  }
  return a1;
}

id sub_1000C9B2C(_QWORD *a1, uint64_t a2, int a3)
{
  uint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int v10;
  int v11;
  _BOOL4 v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  int v17;

  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(void **)(a2 + 16);
  if (v6)
    sub_1000C93F0((uint64_t)a1, v6, *(_DWORD *)(v5 + 20), *(_DWORD *)(v5 + 16));
  v7 = *(unsigned int *)(v5 + 24);
  v8 = a1[8];
  if ((v7 & 0x80000000) != 0)
  {
    v11 = *(_DWORD *)(v5 + 16);
    if (!a3)
      v11 = 0;
    *(_DWORD *)(v8 + 4 * -(int)v7) = v11;
    if ((a3 & 1) != 0)
      goto LABEL_9;
  }
  else
  {
    v9 = v7 >> 5;
    v10 = 1 << v7;
    if (a3)
    {
      *(_DWORD *)(v8 + 4 * v9) |= v10;
LABEL_9:
      v12 = 1;
      goto LABEL_12;
    }
    *(_DWORD *)(v8 + 4 * v9) &= ~v10;
  }
  v12 = (*(_WORD *)(v5 + 28) & 0x20) == 0;
LABEL_12:
  v13 = *(unsigned int *)(v5 + 20);
  v14 = a1[8];
  if ((v13 & 0x80000000) != 0)
  {
    if (v12)
      v17 = *(_DWORD *)(v5 + 16);
    else
      v17 = 0;
    *(_DWORD *)(v14 + 4 * -(int)v13) = v17;
  }
  else
  {
    v15 = v13 >> 5;
    v16 = 1 << v13;
    if (v12)
      *(_DWORD *)(v14 + 4 * v15) |= v16;
    else
      *(_DWORD *)(v14 + 4 * v15) &= ~v16;
  }
  return sub_1000BEF7C(a1);
}

_QWORD *sub_1000C9C4C(_QWORD *a1, uint64_t a2, int a3)
{
  if (a1)
  {
    if (a2)
      return sub_1000C998C(a1, a2, a3);
  }
  return a1;
}

id sub_1000C9C5C(uint64_t a1, _QWORD *a2)
{
  _DWORD *v2;
  unint64_t v3;
  uint64_t v4;

  v2 = (_DWORD *)a2[1];
  v3 = v2[5];
  if ((v3 & 0x80000000) != 0)
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (*(_DWORD *)(v4 + 4 * -(int)v3) == v2[4])
      return *(id *)(v4 + v2[6]);
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (((*(_DWORD *)(v4 + ((v3 >> 3) & 0x1FFFFFFC)) >> v3) & 1) != 0)
      return *(id *)(v4 + v2[6]);
  }
  return objc_msgSend(a2, "defaultValue");
}

_QWORD *sub_1000C9CD0(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a2)
      return sub_1000C9CE0(a1, a2, a3);
  }
  return a1;
}

id sub_1000C9CE0(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  int v13;

  v6 = *(void **)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 8);
  if (v6)
    sub_1000C93F0((uint64_t)a1, v6, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16));
  *(_QWORD *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  if (a3)
    v8 = 1;
  else
    v8 = (*(_WORD *)(v7 + 28) & 0x20) == 0;
  v9 = *(unsigned int *)(v7 + 20);
  v10 = a1[8];
  if ((v9 & 0x80000000) != 0)
  {
    if (v8)
      v13 = *(_DWORD *)(v7 + 16);
    else
      v13 = 0;
    *(_DWORD *)(v10 + 4 * -(int)v9) = v13;
  }
  else
  {
    v11 = v9 >> 5;
    v12 = 1 << v9;
    if (v8)
      *(_DWORD *)(v10 + 4 * v11) |= v12;
    else
      *(_DWORD *)(v10 + 4 * v11) &= ~v12;
  }
  return sub_1000BEF7C(a1);
}

float sub_1000C9DC4(uint64_t a1, _QWORD *a2)
{
  _DWORD *v2;
  unint64_t v3;
  uint64_t v4;
  float result;

  v2 = (_DWORD *)a2[1];
  v3 = v2[5];
  if ((v3 & 0x80000000) != 0)
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (*(_DWORD *)(v4 + 4 * -(int)v3) == v2[4])
      return *(float *)(v4 + v2[6]);
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (((*(_DWORD *)(v4 + ((v3 >> 3) & 0x1FFFFFFC)) >> v3) & 1) != 0)
      return *(float *)(v4 + v2[6]);
  }
  LODWORD(result) = objc_msgSend(a2, "defaultValue");
  return result;
}

_QWORD *sub_1000C9E4C(_QWORD *a1, uint64_t a2, float a3)
{
  if (a1)
  {
    if (a2)
      return sub_1000C9E5C(a1, a2, a3);
  }
  return a1;
}

id sub_1000C9E5C(_QWORD *a1, uint64_t a2, float a3)
{
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  int v13;

  v6 = *(void **)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 8);
  if (v6)
    sub_1000C93F0((uint64_t)a1, v6, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16));
  *(float *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  v8 = a3 != 0.0 || (*(_WORD *)(v7 + 28) & 0x20) == 0;
  v9 = *(unsigned int *)(v7 + 20);
  v10 = a1[8];
  if ((v9 & 0x80000000) != 0)
  {
    if (v8)
      v13 = *(_DWORD *)(v7 + 16);
    else
      v13 = 0;
    *(_DWORD *)(v10 + 4 * -(int)v9) = v13;
  }
  else
  {
    v11 = v9 >> 5;
    v12 = 1 << v9;
    if (v8)
      *(_DWORD *)(v10 + 4 * v11) |= v12;
    else
      *(_DWORD *)(v10 + 4 * v11) &= ~v12;
  }
  return sub_1000BEF7C(a1);
}

double sub_1000C9F44(uint64_t a1, _QWORD *a2)
{
  _DWORD *v2;
  unint64_t v3;
  uint64_t v4;

  v2 = (_DWORD *)a2[1];
  v3 = v2[5];
  if ((v3 & 0x80000000) != 0)
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (*(_DWORD *)(v4 + 4 * -(int)v3) == v2[4])
      return *(double *)(v4 + v2[6]);
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (((*(_DWORD *)(v4 + ((v3 >> 3) & 0x1FFFFFFC)) >> v3) & 1) != 0)
      return *(double *)(v4 + v2[6]);
  }
  return COERCE_DOUBLE(objc_msgSend(a2, "defaultValue"));
}

_QWORD *sub_1000C9FCC(_QWORD *a1, uint64_t a2, double a3)
{
  if (a1)
  {
    if (a2)
      return sub_1000C9FDC(a1, a2, a3);
  }
  return a1;
}

id sub_1000C9FDC(_QWORD *a1, uint64_t a2, double a3)
{
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  int v13;

  v6 = *(void **)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 8);
  if (v6)
    sub_1000C93F0((uint64_t)a1, v6, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16));
  *(double *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  v8 = a3 != 0.0 || (*(_WORD *)(v7 + 28) & 0x20) == 0;
  v9 = *(unsigned int *)(v7 + 20);
  v10 = a1[8];
  if ((v9 & 0x80000000) != 0)
  {
    if (v8)
      v13 = *(_DWORD *)(v7 + 16);
    else
      v13 = 0;
    *(_DWORD *)(v10 + 4 * -(int)v9) = v13;
  }
  else
  {
    v11 = v9 >> 5;
    v12 = 1 << v9;
    if (v8)
      *(_DWORD *)(v10 + 4 * v11) |= v12;
    else
      *(_DWORD *)(v10 + 4 * v11) &= ~v12;
  }
  return sub_1000BEF7C(a1);
}

uint64_t sub_1000CA0C8(uint64_t result, _QWORD *a2, void *a3)
{
  if (result)
  {
    if (a2)
      return sub_1000C95FC(result, a2, objc_msgSend(a3, "copy"));
  }
  return result;
}

uint64_t sub_1000CA114(uint64_t result, _QWORD *a2, void *a3)
{
  if (result)
  {
    if (a2)
      return sub_1000C95FC(result, a2, a3);
  }
  return result;
}

char *sub_1000CA158(const char *a1, BOOL a2)
{
  Protocol *Protocol;

  Protocol = objc_getProtocol("TransparencyGPBMessageSignatureProtocol");
  return protocol_getMethodDescription(Protocol, a1, 0, a2).types;
}

__CFString *sub_1000CA198(void *a1, __CFString *a2)
{
  __CFString *v2;
  __CFString *v4;

  v2 = &stru_10010E2C8;
  if (a1)
  {
    if (a2)
      v4 = a2;
    else
      v4 = &stru_10010E2C8;
    v2 = (__CFString *)+[NSMutableString string](NSMutableString, "string");
    sub_1000CA1F4(a1, v2, v4);
  }
  return v2;
}

id sub_1000CA1F4(void *a1, void *a2, __CFString *a3)
{
  _QWORD *v6;
  char *v7;
  _QWORD *v8;
  unsigned int v9;
  id v10;
  BOOL v11;
  void *v12;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t *v17;
  char *v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  unint64_t v22;
  unsigned int v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  NSString *v27;
  const __CFString *v28;
  unsigned int v29;
  int v30;
  NSString *v31;
  NSString *v32;
  NSString *v33;
  const char *v34;
  NSString *v35;
  uint64_t v36;
  int v37;
  const char *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD *v43;
  unsigned int v44;
  float v45;
  double v46;
  _QWORD *v47;
  _QWORD *v48;
  id v49;
  void *v50;
  _QWORD *v51;
  const __CFString *v52;
  id v53;
  id v54;
  __CFString *v55;
  id result;
  uint64_t v57;
  NSString *v58;
  __CFString *v59;
  id v60;
  _QWORD *v61;
  char *v62;
  char *v63;
  unint64_t v64;
  unint64_t v65;
  void *v66;
  _QWORD *v67;
  _QWORD *v68;
  void **v69;
  uint64_t v70;
  id (*v71)(uint64_t, void *, void *);
  void *v72;
  void *v73;
  NSString *v74;
  NSString *v75;
  NSString *v76;
  NSString *v77;
  __CFString *v78;
  NSString *v79;
  NSString *v80;
  _QWORD *v81;
  char v82;
  char v83;
  _QWORD v84[3];
  char v85;

  v6 = objc_msgSend(a1, "descriptor");
  v66 = (void *)v6[1];
  v7 = (char *)objc_msgSend(v66, "count");
  v8 = objc_msgSend(v6, "extensionRanges");
  v9 = objc_msgSend(v6, "extensionRangesCount");
  v68 = a1;
  v10 = objc_msgSend(objc_msgSend(a1, "extensionsCurrentlySet"), "sortedArrayUsingSelector:", "compareByFieldNumber:");
  if (v7)
    v11 = 0;
  else
    v11 = v9 == 0;
  if (!v11)
  {
    v12 = v10;
    v13 = 0;
    v14 = 0;
    v15 = v9;
    v60 = v10;
    v61 = v8;
    v62 = v7;
    v64 = v9;
    v59 = a3;
    do
    {
      if (v14 == v7)
      {
        sub_1000CB3C4(v68, v12, v8[v13], a2, a3);
        v14 = v7;
        ++v13;
        continue;
      }
      if (v13 != v15)
      {
        v16 = objc_msgSend(v66, "objectAtIndexedSubscript:", v14);
        v17 = &v8[v13];
        if (*(_DWORD *)(v16[1] + 16) >= *(_DWORD *)v17)
        {
          ++v13;
          sub_1000CB3C4(v68, v12, *v17, a2, a3);
          continue;
        }
      }
      v18 = v14 + 1;
      v67 = objc_msgSend(v66, "objectAtIndexedSubscript:", v14);
      v19 = objc_msgSend(v67, "fieldType");
      v20 = v19;
      if (v19 == 2 || v19 == 1)
      {
        v65 = v13;
        v24 = v68[8];
        if (v24)
          v25 = *(void **)(v24 + *(unsigned int *)(v67[1] + 24));
        else
          v25 = 0;
        v26 = (unint64_t)objc_msgSend(v25, "count");
        if (v26)
          goto LABEL_21;
      }
      else
      {
        if (v19)
        {
          ++v14;
          v15 = v64;
          continue;
        }
        v21 = v67[1];
        v22 = *(unsigned int *)(v21 + 20);
        v65 = v13;
        if ((v22 & 0x80000000) != 0)
          v23 = *(_DWORD *)(v68[8] + 4 * -(int)v22) == *(_DWORD *)(v21 + 16);
        else
          v23 = (*(_DWORD *)(v68[8] + ((v22 >> 3) & 0x1FFFFFFC)) >> v22) & 1;
        v25 = 0;
        v26 = v23;
        if (v23)
        {
LABEL_21:
          v27 = (NSString *)objc_msgSend(v67, "textFormatName");
          if (-[NSString length](v27, "length"))
          {
            v28 = &stru_10010E2C8;
          }
          else
          {
            v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), *(unsigned int *)(v67[1] + 16));
            if (v26 < 2)
            {
              v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("  # %@"), objc_msgSend(v67, "name"));
            }
            else
            {
              objc_msgSend(a2, "appendFormat:", CFSTR("%@# %@\n"), a3, objc_msgSend(v67, "name"));
              v28 = &stru_10010E2C8;
            }
          }
          v63 = v18;
          if (v20 == 2)
          {
            v29 = objc_msgSend(v67, "mapKeyDataType");
            v30 = *(unsigned __int8 *)(v67[1] + 30);
            v58 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@ {%@\n"), a3, v27, v28);
            v31 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@ {\n"), a3, v27);
            v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@}\n"), a3);
            v33 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@  key: "), a3);
            v34 = ":";
            if ((v30 - 15) < 2)
              v34 = "";
            v35 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@  value%s "), a3, v34);
            v84[0] = 0;
            v84[1] = v84;
            v84[2] = 0x2020000000;
            v85 = 1;
            if (v29 == 14 && (v30 - 13) <= 3)
            {
              v69 = _NSConcreteStackBlock;
              v70 = 3221225472;
              v71 = sub_1000CB93C;
              v72 = &unk_10010C218;
              v73 = a2;
              v74 = v58;
              v75 = v31;
              v76 = v33;
              LOBYTE(v81) = v30;
              v77 = v35;
              v78 = a3;
              v79 = v32;
              v80 = (NSString *)v84;
              objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", &v69);
              v14 = v18;
            }
            else
            {
              v69 = _NSConcreteStackBlock;
              v70 = 3221225472;
              v71 = sub_1000CBA74;
              v72 = &unk_10010C240;
              v80 = v32;
              v81 = v84;
              v73 = a2;
              v74 = v58;
              v82 = v29;
              v75 = v31;
              v76 = v33;
              v83 = v30;
              v77 = v35;
              v78 = a3;
              v79 = (NSString *)v67;
              objc_msgSend(v25, "enumerateForTextFormat:", &v69);
              v14 = v18;
            }
            _Block_object_dispose(v84, 8);
            v8 = v61;
            v7 = v62;
            v12 = v60;
            v15 = v64;
            v13 = v65;
            continue;
          }
          v36 = 0;
          v37 = *(unsigned __int8 *)(v67[1] + 30);
          if ((v37 - 15) >= 2)
            v38 = ":";
          else
            v38 = "";
          do
          {
            objc_msgSend(a2, "appendFormat:", CFSTR("%@%@%s "), a3, v27, v38);
            switch(v37)
            {
              case 0:
                if (v25)
                  v44 = objc_msgSend(v25, "valueAtIndex:", v36);
                else
                  v44 = sub_1000C9A78((uint64_t)v68, v67);
                if (v44)
                  v52 = CFSTR("true");
                else
                  v52 = CFSTR("false");
                objc_msgSend(a2, "appendString:", v52);
                break;
              case 1:
              case 11:
                if (v25)
                  v41 = objc_msgSend(v25, "valueAtIndex:", v36);
                else
                  v41 = sub_1000C986C((uint64_t)v68, v67);
                objc_msgSend(a2, "appendFormat:", CFSTR("%u"), v41, v57);
                break;
              case 2:
              case 7:
              case 9:
                if (v25)
                  v39 = objc_msgSend(v25, "valueAtIndex:", v36);
                else
                  v39 = sub_1000C986C((uint64_t)v68, v67);
                objc_msgSend(a2, "appendFormat:", CFSTR("%d"), v39, v57);
                break;
              case 3:
                if (v25)
                  objc_msgSend(v25, "valueAtIndex:", v36);
                else
                  v45 = sub_1000C9DC4((uint64_t)v68, v67);
                objc_msgSend(a2, "appendFormat:", CFSTR("%.*g"), 6, v45);
                break;
              case 4:
              case 12:
                if (v25)
                  v42 = objc_msgSend(v25, "valueAtIndex:", v36);
                else
                  v42 = sub_1000C9C5C((uint64_t)v68, v67);
                objc_msgSend(a2, "appendFormat:", CFSTR("%llu"), v42, v57);
                break;
              case 5:
              case 8:
              case 10:
                if (v25)
                  v40 = objc_msgSend(v25, "valueAtIndex:", v36);
                else
                  v40 = sub_1000C9C5C((uint64_t)v68, v67);
                objc_msgSend(a2, "appendFormat:", CFSTR("%lld"), v40, v57);
                break;
              case 6:
                if (v25)
                  objc_msgSend(v25, "valueAtIndex:", v36);
                else
                  v46 = sub_1000C9F44((uint64_t)v68, v67);
                objc_msgSend(a2, "appendFormat:", CFSTR("%.*lg"), 15, *(_QWORD *)&v46);
                break;
              case 13:
                if (v25)
                  v47 = objc_msgSend(v25, "objectAtIndex:", v36);
                else
                  v47 = sub_1000C01A0((uint64_t)v68, v67);
                sub_1000CAED0(v47, a2);
                break;
              case 14:
                if (v25)
                  v48 = objc_msgSend(v25, "objectAtIndex:", v36);
                else
                  v48 = sub_1000C01A0((uint64_t)v68, v67);
                sub_1000CB7B8(v48, a2);
                break;
              case 15:
              case 16:
                if (v25)
                  v43 = objc_msgSend(v25, "objectAtIndex:", v36);
                else
                  v43 = sub_1000C01A0((uint64_t)v68, v67);
                v51 = v43;
                objc_msgSend(a2, "appendFormat:", CFSTR("{%@\n"), v28);
                sub_1000CA1F4(v51, a2, -[__CFString stringByAppendingString:](a3, "stringByAppendingString:", CFSTR("  ")));
                objc_msgSend(a2, "appendFormat:", CFSTR("%@}"), a3);
                v28 = &stru_10010E2C8;
                break;
              case 17:
                if (v25)
                {
                  v49 = objc_msgSend(v25, "rawValueAtIndex:", v36);
                  v50 = v67;
                }
                else
                {
                  v50 = v67;
                  v49 = sub_1000C986C((uint64_t)v68, v67);
                }
                v53 = objc_msgSend(v50, "enumDescriptor");
                if (v53 && (v54 = objc_msgSend(v53, "textFormatNameForValue:", v49)) != 0)
                  objc_msgSend(a2, "appendString:", v54);
                else
                  objc_msgSend(a2, "appendFormat:", CFSTR("%d"), v49);
                a3 = v59;
                break;
              default:
                break;
            }
            objc_msgSend(a2, "appendFormat:", CFSTR("%@\n"), v28);
            ++v36;
          }
          while (v26 != v36);
          v7 = v62;
          v14 = v63;
          v12 = v60;
          v8 = v61;
          goto LABEL_92;
        }
      }
      v14 = v18;
LABEL_92:
      v15 = v64;
      v13 = v65;
    }
    while (v14 < v7 || v13 < v15);
  }
  v55 = sub_1000CAAA8(objc_msgSend(v68, "unknownFields"), a3);
  result = -[__CFString length](v55, "length");
  if (result)
  {
    objc_msgSend(a2, "appendFormat:", CFSTR("%@# --- Unknown fields ---\n"), a3);
    return objc_msgSend(a2, "appendString:", v55);
  }
  return result;
}

void sub_1000CAA8C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

__CFString *sub_1000CAAA8(void *a1, const __CFString *a2)
{
  __CFString *v2;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  uint64_t v22;
  id obj;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[6];
  int v38;
  _QWORD v39[6];
  int v40;
  _QWORD v41[6];
  int v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];

  v2 = &stru_10010E2C8;
  if (a1)
  {
    v4 = a2 ? (__CFString *)a2 : &stru_10010E2C8;
    v2 = (__CFString *)+[NSMutableString string](NSMutableString, "string");
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = objc_msgSend(a1, "sortedFields");
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v26)
    {
      v25 = *(_QWORD *)v44;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v44 != v25)
            objc_enumerationMutation(obj);
          v28 = v5;
          v6 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v5);
          v7 = objc_msgSend(v6, "number");
          v8 = objc_msgSend(v6, "varintList");
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_1000CAE28;
          v41[3] = &unk_10010C1C8;
          v41[4] = v2;
          v41[5] = v4;
          v42 = (int)v7;
          objc_msgSend(v8, "enumerateValuesWithBlock:", v41);
          v9 = objc_msgSend(v6, "fixed32List");
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_1000CAE60;
          v39[3] = &unk_10010C1F0;
          v39[4] = v2;
          v39[5] = v4;
          v40 = (int)v7;
          objc_msgSend(v9, "enumerateValuesWithBlock:", v39);
          v10 = objc_msgSend(v6, "fixed64List");
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_1000CAE98;
          v37[3] = &unk_10010C1C8;
          v37[4] = v2;
          v37[5] = v4;
          v38 = (int)v7;
          objc_msgSend(v10, "enumerateValuesWithBlock:", v37);
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          v27 = v6;
          v11 = objc_msgSend(v6, "lengthDelimitedList");
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v48, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v34;
            do
            {
              for (i = 0; i != v13; i = (char *)i + 1)
              {
                if (*(_QWORD *)v34 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
                -[__CFString appendFormat:](v2, "appendFormat:", CFSTR("%@%d: "), v4, v7);
                sub_1000CAED0(v16, v2);
                -[__CFString appendString:](v2, "appendString:", CFSTR("\n"));
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v48, 16);
            }
            while (v13);
          }
          v31 = 0u;
          v32 = 0u;
          v29 = 0u;
          v30 = 0u;
          v17 = objc_msgSend(v27, "groupList");
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v47, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v30;
            do
            {
              for (j = 0; j != v19; j = (char *)j + 1)
              {
                if (*(_QWORD *)v30 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j);
                -[__CFString appendFormat:](v2, "appendFormat:", CFSTR("%@%d: {\n"), v4, v7);
                -[__CFString appendString:](v2, "appendString:", sub_1000CAAA8(v22, -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("  "))));
                -[__CFString appendFormat:](v2, "appendFormat:", CFSTR("%@}\n"), v4);
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v47, 16);
            }
            while (v19);
          }
          v5 = v28 + 1;
        }
        while ((id)(v28 + 1) != v26);
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v26);
    }
  }
  return v2;
}

id sub_1000CAE28(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@%d: %llu\n"), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), a2);
}

id sub_1000CAE60(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@%d: 0x%X\n"), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), a2);
}

id sub_1000CAE98(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@%d: 0x%llX\n"), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), a2);
}

id sub_1000CAED0(void *a1, void *a2)
{
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;

  v4 = (char *)objc_msgSend(a1, "bytes");
  v5 = (uint64_t)objc_msgSend(a1, "length");
  objc_msgSend(a2, "appendString:", CFSTR("\""));
  if (v5 >= 1)
  {
    v6 = &v4[v5];
    do
    {
      v7 = *v4;
      if ((int)v7 > 33)
      {
        switch((_DWORD)v7)
        {
          case '"':
            v8 = a2;
            v9 = CFSTR("\\\"");
            goto LABEL_16;
          case '\'':
            v8 = a2;
            v9 = CFSTR("\\'");
            goto LABEL_16;
          case '\\':
            v8 = a2;
            v9 = CFSTR("\\\\");
            goto LABEL_16;
        }
      }
      else
      {
        switch((_DWORD)v7)
        {
          case 9:
            v8 = a2;
            v9 = CFSTR("\\t");
            goto LABEL_16;
          case 0xA:
            v8 = a2;
            v9 = CFSTR("\\n");
            goto LABEL_16;
          case 0xD:
            v8 = a2;
            v9 = CFSTR("\\r");
LABEL_16:
            objc_msgSend(v8, "appendString:", v9);
            goto LABEL_17;
        }
      }
      if ((v7 & 0x80000000) != 0)
      {
        if (!__maskrune(*v4, 0x40000uLL))
        {
LABEL_23:
          objc_msgSend(a2, "appendFormat:", CFSTR("\\%03o"), v7);
          goto LABEL_17;
        }
      }
      else if ((_DefaultRuneLocale.__runetype[v7] & 0x40000) == 0)
      {
        goto LABEL_23;
      }
      objc_msgSend(a2, "appendFormat:", CFSTR("%c"), v7);
LABEL_17:
      ++v4;
    }
    while (v4 < v6);
  }
  return objc_msgSend(a2, "appendString:", CFSTR("\""));
}

NSString *sub_1000CB074(char *a1, int a2, void *a3)
{
  NSMutableString *v3;
  int v6;
  int v7;
  int v8;
  char *v9;
  char *v10;
  char v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  int v22;
  char *v23;

  v3 = 0;
  if (a1 && a3)
  {
    v23 = a1;
    v6 = sub_1000CB254(&v23);
    if (v6 < 1)
    {
      return 0;
    }
    else
    {
      v7 = v6;
      while (1)
      {
        v8 = sub_1000CB254(&v23);
        v9 = v23;
        if (v8 == a2)
          break;
        v10 = v23 + 1;
        while (*v10++)
          ;
        v23 = v10;
        if (v7-- < 2)
          return 0;
      }
      if (*v23)
      {
        v3 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", objc_msgSend(a3, "length"));
        v14 = *v9;
        if (*v9)
        {
          v15 = 0;
          while (1)
          {
            if (v14 < 0)
            {
              -[NSMutableString appendString:](v3, "appendString:", CFSTR("_"));
              v14 = *v9;
            }
            v16 = v14 & 0x1F;
            v17 = v14 & 0x60;
            if (v17 == 32)
              break;
            if (v17 == 64)
            {
              v18 = __toupper((char)objc_msgSend(a3, "characterAtIndex:", v15));
LABEL_21:
              -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("%c"), v18);
              ++v15;
              --v16;
            }
            if (v16 >= 1)
            {
              v19 = v16;
              v20 = v15;
              do
              {
                v21 = objc_msgSend(a3, "characterAtIndex:", v20);
                if (v17 == 96)
                  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("%c"), __toupper((char)v21));
                else
                  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("%C"), v21);
                ++v20;
                --v19;
              }
              while (v19);
            }
            v15 += v16;
            v22 = *++v9;
            v14 = v22;
            if (!v22)
              return (NSString *)v3;
          }
          v18 = __tolower((char)objc_msgSend(a3, "characterAtIndex:", v15));
          goto LABEL_21;
        }
      }
      else
      {
        return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v23 + 1);
      }
    }
  }
  return (NSString *)v3;
}

uint64_t sub_1000CB254(char **a1)
{
  char *v1;
  uint64_t v2;
  unsigned int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v9;
  uint64_t v10;
  int v11;

  v1 = *a1;
  v2 = *(*a1)++;
  if ((v2 & 0x80000000) != 0)
  {
    v3 = v2 & 0x7F;
    v4 = v1[1];
    *a1 = v1 + 2;
    v5 = v4 << 7;
    if ((v4 & 0x80000000) == 0)
      return v5 | v3;
    v3 |= v5 & 0x3F80;
    v6 = v1[2];
    *a1 = v1 + 3;
    v5 = v6 << 14;
    if ((v6 & 0x80000000) == 0)
      return v5 | v3;
    v3 |= v5 & 0x1FC000;
    v7 = v1[3];
    *a1 = v1 + 4;
    v5 = v7 << 21;
    if (v7 < 0)
    {
      v9 = v1[4];
      *a1 = v1 + 5;
      v2 = v5 & 0xFE00000 | (v9 << 28) | v3;
      if (v9 < 0)
      {
        v10 = 0;
        while (1)
        {
          v11 = v1[v10 + 5];
          *a1 = &v1[v10 + 6];
          if ((v11 & 0x80000000) == 0)
            break;
          if ((_DWORD)++v10 == 5)
          {
            +[NSException raise:format:](NSException, "raise:format:", NSParseErrorException, CFSTR("Unable to read varint32"));
            return v2;
          }
        }
      }
    }
    else
    {
      return v5 | v3;
    }
  }
  return v2;
}

void sub_1000CB33C(uint64_t a1, void *a2, unsigned int a3)
{
  sub_1000C93F0(a1, a2, a3, 0);
}

BOOL sub_1000CB344(objc_class *a1, const char *a2)
{
  Method *v3;
  unint64_t i;
  SEL Name;
  _BOOL8 v6;
  unsigned int outCount;

  outCount = 0;
  v3 = class_copyMethodList(a1, &outCount);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      Name = method_getName(v3[i]);
      v6 = Name == a2;
      if (Name == a2)
        break;
    }
  }
  else
  {
    v6 = 0;
  }
  free(v3);
  return v6;
}

id sub_1000CB3C4(void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id result;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  unsigned int v11;
  uint64_t v12;
  id v13;
  unsigned int v14;
  unsigned int v15;
  const __CFString *v16;
  uint64_t v17;
  const char *v18;
  id v19;
  id v20;
  float v21;
  const __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v27;
  id v28;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  v28 = result;
  if (result)
  {
    v27 = *(_QWORD *)v33;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v33 != v27)
          objc_enumerationMutation(a2);
        v30 = v7;
        v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v7);
        result = objc_msgSend(v8, "fieldNumber");
        if (result >= a3)
        {
          v9 = result;
          if (result >= HIDWORD(a3))
            return result;
          v10 = objc_msgSend(a1, "getExtension:", v8);
          v11 = objc_msgSend(v8, "isRepeated");
          if ((v11 & 1) != 0)
          {
            v12 = (uint64_t)objc_msgSend(v10, "count");
            v13 = objc_msgSend(v8, "singletonName");
            if (v12 != 1)
            {
              objc_msgSend(a4, "appendFormat:", CFSTR("%@# [%@]\n"), a5, v13);
              v14 = objc_msgSend(v8, "dataType");
              if (!v12)
                goto LABEL_7;
              v15 = v14;
              v16 = &stru_10010E2C8;
              goto LABEL_16;
            }
          }
          else
          {
            v13 = objc_msgSend(v8, "singletonName");
          }
          v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("  # [%@]"), v13);
          v15 = objc_msgSend(v8, "dataType");
          v12 = 1;
LABEL_16:
          v17 = 0;
          if (v15 - 15 >= 2)
            v18 = ":";
          else
            v18 = "";
          do
          {
            v19 = v10;
            if (v11)
              v19 = objc_msgSend(v10, "objectAtIndex:", v17);
            objc_msgSend(a4, "appendFormat:", CFSTR("%@%u%s "), a5, v9, v18);
            switch(v15)
            {
              case 0u:
                if (objc_msgSend(v19, "BOOLValue"))
                  v22 = CFSTR("true");
                else
                  v22 = CFSTR("false");
                objc_msgSend(a4, "appendString:", v22);
                break;
              case 1u:
              case 0xBu:
                objc_msgSend(a4, "appendFormat:", CFSTR("%u"), objc_msgSend(v19, "unsignedIntValue"), v24);
                break;
              case 2u:
                v20 = objc_msgSend(v19, "unsignedIntValue");
                goto LABEL_34;
              case 3u:
                objc_msgSend(v19, "floatValue");
                objc_msgSend(a4, "appendFormat:", CFSTR("%.*g"), 6, v21);
                break;
              case 4u:
              case 0xCu:
                objc_msgSend(a4, "appendFormat:", CFSTR("%llu"), objc_msgSend(v19, "unsignedLongLongValue"), v24);
                break;
              case 5u:
              case 8u:
              case 0xAu:
                objc_msgSend(a4, "appendFormat:", CFSTR("%lld"), objc_msgSend(v19, "longLongValue"), v24);
                break;
              case 6u:
                objc_msgSend(v19, "doubleValue");
                objc_msgSend(a4, "appendFormat:", CFSTR("%.*lg"), 15, v23);
                break;
              case 7u:
              case 9u:
              case 0x11u:
                v20 = objc_msgSend(v19, "intValue");
LABEL_34:
                objc_msgSend(a4, "appendFormat:", CFSTR("%d"), v20, v24);
                break;
              case 0xDu:
                sub_1000CAED0(v19, a4);
                break;
              case 0xEu:
                sub_1000CB7B8(v19, a4);
                break;
              case 0xFu:
              case 0x10u:
                objc_msgSend(a4, "appendFormat:", CFSTR("{%@\n"), v16);
                sub_1000CA1F4(v19, a4, objc_msgSend(a5, "stringByAppendingString:", CFSTR("  ")));
                objc_msgSend(a4, "appendFormat:", CFSTR("%@}"), a5);
                v16 = &stru_10010E2C8;
                break;
              default:
                break;
            }
            objc_msgSend(a4, "appendFormat:", CFSTR("%@\n"), v16);
            ++v17;
          }
          while (v12 != v17);
        }
LABEL_7:
        v7 = v30 + 1;
      }
      while ((id)(v30 + 1) != v28);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      v28 = result;
    }
    while (result);
  }
  return result;
}

id sub_1000CB7B8(void *a1, void *a2)
{
  char *v4;
  char *v5;
  char *i;
  id v7;
  void *v8;
  const __CFString *v9;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(a2, "appendString:", CFSTR("\""));
  v4 = (char *)objc_msgSend(a1, "length");
  if (v4)
  {
    v5 = v4;
    for (i = 0; v5 != i; ++i)
    {
      v7 = objc_msgSend(a1, "characterAtIndex:", i);
      if ((int)v7 > 33)
      {
        switch((_DWORD)v7)
        {
          case '"':
            v8 = a2;
            v9 = CFSTR("\\\"");
            break;
          case '\'':
            v8 = a2;
            v9 = CFSTR("\\'");
            break;
          case '\\':
            v8 = a2;
            v9 = CFSTR("\\\\");
            break;
          default:
LABEL_19:
            if (v7 > 0x1F)
              objc_msgSend(a2, "appendFormat:", CFSTR("%C"), v7, v11, v12);
            else
              objc_msgSend(a2, "appendFormat:", CFSTR("\\%d%d%d"), 0, v7 >> 3, v7 & 7);
            continue;
        }
      }
      else
      {
        switch((_DWORD)v7)
        {
          case 9:
            v8 = a2;
            v9 = CFSTR("\\t");
            break;
          case 0xA:
            v8 = a2;
            v9 = CFSTR("\\n");
            break;
          case 0xD:
            v8 = a2;
            v9 = CFSTR("\\r");
            break;
          default:
            goto LABEL_19;
        }
      }
      objc_msgSend(v8, "appendString:", v9);
    }
  }
  return objc_msgSend(a2, "appendString:", CFSTR("\""));
}

id sub_1000CB93C(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  uint64_t v7;
  int v8;

  v6 = *(void **)(a1 + 32);
  v7 = 40;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
    v7 = 48;
  objc_msgSend(v6, "appendString:", *(_QWORD *)(a1 + v7));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
  objc_msgSend(*(id *)(a1 + 32), "appendString:", *(_QWORD *)(a1 + 56));
  sub_1000CB7B8(a2, *(void **)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", *(_QWORD *)(a1 + 64));
  v8 = *(unsigned __int8 *)(a1 + 96);
  switch(v8)
  {
    case 13:
      sub_1000CAED0(a3, *(void **)(a1 + 32));
      break;
    case 15:
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("{\n"));
      sub_1000CA1F4(a3, *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 72), "stringByAppendingString:", CFSTR("    ")));
      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@  }"), *(_QWORD *)(a1 + 72));
      break;
    case 14:
      sub_1000CB7B8(a3, *(void **)(a1 + 32));
      break;
  }
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", *(_QWORD *)(a1 + 80));
}

id sub_1000CBA74(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = *(void **)(a1 + 32);
  v7 = 40;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
    v7 = 48;
  objc_msgSend(v6, "appendString:", *(_QWORD *)(a1 + v7));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 0;
  v8 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 104) == 14)
  {
    objc_msgSend(v8, "appendString:", *(_QWORD *)(a1 + 56));
    sub_1000CB7B8(a2, *(void **)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  }
  else
  {
    objc_msgSend(v8, "appendFormat:", CFSTR("%@%@\n"), *(_QWORD *)(a1 + 56), a2);
  }
  objc_msgSend(*(id *)(a1 + 32), "appendString:", *(_QWORD *)(a1 + 64));
  switch(*(_BYTE *)(a1 + 105))
  {
    case 0xD:
      sub_1000CAED0(a3, *(void **)(a1 + 32));
      break;
    case 0xE:
      sub_1000CB7B8(a3, *(void **)(a1 + 32));
      break;
    case 0xF:
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("{\n"));
      sub_1000CA1F4(a3, *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 72), "stringByAppendingString:", CFSTR("    ")));
      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@  }"), *(_QWORD *)(a1 + 72));
      break;
    case 0x11:
      v11 = objc_msgSend(a3, "intValue");
      v12 = objc_msgSend(*(id *)(a1 + 80), "enumDescriptor");
      if (v12)
      {
        v13 = objc_msgSend(v12, "textFormatNameForValue:", v11);
        if (v13)
        {
          v10 = v13;
          v9 = *(void **)(a1 + 32);
          goto LABEL_14;
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%d"), v11);
      break;
    default:
      v9 = *(void **)(a1 + 32);
      v10 = a3;
LABEL_14:
      objc_msgSend(v9, "appendString:", v10);
      break;
  }
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", *(_QWORD *)(a1 + 88));
}

uint64_t sub_1000CC22C(int a1, int a2)
{
  return a2 | (8 * a1);
}

uint64_t sub_1000CC234(char a1)
{
  return a1 & 7;
}

uint64_t sub_1000CC23C(unsigned int a1)
{
  return a1 >> 3;
}

BOOL sub_1000CC244(int a1)
{
  return (~a1 & 6) != 0;
}

uint64_t sub_1000CC254(int a1, char a2)
{
  if ((a2 & 1) != 0)
    return 2;
  else
    return dword_1000DFA68[a1];
}

uint64_t sub_1000CC728(uint64_t a1)
{
  return sub_1000C9A70(a1, objc_msgSend(+[TransparencyGPBApi descriptor](TransparencyGPBApi, "descriptor"), "fieldWithNumber:", 7));
}

uint64_t sub_1000CC760(uint64_t a1, uint64_t a2)
{
  return sub_1000C9A74(a1, objc_msgSend(+[TransparencyGPBApi descriptor](TransparencyGPBApi, "descriptor"), "fieldWithNumber:", 7), a2);
}

uint64_t sub_1000CC820(uint64_t a1)
{
  return sub_1000C9A70(a1, objc_msgSend(+[TransparencyGPBMethod descriptor](TransparencyGPBMethod, "descriptor"), "fieldWithNumber:", 7));
}

uint64_t sub_1000CC858(uint64_t a1, uint64_t a2)
{
  return sub_1000C9A74(a1, objc_msgSend(+[TransparencyGPBMethod descriptor](TransparencyGPBMethod, "descriptor"), "fieldWithNumber:", 7), a2);
}

void sub_1000CC904()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "PCCServerEnvironment");
  static URLRequest._unconditionallyBridgeFromObjectiveC(_:)(v0);
}

id objc_msgSend_HTTPBody(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "HTTPBody");
}

id objc_msgSend_HTTPMethod(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "HTTPMethod");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URL");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_URLsForDirectory_inDomains_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLsForDirectory:inDomains:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDString");
}

id objc_msgSend___verifiedLogHeads(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__verifiedLogHeads");
}

id objc_msgSend__setPrivacyProxyFailClosed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setPrivacyProxyFailClosed:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addExtension_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addExtension:value:");
}

id objc_msgSend_addExtensions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addExtensions:");
}

id objc_msgSend_addField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addField:");
}

id objc_msgSend_addFixed32_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFixed32:");
}

id objc_msgSend_addFixed64_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFixed64:");
}

id objc_msgSend_addGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGroup:");
}

id objc_msgSend_addLengthDelimited_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLengthDelimited:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addRawEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRawEntriesFromDictionary:");
}

id objc_msgSend_addRawValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRawValue:");
}

id objc_msgSend_addRawValues_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRawValues:count:");
}

id objc_msgSend_addRawValuesFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRawValuesFromArray:");
}

id objc_msgSend_addTrustedCertificate_trustedKeys_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTrustedCertificate:trustedKeys:error:");
}

id objc_msgSend_addUnknownMapEntry_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addUnknownMapEntry:value:");
}

id objc_msgSend_addValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addValue:");
}

id objc_msgSend_addValues_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addValues:count:");
}

id objc_msgSend_addValuesFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addValuesFromArray:");
}

id objc_msgSend_addVarint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addVarint:");
}

id objc_msgSend_algorithm(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "algorithm");
}

id objc_msgSend_allHTTPHeaderFields(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allHTTPHeaderFields");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allValues");
}

id objc_msgSend_allocDescriptorForClass_messageName_fileDescription_fields_fieldCount_storageSize_flags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:");
}

id objc_msgSend_allocDescriptorForClass_rootClass_file_fields_fieldCount_storageSize_flags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:");
}

id objc_msgSend_allocDescriptorForName_valueNames_values_count_enumVerifier_flags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocDescriptorForName:valueNames:values:count:enumVerifier:flags:");
}

id objc_msgSend_allocDescriptorForName_valueNames_values_count_enumVerifier_flags_extraTextFormatInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocDescriptorForName:valueNames:values:count:enumVerifier:flags:extraTextFormatInfo:");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allowOldKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowOldKeys");
}

id objc_msgSend_allowsInternalSecurityPolicies(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowsInternalSecurityPolicies");
}

id objc_msgSend_alternateWireType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alternateWireType");
}

id objc_msgSend_appLeafsArray(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appLeafsArray");
}

id objc_msgSend_appLeafsArray_Count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appLeafsArray_Count");
}

id objc_msgSend_appSmtKeyStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appSmtKeyStore");
}

id objc_msgSend_appSthKeyStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appSthKeyStore");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_application(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "application");
}

id objc_msgSend_applicationIdentifierForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationIdentifierForValue:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_atEnvironment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "atEnvironment");
}

id objc_msgSend_autoVacuumSetting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "autoVacuumSetting");
}

id objc_msgSend_automatedDeviceGroup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "automatedDeviceGroup");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_bindNullAtColumn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindNullAtColumn:");
}

id objc_msgSend_blobAtColumn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blobAtColumn:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bytes");
}

id objc_msgSend_calcValueNameOffsets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calcValueNameOffsets");
}

id objc_msgSend_certificateFromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "certificateFromData:error:");
}

id objc_msgSend_changeLogHead(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeLogHead");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_checkBagKeyClass_keys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkBagKeyClass:keys:");
}

id objc_msgSend_checkLastTagWas_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkLastTagWas:");
}

id objc_msgSend_checkMissingBagKeys_keys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkMissingBagKeys:keys:");
}

id objc_msgSend_checkSplitsFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkSplitsFor:");
}

id objc_msgSend_cleanseErrorForXPC_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanseErrorForXPC:");
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "close");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_columnCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "columnCount");
}

id objc_msgSend_columnNameAtColumn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "columnNameAtColumn:");
}

id objc_msgSend_columnTypeAtColumn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "columnTypeAtColumn:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_computeSerializedSizeAsField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "computeSerializedSizeAsField:");
}

id objc_msgSend_config(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "config");
}

id objc_msgSend_configApp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configApp");
}

id objc_msgSend_configBagFileName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configBagFileName");
}

id objc_msgSend_configBagRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configBagRequest");
}

id objc_msgSend_configBagURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configBagURL");
}

id objc_msgSend_configurationExpired(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationExpired");
}

id objc_msgSend_configureFromNetworkBagData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureFromNetworkBagData:error:");
}

id objc_msgSend_configureFromNetworkWithFetcher_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureFromNetworkWithFetcher:completionHandler:");
}

id objc_msgSend_configureWithDisk_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureWithDisk:");
}

id objc_msgSend_configured(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configured");
}

id objc_msgSend_consistencyVerified(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consistencyVerified");
}

id objc_msgSend_containingMessageClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containingMessageClass");
}

id objc_msgSend_containingType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containingType");
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_copyFieldsInto_zone_descriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyFieldsInto:zone:descriptor:");
}

id objc_msgSend_copyManagedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyManagedObject:");
}

id objc_msgSend_copyTrustedKeysFromDataArray_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyTrustedKeysFromDataArray:error:");
}

id objc_msgSend_copyVRFKeyFromConfigProof_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyVRFKeyFromConfigProof:error:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countOfFields(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfFields");
}

id objc_msgSend_createCACertificatesArray_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createCACertificatesArray:error:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createFailureEvent_application_optInServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createFailureEvent:application:optInServer:");
}

id objc_msgSend_createManagedObjectWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createManagedObjectWithError:");
}

id objc_msgSend_createMapHead_application_logBeginTime_logHeadHash_logType_revision_populating_gossip_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createMapHead:application:logBeginTime:logHeadHash:logType:revision:populating:gossip:");
}

id objc_msgSend_createSignedTreeHeadFailure(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createSignedTreeHeadFailure");
}

id objc_msgSend_createTreeHead_isMapHead_application_logBeginTime_logHeadHash_logType_revision_gossip_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createTreeHead:isMapHead:application:logBeginTime:logHeadHash:logType:revision:gossip:");
}

id objc_msgSend_createTrustedSthKeyStoreFromProofSPKI_signingKeysMap_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createTrustedSthKeyStoreFromProofSPKI:signingKeysMap:error:");
}

id objc_msgSend_currentEnvironment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentEnvironment");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "data");
}

id objc_msgSend_dataStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataStore");
}

id objc_msgSend_dataType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataType");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfURL:options:error:");
}

id objc_msgSend_dataWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithData:");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithLength:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSince1970:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_db(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "db");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_deepCopyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deepCopyWithZone:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultNetworkTimeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultNetworkTimeout");
}

id objc_msgSend_defaultValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultValue");
}

id objc_msgSend_deleteFile_inDirectory_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteFile:inDirectory:error:");
}

id objc_msgSend_deleteObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteObject:");
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptor");
}

id objc_msgSend_determineATEnvironmentFromPCCEnvironment_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "determineATEnvironmentFromPCCEnvironment:completion:");
}

id objc_msgSend_devicePlatform(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "devicePlatform");
}

id objc_msgSend_diagnosticsJsonDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "diagnosticsJsonDictionary");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfURL:error:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_directory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "directory");
}

id objc_msgSend_doKTResultWithAnalyticsForEventName_error_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doKTResultWithAnalyticsForEventName:error:block:");
}

id objc_msgSend_doKTResultWithAnalyticsForEventName_validateType_error_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doKTResultWithAnalyticsForEventName:validateType:error:block:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleAtColumn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleAtColumn:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_earliestCurrentTreeVersionWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "earliestCurrentTreeVersionWithError:");
}

id objc_msgSend_earliestNextTreeVersionWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "earliestNextTreeVersionWithError:");
}

id objc_msgSend_emptyAtDepth_leafIndex_treeId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emptyAtDepth:leafIndex:treeId:");
}

id objc_msgSend_endSlh(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endSlh");
}

id objc_msgSend_enumDescriptor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumDescriptor");
}

id objc_msgSend_enumVerifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumVerifier");
}

id objc_msgSend_enumerateColumnsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateColumnsUsingBlock:");
}

id objc_msgSend_enumerateForTextFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateForTextFormat:");
}

id objc_msgSend_enumerateKeysAndBoolsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndBoolsUsingBlock:");
}

id objc_msgSend_enumerateKeysAndDoublesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndDoublesUsingBlock:");
}

id objc_msgSend_enumerateKeysAndFloatsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndFloatsUsingBlock:");
}

id objc_msgSend_enumerateKeysAndInt32sUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndInt32sUsingBlock:");
}

id objc_msgSend_enumerateKeysAndInt64sUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndInt64sUsingBlock:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateKeysAndRawValuesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndRawValuesUsingBlock:");
}

id objc_msgSend_enumerateKeysAndUInt32sUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndUInt32sUsingBlock:");
}

id objc_msgSend_enumerateKeysAndUInt64sUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndUInt64sUsingBlock:");
}

id objc_msgSend_enumerateRawValuesWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateRawValuesWithBlock:");
}

id objc_msgSend_enumerateValuesWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateValuesWithBlock:");
}

id objc_msgSend_errorWithDomain_code_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:description:");
}

id objc_msgSend_errorWithDomain_code_underlyingError_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:underlyingError:description:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_eventId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventId");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_executeSQL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeSQL:");
}

id objc_msgSend_executeSQL_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeSQL:arguments:");
}

id objc_msgSend_expirationTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expirationTime");
}

id objc_msgSend_extensionForDescriptor_fieldNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionForDescriptor:fieldNumber:");
}

id objc_msgSend_extensionRanges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionRanges");
}

id objc_msgSend_extensionRangesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionRangesCount");
}

id objc_msgSend_extensionRegistry(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionRegistry");
}

id objc_msgSend_extensionsCurrentlySet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionsCurrentlySet");
}

id objc_msgSend_fetchConfigBag_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchConfigBag:completionHandler:");
}

id objc_msgSend_fetchTreeHead_isMapHead_application_logBeginTime_logType_revision_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchTreeHead:isMapHead:application:logBeginTime:logType:revision:error:");
}

id objc_msgSend_fetchTreeHeadsWithoutHash_isMapHead_application_logBeginTime_logType_revision_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchTreeHeadsWithoutHash:isMapHead:application:logBeginTime:logType:revision:error:");
}

id objc_msgSend_fieldNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fieldNumber");
}

id objc_msgSend_fieldType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fieldType");
}

id objc_msgSend_fieldWithNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fieldWithNumber:");
}

id objc_msgSend_file(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "file");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fixed32List(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fixed32List");
}

id objc_msgSend_fixed64List(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fixed64List");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "floatValue");
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flush");
}

id objc_msgSend_followUp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "followUp");
}

id objc_msgSend_formatEventName_application_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formatEventName:application:");
}

id objc_msgSend_forwards(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forwards");
}

id objc_msgSend_fullName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fullName");
}

id objc_msgSend_generateDone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateDone");
}

id objc_msgSend_generateError_method_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateError:method:");
}

id objc_msgSend_getAggregateOptInState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAggregateOptInState:");
}

id objc_msgSend_getBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBool:");
}

id objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:");
}

id objc_msgSend_getConfigBagEnvironment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getConfigBagEnvironment");
}

id objc_msgSend_getEnumTextFormatNameForIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getEnumTextFormatNameForIndex:");
}

id objc_msgSend_getEnvironment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getEnvironment");
}

id objc_msgSend_getExistingExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getExistingExtension:");
}

id objc_msgSend_getExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getExtension:");
}

id objc_msgSend_getOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getOverride:");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_getSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSettings");
}

id objc_msgSend_getUnsigned_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getUnsigned:");
}

id objc_msgSend_gossip(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gossip");
}

id objc_msgSend_groupList(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupList");
}

id objc_msgSend_hasChangeLogHead(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasChangeLogHead");
}

id objc_msgSend_hasEndSlh(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasEndSlh");
}

id objc_msgSend_hasInternalDiagnostics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasInternalDiagnostics");
}

id objc_msgSend_hasObjectMapHead(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasObjectMapHead");
}

id objc_msgSend_hasPamHeadInPatProof(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPamHeadInPatProof");
}

id objc_msgSend_hasPatClosedProof(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPatClosedProof");
}

id objc_msgSend_hasPatConfigProof(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPatConfigProof");
}

id objc_msgSend_hasPatHead(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPatHead");
}

id objc_msgSend_hasPerApplicationTreeEntry(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPerApplicationTreeEntry");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSignature(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSignature");
}

id objc_msgSend_hasSlh(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSlh");
}

id objc_msgSend_hasSmh(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSmh");
}

id objc_msgSend_hasStartSlh(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasStartSlh");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hasTltConfigProof(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasTltConfigProof");
}

id objc_msgSend_hasTopLevelTreeEntry(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasTopLevelTreeEntry");
}

id objc_msgSend_hasUnknownSPKIHashError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasUnknownSPKIHashError:");
}

id objc_msgSend_hasVrfPublicKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasVrfPublicKey");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hash");
}

id objc_msgSend_hashesOfPeersInPathToRootArray(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hashesOfPeersInPathToRootArray");
}

id objc_msgSend_hashesOfPeersInPathToRootArray_Count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hashesOfPeersInPathToRootArray_Count");
}

id objc_msgSend_httpMethod(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "httpMethod");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "init");
}

id objc_msgSend_initGETWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initGETWithURL:");
}

id objc_msgSend_initPOSTWithURL_data_uuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initPOSTWithURL:data:uuid:");
}

id objc_msgSend_initPUSHWithURL_data_uuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initPUSHWithURL:data:uuid:");
}

id objc_msgSend_initWithBools_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBools:forKeys:count:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:encoding:");
}

id objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithClass_messageName_fileDescription_fields_storageSize_wireFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClass:messageName:fileDescription:fields:storageSize:wireFormat:");
}

id objc_msgSend_initWithCodedInputStream_extensionRegistry_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCodedInputStream:extensionRegistry:error:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithData_extensionRegistry_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:extensionRegistry:error:");
}

id objc_msgSend_initWithDoubles_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDoubles:forKeys:count:");
}

id objc_msgSend_initWithFieldDescription_descriptorFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFieldDescription:descriptorFlags:");
}

id objc_msgSend_initWithFloats_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFloats:forKeys:count:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithInt32s_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInt32s:forKeys:count:");
}

id objc_msgSend_initWithInt64s_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInt64s:forKeys:count:");
}

id objc_msgSend_initWithKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:");
}

id objc_msgSend_initWithKeyBag_application_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKeyBag:application:");
}

id objc_msgSend_initWithKeyData_tltLeafs_intermediates_patConfigProof_tltConfigProof_patClosedProof_pamHeadInPatProof_application_allowOldKeys_settings_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKeyData:tltLeafs:intermediates:patConfigProof:tltConfigProof:patClosedProof:pamHeadInPatProof:application:allowOldKeys:settings:error:");
}

id objc_msgSend_initWithMessage_typeURLPrefix_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMessage:typeURLPrefix:error:");
}

id objc_msgSend_initWithName_fields_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:fields:");
}

id objc_msgSend_initWithName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:value:");
}

id objc_msgSend_initWithNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNumber:");
}

id objc_msgSend_initWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:count:");
}

id objc_msgSend_initWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:forKeys:count:");
}

id objc_msgSend_initWithOutputStream_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOutputStream:");
}

id objc_msgSend_initWithOutputStream_data_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOutputStream:data:");
}

id objc_msgSend_initWithPackage_objcPrefix_syntax_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPackage:objcPrefix:syntax:");
}

id objc_msgSend_initWithPackage_syntax_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPackage:syntax:");
}

id objc_msgSend_initWithStatement_db_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStatement:db:error:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithTransparencySettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTransparencySettings:");
}

id objc_msgSend_initWithTrustedKeyStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTrustedKeyStore:");
}

id objc_msgSend_initWithTrustedKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTrustedKeys:");
}

id objc_msgSend_initWithUInt32s_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUInt32s:forKeys:count:");
}

id objc_msgSend_initWithUInt64s_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUInt64s:forKeys:count:");
}

id objc_msgSend_initWithURL_data_timeout_httpMethod_uuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:data:timeout:httpMethod:uuid:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithValidationFunction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValidationFunction:");
}

id objc_msgSend_initWithValidationFunction_capacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValidationFunction:capacity:");
}

id objc_msgSend_initWithValidationFunction_rawValues_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValidationFunction:rawValues:count:");
}

id objc_msgSend_initWithValidationFunction_rawValues_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValidationFunction:rawValues:forKeys:count:");
}

id objc_msgSend_initWithValueArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValueArray:");
}

id objc_msgSend_initWithValues_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValues:count:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_int64AtColumn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "int64AtColumn:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interiorNodeForLeftData_rightData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interiorNodeForLeftData:rightData:");
}

id objc_msgSend_intermediatesArray(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intermediatesArray");
}

id objc_msgSend_internalClear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "internalClear:");
}

id objc_msgSend_internalResizeToCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "internalResizeToCapacity:");
}

id objc_msgSend_isClosed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isClosed");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFieldTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFieldTag:");
}

id objc_msgSend_isInitialized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInitialized");
}

id objc_msgSend_isPackable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPackable");
}

id objc_msgSend_isRepeated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRepeated");
}

id objc_msgSend_isRequired(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRequired");
}

id objc_msgSend_isSubclassOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubclassOfClass:");
}

id objc_msgSend_isValidEnumValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidEnumValue:");
}

id objc_msgSend_isWireFormat(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isWireFormat");
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "key");
}

id objc_msgSend_keyBag(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyBag");
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyEnumerator");
}

id objc_msgSend_kt_currentTimeMs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kt_currentTimeMs");
}

id objc_msgSend_kt_dataWithUint64_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kt_dataWithUint64:length:");
}

id objc_msgSend_kt_hexString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kt_hexString");
}

id objc_msgSend_kt_sha256(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kt_sha256");
}

id objc_msgSend_kt_toISO_8601_UTCString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kt_toISO_8601_UTCString");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastObject");
}

id objc_msgSend_leafHash_index_treeId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leafHash:index:treeId:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_lengthDelimitedList(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lengthDelimitedList");
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lengthOfBytesUsingEncoding:");
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "log");
}

id objc_msgSend_logBeginningMs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logBeginningMs");
}

id objc_msgSend_logHead(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logHead");
}

id objc_msgSend_logHeadHash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logHeadHash");
}

id objc_msgSend_logMetric_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logMetric:withName:");
}

id objc_msgSend_logResultForEvent_hardFailure_result_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logResultForEvent:hardFailure:result:");
}

id objc_msgSend_logResultForEvent_hardFailure_result_withAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logResultForEvent:hardFailure:result:withAttributes:");
}

id objc_msgSend_logSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logSize");
}

id objc_msgSend_logType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logType");
}

id objc_msgSend_logger(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logger");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_mapHead(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapHead");
}

id objc_msgSend_mapHeadHash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapHeadHash");
}

id objc_msgSend_mapKeyDataType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapKeyDataType");
}

id objc_msgSend_mapLeaf(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapLeaf");
}

id objc_msgSend_mapType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapType");
}

id objc_msgSend_mergeDelimitedFromCodedInputStream_extensionRegistry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeDelimitedFromCodedInputStream:extensionRegistry:");
}

id objc_msgSend_mergeFieldFrom_input_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeFieldFrom:input:");
}

id objc_msgSend_mergeFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeFrom:");
}

id objc_msgSend_mergeFromCodedInputStream_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeFromCodedInputStream:");
}

id objc_msgSend_mergeFromCodedInputStream_extensionRegistry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeFromCodedInputStream:extensionRegistry:");
}

id objc_msgSend_mergeFromData_extensionRegistry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeFromData:extensionRegistry:");
}

id objc_msgSend_mergeUnknownFields_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeUnknownFields:");
}

id objc_msgSend_mergeVarintField_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeVarintField:value:");
}

id objc_msgSend_messageClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageClass");
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadata");
}

id objc_msgSend_msgClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "msgClass");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableBytes");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_mutableCopyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopyWithZone:");
}

id objc_msgSend_mutableFieldForNumber_create_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableFieldForNumber:create:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_nanos(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nanos");
}

id objc_msgSend_needReset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needReset");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextObject");
}

id objc_msgSend_nodeBytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nodeBytes");
}

id objc_msgSend_nodePosition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nodePosition");
}

id objc_msgSend_nodeType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nodeType");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "null");
}

id objc_msgSend_number(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "number");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objcPrefix(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objcPrefix");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "object");
}

id objc_msgSend_objectAtColumn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtColumn:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectMapHead(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectMapHead");
}

id objc_msgSend_oldAppRootCertsArray(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oldAppRootCertsArray");
}

id objc_msgSend_oldAppRootCertsArray_Count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oldAppRootCertsArray_Count");
}

id objc_msgSend_oldTltRootCertsArray(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oldTltRootCertsArray");
}

id objc_msgSend_oldTltRootCertsArray_Count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oldTltRootCertsArray_Count");
}

id objc_msgSend_onMocSetMapHead_inclusionResult_inclusionError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onMocSetMapHead:inclusionResult:inclusionError:");
}

id objc_msgSend_onMocSetMapHead_mmdResult_mmdError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onMocSetMapHead:mmdResult:mmdError:");
}

id objc_msgSend_onMocSetMapHead_signatureResult_signatureError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onMocSetMapHead:signatureResult:signatureError:");
}

id objc_msgSend_oneofs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oneofs");
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "open");
}

id objc_msgSend_optInServer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optInServer");
}

id objc_msgSend_overrideBeginTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overrideBeginTime");
}

id objc_msgSend_packWithMessage_typeURLPrefix_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "packWithMessage:typeURLPrefix:error:");
}

id objc_msgSend_package(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "package");
}

id objc_msgSend_pamHeadInPatProof(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pamHeadInPatProof");
}

id objc_msgSend_parseFromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseFromData:error:");
}

id objc_msgSend_parseMessageSet_extensionRegistry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseMessageSet:extensionRegistry:");
}

id objc_msgSend_parseUnknownField_extensionRegistry_tag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseUnknownField:extensionRegistry:tag:");
}

id objc_msgSend_parsedLogHead(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parsedLogHead");
}

id objc_msgSend_parsedMapHead(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parsedMapHead");
}

id objc_msgSend_patClosedProof(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "patClosedProof");
}

id objc_msgSend_patConfigProof(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "patConfigProof");
}

id objc_msgSend_patEarliestVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "patEarliestVersion");
}

id objc_msgSend_patHead(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "patHead");
}

id objc_msgSend_patLogBeginningMs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "patLogBeginningMs");
}

id objc_msgSend_patSigningKeyWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "patSigningKeyWithError:");
}

id objc_msgSend_pccEnvironment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pccEnvironment");
}

id objc_msgSend_peerIndexAtDepth_leafIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peerIndexAtDepth:leafIndex:");
}

id objc_msgSend_perApplicationTreeEntry(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "perApplicationTreeEntry");
}

id objc_msgSend_performBlockAndWait_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlockAndWait:");
}

id objc_msgSend_persistWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistWithError:");
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pointerValue");
}

id objc_msgSend_populating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populating");
}

id objc_msgSend_postFollowup_type_eventId_errorCode_optInState_infoLink_additionalInfo_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postFollowup:type:eventId:errorCode:optInState:infoLink:additionalInfo:error:");
}

id objc_msgSend_processConfigBagData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processConfigBagData:error:");
}

id objc_msgSend_processPamHeadInPatProof_tltEntry_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processPamHeadInPatProof:tltEntry:error:");
}

id objc_msgSend_processPatClosedProof_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processPatClosedProof:error:");
}

id objc_msgSend_processPatConfigProof_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processPatConfigProof:error:");
}

id objc_msgSend_processTltConfigProof_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processTltConfigProof:error:");
}

id objc_msgSend_proofHashesArray(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proofHashesArray");
}

id objc_msgSend_proofHashesArray_Count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proofHashesArray_Count");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_publicKeyBytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publicKeyBytes");
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_rawValueAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rawValueAtIndex:");
}

id objc_msgSend_readConfigFromDisk_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readConfigFromDisk:");
}

id objc_msgSend_readDictionaryFromFile_inDirectory_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readDictionaryFromFile:inDirectory:error:");
}

id objc_msgSend_readGroup_message_extensionRegistry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readGroup:message:extensionRegistry:");
}

id objc_msgSend_readMapEntry_extensionRegistry_field_parentMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readMapEntry:extensionRegistry:field:parentMessage:");
}

id objc_msgSend_readMessage_extensionRegistry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readMessage:extensionRegistry:");
}

id objc_msgSend_readPCCPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readPCCPreferences:");
}

id objc_msgSend_readUnknownGroup_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readUnknownGroup:message:");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reason");
}

id objc_msgSend_receiptTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiptTime");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeLastObject");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_replaceBytesInRange_withBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceBytesInRange:withBytes:");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_reportCoreDataPersistEventForLocation_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportCoreDataPersistEventForLocation:underlyingError:");
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithURL:");
}

id objc_msgSend_requestWithURL_cachePolicy_timeoutInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithURL:cachePolicy:timeoutInterval:");
}

id objc_msgSend_requiredKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requiredKeys");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reset");
}

id objc_msgSend_resetBytesInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetBytesInRange:");
}

id objc_msgSend_revision(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "revision");
}

id objc_msgSend_saltMessage_salt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saltMessage:salt:");
}

id objc_msgSend_secKeyAlgorithmForProtoAlgorithm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secKeyAlgorithmForProtoAlgorithm:");
}

id objc_msgSend_seconds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "seconds");
}

id objc_msgSend_selectedEnvironmentNameWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedEnvironmentNameWithCompletionHandler:");
}

id objc_msgSend_serializedDataForUnknownValue_forKey_keyDataType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serializedDataForUnknownValue:forKey:keyDataType:");
}

id objc_msgSend_serializedSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serializedSize");
}

id objc_msgSend_serializedSizeAsMessageSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serializedSizeAsMessageSet");
}

id objc_msgSend_serializedSizeAsMessageSetExtension(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serializedSizeAsMessageSetExtension");
}

id objc_msgSend_setAdditionalHeaders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdditionalHeaders:");
}

id objc_msgSend_setAllowOldKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowOldKeys:");
}

id objc_msgSend_setAppSmtKeyStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppSmtKeyStore:");
}

id objc_msgSend_setAppSthKeyStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppSthKeyStore:");
}

id objc_msgSend_setApplication_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApplication:");
}

id objc_msgSend_setAtEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAtEnvironment:");
}

id objc_msgSend_setAuthenticated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthenticated:");
}

id objc_msgSend_setConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfig:");
}

id objc_msgSend_setConfigApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigApp:");
}

id objc_msgSend_setConfigured_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigured:");
}

id objc_msgSend_setCurrentEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentEnvironment:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDataStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataStore:");
}

id objc_msgSend_setDb_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDb:");
}

id objc_msgSend_setDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDirectory:");
}

id objc_msgSend_setErrorCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorCode:");
}

id objc_msgSend_setErrorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorDomain:");
}

id objc_msgSend_setExpirationTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpirationTime:");
}

id objc_msgSend_setExtension_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExtension:value:");
}

id objc_msgSend_setFailureEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFailureEvent:");
}

id objc_msgSend_setGossip_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGossip:");
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPBody:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHost:");
}

id objc_msgSend_setHttpMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHttpMethod:");
}

id objc_msgSend_setInclusionResult_mapHead_failure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInclusionResult:mapHead:failure:");
}

id objc_msgSend_setInclusionResult_signedLogHead_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInclusionResult:signedLogHead:error:");
}

id objc_msgSend_setKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKey:");
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLength:");
}

id objc_msgSend_setLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLog:");
}

id objc_msgSend_setMMDVerifiedForMapHead_mmdError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMMDVerifiedForMapHead:mmdError:");
}

id objc_msgSend_setMapStillPopulating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMapStillPopulating:");
}

id objc_msgSend_setMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadata:");
}

id objc_msgSend_setMetadataValue_key_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataValue:key:");
}

id objc_msgSend_setNanos_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNanos:");
}

id objc_msgSend_setNeedReset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedReset:");
}

id objc_msgSend_setNeedsRefresh_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsRefresh:");
}

id objc_msgSend_setObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOverrideBeginTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverrideBeginTime:");
}

id objc_msgSend_setOverrideBeginTimeFromLogEntry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverrideBeginTimeFromLogEntry:");
}

id objc_msgSend_setOverrideReversePushConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverrideReversePushConfig:");
}

id objc_msgSend_setOverrideReversePushPercentage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverrideReversePushPercentage:");
}

id objc_msgSend_setPatClosedProof_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPatClosedProof:");
}

id objc_msgSend_setPatConfigProof_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPatConfigProof:");
}

id objc_msgSend_setPatEarliestVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPatEarliestVersion:");
}

id objc_msgSend_setPatLogBeginningMs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPatLogBeginningMs:");
}

id objc_msgSend_setPccEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPccEnvironment:");
}

id objc_msgSend_setProtectionToClassDForURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProtectionToClassDForURL:error:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setReceiptTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReceiptTime:");
}

id objc_msgSend_setRequiredKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiredKeys:");
}

id objc_msgSend_setResult_treeHead_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResult:treeHead:error:");
}

id objc_msgSend_setSeconds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeconds:");
}

id objc_msgSend_setSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSettings:");
}

id objc_msgSend_setShutDown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShutDown:");
}

id objc_msgSend_setSignature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignature:");
}

id objc_msgSend_setSignatureVerifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignatureVerifier:");
}

id objc_msgSend_setSignedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignedObject:");
}

id objc_msgSend_setSth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSth:");
}

id objc_msgSend_setSwtSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwtSettings:");
}

id objc_msgSend_setTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeout:");
}

id objc_msgSend_setTimeoutInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutInterval:");
}

id objc_msgSend_setTltConfigProof_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTltConfigProof:");
}

id objc_msgSend_setTltEarliestVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTltEarliestVersion:");
}

id objc_msgSend_setTltKeyStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTltKeyStore:");
}

id objc_msgSend_setTltLogBeginningMs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTltLogBeginningMs:");
}

id objc_msgSend_setTransparencyGPBGenericValue_forTransparencyGPBGenericValueKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransparencyGPBGenericValue:forTransparencyGPBGenericValueKey:");
}

id objc_msgSend_setTransparencySettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransparencySettings:");
}

id objc_msgSend_setTreeRollInfoURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTreeRollInfoURL:");
}

id objc_msgSend_setTrustedAppSigningKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrustedAppSigningKeys:");
}

id objc_msgSend_setTrustedKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrustedKeys:");
}

id objc_msgSend_setTrustedTltSigningKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrustedTltSigningKeys:");
}

id objc_msgSend_setTypeURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTypeURL:");
}

id objc_msgSend_setUnknownFields_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnknownFields:");
}

id objc_msgSend_setUnsigned_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnsigned:value:");
}

id objc_msgSend_setUnsupported_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnsupported:");
}

id objc_msgSend_setUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUrl:");
}

id objc_msgSend_setUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUuid:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_setVerificationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVerificationType:");
}

id objc_msgSend_setVerifiedSignedMapHead_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVerifiedSignedMapHead:");
}

id objc_msgSend_setVerifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVerifier:");
}

id objc_msgSend_setVrfKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVrfKey:");
}

id objc_msgSend_setVrfType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVrfType:");
}

id objc_msgSend_set__verifiedLogHeads_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set__verifiedLogHeads:");
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settings");
}

id objc_msgSend_setupContainingMessageClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupContainingMessageClass:");
}

id objc_msgSend_setupExtraTextInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupExtraTextInfo:");
}

id objc_msgSend_setupOneofs_count_firstHasIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupOneofs:count:firstHasIndex:");
}

id objc_msgSend_shutDown(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shutDown");
}

id objc_msgSend_shutdownTimeStamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shutdownTimeStamp:");
}

id objc_msgSend_signature(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signature");
}

id objc_msgSend_signatureDiagnosticsJsonDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signatureDiagnosticsJsonDictionary");
}

id objc_msgSend_signatureVerifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signatureVerifier");
}

id objc_msgSend_signedObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signedObject");
}

id objc_msgSend_signedTypeWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signedTypeWithObject:");
}

id objc_msgSend_signedTypeWithObject_verifier_dataStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signedTypeWithObject:verifier:dataStore:");
}

id objc_msgSend_signingKeySpkihash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signingKeySpkihash");
}

id objc_msgSend_singletonName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "singletonName");
}

id objc_msgSend_singletonNameC(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "singletonNameC");
}

id objc_msgSend_skipField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "skipField:");
}

id objc_msgSend_skipMessage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "skipMessage");
}

id objc_msgSend_slh(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "slh");
}

id objc_msgSend_smh(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "smh");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_sortedFields(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedFields");
}

id objc_msgSend_startRevision(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startRevision");
}

id objc_msgSend_startSlh(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startSlh");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "status");
}

id objc_msgSend_sth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sth");
}

id objc_msgSend_stmt(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stmt");
}

id objc_msgSend_storeSMHSignatureResult_smh_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeSMHSignatureResult:smh:error:");
}

id objc_msgSend_storeSignatureResult_signatureError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeSignatureResult:signatureError:");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_superclass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "superclass");
}

id objc_msgSend_swtSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "swtSettings");
}

id objc_msgSend_syntax(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syntax");
}

id objc_msgSend_textAtColumn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textAtColumn:");
}

id objc_msgSend_textFormatName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textFormatName");
}

id objc_msgSend_textFormatNameForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textFormatNameForValue:");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_timestampMs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timestampMs");
}

id objc_msgSend_tltConfigProof(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tltConfigProof");
}

id objc_msgSend_tltEarliestVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tltEarliestVersion");
}

id objc_msgSend_tltKeyStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tltKeyStore");
}

id objc_msgSend_tltLeafsArray(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tltLeafsArray");
}

id objc_msgSend_tltLeafsArray_Count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tltLeafsArray_Count");
}

id objc_msgSend_tltLogBeginningMs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tltLogBeginningMs");
}

id objc_msgSend_topLevelTreeEntry(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topLevelTreeEntry");
}

id objc_msgSend_transparencyFilesPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transparencyFilesPath:");
}

id objc_msgSend_transparencySettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transparencySettings");
}

id objc_msgSend_transparencyVersionStr(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transparencyVersionStr");
}

id objc_msgSend_treeId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "treeId");
}

id objc_msgSend_treeRollInfoURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "treeRollInfoURL");
}

id objc_msgSend_triggerConfigBagFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerConfigBagFetch:");
}

id objc_msgSend_trustedAppLeafs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trustedAppLeafs");
}

id objc_msgSend_trustedAppSigningKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trustedAppSigningKeys");
}

id objc_msgSend_trustedIntermediates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trustedIntermediates");
}

id objc_msgSend_trustedKeyStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trustedKeyStore");
}

id objc_msgSend_trustedKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trustedKeys");
}

id objc_msgSend_trustedTltLeafs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trustedTltLeafs");
}

id objc_msgSend_trustedTltSigningKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trustedTltSigningKeys");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "type");
}

id objc_msgSend_typeURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "typeURL");
}

id objc_msgSend_uiBlockingNetworkTimeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uiBlockingNetworkTimeout");
}

id objc_msgSend_uintegerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uintegerForKey:");
}

id objc_msgSend_unknownFields(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unknownFields");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uuid");
}

id objc_msgSend_validateConfigBagCertificates_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateConfigBagCertificates:error:");
}

id objc_msgSend_validateConfigBagEntries_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateConfigBagEntries:error:");
}

id objc_msgSend_validateConfigBagSignature_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateConfigBagSignature:error:");
}

id objc_msgSend_validateConfigEntries_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateConfigEntries:error:");
}

id objc_msgSend_validationFunc(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validationFunc");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "value");
}

id objc_msgSend_valueAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueAtIndex:");
}

id objc_msgSend_valueForHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForHTTPHeaderField:");
}

id objc_msgSend_valueWithPointer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithPointer:");
}

id objc_msgSend_varintList(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "varintList");
}

id objc_msgSend_verifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifier");
}

id objc_msgSend_verifierOfType_key_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifierOfType:key:");
}

id objc_msgSend_verifyCertificates_intermediates_application_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyCertificates:intermediates:application:error:");
}

id objc_msgSend_verifyCertificates_intermediates_policy_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyCertificates:intermediates:policy:error:");
}

id objc_msgSend_verifyConfigProof_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyConfigProof:");
}

id objc_msgSend_verifyConfigProof_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyConfigProof:error:");
}

id objc_msgSend_verifyConsistencyProof_startHash_startSize_endHash_endSize_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyConsistencyProof:startHash:startSize:endHash:endSize:error:");
}

id objc_msgSend_verifyConsistencyProof_startLogHead_endLogHead_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyConsistencyProof:startLogHead:endLogHead:error:");
}

id objc_msgSend_verifyInclusionOfLogLeaf_position_treeSize_treeHead_hashPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyInclusionOfLogLeaf:position:treeSize:treeHead:hashPath:error:");
}

id objc_msgSend_verifyInclusionOfMapLeaf_position_treeHead_treeId_hashPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyInclusionOfMapLeaf:position:treeHead:treeId:hashPath:error:");
}

id objc_msgSend_verifyLeaf_intermediates_policy_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyLeaf:intermediates:policy:error:");
}

id objc_msgSend_verifyLogEntryWithLogLeaf_position_hashesToRoot_signedLogHead_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyLogEntryWithLogLeaf:position:hashesToRoot:signedLogHead:error:");
}

id objc_msgSend_verifyMapEntryWithMapLeaf_hashesToRoot_signedMapHead_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyMapEntryWithMapLeaf:hashesToRoot:signedMapHead:error:");
}

id objc_msgSend_verifyMessage_salt_output_proof_key_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyMessage:salt:output:proof:key:error:");
}

id objc_msgSend_verifyMessage_signature_spkiHash_algorithm_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyMessage:signature:spkiHash:algorithm:error:");
}

id objc_msgSend_verifyMessage_signature_spkiHash_trustedKeys_algorithm_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyMessage:signature:spkiHash:trustedKeys:algorithm:error:");
}

id objc_msgSend_verifyPatInclusionProofWithPerAppLogEntry_topLevelTreeEntry_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyPatInclusionProofWithPerAppLogEntry:topLevelTreeEntry:error:");
}

id objc_msgSend_verifyPerApplicationTreeEntry_mapHead_topLevelTreeEntry_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyPerApplicationTreeEntry:mapHead:topLevelTreeEntry:error:");
}

id objc_msgSend_verifyTLTEntryForPerApplicationLogHead_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyTLTEntryForPerApplicationLogHead:error:");
}

id objc_msgSend_verifyWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyWithError:");
}

id objc_msgSend_vrfKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vrfKey");
}

id objc_msgSend_vrfPublicKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vrfPublicKey");
}

id objc_msgSend_vrfPublicKeyWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vrfPublicKeyWithError:");
}

id objc_msgSend_vrfType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vrfType");
}

id objc_msgSend_wireType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wireType");
}

id objc_msgSend_write_maxLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "write:maxLength:");
}

id objc_msgSend_writeBool_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeBool:value:");
}

id objc_msgSend_writeBoolNoTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeBoolNoTag:");
}

id objc_msgSend_writeBytes_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeBytes:value:");
}

id objc_msgSend_writeBytesArray_values_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeBytesArray:values:");
}

id objc_msgSend_writeBytesNoTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeBytesNoTag:");
}

id objc_msgSend_writeConfigToDisk_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeConfigToDisk:error:");
}

id objc_msgSend_writeDelimitedToCodedOutputStream_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeDelimitedToCodedOutputStream:");
}

id objc_msgSend_writeDictionaryToFile_fileName_inDirectory_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeDictionaryToFile:fileName:inDirectory:error:");
}

id objc_msgSend_writeDouble_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeDouble:value:");
}

id objc_msgSend_writeDoubleNoTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeDoubleNoTag:");
}

id objc_msgSend_writeEnum_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeEnum:value:");
}

id objc_msgSend_writeEnumNoTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeEnumNoTag:");
}

id objc_msgSend_writeExtensionsToCodedOutputStream_range_sortedExtensions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeExtensionsToCodedOutputStream:range:sortedExtensions:");
}

id objc_msgSend_writeField_toCodedOutputStream_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeField:toCodedOutputStream:");
}

id objc_msgSend_writeFixed32_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeFixed32:value:");
}

id objc_msgSend_writeFixed32Array_values_tag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeFixed32Array:values:tag:");
}

id objc_msgSend_writeFixed32NoTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeFixed32NoTag:");
}

id objc_msgSend_writeFixed64_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeFixed64:value:");
}

id objc_msgSend_writeFixed64Array_values_tag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeFixed64Array:values:tag:");
}

id objc_msgSend_writeFixed64NoTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeFixed64NoTag:");
}

id objc_msgSend_writeFloat_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeFloat:value:");
}

id objc_msgSend_writeFloatNoTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeFloatNoTag:");
}

id objc_msgSend_writeGroup_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeGroup:value:");
}

id objc_msgSend_writeGroupNoTag_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeGroupNoTag:value:");
}

id objc_msgSend_writeInt32NoTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeInt32NoTag:");
}

id objc_msgSend_writeInt64NoTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeInt64NoTag:");
}

id objc_msgSend_writeMessage_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeMessage:value:");
}

id objc_msgSend_writeMessageNoTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeMessageNoTag:");
}

id objc_msgSend_writeRawMessageSetExtension_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeRawMessageSetExtension:value:");
}

id objc_msgSend_writeRawVarintSizeTAs32_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeRawVarintSizeTAs32:");
}

id objc_msgSend_writeSFixed32NoTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeSFixed32NoTag:");
}

id objc_msgSend_writeSFixed64NoTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeSFixed64NoTag:");
}

id objc_msgSend_writeSInt32NoTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeSInt32NoTag:");
}

id objc_msgSend_writeSInt64NoTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeSInt64NoTag:");
}

id objc_msgSend_writeString_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeString:value:");
}

id objc_msgSend_writeStringNoTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeStringNoTag:");
}

id objc_msgSend_writeTag_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeTag:format:");
}

id objc_msgSend_writeToCodedOutputStream_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToCodedOutputStream:");
}

id objc_msgSend_writeToOutput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToOutput:");
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:error:");
}

id objc_msgSend_writeUInt32_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeUInt32:value:");
}

id objc_msgSend_writeUInt32NoTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeUInt32NoTag:");
}

id objc_msgSend_writeUInt64_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeUInt64:value:");
}

id objc_msgSend_writeUInt64Array_values_tag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeUInt64Array:values:tag:");
}

id objc_msgSend_writeUInt64NoTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeUInt64NoTag:");
}

id objc_msgSend_writeUnknownGroup_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeUnknownGroup:value:");
}
